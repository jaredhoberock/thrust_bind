#include "bind.hpp"
#include <iostream>

int main()
{
  using namespace thrust::experimental;

  auto return_13 = bind([]
  {
    return 13;
  });

  std::cout << "return_13: " << return_13() << std::endl;
////
////  auto add_1 = [](int x)
////  {
////    return x + 1;
////  }
////
////  std::cout << "
////
//////  auto sum = [](int x, int y)
//////  {
//////    return x + y;
//////  };
//////
//////  auto sum_two_and_three = bind(sum, 2, 3);
////////
////////  std::cout << "sum_two_and_three: " << sum_two_and_three() << std::endl;

  return 0;
}

