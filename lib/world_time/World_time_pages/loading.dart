import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../world_time_services/world_time.dart';
 class Loading extends StatefulWidget {
   const Loading({Key? key}) : super(key: key);
 
   @override
   State<Loading> createState() => _LoadingState();
 }
 
 class _LoadingState extends State<Loading> {

   void setupWorldTime() async{

     WorldTime instance=WorldTime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin',time:'',isDaytime:true);
     await instance.getTime();
     Navigator.pushReplacementNamed(context, '/home',arguments: {
       'location' : instance.location,
       'flag' : instance.flag,
       'time' : instance.time,
       'isDayTime': instance.isDaytime,
     });

   }

   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     setupWorldTime();
   }

   @override
   Widget build(BuildContext context) {
     return const Scaffold(
       backgroundColor: Colors.redAccent,
       body:Padding(
         padding: EdgeInsets.all(50.0),
         child: Center(
           child: SpinKitSpinningLines(
             color: Colors.white,
             size: 50.0,
           ),
         ),
       )
     );
   }
 }
 