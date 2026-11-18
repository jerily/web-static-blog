# SPDX-License-Identifier: MIT
# Route declarations only. This package never loads storage or handlers.
namespace eval ::web::static::blog {
    variable template_directory [file normalize [file join [file dirname [info script]] .. assets]]
}

# Config is opaque here: hosts may bind a placeholder and resolve it on dispatch.
proc ::web::static::blog::route_specs {prefix config {settings {}} {policy {}}} {
    set prefix [string trimright $prefix /]
    if {![regexp {^(/[A-Za-z0-9_-]+)*$} $prefix]} {error "mount prefix must be a literal local path"}
    set index [expr {$prefix eq {} ? "/" : $prefix}]
    set routes {}
    lappend routes [list GET $prefix/_assets/:asset [list ::web::static::blog::dispatch $config asset]]
    lappend routes [list GET $index [list ::web::static::blog::dispatch $config view]]
    if {$prefix ne {}} {
        lappend routes [list GET $prefix/ [list ::web::static::blog::dispatch $config view]]
    }
    lappend routes [list GET $prefix/:path(.*) [list ::web::static::blog::dispatch $config view]]
    return $routes
}
package provide web-static-blog::routes 1.0
