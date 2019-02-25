cmake_minimum_required( VERSION 3.7.1 )

project( test_exe_foreign )


JMSD_SHOW_PROJECT_GROUP_HEADER()


add_subdirectory( te_cppunit )
add_subdirectory( te_poco )


JMSD_SHOW_PROJECT_GROUP_FOOTER()
