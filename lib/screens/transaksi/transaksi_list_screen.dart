import 'package:flutter/material.dart';
import 'tambah_transaksi_screen.dart';

class TransaksiListScreen extends StatefulWidget {
  @override
  _TransaksiListScreenState createState() => _TransaksiListScreenState();
}

class _TransaksiListScreenState extends State<TransaksiListScreen> {
  List<Map<String, dynamic>> daftarTransaksi = [
    {
      'jenis': 'Pembayaran Kost',
      'jumlah': 1000000,
      'tanggal': '2025-04-01',
      'tipe': 'masuk',
    },
    {
      'jenis': 'Pembayaran Listrik',
      'jumlah': 200000,
      'tanggal': '2025-04-02',
      'tipe': 'keluar',
    },
  ];

  double getSaldo() {
    double saldo = 0;
    for (var trx in daftarTransaksi) {
      if (trx['tipe'] == 'masuk') {
        saldo += trx['jumlah'];
      } else {
        saldo -= trx['jumlah'];
      }
    }
    return saldo;
  }

  void _tambahTransaksiBaru(Map<String, dynamic> trx) {
    setState(() {
      daftarTransaksi.add(trx);
    });
  }

  void _hapusTransaksi(int index) {
    setState(() {
      daftarTransaksi.removeAt(index);
    });
  }

  void _editTransaksi(int index, Map<String, dynamic> trxBaru) {
    setState(() {
      daftarTransaksi[index] = trxBaru;
    });
  }

  @override
  Widget build(BuildContext context) {
    double saldo = getSaldo();

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Transaksi'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Saldo Saat Ini: Rp${saldo.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: daftarTransaksi.length,
              itemBuilder: (context, index) {
                final transaksi = daftarTransaksi[index];
                return Card(
                  child: ListTile(
                    leading: Icon(
                      transaksi['tipe'] == 'masuk'
                          ? Icons.arrow_downward
                          : Icons.arrow_upward,
                      color: transaksi['tipe'] == 'masuk'
                          ? Colors.green
                          : Colors.red,
                    ),
                    title: Text('${transaksi['jenis']}'),
                    subtitle: Text(
                        'Jumlah: Rp${transaksi['jumlah']} • Tanggal: ${transaksi['tanggal']}'),
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
                                    TambahTransaksiScreen(transaksi: transaksi),
                              ),
                            );
                            if (hasil != null) {
                              _editTransaksi(index, hasil);
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            _hapusTransaksi(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final hasil = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TambahTransaksiScreen(),
            ),
          );
          if (hasil != null) {
            _tambahTransaksiBaru(hasil);
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Tambah Transaksi',
      ),
    );
  }
}
