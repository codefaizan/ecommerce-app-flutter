class SearchAlert{

  String title;

  SearchAlert({
    required this.title
});
  
}


List<SearchAlert> demoAlertsList = [
  SearchAlert(title: 'bed full size'),
  SearchAlert(title: 'bike helmet'),
  SearchAlert(title: 'dell monitor'),
];

List<String> demoRecommendedSearchList = [
  "bike helmet", "dell monitor", "xbox one", "dell", "samsung s23"
];