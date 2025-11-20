#!/bin/bash

# Nom de l'interface WireGuard (ex: wg0)
WG_INTERFACE="wg0"

# Seuil en secondes (ex: 500)
MAX_AGE=500

# Obtenir l'âge du dernier handshake (en secondes)
latest_handshake=$(wg show "$WG_INTERFACE" latest-handshakes | awk '{print $2}')

# Vérification si l'interface retourne une valeur
if [[ -z "$latest_handshake" ]]; then
    echo "Erreur : Impossible de récupérer le handshake de l'interface $WG_INTERFACE."
    exit 1
fi

# Si le handshake vaut 0, ça veut dire qu’il n’y a pas eu de handshake (encore ou plus du tout)
if [[ "$latest_handshake" -eq 0 ]]; then
    echo "Aucun handshake détecté, redémarrage de l'interface $WG_INTERFACE..."
    systemctl restart "wg-quick@$WG_INTERFACE"
    exit 0
fi

# Calcul de l'âge du dernier handshake
now=$(date +%s)
age=$(( now - latest_handshake ))

echo "Dernier handshake il y a $age secondes."

# Redémarrage si plus vieux que MAX_AGE
if (( age > MAX_AGE )); then
    echo "Le handshake est trop vieux (> ${MAX_AGE}s), redémarrage de l'interface $WG_INTERFACE..."
    systemctl restart "wg-quick@$WG_INTERFACE"
else
    echo "Connexion WireGuard OK."
fi

