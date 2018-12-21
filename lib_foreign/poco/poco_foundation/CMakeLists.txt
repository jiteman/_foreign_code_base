project( poco_foundation_lib C CXX )

include( ${JMSF_CMAKE_SETTINGS_PATH}/verbosity/project-header.cmake )
include( ${JMSF_CMAKE_SETTINGS_PATH}/reset-all-settings.cmake )

if( WIN32 )
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	# list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4127" ) # conditional expression is constant
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4242" ) # '': conversion from '' to '', possible loss of data
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4244" ) # '': conversion from '' to '', possible loss of data
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4266" ) # '': no override available for virtual member function from base ''; function is hidden
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4324" ) # '': structure was padded due to alignment specifier
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4388" ) # '<': signed/unsigned mismatch	
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4619" ) # #pragma warning: there is no warning number ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4668" ) # '' is not defined as a preprocessor macro, replacing with '0' for '#if/#elif'
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4702" ) # unreachable code

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	# string( REPLACE "X" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #
	string( REPLACE "/Za" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # disable language extension (off)

	#message( STATUS "[JMSD] BUILDING: ${PROJECT_NAME} C++ flags before: ${CMAKE_CXX_FLAGS}" )
	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
	#message( STATUS "[JMSD] BUILDING: ${PROJECT_NAME} C++ flags after: ${CMAKE_CXX_FLAGS}" )
endif()


# dependencies section
#include_directories( ${encodebuba_DEPENDENCY_DIRS} )
#include_directories( ${al_std_DEPENDENCY_DIRS} )
#add_definitions( ${google_test_lib_DEFINITIONS} )
#message( STATUS "[JMSD] get google_test_lib dependency_dir: ${google_test_lib_DEPENDENCY_DIRS}" )
#message( STATUS "[JMSD] get google_test_lib defintions: ${google_test_lib_DEFINITIONS}" )

# this project header section
include_directories( ${PROJECT_SOURCE_DIR}/include ) # this

# this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files ${PROJECT_SOURCE_DIR}/include/*.h* ${PROJECT_SOURCE_DIR}/src/*.c* )

set( UNIPLATFORM_FILES_TO_REMOVE_HEADER_ONLY "Platform" )
set( UNIPLATFORM_FILES_TO_REMOVE_HEADER_AND_SOURCE
	"DirectoryIterator;Environment;File;FileStream;FPEnvironment;LogFile;Mutex;NamedEvent;NamedMutex;Path;PipeImpl;Process;RWLock;Thread;SharedLibrary;SharedMemory"
)
set( UNIPLATFORM_FILE_TO_REMOVE_SOURCE_ONLY "Timezone" )

#message( STATUS "[POCO] file list before: " ${header_and_source_files} )
#message( STATUS "[POCO] file list processing..." )
JMSD_REMOVE_PLATFORM_HEADER_FILES_FOR_POCO( header_and_source_files UNIPLATFORM_FILES_TO_REMOVE_HEADER_ONLY "include/Poco" )
JMSD_REMOVE_PLATFORM_HEADER_FILES_FOR_POCO( header_and_source_files UNIPLATFORM_FILES_TO_REMOVE_HEADER_AND_SOURCE "include/Poco" )
JMSD_REMOVE_PLATFORM_CXX_SOURCE_FILES_FOR_POCO( header_and_source_files UNIPLATFORM_FILES_TO_REMOVE_HEADER_AND_SOURCE "src" )
JMSD_REMOVE_PLATFORM_CXX_SOURCE_FILES_FOR_POCO( header_and_source_files UNIPLATFORM_FILE_TO_REMOVE_SOURCE_ONLY "src" )
# list( REMOVE_ITEM header_and_source_files "${PROJECT_SOURCE_DIR}/src/Environment_WINCE.cpp" )


set( PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "AndroidLogChannel;EventLogChannel;SyslogChannel;WindowsConsoleChannel" )

if ( UNIX )
	list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "SyslogChannel" )
elseif( WIN32 )
	list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "EventLogChannel" )
	list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "WindowsConsoleChannel" )
endif()

JMSD_REMOVE_HEADER_FILES_FOR_POCO( header_and_source_files PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "include/Poco" )
JMSD_REMOVE_CXX_SOURCE_FILES_FOR_POCO( header_and_source_files PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "src" )

#message( STATUS "[POCO] file list after: " ${header_and_source_files} )

JMSD_MICROSOFT_MESSAGE_COMPILER( header_and_source_files src/pocomsg.mc )

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )
add_definitions( -DFoundation_EXPORTS )

# Required on Unix OS family to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 2.0.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 2.0 )

# project target section
target_link_libraries( ${PROJECT_NAME} "Iphlpapi.lib" )

# Expose public includes to other subprojects through cache variable.
set( ${PROJECT_NAME}_DEPENDENCY_DIRS ${PROJECT_SOURCE_DIR}/include CACHE INTERNAL "[JMSD] ${PROJECT_NAME}_DEPENDENCY_DIRS" FORCE )
set( ${PROJECT_NAME}_DEFINITIONS "" CACHE INTERNAL "[JMSD] ${PROJECT_NAME}_DEFINITIONS" FORCE )

include( ${JMSF_CMAKE_SETTINGS_PATH}/verbosity/project-dependency-footer.cmake )
include( ${JMSF_CMAKE_SETTINGS_PATH}/verbosity/project-footer.cmake )
