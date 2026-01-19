#!/bin/bash

API_KEY="sk_f5b2c2781f37706b7538cff0e4a39227259212d14edefec7"
MODEL="eleven_multilingual_v2"

# Voice IDs - using different voices for each language
RUSSIAN_VOICE="pFZP5JQG7iQjIQuC4Bku"  # Lily - good for Russian
HEBREW_VOICE="jBpfuIE2acCO8z3wKNLl"   # Gigi - good for Hebrew
ENGLISH_VOICE="21m00Tcm4TlvDq8ikWAM"  # Rachel - for instructions

mkdir -p audio

generate() {
    local text="$1"
    local filename="$2"
    local voice="$3"

    echo "Generating: $filename"

    curl -s "https://api.elevenlabs.io/v1/text-to-speech/$voice" \
        -H "xi-api-key: $API_KEY" \
        -H "Content-Type: application/json" \
        -d "{
            \"text\": \"$text\",
            \"model_id\": \"$MODEL\",
            \"voice_settings\": {
                \"stability\": 0.65,
                \"similarity_boost\": 0.8,
                \"style\": 0.4
            }
        }" \
        --output "audio/$filename"

    if [ -s "audio/$filename" ]; then
        echo "  ✓ $filename"
    else
        echo "  ✗ Failed: $filename"
    fi

    # Small delay to avoid rate limiting
    sleep 0.3
}

echo "=== Generating Russian Words ==="
generate "цветок" "flower_ru.mp3" "$RUSSIAN_VOICE"
generate "солнце" "sun_ru.mp3" "$RUSSIAN_VOICE"
generate "облако" "cloud_ru.mp3" "$RUSSIAN_VOICE"
generate "дождь" "rain_ru.mp3" "$RUSSIAN_VOICE"
generate "дерево" "tree_ru.mp3" "$RUSSIAN_VOICE"
generate "пруд" "pond_ru.mp3" "$RUSSIAN_VOICE"
generate "рыба" "fish_ru.mp3" "$RUSSIAN_VOICE"
generate "замок" "castle_ru.mp3" "$RUSSIAN_VOICE"
generate "небо" "sky_ru.mp3" "$RUSSIAN_VOICE"
generate "трава" "grass_ru.mp3" "$RUSSIAN_VOICE"

echo ""
echo "=== Generating Russian Animals ==="
generate "папа лошадка" "papa_horse_ru.mp3" "$RUSSIAN_VOICE"
generate "слон" "elephant_ru.mp3" "$RUSSIAN_VOICE"
generate "лев" "lion_ru.mp3" "$RUSSIAN_VOICE"
generate "медведь" "bear_ru.mp3" "$RUSSIAN_VOICE"
generate "жираф" "giraffe_ru.mp3" "$RUSSIAN_VOICE"
generate "зебра" "zebra_ru.mp3" "$RUSSIAN_VOICE"
generate "корова" "cow_ru.mp3" "$RUSSIAN_VOICE"
generate "свинья" "pig_ru.mp3" "$RUSSIAN_VOICE"
generate "овечка" "sheep_ru.mp3" "$RUSSIAN_VOICE"
generate "козочка" "goat_ru.mp3" "$RUSSIAN_VOICE"
generate "олень" "deer_ru.mp3" "$RUSSIAN_VOICE"
generate "верблюд" "camel_ru.mp3" "$RUSSIAN_VOICE"
generate "кенгуру" "kangaroo_ru.mp3" "$RUSSIAN_VOICE"
generate "крокодил" "crocodile_ru.mp3" "$RUSSIAN_VOICE"
generate "бегемот" "hippo_ru.mp3" "$RUSSIAN_VOICE"
generate "носорог" "rhino_ru.mp3" "$RUSSIAN_VOICE"
generate "тигр" "tiger_ru.mp3" "$RUSSIAN_VOICE"
generate "леопард" "leopard_ru.mp3" "$RUSSIAN_VOICE"
generate "собачка" "dog_ru.mp3" "$RUSSIAN_VOICE"
generate "кошечка" "cat_ru.mp3" "$RUSSIAN_VOICE"
generate "зайчик" "rabbit_ru.mp3" "$RUSSIAN_VOICE"
generate "лисичка" "fox_ru.mp3" "$RUSSIAN_VOICE"
generate "белочка" "squirrel_ru.mp3" "$RUSSIAN_VOICE"

