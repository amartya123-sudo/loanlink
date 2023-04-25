import 'package:flutter/material.dart';
import 'package:loanlink/pages/credit_score.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // backgroundColor: Colors.grey[400],

        appBar: AppBar(
          title: const Text("Dashboard"),
          centerTitle: false,
          backgroundColor: Colors.purple,
        ),
        body: SafeArea(
            child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/loanphoto2.jpg'),
            fit: BoxFit.fill,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 200.0, 0, 0),
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  TextButton.icon(
                    onPressed: () {
                      print("Pressed button 1");
                    },
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size(150.0, 70.0)),
                      // backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blueAccent.withOpacity(0.5);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blueAccent.withOpacity(0.5);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    icon: Icon(
                      Icons.person_outlined,
                      color: Colors.purple[800],
                    ),
                    label: const Text(
                      "My profile",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreditScore()),
                          (route) => false);
                    },
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size(150.0, 70.0)),
                      // backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blueAccent.withOpacity(0.5);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blueAccent.withOpacity(0.5);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.purple[800],
                    ),
                    label: const Text(
                      "Calender",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 20.0,
                ),
                Row(children: <Widget>[
                  TextButton.icon(
                    onPressed: () {
                      print("Pressed button 3");
                    },
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size(150.0, 70.0)),
                      // backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blueAccent.withOpacity(0.5);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blueAccent.withOpacity(0.5);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Colors.purple[800],
                    ),
                    label: const Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      print("Pressed button 4");
                    },
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size(150.0, 70.0)),
                      // backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blueAccent.withOpacity(0.5);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blueAccent.withOpacity(0.5);
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    icon: Icon(
                      Icons.logout,
                      color: Colors.purple[800],
                    ),
                    label: const Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        )));
  }
}
