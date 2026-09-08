enum ShadowCefrLevel {
  a1('A1', 'Beginner'),
  a2('A2', 'Elementary'),
  b1('B1', 'Intermediate'),
  b2('B2', 'Upper Intermediate'),
  c1('C1', 'Advanced');

  const ShadowCefrLevel(this.code, this.title);

  final String code;
  final String title;
}

enum ShadowPassageTopic {
  motivation('Motivation'),
  dailyLife('Daily Life'),
  travel('Travel'),
  work('Work'),
  study('Study');

  const ShadowPassageTopic(this.label);

  final String label;
}

enum ShadowPassageStatus { unopened, inProgress, completed }

enum AmbientMusicPreset {
  off('Off'),
  lofi('Lo-fi'),
  cafe('Cafe'),
  rain('Rain'),
  nature('Nature');

  const AmbientMusicPreset(this.label);

  final String label;
}

class ShadowLevelOverview {
  const ShadowLevelOverview({
    required this.level,
    required this.description,
    required this.topics,
    required this.passageCount,
    this.isRecommended = false,
  });

  final ShadowCefrLevel level;
  final String description;
  final List<ShadowPassageTopic> topics;
  final int passageCount;
  final bool isRecommended;
}

class ShadowPassage {
  const ShadowPassage({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.topic,
    required this.durationMs,
    required this.transcript,
    required this.translation,
    required this.audioPath,
    required this.sentences,
    required this.vocabulary,
    required this.phrases,
    required this.grammarPoints,
    this.backgroundMusicDefault = AmbientMusicPreset.off,
    this.isFavorite = false,
  });

  final String id;
  final String title;
  final String description;
  final ShadowCefrLevel level;
  final ShadowPassageTopic topic;
  final int durationMs;
  final String transcript;
  final String translation;
  final String audioPath;
  final AmbientMusicPreset backgroundMusicDefault;
  final List<ShadowPassageSentence> sentences;
  final List<ShadowVocabularyItem> vocabulary;
  final List<ShadowPhraseItem> phrases;
  final List<ShadowGrammarPoint> grammarPoints;
  final bool isFavorite;

  Duration get duration => Duration(milliseconds: durationMs);
}

class ShadowPassageSentence {
  const ShadowPassageSentence({
    required this.id,
    required this.passageId,
    required this.text,
    required this.translation,
    required this.startMs,
    required this.endMs,
    required this.phraseSegments,
    required this.wordTimestamps,
    required this.vocabulary,
    required this.phrases,
    required this.grammarPoints,
  });

  final String id;
  final String passageId;
  final String text;
  final String translation;
  final int startMs;
  final int endMs;
  final List<ShadowPhraseSegment> phraseSegments;
  final List<ShadowWordTimestamp> wordTimestamps;
  final List<ShadowVocabularyItem> vocabulary;
  final List<ShadowPhraseItem> phrases;
  final List<ShadowGrammarPoint> grammarPoints;

  Duration get duration => Duration(milliseconds: endMs - startMs);
}

class ShadowPhraseSegment {
  const ShadowPhraseSegment({
    required this.id,
    required this.text,
    required this.startMs,
    required this.endMs,
  });

  final String id;
  final String text;
  final int startMs;
  final int endMs;
}

class ShadowWordTimestamp {
  const ShadowWordTimestamp({
    required this.word,
    required this.startMs,
    required this.endMs,
  });

  final String word;
  final int startMs;
  final int endMs;
}

class ShadowVocabularyItem {
  const ShadowVocabularyItem({
    required this.id,
    required this.word,
    required this.partOfSpeech,
    required this.meaning,
    required this.example,
    required this.sentenceContext,
    this.pronunciation,
  });

  final String id;
  final String word;
  final String partOfSpeech;
  final String meaning;
  final String example;
  final String sentenceContext;
  final String? pronunciation;
}

