uint64_t start(int a1, char *const *a2)
{
  int v4;
  BOOL v5;
  int v6;
  int v7;
  int v8;
  char *v9;
  int v10;
  BOOL v11;
  int v12;
  const char *v13;
  unint64_t v14;
  int v15;
  BOOL v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  kern_return_t v21;
  mach_port_t v22;
  kern_return_t v23;
  mach_port_t v24;
  kern_return_t v25;
  size_t v26;
  mach_msg_type_number_t v27;
  uint64_t v28;
  CFMutableDictionaryRef Mutable;
  FILE *v30;
  const char *v31;
  size_t v32;
  _DWORD *v33;
  unint64_t v34;
  int *v35;
  mach_error_t v36;
  mach_msg_type_number_t v37;
  BOOL v38;
  _DWORD *v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  mach_error_t v43;
  mach_error_t v44;
  mach_error_t v45;
  mach_error_t v46;
  mach_error_t v47;
  mach_error_t v48;
  mach_error_t v49;
  mach_error_t v50;
  mach_error_t v51;
  mach_error_t v52;
  int v53;
  BOOL v54;
  const char *v55;
  const char *v56;
  char v57;
  char v58;
  char v59;
  char *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  BOOL v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  const char *v72;
  const char *v73;
  int v74;
  unint64_t v75;
  unint64_t v76;
  double v77;
  const char *v78;
  double v79;
  const char *v80;
  double v81;
  const char *v82;
  double v83;
  const char *v84;
  double v85;
  const char *v86;
  time_t v87;
  char *v88;
  char *v89;
  double v90;
  double v91;
  double v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  double v97;
  const char *v98;
  double v99;
  const char *v100;
  double v101;
  const char *v102;
  double v103;
  const char *v104;
  int v105;
  double v106;
  int64x2_t v107;
  char v108;
  const char *v109;
  const char *v110;
  const char *v111;
  CFArrayRef v112;
  CFArrayRef v113;
  CFIndex v114;
  const char *ValueAtIndex;
  unsigned int v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  unsigned int v120;
  BOOL v121;
  const char *v122;
  unsigned int v123;
  BOOL v124;
  const char *v125;
  unsigned int v126;
  BOOL v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  const char *v131;
  const char *v132;
  const char *v133;
  unsigned int v134;
  const char *v135;
  unsigned int v136;
  const char *v137;
  unsigned int v138;
  const char *v139;
  const char *v140;
  const char *v141;
  const char *v142;
  unsigned int v143;
  const char *v144;
  unsigned int v145;
  BOOL v146;
  const char *v147;
  unsigned int v148;
  BOOL v149;
  const char *v150;
  const char *v151;
  unsigned int v152;
  const char *v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  unsigned int v157;
  const char *v158;
  const char *v159;
  const char *v160;
  const char *v161;
  const char *v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  const char *v168;
  const char *v169;
  const char *v170;
  const char *v171;
  const char *v172;
  const char *v173;
  unint64_t v174;
  mach_error_t v175;
  mach_error_t v176;
  int v177;
  kern_return_t overwrite;
  mach_error_t v179;
  const char *v180;
  kern_return_t v181;
  mach_error_t v182;
  const char *v183;
  kern_return_t v184;
  mach_error_t v185;
  mach_error_t v186;
  mach_error_t v187;
  mach_error_t v188;
  mach_error_t v189;
  unsigned int v190;
  unint64_t v191;
  int v192;
  unint64_t v193;
  int64x2_t v194;
  uint64_t v195;
  uint64_t *v196;
  int64x2_t v197;
  uint64_t v198;
  kern_return_t v199;
  uint64_t v200;
  __int128 *v201;
  __int128 v202;
  const char *v203;
  const char *v204;
  const char *v205;
  unsigned int v206;
  const char *v207;
  unsigned int v208;
  const char *v209;
  uint64_t v210;
  const char *v211;
  unsigned int v212;
  const char *v213;
  uint64_t v214;
  const char *v215;
  unsigned int v216;
  const char *v217;
  unsigned int v218;
  BOOL v219;
  const char *v220;
  unsigned int v221;
  BOOL v222;
  const char *v223;
  const char *v224;
  const char *v225;
  const char *v226;
  unsigned int v227;
  const char *v228;
  unsigned int v229;
  const char *v230;
  int v231;
  const char *v232;
  int v233;
  const char *v234;
  unsigned int v235;
  BOOL v236;
  const char *v237;
  unsigned int v238;
  BOOL v239;
  const char *v240;
  const char *v241;
  int v242;
  const char *v243;
  const char *v244;
  const char *v245;
  const char *v246;
  const char *v247;
  mach_error_t mach_voucher;
  mach_port_name_t v249;
  mach_error_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  kern_return_t v254;
  mach_msg_type_number_t j;
  _DWORD *v256;
  int v257;
  uint64_t v258;
  _DWORD *v259;
  int v260;
  unsigned int v261;
  size_t v262;
  char *v263;
  size_t v264;
  FILE *v265;
  FILE *v266;
  int v267;
  int (__cdecl *v268)(const void *, const void *);
  uint64_t v269;
  BOOL v270;
  int v271;
  const char *v272;
  char *v273;
  unsigned int v274;
  const char *v275;
  size_t v276;
  BOOL v277;
  uint64_t v278;
  const char *v279;
  char *v280;
  int v281;
  int *v282;
  int v283;
  int v284;
  int *v285;
  task_t *v286;
  uint64_t v287;
  int v288;
  task_t v289;
  mach_error_t v290;
  unsigned int v291;
  const char *v292;
  unsigned int v293;
  int v294;
  const char *v295;
  char *v296;
  char *v297;
  char *v298;
  char *v299;
  void *v300;
  char *v301;
  char *v302;
  unint64_t v303;
  uint64_t v305;
  size_t v306;
  int v307;
  int v308;
  rusage_info_t *v309;
  int v310;
  int64x2_t v311;
  char *v312;
  __int128 v313;
  FILE *v314;
  FILE *v315;
  uint64_t stackshot_buffer;
  unint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  _DWORD *v322;
  char v323;
  uint64_t v324;
  uint64_t v325;
  int v326;
  int v327;
  unint64_t v328;
  unsigned int v329;
  uint64_t i;
  const void *v331;
  uint64_t v332;
  void *Value;
  unsigned int v334;
  BOOL v335;
  unsigned int v336;
  FILE *v337;
  const char *v338;
  size_t v339;
  FILE *v340;
  const char *v341;
  size_t v342;
  mach_error_t v343;
  const char *v344;
  BOOL v345;
  uint64_t v346;
  int64x2_t v347;
  unint64_t v348;
  uint64_t v349;
  int v350;
  char *v351;
  CFDictionaryRef cf;
  int v353;
  BOOL v354;
  _DWORD *v355;
  char *__s1;
  unint64_t v357;
  uint64_t v358;
  uint64_t v359;
  char *v360;
  char *v361;
  uint64_t v362;
  const void *key;
  void *keya[2];
  unint64_t v365;
  int64x2_t v366;
  unint64_t v367;
  uint64_t v368;
  int v369;
  char v370;
  char v371;
  char v372;
  task_array_t v373;
  uint64_t v374;
  int pid[2];
  int pida[2];
  BOOL pidb;
  BOOL v378;
  BOOL v379;
  int v380;
  int v381;
  int v382;
  BOOL v383;
  void *v384;
  ipc_voucher_t voucher;
  int64x2_t outsize;
  __int128 v387;
  unint64_t v388;
  BOOLean_t v389;
  BOOLean_t get_default;
  integer_t v391[2];
  char v392;
  unint64_t v393;
  uint64_t v394;
  int v395;
  integer_t v396;
  integer_t v397;
  integer_t v398[5];
  integer_t v399;
  integer_t v400;
  int v401;
  int v402;
  int v403;
  int v404;
  uint64_t v405[2];
  vm_address_t v406;
  integer_t thread_info_out[5];
  unsigned int v408;
  int v409;
  int v410;
  int v411;
  int v412;
  int x[2];
  thread_act_array_t act_list;
  uint32_t flags;
  _DWORD v416[3];
  int v417;
  uint64_t v418;
  uint64_t v419;
  _DWORD v420[2];
  integer_t policy_info[6];
  int v422;
  int v423;
  int v424;
  unint64_t v425;
  unint64_t v426;
  integer_t v427[3];
  int v428;
  integer_t v429[7];
  int v430;
  integer_t v431[4];
  unint64_t v432;
  unint64_t v433;
  unint64_t v434;
  integer_t v435[4];
  integer_t task_info_out;
  unint64_t v437;
  int v438;
  int v439;
  int v440;
  int v441;
  unsigned int v442;
  integer_t v443[8];
  ipc_info_space_basic_t basic_info;
  mach_msg_type_number_t task_info_outCnt;
  mach_msg_type_number_t task_listCnt;
  task_array_t task_list;
  _DWORD __size[3];
  uint64_t v449;
  size_t v450;
  processor_set_t set;
  processor_set_name_t default_set;
  mach_msg_type_number_t recipesCnt;
  unsigned int object_addr;
  char *v455;
  char *v456;
  int64x2_t v457;
  unint64_t v458;
  char v459;
  _DWORD v460[16];
  char v461;
  uuid_string_t out;
  rusage_info_t v463[2];
  int64x2_t v464;
  unint64_t v465;
  unint64_t v466;
  unint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  unint64_t v476;
  unint64_t v477;
  unint64_t v478;
  char *v479;
  char *v480;
  unint64_t v481;
  int64x2_t v482;
  char *v483;
  char *v484;
  unint64_t v485;
  uint64_t v486;
  unint64_t v487;
  unint64_t v488;
  unsigned __int8 uu[16];
  uint64_t v490;
  int v491;
  size_t buffer[6];
  uint64_t v493;
  char v494;
  uint64_t v495;
  integer_t v496[4];
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  int64x2_t v500;
  uint64_t v501;
  option v502;
  const char *v503;
  int v504;
  uint64_t *v505;
  int v506;
  const char *v507;
  int v508;
  _DWORD *v509;
  int v510;
  const char *v511;
  int v512;
  _DWORD *v513;
  int v514;
  const char *v515;
  int v516;
  uint64_t v517;
  int v518;
  const char *v519;
  int v520;
  uint64_t v521;
  int v522;
  const char *v523;
  int v524;
  uint64_t v525;
  int v526;
  const char *v527;
  int v528;
  uint64_t v529;
  int v530;
  const char *v531;
  int v532;
  uint64_t v533;
  int v534;
  const char *v535;
  int v536;
  uint64_t v537;
  int v538;
  const char *v539;
  int v540;
  uint64_t v541;
  int v542;
  const char *v543;
  int v544;
  uint64_t v545;
  int v546;
  __int128 v547;
  __int128 v548;
  int v549[4];
  char *__endptr[2];
  int64x2_t v551;
  unint64_t v552;
  unsigned int v553;
  unsigned int v554;
  v4 = 0;
  v381 = 0;
  v383 = 0;
  v449 = 0LL;
  *(void *)&__size[1] = 0LL;
  v502.name = "threads";
  v502.flag = (int *)&v449 + 1;
  v502.has_arg = 0;
  v502.val = 1;
  v503 = "dq";
  v505 = &v449;
  v504 = 0;
  v506 = 1;
  v507 = "boosts";
  v509 = &__size[2];
  v508 = 0;
  v510 = 1;
  v511 = "coalitions-only";
  v513 = &__size[1];
  v512 = 0;
  v514 = 1;
  v515 = "xpcinfo";
  v517 = 0LL;
  v516 = 2;
  v518 = 6;
  v519 = "precise";
  v521 = 0LL;
  v520 = 2;
  v522 = 5;
  v523 = "threadcounts";
  v525 = 0LL;
  v524 = 2;
  v526 = 1;
  v527 = "vouchers";
  v529 = 0LL;
  v528 = 2;
  v530 = 2;
  v531 = "coalitions";
  v378 = 1;
  v532 = 1;
  v533 = 0LL;
  v534 = 4;
  v535 = "verbose";
  v536 = 0;
  v537 = 0LL;
  v538 = 3;
  v539 = "all";
  v540 = 0;
  v541 = 0LL;
  v542 = 7;
  v543 = "help";
  v544 = 0;
  v545 = 0LL;
  v546 = 104;
  v547 = 0u;
  v548 = 0u;
  qword_1000100C8 = (uint64_t)&v502;
  v5 = 1;
  while (2)
  {
    switch(getopt_long(a1, a2, "h", &v502, &dword_1000100C0))
    {
      case -1:
        if (v4) {
          v11 = 1;
        }
        else {
          v11 = __size[1] == 0;
        }
        if (v11) {
          v12 = v4;
        }
        else {
          v12 = 2;
        }
        v350 = v12;
        if (optind >= a1)
        {
          v353 = 0;
          v354 = 0;
          __s1 = 0LL;
        }

        else
        {
          v13 = a2[optind];
          v14 = strtoul(v13, __endptr, 10);
          __s1 = (char *)v13;
          v354 = v14 >> 31 == 0 && v13 != __endptr[0];
          if (v354) {
            v15 = v14;
          }
          else {
            v15 = 0;
          }
          v353 = v15;
        }

        v16 = v378;
        v17 = v5;
        if (geteuid()) {
          sub_1000091BC();
        }
        else {
          v18 = 0;
        }
        byte_100010001 = v18;
        else {
          v19 = 0;
        }
        byte_100010002 = v19;
        else {
          v20 = 0;
        }
        byte_100010003 = v20;
        if (qword_100010010 != -1) {
          dispatch_once(&qword_100010010, &stru_10000C2E8);
        }
        v362 = dword_100010018;
        __size[0] = 0;
        *(void *)v549 = 0x800000001LL;
        v450 = 4LL;
        if (sysctl(v549, 2u, __size, &v450, 0LL, 0LL)) {
          sub_1000091A0();
        }
        v351 = (char *)malloc(__size[0]);
        if (!v351) {
          sub_100009044();
        }
        v21 = mach_timebase_info((mach_timebase_info_t)&dword_100010004);
        if (v21)
        {
          v343 = v21;
          v344 = "mach_timebase_info";
          goto LABEL_973;
        }

        v22 = mach_host_self();
        v23 = processor_set_default(v22, &default_set);
        if (v23)
        {
          v343 = v23;
          v344 = "processor_set_default";
          goto LABEL_973;
        }

        v24 = mach_host_self();
        v25 = host_processor_set_priv(v24, default_set, &set);
        if (v25)
        {
          v343 = v25;
          v344 = "host_processor_set_priv";
          goto LABEL_973;
        }

        task_list = 0LL;
        task_listCnt = 0;
        if (!v5 && (_DWORD)v449 == 0) {
          goto LABEL_59;
        }
        v26 = processor_set_tasks_with_flavor(set, 1u, &task_list, &task_listCnt);
        if ((_DWORD)v26) {
          mach_error("processor_set_tasks_with_flavor(TASK_FLAVOR_READ)", v26);
        }
        v27 = task_listCnt;
        if (task_listCnt) {
          goto LABEL_62;
        }
        v26 = fwrite("processor_set_tasks_with_flavor(TASK_FLAVOR_READ) returned 0 tasks", 0x42uLL, 1uLL, __stderrp);
        LODWORD(v449) = 0;
        v27 = task_listCnt;
        if (!task_listCnt)
        {
LABEL_59:
          v26 = processor_set_tasks_with_flavor(set, 2u, &task_list, &task_listCnt);
          if (!(_DWORD)v26)
          {
            v27 = task_listCnt;
            if (task_listCnt) {
              goto LABEL_61;
            }
            fwrite("processor_set_tasks_with_flavor(TASK_FLAVOR_INSPECT) returned 0 tasks", 0x45uLL, 1uLL, __stderrp);
LABEL_974:
            exit(1);
          }

          v343 = v26;
          v344 = "processor_set_tasks_with_flavor(TASK_FLAVOR_INSPECT)";
LABEL_973:
          mach_error(v344, v343);
          goto LABEL_974;
        }

LABEL_61:
        v17 = 0;
LABEL_62:
        if (!__s1) {
          v26 = printf("num tasks: %d\n\n", v27);
        }
        if (!__size[2]) {
          goto LABEL_77;
        }
        v28 = stackshot_config_create(v26);
        if (!v28)
        {
          fwrite("Unable to create stackshot config\n", 0x22uLL, 1uLL, __stderrp);
          goto LABEL_78;
        }

        Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, &kCFTypeDictionaryValueCallBacks);
        if (!Mutable)
        {
          fwrite("Unable to allocate boost dictionary\n", 0x24uLL, 1uLL, __stderrp);
          stackshot_config_dealloc(v28);
          goto LABEL_77;
        }

        cf = Mutable;
        if (stackshot_config_set_flags(v28, 73728LL))
        {
          v30 = __stderrp;
          v31 = "stackshot_config_set_flags failure\n";
          v32 = 35LL;
LABEL_75:
          fwrite(v31, v32, 1uLL, v30);
          goto LABEL_76;
        }

        if (stackshot_config_set_pid(v28, 0xFFFFFFFFLL))
        {
          v30 = __stderrp;
          v31 = "stackshot_config_set_pid failure\n";
          v32 = 33LL;
          goto LABEL_75;
        }

        if (stackshot_capture_with_config(v28))
        {
          v30 = __stderrp;
          v31 = "stackshot_capture_with_config failure\n";
          v32 = 38LL;
          goto LABEL_75;
        }

        stackshot_buffer = stackshot_config_get_stackshot_buffer(v28);
        v317 = stackshot_buffer + stackshot_config_get_stackshot_size(v28);
        v318 = stackshot_buffer + 16;
        if (stackshot_buffer + 16 > v317)
        {
          v16 = v378;
          goto LABEL_79;
        }

        pidb = v17;
        v319 = 0LL;
        v320 = 0LL;
        v321 = 0LL;
        v322 = 0LL;
        v323 = 1;
        while (1)
        {
          v324 = *(unsigned int *)(stackshot_buffer + 4);
          v325 = v318 + v324;
          if (v318 + v324 > v317 || (v326 = *(_DWORD *)stackshot_buffer, *(_DWORD *)stackshot_buffer == -242132755))
          {
LABEL_954:
            v16 = v378;
            v17 = pidb;
            goto LABEL_79;
          }

          if ((v326 & 0xFFFFFFF0) == 0x20) {
            v327 = 17;
          }
          else {
            v327 = *(_DWORD *)stackshot_buffer;
          }
          if (v327 > 19)
          {
            if (v327 == 20)
            {
              if ((v323 & 1) != 0)
              {
                v323 = 1;
                goto LABEL_953;
              }

              if (*(void *)(stackshot_buffer + 8) != v321)
              {
                v323 = 0;
                goto LABEL_953;
              }

              if (v322)
              {
                v374 = v321;
                if (!v319 || v320)
                {
                  if (v319)
                  {
                    for (i = 0LL; i != v319; ++i)
                    {
                      v331 = (const void *)*(int *)(v320 + 4 * i);
                      if ((_DWORD)v331 != v322[21])
                      {
                        v332 = v28;
                        Value = (void *)CFDictionaryGetValue(cf, v331);
                        if (!Value)
                        {
                          Value = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, 0LL);
                          CFDictionarySetValue(cf, (const void *)*(int *)(v320 + 4 * i), Value);
                          CFRelease(Value);
                        }

                        CFArrayAppendValue((CFMutableArrayRef)Value, v322);
                        v28 = v332;
                      }
                    }

                    v325 = v318 + *(unsigned int *)(stackshot_buffer + 4);
                    v323 = 1;
                    v321 = v374;
                  }

                  else
                  {
                    v323 = 1;
                  }

                  goto LABEL_953;
                }

                fwrite( "Donating pids count was non-zero with a NULL array while generating boost map\n",  0x4EuLL,  1uLL,  __stderrp);
LABEL_960:
                v16 = v378;
                goto LABEL_963;
              }

              v340 = __stderrp;
              v341 = "Encountered container end without a corresponding task snapshot while generating boost map\n";
              v342 = 91LL;
            }

            else
            {
              if (v327 != 2309) {
                goto LABEL_953;
              }
              if ((v323 & 1) == 0)
              {
                v323 = 0;
                v322 = (_DWORD *)(stackshot_buffer + 16);
                goto LABEL_953;
              }

              v340 = __stderrp;
              v341 = "Encountered task snapshot outside of a container while generating boost map\n";
              v342 = 76LL;
            }

            fwrite(v341, v342, 1uLL, v340);
            goto LABEL_960;
          }

          if (v327 == 17) {
            break;
          }
          v16 = v378;
          if (v327 == 19)
          {
            if (v324 < 4 || v326 != 19)
            {
              v337 = __stderrp;
              v338 = "Encountered invalid container while generating boost map\n";
              v339 = 57LL;
              goto LABEL_962;
            }

            if (*(_DWORD *)(stackshot_buffer + 16) == 2307)
            {
              v322 = 0LL;
              v323 = 0;
              v320 = 0LL;
              v319 = 0LL;
              v321 = *(void *)(stackshot_buffer + 8);
            }
          }

LABEL_953:
          v318 = v325 + 16;
          stackshot_buffer = v325;
          if (v325 + 16 > v317) {
            goto LABEL_954;
          }
        }

        v16 = v378;
        if (v326 != 17 && (v326 & 0xFFFFFFF0) != 0x20) {
          goto LABEL_956;
        }
        v328 = *(void *)(stackshot_buffer + 8);
        if (!(_DWORD)v328) {
          goto LABEL_935;
        }
        if (v326 != 17)
        {
          v334 = *(_DWORD *)stackshot_buffer & 0xF;
          v335 = v324 >= v334;
          v336 = v324 - v334;
          LODWORD(v324) = v336 % v328;
LABEL_935:
          if ((_DWORD)v324) {
            goto LABEL_956;
          }
          goto LABEL_950;
        }

        if (SHIDWORD(v328) <= 2310)
        {
          switch(HIDWORD(v328))
          {
            case 0x30:
              v329 = 20;
              break;
            case 0x31:
              v329 = 24;
              break;
            case 0x81A:
LABEL_941:
              v329 = 8;
              break;
            default:
              goto LABEL_956;
          }
        }

        else
        {
          switch(HIDWORD(v328))
          {
            case 0x907:
              v329 = 4;
              break;
            case 0x908:
            case 0x909:
              goto LABEL_956;
            case 0x90A:
            case 0x90C:
              goto LABEL_941;
            case 0x90B:
            case 0x90D:
              v329 = 16;
              break;
            default:
              if (HIDWORD(v328) != 2369) {
                goto LABEL_956;
              }
              v329 = 48;
              break;
          }
        }

        if (v324 / v329 >= v328 && v324 % v328 < 0x10)
        {
LABEL_950:
          if (HIDWORD(v328) == 2311)
          {
            if ((v323 & 1) != 0)
            {
              v337 = __stderrp;
              v338 = "Encountered donating pids array outside of a container while generating boost map\n";
              v339 = 82LL;
              goto LABEL_962;
            }

            v323 = 0;
            v320 = stackshot_buffer + 16;
            v319 = *(void *)(stackshot_buffer + 8);
          }

          goto LABEL_953;
        }

LABEL_956:
        v337 = __stderrp;
        v338 = "Encountered invalid array iterator while generating boost map\n";
        v339 = 62LL;
LABEL_962:
        fwrite(v338, v339, 1uLL, v337);
LABEL_963:
        v17 = pidb;
LABEL_76:
        stackshot_config_dealloc(v28);
        CFRelease(cf);
LABEL_77:
        v28 = 0LL;
LABEL_78:
        cf = 0LL;
LABEL_79:
        v346 = v28;
        v33 = calloc(4uLL, task_listCnt);
        v355 = v33;
        if (task_listCnt)
        {
          v34 = 0LL;
          v35 = v33;
          do
          {
            v36 = pid_for_task(task_list[v34], v35);
            if (v36) {
              mach_error("pid_for_task", v36);
            }
            ++v34;
            v37 = task_listCnt;
            ++v35;
          }

          while (v34 < task_listCnt);
          v38 = __size[1] == 0;
          if (task_listCnt)
          {
            v39 = v355;
            if (!__size[1])
            {
              v40 = 0LL;
              v349 = dispatch_queue_offsets[1];
              v345 = !v17;
              v379 = v16;
              do
              {
                v41 = v39[v40];
                act_list = 0LL;
                *(void *)x = 0LL;
                if (pid_for_task(task_list[v40], x))
                {
                  fprintf(__stderrp, "pid %d no longer active, skipping\n", v39[v40]);
                  goto LABEL_768;
                }

                if (x[0] != v39[v40]) {
                  fprintf(__stderrp, "task %d pid changed? from %d to %d\n", task_list[v40], v39[v40], x[0]);
                }
                if (proc_pidinfo(v41, 3, 0LL, buffer, 136) <= 135) {
                  perror("proc_pidinfo(... PROC_PIDTBSDINFO ...)");
                }
                if (proc_pidinfo(v41, 19, 0LL, v420, 8) <= 7) {
                  perror("proc_pidinfo(... PROC_PIDARCHINFO ...)");
                }
                *__error() = 0;
                *(void *)pid = v41;
                if (proc_pidinfo(v41, 12, 0LL, v416, 16) <= 15)
                {
                  if (*__error() == 3)
                  {
                    v369 = 0;
                    if ((_DWORD)v41) {
                      goto LABEL_104;
                    }
                    goto LABEL_106;
                  }

                  if (!(_DWORD)v41 && *__error() == 22)
                  {
                    v369 = 0;
                    goto LABEL_106;
                  }

                  perror("proc_pidinfo(, ... PROC_PIDWORKQUEUEINFO ...)");
                }

                v369 = 1;
                if ((_DWORD)v41)
                {
LABEL_104:
                  *(void *)v549 = 0x3100000001LL;
                  v549[2] = v41;
                  v450 = __size[0];
                  if (sysctl(v549, 3u, v351, &v450, 0LL, 0LL))
                  {
                    perror("sysctl(... KERN_PROCARGS2 ...)");
                    v371 = 0;
                    if (v494) {
                      v42 = &v494;
                    }
                    else {
                      v42 = (char *)&v493;
                    }
                  }

                  else
                  {
                    v42 = basename(v351 + 4);
                    v371 = 0;
                  }

                  goto LABEL_107;
                }

LABEL_106:
                v371 = 1;
                v42 = "kernel_task";
LABEL_107:
                if (__s1)
                {
                  if (v42)
                  {
                    if (strncmp(__s1, v42, 0x20uLL) && (!v354 || v353 != (_DWORD)v41)) {
                      goto LABEL_768;
                    }
                  }

                  else if (!v354 || v353 != (_DWORD)v41)
                  {
                    goto LABEL_768;
                  }
                }

                task_info_outCnt = 10;
                v43 = task_info(task_list[v40], 0x12u, &task_info_out, &task_info_outCnt);
                if (v43) {
                  mach_error("task_info(... TASK_BASIC_INFO ...)", v43);
                }
                task_info_outCnt = 4;
                v44 = task_info(task_list[v40], 3u, v435, &task_info_outCnt);
                if (v44) {
                  mach_error("task_info(... TASK_THREAD_TIMES_INFO ...)", v44);
                }
                task_info_outCnt = 26;
                v45 = task_info(task_list[v40], 0x1Au, v431, &task_info_outCnt);
                if (v45) {
                  mach_error("task_info(... TASK_POWER_INFO_V2 ...)", v45);
                }
                task_info_outCnt = 8;
                v46 = task_info(task_list[v40], 2u, v429, &task_info_outCnt);
                if (v46) {
                  mach_error("task_info(... TASK_EVENTS_INFO ...)", v46);
                }
                task_info_outCnt = 16;
                v47 = task_info(task_list[v40], 0x13u, v496, &task_info_outCnt);
                if (v47) {
                  mach_error("task_info(... TASK_EXTMOD_INFO ...)", v47);
                }
                task_info_outCnt = 4;
                v48 = task_info(task_list[v40], 0x10u, v427, &task_info_outCnt);
                if (v48) {
                  mach_error("task_info(... TASK_AFFINITY_TAG_INFO ...)", v48);
                }
                task_info_outCnt = 8;
                v49 = task_info(task_list[v40], 0xFu, v443, &task_info_outCnt);
                if (v49) {
                  mach_error("task_info(... TASK_AUDIT_TOKEN ...)", v49);
                }
                v50 = mach_port_space_basic_info(task_list[v40], &basic_info);
                if (v50) {
                  mach_error("mach_port_space_basic_info()", v50);
                }
                if ((v371 & 1) == 0)
                {
                  LODWORD(__endptr[0]) = 0;
                  task_info_outCnt = 16;
                  v51 = task_policy_get(task_list[v40], 4u, policy_info, &task_info_outCnt, (BOOLean_t *)__endptr);
                  if (v51) {
                    mach_error("task_policy_get(... TASK_POLICY_STATE ...)", v51);
                  }
                }

                if (proc_pidinfo(v41, 20, 0LL, &v418, 40) <= 39) {
                  perror("proc_pidinfo(... PROC_PIDCOALITIONINFO ...)");
                }
                if (proc_pidinfo(v41, 17, 0LL, uu, 56) <= 55) {
                  perror("proc_pidinfo(... PROC_PIDUNIQIDENTIFIERINFO ...)");
                }
                if (proc_pid_rusage(v41, 6, v463)) {
                  perror("proc_pid_rusage");
                }
                if (proc_get_dirty(v41, &flags)) {
                  perror("proc_get_dirty");
                }
                if (HIDWORD(v449))
                {
                  v52 = task_threads(task_list[v40], &act_list, (mach_msg_type_number_t *)&x[1]);
                  if (v52) {
                    mach_error("task_threads", v52);
                  }
                }

                printf("process: %s [%d]\n", v42, v41);
                printf("unique ID/version: %llu / %d\n", v490, v491);
                printf( "audit: { auid %d uid %u gid %u ruid %u rgid %u pid %u asid %u version %u}\n",  v443[0],  v443[1],  v443[2],  v443[3],  v443[4],  v443[5],  v443[6],  v443[7]);
                uuid_unparse(uu, out);
                printf("executable uuid: %s\n", out);
                v367 = v40;
                if (v420[0] == 7)
                {
                  v55 = "i386";
                  v53 = v41;
                }

                else
                {
                  v53 = v41;
                  if (v420[0] == 16777223)
                  {
                    v55 = "x86_64";
                  }

                  else
                  {
                    if (v420[0] == 16777228)
                    {
                      v54 = (v420[1] & 0xFFFFFF) == 2;
                      v55 = "arm64";
                      v56 = "arm64e";
                    }

                    else
                    {
                      v54 = v420[0] == 12;
                      v55 = "???";
                      v56 = "arm";
                    }

                    if (v54) {
                      v55 = v56;
                    }
                  }
                }

                key = (const void *)v53;
                printf("architecture: %s\n", v55);
                v57 = 0;
                v58 = 1;
                do
                {
                  v59 = v58;
                  if (v16)
                  {
                    v60 = sub_1000085D8();
                    v62 = v61;
                    if ((v57 & 1) == 0) {
                      goto LABEL_155;
                    }
                  }

                  else
                  {
                    v62 = 0LL;
                    v60 = 0LL;
                    if ((v57 & 1) == 0)
                    {
LABEL_155:
                      printf("coalition (type %d RESOURCE) ID: %llu\n", 0, v418);
                      if (v16) {
                        goto LABEL_191;
                      }
                      goto LABEL_192;
                    }
                  }

                  v63 = v419;
                  printf("coalition (type %d JETSAM) ID: %llu", 1, v419);
                  if (byte_100010001) {
                    v64 = byte_100010002 == 0;
                  }
                  else {
                    v64 = 1;
                  }
                  if (v64 || (byte_10001001C & 1) != 0) {
                    goto LABEL_183;
                  }
                  *(_OWORD *)__endptr = 0u;
                  v551 = 0u;
                  if (coalition_info_debug_info(v63, __endptr, 32LL) != -1)
                  {
                    v65 = "A";
                    if ((BYTE4(__endptr[1]) & 2) == 0) {
                      v65 = "-";
                    }
                    v66 = "U";
                    if ((WORD2(__endptr[1]) & 0x100) == 0) {
                      v66 = "-";
                    }
                    v67 = "E";
                    if ((BYTE4(__endptr[1]) & 1) == 0) {
                      v67 = "-";
                    }
                    v68 = "C";
                    if ((BYTE4(__endptr[1]) & 4) == 0) {
                      v68 = "-";
                    }
                    v69 = "B";
                    if ((BYTE4(__endptr[1]) & 8) == 0) {
                      v69 = "-";
                    }
                    v70 = "X";
                    if ((WORD2(__endptr[1]) & 0x200) == 0) {
                      v70 = "-";
                    }
                    v71 = "T";
                    if ((WORD2(__endptr[1]) & 0x400) == 0) {
                      v71 = "-";
                    }
                    v72 = "G";
                    if ((WORD2(__endptr[1]) & 0x800) == 0) {
                      v72 = "-";
                    }
                    v73 = "P";
                    if ((WORD2(__endptr[1]) & 0x1000) == 0) {
                      v73 = "-";
                    }
                    printf( " group 0x%llx (%s%s%s%s%s%s%s%s%s, 0x%d)",  __endptr[0],  v65,  v66,  v67,  v68,  v69,  v70,  v71,  v72,  v73,  LODWORD(__endptr[1]));
LABEL_183:
                    if (!v16) {
                      goto LABEL_185;
                    }
LABEL_184:
                    printf(" (%s, %s)", v60, v62);
                    goto LABEL_185;
                  }

                  sub_100009178();
                  if (v16) {
                    goto LABEL_184;
                  }
LABEL_185:
                  v74 = coalition_policy_get(v63, 1LL);
                  if (v74 == 1)
                  {
                    printf(" suppressed (BG)");
                  }

                  else if (v74 == -1 && (byte_10001000C & 1) == 0)
                  {
                    sub_100009150();
                  }

                  putchar(10);
                  if (v16)
                  {
LABEL_191:
                    free(v60);
                    free(v62);
                  }

LABEL_192:
                  v58 = 0;
                  v57 = 1;
                }

                while ((v59 & 1) != 0);
                v75 = v425;
                v76 = v426;
                printf("suspend count: %d\n", task_info_out);
                v77 = (double)v437;
                if (v437 <= 0x8000000000000LL)
                {
                  if (v437 <= 0x20000000000LL)
                  {
                    if (v437 <= 0x80000000)
                    {
                      if (v437 <= 0x200000)
                      {
                        if (v437 > 0x800) {
                          v77 = v77 * 0.0009765625;
                        }
                        v78 = (const char *)&unk_100009E75;
                        if (v437 > 0x800) {
                          v78 = "Ki";
                        }
                      }

                      else
                      {
                        v77 = v77 * 0.000000953674316;
                        v78 = "Mi";
                      }
                    }

                    else
                    {
                      v77 = v77 * 9.31322575e-10;
                      v78 = "Gi";
                    }
                  }

                  else
                  {
                    v77 = v77 * 9.09494702e-13;
                    v78 = "Ti";
                  }
                }

                else
                {
                  v77 = v77 * 8.8817842e-16;
                  v78 = "Pi";
                }

                v79 = (double)v465;
                if (v465 <= 0x8000000000000LL)
                {
                  if (v465 <= 0x20000000000LL)
                  {
                    if (v465 <= 0x80000000)
                    {
                      if (v465 <= 0x200000)
                      {
                        if (v465 > 0x800) {
                          v79 = v79 * 0.0009765625;
                        }
                        v80 = (const char *)&unk_100009E75;
                        if (v465 > 0x800) {
                          v80 = "Ki";
                        }
                      }

                      else
                      {
                        v79 = v79 * 0.000000953674316;
                        v80 = "Mi";
                      }
                    }

                    else
                    {
                      v79 = v79 * 9.31322575e-10;
                      v80 = "Gi";
                    }
                  }

                  else
                  {
                    v79 = v79 * 9.09494702e-13;
                    v80 = "Ti";
                  }
                }

                else
                {
                  v79 = v79 * 8.8817842e-16;
                  v80 = "Pi";
                }

                v81 = (double)v478;
                if (v478 <= 0x8000000000000LL)
                {
                  if (v478 <= 0x20000000000LL)
                  {
                    if (v478 <= 0x80000000)
                    {
                      if (v478 <= 0x200000)
                      {
                        if (v478 > 0x800) {
                          v81 = v81 * 0.0009765625;
                        }
                        v82 = (const char *)&unk_100009E75;
                        if (v478 > 0x800) {
                          v82 = "Ki";
                        }
                      }

                      else
                      {
                        v81 = v81 * 0.000000953674316;
                        v82 = "Mi";
                      }
                    }

                    else
                    {
                      v81 = v81 * 9.31322575e-10;
                      v82 = "Gi";
                    }
                  }

                  else
                  {
                    v81 = v81 * 9.09494702e-13;
                    v82 = "Ti";
                  }
                }

                else
                {
                  v81 = v81 * 8.8817842e-16;
                  v82 = "Pi";
                }

                printf( "virtual bytes: %.2f %s%s; phys_footprint bytes: %.2f %s%s; phys_footprint lifetime maximum bytes: %.2f %s%s\n",
                  v77,
                  v78,
                  "B",
                  v79,
                  v80,
                  "B",
                  v81,
                  v82,
                  "B");
                if (v488)
                {
                  v83 = (double)v487;
                  if (v487 <= 0x8000000000000LL)
                  {
                    if (v487 <= 0x20000000000LL)
                    {
                      if (v487 <= 0x80000000)
                      {
                        if (v487 <= 0x200000)
                        {
                          if (v487 > 0x800) {
                            v83 = v83 * 0.0009765625;
                          }
                          v84 = (const char *)&unk_100009E75;
                          if (v487 > 0x800) {
                            v84 = "Ki";
                          }
                        }

                        else
                        {
                          v83 = v83 * 0.000000953674316;
                          v84 = "Mi";
                        }
                      }

                      else
                      {
                        v83 = v83 * 9.31322575e-10;
                        v84 = "Gi";
                      }
                    }

                    else
                    {
                      v83 = v83 * 9.09494702e-13;
                      v84 = "Ti";
                    }
                  }

                  else
                  {
                    v83 = v83 * 8.8817842e-16;
                    v84 = "Pi";
                  }

                  v85 = (double)v488;
                  if (v488 <= 0x8000000000000LL)
                  {
                    if (v488 <= 0x20000000000LL)
                    {
                      if (v488 <= 0x80000000)
                      {
                        if (v488 <= 0x200000)
                        {
                          if (v488 > 0x800) {
                            v85 = v85 * 0.0009765625;
                          }
                          v86 = (const char *)&unk_100009E75;
                          if (v488 > 0x800) {
                            v86 = "Ki";
                          }
                        }

                        else
                        {
                          v85 = v85 * 0.000000953674316;
                          v86 = "Mi";
                        }
                      }

                      else
                      {
                        v85 = v85 * 9.31322575e-10;
                        v86 = "Gi";
                      }
                    }

                    else
                    {
                      v85 = v85 * 9.09494702e-13;
                      v86 = "Ti";
                    }
                  }

                  else
                  {
                    v85 = v85 * 8.8817842e-16;
                    v86 = "Pi";
                  }

                  printf( "neural footprint: %.2f %s%s neural footprint lifetime maximum bytes: %.2f %s%s\n",  v83,  v84,  "B",  v85,  v86,  "B");
                }

                v365 = v75;
                v87 = time(0LL);
                printf("run time: %lld s\n", v87 - v495);
                printf( "user/system time    (current threads): %lf s / %lf s\n",  (double)v435[1] / 1000000.0 + (double)v435[0],  (double)v435[3] / 1000000.0 + (double)v435[2]);
                printf( "user/system time (terminated threads): %lf s / %lf s\n",  (double)v439 / 1000000.0 + (double)v438,  (double)v441 / 1000000.0 + (double)v440);
                __endptr[0] = v479;
                __endptr[1] = v480;
                v551 = v464;
                v552 = v485;
                v360 = v480;
                v361 = v479;
                v455 = v479;
                v456 = v480;
                v358 = v464.i64[1];
                v359 = v464.i64[0];
                v457 = v464;
                v357 = v485;
                v458 = v485;
                sub_10000867C("CPU time:", (unint64_t *)__endptr, &v455, 0, (const char *)&unk_100009E75);
                if (v362 >= 2)
                {
                  v348 = v485 - v486;
                  v347.i64[1] = v464.i64[1] - v482.i64[1];
                  v347.i64[0] = v464.i64[0] - v482.i64[0];
                  v88 = (char *)(v480 - v484);
                  v89 = (char *)(v479 - v483);
                  __endptr[0] = v483;
                  __endptr[1] = v484;
                  v551 = v482;
                  v552 = v486;
                  v455 = v361;
                  v456 = v360;
                  v457.i64[0] = v359;
                  v457.i64[1] = v358;
                  v458 = v357;
                  sub_10000867C("P-time:  ", (unint64_t *)__endptr, &v455, 1, (const char *)&unk_100009E75);
                  __endptr[0] = v89;
                  __endptr[1] = v88;
                  v551 = v347;
                  v552 = v348;
                  v455 = v361;
                  v456 = v360;
                  v457.i64[0] = v359;
                  v457.i64[1] = v358;
                  v458 = v357;
                  sub_10000867C("E-time:  ", (unint64_t *)__endptr, &v455, 1, (const char *)&unk_100009E75);
                  if (v430) {
                    v90 = (double)v434 * 100.0 / (double)(unint64_t)v430;
                  }
                  else {
                    v90 = 0.0;
                  }
                  printf("P/E switches: %llu (%.0f%%)\n", v434, v90);
                  v16 = v379;
                }

                printf( "CPU time billed to me by others: %llu.%06llu s ",  v475 * (unint64_t)dword_100010004 / unk_100010008 / 0x3B9ACA00,  v475 * (unint64_t)dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8);
                sub_100008B94();
                putchar(10);
                v91 = 0.0;
                v92 = 0.0;
                if (v464.i64[1] + v464.i64[0]) {
                  v92 = (double)v476 * 100.0 / (double)(unint64_t)(v464.i64[1] + v464.i64[0]);
                }
                printf( "CPU time I billed to others: %llu.%06llu s (%.0f%%) ",  v476 * dword_100010004 / unk_100010008 / 0x3B9ACA00,  v476 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8,  v92);
                sub_100008B94();
                if (v485) {
                  v91 = (double)v481 * 100.0 / (double)v485;
                }
                printf(" (%.0f%%)\n", v91);
                v93 = v474 * (unint64_t)dword_100010004 / unk_100010008;
                v94 = v473 * (unint64_t)dword_100010004 / unk_100010008;
                v95 = v472 * (unint64_t)dword_100010004 / unk_100010008;
                v96 = v471 * (unint64_t)dword_100010004 / unk_100010008;
                printf( "QoS time (s): UI: %llu.%06llu IN: %llu.%06llu DF: %llu.%06llu UT: %llu.%06llu BG: %llu.%06llu MT: %llu .%06llu UN: %llu.%06llu\n",  v93 / 0x3B9ACA00,  v93 % 0x3B9ACA00 / 0x3E8,  v94 / 0x3B9ACA00,  v94 % 0x3B9ACA00 / 0x3E8,  v95 / 0x3B9ACA00,  v95 % 0x3B9ACA00 / 0x3E8,  v96 / 0x3B9ACA00,  v96 % 0x3B9ACA00 / 0x3E8,  v470 * (unint64_t)dword_100010004 / unk_100010008 / 0x3B9ACA00,  v470 * (unint64_t)dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8,  v469 * (unint64_t)dword_100010004 / unk_100010008 / 0x3B9ACA00,  v469 * (unint64_t)dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8,  v468 * (unint64_t)dword_100010004 / unk_100010008 / 0x3B9ACA00,  v468 * (unint64_t)dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8);
                if (v432) {
                  v97 = (double)v433 * 100.0 / (double)v432;
                }
                else {
                  v97 = 0.0;
                }
                printf("interrupt wakeups: %llu (%llu / %.2f%% from platform idle)\n", v432, v433, v97);
                if (v442 >= 3)
                {
                  v98 = "???";
                  if (v442 == 4) {
                    v98 = "POLICY_FIFO";
                  }
                }

                else
                {
                  v98 = off_10000C408[v442];
                }

                printf("default sched policy: %s\n", v98);
                v99 = (double)v466;
                if (v466 <= 0x8000000000000LL)
                {
                  if (v466 <= 0x20000000000LL)
                  {
                    if (v466 <= 0x80000000)
                    {
                      if (v466 <= 0x200000)
                      {
                        if (v466 > 0x800) {
                          v99 = v99 * 0.0009765625;
                        }
                        v100 = (const char *)&unk_100009E75;
                        if (v466 > 0x800) {
                          v100 = "Ki";
                        }
                      }

                      else
                      {
                        v99 = v99 * 0.000000953674316;
                        v100 = "Mi";
                      }
                    }

                    else
                    {
                      v99 = v99 * 9.31322575e-10;
                      v100 = "Gi";
                    }
                  }

                  else
                  {
                    v99 = v99 * 9.09494702e-13;
                    v100 = "Ti";
                  }
                }

                else
                {
                  v99 = v99 * 8.8817842e-16;
                  v100 = "Pi";
                }

                v101 = (double)v467;
                if (v467 <= 0x8000000000000LL)
                {
                  if (v467 <= 0x20000000000LL)
                  {
                    if (v467 <= 0x80000000)
                    {
                      if (v467 <= 0x200000)
                      {
                        if (v467 > 0x800) {
                          v101 = v101 * 0.0009765625;
                        }
                        v102 = (const char *)&unk_100009E75;
                        if (v467 > 0x800) {
                          v102 = "Ki";
                        }
                      }

                      else
                      {
                        v101 = v101 * 0.000000953674316;
                        v102 = "Mi";
                      }
                    }

                    else
                    {
                      v101 = v101 * 9.31322575e-10;
                      v102 = "Gi";
                    }
                  }

                  else
                  {
                    v101 = v101 * 9.09494702e-13;
                    v102 = "Ti";
                  }
                }

                else
                {
                  v101 = v101 * 8.8817842e-16;
                  v102 = "Pi";
                }

                v103 = (double)v477;
                if (v477 <= 0x8000000000000LL)
                {
                  v105 = v369;
                  if (v477 <= 0x20000000000LL)
                  {
                    if (v477 <= 0x80000000)
                    {
                      if (v477 <= 0x200000)
                      {
                        if (v477 > 0x800) {
                          v103 = v103 * 0.0009765625;
                        }
                        v104 = (const char *)&unk_100009E75;
                        if (v477 > 0x800) {
                          v104 = "Ki";
                        }
                      }

                      else
                      {
                        v103 = v103 * 0.000000953674316;
                        v104 = "Mi";
                      }
                    }

                    else
                    {
                      v103 = v103 * 9.31322575e-10;
                      v104 = "Gi";
                    }
                  }

                  else
                  {
                    v103 = v103 * 9.09494702e-13;
                    v104 = "Ti";
                  }
                }

                else
                {
                  v103 = v103 * 8.8817842e-16;
                  v104 = "Pi";
                  v105 = v369;
                }

                printf( "bytes read: %.2f %s%s written: %.2f %s%s logical writes: %.2f %s%s\n",  v99,  v100,  "B",  v101,  v102,  "B",  v103,  v104,  "B");
                if (basic_info.iisb_table_size) {
                  v106 = (double)basic_info.iisb_table_inuse * 100.0 / (double)basic_info.iisb_table_size;
                }
                else {
                  v106 = 0.0;
                }
                printf("mach ports: %d (%.0f%% occupied)\n", basic_info.iisb_table_inuse, v106);
                printf( "faults: %d, pageins: %d, cow_faults: %d, msgsent: %d, msgrecv: %d, syscalls (mach/unix): %d / %d, csw: %d\n",  v429[0],  v429[1],  v429[2],  v429[3],  v429[4],  v429[5],  v429[6],  v430);
                if (v428) {
                  printf("affinity sets: %d tasks: %d (min: %d max: %d)", v427[0], v428, v427[1], v427[2]);
                }
                v107.i64[0] = v497;
                v107.i64[1] = v499;
                if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32( (int32x4_t)vceqzq_s64(v107),  (int32x4_t)vceqzq_s64(v500))))) & 1) != 0 || v498 || v501)
                {
                  printf( "extmod: task for pid: %lld (%lld) thread injection: %lld (%lld) set state: %lld (%lld)\n",  v497,  v498,  v499,  v500.i64[0],  v500.i64[1],  v501);
                }

                if (v105)
                {
                  printf("workqueue threads: %d running: %d blocked: %d", v416[0], v416[1], v416[2]);
                  v108 = v417;
                  if ((v417 & 1) != 0)
                  {
                    printf(" constrained-limit");
                    v108 = v417;
                    if ((v417 & 2) != 0) {
                      goto LABEL_353;
                    }
LABEL_325:
                    if ((v108 & 8) == 0) {
                      goto LABEL_326;
                    }
LABEL_354:
                    printf(" cooperative-limit");
                    if ((v417 & 0x10) != 0) {
LABEL_327:
                    }
                      printf(" active-constrained-limit");
                  }

                  else
                  {
                    if ((v417 & 2) == 0) {
                      goto LABEL_325;
                    }
LABEL_353:
                    printf(" total-limit");
                    v108 = v417;
                    if ((v417 & 8) != 0) {
                      goto LABEL_354;
                    }
LABEL_326:
                    if ((v108 & 0x10) != 0) {
                      goto LABEL_327;
                    }
                  }

                  putchar(10);
                }

                printf("CPU usage monitor: ");
                if (proc_get_cpumon_params(*(void *)pid, __endptr, &v455))
                {
                  sub_100009128();
                }

                else if (SLODWORD(__endptr[0]) > 0 || (int)v455 >= 1)
                {
                  printf("%d%% CPU over %d seconds\n", LODWORD(__endptr[0]), (_DWORD)v455);
                }

                else
                {
                  puts("none");
                }

                printf("CPU wakes monitor: ");
                if (proc_get_wakemon_params(*(void *)pid, v460, v391))
                {
                  sub_100009100();
                }

                else if (v460[0] < 1)
                {
                  puts("none");
                }

                else
                {
                  printf("%d wakes per second (over system-default time period)\n", v460[0]);
                }

                v109 = "tracked";
                if ((flags & 1) == 0) {
                  v109 = "untracked";
                }
                v110 = (const char *)&unk_100009E75;
                if ((~flags & 3) == 0) {
                  v110 = "idle-exit";
                }
                v111 = "dirty";
                if ((flags & 5) == 1) {
                  v111 = "clean";
                }
                printf("dirty tracking: %s %s %s\n", v109, v110, v111);
                if ((v371 & 1) == 0)
                {
                  printf("boosts: %d (%d externalized)\n", v422, v423);
                  if (cf && v422)
                  {
                    v112 = (const __CFArray *)CFDictionaryGetValue(cf, key);
                    if (v112)
                    {
                      v113 = v112;
                      if (CFArrayGetCount(v112) >= 1)
                      {
                        v114 = 0LL;
                        do
                        {
                          ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v113, v114);
                          printf("\tboosted by: %s [%d]\n", ValueAtIndex + 88, *((_DWORD *)ValueAtIndex + 21));
                          ++v114;
                        }

                        while (v114 < CFArrayGetCount(v113));
                      }
                    }

                    else
                    {
                      puts("\tsource(s) of boost(s) unknown");
                    }
                  }

                  puts("requested policy");
                  printf("\treq apptype: %s\n", off_10000C358[(v365 >> 17) & 7]);
                  v116 = (v365 >> 21) & 0x1F;
                  v117 = "???";
                  if (v116 <= 8) {
                    v117 = off_10000C3C0[v116];
                  }
                  printf("\treq role: %s\n", v117);
                  v118 = (v365 >> 33) & 7;
                  if ((_DWORD)v118 != 7 && ((0x7Du >> v118) & 1) != 0)
                  {
                    v119 = off_10000C420[v118];
                  }

                  else
                  {
                    v11 = (_DWORD)v118 == 1;
                    v119 = "???";
                    if (v11) {
                      v119 = "THREAD_QOS_MAINTENANCE";
                    }
                  }

                  printf("\treq qos clamp: %s\n", v119);
                  v120 = (v365 >> 11) & 7;
                  v121 = v120 == 6;
                  if (v120 >= 6)
                  {
                    v122 = "???";
                    if (v121) {
                      v122 = "LATENCY_QOS_TIER_5";
                    }
                  }

                  else
                  {
                    v122 = off_10000C458[v120];
                  }

                  v123 = (v365 >> 26) & 7;
                  v124 = v123 == 6;
                  if (v123 >= 6)
                  {
                    v125 = "???";
                    if (v124) {
                      v125 = "LATENCY_QOS_TIER_5";
                    }
                  }

                  else
                  {
                    v125 = off_10000C458[v123];
                  }

                  printf("\treq base/override latency qos: %s / %s\n", v122, v125);
                  v126 = (v365 >> 14) & 7;
                  v127 = v126 == 6;
                  if (v126 >= 6)
                  {
                    v128 = "???";
                    if (v127) {
                      v128 = "THROUGHPUT_QOS_TIER_5";
                    }
                  }

                  else
                  {
                    v128 = off_10000C488[v126];
                  }

                  v129 = v365 >> 29;
                  v130 = "THROUGHPUT_QOS_TIER_UNSPECIFIED";
                  if ((_DWORD)v129)
                  {
                    if ((v129 - 1) >= 5)
                    {
                      v130 = "???";
                      if ((_DWORD)v129 == 6) {
                        v130 = "THROUGHPUT_QOS_TIER_5";
                      }
                    }

                    else
                    {
                      v130 = off_10000C398[v129 - 1];
                    }
                  }

                  printf("\treq base/override thruput qos: %s / %s\n", v128, v130);
                  v131 = "NO";
                  if ((v365 & 3) != 0) {
                    v131 = "YES";
                  }
                  v132 = (const char *)&unk_100009E75;
                  v133 = "(internal)";
                  if ((v365 & 1) == 0) {
                    v133 = (const char *)&unk_100009E75;
                  }
                  if ((v365 & 2) != 0) {
                    v132 = "(external)";
                  }
                  printf("\treq darwin BG: %s %s %s\n", v131, v133, v132);
                  v134 = (v365 >> 2) & 3;
                  v135 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                  if (v134 != 3) {
                    v135 = off_10000C4B8[v134];
                  }
                  v136 = (v365 >> 4) & 3;
                  v137 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                  if (v136 != 3) {
                    v137 = off_10000C4B8[v136];
                  }
                  printf("\treq internal/external iotier: %s / %s\n", v135, v137);
                  v138 = (v365 >> 8) & 3;
                  v139 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                  if (v138 != 3) {
                    v139 = off_10000C4B8[v138];
                  }
                  printf("\treq darwin BG iotier: %s\n", v139);
                  v140 = "NO";
                  printf("\treq managed: %s\n", v140);
                  printf("\treq other: ");
                  if ((v365 & 0x40) != 0)
                  {
                    printf("passive-int ");
                    if ((v365 & 0x80) != 0) {
                      goto LABEL_408;
                    }
LABEL_398:
                    if ((v365 & 0x400) == 0) {
                      goto LABEL_399;
                    }
LABEL_409:
                    printf("terminated ");
                    if ((v365 & 0x100000) != 0) {
LABEL_400:
                    }
                      printf("boosted ");
                  }

                  else
                  {
                    if ((v365 & 0x80) == 0) {
                      goto LABEL_398;
                    }
LABEL_408:
                    printf("passive-ext ");
                    if ((v365 & 0x400) != 0) {
                      goto LABEL_409;
                    }
LABEL_399:
                    if ((v365 & 0x100000) != 0) {
                      goto LABEL_400;
                    }
                  }

                  putchar(10);
                  printf("\treq suppression (App Nap) behaviors: ");
                  if ((v365 & 0x1000000000LL) == 0)
                  {
                    if ((v365 & 0x2000000000LL) == 0) {
                      goto LABEL_403;
                    }
LABEL_412:
                    printf("low-priority-cpu (4) ");
                    if ((v365 & 0x200000000000LL) == 0) {
                      goto LABEL_405;
                    }
LABEL_404:
                    printf("low-priority-cpu (28) ");
                    goto LABEL_405;
                  }

                  printf("active ");
                  if ((v365 & 0x2000000000LL) != 0) {
                    goto LABEL_412;
                  }
