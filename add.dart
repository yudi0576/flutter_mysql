import 'package:flutter/material.dart';
import 'package:flutter_mysql/api_service.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  void _submitData() async {
    final name = _nameController.text;
    final email = _emailController.text;

    // Panggil fungsi dari ApiService untuk menambahkan data baru ke server MySQL
    await ApiService.addData(name, email);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitData,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
