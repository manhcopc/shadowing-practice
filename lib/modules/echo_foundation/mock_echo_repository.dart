import 'models.dart';

class MockEchoRepository {
  const MockEchoRepository();

  List<Course> getCourses({Map<String, double> progress = const {}}) {
    return [
      Course(
        id: 'daily-english',
        title: 'Daily English',
        description: 'Natural expressions for real-life conversations.',
        category: 'Daily Life',
        thumbnail: '☕',
        progress: courseProgress('daily-english', progress),
        totalLessons: 6,
      ),
      const Course(
        id: 'travel-english',
        title: 'Travel English',
        description: 'Airport, hotel, directions, and travel moments.',
        category: 'Travel',
        thumbnail: '✈',
        progress: 0,
        totalLessons: 8,
      ),
      const Course(
        id: 'business-english',
        title: 'Business English',
        description: 'Meetings, small talk, and professional phrases.',
        category: 'Business',
        thumbnail: '💼',
        progress: 0,
        totalLessons: 10,
      ),
      const Course(
        id: 'movies-dialogue',
        title: 'Movies & Dialogue',
        description: 'Practice expressive delivery with safe sample lines.',
        category: 'Movies',
        thumbnail: '🎬',
        progress: 0,
        totalLessons: 6,
      ),
    ];
  }

  Course getCourse(String courseId, {Map<String, double> progress = const {}}) {
    return getCourses(progress: progress).firstWhere(
      (course) => course.id == courseId,
      orElse: () => getCourses(progress: progress).first,
    );
  }

  List<Lesson> getLessons({Map<String, double> progress = const {}}) {
    final titles = [
      'Greetings',
      'Ordering a drink',
      'Asking for recommendations',
      'Customizing your order',
      'Paying at the counter',
      'Saying thank you',
    ];
    return List.generate(titles.length, (index) {
      final id = 'daily-${index + 1}';
      final lessonProgress = progress[id] ?? (index == 0 ? 0.7 : 0);
      return Lesson(
        id: id,
        courseId: 'daily-english',
        title: titles[index],
        description: _lessonDescription(index),
        order: index + 1,
        isLocked: false,
        isCompleted: lessonProgress >= 1,
        progress: lessonProgress,
        sentences: _sentences(id, index),
      );
    });
  }

  Lesson? findLesson(String lessonId, {Map<String, double> progress = const {}}) {
    for (final lesson in getLessons(progress: progress)) {
      if (lesson.id == lessonId) return lesson;
    }
    return null;
  }

  ShadowSentence? findSentence(String sentenceId) {
    for (final lesson in getLessons()) {
      for (final sentence in lesson.sentences) {
        if (sentence.id == sentenceId) return sentence;
      }
    }
    return null;
  }

  Lesson? lessonForSentence(String sentenceId) {
    for (final lesson in getLessons()) {
      if (lesson.sentences.any((sentence) => sentence.id == sentenceId)) {
        return lesson;
      }
    }
    return null;
  }

  static double courseProgress(String courseId, Map<String, double> progress) {
    final values = progress.entries
        .where((entry) => entry.key.startsWith('daily-'))
        .map((entry) => entry.value)
        .toList();
    if (values.isEmpty) return 0.18;
    return values.reduce((a, b) => a + b) / 6;
  }

  String _lessonDescription(int index) {
    return [
      'Start a friendly conversation clearly.',
      'Order coffee with a natural rhythm.',
      'Ask the barista for suggestions.',
      'Change size, milk, sweetness, and temperature.',
      'Confirm price and payment politely.',
      'Close the interaction with warmth.',
    ][index];
  }

  List<ShadowSentence> _sentences(String lessonId, int lessonIndex) {
    final data = [
      [
        ('Hi, how are you doing today?', 'Xin chào, hôm nay bạn thế nào?'),
        ('Good morning, could I get a table for one?', 'Chào buổi sáng, cho tôi một bàn cho một người được không?'),
        ('It is nice to see you again.', 'Rất vui được gặp lại bạn.'),
      ],
      [
        ('I would like a medium latte, please.', 'Tôi muốn một ly latte cỡ vừa.'),
        ('Could I have it iced instead of hot?', 'Tôi có thể lấy lạnh thay vì nóng không?'),
        ('Can you make that to go?', 'Bạn có thể làm để mang đi không?'),
      ],
      [
        ('I was wondering if you could help me.', 'Tôi đang muốn hỏi liệu bạn có thể giúp tôi không.'),
        ('What would you recommend for something less sweet?', 'Bạn gợi ý món nào ít ngọt hơn?'),
        ('Is this drink popular here?', 'Đồ uống này có phổ biến ở đây không?'),
      ],
      [
        ('Could you make it with oat milk?', 'Bạn có thể pha bằng sữa yến mạch không?'),
        ('Please make it half sweet.', 'Vui lòng làm ngọt một nửa thôi.'),
        ('Can I add an extra shot of espresso?', 'Tôi có thể thêm một shot espresso không?'),
      ],
      [
        ('How much is it altogether?', 'Tổng cộng bao nhiêu tiền?'),
        ('Can I pay by card?', 'Tôi có thể trả bằng thẻ không?'),
        ('Could I get a receipt, please?', 'Cho tôi xin hóa đơn được không?'),
      ],
      [
        ('Thank you, have a great day.', 'Cảm ơn, chúc bạn một ngày tốt lành.'),
        ('This looks perfect, thanks so much.', 'Ly này trông hoàn hảo, cảm ơn rất nhiều.'),
        ('I appreciate your help.', 'Tôi rất cảm ơn sự giúp đỡ của bạn.'),
      ],
    ];
    return List.generate(data[lessonIndex].length, (index) {
      final row = data[lessonIndex][index];
      return ShadowSentence(
        id: '$lessonId-s${index + 1}',
        lessonId: lessonId,
        text: row.$1,
        translation: row.$2,
        audioPath: '',
        duration: const Duration(seconds: 4),
        vocabulary: _vocabulary(row.$1),
        order: index + 1,
      );
    });
  }

  List<VocabularyItem> _vocabulary(String sentence) {
    if (sentence.contains('wondering')) {
      return const [
        VocabularyItem(word: 'wondering', type: 'verb', meaning: 'to think about something; to want to know'),
        VocabularyItem(word: 'help me', type: 'phrase', meaning: 'to give support or assistance to me'),
      ];
    }
    return const [
      VocabularyItem(word: 'could', type: 'modal verb', meaning: 'a polite way to ask for something'),
      VocabularyItem(word: 'please', type: 'adverb', meaning: 'used to make a request polite'),
    ];
  }
}
