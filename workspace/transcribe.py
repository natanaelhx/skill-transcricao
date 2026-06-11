#!/usr/bin/env python3
import argparse
import sys
from pathlib import Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Transcreve audio local com faster-whisper.")
    parser.add_argument("--model", default="tiny", help="Modelo faster-whisper, ex: tiny, base, small.")
    parser.add_argument("--language", default="pt", help="Idioma, ex: pt, en, es, auto.")
    parser.add_argument("--beam-size", type=int, default=5, help="Beam size do Whisper.")
    parser.add_argument("media_path", help="Caminho local do arquivo de audio.")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    media_path = Path(args.media_path)

    if not media_path.exists():
        print(f"audio file not found: {media_path}", file=sys.stderr)
        return 2
    if not media_path.is_file():
        print(f"audio path is not a file: {media_path}", file=sys.stderr)
        return 2

    from faster_whisper import WhisperModel

    language = None if args.language.lower() == "auto" else args.language
    model = WhisperModel(args.model, device="cpu", compute_type="int8")
    segments, _info = model.transcribe(
        str(media_path),
        language=language,
        beam_size=args.beam_size,
        vad_filter=True,
    )

    text = " ".join(segment.text.strip() for segment in segments if segment.text and segment.text.strip()).strip()
    if text:
        print(text)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
