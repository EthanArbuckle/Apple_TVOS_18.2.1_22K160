uint64_t isRunningInRecovery()
{
  return 0LL;
}

uint64_t isRunningInRootLaunchdContext()
{
  return 0LL;
}

uint64_t isRunningInDiagnosticsMode()
{
  if (qword_100020ED8 != -1) {
    dispatch_once(&qword_100020ED8, &stru_10001C2D8);
  }
  return byte_100020ED0;
}

void sub_100002354(id a1)
{
  id v3 = (id)MGCopyAnswer(@"3kmXfug8VcxLI5yEmsqQKw", 0LL);
  id v1 = isNSNumber(v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);

  if (v2) {
    byte_100020ED0 = [v3 BOOLValue];
  }
}

id isNSNumber(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id isNSDictionary(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id isNSString(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

id isNSData(void *a1)
{
  id v1 = a1;
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    id v3 = v1;
  }
  else {
    id v3 = 0LL;
  }

  return v3;
}

NSString *copy_current_process_name()
{
  return sub_100002518(0);
}

NSString *sub_100002518(int a1)
{
  if (a1
    && (uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"))) != 0LL)
  {
    id v3 = v2;
    pid_t v4 = [v2 processIdentifier];
  }

  else
  {
    pid_t v4 = getpid();
  }

  proc_pidpath(v4, buffer, 0x1000u);
  int v5 = strlen(buffer);
  if ((v5 & 0x80000000) == 0)
  {
    while (buffer[v5] != 47)
    {
      if (v5-- <= 0)
      {
        int v5 = -1;
        break;
      }
    }
  }

  __strlcpy_chk(v8, &buffer[v5 + 1], 256LL, 256LL);
  return -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s", v8);
}

NSString *copy_calling_process_name()
{
  return sub_100002518(1);
}

void sub_100002E40( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_100002E54(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

  ;
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = (void *)objc_opt_new(&OBJC_CLASS___ServiceDelegate, argv, envp);
  pid_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id _PVAppIdentityLogSystem()
{
  if (qword_100020EE8 != -1) {
    dispatch_once(&qword_100020EE8, &stru_10001C2F8);
  }
  return (id)qword_100020EE0;
}

void sub_100003958(id a1)
{
  os_log_t v1 = os_log_create("com.apple.devicecheck", "pvappidentity");
  uint64_t v2 = (void *)qword_100020EE0;
  qword_100020EE0 = (uint64_t)v1;
}

uint64_t sub_100003988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(a3 + 12);
  if (v4 == 2 || v4 == 6) {
    __asm { BR              X8 }
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = -10303;
  return 0LL;
}

void xee5e7faa36a65314baf6b75e94190411(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1000049B8@<X0>(uint64_t (*a1)(void)@<X8>)
{
  int v15 = v1 - 66;
  *(_DWORD *)(v2 - 76) = a1(*(void *)(v2 - 64));
  id v3 = *(uint64_t (**)(void))(v2 - 160);
  *(_DWORD *)(v2 - 52) = *(_DWORD *)(v2 - 76);
  uint64_t v4 = v3(*(void *)(v2 - 128));
  *(void *)(v2 - 112) = v4;
  uint64_t v5 = ((uint64_t (*)(void, void))((char *)*(&off_10001CFD0 + v15 - 29) - 3))( 0LL,  (int)(*(_DWORD *)(v2 - 52) - 422182894 + (v4 ^ (v15 + 422182841)) + ((2 * v4) & 0x3253FFDC)));
  uint64_t v6 = *(void *)(v2 - 152);
  *(void *)(v2 - 104) = v5;
  *(void *)(v2 - 72) = 0LL;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 + 8LL * (v15 ^ (267 * (v5 != 0)))) - 4LL))( v5,  v7,  v8,  v9,  v10,  v11,  v12,  v13);
}

void sub_100004B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = (qword_100020E98 - qword_100020EC0) ^ (unint64_t)&v7;
  qword_100020EC0 = 186136019 * (v4 + 0x1D53B40810D0C259LL);
  qword_100020E98 = 186136019 * (v4 ^ 0x1D53B40810D0C259LL);
  unint64_t v5 = atomic_load((unint64_t *)(a3 + 40));
  uint64_t v6 = (char *)*(&off_10001C3C0
               + ((12
                 * (((uint64_t (*)(unint64_t, uint64_t))((char *)*(&off_10001CFD0
                                                                                 + (byte_10001B1C0[byte_10001B0C0[(-45 * ((qword_100020E98 - qword_100020EC0) ^ 0x59))] ^ 0xD4] ^ (-45 * ((qword_100020E98 - qword_100020EC0) ^ 0x59)))
                                                                                 + 8)
                                                                       - 2))( v5,  a1) == 0)) ^ 0xA3))
     - 8;
  __asm { BR              X8 }

uint64_t sub_100004CF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, int a24, int a25, uint64_t a26, uint64_t a27)
{
  a26 = *(void *)(a23 + 8LL * a25) + (a25 ^ 0xAAu) - 171LL;
  a27 = a17;
  *(_DWORD *)(v27 - 48) = a25
                        - 667133509
                        - 1546437751 * ((2 * ((v27 - 48) & 0x253B5AB4) - 624646837 - (v27 - 48)) ^ 0xED6F4D67);
  *(void *)(v27 - 40) = &a26;
  uint64_t v28 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + a25 + 27) - 11))();
  return (*(uint64_t (**)(uint64_t))(a23 + 8LL * ((18 * ((*(_BYTE *)(v27 - 44) ^ 1) & 1)) ^ 0x14E)))(v28);
}

uint64_t sub_100004E18( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, uint64_t a18, uint64_t a19, int a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  *(_DWORD *)(v24 - 48) = (a17 - 75) ^ (95750717 * ((-1 - (a20 | (v24 - 48)) + (a20 & (v24 - 48))) ^ 0xB1B14760));
  *(void *)(v24 - 40) = a19;
  xa3e62229cd6a3d85bebf231389c30c9a((_DWORD *)(v24 - 48));
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a24
                                                                                          + 8LL
                                                                                          * (((((*(void *)(v24 - 32) == 0LL) ^ (a17 + 99) ^ 1) & 1)
                                                                                            * (((a17 - 136646916) & 0x5FB79E7B)
                                                                                             - 1469222310)) ^ a17))
                                                                              - 8LL))( v25,  v26,  v27,  v28,  v29);
}

uint64_t sub_100004EFC()
{
  uint64_t v1 = v7;
  uint64_t v2 = v9;
  uint64_t v3 = v11;
  int v4 = v8;
  unint64_t v5 = atomic_load(v10);
  *(void *)(v0 - 152) = *(void *)(v3 + 8LL * v4);
  *(void *)(v0 - 144) = v5;
  *(void *)(v0 - 136) = v2;
  *(void *)(v0 - 128) = v1;
  *(_DWORD *)(v0 - 48) = v4
                       - 1692319399
                       + 446615023 * ((-2 - ((v0 - 48) | 0xE968A332) - (~(v0 - 48) | 0x16975CCD)) ^ 0x45B91BF2);
  *(void *)(v0 - 40) = v0 - 152;
  return ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + v4 + 71) - 6))();
}

