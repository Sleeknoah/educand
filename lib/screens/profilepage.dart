import 'package:educand/values/colors.dart';
import 'package:educand/widgets/submitbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String photo = "";
  String fName;
  String lName;
  var username = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var name = TextEditingController();
  var school = TextEditingController();
  var state = TextEditingController();
  var rank = TextEditingController();
  var testTaken = TextEditingController();
  var score = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      photo = preferences.getString("photo") ?? '';
      name.text = preferences.getString("full_name");
      username.text = preferences.getString("user_name");
      email.text = preferences.getString("email");
      phone.text = preferences.getString("phone");
      school.text = preferences.getString("class") ?? "";
      state.text = preferences.getString("class") ?? "";
      rank.text = preferences.getString("rank");
      testTaken.text = preferences.getString("test_taken") ?? "";
      score.text = preferences.getString("score") ?? "";
      fName = preferences.getString("first_name").split("")[0];
      lName = preferences.getString("last_name").split("")[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: c8,
      appBar: AppBar(
        backgroundColor: c8,
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: c8,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  width: double.infinity,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20.0,
                  ),
                  topRight: Radius.circular(
                    20.0,
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    width: double.infinity,
                  ),
                  Align(
                    alignment: Alignment(
                      0.0,
                      1.5,
                    ),
                    heightFactor: 0.0,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: c2,
                      child: Text(
                        "${fName}${lName}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      backgroundImage:
                          NetworkImage('https://ipsm.org.ng/educand/{$photo}'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: false,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFFB100),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        labelText: 'Fullname',
                        labelStyle: TextStyle(
                          color: Color(0xFFFFB100),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 16.0,
                        ),
                      ),
                      controller: name,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 2.0,
                        color: Color(0xFF515151),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: false,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFFB100),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Color(0xFFFFB100),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 16.0,
                        ),
                      ),
                      controller: username,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 2.0,
                        color: Color(0xFF515151),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: false,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFFB100),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xFFFFB100),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 16.0,
                        ),
                      ),
                      enabled: false,
                      controller: email,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 2.0,
                        color: Color(0xFF515151),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: false,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFFB100),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                          color: Color(0xFFFFB100),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 16.0,
                        ),
                      ),
                      controller: phone,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 2.0,
                        color: Color(0xFF515151),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: false,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFFFB100),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        labelText: 'State',
                        labelStyle: TextStyle(
                          color: Color(0xFFFFB100),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 14.0,
                          horizontal: 16.0,
                        ),
                      ),
                      controller: state,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 2.0,
                        color: Color(0xFF515151),
                      ),
                    ),
                  ),
                  SubmitButton(
                    act: () async {
                      if (name.text != null && username.text != null) {
                        _showDialog();

                        Map userProfile =
                            await FlutterSession().get("userProfile");

                        http.Response response = await http.post(
                            'https://ozmites.com/educand/set_profile.php',
                            body: {
                              'fullname': name.text,
                              'username': username.text,
                              'email': userProfile["email"],
                              'phone': phone.text,
                              'password': userProfile["password"],
                              'score': userProfile["score"],
                              'rank': userProfile["rank"],
                              'total_tests': userProfile["total_tests"]
                            });
                        if (response.statusCode == 200) {
                          print(response.body);
                          if (response.body == "success") {
                            Navigator.of(context).pop();
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.setString("phone", phone.text);
                            _showSuccessDialog("Changes Saved Successfully!");
                          }
                          http.Response response2 = await http.post(
                              'https://ozmites.com/educand/get_profile.php',
                              body: {
                                'username': username.text,
                              });

                          await FlutterSession()
                              .set("userProfile", response2.body);
                        } else {
                          print(
                              'Request failed with status: ${response.statusCode}.');
                          Navigator.of(context).pop();
                          _showErrorDialog("Connection Error!");
                        }
                      } else {
                        _showErrorDialog("Incomplete Details!");
                      }
                    },
                    title: "SAVE CHANGES",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showSuccessDialog(String text) {
    showDialog(
      context: context,
      // ignore: deprecated_member_use
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        content: Container(
          height: MediaQuery.of(context).size.height / 3.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                size: 66,
                color: Color(0xFF10CA88),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text("Successful!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: new Container(
                height: MediaQuery.of(context).size.height / 12.0,
                child: Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Image.asset(
                        'assets/images/loading.gif',
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        "Processing ...",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ]),
              ),
            ));
  }

  _showErrorDialog(String text) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: new Container(
                height: MediaQuery.of(context).size.height / 12.0,
                child: Row(children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.error,
                      size: 60,
                      color: Colors.redAccent,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: 15, left: 15),
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ]),
              ),
            ));
  }

  Future<Map> userProfile() async {
    Map userProfile = await FlutterSession().get("userProfile");
    return userProfile;
  }
}
