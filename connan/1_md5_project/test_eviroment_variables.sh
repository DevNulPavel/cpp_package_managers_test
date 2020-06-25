
# VSCode
# export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH

# Default editor
export EDITOR=subl

# Homebrew + User bin
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Rust
export PATH=/Users/devnul/.cargo/bin:$PATH
export RUSTC_WRAPPER=/usr/local/bin/sccache
export SCCACHE_DIR=/Users/devnul/sccache
export SCCACHE_CACHE_SIZE=5G

# Go
export GOPATH=/Users/devnul/go
export PATH=/Users/devnul/go/bin:$PATH

# Android
#export ANDROID_SDK /Users/devnul/AndroidSDK
export ANDROID_SDK=/Users/devnul/AndroidSDK_AndroidStudio
export ANDROID_SDK_ROOT=$ANDROID_SDK
export ANDROID_HOME=$ANDROID_SDK
#export ANDROID_NDK=/Users/devnul/AndroidNDK_15
#export ANDROID_NDK=/Users/devnul/AndroidNDK_18
#export ANDROID_NDK-/Users/devnul/AndroidNDK_19
#export ANDROID_NDK=/Users/devnul/AndroidNDK_21
export ANDROID_NDK=/usr/local/opt/AndroidNDK_21
#export ANDROID_NDK=/Users/devnul/AndroidSDK_AndroidStudio/ndk-bundle
export ANDROID_NDK_ROOT=$ANDROID_NDK
export ANDROID_NDK_HOME=$ANDROID_NDK
export NDK_ROOT=$ANDROID_NDK
export NDK_HOME=$ANDROID_NDK
export PATH=$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$ANDROID_SDK:$ANDROID_NDK:$ANDROID_NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin:$PATH

# Brew C include paths
# export C_INCLUDE_PATH=$C_INCLUDE_PATH /usr/local/include
# export C_INCLUDE_PATH=$C_INCLUDE_PATH /usr/local/opt

# Brew  C++ include paths
# export CPLUS_INCLUDE_PATH $C_INCLUDE_PATH

# Brew libs path
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Vulkan
export VULKAN_SDK=/Users/devnul/VulkanSDK/macOS
export PATH=$VULKAN_SDK/bin:$PATH

# PVR
# export PATH $PATH '/Applications/Imagination/PowerVR_Graphics/PowerVR_Tools/PVRTexTool/CLI/OSX_x86/'

####################################
# Переменные с использованием emsdk (legacy) (Вроде как стабильная версия: ./emsdk activate 1.38.48-fastcomp)
####################################
# export EMSDK_PATH="/Users/devnul/emsdk"
# export LLVM_ROOT="/Users/devnul/emsdk/fastcomp/fastcomp/bin"
# export BINARYEN_ROOT="/Users/devnul/emsdk/fastcomp"
# export EMSCRIPTEN_ROOT="/Users/devnul/emsdk/fastcomp/emscripten"
# export EMSCRIPTEN_NATIVE_OPTIMIZER="/Users/devnul/emsdk/fastcomp/bin/optimizer"
# export NODE_JS="/Users/devnul/emsdk/node/8.9.1_64bit/bin/node"
# export EMSCRIPTEN_PATH="/Users/devnul/emsdk/fastcomp/emscripten"
# export FASTCOMP_PATH="/Users/devnul/emsdk/fastcomp"
# export PVRCLI_PATH="/Applications/Imagination/PowerVR_Graphics/PowerVR_Tools/PVRTexTool/CLI/OSX_x86"
# export PATH=$EMSCRIPTEN_PATH:$EMSCRIPTEN_PATH/tools:$PVRCLI_PATH:/Users/devnul/emsdk/node/8.9.1_64bit/bin:$PATH
# export LLVM=$FASTCOMP_PATH
# export EMSCRIPTEN=$EMSCRIPTEN_PATH
# export EMSDK=$EMSDK_PATH

####################################
# Переменные с использованием emsdk (latest LLVM, раньше назывался upstream) (Вроде как стабильная версия: ./emsdk activate 1.38.48-upstream)
####################################
export EMSDK_PATH="/Users/devnul/emsdk"
export LLVM_ROOT="/Users/devnul/emsdk/upstream/bin"
export BINARYEN_ROOT="/Users/devnul/emsdk/upstream"
export EMSCRIPTEN_ROOT="/Users/devnul/emsdk/upstream/emscripten"
export EMSCRIPTEN_PATH="/Users/devnul/emsdk/upstream/emscripten"
export NODE_JS="/Users/devnul/emsdk/node/12.9.1_64bit/bin"
export FASTCOMP_PATH="/Users/devnul/emsdk/upstream/fastcomp"
export PVRCLI_PATH="/Applications/Imagination/PowerVR_Graphics/PowerVR_Tools/PVRTexTool/CLI/OSX_x86"
export PATH=$EMSCRIPTEN_PATH:$EMSCRIPTEN_PATH/tools:$PVRCLI_PATH:$NODE_JS_PATH:$PATH
export EMSCRIPTEN=$EMSCRIPTEN_PATH
export EMSDK=$EMSDK_PATH

# Convert tools pathes test
# export PVR_TOOL_PATH '/Applications/Imagination/PowerVR_Graphics/PowerVR_Tools/PVRTexTool/CLI/OSX_x86/PVRTexToolCLI'
# export FFMPEG_TOOL_PATH '/usr/local/bin/ffmpeg'
# export WEBP_TOOL_PATH '/usr/local/bin/cwebp'

# XGEN
export XGEN_ENABLE_DISTCC=false
export XGEN_ENABLE_CCACHE=true
export XGEN_XCODE_DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer"