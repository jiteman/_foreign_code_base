cmake_minimum_required( VERSION 3.7.1 )

project( fees )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


set( JMSD_FEES_SOURCE_ROOT_PATH ${JMSD_FOREIGN_EXE_SOURCE_PATH}/fees_sources )
set( JMSD_FEES_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_fees_cmake_settings )


add_subdirectory( fees_first )
add_subdirectory( fees_second )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
