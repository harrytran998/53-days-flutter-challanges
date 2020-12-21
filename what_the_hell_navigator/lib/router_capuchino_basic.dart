import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoApp(home: HomeScreen(), routes: {
      Screen1.id: (context) => Screen1(),
      Screen2.id: (context) => Screen1(),
      DetailScreen3.id: (context) => DetailScreen3(),
      DetailScreen4.id: (context) => DetailScreen4(),
    });
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book_solid),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.eye_solid),
            label: 'Views',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Page 1 of tab $index'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: const Text('Next page'),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) {
                          return CupertinoPageScaffold(
                            navigationBar: CupertinoNavigationBar(
                              middle: Text('Page 2 of tab $index'),
                            ),
                            child: Center(
                              child: CupertinoButton(
                                child: const Text('Back'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  static const String id = 'screen1';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        heroTag: 'screen1', // a different string for each navigationBar
        transitionBetweenRoutes: false,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen3.id);
        },
        child: Center(
          child: Text(
            'Screen 1',
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  static const String id = 'screen2';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        heroTag: 'screen2', // a different string for each navigationBar
        transitionBetweenRoutes: false,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, DetailScreen4.id);
        },
        child: Center(
          child: Text(
            'Screen 2',
          ),
        ),
      ),
    );
  }
}

class DetailScreen3 extends StatelessWidget {
  static const String id = 'screen3';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        heroTag: 'screen3', // a different string for each navigationBar
        transitionBetweenRoutes: false,
      ),
      child: Center(
        child: Text(
          'terzo schermo',
        ),
      ),
    );
  }
}

class DetailScreen4 extends StatelessWidget {
  static const String id = 'screen4';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        heroTag: 'screen4', // a different string for each navigationBar
        transitionBetweenRoutes: false,
      ),
      child: Center(
        child: Text(
          'ZXCZXCZXC schermo',
        ),
      ),
    );
  }
}
