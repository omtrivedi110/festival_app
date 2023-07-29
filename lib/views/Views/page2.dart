import 'dart:io';
import 'dart:ui';

import 'package:festival_app/views/component/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../component/backbutton.dart';

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  int sloagnin = 0;
  GlobalKey imageKey = GlobalKey();
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Mybackicon(),
        title: const Text("Festival Post Maker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            RepaintBoundary(
              key: imageKey,
              child: Stack(alignment: Alignment.center, children: [
                SizedBox(
                  width: s.width,
                  child: Opacity(
                    opacity: 0.5,
                    child: Image.network(
                      image[index],
                      filterQuality: FilterQuality.low,
                    ),
                  ),
                ),
                Text(
                  Slogans[sloagnin],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    sloagnin = 0;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: s.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black54)),
                    width: s.width * 0.4,
                    child: Text(
                      Slogans[0],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    sloagnin = 1;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: s.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black54)),
                    width: s.width * 0.4,
                    child: Text(
                      Slogans[1],
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    sloagnin = 2;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: s.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black54)),
                    width: s.width * 0.4,
                    child: Text(
                      Slogans[2],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    sloagnin = 3;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: s.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black54)),
                    width: s.width * 0.4,
                    child: Text(
                      Slogans[3],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    sloagnin = 4;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: s.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black54)),
                    width: s.width * 0.4,
                    child: Text(
                      Slogans[4],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    sloagnin = 5;
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: s.height * 0.07,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black54)),
                    width: s.width * 0.4,
                    child: Text(
                      Slogans[5],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          RenderRepaintBoundary bountry = imageKey.currentContext!
              .findRenderObject() as RenderRepaintBoundary;
          var img = await bountry.toImage(
            pixelRatio: 5,
          );
          var bit = await img.toByteData(format: ImageByteFormat.png);
          var uList = bit!.buffer.asUint8List();

          if (uList != null) {
            Directory dir = await getApplicationDocumentsDirectory();

            DateTime d = DateTime.now();
            File file = await File(
                    "${dir.path}/FA${d.year}${d.month}${d.day}${d.hour}${d.minute}${d.second}.png")
                .create();
            await file.writeAsBytes(uList);

            Share.shareXFiles([XFile(file.path)]);
          }
          setState(() {});
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}
