package ma.enset.wafaa.login;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

/**
 * Écran de bienvenue — affiche les données reçues via Bundle.
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class SecondActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        Bundle bundle = getIntent().getExtras();
        if (bundle != null) {
            ((TextView) findViewById(R.id.tvUsername)).setText(bundle.getString("username"));
            ((TextView) findViewById(R.id.tvPassword)).setText(bundle.getString("password"));
        }
    }

    public void retour(View view) {
        startActivity(new Intent(this, FirstActivity.class));
        finish();
    }

    @Override protected void onStart()   { super.onStart();   Toast.makeText(this, "onStart",   Toast.LENGTH_SHORT).show(); }
    @Override protected void onRestart() { super.onRestart(); Toast.makeText(this, "onRestart", Toast.LENGTH_SHORT).show(); }
    @Override protected void onPause()   { super.onPause();   Toast.makeText(this, "onPause",   Toast.LENGTH_SHORT).show(); }
    @Override protected void onStop()    { super.onStop();    Toast.makeText(this, "onStop",    Toast.LENGTH_SHORT).show(); }
    @Override protected void onDestroy() { super.onDestroy(); Toast.makeText(this, "onDestroy", Toast.LENGTH_SHORT).show(); }
}
