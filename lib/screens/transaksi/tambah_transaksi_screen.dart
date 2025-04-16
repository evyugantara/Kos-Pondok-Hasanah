import 'package:flutter/material.dart';

class TambahTransaksiScreen extends StatefulWidget {
  final Map<String, dynamic>? transaksi;

  TambahTransaksiScreen({this.transaksi});

  @override
  _TambahTransaksiScreenState createState() => _TambahTransaksiScreenState();
}

class _TambahTransaksiScreenState extends State<TambahTransaksiScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _jenisController;
  late TextEditingController _jumlahController;
  late TextEditingController _tanggalController;
  String _tipeTransaksi = 'masuk';

  @override
  void initState() {
    super.initState();

    
    _jenisController = TextEditingController(
        text: widget.transaksi != null ? widget.transaksi!['jenis'] : '');
    _jumlahController = TextEditingController(
        text: widget.transaksi != null
            ? widget.transaksi!['jumlah'].toString()
            : '');
    _tanggalController = TextEditingController(
        text: widget.transaksi != null ? widget.transaksi!['tanggal'] : '');
    _tipeTransaksi = widget.transaksi != null
        ? widget.transaksi!['tipe']
        : 'masuk'; // default
  }

  @override
  void dispose() {
    _jenisController.dispose();
    _jumlahController.dispose();
    _tanggalController.dispose();
    super.dispose();
  }

  void _simpanTransaksi() {
    if (_formKey.currentState!.validate()) {
      final transaksiBaru = {
        'jenis': _jenisController.text,
        'jumlah': double.parse(_jumlahController.text),
        'tanggal': _tanggalController.text,
        'tipe': _tipeTransaksi,
      };

      Navigator.pop(context, transaksiBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.transaksi != null
            ? 'Edit Transaksi'
            : 'Tambah Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _jenisController,
                decoration: InputDecoration(labelText: 'Jenis Transaksi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Wajib diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jumlahController,
                decoration: InputDecoration(labelText: 'Jumlah (Rp)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      double.tryParse(value) == null) {
                    return 'Masukkan jumlah yang valid';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tanggalController,
                decoration: InputDecoration(labelText: 'Tanggal (YYYY-MM-DD)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal wajib diisi';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: _tipeTransaksi,
                decoration: InputDecoration(labelText: 'Tipe Transaksi'),
                items: ['masuk', 'keluar'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child:
                        Text(value == 'masuk' ? 'Uang Masuk' : 'Uang Keluar'),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _tipeTransaksi = newValue!;
                  });
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _simpanTransaksi,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
