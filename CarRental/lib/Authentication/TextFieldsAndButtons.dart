import 'package:flutter/material.dart';
class TextFieldsAndButtons   {

   Widget SignOutButton(BuildContext context , bool isLogin , Function OnTap){
     return Container(
       width: 100,
       height: 30,
       margin: EdgeInsets.all(2),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
       ),
       child: ElevatedButton(
         onPressed: (){
           OnTap();
         },
         child: Text(
           isLogin ? 'Sign In' : 'Sign Out',
           style: const TextStyle(
               color: Colors.white , fontWeight: FontWeight.bold , fontSize: 16),
         ),
         style: ButtonStyle(
             backgroundColor: MaterialStateProperty.resolveWith((states){
               if(!states.contains(MaterialState.pressed)){
                 return Colors.black45;
               }else{
                 Colors.white;
               }


             }),
             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
         ),
       ),
     );

   }
}
