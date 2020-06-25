cmake_minimum_required(VERSION 2.8.12)
project(MD5Encrypter)

add_definitions("-std=c++17")

# Подключаем зависимости, которые выкачал conan
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
# Прописываем разные инклюды и дефайны зависимостей
conan_basic_setup()

# Экспортируемые значения из conan
# CONAN_INCLIDE_DIRS
# CONAN_LIB_DIRS
# CONAN_LIBS
# CONAN_DEFINES
message("\n\n")
message("CONAN_INCLIDE_DIRS: ${CONAN_INCLIDE_DIRS}")
message("CONAN_LIB_DIRS: ${CONAN_LIB_DIRS}")
message("CONAN_LIBS: ${CONAN_LIBS}")
message("CONAN_DEFINES: ${CONAN_DEFINES}")
message("\n\n")

# Прописываем инклюды
include_directories(${CONAN_INCLIDE_DIRS})

# Закидываем наши необходимые исходники
add_executable(md5 src/main.cpp)

# Подключаем зависимости, которые conan выкачал
target_link_libraries(md5 ${CONAN_LIBS})