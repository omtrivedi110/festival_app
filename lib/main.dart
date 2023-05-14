import 'package:festival_app/views/Views/page2.dart';
import 'package:festival_app/views/component/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'page2': (context) => const page2(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffFEE93A),
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Festival Post Maker",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xffFEE93A),
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.yellow,
                  Colors.orange
                  // Color(0xffffa600),
                  // Color(0xffb4846a),
                ]),
          ),
          child: SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 15,
              itemBuilder: (context, index) => Slidable(
                closeOnScroll: true,
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('page2', arguments: index);
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.primaries[index % 18].shade200,
                    foregroundImage: NetworkImage(image[index]),
                    child: Text("${index + 1}"),
                  ),
                  title: Text(
                    names[index],
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
