import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController();

  int totalPage = 4;

  void _onScroll() {
    print(_pageController.page);
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          makePage(
            page: 1,
            image: 'assets/images/aquaman.jpg', 
            title: 'Aquaman'),
          makePage(
            page: 2,
            image: 'assets/images/ant-man.jpg', 
            title: 'Ant Man'),
          makePage(
            page: 3,
            image: 'assets/images/batman.jpg', 
            title: 'Batman'),
          makePage(
            page: 4,
            image: 'assets/images/avenger.jpg', 
            title: 'Avengers'),
        ],
      ),
    );
  }

  Widget makePage({image, title, page}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.1, 0.9],
            colors: [
              Colors.black.withOpacity(.9),
              Colors.black.withOpacity(.1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(page.toString(),
                      style: TextStyle(color: Colors.black54, fontSize: 40)),
                  Text('/' + totalPage.toString(),
                      style: TextStyle(color: Colors.black54, fontSize: 15)),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Row(children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Icon(Icons.star, color: Colors.yellow, size: 20),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Icon(Icons.star, color: Colors.yellow, size: 20),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Icon(Icons.star, color: Colors.yellow, size: 20),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Icon(Icons.star, color: Colors.yellow, size: 20),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Icon(Icons.star, color: Colors.grey, size: 20),
                ),
                Text('4.0',
                    style: TextStyle(color: Colors.white70, fontSize: 15)),
                Text(' (120)',
                    style: TextStyle(color: Colors.white70, fontSize: 15)),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
