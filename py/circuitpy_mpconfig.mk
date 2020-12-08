#
# This file is part of the MicroPython project, http://micropython.org/
#
# The MIT License (MIT)
#
# SPDX-FileCopyrightText: Copyright (c) 2019 Dan Halbert for Adafruit Industries
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Boards default to all modules enabled (with exceptions)
# Manually disable by overriding in #mpconfigboard.mk

# Smaller builds can be forced for resource constrained chips (typically SAMD21s
# without external flash) by setting CIRCUITPY_FULL_BUILD=0. Avoid using this
# for merely incomplete ports, as it changes settings in other files.
CIRCUITPY_FULL_BUILD ?= 1
CFLAGS += -DCIRCUITPY_FULL_BUILD=$(CIRCUITPY_FULL_BUILD)

# async/await language keyword support
MICROPY_PY_ASYNC_AWAIT ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DMICROPY_PY_ASYNC_AWAIT=$(MICROPY_PY_ASYNC_AWAIT)

CIRCUITPY_AESIO ?= 0
CFLAGS += -DCIRCUITPY_AESIO=$(CIRCUITPY_AESIO)

# TODO: CIRCUITPY_ALARM will gradually be added to
# as many ports as possible
# so make this 1 or CIRCUITPY_FULL_BUILD eventually
CIRCUITPY_ALARM ?= 0
CFLAGS += -DCIRCUITPY_ALARM=$(CIRCUITPY_ALARM)

CIRCUITPY_ANALOGIO ?= 1
CFLAGS += -DCIRCUITPY_ANALOGIO=$(CIRCUITPY_ANALOGIO)

CIRCUITPY_AUDIOBUSIO ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_AUDIOBUSIO=$(CIRCUITPY_AUDIOBUSIO)

# Some boards have PDMIn but do not implement I2SOut.
CIRCUITPY_AUDIOBUSIO_I2SOUT ?= $(CIRCUITPY_AUDIOBUSIO)
CFLAGS += -DCIRCUITPY_AUDIOBUSIO_I2SOUT=$(CIRCUITPY_AUDIOBUSIO_I2SOUT)

CIRCUITPY_AUDIOIO ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_AUDIOIO=$(CIRCUITPY_AUDIOIO)

CIRCUITPY_AUDIOPWMIO ?= 0
CFLAGS += -DCIRCUITPY_AUDIOPWMIO=$(CIRCUITPY_AUDIOPWMIO)

ifndef CIRCUITPY_AUDIOCORE
ifeq ($(CIRCUITPY_AUDIOPWMIO),1)
CIRCUITPY_AUDIOCORE = $(CIRCUITPY_AUDIOPWMIO)
else
CIRCUITPY_AUDIOCORE = $(CIRCUITPY_AUDIOIO)
endif
endif
CFLAGS += -DCIRCUITPY_AUDIOCORE=$(CIRCUITPY_AUDIOCORE)

CIRCUITPY_AUDIOMIXER ?= $(CIRCUITPY_AUDIOIO)
CFLAGS += -DCIRCUITPY_AUDIOMIXER=$(CIRCUITPY_AUDIOMIXER)

ifndef CIRCUITPY_AUDIOMP3
ifeq ($(CIRCUITPY_FULL_BUILD),1)
CIRCUITPY_AUDIOMP3 = $(CIRCUITPY_AUDIOCORE)
else
CIRCUITPY_AUDIOMP3 = 0
endif
endif
CFLAGS += -DCIRCUITPY_AUDIOMP3=$(CIRCUITPY_AUDIOMP3)

CIRCUITPY_BITBANGIO ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_BITBANGIO=$(CIRCUITPY_BITBANGIO)

# _bleio can be supported on most any board via HCI
CIRCUITPY_BLEIO_HCI ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_BLEIO_HCI=$(CIRCUITPY_BLEIO_HCI)

