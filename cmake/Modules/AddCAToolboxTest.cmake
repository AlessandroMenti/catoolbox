# Copyright © 2019-2020, the catoolbox contributors
#
# This file is free software: you can redistribute it and/or modify it under:
# - the terms of the GNU Lesser General Public License as published by the
#   Free Software Foundation, either version 3 of the License, or (at your
#   option) any later version; and/or
# - the terms of the GNU General Public License as published by the Free
#   Software Foundation, either version 3 of the License, or (at your option)
#   any later version.
# If you modify this file, you may:
# - dual license your modifications under both sets of terms, or
# - license them under one of those sets of terms. In this case, remove the
#   set of terms you do not wish to license your modifications under from your
#   version.
#
# This file is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License and of the
# GNU Lesser General Public License along with catoolbox. If not, see
# <http://www.gnu.org/licenses/>.
#
# Additional permission under GNU GPL version 3 section 7
#
# If you modify this file by linking or combining it with
# - OpenSSL (or a modified version of that library), or
# - any C/C++ runtime library,
# containing parts covered by the terms of their respective licenses, the
# licensors of this file grant you additional permission to convey the
# resulting work.
# If you modify this software, you may extend this exception to your version of
# the software, but you are not obliged to do so. If you do not wish to do so,
# delete this exception statement from your version.

# This module includes a shorthand function to add tests.

function(add_catoolbox_test target)
    add_executable(test_${target} ${ARGN})
    set_target_debug_security_flags(test_${target})
    target_link_libraries(test_${target}
        PRIVATE
            libcatoolbox
            ${CMOCKA_LIBRARIES}
    )
    target_include_directories(test_${target}
        PRIVATE
            ${PROJECT_BINARY_DIR}/libcatoolbox/include
            ${PROJECT_SOURCE_DIR}/libcatoolbox/include
            ${PROJECT_SOURCE_DIR}
            ${PROJECT_BINARY_DIR}
            ${CMOCKA_INCLUDE_DIR}
    )
    add_test(${target} "test_${target}")
    if(WIN32)
        # Ensure that any dependencies of the test target (e.g. the CMocka DLL)
        # are copied to the destination directory. Requires CMake 3.16+.
        # Note that, since the CMocka configuration files do not provide us
        # with a variable exposing the full path to the binary, we need to
        # add its path explicitly.
        add_custom_command(TARGET "test_${target}" POST_BUILD
                           COMMAND ${CMAKE_COMMAND}
                               -D CATOOLBOX_EXCLUSIONS="$<TARGET_FILE_NAME:libcatoolbox>"
                               -D TARGET_TO_TRACK="$<TARGET_FILE:test_${target}>"
                               -D TARGET_ADDITIONAL_DIRECTORIES="${CATOOLBOX_CMOCKA_BINARY_DIR}"
                               -D TARGET_FILE_DIR="$<TARGET_FILE_DIR:test_${target}>"
                               -P "${PROJECT_SOURCE_DIR}/cmake/CopyDependencyForTarget.cmake")
    endif(WIN32)
endfunction(add_catoolbox_test)
