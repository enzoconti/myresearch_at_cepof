
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name PPS1_generator -dir "/home/ise/PPS1_generator/planAhead_run_2" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ise/PPS1_generator/PPS_generator.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/PPS1_generator} }
set_property target_constrs_file "ports_and_constraints.ucf" [current_fileset -constrset]
add_files [list {ports_and_constraints.ucf}] -fileset [get_property constrset [current_run]]
link_design
