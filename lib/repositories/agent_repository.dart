import 'dart:convert';
import 'dart:developer';

import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:http/http.dart' as http;

class AgentRepository {
  Future<List<Agent>?> getAllAgents() async {
    const url = 'https://aov.vercel.app/allagents';
    final response = await http.get(Uri.parse(url));
    log('response ${response.body}');

    if (response.statusCode != 200) {
      return null;
    } else {
      // final dynamic res = json.decode(response.body);
      // var rest = res as List;

      // final List<Agent> allAgents =
      //     List<Agent>.from(rest as List).map((e) => Agent.fromJson(e as Map<String, dynamic>)).toList();

      // log(res.toString());

      // final dynamic data = json.decode(response.body);
      // var rest = data as List;
      // log('rest $rest');

      // final List<Agent> allAgent = List<Agent>.from(response.body as List)
      //     .map((e) => Agent.fromJson(e as Map<String, dynamic>))
      //     .toList();
      // List<Agent> list = rest.map<Agent>((e) => Agent.fromJson(e)).toList();

      return Agent.allAgents;
    }
  }
}
