JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_COMPONENT_NAME}-set-linux-compiler-settings.cmake" )

if ( UNIX )
	set( ${PROJECT_NAME}_CXX_FLAGS ${CMAKE_CXX_FLAGS} )

	## list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-" ) #
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-unused-parameter" ) # unused parameter ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-implicit-fallthrough" ) # this statement may fall through
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-sign-compare" ) # comparison of integer expressions of different signedness: '' and ' {aka ''}
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-vla" ) # ISO C++ forbids variable length array ''
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-unused-but-set-variable" ) # variable '' set but not used
	list( APPEND ${PROJECT_NAME}_CXX_FLAGS "-Wno-unused-variable" ) # unused variable ''

	string( REPLACE ";" " " ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS}" )

	## string( REPLACE "-W" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) #
	string( REPLACE "-Wfloat-equal" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # comparing floating point with == or != is unsafe
	string( REPLACE "-Wcast-qual" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # cast from type '' to type '' casts away qualifiers
	string( REPLACE "-Wmissing-declarations" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # no previous declaration for ''
	string( REPLACE "-Wundef" "" ${PROJECT_NAME}_CXX_FLAGS_STR "${${PROJECT_NAME}_CXX_FLAGS_STR}" ) # "" is not defined, evaluates to 0

	set( CMAKE_CXX_FLAGS ${${PROJECT_NAME}_CXX_FLAGS_STR} )
else()
	message( SEND_ERROR "[JMSD] ${JMSD_FOREIGN_COMPONENT_NAME} COMPILER SETTINGS: ${JMSD_FOREIGN_COMPONENT_NAME}-set-linux-compiler-settings.cmake is included while not on linux" )

endif()

JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_COMPONENT_NAME}-set-linux-compiler-settings.cmake" )
