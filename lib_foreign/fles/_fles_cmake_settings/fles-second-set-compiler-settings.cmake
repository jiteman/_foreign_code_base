set( JMSD_FOREIGN_COMPONENT_BASE_NAME fles )
set( JMSD_FOREIGN_COMPONENT_LAST_NAME second )


set( JMSD_FOREIGN_COMPONENT_FULL_NAME "${JMSD_FOREIGN_COMPONENT_BASE_NAME}-${JMSD_FOREIGN_COMPONENT_LAST_NAME}" )


JMSD_CMAKE_CURRENT_FILE_IN( "${JMSD_FOREIGN_COMPONENT_FULL_NAME}-set-compiler-settings.cmake" )


if ( UNIX )
	JMSD_SHOW_BUILD_MESSAGE( "${JMSD_FOREIGN_COMPONENT_FULL_NAME} COMPILER SETTINGS: Linux" )
	include( ${JMSD_FLES_CMAKE_SETTINGS_PATH}/compiler-settings/${JMSD_FOREIGN_COMPONENT_BASE_NAME}-common-set-linux-compiler-settings.cmake )
	include( ${JMSD_FLES_CMAKE_SETTINGS_PATH}/compiler-settings/${JMSD_FOREIGN_COMPONENT_FULL_NAME}-set-linux-compiler-settings.cmake )
elseif( WIN32 )
	JMSD_SHOW_BUILD_MESSAGE( "${JMSD_FOREIGN_COMPONENT_FULL_NAME} COMPILER SETTINGS: Windows" )
	include( ${JMSD_FLES_CMAKE_SETTINGS_PATH}/compiler-settings/${JMSD_FOREIGN_COMPONENT_BASE_NAME}-common-set-windows-compiler-settings.cmake )
	include( ${JMSD_FLES_CMAKE_SETTINGS_PATH}/compiler-settings/${JMSD_FOREIGN_COMPONENT_FULL_NAME}-set-windows-compiler-settings.cmake )
else()
	message( STATUS "[JMSD] ${JMSD_FOREIGN_COMPONENT_FULL_NAME} COMPILER SETTINGS: Unsupported platform. Default settings are used." )
endif()


JMSD_CMAKE_CURRENT_FILE_OUT( "${JMSD_FOREIGN_COMPONENT_FULL_NAME}-set-compiler-settings.cmake" )
