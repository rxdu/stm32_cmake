/**
  ******************************************************************************
  * File Name          : SYS.c
  * Description        : This file provides code for the configuration
  *                      of the SYS instances.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2019 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "sys.h"

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/* SYS init function */
void MX_SYS_Init(void)
{

  /* Peripheral clock enable */
  LL_APB2_GRP1_EnableClock(LL_APB2_GRP1_PERIPH_AFIO);
  LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_PWR);

  /** NONJTRST: Full SWJ (JTAG-DP + SW-DP) but without NJTRST 
  */
  LL_GPIO_AF_Remap_SWJ_NONJTRST();

}

/* USER CODE BEGIN 1 */

/* USER CODE END 1 */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
