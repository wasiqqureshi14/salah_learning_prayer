import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salah_learning_prayer/screens/wudu/wudu_farz/wudu_farz_screen.dart';
import 'package:salah_learning_prayer/screens/wudu/wudu_method/widgets/header_shape.dart';
import 'package:salah_learning_prayer/screens/wudu/wudu_steps/wudu_steps_screen.dart';

class WuduScreen extends StatelessWidget {
  const WuduScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
            ClipPath(
              clipper: HeaderCurve(),
              child: Container(
                 height: size.height * 0.48,
                width: double.infinity,
                decoration: BoxDecoration(
                color: const Color(0xFF016568),
                ),
                
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Mosque SVG (watermark)
                    Positioned(
                      bottom: -60,
                      top: 15,
                      left: 05,
                      right: 05,
                      child: Opacity(
                        opacity: 0.2,
                        child: SvgPicture.asset(
                          "assets/images/mosque/wudu.svg",
                           colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                        )
                      ),
                    ),

                     Positioned(
                      top: 50,
                      left: 10,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
              
                    // Title
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Wudu Method',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          /// ===== BODY SECTION =====
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              /// START BUTTON
                      _buildButton(
                        text: "START",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const WuduStepsScreen(),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      /// FARZ BUTTON
                      _buildButton(
                        text: "Wudu Farz",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const WuduFarzStepsScreen(),
                            ),
                          );
                        },
                      ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }
 Widget _buildButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 320,
          minHeight: 55,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF016568),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    );
  }
