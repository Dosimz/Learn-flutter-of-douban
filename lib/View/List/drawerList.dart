import 'package:flutter/material.dart';
class HomeBuilder {
  static Widget homeDrawer(){
    return new ListView(
      padding: const EdgeInsets.only(), children: <Widget>[
      _drawerHeader(),
      new ClipRect(
        child: new ListTile(
          leading: CircleAvatar(child: new Text('Y'), backgroundColor: Color.fromRGBO(189, 189, 189, 1),),
          title: new Text('Drawer item A'),
          onTap: () => {},
        ),
      ),
      new ListTile(
        leading: CircleAvatar(child: new Text('U'), backgroundColor: Color.fromRGBO(189, 189, 189, 1),),
        title: new Text('Drawer item B'),
        onTap: () => {},
      ),
      new ListTile(
        leading: new Icon(Icons.settings, color: Color.fromRGBO(117, 117, 117, 1),),
        title: new Text('Setting'),
        onTap: () => {},
      ),
      new AboutListTile(
        icon: Icon(Icons.tag_faces, color: Color.fromRGBO(117, 117, 117, 1),),
        child: new Text("About"),
        applicationName: '影榜',
        applicationVersion: '1.0',
        applicationIcon: new Image.asset("images/dog.gif",
        width: 64.0,
        height: 64.0,
        ), 
        applicationLegalese: '法律信息',
        aboutBoxChildren: <Widget>[
          new Text('这里暂时没有东西'),
          new Text('这里暂时没有东西')
        ],
      ),
    ],);
  }

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Color.fromRGBO(97, 97, 97, 0.9)),
      accountName: new Text("余漪", style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 4, color: Colors.white),),
      accountEmail: new Text("vhzix24@gmail.com", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15, letterSpacing: 1, color: Colors.white)),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new AssetImage('images/timg.jpg'),
      ),
      onDetailsPressed: () {},
      otherAccountsPictures: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage('images/othertimg.jpg'),
        )
      ],
    );
  }
}

