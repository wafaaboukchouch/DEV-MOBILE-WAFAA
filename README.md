# 📱 Développement Mobile Multiplateforme — MII BDCC ENSET

**Auteure :** Wafaa Boukchouch  
**Filière :** Master MII BDCC — ENSET Mohammedia (Université Hassan II)  
**Module :** Développement Mobile Multiplateforme  
**Année :** 2024–2025

---

## 📋 Table des séances

| Séance | Technologie | Projet | Description |
|--------|------------|--------|-------------|
| [Séance 1](#séance-1) | Android Java | `imc_app` | Calculateur d'IMC |
| [Séance 2](#séance-2) | Android Java | `Calculator2` + `SplashScreen` | Calculatrice portrait/paysage + Navigation + Internationalisation |
| [Séance 3](#séance-3) | Flutter | `quiz_app` | Quiz IT/Cloud + Météo temps réel |
| [Séance 4](#séance-4) | Flutter | `app_synthese` | POO Dart + App multi-pages + Drawer |
| [Séance 5](#séance-5) | Flutter | `WafaaBot` | Chatbot IA multiplateforme (Groq API) |

---

## 🎨 Personnalisation

- **Package Android :** `ma.enset.wafaa.*`
- **Palette de couleurs :** Teal (`#006B5E`) + Bleu nuit (`#1A2340`)
- **Commentaires :** `@author Wafaa Boukchouch - MII BDCC ENSET`
- **Quiz (S3) :** Questions thématiques Azure, Intune, HDFS, LangChain
- **Galerie (S4) :** Stack technique personnelle (Azure, Flutter, Spark, Docker...)
- **Chatbot (S5) :** WafaaBot avec system prompt Cloud/IA spécialisé

---

## 📁 Structure du projet

```
DEV-MOBILE-WAFAA-Boukchouch-MII-BDCC-ENSET/
├── Seance1-Android-Natif/
│   └── imc_app/                    ← Android Studio project
├── Seance2-Android-Natif-Suite/
│   ├── Calculator2/                ← Calculatrice portrait/paysage
│   └── SplashScreen-Navigation-Internationalisation/
├── Seance3-Flutter-Partie1/
│   └── quiz_app/                   ← Quiz + Météo (Flutter)
├── Seance4-Flutter-Partie2/
│   └── app_synthese/               ← App multi-pages + Drawer (Flutter)
└── Seance5-Flutter-Partie3-Etats/
    └── WafaaBot/                   ← Chatbot IA (Flutter + Groq)
```

---

## 🚀 Lancement des projets

### Android (Séances 1 & 2)
```bash
# Ouvrir dans Android Studio → File → Open → choisir le dossier du projet
# Lancer avec ▶️ sur l'émulateur AVD (Pixel 9 Pro - API 37)
```

### Flutter (Séances 3, 4 & 5)
```bash
flutter pub get
flutter run
```

### WafaaBot — Configuration API Groq (Séance 5)
```bash
# 1. Créer un compte sur https://console.groq.com
# 2. Générer une clé API gratuite
# 3. Renseigner dans WafaaBot/.env :
GROQ_API_KEY=votre_clé_ici
```

---

## 🛠️ Prérequis

- Android Studio (version récente)
- JDK 17
- Flutter SDK (≥ 3.0)
- Émulateur AVD (Pixel 9 Pro - API 37) ou appareil physique

---

*Travail réalisé dans le cadre du Master MII BDCC — ENSET Mohammedia*  
*© 2025 Wafaa Boukchouch*
