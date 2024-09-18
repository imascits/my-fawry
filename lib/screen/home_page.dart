import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // List of widgets to display for each tab
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),  // Main content for 'الرئيسية' tab
    Center(child: Text('المحفظة', style: TextStyle(fontSize: 30))),
    Center(child: Text('العروض', style: TextStyle(fontSize: 30))),
    Center(child: Text('المزيد', style: TextStyle(fontSize: 30))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue, // Set the selected icon color
        unselectedItemColor: Colors.grey, // Set the unselected icon color
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'المحفظة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'العروض',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'المزيد',
          ),
        ],
      ),
    );
  }
}

// This is the main HomePage content
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'الرئيسية',
          style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  QuickActionButton(
                    label: 'فوري باي',
                    icon: Icons.credit_card,
                    color: Colors.yellow.shade700,
                  ),
                  QuickActionButton(
                    label: 'الدفع السريع',
                    icon: Icons.receipt,
                    color: Colors.yellow.shade700,
                  ),
                ],
              ),
            ),

            BalanceCard(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ServicesGrid(),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/shield_icon.png', width: 100, height: 100),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('بوليسة فوري للطوارئ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('دلوقتي أمن على مستقبل عائلتك...', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Card(
                    child: Column(
                      children: [
                        Image.asset('assets/talabat_logo.png', width: 100, height: 100),
                        SizedBox(height: 8),
                        Text('Talabat', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('مأكولات ومشروبات'),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Image.asset('assets/tradeline_logo.png', width: 100, height: 100),
                        SizedBox(height: 8),
                        Text('Tradeline', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('أجهزة كهربائية'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;

  const QuickActionButton({
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.white),
        label: Text(label, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.yellow.shade700,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('الرصيد', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text('0 ج.م', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Text('•••• •••• •••• 0578', style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionButton(label: 'إضافة رصيد', icon: Icons.add),
                ActionButton(label: 'تحويل نقود', icon: Icons.send),
                ActionButton(label: 'العروض', icon: Icons.local_offer),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const ActionButton({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

class ServicesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الخدمات الأكثر استخداماً', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        SizedBox(height: 8),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            _buildServiceItem(Icons.people, 'التأمينات\nالاجتماعية'),
            _buildServiceItem(Icons.phone, 'التليفون\nالأرضي'),
            _buildServiceItem(Icons.wifi, 'الإنترنت\nالمنزلي'),
            _buildServiceItem(Icons.local_activity, 'تذاكر'),
            _buildServiceItem(Icons.videogame_asset, 'ألعاب'),
            _buildServiceItem(Icons.local_fire_department, 'غاز'),
            _buildServiceItem(Icons.favorite, 'تبرعات'),
            _buildServiceItem(Icons.flash_on, 'الكهرباء'),
            _buildServiceItem(Icons.badge, 'النقابات'),
            _buildServiceItem(Icons.handshake, 'تمويل متناهي\nالصغر'),
            _buildServiceItem(Icons.school, 'تعليم'),
            _buildShowAllButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.black)),
        ],
      ),
    );
  }

  Widget _buildShowAllButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xFFFDF6E2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back, size: 20, color: Colors.black),
          SizedBox(height: 8),
          Text('عرض\nالكل', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.black)),
        ],
      ),
    );
  }
}
