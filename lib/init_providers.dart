import 'package:blog_app/features/article/logic/article_cubit/article_cubit.dart';
import 'package:blog_app/features/article/logic/category_cubit/category_cubit.dart';
import 'package:blog_app/features/article/logic/comment_cubit/comment_cubit.dart';
import 'package:blog_app/features/article/logic/reaction_cubit/reaction_cubit.dart';
import 'package:blog_app/features/auth/logic/auth_cubit.dart';
import 'package:blog_app/features/forget_password/logic/forget_password_cubit.dart';
import 'package:blog_app/features/home/logic/cubit/home_cubit.dart';
import 'package:blog_app/features/layout/logic/cubit/app_layout_cubit.dart';
import 'package:blog_app/localization/cubit/locale_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  AppBlocProviders._();
  static get init {
    return [
      BlocProvider(create: (context) => LocaleCubit()..getSavedLocale()),
      BlocProvider(create: (context) => AppLayoutCubit()),
      //? login & register 
      BlocProvider(create: (context) => AuthCubit()),
      //? password rest
      BlocProvider(create: (context) => ForgetPasswordCubit()),
      //? home
      BlocProvider(create: (context) => HomeCubit()),
      //? article
      BlocProvider(create: (context) => ArticleCubit()),
      //? category
      BlocProvider(create: (context) => CategoryCubit()),
      //? reaction
      BlocProvider(create: (context) => ReactionCubit()),
      //? comment
      BlocProvider(create: (context) => CommentCubit()),

    ];
  }
}