if {![package vsatisfies [package provide Tcl] 8.6-10]} {return}
package ifneeded web-static-blog 0.1.4 [list source [file join $dir library web-static-blog.tcl]]
