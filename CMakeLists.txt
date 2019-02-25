cmake_minimum_required( VERSION 3.7.1 )

project( jmsd_foreign_code_base )


JMSD_SHOW_PROJECT_GROUP_HEADER()


set( JMSD_FOREIGN_EXE_PATH ${PROJECT_SOURCE_DIR}/exe_foreign )
set( JMSD_FOREIGN_EXE_SOURCE_PATH ${PROJECT_SOURCE_DIR}/exe_foreign_sources )
set( JMSD_FOREIGN_LIB_PATH ${PROJECT_SOURCE_DIR}/lib_foreign )
set( JMSD_FOREIGN_LIB_SOURCE_PATH ${PROJECT_SOURCE_DIR}/lib_foreign_sources )
set( JMSD_FOREIGN_TEST_EXE_PATH ${PROJECT_SOURCE_DIR}/test_exe_foreign )
set( JMSD_FOREIGN_TEST_EXE_SOURCE_PATH ${PROJECT_SOURCE_DIR}/test_exe_foreign_sources )
set( JMSD_FOREIGN_TEST_PATH ${PROJECT_SOURCE_DIR}/test_foreign )
set( JMSD_FOREIGN_TEST_SOURCE_PATH ${PROJECT_SOURCE_DIR}/test_foreign_sources )


add_subdirectory( lib_foreign )
add_subdirectory( exe_foreign )
add_subdirectory( test_foreign )
add_subdirectory( test_exe_foreign )


JMSD_SHOW_PROJECT_GROUP_FOOTER()
