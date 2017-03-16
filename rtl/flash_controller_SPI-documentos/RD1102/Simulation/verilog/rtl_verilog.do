-- Simulate the design
-- You may specify your waveforms
vsim -L ovi_machxo2 -PL pmi_work +access +r spi_flash_wl_tb
add wave *
run -all

