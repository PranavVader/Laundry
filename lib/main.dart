import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(QueensLaundryApp());
}

class QueensLaundryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: BottomNavScreen(),
    );
  }
}

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    HomeScreen(),
    PricingScreen(),
    OrderScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label: 'Pricing'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Order'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Queen's Laundry Services")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/laundry.png', height: 200),
            SizedBox(height: 20),
            Text(
              "Premium Laundry Services at Your Doorstep",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "We offer dry cleaning, ironing, and express delivery services.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PricingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pricing List")),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildPriceItem("Shirt", "₹50"),
          _buildPriceItem("Trousers", "₹60"),
          _buildPriceItem("Jacket", "₹100"),
          _buildPriceItem("Bed Sheet", "₹150"),
          _buildPriceItem("Curtains", "₹200"),
        ],
      ),
    );
  }

  Widget _buildPriceItem(String item, String price) {
    return ListTile(
      title: Text(item, style: TextStyle(fontSize: 18)),
      trailing: Text(price, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Place Your Order")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Your Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Pickup Address"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Laundry Type (e.g., Dry Cleaning)"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order Placed Successfully!")));
              },
              child: Text("Submit Order"),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 100, color: Colors.blue),
            SizedBox(height: 10),
            Text("John Doe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("johndoe@example.com"),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text("Edit Profile")),
          ],
        ),
      ),
    );
  }
}
