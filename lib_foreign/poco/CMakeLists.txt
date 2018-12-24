cmake_minimum_required( VERSION 3.7.1 )

project( poco_libraries )

include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


set( JMSD_POCO_SOURCE_ROOT_PATH ${JMSD_LIB_FOREIGN_SOURCE_ROOT_PATH}/poco ) 
set( JMSD_POCO_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_poco_cmake_settings )


add_subdirectory( poco_foundation )
add_subdirectory( poco_json )
add_subdirectory( poco_xml )
# add_subdirectory( poco_util )

# add_subdirectory( poco_seven_zip )
# add_subdirectory( poco_zip )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
