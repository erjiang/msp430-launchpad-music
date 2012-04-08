CC = msp430-gcc
CFLAGS = -Os -Wall -g -mmcu=msp430x2012
OBJCOPY = msp430-objcopy

OBJS = music.o player.o

all: msp430-music.hex 

%.hex: %.elf
	$(OBJCOPY) -O ihex $< $@

msp430-music.elf: $(OBJS)
	$(CC) $(CFLAGS) -o msp430-music.elf $(OBJS)

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f msp430-music.hex $(OBJS)
