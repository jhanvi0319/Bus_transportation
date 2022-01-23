class Departure {
  int? code;
  int? pickupId;
  int? returnId;
  List<BusesList>? busesList;
  bool? isReturn;
  String? date;

  Departure(
      {this.code,
        this.pickupId,
        this.returnId,
        this.busesList,
        this.isReturn,
        this.date});

  Departure.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    pickupId = json['pickup_id'];
    returnId = json['return_id'];
    if (json['buses_list'] != null) {
      busesList = <BusesList>[];
      json['buses_list'].forEach((v) {
        busesList!.add( BusesList.fromJson(v));
      });
    }
    isReturn = json['is_return'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['pickup_id'] = this.pickupId;
    data['return_id'] = this.returnId;
    if (this.busesList != null) {
      data['buses_list'] = this.busesList!.map((v) => v.toJson()).toList();
    }
    data['is_return'] = this.isReturn;
    data['date'] = this.date;
    return data;
  }
}

class BusesList {
  String? id;
  String? departureTime;
  String? arrivalTime;
  String? recurring;
  String? routeName;
  List<TicketsDropdown>? ticketsDropdown;
  int? seatsAvailable;
  String? duration;
  String? fromLocation;
  String? toLocation;

  BusesList(
      {this.id,
        this.departureTime,
        this.arrivalTime,
        this.recurring,
        this.routeName,
        this.ticketsDropdown,
        this.seatsAvailable,
        this.duration,
        this.fromLocation,
        this.toLocation});

  BusesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    departureTime = json['departure_time'];
    arrivalTime = json['arrival_time'];
    recurring = json['recurring'];
    routeName = json['route_name'];
    if (json['tickets_dropdown'] != null) {
      ticketsDropdown = <TicketsDropdown>[];
      json['tickets_dropdown'].forEach((v) {
        ticketsDropdown!.add( TicketsDropdown.fromJson(v));
      });
    }
    seatsAvailable = json['seats_available'];
    duration = json['duration'];
    fromLocation = json['from_location'];
    toLocation = json['to_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['departure_time'] = this.departureTime;
    data['arrival_time'] = this.arrivalTime;
    data['recurring'] = this.recurring;
    data['route_name'] = this.routeName;
    if (this.ticketsDropdown != null) {
      data['tickets_dropdown'] =
          this.ticketsDropdown!.map((v) => v.toJson()).toList();
    }
    data['seats_available'] = this.seatsAvailable;
    data['duration'] = this.duration;
    data['from_location'] = this.fromLocation;
    data['to_location'] = this.toLocation;
    return data;
  }
}

class TicketsDropdown {
  String? ticketId;
  String? price;
  String? ticket;
  String? discount;

  TicketsDropdown({this.ticketId, this.price, this.ticket, this.discount});

  TicketsDropdown.fromJson(Map<String, dynamic> json) {
    ticketId = json['ticket_id'];
    price = json['price'];
    ticket = json['ticket'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['ticket_id'] = this.ticketId;
    data['price'] = this.price;
    data['ticket'] = this.ticket;
    data['discount'] = this.discount;
    return data;
  }
}
