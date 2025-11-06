import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ResponsiveHome(),
    );
  }
}

class ResponsiveHome extends StatelessWidget {
  const ResponsiveHome({super.key});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, size) {
          bool isMobile = size.maxWidth < 600; // breakpoint for mobile
          return Column(
            children: [
              Container(
                color: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Design",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    if (!isMobile)
                      Row(
                        children: _menuItems(),
                      )
                    else
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        itemBuilder: (context) => _menuItems()
                            .map((item) => PopupMenuItem(
                                  value: item.label,
                                  child: Text(item.label),
                                ))
                            .toList(),
                      )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1500534623283-312aade485b7'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Welcome to the Home Page!",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  List<_MenuItem> _menuItems() => [
        _MenuItem("HOME"),
        _MenuItem("ABOUT"),
        _MenuItem("SERVICES"),
        _MenuItem("CONTACT"),
        _MenuItem("FEEDBACK"),
      ];
}

class _MenuItem {
  final String label;
  const _MenuItem(this.label);
}
