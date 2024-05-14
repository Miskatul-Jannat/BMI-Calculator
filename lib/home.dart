import 'package:flutter/material.dart';

class ImageBackground extends StatefulWidget {
  const ImageBackground({super.key});

  @override
  State<ImageBackground> createState() => _ImageBackgroundState();
}

class _ImageBackgroundState extends State<ImageBackground> {
  String str = '';
  final h = TextEditingController();
  final w = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "BMI calculator",
          style: TextStyle(fontSize: 30, color: Colors.pink),
        ),
      ),
      body: Stack(children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FittedBox(
                fit: BoxFit.cover, child: Image.asset('images/cal.png'))),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text(
                          'Your weight in KG ',
                        ),
                        hintText: ('Enter your weight'),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5, color: Colors.pink)),
                        border: OutlineInputBorder(),
                      ),
                      controller: w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        label: Text(
                          'Your height in cm ',
                        ),
                        hintText: ('Enter your height'),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 5, color: Colors.pink)),
                        border: OutlineInputBorder(),
                      ),
                      controller: h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        str =
                            '${((double.parse(w.text)) / ((double.parse(h.text) / 100) * (double.parse(h.text) / 100))).toStringAsFixed(3)}';
                      });
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                      child: Text(
                        "Calculate",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    )),
                SizedBox(
                  height: 250,
                ),
                Text(
                  "YOUR BMI",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 5,
                        color: Colors.black,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      str,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
