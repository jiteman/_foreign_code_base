cmake_minimum_required( VERSION 3.7.1 )

project( test_cpp_unit_lib C CXX )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-header.cmake )


include( ${JMSD_CU_CMAKE_SETTINGS_PATH}/cu-main-set-compiler-settings.cmake )
include( ${JMSD_TEST_CPPUNIT_CMAKE_SETTINGS_PATH}/test-cu-main-set-compiler-settings.cmake )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JMSD_PLATFORM_SOURCES}
	${cpp_unit_DEPENDENCY_DIRS}
	${JMSD_CPPUNIT_SOURCE_PATH}/examples/cppunittest
	${JMSD_FOREIGN_TEST_SOURCE_PATH}/test_cppunit/test_cppunit_main/sources
	${cpp_unit_clocker_DEPENDENCY_DIRS} )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files
	${JMSD_CPPUNIT_SOURCE_PATH}/examples/cppunittest/*.h*
	${JMSD_CPPUNIT_SOURCE_PATH}/examples/cppunittest/*.c*
	${JMSD_FOREIGN_TEST_SOURCE_PATH}/test_cppunit/test_cppunit_main/sources/*.h*
	${JMSD_FOREIGN_TEST_SOURCE_PATH}/test_cppunit/test_cppunit_main/sources/*.c* )

set( JMSD_TEST_CPPUNIT_FILES_TO_REMOVE "TestApp;Driver" )

if( UNIX )
elseif( WIN32 )
	list( APPEND JMSD_TEST_CPPUNIT_FILES_TO_REMOVE "TuplesTest;NamedTuplesTest" )
else()
	message( SEND_ERROR "[JMSD] ${PROJECT_NAME} platform is not supported." )
endif()

JMSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files JMSD_TEST_CPPUNIT_FILES_TO_REMOVE )

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	-DJMSD_TEST_CPPUNIT_MAIN_SHARED_INTERFACE_INTERNAL
	${cpp_unit_LINK_DEFINITIONS}
	${cpp_unit_clocker_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	${cpp_unit_LINK_DEFINITIONS}
	${cpp_unit_clocker_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 1.14.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 1.14 )


## project target section
#if ( WIN32 )
#	set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
#		"Iphlpapi.lib" )
#elseif( UNIX )
#	set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
#		"pthread"
#		"dl"
#		"rt" )
#else()
#	message( SEND_ERROR "[JMSD] ${PROJECT_NAME} platform is not supported." )
#endif()

set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
	cpp_unit
	cpp_unit_clocker )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-footer.cmake )
