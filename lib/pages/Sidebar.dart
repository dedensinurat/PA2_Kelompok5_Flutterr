import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  final List<Widget>list = const[
    Text('Home'),
    Text('Bimbingan'),
    Text('Notifikasi'),
    Text('Profil'),
  ];
  int _selectedIndex =0;
  List<dynamic> buildMenuItems = [
    {
      'icon':'assets/Icons/home.png',
      'Label':'Home',
    },
      {
      'icon':'assets/Icons/folder.png',
      'Label':'Bimbingan',
    },
      {
      'icon':'assets/Icons/notification.png',
      'Label':'Notifikasi',
    },
      {
      'icon':'assets/Icons/user.png',
      'Label':'Profil',
    },
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const[],
      ),
      body: Center(
        child: list[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: const Color.fromARGB(255, 109, 107, 107),
        elevation: 32.0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          height: 1,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          height: 1,
          fontSize: 12,
        ),
        items: buildMenuItems.map((i){
          return BottomNavigationBarItem(
            activeIcon: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 253, 253, 253),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child:Image.asset(i['icon'],
              color: const Color.fromARGB(255, 6, 161, 239),
              // width: 24,
              // height: 24,
              ),
            ),
            icon: Image.asset(
              i['icon'],
              color:Colors.grey,
              width: 24,
              height: 24,
            ),
            label: i['Label'] ??'',
          );
        }).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}