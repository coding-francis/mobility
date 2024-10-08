class UpdateModel {
  final bool available;
  final LatestUpdate? latestUpdate;

  UpdateModel({
    required this.available,
    this.latestUpdate,
  });

  factory UpdateModel.fromJson(Map<String, dynamic> json) {
    return UpdateModel(
      available: json['available'],
      latestUpdate: json['latestAppVersion'] != null
          ? LatestUpdate.fromJson(json['latestAppVersion'])
          : null,
    );
  }
}

class LatestUpdate {
  final int id;
  final String version;
  final int buildNumber;
  final String features;
  final String versionStatus;

  LatestUpdate({
    required this.id,
    required this.version,
    required this.buildNumber,
    required this.features,
    required this.versionStatus,
  });

  factory LatestUpdate.fromJson(Map<String, dynamic> json) {
    return LatestUpdate(
      id: json['id'],
      version: json['version'],
      buildNumber: json['buildNumber'],
      features: json['features'],
      versionStatus: json['versionStatus'],
    );
  }
}
