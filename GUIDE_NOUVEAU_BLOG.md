# 📚 Guide complet - Nouveau Blog Sudobe Connect

## ✅ Ce qui a été livré

J'ai recréé votre blog en reprenant le design professionnel de votre ancienne version :

### 1️⃣ Page liste Blog ([blog.html](blog.html))
- ✅ Design avec **grandes images** en haut de chaque carte
- ✅ Structure : Image → Meta (date + auteur + badge catégorie) → Titre → Extrait → Lien "Lire la suite"
- ✅ Grille **3 colonnes** desktop, 2 tablette, 1 mobile
- ✅ **6 articles d'exemple** avec contenu cohérent
- ✅ **Tri automatique** par date (du plus récent au plus ancien)

### 2️⃣ Template page Article ([article-arnaque-conseiller-bancaire.html](article-arnaque-conseiller-bancaire.html))
- ✅ Lien "← Retour au blog"
- ✅ Meta (date + auteur + badge catégorie)
- ✅ Grand titre + introduction
- ✅ Grande image featured
- ✅ Corps de l'article structuré (H2, H3, paragraphes, listes, encarts)
- ✅ **Sidebar à droite** avec :
  - Articles récents
  - Catégories
  - Encart CTA "Besoin d'une formation ?"

### 3️⃣ CSS mis à jour ([css/style.css](css/style.css))
- ✅ +630 lignes de CSS moderne pour blog + articles
- ✅ Design cohérent avec votre charte (bleu marine, turquoise, orange)
- ✅ 100% responsive
- ✅ Typographie lisible pour seniors

### 4️⃣ JavaScript ([js/blog-sort.js](js/blog-sort.js))
- ✅ Tri automatique mis à jour pour fonctionner avec la nouvelle structure

---

## 📝 Comment ajouter un nouvel article

### Étape 1 : Ajouter la carte dans blog.html

1. **Ouvrez** `blog.html`
2. **Dupliquez** un bloc `<article class="blog-card">...</article>` (lignes 113-140 par exemple)
3. **Modifiez** 9 champs :

```html
<!-- Article X -->
<article class="blog-card" data-date="2025-12-15">  <!-- ① DATE ISO -->
    <a href="article-votre-slug.html" class="blog-card-image-link">  <!-- ② LIEN PAGE -->
        <img src="chemin/vers/votre-image.jpg"  <!-- ③ IMAGE -->
             alt="Description de l'image"  <!-- ④ ALT IMAGE -->
             class="blog-card-image">
    </a>
    <div class="blog-card-content">
        <div class="blog-card-meta">
            <span class="blog-card-date">15 décembre 2025</span>  <!-- ⑤ DATE AFFICHÉE -->
            <span class="blog-meta-separator">·</span>
            <span class="blog-card-author">par Votre Nom</span>  <!-- ⑥ AUTEUR -->
            <span class="blog-meta-separator">·</span>
            <span class="blog-card-badge blog-badge-cybersecurity">CYBERSÉCURITÉ</span>  <!-- ⑦ CATÉGORIE -->
        </div>
        <h3 class="blog-card-title">
            <a href="article-votre-slug.html">  <!-- ⑧ LIEN PAGE (répété) -->
                Titre de votre article ici
            </a>
        </h3>
        <p class="blog-card-excerpt">
            Résumé de votre article en 1-2 phrases...  <!-- ⑨ EXTRAIT -->
        </p>
        <a href="article-votre-slug.html" class="blog-card-readmore">
            Lire la suite →
        </a>
    </div>
</article>
```

4. **Sauvegardez** → Le tri automatique classe les articles du plus récent au plus ancien !

### Étape 2 : Créer la page article complète

1. **Dupliquez** le fichier `article-arnaque-conseiller-bancaire.html`
2. **Renommez-le** avec le même slug que dans l'étape 1 (ex: `article-votre-slug.html`)
3. **Modifiez** le contenu :

#### Dans le `<head>` :
```html
<meta name="description" content="Votre description...">
<meta name="keywords" content="vos, mots, clés">
<title>Titre de votre article - Sudobe Connect</title>
```

#### Dans l'article :
- **Ligne 103** : Date affichée
- **Ligne 105** : Auteur
- **Ligne 107** : Badge catégorie
- **Ligne 110** : Titre H1
- **Lignes 111-114** : Paragraphe d'introduction
- **Ligne 119** : URL image + alt
- **Lignes 128+** : Corps de l'article (H2, H3, paragraphes, listes...)

#### Dans la sidebar :
- **Lignes 249-263** : Mettre à jour les 3 articles récents
- **Lignes 269-274** : Ajuster les catégories si besoin
- **Ligne 284** : Vérifier le lien CTA

4. **Sauvegardez** → Votre article est prêt !

---

## 🎨 Catégories disponibles

