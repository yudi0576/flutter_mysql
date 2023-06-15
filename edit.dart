import 'package:flutter/material.dart';
import 'package:flutter_mysql/api_service.dart';

class Edit extends StatefulWidget {
  final dynamic item;

  Edit({required this.item});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.item['name']);
    _emailController = TextEditingController(text: widget.item['email']);
  }

  void _submitData() async {
    final name = _nameController.text;
    final email = _emailController.text;

    // Panggil fungsi dari ApiService untuk mengedit data di server MySQL
    await ApiService.editData(widget.item['id'], name, email);

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
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
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
