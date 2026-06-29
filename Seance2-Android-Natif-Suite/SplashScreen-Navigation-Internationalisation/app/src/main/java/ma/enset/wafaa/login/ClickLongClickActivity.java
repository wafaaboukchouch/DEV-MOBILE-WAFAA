package ma.enset.wafaa.login;

import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

/**
 * Exercice Click / LongClick.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class ClickLongClickActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_click_long_click);

        Button btn = findViewById(R.id.click);
        TextView tv = findViewById(R.id.longText);

        btn.setOnClickListener(v -> {
            Toast.makeText(this, "Clic simple !", Toast.LENGTH_SHORT).show();
            tv.setText("Clic simple détecté");
        });
        btn.setOnLongClickListener(v -> {
            Toast.makeText(this, "Clic long !", Toast.LENGTH_SHORT).show();
            tv.setText("Clic long détecté");
            return true;
        });
    }
}
