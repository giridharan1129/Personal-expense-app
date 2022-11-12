import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

   String location; // location name for UI
   String time; // time in location
   String flag; //flag icon
   String url; //location url for api endpoint
   bool isDaytime; //true of false if daytime or not

   WorldTime({required this.location,required this.flag,required this.url,required this.time,required this.isDaytime});

  Future<void>getTime()async{

    try {
      //make the request

      var urll = Uri.parse('http://worldtimeapi.org/api/timezone/$url');
      http.Response response = await http.get(urll);
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      String offsetmin = data['utc_offset'].substring(4, 6);
      // print(datetime);
      // print(offset);
      // print(offsetmin);

      DateTime now = DateTime.parse(datetime);
      now = now.add(
          Duration(hours: int.parse(offset), minutes: int.parse(offsetmin)));

      //set time property
      log(now.hour.toString()!);
      isDaytime = now.hour > 5 && now.hour<12 ? true : false;
      log(isDaytime.toString()!);
      log((now.hour > 5).toString()!);
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error : $e');
      time='could not fetch time from the api';

    }

  }

}
