import '../../../data/local/shared_prefs/storage.dart';
import '../models/shadow_mvp_models.dart';

class ShadowPassageRepository {
  const ShadowPassageRepository();

  List<ShadowLevelOverview> getLevels() {
    return [
      const ShadowLevelOverview(
        level: ShadowCefrLevel.a1,
        description: 'Simple lines for daily confidence.',
        topics: [
          ShadowPassageTopic.dailyLife,
          ShadowPassageTopic.travel,
          ShadowPassageTopic.motivation,
        ],
        passageCount: 4,
      ),
      const ShadowLevelOverview(
        level: ShadowCefrLevel.a2,
        description: 'Short conversations and simple opinions.',
        topics: [
          ShadowPassageTopic.motivation,
          ShadowPassageTopic.dailyLife,
          ShadowPassageTopic.travel,
          ShadowPassageTopic.work,
        ],
        passageCount: 4,
        isRecommended: true,
      ),
      const ShadowLevelOverview(
        level: ShadowCefrLevel.b1,
        description: 'Clear stories with more natural rhythm.',
        topics: [
          ShadowPassageTopic.motivation,
          ShadowPassageTopic.work,
          ShadowPassageTopic.study,
        ],
        passageCount: 4,
      ),
      const ShadowLevelOverview(
        level: ShadowCefrLevel.b2,
        description: 'Longer ideas and more precise expression.',
        topics: [ShadowPassageTopic.work, ShadowPassageTopic.study],
        passageCount: 0,
      ),
      const ShadowLevelOverview(
        level: ShadowCefrLevel.c1,
        description: 'Advanced nuance for fluent delivery.',
        topics: [ShadowPassageTopic.work, ShadowPassageTopic.study],
        passageCount: 0,
      ),
    ];
  }

  List<ShadowPassage> getPassages({
    ShadowCefrLevel? level,
    ShadowPassageTopic? topic,
    bool favoritesOnly = false,
  }) {
    final favoriteIds = Storage.shadowMvpFavoritePassageIds.toSet();
    return _passages
        .map((passage) {
          return ShadowPassage(
            id: passage.id,
            title: passage.title,
            description: passage.description,
            level: passage.level,
            topic: passage.topic,
            durationMs: passage.durationMs,
            transcript: passage.transcript,
            translation: passage.translation,
            audioPath: passage.audioPath,
            backgroundMusicDefault: passage.backgroundMusicDefault,
            sentences: passage.sentences,
            vocabulary: passage.vocabulary,
            phrases: passage.phrases,
            grammarPoints: passage.grammarPoints,
            isFavorite: favoriteIds.contains(passage.id),
          );
        })
        .where((passage) {
          if (favoritesOnly && !passage.isFavorite) return false;
          if (level != null && passage.level != level) return false;
          if (topic != null && passage.topic != topic) return false;
          return true;
        })
        .toList();
  }

  ShadowPassage getFeaturedPassage() => getPassages().first;

  Future<void> toggleFavorite(String passageId) async {
    final ids = Storage.shadowMvpFavoritePassageIds.toSet();
    if (ids.contains(passageId)) {
      ids.remove(passageId);
    } else {
      ids.add(passageId);
    }
    await Storage.setShadowMvpFavoritePassageIds(ids.toList()..sort());
  }