LABEL_403:
                  if ((v365 & 0x200000000000LL) != 0) {
                    goto LABEL_404;
                  }
LABEL_405:
                  v141 = "LATENCY_QOS_TIER_0";
                  switch((v365 >> 38) & 7)
                  {
                    case 0uLL:
                      break;
                    case 1uLL:
                      goto LABEL_420;
                    case 2uLL:
                      v141 = "LATENCY_QOS_TIER_1";
                      goto LABEL_420;
                    case 3uLL:
                      v141 = "LATENCY_QOS_TIER_2";
                      goto LABEL_420;
                    case 4uLL:
                      v141 = "LATENCY_QOS_TIER_3";
                      goto LABEL_420;
                    case 5uLL:
                      v141 = "LATENCY_QOS_TIER_4";
                      goto LABEL_420;
                    default:
                      v141 = "???";
LABEL_420:
                      printf("timer-throttling (%s) ", v141);
                      break;
                  }

                  v142 = "THROUGHPUT_QOS_TIER_0";
                  switch((v365 >> 42) & 7)
                  {
                    case 0uLL:
                      goto LABEL_430;
                    case 1uLL:
                      goto LABEL_429;
                    case 2uLL:
                      v142 = "THROUGHPUT_QOS_TIER_1";
                      goto LABEL_429;
                    case 3uLL:
                      v142 = "THROUGHPUT_QOS_TIER_2";
                      goto LABEL_429;
                    case 4uLL:
                      v142 = "THROUGHPUT_QOS_TIER_3";
                      goto LABEL_429;
                    case 5uLL:
                      v142 = "THROUGHPUT_QOS_TIER_4";
                      goto LABEL_429;
                    default:
                      v142 = "???";
LABEL_429:
                      printf("throughput-qos (%s) ", v142);
LABEL_430:
                      if ((v365 & 0x20000000000LL) != 0) {
                        printf("disk-throttling ");
                      }
                      if ((v365 & 0x400000000000LL) != 0) {
                        printf("bg-sockets ");
                      }
                      putchar(10);
                      puts("effective policy");
                      v143 = (v76 >> 20) & 0xF;
                      v144 = "???";
                      if (v143 <= 8) {
                        v144 = off_10000C3C0[v143];
                      }
                      printf("\teff role: %s\n", v144);
                      v145 = (v76 >> 11) & 7;
                      v146 = v145 == 6;
                      if (v145 >= 6)
                      {
                        v147 = "LATENCY_QOS_TIER_5";
                        if (!v146) {
                          v147 = "???";
                        }
                      }

                      else
                      {
                        v147 = off_10000C458[v145];
                      }

                      printf("\teff latency qos: %s\n", v147);
                      v148 = (v76 >> 14) & 7;
                      v149 = v148 == 6;
                      if (v148 >= 6)
                      {
                        v150 = "THROUGHPUT_QOS_TIER_5";
                        if (!v149) {
                          v150 = "???";
                        }
                      }

                      else
                      {
                        v150 = off_10000C488[v148];
                      }

                      printf("\teff thruput qos: %s\n", v150);
                      if ((v76 & 1) != 0) {
                        v151 = "YES";
                      }
                      else {
                        v151 = "NO";
                      }
                      printf("\teff darwin BG: %s\n", v151);
                      v152 = (v76 >> 2) & 3;
                      v153 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                      if (v152 != 3) {
                        v153 = off_10000C4B8[v152];
                      }
                      printf("\teff iotier: %s\n", v153);
                      if ((v76 & 0x2000000) != 0) {
                        v154 = "YES";
                      }
                      else {
                        v154 = "NO";
                      }
                      printf("\teff managed: %s\n", v154);
                      v155 = (v76 >> 30) & 7;
                      if ((_DWORD)v155 != 7 && ((0x7Du >> v155) & 1) != 0)
                      {
                        v156 = off_10000C420[v155];
                      }

                      else
                      {
                        v11 = (_DWORD)v155 == 1;
                        v156 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v156 = "???";
                        }
                      }

                      printf("\teff qos ceiling: %s\n", v156);
                      v157 = (v76 >> 27) & 7;
                      if (v157 != 7 && ((0x7Du >> v157) & 1) != 0)
                      {
                        v158 = off_10000C420[v157];
                      }

                      else
                      {
                        v11 = v157 == 1;
                        v158 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v158 = "???";
                        }
                      }

                      printf("\teff qos clamp: %s\n", v158);
                      printf("\teff other: ");
                      if ((v76 & 0x10) != 0) {
                        printf("passive ");
                      }
                      v159 = "low-priority-cpu (4) ";
                      if ((v76 & 2) != 0 || (v159 = "low-priority-cpu (28) ", (v76 & 0x1000000) != 0))
                      {
                        printf(v159);
                        if ((v76 & 0x20) == 0)
                        {
LABEL_469:
                          if ((v76 & 0x40) == 0) {
                            goto LABEL_470;
                          }
                          goto LABEL_495;
                        }
                      }

                      else if ((v76 & 0x20) == 0)
                      {
                        goto LABEL_469;
                      }

                      printf("bg-allsockets ");
                      if ((v76 & 0x40) == 0)
                      {
LABEL_470:
                        if ((v76 & 0x200) == 0) {
                          goto LABEL_471;
                        }
                        goto LABEL_496;
                      }

