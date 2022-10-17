import 'package:Flutter_father/exercise/big_exercise/user.dart';
import 'package:Flutter_father/learn/learn_stream/exr1/model_json/issue.dart';
import 'package:Flutter_father/modun/service/api_service.dart';

extension IssueService on APIService {
  Future<List<Issue>> getIssue({
    int limit = 5,
    required int offset,
  }) async {

    final result = await request(
      path: '/api/issues?limit=$limit&offset=$offset',
      method: Method.get,
    );

    final issues = List<Issue>.from(result.map((e) => Issue.fromJson(e)));
    return issues;
  }
}
