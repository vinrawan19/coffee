class PromoModel {
  int id;
  String label;
  String subtitle;
  String formula;

  PromoModel({
    required this.id,
    required this.label,
    required this.subtitle,
    required this.formula,
  });

  PromoModel copyWith({
    int? id,
    String? label,
    String? subtitle,
    String? formula,
  }) =>
      PromoModel(
        id: id ?? this.id,
        label: label ?? this.label,
        subtitle: subtitle ?? this.subtitle,
        formula: formula ?? this.formula,
      );

  factory PromoModel.fromJson(Map<String, dynamic> json) => PromoModel(
        id: json["id"],
        label: json["label"],
        subtitle: json["subtitle"],
        formula: json["formula"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "label": label,
        "subtitle": subtitle,
        "formula": formula,
      };
}
