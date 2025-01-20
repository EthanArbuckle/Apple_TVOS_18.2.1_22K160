uint64_t sub_373C()
{
  if (qword_20EF8 != -1) {
    dispatch_once(&qword_20EF8, &stru_1C3D0);
  }
  return qword_20EF0;
}

void sub_377C(id a1)
{
  qword_20EF0 = (uint64_t)os_log_create("com.apple.coreimage", "api");
}

uint64_t sub_37A8()
{
  if (qword_20F08 != -1) {
    dispatch_once(&qword_20F08, &stru_1C410);
  }
  return qword_20F00;
}

void sub_37E8(id a1)
{
  qword_20F00 = (uint64_t)os_log_create("com.apple.coreimage", "filter");
}

void sub_607C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_608C( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

__n128 sub_60D4@<Q0>(uint64_t a1@<X0>, int *a2@<X1>, __n128 *a3@<X8>)
{
  v3 = (__n128 *)(a1 + 20LL * *a2);
  __n128 result = v3[2];
  *a3 = result;
  a3[1].n128_u32[0] = v3[3].n128_u32[0];
  return result;
}

uint64_t sub_60F4(_DWORD *a1)
{
  return (4 * *a1 + 17);
}

uint64_t sub_6104(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 12) + *(_DWORD *)(a1 + 4));
}

uint64_t sub_6114(_DWORD *a1)
{
  return ((a1[3] + a1[1]) * *a1);
}

void sub_6128(int a1@<W0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 + 4) = 0;
  if ((a1 - 41) > 0xFFFFFFD7)
  {
    switch(a1)
    {
      case 1:
        *(_DWORD *)a2 = 1;
        *(_OWORD *)(a2 + 32) = xmmword_15200;
        *(_OWORD *)(a2 + 48) = xmmword_15210;
        *(_OWORD *)(a2 + 64) = xmmword_15220;
        *(_OWORD *)(a2 + 80) = xmmword_15230;
        *(_OWORD *)(a2 + 96) = xmmword_15240;
        int v4 = 7;
        break;
      case 2:
        *(void *)a2 = 0x600000002LL;
        *(_DWORD *)(a2 + 8) = 18;
        *(_OWORD *)(a2 + 32) = xmmword_151B0;
        *(_OWORD *)(a2 + 48) = xmmword_151C0;
        *(_OWORD *)(a2 + 64) = xmmword_151D0;
        *(_OWORD *)(a2 + 80) = xmmword_151E0;
        __int128 v5 = xmmword_151F0;
        int v4 = 10;
        goto LABEL_52;
      case 3:
        *(void *)a2 = 0x600000003LL;
        *(_DWORD *)(a2 + 8) = 22;
        *(_OWORD *)(a2 + 32) = xmmword_15170;
        *(_OWORD *)(a2 + 48) = xmmword_15180;
        *(_OWORD *)(a2 + 64) = xmmword_15060;
        *(_OWORD *)(a2 + 80) = xmmword_15190;
        __int128 v5 = xmmword_151A0;
        int v4 = 15;
        goto LABEL_52;
      case 4:
        *(void *)a2 = 0x600000004LL;
        *(_DWORD *)(a2 + 8) = 22;
        *(_OWORD *)(a2 + 32) = xmmword_15120;
        *(_OWORD *)(a2 + 48) = xmmword_15130;
        *(_OWORD *)(a2 + 64) = xmmword_15140;
        *(_OWORD *)(a2 + 80) = xmmword_15150;
        __int128 v5 = xmmword_15160;
        int v4 = 20;
        goto LABEL_52;
      case 5:
        *(void *)a2 = 0x600000005LL;
        *(_DWORD *)(a2 + 8) = 30;
        *(_OWORD *)(a2 + 32) = xmmword_150E0;
        *(_OWORD *)(a2 + 48) = xmmword_150F0;
        *(_OWORD *)(a2 + 64) = xmmword_15060;
        *(_OWORD *)(a2 + 80) = xmmword_15100;
        __int128 v5 = xmmword_15110;
        goto LABEL_34;
      case 6:
        *(void *)a2 = 0x600000006LL;
        *(_DWORD *)(a2 + 8) = 34;
        *(_OWORD *)(a2 + 32) = xmmword_15090;
        *(_OWORD *)(a2 + 48) = xmmword_150A0;
        *(_OWORD *)(a2 + 64) = xmmword_150B0;
        *(_OWORD *)(a2 + 80) = xmmword_150C0;
        __int128 v6 = xmmword_150D0;
        goto LABEL_16;
      case 7:
        *(_OWORD *)a2 = xmmword_15030;
        *(_OWORD *)(a2 + 32) = xmmword_15040;
        *(_OWORD *)(a2 + 48) = xmmword_15050;
        *(_OWORD *)(a2 + 64) = xmmword_15060;
        *(_OWORD *)(a2 + 80) = xmmword_15070;
        __int128 v7 = xmmword_15080;
        goto LABEL_18;
      case 8:
        *(_OWORD *)a2 = xmmword_14FD0;
        *(_OWORD *)(a2 + 32) = xmmword_14FE0;
        *(_OWORD *)(a2 + 48) = xmmword_14FF0;
        *(_OWORD *)(a2 + 64) = xmmword_15000;
        *(_OWORD *)(a2 + 80) = xmmword_15010;
        __int128 v8 = xmmword_15020;
        goto LABEL_20;
      case 9:
        *(_OWORD *)a2 = xmmword_14F70;
        *(_OWORD *)(a2 + 32) = xmmword_14F80;
        *(_OWORD *)(a2 + 48) = xmmword_14F90;
        *(_OWORD *)(a2 + 64) = xmmword_14FA0;
        *(_OWORD *)(a2 + 80) = xmmword_14FB0;
        *(_OWORD *)(a2 + 96) = xmmword_14FC0;
        int v4 = 30;
        break;
      case 10:
        *(_OWORD *)a2 = xmmword_14F10;
        *(_OWORD *)(a2 + 32) = xmmword_14F20;
        *(_OWORD *)(a2 + 48) = xmmword_14F30;
        *(_OWORD *)(a2 + 64) = xmmword_14F40;
        *(_OWORD *)(a2 + 80) = xmmword_14F50;
        __int128 v6 = xmmword_14F60;
LABEL_16:
        *(_OWORD *)(a2 + 96) = v6;
        int v4 = 18;
        break;
      case 11:
        *(_OWORD *)a2 = xmmword_14EB0;
        *(_OWORD *)(a2 + 32) = xmmword_14EC0;
        *(_OWORD *)(a2 + 48) = xmmword_14ED0;
        *(_OWORD *)(a2 + 64) = xmmword_14EE0;
        *(_OWORD *)(a2 + 80) = xmmword_14EF0;
        __int128 v7 = xmmword_14F00;
LABEL_18:
        *(_OWORD *)(a2 + 96) = v7;
        int v4 = 20;
        break;
      case 12:
        *(_OWORD *)a2 = xmmword_14E50;
        *(_OWORD *)(a2 + 32) = xmmword_14E60;
        *(_OWORD *)(a2 + 48) = xmmword_14E70;
        *(_OWORD *)(a2 + 64) = xmmword_14E80;
        *(_OWORD *)(a2 + 80) = xmmword_14E90;
        __int128 v8 = xmmword_14EA0;
LABEL_20:
        *(_OWORD *)(a2 + 96) = v8;
        int v4 = 24;
        break;
      case 13:
        *(_OWORD *)a2 = xmmword_14DF0;
        *(_OWORD *)(a2 + 32) = xmmword_14E00;
        *(_OWORD *)(a2 + 48) = xmmword_14E10;
        *(_OWORD *)(a2 + 64) = xmmword_14E20;
        *(_OWORD *)(a2 + 80) = xmmword_14E30;
        *(_OWORD *)(a2 + 96) = xmmword_14E40;
        int v4 = 26;
        break;
      case 14:
        *(_OWORD *)a2 = xmmword_14D90;
        *(_DWORD *)(a2 + 16) = 66;
        *(_OWORD *)(a2 + 32) = xmmword_14DA0;
        *(_OWORD *)(a2 + 48) = xmmword_14DB0;
        *(_OWORD *)(a2 + 64) = xmmword_14DC0;
        *(_OWORD *)(a2 + 80) = xmmword_14DD0;
        __int128 v5 = xmmword_14DE0;
        goto LABEL_51;
      case 15:
        *(_OWORD *)a2 = xmmword_14D30;
        *(_DWORD *)(a2 + 16) = 70;
        *(_OWORD *)(a2 + 32) = xmmword_14D40;
        *(_OWORD *)(a2 + 48) = xmmword_14D50;
        *(_OWORD *)(a2 + 64) = xmmword_14D60;
        *(_OWORD *)(a2 + 80) = xmmword_14D70;
        __int128 v5 = xmmword_14D80;
        int v4 = 22;
        goto LABEL_52;
      case 16:
        *(_OWORD *)a2 = xmmword_14CD0;
        *(_DWORD *)(a2 + 16) = 74;
        *(_OWORD *)(a2 + 32) = xmmword_14CE0;
        *(_OWORD *)(a2 + 48) = xmmword_14CF0;
        *(_OWORD *)(a2 + 64) = xmmword_14D00;
        *(_OWORD *)(a2 + 80) = xmmword_14D10;
        __int128 v5 = xmmword_14D20;
        int v4 = 24;
        goto LABEL_52;
      case 17:
        *(_OWORD *)a2 = xmmword_14C70;
        *(_DWORD *)(a2 + 16) = 78;
        *(_OWORD *)(a2 + 32) = xmmword_14C80;
        *(_OWORD *)(a2 + 48) = xmmword_14C90;
        *(_OWORD *)(a2 + 64) = xmmword_14CA0;
        *(_OWORD *)(a2 + 80) = xmmword_14CB0;
        __int128 v5 = xmmword_14CC0;
        goto LABEL_36;
      case 18:
        *(_OWORD *)a2 = xmmword_14C10;
        *(_DWORD *)(a2 + 16) = 82;
        *(_OWORD *)(a2 + 32) = xmmword_14C20;
        *(_OWORD *)(a2 + 48) = xmmword_14C30;
        *(_OWORD *)(a2 + 64) = xmmword_14C40;
        *(_OWORD *)(a2 + 80) = xmmword_14C50;
        __int128 v5 = xmmword_14C60;
        goto LABEL_51;
      case 19:
        *(_OWORD *)a2 = xmmword_14BB0;
        *(_DWORD *)(a2 + 16) = 86;
        *(_OWORD *)(a2 + 32) = xmmword_14BC0;
        *(_OWORD *)(a2 + 48) = xmmword_14BD0;
        *(_OWORD *)(a2 + 64) = xmmword_14BE0;
        *(_OWORD *)(a2 + 80) = xmmword_14BF0;
        __int128 v5 = xmmword_14C00;
        goto LABEL_36;
      case 20:
        *(_OWORD *)a2 = xmmword_14B50;
        *(_DWORD *)(a2 + 16) = 90;
        *(_OWORD *)(a2 + 32) = xmmword_14B60;
        *(_OWORD *)(a2 + 48) = xmmword_14B70;
        *(_OWORD *)(a2 + 64) = xmmword_14B80;
        *(_OWORD *)(a2 + 80) = xmmword_14B90;
        __int128 v5 = xmmword_14BA0;
        goto LABEL_36;
      case 21:
        *(_OWORD *)a2 = xmmword_14B00;
        *(void *)(a2 + 16) = 0x5E00000048LL;
        *(_OWORD *)(a2 + 32) = xmmword_14B10;
        *(_OWORD *)(a2 + 48) = xmmword_14B20;
        *(_OWORD *)(a2 + 64) = xmmword_14B30;
        *(_OWORD *)(a2 + 80) = xmmword_14980;
        __int128 v5 = xmmword_14B40;
        goto LABEL_36;
      case 22:
        *(_OWORD *)a2 = xmmword_14AA0;
        *(void *)(a2 + 16) = 0x620000004ALL;
        *(_OWORD *)(a2 + 32) = xmmword_14AB0;
        *(_OWORD *)(a2 + 48) = xmmword_14AC0;
        *(_OWORD *)(a2 + 64) = xmmword_14AD0;
        *(_OWORD *)(a2 + 80) = xmmword_14AE0;
        __int128 v5 = xmmword_14AF0;
        goto LABEL_36;
      case 23:
        *(_OWORD *)a2 = xmmword_14A50;
        *(void *)(a2 + 16) = 0x660000004ALL;
        *(_OWORD *)(a2 + 32) = xmmword_14A60;
        *(_OWORD *)(a2 + 48) = xmmword_14A70;
        *(_OWORD *)(a2 + 64) = xmmword_14A80;
        *(_OWORD *)(a2 + 80) = xmmword_14500;
        __int128 v5 = xmmword_14A90;
        goto LABEL_51;
      case 24:
        *(_OWORD *)a2 = xmmword_149F0;
        *(void *)(a2 + 16) = 0x6A00000050LL;
        *(_OWORD *)(a2 + 32) = xmmword_14A00;
        *(_OWORD *)(a2 + 48) = xmmword_14A10;
        *(_OWORD *)(a2 + 64) = xmmword_14A20;
        *(_OWORD *)(a2 + 80) = xmmword_14A30;
        __int128 v5 = xmmword_14A40;
        goto LABEL_51;
      case 25:
        *(_OWORD *)a2 = xmmword_149A0;
        *(void *)(a2 + 16) = 0x6E00000054LL;
        *(_OWORD *)(a2 + 32) = xmmword_149B0;
        *(_OWORD *)(a2 + 48) = xmmword_149C0;
        *(_OWORD *)(a2 + 64) = xmmword_149D0;
        *(_OWORD *)(a2 + 80) = xmmword_14490;
        __int128 v5 = xmmword_149E0;
LABEL_34:
        int v4 = 26;
        goto LABEL_52;
      case 26:
        *(_OWORD *)a2 = xmmword_14940;
        *(void *)(a2 + 16) = 0x7200000056LL;
        *(_OWORD *)(a2 + 32) = xmmword_14950;
        *(_OWORD *)(a2 + 48) = xmmword_14960;
        *(_OWORD *)(a2 + 64) = xmmword_14970;
        *(_OWORD *)(a2 + 80) = xmmword_14980;
        __int128 v5 = xmmword_14990;
LABEL_36:
        int v4 = 28;
        goto LABEL_52;
      case 27:
        *(_OWORD *)a2 = xmmword_148E0;
        *(void *)(a2 + 16) = 0x760000005ALL;
        *(_OWORD *)(a2 + 32) = xmmword_148F0;
        *(_OWORD *)(a2 + 48) = xmmword_14900;
        *(_OWORD *)(a2 + 64) = xmmword_14910;
        *(_OWORD *)(a2 + 80) = xmmword_14920;
        __int128 v5 = xmmword_14930;
        goto LABEL_51;
      case 28:
        *(_OWORD *)a2 = xmmword_14880;
        *(void *)(a2 + 16) = 0x620000004ALL;
        *(_OWORD *)(a2 + 32) = xmmword_14890;
        *(_OWORD *)(a2 + 48) = xmmword_148A0;
        *(_OWORD *)(a2 + 64) = xmmword_148B0;
        *(_OWORD *)(a2 + 80) = xmmword_148C0;
        __int128 v5 = xmmword_148D0;
        goto LABEL_51;
      case 29:
        *(_OWORD *)a2 = xmmword_14820;
        *(void *)(a2 + 16) = 0x660000004ELL;
        *(_DWORD *)(a2 + 24) = 126;
        *(_OWORD *)(a2 + 32) = xmmword_14830;
        *(_OWORD *)(a2 + 48) = xmmword_14840;
        *(_OWORD *)(a2 + 64) = xmmword_14850;
        *(_OWORD *)(a2 + 80) = xmmword_14860;
        __int128 v5 = xmmword_14870;
        goto LABEL_51;
      case 30:
        *(_OWORD *)a2 = xmmword_147C0;
        *(void *)(a2 + 16) = 0x680000004ELL;
        *(_DWORD *)(a2 + 24) = 130;
        *(_OWORD *)(a2 + 32) = xmmword_147D0;
        *(_OWORD *)(a2 + 48) = xmmword_147E0;
        *(_OWORD *)(a2 + 64) = xmmword_147F0;
        *(_OWORD *)(a2 + 80) = xmmword_14800;
        __int128 v5 = xmmword_14810;
        goto LABEL_51;
      case 31:
        *(_OWORD *)a2 = xmmword_14760;
        *(void *)(a2 + 16) = 0x6C00000052LL;
        *(_DWORD *)(a2 + 24) = 134;
        *(_OWORD *)(a2 + 32) = xmmword_14770;
        *(_OWORD *)(a2 + 48) = xmmword_14780;
        *(_OWORD *)(a2 + 64) = xmmword_14790;
        *(_OWORD *)(a2 + 80) = xmmword_147A0;
        __int128 v5 = xmmword_147B0;
        goto LABEL_51;
      case 32:
        *(_OWORD *)a2 = xmmword_14700;
        *(void *)(a2 + 16) = 0x7000000056LL;
        *(_DWORD *)(a2 + 24) = 138;
        *(_OWORD *)(a2 + 32) = xmmword_14710;
        *(_OWORD *)(a2 + 48) = xmmword_14720;
        *(_OWORD *)(a2 + 64) = xmmword_14730;
        *(_OWORD *)(a2 + 80) = xmmword_14740;
        __int128 v5 = xmmword_14750;
        goto LABEL_51;
      case 33:
        *(_OWORD *)a2 = xmmword_146B0;
        *(void *)(a2 + 16) = 0x7200000056LL;
        *(_DWORD *)(a2 + 24) = 142;
        *(_OWORD *)(a2 + 32) = xmmword_146C0;
        *(_OWORD *)(a2 + 48) = xmmword_14670;
        *(_OWORD *)(a2 + 64) = xmmword_146D0;
        *(_OWORD *)(a2 + 80) = xmmword_146E0;
        __int128 v5 = xmmword_146F0;
        goto LABEL_51;
      case 34:
        *(_OWORD *)a2 = xmmword_14650;
        *(void *)(a2 + 16) = 0x760000005ALL;
        *(_DWORD *)(a2 + 24) = 146;
        *(_OWORD *)(a2 + 32) = xmmword_14660;
        *(_OWORD *)(a2 + 48) = xmmword_14670;
        *(_OWORD *)(a2 + 64) = xmmword_14680;
        *(_OWORD *)(a2 + 80) = xmmword_14690;
        __int128 v5 = xmmword_146A0;
        goto LABEL_51;
      case 35:
        *(_OWORD *)a2 = xmmword_145F0;
        *(_OWORD *)(a2 + 16) = xmmword_14600;
        *(_OWORD *)(a2 + 32) = xmmword_14610;
        *(_OWORD *)(a2 + 48) = xmmword_14620;
        *(_OWORD *)(a2 + 64) = xmmword_14630;
        *(_OWORD *)(a2 + 80) = xmmword_14500;
        __int128 v5 = xmmword_14640;
        goto LABEL_51;
      case 36:
        *(_OWORD *)a2 = xmmword_14590;
        *(_OWORD *)(a2 + 16) = xmmword_145A0;
        *(_OWORD *)(a2 + 32) = xmmword_145B0;
        *(_OWORD *)(a2 + 48) = xmmword_145C0;
        *(_OWORD *)(a2 + 64) = xmmword_145D0;
        *(_OWORD *)(a2 + 80) = xmmword_14570;
        __int128 v5 = xmmword_145E0;
        goto LABEL_51;
      case 37:
        *(_OWORD *)a2 = xmmword_14520;
        *(_OWORD *)(a2 + 16) = xmmword_14530;
        *(_OWORD *)(a2 + 32) = xmmword_14540;
        *(_OWORD *)(a2 + 48) = xmmword_14550;
        *(_OWORD *)(a2 + 64) = xmmword_14560;
        *(_OWORD *)(a2 + 80) = xmmword_14570;
        __int128 v5 = xmmword_14580;
        goto LABEL_51;
      case 38:
        *(_OWORD *)a2 = xmmword_144B0;
        *(_OWORD *)(a2 + 16) = xmmword_144C0;
        *(_OWORD *)(a2 + 32) = xmmword_144D0;
        *(_OWORD *)(a2 + 48) = xmmword_144E0;
        *(_OWORD *)(a2 + 64) = xmmword_144F0;
        *(_OWORD *)(a2 + 80) = xmmword_14500;
        __int128 v5 = xmmword_14510;
        goto LABEL_51;
      case 39:
        *(_OWORD *)a2 = xmmword_14440;
        *(_OWORD *)(a2 + 16) = xmmword_14450;
        *(_OWORD *)(a2 + 32) = xmmword_14460;
        *(_OWORD *)(a2 + 48) = xmmword_14470;
        *(_OWORD *)(a2 + 64) = xmmword_14480;
        *(_OWORD *)(a2 + 80) = xmmword_14490;
        __int128 v5 = xmmword_144A0;
        goto LABEL_51;
      case 40:
        *(_OWORD *)a2 = xmmword_143D0;
        *(_OWORD *)(a2 + 16) = xmmword_143E0;
        *(_OWORD *)(a2 + 32) = xmmword_143F0;
        *(_OWORD *)(a2 + 48) = xmmword_14400;
        *(_OWORD *)(a2 + 64) = xmmword_14410;
        *(_OWORD *)(a2 + 80) = xmmword_14420;
        __int128 v5 = xmmword_14430;
LABEL_51:
        int v4 = 30;
LABEL_52:
        *(_OWORD *)(a2 + 96) = v5;
        break;
      default:
        int v4 = *(_DWORD *)(a2 + 32);
        break;
    }

    uint64_t v9 = 0LL;
    int v10 = 0;
    char v11 = 1;
    do
    {
      char v12 = v11;
      v10 += (*(_DWORD *)(a2 + 8 * v9 + 40) + v4) * *(_DWORD *)(a2 + 8 * v9 + 36);
      uint64_t v9 = 1LL;
      char v11 = 0;
    }

    while ((v12 & 1) != 0);
    *(_DWORD *)(a2 + 112) = v10;
  }

  else
  {
    uint64_t v2 = sub_37A8();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10CD0(v3);
    }
  }
}

id sub_6D88(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  while (a1)
  {
    uint64_t v3 = *(int *)(a1 + 8);
    else {
      int v4 = off_1C5B0[v3];
    }
    __int128 v5 = v29;
    v26 = v29;
    __int128 v27 = xmmword_15320;
    unsigned int v28 = 0;
    sub_7178(a1);
    uint64_t v6 = v28 - 8 * v27 + 32;
    sub_7220((uint64_t)&v26);
    v23 = v29;
    __int128 v24 = xmmword_15320;
    int v25 = 0;
    __int128 v7 = malloc(0x20uLL);
    uint64_t v8 = 0LL;
    unint64_t v9 = 0LL;
    int v10 = 0;
    uint64_t v11 = 4LL;
    do
    {
      if (!v10)
      {
        v9 <<= 8;
        if (v11)
        {
          --v11;
          unsigned int v12 = *v5++;
          v9 |= v12;
          int v10 = 8;
        }

        else
        {
          int v10 = 8;
          uint64_t v11 = -1LL;
        }
      }

      if (((v9 >> --v10) & 1) != 0) {
        char v13 = 49;
      }
      else {
        char v13 = 48;
      }
      v7[v8++] = v13;
    }

    while (v8 != 32);
    v14 = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytesNoCopy:length:encoding:freeWhenDone:",  v7,  32LL,  1LL,  1LL);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringToIndex:](v14, "substringToIndex:", v6));

    sub_7220((uint64_t)&v23);
    id v16 = v15;
    id v17 = [v16 UTF8String];
    uint64_t v18 = ((uint64_t (*)(uint64_t))v4)(a1 + 12);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%-15s %@",  v17,  v19));
    [v2 addObject:v20];

    a1 = *(void *)a1;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v2 componentsJoinedByString:@"\n"]);

  return v21;
}

