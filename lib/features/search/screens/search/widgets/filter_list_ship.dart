import 'package:blog_app/core/constants/app_colors.dart';
import 'package:blog_app/core/helpers/helper_functions.dart';
import 'package:blog_app/features/article/data/models/category.dart';
import 'package:flutter/material.dart';

class CustomFilterChipList extends StatefulWidget {
  const CustomFilterChipList({
    super.key,
    required this.categories,
    required this.onSelectionChanged,
  });
  final List<CategoryModel> categories;
  final Function(CategoryModel?) onSelectionChanged;

  @override
  State<CustomFilterChipList> createState() => _CustomFilterChipListState();
}

class _CustomFilterChipListState extends State<CustomFilterChipList> {
  CategoryModel? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      children: widget.categories.map((category) {
        final isSelected = selectedItem?.id == category.id ;
        return FilterChip(
          label: Text(CustomHelperFunctions.trans(enText: category.nameEn, arText: category.nameAr)),
          selected: isSelected,
          selectedColor: AppColors.primary,
          labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
          checkmarkColor: Colors.white,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                selectedItem = category;
              }
              if(!selected){
                selectedItem = null;
              }
            });
            widget.onSelectionChanged(selectedItem);
          },
        );
      }).toList(),
    );
  }
}