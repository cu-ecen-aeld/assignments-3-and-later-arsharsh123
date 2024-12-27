CC := gcc
CFLAGS := -Wall -Werror
CROSS_COMPILE ?=
TARGET := writer

all: $(TARGET)

$(TARGET): $(TARGET).o
	$(CROSS_COMPILE)$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CROSS_COMPILE)$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) *.o
