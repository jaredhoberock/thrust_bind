#include "bind.hpp"
#include <iostream>

__host__ __device__
void demo()
{
  using namespace thrust::placeholders;
  using namespace thrust::experimental;

  auto return_13 = bind([]
  {
    return 13;
  });

  printf("return_13: %d\n", return_13());

  auto add_1 = bind([](int x)
  {
    return x + 1;
  },
  _1
  );

  printf("add_1(0): %d\n", add_1(0));

  auto sum = [](int x, int y)
  {
    return x + y;
  };

  auto sum_two_and_three = bind(sum, 2, 3);

  printf("sum_two_and_three: %d\n", sum_two_and_three());

  auto bound_sum = bind(sum, _1, _2);

  printf("bound_sum(2,3): %d\n", bound_sum(2,3));
}

__global__ void device_demo()
{
  printf("Demo on the device\n");
  demo();
}

int main()
{
  printf("Demo on the host\n");
  demo();

  device_demo<<<1,1>>>();
  cudaDeviceSynchronize();

  return 0;
}

