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
        child: DefaultTextStyle(
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
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

              //Listview
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Hero(
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
                        Positioned(
                          top: 8,
                          right: 50,
                          child: Hero(
                            tag: agent.agentNumber,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                agent.agentNumber.toString(),
                                style: GoogleFonts.oswald(
                                  fontSize: 168,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
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
                      ],
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    //role
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('// role'),
                        Text(agent.role),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),

              // image
              // Positioned(
              //   top: 20,
              //   left: 20,
              //   child: SafeArea(
              //     child: Hero(
              //       tag: agent.agentImg,
              //       child: CachedNetworkImage(
              //         fadeOutDuration: const Duration(milliseconds: 400),
              //         imageUrl: agent.agentImg,
              //         height: size.height * 0.5,
              //         placeholder: (context, url) => const Center(
              //           child: FittedBox(
              //             child: LoaderWave(),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              // Positioned(
              //   top: size.height * 0.35,
              //   left: size.width * 0.5,
              //   child: SafeArea(
              //     child: Hero(
              //       tag: agent.name,
              //       child: Material(
              //         type: MaterialType.transparency,
              //         child: Text(
              //           agent.name.toUpperCase(),
              //           style: GoogleFonts.roboto(
              //             fontSize: 48,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
