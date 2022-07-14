/*Crown Copyright 2012 AWE.
 *
 * This file is part of CloverLeaf.
 *
 * CloverLeaf is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your option)
 * any later version.
 *
 * CloverLeaf is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 *
 * You should have received a copy of the GNU General Public License along with
 * CloverLeaf. If not, see http://www.gnu.org/licenses/.
 */

/*
 *  @brief CUDA PdV kernel.
 *  @author Michael Boulton NVIDIA Corporation
 *  @details Calculates the change in energy and density in a cell using the
 *  change on cell volume due to the velocity gradients in a cell. The time
 *  level of the velocity data depends on whether it is invoked as the
 *  predictor or corrector.
 */

#include "cuda_common.hpp"
#include "kernel_files/PdV_kernel.cuknl"

extern "C" void pdv_kernel_cuda_(int *error_condition, int *prdct, double *dtbyt)
{
    cuda_chunk.PdV_kernel(error_condition, *prdct, *dtbyt);
}

void CloverleafCudaChunk::PdV_kernel(int *error_condition, int predict, double dt)
{
    if (predict)
    {
        CUDALAUNCH(device_PdV_cuda_kernel_predict, dt, pdv_reduce_array,
                   xarea, yarea, volume, density0, density1,
                   energy0, energy1, pressure, viscosity,
                   xvel0, yvel0, xvel1, yvel1);
    }
    else
    {
        CUDALAUNCH(device_PdV_cuda_kernel_not_predict, dt, pdv_reduce_array,
                   xarea, yarea, volume, density0, density1,
                   energy0, energy1, pressure, viscosity,
                   xvel0, yvel0, xvel1, yvel1);
    }
    //ReduceToHost<int>::max_element(pdv_reduce_array, error_condition, num_blocks);
    int *tmp = (int *)malloc(sizeof(int) * num_blocks);
    cudaMemcpy(tmp, pdv_reduce_array, sizeof(int) * num_blocks, cudaMemcpyDeviceToHost);
    error_condition[0] = tmp[0];
    for (int i = 0; i < num_blocks; i++)
        error_condition[0] = (tmp[i] > error_condition[0]) ? tmp[i] : error_condition[0];

    if (1 == *error_condition)
    {
        std::cerr << "Negative volume in PdV kernel" << std::endl;
    }
    else if (2 == *error_condition)
    {
        std::cerr << "Negative cell volume in PdV kernel" << std::endl;
    }
}
