import 'package:flutter/material.dart';
import 'package:loanlink/r_widgets/r_widgets.dart';
import 'package:lottie/lottie.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String onTap() {
    return "Hello";
  }
  final List<Map<String, dynamic>> _items = List.generate(
      50,
          (index) => {
        "id":index,
        "title":"Credit Score",
        "content":
        "This is the credit Score",
      });

  TextEditingController _credit = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // backgroundColor: Colors.redAccent,

        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: false,
          backgroundColor: Colors.purple,
          leading: Icon(Icons.menu),


        ),
        body: SafeArea(
          child: Container(

            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/images/loanphoto2.jpg'),
            //       fit: BoxFit.fill,
            // ),
            //

            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(80.0,0.0,80.0,0.0),
                  child: Center(

                      child:Container(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Lottie.network("https://assets1.lottiefiles.com/packages/lf20_5AVtutzGOk.json"),
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[


                      rtiles(context, "Profile",'assets/pfp1.jpg'),
                      SizedBox(width: 10.0,),
                      rtiles(context, "New\nApplication",'assets/plus2.jpg')
                    ],),
                ),
                SizedBox(height:10.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[


                      rtiles(context, "Calender",'assets/calender.jpg'),

                      SizedBox(width: 10.0,),
                      rtiles(context, "Settings",'assets/settings.jpg'),



                    ],

                  ),
                ),
                SizedBox(height: 20.0,),
                // loginBtn(context, " Credit Score", onTap),
                rtcredit(context, "Credit Score"),
              ],),
          ),
        )
    );

  }
}
