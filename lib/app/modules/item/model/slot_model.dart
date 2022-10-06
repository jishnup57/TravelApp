class Slots {
  List<SlotModel>? listOfSlots;
  String? message;
  Slots({
    this.listOfSlots,
    this.message,
  });
  factory Slots.fromJson(List<dynamic> parsedJson) {

      return Slots(
        listOfSlots:parsedJson == []?[]: parsedJson.map((i) => SlotModel.fromJson(i)).toList(),
      );
  
  }
}

class SlotModel {
  int? id;
  String? date;
  String? days;
  bool? active;
  bool? isBooked;
  int? package;
  SlotModel(
      {this.id,
      this.date,
      this.days,
      this.active,
      this.isBooked,
      this.package});
  factory SlotModel.fromJson(Map<String, dynamic> json) => SlotModel(
        id: json['id'],
        date: json['Date'],
        days: json['days'],
        active: json['active'],
        isBooked: json['isbooked'],
        package: json['package'],
      );
}
