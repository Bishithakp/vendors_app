import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vendors_app/repo/sharedpreferencehelper.dart';

import '../view_model/stationery_controller.dart';
import '../widget/custom_button.dart';

class HomePage extends StatelessWidget {
  final String value;
  const HomePage({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Consumer<StationeryController>(
      builder: (_, mod, __) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Pen Vendor for Stationary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  headings(heading: 'Particulars'),
                  SizedBox(width: 60),
                  headings(heading: 'Inventory in Subhashs stationary'),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  headings(heading: value + ' Status'),
                  SizedBox(width: 60),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("subhashdata")
                          .doc("PtKyrwfneDasWwmBO8Vi")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Text('Something went wrong..');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Text(
                            'No Data...',
                          );
                        } else {
                          String output = "";
                          if (value == 'pen') {
                          
                            output = snapshot.data!['penstatus'];
                             return Text(output);
                            
                          }
                          if (value == 'pencil') {
                            output = snapshot.data!['pencilstatus'];
                             return Text(output);
                          } else {
                            output = snapshot.data!['bookstatus'];
                             return Text(output);
                          }
                         
                        }
                      })
                ]),
                CustomButton(
                  label: 'Log Out',
                  onTap: () {
                    Navigator.pop(context);
                    SharedPreferncesHelper().setUserValue(value:'' );
                  },
                )
              ],
            ),
          ),
        ));
      },
    );
  }

  Text headings({required String heading}) {
    return Text(
      heading,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
