#include "fee/fee_class.h"


#include <iostream>


int main( int const /*argc*/, char const *const * /*argv*/ ) {
	auto *example = new ::jmsd::fee::Fee_class;

	::std::cout << example->say_hello_fle() << ::std::endl;
	::std::cout << example->say_hello_fee() << ::std::endl;

	delete example;

	return 0;
}
