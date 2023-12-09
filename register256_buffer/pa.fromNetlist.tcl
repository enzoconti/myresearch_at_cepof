
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name register256_buffer -dir "/home/ise/register256_buffer/planAhead_run_5" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/ise/register256_buffer/top_module.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/register256_buffer} }
set_property target_constrs_file "ports.ucf" [current_fileset -constrset]
add_files [list {ports.ucf}] -fileset [get_property constrset [current_run]]
link_design