class ShadowPhraseItem {
  const ShadowPhraseItem({
    required this.id,
    required this.text,
    required this.meaning,
    required this.explanation,
    required this.example,
    required this.sourcePassageId,
    required this.sourceSentenceId,
  });

  final String id;
  final String text;
  final String meaning;
  final String explanation;
  final String example;
  final String sourcePassageId;
  final String sourceSentenceId;
}

class ShadowGrammarPoint {
  const ShadowGrammarPoint({
    required this.id,
    required this.title,
    required this.pattern,
    required this.explanation,
    required this.examples,
  });

  final String id;
  final String title;
  final String pattern;
  final String explanation;
  final List<String> examples;
}

class ShadowPassageProgress {
  const ShadowPassageProgress({
    required this.passageId,
    required this.status,
    required this.lastPositionMs,
    required this.sentencesCompleted,
    required this.totalSentences,
    required this.lastPracticedAt,
  });

  final String passageId;
  final ShadowPassageStatus status;
  final int lastPositionMs;
  final int sentencesCompleted;
  final int totalSentences;
  final DateTime? lastPracticedAt;

  double get ratio {
    if (totalSentences <= 0) return 0;
    return (sentencesCompleted / totalSentences).clamp(0, 1);
  }
}

class ShadowPlaybackSettings {
  const ShadowPlaybackSettings({
    this.showText = true,
    this.showTranslation = false,
    this.musicPreset = AmbientMusicPreset.off,
    this.speechVolume = 1,
    this.musicVolume = 0.25,
    this.playbackSpeed = 1,
    this.repeatPassage = false,
    this.repeatSentence = false,
  });

  final bool showText;
  final bool showTranslation;
  final AmbientMusicPreset musicPreset;
  final double speechVolume;
  final double musicVolume;
  final double playbackSpeed;
  final bool repeatPassage;
  final bool repeatSentence;
}

class RunningTranscriptPosition {
  const RunningTranscriptPosition({
    required this.positionMs,
    required this.sentenceId,
    this.phraseSegmentId,
    this.wordIndex,
    this.autoFollowEnabled = true,
  });

  final int positionMs;
  final String sentenceId;
  final String? phraseSegmentId;
  final int? wordIndex;
  final bool autoFollowEnabled;
}

class ShadowSavedWord {
  const ShadowSavedWord({
    required this.item,
    required this.savedAt,
  });

  final ShadowVocabularyItem item;
  final DateTime savedAt;
}

class ShadowSavedPhrase {
  const ShadowSavedPhrase({
    required this.item,
    required this.savedAt,
  });

  final ShadowPhraseItem item;
  final DateTime savedAt;
}

class ShadowSessionSummary {
  const ShadowSessionSummary({
    required this.id,
    required this.passageId,
    required this.startedAt,
    required this.endedAt,
    required this.practiceTimeSeconds,
    required this.sentencesShadowed,
    required this.wordsSaved,
    required this.phrasesSaved,
    required this.grammarReviewed,
  });

  final String id;
  final String passageId;
  final DateTime startedAt;
  final DateTime endedAt;
  final int practiceTimeSeconds;
  final int sentencesShadowed;
  final int wordsSaved;
  final int phrasesSaved;
  final int grammarReviewed;
}

class ShadowWeeklyActivity {
  const ShadowWeeklyActivity({
    required this.weekdayLabel,
    required this.minutesPracticed,
  });

  final String weekdayLabel;
  final int minutesPracticed;
}

class ShadowProgressSnapshot {
  const ShadowProgressSnapshot({
    required this.currentStreak,
    required this.passagesCompleted,
    required this.practiceTimeMinutes,
    required this.savedWords,
    required this.savedPhrases,
    required this.grammarReviewed,
    required this.weeklyActivity,
  });

  final int currentStreak;
  final int passagesCompleted;
  final int practiceTimeMinutes;
  final int savedWords;
  final int savedPhrases;
  final int grammarReviewed;
  final List<ShadowWeeklyActivity> weeklyActivity;
}
