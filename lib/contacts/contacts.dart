import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/contacts/contact_item.dart';
import './contact_sider_list.dart';
import './contact_header.dart';
import './contact_vo.dart';

class Contacts extends StatefulWidget {
  @override
  ContactState createState() => new ContactState();
}

class ContactState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactSiderList(
        items: contactData,
        headerBuilder: (BuildContext context, int index) {
          return Container(
            child: ContactHeader(),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.centerLeft,
            child: ContactItem(
              item: contactData[index],
            ),
          );
        },
        sectionBuilder: (BuildContext context, int index) {
          return Container(
            height: 32,
            padding: const EdgeInsets.only(left: 14),
            color: Colors.grey,
            alignment: Alignment.centerLeft,
            child: Text(
              contactData[index].seationKey,
              style: TextStyle(fontSize: 14, color: Color(0xff909090)),
            ),
          );
        },
      ),
    );
  }
}
