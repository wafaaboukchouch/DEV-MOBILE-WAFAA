// Logique du jeu Tic Tac Toe (morpion) — 2 joueurs X et O.
// @author Wafaa Boukchouch - MII BDCC ENSET
class TicTacToe {
  List<String> cells = List.filled(9, '');
  String _current = 'X';

  bool get isFull => cells.every((c) => c.isNotEmpty);

  void play(int index) {
    if (cells[index].isEmpty && winner() == null) {
      cells[index] = _current;
      _current = _current == 'X' ? 'O' : 'X';
    }
  }

  String? winner() {
    const lines = [
      [0,1,2],[3,4,5],[6,7,8], // lignes
      [0,3,6],[1,4,7],[2,5,8], // colonnes
      [0,4,8],[2,4,6],          // diagonales
    ];
    for (final l in lines) {
      if (cells[l[0]].isNotEmpty &&
          cells[l[0]] == cells[l[1]] &&
          cells[l[1]] == cells[l[2]]) {
        return cells[l[0]];
      }
    }
    return null;
  }

  void reset() {
    cells = List.filled(9, '');
    _current = 'X';
  }
}
