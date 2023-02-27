import 'package:carrental/Models/TheUser.dart';
import 'package:carrental/Models/Vehicle.dart';
import 'package:carrental/Pages/Invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carrental/Authentication/Authentication.dart';
import 'package:carrental/Authentication/TextFieldsAndButtons.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key,required this.theUser,required this.CarData}) : super(key: key);
   TheUser theUser;
   List<Vehicle> CarData;
  @override
  State<HomeScreen> createState() => _HomeScreenState(theUser: theUser,CarData: CarData);
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState({Key? key,required this.theUser,required this.CarData});
   TheUser theUser;
   List<Vehicle> CarData;

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(1125.w, 100.h),
        child: AppBar(
          title: Text("Car Rental App"),
          elevation: 0.0,
          actions: [
            TextFieldsAndButtons().SignOutButton(context, false, () async {
              await Auth().SignOut();
            }),
          ],
          backgroundColor: Color.fromARGB(200, 119, 57, 133),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(200, 119, 57, 133),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 2000.h,
          width: 1125.w,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  theUser.Name!,
                  style: TextStyle(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                subtitle: Row(children: <Widget>[
                  Text(
                    theUser.Email!,
                    style: TextStyle(
                        fontSize: 53.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    theUser.PNumber!,
                    style: TextStyle(
                        fontSize: 37.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ]),
                trailing: Text(
                  "4.0",
                  style: TextStyle(
                      fontSize: 47.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white70,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Popular Cars",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 55.sp,
                        fontFamily: "Tajawal"),
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 5.h,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Popular Car :Saudi Arabia",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 45.sp,
                        fontFamily: "Tajawal"),
                    textAlign: TextAlign.left),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 550.h,
                width: 1125.w,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: CarData.length,
                    itemBuilder: (BuildContext context, index) {
                      print(CarData.length);
                      return Container(
                        width: 1004.w,
                        height: 550.h,
                        margin: EdgeInsets.only(right: 5),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStatePropertyAll<double>(0.0),
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 255, 255, 255)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.sp),
                              // side: BorderSide(color: Colors.amberAccent),
                            )),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Invoice(
                                        theindex: index,
                                        dataforCar: CarData,
                                        theUser: theUser)));
                          },
                          child: Container(
                              width: 1004.w,
                              height: 550.h,
                              alignment: Alignment.bottomCenter,
                              padding: EdgeInsets.only(
                                  bottom: 44.h, left: 45.w, right: 45.w),
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(50.sp),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(CarData[index].Image!),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(CarData[index].VehicleName!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 45.sp,
                                          fontFamily: "Tajawal"),
                                      textAlign: TextAlign.left),
                                  SizedBox(
                                    width: 21.w,
                                  ),
                                  Text(CarData[index].Type!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32.sp,
                                          fontFamily: "Tajawal"),
                                      textAlign: TextAlign.left),
                                  SizedBox(
                                    width: 200.w,
                                  ),
                                  Text(CarData[index].DailyPrice!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 63.sp,
                                          fontFamily: "Tajawal"),
                                      textAlign: TextAlign.left),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Text("SAR",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32.sp,
                                          fontFamily: "Tajawal"),
                                      textAlign: TextAlign.left),
                                ],
                              )),
                        ),
                      );
                    }),
              ),
              Divider(
                thickness: 3,
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All Cars",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 55.sp,
                        fontFamily: "Tajawal"),
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 5.h,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Available in: Saudi Arabia",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 45.sp,
                        fontFamily: "Tajawal"),
                    textAlign: TextAlign.left,
                  )),
              SizedBox(
                height: 5.h,
              ),
              Container(
                height: 850.h,
                width: 1125.w,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: CarData.length,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        height: 650.h,
                        width: 1125.w,
                        margin:
                            EdgeInsets.only(right: 5.w, left: 5.w, bottom: 5.h),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStatePropertyAll<double>(0.0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.sp),
                              ),
                            ),
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 255, 255, 255)),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Invoice(
                                        theindex: index,
                                        dataforCar: CarData,
                                        theUser: theUser)));
                          },
                          child: Container(
                              height: 650.h,
                              width: 1125.w,
                              padding: EdgeInsets.only(
                                  left: 45.w, right: 45.w, bottom: 44.h),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(50.sp),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    CarData[index].Image!,
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 15.w),
                                      child: Text(CarData[index].VehicleName!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 45.sp,
                                              fontFamily: "Tajawal"),
                                          textAlign: TextAlign.left)),
                                  SizedBox(width: 21.w),
                                  Container(
                                      child: Text(CarData[index].Type!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 32.sp,
                                              fontFamily: "Tajawal"),
                                          textAlign: TextAlign.left)),
                                  SizedBox(width: 200.w),
                                  Container(
                                      child: Text(CarData[index].DailyPrice!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 63.sp,
                                              fontFamily: "Tajawal"),
                                          textAlign: TextAlign.left)),
                                  SizedBox(width: 15.w),
                                  Container(
                                      margin: EdgeInsets.only(right: 15.w),
                                      child: Text("SAR",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 32.sp,
                                              fontFamily: "Tajawal"),
                                          textAlign: TextAlign.left)),
                                ],
                              )),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
