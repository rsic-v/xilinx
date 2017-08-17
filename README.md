# xilinx
Dual Microchip KSZ9031 PHY Ethernet problem for ZYNQ

 							        Alvin.lu@avnet.com
                                                                2017.8.17

The problem is dual ethernet phy shared mdio,and only one ethernet can works.

Patch is applicable ONLY to the 2017.2 kernel 

Now do as follows:
 

1.checkout, patch, and build 2017.2 kernel

 
$ git clone --branch xilinx-v2017.2 --depth 1 https://github.com/Xilinx/linux-xlnx.git

$ cd linux-xlnx

$ git apply 0001-net-macb-Add-MDIO-driver-for-accessing-multiple-PHY.patch

$ make ARCH=arm xilinx_zynq_defconfig

$ make ARCH=arm UIMAGE_LOADADDR=0x8000 uImage  -j4



2. modify your device tree file as follows:

2a. Add mdio in the top level:

/ {

        cpus {

                cpu@0 { 

                        operating-points = <500000 1000000 250000 1000000>;

                };

        };

        chosen {

                bootargs = "console=ttyPS0,115200";

        };

        aliases {

                ethernet0 = &gem0;

                ethernet1 = &gem1;

                serial0 = &uart0;

                serial1 = &axi_uart16550_2;

                spi0 = &qspi;

        };

        memory {

                device_type = "memory";

                reg = <0x0 0x40000000>;

        };



         mdio {

         compatible = "cdns,macb-mdio";

         reg = <0xe000b000 0x1000>;

         clocks = <&clkc 30>, <&clkc 30>, <&clkc 13>;

         clock-names = "pclk", "hclk", "tx_clk";

         #address-cells = <1>;

         #size-cells = <0>;

         phy0: phy@3 {

              device_type = "ethernet-phy";

              reg = <3>;

                    } ;

         phy1: phy@7 {

              device_type = "ethernet-phy";

              reg = <7>;

                    } ;

       };

};



2b. Add the phy handle to the gem sections:

&gem0 {


        local-mac-address = [00 0a 35 00 00 00];

        phy-mode = "rgmii-id";

        status = "okay";

        xlnx,ptp-enet-clock = <0x4f790d8>;

        phy-handle = <&phy0>;

};



&gem1 {

        local-mac-address = [00 0a 35 00 00 05];

        phy-mode = "rgmii-id";

        status = "okay";

        xlnx,ptp-enet-clock = <0x4f790d8>;

        phy-handle = <&phy1>;

};



3. Build the device tree blob, and copy uImage and the .dtb file to your boot partition.

$  dtc -I dts -O dtb -o system.dtb system.dts






Tips:

1.

Both controllers provide MDIO interfaces, however, only one interface is needed to control both of the external PHYs.

MDIO bus supports multiple slaves. Make sure the two PHY devices have different PHY addresses. (Some of the PHY devices can support PHY address configurable).

Connect one MDIO to MIO 52 53 in Zynq Configuration GUI, leave the other MDIO unconnected. 

Connect Zynq MDIO pins and two PHY devices as one master and two slaves on board.



2.

The patch is availble for both zynq and MPSOC.

3.

The patch is availble for other ethernet phy devices.

4.

You can download  dts and kernel source code from my gitgub

git clone git@github.com:alvin-luhao/xilinx.git



5.
You should not add ( "compatible = "micrel,ksz9031") to the devicetree.Otherwise,the error log as "can not find the phy device" will appear.

6.
I have already patched for linux-xlnx.You don't have to do it again.