void x52893f79468304822a282e82e93bfbcf(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 + 900777529 * ((-1 - (a1 | 0x6367F922) + (a1 & 0x6367F922)) ^ 0xEA4A0B94);
  uint64_t v123 = *(void *)(a1 + 8);
  int v124 = v1 + 2094106950;
  uint64_t v255 = v123;
  unsigned int v254 = (v1 - 1312390722) ^ (95750717
                            * ((&vars0 + 1070273037 - 2 * ((&vars0 - 80) & 0x3FCB125D)) ^ 0xC011A1B2));
  xa3e62229cd6a3d85bebf231389c30c9a(&v254);
  uint64_t v125 = 0LL;
  if (!v256) {
    goto LABEL_45;
  }
  uint64_t v118 = ((uint64_t (*)(uint64_t))((char *)*(&off_10001CFD0 + (int)(v124 ^ 0xCB0B07A9)) - 2))(v123);
  int v120 = (v124 + 905281321) | 0x67328D0;
  int v121 = 0;
  uint64_t v125 = 0LL;
  if (!v118) {
    goto LABEL_45;
  }
  do
  {
    v191[(unsigned __int16)(67 * v121) % 0x44u] = 0;
    *(_DWORD *)&v126[4 * ((unsigned __int16)(35 * v121) % 0x8Au) + 64] = 0;
    int v42 = v120 - 1022940345;
  }

  while ((v121 & 0xC0) == 0);
  unsigned int v29 = (v119 ^ 0x9289EC11) & (2 * (v119 & 0x982DED51)) ^ v119 & 0x982DED51;
  unsigned int v30 = ((2 * (v119 ^ 0x929A3C11)) ^ ((v42 ^ 0x2848D62E) + 859673970)) & (v119 ^ 0x929A3C11) ^ (2 * (v119 ^ 0x929A3C11)) & 0xAB7D140;
  int v31 = v29 ^ (v30 ^ 0x278000) & (4 * v29) ^ 0xAB7D140;
  int v32 = ((4 * (v30 ^ 0xA905140)) ^ 0x2ADF4500) & (v30 ^ 0xA905140) ^ (4 * (v30 ^ 0xA905140)) & 0xAB7D140;
  unsigned int v33 = v31 ^ (v32 ^ 0xA974100) & ((16 * v31) ^ 0x79A81090) ^ v32 & 0xD2D50490;
  unsigned int v34 = ((16 * v32) ^ 0x7BA11490) & (v32 ^ 0xA974100) ^ v32 & 0xD2D50490;
  unsigned int v35 = v33 ^ ((v33 << 8) ^ 0xF0044490) & (v34 ^ 0x2950040) ^ v34 & 0xD2D50490;
  unsigned int v36 = ((v34 << 8) ^ 0x47D50490) & (v34 ^ 0x2950040) ^ v34 & 0xD2D50490;
  unsigned int v48 = v42 ^ 0x2848D62E;
  int v49 = -1306255046;
  unsigned int v50 = (16
       * (v36 & 0x2D50490 ^ ((v35 << 16) ^ 0x3950492) & (v36 ^ 0x8220000) ^ ((v35 << 16) ^ 0x3950492) & 0xAB70000 ^ v35)) ^ (8 * v119) ^ 0x43427E88;
  int v51 = -1062240790;
  unsigned int v52 = 0;
  unint64_t v53 = 0xC530979C2EFBCDEDLL;
  unint64_t v54 = 0x955742DFEAA12A70LL;
  unint64_t v55 = 0xA5C0AD593675CE62LL;
  int v56 = 0;
  int v57 = v119;
LABEL_37:
  unsigned int v38 = (v48 + 685181938) | 0xC40404D4;
  unsigned int v83 = v48 + 738514421;
  unsigned int v84 = v52;
  unsigned __int8 v85 = 0;
  if (v57 + (v38 ^ 0x5720F0C5) < v48 + 500036274)
  {
    do
    {
      unsigned int v82 = v84 + 1;
      v191[(unsigned __int16)(67 * v85++) % 0x44u] = *(_BYTE *)(v118 + v84++);
    }

    while ((v85 & 0xC0) == (v83 ^ 0xE36E303));
    unsigned int v113 = v83 ^ 0x400F9D99;
    unsigned int v114 = v50;
    unsigned int v115 = v82;
    int v116 = v56;
    int v117 = v57 - 64;
    goto LABEL_25;
  }

  int v41 = v38 ^ 0x3CF3149B;
  if (v57 + ((v38 + 273469363) & 0x70FEB2FD) - 1523884379 == (v38 ^ 0x925B0C0D))
  {
    v191[(67 * v57 + 51) % ((((((v48 - 14) | 0xD4) - 77) & 0xFD) + 21) ^ 0xDE)] = 0x80;
    int v109 = ((v38 + 273469363) & 0x70FEB2FD) - 35594731;
    unsigned int v110 = v52;
LABEL_9:
    int v111 = v57;
    do
    {
      v191[(67 * (v111 + 1) - 737862605) % 0x44u] = 0;
      BOOL v3 = v111 - 1741820653 < ((v109 + 1336302468) & 0xFBBFF5EF ^ 0x66602FCE);
      unsigned int v112 = (v109 + 1336302468) & 0xFBBFF5EF;
      ++v111;
    }

    while (!v3);
    unsigned int v2 = (v112 + 241180608) & 0xFA2F58BF;
    unsigned int v113 = (v112 + 891138001) & 0x7F7BFEBA;
    unsigned int v114 = v50;
    unsigned int v115 = v110;
    int v116 = 2;
    int v117 = v57;
    if (v57 + (v2 ^ 0x3A02A5DF) < (v113 ^ 0x4E397EA2))
    {
      char v192 = v50;
      LOBYTE(v193) = v50 >> ((((((v109 - 124) & 0xEF) - 64) & 0xBF) + 77) & 0xBE ^ 0x92);
      HIBYTE(v193) = BYTE2(v50);
      char v194 = (HIWORD(v50) >> (BYTE2(v50) & 8)) >> (BYTE2(v50) & 8 ^ 8);
      unsigned int v113 = (v2 - 573688243) & 0xCE3BFFBE;
      unsigned int v114 = (HIWORD(v50) >> (BYTE2(v50) & 8)) >> (BYTE2(v50) & 8 ^ 8);
      unsigned int v115 = v110;
      int v116 = 1;
      int v117 = v57;
    }

    goto LABEL_25;
  }

  unsigned int v39 = v57 + v41 - 1540365311;
  if (v39 >= 0xA2A9EE26) {
    unsigned int v39 = -1565921754;
  }
  int v105 = 0;
  unsigned int v106 = v52;
  do
  {
    unsigned int v108 = v106 + 1;
    v191[67 * v105 % 0x44u] = *(_BYTE *)(v118 + v106);
    int v107 = (v41 + 210132564) | 0x4191818;
    v105 += v107 - 77430714;
    ++v106;
  }

  while (v105 != v39 + 1);
  v191[(67 * v57 + (v107 ^ 0x4AA40121u) - 2050253415) % 0x44] = 0x80;
  int v109 = v107 ^ 0x4AA40121;
  unsigned int v110 = v108;
  unsigned int v113 = (v107 - 912097505) & 0x7FF97FBF;
  unsigned int v114 = v50;
  unsigned int v115 = v108;
  int v116 = 2;
  int v117 = v57;
  if (v57 - 1741820654 >= v113 - 1312390874) {
    goto LABEL_9;
  }
LABEL_25:
  int v74 = v113 + 20650256;
  int v75 = v49;
  unsigned int v76 = v114;
  int v77 = v51;
  unint64_t v78 = v53;
  unint64_t v79 = v54;
  unint64_t v80 = v55;
  int v81 = v116;
  while (1)
  {
    int v86 = HIDWORD(v80);
    int v89 = v80;
    unint64_t v87 = v79;
    int v90 = HIDWORD(v78);
    int v88 = v77;
    unsigned int v46 = v76;
    int v43 = 0;
    do
    {
      *(_DWORD *)&v126[4 * (v43 * (v74 - 1333041031) % 0x8Au) + 64] = (((v191[(268 * v43 + 67) % 0x44u] << 8) | (v191[268 * v43 % 0x44u] << 16) | v191[(268 * v43 + 134) % 0x44u]) << ((4 * v43) & 8) << ((4 * v43) & 8 ^ 8)) ^ v191[(268 * v43 + 201) % 0x44u];
      BOOL v37 = v43 == 15;
      int v104 = 2079948095;
      ++v43;
    }

    while (!v37);
    while (1)
    {
      int v4 = 35 * v104;
      unsigned int v5 = 35 * v104 + ((v74 - 2028374100) ^ 0xDA6DED1B);
      unsigned int v6 = 35 * (v104 - 2079948094);
      unsigned int v7 = v6 % 0x114;
      BOOL v8 = v6 % 0x114 < 0x8A;
      unsigned int v9 = v6 % 0x8A;
      unsigned int v10 = v5 % ((v74 + 987319779) ^ 0x8A4DE499);
      if (!v8) {
        v7 -= 138;
      }
      unsigned int v11 = *(_DWORD *)&v126[4 * v9 + 64];
      unsigned int v12 = (*(_DWORD *)&v126[4 * v7 + 64] >> 18) | (v11 << 14);
      int v13 = (v11 >> 7) | (v11 << 25);
      unsigned int v14 = *(_DWORD *)&v126[4 * (v5 % 0x8A) + 64];
      if (v10 >= 0x8A) {
        v10 -= 138;
      }
      unsigned int v15 = (v11 << 22) & 0xFE000000 | (v11 >> 10);
      int v16 = (v11 & 0x80000) != 0 ? -512 : 512;
      unsigned int v17 = ((v12 >> 7) | (v12 << 25)) ^ (v15 + v16) ^ 0x714E40C1;
      unsigned int v18 = (v4 + 216261022) % 0x8Au;
      unsigned int v19 = (v4 + 216260707) % 0x8Au;
      unsigned int v20 = (v13 ^ (v17 >> 25) ^ (((((v17 << 7) ^ 0x58DE9F47) - 1490984775) ^ (-128 * v17) ^ (v17 << 7)) - 1490984776))
          + ((*(_DWORD *)&v126[4 * ((((2 * (v4 + 216261162)) & 0x46) + ((v4 + 216261162) ^ 0x23u)) % 0x8A) + 64] >> ((v104 - 62) & 0xA) >> ((v104 - 62) & 0xA ^ 0xA)) ^ ((v14 >> 17) | (*(_DWORD *)&v126[4 * v10 + 64] << 15)) ^ (((((2 * (v14 - 525514482)) & 0x3EA56DE4) + ((v14 - 525514482) ^ 0x1F52B6F0)) >> 19) | (v14 << 13)));
      v21 = (unsigned int *)&v126[4 * ((v4 + 216261267) % 0x8Au) + 64];
      unsigned int *v21 = v20;
      unsigned int v22 = v20 + *(_DWORD *)&v126[4 * v18 + 64];
      unsigned int *v21 = v22;
      unsigned int *v21 = v22 + *(_DWORD *)&v126[4 * v19 + 64];
      int v104 = ((v74 - 1468112204) & (2 * (v104 - 2079948078))) + ((v104 - 2079948078) ^ 0x7BF97D2F);
    }

    int v91 = v79 + 887271227;
    int v162 = -1659577931;
    int v159 = -1922208696;
    int v92 = v77 + 2076145032;
    int v143 = 1589663567;
    int v127 = 99353436;
    int v166 = -237127426;
    int v177 = 1080536437;
    int v128 = -950892916;
    int v130 = -573433557;
    int v178 = -1206768034;
    int v129 = 1900193146;
    int v144 = 1435298322;
    int v131 = 1078118787;
    int v176 = -1368020389;
    int v179 = 737658237;
    int v160 = 1982282152;
    int v133 = -611342466;
    int v161 = 783909560;
    int v147 = 13734264;
    int v94 = HIDWORD(v78) - 1948402973;
    int v181 = -868659329;
    int v163 = 200568637;
    int v150 = -485084246;
    int v164 = 1722461281;
    int v145 = -197275057;
    int v167 = 1246841071;
    int v180 = 2028392851;
    int v148 = 1243567142;
    int v146 = -1896577749;
    int v155 = 903538893;
    int v151 = 1139618364;
    int v183 = 1768068531;
    int v149 = -1267435255;
    int v134 = 811553054;
    int v165 = -999821788;
    int v182 = 587238152;
    int v135 = 1869493450;
    int v152 = -2126472437;
    int v168 = -1834995086;
    int v184 = -1644629787;
    int v132 = -1825591151;
    int v136 = -1364700100;
    int v186 = 272915772;
    int v175 = -772332666;
    int v154 = -305590320;
    int v185 = -561925337;
    int v139 = 1357309036;
    int v187 = 1132371715;
    int v169 = -1001353726;
    int v137 = -475891366;
    int v156 = 1431450730;
    int v170 = -221303333;
    int v153 = -1091170216;
    int v142 = -492330839;
    int v138 = 748734503;
    int v140 = -2073782358;
    int v158 = -1393219663;
    int v172 = 1796133377;
    int v171 = 980259775;
    int v188 = 2010313222;
    int v141 = -1459803713;
    int v174 = -1064921950;
    int v173 = -1797551322;
    int v189 = -1593925685;
    int v157 = -1866093915;
    int v190 = -617624658;
    unsigned int v95 = HIDWORD(v78) - 1948402973;
    int v96 = HIDWORD(v79) - 964064710;
    int v97 = v78 + 1985226573;
    int v98 = v77 + 2076145032;
    unsigned int v99 = v75 - 1209678547;
    int v100 = HIDWORD(v80) - 180045005;
    int v101 = v79 + 887271227;
    int v102 = 0;
    int v103 = v80 + ((v74 + 2081036450) ^ 0x4F8F506F);
    do
    {
      int v23 = v100;
      unsigned int v24 = v99;
      unsigned int v25 = v95;
      int v65 = v103;
      int v66 = v101;
      int v67 = v100;
      unsigned int v68 = v99;
      int v69 = v98;
      unsigned int v70 = v95;
      int v26 = *(_DWORD *)&v126[4 * ((unsigned __int16)(35 * v102 + 2380) % 0x8Au) + 64] - 473311159;
      int v27 = *(_DWORD *)&v126[4 * ((unsigned __int16)(35 * v102) % 0x8Au) + 64]
          + (((v95 >> 11) | (v95 << 21)) ^ ((v95 >> 6) | (v95 << 26)) ^ ((v95 >> 25) | (v95 << 7)))
          + (v26 ^ (((v101 ^ v100) & v95 ^ v101) + v96))
          + 2 * ((((v101 ^ v100) & v95 ^ v101) + v96) & v26);
      unsigned int v71 = (((v99 >> 22) | (v99 << 10)) ^ (v99 >> 13) ^ (((((v99 >> 2) | (v99 << 30))
                                                          - (((v99 >> 2) | (v99 << 30)) ^ (v99 << 19))) ^ (((v74 - 1450486699) & 0xDF587FDE ^ 0xD8586BDE) - (v99 << 19)) ^ (v99 << 19))
                                                        + ((v99 >> 2) | (v99 << 30))))
          + ((v103 ^ v98) & v99 ^ v103 & v98)
          + v27;
      unsigned int v28 = v27 + v97;
      int v72 = v27 + v97;
      LOBYTE(v27) = v102 != 63;
      unsigned int v95 = v28;
      int v96 = v101;
      int v97 = v98;
      int v98 = v103;
      unsigned int v99 = v71;
      int v100 = v25;
      int v101 = v23;
      ++v102;
      int v103 = v24;
      unsigned int v73 = (v74 - 1450486699) & 0xDF587FDE;
    }

    while ((v27 & 1) != 0);
    unsigned int v58 = v70 + HIDWORD(v80);
    int v59 = v66 + HIDWORD(v79);
    int v93 = v75 - 1209678547;
    int v60 = (v71 ^ v93) + 2 * (v71 & v93);
    int v61 = ((((v73 + 937462053) | 0xC4000060) ^ 0x38008A17) & (2 * (v80 + ((v73 + 1300571298) ^ 0x2C3E50C6) + v68)))
        + ((v80 + ((v73 + 1300571298) ^ 0x2C3E50C6) + v68) ^ 0xF61C3FBA);
    int v62 = ((2 * (v69 + v78)) & 0xBB280ADC) + ((v69 + v78) ^ 0xDD94056E);
    unsigned int v63 = v73 + 1300571298;
    unsigned int v64 = (v73 + 937462053) | 0xC4000060;
    int v47 = v63 ^ 0x27BC5C9B;
    unsigned int v48 = v63 ^ 0xC7EF9D8E;
    int v49 = v60 + 1209678547;
    unsigned int v50 = v76;
    int v51 = v65 + v77;
    unsigned int v52 = v115;
    LODWORD(v53) = v62 + (v63 ^ 0xC7EF9D8E) + 1077538180;
    HIDWORD(v53) = v72 + HIDWORD(v78);
    LODWORD(v54) = v67 + v79;
    HIDWORD(v54) = v66 + HIDWORD(v79);
    LODWORD(v55) = ((((v73 + 937462053) | 0xC4000060) ^ 0x38008A17) & (2
                                                                     * (v80 + ((v73 + 1300571298) ^ 0x2C3E50C6) + v68)))
                 + ((v80 + ((v73 + 1300571298) ^ 0x2C3E50C6) + v68) ^ 0xF61C3FBA);
    HIDWORD(v55) = v70 + HIDWORD(v80);
    int v56 = v81;
    int v57 = v117;
    char v192 = v76;
    char v194 = v76 >> (((v47 - 25) | 0xD) ^ 0x17);
    __int16 v193 = v76 >> 8;
    int v44 = (v47 + 228603367) | 0x4401600D;
    unsigned __int8 v45 = 0;
    do
    {
      v191[(unsigned __int16)(67 * v45) % 0x44u] = 0;
      int v74 = v44 ^ 0x1B77F5A5;
      int v75 = v60 + 1209678547;
      unsigned int v76 = v46 >> (((v47 - 25) | 0xD) ^ 0x17);
      int v77 = v65 + v88;
      LODWORD(v78) = v62 + (v63 ^ 0xC7EF9D8E) + 1077538180;
      HIDWORD(v78) = v72 + v90;
      LODWORD(v79) = v67 + v87;
      HIDWORD(v79) = v66 + HIDWORD(v87);
      LODWORD(v80) = ((((v73 + 937462053) | 0xC4000060) ^ 0x38008A17) & (2
                                                                       * (v89 + ((v73 + 1300571298) ^ 0x2C3E50C6) + v68)))
                   + ((v89 + ((v73 + 1300571298) ^ 0x2C3E50C6) + v68) ^ 0xF61C3FBA);
      HIDWORD(v80) = v70 + v86;
      int v81 = 1;
      ++v45;
    }

    while ((v45 & 0xFCu) < (v44 ^ 0x1B77F5A5u) - 1333041006);
  }

  v191[0] = 0;
  char v246 = 0;
  char v252 = 0;
  char v251 = 0;
  char v238 = 0;
  char v248 = 0;
  char v235 = 0;
  char v253 = 0;
  char v237 = 0;
  char v245 = 0;
  char v249 = 0;
  char v250 = 0;
  char v231 = 0;
  char v230 = 0;
  char v241 = 0;
  char v222 = 0;
  char v244 = 0;
  char v229 = 0;
  char v247 = 0;
  char v234 = 0;
  char v240 = 0;
  char v224 = 0;
  char v223 = 0;
  char v225 = 0;
  char v239 = 0;
  char v233 = 0;
  char v205 = 0;
  char v220 = 0;
  char v242 = 0;
  char v232 = 0;
  char v243 = 0;
  char v217 = 0;
  char v201 = 0;
  char v195 = 0;
  char v210 = 0;
  char v228 = 0;
  char v208 = 0;
  char v219 = 0;
  char v236 = 0;
  char v215 = 0;
  char v226 = 0;
  char v216 = 0;
  char v218 = 0;
  char v211 = 0;
  char v200 = 0;
  char v227 = 0;
  char v197 = 0;
  char v221 = 0;
  char v203 = 0;
  char v199 = 0;
  char v212 = 0;
  char v204 = 0;
  char v213 = 0;
  char v214 = 0;
  char v194 = 0;
  char v209 = 0;
  char v202 = 0;
  __int16 v193 = 0;
  char v207 = 0;
  char v206 = 0;
  char v198 = 0;
  char v196 = 0;
  char v192 = 0;
  v126[7] = ((((((v74 + 85) & 0xDE) + 37) | 0x60) ^ 0x17) & (2 * (v80 + ((((v74 + 85) & 0xDE) - 94) ^ 0xC6) + v68)))
          + ((v80 + ((((v74 + 85) & 0xDE) - 94) ^ 0xC6) + v68) ^ 0xBA)
          + 35;
  v126[2] = (unsigned __int16)((v71 ^ v93) + 2 * (v71 & v93)) >> 8;
  v126[4] = (v61 - 2064523229) >> 24;
  v126[0] = ((v71 ^ v93) + 2 * (v71 & v93)) >> 24;
  v126[3] = (v71 ^ (v75 + 45)) + 2 * (v71 & (v75 + 45));
  v126[5] = (v61 - 2064523229) >> 16;
  v126[1] = ((v71 ^ v93) + 2 * (v71 & v93)) >> 16;
  v126[6] = (v61 - 2064523229) >> ((v64 ^ 0xF9) + 110);
  v126[9] = (v65 + v92) >> 16;
  v126[12] = (v62 - 1732238881) >> 24;
  v126[15] = v62 - 33;
  v126[11] = v65 + v77 - 120;
  unsigned int v40 = (2 * v58) & 0xB4C13272;
  v126[19] = v72 + v94;
  v126[16] = (v72 + v94) >> 24;
  v126[13] = (v62 - 1732238881) >> 16;
  v126[8] = (v65 + v92) >> 24;
  v126[10] = (unsigned __int16)(v65 + v92) >> 8;
  v126[14] = (unsigned __int16)(v62 + 8671) >> 8;
  v126[18] = (unsigned __int16)(v72 + v94) >> 8;
  v126[17] = (v72 + v94) >> 16;
  v126[27] = v67 + v91;
  v126[20] = ((v58 ^ 0x5A609939) - 1696325126 + v40) >> 24;
  v126[23] = (v58 ^ 0x39) - 6 + ((2 * v58) & 0x72);
  v126[28] = (v59 - 964064710) >> 24;
  v126[22] = (unsigned __int16)((v58 ^ 0x9939) + 8698 + ((2 * v58) & 0x3272)) >> 8;
  v126[21] = ((v58 ^ 0x5A609939) - 1696325126 + v40) >> 16;
  v126[25] = (v67 + v91) >> 16;
  v126[26] = (unsigned __int16)(v67 + v79 - 20677) >> 8;
  v126[30] = (unsigned __int16)(v59 - 30150) >> 8;
  v126[31] = v59 + 58;
  v126[29] = (v59 - 964064710) >> 16;
  v126[24] = (v67 + v91) >> 24;
  uint64_t v125 = ((uint64_t (*)(void, _BYTE *, uint64_t))((char *)*(&off_10001CFD0
                                                                     + (int)(((v64 ^ 0x9A018BF9) - 796739915) ^ 0x1EBC3577))
                                                           - 3))( *(void *)((char *)*(&off_10001CFD0 + (int)((v64 ^ 0x9A018BF9) - 1312390704)) - 7),  v126,  32LL);
LABEL_45:
  *(void *)(a1 + 16) = v125;
}

