cmake_minimum_required( VERSION 3.7.1 )

project( lib_foreign )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


set( JMSD_LIB_FOREIGN_SOURCE_ROOT_PATH ${PROJECT_SOURCE_DIR}/../lib_foreign_sources )


add_subdirectory( fle )
add_subdirectory( fles )
# add_subdirectory( cpp_unit )
# add_subdirectory( poco )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
