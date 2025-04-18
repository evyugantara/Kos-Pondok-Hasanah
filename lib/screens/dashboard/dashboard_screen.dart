import 'package:flutter/material.dart';
import 'package:kos_pondokhasanah2/screens/kamar/kamar_list_screen.dart';
import 'package:kos_pondokhasanah2/screens/kontrak/kontrak_list_screen.dart';
import 'package:kos_pondokhasanah2/screens/laporan/laporan_list_screen.dart';
import 'package:kos_pondokhasanah2/screens/pemeliharaan/pemeliharaan_list_screen.dart';
import 'package:kos_pondokhasanah2/screens/penghuni/penghuni_list_screen.dart';
import 'package:kos_pondokhasanah2/screens/transaksi/transaksi_list_screen.dart';


class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person),  // Icon untuk Penghuni
            title: Text('Penghuni'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PenghuniListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home),  // Icon untuk Kamar
            title: Text('Kamar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KamarListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.document_scanner),  // Icon untuk Kontrak
            title: Text('Kontrak'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KontrakListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),  // Icon untuk Transaksi
            title: Text('Transaksi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransaksiListScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),  // Icon untuk Laporan
            title: Text('Laporan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaporanScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.build),  // Icon untuk Pemeliharaan
            title: Text('Pemeliharaan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PemeliharaanListScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
