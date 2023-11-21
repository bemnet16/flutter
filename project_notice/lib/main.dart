// import 'package:flutter/material.dart';
// import 'package:project_notice/screens/lost_detail/lost_detail.dart';
// import 'package:project_notice/screens/lostfound/lostFoundTapBar.dart';
// import 'package:project_notice/screens/question/upload_question.dart';

// import 'bar.dart';

// void main() => {runApp(const MyApp())};

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false, home: LostDetailPage());
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() => {
      runApp(MaterialApp(
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case "/":
                return MaterialPageRoute(
                    builder: (context) => const ScreenTwo());
              case "/next":
                return MaterialPageRoute(builder: (context) => ScreenOne());
            }
          },
          initialRoute: "/first",
          routes: {
            "/next": (context) => ScreenOne(),
            "/back": (context) => const ScreenTwo()
          },
          title: "Flutter Demo",
          home: const MyApp()))
    };

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Flutter Demo"),
            backgroundColor: Colors.pink,
            actions: [
              IconButton(
                  icon: const Icon(Icons.details),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenOne(),
                            settings: const RouteSettings(arguments: "lsjf")));
                  })
            ]),
        body: const Center(
          child: Text("ui desgin"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}

class MyState extends StatefulWidget {
  const MyState({super.key});

  @override
  State<MyState> createState() => _MyStateState();
}

class _MyStateState extends State<MyState> {
  int num = 2;

  Future<void> show(BuildContext context) async {
    final date = showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(23),
        child: Column(children: [
          GridView.count(
            crossAxisCount: 3,
            children: [],
          ),
          Slider(
              value: 34,
              onChanged: (value) => setState(() {
                    num += 23;
                  })),
          GestureDetector(
            child: Container(),
          ),
        ]));
  }
}

class ScreenOne extends StatelessWidget {
  ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    AppState ap = Provider.of<AppState>(context, listen: false);
    final res = ModalRoute.of(context)!.settings.arguments as String;

    return Center(
        child: ElevatedButton(
            child: Text(ap.f),
            onPressed: () {
              ap.change();
              Navigator.pushNamed(context, '/next');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: const RouteSettings(
                          arguments: {"tilte": "lsjf", "id": 12}),
                      builder: (BuildContext context) {
                        return const ScreenTwo();
                      }));
            }));
  }
}

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});
  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    final obj = ModalRoute.of(context)!.settings.arguments as Object;
    return Center(
      child: Column(
        children: [
          BlocBuilder(
            builder: <BlocCre, BlocEvent>(context, state) {
              return Container();
            },
          ),
          BlocListener(
            listener: (context, state) {},
            child: const Text(""),
          ),
          ElevatedButton(
              child: const Text("back"),
              onPressed: () {
                Navigator.pop(context, "sljf");
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("")));
                showBottomSheet(
                    context: context, builder: (context) => Container());

                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertDialog(
                        title: Text(""),
                        actions: [],
                      );
                    });
              }),
        ],
      ),
    );
  }
}

class Product {
  String pid;
  String pname;
  String location;

  Product(this.pid, {required this.pname, this.location = "inthial"});
}

class Nav extends StatefulWidget {
  const Nav({required super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigator(
          pages: [MaterialPage(child: ScreenOne())],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }
            return true;
          }),
    );
  }
}

/// Provider

class AppState extends ChangeNotifier {
  String f = "lsjf";
  void change() {
    f = "bemnet";
    notifyListeners();
  }
}

class Prov extends StatefulWidget {
  const Prov({super.key});

  @override
  State<Prov> createState() => _ProvState();
}

class _ProvState extends State<Prov> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppState(),
        ),
        Provider(create: (contextz) => AppState())
      ],
      child: ScreenOne(),
    );
  }
}

/// go_router

class Go extends StatelessWidget {
  Go({required super.key});

  final _goroute = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const ScreenTwo()),
    GoRoute(path: '/next', builder: (context, state) => ScreenOne())
  ]);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go('/');
              context.go('/next');
            },
            child: const Text("data"))
      ]),
    );
  }
}

class Cart extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Container();
      },
    );
  }
}

/// BLoC

class BlocEvent {
  int count = 0;

  BlocEvent({this.count = 0});

  void Add() {
    count++;
  }
}

class BlocCre extends Bloc<BlocEvent, int> {
  BlocCre(super.initialState);
}

class BloWid extends StatelessWidget {
  const BloWid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocCre(0),
      child: ScreenTwo(),
    );
  }
}

Future getdata() async {
  final response = await http.get(Uri.parse("uri"));
  if (response.statusCode == 200)
    return "";
  else {
    return "";
  }
}

Future postdata() async {
  final response = await http.post(Uri.parse("uri"),
      headers: {'Content-Type': 'Application/json'},
      body: jsonEncode({"id": 234, "name": "bemnet"}));

  if (response.statusCode == 201)
    return "successfuly created";
  else {
    return "doesn't create";
  }
}

Future FetchAll() async {
  final res = await http.get(Uri.parse("uri/23"));

  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  } else {
    return "";
  }
}

Future CreateNew() async {
  final res = await http.post(Uri.parse("uri"),
      headers: {"Content-Type": "application/json; UTF=8"},
      body: jsonEncode({"pid": 23, "pname": "beme", "location": "addis abab"}));
}
