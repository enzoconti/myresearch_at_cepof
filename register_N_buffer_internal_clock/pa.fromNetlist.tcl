
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name register_N_buffer_internal_clock -dir "/home/ise/register_N_buffer_internal_clock/planAhead_run_4" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ise/register_N_buffer_internal_clock/Nregs_internal_clock.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/register_N_buffer_internal_clock} }
set_property target_constrs_file "ports_and_constraints.ucf" [current_fileset -constrset]
add_files [list {ports_and_constraints.ucf}] -fileset [get_property constrset [current_run]]
link_design
