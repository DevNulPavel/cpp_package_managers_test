#include <iostream>

// TODO: Абсолютные или относительные пути?
//#include <curl/curl.h>
#include <zlib.h>
#include "freetype2/ft2build.h"
#include "freetype2/freetype/freetype.h"
// #include <assimp/anim.h>
//#include <openssl/opensslv.h>
//#include <Poco/MD5Engine.h>
//#include <Poco/DigestStream.h>


int main(int argc, char** argv) {
    /*Poco::MD5Engine md5;

    Poco::DigestOutputStream ds(md5);
    ds << "abcdefghijklmnopqrstuvwxyz";
    ds.close();

    std::cout << Poco::DigestEngine::digestToHex(md5.digest()) << std::endl;*/
    const char* zlib_v_str = zlibVersion();
    printf("ZLib version: %s", zlib_v_str);

    FT_Library* library = new FT_Library;
    FT_Init_FreeType(library);
    
    return 0;
}
