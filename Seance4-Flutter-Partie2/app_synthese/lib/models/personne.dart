// Modèle Personne + Salarie — héritage & polymorphisme Dart.
// @author Wafaa Boukchouch - MII BDCC ENSET
class Personne {
  String nom;
  int age;

  Personne(this.nom, this.age);

  void sePresenter() {
    print("Bonjour, je m'appelle $nom et j'ai $age ans.");
  }
}

class Salarie extends Personne {
  double salaire;

  Salarie(String nom, int age, this.salaire) : super(nom, age);

  @override
  void sePresenter() {
    print("Bonjour, je suis Salarié(e) — $nom, $age ans, salaire : $salaire MAD.");
  }

  void augmentation(double montant) {
    salaire += montant;
    print("Nouveau salaire de $nom : $salaire MAD.");
  }
}
