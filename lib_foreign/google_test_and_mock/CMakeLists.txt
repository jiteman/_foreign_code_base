cmake_minimum_required( VERSION 3.7.1 )

project( google_test_and_mock )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


set( JMSD_GTM_SOURCE_ROOT_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/google_test_and_mock )
set( JMSD_GTM_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_gtm_cmake_settings )


add_subdirectory( google_test )
# add_subdirectory( google_mock )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
