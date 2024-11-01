import 'package:blog_app/core/constants/sizes.dart';
import 'package:blog_app/core/constants/styles.dart';
import 'package:blog_app/core/helpers/helper_functions.dart';
import 'package:blog_app/features/article/data/models/category.dart';
import 'package:blog_app/features/article/logic/category_cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCategoryDropDownMenu extends StatefulWidget {
  const CustomCategoryDropDownMenu({super.key, required this.onSelected});
  final ValueChanged<CategoryModel?> onSelected;

  @override
  State<CustomCategoryDropDownMenu> createState() =>
      _CustomCategoryDropDownMenuState();
}

class _CustomCategoryDropDownMenuState
    extends State<CustomCategoryDropDownMenu> {
  CategoryModel? value;
  @override
  void initState() {
    super.initState();
    CategoryCubit.get(context).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<CategoryModel?>(
      builder: (formState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return DropdownMenu<CategoryModel>(
                expandedInsets: EdgeInsets.zero,
                initialSelection: value,
                hintText: "Category",
                dropdownMenuEntries: state is CategorySuccess
                    ? List.generate(
                        state.categories.length,
                        (i) => DropdownMenuEntry(
                          value: state.categories[i],
                          label: CustomHelperFunctions.trans(
                            enText: state.categories[i].nameEn,
                            arText: state.categories[i].nameAr,
                          ),
                        ),
                      )
                    : [],
                onSelected: (val) {
                  setState(() {
                    value = val!;
                    widget.onSelected(val);
                    formState.didChange(val);
                  });
                },
              );
            },
          ),
          if (formState.hasError)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0).copyWith(
                top: CustomSizes.sm,
              ),
              child: Text(
                formState.errorText!,
                style: TextStyles.regular12.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.error,
                ),
              ),
            ),
        ],
      ),
      validator: (val) {
        if (val == null) {
          return 'Please select a category';
        }
        return null;
      },
    );
  }
}
