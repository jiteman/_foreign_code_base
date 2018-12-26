set( JMSD_FOREIGN_POCO_COMPONENT_NAME poco-foundation )

JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_POCO_COMPONENT_NAME}-set-compiler-settings.cmake" )


${JMSD_POCO_CMAKE_SETTINGS_PATH}/poco-set-compiler-settings.cmake )


if ( UNIX )
	if ( JMSD_CMAKE_VERBOSE_OUTPUT_IS_ON )
		message( STATUS "[JMSD] ${JMSD_FOREIGN_POCO_COMPONENT_NAME} COMPILER SETTINGS: Linux linker settings are selected" )
	endif()
	
	include( ${JMSD_POCO_CMAKE_SETTINGS_PATH}/compiler-settings/${JMSD_FOREIGN_POCO_COMPONENT_NAME}-set-linux-compiler-settings.cmake )
elseif( WIN32 )
	if ( JMSD_CMAKE_VERBOSE_OUTPUT_IS_ON )
		message( STATUS "[JMSD] ${JMSD_FOREIGN_POCO_COMPONENT_NAME} COMPILER SETTINGS: Windows linker settings are selected" )
	endif()
	
	include( ${JMSD_POCO_CMAKE_SETTINGS_PATH}/compiler-settings/${JMSD_FOREIGN_POCO_COMPONENT_NAME}-set-windows-compiler-settings.cmake )
else()
	message( STATUS "[JMSD] ${JMSD_FOREIGN_POCO_COMPONENT_NAME} COMPILER SETTINGS: Unsupported platform. Default settings are used." )
endif()


JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_POCO_COMPONENT_NAME}-set-compiler-settings.cmake" )
