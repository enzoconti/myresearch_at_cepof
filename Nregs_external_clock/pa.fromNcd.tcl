
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name Nregs_external_clock -dir "/home/ise/Nregs_external_clock/planAhead_run_2" -part xc3s500efg320-4
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "/home/ise/Nregs_external_clock/Nreg_internal_clock.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/Nregs_external_clock} }
set_property target_constrs_file "ports.ucf" [current_fileset -constrset]
add_files [list {ports.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "/home/ise/Nregs_external_clock/Nreg_internal_clock.xdl"
if {[catch {read_twx -name results_1 -file "/home/ise/Nregs_external_clock/Nreg_internal_clock.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"/home/ise/Nregs_external_clock/Nreg_internal_clock.twx\": $eInfo"
}
