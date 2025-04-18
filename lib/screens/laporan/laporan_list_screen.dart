import 'package:flutter/material.dart';

class LaporanScreen extends StatelessWidget {
  // Sample data untuk laporan (bisa diganti dengan data asli)
  final List<Map<String, String>> laporanData = [
    {'nama': 'Ega', 'kamar': 'Kamar 1', 'totalBayar': '500,000'},
    {'nama': 'Virga', 'kamar': 'Kamar 2', 'totalBayar': '450,000'},
    {'nama': 'Adi', 'kamar': 'Kamar 3', 'totalBayar': '400,000'},
  ];

  final List<Map<String, String>> pengeluaranData = [
    {'jenis': 'Listrik', 'jumlah': '100,000'},
    {'jenis': 'Sampah', 'jumlah': '30,000'},
    {'jenis': 'Keamanan', 'jumlah': '50,000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Keuangan'),
      ),
      body: ListView(
        children: [
          // Laporan Penghuni
          ListTile(
            title: Text('Laporan Penghuni'),
            subtitle: Column(
              children: laporanData.map((data) {
                return ListTile(
                  title: Text(data['nama']!),
                  subtitle: Text('Kamar: ${data['kamar']} - Total Bayar: ${data['totalBayar']}'),
                );
              }).toList(),
            ),
          ),
          Divider(),
          // Laporan Pengeluaran
          ListTile(
            title: Text('Riwayat Pengeluaran'),
            subtitle: Column(
              children: pengeluaranData.map((data) {
                return ListTile(
                  title: Text('${data['jenis']}'),
                  subtitle: Text('Jumlah: ${data['jumlah']}'),
                );
              }).toList(),
            ),
          ),
          Divider(),
          // Total Pengeluaran
          ListTile(
            title: Text('Total Pengeluaran'),
            subtitle: Text('Jumlah Pengeluaran: 180,000'),  // Contoh nilai total
          ),
        ],
      ),
    );
  }
}
