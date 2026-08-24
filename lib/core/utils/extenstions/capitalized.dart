/*

The idea of this extension is to make the first character capital and the other small

 */

extension Capitalized on String {
  String toCapitalized() {
    return split(' ')
        .map(
          (word) => word.isEmpty
              ? word
              : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join(' ');
  }
}
