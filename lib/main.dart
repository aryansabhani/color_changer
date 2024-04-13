import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  List<Color> colorsCode = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.pinkAccent,
  ];

  List isselectcolor = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Color Change App '),
      ),
      backgroundColor: isselectcolor.length == 0 ? Colors.white : isselectcolor[isselectcolor.length - 1],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                  colorsCode.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      // splashFactory: InkRipple.splashFactory,
                      // splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            if (isselectcolor.indexWhere(
                                    (element) => element == colorsCode[index]) ==
                                -1) {
                            isselectcolor.add(colorsCode[index]);
                            }else{
                              isselectcolor.remove(colorsCode[index]);
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            // margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: colorsCode[index],
                                border: Border.all(
                                    width: 2,
                                    color: isselectcolor.indexWhere((element) =>
                                                element == colorsCode[index]) ==
                                            -1
                                        ? colorsCode[index]
                                        : Colors.black)),
                          ),
                        ),
                  )),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
