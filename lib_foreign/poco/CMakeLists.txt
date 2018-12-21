cmake_minimum_required( VERSION 3.7.1 )

project( poco_libraries )

include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


add_subdirectory( poco_foundation )
# add_subdirectory( poco_json )
# add_subdirectory( poco_xml )
# add_subdirectory( poco_util )

# add_subdirectory( poco_seven_zip )
# add_subdirectory( poco_zip )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
