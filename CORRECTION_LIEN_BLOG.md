# Correction - Lien "Blog" dans la navigation

## 🐛 Problème identifié

Le lien "Blog" dans le header ne fonctionnait pas : cliquer dessus ne chargeait pas la page `blog.html`.

---

## 🔍 Diagnostic

### 1. Problème JavaScript (PRINCIPAL)

**Fichier** : `js/script.js` (lignes 46-60)

**Cause** : Le code JavaScript appliquait `e.preventDefault()` sur **TOUS** les liens de navigation (`.nav-link`), y compris les liens externes comme `blog.html` et `galerie.html`.

```javascript
// AVANT (BLOQUANT)
navLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        e.preventDefault(); // ❌ Bloque TOUS les liens
        const targetId = link.getAttribute('href');
        const targetSection = document.querySelector(targetId);
        // ...
    });
});
```

**Conséquence** :
- Les liens d'ancrage (`#hero`, `#contexte`, etc.) fonctionnaient
- Les liens vers d'autres pages (`blog.html`, `galerie.html`) étaient bloqués

### 2. Incohérence des références JavaScript

**Problème** :
- `index.html` référençait `js/script.js`
- `blog.html`, `galerie.html`, `article.html`, `article-protection-seniors.html` référençaient `js/main.js`
- Le fichier `main.js` n'existait pas → erreurs 404

---

## ✅ Corrections appliquées

### 1. JavaScript : Autoriser la navigation externe

**Fichier modifié** : `js/script.js` (maintenant `js/main.js`)

**Solution** : Vérifier si le lien commence par `#` avant d'appliquer `preventDefault()`

```javascript
// APRÈS (CORRECT)
navLinks.forEach(link => {
    link.addEventListener('click', (e) => {
        const targetId = link.getAttribute('href');

        // Ne bloquer que les liens d'ancrage (commençant par #)
        // Laisser passer les liens vers d'autres pages (blog.html, galerie.html, etc.)
        if (targetId.startsWith('#')) {
            const targetSection = document.querySelector(targetId);

            if (targetSection) {
                e.preventDefault();
                const offsetTop = targetSection.offsetTop - 70;
                window.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                });
            }
        }
    });
});
```

**Résultat** :
- ✅ Liens d'ancrage (`#hero`, `#contexte`, etc.) : scroll fluide maintenu
- ✅ Liens externes (`blog.html`, `galerie.html`) : navigation normale autorisée

### 2. Uniformisation des références JavaScript

**Actions** :
1. Renommé `js/script.js` → `js/main.js`
2. Mis à jour `index.html` : `<script src="js/main.js"></script>`

**Résultat** : Toutes les pages référencent maintenant le même fichier JavaScript (`js/main.js`)

---

## 🎯 Vérifications effectuées

### Navigation

✅ **Liens index.html → blog.html** : Fonctionne
✅ **Liens index.html → galerie.html** : Fonctionne
✅ **Liens internes (`#hero`, `#modules`, etc.)** : Scroll fluide maintenu
✅ **Menu burger mobile** : Fermeture après clic maintenue

### Blog

✅ **Fichier blog.html** : Existe à la racine du site (20 Ko)
✅ **Articles affichés** : Du plus récent au plus ancien
✅ **Dates** : Affichées avec icône horloge SVG
✅ **Catégories** : Badges colorés affichés (Actualités, Prévention, Formation, etc.)

**Ordre des articles** :
1. "Pourquoi protéger nos seniors face au numérique ?" - 26 novembre 2025 (Actualités)
2. "Comment reconnaître un deepfake vocal ?" - 25 novembre 2025 (Prévention)
3. "ChatGPT pour les seniors : guide pratique" - 20 novembre 2025 (Formation)
4. "L'IA au service de l'autonomie des seniors" - 15 novembre 2025 (Actualités)
5. "5 réflexes pour sécuriser vos données personnelles" - 10 novembre 2025 (Prévention)
6. "Retour d'expérience : formation en EHPAD" - 5 novembre 2025 (Témoignages)
7. "Top 5 des outils IA gratuits et accessibles" - 1er novembre 2025 (Formation)

### Galerie

✅ **Fichier galerie.html** : Existe à la racine du site (15 Ko)
✅ **Navigation** : Lien "Galerie" fonctionne

---

## 📦 Fichiers modifiés

| Fichier | Modification |
|---------|--------------|
| **js/script.js** | Renommé en `js/main.js` + condition `if (targetId.startsWith('#'))` ajoutée |
| **index.html** | Référence JavaScript mise à jour vers `js/main.js` |

**Aucune modification** : `blog.html`, `galerie.html`, `article.html`, `article-protection-seniors.html` (déjà corrects)

---

## 🚀 Résultat final

**Le lien "Blog" fonctionne maintenant parfaitement !**

### Test de navigation

1. **Depuis index.html** :
   - Clic sur "Blog" → Charge `blog.html` avec la grille d'articles ✅
   - Clic sur "Galerie" → Charge `galerie.html` avec les photos ✅
   - Clic sur "Modules" → Scroll fluide vers la section ✅

2. **Depuis blog.html** :
   - Clic sur "Lire la suite" → Charge l'article complet ✅
   - Clic sur "Accueil" → Retour à `index.html` ✅

3. **Menu burger (mobile)** :
   - Clic sur "Blog" → Navigation + fermeture du menu ✅

---

## 🎨 Bonus : Structure du blog

### Métadonnées affichées pour chaque article

- **Date** : Icône horloge SVG + date formatée (ex: "26 novembre 2025")
- **Catégorie** : Badge coloré avec texte uppercase
  - Actualités : Turquoise
  - Prévention : Turquoise
  - Formation : Turquoise
  - Témoignages : Turquoise

### Design cohérent

- Grille responsive : 1 colonne (mobile) → 2 colonnes (tablette) → 3 colonnes (desktop)
- Cartes avec hover : lift -5px + ombre renforcée + bordure turquoise
- Images avec fallback SVG si manquantes
- Boutons "Lire la suite" avec flèches animées

---

## 📝 Notes techniques

### Pourquoi la correction fonctionne

**Avant** : Le JavaScript ne faisait pas de distinction entre :
- Liens d'ancrage (`href="#hero"`) → nécessite `preventDefault()` pour scroll fluide
- Liens de navigation (`href="blog.html"`) → nécessite navigation normale

**Après** : Le test `if (targetId.startsWith('#'))` permet de :
- Bloquer uniquement les liens commençant par `#`
- Laisser passer tous les autres liens (chemins relatifs, absolus, etc.)

### Compatibilité

✅ Compatible avec tous les navigateurs modernes (Chrome, Firefox, Safari, Edge)
✅ Fonctionne sur mobile, tablette, desktop
✅ Pas de conflit avec le menu burger
✅ Pas de conflit avec le lightbox de la galerie

---

**Date de correction** : 26 novembre 2025
**Statut** : ✅ Résolu - Navigation blog/galerie opérationnelle
**Temps de résolution** : Immédiat
