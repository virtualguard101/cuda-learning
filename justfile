# Configure, build, and refresh IDE metadata (compile_commands + .clangd).
bootstrap:
    cmake -B build
    cmake --build build
    ln -sf build/compile_commands.json compile_commands.json
    bash scripts/gen-clangd.sh

format:
    rg --files src -g '*.{h,hpp,cu,cuh}' -0 | xargs -0 clang-format -i

clean:
    find . -depth -type d -name build -not -path './.git/*' -exec rm -rf {} +
    find . -depth -type d -name .cache -not -path './.git/*' -exec rm -rf {} +
    rm -f compile_commands.json .clangd
