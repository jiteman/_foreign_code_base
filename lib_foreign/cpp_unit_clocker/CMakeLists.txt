cmake_minimum_required( VERSION 3.7.1 )

project( cpp_unit_clocker C CXX )


set( JMSD_CUC_SOURCE_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/cppunit )
set( JMSD_CUC_ADDITIONAL_SOURCE_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/cpp_unit_clocker )
set( JMSD_CUC_SOURCE_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/cppunit )
set( JMSD_CUC_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_cuc_cmake_settings )


include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-header.cmake )

include( ${JMSD_CUC_CMAKE_SETTINGS_PATH}/cuc-main-set-compiler-settings.cmake )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JMSD_PLATFORM_SOURCES}
	${cpp_unit_DEPENDENCY_DIRS}
	${JMSD_CUC_SOURCE_PATH}/examples/ClockerPlugIn
	${JMSD_CUC_ADDITIONAL_SOURCE_PATH}/sources	)
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files
	${JMSD_CUC_SOURCE_PATH}/examples/ClockerPlugIn/*.h*
	${JMSD_CUC_SOURCE_PATH}/examples/ClockerPlugIn/*.c*
	${JMSD_CUC_ADDITIONAL_SOURCE_PATH}/sources/*.h*
	${JMSD_CUC_ADDITIONAL_SOURCE_PATH}/sources/*.c* )

set( JMSD_CUC_FILES_TO_REMOVE
	"" )
JMSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files JMSD_CUC_FILES_TO_REMOVE )

if ( UNIX )
	JMSD_REMOVE_FILE_FROM_THE_LIST( header_and_source_files "WinNtTimer" )
endif()

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	${cpp_unit_LINK_DEFINITIONS}
	-DJMSD_CUC_SHARED_INTERFACE_INTERNAL )

if ( WIN32 )
	list( APPEND ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
		-DCLOCKER_USE_WINNTTIMER )
endif()

JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	${cpp_unit_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 1.14.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 1.14 )


## project target section
set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
	cpp_unit )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-footer.cmake )
