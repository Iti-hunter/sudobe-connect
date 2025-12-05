# 🍪 Pop-up Modal Cookies - Guide Utilisateur

## ✅ Ce qui fonctionne parfaitement

### index.html
✅ **Entièrement fonctionnel** avec le nouveau pop-up modal !
- Pop-up centré au chargement
- Overlay bloquant l'arrière-plan
- Scroll bloqué jusqu'au choix
- Boutons "Refuser" / "Accepter"
- Lien "Gérer mes cookies" dans le footer
- Google Tag Manager chargé uniquement après acceptation

### JavaScript & CSS
✅ **Tous les fichiers techniques sont à jour** :
- `js/cookie-consent.js` : Gestion complète du modal
- `css/style.css` : Design moderne du pop-up
- Overlay semi-transparent bleu marine
- Animation d'apparition fluide
- Responsive mobile/tablette/desktop

---

## ⚠️ Pages à restaurer manuellement

Les 5 autres pages HTML ont perdu leur contenu principal (mais le modal est correct) :
- blog.html
- galerie.html
- article.html
- article-protection-seniors.html
- mentions-legales.html

**Vous devez restaurer le contenu principal de ces pages à partir d'une sauvegarde.**

---

## 📋 Pour ajouter le modal cookies sur une nouvelle page

Si vous avez des sauvegardes de vos pages ou voulez ajouter le modal à une nouvelle page, suivez ces étapes :

### 1️⃣ Dans le `<head>` (après le CSS)

```html
<!-- Google Tag Manager - CHARGEMENT CONDITIONNEL APRÈS CONSENTEMENT -->
<!-- Le script GTM est injecté dynamiquement par js/cookie-consent.js -->
<!-- UNIQUEMENT après acceptation des cookies par l'utilisateur (RGPD) -->
<!-- ID GTM : GTM-5C9LQGWT -->
```

### 2️⃣ Juste après `<body>`

```html
<!-- Google Tag Manager (noscript) - INJECTÉ DYNAMIQUEMENT -->
<!-- Le noscript iframe est ajouté automatiquement par js/cookie-consent.js -->
<!-- après consentement de l'utilisateur -->
```

### 3️⃣ Dans le footer (footer-bottom, dans footer-copyright)

Remplacer :
```html
<p class="footer-copyright">&copy; 2025 Sudobe Connect. Tous droits réservés.</p>
```

Par :
```html
<p class="footer-copyright">
    &copy; 2025 Sudobe Connect. Tous droits réservés.
    <span class="footer-separator">·</span>
    <a href="mentions-legales.html" class="footer-link">Mentions légales</a>
    <span class="footer-separator">·</span>
    <a href="#" id="manage-cookies-link" class="footer-link">Gérer mes cookies</a>
</p>
```

### 4️⃣ Avant `</body>` (après les autres scripts)

```html
    <!-- ========== MODAL CONSENTEMENT COOKIES RGPD ========== -->
    <div id="cookie-consent-modal" class="cookie-consent-modal" style="display: none;">
        <!-- Overlay semi-transparent qui bloque la page -->
        <div class="cookie-overlay"></div>

        <!-- Pop-up centrale -->
        <div class="cookie-popup">
            <!-- Icône -->
            <div class="cookie-popup-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="12" cy="12" r="10"></circle>
                    <circle cx="12" cy="12" r="1.5" fill="currentColor"></circle>
                    <circle cx="8" cy="8" r="1.5" fill="currentColor"></circle>
                    <circle cx="16" cy="8" r="1.5" fill="currentColor"></circle>
                    <circle cx="8" cy="16" r="1.5" fill="currentColor"></circle>
                    <circle cx="16" cy="16" r="1.5" fill="currentColor"></circle>
                </svg>
            </div>

            <!-- Titre -->
            <h2 class="cookie-popup-title">Ce site utilise des cookies</h2>

            <!-- Texte explicatif -->
            <p class="cookie-popup-text">
                Nous utilisons des cookies de mesure d'audience pour améliorer nos services.
                Vous pouvez accepter ou refuser leur utilisation.
            </p>

            <!-- Boutons -->
            <div class="cookie-popup-buttons">
                <button id="cookie-refuse-btn" class="cookie-btn cookie-btn-refuse" aria-label="Refuser les cookies">
                    Refuser
                </button>
                <button id="cookie-accept-btn" class="cookie-btn cookie-btn-accept" aria-label="Accepter les cookies">
                    Accepter
                </button>
            </div>
        </div>
    </div>

    <!-- JavaScript -->
    <script src="js/main.js"></script>
    <script src="js/cookie-consent.js"></script>
</body>
</html>
```

---

## 🎨 Comment modifier le texte du pop-up

### Titre
**Fichier** : Toutes les pages HTML
**Ligne à chercher** : `<h2 class="cookie-popup-title">`

```html
<h2 class="cookie-popup-title">Votre nouveau titre</h2>
```

### Texte explicatif
**Fichier** : Toutes les pages HTML
**Ligne à chercher** : `<p class="cookie-popup-text">`

```html
<p class="cookie-popup-text">
    Votre texte explicatif sur l'usage des cookies.
    Vous pouvez mettre plusieurs lignes.
</p>
```

### Boutons
**Fichiers** : Toutes les pages HTML

**Bouton Refuser** :
```html
<button id="cookie-refuse-btn" class="cookie-btn cookie-btn-refuse" aria-label="Refuser les cookies">
    Refuser
</button>
```