CFStringRef sub_6F88()
{
  return @"Head";
}

NSString *sub_6F94(int *a1)
{
  uint64_t v1 = *a1;
  else {
    uint64_t v2 = (const __CFString *)*((void *)&off_1C5E8 + v1);
  }
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ '%c'",  v2,  *((unsigned __int8 *)a1 + 4));
}

NSString *sub_6FF0(unsigned __int8 *a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ '%c'", @"B", *a1);
}

NSString *sub_7030(int *a1)
{
  uint64_t v1 = *a1;
  else {
    uint64_t v2 = (const __CFString *)*((void *)&off_1C5E8 + v1);
  }
  uint64_t v3 = a1[1];
  else {
    int v4 = (const __CFString *)*((void *)&off_1C5E8 + v3);
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Latch %@->%@", v2, v4);
}

NSString *sub_70A4(int *a1)
{
  uint64_t v1 = *a1;
  else {
    uint64_t v2 = (const __CFString *)*((void *)&off_1C5E8 + v1);
  }
  uint64_t v3 = a1[1];
  else {
    int v4 = (const __CFString *)*((void *)&off_1C5E8 + v3);
  }
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"Shift %@->%@", v2, v4);
}

CFStringRef sub_7118(int *a1)
{
  uint64_t v1 = *a1;
  else {
    return (const __CFString *)*((void *)&off_1C620 + v1);
  }
}

NSString *sub_7140(unsigned __int16 *a1)
{
  return +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"len %d", *a1);
}

uint64_t sub_7178(uint64_t a1)
{
  switch(*(_DWORD *)(a1 + 8))
  {
    case 0:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = nullsub_2;
      goto LABEL_10;
    case 1:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (uint64_t (*)())sub_8B40;
      goto LABEL_10;
    case 2:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (uint64_t (*)())sub_8BDC;
      goto LABEL_10;
    case 3:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (uint64_t (*)())sub_8BF0;
      goto LABEL_10;
    case 4:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (uint64_t (*)())sub_8C38;
      goto LABEL_10;
    case 5:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (uint64_t (*)())sub_8C70;
      goto LABEL_10;
    case 6:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (uint64_t (*)())sub_8C84;
LABEL_10:
      v1[53].base_prots = (__objc2_prot_list *)v2;
      uint64_t result = ((uint64_t (*)(uint64_t))v2)(a1 + 12);
      break;
    default:
      uint64_t result = ((uint64_t (*)(uint64_t))off_20F10)(a1 + 12);
      break;
  }

  return result;
}

uint64_t sub_7220(uint64_t result)
{
  uint64_t v1 = result;
  for (int i = *(_DWORD *)(result + 24); i; int i = *(_DWORD *)(v1 + 24))
    uint64_t result = sub_8DA4(v1, 0LL, -i & 7);
  if (*(void *)(v1 + 8))
  {
    do
    {
      uint64_t v3 = (_BYTE *)(*(void *)v1)++;
      _BYTE *v3 = 0;
      uint64_t v4 = *(void *)(v1 + 8) - 1LL;
      *(void *)(v1 + 8) = v4;
    }

    while (v4);
  }

  return result;
}

uint64_t sub_7288(void *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = a1;
  uint64_t v2 = 0LL;
  do
  {
    uint64_t v6 = &v9;
    __int128 v7 = xmmword_15320;
    unsigned int v8 = 0;
    sub_7178((uint64_t)v1);
    uint64_t v3 = v7;
    uint64_t v4 = v8;
    sub_7220((uint64_t)&v6);
    uint64_t v2 = v2 - 8 * v3 + v4 + 32;
    uint64_t v1 = (void *)*v1;
  }

  while (v1);
  return v2;
}

CGImageRef sub_7320(void *a1, void *a2)
{
  id v3 = a1;
  id v232 = a2;
  v233 = v3;
  if (!v3)
  {
    v222 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v223 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CGImageRef AztecCreateBarcodeImage(NSData *__strong, NSDictionary *__strong, NSError *__autoreleasing *)"));
    uint64_t decode = (uint64_t)@"msgData != nil";
    [v222 handleFailureInFunction:v223 file:@"Aztec.m" lineNumber:1526 description:@"Invalid parameter not satisfying: %@"];
  }

  if (qword_21020 != -1) {
    dispatch_once(&qword_21020, &stru_1C4C0);
  }
  if (![v233 length])
  {
    v224 = @"The message must contain at least one character.";
LABEL_334:
    sub_8A68(v224, v4, v5, v6, v7, v8, v9, v10, decode);
    goto LABEL_335;
  }

  if ((unint64_t)[v233 length] >= 0x9C01)
  {
    v224 = @"The message is too long for an Aztec barcode.";
    goto LABEL_334;
  }

  BOOL v11 = sub_8F04(v232, @"AztecOptionMessageCodeWordCount", dword_15784)
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    int v13 = sub_8F04(v232, @"AztecOptionUseCompactStyle", dword_1579C);
    BOOL v257 = v13 != 0;
    int v14 = sub_8F04(v232, @"AztecOptionMessageCodeWordCount", dword_15784);
    int v15 = sub_8F04(v232, @"AztecOptionLayers", dword_15790);
    int v16 = v15;
    id v17 = &unk_15364;
    if (v13) {
      id v17 = &unk_15350;
    }
    int v18 = v17[v15];
    if (v15 >= 3)
    {
      if (v15 >= 9)
      {
        else {
          int v19 = 10;
        }
      }

      else
      {
        int v19 = 8;
      }
    }

    else
    {
      int v19 = 6;
    }

    signed int v253 = v19;
    if (v14 >= v18)
    {
      v224 = @"Number of message codewords must be less than the number of symbol codewords.";
    }

    else
    {
      if (v19 * v14 <= (unint64_t)(8 * (void)[v233 length]))
      {
        id v75 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData,  "dataWithLength:",  4LL * v18));
        id v76 = v233;
        int v77 = v14;
        id v78 = v76;
        *(void *)&v273[0] = [v78 bytes];
        *((void *)&v273[0] + 1) = [v78 length];
        *(void *)&v273[1] = 0LL;
        DWORD2(v273[1]) = 0;
        id v79 = v75;
        v80 = [v79 mutableBytes];
        if (v77 >= 1)
        {
          v81 = v80;
          uint64_t v82 = v77;
          do
          {
            *v81++ = sub_8E0C((uint64_t)v273, v253);
            --v82;
          }

          while (v82);
        }

        goto LABEL_200;
      }

      v224 = @"Insufficient message data supplied for Aztec symbol with explicit geometry";
    }

    goto LABEL_334;
  }

  id v20 = v233;
  v249 = (unsigned __int8 *)[v20 bytes];
  int v21 = [v20 length];
  v259 = (void **)sub_8FC4(6 * v21);
  __int128 v271 = xmmword_157A8;
  uint64_t v272 = 4294967297000000LL;
  memset((char *)v273 + 8, 0, 40);
  size_t v22 = sub_900C(v259);
  id v242 = v20;
  *(_DWORD *)(v22 + 8) = 0;
  *(void *)&v273[0] = v22;
  if (v21 > 0)
  {
    uint64_t v23 = 0LL;
    uint64_t v24 = 0LL;
    uint64_t v246 = v21;
    while (1)
    {
      uint64_t v25 = 0LL;
      v26 = dword_15508;
      do
      {
        uint64_t v27 = v24;
        uint64_t v28 = 0LL;
        while (1)
        {
          int v29 = v26[v28] + *((_DWORD *)&v271 + v25);
          if (v29 < *((_DWORD *)&v271 + v28))
          {
            *((_DWORD *)&v271 + v28) = v29;
            uint64_t v30 = *((void *)v273 + v25);
            size_t v31 = sub_900C(v259);
            *(void *)size_t v31 = v30;
            *(_DWORD *)(v31 + 8) = 3;
            *(_DWORD *)(v31 + 12) = v25;
            *(_DWORD *)(v31 + 16) = v28;
            *((void *)v273 + v28) = v31;
            if (v28 == 5) {
              break;
            }
          }

          if (++v28 == 6)
          {
            uint64_t v24 = v27;
            goto LABEL_28;
          }
        }

        size_t v32 = sub_900C(v259);
        *(void *)size_t v32 = v31;
        *(_DWORD *)(v32 + 8) = 6;
        *(_WORD *)(v32 + 12) = 0;
        *((void *)&v273[2] + 1) = v32;
        uint64_t v24 = dword_157C0[v25];
LABEL_28:
        ++v25;
        v26 += 6;
      }

      while (v25 != 5);
      uint64_t v33 = 0LL;
      uint64_t v258 = v24;
      v34 = &dword_15508[6 * v24];
      do
      {
        int v35 = v34[v33] + HIDWORD(v272);
        if (v35 < *((_DWORD *)&v271 + v33))
        {
          *((_DWORD *)&v271 + v33) = v35;
          uint64_t v36 = *((void *)&v273[2] + 1);
          size_t v37 = sub_900C(v259);
          *(void *)size_t v37 = v36;
          *(void *)(v37 + 8) = 0x500000003LL;
          *(_DWORD *)(v37 + 16) = v258;
          size_t v38 = sub_900C(v259);
          *(void *)size_t v38 = v37;
          *(_DWORD *)(v38 + 8) = 3;
          *(_DWORD *)(v38 + 12) = v258;
          *(_DWORD *)(v38 + 16) = v33;
          *((void *)v273 + v33) = v38;
        }

        ++v33;
      }

      while (v33 != 6);
      __int128 v267 = 0u;
      __int128 v268 = 0u;
      __int128 v266 = 0u;
      memset_pattern16(&__b, &unk_15330, 0x18uLL);
      uint64_t v39 = 0LL;
      uint64_t v40 = v249[v23];
      uint64_t v252 = v23;
      uint64_t v254 = *((void *)&v273[2] + 1);
      v41 = dword_156B8;
      do
      {
        if (((unsigned int (*)(uint64_t))off_1C4E0[v39])(v40))
        {
          int v42 = dword_157D8[v39];
          int v43 = v42 + *((_DWORD *)&v271 + v39);
          if (v43 < *((_DWORD *)&__b + v39))
          {
            *((_DWORD *)&__b + v39) = v43;
            if (v39 == 5)
            {
              if (*(_DWORD *)(v254 + 8) == 2)
              {
                __int16 v44 = *(unsigned __int8 *)(v254 + 13);
                if (((v44 + 1) & 0x100) != 0) {
                  char v45 = -1;
                }
                else {
                  char v45 = v44 + 1;
                }
              }

              else
              {
                char v45 = 1;
              }

              size_t v48 = sub_900C(v259);
              *(void *)size_t v48 = v254;
              *(_DWORD *)(v48 + 8) = 2;
              *(_BYTE *)(v48 + 12) = v40;
              *(_BYTE *)(v48 + 13) = v45;
              *((void *)&v268 + 1) = v48;
            }

            else
            {
              uint64_t v46 = *((void *)v273 + v39);
              size_t v47 = sub_900C(v259);
              *(void *)size_t v47 = v46;
              *(_DWORD *)(v47 + 8) = 1;
              *(_DWORD *)(v47 + 12) = v39;
              *(_BYTE *)(v47 + 16) = v40;
              *((void *)&v266 + v39) = v47;
            }
          }

          uint64_t v49 = 0LL;
          v50 = v41;
          do
          {
            if (v39 != v49)
            {
              int v51 = *((_DWORD *)&v271 + v49) + v42 + *v50;
              if (v51 < *((_DWORD *)&__b + v49))
              {
                *((_DWORD *)&__b + v49) = v51;
                uint64_t v52 = *((void *)v273 + v49);
                size_t v53 = sub_900C(v259);
                *(void *)size_t v53 = v52;
                *(_DWORD *)(v53 + 8) = 4;
                *(_DWORD *)(v53 + 12) = v49;
                *(_DWORD *)(v53 + 16) = v39;
                size_t v54 = sub_900C(v259);
                *(void *)size_t v54 = v53;
                *(_DWORD *)(v54 + 8) = 1;
                *(_DWORD *)(v54 + 12) = v39;
                *(_BYTE *)(v54 + 16) = v40;
                *((void *)&v266 + v49) = v54;
              }
            }

            ++v49;
            v50 += 6;
          }

          while (v49 != 6);
        }

        ++v39;
        ++v41;
      }

      while (v39 != 6);
      if (!v252) {
        goto LABEL_67;
      }
      int v55 = HIDWORD(v271);
      if (SHIDWORD(v271) >= SHIDWORD(__b)) {
        goto LABEL_67;
      }
      int v56 = v249[(v252 - 1)];
      int v57 = v249[v252];
      if (v56 == 13 && v57 == 10) {
        break;
      }
      if (v56 == 46 && v57 == 32)
      {
        int v58 = 3;
        goto LABEL_64;
      }

      if (v56 == 44 && v57 == 32)
      {
        int v58 = 4;
        goto LABEL_64;
      }

      if (v56 == 58 && v57 == 32)
      {
        int v58 = 5;
        goto LABEL_64;
      }

LABEL_67:
      if (*(_BYTE *)(*((void *)&v268 + 1) + 13LL) == 32) {
        HIDWORD(v270) += 11;
      }
      uint64_t v23 = v252 + 1;
      __int128 v271 = __b;
      uint64_t v272 = v270;
      v273[0] = v266;
      v273[1] = v267;
      v273[2] = v268;
      uint64_t v24 = v258;
      if (v252 + 1 == v246) {
        goto LABEL_70;
      }
    }

    int v58 = 2;
LABEL_64:
    if (*(_DWORD *)(*((void *)&v273[1] + 1) + 8LL) == 1
      && *(unsigned __int8 *)(*((void *)&v273[1] + 1) + 16LL) == v56)
    {
      uint64_t v59 = **((void **)&v273[1] + 1);
      size_t v60 = sub_900C(v259);
      *(void *)size_t v60 = v59;
      *(_DWORD *)(v60 + 8) = 5;
      *(_DWORD *)(v60 + 12) = v58;
      *((void *)&v267 + 1) = v60;
      HIDWORD(__b) = v55;
    }

    goto LABEL_67;
  }

LABEL_70:
  uint64_t v61 = 0LL;
  unsigned int v62 = 0;
  signed int v63 = 0x7FFFFFFF;
  do
  {
    if (*((_DWORD *)&v271 + v61) < v63)
    {
      unsigned int v62 = v61;
      signed int v63 = *((_DWORD *)&v271 + v61);
    }

    ++v61;
  }

  while (v61 != 6);
  uint64_t v64 = *((void *)v273 + v62);
  if (v64)
  {
    uint64_t v65 = 0LL;
    __int16 v66 = 0;
    v67 = v242;
    do
    {
      uint64_t v68 = v64;
      int v69 = *(_DWORD *)(v64 + 8);
      if (v69 == 6)
      {
        *(_WORD *)(v68 + 12) = v66;
        __int16 v66 = 0;
      }

      else if (v69 == 2)
      {
        ++v66;
      }

      uint64_t v64 = *(void *)v68;
      *(void *)uint64_t v68 = v65;
      uint64_t v65 = v68;
    }

    while (v64);
  }

  else
  {
    uint64_t v68 = 0LL;
    v67 = v242;
  }

  if (byte_21028)
  {
    LOBYTE(v70) = byte_21028 - 2;
  }

  else
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    uint64_t v70 = objc_claimAutoreleasedReturnValue([v71 objectForKey:@"AztecDebugSequence"]);

    if (v70)
    {
      LODWORD(v70) = [v71 BOOLForKey:@"AztecDebugSequence"];
      v72 = (void *)objc_claimAutoreleasedReturnValue([v71 volatileDomainForName:NSArgumentDomain]);
      v73 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKey:@"AztecDebugSequence"]);

      byte_21028 = v70 | 2;
      if (v73)
      {
        v74 = @"NO";
        if ((_DWORD)v70) {
          v74 = @"YES";
        }
        NSLog(@"%@=%@", @"AztecDebugSequence", v74);
      }
    }

    else
    {
      byte_21028 = 2;
    }
  }

  if ((_BYTE)v70)
  {
    id v83 = sub_6D88(v68);
    uint64_t decode = v63;
    shouldInterpolate = (void *)objc_claimAutoreleasedReturnValue(v83);
    NSLog(@"len:%ld seq:\n%@");
  }

  int v84 = v63 + 7;
  if (v63 < -7) {
    int v84 = v63 + 14;
  }
  id v85 = objc_claimAutoreleasedReturnValue( +[NSMutableData dataWithLength:]( &OBJC_CLASS___NSMutableData, "dataWithLength:", (uint64_t)v84 >> 3));
  uint64_t v262 = (uint64_t)[v85 mutableBytes];
  id v263 = [v85 length];
  uint64_t v264 = 0LL;
  for (int i = 0; v68; v68 = *(void *)v68)
    sub_7178(v68);
  sub_7220((uint64_t)&v262);
  v86 = v259;
  do
  {
    free(*v86);
    v87 = (void **)v86[3];
    free(v86);
    v86 = v87;
  }

  while (v87);

  id v88 = v232;
  int v89 = sub_8F04(v88, @"AztecOptionUseCompactStyle", dword_1579C);
  BOOL v90 = (v89 - 1) < 0xFFFFFFFE;
  uint64_t v91 = sub_8F04(v88, @"AztecOptionLayers", dword_15790);
  double v92 = (double)(int)sub_8F04(v88, @"AztecOptionErrorCorrectionPercentage", dword_157F0) / 100.0;
  if (!(_DWORD)v91)
  {
    double v97 = 1.0 - v92;
    v98 = (char *)&unk_15814;
    v99 = (char *)&unk_15800;
    unint64_t v100 = 1LL;
    while (1)
    {
      if (v89 == -1) {
        BOOL v90 = v100 < 4;
      }
      if (v100 < 5 || !v90)
      {
        v101 = (int *)(v90 ? v99 : v98);
      }

      ++v100;
      v98 += 4;
      v99 += 4;
      if (v100 == 33)
      {
        uint64_t v91 = 33LL;
        goto LABEL_133;
      }
    }

    BOOL v257 = v90;
    LODWORD(v91) = v100;
    goto LABEL_147;
  }

  if (v89 == -1) {
    BOOL v93 = (int)v91 < 4;
  }
  else {
    BOOL v93 = (v89 - 1) < 0xFFFFFFFE;
  }
  if ((int)v91 >= 5 && v93)
  {
    if (v89 != -1) {
      goto LABEL_133;
    }
    uint64_t v94 = v91;
    double v95 = (double)v63;
    double v96 = 1.0 - v92;
  }

  else
  {
    v110 = (int *)&unk_157FC;
    BOOL v257 = v93;
    if (!v93) {
      v110 = dword_15810;
    }
    double v95 = (double)v63;
    double v96 = 1.0 - v92;
    double v111 = v96 * (double)v110[(int)v91] + -3.0;
    if (v111 >= (double)v63 || !v93 || v89 != -1)
    {
      if (v111 >= v95) {
        goto LABEL_147;
      }
LABEL_133:
      if (!sub_8F04(v88, @"AztecOptionLayers", dword_15790))
      {
        v109 = @"The message is too large for an Aztec barcode.";
        goto LABEL_135;
      }

      sub_8A68( @"The message doesn't fit into the specified number of layers, %d.",  v102,  v103,  v104,  v105,  v106,  v107,  v108,  v91);
      while (1)
      {
LABEL_335:
        __break(1u);
LABEL_336:
        v109 = @"The message does not fit into the space allocated in the barcode.";
LABEL_135:
        v234 = (__CFString *)v109;
LABEL_136:
        sub_8A68(v234, v102, v103, v104, v105, v106, v107, v108, decode);
      }
    }

    uint64_t v94 = (int)v91;
  }

  BOOL v257 = 0;
LABEL_147:

  if ((int)v91 >= 3)
  {
    if (v91 >= 9)
    {
      else {
        int v112 = 10;
      }
    }

    else
    {
      int v112 = 8;
    }
  }

  else
  {
    int v112 = 6;
  }

  signed int v253 = v112;
  v113 = (int *)&unk_15364;
  if (v257) {
    v113 = (int *)&unk_15350;
  }
  uint64_t v114 = v113[(int)v91];
  v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", 4 * v114));
  id v116 = v85;
  id v79 = v115;
  v250 = [v79 mutableBytes];
  unint64_t v117 = (unint64_t)[v79 length];
  id v118 = v116;
  id v119 = [v118 bytes];
  id v120 = [v118 length];
  int v243 = v91;
  unint64_t v121 = v117 >> 2;
  signed int v122 = v253;
  int v260 = ~(-1 << v253);
  *(void *)&v273[0] = v119;
  *((void *)&v273[0] + 1) = v120;
  *(void *)&v273[1] = 0LL;
  DWORD2(v273[1]) = 0;
  unint64_t v247 = v117 >> 2;
  if (v63 >= v253)
  {
    id v239 = v79;
    uint64_t v125 = 0LL;
    LOBYTE(v123) = 0;
    uint64_t v126 = v121 & ~((int)v121 >> 31);
    v234 = @"The message does not fit into the space allocated in the barcode.";
    do
    {
      int v127 = sub_8E0C((uint64_t)v273, v122);
      int v128 = 1 << (v253 - 1);
      if ((v123 & 1) == 0) {
        int v128 = 0;
      }
      int v129 = v127 | v128;
      BOOL v130 = v129 == 1;
      if (v129 == 1) {
        int v131 = 1;
      }
      else {
        int v131 = v129;
      }
      if (!v129) {
        BOOL v130 = 0;
      }
      BOOL v132 = v129 == 0;
      if (!v129) {
        int v131 = 1;
      }
      if (v129 == -2 - (-1 << v253))
      {
        BOOL v130 = 0;
        BOOL v132 = 1;
        int v131 = -2 - (-1 << v253);
      }

      int v123 = v129 == v260 || v130;
      BOOL v124 = v129 != v260 && v132;
      if (v129 == v260) {
        int v133 = -2 - (-1 << v253);
      }
      else {
        int v133 = v131;
      }
      if (v126 == v125) {
        goto LABEL_136;
      }
      v63 -= v122;
      v250[v125] = v133;
      int v14 = v125 + 1;
      if (v123 | v124) {
        signed int v122 = v253 - 1;
      }
      else {
        signed int v122 = v253;
      }
      ++v125;
    }

    while (v63 >= v122);
    id v79 = v239;
  }

  else
  {
    int v123 = 0;
    BOOL v124 = 0;
    int v14 = 0;
  }

  int v16 = v243;
  if ((v123 & 1) != 0 || v124 || v63)
  {
    int v134 = sub_8E0C((uint64_t)v273, v63);
    int v135 = v253 - (v123 | v124);
    else {
      int v136 = -1;
    }
    int v137 = v135 - v63;
    if (!v137) {
      int v136 = 0;
    }
    int v138 = v134 << v137;
    int v139 = 1 << (v253 - 1);
    if (!v123) {
      int v139 = 0;
    }
    int v140 = v136 | v139 | v138;
    if (v140 == v260) {
      v140 &= ~1u;
    }
    v250[v14++] = v140;
  }

  int v18 = v114;
