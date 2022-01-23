class CitiesList {
  List<FromBuses>? fromBuses;
  List<ToBuses>? toBuses;

  CitiesList({this.fromBuses, this.toBuses});

  CitiesList.fromJson(Map<String, dynamic> json) {
    if (json['From_Buses'] != null) {
      fromBuses = <FromBuses>[];
      json['From_Buses'].forEach((v) {
        fromBuses!.add( FromBuses.fromJson(v));
      });
    }
    if (json['To_Buses'] != null) {
      toBuses = <ToBuses>[];
      json['To_Buses'].forEach((v) {
        toBuses!.add( ToBuses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (this.fromBuses != null) {
      data['From_Buses'] = this.fromBuses!.map((v) => v.toJson()).toList();
    }
    if (this.toBuses != null) {
      data['To_Buses'] = this.toBuses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FromBuses {
  String? id;
  String? status;
  String? name;

  FromBuses({this.id,this.status, this.name});

  FromBuses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
class ToBuses {
  String? id;
  String? name;

  ToBuses({this.id, this.name});

  ToBuses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}