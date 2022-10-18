import 'package:Flutter_father/exercise/mini_project_bloc/mini_shopping_page_1.dart';
import 'package:Flutter_father/exercise/todo_bloc/todo_page.dart';
import 'package:Flutter_father/learn/learn_stream/EX_cart/EX_page2.dart';
import 'package:Flutter_father/learn/learn_stream/bloc/issue_bloc.dart';
import 'package:Flutter_father/learn/learn_stream/exr1/model_json/issue.dart';
import 'package:Flutter_father/modun/navigator.dart';
import 'package:flutter/material.dart';

class IssuePage extends StatefulWidget {
  const IssuePage({Key? key}) : super(key: key);

  @override
  State<IssuePage> createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEXT'),
        actions: [
          IconButton(
              onPressed: () {
                navigatorPush(context, EXPage2());
              },
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                count.increment();
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                count.decrement();
              },
              icon: const Icon(Icons.remove)),
        ],
      ),
      body: Center(child: buildCount()),
    );
  }

  Widget buildCount() {
    return StreamBuilder<int>(
      stream: count.streamCount,
      builder: (context, snapshot) {
        return Text('${count.count ?? 0}');
      },
    );
  }

  Widget buildList() {
    return StreamBuilder<List<Issue>>(
      stream: count.streamIssue,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error.toString()}'),
          );
        }
        if (snapshot.hasData) {
          final issues = snapshot.data ?? [];
          return ListView.separated(
            separatorBuilder: (_, __) {
              return const Divider();
            },
            itemCount: issues.length,
            itemBuilder: (context, index) {
              if (index == issues.length - 1) {
                count.getIssues();
              }
              final issue = issues[index];
              return ListTile(
                title: Text(issue.title ?? ''),
                subtitle: Text(issue.content ?? ''),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
