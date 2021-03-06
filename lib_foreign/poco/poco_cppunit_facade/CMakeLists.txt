cmake_minimum_required( VERSION 3.7.1 )

project( poco_cppunit_facade_lib C CXX )


JMSD_SHOW_PROJECT_HEADER()


set( JMSD_POCO_CPPUNIT_FACADE_SOURCE_PATH ${JMSD_FOREIGN_LIB_SOURCE_PATH}/poco_cppunit_facade )

include( ${JMSD_POCO_CMAKE_SETTINGS_PATH}/poco-cppunit-facade-set-compiler-settings.cmake )


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	${JMSD_PLATFORM_SOURCES}
	${cpp_unit_DEPENDENCY_DIRS}
	${JMSD_POCO_CPPUNIT_FACADE_SOURCE_PATH}/sources )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files ${JMSD_POCO_CPPUNIT_FACADE_SOURCE_PATH}/sources/*.h* ${JMSD_POCO_CPPUNIT_FACADE_SOURCE_PATH}/sources/*.c* )

#set( JMSD_POCO_FOUNDATION_FILES_TO_REMOVE
#	"DirectoryIterator;Environment;File;FileStream;FPEnvironment;LogFile;Mutex;NamedEvent;NamedMutex;Path;PipeImpl;Platform;Process;RWLock;Thread;SharedLibrary;SharedMemory;Timezone" )
#JMSD_REMOVE_PLATFORM_FILES_FOR_POCO( header_and_source_files JMSD_POCO_FOUNDATION_FILES_TO_REMOVE )

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


## definition section
set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	-DJMSD_POCO_CPPUNIT_FACADE_SHARED_INTERFACE_INTERNAL
	${cpp_unit_LINK_DEFINITIONS} )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	${cpp_unit_LINK_DEFINITIONS} )
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
	cpp_unit )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )
JMSD_SHOW_PROJECT_FOOTER()
