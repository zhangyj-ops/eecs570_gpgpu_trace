# Compiler options
CXX = nvcc
CXXFLAGS =

## Autoconf configuration
ACLOCAL_AMFLAGS = -I m4
OCELOT_LIBS = $(OCELOT_LDFLAGS)

# Source files
LEUKOCYTE_SOURCES = \
    tests/leukocyte/detect_main.c \
    tests/leukocyte/avilib.c \
    tests/leukocyte/find_ellipse.c \
    tests/leukocyte/find_ellipse_kernel.cu.cpp \
    tests/leukocyte/track_ellipse.c \
    tests/leukocyte/track_ellipse_kernel.cu.cpp \
    tests/leukocyte/misc_math.c \
    tests/leukocyte/copy.c \
    tests/leukocyte/err.c \
    tests/leukocyte/matrixio.c \
    tests/leukocyte/memory.c \
    tests/leukocyte/vecop.c \
    tests/leukocyte/matop.c \
    tests/leukocyte/pxop.c \
    tests/leukocyte/submat.c \
    tests/leukocyte/init.c \
    tests/leukocyte/otherio.c \
    tests/leukocyte/machine.c \
    tests/leukocyte/matlab.c \
    tests/leukocyte/ivecop.c \
    tests/leukocyte/version.c \
    tests/leukocyte/meminfo.c \
    tests/leukocyte/memstat.c \
    tests/leukocyte/lufactor.c \
    tests/leukocyte/bkpfacto.c \
    tests/leukocyte/chfactor.c \
    tests/leukocyte/qrfactor.c \
    tests/leukocyte/solve.c \
    tests/leukocyte/hsehldr.c \
    tests/leukocyte/givens.c \
    tests/leukocyte/update.c \
    tests/leukocyte/norm.c \
    tests/leukocyte/hessen.c \
    tests/leukocyte/symmeig.c \
    tests/leukocyte/schur.c \
    tests/leukocyte/svd.c \
    tests/leukocyte/fft.c \
    tests/leukocyte/mfunc.c \
    tests/leukocyte/bdfactor.c \
    tests/leukocyte/sparse.c \
    tests/leukocyte/sprow.c \
    tests/leukocyte/sparseio.c \
    tests/leukocyte/spchfctr.c \
    tests/leukocyte/splufctr.c \
    tests/leukocyte/spbkp.c \
    tests/leukocyte/spswap.c \
    tests/leukocyte/iter0.c \
    tests/leukocyte/itersym.c \
    tests/leukocyte/iternsym.c \
    tests/leukocyte/zmachine.c \
    tests/leukocyte/zcopy.c \
    tests/leukocyte/zmatio.c \
    tests/leukocyte/zmemory.c \
    tests/leukocyte/zvecop.c \
    tests/leukocyte/zmatop.c \
    tests/leukocyte/znorm.c \
    tests/leukocyte/zfunc.c \
    tests/leukocyte/zlufctr.c \
    tests/leukocyte/zsolve.c \
    tests/leukocyte/zmatlab.c \
    tests/leukocyte/zhsehldr.c \
    tests/leukocyte/zqrfctr.c \
    tests/leukocyte/zgivens.c \
    tests/leukocyte/zhessen.c \
    tests/leukocyte/zschur.c

# Output directory
OUTPUT_DIR = /gpuocelot/tests/rodinia/out

# Executable name
LEUKOCYTE_EXECUTABLE = $(OUTPUT_DIR)/leukocyte

.PHONY: all clean run

# Default target
all: $(LEUKOCYTE_EXECUTABLE)

# Compile the leukocyte executable
$(LEUKOCYTE_EXECUTABLE): $(LEUKOCYTE_SOURCES)
	mkdir -p $(OUTPUT_DIR)
	nvcc --cubin --ptxas-options=-v -arch sm_20 $(LEUKOCYTE_SOURCES)
	# nvcc -o ./out/leukocyte `OcelotConfig -l` -locelotTrace $(LEUKOCYTE_SOURCES)

# Clean the build artifacts
clean:
	rm -rf $(OUTPUT_DIR)

# Run the leukocyte benchmark
run: $(LEUKOCYTE_EXECUTABLE)
	$(LEUKOCYTE_EXECUTABLE)
