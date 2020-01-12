set(STM32F1_HAL_SRC
    Src/stm32f1xx_hal.c
    Src/stm32f1xx_hal_adc.c
    Src/stm32f1xx_hal_adc_ex.c
    Src/stm32f1xx_hal_can.c
    Src/stm32f1xx_hal_cec.c
    Src/stm32f1xx_hal_cortex.c
    Src/stm32f1xx_hal_crc.c
    Src/stm32f1xx_hal_dac.c
    Src/stm32f1xx_hal_dac_ex.c
    Src/stm32f1xx_hal_dma.c
    Src/stm32f1xx_hal_eth.c
    Src/stm32f1xx_hal_exti.c
    Src/stm32f1xx_hal_flash.c
    Src/stm32f1xx_hal_flash_ex.c
    Src/stm32f1xx_hal_gpio.c
    Src/stm32f1xx_hal_gpio_ex.c
    Src/stm32f1xx_hal_hcd.c
    Src/stm32f1xx_hal_i2c.c
    Src/stm32f1xx_hal_i2s.c
    Src/stm32f1xx_hal_irda.c
    Src/stm32f1xx_hal_iwdg.c
    Src/stm32f1xx_hal_mmc.c
    # Src/stm32f1xx_hal_msp_template.c
    Src/stm32f1xx_hal_nand.c
    Src/stm32f1xx_hal_nor.c
    Src/stm32f1xx_hal_pccard.c
    Src/stm32f1xx_hal_pcd.c
    Src/stm32f1xx_hal_pcd_ex.c
    Src/stm32f1xx_hal_pwr.c
    Src/stm32f1xx_hal_rcc.c
    Src/stm32f1xx_hal_rcc_ex.c
    Src/stm32f1xx_hal_rtc.c
    Src/stm32f1xx_hal_rtc_ex.c
    Src/stm32f1xx_hal_sd.c
    Src/stm32f1xx_hal_smartcard.c
    Src/stm32f1xx_hal_spi.c
    Src/stm32f1xx_hal_sram.c
    Src/stm32f1xx_hal_tim.c
    # Src/stm32f1xx_hal_timebase_rtc_alarm_template.c
    # Src/stm32f1xx_hal_timebase_tim_template.c
    Src/stm32f1xx_hal_tim_ex.c
    Src/stm32f1xx_hal_uart.c
    Src/stm32f1xx_hal_usart.c
    Src/stm32f1xx_hal_wwdg.c
    Src/stm32f1xx_ll_usb.c
    Src/stm32f1xx_ll_sdmmc.c
)
set(STM32F1_LL_SRC
    Src/stm32f1xx_ll_adc.c
    Src/stm32f1xx_ll_crc.c
    Src/stm32f1xx_ll_dac.c
    Src/stm32f1xx_ll_dma.c
    Src/stm32f1xx_ll_exti.c
    Src/stm32f1xx_ll_gpio.c
    Src/stm32f1xx_ll_i2c.c
    Src/stm32f1xx_ll_pwr.c
    Src/stm32f1xx_ll_rcc.c
    Src/stm32f1xx_ll_rtc.c
    Src/stm32f1xx_ll_spi.c
    Src/stm32f1xx_ll_tim.c
    Src/stm32f1xx_ll_usart.c
    Src/stm32f1xx_ll_utils.c
)

if(USE_HAL_LIB)
set(STM32F1_LIB_SRC ${STM32F1_HAL_SRC} ${STM32F1_LL_SRC})
else()
set(STM32F1_LIB_SRC ${STM32F1_LL_SRC})
endif()

add_library(stm32f1xx_hal ${STM32F1_LIB_SRC})
if(USE_LL_LIB)
    target_compile_definitions(stm32f1xx_hal PUBLIC -DUSE_FULL_LL_DRIVER)
endif()
if(USE_HAL_LIB)
    target_compile_definitions(stm32f1xx_hal PUBLIC -DUSE_HAL_DRIVER)
endif()
target_link_libraries(stm32f1xx_hal PUBLIC cmsis)
target_include_directories(stm32f1xx_hal PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/Inc>
  PRIVATE Src)
