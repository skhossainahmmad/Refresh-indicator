import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Refresh Indicator",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Use a List instead of a Set
  List<Map<String, String>> languages = [
    {
      'language_name': "Python",
      'description':
          "Python is widely regarded as a programming language that's easy to learn, due to its simple syntax, a large library of standards and toolkits, and integration with other popular programming languages such as C and C++."
    },
    {
      'language_name': "JavaScript",
      'description':
          "JavaScript is the most popular programming language for building interactive websites."
    },
    {
      'language_name': "Java",
      'description':
          "Java is the programming language most commonly associated with the development of client-server applications, which are used by large businesses around the world."
    },
    {
      'language_name': "C#",
      'description':
          "Microsoft developed C# as a faster and more secure variant of C. It is fully integrated with Microsoft's .NET software framework, which supports the development of applications for Windows, browser plug-ins, and mobile devices. C# offers shared codebases, a large code library, and a variety of data types."
    },
    {
      'language_name': "C++",
      'description':
          "C++ is one of the world's most popular programming languages. C++ can be found in today's operating systems, Graphical User Interfaces, and embedded systems. C++ is an object-oriented programming language which gives a clear structure to programs and allows code to be reused, lowering development costs."
    },
  ];

  Future<void> _refreshLanguages() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a network call
    showSnackbar();
  }

  showSnackbar() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Refreshed Successfully"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refresh Indicator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshLanguages,
        child: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 5,
              ),
              child: Card(
                elevation: 4,
                child: ListTile(
                  title: Text(
                    languages[index]["language_name"]!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                    languages[index]["description"]!,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