void x2f89307483b89521bf32e7ee98bca291(uint64_t a1)
{
  __asm { BR              X8 }

void x6a68056290ffba46d25b5721cbadc21a(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_100008354( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, int a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, int a32, int a33, int a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, void (*a41)(void), uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,int a55,int a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(_DWORD *)(a48 - 0x7D8CA0564D0F498LL) = 0;
  a66 = *(void *)(a42 + 8LL * (a18 + 12));
  a73 = a47;
  a74 = a52;
  a75 = a56;
  a76 = 55057463;
  LODWORD(STACK[0x200]) = 1159262021;
  *(void *)(v76 - 56) = &a66;
  *(_DWORD *)(v76 - 64) = a18 - 1692319412 + 446615023 * ((-1 - (a32 | (v76 - 64)) + (a32 & (v76 - 64))) ^ 0xFD0E84E6);
  a41();
  a66 = *(void *)(a42 + 8LL * a18);
  a73 = a47;
  *(void *)(v76 - 56) = &a66;
  *(_DWORD *)(v76 - 64) = a18
                        - 1692319412
                        + 446615023 * ((v76 - 64 + (a34 & ~(v76 - 64)) - (a34 & (v76 - 64))) ^ 0x8879F3BC);
  uint64_t v77 = ((uint64_t (*)(void))a41)();
  return ((uint64_t (*)(uint64_t))(*(void *)(a42
                                                      + 8LL
                                                      * (a18 ^ 0x4E ^ ((a49 - 0x1D5DE2A9244C9DF0LL != a35)
                                                                     * (((a18 - 485521716) & 0x1CF0797D)
                                                                      + 24 * (a18 ^ 0x17)
                                                                      + 51))))
                                          - 8LL))(v77);
}

void PVAppIdentityCore_GenerateDigests( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  uint64_t v7 = qword_100020E98 - qword_100020EC8 - (void)&v21;
  qword_100020EC8 = (186136019 * v7) ^ 0x1D53B40810D0C259LL;
  qword_100020E98 = 186136019 * (v7 ^ 0x1D53B40810D0C259LL);
  uint64_t v13 = 0LL;
  v12[0] = 0LL;
  uint64_t v14 = 0LL;
  v12[1] = 0LL;
  LODWORD(v22) = 1312390810
               - 900777529
               * ((((unint64_t)&v22 | 0xBF8FEF9A3B26EE5ALL)
  uint64_t v23 = a2;
  ((void (*)(void))((char *)*(&off_10001CFD0
                            + (byte_10001AFC0[byte_10001AEC0[(-45
                                                                                              * ((qword_100020E98
                                                                                                + qword_100020EC8) ^ 0x59))] ^ 0x80] ^ (-45 * ((qword_100020E98 + qword_100020EC8) ^ 0x59)))
                            - 75)
                  - 6))();
  unsigned int v11 = (char *)*(&off_10001CFD0
                + (byte_10001AFC0[byte_10001AEC0[(-45
                                                                                  * ((qword_100020E98 - qword_100020EC8) ^ 0x59))] ^ 0x52] ^ (-45 * ((qword_100020E98 - qword_100020EC8) ^ 0x59)))
                - 194)
      - 15;
  v15[0] = *(void *)((char *)*(&off_10001CFD0
                               + (byte_10001AFC0[byte_10001AEC0[(-45
                                                                                                 * ((qword_100020E98 - qword_100020EC8) ^ 0x59))] ^ 0x52] ^ (-45 * ((qword_100020E98 - qword_100020EC8) ^ 0x59)))
                               - 194)
                     + 25)
         - 4LL;
  v15[2] = a4;
  int v16 = 1563799153 * a6 + 1511568403;
  unsigned int v17 = (a7 ^ 0x6B778F6B) - 544245248 + ((2 * a7) & 0xD6EF1ED6);
  unsigned int v18 = &v13;
  unsigned int v19 = v12;
  unsigned int v20 = &v14;
  unsigned int v22 = v15;
  ((void (*)(void))((char *)*(&off_10001CFD0
                            + (byte_10001ADC0[byte_10001ACC0[(-45
                                                                                              * ((qword_100020E98
                                                                                                + qword_100020EC8) ^ 0x59))] ^ 0xBE] ^ (-45 * ((qword_100020E98 + qword_100020EC8) ^ 0x59)))
                            - 105)
                  - 3))();
  __asm { BR              X8 }

uint64_t sub_10000A788( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20, int a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40)
{
  uint64_t v40 = ((uint64_t (*)(uint64_t))STACK[0x450])(a19);
  unint64_t v41 = STACK[0x418];
  STACK[0x488] = 0LL;
  return ((uint64_t (*)(uint64_t))(*(void *)(v41
                                                      + 8LL
                                                      * (int)((3 * (a21 ^ 0x39)) ^ ((a40 == 0)
                                                                                  * ((((3 * (a21 ^ 0x39) + 419647819) & 0xE6FCAEC7)
                                                                                    + 94) ^ 0xD2))))
                                          - 4LL))(v40);
}

void xa3e62229cd6a3d85bebf231389c30c9a(_DWORD *a1)
{
  unsigned int v1 = *a1 ^ (95750717 * (((_DWORD)a1 + ~(_DWORD)a1 - (~(_DWORD)a1 ^ 0xAAB34EF7)) ^ 0x5569FD18));
  __asm { BR              X8 }

uint64_t sub_10000AB2C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v20 = *(_DWORD *)(v14 - 12);
  uint64_t v21 = ((uint64_t (*)(uint64_t))((char *)*(&off_10001CFD0 + (v20 ^ 8)) - 3))(a14);
  unsigned int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 24)
                                                                     + 8LL
                                                                     * ((51
                                                                       * (v21 == ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + v20 + 14) - 3))())) ^ v20));
  *(void *)(v14 - 8) = *(void *)(v14 - 32);
  return v15(v21, v16, v17, v18);
}