  static final List<ShadowPassage> _passages = [
    _buildPassage(
      id: 'motivation-a1-keep-moving',
      title: 'Keep Moving',
      level: ShadowCefrLevel.a1,
      topic: ShadowPassageTopic.motivation,
      lines: const [
        'You do not have to be perfect.',
        'You just need to keep moving.',
        'Small steps still count.',
      ],
      translations: const [
        'Ban khong can phai hoan hao.',
        'Ban chi can tiep tuc tien len.',
        'Nhung buoc nho van co gia tri.',
      ],
    ),
    _buildPassage(
      id: 'motivation-a2-quiet-progress',
      title: 'Quiet Progress',
      level: ShadowCefrLevel.a2,
      topic: ShadowPassageTopic.motivation,
      lines: const [
        'You may not see progress every day.',
        'But practice changes the way you speak.',
        'Stay patient and return tomorrow.',
      ],
      translations: const [
        'Ban co the khong thay tien bo moi ngay.',
        'Nhung luyen tap thay doi cach ban noi.',
        'Hay kien nhan va quay lai vao ngay mai.',
      ],
    ),
    _buildPassage(
      id: 'motivation-b1-better-focus',
      title: 'Better Focus',
      level: ShadowCefrLevel.b1,
      topic: ShadowPassageTopic.motivation,
      lines: const [
        'When you slow down, you hear more clearly.',
        'When you repeat with attention, your rhythm improves.',
        'Focus turns practice into skill.',
      ],
      translations: const [
        'Khi ban cham lai, ban nghe ro hon.',
        'Khi ban lap lai co chu y, nhip noi se tot hon.',
        'Su tap trung bien luyen tap thanh ky nang.',
      ],
    ),
    _buildPassage(
      id: 'daily-a1-morning-coffee',
      title: 'Morning Coffee',
      level: ShadowCefrLevel.a1,
      topic: ShadowPassageTopic.dailyLife,
      lines: const [
        'I make coffee in the morning.',
        'I sit near the window.',
        'The day feels calm and simple.',
      ],
      translations: const [
        'Toi pha ca phe vao buoi sang.',
        'Toi ngoi gan cua so.',
        'Ngay moi that binh yen va don gian.',
      ],
    ),
    _buildPassage(
      id: 'daily-a2-healthy-routine',
      title: 'Healthy Routine',
      level: ShadowCefrLevel.a2,
      topic: ShadowPassageTopic.dailyLife,
      lines: const [
        'A good routine does not need to be complicated.',
        'Drink water, take a walk, and rest your mind.',
        'Simple habits can change your whole day.',
      ],
      translations: const [
        'Mot thoi quen tot khong can phuc tap.',
        'Uong nuoc, di bo, va cho tam tri nghi ngoi.',
        'Thoi quen don gian co the thay doi ca ngay cua ban.',
      ],
    ),
    _buildPassage(
      id: 'daily-b1-small-conversations',
      title: 'Small Conversations',
      level: ShadowCefrLevel.b1,
      topic: ShadowPassageTopic.dailyLife,
      lines: const [
        'Small conversations help people feel connected.',
        'A warm question can make a normal day better.',
        'You do not need perfect words to be friendly.',
      ],
      translations: const [
        'Nhung cuoc tro chuyen nho giup moi nguoi ket noi.',
        'Mot cau hoi am ap co the lam ngay thuong tot hon.',
        'Ban khong can tu ngu hoan hao de than thien.',
      ],
    ),
    _buildPassage(
      id: 'travel-a1-at-the-station',
      title: 'At The Station',
      level: ShadowCefrLevel.a1,
      topic: ShadowPassageTopic.travel,
      lines: const [
        'Excuse me, where is platform two?',
        'The train leaves in ten minutes.',
        'Thank you for your help.',
      ],
      translations: const [
        'Xin loi, san ga so hai o dau?',
        'Tau khoi hanh trong muoi phut nua.',
        'Cam on vi da giup toi.',
      ],
    ),
    _buildPassage(
      id: 'travel-a2-finding-the-hotel',
      title: 'Finding The Hotel',
      level: ShadowCefrLevel.a2,
      topic: ShadowPassageTopic.travel,
      lines: const [
        'I am looking for the Riverside Hotel.',
        'Could you show me the way on the map?',
        'I think it is only five minutes from here.',
      ],
      translations: const [
        'Toi dang tim khach san Riverside.',
        'Ban co the chi duong tren ban do khong?',
        'Toi nghi noi do chi cach day nam phut.',
      ],
    ),
    _buildPassage(
      id: 'travel-b1-new-city',
      title: 'A New City',
      level: ShadowCefrLevel.b1,
      topic: ShadowPassageTopic.travel,
      lines: const [
        'A new city teaches you to notice small details.',
        'You listen more carefully and ask better questions.',
        'Every street becomes part of the lesson.',
      ],
      translations: const [
        'Mot thanh pho moi day ban chu y den chi tiet nho.',
        'Ban lang nghe ky hon va hoi tot hon.',
        'Moi con duong tro thanh mot phan cua bai hoc.',
      ],
    ),
    _buildPassage(
      id: 'work-a1-first-meeting',
      title: 'First Meeting',
      level: ShadowCefrLevel.a1,
      topic: ShadowPassageTopic.work,
      lines: const [
        'Hello, my name is Linh.',
        'I am happy to join the team.',
        'I look forward to working with you.',
      ],
      translations: const [
        'Xin chao, toi ten la Linh.',
        'Toi rat vui khi tham gia nhom.',
        'Toi mong duoc lam viec voi ban.',
      ],
    ),
    _buildPassage(
      id: 'work-a2-clear-update',
      title: 'A Clear Update',
      level: ShadowCefrLevel.a2,
      topic: ShadowPassageTopic.work,
      lines: const [
        'Here is a quick update on the project.',
        'The first part is finished, and the second part is in progress.',
        'I will send more details this afternoon.',
      ],
      translations: const [
        'Day la cap nhat nhanh ve du an.',
        'Phan dau da xong va phan hai dang thuc hien.',
        'Toi se gui them chi tiet chieu nay.',
      ],
    ),
    _buildPassage(
      id: 'work-b1-better-feedback',
      title: 'Better Feedback',
      level: ShadowCefrLevel.b1,
      topic: ShadowPassageTopic.work,
      lines: const [
        'Good feedback is direct but respectful.',
        'It explains the problem and suggests a useful next step.',
        'That makes collaboration easier for everyone.',
      ],
      translations: const [
        'Phan hoi tot thi truc tiep nhung ton trong.',
        'No giai thich van de va de xuat buoc tiep theo huu ich.',
        'Dieu do giup viec hop tac de dang hon cho moi nguoi.',
      ],
    ),
  ];

