import 'package:flutter/material.dart';

class TambahPenghuniScreen extends StatefulWidget {
  final Map<String, String>? penghuni;

  TambahPenghuniScreen({this.penghuni});

  @override
  _TambahPenghuniScreenState createState() => _TambahPenghuniScreenState();
}

class _TambahPenghuniScreenState extends State<TambahPenghuniScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaController;
  late TextEditingController _kontakController;
  late TextEditingController _kamarController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(
        text: widget.penghuni != null ? widget.penghuni!['nama'] : '');
    _kontakController = TextEditingController(
        text: widget.penghuni != null ? widget.penghuni!['kontak'] : '');
    _kamarController = TextEditingController(
        text: widget.penghuni != null ? widget.penghuni!['kamar'] : '');
  }

  @override
  void dispose() {
    _namaController.dispose();
    _kontakController.dispose();
    _kamarController.dispose();
    super.dispose();
  }

  void _simpanPenghuni() {
    if (_formKey.currentState!.validate()) {
      final penghuniBaru = {
        'nama': _namaController.text,
        'kontak': _kontakController.text,
        'kamar': _kamarController.text,
      };
      Navigator.pop(context, penghuniBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.penghuni != null
            ? 'Edit Data Penghuni'
            : 'Tambah Data Penghuni'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nama wajib diisi' : null,
              ),
              TextFormField(
                controller: _kontakController,
                decoration: InputDecoration(labelText: 'Kontak'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Kontak wajib diisi'
                    : null,
              ),
              TextFormField(
                controller: _kamarController,
                decoration: InputDecoration(labelText: 'Kamar'),
                validator: (value) => value == null || value.isEmpty
                    ? 'Kamar wajib diisi'
                    : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _simpanPenghuni,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
