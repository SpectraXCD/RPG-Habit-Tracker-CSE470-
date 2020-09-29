import '../lib/controllers/playerTasks.dart';
import '../lib/models/task.dart';
import 'package:test/test.dart';
import '../lib/models/user.dart';

void main() {
  final testUser = User(name: 'A');
  List<Task> testTasks = [];
  final playerTasks = PlayerTasks(testUser);

  final task1Name = 'Task 1';
  final task1Difficulty = 'Very Hard';

  final task2Name = 'Task 1';
  final task2Difficulty = 'Easy';

  test(
      'PlayerTask.addTask() adds a Task() object to the List "task")\nHere, two tasks are being added for testing the next two methods\n',
      () {
    playerTasks.addTaskTest(testTasks, task1Name, task1Difficulty);
    playerTasks.addTaskTest(testTasks, task2Name, task2Difficulty);

    expect(testTasks.length, 2);
  });

  test(
      'PlayerTask.deleteTask() removes a task from the List and also decreases HP',
      () {
    playerTasks.deleteTaskTest(testTasks, testUser, task1Difficulty, 0);

    expect(testTasks.length, 1);
    expect(testUser.currHp, 500 - 2 * 100);
  });

  test(
      'PlayerTask.completeTask() removes a task from the List and also increases EXP\n',
      () {
    playerTasks.completeTaskTest(testTasks, testUser, task2Difficulty, 0);

    expect(testTasks.length, 0);
    expect(testUser.currExp, 0 + ((2.0 / 3.0) * 100).floor());
  });

  test(
      'After enough tasks are completed and current EXP reached max EXP, the User/Player\'s level increases\n',
      () {
    playerTasks.addTaskTest(testTasks, task1Name, 'Very Hard');
    playerTasks.addTaskTest(testTasks, task2Name, 'Very Hard');
    playerTasks.addTaskTest(testTasks, task1Name, 'Very Hard');

    playerTasks.completeTaskTest(testTasks, testUser, 'Very Hard', 0);
    playerTasks.completeTaskTest(testTasks, testUser, 'Very Hard', 0);
    playerTasks.completeTaskTest(testTasks, testUser, 'Very Hard', 0);

    expect(testUser.lvl, 2);
    expect(testUser.currExp, 166);
  });
}
