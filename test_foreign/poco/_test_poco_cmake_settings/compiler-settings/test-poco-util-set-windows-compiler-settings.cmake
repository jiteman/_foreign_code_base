JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_COMPONENT_NAME}-set-windows-compiler-settings.cmake" )

if ( WIN32 )
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4191" ) # 'reinterpret_cast': unsafe conversion from '' to ''. Calling this function through the result pointer may cause your program to fail
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4266" ) # '': no override available for virtual member function from base ''; function is hidden
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd4388" ) # '<': signed/unsigned mismatch
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "/wd5045" ) # Compiler will insert Spectre mitigation for memory load if /Qspectre switch specified

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	string( REPLACE "/Zc:strictStrings" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # disable string-literal to [char|wchar_t]* conversion (off by default)

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
else()
	message( SEND_ERROR "[JMSD] ${JMSD_FOREIGN_COMPONENT_NAME} COMPILER SETTINGS: ${JMSD_FOREIGN_COMPONENT_NAME}-set-windows-compiler-settings.cmake is included while not on windows" )

endif()

JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_COMPONENT_NAME}-set-windows-compiler-settings.cmake" )