uint64_t sub_10000ABAC()
{
  uint64_t result = ((uint64_t (*)())((char *)*(&off_10001CFD0 + v3 - 15) - 2))();
  uint64_t v2 = 0LL;
  if (result) {
    uint64_t v2 = v5;
  }
  *(void *)(v0 - 8) = v2;
  *(void *)(v4 + 16) = *(void *)(v0 - 8);
  return result;
}

void x5e1d507326178250f0f601845521d0f7(_DWORD *a1)
{
  unsigned int v2 = *a1 ^ (1588918703 * ((2 * (a1 | 0xCDC95E5) - (_DWORD)a1 - 215782885) ^ 0xDF6DDACF));
  uint64_t v1 = *(void *)((char *)*(&off_10001CFD0 + (int)(v2 ^ 0x14B))
                 + 8
                 * (int)(v2 ^ (59 * (((uint64_t (*)(void))((char *)*(&off_10001CFD0 + (int)(v2 - 305)) - 3))() != 0)))
                 - 15)
     - (v2
      - 66
      - 255LL);
  __asm { BR              X8 }

uint64_t sub_10000ADF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38)
{
  int v63 = *(_DWORD *)(v38 - 108);
  int v62 = *(_DWORD *)(v38 - 156) + ((v63 - 2) ^ 0x460358B2);
  uint64_t v39 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + (v63 ^ 0x113)) - 3))();
  int v46 = v62;
  uint64_t v47 = *(void *)(v38 - 120);
  *(void *)(v38 - 256) = v39;
  unsigned int v48 = ((v46 & 0x8D7F9B01) << ((v63 - 13) ^ 0xFB)) & (v46 ^ 0xECDDD37B) ^ (((v46 & 0x8D7F9B01) << ((v63 - 13) ^ 0xFB)) & 0xA20002 | 0x30) ^ v46 & 0x8D7F9B01;
  unsigned int v49 = (2 * (v46 ^ 0xECDDD37B)) & 0x61A2487A ^ ((2 * (v46 ^ 0xECDDD37B)) ^ 0xC34490F4) & (v46 ^ 0xECDDD37B) ^ 0x20A2480A;
  int v50 = (4 * v48) & 0x61A24878 ^ ((4 * v48) ^ 0xC0) & v49 ^ v48;
  unsigned int v51 = (4 * v49) & 0x61A24878 ^ ((4 * v49) ^ 0x868921E8) & v49 ^ 0x61224812;
  int v52 = (16 * v50) & 0x61A24870 ^ ((16 * v50) ^ 0x700) & v51 ^ v50;
  int v53 = (16 * v51) & 0x61A24870 ^ ((16 * v51) ^ 0x1A2487A0) & v51 ^ 0x6182485A;
  int v54 = (v52 << 8) & 0x61A24800 ^ ((v52 << 8) ^ 0x7000) & v53 ^ v52 ^ 0x61A2080A;
  uint64_t v55 = (v53 << 8) & 0x61A20000 ^ ((v53 << 8) ^ 0xA2480000) & v53 ^ 0x41A20000;
  uint64_t v56 = (int)(v62 ^ (2 * ((v54 << 16) & 0x61A20000 ^ ((v54 << 16) ^ 0x487A0000) & v55 ^ v54)) ^ 0xCBFAE6A4);
  int64_t v57 = (((v56 ^ 0x2F1E1593AACC2A0ALL) - 0x266257D1C12E4376LL) ^ ((v56 ^ 0x9EA3CA323BC5119ALL) + 0x6820778FAFD8871ALL) ^ ((v56 ^ 0xB1BDDFA1948CD6C1LL) + 0x473E621C00914043LL))
      + 0x97C42430C67921DLL;
  BOOL v58 = v57 < (uint64_t)0x800000009E000DF0LL;
  BOOL v59 = v39 + 2650803696LL < v57;
  if (((v58 ^ (v39 > 0x7FFFFFFF61FFF20FLL)) & 1) == 0) {
    BOOL v58 = v59;
  }
  int v60 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v47 + 8LL * (v63 ^ (34 * !v58))) - 8LL);
  *(void *)(v38 - 248) = (char *)*(&off_10001CFD0 + (v63 ^ 0x101)) - 3;
  *(void *)(v38 - 240) = (char *)*(&off_10001CFD0 + v63 - 190) - 2;
  *(void *)(v38 - 232) = (char *)*(&off_10001CFD0 + (v63 ^ 0x11B)) - 3;
  *(void *)(v38 - 224) = (char *)*(&off_10001CFD0 + v63 - 160) - 2;
  *(void *)(v38 - 216) = (char *)*(&off_10001CFD0 + (v63 ^ 0x15F)) - 7;
  *(_DWORD *)(v38 - 208) = (v63 - 1520322829) & 0x5A9E48FF;
  *(_DWORD *)(v38 - 204) = v63 - 2;
  return v60( v39,  v55,  v40,  v41,  v42,  v43,  v44,  v45,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26,  a27,  a28,  a29,  a30,  a31,  a32,  a33,  a34,  a35,  a36,  a37,  a38);
}

uint64_t sub_10000B6C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, int a30, int a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, int a37, char a38)
{
  uint64_t v43 = (*(uint64_t (**)(void))(v38 - 240))();
  uint64_t v39 = (*(uint64_t (**)(uint64_t))(v38 - 232))(a29);
  (*(void (**)(void, uint64_t, uint64_t))(v38 - 224))(*(void *)(v38 - 128), v43, v39);
  uint64_t v40 = (*(uint64_t (**)(uint64_t))(v38 - 248))(a29);
  BOOL v41 = a36 > (((a25 + 1) << (a31 ^ 6u)) & 0xF957FF6ALL) + ((a25 + 1) ^ *(void *)(v38 - 192)) - 0x7A47E3EEF157672FLL;
  if ((a38 & 1) != 0) {
    BOOL v41 = 1;
  }
  return ((uint64_t (*)(uint64_t))(*(void *)(*(void *)(v38 - 120)
                                                      + 8LL
}

void sub_10000BD6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = (unint64_t)&v7[qword_100020E98 ^ qword_100020EB8];
  qword_100020EB8 = 186136019 * (v4 - 0x1D53B40810D0C259LL);
  qword_100020E98 = 186136019 * (v4 ^ 0x1D53B40810D0C259LL);
  unint64_t v5 = atomic_load((unint64_t *)(a3 + 40));
  unsigned int v6 = (char *)*(&off_10001C3C0
               + ((411
                 * (((uint64_t (*)(unint64_t, uint64_t))((char *)*(&off_10001CFD0
                                                                                 + (byte_10001B5C0[byte_10001B4C0[(-45 * ((qword_100020E98 - qword_100020EB8) ^ 0x59))] ^ 0xA4] ^ (-45 * ((qword_100020E98 - qword_100020EB8) ^ 0x59)))
                                                                                 + 31)
                                                                       - 2))( v5,  a1) == 0)) ^ 0xDF))
     - 8;
  __asm { BR              X8 }

uint64_t sub_10000C274@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, int a27, int a28)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a9 + 8LL * (int)(a28 ^ ((a25 == 0) * (((a28 + 1175881552) | 0x80280142) + 968980267)))) - 8LL))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a10,  a11,  a12);
}

void sub_10000C6C4(int a1)
{
  unint64_t v1 = ((a1 + 1352611385 - ((2 * a1) & 0xA13E6C72)) & 0x7F20FFE0 ^ 0x5520DFC0LL | 0x1C6A4B074F2DA154LL)
     - ((a1 + 1352611385 - ((2 * a1) & 0xA13E6C72)) & 0x7F20FFE0 ^ 0x5520DFC0LL | 0xE395B4F8B0D25EABLL)
     - 0x1C6A4B074F2DA155LL;
  __asm { BR              X8 }

uint64_t sub_10000C830( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, uint64_t a11, int a12)
{
  uint64_t v12 = (0xE952F773FA967ELL - (a10 & 0x7F3F0000 ^ 0x451B0000LL) + ((2 * (a10 & 0x7F3F0000 ^ 0x451B0000LL)) & 0x180A0000)) ^ 0x169129276FED2BELL;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a11
                                                                                 + 8LL
                                                                                 * (a12 ^ (235
                                                                                         * (((v12 << (a12 ^ 0x4Du)) | 0x4F1BE3A3C69164CALL)
                                                                                          - v12 == 0x4D9BA386BCA0A90ALL))))
                                                                     - 8LL))( a1,  a2,  a3,  a4);
}

uint64_t sub_10000C8F4()
{
  return (((v2 - 766992060) | 0x9A15A08) ^ 0xDBE9FB9F) + (v1 >> 31);
}

void x4b12c8efd5683a0a341cd18bd3e5b8cf(uint64_t a1)
{
  int v1 = *(_DWORD *)a1 ^ (688255471 * ((a1 + (~(_DWORD)a1 & 0x5DDDB22A) - (a1 & 0x5DDDB22A)) ^ 0x7D17CD8));
  uint64_t v3 = *(void *)(a1 + 16);
  int v2 = (v1 + 60) ^ (95750717
                  * ((2 * ((unint64_t)&v2 | 0xBA3032D4B2FAE425LL) - (void)&v2 + 1292180443) ^ 0x4D2057CA));
  xa3e62229cd6a3d85bebf231389c30c9a(&v2);
  __asm { BR              X8 }

uint64_t sub_10000CA90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  int v30 = *(_DWORD *)(v17 - 68);
  unsigned int v31 = (v30 ^ 0x13F) + 8;
  uint64_t v29 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + v30 - 263) - 3))(*(void *)(v17 - 104));
  uint64_t v18 = ((uint64_t (*)(void, uint64_t))((char *)*(&off_10001CFD0 + v30 - 267) - 3))( *(void *)((char *)*(&off_10001CFD0 + (v30 ^ 0x149)) - 7),  2 * v29);
  uint64_t v19 = *(void *)(v17 - 88);
  int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(v17 - 80) + 8LL * (v30 ^ (101 * (v18 != 0)))) - (v31 ^ 0x2CLL));
  *(_DWORD *)(v17 - 116) = v31;
  *(void *)(v17 - 64) = v19;
  return v20(v19, v21, v22, v23, v24, v25, v26, v27, a9, a10, a11, a12, a13, a14, a15, a16, a17);
}

uint64_t sub_10000CB50( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  int v35 = *(_DWORD *)(v25 - 116);
  uint64_t v36 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + (v35 ^ 0x6D)) - 2))(*(void *)(v25 - 104));
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 80) + 8LL * ((197 * (a23 != (v35 ^ 0x38u) + 175 - 203LL)) ^ v35));
  *(void *)(v25 - 64) = a25;
  return v26(v36, v27, v28, v29, v30, v31, v32, v33, a9, a10, a11, a12, a13);
}

uint64_t sub_10000CBCC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unsigned __int8 *a20, int a21, int a22)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 80) + 8LL * ((a22 + 16) ^ (46 * (*a20 > 0x9Fu)))))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10);
}

