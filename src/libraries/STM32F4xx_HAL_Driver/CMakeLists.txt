set(STM32F4_HAL_SRC
    Src/stm32f4xx_hal.c
    Src/stm32f4xx_hal_adc.c
    Src/stm32f4xx_hal_adc_ex.c
    Src/stm32f4xx_hal_can.c
    Src/stm32f4xx_hal_cec.c
    Src/stm32f4xx_hal_cortex.c
    Src/stm32f4xx_hal_crc.c
    Src/stm32f4xx_hal_cryp.c
    Src/stm32f4xx_hal_cryp_ex.c
    Src/stm32f4xx_hal_dac.c
    Src/stm32f4xx_hal_dac_ex.c
    Src/stm32f4xx_hal_dcmi.c
    Src/stm32f4xx_hal_dcmi_ex.c
    Src/stm32f4xx_hal_dfsdm.c
    Src/stm32f4xx_hal_dma.c
    Src/stm32f4xx_hal_dma2d.c
    Src/stm32f4xx_hal_dma_ex.c
    Src/stm32f4xx_hal_dsi.c
    Src/stm32f4xx_hal_eth.c
    Src/stm32f4xx_hal_exti.c
    Src/stm32f4xx_hal_flash.c
    Src/stm32f4xx_hal_flash_ex.c
    Src/stm32f4xx_hal_flash_ramfunc.c
    Src/stm32f4xx_hal_fmpi2c.c
    Src/stm32f4xx_hal_fmpi2c_ex.c
    Src/stm32f4xx_hal_gpio.c
    Src/stm32f4xx_hal_hash.c
    Src/stm32f4xx_hal_hash_ex.c
    Src/stm32f4xx_hal_hcd.c
    Src/stm32f4xx_hal_i2c.c
    Src/stm32f4xx_hal_i2c_ex.c
    Src/stm32f4xx_hal_i2s.c
    Src/stm32f4xx_hal_i2s_ex.c
    Src/stm32f4xx_hal_irda.c
    Src/stm32f4xx_hal_iwdg.c
    Src/stm32f4xx_hal_lptim.c
    Src/stm32f4xx_hal_ltdc.c
    Src/stm32f4xx_hal_ltdc_ex.c
    Src/stm32f4xx_hal_mmc.c
    Src/stm32f4xx_hal_nand.c
    Src/stm32f4xx_hal_nor.c
    Src/stm32f4xx_hal_pccard.c
    Src/stm32f4xx_hal_pcd.c
    Src/stm32f4xx_hal_pcd_ex.c
    Src/stm32f4xx_hal_pwr.c
    Src/stm32f4xx_hal_pwr_ex.c
    Src/stm32f4xx_hal_qspi.c
    Src/stm32f4xx_hal_rcc.c
    Src/stm32f4xx_hal_rcc_ex.c
    Src/stm32f4xx_hal_rng.c
    Src/stm32f4xx_hal_rtc.c
    Src/stm32f4xx_hal_rtc_ex.c
    Src/stm32f4xx_hal_sai.c
    Src/stm32f4xx_hal_sai_ex.c
    Src/stm32f4xx_hal_sd.c
    Src/stm32f4xx_hal_sdram.c
    Src/stm32f4xx_hal_smartcard.c
    Src/stm32f4xx_hal_smbus.c
    Src/stm32f4xx_hal_spdifrx.c
    Src/stm32f4xx_hal_spi.c
    Src/stm32f4xx_hal_sram.c
    Src/stm32f4xx_hal_tim.c
    Src/stm32f4xx_hal_tim_ex.c
    Src/stm32f4xx_hal_uart.c
    Src/stm32f4xx_hal_usart.c
    Src/stm32f4xx_hal_wwdg.c
    Src/stm32f4xx_ll_sdmmc.c
    Src/stm32f4xx_ll_fmc.c
    Src/stm32f4xx_ll_fsmc.c
    Src/stm32f4xx_ll_usb.c
)
set(STM32F4_LL_SRC
    Src/stm32f4xx_ll_adc.c
    Src/stm32f4xx_ll_crc.c
    Src/stm32f4xx_ll_dac.c
    Src/stm32f4xx_ll_dma.c
    Src/stm32f4xx_ll_dma2d.c
    Src/stm32f4xx_ll_exti.c
    Src/stm32f4xx_ll_gpio.c
    Src/stm32f4xx_ll_i2c.c
    Src/stm32f4xx_ll_lptim.c
    Src/stm32f4xx_ll_pwr.c
    Src/stm32f4xx_ll_rcc.c
    Src/stm32f4xx_ll_rng.c
    Src/stm32f4xx_ll_rtc.c
    Src/stm32f4xx_ll_spi.c
    Src/stm32f4xx_ll_tim.c
    Src/stm32f4xx_ll_usart.c
    Src/stm32f4xx_ll_utils.c
)

# FMC/FSMC only defined for some F4 families
# if (DEVICE_FAMILY STREQUAL STM32F427_437xx OR DEVICE_FAMILY STREQUAL STM32F429_439xx OR DEVICE_FAMILY STREQUAL STM32F446xx OR DEVICE_FAMILY STREQUAL STM32F469_479xx)
#   set(sources ${sources} Src/stm32f4xx_fmc.c)
# else()
#   set(sources ${sources} Src/stm32f4xx_fsmc.c)
# endif()

if(USE_HAL_LIB)
set(STM32F4_LIB_SRC ${STM32F4_HAL_SRC} ${STM32F4_LL_SRC})
else()
set(STM32F4_LIB_SRC ${STM32F4_LL_SRC})
endif()

add_library(stm32f4xx_hal ${STM32F4_LIB_SRC})
if(USE_LL_LIB)
    target_compile_definitions(stm32f4xx_hal PUBLIC -DUSE_FULL_LL_DRIVER)
endif()
if(USE_HAL_LIB)
    target_compile_definitions(stm32f4xx_hal PUBLIC -DUSE_HAL_DRIVER)
endif()
target_link_libraries(stm32f4xx_hal PUBLIC cmsis)
target_include_directories(stm32f4xx_hal PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Inc>
  PRIVATE Src)
