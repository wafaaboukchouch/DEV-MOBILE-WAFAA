package ma.enset.wafaa.imcapp.model;

import ma.enset.wafaa.imcapp.R;

/**
 * Enumération des catégories IMC.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public enum ImcCategory {
    MAIGREUR(R.string.category_maigreur, R.drawable.maigre),
    NORMAL(R.string.category_normal, R.drawable.normal),
    SURPOIDS(R.string.category_surpoids, R.drawable.surpoids),
    OBESITE_MODEREE(R.string.category_obesite, R.drawable.obese),
    OBESITE_SEVERE(R.string.category_obesite_severe, R.drawable.t_obese);

    private final int labelResId;
    private final int imageResId;

    ImcCategory(int labelResId, int imageResId) {
        this.labelResId = labelResId;
        this.imageResId = imageResId;
    }

    public int getLabelResId() { return labelResId; }
    public int getImageResId() { return imageResId; }
}
