cmake_minimum_required( VERSION 3.7.1 )

project( google_test C CXX )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-header.cmake )

include( ${JMSD_GTM_CMAKE_SETTINGS_PATH}/gtm-test-set-compiler-settings.cmake )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JMSD_PLATFORM_SOURCES}
	${JMSD_GTM_SOURCE_ROOT_PATH}/googletest/include )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files
	${JMSD_GTM_SOURCE_ROOT_PATH}/googletest/include/*.h*
	${JMSD_GTM_SOURCE_ROOT_PATH}/googletest/src/*.h*
	${JMSD_GTM_SOURCE_ROOT_PATH}/googletest/src/*.c* )

# JMSD_REMOVE_FILE_FROM_THE_LIST( header_and_source_files "gtest-param-test.h.pump" )
# JMSD_REMOVE_FILE_FROM_THE_LIST( header_and_source_files "gtest-param-util-generated.h.pump" )
JMSD_REMOVE_FILE_FROM_THE_LIST( header_and_source_files "gtest-type-util.h.pump" )
JMSD_REMOVE_FILE_FROM_THE_LIST( header_and_source_files "gtest-all.cc" )

set( JMSD_GTM_TEST_FILES_TO_REMOVE
	"gtest-param-test.h.pump"
	"gtest-param-util-generated.h.pump" )
JMSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files JMSD_GTM_TEST_FILES_TO_REMOVE )

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	"" )
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
