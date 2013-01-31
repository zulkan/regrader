# Tests for configuration parser

Run:	../obj/ucw/shell/config -C/dev/null -S 'sec1{int1=23; long1=1234567812345678; long2=4321; str1="s1"; str2="s2"}' 'sec1 {#int1; ##long1; -str1; str2; #int2=123; ##long2=1234; #int3=0x10; #int4; $dbl1=001.100; $dbl2}; sec2{str3}'
Out:	CF_sec1_int1='23'
	CF_sec1_long1='1234567812345678'
	CF_sec1_str2='s2'
	CF_sec1_int2='123'
	CF_sec1_long2='4321'
	CF_sec1_int3='16'
	CF_sec1_int4='0'
	CF_sec1_dbl1='1.1'
	CF_sec1_dbl2='0'
	CF_sec2_str3=''

Run:	../obj/ucw/shell/config -C/dev/null -S 'sec1{list1 1 a1 b1; list1:clear; list1 2 a2 b2 3 a3 b3}' 'sec1 {@list1 {#int1; str1; -str2}}'
Out:	CF_sec1_list1_int1[1]='2'
	CF_sec1_list1_str1[1]='a2'
	CF_sec1_list1_int1[2]='3'
	CF_sec1_list1_str1[2]='a3'

Run:	../obj/ucw/shell/config -C/dev/null -S 'sec1{ar1 a b c d; ar1 a b c; ar2 1 2; ar3 1.1}' 'sec1 {ar1[]; #ar2[2]; $ar3[-2]}'
Out:	CF_sec1_ar1[1]='a'
	CF_sec1_ar1[2]='b'
	CF_sec1_ar1[3]='c'
	CF_sec1_ar2[1]='1'
	CF_sec1_ar2[2]='2'
	CF_sec1_ar3[1]='1.1'

Run:	../obj/ucw/shell/config -C/dev/null -S 'sec1{list1 {str1=1; list2=a b c}; list1 {str1=2; list2=d e}}' 'sec1 {@list1 {str1; @list2{str2}}}'
Out:	CF_sec1_list1_str1[1]='1'
	CF_sec1_list1_list2_str2[1]='a'
	CF_sec1_list1_list2_str2[2]='b'
	CF_sec1_list1_list2_str2[3]='c'
	CF_sec1_list1_str1[2]='2'
	CF_sec1_list1_list2_str2[4]='d'
	CF_sec1_list1_list2_str2[5]='e'

Run:	../obj/ucw/shell/config -C/dev/null 'sec{str=a'\''b"c'\''d"\\e'\''f"g}'
Out:	CF_sec_str='ab"cd\e'\''fg'