LABEL_200:
  id v141 = v79;
  id v142 = [v141 mutableBytes];
  else {
    int v143 = 1024;
  }
  else {
    int v144 = 1033;
  }
  else {
    unsigned int v145 = 256;
  }
  else {
    int v146 = 301;
  }
  if (v16 >= 3) {
    size_t v147 = v145;
  }
  else {
    size_t v147 = 64LL;
  }
  if (v16 >= 3) {
    int v148 = v146;
  }
  else {
    int v148 = 67;
  }
  sub_9114((uint64_t)v142, v14, v18 - v14, v147, v148);
  int v149 = v16 - 1;
  int v150 = v14 - 1;
  if (v257)
  {
    LODWORD(v266) = (v150 >> 4) | (4 * v149);
    int v151 = 5;
    int v152 = 2;
    uint64_t v153 = 1LL;
  }

  else
  {
    LODWORD(v266) = v149 >> 1;
    DWORD1(v266) = (8 * (v149 & 1)) | (v150 >> 8);
    DWORD2(v266) = v150 >> 4;
    int v151 = 6;
    int v152 = 4;
    uint64_t v153 = 3LL;
  }

  *((_DWORD *)&v266 + v153) = v150 & 0xF;
  sub_9114((uint64_t)&v266, v152, v151, 0x10uLL, 19);
  id v154 = v141;
  v248 = [v154 bytes];
  unint64_t v155 = (unint64_t)[v154 length];
  if (v257) {
    v156 = (int *)&unk_15894;
  }
  else {
    v156 = (int *)&unk_158A8;
  }
  uint64_t v157 = v156[v16];
  int v158 = v157 + 4;
  int v159 = 4 * (v157 + 4);
  v160 = (char *)malloc(v159 * ((int)v157 + 4));
  v161 = v160;
  else {
    int v162 = v157 + 1;
  }
  *(void *)&v273[0] = _NSConcreteStackBlock;
  *((void *)&v273[0] + 1) = 3221225472LL;
  int v237 = v162 >> 1;
  *(void *)&v273[1] = sub_950C;
  *((void *)&v273[1] + 1) = &unk_1C590;
  *(void *)&v273[2] = v160;
  DWORD2(v273[2]) = (v162 >> 1) + 2;
  HIDWORD(v273[2]) = 4 * (v157 + 4);
  v261 = objc_retainBlock(v273);
  uint64_t v163 = 0LL;
  uint64_t v262 = 0x100000000LL;
  id v263 = (id)vadd_s32(vdup_n_s32(v157), (int32x2_t)0x300000002LL);
  do
  {
    memset(&v161[*(int *)((char *)&v262 + v163) * (uint64_t)v159], 255, v159);
    v163 += 4LL;
  }

  while (v163 != 16);
  uint64_t v230 = v159 * ((int)v157 + 4);
  v231 = v154;
  uint64_t v164 = 0LL;
  if (v158 <= 1) {
    uint64_t v165 = 1LL;
  }
  else {
    uint64_t v165 = v158;
  }
  do
  {
    if ((int)v157 >= -3)
    {
      v166 = &v161[4 * *((int *)&v262 + v164)];
      uint64_t v167 = v165;
      do
      {
        *(_DWORD *)v166 = -1;
        v166 += v159;
        --v167;
      }

      while (v167);
    }

    ++v164;
  }

  while (v164 != 4);
  int v244 = v16;
  size_t v228 = v157 + 4;
  v229 = v161;
  size_t v227 = v159;
  unint64_t v251 = v155 >> 2;
  if (v257) {
    int v168 = 11;
  }
  else {
    int v168 = 15;
  }
  uint64_t v169 = -((v168 - 2) >> 1);
  uint64_t v170 = (v168 - 2) >> 1;
  uint64_t v171 = v170 | 1;
  uint64_t v172 = v169;
  do
  {
    else {
      unsigned int v173 = -(int)v172;
    }
    int v174 = v168 - 2;
    uint64_t v175 = -((v168 - 2) >> 1);
    do
    {
      else {
        unsigned int v176 = -(int)v175;
      }
      if (v173 > v176) {
        LOBYTE(v176) = v173;
      }
      (*((void (**)(_OWORD *, uint64_t, uint64_t, BOOL))v261 + 2))(v261, v172, v175, (v176 & 1) == 0);
      uint64_t v175 = (v175 + 1);
      --v174;
    }

    while (v174);
    uint64_t v172 = (v172 + 1);
  }

  while ((_DWORD)v172 != (_DWORD)v171);
  int v240 = v168;
  uint64_t v177 = ~(_DWORD)v170;
  (*((void (**)(_OWORD *, uint64_t, void, uint64_t))v261 + 2))(v261, v177, v170 | 1, 1LL);
  (*((void (**)(_OWORD *, uint64_t, void, uint64_t))v261 + 2))(v261, v169, v170 | 1, 1LL);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v261 + 2))(v261, v177, v170, 1LL);
  (*((void (**)(_OWORD *, uint64_t, void, void))v261 + 2))(v261, v170, v170 | 1, 0LL);
  (*((void (**)(_OWORD *, void, void, uint64_t))v261 + 2))( v261,  v170 | 1,  v170 | 1,  1LL);
  (*((void (**)(_OWORD *, void, uint64_t, uint64_t))v261 + 2))(v261, v170 | 1, v170, 1LL);
  (*((void (**)(_OWORD *, void, uint64_t, uint64_t))v261 + 2))(v261, v170 | 1, v169, 1LL);
  (*((void (**)(_OWORD *, void, uint64_t, void))v261 + 2))(v261, v170 | 1, v177, 0LL);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v261 + 2))(v261, v170, v177, 0LL);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v261 + 2))(v261, v169, v177, 0LL);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v261 + 2))(v261, v177, v177, 0LL);
  (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v261 + 2))(v261, v177, v169, 0LL);
  if (!v257)
  {
    int v178 = v157 + 31;
    if ((int)v157 >= -31)
    {
      int v179 = v178 >> 5;
      int v180 = -(v178 >> 5);
      LOBYTE(v178) = v237;
      unsigned int v255 = -v237;
      if (v237 >= 0) {
        int v181 = v237;
      }
      else {
        int v181 = -v237;
      }
      if (v179 >= 0) {
        int v182 = v179;
      }
      else {
        int v182 = -v179;
      }
      int v183 = v180;
      do
      {
        if ((int)v157 >= -1)
        {
          uint64_t v184 = v255;
          do
          {
            (*((void (**)(_OWORD *, void, uint64_t, BOOL))v261 + 2))( v261,  (16 * v183),  v184,  (v184 & 1) == 0);
            uint64_t v184 = (v184 + 1);
          }

          while (v181 + 1 != (_DWORD)v184);
        }

        BOOL v206 = v183++ == v182;
      }

      while (!v206);
      int v185 = v181 + 1;
      do
      {
        if ((int)v157 >= -1)
        {
          uint64_t v186 = v255;
          do
          {
            (*((void (**)(_OWORD *, uint64_t, void, BOOL))v261 + 2))( v261,  v186,  (16 * v180),  (v186 & 1) == 0);
            uint64_t v186 = (v186 + 1);
          }

          while (v185 != (_DWORD)v186);
        }

        BOOL v206 = v180++ == v182;
      }

      while (!v206);
    }
  }

  uint64_t v187 = 0LL;
  int v188 = 0;
  LODWORD(v189) = v240 - 1;
  do
  {
    unsigned int v190 = 0;
    v191 = &dword_1592C[2 * v187];
    do
    {
      if (v190 >= 2 && v190 <= v240 - 3 && (v257 || (_DWORD)v177 && (_DWORD)v171))
      {
        (*((void (**)(_OWORD *, uint64_t, uint64_t, void))v261 + 2))( v261,  v177,  v171,  (*((_DWORD *)&v266 + v188 / 4) >> ((v178 & 0xFC) - v188 + 3)) & 1);
        ++v188;
      }

      uint64_t v177 = (*v191 + v177);
      uint64_t v171 = (v191[1] + v171);
      ++v190;
    }

    while ((_DWORD)v189 != v190);
    ++v187;
  }

  while (v187 != 4);
  if (v244 >= 1)
  {
    int v192 = 0;
    uint64_t v235 = (v244 + 1);
    uint64_t v193 = 1LL;
    do
    {
      uint64_t v194 = 0LL;
      v195 = &unk_158A8;
      if (v257) {
        v195 = &unk_15894;
      }
      uint64_t v236 = v193;
      int v196 = v195[v193];
      if (v196 >= 0) {
        int v197 = v196;
      }
      else {
        int v197 = v196 + 1;
      }
      int v198 = 1 - (v197 >> 1);
      if (!v257 && (v198 & 0xF) == 0) {
        int v198 = 2 - (v197 >> 1);
      }
      if (v257 || (((_BYTE)v198 + 1) & 0xF) != 0) {
        uint64_t v199 = (v198 + 1);
      }
      else {
        uint64_t v199 = (v198 + 2);
      }
      uint64_t v200 = (v197 >> 1);
      int v201 = v196 - (v199 + (v197 >> 1));
      int v238 = v201;
      do
      {
        uint64_t v241 = (v194 + 1) & 3;
        uint64_t v245 = v194 + 1;
        if (v201 >= 1)
        {
          v202 = &dword_1592C[2 * ((v194 + 1) & 3)];
          v256 = v202 + 1;
          v203 = &dword_1592C[2 * v194];
          while (!v257)
          {
            if ((v199 & 0xF) != 0 && (v200 & 0xF) != 0)
            {
              unsigned int v204 = *v202 + v199;
              unsigned int v205 = *v256 + v200;
              BOOL v206 = (v204 & 0xF) == 0 || (v205 & 0xF) == 0;
              if (v206) {
                uint64_t v171 = v204 + *v202;
              }
              else {
                uint64_t v171 = v204;
              }
              if (v206) {
                uint64_t v189 = v205 + *v256;
              }
              else {
                uint64_t v189 = v205;
              }
              goto LABEL_311;
            }

LABEL_315:
            uint64_t v199 = (*v203 + v199);
            uint64_t v200 = (v203[1] + v200);
            if (!--v201) {
              goto LABEL_316;
            }
          }

          uint64_t v171 = (*v202 + v199);
          uint64_t v189 = (*v256 + v200);
LABEL_311:
          if (~(v192 / v253) + (int)v251 < 0)
          {
            uint64_t v210 = 0LL;
            uint64_t v209 = 0LL;
          }

          else
          {
            unsigned int v207 = v248[(~(v192 / v253) + v251)];
            int v208 = v192 + 1;
            uint64_t v209 = (v207 >> (v192 % v253)) & 1;
            v192 += 2;
            uint64_t v210 = (v207 >> (v208 % v253)) & 1;
          }

          (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v261 + 2))(v261, v171, v189, v209);
          (*((void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))v261 + 2))(v261, v199, v200, v210);
          goto LABEL_315;
        }

LABEL_316:
        v211 = &dword_1592C[2 * v241];
        int v212 = *v211;
        int v213 = v211[1];
        uint64_t v199 = (v212 + v171);
        uint64_t v200 = (v213 + v189);
        if (!v257)
        {
          BOOL v214 = (((_BYTE)v212 + (_BYTE)v171) & 0xF) == 0 || (((_BYTE)v213 + (_BYTE)v189) & 0xF) == 0;
          unsigned int v215 = v199 + v212;
          unsigned int v216 = v200 + v213;
          if (v214) {
            uint64_t v199 = v215;
          }
          else {
            uint64_t v199 = v199;
          }
          if (v214) {
            uint64_t v200 = v216;
          }
          else {
            uint64_t v200 = v200;
          }
        }

        int v201 = v238;
        uint64_t v194 = v245;
      }

      while (v245 != 4);
      uint64_t v193 = v236 + 1;
    }

    while (v236 + 1 != v235);
  }

  v217 = -[NSData initWithBytesNoCopy:length:freeWhenDone:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytesNoCopy:length:freeWhenDone:",  v229,  v230,  1LL);
  v218 = CGDataProviderCreateWithCFData(v217);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGImageRef v220 = CGImageCreate(v228, v228, 8uLL, 0x20uLL, v227, DeviceRGB, 0x2002u, v218, 0LL, 0, kCGRenderingIntentDefault);
  CFRelease(DeviceRGB);
  CFRelease(v218);

  return v220;
}

void sub_89DC( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    int v13 = v12;
    if (a12) {
      *a12 = v12;
    }

    objc_end_catch();
    JUMPOUT(0x88B0LL);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_8A68( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a1,  &a9);
  v14[0] = NSLocalizedDescriptionKey;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([@"Unable to create barcode. " stringByAppendingString:v9]);
  v14[1] = NSLocalizedFailureReasonErrorKey;
  v15[0] = v10;
  v15[1] = v9;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.aztec",  0LL,  v11));
  objc_exception_throw(v12);
  return nullsub_2();
}

uint64_t sub_8B40(uint64_t result)
{
  switch(*(_DWORD *)result)
  {
    case 0:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_8CDC;
      goto LABEL_9;
    case 1:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_8CFC;
      goto LABEL_9;
    case 2:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_8D1C;
      goto LABEL_9;
    case 3:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_8D38;
      goto LABEL_9;
    case 4:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_8D54;
      goto LABEL_9;
    case 5:
      uint64_t v1 = &CIBarcodeGenerator__metaData;
      uint64_t v2 = (__objc2_ivar_list *)sub_8D90;
LABEL_9:
      v1[53].ivars = v2;
      uint64_t result = ((uint64_t (*)(void))v2)(*(unsigned __int8 *)(result + 4));
      break;
    case 6:
      return result;
    default:
      uint64_t result = ((uint64_t (*)(void))off_20F18)(*(unsigned __int8 *)(result + 4));
      break;
  }

  return result;
}

uint64_t sub_8BDC(unsigned __int8 *a1, uint64_t a2)
{
  return sub_8DA4(a2, *a1, 8);
}

uint64_t sub_8BF0(unsigned int *a1, uint64_t a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = qword_153E8[6 * *a1 + v3];
  int v5 = dword_15508[6 * *a1 + v3];
  if ((_DWORD)v3 == 5) {
    int v6 = -5;
  }
  else {
    int v6 = 0;
  }
  return sub_8DA4(a2, v4, v6 + v5);
}

uint64_t sub_8C38(unsigned int *a1, uint64_t a2)
{
  return sub_8DA4(a2, qword_15598[6 * *a1 + a1[1]], dword_156B8[6 * *a1 + a1[1]]);
}

uint64_t sub_8C70(unsigned int *a1, uint64_t a2)
{
  return sub_8DA4(a2, *a1, 5);
}

uint64_t sub_8C84(unsigned __int16 *a1, uint64_t a2)
{
  unint64_t v3 = *a1;
  if (v3 > 0x1F)
  {
    sub_8DA4(a2, 0LL, 5);
    unint64_t v3 = *a1 - 31LL;
    uint64_t v4 = a2;
    int v5 = 11;
  }

  else
  {
    uint64_t v4 = a2;
    int v5 = 5;
  }

  return sub_8DA4(v4, v3, v5);
}

uint64_t sub_8CDC(unsigned int a1, uint64_t a2)
{
  if (a1 == 32) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = a1 - 63LL;
  }
  return sub_8DA4(a2, v3, 5);
}

uint64_t sub_8CFC(unsigned int a1, uint64_t a2)
{
  if (a1 == 32) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = a1 - 95LL;
  }
  return sub_8DA4(a2, v3, 5);
}

uint64_t sub_8D1C(unsigned int a1, uint64_t a2)
{
  return sub_8DA4(a2, *((char *)&qword_20F20 + a1), 5);
}

uint64_t sub_8D38(int a1, uint64_t a2)
{
  return sub_8DA4(a2, byte_20FA0[a1], 5);
}

uint64_t sub_8D54(unsigned int a1, uint64_t a2)
{
  uint64_t v3 = 13LL;
  uint64_t v4 = a1 - 46LL;
  if (a1 == 44) {
    uint64_t v4 = 12LL;
  }
  if (a1 != 46) {
    uint64_t v3 = v4;
  }
  if (a1 == 32) {
    uint64_t v5 = 1LL;
  }
  else {
    uint64_t v5 = v3;
  }
  return sub_8DA4(a2, v5, 4);
}

uint64_t sub_8D90(unsigned int a1, uint64_t a2)
{
  return sub_8DA4(a2, a1, 8);
}

uint64_t sub_8DA4(uint64_t result, uint64_t a2, int a3)
{
  unsigned int v3 = *(_DWORD *)(result + 24);
  if (v3 >= 8)
  {
    uint64_t v4 = *(void *)(result + 8);
    do
    {
      if (!v4) {
        break;
      }
      unsigned int v5 = v3 - 8;
      *(_DWORD *)(result + 24) = v5;
      uint64_t v6 = *(void *)(result + 16) >> v5;
      uint64_t v7 = (_BYTE *)(*(void *)result)++;
      *uint64_t v7 = v6;
      uint64_t v4 = *(void *)(result + 8) - 1LL;
      *(void *)(result + 8) = v4;
      unsigned int v3 = *(_DWORD *)(result + 24);
    }

    while (v3 > 7);
  }

  *(void *)(result + 16) = (*(void *)(result + 16) << a3) | a2;
  *(_DWORD *)(result + 24) = v3 + a3;
  return result;
}

uint64_t sub_8E0C(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 24);
  if (v2 >= a2)
  {
    unint64_t v3 = *(void *)(a1 + 16);
  }

  else
  {
    unint64_t v3 = *(void *)(a1 + 16);
    uint64_t v4 = *(void *)(a1 + 8) - 1LL;
    do
    {
      v3 <<= 8;
      *(void *)(a1 + 8) = v4;
      *(void *)(a1 + 16) = v3;
      if (v4 != -1)
      {
        unsigned int v5 = (unsigned __int8 *)(*(void *)a1)++;
        v3 |= *v5;
        *(void *)(a1 + 16) = v3;
      }

      v2 += 8;
      *(_DWORD *)(a1 + 24) = v2;
      --v4;
    }

    while (v2 < a2);
  }

  unsigned int v6 = v2 - a2;
  *(_DWORD *)(a1 + 24) = v6;
  unint64_t v7 = v3 >> v6;
  if (a2 <= 0x1F) {
    int v8 = ~(-1 << a2);
  }
  else {
    int v8 = -1;
  }
  return v8 & v7;
}

void sub_8E88(id a1)
{
  uint64_t v1 = 0LL;
  qword_20F20 = 0LL;
  *(void *)algn_20F28 = 0LL;
  dword_20F38 = 0;
  qword_20F30 = 0LL;
  do
  {
    *((_BYTE *)&qword_20F20 + byte_15748[v1]) = v1;
    ++v1;
  }

  while (v1 != 28);
  uint64_t v2 = 0LL;
  qword_20FA1 = 0LL;
  unk_20FA9 = 0LL;
  *(uint64_t *)((char *)&qword_20FB1 + 6) = 0LL;
  qword_20FB1 = 0LL;
  do
  {
    byte_20FA0[byte_15764[v2]] = v2;
    ++v2;
  }

  while (v2 != 31);
  byte_20FA0[0] = 0;
}

uint64_t sub_8F04(void *a1, void *a2, _DWORD *a3)
{
  id v5 = a1;
  id v6 = a2;
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
  int v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  id v9 = [v7 intValue];
  unint64_t v17 = (unint64_t)v9;
  if ((int)v9 >= *a3)
  {
    if ((int)v9 <= a3[1])
    {
LABEL_6:

      return v17;
    }

    sub_8A68( @"Specified %@, %d, is greater than the maximum, %d.",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)v6);
LABEL_5:
    unint64_t v17 = a3[2];
    goto LABEL_6;
  }

  uint64_t v19 = sub_8A68( @"Specified %@, %d, is less than the minimum, %d.",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)v6);
  return sub_8FC4(v19);
}

void *sub_8FC4(size_t a1)
{
  uint64_t v2 = malloc(0x20uLL);
  if (!a1) {
    sub_10D10();
  }
  unint64_t v3 = v2;
  *uint64_t v2 = calloc(a1, 0x18uLL);
  v3[1] = a1;
  v3[2] = 0LL;
  v3[3] = 0LL;
  return v3;
}

size_t sub_900C(void *a1)
{
  uint64_t v1 = a1;
  size_t v2 = a1[1];
  for (i = a1[2]; i >= v2; uint64_t v1 = a1)
  {
    a1 = (void *)v1[3];
    if (!a1)
    {
      a1 = sub_8FC4(v2);
      v1[3] = a1;
    }

    size_t v2 = a1[1];
    size_t i = a1[2];
  }

  uint64_t v4 = *a1;
  a1[2] = i + 1;
  return v4 + 24 * i;
}

BOOL sub_9074(int a1)
{
  return a1 == 32 || (a1 - 65) < 0x1A;
}

BOOL sub_9088(int a1)
{
  return a1 == 32 || (a1 - 97) < 0x1A;
}

BOOL sub_909C(unsigned int a1)
{
  return (a1 & 0x80) == 0 && *((_BYTE *)&qword_20F20 + a1) != 0;
}

BOOL sub_90C0(int a1)
{
  return (a1 & 0x80) == 0 && byte_20FA0[a1] != 0;
}

uint64_t sub_90E4(int a1)
{
  BOOL v2 = (a1 - 48) < 0xA || (a1 & 0xFFFFFFFD) == 44;
  return a1 == 32 || v2;
}

uint64_t sub_910C()
{
  return 1LL;
}

