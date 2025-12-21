import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

/// =======================
/// APP ROOT
/// =======================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const MainScreen(),
    );
  }
}

/// =======================
/// OOP MODELS
/// =======================
class User {
  String name;
  User(this.name);
}

class Book {
  String title;
  bool isBorrowed;

  Book({required this.title, this.isBorrowed = false});
}

/// =======================
/// MAIN SCREEN (BOTTOM NAV)
// =======================
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  User currentUser = User("Nguyen Van A");

  final List<Book> books = [Book(title: "Sách 01"), Book(title: "Sách 02")];

  void addBook(String title) {
    setState(() {
      books.add(Book(title: title));
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      ManageScreen(
        user: currentUser,
        books: books,
        onUserChange: (name) {
          setState(() {
            currentUser.name = name;
          });
        },
      ),
      BookListScreen(books: books, onAddBook: addBook),
      UserScreen(
        user: currentUser,
        onChangeUser: (name) {
          setState(() {
            currentUser.name = name;
          });
        },
      ),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Quản lý"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "DS Sách"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Nhân viên"),
        ],
      ),
    );
  }
}

/// =======================
/// SCREEN 1 – QUẢN LÝ
/// =======================
class ManageScreen extends StatelessWidget {
  final User user;
  final List<Book> books;
  final Function(String) onUserChange;

  const ManageScreen({
    super.key,
    required this.user,
    required this.books,
    required this.onUserChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hệ thống Quản lý Thư viện"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nhân viên: ${user.name}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text("Danh sách sách"),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: books.map((book) {
                  return CheckboxListTile(
                    value: book.isBorrowed,
                    title: Text(book.title),
                    subtitle: Text(book.isBorrowed ? "Đã mượn" : "Chưa mượn"),
                    onChanged: (value) {
                      book.isBorrowed = value ?? false;
                      (context as Element).markNeedsBuild();
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// SCREEN 2 – DANH SÁCH SÁCH
/// =======================
class BookListScreen extends StatelessWidget {
  final List<Book> books;
  final Function(String) onAddBook;

  const BookListScreen({
    super.key,
    required this.books,
    required this.onAddBook,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh sách sách")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.book),
                    title: Text(books[index].title),
                    trailing: Text(books[index].isBorrowed ? "Đã mượn" : "Còn"),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final controller = TextEditingController();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Thêm sách"),
                    content: TextField(
                      controller: controller,
                      decoration: const InputDecoration(labelText: "Tên sách"),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Hủy"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.text.isNotEmpty) {
                            onAddBook(controller.text);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text("Thêm"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Thêm sách"),
            ),
          ],
        ),
      ),
    );
  }
}

/// =======================
/// SCREEN 3 – NHÂN VIÊN
/// =======================
class UserScreen extends StatelessWidget {
  final User user;
  final Function(String) onChangeUser;

  const UserScreen({super.key, required this.user, required this.onChangeUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nhân viên")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Tên hiện tại: ${user.name}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final controller = TextEditingController(text: user.name);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Đổi nhân viên"),
                    content: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        labelText: "Tên nhân viên",
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Hủy"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          onChangeUser(controller.text);
                          Navigator.pop(context);
                        },
                        child: const Text("Lưu"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Đổi nhân viên"),
            ),
          ],
        ),
      ),
    );
  }
}
