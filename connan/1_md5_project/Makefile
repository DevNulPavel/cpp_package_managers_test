INSTALL_CONAN:
	brew install conan

# Указываем обязательно удаленный сервер, иначе поиск будет только локальный
SEARCH_POKO:
	conan search poco --remote=conan-center

# Получение информации об конкретном пакете
INSPECT_POCO:
	conan inspect poco/1.9.4

# Информация по всем текущим зависимостям c их валидацией
DEPENCY_INFO:
	conan info .
	conan info --graph=depency_graph.html .

# Сборка приложения с учетом зависимостей
BUILD: CLEAN
	mkdir -p build_native && \
	cd build_native && \
	conan install \
		--settings os="Macos" \
		--settings compiler="apple-clang" \
		--settings arch=x86_64 \
		--settings build_type=Release \
		--build=missing \
		--install-folder . \
		.. && \
	cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release .. && \
	cmake --build . ; \
	cd ../

# Сборка приложения с учетом зависимостей
BUILD_IOS_ARMV7: CLEAN
	mkdir -p build_ios_armv7 && \
	cd build_ios_armv7 && \
	conan install \
		--profile=../profiles/ios_armv7 \
		--build=missing \
		--install-folder . \
		.. && \
	cmake \
		-G "Unix Makefiles" \
		-DCMAKE_TOOLCHAIN_FILE=cmake/ios_toolchain.cmake \
		-DARCHS=armv7 \
		-DENABLE_BITCODE=1 \
		-DDEPLOYMENT_TARGET=10.0 \
		-DENABLE_VISIBILITY=1 \
		-DENABLE_STRICT_TRY_COMPILE=1 \
		-DCMAKE_BUILD_TYPE=Release .. && \
	cmake --build . ; \
	cd ../

# Сборка приложения с учетом зависимостей
BUILD_IOS_ARMV8: CLEAN
	mkdir -p build_ios_armv8 && \
	cd build_ios_armv8 && \
	conan install \
		--profile=../profiles/ios_armv8 \
		--build=missing \
		--install-folder . \
		.. && \
	cmake \
		-G "Unix Makefiles" \
		-DCMAKE_TOOLCHAIN_FILE=cmake/ios_toolchain.cmake \
		-DARCHS=arm64 \
		-DENABLE_BITCODE=1 \
		-DDEPLOYMENT_TARGET=10.0 \
		-DENABLE_VISIBILITY=1 \
		-DENABLE_STRICT_TRY_COMPILE=1 \
		-DCMAKE_BUILD_TYPE=Release .. && \
	cmake --build . ; \
	cd ../

# Сборка приложения с учетом зависимостей
BUILD_IOS_UNIVERSAL: CLEAN
	mkdir -p build_ios_universal && \
	cd build_ios_universal && \
	conan install \
		--profile=../profiles/ios_armv7 \
		--build=missing \
		--install-folder ./armv7 \
		.. && \
	conan install \
		--profile=../profiles/ios_armv8 \
		--build=missing \
		--install-folder ./armv8 \
		.. && \
	cp ./armv8/conanbuildinfo.cmake ./conanbuildinfo.cmake && \
	cp -R ./armv8/include ./include && \
	mkdir -p ./lib && \
	bash ../lipo_convert.sh && \
	cmake \
		-G "Unix Makefiles" \
		-DCMAKE_TOOLCHAIN_FILE=cmake/ios_toolchain.cmake \
		-DENABLE_BITCODE=1 \
		-DDEPLOYMENT_TARGET=10.0 \
		-DENABLE_VISIBILITY=1 \
		-DENABLE_STRICT_TRY_COMPILE=1 \
		-DCMAKE_BUILD_TYPE=Release .. && \
	cmake --build . ; \
	cd ../

# Сборка приложения с учетом зависимостей
BUILD_OSX_x86_64: CLEAN
	mkdir -p build_osx_x86_64 && \
	cd build_osx_x86_64 && \
	conan install \
		--profile=../profiles/osx_x86_64 \
		--build=missing \
		--install-folder . \
		.. && \
	cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release .. ; \
	cmake --build . ; \
	cd ../

# Сборка приложения с учетом зависимостей
BUILD_OSX_x86_64_XCODE: CLEAN
	mkdir -p build_osx_x86_64_xcode && \
	cd build_osx_x86_64_xcode && \
	conan install \
		--profile=../profiles/osx_x86_64 \
		--build=missing \
		--install-folder . \
		.. && \
	cmake -G "Xcode" -DCMAKE_BUILD_TYPE=Release .. ; \
	cd ../

# https://developer.android.com/ndk/guides/cmake#variables
# https://docs.conan.io/en/latest/mastering/envvars.html
BUILD_ANDROID_ARMV7: CLEAN
	mkdir -p build_android_armv7 && \
	cd build_android_armv7 && \
	conan install \
		-e PATH=["$(ANDROID_NDK)/toolchains/llvm/prebuilt/darwin-x86_64/bin"] \
		--profile=../profiles/android21_armv7_clang \
		--build=missing \
		--install-folder . \
		.. && \
	cmake \
		-G "Unix Makefiles" \
		-DCMAKE_TOOLCHAIN_FILE=$(ANDROID_NDK)/build/cmake/android.toolchain.cmake \
		-DANDROID_ABI="armeabi-v7a with NEON" \
		-DANDROID_ARM_NEON=TRUE \
		-DCMAKE_BUILD_TYPE=Release \
		.. && \
	cmake --build . ; \
	cd ../

