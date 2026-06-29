package ma.enset.wafaa.imcapp.ui;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

import ma.enset.wafaa.imcapp.R;
import ma.enset.wafaa.imcapp.model.ImcResult;
import ma.enset.wafaa.imcapp.service.ImcCalculator;

/**
 * Activité principale — Calculateur d'IMC.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class MainActivity extends Activity {

    private final ImcCalculator imcCalculator = new ImcCalculator();

    private EditText editTextPoids;
    private EditText editTextTaille;
    private TextView textViewResultat;
    private TextView textViewCategorie;
    private ImageView imageViewCategorie;
    private DecimalFormat imcFormat;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        DecimalFormatSymbols symbols = DecimalFormatSymbols.getInstance(Locale.FRANCE);
        imcFormat = new DecimalFormat("0.00", symbols);

        editTextPoids    = findViewById(R.id.editTextPoids);
        editTextTaille   = findViewById(R.id.editTextTaille);
        textViewResultat = findViewById(R.id.textViewResultat);
        textViewCategorie = findViewById(R.id.textViewCategorie);
        imageViewCategorie = findViewById(R.id.imageViewCategorie);

        Button btnCalculer = findViewById(R.id.btnCalculer);
        btnCalculer.setOnClickListener(view -> calculerImc());
    }

    private void calculerImc() {
        Double poids  = lireValeurPositive(editTextPoids);
        Double taille = lireValeurPositive(editTextTaille);

        if (poids == null || taille == null) {
            effacerResultat();
            return;
        }

        ImcResult resultat = imcCalculator.calculate(poids, taille);
        afficherResultat(resultat);
    }

    private Double lireValeurPositive(EditText editText) {
        String saisie = editText.getText().toString().trim().replace(',', '.');
        if (saisie.isEmpty()) {
            editText.setError(getString(R.string.erreur_champ_obligatoire));
            return null;
        }
        try {
            double valeur = Double.parseDouble(saisie);
            if (valeur <= 0) {
                editText.setError(getString(R.string.erreur_valeur_invalide));
                return null;
            }
            editText.setError(null);
            return valeur;
        } catch (NumberFormatException e) {
            editText.setError(getString(R.string.erreur_valeur_invalide));
            return null;
        }
    }

    private void afficherResultat(ImcResult resultat) {
        textViewResultat.setText(
            getString(R.string.resultat_format, imcFormat.format(resultat.getValue()))
        );
        textViewCategorie.setText(resultat.getCategory().getLabelResId());
        imageViewCategorie.setImageResource(resultat.getCategory().getImageResId());
        imageViewCategorie.setVisibility(View.VISIBLE);
    }

    private void effacerResultat() {
        textViewResultat.setText(R.string.resultat_vide);
        textViewCategorie.setText("");
        imageViewCategorie.setVisibility(View.INVISIBLE);
    }
}
