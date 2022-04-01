abstract class ApiStates{}

class ApiInitialState extends ApiStates{}

class ApigoState extends ApiStates{}

class GetSportsDataState extends ApiStates{}


class GetSportsDataErrorState extends ApiStates{
  String error;
  GetSportsDataErrorState(this.error);
}