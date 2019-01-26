#pragma once


#include "cppunit/TestCaller.h"


#define CppUnit_addTest( suite, cls, mth ) \
	suite->addTest( new CppUnit::TestCaller< cls >( #mth, &cls::mth ) )

#define CppUnit_addQualifiedTest( suite, cls, mth ) \
	suite->addTest( new CppUnit::TestCaller< cls >( #cls"::"#mth, &cls::mth ) )
