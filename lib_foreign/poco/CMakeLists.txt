cmake_minimum_required( VERSION 3.7.1 )

project( poco_libraries )


JMSD_SHOW_PROJECT_GROUP_HEADER()


set( JMSD_POCO_SOURCE_ROOT_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/poco )
set( JMSD_POCO_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_poco_cmake_settings )

include( ${JMSD_POCO_CMAKE_SETTINGS_PATH}/macroses/poco-functions-and-macroses.cmake )


add_subdirectory( poco_foundation )
add_subdirectory( poco_json )
add_subdirectory( poco_xml )
add_subdirectory( poco_util )

add_subdirectory( poco_seven_zip )
add_subdirectory( poco_zip )

## add_subdirectory( poco_cppunit )
add_subdirectory( poco_cppunit_facade )


JMSD_SHOW_PROJECT_GROUP_FOOTER()
