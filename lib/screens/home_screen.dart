import 'package:flutter/material.dart';
import 'penghuni/penghuni_list_screen.dart';
import 'kamar/kamar_list_screen.dart';
import 'kontrak/kontrak_list_screen.dart';  // Import Kontrak
import 'transaksi/transaksi_list_screen.dart'; // Import Transaksi
import 'laporan/laporan_list_screen.dart';

 // Import Laporan Keuangan

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Kost Pondok Hasanah'),
      ),
      body: ListView(
        children: [
          // Management Penghuni
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Management Penghuni'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PenghuniListScreen(),
                ),
              );
            },
          ),
          // Pengelolaan Kamar
          ListTile(
            leading: Icon(Icons.meeting_room),
            title: Text('Pengelolaan Kamar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KamarListScreen(),
                ),
              );
            },
          ),
          // Kontrak Kost
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Kontrak Kost'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KontrakListScreen(),
                ),
              );
            },
          ),
          // Transaksi
          ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text('Transaksi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransaksiListScreen(),
                ),
              );
            },
          ),
          // Laporan Keuangan
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Laporan Keuangan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LaporanScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
