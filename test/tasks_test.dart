import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:mockito/mockito.dart';
import 'package:task_management_fares/core/storage/database.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  group('DatabaseHelper tests', () {
    late DatabaseHelper databaseHelper;
    late MockDatabase mockDatabase;

    setUp(() {
      mockDatabase = MockDatabase();
      databaseHelper = DatabaseHelper();
    });

    test('fetchTasks should return a list of tasks', () async {
      final tasks = [
        {
          'id': 1,
          'name': 'Task 1',
          'description': 'Description 1',
          'type': 'Type 1'
        },
        {
          'id': 2,
          'name': 'Task 2',
          'description': 'Description 2',
          'type': 'Type 2'
        },
      ];

      // Mock the behavior of the database.query method
      when(mockDatabase.query(DatabaseHelper.dbName)).thenAnswer((_) async => tasks);

    
      // Call the fetchTasks method and verify the result
      final result = await databaseHelper.fetchTasks();
      expect(result, equals(tasks));
    });

    test('insertTask should insert a task into the database', () async {
      final task = {
        'id': 1,
        'name': 'Task 1',
        'description': 'Description 1',
        'type': 'Type 1'
      };

     
      // Call the insertTask method
      await databaseHelper.insertTask(task, 'Type 1');

      // Verify that the insert method was called with the correct parameters
      verify(mockDatabase.insert('tasks', task)).called(1);
    });

  });
}
