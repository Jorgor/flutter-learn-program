import 'package:flutter/material.dart';
import 'chat/message_page.dart';
import './contacts/contacts.dart';
import './persional/personal.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  var _index = 0;
  MessagePage message;
  Contacts contacts;
  Personal me;
  currentPage() {
    switch (_index) {
      case 0:
        if (message == null) {
          message = new MessagePage();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = new Contacts();
        }
        return contacts;
      case 2:
        if (me == null) {
          me = new Personal();
        }
        return me;
      default:
    }
  }

  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
      child: Row(
        children: <Widget>[
          imagePath != null
              ? Image.asset(
                  imagePath,
                  width: 32.0,
                  height: 32.0,
                )
              : SizedBox(
                  width: 32.0,
                  height: 32.0,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('即时通讯'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(500, 76, 10, 0),
                  items: <PopupMenuEntry>[
                    _popupMenuItem('发起会话',
                        imagePath: 'images/icon_menu_group.png'),
                    _popupMenuItem('添加好友',
                        imagePath: 'images/icon_menu_addfriend.png'),
                    _popupMenuItem('联系客服', icon: Icons.person),
                  ],
                );
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        onTap: ((index) {
          setState(() {
            _index = index;
          });
        }),
        items: [
          new BottomNavigationBarItem(
              title: Text(
                '聊天',
                style: TextStyle(
                    color: _index == 0 ? Color(0xFF46c01b) : Color(0xff999999)),
              ),
              icon: _index == 0
                  ? Image.asset(
                      'images/message_pressed.png',
                      width: 32.0,
                      height: 28,
                    )
                  : Image.asset(
                      'images/message_normal.png',
                      width: 32,
                      height: 28,
                    )),
          new BottomNavigationBarItem(
              title: Text(
                '好友',
                style: TextStyle(
                    color: _index == 1 ? Color(0xFF46c01b) : Color(0xff999999)),
              ),
              icon: _index == 1
                  ? Image.asset(
                      'images/contact_list_pressed.png',
                      width: 32.0,
                      height: 28,
                    )
                  : Image.asset(
                      'images/message_normal.png',
                      width: 32,
                      height: 28,
                    )),
          new BottomNavigationBarItem(
              title: Text(
                '我的',
                style: TextStyle(
                    color: _index == 2 ? Color(0xFF46c01b) : Color(0xff999999)),
              ),
              icon: _index == 2
                  ? Image.asset(
                      'images/profile_pressed.png',
                      width: 32.0,
                      height: 28,
                    )
                  : Image.asset(
                      'images/profile_normal.png',
                      width: 32,
                      height: 28,
                    )),
        ],
      ),
      body: currentPage(),
    );
  }
}
