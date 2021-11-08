import 'package:educand/screens/spacers.dart';
import 'package:educand/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhrasematchLibrary extends StatefulWidget {
  @override
  _PhrasematchLibraryState createState() => _PhrasematchLibraryState();
}

class _PhrasematchLibraryState extends State<PhrasematchLibrary> {
  TextEditingController fnController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Resource Library",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        elevation: 5.0,
        centerTitle: false,
        titleSpacing: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Texts for the week",
                      style: TextStyle(
                          fontSize: 22.5,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins'),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 24.0,
                      left: 0.0,
                    ),
                    child: Container(
                      height: 140.0,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                            ),
                            child: InkWell(
                              onTap: () async {
                                // remember to change this url.
                                const url =
                                    "https://zelalemkibret.files.wordpress.com/2012/01/the-autobiography-of-nelson-mandela.pdf";
                                if (await canLaunch(url))
                                  await launch(url);
                                else
                                  throw "Could not launch $url";
                                // log("wrong??");
                                // setState(() => isOpened = !isOpened);
                              },
                              child: Container(
                                height: 200,
                                child: Stack(
                                  // crossAxisAlignment: CrossAxisAlignmeßßnt.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 290,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/${i % 2 == 0 ? 'Mandela-jumbo@3x' : 'WAA_mandela_nelson_mandela@3x'}.png"),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Spacer(),
                                          Container(
                                            width: 290,
                                            child: Text(
                                                "${i % 2 == 0 ? 'Long Walk To Freedom' : i == 3 ? 'Tale Of An African Hero' : "Conversations with Myself"}",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            width: 290,
                                            child: Text(
                                              ('Nelson Mandela'),
                                              style: TextStyle(
                                                fontSize: 13.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Ymargin(x: 14),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: InkWell(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Coming soon',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                  Xmargin(x: 8.0),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_outlined,
                                                    color: Colors.red,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Ymargin(x: 20),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.78,
                    ),
                    itemCount: 6,
                    controller: new ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width / 2.168,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 12.0),
                          child: InkWell(
                            onTap: () {
                              // setState(() => isOpened = !isOpened);
                              // Navigator.push(
                              //   context,
                              //   PageTransition(
                              //     type: PageTransitionType.fade,
                              //     child: CHome(),
                              //   ),
                              // );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      color: index % 3 == 0
                                          ? c2
                                          : index % 3 == 1
                                              ? c5
                                              : c9,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Conversation with Myself",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'),
                                  ),
                                ),
                                Text(
                                  ('Nelson Mandela'),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Container(
          //   padding: EdgeInsets.all(10),
          //   margin: EdgeInsets.only(top: 10),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: const BorderRadius.all(
          //       Radius.circular(10.0),
          //     ),
          //   ),
          //   child: Row(children: <Widget>[
          //     Column(
          //       children: <Widget>[
          //         Container(
          //           padding: EdgeInsets.all(10),
          //           width: MediaQuery.of(context).size.width / 4.0,
          //           child: Image.asset('assets/images/mandela.jpg'),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: <Widget>[
          //         Text(
          //           "Long Walk To Freedom",
          //           textAlign: TextAlign.left,
          //           style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 12,
          //             fontWeight: FontWeight.bold,
          //             fontFamily: 'Ubuntu',
          //           ),
          //         ),
          //         Text(
          //           "Nelson Mandela",
          //           textAlign: TextAlign.left,
          //           style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 13,
          //             fontWeight: FontWeight.normal,
          //             fontFamily: 'Ubuntu',
          //           ),
          //         ),
          //         FlatButton(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(4.0),
          //           ),
          //           color: Theme.of(context).primaryColor,
          //           onPressed: () async {
          //             const url =
          //                 "https://zelalemkibret.files.wordpress.com/2012/01/the-autobiography-of-nelson-mandela.pdf";
          //             if (await canLaunch(url))
          //               await launch(url);
          //             else
          //               throw "Could not launch $url";
          //           },
          //           child: Text(
          //             "DOWNLOAD NOW",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 10.0,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ]),
          // ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   margin: EdgeInsets.only(top: 20),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: const BorderRadius.all(
          //       Radius.circular(10.0),
          //     ),
          //   ),
          //   child: Row(children: <Widget>[
          //     Column(
          //       children: <Widget>[
          //         Container(
          //           padding: EdgeInsets.all(10),
          //           width: MediaQuery.of(context).size.width / 4.0,
          //           child: Image.asset('assets/images/mandela.jpg'),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: <Widget>[
          //         Text(
          //           "Tale Of An African Hero",
          //           textAlign: TextAlign.left,
          //           style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 12,
          //             fontWeight: FontWeight.bold,
          //             fontFamily: 'Ubuntu',
          //           ),
          //         ),
          //         Text(
          //           "Nelson Mandela",
          //           textAlign: TextAlign.left,
          //           style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 13,
          //             fontWeight: FontWeight.normal,
          //             fontFamily: 'Ubuntu',
          //           ),
          //         ),
          //         FlatButton(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(4.0),
          //           ),
          //           color: Theme.of(context).primaryColor,
          //           onPressed: () async {
          //             const url =
          //                 "https://zelalemkibret.files.wordpress.com/2012/01/the-autobiography-of-nelson-mandela.pdf";
          //             if (await canLaunch(url))
          //               await launch(url);
          //             else
          //               throw "Could not launch $url";
          //           },
          //           child: Text(
          //             "DOWNLOAD NOW",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 10.0,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ]),
          // ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   margin: EdgeInsets.only(top: 20),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: const BorderRadius.all(
          //       Radius.circular(10.0),
          //     ),
          //   ),
          //   child: Row(children: <Widget>[
          //     Column(
          //       children: <Widget>[
          //         Container(
          //           decoration: BoxDecoration(
          //             borderRadius: const BorderRadius.all(
          //               Radius.circular(30.0),
          //             ),
          //           ),
          //           padding: EdgeInsets.all(10),
          //           width: MediaQuery.of(context).size.width / 4.0,
          //           child: Image.asset('assets/images/mandela2.jpg'),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: <Widget>[
          //         Text(
          //           "Conversations with Myself",
          //           textAlign: TextAlign.left,
          //           style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 12,
          //             fontWeight: FontWeight.bold,
          //             fontFamily: 'Ubuntu',
          //           ),
          //         ),
          //         Text(
          //           "Nelson Mandela",
          //           textAlign: TextAlign.left,
          //           style: TextStyle(
          //             color: Colors.grey,
          //             fontSize: 13,
          //             fontWeight: FontWeight.normal,
          //             fontFamily: 'Ubuntu',
          //           ),
          //         ),
          //         FlatButton(
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(4.0),
          //           ),
          //           color: Theme.of(context).primaryColor,
          //           onPressed: () async {
          //             const url =
          //                 "https://zelalemkibret.files.wordpress.com/2012/01/the-autobiography-of-nelson-mandela.pdf";
          //             if (await canLaunch(url))
          //               await launch(url);
          //             else
          //               throw "Could not launch $url";
          //           },
          //           child: Text(
          //             "DOWNLOAD NOW",
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontSize: 10.0,
          //                 fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ]),
          // ),
        ),
      ),
    );
  }
}
