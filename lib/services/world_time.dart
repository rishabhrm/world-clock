import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future <Map> getTime() async {
    Map place = {};
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'];
      String offsetHours = offset.substring(1,3);
      String offsetMinutes = offset.substring(4);
      // print(datetime);
      // print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetHours), minutes: int.parse(offsetMinutes)));
      // print(now);
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;


      place['isDayTime'] = isDayTime;
      place['time'] = time;
      place['location'] = location;
      place['flag'] = flag;
      // print(time);
    } catch(e) {
      print('Error: $e');
      place['isDayTime'] = true;
      place['time'] = 'No Internet!';
      place['location'] = location;
      place['flag'] = flag;
    }
    return place;
  }

}