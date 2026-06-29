package ma.enset.wafaa.login;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

/**
 * Écran de connexion — saisie identifiant + mot de passe.
 * Démo du cycle de vie Android (Toast sur chaque callback).
 * @author Wafaa Boukchouch - MII BDCC ENSET
 */
public class FirstActivity extends AppCompatActivity {

    private EditText editUsername;
    private EditText editPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_first);
        Toast.makeText(this, "onCreate", Toast.LENGTH_SHORT).show();
        editUsername = findViewById(R.id.editUsername);
        editPassword = findViewById(R.id.editPassword);
    }

    public void seConnecter(View view) {
        String username = editUsername.getText().toString().trim();
        String password = editPassword.getText().toString().trim();

        if (username.isEmpty() || password.isEmpty()) {
            Toast.makeText(this, getString(R.string.msg_champs_requis), Toast.LENGTH_LONG).show();
            return;
        }
        Intent intent = new Intent(this, SecondActivity.class);
        Bundle bundle = new Bundle();
        bundle.putString("username", username);
        bundle.putString("password", password);
        intent.putExtras(bundle);
        startActivity(intent);
        finish();
    }

    @Override protected void onStart()   { super.onStart();   Toast.makeText(this, "onStart",   Toast.LENGTH_SHORT).show(); }
    @Override protected void onRestart() { super.onRestart(); Toast.makeText(this, "onRestart", Toast.LENGTH_SHORT).show(); }
    @Override protected void onPause()   { super.onPause();   Toast.makeText(this, "onPause",   Toast.LENGTH_SHORT).show(); }
    @Override protected void onStop()    { super.onStop();    Toast.makeText(this, "onStop",    Toast.LENGTH_SHORT).show(); }
    @Override protected void onDestroy() { super.onDestroy(); Toast.makeText(this, "onDestroy", Toast.LENGTH_SHORT).show(); }
}
