package ma.enset.wafaa.calculator;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import ma.enset.wafaa.calculator.utils.Calculator;

/**
 * Calculatrice paysage — mode scientifique (sin, cos, tan, sqrt, log...).
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class LandscapeActivity extends AppCompatActivity {

    private TextView display;
    private StringBuilder expression = new StringBuilder();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_landscape);
        display = findViewById(R.id.display);
    }

    public void onNumberClick(View view) {
        expression.append(((TextView) view).getText().toString());
        display.setText(expression.toString());
    }

    public void onFunctionClick(View view) {
        String func = ((TextView) view).getText().toString().toLowerCase();
        expression.append(func).append("(");
        display.setText(expression.toString());
    }

    public void onPiClick(View view) {
        expression.append("PI");
        display.setText(expression.toString());
    }

    public void onEqualsClick(View view) {
        try {
            String expr = expression.toString().replace("PI", String.valueOf(Math.PI));
            double result = Calculator.evaluate(expr);
            expression = new StringBuilder(formatNumber(result));
            display.setText(expression.toString());
        } catch (Exception e) {
            display.setText("Erreur");
            expression = new StringBuilder();
        }
    }

    public void onClearClick(View view) {
        expression = new StringBuilder();
        display.setText("0");
    }

    public void onBackspaceClick(View view) {
        if (expression.length() > 0) {
            expression.deleteCharAt(expression.length() - 1);
            display.setText(expression.length() > 0 ? expression.toString() : "0");
        }
    }

    private String formatNumber(double val) {
        if (val == (long) val) return String.valueOf((long) val);
        return String.valueOf(val);
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (newConfig.orientation == Configuration.ORIENTATION_PORTRAIT) {
            startActivity(new Intent(this, PortraitActivity.class));
            finish();
        }
    }
}
