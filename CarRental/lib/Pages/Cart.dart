import 'package:carrental/Models/TheUser.dart';
import 'package:carrental/Pages/HomeScreen/HomeScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Cart extends StatelessWidget {
  Cart({Key? key, required this.DataforCar , required this.values , required this.theUser , required this.TotalPrice ,required this.startDate ,required  this.endDate }) : super(key: key);
  List<dynamic> DataforCar;
  TheUser theUser;
  int values;
  int TotalPrice;
  DateTime startDate;
  DateTime endDate;

  @override
  Widget build(BuildContext context) {
    int dateIndays= endDate.difference(startDate).inDays;
    TotalPrice=int.parse(DataforCar[values].DailyPrice)*dateIndays;
    return Material(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(200, 119, 57, 133),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height:2250.h ,
            width: 1125.w,
            margin: EdgeInsets.only(top : 10, left: 5 ,right: 5,bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.sp),
                color: Colors.black26
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height:850.h ,
                  width: 1125.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.sp),
                  ),
                  child: ListView.builder(
                      itemCount:1,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, index){
                        return Container(
                          height:750.h ,
                          width: 1125.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.sp),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  DataforCar[values].Image!
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                ),
                SingleChildScrollView(
                  child: Container(////////////////
                    height: 1400.h,
                    width: 1125.w,
                    decoration: BoxDecoration(
                  color: Colors.white,
                      borderRadius: BorderRadius.circular(50.sp),
                  ),
              child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(right: 10.w, left: 20.w,top: 10.h),
                            child: Text(DataforCar[values!].VehicleCompany,style: TextStyle(fontSize: 100.sp, fontWeight: FontWeight.bold),)
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(right: 10.w, left: 5.w,top: 10.h),
                            child: Text(DataforCar[values!].VehicleName,style: TextStyle(fontSize: 100.sp, fontWeight: FontWeight.bold),)
                        ),

                      ],
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(right: 10.w, left: 30.w,top: 5.h),
                        child: Text(DataforCar[values!].Type,style: TextStyle(fontSize: 100.sp, fontWeight: FontWeight.w400),)
                    ),
                    Divider(thickness: 5.h,),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person,color: Colors.white70,),
                      ),
                      title: Text(theUser.Name!,style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.w500),),
                      subtitle: Text(theUser.Email!,style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w400),),
                      trailing: Text(theUser.PNumber!,style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w400),),
                    ),
                    Divider(thickness: 5.h,),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.w ,right: 5.w,top: 50.h),
                        child: Text("DailyPrice:",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w700),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.w ,right: 4.w,top: 50.h),
                        child: Text(DataforCar[values!].DailyPrice,style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4.w ,right: 10.w,top: 50.h),
                        child: Text("SAR",style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.w300),),
                      ),
                    ],
                  ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4.w ,right: 4.w,top: 50.h),
                          child: Text("TotalPrice:",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w700),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4.w ,right: 4.w,top: 50.h),
                          child: Text(TotalPrice.toString(),style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4.w ,right: 4.w,top: 50.h),
                          child: Text("For",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4.w ,right: 4.w,top: 50.h),
                          child: Text(dateIndays.toString(),style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4.w ,right: 4.w,top: 50.h),
                          child: Text("Days",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4.w ,right: 4.w,top: 50.h),
                          child: Text("Start Date: ",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w700),),
                        ),

                        Container(
                          margin: EdgeInsets.only(left: 4.w ,right: 4.w,top: 50.h),
                          child: Text("${startDate.day}/${startDate.month}/${startDate.year}",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 4.w ,right: 4.w,top: 50.h),
                          child: Text("End Date: ",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w700),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4.w ,right: 4.w,top: 50.h),
                          child: Text("${endDate.day}/${endDate.month}/${endDate.year}",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),

                    Container(
                      height: 200.h,
                      width: 1000.w,
                      margin: EdgeInsets.only(bottom: 10.h, top: 100.h),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:1,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              height: 200.h,
                              width: 1000.w,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStatePropertyAll<double>(0.0),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.sp),
                                      // side: BorderSide(color: Colors.amberAccent),
                                    ),
                                  ),
                                  backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(200,119,57, 133)),
                                ),
                                onPressed: () {
                                  WriteInvoiceToDB(theUser.Name,theUser.Email,TotalPrice,dateIndays,"${startDate.day}/${startDate.month}/${startDate.year}","${endDate.day}/${endDate.month}/${endDate.year}");
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Process completed ,you have rented this car"),backgroundColor: Colors.black45,));
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },

                                child: Container(
                                  height: 200.h,
                                  width: 1000.w,
                                  padding: EdgeInsets.only(left: 45.w , right: 45.w , bottom: 44.h ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.sp),
                                  ),
                                  child: Text("Rent", style: TextStyle(fontSize: 100.sp),),
                                ),
                              ),
                            );
                          }
                          ),
                    ),
                  ],
              ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void WriteInvoiceToDB(String name,String email,int totalPrice ,int numOfDays,String startDate, String endDate){
    DatabaseReference DBRef =FirebaseDatabase.instance.ref("Invoices");
    DatabaseReference DBKey = DBRef.push();
    Map<String,dynamic> userInvoice ={
      "Name" : name,
      "Email" : email,
      "TotalPrice" : totalPrice,
      "NumOfDays" : numOfDays,
      "Startdate" : startDate,
      "EndDate" : endDate,
    };

    DBKey.set(userInvoice);
  }
}