uint64_t sub_10000CCCC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, int a16, char a17, int a18)
{
  uint64_t v19 = *(void *)(v18 - 80);
  *(_BYTE *)(v18 - 50) = a17 - 77;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19
                                                                                          + 8LL
                                                                                          * ((a18 + 142) ^ (22 * ((a15 + ((a18 - 111) & 0x73) + 25) >= (a18 - 38)))))
                                                                              - 8LL))( a1,  a2,  a3,  a4,  a5);
}

void x11837c51d70353529a9dd8cb2f8b6b49(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16) + 491357047 * (((a1 | 0x52D3C3FB) - a1 + (a1 & 0xAD2C3C04)) ^ 0x4FCB5193);
  __asm { BR              X8 }

uint64_t sub_10000D0C0()
{
  int v5 = *(_DWORD *)(v0 - 12);
  uint64_t v6 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + v5 - 48) - 3))(*(void *)(v0 - 24));
  uint64_t v1 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + v5 - 52) - 3))();
  uint64_t v2 = *(void *)(v0 - 24);
  uint64_t v3 = v1;
  uint64_t result = v6;
  if (v6 != v3) {
    uint64_t v2 = 0LL;
  }
  *(void *)(v0 - 8) = v2;
  *(void *)(v7 + 8) = *(void *)(v0 - 8);
  return result;
}

void x8e525d43d4f517f3bca6158082f53e20(uint64_t a1)
{
  __asm { BR              X8 }

void sub_10000D4F0()
{
  *(_DWORD *)(v0 + 12) = ((((*(_DWORD *)(v1 - 0x7D8CA0564D0F448LL) >> 6) ^ 0xE67C0437) + 1413587527) ^ (((*(_DWORD *)(v1 - 0x7D8CA0564D0F448LL) >> 6) ^ 0x5C56059F) - 294935569) ^ (((*(_DWORD *)(v1 - 0x7D8CA0564D0F448LL) >> 6) ^ 0xBA2A01A8) + 135768026))
                       - 1657188199;
}

uint64_t x16c65845591541a5d9c872228d77a909(void *a1, void *a2)
{
  uint64_t v2 = qword_100020E98 + qword_100020EB0 - (void)&v5;
  qword_100020EB0 = 186136019 * (v2 - 0x1D53B40810D0C259LL);
  qword_100020E98 = 186136019 * (v2 ^ 0x1D53B40810D0C259LL);
  uint64_t v3 = ((uint64_t (*)(void, void, void))((char *)*(&off_10001CFD0
                                                                 + (byte_10001B3C0[byte_10001B2C0[(-45 * (qword_100020E98 ^ qword_100020EB0 ^ 0x59))] ^ 0xD6] ^ (-45 * (qword_100020E98 ^ qword_100020EB0 ^ 0x59)))
                                                                 + 8)
                                                       - 2))( *a1,  *a2,  0LL);
  if (v3 == 1) {
    return 1LL;
  }
  else {
    return ((v3 == -1) << 31 >> 31);
  }
}

void sub_100012728(id a1)
{
  uint64_t v1 = qword_100020E98 + qword_100020EA8 - (void)&v25;
  qword_100020EA8 = (186136019 * v1) ^ 0x1D53B40810D0C259LL;
  qword_100020E98 = 186136019 * (v1 ^ 0x1D53B40810D0C259LL);
  unsigned int v21 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0
                                     + (byte_10001ADC0[byte_10001ACC0[(-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59))] ^ 5] ^ (-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59)))
                                     - 122)
                           - 3))();
  uint64_t v13 = *(_BYTE **)((char *)*(&off_10001CFD0
                            + (byte_10001B5C0[byte_10001B4C0[(-45
                                                                                              * ((qword_100020E98
                                                                                                + qword_100020EA8) ^ 0x59))] ^ 0xA4] ^ (-45 * ((qword_100020E98 + qword_100020EA8) ^ 0x59)))
                            + 7)
                  - 2);
  v32[9] = *v13 - 63;
  v32[10] = v13[1] - 63;
  v32[11] = v13[2] - 63;
  v32[12] = v13[3] - 63;
  v32[13] = v13[4] - 63;
  v32[14] = v13[5] - 63;
  v32[15] = v13[6] - 63;
  v32[16] = v13[7] - 63;
  v32[17] = v13[8] - 63;
  v32[18] = v13[9] - 63;
  v32[19] = v13[10] - 63;
  v32[20] = v13[11] - 63;
  v32[21] = v13[12] - 63;
  v32[22] = v13[13] - 63;
  v32[23] = v13[14] - 63;
  v32[24] = v13[15] - 63;
  uint64_t v22 = (uint64_t (*)(void))((char *)*(&off_10001CFD0
                                    + (byte_10001B1C0[byte_10001B0C0[(-45 * ((qword_100020E98 - qword_100020EA8) ^ 0x59))] ^ 0xA0] ^ (-45 * ((qword_100020E98 - qword_100020EA8) ^ 0x59)))
                                    + 5)
                          - 2);
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001ADC0[byte_10001ACC0[(-45
                                                                                        * ((qword_100020E98
                                                                                          - qword_100020EA8) ^ 0x59))] ^ 5] ^ (-45 * ((qword_100020E98 - qword_100020EA8) ^ 0x59)))
                      - 203)
            - 2) = v22();
  uint64_t v2 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001B1C0[byte_10001B0C0[(-45
                                                                                            * ((qword_100020E98
                                                                                              + qword_100020EA8) ^ 0x59))] ^ 0x49] ^ (-45 * ((qword_100020E98 + qword_100020EA8) ^ 0x59)))
                          - 68)
                - 7);
  uint64_t v14 = (_BYTE *)*v2;
  v30[0] = *(_BYTE *)*v2 - 68;
  v30[1] = v14[1] - 68;
  v30[2] = v14[2] - 68;
  v30[3] = v14[3] - 68;
  v30[4] = v14[4] - 68;
  v30[5] = v14[5] - 68;
  v30[6] = v14[6] - 68;
  v30[7] = v14[7] - 68;
  v30[8] = v14[8] - 68;
  v30[9] = v14[9] - 68;
  v30[10] = v14[10] - 68;
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001ABC0[byte_10001AAC0[(-45
                                                                                        * ((qword_100020E98
                                                                                          - qword_100020EA8) ^ 0x59))] ^ 0xF4] ^ (-45 * ((qword_100020E98 - qword_100020EA8) ^ 0x59)))
                      - 237)
            - 6) = ((uint64_t (*)(void, _BYTE *, void))v22)(0LL, v30, v21);
  uint64_t v3 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001AFC0[byte_10001AEC0[(-45
                                                                                            * (qword_100020E98 ^ qword_100020EA8 ^ 0x59))] ^ 0x80] ^ (-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59)))
                          - 69)
                - 2);
  unsigned int v15 = (_BYTE *)*v3;
  v29[0] = *(_BYTE *)*v3 - 110;
  v29[1] = v15[1] - 110;
  v29[2] = v15[2] - 110;
  v29[3] = v15[3] - 110;
  v29[4] = v15[4] - 110;
  v29[5] = v15[5] - 110;
  v29[6] = v15[6] - 110;
  v29[7] = v15[7] - 110;
  v29[8] = v15[8] - 110;
  v29[9] = v15[9] - 110;
  v29[10] = v15[10] - 110;
  v29[11] = v15[11] - 110;
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001B3C0[byte_10001B2C0[(-45
                                                                                        * (qword_100020E98 ^ qword_100020EA8 ^ 0x59))] ^ 0x6E] ^ (-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59)))
                      - 87)
            - 3) = ((uint64_t (*)(void, _BYTE *, void))v22)(0LL, v29, v21);
  unint64_t v4 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001AFC0[byte_10001AEC0[(-45
                                                                                            * (qword_100020E98 ^ qword_100020EA8 ^ 0x59))] ^ 0x52] ^ (-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59)))
                          - 105)
                - 2);
  char v5 = (_BYTE *)*v4;
  v23[0] = *(_BYTE *)*v4 - 41;
  v23[1] = v5[1] - 41;
  v23[2] = v5[2] - 41;
  v23[3] = v5[3] - 41;
  v23[4] = v5[4] - 41;
  v23[5] = v5[5] - 41;
  v23[6] = v5[6] - 41;
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001B1C0[byte_10001B0C0[(-45
                                                                                        * (qword_100020E98 ^ qword_100020EA8 ^ 0x59))] ^ 0x4A] ^ (-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59)))
                      - 9)
            - 7) = ((uint64_t (*)(void, _BYTE *, void))v22)(0LL, v23, v21);
  uint64_t v6 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001B1C0[byte_10001B0C0[(-45
                                                                                            * ((qword_100020E98
                                                                                              - qword_100020EA8) ^ 0x59))] ^ 0x49] ^ (-45 * ((qword_100020E98 - qword_100020EA8) ^ 0x59)))
                          - 99)
                - 2);
  uint64_t v16 = (_BYTE *)*v6;
  v31[0] = *(_BYTE *)*v6 - 100;
  v31[1] = v16[1] - 100;
  v31[2] = v16[2] - 100;
  v31[3] = v16[3] - 100;
  v31[4] = v16[4] - 100;
  v31[5] = v16[5] - 100;
  v31[6] = v16[6] - 100;
  v31[7] = v16[7] - 100;
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001B1C0[byte_10001B0C0[(-45
                                                                                        * ((qword_100020E98
                                                                                          - qword_100020EA8) ^ 0x59))] ^ 0x4A] ^ (-45 * ((qword_100020E98 - qword_100020EA8) ^ 0x59)))
                      + 86)
            - 6) = ((uint64_t (*)(void, _BYTE *, void))v22)(0LL, v31, v21);
  uint64_t v7 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001AFC0[byte_10001AEC0[(-45
                                                                                            * ((qword_100020E98
                                                                                              + qword_100020EA8) ^ 0x59))] ^ 0x80] ^ (-45 * ((qword_100020E98 + qword_100020EA8) ^ 0x59)))
                          - 43)
                - 6);
  uint64_t v17 = (_BYTE *)*v7;
  v27[0] = *(_BYTE *)*v7 - 27;
  v27[1] = v17[1] - 27;
  v27[2] = v17[2] - 27;
  v27[3] = v17[3] - 27;
  v27[4] = v17[4] - 27;
  v27[5] = v17[5] - 27;
  v27[6] = v17[6] - 27;
  v27[7] = v17[7] - 27;
  v27[8] = v17[8] - 27;
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001B5C0[byte_10001B4C0[(-45
                                                                                        * (qword_100020E98 ^ qword_100020EA8 ^ 0x59))] ^ 0x4A] ^ (-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59)))
                      - 159)
            - 3) = ((uint64_t (*)(void, _BYTE *, void))v22)(0LL, v27, v21);
  BOOL v8 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001B5C0[byte_10001B4C0[(-45
                                                                                            * ((qword_100020E98
                                                                                              + qword_100020EA8) ^ 0x59))] ^ 0xA4] ^ (-45 * ((qword_100020E98 + qword_100020EA8) ^ 0x59)))
                          + 12)
                - 3);
  uint64_t v18 = (_BYTE *)*v8;
  v32[0] = *(_BYTE *)*v8 - 66;
  v32[1] = v18[1] - 66;
  v32[2] = v18[2] - 66;
  v32[3] = v18[3] - 66;
  v32[4] = v18[4] - 66;
  v32[5] = v18[5] - 66;
  v32[6] = v18[6] - 66;
  v32[7] = v18[7] - 66;
  v32[8] = v18[8] - 66;
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001B3C0[byte_10001B2C0[(-45
                                                                                        * ((qword_100020E98
                                                                                          - qword_100020EA8) ^ 0x59))] ^ 0x1A] ^ (-45 * ((qword_100020E98 - qword_100020EA8) ^ 0x59)))
                      - 20)
            - 3) = ((uint64_t (*)(void, _BYTE *, void))v22)(0LL, v32, v21);
  unsigned int v9 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001ADC0[byte_10001ACC0[(-45
                                                                                            * (qword_100020E98 ^ qword_100020EA8 ^ 0x59))] ^ 0xBE] ^ (-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59)))
                          - 109)
                - 7);
  uint64_t v19 = (_BYTE *)*v9;
  v28[0] = *(_BYTE *)*v9 - 67;
  v28[1] = v19[1] - 67;
  v28[2] = v19[2] - 67;
  v28[3] = v19[3] - 67;
  v28[4] = v19[4] - 67;
  v28[5] = v19[5] - 67;
  v28[6] = v19[6] - 67;
  v28[7] = v19[7] - 67;
  v28[8] = v19[8] - 67;
  v28[9] = v19[9] - 67;
  v28[10] = v19[10] - 67;
  v28[11] = v19[11] - 67;
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001B3C0[byte_10001B2C0[(-45
                                                                                        * (qword_100020E98 ^ qword_100020EA8 ^ 0x59))] ^ 0x6E] ^ (-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59)))
                      - 166)
            - 6) = ((uint64_t (*)(void, _BYTE *, void))v22)(0LL, v28, v21);
  unsigned int v10 = (void *)((char *)*(&off_10001CFD0
                           + (byte_10001B3C0[byte_10001B2C0[(-45
                                                                                             * ((qword_100020E98
                                                                                               + qword_100020EA8) ^ 0x59))] ^ 0x6E] ^ (-45 * ((qword_100020E98 + qword_100020EA8) ^ 0x59)))
                           - 106)
                 - 2);
  int v20 = (_BYTE *)*v10;
  v26[0] = *(_BYTE *)*v10 - 37;
  v26[1] = v20[1] - 37;
  v26[2] = v20[2] - 37;
  v26[3] = v20[3] - 37;
  v26[4] = v20[4] - 37;
  v26[5] = v20[5] - 37;
  v26[6] = v20[6] - 37;
  v26[7] = v20[7] - 37;
  v26[8] = v20[8] - 37;
  v26[9] = v20[9] - 37;
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001ADC0[byte_10001ACC0[(-45
                                                                                        * ((qword_100020E98
                                                                                          + qword_100020EA8) ^ 0x59))] ^ 5] ^ (-45 * ((qword_100020E98 + qword_100020EA8) ^ 0x59)))
                      - 206)
            - 7) = ((uint64_t (*)(void, _BYTE *, void))v22)(0LL, v26, v21);
  unsigned int v11 = (void *)((char *)*(&off_10001CFD0
                           + (byte_10001B3C0[byte_10001B2C0[(-45
                                                                                             * (qword_100020E98 ^ qword_100020EA8 ^ 0x59))] ^ 0x6E] ^ (-45 * (qword_100020E98 ^ qword_100020EA8 ^ 0x59)))
                           - 80)
                 - 6);
  uint64_t v12 = (_BYTE *)*v11;
  v24[0] = *(_BYTE *)*v11 - 38;
  v24[1] = v12[1] - 38;
  v24[2] = v12[2] - 38;
  v24[3] = v12[3] - 38;
  v24[4] = v12[4] - 38;
  v24[5] = v12[5] - 38;
  v24[6] = v12[6] - 38;
  *(void *)((char *)*(&off_10001CFD0
                      + (byte_10001AFC0[byte_10001AEC0[(-45
                                                                                        * ((qword_100020E98
                                                                                          + qword_100020EA8) ^ 0x59))] ^ 0x52] ^ (-45 * ((qword_100020E98 + qword_100020EA8) ^ 0x59)))
                      - 171)
            - 2) = ((uint64_t (*)(void, _BYTE *, void))v22)(0LL, v24, v21);
}

