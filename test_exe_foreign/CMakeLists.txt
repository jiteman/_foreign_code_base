cmake_minimum_required( VERSION 3.7.1 )

project( test_exe_foreign )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


add_subdirectory( te_poco )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
