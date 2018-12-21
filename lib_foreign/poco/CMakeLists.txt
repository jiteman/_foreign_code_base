project( poco_libraries )

include( ${JMSF_CMAKE_SETTINGS_PATH}/verbosity/project-group-header.cmake )


add_subdirectory( poco_foundation )
# add_subdirectory( poco_json )
# add_subdirectory( poco_xml )
# add_subdirectory( poco_util )

# add_subdirectory( poco_seven_zip )
# add_subdirectory( poco_zip )


include( ${JMSF_CMAKE_SETTINGS_PATH}/verbosity/project-group-footer.cmake )
