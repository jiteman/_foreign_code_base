#include "fees/fees_first_class.h"


#include <iostream>


int main( int const /*argc*/, char const *const * /*argv*/ ) {
	auto *example = new ::jmsd::fees::Fees_first_class;

	::std::cout << example->say_hello_fles_first() << ::std::endl;
	::std::cout << example->say_hello_fees_first() << ::std::endl;

	delete example;

	return 0;
}
