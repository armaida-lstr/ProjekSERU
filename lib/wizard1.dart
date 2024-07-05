import 'package:flutter/material.dart';

class Wizard1 extends StatefulWidget {
  final Function nextPage;
  final Map<String, dynamic> formData;

  Wizard1({required this.nextPage, required this.formData});

  @override
  _Wizard1State createState() => _Wizard1State();
}

class _Wizard1State extends State<Wizard1> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedProvinsi;
  String? _selectedKota;
  String? _selectedKecamatan;
  String? _selectedKelurahan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'First Name'),
              onSaved: (value) {
                widget.formData['firstName'] = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Last Name'),
              onSaved: (value) {
                widget.formData['lastName'] = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Biodata'),
              maxLines: 4,
              onSaved: (value) {
                widget.formData['biodata'] = value;
              },
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Provinsi'),
              value: _selectedProvinsi,
              items: ['Provinsi1', 'Provinsi2'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedProvinsi = newValue;
                });
              },
              onSaved: (value) {
                widget.formData['provinsi'] = value;
              },
            ),
            // Add similar dropdowns for Kota, Kecamatan, Kelurahan
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  widget.nextPage();
                }
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
