import "package:flutter/material.dart";

class RestaurantGridLayout extends StatefulWidget {
  const RestaurantGridLayout({super.key});

  @override
  State<RestaurantGridLayout> createState() => _RestaurantGridLayout();
}

class _RestaurantGridLayout extends State<RestaurantGridLayout> {
  @override
  Widget build(BuildContext context) {
    final double currentWidth = MediaQuery.sizeOf(context).width;
    final double currentHeight = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.fromLTRB(30 / 389 * currentWidth, 0, 38 / 389 * currentWidth, 18 / 812 * currentHeight ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                mainAxisSpacing: 24.0,
              ),
              itemCount: 10,
              itemBuilder: (_, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: SizedBox(
      
                    width: 150 / 389 * currentWidth,
                    height: 136 / 812 * currentHeight,
      
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/kofteci.png",
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Kofteci Yusuf",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("Lezzetli Kofteler")
                        ]),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
