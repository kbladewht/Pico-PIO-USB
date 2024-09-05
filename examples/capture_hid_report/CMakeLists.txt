
# set(PICO_DEFAULT_BOARD_rp2040 "pico_pi")

set(target_name capture_hid_report)
add_executable(${target_name} capture_hid_report.c)

# 定义 USBD_PRODUCT 宏
target_compile_definitions(${target_name} PRIVATE USBD_PRODUCT="PI_Quantizer_v1")


# pico_add_extra_outputs(capture_hid_report)
pico_enable_stdio_usb(${target_name} 1) 
pico_enable_stdio_uart(${target_name} 0) 

target_sources(${target_name} PRIVATE
 capture_hid_report.c
 )

# print memory usage, enable all warnings
target_link_options(${target_name} PRIVATE -Xlinker --print-memory-usage)
target_compile_options(${target_name} PRIVATE -Wall -Wextra)

target_link_libraries(${target_name} PRIVATE pico_stdlib pico_multicore pico_pio_usb)
pico_add_extra_outputs(${target_name})