void xf2ee496a7f7f46093141b16bb3083d35(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_100013930( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, int a34)
{
  int v40 = *(_DWORD *)(v35 - 180);
  *(void *)(v35 - 32) = v34;
  *(_DWORD *)(v35 - 48) = (v40 + 452446455) ^ (688255471 * ((-1 - (a34 | (v35 - 48)) + (a34 & (v35 - 48))) ^ 0xF2B68D79));
  uint64_t v36 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + v40 + 452446489) - 11))();
  uint64_t v37 = *(void *)(v35 - 192);
  uint64_t v38 = *(void *)(v35 - 40);
  *(void *)(v35 - 168) = v38;
  *(void *)(v35 - 176) = 0LL;
  return (*(uint64_t (**)(uint64_t))(v37 + 8LL * (int)((v40 + 452446437) ^ ((v38 == 0) * (v40 ^ 0xE508371C)))))(v36);
}

uint64_t sub_100013B10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v15 = *(_DWORD *)(v14 - 180);
  unsigned int v28 = v15 ^ 0xE5083785;
  unsigned int v30 = (v15 + 452446688) | 0x10;
  int v29 = v15 + 452446478;
  uint64_t v16 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0 + (int)(v15 ^ 0xE5083731)) - 3))();
  uint64_t v24 = *(void *)(v14 - 192);
  int64_t v25 = *(void *)(v14 - 216) + (v28 ^ 0xA6AEF30018780AFCLL);
  BOOL v26 = v16 > 0x7FFFFFFFAA529928LL;
  *(void *)(v14 - 176) = 0LL;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 8LL * ((98 * v26) ^ v29)))( v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  a9,  a10,  a11,  a12,  a13,  a14);
}

uint64_t sub_100013C08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, int a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
{
  *(void *)(v37 - 40) = ((uint64_t (*)(uint64_t, uint64_t))((char *)*(&off_10001CFD0 + a23 - 238) - 2))( a37,  *(void *)(v37 - 216) - 0x59510D003D355C7BLL);
  *(_DWORD *)(v37 - 48) = (a23 - 189) ^ (95750717
                                       * ((-2 - ((v37 - 48) | 0x8B405BDF) - (~(v37 - 48) | 0x74BFA420)) ^ 0x8B6517CF));
  xa3e62229cd6a3d85bebf231389c30c9a((_DWORD *)(v37 - 48));
  uint64_t v38 = *(void *)(v37 - 192);
  uint64_t v39 = *(void *)(v37 - 32);
  *(void *)(v37 - 168) = v39;
  *(void *)(v37 - 176) = 0LL;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v38 + 8LL * (a23 ^ ((((v39 == 0) ^ (a23 - 86) & 0x73) & 1) * ((a23 - 582728548) & 0x22BBBAEE ^ 0x86)))) - 4LL))( v40,  v41,  v42,  v43,  v44,  v45,  v46,  v47,  a9,  a10,  a11,  a12);
}

uint64_t sub_100014388(unsigned int a1)
{
  unsigned int v1 = (a1 >> 8) & 0x88 ^ (((a1 >> 22) ^ 0x98BD53F1) & 0x1014137D ^ ((((a1 >> 22) ^ 0x98BD53F1) & 0x9014137E)
                                                                   - 647398332
                                                                   - ((2 * ((a1 >> 22) ^ 0x98BD53F1)) & 0x20002088)) ^ 0x2E0A6C32) & ((a1 >> 8) & 0xFC ^ 0xFFBFFFFF) ^ 0x8880988;
  return (v1 - 1581274891 - ((2 * v1) & 0x437F51EA)) ^ 0xDE14B10A;
}

void sub_10001442C(id a1)
{
  unint64_t v1 = (unint64_t)&v17[(qword_100020E98 ^ qword_100020EA0) + 7];
  qword_100020EA0 = 186136019 * (v1 + 0x1D53B40810D0C259LL);
  qword_100020E98 = 186136019 * (v1 ^ 0x1D53B40810D0C259LL);
  unsigned int v12 = ((uint64_t (*)(void))((char *)*(&off_10001CFD0
                                     + (byte_10001ABC0[byte_10001AAC0[(-45 * (qword_100020E98 ^ qword_100020EA0 ^ 0x59))] ^ 0x23] ^ (-45 * (qword_100020E98 ^ qword_100020EA0 ^ 0x59)))
                                     - 99)
                           - 3))();
  uint64_t v2 = *(_BYTE **)((char *)*(&off_10001CFD0
                           + (byte_10001B3C0[byte_10001B2C0[(-45
                                                                                             * ((qword_100020E98
                                                                                               + qword_100020EA0) ^ 0x59))] ^ 0x56] ^ (-45 * ((qword_100020E98 + qword_100020EA0) ^ 0x59)))
                           + 30)
                 - 6);
  v15[6] = *v2 - 116;
  v15[7] = v2[1] - 116;
  v15[8] = v2[2] - 116;
  v15[9] = v2[3] - 116;
  v15[10] = v2[4] - 116;
  v15[11] = v2[5] - 116;
  uint64_t v13 = (uint64_t (*)(void))((char *)*(&off_10001CFD0
                                    + (byte_10001AFC0[byte_10001AEC0[(-45 * ((qword_100020E98 + qword_100020EA0) ^ 0x59))] ^ 0xDC] ^ (-45 * ((qword_100020E98 + qword_100020EA0) ^ 0x59)))
                                    - 228)
                          - 2);
  uint64_t v3 = v13();
  uint64_t v14 = (uint64_t *)((char *)*(&off_10001CFD0
                            + (byte_10001ADC0[byte_10001ACC0[(-45
                                                                                              * (qword_100020E98 ^ qword_100020EA0 ^ 0x59))] ^ 0xBE] ^ (-45 * (qword_100020E98 ^ qword_100020EA0 ^ 0x59)))
                            - 69)
                  - 15);
  *uint64_t v14 = v3;
  unint64_t v4 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001B3C0[byte_10001B2C0[(-45
                                                                                            * (qword_100020E98 ^ qword_100020EA0 ^ 0x59))] ^ 0x1A] ^ (-45 * (qword_100020E98 ^ qword_100020EA0 ^ 0x59)))
                          + 49)
                - 2);
  char v5 = (_BYTE *)*v4;
  v17[0] = *(_BYTE *)*v4 - 62;
  v17[1] = v5[1] - 62;
  v17[2] = v5[2] - 62;
  v17[3] = v5[3] - 62;
  v17[4] = v5[4] - 62;
  v17[5] = v5[5] - 62;
  v17[6] = v5[6] - 62;
  v14[1] = ((uint64_t (*)(void, _BYTE *, void))v13)(0LL, v17, v12);
  uint64_t v6 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001B3C0[byte_10001B2C0[(-45
                                                                                            * ((qword_100020E98
                                                                                              - qword_100020EA0) ^ 0x59))] ^ 0x56] ^ (-45 * ((qword_100020E98 - qword_100020EA0) ^ 0x59)))
                          - 44)
                - 2);
  uint64_t v7 = (_BYTE *)*v6;
  v16[0] = *(_BYTE *)*v6 - 101;
  v16[1] = v7[1] - 101;
  v16[2] = v7[2] - 101;
  v16[3] = v7[3] - 101;
  v16[4] = v7[4] - 101;
  v16[5] = v7[5] - 101;
  v14[2] = ((uint64_t (*)(void, _BYTE *, void))v13)(0LL, v16, v12);
  BOOL v8 = (void *)((char *)*(&off_10001CFD0
                          + (byte_10001B1C0[byte_10001B0C0[(-45
                                                                                            * ((qword_100020E98
                                                                                              + qword_100020EA0) ^ 0x59))] ^ 0xD4] ^ (-45 * ((qword_100020E98 + qword_100020EA0) ^ 0x59)))
                          - 7)
                - 7);
  unsigned int v9 = (_BYTE *)*v8;
  v15[0] = *(_BYTE *)*v8 - 20;
  v15[1] = v9[1] - 20;
  v15[2] = v9[2] - 20;
  void v15[3] = v9[3] - 20;
  v15[4] = v9[4] - 20;
  v15[5] = v9[5] - 20;
  v14[3] = ((uint64_t (*)(void, _BYTE *, void))v13)(0LL, v15, v12);
  unsigned int v10 = (void *)((char *)*(&off_10001CFD0
                           + (byte_10001B1C0[byte_10001B0C0[(-45
                                                                                             * ((qword_100020E98
                                                                                               + qword_100020EA0) ^ 0x59))] ^ 0x49] ^ (-45 * ((qword_100020E98 + qword_100020EA0) ^ 0x59)))
                           - 87)
                 - 6);
  unsigned int v11 = (_BYTE *)*v10;
  v18[0] = *(_BYTE *)*v10 - 2;
  v18[1] = v11[1] - 2;
  v18[2] = v11[2] - 2;
  v18[3] = v11[3] - 2;
  v18[4] = v11[4] - 2;
  v18[5] = v11[5] - 2;
  v18[6] = v11[6] - 2;
  v18[7] = v11[7] - 2;
  v18[8] = v11[8] - 2;
  v14[4] = ((uint64_t (*)(void, _BYTE *, void))v13)(0LL, v18, v12);
}

