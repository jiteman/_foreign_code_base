cmake_minimum_required( VERSION 3.7.1 )

project( test_foreign )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


#add_subdirectory( fle )
#add_subdirectory( fles )
add_subdirectory( test_cppunit )
add_subdirectory( test_poco )
#add_subdirectory( google_test_and_mock )
#add_subdirectory( cpp_unit )
#add_subdirectory( catch_2 )
#add_subdirectory( cpp_unit_lite )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
