import 'dart:math';

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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  final scrollCtrl = ScrollController();

  @override
  void initState() {
    scrollCtrl.addListener(
      () {
        setState(() {});
        print((100 * scrollCtrl.position.pixels) /
            (pow(scrollCtrl.position.pixels, 1) + 100));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 200)),
              builder: (context, snapshot) => AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                color: Colors.red,
                width: MediaQuery.sizeOf(context).width,
                height: 100 -
                    (100 * scrollCtrl.position.pixels) /
                        (pow(scrollCtrl.position.pixels, 1) + 100),
              ),
            ),
            Container(
              color: Colors.green,
              width: MediaQuery.sizeOf(context).width,
              height: 50,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollCtrl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.amber,
                        height: 200,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      Container(
                        color: Colors.black,
                        height: 200,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      Container(
                        color: Colors.blue,
                        height: 200,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      Container(
                        color: Colors.orange,
                        height: 200,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      Container(
                        color: Colors.yellow,
                        height: 200,
                        width: MediaQuery.sizeOf(context).width,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
