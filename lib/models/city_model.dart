class CityModel {
  CityModel({
    required this.code,
    required this.message,
    required this.zpData,
  });

  final int? code;
  final String? message;
  final ZpData? zpData;

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      code: json["code"],
      message: json["message"],
      zpData: json["zpData"] == null ? null : ZpData.fromJson(json["zpData"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "zpData": zpData?.toJson(),
      };
}

class ZpData {
  ZpData({
    required this.hotCityList,
    required this.cityList,
    required this.locationCity,
  });

  final List<LocationCity> hotCityList;
  final List<LocationCity> cityList;
  final LocationCity? locationCity;

  factory ZpData.fromJson(Map<String, dynamic> json) {
    return ZpData(
      hotCityList: json["hotCityList"] == null
          ? []
          : List<LocationCity>.from(
              json["hotCityList"]!.map((x) => LocationCity.fromJson(x))),
      cityList: json["cityList"] == null
          ? []
          : List<LocationCity>.from(
              json["cityList"]!.map((x) => LocationCity.fromJson(x))),
      locationCity: json["locationCity"] == null
          ? null
          : LocationCity.fromJson(json["locationCity"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "hotCityList": hotCityList.map((x) => x.toJson()).toList(),
        "cityList": cityList.map((x) => x.toJson()).toList(),
        "locationCity": locationCity?.toJson(),
      };
}

class LocationCity {
  LocationCity({
    required this.code,
    required this.name,
    required this.tip,
    required this.subLevelModelList,
    required this.firstChar,
    required this.pinyin,
    required this.rank,
    required this.mark,
    required this.positionType,
    required this.cityType,
    required this.capital,
    required this.color,
    required this.recruitmentType,
    required this.cityCode,
    required this.regionCode,
    required this.value,
  });

  final int? code;
  final String? name;
  final dynamic tip;
  final List<LocationCity> subLevelModelList;
  final String? firstChar;
  final String? pinyin;
  final int? rank;
  final int? mark;
  final int? positionType;
  final int? cityType;
  final int? capital;
  final dynamic color;
  final dynamic recruitmentType;
  final String? cityCode;
  final int? regionCode;
  final dynamic value;

  factory LocationCity.fromJson(Map<String, dynamic> json) {
    return LocationCity(
      code: json["code"],
      name: json["name"],
      tip: json["tip"],
      subLevelModelList: json["subLevelModelList"] == null
          ? []
          : List<LocationCity>.from(
              json["subLevelModelList"]!.map((x) => LocationCity.fromJson(x))),
      firstChar: json["firstChar"],
      pinyin: json["pinyin"],
      rank: json["rank"],
      mark: json["mark"],
      positionType: json["positionType"],
      cityType: json["cityType"],
      capital: json["capital"],
      color: json["color"],
      recruitmentType: json["recruitmentType"],
      cityCode: json["cityCode"],
      regionCode: json["regionCode"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "tip": tip,
        "subLevelModelList": subLevelModelList.map((x) => x.toJson()).toList(),
        "firstChar": firstChar,
        "pinyin": pinyin,
        "rank": rank,
        "mark": mark,
        "positionType": positionType,
        "cityType": cityType,
        "capital": capital,
        "color": color,
        "recruitmentType": recruitmentType,
        "cityCode": cityCode,
        "regionCode": regionCode,
        "value": value,
      };
}
