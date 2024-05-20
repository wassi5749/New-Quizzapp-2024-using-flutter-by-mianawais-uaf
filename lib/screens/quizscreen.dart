import 'dart:async';
import 'package:flutter/material.dart';
import '../models/question.dart';
import 'resultscreen.dart';
import 'coursescreen.dart';


class QuizScreen extends StatefulWidget {
  final String courseName;

   const QuizScreen({super.key, required this.courseName});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;
  bool answerChosen = false;
  Timer? _timer;
  int _start = 10;

  late List<Question> questions;

  @override
  void initState() {
    super.initState();
    questions = getQuestionsForCourse(widget.courseName);
    startTimer();
  }
  //Lists OF Questions

  List<Question> getQuestionsForCourse(String courseName) {
    switch (courseName) {
      case 'Artificial Intelligence':
        return aiQuestions();
      case 'Mobile App Development':
        return mobileAppDevelopmentQuestions();
      case 'Islamic Study':
        return islamicstudy();
      case 'Data Structures':
        return dataStructuresQuestions();
      case 'Algorithms':
        return algorithmsQuestions();
      case 'Machine Learning':
        return machineLearningQuestions();
      case 'C++':
        return cppQuestions();
      case 'C Programming':
        return cProgrammingQuestions();
      case 'Web Development':
        return webDevelopmentQuestions();
      case 'Database Management':
        return databaseManagementQuestions();
      case 'Computer Networking':
        return computerNetworkingQuestions();
      case 'Visual Basic':
        return visualbasic();
      case 'English Grammar':
        return Englishgrammer();
      default:
        return [];
    }
  }

  List<Question> machineLearningQuestions() {
    return [
    Question(
      questionText: 'Machine Learning is?',
      options: ['Data', 'AI', 'Learning', 'ML'],
      correctAnswer: 'Data',
    ),
    Question(
    questionText: 'ML technique learns from data?',
    options: [ 'Unsupervised', 'Supervised','Reinforcement', 'Deep'],
    correctAnswer: 'Supervised',
    ),
    Question(
    questionText: 'Neural networks mimic what?',
    options: [ 'Computer', 'Language','Brain', 'Network'],
    correctAnswer: 'Brain',
    ),
    Question(
    questionText: 'SVM stands for?',
    options: [ 'Simple Vector Machine', 'Support Vector Machine','Semi Vector Machine', 'Standard Vector Machine'],
    correctAnswer: 'Support Vector Machine',
    ),
    Question(
    questionText: 'Decision Trees are used for?',
    options: [ 'Clustering', 'Regression', 'Classification','Transformation'],
    correctAnswer: 'Classification',
    ),
    Question(
    questionText: 'Linear Regression predicts?',
    options: ['Categorical', 'Images', 'Text','Continuous',],
    correctAnswer: 'Continuous',
    ),
    Question(
    questionText: 'K-means clustering is?',
    options: [ 'Supervised', 'Reinforcement', 'Deep','Unsupervised',],
    correctAnswer: 'Unsupervised',
    ),
    Question(
    questionText: 'Gradient Boosting is?',
    options: ['Ensemble', 'Boosting', 'Bagging', 'Stacking'],
    correctAnswer: 'Boosting',
    ),
    Question(
    questionText: 'Random Forest is an?',
    options: ['Ensemble', 'Boosting', 'Bagging', 'Stacking'],
    correctAnswer: 'Ensemble',
    ),
    Question(
    questionText: 'Logistic Regression is used for?',
    options: [ 'Multi-class Classification','Binary Classification', 'Regression', 'Clustering'],
    correctAnswer: 'Binary Classification',
    ),
    Question(
    questionText: 'Overfitting occurs when?',
    options: ['Model too complex', 'Model too simple', 'Model just right', 'Data too clean'],
    correctAnswer: 'Model too complex',
    ),
    Question(
    questionText: 'Underfitting occurs when?',
    options: [ 'Model too complex', 'Model just right','Model too simple', 'Data too clean'],
    correctAnswer: 'Model too simple',
    ),
    Question(
    questionText: 'Bias-Variance tradeoff balances?',
    options: ['Error', 'Bias', 'Variance', 'Both'],
    correctAnswer: 'Both',
    ),
    Question(
    questionText: 'AUC-ROC curve measures?',
    options: ['Classifier performance', 'Regression performance', 'Clustering performance', 'Feature importance'],
    correctAnswer: 'Classifier performance',
    ),
    Question(
    questionText: 'Cross-validation is used for?',
    options: ['Model evaluation', 'Model training', 'Feature selection', 'Hyperparameter tuning'],
    correctAnswer: 'Model evaluation',
    ),
    Question(
    questionText: 'Feature engineering involves?',
    options: ['Creating new features', 'Deleting features', 'Training models', 'Testing models'],
    correctAnswer: 'Creating new features',
    ),
    Question(
    questionText: 'The loss function measures?',
    options: ['Model error', 'Model complexity', 'Model accuracy', 'Model speed'],
    correctAnswer: 'Model error',
    ),
    Question(
    questionText: 'The learning rate controls?',
    options: [ 'Model size', 'Feature importance','Step size', 'Model complexity'],
    correctAnswer: 'Step size',
    ),
    Question(
    questionText: 'Activation functions introduce?',
    options: ['Linearity', 'Complexity','Non-linearity',  'Simplicity'],
    correctAnswer: 'Non-linearity',
    ),
    Question(
    questionText: 'Regularization reduces?',
    options: ['Overfitting', 'Underfitting', 'Bias', 'Variance'],
    correctAnswer: 'Overfitting',
    ),
    Question(
    questionText: 'Principal Component Analysis is used for?',
    options: ['Dimensionality reduction', 'Model training', 'Feature selection', 'Model evaluation'],
    correctAnswer: 'Dimensionality reduction',
    ),
    Question(
    questionText: 'The confusion matrix measures?',
    options: [ 'Regression performance', 'Clustering performance', 'Classifier performance','Feature importance'],
    correctAnswer: 'Classifier performance',
    ),
    Question(
    questionText: 'The F1-score combines?',
    options: ['Precision and recall', 'Accuracy and precision', 'Recall and specificity', 'Sensitivity and specificity'],
    correctAnswer: 'Precision and recall',
    ),
    Question(
    questionText: 'Bagging involves?',
    options: ['Gradient descent', 'Feature selection', 'Bootstrap aggregation', 'Dimensionality reduction'],
    correctAnswer: 'Bootstrap aggregation',
    ),
    Question(
    questionText: 'Boosting involves?',
    options: ['Sequential learning', 'Parallel learning', 'Unsupervised learning', 'Reinforcement learning'],
    correctAnswer: 'Sequential learning',
    ),

      // Add more questions related to AI
      // ...
    ];
  }

  List<Question> aiQuestions() {
    return [
      Question(
        questionText: 'AI systems adapt and learn?',
        options: ['Narrow AI', 'AGI', 'Strong AI', 'Weak AI'],
        correctAnswer: 'Narrow AI',
      ),
      Question(
        questionText: 'AI technique teaching by example?',
        options: ['Machine learning', 'Expert systems', 'Genetic algorithms', 'NLP'],
        correctAnswer: 'Machine learning',
      ),

      Question(
        questionText: 'ML algorithm learns without programming?',
        options: ['Supervised learning', 'Unsupervised learning', 'Reinforcement learning', 'Semi-supervised learning'],
        correctAnswer: 'Unsupervised learning',
      ),
      Question(
        questionText: 'Main goal of deep learning?',
        options: ['Analyze text data', 'Mimic human brain', 'Simulate language understanding', 'Complex calculations'],
        correctAnswer: 'Mimic human brain',
      ),
      Question(
        questionText: 'AI interpreting human language?',
        options: ['NLP', 'Computer vision', 'Expert systems', 'Genetic algorithms'],
        correctAnswer: 'NLP',
      ),
      Question(
        questionText: 'AI systems learning independently?',
        options: ['Narrow AI', 'AGI', 'Strong AI', 'Weak AI'],
        correctAnswer: 'Narrow AI',
      ),
      Question(
        questionText: 'AI application playing games?',
        options: ['Robotics', 'Computer vision', 'Game playing', 'Speech recognition'],
        correctAnswer: 'Game playing',
      ),
      Question(
        questionText: 'Acronym "CNN" in AI?',
        options: [ 'Continuous Neural Network', 'Contextual Neural Network', 'Convolutional Neural Network','Complex Neural Network'],
        correctAnswer: 'Convolutional Neural Network',
      ),
      Question(
        questionText: 'AI\'s primary goal?',
        options: ['Create robots', 'Simulate human intelligence', 'Automate tasks', 'Replace human intelligence'],
        correctAnswer: 'Simulate human intelligence',
      ),
      Question(
        questionText: 'AI inspired by natural selection?',
        options: ['Genetic algorithms', 'Reinforcement learning', 'Expert systems', 'Deep learning'],
        correctAnswer: 'Genetic algorithms',
      ),
      Question(
        questionText: 'AI systems perform any human task?',
        options: [ 'Strong AI', 'Weak AI', 'Narrow AI','AGI',],
        correctAnswer: 'AGI',
      ),
      Question(
        questionText: 'AI decision-making learning from feedback?',
        options: ['Reinforcement learning', 'Supervised learning', 'Unsupervised learning', 'Semi-supervised learning'],
        correctAnswer: 'Reinforcement learning',
      ),
      Question(
        questionText: 'Expert systems\' main goal?',
        options: [ 'Mimic human intelligence', 'Expert-level decision-making','Analyze big data', 'Simulate language understanding'],
        correctAnswer: 'Expert-level decision-making',
      ),
      Question(
        questionText: 'AI application interpreting images?',
        options: ['Computer vision', 'Robotics', 'Game playing', 'Speech recognition'],
        correctAnswer: 'Computer vision',
      ),
      Question(
        questionText: 'AI systems understand and generate text?',
        options: [ 'Expert systems', 'Genetic algorithms','NLP', 'Deep learning'],
        correctAnswer: 'NLP',
      ),
      Question(
        questionText: 'AI optimizing decision-making?',
        options: [ 'Genetic algorithms', 'Expert systems', 'Reinforcement learning','Deep learning'],
        correctAnswer: 'Reinforcement learning',
      ),
      Question(
        questionText: 'Turing Test tests?',
        options: ['Computer\'s memory', 'Computer\'s human-like thinking', 'Computer\'s speed', 'Computer\'s vision'],
        correctAnswer: 'Computer\'s human-like thinking',
      ),
      Question(
        questionText: 'AI systems adapt and learn?',
        options: ['Narrow AI', 'AGI', 'Strong AI', 'Weak AI'],
        correctAnswer: 'Narrow AI',
      ),
      Question(
        questionText: 'AI application understanding speech?',
        options: [ 'Robotics','Speech recognition', 'Computer vision', 'NLP'],
        correctAnswer: 'Speech recognition',
      ),
      Question(
        questionText: 'AI\'s application for understanding and interpreting human speech?',
        options: ['Speech recognition', 'Robotics', 'Computer vision', 'NLP'],
        correctAnswer: 'Speech recognition',
      ),
      Question(
        questionText: 'Acronym for the technique used to understand human language in AI?',
        options: [ 'CNN','NLP', 'AGI', 'ANN'],
        correctAnswer: 'NLP',
      ),
      Question(
        questionText: 'AI technique mimicking natural selection?',
        options: ['Genetic algorithms', 'Reinforcement learning', 'Expert systems', 'Deep learning'],
        correctAnswer: 'Genetic algorithms',
      ),
      Question(
        questionText: 'Which AI system can perform any intellectual task like humans?',
        options: [ 'Strong AI', 'Weak AI', 'Narrow AI','AGI',],
        correctAnswer: 'AGI',
      ),
      Question(
        questionText: 'AI technique for decision-making based on feedback in an environment?',
        options: ['Reinforcement learning', 'Supervised learning', 'Unsupervised learning', 'Semi-supervised learning'],
        correctAnswer: 'Reinforcement learning',
      ),
      Question(
        questionText: 'AI system providing expert-level decision-making?',
        options: [ 'Genetic algorithms','Expert systems', 'Deep learning', 'Machine learning'],
        correctAnswer: 'Expert systems',
      ),
      Question(
        questionText: 'AI application for interpreting and understanding images or videos?',
        options: ['Computer vision', 'Robotics', 'Game playing', 'NLP'],
        correctAnswer: 'Computer vision',
      ),
      Question(
        questionText: 'AI system understanding, interpreting, and generating human-like text?',
        options: ['Expert systems', 'Genetic algorithms','NLP',  'Deep learning'],
        correctAnswer: 'NLP',
      ),
      Question(
        questionText: 'AI technique optimizing decision-making through trial and error?',
        options: ['Reinforcement learning', 'Genetic algorithms', 'Expert systems', 'Deep learning'],
        correctAnswer: 'Reinforcement learning',
      ),
      Question(
        questionText: 'AI systems adapting and learning from new situations and tasks?',
        options: ['AGI', 'Strong AI','Narrow AI',  'Weak AI'],
        correctAnswer: 'Narrow AI',
      ),
      Question(
        questionText: 'AI technique for recognizing patterns in data without being programmed?',
        options: ['Machine learning', 'Expert systems', 'Genetic algorithms', 'Deep learning'],
        correctAnswer: 'Machine learning',
      ),
      Question(
        questionText: 'Acronym for the type of neural network used in computer vision tasks?',
        options: [ 'RNN','CNN', 'ANN', 'LSTM'],
        correctAnswer: 'CNN',
      ),
      // Add more questions related to AI
      // ...
    ];
  }

