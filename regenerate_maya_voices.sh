#!/bin/bash

API_KEY="sk_f5b2c2781f37706b7538cff0e4a39227259212d14edefec7"
MODEL="eleven_multilingual_v2"

# Lily voice for Russian
RUSSIAN_VOICE="pFZP5JQG7iQjIQuC4Bku"

mkdir -p audio

echo "=== Regenerating Maya Sana (Toddler Voice) ==="
# For toddler: higher style (more expressive), lower stability (more variation)
curl -s "https://api.elevenlabs.io/v1/text-to-speech/$RUSSIAN_VOICE" \
    -H "xi-api-key: $API_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "text": "Где моя Саночка? Где моя Сана?",
        "model_id": "'"$MODEL"'",
        "voice_settings": {
            "stability": 0.25,
            "similarity_boost": 0.4,
            "style": 0.9,
            "use_speaker_boost": true
        }
    }' \
    --output "audio/maya_sana_ru.mp3"

if [ -s "audio/maya_sana_ru.mp3" ]; then
    echo "  ✓ maya_sana_ru.mp3"
    ls -la audio/maya_sana_ru.mp3
else
    echo "  ✗ Failed"
fi

sleep 1

echo ""
echo "=== Regenerating Maya Boosa (Old Russian Lady - Slower) ==="
# For old lady: high stability (calm), low style (less expressive), stretched text
curl -s "https://api.elevenlabs.io/v1/text-to-speech/$RUSSIAN_VOICE" \
    -H "xi-api-key: $API_KEY" \
    -H "Content-Type: application/json" \
    -d '{
        "text": "Ма-а-а-я бу-у-уся... Ма-а-а-я бу-у-уся...",
        "model_id": "'"$MODEL"'",
        "voice_settings": {
            "stability": 0.95,
            "similarity_boost": 0.95,
            "style": 0.1,
            "use_speaker_boost": false
        }
    }' \
    --output "audio/maya_boosa.mp3"

if [ -s "audio/maya_boosa.mp3" ]; then
    echo "  ✓ maya_boosa.mp3"
    ls -la audio/maya_boosa.mp3
else
    echo "  ✗ Failed"
fi

echo ""
echo "=== Done ==="
