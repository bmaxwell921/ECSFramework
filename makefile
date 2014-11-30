# Various locations for files
SRC_DIR=./src
INCLUDE_DIR=./include

# This is where the compiled library will go
LIBRARY=lib/ecs.a

# -I tells compiler to look in ./include directory for .hpp files
CXX_FLAGS=-g $(shell root-config --cflags) -I$(INCLUDE_DIR)
LD_FLAGS=-g $(shell root-config --ldflags)
LD_LIBS=$(shell root-config --libs)

# Setting up generic parameters. Apparently recusing thru the source tree is bad tho...
SRCS=$(wildcard $(SRC_DIR)/**/*.cpp)

# I'm going to put all the object files in the src directory since I'm having issues getting make to find the files otherwise
OBJS=$(wildcard $(SRC_DIR/**/*.o)

# All creates the library
all: $(LIBRARY)

# Creates the .a file, which is the library. Needs the obj dir and files to exist
$(LIBRARY): $(OBJ_DIR) $(OBJS)
	ar rcs $(OUT_DIR) $(OBJS)

$(OBJ_DIR):
	mkdir $(OBJ_DIR)

# Some crazy stuff I found on StackoverFlow to magically get all .o files
# stackoverflow.com/questions/2481269
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CXX_FLAGS) -c $< -o $@

clean:
	find $(SRC_DIR) -name "*.o" -exec rm {} \;