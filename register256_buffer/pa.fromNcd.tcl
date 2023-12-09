
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name register256_buffer -dir "/home/ise/register256_buffer/planAhead_run_2" -part xc3s500efg320-4
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "/home/ise/register256_buffer/top_module.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/register256_buffer} }
set_property target_constrs_file "ports.ucf" [current_fileset -constrset]
add_files [list {ports.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "/home/ise/register256_buffer/top_module.ncd"
if {[catch {read_twx -name results_1 -file "/home/ise/register256_buffer/top_module.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"/home/ise/register256_buffer/top_module.twx\": $eInfo"
}
