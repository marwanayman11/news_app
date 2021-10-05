abstract class NewsStates {}
class NewsInitialState extends NewsStates{}
class BottomNavBarState extends NewsStates{}
class BusinessState extends NewsStates{}
class BusinessStateError extends NewsStates{
  late final  String error;
  BusinessStateError(this.error);
}
class BusinessStateLoading extends NewsStates{}
class SportsState extends NewsStates{}
class SportsStateError extends NewsStates{
  late final  String error;
  SportsStateError(this.error);
}
class SportsStateLoading extends NewsStates{}

class ScienceState extends NewsStates{}
class ScienceStateError extends NewsStates{
  late final  String error;
  ScienceStateError(this.error);
}
class ScienceStateLoading extends NewsStates{}

class SearchStateLoading extends NewsStates{}
class SearchState extends NewsStates{}
class SearchStateError extends NewsStates{
  late final  String error;
  SearchStateError(this.error);
}
class ChangeThemeState extends NewsStates{}