void sub_9114(uint64_t a1, int a2, int a3, size_t __size, int a5)
{
  int v6 = __size;
  size_t v10 = __size;
  uint64_t v11 = calloc(4uLL, __size);
  uint64_t v12 = (unsigned int *)calloc(4uLL, v10);
  *uint64_t v11 = 1 - v6;
  *uint64_t v12 = 1;
  if (v6 > 1)
  {
    uint64_t v13 = 0LL;
    do
    {
      uint64_t v14 = &v12[v13];
      else {
        int v15 = 0;
      }
      int v16 = v15 ^ (2 * *v14);
      v14[1] = v16;
      v11[v16] = ++v13;
    }

    while (v10 - 1 != v13);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_9478;
  v52[3] = &unk_1C510;
  int v43 = v12;
  v52[4] = v12;
  v52[5] = v11;
  int v53 = v6;
  unint64_t v17 = objc_retainBlock(v52);
  int v18 = calloc(4uLL, a3 + 1);
  uint64_t v19 = v18;
  int v41 = a3 - 1;
  int v44 = a3;
  uint64_t v40 = v11;
  if (a3 < 1)
  {
    *int v18 = 1;
  }

  else
  {
    uint64_t v20 = a3;
    bzero(v18 + 1, 4LL * a3);
    uint64_t v21 = 0LL;
    uint64_t v22 = 1LL;
    _DWORD *v19 = 1;
    unint64_t v23 = 1LL;
    do
    {
      v19[v23] = v19[v23 - 1];
      uint64_t v24 = v43[v23];
      uint64_t v25 = v21;
      if (v23 >= 2)
      {
        do
        {
          int v26 = v19[(v25 - 1)];
          v19[v25] = ((uint64_t (*)(void *, void, uint64_t))v17[2])(v17, v19[v25], v24) ^ v26;
        }

        while (v25-- > 1);
        uint64_t v22 = *v19;
      }

      uint64_t v22 = ((uint64_t (*)(void *, uint64_t, uint64_t))v17[2])(v17, v22, v24);
      _DWORD *v19 = v22;
      ++v23;
      ++v21;
    }

    while (v21 != v20);
  }

  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_94B0;
  v49[3] = &unk_1C530;
  v49[4] = a1;
  int v28 = v44;
  int v50 = v44;
  int v51 = a2;
  int v42 = objc_retainBlock(v49);
  int v29 = (void *)(a1 + 4LL * a2);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_94E0;
  v47[3] = &unk_1C550;
  int v48 = v44;
  v47[4] = v29;
  uint64_t v30 = objc_retainBlock(v47);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_9500;
  v46[3] = &unk_1C570;
  v46[4] = v29;
  size_t v31 = objc_retainBlock(v46);
  bzero(v29, 4LL * v44);
  if (a2 >= 1)
  {
    uint64_t v32 = (v41 + a2);
    do
    {
      unsigned int v33 = ((uint64_t (*)(void *, void))v30[2])(v30, 0LL);
      int v45 = v32;
      int v34 = ((uint64_t (*)(void *, uint64_t))v42[2])(v42, v32);
      if (v28 >= 1)
      {
        uint64_t v35 = 0LL;
        uint64_t v36 = v34 ^ v33;
        int v37 = v41;
        do
        {
          unsigned int v38 = ((uint64_t (*)(void *, uint64_t))v30[2])(v30, v35 + 1);
          int v39 = ((uint64_t (*)(void *, uint64_t, void))v17[2])(v17, v36, v19[v37]);
          ((void (*)(void *, void, uint64_t))v31[2])(v31, v39 ^ v38, v35);
          --v37;
          ++v35;
        }

        while (v44 != v35);
      }

      uint64_t v32 = (v45 - 1);
      int v28 = v44;
    }

    while (v45 > v44);
  }

  free(v19);
  free(v43);
  free(v40);
}

uint64_t sub_9478(uint64_t a1, int a2, int a3)
{
  uint64_t v3 = 0LL;
  if (a2 && a3) {
    return *(unsigned int *)(*(void *)(a1 + 32)
  }
                           + 4LL
                           * ((*(_DWORD *)(*(void *)(a1 + 40) + 4LL * a3)
                             + *(_DWORD *)(*(void *)(a1 + 40) + 4LL * a2))
                            % (*(_DWORD *)(a1 + 48) - 1)));
  return v3;
}

uint64_t sub_94B0(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 40);
  if (v2 <= a2) {
    return *(unsigned int *)(*(void *)(a1 + 32) + 4LL * (v2 + ~a2 + *(_DWORD *)(a1 + 44)));
  }
  else {
    return 0LL;
  }
}

uint64_t sub_94E0(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 40) <= a2) {
    return 0LL;
  }
  else {
    return *(unsigned int *)(*(void *)(a1 + 32) + 4LL * a2);
  }
}

uint64_t sub_9500(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(*(void *)(result + 32) + 4LL * a3) = a2;
  return result;
}

uint64_t sub_950C(uint64_t result, int a2, int a3, int a4)
{
  int v4 = *(_DWORD *)(result + 40);
  int v5 = v4 - a3;
  int v6 = v4 + a2;
  uint64_t v7 = *(void *)(result + 32) + *(int *)(result + 44) * (uint64_t)v5;
  if (a4) {
    int v8 = -16777216;
  }
  else {
    int v8 = -1;
  }
  *(_DWORD *)(v7 + 4LL * v6) = v8;
  return result;
}

uint64_t sub_A3B0(uint64_t a1)
{
  int v2 = sub_CFC0(a1, 1);
  int v3 = sub_CFC0(a1, 0) + v2;
  if (a1)
  {
    int v4 = *(unsigned __int8 **)a1;
    int64_t v5 = *(unsigned int *)(a1 + 12);
    if ((int)v5 > 1)
    {
      uint64_t v6 = 0LL;
      int v7 = 0;
      uint64_t v8 = *(int *)(a1 + 8);
      id v9 = v4 + 1;
      do
      {
        if ((int)v8 <= 1)
        {
          uint64_t v10 = v6 + 1;
        }

        else
        {
          uint64_t v10 = v6 + 1;
          uint64_t v11 = &v9[(v6 + 1) * v8];
          uint64_t v12 = &v9[v6 * v8];
          uint64_t v13 = (v8 - 1);
          do
          {
            int v14 = *(v12 - 1);
            if (v14 == *v12 && v14 == *(v11 - 1) && v14 == *v11) {
              v7 += 3;
            }
            ++v12;
            ++v11;
            --v13;
          }

          while (v13);
        }

        uint64_t v6 = v10;
      }

      while (v10 != (_DWORD)v5 - 1);
      v3 += v7;
    }

    uint64_t v15 = *(int *)(a1 + 8);
    uint64_t v16 = *(unsigned int *)(a1 + 8);
    if ((int)v5 < 1)
    {
      int v22 = 0;
    }

    else
    {
      unint64_t v17 = 0LL;
      int v28 = 0;
      do
      {
        if ((int)v15 <= 0)
        {
          unint64_t v19 = v17 + 1;
        }

        else
        {
          int64_t v18 = 0LL;
          unint64_t v19 = v17 + 1;
          uint64_t v20 = &v4[v17 * v15];
          do
          {
            if (v18 < v15 - 6
              && v20[v18] == 1
              && !v20[v18 + 1]
              && v20[v18 + 2] == 1
              && v20[v18 + 3] == 1
              && v20[v18 + 4] == 1
              && !v20[v18 + 5]
              && v20[v18 + 6] == 1
              && (v18 < v15 - 10 && !v20[v18 + 7] && !v20[v18 + 8] && !v20[v18 + 9] && !v20[v18 + 10]
               || (unint64_t)v18 >= 4 && !v20[v18 - 1] && !v20[v18 - 2] && !v20[v18 - 3] && !v20[v18 - 4]))
            {
              v28 += 40;
            }

            if ((uint64_t)(v17 + 6) < v5
              && v20[v18] == 1
              && !v4[(v17 + 1) * v15 + v18]
              && v4[(v17 + 2) * v15 + v18] == 1
              && v4[(v17 + 3) * v15 + v18] == 1
              && v4[(v17 + 4) * v15 + v18] == 1
              && !v4[(v17 + 5) * v15 + v18]
              && v4[(v17 + 6) * v15 + v18] == 1
              && ((uint64_t)(v17 + 10) < v5
               && !v4[(v17 + 7) * v15 + v18]
               && !v4[(v17 + 8) * v15 + v18]
               && !v4[(v17 + 9) * v15 + v18]
               && !v4[(v17 + 10) * v15 + v18]
               || v17 >= 4
               && !v4[(v17 - 1) * v15 + v18]
               && !v4[(v17 - 2) * v15 + v18]
               && !v4[(v17 - 3) * v15 + v18]
               && !v4[(v17 - 4) * v15 + v18]))
            {
              v28 += 40;
            }

            ++v18;
          }

          while (v16 != v18);
        }

        unint64_t v17 = v19;
      }

      while (v19 != v5);
      uint64_t v21 = 0LL;
      int v22 = 0;
      v3 += v28;
      do
      {
        unint64_t v23 = v4;
        uint64_t v24 = *(unsigned int *)(a1 + 8);
        if ((int)v16 >= 1)
        {
          do
          {
            int v25 = *v23++;
            if (v25 == 1) {
              ++v22;
            }
            --v24;
          }

          while (v24);
        }

        ++v21;
        v4 += v15;
      }

      while (v21 != v5);
    }

    int v26 = (int)(fabs((double)v22 / (double)((int)v5 * (int)v16) * 100.0 + -50.0) / 5.0 * 10.0);
  }

  else
  {
    int v26 = 0;
  }

  return (v26 + v3);
}

uint64_t sub_A778(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  unsigned int v8 = [v6 isEqualToString:@"L"];
  unsigned int v9 = [v6 isEqualToString:@"Q"];
  unsigned int v10 = [v6 isEqualToString:@"H"];
  unsigned int v11 = v8 ^ 1;
  if (v9) {
    unsigned int v11 = 2;
  }
  if (v10) {
    uint64_t v12 = 3LL;
  }
  else {
    uint64_t v12 = v11;
  }
  if (v5) {
    __asm { BR              X9 }
  }

  return 0LL;
}

void sub_ADF4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
}

uint64_t sub_AE1C(int a1, void *a2, void *a3)
{
  if ((sub_DC64(a3, 7, 4u) & 1) != 0) {
    uint64_t v6 = sub_DC64(a3, a1, 8u);
  }
  else {
    uint64_t v6 = 0LL;
  }

  return v6;
}

void sub_AE80(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_AE90(int a1, int *a2, uint64_t a3)
{
  BOOL v3 = (a1 - 1) >= 0x28 || a3 == 0;
  uint64_t v4 = !v3;
  if (!v3)
  {
    sub_6128(a1, (uint64_t)&v19);
    __int128 v13 = v23;
    __int128 v14 = v24;
    __int128 v15 = v25;
    int v16 = v26;
    __n128 v9 = v19;
    __int128 v10 = v20;
    __int128 v11 = v21;
    __int128 v12 = v22;
    sub_60D4((uint64_t)&v9, a2, &v17);
    *(void *)(a3 + 8) = a2;
    *(_DWORD *)(a3 + 16) = a1;
    *(_DWORD *)(a3 + 28) = v26;
    __n128 v9 = v17;
    LODWORD(v10) = v18;
    *(_DWORD *)(a3 + 36) = sub_6114(&v9);
    __n128 v9 = v17;
    LODWORD(v10) = v18;
    *(_DWORD *)(a3 + 40) = sub_6104((uint64_t)&v9);
    __int128 v13 = v23;
    __int128 v14 = v24;
    __int128 v15 = v25;
    int v16 = v26;
    __n128 v9 = v19;
    __int128 v10 = v20;
    __int128 v11 = v21;
    __int128 v12 = v22;
    *(_DWORD *)(a3 + 20) = sub_60F4(&v9);
    *(_DWORD *)(a3 + 32) = *(_DWORD *)(a3 + 28) - *(_DWORD *)(a3 + 36);
  }

  return v4;
}

uint64_t sub_AFB4(int a1, unsigned int *a2)
{
  if (!a2) {
    return 0LL;
  }
  int v4 = 8 * a1;
  if ((int)sub_DAF0(a2) <= 8 * a1)
  {
    int v15 = 4;
    do
    {
      if ((sub_DB10(a2, 0) & 1) == 0) {
        return 0LL;
      }
      --v15;
    }

    while (v15);
    int v16 = sub_DAF0(a2);
    if (v16 <= 0) {
      int v17 = -(-v16 & 7);
    }
    else {
      int v17 = v16 & 7;
    }
    if (v17 >= 1)
    {
      int v18 = v17 - 8;
      while ((sub_DB10(a2, 0) & 1) != 0)
      {
        if (__CFADD__(v18++, 1)) {
          goto LABEL_18;
        }
      }

      return 0LL;
    }

LABEL_18:
    if ((sub_DAF0(a2) & 7) != 0)
    {
      uint64_t v20 = sub_37A8();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10FE8(v6, v21, v22, v23, v24, v25, v26, v27);
      }
    }

    else
    {
      int v28 = a1 - sub_DAFC(a2);
      if (v28 >= 1)
      {
        for (int i = 0; i != v28; ++i)
        {
          if ((i & 1) != 0)
          {
            uint64_t result = sub_DC64(a2, 17, 8u);
            if (!(_DWORD)result) {
              return result;
            }
          }

          else if ((sub_DC64(a2, 236, 8u) & 1) == 0)
          {
            return 0LL;
          }
        }
      }

      uint64_t v30 = sub_37A8();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10F78(v6, v31, v32, v33, v34, v35, v36, v37);
      }
    }
  }

  else
  {
    uint64_t v5 = sub_37A8();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10F08(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  return 0LL;
}

  return v10;
}

CGImageRef sub_B150(uint64_t a1, uint64_t a2)
{
  uint64_t v50 = 0LL;
  int v51 = 0LL;
  CGImageRef v3 = 0LL;
  if (sub_C3F4(a2, *(unsigned int *)(a1 + 28), *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 40), &v50))
  {
    if (sub_DF74((uint64_t)&v47, *(_DWORD *)(a1 + 20), *(_DWORD *)(a1 + 20)))
    {
      unsigned int v4 = *(_DWORD *)(a1 + 24);
      uint64_t v5 = *(void *)(a1 + 8);
      int v6 = *(_DWORD *)(a1 + 16);
      if (v4 >= 8)
      {
        unsigned int v7 = sub_B828((unsigned int *)&v50, v5, v6, (uint64_t)&v47);
        *(_DWORD *)(a1 + 24) = v7;
      }

      else
      {
        sub_B918((unsigned int *)&v50, v5, v6, v4, (uint64_t)&v47);
        unsigned int v7 = *(_DWORD *)(a1 + 24);
      }

      if (!*(void *)(a1 + 8)
        || *(_DWORD *)(a1 + 16) == -1
        || (int v8 = *(_DWORD *)(a1 + 20), v8 == -1)
        || v7 == -1
        || (int v9 = *(_DWORD *)(a1 + 28), v9 == -1)
        || (int v10 = *(_DWORD *)(a1 + 32), v10 == -1)
        || (int v11 = *(_DWORD *)(a1 + 36), v11 == -1)
        || v7 > 7
        || *(_DWORD *)(a1 + 40) == -1
        || v9 != v11 + v10
        || v8 != v48
        || v8 != v49)
      {
        uint64_t v13 = sub_37A8();
        __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_11058(v14, v15, v16, v17, v18, v19, v20, v21);
        }
        CGImageRef v3 = 0LL;
      }

      else
      {
        if (v51)
        {
          free(v51);
          int v12 = v48;
          int v8 = v49;
        }

        else
        {
          int v12 = *(_DWORD *)(a1 + 20);
        }

        int v41 = v12 + 2;
        int v42 = v8 + 2;
        int v40 = 4 * (v12 + 2);
        uint64_t v22 = (v40 * (v8 + 2));
        __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", (int)v22));
        if ((int)v22 >= 1)
        {
          for (uint64_t i = 0LL; i != v22; ++i)
            *((_BYTE *)-[os_log_s mutableBytes](v14, "mutableBytes") + i) = -1;
        }

        if (v8 >= 1)
        {
          int v24 = 0;
          int v25 = 4 * v12;
          int v43 = 4 * v12 + 8;
          uint64_t v44 = (v8 + 1);
          uint64_t v26 = 4LL * (v12 + 1) - 4;
          uint64_t v27 = 1LL;
          int v45 = v12;
          do
          {
            uint64_t v46 = v27;
            if (v12 >= 1)
            {
              uint64_t v28 = 0LL;
              int v29 = 0;
              do
              {
                char v30 = *((_BYTE *)v47 + v29 + v24 * v48) - 1;
                uint64_t v31 = v14;
                int v32 = v25 + v28;
                *((_BYTE *)-[os_log_s mutableBytes](v31, "mutableBytes") + v25 + (int)v28 + 12) = v30;
                char v33 = *((_BYTE *)v47 + v29 + v24 * v48) - 1;
                uint64_t v34 = v31;
                *((_BYTE *)-[os_log_s mutableBytes](v34, "mutableBytes") + v32 + 13) = v33;
                char v35 = *((_BYTE *)v47 + v29 + v24 * v48) - 1;
                uint64_t v36 = v34;
                *((_BYTE *)-[os_log_s mutableBytes](v36, "mutableBytes") + v32 + 14) = v35;
                *((_BYTE *)-[os_log_s mutableBytes](v36, "mutableBytes") + v32 + 15) = -1;
                ++v29;
                v28 += 4LL;
              }

              while (v26 != v28);
            }

            uint64_t v27 = v46 + 1;
            ++v24;
            v25 += v43;
            int v12 = v45;
          }

          while (v46 + 1 != v44);
        }

        if (v47) {
          free(v47);
        }
        uint64_t v37 = CGDataProviderCreateWithCFData(v14);
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        CGImageRef v3 = CGImageCreate(v41, v42, 8uLL, 0x20uLL, v40, DeviceRGB, 0x2002u, v37, 0LL, 0, kCGRenderingIntentDefault);
        CFRelease(DeviceRGB);
        CFRelease(v37);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return v3;
}

void sub_B4BC(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  unsigned int v5 = [v4 isEqualToString:@"L"];
  unsigned int v6 = [v4 isEqualToString:@"Q"];
  unsigned int v7 = [v4 isEqualToString:@"H"];
  LODWORD(v8) = v5 ^ 1;
  if (v6) {
    LODWORD(v8) = 2;
  }
  if (v7) {
    uint64_t v8 = 3LL;
  }
  else {
    uint64_t v8 = v8;
  }
  __asm { BR              X10 }

CGImageRef sub_B578()
{
  v11[0] = 0;
  v11[1] = 1;
  int v12 = @"L";
  int v4 = sub_AE90(v3, v11, (uint64_t)v13);
  if (v13[4] == v3) {
    int v5 = v4;
  }
  else {
    int v5 = 0;
  }
  if (v5 == 1 && (unint64_t v6 = v14, (unint64_t)[v0 length] >= v6))
  {
    v13[6] = v2;
    id v10 = [v0 bytes];
    v9[0] = 8 * v14;
    v9[1] = v14;
    CGImageRef v7 = sub_B150((uint64_t)v13, (uint64_t)v9);
  }

  else
  {
    CGImageRef v7 = 0LL;
  }

  return v7;
}

void sub_B674( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
}

uint64_t sub_B690(void *a1, void *a2)
{
  id v3 = a1;
  if ([a2 isEqualToString:@"Shift_JIS"])
  {
    BOOL v4 = !sub_B78C(v3);
    unsigned int v5 = 4;
    unsigned int v6 = 8;
  }

  else
  {
    if (![v3 length])
    {
LABEL_18:
      uint64_t v12 = 4LL;
      goto LABEL_19;
    }

    char v7 = 0;
    char v8 = 0;
    unint64_t v9 = 0LL;
    do
    {
      id v10 = v3;
      uint64_t v11 = *((unsigned __int8 *)[v10 bytes] + v9);
      if ((v11 - 48) >= 0xA)
      {
        char v7 = 1;
      }

      else
      {
        char v8 = 1;
      }

      ++v9;
    }

    while (v9 < (unint64_t)[v10 length]);
    if ((v8 & 1) != 0) {
      unsigned int v5 = 1;
    }
    else {
      unsigned int v5 = 4;
    }
    BOOL v4 = (v7 & 1) == 0;
    unsigned int v6 = 2;
  }

  if (v4) {
    uint64_t v12 = v5;
  }
  else {
    uint64_t v12 = v6;
  }
LABEL_19:

  return v12;
}

BOOL sub_B78C(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (!v1) {
    goto LABEL_16;
  }
  int v3 = [v1 length];
  int v4 = v3;
  if ((v3 & 1) != 0)
  {
    BOOL v10 = 0LL;
    goto LABEL_18;
  }

  if (v3 >= 1)
  {
    uint64_t v5 = 0LL;
    do
    {
      char v6 = *((_BYTE *)[v2 bytes] + v5);
      unsigned int v7 = (v6 + 127);
      unsigned int v8 = (v6 + 32);
      BOOL v10 = v7 < 0x1F || v8 < 0xC;
      v5 += 2LL;
    }

    while (v10 && (int)v5 < v4);
  }

  else
  {
LABEL_16:
    BOOL v10 = 1LL;
  }

uint64_t sub_B828(unsigned int *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a4)
      {
        unint64_t v9 = malloc(*(int *)(a4 + 12) * (uint64_t)*(int *)(a4 + 8));
        if (v9)
        {
          BOOL v10 = v9;
          uint64_t v11 = 0LL;
          int v12 = 0x7FFFFFFF;
          while (sub_B918(a1, a2, a3, v11, a4))
          {
            int v13 = sub_A3B0(a4);
            if (v13 < v12)
            {
              uint64_t v14 = (*(_DWORD *)(a4 + 12) * *(_DWORD *)(a4 + 8));
              if ((int)v14 >= 1)
              {
                uint64_t v15 = *(char **)a4;
                uint64_t v16 = v10;
                do
                {
                  char v17 = *v15++;
                  *v16++ = v17;
                  --v14;
                }

                while (v14);
              }

              uint64_t v4 = v11;
              int v12 = v13;
            }

            uint64_t v11 = (v11 + 1);
            if ((_DWORD)v11 == 8)
            {
              free(*(void **)a4);
              *(void *)a4 = v10;
              return v4;
            }
          }

          free(v10);
        }
      }
    }
  }

  return v4;
}

