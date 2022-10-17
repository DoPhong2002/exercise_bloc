import 'package:Flutter_father/learn/learn_stream/bloc/issue_bloc.dart';
import 'package:Flutter_father/learn/learn_stream/exr1/model_json/issue.dart';
import 'package:flutter/material.dart';

class IssuePage extends StatefulWidget {
  const IssuePage({Key? key}) : super(key: key);

  @override
  State<IssuePage> createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  late IssueBloc bloc;

  @override
  void initState() {
    bloc = IssueBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
        actions: [
          IconButton(
              onPressed: () {
                bloc.increment();
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                bloc.decrement();
              },
              icon: const Icon(Icons.remove)),
        ],
      ),
      body: buildList(),
    );
  }

  Widget buildList() {
    return StreamBuilder<List<Issue>>(
      stream: bloc.streamIssue,
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
              return Divider();
            },
            itemCount: issues.length,
            itemBuilder: (context, index) {
              if (index == issues.length - 1) {
                bloc.getIssues();
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
