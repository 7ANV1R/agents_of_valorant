// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agents_of_valorant/home/view/widgets/agent_card.dart';
import 'package:agents_of_valorant/widgets/loader_wave.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:agents_of_valorant/data/model/agent_model.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AgentDetails extends StatelessWidget {
  final Agent agent;
  const AgentDetails({
    Key? key,
    required this.agent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            // background
            Hero(
              tag: agent.bgColor,
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor(agent.bgColor),
                ),
              ),
            ),

            // image
            Positioned(
              top: 20,
              left: 20,
              child: SafeArea(
                child: Hero(
                  tag: agent.agentImg,
                  child: CachedNetworkImage(
                    fadeOutDuration: const Duration(milliseconds: 400),
                    imageUrl: agent.agentImg,
                    height: size.height * 0.5,
                    placeholder: (context, url) => const Center(
                      child: FittedBox(
                        child: LoaderWave(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.35,
              left: size.width * 0.5,
              child: SafeArea(
                child: Hero(
                  tag: agent.name,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      agent.name.toUpperCase(),
                      style: GoogleFonts.roboto(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
