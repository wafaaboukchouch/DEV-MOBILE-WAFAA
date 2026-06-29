package ma.enset.wafaa.imcapp.service;

import ma.enset.wafaa.imcapp.model.ImcCategory;
import ma.enset.wafaa.imcapp.model.ImcResult;

/**
 * Service de calcul de l'Indice de Masse Corporelle (IMC).
 * Formule : IMC = poids (kg) / taille² (m)
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class ImcCalculator {

    public ImcResult calculate(double weightKg, double heightCm) {
        if (weightKg <= 0 || heightCm <= 0) {
            throw new IllegalArgumentException("Le poids et la taille doivent être positifs.");
        }
        double heightM = heightCm / 100.0;
        double imc = weightKg / (heightM * heightM);
        return new ImcResult(imc, determineCategory(imc));
    }

    private ImcCategory determineCategory(double imc) {
        if (imc < 18.5)  return ImcCategory.MAIGREUR;
        if (imc < 25.0)  return ImcCategory.NORMAL;
        if (imc < 30.0)  return ImcCategory.SURPOIDS;
        if (imc <= 40.0) return ImcCategory.OBESITE_MODEREE;
        return ImcCategory.OBESITE_SEVERE;
    }
}
