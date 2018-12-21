macro(
	JMSD_REMOVE_PLATFORM_HEADER_FILES_FOR_POCO
	file_list
	file_list_to_remove
	path_to_file
)
	set( JMSD_PLATFORM_LIST "Android;C99;DEC;DUMMY;HPUX;POSIX;QNX;STD;STD_POSIX;STD_VX;STD_WIN32;SUN;UNIX;VMS;VX;WIN32;WIN32_OSVER;WIN32U;WINCE" )

	foreach( platform_name ${JMSD_PLATFORM_LIST} )
		foreach( filename ${${file_list_to_remove}} )
			list( REMOVE_ITEM ${file_list} ${path_to_file}/${filename}_${platform_name}.h )
		endforeach()
	endforeach()

endmacro()

macro(
	JMSD_REMOVE_PLATFORM_CXX_SOURCE_FILES_FOR_POCO
	file_list
	file_list_to_remove
	path_to_file
)
	set( JMSD_PLATFORM_LIST "Android;C99;DEC;DUMMY;HPUX;POSIX;QNX;STD;STD_POSIX;STD_VX;STD_WIN32;SUN;UNIX;VMS;VX;WIN32;WIN32_OSVER;WIN32U;WINCE" )

	foreach( platform_name ${JMSD_PLATFORM_LIST} )
		foreach( filename ${${file_list_to_remove}} )
			list( REMOVE_ITEM ${file_list} ${path_to_file}/${filename}_${platform_name}.cpp )
		endforeach()
	endforeach()

endmacro()

macro(
	JMSD_REMOVE_HEADER_FILES_FOR_POCO
	file_list
	file_list_to_remove
	path_to_file
)
	foreach( filename ${${file_list_to_remove}} )
		list( REMOVE_ITEM ${file_list} ${path_to_file}/${filename}.h )
	endforeach()

endmacro()

macro(
	JMSD_REMOVE_CXX_SOURCE_FILES_FOR_POCO
	file_list
	file_list_to_remove
	path_to_file
)
	foreach( filename ${${file_list_to_remove}} )
		list( REMOVE_ITEM ${file_list} ${path_to_file}/${filename}.cpp )
	endforeach()

endmacro()
