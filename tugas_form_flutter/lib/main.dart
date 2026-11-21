import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> agama = [
  "Islam",
  "Kristen Protestan",
  "Kristen Katolik",
  "Hindu",
  "Budha"
];

String _agama = "Islam";

String _jk = "";

TextEditingController controllerNama =
    TextEditingController();

TextEditingController controllerPass =
    TextEditingController();

TextEditingController controllerMoto =
    TextEditingController();

void _pilihJk(String value) {
  setState(() {
    _jk = value;
  });
}

void pilihAgama(String value) {
  setState(() {
    _agama = value;
  });
}

void kirimData() {
  AlertDialog alertDialog = AlertDialog(
    title: Text("Data Diri"),
    content: Container(
      height: 200.0,
      child: Column(
        children: [
          Text("Nama Lengkap : ${controllerNama.text}"),
          SizedBox(height: 10),
          Text("Password : ${'*' * controllerPass.text.length}"),
          SizedBox(height: 10),
          Text("Moto Hidup : ${controllerMoto.text}"),
          SizedBox(height: 10),
          Text("Jenis Kelamin : $_jk"),
          SizedBox(height: 10),
          Text("Agama : $_agama"),
          SizedBox(height: 10),
        ],
      ),
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) => alertDialog,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Data Diri"),
        backgroundColor:Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
  child: ListView(
    children: [

      TextField(
        controller: controllerNama,
        decoration: const InputDecoration(
          hintText: "Nama Lengkap",
          labelText: "Nama Lengkap",
        ),
      ),

      TextField(
        controller: controllerPass,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: "Password",
          labelText: "Password",
        ),
      ),

      TextField(
        controller: controllerMoto,
        maxLines: 2,
        decoration: const InputDecoration(
          hintText: "Moto Hidup",
          labelText: "Moto Hidup",
        ),
      ),

      const SizedBox(height: 20),

      const Text(
        "Jenis Kelamin",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      RadioListTile(
        value: "Perempuan",
        groupValue: _jk,
        title: const Text("Perempuan"),
        onChanged: (value) {
          _pilihJk(value.toString());
        },
      ),

      RadioListTile(
        value: "Laki-laki",
        groupValue: _jk,
        title: const Text("Laki-laki"),
        onChanged: (value) {
          _pilihJk(value.toString());
        },
      ),

      const SizedBox(height: 10),

      const Text(
        "Agama",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),

      DropdownButton<String>(
        value: _agama,
        isExpanded: true,
        items: agama.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          pilihAgama(value!);
        },
      ),

      const SizedBox(height: 20),

      ElevatedButton(
        onPressed: () {
          kirimData();
        },
        child: const Text("OK"),
      ),
    ],
  ),
),
    );
  }
}