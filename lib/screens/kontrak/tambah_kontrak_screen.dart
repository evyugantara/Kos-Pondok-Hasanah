import 'package:flutter/material.dart';

class TambahKontrakScreen extends StatefulWidget {
  @override
  _TambahKontrakScreenState createState() => _TambahKontrakScreenState();
}

class _TambahKontrakScreenState extends State<TambahKontrakScreen> {
  final _formKey = GlobalKey<FormState>();
  String penghuni = '';
  String kamar = '';
  String mulai = '';
  String berakhir = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kontrak Kost'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama Penghuni'),
                onSaved: (value) => penghuni = value ?? '',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Isi dulu bro' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Kamar'),
                onSaved: (value) => kamar = value ?? '',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Isi kamar dulu' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tanggal Mulai'),
                onSaved: (value) => mulai = value ?? '',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Isi tanggal mulai' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Tanggal Berakhir'),
                onSaved: (value) => berakhir = value ?? '',
                validator: (value) =>
                    value == null || value.isEmpty ? 'Isi tanggal berakhir' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, {
                      'penghuni': penghuni,
                      'kamar': kamar,
                      'mulai': mulai,
                      'berakhir': berakhir,
                    });
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
