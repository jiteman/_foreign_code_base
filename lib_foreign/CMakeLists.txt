cmake_minimum_required( VERSION 3.7.1 )

project( poco_libraries )

include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


set( JMSD_POCO_SOURCE_ROOT_PATH ${PROJECT_SOURCE_DIR}/../lib_foreign_sources/poco )


add_subdirectory( poco )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
