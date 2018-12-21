cmake_minimum_required( VERSION 3.7.1 )

project( poco_seven_zip_lib C CXX )

include( ${JMSF_CMAKE_SETTINGS_PATH}/verbosity/project-header.cmake )
include( ${JMSF_CMAKE_SETTINGS_PATH}/reset-all-settings.cmake )

if( WIN32 )
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	# list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd" ) #	
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4619" ) # #pragma warning: there is no warning number ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4668" ) # '' is not defined as a preprocessor macro, replacing with '0' for '#if/#elif'

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	# string( REPLACE "X" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #

	#message( STATUS "[JMSD] BUILDING: ${PROJECT_NAME} C++ flags before: ${CMAKE_CXX_FLAGS}" )
	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
	#message( STATUS "[JMSD] BUILDING: ${PROJECT_NAME} C++ flags after: ${CMAKE_CXX_FLAGS}" )
endif()


# dependencies section
include_directories( ${poco_foundation_lib_DEPENDENCY_DIRS} )
#include_directories( ${al_std_DEPENDENCY_DIRS} )
#add_definitions( ${google_test_lib_DEFINITIONS} )
#message( STATUS "[JMSD] get google_test_lib dependency_dir: ${google_test_lib_DEPENDENCY_DIRS}" )
#message( STATUS "[JMSD] get google_test_lib defintions: ${google_test_lib_DEFINITIONS}" )

# this project header section
include_directories( ${PROJECT_SOURCE_DIR}/include ) # this

# this project headers and sources enumeration section
file ( GLOB_RECURSE header_and_source_files ${PROJECT_SOURCE_DIR}/include/*.h* ${PROJECT_SOURCE_DIR}/src/*.c* )
add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )
add_definitions( -DSevenZip_EXPORTS )

# Required on Unix OS family to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 2.0.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 2.0 )

# project target section
target_link_libraries( ${PROJECT_NAME} poco_foundation_lib )

# Expose public includes to other subprojects through cache variable.
set( ${PROJECT_NAME}_DEPENDENCY_DIRS ${PROJECT_SOURCE_DIR}/include CACHE INTERNAL "[JMSD] ${PROJECT_NAME}_DEPENDENCY_DIRS" FORCE )
set( ${PROJECT_NAME}_DEFINITIONS "" CACHE INTERNAL "[JMSD] ${PROJECT_NAME}_DEFINITIONS" FORCE )

include( ${JMSF_CMAKE_SETTINGS_PATH}/verbosity/project-dependency-footer.cmake )
include( ${JMSF_CMAKE_SETTINGS_PATH}/verbosity/project-footer.cmake )
