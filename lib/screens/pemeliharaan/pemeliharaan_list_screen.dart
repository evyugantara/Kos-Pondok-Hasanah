import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'tambah_pemeliharaan_screen.dart';
import 'edit_pemeliharaan_screen.dart';

class Pemeliharaan {
  String nama;
  DateTime tanggal;

  Pemeliharaan({required this.nama, required this.tanggal});
}

class PemeliharaanListScreen extends StatefulWidget {
  @override
  _PemeliharaanListScreenState createState() => _PemeliharaanListScreenState();
}

class _PemeliharaanListScreenState extends State<PemeliharaanListScreen> {
  List<Pemeliharaan> listPemeliharaan = [];

  void tambahData(Pemeliharaan baru) {
    setState(() {
      listPemeliharaan.add(baru);
    });
  }

  void editData(int index, Pemeliharaan dataBaru) {
    setState(() {
      listPemeliharaan[index] = dataBaru;
    });
  }

  void hapusData(int index) {
    setState(() {
      listPemeliharaan.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jadwal Pemeliharaan')),
      body: ListView.builder(
        itemCount: listPemeliharaan.length,
        itemBuilder: (context, index) {
          final item = listPemeliharaan[index];
          return ListTile(
            title: Text(item.nama),
            subtitle: Text(DateFormat('dd MMMM yyyy').format(item.tanggal)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () async {
                    final hasil = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPemeliharaanScreen(
                          pemeliharaan: item,
                          index: index,
                        ),
                      ),
                    );
                    if (hasil != null) editData(index, hasil);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => hapusData(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TambahPemeliharaanScreen()),
          );
          if (hasil != null) tambahData(hasil);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
