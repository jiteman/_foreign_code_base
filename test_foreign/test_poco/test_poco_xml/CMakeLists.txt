cmake_minimum_required( VERSION 3.7.1 )

project( test_poco_xml_lib C CXX )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-header.cmake )


include( ${JMSD_POCO_CMAKE_SETTINGS_PATH}/poco-xml-set-compiler-settings.cmake )
include( ${JMSD_TEST_POCO_CMAKE_SETTINGS_PATH}/test-poco-xml-set-compiler-settings.cmake )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JMSD_PLATFORM_SOURCES}
	${poco_cppunit_facade_lib_DEPENDENCY_DIRS}
	${poco_foundation_lib_DEPENDENCY_DIRS}
	${poco_xml_lib_DEPENDENCY_DIRS}
	${JMSD_POCO_SOURCE_ROOT_PATH}/XML/testsuite/src
	${JMSD_FOREIGN_TEST_SOURCE_PATH}/test_poco/test_poco_xml/sources )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files
	${JMSD_POCO_SOURCE_ROOT_PATH}/XML/testsuite/src/*.h*
	${JMSD_POCO_SOURCE_ROOT_PATH}/XML/testsuite/src/*.c*
	${JMSD_FOREIGN_TEST_SOURCE_PATH}/test_poco/test_poco_xml/sources/*.h*
	${JMSD_FOREIGN_TEST_SOURCE_PATH}/test_poco/test_poco_xml/sources/*.c* )

set( JMSD_TEST_POCO_FOUNDATION_FILES_TO_REMOVE "TestApp;Driver" )

if( UNIX )
elseif( WIN32 )
	list( APPEND JMSD_TEST_POCO_FOUNDATION_FILES_TO_REMOVE "TuplesTest;NamedTuplesTest" )
else()
	message( SEND_ERROR "[JMSD] ${PROJECT_NAME} platform is not supported." )
endif()

JMSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files JMSD_TEST_POCO_FOUNDATION_FILES_TO_REMOVE )

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	-DJMSD_TEST_POCO_XML_SHARED_INTERFACE_INTERNAL
	${poco_cppunit_facade_lib_LINK_DEFINITIONS}
	${poco_foundation_lib_LINK_DEFINITIONS}
	${poco_xml_lib_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	${poco_cppunit_facade_lib_LINK_DEFINITIONS}
	${poco_foundation_lib_LINK_DEFINITIONS}
	${poco_xml_lib_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 2.0.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 2.0 )


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
	poco_cppunit_facade_lib
	poco_foundation_lib
	poco_xml_lib )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-footer.cmake )
