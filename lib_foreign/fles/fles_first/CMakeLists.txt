cmake_minimum_required( VERSION 3.7.1 )

project( fles_first C CXX )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-header.cmake )

include( ${JMSD_FLES_CMAKE_SETTINGS_PATH}/fles-first-set-compiler-settings.cmake )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JMSD_PLATFORM_SOURCES}
	${JMSD_FLES_SOURCE_ROOT_PATH}/fles_first_sources/sources )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files
	${JMSD_FLES_SOURCE_ROOT_PATH}/fles_first_sources/sources/*.h*
	${JMSD_FLES_SOURCE_ROOT_PATH}/fles_first_sources/sources/*.c* )
add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	-DJMSD_FLES_FIRST_SHARED_INTERFACE_INTERNAL )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	"" )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 0.1.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 0.1 )


## project target section
set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
	"" )

list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-footer.cmake )
