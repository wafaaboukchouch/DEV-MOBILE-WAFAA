package ma.enset.wafaa.imcapp.model;

/**
 * Résultat du calcul IMC : valeur numérique + catégorie.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class ImcResult {
    private final double value;
    private final ImcCategory category;

    public ImcResult(double value, ImcCategory category) {
        this.value = value;
        this.category = category;
    }

    public double getValue() { return value; }
    public ImcCategory getCategory() { return category; }
}
