import 'dart:math';

import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:agents_of_valorant/home/view/widgets/agent_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  late int _index;
  late int _auxIndex;
  late double _percent;
  late double _auxpercent;

  @override
  void initState() {
    _pageController = PageController();
    _index = 0;
    _auxIndex = _index + 1;
    _percent = 0.0;
    _auxpercent = 1.0 - _percent;
    _pageController.addListener(_pageListener);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    _index = _pageController.page!.floor();
    _auxIndex = _index + 1;
    _percent = (_pageController.page! - _index).abs();
    _auxpercent = 1.0 - _percent;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final agents = Agent.allAgents;
    const angleRotate = -pi * 0.5;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'VALORANT AGENTS',
        ),
      ),
      body: Stack(
        children: [
          // superhero card
          Stack(
            children: [
              // // Back card

              // if (_auxIndex == agents.length + 1)
              //   Transform.translate(
              //     offset: Offset(0, 50 * _auxpercent),
              //     child: AgentCard(
              //       agent: agents[_index],
              //       factorChange: _percent,
              //     ),
              //   )
              // else
              Transform.translate(
                offset: Offset(0, 50 * _auxpercent),
                child: AgentCard(
                  agent: agents[_auxIndex],
                  factorChange: _auxpercent,
                ),
              ),

              //Front card

              Transform.translate(
                offset: Offset(-1000 * _percent, 100 * _percent),
                child: Transform.rotate(
                  angle: angleRotate * _percent,
                  child: AgentCard(
                    agent: agents[_index],
                    factorChange: _percent,
                  ),
                ),
              ),
            ],
          ),
          // void pageview
          PageView.builder(
            controller: _pageController,
            itemCount: agents.length,
            itemBuilder: (index, context) => const SizedBox(),
          ),
        ],
      ),
    );
  }
}
