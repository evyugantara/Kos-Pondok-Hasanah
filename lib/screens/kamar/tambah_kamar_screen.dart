import 'package:flutter/material.dart';

class TambahKamarScreen extends StatefulWidget {
  final Map<String, String>? kamar;

  TambahKamarScreen({this.kamar});

  @override
  _TambahKamarScreenState createState() => _TambahKamarScreenState();
}

class _TambahKamarScreenState extends State<TambahKamarScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nomorController;
  late TextEditingController _hargaController;
  String _status = 'Kosong';

  @override
  void initState() {
    super.initState();
    _nomorController = TextEditingController(
        text: widget.kamar != null ? widget.kamar!['nomor'] : '');
    _hargaController = TextEditingController(
        text: widget.kamar != null ? widget.kamar!['harga'] : '');
    _status = widget.kamar != null ? widget.kamar!['status'] ?? 'Kosong' : 'Kosong';
  }

  @override
  void dispose() {
    _nomorController.dispose();
    _hargaController.dispose();
    super.dispose();
  }

  void _simpanKamar() {
    if (_formKey.currentState!.validate()) {
      final kamarBaru = {
        'nomor': _nomorController.text,
        'harga': _hargaController.text,
        'status': _status,
      };
      Navigator.pop(context, kamarBaru);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.kamar != null ? 'Edit Kamar' : 'Tambah Kamar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomorController,
                decoration: InputDecoration(labelText: 'Nomor Kamar'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Nomor kamar wajib diisi' : null,
              ),
              TextFormField(
                controller: _hargaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Harga Sewa'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Harga wajib diisi' : null,
              ),
              DropdownButtonFormField<String>(
                value: _status,
                items: ['Kosong', 'Terisi'].map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _status = value!;
                  });
                },
                decoration: InputDecoration(labelText: 'Status'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _simpanKamar,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
