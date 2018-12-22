cmake_minimum_required( VERSION 3.7.1 )

project( poco_foundation_lib C CXX )

include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-header.cmake )

include( ${JMSD_CMAKE_SETTINGS_PATH}/macroses/macroses.cmake )
include( ${JMSD_POCO_CMAKE_SETTINGS_PATH}/macroses/poco-macroses.cmake )


if( WIN32 )
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4127" ) # conditional expression is constant
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4242" ) # '': conversion from '' to '', possible loss of data
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4244" ) # '': conversion from '' to '', possible loss of data
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4266" ) # '': no override available for virtual member function from base ''; function is hidden
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4324" ) # '': structure was padded due to alignment specifier
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4388" ) # '<': signed/unsigned mismatch
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4619" ) # #pragma warning: there is no warning number ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4668" ) # '' is not defined as a preprocessor macro, replacing with '0' for '#if/#elif'
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4702" ) # unreachable code
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd5045" ) # Compiler will insert Spectre mitigation for memory load if /Qspectre switch specified

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	# string( REPLACE "X" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #
	string( REPLACE "/Za" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # disable language extension (off)

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
elseif( UNIX )
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-unused-parameter" ) # unused parameter ‘’
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-implicit-fallthrough" ) # this statement may fall through
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-sign-compare" ) # comparison of integer expressions of different signedness: ‘’ and ‘’ {aka ‘’}
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-vla" ) # ISO C++ forbids variable length array ‘’
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-float-equal" ) # comparing floating point with == or != is unsafe

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	string( REPLACE "-Wconversion" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # conversion from '' to '' may change value
	string( REPLACE "-Wcast-qual" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # cast from type ‘’ to type ‘’ casts away qualifiers
	string( REPLACE "-Wmissing-declarations" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # no previous declaration for ‘’
	string( REPLACE "-Wshadow" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # declaration of '' shadows a member of ''

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
else()
	message( SEND_ERROR "[JMSD] ${PROJECT_NAME} platform is not supported." )
endif()


## include dependencies
set( ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR
	# ${JMSD_PLATFORM_SOURCES}
	${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/include )
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_DIRS_VAR )
include_directories( ${${PROJECT_NAME}_DEPENDENCY_DIRS_VAR} )


## this project headers and sources enumeration section
file( GLOB_RECURSE header_and_source_files ${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/include/*.h* ${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/src/*.c* )

set( UNIPLATFORM_FILES_TO_REMOVE_HEADER_ONLY "Platform" )
set( UNIPLATFORM_FILES_TO_REMOVE_HEADER_AND_SOURCE
	"DirectoryIterator;Environment;File;FileStream;FPEnvironment;LogFile;Mutex;NamedEvent;NamedMutex;Path;PipeImpl;Process;RWLock;Thread;SharedLibrary;SharedMemory"
)
set( UNIPLATFORM_FILE_TO_REMOVE_SOURCE_ONLY "Timezone" )

# message( STATUS "[POCO] file list before: " ${header_and_source_files} )
# message( STATUS "[POCO] file list processing..." )
JMSD_REMOVE_PLATFORM_HEADER_FILES_FOR_POCO( header_and_source_files UNIPLATFORM_FILES_TO_REMOVE_HEADER_ONLY "${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/include/Poco" )
JMSD_REMOVE_PLATFORM_HEADER_FILES_FOR_POCO( header_and_source_files UNIPLATFORM_FILES_TO_REMOVE_HEADER_AND_SOURCE "${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/include/Poco" )
JMSD_REMOVE_PLATFORM_CXX_SOURCE_FILES_FOR_POCO( header_and_source_files UNIPLATFORM_FILES_TO_REMOVE_HEADER_AND_SOURCE "${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/src" )
JMSD_REMOVE_PLATFORM_CXX_SOURCE_FILES_FOR_POCO( header_and_source_files UNIPLATFORM_FILE_TO_REMOVE_SOURCE_ONLY "${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/src" )

set( PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "AndroidLogChannel;EventLogChannel;SyslogChannel;WindowsConsoleChannel" )

if ( UNIX )
	list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "SyslogChannel" )
elseif( WIN32 )
	list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "EventLogChannel" )
	list( REMOVE_ITEM PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "WindowsConsoleChannel" )
else()
	message( SEND_ERROR "[JMSD] ${PROJECT_NAME} platform is not supported." )
endif()

JMSD_REMOVE_HEADER_FILES_FOR_POCO( header_and_source_files PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/include/Poco" )
JMSD_REMOVE_CXX_SOURCE_FILES_FOR_POCO( header_and_source_files PLATFORM_SPECIC_FILES_TO_REMOVE_HEADER_AND_SOURCE "${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/src" )

# message( STATUS "[POCO] file list after: " ${header_and_source_files} )

if( WIN32 )
	JMSD_MICROSOFT_MESSAGE_COMPILER( header_and_source_files ${JMSD_POCO_SOURCE_ROOT_PATH}/Foundation/src/pocomsg.mc )
endif()

add_library( ${PROJECT_NAME} SHARED ${header_and_source_files} )


set( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR
	-DFoundation_EXPORTS )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_BUILD_DEFINITIONS_VAR )
set( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR
	"" )
JMSD_LIST_TO_STRING( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
JMSD_STRING_REMOVE_DUPLICATES( ${PROJECT_NAME}_LINK_DEFINITIONS_VAR )
add_definitions( "${${PROJECT_NAME}_BUILD_DEFINITIONS_VAR}" )


## Required on Unix OS family to be able to be linked into shared libraries.
set_target_properties( ${PROJECT_NAME} PROPERTIES POSITION_INDEPENDENT_CODE ON )
set_target_properties( ${PROJECT_NAME} PROPERTIES VERSION 2.0.0 )
set_target_properties( ${PROJECT_NAME} PROPERTIES SOVERSION 2.0 )


<<<<<<< HEAD
# project target section
<<<<<<< HEAD
set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
	"Iphlpapi.lib" )
=======
## project target section
=======
>>>>>>> bae9b627e4132725545d2b9c6bdc6939c92338f5
if ( WIN32 )
	set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
		"Iphlpapi.lib" )
elseif( UNIX )
	set( ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR
		"pthread"
		"dl"
		"rt" )
else()
	message( SEND_ERROR "[JMSD] ${PROJECT_NAME} platform is not supported." )
endif()

<<<<<<< HEAD
>>>>>>> cc5e87f... poco JSON library is builded (on windows)
=======
>>>>>>> bae9b627e4132725545d2b9c6bdc6939c92338f5
list( REMOVE_DUPLICATES ${PROJECT_NAME}_DEPENDENCY_LIBS_VAR )
target_link_libraries( ${PROJECT_NAME} ${${PROJECT_NAME}_DEPENDENCY_LIBS_VAR} )


## Expose public includes to other subprojects through cache variable.
include( ${JMSD_CMAKE_SETTINGS_PATH}/set-expose-dependencies.cmake )

include( ${JMSD_CMAKE_SETTINGS_PATH}/verbosity/project-footer.cmake )
