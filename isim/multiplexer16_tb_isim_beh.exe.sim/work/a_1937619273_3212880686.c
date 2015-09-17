/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//DISKSTATION/workspace/Xilinx/ALU/bitwise_xor16.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_1937619273_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    int t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;

LAB0:    xsi_set_current_line(44, ng0);
    t1 = (t0 + 4588);
    *((int *)t1) = 15;
    t2 = (t0 + 4592);
    *((int *)t2) = 0;
    t3 = 15;
    t4 = 0;

LAB2:    if (t3 >= t4)
        goto LAB3;

LAB5:    t1 = (t0 + 2832);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(45, ng0);
    t5 = (t0 + 1032U);
    t6 = *((char **)t5);
    t5 = (t0 + 4588);
    t7 = *((int *)t5);
    t8 = (t7 - 15);
    t9 = (t8 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t5));
    t10 = (1U * t9);
    t11 = (0 + t10);
    t12 = (t6 + t11);
    t13 = *((unsigned char *)t12);
    t14 = (t0 + 1192U);
    t15 = *((char **)t14);
    t14 = (t0 + 4588);
    t16 = *((int *)t14);
    t17 = (t16 - 15);
    t18 = (t17 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t14));
    t19 = (1U * t18);
    t20 = (0 + t19);
    t21 = (t15 + t20);
    t22 = *((unsigned char *)t21);
    t23 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t13, t22);
    t24 = (t0 + 4588);
    t25 = *((int *)t24);
    t26 = (t25 - 15);
    t27 = (t26 * -1);
    t28 = (1 * t27);
    t29 = (0U + t28);
    t30 = (t0 + 2912);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    *((unsigned char *)t34) = t23;
    xsi_driver_first_trans_delta(t30, t29, 1, 0LL);

LAB4:    t1 = (t0 + 4588);
    t3 = *((int *)t1);
    t2 = (t0 + 4592);
    t4 = *((int *)t2);
    if (t3 == t4)
        goto LAB5;

LAB6:    t7 = (t3 + -1);
    t3 = t7;
    t5 = (t0 + 4588);
    *((int *)t5) = t3;
    goto LAB2;

}


extern void work_a_1937619273_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1937619273_3212880686_p_0};
	xsi_register_didat("work_a_1937619273_3212880686", "isim/multiplexer16_tb_isim_beh.exe.sim/work/a_1937619273_3212880686.didat");
	xsi_register_executes(pe);
}
