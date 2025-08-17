import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

// Mutatable - Changeable
// Immutable - Static

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int count = 0;
  final TextEditingController _textEditingController = TextEditingController();

  // Important
  @override
  void initState() {
    super.initState();
    print('Called initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  Widget build(BuildContext context) {
    print('Build method');
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          children: [
            Text('$count'),
            TextButton(
              onPressed: () {
                count++;
                print(count);
                setState(() {});
              },
              child: Text('Increment'),
            ),
            TextButton(
              onPressed: () {
                count--;
                print(count);
                setState(() {});
              },
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    print('deactive');
    super.deactivate();
  }

  // Important
  @override
  void dispose() {
    _textEditingController.dispose();
    print('dispose');
    super.dispose();
  }
}
