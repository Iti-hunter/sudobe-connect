# 📚 Guide d'utilisation - Blog et Galerie Sudobe Connect

## 📋 Vue d'ensemble

Votre site dispose maintenant de deux pages modernes, esthétiques et faciles à maintenir :
- **Blog** : Cartes d'articles triées automatiquement du plus récent au plus ancien
- **Galerie** : Grille d'images responsive avec lightbox

---

## 🎨 Page BLOG

### ✨ Fonctionnalités
- ✅ Grille responsive (3 colonnes desktop, 2 tablette, 1 mobile)
- ✅ Cartes modernes avec hover élégant
- ✅ Tri automatique par date (plus récent en premier)
- ✅ Catégories colorées (Cybersécurité, IA & Seniors, Deepfake, Inclusion numérique)
- ✅ Métadonnées : date, auteur, catégorie
- ✅ Design lisible pour seniors (50+) et B2B

### 📝 Comment ajouter un nouvel article

**C'est ultra simple ! Pas besoin de coder.**

1. **Ouvrez** `blog.html`
2. **Dupliquez** une carte d'article existante (tout le bloc `<article class="blog-card" data-date="...">...</article>`)
3. **Modifiez** les 8 éléments suivants :

```html
<article class="blog-card" data-date="2025-12-15">  <!-- ① DATE ISO -->
    <div class="blog-card-header">
        <span class="blog-category blog-category-cybersecurity">  <!-- ② CATÉGORIE -->
            Cybersécurité  <!-- ③ NOM CATÉGORIE -->
        </span>
    </div>
    <h3 class="blog-card-title">  <!-- ④ TITRE -->
        Votre nouveau titre ici
    </h3>
    <div class="blog-card-meta">
        <span class="blog-date">15 décembre 2025</span>  <!-- ⑤ DATE AFFICHÉE -->
        <span class="blog-separator">•</span>
        <span class="blog-author">par Votre Nom</span>  <!-- ⑥ AUTEUR -->
    </div>
    <p class="blog-card-excerpt">  <!-- ⑦ EXTRAIT -->
        Résumé de votre article en 1-2 phrases...
    </p>
    <a href="article-votre-slug.html" class="blog-card-link">  <!-- ⑧ LIEN -->
        Lire l'article
        <svg>...</svg>
    </a>
</article>
```

4. **Sauvegardez** → Le tri automatique s'occupe du reste !

### 🎨 Catégories disponibles

Changez la classe CSS pour changer la couleur :

| Catégorie | Classe CSS | Couleur |
|-----------|-----------|---------|
| Cybersécurité | `blog-category-cybersecurity` | Bleu marine |
| IA & Seniors | `blog-category-ia` | Turquoise |
| Deepfake | `blog-category-deepfake` | Orange |
| Inclusion numérique | `blog-category-inclusion` | Violet |

### 🔧 Tri automatique

**Comment ça marche ?**

Le script `js/blog-sort.js` :
1. Lit l'attribut `data-date` de chaque carte (format `YYYY-MM-DD`)
2. Trie les cartes du plus récent au plus ancien
3. Réorganise automatiquement au chargement de la page

**Vous n'avez RIEN à faire**, juste mettre la bonne date !

---

## 🖼️ Page GALERIE

### ✨ Fonctionnalités
- ✅ Grille responsive (3 colonnes desktop, 2 tablette, 1 mobile)
- ✅ Images avec effet zoom au hover
- ✅ Overlay avec légende au survol
- ✅ Lightbox plein écran au clic
- ✅ Fermeture lightbox : bouton X, clic extérieur, touche Échap
- ✅ Design moderne et premium

### 📸 Comment ajouter une nouvelle image

**Encore plus simple que le blog !**

1. **Ouvrez** `galerie.html`
2. **Dupliquez** un bloc `.gallery-item` :

```html
<div class="gallery-item">
    <img src="chemin/vers/votre/image.jpg"  <!-- ① CHEMIN IMAGE -->
         alt="Description de l'image"  <!-- ② DESCRIPTION ACCESSIBILITÉ -->
         class="gallery-img"
         loading="lazy">
    <div class="gallery-overlay">
        <p class="gallery-caption">Légende de votre image</p>  <!-- ③ LÉGENDE -->
    </div>
</div>
```

3. **Modifiez** :
   - ① **src** : Chemin vers votre image (local ou URL)
   - ② **alt** : Description pour l'accessibilité
   - ③ **Légende** : Texte qui s'affiche au hover et dans la lightbox

4. **Sauvegardez** → La lightbox fonctionne automatiquement !

### 📐 Format des images recommandé

