
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height ,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/1.jpg'),
                      fit: BoxFit.contain),
                ),
              ),

              SizedBox(height: 30,) ,
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.06,

                child:  MaterialButton(
                    onPressed: () {},
                    color: Colors.blue.shade600,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(30)),
                    child: Text(
                      " تسجيل دخول الأهل ",
                      style: TextStyle(fontSize: 20 , color: Colors.white),
                    ),
                  ),

              ),
              SizedBox(height: 20,) ,
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.06,

                child:  MaterialButton(
                  onPressed: () {},
                  color: Colors.orange.shade100,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(30)),
                  child: Text(
                    " تسجيل دخول الموظف ",
                    style: TextStyle(fontSize: 20 , color: Colors.blue.shade900),
                  ),
                ),

              ),
            ],
          ),
        )
      ],
    ) ;
  }
}