# https://developer.android.com/ndk/guides/cmake#variables
# https://docs.conan.io/en/latest/mastering/envvars.html
BUILD_ANDROID_ARMV8: CLEAN
	mkdir -p build_android_armv8 && \
	cd build_android_armv8 && \
	conan install \
		-e PATH=["$(ANDROID_NDK)/toolchains/llvm/prebuilt/darwin-x86_64/bin"] \
		--profile=../profiles/android21_armv8_clang \
		--build=missing \
		--install-folder . \
		.. && \
	cmake \
		-G "Unix Makefiles" \
		-DCMAKE_TOOLCHAIN_FILE=$(ANDROID_NDK)/build/cmake/android.toolchain.cmake \
		-DANDROID_ABI=arm64-v8a \
		-DANDROID_ARM_NEON=TRUE \
		-DCMAKE_BUILD_TYPE=Release \
		.. && \
	cmake --build . ; \
	cd ../

# Сборка приложения с учетом зависимостей
BUILD_LINUX_x86_64: CLEAN
	mkdir -p build_linux_x86_64 && \
	cd build_linux_x86_64 && \
	conan install \
		--profile=../profiles/linux_x86_64 \
		--build=missing \
		--install-folder . \
		.. && \
	cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release .. && \
	cmake --build . ; \
	cd ../

# TODO: Fastcomp version
#  
#  -s BINARYEN_TRAP_MODE='clamp' 
# -DCMAKE_CXX_FLAGS=" -s WASM=1 "
# -DCMAKE_TOOLCHAIN_FILE=$(EMSCRIPTEN_PATH)/cmake/Modules/Platform/Emscripten.cmake
# export AR=emar && \
# export RANLIB=emranlib && \
# export CC=emcc && \
# export CXX=em++ &&
_BUILD_EMSCRIPTEN_WASM_FASTCOM: CLEAN
	mkdir -p build_emscripten_wasm_fastcomp && \
	cd build_emscripten_wasm_fastcomp && \
	conan install \
		--profile=../profiles/emscripten_wasm_fastcomp \
		--build=missing \
		--install-folder . \
		.. && \
	echo "\n\nProject part\n\n" && \
	cmake \
		-G "Unix Makefiles" \
		-DCMAKE_TOOLCHAIN_FILE=$(EMSCRIPTEN_PATH)/cmake/Modules/Platform/Emscripten.cmake \
		-DCMAKE_BUILD_TYPE=Release \
		.. && \
	cmake --build . ; \
	cd ../

# TODO: Fastcomp version
#  -s BINARYEN_TRAP_MODE='clamp'
# -DCMAKE_CXX_FLAGS=" -s WASM=1 "
# export AR=emar && \
# export RANLIB=emranlib && \
# export CC=emcc && \
# export CXX=em++ && \
# -DCMAKE_TOOLCHAIN_FILE=$(EMSCRIPTEN_PATH)/cmake/Modules/Platform/Emscripten.cmake
BUILD_EMSCRIPTEN_WASM_UPSTREAM: CLEAN
	mkdir -p build_emscripten_wasm_upstream && \
	cd build_emscripten_wasm_upstream && \
	conan install \
		--env CONAN_CMAKE_TOOLCHAIN_FILE=$(shell pwd)/Emscripten_upstream.cmake \
		--profile=../profiles/emscripten_wasm_upstream \
		--build=missing \
		--install-folder . \
		.. && \
	echo "\n\nProject part\n\n" && \
	cmake \
		-G "Unix Makefiles" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_TOOLCHAIN_FILE=$(shell pwd)/Emscripten_upstream.cmake \
		.. && \
	cmake --build . ; \
	cd ../

# -A "Win32"
# -A "x86"
# -A "x64"
BUILD_WINDOWS_X86: CLEAN
	mkdir -p build_windows_x86 && \
	cd build_windows_x86 && \
	powershell -Command \
		"conan.exe install \
			--profile=..\profiles\windows_x86 \
			--build=missing \
			--install-folder . \
			.." && \
	echo "----- Project part -----" && \
	cmake \
		-G "Visual Studio 16 2019" \
		-DCMAKE_BUILD_TYPE=Release \
		.. && \
	cd ../

# -A "Win32"
# -A "x86"
# -A "x64"
BUILD_WINDOWS_X86_64: CLEAN
	mkdir -p build_windows_x86_64 && \
	cd build_windows_x86_64 && \
	powershell -Command \
		"conan.exe install \
			--profile=..\profiles\windows_x86_64 \
			--build=missing \
			--install-folder . \
			.." && \
	echo "----- Project part -----" && \
	cmake \
		-G "Visual Studio 16 2019" \
		-DCMAKE_BUILD_TYPE=Release \
		.. && \
	cd ../

# -A "ARM"
BUILD_WINDOWS_ARMV7: CLEAN
	mkdir -p build_windows_armv7 && \
	cd build_windows_armv7 && \
	powershell -Command \
		"conan.exe install \
			--profile=..\profiles\windows_armv7 \
			--build=missing \
			--install-folder . \
			.." && \
	echo "----- Project part -----" && \
	cmake \
		-G "Visual Studio 16 2019" \
		-DCMAKE_BUILD_TYPE=Release \
		.. && \
	cd ../

# -A "ARM64"
BUILD_WINDOWS_ARMV8: CLEAN
	mkdir -p build_windows_armv8 && \
	cd build_windows_armv8 && \
	powershell -Command \
		"conan.exe install \
			--profile=..\profiles\windows_armv8 \
			--build=missing \
			--install-folder . \
			.." && \
	echo "----- Project part -----" && \
	cmake \
		-G "Visual Studio 16 2019" \
		-DCMAKE_BUILD_TYPE=Release \
		.. && \
	cd ../

# Запуск
RUN: BUILD
	cd build/bin && \
	./md5 \
	cd ../../

# Чистка
CLEAN:
	rm -rf build*/

clean: CLEAN

clear: CLEAN