BOOL sub_B918(unsigned int *a1, uint64_t a2, int a3, unsigned int a4, uint64_t a5)
{
  BOOL v10 = sub_E038(a5, -1);
  BOOL result = 0LL;
  if (!a5) {
    return result;
  }
  if (!v10) {
    return result;
  }
  BOOL v12 = sub_D6C4(0, 0, a5);
  BOOL result = 0LL;
  if (!v12) {
    return result;
  }
  BOOL v13 = sub_D6C4(*(_DWORD *)(a5 + 8) - 7, 0, a5);
  BOOL result = 0LL;
  if (!v13) {
    return result;
  }
  BOOL v14 = sub_D6C4(0, *(_DWORD *)(a5 + 8) - 7, a5);
  BOOL result = 0LL;
  if (!v14) {
    return result;
  }
  BOOL v15 = sub_D7B4(0, 7, a5);
  BOOL result = 0LL;
  if (!v15) {
    return result;
  }
  BOOL result = sub_D7B4(*(_DWORD *)(a5 + 8) - 8, 7, a5);
  if (!result) {
    return result;
  }
  BOOL v16 = sub_D7B4(0, *(_DWORD *)(a5 + 8) - 8, a5);
  BOOL result = 0LL;
  if (!v16) {
    return result;
  }
  BOOL v17 = sub_D86C(7, 0, a5);
  BOOL result = 0LL;
  if (!v17) {
    return result;
  }
  BOOL v18 = sub_D86C(*(_DWORD *)(a5 + 12) - 8, 0, a5);
  BOOL result = 0LL;
  if (!v18) {
    return result;
  }
  BOOL result = sub_D86C(7, *(_DWORD *)(a5 + 12) - 7, a5);
  if (!result) {
    return result;
  }
  if (!sub_DFF4(a5, 8, *(_DWORD *)(a5 + 12) - 8))
  {
    uint64_t v43 = sub_37A8();
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_110C8(v44, v45, v46, v47, v48, v49, v50, v51);
    }
    goto LABEL_77;
  }

  BOOL result = sub_E018(a5, 8, *(_DWORD *)(a5 + 12) - 8, 1);
  if (!result) {
    return result;
  }
  if (a3 >= 2)
  {
    uint64_t v52 = 0LL;
    int v53 = (char *)&unk_15EA4 + 28 * (a3 - 1);
    do
    {
      uint64_t v54 = 0LL;
      uint64_t v90 = v52;
      int v55 = *(_DWORD *)&v53[4 * v52];
      int v91 = v55 - 2;
      int v92 = v55;
      do
      {
        int v56 = *(_DWORD *)&v53[4 * v54];
        BOOL v57 = v56 == -1 || v55 == -1;
        if (!v57 && sub_DFF4(a5, *(_DWORD *)&v53[4 * v54], v55) == -1)
        {
          unint64_t v58 = 0LL;
          BOOL v95 = 0;
          int v96 = v56 - 2;
          uint64_t v59 = (char *)&unk_16304;
          do
          {
            uint64_t v60 = 0LL;
            unint64_t v94 = v58;
            int v61 = v91 + v58;
            do
            {
              if (sub_DFF4(a5, v96 + (int)v60, v61) != -1)
              {
                uint64_t v62 = sub_37A8();
                signed int v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
                int v53 = (char *)&unk_15EA4 + 28 * (a3 - 1);
                int v55 = v92;
                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                  sub_1139C(v99, &v100, v63);
                }

                goto LABEL_98;
              }

              if (!sub_E018(a5, v96 + v60, v61, v59[4 * v60]))
              {
                int v53 = (char *)&unk_15EA4 + 28 * (a3 - 1);
                int v55 = v92;
LABEL_98:
                if (v95) {
                  goto LABEL_99;
                }
                return 0LL;
              }

              ++v60;
            }

            while (v60 != 5);
            BOOL v95 = v94 > 3;
            v59 += 20;
            unint64_t v58 = v94 + 1;
            int v53 = (char *)&unk_15EA4 + 28 * (a3 - 1);
            int v55 = v92;
          }

          while (v94 != 4);
        }

LABEL_99:
        ++v54;
      }

      while (v54 != 7);
      uint64_t v52 = v90 + 1;
    }

    while (v90 != 6);
  }

  if (*(int *)(a5 + 8) >= 17)
  {
    int v19 = 8;
    while (1)
    {
      if (sub_DFF4(a5, v19, 6) + 1 >= 3)
      {
        uint64_t v72 = sub_37A8();
        uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v72);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
          goto LABEL_105;
        }
        goto LABEL_77;
      }

      int v20 = v19 + 1;
      if (sub_DFF4(a5, v19, 6) == -1)
      {
        BOOL result = sub_E018(a5, v19, 6, v20 & 1);
        if (!result) {
          return result;
        }
      }

      if (sub_DFF4(a5, 6, v19) == -1)
      {
        BOOL result = sub_E018(a5, 6, v19, v20 & 1);
        if (!result) {
          return result;
        }
      }

      ++v19;
      if (v20 >= *(_DWORD *)(a5 + 8) - 8) {
        goto LABEL_24;
      }
    }

    uint64_t v80 = sub_37A8();
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
LABEL_105:
    }
      sub_1132C(v44, v73, v74, v75, v76, v77, v78, v79);
LABEL_77:

    return 0LL;
  }

LABEL_24:
  uint64_t v97 = 0LL;
  v98 = 0LL;
  if (!a2) {
    return 0LL;
  }
  *(void *)buf = 0LL;
  *(void *)&buf[8] = 0LL;
  if (a4 >= 8)
  {
    uint64_t v64 = sub_37A8();
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_112BC(v44, v65, v66, v67, v68, v69, v70, v71);
    }
    goto LABEL_77;
  }

  int v21 = a4 | (8 * *(_DWORD *)(a2 + 4));
  int v22 = sub_D924(v21, 1335);
  if (!sub_DC64(&v97, v22, 0xAu)
    || !sub_DC64(buf, 21522, 0xFu)
    || !sub_DD28((unsigned int *)&v97, (uint64_t)buf))
  {
    return 0LL;
  }

  if (sub_DAF0((unsigned int *)&v97) != 15)
  {
    uint64_t v81 = sub_37A8();
    uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      sub_11248((unsigned int *)&v97);
    }
    goto LABEL_77;
  }

  if (*(void *)&buf[8]) {
    free(*(void **)&buf[8]);
  }
  if ((int)sub_DAF0((unsigned int *)&v97) >= 1)
  {
    unint64_t v23 = 0LL;
    int v24 = (int *)&unk_1636C;
    int v25 = -1;
    do
    {
      unsigned int v26 = sub_DAF0((unsigned int *)&v97);
      char v27 = sub_DA70((uint64_t)&v97, v26 + v25);
      if (!sub_E018(a5, *(v24 - 1), *v24, v27)) {
        return 0LL;
      }
      if (v23 > 7)
      {
        if (!sub_E018(a5, 8, v23 + *(_DWORD *)(a5 + 12) - 15, v27)) {
          return 0LL;
        }
      }

      else if (!sub_E018(a5, v25 + *(_DWORD *)(a5 + 8), 8, v27))
      {
        return 0LL;
      }

      v24 += 2;
      ++v23;
      --v25;
    }

    while ((uint64_t)v23 < (int)sub_DAF0((unsigned int *)&v97));
  }

  if (v98) {
    free(v98);
  }
  *(void *)buf = 0LL;
  *(void *)&buf[8] = 0LL;
  if (a3 >= 7)
  {
    int v82 = sub_D924(a3, 7973);
    if (sub_DAF0((unsigned int *)buf) != 18)
    {
      uint64_t v89 = sub_37A8();
      uint64_t v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_111D4((unsigned int *)buf);
      }
      goto LABEL_77;
    }

    int v83 = 0;
    unsigned int v84 = 17;
    do
    {
      for (int i = -11; i != -8; ++i)
      {
        char v86 = sub_DA70((uint64_t)buf, v84);
        if (!sub_E018(a5, v83, i + *(_DWORD *)(a5 + 12), v86) || !sub_E018(a5, i + *(_DWORD *)(a5 + 12), v83, v86)) {
          return 0LL;
        }
        --v84;
      }

      ++v83;
    }

    while (v83 != 6);
    if (*(void *)&buf[8]) {
      free(*(void **)&buf[8]);
    }
  }

  int v28 = *(_DWORD *)(a5 + 8);
  if (v28 < 2)
  {
    signed int v29 = 0;
LABEL_122:
    uint64_t v87 = sub_37A8();
    id v88 = (os_log_s *)objc_claimAutoreleasedReturnValue(v87);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      sub_11138(a1, v29, v88);
    }

    return 0LL;
  }

  signed int v29 = 0;
  int v30 = v28 - 1;
  int v31 = *(_DWORD *)(a5 + 12) - 1;
  int v93 = -1;
  while (1)
  {
    if (v30 == 6) {
      int v32 = 5;
    }
    else {
      int v32 = v30;
    }
    if (v31 < 0) {
      goto LABEL_73;
    }
LABEL_50:
    if (v31 < *(_DWORD *)(a5 + 12)) {
      break;
    }
LABEL_73:
    v31 -= v93;
    int v93 = -v93;
    int v30 = v32 - 2;
    if (v32 <= 2) {
      goto LABEL_122;
    }
  }

  int v33 = 0;
  char v34 = 1;
  while (1)
  {
    char v35 = v34;
    unsigned int v36 = v33 + v32;
    if (sub_DFF4(a5, v33 + v32, v31) == -1)
    {
      else {
        char v37 = sub_DA70((uint64_t)a1, v29++);
      }
      int v38 = v31 & 1;
      switch(a4)
      {
        case 0xFFFFFFFF:
          break;
        case 0u:
          LOBYTE(v39) = v36 + v31;
          goto LABEL_68;
        case 1u:
          goto LABEL_69;
        case 2u:
          int v38 = v36 % 3;
          goto LABEL_69;
        case 3u:
          int v38 = (int)(v36 + v31) % 3;
          goto LABEL_69;
        case 4u:
          signed int v39 = v36 / 3 + (v31 >> 1);
          goto LABEL_68;
        case 5u:
          int v38 = ((v36 * v31) & 1) + (int)(v36 * v31) % 3;
          goto LABEL_69;
        case 6u:
          signed int v39 = v36 * v31;
          int v42 = v39 - v39 / 3;
          goto LABEL_67;
        case 7u:
          signed int v39 = v36 * v31 - (int)(v36 * v31) / 3;
          LOBYTE(v42) = v36 + v31;
LABEL_67:
          LOBYTE(v39) = v42 + v39;
LABEL_68:
          int v38 = v39 & 1;
LABEL_69:
          v37 ^= v38 == 0;
          break;
        default:
          uint64_t v40 = sub_37A8();
          int v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446466;
            *(void *)&buf[4] = "getDataMaskBit";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = a4;
            _os_log_error_impl(&dword_0, v41, OS_LOG_TYPE_ERROR, "%{public}s invalid mask pattern: %d", buf, 0x12u);
          }

          break;
      }

      BOOL result = sub_E018(a5, v36, v31, v37);
      if (!result) {
        return result;
      }
    }

    char v34 = 0;
    int v33 = -1;
    if ((v35 & 1) == 0)
    {
      v31 += v93;
      if (v31 >= 0) {
        goto LABEL_50;
      }
      goto LABEL_73;
    }
  }

uint64_t sub_C300(int a1, int a2, int a3, int a4, int *a5, _DWORD *a6)
{
  uint64_t v6 = 0LL;
  if (!a5 || !a6) {
    return v6;
  }
  if (a4 >= a3)
  {
    uint64_t v9 = sub_37A8();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_114C0(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_12;
  }

  int v7 = a2 / a3;
  int v8 = a1 % a3;
  if (a1 / a3 * (a3 - v8) + (a1 / a3 + 1) * v8 != a1)
  {
    uint64_t v18 = sub_37A8();
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_113E0(v10, v19, v20, v21, v22, v23, v24, v25);
    }
LABEL_12:

    return 0LL;
  }

  if (a3 - v8 <= a4) {
    int v7 = a2 / a3 + 1;
  }
  *a5 = v7;
  *a6 = a1 / a3 - a2 / a3;
  return 1LL;
}

uint64_t sub_C3F4(uint64_t a1, uint64_t a2, int a3, int a4, _DWORD *a5)
{
  uint64_t result = 0LL;
  if (a1 && a5)
  {
    if (sub_DAFC((_DWORD *)a1) == a3)
    {
      uint64_t v11 = calloc(a4, 0x10uLL);
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = a4;
        uint64_t v76 = (void **)v11;
        if (a4 >= 1)
        {
          unint64_t v73 = a4;
          uint64_t v74 = a5;
          int v75 = a4;
          uint64_t v14 = 0LL;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          uint64_t v18 = v11 + 1;
          do
          {
            uint64_t v19 = a2;
            if (!sub_C300(a2, a3, v13, v14, &v78, &v77)
              || (uint64_t v20 = calloc(1uLL, 0x10uLL)) == 0LL
              || (uint64_t v21 = (uint64_t)v20, !sub_DEBC((uint64_t)v20, *(void *)(a1 + 8), v15, v78))
              || (uint64_t v22 = sub_C798(v21, v77)) == 0LL)
            {
              a4 = v75;
              goto LABEL_50;
            }

            double v23 = (double)*(int *)(v21 + 8);
            *(v18 - 1) = v21;
            int v16 = (int)fmax((double)v16, v23);
            int v17 = (int)fmax((double)v17, (double)(int)v22[2]);
            *uint64_t v18 = v22;
            v18 += 2;
            v15 += v78;
            ++v14;
            a2 = v19;
          }

          while (v13 != v14);
          BOOL v24 = v15 == a3;
          a4 = v75;
          uint64_t v25 = v76;
          if (!v24) {
            goto LABEL_43;
          }
          if (v16 >= 1)
          {
            int v26 = 0;
            if (v73 <= 1) {
              uint64_t v27 = 1LL;
            }
            else {
              uint64_t v27 = v73;
            }
LABEL_18:
            uint64_t v28 = v27;
            while (1)
            {
              if (v26 < *((_DWORD *)*v25 + 2))
              {
                int v29 = sub_DE0C(*v25, v26);
              }

              v25 += 2;
              if (!--v28)
              {
                ++v26;
                uint64_t v25 = v76;
                if (v26 != v16) {
                  goto LABEL_18;
                }
                break;
              }
            }
          }

          if (v17 >= 1)
          {
            int v30 = 0;
            if (v73 <= 1) {
              uint64_t v31 = 1LL;
            }
            else {
              uint64_t v31 = v73;
            }
LABEL_27:
            int v32 = v76 + 1;
            uint64_t v33 = v31;
            while (1)
            {
              if (v30 < *((_DWORD *)*v32 + 2))
              {
                int v34 = sub_DE0C(*v32, v30);
              }

              v32 += 2;
              if (!--v33)
              {
                if (++v30 != v17) {
                  goto LABEL_27;
                }
                break;
              }
            }
          }

          uint64_t v12 = v76;
          char v35 = (void ***)(v76 + 1);
          do
          {
            free(**(v35 - 1));
            free(**v35);
            free(*(v35 - 1));
            unsigned int v36 = *v35;
            v35 += 2;
            free(v36);
            --v13;
          }

          while (v13);
LABEL_46:
          free(v12);
          return 1LL;
        }

        if (a3)
        {
LABEL_43:
          uint64_t v54 = sub_37A8();
          int v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
            sub_11610(v55, v56, v57, v58, v59, v60, v61, v62);
          }
        }

        else
        {
LABEL_47:
          uint64_t v63 = sub_37A8();
          int v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
            sub_115A0(v55, v64, v65, v66, v67, v68, v69, v70);
          }
        }

LABEL_50:
        if (a4 >= 1)
        {
          uint64_t v71 = (void ***)(v76 + 1);
          do
          {
            uint64_t v72 = *(v71 - 1);
            if (v72)
            {
              free(*v72);
              free(*(v71 - 1));
            }

            if (*v71)
            {
              free(**v71);
              free(*v71);
            }

            v71 += 2;
            --v13;
          }

          while (v13);
        }

        free(v76);
        return 0LL;
      }

      uint64_t v46 = sub_37A8();
      int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_11530(v38, v47, v48, v49, v50, v51, v52, v53);
      }
    }

    else
    {
      uint64_t v37 = sub_37A8();
      int v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_11680(v38, v39, v40, v41, v42, v43, v44, v45);
      }
    }

    return 0LL;
  }

  return result;
}

_DWORD *sub_C798(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v4 = *(int *)(a1 + 8);
  size_t v5 = v4 + (int)a2;
  uint64_t v6 = calloc(v5, 4uLL);
  if ((int)v5 >= 1)
  {
    uint64_t v7 = 0LL;
    do
    {
      if (v7 >= v4) {
        int v8 = 0;
      }
      else {
        int v8 = sub_DE0C((void *)a1, v7);
      }
      v6[v7++] = v8;
    }

    while (v5 != v7);
  }

  id v9 = -[CIReedSolomon initReedSolomon](objc_alloc(&OBJC_CLASS___CIReedSolomon), "initReedSolomon");
  if ([v9 encode:v6 length:v5 bytes:a2])
  {
    BOOL v10 = calloc(1uLL, 0x10uLL);
    sub_DDCC(v10, a2);
    if ((int)a2 >= 1)
    {
      uint64_t v11 = 0LL;
      uint64_t v12 = (char *)&v6[v4];
      do
      {
        sub_DE60(v10, v11, *(_DWORD *)&v12[4 * v11]);
        ++v11;
      }

      while (a2 != v11);
    }
  }

  else
  {
    BOOL v10 = 0LL;
  }

  free(v6);

  return v10;
}

uint64_t sub_C8B8(int a1, int a2, int a3, void *a4)
{
  int v5 = a3 - 1;
  if ((a3 - 1) <= 7 && ((0x8Bu >> v5) & 1) != 0)
  {
    signed int v6 = *((_DWORD *)*(&off_1C668 + v5) + a2);
    if (v6 >= 0) {
      int v7 = ~(-1 << v6);
    }
    else {
      int v7 = 0;
    }
  }

  else
  {
    signed int v6 = 0;
    int v7 = 0;
  }

  if (v7 >= a1) {
    return sub_DC64(a4, a1, v6);
  }
  uint64_t v8 = sub_37A8();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 136446722;
    uint64_t v12 = "appendLengthInfo";
    __int16 v13 = 1024;
    int v14 = a1;
    __int16 v15 = 1024;
    int v16 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%{public}s %d is bigger than %d", (uint8_t *)&v11, 0x18u);
  }

  return 0LL;
}

uint64_t sub_CA00(void *a1, int a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a4;
  uint64_t v9 = 0LL;
  if (v7 && a3)
  {
    switch(a2)
    {
      case 1:
        if ((sub_CB00(v7, a3) & 1) != 0) {
          goto LABEL_12;
        }
        goto LABEL_14;
      case 2:
        if ((sub_CC44(v7, a3) & 1) == 0) {
          goto LABEL_14;
        }
        goto LABEL_12;
      case 4:
        if (sub_CD9C(v7, a3)) {
          goto LABEL_12;
        }
        goto LABEL_14;
      case 8:
        if ((sub_CE54(v7, a3) & 1) == 0) {
          goto LABEL_14;
        }
LABEL_12:
        uint64_t v9 = 1LL;
        break;
      default:
        uint64_t v10 = sub_37A8();
        int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_116F0(v11, v12, v13, v14, v15, v16, v17, v18);
        }

LABEL_14:
        uint64_t v9 = 0LL;
        break;
    }
  }

  return v9;
}

uint64_t sub_CB00(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [v3 length];
  if (v4 >= 1)
  {
    LODWORD(v5) = 0;
    do
    {
      id v6 = v3;
      int v7 = *((unsigned __int8 *)[v6 bytes] + (int)v5);
      uint64_t v8 = (int)v5;
      int v9 = v7 - 48;
      uint64_t v5 = (int)v5 + 2LL;
      if ((int)v5 >= v4)
      {
        uint64_t v11 = v8 + 1;
        if ((int)v11 >= v4)
        {
          LODWORD(v5) = v11;
          if (!sub_DC64(a2, v7 - 48, 4u))
          {
LABEL_12:
            uint64_t v12 = 0LL;
            goto LABEL_13;
          }
        }

        else if ((sub_DC64( a2, *((unsigned __int8 *)[v6 bytes] + v11) {
                   + 10 * v9
        }
                   - 48,
                     7u) & 1) == 0)
        {
          goto LABEL_12;
        }
      }

      else
      {
        id v10 = v6;
        if ((sub_DC64( a2,  10 * *((unsigned __int8 *)[v10 bytes] + v8 + 1)
              + 100 * v9
              + *((unsigned __int8 *)[v10 bytes] + v5)
              - 528,
                0xAu) & 1) == 0)
          goto LABEL_12;
        LODWORD(v5) = v8 + 3;
      }
    }

    while ((int)v5 < v4);
  }

  uint64_t v12 = 1LL;
LABEL_13:

  return v12;
}

uint64_t sub_CC44(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [v3 length];
  if (v4 < 1)
  {
LABEL_12:
    uint64_t v12 = 1LL;
    goto LABEL_19;
  }

  LODWORD(v5) = 0;
  while (1)
  {
    id v6 = v3;
    unint64_t v7 = *((unsigned __int8 *)[v6 bytes] + (int)v5);
    if (v7 > 0x5F || (int v8 = dword_15994[v7], v8 == -1))
    {
      uint64_t v13 = sub_37A8();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }

    int v9 = v5;
    uint64_t v5 = (int)v5 + 1LL;
LABEL_11:
  }

  unint64_t v10 = *((unsigned __int8 *)[v6 bytes] + v5);
  if (v10 <= 0x5F)
  {
    int v11 = dword_15994[v10];
    if (v11 != -1)
    {
      if ((sub_DC64(a2, v11 + 45 * v8, 0xBu) & 1) == 0) {
        goto LABEL_18;
      }
      LODWORD(v5) = v9 + 2;
      goto LABEL_11;
    }
  }

  uint64_t v22 = sub_37A8();
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    goto LABEL_17;
  }
LABEL_16:
  sub_11760(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_17:

LABEL_18:
  uint64_t v12 = 0LL;
LABEL_19:

  return v12;
}

BOOL sub_CD9C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [v3 length];
  if (v4)
  {
    id v5 = v4;
    id v6 = v3;
    if (sub_DC64(a2, *(unsigned __int8 *)[v6 bytes], 8u))
    {
      uint64_t v7 = 1LL;
      do
      {
        unint64_t v8 = v7;
        if (v5 == (id)v7) {
          break;
        }
        char v9 = sub_DC64(a2, *((unsigned __int8 *)[v6 bytes] + v7), 8u);
        uint64_t v7 = v8 + 1;
      }

      while ((v9 & 1) != 0);
      BOOL v10 = v8 >= (unint64_t)v5;
    }

    else
    {
      BOOL v10 = 0LL;
    }
  }

  else
  {
    BOOL v10 = 1LL;
  }

  return v10;
}

uint64_t sub_CE54(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [v3 length];
  if (v4 < 1)
  {
    uint64_t v14 = 1LL;
  }

  else
  {
    uint64_t v5 = 0LL;
    do
    {
      id v6 = v3;
      int v7 = *((unsigned __int8 *)[v6 bytes] + v5);
      int v8 = *((unsigned __int8 *)[v6 bytes] + v5 + 1) | (v7 << 8);
      int v9 = v8 - 33088;
      if ((v8 - 33088) >= 0x1EBD)
      {
        if ((v8 - 60352) > 0xFFFFF47F)
        {
          int v9 = v8 - 49472;
        }

        else
        {
          uint64_t v10 = sub_37A8();
          int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            sub_117D0(v16, &v17, v11);
          }

          int v9 = -1;
        }
      }

      uint64_t v12 = sub_DC64(a2, 192 * (v9 >> 8) + v9, 0xDu);
      v5 += 2LL;
      if ((_DWORD)v12) {
        BOOL v13 = (int)v5 < v4;
      }
      else {
        BOOL v13 = 0;
      }
    }

    while (v13);
    uint64_t v14 = v12;
  }

  return v14;
}

