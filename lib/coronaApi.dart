class CoronaApi {
  final int population;
  final int cases;
  final int recovered;
  final int deaths;
  final int active;
  final int affectedCountries;

  CoronaApi(
      {required this.population,
      required this.cases,
      required this.recovered,
      required this.deaths,
      required this.active,
      required this.affectedCountries});

  factory CoronaApi.fromJson(Map<String, dynamic> json) {
    return CoronaApi(
        population: json['population'],
        cases: json['cases'],
        recovered: json['recovered'],
        deaths: json['deaths'],
        active: json['active'],
        affectedCountries: json['affectedCountries']);
  }
}
