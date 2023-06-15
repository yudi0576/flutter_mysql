import 'package:flutter/material.dart';
import 'package:flutter_mysql/add.dart';
import 'package:flutter_mysql/edit.dart';
import 'package:flutter_mysql/api_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<dynamic>> _fetchData() async {
    // Panggil fungsi dari ApiService untuk mengambil data dari server MySQL
    final data = await ApiService.getData();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                final item = snapshot.data?[index];

                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['email']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Edit(item: item),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Add(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