uint64_t x3f017879f5bcbb3a0839d8eb910392e6(uint64_t a1)
{
  int v9 = *(_DWORD *)(a1 + 32) - 806450243 * ((a1 + ~(_DWORD)a1 - (~(_DWORD)a1 ^ 0x11B6368F)) ^ 0xE952AFF2);
  uint64_t v1 = 806450243 * ((a1 + ~a1 - (~a1 ^ 0x5DF2162611B6368FLL)) ^ 0x2672652DE952AFF2LL);
  int v8 = *(_DWORD *)a1 - v1;
  uint64_t v6 = *(void *)(a1 + 8) - v1;
  uint64_t v7 = *(void *)(a1 + 16) ^ v1;
  uint64_t v10 = (v6 - 0x680FA74B2FAE0775LL) % ((int (*)(void))((char *)*(&off_10001CFD0 + (int)(v9 ^ 0xC5A30FB0)) - 2))();
  uint64_t v2 = ((uint64_t (*)(void, uint64_t, uint64_t, uint64_t, void, uint64_t))((char *)*(&off_10001CFD0
                                                                                             + v9
                                                                                             + 979169455)
                                                                                   - 3))( 0LL,  v7 - 0x574C23AC387F0F0BLL + v10,  1LL,  1026LL,  (-351085429 * v8 + 2002065684),  v6 - 0x680FA74B2FAE0775LL - v10);
  uint64_t result = a1;
  BOOL v4 = v2 == -1;
  uint64_t v5 = v2 + v10;
  if (v4) {
    uint64_t v5 = -1LL;
  }
  *(void *)(a1 + 24) = v5;
  return result;
}

void x893c50b37fbe8816f0ee3b2575aa1cf2(uint64_t a1)
{
  __asm { BR              X8 }

uint64_t sub_100015300( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  int v68 = *(_DWORD *)(a56 + 76);
  int v69 = v68 * (((a68 + 1692319557) | 0x10) - 1570358364);
  v68 -= 54795319;
  LODWORD(STACK[0x23C]) = v68;
  unsigned int v70 = v69 + 78743412 + v68 * (a66 + 411096168);
  unsigned int v71 = a65 + a68 + 1506179027;
  BOOL v72 = v70 < 0x26A21E5C;
  char v73 = (v71 < 0x26A21E5C) ^ (v70 < 0x26A21E5C);
  BOOL v74 = v70 > v71;
  if ((v73 & 1) == 0) {
    BOOL v72 = v74;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a67 + 8LL * ((a68 + 1692319508) ^ (241 * !v72))))( a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10,  a11,  a12,  a13,  a14,  a15,  a16,  a17,  a18,  a19,  a20,  a21,  a22,  a23,  a24,  a25,  a26);
}

uint64_t xccfd92f801b45df4051d14c851280fa3(uint64_t result, unsigned __int8 a2, unint64_t a3)
{
  if (((a2 ^ result) & 7) == 0)
  {
    unint64_t v4 = -(char)result & 7;
    unint64_t v5 = (v4 - 1);
    if (v5 <= 6) {
      __asm { BR              X8 }
    }

    unint64_t v3 = 0LL;
    if (a3 >= v4) {
      unint64_t v3 = a3 - v4;
    }
    if (v3 >= 8) {
      __asm { BR              X8 }
    }

    __asm { BR              X8 }
  }

  if ((a3 + 7) >= 8) {
    __asm { BR              X8 }
  }

  return result;
}

void xd93993f22db84760f4c8e7d48e9dc819(char a1, uint64_t a2, unint64_t a3)
{
  if ((-a1 & 7u) <= a3) {
    unsigned int v3 = -a1 & 7;
  }
  else {
    unsigned int v3 = a3;
  }
  unint64_t v5 = v3 - 1;
  if (v5 <= 6) {
    __asm { BR              X8 }
  }

  unint64_t v4 = a3 - v3;
  if (v4 >= 8) {
    __asm { BR              X8 }
  }

  __asm { BR              X8 }

void sub_100017C8C()
{
  *uint64_t v0 = v1;
  v0[1] = v1;
  v0[2] = v1;
  v0[3] = v1;
  v0[4] = v1;
  v0[5] = v1;
  v0[6] = v1;
}

uint64_t sub_100017D94()
{
  return 0LL;
}

uint64_t sub_100017D9C(const char *a1, uint64_t a2)
{
  int v4 = open(a1, 256);
  if (v4 < 0)
  {
    int v8 = __error();
    int v9 = strerror(*v8);
    syslog(3, "Failed to open macho file at %s for reading: %s", a1, v9);
    return 0LL;
  }

  else
  {
    int v5 = v4;
    uint64_t v6 = sub_100017E20(v4, (uint64_t)a1, a2);
    close(v5);
    return v6;
  }

uint64_t sub_100017E20(int a1, uint64_t a2, uint64_t a3)
{
  int __buf = 0;
  memset(&v24, 0, sizeof(v24));
  if (fstat(a1, &v24))
  {
    int v5 = __error();
    strerror(*v5);
    syslog(3, "Failed to stat %s : %s");
    return 0LL;
  }

  if (v24.st_size <= 8)
  {
    syslog(3, "File at %s is not a valid mach-o (too small to contain a valid header)");
    return 0LL;
  }

  *__error() = 0;
  if (pread(a1, &__buf, 4uLL, 0LL) != 4)
  {
    uint64_t v7 = __error();
    strerror(*v7);
    syslog(3, "Failed to read magic from %s : %s");
    return 0LL;
  }

  if (__buf <= -805638659)
  {
    if (__buf != -1095041334 && __buf != -889275714)
    {
      int v6 = -822415874;
      goto LABEL_15;
    }

    *__error() = 0;
    if (pread(a1, &fat_header, 8uLL, 0LL) == 8)
    {
      uint32_t magic = fat_header.magic;
      if (fat_header.magic == -1095041334)
      {
        swap_fat_header(&fat_header, NX_LittleEndian);
        uint32_t magic = fat_header.magic;
      }

      syslog(7, "Got fat header with magic 0x%08x and %u archs", magic, fat_header.nfat_arch);
      if (fat_header.nfat_arch < 0x401)
      {
        size_t v15 = 20LL * fat_header.nfat_arch;
        if (v24.st_size > (uint64_t)(v15 + 8))
        {
          uint64_t v14 = (fat_arch *)malloc(20LL * fat_header.nfat_arch);
          if (v15 == pread(a1, v14, v15, 8LL))
          {
            swap_fat_arch(v14, fat_header.nfat_arch, NX_LittleEndian);
            if (!fat_header.nfat_arch)
            {
LABEL_37:
              uint64_t v8 = 1LL;
              if (!v14) {
                return v8;
              }
              goto LABEL_28;
            }

            uint64_t v16 = 0LL;
            uint64_t v17 = v14;
            while (1)
            {
              syslog( 7,  "Evaluating fat slice with cputype %d; subtype %d; offset %u; size %u; align %u",
                v17->cputype,
                v17->cpusubtype,
                v17->offset,
                v17->size,
                v17->align);
              off_t offset = v17->offset;
              if (v24.st_size <= offset)
              {
                syslog(3, "Fat arch %u in %s specifies offset which is beyond the end of the file");
                goto LABEL_27;
              }

              uint64_t v19 = sub_1000181D8(a1, offset, v24.st_size);
              if (!v19) {
                break;
              }
              uint64_t v20 = v19;
              char v21 = (*(uint64_t (**)(uint64_t, fat_arch *, char *))(a3 + 16))(a3, v17, v19);
              free(v20);
              if (++v16 < (unint64_t)fat_header.nfat_arch)
              {
                ++v17;
                if ((v21 & 1) != 0) {
                  continue;
                }
              }

              goto LABEL_37;
            }

            syslog(3, "Failed to read macho header and load commands in %s at %u");
          }

          else
          {
            uint64_t v22 = __error();
            strerror(*v22);
            syslog(3, "Failed to read fat archs from %s : %s");
          }

LABEL_27:
          uint64_t v8 = 0LL;
          if (!v14) {
            return v8;
          }
LABEL_28:
          free(v14);
          return v8;
        }

        syslog(3, "File is not large enough to contain %u fat arch headers and their referenced slices.");
      }

      else
      {
        syslog(3, "Number of fat archs %u exceeds the maximum %u");
      }
    }

    else
    {
      uint64_t v13 = __error();
      strerror(*v13);
      syslog(3, "Failed to read fat header of %s : %s");
    }

    uint64_t v14 = 0LL;
    goto LABEL_27;
  }

  if ((__buf + 17958194) >= 2)
  {
    int v6 = -805638658;
LABEL_15:
    if (__buf != v6)
    {
      syslog(3, "Unknown binary with magic 0x%08x at %s");
      return 0LL;
    }
  }

  uint64_t v10 = sub_1000181D8(a1, 0LL, v24.st_size);
  if (v10)
  {
    unsigned int v11 = v10;
    (*(void (**)(uint64_t, void, char *))(a3 + 16))(a3, 0LL, v10);
    free(v11);
    return 1LL;
  }

  syslog(3, "Failed to read macho header and load commands in %s at %u");
  return 0LL;
}

char *sub_1000181D8(int a1, off_t a2, uint64_t a3)
{
  __int128 __buf = 0u;
  __int128 v19 = 0u;
  ssize_t v6 = pread(a1, &__buf, 0x20uLL, a2);
  if (v6 < 0)
  {
    int v9 = __error();
    strerror(*v9);
    syslog(3, "Failed to read mach header at offset %lld : %s");
LABEL_26:
    uint64_t v13 = 0LL;
    goto LABEL_27;
  }

  if (v6 != 28 && v6 != 32)
  {
    syslog(3, "Expected to read at least sizeof(struct mach_header) but only got %zd bytes");
    goto LABEL_26;
  }

  unsigned int v8 = v19;
  unsigned int v7 = DWORD1(v19);
  if ((int)__buf > -17958195)
  {
    if ((_DWORD)__buf != -17958194)
    {
      if ((_DWORD)__buf == -17958193) {
        goto LABEL_12;
      }
LABEL_23:
      syslog(3, "Unknown magic in macho header at offset %llu: 0x%08x");
      goto LABEL_26;
    }

LABEL_15:
    size_t v10 = 28LL;
    goto LABEL_16;
  }

  if ((_DWORD)__buf == -822415874)
  {
    unsigned int v7 = bswap32(DWORD1(v19));
    unsigned int v8 = bswap32(v19);
    goto LABEL_15;
  }

  if ((_DWORD)__buf != -805638658) {
    goto LABEL_23;
  }
  unsigned int v7 = bswap32(DWORD1(v19));
  unsigned int v8 = bswap32(v19);
LABEL_12:
  if (v6 != 32)
  {
    syslog(3, "Got 64-bit magic but didn't read size of 64-bit mach header");
    goto LABEL_26;
  }

  size_t v10 = 32LL;
LABEL_16:
  size_t v11 = v7;
  if (8 * (unint64_t)v8 > v7)
  {
    syslog(3, "Space required for total size of load commands (%llu) is greater than indicated size of commands (%u).");
    goto LABEL_26;
  }

  if ((uint64_t)(v10 + v7 + a2) >= a3)
  {
    syslog(3, "File is not large enough to contain commands with length %u");
    goto LABEL_26;
  }

  unsigned int v12 = (char *)malloc(v10 + v7);
  uint64_t v13 = v12;
  if (!v12)
  {
    uint64_t v16 = __error();
    strerror(*v16);
    syslog(3, "Failed to allocate %llu bytes: %s");
    goto LABEL_27;
  }

  memcpy(v12, &__buf, v10);
  ssize_t v14 = pread(a1, &v13[v10], v11, v10 + a2);
  if (v14 < 0)
  {
    uint64_t v17 = __error();
    strerror(*v17);
    syslog(3, "Failed to read %u bytes at offset %lld : %s");
    goto LABEL_27;
  }

  if (v14 != v11)
  {
    syslog(3, "Expected to read %u bytes of commands but only got %zd bytes");
LABEL_27:
    free(v13);
    return 0LL;
  }

  return v13;
}

uint64_t sub_1000183F8(const char *a1)
{
  uint64_t v5 = 0LL;
  ssize_t v6 = &v5;
  uint64_t v7 = 0x2000000000LL;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 0x40000000LL;
  v4[2] = sub_1000184A4;
  v4[3] = &unk_10001D368;
  v4[4] = &v5;
  v4[5] = a1;
  if ((sub_100017D9C(a1, (uint64_t)v4) & 1) != 0)
  {
    uint64_t v2 = *((unsigned int *)v6 + 6);
  }

  else
  {
    syslog(3, "Failed to iterate macho file at %s", a1);
    uint64_t v2 = 0LL;
  }

  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_1000184A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v9 = 0LL;
  size_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  int v12 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  v8[2] = sub_10001858C;
  v8[3] = &unk_10001D340;
  v8[4] = &v9;
  dyld_get_image_versions(a3, v8);
  int v4 = *((_DWORD *)v10 + 6);
  if (!v4)
  {
    syslog(3, "Failed to get SDK version from slice in %s", *(const char **)(a1 + 40));
    int v4 = *((_DWORD *)v10 + 6);
  }

  syslog(7, "Slice had version 0x%08x", v4);
  unsigned int v5 = *((_DWORD *)v10 + 6);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v5 > *(_DWORD *)(v6 + 24)) {
    *(_DWORD *)(v6 + 24) = v5;
  }
  _Block_object_dispose(&v9, 8);
  return 1LL;
}

uint64_t sub_10001858C(uint64_t result, uint64_t a2, int a3)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a3;
  return result;
}

