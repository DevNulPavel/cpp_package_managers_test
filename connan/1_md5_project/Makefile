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