LABEL_495:
                      printf("bg-newsockets ");
                      if ((v76 & 0x200) == 0)
                      {
LABEL_471:
                        if ((v76 & 0x20000) == 0) {
                          goto LABEL_472;
                        }
                        goto LABEL_497;
                      }

LABEL_496:
                      printf("terminated ");
                      if ((v76 & 0x20000) == 0)
                      {
LABEL_472:
                        if ((v76 & 0x40000) == 0) {
                          goto LABEL_473;
                        }
                        goto LABEL_498;
                      }

LABEL_497:
                      printf("tal-engaged ");
                      if ((v76 & 0x40000) == 0)
                      {
LABEL_473:
                        if ((v76 & 0x80000) == 0) {
                          goto LABEL_474;
                        }
                        goto LABEL_499;
                      }

LABEL_498:
                      printf("bg-watchers ");
                      if ((v76 & 0x80000) == 0)
                      {
LABEL_474:
                        if ((v76 & 0x4000000) == 0) {
                          goto LABEL_475;
                        }
                        goto LABEL_500;
                      }

LABEL_499:
                      printf("suppression-active (App Nap) ");
                      if ((v76 & 0x4000000) == 0)
                      {
LABEL_475:
                        if ((v76 & 0x400) == 0) {
                          goto LABEL_476;
                        }
                        goto LABEL_501;
                      }

