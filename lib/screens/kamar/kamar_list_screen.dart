import 'package:flutter/material.dart';
import 'tambah_kamar_screen.dart';

class KamarListScreen extends StatefulWidget {
  @override
  _KamarListScreenState createState() => _KamarListScreenState();
}

class _KamarListScreenState extends State<KamarListScreen> {
  List<Map<String, String>> daftarKamar = [
    {
      'nomor': 'A1',
      'status': 'Kosong',
      'harga': '700000',
    },
    {
      'nomor': 'B2',
      'status': 'Terisi',
      'harga': '750000',
    },
  ];

  void _tambahKamarBaru(Map<String, String> kamar) {
    setState(() {
      daftarKamar.add(kamar);
    });
  }

  void _hapusKamar(int index) {
    setState(() {
      daftarKamar.removeAt(index);
    });
  }

  void _editKamar(int index, Map<String, String> kamarBaru) {
    setState(() {
      daftarKamar[index] = kamarBaru;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kamar Kost'),
      ),
      body: ListView.builder(
        itemCount: daftarKamar.length,
        itemBuilder: (context, index) {
          final kamar = daftarKamar[index];
          return Card(
            child: ListTile(
              title: Text('Kamar ${kamar['nomor']}'),
              subtitle: Text(
                  'Status: ${kamar['status']} - Harga: Rp${kamar['harga']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.orange),
                    onPressed: () async {
                      final hasil = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TambahKamarScreen(kamar: kamar),
                        ),
                      );
                      if (hasil != null) {
                        _editKamar(index, hasil);
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _hapusKamar(index);
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
              builder: (context) => TambahKamarScreen(),
            ),
          );
          if (hasil != null) {
            _tambahKamarBaru(hasil);
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Tambah Kamar',
      ),
    );
  }
}
