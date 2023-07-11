class BeverageConfigModel {
  String type;
  String label;
  List<Config> configs;

  BeverageConfigModel({
    required this.type,
    required this.label,
    required this.configs,
  });

  BeverageConfigModel copyWith({
    String? type,
    String? label,
    List<Config>? configs,
  }) =>
      BeverageConfigModel(
        type: type ?? this.type,
        label: label ?? this.label,
        configs: configs ?? this.configs,
      );

  factory BeverageConfigModel.fromJson(Map<String, dynamic> json) =>
      BeverageConfigModel(
        type: json["type"],
        label: json["label"],
        configs:
            List<Config>.from(json["configs"].map((x) => Config.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        'label': label,
        "configs": List<dynamic>.from(configs.map((x) => x.toJson())),
      };
}

class Config {
  String asset;
  String label;
  String subLabel;
  String value;

  Config({
    required this.asset,
    required this.label,
    required this.subLabel,
    required this.value,
  });

  Config copyWith({
    String? asset,
    String? label,
    String? subLabel,
    String? value,
  }) =>
      Config(
        asset: asset ?? this.asset,
        label: label ?? this.label,
        subLabel: subLabel ?? this.subLabel,
        value: value ?? this.value,
      );

  factory Config.fromJson(Map<String, dynamic> json) => Config(
        asset: json["asset"],
        label: json["label"],
        subLabel: json["subLabel"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "asset": asset,
        "label": label,
        "subLabel": subLabel,
        "value": value,
      };
}
