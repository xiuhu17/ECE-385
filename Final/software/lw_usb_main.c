#include <stdio.h>
#include "platform.h"
#include "lw_usb/GenericMacros.h"
#include "lw_usb/GenericTypeDefs.h"
#include "lw_usb/MAX3421E.h"
#include "lw_usb/USB.h"
#include "lw_usb/usb_ch9.h"
#include "lw_usb/transfer.h"
#include "lw_usb/HID.h"
#include "hdmi_text_controller.h"

#include "xparameters.h"
#include <xgpio.h>

extern HID_DEVICE hid_device;

static XGpio Gpio_hex;

static BYTE addr = 1; 				//hard-wired USB address
const char* const devclasses[] = { " Uninitialized", " HID Keyboard", " HID Mouse", " Mass storage" };

BYTE GetDriverandReport() {
	BYTE i;
	BYTE rcode;
	BYTE device = 0xFF;
	BYTE tmpbyte;

	DEV_RECORD* tpl_ptr;
	xil_printf("Reached USB_STATE_RUNNING (0x40)\n");
	for (i = 1; i < USB_NUMDEVICES; i++) {
		tpl_ptr = GetDevtable(i);
		if (tpl_ptr->epinfo != NULL) {
			xil_printf("Device: %d", i);
			xil_printf("%s \n", devclasses[tpl_ptr->devclass]);
			device = tpl_ptr->devclass;
		}
	}
	//Query rate and protocol
	rcode = XferGetIdle(addr, 0, hid_device.interface, 0, &tmpbyte);
	if (rcode) {   //error handling
		xil_printf("GetIdle Error. Error code: ");
		xil_printf("%x \n", rcode);
	} else {
		xil_printf("Update rate: ");
		xil_printf("%x \n", tmpbyte);
	}
	xil_printf("Protocol: ");
	rcode = XferGetProto(addr, 0, hid_device.interface, &tmpbyte);
	if (rcode) {   //error handling
		xil_printf("GetProto Error. Error code ");
		xil_printf("%x \n", rcode);
	} else {
		xil_printf("%d \n", tmpbyte);
	}
	return device;
}

void printHex (u32 data, unsigned channel)
{
	XGpio_DiscreteWrite (&Gpio_hex, channel, data);
}


uint32_t* encrypt0 = XPAR_READ_ENCRYPT_0_BASEADDR;
uint32_t* encrypt1 = XPAR_READ_ENCRYPT_1_BASEADDR;
uint32_t* decrypt0 = XPAR_READ_DECRYPT_0_BASEADDR;
uint32_t* decrypt1 = XPAR_READ_DECRYPT_1_BASEADDR;


unsigned char buffer[64];
unsigned char store[8]; // input: store[0] ----> store[7]
unsigned char store_encrypt[8];
unsigned char store_decrypt[8];

char MAP(unsigned char a) {
	if (a >= 4 && a <= 29) {
		return a + 61;
	} else if (a == 39) {
		return 48;
	} else if (a >= 30 && a <= 38) {
		return a + 19;
	} else if (a == 44) {
		return 32;
	}

	return a % 128;
}

void Parser() {
	printHex(store[0] + (store[1]<<8) + (store[2]<<16) + + (store[3]<<24), 1);
	printHex(store[4] + (store[5]<<8) + (store[6]<<16) + + (store[7]<<24), 2);

	uint32_t en0 = *encrypt0;
	uint32_t en1 = *encrypt1;
	uint32_t de0 = *decrypt0;
	uint32_t de1 = *decrypt1;

	store_encrypt[7] = (en1 & 0xff000000) >> 24;
	store_encrypt[6] = (en1 & 0x00ff0000) >> 16;
	store_encrypt[5] = (en1 & 0x0000ff00) >> 8;
	store_encrypt[4] = (en1 & 0x000000ff);
	store_encrypt[3] = (en0 & 0xff000000) >> 24;
	store_encrypt[2] = (en0 & 0x00ff0000) >> 16;
	store_encrypt[1] = (en0 & 0x0000ff00) >> 8;
	store_encrypt[0] = (en0 & 0x000000ff);

	store_decrypt[7] = (de1 & 0xff000000) >> 24;
	store_decrypt[6] = (de1 & 0x00ff0000) >> 16;
	store_decrypt[5] = (de1 & 0x0000ff00) >> 8;
	store_decrypt[4] = (de1 & 0x000000ff);
	store_decrypt[3] = (de0 & 0xff000000) >> 24;
	store_decrypt[2] = (de0 & 0x00ff0000) >> 16;
	store_decrypt[1] = (de0 & 0x0000ff00) >> 8;
	store_decrypt[0] = (de0 & 0x000000ff);
}

