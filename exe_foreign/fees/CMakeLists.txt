cmake_minimum_required( VERSION 3.7.1 )

project( fees )


JMSD_SHOW_PROJECT_GROUP_HEADER()


set( JMSD_FEES_SOURCE_ROOT_PATH ${JMSD_FOREIGN_EXE_SOURCE_PATH}/fees_sources )
set( JMSD_FEES_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_fees_cmake_settings )


add_subdirectory( fees_first )
add_subdirectory( fees_second )


JMSD_SHOW_PROJECT_GROUP_FOOTER()