uint64_t sub_CFC0(uint64_t a1, int a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = a2 ? 12LL : 8LL;
  int v3 = *(_DWORD *)(a1 + v2);
  uint64_t v4 = a2 ? 8LL : 12LL;
  if (v3 < 1) {
    return 0LL;
  }
  int v5 = 0;
  uint64_t v6 = 0LL;
  int v7 = *(_DWORD *)(a1 + v4);
  int v8 = -1;
  do
  {
    if (v7 >= 1)
    {
      int v9 = 0;
      int v10 = 0;
      do
      {
        if (a2) {
          int v11 = v9 + v5 * *(_DWORD *)(a1 + 8);
        }
        else {
          int v11 = v5 + *(_DWORD *)(a1 + 12) * v9;
        }
        int v12 = *(char *)(*(void *)a1 + v11);
        int v13 = v10 + 1;
        if (v10 <= 4) {
          unsigned int v14 = v6;
        }
        else {
          unsigned int v14 = v6 + 1;
        }
        if (v10 == 4) {
          int v10 = 5;
        }
        else {
          ++v10;
        }
        if (v13 == 5) {
          unsigned int v15 = v6 + 3;
        }
        else {
          unsigned int v15 = v14;
        }
        if (v8 == v12)
        {
          uint64_t v6 = v15;
        }

        else
        {
          int v8 = v12;
          int v10 = 1;
          uint64_t v6 = v6;
        }

        ++v9;
      }

      while (v7 != v9);
    }

    ++v5;
  }

  while (v5 != v3);
  return v6;
}

uint64_t sub_D080(void *a1, void *a2, int a3, void *a4)
{
  int v55 = a2;
  id v6 = a1;
  id v58 = a4;
  int v7 = dword_15DBC[a3] + 4;
  LODWORD(v70) = dword_15DB0[a3] + 4;
  HIDWORD(v70) = v7;
  int v56 = a3;
  int v71 = dword_15DC8[a3] + 4;
  int v69 = 3;
  uint64_t v68 = 0x300000004LL;
  uint64_t v67 = 0x500000006LL;
  int v63 = 8;
  v66[0] = &v68;
  v66[1] = &v67;
  v66[2] = &v63;
  id v8 = v6;
  int v9 = (unsigned __int8 *)[v8 bytes];
  id v60 = v8;
  uint64_t v57 = &v55;
  id v61 = (id)([v8 length] + 1);
  uint64_t v10 = __chkstk_darwin();
  int v12 = (char *)&v55 - v11;
  int v65 = 0;
  uint64_t v64 = 0LL;
  *(void *)int v12 = v70;
  uint64_t v62 = (char *)&v55 - v11;
  *((_DWORD *)v12 + 2) = v71;
  uint64_t v59 = v10;
  if ((int)v10 >= 1)
  {
    uint64_t v13 = v59;
    unsigned int v14 = v62 + 12;
    do
    {
      memset_pattern16(v14, &unk_16400, 0xCuLL);
      v14 += 12;
      --v13;
    }

    while (v13);
    uint64_t v15 = 1LL;
    uint64_t v16 = v62;
    do
    {
      uint64_t v17 = 0LL;
      uint64_t v18 = &v62[12 * v15];
      do
      {
        if (((unsigned int (*)(void))off_1C650[v17])(v9[v15 - 1]))
        {
          uint64_t v19 = 0LL;
          uint64_t v20 = (_DWORD *)v66[v17];
          int v21 = *((_DWORD *)&v64 + v17);
          int v22 = 23649;
          do
          {
            if (v17 != v19 && *(_DWORD *)&v16[4 * v19] < v22) {
              int v22 = *(_DWORD *)&v16[4 * v19];
            }
            ++v19;
          }

          while (v19 != 3);
          int v23 = v20[v21 % dword_15DD4[v17]] + *(_DWORD *)&v18[4 * v17 - 12];
          int v24 = *((_DWORD *)&v70 + v17) + v22 + *v20;
          if (v23 <= v24)
          {
            *(_DWORD *)&v18[4 * v17] = v23;
            int v25 = v21 + 1;
          }

          else
          {
            *(_DWORD *)&v18[4 * v17] = v24;
            int v25 = 1;
          }

          *((_DWORD *)&v64 + v17) = v25;
        }

        ++v17;
      }

      while (v17 != 3);
      ++v15;
      v16 += 12;
    }

    while ((id)v15 != v61);
  }

  uint64_t v26 = 0LL;
  LODWORD(v27) = v59;
  LODWORD(v28) = -1;
  int v29 = 23649;
  do
  {
    int v30 = *(_DWORD *)&v62[12 * (int)v59 + 4 * v26];
    if (v30 >= v29) {
      uint64_t v28 = v28;
    }
    else {
      uint64_t v28 = v26;
    }
    if (v30 < v29) {
      int v29 = *(_DWORD *)&v62[12 * (int)v59 + 4 * v26];
    }
    ++v26;
  }

  while (v26 != 3);
  if ((_DWORD)v28 == -1)
  {
    uint64_t v50 = 0LL;
    uint64_t v43 = v58;
  }

  else
  {
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    id v61 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    unsigned int v32 = v27 - 1;
    if ((int)v27 >= 1)
    {
      uint64_t v27 = v27;
      do
      {
        uint64_t v33 = v28;
        int v34 = *(_DWORD *)&v62[12 * v27 + 4 * (int)v28] - (*((_DWORD *)&v70 + (int)v28) + *(_DWORD *)v66[(int)v28]);
        uint64_t v28 = 0LL;
        while (v33 == v28 || *(_DWORD *)&v62[12 * v32 + 4 * v28] != v34)
        {
          if (++v28 == 3)
          {
            uint64_t v28 = v33;
            goto LABEL_34;
          }
        }

        char v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:"));
        [v31 addObject:v35];

        unsigned int v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", (v27 - 1)));
        [v61 addObject:v36];

LABEL_34:
        --v32;
      }

      while (v27-- > 1);
    }

    int v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v28, v55));
    [v31 addObject:v38];

    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 0LL));
    [v61 addObject:v39];

    uint64_t v40 = v55;
    *int v55 = 0LL;
    v40[1] = 0LL;
    signed int v41 = 0;
    uint64_t v42 = (char *)[v31 count] - 2;
    uint64_t v43 = v58;
    int v44 = v56;
    while ((uint64_t)(v42 + 1) >= 1)
    {
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndex:"));
      int v46 = dword_15DA4[(int)[v45 intValue]];

      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue([v61 objectAtIndex:v42]);
      unsigned int v48 = [v47 intValue];

      uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "subdataWithRange:", v41, (int)(v48 - v41)));
      LOBYTE(v46) = sub_D5CC(v49, v40, v46, v44, v43);

      --v42;
      signed int v41 = v48;
      if ((v46 & 1) == 0)
      {
        uint64_t v50 = 0LL;
        goto LABEL_42;
      }
    }

    uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue([v31 objectAtIndex:0]);
    int v52 = dword_15DA4[(int)[v51 intValue]];

    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "subdataWithRange:", v41, (int)v59 - v41));
    uint64_t v50 = sub_D5CC(v53, v40, v52, v44, v43);

LABEL_42:
  }

  return v50;
}

uint64_t sub_D5CC(void *a1, void *a2, int a3, int a4, void *a5)
{
  id v9 = a1;
  id v10 = a5;
  int v11 = [v9 length];
  int v12 = v11 >= 0 ? v11 : v11 + 1;
  int v13 = v12 >> 1;
  if (a3 == 8) {
    int v11 = v13;
  }
  else {
LABEL_9:
  }
    uint64_t v14 = 0LL;

  return v14;
}

BOOL sub_D684(int a1)
{
  return (a1 - 48) < 0xA;
}

BOOL sub_D694(int a1)
{
  return a1 <= 95 && dword_15994[a1] != -1;
}

uint64_t sub_D6BC()
{
  return 1LL;
}

BOOL sub_D6C4(int a1, int a2, uint64_t a3)
{
  unint64_t v5 = 0LL;
  BOOL v6 = 0;
  id v8 = (char *)&unk_15DE0;
  while (2)
  {
    for (uint64_t i = 0LL; i != 7; ++i)
    {
      if (sub_DFF4(a3, a1 + (int)i, (int)v5 + a2) != -1)
      {
        uint64_t v10 = sub_37A8();
        int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_11814(v11, v12, v13, v14, v15, v16, v17, v18);
        }

        return v6;
      }

      if (!sub_E018(a3, a1 + i, v5 + a2, v8[4 * i])) {
        return v6;
      }
    }

    BOOL v6 = v5 > 5;
    v8 += 28;
    if (++v5 != 7) {
      continue;
    }
    break;
  }

  return 1;
}

BOOL sub_D7B4(int a1, int a2, uint64_t a3)
{
  BOOL v6 = 0;
  unsigned int v7 = 0;
  while (sub_DFF4(a3, a1 + v7, a2) == -1)
  {
    if (sub_E018(a3, a1 + v7, a2, 0))
    {
      BOOL v6 = v7++ > 6;
      if (v7 != 8) {
        continue;
      }
    }

    return v6;
  }

  uint64_t v8 = sub_37A8();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_11884(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  return v6;
}

BOOL sub_D86C(int a1, int a2, uint64_t a3)
{
  BOOL v6 = 0;
  unsigned int v7 = 0;
  while (sub_DFF4(a3, a1, a2 + v7) == -1)
  {
    if (sub_E018(a3, a1, a2 + v7, 0))
    {
      BOOL v6 = v7++ > 5;
      if (v7 != 7) {
        continue;
      }
    }

    return v6;
  }

  uint64_t v8 = sub_37A8();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_118F4(v9, v10, v11, v12, v13, v14, v15, v16);
  }

  return v6;
}

uint64_t sub_D924(int a1, int a2)
{
  int v4 = 0;
  if (a2)
  {
    int v5 = a2;
    do
    {
      if (v5 < 0) {
        NSLog(@"Error: number should not be negative!");
      }
      ++v4;
      BOOL v6 = v5 > 1;
      v5 >>= 1;
    }

    while (v6);
  }

  uint64_t v7 = (a1 << (v4 - 1));
  if (!(_DWORD)v7) {
    goto LABEL_17;
  }
  while (1)
  {
    int v8 = 0;
    int v9 = v7;
    do
    {
      if (v9 < 0) {
        NSLog(@"Error: number should not be negative!");
      }
      ++v8;
      BOOL v6 = v9 > 1;
      v9 >>= 1;
    }

    while (v6);
    if (v8 < v4) {
      break;
    }
    char v10 = 0;
    int v11 = v7;
    do
    {
      if (v11 < 0) {
        NSLog(@"Error: number should not be negative!");
      }
      ++v10;
      BOOL v6 = v11 > 1;
      v11 >>= 1;
    }

    while (v6);
    while (1)
    {
      uint64_t v7 = (a2 << (v10 - v4)) ^ v7;
      if ((_DWORD)v7) {
        break;
      }
LABEL_17:
      if (v4 > 0) {
        return v7;
      }
      char v10 = 0;
    }
  }

  return v7;
}

void sub_DA1C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_DA2C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_DA40( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

unsigned int *sub_DA54(unsigned int *result)
{
  return sub_DAF0(result);
}

  ;
}

uint64_t sub_DA70(uint64_t a1, unsigned int a2)
{
  if (a1)
  {
    if ((a2 & 0x80000000) == 0 && *(_DWORD *)a1 >= (signed int)a2)
    {
      uint64_t v2 = *(void *)(a1 + 8);
      if (v2) {
        return (*(unsigned __int8 *)(v2 + ((unint64_t)a2 >> 3)) >> (~(_BYTE)a2 & 7)) & 1;
      }
    }
  }

  uint64_t v4 = sub_37A8();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_11964();
  }

  return 0xFFFFFFFFLL;
}

unsigned int *sub_DAF0(unsigned int *result)
{
  if (result) {
    return (unsigned int *)*result;
  }
  return result;
}

_DWORD *sub_DAFC(_DWORD *result)
{
  if (result) {
    return (_DWORD *)((*result + 7) >> 3);
  }
  return result;
}

uint64_t sub_DB10(void *a1, unsigned int a2)
{
  if (a2 >= 2)
  {
    uint64_t v8 = sub_37A8();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_11990();
    }

    return 0LL;
  }

  if (!a1) {
    return 0LL;
  }
  char v3 = a2;
  int v4 = *(_DWORD *)a1;
  char v5 = *(_DWORD *)a1 & 7;
  if ((*(_DWORD *)a1 & 7) == 0)
  {
    unsigned int v6 = sub_DBD0(a1, 0);
    uint64_t result = 0LL;
    if (!v6) {
      return result;
    }
    int v4 = *(_DWORD *)a1 - 8;
    *(_DWORD *)a1 = v4;
  }

  *(_BYTE *)(a1[1] + (v4 >> 3)) |= v3 << (v5 ^ 7);
  ++*(_DWORD *)a1;
  return 1LL;
}

void *sub_DBD0(void *result, char a2)
{
  if (result)
  {
    char v3 = result;
    uint64_t result = (void *)result[1];
    if (result || (void *v3 = 0x2000000000LL, result = calloc(0x20uLL, 1uLL), (v3[1] = result) != 0LL))
    {
      int v4 = *(int *)v3 >> 3;
      if (v4 == *((_DWORD *)v3 + 1))
      {
        uint64_t result = realloc(result, 2 * v4);
        v3[1] = result;
        if (!result) {
          return result;
        }
        int v5 = *(_DWORD *)v3;
        *((_DWORD *)v3 + 1) *= 2;
        int v4 = v5 >> 3;
      }

      *((_BYTE *)result + v4) = a2;
      *(_DWORD *)v3 += 8;
      return (void *)(&dword_0 + 1);
    }
  }

  return result;
}

uint64_t sub_DC64(void *a1, int a2, unsigned int a3)
{
  if (a3 >= 0x21)
  {
    uint64_t v3 = sub_37A8();
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_119BC();
    }

    return 0LL;
  }

  if (!a1) {
    return 0LL;
  }
  int v6 = a3;
  if (a3)
  {
    do
    {
      char v8 = v6 - 8;
      if (v6 < 8 || (*(_DWORD *)a1 & 7) != 0)
      {
        uint64_t result = sub_DB10(a1, (a2 >> --v6) & 1);
        if (!(_DWORD)result) {
          return result;
        }
      }

      else
      {
        v6 -= 8;
      }
    }

    while (v6 > 0);
  }

  return 1LL;
}

uint64_t sub_DD28(unsigned int *a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    uint64_t v3 = *a1;
    if ((_DWORD)v3 == *(_DWORD *)a2)
    {
      if ((int)v3 >= 1)
      {
        uint64_t v4 = 0LL;
        unint64_t v5 = (unint64_t)(v3 + 7) >> 3;
        do
        {
          *(_BYTE *)(*((void *)a1 + 1) + v4) ^= *(_BYTE *)(*(void *)(a2 + 8) + v4);
          ++v4;
        }

        while (v5 != v4);
      }

      return 1LL;
    }

    else
    {
      uint64_t v6 = sub_37A8();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_119E8();
      }

      return 0LL;
    }
  }

  return v2;
}

_DWORD *sub_DDCC(_DWORD *result, int a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = calloc(a2, 1uLL);
    *(void *)uint64_t v3 = result;
    if (result)
    {
      v3[2] = a2;
      v3[3] = a2;
      return &dword_0 + 1;
    }
  }

  return result;
}

uint64_t sub_DE0C(void *a1, int a2)
{
  if (a1) {
    return *(unsigned __int8 *)(*a1 + a2);
  }
  uint64_t v3 = sub_37A8();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_11A14();
  }

  return 0xFFFFFFFFLL;
}

BOOL sub_DE60(void *a1, int a2, char a3)
{
  if (a1)
  {
    *(_BYTE *)(*a1 + a2) = a3;
  }

  else
  {
    uint64_t v4 = sub_37A8();
    unint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_11A40();
    }
  }

  return a1 != 0LL;
}

void *sub_DEBC(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (a1)
  {
    char v8 = *(void **)a1;
    if (v8) {
      free(v8);
    }
    uint64_t result = calloc(a4, 1uLL);
    *(void *)a1 = result;
    if (result)
    {
      *(_DWORD *)(a1 + 8) = a4;
      *(_DWORD *)(a1 + 12) = a4;
      if (a4 >= 1)
      {
        uint64_t v10 = 0LL;
        do
        {
          *(_BYTE *)(*(void *)a1 + v10) = *(_BYTE *)(a2 + a3 + v10);
          ++v10;
        }

        while (a4 != v10);
      }

      return &dword_0 + 1;
    }
  }

  else
  {
    uint64_t v11 = sub_37A8();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_11A6C();
    }

    return 0LL;
  }

  return result;
}

