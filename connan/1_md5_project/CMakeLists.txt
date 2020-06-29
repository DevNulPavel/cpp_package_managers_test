cmake_minimum_required(VERSION 2.8.12)
project(MD5Encrypter)

add_definitions("-std=c++17")

# Подключаем зависимости, которые выкачал conan
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)

# Прописываем разные инклюды и дефайны зависимостей для текущей сборки
# conan_basic_setup()

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

message("CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message("CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
message("CMAKE_AR: ${CMAKE_AR}")
message("CMAKE_RANLIB: ${CMAKE_RANLIB}")
message("EMSCRIPTEN_ROOT_PATH: ${EMSCRIPTEN_ROOT_PATH}")
message("CMAKE_C_COMPILER_VERSION: ${CMAKE_C_COMPILER_VERSION}")
message("CMAKE_CXX_COMPILER_VERSION: ${CMAKE_CXX_COMPILER_VERSION}")
message("EMSCRIPTEN_VERSION: ${EMSCRIPTEN_VERSION}")
message("EMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES: ${EMSCRIPTEN_GENERATE_BITCODE_STATIC_LIBRARIES}")

message("\n\n")

# Прописываем инклюды
#include_directories(${CONAN_INCLIDE_DIRS})

# Инклюды будем брать после копирования
include_directories(${CMAKE_BINARY_DIR}/include)
include_directories(${CMAKE_BINARY_DIR}/include/freetype2)

# Используем библиотеки из папки lib в директории сборки
message("Library search path: ${CMAKE_BINARY_DIR}/lib\n\n")
link_directories(${CMAKE_BINARY_DIR}/lib)
# target_link_directories(md5 PUBLIC ${CMAKE_BINARY_DIR}/lib)

# Закидываем наши необходимые исходники
add_executable(md5 src/main.cpp)

# Подключаем зависимости, которые conan выкачал
# target_link_libraries(md5 ${CONAN_LIBS})

# Из-за emscripten приходится руками
if(EMSCRIPTEN)
    # target_link_libraries(md5 assimp IrrXML zlibstatic freetype bz2)
    # target_link_libraries(md5 zlibstatic freetype bz2)
    # target_link_libraries(md5 z freetype bz2)
    target_link_libraries(md5 freetype)
else()
    #target_link_libraries(md5 assimp IrrXML zlibstatic freetype bz2)
    # target_link_libraries(md5 assimp IrrXML z freetype bz2)
endif()