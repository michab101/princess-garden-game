#!/bin/bash

API_KEY="sk_f5b2c2781f37706b7538cff0e4a39227259212d14edefec7"
MODEL="eleven_multilingual_v2"

# Voice IDs
RUSSIAN_VOICE="pFZP5JQG7iQjIQuC4Bku"  # Lily - for Russian
HEBREW_VOICE="jBpfuIE2acCO8z3wKNLl"   # Gigi - for Hebrew
CHARLOTTE_VOICE="XB0fDUnXU5powFXDhCwa" # Charlotte - warm, natural for instructions

mkdir -p audio

# Function for toddler voice (high pitch feel via settings)
generate_toddler() {
    local text="$1"
    local filename="$2"
    
    echo "Generating toddler voice: $filename"
    
    curl -s "https://api.elevenlabs.io/v1/text-to-speech/$RUSSIAN_VOICE" \
        -H "xi-api-key: $API_KEY" \
        -H "Content-Type: application/json" \
        -d "{
            \"text\": \"$text\",
            \"model_id\": \"$MODEL\",
            \"voice_settings\": {
                \"stability\": 0.3,
                \"similarity_boost\": 0.5,
                \"style\": 0.8,
                \"use_speaker_boost\": true
            }
        }" \
        --output "audio/$filename"
    
    if [ -s "audio/$filename" ]; then
        echo "  ✓ $filename"
    else
        echo "  ✗ Failed: $filename"
    fi
    sleep 0.5
}

# Function for slow old Russian lady voice
generate_old_lady() {
    local text="$1"
    local filename="$2"
    
    echo "Generating old lady voice: $filename"
    
    curl -s "https://api.elevenlabs.io/v1/text-to-speech/$RUSSIAN_VOICE" \
        -H "xi-api-key: $API_KEY" \
        -H "Content-Type: application/json" \
        -d "{
            \"text\": \"$text\",
            \"model_id\": \"$MODEL\",
            \"voice_settings\": {
                \"stability\": 0.85,
                \"similarity_boost\": 0.9,
                \"style\": 0.2,
                \"use_speaker_boost\": false
            }
        }" \
        --output "audio/$filename"
    
    if [ -s "audio/$filename" ]; then
        echo "  ✓ $filename"
    else
        echo "  ✗ Failed: $filename"
    fi
    sleep 0.5
}

# Function for natural warm voice
generate_natural() {
    local text="$1"
    local filename="$2"
    local voice="$3"
    
    echo "Generating natural voice: $filename"
    
    curl -s "https://api.elevenlabs.io/v1/text-to-speech/$voice" \
        -H "xi-api-key: $API_KEY" \
        -H "Content-Type: application/json" \
        -d "{
            \"text\": \"$text\",
            \"model_id\": \"$MODEL\",
            \"voice_settings\": {
                \"stability\": 0.7,
                \"similarity_boost\": 0.85,
                \"style\": 0.5,
                \"use_speaker_boost\": true
            }
        }" \
        --output "audio/$filename"
    
    if [ -s "audio/$filename" ]; then
        echo "  ✓ $filename"
    else
        echo "  ✗ Failed: $filename"
    fi
    sleep 0.5
}

echo "=== Generating Toddler Voice ==="
generate_toddler "Где моя Сана? Где моя Саночка?" "maya_sana_ru.mp3"

echo ""
echo "=== Generating Old Russian Lady Voice (Slower) ==="
generate_old_lady "Мааая бууся... Мааая бууся..." "maya_boosa.mp3"

echo ""
echo "=== Generating Natural Instructions ==="
generate_natural "Нажми на цветок, чтобы поймать мисс Пинки!" "instruction_ru.mp3" "$RUSSIAN_VOICE"
generate_natural "לחץ על הפרח כדי לתפוס את מיס פינקי!" "instruction_he.mp3" "$HEBREW_VOICE"
generate_natural "Молодец! Ты поймала мисс Пинки!" "win_ru.mp3" "$RUSSIAN_VOICE"
generate_natural "כל הכבוד! תפסת את מיס פינקי!" "win_he.mp3" "$HEBREW_VOICE"

echo ""
echo "=== Done ==="
ls -la audio/maya_sana_ru.mp3 audio/maya_boosa.mp3 audio/instruction_*.mp3 audio/win_*.mp3