  List<Question> cppQuestions() {
    return [
      Question(
        questionText: 'What does C++ stand for?',
        options: ['Computer Program Plus', 'C Plus', 'C Plus Plus', 'Common Program Platform'],
        correctAnswer: 'C Plus Plus',
      ),
      Question(
        questionText: 'Which is a valid C++ identifier?',
        options: ['2names', '_first_name', 'first-name', 'First Name'],
        correctAnswer: '_first_name',
      ),
      Question(
        questionText: 'What is the symbol for the modulus operator in C++?',
        options: ['%', '*', '/', '&'],
        correctAnswer: '%',
      ),
      Question(
        questionText: 'What does the keyword "const" do in C++?',
        options: ['Declare a constant', 'Make a variable mutable', 'Terminate the program', 'Declare a variable'],
        correctAnswer: 'Declare a constant',
      ),
      Question(
        questionText: 'Which header file is used for input and output in C++?',
        options: [ '<stdio.h>', '<iostream>','<math.h>', '<fstream>'],
        correctAnswer: '<iostream>',
      ),
      Question(
        questionText: 'What is the output of 5 + 3 * 2 in C++?',
        options: ['16', '11', '10', '8'],
        correctAnswer: '11',
      ),
      Question(
        questionText: 'What is the syntax for a single-line comment in C++?',
        options: ['// comment', '/* comment */', '# comment', '-- comment'],
        correctAnswer: '// comment',
      ),
      Question(
        questionText: 'What is the purpose of the "new" operator in C++?',
        options: [ 'Delete memory', 'Declare a variable', 'Allocate memory','Access structure members'],
        correctAnswer: 'Allocate memory',
      ),
      Question(
        questionText: 'What is the purpose of the "delete" operator in C++?',
        options: ['Allocate memory', 'Declare a variable', 'Free memory', 'Access structure members'],
        correctAnswer: 'Free memory',
      ),
      Question(
        questionText: 'Which type of inheritance allows a class to inherit from multiple base classes?',
        options: [ 'Single inheritance', 'Multilevel inheritance', 'Multiple inheritance','Hierarchical inheritance'],
        correctAnswer: 'Multiple inheritance',
      ),
      Question(
        questionText: 'What does the "virtual" keyword do in C++?',
        options: ['Enable polymorphism', 'Allocate memory', 'Declare a variable', 'Access structure members'],
        correctAnswer: 'Enable polymorphism',
      ),
      Question(
        questionText: 'What is the purpose of the "inline" keyword in C++?',
        options: [ 'Allocate memory', 'Declare a variable','Hint to the compile', 'Access structure members'],
        correctAnswer: 'Hint to the compile',
      ),
      Question(
        questionText: 'What is the syntax for defining a function in C++?',
        options: [ 'functionName(parameters) returnType', 'returnType functionName(parameters)','parameters functionName(returnType)', 'functionName returnType(parameters)'],
        correctAnswer: 'returnType functionName(parameters)',
      ),
      Question(
        questionText: 'What is the purpose of the "this" pointer in C++?',
        options: ['Refer to the current object', 'Refer to the previous object', 'Refer to the next object', 'Refer to a specific memory address'],
        correctAnswer: 'Refer to the current object',
      ),
      Question(
        questionText: 'What is the syntax for accessing a member function of an object in C++?',
        options: [ 'functionName.objectName()', 'objectName->functionName()','objectName.functionName()', 'functionName->objectName()'],
        correctAnswer: 'objectName.functionName()',
      ),
      Question(
        questionText: 'What is the purpose of the "static" keyword in C++?',
        options: ['Declare a static member', 'Allocate memory', 'Declare a variable', 'Access structure members'],
        correctAnswer: 'Declare a static member',
      ),
      Question(
        questionText: 'What is the purpose of the "friend" keyword in C++?',
        options: [ 'Allocate memory', 'Declare a variable', 'Access structure members','Allow access to private members',],
        correctAnswer: 'Allow access to private members',
      ),
      Question(
        questionText: 'What is the purpose of the "namespace" keyword in C++?',
        options: ['Avoid naming conflicts', 'Allocate memory', 'Declare a variable', 'Access structure members'],
        correctAnswer: 'Avoid naming conflicts',
      ),
      Question(
        questionText: 'What is the purpose of the "template" keyword in C++?',
        options: ['Create generic functions or classes', 'Allocate memory', 'Declare a variable', 'Access structure members'],
        correctAnswer: 'Create generic functions or classes',
      ),
      Question(
        questionText: 'What is the purpose of the "const" keyword in function parameters in C++?',
        options: ['Allocate memory', 'Declare a variable','Prevent modification of parameter',  'Access structure members'],
        correctAnswer: 'Prevent modification of parameter',
      ),
      Question(
        questionText: 'What is the purpose of the "using" keyword in C++?',
        options: ['Bring a namespace into scope', 'Allocate memory', 'Declare a variable', 'Access structure members'],
        correctAnswer: 'Bring a namespace into scope',
      ),
      Question(
        questionText: 'What is the purpose of the "typeid" operator in C++?',
        options: [ 'Allocate memory', 'Determine the type of an object','Declare a variable', 'Access structure members'],
        correctAnswer: 'Determine the type of an object',
      ),
      Question(
        questionText: 'What is the purpose of the "typeid" operator in C++?',
        options: [ 'Allocate memory', 'Declare a variable', 'Determine the type of an object','Access structure members'],
        correctAnswer: 'Determine the type of an object',
      ),
      Question(
        questionText: 'What is the purpose of the "typeid" operator in C++?',
        options: ['Determine the type of an object', 'Allocate memory', 'Declare a variable', 'Access structure members'],
        correctAnswer: 'Determine the type of an object',
      ),
      Question(
        questionText: 'What is the purpose of the "typeid" operator in C++?',
        options: [ 'Allocate memory', 'Determine the type of an object','Declare a variable', 'Access structure members'],
        correctAnswer: 'Determine the type of an object',
      ),
      Question(
        questionText: 'What is the purpose of the "typeid" operator in C++?',
        options: ['Determine the type of an object', 'Allocate memory', 'Declare a variable', 'Access structure members'],
        correctAnswer: 'Determine the type of an object',
      ),
    ];
  }

