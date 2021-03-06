cmake_minimum_required( VERSION 3.7.1 )

project( cpp_unit C CXX )


JMSD_SHOW_PROJECT_HEADER()


set( JMSD_CU_SOURCE_ROOT_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/cppunit )
set( JMSD_CU_CMAKE_SETTINGS_PATH ${PROJECT_SOURCE_DIR}/_cu_cmake_settings )


include( ${JMSD_CU_CMAKE_SETTINGS_PATH}/cu-main-set-compiler-settings.cmake )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	# ${JMSD_PLATFORM_SOURCES}
	${JMSD_CU_SOURCE_ROOT_PATH}/include )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files ${JMSD_CU_SOURCE_ROOT_PATH}/include/*.h* ${JMSD_CU_SOURCE_ROOT_PATH}/src/*.c* )

set( JMSD_CU_FILES_TO_REMOVE
	"CommandLineParser;DllPlugInTester;TestPlugInInterface" )
JMSD_REMOVE_FILES_FROM_THE_LIST( header_and_source_files JMSD_CU_FILES_TO_REMOVE )

if ( UNIX )
	JMSD_REMOVE_FILE_FROM_THE_LIST( header_and_source_files "DllMain" )
endif()

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	-DCPPUNIT_BUILD_DLL )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	-DCPPUNIT_DLL )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## required to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 1.14.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 1.14 )


## project target section
if( WIN32 )
	set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
		"" )
elseif( UNIX )
	set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
		"dl" )
endif()

list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
JMSD_SHOW_PROJECT_FOOTER()
