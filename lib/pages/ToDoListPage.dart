import 'package:flutter/material.dart';
import '../components/ContentBody.dart';
import '../components/Sidebar.dart';
import '../components/Navbar.dart';

class ToDoItem {
  String title;
  bool isDone;

  ToDoItem({required this.title, this.isDone = false});
}

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final List<ToDoItem> _todoItems = [];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: const Navbar(),
      drawer: isMobile ? const Sidebar() : null,
      body: ContentBody(
        content: _todoItems.isEmpty
            ? Text('No to-do items available.')
            : ListView.builder(
                itemCount: _todoItems.length,
                itemBuilder: (context, index) {
                  final ToDoItem item = _todoItems[index];

                  return ListTile(
                    title: Text(
                      item.title,
                      style: TextStyle(
                        decoration: item.isDone
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    leading: IconButton(
                      icon: Icon(
                        item.isDone
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                      ),
                      onPressed: () {
                        // Action to mark the to-do item as done
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Marked as done: ${item.title}'),
                          ),
                        );

                        // Strike through the item to indicate completion
                        setState(() {
                          item.isDone = !item.isDone;
                        });
                      },
                    ),
                    onTap: () {
                      // Action to mark the to-do item as done
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Marked as done: ${item.title}'),
                        ),
                      );

                      // Strike through the item to indicate completion
                      setState(() {
                        item.isDone = !item.isDone;
                      });
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Action to delete the to-do item
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Deleted: ${item.title}')),
                        );

                        // Remove the item from the list
                        setState(() {
                          _todoItems.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add a new to-do item
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add To-Do Item'),
              content: TextField(
                controller: _textFieldController,
                decoration: const InputDecoration(hintText: 'Enter to-do item'),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('Add'),
                  onPressed: () {
                    if (_textFieldController.text.isNotEmpty) {
                      // Show a snackbar for adding a new item
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Add Task: ${_textFieldController.text}',
                          ),
                        ),
                      );

                      // Add the new item to the list and update the state
                      setState(() {
                        _todoItems.add(
                          ToDoItem(
                            title: _textFieldController.text,
                            isDone: false,
                          ),
                        );
                        _textFieldController.clear();
                      });
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
