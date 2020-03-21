import 'package:flutter/material.dart';

Future buildShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Column(
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: TextField(
                  //     // decoration: InputDecoration(
                  //     //   hintText: "要做点什么"
                  //     // ),
                  //     decoration: InputDecoration.collapsed(
                  //       hintText: "要做点什么",
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.all(10.0),
                  //   decoration: BoxDecoration(
                  //     color: Colors.tealAccent,
                  //     borderRadius: BorderRadius.all(Radius.circular(32)),
                  //   ),
                  //   child: TextField(
                  //     decoration: new InputDecoration(
                  //         suffixIcon: IconButton(
                  //           onPressed: () {},
                  //           icon: Icon(Icons.add),
                  //         ),
                  //         border: InputBorder.none,
                  //         focusedBorder: InputBorder.none,
                  //         contentPadding: EdgeInsets.only(
                  //             left: 15, bottom: 11, top: 11, right: 15),
                  //         hintText: '想要做点什么2？'),
                  //   ),
                  // ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      FlatButton(onPressed: () {}, child: Text("添加任务")),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "准备做什么"),
                        ),
                      ))
                    ],
                  ),

                  Row(textDirection: TextDirection.rtl, children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "任务描述",
                          hintStyle:
                              TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ),
                    ))
                  ]),

                  Divider(
                    height: 1.0,
                    color: Colors.red,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          splashColor: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text("今天"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          splashColor: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {},
                          child: Text("明天"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: RaisedButton(
                          shape: StadiumBorder(),
                          color: Colors.blue,
                          splashColor: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () async {
                            final DateTime pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1970),
                                lastDate: DateTime(2070),
                                );
                          },
                          child: Text("选择日期"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0)
                  // Row(
                  //   textDirection: TextDirection.rtl,
                  //   children: <Widget>[
                  //     Expanded(
                  //       child: Padding(
                  //       padding: const EdgeInsets.only(left: 15.0),
                  //       child: TextField(
                  //         decoration: InputDecoration(
                  //             border: InputBorder.none, hintText: "准备做什么"),
                  //       ),
                  //     ))
                  //   ],
                  // ),

                  // TextField(
                  //   decoration: InputDecoration(
                  //     hintText: "任务描述",
                  //     hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                  //     border: InputBorder.none
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      });
}
