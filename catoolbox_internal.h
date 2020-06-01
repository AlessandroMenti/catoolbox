/*
 * Copyright © 2019-2020, the catoolbox contributors
 *
 * This file is free software: you can redistribute it and/or modify it under:
 * - the terms of the GNU Lesser General Public License as published by the
 *   Free Software Foundation, either version 3 of the License, or (at your
 *   option) any later version; and/or
 * - the terms of the GNU General Public License as published by the Free
 *   Software Foundation, either version 3 of the License, or (at your option)
 *   any later version.
 * If you modify this file, you may:
 * - dual license your modifications under both sets of terms, or
 * - license them under one of those sets of terms. In this case, remove the
 *   set of terms you do not wish to license your modifications under from your
 *   version.
 *
 * This file is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License and of the
 * GNU Lesser General Public License along with catoolbox. If not, see
 * <http://www.gnu.org/licenses/>.
 *
 * Additional permission under GNU GPL version 3 section 7
 *
 * If you modify this file by linking or combining it with
 * - OpenSSL (or a modified version of that library), or
 * - any C/C++ runtime library,
 * containing parts covered by the terms of their respective licenses, the
 * licensors of this file grant you additional permission to convey the
 * resulting work.
 * If you modify this software, you may extend this exception to your version
 * of the software, but you are not obliged to do so. If you do not wish to do
 * so, delete this exception statement from your version.
 */

/* Common, shared utility definitions. */

#ifndef CATOOLBOX_CATOOLBOXINTERNAL_H
#define CATOOLBOX_CATOOLBOXINTERNAL_H

/* Check that only one build configuration is active. */
#if (defined(DEBUG) || defined(_DEBUG)) && (defined(NDEBUG) || defined(_NDEBUG))
    #error Both DEBUG and NDEBUG are defined.
#endif

/* Use this macro to mark a function parameter as deliberately unused. */
#ifndef UNREFERENCED_PARAMETER
#define UNREFERENCED_PARAMETER(x) ((void)x)
#endif /* UNREFERENCED_PARAMETER */

/* Include catoolbox header files. */
#include "catoolboxconfig.h"
#include <catoolbox/catoolbox.h>

#endif /* CATOOLBOX_CATOOLBOXINTERNAL_H */
