package ma.enset.wafaa.calculator;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

/**
 * Calculatrice portrait — opérations de base (+, -, x, /).
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class PortraitActivity extends AppCompatActivity {

    private TextView display;
    private String currentInput = "";
    private double operand1 = 0;
    private String operator = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_portrait);
        display = findViewById(R.id.display);
    }

    public void onNumberClick(View view) {
        currentInput += ((TextView) view).getText().toString();
        updateDisplay();
    }

    public void onOperatorClick(View view) {
        if (!currentInput.isEmpty()) {
            operator = ((TextView) view).getText().toString();
            operand1 = Double.parseDouble(currentInput);
            currentInput = "";
        }
    }

    public void onChangeSign(View view) {
        if (!currentInput.isEmpty()) {
            double val = -Double.parseDouble(currentInput);
            currentInput = formatNumber(val);
            updateDisplay();
        }
    }

    public void onEqualsClick(View view) {
        if (!currentInput.isEmpty() && !operator.isEmpty()) {
            double operand2 = Double.parseDouble(currentInput);
            double result = performOperation(operand1, operand2, operator);
            currentInput = formatNumber(result);
            operator = "";
            updateDisplay();
        }
    }

    public void onPercentageClick(View view) {
        if (!currentInput.isEmpty()) {
            double val = Double.parseDouble(currentInput) / 100.0;
            currentInput = formatNumber(val);
            updateDisplay();
        }
    }

    public void onClearClick(View view) {
        currentInput = "";
        operand1 = 0;
        operator = "";
        display.setText("0");
    }

    private double performOperation(double a, double b, String op) {
        switch (op) {
            case "+": return a + b;
            case "-": return a - b;
            case "x": return a * b;
            case "/": return b != 0 ? a / b : Double.NaN;
            default:  return Double.NaN;
        }
    }

    private String formatNumber(double val) {
        if (val == (long) val) return String.valueOf((long) val);
        return String.valueOf(val);
    }

    private void updateDisplay() { display.setText(currentInput); }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (newConfig.orientation == Configuration.ORIENTATION_LANDSCAPE) {
            startActivity(new Intent(this, LandscapeActivity.class));
            finish();
        }
    }
}