void *sub_DF74(uint64_t a1, int a2, int a3)
{
  if (a1)
  {
    uint64_t result = calloc(a3 * a2, 1uLL);
    *(void *)a1 = result;
    if (result)
    {
      *(_DWORD *)(a1 + 8) = a2;
      *(_DWORD *)(a1 + 12) = a3;
      return &dword_0 + 1;
    }
  }

  else
  {
    uint64_t v7 = sub_37A8();
    char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_11A98();
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_DFF4(uint64_t a1, int a2, int a3)
{
  if (a1) {
    return *(char *)(*(void *)a1 + a2 + *(_DWORD *)(a1 + 8) * a3);
  }
  else {
    return 0;
  }
}

BOOL sub_E018(uint64_t a1, int a2, int a3, char a4)
{
  if (a1) {
    *(_BYTE *)(*(void *)a1 + a2 + *(_DWORD *)(a1 + 8) * a3) = a4;
  }
  return a1 != 0;
}

BOOL sub_E038(uint64_t a1, char a2)
{
  if (a1 && *(_DWORD *)(a1 + 12) * *(_DWORD *)(a1 + 8) >= 1)
  {
    uint64_t v2 = 0LL;
    do
      *(_BYTE *)(*(void *)a1 + v2++) = a2;
    while (v2 < *(int *)(a1 + 12) * (uint64_t)*(int *)(a1 + 8));
  }

  return a1 != 0;
}

CGImageRef sub_E078(void *a1, void *a2)
{
  id v3 = a1;
  id v166 = a2;
  if (!v3)
  {
    int v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v160 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "CGImageRef PDF417CreateBarcodeImage(NSData *__strong, NSDictionary *__strong, NSError *__autoreleasing *)"));
    uint64_t decode = (CGFloat *)@"message != nil";
    [v159 handleFailureInFunction:v160 file:@"PDF417.m" lineNumber:1751 description:@"Invalid parameter not satisfying: %@"];
  }

  id v165 = v3;
  if (![v3 length])
  {
    sub_F0E4(@"The message must contain at least one character.", v4, v5, v6, v7, v8, v9, v10, (uint64_t)decode);
    goto LABEL_215;
  }

  if (sub_F250(v166, @"PDF417OptionMessageDataIsCodeWordData", qword_1A060))
  {
    uint64_t v11 = sub_F250(v166, @"PDF417OptionDataColumns", qword_16448);
    uint64_t v19 = sub_F250(v166, @"PDF417OptionRows", qword_16460);
    uint64_t v20 = @"When supplying a raw message payload, the data columns and rows must also be specified";
    if (v19 != -1 && v11 != -1)
    {
      if ((unint64_t)[v3 length] < 2)
      {
        uint64_t v20 = @"Message codeword payload must contain a symbol length descriptor codeword";
      }

      else
      {
        id v21 = v3;
        int v22 = (unsigned __int16 *)[v21 bytes];
        unint64_t v23 = *v22;
        if (v23 > (unint64_t)[v21 length] >> 1)
        {
          uint64_t v20 = @"Message codeword payload is too small for symbol length descriptor codeword.";
        }

        else
        {
          uint64_t v24 = (v19 * v11 - v23);
          if ((int)v24 < 2)
          {
            uint64_t v20 = @"Symbol matrix is too small for specified parameters with supplied message codeword payload";
          }

          else
          {
            unint64_t v25 = 8LL;
            while (sub_F1B8(v25) != v24)
            {
              if (--v25 == -1LL)
              {
                LODWORD(v25) = -1;
                break;
              }
            }

            if (v19 * v11 <= 929)
            {
              int v29 = malloc(2 * v11 * v19);
              memcpy(v29, v22, 2 * v23);
              int v30 = &v29[v23];
              int v171 = v25;
              unint64_t v31 = (int)v25;
              goto LABEL_146;
            }

            uint64_t v20 = @"Specified PDF417 symbol matrix is too large";
          }
        }
      }
    }

    sub_F0E4(v20, v12, v13, v14, v15, v16, v17, v18, (uint64_t)decode);
    while (1)
    {
LABEL_215:
      __break(1u);
LABEL_216:
      v161 = @"It is not possible to encode a message this long with the recommended level of error correction";
LABEL_214:
      sub_F0E4(v161, v68, v69, v70, v71, v72, v73, v74, (uint64_t)decode);
    }
  }

  id v175 = v3;
  id __len = v166;
  if (qword_21030 != -1) {
    dispatch_once(&qword_21030, &stru_1C708);
  }
  uint64_t v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  int v26 = [v175 length];
  uint64_t v27 = sub_F250(__len, @"PDF417OptionAlwaysSpecifyCompaction", qword_1A060);
  int v28 = sub_F250(__len, @"PDF417OptionCompactionMode", qword_164A0);
  switch(v28)
  {
    case 1:
      [v177 appendBytes:&unk_1647A length:2];
      sub_F988(v175, 0, v26, v177);
      goto LABEL_98;
    case 2:
      if (v27) {
        [v177 appendBytes:&unk_16478 length:2];
      }
      sub_F310(v175, 0, v26, v177, 0LL);
      goto LABEL_98;
    case 3:
      sub_F7B4(v175, 0, v26, 1, v177);
      goto LABEL_98;
  }

  if (v26 >= 1)
  {
    uint64_t v32 = 0LL;
    uint64_t v33 = 0LL;
    if (v27) {
      int v34 = -1;
    }
    else {
      int v34 = 0;
    }
    while (1)
    {
      id v35 = v175;
      unsigned int v36 = (char *)[v35 bytes];
      int v37 = [v35 length];
      int v38 = v37 - v32;
      if (v37 <= (int)v32 || v36[(int)v32] - 48 > 9)
      {

        int v43 = 0;
      }

      else
      {
        uint64_t v39 = &v36[(int)v32 + 1];
        uint64_t v40 = ~(uint64_t)(int)v32 + v37;
        unsigned int v41 = -1;
        while (v40)
        {
          int v42 = *v39++;
          --v40;
          ++v41;
          if ((v42 - 48) >= 0xA)
          {
            int v38 = v41 + 1;
            goto LABEL_92;
          }
        }

        unsigned int v41 = v37 + ~(_DWORD)v32;
LABEL_92:

        if (v41 >= 0xC)
        {
          [v177 appendBytes:&unk_1647A length:2];
          sub_F988(v35, v32, v38, v177);
          uint64_t v33 = 0LL;
          int v34 = 2;
          goto LABEL_94;
        }

        int v43 = v38;
      }

      id v44 = v35;
      uint64_t v45 = (unsigned __int8 *)[v44 bytes];
      int v46 = [v44 length];
      LODWORD(v47) = v32;
      uint64_t v47 = v32;
      while (1)
      {
        uint64_t v48 = 0LL;
        uint64_t v49 = (int)v47;
        int v50 = v45[(int)v47];
        uint64_t v51 = v47 << 32;
        uint64_t v52 = (uint64_t)&v45[(int)v47 + 1];
        while (1)
        {
          BOOL v53 = v49 + v48 >= v46 || (v50 - 48) > 9;
          if (v53) {
            break;
          }
          if (v49 + v48 + 1 < v46) {
            int v50 = *(unsigned __int8 *)(v52 + v48);
          }
          v51 += 0x100000000LL;
          if ((_DWORD)++v48 == 13)
          {
            LODWORD(v47) = v49;
            goto LABEL_59;
          }
        }

        if (!(_DWORD)v48) {
          break;
        }
        uint64_t v47 = v48 + v49;
LABEL_55:
      }

      unsigned int v54 = v45[v51 >> 32];
      if (v54 <= 0xD && ((1 << v54) & 0x2600) != 0) {
        break;
      }
      if (v54 - 32 <= 0x5E)
      {
        uint64_t v47 = v48 + v49 + 1;
        goto LABEL_55;
      }

      LODWORD(v47) = v49;
LABEL_59:
      int v38 = v47 - v32;

      if (v38 > 4 || v43 == v26)
      {
        if (v34)
        {
          [v177 appendBytes:&unk_16478 length:2];
          uint64_t v33 = 0LL;
        }

        uint64_t v33 = sub_F310(v44, v32, v38, v177, v33);
        int v34 = 0;
      }

      else
      {
        id v56 = v44;
        uint64_t v57 = (char *)[v56 bytes];
        int v58 = [v56 length];
        LODWORD(v59) = v32;
        if ((int)v32 < v58)
        {
          uint64_t v59 = (int)v32;
          id v60 = &v57[(int)v32];
LABEL_63:
          uint64_t v61 = v59 + 1;
          BOOL v62 = v57[v59] - 48 <= 9 && v61 < v58;
          int v63 = v57[v59];
          if (!v62) {
            goto LABEL_73;
          }
          uint64_t v64 = 1LL;
          do
          {
            int v63 = v60[v64];
            ++v64;
          }

          while (v59 + v64 < v58);
          if ((int)v64 <= 12)
          {
LABEL_73:
            unsigned int v65 = -1;
            while (v65 != 4)
            {
              ++v65;
              int v63 = v57[v59];
              if ((int)(v59 + v65 + 1) >= v58)
              {
                if (v65 > 3) {
                  break;
                }
LABEL_80:
                ++v60;
                ++v59;
                if (v61 != v58) {
                  goto LABEL_63;
                }
                LODWORD(v59) = v58;
                break;
              }
            }
          }
        }

        int v38 = v59 - v32;

        BOOL v66 = v38 > 1;
        if (v34 || v66)
        {
          sub_F7B4(v56, v32, v38, v34, v177);
          uint64_t v33 = 0LL;
          int v34 = 1;
        }

        else
        {
          sub_F7B4(v56, v32, 1, 0, v177);
          int v34 = 0;
        }
      }

LABEL_94:
      uint64_t v32 = (v38 + v32);
    }

    uint64_t v47 = (v49 + 1);
    goto LABEL_55;
  }

LABEL_98:
  unint64_t v67 = (unint64_t)(int)[v177 length] >> 1;
  int v75 = sub_F250(__len, @"PDF417OptionErrorCorrectionLevel", qword_164C0);
  if (v75 == -1)
  {
    if ((uint64_t)(v67 << 32) >= 0x2900000000LL)
    {
      if (v67 >= 0xA1uLL)
      {
        if (v67 >= 0x141uLL)
        {
          int v75 = 5;
        }

        else
        {
          int v75 = 4;
        }
      }

      else
      {
        int v75 = 3;
      }
    }

    else
    {
      int v75 = 2;
    }
  }

  int v171 = v75;
  unint64_t v31 = v75;
  LODWORD(v24) = sub_F1B8(v75);
  if ((int)v24 + (int)v67 >= 929)
  {
    v161 = @"Message is longer than is supportable by barcode format.";
    goto LABEL_214;
  }

  id v76 = __len;
  uint64_t v77 = sub_F250(v76, @"PDF417OptionUseCompactStyle", qword_1A060);
  uint64_t v78 = sub_F250(v76, @"PDF417OptionDataColumns", qword_16448);
  LODWORD(v79) = v78;
  if (v78 == -1)
  {
    id v80 = v76;
    uint64_t v81 = sub_F250(v80, @"PDF417OptionUseCompactStyle", qword_1A060);
    unint64_t v82 = 39LL;
    if (!v81) {
      unint64_t v82 = 73LL;
    }
    int64x2_t v179 = vaddq_s64(vdupq_n_s64(v82), (int64x2_t)xmmword_16420);
    uint64_t v180 = v179.i64[0];
    uint64_t v83 = sub_F250(v80, @"PDF417OptionMinWidth", &v179);

    if (v77) {
      uint64_t v84 = -39LL;
    }
    else {
      uint64_t v84 = -73LL;
    }
    if (v77) {
      uint64_t v85 = -23LL;
    }
    else {
      uint64_t v85 = -57LL;
    }
    id v86 = v80;
    uint64_t v87 = sub_F250(v86, @"PDF417OptionUseCompactStyle", qword_1A060);
    uint64_t v88 = 39LL;
    if (!v87) {
      uint64_t v88 = 73LL;
    }
    v179.i64[0] = v88 + 17;
    v179.i64[1] = v88 + 510;
    uint64_t v180 = v88 + 510;
    uint64_t v89 = sub_F250(v86, @"PDF417OptionMaxWidth", &v179);
    uint64_t v79 = (v83 + v85) / 17;

    uint64_t v78 = (v89 + v84) / 17;
  }

  uint64_t v90 = sub_F250(v76, @"PDF417OptionRows", qword_16460);
  uint64_t v91 = v90;
  if (v90 == -1)
  {
    int64x2_t v179 = (int64x2_t)xmmword_16430;
    uint64_t v180 = 13LL;
    uint64_t v92 = sub_F250(v76, @"PDF417OptionMinHeight", &v179);
    int64x2_t v179 = (int64x2_t)xmmword_16430;
    uint64_t v180 = 274LL;
    uint64_t v91 = (v92 - 2) / 3;
    uint64_t v90 = (sub_F250(v76, @"PDF417OptionMaxHeight", &v179) - 4) / 3;
  }

  int v93 = (void *)objc_claimAutoreleasedReturnValue([v76 objectForKey:@"PDF417OptionPreferredAspectRatio"]);
  [v93 floatValue];
  float v95 = v94;

  float v96 = 3.0;
  if (v95 > 0.0) {
    float v96 = v95;
  }
  if (v77) {
    uint64_t v97 = 39LL;
  }
  else {
    uint64_t v97 = 73LL;
  }
  uint64_t v11 = 0LL;
  uint64_t v98 = (int)v79;
  uint64_t v19 = 0LL;
  uint64_t v99 = v97 + 17 * v98;
  float v100 = 3.4028e38;
  do
  {
    uint64_t v101 = ((int)v24 + (int)v67 + (int)v98) / (int)v98;
    if (v91 > v101) {
      LODWORD(v101) = v91;
    }
    if ((int)v101 <= v90)
    {
      float v102 = (float)v99 / (float)(3 * v101 + 4);
      if (!(v11 | v19)) {
        goto LABEL_139;
      }
      float v103 = v102 - v96;
      float v104 = v100 - v96;
      if (v103 <= v104)
      {
LABEL_139:
        uint64_t v11 = v98;
        uint64_t v19 = (int)v101;
        float v100 = (float)v99 / (float)(3 * v101 + 4);
      }
    }

    ++v98;
    v99 += 17LL;
  }

  while (v78 >= v98);
  if (!(v11 | v19))
  {
LABEL_207:
    v161 = @"Unable to fit message into space available!";
    goto LABEL_214;
  }

  int v105 = v19 * v11 - v24;
  __int16 v106 = v67 + 1;
  else {
    int v107 = v105 + ~(_DWORD)v67;
  }
  unsigned __int16 v108 = v106 + v107;
  int v29 = malloc(2LL * (int)(v24 + (unsigned __int16)(v106 + v107)));
  *int v29 = v108;
  id v109 = v177;
  memcpy(v29 + 1, [v109 bytes], (size_t)objc_msgSend(v109, "length"));
  unint64_t v23 = v108;
  v110 = (char *)[v109 length] + (void)(v29 + 1);
  memset_pattern4(v110, &unk_1A078, 2LL * v107);
  int v30 = (unsigned __int16 *)&v110[2 * v107];

LABEL_146:
  bzero(v30, 2LL * (int)v24);
  uint64_t v111 = sub_F1B8(v31);
  if ((_DWORD)v23)
  {
    uint64_t v112 = 0LL;
    v113 = (int *)*(&off_1C778 + v31);
    int v116 = *v113;
    uint64_t v114 = v113 - 1;
    int v115 = v116;
    uint64_t v117 = (int)v111 - 1;
    do
    {
      unsigned int v118 = *v30 + (unsigned __int16)v29[v112];
      int v119 = v118 - 929 * ((4623216 * (unint64_t)v118) >> 32);
      id v120 = v30 + 1;
      uint64_t v121 = v111;
      if ((int)v111 >= 2)
      {
        do
        {
          *(unsigned __int16 *)((char *)v120 + 2 * v117 - 2 * v111) = (*v120
                                                                     + 929 * (v114[v121] * v119 / 929)
                                                                     - v114[v121] * v119
                                                                     + 929)
                                                                    % 0x3A1;
          ++v120;
          BOOL v53 = v121-- <= 2;
        }

        while (!v53);
      }

      int v122 = v119 * v115 % 929;
      else {
        LOWORD(v122) = 929 - v122;
      }
      v30[v117] = v122;
      ++v112;
    }

    while (v112 != v23);
  }

  if ((int)v111 >= 1)
  {
    uint64_t v123 = v111;
    do
    {
      if (*v30) {
        *int v30 = 929 - *v30;
      }
      ++v30;
      --v123;
    }

    while (v123);
  }

  uint64_t v124 = sub_F250(v166, @"PDF417OptionUseCompactStyle", qword_1A060);
  uint64_t v125 = 17 * v11;
  if (v124) {
    uint64_t v126 = 39LL;
  }
  else {
    uint64_t v126 = 73LL;
  }
  uint64_t v127 = v126 + v125;
  uint64_t __n = 4 * (v126 + v125);
  size_t v163 = 3 * v19 + 4;
  int v128 = (char *)malloc(__n * v163);
  uint64_t __lena = 8 * v127;
  memset_pattern4(v128, &unk_174D0, 8 * v127);
  int v129 = &v128[8 * v127];
  size_t v164 = v127;
  if (v19 >= 1)
  {
    uint64_t v130 = 0LL;
    int v176 = 0;
    int v170 = ((int)v19 - 1) / 3;
    int v169 = 3 * v171 + ((int)v19 - 1) % 3;
    int v168 = v11 - 1;
    uint64_t v167 = 12 * v127;
    uint64_t v131 = (uint64_t)&v128[136 * v11 + 8 + 8 * v126];
    do
    {
      *(void *)int v129 = -1LL;
      int v132 = 16;
      uint64_t v178 = v131;
      int v133 = (int *)v131;
      do
      {
        if (((1 << v132) & 0x1FEA8) != 0) {
          int v134 = -16777216;
        }
        else {
          int v134 = -1;
        }
        *v133++ = v134;
        --v132;
      }

      while (v132 != -1);
      unsigned int v135 = v130 % 3;
      unsigned int v136 = 30 * (v130 / 3) + v169;
      unsigned int v137 = 30 * (v130 / 3) + v168;
      unsigned int v138 = 30 * (v130 / 3);
      unsigned int v139 = v138 + v170;
      unsigned int v140 = v138 + v168;
      if (v135) {
        unsigned int v140 = 30 * (v130 / 3) + v169;
      }
      if (v135 == 1) {
        unsigned int v140 = 30 * (v130 / 3) + v170;
      }
      else {
        unsigned int v136 = v137;
      }
      unsigned int v141 = dword_174D4[929 * v135 + v136];
      for (int i = 16; i != -1; --i)
      {
        if (((v141 >> i) & 1) != 0) {
          int v143 = -16777216;
        }
        else {
          int v143 = -1;
        }
        *v133++ = v143;
      }

      if (v11 >= 1)
      {
        uint64_t v144 = 0LL;
        uint64_t v145 = v176;
        do
        {
          unsigned int v146 = dword_174D4[929 * v135 + (unsigned __int16)v29[v145]];
          for (int j = 16; j != -1; --j)
          {
            if (((v146 >> j) & 1) != 0) {
              int v148 = -16777216;
            }
            else {
              int v148 = -1;
            }
            *v133++ = v148;
          }

          ++v145;
          ++v144;
        }

        while (v144 != v11);
        int v176 = v145;
      }

      if (v124)
      {
        *v133++ = -16777216;
      }

      else
      {
        unsigned int v149 = dword_174D4[929 * v135 + v140];
        for (int k = 16; k != -1; --k)
        {
          if (((v149 >> k) & 1) != 0) {
            int v151 = -16777216;
          }
          else {
            int v151 = -1;
          }
          *v133++ = v151;
        }

        for (int m = 17; m != -1; --m)
        {
          if (((1 << m) & 0x3FA29) != 0) {
            int v153 = -16777216;
          }
          else {
            int v153 = -1;
          }
          *v133++ = v153;
        }
      }

      *(void *)int v133 = -1LL;
      memcpy(&v129[__n], v129, __n);
      memcpy(&v129[__lena], v129, __n);
      v129 += v167;
      ++v130;
      uint64_t v131 = v178 + v167;
    }

    while (v130 != v19);
  }

  memset_pattern4(v129, &unk_174D0, __lena);
  id v154 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)v128, __n * v163, kCFAllocatorMalloc);
  unint64_t v155 = CGDataProviderCreateWithCFData(v154);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGImageRef v157 = CGImageCreate(v164, v163, 8uLL, 0x20uLL, __n, DeviceRGB, 0x2002u, v155, 0LL, 0, kCGRenderingIntentDefault);
  CFRelease(DeviceRGB);
  CFRelease(v155);
  CFRelease(v154);
  free(v29);

  return v157;
}

void sub_F098( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    if (a11) {
      *a11 = v11;
    }
    objc_end_catch();
    JUMPOUT(0xEF50LL);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_F0E4( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a1,  &a9);
  v14[0] = NSLocalizedDescriptionKey;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([@"Unable to create barcode. " stringByAppendingString:v9]);
  v14[1] = NSLocalizedFailureReasonErrorKey;
  v15[0] = v10;
  v15[1] = v9;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.pdf417",  0LL,  v11));
  objc_exception_throw(v12);
  return sub_F1B8();
}

uint64_t sub_F1B8(unint64_t a1)
{
  char v1 = a1;
  if (a1 >= 9)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSInteger ErrorCorrectionCodeWordCountForLevel(NSInteger)"));
    [v3 handleFailureInFunction:v4 file:@"PDF417.m" lineNumber:953 description:@"Error correction level must be between 0 and 8!"];
  }

  return 1 << (v1 + 1);
}

uint64_t sub_F250(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  id v9 = [v7 integerValue];
  id v17 = v9;
  if ((uint64_t)v9 >= *a3)
  {
    if ((uint64_t)v9 <= a3[1])
    {
LABEL_6:

      return (uint64_t)v17;
    }

    sub_F0E4( @"Specified %@, %ld, is greater than the maximum, %ld.",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)v6);
LABEL_5:
    id v17 = (id)a3[2];
    goto LABEL_6;
  }

  uint64_t v19 = sub_F0E4( @"Specified %@, %ld, is less than the minimum, %ld.",  v10,  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)v6);
  return sub_F310(v19);
}

uint64_t sub_F310(void *a1, int a2, int a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  int v42 = &v39;
  v58[0] = 0LL;
  v58[1] = v58;
  v58[2] = 0x2020000000LL;
  v58[3] = &v59;
  uint64_t v54 = 0LL;
  int v55 = &v54;
  uint64_t v56 = 0x2020000000LL;
  int v57 = 0;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_FC28;
  v50[3] = &unk_1C730;
  uint64_t v52 = &v54;
  id v41 = a4;
  id v51 = v41;
  BOOL v53 = v58;
  uint64_t v10 = objc_retainBlock(v50);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_FCF4;
  v46[3] = &unk_1C758;
  uint64_t v48 = &v54;
  uint64_t v11 = v10;
  id v47 = v11;
  uint64_t v49 = v58;
  uint64_t v12 = objc_retainBlock(v46);
  id v13 = v9;
  uint64_t v14 = (char *)[v13 bytes];
  id v40 = v13;
  int v22 = 0;
  int v23 = a2 + 1;
  uint64_t v45 = v14;
  uint64_t v24 = &v14[a2];
  int v43 = (void (**)(void))v11;
  id v44 = v24;
LABEL_2:
  unint64_t v25 = &v24[v22];
  do
  {
    unsigned int v27 = *v25++;
    uint64_t v26 = v27;
    int v28 = (char)v27;
    switch((_DWORD)a5)
    {
      case 0:
        if (v28 != 32 && (v26 - 65) > 0x19)
        {
          if ((v26 - 97) <= 0x19)
          {
LABEL_55:
            a5 = 1LL;
            ((void (*)(void *, uint64_t, void))v12[2])(v12, 27LL, 0LL);
            uint64_t v24 = v44;
            goto LABEL_2;
          }

          if (v28 < 0) {
            goto LABEL_62;
          }
          if (*((unsigned __int8 *)&xmmword_21038 + v26) != 255)
          {
LABEL_56:
            a5 = 2LL;
            ((void (*)(void *, uint64_t, void))v12[2])(v12, 28LL, 0LL);
            uint64_t v24 = v44;
            goto LABEL_2;
          }

LABEL_51:
          ((void (*)(void *, uint64_t, void))v12[2])(v12, 29LL, 0LL);
          uint64_t v29 = 0LL;
          LOBYTE(v28) = *((_BYTE *)&xmmword_210B8 + v26);
          goto LABEL_52;
        }

        BOOL v31 = v28 == 32;
        if (v28 == 32) {
          LOBYTE(v28) = 26;
        }
        unsigned int v32 = -65;
        goto LABEL_23;
      case 1:
        if (v28 != 32 && (v26 - 97) > 0x19)
        {
          if ((v26 - 65) <= 0x19)
          {
            ((void (*)(void *, uint64_t, void))v12[2])(v12, 27LL, 0LL);
            uint64_t v29 = 4294967231LL;
            goto LABEL_52;
          }

          if (v28 < 0) {
            goto LABEL_62;
          }
          goto LABEL_51;
        }

        BOOL v31 = v28 == 32;
        if (v28 == 32) {
          LOBYTE(v28) = 26;
        }
        unsigned int v32 = -97;
LABEL_23:
        if (v31) {
          uint64_t v29 = 0LL;
        }
        else {
          uint64_t v29 = v32;
        }
        goto LABEL_52;
      case 2:
        if ((v28 & 0x80000000) == 0 && *((unsigned __int8 *)&xmmword_21038 + v26) != 255)
        {
          uint64_t v29 = 0LL;
          LOBYTE(v28) = *((_BYTE *)&xmmword_21038 + v26);
          goto LABEL_52;
        }

        if (v28 == 32 || (v26 - 65) <= 0x19)
        {
          uint64_t v35 = 28LL;
LABEL_57:
          ((void (*)(void *, uint64_t, void))v12[2])(v12, v35, 0LL);
          a5 = 0LL;
          uint64_t v24 = v44;
          goto LABEL_2;
        }

        if (v28 < 0 || *((unsigned __int8 *)&xmmword_210B8 + v26) == 255)
        {
LABEL_62:
          sub_F0E4( @"Message cannot be encoded with PDF417CompactionModeText because it contains character '%d'",  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v26);
          __break(1u);
        }

        if (v23 + v22 < a3
          && (v45[v23 + v22] & 0x80000000) == 0
          && *((unsigned __int8 *)&xmmword_210B8 + v45[v23 + v22]) != 255)
        {
          a5 = 3LL;
          ((void (*)(void *, uint64_t, void))v12[2])(v12, 25LL, 0LL);
          uint64_t v24 = v44;
          goto LABEL_2;
        }

        goto LABEL_51;
    }

    if (v28 < 0 || (int v28 = *((unsigned __int8 *)&xmmword_210B8 + v26), v28 == 255))
    {
      uint64_t v35 = 29LL;
      goto LABEL_57;
    }

    uint64_t v29 = 0LL;
LABEL_52:
    ((void (*)(void *, void, uint64_t))v12[2])(v12, (char)v28, v29);
    ++v22;
  }

  while (v22 < a3);
  unsigned int v36 = v43;
  if ((v55[3] & 1) != 0) {
    ((void (*)(void *, uint64_t, void))v12[2])(v12, 29LL, 0LL);
  }
  v36[2](v36);

  int v37 = v40;
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);

  return a5;
}

