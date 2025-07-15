import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pop Cat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PopCatPage(),
    );
  }
}

class PopCatPage extends StatefulWidget {
  const PopCatPage({super.key});

  @override
  State<PopCatPage> createState() => _PopCatPageState();
}

class _PopCatPageState extends State<PopCatPage> {
  int _popCount = 0;
  bool _isPopping = false;

  void _popCat() {
    setState(() {
      _isPopping = true;
      _popCount++;
    });
    Future.delayed(const Duration(milliseconds: 120), () {
      setState(() {
        _isPopping = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pop Cat'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _popCat,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 120),
                width: _isPopping ? 220 : 200,
                height: _isPopping ? 220 : 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/yay.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Pops: $_popCount',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            const Text('Tap the cat to pop!'),
          ],
        ),
      ),
    );
  }
}
