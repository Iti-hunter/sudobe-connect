#!/bin/bash

# Script pour remplacer le bandeau cookies par le modal dans toutes les pages

MODAL_HTML='    <!-- ========== MODAL CONSENTEMENT COOKIES RGPD ========== -->
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
                Nous utilisons des cookies de mesure d'\''audience pour améliorer nos services.
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
    </div>'

FOOTER_LINKS='                    <p class="footer-copyright">
                        &copy; 2025 Sudobe Connect. Tous droits réservés.
                        <span class="footer-separator">·</span>
                        <a href="mentions-legales.html" class="footer-link">Mentions légales</a>
                        <span class="footer-separator">·</span>
                        <a href="#" id="manage-cookies-link" class="footer-link">Gérer mes cookies</a>
                    </p>'

for file in blog.html galerie.html article.html article-protection-seniors.html mentions-legales.html; do
  echo "Processing $file..."

  # Backup
  cp "$file" "${file}.bak"

  # Créer fichier temporaire avec Python pour manipulation complexe
  python3 << EOF
import re

with open('$file', 'r', encoding='utf-8') as f:
    content = f.read()

# Remplacer le modal cookies (entre <!-- ========== et </div> suivant cookie-consent-modal)
pattern = r'<!-- ========== .*?CONSENTEMENT COOKIES.*?========== -->.*?<div id="cookie-consent-modal".*?</div>\s*</div>'
replacement = '''$MODAL_HTML'''

content = re.sub(pattern, replacement, content, flags=re.DOTALL)

with open('$file', 'w', encoding='utf-8') as f:
    f.write(content)
EOF

  echo "  ✓ Modal updated in $file"
done

echo "✅ Done!"
