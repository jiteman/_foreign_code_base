set( JMSD_FOREIGN_COMPONENT_NAME test-poco-util )

JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_COMPONENT_NAME}-set-compiler-settings.cmake" )


if ( UNIX )
	JMSD_SHOW_MESSAGE( "${JMSD_FOREIGN_COMPONENT_NAME} COMPILER SETTINGS: Linux linker settings are selected" )
	include( ${JMSD_TEST_POCO_CMAKE_SETTINGS_PATH}/compiler-settings/test-poco-common-set-linux-compiler-settings.cmake )
	include( ${JMSD_TEST_POCO_CMAKE_SETTINGS_PATH}/compiler-settings/${JMSD_FOREIGN_COMPONENT_NAME}-set-linux-compiler-settings.cmake )
elseif( WIN32 )
	JMSD_SHOW_MESSAGE( "${JMSD_FOREIGN_COMPONENT_NAME} COMPILER SETTINGS: Windows linker settings are selected" )
	include( ${JMSD_TEST_POCO_CMAKE_SETTINGS_PATH}/compiler-settings/test-poco-common-set-windows-compiler-settings.cmake )
	include( ${JMSD_TEST_POCO_CMAKE_SETTINGS_PATH}/compiler-settings/${JMSD_FOREIGN_COMPONENT_NAME}-set-windows-compiler-settings.cmake )
else()
	message( STATUS "[JMSD] ${JMSD_FOREIGN_COMPONENT_NAME} COMPILER SETTINGS: Unsupported platform. Default settings are used." )
endif()


JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_COMPONENT_NAME}-set-compiler-settings.cmake" )
