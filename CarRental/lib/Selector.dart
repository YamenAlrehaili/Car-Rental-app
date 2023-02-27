import 'package:carrental/Authentication/SignIn.dart';
import 'package:carrental/Models/TheUser.dart';
import 'package:carrental/Models/Vehicle.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:carrental/Pages/HomeScreen/HomeScreen.dart';
class Selectors extends StatefulWidget {
  const Selectors({Key? key}) : super(key: key);

  @override
  State<Selectors> createState() => _SelectorsState();
}

class _SelectorsState extends State<Selectors> {
  static TheUser theUser = TheUser(Name: "", Email: "", PNumber: "", DriverLicense: "", uid: "");
  static List<Vehicle> CarData = [];
  static List<dynamic> Vehicles = [];
  static List<dynamic> UserData = [];
  static int index = 0;


  List<dynamic> getAllCars() {
    FirebaseDatabase.instance.ref("Vehicles").orderByKey().once().then((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,
      );

      Vehicles = data.values.toList();

      for (int i = 0; i < Vehicles.length; i++) {
        CarData.insert(
            i,
            Vehicle(
                VehicleCompany: Vehicles[i]["VehicleCompany"],
                VehicleId: Vehicles[i]["VehicleId"],
                VehicleName: Vehicles[i]["VehicleName"],
                Type: Vehicles[i]["Type"],
                DailyPrice: Vehicles[i]["DailyPrice"],
                Image: Vehicles[i]["Image"],
                listofCarsImages: []));
        print(Vehicles[i]["VehicleCompany"].length);
        for (int j = 0; j < Vehicles[i]["AltImages"].length; j++) {
          CarData[i]
              .listofCarsImages!
              .insert(j, Vehicles[i]["AltImages"][j]["Image"]);
        }
      }
    });
    return Vehicles;
  }

  List<dynamic> getUser() {
    FirebaseDatabase.instance.ref("User").orderByKey().once().then((event) {
      final data = Map<String, dynamic>.from(
        event.snapshot.value as Map,
      );
      UserData = data.values.toList();

      theUser.uid = UserData[0]["UserId"];
      theUser.DriverLicense = UserData[0]["DriverLicense"];
      theUser.Email = UserData[0]["Email"];
      theUser.PNumber = UserData[0]["PNumber"];
      theUser.Name = UserData[0]["Name"];
    });
    return UserData;
  }
  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      UserData = getUser();
      Vehicles = getAllCars();
      index++;
    }
    if (CarData.length > 3) {
      CarData.clear();
      Vehicles.clear();
      UserData.clear();
      Future.delayed(Duration(seconds: 1), () {
        Vehicles = getAllCars();
        UserData = getUser();
      });
    }
    final theuser = Provider.of<TheUser?>(context);
    return ScreenUtilInit(
      designSize: const Size(1125,2246),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        Widget Select;
        if(theuser==null){
          Select = SignIn();
        }else{
            Select = HomeScreen(theUser: theUser,CarData: CarData,);
        }
        return Select;
      },
    );
  }
}