  List<Question> cProgrammingQuestions() {
    return [
      Question(
        questionText: 'What does printf() do in C?',
        options: ['Prints output', 'Gets user input', 'Pauses program', 'None of the above'],
        correctAnswer: 'Prints output',
      ),
      Question(
        questionText: 'Which operator is used to access structure members in C?',
        options: ['.', '&', '*', '->'],
        correctAnswer: '->',
      ),
      Question(
        questionText: 'What is the syntax to declare a variable in C?',
        options: ['datatype variableName;', 'variableName = value;', 'variableName datatype;', 'value datatype variableName;'],
        correctAnswer: 'datatype variableName;',
      ),
      Question(
        questionText: 'What does the scanf() function do in C?',
        options: [ 'Prints output', 'Pauses program', 'Reads input','None of the above'],
        correctAnswer: 'Reads input',
      ),
      Question(
        questionText: 'What is the purpose of the sizeof() operator in C?',
        options: [ 'Convert data types', 'Access structure members', 'Allocate memory','Determine size of variable',],
        correctAnswer: 'Determine size of variable',
      ),
      Question(
        questionText: 'What does the return statement do in a C function?',
        options: [ 'Ends the program', 'Returns a value','Prints output', 'Pauses the program'],
        correctAnswer: 'Returns a value',
      ),
      Question(
        questionText: 'What is the purpose of the break statement in C?',
        options: ['Continue to next iteration', 'Print output', 'Declare a variable','Exit from loop', ],
        correctAnswer: 'Exit from loop',
      ),
      Question(
        questionText: 'Which header file is used for input and output operations in C?',
        options: [ 'math.h','stdio.h', 'stdlib.h', 'string.h'],
        correctAnswer: 'stdio.h',
      ),
      Question(
        questionText: 'What is the purpose of the if-else statement in C?',
        options: ['Make decisions', 'Define a loop', 'Declare variables', 'Print output'],
        correctAnswer: 'Make decisions',
      ),
      Question(
        questionText: 'What is the syntax for a single-line comment in C?',
        options: ['/* comment */', '# comment', '-- comment','// comment', ],
        correctAnswer: '// comment',
      ),
      Question(
        questionText: 'What is the purpose of the while loop in C?',
        options: [ 'Make decisions', 'Execute code repeatedly','Define a function', 'Allocate memory'],
        correctAnswer: 'Execute code repeatedly',
      ),
      Question(
        questionText: 'What is the purpose of the continue statement in C?',
        options: [ 'Exit from loop', 'Declare a variable', 'Print output','Skip rest of current iteration',],
        correctAnswer: 'Skip rest of current iteration',
      ),
      Question(
        questionText: 'What is the purpose of the for loop in C?',
        options: [ 'Make decisions', 'Define a function', 'Execute code repeatedly','Allocate memory'],
        correctAnswer: 'Execute code repeatedly',
      ),
      Question(
        questionText: 'What is the purpose of the #include directive in C?',
        options: [ 'Declare variables', 'Define functions', 'Allocate memory','Include header files',],
        correctAnswer: 'Include header files',
      ),
      Question(
        questionText: 'What is the purpose of the do-while loop in C?',
        options: [ 'Make decisions', 'Define a function', 'Allocate memory','Execute code repeatedly',],
        correctAnswer: 'Execute code repeatedly',
      ),
      Question(
        questionText: 'What is the purpose of the switch statement in C?',
        options: [ 'Make decisions', 'Select one of many code blocks','Define a loop', 'Declare variables'],
        correctAnswer: 'Select one of many code blocks',
      ),
      Question(
        questionText: 'What is the purpose of the % operator in C?',
        options: [ 'Perform exponentiation', 'Access structure members','Calculate remainder', 'Allocate memory'],
        correctAnswer: 'Calculate remainder',
      ),
      Question(
        questionText: 'What is the syntax for declaring a constant in C?',
        options: [ 'datatype constantName = value;','const datatype constantName = value;', 'constantName = value;', 'value constantName datatype;'],
        correctAnswer: 'const datatype constantName = value;',
      ),
      Question(
        questionText: 'What is the purpose of the do-while loop in C?',
        options: ['Execute code repeatedly', 'Make decisions', 'Define a function', 'Allocate memory'],
        correctAnswer: 'Execute code repeatedly',
      ),
      Question(
        questionText: 'What is the purpose of the continue statement in C?',
        options: ['Skip rest of current iteration', 'Exit from loop', 'Declare a variable', 'Print output'],
        correctAnswer: 'Skip rest of current iteration',
      ),
      Question(
        questionText: 'What is the purpose of the for loop in C?',
        options: ['Execute code repeatedly', 'Make decisions', 'Define a function', 'Allocate memory'],
        correctAnswer: 'Execute code repeatedly',
      ),
      Question(
        questionText: 'What is the purpose of the #include directive in C?',
        options: ['Include header files', 'Declare variables', 'Define functions', 'Allocate memory'],
        correctAnswer: 'Include header files',
      ),
      Question(
        questionText: 'What is the purpose of the do-while loop in C?',
        options: [ 'Make decisions', 'Define a function', 'Execute code repeatedly','Allocate memory'],
        correctAnswer: 'Execute code repeatedly',
      ),
      Question(
        questionText: 'What is the purpose of the switch statement in C?',
        options: ['Select one of many code blocks', 'Make decisions', 'Define a loop', 'Declare variables'],
        correctAnswer: 'Select one of many code blocks',
      ),
      Question(
        questionText: 'What is the purpose of the % operator in C?',
        options: [ 'Perform exponentiation', 'Access structure members','Calculate remainder', 'Allocate memory'],
        correctAnswer: 'Calculate remainder',
      ),
      Question(
        questionText: 'What is the syntax for declaring a constant in C?',
        options: ['const datatype constantName = value;', 'datatype constantName = value;', 'constantName = value;', 'value constantName datatype;'],
        correctAnswer: 'const datatype constantName = value;',
      ),
      Question(
        questionText: 'What is the purpose of the break statement in C?',
        options: [ 'Continue to next iteration', 'Print output', 'Declare a variable','Exit from loop',],
        correctAnswer: 'Exit from loop',
      ),
      Question(
        questionText: 'Which header file is used for input and output operations in C?',
        options: [ 'math.h', 'stdlib.h', 'stdio.h','string.h'],
        correctAnswer: 'stdio.h',
      ),
      Question(
        questionText: 'What is the purpose of the if-else statement in C?',
        options: ['Define a loop', 'Declare variables', 'Print output','Make decisions', ],
        correctAnswer: 'Make decisions',
      ),
      Question(
        questionText: 'What is the syntax for a single-line comment in C?',
        options: ['// comment', '/* comment */', '# comment', '-- comment'],
        correctAnswer: '// comment',
      ),
      Question(
        questionText: 'What is the purpose of the while loop in C?',
        options: [ 'Make decisions','Execute code repeatedly', 'Define a function', 'Allocate memory'],
        correctAnswer: 'Execute code repeatedly',
      ),
      Question(
        questionText: 'What is the purpose of the continue statement in C?',
        options: ['Skip rest of current iteration', 'Exit from loop', 'Declare a variable', 'Print output'],
        correctAnswer: 'Skip rest of current iteration',
      ),
    ];
  }

