import 'dart:convert';
import 'dart:developer';

import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:http/http.dart' as http;

class AgentRepository {
  Future<List<Agent>?> getAllAgents() async {
    const url = 'https://aov.vercel.app/allagents';
    final result = await http.Client().get(Uri.parse(url));
    log('response ${result.body}');

    if (result.statusCode != 200) {
      return null;
    } else {
      return Agent.allAgents;
    }
  }
}
