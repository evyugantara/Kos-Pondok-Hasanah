import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'pemeliharaan_list_screen.dart';

class TambahPemeliharaanScreen extends StatefulWidget {
  @override
  _TambahPemeliharaanScreenState createState() => _TambahPemeliharaanScreenState();
}

class _TambahPemeliharaanScreenState extends State<TambahPemeliharaanScreen> {
  final _formKey = GlobalKey<FormState>();
  String _nama = '';
  DateTime _tanggal = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tambah Jadwal')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Pemeliharaan'),
                validator: (value) => value == null || value.isEmpty ? 'Wajib diisi' : null,
                onSaved: (value) => _nama = value!,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Tanggal: ${DateFormat('dd MMM yyyy').format(_tanggal)}'),
                  Spacer(),
                  TextButton(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _tanggal,
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setState(() => _tanggal = picked);
                    },
                    child: Text('Pilih Tanggal'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, Pemeliharaan(nama: _nama, tanggal: _tanggal));
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
