# Copyright (C) 2011-2016 Project SkyFire <http://www.projectskyfire.org/
# Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# This file is run right before CMake starts configuring the sourcetree

# Example: Force CMAKE_INSTALL_PREFIX to be preloaded with something before
# doing the actual first "configure"-part - allows for hardforcing
# destinations elsewhere in the CMake buildsystem (commented out on purpose)

# Override CMAKE_INSTALL_PREFIX on Windows platforms
#if( WIN32 )
#  if( NOT CYGWIN )
#    set(CMAKE_INSTALL_PREFIX
#      "" CACHE PATH "Default install path")
#  endif()
#endif()

function(set_local_cache_path variable value type description)
  if(EXISTS "${value}" AND (NOT DEFINED ${variable} OR "${${variable}}" STREQUAL "" OR "${${variable}}" MATCHES "-NOTFOUND$"))
    set(${variable} "${value}" CACHE ${type} "${description}" FORCE)
  endif()
endfunction()

if(CMAKE_HOST_WIN32)
  set_local_cache_path(BOOST_ROOT
    "C:/local/boost_1_85_0"
    PATH
    "Boost root directory")

  set_local_cache_path(Boost_INCLUDE_DIR
    "C:/local/boost_1_85_0"
    PATH
    "Boost include directory")

  set_local_cache_path(BOOST_LIBRARYDIR
    "C:/local/boost_1_85_0/lib64-msvc-14.3"
    PATH
    "Boost library directory")

  set_local_cache_path(MYSQL_INCLUDE_DIR
    "C:/wamp64/bin/mysql/mysql5.7.44/include"
    PATH
    "Specify the directory containing mysql.h.")

  set_local_cache_path(MYSQL_LIBRARY
    "C:/wamp64/bin/mysql/mysql5.7.44/lib/libmysql.lib"
    FILEPATH
    "Specify the location of the mysql library here.")

  set_local_cache_path(MYSQL_EXECUTABLE
    "C:/wamp64/bin/mysql/mysql5.7.44/bin/mysql.exe"
    FILEPATH
    "path to your mysql binary.")

  set_local_cache_path(OPENSSL_ROOT_DIR
    "C:/Program Files/OpenSSL-Win64"
    PATH
    "OpenSSL root directory")

  set_local_cache_path(OPENSSL_INCLUDE_DIR
    "C:/Program Files/OpenSSL-Win64/include"
    PATH
    "OpenSSL include directory")

  set_local_cache_path(LIB_EAY_LIBRARY_RELEASE
    "C:/Program Files/OpenSSL-Win64/lib/VC/x64/MD/libcrypto.lib"
    FILEPATH
    "OpenSSL crypto release library")

  set_local_cache_path(LIB_EAY_RELEASE
    "C:/Program Files/OpenSSL-Win64/lib/VC/x64/MD/libcrypto.lib"
    FILEPATH
    "OpenSSL crypto release library")

  set_local_cache_path(SSL_EAY_LIBRARY_RELEASE
    "C:/Program Files/OpenSSL-Win64/lib/VC/x64/MD/libssl.lib"
    FILEPATH
    "OpenSSL SSL release library")

  set_local_cache_path(SSL_EAY_RELEASE
    "C:/Program Files/OpenSSL-Win64/lib/VC/x64/MD/libssl.lib"
    FILEPATH
    "OpenSSL SSL release library")

  set_local_cache_path(LIB_EAY_LIBRARY_DEBUG
    "C:/Program Files/OpenSSL-Win64/lib/VC/x64/MDd/libcrypto.lib"
    FILEPATH
    "OpenSSL crypto debug library")

  set_local_cache_path(LIB_EAY_DEBUG
    "C:/Program Files/OpenSSL-Win64/lib/VC/x64/MDd/libcrypto.lib"
    FILEPATH
    "OpenSSL crypto debug library")

  set_local_cache_path(SSL_EAY_LIBRARY_DEBUG
    "C:/Program Files/OpenSSL-Win64/lib/VC/x64/MDd/libssl.lib"
    FILEPATH
    "OpenSSL SSL debug library")

  set_local_cache_path(SSL_EAY_DEBUG
    "C:/Program Files/OpenSSL-Win64/lib/VC/x64/MDd/libssl.lib"
    FILEPATH
    "OpenSSL SSL debug library")
endif()
