import 'package:flutter/material.dart';
import 'package:flutter_prac_navigation_bars/pages/one_page.dart';
import 'package:flutter_prac_navigation_bars/pages/three_page.dart';
import 'package:flutter_prac_navigation_bars/pages/two_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Хинкальная',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Хинкальная'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [OnePage(), TwoPage(), ThreePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.contact_phone),
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () => {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Row(
                      children: [
                        Text('Наш телеграмм с новинками: +7(999)999-99-99 '),
                        Icon(
                          Icons.telegram,
                          color: Colors.cyan,
                        )
                      ],
                    ),
                  ))
                },
                value: 1,
                child: const Text('Telegram'),
              ),
              PopupMenuItem(
                onTap: () async {
                  final bool? result = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Instagram: @hinkalinew'),
                                  ),
                                );
                              },
                              child: const Text('Узнать')),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context, rootNavigator: true)
                                    .pop(false);
                              },
                              child: const Text('Отмена'))
                        ],
                        content: const Text('Новинки там'),
                        title: const Text('Инстаграм'),
                      );
                    },
                  );
                  result ?? false ? print(result) : print(result);
                },
                value: 2,
                child: const Text("Instagram"),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.logout),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant), label: "Ресторан"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Место"),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: "Еще"),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.cyan,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text("Ресторан"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _navigateTo(0);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text("Место"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _navigateTo(1);
              },
            ),
            ListTile(
              leading: const Icon(Icons.more),
              title: const Text("Еще"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                _navigateTo(2);
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
    );
  }

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
