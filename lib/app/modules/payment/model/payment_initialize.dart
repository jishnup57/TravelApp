class InitializeModel {
  int amound;
  int name;
  int address;
  int slot;
  InitializeModel({
    required this.amound,
    required this.name,
    required this.address,
    required this.slot,
  });

 Map<String,dynamic> toJson()=> {
    "amound": amound,
    "name": name,
    "address": address,
    "slot": slot,
  };
}