  List<Question> dataStructuresQuestions() {
    return [
      Question(
        questionText: 'Binary search tree search time complexity?',
        options: ['O(1)', 'O(log n)', 'O(n)', 'O(n log n)'],
        correctAnswer: 'O(log n)',
      ),
      Question(
        questionText: 'Which structure uses LIFO principle?',
        options: ['Queue', 'Stack', 'Linked List', 'Tree'],
        correctAnswer: 'Stack',
      ),
      Question(
        questionText: 'Best average case sorting algorithm?',
        options: ['Bubble Sort', 'Insertion Sort', 'Quick Sort', 'Selection Sort'],
        correctAnswer: 'Quick Sort',
      ),
      Question(
        questionText: 'Best for priority queue implementation?',
        options: ['Stack', 'Queue', 'Heap', 'Linked List'],
        correctAnswer: 'Heap',
      ),
      Question(
        questionText: 'Sequential element access structure?',
        options: ['Queue', 'Stack', 'Linked List', 'Array'],
        correctAnswer: 'Array',
      ),
      Question(
        questionText: 'Hierarchical relationship representation?',
        options: ['Stack', 'Queue', 'Tree', 'Graph'],
        correctAnswer: 'Tree',
      ),
      Question(
        questionText: 'BFS implementation structure?',
        options: ['Stack', 'Queue', 'Tree', 'Linked List'],
        correctAnswer: 'Queue',
      ),
      Question(
        questionText: 'DFS implementation structure?',
        options: ['Stack', 'Queue', 'Tree', 'Linked List'],
        correctAnswer: 'Stack',
      ),
      Question(
        questionText: 'Non-linear structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Array'],
        correctAnswer: 'Linked List',
      ),
      Question(
        questionText: 'Graph representation structure?',
        options: ['Stack', 'Queue', 'Tree', 'Linked List'],
        correctAnswer: 'Linked List',
      ),
      Question(
        questionText: 'Constant time search, insert, delete?',
        options: ['Array', 'Linked List', 'Hash Table', 'Tree'],
        correctAnswer: 'Hash Table',
      ),
      Question(
        questionText: 'FIFO principle structure?',
        options: ['Queue', 'Stack', 'Linked List', 'Tree'],
        correctAnswer: 'Queue',
      ),
      Question(
        questionText: 'Worst average case sorting algorithm?',
        options: ['Quick Sort', 'Merge Sort', 'Bubble Sort', 'Insertion Sort'],
        correctAnswer: 'Bubble Sort',
      ),
      Question(
        questionText: 'Unsuitable for recursion implementation?',
        options: ['Stack', 'Queue', 'Linked List', 'Tree'],
        correctAnswer: 'Queue',
      ),
      Question(
        questionText: 'Undo functionality in text editors?',
        options: ['Stack', 'Queue', 'Linked List', 'Array'],
        correctAnswer: 'Stack',
      ),
      Question(
        questionText: 'Polynomial representation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Array'],
        correctAnswer: 'Array',
      ),
      Question(
        questionText: 'Symbol table implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Hash Table'],
        correctAnswer: 'Hash Table',
      ),
      Question(
        questionText: 'Memory pool implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Array'],
        correctAnswer: 'Array',
      ),
      Question(
        questionText: 'Cache implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Array'],
        correctAnswer: 'Array',
      ),
      Question(
        questionText: 'Circular buffer implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Array'],
        correctAnswer: 'Array',
      ),
      Question(
        questionText: 'LRU cache implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Hash Table'],
        correctAnswer: 'Queue',
      ),
      Question(
        questionText: 'Hash map implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Hash Table'],
        correctAnswer: 'Hash Table',
      ),
      Question(
        questionText: 'Trie implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Tree'],
        correctAnswer: 'Tree',
      ),
      Question(
        questionText: 'Binary search tree implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Tree'],
        correctAnswer: 'Tree',
      ),
      Question(
        questionText: 'Balanced binary search tree implementation structure?',
        options: ['AVL Tree', 'Heap', 'B-tree', 'Trie'],
        correctAnswer: 'AVL Tree',
      ),
      Question(
        questionText: 'Disjoint sets implementation structure?',
        options: ['Stack', 'Queue', 'LinkedList', 'Graph'],
        correctAnswer: 'Graph',
      ),
      Question(
        questionText: 'Kruskal\'s minimum spanning tree algorithm implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Graph'],
        correctAnswer: 'Graph',
      ),
      Question(
        questionText: 'Fibonacci heap implementation structure?',
        options: ['Stack', 'Queue', 'Linked List', 'Heap'],
        correctAnswer: 'Heap',
      ),
    ];
  }

  List<Question> algorithmsQuestions() {
    return [
      Question(
        questionText: 'What’s the time complexity of bubble sort?',
        options: ['O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)'],
        correctAnswer: 'O(n^2)',
      ),
      Question(
        questionText: 'Which sort is stable?',
        options: ['Quick Sort', 'Merge Sort', 'Heap Sort', 'Selection Sort'],
        correctAnswer: 'Merge Sort',
      ),
      Question(
        questionText: 'What’s the principle of a stack?',
        options: ['FIFO', 'LIFO', 'FILO', 'LILO'],
        correctAnswer: 'LIFO',
      ),
      Question(
        questionText: 'Binary search’s worst-case time complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(1)'],
        correctAnswer: 'O(log n)',
      ),
      Question(
        questionText: 'Which algorithm finds the shortest path in a weighted graph?',
        options: ['DFS', 'BFS', 'Dijkstra’s', 'Prim’s'],
        correctAnswer: 'Dijkstra’s',
      ),
      Question(
        questionText: 'Which sort isn’t stable?',
        options: ['Bubble Sort', 'Insertion Sort', 'Quick Sort', 'Merge Sort'],
        correctAnswer: 'Quick Sort',
      ),
      Question(
        questionText: 'Quick sort’s space complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(1)'],
        correctAnswer: 'O(log n)',
      ),
      Question(
        questionText: 'Best average-case time complexity sort?',
        options: ['Bubble Sort', 'Insertion Sort', 'Merge Sort', 'Selection Sort'],
        correctAnswer: 'Merge Sort',
      ),
      Question(
        questionText: 'Finds strongly connected components in a graph?',
        options: ['Kruskal’s', 'Prim’s', 'Dijkstra’s', 'Tarjan’s'],
        correctAnswer: 'Tarjan’s',
      ),
      Question(
        questionText: 'Insertion sort’s worst-case time complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(1)'],
        correctAnswer: 'O(n^2)',
      ),
      Question(
        questionText: 'Algorithm repeatedly divides a list into smaller sublists?',
        options: ['Bubble Sort', 'Merge Sort', 'Quick Sort', 'Selection Sort'],
        correctAnswer: 'Quick Sort',
      ),
      Question(
        questionText: 'Finds maximum flow in a flow network?',
        options: ['Bellman-Ford', 'Dijkstra’s', 'Floyd-Warshall', 'Ford-Fulkerson'],
        correctAnswer: 'Ford-Fulkerson',
      ),
      Question(
        questionText: 'Selection sort’s time complexity?',
        options: ['O(n)', 'O(n log n)', 'O(n^2)', 'O(log n)'],
        correctAnswer: 'O(n^2)',
      ),
      Question(
        questionText: 'Traverses a graph in depthward motion?',
        options: ['DFS', 'BFS', 'Dijkstra’s', 'Prim’s'],
        correctAnswer: 'DFS',
      ),
      Question(
        questionText: 'Merge sort’s space complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(1)'],
        correctAnswer: 'O(n)',
      ),
      Question(
        questionText: 'Data structure used in Dijkstra’s?',
        options: ['Stack', 'Queue', 'Priority Queue', 'Linked List'],
        correctAnswer: 'Priority Queue',
      ),
      Question(
        questionText: 'Sort with best worst-case time complexity?',
        options: ['Bubble Sort', 'Merge Sort', 'Quick Sort', 'Insertion Sort'],
        correctAnswer: 'Merge Sort',
      ),
      Question(
        questionText: 'Bubble sort’s best-case time complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(1)'],
        correctAnswer: 'O(n)',
      ),
      Question(
        questionText: 'Finds minimum spanning tree of a graph?',
        options: ['Kruskal’s', 'Dijkstra’s', 'Prim’s', 'Bellman-Ford'],
        correctAnswer: 'Prim’s',
      ),
      Question(
        questionText: 'Quick sort’s best-case time complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(1)'],
        correctAnswer: 'O(n log n)',
      ),
      Question(
        questionText: 'Finds shortest path in an unweighted graph?',
        options: ['DFS', 'BFS', 'Dijkstra’s', 'Prim’s'],
        correctAnswer: 'BFS',
      ),
      Question(
        questionText: 'Selection sort’s space complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(1)'],
        correctAnswer: 'O(1)',
      ),
      Question(
        questionText: 'Finds transitive closure of a graph?',
        options: ['Floyd-Warshall', 'Bellman-Ford', 'Kruskal’s', 'Dijkstra’s'],
        correctAnswer: 'Floyd-Warshall',
      ),
      Question(
        questionText: 'Merge sort’s worst-case time complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(n log n)'],
        correctAnswer: 'O(n log n)',
      ),
      Question(
        questionText: 'Data structure used in Prim’s?',
        options: ['Stack', 'Queue', 'Priority Queue', 'Linked List'],
        correctAnswer: 'Priority Queue',
      ),
      Question(
        questionText: 'Finds strongly connected components in a directed graph?',
        options: ['Dijkstra’s', 'Kruskal’s', 'Tarjan’s', 'Floyd-Warshall'],
        correctAnswer: 'Tarjan’s',
      ),
      Question(
        questionText: 'BFS’s time complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(n + m)'],
        correctAnswer: 'O(n + m)',
      ),
      Question(
        questionText: 'Finds single source shortest path in a graph with negative edge weights?',
        options: ['Dijkstra’s', 'Floyd-Warshall', 'Bellman-Ford', 'Kruskal’s'],
        correctAnswer: 'Bellman-Ford',
      ),
      Question(
        questionText: 'Heap sort’s time complexity?',
        options: ['O(n)', 'O(log n)', 'O(n^2)', 'O(n log n)'],
        correctAnswer: 'O(n log n)',
      ),
      Question(
        questionText: 'Finds articulation points in a graph?',
        options: ['Dijkstra’s', 'Kruskal’s', 'Tarjan’s', 'Prim’s'],
        correctAnswer: 'Tarjan’s',
      ),
    ];
  }

  List<Question> webDevelopmentQuestions() {
    return [
      Question(
        questionText: 'Which language is used for styling web pages?',
        options: ['HTML', 'CSS', 'JavaScript', 'Python'],
        correctAnswer: 'CSS',
      ),
      Question(
        questionText: 'What does HTML stand for?',
        options: ['Hyper Text Markup Language', 'High Tech Markup Language', 'Hyperlinks and Text Markup Language', 'Home Tool Markup Language'],
        correctAnswer: 'Hyper Text Markup Language',
      ),
      Question(
        questionText: 'Which tag is used to define an image in HTML?',
        options: ['<img>', '<src>', '<image>', '<picture>'],
        correctAnswer: '<img>',
      ),
      Question(
        questionText: 'What does CSS stand for?',
        options: ['Computer Style Sheets', 'Cascading Style Sheets', 'Creative Style Sheets', 'Custom Style Sheets'],
        correctAnswer: 'Cascading Style Sheets',
      ),
      Question(
        questionText: 'Which CSS property is used to change the text color?',
        options: ['text-color', 'font-color', 'color', 'text-style'],
        correctAnswer: 'color',
      ),
      Question(
        questionText: 'Which of the following is NOT a valid CSS selector?',
        options: ['.class', '#id', '//tagname', '* (asterisk)'],
        correctAnswer: '//tagname',
      ),
      Question(
        questionText: 'Which programming language is used for adding interactivity to web pages?',
        options: ['HTML', 'CSS', 'JavaScript', 'PHP'],
        correctAnswer: 'JavaScript',
      ),
      Question(
        questionText: 'Which symbol is used to access an element by ID in JavaScript?',
        options: ['#', '.', '@', '_'],
        correctAnswer: '#',
      ),
      Question(
        questionText: 'Which function is used to print something in JavaScript?',
        options: ['console.log()', 'print()', 'document.write()', 'echo()'],
        correctAnswer: 'console.log()',
      ),
      Question(
        questionText: 'Which of the following is NOT a valid JavaScript data type?',
        options: ['string', 'boolean', 'float', 'object'],
        correctAnswer: 'float',
      ),
      Question(
        questionText: 'Which event occurs when the user clicks on an HTML element?',
        options: ['mouseover', 'mouseclick', 'click', 'hover'],
        correctAnswer: 'click',
      ),
      Question(
        questionText: 'Which tag is used to define a list in HTML?',
        options: ['<ul>', '<li>', '<list>', '<ol>'],
        correctAnswer: '<ul>',
      ),
      Question(
        questionText: 'Which property is used to set the background color in CSS?',
        options: ['background-color', 'color', 'bg-color', 'bg'],
        correctAnswer: 'background-color',
      ),
      Question(
        questionText: 'Which CSS property is used to change the font size?',
        options: ['text-size', 'font-size', 'size', 'font-style'],
        correctAnswer: 'font-size',
      ),
      Question(
        questionText: 'Which symbol is used to select all elements in CSS?',
        options: ['#', '.', '*', '%'],
        correctAnswer: '*',
      ),
      Question(
        questionText: 'Which tag is used to create a hyperlink in HTML?',
        options: ['<hyperlink>', '<link>', '<a>', '<href>'],
        correctAnswer: '<a>',
      ),
      Question(
        questionText: 'Which attribute is used to define the URL of a hyperlink in HTML?',
        options: ['url', 'link', 'href', 'src'],
        correctAnswer: 'href',
      ),
      Question(
        questionText: 'Which property is used to align text in CSS?',
        options: ['align-text', 'text-align', 'align', 'align-text'],
        correctAnswer: 'text-align',
      ),
      Question(
        questionText: 'Which function is used to convert a string to an integer in JavaScript?',
        options: ['toInt()', 'parseInt()', 'convertInt()', 'int()'],
        correctAnswer: 'parseInt()',
      ),
      Question(
        questionText: 'Which operator is used for strict equality comparison in JavaScript?',
        options: ['==', '===', '=', '!=='],
        correctAnswer: '===',
      ),
      Question(
        questionText: 'Which CSS property is used to create rounded corners?',
        options: ['border-radius', 'round-corner', 'border-style', 'corner-radius'],
        correctAnswer: 'border-radius',
      ),
      Question(
        questionText: 'Which of the following is NOT a valid value for the display property in CSS?',
        options: ['block', 'inline', 'flexbox', 'none'],
        correctAnswer: 'flexbox',
      ),
      Question(
        questionText: 'Which event occurs when the user submits a form?',
        options: ['submit', 'send', 'click', 'enter'],
        correctAnswer: 'submit',
      ),
      Question(
        questionText: 'Which tag is used to create a table in HTML?',
        options: ['<table>', '<tab>', '<tr>', '<td>'],
        correctAnswer: '<table>',
      ),
      Question(
        questionText: 'Which CSS property is used to specify the space between lines of text?',
        options: ['line-spacing', 'spacing', 'line-height', 'text-spacing'],
        correctAnswer: 'line-height',
      ),
      Question(
        questionText: 'Which method is used to remove the last element from an array in JavaScript?',
        options: ['pop()', 'shift()', 'removeLast()', 'delete()'],
        correctAnswer: 'pop()',
      ),
      Question(
        questionText: 'Which CSS property is used to set the width of an element?',
        options: ['size', 'width', 'element-width', 'set-width'],
        correctAnswer: 'width',
      ),
      Question(
        questionText: 'Which of the following is NOT a valid value for the position property in CSS?',
        options: ['relative', 'absolute', 'static', 'center'],
        correctAnswer: 'center',
      ),
      Question(
        questionText: 'Which method is used to add a new item to the end of an array in JavaScript?',
        options: ['push()', 'append()', 'add()', 'insert()'],
        correctAnswer: 'push()',
      ),
      Question(
        questionText: 'Which HTML tag is used to define the structure of the document, including headings and paragraphs?',
        options: ['<body>', '<header>', '<section>', '<head>'],
        correctAnswer: '<body>',
      ),
    ];
  }

  List<Question> mobileAppDevelopmentQuestions() {
    return [
      Question(
        questionText: 'Primary language for Android app development?',
        options: ['Swift', 'Kotlin', 'Objective-C', 'Java'],
        correctAnswer: 'Java',
      ),
      Question(
        questionText: 'Main tool for developing native iOS apps?',
        options: ['Android Studio', 'Visual Studio', 'Xcode', 'Eclipse'],
        correctAnswer: 'Xcode',
      ),
      Question(
        questionText: 'Not a popular cross-platform framework?',
        options: ['React Native', 'Xamarin', 'Flutter', 'Swift'],
        correctAnswer: 'Swift',
      ),
      Question(
        questionText: 'Common file format for Android app layouts?',
        options: ['.xml', '.json', '.html', '.txt'],
        correctAnswer: '.xml',
      ),
      Question(
        questionText: 'API stands for?',
        options: ['Application Performance Indicator', 'Application Programming Interface', 'App Program Instruction', 'Application Program Installation'],
        correctAnswer: 'Application Programming Interface',
      ),
      Question(
        questionText: 'Write once, deploy across platforms approach?',
        options: ['Native app development', 'Hybrid app development', 'Cross-platform app development', 'Web app development'],
        correctAnswer: 'Cross-platform app development',
      ),
      Question(
        questionText: 'Common tool for version control?',
        options: ['Git', 'Subversion (SVN)', 'Mercurial', 'Perforce'],
        correctAnswer: 'Git',
      ),
      Question(
        questionText: 'IDE for iOS app development?',
        options: ['Android Studio', 'Visual Studio', 'Xcode', 'IntelliJ IDEA'],
        correctAnswer: 'Xcode',
      ),
      Question(
        questionText: 'Purpose of APK in Android?',
        options: ['Application Package Kit', 'Android Programming Kit', 'Application Program Key', 'Android Package Kit'],
        correctAnswer: 'Android Package Kit',
      ),
      Question(
        questionText: 'Language for native iOS apps?',
        options: ['Kotlin', 'Objective-C', 'Swift', 'Java'],
        correctAnswer: 'Swift',
      ),
      Question(
        questionText: 'Google’s framework for native Android apps?',
        options: ['React Native', 'Xamarin', 'Flutter', 'Ionic'],
        correctAnswer: 'Flutter',
      ),
      Question(
        questionText: 'Not a common Android app layout component?',
        options: ['TextView', 'Button', 'Div', 'ImageView'],
        correctAnswer: 'Div',
      ),
      Question(
        questionText: 'Platform using Interface Builder?',
        options: ['Android', 'iOS', 'Windows Mobile', 'BlackBerry'],
        correctAnswer: 'iOS',
      ),
      Question(
        questionText: 'SDK stands for?',
        options: ['Software Development Kit', 'System Development Kit', 'Source Development Kit', 'Script Development Kit'],
        correctAnswer: 'Software Development Kit',
      ),
      Question(
        questionText: 'Popular database in mobile app development?',
        options: ['MySQL', 'Oracle', 'SQLite', 'MongoDB'],
        correctAnswer: 'SQLite',
      ),
      Question(
        questionText: 'Common Android architecture pattern?',
        options: ['MVC', 'MVP', 'MVVM', 'MVI'],
        correctAnswer: 'MVVM',
      ),
      Question(
        questionText: 'Tool for debugging Android apps?',
        options: ['Android Debug Bridge (ADB)', 'iOS Simulator', 'Xcode Debugger', 'Android Studio Debugger'],
        correctAnswer: 'Android Debug Bridge (ADB)',
      ),
      Question(
        questionText: 'Best worst-case time complexity sort?',
        options: ['Bubble Sort', 'Merge Sort', 'Quick Sort', 'Insertion Sort'],
        correctAnswer: 'Quick Sort',
      ),
      Question(
        questionText: 'Common iOS app layout file format?',
        options: ['.xml', '.json', '.storyboard', '.plist'],
        correctAnswer: '.storyboard',
      ),
      Question(
        questionText: 'Gradle’s purpose in Android?',
        options: ['Version control system', 'Programming language', 'Build automation tool', 'Database management system'],
        correctAnswer: 'Build automation tool',
      ),
      Question(
        questionText: 'Framework using web technologies?',
        options: ['React Native', 'Xamarin', 'Flutter', 'Ionic'],
        correctAnswer: 'Ionic',
      ),
      Question(
        questionText: 'Navigation component in Android?',
        options: ['Fragment', 'Activity', 'Intent', 'Service'],
        correctAnswer: 'Fragment',
      ),
      Question(
        questionText: 'Purpose of CocoaTouch in iOS?',
        options: ['Programming language', 'IDE', 'Framework', 'Design pattern'],
        correctAnswer: 'Framework',
      ),
      Question(
        questionText: 'Distributing iOS apps to users?',
        options: ['Google Play Store', 'App Store Connect', 'TestFlight', 'Fabric'],
        correctAnswer: 'TestFlight',
      ),
      Question(
        questionText: 'iOS tool for designing interfaces?',
        options: ['Storyboard', 'File format for app data', 'Tool for creating app icons', 'Version control system'],
        correctAnswer: 'Storyboard',
      ),
      Question(
        questionText: 'Android component managing app resources?',
        options: ['Resource Manager', 'Asset Manager', 'PackageManager', 'Layout Manager'],
        correctAnswer: 'Resource Manager',
      ),
      Question(
        questionText: 'Cross-platform approach using web technologies?',
        options: ['Native app development', 'Hybrid app development', 'Cross-platform app development', 'Progressive web app development'],
        correctAnswer: 'Hybrid app development',
      ),
      Question(
        questionText: 'CocoaPods’ purpose in iOS?',
        options: ['Version control system', 'Dependency manager', 'Build automation tool', 'Testing framework'],
        correctAnswer: 'Dependency manager',
      ),
      Question(
        questionText: 'iOS tool for profiling app performance?',
        options: ['Xcode Profiler', 'Android Studio Profiler', 'Instruments', 'Firebase Performance Monitoring'],
        correctAnswer: 'Instruments',
      ),
      Question(
        questionText: 'Platform using Android Asset Packaging Tool (AAPT)?',
        options: ['Android', 'iOS', 'Windows Mobile', 'BlackBerry'],
        correctAnswer: 'Android',
      ),
    ];
  }

  List<Question> databaseManagementQuestions() {
    return [
      Question(
        questionText: 'Which database model organizes data in a tree-like structure?',
        options: [ 'Relational','Hierarchical', 'Network', 'Object-oriented'],
        correctAnswer: 'Hierarchical',
      ),
      Question(
        questionText: 'What does ACID stand for in database transactions?',
        options: ['Atomicity, Consistency, Isolation, Durability', 'Association, Collection, Integration, Dependency', 'Accuracy, Control, Integrity, Dependency', 'Allocation, Configuration, Interaction, Deletion'],
        correctAnswer: 'Atomicity, Consistency, Isolation, Durability',
      ),
      Question(
        questionText: 'Which SQL keyword retrieves data from a database?',
        options: ['FETCH', 'SELECT', 'SEARCH', 'RETRIEVE'],
        correctAnswer: 'SELECT',
      ),
      Question(
        questionText: 'Which join returns all rows from both tables, joining records only where the key exists in both tables?',
        options: [ 'Outer join', 'Left join', 'Inner join','Right join'],
        correctAnswer: 'Inner join',
      ),
      Question(
        questionText: 'What does the GROUP BY clause do in SQL?',
        options: ['Sorts data in ascending order', 'Filters rows based on a condition', 'Performs aggregate functions on grouped data', 'Retrieves data from multiple tables'],
        correctAnswer: 'Performs aggregate functions on grouped data',
      ),
      Question(
        questionText: 'Which database model organizes data in a network-like structure?',
        options: ['Hierarchical', 'Relational', 'Network', 'Object-oriented'],
        correctAnswer: 'Network',
      ),
      Question(
        questionText: 'Which type of database model allows flexible data representation?',
        options: ['Relational', 'Object-oriented', 'Hierarchical', 'Network'],
        correctAnswer: 'Object-oriented',
      ),
      Question(
        questionText: 'What is a primary key in a database?',
        options: ['Unique identifier for a table', 'Index for sorting data', 'Foreign key reference', 'Table constraint'],
        correctAnswer: 'Unique identifier for a table',
      ),
      Question(
        questionText: 'Which SQL statement is used to add new data to a database?',
        options: [ 'UPDATE', 'DELETE','INSERT', 'ALTER'],
        correctAnswer: 'INSERT',
      ),
      Question(
        questionText: 'What is normalization in database design?',
        options: ['Process of organizing data to minimize redundancy', 'Adding more data fields to a table', 'Combining multiple tables into one', 'Deleting outdated records from a database'],
        correctAnswer: 'Process of organizing data to minimize redundancy',
      ),
      Question(
        questionText: 'Which database model stores data in tables with rows and columns?',
        options: ['Hierarchical', 'Relational', 'Network', 'Object-oriented'],
        correctAnswer: 'Relational',
      ),
      Question(
        questionText: 'What does SQL stand for?',
        options: ['Structured Query Language', 'Sequential Query Logic', 'Standard Query Lexicon', 'Systematic Query Layout'],
        correctAnswer: 'Structured Query Language',
      ),
      Question(
        questionText: 'Which type of join returns all rows from the left table and matching rows from the right table?',
        options: ['Inner join', 'Outer join', 'Left join', 'Right join'],
        correctAnswer: 'Left join',
      ),
      Question(
        questionText: 'What does the DDL acronym stand for in database management?',
        options: ['Data Definition Language', 'Data Display Language', 'Data Development Language', 'Data Distribution Layer'],
        correctAnswer: 'Data Definition Language',
      ),
      Question(
        questionText: 'Which SQL function is used to count the number of rows in a table?',
        options: ['SUM()', 'COUNT()', 'AVG()', 'MAX()'],
        correctAnswer: 'COUNT()',
      ),
      Question(
        questionText: 'What is a foreign key in a relational database?',
        options: ['Key that references another table\'s primary key', 'Unique identifier for a table', 'Index for sorting data', 'Constraint on data values'],
        correctAnswer: 'Key that references another table\'s primary key',
      ),
      Question(
        questionText: 'Which database model is used in distributed systems?',
        options: ['Hierarchical', 'Relational', 'Network', 'Object-oriented'],
        correctAnswer: 'Network',
      ),
      Question(
        questionText: 'What does the acronym CRUD stand for in database operations?',
        options: ['Copy, Remove, Update, Distribute','Create, Read, Update, Delete',  'Collect, Render, Upload, Display', 'Compile, Review, Update, Deploy'],
        correctAnswer: 'Create, Read, Update, Delete',
      ),
      Question(
        questionText: 'Which SQL clause is used to filter rows based on a condition?',
        options: ['GROUP BY', 'ORDER BY', 'WHERE', 'HAVING'],
        correctAnswer: 'WHERE',
      ),
      Question(
        questionText: 'What is the purpose of indexing in databases?',
        options: ['To speed up data retrieval', 'To encrypt data', 'To sort data alphabetically', 'To create backups'],
        correctAnswer: 'To speed up data retrieval',
      ),
      Question(
        questionText: 'Which SQL statement is used to remove data from a database?',
        options: [ 'INSERT', 'UPDATE', 'SELECT','DELETE',],
        correctAnswer: 'DELETE',
      ),
      Question(
        questionText: 'What is a data warehouse?',
        options: ['A repository of historical data', 'A place to store hardware', 'A system for cloud storage', 'A database management tool'],
        correctAnswer: 'A repository of historical data',
      ),
      Question(
        questionText: 'Which normalization form ensures that non-key attributes are fully functionally dependent on the primary key?',
        options: ['First normal form (1NF)', 'Second normal form (2NF)', 'Third normal form (3NF)', 'Boyce-Codd normal form (BCNF)'],
        correctAnswer: 'Third normal form (3NF)',
      ),
      Question(
        questionText: 'What does the term “OLAP” stand for in database systems?',
        options: ['Online Analytical Processing', 'Operational Log Analysis Protocol', 'Overlapping Logical Access Protocol', 'Object-Level Application Platform'],
        correctAnswer: 'Online Analytical Processing',
      ),
      Question(
        questionText: 'Which SQL command is used to change the structure of a table?',
        options: ['ALTER TABLE', 'MODIFY TABLE', 'UPDATE TABLE', 'CHANGE TABLE'],
        correctAnswer: 'ALTER TABLE',
      ),
      Question(
        questionText: 'What is the purpose of a view in a database?',
        options: ['To store temporary data', 'To provide a virtual table based on a SQL query', 'To perform complex calculations', 'To encrypt sensitive data'],
        correctAnswer: 'To provide a virtual table based on a SQL query',
      ),
      Question(
        questionText: 'Which type of database constraint ensures that all values in a column are unique?',
        options: ['Primary key', 'Foreign key', 'Unique key', 'check constraint'],
        correctAnswer: 'Unique key',
      ),
      Question(
        questionText: 'What does the term “ETL” stand for in data warehousing?',
        options: ['Extract, Transform, Load', 'Encrypt, Tag, Log', 'Export, Transform, Load', 'Edit, Test, Launch'],
        correctAnswer: 'Extract, Transform, Load',
      ),
      Question(
        questionText: 'Which SQL operator is used to retrieve rows that satisfy multiple conditions?',
        options: ['OR', 'NOT', 'AND', 'XOR'],
        correctAnswer: 'AND',
      ),
      Question(
        questionText: 'What does the term “NoSQL” mean?',
        options: ['Not Only SQL', 'No SQL Server', 'No Structured Query Language', 'Non-Specific Query Language'],
        correctAnswer: 'Not Only SQL',
      ),
    ];
  }

  List<Question> computerNetworkingQuestions() {
    return [
      Question(
        questionText: 'Which device connects multiple networks together?',
        options: ['Router', 'Switch', 'Hub', 'Repeater'],
        correctAnswer: 'Router',
      ),
      Question(
        questionText: 'What is the purpose of DHCP?',
        options: ['Assigning IP addresses dynamically', 'Encrypting data packets', 'Routing network traffic', 'Managing DNS records'],
        correctAnswer: 'Assigning IP addresses dynamically',
      ),
      Question(
        questionText: 'What is the default subnet mask for a Class C IP address?',
        options: [ '255.0.0.0', '255.255.255.0','255.255.0.0', '255.255.255.255'],
        correctAnswer: '255.255.255.0',
      ),
      Question(
        questionText: 'Which protocol is used for secure file transfer?',
        options: ['SFTP', 'FTP', 'TFTP', 'HTTP'],
        correctAnswer: 'SFTP',
      ),
      Question(
        questionText: 'What is the function of ARP?',
        options: [ 'Routing packets between networks','Resolving IP addresses to MAC addresses', 'Ensuring data integrity', 'Prioritizing network traffic'],
        correctAnswer: 'Resolving IP addresses to MAC addresses',
      ),
      Question(
        questionText: 'What does DNS stand for?',
        options: [ 'Dynamic Network Service', 'Data Network Security', 'Digital Network Solution','Domain Name System',],
        correctAnswer: 'Domain Name System',
      ),
      Question(
        questionText: 'Which layer of the OSI model is responsible for routing?',
        options: [ 'Layer 4 (Transport)','Layer 3 (Network)', 'Layer 2 (Data Link)', 'Layer 1 (Physical)'],
        correctAnswer: 'Layer 3 (Network)',
      ),
      Question(
        questionText: 'What is the main function of a firewall?',
        options: [ 'To amplify network signals', 'To connect multiple networks together', 'To encrypt data packets'],
        correctAnswer: 'To monitor and control',
      ),
      Question(
        questionText: 'Which protocol is used for sending emails?',
        options: [ 'HTTP', 'FTP', 'SMTP','POP3'],
        correctAnswer: 'SMTP',
      ),
      Question(
        questionText: 'What is the maximum range of Wi-Fi technology in ideal conditions?',
        options: ['100 meters', '50 meters', '500 meters', '10 meters'],
        correctAnswer: '100 meters',
      ),
      Question(
        questionText: 'What is the default port number for HTTP?',
        options: ['443', '22','80',  '21'],
        correctAnswer: '80',
      ),
      Question(
        questionText: 'Which type of cable is commonly used for wired Ethernet networks?',
        options: ['Cat 5e', 'Fiber optic', 'Coaxial', 'USB'],
        correctAnswer: 'Cat 5e',
      ),
      Question(
        questionText: 'What is the function of ICMP?',
        options: [ 'To establish secure connections over a public network','To troubleshoot network connectivity issues', 'To translate private IP addresses to public IP addresses', 'To manage DNS records'],
        correctAnswer: 'To troubleshoot network connectivity issues',
      ),
      Question(
        questionText: 'What does LAN stand for?',
        options: ['Large Area Network', 'Long Antenna Network', 'Local Access Node','Local Area Network', ],
        correctAnswer: 'Local Area Network',
      ),
      Question(
        questionText: 'Which protocol is used for remote shell access?',
        options: ['SSH', 'SMTP', 'HTTP', 'Telnet'],
        correctAnswer: 'SSH',
      ),
      Question(
        questionText: 'What is the purpose of a MAC address?',
        options: ['To uniquely identify network interfaces', 'To assign IP addresses dynamically', 'To encrypt data packets', 'To amplify network signals'],
        correctAnswer: 'To uniquely identify network interfaces',
      ),
      Question(
        questionText: 'Which device operates at the Data Link layer of the OSI model?',
        options: [ 'Router', 'Hub','Switch', 'Repeater'],
        correctAnswer: 'Switch',
      ),
      Question(
        questionText: 'What is the primary function of NAT?',
        options: ['To translate private IP addresses to public IP addresses', 'To connect multiple devices within a network', 'To prioritize network traffic', 'To encrypt data packets'],
        correctAnswer: 'To translate private IP addresses to public IP addresses',
      ),
      Question(
        questionText: 'What is the default port number for HTTPS?',
        options: [ '80', '22','443', '21'],
        correctAnswer: '443',
      ),
      Question(
        questionText: 'What is the purpose of VLAN?',
        options: ['To logically group network devices', 'To encrypt data packets', 'To manage IP addresses', 'To prioritize network traffic'],
        correctAnswer: 'To logically group network devices',
      ),
      Question(
        questionText: 'Which protocol is used for secure web browsing?',
        options: ['HTTPS', 'HTTP', 'FTP', 'SSH'],
        correctAnswer: 'HTTPS',
      ),
      Question(
        questionText: 'What is the function of OSPF?',
        options: ['Network monitoring tool', 'Web server software', 'Routing protocol', 'VPN protocol'],
        correctAnswer: 'Routing protocol',
      ),
      Question(
        questionText: 'What is the maximum data transfer rate of USB 3.0?',
        options: ['5 Gbps', '480 Mbps', '10 Gbps', '1 Gbps'],
        correctAnswer: '5 Gbps',
      ),
      Question(
        questionText: 'Which protocol is used for file sharing over a network?',
        options: ['SMB', 'SMTP', 'FTP', 'Telnet'],
        correctAnswer: 'SMB',
      ),
      Question(
        questionText: 'What is the purpose of STP in Ethernet networks?',
        options: ['To amplify network signals', 'To prevent network loops', 'To manage DNS records', 'To prioritize network traffic'],
        correctAnswer: 'To prevent network loops',
      ),
      Question(
        questionText: 'What is the maximum range of Bluetooth technology?',
        options: ['10 meters', '100 meters', '1 meter', '1000 meters'],
        correctAnswer: '10 meters',
      ),
      Question(
        questionText: 'What does DNS stand for?',
        options: ['Domain Name System', 'Dynamic Network Service', 'Data Network Security', 'Digital Network Solution'],
        correctAnswer: 'Domain Name System',
      ),
      Question(
        questionText: 'Which protocol is used for email retrieval?',
        options: [ 'SMTP', 'FTP', 'HTTP','POP3',],
        correctAnswer: 'POP3',
      ),
      // Add more questions related to Computer Networking
      // ...
    ];
  }

  List<Question> islamicstudy() {
    return [
      Question(
        questionText: 'قرآن پاک میں کل کتنی سورتیں ہیں؟',
        options: ['110', '114', '120', '124'],
        correctAnswer: '114',
      ),

      Question(
        questionText: 'اسلام کے پہلے خلیفہ کون تھے؟',
        options: ['حضرت عمر فاروقؓ', 'حضرت علیؓ', 'حضرت ابو بکر صدیقؓ', 'حضرت عثمانؓ'],
        correctAnswer: 'حضرت ابو بکر صدیقؓ',
      ),

      Question(
        questionText: 'غزوہ بدر کب ہوئی؟',
        options: ['2 ہجری', '3 ہجری', '4 ہجری', '5 ہجری'],
        correctAnswer: '2 ہجری',
      ),

      Question(
        questionText: 'قرآن پاک کی سب سے لمبی سورت کونسی ہے؟',
        options: ['سورۃ الفاتحہ', 'سورۃ البقرہ', 'سورۃ ال عمران', 'سورۃ النساء'],
        correctAnswer: 'سورۃ البقرہ',
      ),

      Question(
        questionText: 'حضرت محمدﷺ کے والد کا نام کیا تھا؟',
        options: ['حضرت ابو طالب', 'حضرت عبد المطلب', 'حضرت عبداللہ', 'حضرت ابو سفیان'],
        correctAnswer: 'حضرت عبداللہ',
      ),

      Question(
        questionText: '”توحید” کا مطلب کیا ہے؟',
        options: ['ایمان اور عمل کا تشکیل', 'اللہ کی واحدیت', 'نماز کا فرض ہونا', 'زکوة دینا'],
        correctAnswer: 'اللہ کی واحدیت',
      ),
      Question(
        questionText: '”قبلہ” کا مطلب کیا ہے؟',
        options: ['روزہ', 'نماز کا رُکن', 'نماز کی جانب', 'زکوة کا وقت'],
        correctAnswer: 'نماز کی جانب',
      ),
      Question(
        questionText: '”زکوة” کا مقصد کیا ہے؟',
        options: ['مساکین کی مدد', 'رمضان کا مہینہ', 'قرآن کا تلاوت', 'حج کا ادا کرنا'],
        correctAnswer: 'مساکین کی مدد',
      ),
      Question(
        questionText: '”حدیث” کا کیا مطلب ہے؟',
        options: ['قرآن کا حصہ', 'نبی ﷺ کی روایت', 'روزہ رکھنا', 'قربانی کا طریقہ'],
        correctAnswer: 'نبی ﷺ کی روایت',
      ),
      Question(
        questionText: '”صوم” کا دوسرا نام کیا ہے؟',
        options: ['نماز', 'روزہ', 'زکوة', 'حج'],
        correctAnswer: 'روزہ',
      ),
      Question(
        questionText: '”جمعہ” کو کتنی رکعت نماز ہوتی ہے؟',
        options: ['۲', '۴', '۶', '۸'],
        correctAnswer: '۲',
      ),
      Question(
        questionText: '”حج” کا پہلا فرض کیا ہے؟',
        options: ['طواف کرنا', 'سعی کرنا', 'احرام باندھنا', 'عرفات پر وقوف کرنا'],
        correctAnswer: 'احرام باندھنا',
      ),
      Question(
        questionText: '”صدقہ” کا مقصد کیا ہے؟',
        options: ['مسجد کی تعمیر', 'غریبوں کی مدد', 'روزہ رکھنا', 'حج کا ادا کرنا'],
        correctAnswer: 'غریبوں کی مدد',
      ),
      Question(
        questionText: '”طلاق” کا دوسرا نام کیا ہے؟',
        options: ['نکاح', 'احترام', 'NULL', 'صلح'],
        correctAnswer: 'NUll',
      ),
      Question(
        questionText: '”زکوة” کس چیز کا حصہ ہے؟',
        options: ['روزہ', 'نماز', 'مال', 'زکوة'],
        correctAnswer: 'مال',
      ),
      Question(
        questionText: '”حجاب” کا مقصد کیا ہے؟',
        options: ['زیورات کی پیشکش', 'عفت اور حفاظت', 'مسجد کی تعمیر', 'زکوة دینا'],
        correctAnswer: 'عفت اور حفاظت',
      ),
      Question(
        questionText: '”جنت” کا مطلب کیا ہے؟',
        options: ['زکوة کا وقت', 'امن و سلامتی',  'زکوة کی مدد','Null'],
        correctAnswer: 'Null',
      ),
      Question(
        questionText: '”صدقہ جاریہ” کیا ہے؟',
        options: ['نماز کا رکن', 'مومن کی مدد', 'غریبوں کی مدد', 'نفع دینے والا عمل'],
        correctAnswer: 'نفع دینے والا عمل',
      ),
      Question(
        questionText: '”زمزم” کا مطلب کیا ہے؟',
        options: ['مسجد کا نام', 'مکہ کا ایک حصہ', 'پانی کا چشمہ', 'نماز کا رکن'],
        correctAnswer: 'پانی کا چشمہ',
      ),
      Question(
        questionText: '”عید الفطر” کا دوسرا نام کیا ہے؟',
        options: [ 'عید الضحیٰ','عید اللہ', 'عید میلاد النبی', 'Null'],
        correctAnswer: 'Null',
      ),
      Question(
        questionText: '”حج” کا پہلا ارکان کیا ہے؟',
        options: ['طواف کرنا', 'سعی کرنا', 'احرام باندھنا', 'عرفات پر وقوف کرنا'],
        correctAnswer: 'احرام باندھنا',
      ),
      Question(
        questionText: '”وضو” کا مطلب کیا ہے؟',
        options: ['نماز کی جگہ', 'نماز کے لباس', 'نماز کے وقت', 'Null'],
        correctAnswer: 'Null',
      ),
      Question(
        questionText: '”خطبہ” کا مطلب کیا ہے؟',
        options: ['نماز کا حصہ', 'نماز کی جانب', 'نماز کا رکن', 'خطبہ'],
        correctAnswer: 'خطبہ',
      ),
      Question(
        questionText: '”رکوع” کا مطلب کیا ہے؟',
        options: ['سجدہ', 'نماز کا حصہ', 'خواب', 'رکوع'],
        correctAnswer: 'رکوع',
      ),
      Question(
        questionText: '”قربانی” کس موقع پر کی جاتی ہے؟',
        options: ['شادی', 'Null', 'عید الضحیٰ', 'زکوة کے وقت'],
        correctAnswer: 'عید الضحیٰ',
      ),
      Question(
        questionText: '”قیام” کا مطلب کیا ہے؟',
        options: ['بیٹھنا', 'اٹھنا', 'کھڑا ہونا', 'نماز کے حصہ'],
        correctAnswer: 'کھڑا ہونا',
      ),
      Question(
        questionText: '”منبر” کا مطلب کیا ہے؟',
        options: ['کتاب', 'مسجد کا مرکز', 'نماز کا رکن', 'خطبہ دینے والا عالم'],
        correctAnswer: 'خطبہ دینے والا عالم',
      ),
      Question(
        questionText: '”شرک” کا مطلب کیا ہے؟',
        options: ['غیب کی مدد ماننا', 'اللہ کی رضا سے بغیر دوسرے کو پوجنا', 'صبر کرنا', 'علم کی تلاش'],
        correctAnswer: 'اللہ کی رضا سے بغیر دوسرے کو پوجنا',
      ),
      Question(
        questionText: '”صدقہ فطر” کا مقصد کیا ہے؟',
        options: ['روزہ رکھنا', 'زکوة دینا', 'غریبوں کی مدد', 'رمضان کا انعقاد'],
        correctAnswer: 'زکوة دینا',
      ),
      Question(
        questionText: '”مسجد” کا مطلب کیا ہے؟',
        options: ['مکہ کا مقام', 'نماز کی جگہ', 'قرآن کا ترتیب', 'نماز کا رکن'],
        correctAnswer: 'نماز کی جگہ',
      ),
      Question(
        questionText: '”ایمان” کا مطلب کیا ہے؟',
        options: ['نماز کرنا', 'ایماندار', 'اللہ پر ایمان لانا', 'قرآن کی تلاوت'],
        correctAnswer: 'اللہ پر ایمان لانا',
      ),
      Question(
        questionText: '”دعا” کا مطلب کیا ہے؟',
        options: ['اللہ کی عبادت', 'اللہ سے التجا کرنا', 'معلومات حاصل کرنا', 'دعا کرنا'],
        correctAnswer: 'دعا کرنا',
      ),
      Question(
        questionText: '”رسول” کا مطلب کیا ہے؟',
        options: ['اللہ کی عبادت کرنے والا', 'اللہ کا رسول', 'دوست', 'طالب علم'],
        correctAnswer: 'اللہ کا رسول',
      ),
      Question(
        questionText: '”برکت” کا مطلب کیا ہے؟',
        options: ['Null', 'نفع', 'دعا', 'علم'],
        correctAnswer: 'Null',
      ),
    ];
  }

  List<Question> visualbasic() {
    return [
      Question(
        questionText: 'File extension for Visual Basic project files?',
        options: ['.vbproj', '.vbscript', '.vbp', '.vb'],
        correctAnswer: '.vbproj',
      ),
      Question(
        questionText: 'IDE commonly used for Visual Basic development?',
        options: ['NetBeans', 'Visual Studio', 'Eclipse', 'Xcode'],
        correctAnswer: 'Visual Studio',
      ),
      Question(
        questionText: 'Primary data type for whole numbers in Visual Basic?',
        options: ['Double', 'Integer', 'Boolean', 'String'],
        correctAnswer: 'Integer',
      ),
      Question(
        questionText: 'Statement to declare a variable in Visual Basic?',
        options: ['Const', 'Let', 'Var', 'Dim'],
        correctAnswer: 'Dim',
      ),
      Question(
        questionText: 'Symbol used for concatenation in Visual Basic?',
        options: ['/', '&', '+', '%'],
        correctAnswer: '&',
      ),
      Question(
        questionText: 'Keyword to create a loop that repeats as long as a condition is true?',
        options: ['Loop', 'While', 'For', 'Do'],
        correctAnswer: 'While',
      ),
      Question(
        questionText: 'Default event for a button control in Visual Basic?',
        options: ['DoubleClick', 'KeyPress', 'MouseOver', 'Click'],
        correctAnswer: 'Click',
      ),
      Question(
        questionText: 'Control to display text in Visual Basic?',
        options: ['Button', 'TextBox', 'ComboBox', 'Label'],
        correctAnswer: 'Label',
      ),
      Question(
        questionText: 'Method to close a form in Visual Basic?',
        options: ['Dispose()', 'Exit()', 'Close()', 'Hide()'],
        correctAnswer: 'Close()',
      ),
      Question(
        questionText: 'Purpose of MessageBox class in Visual Basic?',
        options: ['Mathematical operations', 'Display messages', 'Manipulate files', 'Database connections'],
        correctAnswer: 'Display messages',
      ),
      Question(
        questionText: 'Event triggered when a key is pressed in Visual Basic?',
        options: ['KeyUp', 'KeyDown', 'KeyPress', 'KeyChar'],
        correctAnswer: 'KeyPress',
      ),
      Question(
        questionText: 'Control to allow selecting multiple items from a list?',
        options: ['ComboBox', 'CheckBox', 'RadioButton', 'ListBox'],
        correctAnswer: 'ListBox',
      ),
      Question(
        questionText: 'Purpose of Try-Catch block in Visual Basic?',
        options: ['Loops', 'Mathematical calculations', 'Conditional statements', 'Handle errors'],
        correctAnswer: 'Handle errors',
      ),
      Question(
        questionText: 'Operator for exponentiation in Visual Basic?',
        options: ['**', '^', '//', '**'],
        correctAnswer: '^',
      ),
      Question(
        questionText: 'Default layout manager in Visual Basic forms?',
        options: ['FlowLayout', 'BorderLayout', 'CardLayout', 'GridLayout'],
        correctAnswer: 'GridLayout',
      ),
      Question(
        questionText: 'Statement to exit a loop prematurely in Visual Basic?',
        options: ['Continue', 'Exit Loop', 'Break', 'Exit For'],
        correctAnswer: 'Exit For',
      ),
      Question(
        questionText: 'Purpose of Timer control in Visual Basic?',
        options: ['Display text', 'Execute code at intervals', 'Collect user input', 'Validate data'],
        correctAnswer: 'Execute code at intervals',
      ),
      Question(
        questionText: 'Control to display images in Visual Basic?',
        options: ['ImageControl', 'ImagePanel', 'PictureBox', 'ImageBox'],
        correctAnswer: 'PictureBox',
      ),
      Question(
        questionText: 'Purpose of OpenFileDialog control in Visual Basic?',
        options: ['Display messages', 'Allow selecting files', 'Validate input', 'Execute SQL queries'],
        correctAnswer: 'Allow selecting files',
      ),
      Question(
        questionText: 'Statement to comment out a line in Visual Basic?',
        options: ['//', '/*', '#', "'"],
        correctAnswer: "'",
      ),
      Question(
        questionText: 'Purpose of BackgroundWorker control in Visual Basic?',
        options: ['Manipulate control backgrounds', 'Perform tasks asynchronously', 'Database connections', 'Handle user input'],
        correctAnswer: 'Perform tasks asynchronously',
      ),
      Question(
        questionText: 'Event triggered when a form is loaded in Visual Basic?',
        options: ['Start', 'Load', 'Begin', 'Initialize'],
        correctAnswer: 'Load',
      ),
      Question(
        questionText: 'Purpose of DataGrid control in Visual Basic?',
        options: ['Play audio', 'Draw shapes', 'Display tabular data', 'Mathematical calculations'],
        correctAnswer: 'Display tabular data',
      ),
      Question(
        questionText: 'Statement to create a new instance of a class?',
        options: ['New', 'Create', 'Instance', 'Class'],
        correctAnswer: 'New',
      ),
      Question(
        questionText: 'Purpose of Split function in Visual Basic?',
        options: ['Concatenate strings', 'Divide a string', 'Format dates', 'Sort arrays'],
        correctAnswer: 'Divide a string',
      ),
      Question(
        questionText: 'Control to display web pages in Visual Basic?',
        options: ['InternetExplorer', 'WebControl', 'WebView', 'WebBrowser'],
        correctAnswer: 'WebBrowser',
      ),
      Question(
        questionText: 'Purpose of ToolStrip control in Visual Basic?',
        options: ['Format text', 'Create menus', 'Display toolbar buttons', 'Play video'],
        correctAnswer: 'Display toolbar buttons',
      ),
      Question(
        questionText: 'Statement to define a constant in Visual Basic?',
        options: ['Static', 'Const', 'Let', 'Dim'],
        correctAnswer: 'Const',
      ),
      Question(
        questionText: 'Purpose of Application class in Visual Basic?',
        options: ['Display messages', 'Database connections', 'Manage application lifecycle', 'Manipulate files'],
        correctAnswer: 'Manage application lifecycle',
      ),
    ];
  }


  List<Question> Englishgrammer() {
    return [
      Question(
        questionText: 'What is the past tense of “go”?',
        options: ['Going', 'Gone', 'Goes', 'Went'],
        correctAnswer: 'Went',
      ),
      Question(
        questionText: 'Which word is a pronoun?',
        options: ['Run', 'Happy', 'Book', 'She'],
        correctAnswer: 'She',
      ),
      Question(
        questionText: 'What is the plural form of “child”?',
        options: ['Childs', 'Childes', 'Childs’', 'Children'],
        correctAnswer: 'Children',
      ),
      Question(
        questionText: 'Which sentence is in the present perfect tense?',
        options: [
          'She will go to the store.',
          'She goes to the store.',
          'She went to the store.',
          'She has gone to the store.',
        ],
        correctAnswer: 'She has gone to the store.',
      ),
      Question(
        questionText: 'What is the comparative form of “good”?',
        options: ['Goodest', 'Better', 'Best', 'Gooder'],
        correctAnswer: 'Better',
      ),
      Question(
        questionText: 'Which word is a conjunction?',
        options: ['House', 'Quickly', 'And', 'Happy'],
        correctAnswer: 'And',
      ),
      Question(
        questionText: 'What is the superlative form of “fast”?',
        options: ['Fastest', 'Fastly', 'Faster', 'More fast'],
        correctAnswer: 'Fastest',
      ),
      Question(
        questionText: 'Which sentence is in the passive voice?',
        options: [
          'She painted the picture.',
          'She has painted the picture.',
          'She is painting the picture.',
          'The picture was painted by her.',
        ],
        correctAnswer: 'The picture was painted by her.',
      ),
      Question(
        questionText: 'What is the plural of “mouse”?',
        options: ['Mouse', 'Mouses', 'Mice', 'Mice’s'],
        correctAnswer: 'Mice',
      ),
      Question(
        questionText: 'Which word is an adverb?',
        options: ['Tree', 'Jump', 'Sad', 'Quickly'],
        correctAnswer: 'Quickly',
      ),
      Question(
        questionText: 'What is the antonym of “happy”?',
        options: ['Joyful', 'Content', 'Sad', 'Delighted'],
        correctAnswer: 'Sad',
      ),
      Question(
        questionText: 'Which sentence is in the past continuous tense?',
        options: [
          'She will be cooking dinner.',
          'She cooked dinner yesterday.',
          'She finishes her homework.',
          'She was cooking dinner.',
        ],
        correctAnswer: 'She was cooking dinner.',
      ),
      Question(
        questionText: 'What is the plural of “leaf”?',
        options: ['Leafes', 'Leaved', 'Leaves', 'Leafs'],
        correctAnswer: 'Leaves',
      ),
      Question(
        questionText: 'Which word is a preposition?',
        options: ['Happy', 'Over', 'Quickly', 'Jump'],
        correctAnswer: 'Over',
      ),
      Question(
        questionText: 'What is the comparative form of “big”?',
        options: ['Biger', 'Biggest', 'Bigest', 'Bigger'],
        correctAnswer: 'Bigger',
      ),
      Question(
        questionText: 'Which sentence is in the future perfect tense?',
        options: [
          'She finished her homework.',
          'She has finished her homework.',
          'She will have finished her homework.',
          'She finishes her homework.',
        ],
        correctAnswer: 'She will have finished her homework.',
      ),
      Question(
        questionText: 'What is the plural of “knife”?',
        options: ['Knifes', 'Knive', 'Knifis', 'Knives'],
        correctAnswer: 'Knives',
      ),
      Question(
        questionText: 'Which word is an interjection?',
        options: ['Quiet', 'Fast', 'Jump', 'Wow'],
        correctAnswer: 'Wow',
      ),
      Question(
        questionText: 'What is the superlative form of “bad”?',
        options: ['Baddest', 'Badder', 'Worse', 'Worst'],
        correctAnswer: 'Worst',
      ),
      Question(
        questionText: 'Which sentence is in the present perfect continuous tense?',
        options: [
          'She reads every day.',
          'She has been reading for two hours.',
          'She read the book yesterday.',
          'She is reading a book.',
        ],
        correctAnswer: 'She has been reading for two hours.',
      ),
      Question(
        questionText: 'What is the plural of “man”?',
        options: ['Manes', 'Men’s', 'Mans', 'Men'],
        correctAnswer: 'Men',
      ),
      Question(
        questionText: 'Which word is a determiner?',
        options: ['Happy', 'The', 'Jump', 'Fast'],
        correctAnswer: 'The',
      ),
      Question(
        questionText: 'What is the comparative form of “far”?',
        options: ['Farest', 'Farther', 'Further', 'Farer'],
        correctAnswer: 'Further',
      ),
      Question(
        questionText: 'Which sentence is in the past perfect tense?',
        options: [
          'She finishes her homework.',
          'She has finished her homework.',
          'She finished her homework.',
          'She had finished her homework.',
        ],
        correctAnswer: 'She had finished her homework.',
      ),
      Question(
        questionText: 'What is the plural of “foot”?',
        options: ['Feet', 'Footes', 'Feets', 'Foots'],
        correctAnswer: 'Feet',
      ),
      Question(
        questionText: 'Which word is a conjunction?',
        options: ['Because', 'Tall', 'Jump', 'Quiet'],
        correctAnswer: 'Because',
      ),
      Question(
        questionText: 'What is the superlative form of “beautiful”?',
        options: ['More beautiful', 'Most beautiful', 'Beautifuler', 'Beautifulest'],
        correctAnswer: 'Most beautiful',
      ),
      Question(
        questionText: 'Which sentence is in the present continuous tense?',
        options: [
          'She will cook dinner.',
          'She cooked dinner yesterday.',
          'She goes to the store.',
          'She is cooking dinner.',
        ],
        correctAnswer: 'She is cooking dinner.',
      ),
      Question(
        questionText: 'What is the antonym of “fast”?',
        options: ['Speedy', 'Quick', 'Rapid', 'Slow'],
        correctAnswer: 'Slow',
      ),
      Question(
        questionText: 'Which word is an adjective?',
        options: ['Jump', 'Happy', 'Fast', 'Quiet'],
        correctAnswer: 'Quiet',
      ),
    ];
  }



  //Method for Timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
        moveToNextQuestion();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }
  String? selectedAnswer;

  void answerQuestion(String selectedOption) {
    if (!answerChosen) {
      selectedAnswer = selectedOption;
      if (questions[currentQuestionIndex].correctAnswer == selectedOption) {
        correctAnswers++;
      } else {
        incorrectAnswers++;
      }
      setState(() {
        answerChosen = true;
        _timer?.cancel();
      });
                           // Move to the next question after a delay
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          moveToNextQuestion();
        });
      });
    }
  }


  //Method for GO to next Question After giving Answer or Time End
  void moveToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      _start = 10;
      answerChosen = false;
      startTimer();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            totalQuestions: questions.length,
            correctAnswers: correctAnswers,
            incorrectAnswers: incorrectAnswers,
          ),
        ),
      );
    }
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/new4.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.9,
              width: screenWidth * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Count Progress of Questions
                  Text(
                    'Question: ${getProgress(questions, currentQuestionIndex)}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Elsie',
                      backgroundColor: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child:
                    //Display Questions
                    Text(
                      questions[currentQuestionIndex].questionText,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontFamily: 'Elsie',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  //Display MCqs/options

                  const SizedBox(height: 20),
                  ...((questions[currentQuestionIndex].options).map((option) {
                    bool isSelected = option == selectedAnswer;
                    bool isCorrect = option == questions[currentQuestionIndex].correctAnswer;
                    Color optionColor = isSelected ? (isCorrect ? Colors.green : Colors.red) : Colors.blueAccent;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          answerQuestion(option);
                          setState(() {
                            selectedAnswer = option;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(optionColor),
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),

                        //Checking Icons on options

                        child: Container(
                          color: optionColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (isSelected)
                                Icon(
                                  isCorrect ? Icons.check_circle : Icons.close,
                                  color: Colors.white,
                                ),
                              const SizedBox(width: 8),
                              Text(
                                option,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList()),
                  const SizedBox(height: 10),

                  //Display correct Answer

                  if (answerChosen)
                    Column(
                      children: [
                        Text(
                          'Correct Answer :  ${questions[currentQuestionIndex].correctAnswer}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ProtestStrike',
                            color: Colors.green[900],
                            backgroundColor: Colors.white70
                          ),
                        ),
                        const SizedBox(height: 20,),

                      ],
                    ),
                  const SizedBox(height: 10),

                  //Display running Time Box

                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                      child: Text(
                        '$_start',
                        style: const TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Stack for positioning 2 floating bbuttons

            Stack(
              children: [
                Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(
                            correctAnswers: correctAnswers,
                            incorrectAnswers: incorrectAnswers,
                            totalQuestions: questions.length,
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.add_chart_outlined),
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CourseScreen(), // Navigate to the back to Courses screen
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_back_sharp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }}

