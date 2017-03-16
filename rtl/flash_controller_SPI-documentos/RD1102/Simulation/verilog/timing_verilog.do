-- simulate the design
-- !!CHANGE THE PATH POINTING TO YOUR SDF FILE!!
vsim -L ovi_machxo2 -PL pmi_work +access +r spi_flash_wl_tb -noglitch +no_tchk_msg -sdfnoerror -sdfmax uut0="./spi_flash_controller_wl_top/spi_flash_controller_wl_top_spi_flash_controller_wl_top_vo.sdf"
add wave *
run -all

