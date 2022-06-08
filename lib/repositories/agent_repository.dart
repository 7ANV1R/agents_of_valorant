// ignore_for_file: prefer_final_locals

import 'dart:convert';

import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:http/http.dart' as http;

class AgentRepository {
  Future<List<Agent>?> getAllAgents() async {
    const url = 'https://aov.vercel.app/allagents';
    final result = await http.Client().get(Uri.parse(url));

    // log('response ${result.body}');

    if (result.statusCode != 200) {
      return null;
    } else {
      final List<Agent> allAgentList = List<Agent>.from(
          (jsonDecode(result.body) as List).map((e) => Agent.fromJson(e as Map<String, dynamic>)).toList());
      return allAgentList;
    }
  }
}
