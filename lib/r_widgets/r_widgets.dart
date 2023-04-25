import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }
}


AssetImage riconimage(String imageName) {
  return AssetImage(imageName);
}
Widget rtiles(BuildContext context,String text,String imageName){
  return Center(
    child: Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
      child: SizedBox(
        width: 160.0,
        height: 100.0,
        child: ListTile(
          title: Text(text),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
          onTap: (){
            print("Hello World");
          },
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundImage: riconimage(imageName)),
          ),
          // trailing: Icon(Icons.navigate_next),
          iconColor: Colors.white,
          textColor: Colors.white,
          tileColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        ),
      ),
    ),
  );
}
Widget rtcredit(BuildContext context,String text){
  return Center(
    child: Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),

      child: ListTile(
        title: Text(text),
        contentPadding: EdgeInsets.fromLTRB(20.0, 6.0, 30.0, 10.0),
        onTap: (){
          print("Hello World");
        },
        leading: Icon(Icons.credit_card),
        trailing: Icon(Icons.navigate_next),
        iconColor: Colors.white,
        textColor: Colors.white,
        tileColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(90.0)),
      ),
    ),

  );
}
Widget rtcal(BuildContext context,String text,String imageName){
  return Center(
    child: Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
      child: SizedBox(
        width: 160.0,
        height: 100.0,
        child: ListTile(
          title: Text(text),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0.0),
          onTap: () async {
            DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime(3000)
            );
          },
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundImage: riconimage(imageName)),
          ),
          // trailing: Icon(Icons.navigate_next),
          iconColor: Colors.white,
          textColor: Colors.white,
          tileColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        ),
      ),
    ),
  );
}

Widget rapp(BuildContext context,String text,String imageName) {
  return Center(
    child: Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: SizedBox(
        width: 160.0,
        height: 100.0,
        child: ListTile(
          title: Text(text),
          contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 30.0, 0.0),
          onTap: () {
            print("Hello World");
          },
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundImage: riconimage(imageName)),
          ),
          // trailing: Icon(Icons.navigate_next),
          iconColor: Colors.white,
          textColor: Colors.white,
          tileColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0)),
        ),
      ),
    ),
  );
}

Widget textfield({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextCapitalization capitalization,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        textCapitalization: capitalization,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.purple,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: Colors.purple.shade50,
          filled: true,
        ),
      ),
    );
  }