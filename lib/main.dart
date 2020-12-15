import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Text("TabBar without left padding because there is no padding argument"),
            Container(
              height: kToolbarHeight,
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.lightBlue,
                labelColor: Colors.lightBlue,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabs: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((v) {
                  return Tab(text: "Tab $v");
                }).toList(),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Text("TabBar with left padding in a container"),
            Container(
              height: kToolbarHeight,
              padding: EdgeInsets.only(left: 16),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.lightBlue,
                labelColor: Colors.lightBlue,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabs: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((v) {
                  return Tab(text: "Tab $v");
                }).toList(),
              ),
            ),
            SizedBox(
              height: 48,
            ),
            Text("Grid View with left padding. Grid items overflowed the padding value when grid was dragged."),
            Container(
              height: 100,
              child: GridView.count(
                crossAxisCount: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((v) {
                  return Container(
                      color: Colors.red[100],
                      width: 100,
                      height: 100,
                      child: Text("Item $v"));
                }).toList(),
              ),
            )
          ],
        ));
  }
}
