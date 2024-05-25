import 'package:flutter/material.dart';
import 'package:responsiprakmobile/api_services.dart';
import 'package:responsiprakmobile/controller/login_controller.dart';
import 'package:responsiprakmobile/model/coffee_model.dart';
import 'package:responsiprakmobile/view/profile_view.dart';

class HomeScreen extends StatelessWidget {
  final LoginController _loginController = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
          }
        },
      ),
      body: FutureBuilder<List<JenisKopi>>(
        future: fetchCoffee(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada data'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final kopi = snapshot.data![index];
                return ListTile(
                  title: Text(kopi.name ?? 'No Name'),
                  subtitle: Text('Region: ${kopi.region ?? 'Unknown'}, Price: ${kopi.price}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