LABEL_500:
                      printf("live-donor ");
                      if ((v76 & 0x400) == 0)
                      {
LABEL_476:
                        if ((v76 & 0x400000000LL) == 0) {
                          goto LABEL_478;
                        }
LABEL_477:
                        printf("coalition-suppressed (BG) ");
                        goto LABEL_478;
                      }

LABEL_501:
                      printf("ui-is-urgent ");
                      if ((v76 & 0x400000000LL) != 0) {
                        goto LABEL_477;
                      }
LABEL_478:
                      putchar(10);
                      break;
                  }
                }

                if ((buffer[0] & 0x20000) != 0) {
                  v160 = "YES";
                }
                else {
                  v160 = "NO";
                }
                printf("ios-appledaemon: %s\n", v160);
                if ((buffer[0] & 0x80000) != 0) {
                  v161 = "YES";
                }
                else {
                  v161 = "NO";
                }
                printf("ios-imppromotion: %s\n", v161);
                if ((buffer[0] & 0x1000000) != 0) {
                  v162 = "YES";
                }
                else {
                  v162 = "NO";
                }
                printf("ios-application: %s\n", v162);
                v163 = pid[0];
                if ((v371 & 1) == 0)
                {
                  v164 = getpriority(7, pid[0]);
                  if (v164 == 1)
                  {
                    puts("game mode: ON");
                  }

                  else if (v164 == -1 && (byte_10001000D & 1) == 0)
                  {
                    sub_1000090D8();
                  }

                  v165 = getpriority(8, pid[0]);
                  if (v165 == 1)
                  {
                    puts("carplay mode: ON");
                  }

                  else if (v165 == -1 && (byte_10001000E & 1) == 0)
                  {
                    sub_1000090B0();
                  }

                  *__error() = 0;
                  v166 = getpriority(0, pid[0]);
                  if (v166)
                  {
                    v167 = v166;
                    if (v166 == -1 && *__error()) {
                      perror("getpriority(PRIO_PROCESS, pid)");
                    }
                    else {
                      printf("nice: %d\n", v167);
                    }
                  }

                  if ((v424 & 1) != 0)
                  {
                    v168 = "YES";
                    if ((v424 & 2) == 0)
                    {
                      v168 = "YES (boosted receiver)";
                      if (!v422) {
                        v168 = "NO";
                      }
                    }
                  }

                  else if ((v424 & 4) != 0)
                  {
                    v168 = "CURRENTLY";
                    if ((v424 & 2) == 0) {
                      v168 = "NOT CURRENTLY";
                    }
                  }

                  else if ((v424 & 2) != 0)
                  {
                    v168 = "YES";
                  }

                  else
                  {
                    v168 = "NO";
                  }

                  printf("imp_donor: %s\n", v168);
                  v169 = "DE-NAP";
                  if ((v424 & 8) == 0) {
                    v169 = "NO";
                  }
                  if ((v424 & 1) != 0) {
                    v170 = "YES";
                  }
                  else {
                    v170 = v169;
                  }
                  printf("imp_receiver: %s\n", v170);
                }

                if ((v424 & 0x10) != 0) {
                  v171 = "YES";
                }
                else {
                  v171 = "NO";
                }
                printf("pid suspended: %s\n", v171);
                if ((buffer[0] & 0x100000) != 0) {
                  v172 = "YES";
                }
                else {
                  v172 = "NO";
                }
                if ((buffer[0] & 0x200000) != 0) {
                  v173 = "YES";
                }
                else {
                  v173 = "NO";
                }
                printf("adaptive daemon: %s (boosted: %s)\n", v172, v173);
                if (HIDWORD(v449))
                {
                  puts("threads:");
                  if (x[1])
                  {
                    v174 = 0LL;
                    v370 = v371 | v345;
                    do
                    {
                      task_info_outCnt = 10;
                      v175 = thread_info(act_list[v174], 3u, thread_info_out, &task_info_outCnt);
                      if (v175) {
                        mach_error("thread_info(... THREAD_BASIC_INFO ...)", v175);
                      }
                      task_info_outCnt = 6;
                      v176 = thread_info(act_list[v174], 4u, (thread_info_t)v405, &task_info_outCnt);
                      if (v176) {
                        mach_error("thread_info(... THREAD_IDENTIFIER_INFO ...)", v176);
                      }
                      v177 = 0;
                      if ((_DWORD)v449 && v406)
                      {
                        v461 = 0;
                        overwrite = vm_read_overwrite( task_list[v367],  v406,  8uLL,  (vm_address_t)__endptr,  (vm_size_t *)&outsize);
                        if (overwrite)
                        {
                          v179 = overwrite;
                          v180 = "vm_read_overwrite(... &qaddr ...)";
LABEL_550:
                          mach_error(v180, v179);
                          v177 = 0;
                          goto LABEL_551;
                        }

                        v177 = 0;
                        if (outsize.i64[0] == 8 && __endptr[0])
                        {
                          v199 = vm_read_overwrite( task_list[v367],  (vm_address_t)&__endptr[0][v349],  8uLL,  (vm_address_t)v391,  (vm_size_t *)&outsize);
                          if (v199)
                          {
                            v179 = v199;
                            v180 = "vm_read_overwrite(... &label_addr ...)";
                            goto LABEL_550;
                          }

                          v177 = 0;
                          if (outsize.i64[0] == 8 && *(void *)v391)
                          {
                            v254 = vm_read_overwrite( task_list[v367],  *(vm_address_t *)v391,  0x40uLL,  (vm_address_t)v460,  (vm_size_t *)&outsize);
                            if (v254)
                            {
                              v179 = v254;
                              v180 = "vm_read_overwrite(... dqlabel ...)";
                              goto LABEL_550;
                            }

                            v177 = 1;
                          }
                        }
                      }

LABEL_551:
                      if (v408 == 2)
                      {
                        task_info_outCnt = 5;
                        v184 = thread_info(act_list[v174], 0xBu, &v400, &task_info_outCnt);
                        if (!v184) {
                          goto LABEL_558;
                        }
                        v182 = v184;
                        v183 = "thread_info(... THREAD_SCHED_RR_INFO ...)";
                        goto LABEL_557;
                      }

                      if (v408 == 1)
                      {
                        task_info_outCnt = 5;
                        v181 = thread_info(act_list[v174], 0xAu, &v400, &task_info_outCnt);
                        if (v181)
                        {
                          v182 = v181;
                          v183 = "thread_info(... THREAD_SCHED_TIMESHARE_INFO ...)";
LABEL_557:
                          mach_error(v183, v182);
                        }
                      }

LABEL_558:
                      get_default = 0;
                      task_info_outCnt = 1;
                      v185 = thread_policy_get(act_list[v174], 1u, &v399, &task_info_outCnt, &get_default);
                      if (v185) {
                        mach_error("thread_policy_get(... THREAD_EXTENDED_POLICY ...)", v185);
                      }
                      v389 = 0;
                      task_info_outCnt = 5;
                      v186 = thread_policy_get(act_list[v174], 0xAu, v398, &task_info_outCnt, &v389);
                      if (v186) {
                        mach_error("thread_policy_get(... THREAD_TIME_CONSTRAINT_WITH_PRIORITY_POLICY ...)", v186);
                      }
                      v389 = 0;
                      task_info_outCnt = 1;
                      v187 = thread_policy_get(act_list[v174], 3u, &v397, &task_info_outCnt, &v389);
                      if (v187) {
                        mach_error("thread_policy_get(... THREAD_PRECEDENCE_POLICY ...)", v187);
                      }
                      v389 = 0;
                      task_info_outCnt = 1;
                      v188 = thread_policy_get(act_list[v174], 4u, &v396, &task_info_outCnt, &v389);
                      if (v188)
                      {
                        if (v188 == 46)
                        {
                          v372 = 1;
                          goto LABEL_569;
                        }

                        mach_error("thread_policy_get(... THREAD_AFFINITY_POLICY ...)", v188);
                      }

                      v372 = 0;
LABEL_569:
                      v389 = 0;
                      task_info_outCnt = 16;
                      v189 = thread_policy_get(act_list[v174], 6u, v391, &task_info_outCnt, &v389);
                      if (v189) {
                        mach_error("thread_policy_get(... THREAD_POLICY_STATE ...)", v189);
                      }
                      v191 = v393;
                      v190 = v394;
                      v192 = proc_pidinfo(v163, 15, v405[0], &v455, 112);
                      if (v192 <= 111) {
                        perror("proc_pidinfo(... PROC_PIDTHREADID64INFO ...)");
                      }
                      printf("\tthread ID: 0x%llx / %lld\n", v405[0], v405[0]);
                      if (v459)
                      {
                        printf("\tthread name: %s\n");
                      }

                      else if (v177)
                      {
                        printf("\tdispatch queue name: %s\n");
                      }

                      printf( "\tuser/system time: %lf s / %lf s\n",  (double)thread_info_out[1] / 1000000.0 + (double)thread_info_out[0],  (double)thread_info_out[3] / 1000000.0 + (double)thread_info_out[2]);
                      if (byte_100010003 != 0 && v383 && v192 >= 112)
                      {
                        *__error() = 0;
                        if ((_DWORD)v362 != (unsigned __int16)word_100010020) {
                          fprintf( __stderrp,  "threadcounts.ptc_len %d mismatch with level_count %d\n",  (unsigned __int16)word_100010020,  v362);
                        }
                        v193 = 0LL;
                        v194 = 0uLL;
                        if ((_DWORD)v362)
                        {
                          v195 = v362;
                          v196 = &qword_100010048;
                          v197 = 0uLL;
                          do
                          {
                            v197 = vaddq_s64(*((int64x2_t *)v196 - 1), v197);
                            v194 = vaddq_s64(*((int64x2_t *)v196 - 2), v194);
                            v198 = *v196;
                            v196 += 5;
                            v193 += v198;
                            --v195;
                          }

                          while (v195);
                        }

                        else
                        {
                          v197 = 0uLL;
                        }

                        *(int64x2_t *)keya = v197;
                        v366 = v194;
                        *(int64x2_t *)__endptr = v194;
                        v551 = v197;
                        v552 = v193;
                        outsize.i64[0] = (uint64_t)v361;
                        outsize.i64[1] = (uint64_t)v360;
                        *(void *)&v387 = v359;
                        *((void *)&v387 + 1) = v358;
                        v388 = v357;
                        sub_10000867C("\tCPU time:", (unint64_t *)__endptr, &outsize, 1, " of task");
                        if (v362 >= 2)
                        {
                          v200 = 0LL;
                          v201 = &xmmword_100010028;
                          do
                          {
                            if (v200 == 24) {
                              sub_100009088();
                            }
                            if (qword_1000100B8 != -1) {
                              dispatch_once(&qword_1000100B8, &stru_10000C328);
                            }
                            printf("\t%s:", *(const char **)((char *)&off_10000C348 + v200));
                            v202 = v201[1];
                            *(_OWORD *)__endptr = *v201;
                            v551 = (int64x2_t)v202;
                            v552 = *((void *)v201 + 4);
                            outsize = v366;
                            v387 = *(_OWORD *)keya;
                            v388 = v193;
                            sub_10000867C( (const char *)&unk_100009E75,  (unint64_t *)__endptr,  &outsize,  1,  (const char *)&unk_100009E75);
                            v200 += 8LL;
                            v201 = (__int128 *)((char *)v201 + 40);
                          }

                          while (8 * v362 != v200);
                        }
                      }

                      printf("\tCPU usage (over last tick): %d%%\n", thread_info_out[4] / 10);
                      v203 = "timeshare";
                      if (!v399) {
                        v203 = "fixed-priority";
                      }
                      v204 = "real-time";
                      if (!get_default) {
                        v204 = v203;
                      }
                      printf("\tsched mode: %s", v204);
                      if (v408 == 1 && (get_default || !v399)) {
                        printf( " demoted to policy %s: base priority: %d cur priority %d",  "POLICY_TIMESHARE",  v401,  v402);
                      }
                      putchar(10);
                      if (get_default) {
                        goto LABEL_613;
                      }
                      if (v408 >= 3)
                      {
                        v205 = "POLICY_FIFO";
                        if (v408 != 4) {
                          v205 = "???";
                        }
                      }

                      else
                      {
                        v205 = off_10000C408[v408];
                      }

                      printf("\tpolicy: %s\n", v205);
                      if (get_default)
                      {
LABEL_613:
                        printf("\t\treal-time priority: %u\n", v398[4]);
                        printf("\t\treal-time period: %u\n", v398[0]);
                        printf("\t\treal-time computation: %u\n", v398[1]);
                        printf("\t\treal-time constraint: %u\n", v398[2]);
                        printf("\t\treal-time preemptible: %s\n");
LABEL_614:
                        v16 = v379;
                        goto LABEL_615;
                      }

                      if (v408 == 2)
                      {
                        printf("\t\tround-robin max  priority: %d\n", v400);
                        printf("\t\tround-robin base priority: %d\n", v401);
                        printf("\t\tround-robin quantum: %d\n", v402);
                        printf("\t\tround-robin depressed: %s, prio %d\n");
                        goto LABEL_614;
                      }

                      v16 = v379;
                      if (v408 == 1)
                      {
                        printf("\t\ttimeshare max  priority: %d\n", v400);
                        printf("\t\ttimeshare base priority: %d\n", v401);
                        printf("\t\ttimeshare cur  priority: %d\n", v402);
                        if (v403) {
                          v251 = "YES";
                        }
                        else {
                          v251 = "NO";
                        }
                        printf("\t\ttimeshare depressed: %s, prio %d\n", v251, v404);
                      }

LABEL_615:
                      puts("\trequested policy:");
                      v206 = (v191 >> 15) & 7;
                      if (v206 != 7 && ((0x7Du >> v206) & 1) != 0)
                      {
                        v207 = off_10000C420[v206];
                      }

                      else
                      {
                        v11 = v206 == 1;
                        v207 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v207 = "???";
                        }
                      }

                      printf("\t\treq thread qos: %s, relprio: %d\n", v207, -((v191 >> 18) & 0xF));
                      puts("\t\treq workqueue/pthread overrides:");
                      v208 = (v191 >> 22) & 7;
                      if (v208 != 7 && ((0x7Du >> v208) & 1) != 0)
                      {
                        v209 = off_10000C420[v208];
                      }

                      else
                      {
                        v11 = v208 == 1;
                        v209 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v209 = "???";
                        }
                      }

                      printf("\t\t\treq legacy qos override: %s\n", v209);
                      v210 = HIDWORD(v191) & 7;
                      if ((_DWORD)v210 != 7 && ((0x7Du >> (BYTE4(v191) & 7)) & 1) != 0)
                      {
                        v211 = off_10000C420[v210];
                      }

                      else
                      {
                        v11 = (_DWORD)v210 == 1;
                        v211 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v211 = "???";
                        }
                      }

                      printf("\t\t\treq workqueue qos override: %s\n", v211);
                      puts("\t\treq kernel overrides:");
                      v212 = (v191 >> 28) & 7;
                      if (v212 != 7 && ((0x7Du >> v212) & 1) != 0)
                      {
                        v213 = off_10000C420[v212];
                      }

                      else
                      {
                        v11 = v212 == 1;
                        v213 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v213 = "???";
                        }
                      }

                      printf("\t\t\treq kevent overrides: %s\n", v213);
                      v214 = (v191 >> 35) & 7;
                      if ((_DWORD)v214 != 7 && ((0x7Du >> v214) & 1) != 0)
                      {
                        v215 = off_10000C420[v214];
                      }

                      else
                      {
                        v11 = (_DWORD)v214 == 1;
                        v215 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v215 = "???";
                        }
                      }

                      printf("\t\t\treq workloop servicer override: %s\n", v215);
                      v216 = (v191 >> 25) & 7;
                      if (v216 != 7 && ((0x7Du >> v216) & 1) != 0)
                      {
                        v217 = off_10000C420[v216];
                      }

                      else
                      {
                        v11 = v216 == 1;
                        v217 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v217 = "???";
                        }
                      }

                      printf("\t\treq turnstiles sync promotion qos: %s, user promotion base pri: %d\n", v217, v395);
                      v218 = (v191 >> 8) & 7;
                      v219 = v218 == 6;
                      if (v218 >= 6)
                      {
                        v220 = "LATENCY_QOS_TIER_5";
                        if (!v219) {
                          v220 = "???";
                        }
                      }

                      else
                      {
                        v220 = off_10000C458[v218];
                      }

                      printf("\t\treq latency qos: %s\n", v220);
                      v221 = (v191 >> 11) & 7;
                      v222 = v221 == 6;
                      if (v221 >= 6)
                      {
                        v223 = "THROUGHPUT_QOS_TIER_5";
                        if (!v222) {
                          v223 = "???";
                        }
                      }

                      else
                      {
                        v223 = off_10000C488[v221];
                      }

                      printf("\t\treq thruput qos: %s\n", v223);
                      if ((v191 & 3) != 0) {
                        v224 = "YES";
                      }
                      else {
                        v224 = "NO";
                      }
                      v225 = (const char *)&unk_100009E75;
                      v226 = "(internal)";
                      if ((v191 & 1) == 0) {
                        v226 = (const char *)&unk_100009E75;
                      }
                      if ((v191 & 2) != 0) {
                        v225 = "(external)";
                      }
                      printf("\t\treq darwin BG: %s %s %s\n", v224, v226, v225);
                      v227 = (v191 >> 2) & 3;
                      v228 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                      if (v227 != 3) {
                        v228 = off_10000C4B8[v227];
                      }
                      v229 = (v191 >> 4) & 3;
                      v230 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                      if (v229 != 3) {
                        v230 = off_10000C4B8[v229];
                      }
                      printf("\t\treq internal/external iotier: %s / %s\n", v228, v230);
                      printf("\t\treq other: ");
                      if ((v191 & 0x40) != 0)
                      {
                        printf("passive-int ");
                        if ((v191 & 0x80) == 0)
                        {
LABEL_672:
                          if ((v191 & 0x4000) == 0) {
                            goto LABEL_673;
                          }
                          goto LABEL_684;
                        }
                      }

                      else if ((v191 & 0x80) == 0)
                      {
                        goto LABEL_672;
                      }

                      printf("passive-ext ");
                      if ((v191 & 0x4000) == 0)
                      {
LABEL_673:
                        if ((v191 & 0x10000000000LL) == 0) {
                          goto LABEL_675;
                        }
LABEL_674:
                        printf("workload-property-controlled ");
                        goto LABEL_675;
                      }

