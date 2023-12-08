

/***************************** Include Files *******************************/
#include "hdmi_text_controller.h"
#include "stdio.h"
#include "string.h"
#include "sleep.h"

/************************** Function Definitions ***************************/

void hdmiSetColor(int background, int foreground)
{
	hdmi_ctrl->CTRL = foreground << 13 |
					  background << 1;
}

void hdmiClr()
{
	for (int i = 0; i<(ROWS*COLUMNS); i++)
	{
		hdmi_ctrl->VRAM[i] = 0x00;
	}
}

int INPUT_RESET_POS = COLUMNS*4 + 14;
int ENCRYPT_RESET_POS = COLUMNS*13 + 14;
int DECRYPT_RESET_POS = COLUMNS*22 + 14;

int INPUT_CURR_POS;
int ENCRYPT_CURR_POS;
int DECRYPT_CURR_POS;

void INIT() {
	hdmiSetColor(BLACK, WHITE);
	char BLANK[] = "--------------------------------------------------------------------------------";
	char TITLE1[] = "----------------------------------TRIPPLE DES------------------------------------";
	char TITLE2[] = "----------------------------------FPGA REALIZE-----------------------------------";
	char INPUT_DATA[] =   "TYPE IN DATA $>";
	char ENCRYPT_DATA[] = "ENCRYPT DATA $>";
	char DECRYPT_DATA[] = "DECRYPT DATA $>";
	memcpy((void*)&hdmi_ctrl->VRAM[0],BLANK, sizeof(BLANK));
	memcpy((void*)&hdmi_ctrl->VRAM[COLUMNS],TITLE1, sizeof(TITLE1));
	memcpy((void*)&hdmi_ctrl->VRAM[COLUMNS*2],TITLE2, sizeof(TITLE2));
	memcpy((void*)&hdmi_ctrl->VRAM[COLUMNS*3],BLANK, sizeof(BLANK));
	memcpy((void*)&hdmi_ctrl->VRAM[COLUMNS*12],BLANK, sizeof(BLANK));
	memcpy((void*)&hdmi_ctrl->VRAM[COLUMNS*21],BLANK, sizeof(BLANK));
	memcpy((void*)&hdmi_ctrl->VRAM[COLUMNS*4],INPUT_DATA, sizeof(INPUT_DATA));
	memcpy((void*)&hdmi_ctrl->VRAM[COLUMNS*13],ENCRYPT_DATA, sizeof(ENCRYPT_DATA));
	memcpy((void*)&hdmi_ctrl->VRAM[COLUMNS*22],DECRYPT_DATA, sizeof(DECRYPT_DATA));

	INPUT_CURR_POS = INPUT_RESET_POS + 1;
	ENCRYPT_CURR_POS = ENCRYPT_RESET_POS + 1;
	DECRYPT_CURR_POS = DECRYPT_RESET_POS + 1;
}

void DOWRITE_INPUT(char input)
{
	memcpy((void*)&hdmi_ctrl->VRAM[INPUT_CURR_POS], &input, 1);
	INPUT_CURR_POS += 1;
}

void CLEAR_INPUT() {
	if (INPUT_CURR_POS == INPUT_RESET_POS) {
		return;
	}
	INPUT_CURR_POS -= 1;
	if (INPUT_CURR_POS == INPUT_RESET_POS) {
		return;
	}
	char input = ' ';
	memcpy((void*)&hdmi_ctrl->VRAM[INPUT_CURR_POS], &input, 1);
}
