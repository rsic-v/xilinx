cmd_arch/arm/kernel/perf_event_v6.o := arm-linux-gnueabihf-gcc -Wp,-MD,arch/arm/kernel/.perf_event_v6.o.d  -nostdinc -isystem /home/alvin/petalinux2016.4/tools/linux-i386/gcc-arm-linux-gnueabi/bin/../lib/gcc/arm-linux-gnueabihf/5.2.1/include -I./arch/arm/include -I./arch/arm/include/generated/uapi -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -fno-dwarf2-cfi-asm -fno-ipa-sra -mabi=aapcs-linux -mno-thumb-interwork -mfpu=vfp -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-delete-null-pointer-checks -Os -Wno-maybe-uninitialized --param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector -Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -DCC_HAVE_ASM_GOTO    -DKBUILD_BASENAME='"perf_event_v6"'  -DKBUILD_MODNAME='"perf_event_v6"' -c -o arch/arm/kernel/.tmp_perf_event_v6.o arch/arm/kernel/perf_event_v6.c

source_arch/arm/kernel/perf_event_v6.o := arch/arm/kernel/perf_event_v6.c

deps_arch/arm/kernel/perf_event_v6.o := \
    $(wildcard include/config/cpu/v6.h) \
    $(wildcard include/config/cpu/v6k.h) \

arch/arm/kernel/perf_event_v6.o: $(deps_arch/arm/kernel/perf_event_v6.o)

$(deps_arch/arm/kernel/perf_event_v6.o):