  static ShadowPassage _buildPassage({
    required String id,
    required String title,
    required ShadowCefrLevel level,
    required ShadowPassageTopic topic,
    required List<String> lines,
    required List<String> translations,
  }) {
    var cursor = 0;
    final sentences = <ShadowPassageSentence>[];
    final vocabulary = <ShadowVocabularyItem>[];
    final phrases = <ShadowPhraseItem>[];
    final grammar = <ShadowGrammarPoint>[];
    for (var index = 0; index < lines.length; index++) {
      final text = lines[index];
      final duration = _durationFor(text);
      final sentenceId = '$id-s${index + 1}';
      final sentenceVocabulary = _vocabularyFor(sentenceId, text);
      final sentencePhrases = _phrasesFor(id, sentenceId, text);
      final sentenceGrammar = _grammarFor(sentenceId, text);
      vocabulary.addAll(sentenceVocabulary);
      phrases.addAll(sentencePhrases);
      grammar.addAll(sentenceGrammar);
      sentences.add(
        ShadowPassageSentence(
          id: sentenceId,
          passageId: id,
          text: text,
          translation: translations[index],
          startMs: cursor,
          endMs: cursor + duration,
          phraseSegments: _segmentsFor(sentenceId, text, cursor, duration),
          wordTimestamps: _wordTimestampsFor(text, cursor, duration),
          vocabulary: sentenceVocabulary,
          phrases: sentencePhrases,
          grammarPoints: sentenceGrammar,
        ),
      );
      cursor += duration;
    }
    return ShadowPassage(
      id: id,
      title: title,
      description: lines.first,
      level: level,
      topic: topic,
      durationMs: cursor,
      transcript: lines.join(' '),
      translation: translations.join(' '),
      audioPath: '',
      backgroundMusicDefault: AmbientMusicPreset.off,
      sentences: sentences,
      vocabulary: vocabulary,
      phrases: phrases,
      grammarPoints: grammar,
    );
  }

