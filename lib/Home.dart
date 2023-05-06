import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List tarefas = ['Trabalhar', 'Estudar', 'Ir Para Casa'];
  List tarefaSub = [];
  TextEditingController _tarefa = TextEditingController();
  TextEditingController _subtitulo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To do List'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          //ItemCount é a quantidade de vezes que irá ter a repetição do conexto
          //Index é a posição do item dentro do laço
          child: ListView.builder(
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(tarefas[index]),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            tarefas.removeAt(index);
                          }
                          );
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Tarefa Deletada!!'),
                            duration: Duration(seconds: 2),
                          )
                          );
                        },
                        icon: Icon(Icons.delete)));
              }
            )
          ),
      bottomNavigationBar: BottomAppBar(
        height: 40,
        shape: CircularNotchedRectangle(),
        color: Colors.tealAccent.shade700
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        mini: true, //Deixa o botão minusculo
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Adicionar Tarefa'),
                  content: TextField(controller: _tarefa),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _tarefa.clear();
                        },
                        child: Text('Cancelar')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tarefas.add(_tarefa.text);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Tarefa Adicionada com Sucesso!!'),
                            duration: Duration(seconds: 2),
                          ));
                          print(_tarefa.text);
                          Navigator.pop(context);
                          _tarefa.clear();
                        },
                        child: Text('Adicionar')),
                  ],
                );
              }); //Escrurece a tela
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
