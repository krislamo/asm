.PHONY: all clean

SRC := $(wildcard *.asm)
OBJDIR := build
OBJS := $(SRC:%.asm=$(OBJDIR)/%.o)
BINS := $(SRC:%.asm=$(OBJDIR)/%)

all: $(BINS)

$(OBJDIR)/%: $(OBJDIR)/%.o
	ld -m elf_i386 $< -o $@

$(OBJDIR)/%.o: %.asm
	mkdir -p $(OBJDIR)
	nasm -f elf $< -o $@

clean:
	rm -rf $(OBJDIR)
