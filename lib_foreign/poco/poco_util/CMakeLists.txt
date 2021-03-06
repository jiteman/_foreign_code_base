cmake_minimum_required( VERSION 3.7.1 )

project( poco_util_lib C CXX )


JMSD_SHOW_PROJECT_HEADER()


set( JMSD_POCO_UTIL_SOURCE_PATH ${JMSD_POCO_SOURCE_ROOT_PATH}/Util )

include( ${JMSD_POCO_CMAKE_SETTINGS_PATH}/poco-util-set-compiler-settings.cmake )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	# ${JMSD_PLATFORM_SOURCES}
	${poco_foundation_lib_DEPENDENCY_DIRS}
	${poco_xml_lib_DEPENDENCY_DIRS}
	${poco_json_lib_DEPENDENCY_DIRS}
	${JMSD_POCO_UTIL_SOURCE_PATH}/include )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


# this project headers and sources enumeration section
file ( GLOB_RECURSE header_and_source_files ${JMSD_POCO_UTIL_SOURCE_PATH}/include/*.h* ${JMSD_POCO_UTIL_SOURCE_PATH}/src/*.c* )

set( PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "WinRegistryConfiguration;WinRegistryKey;WinService" )

if ( UNIX )
	## list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "SyslogChannel" )
elseif( WIN32 )
	list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "WinRegistryConfiguration" )
	list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "WinRegistryKey" )
	list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "WinService" )
else()
	message( SEND_ERROR "[JMSD] ${PROJECT_NAME} platform is not supported." )
endif()

JMSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE )

# JMSD_REMOVE_HEADER_FILES_FOR_POCO( header_and_source_files PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "${JMSD_POCO_SOURCE_ROOT_PATH}/Util/include/Poco" )
# JMSD_REMOVE_CXX_SOURCE_FILES_FOR_POCO( header_and_source_files PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "${JMSD_POCO_SOURCE_ROOT_PATH}/Util/src" )

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	-DUtil_EXPORTS
	${poco_foundation_lib_LINK_DEFINITIONS}
	${poco_json_lib_LINK_DEFINITIONS}
	${poco_xml_lib_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	${poco_foundation_lib_LINK_DEFINITIONS}
	${poco_json_lib_LINK_DEFINITIONS}
	${poco_xml_lib_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 2.0.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 2.0 )


## project target section
set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
	poco_foundation_lib
	poco_json_lib
	poco_xml_lib )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
JMSD_SHOW_PROJECT_FOOTER()