Changez la classe CSS du badge pour changer la couleur :

| Catégorie | Classe CSS | Couleur |
|-----------|-----------|---------|
| Cybersécurité | `blog-badge-cybersecurity` ou `article-badge-cybersecurity` | Bleu marine |
| IA & Seniors | `blog-badge-ia` ou `article-badge-ia` | Turquoise |
| Deepfake | `blog-badge-deepfake` ou `article-badge-deepfake` | Orange |
| Inclusion numérique | `blog-badge-inclusion` ou `article-badge-inclusion` | Violet |

---

## 📐 Format des images recommandé

### Pour les cartes blog (vignettes)
- **Ratio** : 16:10 (recommandé : 800x500 px)
- **Poids** : < 150 KB
- **Format** : JPG (optimisé)

### Pour les images featured dans les articles
- **Ratio** : 2:1 (recommandé : 1200x600 px)
- **Poids** : < 300 KB
- **Format** : JPG (optimisé)

**Outil recommandé** : [TinyPNG](https://tinypng.com) pour l'optimisation

---

## 🔧 Tri automatique

### Comment ça marche ?

Le script [js/blog-sort.js](js/blog-sort.js) :
1. Lit l'attribut `data-date` de chaque carte (format `YYYY-MM-DD`)
2. Trie les cartes du plus récent au plus ancien
3. Réorganise automatiquement au chargement de la page

**Vous n'avez RIEN à faire**, juste mettre la bonne date dans `data-date` !

### Exemple
```html
<!-- Cet article sera affiché en 2ème position -->
<article class="blog-card" data-date="2025-11-28">
  ...
</article>

<!-- Cet article sera affiché en 1er position (plus récent) -->
<article class="blog-card" data-date="2025-12-05">
  ...
</article>
```

---

## 📱 Responsive

### Points de rupture
| Écran | Blog (grille) | Article (layout) |
|-------|---------------|------------------|
| Desktop (>1024px) | 3 colonnes | 2 colonnes (article + sidebar) |
| Tablette (640-1024px) | 2 colonnes | 1 colonne (sidebar en dessous) |
| Mobile (<640px) | 1 colonne | 1 colonne |

**Tout est automatique** - pas de configuration nécessaire !

---

## 🎨 Structure de la page article

### Layout
```
┌─────────────────────────────────────────┐
│ Lien "← Retour au blog"                │
├─────────────────────────────────────────┤
│ Meta (date · auteur · catégorie)       │
├─────────────────────────────────────────┤
│ Titre H1                                │
├─────────────────────────────────────────┤
│ Paragraphe d'introduction               │
├─────────────────────────────────────────┤
│ Grande image featured                   │
├──────────────────────┬──────────────────┤
│ Corps de l'article   │  SIDEBAR         │
│                      │  ┌──────────────┐│
│ H2                   │  │ Articles     ││
│ Paragraphe           │  │ récents      ││
│                      │  └──────────────┘│
│ H3                   │  ┌──────────────┐│
│ Paragraphe           │  │ Catégories   ││
│                      │  └──────────────┘│
│ Liste                │  ┌──────────────┐│
│                      │  │ CTA          ││
│ Encart mis en avant  │  │ Formation    ││
│                      │  └──────────────┘│
│ Tags                 │                  │
└──────────────────────┴──────────────────┘
```

### Éléments disponibles dans le corps

#### Titres
```html
<h2>Titre de niveau 2</h2>
<h3>Titre de niveau 3</h3>
```

#### Paragraphes
```html
<p>Votre texte ici...</p>
<p><strong>Texte en gras</strong></p>
```

#### Listes
```html
<ul>
    <li>Élément 1</li>
    <li>Élément 2</li>
</ul>

<ol>
    <li>Étape 1</li>
    <li>Étape 2</li>
</ol>
```

#### Encart mis en valeur
```html
<div class="article-callout">
    <h3>Titre de l'encart</h3>
    <p>Texte important à mettre en valeur...</p>
</div>
```

---

## ✅ Checklist avant publication

### Blog
- [ ] Les 6 articles d'exemple sont remplacés par vos vrais articles
- [ ] Toutes les images sont optimisées (< 150 KB)
- [ ] Les attributs `data-date` sont corrects (format YYYY-MM-DD)
- [ ] Les liens `href` pointent vers les bonnes pages d'articles
- [ ] Le tri automatique fonctionne correctement

### Articles
- [ ] Chaque article a sa propre page HTML
- [ ] Les méta (title, description, keywords) sont renseignées
- [ ] L'image featured est optimisée (< 300 KB)
- [ ] Le contenu est structuré avec H2/H3
- [ ] La sidebar est à jour (articles récents, catégories)
- [ ] Le lien "Retour au blog" fonctionne

---

## 📊 Statistiques de la livraison

| Métrique | Valeur |
|----------|--------|
| HTML blog.html | 377 lignes |
| HTML article (template) | 461 lignes |
| CSS ajouté | +630 lignes |
| JS blog-sort.js | ~80 lignes |
| Articles d'exemple | 6 sur blog, 1 page complète |
| Temps d'ajout article | 5 min (avec page) |

---

## 🐛 Dépannage

### Le tri ne fonctionne pas
1. Vérifiez que `js/blog-sort.js` est bien chargé dans `blog.html` (ligne 376)
2. Ouvrez la console (F12) et cherchez les erreurs
3. Vérifiez que chaque carte a bien un attribut `data-date` au format `YYYY-MM-DD`
4. Vérifiez que le conteneur s'appelle bien `.blog-grid` (ligne 110)

### Les images ne s'affichent pas
1. Vérifiez le chemin dans l'attribut `src`
2. Vérifiez que les images existent dans le dossier spécifié
3. Pour les images Unsplash (temporaires), vérifiez votre connexion internet

### La sidebar ne s'affiche pas à droite
1. C'est normal sur tablette/mobile (elle passe en dessous)
2. Sur desktop, vérifiez que le CSS est bien chargé
3. Ouvrez les DevTools et vérifiez `.article-layout` a `grid-template-columns: 1fr 350px`

---

## 🎯 Prochaines étapes

### À court terme
1. **Remplacer les contenus d'exemple** :
   - [ ] Les 6 articles sur blog.html par vos vrais articles
   - [ ] Les images Unsplash par vos vraies photos
   - [ ] La page article d'exemple par vos vrais contenus

2. **Créer les pages articles** :
   - [ ] article-chatgpt-seniors.html
   - [ ] article-deepfake-arnaques.html
   - [ ] article-atelier-ehpad-tournesols.html
   - [ ] article-phishing-reflexes.html
   - [ ] article-ia-bonnes-pratiques.html

### À moyen terme
3. **Enrichir le contenu** :
   - [ ] Ajouter de nouveaux articles régulièrement
   - [ ] Mettre à jour la sidebar "Articles récents" quand vous ajoutez du contenu
   - [ ] Ajuster les compteurs de catégories dans la sidebar

---

## 📂 Fichiers modifiés/créés

### Fichiers HTML
```
✅ blog.html (377 lignes) - MODIFIÉ
✅ article-arnaque-conseiller-bancaire.html (461 lignes) - CRÉÉ
```

### Fichiers CSS
```
✅ css/style.css (+630 lignes) - MODIFIÉ
```

### Fichiers JavaScript
```
✅ js/blog-sort.js (80 lignes) - MODIFIÉ
```

### Documentation
```
✅ GUIDE_NOUVEAU_BLOG.md - CRÉÉ
```

---

## 🎨 Design et accessibilité

### Palette de couleurs
- **Bleu marine** : `var(--color-primary)` - Cybersécurité
- **Turquoise** : `var(--color-secondary)` - IA & Seniors
- **Orange** : `var(--color-accent)` - Deepfake
- **Violet** : `#6366f1` - Inclusion numérique

### Typographie
- **Titres** : Poppins (600-700)
- **Corps** : Inter (400-600)
- **Taille minimum** : 16px (1rem) pour lisibilité seniors

### Accessibilité
- ✅ Attributs `alt` sur toutes les images
- ✅ Structure HTML sémantique (article, header, footer, aside)
- ✅ Contrastes texte/fond conformes WCAG
- ✅ Navigation clavier possible
- ✅ Responsive complet

---

## 💡 Conseils d'utilisation

### Pour les images
- Utilisez des photos **authentiques** de vos ateliers plutôt que des images de stock
- Privilégiez des images **horizontales** (ratio 16:10 ou 2:1)
- **Optimisez** systématiquement avec TinyPNG avant upload
- Nommez vos fichiers clairement (`atelier-ehpad-tournesols.jpg`)

### Pour le contenu
- Écrivez des titres **clairs et descriptifs** (pas de titres "clickbait")
- Gardez les paragraphes **courts** (4-5 lignes max) pour la lisibilité
- Utilisez des **listes** pour structurer l'information
- Ajoutez des **encarts** pour mettre en valeur les points importants
- Intégrez des **mots-clés** naturellement pour le SEO

### Pour la maintenance
- Ajoutez un **nouvel article par semaine** minimum pour garder le blog actif
- Mettez à jour la sidebar "**Articles récents**" quand vous publiez
- Archivez les **vieux articles** après 6-12 mois si nécessaire
- Suivez les **analytics** pour voir quels articles fonctionnent le mieux

---

**Développé avec soin pour Sudobe Connect** ❤️
*L'inclusion numérique bienveillante pour les seniors*

---

*Date de livraison : 5 décembre 2025*
*Version : 2.0 (nouveau design avec images)*
