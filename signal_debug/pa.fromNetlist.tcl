
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name signal_debug -dir "/home/ise/signal_debug/planAhead_run_3" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ise/signal_debug/on_signal.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/signal_debug} }
set_property target_constrs_file "ports_signak_debug.ucf" [current_fileset -constrset]
add_files [list {ports_signak_debug.ucf}] -fileset [get_property constrset [current_run]]
link_design
