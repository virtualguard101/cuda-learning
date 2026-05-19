#!/usr/bin/env bash
# Generate .clangd with CUDA + per-exercise include paths for the IDE.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

includes=()
for d in "$root"/src/*/include; do
    [[ -d "$d" ]] || continue
    includes+=("-I${d}")
done

{
    echo "CompileFlags:"
    echo "  Add:"
    echo "    - --cuda-path=/opt/cuda"
    echo "    - -I/opt/cuda/include"
    echo "    - -xcuda"
    echo "    - --cuda-gpu-arch=sm_89"
    for flag in "${includes[@]}"; do
        echo "    - ${flag}"
    done
    echo "  Remove:"
    echo "    - -forward-unknown-to-host-compiler"
    echo "    - --options-file*"
    echo "    - --generate-code=*"
    echo "    - -Xcompiler=*"
} > .clangd

echo "wrote .clangd (${#includes[@]} exercise include path(s))"