BOOL sub_10001859C(int a1, int a2, char *a3, int *a4)
{
  if (!a3)
  {
    syslog(3, "Error: Argument pointer must not be null");
    int v12 = 13;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 13);
    BOOL v9 = 0LL;
    if (!a4) {
      return v9;
    }
    goto LABEL_12;
  }

  v17[0] = a1;
  v17[1] = a2;
  int v16 = 0;
  size_t v15 = 4LL;
  int v8 = sysctlbyname("kern.grade_cputype", &v16, &v15, v17, 8uLL);
  BOOL v9 = v8 == 0;
  if (v8)
  {
    size_t v10 = __error();
    uint64_t v11 = strerror(*v10);
    syslog(3, "Error calling kern.grade_cputype for CPU type 0x%x and subtype 0x%x: %s", a1, a2, v11);
    int v12 = 12;
    syslog(3, "Unable to determine CPU type is runnable with error: %d", 12);
    char v13 = 0;
  }

  else if (v16 < 1 || a1 != 16777228 || (a2 & 0xFFFFFE) != 0)
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are not runnable", a1, a2);
    int v12 = 0;
    char v13 = 0;
  }

  else
  {
    syslog(7, "CPU type 0x%x and subtype 0x%x are runnable", 16777228, a2);
    int v12 = 0;
    char v13 = 1;
  }

  *a3 = v13;
  if (a4) {
LABEL_12:
  }
    *a4 = v12;
  return v9;
}

BOOL sub_10001872C(const char *a1, _BYTE *a2, _DWORD *a3)
{
  int v33 = 0;
  char v32 = 0;
  memset(&v31, 0, sizeof(v31));
  int v30 = 0;
  if (!a1)
  {
    int v33 = 1;
    syslog(3, "Input path is NULL");
    goto LABEL_58;
  }

  if (!a2)
  {
    int v33 = 13;
    syslog(3, "Error: Argument pointer must not be null");
    goto LABEL_60;
  }

  int v6 = open(a1, 256);
  if (v6 != -1)
  {
    int v7 = v6;
    if (fstat(v6, &v31) == -1)
    {
      int v12 = *__error();
      int v33 = 3;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v12);
      BOOL v9 = "Can't stat input file %s: %s";
      goto LABEL_54;
    }

    unint64_t st_size = v31.st_size;
    if (read(v7, &v30, 4uLL) != 4)
    {
      int v13 = *__error();
      int v33 = 5;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v13);
      BOOL v9 = "Failed to read header for file %s: %s";
      goto LABEL_54;
    }

    if (lseek(v7, 0LL, 0) == -1)
    {
      int v14 = *__error();
      int v33 = 4;
      cputype = (char *)a1;
      uint64_t cpusubtype = (uint64_t)strerror(v14);
      BOOL v9 = "Can't seek input file %s: %s";
      goto LABEL_54;
    }

    if (st_size >= 8 && v30 == -1095041334)
    {
      *(void *)&fat_header.uint32_t magic = 0LL;
      if (read(v7, &fat_header, 8uLL) != 8)
      {
        int v16 = *__error();
        int v33 = 5;
        cputype = (char *)a1;
        uint64_t cpusubtype = (uint64_t)strerror(v16);
        BOOL v9 = "Failed to read fat header from input file %s: %s";
        goto LABEL_54;
      }

      swap_fat_header((fat_header *)&fat_header, NX_LittleEndian);
      if (fat_header.cputype >= 0x401u)
      {
        int v33 = 7;
        cputype = (char *)fat_header.cputype;
        uint64_t cpusubtype = 1024LL;
        BOOL v9 = "Number of fat archs %u exceeds the maximum %u";
LABEL_54:
        int v15 = 3;
        goto LABEL_55;
      }

      size_t v17 = 20LL * fat_header.cputype;
      if (v17 + 8 > st_size)
      {
        int v33 = 8;
        cputype = (char *)a1;
        BOOL v9 = "Malformed fat file: %s";
        goto LABEL_54;
      }

      __int128 v19 = (fat_arch *)malloc(v17);
      if (v19)
      {
        if (v17 == read(v7, v19, v17))
        {
          swap_fat_arch(v19, fat_header.cputype, NX_LittleEndian);
          if (fat_header.cputype)
          {
            uint64_t v20 = 0LL;
            p_uint64_t cpusubtype = &v19->cpusubtype;
            while (sub_10001859C(*(p_cpusubtype - 1), *p_cpusubtype, &v32, &v33))
            {
              if (v32) {
                goto LABEL_64;
              }
              p_cpusubtype += 5;
            }

            uint64_t v23 = "Failed to check if cpu type is runnable";
          }

          else
          {
            if (v32)
            {
LABEL_64:
              syslog(7, "FAT matching_arch cpu_type: 0x%x cpu_subtype: 0x%x");
              goto LABEL_56;
            }

LABEL_65:
            cputype = (char *)a1;
            uint64_t v23 = "Failed to find matching arch for FAT input file %s";
          }
        }

        else
        {
          int v24 = *__error();
          int v33 = 6;
          cputype = (char *)a1;
          uint64_t cpusubtype = (uint64_t)strerror(v24);
          uint64_t v23 = "Failed to read fat arch(s) from input file %s: %s";
        }
      }

      else
      {
        int v22 = *__error();
        int v33 = 9;
        cputype = strerror(v22);
        uint64_t v23 = "Failed to allocate memory for fat arch(s): %s";
      }

      syslog(3, v23, cputype, cpusubtype);
LABEL_56:
      free(v19);
      if ((v7 & 0x80000000) == 0) {
        close(v7);
      }
LABEL_58:
      if (!a2) {
        goto LABEL_60;
      }
      goto LABEL_59;
    }

    if (st_size >= 0x1C)
    {
      if (v30 == -17958194 || v30 == -822415874)
      {
        memset(&fat_header, 0, 28);
        if (read(v7, &fat_header, 0x1CuLL) == 28)
        {
          if (v30 == -822415874) {
            swap_mach_header((mach_header *)&fat_header, NX_LittleEndian);
          }
          if (sub_10001859C(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              BOOL v9 = "Failed to find matching arch for 32-bit Mach-O input file %s";
              goto LABEL_54;
            }

            cputype = (char *)fat_header.cputype;
            uint64_t cpusubtype = fat_header.cpusubtype;
            BOOL v9 = "32-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
LABEL_27:
            int v15 = 7;
LABEL_55:
            syslog(v15, v9, cputype, cpusubtype);
            __int128 v19 = 0LL;
            goto LABEL_56;
          }

          goto LABEL_50;
        }

        goto LABEL_41;
      }

      if (st_size >= 0x20 && (v30 == -17958193 || v30 == -805638658))
      {
        memset(&fat_header, 0, sizeof(fat_header));
        if (read(v7, &fat_header, 0x20uLL) == 32)
        {
          if (v30 == -805638658) {
            swap_mach_header_64(&fat_header, NX_LittleEndian);
          }
          if (sub_10001859C(fat_header.cputype, fat_header.cpusubtype, &v32, &v33))
          {
            if (!v32)
            {
              cputype = (char *)a1;
              BOOL v9 = "Failed to find matching arch for 64-bit Mach-O input file %s";
              goto LABEL_54;
            }

            cputype = (char *)fat_header.cputype;
            uint64_t cpusubtype = fat_header.cpusubtype;
            BOOL v9 = "64-bit thin matching_arch cpu_type: 0x%x cpu_subtype: 0x%x";
            goto LABEL_27;
          }

LABEL_50:
          BOOL v9 = "Failed to check if cpu type is runnable";
          goto LABEL_54;
        }

LABEL_41:
        int v18 = *__error();
        int v33 = 5;
        cputype = (char *)a1;
        uint64_t cpusubtype = (uint64_t)strerror(v18);
        BOOL v9 = "Failed to read mach header from input file %s: %s";
        goto LABEL_54;
      }
    }

    int v33 = 10;
    cputype = (char *)a1;
    BOOL v9 = "Unknown binary format for input file %s.";
    goto LABEL_54;
  }

  int v10 = *__error();
  int v33 = 2;
  uint64_t v11 = strerror(v10);
  syslog(3, "Can't open input file %s: %s", a1, v11);
LABEL_59:
  *a2 = v32;
LABEL_60:
  int v25 = v33;
  if (a3) {
    *a3 = v33;
  }
  return v25 == 0;
}

void sub_100018C74()
{
}

void sub_100018CDC(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleIdentifier]);
  sub_100002E6C();
  sub_100002E40((void *)&_mh_execute_header, v2, v3, "    bundleid         : %@", v4, v5, v6, v7, v8);

  sub_100002E60();
}

void sub_100018D54(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 applicationIdentifier]);
  sub_100002E6C();
  sub_100002E40((void *)&_mh_execute_header, v2, v3, "    application-id.. : %@", v4, v5, v6, v7, v8);

  sub_100002E60();
}

void sub_100018DCC(void *a1)
{
}

void sub_100018E54(void *a1)
{
}

void sub_100018EDC(void *a1)
{
}

void sub_100018F64()
{
}

void sub_100018FCC(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue([a1 applicationIdentifier]);
  sub_100002E6C();
  sub_100002E40((void *)&_mh_execute_header, v2, v3, "  Found by           : %@", v4, v5, v6, v7, v8);

  sub_100002E60();
}

void sub_100019044(uint64_t *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", a2, 4LL);
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  BOOL v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "\n\n%@\n%@\n\n", (uint8_t *)&v6, 0x16u);
}

void sub_100019104(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Caller not entitled", v1, 2u);
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}