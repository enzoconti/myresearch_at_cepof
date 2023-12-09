
# PlanAhead Launch Script for Post PAR Floorplanning, created by Project Navigator

create_project -name register_iotest -dir "/home/ise/register_iotest/planAhead_run_2" -part xc3s500efg320-4
set srcset [get_property srcset [current_run -impl]]
set_property design_mode GateLvl $srcset
set_property edif_top_file "/home/ise/register_iotest/register.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/ise/register_iotest} }
set_property target_constrs_file "register_iotest_config.ucf" [current_fileset -constrset]
add_files [list {register_iotest_config.ucf}] -fileset [get_property constrset [current_run]]
link_design
read_xdl -file "/home/ise/register_iotest/register.ncd"
if {[catch {read_twx -name results_1 -file "/home/ise/register_iotest/register.twx"} eInfo]} {
   puts "WARNING: there was a problem importing \"/home/ise/register_iotest/register.twx\": $eInfo"
}
