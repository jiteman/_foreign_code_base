cmake_minimum_required( VERSION 3.7.1 )

project( te_cppunit C CXX )


set( JMSD_TE_CPPUNIT_SOURCE_PATH ${JMSD_FOREIGN_TEST_EXE_SOURCE_PATH}/te_cppunit )
set( JMSD_TE_CPPUNIT_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_te_cppunit_cmake_settings )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-header.cmake )


include( ${JMSD_TE_CPPUNIT_CMAKE_SETTINGS_PATH}/te-cppunit-main-set-compiler-settings.cmake )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JMSD_PLATFORM_SOURCES}
	${test_cpp_unit_lib_DEPENDENCY_DIRS} )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )

include_directories( ${JMSD_TE_POCO_SOURCE_ROOT_PATH}/sources )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files ${JMSD_TE_CPPUNIT_SOURCE_PATH}/sources/*.h* ${JMSD_TE_CPPUNIT_SOURCE_PATH}/sources/*.c* )
add_executable( ${PROJECT_NAME} ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	${test_cpp_unit_lib_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	${test_cpp_unit_lib_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 0.1.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 0.1 )


## project target section
set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
	test_cpp_unit_lib
	${test_cpp_unit_lib_DEPENDENCY_LIBS} )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-footer.cmake )
