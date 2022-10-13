class OnTapModel{
  String? country;
  String? administrativeArea;
  String? subAdministrativeArea;
  String? locality;
  String? subLocality;
  String? message;
  OnTapModel({this.country,this.administrativeArea,this.subAdministrativeArea,this.locality,this.subLocality});
  factory OnTapModel.fromJson(Map<String,dynamic> json)=>OnTapModel(
    country: json['country']??'',
    administrativeArea: json['administrativeArea']??'',
    subAdministrativeArea: json['subAdministrativeArea']??'',
    locality: json['locality']??'',
    subLocality: json['subLocality']??'',
  );
}