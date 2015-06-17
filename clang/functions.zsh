function cmake_llvm() {
  cmake .. -DCMAKE_BUILD_TYPE:STRING=Release \
           -DCMAKE_INSTALL_PREFIX:PATH=/opt/llvm \
           -DBUILD_SHARED_LIBS:BOOL=ON \
           -DLLVM_TARGETS_TO_BUILD:STRING="X86;ARM;AArch64" \
#           -DLLVM_BUILD_EXAMPLES:BOOL=ON \
#           -DLLVM_PARALLEL_COMPILE_JOBS:STRING="3" \
           -G Ninja
}

function update_llvm() {
    git fetch && (cd tools/clang && git fetch)  # Get matching revisions of both trees.
    git checkout master
    git svn rebase -l
    (cd tools/clang &&
	git checkout master &&
	git svn rebase -l)
}

# I find that -mem2reg is sufficient to have reasonable looking
# IR for learning purposes, before a whole swathe of Shit You Don't
# Understand kicks in.
function view_ir() {
    file="${1%.*}"
    shift # for the pass options below
    clang -emit-llvm -c $1
    opt -mem2reg $@ $file.bc | llvm-dis
}

function verify_ir() {
    file="${1%.*}"
    clang -emit-llvm -c $1
    if [ $? -eq 0 ]; then
        printf "\e[5;32;40m Passed\e[m\n"
    else
        printf "\e[5;31;40m Failed\e[m\n"
    fi
}


