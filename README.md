# Sudobe Connect - Site Vitrine

L'inclusion numérique bienveillante pour les seniors

## 🚀 Structure du projet

```
sudobe_connect_site/
├── index.html          → Fichier HTML principal
├── css/
│   └── style.css       → Tous les styles (mobile-first)
├── js/
│   └── script.js       → Interactions (menu, scroll, animations)
├── images/
│   └── logo.png        → Votre logo (à ajouter)
├── assets/
│   └── (PDF présentation à ajouter)
└── README.md           → Ce fichier
```

## 📋 Étapes pour finaliser le site

### 1. Ajouter votre logo
- Placez votre fichier logo dans le dossier `images/`
- Renommez-le `logo.png` (ou modifiez le chemin dans `index.html` ligne 47)
- Format recommandé : PNG transparent, hauteur ~200-300px

### 2. Tester en local

**Option A : Avec Python (recommandé)**
```bash
# Ouvrez un terminal dans le dossier du projet
cd /Users/eltegetheresias/Desktop/sudobe_connect_site

# Lancez un serveur local avec Python 3
python3 -m http.server 8000

# Ouvrez votre navigateur à : http://localhost:8000
```

**Option B : Avec l'extension VSCode "Live Server"**
- Installez l'extension "Live Server" dans VSCode
- Clic droit sur `index.html` → "Open with Live Server"

**Option C : Double-clic sur index.html**
- Simple mais le formulaire Netlify ne fonctionnera pas en local

### 3. Vérifier le responsive

Ouvrez les outils de développement de votre navigateur :
- **Chrome/Edge** : F12 ou Cmd+Option+I (Mac)
- Cliquez sur l'icône "Toggle device toolbar" (Cmd+Shift+M sur Mac)
- Testez différentes tailles :
  - Mobile : 375px (iPhone)
  - Tablette : 768px (iPad)
  - Desktop : 1440px

### 4. Déployer sur Netlify (GRATUIT)

#### Méthode Drag & Drop (la plus simple)

1. Allez sur [https://app.netlify.com/drop](https://app.netlify.com/drop)
2. Glissez-déposez le dossier `sudobe_connect_site` complet
3. Netlify génère automatiquement une URL (ex: `sudobe-connect.netlify.app`)
4. Le formulaire de contact fonctionnera automatiquement !

#### Méthode Git (recommandée pour mises à jour futures)

1. Créez un compte sur [Netlify](https://www.netlify.com/)
2. Créez un repository GitHub avec votre code
3. Connectez Netlify à votre repository
4. Déploiement automatique à chaque modification !

### 5. Configuration du formulaire de contact

Le formulaire utilise **Netlify Forms**, il fonctionne automatiquement après déploiement :
- Les soumissions arrivent dans l'onglet "Forms" de votre dashboard Netlify
- Vous pouvez configurer des notifications par email
- Aucun code backend nécessaire !

## 🎨 Personnalisation

### Modifier les couleurs

Éditez les variables CSS dans `css/style.css` (lignes 8-12) :

```css
:root {
    --color-primary: #1A3A52;    /* Bleu marine */
    --color-secondary: #00B4D8;  /* Turquoise */
    --color-accent: #F4A300;     /* Jaune doré */
    --color-blue-light: #48CAE4; /* Bleu clair */
}
```

### Modifier les textes

Tous les textes sont dans `index.html`. Sections principales :
- **Ligne 59** : Hero (titre, slogan)
- **Ligne 86** : Contexte (chiffres clés)
- **Ligne 125** : Promesse & Mission
- **Ligne 250** : Modules de formation
- **Ligne 499** : Formulaire de contact

### Ajouter le PDF de présentation

1. Placez votre PDF dans le dossier `assets/`
2. Modifiez le lien dans `index.html` :
   - Ligne 73 : `<a href="assets/presentation-sudobe.pdf" ...>`
   - Ligne 557 : même modification

## ✅ Checklist avant mise en ligne

- [ ] Logo ajouté dans `images/logo.png`
- [ ] Tous les textes vérifiés et corrigés
- [ ] Chiffres clés vérifiés (section Contexte)
- [ ] Tarifs vérifiés (section Modules)
- [ ] Email de contact vérifié : `sudobe.talent@gmail.com`
- [ ] PDF de présentation ajouté (optionnel)
- [ ] Test responsive sur mobile/tablette/desktop
- [ ] Test du formulaire de contact après déploiement
- [ ] Vérification de l'accessibilité (contrastes, navigation au clavier)

## 🔧 Améliorations futures possibles

- [ ] Ajouter un favicon (icône dans l'onglet du navigateur)
- [ ] Ajouter Google Analytics pour suivre le trafic
- [ ] Créer une page Mentions Légales
- [ ] Ajouter des témoignages clients
- [ ] Intégrer un calendrier de réservation (Calendly)
- [ ] Ajouter des photos des formations
- [ ] Créer une version anglaise

## 📱 Support navigateurs

Le site est compatible avec :
- ✅ Chrome/Edge (dernières versions)
- ✅ Firefox (dernières versions)
- ✅ Safari (iOS 12+, macOS)
- ✅ Samsung Internet
- ⚠️ Internet Explorer : non supporté (obsolète)

## 🆘 Besoin d'aide ?

### Le menu burger ne fonctionne pas
- Vérifiez que `js/script.js` est bien chargé
- Ouvrez la console (F12) pour voir les erreurs

### Le formulaire ne s'envoie pas
- En local : normal, utilisez Netlify
- Après déploiement : vérifiez l'onglet "Forms" dans Netlify

### Les images ne s'affichent pas
- Vérifiez le chemin du logo dans `index.html`
- Le fichier doit être exactement dans `images/logo.png`

### Problème de responsive
- Testez avec les outils développeur (F12)
- Vérifiez les media queries dans `css/style.css`

## 📧 Contact

Pour toute question sur le code :
- Email : sudobe.talent@gmail.com

---

**Développé avec soin pour Sudobe Connect** 🌟
L'inclusion numérique bienveillante pour les seniors
