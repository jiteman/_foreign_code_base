cmake_minimum_required( VERSION 3.7.1 )

project( test_cppunit_libraries )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )



set( JMSD_CPPUNIT_SOURCE_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/cppunit )
set( JMSD_CU_CMAKE_SETTINGS_PATH ${JMSD_FOREIGN_LIB_PATH}/cpp_unit/_cu_cmake_settings )
set( JMSD_TEST_CPPUNIT_SOURCE_PATH ${JMSD_FOREIGN_TEST_SOURCE_PATH}/test_cppunit )
set( JMSD_TEST_CPPUNIT_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_test_cu_cmake_settings )

	
add_subdirectory( test_cppunit_main )
#add_subdirectory( test_poco_json )
#add_subdirectory( test_poco_xml )
#add_subdirectory( test_poco_util )

## add_subdirectory( poco_seven_zip )
#add_subdirectory( test_poco_zip )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