LABEL_684:
                      printf("bg-pidbind ");
                      if ((v191 & 0x10000000000LL) != 0) {
                        goto LABEL_674;
                      }
LABEL_675:
                      if ((v392 & 1) != 0) {
                        printf("static-param ");
                      }
                      putchar(10);
                      puts("\teffective policy:");
                      v231 = (v190 >> 14) & 7;
                      if (v231 != 7 && ((0x7Du >> v231) & 1) != 0)
                      {
                        v232 = off_10000C420[v231];
                      }

                      else
                      {
                        v11 = v231 == 1;
                        v232 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v232 = "???";
                        }
                      }

                      printf("\t\teff thread qos: %s\n", v232);
                      printf("\t\teff thread qos relprio: %d\n", -((v190 >> 17) & 0xF));
                      v233 = (v190 >> 21) & 7;
                      if (v233 != 7 && ((0x7Du >> v233) & 1) != 0)
                      {
                        v234 = off_10000C420[v233];
                      }

                      else
                      {
                        v11 = v233 == 1;
                        v234 = "THREAD_QOS_MAINTENANCE";
                        if (!v11) {
                          v234 = "???";
                        }
                      }

                      printf("\t\teff promotion qos: %s\n", v234);
                      v235 = (v190 >> 8) & 7;
                      v236 = v235 == 6;
                      if (v235 >= 6)
                      {
                        v237 = "LATENCY_QOS_TIER_5";
                        if (!v236) {
                          v237 = "???";
                        }
                      }

                      else
                      {
                        v237 = off_10000C458[v235];
                      }

                      printf("\t\teff latency qos: %s\n", v237);
                      v238 = (v190 >> 11) & 7;
                      v239 = v238 == 6;
                      if (v238 >= 6)
                      {
                        v240 = "THROUGHPUT_QOS_TIER_5";
                        if (!v239) {
                          v240 = "???";
                        }
                      }

                      else
                      {
                        v240 = off_10000C488[v238];
                      }

                      printf("\t\teff thruput qos: %s\n", v240);
                      if ((v190 & 1) != 0) {
                        v241 = "YES";
                      }
                      else {
                        v241 = "NO";
                      }
                      printf("\t\teff darwin BG: %s\n", v241);
                      v242 = (v190 >> 1) & 3;
                      v243 = "THROTTLE_LEVEL_TIER3 (THROTTLE)";
                      if (v242 != 3) {
                        v243 = off_10000C4B8[v242];
                      }
                      printf("\t\teff iotier: %s\n", v243);
                      printf("\t\teff other: ");
                      if ((v190 & 8) != 0)
                      {
                        printf("passive ");
                        if ((v190 & 0x80) == 0)
                        {
LABEL_708:
                          if ((v190 & 0x10) == 0) {
                            goto LABEL_709;
                          }
                          goto LABEL_718;
                        }
                      }

                      else if ((v190 & 0x80) == 0)
                      {
                        goto LABEL_708;
                      }

                      printf("ui-is-urgent (47) ");
                      if ((v190 & 0x10) == 0)
                      {
LABEL_709:
                        if ((v190 & 0x20) == 0) {
                          goto LABEL_710;
                        }
                        goto LABEL_719;
                      }