int main() {
	//////////////////////////////////////////////////////////
	// need a map for translation
	//////////////////////////////////////////////////////////
    init_platform();
    XGpio_Initialize(&Gpio_hex, XPAR_GPIO_USB_KEYCODE_DEVICE_ID);
   	XGpio_SetDataDirection(&Gpio_hex, 1, 0x00000000); //configure hex display GPIO
   	XGpio_SetDataDirection(&Gpio_hex, 2, 0x00000000); //configure hex display GPIO


   	BYTE rcode;
	BOOT_MOUSE_REPORT buf;		//USB mouse report
	BOOT_KBD_REPORT kbdbuf;

	BYTE runningdebugflag = 0;//flag to dump out a bunch of information when we first get to USB_STATE_RUNNING
	BYTE errorflag = 0; //flag once we get an error device so we don't keep dumping out state info
	BYTE device;
	int idx = 0;

	xil_printf("initializing MAX3421E...\n");
	MAX3421E_init();
	xil_printf("initializing USB...\n");
	USB_init();
	INIT();

	while (1) {
		xil_printf("."); //A tick here means one loop through the USB main handler
		MAX3421E_Task();
		USB_Task();
		if (GetUsbTaskState() == USB_STATE_RUNNING) {
			if (!runningdebugflag) {
				runningdebugflag = 1;
				device = GetDriverandReport();
			} else if (device == 1) {
				//run keyboard debug polling
				rcode = kbdPoll(&kbdbuf);
				if (rcode == hrNAK) {
					continue; //NAK means no new data
				} else if (rcode) {
					xil_printf("Rcode: ");
					xil_printf("%x \n", rcode);
					continue;
				}


				if (kbdbuf.keycode[0] == 40) {
					// do action
					// if double enter, then clear
				} else if (kbdbuf.keycode[0] == 42) {
					CLEAR_INPUT();
				} else {
					if ((kbdbuf.keycode[0] >= 4 && kbdbuf.keycode[0] <= 29) || (kbdbuf.keycode[0] >= 30 && kbdbuf.keycode[0] <= 39) || ((kbdbuf.keycode[0] == 44)))
						DOWRITE_INPUT(MAP(kbdbuf.keycode[0]));
				}

//				if (idx == 8) {
//					xil_printf("Data Collected is: ");
//					for (int i = 0; i < 8; i++) {
//						xil_printf("%x ", store[i]);
//					}
//
//					xil_printf("----------------------\n");
//					idx = 0;
//					Parser();
//
//					for (int i = 0; i < 8; i++) {
//						xil_printf("%x ", store_encrypt[i]);
//					}
//					xil_printf("----------------------\n");
//
//					for (int i = 0; i < 8; i++) {
//						xil_printf("%x ", store_decrypt[i]);
//					}
//					xil_printf("----------------------\n");
//				} else {
//					if (kbdbuf.keycode[0] != 0 && kbdbuf.keycode[0] != 1 && kbdbuf.keycode[0] != 2 && kbdbuf.keycode[0] != 3) {
//						store[idx] = kbdbuf.keycode[0];
//						idx += 1;
//					}
//				}
//				//Modify to output the last 2 keycodes on channel 2.
//				// xil_printf("\n");
//				xil_printf("----- Still collecting data ------\n");
			}

			else if (device == 2) {
				rcode = mousePoll(&buf);
				if (rcode == hrNAK) {
					//NAK means no new data
					continue;
				} else if (rcode) {
					xil_printf("Rcode: ");
					xil_printf("%x \n", rcode);
					continue;
				}
				xil_printf("X displacement: ");
				xil_printf("%d ", (signed char) buf.Xdispl);
				xil_printf("Y displacement: ");
				xil_printf("%d ", (signed char) buf.Ydispl);
				xil_printf("Buttons: ");
				xil_printf("%x\n", buf.button);
			}
		} else if (GetUsbTaskState() == USB_STATE_ERROR) {
			if (!errorflag) {
				errorflag = 1;
				xil_printf("USB Error State\n");
				//print out string descriptor here
			}
		} else //not in USB running state
		{

			xil_printf("USB task state: ");
			xil_printf("%x\n", GetUsbTaskState());
			if (runningdebugflag) {	//previously running, reset USB hardware just to clear out any funky state, HS/FS etc
				runningdebugflag = 0;
				MAX3421E_init();
				USB_init();
			}
			errorflag = 0;
		}

	}
    cleanup_platform();
	return 0;
}
