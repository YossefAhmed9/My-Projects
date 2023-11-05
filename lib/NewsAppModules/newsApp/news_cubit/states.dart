abstract class NewsAppStates {}

class NewsAppInitialState extends NewsAppStates {}

class NewsAppChangeBottomNavBar extends NewsAppStates {}

class GetBusinessLoadingState extends NewsAppStates {}

class GetBusinessSuccessState extends NewsAppStates {}

class GetBusinessErrorState extends NewsAppStates {
  final error;
  GetBusinessErrorState(this.error);
}

class SportLoadingState extends NewsAppStates {}

class SportSuccessState extends NewsAppStates {}

class SportErrorState extends NewsAppStates {
  final error;
  SportErrorState(this.error);
}

class TechLoadingState extends NewsAppStates {}

class TechSuccessState extends NewsAppStates {}

class TechErrorState extends NewsAppStates {
  final error;
  TechErrorState(this.error);
}

class ChangeModeState extends NewsAppStates {}

class SearchLoadingState extends NewsAppStates {}

class SearchSuccessState extends NewsAppStates {}

class SearchErrorState extends NewsAppStates {
  final error;
  SearchErrorState(this.error);
}

// class NewsAppCreateDatabase extends NewsAppStates {}

// class NewsAppOpenDatabase extends NewsAppStates {}

// class NewsAppInsertInDatabase extends NewsAppStates {}

// class NewsAppGetDataLoading extends NewsAppStates {}

// class NewsAppUpdateDatabase extends NewsAppStates {}

// class NewsAppDeleteFromDatabase extends NewsAppStates {}

// class NewsAppGetDataFromDB extends NewsAppStates {}

//class ChangeFabIconState extends AppStates {}