
#include "FoundationTestSuite.h"
//#include "JSONTestSuite.h"
//#include "XMLTestSuite.h"
//#include "UtilTestSuite.h"
//#include "ZipTestSuite.h"


#include "cppunit/TestRunner.h"
#include "cppunit/TestResult.h"
#include "cppunit/TestResultCollector.h"
#include "cppunit/TextTestProgressListener.h"

#include "cppunit/CompilerOutputter.h"


#include <iostream>


int main( int const argc, char const *const argv[] ) {
	::std::string const testPath = ( argc > 1 ) ? argv[ 1 ] : "";

	// Create the event manager and test controller
	::CppUnit::TestResult controller;

	// Add a listener that colllects test result
	::CppUnit::TestResultCollector result;
	controller.addListener( &result );

	// Add a listener that print dots as test run.
	::CppUnit::TextTestProgressListener progress;
	controller.addListener( &progress );

	// Add the top suite to the test runner
	::CppUnit::TestRunner runner;
	//runner.addTest( ::CppUnit::TestFactoryRegistry::getRegistry().makeTest() );
	runner.addTest( ::FoundationTestSuite::suite() );
	//runner.addTest( ::JSONTestSuite::suite() );
	//runner.addTest( ::XMLTestSuite::suite() );
	//runner.addTest( ::UtilTestSuite::suite() );
	//runner.addTest( ::ZipTestSuite::suite() );

	try {
		::std::cout << "Running "  <<  testPath;
		runner.run( controller, testPath );
		::std::cerr << ::std::endl;

		// Print test in a compiler compatible format.
		::CppUnit::CompilerOutputter outputter( &result, ::std::cerr );
		outputter.write();
	} catch ( ::std::invalid_argument &e ) {
		// Test path not resolved
		::std::cerr << ::std::endl;
		::std::cerr << "ERROR: " << e.what() << std::endl;
		return 0;
	}

	return result.wasSuccessful() ? 0 : 1;
}


//int main( int const /*argc*/, char const *const argv[] ) {
//	::std::vector< ::std::string > args;
////	{
////		for ( size_t i = 0; i < size_t( argc ); ++i ) {
////			args.push_back( ::std::string( argv[ i ] ) );
////		}
////	}

//	{
//		args.push_back( argv[ 0 ] );
//		args.push_back( "-all" );
//	}

//	::CppUnit::TestRunner runner;
//	runner.addTest( "FoundationTestSuite", ::FoundationTestSuite::suite() );
//	return runner.run( args ) ? 0 : 1;
//}
