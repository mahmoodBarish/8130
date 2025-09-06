import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // Import go_router

class HighFidelityDetailItemScreen extends StatefulWidget {
  const HighFidelityDetailItemScreen({super.key});

  @override
  State<HighFidelityDetailItemScreen> createState() => _HighFidelityDetailItemScreenState();
}

class _HighFidelityDetailItemScreenState extends State<HighFidelityDetailItemScreen> {
  int _selectedSize = 1; // 0 for S, 1 for M, 2 for L

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Scaling factors based on a 375x812 design canvas
    final double horizontalScale = screenWidth / 375;
    final double verticalScale = screenHeight / 812;

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            bottom: false, // Handle bottom padding manually for the custom nav bar
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 202 * verticalScale,
                  floating: false,
                  pinned: true,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  leadingWidth: 24 * horizontalScale + 44 * horizontalScale,
                  leading: Padding(
                    padding: EdgeInsets.only(left: 24 * horizontalScale),
                    child: GestureDetector(
                      onTap: () {
                        context.pop(); // Use context.pop() for back navigation
                      },
                      child: Container(
                        width: 44 * horizontalScale,
                        height: 44 * verticalScale,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: const Color(0xFF2A2A2A),
                          size: 24 * horizontalScale,
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 24 * horizontalScale),
                      child: Container(
                        width: 44 * horizontalScale,
                        height: 44 * verticalScale,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: const Color(0xFF2A2A2A),
                          size: 24 * horizontalScale,
                        ),
                      ),
                    ),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    titlePadding: EdgeInsets.zero,
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10 * verticalScale), // Adjust title position within FlexibleSpaceBar
                      child: Text(
                        'Detail',
                        style: GoogleFonts.sora(
                          fontSize: 16 * horizontalScale,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF242424),
                        ),
                      ),
                    ),
                    background: Padding(
                      padding: EdgeInsets.only(top: AppBar().preferredSize.height + (10 * verticalScale)), // Adjust top padding for status bar and app bar
                      child: Image.asset(
                        'assets/images/I142_377_417_715.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30 * horizontalScale),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24 * verticalScale),
                            Text(
                              'Caffe Mocha',
                              style: GoogleFonts.sora(
                                fontSize: 20 * horizontalScale,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF242424),
                              ),
                            ),
                            SizedBox(height: 4 * verticalScale),
                            Text(
                              'Ice/Hot',
                              style: GoogleFonts.sora(
                                fontSize: 12 * horizontalScale,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFA2A2A2),
                              ),
                            ),
                            SizedBox(height: 16 * verticalScale),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star_rounded, color: const Color(0xFFFCBE21), size: 20 * horizontalScale),
                                    SizedBox(width: 4 * horizontalScale),
                                    Text(
                                      '4.8',
                                      style: GoogleFonts.sora(
                                        fontSize: 16 * horizontalScale,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFF2A2A2A),
                                      ),
                                    ),
                                    Text(
                                      ' (230)',
                                      style: GoogleFonts.sora(
                                        fontSize: 12 * horizontalScale,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFFA2A2A2),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    _buildSuperiorityIcon('assets/images/I142_371_418_950.png', 44 * horizontalScale, 44 * verticalScale, 20 * horizontalScale),
                                    SizedBox(width: 12 * horizontalScale),
                                    _buildSuperiorityIcon('assets/images/I142_373_418_971.png', 44 * horizontalScale, 44 * verticalScale, 20 * horizontalScale),
                                    SizedBox(width: 12 * horizontalScale),
                                    _buildSuperiorityIcon('assets/images/I142_375_418_967.png', 44 * horizontalScale, 44 * verticalScale, 20 * horizontalScale),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 16 * verticalScale),
                            Divider(
                              color: const Color(0xFFE3E3E3),
                              thickness: 1,
                              height: 1 * verticalScale,
                            ),
                            SizedBox(height: 16 * verticalScale),
                            Text(
                              'Description',
                              style: GoogleFonts.sora(
                                fontSize: 16 * horizontalScale,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF242424),
                              ),
                            ),
                            SizedBox(height: 8 * verticalScale),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.sora(
                                  fontSize: 14 * horizontalScale,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFFA2A2A2),
                                  height: 1.5,
                                ),
                                children: <TextSpan>[
                                  const TextSpan(
                                    text: 'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo..',
                                  ),
                                  TextSpan(
                                    text: ' Read More',
                                    style: GoogleFonts.sora(
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFFC67C4E),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16 * verticalScale),
                            Text(
                              'Size',
                              style: GoogleFonts.sora(
                                fontSize: 16 * horizontalScale,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF242424),
                              ),
                            ),
                            SizedBox(height: 16 * verticalScale),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildSizeButton('S', 0, horizontalScale, verticalScale),
                                _buildSizeButton('M', 1, horizontalScale, verticalScale),
                                _buildSizeButton('L', 2, horizontalScale, verticalScale),
                              ],
                            ),
                            SizedBox(height: 118 * verticalScale), // Space for the fixed bottom bar
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildBottomNavBar(horizontalScale, verticalScale),
        ],
      ),
    );
  }

  Widget _buildSuperiorityIcon(String assetPath, double width, double height, double iconSize) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: const Color(0xFFEDEBEB).withOpacity(0.35),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        assetPath,
        width: iconSize,
        height: iconSize,
        color: const Color(0xFFC67C4E), // Recolor the icon image
      ),
    );
  }

  Widget _buildSizeButton(String text, int index, double horizontalScale, double verticalScale) {
    bool isSelected = _selectedSize == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = index;
        });
      },
      child: Container(
        width: 96 * horizontalScale,
        height: 41 * verticalScale,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF7F2ED) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFFE3E3E3),
            width: 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.sora(
            fontSize: 14 * horizontalScale,
            fontWeight: FontWeight.w400,
            color: isSelected ? const Color(0xFFC67C4E) : const Color(0xFF242424),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(double horizontalScale, double verticalScale) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 118 * verticalScale, // Total height, including padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16 * horizontalScale),
            topRight: Radius.circular(16 * horizontalScale),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -5), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.fromLTRB(24 * horizontalScale, 16 * verticalScale, 24 * horizontalScale, 46 * verticalScale),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: GoogleFonts.sora(
                    fontSize: 14 * horizontalScale,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF909090),
                  ),
                ),
                SizedBox(height: 4 * verticalScale),
                Text(
                  '\$ 4.53',
                  style: GoogleFonts.sora(
                    fontSize: 18 * horizontalScale,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFC67C4E),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.push('/cart'); // Use context.push for navigation to cart screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20 * horizontalScale,
                  vertical: 16 * verticalScale,
                ),
                elevation: 0,
              ),
              child: Text(
                'Buy Now',
                style: GoogleFonts.sora(
                  fontSize: 16 * horizontalScale,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}