void sub_F774( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_F7B4(void *a1, int a2, int a3, int a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = (unsigned __int8 *)[a1 bytes];
  uint64_t v11 = v10;
  if (a3 != 1 || a4)
  {
    HIDWORD(v12) = -1431655765 * a3 + 715827882;
    LODWORD(v12) = HIDWORD(v12);
    else {
      id v13 = &unk_164B8;
    }
    [v9 appendBytes:v13 length:2];
    if (a3 <= 5)
    {
      int v14 = a3 + a2;
    }

    else
    {
      int v14 = a3 + a2;
      uint64_t v15 = a2;
      uint64_t v16 = &v11[a2];
      do
      {
        uint64_t v17 = 0LL;
        int64_t v18 = 0LL;
        do
          int64_t v18 = v16[v17++] | (unint64_t)(v18 << 8);
        while (v17 != 6);
        for (uint64_t i = 4LL; i != -1; --i)
        {
          v26[i] = v18 % 900;
          v18 /= 900LL;
        }

        [v9 appendBytes:v26 length:10];
        int v20 = v15 + 6;
        int v21 = v14 - v15;
        v16 += 6;
        v15 += 6LL;
      }

      while (v21 > 11);
      a2 = v20;
    }

    BOOL v22 = __OFSUB__(v14, a2);
    int v23 = v14 - a2;
    if (!((v23 < 0) ^ v22 | (v23 == 0)))
    {
      uint64_t v24 = &v11[a2];
      do
      {
        __int16 v25 = *v24++;
        v26[0] = v25;
        [v9 appendBytes:v26 length:2];
        --v23;
      }

      while (v23);
    }
  }

  else
  {
    v26[0] = 913;
    v26[1] = v10[a2];
    [v9 appendBytes:v26 length:4];
  }
}

void sub_F988(void *a1, int a2, int a3, void *a4)
{
  id v7 = a1;
  id v33 = a4;
  id v31 = v7;
  uint64_t v8 = (char *)[v31 bytes];
  v30[1] = v30;
  if (a3 >= 1)
  {
    int v9 = 0;
    unsigned int v32 = &v8[a2];
    do
    {
      if (a3 - v9 >= 44) {
        int v10 = 44;
      }
      else {
        int v10 = a3 - v9;
      }
      char v35 = 49;
      __memcpy_chk(v36, &v32[v9], v10, 45LL);
      v36[v10] = 0;
      if (a3 - v9 > 0)
      {
        if (v10 <= 1) {
          uint64_t v18 = 1LL;
        }
        else {
          uint64_t v18 = v10;
        }
        uint64_t v19 = &v35;
        do
        {
          unsigned int v21 = *v19++;
          uint64_t v20 = v21;
          if ((v21 - 58) <= 0xF5u) {
            sub_F0E4( @"Message cannot be encoded with PDF417CompactionModeNumeric because it contains character '%d'",  v11,  v12,  v13,  v14,  v15,  v16,  v17,  v20);
          }
          --v18;
        }

        while (v18);
      }

      uint64_t v22 = 0LL;
      int v23 = 15;
      while (1)
      {
        char v24 = v35;
        if (!v35) {
          break;
        }
        uint64_t v25 = 0LL;
        char v26 = 1;
        unsigned int v27 = v36;
        do
        {
          uint64_t v25 = 10 * v25 + v24 - 48;
          if (v25 >= 900)
          {
            char v26 = 0;
            char v28 = v25 / 0x384uLL + 48;
            v25 %= 0x384uLL;
          }

          else
          {
            char v28 = 48;
          }

          *(v27 - 1) = v28;
          int v29 = *v27++;
          char v24 = v29;
        }

        while (v29);
        v34[14 - v22++] = v25;
        --v23;
        if ((v26 & 1) != 0) {
          goto LABEL_23;
        }
      }

      *(_WORD *)((char *)v34 + ((0xE00000000LL - (v22 << 32)) >> 31)) = 0;
      LODWORD(v22) = v22 + 1;
      --v23;
LABEL_23:
      [v33 appendBytes:&v34[v23] length:(2 * v22)];
      v9 += v10;
    }

    while (v9 < a3);
  }
}

void sub_FBA0(id a1)
{
  uint64_t v1 = 0LL;
  *(void *)&__int128 v2 = -1LL;
  *((void *)&v2 + 1) = -1LL;
  xmmword_21098 = v2;
  unk_210A8 = v2;
  xmmword_21078 = v2;
  unk_21088 = v2;
  xmmword_21058 = v2;
  unk_21068 = v2;
  xmmword_21038 = v2;
  unk_21048 = v2;
  do
  {
    if (((0x3A000000uLL >> v1) & 1) == 0) {
      *((_BYTE *)&xmmword_21038 + a0123456789[v1]) = v1;
    }
    ++v1;
  }

  while (v1 != 30);
  uint64_t v3 = 0LL;
  *(void *)&__int128 v4 = -1LL;
  *((void *)&v4 + 1) = -1LL;
  xmmword_21118 = v4;
  unk_21128 = v4;
  xmmword_210F8 = v4;
  unk_21108 = v4;
  xmmword_210D8 = v4;
  unk_210E8 = v4;
  xmmword_210B8 = v4;
  unk_210C8 = v4;
  do
  {
    *((_BYTE *)&xmmword_210B8 + asc_140A9[v3]) = v3;
    ++v3;
  }

  while (v3 != 29);
}

id sub_FC28(uint64_t a1)
{
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  if ((v2 & 1) != 0)
  {
    __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "int EmitCodeWordsWithTextCompactionMode(NSData *__strong, int, int, NSMutableData *__strong, int)_block_invoke"));
    [v4 handleFailureInFunction:v5 file:@"PDF417.m" lineNumber:336 description:@"cannot flush an odd number of half code words"];

    int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }

  id result = [*(id *)(a1 + 32) appendBytes:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) length:2 * (v2 / 2)];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  return result;
}

uint64_t sub_FCF4(uint64_t result, __int16 a2, __int16 a3)
{
  uint64_t v5 = result;
  int v6 = *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL);
  if (v6 >= 0) {
    int v7 = *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL);
  }
  else {
    int v7 = v6 + 1;
  }
  if (v6 < 128)
  {
    int v8 = v7 >> 1;
  }

  else
  {
    id result = (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
    int v8 = 0;
    int v6 = *(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8LL) + 24LL);
  }

  __int16 v9 = a2 + a3;
  if ((v6 & 1) != 0)
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 24LL);
    *(_WORD *)(v10 + 2LL * v8) += v9;
  }

  else
  {
    *(_WORD *)(*(void *)(*(void *)(*(void *)(v5 + 48) + 8LL) + 24LL) + 2LL * v8) = 30 * v9;
  }

  ++*(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8LL) + 24LL);
  return result;
}

uint64_t sub_FDB0(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  if (![v5 length])
  {
    uint64_t v48 = @"The message must contain at least one character.";
LABEL_21:
    uint64_t result = sub_10070(v48, v6, v7, v8, v9, v10, v11, v12, (uint64_t)decode);
LABEL_23:
    __break(1u);
    return result;
  }

  if ((unint64_t)[v5 length] > 0x1000)
  {
    uint64_t v48 = @"The message is too long for a Code128 barcode.";
    goto LABEL_21;
  }

  id v13 = v5;
  uint64_t v14 = (char *)[v13 bytes];
  uint64_t v15 = (char *)[v13 length];
  unint64_t v23 = (unint64_t)v15;
  if (v15)
  {
    char v24 = v14;
    uint64_t v25 = v15;
    while (1)
    {
      int v26 = *v24++;
      if (v26 < 0) {
        break;
      }
      if (!--v25) {
        goto LABEL_7;
      }
    }

    uint64_t result = sub_10070( @"The message contains non-7bit ascii characters.",  v16,  v17,  v18,  v19,  v20,  v21,  v22,  (uint64_t)decode);
    goto LABEL_23;
  }

LABEL_7:
  int v27 = sub_10144(v14, (unint64_t)v15, a2, 0LL);
  size_t v28 = a3 + 2 * a2;
  size_t v29 = 4LL * v27;
  Mutable = CFDataCreateMutable(0LL, v29 * v28);
  CFDataSetLength(Mutable, v29 * v28);
  if (!Mutable)
  {
    uint64_t result = sub_10070( @"Could not allocate memory for image.",  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)decode);
    goto LABEL_23;
  }

  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10998;
  v50[3] = &unk_1C7C0;
  void v50[4] = MutableBytePtr;
  sub_10144(v14, v23, a2, v50);
  if (v28 >= 2)
  {
    uint64_t v39 = a3 + 2 * a2 - 1;
    uint64_t v40 = 4LL * v27;
    do
    {
      memcpy(&MutableBytePtr[v40], MutableBytePtr, v29);
      v40 += v29;
      --v39;
    }

    while (v39);
  }

  if (a2)
  {
    id v41 = MutableBytePtr;
    unint64_t v42 = a2;
    do
    {
      memset(v41, 255, v29);
      v41 += v29;
      --v42;
    }

    while (v42);
  }

  if (v28 >= a2)
  {
    int v43 = &MutableBytePtr[4 * (v28 - a2) * v27];
    do
    {
      memset(v43, 255, v29);
      v43 += v29;
      --a2;
    }

    while (a2);
  }

  id v44 = CGDataProviderCreateWithCFData(Mutable);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGImageRef v46 = CGImageCreate(v27, v28, 8uLL, 0x20uLL, v29, DeviceRGB, 1u, v44, 0LL, 0, kCGRenderingIntentDefault);
  CGColorSpaceRelease(DeviceRGB);
  CGDataProviderRelease(v44);
  CFRelease(Mutable);

  return (uint64_t)v46;
}

void sub_1001C( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    if (a11) {
      *a11 = v11;
    }
    objc_end_catch();
    JUMPOUT(0xFFB8LL);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10070( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  a1,  &a9);
  v14[0] = NSLocalizedDescriptionKey;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([@"Unable to create barcode. " stringByAppendingString:v9]);
  v14[1] = NSLocalizedFailureReasonErrorKey;
  v15[0] = v10;
  v15[1] = v9;
  uint64_t v11 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));

  id v12 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.code128",  0LL,  v11));
  objc_exception_throw(v12);
  return sub_10144();
}

uint64_t sub_10144(_BYTE *a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = a4;
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = &stru_1C800;
  }
  unsigned int v83 = 0;
  uint64_t v82 = 0LL;
  if (a3)
  {
    uint64_t v9 = 0LL;
    do
      v8->invoke(v8, v9++, 0LL, 0LL);
    while (a3 != v9);
    unsigned int v83 = v9;
  }

  unint64_t v10 = 10000000000LL;
  if (!a2)
  {
    char v72 = 0;
    goto LABEL_110;
  }

  do
  {
    do
    {
      while (1)
      {
        unint64_t v11 = 0LL;
        while (a1[v11] <= 0x5Fu)
        {
          if (a2 == ++v11)
          {
            unint64_t v11 = a2;
            break;
          }
        }

        unint64_t v12 = 0LL;
        while ((char)a1[v12] >= 32)
        {
          if (a2 == ++v12)
          {
            unint64_t v12 = a2;
            break;
          }
        }

        unint64_t v13 = 0LL;
        while (a1[v13] - 48 <= 9)
        {
          if (a2 == ++v13)
          {
            unint64_t v13 = a2;
            break;
          }
        }

        if (v13 >= 6 && (v13 & 1) == 0)
        {
          uint64_t v17 = v83;
          BYTE1(v82) = (SBYTE1(v82) + 99 * HIDWORD(v82)++) % 103;
          unint64_t v21 = 0x25AA9C926LL;
          unint64_t v22 = 10000000000LL;
          unint64_t v23 = "Code C";
          do
          {
            BOOL v24 = v21 >= v22;
            if (v21 < v22) {
              unint64_t v25 = 0LL;
            }
            else {
              unint64_t v25 = v22;
            }
            v21 -= v25;
            v8->invoke(v8, v17, v24, v23);
            unint64_t v23 = 0LL;
            uint64_t v17 = (v17 + 1);
            BOOL v20 = v22 > 9;
            v22 /= 0xAuLL;
          }

          while (v20);
          goto LABEL_46;
        }

        if (!v12)
        {
          uint64_t v34 = v83;
          BYTE1(v82) = (SBYTE1(v82) + 101 * HIDWORD(v82)++) % 103;
          unint64_t v45 = 0x295ABFCA6LL;
          unint64_t v46 = 10000000000LL;
          id v47 = "Code A";
          do
          {
            BOOL v48 = v45 >= v46;
            if (v45 < v46) {
              unint64_t v49 = 0LL;
            }
            else {
              unint64_t v49 = v46;
            }
            v45 -= v49;
            v8->invoke(v8, v34, v48, v47);
            id v47 = 0LL;
            uint64_t v34 = (v34 + 1);
            BOOL v20 = v46 > 9;
            v46 /= 0xAuLL;
          }

          while (v20);
          goto LABEL_76;
        }

LABEL_104:
        int v70 = (char)*a1++;
        char v71 = v70 - 32;
        if (v70 <= 31) {
          char v53 = -1;
        }
        else {
          char v53 = v71;
        }
LABEL_107:
        sub_109D8(v53, (uint64_t)&v82, (uint64_t)v8);
        if (!--a2) {
          goto LABEL_108;
        }
      }

      if (v82 == 65)
      {
        if (v13 >= 6 && (v13 & 1) == 0)
        {
          uint64_t v17 = v83;
          BYTE1(v82) = (SBYTE1(v82) + 99 * HIDWORD(v82)++) % 103;
          unint64_t v26 = 0x25AA9C926LL;
          unint64_t v27 = 10000000000LL;
          size_t v28 = "Code C";
          do
          {
            BOOL v29 = v26 >= v27;
            if (v26 < v27) {
              unint64_t v30 = 0LL;
            }
            else {
              unint64_t v30 = v27;
            }
            v26 -= v30;
            v8->invoke(v8, v17, v29, v28);
            size_t v28 = 0LL;
            uint64_t v17 = (v17 + 1);
            BOOL v20 = v27 > 9;
            v27 /= 0xAuLL;
          }

          while (v20);
          goto LABEL_46;
        }

        if (v11) {
          goto LABEL_78;
        }
        uint64_t v54 = v83;
        BYTE1(v82) = (SBYTE1(v82) + 100 * HIDWORD(v82)++) % 103;
        unint64_t v65 = 0x25AAB28B6LL;
        unint64_t v66 = 10000000000LL;
        unint64_t v67 = "Code B";
        do
        {
          BOOL v68 = v65 >= v66;
          if (v65 < v66) {
            unint64_t v69 = 0LL;
          }
          else {
            unint64_t v69 = v66;
          }
          v65 -= v69;
          v8->invoke(v8, v54, v68, v67);
          unint64_t v67 = 0LL;
          uint64_t v54 = (v54 + 1);
          BOOL v20 = v66 > 9;
          v66 /= 0xAuLL;
        }

        while (v20);
LABEL_103:
        unsigned int v83 = v54;
        LOBYTE(v82) = 66;
        goto LABEL_104;
      }

      if (!(_BYTE)v82)
      {
        if (v13 >= 2)
        {
          BYTE1(v82) = 105;
          HIDWORD(v82) = 1;
          unint64_t v14 = 0x2903F6FDCLL;
          unint64_t v15 = 10000000000LL;
          uint64_t v16 = "StartC";
          uint64_t v17 = v83;
          do
          {
            BOOL v18 = v14 >= v15;
            if (v14 < v15) {
              unint64_t v19 = 0LL;
            }
            else {
              unint64_t v19 = v15;
            }
            v14 -= v19;
            v8->invoke(v8, v17, v18, v16);
            uint64_t v16 = 0LL;
            uint64_t v17 = (v17 + 1);
            BOOL v20 = v15 > 9;
            v15 /= 0xAuLL;
          }

          while (v20);
LABEL_46:
          unsigned int v83 = v17;
          LOBYTE(v82) = 67;
          break;
        }

        if (v11 > v12)
        {
          BYTE1(v82) = 103;
          HIDWORD(v82) = 1;
          unint64_t v40 = 0x2903F44E4LL;
          unint64_t v41 = 10000000000LL;
          unint64_t v42 = "StartA";
          uint64_t v34 = v83;
          do
          {
            BOOL v43 = v40 >= v41;
            if (v40 < v41) {
              unint64_t v44 = 0LL;
            }
            else {
              unint64_t v44 = v41;
            }
            v40 -= v44;
            v8->invoke(v8, v34, v43, v42);
            unint64_t v42 = 0LL;
            uint64_t v34 = (v34 + 1);
            BOOL v20 = v41 > 9;
            v41 /= 0xAuLL;
          }

          while (v20);
LABEL_76:
          unsigned int v83 = v34;
          LOBYTE(v82) = 65;
LABEL_78:
          unsigned int v50 = *a1++;
          char v51 = v50 - 32;
          char v52 = v50 + 64;
          if (v50 >= 0x32) {
            char v53 = -1;
          }
          else {
            char v53 = v52;
          }
          if ((v51 & 0xC0) == 0) {
            char v53 = v51;
          }
          goto LABEL_107;
        }

        BYTE1(v82) = 104;
        HIDWORD(v82) = 1;
        unint64_t v60 = 11010010000LL;
        unint64_t v61 = 10000000000LL;
        BOOL v62 = "StartB";
        uint64_t v54 = v83;
        do
        {
          BOOL v63 = v60 >= v61;
          if (v60 < v61) {
            unint64_t v64 = 0LL;
          }
          else {
            unint64_t v64 = v61;
          }
          v60 -= v64;
          v8->invoke(v8, v54, v63, v62);
          BOOL v62 = 0LL;
          uint64_t v54 = (v54 + 1);
          BOOL v20 = v61 > 9;
          v61 /= 0xAuLL;
        }

        while (v20);
        goto LABEL_103;
      }

      if (v13 <= 1 && v82 == 67)
      {
        if (v11 > v12)
        {
          BYTE1(v82) = (SBYTE1(v82) + 101 * HIDWORD(v82)++) % 103;
          uint64_t v34 = v83;
          unint64_t v35 = 0x295ABFCA6LL;
          unint64_t v36 = 10000000000LL;
          uint64_t v37 = "Code A";
          do
          {
            BOOL v38 = v35 >= v36;
            if (v35 < v36) {
              unint64_t v39 = 0LL;
            }
            else {
              unint64_t v39 = v36;
            }
            v35 -= v39;
            v8->invoke(v8, v34, v38, v37);
            uint64_t v37 = 0LL;
            uint64_t v34 = (v34 + 1);
            BOOL v20 = v36 > 9;
            v36 /= 0xAuLL;
          }

          while (v20);
          goto LABEL_76;
        }

        BYTE1(v82) = (SBYTE1(v82) + 100 * HIDWORD(v82)++) % 103;
        uint64_t v54 = v83;
        unint64_t v55 = 0x25AAB28B6LL;
        unint64_t v56 = 10000000000LL;
        int v57 = "Code B";
        do
        {
          BOOL v58 = v55 >= v56;
          if (v55 < v56) {
            unint64_t v59 = 0LL;
          }
          else {
            unint64_t v59 = v56;
          }
          v55 -= v59;
          v8->invoke(v8, v54, v58, v57);
          int v57 = 0LL;
          uint64_t v54 = (v54 + 1);
          BOOL v20 = v56 > 9;
          v56 /= 0xAuLL;
        }

        while (v20);
        goto LABEL_103;
      }
    }

    while (v82 != 67);
    char v31 = a1[1];
    char v32 = v31 + 10 * *a1 - 16;
    sub_109D8(v32, (uint64_t)&v82, (uint64_t)v8);
    a1 += 2;
    a2 -= 2LL;
  }

  while (a2);
LABEL_108:
  char v72 = BYTE1(v82);
LABEL_110:
  sub_109D8(v72, (uint64_t)&v82, (uint64_t)v8);
  uint64_t v73 = "Stop";
  unint64_t v74 = 0x28FA85FA2LL;
  uint64_t v75 = v83;
  do
  {
    BOOL v76 = v74 >= v10;
    if (v74 < v10) {
      unint64_t v77 = 0LL;
    }
    else {
      unint64_t v77 = v10;
    }
    v74 -= v77;
    v8->invoke(v8, v75, v76, v73);
    uint64_t v73 = 0LL;
    uint64_t v75 = (v75 + 1);
    BOOL v20 = v10 > 9;
    v10 /= 0xAuLL;
  }

  while (v20);
  unsigned int v83 = v75;
  invoke = (void (*)(void))v8->invoke;
  uint64_t v79 = v8;
  invoke();
  v8->invoke(v79, (v75 + 1), 1LL, 0LL);

  uint64_t v80 = (v75 + 2);
  unsigned int v83 = v80;
  if (a3)
  {
    do
    {
      v8->invoke(v79, v80, 0LL, 0LL);
      uint64_t v80 = (v80 + 1);
      --a3;
    }

    while (a3);
    unsigned int v83 = v80;
  }

  return v80;
}

uint64_t sub_10998(uint64_t result, int a2, char a3)
{
  uint64_t v3 = 4LL * a2;
  *(_BYTE *)(*(void *)(result + 32) + (int)v3 + 2LL) = a3 - 1;
  *(_BYTE *)(*(void *)(result + 32) + v3 + 1) = a3 - 1;
  *(_BYTE *)(*(void *)(result + 32) + v3) = a3 - 1;
  *(_BYTE *)(*(void *)(result + 32) + (int)v3 + 3LL) = -1;
  return result;
}

uint64_t sub_109D8(int a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = qword_1A080[a1];
  if ((a1 - 103) > 2)
  {
    int v7 = *(_DWORD *)(a2 + 4);
    *(_BYTE *)(a2 + 1) = (*(char *)(a2 + 1) + v7 * a1) % 103;
    int v6 = v7 + 1;
  }

  else
  {
    *(_BYTE *)(a2 + 1) = a1;
    int v6 = 1;
  }

  *(_DWORD *)(a2 + 4) = v6;
  uint64_t v8 = *(unsigned int *)(a2 + 8);
  unint64_t v9 = 10000000000LL;
  do
  {
    BOOL v10 = v5 >= v9;
    if (v5 < v9) {
      unint64_t v11 = 0LL;
    }
    else {
      unint64_t v11 = v9;
    }
    v5 -= v11;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, BOOL))(a3 + 16))(a3, v8, v10);
    uint64_t v8 = (*(_DWORD *)(a2 + 8) + 1);
    *(_DWORD *)(a2 + 8) = v8;
    BOOL v13 = v9 >= 0xA;
    v9 /= 0xAuLL;
  }

  while (v13);
  return result;
}

void sub_10AC0()
{
}

void sub_10AE8()
{
}

void sub_10B14(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_60A0();
  sub_608C(&dword_0, v2, v3, "%{public}s %{public}@", v4, v5, v6, v7, 2u);

  sub_60B4();
}

void sub_10B98(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 localizedDescription]);
  sub_60A0();
  sub_608C(&dword_0, v2, v3, "%{public}s %{public}@", v4, v5, v6, v7, 2u);

  sub_60B4();
}

void sub_10C1C()
{
}

void sub_10C48(void *a1)
{
  id v2 = v1;
  sub_608C( &dword_0,  v3,  v4,  "%{public}s Unsupported value for key inputBarcodeDescriptor of class %{public}@",  v5,  v6,  v7,  v8,  2u);

  sub_60B4();
}

void sub_10CD0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "QRCode Generator: versionForNumber version number is not between 0 and 40\n",  v1,  2u);
}

void sub_10D10()
{
}

void sub_10D38()
{
}

void sub_10D64()
{
}

void sub_10D90()
{
}

void sub_10DBC()
{
}

void sub_10DE8()
{
}

void sub_10E14()
{
}

void sub_10E40()
{
}

void sub_10E6C()
{
}

void sub_10E98( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10F08( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10F78( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10FE8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11058( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_110C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11138(unsigned int *a1, int a2, os_log_s *a3)
{
  int v4 = 136446722;
  uint64_t v5 = "embedDataBits";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  unsigned int v9 = sub_DA54(a1);
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "%{public}s not all bits consumed: %i / %i",  (uint8_t *)&v4,  0x18u);
  sub_60B4();
}

void sub_111D4(unsigned int *a1)
{
}

void sub_11248(unsigned int *a1)
{
}

void sub_112BC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1132C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1139C(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "embedPositionAdjustmentPattern";
  sub_DA2C(&dword_0, a3, (uint64_t)a3, "%{public}s the matrix element should be empty", a1);
}

void sub_113E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11450( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_114C0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11530( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_115A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11610( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11680( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_116F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11760( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_117D0(uint8_t *a1, void *a2, os_log_s *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "appendKanjiBytes";
  sub_DA2C(&dword_0, a3, (uint64_t)a3, "%{public}s invalid byte sequence", a1);
}

void sub_11814( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11884( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_118F4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_11964()
{
}

void sub_11990()
{
}

void sub_119BC()
{
}

void sub_119E8()
{
}

void sub_11A14()
{
}

void sub_11A40()
{
}

void sub_11A6C()
{
}

void sub_11A98()
{
}

id objc_msgSend_volatileDomainForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volatileDomainForName:");
}