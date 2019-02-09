cmake_minimum_required( VERSION 3.7.1 )

project( test_poco_libraries )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


set( JMSD_POCO_SOURCE_ROOT_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/poco )
set( JMSD_POCO_CMAKE_SETTINGS_PATH ${JMSD_FOREIGN_LIB_PATH}/poco/_poco_cmake_settings )
set( JMSD_TEST_POCO_SOURCE_ROOT_PATH ${JMSD_FOREIGN_TEST_SOURCE_PATH}/poco )
set( JMSD_TEST_POCO_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_test_poco_cmake_settings )

include( ${JMSD_POCO_CMAKE_SETTINGS_PATH}/macroses/poco-functions-and-macroses.cmake )


add_subdirectory( test_poco_foundation )
add_subdirectory( test_poco_json )
add_subdirectory( test_poco_xml )
#add_subdirectory( test_poco_util )

## add_subdirectory( poco_seven_zip )
#add_subdirectory( test_poco_zip )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
