import 'package:flutter/material.dart';
import '../services/training_service.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({Key? key}) : super(key: key);

  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  late Future<List<dynamic>> _trainingData;

  @override
  void initState() {
    super.initState();
    _fetchTrainingData();
  }

  void _fetchTrainingData() {
    setState(() {
      _trainingData = TrainingService().fetchTrainingData();
    });
  }

  Future<void> _editExercise(dynamic exercise) async {
    final updatedExercise = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) {
        final TextEditingController nameController =
            TextEditingController(text: exercise['Nombre']);
        final TextEditingController descController =
            TextEditingController(text: exercise['Descripcion']);
        return AlertDialog(
          title: const Text('Editar Ejercicio'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'Nombre': nameController.text,
                  'Descripcion': descController.text,
                });
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );

    if (updatedExercise != null) {
      setState(() {
        exercise['Nombre'] = updatedExercise['Nombre'];
        exercise['Descripcion'] = updatedExercise['Descripcion'];
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ejercicio actualizado: ${exercise['Nombre']}')),
      );
    }
  }

  Future<void> _deleteExercise(dynamic exercise) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmar eliminación'),
          content: Text('¿Seguro que deseas eliminar "${exercise['Nombre']}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      setState(() {
        _trainingData = _trainingData.then((data) => data
            .where((item) => item != exercise)
            .toList());
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ejercicio eliminado: ${exercise['Nombre']}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _fetchTrainingData,
          ),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _trainingData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _fetchTrainingData,
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay datos disponibles'));
          } else {
            final exercises = snapshot.data!;
            return ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    title: Text(
                      exercise['Nombre'] ?? 'Sin nombre',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      exercise['Descripcion'] ?? 'Sin descripción',
                      style: const TextStyle(fontSize: 14),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _editExercise(exercise),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteExercise(exercise),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}