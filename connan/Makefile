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
	mkdir -p build && \
	cd build && \
	conan install \
		--settings os="Macos" \
		--settings compiler="apple-clang" \
		--settings arch=x86_64 \
		-s build_type=Release \
		--build=missing \
		.. && \
	cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release .. && \
	cmake --build . ; \
	cd ../

# Запуск
RUN: BUILD
	build/bin/md5

# Чистка
CLEAN:
	rm -rf build/