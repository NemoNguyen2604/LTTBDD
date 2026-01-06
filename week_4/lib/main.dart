import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: ComponentListScreen(),
    );
  }
}

/// =======================
/// HOME – UI COMPONENT LIST
/// =======================
class ComponentListScreen extends StatelessWidget {
  Widget item(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UI Components List")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            item(context, "Text", TextScreen()),
            item(context, "Image", ImageScreen()),
            item(context, "TextField", TextFieldScreen()),
            item(context, "Row & Column", LayoutScreen()),
            item(context, "Button", ButtonScreen()),
            item(context, "Icon", IconScreen()),
            item(context, "ListView", ListViewScreen()),
            item(context, "Card", CardScreen()),
            item(context, "Switch", SwitchScreen()),
            item(context, "Checkbox", CheckboxScreen()),
            item(context, "Slider", SliderScreen()),
            item(context, "Dialog", DialogScreen()),
            item(context, "Snackbar", SnackbarScreen()),
            item(context, "Progress Indicator", ProgressScreen()),
            item(context, "DropdownButton", DropdownScreen()),
            item(context, "TabBar", TabBarScreen()),
            item(context, "GridView", GridViewScreen()),
            item(context, "Stack", StackScreen()),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// SCREENS
/// =======================
class TextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text")),
      body: Center(
        child: Text(
          "Hello Flutter",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image")),
      body: Center(
        child: Image.asset("assets/images/uth1.jpg", width: 200),
      ),
    );
  }
}

class TextFieldScreen extends StatefulWidget {
  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TextField")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Enter text"),
              onChanged: (v) => setState(() => value = v),
            ),
            SizedBox(height: 10),
            Text(value),
          ],
        ),
      ),
    );
  }
}

class LayoutScreen extends StatelessWidget {
  Widget box(Color c) =>
      Container(width: 60, height: 40, margin: EdgeInsets.all(6), color: c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row & Column")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [box(Colors.red), box(Colors.green), box(Colors.blue)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                box(Colors.orange),
                box(Colors.purple),
                box(Colors.teal)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: Text("Press me"),
        ),
      ),
    );
  }
}

class IconScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Icon")),
      body: Center(
        child: Icon(Icons.favorite, size: 60, color: Colors.red),
      ),
    );
  }
}

class ListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView")),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, i) => ListTile(
          leading: Icon(Icons.star),
          title: Text("Item ${i + 1}"),
        ),
      ),
    );
  }
}

class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card")),
      body: Center(
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text("This is a Card"),
          ),
        ),
      ),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Switch")),
      body: Center(
        child: Switch(
          value: value,
          onChanged: (v) => setState(() => value = v),
        ),
      ),
    );
  }
}

class CheckboxScreen extends StatefulWidget {
  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkbox")),
      body: Center(
        child: Checkbox(
          value: checked,
          onChanged: (v) => setState(() => checked = v ?? false),
        ),
      ),
    );
  }
}

class SliderScreen extends StatefulWidget {
  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double value = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Slider")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: value,
            min: 0,
            max: 100,
            onChanged: (v) => setState(() => value = v),
          ),
          Text("Value: ${value.toInt()}"),
        ],
      ),
    );
  }
}

class DialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dialog")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Hello"),
                content: Text("This is a dialog"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("OK"),
                  )
                ],
              ),
            );
          },
          child: Text("Show Dialog"),
        ),
      ),
    );
  }
}

class SnackbarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Snackbar")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Hello Snackbar")),
            );
          },
          child: Text("Show Snackbar"),
        ),
      ),
    );
  }
}

class ProgressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Progress Indicator")),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class DropdownScreen extends StatefulWidget {
  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  String value = "One";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dropdown")),
      body: Center(
        child: DropdownButton<String>(
          value: value,
          items: ["One", "Two", "Three"]
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => setState(() => value = v!),
        ),
      ),
    );
  }
}

class TabBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TabBar"),
          bottom: TabBar(tabs: [
            Tab(text: "Tab 1"),
            Tab(text: "Tab 2"),
          ]),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Tab 1 content")),
            Center(child: Text("Tab 2 content")),
          ],
        ),
      ),
    );
  }
}

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView")),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          6,
          (i) => Card(
            color: Colors.blue.shade100,
            child: Center(child: Text("Item ${i + 1}")),
          ),
        ),
      ),
    );
  }
}

class StackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stack")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 200, height: 200, color: Colors.blue),
            Container(width: 120, height: 120, color: Colors.white),
            Text("Stack"),
          ],
        ),
      ),
    );
  }
}