LABEL_718:
                      printf("bg-allsockets ");
                      if ((v190 & 0x20) == 0)
                      {
LABEL_710:
                        if ((v190 & 0x40) == 0) {
                          goto LABEL_711;
                        }
                        goto LABEL_720;
                      }

LABEL_719:
                      printf("bg-newsockets ");
                      if ((v190 & 0x40) == 0)
                      {
LABEL_711:
                        if ((v190 & 0x2000000) != 0) {
                          goto LABEL_721;
                        }
                        goto LABEL_712;
                      }

LABEL_720:
                      printf("terminated ");
                      if ((v190 & 0x2000000) != 0)
                      {
LABEL_721:
                        printf("workload-property-controlled ");
                        if ((v190 & 0x1000000) == 0) {
                          goto LABEL_714;
                        }
LABEL_713:
                        printf("promote-above-task ");
                        goto LABEL_714;
                      }

LABEL_712:
                      if ((v190 & 0x1000000) != 0) {
                        goto LABEL_713;
                      }
LABEL_714:
                      putchar(10);
                      if ((v409 - 1) >= 4)
                      {
                        v244 = "TH_STATE_HALTED";
                        if (v409 != 5) {
                          v244 = "???";
                        }
                      }

                      else
                      {
                        v244 = off_10000C4D0[v409 - 1];
                      }

                      v163 = pid[0];
                      printf("\trun state: %s\n", v244);
                      if (v410)
                      {
                        v245 = "TH_FLAGS_SWAPPED ";
                        if ((v410 & 1) == 0) {
                          v245 = (const char *)&unk_100009E75;
                        }
                        v246 = "TH_FLAGS_IDLE ";
                        if ((v410 & 2) == 0) {
                          v246 = (const char *)&unk_100009E75;
                        }
                        v247 = "TH_FLAGS_GLOBAL_FORCED_IDLE ";
                        if ((v410 & 4) == 0) {
                          v247 = (const char *)&unk_100009E75;
                        }
                        printf("\tflags: %s%s%s\n", v245, v246, v247);
                      }

                      printf("\tsuspend count: %d\n", v411);
                      printf("\tsleep time: %d s\n", v412);
                      printf("\timportance in task: %d\n", v397);
                      if ((v372 & 1) == 0) {
                        printf("\taffinity tag: %d\n", v396);
                      }
                      if ((v370 & 1) == 0)
                      {
                        voucher = 0;
                        mach_voucher = thread_get_mach_voucher(act_list[v174], 0, &voucher);
                        if (mach_voucher) {
                          mach_error("thread_get_mach_voucher(...)", mach_voucher);
                        }
                        v249 = voucher;
                        if (voucher)
                        {
                          outsize.i32[0] = 0;
                          object_addr = 0;
                          v250 = mach_port_kernel_object( mach_task_self_,  voucher,  (unsigned int *)&outsize,  &object_addr);
                          if (v250)
                          {
                            mach_error("mach_port_kernel_object(...)", v250);
                          }

                          else if (outsize.i32[0] == 37)
                          {
                            printf("\tvoucher: 0x%x\n", object_addr);
                            recipesCnt = 0x2000;
                            v252 = mach_voucher_debug_info( mach_task_self_,  v249,  (mach_voucher_attr_raw_recipe_array_t)__endptr,  &recipesCnt);
                            if ((_DWORD)v252 != 46)
                            {
                              if (recipesCnt)
                              {
                                v253 = v252;
                                if ((_DWORD)v252)
                                {
                                  mach_error("mach_voucher_debug_info(...)", v252);
                                }

                                else
                                {
                                  for (j = 0; j < recipesCnt; j += v256[3] + 16)
                                  {
                                    v256 = (_DWORD *)((char *)__endptr + j);
                                    if (*v256 == 3 || *v256 == 2) {
                                      printf("\t\t%s\n", v253);
                                    }
                                    else {
                                      printf("\t\tUnknown (%d): %s\n", v253);
                                    }
                                  }
                                }
                              }
                            }
                          }

                          mach_port_deallocate(mach_task_self_, voucher);
                        }
                      }

                      mach_port_deallocate(mach_task_self_, act_list[v174]);
                      putchar(10);
                      ++v174;
                    }

                    while (v174 < x[1]);
                  }
                }

                putchar(10);
                v39 = v355;
                v40 = v367;
