import 'package:flutter/material.dart';
import 'tambah_penghuni_screen.dart';

class PenghuniListScreen extends StatefulWidget {
  @override
  _PenghuniListScreenState createState() => _PenghuniListScreenState();
}

class _PenghuniListScreenState extends State<PenghuniListScreen> {
  List<Map<String, String>> daftarPenghuni = [
    {
      'nama': 'Budi',
      'kontak': '08123456789',
      'kamar': 'A1',
    },
    {
      'nama': 'Siti',
      'kontak': '08987654321',
      'kamar': 'B2',
    },
  ];

  void _tambahPenghuniBaru(Map<String, String> penghuni) {
    setState(() {
      daftarPenghuni.add(penghuni);
    });
  }

  void _hapusPenghuni(int index) {
    setState(() {
      daftarPenghuni.removeAt(index);
    });
  }

  void _editPenghuni(int index, Map<String, String> penghuniBaru) {
    setState(() {
      daftarPenghuni[index] = penghuniBaru;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Penghuni'),
      ),
      body: ListView.builder(
        itemCount: daftarPenghuni.length,
        itemBuilder: (context, index) {
          final penghuni = daftarPenghuni[index];
          return Card(
            child: ListTile(
              title: Text(penghuni['nama'] ?? ''),
              subtitle: Text(
                  'Kontak: ${penghuni['kontak']}, Kamar: ${penghuni['kamar']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.orange),
                    onPressed: () async {
                      final hasil = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TambahPenghuniScreen(
                            penghuni: penghuni,
                          ),
                        ),
                      );
                      if (hasil != null) {
                        _editPenghuni(index, hasil);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _hapusPenghuni(index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahPenghuniScreen(),
            ),
          );
          if (hasil != null) {
            _tambahPenghuniBaru(hasil);
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Tambah Penghuni',
      ),
    );
  }
}