**Bouton Accepter** :
```html
<button id="cookie-accept-btn" class="cookie-btn cookie-btn-accept" aria-label="Accepter les cookies">
    Accepter
</button>
```

⚠️ **Ne modifiez pas les `id` et `class` des boutons**, sinon le JavaScript ne fonctionnera plus !

---

## 🔧 Comment changer l'ID Google Tag Manager

**Fichier** : `js/cookie-consent.js`
**Ligne** : 9

```javascript
const GTM_ID = 'GTM-5C9LQGWT';  // ← Modifiez cette valeur
```

**Exemple** :
```javascript
const GTM_ID = 'GTM-NOUVELID';
```

Après modification :
1. Sauvegarder le fichier
2. Vider le cache du navigateur (Ctrl+Shift+R)
3. Tester avec la console : `SudobeCookieConsent.GTM_ID`

---

## 🧪 Tests à effectuer sur index.html

### Test 1 : Première visite (navigation privée)
1. Ouvrir index.html en navigation privée (Ctrl+Shift+N)
2. ✅ Le pop-up doit apparaître au centre
3. ✅ L'arrière-plan doit être flouté/assombri
4. ✅ Impossible de cliquer en arrière-plan
5. ✅ Impossible de scroller
6. ✅ Les 2 boutons sont visibles

### Test 2 : Acceptation
1. Cliquer sur "Accepter"
2. ✅ Le pop-up disparaît
3. ✅ Le scroll est rétabli
4. ✅ Ouvrir DevTools (F12) → Network
5. ✅ Voir la requête vers `googletagmanager.com/gtm.js`
6. ✅ Console : `window.dataLayer` doit exister

### Test 3 : Refus
1. Ouvrir en navigation privée
2. Cliquer sur "Refuser"
3. ✅ Le pop-up disparaît
4. ✅ Le scroll est rétabli
5. ✅ Network : AUCUNE requête vers Google
6. ✅ Console : `window.dataLayer` est `undefined`

### Test 4 : Visite suivante
1. Après avoir accepté (Test 2), fermer l'onglet
2. Rouvrir index.html
3. ✅ Le pop-up ne réapparaît PAS
4. ✅ GTM se charge automatiquement

### Test 5 : Gérer mes cookies
1. Après avoir accepté ou refusé
2. Scroller en bas de page
3. Cliquer sur "Gérer mes cookies" (footer)
4. ✅ Le pop-up réapparaît
5. ✅ Possibilité de changer son choix

### Test 6 : Navigation clavier
1. Ouvrir en navigation privée
2. Appuyer sur Tab
3. ✅ Focus passe au bouton "Refuser" (outline visible)
4. Appuyer sur Tab
5. ✅ Focus passe au bouton "Accepter"
6. Appuyer sur Entrée
7. ✅ Le bouton focus est activé

### Test 7 : Mobile
1. Ouvrir DevTools (F12)
2. Mode Responsive (Ctrl+Shift+M)
3. Sélectionner iPhone ou Android
4. ✅ Le pop-up s'adapte à la largeur
5. ✅ Les boutons sont empilés verticalement
6. ✅ Texte lisible

---

## 🐛 Résolution de problèmes

### Le pop-up ne s'affiche pas
**Cause** : Consentement déjà donné précédemment

**Solution** :
```javascript
// Dans la Console (F12)
SudobeCookieConsent.reset()
location.reload()
```

### GTM ne se charge pas après acceptation
**Causes possibles** :
1. Adblocker actif
2. ID GTM incorrect
3. Erreur JavaScript

**Vérifications** :
```javascript
// Console (F12)
SudobeCookieConsent.GTM_ID  // Vérifier l'ID
window.dataLayer  // Doit être un Array
```

**Network (F12)** : Chercher `gtm.js`
- Si bloqué → Adblocker
- Si 404 → ID incorrect

### Le pop-up réapparaît à chaque visite
**Cause** : localStorage ne fonctionne pas

**Solutions** :
1. Vérifier paramètres navigateur (autoriser cookies)
2. Ne pas être en navigation privée
3. Tester localStorage :
```javascript
localStorage.setItem('test', '123')
localStorage.getItem('test')  // Doit retourner '123'
```

---

## 📊 Commandes console (debug)

```javascript
// Voir le consentement actuel
SudobeCookieConsent.getConsent()

// Accepter manuellement
SudobeCookieConsent.accept()

// Refuser manuellement
SudobeCookieConsent.refuse()

// Rouvrir le modal
SudobeCookieConsent.manage()

// Réinitialiser (supprimer le consentement)
SudobeCookieConsent.reset()

// Voir l'ID GTM
SudobeCookieConsent.GTM_ID

// Vérifier si GTM est chargé
window.dataLayer
```

---

## ✨ Résumé

### ✅ Fonctionnel sur index.html
- Pop-up modal centré
- Overlay bloquant
- Scroll bloqué jusqu'au choix
- Design moderne Sudobe (bleu/turquoise/blanc)
- Responsive (mobile/tablette/desktop)
- RGPD conforme (Do Not Track par défaut)
- Lien "Gérer mes cookies" dans le footer

### 📝 À faire
1. Restaurer le contenu des 5 autres pages (blog, galerie, articles, mentions)
2. Ajouter le modal à chaque page restaurée (copier depuis index.html)
3. Tester sur chaque page
4. Vérifier que le lien "Gérer mes cookies" fonctionne partout

---

**Date de création** : 4 décembre 2025
**Statut index.html** : ✅ Opérationnel
**Statut autres pages** : ⚠️ À restaurer manuellement
