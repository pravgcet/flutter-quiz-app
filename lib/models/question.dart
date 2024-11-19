class Question {
  const Question({required this.question, required this.options});
  final String question;
  final List<String> options;

  List<String> getOptionsShuffled() {
    final shuff = List.of(options);
    shuff.shuffle();
    return shuff;
  }
}
