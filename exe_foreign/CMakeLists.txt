cmake_minimum_required( VERSION 3.7.1 )

project( exe_foreign )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


set( JMSD_EXE_FOREIGN_SOURCE_ROOT_PATH ${PROJECT_SOURCE_DIR}/../exe_foreign_sources )


add_subdirectory( fee )
add_subdirectory( fees )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
