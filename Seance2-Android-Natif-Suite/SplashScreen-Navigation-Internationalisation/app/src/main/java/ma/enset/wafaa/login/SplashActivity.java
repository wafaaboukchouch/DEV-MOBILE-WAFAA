package ma.enset.wafaa.login;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import androidx.appcompat.app.AppCompatActivity;

/**
 * Écran de démarrage — redirige vers FirstActivity après 3 secondes.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class SplashActivity extends AppCompatActivity {

    private static final int SPLASH_DELAY_MS = 3000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash);

        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            startActivity(new Intent(SplashActivity.this, FirstActivity.class));
            finish();
        }, SPLASH_DELAY_MS);
    }
}
