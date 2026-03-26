import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/product_controller.dart'; // Professional Fonts mate

class HomeScreen extends StatelessWidget {
  final ProductController c = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode ? Colors.black : Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("TrendStore",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: context.isDarkMode ? Colors.white : Colors.black)
        ),
        actions: [
          Obx(() => Switch(
              activeColor: Colors.blue,
              value: c.isDarkMode.value,
              onChanged: (v) => c.toggleTheme(v)
          )),
          IconButton(
            icon: Icon(Icons.logout_rounded, color: Colors.redAccent),
            onPressed: () => c.logout(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Welcome Header ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello, User!", style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey)),
                  Text("Explore Latest Products", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // --- Cart Banner ---
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blueAccent, Colors.lightBlue]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Items in your cart", style: TextStyle(color: Colors.white, fontSize: 16)),
                      Obx(() => Text("${c.cartCount.value} Products",
                          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold))),
                    ],
                  ),
                  Icon(Icons.shopping_cart_checkout, color: Colors.white, size: 40),
                ],
              ),
            ),

            // --- Product Grid ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Popular Items", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600)),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: c.products.length,
              itemBuilder: (context, index) {
                final p = c.products[index];
                return Container(
                  decoration: BoxDecoration(
                    color: context.isDarkMode ? Colors.grey[900] : Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(radius: 30, backgroundColor: p['color'].withOpacity(0.2), child: Icon(Icons.devices, color: p['color'])),
                      SizedBox(height: 10),
                      Text(p['name'], style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      Text("₹ ${p['price']}", style: TextStyle(color: Colors.blue)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                        onPressed: () => c.addToCart(),
                        child: Text("Add"),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}