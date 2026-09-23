#!/bin/sh
set -eu

OUT="../run"
mkdir -p "$OUT"

for file in *; do
    [ -f "$file" ] || continue
    [ "$file" = "build.sh" ] && continue

    case "$file" in
        *.c)
            cc "$file" -o "$OUT/$file"
            ;;

        *.cpp)
            c++ "$file" -o "$OUT/$file"
            ;;

        *.rs)
            rustc "$file" -o "$OUT/$file"
            ;;

        *.py)
            printf '%s\n' \
                '#!/bin/sh' \
                'exec python3 "$(dirname "$0")/../src/'"$file"'" "$@"' \
                > "$OUT/$file"
            chmod +x "$OUT/$file"
            ;;

        *.sh)
            printf '%s\n' \
                '#!/bin/sh' \
                'exec sh "$(dirname "$0")/../src/'"$file"'" "$@"' \
                > "$OUT/$file"
            chmod +x "$OUT/$file"
            ;;

        *.js)
            printf '%s\n' \
                '#!/bin/sh' \
                'exec node "$(dirname "$0")/../src/'"$file"'" "$@"' \
                > "$OUT/$file"
            chmod +x "$OUT/$file"
            ;;

        *)
            echo "skip: $file"
            continue
            ;;
    esac

    echo "built: $file -> $OUT/$file"
done
