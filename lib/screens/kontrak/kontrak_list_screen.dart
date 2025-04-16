import 'package:flutter/material.dart';
import 'tambah_kontrak_screen.dart';

class KontrakListScreen extends StatefulWidget {
  @override
  _KontrakListScreenState createState() => _KontrakListScreenState();
}

class _KontrakListScreenState extends State<KontrakListScreen> {
  List<Map<String, String>> daftarKontrak = [
    {
      'penghuni': 'Budi',
      'kamar': 'A1',
      'mulai': '2025-01-01',
      'berakhir': '2025-12-31',
    },
    {
      'penghuni': 'Siti',
      'kamar': 'B2',
      'mulai': '2025-02-01',
      'berakhir': '2025-12-31',
    },
  ];

  void _tambahKontrakBaru(Map<String, String> kontrakBaru) {
    setState(() {
      daftarKontrak.add(kontrakBaru);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kontrak Kost'),
      ),
      body: ListView.builder(
        itemCount: daftarKontrak.length,
        itemBuilder: (context, index) {
          final kontrak = daftarKontrak[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.date_range),
              title: Text('Kontrak ${kontrak['penghuni']}'),
              subtitle: Text(
                  'Kamar: ${kontrak['kamar']} • Mulai: ${kontrak['mulai']} • Berakhir: ${kontrak['berakhir']}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahKontrakScreen(),
            ),
          );

          if (hasil != null && hasil is Map<String, String>) {
            _tambahKontrakBaru(hasil);
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Tambah Kontrak',
      ),
    );
  }
}
