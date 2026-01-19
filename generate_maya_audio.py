import requests
import subprocess
import os

ELEVENLABS_API_KEY = os.environ.get('ELEVENLABS_API_KEY')

# Use Lily voice for Russian (already used in the project)
LILY_VOICE_ID = "pFZP5JQG7iQjIQuC4Bku"

# For adult female voice, try Charlotte (British) or Rachel (American)
RACHEL_VOICE_ID = "21m00Tcm4TlvDq8ikWAM"

def generate_elevenlabs(text, voice_id, filename):
    """Generate audio using ElevenLabs TTS"""
    url = f"https://api.elevenlabs.io/v1/text-to-speech/{voice_id}"
    headers = {
        "xi-api-key": ELEVENLABS_API_KEY,
        "Content-Type": "application/json"
    }
    data = {
        "text": text,
        "model_id": "eleven_multilingual_v2",
        "voice_settings": {
            "stability": 0.5,
            "similarity_boost": 0.75
        }
    }
    
    response = requests.post(url, json=data, headers=headers)
    if response.status_code == 200:
        with open(f"audio/{filename}", "wb") as f:
            f.write(response.content)
        print(f"  ✓ {filename}")
        return True
    else:
        print(f"  ✗ {filename}: {response.status_code} - {response.text}")
        return False

def generate_edge_tts(text, filename):
    """Generate Hebrew audio using Edge TTS"""
    cmd = f'edge-tts --voice "he-IL-HilaNeural" --text "{text}" --write-media "audio/{filename}"'
    result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
    if result.returncode == 0:
        print(f"  ✓ {filename}")
        return True
    else:
        print(f"  ✗ {filename}: {result.stderr}")
        return False

print("=== Generating Maya Audio Files ===")

# 1. Russian: "Where is my Santa?" - "Где моя Санта?"
print("\n1. Generating 'Where is my Santa?' in Russian...")
generate_elevenlabs("Где моя Санта?", LILY_VOICE_ID, "maya_santa_ru.mp3")

# 2. Hebrew: "Where is my Santa?" - "?איפה סנטה שלי"
print("\n2. Generating 'Where is my Santa?' in Hebrew...")
generate_edge_tts("איפה סנטה שלי?", "maya_santa_he.mp3")

# 3. Adult female voice: "maya boosa maya boosa"
print("\n3. Generating 'maya boosa maya boosa' with adult female voice...")
generate_elevenlabs("maya boosa maya boosa", RACHEL_VOICE_ID, "maya_boosa.mp3")

print("\n=== Done ===")
