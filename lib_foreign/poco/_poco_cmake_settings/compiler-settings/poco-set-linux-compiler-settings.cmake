JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_COMPONENT_NAME}-set-linux-compiler-settings.cmake" )


if ( UNIX )


else()
	message( SEND_ERROR "[JMSD] ${JMSD_FOREIGN_COMPONENT_NAME}-COMPILER SETTINGS: ${JMSD_FOREIGN_COMPONENT_NAME}-set-linux-compiler-settings.cmake is included while not on linux" )
endif()


JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_COMPONENT_NAME}-set-linux-compiler-settings.cmake" )
