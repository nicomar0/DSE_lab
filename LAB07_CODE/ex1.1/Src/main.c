#define MYWAIT 1000000*2
int main(void)
{
 //PORT REGISTERS
 volatile unsigned int *GPIOA_MODER = (unsigned int*) (0x40020000 + 0x00);
 volatile unsigned int *GPIOA_ODR = (unsigned int*) (0x40020000 + 0x14);
 //CLOCK REGISTERS
 volatile unsigned int *RCC_AHB1ENR = (unsigned int*) (0x40023800 + 0x30);

 volatile unsigned int *GPIOC_MODER = (unsigned int*) (0x40020000 + 0x0800);
 volatile unsigned int *GPIOC_IDR = (unsigned int*) (0x40020000 + 0x0800 + 0x10); //input!!

 //VARIABLES
 //ENABLE PORT CLOCK:
 // this ensure that the peripheral is enabled and connected to the AHB1 bus
 *RCC_AHB1ENR |= 0x05U;
 //CONFIGURE PORT: set MODER[11:10] = 0x1
 *GPIOA_MODER = *GPIOA_MODER | 0x400;
 *GPIOC_MODER = *GPIOC_MODER & 0xF3FFFFFF;
 //SWITCH ON THE LED: set ODR[5] = 0x1, that is pulls PA5 high
 *GPIOA_ODR = *GPIOA_ODR | 0x20;
 // Application code (Infinite loop)
 //					volatile unsigned int tmp = (0x0);
 while (1)
 {
	 //tmp=((*GPIOC_IDR & 0x2000)>>8);
 *GPIOA_ODR =  ( (*GPIOA_ODR & 0xFFDF) | ((*GPIOC_IDR & 0x2000)>>8));

 }
}