  static int _durationFor(String text) {
    final words = text.split(RegExp(r'\s+')).length;
    return (words * 430 + 900).clamp(2800, 7200);
  }

  static List<ShadowPhraseSegment> _segmentsFor(
    String sentenceId,
    String text,
    int startMs,
    int durationMs,
  ) {
    final words = text.split(RegExp(r'\s+'));
    final midpoint = (words.length / 2).ceil();
    final chunks = [
      words.take(midpoint).join(' '),
      words.skip(midpoint).join(' '),
    ].where((chunk) => chunk.isNotEmpty).toList();
    return List.generate(chunks.length, (index) {
      final segmentStart =
          startMs + (durationMs * index / chunks.length).round();
      final segmentEnd =
          startMs + (durationMs * (index + 1) / chunks.length).round();
      return ShadowPhraseSegment(
        id: '$sentenceId-p${index + 1}',
        text: chunks[index],
        startMs: segmentStart,
        endMs: segmentEnd,
      );
    });
  }

  static List<ShadowWordTimestamp> _wordTimestampsFor(
    String text,
    int startMs,
    int durationMs,
  ) {
    final words = text.split(RegExp(r'\s+'));
    return List.generate(words.length, (index) {
      return ShadowWordTimestamp(
        word: words[index].replaceAll(RegExp(r'[^A-Za-z]'), ''),
        startMs: startMs + (durationMs * index / words.length).round(),
        endMs: startMs + (durationMs * (index + 1) / words.length).round(),
      );
    });
  }

  static List<ShadowVocabularyItem> _vocabularyFor(
    String sentenceId,
    String text,
  ) {
    final words = text
        .split(RegExp(r'\s+'))
        .where((item) => item.length >= 5)
        .map((item) => item.replaceAll(RegExp(r'[^A-Za-z]'), '').toLowerCase());
    final word = words.isEmpty ? null : words.first;
    if (word == null || word.isEmpty) return [];
    return [
      ShadowVocabularyItem(
        id: '$sentenceId-v1',
        word: word,
        partOfSpeech: 'word',
        meaning: 'A useful word from this sentence.',
        example: text,
        sentenceContext: text,
      ),
    ];
  }

  static List<ShadowPhraseItem> _phrasesFor(
    String passageId,
    String sentenceId,
    String text,
  ) {
    final phrase = _segmentsFor(
      sentenceId,
      text,
      0,
      _durationFor(text),
    ).first.text;
    return [
      ShadowPhraseItem(
        id: '$sentenceId-ph1',
        text: phrase,
        meaning: 'A phrase to repeat as one natural chunk.',
        explanation: 'Practice this chunk without pausing between words.',
        example: text,
        sourcePassageId: passageId,
        sourceSentenceId: sentenceId,
      ),
    ];
  }

  static List<ShadowGrammarPoint> _grammarFor(String sentenceId, String text) {
    if (text.toLowerCase().contains('do not have to')) {
      return [
        const ShadowGrammarPoint(
          id: 'grammar-dont-have-to',
          title: 'DO NOT HAVE TO + VERB',
          pattern: 'do not have to + verb',
          explanation: 'Used when something is not necessary.',
          examples: [
            'You do not have to hurry.',
            'You do not have to explain.',
          ],
        ),
      ];
    }
    return [
      ShadowGrammarPoint(
        id: '$sentenceId-g1',
        title: 'CLEAR SENTENCE STRESS',
        pattern: 'content words carry the meaning',
        explanation: 'Focus on nouns, verbs, and adjectives when shadowing.',
        examples: [text],
      ),
    ];
  }
}