LABEL_768:
                ++v40;
                v37 = task_listCnt;
                v38 = __size[1] == 0;
              }

              while (v40 < task_listCnt && !__size[1]);
            }
          }
        }

        else
        {
          v37 = 0;
          v38 = __size[1] == 0;
        }

        if (!v350) {
          goto LABEL_860;
        }
        if (v38)
        {
          puts("Coalitions: ");
          v37 = task_listCnt;
        }

        v373 = task_list;
        v257 = proc_listpids(1u, 0, 0LL, 0);
        if (v257 <= 0)
        {
          v265 = __stderrp;
          __error();
          fprintf(v265, "proc_listpids(PROC_ALL_PIDS): %d\n");
LABEL_788:
          v264 = 0LL;
          v263 = 0LL;
          goto LABEL_789;
        }

        else {
          v258 = 2LL * v257;
        }
        v259 = malloc(v258);
        v260 = proc_listpids(1u, 0, v259, v258);
        if (v260 <= 0)
        {
          v266 = __stderrp;
          __error();
          fprintf(v266, "proc_listpids(PROC_ALL_PIDS, pids): %d\n");
          goto LABEL_788;
        }

        v261 = v260;
        v262 = v260 >> 2;
        v263 = (char *)calloc(v262, 0xA0uLL);
        v384 = v259;
        if (v261 >= 4)
        {
          if (v262 <= 1) {
            v305 = 1LL;
          }
          else {
            v305 = v262;
          }
          v264 = 0LL;
          while (1)
          {
            if (*v259)
            {
              v306 = v264;
              v307 = proc_name(*v259, &v263[160 * v264 + 24], 0x40u);
              v308 = *v259;
              if (v307 < 0)
              {
                fprintf(__stderrp, "skipping pid %u (proc_name)\n", *v259);
              }

              else
              {
                LODWORD(v455) = *v259;
                *__error() = 0;
                v552 = 0LL;
                *(_OWORD *)__endptr = 0u;
                v551 = 0u;
                if (proc_pidinfo(v308, 20, 1uLL, __endptr, 40) == 40)
                {
                  *__error() = 0;
                  v463[0] = 0LL;
                  buffer[0] = 8LL;
                  if ((sysctlbyname("kern.coalition_roles", v463, buffer, &v455, 4uLL) & 0x80000000) == 0
                    && buffer[0] == 8
                    || !byte_100010001 && *__error() == 2)
                  {
                    v264 = v306;
                    v309 = (rusage_info_t *)&v263[160 * v306];
                    *(_OWORD *)v309 = *(_OWORD *)__endptr;
                    v309[2] = v463[0];
                    v310 = *v259;
                    v311.i64[0] = -1LL;
                    v311.i64[1] = -1LL;
                    *(int64x2_t *)__endptr = v311;
                    v551 = v311;
                    LODWORD(v463[0]) = 0;
                    if (!task_name_for_pid(mach_task_self_, v310, (mach_port_name_t *)v463))
                    {
                      LODWORD(buffer[0]) = 8;
                      task_info((task_name_t)v463[0], 0xFu, (task_info_t)__endptr, (mach_msg_type_number_t *)buffer);
                      mach_port_deallocate(mach_task_self_, (mach_port_name_t)v463[0]);
                    }

                    if (v551.i32[1] == -1)
                    {
                      fprintf(__stderrp, "skipping pid %u (get_audit_token)\n", *v259);
                    }

                    else
                    {
                      v312 = &v263[160 * v306];
                      v313 = *(_OWORD *)__endptr;
                      *(int64x2_t *)(v312 + 104) = v551;
                      *(_OWORD *)(v312 + 88) = v313;
                      *(_OWORD *)(v312 + 120) = 0u;
                      *(_OWORD *)(v312 + 136) = 0u;
                      *((_DWORD *)v312 + 38) = *v259;
                      v264 = v306 + 1;
                    }

                    goto LABEL_887;
                  }

                  v315 = __stderrp;
                  __error();
                  fprintf(v315, "kern.coalition_roles(%d): %d\n");
                }

                else
                {
                  v314 = __stderrp;
                  __error();
                  fprintf(v314, "PROC_PIDCOALITIONINFO(%d): %d\n");
                }

                fprintf(__stderrp, "skipping pid %u (fill_coalitions)\n", *v259);
              }

              v264 = v306;
            }

LABEL_887:
            ++v259;
            if (!--v305) {
              goto LABEL_785;
            }
          }
        }

        v264 = 0LL;
LABEL_785:
        free(v384);