- **Ratio** : 4:3 (ex: 800x600, 1200x900)
- **Poids** : < 300 KB par image (optimisez avec [TinyPNG](https://tinypng.com))
- **Format** : JPG (photos), PNG (logos/illustrations)

### 💡 Images de démonstration

Actuellement, le site utilise des images Unsplash pour la démo.
**Remplacez-les** par vos vraies photos d'ateliers !

---

## 🎨 Personnalisation CSS

### Changer les couleurs des catégories

Dans `css/style.css`, cherchez :

```css
.blog-category-cybersecurity {
    background: rgba(26, 58, 82, 0.1);
    color: var(--color-primary);
}
```

Modifiez les valeurs `background` et `color`.

### Changer l'espacement des cartes

```css
.blog-list {
    gap: 2rem; /* Espace entre les cartes */
}

.gallery-grid {
    gap: 1.5rem; /* Espace entre les images */
}
```

### Changer le nombre de colonnes

```css
.blog-list {
    grid-template-columns: repeat(3, 1fr); /* 3 colonnes desktop */
}

@media (max-width: 1024px) {
    .blog-list {
        grid-template-columns: repeat(2, 1fr); /* 2 colonnes tablette */
    }
}
```

---

## 📱 Responsive

### Points de rupture
- **Desktop** : > 1024px → 3 colonnes (blog) / 3 colonnes (galerie)
- **Tablette** : 640px - 1024px → 2 colonnes
- **Mobile** : < 640px → 1 colonne

### Test responsive
Utilisez les DevTools du navigateur (F12) → Mode responsive

---

## 🚀 Fichiers créés/modifiés

### Nouveaux fichiers JavaScript
```
js/blog-sort.js         → Tri automatique des articles
js/gallery-lightbox.js  → Lightbox pour la galerie
```

### Fichiers HTML
```
blog.html     → Page blog avec 6 articles d'exemple
galerie.html  → Page galerie avec 9 images d'exemple
```

### Fichiers CSS
```
css/style.css  → Ajout de ~350 lignes de CSS pour blog + galerie
```

---

## ✅ Checklist avant publication

### Blog
- [ ] Remplacer les articles d'exemple par vos vrais articles
- [ ] Vérifier les dates (format ISO dans `data-date`)
- [ ] Vérifier les liens `href` vers les pages d'articles
- [ ] Tester le tri automatique (changer l'ordre des cartes dans le HTML)
- [ ] Vérifier la lisibilité sur mobile

### Galerie
- [ ] Remplacer les images Unsplash par vos vraies photos
- [ ] Optimiser le poids des images (< 300 KB)
- [ ] Vérifier les attributs `alt` pour l'accessibilité
- [ ] Tester la lightbox (clic, fermeture, Échap)
- [ ] Vérifier l'affichage sur mobile

---

## 🐛 Dépannage

### Le tri ne fonctionne pas
1. Vérifiez que `js/blog-sort.js` est bien chargé dans `blog.html`
2. Ouvrez la console (F12) et cherchez les erreurs
3. Vérifiez que chaque carte a bien un attribut `data-date` au format `YYYY-MM-DD`

### La lightbox ne s'ouvre pas
1. Vérifiez que `js/gallery-lightbox.js` est bien chargé dans `galerie.html`
2. Vérifiez que chaque image a bien la classe `gallery-img`
3. Ouvrez la console (F12) et cherchez les erreurs

### Les images ne s'affichent pas
1. Vérifiez le chemin dans l'attribut `src`
2. Vérifiez que les images existent dans le dossier spécifié
3. Vérifiez les permissions d'accès aux fichiers

---

## 📞 Support

Pour toute question ou problème :
1. Vérifiez ce guide
2. Consultez la console du navigateur (F12)
3. Vérifiez que vous n'avez pas modifié accidentellement les classes CSS ou les IDs

---

## 🎉 Bon à savoir

### Maintenance zéro code
- **Ajouter un article** : Dupliquer + modifier 8 champs → Fini !
- **Ajouter une image** : Dupliquer + modifier 3 champs → Fini !

### Performance
- Images en `loading="lazy"` → Chargement progressif
- CSS optimisé → Pas de framework lourd
- JavaScript vanilla → Rapide et léger

### Accessibilité
- Attributs `alt` sur toutes les images
- Navigation clavier (lightbox fermable avec Échap)
- Contrastes optimisés pour seniors
- Structure HTML sémantique

### SEO
- Balises meta dans `<head>`
- Attributs `alt` descriptifs
- Structure H1 > H2 > H3 respectée
- URLs propres pour les articles

---

**Fait avec soin pour Sudobe Connect** ❤️
*L'inclusion numérique bienveillante pour les seniors*
