INSTALL_CONAN:
	brew install conan

# Указываем обязательно удаленный сервер, иначе поиск будет только локальный
SEARCH_POKO:
	conan search poco --remote=conan-center

# Получение информации об конкретном пакете
INSPECT_POCO:
	conan inspect poco/1.9.4

# Информация по всем текущим зависимостям
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
BUILD_IOS: CLEAN
	mkdir -p build_ios && \
	cd build_ios && \
	conan install \
		--profile=../profiles/ios_profile \
		--build=missing \
		--install-folder . \
		.. && \
	cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release .. && \
	cmake --build . ; \
	cd ../

# Сборка приложения с учетом зависимостей
#-DCMAKE_C_COMPILER=$(ANDROID_NDK)/toolchains/llvm/prebuilt/darwin-x86_64/bin/armv7a-linux-androideabi21-clang
#-DCMAKE_CXX_COMPILER=$(ANDROID_NDK)/toolchains/llvm/prebuilt/darwin-x86_64/bin/armv7a-linux-androideabi21-clang++ 
# cmake \
# 	-G "Unix Makefiles" \
# 	-DCMAKE_TOOLCHAIN_FILE=$(ANDROID_NDK)/build/cmake/android.toolchain.cmake \
# 	-DANDROID_ABI=21 \
# 	-DCMAKE_BUILD_TYPE=Release \
# 	.. && \
# cmake --build . ; \

# https://developer.android.com/ndk/guides/cmake#variables
BUILD_ANDROID: CLEAN
	mkdir -p build_android && \
	cd build_android && \
	conan install \
		-e PATH=$(ANDROID_NDK)/toolchains/llvm/prebuilt/darwin-x86_64/bin \
		--profile=../profiles/android_21_armv8_clang \
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