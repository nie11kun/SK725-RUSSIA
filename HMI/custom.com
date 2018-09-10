;================================================================================================================
;V05.03.01 11.10.
;================================================================================================================
;* V05.01.01F 27.05.99  Msr  
;* Pictures area Parameter for ISO-dialect
;================================================================================================================


//S(Start)
DEF Picture4=(S///,"\\HJ2.png",,/wr1///100,200,400,200/0,0,0,0//),
HS7=($85000,se1) ;Access level 7, visible	"汉江界面"	
PRESS(HS7)   
LM("Mask1")  ;Load mask "Mask 1"
END_PRESS


			
//END

;到屏幕上方最小距离30，小于将不显示！记事本原来字体：Fixedsys
;到屏幕下方超过290显示不正常，！

;MASK1:基本数据1 /////////////////////////////////////////////////////////////////////////
//M(Mask1/$85001/)

;;;左上各轴实时坐标显示
DEF Edit10=(R4///,"X Position [mm]",,/wr1,FS1,a10//"$AA_IM[X]"/20,30,200/130,30,70,/9,3/)
DEF Edit11=(R4///,"Z Position [mm]",,/wr1,FS1,a10//"$AA_IM[Z]"/20,60,200/130,60,70,/9,3/)
DEF Edit12=(R4///,"C Position [mm]",,/wr1,FS1,a10//"$AA_IM[C]"/20,90,200/130,90,70,/9,3/)
DEF Edit13=(R4///,"B Position [mm]",,/wr1,FS1,a10//"$AA_IM[B]"/20,120,200/130,120,70,/9,3/)
DEF Edit14=(R4///,"V Position [mm]",,/wr1,FS1,a10//"$AA_IM[V]"/20,150,200/130,150,70,/9,3/)
DEF Edit15=(R4///,"W Position [mm]",,/wr1,FS1,a10//"$AA_IM[W]"/20,180,200/130,180,70,/9,3/)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;左下

DEF VAR15=(R3///,"X DRF value [mm]",,/wr1,FS1,a10//"/Channel/Parameter/r[u1,14]"/20,220,200/160,220,60,/9,3/);当前X_DRF值
DEF VAR202=(R3///,"Z DRF value [mm]",,/wr1,FS1,a10//"/Channel/Parameter/r[u1,67]"/20,250,200/160,250,60,/9,3/);当前Z_DRF值
DEF VAR206=(R3///,"C DRF value [mm]",,/wr1,FS1,a10//"/Channel/Parameter/r[u1,60]"/20,280,200/160,280,60,/9,3/);当前C_DRF值
DEF VAR203=(R/0,//$85125,$85125,,/WR2//"/Channel/Parameter/r[u1,66]"/20,310,200/160,310,60,/),;P.D.
DEF VAR20=(R///$85033,$85033,,/WR2//"/Channel/Parameter/r[u1,299]"/20,340,200/220,340,60/7,0),


;;;右边
;;;DEF VAR11=(I/*0=$85038,1=$85039//$85024,$85024,,/WR2//"/Channel/Parameter/r[u1,9]"/20,30,160/180,30,60/7,0),

DEF VAR11=(I/0,//$85150,$85150,,/WR2//"/Channel/Parameter/r[u1,8]"/300,30,160/460,30,60/7,0),
DEF VAR1=(R/0,//$85014,$85014,,/WR2//"/Channel/Parameter/r[u1,1]"/300,60,100/460,60,60/),
DEF VAR200=(I/*0=$85043,1=$85044//,,,/WR2//"/Channel/Parameter/r[u1,63]"/0,0,0/380,60,40/7,0),
;;;;DEF VAR200=(I/*0=$85043,1=$85044//$85042,$85042,,/WR2//"/Channel/Parameter/r[u1,63]"/20,80,160/180,80,60/7,0),
DEF VAR8=(I/*-1=$85036,1=$85037//$85021,$85021,,/WR2//"/Channel/Parameter/r[u1,0]"/300,90,160/460,90,60/),
DEF VAR2=(R/0,//$85015,$85015,,/WR2//"/Channel/Parameter/r[u1,4]"/300,120,160/460,120,60/),
DEF VAR4=(I/*0=$85034,1=$85035//$85017,$85017,,/WR2//"/Channel/Parameter/r[u1,2]"/300,150,160/460,150,60/),
DEF VAR5=(I/*-1=$85036,1=$85037//$85018,$85018,,/WR2//"/Channel/Parameter/r[u1,3]"/300,180,160/460,180,60/),
DEF VAR6=(R/0,//$85019,$85019,,/WR2//"/Channel/Parameter/r[u1,5]"/300,210,160/460,210,60/),
DEF VAR9=(R/0,//$85022,$85022,,/WR2//"/Channel/Parameter/r[u1,7]"/300,240,160/460,240,60/),
DEF VAR201=(I/*0=$85147,1=$85145,-1=$85146//$85045,$85045,,/WR2//"/Channel/Parameter/r[u1,62]"/300,270,160/460,270,60/7,0),
DEF VAR3=(R/0,//$85016,$85016,,/WR2//"/Channel/Parameter/r[u1,10]"/300,300,160/410,300,55/),
DEF work1=(I///,$85010,,/WR0///475,300,/0,0,0);符号:
DEF VAR21=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,19]"/0,0,0/485,300,55/),

DEF VAR138=(I/*0=$85152,1=$85153//$85151,$85151,,/WR2//"/Channel/Parameter/r[u1,65]"/300,330,160/460,330,60/7,0),


HS1=($85001,se3);"基本数据1"
HS2=($85002);"基本数据2"
HS3=($85003);"磨削参数"
HS4=($85004);"多线修整"
HS5=($85005);"单线修整"
HS6=($85006);"齿型参数"
HS7=($85007);"环形槽"
HS8=($85008);"返回"
VS1=("")
VS2=("")
VS3=("")
VS4=("")
VS5=("")
VS6=("")
VS7=("")
VS8=("")    ;Softkey 8  Vertical: Exit

PRESS(HS1)
LM("MASK1")
END_PRESS

PRESS(HS2)
LM("MASK2")
END_PRESS

PRESS(HS3)
LM("MASK3")
END_PRESS

PRESS(HS4)
LM("MASK4")
END_PRESS

PRESS(HS5)
LM("MASK5")
END_PRESS

PRESS(HS6)
LM("MASK6")
END_PRESS

PRESS(HS7)
LM("MASK7")
END_PRESS

PRESS(HS8)  
 EXIT
END_PRESS



;MASK2:基本数据2 /////////////////////////////////////////////////////////////////////////
//M(Mask2/$85002/)

;youbian

;DEF work200=(I///,$85129,,/WR0///300,30);
DEF MOXUETYPE=(I/*0=$85106,1=$85107//$85105,$85105,,/WR2//"/NC/_N_NC_GD3_ACX/INI[119]"/300,30,70/460,30,60/);磨削类型(0丝锥1环形槽)
DEF VAR204=(I/*0=$85126,1=$85127//$85128,$85128,,/WR2//"/Channel/Parameter/r[u1,6]"/300,60,160/460,60,60/7,0),
DEF VAR205=(I/*0=$85038,1=$85039//$85024,$85024,,/WR2//"/Channel/Parameter/r[u1,9]"/300,90,160/460,90,60/7,0),

DEF VAR12=(R///$85025,$85025,,/WR2//"/Channel/Parameter/r[u1,11]"/300,120,160/460,120,60/6,4),
DEF VAR13=(R///$85026,$85026,,/WR2//"/Channel/Parameter/r[u1,12]"/300,150,160/460,150,60/),
DEF VAR14=(R/0,//$85027,$85027,,/WR2//"/Channel/Parameter/r[u1,13]"/300,180,160/460,180,60/),
DEF VAR16=(R///$85029,$85029,,/WR2//"/Channel/Parameter/r[u1,15]"/300,210,160/460,210,60/6,4),
DEF VAR17=(R///$85030,$85030,,/WR2//"/Channel/Parameter/r[u1,16]"/300,240,160/460,240,60/6,4),
DEF VAR18=(R///$85031,$85031,,/WR2//"/Channel/Parameter/r[u1,17]"/300,270,160/460,270,60/6,4),
DEF VAR19=(R///$85032,$85032,,/WR2//"/Channel/Parameter/r[u1,18]"/300,300,160/460,300,60/6,4),
DEF VAR20=(R///$85041,$85041,,/WR2//"/Channel/Parameter/r[u1,295]"/300,330,160/460,330,60/6,4),


DEF Picturel=(S///,"\\33-3.png",,/wr1///25,50,290,300/0,0,0,0//),

HS1=($85001);"基本数据1"
HS2=($85002,se3);"基本数据2"
HS3=($85003);"磨削参数"
HS4=($85004);"多线修整"
HS5=($85005);"单线修整"
HS6=($85006);"齿型参数"
HS7=($85007);"环形槽"
HS8=($85008);"返回"
VS1=("")
VS2=("")
VS3=("")
VS4=("")
VS5=("")
VS6=("")
VS7=("")
VS8=("")    ;Softkey 8  Vertical: Exit



PRESS(HS1)
LM("MASK1")
END_PRESS

PRESS(HS2)
LM("MASK2")
END_PRESS

PRESS(HS3)
LM("MASK3")
END_PRESS

PRESS(HS4)
LM("MASK4")
END_PRESS

PRESS(HS5)
LM("MASK5")
END_PRESS

PRESS(HS6)
LM("MASK6")
END_PRESS

PRESS(HS7)
LM("MASK7")
END_PRESS

PRESS(HS8)  
 EXIT
END_PRESS





;MASK3:磨削参数(1---5)
////////////////////////////////////////////////////////////
//M(Mask3/$85003/)
;第1列
DEF work1=(I///,$85046,,/WR0///10,50,200/0,0,0);
DEF work2=(I///,$85047,,/WR0///10,80,200/0,0,0);
DEF work3=(I///,$85048,,/WR0///10,110,200/0,0,0);
DEF work4=(I///,$85049,,/WR0///10,140,200/0,0,0);
DEF work5=(I///,$85050,,/WR0///10,170,200/0,0,0);
DEF work6=(I///,$85051,,/WR0///10,200,200/0,0,0);
DEF work7=(I///,$85052,,/WR0///10,230,200/0,0,0);
DEF work8=(I///,$85053,,/WR0///10,260,200/0,0,0);
DEF work9=(I///,$85054,,/WR0///10,290,200/0,0,0);
DEF work15=(I///,$85171,,/WR0///10,320,200/0,0,0);
;第1刀
DEF work10=(I///,$85055,,/WR0///210,20,100/0,0,0);
DEF VAR30=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,20]"/0,0,0/200,50,55/),
DEF VAR31=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,21]"/0,0,0/200,80,55/),
DEF VAR32=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,22]"/0,0,0/200,110,55/),
DEF VAR33=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,23]"/0,0,0/200,140,55/),
DEF VAR34=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,25]"/0,0,0/200,170,55/6,4),
DEF VAR35=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,26]"/0,0,0/200,200,55/,4),
DEF VAR36=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,27]"/0,0,0/200,230,55/,4),
DEF VAR37=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,28]"/0,0,0/200,260,55/,4),
DEF VAR38=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,29]"/0,0,0/200,290,55/,4),
DEF VAR401=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,24]"/0,0,0/200,320,55/,4),
;第2刀
DEF work11=(I///,$85056,,/WR0///280,20,100/0,0,0);
DEF VAR39=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,30]"/0,0,0/270,50,55/),
DEF VAR40=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,31]"/0,0,0/270,80,55/),
DEF VAR41=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,32]"/0,0,0/270,110,55/),
DEF VAR42=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,33]"/0,0,0/270,140,55/),
DEF VAR43=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,35]"/0,0,0/270,170,55/6,4),
DEF VAR44=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,36]"/0,0,0/270,200,55/,4),
DEF VAR45=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,37]"/0,0,0/270,230,55/,4),
DEF VAR46=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,38]"/0,0,0/270,260,55/,4),
DEF VAR47=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,39]"/0,0,0/270,290,55/,4),
DEF VAR402=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,34]"//270,320,55/,4),
;第3刀
DEF work12=(I///,$85057,,/WR0///350,20,100/0,0,0);
DEF VAR48=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,40]"/0,0,0/340,50,55/),
DEF VAR49=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,41]"/0,0,0/340,80,55/),
DEF VAR50=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,42]"/0,0,0/340,110,55/),
DEF VAR51=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,43]"/0,0,0/340,140,55/),
DEF VAR52=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,45]"/0,0,0/340,170,55/6,4),
DEF VAR53=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,46]"/0,0,0/340,200,55/,4),
DEF VAR54=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,47]"/0,0,0/340,230,55/,4),
DEF VAR55=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,48]"/0,0,0/340,260,55/,4),
DEF VAR56=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,49]"/0,0,0/340,290,55/,4),
DEF VAR403=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,44]"/0,0,0/340,320,55/,4),
;第4刀
DEF work13=(I///,$85058,,/WR0///420,20,100/0,0,0);
DEF VAR57=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,50]"/0,0,0/410,50,55/),
DEF VAR58=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,51]"/0,0,0/410,80,55/),
DEF VAR59=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,52]"/0,0,0/410,110,55/),
DEF VAR60=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,53]"/0,0,0/410,140,55/),
DEF VAR61=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,55]"/0,0,0/410,170,55/6,4),
DEF VAR62=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,56]"/0,0,0/410,200,55/,4),
DEF VAR63=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,57]"/0,0,0/410,230,55/,4),
DEF VAR64=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,58]"/0,0,0/410,260,55/,4),
DEF VAR65=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,59]"/0,0,0/410,290,55/,4),
DEF VAR404=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,54]"/0,0,0/410,320,55/,4),
;第5刀
DEF work14=(I///,$85059,,/WR0///490,20,100/0,0,0);
DEF VAR66=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,110]"/0,0,0/480,50,55/),
DEF VAR67=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,111]"/0,0,0/480,80,55/),
DEF VAR68=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,112]"/0,0,0/480,110,55/),
DEF VAR69=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,113]"/0,0,0/480,140,55/),
DEF VAR70=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,115]"/0,0,0/480,170,55/6,4),
DEF VAR71=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,116]"/0,0,0/480,200,55/,4),
DEF VAR72=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,117]"/0,0,0/480,230,55/,4),
DEF VAR73=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,118]"/0,0,0/480,260,55/,4),
DEF VAR74=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,119]"/0,0,0/480,290,55/,4),
DEF VAR405=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,114]"/0,0,0/480,320,55/,4),

;DEF Line10=(S////wr1////7,164,175,4/,5/);横

HS1=($85001);"基本数据1"
HS2=($85002);"基本数据2"
HS3=($85003,se3);"磨削参数"
HS4=($85004);"多线修整"
HS5=($85005);"单线修整"
HS6=($85006);"齿型参数"
HS7=($85007);"环形槽"
HS8=($85008);"返回"
VS1=("")
VS2=("")
VS3=($85301,se3);"cut 1 to 5"
VS4=($85302)
VS5=($85303)
VS6=("")
VS7=("")
VS8=("")    ;Softkey 8  Vertical: Exit



PRESS(HS1)
LM("MASK1")
END_PRESS

PRESS(HS2)
LM("MASK2")
END_PRESS

PRESS(HS3)
LM("MASK3")
END_PRESS

PRESS(HS4)
LM("MASK4")
END_PRESS

PRESS(HS5)
LM("MASK5")
END_PRESS

PRESS(HS6)
LM("MASK6")
END_PRESS

PRESS(HS7)
LM("MASK7")
END_PRESS

PRESS(HS8)  
 EXIT
END_PRESS



PRESS(VS3)
LM("MASK3")
END_PRESS

PRESS(VS4)
LM("MASK32")
END_PRESS

PRESS(VS5)
LM("MASK33")
END_PRESS



;;;;VAR31.WR=1只读，=2显示可编辑，=0隐藏
;---------------------------------------
;第1刀显示或隐藏
CHANGE(VAR30)
IF VAR30.VAL==0
VAR31.WR=0
VAR32.WR=0
VAR33.WR=0
VAR34.WR=0
VAR35.WR=0
VAR36.WR=0
VAR37.WR=0
VAR38.WR=0
VAR401.WR=0
ELSE
VAR31.WR=2
VAR32.WR=2
VAR33.WR=2
VAR34.WR=2
VAR35.WR=2
VAR36.WR=2
VAR37.WR=2
VAR38.WR=2
VAR401.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;---------------------------------------
;第2刀显示或隐藏
CHANGE(VAR39)
IF VAR39.VAL==0
VAR40.WR=0
VAR41.WR=0
VAR42.WR=0
VAR43.WR=0
VAR44.WR=0
VAR45.WR=0
VAR46.WR=0
VAR47.WR=0
VAR402.WR=0
ELSE
VAR40.WR=2
VAR41.WR=2
VAR42.WR=2
VAR43.WR=2
VAR44.WR=2
VAR45.WR=2
VAR46.WR=2
VAR47.WR=2
VAR402.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第3刀显示或隐藏
CHANGE(VAR48)
IF VAR48.VAL==0
VAR49.WR=0
VAR50.WR=0
VAR51.WR=0
VAR52.WR=0
VAR53.WR=0
VAR54.WR=0
VAR55.WR=0
VAR56.WR=0
VAR403.WR=0
ELSE
VAR49.WR=2
VAR50.WR=2
VAR51.WR=2
VAR52.WR=2
VAR53.WR=2
VAR54.WR=2
VAR55.WR=2
VAR56.WR=2
VAR403.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第4刀显示或隐藏
CHANGE(VAR57)
IF VAR57.VAL==0
VAR58.WR=0
VAR59.WR=0
VAR60.WR=0
VAR61.WR=0
VAR62.WR=0
VAR63.WR=0
VAR64.WR=0
VAR65.WR=0
VAR404.WR=0
ELSE
VAR58.WR=2
VAR59.WR=2
VAR60.WR=2
VAR61.WR=2
VAR62.WR=2
VAR63.WR=2
VAR64.WR=2
VAR65.WR=2
VAR404.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第5刀显示或隐藏
CHANGE(VAR66)
IF VAR66.VAL==0
VAR67.WR=0
VAR68.WR=0
VAR69.WR=0
VAR70.WR=0
VAR71.WR=0
VAR72.WR=0
VAR73.WR=0
VAR74.WR=0
VAR405.WR=0
ELSE
VAR67.WR=2
VAR68.WR=2
VAR69.WR=2
VAR70.WR=2
VAR71.WR=2
VAR72.WR=2
VAR73.WR=2
VAR74.WR=2
VAR405.WR=2
ENDIF
END_CHANGE
;--------------------------------------

//END




;MASK32:磨削数据6---10/////////////////////////////////////////////////////////////////////////
//M(Mask32/$85302/)
;第1列
DEF work1=(I///,$85046,,/WR0///10,50/0,0,0);
DEF work2=(I///,$85047,,/WR0///10,80/0,0,0);
DEF work3=(I///,$85048,,/WR0///10,110/0,0,0);
DEF work4=(I///,$85049,,/WR0///10,140/0,0,0);
DEF work5=(I///,$85050,,/WR0///10,170/0,0,0);
DEF work6=(I///,$85051,,/WR0///10,200/0,0,0);
DEF work7=(I///,$85052,,/WR0///10,230/0,0,0);
DEF work8=(I///,$85053,,/WR0///10,260/0,0,0);
DEF work9=(I///,$85054,,/WR0///10,290/0,0,0);
DEF work10=(I///,$85171,,/WR0///10,320/0,0,0);

;第6刀
DEF work15=(I///,$85060,,/WR0///210,20/0,0,0);
DEF VAR75=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,120]"/0,0,0/200,50,55/),
DEF VAR76=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,121]"/0,0,0/200,80,55/),
DEF VAR77=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,122]"/0,0,0/200,110,55/),
DEF VAR78=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,123]"/0,0,0/200,140,55/),
DEF VAR79=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,125]"/0,0,0/200,170,55/6,4),
DEF VAR80=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,126]"/0,0,0/200,200,55/,4),
DEF VAR81=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,127]"/0,0,0/200,230,55/,4),
DEF VAR82=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,128]"/0,0,0/200,260,55/,4),
DEF VAR83=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,129]"/0,0,0/200,290,55/,4),
DEF VAR406=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,124]"/0,0,0/200,320,55/,4),
;第7刀
DEF work16=(I///,$85061,,/WR0///280,20/0,0,0);
DEF VAR84=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,130]"/0,0,0/270,50,55/),
DEF VAR85=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,131]"/0,0,0/270,80,55/),
DEF VAR86=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,132]"/0,0,0/270,110,55/),
DEF VAR87=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,133]"/0,0,0/270,140,55/),
DEF VAR88=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,135]"/0,0,0/270,170,55/6,4),
DEF VAR89=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,136]"/0,0,0/270,200,55/,4),
DEF VAR90=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,137]"/0,0,0/270,230,55/,4),
DEF VAR91=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,138]"/0,0,0/270,260,55/,4),
DEF VAR92=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,139]"/0,0,0/270,290,55/,4),
DEF VAR407=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,134]"/0,0,0/270,320,55/,4),
;第8刀
DEF work17=(I///,$85062,,/WR0///350,20/0,0,0);
DEF VAR93=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,140]"/0,0,0/340,50,55/),
DEF VAR94=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,141]"/0,0,0/340,80,55/),
DEF VAR95=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,142]"/0,0,0/340,110,55/),
DEF VAR96=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,143]"/0,0,0/340,140,55/),
DEF VAR97=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,145]"/0,0,0/340,170,55/6,4),
DEF VAR98=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,146]"/0,0,0/340,200,55/,4),
DEF VAR99=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,147]"/0,0,0/340,230,55/,4),
DEF VAR100=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,148]"/0,0,0/340,260,55/,4),
DEF VAR101=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,149]"/0,0,0/340,290,55/,4),
DEF VAR408=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,144]"/0,0,0/340,320,55/,4),
;第9刀
DEF work18=(I///,$85063,,/WR0///420,20/0,0,0);
DEF VAR102=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,150]"/0,0,0/410,50,55/),
DEF VAR103=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,151]"/0,0,0/410,80,55/),
DEF VAR104=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,152]"/0,0,0/410,110,55/),
DEF VAR105=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,153]"/0,0,0/410,140,55/),
DEF VAR106=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,155]"/0,0,0/410,170,55/6,4),
DEF VAR107=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,156]"/0,0,0/410,200,55/,4),
DEF VAR108=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,157]"/0,0,0/410,230,55/,4),
DEF VAR109=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,158]"/0,0,0/410,260,55/,4),
DEF VAR110=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,159]"/0,0,0/410,290,55/,4),
DEF VAR409=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,154]"/0,0,0/410,320,55/,4),
;第10刀
DEF work19=(I///,$85064,,/WR0///490,20/0,0,0);
DEF VAR111=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,160]"/0,0,0/480,50,55/),
DEF VAR112=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,161]"/0,0,0/480,80,55/),
DEF VAR113=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,162]"/0,0,0/480,110,55/),
DEF VAR114=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,163]"/0,0,0/480,140,55/),
DEF VAR115=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,165]"/0,0,0/480,170,55/6,4),
DEF VAR116=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,166]"/0,0,0/480,200,55/,4),
DEF VAR117=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,167]"/0,0,0/480,230,55/,4),
DEF VAR118=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,168]"/0,0,0/480,260,55/,4),
DEF VAR119=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,169]"/0,0,0/480,290,55/,4),
DEF VAR410=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,164]"/0,0,0/480,320,55/,4),

;DEF Line11=(S////wr1////7,164,175,4/,5/);横

HS1=($85001);"基本数据1"
HS2=($85002);"基本数据2"
HS3=($85003,se3);"磨削参数"
HS4=($85004);"多线修整"
HS5=($85005);"单线修整"
HS6=($85006);"齿型参数"
HS7=($85007);"环形槽"
HS8=($85008);"返回"
VS1=("")
VS2=("")
VS3=($85301);"cut 1 to 5"
VS4=($85302,se3);"cut 6 to 10"
VS5=($85303)
VS6=("")
VS7=("")
VS8=("")    ;Softkey 8  Vertical: Exit

PRESS(HS1)
LM("MASK1")
END_PRESS

PRESS(HS2)
LM("MASK2")
END_PRESS

PRESS(HS3)
LM("MASK3")
END_PRESS

PRESS(HS4)
LM("MASK4")
END_PRESS

PRESS(HS5)
LM("MASK5")
END_PRESS

PRESS(HS6)
LM("MASK6")
END_PRESS

PRESS(HS7)
LM("MASK7")
END_PRESS

PRESS(HS8)  
 EXIT
END_PRESS

PRESS(VS3)
LM("MASK3")
END_PRESS

PRESS(VS4)
LM("MASK32")
END_PRESS

PRESS(VS5)
LM("MASK33")
END_PRESS


PRESS(VS7)
LM("MASK8")
END_PRESS




;--------------------------------------
;第6刀显示或隐藏
CHANGE(VAR75)
IF VAR75.VAL==0
VAR76.WR=0
VAR77.WR=0
VAR78.WR=0
VAR79.WR=0
VAR80.WR=0
VAR81.WR=0
VAR82.WR=0
VAR83.WR=0
VAR406.WR=0
ELSE
VAR76.WR=2
VAR77.WR=2
VAR78.WR=2
VAR79.WR=2
VAR80.WR=2
VAR81.WR=2
VAR82.WR=2
VAR83.WR=2
VAR406.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第7刀显示或隐藏
CHANGE(VAR84)
IF VAR84.VAL==0
VAR85.WR=0
VAR86.WR=0
VAR87.WR=0
VAR88.WR=0
VAR89.WR=0
VAR90.WR=0
VAR91.WR=0
VAR92.WR=0
VAR407.WR=0
ELSE
VAR85.WR=2
VAR86.WR=2
VAR87.WR=2
VAR88.WR=2
VAR89.WR=2
VAR90.WR=2
VAR91.WR=2
VAR92.WR=2
VAR407.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第8刀显示或隐藏
CHANGE(VAR93)
IF VAR93.VAL==0
VAR94.WR=0
VAR95.WR=0
VAR96.WR=0
VAR97.WR=0
VAR98.WR=0
VAR99.WR=0
VAR100.WR=0
VAR101.WR=0
VAR408.WR=0
ELSE
VAR94.WR=2
VAR95.WR=2
VAR96.WR=2
VAR97.WR=2
VAR98.WR=2
VAR99.WR=2
VAR100.WR=2
VAR101.WR=2
VAR408.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第9刀显示或隐藏
CHANGE(VAR102)
IF VAR102.VAL==0
VAR103.WR=0
VAR104.WR=0
VAR105.WR=0
VAR106.WR=0
VAR107.WR=0
VAR108.WR=0
VAR109.WR=0
VAR110.WR=0
VAR409.WR=0
ELSE
VAR103.WR=2
VAR104.WR=2
VAR105.WR=2
VAR106.WR=2
VAR107.WR=2
VAR108.WR=2
VAR109.WR=2
VAR110.WR=2
VAR409.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第10刀显示或隐藏
CHANGE(VAR111)
IF VAR111.VAL==0
VAR112.WR=0
VAR113.WR=0
VAR114.WR=0
VAR115.WR=0
VAR116.WR=0
VAR117.WR=0
VAR118.WR=0
VAR119.WR=0
VAR410.WR=0
ELSE
VAR112.WR=2
VAR113.WR=2
VAR114.WR=2
VAR115.WR=2
VAR116.WR=2
VAR117.WR=2
VAR118.WR=2
VAR119.WR=2
VAR410.WR=2
ENDIF
END_CHANGE
;--------------------------------------




;MASK33: 磨削数据11---15/////////////////////////////////////////////////////////////////////////
//M(Mask33/$85303/)

;第1列
DEF work1=(I///,$85046,,/WR0///10,50/0,0,0);
DEF work2=(I///,$85047,,/WR0///10,80/0,0,0);
DEF work3=(I///,$85048,,/WR0///10,110/0,0,0);
DEF work4=(I///,$85049,,/WR0///10,140/0,0,0);
DEF work5=(I///,$85050,,/WR0///10,170/0,0,0);
DEF work6=(I///,$85051,,/WR0///10,200/0,0,0);
DEF work7=(I///,$85052,,/WR0///10,230/0,0,0);
DEF work8=(I///,$85053,,/WR0///10,260/0,0,0);
DEF work9=(I///,$85054,,/WR0///10,290/0,0,0);
DEF work10=(I///,$85171,,/WR0///10,320/0,0,0);

;第11刀
DEF work20=(I///,$85065,,/WR0///210,20/0,0,0);
DEF VAR120=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,170]"/0,0,0/200,50,55/),
DEF VAR121=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,171]"/0,0,0/200,80,55/),
DEF VAR122=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,172]"/0,0,0/200,110,55/),
DEF VAR123=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,173]"/0,0,0/200,140,55/),
DEF VAR124=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,175]"/0,0,0/200,170,55/6,4),
DEF VAR125=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,176]"/0,0,0/200,200,55/,4),
DEF VAR126=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,177]"/0,0,0/200,230,55/,4),
DEF VAR127=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,178]"/0,0,0/200,260,55/,4),
DEF VAR128=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,179]"/0,0,0/200,290,55/,4),
DEF VAR411=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,174]"/0,0,0/200,320,55/,4),
;第12刀
DEF work21=(I///,$85066,,/WR0///280,20/0,0,0);
DEF VAR129=(I/*1=$85067,0=$85068//,,/WR2//"/Channel/Parameter/r[u1,180]"/0,0,0/270,50,55/),
DEF VAR130=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,181]"/0,0,0/270,80,55/),
DEF VAR131=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,182]"/0,0,0/270,110,55/),
DEF VAR132=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,183]"/0,0,0/270,140,55/),
DEF VAR133=(I/*1=$85067,0=$85068//,,,/WR2//"/Channel/Parameter/r[u1,185]"/0,0,0/270,170,55/6,4),
DEF VAR134=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,186]"/0,0,0/270,200,55/,4),
DEF VAR135=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,187]"/0,0,0/270,230,55/,4),
DEF VAR136=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,188]"/0,0,0/270,260,55/,4),
DEF VAR137=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,189]"/0,0,0/270,290,55/,4),
DEF VAR412=(R/0,//,,,/WR2//"/Channel/Parameter/r[u1,184]"/0,0,0/270,320,55/,4),
;第13刀
DEF VAR210=(I///,$85069,,/WR0///350,20/0,0,0);
DEF VAR211=(R/*1=$85067,0=$85068//,,/WR2,FS1//"DAO1[0]"/0,0,0/340,50,55/),
DEF VAR212=(R/0,//,,,/WR2,FS1//"DAO1[1]"/0,0,0/340,80,55/),
DEF VAR213=(R/0,//,,,/WR2,FS1//"DAO1[2]"/0,0,0/340,110,55/),
DEF VAR214=(R/0,//,,,/WR2,FS1//"DAO1[3]"/0,0,0/340,140,55/),
DEF VAR215=(R/*1=$85067,0=$85068//,,/WR2,FS1//"DAO1[5]"/0,0,0/340,170,55/6,4),
DEF VAR216=(R/0,//,,,/WR2,FS1//"DAO1[6]"/0,0,0/340,200,55/,4),
DEF VAR217=(R/0,//,,,/WR2,FS1//"DAO1[7]"/0,0,0/340,230,55/,4),
DEF VAR218=(R/0,//,,,/WR2,FS1//"DAO1[8]"/0,0,0/340,260,55/,4),
DEF VAR219=(R/0,//,,,/WR2,FS1//"DAO1[9]"/0,0,0/340,290,55/,4),
DEF VAR413=(R/0,//,,,/WR2,FS1//"DAO1[4]"//340,320,55/,4),
;第14刀
DEF VAR220=(I///,$85070,,/WR0///420,20/0,0,0);
DEF VAR221=(R/*1=$85067,0=$85068//,,/WR2,FS1//"DAO2[0]"/0,0,0/410,50,55/),
DEF VAR222=(R/0,//,,,/WR2,FS1//"DAO2[1]"/0,0,0/410,80,55/),
DEF VAR223=(R/0,//,,,/WR2,FS1//"DAO2[2]"/0,0,0/410,110,55/),
DEF VAR224=(R/0,//,,,/WR2,FS1//"DAO2[3]"/0,0,0/410,140,55/),
DEF VAR225=(R/*1=$85067,0=$85068//,,/WR2,FS1//"DAO2[5]"/0,0,0/410,170,55/6,4),
DEF VAR226=(R/0,//,,,/WR2,FS1//"DAO2[6]"/0,0,0/410,200,55/,4),
DEF VAR227=(R/0,//,,,/WR2,FS1//"DAO2[7]"/0,0,0/410,230,55/,4),
DEF VAR228=(R/0,//,,,/WR2,FS1//"DAO2[8]"/0,0,0/410,260,55/,4),
DEF VAR229=(R/0,//,,,/WR2,FS1//"DAO2[9]"/0,0,0/410,290,55/,4),
DEF VAR414=(R/0,//,,,/WR2,FS1//"DAO2[4]"/0,0,0/410,320,55/,4),
;第15刀
DEF VAR230=(I///,$85170,,/WR0///490,20/0,0,0);
DEF VAR231=(R/*1=$85067,0=$85068//,,/WR2,FS1//"DAO3[0]"/0,0,0/480,50,55/),
DEF VAR232=(R/0,//,,,/WR2,FS1//"DAO3[1]"/0,0,0/480,80,55/),
DEF VAR233=(R/0,//,,,/WR2,FS1//"DAO3[2]"/0,0,0/480,110,55/),
DEF VAR234=(R/0,//,,,/WR2,FS1//"DAO3[3]"/0,0,0/480,140,55/),
DEF VAR235=(R/*1=$85067,0=$85068//,,/WR2,FS1//"DAO3[5]"/0,0,0/480,170,55/6,4),
DEF VAR236=(R/0,//,,,/WR2,FS1//"DAO3[6]"/0,0,0/480,200,55/,4),
DEF VAR237=(R/0,//,,,/WR2,FS1//"DAO3[7]"/0,0,0/480,230,55/,4),
DEF VAR238=(R/0,//,,,/WR2,FS1//"DAO3[8]"/0,0,0/480,260,55/,4),
DEF VAR239=(R/0,//,,,/WR2,FS1//"DAO3[9]"/0,0,0/480,290,55/,4),
DEF VAR415=(R/0,//,,,/WR2,FS1//"DAO3[4]"/0,0,0/480,320,55/,4),

;DEF Line12=(S////wr1////7,164,175,4/,5/);横

HS1=($85001);"基本数据1"
HS2=($85002);"基本数据2"
HS3=($85003,se3);"磨削参数"
HS4=($85004);"多线修整"
HS5=($85005);"单线修整"
HS6=($85006);"齿型参数"
HS7=($85007);"环形槽"
HS8=($85008);"返回"
VS1=("")
VS2=("")
VS3=($85301);"cut 1 to 5"
VS4=($85302);"cut 6 to 10"
VS5=($85303,se3);"cut 11 to 15"
VS6=("")
VS7=("")
VS8=("")    ;Softkey 8  Vertical: Exit

PRESS(HS1)
LM("MASK1")
END_PRESS

PRESS(HS2)
LM("MASK2")
END_PRESS

PRESS(HS3)
LM("MASK3")
END_PRESS

PRESS(HS4)
LM("MASK4")
END_PRESS

PRESS(HS5)
LM("MASK5")
END_PRESS

PRESS(HS6)
LM("MASK6")
END_PRESS

PRESS(HS7)
LM("MASK7")
END_PRESS

PRESS(HS8)
  EXIT
END_PRESS

PRESS(VS3)
LM("MASK3")
END_PRESS

PRESS(VS4)
LM("MASK32")
END_PRESS

PRESS(VS5)
LM("MASK33")
END_PRESS

PRESS(VS7)
LM("MASK8")
END_PRESS




;--------------------------------------
;第11刀显示或隐藏
CHANGE(VAR120)
IF VAR120.VAL==0
VAR121.WR=0
VAR122.WR=0
VAR123.WR=0
VAR124.WR=0
VAR125.WR=0
VAR126.WR=0
VAR127.WR=0
VAR128.WR=0
VAR411.WR=0
ELSE
VAR121.WR=2
VAR122.WR=2
VAR123.WR=2
VAR124.WR=2
VAR125.WR=2
VAR126.WR=2
VAR127.WR=2
VAR128.WR=2
VAR411.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第12刀显示或隐藏
CHANGE(VAR129)
IF VAR129.VAL==0
VAR130.WR=0
VAR131.WR=0
VAR132.WR=0
VAR133.WR=0
VAR134.WR=0
VAR135.WR=0
VAR136.WR=0
VAR137.WR=0
VAR412.WR=0
ELSE
VAR130.WR=2
VAR131.WR=2
VAR132.WR=2
VAR133.WR=2
VAR134.WR=2
VAR135.WR=2
VAR136.WR=2
VAR137.WR=2
VAR412.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第13刀显示或隐藏
CHANGE(VAR211)
IF VAR211.VAL==0
VAR212.WR=0
VAR213.WR=0
VAR214.WR=0
VAR215.WR=0
VAR216.WR=0
VAR217.WR=0
VAR218.WR=0
VAR219.WR=0
VAR413.WR=0
ELSE
VAR212.WR=2
VAR213.WR=2
VAR214.WR=2
VAR215.WR=2
VAR216.WR=2
VAR217.WR=2
VAR218.WR=2
VAR219.WR=2
VAR413.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第14刀显示或隐藏
CHANGE(VAR221)
IF VAR221.VAL==0
VAR222.WR=0
VAR223.WR=0
VAR224.WR=0
VAR225.WR=0
VAR226.WR=0
VAR227.WR=0
VAR228.WR=0
VAR229.WR=0
VAR414.WR=0
ELSE
VAR222.WR=2
VAR223.WR=2
VAR224.WR=2
VAR225.WR=2
VAR226.WR=2
VAR227.WR=2
VAR228.WR=2
VAR229.WR=2
VAR414.WR=2
ENDIF
END_CHANGE
;--------------------------------------
;第15刀显示或隐藏
CHANGE(VAR231)
IF VAR231.VAL==0
VAR232.WR=0
VAR233.WR=0
VAR234.WR=0
VAR235.WR=0
VAR236.WR=0
VAR237.WR=0
VAR238.WR=0
VAR239.WR=0
VAR415.WR=0
ELSE
VAR232.WR=2
VAR233.WR=2
VAR234.WR=2
VAR235.WR=2
VAR236.WR=2
VAR237.WR=2
VAR238.WR=2
VAR239.WR=2
VAR415.WR=2
ENDIF
END_CHANGE
;--------------------------------------



;MASK4:多线修整 /////////////////////////////////////////////////////////////////////////
//M(Mask4/$85004/)
;YOU
DEF VAR424=(R///$85072,$85072,,/WR2//"DUO[23]"/300,315/480,315,70/6,4),
DEF VAR425=(R///$85073,$85073,,/WR2//"DUO[24]"/300,340/480,340,70/6,4),


;ZUO
DEF VAR416=(I/*1=$85084,0=$85085//$85074,$85074,,/WR2//"DUO[16]"/10,30/200,30,70/7,0),
DEF VAR417=(R/0,//$85075,$85075,,/WR2//"DUO[17]"/10,60/200,60,70/),
DEF VAR418=(R/0,//$85076,$85076,,/WR2//"DUO[18]"/10,90/200,90,70/),
DEF VAR419=(R/0,//$85077,$85077,,/WR2//"DUO[19]"/10,120/200,120,70/),
DEF VAR420=(R/0,//$85078,$85078,,/WR2//"DUO[20]"/10,150/200,150,70/),
DEF VAR421=(R/0,//$85079,$85079,,/WR2//"DUO[21]"/10,180/200,180,70/),
DEF VAR422=(R/0,//$85086,$85086,,/WR2//"DUO[22]"/10,210/200,210,70/),
DEF VAR426=(R/0,//$85171,$85171,,/WR2//"DUO[0]"/10,240/200,240,70/),
;;;DEF VAR423=(R/0,//$85080,$85080,,/WR1//"/Channel/Parameter/r[u1,299]"/10,270/200,270,70/7,0),

DEF Picturel=(S///,"\\33-1.png",,/wr1///350,30,290,300/0,0,0,0//),

HS1=($85001);"基本数据1"
HS2=($85002);"基本数据2"
HS3=($85003);"磨削参数"
HS4=($85004,se3);"多线修整"
HS5=($85005);"单线修整"
HS6=($85006);"齿型参数"
HS7=($85007);"环形槽"
HS8=($85008);"返回"
VS1=("")
VS2=("")
VS3=("")
VS4=("")
VS5=("")
VS6=("")
VS7=("")
VS8=("")    ;Softkey 8  Vertical: Exit

PRESS(HS1)
LM("MASK1")
END_PRESS

PRESS(HS2)
LM("MASK2")
END_PRESS

PRESS(HS3)
LM("MASK3")
END_PRESS

PRESS(HS4)
LM("MASK4")
END_PRESS

PRESS(HS5)
LM("MASK5")
END_PRESS

PRESS(HS6)
LM("MASK6")
END_PRESS

PRESS(HS7)
LM("MASK7")
END_PRESS

PRESS(VS7)
LM("MASK8")
END_PRESS

PRESS(HS8)  
  EXIT
END_PRESS





;MASK5:单线修整 /////////////////////////////////////////////////////////////////////////
//M(Mask5/$85005/)
;ZUOBIAN
DEF VAR140=(R///$85071,$85071,,/WR2//"/Channel/Parameter/r[u1,80]"/10,290/200,290,70/6,4),
DEF VAR141=(R///$85072,$85072,,/WR2//"/Channel/Parameter/r[u1,78]"/10,315/200,315,70/6,4),
DEF VAR142=(R///$85073,$85073,,/WR2//"/Channel/Parameter/r[u1,79]"/10,340/200,340,70/6,4),
;YOUBIAO
DEF VAR143=(I/*1=$85084,0=$85085//$85074,$85074,,/WR2//"/Channel/Parameter/r[u1,76]"/295,30/485,30,70/7,0),
DEF VAR144=(R/0,//$85075,$85075,,/WR2//"/Channel/Parameter/r[u1,77]"/295,60/485,60,70/),
DEF VAR145=(R/0,//$85076,$85076,,/WR2//"/Channel/Parameter/r[u1,71]"/295,90/485,90,70/),
DEF VAR146=(R/0,//$85077,$85077,,/WR2//"/Channel/Parameter/r[u1,70]"/295,120/485,120,70/),
DEF VAR147=(R/0,//$85078,$85078,,/WR2//"/Channel/Parameter/r[u1,82]"/295,150/485,150,70/),
DEF VAR148=(R/0,//$85079,$85079,,/WR2//"/Channel/Parameter/r[u1,83]"/295,180/485,180,70/),
DEF VAR153=(R///$85086,$85086,,/WR2//"/Channel/Parameter/r[u1,72]"/295,210/485,210,70/),
;;;;DEF VAR150=(R/0,//$85081,$85081,,/WR2//"/Channel/Parameter/r[u1,74]"/300,240/485,240,70/),
;;;;DEF VAR151=(R/0,//$85082,$85082,,/WR2//"/Channel/Parameter/r[u1,75]"/300,270/485,270,70/),
;;;;DEF VAR152=(R///$85083,$85083,,/WR1//"/Channel/Parameter/r[u1,299]"/300,300/485,300,70/),
;;;DEF VAR149=(R/0,//$85080,$85080,,/WR1//"/Channel/Parameter/r[u1,298]"/295,240/485,240,70/7,0),


DEF Picturel=(S///,"\\33-2.png",,/wr1///60,30,290,300/0,0,0,0//),

HS1=($85001);"基本数据1"
HS2=($85002);"基本数据2"
HS3=($85003);"磨削参数"
HS4=($85004);"多线修整"
HS5=($85005,se3);"单线修整"
HS6=($85006);"齿型参数"
HS7=($85007);"环形槽"
HS8=($85008);"返回"
VS1=("")
VS2=("")
VS3=("")
VS4=("")
VS5=("")
VS6=("")
VS7=("")
VS8=("")    ;Softkey 8  Vertical: Exit

PRESS(HS1)
LM("MASK1")
END_PRESS

PRESS(HS2)
LM("MASK2")
END_PRESS

PRESS(HS3)
LM("MASK3")
END_PRESS

PRESS(HS4)
LM("MASK4")
END_PRESS

PRESS(HS5)
LM("MASK5")
END_PRESS

PRESS(HS6)
LM("MASK6")
END_PRESS

PRESS(HS7)
LM("MASK7")
END_PRESS

PRESS(VS7)
LM("MASK8")
END_PRESS

PRESS(HS8)  
  EXIT
END_PRESS


;MASK6: 齿型参数/////////////////////////////////////////////////////////////////////////
//M(Mask6/$85006/)
;ZUOBIAO
DEF VAR155=(I/*1=$85099,2=$85101//$85091,$85091,,/WR2//"/Channel/Parameter/r[u1,85]"/20,10,160/200,10,60/),
DEF VAR156=(R/0,//$85092,$85092,,/WR2//"/Channel/Parameter/r[u1,86]"/20,32,160/200,32,60/),
DEF VAR157=(R/0,//$85093,$85093,,/WR2//"/Channel/Parameter/r[u1,87]"/20,54,200/200,54,60/),
;;;;DEF VAR158=(R/0,//$85094,$85094,,/WR2//"/Channel/Parameter/r[u1,88]"/20,79,160/200,79,60/),
;;;;DEF work22=(I///,$85099,,/WR0///10,325);形状1
DEF VAR159=(R/0,//$85100,$85100,,/WR2//"/Channel/Parameter/r[u1,91]"/50,320/160,320,60/),

DEF work26=(I///,"Picture-1: NO.1",,/WR0///90,85/0,0,0);
DEF Picture2=(S///,"\\11-2.png",,/wr1///30,100,400,200/0,0,0,0//),


;YOUBIAN
;DEF VAR160=(I/*1=$85067,0=$85068//$85095,$85095,,/WR2//"/Channel/Parameter/r[u1,98]"/300,10,160/460,10,60/),
DEF VAR161=(R/0,//$85096,$85096,,/WR2//"/Channel/Parameter/r[u1,81]"/300,10,160/460,10,60/),
DEF VAR162=(R/0,//$85097,$85097,,/WR2//"/Channel/Parameter/r[u1,89]"/300,32,160/460,32,60/),
;DEF VAR163=(R/0,//$85098,$85098,,/WR2//"/Channel/Parameter/r[u1,90]"/300,60,160/460,60,60/),
DEF VAR158=(R/0,//$85094,$85094,,/WR2//"/Channel/Parameter/r[u1,88]"/300,54,160/460,54,60/),

;DEF work23=(I///,$85101,,/WR0///300,265);形状2
DEF VAR164=(R/0,//$85102,$85102,,/WR2//"/Channel/Parameter/r[u1,92]"/320,300/440,300,60/),
DEF VAR165=(R/0,//$85103,$85103,,/WR2//"/Channel/Parameter/r[u1,93]"/320,325/440,325,60/),
DEF VAR166=(R/0,//$85104,$85104,,/WR2//"/Channel/Parameter/r[u1,94]"/320,350/440,350,60/),

DEF work27=(I///,"Picture-2: NO.2",,/WR0///365,85/0,0,0);
DEF Picture3=(S///,"\\22-2.png",,/wr1///300,100,400,200/0,0,0,0//),



DEF Line1=(S////wr1////5,80,535,1/,1/);横
DEF Line2=(S////wr1////280,80,1,285/,1/);竖



HS1=($85001);"基本数据1"
HS2=($85002);"基本数据2"
HS3=($85003);"磨削参数"
HS4=($85004);"多线修整"
HS5=($85005);"单线修整"
HS6=($85006,se3);"齿型参数"
HS7=($85007);"环形槽"
HS8=($85008);"返回"
VS1=("")
VS2=("")
VS3=("")
VS4=("")
VS5=("")
VS6=("")
VS7=("")
VS8=("")    ;Softkey 8  Vertical: Exit

PRESS(HS1)
LM("MASK1")
END_PRESS

PRESS(HS2)
LM("MASK2")
END_PRESS

PRESS(HS3)
LM("MASK3")
END_PRESS

PRESS(HS4)
LM("MASK4")
END_PRESS

PRESS(HS5)
LM("MASK5")
END_PRESS

PRESS(HS6)
LM("MASK6")
END_PRESS

PRESS(HS7)
LM("MASK7")
END_PRESS

PRESS(VS7)
LM("MASK8")
END_PRESS

PRESS(HS8)  
  EXIT
END_PRESS

;MASK7:帮助 ////////////////////////////////////////////////////////////////////////
//M(Mask7/$85007/"panel_2_0_eng.png"/)


	DEF MOXUELEIXIN=(I//0/$85134,,,/WR4//"/NC/_N_NC_GD3_ACX/GRIND[1]"/0,0,0/0,0,0/);磨削类型,生成文件用,螺纹磨使用此行
	DEF PIECE_VOLUME=(I//1//WR4//"/NC/_N_NC_GD3_ACX/INI[27]"/0,0,0/0,0,0/);单件/批量磨削方式选择
	DEF GONGYILEIXIN=(I//1//WR4//"/NC/_N_NC_GD3_ACX/PROCESS[16]"/0,0,0/0,0,0);精简工艺参数/扩展工艺参数

	DEF MOXUETYPE=(I/*0=$85106,1=$85107//$85105,$85105,,/WR2//"/NC/_N_NC_GD3_ACX/INI[119]"/360,20,70/460,20,60/);磨削类型(0丝锥1环形槽)

	DEF LUOJU=(R/0,50//$85108,$85108,,/WR2//"/NC/_N_NC_GD3_ACX/INI[5]"/360,70,202/460,70,60/);工件螺距输入
	DEF CAOGESHU=(I/1,100//$85109,$85109,,/WR2//"/NC/_N_NC_GD3_ACX/INI[117]"/360,100,202/460,100,60/);环形槽个数
	DEF INITCAO=(I/1,100//$85512,$85512,,/WR2//"/NC/_N_NC_GD3_ACX/INI[159]"/360,130,202/460,130,60/);起始环形槽
	DEF YOUDUAN=(R/-2000,2000//$85110,$85110,,/WR2//"/NC/_N_NC_GD3_ACX/INI[3]"/360,160,202/460,160,60/);工件右端
	DEF GRIND_SAFE=(R/-500,500//$85111,$85111,,/WR2//"/NC/_N_NC_GD3_ACX/PROCESS[17]"/360,190,202/460,190,60/);磨削安全位置
	DEF X_QUIT=(R/-500,500//$85112,$85112,,/WR2//"$R[12]"/360,220,202/460,220,60/);退刀位置
	DEF ZUIDU=(R/-10,10//$85113,$85113,,/WR2//"/NC/_N_NC_GD3_ACX/INI[15]"/360,250,202/460,250,60/);锥度
	DEF DANGQIANJIECHU=(R///$85114,$85114,,/WR2//"/NC/_N_NC_GD3_ACX/PROCESS[5]"/360,290,202/460,290,60/);当前磨削接触位
	DEF WHELL_POS_INI=(R///$85115,$85115,,/WR2//"/NC/_N_NC_GD3_ACX/PROCESS[14]"/360,320,202/460,320,60/);初始磨削接触位(对刀完成后磨削接触位)

	;循环次数
	DEF VAR15=(I///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[121]"/0,0,0/132,78,60/);粗磨次数
	DEF VAR16=(I//0/$85117,,,/WR4//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[122]"/0,0,0/0,0,0/);半粗磨次数
	DEF VAR17=(I//0/$85118,,,/WR4//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[123]"/0,0,0/0,0,0/);半精磨次数
	DEF VAR18=(I///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[124]"/0,0,0/222,78,60/);精磨次数
	
	;进给深度
	DEF VAR19=(R///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[131]"/0,0,0/132,104,60);粗磨进给量
	DEF VAR22=(R///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[134]"/0,0,0/222,104,60);精磨进给量
	
	;磨削速度
	DEF VAR27=(R///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[141]"/0,0,0/132,129,60/);粗磨速度
	DEF VAR30=(R///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[144]"/0,0,0/222,129,60/);精磨速度

	;磨削几次修整设定
	DEF VAR41=(I///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[151]"/0,0,0/132,154,60/);粗磨
	DEF VAR44=(I///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[154]"/0,0,0/222,154,60/);终磨
	
	;砂轮线速度设定
	DEF VAR37=(R///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[161]"/0,0,0/132,179,60/);粗磨砂轮线速度
	DEF VAR40=(R///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[164]"/0,0,0/222,179,60/);精磨砂轮线速度
	
	;头架转速显示
	DEF VAR23=(R///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[61]"/0,0,0/132,203,60/);粗磨头架转速
	DEF VAR26=(R///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/TECHNOLOGY[64]"/0,0,0/222,203,60/);精磨头架转速

	;修整次数
	DEF VAR50=(I///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/TECH_DRESS_TIME[21]"/0,0,0/132,237,60/);粗磨修整次数
	DEF VAR53=(I///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/TECH_DRESS_TIME[24]"/0,0,0/222,237,60/);精磨修整次数
	
	;修整进给深度
	DEF VAR54=(R///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/TECH_DRESS_DEEP[22]"/0,0,0/132,262,60);粗磨修整进给量
	DEF VAR57=(R///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/TECH_DRESS_DEEP[25]"/0,0,0/222,262,60);精磨修整进给量
	
	;修整速度
	DEF VAR58=(R///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/TECH_DRESS_FEED[22]"/0,0,0/132,287,60/);粗磨修整速度
	DEF VAR61=(R///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/TECH_DRESS_FEED[25]"/0,0,0/222,287,60/);精磨修整速度
	
	;修整砂轮线速度设定
	DEF VAR62=(R///$85116,,,/WR2//"/NC/_N_NC_GD3_ACX/WHEEL_LINESPEED_DRESS[24]"/0,0,0/132,313,60/);粗磨修整砂轮线速度
	DEF VAR65=(R///$85119,,,/WR2//"/NC/_N_NC_GD3_ACX/WHEEL_LINESPEED_DRESS[27]"/0,0,0/222,313,60/);精磨砂修整轮线速度



HS1=($85001);"基本数据"
HS2=($85002);"磨削数据1"
HS3=($85003);"磨削数据2"
HS4=($85004);"磨削数据3"
HS5=($85005);"修整参数"
HS6=($85006);"齿型参数"
HS7=($85007,se3);"环形槽"
HS8=($85008);"返回"
VS1=("")
VS2=("")
VS3=("")
VS4=("")
VS5=("")
VS6=("")
VS7=("")
VS8=("")    ;Softkey 8  Vertical: Exit


PRESS(HS1)
LM("MASK1")
END_PRESS

PRESS(HS2)
LM("MASK2")
END_PRESS

PRESS(HS3)
LM("MASK3")
END_PRESS

PRESS(HS4)
LM("MASK4")
END_PRESS

PRESS(HS5)
LM("MASK5")
END_PRESS

PRESS(HS6)
LM("MASK6")
END_PRESS

PRESS(HS7)
LM("MASK7")
END_PRESS

PRESS(VS7)
LM("MASK8")
END_PRESS

PRESS(HS8)  
 EXIT
END_PRESS

//END