# Explicitly enabled for boards that support _bleio.
CIRCUITPY_BLEIO ?= $(CIRCUITPY_BLEIO_HCI)
CFLAGS += -DCIRCUITPY_BLEIO=$(CIRCUITPY_BLEIO)

CIRCUITPY_BOARD ?= 1
CFLAGS += -DCIRCUITPY_BOARD=$(CIRCUITPY_BOARD)

CIRCUITPY_BUSDEVICE ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_BUSDEVICE=$(CIRCUITPY_BUSDEVICE)

CIRCUITPY_BUILTINS_POW3 ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_BUILTINS_POW3=$(CIRCUITPY_BUILTINS_POW3)

CIRCUITPY_BUSIO ?= 1
CFLAGS += -DCIRCUITPY_BUSIO=$(CIRCUITPY_BUSIO)

CIRCUITPY_CAMERA ?= 0
CFLAGS += -DCIRCUITPY_CAMERA=$(CIRCUITPY_CAMERA)

CIRCUITPY_CANIO ?= 0
CFLAGS += -DCIRCUITPY_CANIO=$(CIRCUITPY_CANIO)

CIRCUITPY_DIGITALIO ?= 1
CFLAGS += -DCIRCUITPY_DIGITALIO=$(CIRCUITPY_DIGITALIO)

CIRCUITPY_COUNTIO ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_COUNTIO=$(CIRCUITPY_COUNTIO)

CIRCUITPY_DISPLAYIO ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_DISPLAYIO=$(CIRCUITPY_DISPLAYIO)

# CIRCUITPY_ESPIDF is handled in the esp32s2 tree.
# Only for ESP32S chips.
# Assume not a ESP build.
CIRCUITPY_ESPIDF ?= 0
CFLAGS += -DCIRCUITPY_ESPIDF=$(CIRCUITPY_ESPIDF)

ifeq ($(CIRCUITPY_DISPLAYIO),1)
CIRCUITPY_FRAMEBUFFERIO ?= $(CIRCUITPY_FULL_BUILD)
else
CIRCUITPY_FRAMEBUFFERIO ?= 0
endif
CFLAGS += -DCIRCUITPY_FRAMEBUFFERIO=$(CIRCUITPY_FRAMEBUFFERIO)

CIRCUITPY_VECTORIO ?= $(CIRCUITPY_DISPLAYIO)
CFLAGS += -DCIRCUITPY_VECTORIO=$(CIRCUITPY_VECTORIO)

CIRCUITPY_FREQUENCYIO ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_FREQUENCYIO=$(CIRCUITPY_FREQUENCYIO)

CIRCUITPY_GAMEPAD ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_GAMEPAD=$(CIRCUITPY_GAMEPAD)

CIRCUITPY_GAMEPADSHIFT ?= 0
CFLAGS += -DCIRCUITPY_GAMEPADSHIFT=$(CIRCUITPY_GAMEPADSHIFT)

CIRCUITPY_GNSS ?= 0
CFLAGS += -DCIRCUITPY_GNSS=$(CIRCUITPY_GNSS)

CIRCUITPY_I2CPERIPHERAL ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_I2CPERIPHERAL=$(CIRCUITPY_I2CPERIPHERAL)

CIRCUITPY_IPADDRESS ?= $(CIRCUITPY_WIFI)
CFLAGS += -DCIRCUITPY_IPADDRESS=$(CIRCUITPY_IPADDRESS)

CIRCUITPY_MATH ?= 1
CFLAGS += -DCIRCUITPY_MATH=$(CIRCUITPY_MATH)

CIRCUITPY__EVE ?= 0
CFLAGS += -DCIRCUITPY__EVE=$(CIRCUITPY__EVE)

CIRCUITPY_MEMORYMONITOR ?= 0
CFLAGS += -DCIRCUITPY_MEMORYMONITOR=$(CIRCUITPY_MEMORYMONITOR)

CIRCUITPY_MICROCONTROLLER ?= 1
CFLAGS += -DCIRCUITPY_MICROCONTROLLER=$(CIRCUITPY_MICROCONTROLLER)

