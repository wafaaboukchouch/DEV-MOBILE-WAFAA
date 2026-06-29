package ma.enset.wafaa.calculator;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

/**
 * Exercice Click / LongClick — détection des événements tactiles.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class ClickLongClickActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_click_long_click);

        Button btnAction = findViewById(R.id.click);
        TextView tvMessage = findViewById(R.id.longText);

        btnAction.setOnClickListener(v -> {
            Toast.makeText(this, "Clic simple détecté !", Toast.LENGTH_SHORT).show();
            tvMessage.setText("Clic simple sur le bouton");
        });

        btnAction.setOnLongClickListener(v -> {
            Toast.makeText(this, "Clic long détecté !", Toast.LENGTH_SHORT).show();
            tvMessage.setText("Clic long sur le bouton");
            return true;
        });
    }
}
