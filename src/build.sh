#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
OUT="$SCRIPT_DIR/../run"
cd "$SCRIPT_DIR"

log() {
    printf '[\033[%sm%-10s\033[0m] %-30s\n' "$1" "$2" "$3"
}

mkdir -p "$OUT"

for file in *; do
    [ -f "$file" ] || continue
    [ "$file" = "build.sh" ] && continue

    case "$file" in
        *.c)
            log 33 "Building" "$file"
            cc "$file" -o "$OUT/$file"
            log 32 "Built" "$file"
            ;;

        *.cpp)
            log 33 "Building" "$file"
            c++ "$file" -o "$OUT/$file"
            log 32 "Built" "$file"
            ;;

        *.rs)
            log 33 "Building" "$file"
            rustc "$file" -o "$OUT/$file"
            log 32 "Built" "$file"
            ;;

        *.go)
            log 33 "Building" "$file"
            go build -o "$OUT/$file" "$file"
            log 32 "Built" "$file"
            ;;

        *.py)
            log 33 "Linkinging" "$file"
            printf '%s\n' \
                '#!/bin/sh' \
                'exec python3 "$(dirname "$0")/../src/'"$file"'" "$@"' \
                > "$OUT/$file"
            chmod +x "$OUT/$file"
            log 32 "Linked" "$file"
            ;;

        *.sh)
            log 33 "Linking" "$file"
            printf '%s\n' \
                '#!/bin/sh' \
                'exec sh "$(dirname "$0")/../src/'"$file"'" "$@"' \
                > "$OUT/$file"
            chmod +x "$OUT/$file"
            log 32 "Linked" "$file"
            ;;

        *.js)
            log 33 "Linking" "$file"
            printf '%s\n' \
                '#!/bin/sh' \
                'exec node "$(dirname "$0")/../src/'"$file"'" "$@"' \
                > "$OUT/$file"
            chmod +x "$OUT/$file"
            log 32 "Linked" "$file"
            ;;

        *)
            log 90 "Skipping" "$file"
            ;;
    esac
done
