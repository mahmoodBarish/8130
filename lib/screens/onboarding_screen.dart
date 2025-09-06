import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black, // Default background color
      body: Stack(
        children: [
          // Background Image (Image Onboarding - id: 142:499)
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/I142_500_417_719.png',
              width: double.infinity,
              height: screenHeight * (536 / 812), // Image frame height 536px
              fit: BoxFit.cover,
            ),
          ),

          // Gradient Overlay (Shadow Container - id: 142:502)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight * (360 / 812), // Container height 360px
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [
                    // Figma gradient colors: from rgba(5,5,5,0) to rgba(5,5,5,255)
                    Color.fromRGBO(5, 5, 5, 0.0),
                    Color.fromRGBO(5, 5, 5, 1.0),
                  ],
                  // Figma gradient stops
                  stops: const [0.0, 0.23670603334903717],
                ),
              ),
            ),
          ),

          // Content (Text and Button)
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Shrink to fit content
                children: [
                  // Title Text (id: 142:506)
                  Text(
                    'Fall in Love with Coffee in Blissful Delight!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 32,
                      fontWeight: FontWeight.w600, // SemiBold
                      color: Colors.white,
                      letterSpacing: 0.16,
                      height: 1.5, // Line height 48px / font size 32px
                    ),
                  ),
                  SizedBox(height: screenHeight * (8 / 812)), // Item spacing from Figma
                  // Subtitle Text (id: 142:507)
                  Text(
                    'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w400, // Regular
                      color: const Color(0xFFA2A2A2), // Figma color: rgba(162,162,162,1)
                      letterSpacing: 0.14,
                      height: 1.5, // Line height 21px / font size 14px
                    ),
                  ),
                  SizedBox(
                      height: screenHeight *
                          (32 / 812)), // Gap between Text frame (bottom 670) and Button (top 702)
                  // Get Started Button (id: 142:503)
                  SizedBox(
                    width: double.infinity,
                    height: 56, // Fixed height: 56px
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the home screen (or next onboarding step) using go_router
                        context.go('/home'); // Use context.go to replace the current route
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFFC67C4E), // Figma button background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(16), // Corner radius: 16px
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16), // Figma padding
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600, // SemiBold
                          color: Colors.white,
                          height: 1.5, // Line height 24px / font size 16px
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: screenHeight *
                          (
                              54 / 812)), // Distance from button bottom to screen bottom: 812 - (702 + 56) = 54px
                ],
              ),
            ),
          ),

          // Status Bar (Iphone - id: 142:509)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false, // Only applies padding to the top (notch area)
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '9:41', // Time (I142:509;417:348)
                      style: GoogleFonts.sora(
                        fontSize: 15, // Approximate font size
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.signal_cellular_alt,
                            color: Colors.white, size: 17), // Mobile Signal icon
                        SizedBox(width: 4),
                        Icon(Icons.wifi, color: Colors.white, size: 17), // Wifi icon
                        SizedBox(width: 4),
                        Icon(Icons.battery_full,
                            color: Colors.white, size: 17), // Battery icon
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Home Indicator (Iphone - id: 142:508)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              top: false, // Only applies padding to the bottom
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom: 8), // 812 - (799 + 5) = 8px bottom margin
                  height: 5, // Fixed height: 5px
                  width: 134, // Fixed width: 134px
                  decoration: BoxDecoration(
                    color: const Color(0xFF242424), // Figma color: rgba(36,36,36,1)
                    borderRadius:
                        BorderRadius.circular(100), // Rounded corners: 100px
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}