CIRCUITPY_NEOPIXEL_WRITE ?= 1
CFLAGS += -DCIRCUITPY_NEOPIXEL_WRITE=$(CIRCUITPY_NEOPIXEL_WRITE)

# Enabled on SAMD51. Won't fit on SAMD21 builds. Not tested on nRF or STM32F4 builds.
CIRCUITPY_NETWORK ?= 0
CFLAGS += -DCIRCUITPY_NETWORK=$(CIRCUITPY_NETWORK)

CIRCUITPY_NVM ?= 1
CFLAGS += -DCIRCUITPY_NVM=$(CIRCUITPY_NVM)

CIRCUITPY_OS ?= 1
CFLAGS += -DCIRCUITPY_OS=$(CIRCUITPY_OS)

CIRCUITPY_PIXELBUF ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_PIXELBUF=$(CIRCUITPY_PIXELBUF)

# Only for SAMD boards for the moment
CIRCUITPY_PS2IO ?= 0
CFLAGS += -DCIRCUITPY_PS2IO=$(CIRCUITPY_PS2IO)

CIRCUITPY_PULSEIO ?= 1
CFLAGS += -DCIRCUITPY_PULSEIO=$(CIRCUITPY_PULSEIO)

# For now we tie PWMIO to PULSEIO so they always both exist. In CircuitPython 7
# we can enable and disable them separately once PWMOut is removed from `pulseio`.
CIRCUITPY_PWMIO = $(CIRCUITPY_PULSEIO)
CFLAGS += -DCIRCUITPY_PWMIO=$(CIRCUITPY_PWMIO)

CIRCUITPY_RANDOM ?= 1
CFLAGS += -DCIRCUITPY_RANDOM=$(CIRCUITPY_RANDOM)

CIRCUITPY_RGBMATRIX ?= 0
CFLAGS += -DCIRCUITPY_RGBMATRIX=$(CIRCUITPY_RGBMATRIX)

CIRCUITPY_ROTARYIO ?= 1
CFLAGS += -DCIRCUITPY_ROTARYIO=$(CIRCUITPY_ROTARYIO)

CIRCUITPY_RTC ?= 1
CFLAGS += -DCIRCUITPY_RTC=$(CIRCUITPY_RTC)

# CIRCUITPY_SAMD is handled in the atmel-samd tree.
# Only for SAMD chips.
# Assume not a SAMD build.
CIRCUITPY_SAMD ?= 0
CFLAGS += -DCIRCUITPY_SAMD=$(CIRCUITPY_SAMD)

CIRCUITPY_SDCARDIO ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_SDCARDIO=$(CIRCUITPY_SDCARDIO)

CIRCUITPY_SDIOIO ?= 0
CFLAGS += -DCIRCUITPY_SDIOIO=$(CIRCUITPY_SDIOIO)

CIRCUITPY_SHARPDISPLAY ?= $(CIRCUITPY_FRAMEBUFFERIO)
CFLAGS += -DCIRCUITPY_SHARPDISPLAY=$(CIRCUITPY_SHARPDISPLAY)

CIRCUITPY_SOCKETPOOL ?= $(CIRCUITPY_WIFI)
CFLAGS += -DCIRCUITPY_SOCKETPOOL=$(CIRCUITPY_SOCKETPOOL)

CIRCUITPY_SSL ?= $(CIRCUITPY_WIFI)
CFLAGS += -DCIRCUITPY_SSL=$(CIRCUITPY_SSL)

# Currently always off.
CIRCUITPY_STAGE ?= 0
CFLAGS += -DCIRCUITPY_STAGE=$(CIRCUITPY_STAGE)

CIRCUITPY_STORAGE ?= 1
CFLAGS += -DCIRCUITPY_STORAGE=$(CIRCUITPY_STORAGE)

