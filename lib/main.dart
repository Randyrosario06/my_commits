import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'commit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Commits',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'My Commits'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Colors.black,
        body: CommitList());
  }
}

//WIDGET TO PRESENT A LIST OF CommitContainer
class CommitList extends StatefulWidget {
  const CommitList({Key? key}) : super(key: key);

  @override
  _CommitListState createState() => _CommitListState();
}

class _CommitListState extends State<CommitList> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<CommitObject> commitObject = [];
  //FUNCTION TO GET COMMITS FROM REPOSITORY
  Future<List<CommitObject>> fetchCommits() async {
    var response = await http.get(Uri.parse(
        'https://api.github.com/repos/randyrosario06/my_commits/commits'));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      setState(() {
        commitObject = responseJson
            .map((movieFileJson) => CommitObject.fromJson(movieFileJson))
            .toList()
            .cast<CommitObject>();
      });
      return commitObject;
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCommits();
  }

  void _onRefresh() async {
    commitObject.clear();
    await fetchCommits();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    if (commitObject.isEmpty) {
      return const Center(
        child: Text('Loading...', style: TextStyle(color: Colors.white)),
      );
    }
    return SmartRefresher(
      controller: _refreshController,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: commitObject.length,
          itemBuilder: (BuildContext context, int index) {
            return CommitContainer(commitObject: commitObject[index]);
          }),
      onRefresh: _onRefresh,
    );
  }
}

//WIDGET TO CONTAIN COMMIT INFO IN CARD STYLE
class CommitContainer extends StatelessWidget {
  CommitObject commitObject;
  CommitContainer({Key? key, required this.commitObject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(36, 39, 51, 1),
              borderRadius: BorderRadius.circular(10)),
          width: 345,
          height: 150,
          child: Row(
            children: <Widget>[
              Column(children: <Widget>[
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 25, 0, 15),
                    child: Container(
                        width: 300,
                        child: Text('Message: ${commitObject.commit!.message}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15)))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
                    child: Container(
                        width: 300,
                        child: Text(
                          'User: ${commitObject.commit!.author!.name}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.start,
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
                    child: Container(
                        width: 300,
                        child: Text(
                            'On ${commitObject.commit!.author!.date!.split("T")[0]} At ${commitObject.commit!.author!.date!.split("T")[1].substring(1, 8)}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14)))),
              ])
            ],
          ),
        ));
  }
}
