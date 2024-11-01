part of 'locale_cubit.dart';

@immutable
sealed class LocaleState extends Equatable{}

final class LocaleInitial extends LocaleState {
  @override
  List<Object?> get props => [];
}

final class ChangeLocaleState extends LocaleState {
  final Locale locale;
  ChangeLocaleState({required this.locale});
  
  @override
  List<Object?> get props => [locale];
}
