import 'package:flutter/material.dart';
import 'package:flutter_assignment_shubhangi/Common_Widgets/elevated_button.dart';
import 'package:flutter_assignment_shubhangi/Models/cart_items.dart';
import 'package:flutter_assignment_shubhangi/Screens/LogInPage/login_page.dart';
import 'package:flutter_assignment_shubhangi/Services/auth_service.dart';
import 'package:flutter_assignment_shubhangi/Services/cart_db_service.dart';
import 'package:flutter_assignment_shubhangi/Utilities/shared_pref.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailsPage extends StatefulWidget {
  final String orderId;
  const OrderDetailsPage({required this.orderId, Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  String userName = '';
  String emailId = '';
  @override
  void initState() {
    getUserDetailsFromSP();
    super.initState();
  }

  void getUserDetailsFromSP() async {
    Map userDetails = await CustomSharedPref.getUserDetails();
    if (userDetails['EmailId'] != '') {
      userName = userDetails['UserName'];
      emailId = userDetails['EmailId'];
    }
    setState(() {});
  }

  TextStyle customStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [Text('User Name: ', style: customStyle), Text(userName, style: customStyle)],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [Text('Email Id: ', style: customStyle), Text(emailId, style: customStyle)],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('Order Status: Confirmed', style: customStyle),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('Your OrderId is: \n${widget.orderId}',
                    maxLines: 2, overflow: TextOverflow.clip, style: customStyle),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('Product List Page'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundedElevatedButton(
            title: 'Log Out',
            onPressed: () async {
              AuthService.signOut();
              final SharedPreferences _prefs = await SharedPreferences.getInstance();
              _prefs.clear();
              Get.offAll(LogInPage());
            },
          ),
        )
      ],
    );
  }
}