echo ""
echo "=== Generating Hebrew Words ==="
generate "פֶּרַח" "flower_he.mp3" "$HEBREW_VOICE"
generate "שֶׁמֶשׁ" "sun_he.mp3" "$HEBREW_VOICE"
generate "עָנָן" "cloud_he.mp3" "$HEBREW_VOICE"
generate "גֶּשֶׁם" "rain_he.mp3" "$HEBREW_VOICE"
generate "עֵץ" "tree_he.mp3" "$HEBREW_VOICE"
generate "בְּרֵכָה" "pond_he.mp3" "$HEBREW_VOICE"
generate "דָּג" "fish_he.mp3" "$HEBREW_VOICE"
generate "טִירָה" "castle_he.mp3" "$HEBREW_VOICE"
generate "שָׁמַיִם" "sky_he.mp3" "$HEBREW_VOICE"
generate "דֶּשֶׁא" "grass_he.mp3" "$HEBREW_VOICE"

echo ""
echo "=== Generating Hebrew Animals ==="
generate "אַבָּא סוּס" "papa_horse_he.mp3" "$HEBREW_VOICE"
generate "פִּיל" "elephant_he.mp3" "$HEBREW_VOICE"
generate "אַרְיֵה" "lion_he.mp3" "$HEBREW_VOICE"
generate "דֹּב" "bear_he.mp3" "$HEBREW_VOICE"
generate "ג׳ִירָפָה" "giraffe_he.mp3" "$HEBREW_VOICE"
generate "זֶבְרָה" "zebra_he.mp3" "$HEBREW_VOICE"
generate "פָּרָה" "cow_he.mp3" "$HEBREW_VOICE"
generate "חֲזִיר" "pig_he.mp3" "$HEBREW_VOICE"
generate "כֶּבֶשׂ" "sheep_he.mp3" "$HEBREW_VOICE"
generate "עֵז" "goat_he.mp3" "$HEBREW_VOICE"
generate "אַיָּל" "deer_he.mp3" "$HEBREW_VOICE"
generate "גָּמָל" "camel_he.mp3" "$HEBREW_VOICE"
generate "קֶנְגּוּרוּ" "kangaroo_he.mp3" "$HEBREW_VOICE"
generate "תַּנִּין" "crocodile_he.mp3" "$HEBREW_VOICE"
generate "הִיפּוֹפּוֹטָם" "hippo_he.mp3" "$HEBREW_VOICE"
generate "קַרְנַף" "rhino_he.mp3" "$HEBREW_VOICE"
generate "נָמֵר" "tiger_he.mp3" "$HEBREW_VOICE"
generate "בַּרְדְּלָס" "leopard_he.mp3" "$HEBREW_VOICE"
generate "כֶּלֶב" "dog_he.mp3" "$HEBREW_VOICE"
generate "חָתוּל" "cat_he.mp3" "$HEBREW_VOICE"
generate "אַרְנָב" "rabbit_he.mp3" "$HEBREW_VOICE"
generate "שׁוּעָל" "fox_he.mp3" "$HEBREW_VOICE"
generate "סְנָאִי" "squirrel_he.mp3" "$HEBREW_VOICE"

echo ""
echo "=== Generating Animal Sounds ==="
generate "Neigh! Neigh!" "horse_sound.mp3" "$ENGLISH_VOICE"
generate "Pawoo! Pawoo!" "elephant_sound.mp3" "$ENGLISH_VOICE"
generate "Roar!" "lion_sound.mp3" "$ENGLISH_VOICE"
generate "Grrrr!" "bear_sound.mp3" "$ENGLISH_VOICE"
generate "Moo! Moo!" "cow_sound.mp3" "$ENGLISH_VOICE"
generate "Oink oink!" "pig_sound.mp3" "$ENGLISH_VOICE"
generate "Baa! Baa!" "sheep_sound.mp3" "$ENGLISH_VOICE"
generate "Meh! Meh!" "goat_sound.mp3" "$ENGLISH_VOICE"
generate "Woof woof!" "dog_sound.mp3" "$ENGLISH_VOICE"
generate "Meow! Meow!" "cat_sound.mp3" "$ENGLISH_VOICE"

echo ""
echo "=== Generating Instructions ==="
generate "Нажми на цветок, чтобы поймать мисс Пинки!" "instruction_ru.mp3" "$RUSSIAN_VOICE"
generate "לחץ על הפרח כדי לתפוס את מיס פינקי!" "instruction_he.mp3" "$HEBREW_VOICE"
generate "Молодец! Ты поймал мисс Пинки!" "win_ru.mp3" "$RUSSIAN_VOICE"
generate "כל הכבוד! תפסת את מיס פינקי!" "win_he.mp3" "$HEBREW_VOICE"
generate "Где мои девочки? Время для мороженого!" "papa_icecream_ru.mp3" "$RUSSIAN_VOICE"
generate "גְּלִידָה" "icecream_he.mp3" "$HEBREW_VOICE"

echo ""
echo "=== Done! ==="
ls -la audio/ | head -20
echo "..."
echo "Total files: $(ls audio/*.mp3 | wc -l)"
