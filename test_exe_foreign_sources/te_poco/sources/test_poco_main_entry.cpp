#include "FoundationTestSuite.h"

#include "Poco/CppUnit/TestRunner.h"


#include "Poco/CppUnit/TestRunner.h"
#include "FoundationTestSuite.h"


#include <iostream>


int main( int const /*argc*/, char const *const argv[] ) {
	::std::vector< ::std::string > args;
//	{
//		for ( size_t i = 0; i < size_t( argc ); ++i ) {
//			args.push_back( ::std::string( argv[ i ] ) );
//		}
//	}

	{
		args.push_back( argv[ 0 ] );
		args.push_back( "-all" );
	}

	CppUnit::TestRunner runner;
	runner.addTest( "FoundationTestSuite", FoundationTestSuite::suite() );
	return runner.run( args ) ? 0 : 1;
}
