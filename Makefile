obj-m := cow.o
cow-objs := \
	safe3.o 
	
MODULE_SOURCES := \
	safe3.c 
	
CC = gcc -Wall 
KDIR := /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

686:
	$(MAKE) ARCH=x86 EXTRA_CFLAGS="-D_CONFIG_X86_ ${MODULES}" -C $(KDIR) M=$(PWD) modules

clean:

ifndef KDIR
	@echo "Must provide KDIR!"
	@exit 1
endif
	$(MAKE) -C $(KDIR) M=$(PWD) clean
