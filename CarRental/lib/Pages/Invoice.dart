import 'package:carrental/Pages/Cart.dart';
import 'package:carrental/Models/TheUser.dart';
import 'package:carrental/Models/Vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Invoice extends StatefulWidget {
   Invoice({Key? key,this.theindex, required this.dataforCar , required this.theUser,}) : super(key: key);
  int? theindex;
  List<Vehicle> dataforCar;
  TheUser theUser;
  BuildContext? context;
  @override
  State<Invoice> createState() => _InvoiceState(theindex: theindex,theUser: theUser,dataforCar: dataforCar);
}

class _InvoiceState extends State<Invoice> {
  _InvoiceState( {this.theindex, required this.dataforCar , required this.theUser,});
  int? theindex;
  List<Vehicle> dataforCar;
  TheUser theUser;
  int TotalPrice=0;
  DateTime? startDate;
  DateTime? endDate;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(200, 119, 57, 133),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 130.h ),
                  alignment: Alignment.centerLeft,
                  child: Text("Ride it",style: TextStyle(fontSize: 105.sp , fontWeight: FontWeight.bold,color: Colors.black),)
              ),
              ListTile(
                title: Text(theUser.Name!,style: TextStyle(fontSize: 60.sp , fontWeight: FontWeight.bold,color: Colors.black),),
                subtitle: Row(
                    children: <Widget>[
                      Text(dataforCar[theindex!].VehicleName!,style: TextStyle(fontSize: 53.sp , fontWeight: FontWeight.w600,color: Colors.black),),
                      SizedBox(width: 5.w,),
                      Text(dataforCar[theindex!].Type!,style: TextStyle(fontSize: 37.sp , fontWeight: FontWeight.w500,color: Colors.black),),
                    ]
                ),
                trailing: Text("4.0",style: TextStyle(fontSize: 47.sp , fontWeight: FontWeight.bold,color: Colors.black),),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,color: Colors.white70,),
                ),
              ),

              Column(
                children: [
                  Container(
                    height: 576.h,
                    width: 1125.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.sp),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            dataforCar[theindex!].Image!
                        ),
                      ),
                    ),
                  ),

                  Container(
                    height: 199.h,
                    width: 1125.w,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: ListView.builder(
                        itemCount: dataforCar[theindex!].listofCarsImages!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context , index){
                          print("asdasdasd");
                          print(dataforCar[theindex!].listofCarsImages);
                          return Container(
                            height: 199.h,
                            width: 200.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.sp),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        dataforCar[theindex!].listofCarsImages![index]
                                    )
                                )
                            ),
                          );
                        }
                    ),
                  )


                ],
              ),
              Container(
                  height: 1000.h,
                  width: 1125.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.sp),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      SizedBox(height: 30.w,),
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(theUser.Name!,style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),)
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 50),
                          alignment: Alignment.centerLeft,
                          child: Text("Sultanah street",style: TextStyle(fontSize: 37.sp, fontWeight: FontWeight.w400),)//=======================
                      ),
                      SizedBox(height: 65.h,),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            alignment: Alignment.centerLeft,
                            child: Text("Start Date",style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w700),)//=======================
                        ),
                        Container(
                          height: 160.h,
                          width: 600.w,
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
                            onPressed: ()async {
                              startDate=null;
                              endDate=null;
                              DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime(2020,1,1), firstDate: DateTime(2020,1,1), lastDate: DateTime(2025,1,1));
                              if(pickedDate==null) return;
                              setState(() {

                                startDate=pickedDate;
                              });
                            },

                            child: Text("Pick start date", style: TextStyle(fontSize: 70.sp),),
                          ),
                        ),
                      ],
                    ),
                      SizedBox(height: 65.h,),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 18),
                              alignment: Alignment.centerLeft,
                              child: Text("End Date",style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.w700),)//=======================
                          ),
                          Container(
                            height: 160.h,
                            width: 600.w,
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
                              onPressed: ()async {
                                DateTime? pickedDate = await showDatePicker(context: context, initialDate: DateTime(2020,1,1), firstDate: DateTime(2020,1,1), lastDate: DateTime(2025,1,1));
                                if(pickedDate==null) return;
                                if(pickedDate.isAfter(startDate!)){
                                setState(() {
                                  endDate=pickedDate;
                                });
                                }else{
                                  showDialog(context: context, builder: (BuildContext context){
                                    return AlertDialog(
                                      title: Text("End date must be after Start date"),

                                      actions: [
                                        TextButton(onPressed: (){
                                          Navigator.pop(context);
                                        }, child: Text("Discard"))
                                      ],
                                    );
                                  });
                                }
                              },

                              child: Text("Pick end date", style: TextStyle(fontSize: 70.sp),),

                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 65.h,),
                      !(startDate==null) ? Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 5),
                            alignment: Alignment.centerLeft,
                            child: Text("Your picked start Date:",style: TextStyle(fontSize: 55.sp, fontWeight: FontWeight.w900),)//=======================
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 5),
                            alignment: Alignment.centerLeft,
                            child: Text("${startDate!.day}/${startDate!.month}/${startDate!.year}",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ) : Container(),
                      SizedBox(height: 20.h,),
                      !(endDate==null) ? Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 5),
                              alignment: Alignment.centerLeft,
                              child: Text("Your picked end Date:",style: TextStyle(fontSize: 55.sp, fontWeight: FontWeight.w900),)//=======================
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            alignment: Alignment.centerLeft,
                            child: Text("${endDate!.day}/${endDate!.month}/${endDate!.year}",style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.w500),),
                          ),
                        ],
                      ) : Container(),
                    ],
                  )
              ),
              Container(
                height: 300.h,
                width: 1125.w,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:1,
                    itemBuilder: (BuildContext context, index) {
                      return Container(
                        height: 200.h,
                        width: 1125.w,
                        margin: EdgeInsets.only(right: 5.w , left: 5.w , bottom: 5.h),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStatePropertyAll<double>(0.0),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.sp),
                              ),
                            ),
                            backgroundColor: MaterialStatePropertyAll<Color>(Color.fromARGB(200,119,57, 133)),
                          ),
                          onPressed: () {

                            if(startDate!=null&&endDate!=null){



                              Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(DataforCar: dataforCar, values: theindex!,theUser: theUser,TotalPrice : TotalPrice,startDate : startDate! ,endDate : endDate!)));
                            }else{
                              showDialog(context: context, builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("End date must be after Start date"),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text("Discard"))
                                  ],
                                );
                              });
                            }
                            startDate==null;
                            endDate==null;
                          },

                          child: Container(
                            height: 750.h,
                            width: 1125.w,
                            padding: EdgeInsets.only(left: 45.w , right: 45.w , bottom: 44.h ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.sp),
                            ),
                            child: Text("Proceed", style: TextStyle(fontSize: 100.sp),),
                          ),
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
