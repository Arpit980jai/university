class UniversityModel {
  final String stateProvince;
  final String name;
  final String alphaTwoCode;
  final List<dynamic> webPages;
  final List<dynamic> domains;
  final String country;
  UniversityModel(this.stateProvince, this.name, this.alphaTwoCode,
      this.webPages, this.domains, this.country);
  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
        json['state-province'] ?? "",
        json['name'] ?? "",
        json['alpha_two_code'] ?? "",
        json['web_pages'] ?? [],
        json['domains'] ?? [],
        json['country'] ?? "");
  }
}
