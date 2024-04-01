import 'package:flutter/material.dart';
import 'package:my_app/main.dart';

void main() {
  runApp(cours());
}

class cours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courses Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CourseListScreen(),
    );
  }
}

class CourseListScreen extends StatefulWidget {
  @override
  _CourseListScreenState createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _professorController = TextEditingController();
  final _dateController = TextEditingController();
  final _priceController = TextEditingController();
  String _imageUrl = '';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _professorController.dispose();
    _dateController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses List'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardApp()),
              );
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _professorController,
                  decoration: InputDecoration(labelText: 'Professor'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _openImagePicker,
                      child: Text('Pick Image'),
                    ),
                    SizedBox(width: 10),
                    _imageUrl.isEmpty
                        ? Text('No image selected')
                        : Expanded(
                            child: Image.network(
                              _imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Action to add course
                    _addCourse();
                  },
                  child: Text('ADD COURSE'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Number of courses
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()),
                  ),
                  title: Text('Course ${index + 1}'),
                  subtitle: Text('Professor: Prof. XYZ\nPrice: \$10'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // Action to edit course
                          _editCourse();
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Action to delete course
                          _deleteCourse();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addCourse() {
    String title = _titleController.text;
    String description = _descriptionController.text;
    String professor = _professorController.text;
    String date = _dateController.text;
    String price = _priceController.text;
    // You can access _imageUrl to get the selected image URL

    // Add the course to the list or perform any action

    // Clear the text fields after adding the course
    _titleController.clear();
    _descriptionController.clear();
    _professorController.clear();
    _dateController.clear();
    _priceController.clear();
    _imageUrl = '';
  }

  void _editCourse() {
    // Action to edit the course
  }

  void _deleteCourse() {
    // Action to delete the course
  }

  void _openImagePicker() {
    // Implement image picker functionality to choose an image from gallery
  }
}