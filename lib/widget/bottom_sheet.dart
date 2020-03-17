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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextField(
                      // decoration: InputDecoration(
                      //   hintText: "要做点什么"
                      // ),
                      decoration: InputDecoration.collapsed(
                        hintText: "要做点什么",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                    child: TextField(
                      decoration: new InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          hintText: '想要做点什么2？'),
                    ),
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      FlatButton(onPressed: null, child: Text("ADD TASK")),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "想做点什么3 ？"),
                        ),
                      ))
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "description",
                    ),
                  ),
                  FlatButton(
                    child: Text("data"),
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      IconButton(
                        iconSize: 50,
                        color: Colors.tealAccent,
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      });
}
