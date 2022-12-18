#
# Makefile for libcf
#
# This lives at https://github.com/codefool/libcf
#
INC_DIR := ./include
SRC_DIR := ./src
OBJ_DIR := ./obj
LIB_NAME := libcf

SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

CC := g++
CFLAGS := -g -std=c++2a -I$(INC_DIR)
ARC := ar
AFLAGS := rvs

$(LIB_NAME) : $(OBJ)
	$(ARC) $(AFLAGS) $@ $(OBJ)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp $(INC_DIR)/%.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm $(OBJ_DIR)/*.o $(LIB_NAME)

.PHONY : test

test:
	$(CC) $(CFLAGS) ./test/dstack_test.cpp -I. -L/usr/lib/x86_64-linux-gnu libcf -o dstack_test
