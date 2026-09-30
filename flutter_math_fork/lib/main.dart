import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_math_fork/flutter_math.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final String strQ = r'''
A car travels a distance of **120 km** in **3 hours**.

The formula for speed is:

\[
Speed = \frac{Distance}{Time}
\]

What is the speed of the car?

1. **30 km/h**
2. **40 km/h**
3. **50 km/h**
4. **60 km/h**
''';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Math Question'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: QuestionRenderer(
            question: strQ,
          ),
        ),
      ),
    );
  }
}

class QuestionRenderer extends StatelessWidget {
  final String question;

  const QuestionRenderer({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    final parts = _parseQuestion(question);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: parts.map((part) {
          if (part.isMath) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Math.tex(
                  part.content,
                  mathStyle: MathStyle.display,
                  textStyle: const TextStyle(
                    fontSize: 24,
                  ),
                  onErrorFallback: (error) {
                    return Text(
                      'Invalid formula: ${part.content}',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
            );
          }

          return MarkdownBody(
            data: part.content,
            selectable: true,
            styleSheet: MarkdownStyleSheet(
              p: const TextStyle(
                fontSize: 18,
                height: 1.5,
              ),
              listBullet: const TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  List<_QuestionPart> _parseQuestion(String text) {
    final parts = <_QuestionPart>[];

    final regex = RegExp(
      r'\\\[(.*?)\\\]',
      dotAll: true,
    );

    int lastIndex = 0;

    for (final match in regex.allMatches(text)) {
      // Normal Markdown before formula
      if (match.start > lastIndex) {
        parts.add(
          _QuestionPart(
            content: text.substring(lastIndex, match.start),
            isMath: false,
          ),
        );
      }

      // LaTeX formula
      parts.add(
        _QuestionPart(
          content: match.group(1)!.trim(),
          isMath: true,
        ),
      );

      lastIndex = match.end;
    }

    // Remaining Markdown
    if (lastIndex < text.length) {
      parts.add(
        _QuestionPart(
          content: text.substring(lastIndex),
          isMath: false,
        ),
      );
    }

    return parts;
  }
}

class _QuestionPart {
  final String content;
  final bool isMath;

  _QuestionPart({
    required this.content,
    required this.isMath,
  });
}