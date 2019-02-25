cmake_minimum_required( VERSION 3.7.1 )

project( lib_foreign )


JMSD_SHOW_PROJECT_GROUP_HEADER()


add_subdirectory( fle )
add_subdirectory( fles )

add_subdirectory( google_test_and_mock )
add_subdirectory( cpp_unit )
add_subdirectory( cpp_unit_clocker )
add_subdirectory( catch_2 )
add_subdirectory( cpp_unit_lite )

add_subdirectory( poco )


JMSD_SHOW_PROJECT_GROUP_FOOTER()