CIRCUITPY_STRUCT ?= 1
CFLAGS += -DCIRCUITPY_STRUCT=$(CIRCUITPY_STRUCT)

CIRCUITPY_SUPERVISOR ?= 1
CFLAGS += -DCIRCUITPY_SUPERVISOR=$(CIRCUITPY_SUPERVISOR)

CIRCUITPY_TERMINALIO ?= $(CIRCUITPY_DISPLAYIO)
CFLAGS += -DCIRCUITPY_TERMINALIO=$(CIRCUITPY_TERMINALIO)

CIRCUITPY_TIME ?= 1
CFLAGS += -DCIRCUITPY_TIME=$(CIRCUITPY_TIME)

# touchio might be native or generic. See circuitpy_defns.mk.
CIRCUITPY_TOUCHIO_USE_NATIVE ?= 0
CFLAGS += -DCIRCUITPY_TOUCHIO_USE_NATIVE=$(CIRCUITPY_TOUCHIO_USE_NATIVE)

CIRCUITPY_TOUCHIO ?= 1
CFLAGS += -DCIRCUITPY_TOUCHIO=$(CIRCUITPY_TOUCHIO)

# For debugging.
CIRCUITPY_UHEAP ?= 0
CFLAGS += -DCIRCUITPY_UHEAP=$(CIRCUITPY_UHEAP)

CIRCUITPY_USB_HID ?= 1
CFLAGS += -DCIRCUITPY_USB_HID=$(CIRCUITPY_USB_HID)

CIRCUITPY_USB_MIDI ?= 1
CFLAGS += -DCIRCUITPY_USB_MIDI=$(CIRCUITPY_USB_MIDI)

CIRCUITPY_PEW ?= 0
CFLAGS += -DCIRCUITPY_PEW=$(CIRCUITPY_PEW)

# For debugging.
CIRCUITPY_USTACK ?= 0
CFLAGS += -DCIRCUITPY_USTACK=$(CIRCUITPY_USTACK)

# Non-module conditionals

CIRCUITPY_BITBANG_APA102 ?= 0
CFLAGS += -DCIRCUITPY_BITBANG_APA102=$(CIRCUITPY_BITBANG_APA102)

# Should busio.I2C() check for pullups?
# Some boards in combination with certain peripherals may not want this.
CIRCUITPY_REQUIRE_I2C_PULLUPS ?= 1
CFLAGS += -DCIRCUITPY_REQUIRE_I2C_PULLUPS=$(CIRCUITPY_REQUIRE_I2C_PULLUPS)

# REPL over BLE
CIRCUITPY_SERIAL_BLE ?= 0
CFLAGS += -DCIRCUITPY_SERIAL_BLE=$(CIRCUITPY_SERIAL_BLE)

CIRCUITPY_BLE_FILE_SERVICE ?= 0
CFLAGS += -DCIRCUITPY_BLE_FILE_SERVICE=$(CIRCUITPY_BLE_FILE_SERVICE)

# REPL over UART
CIRCUITPY_SERIAL_UART ?= 0
CFLAGS += -DCIRCUITPY_SERIAL_UART=$(CIRCUITPY_SERIAL_UART)

# ulab numerics library
CIRCUITPY_ULAB ?= $(CIRCUITPY_FULL_BUILD)
CFLAGS += -DCIRCUITPY_ULAB=$(CIRCUITPY_ULAB)

# watchdog hardware support
CIRCUITPY_WATCHDOG ?= 0
CFLAGS += -DCIRCUITPY_WATCHDOG=$(CIRCUITPY_WATCHDOG)

CIRCUITPY_WIFI ?= 0
CFLAGS += -DCIRCUITPY_WIFI=$(CIRCUITPY_WIFI)

# Enabled micropython.native decorator (experimental)
CIRCUITPY_ENABLE_MPY_NATIVE ?= 0
CFLAGS += -DCIRCUITPY_ENABLE_MPY_NATIVE=$(CIRCUITPY_ENABLE_MPY_NATIVE)