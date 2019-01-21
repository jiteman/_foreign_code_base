JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_COMPONENT_NAME}-set-windows-compiler-settings.cmake" )

if ( WIN32 )
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4100" ) # '': unreferenced formal parameter
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4127" ) # conditional expression is constant
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4189" ) # '': local variable is initialized but not referenced
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4242" ) # '': conversion from '' to '', possible loss of data
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4244" ) # '': conversion from '' to '', possible loss of data
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4245" ) # 'initializing': conversion from '' to '', signed/unsigned mismatch
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4266" ) # '': no override available for virtual member function from base ''; function is hidden
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4310" ) # cast truncates constant value
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4324" ) # '': structure was padded due to alignment specifier
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4388" ) # '<': signed/unsigned mismatch
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4389" ) # '==': signed/unsigned mismatch
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4456" ) # declaration of 'b' hides previous local declaration
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4702" ) # unreachable code
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4834" ) # discarding return value of function with 'nodiscard' attribute
	#list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd5045" ) # Compiler will insert Spectre mitigation for memory load if /Qspectre switch specified

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
else()
	message( SEND_ERROR "[JMSD] ${JMSD_FOREIGN_COMPONENT_NAME} COMPILER SETTINGS: ${JMSD_FOREIGN_COMPONENT_NAME}-set-windows-compiler-settings.cmake is included while not on windows" )

endif()

JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_COMPONENT_NAME}-set-windows-compiler-settings.cmake" )
