cmake_minimum_required( VERSION 3.7.1 )

project( fles )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


set( JMSD_FLES_SOURCE_ROOT_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/fles_sources )
set( JMSD_FLES_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_fles_cmake_settings )


add_subdirectory( fles_first )
add_subdirectory( fles_second )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
