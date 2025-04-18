import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'pemeliharaan_list_screen.dart';

class EditPemeliharaanScreen extends StatefulWidget {
  final Pemeliharaan pemeliharaan;
  final int index;

  EditPemeliharaanScreen({required this.pemeliharaan, required this.index});

  @override
  _EditPemeliharaanScreenState createState() => _EditPemeliharaanScreenState();
}

class _EditPemeliharaanScreenState extends State<EditPemeliharaanScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _nama;
  late DateTime _tanggal;

  @override
  void initState() {
    super.initState();
    _nama = widget.pemeliharaan.nama;
    _tanggal = widget.pemeliharaan.tanggal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Jadwal')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _nama,
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
