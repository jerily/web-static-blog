# 
# Copyright Jerily LTD. All Rights Reserved.
# SPDX-FileCopyrightText: 2026 Neofytos Dimitriou (neo@jerily.cy)
# SPDX-License-Identifier: MIT.
# 

# Load the static blog package and its storage dependencies.
package require web-static-blog::manifest
package require Tcl
package require cmark_gfm
package require tpathexp
package require tjson
package require tpersist

namespace eval ::web::static::blog {
    variable root [file dirname [file dirname [info script]]]
}
source [file join $::web::static::blog::root library content.tcl]
source [file join $::web::static::blog::root library images.tcl]
source [file join $::web::static::blog::root library templates.tcl]
source [file join $::web::static::blog::root library http.tcl]
source [file join $::web::static::blog::root library mount.tcl]
source [file join $::web::static::blog::root library sync.tcl]
package provide web-static-blog 1.0.0
