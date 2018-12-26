cmake_minimum_required( VERSION 3.7.1 )

project( jmsd_foreign_code_base )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


add_subdirectory( lib_foreign )
# add_subdirectory( app_foreign )
# add_subdirectory( test_foreign )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