LABEL_789:
        if (v350 == 3)
        {
          v267 = 0;
          v368 = 0LL;
          v268 = (int (__cdecl *)(const void *, const void *))sub_100008FEC;
        }

        else
        {
          v267 = 1;
          v368 = 1LL;
          v268 = (int (__cdecl *)(const void *, const void *))sub_100008F94;
        }

        qsort(v263, v264, 0xA0uLL, v268);
        printf("PID   Command                           ");
        printf("Resource  Jetsam  Role   ");
        printf("  Apptype  Background App Nap");
        putchar(10);
        if (v264)
        {
          *(void *)pida = 0LL;
          v269 = 0LL;
          v270 = v381 != 0;
          if (__s1) {
            v271 = v267;
          }
          else {
            v271 = 0;
          }
          v382 = v271;
          v380 = v270 && v16;
          v272 = "     ";
          do
          {
            v273 = &v263[160 * v269];
            v274 = *((_DWORD *)v273 + 5) + 1;
            v275 = "(unknwn)";
            if (v274 <= 4) {
              v275 = off_10000C4F0[v274];
            }
            v276 = v264;
            v277 = *(_DWORD *)&v263[160 * v269 + 16 + 4 * v368] == 1;
            if (!v382)
            {
LABEL_808:
              v279 = v272;
              v280 = &v263[160 * v269];
              v283 = *((_DWORD *)v280 + 38);
              v282 = (int *)(v280 + 152);
              v281 = v283;
              if (v277 || v281 == 1) {
                printf("%-5u %-34s");
              }
              else {
                printf("  %-5u %-32s");
              }
              printf(" %7llu %7llu  %s ", *(void *)v273, *((void *)v273 + 1), v275);
              v284 = *v282;
              v285 = v355;
              v287 = v37;
              v286 = v373;
              v272 = v279;
              if (!v37) {
                goto LABEL_818;
              }
              while (1)
              {
                v288 = *v285++;
                if (v288 == v284) {
                  break;
                }
                ++v286;
                if (!--v287) {
                  goto LABEL_818;
                }
              }

              v289 = *v286;
              if (!*v286)
              {
LABEL_818:
                fprintf(__stderrp, "could not find task for pid %d", v284);
                v289 = 0;
              }

              LODWORD(v463[0]) = 16;
              LODWORD(buffer[0]) = 0;
              v290 = task_policy_get( v289,  4u,  (task_policy_t)__endptr,  (mach_msg_type_number_t *)v463,  (BOOLean_t *)buffer);
              if (v290) {
                mach_error("task_policy_get(TASK_POLICY_STATE)", v290);
              }
              v291 = v554;
              v292 = "???";
              switch((v553 >> 17) & 7)
              {
                case 0u:
                  v292 = "        ";
                  break;
                case 1u:
                  v292 = "Int Dmon";
                  break;
                case 2u:
                  v292 = "Std Dmon";
                  break;
                case 3u:
                  v292 = "Adaptive";
                  break;
                case 4u:
                  v292 = "BG Dmon ";
                  break;
                case 5u:
                  v293 = (v554 >> 20) & 0xF;
                  if (v293 < 9) {
                    v292 = off_10000C518[v293];
                  }
                  break;
                case 7u:
                  v292 = "Driver  ";
                  break;
                default:
                  break;
              }

              printf("  %s ", v292);
              v294 = coalition_policy_get(*((void *)v273 + 1), 1LL);
              if (v294 == 1)
              {
                printf(" CBG ");
              }

              else if (v294 == -1)
              {
                perror("coalition_policy_get(COALITION_POLICY_SUPPRESS) failed");
              }

              else
              {
                printf(v279);
              }

              else {
                printf(v279);
              }
              v295 = " Nap     ";
              if ((*(void *)&v291 & 0x80000LL) == 0) {
                v295 = "         ";
              }
              if ((v552 & 0x10) != 0) {
                printf(" Suspend ");
              }
              else {
                printf(v295);
              }
              if (v380)
              {
                v296 = sub_1000085D8();
                v298 = v297;
                v299 = sub_1000085D8();
                v300 = v299;
                v302 = v301;
                if ((!((unint64_t)v299 | (unint64_t)v296) || v296 && v299 && !strcmp(v296, v299))
                  && (!((unint64_t)v302 | (unint64_t)v298) || v298 && v302 && !strcmp(v298, v302)))
                {
                  printf(" (%s, %s)");
                }

                else
                {
                  printf(" (%s, %s; %s, %s)");
                }

                free(v296);
                free(v298);
                free(v300);
                free(v302);
              }

              putchar(10);
              goto LABEL_856;
            }

            if (!strncmp(__s1, &v263[160 * v269 + 24], 0x20uLL) || v354 && *(_DWORD *)&v263[160 * v269 + 152] == v353)
            {
              v278 = *(void *)pida;
              if (v277 && !*(void *)pida) {
                v278 = *((void *)v273 + 1);
              }
              if (!v278)
              {
LABEL_816:
                *(void *)pida = 0LL;
                goto LABEL_856;
              }
            }

            else
            {
              v278 = *(void *)pida;
              if (!*(void *)pida) {
                goto LABEL_816;
              }
            }

            *(void *)pida = v278;
            if (v278 == *((void *)v273 + 1)) {
              goto LABEL_808;
            }
LABEL_856:
            ++v269;
            v264 = v276;
          }

          while (v269 != v276);
        }

        free(v263);
        v37 = task_listCnt;
LABEL_860:
        if (v37)
        {
          v303 = 0LL;
          do
            mach_port_deallocate(mach_task_self_, task_list[v303++]);
          while (v303 < task_listCnt);
        }

        if (cf)
        {
          CFRelease(cf);
          stackshot_config_dealloc(v346);
        }

        free(v355);
        free(v351);
        return 0LL;
      case 0:
        continue;
      case 1:
        if (optarg) {
          v6 = sub_100008488();
        }
        else {
          v6 = 1;
        }
        v383 = v6 != 0;
        continue;
      case 2:
        if (optarg) {
          v7 = sub_100008488();
        }
        else {
          v7 = 1;
        }
        v5 = v7 != 0;
        continue;
      case 3:
        v449 = 0x100000001LL;
        __size[2] = 1;
        v381 = 1;
        byte_100010000 = 1;
        continue;
      case 4:
        v9 = optarg;
        v4 = 2;
        if (strcmp(optarg, "jetsam"))
        {
          v4 = 3;
          if (strcmp(v9, "resource")) {
            sub_1000091D4(v9);
          }
        }

        continue;
      case 5:
        if (optarg) {
          v10 = sub_100008488();
        }
        else {
          v10 = 1;
        }
        byte_100010000 = v10 != 0;
        continue;
      case 6:
        if (optarg) {
          v8 = sub_100008488();
        }
        else {
          v8 = 1;
        }
        v378 = v8 != 0;
        continue;
      case 7:
        v449 = 0x100000001LL;
        v381 = 1;
        __size[2] = 1;
        v4 = 2;
        continue;
      default:
        puts("usage:");
        puts("\ttaskinfo [-h|--help] [--threads] [--dq] [--boosts] [--verbose] [--all]");
        puts("\t\t [--precise(=1|0)] [--xpcinfo(=1|0)] [--coalitions-only] [--threadcounts(=1|0)]");
        puts("\t\t [--vouchers(=1|0)] [--coalitions=(all|jetsam|resource)] [process-name|pid]");
        return 0LL;
    }
  }
}

unint64_t sub_100008488()
{
  unint64_t result = strtoull(optarg, &__endptr, 10);
  if (__endptr == optarg || *__endptr) {
    sub_10000920C(optarg);
  }
  return result;
}

uint64_t sub_1000084E0(const char *a1)
{
  int v4 = 0;
  size_t v3 = 4LL;
  *__error() = 0;
  if (sysctlbyname(a1, &v4, &v3, 0LL, 0LL) != -1) {
    return 1LL;
  }
  if (*__error() != 2)
  {
    perror(a1);
    return 1LL;
  }

  return 0LL;
}

uint64_t sub_100008560(const char *a1)
{
  unsigned int v4 = 0;
  size_t v3 = 4LL;
  *__error() = 0;
  if (sysctlbyname(a1, &v4, &v3, 0LL, 0LL) == -1 && *__error() != 2) {
    perror(a1);
  }
  return v4;
}

char *sub_1000085D8()
{
  v0 = (void *)xpc_coalition_copy_info();
  if (xpc_get_type(v0) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v1 = strdup("coalition unknown");
    v2 = "to launchd";
LABEL_7:
    strdup(v2);
    return v1;
  }

  string = xpc_dictionary_get_string(v0, XPC_COALITION_INFO_KEY_NAME);
  if (string) {
    v1 = strdup(string);
  }
  else {
    v1 = 0LL;
  }
  v2 = xpc_dictionary_get_string(v0, XPC_COALITION_INFO_KEY_BUNDLE_IDENTIFIER);
  if (v2) {
    goto LABEL_7;
  }
  return v1;
}

uint64_t sub_10000867C(const char *a1, unint64_t *a2, void *a3, int a4, const char *a5)
{
  unint64_t v9 = a2[3] + a2[2];
  uint64_t v10 = a3[2];
  uint64_t v11 = a3[3];
  printf( "%s %llu.%06llu s ",  a1,  v9 * dword_100010004 / unk_100010008 / 0x3B9ACA00,  v9 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8);
  if (a4)
  {
    if (v11 + v10) {
      double v12 = (double)v9 * 100.0 / (double)(unint64_t)(v11 + v10);
    }
    else {
      double v12 = 0.0;
    }
    printf("(%.2f%%%s) ", v12, a5);
  }

  if (byte_100010000) {
    printf("(%llu cycles, %llu instructions");
  }
  else {
    printf("(%.2f%s cycles, %.2f%s instructions");
  }
  unint64_t v13 = a2[1];
  if (v13) {
    double v14 = (double)*a2 / (double)v13;
  }
  else {
    double v14 = 0.0;
  }
  printf(", IPC %.3f, ", v14);
  if ((double)(v9 * dword_100010004 / unk_100010008) / 1000000000.0 != 0.0)
  {
    if (!byte_100010000) {
      goto LABEL_17;
    }
LABEL_16:
    printf("%.0f hz ");
    goto LABEL_18;
  }

  if (byte_100010000) {
    goto LABEL_16;
  }
LABEL_17:
  printf("%.2f%s%s, ");
LABEL_18:
  sub_100008B94();
  if (a4)
  {
    unint64_t v15 = a3[4];
    if (v15) {
      double v16 = (double)a2[4] * 100.0 / (double)v15;
    }
    else {
      double v16 = 0.0;
    }
    printf(" (%.2f%%%s)", v16, a5);
  }

  printf(") ");
  unint64_t v17 = a2[2];
  unint64_t v18 = a2[3];
  if (v9)
  {
    double v19 = (double)v17 * 100.0 / (double)v9;
    double v20 = (double)v18 * 100.0 / (double)v9;
  }

  else
  {
    double v19 = 0.0;
    double v20 = 0.0;
  }

  return printf( "user/system: %llu.%06llu / %llu.%06llu (%.0f%% / %.0f%%)\n",  v17 * dword_100010004 / unk_100010008 / 0x3B9ACA00,  v17 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8,  v18 * dword_100010004 / unk_100010008 / 0x3B9ACA00,  v18 * dword_100010004 / unk_100010008 % 0x3B9ACA00 / 0x3E8,  v19,  v20);
}

uint64_t sub_100008B94()
{
  if (byte_100010000) {
    return printf("%llu nJ %.0f nW");
  }
  else {
    return printf("%.2f%s%s, %.2f%s%s");
  }
}

void sub_100008DE0(id a1)
{
  size_t v1 = 4LL;
  if (sysctlbyname("hw.nperflevels", &dword_100010018, &v1, 0LL, 0LL) == -1) {
    perror("sysctlbyname(hw.nperflevels)");
  }
  if (dword_100010018 >= 3)
  {
    fprintf( __stderrp,  "count:%d exceeds STATIC_PERFLEVEL_COUNT:%d skipping PROC_PIDTHREADCOUNTS data\n",  dword_100010018,  2);
    byte_100010003 = 0;
  }

void sub_100008E70(id a1)
{
  if (qword_100010010 != -1) {
    dispatch_once(&qword_100010010, &stru_10000C2E8);
  }
  uint64_t v1 = dword_100010018;
  if (dword_100010018)
  {
    uint64_t v2 = 0LL;
    size_t v3 = (char *)&unk_100010078;
    do
    {
      __int128 v7 = 0u;
      __int128 v8 = 0u;
      *(_OWORD *)__str = 0u;
      __int128 v6 = 0u;
      snprintf(__str, 0x40uLL, "hw.perflevel%d.name", v2);
      size_t v4 = 32LL;
      if (sysctlbyname(__str, v3, &v4, 0LL, 0LL) == -1) {
        perror(__str);
      }
      ++v2;
      v3 += 32;
    }

    while (v1 != v2);
  }

uint64_t sub_100008F7C(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 152);
  int v3 = *(_DWORD *)(a2 + 152);
  BOOL v4 = v2 < v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v5;
  }
}

uint64_t sub_100008F94(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  unint64_t v3 = *(void *)(a2 + 8);
  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  if (v2 > v3) {
    return 1LL;
  }
  if (*(_DWORD *)(a1 + 20) == 1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a2 + 20) == 1) {
    return 1LL;
  }
  int v5 = *(_DWORD *)(a1 + 152);
  int v6 = *(_DWORD *)(a2 + 152);
  BOOL v7 = v5 < v6;
  BOOL v8 = v5 > v6;
  if (v7) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v8;
  }
}

uint64_t sub_100008FEC(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < *(void *)a2) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)a1 > *(void *)a2) {
    return 1LL;
  }
  if (*(_DWORD *)(a1 + 16) == 1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a2 + 16) == 1) {
    return 1LL;
  }
  int v3 = *(_DWORD *)(a1 + 152);
  int v4 = *(_DWORD *)(a2 + 152);
  BOOL v5 = v3 < v4;
  BOOL v6 = v3 > v4;
  if (v5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v6;
  }
}

void sub_100009044()
{
}

void sub_100009060()
{
  __assert_rtn("main", "taskinfo.c", 1526, "threadcounts_size >= target_size");
}

void sub_100009088()
{
  __assert_rtn("perf_level_name", "taskinfo.c", 503, "perf_level <= STATIC_PERFLEVEL_COUNT");
}

void sub_1000090B0()
{
  byte_10001000E = 1;
}

void sub_1000090D8()
{
  byte_10001000D = 1;
}

void sub_100009100()
{
}

void sub_100009128()
{
}

void sub_100009150()
{
  byte_10001000C = 1;
}

void sub_100009178()
{
  byte_10001001C = 1;
}

void sub_1000091A0()
{
}

void sub_1000091BC()
{
}

void sub_1000091D4(const char *a1)
{
}

void sub_10000920C(const char *a1)
{
}