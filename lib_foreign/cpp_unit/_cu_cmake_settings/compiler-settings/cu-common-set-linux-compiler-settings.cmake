JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_COMPONENT_BASE_NAME}-common-set-linux-compiler-settings.cmake" )

if ( UNIX )
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-" ) #

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #
	string( REPLACE "-Wconversion" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # conversion from '' to '' may alter its value
	string( REPLACE "-Wshadow" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # declaration of '' shadows a member of ''
	string( REPLACE "-Wfloat-equal" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # comparing floating point with == or != is unsafe

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )

	## set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wno-format" )
else()
	message( SEND_ERROR "[JMSD] ${JMSD_FOREIGN_COMPONENT_BASE_NAME}-common COMPILER SETTINGS: ${JMSD_FOREIGN_COMPONENT_BASE_NAME}-common-set-linux-compiler-settings.cmake is included while not on linux" )

endif()

JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_COMPONENT_BASE_NAME}-common-set-linux-compiler-settings.cmake" )
