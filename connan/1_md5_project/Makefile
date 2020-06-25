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
	# --profile=../profiles/apple_clang_profile 
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

#  -s BINARYEN_TRAP_MODE='clamp'
BUILD_EMSCRIPTEN_WASM: CLEAN
	mkdir -p build_emscripten_wasm && \
	cd build_emscripten_wasm && \
	conan install \
		--profile=../profiles/emscripten_wasm \
		--build=missing \
		--install-folder . \
		.. && \
	echo "\n\nProject part\n\n" && \
	cmake \
		-G "Unix Makefiles" \
		-DCMAKE_CXX_FLAGS=" -s WASM=1 " \
		-DCMAKE_TOOLCHAIN_FILE=$(EMSCRIPTEN_PATH)/cmake/Modules/Platform/Emscripten.cmake \
		-DCMAKE_BUILD_TYPE=Release \
		.. && \
	cmake --build . ; \
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