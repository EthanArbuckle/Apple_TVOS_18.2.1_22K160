uint64_t sub_C2F6C()
{
  sub_36A5C();
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_C2F98()
{
  uint64_t v3111 = v9 | 0x1000000000000000LL;
  uint64_t v3112 = v10;
  uint64_t v3110 = v3;
  uint64_t v11 = *(void *)(v3 + 27624);
  v12 = *(uint64_t **)(v3 + 25936);
  *(void *)(v3 + 27632) = v12;
  swift_unknownObjectRelease(v11);
  uint64_t v13 = sub_DE8D8(*v12);
  switch(v13)
  {
    case 'e':
      sub_DE8F0(22808LL);
      unint64_t v14 = *(void *)(v3 + 27464);
      uint64_t v15 = *(void *)(v3 + 27440);
      v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 27384);
      uint64_t v17 = *(void *)(v3 + 27376);
      uint64_t v18 = *(void *)(v3 + 27328);
      uint64_t v19 = *(void *)(v3 + 26736);
      sub_DDD24();
      if (v22) {
        uint64_t v23 = v21;
      }
      else {
        uint64_t v23 = v20;
      }
      swift_bridgeObjectRelease(v23);
      if (v14) {
        unint64_t v24 = v14;
      }
      else {
        unint64_t v24 = 0xE700000000000000LL;
      }
      swift_bridgeObjectRelease(v24);
      sub_DE3A8();
      if (v22) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = v15;
      }
      swift_bridgeObjectRelease(v26);
      sub_2A184();
      sub_A5DC(v17, v3 + 24296);
      v16(v18, v17, v19);
      sub_DDE60();
      os_log_type_t v27 = sub_AB70();
      if (sub_46514(v27))
      {
        v28 = *(void (**)(uint64_t, uint64_t))(v3 + 27400);
        uint64_t v29 = *(void *)(v3 + 27328);
        uint64_t v30 = *(void *)(v3 + 26736);
        v31 = (uint8_t *)sub_3635C();
        sub_DD450(v31);
        sub_DE090();
        sub_2A184();
        sub_232EC( &dword_0,  (os_log_s *)(v3 + 24296),  (os_log_type_t)v18,  "Received .requiresAuthorization, returning AskAuthorizationFlow",  v31);
        sub_37268();

        uint64_t v32 = v29;
        uint64_t v33 = v30;
      }

      else
      {
        v28 = *(void (**)(uint64_t, uint64_t))(v3 + 27400);
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        uint64_t v32 = sub_372A0();
      }

      v28(v32, v33);
      v233 = *(void **)(v3 + 27608);
      v1 = *(os_log_s **)(v3 + 26728);
      uint64_t v234 = *(void *)(v3 + 26688);
      uint64_t v235 = *(void *)(v3 + 25976);
      sub_DEBC4(v235 + 24);
      sub_DDE20((_OWORD *)(v235 + 64));
      sub_74964((uint64_t *)v3099);
      uint64_t v236 = sub_749B0();
      uint64_t v237 = sub_749C4();
      sub_74A58(88, v3085, (const void *)(v3 + 1568), v3099, v236, v237, v3 + 1144);
      sub_A294();
      sub_DDFA4();
      sub_DE104();

      v238 = sub_A2D0((void *)(v3 + 1144));
      sub_990D4((uint64_t)v238, type metadata accessor for SnippetHeaderModel);
      uint64_t v239 = v234;
      goto LABEL_221;
    case 'f':
      goto LABEL_26;
    case 'g':
      unint64_t v61 = *(void *)(v3 + 27464);
      unint64_t v62 = *(void *)(v3 + 27440);
      uint64_t v63 = *(void *)(v3 + 25976);
      sub_DDD24();
      if (v22) {
        uint64_t v66 = v65;
      }
      else {
        uint64_t v66 = v64;
      }
      swift_bridgeObjectRelease(v66);
      if (v61) {
        unint64_t v67 = v61;
      }
      else {
        unint64_t v67 = 0xE700000000000000LL;
      }
      swift_bridgeObjectRelease(v67);
      if (v62) {
        unint64_t v68 = v62;
      }
      else {
        unint64_t v68 = 0xE600000000000000LL;
      }
      swift_bridgeObjectRelease(v68);
      sub_249D4();
      uint64_t v69 = *(void *)(v63 + 224);
      uint64_t v70 = *(void *)(v63 + 232);
      uint64_t v71 = v63 + 224;
      uint64_t v72 = *(void *)(v71 + 16);
      uint64_t v73 = *(void *)(v71 + 24);
      uint64_t v74 = *(void *)(v71 + 32);
      uint64_t v75 = *(void *)(v71 + 40);
      uint64_t v76 = *(void *)(v71 + 48);
      uint64_t v77 = *(void *)(v71 + 56);
      unsigned __int8 v78 = *(_BYTE *)(v71 + 64);
      *(void *)uint64_t v71 = 1LL;
      *(_OWORD *)(v71 + 8) = 0u;
      *(_OWORD *)(v71 + 24) = 0u;
      *(_OWORD *)(v71 + 40) = 0u;
      *(void *)(v71 + 56) = 0LL;
      *(_BYTE *)(v71 + 64) = -64;
      uint64_t v79 = sub_3561C(v69, v70, v72, v73, v74, v75, v76, v77, v78);
      sub_DDE68( v79,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (!v80)
      {
        v437 = *(void (**)(uint64_t, os_log_s *, uint64_t))(v3 + 27384);
        v1 = *(os_log_s **)(v3 + 27376);
        uint64_t v438 = *(void *)(v3 + 27240);
        uint64_t v2 = *(void *)(v3 + 26736);
        sub_A5DC((uint64_t)v1, v3 + 24776);
        v437(v438, v1, v2);
        sub_23374();
        os_log_type_t v439 = sub_AB70();
        if (sub_561AC(v439))
        {
          uint64_t v2 = *(void *)(v3 + 27616);
          v3093 = *(void (**)(uint64_t, uint64_t))(v3 + 27400);
          uint64_t v3086 = *(void *)(v3 + 27240);
          uint64_t v440 = *(void *)(v3 + 26736);
          v441 = (uint8_t *)sub_3635C();
          sub_DD450(v441);
          v56 = (uint8_t *)_swiftEmptyArrayStorage;
          sub_DE090();
          sub_2A184();
          sub_232EC( &dword_0,  v1,  (os_log_type_t)v437,  "Needed name disambiguation but intentResponse.matchingMeds was nil.",  v441);
          sub_DDDAC();

          v3093(v3086, v440);
        }

        else
        {
          v977 = *(void (**)(uint64_t))(v3 + 27400);
          v56 = *(uint8_t **)(v3 + 27240);
          sub_DDA50();
          swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
          uint64_t v978 = sub_372A0();
          v977(v978);
        }

        v979 = *(void **)(v3 + 27608);
        v980 = (_OWORD *)sub_DE4E0();
        sub_DDE20(v980);
        sub_DE1C4((void *)(v3 + 11488));
        sub_A178();
        sub_DDFA4();

        goto LABEL_220;
      }

      uint64_t v81 = v80;
      sub_4195C();
      unint64_t v82 = sub_DEDA4();
      uint64_t v3091 = (uint64_t)sub_BFD9C(v82, v83);
      uint64_t v84 = (uint64_t)&_swiftEmptySetSingleton;
      v3107 = &_swiftEmptySetSingleton;
      uint64_t v85 = sub_134B6C(v81);
      if (!v85)
      {
        os_log_type_t v100 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_239;
      }

      v1 = (os_log_s *)v85;
      LOBYTE(v86) = sub_134BC0(v81);
      sub_DEDB0(0LL, v86 & 1);
      id v87 = *(id *)(v81 + 32);
      goto LABEL_50;
    case 'h':
      sub_DDB28();
      v1 = *(os_log_s **)(v3 + 27232);
      sub_DDD50();
      if (v22) {
        uint64_t v103 = v101;
      }
      else {
        uint64_t v103 = v102;
      }
      swift_bridgeObjectRelease(v103);
      sub_DE350();
      if (v22) {
        uint64_t v105 = v104;
      }
      else {
        uint64_t v105 = v7;
      }
      swift_bridgeObjectRelease(v105);
      sub_DE25C();
      if (v22) {
        uint64_t v107 = v106;
      }
      else {
        uint64_t v107 = v8;
      }
      swift_bridgeObjectRelease(v107);
      sub_2A184();
      uint64_t v108 = sub_DE10C();
      sub_DD888(v108, v109, v110, v111, v112, v113, v114, v115, v116);
      sub_A5DC(v2, (uint64_t)v5);
      uint64_t v117 = sub_DDFBC();
      Logger.logObject.getter(v117);
      os_log_type_t v118 = sub_AB70();
      if (sub_A634(v118))
      {
        sub_DDFE4();
        uint64_t v119 = *(void *)(v3 + 27232);
        v5 = *(void (**)(uint8_t *, os_log_s *, uint64_t))(v3 + 26736);
        v120 = (uint8_t *)sub_3635C();
        sub_DD450(v120);
        sub_DD8B0();
        v3074 = (void *)v2;
        sub_DA1C();
        sub_232EC( &dword_0,  v1,  (os_log_type_t)v4,  "got state .needsScheduleDisambiguation in SpecificMedLoggingFlow",  v120);
        sub_37128();

        uint64_t v121 = sub_DDCC0(v119);
      }

      else
      {
        v4 = *(void **)(v3 + 27400);
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        uint64_t v121 = sub_36D90();
        v3074 = *(void **)(v3 + 27616);
      }

      sub_DDE68( v121,  (SEL *)&selRef_matchingSchedules,  (uint64_t (*)(void))&type metadata accessor for MatchedMedSchedule);
      if (!v240)
      {
        sub_DDF34();
        v56 = *(uint8_t **)(v3 + 27216);
        uint64_t v2 = *(void *)(v3 + 26736);
        sub_A5DC((uint64_t)v1, v442);
        v5(v56, v1, v2);
        sub_23374();
        os_log_type_t v443 = sub_AB70();
        BOOL v444 = sub_37140(v443);
        v55 = *(void (**)(uint64_t))(v3 + 27400);
        if (v444)
        {
          v56 = (uint8_t *)sub_3635C();
          sub_DD450(v56);
          v12 = _swiftEmptyArrayStorage;
          uint64_t v2 = (uint64_t)v3074;
          sub_D9904((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v3109, (uint64_t)v3108, (uint64_t)v3099);
          sub_DE5F4();
          v445 = "Needed schedule disambiguation but intentResponse.matchingSchedules was nil.";
LABEL_215:
          sub_232EC(&dword_0, v1, (os_log_type_t)v8, v445, v56);
          sub_DE340();
        }

        else
        {
LABEL_216:

          swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        }

        uint64_t v457 = sub_37104();
        v55(v457);
LABEL_218:
        sub_DDE38();
        sub_DE23C(v4);
        sub_A178();
        sub_DDFA4();

LABEL_219:
LABEL_220:
        sub_BB2EC();
        sub_26F04(v2, type metadata accessor for SnippetHeaderModel);
        uint64_t v239 = (uint64_t)v56;
LABEL_221:
        sub_279E0(v239, &qword_189D00);
        uint64_t v387 = (uint64_t)v1;
        goto LABEL_222;
      }

      uint64_t v81 = v240;
      v3107 = _swiftEmptyArrayStorage;
      v3085 = (__int128 *)((uint64_t (*)(void))sub_134B6C)();
      if (!v3085)
      {
LABEL_159:
        v3067 = *(void **)(v3 + 27608);
        sub_DE03C();
        uint64_t v259 = *(void *)(v3 + 27528);
        sub_DE6E8();
        uint64_t v260 = *(void *)(v3 + 25976);
        sub_36C34();
        type metadata accessor for MedScheduleDisambiguationStrategy();
        sub_7DFCC((_OWORD *)(v260 + 64));
        sub_DE214(v260 + 24);
        sub_DE824();
        sub_9BC4C((void *)(v3 + 10208), v3099, (__int128 *)(v3 + 20408));
        uint64_t v262 = v261;
        uint64_t v263 = (uint64_t)v3107;
        swift_retain();
        sub_DE4B8();
        sub_D6ECC( v263,  v262,  (uint64_t)v3099,  &qword_18EAA0,  (void (*)(void))type metadata accessor for MedScheduleDisambiguationStrategy);
        *(void *)(v3 + 25848) = v264;
        sub_D6F6C(v260);
        sub_DEE5C();
        sub_3586C(&qword_18EAA8, &qword_18EAA0);
        uint64_t v265 = sub_DED10();
        sub_DE63C(v265, v266);
        sub_36EBC();

        sub_DEE3C();
        sub_DE21C(v259, v267, v268, v269, v270, v271, v272, v273, v1034);
        sub_39BAC();
        sub_DE104();
        uint64_t v274 = (uint64_t)v3074;
        goto LABEL_184;
      }

      v3073 = (void *)(v3 + 9888);
      uint64_t v3071 = v3 + 24632;
      LODWORD(v3091) = sub_134E40(v81);
      uint64_t v84 = 0LL;
      uint64_t v3080 = v81;
      while (1)
      {
        if ((v3091 & 1) != 0)
        {
          id v241 = sub_DEEE4(v81 + 8 * v84);
        }

        else
        {
          uint64_t v242 = sub_373E0();
          id v241 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v242, v243);
        }

        v86 = v241;
        v244 = (__int128 *)(v84 + 1);
        if (__OFADD__(v84, 1LL)) {
          break;
        }
        sub_DA6D8(v241, (SEL *)&selRef_scheduleID);
        if (!v246) {
          goto LABEL_249;
        }
        uint64_t v247 = v245;
        uint64_t v248 = v246;
        sub_DA6D8(v86, (SEL *)&selRef_schedule);
        if (!v250) {
          goto LABEL_248;
        }
        uint64_t v251 = v249;
        uint64_t v252 = v250;
        sub_DA6D8(v86, (SEL *)&selRef_medName);
        if (!v254)
        {
          uint64_t v1021 = v248;
LABEL_247:
          swift_bridgeObjectRelease(v1021);
LABEL_248:
          sub_2A184();
LABEL_249:
          sub_36C34();
          v1022 = *(os_log_s **)(v3 + 27376);
          swift_bridgeObjectRelease(v3107);
          sub_A5DC((uint64_t)v1022, v3071);
          sub_36170();
          sub_23374();
          os_log_type_t v1023 = sub_AB70();
          BOOL v1024 = sub_46514(v1023);
          v1025 = *(void (**)(uint64_t))(v3 + 27400);
          if (v1024)
          {
            v1026 = (uint8_t *)sub_3635C();
            sub_DD450(v1026);
            sub_D9904((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v3109, (uint64_t)v3108, (uint64_t)v3099);
            sub_B25F0();
            sub_232EC( &dword_0,  v1022,  (os_log_type_t)v244,  "Missing fields while unpacking matchingScheduleObjects from intentResponse, returning GenericErrorFlow",  v1026);
            sub_DE340();
          }

          else
          {

            swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
          }

          uint64_t v1027 = sub_373E0();
          v1025(v1027);
          v1028 = *(void **)(v3 + 27608);
          uint64_t v3078 = *(void *)(v3 + 27584);
          sub_DEEA8();
          uint64_t v3069 = *(void *)(v3 + 27560);
          uint64_t v1029 = *(void *)(v3 + 27552);
          uint64_t v1030 = *(void *)(v3 + 27544);
          uint64_t v1031 = *(void *)(v3 + 27536);
          uint64_t v1032 = *(void *)(v3 + 27528);
          uint64_t v3091 = *(void *)(v3 + 26728);
          uint64_t v3090 = *(void *)(v3 + 26688);
          uint64_t v3084 = *(void *)(v3 + 26432);
          v1033 = (_OWORD *)sub_DE9EC();
          sub_DE1B4(v1033);
          sub_DE23C(v3073);
          sub_A178();
          sub_DEA48();

          sub_DEE3C();
          sub_3561C(v1032, v1031, v1030, v1029, v3069, v3070, v3071, v3078, v1034);
          sub_DE104();
          sub_DEA50();
          sub_26F04(v3084, type metadata accessor for SnippetHeaderModel);
          uint64_t v1020 = v3090;
LABEL_253:
          sub_279E0(v1020, &qword_189D00);
          uint64_t v387 = v3091;
LABEL_222:
          sub_279E0(v387, &qword_18B168);
          goto LABEL_223;
        }

        uint64_t v255 = v253;
        uint64_t v256 = v254;
        sub_DA6D8(v86, (SEL *)&selRef_remainingMedCount);
        if (!v258)
        {
          sub_2A184();
          uint64_t v1021 = v252;
          goto LABEL_247;
        }

        *(void *)&__int128 v3100 = v247;
        *((void *)&v3100 + 1) = v248;
        uint64_t v3101 = v251;
        uint64_t v3102 = v252;
        uint64_t v3103 = v255;
        uint64_t v3104 = v256;
        uint64_t v3105 = v257;
        uint64_t v3106 = v258;
        v1 = (os_log_s *)&v3107;
        sub_BFC74(&v3100);

        ++v84;
        uint64_t v81 = v3080;
        if (v244 == v3085) {
          goto LABEL_159;
        }
      }

      while (1)
      {
        __break(1u);
LABEL_256:
        id v87 = (id)sub_DEA14(0LL);
LABEL_50:
        v88 = v87;
        sub_A38F8();
        sub_DA6D8(v88, (SEL *)&selRef_schedule);
        char v91 = sub_D6DA4(v89, v90, v84);
        sub_1EBF4();
        sub_2A184();
        if ((v91 & 1) != 0) {
          break;
        }
        v92 = 0LL;
        v93 = (char *)v1 - 1;
        while (1)
        {
          sub_DEE74();
          sub_D9B34((uint64_t *)v3099, v94, v95);

          swift_bridgeObjectRelease(*((void *)&v3099[0] + 1));
          if (v93 == v92)
          {
            os_log_type_t v100 = OS_LOG_TYPE_DEFAULT;
            goto LABEL_239;
          }

          v1 = (os_log_s *)(v92 + 1);
          sub_DEDB0((uint64_t)(v92 + 1), v86 & 1);
          id v96 = (v86 & 1) != 0
              ? *(id *)(v81 + 8LL * (void)v92 + 40)
              : (id)sub_DEA14((uint64_t)(v92 + 1));
          v88 = v96;
          if (__OFADD__(v1, 1LL)) {
            break;
          }
          uint64_t v84 = (uint64_t)v3107;
          sub_A38F8();
          sub_DEE74();
          char v99 = sub_D6DA4(v97, v98, v84);
          sub_1EBF4();
          sub_249D4();
          ++v92;
          if ((v99 & 1) != 0) {
            goto LABEL_58;
          }
        }

        __break(1u);
      }

LABEL_58:
      os_log_type_t v100 = OS_LOG_TYPE_INFO;
LABEL_239:
      sub_1EBF4();
      sub_36C34();
      uint64_t v982 = sub_4195C();
      getLocalizedMedName(from:)(v982, v983, v984, v985, v986, v987);
      uint64_t v989 = v988;
      sub_37034();
      if (!v989)
      {
        v1003 = (void *)(v3 + 24872);
        uint64_t v1004 = *(void *)(v3 + 27376);
        swift_bridgeObjectRelease(v3091);
        sub_A5DC(v1004, v3 + 24872);
        uint64_t v1005 = sub_ABE70();
        sub_BB230(v1005, v1006);
        sub_AB5C();
        os_log_type_t v1007 = sub_A898();
        BOOL v1008 = sub_37140(v1007);
        v1009 = *(void (**)(uint64_t, uint64_t))(v3 + 27400);
        uint64_t v1010 = *(void *)(v3 + 27248);
        uint64_t v1011 = *(void *)(v3 + 26736);
        if (v1008)
        {
          v1012 = (uint8_t *)sub_3635C();
          sub_DD450(v1012);
          sub_DDD3C();
          sub_82234();
          sub_232EC( &dword_0,  (os_log_s *)(v3 + 24872),  v100,  "Needed name disambiguation but unable to unwrap med name from task. Returning GenericErrorFlow",  v1012);
          sub_DE340();
        }

        else
        {

          swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        }

        v1009(v1010, v1011);
        v1013 = *(void **)(v3 + 27608);
        uint64_t v3072 = *(void *)(v3 + 27584);
        sub_DEEA8();
        uint64_t v1014 = *(void *)(v3 + 27560);
        uint64_t v1015 = *(void *)(v3 + 27552);
        uint64_t v1016 = *(void *)(v3 + 27544);
        uint64_t v1017 = *(void *)(v3 + 27536);
        uint64_t v1018 = *(void *)(v3 + 27528);
        sub_DE6CC();
        v1019 = (_OWORD *)sub_DE9DC();
        sub_DE1B4(v1019);
        sub_DE23C((void *)(v3 + 12288));
        sub_A178();
        sub_DDFA4();

        sub_DEE3C();
        sub_3561C(v1018, v1017, v1016, v1015, v1014, v3070, v3071, v3072, v1034);
        sub_DE104();
        sub_BB2EC();
        sub_26F04((uint64_t)v3073, type metadata accessor for SnippetHeaderModel);
        uint64_t v1020 = (uint64_t)v3074;
        goto LABEL_253;
      }

      v3068 = *(void **)(v3 + 27608);
      sub_DE03C();
      uint64_t v3066 = *(void *)(v3 + 27528);
      uint64_t v3089 = *(void *)(v3 + 26728);
      uint64_t v3083 = *(void *)(v3 + 26688);
      uint64_t v3077 = *(void *)(v3 + 26432);
      uint64_t v990 = *(void *)(v3 + 25976);
      type metadata accessor for MedNameDisambiguationStrategy();
      sub_36590((_OWORD *)(v990 + 64));
      sub_DEBC4(v990 + 24);
      sub_BFBDC(v3091);
      sub_DE824();
      sub_23858();
      swift_retain();
      sub_DE4B8();
      uint64_t v991 = sub_DED10();
      sub_D6ECC( v991,  v992,  v993,  &qword_18EAB0,  (void (*)(void))type metadata accessor for MedNameDisambiguationStrategy);
      *(void *)(v3 + 25808) = v994;
      v995 = sub_D6F3C(v990);
      sub_DEE5C();
      sub_3586C(&qword_18EAB8, &qword_18EAB0);
      sub_DE63C(v3 + 25808, (uint64_t)v995);
      sub_36EBC();

      sub_DEE3C();
      sub_DE21C(v3066, v996, v997, v998, v999, v1000, v1001, v1002, v1034);
      sub_36BE0();
      sub_DE104();
      sub_26F04(v3077, type metadata accessor for SnippetHeaderModel);
      sub_279E0(v3083, &qword_189D00);
      uint64_t v369 = v3089;
LABEL_185:
      sub_279E0(v369, &qword_18B168);
      sub_3652C();
LABEL_223:
      uint64_t v458 = sub_DCFFC();
      uint64_t v3076 = *(void *)(v3 + 26032);
      uint64_t v3082 = *(void *)(v3 + 26024);
      uint64_t v3087 = *(void *)(v3 + 26016);
      uint64_t v3094 = *(void *)(v3 + 26008);
      uint64_t v3098 = *(void *)(v3 + 25984);
      swift_task_dealloc(v458);
      sub_A8F4();
      sub_A85C();
      sub_A864();
      sub_A910();
      sub_A8EC();
      sub_A760();
      sub_A7C8();
      sub_A67C();
      uint64_t v459 = sub_A78C();
      uint64_t v467 = sub_A888(v459, v460, v461, v462, v463, v464, v465, v466, v1034, v1096, v1158);
      uint64_t v475 = sub_A854(v467, v468, v469, v470, v471, v472, v473, v474, v1035, v1097, v1159, v1220);
      uint64_t v483 = sub_A84C(v475, v476, v477, v478, v479, v480, v481, v482, v1036, v1098, v1160, v1221, v1281);
      uint64_t v491 = sub_A844(v483, v484, v485, v486, v487, v488, v489, v490, v1037, v1099, v1161, v1222, v1282, v1341);
      uint64_t v499 = sub_A83C(v491, v492, v493, v494, v495, v496, v497, v498, v1038, v1100, v1162, v1223, v1283, v1342, v1400);
      uint64_t v507 = sub_A95C( v499,  v500,  v501,  v502,  v503,  v504,  v505,  v506,  v1039,  v1101,  v1163,  v1224,  v1284,  v1343,  v1401,  v1458);
      uint64_t v515 = sub_A954( v507,  v508,  v509,  v510,  v511,  v512,  v513,  v514,  v1040,  v1102,  v1164,  v1225,  v1285,  v1344,  v1402,  v1459,  v1515);
      uint64_t v523 = sub_A938( v515,  v516,  v517,  v518,  v519,  v520,  v521,  v522,  v1041,  v1103,  v1165,  v1226,  v1286,  v1345,  v1403,  v1460,  v1516,  v1571);
      uint64_t v531 = sub_A930( v523,  v524,  v525,  v526,  v527,  v528,  v529,  v530,  v1042,  v1104,  v1166,  v1227,  v1287,  v1346,  v1404,  v1461,  v1517,  v1572,  v1626);
      uint64_t v539 = sub_A928( v531,  v532,  v533,  v534,  v535,  v536,  v537,  v538,  v1043,  v1105,  v1167,  v1228,  v1288,  v1347,  v1405,  v1462,  v1518,  v1573,  v1627,  v1680);
      uint64_t v547 = sub_A920( v539,  v540,  v541,  v542,  v543,  v544,  v545,  v546,  v1044,  v1106,  v1168,  v1229,  v1289,  v1348,  v1406,  v1463,  v1519,  v1574,  v1628,  v1681,  v1733);
      uint64_t v555 = sub_36374( v547,  v548,  v549,  v550,  v551,  v552,  v553,  v554,  v1045,  v1107,  v1169,  v1230,  v1290,  v1349,  v1407,  v1464,  v1520,  v1575,  v1629,  v1682,  v1734,  v1785);
      uint64_t v563 = sub_3636C( v555,  v556,  v557,  v558,  v559,  v560,  v561,  v562,  v1046,  v1108,  v1170,  v1231,  v1291,  v1350,  v1408,  v1465,  v1521,  v1576,  v1630,  v1683,  v1735,  v1786,  v1836);
      uint64_t v571 = sub_36364( v563,  v564,  v565,  v566,  v567,  v568,  v569,  v570,  v1047,  v1109,  v1171,  v1232,  v1292,  v1351,  v1409,  v1466,  v1522,  v1577,  v1631,  v1684,  v1736,  v1787,  v1837,  v1886);
      uint64_t v579 = sub_363F0( v571,  v572,  v573,  v574,  v575,  v576,  v577,  v578,  v1048,  v1110,  v1172,  v1233,  v1293,  v1352,  v1410,  v1467,  v1523,  v1578,  v1632,  v1685,  v1737,  v1788,  v1838,  v1887,  v1935);
      uint64_t v587 = sub_36430( v579,  v580,  v581,  v582,  v583,  v584,  v585,  v586,  v1049,  v1111,  v1173,  v1234,  v1294,  v1353,  v1411,  v1468,  v1524,  v1579,  v1633,  v1686,  v1738,  v1789,  v1839,  v1888,  v1936,  v1983);
      uint64_t v595 = sub_36428( v587,  v588,  v589,  v590,  v591,  v592,  v593,  v594,  v1050,  v1112,  v1174,  v1235,  v1295,  v1354,  v1412,  v1469,  v1525,  v1580,  v1634,  v1687,  v1739,  v1790,  v1840,  v1889,  v1937,  v1984,  v2030);
      uint64_t v603 = sub_36478( v595,  v596,  v597,  v598,  v599,  v600,  v601,  v602,  v1051,  v1113,  v1175,  v1236,  v1296,  v1355,  v1413,  v1470,  v1526,  v1581,  v1635,  v1688,  v1740,  v1791,  v1841,  v1890,  v1938,  v1985,  v2031,  v2076);
      uint64_t v611 = sub_36524( v603,  v604,  v605,  v606,  v607,  v608,  v609,  v610,  v1052,  v1114,  v1176,  v1237,  v1297,  v1356,  v1414,  v1471,  v1527,  v1582,  v1636,  v1689,  v1741,  v1792,  v1842,  v1891,  v1939,  v1986,  v2032,  v2077,  v2121);
      uint64_t v619 = sub_3651C( v611,  v612,  v613,  v614,  v615,  v616,  v617,  v618,  v1053,  v1115,  v1177,  v1238,  v1298,  v1357,  v1415,  v1472,  v1528,  v1583,  v1637,  v1690,  v1742,  v1793,  v1843,  v1892,  v1940,  v1987,  v2033,  v2078,  v2122,  v2165);
      uint64_t v627 = sub_36514( v619,  v620,  v621,  v622,  v623,  v624,  v625,  v626,  v1054,  v1116,  v1178,  v1239,  v1299,  v1358,  v1416,  v1473,  v1529,  v1584,  v1638,  v1691,  v1743,  v1794,  v1844,  v1893,  v1941,  v1988,  v2034,  v2079,  v2123,  v2166,  v2208);
      uint64_t v635 = sub_3650C( v627,  v628,  v629,  v630,  v631,  v632,  v633,  v634,  v1055,  v1117,  v1179,  v1240,  v1300,  v1359,  v1417,  v1474,  v1530,  v1585,  v1639,  v1692,  v1744,  v1795,  v1845,  v1894,  v1942,  v1989,  v2035,  v2080,  v2124,  v2167,  v2209,  v2250);
      uint64_t v643 = sub_36504( v635,  v636,  v637,  v638,  v639,  v640,  v641,  v642,  v1056,  v1118,  v1180,  v1241,  v1301,  v1360,  v1418,  v1475,  v1531,  v1586,  v1640,  v1693,  v1745,  v1796,  v1846,  v1895,  v1943,  v1990,  v2036,  v2081,  v2125,  v2168,  v2210,  v2251,  v2291);
      uint64_t v651 = sub_364FC( v643,  v644,  v645,  v646,  v647,  v648,  v649,  v650,  v1057,  v1119,  v1181,  v1242,  v1302,  v1361,  v1419,  v1476,  v1532,  v1587,  v1641,  v1694,  v1746,  v1797,  v1847,  v1896,  v1944,  v1991,  v2037,  v2082,  v2126,  v2169,  v2211,  v2252,  v2292,  v2331);
      uint64_t v659 = sub_364F4( v651,  v652,  v653,  v654,  v655,  v656,  v657,  v658,  v1058,  v1120,  v1182,  v1243,  v1303,  v1362,  v1420,  v1477,  v1533,  v1588,  v1642,  v1695,  v1747,  v1798,  v1848,  v1897,  v1945,  v1992,  v2038,  v2083,  v2127,  v2170,  v2212,  v2253,  v2293,  v2332,  v2370);
      uint64_t v667 = sub_364EC( v659,  v660,  v661,  v662,  v663,  v664,  v665,  v666,  v1059,  v1121,  v1183,  v1244,  v1304,  v1363,  v1421,  v1478,  v1534,  v1589,  v1643,  v1696,  v1748,  v1799,  v1849,  v1898,  v1946,  v1993,  v2039,  v2084,  v2128,  v2171,  v2213,  v2254,  v2294,  v2333,  v2371,  v2408);
      uint64_t v675 = sub_364E4( v667,  v668,  v669,  v670,  v671,  v672,  v673,  v674,  v1060,  v1122,  v1184,  v1245,  v1305,  v1364,  v1422,  v1479,  v1535,  v1590,  v1644,  v1697,  v1749,  v1800,  v1850,  v1899,  v1947,  v1994,  v2040,  v2085,  v2129,  v2172,  v2214,  v2255,  v2295,  v2334,  v2372,  v2409,  v2445);
      uint64_t v683 = sub_364DC( v675,  v676,  v677,  v678,  v679,  v680,  v681,  v682,  v1061,  v1123,  v1185,  v1246,  v1306,  v1365,  v1423,  v1480,  v1536,  v1591,  v1645,  v1698,  v1750,  v1801,  v1851,  v1900,  v1948,  v1995,  v2041,  v2086,  v2130,  v2173,  v2215,  v2256,  v2296,  v2335,  v2373,  v2410,  v2446,  v2481);
      uint64_t v691 = sub_364D4( v683,  v684,  v685,  v686,  v687,  v688,  v689,  v690,  v1062,  v1124,  v1186,  v1247,  v1307,  v1366,  v1424,  v1481,  v1537,  v1592,  v1646,  v1699,  v1751,  v1802,  v1852,  v1901,  v1949,  v1996,  v2042,  v2087,  v2131,  v2174,  v2216,  v2257,  v2297,  v2336,  v2374,  v2411,  v2447,  v2482,  v2516);
      uint64_t v699 = sub_366F8( v691,  v692,  v693,  v694,  v695,  v696,  v697,  v698,  v1063,  v1125,  v1187,  v1248,  v1308,  v1367,  v1425,  v1482,  v1538,  v1593,  v1647,  v1700,  v1752,  v1803,  v1853,  v1902,  v1950,  v1997,  v2043,  v2088,  v2132,  v2175,  v2217,  v2258,  v2298,  v2337,  v2375,  v2412,  v2448,  v2483,  v2517,  v2550);
      uint64_t v707 = sub_366F0( v699,  v700,  v701,  v702,  v703,  v704,  v705,  v706,  v1064,  v1126,  v1188,  v1249,  v1309,  v1368,  v1426,  v1483,  v1539,  v1594,  v1648,  v1701,  v1753,  v1804,  v1854,  v1903,  v1951,  v1998,  v2044,  v2089,  v2133,  v2176,  v2218,  v2259,  v2299,  v2338,  v2376,  v2413,  v2449,  v2484,  v2518,  v2551,  v2583);
      uint64_t v715 = sub_36B90( v707,  v708,  v709,  v710,  v711,  v712,  v713,  v714,  v1065,  v1127,  v1189,  v1250,  v1310,  v1369,  v1427,  v1484,  v1540,  v1595,  v1649,  v1702,  v1754,  v1805,  v1855,  v1904,  v1952,  v1999,  v2045,  v2090,  v2134,  v2177,  v2219,  v2260,  v2300,  v2339,  v2377,  v2414,  v2450,  v2485,  v2519,  v2552,  v2584,  v2615);
      uint64_t v723 = sub_36EF4( v715,  v716,  v717,  v718,  v719,  v720,  v721,  v722,  v1066,  v1128,  v1190,  v1251,  v1311,  v1370,  v1428,  v1485,  v1541,  v1596,  v1650,  v1703,  v1755,  v1806,  v1856,  v1905,  v1953,  v2000,  v2046,  v2091,  v2135,  v2178,  v2220,  v2261,  v2301,  v2340,  v2378,  v2415,  v2451,  v2486,  v2520,  v2553,  v2585,  v2616,  v2646);
      uint64_t v731 = sub_36EEC( v723,  v724,  v725,  v726,  v727,  v728,  v729,  v730,  v1067,  v1129,  v1191,  v1252,  v1312,  v1371,  v1429,  v1486,  v1542,  v1597,  v1651,  v1704,  v1756,  v1807,  v1857,  v1906,  v1954,  v2001,  v2047,  v2092,  v2136,  v2179,  v2221,  v2262,  v2302,  v2341,  v2379,  v2416,  v2452,  v2487,  v2521,  v2554,  v2586,  v2617,  v2647,  v2676);
      uint64_t v739 = sub_DD7E4( v731,  v732,  v733,  v734,  v735,  v736,  v737,  v738,  v1068,  v1130,  v1192,  v1253,  v1313,  v1372,  v1430,  v1487,  v1543,  v1598,  v1652,  v1705,  v1757,  v1808,  v1858,  v1907,  v1955,  v2002,  v2048,  v2093,  v2137,  v2180,  v2222,  v2263,  v2303,  v2342,  v2380,  v2417,  v2453,  v2488,  v2522,  v2555,  v2587,  v2618,  v2648,  v2677,  v2705);
      uint64_t v747 = sub_DD7DC( v739,  v740,  v741,  v742,  v743,  v744,  v745,  v746,  v1069,  v1131,  v1193,  v1254,  v1314,  v1373,  v1431,  v1488,  v1544,  v1599,  v1653,  v1706,  v1758,  v1809,  v1859,  v1908,  v1956,  v2003,  v2049,  v2094,  v2138,  v2181,  v2223,  v2264,  v2304,  v2343,  v2381,  v2418,  v2454,  v2489,  v2523,  v2556,  v2588,  v2619,  v2649,  v2678,  v2706,  v2733);
      uint64_t v755 = sub_DD7D4( v747,  v748,  v749,  v750,  v751,  v752,  v753,  v754,  v1070,  v1132,  v1194,  v1255,  v1315,  v1374,  v1432,  v1489,  v1545,  v1600,  v1654,  v1707,  v1759,  v1810,  v1860,  v1909,  v1957,  v2004,  v2050,  v2095,  v2139,  v2182,  v2224,  v2265,  v2305,  v2344,  v2382,  v2419,  v2455,  v2490,  v2524,  v2557,  v2589,  v2620,  v2650,  v2679,  v2707,  v2734,  v2760);
      uint64_t v763 = sub_DD7CC( v755,  v756,  v757,  v758,  v759,  v760,  v761,  v762,  v1071,  v1133,  v1195,  v1256,  v1316,  v1375,  v1433,  v1490,  v1546,  v1601,  v1655,  v1708,  v1760,  v1811,  v1861,  v1910,  v1958,  v2005,  v2051,  v2096,  v2140,  v2183,  v2225,  v2266,  v2306,  v2345,  v2383,  v2420,  v2456,  v2491,  v2525,  v2558,  v2590,  v2621,  v2651,  v2680,  v2708,  v2735,  v2761,  v2786);
      uint64_t v771 = sub_DD7C4( v763,  v764,  v765,  v766,  v767,  v768,  v769,  v770,  v1072,  v1134,  v1196,  v1257,  v1317,  v1376,  v1434,  v1491,  v1547,  v1602,  v1656,  v1709,  v1761,  v1812,  v1862,  v1911,  v1959,  v2006,  v2052,  v2097,  v2141,  v2184,  v2226,  v2267,  v2307,  v2346,  v2384,  v2421,  v2457,  v2492,  v2526,  v2559,  v2591,  v2622,  v2652,  v2681,  v2709,  v2736,  v2762,  v2787,  v2811);
      uint64_t v779 = sub_DD7BC( v771,  v772,  v773,  v774,  v775,  v776,  v777,  v778,  v1073,  v1135,  v1197,  v1258,  v1318,  v1377,  v1435,  v1492,  v1548,  v1603,  v1657,  v1710,  v1762,  v1813,  v1863,  v1912,  v1960,  v2007,  v2053,  v2098,  v2142,  v2185,  v2227,  v2268,  v2308,  v2347,  v2385,  v2422,  v2458,  v2493,  v2527,  v2560,  v2592,  v2623,  v2653,  v2682,  v2710,  v2737,  v2763,  v2788,  v2812,
               v2835);
      uint64_t v787 = sub_DD7B4( v779,  v780,  v781,  v782,  v783,  v784,  v785,  v786,  v1074,  v1136,  v1198,  v1259,  v1319,  v1378,  v1436,  v1493,  v1549,  v1604,  v1658,  v1711,  v1763,  v1814,  v1864,  v1913,  v1961,  v2008,  v2054,  v2099,  v2143,  v2186,  v2228,  v2269,  v2309,  v2348,  v2386,  v2423,  v2459,  v2494,  v2528,  v2561,  v2593,  v2624,  v2654,  v2683,  v2711,  v2738,  v2764,  v2789,  v2813,
               v2836,
               v2858);
      uint64_t v795 = sub_DD7AC( v787,  v788,  v789,  v790,  v791,  v792,  v793,  v794,  v1075,  v1137,  v1199,  v1260,  v1320,  v1379,  v1437,  v1494,  v1550,  v1605,  v1659,  v1712,  v1764,  v1815,  v1865,  v1914,  v1962,  v2009,  v2055,  v2100,  v2144,  v2187,  v2229,  v2270,  v2310,  v2349,  v2387,  v2424,  v2460,  v2495,  v2529,  v2562,  v2594,  v2625,  v2655,  v2684,  v2712,  v2739,  v2765,  v2790,  v2814,
               v2837,
               v2859,
               v2880);
      uint64_t v803 = sub_DD7A4( v795,  v796,  v797,  v798,  v799,  v800,  v801,  v802,  v1076,  v1138,  v1200,  v1261,  v1321,  v1380,  v1438,  v1495,  v1551,  v1606,  v1660,  v1713,  v1765,  v1816,  v1866,  v1915,  v1963,  v2010,  v2056,  v2101,  v2145,  v2188,  v2230,  v2271,  v2311,  v2350,  v2388,  v2425,  v2461,  v2496,  v2530,  v2563,  v2595,  v2626,  v2656,  v2685,  v2713,  v2740,  v2766,  v2791,  v2815,
               v2838,
               v2860,
               v2881,
               v2901);
      uint64_t v811 = sub_DD79C( v803,  v804,  v805,  v806,  v807,  v808,  v809,  v810,  v1077,  v1139,  v1201,  v1262,  v1322,  v1381,  v1439,  v1496,  v1552,  v1607,  v1661,  v1714,  v1766,  v1817,  v1867,  v1916,  v1964,  v2011,  v2057,  v2102,  v2146,  v2189,  v2231,  v2272,  v2312,  v2351,  v2389,  v2426,  v2462,  v2497,  v2531,  v2564,  v2596,  v2627,  v2657,  v2686,  v2714,  v2741,  v2767,  v2792,  v2816,
               v2839,
               v2861,
               v2882,
               v2902,
               v2921);
      uint64_t v819 = sub_DD794( v811,  v812,  v813,  v814,  v815,  v816,  v817,  v818,  v1078,  v1140,  v1202,  v1263,  v1323,  v1382,  v1440,  v1497,  v1553,  v1608,  v1662,  v1715,  v1767,  v1818,  v1868,  v1917,  v1965,  v2012,  v2058,  v2103,  v2147,  v2190,  v2232,  v2273,  v2313,  v2352,  v2390,  v2427,  v2463,  v2498,  v2532,  v2565,  v2597,  v2628,  v2658,  v2687,  v2715,  v2742,  v2768,  v2793,  v2817,
               v2840,
               v2862,
               v2883,
               v2903,
               v2922,
               v2940);
      uint64_t v827 = sub_DD78C( v819,  v820,  v821,  v822,  v823,  v824,  v825,  v826,  v1079,  v1141,  v1203,  v1264,  v1324,  v1383,  v1441,  v1498,  v1554,  v1609,  v1663,  v1716,  v1768,  v1819,  v1869,  v1918,  v1966,  v2013,  v2059,  v2104,  v2148,  v2191,  v2233,  v2274,  v2314,  v2353,  v2391,  v2428,  v2464,  v2499,  v2533,  v2566,  v2598,  v2629,  v2659,  v2688,  v2716,  v2743,  v2769,  v2794,  v2818,
               v2841,
               v2863,
               v2884,
               v2904,
               v2923,
               v2941,
               v2958);
      uint64_t v835 = sub_DD784( v827,  v828,  v829,  v830,  v831,  v832,  v833,  v834,  v1080,  v1142,  v1204,  v1265,  v1325,  v1384,  v1442,  v1499,  v1555,  v1610,  v1664,  v1717,  v1769,  v1820,  v1870,  v1919,  v1967,  v2014,  v2060,  v2105,  v2149,  v2192,  v2234,  v2275,  v2315,  v2354,  v2392,  v2429,  v2465,  v2500,  v2534,  v2567,  v2599,  v2630,  v2660,  v2689,  v2717,  v2744,  v2770,  v2795,  v2819,
               v2842,
               v2864,
               v2885,
               v2905,
               v2924,
               v2942,
               v2959,
               v2975);
      uint64_t v843 = sub_DD77C( v835,  v836,  v837,  v838,  v839,  v840,  v841,  v842,  v1081,  v1143,  v1205,  v1266,  v1326,  v1385,  v1443,  v1500,  v1556,  v1611,  v1665,  v1718,  v1770,  v1821,  v1871,  v1920,  v1968,  v2015,  v2061,  v2106,  v2150,  v2193,  v2235,  v2276,  v2316,  v2355,  v2393,  v2430,  v2466,  v2501,  v2535,  v2568,  v2600,  v2631,  v2661,  v2690,  v2718,  v2745,  v2771,  v2796,  v2820,
               v2843,
               v2865,
               v2886,
               v2906,
               v2925,
               v2943,
               v2960,
               v2976,
               v2991);
      uint64_t v851 = sub_DD774( v843,  v844,  v845,  v846,  v847,  v848,  v849,  v850,  v1082,  v1144,  v1206,  v1267,  v1327,  v1386,  v1444,  v1501,  v1557,  v1612,  v1666,  v1719,  v1771,  v1822,  v1872,  v1921,  v1969,  v2016,  v2062,  v2107,  v2151,  v2194,  v2236,  v2277,  v2317,  v2356,  v2394,  v2431,  v2467,  v2502,  v2536,  v2569,  v2601,  v2632,  v2662,  v2691,  v2719,  v2746,  v2772,  v2797,  v2821,
               v2844,
               v2866,
               v2887,
               v2907,
               v2926,
               v2944,
               v2961,
               v2977,
               v2992,
               v3006);
      uint64_t v859 = sub_DD76C( v851,  v852,  v853,  v854,  v855,  v856,  v857,  v858,  v1083,  v1145,  v1207,  v1268,  v1328,  v1387,  v1445,  v1502,  v1558,  v1613,  v1667,  v1720,  v1772,  v1823,  v1873,  v1922,  v1970,  v2017,  v2063,  v2108,  v2152,  v2195,  v2237,  v2278,  v2318,  v2357,  v2395,  v2432,  v2468,  v2503,  v2537,  v2570,  v2602,  v2633,  v2663,  v2692,  v2720,  v2747,  v2773,  v2798,  v2822,
               v2845,
               v2867,
               v2888,
               v2908,
               v2927,
               v2945,
               v2962,
               v2978,
               v2993,
               v3007,
               v3020);
      uint64_t v867 = sub_DD764( v859,  v860,  v861,  v862,  v863,  v864,  v865,  v866,  v1084,  v1146,  v1208,  v1269,  v1329,  v1388,  v1446,  v1503,  v1559,  v1614,  v1668,  v1721,  v1773,  v1824,  v1874,  v1923,  v1971,  v2018,  v2064,  v2109,  v2153,  v2196,  v2238,  v2279,  v2319,  v2358,  v2396,  v2433,  v2469,  v2504,  v2538,  v2571,  v2603,  v2634,  v2664,  v2693,  v2721,  v2748,  v2774,  v2799,  v2823,
               v2846,
               v2868,
               v2889,
               v2909,
               v2928,
               v2946,
               v2963,
               v2979,
               v2994,
               v3008,
               v3021,
               v3033);
      uint64_t v875 = sub_DD75C( v867,  v868,  v869,  v870,  v871,  v872,  v873,  v874,  v1085,  v1147,  v1209,  v1270,  v1330,  v1389,  v1447,  v1504,  v1560,  v1615,  v1669,  v1722,  v1774,  v1825,  v1875,  v1924,  v1972,  v2019,  v2065,  v2110,  v2154,  v2197,  v2239,  v2280,  v2320,  v2359,  v2397,  v2434,  v2470,  v2505,  v2539,  v2572,  v2604,  v2635,  v2665,  v2694,  v2722,  v2749,  v2775,  v2800,  v2824,
               v2847,
               v2869,
               v2890,
               v2910,
               v2929,
               v2947,
               v2964,
               v2980,
               v2995,
               v3009,
               v3022,
               v3034,
               v3045);
      uint64_t v883 = sub_DD754( v875,  v876,  v877,  v878,  v879,  v880,  v881,  v882,  v1086,  v1148,  v1210,  v1271,  v1331,  v1390,  v1448,  v1505,  v1561,  v1616,  v1670,  v1723,  v1775,  v1826,  v1876,  v1925,  v1973,  v2020,  v2066,  v2111,  v2155,  v2198,  v2240,  v2281,  v2321,  v2360,  v2398,  v2435,  v2471,  v2506,  v2540,  v2573,  v2605,  v2636,  v2666,  v2695,  v2723,  v2750,  v2776,  v2801,  v2825,
               v2848,
               v2870,
               v2891,
               v2911,
               v2930,
               v2948,
               v2965,
               v2981,
               v2996,
               v3010,
               v3023,
               v3035,
               v3046,
               v3056);
      uint64_t v891 = sub_DD74C( v883,  v884,  v885,  v886,  v887,  v888,  v889,  v890,  v1087,  v1149,  v1211,  v1272,  v1332,  v1391,  v1449,  v1506,  v1562,  v1617,  v1671,  v1724,  v1776,  v1827,  v1877,  v1926,  v1974,  v2021,  v2067,  v2112,  v2156,  v2199,  v2241,  v2282,  v2322,  v2361,  v2399,  v2436,  v2472,  v2507,  v2541,  v2574,  v2606,  v2637,  v2667,  v2696,  v2724,  v2751,  v2777,  v2802,  v2826,
               v2849,
               v2871,
               v2892,
               v2912,
               v2931,
               v2949,
               v2966,
               v2982,
               v2997,
               v3011,
               v3024,
               v3036,
               v3047,
               v3057);
      uint64_t v899 = sub_DD744( v891,  v892,  v893,  v894,  v895,  v896,  v897,  v898,  v1088,  v1150,  v1212,  v1273,  v1333,  v1392,  v1450,  v1507,  v1563,  v1618,  v1672,  v1725,  v1777,  v1828,  v1878,  v1927,  v1975,  v2022,  v2068,  v2113,  v2157,  v2200,  v2242,  v2283,  v2323,  v2362,  v2400,  v2437,  v2473,  v2508,  v2542,  v2575,  v2607,  v2638,  v2668,  v2697,  v2725,  v2752,  v2778,  v2803,  v2827,
               v2850,
               v2872,
               v2893,
               v2913,
               v2932,
               v2950,
               v2967,
               v2983,
               v2998,
               v3012,
               v3025,
               v3037,
               v3048,
               v3058);
      uint64_t v907 = sub_DD73C( v899,  v900,  v901,  v902,  v903,  v904,  v905,  v906,  v1089,  v1151,  v1213,  v1274,  v1334,  v1393,  v1451,  v1508,  v1564,  v1619,  v1673,  v1726,  v1778,  v1829,  v1879,  v1928,  v1976,  v2023,  v2069,  v2114,  v2158,  v2201,  v2243,  v2284,  v2324,  v2363,  v2401,  v2438,  v2474,  v2509,  v2543,  v2576,  v2608,  v2639,  v2669,  v2698,  v2726,  v2753,  v2779,  v2804,  v2828,
               v2851,
               v2873,
               v2894,
               v2914,
               v2933,
               v2951,
               v2968,
               v2984,
               v2999,
               v3013,
               v3026,
               v3038,
               v3049,
               v3059);
      uint64_t v915 = sub_DD734( v907,  v908,  v909,  v910,  v911,  v912,  v913,  v914,  v1090,  v1152,  v1214,  v1275,  v1335,  v1394,  v1452,  v1509,  v1565,  v1620,  v1674,  v1727,  v1779,  v1830,  v1880,  v1929,  v1977,  v2024,  v2070,  v2115,  v2159,  v2202,  v2244,  v2285,  v2325,  v2364,  v2402,  v2439,  v2475,  v2510,  v2544,  v2577,  v2609,  v2640,  v2670,  v2699,  v2727,  v2754,  v2780,  v2805,  v2829,
               v2852,
               v2874,
               v2895,
               v2915,
               v2934,
               v2952,
               v2969,
               v2985,
               v3000,
               v3014,
               v3027,
               v3039,
               v3050,
               v3060);
      uint64_t v923 = sub_DD72C( v915,  v916,  v917,  v918,  v919,  v920,  v921,  v922,  v1091,  v1153,  v1215,  v1276,  v1336,  v1395,  v1453,  v1510,  v1566,  v1621,  v1675,  v1728,  v1780,  v1831,  v1881,  v1930,  v1978,  v2025,  v2071,  v2116,  v2160,  v2203,  v2245,  v2286,  v2326,  v2365,  v2403,  v2440,  v2476,  v2511,  v2545,  v2578,  v2610,  v2641,  v2671,  v2700,  v2728,  v2755,  v2781,  v2806,  v2830,
               v2853,
               v2875,
               v2896,
               v2916,
               v2935,
               v2953,
               v2970,
               v2986,
               v3001,
               v3015,
               v3028,
               v3040,
               v3051,
               v3061);
      uint64_t v931 = sub_DD724( v923,  v924,  v925,  v926,  v927,  v928,  v929,  v930,  v1092,  v1154,  v1216,  v1277,  v1337,  v1396,  v1454,  v1511,  v1567,  v1622,  v1676,  v1729,  v1781,  v1832,  v1882,  v1931,  v1979,  v2026,  v2072,  v2117,  v2161,  v2204,  v2246,  v2287,  v2327,  v2366,  v2404,  v2441,  v2477,  v2512,  v2546,  v2579,  v2611,  v2642,  v2672,  v2701,  v2729,  v2756,  v2782,  v2807,  v2831,
               v2854,
               v2876,
               v2897,
               v2917,
               v2936,
               v2954,
               v2971,
               v2987,
               v3002,
               v3016,
               v3029,
               v3041,
               v3052,
               v3062);
      uint64_t v939 = sub_DD71C( v931,  v932,  v933,  v934,  v935,  v936,  v937,  v938,  v1093,  v1155,  v1217,  v1278,  v1338,  v1397,  v1455,  v1512,  v1568,  v1623,  v1677,  v1730,  v1782,  v1833,  v1883,  v1932,  v1980,  v2027,  v2073,  v2118,  v2162,  v2205,  v2247,  v2288,  v2328,  v2367,  v2405,  v2442,  v2478,  v2513,  v2547,  v2580,  v2612,  v2643,  v2673,  v2702,  v2730,  v2757,  v2783,  v2808,  v2832,
               v2855,
               v2877,
               v2898,
               v2918,
               v2937,
               v2955,
               v2972,
               v2988,
               v3003,
               v3017,
               v3030,
               v3042,
               v3053,
               v3063);
      uint64_t v947 = sub_DD714( v939,  v940,  v941,  v942,  v943,  v944,  v945,  v946,  v1094,  v1156,  v1218,  v1279,  v1339,  v1398,  v1456,  v1513,  v1569,  v1624,  v1678,  v1731,  v1783,  v1834,  v1884,  v1933,  v1981,  v2028,  v2074,  v2119,  v2163,  v2206,  v2248,  v2289,  v2329,  v2368,  v2406,  v2443,  v2479,  v2514,  v2548,  v2581,  v2613,  v2644,  v2674,  v2703,  v2731,  v2758,  v2784,  v2809,  v2833,
               v2856,
               v2878,
               v2899,
               v2919,
               v2938,
               v2956,
               v2973,
               v2989,
               v3004,
               v3018,
               v3031,
               v3043,
               v3054,
               v3064);
      sub_DD70C( v947,  v948,  v949,  v950,  v951,  v952,  v953,  v954,  v1095,  v1157,  v1219,  v1280,  v1340,  v1399,  v1457,  v1514,  v1570,  v1625,  v1679,  v1732,  v1784,  v1835,  v1885,  v1934,  v1982,  v2029,  v2075,  v2120,  v2164,  v2207,  v2249,  v2290,  v2330,  v2369,  v2407,  v2444,  v2480,  v2515,  v2549,  v2582,  v2614,  v2645,  v2675,  v2704,  v2732,  v2759,  v2785,  v2810,  v2834,
        v2857,
        v2879,
        v2900,
        v2920,
        v2939,
        v2957,
        v2974,
        v2990,
        v3005,
        v3019,
        v3032,
        v3044,
        v3055,
        v3065);
      sub_DD704();
      sub_DD6FC();
      sub_DD6F4();
      sub_DD6EC();
      sub_DD6E4();
      sub_DD6DC();
      sub_DD6D4();
      sub_DD6CC();
      sub_DD6C4();
      sub_DD6BC();
      sub_DD6B4();
      sub_DD6AC();
      sub_DD6A4();
      sub_DD69C();
      sub_DD694();
      sub_DD68C();
      sub_DD684();
      sub_DD67C();
      sub_DD674();
      sub_DD66C();
      sub_DD664();
      sub_DD65C();
      sub_DD654();
      sub_DD64C();
      sub_DD644();
      sub_DD63C();
      sub_DD634();
      sub_DD62C();
      sub_DD624();
      sub_DD61C();
      sub_DD614();
      sub_DD60C();
      sub_DD604();
      sub_DD5FC();
      sub_DD5F4();
      sub_DD5EC();
      sub_DD5E4();
      sub_DD5DC();
      sub_DD5D4();
      sub_DD5CC();
      sub_DD5C4();
      sub_DD5BC();
      sub_DD5B4();
      sub_DD5AC();
      sub_DD5A4();
      sub_DD59C();
      sub_DD594();
      sub_DD58C();
      sub_DD584();
      sub_DD57C();
      sub_DD574();
      sub_DD56C();
      sub_DD564();
      sub_DD55C();
      sub_DD554();
      sub_DD54C();
      sub_DD544();
      sub_DD53C();
      sub_DD534();
      sub_DD52C();
      sub_DD524();
      sub_DD51C();
      sub_DD514();
      sub_DD50C();
      sub_DD504();
      sub_DD4FC();
      sub_DD4F4();
      sub_DD4EC();
      sub_DD4DC();
      sub_DD4E4();
      sub_DD868();
      sub_DD870();
      sub_DDA48();
      sub_DDA58();
      sub_DDE30();
      sub_DDE28();
      sub_DE6BC();
      sub_DE6B4();
      sub_DE6AC();
      sub_DE6A4();
      sub_DE69C();
      sub_DE694();
      sub_DEA78();
      sub_DEA70();
      sub_DEA68();
      sub_DEB50();
      swift_task_dealloc(v3076);
      swift_task_dealloc(v3082);
      swift_task_dealloc(v3087);
      swift_task_dealloc(v3094);
      swift_task_dealloc(v3098);
      return sub_DDE8C(*(uint64_t (**)(void))(v3 + 8));
    case 'i':
      sub_DD990();
      sub_DDD24();
      if (v22) {
        uint64_t v124 = v123;
      }
      else {
        uint64_t v124 = v122;
      }
      swift_bridgeObjectRelease(v124);
      sub_DDFD8();
      if (v22) {
        uint64_t v126 = v125;
      }
      else {
        uint64_t v126 = v6;
      }
      swift_bridgeObjectRelease(v126);
      sub_DDFCC();
      if (v22) {
        uint64_t v128 = v127;
      }
      else {
        uint64_t v128 = v7;
      }
      swift_bridgeObjectRelease(v128);
      sub_2A184();
      sub_A5DC(v2, (uint64_t)v1);
      sub_DDBF0();
      sub_AB5C();
      os_log_type_t v129 = sub_AB70();
      if (sub_A988(v129))
      {
        sub_DDFE4();
        uint64_t v130 = *(void *)(v3 + 27272);
        v131 = (uint8_t *)sub_3635C();
        sub_DD450(v131);
        sub_DD8B0();
        sub_DA1C();
        sub_232EC(&dword_0, v1, v0, "Received failure intent response, creating output.", v131);
        sub_37128();

        sub_DDCC0(v130);
      }

      else
      {
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        sub_36D90();
      }

      sub_DE3E4();
      *(void *)(v3 + 27736) = v1;
      sub_363E8();
      uint64_t v275 = sub_732B8();
      getLocalizedMedName(from:)(v275, v276, v277, v278, v279, v280);
      uint64_t v282 = v281;
      uint64_t v284 = v283;
      sub_36BE0();
      if (v284)
      {
        sub_DE710(v282);
        sub_2A184();
        uint64_t v286 = 0LL;
      }

      else
      {
        uint64_t v286 = 1LL;
      }

      sub_A66C(*(void *)(v3 + 26632), v286, v285, *(void *)(v3 + 26384));
      sub_D6D50();
      v446 = (void *)swift_task_alloc(dword_190C34);
      *(void *)(v3 + 27744) = v446;
      void *v446 = v3;
      v446[1] = sub_C6FC4;
      uint64_t v447 = sub_DEAF4(*(void *)(v3 + 26632));
      return sub_132290(v447, v448, v449);
    case 'j':
      v3096 = v12;
      sub_DDB28();
      v1 = *(os_log_s **)(v3 + 27208);
      sub_DDD50();
      if (v22) {
        uint64_t v134 = v132;
      }
      else {
        uint64_t v134 = v133;
      }
      swift_bridgeObjectRelease(v134);
      sub_DE350();
      if (v22) {
        uint64_t v136 = v135;
      }
      else {
        uint64_t v136 = v7;
      }
      swift_bridgeObjectRelease(v136);
      sub_DE25C();
      if (v22) {
        uint64_t v138 = v137;
      }
      else {
        uint64_t v138 = v8;
      }
      swift_bridgeObjectRelease(v138);
      sub_2A184();
      uint64_t v139 = v12[28];
      uint64_t v140 = v12[29];
      v141 = v12 + 28;
      sub_DD888(v139, v140, v141[2], v141[3], v141[4], v141[5], v141[6], v141[7], *((_BYTE *)v141 + 64));
      sub_A5DC(v2, (uint64_t)v5);
      uint64_t v142 = sub_DDFBC();
      Logger.logObject.getter(v142);
      os_log_type_t v143 = sub_AB70();
      if (sub_A634(v143))
      {
        sub_DDFE4();
        uint64_t v144 = *(void *)(v3 + 27208);
        v145 = (uint8_t *)sub_3635C();
        sub_DD450(v145);
        sub_DD8B0();
        sub_DA1C();
        sub_232EC( &dword_0,  v1,  (os_log_type_t)v4,  "got state .awaitingConfirmationLogAsScheduled in SpecificMedLoggingFlow",  v145);
        sub_37128();

        uint64_t v146 = sub_DDCC0(v144);
      }

      else
      {
        v4 = *(void **)(v3 + 27400);
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        uint64_t v146 = sub_36D90();
        uint64_t v2 = *(void *)(v3 + 27616);
      }

      v12 = v3096;
      sub_DDE68( v146,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (!v287)
      {
        sub_DDF34();
        v56 = *(uint8_t **)(v3 + 27192);
        sub_A5DC((uint64_t)v1, v450);
        sub_DDFAC();
        sub_23374();
        os_log_type_t v451 = sub_AB70();
        BOOL v452 = sub_37140(v451);
        v55 = *(void (**)(uint64_t))(v3 + 27400);
        goto LABEL_211;
      }

      v1 = v287;
      uint64_t v288 = sub_4195C();
      getLocalizedMedName(from:)(v288, v289, v290, v291, v292, v293);
      uint64_t v295 = v294;
      sub_37034();
      if (v295)
      {
        v3074 = *(void **)(v3 + 27608);
        uint64_t v3091 = *(void *)(v3 + 26728);
        v3085 = *(__int128 **)(v3 + 26688);
        uint64_t v3079 = *(void *)(v3 + 26432);
        uint64_t v296 = *(void *)(v3 + 25976);
        type metadata accessor for LogMedAsScheduledConfirmationStrategy();
        uint64_t v297 = sub_72C38();
        getMedStatus(from:)(v297, v298, v299, v300, v301, v302);
        sub_36EBC();
        sub_DE7C8((_OWORD *)(v296 + 64));
        uint64_t v303 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATsSimple,  (uint64_t (*)(uint64_t, void))&CATWrapperSimple.__allocating_init(options:globals:));
        uint64_t v304 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATs,  (uint64_t (*)(uint64_t, void))&CATWrapper.__allocating_init(options:globals:));
        sub_DE824();
        uint64_t v305 = sub_DED10();
        uint64_t v309 = sub_8E1C8(v305, v306, v307, (uint64_t)v1, (const void *)(v3 + 8608), v303, v304, v308);
        sub_DE720(v309);
        sub_DE4B8();
        uint64_t v310 = sub_DE4A8();
        sub_BFB6C( v310,  v311,  v312,  (uint64_t (*)(void))type metadata accessor for LogMedAsScheduledConfirmationStrategy);
        *(void *)(v3 + 25872) = v313;
        v314 = sub_D6F9C(v296);
        sub_494C(&qword_18AEA0);
        sub_3586C(&qword_18AEB0, &qword_18AEA0);
        sub_DE63C(v3 + 25872, (uint64_t)v314);
        sub_37034();
        sub_DE104();
        goto LABEL_183;
      }

      v969 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 27384);
      uint64_t v970 = *(void *)(v3 + 27376);
      uint64_t v971 = *(void *)(v3 + 27200);
      uint64_t v972 = *(void *)(v3 + 26736);
      sub_249D4();
      sub_A5DC(v970, v3 + 24416);
      v969(v971, v970, v972);
      sub_DDE60();
      os_log_type_t v973 = sub_A898();
      BOOL v974 = sub_37140(v973);
      v56 = *(uint8_t **)(v3 + 27400);
      if (v974)
      {
        v3095 = *(void (**)(uint64_t))(v3 + 27400);
        v56 = (uint8_t *)sub_3635C();
        v975 = sub_DD450(v56);
        sub_DE634((uint64_t)v975, (uint64_t)v3109, (uint64_t)v3108, (uint64_t)v3099);
        sub_36C34();
        sub_232EC( &dword_0,  v1,  (os_log_type_t)v972,  "Needed confirmation log as scheduled but unable to unwrap med name from task. Returning GenericErrorFlow",  v56);
        sub_DE340();

        uint64_t v976 = sub_37104();
        v3095(v976);
      }

      else
      {

        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        sub_DDE14();
      }

      v55 = *(void (**)(uint64_t))(v3 + 27608);
      v981 = (_OWORD *)sub_DE4E0();
      sub_A13C(v981, (_OWORD *)(v3 + 7968));
      sub_5A9B0((void *)(v3 + 7968), (void *)(v3 + 7168));
      sub_A178();
      sub_DDFA4();

      goto LABEL_219;
    case 'k':
      sub_DDB28();
      v1 = *(os_log_s **)(v3 + 27184);
      sub_DDD50();
      if (v22) {
        uint64_t v149 = v147;
      }
      else {
        uint64_t v149 = v148;
      }
      swift_bridgeObjectRelease(v149);
      sub_DE350();
      if (v22) {
        uint64_t v151 = v150;
      }
      else {
        uint64_t v151 = v7;
      }
      swift_bridgeObjectRelease(v151);
      sub_DE25C();
      if (v22) {
        uint64_t v153 = v152;
      }
      else {
        uint64_t v153 = v8;
      }
      swift_bridgeObjectRelease(v153);
      sub_2A184();
      uint64_t v154 = sub_DE10C();
      sub_DD888(v154, v155, v156, v157, v158, v159, v160, v161, v162);
      sub_A5DC(v2, (uint64_t)v5);
      uint64_t v163 = sub_DDFBC();
      Logger.logObject.getter(v163);
      os_log_type_t v164 = sub_AB70();
      if (sub_A634(v164))
      {
        sub_DDFE4();
        uint64_t v165 = *(void *)(v3 + 27184);
        v166 = (uint8_t *)sub_3635C();
        sub_DD450(v166);
        sub_DD8B0();
        sub_DA1C();
        sub_232EC( &dword_0,  v1,  (os_log_type_t)v4,  "got state .awaitingConfirmationLogAsNeeded in SpecificMedLoggingFlow",  v166);
        sub_37128();

        uint64_t v167 = sub_DDCC0(v165);
      }

      else
      {
        v4 = *(void **)(v3 + 27400);
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        uint64_t v167 = sub_36D90();
        uint64_t v2 = *(void *)(v3 + 27616);
      }

      sub_DDE68( v167,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v315)
      {
        uint64_t v316 = v3 + 25920;
        sub_DDA88();
        type metadata accessor for LogMedAsNeededConfirmationStrategy();
        v317 = v12;
        sub_36590((_OWORD *)(v8 + 64));
        sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATsSimple,  (uint64_t (*)(uint64_t, void))&CATWrapperSimple.__allocating_init(options:globals:));
        uint64_t v318 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATs,  (uint64_t (*)(uint64_t, void))&CATWrapper.__allocating_init(options:globals:));
        sub_DE824();
        uint64_t v319 = sub_DE728();
        v324 = sub_1124E4(v319, v320, v321, v322, v323);
        sub_DE720((uint64_t)v324);
        sub_DE4B8();
        v325 = &qword_18AEA0;
        uint64_t v326 = sub_DE4A8();
        sub_BFB6C( v326,  v327,  v328,  (uint64_t (*)(void))type metadata accessor for LogMedAsNeededConfirmationStrategy);
        *(void *)(v3 + 25920) = v329;
        sub_D6FCC(v8);
        goto LABEL_178;
      }

      sub_DDF34();
      v56 = *(uint8_t **)(v3 + 27176);
      sub_A5DC((uint64_t)v1, v453);
      sub_DDFAC();
      sub_23374();
      os_log_type_t v454 = sub_AB70();
      BOOL v452 = sub_37140(v454);
      v55 = *(void (**)(uint64_t))(v3 + 27400);
LABEL_211:
      if (!v452) {
        goto LABEL_216;
      }
      v56 = (uint8_t *)sub_3635C();
      sub_DD450(v56);
      v12 = _swiftEmptyArrayStorage;
      sub_DDD3C();
      sub_DE5F4();
      v445 = "Needed confirmation log as scheduled but intentResponse.matchingMeds was nil.";
      goto LABEL_215;
    case 'l':
      sub_DD878();
      sub_A5DC((uint64_t)v1, v168);
      sub_36170();
      sub_23374();
      os_log_type_t v169 = sub_AB70();
      if (sub_A634(v169))
      {
        sub_DDFE4();
        uint64_t v170 = *(void *)(v3 + 27152);
        v171 = (uint8_t *)sub_3635C();
        sub_DD450(v171);
        sub_DD8B0();
        sub_DA1C();
        sub_232EC( &dword_0,  v1,  (os_log_type_t)v4,  "SpecificMedLoggingFlow received .statusBothSkipped intent response, creating output.",  v171);
        sub_37128();

        uint64_t v172 = sub_DDCC0(v170);
      }

      else
      {
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        uint64_t v172 = sub_36D90();
      }

      uint64_t v330 = *(void *)(v3 + 26200);
      uint64_t v331 = *(void *)(v3 + 25976);
      static DialogPhase.error.getter(v172);
      sub_DDDB4(v330, (uint64_t)PhoneRingsSnippet.body.getter);
      uint64_t v332 = 1LL;
      sub_368F8();
      *(void *)(v3 + 27792) = *(void *)(v331 + 336);
      uint64_t v333 = sub_363E8();
      sub_DDE68( v333,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v334)
      {
        id v336 = sub_DEE20(v334);
        sub_2A184();
        if (v336 && (uint64_t v337 = sub_1141DC(v336), v338))
        {
          String.toSpeakableString.getter(v337, v338);
          sub_2A184();
          uint64_t v332 = 0LL;
        }

        else
        {
          uint64_t v332 = 1LL;
        }
      }

      sub_A66C(*(void *)(v3 + 26624), v332, v335, *(void *)(v3 + 26384));
      v435 = (void *)swift_task_alloc(dword_190C44);
      *(void *)(v3 + 27800) = v435;
      void *v435 = v3;
      v435[1] = sub_C7A18;
      uint64_t v436 = sub_DEAF4(*(void *)(v3 + 26624));
      return sub_DDEA8(v436);
    case 'm':
      sub_DDB28();
      v173 = *(os_log_s **)(v3 + 27168);
      sub_DDD50();
      if (v22) {
        uint64_t v176 = v174;
      }
      else {
        uint64_t v176 = v175;
      }
      swift_bridgeObjectRelease(v176);
      sub_DE350();
      if (v22) {
        uint64_t v178 = v177;
      }
      else {
        uint64_t v178 = v7;
      }
      swift_bridgeObjectRelease(v178);
      sub_DE25C();
      if (v22) {
        uint64_t v180 = v179;
      }
      else {
        uint64_t v180 = v8;
      }
      swift_bridgeObjectRelease(v180);
      sub_2A184();
      uint64_t v181 = sub_DE10C();
      sub_DD888(v181, v182, v183, v184, v185, v186, v187, v188, v189);
      sub_A5DC(v2, (uint64_t)v5);
      uint64_t v190 = sub_DDFBC();
      Logger.logObject.getter(v190);
      os_log_type_t v191 = sub_AB70();
      if (sub_A634(v191))
      {
        sub_DDFE4();
        uint64_t v192 = *(void *)(v3 + 27168);
        v193 = (uint8_t *)sub_3635C();
        sub_DD450(v193);
        sub_DD8B0();
        sub_DA1C();
        sub_232EC( &dword_0,  v173,  (os_log_type_t)v4,  "got state .awaitingConfirmationUpdateToStatus in SpecificMedLoggingFlow",  v193);
        sub_37128();

        uint64_t v194 = sub_DDCC0(v192);
      }

      else
      {
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        uint64_t v194 = sub_36D90();
        uint64_t v2 = *(void *)(v3 + 27616);
      }

      sub_DDE68( v194,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v339)
      {
        uint64_t v316 = v3 + 25928;
        sub_DDA88();
        type metadata accessor for MedUpdateLogStatusStrategy();
        v317 = v12;
        sub_36590((_OWORD *)(v8 + 64));
        sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATsSimple,  (uint64_t (*)(uint64_t, void))&CATWrapperSimple.__allocating_init(options:globals:));
        uint64_t v318 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATs,  (uint64_t (*)(uint64_t, void))&CATWrapper.__allocating_init(options:globals:));
        sub_DE824();
        uint64_t v340 = sub_DE728();
        v345 = sub_1124E4(v340, v341, v342, v343, v344);
        sub_DE720((uint64_t)v345);
        sub_DE4B8();
        v325 = &qword_18AEA0;
        uint64_t v346 = sub_DE4A8();
        sub_BFB6C( v346,  v347,  v348,  (uint64_t (*)(void))type metadata accessor for MedUpdateLogStatusStrategy);
        *(void *)(v3 + 25928) = v349;
        sub_D70A4(v8);
LABEL_178:
        uint64_t v350 = sub_DEB58();
        v351 = &qword_18AEB0;
        goto LABEL_182;
      }

      v4 = (void *)(v3 + 3968);
      v1 = *(os_log_s **)(v3 + 27376);
      v56 = *(uint8_t **)(v3 + 27160);
      sub_A5DC((uint64_t)v1, v3 + 24056);
      sub_DDFAC();
      sub_23374();
      os_log_type_t v455 = sub_AB70();
      BOOL v456 = sub_37140(v455);
      v55 = *(void (**)(uint64_t))(v3 + 27400);
      if (!v456) {
        goto LABEL_216;
      }
      v56 = (uint8_t *)sub_3635C();
      sub_DD450(v56);
      v12 = _swiftEmptyArrayStorage;
      sub_DDD3C();
      sub_DE5F4();
      v445 = "Needed confirmation update to status but intentResponse.matchingMeds was nil.";
      goto LABEL_215;
    case 'n':
      sub_DD990();
      uint64_t v195 = *(void *)(v3 + 27112);
      sub_DDD24();
      if (v22) {
        uint64_t v198 = v197;
      }
      else {
        uint64_t v198 = v196;
      }
      swift_bridgeObjectRelease(v198);
      sub_DDFD8();
      if (v22) {
        uint64_t v200 = v199;
      }
      else {
        uint64_t v200 = v6;
      }
      swift_bridgeObjectRelease(v200);
      sub_DDFCC();
      if (v22) {
        uint64_t v202 = v201;
      }
      else {
        uint64_t v202 = v7;
      }
      swift_bridgeObjectRelease(v202);
      sub_2A184();
      sub_A5DC(v2, (uint64_t)v1);
      sub_DDBF0();
      sub_AB5C();
      os_log_type_t v203 = sub_AB70();
      if (sub_A634(v203))
      {
        sub_DDFE4();
        uint64_t v204 = *(void *)(v3 + 27112);
        v205 = (uint8_t *)sub_3635C();
        sub_DD450(v205);
        sub_DD8B0();
        sub_DA1C();
        sub_232EC( &dword_0,  v1,  (os_log_type_t)v195,  "SpecificMedLoggingFlow received .needsConfirmMixedLogging in intent response, creating confirmation.",  v205);
        sub_37128();

        sub_DDCC0(v204);
      }

      else
      {
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        sub_36D90();
        uint64_t v2 = *(void *)(v3 + 27616);
      }

      uint64_t v352 = sub_DDB84();
      sub_DDE68( v352,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (!v353)
      {
        v4 = (void *)(v3 + 2848);
        v55 = *(void (**)(uint64_t))(v3 + 27384);
        v1 = *(os_log_s **)(v3 + 27376);
        sub_A5DC((uint64_t)v1, v3 + 23936);
        sub_DDFAC();
        sub_23374();
        os_log_type_t v955 = sub_AB70();
        BOOL v956 = sub_37140(v955);
        v56 = *(uint8_t **)(v3 + 27400);
        if (v956)
        {
          v3088 = *(void (**)(uint64_t))(v3 + 27400);
          v56 = (uint8_t *)sub_3635C();
          v957 = sub_DD450(v56);
          v55 = (void (*)(uint64_t))_swiftEmptyArrayStorage;
          sub_DE634((uint64_t)v957, (uint64_t)v3109, (uint64_t)v3108, (uint64_t)v3099);
          sub_36C34();
          sub_232EC( &dword_0,  v1,  (os_log_type_t)v8,  "Needed confirmation for mixed logging, but intentResponse.matchingMeds was nil.",  v56);
          sub_DE340();

          uint64_t v958 = sub_37104();
          v3088(v958);
        }

        else
        {

          swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
          sub_DDE14();
        }

        goto LABEL_218;
      }

      uint64_t v354 = v353;
      uint64_t v316 = v3 + 25952;
      sub_DDA88();
      type metadata accessor for LogMedScheduleMixedStatusConfirmationStrategy();
      v317 = v12;
      uint64_t v355 = sub_DE5EC();
      getMedStatus(from:)(v355, v356, v357, v358, v359, v360);
      char v362 = v361;
      sub_DE5E4();
      sub_BFCF4((uint64_t *)v3099);
      uint64_t v363 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATsSimple,  (uint64_t (*)(uint64_t, void))&CATWrapperSimple.__allocating_init(options:globals:));
      uint64_t v318 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATs,  (uint64_t (*)(uint64_t, void))&CATWrapper.__allocating_init(options:globals:));
      sub_DEB04();
      uint64_t v364 = sub_5F1B8(v362 & 1, v354, v3099, v363, v318, v3108);
      sub_DE720(v364);
      sub_DE4B8();
      v325 = (uint64_t *)&unk_18E9F0;
      uint64_t v365 = sub_DE4A8();
      sub_BFB6C( v365,  v366,  v367,  (uint64_t (*)(void))type metadata accessor for LogMedScheduleMixedStatusConfirmationStrategy);
      *(void *)(v3 + 25952) = v368;
      sub_D70D4(v8);
      uint64_t v350 = sub_DEB58();
      v351 = (unint64_t *)&unk_18E9F8;
LABEL_182:
      sub_3586C(v351, v325);
      static ExecuteResponse.ongoing<A>(next:childCompletion:)(v316, v318, v8, v350);
      sub_37034();

LABEL_183:
      swift_release();

      uint64_t v274 = v3079;
LABEL_184:
      sub_26F04(v274, type metadata accessor for SnippetHeaderModel);
      sub_279E0((uint64_t)v3085, &qword_189D00);
      uint64_t v369 = v3091;
      goto LABEL_185;
    case 'o':
      sub_DD878();
      uint64_t v206 = *(void *)(v3 + 27128);
      uint64_t v207 = *(void *)(v3 + 26736);
      sub_A5DC((uint64_t)v1, v208);
      sub_36170();
      sub_23374();
      os_log_type_t v209 = sub_AB70();
      if (sub_A988(v209))
      {
        sub_DDFE4();
        uint64_t v210 = *(void *)(v3 + 27128);
        v211 = (uint8_t *)sub_3635C();
        sub_DD450(v211);
        sub_DD8B0();
        sub_DA1C();
        sub_232EC( &dword_0,  v1,  (os_log_type_t)v206,  "SpecificMedLoggingFlow received .allMedsLoggedAlready in intent response, creating output.",  v211);
        sub_37128();

        sub_DDCC0(v210);
      }

      else
      {
        uint64_t v206 = *(void *)(v3 + 27128);
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        sub_36D90();
      }

      sub_DEB28();
      sub_DDDB4(v206, (uint64_t)PhoneRingsSnippet.body.getter);
      sub_368F8();
      *(void *)(v3 + 27840) = *(void *)(v207 + 336);
      sub_363E8();
      uint64_t v370 = sub_4195C();
      getMedStatus(from:)(v370, v371, v372, v373, v374, v375);
      sub_37034();
      v376 = (void *)swift_task_alloc(dword_190C24);
      *(void *)(v3 + 27848) = v376;
      char v377 = sub_DE974(v376, (uint64_t)sub_C8F6C);
      return sub_131F84(v377, v378);
    case 'p':
      v3092 = (void *)(v3 + 208);
      sub_DE8F0(20488LL);
      sub_DEDD0();
      unint64_t v212 = *(void *)(v3 + 27464);
      unint64_t v213 = *(void *)(v3 + 27440);
      uint64_t v214 = *(void *)(v3 + 27376);
      uint64_t v215 = *(void *)(v3 + 27304);
      sub_DDD24();
      if (v22) {
        uint64_t v218 = v217;
      }
      else {
        uint64_t v218 = v216;
      }
      swift_bridgeObjectRelease(v218);
      if (v212) {
        unint64_t v219 = v212;
      }
      else {
        unint64_t v219 = 0xE700000000000000LL;
      }
      swift_bridgeObjectRelease(v219);
      if (v213) {
        unint64_t v220 = v213;
      }
      else {
        unint64_t v220 = 0xE600000000000000LL;
      }
      swift_bridgeObjectRelease(v220);
      sub_2A184();
      sub_A5DC(v214, (uint64_t)v1);
      sub_DECB0(v215, v214);
      sub_DDE60();
      os_log_type_t v221 = sub_A898();
      if (sub_46514(v221))
      {
        v222 = *(void (**)(uint64_t, uint64_t))(v3 + 27400);
        uint64_t v223 = *(void *)(v3 + 27304);
        uint64_t v224 = *(void *)(v3 + 26736);
        v225 = (uint8_t *)sub_3635C();
        sub_DD450(v225);
        sub_DE090();
        sub_2A184();
        sub_232EC(&dword_0, v1, (os_log_type_t)v215, "Received gotComplexDosageLoggingError, creating output.", v225);
        sub_37268();

        uint64_t v226 = v223;
        uint64_t v227 = v224;
      }

      else
      {
        v222 = *(void (**)(uint64_t, uint64_t))(v3 + 27400);
        sub_DDA50();
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        uint64_t v226 = sub_372A0();
      }

      v222(v226, v227);
      v380 = *(void **)(v3 + 27608);
      uint64_t v3081 = *(void *)(v3 + 26728);
      uint64_t v3075 = *(void *)(v3 + 26688);
      uint64_t v381 = *(void *)(v3 + 25976);
      uint64_t v382 = v381 + 24;
      uint64_t v383 = *(void *)(v381 + 16);
      sub_DE1BC((_OWORD *)(v381 + 64));
      sub_36CEC(v382);
      sub_DE5EC();
      sub_74964((uint64_t *)v3108);
      uint64_t v384 = sub_801D0();
      uint64_t v385 = sub_749C4();
      sub_310A0(v3099);
      sub_801E4(v383, (const void *)(v3 + 11328), v3085, 0, 0, v3108, v384, v385, (uint64_t)v3092, v3099);
      sub_808CC();
      sub_DDFA4();
      sub_DE104();

      v386 = sub_80810(v3092);
      sub_990D4((uint64_t)v386, type metadata accessor for SnippetHeaderModel);
      sub_279E0(v3075, &qword_189D00);
      uint64_t v387 = v3081;
      goto LABEL_222;
    default:
      if (v13 == 4)
      {
        sub_DD878();
        sub_A5DC((uint64_t)v1, v228);
        sub_36170();
        sub_23374();
        os_log_type_t v229 = sub_AB70();
        if (sub_A634(v229))
        {
          sub_DDFE4();
          uint64_t v230 = *(void *)(v3 + 27320);
          v231 = (uint8_t *)sub_3635C();
          sub_DD450(v231);
          sub_DD8B0();
          sub_DA1C();
          sub_232EC(&dword_0, v1, (os_log_type_t)v4, "Received successful intent response, creating output.", v231);
          sub_37128();

          uint64_t v232 = sub_DDCC0(v230);
        }

        else
        {
          sub_DDA50();
          swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
          uint64_t v232 = sub_36D90();
        }

        v400 = *(_BYTE **)(v3 + 26352);
        uint64_t v401 = *(void *)(v3 + 26320);
        uint64_t v402 = *(void *)(v3 + 25976);
        sub_DDE68( v232,  (SEL *)&selRef_matchingMedsBeforeUpdate,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
        if (v403) {
          v404 = v403;
        }
        else {
          v404 = _swiftEmptyArrayStorage;
        }
        sub_D91E4((uint64_t)v404);
        sub_36C34();
        uint64_t v405 = *(void *)(v402 + 16);
        v406 = v12;
        sub_72C38();
        sub_D69DC(v406, v405, v400);
        uint64_t v407 = *(int *)(v401 + 36);
        *(_DWORD *)(v3 + 28504) = v407;
        char v408 = v400[v407 + 8];
        sub_DE07C();
        if ((v408 & 1) == 0)
        {
          uint64_t v409 = *(void *)(v3 + 26680);
          uint64_t v410 = *(void *)(v3 + 26672);
          uint64_t v411 = *(void *)(v3 + 26384);
          uint64_t v412 = sub_494C(&qword_18D778);
          uint64_t v413 = sub_20308(v412, 72LL);
          sub_DECE0(v413);
          uint64_t v415 = sub_DEDE4(v414, (uint64_t)&type metadata for Double);
          uint64_t v416 = sub_DE068(v415);
          sub_DEE50(v416, v417);
          sub_36C34();
          sub_DED7C(v409);
          _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v410, 0LL, 1LL, v411);
          uint64_t v418 = sub_80C98();
          sub_DADFC(v418, v419, &qword_189D00);
        }

        uint64_t v420 = *(void *)(v3 + 26680);
        uint64_t v421 = *(void *)(v3 + 26664);
        uint64_t v422 = *(void *)(v3 + 26656);
        v423 = *(char **)(v3 + 26352);
        v424 = *(int **)(v3 + 26320);
        *(void *)(v3 + 27640) = *(void *)(*(void *)(v3 + 25976) + 336LL);
        char v3097 = *v423;
        char v425 = v423[1];
        sub_DABC0((uint64_t)&v423[v424[6]], v421, &qword_189D00);
        uint64_t v426 = v424[8];
        v427 = &v423[v424[7]];
        uint64_t v428 = *(void *)v427;
        char v429 = v427[8];
        char v430 = v423[v426];
        sub_DABC0(v420, v422, &qword_189D00);
        sub_4195C();
        sub_DA6D8(v406, (SEL *)&selRef_dosageUnit);
        if (v432)
        {
          String.toSpeakableString.getter(v431, v432);
          sub_249D4();
          uint64_t v434 = 0LL;
        }

        else
        {
          uint64_t v434 = 1LL;
        }

        uint64_t v962 = *(void *)(v3 + 26352);
        uint64_t v963 = *(void *)(v3 + 26320);
        sub_A66C(*(void *)(v3 + 26648), v434, v433, *(void *)(v3 + 26384));
        LOBYTE(v962) = *(_BYTE *)(v962 + *(int *)(v963 + 44));
        v964 = (void *)swift_task_alloc(dword_190C3C);
        *(void *)(v3 + 27648) = v964;
        void *v964 = v3;
        v964[1] = sub_C5808;
        uint64_t v965 = *(void *)(v3 + 26688);
        uint64_t v966 = *(void *)(v3 + 26664);
        uint64_t v967 = *(void *)(v3 + 26656);
        uint64_t v968 = *(void *)(v3 + 26648);
        char v3114 = v962;
        uint64_t v3113 = v968;
        return sub_DDE70(v3097, v425, v966, v965, v428, v429, v430, v967);
      }

      else
      {
        if (v13 != 5)
        {
LABEL_26:
          sub_DEDD0();
          uint64_t v44 = *(void *)(v3 + 27464);
          uint64_t v45 = *(void *)(v3 + 27440);
          uint64_t v2 = *(void *)(v3 + 27376);
          uint64_t v46 = *(void *)(v3 + 27096);
          sub_DDD24();
          if (v22) {
            uint64_t v49 = v48;
          }
          else {
            uint64_t v49 = v47;
          }
          swift_bridgeObjectRelease(v49);
          sub_DE89C();
          if (v22) {
            uint64_t v51 = v50;
          }
          else {
            uint64_t v51 = v44;
          }
          swift_bridgeObjectRelease(v51);
          sub_DE8B4();
          if (v22) {
            uint64_t v53 = v52;
          }
          else {
            uint64_t v53 = v45;
          }
          swift_bridgeObjectRelease(v53);
          sub_2A184();
          sub_A5DC(v2, (uint64_t)v1);
          sub_BB230(v46, v2);
          sub_37018();
          os_log_type_t v54 = sub_AB70();
          if (sub_561AC(v54))
          {
            uint64_t v2 = *(void *)(v3 + 27616);
            v55 = *(void (**)(uint64_t))(v3 + 27400);
            v56 = *(uint8_t **)(v3 + 27096);
            uint64_t v57 = *(void *)(v3 + 26736);
            v58 = (uint8_t *)sub_3635C();
            sub_DD450(v58);
            sub_DDD3C();
            sub_82234();
            sub_232EC( &dword_0,  v1,  (os_log_type_t)v46,  "Intent response code was not an expected one or is one we're not handling yet, returning nil output.",  v58);
            sub_DDDAC();

            uint64_t v59 = (uint64_t)v56;
            uint64_t v60 = v57;
          }

          else
          {
            v55 = *(void (**)(uint64_t))(v3 + 27400);
            v56 = *(uint8_t **)(v3 + 27096);
            sub_DDA50();
            swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
            uint64_t v59 = sub_372A0();
          }

          ((void (*)(uint64_t, uint64_t))v55)(v59, v60);
          sub_DDE38();
          sub_DE23C((void *)(v3 + 3648));
          sub_A178();
          sub_DDFA4();
          sub_DE104();
          goto LABEL_219;
        }

        sub_DD990();
        sub_DDD24();
        if (v22) {
          uint64_t v36 = v35;
        }
        else {
          uint64_t v36 = v34;
        }
        swift_bridgeObjectRelease(v36);
        sub_DDFD8();
        if (v22) {
          uint64_t v38 = v37;
        }
        else {
          uint64_t v38 = v6;
        }
        swift_bridgeObjectRelease(v38);
        sub_DDFCC();
        if (v22) {
          uint64_t v40 = v39;
        }
        else {
          uint64_t v40 = v7;
        }
        swift_bridgeObjectRelease(v40);
        sub_2A184();
        sub_A5DC(v2, (uint64_t)v1);
        sub_DDBF0();
        sub_AB5C();
        os_log_type_t v41 = sub_A898();
        if (sub_A988(v41))
        {
          sub_DDFE4();
          uint64_t v42 = *(void *)(v3 + 27296);
          v43 = (uint8_t *)sub_3635C();
          sub_DD450(v43);
          sub_DD8B0();
          sub_DA1C();
          sub_232EC(&dword_0, v1, v0, "Received failure intent response, creating output.", v43);
          sub_37128();

          sub_DDCC0(v42);
        }

        else
        {
          sub_DDA50();
          swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
          sub_36D90();
        }

        sub_DE3E4();
        *(void *)(v3 + 27680) = v1;
        sub_363E8();
        uint64_t v388 = sub_732B8();
        getLocalizedMedName(from:)(v388, v389, v390, v391, v392, v393);
        uint64_t v395 = v394;
        uint64_t v397 = v396;
        sub_36BE0();
        if (v397)
        {
          sub_DE710(v395);
          sub_2A184();
          uint64_t v399 = 0LL;
        }

        else
        {
          uint64_t v399 = 1LL;
        }

        sub_A66C(*(void *)(v3 + 26640), v399, v398, *(void *)(v3 + 26384));
        v959 = (void *)swift_task_alloc(dword_190C2C);
        *(void *)(v3 + 27688) = v959;
        void *v959 = v3;
        v959[1] = sub_C6574;
        uint64_t v960 = sub_DEAF4(*(void *)(v3 + 26640));
        return sub_DDEC4(v960, v961);
      }
  }

uint64_t sub_C5808()
{
  uint64_t v2 = (void *)*v1;
  sub_36578();
  v2[3457] = v3;
  sub_36900(v4);
  if (v0)
  {
    unint64_t v5 = v2[3436];
    uint64_t v6 = v2[3433];
    uint64_t v7 = v2[3430];
    uint64_t v8 = v2[3333];
    uint64_t v9 = v2[3332];
    uint64_t v10 = v2[3331];
    swift_release();
    if (v5) {
      unint64_t v11 = v5;
    }
    else {
      unint64_t v11 = 0xE500000000000000LL;
    }
    swift_bridgeObjectRelease(v11);
    sub_DE350();
    if (v13) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = v6;
    }
    swift_bridgeObjectRelease(v14);
    sub_DE25C();
    if (v13) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v7;
    }
    swift_bridgeObjectRelease(v16);
    sub_2A184();
    sub_36860();
    sub_464D0(v10);
    sub_464D0(v9);
    sub_464D0(v8);
  }

  else
  {
    uint64_t v17 = v2[3333];
    uint64_t v18 = v2[3332];
    uint64_t v19 = v2[3331];
    swift_release();
    sub_DED60(v19);
    sub_DED60(v18);
    sub_DED60(v17);
  }

  sub_A964();
  return sub_D954();
}

#error "C5964: call analysis failed (funcsize=253)"
uint64_t sub_C5D58()
{
  uint64_t v0;
  sub_AA10();
  sub_20264(*(void *)(v0 + 27672));
  sub_2A184();
  sub_AA20();
  sub_A964();
  return sub_D954();
}

uint64_t sub_C5DA4()
{
  v1 = (void *)v0[3457];
  uint64_t v2 = (void *)v0[3454];
  uint64_t v2540 = v0[3336];
  uint64_t v2539 = v0[3335];
  uint64_t v3 = v0[3264];
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v0 + 2786);
  sub_369CC();
  sub_36878((uint64_t)(v0 + 2776));
  uint64_t v4 = sub_20308((uint64_t)&unk_1803E0, 56LL);
  sub_DDC44(v4);
  v0[3239] = sub_DE278((uint64_t)&v2541, (uint64_t)&unk_18EAE8);
  sub_DE28C();

  sub_DE540();
  sub_20300();
  sub_26F04(v3, type metadata accessor for SpecificMedCompletedLogModel);
  sub_DEC44(v5, &qword_189CF8);
  sub_DE8FC();
  sub_DE464(v2539);
  sub_DE82C(v6, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
  sub_DDC20(v7, type metadata accessor for SnippetHeaderModel);
  sub_DE464(v2540);
  sub_DDA68(v8, &qword_18B168);
  sub_3652C();
  sub_DC288();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v9 = sub_A78C();
  uint64_t v17 = sub_A888(v9, v10, v11, v12, v13, v14, v15, v16, v507, v569, v631);
  uint64_t v25 = sub_A854(v17, v18, v19, v20, v21, v22, v23, v24, v508, v570, v632, v693);
  uint64_t v33 = sub_A84C(v25, v26, v27, v28, v29, v30, v31, v32, v509, v571, v633, v694, v754);
  uint64_t v41 = sub_A844(v33, v34, v35, v36, v37, v38, v39, v40, v510, v572, v634, v695, v755, v814);
  uint64_t v49 = sub_A83C(v41, v42, v43, v44, v45, v46, v47, v48, v511, v573, v635, v696, v756, v815, v873);
  uint64_t v57 = sub_A95C(v49, v50, v51, v52, v53, v54, v55, v56, v512, v574, v636, v697, v757, v816, v874, v931);
  uint64_t v65 = sub_A954(v57, v58, v59, v60, v61, v62, v63, v64, v513, v575, v637, v698, v758, v817, v875, v932, v988);
  uint64_t v73 = sub_A938(v65, v66, v67, v68, v69, v70, v71, v72, v514, v576, v638, v699, v759, v818, v876, v933, v989, v1044);
  uint64_t v81 = sub_A930( v73,  v74,  v75,  v76,  v77,  v78,  v79,  v80,  v515,  v577,  v639,  v700,  v760,  v819,  v877,  v934,  v990,  v1045,  v1099);
  uint64_t v89 = sub_A928( v81,  v82,  v83,  v84,  v85,  v86,  v87,  v88,  v516,  v578,  v640,  v701,  v761,  v820,  v878,  v935,  v991,  v1046,  v1100,  v1153);
  uint64_t v97 = sub_A920( v89,  v90,  v91,  v92,  v93,  v94,  v95,  v96,  v517,  v579,  v641,  v702,  v762,  v821,  v879,  v936,  v992,  v1047,  v1101,  v1154,  v1206);
  uint64_t v105 = sub_36374( v97,  v98,  v99,  v100,  v101,  v102,  v103,  v104,  v518,  v580,  v642,  v703,  v763,  v822,  v880,  v937,  v993,  v1048,  v1102,  v1155,  v1207,  v1258);
  uint64_t v113 = sub_3636C( v105,  v106,  v107,  v108,  v109,  v110,  v111,  v112,  v519,  v581,  v643,  v704,  v764,  v823,  v881,  v938,  v994,  v1049,  v1103,  v1156,  v1208,  v1259,  v1309);
  uint64_t v121 = sub_36364( v113,  v114,  v115,  v116,  v117,  v118,  v119,  v120,  v520,  v582,  v644,  v705,  v765,  v824,  v882,  v939,  v995,  v1050,  v1104,  v1157,  v1209,  v1260,  v1310,  v1359);
  uint64_t v129 = sub_363F0( v121,  v122,  v123,  v124,  v125,  v126,  v127,  v128,  v521,  v583,  v645,  v706,  v766,  v825,  v883,  v940,  v996,  v1051,  v1105,  v1158,  v1210,  v1261,  v1311,  v1360,  v1408);
  uint64_t v137 = sub_36430( v129,  v130,  v131,  v132,  v133,  v134,  v135,  v136,  v522,  v584,  v646,  v707,  v767,  v826,  v884,  v941,  v997,  v1052,  v1106,  v1159,  v1211,  v1262,  v1312,  v1361,  v1409,  v1456);
  uint64_t v145 = sub_36428( v137,  v138,  v139,  v140,  v141,  v142,  v143,  v144,  v523,  v585,  v647,  v708,  v768,  v827,  v885,  v942,  v998,  v1053,  v1107,  v1160,  v1212,  v1263,  v1313,  v1362,  v1410,  v1457,  v1503);
  uint64_t v153 = sub_36478( v145,  v146,  v147,  v148,  v149,  v150,  v151,  v152,  v524,  v586,  v648,  v709,  v769,  v828,  v886,  v943,  v999,  v1054,  v1108,  v1161,  v1213,  v1264,  v1314,  v1363,  v1411,  v1458,  v1504,  v1549);
  uint64_t v161 = sub_36524( v153,  v154,  v155,  v156,  v157,  v158,  v159,  v160,  v525,  v587,  v649,  v710,  v770,  v829,  v887,  v944,  v1000,  v1055,  v1109,  v1162,  v1214,  v1265,  v1315,  v1364,  v1412,  v1459,  v1505,  v1550,  v1594);
  uint64_t v169 = sub_3651C( v161,  v162,  v163,  v164,  v165,  v166,  v167,  v168,  v526,  v588,  v650,  v711,  v771,  v830,  v888,  v945,  v1001,  v1056,  v1110,  v1163,  v1215,  v1266,  v1316,  v1365,  v1413,  v1460,  v1506,  v1551,  v1595,  v1638);
  uint64_t v177 = sub_36514( v169,  v170,  v171,  v172,  v173,  v174,  v175,  v176,  v527,  v589,  v651,  v712,  v772,  v831,  v889,  v946,  v1002,  v1057,  v1111,  v1164,  v1216,  v1267,  v1317,  v1366,  v1414,  v1461,  v1507,  v1552,  v1596,  v1639,  v1681);
  uint64_t v185 = sub_3650C( v177,  v178,  v179,  v180,  v181,  v182,  v183,  v184,  v528,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112,  v1165,  v1217,  v1268,  v1318,  v1367,  v1415,  v1462,  v1508,  v1553,  v1597,  v1640,  v1682,  v1723);
  uint64_t v193 = sub_36504( v185,  v186,  v187,  v188,  v189,  v190,  v191,  v192,  v529,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166,  v1218,  v1269,  v1319,  v1368,  v1416,  v1463,  v1509,  v1554,  v1598,  v1641,  v1683,  v1724,  v1764);
  uint64_t v201 = sub_364FC( v193,  v194,  v195,  v196,  v197,  v198,  v199,  v200,  v530,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219,  v1270,  v1320,  v1369,  v1417,  v1464,  v1510,  v1555,  v1599,  v1642,  v1684,  v1725,  v1765,  v1804);
  uint64_t v209 = sub_364F4( v201,  v202,  v203,  v204,  v205,  v206,  v207,  v208,  v531,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271,  v1321,  v1370,  v1418,  v1465,  v1511,  v1556,  v1600,  v1643,  v1685,  v1726,  v1766,  v1805,  v1843);
  uint64_t v217 = sub_364EC( v209,  v210,  v211,  v212,  v213,  v214,  v215,  v216,  v532,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322,  v1371,  v1419,  v1466,  v1512,  v1557,  v1601,  v1644,  v1686,  v1727,  v1767,  v1806,  v1844,  v1881);
  uint64_t v225 = sub_364E4( v217,  v218,  v219,  v220,  v221,  v222,  v223,  v224,  v533,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372,  v1420,  v1467,  v1513,  v1558,  v1602,  v1645,  v1687,  v1728,  v1768,  v1807,  v1845,  v1882,  v1918);
  uint64_t v233 = sub_364DC( v225,  v226,  v227,  v228,  v229,  v230,  v231,  v232,  v534,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421,  v1468,  v1514,  v1559,  v1603,  v1646,  v1688,  v1729,  v1769,  v1808,  v1846,  v1883,  v1919,  v1954);
  uint64_t v241 = sub_364D4( v233,  v234,  v235,  v236,  v237,  v238,  v239,  v240,  v535,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469,  v1515,  v1560,  v1604,  v1647,  v1689,  v1730,  v1770,  v1809,  v1847,  v1884,  v1920,  v1955,  v1989);
  uint64_t v249 = sub_366F8( v241,  v242,  v243,  v244,  v245,  v246,  v247,  v248,  v536,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516,  v1561,  v1605,  v1648,  v1690,  v1731,  v1771,  v1810,  v1848,  v1885,  v1921,  v1956,  v1990,  v2023);
  uint64_t v257 = sub_366F0( v249,  v250,  v251,  v252,  v253,  v254,  v255,  v256,  v537,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562,  v1606,  v1649,  v1691,  v1732,  v1772,  v1811,  v1849,  v1886,  v1922,  v1957,  v1991,  v2024,  v2056);
  uint64_t v265 = sub_36B90( v257,  v258,  v259,  v260,  v261,  v262,  v263,  v264,  v538,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607,  v1650,  v1692,  v1733,  v1773,  v1812,  v1850,  v1887,  v1923,  v1958,  v1992,  v2025,  v2057,  v2088);
  uint64_t v273 = sub_36EF4( v265,  v266,  v267,  v268,  v269,  v270,  v271,  v272,  v539,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651,  v1693,  v1734,  v1774,  v1813,  v1851,  v1888,  v1924,  v1959,  v1993,  v2026,  v2058,  v2089,  v2119);
  uint64_t v281 = sub_36EEC( v273,  v274,  v275,  v276,  v277,  v278,  v279,  v280,  v540,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694,  v1735,  v1775,  v1814,  v1852,  v1889,  v1925,  v1960,  v1994,  v2027,  v2059,  v2090,  v2120,  v2149);
  uint64_t v289 = sub_DD7E4( v281,  v282,  v283,  v284,  v285,  v286,  v287,  v288,  v541,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736,  v1776,  v1815,  v1853,  v1890,  v1926,  v1961,  v1995,  v2028,  v2060,  v2091,  v2121,  v2150,  v2178);
  uint64_t v297 = sub_DD7DC( v289,  v290,  v291,  v292,  v293,  v294,  v295,  v296,  v542,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777,  v1816,  v1854,  v1891,  v1927,  v1962,  v1996,  v2029,  v2061,  v2092,  v2122,  v2151,  v2179,  v2206);
  uint64_t v305 = sub_DD7D4( v297,  v298,  v299,  v300,  v301,  v302,  v303,  v304,  v543,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817,  v1855,  v1892,  v1928,  v1963,  v1997,  v2030,  v2062,  v2093,  v2123,  v2152,  v2180,  v2207,  v2233);
  uint64_t v313 = sub_DD7CC( v305,  v306,  v307,  v308,  v309,  v310,  v311,  v312,  v544,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856,  v1893,  v1929,  v1964,  v1998,  v2031,  v2063,  v2094,  v2124,  v2153,  v2181,  v2208,  v2234,  v2259);
  uint64_t v321 = sub_DD7C4( v313,  v314,  v315,  v316,  v317,  v318,  v319,  v320,  v545,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894,  v1930,  v1965,  v1999,  v2032,  v2064,  v2095,  v2125,  v2154,  v2182,  v2209,  v2235,  v2260,  v2284);
  uint64_t v329 = sub_DD7BC( v321,  v322,  v323,  v324,  v325,  v326,  v327,  v328,  v546,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931,  v1966,  v2000,  v2033,  v2065,  v2096,  v2126,  v2155,  v2183,  v2210,  v2236,  v2261,  v2285,
           v2308);
  uint64_t v337 = sub_DD7B4( v329,  v330,  v331,  v332,  v333,  v334,  v335,  v336,  v547,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967,  v2001,  v2034,  v2066,  v2097,  v2127,  v2156,  v2184,  v2211,  v2237,  v2262,  v2286,
           v2309,
           v2331);
  uint64_t v345 = sub_DD7AC( v337,  v338,  v339,  v340,  v341,  v342,  v343,  v344,  v548,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002,  v2035,  v2067,  v2098,  v2128,  v2157,  v2185,  v2212,  v2238,  v2263,  v2287,
           v2310,
           v2332,
           v2353);
  uint64_t v353 = sub_DD7A4( v345,  v346,  v347,  v348,  v349,  v350,  v351,  v352,  v549,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036,  v2068,  v2099,  v2129,  v2158,  v2186,  v2213,  v2239,  v2264,  v2288,
           v2311,
           v2333,
           v2354,
           v2374);
  uint64_t v361 = sub_DD79C( v353,  v354,  v355,  v356,  v357,  v358,  v359,  v360,  v550,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069,  v2100,  v2130,  v2159,  v2187,  v2214,  v2240,  v2265,  v2289,
           v2312,
           v2334,
           v2355,
           v2375,
           v2394);
  uint64_t v369 = sub_DD794( v361,  v362,  v363,  v364,  v365,  v366,  v367,  v368,  v551,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101,  v2131,  v2160,  v2188,  v2215,  v2241,  v2266,  v2290,
           v2313,
           v2335,
           v2356,
           v2376,
           v2395,
           v2413);
  uint64_t v377 = sub_DD78C( v369,  v370,  v371,  v372,  v373,  v374,  v375,  v376,  v552,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132,  v2161,  v2189,  v2216,  v2242,  v2267,  v2291,
           v2314,
           v2336,
           v2357,
           v2377,
           v2396,
           v2414,
           v2431);
  uint64_t v385 = sub_DD784( v377,  v378,  v379,  v380,  v381,  v382,  v383,  v384,  v553,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162,  v2190,  v2217,  v2243,  v2268,  v2292,
           v2315,
           v2337,
           v2358,
           v2378,
           v2397,
           v2415,
           v2432,
           v2448);
  uint64_t v393 = sub_DD77C( v385,  v386,  v387,  v388,  v389,  v390,  v391,  v392,  v554,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191,  v2218,  v2244,  v2269,  v2293,
           v2316,
           v2338,
           v2359,
           v2379,
           v2398,
           v2416,
           v2433,
           v2449,
           v2464);
  uint64_t v401 = sub_DD774( v393,  v394,  v395,  v396,  v397,  v398,  v399,  v400,  v555,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219,  v2245,  v2270,  v2294,
           v2317,
           v2339,
           v2360,
           v2380,
           v2399,
           v2417,
           v2434,
           v2450,
           v2465,
           v2479);
  uint64_t v409 = sub_DD76C( v401,  v402,  v403,  v404,  v405,  v406,  v407,  v408,  v556,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246,  v2271,  v2295,
           v2318,
           v2340,
           v2361,
           v2381,
           v2400,
           v2418,
           v2435,
           v2451,
           v2466,
           v2480,
           v2493);
  uint64_t v417 = sub_DD764( v409,  v410,  v411,  v412,  v413,  v414,  v415,  v416,  v557,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272,  v2296,
           v2319,
           v2341,
           v2362,
           v2382,
           v2401,
           v2419,
           v2436,
           v2452,
           v2467,
           v2481,
           v2494,
           v2506);
  uint64_t v425 = sub_DD75C( v417,  v418,  v419,  v420,  v421,  v422,  v423,  v424,  v558,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297,
           v2320,
           v2342,
           v2363,
           v2383,
           v2402,
           v2420,
           v2437,
           v2453,
           v2468,
           v2482,
           v2495,
           v2507,
           v2518);
  uint64_t v433 = sub_DD754( v425,  v426,  v427,  v428,  v429,  v430,  v431,  v432,  v559,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321,
           v2343,
           v2364,
           v2384,
           v2403,
           v2421,
           v2438,
           v2454,
           v2469,
           v2483,
           v2496,
           v2508,
           v2519,
           v2529);
  uint64_t v441 = sub_DD74C( v433,  v434,  v435,  v436,  v437,  v438,  v439,  v440,  v560,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344,
           v2365,
           v2385,
           v2404,
           v2422,
           v2439,
           v2455,
           v2470,
           v2484,
           v2497,
           v2509,
           v2520,
           v2530);
  uint64_t v449 = sub_DD744( v441,  v442,  v443,  v444,  v445,  v446,  v447,  v448,  v561,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366,
           v2386,
           v2405,
           v2423,
           v2440,
           v2456,
           v2471,
           v2485,
           v2498,
           v2510,
           v2521,
           v2531);
  uint64_t v457 = sub_DD73C( v449,  v450,  v451,  v452,  v453,  v454,  v455,  v456,  v562,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387,
           v2406,
           v2424,
           v2441,
           v2457,
           v2472,
           v2486,
           v2499,
           v2511,
           v2522,
           v2532);
  uint64_t v465 = sub_DD734( v457,  v458,  v459,  v460,  v461,  v462,  v463,  v464,  v563,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407,
           v2425,
           v2442,
           v2458,
           v2473,
           v2487,
           v2500,
           v2512,
           v2523,
           v2533);
  uint64_t v473 = sub_DD72C( v465,  v466,  v467,  v468,  v469,  v470,  v471,  v472,  v564,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426,
           v2443,
           v2459,
           v2474,
           v2488,
           v2501,
           v2513,
           v2524,
           v2534);
  uint64_t v481 = sub_DD724( v473,  v474,  v475,  v476,  v477,  v478,  v479,  v480,  v565,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444,
           v2460,
           v2475,
           v2489,
           v2502,
           v2514,
           v2525,
           v2535);
  uint64_t v489 = sub_DD71C( v481,  v482,  v483,  v484,  v485,  v486,  v487,  v488,  v566,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461,
           v2476,
           v2490,
           v2503,
           v2515,
           v2526,
           v2536);
  uint64_t v497 = sub_DD714( v489,  v490,  v491,  v492,  v493,  v494,  v495,  v496,  v567,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462,
           v2477,
           v2491,
           v2504,
           v2516,
           v2527,
           v2537);
  sub_DD70C( v497,  v498,  v499,  v500,  v501,  v502,  v503,  v504,  v568,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
    v2330,
    v2352,
    v2373,
    v2393,
    v2412,
    v2430,
    v2447,
    v2463,
    v2478,
    v2492,
    v2505,
    v2517,
    v2528,
    v2538);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  uint64_t v505 = (uint64_t (*)(void))sub_DE01C();
  return sub_36148(v505);
}

uint64_t sub_C6188()
{
  os_log_type_t v5 = sub_AB70();
  if (sub_46614(v5))
  {
    uint64_t v6 = (_WORD *)sub_3635C();
    sub_36908(v6);
    sub_DD494();
    sub_DA1C();
    sub_232EC(&dword_0, v0, v2, "Couldn't create specificMedicationSuccess_Dialog, returning GenericErrorFlow", v3);
    sub_37128();
  }

  else
  {

    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  sub_3747C();
  uint64_t v7 = (void *)v1[3454];
  uint64_t v8 = (void *)v1[3451];
  uint64_t v9 = v1[3336];
  uint64_t v10 = v1[3335];
  uint64_t v11 = v1[3304];
  sub_DE1BC((_OWORD *)(v1[3247] + 64LL));
  sub_DE338(v1 + 1316);
  sub_A178();
  sub_DDE00();

  sub_DE304();
  sub_DEC04(v10);
  sub_990D4(v12, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
  sub_26F04(v11, type metadata accessor for SnippetHeaderModel);
  sub_DEC04(v9);
  sub_DDBDC(v13, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v14 = sub_A78C();
  uint64_t v22 = sub_AAD8(v14, v15, v16, v17, v18, v19, v20, v21, v520, v583);
  uint64_t v30 = sub_A888(v22, v23, v24, v25, v26, v27, v28, v29, v521, v584, v646);
  uint64_t v38 = sub_A854(v30, v31, v32, v33, v34, v35, v36, v37, v522, v585, v647, v708);
  uint64_t v46 = sub_A84C(v38, v39, v40, v41, v42, v43, v44, v45, v523, v586, v648, v709, v769);
  uint64_t v54 = sub_A844(v46, v47, v48, v49, v50, v51, v52, v53, v524, v587, v649, v710, v770, v829);
  uint64_t v62 = sub_A83C(v54, v55, v56, v57, v58, v59, v60, v61, v525, v588, v650, v711, v771, v830, v888);
  uint64_t v70 = sub_A95C(v62, v63, v64, v65, v66, v67, v68, v69, v526, v589, v651, v712, v772, v831, v889, v946);
  uint64_t v78 = sub_A954(v70, v71, v72, v73, v74, v75, v76, v77, v527, v590, v652, v713, v773, v832, v890, v947, v1003);
  uint64_t v86 = sub_A938(v78, v79, v80, v81, v82, v83, v84, v85, v528, v591, v653, v714, v774, v833, v891, v948, v1004, v1059);
  uint64_t v94 = sub_A930( v86,  v87,  v88,  v89,  v90,  v91,  v92,  v93,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114);
  uint64_t v102 = sub_A928( v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168);
  uint64_t v110 = sub_A920( v102,  v103,  v104,  v105,  v106,  v107,  v108,  v109,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221);
  uint64_t v118 = sub_36374( v110,  v111,  v112,  v113,  v114,  v115,  v116,  v117,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273);
  uint64_t v126 = sub_3636C( v118,  v119,  v120,  v121,  v122,  v123,  v124,  v125,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324);
  uint64_t v134 = sub_36364( v126,  v127,  v128,  v129,  v130,  v131,  v132,  v133,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374);
  uint64_t v142 = sub_363F0( v134,  v135,  v136,  v137,  v138,  v139,  v140,  v141,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423);
  uint64_t v150 = sub_36430( v142,  v143,  v144,  v145,  v146,  v147,  v148,  v149,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471);
  uint64_t v158 = sub_36428( v150,  v151,  v152,  v153,  v154,  v155,  v156,  v157,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518);
  uint64_t v166 = sub_36478( v158,  v159,  v160,  v161,  v162,  v163,  v164,  v165,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564);
  uint64_t v174 = sub_36524( v166,  v167,  v168,  v169,  v170,  v171,  v172,  v173,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609);
  uint64_t v182 = sub_3651C( v174,  v175,  v176,  v177,  v178,  v179,  v180,  v181,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653);
  uint64_t v190 = sub_36514( v182,  v183,  v184,  v185,  v186,  v187,  v188,  v189,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696);
  uint64_t v198 = sub_3650C( v190,  v191,  v192,  v193,  v194,  v195,  v196,  v197,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738);
  uint64_t v206 = sub_36504( v198,  v199,  v200,  v201,  v202,  v203,  v204,  v205,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779);
  uint64_t v214 = sub_364FC( v206,  v207,  v208,  v209,  v210,  v211,  v212,  v213,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819);
  uint64_t v222 = sub_364F4( v214,  v215,  v216,  v217,  v218,  v219,  v220,  v221,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858);
  uint64_t v230 = sub_364EC( v222,  v223,  v224,  v225,  v226,  v227,  v228,  v229,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896);
  uint64_t v238 = sub_364E4( v230,  v231,  v232,  v233,  v234,  v235,  v236,  v237,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933);
  uint64_t v246 = sub_364DC( v238,  v239,  v240,  v241,  v242,  v243,  v244,  v245,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969);
  uint64_t v254 = sub_364D4( v246,  v247,  v248,  v249,  v250,  v251,  v252,  v253,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004);
  uint64_t v262 = sub_366F8( v254,  v255,  v256,  v257,  v258,  v259,  v260,  v261,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038);
  uint64_t v270 = sub_366F0( v262,  v263,  v264,  v265,  v266,  v267,  v268,  v269,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071);
  uint64_t v278 = sub_36B90( v270,  v271,  v272,  v273,  v274,  v275,  v276,  v277,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103);
  uint64_t v286 = sub_36EF4( v278,  v279,  v280,  v281,  v282,  v283,  v284,  v285,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134);
  uint64_t v294 = sub_36EEC( v286,  v287,  v288,  v289,  v290,  v291,  v292,  v293,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164);
  uint64_t v302 = sub_DD7E4( v294,  v295,  v296,  v297,  v298,  v299,  v300,  v301,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193);
  uint64_t v310 = sub_DD7DC( v302,  v303,  v304,  v305,  v306,  v307,  v308,  v309,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221);
  uint64_t v318 = sub_DD7D4( v310,  v311,  v312,  v313,  v314,  v315,  v316,  v317,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248);
  uint64_t v326 = sub_DD7CC( v318,  v319,  v320,  v321,  v322,  v323,  v324,  v325,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274);
  uint64_t v334 = sub_DD7C4( v326,  v327,  v328,  v329,  v330,  v331,  v332,  v333,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299);
  uint64_t v342 = sub_DD7BC( v334,  v335,  v336,  v337,  v338,  v339,  v340,  v341,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323);
  uint64_t v350 = sub_DD7B4( v342,  v343,  v344,  v345,  v346,  v347,  v348,  v349,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346);
  uint64_t v358 = sub_DD7AC( v350,  v351,  v352,  v353,  v354,  v355,  v356,  v357,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368);
  uint64_t v366 = sub_DD7A4( v358,  v359,  v360,  v361,  v362,  v363,  v364,  v365,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389);
  uint64_t v374 = sub_DD79C( v366,  v367,  v368,  v369,  v370,  v371,  v372,  v373,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409);
  uint64_t v382 = sub_DD794( v374,  v375,  v376,  v377,  v378,  v379,  v380,  v381,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428);
  uint64_t v390 = sub_DD78C( v382,  v383,  v384,  v385,  v386,  v387,  v388,  v389,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446);
  uint64_t v398 = sub_DD784( v390,  v391,  v392,  v393,  v394,  v395,  v396,  v397,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463);
  uint64_t v406 = sub_DD77C( v398,  v399,  v400,  v401,  v402,  v403,  v404,  v405,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479);
  uint64_t v414 = sub_DD774( v406,  v407,  v408,  v409,  v410,  v411,  v412,  v413,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494);
  uint64_t v422 = sub_DD76C( v414,  v415,  v416,  v417,  v418,  v419,  v420,  v421,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508);
  uint64_t v430 = sub_DD764( v422,  v423,  v424,  v425,  v426,  v427,  v428,  v429,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521);
  uint64_t v438 = sub_DD75C( v430,  v431,  v432,  v433,  v434,  v435,  v436,  v437,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533);
  uint64_t v446 = sub_DD754( v438,  v439,  v440,  v441,  v442,  v443,  v444,  v445,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v454 = sub_DD74C( v446,  v447,  v448,  v449,  v450,  v451,  v452,  v453,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v462 = sub_DD744( v454,  v455,  v456,  v457,  v458,  v459,  v460,  v461,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v470 = sub_DD73C( v462,  v463,  v464,  v465,  v466,  v467,  v468,  v469,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v478 = sub_DD734( v470,  v471,  v472,  v473,  v474,  v475,  v476,  v477,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v486 = sub_DD72C( v478,  v479,  v480,  v481,  v482,  v483,  v484,  v485,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v494 = sub_DD724( v486,  v487,  v488,  v489,  v490,  v491,  v492,  v493,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  uint64_t v502 = sub_DD71C( v494,  v495,  v496,  v497,  v498,  v499,  v500,  v501,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518,
           v2530,
           v2541,
           v2551);
  uint64_t v510 = sub_DD714( v502,  v503,  v504,  v505,  v506,  v507,  v508,  v509,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
           v2344,
           v2366,
           v2387,
           v2407,
           v2426,
           v2444,
           v2461,
           v2477,
           v2492,
           v2506,
           v2519,
           v2531,
           v2542,
           v2552);
  sub_DD70C( v510,  v511,  v512,  v513,  v514,  v515,  v516,  v517,  v582,  v645,  v707,  v768,  v828,  v887,  v945,  v1002,  v1058,  v1113,  v1167,  v1220,  v1272,  v1323,  v1373,  v1422,  v1470,  v1517,  v1563,  v1608,  v1652,  v1695,  v1737,  v1778,  v1818,  v1857,  v1895,  v1932,  v1968,  v2003,  v2037,  v2070,  v2102,  v2133,  v2163,  v2192,  v2220,  v2247,  v2273,  v2298,  v2322,
    v2345,
    v2367,
    v2388,
    v2408,
    v2427,
    v2445,
    v2462,
    v2478,
    v2493,
    v2507,
    v2520,
    v2532,
    v2543,
    v2553);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v518 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v518);
}

uint64_t sub_C6574()
{
  *(void *)(v0 + 27696) = v2;
  *(void *)(v0 + 27704) = v1;
  uint64_t v4 = sub_36900(v3);
  if (v1)
  {
    sub_367AC();
    uint64_t v5 = sub_36860();
    sub_36A94(v5, &qword_189D00);
  }

  else
  {
    sub_36A94(v4, &qword_189D00);
    sub_367AC();
  }

  sub_A964();
  return sub_363F8(v6, v7, v8);
}

uint64_t sub_C65F4()
{
  uint64_t v3 = sub_DE5BC();
  sub_36C4C(v3, (uint64_t)PhoneRingsSnippet.body.getter);
  uint64_t v4 = sub_368F8();
  id v5 = sub_36F04(v4, "catId");
  sub_36EE4();
  sub_DDCE8();
  sub_DDD30();
  sub_36CEC(v2);
  sub_36590((_OWORD *)(v1 + 64));
  sub_DE62C(v1 + 296);
  v0[3464] = *(void *)(v1 + 336);
  v0[3465] = *(void *)(v1 + 344);
  sub_363E8();
  sub_36C5C();
  uint64_t v6 = (void *)sub_3709C();
  v0[3466] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_C66D4;
  uint64_t v7 = sub_DE164();
  return sub_3619C(v7, v8, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_C66D4()
{
  uint64_t v1 = (void *)(v0 + 19048);
  sub_20264(*(void *)(v0 + 27728));
  sub_36BE0();
  sub_36EBC();
  sub_36B74(v1);
  sub_20300();
  sub_A964();
  return sub_36348(v2, v3, v4);
}

uint64_t sub_C6740()
{
  if (v3[2364])
  {
    uint64_t v6 = (void *)v3[3462];
    uint64_t v7 = (void *)v3[3451];
    sub_DE394();
    sub_20004(v8, (uint64_t)(v3 + 2316));
    sub_369CC();
    sub_36878((uint64_t)(v3 + 2316));
    uint64_t v9 = sub_20308((uint64_t)&unk_1803B8, 56LL);
    uint64_t v10 = sub_DDAC0(v9);
    v3[3218] = sub_DE268((uint64_t)v10, (uint64_t)&unk_18EAD8);
    sub_DE29C();

    sub_DE15C();
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v3 + 2316);
    uint64_t v11 = sub_DEC4C();
    sub_37458(v11, type metadata accessor for SnippetHeaderModel);
    sub_DE154(v12, &qword_189D00);
    sub_37450(v13, &qword_18B168);
    sub_3652C();
  }

  else
  {
    sub_DEC74(14048LL);
    sub_DE3B4(14208LL);
    sub_DEA58();
    uint64_t v14 = v3[3411];
    sub_279E0(v15, &qword_18A448);
    sub_A5DC(v2, (uint64_t)v1);
    sub_36A9C();
    sub_368A0();
    os_log_type_t v16 = sub_AB70();
    if (sub_46614(v16))
    {
      uint64_t v0 = (void *)v3[3425];
      uint64_t v17 = (_WORD *)sub_3635C();
      sub_DDA70(v17);
      sub_DDA34();
      sub_82234();
      sub_232EC(&dword_0, v1, (os_log_type_t)v14, "Couldn't create output, returning GenericErrorFlow", v5);
      sub_DDDAC();

      sub_DDE14();
    }

    else
    {
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);

      sub_DE30C();
    }

    uint64_t v18 = (void *)v3[3462];
    sub_DE374();
    uint64_t v19 = v3[3277];
    sub_DDE20((_OWORD *)(v3[3247] + 64LL));
    sub_DE1C4(v2563);
    sub_A178();
    sub_DDE00();

    sub_DE304();
    uint64_t v20 = sub_89E0C(*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8));
    sub_DE9B4(v20, type metadata accessor for SnippetHeaderModel);
    sub_DE1AC(v21, &qword_189D00);
    sub_DE510(v22, &qword_18B168);
  }

  sub_DC6E0();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v23 = sub_A78C();
  uint64_t v31 = sub_AAD8(v23, v24, v25, v26, v27, v28, v29, v30, v529, v592);
  uint64_t v39 = sub_A888(v31, v32, v33, v34, v35, v36, v37, v38, v530, v593, v655);
  uint64_t v47 = sub_A854(v39, v40, v41, v42, v43, v44, v45, v46, v531, v594, v656, v717);
  uint64_t v55 = sub_A84C(v47, v48, v49, v50, v51, v52, v53, v54, v532, v595, v657, v718, v778);
  uint64_t v63 = sub_A844(v55, v56, v57, v58, v59, v60, v61, v62, v533, v596, v658, v719, v779, v838);
  uint64_t v71 = sub_A83C(v63, v64, v65, v66, v67, v68, v69, v70, v534, v597, v659, v720, v780, v839, v897);
  uint64_t v79 = sub_A95C(v71, v72, v73, v74, v75, v76, v77, v78, v535, v598, v660, v721, v781, v840, v898, v955);
  uint64_t v87 = sub_A954(v79, v80, v81, v82, v83, v84, v85, v86, v536, v599, v661, v722, v782, v841, v899, v956, v1012);
  uint64_t v95 = sub_A938(v87, v88, v89, v90, v91, v92, v93, v94, v537, v600, v662, v723, v783, v842, v900, v957, v1013, v1068);
  uint64_t v103 = sub_A930( v95,  v96,  v97,  v98,  v99,  v100,  v101,  v102,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123);
  uint64_t v111 = sub_A928( v103,  v104,  v105,  v106,  v107,  v108,  v109,  v110,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177);
  uint64_t v119 = sub_A920( v111,  v112,  v113,  v114,  v115,  v116,  v117,  v118,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230);
  uint64_t v127 = sub_36374( v119,  v120,  v121,  v122,  v123,  v124,  v125,  v126,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282);
  uint64_t v135 = sub_3636C( v127,  v128,  v129,  v130,  v131,  v132,  v133,  v134,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333);
  uint64_t v143 = sub_36364( v135,  v136,  v137,  v138,  v139,  v140,  v141,  v142,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383);
  uint64_t v151 = sub_363F0( v143,  v144,  v145,  v146,  v147,  v148,  v149,  v150,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432);
  uint64_t v159 = sub_36430( v151,  v152,  v153,  v154,  v155,  v156,  v157,  v158,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480);
  uint64_t v167 = sub_36428( v159,  v160,  v161,  v162,  v163,  v164,  v165,  v166,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527);
  uint64_t v175 = sub_36478( v167,  v168,  v169,  v170,  v171,  v172,  v173,  v174,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573);
  uint64_t v183 = sub_36524( v175,  v176,  v177,  v178,  v179,  v180,  v181,  v182,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618);
  uint64_t v191 = sub_3651C( v183,  v184,  v185,  v186,  v187,  v188,  v189,  v190,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662);
  uint64_t v199 = sub_36514( v191,  v192,  v193,  v194,  v195,  v196,  v197,  v198,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705);
  uint64_t v207 = sub_3650C( v199,  v200,  v201,  v202,  v203,  v204,  v205,  v206,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747);
  uint64_t v215 = sub_36504( v207,  v208,  v209,  v210,  v211,  v212,  v213,  v214,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788);
  uint64_t v223 = sub_364FC( v215,  v216,  v217,  v218,  v219,  v220,  v221,  v222,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828);
  uint64_t v231 = sub_364F4( v223,  v224,  v225,  v226,  v227,  v228,  v229,  v230,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867);
  uint64_t v239 = sub_364EC( v231,  v232,  v233,  v234,  v235,  v236,  v237,  v238,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905);
  uint64_t v247 = sub_364E4( v239,  v240,  v241,  v242,  v243,  v244,  v245,  v246,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942);
  uint64_t v255 = sub_364DC( v247,  v248,  v249,  v250,  v251,  v252,  v253,  v254,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978);
  uint64_t v263 = sub_364D4( v255,  v256,  v257,  v258,  v259,  v260,  v261,  v262,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013);
  uint64_t v271 = sub_366F8( v263,  v264,  v265,  v266,  v267,  v268,  v269,  v270,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047);
  uint64_t v279 = sub_366F0( v271,  v272,  v273,  v274,  v275,  v276,  v277,  v278,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080);
  uint64_t v287 = sub_36B90( v279,  v280,  v281,  v282,  v283,  v284,  v285,  v286,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112);
  uint64_t v295 = sub_36EF4( v287,  v288,  v289,  v290,  v291,  v292,  v293,  v294,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143);
  uint64_t v303 = sub_36EEC( v295,  v296,  v297,  v298,  v299,  v300,  v301,  v302,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173);
  uint64_t v311 = sub_DD7E4( v303,  v304,  v305,  v306,  v307,  v308,  v309,  v310,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202);
  uint64_t v319 = sub_DD7DC( v311,  v312,  v313,  v314,  v315,  v316,  v317,  v318,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230);
  uint64_t v327 = sub_DD7D4( v319,  v320,  v321,  v322,  v323,  v324,  v325,  v326,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257);
  uint64_t v335 = sub_DD7CC( v327,  v328,  v329,  v330,  v331,  v332,  v333,  v334,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283);
  uint64_t v343 = sub_DD7C4( v335,  v336,  v337,  v338,  v339,  v340,  v341,  v342,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308);
  uint64_t v351 = sub_DD7BC( v343,  v344,  v345,  v346,  v347,  v348,  v349,  v350,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332);
  uint64_t v359 = sub_DD7B4( v351,  v352,  v353,  v354,  v355,  v356,  v357,  v358,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355);
  uint64_t v367 = sub_DD7AC( v359,  v360,  v361,  v362,  v363,  v364,  v365,  v366,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377);
  uint64_t v375 = sub_DD7A4( v367,  v368,  v369,  v370,  v371,  v372,  v373,  v374,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398);
  uint64_t v383 = sub_DD79C( v375,  v376,  v377,  v378,  v379,  v380,  v381,  v382,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418);
  uint64_t v391 = sub_DD794( v383,  v384,  v385,  v386,  v387,  v388,  v389,  v390,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437);
  uint64_t v399 = sub_DD78C( v391,  v392,  v393,  v394,  v395,  v396,  v397,  v398,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455);
  uint64_t v407 = sub_DD784( v399,  v400,  v401,  v402,  v403,  v404,  v405,  v406,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472);
  uint64_t v415 = sub_DD77C( v407,  v408,  v409,  v410,  v411,  v412,  v413,  v414,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488);
  uint64_t v423 = sub_DD774( v415,  v416,  v417,  v418,  v419,  v420,  v421,  v422,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503);
  uint64_t v431 = sub_DD76C( v423,  v424,  v425,  v426,  v427,  v428,  v429,  v430,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517);
  uint64_t v439 = sub_DD764( v431,  v432,  v433,  v434,  v435,  v436,  v437,  v438,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518,
           v2530);
  uint64_t v447 = sub_DD75C( v439,  v440,  v441,  v442,  v443,  v444,  v445,  v446,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
           v2344,
           v2366,
           v2387,
           v2407,
           v2426,
           v2444,
           v2461,
           v2477,
           v2492,
           v2506,
           v2519,
           v2531,
           v2542);
  uint64_t v455 = sub_DD754( v447,  v448,  v449,  v450,  v451,  v452,  v453,  v454,  v582,  v645,  v707,  v768,  v828,  v887,  v945,  v1002,  v1058,  v1113,  v1167,  v1220,  v1272,  v1323,  v1373,  v1422,  v1470,  v1517,  v1563,  v1608,  v1652,  v1695,  v1737,  v1778,  v1818,  v1857,  v1895,  v1932,  v1968,  v2003,  v2037,  v2070,  v2102,  v2133,  v2163,  v2192,  v2220,  v2247,  v2273,  v2298,  v2322,
           v2345,
           v2367,
           v2388,
           v2408,
           v2427,
           v2445,
           v2462,
           v2478,
           v2493,
           v2507,
           v2520,
           v2532,
           v2543,
           v2553);
  uint64_t v463 = sub_DD74C( v455,  v456,  v457,  v458,  v459,  v460,  v461,  v462,  v583,  v646,  v708,  v769,  v829,  v888,  v946,  v1003,  v1059,  v1114,  v1168,  v1221,  v1273,  v1324,  v1374,  v1423,  v1471,  v1518,  v1564,  v1609,  v1653,  v1696,  v1738,  v1779,  v1819,  v1858,  v1896,  v1933,  v1969,  v2004,  v2038,  v2071,  v2103,  v2134,  v2164,  v2193,  v2221,  v2248,  v2274,  v2299,  v2323,
           v2346,
           v2368,
           v2389,
           v2409,
           v2428,
           v2446,
           v2463,
           v2479,
           v2494,
           v2508,
           v2521,
           v2533,
           v2544,
           v2554);
  uint64_t v471 = sub_DD744( v463,  v464,  v465,  v466,  v467,  v468,  v469,  v470,  v584,  v647,  v709,  v770,  v830,  v889,  v947,  v1004,  v1060,  v1115,  v1169,  v1222,  v1274,  v1325,  v1375,  v1424,  v1472,  v1519,  v1565,  v1610,  v1654,  v1697,  v1739,  v1780,  v1820,  v1859,  v1897,  v1934,  v1970,  v2005,  v2039,  v2072,  v2104,  v2135,  v2165,  v2194,  v2222,  v2249,  v2275,  v2300,  v2324,
           v2347,
           v2369,
           v2390,
           v2410,
           v2429,
           v2447,
           v2464,
           v2480,
           v2495,
           v2509,
           v2522,
           v2534,
           v2545,
           v2555);
  uint64_t v479 = sub_DD73C( v471,  v472,  v473,  v474,  v475,  v476,  v477,  v478,  v585,  v648,  v710,  v771,  v831,  v890,  v948,  v1005,  v1061,  v1116,  v1170,  v1223,  v1275,  v1326,  v1376,  v1425,  v1473,  v1520,  v1566,  v1611,  v1655,  v1698,  v1740,  v1781,  v1821,  v1860,  v1898,  v1935,  v1971,  v2006,  v2040,  v2073,  v2105,  v2136,  v2166,  v2195,  v2223,  v2250,  v2276,  v2301,  v2325,
           v2348,
           v2370,
           v2391,
           v2411,
           v2430,
           v2448,
           v2465,
           v2481,
           v2496,
           v2510,
           v2523,
           v2535,
           v2546,
           v2556);
  uint64_t v487 = sub_DD734( v479,  v480,  v481,  v482,  v483,  v484,  v485,  v486,  v586,  v649,  v711,  v772,  v832,  v891,  v949,  v1006,  v1062,  v1117,  v1171,  v1224,  v1276,  v1327,  v1377,  v1426,  v1474,  v1521,  v1567,  v1612,  v1656,  v1699,  v1741,  v1782,  v1822,  v1861,  v1899,  v1936,  v1972,  v2007,  v2041,  v2074,  v2106,  v2137,  v2167,  v2196,  v2224,  v2251,  v2277,  v2302,  v2326,
           v2349,
           v2371,
           v2392,
           v2412,
           v2431,
           v2449,
           v2466,
           v2482,
           v2497,
           v2511,
           v2524,
           v2536,
           v2547,
           v2557);
  uint64_t v495 = sub_DD72C( v487,  v488,  v489,  v490,  v491,  v492,  v493,  v494,  v587,  v650,  v712,  v773,  v833,  v892,  v950,  v1007,  v1063,  v1118,  v1172,  v1225,  v1277,  v1328,  v1378,  v1427,  v1475,  v1522,  v1568,  v1613,  v1657,  v1700,  v1742,  v1783,  v1823,  v1862,  v1900,  v1937,  v1973,  v2008,  v2042,  v2075,  v2107,  v2138,  v2168,  v2197,  v2225,  v2252,  v2278,  v2303,  v2327,
           v2350,
           v2372,
           v2393,
           v2413,
           v2432,
           v2450,
           v2467,
           v2483,
           v2498,
           v2512,
           v2525,
           v2537,
           v2548,
           v2558);
  uint64_t v503 = sub_DD724( v495,  v496,  v497,  v498,  v499,  v500,  v501,  v502,  v588,  v651,  v713,  v774,  v834,  v893,  v951,  v1008,  v1064,  v1119,  v1173,  v1226,  v1278,  v1329,  v1379,  v1428,  v1476,  v1523,  v1569,  v1614,  v1658,  v1701,  v1743,  v1784,  v1824,  v1863,  v1901,  v1938,  v1974,  v2009,  v2043,  v2076,  v2108,  v2139,  v2169,  v2198,  v2226,  v2253,  v2279,  v2304,  v2328,
           v2351,
           v2373,
           v2394,
           v2414,
           v2433,
           v2451,
           v2468,
           v2484,
           v2499,
           v2513,
           v2526,
           v2538,
           v2549,
           v2559);
  uint64_t v511 = sub_DD71C( v503,  v504,  v505,  v506,  v507,  v508,  v509,  v510,  v589,  v652,  v714,  v775,  v835,  v894,  v952,  v1009,  v1065,  v1120,  v1174,  v1227,  v1279,  v1330,  v1380,  v1429,  v1477,  v1524,  v1570,  v1615,  v1659,  v1702,  v1744,  v1785,  v1825,  v1864,  v1902,  v1939,  v1975,  v2010,  v2044,  v2077,  v2109,  v2140,  v2170,  v2199,  v2227,  v2254,  v2280,  v2305,  v2329,
           v2352,
           v2374,
           v2395,
           v2415,
           v2434,
           v2452,
           v2469,
           v2485,
           v2500,
           v2514,
           v2527,
           v2539,
           v2550,
           v2560);
  uint64_t v519 = sub_DD714( v511,  v512,  v513,  v514,  v515,  v516,  v517,  v518,  v590,  v653,  v715,  v776,  v836,  v895,  v953,  v1010,  v1066,  v1121,  v1175,  v1228,  v1280,  v1331,  v1381,  v1430,  v1478,  v1525,  v1571,  v1616,  v1660,  v1703,  v1745,  v1786,  v1826,  v1865,  v1903,  v1940,  v1976,  v2011,  v2045,  v2078,  v2110,  v2141,  v2171,  v2200,  v2228,  v2255,  v2281,  v2306,  v2330,
           v2353,
           v2375,
           v2396,
           v2416,
           v2435,
           v2453,
           v2470,
           v2486,
           v2501,
           v2515,
           v2528,
           v2540,
           v2551,
           v2561);
  sub_DD70C( v519,  v520,  v521,  v522,  v523,  v524,  v525,  v526,  v591,  v654,  v716,  v777,  v837,  v896,  v954,  v1011,  v1067,  v1122,  v1176,  v1229,  v1281,  v1332,  v1382,  v1431,  v1479,  v1526,  v1572,  v1617,  v1661,  v1704,  v1746,  v1787,  v1827,  v1866,  v1904,  v1941,  v1977,  v2012,  v2046,  v2079,  v2111,  v2142,  v2172,  v2201,  v2229,  v2256,  v2282,  v2307,  v2331,
    v2354,
    v2376,
    v2397,
    v2417,
    v2436,
    v2454,
    v2471,
    v2487,
    v2502,
    v2516,
    v2529,
    v2541,
    v2552,
    v2562);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_DDE30();
  sub_DDE28();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  uint64_t v527 = (uint64_t (*)(void))sub_DE600();
  return sub_36148(v527);
}

uint64_t sub_C6C20()
{
  os_log_type_t v5 = sub_AB70();
  if (sub_46614(v5))
  {
    uint64_t v6 = (_WORD *)sub_3635C();
    sub_36908(v6);
    sub_DD494();
    sub_DA1C();
    sub_232EC(&dword_0, v0, v2, "Couldn't create specificMedicationLogFailed_Dialog, returning GenericErrorFlow", v3);
    sub_37128();
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  sub_3747C();
  uint64_t v7 = *(void **)(v1 + 27632);
  uint64_t v8 = *(void **)(v1 + 27608);
  sub_DDC00();
  sub_DE704();
  sub_A178();
  sub_DE4C0();

  uint64_t v9 = sub_36784();
  sub_992F0((uint64_t)v9, type metadata accessor for SnippetHeaderModel);
  sub_73370(v10, &qword_189D00);
  sub_72F7C(v11, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v12 = sub_A78C();
  uint64_t v20 = sub_AAD8(v12, v13, v14, v15, v16, v17, v18, v19, v518, v581);
  uint64_t v28 = sub_A888(v20, v21, v22, v23, v24, v25, v26, v27, v519, v582, v644);
  uint64_t v36 = sub_A854(v28, v29, v30, v31, v32, v33, v34, v35, v520, v583, v645, v706);
  uint64_t v44 = sub_A84C(v36, v37, v38, v39, v40, v41, v42, v43, v521, v584, v646, v707, v767);
  uint64_t v52 = sub_A844(v44, v45, v46, v47, v48, v49, v50, v51, v522, v585, v647, v708, v768, v827);
  uint64_t v60 = sub_A83C(v52, v53, v54, v55, v56, v57, v58, v59, v523, v586, v648, v709, v769, v828, v886);
  uint64_t v68 = sub_A95C(v60, v61, v62, v63, v64, v65, v66, v67, v524, v587, v649, v710, v770, v829, v887, v944);
  uint64_t v76 = sub_A954(v68, v69, v70, v71, v72, v73, v74, v75, v525, v588, v650, v711, v771, v830, v888, v945, v1001);
  uint64_t v84 = sub_A938(v76, v77, v78, v79, v80, v81, v82, v83, v526, v589, v651, v712, v772, v831, v889, v946, v1002, v1057);
  uint64_t v92 = sub_A930( v84,  v85,  v86,  v87,  v88,  v89,  v90,  v91,  v527,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112);
  uint64_t v100 = sub_A928( v92,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v528,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166);
  uint64_t v108 = sub_A920( v100,  v101,  v102,  v103,  v104,  v105,  v106,  v107,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219);
  uint64_t v116 = sub_36374( v108,  v109,  v110,  v111,  v112,  v113,  v114,  v115,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271);
  uint64_t v124 = sub_3636C( v116,  v117,  v118,  v119,  v120,  v121,  v122,  v123,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322);
  uint64_t v132 = sub_36364( v124,  v125,  v126,  v127,  v128,  v129,  v130,  v131,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372);
  uint64_t v140 = sub_363F0( v132,  v133,  v134,  v135,  v136,  v137,  v138,  v139,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421);
  uint64_t v148 = sub_36430( v140,  v141,  v142,  v143,  v144,  v145,  v146,  v147,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469);
  uint64_t v156 = sub_36428( v148,  v149,  v150,  v151,  v152,  v153,  v154,  v155,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516);
  uint64_t v164 = sub_36478( v156,  v157,  v158,  v159,  v160,  v161,  v162,  v163,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562);
  uint64_t v172 = sub_36524( v164,  v165,  v166,  v167,  v168,  v169,  v170,  v171,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607);
  uint64_t v180 = sub_3651C( v172,  v173,  v174,  v175,  v176,  v177,  v178,  v179,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651);
  uint64_t v188 = sub_36514( v180,  v181,  v182,  v183,  v184,  v185,  v186,  v187,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694);
  uint64_t v196 = sub_3650C( v188,  v189,  v190,  v191,  v192,  v193,  v194,  v195,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736);
  uint64_t v204 = sub_36504( v196,  v197,  v198,  v199,  v200,  v201,  v202,  v203,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777);
  uint64_t v212 = sub_364FC( v204,  v205,  v206,  v207,  v208,  v209,  v210,  v211,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817);
  uint64_t v220 = sub_364F4( v212,  v213,  v214,  v215,  v216,  v217,  v218,  v219,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856);
  uint64_t v228 = sub_364EC( v220,  v221,  v222,  v223,  v224,  v225,  v226,  v227,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894);
  uint64_t v236 = sub_364E4( v228,  v229,  v230,  v231,  v232,  v233,  v234,  v235,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931);
  uint64_t v244 = sub_364DC( v236,  v237,  v238,  v239,  v240,  v241,  v242,  v243,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967);
  uint64_t v252 = sub_364D4( v244,  v245,  v246,  v247,  v248,  v249,  v250,  v251,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002);
  uint64_t v260 = sub_366F8( v252,  v253,  v254,  v255,  v256,  v257,  v258,  v259,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036);
  uint64_t v268 = sub_366F0( v260,  v261,  v262,  v263,  v264,  v265,  v266,  v267,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069);
  uint64_t v276 = sub_36B90( v268,  v269,  v270,  v271,  v272,  v273,  v274,  v275,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101);
  uint64_t v284 = sub_36EF4( v276,  v277,  v278,  v279,  v280,  v281,  v282,  v283,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132);
  uint64_t v292 = sub_36EEC( v284,  v285,  v286,  v287,  v288,  v289,  v290,  v291,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162);
  uint64_t v300 = sub_DD7E4( v292,  v293,  v294,  v295,  v296,  v297,  v298,  v299,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191);
  uint64_t v308 = sub_DD7DC( v300,  v301,  v302,  v303,  v304,  v305,  v306,  v307,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219);
  uint64_t v316 = sub_DD7D4( v308,  v309,  v310,  v311,  v312,  v313,  v314,  v315,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246);
  uint64_t v324 = sub_DD7CC( v316,  v317,  v318,  v319,  v320,  v321,  v322,  v323,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272);
  uint64_t v332 = sub_DD7C4( v324,  v325,  v326,  v327,  v328,  v329,  v330,  v331,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297);
  uint64_t v340 = sub_DD7BC( v332,  v333,  v334,  v335,  v336,  v337,  v338,  v339,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321);
  uint64_t v348 = sub_DD7B4( v340,  v341,  v342,  v343,  v344,  v345,  v346,  v347,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344);
  uint64_t v356 = sub_DD7AC( v348,  v349,  v350,  v351,  v352,  v353,  v354,  v355,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366);
  uint64_t v364 = sub_DD7A4( v356,  v357,  v358,  v359,  v360,  v361,  v362,  v363,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387);
  uint64_t v372 = sub_DD79C( v364,  v365,  v366,  v367,  v368,  v369,  v370,  v371,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407);
  uint64_t v380 = sub_DD794( v372,  v373,  v374,  v375,  v376,  v377,  v378,  v379,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426);
  uint64_t v388 = sub_DD78C( v380,  v381,  v382,  v383,  v384,  v385,  v386,  v387,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444);
  uint64_t v396 = sub_DD784( v388,  v389,  v390,  v391,  v392,  v393,  v394,  v395,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461);
  uint64_t v404 = sub_DD77C( v396,  v397,  v398,  v399,  v400,  v401,  v402,  v403,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462,
           v2477);
  uint64_t v412 = sub_DD774( v404,  v405,  v406,  v407,  v408,  v409,  v410,  v411,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463,
           v2478,
           v2492);
  uint64_t v420 = sub_DD76C( v412,  v413,  v414,  v415,  v416,  v417,  v418,  v419,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479,
           v2493,
           v2506);
  uint64_t v428 = sub_DD764( v420,  v421,  v422,  v423,  v424,  v425,  v426,  v427,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494,
           v2507,
           v2519);
  uint64_t v436 = sub_DD75C( v428,  v429,  v430,  v431,  v432,  v433,  v434,  v435,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508,
           v2520,
           v2531);
  uint64_t v444 = sub_DD754( v436,  v437,  v438,  v439,  v440,  v441,  v442,  v443,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521,
           v2532,
           v2542);
  uint64_t v452 = sub_DD74C( v444,  v445,  v446,  v447,  v448,  v449,  v450,  v451,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533,
           v2543);
  uint64_t v460 = sub_DD744( v452,  v453,  v454,  v455,  v456,  v457,  v458,  v459,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v468 = sub_DD73C( v460,  v461,  v462,  v463,  v464,  v465,  v466,  v467,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v476 = sub_DD734( v468,  v469,  v470,  v471,  v472,  v473,  v474,  v475,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v484 = sub_DD72C( v476,  v477,  v478,  v479,  v480,  v481,  v482,  v483,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v492 = sub_DD724( v484,  v485,  v486,  v487,  v488,  v489,  v490,  v491,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v500 = sub_DD71C( v492,  v493,  v494,  v495,  v496,  v497,  v498,  v499,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v508 = sub_DD714( v500,  v501,  v502,  v503,  v504,  v505,  v506,  v507,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  sub_DD70C( v508,  v509,  v510,  v511,  v512,  v513,  v514,  v515,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
    v2343,
    v2365,
    v2386,
    v2406,
    v2425,
    v2443,
    v2460,
    v2476,
    v2491,
    v2505,
    v2518,
    v2530,
    v2541,
    v2551);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v516 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v516);
}

uint64_t sub_C6FC4()
{
  *(void *)(v0 + 27752) = v2;
  *(void *)(v0 + 27760) = v1;
  uint64_t v4 = sub_36900(v3);
  if (v1)
  {
    sub_367AC();
    uint64_t v5 = sub_36860();
    sub_36A94(v5, &qword_189D00);
  }

  else
  {
    sub_36A94(v4, &qword_189D00);
    sub_367AC();
  }

  sub_A964();
  return sub_363F8(v6, v7, v8);
}

uint64_t sub_C7044()
{
  uint64_t v3 = sub_DDFFC();
  sub_36C4C(v3, (uint64_t)PhoneRingsSnippet.body.getter);
  uint64_t v4 = sub_368F8();
  id v5 = sub_36F04(v4, "catId");
  sub_36EE4();
  sub_DDCE8();
  sub_DDD30();
  sub_DDB48(v2);
  sub_36590((_OWORD *)(v1 + 64));
  sub_36CEC(v1 + 296);
  v0[3471] = *(void *)(v1 + 336);
  v0[3472] = *(void *)(v1 + 344);
  sub_363E8();
  sub_36C5C();
  uint64_t v6 = (void *)sub_3709C();
  v0[3473] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_C7128;
  uint64_t v7 = sub_DDD64();
  return sub_3619C(v7, v8, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_C7128()
{
  uint64_t v1 = (void *)(v0 + 18848);
  sub_20264(*(void *)(v0 + 27784));
  sub_36BE0();
  sub_36EBC();
  sub_36B74(v1);
  sub_36E94();
  sub_A964();
  return sub_36348(v2, v3, v4);
}

uint64_t sub_C7194()
{
  if (v3[2394])
  {
    uint64_t v6 = (void *)v3[3469];
    uint64_t v7 = (void *)v3[3451];
    sub_DE394();
    sub_20004(v8, (uint64_t)(v3 + 2446));
    sub_369CC();
    sub_36878((uint64_t)(v3 + 2446));
    uint64_t v9 = sub_20308((uint64_t)&unk_180390, 56LL);
    uint64_t v10 = sub_DDAC0(v9);
    v3[3221] = sub_DE268((uint64_t)v10, (uint64_t)&unk_18EAC8);
    sub_DE29C();

    sub_DE15C();
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v3 + 2446);
    uint64_t v11 = sub_DEC4C();
    sub_37458(v11, type metadata accessor for SnippetHeaderModel);
    sub_DE154(v12, &qword_189D00);
    sub_37450(v13, &qword_18B168);
    sub_3652C();
  }

  else
  {
    sub_DE3B4(17088LL);
    sub_DEC74(17568LL);
    sub_DEA58();
    uint64_t v14 = v3[3408];
    sub_279E0(v15, &qword_18A448);
    sub_A5DC(v2, (uint64_t)v1);
    sub_36A9C();
    sub_368A0();
    os_log_type_t v16 = sub_AB70();
    if (sub_46614(v16))
    {
      uint64_t v0 = (void *)v3[3425];
      uint64_t v17 = (_WORD *)sub_3635C();
      sub_DDA70(v17);
      sub_DDA34();
      sub_82234();
      sub_232EC(&dword_0, v1, (os_log_type_t)v14, "Couldn't create output, returning GenericErrorFlow", v5);
      sub_DDDAC();

      sub_DDE14();
    }

    else
    {
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);

      sub_DE30C();
    }

    uint64_t v18 = (void *)v3[3469];
    sub_DE374();
    uint64_t v19 = v3[3277];
    sub_DDE20((_OWORD *)(v3[3247] + 64LL));
    sub_DE1C4(v2563);
    sub_A178();
    sub_DDE00();

    sub_DE304();
    uint64_t v20 = sub_89E0C(*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8));
    sub_DE9B4(v20, type metadata accessor for SnippetHeaderModel);
    sub_DE1AC(v21, &qword_189D00);
    sub_DE510(v22, &qword_18B168);
  }

  sub_DC6E0();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v23 = sub_A78C();
  uint64_t v31 = sub_AAD8(v23, v24, v25, v26, v27, v28, v29, v30, v529, v592);
  uint64_t v39 = sub_A888(v31, v32, v33, v34, v35, v36, v37, v38, v530, v593, v655);
  uint64_t v47 = sub_A854(v39, v40, v41, v42, v43, v44, v45, v46, v531, v594, v656, v717);
  uint64_t v55 = sub_A84C(v47, v48, v49, v50, v51, v52, v53, v54, v532, v595, v657, v718, v778);
  uint64_t v63 = sub_A844(v55, v56, v57, v58, v59, v60, v61, v62, v533, v596, v658, v719, v779, v838);
  uint64_t v71 = sub_A83C(v63, v64, v65, v66, v67, v68, v69, v70, v534, v597, v659, v720, v780, v839, v897);
  uint64_t v79 = sub_A95C(v71, v72, v73, v74, v75, v76, v77, v78, v535, v598, v660, v721, v781, v840, v898, v955);
  uint64_t v87 = sub_A954(v79, v80, v81, v82, v83, v84, v85, v86, v536, v599, v661, v722, v782, v841, v899, v956, v1012);
  uint64_t v95 = sub_A938(v87, v88, v89, v90, v91, v92, v93, v94, v537, v600, v662, v723, v783, v842, v900, v957, v1013, v1068);
  uint64_t v103 = sub_A930( v95,  v96,  v97,  v98,  v99,  v100,  v101,  v102,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123);
  uint64_t v111 = sub_A928( v103,  v104,  v105,  v106,  v107,  v108,  v109,  v110,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177);
  uint64_t v119 = sub_A920( v111,  v112,  v113,  v114,  v115,  v116,  v117,  v118,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230);
  uint64_t v127 = sub_36374( v119,  v120,  v121,  v122,  v123,  v124,  v125,  v126,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282);
  uint64_t v135 = sub_3636C( v127,  v128,  v129,  v130,  v131,  v132,  v133,  v134,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333);
  uint64_t v143 = sub_36364( v135,  v136,  v137,  v138,  v139,  v140,  v141,  v142,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383);
  uint64_t v151 = sub_363F0( v143,  v144,  v145,  v146,  v147,  v148,  v149,  v150,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432);
  uint64_t v159 = sub_36430( v151,  v152,  v153,  v154,  v155,  v156,  v157,  v158,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480);
  uint64_t v167 = sub_36428( v159,  v160,  v161,  v162,  v163,  v164,  v165,  v166,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527);
  uint64_t v175 = sub_36478( v167,  v168,  v169,  v170,  v171,  v172,  v173,  v174,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573);
  uint64_t v183 = sub_36524( v175,  v176,  v177,  v178,  v179,  v180,  v181,  v182,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618);
  uint64_t v191 = sub_3651C( v183,  v184,  v185,  v186,  v187,  v188,  v189,  v190,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662);
  uint64_t v199 = sub_36514( v191,  v192,  v193,  v194,  v195,  v196,  v197,  v198,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705);
  uint64_t v207 = sub_3650C( v199,  v200,  v201,  v202,  v203,  v204,  v205,  v206,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747);
  uint64_t v215 = sub_36504( v207,  v208,  v209,  v210,  v211,  v212,  v213,  v214,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788);
  uint64_t v223 = sub_364FC( v215,  v216,  v217,  v218,  v219,  v220,  v221,  v222,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828);
  uint64_t v231 = sub_364F4( v223,  v224,  v225,  v226,  v227,  v228,  v229,  v230,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867);
  uint64_t v239 = sub_364EC( v231,  v232,  v233,  v234,  v235,  v236,  v237,  v238,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905);
  uint64_t v247 = sub_364E4( v239,  v240,  v241,  v242,  v243,  v244,  v245,  v246,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942);
  uint64_t v255 = sub_364DC( v247,  v248,  v249,  v250,  v251,  v252,  v253,  v254,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978);
  uint64_t v263 = sub_364D4( v255,  v256,  v257,  v258,  v259,  v260,  v261,  v262,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013);
  uint64_t v271 = sub_366F8( v263,  v264,  v265,  v266,  v267,  v268,  v269,  v270,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047);
  uint64_t v279 = sub_366F0( v271,  v272,  v273,  v274,  v275,  v276,  v277,  v278,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080);
  uint64_t v287 = sub_36B90( v279,  v280,  v281,  v282,  v283,  v284,  v285,  v286,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112);
  uint64_t v295 = sub_36EF4( v287,  v288,  v289,  v290,  v291,  v292,  v293,  v294,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143);
  uint64_t v303 = sub_36EEC( v295,  v296,  v297,  v298,  v299,  v300,  v301,  v302,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173);
  uint64_t v311 = sub_DD7E4( v303,  v304,  v305,  v306,  v307,  v308,  v309,  v310,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202);
  uint64_t v319 = sub_DD7DC( v311,  v312,  v313,  v314,  v315,  v316,  v317,  v318,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230);
  uint64_t v327 = sub_DD7D4( v319,  v320,  v321,  v322,  v323,  v324,  v325,  v326,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257);
  uint64_t v335 = sub_DD7CC( v327,  v328,  v329,  v330,  v331,  v332,  v333,  v334,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283);
  uint64_t v343 = sub_DD7C4( v335,  v336,  v337,  v338,  v339,  v340,  v341,  v342,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308);
  uint64_t v351 = sub_DD7BC( v343,  v344,  v345,  v346,  v347,  v348,  v349,  v350,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332);
  uint64_t v359 = sub_DD7B4( v351,  v352,  v353,  v354,  v355,  v356,  v357,  v358,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355);
  uint64_t v367 = sub_DD7AC( v359,  v360,  v361,  v362,  v363,  v364,  v365,  v366,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377);
  uint64_t v375 = sub_DD7A4( v367,  v368,  v369,  v370,  v371,  v372,  v373,  v374,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398);
  uint64_t v383 = sub_DD79C( v375,  v376,  v377,  v378,  v379,  v380,  v381,  v382,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418);
  uint64_t v391 = sub_DD794( v383,  v384,  v385,  v386,  v387,  v388,  v389,  v390,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437);
  uint64_t v399 = sub_DD78C( v391,  v392,  v393,  v394,  v395,  v396,  v397,  v398,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455);
  uint64_t v407 = sub_DD784( v399,  v400,  v401,  v402,  v403,  v404,  v405,  v406,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472);
  uint64_t v415 = sub_DD77C( v407,  v408,  v409,  v410,  v411,  v412,  v413,  v414,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488);
  uint64_t v423 = sub_DD774( v415,  v416,  v417,  v418,  v419,  v420,  v421,  v422,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503);
  uint64_t v431 = sub_DD76C( v423,  v424,  v425,  v426,  v427,  v428,  v429,  v430,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517);
  uint64_t v439 = sub_DD764( v431,  v432,  v433,  v434,  v435,  v436,  v437,  v438,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518,
           v2530);
  uint64_t v447 = sub_DD75C( v439,  v440,  v441,  v442,  v443,  v444,  v445,  v446,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
           v2344,
           v2366,
           v2387,
           v2407,
           v2426,
           v2444,
           v2461,
           v2477,
           v2492,
           v2506,
           v2519,
           v2531,
           v2542);
  uint64_t v455 = sub_DD754( v447,  v448,  v449,  v450,  v451,  v452,  v453,  v454,  v582,  v645,  v707,  v768,  v828,  v887,  v945,  v1002,  v1058,  v1113,  v1167,  v1220,  v1272,  v1323,  v1373,  v1422,  v1470,  v1517,  v1563,  v1608,  v1652,  v1695,  v1737,  v1778,  v1818,  v1857,  v1895,  v1932,  v1968,  v2003,  v2037,  v2070,  v2102,  v2133,  v2163,  v2192,  v2220,  v2247,  v2273,  v2298,  v2322,
           v2345,
           v2367,
           v2388,
           v2408,
           v2427,
           v2445,
           v2462,
           v2478,
           v2493,
           v2507,
           v2520,
           v2532,
           v2543,
           v2553);
  uint64_t v463 = sub_DD74C( v455,  v456,  v457,  v458,  v459,  v460,  v461,  v462,  v583,  v646,  v708,  v769,  v829,  v888,  v946,  v1003,  v1059,  v1114,  v1168,  v1221,  v1273,  v1324,  v1374,  v1423,  v1471,  v1518,  v1564,  v1609,  v1653,  v1696,  v1738,  v1779,  v1819,  v1858,  v1896,  v1933,  v1969,  v2004,  v2038,  v2071,  v2103,  v2134,  v2164,  v2193,  v2221,  v2248,  v2274,  v2299,  v2323,
           v2346,
           v2368,
           v2389,
           v2409,
           v2428,
           v2446,
           v2463,
           v2479,
           v2494,
           v2508,
           v2521,
           v2533,
           v2544,
           v2554);
  uint64_t v471 = sub_DD744( v463,  v464,  v465,  v466,  v467,  v468,  v469,  v470,  v584,  v647,  v709,  v770,  v830,  v889,  v947,  v1004,  v1060,  v1115,  v1169,  v1222,  v1274,  v1325,  v1375,  v1424,  v1472,  v1519,  v1565,  v1610,  v1654,  v1697,  v1739,  v1780,  v1820,  v1859,  v1897,  v1934,  v1970,  v2005,  v2039,  v2072,  v2104,  v2135,  v2165,  v2194,  v2222,  v2249,  v2275,  v2300,  v2324,
           v2347,
           v2369,
           v2390,
           v2410,
           v2429,
           v2447,
           v2464,
           v2480,
           v2495,
           v2509,
           v2522,
           v2534,
           v2545,
           v2555);
  uint64_t v479 = sub_DD73C( v471,  v472,  v473,  v474,  v475,  v476,  v477,  v478,  v585,  v648,  v710,  v771,  v831,  v890,  v948,  v1005,  v1061,  v1116,  v1170,  v1223,  v1275,  v1326,  v1376,  v1425,  v1473,  v1520,  v1566,  v1611,  v1655,  v1698,  v1740,  v1781,  v1821,  v1860,  v1898,  v1935,  v1971,  v2006,  v2040,  v2073,  v2105,  v2136,  v2166,  v2195,  v2223,  v2250,  v2276,  v2301,  v2325,
           v2348,
           v2370,
           v2391,
           v2411,
           v2430,
           v2448,
           v2465,
           v2481,
           v2496,
           v2510,
           v2523,
           v2535,
           v2546,
           v2556);
  uint64_t v487 = sub_DD734( v479,  v480,  v481,  v482,  v483,  v484,  v485,  v486,  v586,  v649,  v711,  v772,  v832,  v891,  v949,  v1006,  v1062,  v1117,  v1171,  v1224,  v1276,  v1327,  v1377,  v1426,  v1474,  v1521,  v1567,  v1612,  v1656,  v1699,  v1741,  v1782,  v1822,  v1861,  v1899,  v1936,  v1972,  v2007,  v2041,  v2074,  v2106,  v2137,  v2167,  v2196,  v2224,  v2251,  v2277,  v2302,  v2326,
           v2349,
           v2371,
           v2392,
           v2412,
           v2431,
           v2449,
           v2466,
           v2482,
           v2497,
           v2511,
           v2524,
           v2536,
           v2547,
           v2557);
  uint64_t v495 = sub_DD72C( v487,  v488,  v489,  v490,  v491,  v492,  v493,  v494,  v587,  v650,  v712,  v773,  v833,  v892,  v950,  v1007,  v1063,  v1118,  v1172,  v1225,  v1277,  v1328,  v1378,  v1427,  v1475,  v1522,  v1568,  v1613,  v1657,  v1700,  v1742,  v1783,  v1823,  v1862,  v1900,  v1937,  v1973,  v2008,  v2042,  v2075,  v2107,  v2138,  v2168,  v2197,  v2225,  v2252,  v2278,  v2303,  v2327,
           v2350,
           v2372,
           v2393,
           v2413,
           v2432,
           v2450,
           v2467,
           v2483,
           v2498,
           v2512,
           v2525,
           v2537,
           v2548,
           v2558);
  uint64_t v503 = sub_DD724( v495,  v496,  v497,  v498,  v499,  v500,  v501,  v502,  v588,  v651,  v713,  v774,  v834,  v893,  v951,  v1008,  v1064,  v1119,  v1173,  v1226,  v1278,  v1329,  v1379,  v1428,  v1476,  v1523,  v1569,  v1614,  v1658,  v1701,  v1743,  v1784,  v1824,  v1863,  v1901,  v1938,  v1974,  v2009,  v2043,  v2076,  v2108,  v2139,  v2169,  v2198,  v2226,  v2253,  v2279,  v2304,  v2328,
           v2351,
           v2373,
           v2394,
           v2414,
           v2433,
           v2451,
           v2468,
           v2484,
           v2499,
           v2513,
           v2526,
           v2538,
           v2549,
           v2559);
  uint64_t v511 = sub_DD71C( v503,  v504,  v505,  v506,  v507,  v508,  v509,  v510,  v589,  v652,  v714,  v775,  v835,  v894,  v952,  v1009,  v1065,  v1120,  v1174,  v1227,  v1279,  v1330,  v1380,  v1429,  v1477,  v1524,  v1570,  v1615,  v1659,  v1702,  v1744,  v1785,  v1825,  v1864,  v1902,  v1939,  v1975,  v2010,  v2044,  v2077,  v2109,  v2140,  v2170,  v2199,  v2227,  v2254,  v2280,  v2305,  v2329,
           v2352,
           v2374,
           v2395,
           v2415,
           v2434,
           v2452,
           v2469,
           v2485,
           v2500,
           v2514,
           v2527,
           v2539,
           v2550,
           v2560);
  uint64_t v519 = sub_DD714( v511,  v512,  v513,  v514,  v515,  v516,  v517,  v518,  v590,  v653,  v715,  v776,  v836,  v895,  v953,  v1010,  v1066,  v1121,  v1175,  v1228,  v1280,  v1331,  v1381,  v1430,  v1478,  v1525,  v1571,  v1616,  v1660,  v1703,  v1745,  v1786,  v1826,  v1865,  v1903,  v1940,  v1976,  v2011,  v2045,  v2078,  v2110,  v2141,  v2171,  v2200,  v2228,  v2255,  v2281,  v2306,  v2330,
           v2353,
           v2375,
           v2396,
           v2416,
           v2435,
           v2453,
           v2470,
           v2486,
           v2501,
           v2515,
           v2528,
           v2540,
           v2551,
           v2561);
  sub_DD70C( v519,  v520,  v521,  v522,  v523,  v524,  v525,  v526,  v591,  v654,  v716,  v777,  v837,  v896,  v954,  v1011,  v1067,  v1122,  v1176,  v1229,  v1281,  v1332,  v1382,  v1431,  v1479,  v1526,  v1572,  v1617,  v1661,  v1704,  v1746,  v1787,  v1827,  v1866,  v1904,  v1941,  v1977,  v2012,  v2046,  v2079,  v2111,  v2142,  v2172,  v2201,  v2229,  v2256,  v2282,  v2307,  v2331,
    v2354,
    v2376,
    v2397,
    v2417,
    v2436,
    v2454,
    v2471,
    v2487,
    v2502,
    v2516,
    v2529,
    v2541,
    v2552,
    v2562);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_DDE30();
  sub_DDE28();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  uint64_t v527 = (uint64_t (*)(void))sub_DE600();
  return sub_36148(v527);
}

uint64_t sub_C7674()
{
  os_log_type_t v5 = sub_AB70();
  if (sub_46614(v5))
  {
    uint64_t v6 = (_WORD *)sub_3635C();
    sub_36908(v6);
    sub_DD494();
    sub_DA1C();
    sub_232EC(&dword_0, v0, v2, "Couldn't create specificMedicationNoMatch_Dialog, returning GenericErrorFlow", v3);
    sub_37128();
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  sub_3747C();
  uint64_t v7 = *(void **)(v1 + 27632);
  uint64_t v8 = *(void **)(v1 + 27608);
  sub_DDC00();
  sub_DE704();
  sub_A178();
  sub_DE4C0();

  uint64_t v9 = sub_36784();
  sub_992F0((uint64_t)v9, type metadata accessor for SnippetHeaderModel);
  sub_73370(v10, &qword_189D00);
  sub_72F7C(v11, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v12 = sub_A78C();
  uint64_t v20 = sub_AAD8(v12, v13, v14, v15, v16, v17, v18, v19, v518, v581);
  uint64_t v28 = sub_A888(v20, v21, v22, v23, v24, v25, v26, v27, v519, v582, v644);
  uint64_t v36 = sub_A854(v28, v29, v30, v31, v32, v33, v34, v35, v520, v583, v645, v706);
  uint64_t v44 = sub_A84C(v36, v37, v38, v39, v40, v41, v42, v43, v521, v584, v646, v707, v767);
  uint64_t v52 = sub_A844(v44, v45, v46, v47, v48, v49, v50, v51, v522, v585, v647, v708, v768, v827);
  uint64_t v60 = sub_A83C(v52, v53, v54, v55, v56, v57, v58, v59, v523, v586, v648, v709, v769, v828, v886);
  uint64_t v68 = sub_A95C(v60, v61, v62, v63, v64, v65, v66, v67, v524, v587, v649, v710, v770, v829, v887, v944);
  uint64_t v76 = sub_A954(v68, v69, v70, v71, v72, v73, v74, v75, v525, v588, v650, v711, v771, v830, v888, v945, v1001);
  uint64_t v84 = sub_A938(v76, v77, v78, v79, v80, v81, v82, v83, v526, v589, v651, v712, v772, v831, v889, v946, v1002, v1057);
  uint64_t v92 = sub_A930( v84,  v85,  v86,  v87,  v88,  v89,  v90,  v91,  v527,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112);
  uint64_t v100 = sub_A928( v92,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v528,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166);
  uint64_t v108 = sub_A920( v100,  v101,  v102,  v103,  v104,  v105,  v106,  v107,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219);
  uint64_t v116 = sub_36374( v108,  v109,  v110,  v111,  v112,  v113,  v114,  v115,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271);
  uint64_t v124 = sub_3636C( v116,  v117,  v118,  v119,  v120,  v121,  v122,  v123,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322);
  uint64_t v132 = sub_36364( v124,  v125,  v126,  v127,  v128,  v129,  v130,  v131,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372);
  uint64_t v140 = sub_363F0( v132,  v133,  v134,  v135,  v136,  v137,  v138,  v139,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421);
  uint64_t v148 = sub_36430( v140,  v141,  v142,  v143,  v144,  v145,  v146,  v147,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469);
  uint64_t v156 = sub_36428( v148,  v149,  v150,  v151,  v152,  v153,  v154,  v155,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516);
  uint64_t v164 = sub_36478( v156,  v157,  v158,  v159,  v160,  v161,  v162,  v163,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562);
  uint64_t v172 = sub_36524( v164,  v165,  v166,  v167,  v168,  v169,  v170,  v171,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607);
  uint64_t v180 = sub_3651C( v172,  v173,  v174,  v175,  v176,  v177,  v178,  v179,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651);
  uint64_t v188 = sub_36514( v180,  v181,  v182,  v183,  v184,  v185,  v186,  v187,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694);
  uint64_t v196 = sub_3650C( v188,  v189,  v190,  v191,  v192,  v193,  v194,  v195,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736);
  uint64_t v204 = sub_36504( v196,  v197,  v198,  v199,  v200,  v201,  v202,  v203,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777);
  uint64_t v212 = sub_364FC( v204,  v205,  v206,  v207,  v208,  v209,  v210,  v211,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817);
  uint64_t v220 = sub_364F4( v212,  v213,  v214,  v215,  v216,  v217,  v218,  v219,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856);
  uint64_t v228 = sub_364EC( v220,  v221,  v222,  v223,  v224,  v225,  v226,  v227,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894);
  uint64_t v236 = sub_364E4( v228,  v229,  v230,  v231,  v232,  v233,  v234,  v235,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931);
  uint64_t v244 = sub_364DC( v236,  v237,  v238,  v239,  v240,  v241,  v242,  v243,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967);
  uint64_t v252 = sub_364D4( v244,  v245,  v246,  v247,  v248,  v249,  v250,  v251,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002);
  uint64_t v260 = sub_366F8( v252,  v253,  v254,  v255,  v256,  v257,  v258,  v259,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036);
  uint64_t v268 = sub_366F0( v260,  v261,  v262,  v263,  v264,  v265,  v266,  v267,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069);
  uint64_t v276 = sub_36B90( v268,  v269,  v270,  v271,  v272,  v273,  v274,  v275,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101);
  uint64_t v284 = sub_36EF4( v276,  v277,  v278,  v279,  v280,  v281,  v282,  v283,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132);
  uint64_t v292 = sub_36EEC( v284,  v285,  v286,  v287,  v288,  v289,  v290,  v291,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162);
  uint64_t v300 = sub_DD7E4( v292,  v293,  v294,  v295,  v296,  v297,  v298,  v299,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191);
  uint64_t v308 = sub_DD7DC( v300,  v301,  v302,  v303,  v304,  v305,  v306,  v307,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219);
  uint64_t v316 = sub_DD7D4( v308,  v309,  v310,  v311,  v312,  v313,  v314,  v315,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246);
  uint64_t v324 = sub_DD7CC( v316,  v317,  v318,  v319,  v320,  v321,  v322,  v323,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272);
  uint64_t v332 = sub_DD7C4( v324,  v325,  v326,  v327,  v328,  v329,  v330,  v331,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297);
  uint64_t v340 = sub_DD7BC( v332,  v333,  v334,  v335,  v336,  v337,  v338,  v339,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321);
  uint64_t v348 = sub_DD7B4( v340,  v341,  v342,  v343,  v344,  v345,  v346,  v347,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344);
  uint64_t v356 = sub_DD7AC( v348,  v349,  v350,  v351,  v352,  v353,  v354,  v355,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366);
  uint64_t v364 = sub_DD7A4( v356,  v357,  v358,  v359,  v360,  v361,  v362,  v363,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387);
  uint64_t v372 = sub_DD79C( v364,  v365,  v366,  v367,  v368,  v369,  v370,  v371,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407);
  uint64_t v380 = sub_DD794( v372,  v373,  v374,  v375,  v376,  v377,  v378,  v379,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426);
  uint64_t v388 = sub_DD78C( v380,  v381,  v382,  v383,  v384,  v385,  v386,  v387,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444);
  uint64_t v396 = sub_DD784( v388,  v389,  v390,  v391,  v392,  v393,  v394,  v395,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461);
  uint64_t v404 = sub_DD77C( v396,  v397,  v398,  v399,  v400,  v401,  v402,  v403,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462,
           v2477);
  uint64_t v412 = sub_DD774( v404,  v405,  v406,  v407,  v408,  v409,  v410,  v411,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463,
           v2478,
           v2492);
  uint64_t v420 = sub_DD76C( v412,  v413,  v414,  v415,  v416,  v417,  v418,  v419,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479,
           v2493,
           v2506);
  uint64_t v428 = sub_DD764( v420,  v421,  v422,  v423,  v424,  v425,  v426,  v427,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494,
           v2507,
           v2519);
  uint64_t v436 = sub_DD75C( v428,  v429,  v430,  v431,  v432,  v433,  v434,  v435,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508,
           v2520,
           v2531);
  uint64_t v444 = sub_DD754( v436,  v437,  v438,  v439,  v440,  v441,  v442,  v443,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521,
           v2532,
           v2542);
  uint64_t v452 = sub_DD74C( v444,  v445,  v446,  v447,  v448,  v449,  v450,  v451,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533,
           v2543);
  uint64_t v460 = sub_DD744( v452,  v453,  v454,  v455,  v456,  v457,  v458,  v459,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v468 = sub_DD73C( v460,  v461,  v462,  v463,  v464,  v465,  v466,  v467,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v476 = sub_DD734( v468,  v469,  v470,  v471,  v472,  v473,  v474,  v475,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v484 = sub_DD72C( v476,  v477,  v478,  v479,  v480,  v481,  v482,  v483,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v492 = sub_DD724( v484,  v485,  v486,  v487,  v488,  v489,  v490,  v491,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v500 = sub_DD71C( v492,  v493,  v494,  v495,  v496,  v497,  v498,  v499,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v508 = sub_DD714( v500,  v501,  v502,  v503,  v504,  v505,  v506,  v507,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  sub_DD70C( v508,  v509,  v510,  v511,  v512,  v513,  v514,  v515,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
    v2343,
    v2365,
    v2386,
    v2406,
    v2425,
    v2443,
    v2460,
    v2476,
    v2491,
    v2505,
    v2518,
    v2530,
    v2541,
    v2551);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v516 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v516);
}

uint64_t sub_C7A18()
{
  v1[3476] = v5;
  v1[3477] = v0;
  sub_36900(v6);
  if (v0)
  {
    sub_DEC24();
    sub_37034();
    sub_DE8A8();
    if (v8) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = v2;
    }
    swift_bridgeObjectRelease(v9);
    sub_DDFD8();
    if (v8) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v3;
    }
    swift_bridgeObjectRelease(v11);
    sub_DDFCC();
    if (v8) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v4;
    }
    swift_bridgeObjectRelease(v13);
    sub_6D64();
    uint64_t v14 = sub_36860();
    sub_73370(v14, &qword_189D00);
  }

  else
  {
    sub_279E0(v1[3328], &qword_189D00);
    sub_37034();
  }

  sub_A964();
  return sub_DD94C(v15, v16, v17);
}

uint64_t sub_C7AC8()
{
  uint64_t v4 = *(void *)(v0 + 26288);
  sub_DED68();
  sub_DE508((uint64_t)[v5 catId]);
  sub_DE030();
  sub_DDDA4(v2);
  sub_DDB48(v1);
  sub_DD468();
  uint64_t v6 = *(void *)(v0 + 23640);
  if ((sub_DD9F0() & 1) != 0)
  {
    uint64_t v7 = sub_DDB50();
  }

  else
  {
    sub_DDB70(23648LL);
    sub_DD964();
    uint64_t v2 = *(void *)(v0 + 23712);
    uint64_t v3 = *(void *)(v0 + 23720);
    sub_DD9B0((void *)(v0 + 23688));
    uint64_t v7 = sub_DD8C4();
    if (v464) {
      unsigned __int8 v9 = 0;
    }
    else {
      unsigned __int8 v9 = 4;
    }
  }

  sub_DDA20(v7, v8, v9);
  sub_36CEC(v4);
  uint64_t v10 = *(void *)(v0 + 23752);
  uint64_t v11 = *(void *)(v0 + 23760);
  sub_500C((void *)(v0 + 23728), v10);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v11);
  uint64_t v12 = *(void **)(v0 + 23472);
  uint64_t v13 = *(void **)(v0 + 23480);
  if ((sub_DD9D0((void *)(v0 + 23448)) & 1) != 0)
  {
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v0 + 23448));
    sub_36E94();
    uint64_t v14 = 11LL;
  }

  else
  {
    sub_DE3F0();
    sub_500C(v13, *(void *)(v0 + 23432));
    sub_DD4CC();
    uint64_t v6 = *(void *)(v0 + 23400);
    char v15 = sub_DD92C(v12);
    sub_DE760(v12);
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v0 + 23448));
    sub_36E94();
    if ((v15 & 1) != 0) {
      uint64_t v14 = 11LL;
    }
    else {
      uint64_t v14 = 9LL;
    }
  }

  uint64_t v16 = HealthApps.rawValue.getter(v14);
  uint64_t v18 = v17;
  sub_DEE18( v16,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
  if (v19 && (id v20 = sub_DE6C4(v19), sub_6D64(), v20) && (v21 = sub_1141DC(v20), v22))
  {
    uint64_t v23 = v21;
    uint64_t v24 = v22;
    char v25 = *(_BYTE *)(v0 + 28516);
    uint64_t v26 = sub_372CC();
    getMedStatus(from:)(v26, v27, v28, v29, v30, v31);
    char v33 = v32;
    sub_367AC();
    uint64_t v34 = sub_372CC();
    getLocalizedMedName(from:)(v34, v35, v36, v37, v38, v39);
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    sub_367AC();
    uint64_t v2434 = v24;
    uint64_t v2436 = v23;
    char v2433 = v33;
    uint64_t v2431 = v43;
    if ((v25 & 1) != 0)
    {
      sub_DA680( *(void **)(v0 + 27632),  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v44 && (id v45 = sub_DE6C4(v44), sub_6D64(), v45))
      {
        sub_134BCC(v45);
        unint64_t v2424 = v47;
        uint64_t v2425 = v46;
      }

      else
      {
        unint64_t v2424 = 0LL;
        uint64_t v2425 = 0LL;
      }
    }

    else
    {
      unint64_t v2424 = *(void *)(v0 + 27416);
      uint64_t v2425 = *(void *)(v0 + 27424);
    }

    uint64_t v2432 = *(void **)(v0 + 27808);
    uint64_t v2429 = *(void *)(v0 + 26104);
    sub_DEC0C();
    unint64_t v469 = v468 & 0xFFFF00000000FFFFLL | 0x646567670000LL;
    if (v464) {
      unint64_t v465 = v469;
    }
    uint64_t v2428 = v465;
    uint64_t v470 = *(void *)(v0 + 25984);
    uint64_t v2430 = *(void *)(v0 + 25976);
    unint64_t v471 = 0xE600000000000000LL;
    if (!v464) {
      unint64_t v471 = v466;
    }
    uint64_t v2426 = v467;
    uint64_t v2427 = v471;
    sub_DEED8();
    uint64_t v480 = v479 | 0x64657070690000LL;
    if (v472) {
      uint64_t v481 = v480;
    }
    else {
      uint64_t v481 = v477;
    }
    if (v472) {
      uint64_t v482 = 0xE700000000000000LL;
    }
    else {
      uint64_t v482 = v478;
    }
    if (v476) {
      uint64_t v483 = v475;
    }
    else {
      uint64_t v483 = 0x6E656B6154LL;
    }
    if (v476) {
      uint64_t v484 = v476;
    }
    else {
      uint64_t v484 = 0xE500000000000000LL;
    }
    sub_DED74(v473, v474, &qword_189CF8);
    PhoneRingsSnippet.body.getter(v485);
    char v486 = sub_11B244();
    uint64_t v487 = sub_DEBDC();
    sub_98DE0(v487, v488, v489);
    sub_99194();
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v490, v491, v492, v2426);
    char v493 = sub_DE95C(v2433);
    SpecificMedCompletedLogModel.init(medStatus:givenTimeString:requestedMedName:requestedMedSchedule:dosage:dosageUnit:url:sashBundleID:dontDisplayGranularTime:isSmartEnabled:loggedLabel:skippedLabel:takenLabel:snippetHeaderModel:)( v493,  v2436,  v2434,  v41,  v2431,  v2425,  v2424,  0LL,  v2429,  1,  0LL,  0LL,  v656,  v705,  v754,  v803,  v486 & 1,  v2428,  v2427,  v481,  v482,  v483,  v484,  v470);
    sub_36878(v2430 + 296);
    uint64_t v494 = sub_DE0B8();
    *(void *)(v0 + 22552) = v494;
    sub_36F4C((unint64_t *)&qword_18A468, v495, type metadata accessor for WellnessSnippets);
    *(void *)(v0 + 22560) = v496;
    uint64_t v497 = sub_B76C((void *)(v0 + 22528));
    uint64_t v498 = sub_DE46C();
    sub_98DE0(v498, v499, v500);
    sub_DE18C((uint64_t)v497, v494);
    uint64_t v501 = sub_494C(&qword_18A460);
    uint64_t v502 = sub_20308(v501, 40LL);
    uint64_t v503 = sub_373F8(v502);
    *uint64_t v504 = v2432;
    sub_57F08(v503, (uint64_t)v504, v505);
    *(void *)(v0 + 27824) = v503;
    uint64_t v506 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(resultModel:dialog:outputGenerationManifest:)[1];
    id v507 = v2432;
    uint64_t v508 = (void *)swift_task_alloc(v506);
    *(void *)(v0 + 27832) = v508;
    *uint64_t v508 = v0;
    v508[1] = sub_C87B8;
    return sub_DDEFC();
  }

  else
  {
    sub_DEB38();
    uint64_t v48 = v18;
    uint64_t v49 = *(os_log_s **)(v0 + 27384);
    uint64_t v50 = *(void *)(v0 + 27376);
    uint64_t v51 = *(uint8_t **)(v0 + 26736);
    swift_bridgeObjectRelease(v48);
    sub_DEEF4();
    if (v464) {
      uint64_t v53 = v52;
    }
    else {
      uint64_t v53 = v6;
    }
    swift_bridgeObjectRelease(v53);
    sub_DE89C();
    if (v464) {
      uint64_t v55 = v54;
    }
    else {
      uint64_t v55 = v2;
    }
    swift_bridgeObjectRelease(v55);
    sub_DE8B4();
    if (v464) {
      uint64_t v57 = v56;
    }
    else {
      uint64_t v57 = v3;
    }
    swift_bridgeObjectRelease(v57);
    sub_6D64();
    sub_A5DC(v50, v16);
    uint64_t v58 = sub_DEA1C();
    ((void (*)(uint64_t))v49)(v58);
    sub_368A0();
    os_log_type_t v59 = sub_A898();
    if (sub_A988(v59))
    {
      uint64_t v60 = *(void *)(v0 + 27144);
      uint64_t v61 = (_WORD *)sub_3635C();
      uint64_t v62 = sub_36908(v61);
      sub_DDA60((uint64_t)v62, (uint64_t)&v2437, (uint64_t)&v2438, (uint64_t)&v2439);
      sub_DA1C();
      sub_232EC( &dword_0,  v49,  (os_log_type_t)v16,  "No loggedTime present nested inside intentResponse, returning GenericErrorFlow",  v51);
      sub_37128();

      sub_DDCC0(v60);
    }

    else
    {
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);

      sub_36D90();
    }

    uint64_t v63 = *(void **)(v0 + 27808);
    uint64_t v64 = *(void **)(v0 + 27632);
    uint64_t v65 = *(void **)(v0 + 27608);
    sub_DE3C0();
    uint64_t v2435 = *(void *)(v0 + 26288);
    uint64_t v66 = *(void *)(v0 + 26216);
    uint64_t v67 = *(void *)(v0 + 26176);
    sub_DE1BC((_OWORD *)(*(void *)(v0 + 25976) + 64LL));
    sub_DE338((void *)(v0 + 2208));
    sub_A178();
    sub_DEA48();

    sub_DEA50();
    sub_279E0(v67, &qword_189CF8);
    uint64_t v68 = sub_DE028(v2435, *(uint64_t (**)(uint64_t, uint64_t))(v66 + 8));
    sub_DDE0C(v68, type metadata accessor for SnippetHeaderModel);
    sub_DDA68(v69, &qword_189D00);
    sub_DDBDC(v70, &qword_18B168);
    uint64_t v1244 = *(void *)(v0 + 27288);
    uint64_t v1293 = *(void *)(v0 + 27280);
    uint64_t v1341 = *(void *)(v0 + 27272);
    uint64_t v1388 = *(void *)(v0 + 27264);
    uint64_t v1434 = *(void *)(v0 + 27256);
    uint64_t v1479 = *(void *)(v0 + 27248);
    uint64_t v1523 = *(void *)(v0 + 27240);
    uint64_t v1566 = *(void *)(v0 + 27232);
    uint64_t v1608 = *(void *)(v0 + 27224);
    uint64_t v1649 = *(void *)(v0 + 27216);
    uint64_t v1689 = *(void *)(v0 + 27208);
    uint64_t v1728 = *(void *)(v0 + 27200);
    uint64_t v1766 = *(void *)(v0 + 27192);
    uint64_t v1803 = *(void *)(v0 + 27184);
    uint64_t v1839 = *(void *)(v0 + 27176);
    uint64_t v1874 = *(void *)(v0 + 27168);
    uint64_t v1908 = *(void *)(v0 + 27160);
    uint64_t v1941 = *(void *)(v0 + 27152);
    uint64_t v1973 = *(void *)(v0 + 27144);
    uint64_t v2004 = *(void *)(v0 + 27136);
    uint64_t v2034 = *(void *)(v0 + 27128);
    uint64_t v2063 = *(void *)(v0 + 27120);
    uint64_t v2091 = *(void *)(v0 + 27112);
    uint64_t v2118 = *(void *)(v0 + 27104);
    uint64_t v2144 = *(void *)(v0 + 27096);
    uint64_t v2169 = *(void *)(v0 + 27088);
    uint64_t v2193 = *(void *)(v0 + 27080);
    uint64_t v2216 = *(void *)(v0 + 27072);
    uint64_t v2238 = *(void *)(v0 + 27064);
    uint64_t v2259 = *(void *)(v0 + 27056);
    uint64_t v2279 = *(void *)(v0 + 27048);
    uint64_t v2298 = *(void *)(v0 + 27040);
    uint64_t v2316 = *(void *)(v0 + 27032);
    uint64_t v2333 = *(void *)(v0 + 27024);
    uint64_t v2349 = *(void *)(v0 + 27016);
    uint64_t v2364 = *(void *)(v0 + 27008);
    uint64_t v2378 = *(void *)(v0 + 27000);
    uint64_t v2391 = *(void *)(v0 + 26992);
    uint64_t v2403 = *(void *)(v0 + 26984);
    uint64_t v2414 = *(void *)(v0 + 26976);
    sub_DCB38(*(void *)(v0 + 27368));
    sub_A8F4();
    sub_A85C();
    sub_A864();
    sub_A910();
    sub_A8EC();
    sub_A760();
    sub_A7C8();
    sub_A67C();
    uint64_t v71 = sub_A78C();
    uint64_t v79 = sub_36364( v71,  v72,  v73,  v74,  v75,  v76,  v77,  v78,  v509,  v558,  v607,  v656,  v705,  v754,  v803,  v852,  v901,  v950,  v999,  v1048,  v1097,  v1146,  v1195,  v1244);
    uint64_t v87 = sub_363F0( v79,  v80,  v81,  v82,  v83,  v84,  v85,  v86,  v510,  v559,  v608,  v657,  v706,  v755,  v804,  v853,  v902,  v951,  v1000,  v1049,  v1098,  v1147,  v1196,  v1245,  v1293);
    uint64_t v95 = sub_36430( v87,  v88,  v89,  v90,  v91,  v92,  v93,  v94,  v511,  v560,  v609,  v658,  v707,  v756,  v805,  v854,  v903,  v952,  v1001,  v1050,  v1099,  v1148,  v1197,  v1246,  v1294,  v1341);
    uint64_t v103 = sub_36428( v95,  v96,  v97,  v98,  v99,  v100,  v101,  v102,  v512,  v561,  v610,  v659,  v708,  v757,  v806,  v855,  v904,  v953,  v1002,  v1051,  v1100,  v1149,  v1198,  v1247,  v1295,  v1342,  v1388);
    uint64_t v111 = sub_36478( v103,  v104,  v105,  v106,  v107,  v108,  v109,  v110,  v513,  v562,  v611,  v660,  v709,  v758,  v807,  v856,  v905,  v954,  v1003,  v1052,  v1101,  v1150,  v1199,  v1248,  v1296,  v1343,  v1389,  v1434);
    uint64_t v119 = sub_36524( v111,  v112,  v113,  v114,  v115,  v116,  v117,  v118,  v514,  v563,  v612,  v661,  v710,  v759,  v808,  v857,  v906,  v955,  v1004,  v1053,  v1102,  v1151,  v1200,  v1249,  v1297,  v1344,  v1390,  v1435,  v1479);
    uint64_t v127 = sub_3651C( v119,  v120,  v121,  v122,  v123,  v124,  v125,  v126,  v515,  v564,  v613,  v662,  v711,  v760,  v809,  v858,  v907,  v956,  v1005,  v1054,  v1103,  v1152,  v1201,  v1250,  v1298,  v1345,  v1391,  v1436,  v1480,  v1523);
    uint64_t v135 = sub_36514( v127,  v128,  v129,  v130,  v131,  v132,  v133,  v134,  v516,  v565,  v614,  v663,  v712,  v761,  v810,  v859,  v908,  v957,  v1006,  v1055,  v1104,  v1153,  v1202,  v1251,  v1299,  v1346,  v1392,  v1437,  v1481,  v1524,  v1566);
    uint64_t v143 = sub_3650C( v135,  v136,  v137,  v138,  v139,  v140,  v141,  v142,  v517,  v566,  v615,  v664,  v713,  v762,  v811,  v860,  v909,  v958,  v1007,  v1056,  v1105,  v1154,  v1203,  v1252,  v1300,  v1347,  v1393,  v1438,  v1482,  v1525,  v1567,  v1608);
    uint64_t v151 = sub_36504( v143,  v144,  v145,  v146,  v147,  v148,  v149,  v150,  v518,  v567,  v616,  v665,  v714,  v763,  v812,  v861,  v910,  v959,  v1008,  v1057,  v1106,  v1155,  v1204,  v1253,  v1301,  v1348,  v1394,  v1439,  v1483,  v1526,  v1568,  v1609,  v1649);
    uint64_t v159 = sub_364FC( v151,  v152,  v153,  v154,  v155,  v156,  v157,  v158,  v519,  v568,  v617,  v666,  v715,  v764,  v813,  v862,  v911,  v960,  v1009,  v1058,  v1107,  v1156,  v1205,  v1254,  v1302,  v1349,  v1395,  v1440,  v1484,  v1527,  v1569,  v1610,  v1650,  v1689);
    uint64_t v167 = sub_364F4( v159,  v160,  v161,  v162,  v163,  v164,  v165,  v166,  v520,  v569,  v618,  v667,  v716,  v765,  v814,  v863,  v912,  v961,  v1010,  v1059,  v1108,  v1157,  v1206,  v1255,  v1303,  v1350,  v1396,  v1441,  v1485,  v1528,  v1570,  v1611,  v1651,  v1690,  v1728);
    uint64_t v175 = sub_364EC( v167,  v168,  v169,  v170,  v171,  v172,  v173,  v174,  v521,  v570,  v619,  v668,  v717,  v766,  v815,  v864,  v913,  v962,  v1011,  v1060,  v1109,  v1158,  v1207,  v1256,  v1304,  v1351,  v1397,  v1442,  v1486,  v1529,  v1571,  v1612,  v1652,  v1691,  v1729,  v1766);
    uint64_t v183 = sub_364E4( v175,  v176,  v177,  v178,  v179,  v180,  v181,  v182,  v522,  v571,  v620,  v669,  v718,  v767,  v816,  v865,  v914,  v963,  v1012,  v1061,  v1110,  v1159,  v1208,  v1257,  v1305,  v1352,  v1398,  v1443,  v1487,  v1530,  v1572,  v1613,  v1653,  v1692,  v1730,  v1767,  v1803);
    uint64_t v191 = sub_364DC( v183,  v184,  v185,  v186,  v187,  v188,  v189,  v190,  v523,  v572,  v621,  v670,  v719,  v768,  v817,  v866,  v915,  v964,  v1013,  v1062,  v1111,  v1160,  v1209,  v1258,  v1306,  v1353,  v1399,  v1444,  v1488,  v1531,  v1573,  v1614,  v1654,  v1693,  v1731,  v1768,  v1804,  v1839);
    uint64_t v199 = sub_364D4( v191,  v192,  v193,  v194,  v195,  v196,  v197,  v198,  v524,  v573,  v622,  v671,  v720,  v769,  v818,  v867,  v916,  v965,  v1014,  v1063,  v1112,  v1161,  v1210,  v1259,  v1307,  v1354,  v1400,  v1445,  v1489,  v1532,  v1574,  v1615,  v1655,  v1694,  v1732,  v1769,  v1805,  v1840,  v1874);
    uint64_t v207 = sub_366F8( v199,  v200,  v201,  v202,  v203,  v204,  v205,  v206,  v525,  v574,  v623,  v672,  v721,  v770,  v819,  v868,  v917,  v966,  v1015,  v1064,  v1113,  v1162,  v1211,  v1260,  v1308,  v1355,  v1401,  v1446,  v1490,  v1533,  v1575,  v1616,  v1656,  v1695,  v1733,  v1770,  v1806,  v1841,  v1875,  v1908);
    uint64_t v215 = sub_366F0( v207,  v208,  v209,  v210,  v211,  v212,  v213,  v214,  v526,  v575,  v624,  v673,  v722,  v771,  v820,  v869,  v918,  v967,  v1016,  v1065,  v1114,  v1163,  v1212,  v1261,  v1309,  v1356,  v1402,  v1447,  v1491,  v1534,  v1576,  v1617,  v1657,  v1696,  v1734,  v1771,  v1807,  v1842,  v1876,  v1909,  v1941);
    uint64_t v223 = sub_36B90( v215,  v216,  v217,  v218,  v219,  v220,  v221,  v222,  v527,  v576,  v625,  v674,  v723,  v772,  v821,  v870,  v919,  v968,  v1017,  v1066,  v1115,  v1164,  v1213,  v1262,  v1310,  v1357,  v1403,  v1448,  v1492,  v1535,  v1577,  v1618,  v1658,  v1697,  v1735,  v1772,  v1808,  v1843,  v1877,  v1910,  v1942,  v1973);
    uint64_t v231 = sub_36EF4( v223,  v224,  v225,  v226,  v227,  v228,  v229,  v230,  v528,  v577,  v626,  v675,  v724,  v773,  v822,  v871,  v920,  v969,  v1018,  v1067,  v1116,  v1165,  v1214,  v1263,  v1311,  v1358,  v1404,  v1449,  v1493,  v1536,  v1578,  v1619,  v1659,  v1698,  v1736,  v1773,  v1809,  v1844,  v1878,  v1911,  v1943,  v1974,  v2004);
    uint64_t v239 = sub_36EEC( v231,  v232,  v233,  v234,  v235,  v236,  v237,  v238,  v529,  v578,  v627,  v676,  v725,  v774,  v823,  v872,  v921,  v970,  v1019,  v1068,  v1117,  v1166,  v1215,  v1264,  v1312,  v1359,  v1405,  v1450,  v1494,  v1537,  v1579,  v1620,  v1660,  v1699,  v1737,  v1774,  v1810,  v1845,  v1879,  v1912,  v1944,  v1975,  v2005,  v2034);
    uint64_t v247 = sub_DD7E4( v239,  v240,  v241,  v242,  v243,  v244,  v245,  v246,  v530,  v579,  v628,  v677,  v726,  v775,  v824,  v873,  v922,  v971,  v1020,  v1069,  v1118,  v1167,  v1216,  v1265,  v1313,  v1360,  v1406,  v1451,  v1495,  v1538,  v1580,  v1621,  v1661,  v1700,  v1738,  v1775,  v1811,  v1846,  v1880,  v1913,  v1945,  v1976,  v2006,  v2035,  v2063);
    uint64_t v255 = sub_DD7DC( v247,  v248,  v249,  v250,  v251,  v252,  v253,  v254,  v531,  v580,  v629,  v678,  v727,  v776,  v825,  v874,  v923,  v972,  v1021,  v1070,  v1119,  v1168,  v1217,  v1266,  v1314,  v1361,  v1407,  v1452,  v1496,  v1539,  v1581,  v1622,  v1662,  v1701,  v1739,  v1776,  v1812,  v1847,  v1881,  v1914,  v1946,  v1977,  v2007,  v2036,  v2064,  v2091);
    uint64_t v263 = sub_DD7D4( v255,  v256,  v257,  v258,  v259,  v260,  v261,  v262,  v532,  v581,  v630,  v679,  v728,  v777,  v826,  v875,  v924,  v973,  v1022,  v1071,  v1120,  v1169,  v1218,  v1267,  v1315,  v1362,  v1408,  v1453,  v1497,  v1540,  v1582,  v1623,  v1663,  v1702,  v1740,  v1777,  v1813,  v1848,  v1882,  v1915,  v1947,  v1978,  v2008,  v2037,  v2065,  v2092,  v2118);
    uint64_t v271 = sub_DD7CC( v263,  v264,  v265,  v266,  v267,  v268,  v269,  v270,  v533,  v582,  v631,  v680,  v729,  v778,  v827,  v876,  v925,  v974,  v1023,  v1072,  v1121,  v1170,  v1219,  v1268,  v1316,  v1363,  v1409,  v1454,  v1498,  v1541,  v1583,  v1624,  v1664,  v1703,  v1741,  v1778,  v1814,  v1849,  v1883,  v1916,  v1948,  v1979,  v2009,  v2038,  v2066,  v2093,  v2119,  v2144);
    uint64_t v279 = sub_DD7C4( v271,  v272,  v273,  v274,  v275,  v276,  v277,  v278,  v534,  v583,  v632,  v681,  v730,  v779,  v828,  v877,  v926,  v975,  v1024,  v1073,  v1122,  v1171,  v1220,  v1269,  v1317,  v1364,  v1410,  v1455,  v1499,  v1542,  v1584,  v1625,  v1665,  v1704,  v1742,  v1779,  v1815,  v1850,  v1884,  v1917,  v1949,  v1980,  v2010,  v2039,  v2067,  v2094,  v2120,  v2145,  v2169);
    uint64_t v287 = sub_DD7BC( v279,  v280,  v281,  v282,  v283,  v284,  v285,  v286,  v535,  v584,  v633,  v682,  v731,  v780,  v829,  v878,  v927,  v976,  v1025,  v1074,  v1123,  v1172,  v1221,  v1270,  v1318,  v1365,  v1411,  v1456,  v1500,  v1543,  v1585,  v1626,  v1666,  v1705,  v1743,  v1780,  v1816,  v1851,  v1885,  v1918,  v1950,  v1981,  v2011,  v2040,  v2068,  v2095,  v2121,  v2146,  v2170,
             v2193);
    uint64_t v295 = sub_DD7B4( v287,  v288,  v289,  v290,  v291,  v292,  v293,  v294,  v536,  v585,  v634,  v683,  v732,  v781,  v830,  v879,  v928,  v977,  v1026,  v1075,  v1124,  v1173,  v1222,  v1271,  v1319,  v1366,  v1412,  v1457,  v1501,  v1544,  v1586,  v1627,  v1667,  v1706,  v1744,  v1781,  v1817,  v1852,  v1886,  v1919,  v1951,  v1982,  v2012,  v2041,  v2069,  v2096,  v2122,  v2147,  v2171,
             v2194,
             v2216);
    uint64_t v303 = sub_DD7AC( v295,  v296,  v297,  v298,  v299,  v300,  v301,  v302,  v537,  v586,  v635,  v684,  v733,  v782,  v831,  v880,  v929,  v978,  v1027,  v1076,  v1125,  v1174,  v1223,  v1272,  v1320,  v1367,  v1413,  v1458,  v1502,  v1545,  v1587,  v1628,  v1668,  v1707,  v1745,  v1782,  v1818,  v1853,  v1887,  v1920,  v1952,  v1983,  v2013,  v2042,  v2070,  v2097,  v2123,  v2148,  v2172,
             v2195,
             v2217,
             v2238);
    uint64_t v311 = sub_DD7A4( v303,  v304,  v305,  v306,  v307,  v308,  v309,  v310,  v538,  v587,  v636,  v685,  v734,  v783,  v832,  v881,  v930,  v979,  v1028,  v1077,  v1126,  v1175,  v1224,  v1273,  v1321,  v1368,  v1414,  v1459,  v1503,  v1546,  v1588,  v1629,  v1669,  v1708,  v1746,  v1783,  v1819,  v1854,  v1888,  v1921,  v1953,  v1984,  v2014,  v2043,  v2071,  v2098,  v2124,  v2149,  v2173,
             v2196,
             v2218,
             v2239,
             v2259);
    uint64_t v319 = sub_DD79C( v311,  v312,  v313,  v314,  v315,  v316,  v317,  v318,  v539,  v588,  v637,  v686,  v735,  v784,  v833,  v882,  v931,  v980,  v1029,  v1078,  v1127,  v1176,  v1225,  v1274,  v1322,  v1369,  v1415,  v1460,  v1504,  v1547,  v1589,  v1630,  v1670,  v1709,  v1747,  v1784,  v1820,  v1855,  v1889,  v1922,  v1954,  v1985,  v2015,  v2044,  v2072,  v2099,  v2125,  v2150,  v2174,
             v2197,
             v2219,
             v2240,
             v2260,
             v2279);
    uint64_t v327 = sub_DD794( v319,  v320,  v321,  v322,  v323,  v324,  v325,  v326,  v540,  v589,  v638,  v687,  v736,  v785,  v834,  v883,  v932,  v981,  v1030,  v1079,  v1128,  v1177,  v1226,  v1275,  v1323,  v1370,  v1416,  v1461,  v1505,  v1548,  v1590,  v1631,  v1671,  v1710,  v1748,  v1785,  v1821,  v1856,  v1890,  v1923,  v1955,  v1986,  v2016,  v2045,  v2073,  v2100,  v2126,  v2151,  v2175,
             v2198,
             v2220,
             v2241,
             v2261,
             v2280,
             v2298);
    uint64_t v335 = sub_DD78C( v327,  v328,  v329,  v330,  v331,  v332,  v333,  v334,  v541,  v590,  v639,  v688,  v737,  v786,  v835,  v884,  v933,  v982,  v1031,  v1080,  v1129,  v1178,  v1227,  v1276,  v1324,  v1371,  v1417,  v1462,  v1506,  v1549,  v1591,  v1632,  v1672,  v1711,  v1749,  v1786,  v1822,  v1857,  v1891,  v1924,  v1956,  v1987,  v2017,  v2046,  v2074,  v2101,  v2127,  v2152,  v2176,
             v2199,
             v2221,
             v2242,
             v2262,
             v2281,
             v2299,
             v2316);
    uint64_t v343 = sub_DD784( v335,  v336,  v337,  v338,  v339,  v340,  v341,  v342,  v542,  v591,  v640,  v689,  v738,  v787,  v836,  v885,  v934,  v983,  v1032,  v1081,  v1130,  v1179,  v1228,  v1277,  v1325,  v1372,  v1418,  v1463,  v1507,  v1550,  v1592,  v1633,  v1673,  v1712,  v1750,  v1787,  v1823,  v1858,  v1892,  v1925,  v1957,  v1988,  v2018,  v2047,  v2075,  v2102,  v2128,  v2153,  v2177,
             v2200,
             v2222,
             v2243,
             v2263,
             v2282,
             v2300,
             v2317,
             v2333);
    uint64_t v351 = sub_DD77C( v343,  v344,  v345,  v346,  v347,  v348,  v349,  v350,  v543,  v592,  v641,  v690,  v739,  v788,  v837,  v886,  v935,  v984,  v1033,  v1082,  v1131,  v1180,  v1229,  v1278,  v1326,  v1373,  v1419,  v1464,  v1508,  v1551,  v1593,  v1634,  v1674,  v1713,  v1751,  v1788,  v1824,  v1859,  v1893,  v1926,  v1958,  v1989,  v2019,  v2048,  v2076,  v2103,  v2129,  v2154,  v2178,
             v2201,
             v2223,
             v2244,
             v2264,
             v2283,
             v2301,
             v2318,
             v2334,
             v2349);
    uint64_t v359 = sub_DD774( v351,  v352,  v353,  v354,  v355,  v356,  v357,  v358,  v544,  v593,  v642,  v691,  v740,  v789,  v838,  v887,  v936,  v985,  v1034,  v1083,  v1132,  v1181,  v1230,  v1279,  v1327,  v1374,  v1420,  v1465,  v1509,  v1552,  v1594,  v1635,  v1675,  v1714,  v1752,  v1789,  v1825,  v1860,  v1894,  v1927,  v1959,  v1990,  v2020,  v2049,  v2077,  v2104,  v2130,  v2155,  v2179,
             v2202,
             v2224,
             v2245,
             v2265,
             v2284,
             v2302,
             v2319,
             v2335,
             v2350,
             v2364);
    uint64_t v367 = sub_DD76C( v359,  v360,  v361,  v362,  v363,  v364,  v365,  v366,  v545,  v594,  v643,  v692,  v741,  v790,  v839,  v888,  v937,  v986,  v1035,  v1084,  v1133,  v1182,  v1231,  v1280,  v1328,  v1375,  v1421,  v1466,  v1510,  v1553,  v1595,  v1636,  v1676,  v1715,  v1753,  v1790,  v1826,  v1861,  v1895,  v1928,  v1960,  v1991,  v2021,  v2050,  v2078,  v2105,  v2131,  v2156,  v2180,
             v2203,
             v2225,
             v2246,
             v2266,
             v2285,
             v2303,
             v2320,
             v2336,
             v2351,
             v2365,
             v2378);
    uint64_t v375 = sub_DD764( v367,  v368,  v369,  v370,  v371,  v372,  v373,  v374,  v546,  v595,  v644,  v693,  v742,  v791,  v840,  v889,  v938,  v987,  v1036,  v1085,  v1134,  v1183,  v1232,  v1281,  v1329,  v1376,  v1422,  v1467,  v1511,  v1554,  v1596,  v1637,  v1677,  v1716,  v1754,  v1791,  v1827,  v1862,  v1896,  v1929,  v1961,  v1992,  v2022,  v2051,  v2079,  v2106,  v2132,  v2157,  v2181,
             v2204,
             v2226,
             v2247,
             v2267,
             v2286,
             v2304,
             v2321,
             v2337,
             v2352,
             v2366,
             v2379,
             v2391);
    uint64_t v383 = sub_DD75C( v375,  v376,  v377,  v378,  v379,  v380,  v381,  v382,  v547,  v596,  v645,  v694,  v743,  v792,  v841,  v890,  v939,  v988,  v1037,  v1086,  v1135,  v1184,  v1233,  v1282,  v1330,  v1377,  v1423,  v1468,  v1512,  v1555,  v1597,  v1638,  v1678,  v1717,  v1755,  v1792,  v1828,  v1863,  v1897,  v1930,  v1962,  v1993,  v2023,  v2052,  v2080,  v2107,  v2133,  v2158,  v2182,
             v2205,
             v2227,
             v2248,
             v2268,
             v2287,
             v2305,
             v2322,
             v2338,
             v2353,
             v2367,
             v2380,
             v2392,
             v2403);
    uint64_t v391 = sub_DD754( v383,  v384,  v385,  v386,  v387,  v388,  v389,  v390,  v548,  v597,  v646,  v695,  v744,  v793,  v842,  v891,  v940,  v989,  v1038,  v1087,  v1136,  v1185,  v1234,  v1283,  v1331,  v1378,  v1424,  v1469,  v1513,  v1556,  v1598,  v1639,  v1679,  v1718,  v1756,  v1793,  v1829,  v1864,  v1898,  v1931,  v1963,  v1994,  v2024,  v2053,  v2081,  v2108,  v2134,  v2159,  v2183,
             v2206,
             v2228,
             v2249,
             v2269,
             v2288,
             v2306,
             v2323,
             v2339,
             v2354,
             v2368,
             v2381,
             v2393,
             v2404,
             v2414);
    uint64_t v399 = sub_DD74C( v391,  v392,  v393,  v394,  v395,  v396,  v397,  v398,  v549,  v598,  v647,  v696,  v745,  v794,  v843,  v892,  v941,  v990,  v1039,  v1088,  v1137,  v1186,  v1235,  v1284,  v1332,  v1379,  v1425,  v1470,  v1514,  v1557,  v1599,  v1640,  v1680,  v1719,  v1757,  v1794,  v1830,  v1865,  v1899,  v1932,  v1964,  v1995,  v2025,  v2054,  v2082,  v2109,  v2135,  v2160,  v2184,
             v2207,
             v2229,
             v2250,
             v2270,
             v2289,
             v2307,
             v2324,
             v2340,
             v2355,
             v2369,
             v2382,
             v2394,
             v2405,
             v2415);
    uint64_t v407 = sub_DD744( v399,  v400,  v401,  v402,  v403,  v404,  v405,  v406,  v550,  v599,  v648,  v697,  v746,  v795,  v844,  v893,  v942,  v991,  v1040,  v1089,  v1138,  v1187,  v1236,  v1285,  v1333,  v1380,  v1426,  v1471,  v1515,  v1558,  v1600,  v1641,  v1681,  v1720,  v1758,  v1795,  v1831,  v1866,  v1900,  v1933,  v1965,  v1996,  v2026,  v2055,  v2083,  v2110,  v2136,  v2161,  v2185,
             v2208,
             v2230,
             v2251,
             v2271,
             v2290,
             v2308,
             v2325,
             v2341,
             v2356,
             v2370,
             v2383,
             v2395,
             v2406,
             v2416);
    uint64_t v415 = sub_DD73C( v407,  v408,  v409,  v410,  v411,  v412,  v413,  v414,  v551,  v600,  v649,  v698,  v747,  v796,  v845,  v894,  v943,  v992,  v1041,  v1090,  v1139,  v1188,  v1237,  v1286,  v1334,  v1381,  v1427,  v1472,  v1516,  v1559,  v1601,  v1642,  v1682,  v1721,  v1759,  v1796,  v1832,  v1867,  v1901,  v1934,  v1966,  v1997,  v2027,  v2056,  v2084,  v2111,  v2137,  v2162,  v2186,
             v2209,
             v2231,
             v2252,
             v2272,
             v2291,
             v2309,
             v2326,
             v2342,
             v2357,
             v2371,
             v2384,
             v2396,
             v2407,
             v2417);
    uint64_t v423 = sub_DD734( v415,  v416,  v417,  v418,  v419,  v420,  v421,  v422,  v552,  v601,  v650,  v699,  v748,  v797,  v846,  v895,  v944,  v993,  v1042,  v1091,  v1140,  v1189,  v1238,  v1287,  v1335,  v1382,  v1428,  v1473,  v1517,  v1560,  v1602,  v1643,  v1683,  v1722,  v1760,  v1797,  v1833,  v1868,  v1902,  v1935,  v1967,  v1998,  v2028,  v2057,  v2085,  v2112,  v2138,  v2163,  v2187,
             v2210,
             v2232,
             v2253,
             v2273,
             v2292,
             v2310,
             v2327,
             v2343,
             v2358,
             v2372,
             v2385,
             v2397,
             v2408,
             v2418);
    uint64_t v431 = sub_DD72C( v423,  v424,  v425,  v426,  v427,  v428,  v429,  v430,  v553,  v602,  v651,  v700,  v749,  v798,  v847,  v896,  v945,  v994,  v1043,  v1092,  v1141,  v1190,  v1239,  v1288,  v1336,  v1383,  v1429,  v1474,  v1518,  v1561,  v1603,  v1644,  v1684,  v1723,  v1761,  v1798,  v1834,  v1869,  v1903,  v1936,  v1968,  v1999,  v2029,  v2058,  v2086,  v2113,  v2139,  v2164,  v2188,
             v2211,
             v2233,
             v2254,
             v2274,
             v2293,
             v2311,
             v2328,
             v2344,
             v2359,
             v2373,
             v2386,
             v2398,
             v2409,
             v2419);
    uint64_t v439 = sub_DD724( v431,  v432,  v433,  v434,  v435,  v436,  v437,  v438,  v554,  v603,  v652,  v701,  v750,  v799,  v848,  v897,  v946,  v995,  v1044,  v1093,  v1142,  v1191,  v1240,  v1289,  v1337,  v1384,  v1430,  v1475,  v1519,  v1562,  v1604,  v1645,  v1685,  v1724,  v1762,  v1799,  v1835,  v1870,  v1904,  v1937,  v1969,  v2000,  v2030,  v2059,  v2087,  v2114,  v2140,  v2165,  v2189,
             v2212,
             v2234,
             v2255,
             v2275,
             v2294,
             v2312,
             v2329,
             v2345,
             v2360,
             v2374,
             v2387,
             v2399,
             v2410,
             v2420);
    uint64_t v447 = sub_DD71C( v439,  v440,  v441,  v442,  v443,  v444,  v445,  v446,  v555,  v604,  v653,  v702,  v751,  v800,  v849,  v898,  v947,  v996,  v1045,  v1094,  v1143,  v1192,  v1241,  v1290,  v1338,  v1385,  v1431,  v1476,  v1520,  v1563,  v1605,  v1646,  v1686,  v1725,  v1763,  v1800,  v1836,  v1871,  v1905,  v1938,  v1970,  v2001,  v2031,  v2060,  v2088,  v2115,  v2141,  v2166,  v2190,
             v2213,
             v2235,
             v2256,
             v2276,
             v2295,
             v2313,
             v2330,
             v2346,
             v2361,
             v2375,
             v2388,
             v2400,
             v2411,
             v2421);
    uint64_t v455 = sub_DD714( v447,  v448,  v449,  v450,  v451,  v452,  v453,  v454,  v556,  v605,  v654,  v703,  v752,  v801,  v850,  v899,  v948,  v997,  v1046,  v1095,  v1144,  v1193,  v1242,  v1291,  v1339,  v1386,  v1432,  v1477,  v1521,  v1564,  v1606,  v1647,  v1687,  v1726,  v1764,  v1801,  v1837,  v1872,  v1906,  v1939,  v1971,  v2002,  v2032,  v2061,  v2089,  v2116,  v2142,  v2167,  v2191,
             v2214,
             v2236,
             v2257,
             v2277,
             v2296,
             v2314,
             v2331,
             v2347,
             v2362,
             v2376,
             v2389,
             v2401,
             v2412,
             v2422);
    sub_DD70C( v455,  v456,  v457,  v458,  v459,  v460,  v461,  v462,  v557,  v606,  v655,  v704,  v753,  v802,  v851,  v900,  v949,  v998,  v1047,  v1096,  v1145,  v1194,  v1243,  v1292,  v1340,  v1387,  v1433,  v1478,  v1522,  v1565,  v1607,  v1648,  v1688,  v1727,  v1765,  v1802,  v1838,  v1873,  v1907,  v1940,  v1972,  v2003,  v2033,  v2062,  v2090,  v2117,  v2143,  v2168,  v2192,
      v2215,
      v2237,
      v2258,
      v2278,
      v2297,
      v2315,
      v2332,
      v2348,
      v2363,
      v2377,
      v2390,
      v2402,
      v2413,
      v2423);
    sub_DD704();
    sub_DD6FC();
    sub_DD6F4();
    sub_DD6EC();
    sub_DD6E4();
    sub_DD6DC();
    sub_DD6D4();
    sub_DD6CC();
    sub_DD6C4();
    sub_DD6BC();
    sub_DD6B4();
    sub_DD6AC();
    sub_DD6A4();
    sub_DD69C();
    sub_DD694();
    sub_DD68C();
    sub_DD684();
    sub_DD67C();
    sub_DD674();
    sub_DD66C();
    sub_DD664();
    sub_DD65C();
    sub_DD654();
    sub_DD64C();
    sub_DD644();
    sub_DD63C();
    sub_DD634();
    sub_DD62C();
    sub_DD624();
    sub_DD61C();
    sub_DD614();
    sub_DD60C();
    sub_DD604();
    sub_DD5FC();
    sub_DD5F4();
    sub_DD5EC();
    sub_DD5E4();
    sub_DD5DC();
    sub_DD5D4();
    sub_DD5CC();
    sub_DD5C4();
    sub_DD5BC();
    sub_DD5B4();
    sub_DD5AC();
    sub_DD5A4();
    sub_DD59C();
    sub_DD594();
    sub_DD58C();
    sub_DD584();
    sub_DD57C();
    sub_DD574();
    sub_DD56C();
    sub_DD564();
    sub_DD55C();
    sub_DD554();
    sub_DD54C();
    sub_DD544();
    sub_DD53C();
    sub_DD534();
    sub_DD52C();
    sub_DD524();
    sub_DD51C();
    sub_DD514();
    sub_DD50C();
    sub_DD504();
    sub_DD4FC();
    sub_DD4F4();
    sub_DD4EC();
    sub_DD4DC();
    sub_DD4E4();
    sub_DD868();
    sub_DD870();
    sub_DDA48();
    sub_DDA58();
    sub_DDE30();
    sub_DDE28();
    sub_DE6BC();
    sub_DE6B4();
    sub_DE6AC();
    sub_DE6A4();
    sub_DE69C();
    sub_DE694();
    sub_DEA78();
    sub_DEA70();
    sub_DEA68();
    sub_DEB50();
    sub_36B88();
    sub_366E8();
    sub_3677C();
    sub_36588();
    sub_36624();
    sub_3661C();
    sub_36614();
    sub_3660C();
    sub_36604();
    sub_365FC();
    sub_365F4();
    sub_365EC();
    sub_365E4();
    sub_365DC();
    sub_366B8();
    sub_366B0();
    sub_366A8();
    sub_36814();
    return sub_36148(*(uint64_t (**)(void))(v0 + 8));
  }

uint64_t sub_C87B8()
{
  return sub_D954();
}

uint64_t sub_C8804()
{
  uint64_t v1 = (void *)v0[3454];
  uint64_t v2 = (void *)v0[3451];
  sub_DE98C();
  sub_DE494(v0[3286]);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v3);
  sub_369CC();
  sub_36878((uint64_t)(v0 + 2836));
  uint64_t v4 = sub_20308((uint64_t)&unk_180368, 56LL);
  id v5 = sub_DDC44(v4);
  v0[3243] = sub_DE874((uint64_t)v5, (uint64_t)&unk_18EA98);
  sub_DE2C8();

  sub_DE48C();
  uint64_t v6 = sub_DEA0C();
  sub_DED24(v6, type metadata accessor for SpecificMedCompletedLogModel);
  sub_DE1AC(v7, &qword_189CF8);
  uint64_t v8 = sub_DDB08();
  sub_DDC20(v8, type metadata accessor for SnippetHeaderModel);
  sub_DE3DC(v9, &qword_189D00);
  sub_DDA68(v10, &qword_18B168);
  sub_3652C();
  sub_DC288();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v11 = sub_A78C();
  uint64_t v19 = sub_A888(v11, v12, v13, v14, v15, v16, v17, v18, v509, v571, v633);
  uint64_t v27 = sub_A854(v19, v20, v21, v22, v23, v24, v25, v26, v510, v572, v634, v695);
  uint64_t v35 = sub_A84C(v27, v28, v29, v30, v31, v32, v33, v34, v511, v573, v635, v696, v756);
  uint64_t v43 = sub_A844(v35, v36, v37, v38, v39, v40, v41, v42, v512, v574, v636, v697, v757, v816);
  uint64_t v51 = sub_A83C(v43, v44, v45, v46, v47, v48, v49, v50, v513, v575, v637, v698, v758, v817, v875);
  uint64_t v59 = sub_A95C(v51, v52, v53, v54, v55, v56, v57, v58, v514, v576, v638, v699, v759, v818, v876, v933);
  uint64_t v67 = sub_A954(v59, v60, v61, v62, v63, v64, v65, v66, v515, v577, v639, v700, v760, v819, v877, v934, v990);
  uint64_t v75 = sub_A938(v67, v68, v69, v70, v71, v72, v73, v74, v516, v578, v640, v701, v761, v820, v878, v935, v991, v1046);
  uint64_t v83 = sub_A930( v75,  v76,  v77,  v78,  v79,  v80,  v81,  v82,  v517,  v579,  v641,  v702,  v762,  v821,  v879,  v936,  v992,  v1047,  v1101);
  uint64_t v91 = sub_A928( v83,  v84,  v85,  v86,  v87,  v88,  v89,  v90,  v518,  v580,  v642,  v703,  v763,  v822,  v880,  v937,  v993,  v1048,  v1102,  v1155);
  uint64_t v99 = sub_A920( v91,  v92,  v93,  v94,  v95,  v96,  v97,  v98,  v519,  v581,  v643,  v704,  v764,  v823,  v881,  v938,  v994,  v1049,  v1103,  v1156,  v1208);
  uint64_t v107 = sub_36374( v99,  v100,  v101,  v102,  v103,  v104,  v105,  v106,  v520,  v582,  v644,  v705,  v765,  v824,  v882,  v939,  v995,  v1050,  v1104,  v1157,  v1209,  v1260);
  uint64_t v115 = sub_3636C( v107,  v108,  v109,  v110,  v111,  v112,  v113,  v114,  v521,  v583,  v645,  v706,  v766,  v825,  v883,  v940,  v996,  v1051,  v1105,  v1158,  v1210,  v1261,  v1311);
  uint64_t v123 = sub_36364( v115,  v116,  v117,  v118,  v119,  v120,  v121,  v122,  v522,  v584,  v646,  v707,  v767,  v826,  v884,  v941,  v997,  v1052,  v1106,  v1159,  v1211,  v1262,  v1312,  v1361);
  uint64_t v131 = sub_363F0( v123,  v124,  v125,  v126,  v127,  v128,  v129,  v130,  v523,  v585,  v647,  v708,  v768,  v827,  v885,  v942,  v998,  v1053,  v1107,  v1160,  v1212,  v1263,  v1313,  v1362,  v1410);
  uint64_t v139 = sub_36430( v131,  v132,  v133,  v134,  v135,  v136,  v137,  v138,  v524,  v586,  v648,  v709,  v769,  v828,  v886,  v943,  v999,  v1054,  v1108,  v1161,  v1213,  v1264,  v1314,  v1363,  v1411,  v1458);
  uint64_t v147 = sub_36428( v139,  v140,  v141,  v142,  v143,  v144,  v145,  v146,  v525,  v587,  v649,  v710,  v770,  v829,  v887,  v944,  v1000,  v1055,  v1109,  v1162,  v1214,  v1265,  v1315,  v1364,  v1412,  v1459,  v1505);
  uint64_t v155 = sub_36478( v147,  v148,  v149,  v150,  v151,  v152,  v153,  v154,  v526,  v588,  v650,  v711,  v771,  v830,  v888,  v945,  v1001,  v1056,  v1110,  v1163,  v1215,  v1266,  v1316,  v1365,  v1413,  v1460,  v1506,  v1551);
  uint64_t v163 = sub_36524( v155,  v156,  v157,  v158,  v159,  v160,  v161,  v162,  v527,  v589,  v651,  v712,  v772,  v831,  v889,  v946,  v1002,  v1057,  v1111,  v1164,  v1216,  v1267,  v1317,  v1366,  v1414,  v1461,  v1507,  v1552,  v1596);
  uint64_t v171 = sub_3651C( v163,  v164,  v165,  v166,  v167,  v168,  v169,  v170,  v528,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112,  v1165,  v1217,  v1268,  v1318,  v1367,  v1415,  v1462,  v1508,  v1553,  v1597,  v1640);
  uint64_t v179 = sub_36514( v171,  v172,  v173,  v174,  v175,  v176,  v177,  v178,  v529,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166,  v1218,  v1269,  v1319,  v1368,  v1416,  v1463,  v1509,  v1554,  v1598,  v1641,  v1683);
  uint64_t v187 = sub_3650C( v179,  v180,  v181,  v182,  v183,  v184,  v185,  v186,  v530,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219,  v1270,  v1320,  v1369,  v1417,  v1464,  v1510,  v1555,  v1599,  v1642,  v1684,  v1725);
  uint64_t v195 = sub_36504( v187,  v188,  v189,  v190,  v191,  v192,  v193,  v194,  v531,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271,  v1321,  v1370,  v1418,  v1465,  v1511,  v1556,  v1600,  v1643,  v1685,  v1726,  v1766);
  uint64_t v203 = sub_364FC( v195,  v196,  v197,  v198,  v199,  v200,  v201,  v202,  v532,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322,  v1371,  v1419,  v1466,  v1512,  v1557,  v1601,  v1644,  v1686,  v1727,  v1767,  v1806);
  uint64_t v211 = sub_364F4( v203,  v204,  v205,  v206,  v207,  v208,  v209,  v210,  v533,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372,  v1420,  v1467,  v1513,  v1558,  v1602,  v1645,  v1687,  v1728,  v1768,  v1807,  v1845);
  uint64_t v219 = sub_364EC( v211,  v212,  v213,  v214,  v215,  v216,  v217,  v218,  v534,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421,  v1468,  v1514,  v1559,  v1603,  v1646,  v1688,  v1729,  v1769,  v1808,  v1846,  v1883);
  uint64_t v227 = sub_364E4( v219,  v220,  v221,  v222,  v223,  v224,  v225,  v226,  v535,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469,  v1515,  v1560,  v1604,  v1647,  v1689,  v1730,  v1770,  v1809,  v1847,  v1884,  v1920);
  uint64_t v235 = sub_364DC( v227,  v228,  v229,  v230,  v231,  v232,  v233,  v234,  v536,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516,  v1561,  v1605,  v1648,  v1690,  v1731,  v1771,  v1810,  v1848,  v1885,  v1921,  v1956);
  uint64_t v243 = sub_364D4( v235,  v236,  v237,  v238,  v239,  v240,  v241,  v242,  v537,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562,  v1606,  v1649,  v1691,  v1732,  v1772,  v1811,  v1849,  v1886,  v1922,  v1957,  v1991);
  uint64_t v251 = sub_366F8( v243,  v244,  v245,  v246,  v247,  v248,  v249,  v250,  v538,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607,  v1650,  v1692,  v1733,  v1773,  v1812,  v1850,  v1887,  v1923,  v1958,  v1992,  v2025);
  uint64_t v259 = sub_366F0( v251,  v252,  v253,  v254,  v255,  v256,  v257,  v258,  v539,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651,  v1693,  v1734,  v1774,  v1813,  v1851,  v1888,  v1924,  v1959,  v1993,  v2026,  v2058);
  uint64_t v267 = sub_36B90( v259,  v260,  v261,  v262,  v263,  v264,  v265,  v266,  v540,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694,  v1735,  v1775,  v1814,  v1852,  v1889,  v1925,  v1960,  v1994,  v2027,  v2059,  v2090);
  uint64_t v275 = sub_36EF4( v267,  v268,  v269,  v270,  v271,  v272,  v273,  v274,  v541,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736,  v1776,  v1815,  v1853,  v1890,  v1926,  v1961,  v1995,  v2028,  v2060,  v2091,  v2121);
  uint64_t v283 = sub_36EEC( v275,  v276,  v277,  v278,  v279,  v280,  v281,  v282,  v542,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777,  v1816,  v1854,  v1891,  v1927,  v1962,  v1996,  v2029,  v2061,  v2092,  v2122,  v2151);
  uint64_t v291 = sub_DD7E4( v283,  v284,  v285,  v286,  v287,  v288,  v289,  v290,  v543,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817,  v1855,  v1892,  v1928,  v1963,  v1997,  v2030,  v2062,  v2093,  v2123,  v2152,  v2180);
  uint64_t v299 = sub_DD7DC( v291,  v292,  v293,  v294,  v295,  v296,  v297,  v298,  v544,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856,  v1893,  v1929,  v1964,  v1998,  v2031,  v2063,  v2094,  v2124,  v2153,  v2181,  v2208);
  uint64_t v307 = sub_DD7D4( v299,  v300,  v301,  v302,  v303,  v304,  v305,  v306,  v545,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894,  v1930,  v1965,  v1999,  v2032,  v2064,  v2095,  v2125,  v2154,  v2182,  v2209,  v2235);
  uint64_t v315 = sub_DD7CC( v307,  v308,  v309,  v310,  v311,  v312,  v313,  v314,  v546,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931,  v1966,  v2000,  v2033,  v2065,  v2096,  v2126,  v2155,  v2183,  v2210,  v2236,  v2261);
  uint64_t v323 = sub_DD7C4( v315,  v316,  v317,  v318,  v319,  v320,  v321,  v322,  v547,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967,  v2001,  v2034,  v2066,  v2097,  v2127,  v2156,  v2184,  v2211,  v2237,  v2262,  v2286);
  uint64_t v331 = sub_DD7BC( v323,  v324,  v325,  v326,  v327,  v328,  v329,  v330,  v548,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002,  v2035,  v2067,  v2098,  v2128,  v2157,  v2185,  v2212,  v2238,  v2263,  v2287,
           v2310);
  uint64_t v339 = sub_DD7B4( v331,  v332,  v333,  v334,  v335,  v336,  v337,  v338,  v549,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036,  v2068,  v2099,  v2129,  v2158,  v2186,  v2213,  v2239,  v2264,  v2288,
           v2311,
           v2333);
  uint64_t v347 = sub_DD7AC( v339,  v340,  v341,  v342,  v343,  v344,  v345,  v346,  v550,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069,  v2100,  v2130,  v2159,  v2187,  v2214,  v2240,  v2265,  v2289,
           v2312,
           v2334,
           v2355);
  uint64_t v355 = sub_DD7A4( v347,  v348,  v349,  v350,  v351,  v352,  v353,  v354,  v551,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101,  v2131,  v2160,  v2188,  v2215,  v2241,  v2266,  v2290,
           v2313,
           v2335,
           v2356,
           v2376);
  uint64_t v363 = sub_DD79C( v355,  v356,  v357,  v358,  v359,  v360,  v361,  v362,  v552,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132,  v2161,  v2189,  v2216,  v2242,  v2267,  v2291,
           v2314,
           v2336,
           v2357,
           v2377,
           v2396);
  uint64_t v371 = sub_DD794( v363,  v364,  v365,  v366,  v367,  v368,  v369,  v370,  v553,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162,  v2190,  v2217,  v2243,  v2268,  v2292,
           v2315,
           v2337,
           v2358,
           v2378,
           v2397,
           v2415);
  uint64_t v379 = sub_DD78C( v371,  v372,  v373,  v374,  v375,  v376,  v377,  v378,  v554,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191,  v2218,  v2244,  v2269,  v2293,
           v2316,
           v2338,
           v2359,
           v2379,
           v2398,
           v2416,
           v2433);
  uint64_t v387 = sub_DD784( v379,  v380,  v381,  v382,  v383,  v384,  v385,  v386,  v555,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219,  v2245,  v2270,  v2294,
           v2317,
           v2339,
           v2360,
           v2380,
           v2399,
           v2417,
           v2434,
           v2450);
  uint64_t v395 = sub_DD77C( v387,  v388,  v389,  v390,  v391,  v392,  v393,  v394,  v556,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246,  v2271,  v2295,
           v2318,
           v2340,
           v2361,
           v2381,
           v2400,
           v2418,
           v2435,
           v2451,
           v2466);
  uint64_t v403 = sub_DD774( v395,  v396,  v397,  v398,  v399,  v400,  v401,  v402,  v557,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272,  v2296,
           v2319,
           v2341,
           v2362,
           v2382,
           v2401,
           v2419,
           v2436,
           v2452,
           v2467,
           v2481);
  uint64_t v411 = sub_DD76C( v403,  v404,  v405,  v406,  v407,  v408,  v409,  v410,  v558,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297,
           v2320,
           v2342,
           v2363,
           v2383,
           v2402,
           v2420,
           v2437,
           v2453,
           v2468,
           v2482,
           v2495);
  uint64_t v419 = sub_DD764( v411,  v412,  v413,  v414,  v415,  v416,  v417,  v418,  v559,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321,
           v2343,
           v2364,
           v2384,
           v2403,
           v2421,
           v2438,
           v2454,
           v2469,
           v2483,
           v2496,
           v2508);
  uint64_t v427 = sub_DD75C( v419,  v420,  v421,  v422,  v423,  v424,  v425,  v426,  v560,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344,
           v2365,
           v2385,
           v2404,
           v2422,
           v2439,
           v2455,
           v2470,
           v2484,
           v2497,
           v2509,
           v2520);
  uint64_t v435 = sub_DD754( v427,  v428,  v429,  v430,  v431,  v432,  v433,  v434,  v561,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366,
           v2386,
           v2405,
           v2423,
           v2440,
           v2456,
           v2471,
           v2485,
           v2498,
           v2510,
           v2521,
           v2531);
  uint64_t v443 = sub_DD74C( v435,  v436,  v437,  v438,  v439,  v440,  v441,  v442,  v562,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387,
           v2406,
           v2424,
           v2441,
           v2457,
           v2472,
           v2486,
           v2499,
           v2511,
           v2522,
           v2532);
  uint64_t v451 = sub_DD744( v443,  v444,  v445,  v446,  v447,  v448,  v449,  v450,  v563,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407,
           v2425,
           v2442,
           v2458,
           v2473,
           v2487,
           v2500,
           v2512,
           v2523,
           v2533);
  uint64_t v459 = sub_DD73C( v451,  v452,  v453,  v454,  v455,  v456,  v457,  v458,  v564,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426,
           v2443,
           v2459,
           v2474,
           v2488,
           v2501,
           v2513,
           v2524,
           v2534);
  uint64_t v467 = sub_DD734( v459,  v460,  v461,  v462,  v463,  v464,  v465,  v466,  v565,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444,
           v2460,
           v2475,
           v2489,
           v2502,
           v2514,
           v2525,
           v2535);
  uint64_t v475 = sub_DD72C( v467,  v468,  v469,  v470,  v471,  v472,  v473,  v474,  v566,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461,
           v2476,
           v2490,
           v2503,
           v2515,
           v2526,
           v2536);
  uint64_t v483 = sub_DD724( v475,  v476,  v477,  v478,  v479,  v480,  v481,  v482,  v567,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462,
           v2477,
           v2491,
           v2504,
           v2516,
           v2527,
           v2537);
  uint64_t v491 = sub_DD71C( v483,  v484,  v485,  v486,  v487,  v488,  v489,  v490,  v568,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463,
           v2478,
           v2492,
           v2505,
           v2517,
           v2528,
           v2538);
  uint64_t v499 = sub_DD714( v491,  v492,  v493,  v494,  v495,  v496,  v497,  v498,  v569,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479,
           v2493,
           v2506,
           v2518,
           v2529,
           v2539);
  sub_DD70C( v499,  v500,  v501,  v502,  v503,  v504,  v505,  v506,  v570,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
    v2332,
    v2354,
    v2375,
    v2395,
    v2414,
    v2432,
    v2449,
    v2465,
    v2480,
    v2494,
    v2507,
    v2519,
    v2530,
    v2540);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  id v507 = (uint64_t (*)(void))sub_DE01C();
  return sub_36148(v507);
}

uint64_t sub_C8BA8()
{
  os_log_type_t v6 = sub_AB70();
  if (sub_46614(v6))
  {
    uint64_t v7 = (_WORD *)sub_3635C();
    sub_36908(v7);
    sub_DD494();
    sub_DA1C();
    sub_232EC( &dword_0,  v0,  v2,  "Couldn't create specificMedicationStatusBothSkipped_Dialog, returning GenericErrorFlow",  v3);
    sub_37128();
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  sub_3747C();
  sub_DE55C();
  uint64_t v8 = v1[3277];
  sub_36590((_OWORD *)(v1[3247] + 64LL));
  sub_DE348(v1 + 1356);
  sub_A178();
  sub_DDE00();

  sub_DE304();
  uint64_t v9 = sub_89E0C(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  sub_992F0(v9, type metadata accessor for SnippetHeaderModel);
  sub_DDA68(v10, &qword_189D00);
  sub_DDBDC(v11, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v12 = sub_A78C();
  uint64_t v20 = sub_AAD8(v12, v13, v14, v15, v16, v17, v18, v19, v518, v581);
  uint64_t v28 = sub_A888(v20, v21, v22, v23, v24, v25, v26, v27, v519, v582, v644);
  uint64_t v36 = sub_A854(v28, v29, v30, v31, v32, v33, v34, v35, v520, v583, v645, v706);
  uint64_t v44 = sub_A84C(v36, v37, v38, v39, v40, v41, v42, v43, v521, v584, v646, v707, v767);
  uint64_t v52 = sub_A844(v44, v45, v46, v47, v48, v49, v50, v51, v522, v585, v647, v708, v768, v827);
  uint64_t v60 = sub_A83C(v52, v53, v54, v55, v56, v57, v58, v59, v523, v586, v648, v709, v769, v828, v886);
  uint64_t v68 = sub_A95C(v60, v61, v62, v63, v64, v65, v66, v67, v524, v587, v649, v710, v770, v829, v887, v944);
  uint64_t v76 = sub_A954(v68, v69, v70, v71, v72, v73, v74, v75, v525, v588, v650, v711, v771, v830, v888, v945, v1001);
  uint64_t v84 = sub_A938(v76, v77, v78, v79, v80, v81, v82, v83, v526, v589, v651, v712, v772, v831, v889, v946, v1002, v1057);
  uint64_t v92 = sub_A930( v84,  v85,  v86,  v87,  v88,  v89,  v90,  v91,  v527,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112);
  uint64_t v100 = sub_A928( v92,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v528,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166);
  uint64_t v108 = sub_A920( v100,  v101,  v102,  v103,  v104,  v105,  v106,  v107,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219);
  uint64_t v116 = sub_36374( v108,  v109,  v110,  v111,  v112,  v113,  v114,  v115,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271);
  uint64_t v124 = sub_3636C( v116,  v117,  v118,  v119,  v120,  v121,  v122,  v123,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322);
  uint64_t v132 = sub_36364( v124,  v125,  v126,  v127,  v128,  v129,  v130,  v131,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372);
  uint64_t v140 = sub_363F0( v132,  v133,  v134,  v135,  v136,  v137,  v138,  v139,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421);
  uint64_t v148 = sub_36430( v140,  v141,  v142,  v143,  v144,  v145,  v146,  v147,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469);
  uint64_t v156 = sub_36428( v148,  v149,  v150,  v151,  v152,  v153,  v154,  v155,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516);
  uint64_t v164 = sub_36478( v156,  v157,  v158,  v159,  v160,  v161,  v162,  v163,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562);
  uint64_t v172 = sub_36524( v164,  v165,  v166,  v167,  v168,  v169,  v170,  v171,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607);
  uint64_t v180 = sub_3651C( v172,  v173,  v174,  v175,  v176,  v177,  v178,  v179,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651);
  uint64_t v188 = sub_36514( v180,  v181,  v182,  v183,  v184,  v185,  v186,  v187,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694);
  uint64_t v196 = sub_3650C( v188,  v189,  v190,  v191,  v192,  v193,  v194,  v195,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736);
  uint64_t v204 = sub_36504( v196,  v197,  v198,  v199,  v200,  v201,  v202,  v203,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777);
  uint64_t v212 = sub_364FC( v204,  v205,  v206,  v207,  v208,  v209,  v210,  v211,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817);
  uint64_t v220 = sub_364F4( v212,  v213,  v214,  v215,  v216,  v217,  v218,  v219,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856);
  uint64_t v228 = sub_364EC( v220,  v221,  v222,  v223,  v224,  v225,  v226,  v227,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894);
  uint64_t v236 = sub_364E4( v228,  v229,  v230,  v231,  v232,  v233,  v234,  v235,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931);
  uint64_t v244 = sub_364DC( v236,  v237,  v238,  v239,  v240,  v241,  v242,  v243,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967);
  uint64_t v252 = sub_364D4( v244,  v245,  v246,  v247,  v248,  v249,  v250,  v251,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002);
  uint64_t v260 = sub_366F8( v252,  v253,  v254,  v255,  v256,  v257,  v258,  v259,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036);
  uint64_t v268 = sub_366F0( v260,  v261,  v262,  v263,  v264,  v265,  v266,  v267,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069);
  uint64_t v276 = sub_36B90( v268,  v269,  v270,  v271,  v272,  v273,  v274,  v275,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101);
  uint64_t v284 = sub_36EF4( v276,  v277,  v278,  v279,  v280,  v281,  v282,  v283,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132);
  uint64_t v292 = sub_36EEC( v284,  v285,  v286,  v287,  v288,  v289,  v290,  v291,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162);
  uint64_t v300 = sub_DD7E4( v292,  v293,  v294,  v295,  v296,  v297,  v298,  v299,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191);
  uint64_t v308 = sub_DD7DC( v300,  v301,  v302,  v303,  v304,  v305,  v306,  v307,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219);
  uint64_t v316 = sub_DD7D4( v308,  v309,  v310,  v311,  v312,  v313,  v314,  v315,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246);
  uint64_t v324 = sub_DD7CC( v316,  v317,  v318,  v319,  v320,  v321,  v322,  v323,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272);
  uint64_t v332 = sub_DD7C4( v324,  v325,  v326,  v327,  v328,  v329,  v330,  v331,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297);
  uint64_t v340 = sub_DD7BC( v332,  v333,  v334,  v335,  v336,  v337,  v338,  v339,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321);
  uint64_t v348 = sub_DD7B4( v340,  v341,  v342,  v343,  v344,  v345,  v346,  v347,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344);
  uint64_t v356 = sub_DD7AC( v348,  v349,  v350,  v351,  v352,  v353,  v354,  v355,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366);
  uint64_t v364 = sub_DD7A4( v356,  v357,  v358,  v359,  v360,  v361,  v362,  v363,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387);
  uint64_t v372 = sub_DD79C( v364,  v365,  v366,  v367,  v368,  v369,  v370,  v371,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407);
  uint64_t v380 = sub_DD794( v372,  v373,  v374,  v375,  v376,  v377,  v378,  v379,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426);
  uint64_t v388 = sub_DD78C( v380,  v381,  v382,  v383,  v384,  v385,  v386,  v387,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444);
  uint64_t v396 = sub_DD784( v388,  v389,  v390,  v391,  v392,  v393,  v394,  v395,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461);
  uint64_t v404 = sub_DD77C( v396,  v397,  v398,  v399,  v400,  v401,  v402,  v403,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462,
           v2477);
  uint64_t v412 = sub_DD774( v404,  v405,  v406,  v407,  v408,  v409,  v410,  v411,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463,
           v2478,
           v2492);
  uint64_t v420 = sub_DD76C( v412,  v413,  v414,  v415,  v416,  v417,  v418,  v419,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479,
           v2493,
           v2506);
  uint64_t v428 = sub_DD764( v420,  v421,  v422,  v423,  v424,  v425,  v426,  v427,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494,
           v2507,
           v2519);
  uint64_t v436 = sub_DD75C( v428,  v429,  v430,  v431,  v432,  v433,  v434,  v435,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508,
           v2520,
           v2531);
  uint64_t v444 = sub_DD754( v436,  v437,  v438,  v439,  v440,  v441,  v442,  v443,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521,
           v2532,
           v2542);
  uint64_t v452 = sub_DD74C( v444,  v445,  v446,  v447,  v448,  v449,  v450,  v451,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533,
           v2543);
  uint64_t v460 = sub_DD744( v452,  v453,  v454,  v455,  v456,  v457,  v458,  v459,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v468 = sub_DD73C( v460,  v461,  v462,  v463,  v464,  v465,  v466,  v467,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v476 = sub_DD734( v468,  v469,  v470,  v471,  v472,  v473,  v474,  v475,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v484 = sub_DD72C( v476,  v477,  v478,  v479,  v480,  v481,  v482,  v483,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v492 = sub_DD724( v484,  v485,  v486,  v487,  v488,  v489,  v490,  v491,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v500 = sub_DD71C( v492,  v493,  v494,  v495,  v496,  v497,  v498,  v499,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v508 = sub_DD714( v500,  v501,  v502,  v503,  v504,  v505,  v506,  v507,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  sub_DD70C( v508,  v509,  v510,  v511,  v512,  v513,  v514,  v515,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
    v2343,
    v2365,
    v2386,
    v2406,
    v2425,
    v2443,
    v2460,
    v2476,
    v2491,
    v2505,
    v2518,
    v2530,
    v2541,
    v2551);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v516 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v516);
}

uint64_t sub_C8F6C()
{
  *(void *)(v0 + 27856) = v5;
  sub_36900(v6);
  if (v1)
  {
    sub_DE744(*(void *)(v0 + 27840));
    if (v2) {
      unint64_t v7 = v2;
    }
    else {
      unint64_t v7 = 0xE500000000000000LL;
    }
    swift_bridgeObjectRelease(v7);
    sub_DEB68();
    if (v9) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = v3;
    }
    swift_bridgeObjectRelease(v10);
    sub_DE3A8();
    if (v9) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v4;
    }
    swift_bridgeObjectRelease(v12);
    sub_2A184();
    sub_36860();
  }

  else
  {
    swift_release();
  }

  sub_A964();
  return sub_36348(v13, v14, v15);
}

uint64_t sub_C8FF8()
{
  if ((sub_DD9F0() & 1) != 0)
  {
    uint64_t v4 = sub_DDB50();
  }

  else
  {
    sub_DDB70(22968LL);
    sub_DD964();
    sub_DD9B0((void *)(v0 + 23008));
    uint64_t v4 = sub_DD8C4();
    if (v7) {
      unsigned __int8 v6 = 0;
    }
    else {
      unsigned __int8 v6 = 4;
    }
  }

  sub_DDA20(v4, v5, v6);
  sub_DE0D8();
  sub_DD83C();
  if ((sub_DD9D0((void *)(v0 + 23088)) & 1) != 0)
  {
    uint64_t v8 = sub_DDCC8();
  }

  else
  {
    sub_DDAF8();
    sub_DD468();
    sub_DD92C((void *)(v0 + 23168));
    sub_DD8F8();
    if (v7) {
      uint64_t v8 = 9LL;
    }
    else {
      uint64_t v8 = 11LL;
    }
  }

  char v9 = *(_BYTE *)(v0 + 28516);
  HealthApps.rawValue.getter(v8);
  uint64_t v11 = v10;
  uint64_t v12 = sub_4195C();
  getMedStatus(from:)(v12, v13, v14, v15, v16, v17);
  sub_37034();
  sub_DEEEC();
  if ((v9 & 1) != 0)
  {
    sub_DA680( *(void **)(v0 + 27632),  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
    if (v18 && (id v19 = sub_DEB8C(v18), sub_249D4(), v19))
    {
      sub_DEED0();
      unint64_t v62 = v20;
    }

    else
    {
      unint64_t v62 = 0LL;
    }
  }

  else
  {
    unint64_t v62 = *(void *)(v0 + 27416);
  }

  sub_DEC80(23208LL);
  sub_DE12C(*(void *)(v0 + 27856));
  uint64_t v21 = *(void *)(v0 + 26184);
  sub_DEC0C();
  uint64_t v22 = *(void *)(v0 + 25984);
  sub_DEED8();
  uint64_t v63 = *(void *)(v0 + 25976);
  if (v24) {
    uint64_t v25 = v24;
  }
  else {
    uint64_t v25 = 0xE500000000000000LL;
  }
  sub_DABC0(v23, v21, &qword_189CF8);
  PhoneRingsSnippet.body.getter(v26);
  uint64_t v27 = sub_11B244();
  uint64_t v28 = sub_DEBE8();
  sub_98DE0(v28, v29, v30);
  _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v22, 0LL, 1LL, v11);
  char v31 = sub_DDDBC();
  sub_DE1F4( v31,  v32,  v33,  v34,  v35,  v36,  v37,  v38,  0LL,  0LL,  v21,  v39,  v54,  v55,  HIBYTE(v55),  v56,  v57,  v58,  v59,  v60,  v25,  v22,  v61,  v62);
  sub_36878(v63 + 296);
  uint64_t v40 = sub_DE0E4();
  *(void *)(v0 + 23312) = v40;
  sub_36F4C((unint64_t *)&qword_18A468, v41, type metadata accessor for WellnessSnippets);
  *(void *)(v0 + 23320) = v42;
  uint64_t v43 = sub_72E20();
  sub_DE718(v27, v44, type metadata accessor for SpecificMedCompletedLogModel);
  sub_DE18C((uint64_t)v43, v40);
  uint64_t v45 = sub_494C(&qword_18A460);
  uint64_t v46 = sub_20308(v45, 40LL);
  uint64_t v47 = sub_373F8(v46);
  sub_DE284(v47, v48, v49);
  *(void *)(v0 + 27864) = v50;
  id v51 = v64;
  uint64_t v52 = (void *)sub_36B20();
  *(void *)(v0 + 27872) = v52;
  *uint64_t v52 = v0;
  v52[1] = sub_C9394;
  sub_DDD84();
  return sub_DDF78();
}

uint64_t sub_C9394()
{
  return sub_D954();
}

uint64_t sub_C93E0()
{
  uint64_t v1 = (void *)v0[3454];
  uint64_t v2 = (void *)v0[3451];
  sub_DE98C();
  sub_DE494(v0[3285]);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v3);
  sub_369CC();
  sub_36878((uint64_t)(v0 + 2901));
  uint64_t v4 = sub_20308((uint64_t)&unk_180340, 56LL);
  uint64_t v5 = sub_DDC44(v4);
  v0[3245] = sub_DE874((uint64_t)v5, (uint64_t)&unk_18EA88);
  sub_DE2C8();

  sub_DE48C();
  uint64_t v6 = sub_DEA0C();
  sub_DED24(v6, type metadata accessor for SpecificMedCompletedLogModel);
  sub_DE1AC(v7, &qword_189CF8);
  uint64_t v8 = sub_DDB08();
  sub_DDC20(v8, type metadata accessor for SnippetHeaderModel);
  sub_DE3DC(v9, &qword_189D00);
  sub_DDA68(v10, &qword_18B168);
  sub_3652C();
  sub_DC288();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v11 = sub_A78C();
  uint64_t v19 = sub_A888(v11, v12, v13, v14, v15, v16, v17, v18, v509, v571, v633);
  uint64_t v27 = sub_A854(v19, v20, v21, v22, v23, v24, v25, v26, v510, v572, v634, v695);
  uint64_t v35 = sub_A84C(v27, v28, v29, v30, v31, v32, v33, v34, v511, v573, v635, v696, v756);
  uint64_t v43 = sub_A844(v35, v36, v37, v38, v39, v40, v41, v42, v512, v574, v636, v697, v757, v816);
  uint64_t v51 = sub_A83C(v43, v44, v45, v46, v47, v48, v49, v50, v513, v575, v637, v698, v758, v817, v875);
  uint64_t v59 = sub_A95C(v51, v52, v53, v54, v55, v56, v57, v58, v514, v576, v638, v699, v759, v818, v876, v933);
  uint64_t v67 = sub_A954(v59, v60, v61, v62, v63, v64, v65, v66, v515, v577, v639, v700, v760, v819, v877, v934, v990);
  uint64_t v75 = sub_A938(v67, v68, v69, v70, v71, v72, v73, v74, v516, v578, v640, v701, v761, v820, v878, v935, v991, v1046);
  uint64_t v83 = sub_A930( v75,  v76,  v77,  v78,  v79,  v80,  v81,  v82,  v517,  v579,  v641,  v702,  v762,  v821,  v879,  v936,  v992,  v1047,  v1101);
  uint64_t v91 = sub_A928( v83,  v84,  v85,  v86,  v87,  v88,  v89,  v90,  v518,  v580,  v642,  v703,  v763,  v822,  v880,  v937,  v993,  v1048,  v1102,  v1155);
  uint64_t v99 = sub_A920( v91,  v92,  v93,  v94,  v95,  v96,  v97,  v98,  v519,  v581,  v643,  v704,  v764,  v823,  v881,  v938,  v994,  v1049,  v1103,  v1156,  v1208);
  uint64_t v107 = sub_36374( v99,  v100,  v101,  v102,  v103,  v104,  v105,  v106,  v520,  v582,  v644,  v705,  v765,  v824,  v882,  v939,  v995,  v1050,  v1104,  v1157,  v1209,  v1260);
  uint64_t v115 = sub_3636C( v107,  v108,  v109,  v110,  v111,  v112,  v113,  v114,  v521,  v583,  v645,  v706,  v766,  v825,  v883,  v940,  v996,  v1051,  v1105,  v1158,  v1210,  v1261,  v1311);
  uint64_t v123 = sub_36364( v115,  v116,  v117,  v118,  v119,  v120,  v121,  v122,  v522,  v584,  v646,  v707,  v767,  v826,  v884,  v941,  v997,  v1052,  v1106,  v1159,  v1211,  v1262,  v1312,  v1361);
  uint64_t v131 = sub_363F0( v123,  v124,  v125,  v126,  v127,  v128,  v129,  v130,  v523,  v585,  v647,  v708,  v768,  v827,  v885,  v942,  v998,  v1053,  v1107,  v1160,  v1212,  v1263,  v1313,  v1362,  v1410);
  uint64_t v139 = sub_36430( v131,  v132,  v133,  v134,  v135,  v136,  v137,  v138,  v524,  v586,  v648,  v709,  v769,  v828,  v886,  v943,  v999,  v1054,  v1108,  v1161,  v1213,  v1264,  v1314,  v1363,  v1411,  v1458);
  uint64_t v147 = sub_36428( v139,  v140,  v141,  v142,  v143,  v144,  v145,  v146,  v525,  v587,  v649,  v710,  v770,  v829,  v887,  v944,  v1000,  v1055,  v1109,  v1162,  v1214,  v1265,  v1315,  v1364,  v1412,  v1459,  v1505);
  uint64_t v155 = sub_36478( v147,  v148,  v149,  v150,  v151,  v152,  v153,  v154,  v526,  v588,  v650,  v711,  v771,  v830,  v888,  v945,  v1001,  v1056,  v1110,  v1163,  v1215,  v1266,  v1316,  v1365,  v1413,  v1460,  v1506,  v1551);
  uint64_t v163 = sub_36524( v155,  v156,  v157,  v158,  v159,  v160,  v161,  v162,  v527,  v589,  v651,  v712,  v772,  v831,  v889,  v946,  v1002,  v1057,  v1111,  v1164,  v1216,  v1267,  v1317,  v1366,  v1414,  v1461,  v1507,  v1552,  v1596);
  uint64_t v171 = sub_3651C( v163,  v164,  v165,  v166,  v167,  v168,  v169,  v170,  v528,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112,  v1165,  v1217,  v1268,  v1318,  v1367,  v1415,  v1462,  v1508,  v1553,  v1597,  v1640);
  uint64_t v179 = sub_36514( v171,  v172,  v173,  v174,  v175,  v176,  v177,  v178,  v529,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166,  v1218,  v1269,  v1319,  v1368,  v1416,  v1463,  v1509,  v1554,  v1598,  v1641,  v1683);
  uint64_t v187 = sub_3650C( v179,  v180,  v181,  v182,  v183,  v184,  v185,  v186,  v530,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219,  v1270,  v1320,  v1369,  v1417,  v1464,  v1510,  v1555,  v1599,  v1642,  v1684,  v1725);
  uint64_t v195 = sub_36504( v187,  v188,  v189,  v190,  v191,  v192,  v193,  v194,  v531,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271,  v1321,  v1370,  v1418,  v1465,  v1511,  v1556,  v1600,  v1643,  v1685,  v1726,  v1766);
  uint64_t v203 = sub_364FC( v195,  v196,  v197,  v198,  v199,  v200,  v201,  v202,  v532,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322,  v1371,  v1419,  v1466,  v1512,  v1557,  v1601,  v1644,  v1686,  v1727,  v1767,  v1806);
  uint64_t v211 = sub_364F4( v203,  v204,  v205,  v206,  v207,  v208,  v209,  v210,  v533,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372,  v1420,  v1467,  v1513,  v1558,  v1602,  v1645,  v1687,  v1728,  v1768,  v1807,  v1845);
  uint64_t v219 = sub_364EC( v211,  v212,  v213,  v214,  v215,  v216,  v217,  v218,  v534,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421,  v1468,  v1514,  v1559,  v1603,  v1646,  v1688,  v1729,  v1769,  v1808,  v1846,  v1883);
  uint64_t v227 = sub_364E4( v219,  v220,  v221,  v222,  v223,  v224,  v225,  v226,  v535,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469,  v1515,  v1560,  v1604,  v1647,  v1689,  v1730,  v1770,  v1809,  v1847,  v1884,  v1920);
  uint64_t v235 = sub_364DC( v227,  v228,  v229,  v230,  v231,  v232,  v233,  v234,  v536,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516,  v1561,  v1605,  v1648,  v1690,  v1731,  v1771,  v1810,  v1848,  v1885,  v1921,  v1956);
  uint64_t v243 = sub_364D4( v235,  v236,  v237,  v238,  v239,  v240,  v241,  v242,  v537,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562,  v1606,  v1649,  v1691,  v1732,  v1772,  v1811,  v1849,  v1886,  v1922,  v1957,  v1991);
  uint64_t v251 = sub_366F8( v243,  v244,  v245,  v246,  v247,  v248,  v249,  v250,  v538,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607,  v1650,  v1692,  v1733,  v1773,  v1812,  v1850,  v1887,  v1923,  v1958,  v1992,  v2025);
  uint64_t v259 = sub_366F0( v251,  v252,  v253,  v254,  v255,  v256,  v257,  v258,  v539,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651,  v1693,  v1734,  v1774,  v1813,  v1851,  v1888,  v1924,  v1959,  v1993,  v2026,  v2058);
  uint64_t v267 = sub_36B90( v259,  v260,  v261,  v262,  v263,  v264,  v265,  v266,  v540,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694,  v1735,  v1775,  v1814,  v1852,  v1889,  v1925,  v1960,  v1994,  v2027,  v2059,  v2090);
  uint64_t v275 = sub_36EF4( v267,  v268,  v269,  v270,  v271,  v272,  v273,  v274,  v541,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736,  v1776,  v1815,  v1853,  v1890,  v1926,  v1961,  v1995,  v2028,  v2060,  v2091,  v2121);
  uint64_t v283 = sub_36EEC( v275,  v276,  v277,  v278,  v279,  v280,  v281,  v282,  v542,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777,  v1816,  v1854,  v1891,  v1927,  v1962,  v1996,  v2029,  v2061,  v2092,  v2122,  v2151);
  uint64_t v291 = sub_DD7E4( v283,  v284,  v285,  v286,  v287,  v288,  v289,  v290,  v543,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817,  v1855,  v1892,  v1928,  v1963,  v1997,  v2030,  v2062,  v2093,  v2123,  v2152,  v2180);
  uint64_t v299 = sub_DD7DC( v291,  v292,  v293,  v294,  v295,  v296,  v297,  v298,  v544,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856,  v1893,  v1929,  v1964,  v1998,  v2031,  v2063,  v2094,  v2124,  v2153,  v2181,  v2208);
  uint64_t v307 = sub_DD7D4( v299,  v300,  v301,  v302,  v303,  v304,  v305,  v306,  v545,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894,  v1930,  v1965,  v1999,  v2032,  v2064,  v2095,  v2125,  v2154,  v2182,  v2209,  v2235);
  uint64_t v315 = sub_DD7CC( v307,  v308,  v309,  v310,  v311,  v312,  v313,  v314,  v546,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931,  v1966,  v2000,  v2033,  v2065,  v2096,  v2126,  v2155,  v2183,  v2210,  v2236,  v2261);
  uint64_t v323 = sub_DD7C4( v315,  v316,  v317,  v318,  v319,  v320,  v321,  v322,  v547,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967,  v2001,  v2034,  v2066,  v2097,  v2127,  v2156,  v2184,  v2211,  v2237,  v2262,  v2286);
  uint64_t v331 = sub_DD7BC( v323,  v324,  v325,  v326,  v327,  v328,  v329,  v330,  v548,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002,  v2035,  v2067,  v2098,  v2128,  v2157,  v2185,  v2212,  v2238,  v2263,  v2287,
           v2310);
  uint64_t v339 = sub_DD7B4( v331,  v332,  v333,  v334,  v335,  v336,  v337,  v338,  v549,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036,  v2068,  v2099,  v2129,  v2158,  v2186,  v2213,  v2239,  v2264,  v2288,
           v2311,
           v2333);
  uint64_t v347 = sub_DD7AC( v339,  v340,  v341,  v342,  v343,  v344,  v345,  v346,  v550,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069,  v2100,  v2130,  v2159,  v2187,  v2214,  v2240,  v2265,  v2289,
           v2312,
           v2334,
           v2355);
  uint64_t v355 = sub_DD7A4( v347,  v348,  v349,  v350,  v351,  v352,  v353,  v354,  v551,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101,  v2131,  v2160,  v2188,  v2215,  v2241,  v2266,  v2290,
           v2313,
           v2335,
           v2356,
           v2376);
  uint64_t v363 = sub_DD79C( v355,  v356,  v357,  v358,  v359,  v360,  v361,  v362,  v552,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132,  v2161,  v2189,  v2216,  v2242,  v2267,  v2291,
           v2314,
           v2336,
           v2357,
           v2377,
           v2396);
  uint64_t v371 = sub_DD794( v363,  v364,  v365,  v366,  v367,  v368,  v369,  v370,  v553,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162,  v2190,  v2217,  v2243,  v2268,  v2292,
           v2315,
           v2337,
           v2358,
           v2378,
           v2397,
           v2415);
  uint64_t v379 = sub_DD78C( v371,  v372,  v373,  v374,  v375,  v376,  v377,  v378,  v554,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191,  v2218,  v2244,  v2269,  v2293,
           v2316,
           v2338,
           v2359,
           v2379,
           v2398,
           v2416,
           v2433);
  uint64_t v387 = sub_DD784( v379,  v380,  v381,  v382,  v383,  v384,  v385,  v386,  v555,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219,  v2245,  v2270,  v2294,
           v2317,
           v2339,
           v2360,
           v2380,
           v2399,
           v2417,
           v2434,
           v2450);
  uint64_t v395 = sub_DD77C( v387,  v388,  v389,  v390,  v391,  v392,  v393,  v394,  v556,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246,  v2271,  v2295,
           v2318,
           v2340,
           v2361,
           v2381,
           v2400,
           v2418,
           v2435,
           v2451,
           v2466);
  uint64_t v403 = sub_DD774( v395,  v396,  v397,  v398,  v399,  v400,  v401,  v402,  v557,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272,  v2296,
           v2319,
           v2341,
           v2362,
           v2382,
           v2401,
           v2419,
           v2436,
           v2452,
           v2467,
           v2481);
  uint64_t v411 = sub_DD76C( v403,  v404,  v405,  v406,  v407,  v408,  v409,  v410,  v558,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297,
           v2320,
           v2342,
           v2363,
           v2383,
           v2402,
           v2420,
           v2437,
           v2453,
           v2468,
           v2482,
           v2495);
  uint64_t v419 = sub_DD764( v411,  v412,  v413,  v414,  v415,  v416,  v417,  v418,  v559,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321,
           v2343,
           v2364,
           v2384,
           v2403,
           v2421,
           v2438,
           v2454,
           v2469,
           v2483,
           v2496,
           v2508);
  uint64_t v427 = sub_DD75C( v419,  v420,  v421,  v422,  v423,  v424,  v425,  v426,  v560,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344,
           v2365,
           v2385,
           v2404,
           v2422,
           v2439,
           v2455,
           v2470,
           v2484,
           v2497,
           v2509,
           v2520);
  uint64_t v435 = sub_DD754( v427,  v428,  v429,  v430,  v431,  v432,  v433,  v434,  v561,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366,
           v2386,
           v2405,
           v2423,
           v2440,
           v2456,
           v2471,
           v2485,
           v2498,
           v2510,
           v2521,
           v2531);
  uint64_t v443 = sub_DD74C( v435,  v436,  v437,  v438,  v439,  v440,  v441,  v442,  v562,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387,
           v2406,
           v2424,
           v2441,
           v2457,
           v2472,
           v2486,
           v2499,
           v2511,
           v2522,
           v2532);
  uint64_t v451 = sub_DD744( v443,  v444,  v445,  v446,  v447,  v448,  v449,  v450,  v563,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407,
           v2425,
           v2442,
           v2458,
           v2473,
           v2487,
           v2500,
           v2512,
           v2523,
           v2533);
  uint64_t v459 = sub_DD73C( v451,  v452,  v453,  v454,  v455,  v456,  v457,  v458,  v564,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426,
           v2443,
           v2459,
           v2474,
           v2488,
           v2501,
           v2513,
           v2524,
           v2534);
  uint64_t v467 = sub_DD734( v459,  v460,  v461,  v462,  v463,  v464,  v465,  v466,  v565,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444,
           v2460,
           v2475,
           v2489,
           v2502,
           v2514,
           v2525,
           v2535);
  uint64_t v475 = sub_DD72C( v467,  v468,  v469,  v470,  v471,  v472,  v473,  v474,  v566,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461,
           v2476,
           v2490,
           v2503,
           v2515,
           v2526,
           v2536);
  uint64_t v483 = sub_DD724( v475,  v476,  v477,  v478,  v479,  v480,  v481,  v482,  v567,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462,
           v2477,
           v2491,
           v2504,
           v2516,
           v2527,
           v2537);
  uint64_t v491 = sub_DD71C( v483,  v484,  v485,  v486,  v487,  v488,  v489,  v490,  v568,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463,
           v2478,
           v2492,
           v2505,
           v2517,
           v2528,
           v2538);
  uint64_t v499 = sub_DD714( v491,  v492,  v493,  v494,  v495,  v496,  v497,  v498,  v569,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479,
           v2493,
           v2506,
           v2518,
           v2529,
           v2539);
  sub_DD70C( v499,  v500,  v501,  v502,  v503,  v504,  v505,  v506,  v570,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
    v2332,
    v2354,
    v2375,
    v2395,
    v2414,
    v2432,
    v2449,
    v2465,
    v2480,
    v2494,
    v2507,
    v2519,
    v2530,
    v2540);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  uint64_t v507 = (uint64_t (*)(void))sub_DE01C();
  return sub_36148(v507);
}

uint64_t sub_C9784()
{
  os_log_type_t v6 = sub_AB70();
  if (sub_46614(v6))
  {
    uint64_t v7 = (_WORD *)sub_3635C();
    sub_36908(v7);
    sub_DD494();
    sub_DA1C();
    sub_232EC( &dword_0,  v0,  v2,  "Couldn't create specificMedicationAllMedsLoggedAlready_Dialog, returning GenericErrorFlow",  v3);
    sub_37128();
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  sub_3747C();
  sub_DE55C();
  uint64_t v8 = v1[3277];
  sub_36590((_OWORD *)(v1[3247] + 64LL));
  sub_DE348(v1 + 216);
  sub_A178();
  sub_DDE00();

  sub_DE304();
  uint64_t v9 = sub_89E0C(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  sub_992F0(v9, type metadata accessor for SnippetHeaderModel);
  sub_DDA68(v10, &qword_189D00);
  sub_DDBDC(v11, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v12 = sub_A78C();
  uint64_t v20 = sub_AAD8(v12, v13, v14, v15, v16, v17, v18, v19, v518, v581);
  uint64_t v28 = sub_A888(v20, v21, v22, v23, v24, v25, v26, v27, v519, v582, v644);
  uint64_t v36 = sub_A854(v28, v29, v30, v31, v32, v33, v34, v35, v520, v583, v645, v706);
  uint64_t v44 = sub_A84C(v36, v37, v38, v39, v40, v41, v42, v43, v521, v584, v646, v707, v767);
  uint64_t v52 = sub_A844(v44, v45, v46, v47, v48, v49, v50, v51, v522, v585, v647, v708, v768, v827);
  uint64_t v60 = sub_A83C(v52, v53, v54, v55, v56, v57, v58, v59, v523, v586, v648, v709, v769, v828, v886);
  uint64_t v68 = sub_A95C(v60, v61, v62, v63, v64, v65, v66, v67, v524, v587, v649, v710, v770, v829, v887, v944);
  uint64_t v76 = sub_A954(v68, v69, v70, v71, v72, v73, v74, v75, v525, v588, v650, v711, v771, v830, v888, v945, v1001);
  uint64_t v84 = sub_A938(v76, v77, v78, v79, v80, v81, v82, v83, v526, v589, v651, v712, v772, v831, v889, v946, v1002, v1057);
  uint64_t v92 = sub_A930( v84,  v85,  v86,  v87,  v88,  v89,  v90,  v91,  v527,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112);
  uint64_t v100 = sub_A928( v92,  v93,  v94,  v95,  v96,  v97,  v98,  v99,  v528,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166);
  uint64_t v108 = sub_A920( v100,  v101,  v102,  v103,  v104,  v105,  v106,  v107,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219);
  uint64_t v116 = sub_36374( v108,  v109,  v110,  v111,  v112,  v113,  v114,  v115,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271);
  uint64_t v124 = sub_3636C( v116,  v117,  v118,  v119,  v120,  v121,  v122,  v123,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322);
  uint64_t v132 = sub_36364( v124,  v125,  v126,  v127,  v128,  v129,  v130,  v131,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372);
  uint64_t v140 = sub_363F0( v132,  v133,  v134,  v135,  v136,  v137,  v138,  v139,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421);
  uint64_t v148 = sub_36430( v140,  v141,  v142,  v143,  v144,  v145,  v146,  v147,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469);
  uint64_t v156 = sub_36428( v148,  v149,  v150,  v151,  v152,  v153,  v154,  v155,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516);
  uint64_t v164 = sub_36478( v156,  v157,  v158,  v159,  v160,  v161,  v162,  v163,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562);
  uint64_t v172 = sub_36524( v164,  v165,  v166,  v167,  v168,  v169,  v170,  v171,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607);
  uint64_t v180 = sub_3651C( v172,  v173,  v174,  v175,  v176,  v177,  v178,  v179,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651);
  uint64_t v188 = sub_36514( v180,  v181,  v182,  v183,  v184,  v185,  v186,  v187,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694);
  uint64_t v196 = sub_3650C( v188,  v189,  v190,  v191,  v192,  v193,  v194,  v195,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736);
  uint64_t v204 = sub_36504( v196,  v197,  v198,  v199,  v200,  v201,  v202,  v203,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777);
  uint64_t v212 = sub_364FC( v204,  v205,  v206,  v207,  v208,  v209,  v210,  v211,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817);
  uint64_t v220 = sub_364F4( v212,  v213,  v214,  v215,  v216,  v217,  v218,  v219,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856);
  uint64_t v228 = sub_364EC( v220,  v221,  v222,  v223,  v224,  v225,  v226,  v227,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894);
  uint64_t v236 = sub_364E4( v228,  v229,  v230,  v231,  v232,  v233,  v234,  v235,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931);
  uint64_t v244 = sub_364DC( v236,  v237,  v238,  v239,  v240,  v241,  v242,  v243,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967);
  uint64_t v252 = sub_364D4( v244,  v245,  v246,  v247,  v248,  v249,  v250,  v251,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002);
  uint64_t v260 = sub_366F8( v252,  v253,  v254,  v255,  v256,  v257,  v258,  v259,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036);
  uint64_t v268 = sub_366F0( v260,  v261,  v262,  v263,  v264,  v265,  v266,  v267,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069);
  uint64_t v276 = sub_36B90( v268,  v269,  v270,  v271,  v272,  v273,  v274,  v275,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101);
  uint64_t v284 = sub_36EF4( v276,  v277,  v278,  v279,  v280,  v281,  v282,  v283,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132);
  uint64_t v292 = sub_36EEC( v284,  v285,  v286,  v287,  v288,  v289,  v290,  v291,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162);
  uint64_t v300 = sub_DD7E4( v292,  v293,  v294,  v295,  v296,  v297,  v298,  v299,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191);
  uint64_t v308 = sub_DD7DC( v300,  v301,  v302,  v303,  v304,  v305,  v306,  v307,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219);
  uint64_t v316 = sub_DD7D4( v308,  v309,  v310,  v311,  v312,  v313,  v314,  v315,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246);
  uint64_t v324 = sub_DD7CC( v316,  v317,  v318,  v319,  v320,  v321,  v322,  v323,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272);
  uint64_t v332 = sub_DD7C4( v324,  v325,  v326,  v327,  v328,  v329,  v330,  v331,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297);
  uint64_t v340 = sub_DD7BC( v332,  v333,  v334,  v335,  v336,  v337,  v338,  v339,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321);
  uint64_t v348 = sub_DD7B4( v340,  v341,  v342,  v343,  v344,  v345,  v346,  v347,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344);
  uint64_t v356 = sub_DD7AC( v348,  v349,  v350,  v351,  v352,  v353,  v354,  v355,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366);
  uint64_t v364 = sub_DD7A4( v356,  v357,  v358,  v359,  v360,  v361,  v362,  v363,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387);
  uint64_t v372 = sub_DD79C( v364,  v365,  v366,  v367,  v368,  v369,  v370,  v371,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407);
  uint64_t v380 = sub_DD794( v372,  v373,  v374,  v375,  v376,  v377,  v378,  v379,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426);
  uint64_t v388 = sub_DD78C( v380,  v381,  v382,  v383,  v384,  v385,  v386,  v387,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444);
  uint64_t v396 = sub_DD784( v388,  v389,  v390,  v391,  v392,  v393,  v394,  v395,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461);
  uint64_t v404 = sub_DD77C( v396,  v397,  v398,  v399,  v400,  v401,  v402,  v403,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462,
           v2477);
  uint64_t v412 = sub_DD774( v404,  v405,  v406,  v407,  v408,  v409,  v410,  v411,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463,
           v2478,
           v2492);
  uint64_t v420 = sub_DD76C( v412,  v413,  v414,  v415,  v416,  v417,  v418,  v419,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479,
           v2493,
           v2506);
  uint64_t v428 = sub_DD764( v420,  v421,  v422,  v423,  v424,  v425,  v426,  v427,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494,
           v2507,
           v2519);
  uint64_t v436 = sub_DD75C( v428,  v429,  v430,  v431,  v432,  v433,  v434,  v435,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508,
           v2520,
           v2531);
  uint64_t v444 = sub_DD754( v436,  v437,  v438,  v439,  v440,  v441,  v442,  v443,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521,
           v2532,
           v2542);
  uint64_t v452 = sub_DD74C( v444,  v445,  v446,  v447,  v448,  v449,  v450,  v451,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533,
           v2543);
  uint64_t v460 = sub_DD744( v452,  v453,  v454,  v455,  v456,  v457,  v458,  v459,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v468 = sub_DD73C( v460,  v461,  v462,  v463,  v464,  v465,  v466,  v467,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v476 = sub_DD734( v468,  v469,  v470,  v471,  v472,  v473,  v474,  v475,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v484 = sub_DD72C( v476,  v477,  v478,  v479,  v480,  v481,  v482,  v483,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v492 = sub_DD724( v484,  v485,  v486,  v487,  v488,  v489,  v490,  v491,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v500 = sub_DD71C( v492,  v493,  v494,  v495,  v496,  v497,  v498,  v499,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v508 = sub_DD714( v500,  v501,  v502,  v503,  v504,  v505,  v506,  v507,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  sub_DD70C( v508,  v509,  v510,  v511,  v512,  v513,  v514,  v515,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
    v2343,
    v2365,
    v2386,
    v2406,
    v2425,
    v2443,
    v2460,
    v2476,
    v2491,
    v2505,
    v2518,
    v2530,
    v2541,
    v2551);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v516 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v516);
}

uint64_t sub_C9B44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 27912);
  *(void *)(v3 + 27920) = a1;
  *(void *)(v3 + 27928) = a2;
  sub_36900(v4);
  sub_A964();
  return sub_A5D0();
}

uint64_t sub_C9B94()
{
  uint64_t v1 = *(void *)(v0 + 27928);
  uint64_t v2 = *(void *)(v0 + 27920);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v0 + 18808));
  if (v2) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = v1 == 0xE000000000000000LL;
  }
  if (v3 || (sub_58F94(*(void *)(v0 + 27920), *(void *)(v0 + 27928), 0LL, 0xE000000000000000LL) & 1) != 0)
  {
    uint64_t v4 = *(void **)(v0 + 27464);
    uint64_t v5 = *(void *)(v0 + 27416);
    os_log_type_t v6 = *(void (**)(uint64_t))(v0 + 27384);
    uint64_t v7 = *(void *)(v0 + 27376);
    sub_DEDC8(*(void *)(v0 + 27928));
    swift_bridgeObjectRelease();
    sub_DE350();
    swift_bridgeObjectRelease();
    sub_DE25C();
    swift_bridgeObjectRelease();
    sub_2A184();
    sub_A5DC(v7, v0 + 24224);
    uint64_t v8 = sub_DEBCC();
    v6(v8);
    sub_AB5C();
    os_log_type_t v9 = sub_AB70();
    BOOL v10 = sub_A988(v9);
    uint64_t v11 = *(void (**)(uint64_t))(v0 + 27888);
    if (v10)
    {
      uint64_t v12 = (uint8_t *)sub_3635C();
      uint64_t v13 = sub_DE0A4(v12);
      uint64_t v4 = _swiftEmptyArrayStorage;
      sub_DDA60((uint64_t)v13, (uint64_t)&v2631, (uint64_t)&v2632, (uint64_t)&v2629);
      sub_DA1C();
      sub_232EC( &dword_0,  (os_log_s *)(v0 + 24224),  (os_log_type_t)v5,  "Couldn't get a displayName for this medID, returning GenericErrorFlow",  v12);
      sub_37128();

      uint64_t v14 = sub_373E0();
    }

    else
    {
      sub_DDA50();
      swift_bridgeObjectRelease();
      uint64_t v14 = sub_372A0();
    }

    v11(v14);
    uint64_t v15 = *(void **)(v0 + 27896);
    uint64_t v16 = (_OWORD *)sub_DEAB0();
    sub_DE7C8(v16);
    sub_5A9B0((void *)(v0 + 4928), (void *)(v0 + 5088));
    sub_A178();
    static ExecuteResponse.complete<A>(next:)(v0 + 5088);
    sub_1EBF4();
    sub_36C34();
    sub_369F4();

    uint64_t v17 = sub_36784();
    sub_99450((uint64_t)v17, type metadata accessor for SnippetHeaderModel);
    sub_279E0((uint64_t)v4, &qword_189D00);
    sub_DE3DC(v18, &qword_18B168);
    sub_DCBA8();
    sub_A8F4();
    sub_A85C();
    sub_A864();
    sub_A910();
    sub_A8EC();
    sub_A760();
    sub_A7C8();
    sub_A67C();
    uint64_t v19 = sub_A78C();
    uint64_t v27 = sub_AAD8(v19, v20, v21, v22, v23, v24, v25, v26, v592, v655);
    uint64_t v35 = sub_A888(v27, v28, v29, v30, v31, v32, v33, v34, v593, v656, v718);
    uint64_t v43 = sub_A854(v35, v36, v37, v38, v39, v40, v41, v42, v594, v657, v719, v780);
    uint64_t v51 = sub_A84C(v43, v44, v45, v46, v47, v48, v49, v50, v595, v658, v720, v781, v841);
    uint64_t v59 = sub_A844(v51, v52, v53, v54, v55, v56, v57, v58, v596, v659, v721, v782, v842, v901);
    uint64_t v67 = sub_A83C(v59, v60, v61, v62, v63, v64, v65, v66, v597, v660, v722, v783, v843, v902, v960);
    uint64_t v75 = sub_A95C(v67, v68, v69, v70, v71, v72, v73, v74, v598, v661, v723, v784, v844, v903, v961, v1018);
    uint64_t v83 = sub_A954(v75, v76, v77, v78, v79, v80, v81, v82, v599, v662, v724, v785, v845, v904, v962, v1019, v1075);
    uint64_t v91 = sub_A938( v83,  v84,  v85,  v86,  v87,  v88,  v89,  v90,  v600,  v663,  v725,  v786,  v846,  v905,  v963,  v1020,  v1076,  v1131);
    uint64_t v99 = sub_A930( v91,  v92,  v93,  v94,  v95,  v96,  v97,  v98,  v601,  v664,  v726,  v787,  v847,  v906,  v964,  v1021,  v1077,  v1132,  v1186);
    uint64_t v107 = sub_A928( v99,  v100,  v101,  v102,  v103,  v104,  v105,  v106,  v602,  v665,  v727,  v788,  v848,  v907,  v965,  v1022,  v1078,  v1133,  v1187,  v1240);
    uint64_t v115 = sub_A920( v107,  v108,  v109,  v110,  v111,  v112,  v113,  v114,  v603,  v666,  v728,  v789,  v849,  v908,  v966,  v1023,  v1079,  v1134,  v1188,  v1241,  v1293);
    uint64_t v123 = sub_36374( v115,  v116,  v117,  v118,  v119,  v120,  v121,  v122,  v604,  v667,  v729,  v790,  v850,  v909,  v967,  v1024,  v1080,  v1135,  v1189,  v1242,  v1294,  v1345);
    uint64_t v131 = sub_3636C( v123,  v124,  v125,  v126,  v127,  v128,  v129,  v130,  v605,  v668,  v730,  v791,  v851,  v910,  v968,  v1025,  v1081,  v1136,  v1190,  v1243,  v1295,  v1346,  v1396);
    uint64_t v139 = sub_36364( v131,  v132,  v133,  v134,  v135,  v136,  v137,  v138,  v606,  v669,  v731,  v792,  v852,  v911,  v969,  v1026,  v1082,  v1137,  v1191,  v1244,  v1296,  v1347,  v1397,  v1446);
    uint64_t v147 = sub_363F0( v139,  v140,  v141,  v142,  v143,  v144,  v145,  v146,  v607,  v670,  v732,  v793,  v853,  v912,  v970,  v1027,  v1083,  v1138,  v1192,  v1245,  v1297,  v1348,  v1398,  v1447,  v1495);
    uint64_t v155 = sub_36430( v147,  v148,  v149,  v150,  v151,  v152,  v153,  v154,  v608,  v671,  v733,  v794,  v854,  v913,  v971,  v1028,  v1084,  v1139,  v1193,  v1246,  v1298,  v1349,  v1399,  v1448,  v1496,  v1543);
    uint64_t v163 = sub_36428( v155,  v156,  v157,  v158,  v159,  v160,  v161,  v162,  v609,  v672,  v734,  v795,  v855,  v914,  v972,  v1029,  v1085,  v1140,  v1194,  v1247,  v1299,  v1350,  v1400,  v1449,  v1497,  v1544,  v1590);
    uint64_t v171 = sub_36478( v163,  v164,  v165,  v166,  v167,  v168,  v169,  v170,  v610,  v673,  v735,  v796,  v856,  v915,  v973,  v1030,  v1086,  v1141,  v1195,  v1248,  v1300,  v1351,  v1401,  v1450,  v1498,  v1545,  v1591,  v1636);
    uint64_t v179 = sub_36524( v171,  v172,  v173,  v174,  v175,  v176,  v177,  v178,  v611,  v674,  v736,  v797,  v857,  v916,  v974,  v1031,  v1087,  v1142,  v1196,  v1249,  v1301,  v1352,  v1402,  v1451,  v1499,  v1546,  v1592,  v1637,  v1681);
    uint64_t v187 = sub_3651C( v179,  v180,  v181,  v182,  v183,  v184,  v185,  v186,  v612,  v675,  v737,  v798,  v858,  v917,  v975,  v1032,  v1088,  v1143,  v1197,  v1250,  v1302,  v1353,  v1403,  v1452,  v1500,  v1547,  v1593,  v1638,  v1682,  v1725);
    uint64_t v195 = sub_36514( v187,  v188,  v189,  v190,  v191,  v192,  v193,  v194,  v613,  v676,  v738,  v799,  v859,  v918,  v976,  v1033,  v1089,  v1144,  v1198,  v1251,  v1303,  v1354,  v1404,  v1453,  v1501,  v1548,  v1594,  v1639,  v1683,  v1726,  v1768);
    uint64_t v203 = sub_3650C( v195,  v196,  v197,  v198,  v199,  v200,  v201,  v202,  v614,  v677,  v739,  v800,  v860,  v919,  v977,  v1034,  v1090,  v1145,  v1199,  v1252,  v1304,  v1355,  v1405,  v1454,  v1502,  v1549,  v1595,  v1640,  v1684,  v1727,  v1769,  v1810);
    uint64_t v211 = sub_36504( v203,  v204,  v205,  v206,  v207,  v208,  v209,  v210,  v615,  v678,  v740,  v801,  v861,  v920,  v978,  v1035,  v1091,  v1146,  v1200,  v1253,  v1305,  v1356,  v1406,  v1455,  v1503,  v1550,  v1596,  v1641,  v1685,  v1728,  v1770,  v1811,  v1851);
    uint64_t v219 = sub_364FC( v211,  v212,  v213,  v214,  v215,  v216,  v217,  v218,  v616,  v679,  v741,  v802,  v862,  v921,  v979,  v1036,  v1092,  v1147,  v1201,  v1254,  v1306,  v1357,  v1407,  v1456,  v1504,  v1551,  v1597,  v1642,  v1686,  v1729,  v1771,  v1812,  v1852,  v1891);
    uint64_t v227 = sub_364F4( v219,  v220,  v221,  v222,  v223,  v224,  v225,  v226,  v617,  v680,  v742,  v803,  v863,  v922,  v980,  v1037,  v1093,  v1148,  v1202,  v1255,  v1307,  v1358,  v1408,  v1457,  v1505,  v1552,  v1598,  v1643,  v1687,  v1730,  v1772,  v1813,  v1853,  v1892,  v1930);
    uint64_t v235 = sub_364EC( v227,  v228,  v229,  v230,  v231,  v232,  v233,  v234,  v618,  v681,  v743,  v804,  v864,  v923,  v981,  v1038,  v1094,  v1149,  v1203,  v1256,  v1308,  v1359,  v1409,  v1458,  v1506,  v1553,  v1599,  v1644,  v1688,  v1731,  v1773,  v1814,  v1854,  v1893,  v1931,  v1968);
    uint64_t v243 = sub_364E4( v235,  v236,  v237,  v238,  v239,  v240,  v241,  v242,  v619,  v682,  v744,  v805,  v865,  v924,  v982,  v1039,  v1095,  v1150,  v1204,  v1257,  v1309,  v1360,  v1410,  v1459,  v1507,  v1554,  v1600,  v1645,  v1689,  v1732,  v1774,  v1815,  v1855,  v1894,  v1932,  v1969,  v2005);
    uint64_t v251 = sub_364DC( v243,  v244,  v245,  v246,  v247,  v248,  v249,  v250,  v620,  v683,  v745,  v806,  v866,  v925,  v983,  v1040,  v1096,  v1151,  v1205,  v1258,  v1310,  v1361,  v1411,  v1460,  v1508,  v1555,  v1601,  v1646,  v1690,  v1733,  v1775,  v1816,  v1856,  v1895,  v1933,  v1970,  v2006,  v2041);
    uint64_t v259 = sub_364D4( v251,  v252,  v253,  v254,  v255,  v256,  v257,  v258,  v621,  v684,  v746,  v807,  v867,  v926,  v984,  v1041,  v1097,  v1152,  v1206,  v1259,  v1311,  v1362,  v1412,  v1461,  v1509,  v1556,  v1602,  v1647,  v1691,  v1734,  v1776,  v1817,  v1857,  v1896,  v1934,  v1971,  v2007,  v2042,  v2076);
    uint64_t v267 = sub_366F8( v259,  v260,  v261,  v262,  v263,  v264,  v265,  v266,  v622,  v685,  v747,  v808,  v868,  v927,  v985,  v1042,  v1098,  v1153,  v1207,  v1260,  v1312,  v1363,  v1413,  v1462,  v1510,  v1557,  v1603,  v1648,  v1692,  v1735,  v1777,  v1818,  v1858,  v1897,  v1935,  v1972,  v2008,  v2043,  v2077,  v2110);
    uint64_t v275 = sub_366F0( v267,  v268,  v269,  v270,  v271,  v272,  v273,  v274,  v623,  v686,  v748,  v809,  v869,  v928,  v986,  v1043,  v1099,  v1154,  v1208,  v1261,  v1313,  v1364,  v1414,  v1463,  v1511,  v1558,  v1604,  v1649,  v1693,  v1736,  v1778,  v1819,  v1859,  v1898,  v1936,  v1973,  v2009,  v2044,  v2078,  v2111,  v2143);
    uint64_t v283 = sub_36B90( v275,  v276,  v277,  v278,  v279,  v280,  v281,  v282,  v624,  v687,  v749,  v810,  v870,  v929,  v987,  v1044,  v1100,  v1155,  v1209,  v1262,  v1314,  v1365,  v1415,  v1464,  v1512,  v1559,  v1605,  v1650,  v1694,  v1737,  v1779,  v1820,  v1860,  v1899,  v1937,  v1974,  v2010,  v2045,  v2079,  v2112,  v2144,  v2175);
    uint64_t v291 = sub_36EF4( v283,  v284,  v285,  v286,  v287,  v288,  v289,  v290,  v625,  v688,  v750,  v811,  v871,  v930,  v988,  v1045,  v1101,  v1156,  v1210,  v1263,  v1315,  v1366,  v1416,  v1465,  v1513,  v1560,  v1606,  v1651,  v1695,  v1738,  v1780,  v1821,  v1861,  v1900,  v1938,  v1975,  v2011,  v2046,  v2080,  v2113,  v2145,  v2176,  v2206);
    uint64_t v299 = sub_36EEC( v291,  v292,  v293,  v294,  v295,  v296,  v297,  v298,  v626,  v689,  v751,  v812,  v872,  v931,  v989,  v1046,  v1102,  v1157,  v1211,  v1264,  v1316,  v1367,  v1417,  v1466,  v1514,  v1561,  v1607,  v1652,  v1696,  v1739,  v1781,  v1822,  v1862,  v1901,  v1939,  v1976,  v2012,  v2047,  v2081,  v2114,  v2146,  v2177,  v2207,  v2236);
    uint64_t v307 = sub_DD7E4( v299,  v300,  v301,  v302,  v303,  v304,  v305,  v306,  v627,  v690,  v752,  v813,  v873,  v932,  v990,  v1047,  v1103,  v1158,  v1212,  v1265,  v1317,  v1368,  v1418,  v1467,  v1515,  v1562,  v1608,  v1653,  v1697,  v1740,  v1782,  v1823,  v1863,  v1902,  v1940,  v1977,  v2013,  v2048,  v2082,  v2115,  v2147,  v2178,  v2208,  v2237,  v2265);
    uint64_t v315 = sub_DD7DC( v307,  v308,  v309,  v310,  v311,  v312,  v313,  v314,  v628,  v691,  v753,  v814,  v874,  v933,  v991,  v1048,  v1104,  v1159,  v1213,  v1266,  v1318,  v1369,  v1419,  v1468,  v1516,  v1563,  v1609,  v1654,  v1698,  v1741,  v1783,  v1824,  v1864,  v1903,  v1941,  v1978,  v2014,  v2049,  v2083,  v2116,  v2148,  v2179,  v2209,  v2238,  v2266,  v2293);
    uint64_t v323 = sub_DD7D4( v315,  v316,  v317,  v318,  v319,  v320,  v321,  v322,  v629,  v692,  v754,  v815,  v875,  v934,  v992,  v1049,  v1105,  v1160,  v1214,  v1267,  v1319,  v1370,  v1420,  v1469,  v1517,  v1564,  v1610,  v1655,  v1699,  v1742,  v1784,  v1825,  v1865,  v1904,  v1942,  v1979,  v2015,  v2050,  v2084,  v2117,  v2149,  v2180,  v2210,  v2239,  v2267,  v2294,  v2320);
    uint64_t v331 = sub_DD7CC( v323,  v324,  v325,  v326,  v327,  v328,  v329,  v330,  v630,  v693,  v755,  v816,  v876,  v935,  v993,  v1050,  v1106,  v1161,  v1215,  v1268,  v1320,  v1371,  v1421,  v1470,  v1518,  v1565,  v1611,  v1656,  v1700,  v1743,  v1785,  v1826,  v1866,  v1905,  v1943,  v1980,  v2016,  v2051,  v2085,  v2118,  v2150,  v2181,  v2211,  v2240,  v2268,  v2295,  v2321,  v2346);
    uint64_t v339 = sub_DD7C4( v331,  v332,  v333,  v334,  v335,  v336,  v337,  v338,  v631,  v694,  v756,  v817,  v877,  v936,  v994,  v1051,  v1107,  v1162,  v1216,  v1269,  v1321,  v1372,  v1422,  v1471,  v1519,  v1566,  v1612,  v1657,  v1701,  v1744,  v1786,  v1827,  v1867,  v1906,  v1944,  v1981,  v2017,  v2052,  v2086,  v2119,  v2151,  v2182,  v2212,  v2241,  v2269,  v2296,  v2322,  v2347,  v2371);
    uint64_t v347 = sub_DD7BC( v339,  v340,  v341,  v342,  v343,  v344,  v345,  v346,  v632,  v695,  v757,  v818,  v878,  v937,  v995,  v1052,  v1108,  v1163,  v1217,  v1270,  v1322,  v1373,  v1423,  v1472,  v1520,  v1567,  v1613,  v1658,  v1702,  v1745,  v1787,  v1828,  v1868,  v1907,  v1945,  v1982,  v2018,  v2053,  v2087,  v2120,  v2152,  v2183,  v2213,  v2242,  v2270,  v2297,  v2323,  v2348,  v2372,
             v2395);
    uint64_t v355 = sub_DD7B4( v347,  v348,  v349,  v350,  v351,  v352,  v353,  v354,  v633,  v696,  v758,  v819,  v879,  v938,  v996,  v1053,  v1109,  v1164,  v1218,  v1271,  v1323,  v1374,  v1424,  v1473,  v1521,  v1568,  v1614,  v1659,  v1703,  v1746,  v1788,  v1829,  v1869,  v1908,  v1946,  v1983,  v2019,  v2054,  v2088,  v2121,  v2153,  v2184,  v2214,  v2243,  v2271,  v2298,  v2324,  v2349,  v2373,
             v2396,
             v2418);
    uint64_t v363 = sub_DD7AC( v355,  v356,  v357,  v358,  v359,  v360,  v361,  v362,  v634,  v697,  v759,  v820,  v880,  v939,  v997,  v1054,  v1110,  v1165,  v1219,  v1272,  v1324,  v1375,  v1425,  v1474,  v1522,  v1569,  v1615,  v1660,  v1704,  v1747,  v1789,  v1830,  v1870,  v1909,  v1947,  v1984,  v2020,  v2055,  v2089,  v2122,  v2154,  v2185,  v2215,  v2244,  v2272,  v2299,  v2325,  v2350,  v2374,
             v2397,
             v2419,
             v2440);
    uint64_t v371 = sub_DD7A4( v363,  v364,  v365,  v366,  v367,  v368,  v369,  v370,  v635,  v698,  v760,  v821,  v881,  v940,  v998,  v1055,  v1111,  v1166,  v1220,  v1273,  v1325,  v1376,  v1426,  v1475,  v1523,  v1570,  v1616,  v1661,  v1705,  v1748,  v1790,  v1831,  v1871,  v1910,  v1948,  v1985,  v2021,  v2056,  v2090,  v2123,  v2155,  v2186,  v2216,  v2245,  v2273,  v2300,  v2326,  v2351,  v2375,
             v2398,
             v2420,
             v2441,
             v2461);
    uint64_t v379 = sub_DD79C( v371,  v372,  v373,  v374,  v375,  v376,  v377,  v378,  v636,  v699,  v761,  v822,  v882,  v941,  v999,  v1056,  v1112,  v1167,  v1221,  v1274,  v1326,  v1377,  v1427,  v1476,  v1524,  v1571,  v1617,  v1662,  v1706,  v1749,  v1791,  v1832,  v1872,  v1911,  v1949,  v1986,  v2022,  v2057,  v2091,  v2124,  v2156,  v2187,  v2217,  v2246,  v2274,  v2301,  v2327,  v2352,  v2376,
             v2399,
             v2421,
             v2442,
             v2462,
             v2481);
    uint64_t v387 = sub_DD794( v379,  v380,  v381,  v382,  v383,  v384,  v385,  v386,  v637,  v700,  v762,  v823,  v883,  v942,  v1000,  v1057,  v1113,  v1168,  v1222,  v1275,  v1327,  v1378,  v1428,  v1477,  v1525,  v1572,  v1618,  v1663,  v1707,  v1750,  v1792,  v1833,  v1873,  v1912,  v1950,  v1987,  v2023,  v2058,  v2092,  v2125,  v2157,  v2188,  v2218,  v2247,  v2275,  v2302,  v2328,  v2353,  v2377,
             v2400,
             v2422,
             v2443,
             v2463,
             v2482,
             v2500);
    uint64_t v395 = sub_DD78C( v387,  v388,  v389,  v390,  v391,  v392,  v393,  v394,  v638,  v701,  v763,  v824,  v884,  v943,  v1001,  v1058,  v1114,  v1169,  v1223,  v1276,  v1328,  v1379,  v1429,  v1478,  v1526,  v1573,  v1619,  v1664,  v1708,  v1751,  v1793,  v1834,  v1874,  v1913,  v1951,  v1988,  v2024,  v2059,  v2093,  v2126,  v2158,  v2189,  v2219,  v2248,  v2276,  v2303,  v2329,  v2354,  v2378,
             v2401,
             v2423,
             v2444,
             v2464,
             v2483,
             v2501,
             v2518);
    uint64_t v403 = sub_DD784( v395,  v396,  v397,  v398,  v399,  v400,  v401,  v402,  v639,  v702,  v764,  v825,  v885,  v944,  v1002,  v1059,  v1115,  v1170,  v1224,  v1277,  v1329,  v1380,  v1430,  v1479,  v1527,  v1574,  v1620,  v1665,  v1709,  v1752,  v1794,  v1835,  v1875,  v1914,  v1952,  v1989,  v2025,  v2060,  v2094,  v2127,  v2159,  v2190,  v2220,  v2249,  v2277,  v2304,  v2330,  v2355,  v2379,
             v2402,
             v2424,
             v2445,
             v2465,
             v2484,
             v2502,
             v2519,
             v2535);
    uint64_t v411 = sub_DD77C( v403,  v404,  v405,  v406,  v407,  v408,  v409,  v410,  v640,  v703,  v765,  v826,  v886,  v945,  v1003,  v1060,  v1116,  v1171,  v1225,  v1278,  v1330,  v1381,  v1431,  v1480,  v1528,  v1575,  v1621,  v1666,  v1710,  v1753,  v1795,  v1836,  v1876,  v1915,  v1953,  v1990,  v2026,  v2061,  v2095,  v2128,  v2160,  v2191,  v2221,  v2250,  v2278,  v2305,  v2331,  v2356,  v2380,
             v2403,
             v2425,
             v2446,
             v2466,
             v2485,
             v2503,
             v2520,
             v2536,
             v2551);
    uint64_t v419 = sub_DD774( v411,  v412,  v413,  v414,  v415,  v416,  v417,  v418,  v641,  v704,  v766,  v827,  v887,  v946,  v1004,  v1061,  v1117,  v1172,  v1226,  v1279,  v1331,  v1382,  v1432,  v1481,  v1529,  v1576,  v1622,  v1667,  v1711,  v1754,  v1796,  v1837,  v1877,  v1916,  v1954,  v1991,  v2027,  v2062,  v2096,  v2129,  v2161,  v2192,  v2222,  v2251,  v2279,  v2306,  v2332,  v2357,  v2381,
             v2404,
             v2426,
             v2447,
             v2467,
             v2486,
             v2504,
             v2521,
             v2537,
             v2552,
             v2566);
    uint64_t v427 = sub_DD76C( v419,  v420,  v421,  v422,  v423,  v424,  v425,  v426,  v642,  v705,  v767,  v828,  v888,  v947,  v1005,  v1062,  v1118,  v1173,  v1227,  v1280,  v1332,  v1383,  v1433,  v1482,  v1530,  v1577,  v1623,  v1668,  v1712,  v1755,  v1797,  v1838,  v1878,  v1917,  v1955,  v1992,  v2028,  v2063,  v2097,  v2130,  v2162,  v2193,  v2223,  v2252,  v2280,  v2307,  v2333,  v2358,  v2382,
             v2405,
             v2427,
             v2448,
             v2468,
             v2487,
             v2505,
             v2522,
             v2538,
             v2553,
             v2567,
             v2580);
    uint64_t v435 = sub_DD764( v427,  v428,  v429,  v430,  v431,  v432,  v433,  v434,  v643,  v706,  v768,  v829,  v889,  v948,  v1006,  v1063,  v1119,  v1174,  v1228,  v1281,  v1333,  v1384,  v1434,  v1483,  v1531,  v1578,  v1624,  v1669,  v1713,  v1756,  v1798,  v1839,  v1879,  v1918,  v1956,  v1993,  v2029,  v2064,  v2098,  v2131,  v2163,  v2194,  v2224,  v2253,  v2281,  v2308,  v2334,  v2359,  v2383,
             v2406,
             v2428,
             v2449,
             v2469,
             v2488,
             v2506,
             v2523,
             v2539,
             v2554,
             v2568,
             v2581,
             v2593);
    uint64_t v443 = sub_DD75C( v435,  v436,  v437,  v438,  v439,  v440,  v441,  v442,  v644,  v707,  v769,  v830,  v890,  v949,  v1007,  v1064,  v1120,  v1175,  v1229,  v1282,  v1334,  v1385,  v1435,  v1484,  v1532,  v1579,  v1625,  v1670,  v1714,  v1757,  v1799,  v1840,  v1880,  v1919,  v1957,  v1994,  v2030,  v2065,  v2099,  v2132,  v2164,  v2195,  v2225,  v2254,  v2282,  v2309,  v2335,  v2360,  v2384,
             v2407,
             v2429,
             v2450,
             v2470,
             v2489,
             v2507,
             v2524,
             v2540,
             v2555,
             v2569,
             v2582,
             v2594,
             v2605);
    uint64_t v451 = sub_DD754( v443,  v444,  v445,  v446,  v447,  v448,  v449,  v450,  v645,  v708,  v770,  v831,  v891,  v950,  v1008,  v1065,  v1121,  v1176,  v1230,  v1283,  v1335,  v1386,  v1436,  v1485,  v1533,  v1580,  v1626,  v1671,  v1715,  v1758,  v1800,  v1841,  v1881,  v1920,  v1958,  v1995,  v2031,  v2066,  v2100,  v2133,  v2165,  v2196,  v2226,  v2255,  v2283,  v2310,  v2336,  v2361,  v2385,
             v2408,
             v2430,
             v2451,
             v2471,
             v2490,
             v2508,
             v2525,
             v2541,
             v2556,
             v2570,
             v2583,
             v2595,
             v2606,
             v2616);
    uint64_t v459 = sub_DD74C( v451,  v452,  v453,  v454,  v455,  v456,  v457,  v458,  v646,  v709,  v771,  v832,  v892,  v951,  v1009,  v1066,  v1122,  v1177,  v1231,  v1284,  v1336,  v1387,  v1437,  v1486,  v1534,  v1581,  v1627,  v1672,  v1716,  v1759,  v1801,  v1842,  v1882,  v1921,  v1959,  v1996,  v2032,  v2067,  v2101,  v2134,  v2166,  v2197,  v2227,  v2256,  v2284,  v2311,  v2337,  v2362,  v2386,
             v2409,
             v2431,
             v2452,
             v2472,
             v2491,
             v2509,
             v2526,
             v2542,
             v2557,
             v2571,
             v2584,
             v2596,
             v2607,
             v2617);
    uint64_t v467 = sub_DD744( v459,  v460,  v461,  v462,  v463,  v464,  v465,  v466,  v647,  v710,  v772,  v833,  v893,  v952,  v1010,  v1067,  v1123,  v1178,  v1232,  v1285,  v1337,  v1388,  v1438,  v1487,  v1535,  v1582,  v1628,  v1673,  v1717,  v1760,  v1802,  v1843,  v1883,  v1922,  v1960,  v1997,  v2033,  v2068,  v2102,  v2135,  v2167,  v2198,  v2228,  v2257,  v2285,  v2312,  v2338,  v2363,  v2387,
             v2410,
             v2432,
             v2453,
             v2473,
             v2492,
             v2510,
             v2527,
             v2543,
             v2558,
             v2572,
             v2585,
             v2597,
             v2608,
             v2618);
    uint64_t v475 = sub_DD73C( v467,  v468,  v469,  v470,  v471,  v472,  v473,  v474,  v648,  v711,  v773,  v834,  v894,  v953,  v1011,  v1068,  v1124,  v1179,  v1233,  v1286,  v1338,  v1389,  v1439,  v1488,  v1536,  v1583,  v1629,  v1674,  v1718,  v1761,  v1803,  v1844,  v1884,  v1923,  v1961,  v1998,  v2034,  v2069,  v2103,  v2136,  v2168,  v2199,  v2229,  v2258,  v2286,  v2313,  v2339,  v2364,  v2388,
             v2411,
             v2433,
             v2454,
             v2474,
             v2493,
             v2511,
             v2528,
             v2544,
             v2559,
             v2573,
             v2586,
             v2598,
             v2609,
             v2619);
    uint64_t v483 = sub_DD734( v475,  v476,  v477,  v478,  v479,  v480,  v481,  v482,  v649,  v712,  v774,  v835,  v895,  v954,  v1012,  v1069,  v1125,  v1180,  v1234,  v1287,  v1339,  v1390,  v1440,  v1489,  v1537,  v1584,  v1630,  v1675,  v1719,  v1762,  v1804,  v1845,  v1885,  v1924,  v1962,  v1999,  v2035,  v2070,  v2104,  v2137,  v2169,  v2200,  v2230,  v2259,  v2287,  v2314,  v2340,  v2365,  v2389,
             v2412,
             v2434,
             v2455,
             v2475,
             v2494,
             v2512,
             v2529,
             v2545,
             v2560,
             v2574,
             v2587,
             v2599,
             v2610,
             v2620);
    uint64_t v491 = sub_DD72C( v483,  v484,  v485,  v486,  v487,  v488,  v489,  v490,  v650,  v713,  v775,  v836,  v896,  v955,  v1013,  v1070,  v1126,  v1181,  v1235,  v1288,  v1340,  v1391,  v1441,  v1490,  v1538,  v1585,  v1631,  v1676,  v1720,  v1763,  v1805,  v1846,  v1886,  v1925,  v1963,  v2000,  v2036,  v2071,  v2105,  v2138,  v2170,  v2201,  v2231,  v2260,  v2288,  v2315,  v2341,  v2366,  v2390,
             v2413,
             v2435,
             v2456,
             v2476,
             v2495,
             v2513,
             v2530,
             v2546,
             v2561,
             v2575,
             v2588,
             v2600,
             v2611,
             v2621);
    uint64_t v499 = sub_DD724( v491,  v492,  v493,  v494,  v495,  v496,  v497,  v498,  v651,  v714,  v776,  v837,  v897,  v956,  v1014,  v1071,  v1127,  v1182,  v1236,  v1289,  v1341,  v1392,  v1442,  v1491,  v1539,  v1586,  v1632,  v1677,  v1721,  v1764,  v1806,  v1847,  v1887,  v1926,  v1964,  v2001,  v2037,  v2072,  v2106,  v2139,  v2171,  v2202,  v2232,  v2261,  v2289,  v2316,  v2342,  v2367,  v2391,
             v2414,
             v2436,
             v2457,
             v2477,
             v2496,
             v2514,
             v2531,
             v2547,
             v2562,
             v2576,
             v2589,
             v2601,
             v2612,
             v2622);
    uint64_t v507 = sub_DD71C( v499,  v500,  v501,  v502,  v503,  v504,  v505,  v506,  v652,  v715,  v777,  v838,  v898,  v957,  v1015,  v1072,  v1128,  v1183,  v1237,  v1290,  v1342,  v1393,  v1443,  v1492,  v1540,  v1587,  v1633,  v1678,  v1722,  v1765,  v1807,  v1848,  v1888,  v1927,  v1965,  v2002,  v2038,  v2073,  v2107,  v2140,  v2172,  v2203,  v2233,  v2262,  v2290,  v2317,  v2343,  v2368,  v2392,
             v2415,
             v2437,
             v2458,
             v2478,
             v2497,
             v2515,
             v2532,
             v2548,
             v2563,
             v2577,
             v2590,
             v2602,
             v2613,
             v2623);
    uint64_t v515 = sub_DD714( v507,  v508,  v509,  v510,  v511,  v512,  v513,  v514,  v653,  v716,  v778,  v839,  v899,  v958,  v1016,  v1073,  v1129,  v1184,  v1238,  v1291,  v1343,  v1394,  v1444,  v1493,  v1541,  v1588,  v1634,  v1679,  v1723,  v1766,  v1808,  v1849,  v1889,  v1928,  v1966,  v2003,  v2039,  v2074,  v2108,  v2141,  v2173,  v2204,  v2234,  v2263,  v2291,  v2318,  v2344,  v2369,  v2393,
             v2416,
             v2438,
             v2459,
             v2479,
             v2498,
             v2516,
             v2533,
             v2549,
             v2564,
             v2578,
             v2591,
             v2603,
             v2614,
             v2624);
    sub_DD70C( v515,  v516,  v517,  v518,  v519,  v520,  v521,  v522,  v654,  v717,  v779,  v840,  v900,  v959,  v1017,  v1074,  v1130,  v1185,  v1239,  v1292,  v1344,  v1395,  v1445,  v1494,  v1542,  v1589,  v1635,  v1680,  v1724,  v1767,  v1809,  v1850,  v1890,  v1929,  v1967,  v2004,  v2040,  v2075,  v2109,  v2142,  v2174,  v2205,  v2235,  v2264,  v2292,  v2319,  v2345,  v2370,  v2394,
      v2417,
      v2439,
      v2460,
      v2480,
      v2499,
      v2517,
      v2534,
      v2550,
      v2565,
      v2579,
      v2592,
      v2604,
      v2615,
      v2625);
    sub_DD704();
    sub_DD6FC();
    sub_DD6F4();
    sub_DD6EC();
    sub_DD6E4();
    sub_DD6DC();
    sub_DD6D4();
    sub_DD6CC();
    sub_DD6C4();
    sub_DD6BC();
    sub_DD6B4();
    sub_DD6AC();
    sub_DD6A4();
    sub_DD69C();
    sub_DD694();
    sub_DD68C();
    sub_DD684();
    sub_DD67C();
    sub_DD674();
    sub_DD66C();
    sub_DD664();
    sub_DD65C();
    sub_DD654();
    sub_DD64C();
    sub_DD644();
    sub_DD63C();
    sub_DD634();
    sub_DD62C();
    sub_DD624();
    sub_DD61C();
    sub_DD614();
    sub_DD60C();
    sub_DD604();
    sub_DD5FC();
    sub_DD5F4();
    sub_DD5EC();
    sub_DD5E4();
    sub_DD5DC();
    sub_DD5D4();
    sub_DD5CC();
    sub_DD5C4();
    sub_DD5BC();
    sub_DD5B4();
    sub_DD5AC();
    sub_DD5A4();
    sub_DD59C();
    sub_DD594();
    sub_DD58C();
    sub_DD584();
    sub_DD57C();
    sub_DD574();
    sub_DD56C();
    sub_DD564();
    sub_DD55C();
    sub_DD554();
    sub_DD54C();
    sub_DD544();
    sub_DD53C();
    sub_DD534();
    sub_DD52C();
    sub_DD524();
    sub_DD51C();
    sub_DD514();
    sub_DD50C();
    sub_DD504();
    sub_DD4FC();
    sub_DD4F4();
    sub_DD4EC();
    sub_DD4DC();
    sub_DD4E4();
    sub_DD868();
    sub_DD870();
    sub_DDA48();
    sub_DDA58();
    sub_36B88();
    sub_366E8();
    sub_3677C();
    sub_36588();
    sub_36624();
    sub_3661C();
    sub_36614();
    sub_3660C();
    sub_36604();
    sub_365FC();
    sub_365F4();
    sub_365EC();
    sub_365E4();
    sub_365DC();
    sub_366B8();
    sub_366B0();
    uint64_t v523 = (uint64_t (*)(void))sub_DE01C();
    return sub_36148(v523);
  }

  uint64_t v525 = sub_4195C();
  uint64_t v531 = getMedDosageValue(from:)(v525, v526, v527, v528, v529, v530);
  char v533 = v532;
  sub_37034();
  if ((v533 & 1) != 0) {
    goto LABEL_17;
  }
  uint64_t v534 = *(void **)(v0 + 27896);
  uint64_t v535 = *(void *)(v0 + 27592);
  uint64_t v536 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 27384);
  uint64_t v537 = *(void *)(v0 + 27376);
  uint64_t v538 = *(void *)(v0 + 27072);
  double v539 = *(double *)&v531;
  uint64_t v540 = *(void *)(v0 + 26736);
  id v541 = sub_D69A8(v539);
  sub_36F44(v534, "setDosage:");
  sub_A5DC(v537, v0 + 24248);
  v536(v538, v537, v540);
  uint64_t v542 = sub_20308((uint64_t)&unk_180260, 24LL);
  *(void *)(v542 + 16) = v541;
  id v543 = v541;
  sub_DDE60();
  os_log_type_t v544 = sub_AB70();
  uint64_t v545 = sub_20308((uint64_t)&unk_180288, 17LL);
  *(_BYTE *)(v545 + 16) = 64;
  uint64_t v546 = sub_20308((uint64_t)&unk_1802B0, 17LL);
  sub_DE91C(v546);
  uint64_t v547 = sub_20308((uint64_t)&unk_1802D8, 32LL);
  *(void *)(v547 + 16) = sub_DAC78;
  *(void *)(v547 + 24) = v542;
  uint64_t v548 = sub_20308((uint64_t)&unk_180300, 32LL);
  *(void *)(v548 + 16) = sub_DAC88;
  *(void *)(v548 + 24) = v547;
  uint64_t v549 = sub_20308(v535, 80LL);
  sub_DE4D8(v549);
  *uint64_t v550 = sub_DBD84;
  v550[1] = v545;
  v550[2] = sub_DBD84;
  v550[3] = v546;
  v550[4] = sub_DAC90;
  v550[5] = v548;
  sub_41D48();
  sub_36C5C();
  sub_72C38();
  uint64_t v551 = sub_6D64();
  if (!sub_DE7E0(v551, v544))
  {
    sub_DE124();
    sub_36EBC();
    sub_37110();
    sub_39BAC();

    sub_DE2E8();
LABEL_17:
    uint64_t v552 = *(void *)(v0 + 27880);
    goto LABEL_18;
  }

  uint64_t v2628 = v543;
  uint64_t v552 = *(void *)(v0 + 27880);
  uint64_t v553 = (uint8_t *)sub_DE58C();
  uint64_t v2626 = sub_A5E8(8LL);
  uint64_t v2631 = v2626;
  uint64_t v2632 = 0LL;
  *(_WORD *)uint64_t v553 = 258;
  uint64_t v2629 = sub_DBD84;
  uint64_t v2630 = v545;
  sub_DD43C();
  if (v552) {
    return sub_DDEE0(v552);
  }
  sub_39BAC();
  uint64_t v2629 = sub_DBD84;
  uint64_t v2630 = v546;
  sub_DD43C();
  sub_37110();
  uint64_t v2629 = (uint64_t (*)())sub_DAC90;
  uint64_t v2630 = v548;
  sub_DD43C();
  uint64_t v554 = *(void *)(v0 + 27072);
  sub_36EBC();
  sub_DA24(&dword_0, (os_log_s *)v541, v544, "Post-disambiguation, re-grab the dosage: (%@) in task", v553);
  sub_494C(&qword_189CB8);
  sub_A81C(v2626);
  sub_5050(v2626);
  sub_5050((uint64_t)v553);

  sub_DE330(v554);
  uint64_t v552 = 0LL;
LABEL_18:
  uint64_t v555 = sub_732B8();
  getMedDosageUnit(from:)(v555, v556, v557, v558, v559, v560);
  uint64_t v562 = v561;
  uint64_t v564 = v563;
  sub_36BE0();
  if (v564)
  {
    uint64_t v565 = *(void *)(v0 + 27592);
    uint64_t v566 = *(void *)(v0 + 27376);
    uint64_t v567 = *(void *)(v0 + 27064);
    uint64_t v568 = sub_BB080();
    sub_DA63C(v568, v569, v570);
    uint64_t v571 = sub_BAFCC();
    sub_A5DC(v571, v572);
    sub_DECB0(v567, v566);
    uint64_t v573 = sub_20308((uint64_t)&unk_180198, 32LL);
    *(void *)(v573 + 16) = v562;
    *(void *)(v573 + 24) = v564;
    sub_37018();
    os_log_type_t v574 = sub_AB70();
    uint64_t v575 = sub_20308((uint64_t)&unk_1801C0, 17LL);
    *(_BYTE *)(v575 + 16) = 32;
    uint64_t v576 = sub_20308((uint64_t)&unk_1801E8, 17LL);
    sub_DE91C(v576);
    uint64_t v577 = sub_20308((uint64_t)&unk_180210, 32LL);
    *(void *)(v577 + 16) = sub_DAC44;
    *(void *)(v577 + 24) = v573;
    uint64_t v578 = sub_20308((uint64_t)&unk_180238, 32LL);
    *(void *)(v578 + 16) = sub_DBD74;
    *(void *)(v578 + 24) = v577;
    uint64_t v579 = sub_20308(v565, 80LL);
    sub_DE4D8(v579);
    *uint64_t v580 = sub_DBD84;
    v580[1] = v575;
    v580[2] = sub_DBD84;
    v580[3] = v576;
    v580[4] = sub_DBD7C;
    v580[5] = v578;
    sub_36C5C();
    sub_72C38();
    sub_732B8();
    uint64_t v581 = sub_DA1C();
    if (sub_DE7E0(v581, v574))
    {
      uint64_t v582 = (_WORD *)sub_DE58C();
      uint64_t v2631 = 0LL;
      uint64_t v2632 = sub_A5E8(32LL);
      uint64_t v2627 = v2632;
      *uint64_t v582 = 258;
      uint64_t v2629 = sub_DBD84;
      uint64_t v2630 = v575;
      sub_DD43C();
      if (!v552)
      {
        sub_37110();
        uint64_t v2629 = sub_DBD84;
        uint64_t v2630 = v576;
        sub_DD43C();
        sub_36EBC();
        uint64_t v2629 = sub_DBD7C;
        uint64_t v2630 = v578;
        sub_DD43C();
        sub_36BE0();
        sub_DDDF4(&dword_0, v562, v574, "Post-disambiguation, re-grab the dosageUnit: (%s) in task");
        sub_A81C(v2627);
        sub_5050(v2627);
        sub_DE340();

        sub_DE30C();
        uint64_t v552 = 0LL;
        goto LABEL_25;
      }

      return sub_DDEE0(v552);
    }

    uint64_t v583 = *(void (**)(uint64_t, uint64_t))(v0 + 27888);
    uint64_t v584 = *(void *)(v0 + 27064);
    uint64_t v585 = *(void *)(v0 + 26736);

    sub_36BE0();
    sub_36EBC();
    sub_37110();
    v583(v584, v585);
  }

uint64_t sub_CA5B8()
{
  return sub_A5D0();
}

uint64_t sub_CA5E4()
{
  uint64_t v2779 = v8 | 0x1000000000000000LL;
  uint64_t v2780 = v9;
  uint64_t v2778 = v3;
  uint64_t v10 = *(void *)(v3 + 27944);
  uint64_t v11 = *(uint64_t **)(v3 + 25784);
  *(void *)(v3 + 27952) = v11;
  swift_unknownObjectRelease(v10);
  uint64_t v12 = sub_DE8D8(*v11);
  switch(v12)
  {
    case 'j':
      uint64_t v2773 = v11;
      uint64_t v7 = *(void **)(v3 + 27440);
      sub_DE950();
      uint64_t v13 = *(os_log_s **)(v3 + 27008);
      sub_DDD50();
      swift_bridgeObjectRelease();
      sub_DE350();
      swift_bridgeObjectRelease();
      sub_DE25C();
      swift_bridgeObjectRelease();
      sub_369F4();
      uint64_t v14 = v11[28];
      uint64_t v15 = v11[29];
      uint64_t v16 = v11 + 28;
      sub_DD888(v14, v15, v16[2], v16[3], v16[4], v16[5], v16[6], v16[7], *((_BYTE *)v16 + 64));
      sub_A5DC(v2, v3 + 24800);
      uint64_t v17 = v0(v13, v2, v4);
      Logger.logObject.getter(v17);
      os_log_type_t v18 = sub_AB70();
      if (sub_A634(v18))
      {
        sub_DE408();
        uint64_t v19 = *(void *)(v3 + 27008);
        uint64_t v20 = (uint8_t *)sub_3635C();
        v2775[0] = 0LL;
        *(void *)&v2776[0] = 0LL;
        sub_DD4AC(v20);
        uint64_t v7 = _swiftEmptyArrayStorage;
        sub_DDBC8();
        sub_B25F0();
        sub_232EC( &dword_0,  v13,  (os_log_type_t)v4,  "got state .awaitingConfirmationLogAsScheduled inside first .nameSelected turn in SpecificMedLoggingFlow",  v20);
        sub_DE328();

        sub_DE330(v19);
      }

      else
      {
        sub_DE124();
        swift_bridgeObjectRelease();
        sub_DE2E8();
      }

      sub_DA680( v2773,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (!v89)
      {
        uint64_t v2771 = (void *)(v3 + 11168);
        uint64_t v36 = (os_log_s *)(v3 + 24728);
        uint64_t v184 = *(void *)(v3 + 27376);
        sub_DECA8(*(void *)(v3 + 27928));
        sub_A5DC(v184, v3 + 24728);
        sub_DE318();
        sub_DDE60();
        os_log_type_t v185 = sub_AB70();
        BOOL v186 = sub_37140(v185);
        uint64_t v187 = *(void **)(v3 + 27888);
        goto LABEL_53;
      }

      uint64_t v90 = v89;
      uint64_t v91 = sub_36C5C();
      getLocalizedMedName(from:)(v91, v92, v93, v94, v95, v96);
      uint64_t v98 = v97;
      uint64_t v100 = v99;
      sub_37110();
      uint64_t v101 = *(void *)(v3 + 27928);
      if (v100)
      {
        sub_DA1C();
        uint64_t v101 = v100;
        uint64_t v102 = v98;
      }

      else
      {
        uint64_t v102 = *(void *)(v3 + 27920);
      }

      uint64_t v2772 = *(void *)(v3 + 26728);
      uint64_t v2767 = *(void **)(v3 + 27896);
      uint64_t v2770 = *(void *)(v3 + 26688);
      uint64_t v2764 = *(void *)(v3 + 26432);
      uint64_t v213 = *(void *)(v3 + 25976);
      type metadata accessor for LogMedAsScheduledConfirmationStrategy();
      uint64_t v214 = sub_DE5EC();
      getMedStatus(from:)(v214, v215, v216, v217, v218, v219);
      char v221 = v220;
      sub_DE5E4();
      sub_DE7C8((_OWORD *)(v213 + 64));
      uint64_t v222 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATsSimple,  (uint64_t (*)(uint64_t, void))&CATWrapperSimple.__allocating_init(options:globals:));
      uint64_t v223 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATs,  (uint64_t (*)(uint64_t, void))&CATWrapper.__allocating_init(options:globals:));
      sub_DEB04();
      uint64_t v224 = sub_8E1C8(v102, v101, v221 & 1, v90, (const void *)(v3 + 10368), v222, v223, v2776);
      swift_retain();
      sub_DEE04();
      sub_BFB6C( v224,  (uint64_t)v2776,  &qword_18AEA0,  (uint64_t (*)(void))type metadata accessor for LogMedAsScheduledConfirmationStrategy);
      *(void *)(v3 + 25864) = v225;
      uint64_t v226 = sub_D7248(v213);
      sub_494C(&qword_18AEA0);
      sub_3586C(&qword_18AEB0, &qword_18AEA0);
      sub_DEE68(v3 + 25864, (uint64_t)v226);
      sub_367AC();
      sub_DE15C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_37110();

      sub_26F04(v2764, type metadata accessor for SnippetHeaderModel);
      sub_279E0(v2770, &qword_189D00);
      uint64_t v136 = v2772;
      goto LABEL_73;
    case 'k':
      uint64_t v2774 = v11;
      uint64_t v35 = sub_DE1CC();
      uint64_t v36 = *(os_log_s **)(v3 + 26992);
      sub_DEC38(v35);
      sub_DEEF4();
      swift_bridgeObjectRelease();
      sub_DE89C();
      swift_bridgeObjectRelease();
      sub_DE8B4();
      swift_bridgeObjectRelease();
      sub_369F4();
      uint64_t v37 = sub_371A8();
      sub_DDF50(v37, v38, v39, v40, v41, v42, v43, v44, v45);
      sub_A5DC(v2, v5);
      uint64_t v46 = sub_DE7E8();
      Logger.logObject.getter(v46);
      os_log_type_t v47 = sub_AB70();
      if (sub_A634(v47))
      {
        sub_DE408();
        uint64_t v5 = *(void *)(v3 + 26992);
        uint64_t v48 = (uint8_t *)sub_3635C();
        v2775[0] = 0LL;
        *(void *)&v2776[0] = 0LL;
        sub_DD4AC(v48);
        uint64_t v7 = _swiftEmptyArrayStorage;
        sub_DDBC8();
        sub_B25F0();
        sub_232EC( &dword_0,  v36,  (os_log_type_t)v4,  "got state .awaitingConfirmationLogAsNeeded inside first .nameSelected turn in SpecificMedLoggingFlow",  v48);
        sub_DE328();

        uint64_t v49 = sub_DE330(v5);
      }

      else
      {
        sub_DE124();
        swift_bridgeObjectRelease();
        uint64_t v49 = sub_DE2E8();
      }

      uint64_t v103 = v11;
      sub_DE7D0( v49,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v104)
      {
        sub_DDC80();
        type metadata accessor for LogMedAsNeededConfirmationStrategy();
        sub_DDE20((_OWORD *)(v4 + 64));
        sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATsSimple,  (uint64_t (*)(uint64_t, void))&CATWrapperSimple.__allocating_init(options:globals:));
        sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATs,  (uint64_t (*)(uint64_t, void))&CATWrapper.__allocating_init(options:globals:));
        sub_DEB04();
        uint64_t v105 = sub_DE678();
        uint64_t v110 = sub_1124E4(v105, v106, v107, v108, v109);
        sub_DEEA0((uint64_t)v110);
        sub_DEE04();
        sub_BFB6C( v5,  (uint64_t)v2776,  &qword_18AEA0,  (uint64_t (*)(void))type metadata accessor for LogMedAsNeededConfirmationStrategy);
        *(void *)(v3 + 25840) = v111;
        sub_D7278(v4);
        goto LABEL_37;
      }

      sub_DE65C();
      sub_A5DC((uint64_t)v36, v188);
      sub_DE9C4();
      sub_37018();
      os_log_type_t v189 = sub_AB70();
      BOOL v186 = sub_37140(v189);
      uint64_t v187 = *(void **)(v3 + 27888);
LABEL_53:
      if (!v186) {
        goto LABEL_60;
      }
      uint64_t v190 = (uint8_t *)sub_3635C();
      v2775[0] = 0LL;
      *(void *)&v2776[0] = 0LL;
      uint64_t v191 = sub_DD4AC(v190);
      sub_DE634((uint64_t)v191, (uint64_t)v2777, (uint64_t)v2775, (uint64_t)v2776);
      sub_36C34();
      uint64_t v192 = "Needed confirmation log as scheduled but intentResponse.matchingMeds was nil.";
      goto LABEL_59;
    case 'l':
      uint64_t v50 = *(void (**)(uint64_t, os_log_s *, uint64_t))(v3 + 27384);
      uint64_t v51 = *(os_log_s **)(v3 + 27376);
      uint64_t v52 = *(void *)(v3 + 26960);
      uint64_t v53 = *(void *)(v3 + 26736);
      sub_A5DC((uint64_t)v51, v3 + 25160);
      v50(v52, v51, v53);
      sub_A86C();
      os_log_type_t v54 = sub_AB70();
      if (sub_A634(v54))
      {
        sub_DE408();
        uint64_t v55 = (uint8_t *)sub_3635C();
        v2775[0] = 0LL;
        *(void *)&v2776[0] = 0LL;
        sub_DD4AC(v55);
        sub_DDBC8();
        sub_B25F0();
        sub_232EC( &dword_0,  v51,  (os_log_type_t)v53,  "SpecificMedLoggingFlow received .statusBothSkipped intent response from post-first turn nameSelected case, creating output.",  v55);
        sub_DE328();

        uint64_t v56 = sub_37084();
      }

      else
      {
        uint64_t v50 = *(void (**)(uint64_t, os_log_s *, uint64_t))(v3 + 27888);
        uint64_t v113 = *(void *)(v3 + 26960);
        sub_DE124();
        swift_bridgeObjectRelease();
        uint64_t v56 = v113;
        uint64_t v57 = v53;
      }

      uint64_t v114 = ((uint64_t (*)(uint64_t, uint64_t))v50)(v56, v57);
      uint64_t v115 = *(void *)(v3 + 26200);
      uint64_t v116 = *(void *)(v3 + 25976);
      static DialogPhase.error.getter(v114);
      sub_DDDB4(v115, (uint64_t)PhoneRingsSnippet.body.getter);
      uint64_t v117 = 1LL;
      sub_368F8();
      *(void *)(v3 + 28056) = *(void *)(v116 + 336);
      uint64_t v118 = sub_363E8();
      sub_DDE68( v118,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v119)
      {
        id v121 = sub_DEE20(v119);
        sub_2A184();
        if (v121 && (uint64_t v122 = sub_1141DC(v121), v123))
        {
          String.toSpeakableString.getter(v122, v123);
          sub_2A184();
          uint64_t v117 = 0LL;
        }

        else
        {
          uint64_t v117 = 1LL;
        }
      }

      sub_A66C(*(void *)(v3 + 26552), v117, v120, *(void *)(v3 + 26384));
      uint64_t v193 = (void *)swift_task_alloc(dword_190C44);
      *(void *)(v3 + 28064) = v193;
      void *v193 = v3;
      v193[1] = sub_CD5C8;
      return sub_DDEA8(*(void *)(v3 + 26552));
    case 'm':
      uint64_t v2774 = v11;
      uint64_t v58 = sub_DE1CC();
      uint64_t v36 = *(os_log_s **)(v3 + 26976);
      sub_DEC38(v58);
      sub_DEEF4();
      swift_bridgeObjectRelease();
      sub_DE89C();
      swift_bridgeObjectRelease();
      sub_DE8B4();
      swift_bridgeObjectRelease();
      sub_369F4();
      uint64_t v59 = sub_371A8();
      sub_DDF50(v59, v60, v61, v62, v63, v64, v65, v66, v67);
      sub_A5DC(v2, v5);
      uint64_t v68 = sub_DE7E8();
      Logger.logObject.getter(v68);
      os_log_type_t v69 = sub_AB70();
      if (sub_A634(v69))
      {
        sub_DE408();
        uint64_t v5 = *(void *)(v3 + 26976);
        uint64_t v70 = (uint8_t *)sub_3635C();
        v2775[0] = 0LL;
        *(void *)&v2776[0] = 0LL;
        sub_DD4AC(v70);
        uint64_t v7 = _swiftEmptyArrayStorage;
        sub_DDBC8();
        sub_B25F0();
        sub_232EC( &dword_0,  v36,  (os_log_type_t)v4,  "got state .awaitingConfirmationUpdateToStatus in SpecificMedLoggingFlow",  v70);
        sub_DE328();

        uint64_t v71 = sub_DE330(v5);
      }

      else
      {
        sub_DE124();
        swift_bridgeObjectRelease();
        uint64_t v71 = sub_DE2E8();
      }

      uint64_t v103 = v11;
      sub_DE7D0( v71,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v124)
      {
        sub_DDC80();
        type metadata accessor for MedUpdateLogStatusStrategy();
        sub_DDE20((_OWORD *)(v4 + 64));
        sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATsSimple,  (uint64_t (*)(uint64_t, void))&CATWrapperSimple.__allocating_init(options:globals:));
        sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATs,  (uint64_t (*)(uint64_t, void))&CATWrapper.__allocating_init(options:globals:));
        sub_DEB04();
        uint64_t v125 = sub_DE678();
        uint64_t v130 = sub_1124E4(v125, v126, v127, v128, v129);
        sub_DEEA0((uint64_t)v130);
        sub_DEE04();
        sub_BFB6C( v5,  (uint64_t)v2776,  &qword_18AEA0,  (uint64_t (*)(void))type metadata accessor for MedUpdateLogStatusStrategy);
        *(void *)(v3 + 25816) = v131;
        sub_D72A8(v4);
LABEL_37:
        uint64_t v132 = v112;
        uint64_t v133 = sub_494C(&qword_18AEA0);
        sub_3586C(&qword_18AEB0, &qword_18AEA0);
        uint64_t v134 = sub_DED10();
        static ExecuteResponse.ongoing<A>(next:childCompletion:)(v134, v135, v132, v133);
        sub_36EBC();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_39BAC();

        sub_26F04(v2765, type metadata accessor for SnippetHeaderModel);
        sub_279E0((uint64_t)v2771, &qword_189D00);
        uint64_t v136 = (uint64_t)v2774;
LABEL_73:
        sub_279E0(v136, &qword_18B168);
        sub_3652C();
        goto LABEL_74;
      }

      sub_DE65C();
      sub_A5DC((uint64_t)v36, v195);
      sub_DE9C4();
      sub_37018();
      os_log_type_t v196 = sub_AB70();
      BOOL v197 = sub_37140(v196);
      uint64_t v187 = *(void **)(v3 + 27888);
      if (v197)
      {
        uint64_t v190 = (uint8_t *)sub_3635C();
        v2775[0] = 0LL;
        *(void *)&v2776[0] = 0LL;
        uint64_t v198 = sub_DD4AC(v190);
        sub_DE634((uint64_t)v198, (uint64_t)v2777, (uint64_t)v2775, (uint64_t)v2776);
        sub_36C34();
        uint64_t v192 = "Needed confirmation update to status but intentResponse.matchingMeds was nil.";
LABEL_59:
        sub_232EC(&dword_0, v36, (os_log_type_t)v7, v192, v190);
        sub_37268();
      }

      else
      {
LABEL_60:

        swift_bridgeObjectRelease();
      }

      sub_DDE14();
      sub_DED84();
      uint64_t v2769 = *(void *)(v3 + 26728);
      sub_DE1BC((_OWORD *)(*(void *)(v3 + 25976) + 64LL));
      sub_DE338(v2771);
      sub_A178();
      sub_36C08();
      sub_DE15C();
      sub_36C34();
      sub_369F4();
      sub_DA1C();

      uint64_t v199 = sub_36DD8();
      sub_99450((uint64_t)v199, type metadata accessor for SnippetHeaderModel);
      sub_72F7C(v200, &qword_189D00);
      uint64_t v88 = v2769;
      goto LABEL_62;
    case 'n':
    case 'o':
      goto LABEL_8;
    case 'p':
      uint64_t v72 = *(void (**)(uint64_t))(v3 + 27488);
      uint64_t v73 = *(void *)(v3 + 27376);
      uint64_t v74 = *(void *)(v3 + 27040);
      sub_DECA8(*(void *)(v3 + 27928));
      swift_bridgeObjectRelease();
      sub_DEB68();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_6D64();
      uint64_t v75 = sub_DEA34();
      sub_A5DC(v75, v76);
      sub_DECB0(v74, v73);
      sub_DDE60();
      os_log_type_t v77 = sub_A898();
      if (sub_46614(v77))
      {
        sub_DE408();
        uint64_t v78 = (uint8_t *)sub_3635C();
        v2775[0] = 0LL;
        *(void *)&v2776[0] = 0LL;
        uint64_t v79 = sub_DD4AC(v78);
        sub_DDA60((uint64_t)v79, (uint64_t)v2777, (uint64_t)v2775, (uint64_t)v2776);
        sub_DA1C();
        sub_232EC( &dword_0,  (os_log_s *)(v3 + 24464),  (os_log_type_t)v73,  "Received gotComplexDosageLoggingError, creating output.",  v78);
        sub_37268();

        uint64_t v80 = sub_DEBDC();
      }

      else
      {
        uint64_t v72 = *(void (**)(uint64_t))(v3 + 27888);
        sub_DEDC0();
        swift_bridgeObjectRelease();
        uint64_t v80 = sub_7DFE8();
      }

      v72(v80);
      uint64_t v2760 = *(void **)(v3 + 27896);
      uint64_t v2762 = *(void *)(v3 + 26688);
      uint64_t v2763 = *(void *)(v3 + 26728);
      uint64_t v2761 = *(void *)(v3 + 26432);
      uint64_t v137 = *(void *)(v3 + 25976);
      uint64_t v138 = v137 + 24;
      sub_36590((_OWORD *)(v137 + 64));
      sub_DED44(v138);
      sub_363E8();
      sub_74964(v2775);
      uint64_t v139 = sub_801D0();
      uint64_t v140 = sub_749C4();
      sub_310A0(v2776);
      uint64_t v141 = sub_BB080();
      sub_801E4(v141, v142, (__int128 *)(v3 + 21288), 0, 0, v143, v139, v140, v144, v2776);
      sub_808CC();
      sub_DEE80();
      sub_DE15C();
      sub_36C34();
      sub_82234();
      swift_bridgeObjectRelease();

      sub_80810((void *)(v3 + 832));
      sub_26F04(v2761, type metadata accessor for SnippetHeaderModel);
      sub_279E0(v2762, &qword_189D00);
      uint64_t v88 = v2763;
      goto LABEL_62;
    default:
      if (v12 == 5)
      {
        sub_DD990();
        sub_DDD24();
        swift_bridgeObjectRelease();
        sub_DDFD8();
        swift_bridgeObjectRelease();
        sub_DDFCC();
        swift_bridgeObjectRelease();
        sub_2A184();
        sub_A5DC(v2, (uint64_t)v1);
        sub_DDBF0();
        sub_AB5C();
        os_log_type_t v81 = sub_AB70();
        if (sub_A988(v81))
        {
          uint64_t v82 = *(void *)(v3 + 27032);
          uint64_t v83 = (uint8_t *)sub_3635C();
          v2775[0] = 0LL;
          *(void *)&v2776[0] = 0LL;
          uint64_t v84 = sub_DD4AC(v83);
          sub_DDA60((uint64_t)v84, (uint64_t)v2777, (uint64_t)v2775, (uint64_t)v2776);
          sub_DA1C();
          sub_232EC(&dword_0, v1, (os_log_type_t)v0, "Received failure intent response, creating output.", v83);
          sub_37128();

          sub_DDCC0(v82);
        }

        else
        {
          sub_DDA50();
          swift_bridgeObjectRelease();
          sub_36D90();
        }

        sub_DE3E4();
        *(void *)(v3 + 28000) = v1;
        sub_363E8();
        uint64_t v171 = sub_4195C();
        getLocalizedMedName(from:)(v171, v172, v173, v174, v175, v176);
        uint64_t v178 = v177;
        uint64_t v180 = v179;
        sub_37034();
        if (v180)
        {
          uint64_t v181 = *(void *)(v3 + 26568);
          uint64_t v182 = *(void *)(v3 + 26408);
          uint64_t v183 = *(void *)(v3 + 26392);
          String.toSpeakableString.getter(v178, v180);
          sub_2A184();
          sub_6D64();
          sub_566C0(v181, v182, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v183 + 32));
        }

        else
        {
          sub_DE710(*(void *)(v3 + 27920));
          sub_2A184();
        }

        sub_41A28(*(void *)(v3 + 26568));
        sub_DE07C();
        uint64_t v212 = (void *)swift_task_alloc(dword_190C2C);
        *(void *)(v3 + 28008) = v212;
        *uint64_t v212 = v3;
        v212[1] = sub_CCAC4;
        return sub_DDEC4(*(void *)(v3 + 26568), *(void *)(v3 + 26560));
      }

      else if (v12 == 4)
      {
        sub_DE950();
        uint64_t v21 = *(void *)(v3 + 27056);
        sub_DEDC8(v22);
        sub_A5DC(v2, v3 + 24440);
        uint64_t v23 = sub_DEBCC();
        ((void (*)(uint64_t))v0)(v23);
        sub_AB5C();
        os_log_type_t v24 = sub_AB70();
        if (sub_A634(v24))
        {
          sub_DE408();
          uint64_t v25 = (uint8_t *)sub_3635C();
          v2775[0] = 0LL;
          *(void *)&v2776[0] = 0LL;
          sub_DD4AC(v25);
          sub_DDBC8();
          sub_B25F0();
          sub_232EC( &dword_0,  (os_log_s *)(v3 + 24440),  (os_log_type_t)v21,  "Received successful intent response, creating output.",  v25);
          sub_DE328();

          uint64_t v26 = sub_37084();
        }

        else
        {
          uint64_t v0 = *(uint64_t (**)(os_log_s *, uint64_t, uint64_t))(v3 + 27888);
          uint64_t v145 = *(void *)(v3 + 27056);
          sub_DE124();
          swift_bridgeObjectRelease();
          uint64_t v26 = v145;
          uint64_t v27 = v21;
        }

        uint64_t v146 = ((uint64_t (*)(uint64_t, uint64_t))v0)(v26, v27);
        uint64_t v147 = *(void *)(v3 + 26616);
        uint64_t v148 = *(_BYTE **)(v3 + 26344);
        uint64_t v149 = *(void *)(v3 + 26320);
        uint64_t v150 = *(void *)(v3 + 25976);
        sub_DDE68( v146,  (SEL *)&selRef_matchingMedsBeforeUpdate,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
        if (v151) {
          uint64_t v152 = v151;
        }
        else {
          uint64_t v152 = _swiftEmptyArrayStorage;
        }
        sub_D91E4((uint64_t)v152);
        sub_6D64();
        uint64_t v153 = *(void *)(v150 + 16);
        uint64_t v154 = v11;
        sub_363E8();
        sub_D69DC(v154, v153, v148);
        uint64_t v155 = *(int *)(v149 + 36);
        *(_DWORD *)(v3 + 28508) = v155;
        LOBYTE(v153) = v148[v155 + 8];
        sub_9A688(v147, 1LL);
        if ((v153 & 1) == 0)
        {
          uint64_t v156 = *(void *)(v3 + 26616);
          uint64_t v157 = *(void *)(v3 + 26608);
          uint64_t v158 = sub_494C(&qword_18D778);
          uint64_t v159 = sub_20308(v158, 72LL);
          sub_DECE0(v159);
          uint64_t v161 = sub_DEDE4(v160, (uint64_t)&type metadata for Double);
          uint64_t v162 = sub_DE068(v161);
          String.toSpeakableString.getter(v162, v163);
          sub_36C34();
          sub_DED7C(v156);
          sub_5F150(v157, 0LL);
          uint64_t v164 = sub_1EB8C();
          sub_DADFC(v164, v165, &qword_189D00);
        }

        uint64_t v166 = *(char **)(v3 + 26344);
        *(void *)(v3 + 27960) = *(void *)(*(void *)(v3 + 25976) + 336LL);
        char v167 = *v166;
        sub_363E8();
        sub_DA6D8(v154, (SEL *)&selRef_medName);
        if (v169)
        {
          String.toSpeakableString.getter(v168, v169);
          sub_6D64();
          uint64_t v170 = 0LL;
        }

        else
        {
          uint64_t v170 = 1LL;
        }

        uint64_t v201 = *(void *)(v3 + 26592);
        uint64_t v202 = *(void *)(v3 + 26384);
        sub_5F150(v201, v170);
        uint64_t v203 = sub_37084();
        sub_98DE0(v203, v204, v205);
        sub_A614(v201, 1LL, v202);
        if (v207)
        {
          uint64_t v208 = *(void *)(v3 + 26584);
          uint64_t v209 = *(void *)(v3 + 26384);
          sub_DEEC8(*(void *)(v3 + 26336) + *(int *)(*(void *)(v3 + 26320) + 24LL), v206, &qword_189D00);
          sub_A614(v208, 1LL, v209);
          if (v207)
          {
            uint64_t v210 = *(void *)(v3 + 26336);
            String.toSpeakableString.getter(*(void *)(v3 + 27920), *(void *)(v3 + 27928));
            sub_26F04(v210, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
            sub_72F7C(v211, &qword_189D00);
          }

          else
          {
            sub_26F04( *(void *)(v3 + 26336),  type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
            sub_DE618();
          }

          sub_279E0(*(void *)(v3 + 26592), &qword_189D00);
        }

        else
        {
          sub_26F04( *(void *)(v3 + 26336),  type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
          sub_DE618();
        }

        uint64_t v724 = *(void *)(v3 + 26576);
        uint64_t v725 = *(void *)(v3 + 26344);
        uint64_t v726 = *(void *)(v3 + 26320);
        _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(*(void *)(v3 + 26600), 0LL, 1LL, *(void *)(v3 + 26384));
        sub_5F150(v724, 1LL);
        LOBYTE(v724) = *(_BYTE *)(v725 + *(int *)(v726 + 32));
        uint64_t v727 = (void *)swift_task_alloc(dword_190C3C);
        *(void *)(v3 + 27968) = v727;
        *uint64_t v727 = v3;
        v727[1] = sub_CBD54;
        return sub_DDE70( v167,  0,  *(void *)(v3 + 26600),  *(void *)(v3 + 26576),  0LL,  1,  v724,  *(void *)(v3 + 26616));
      }

      else
      {
LABEL_8:
        uint64_t v28 = (void *)(v3 + 25184);
        uint64_t v29 = *(void (**)(uint64_t))(v3 + 27488);
        sub_DE8C0();
        sub_DECA8(v30);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_DE3A8();
        swift_bridgeObjectRelease();
        sub_6D64();
        sub_A5DC(v6, v3 + 25184);
        sub_DEBB4();
        sub_DDE60();
        os_log_type_t v31 = sub_AB70();
        if (sub_561AC(v31))
        {
          sub_DE408();
          uint64_t v32 = (uint8_t *)sub_3635C();
          v2775[0] = 0LL;
          *(void *)&v2776[0] = 0LL;
          uint64_t v33 = sub_DD4AC(v32);
          sub_DDA60((uint64_t)v33, (uint64_t)v2777, (uint64_t)v2775, (uint64_t)v2776);
          sub_DA1C();
          sub_232EC( &dword_0,  (os_log_s *)(v3 + 25184),  (os_log_type_t)v6,  "Intent response code within .nameSelected was not an expected one || is one we're not handling yet, returning nil output.",  v32);
          sub_37268();

          uint64_t v34 = sub_DEBDC();
        }

        else
        {
          uint64_t v29 = *(void (**)(uint64_t))(v3 + 27888);

          swift_bridgeObjectRelease();
          uint64_t v34 = sub_DE46C();
        }

        v29(v34);
        uint64_t v85 = *(void **)(v3 + 27896);
        uint64_t v2766 = *(void *)(v3 + 26728);
        sub_7DFCC((_OWORD *)(*(void *)(v3 + 25976) + 64LL));
        sub_5A9B0((void *)(v3 + 15328), (void *)(v3 + 15968));
        sub_A178();
        sub_DEA48();
        sub_DE15C();
        sub_369F4();
        sub_DA1C();
        sub_B25F0();

        uint64_t v86 = sub_DEA50();
        sub_DED24((uint64_t)v86, type metadata accessor for SnippetHeaderModel);
        sub_72F7C(v87, &qword_189D00);
        uint64_t v88 = v2766;
LABEL_62:
        sub_279E0(v88, &qword_18B168);
LABEL_74:
        uint64_t v227 = sub_DCFFC();
        swift_task_dealloc(v227);
        sub_A8F4();
        sub_A85C();
        sub_A864();
        sub_A910();
        sub_A8EC();
        sub_A760();
        sub_A7C8();
        sub_A67C();
        uint64_t v228 = sub_A78C();
        uint64_t v236 = sub_A888(v228, v229, v230, v231, v232, v233, v234, v235, v728, v790, v852);
        uint64_t v244 = sub_A854(v236, v237, v238, v239, v240, v241, v242, v243, v729, v791, v853, v914);
        uint64_t v252 = sub_A84C(v244, v245, v246, v247, v248, v249, v250, v251, v730, v792, v854, v915, v975);
        uint64_t v260 = sub_A844(v252, v253, v254, v255, v256, v257, v258, v259, v731, v793, v855, v916, v976, v1035);
        uint64_t v268 = sub_A83C(v260, v261, v262, v263, v264, v265, v266, v267, v732, v794, v856, v917, v977, v1036, v1094);
        uint64_t v276 = sub_A95C( v268,  v269,  v270,  v271,  v272,  v273,  v274,  v275,  v733,  v795,  v857,  v918,  v978,  v1037,  v1095,  v1152);
        uint64_t v284 = sub_A954( v276,  v277,  v278,  v279,  v280,  v281,  v282,  v283,  v734,  v796,  v858,  v919,  v979,  v1038,  v1096,  v1153,  v1209);
        uint64_t v292 = sub_A938( v284,  v285,  v286,  v287,  v288,  v289,  v290,  v291,  v735,  v797,  v859,  v920,  v980,  v1039,  v1097,  v1154,  v1210,  v1265);
        uint64_t v300 = sub_A930( v292,  v293,  v294,  v295,  v296,  v297,  v298,  v299,  v736,  v798,  v860,  v921,  v981,  v1040,  v1098,  v1155,  v1211,  v1266,  v1320);
        uint64_t v308 = sub_A928( v300,  v301,  v302,  v303,  v304,  v305,  v306,  v307,  v737,  v799,  v861,  v922,  v982,  v1041,  v1099,  v1156,  v1212,  v1267,  v1321,  v1374);
        uint64_t v316 = sub_A920( v308,  v309,  v310,  v311,  v312,  v313,  v314,  v315,  v738,  v800,  v862,  v923,  v983,  v1042,  v1100,  v1157,  v1213,  v1268,  v1322,  v1375,  v1427);
        uint64_t v324 = sub_36374( v316,  v317,  v318,  v319,  v320,  v321,  v322,  v323,  v739,  v801,  v863,  v924,  v984,  v1043,  v1101,  v1158,  v1214,  v1269,  v1323,  v1376,  v1428,  v1479);
        uint64_t v332 = sub_3636C( v324,  v325,  v326,  v327,  v328,  v329,  v330,  v331,  v740,  v802,  v864,  v925,  v985,  v1044,  v1102,  v1159,  v1215,  v1270,  v1324,  v1377,  v1429,  v1480,  v1530);
        uint64_t v340 = sub_36364( v332,  v333,  v334,  v335,  v336,  v337,  v338,  v339,  v741,  v803,  v865,  v926,  v986,  v1045,  v1103,  v1160,  v1216,  v1271,  v1325,  v1378,  v1430,  v1481,  v1531,  v1580);
        uint64_t v348 = sub_363F0( v340,  v341,  v342,  v343,  v344,  v345,  v346,  v347,  v742,  v804,  v866,  v927,  v987,  v1046,  v1104,  v1161,  v1217,  v1272,  v1326,  v1379,  v1431,  v1482,  v1532,  v1581,  v1629);
        uint64_t v356 = sub_36430( v348,  v349,  v350,  v351,  v352,  v353,  v354,  v355,  v743,  v805,  v867,  v928,  v988,  v1047,  v1105,  v1162,  v1218,  v1273,  v1327,  v1380,  v1432,  v1483,  v1533,  v1582,  v1630,  v1677);
        uint64_t v364 = sub_36428( v356,  v357,  v358,  v359,  v360,  v361,  v362,  v363,  v744,  v806,  v868,  v929,  v989,  v1048,  v1106,  v1163,  v1219,  v1274,  v1328,  v1381,  v1433,  v1484,  v1534,  v1583,  v1631,  v1678,  v1724);
        uint64_t v372 = sub_36478( v364,  v365,  v366,  v367,  v368,  v369,  v370,  v371,  v745,  v807,  v869,  v930,  v990,  v1049,  v1107,  v1164,  v1220,  v1275,  v1329,  v1382,  v1434,  v1485,  v1535,  v1584,  v1632,  v1679,  v1725,  v1770);
        uint64_t v380 = sub_36524( v372,  v373,  v374,  v375,  v376,  v377,  v378,  v379,  v746,  v808,  v870,  v931,  v991,  v1050,  v1108,  v1165,  v1221,  v1276,  v1330,  v1383,  v1435,  v1486,  v1536,  v1585,  v1633,  v1680,  v1726,  v1771,  v1815);
        uint64_t v388 = sub_3651C( v380,  v381,  v382,  v383,  v384,  v385,  v386,  v387,  v747,  v809,  v871,  v932,  v992,  v1051,  v1109,  v1166,  v1222,  v1277,  v1331,  v1384,  v1436,  v1487,  v1537,  v1586,  v1634,  v1681,  v1727,  v1772,  v1816,  v1859);
        uint64_t v396 = sub_36514( v388,  v389,  v390,  v391,  v392,  v393,  v394,  v395,  v748,  v810,  v872,  v933,  v993,  v1052,  v1110,  v1167,  v1223,  v1278,  v1332,  v1385,  v1437,  v1488,  v1538,  v1587,  v1635,  v1682,  v1728,  v1773,  v1817,  v1860,  v1902);
        uint64_t v404 = sub_3650C( v396,  v397,  v398,  v399,  v400,  v401,  v402,  v403,  v749,  v811,  v873,  v934,  v994,  v1053,  v1111,  v1168,  v1224,  v1279,  v1333,  v1386,  v1438,  v1489,  v1539,  v1588,  v1636,  v1683,  v1729,  v1774,  v1818,  v1861,  v1903,  v1944);
        uint64_t v412 = sub_36504( v404,  v405,  v406,  v407,  v408,  v409,  v410,  v411,  v750,  v812,  v874,  v935,  v995,  v1054,  v1112,  v1169,  v1225,  v1280,  v1334,  v1387,  v1439,  v1490,  v1540,  v1589,  v1637,  v1684,  v1730,  v1775,  v1819,  v1862,  v1904,  v1945,  v1985);
        uint64_t v420 = sub_364FC( v412,  v413,  v414,  v415,  v416,  v417,  v418,  v419,  v751,  v813,  v875,  v936,  v996,  v1055,  v1113,  v1170,  v1226,  v1281,  v1335,  v1388,  v1440,  v1491,  v1541,  v1590,  v1638,  v1685,  v1731,  v1776,  v1820,  v1863,  v1905,  v1946,  v1986,  v2025);
        uint64_t v428 = sub_364F4( v420,  v421,  v422,  v423,  v424,  v425,  v426,  v427,  v752,  v814,  v876,  v937,  v997,  v1056,  v1114,  v1171,  v1227,  v1282,  v1336,  v1389,  v1441,  v1492,  v1542,  v1591,  v1639,  v1686,  v1732,  v1777,  v1821,  v1864,  v1906,  v1947,  v1987,  v2026,  v2064);
        uint64_t v436 = sub_364EC( v428,  v429,  v430,  v431,  v432,  v433,  v434,  v435,  v753,  v815,  v877,  v938,  v998,  v1057,  v1115,  v1172,  v1228,  v1283,  v1337,  v1390,  v1442,  v1493,  v1543,  v1592,  v1640,  v1687,  v1733,  v1778,  v1822,  v1865,  v1907,  v1948,  v1988,  v2027,  v2065,  v2102);
        uint64_t v444 = sub_364E4( v436,  v437,  v438,  v439,  v440,  v441,  v442,  v443,  v754,  v816,  v878,  v939,  v999,  v1058,  v1116,  v1173,  v1229,  v1284,  v1338,  v1391,  v1443,  v1494,  v1544,  v1593,  v1641,  v1688,  v1734,  v1779,  v1823,  v1866,  v1908,  v1949,  v1989,  v2028,  v2066,  v2103,  v2139);
        uint64_t v452 = sub_364DC( v444,  v445,  v446,  v447,  v448,  v449,  v450,  v451,  v755,  v817,  v879,  v940,  v1000,  v1059,  v1117,  v1174,  v1230,  v1285,  v1339,  v1392,  v1444,  v1495,  v1545,  v1594,  v1642,  v1689,  v1735,  v1780,  v1824,  v1867,  v1909,  v1950,  v1990,  v2029,  v2067,  v2104,  v2140,  v2175);
        uint64_t v460 = sub_364D4( v452,  v453,  v454,  v455,  v456,  v457,  v458,  v459,  v756,  v818,  v880,  v941,  v1001,  v1060,  v1118,  v1175,  v1231,  v1286,  v1340,  v1393,  v1445,  v1496,  v1546,  v1595,  v1643,  v1690,  v1736,  v1781,  v1825,  v1868,  v1910,  v1951,  v1991,  v2030,  v2068,  v2105,  v2141,  v2176,  v2210);
        uint64_t v468 = sub_366F8( v460,  v461,  v462,  v463,  v464,  v465,  v466,  v467,  v757,  v819,  v881,  v942,  v1002,  v1061,  v1119,  v1176,  v1232,  v1287,  v1341,  v1394,  v1446,  v1497,  v1547,  v1596,  v1644,  v1691,  v1737,  v1782,  v1826,  v1869,  v1911,  v1952,  v1992,  v2031,  v2069,  v2106,  v2142,  v2177,  v2211,  v2244);
        uint64_t v476 = sub_366F0( v468,  v469,  v470,  v471,  v472,  v473,  v474,  v475,  v758,  v820,  v882,  v943,  v1003,  v1062,  v1120,  v1177,  v1233,  v1288,  v1342,  v1395,  v1447,  v1498,  v1548,  v1597,  v1645,  v1692,  v1738,  v1783,  v1827,  v1870,  v1912,  v1953,  v1993,  v2032,  v2070,  v2107,  v2143,  v2178,  v2212,  v2245,  v2277);
        uint64_t v484 = sub_36B90( v476,  v477,  v478,  v479,  v480,  v481,  v482,  v483,  v759,  v821,  v883,  v944,  v1004,  v1063,  v1121,  v1178,  v1234,  v1289,  v1343,  v1396,  v1448,  v1499,  v1549,  v1598,  v1646,  v1693,  v1739,  v1784,  v1828,  v1871,  v1913,  v1954,  v1994,  v2033,  v2071,  v2108,  v2144,  v2179,  v2213,  v2246,  v2278,  v2309);
        uint64_t v492 = sub_36EF4( v484,  v485,  v486,  v487,  v488,  v489,  v490,  v491,  v760,  v822,  v884,  v945,  v1005,  v1064,  v1122,  v1179,  v1235,  v1290,  v1344,  v1397,  v1449,  v1500,  v1550,  v1599,  v1647,  v1694,  v1740,  v1785,  v1829,  v1872,  v1914,  v1955,  v1995,  v2034,  v2072,  v2109,  v2145,  v2180,  v2214,  v2247,  v2279,  v2310,  v2340);
        uint64_t v500 = sub_36EEC( v492,  v493,  v494,  v495,  v496,  v497,  v498,  v499,  v761,  v823,  v885,  v946,  v1006,  v1065,  v1123,  v1180,  v1236,  v1291,  v1345,  v1398,  v1450,  v1501,  v1551,  v1600,  v1648,  v1695,  v1741,  v1786,  v1830,  v1873,  v1915,  v1956,  v1996,  v2035,  v2073,  v2110,  v2146,  v2181,  v2215,  v2248,  v2280,  v2311,  v2341,  v2370);
        uint64_t v508 = sub_DD7E4( v500,  v501,  v502,  v503,  v504,  v505,  v506,  v507,  v762,  v824,  v886,  v947,  v1007,  v1066,  v1124,  v1181,  v1237,  v1292,  v1346,  v1399,  v1451,  v1502,  v1552,  v1601,  v1649,  v1696,  v1742,  v1787,  v1831,  v1874,  v1916,  v1957,  v1997,  v2036,  v2074,  v2111,  v2147,  v2182,  v2216,  v2249,  v2281,  v2312,  v2342,  v2371,  v2399);
        uint64_t v516 = sub_DD7DC( v508,  v509,  v510,  v511,  v512,  v513,  v514,  v515,  v763,  v825,  v887,  v948,  v1008,  v1067,  v1125,  v1182,  v1238,  v1293,  v1347,  v1400,  v1452,  v1503,  v1553,  v1602,  v1650,  v1697,  v1743,  v1788,  v1832,  v1875,  v1917,  v1958,  v1998,  v2037,  v2075,  v2112,  v2148,  v2183,  v2217,  v2250,  v2282,  v2313,  v2343,  v2372,  v2400,  v2427);
        uint64_t v524 = sub_DD7D4( v516,  v517,  v518,  v519,  v520,  v521,  v522,  v523,  v764,  v826,  v888,  v949,  v1009,  v1068,  v1126,  v1183,  v1239,  v1294,  v1348,  v1401,  v1453,  v1504,  v1554,  v1603,  v1651,  v1698,  v1744,  v1789,  v1833,  v1876,  v1918,  v1959,  v1999,  v2038,  v2076,  v2113,  v2149,  v2184,  v2218,  v2251,  v2283,  v2314,  v2344,  v2373,  v2401,  v2428,  v2454);
        uint64_t v532 = sub_DD7CC( v524,  v525,  v526,  v527,  v528,  v529,  v530,  v531,  v765,  v827,  v889,  v950,  v1010,  v1069,  v1127,  v1184,  v1240,  v1295,  v1349,  v1402,  v1454,  v1505,  v1555,  v1604,  v1652,  v1699,  v1745,  v1790,  v1834,  v1877,  v1919,  v1960,  v2000,  v2039,  v2077,  v2114,  v2150,  v2185,  v2219,  v2252,  v2284,  v2315,  v2345,  v2374,  v2402,  v2429,  v2455,  v2480);
        uint64_t v540 = sub_DD7C4( v532,  v533,  v534,  v535,  v536,  v537,  v538,  v539,  v766,  v828,  v890,  v951,  v1011,  v1070,  v1128,  v1185,  v1241,  v1296,  v1350,  v1403,  v1455,  v1506,  v1556,  v1605,  v1653,  v1700,  v1746,  v1791,  v1835,  v1878,  v1920,  v1961,  v2001,  v2040,  v2078,  v2115,  v2151,  v2186,  v2220,  v2253,  v2285,  v2316,  v2346,  v2375,  v2403,  v2430,  v2456,  v2481,  v2505);
        uint64_t v548 = sub_DD7BC( v540,  v541,  v542,  v543,  v544,  v545,  v546,  v547,  v767,  v829,  v891,  v952,  v1012,  v1071,  v1129,  v1186,  v1242,  v1297,  v1351,  v1404,  v1456,  v1507,  v1557,  v1606,  v1654,  v1701,  v1747,  v1792,  v1836,  v1879,  v1921,  v1962,  v2002,  v2041,  v2079,  v2116,  v2152,  v2187,  v2221,  v2254,  v2286,  v2317,  v2347,  v2376,  v2404,  v2431,  v2457,  v2482,  v2506,
                 v2529);
        uint64_t v556 = sub_DD7B4( v548,  v549,  v550,  v551,  v552,  v553,  v554,  v555,  v768,  v830,  v892,  v953,  v1013,  v1072,  v1130,  v1187,  v1243,  v1298,  v1352,  v1405,  v1457,  v1508,  v1558,  v1607,  v1655,  v1702,  v1748,  v1793,  v1837,  v1880,  v1922,  v1963,  v2003,  v2042,  v2080,  v2117,  v2153,  v2188,  v2222,  v2255,  v2287,  v2318,  v2348,  v2377,  v2405,  v2432,  v2458,  v2483,  v2507,
                 v2530,
                 v2552);
        uint64_t v564 = sub_DD7AC( v556,  v557,  v558,  v559,  v560,  v561,  v562,  v563,  v769,  v831,  v893,  v954,  v1014,  v1073,  v1131,  v1188,  v1244,  v1299,  v1353,  v1406,  v1458,  v1509,  v1559,  v1608,  v1656,  v1703,  v1749,  v1794,  v1838,  v1881,  v1923,  v1964,  v2004,  v2043,  v2081,  v2118,  v2154,  v2189,  v2223,  v2256,  v2288,  v2319,  v2349,  v2378,  v2406,  v2433,  v2459,  v2484,  v2508,
                 v2531,
                 v2553,
                 v2574);
        uint64_t v572 = sub_DD7A4( v564,  v565,  v566,  v567,  v568,  v569,  v570,  v571,  v770,  v832,  v894,  v955,  v1015,  v1074,  v1132,  v1189,  v1245,  v1300,  v1354,  v1407,  v1459,  v1510,  v1560,  v1609,  v1657,  v1704,  v1750,  v1795,  v1839,  v1882,  v1924,  v1965,  v2005,  v2044,  v2082,  v2119,  v2155,  v2190,  v2224,  v2257,  v2289,  v2320,  v2350,  v2379,  v2407,  v2434,  v2460,  v2485,  v2509,
                 v2532,
                 v2554,
                 v2575,
                 v2595);
        uint64_t v580 = sub_DD79C( v572,  v573,  v574,  v575,  v576,  v577,  v578,  v579,  v771,  v833,  v895,  v956,  v1016,  v1075,  v1133,  v1190,  v1246,  v1301,  v1355,  v1408,  v1460,  v1511,  v1561,  v1610,  v1658,  v1705,  v1751,  v1796,  v1840,  v1883,  v1925,  v1966,  v2006,  v2045,  v2083,  v2120,  v2156,  v2191,  v2225,  v2258,  v2290,  v2321,  v2351,  v2380,  v2408,  v2435,  v2461,  v2486,  v2510,
                 v2533,
                 v2555,
                 v2576,
                 v2596,
                 v2615);
        uint64_t v588 = sub_DD794( v580,  v581,  v582,  v583,  v584,  v585,  v586,  v587,  v772,  v834,  v896,  v957,  v1017,  v1076,  v1134,  v1191,  v1247,  v1302,  v1356,  v1409,  v1461,  v1512,  v1562,  v1611,  v1659,  v1706,  v1752,  v1797,  v1841,  v1884,  v1926,  v1967,  v2007,  v2046,  v2084,  v2121,  v2157,  v2192,  v2226,  v2259,  v2291,  v2322,  v2352,  v2381,  v2409,  v2436,  v2462,  v2487,  v2511,
                 v2534,
                 v2556,
                 v2577,
                 v2597,
                 v2616,
                 v2634);
        uint64_t v596 = sub_DD78C( v588,  v589,  v590,  v591,  v592,  v593,  v594,  v595,  v773,  v835,  v897,  v958,  v1018,  v1077,  v1135,  v1192,  v1248,  v1303,  v1357,  v1410,  v1462,  v1513,  v1563,  v1612,  v1660,  v1707,  v1753,  v1798,  v1842,  v1885,  v1927,  v1968,  v2008,  v2047,  v2085,  v2122,  v2158,  v2193,  v2227,  v2260,  v2292,  v2323,  v2353,  v2382,  v2410,  v2437,  v2463,  v2488,  v2512,
                 v2535,
                 v2557,
                 v2578,
                 v2598,
                 v2617,
                 v2635,
                 v2652);
        uint64_t v604 = sub_DD784( v596,  v597,  v598,  v599,  v600,  v601,  v602,  v603,  v774,  v836,  v898,  v959,  v1019,  v1078,  v1136,  v1193,  v1249,  v1304,  v1358,  v1411,  v1463,  v1514,  v1564,  v1613,  v1661,  v1708,  v1754,  v1799,  v1843,  v1886,  v1928,  v1969,  v2009,  v2048,  v2086,  v2123,  v2159,  v2194,  v2228,  v2261,  v2293,  v2324,  v2354,  v2383,  v2411,  v2438,  v2464,  v2489,  v2513,
                 v2536,
                 v2558,
                 v2579,
                 v2599,
                 v2618,
                 v2636,
                 v2653,
                 v2669);
        uint64_t v612 = sub_DD77C( v604,  v605,  v606,  v607,  v608,  v609,  v610,  v611,  v775,  v837,  v899,  v960,  v1020,  v1079,  v1137,  v1194,  v1250,  v1305,  v1359,  v1412,  v1464,  v1515,  v1565,  v1614,  v1662,  v1709,  v1755,  v1800,  v1844,  v1887,  v1929,  v1970,  v2010,  v2049,  v2087,  v2124,  v2160,  v2195,  v2229,  v2262,  v2294,  v2325,  v2355,  v2384,  v2412,  v2439,  v2465,  v2490,  v2514,
                 v2537,
                 v2559,
                 v2580,
                 v2600,
                 v2619,
                 v2637,
                 v2654,
                 v2670,
                 v2685);
        uint64_t v620 = sub_DD774( v612,  v613,  v614,  v615,  v616,  v617,  v618,  v619,  v776,  v838,  v900,  v961,  v1021,  v1080,  v1138,  v1195,  v1251,  v1306,  v1360,  v1413,  v1465,  v1516,  v1566,  v1615,  v1663,  v1710,  v1756,  v1801,  v1845,  v1888,  v1930,  v1971,  v2011,  v2050,  v2088,  v2125,  v2161,  v2196,  v2230,  v2263,  v2295,  v2326,  v2356,  v2385,  v2413,  v2440,  v2466,  v2491,  v2515,
                 v2538,
                 v2560,
                 v2581,
                 v2601,
                 v2620,
                 v2638,
                 v2655,
                 v2671,
                 v2686,
                 v2700);
        uint64_t v628 = sub_DD76C( v620,  v621,  v622,  v623,  v624,  v625,  v626,  v627,  v777,  v839,  v901,  v962,  v1022,  v1081,  v1139,  v1196,  v1252,  v1307,  v1361,  v1414,  v1466,  v1517,  v1567,  v1616,  v1664,  v1711,  v1757,  v1802,  v1846,  v1889,  v1931,  v1972,  v2012,  v2051,  v2089,  v2126,  v2162,  v2197,  v2231,  v2264,  v2296,  v2327,  v2357,  v2386,  v2414,  v2441,  v2467,  v2492,  v2516,
                 v2539,
                 v2561,
                 v2582,
                 v2602,
                 v2621,
                 v2639,
                 v2656,
                 v2672,
                 v2687,
                 v2701,
                 v2714);
        uint64_t v636 = sub_DD764( v628,  v629,  v630,  v631,  v632,  v633,  v634,  v635,  v778,  v840,  v902,  v963,  v1023,  v1082,  v1140,  v1197,  v1253,  v1308,  v1362,  v1415,  v1467,  v1518,  v1568,  v1617,  v1665,  v1712,  v1758,  v1803,  v1847,  v1890,  v1932,  v1973,  v2013,  v2052,  v2090,  v2127,  v2163,  v2198,  v2232,  v2265,  v2297,  v2328,  v2358,  v2387,  v2415,  v2442,  v2468,  v2493,  v2517,
                 v2540,
                 v2562,
                 v2583,
                 v2603,
                 v2622,
                 v2640,
                 v2657,
                 v2673,
                 v2688,
                 v2702,
                 v2715,
                 v2727);
        uint64_t v644 = sub_DD75C( v636,  v637,  v638,  v639,  v640,  v641,  v642,  v643,  v779,  v841,  v903,  v964,  v1024,  v1083,  v1141,  v1198,  v1254,  v1309,  v1363,  v1416,  v1468,  v1519,  v1569,  v1618,  v1666,  v1713,  v1759,  v1804,  v1848,  v1891,  v1933,  v1974,  v2014,  v2053,  v2091,  v2128,  v2164,  v2199,  v2233,  v2266,  v2298,  v2329,  v2359,  v2388,  v2416,  v2443,  v2469,  v2494,  v2518,
                 v2541,
                 v2563,
                 v2584,
                 v2604,
                 v2623,
                 v2641,
                 v2658,
                 v2674,
                 v2689,
                 v2703,
                 v2716,
                 v2728,
                 v2739);
        uint64_t v652 = sub_DD754( v644,  v645,  v646,  v647,  v648,  v649,  v650,  v651,  v780,  v842,  v904,  v965,  v1025,  v1084,  v1142,  v1199,  v1255,  v1310,  v1364,  v1417,  v1469,  v1520,  v1570,  v1619,  v1667,  v1714,  v1760,  v1805,  v1849,  v1892,  v1934,  v1975,  v2015,  v2054,  v2092,  v2129,  v2165,  v2200,  v2234,  v2267,  v2299,  v2330,  v2360,  v2389,  v2417,  v2444,  v2470,  v2495,  v2519,
                 v2542,
                 v2564,
                 v2585,
                 v2605,
                 v2624,
                 v2642,
                 v2659,
                 v2675,
                 v2690,
                 v2704,
                 v2717,
                 v2729,
                 v2740,
                 v2750);
        uint64_t v660 = sub_DD74C( v652,  v653,  v654,  v655,  v656,  v657,  v658,  v659,  v781,  v843,  v905,  v966,  v1026,  v1085,  v1143,  v1200,  v1256,  v1311,  v1365,  v1418,  v1470,  v1521,  v1571,  v1620,  v1668,  v1715,  v1761,  v1806,  v1850,  v1893,  v1935,  v1976,  v2016,  v2055,  v2093,  v2130,  v2166,  v2201,  v2235,  v2268,  v2300,  v2331,  v2361,  v2390,  v2418,  v2445,  v2471,  v2496,  v2520,
                 v2543,
                 v2565,
                 v2586,
                 v2606,
                 v2625,
                 v2643,
                 v2660,
                 v2676,
                 v2691,
                 v2705,
                 v2718,
                 v2730,
                 v2741,
                 v2751);
        uint64_t v668 = sub_DD744( v660,  v661,  v662,  v663,  v664,  v665,  v666,  v667,  v782,  v844,  v906,  v967,  v1027,  v1086,  v1144,  v1201,  v1257,  v1312,  v1366,  v1419,  v1471,  v1522,  v1572,  v1621,  v1669,  v1716,  v1762,  v1807,  v1851,  v1894,  v1936,  v1977,  v2017,  v2056,  v2094,  v2131,  v2167,  v2202,  v2236,  v2269,  v2301,  v2332,  v2362,  v2391,  v2419,  v2446,  v2472,  v2497,  v2521,
                 v2544,
                 v2566,
                 v2587,
                 v2607,
                 v2626,
                 v2644,
                 v2661,
                 v2677,
                 v2692,
                 v2706,
                 v2719,
                 v2731,
                 v2742,
                 v2752);
        uint64_t v676 = sub_DD73C( v668,  v669,  v670,  v671,  v672,  v673,  v674,  v675,  v783,  v845,  v907,  v968,  v1028,  v1087,  v1145,  v1202,  v1258,  v1313,  v1367,  v1420,  v1472,  v1523,  v1573,  v1622,  v1670,  v1717,  v1763,  v1808,  v1852,  v1895,  v1937,  v1978,  v2018,  v2057,  v2095,  v2132,  v2168,  v2203,  v2237,  v2270,  v2302,  v2333,  v2363,  v2392,  v2420,  v2447,  v2473,  v2498,  v2522,
                 v2545,
                 v2567,
                 v2588,
                 v2608,
                 v2627,
                 v2645,
                 v2662,
                 v2678,
                 v2693,
                 v2707,
                 v2720,
                 v2732,
                 v2743,
                 v2753);
        uint64_t v684 = sub_DD734( v676,  v677,  v678,  v679,  v680,  v681,  v682,  v683,  v784,  v846,  v908,  v969,  v1029,  v1088,  v1146,  v1203,  v1259,  v1314,  v1368,  v1421,  v1473,  v1524,  v1574,  v1623,  v1671,  v1718,  v1764,  v1809,  v1853,  v1896,  v1938,  v1979,  v2019,  v2058,  v2096,  v2133,  v2169,  v2204,  v2238,  v2271,  v2303,  v2334,  v2364,  v2393,  v2421,  v2448,  v2474,  v2499,  v2523,
                 v2546,
                 v2568,
                 v2589,
                 v2609,
                 v2628,
                 v2646,
                 v2663,
                 v2679,
                 v2694,
                 v2708,
                 v2721,
                 v2733,
                 v2744,
                 v2754);
        uint64_t v692 = sub_DD72C( v684,  v685,  v686,  v687,  v688,  v689,  v690,  v691,  v785,  v847,  v909,  v970,  v1030,  v1089,  v1147,  v1204,  v1260,  v1315,  v1369,  v1422,  v1474,  v1525,  v1575,  v1624,  v1672,  v1719,  v1765,  v1810,  v1854,  v1897,  v1939,  v1980,  v2020,  v2059,  v2097,  v2134,  v2170,  v2205,  v2239,  v2272,  v2304,  v2335,  v2365,  v2394,  v2422,  v2449,  v2475,  v2500,  v2524,
                 v2547,
                 v2569,
                 v2590,
                 v2610,
                 v2629,
                 v2647,
                 v2664,
                 v2680,
                 v2695,
                 v2709,
                 v2722,
                 v2734,
                 v2745,
                 v2755);
        uint64_t v700 = sub_DD724( v692,  v693,  v694,  v695,  v696,  v697,  v698,  v699,  v786,  v848,  v910,  v971,  v1031,  v1090,  v1148,  v1205,  v1261,  v1316,  v1370,  v1423,  v1475,  v1526,  v1576,  v1625,  v1673,  v1720,  v1766,  v1811,  v1855,  v1898,  v1940,  v1981,  v2021,  v2060,  v2098,  v2135,  v2171,  v2206,  v2240,  v2273,  v2305,  v2336,  v2366,  v2395,  v2423,  v2450,  v2476,  v2501,  v2525,
                 v2548,
                 v2570,
                 v2591,
                 v2611,
                 v2630,
                 v2648,
                 v2665,
                 v2681,
                 v2696,
                 v2710,
                 v2723,
                 v2735,
                 v2746,
                 v2756);
        uint64_t v708 = sub_DD71C( v700,  v701,  v702,  v703,  v704,  v705,  v706,  v707,  v787,  v849,  v911,  v972,  v1032,  v1091,  v1149,  v1206,  v1262,  v1317,  v1371,  v1424,  v1476,  v1527,  v1577,  v1626,  v1674,  v1721,  v1767,  v1812,  v1856,  v1899,  v1941,  v1982,  v2022,  v2061,  v2099,  v2136,  v2172,  v2207,  v2241,  v2274,  v2306,  v2337,  v2367,  v2396,  v2424,  v2451,  v2477,  v2502,  v2526,
                 v2549,
                 v2571,
                 v2592,
                 v2612,
                 v2631,
                 v2649,
                 v2666,
                 v2682,
                 v2697,
                 v2711,
                 v2724,
                 v2736,
                 v2747,
                 v2757);
        uint64_t v716 = sub_DD714( v708,  v709,  v710,  v711,  v712,  v713,  v714,  v715,  v788,  v850,  v912,  v973,  v1033,  v1092,  v1150,  v1207,  v1263,  v1318,  v1372,  v1425,  v1477,  v1528,  v1578,  v1627,  v1675,  v1722,  v1768,  v1813,  v1857,  v1900,  v1942,  v1983,  v2023,  v2062,  v2100,  v2137,  v2173,  v2208,  v2242,  v2275,  v2307,  v2338,  v2368,  v2397,  v2425,  v2452,  v2478,  v2503,  v2527,
                 v2550,
                 v2572,
                 v2593,
                 v2613,
                 v2632,
                 v2650,
                 v2667,
                 v2683,
                 v2698,
                 v2712,
                 v2725,
                 v2737,
                 v2748,
                 v2758);
        sub_DD70C( v716,  v717,  v718,  v719,  v720,  v721,  v722,  v723,  v789,  v851,  v913,  v974,  v1034,  v1093,  v1151,  v1208,  v1264,  v1319,  v1373,  v1426,  v1478,  v1529,  v1579,  v1628,  v1676,  v1723,  v1769,  v1814,  v1858,  v1901,  v1943,  v1984,  v2024,  v2063,  v2101,  v2138,  v2174,  v2209,  v2243,  v2276,  v2308,  v2339,  v2369,  v2398,  v2426,  v2453,  v2479,  v2504,  v2528,
          v2551,
          v2573,
          v2594,
          v2614,
          v2633,
          v2651,
          v2668,
          v2684,
          v2699,
          v2713,
          v2726,
          v2738,
          v2749,
          v2759);
        sub_DD704();
        sub_DD6FC();
        sub_DD6F4();
        sub_DD6EC();
        sub_DD6E4();
        sub_DD6DC();
        sub_DD6D4();
        sub_DD6CC();
        sub_DD6C4();
        sub_DD6BC();
        sub_DD6B4();
        sub_DD6AC();
        sub_DD6A4();
        sub_DD69C();
        sub_DD694();
        sub_DD68C();
        sub_DD684();
        sub_DD67C();
        sub_DD674();
        sub_DD66C();
        sub_DD664();
        sub_DD65C();
        sub_DD654();
        sub_DD64C();
        sub_DD644();
        sub_DD63C();
        sub_DD634();
        sub_DD62C();
        sub_DD624();
        sub_DD61C();
        sub_DD614();
        sub_DD60C();
        sub_DD604();
        sub_DD5FC();
        sub_DD5F4();
        sub_DD5EC();
        sub_DD5E4();
        sub_DD5DC();
        sub_DD5D4();
        sub_DD5CC();
        sub_DD5C4();
        sub_DD5BC();
        sub_DD5B4();
        sub_DD5AC();
        sub_DD5A4();
        sub_DD59C();
        sub_DD594();
        sub_DD58C();
        sub_DD584();
        sub_DD57C();
        sub_DD574();
        sub_DD56C();
        sub_DD564();
        sub_DD55C();
        sub_DD554();
        sub_DD54C();
        sub_DD544();
        sub_DD53C();
        sub_DD534();
        sub_DD52C();
        sub_DD524();
        sub_DD51C();
        sub_DD514();
        sub_DD50C();
        sub_DD504();
        sub_DD4FC();
        sub_DD4F4();
        sub_DD4EC();
        sub_DD4DC();
        sub_DD4E4();
        sub_DD868();
        sub_DD870();
        sub_DDA48();
        sub_DDA58();
        sub_DDE30();
        sub_DDE28();
        sub_DE6BC();
        sub_DE6B4();
        sub_DE6AC();
        sub_DE6A4();
        sub_DE69C();
        sub_DE694();
        sub_36B88();
        sub_366E8();
        sub_3677C();
        sub_36588();
        sub_36624();
        sub_3661C();
        sub_36614();
        sub_3660C();
        sub_36604();
        return sub_DDE8C(*(uint64_t (**)(void))(v3 + 8));
      }
  }

uint64_t sub_CBD54()
{
  v1[3497] = v5;
  sub_36900(v6);
  if (v0)
  {
    sub_DE844();
    uint64_t v7 = v1[3325];
    uint64_t v8 = v1[3322];
    swift_release();
    sub_2A184();
    sub_DE8A8();
    if (v10) {
      uint64_t v11 = v9;
    }
    else {
      uint64_t v11 = v2;
    }
    swift_bridgeObjectRelease(v11);
    sub_DDFD8();
    if (v10) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v3;
    }
    swift_bridgeObjectRelease(v13);
    sub_DDFCC();
    if (v10) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v4;
    }
    swift_bridgeObjectRelease(v15);
    sub_36860();
    sub_464D0(v8);
    sub_464D0(v7);
  }

  else
  {
    uint64_t v16 = v1[3322];
    swift_release();
    sub_DEC04(v16);
    uint64_t v17 = sub_BB0AC();
    sub_279E0(v17, v18);
  }

  sub_A964();
  return sub_DD94C(v19, v20, v21);
}

#error "CBE64: call analysis failed (funcsize=250)"
uint64_t sub_CC258()
{
  uint64_t v0;
  sub_AA10();
  sub_20264(*(void *)(v0 + 27992));
  sub_2A184();
  sub_AA20();
  sub_A964();
  return sub_D954();
}

uint64_t sub_CC2A4()
{
  uint64_t v1 = *(void **)(v0 + 27976);
  uint64_t v2 = *(void **)(v0 + 27952);
  uint64_t v2538 = *(void *)(v0 + 27552);
  uint64_t v2541 = *(void *)(v0 + 26688);
  uint64_t v2540 = *(void *)(v0 + 26616);
  uint64_t v2539 = *(void *)(v0 + 26088);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v0 + 21848));
  sub_369CC();
  sub_DE214(v0 + 21808);
  uint64_t v3 = sub_20308((uint64_t)&unk_180170, 56LL);
  sub_DDD10((__int128 *)(v0 + 21928), v3 + 16);
  *(void *)(v0 + 25896) = SimpleOutputFlowAsync.__allocating_init(outputPublisher:outputGenerator:)( &v2542,  &unk_18EA78,  v3);
  static ExecuteResponse.complete<A>(next:)(v0 + 25896);

  sub_369F4();
  swift_bridgeObjectRelease(v2538);
  sub_DE894();
  sub_DE540();
  sub_DED34();
  sub_26F04(v2539, type metadata accessor for SpecificMedCompletedLogModel);
  sub_DEC44(v4, &qword_189CF8);
  sub_DE8FC();
  sub_464D0(v2540);
  sub_DE82C(v5, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
  sub_DDC20(v6, type metadata accessor for SnippetHeaderModel);
  sub_464D0(v2541);
  sub_DDA68(v7, &qword_18B168);
  sub_37034();
  sub_DC288();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v8 = sub_A78C();
  uint64_t v16 = sub_A888(v8, v9, v10, v11, v12, v13, v14, v15, v506, v568, v630);
  uint64_t v24 = sub_A854(v16, v17, v18, v19, v20, v21, v22, v23, v507, v569, v631, v692);
  uint64_t v32 = sub_A84C(v24, v25, v26, v27, v28, v29, v30, v31, v508, v570, v632, v693, v753);
  uint64_t v40 = sub_A844(v32, v33, v34, v35, v36, v37, v38, v39, v509, v571, v633, v694, v754, v813);
  uint64_t v48 = sub_A83C(v40, v41, v42, v43, v44, v45, v46, v47, v510, v572, v634, v695, v755, v814, v872);
  uint64_t v56 = sub_A95C(v48, v49, v50, v51, v52, v53, v54, v55, v511, v573, v635, v696, v756, v815, v873, v930);
  uint64_t v64 = sub_A954(v56, v57, v58, v59, v60, v61, v62, v63, v512, v574, v636, v697, v757, v816, v874, v931, v987);
  uint64_t v72 = sub_A938(v64, v65, v66, v67, v68, v69, v70, v71, v513, v575, v637, v698, v758, v817, v875, v932, v988, v1043);
  uint64_t v80 = sub_A930( v72,  v73,  v74,  v75,  v76,  v77,  v78,  v79,  v514,  v576,  v638,  v699,  v759,  v818,  v876,  v933,  v989,  v1044,  v1098);
  uint64_t v88 = sub_A928( v80,  v81,  v82,  v83,  v84,  v85,  v86,  v87,  v515,  v577,  v639,  v700,  v760,  v819,  v877,  v934,  v990,  v1045,  v1099,  v1152);
  uint64_t v96 = sub_A920( v88,  v89,  v90,  v91,  v92,  v93,  v94,  v95,  v516,  v578,  v640,  v701,  v761,  v820,  v878,  v935,  v991,  v1046,  v1100,  v1153,  v1205);
  uint64_t v104 = sub_36374( v96,  v97,  v98,  v99,  v100,  v101,  v102,  v103,  v517,  v579,  v641,  v702,  v762,  v821,  v879,  v936,  v992,  v1047,  v1101,  v1154,  v1206,  v1257);
  uint64_t v112 = sub_3636C( v104,  v105,  v106,  v107,  v108,  v109,  v110,  v111,  v518,  v580,  v642,  v703,  v763,  v822,  v880,  v937,  v993,  v1048,  v1102,  v1155,  v1207,  v1258,  v1308);
  uint64_t v120 = sub_36364( v112,  v113,  v114,  v115,  v116,  v117,  v118,  v119,  v519,  v581,  v643,  v704,  v764,  v823,  v881,  v938,  v994,  v1049,  v1103,  v1156,  v1208,  v1259,  v1309,  v1358);
  uint64_t v128 = sub_363F0( v120,  v121,  v122,  v123,  v124,  v125,  v126,  v127,  v520,  v582,  v644,  v705,  v765,  v824,  v882,  v939,  v995,  v1050,  v1104,  v1157,  v1209,  v1260,  v1310,  v1359,  v1407);
  uint64_t v136 = sub_36430( v128,  v129,  v130,  v131,  v132,  v133,  v134,  v135,  v521,  v583,  v645,  v706,  v766,  v825,  v883,  v940,  v996,  v1051,  v1105,  v1158,  v1210,  v1261,  v1311,  v1360,  v1408,  v1455);
  uint64_t v144 = sub_36428( v136,  v137,  v138,  v139,  v140,  v141,  v142,  v143,  v522,  v584,  v646,  v707,  v767,  v826,  v884,  v941,  v997,  v1052,  v1106,  v1159,  v1211,  v1262,  v1312,  v1361,  v1409,  v1456,  v1502);
  uint64_t v152 = sub_36478( v144,  v145,  v146,  v147,  v148,  v149,  v150,  v151,  v523,  v585,  v647,  v708,  v768,  v827,  v885,  v942,  v998,  v1053,  v1107,  v1160,  v1212,  v1263,  v1313,  v1362,  v1410,  v1457,  v1503,  v1548);
  uint64_t v160 = sub_36524( v152,  v153,  v154,  v155,  v156,  v157,  v158,  v159,  v524,  v586,  v648,  v709,  v769,  v828,  v886,  v943,  v999,  v1054,  v1108,  v1161,  v1213,  v1264,  v1314,  v1363,  v1411,  v1458,  v1504,  v1549,  v1593);
  uint64_t v168 = sub_3651C( v160,  v161,  v162,  v163,  v164,  v165,  v166,  v167,  v525,  v587,  v649,  v710,  v770,  v829,  v887,  v944,  v1000,  v1055,  v1109,  v1162,  v1214,  v1265,  v1315,  v1364,  v1412,  v1459,  v1505,  v1550,  v1594,  v1637);
  uint64_t v176 = sub_36514( v168,  v169,  v170,  v171,  v172,  v173,  v174,  v175,  v526,  v588,  v650,  v711,  v771,  v830,  v888,  v945,  v1001,  v1056,  v1110,  v1163,  v1215,  v1266,  v1316,  v1365,  v1413,  v1460,  v1506,  v1551,  v1595,  v1638,  v1680);
  uint64_t v184 = sub_3650C( v176,  v177,  v178,  v179,  v180,  v181,  v182,  v183,  v527,  v589,  v651,  v712,  v772,  v831,  v889,  v946,  v1002,  v1057,  v1111,  v1164,  v1216,  v1267,  v1317,  v1366,  v1414,  v1461,  v1507,  v1552,  v1596,  v1639,  v1681,  v1722);
  uint64_t v192 = sub_36504( v184,  v185,  v186,  v187,  v188,  v189,  v190,  v191,  v528,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112,  v1165,  v1217,  v1268,  v1318,  v1367,  v1415,  v1462,  v1508,  v1553,  v1597,  v1640,  v1682,  v1723,  v1763);
  uint64_t v200 = sub_364FC( v192,  v193,  v194,  v195,  v196,  v197,  v198,  v199,  v529,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166,  v1218,  v1269,  v1319,  v1368,  v1416,  v1463,  v1509,  v1554,  v1598,  v1641,  v1683,  v1724,  v1764,  v1803);
  uint64_t v208 = sub_364F4( v200,  v201,  v202,  v203,  v204,  v205,  v206,  v207,  v530,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219,  v1270,  v1320,  v1369,  v1417,  v1464,  v1510,  v1555,  v1599,  v1642,  v1684,  v1725,  v1765,  v1804,  v1842);
  uint64_t v216 = sub_364EC( v208,  v209,  v210,  v211,  v212,  v213,  v214,  v215,  v531,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271,  v1321,  v1370,  v1418,  v1465,  v1511,  v1556,  v1600,  v1643,  v1685,  v1726,  v1766,  v1805,  v1843,  v1880);
  uint64_t v224 = sub_364E4( v216,  v217,  v218,  v219,  v220,  v221,  v222,  v223,  v532,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322,  v1371,  v1419,  v1466,  v1512,  v1557,  v1601,  v1644,  v1686,  v1727,  v1767,  v1806,  v1844,  v1881,  v1917);
  uint64_t v232 = sub_364DC( v224,  v225,  v226,  v227,  v228,  v229,  v230,  v231,  v533,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372,  v1420,  v1467,  v1513,  v1558,  v1602,  v1645,  v1687,  v1728,  v1768,  v1807,  v1845,  v1882,  v1918,  v1953);
  uint64_t v240 = sub_364D4( v232,  v233,  v234,  v235,  v236,  v237,  v238,  v239,  v534,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421,  v1468,  v1514,  v1559,  v1603,  v1646,  v1688,  v1729,  v1769,  v1808,  v1846,  v1883,  v1919,  v1954,  v1988);
  uint64_t v248 = sub_366F8( v240,  v241,  v242,  v243,  v244,  v245,  v246,  v247,  v535,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469,  v1515,  v1560,  v1604,  v1647,  v1689,  v1730,  v1770,  v1809,  v1847,  v1884,  v1920,  v1955,  v1989,  v2022);
  uint64_t v256 = sub_366F0( v248,  v249,  v250,  v251,  v252,  v253,  v254,  v255,  v536,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516,  v1561,  v1605,  v1648,  v1690,  v1731,  v1771,  v1810,  v1848,  v1885,  v1921,  v1956,  v1990,  v2023,  v2055);
  uint64_t v264 = sub_36B90( v256,  v257,  v258,  v259,  v260,  v261,  v262,  v263,  v537,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562,  v1606,  v1649,  v1691,  v1732,  v1772,  v1811,  v1849,  v1886,  v1922,  v1957,  v1991,  v2024,  v2056,  v2087);
  uint64_t v272 = sub_36EF4( v264,  v265,  v266,  v267,  v268,  v269,  v270,  v271,  v538,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607,  v1650,  v1692,  v1733,  v1773,  v1812,  v1850,  v1887,  v1923,  v1958,  v1992,  v2025,  v2057,  v2088,  v2118);
  uint64_t v280 = sub_36EEC( v272,  v273,  v274,  v275,  v276,  v277,  v278,  v279,  v539,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651,  v1693,  v1734,  v1774,  v1813,  v1851,  v1888,  v1924,  v1959,  v1993,  v2026,  v2058,  v2089,  v2119,  v2148);
  uint64_t v288 = sub_DD7E4( v280,  v281,  v282,  v283,  v284,  v285,  v286,  v287,  v540,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694,  v1735,  v1775,  v1814,  v1852,  v1889,  v1925,  v1960,  v1994,  v2027,  v2059,  v2090,  v2120,  v2149,  v2177);
  uint64_t v296 = sub_DD7DC( v288,  v289,  v290,  v291,  v292,  v293,  v294,  v295,  v541,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736,  v1776,  v1815,  v1853,  v1890,  v1926,  v1961,  v1995,  v2028,  v2060,  v2091,  v2121,  v2150,  v2178,  v2205);
  uint64_t v304 = sub_DD7D4( v296,  v297,  v298,  v299,  v300,  v301,  v302,  v303,  v542,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777,  v1816,  v1854,  v1891,  v1927,  v1962,  v1996,  v2029,  v2061,  v2092,  v2122,  v2151,  v2179,  v2206,  v2232);
  uint64_t v312 = sub_DD7CC( v304,  v305,  v306,  v307,  v308,  v309,  v310,  v311,  v543,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817,  v1855,  v1892,  v1928,  v1963,  v1997,  v2030,  v2062,  v2093,  v2123,  v2152,  v2180,  v2207,  v2233,  v2258);
  uint64_t v320 = sub_DD7C4( v312,  v313,  v314,  v315,  v316,  v317,  v318,  v319,  v544,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856,  v1893,  v1929,  v1964,  v1998,  v2031,  v2063,  v2094,  v2124,  v2153,  v2181,  v2208,  v2234,  v2259,  v2283);
  uint64_t v328 = sub_DD7BC( v320,  v321,  v322,  v323,  v324,  v325,  v326,  v327,  v545,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894,  v1930,  v1965,  v1999,  v2032,  v2064,  v2095,  v2125,  v2154,  v2182,  v2209,  v2235,  v2260,  v2284,
           v2307);
  uint64_t v336 = sub_DD7B4( v328,  v329,  v330,  v331,  v332,  v333,  v334,  v335,  v546,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931,  v1966,  v2000,  v2033,  v2065,  v2096,  v2126,  v2155,  v2183,  v2210,  v2236,  v2261,  v2285,
           v2308,
           v2330);
  uint64_t v344 = sub_DD7AC( v336,  v337,  v338,  v339,  v340,  v341,  v342,  v343,  v547,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967,  v2001,  v2034,  v2066,  v2097,  v2127,  v2156,  v2184,  v2211,  v2237,  v2262,  v2286,
           v2309,
           v2331,
           v2352);
  uint64_t v352 = sub_DD7A4( v344,  v345,  v346,  v347,  v348,  v349,  v350,  v351,  v548,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002,  v2035,  v2067,  v2098,  v2128,  v2157,  v2185,  v2212,  v2238,  v2263,  v2287,
           v2310,
           v2332,
           v2353,
           v2373);
  uint64_t v360 = sub_DD79C( v352,  v353,  v354,  v355,  v356,  v357,  v358,  v359,  v549,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036,  v2068,  v2099,  v2129,  v2158,  v2186,  v2213,  v2239,  v2264,  v2288,
           v2311,
           v2333,
           v2354,
           v2374,
           v2393);
  uint64_t v368 = sub_DD794( v360,  v361,  v362,  v363,  v364,  v365,  v366,  v367,  v550,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069,  v2100,  v2130,  v2159,  v2187,  v2214,  v2240,  v2265,  v2289,
           v2312,
           v2334,
           v2355,
           v2375,
           v2394,
           v2412);
  uint64_t v376 = sub_DD78C( v368,  v369,  v370,  v371,  v372,  v373,  v374,  v375,  v551,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101,  v2131,  v2160,  v2188,  v2215,  v2241,  v2266,  v2290,
           v2313,
           v2335,
           v2356,
           v2376,
           v2395,
           v2413,
           v2430);
  uint64_t v384 = sub_DD784( v376,  v377,  v378,  v379,  v380,  v381,  v382,  v383,  v552,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132,  v2161,  v2189,  v2216,  v2242,  v2267,  v2291,
           v2314,
           v2336,
           v2357,
           v2377,
           v2396,
           v2414,
           v2431,
           v2447);
  uint64_t v392 = sub_DD77C( v384,  v385,  v386,  v387,  v388,  v389,  v390,  v391,  v553,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162,  v2190,  v2217,  v2243,  v2268,  v2292,
           v2315,
           v2337,
           v2358,
           v2378,
           v2397,
           v2415,
           v2432,
           v2448,
           v2463);
  uint64_t v400 = sub_DD774( v392,  v393,  v394,  v395,  v396,  v397,  v398,  v399,  v554,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191,  v2218,  v2244,  v2269,  v2293,
           v2316,
           v2338,
           v2359,
           v2379,
           v2398,
           v2416,
           v2433,
           v2449,
           v2464,
           v2478);
  uint64_t v408 = sub_DD76C( v400,  v401,  v402,  v403,  v404,  v405,  v406,  v407,  v555,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219,  v2245,  v2270,  v2294,
           v2317,
           v2339,
           v2360,
           v2380,
           v2399,
           v2417,
           v2434,
           v2450,
           v2465,
           v2479,
           v2492);
  uint64_t v416 = sub_DD764( v408,  v409,  v410,  v411,  v412,  v413,  v414,  v415,  v556,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246,  v2271,  v2295,
           v2318,
           v2340,
           v2361,
           v2381,
           v2400,
           v2418,
           v2435,
           v2451,
           v2466,
           v2480,
           v2493,
           v2505);
  uint64_t v424 = sub_DD75C( v416,  v417,  v418,  v419,  v420,  v421,  v422,  v423,  v557,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272,  v2296,
           v2319,
           v2341,
           v2362,
           v2382,
           v2401,
           v2419,
           v2436,
           v2452,
           v2467,
           v2481,
           v2494,
           v2506,
           v2517);
  uint64_t v432 = sub_DD754( v424,  v425,  v426,  v427,  v428,  v429,  v430,  v431,  v558,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297,
           v2320,
           v2342,
           v2363,
           v2383,
           v2402,
           v2420,
           v2437,
           v2453,
           v2468,
           v2482,
           v2495,
           v2507,
           v2518,
           v2528);
  uint64_t v440 = sub_DD74C( v432,  v433,  v434,  v435,  v436,  v437,  v438,  v439,  v559,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321,
           v2343,
           v2364,
           v2384,
           v2403,
           v2421,
           v2438,
           v2454,
           v2469,
           v2483,
           v2496,
           v2508,
           v2519,
           v2529);
  uint64_t v448 = sub_DD744( v440,  v441,  v442,  v443,  v444,  v445,  v446,  v447,  v560,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344,
           v2365,
           v2385,
           v2404,
           v2422,
           v2439,
           v2455,
           v2470,
           v2484,
           v2497,
           v2509,
           v2520,
           v2530);
  uint64_t v456 = sub_DD73C( v448,  v449,  v450,  v451,  v452,  v453,  v454,  v455,  v561,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366,
           v2386,
           v2405,
           v2423,
           v2440,
           v2456,
           v2471,
           v2485,
           v2498,
           v2510,
           v2521,
           v2531);
  uint64_t v464 = sub_DD734( v456,  v457,  v458,  v459,  v460,  v461,  v462,  v463,  v562,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387,
           v2406,
           v2424,
           v2441,
           v2457,
           v2472,
           v2486,
           v2499,
           v2511,
           v2522,
           v2532);
  uint64_t v472 = sub_DD72C( v464,  v465,  v466,  v467,  v468,  v469,  v470,  v471,  v563,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407,
           v2425,
           v2442,
           v2458,
           v2473,
           v2487,
           v2500,
           v2512,
           v2523,
           v2533);
  uint64_t v480 = sub_DD724( v472,  v473,  v474,  v475,  v476,  v477,  v478,  v479,  v564,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426,
           v2443,
           v2459,
           v2474,
           v2488,
           v2501,
           v2513,
           v2524,
           v2534);
  uint64_t v488 = sub_DD71C( v480,  v481,  v482,  v483,  v484,  v485,  v486,  v487,  v565,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444,
           v2460,
           v2475,
           v2489,
           v2502,
           v2514,
           v2525,
           v2535);
  uint64_t v496 = sub_DD714( v488,  v489,  v490,  v491,  v492,  v493,  v494,  v495,  v566,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461,
           v2476,
           v2490,
           v2503,
           v2515,
           v2526,
           v2536);
  sub_DD70C( v496,  v497,  v498,  v499,  v500,  v501,  v502,  v503,  v567,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
    v2329,
    v2351,
    v2372,
    v2392,
    v2411,
    v2429,
    v2446,
    v2462,
    v2477,
    v2491,
    v2504,
    v2516,
    v2527,
    v2537);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  uint64_t v504 = (uint64_t (*)(void))sub_DE01C();
  return sub_36148(v504);
}

uint64_t sub_CC6C4()
{
  os_log_type_t v5 = sub_AB70();
  if (sub_46614(v5))
  {
    uint64_t v6 = (_WORD *)sub_3635C();
    sub_36908(v6);
    sub_DD494();
    sub_DA1C();
    sub_232EC(&dword_0, v0, v2, "Couldn't create specificMedicationSuccess_Dialog, returning GenericErrorFlow", v3);
    sub_37128();
  }

  else
  {

    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  sub_3747C();
  uint64_t v7 = (void *)v1[3494];
  uint64_t v8 = (void *)v1[3487];
  sub_DE90C();
  uint64_t v9 = v1[3327];
  sub_DDE20((_OWORD *)(v1[3247] + 64LL));
  sub_DE1C4(v1 + 836);
  sub_A178();
  sub_DDFA4();

  sub_369F4();
  sub_DA1C();
  sub_B25F0();

  sub_BB2EC();
  sub_DE464(v9);
  sub_DDC20(v10, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
  sub_DDE0C(v11, type metadata accessor for SnippetHeaderModel);
  sub_DE464(v2553);
  sub_DDBDC(v12, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v13 = sub_A78C();
  uint64_t v21 = sub_AAD8(v13, v14, v15, v16, v17, v18, v19, v20, v519, v582);
  uint64_t v29 = sub_A888(v21, v22, v23, v24, v25, v26, v27, v28, v520, v583, v645);
  uint64_t v37 = sub_A854(v29, v30, v31, v32, v33, v34, v35, v36, v521, v584, v646, v707);
  uint64_t v45 = sub_A84C(v37, v38, v39, v40, v41, v42, v43, v44, v522, v585, v647, v708, v768);
  uint64_t v53 = sub_A844(v45, v46, v47, v48, v49, v50, v51, v52, v523, v586, v648, v709, v769, v828);
  uint64_t v61 = sub_A83C(v53, v54, v55, v56, v57, v58, v59, v60, v524, v587, v649, v710, v770, v829, v887);
  uint64_t v69 = sub_A95C(v61, v62, v63, v64, v65, v66, v67, v68, v525, v588, v650, v711, v771, v830, v888, v945);
  uint64_t v77 = sub_A954(v69, v70, v71, v72, v73, v74, v75, v76, v526, v589, v651, v712, v772, v831, v889, v946, v1002);
  uint64_t v85 = sub_A938(v77, v78, v79, v80, v81, v82, v83, v84, v527, v590, v652, v713, v773, v832, v890, v947, v1003, v1058);
  uint64_t v93 = sub_A930( v85,  v86,  v87,  v88,  v89,  v90,  v91,  v92,  v528,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113);
  uint64_t v101 = sub_A928( v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167);
  uint64_t v109 = sub_A920( v101,  v102,  v103,  v104,  v105,  v106,  v107,  v108,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220);
  uint64_t v117 = sub_36374( v109,  v110,  v111,  v112,  v113,  v114,  v115,  v116,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272);
  uint64_t v125 = sub_3636C( v117,  v118,  v119,  v120,  v121,  v122,  v123,  v124,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323);
  uint64_t v133 = sub_36364( v125,  v126,  v127,  v128,  v129,  v130,  v131,  v132,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373);
  uint64_t v141 = sub_363F0( v133,  v134,  v135,  v136,  v137,  v138,  v139,  v140,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422);
  uint64_t v149 = sub_36430( v141,  v142,  v143,  v144,  v145,  v146,  v147,  v148,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470);
  uint64_t v157 = sub_36428( v149,  v150,  v151,  v152,  v153,  v154,  v155,  v156,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517);
  uint64_t v165 = sub_36478( v157,  v158,  v159,  v160,  v161,  v162,  v163,  v164,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563);
  uint64_t v173 = sub_36524( v165,  v166,  v167,  v168,  v169,  v170,  v171,  v172,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608);
  uint64_t v181 = sub_3651C( v173,  v174,  v175,  v176,  v177,  v178,  v179,  v180,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652);
  uint64_t v189 = sub_36514( v181,  v182,  v183,  v184,  v185,  v186,  v187,  v188,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695);
  uint64_t v197 = sub_3650C( v189,  v190,  v191,  v192,  v193,  v194,  v195,  v196,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737);
  uint64_t v205 = sub_36504( v197,  v198,  v199,  v200,  v201,  v202,  v203,  v204,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778);
  uint64_t v213 = sub_364FC( v205,  v206,  v207,  v208,  v209,  v210,  v211,  v212,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818);
  uint64_t v221 = sub_364F4( v213,  v214,  v215,  v216,  v217,  v218,  v219,  v220,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857);
  uint64_t v229 = sub_364EC( v221,  v222,  v223,  v224,  v225,  v226,  v227,  v228,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895);
  uint64_t v237 = sub_364E4( v229,  v230,  v231,  v232,  v233,  v234,  v235,  v236,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932);
  uint64_t v245 = sub_364DC( v237,  v238,  v239,  v240,  v241,  v242,  v243,  v244,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968);
  uint64_t v253 = sub_364D4( v245,  v246,  v247,  v248,  v249,  v250,  v251,  v252,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003);
  uint64_t v261 = sub_366F8( v253,  v254,  v255,  v256,  v257,  v258,  v259,  v260,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037);
  uint64_t v269 = sub_366F0( v261,  v262,  v263,  v264,  v265,  v266,  v267,  v268,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070);
  uint64_t v277 = sub_36B90( v269,  v270,  v271,  v272,  v273,  v274,  v275,  v276,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102);
  uint64_t v285 = sub_36EF4( v277,  v278,  v279,  v280,  v281,  v282,  v283,  v284,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133);
  uint64_t v293 = sub_36EEC( v285,  v286,  v287,  v288,  v289,  v290,  v291,  v292,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163);
  uint64_t v301 = sub_DD7E4( v293,  v294,  v295,  v296,  v297,  v298,  v299,  v300,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192);
  uint64_t v309 = sub_DD7DC( v301,  v302,  v303,  v304,  v305,  v306,  v307,  v308,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220);
  uint64_t v317 = sub_DD7D4( v309,  v310,  v311,  v312,  v313,  v314,  v315,  v316,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247);
  uint64_t v325 = sub_DD7CC( v317,  v318,  v319,  v320,  v321,  v322,  v323,  v324,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273);
  uint64_t v333 = sub_DD7C4( v325,  v326,  v327,  v328,  v329,  v330,  v331,  v332,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298);
  uint64_t v341 = sub_DD7BC( v333,  v334,  v335,  v336,  v337,  v338,  v339,  v340,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322);
  uint64_t v349 = sub_DD7B4( v341,  v342,  v343,  v344,  v345,  v346,  v347,  v348,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345);
  uint64_t v357 = sub_DD7AC( v349,  v350,  v351,  v352,  v353,  v354,  v355,  v356,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367);
  uint64_t v365 = sub_DD7A4( v357,  v358,  v359,  v360,  v361,  v362,  v363,  v364,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388);
  uint64_t v373 = sub_DD79C( v365,  v366,  v367,  v368,  v369,  v370,  v371,  v372,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408);
  uint64_t v381 = sub_DD794( v373,  v374,  v375,  v376,  v377,  v378,  v379,  v380,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427);
  uint64_t v389 = sub_DD78C( v381,  v382,  v383,  v384,  v385,  v386,  v387,  v388,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445);
  uint64_t v397 = sub_DD784( v389,  v390,  v391,  v392,  v393,  v394,  v395,  v396,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462);
  uint64_t v405 = sub_DD77C( v397,  v398,  v399,  v400,  v401,  v402,  v403,  v404,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463,
           v2478);
  uint64_t v413 = sub_DD774( v405,  v406,  v407,  v408,  v409,  v410,  v411,  v412,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479,
           v2493);
  uint64_t v421 = sub_DD76C( v413,  v414,  v415,  v416,  v417,  v418,  v419,  v420,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494,
           v2507);
  uint64_t v429 = sub_DD764( v421,  v422,  v423,  v424,  v425,  v426,  v427,  v428,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508,
           v2520);
  uint64_t v437 = sub_DD75C( v429,  v430,  v431,  v432,  v433,  v434,  v435,  v436,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521,
           v2532);
  uint64_t v445 = sub_DD754( v437,  v438,  v439,  v440,  v441,  v442,  v443,  v444,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533,
           v2543);
  uint64_t v453 = sub_DD74C( v445,  v446,  v447,  v448,  v449,  v450,  v451,  v452,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v461 = sub_DD744( v453,  v454,  v455,  v456,  v457,  v458,  v459,  v460,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v469 = sub_DD73C( v461,  v462,  v463,  v464,  v465,  v466,  v467,  v468,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v477 = sub_DD734( v469,  v470,  v471,  v472,  v473,  v474,  v475,  v476,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v485 = sub_DD72C( v477,  v478,  v479,  v480,  v481,  v482,  v483,  v484,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v493 = sub_DD724( v485,  v486,  v487,  v488,  v489,  v490,  v491,  v492,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v501 = sub_DD71C( v493,  v494,  v495,  v496,  v497,  v498,  v499,  v500,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  uint64_t v509 = sub_DD714( v501,  v502,  v503,  v504,  v505,  v506,  v507,  v508,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518,
           v2530,
           v2541,
           v2551);
  sub_DD70C( v509,  v510,  v511,  v512,  v513,  v514,  v515,  v516,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
    v2344,
    v2366,
    v2387,
    v2407,
    v2426,
    v2444,
    v2461,
    v2477,
    v2492,
    v2506,
    v2519,
    v2531,
    v2542,
    v2552);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v517 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v517);
}

uint64_t sub_CCAC4()
{
  os_log_type_t v2 = (void *)*v1;
  sub_36578();
  v2[3502] = v3;
  v2[3503] = v0;
  sub_36900(v4);
  uint64_t v5 = v2[3321];
  uint64_t v6 = v2[3320];
  swift_release();
  if (v0) {
    sub_36860();
  }
  sub_464D0(v6);
  sub_464D0(v5);
  sub_A964();
  return sub_363F8(v7, v8, v9);
}

uint64_t sub_CCB64()
{
  uint64_t v3 = sub_DE5BC();
  sub_36C4C(v3, (uint64_t)PhoneRingsSnippet.body.getter);
  uint64_t v4 = sub_368F8();
  id v5 = sub_36F04(v4, "catId");
  sub_36EE4();
  sub_DDCE8();
  sub_DDD30();
  sub_36CEC(v2);
  sub_36590((_OWORD *)(v1 + 64));
  sub_DE62C(v1 + 296);
  v0[3504] = *(void *)(v1 + 336);
  v0[3505] = *(void *)(v1 + 344);
  sub_363E8();
  sub_36C5C();
  uint64_t v6 = (void *)sub_3709C();
  v0[3506] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_CCC44;
  uint64_t v7 = sub_DE164();
  return sub_3619C(v7, v8, v9, v10, v11, v12, v13, v14);
}

uint64_t sub_CCC44()
{
  uint64_t v1 = (void *)(v0 + 23528);
  sub_20264(*(void *)(v0 + 28048));
  sub_36BE0();
  sub_36EBC();
  sub_36B74(v1);
  sub_20300();
  sub_A964();
  return sub_36348(v2, v3, v4);
}

uint64_t sub_CCCB0()
{
  if (*(void *)(v1 + 20832))
  {
    uint64_t v3 = *(void **)(v1 + 28016);
    uint64_t v4 = *(void **)(v1 + 27896);
    uint64_t v2565 = *(void **)(v1 + 27952);
    sub_20004((__int128 *)(v1 + 20808), v1 + 20768);
    sub_369CC();
    sub_36878(v1 + 20768);
    uint64_t v5 = sub_20308((uint64_t)&unk_180148, 56LL);
    sub_DDAC0(v5);
    *(void *)(v1 + 25880) = sub_DE278((uint64_t)&v2568, (uint64_t)&unk_18EA68);
    uint64_t v6 = sub_DE46C();
    static ExecuteResponse.complete<A>(next:)(v6);

    sub_2A184();
    sub_DE894();
    sub_DE7D8();

    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v1 + 20768));
    uint64_t v7 = sub_DE928();
    sub_37458(v7, type metadata accessor for SnippetHeaderModel);
    sub_DE154(v8, &qword_189D00);
    sub_37450(v9, &qword_18B168);
    sub_3652C();
  }

  else
  {
    sub_DE3B4(8928LL);
    uint64_t v10 = (void *)(v1 + 24584);
    sub_DE950();
    uint64_t v11 = *(void *)(v1 + 27024);
    sub_279E0(v12, &qword_18A448);
    sub_A5DC(v0, v1 + 24584);
    sub_DE2AC();
    sub_368A0();
    os_log_type_t v13 = sub_AB70();
    if (sub_46614(v13))
    {
      uint64_t v14 = *(void (**)(uint64_t))(v1 + 27888);
      uint64_t v15 = (_WORD *)sub_3635C();
      sub_DDA70(v15);
      sub_DDA34();
      sub_82234();
      sub_232EC( &dword_0,  (os_log_s *)(v1 + 24584),  (os_log_type_t)v11,  "Couldn't create output, returning GenericErrorFlow",  v2);
      sub_DDDAC();

      uint64_t v16 = sub_37104();
    }

    else
    {
      uint64_t v14 = *(void (**)(uint64_t))(v1 + 27888);
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);

      uint64_t v16 = sub_7DFE8();
    }

    v14(v16);
    uint64_t v17 = *(void **)(v1 + 28016);
    uint64_t v18 = *(void **)(v1 + 27896);
    sub_DEA80();
    uint64_t v2566 = *(void *)(v1 + 26432);
    uint64_t v19 = *(void *)(v1 + 26216);
    uint64_t v2563 = *(void *)(v1 + 26208);
    uint64_t v2564 = *(void *)(v1 + 26264);
    uint64_t v20 = (_OWORD *)sub_DE9EC();
    sub_DE1BC(v20);
    sub_DE338(v2567);
    sub_A178();
    sub_DED2C();

    sub_B25F0();
    sub_DA1C();
    sub_369F4();
    sub_DE48C();
    sub_DED1C();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v2564, v2563);
    sub_26F04(v2566, type metadata accessor for SnippetHeaderModel);
    sub_DE510(v21, &qword_189D00);
    sub_DE154(v22, &qword_18B168);
  }

  sub_DC6E0();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v23 = sub_A78C();
  uint64_t v31 = sub_AAD8(v23, v24, v25, v26, v27, v28, v29, v30, v529, v592);
  uint64_t v39 = sub_A888(v31, v32, v33, v34, v35, v36, v37, v38, v530, v593, v655);
  uint64_t v47 = sub_A854(v39, v40, v41, v42, v43, v44, v45, v46, v531, v594, v656, v717);
  uint64_t v55 = sub_A84C(v47, v48, v49, v50, v51, v52, v53, v54, v532, v595, v657, v718, v778);
  uint64_t v63 = sub_A844(v55, v56, v57, v58, v59, v60, v61, v62, v533, v596, v658, v719, v779, v838);
  uint64_t v71 = sub_A83C(v63, v64, v65, v66, v67, v68, v69, v70, v534, v597, v659, v720, v780, v839, v897);
  uint64_t v79 = sub_A95C(v71, v72, v73, v74, v75, v76, v77, v78, v535, v598, v660, v721, v781, v840, v898, v955);
  uint64_t v87 = sub_A954(v79, v80, v81, v82, v83, v84, v85, v86, v536, v599, v661, v722, v782, v841, v899, v956, v1012);
  uint64_t v95 = sub_A938(v87, v88, v89, v90, v91, v92, v93, v94, v537, v600, v662, v723, v783, v842, v900, v957, v1013, v1068);
  uint64_t v103 = sub_A930( v95,  v96,  v97,  v98,  v99,  v100,  v101,  v102,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123);
  uint64_t v111 = sub_A928( v103,  v104,  v105,  v106,  v107,  v108,  v109,  v110,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177);
  uint64_t v119 = sub_A920( v111,  v112,  v113,  v114,  v115,  v116,  v117,  v118,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230);
  uint64_t v127 = sub_36374( v119,  v120,  v121,  v122,  v123,  v124,  v125,  v126,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282);
  uint64_t v135 = sub_3636C( v127,  v128,  v129,  v130,  v131,  v132,  v133,  v134,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333);
  uint64_t v143 = sub_36364( v135,  v136,  v137,  v138,  v139,  v140,  v141,  v142,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383);
  uint64_t v151 = sub_363F0( v143,  v144,  v145,  v146,  v147,  v148,  v149,  v150,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432);
  uint64_t v159 = sub_36430( v151,  v152,  v153,  v154,  v155,  v156,  v157,  v158,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480);
  uint64_t v167 = sub_36428( v159,  v160,  v161,  v162,  v163,  v164,  v165,  v166,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527);
  uint64_t v175 = sub_36478( v167,  v168,  v169,  v170,  v171,  v172,  v173,  v174,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573);
  uint64_t v183 = sub_36524( v175,  v176,  v177,  v178,  v179,  v180,  v181,  v182,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618);
  uint64_t v191 = sub_3651C( v183,  v184,  v185,  v186,  v187,  v188,  v189,  v190,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662);
  uint64_t v199 = sub_36514( v191,  v192,  v193,  v194,  v195,  v196,  v197,  v198,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705);
  uint64_t v207 = sub_3650C( v199,  v200,  v201,  v202,  v203,  v204,  v205,  v206,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747);
  uint64_t v215 = sub_36504( v207,  v208,  v209,  v210,  v211,  v212,  v213,  v214,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788);
  uint64_t v223 = sub_364FC( v215,  v216,  v217,  v218,  v219,  v220,  v221,  v222,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828);
  uint64_t v231 = sub_364F4( v223,  v224,  v225,  v226,  v227,  v228,  v229,  v230,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867);
  uint64_t v239 = sub_364EC( v231,  v232,  v233,  v234,  v235,  v236,  v237,  v238,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905);
  uint64_t v247 = sub_364E4( v239,  v240,  v241,  v242,  v243,  v244,  v245,  v246,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942);
  uint64_t v255 = sub_364DC( v247,  v248,  v249,  v250,  v251,  v252,  v253,  v254,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978);
  uint64_t v263 = sub_364D4( v255,  v256,  v257,  v258,  v259,  v260,  v261,  v262,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013);
  uint64_t v271 = sub_366F8( v263,  v264,  v265,  v266,  v267,  v268,  v269,  v270,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047);
  uint64_t v279 = sub_366F0( v271,  v272,  v273,  v274,  v275,  v276,  v277,  v278,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080);
  uint64_t v287 = sub_36B90( v279,  v280,  v281,  v282,  v283,  v284,  v285,  v286,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112);
  uint64_t v295 = sub_36EF4( v287,  v288,  v289,  v290,  v291,  v292,  v293,  v294,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143);
  uint64_t v303 = sub_36EEC( v295,  v296,  v297,  v298,  v299,  v300,  v301,  v302,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173);
  uint64_t v311 = sub_DD7E4( v303,  v304,  v305,  v306,  v307,  v308,  v309,  v310,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202);
  uint64_t v319 = sub_DD7DC( v311,  v312,  v313,  v314,  v315,  v316,  v317,  v318,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230);
  uint64_t v327 = sub_DD7D4( v319,  v320,  v321,  v322,  v323,  v324,  v325,  v326,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257);
  uint64_t v335 = sub_DD7CC( v327,  v328,  v329,  v330,  v331,  v332,  v333,  v334,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283);
  uint64_t v343 = sub_DD7C4( v335,  v336,  v337,  v338,  v339,  v340,  v341,  v342,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308);
  uint64_t v351 = sub_DD7BC( v343,  v344,  v345,  v346,  v347,  v348,  v349,  v350,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332);
  uint64_t v359 = sub_DD7B4( v351,  v352,  v353,  v354,  v355,  v356,  v357,  v358,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355);
  uint64_t v367 = sub_DD7AC( v359,  v360,  v361,  v362,  v363,  v364,  v365,  v366,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377);
  uint64_t v375 = sub_DD7A4( v367,  v368,  v369,  v370,  v371,  v372,  v373,  v374,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398);
  uint64_t v383 = sub_DD79C( v375,  v376,  v377,  v378,  v379,  v380,  v381,  v382,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418);
  uint64_t v391 = sub_DD794( v383,  v384,  v385,  v386,  v387,  v388,  v389,  v390,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437);
  uint64_t v399 = sub_DD78C( v391,  v392,  v393,  v394,  v395,  v396,  v397,  v398,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455);
  uint64_t v407 = sub_DD784( v399,  v400,  v401,  v402,  v403,  v404,  v405,  v406,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472);
  uint64_t v415 = sub_DD77C( v407,  v408,  v409,  v410,  v411,  v412,  v413,  v414,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488);
  uint64_t v423 = sub_DD774( v415,  v416,  v417,  v418,  v419,  v420,  v421,  v422,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503);
  uint64_t v431 = sub_DD76C( v423,  v424,  v425,  v426,  v427,  v428,  v429,  v430,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517);
  uint64_t v439 = sub_DD764( v431,  v432,  v433,  v434,  v435,  v436,  v437,  v438,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518,
           v2530);
  uint64_t v447 = sub_DD75C( v439,  v440,  v441,  v442,  v443,  v444,  v445,  v446,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
           v2344,
           v2366,
           v2387,
           v2407,
           v2426,
           v2444,
           v2461,
           v2477,
           v2492,
           v2506,
           v2519,
           v2531,
           v2542);
  uint64_t v455 = sub_DD754( v447,  v448,  v449,  v450,  v451,  v452,  v453,  v454,  v582,  v645,  v707,  v768,  v828,  v887,  v945,  v1002,  v1058,  v1113,  v1167,  v1220,  v1272,  v1323,  v1373,  v1422,  v1470,  v1517,  v1563,  v1608,  v1652,  v1695,  v1737,  v1778,  v1818,  v1857,  v1895,  v1932,  v1968,  v2003,  v2037,  v2070,  v2102,  v2133,  v2163,  v2192,  v2220,  v2247,  v2273,  v2298,  v2322,
           v2345,
           v2367,
           v2388,
           v2408,
           v2427,
           v2445,
           v2462,
           v2478,
           v2493,
           v2507,
           v2520,
           v2532,
           v2543,
           v2553);
  uint64_t v463 = sub_DD74C( v455,  v456,  v457,  v458,  v459,  v460,  v461,  v462,  v583,  v646,  v708,  v769,  v829,  v888,  v946,  v1003,  v1059,  v1114,  v1168,  v1221,  v1273,  v1324,  v1374,  v1423,  v1471,  v1518,  v1564,  v1609,  v1653,  v1696,  v1738,  v1779,  v1819,  v1858,  v1896,  v1933,  v1969,  v2004,  v2038,  v2071,  v2103,  v2134,  v2164,  v2193,  v2221,  v2248,  v2274,  v2299,  v2323,
           v2346,
           v2368,
           v2389,
           v2409,
           v2428,
           v2446,
           v2463,
           v2479,
           v2494,
           v2508,
           v2521,
           v2533,
           v2544,
           v2554);
  uint64_t v471 = sub_DD744( v463,  v464,  v465,  v466,  v467,  v468,  v469,  v470,  v584,  v647,  v709,  v770,  v830,  v889,  v947,  v1004,  v1060,  v1115,  v1169,  v1222,  v1274,  v1325,  v1375,  v1424,  v1472,  v1519,  v1565,  v1610,  v1654,  v1697,  v1739,  v1780,  v1820,  v1859,  v1897,  v1934,  v1970,  v2005,  v2039,  v2072,  v2104,  v2135,  v2165,  v2194,  v2222,  v2249,  v2275,  v2300,  v2324,
           v2347,
           v2369,
           v2390,
           v2410,
           v2429,
           v2447,
           v2464,
           v2480,
           v2495,
           v2509,
           v2522,
           v2534,
           v2545,
           v2555);
  uint64_t v479 = sub_DD73C( v471,  v472,  v473,  v474,  v475,  v476,  v477,  v478,  v585,  v648,  v710,  v771,  v831,  v890,  v948,  v1005,  v1061,  v1116,  v1170,  v1223,  v1275,  v1326,  v1376,  v1425,  v1473,  v1520,  v1566,  v1611,  v1655,  v1698,  v1740,  v1781,  v1821,  v1860,  v1898,  v1935,  v1971,  v2006,  v2040,  v2073,  v2105,  v2136,  v2166,  v2195,  v2223,  v2250,  v2276,  v2301,  v2325,
           v2348,
           v2370,
           v2391,
           v2411,
           v2430,
           v2448,
           v2465,
           v2481,
           v2496,
           v2510,
           v2523,
           v2535,
           v2546,
           v2556);
  uint64_t v487 = sub_DD734( v479,  v480,  v481,  v482,  v483,  v484,  v485,  v486,  v586,  v649,  v711,  v772,  v832,  v891,  v949,  v1006,  v1062,  v1117,  v1171,  v1224,  v1276,  v1327,  v1377,  v1426,  v1474,  v1521,  v1567,  v1612,  v1656,  v1699,  v1741,  v1782,  v1822,  v1861,  v1899,  v1936,  v1972,  v2007,  v2041,  v2074,  v2106,  v2137,  v2167,  v2196,  v2224,  v2251,  v2277,  v2302,  v2326,
           v2349,
           v2371,
           v2392,
           v2412,
           v2431,
           v2449,
           v2466,
           v2482,
           v2497,
           v2511,
           v2524,
           v2536,
           v2547,
           v2557);
  uint64_t v495 = sub_DD72C( v487,  v488,  v489,  v490,  v491,  v492,  v493,  v494,  v587,  v650,  v712,  v773,  v833,  v892,  v950,  v1007,  v1063,  v1118,  v1172,  v1225,  v1277,  v1328,  v1378,  v1427,  v1475,  v1522,  v1568,  v1613,  v1657,  v1700,  v1742,  v1783,  v1823,  v1862,  v1900,  v1937,  v1973,  v2008,  v2042,  v2075,  v2107,  v2138,  v2168,  v2197,  v2225,  v2252,  v2278,  v2303,  v2327,
           v2350,
           v2372,
           v2393,
           v2413,
           v2432,
           v2450,
           v2467,
           v2483,
           v2498,
           v2512,
           v2525,
           v2537,
           v2548,
           v2558);
  uint64_t v503 = sub_DD724( v495,  v496,  v497,  v498,  v499,  v500,  v501,  v502,  v588,  v651,  v713,  v774,  v834,  v893,  v951,  v1008,  v1064,  v1119,  v1173,  v1226,  v1278,  v1329,  v1379,  v1428,  v1476,  v1523,  v1569,  v1614,  v1658,  v1701,  v1743,  v1784,  v1824,  v1863,  v1901,  v1938,  v1974,  v2009,  v2043,  v2076,  v2108,  v2139,  v2169,  v2198,  v2226,  v2253,  v2279,  v2304,  v2328,
           v2351,
           v2373,
           v2394,
           v2414,
           v2433,
           v2451,
           v2468,
           v2484,
           v2499,
           v2513,
           v2526,
           v2538,
           v2549,
           v2559);
  uint64_t v511 = sub_DD71C( v503,  v504,  v505,  v506,  v507,  v508,  v509,  v510,  v589,  v652,  v714,  v775,  v835,  v894,  v952,  v1009,  v1065,  v1120,  v1174,  v1227,  v1279,  v1330,  v1380,  v1429,  v1477,  v1524,  v1570,  v1615,  v1659,  v1702,  v1744,  v1785,  v1825,  v1864,  v1902,  v1939,  v1975,  v2010,  v2044,  v2077,  v2109,  v2140,  v2170,  v2199,  v2227,  v2254,  v2280,  v2305,  v2329,
           v2352,
           v2374,
           v2395,
           v2415,
           v2434,
           v2452,
           v2469,
           v2485,
           v2500,
           v2514,
           v2527,
           v2539,
           v2550,
           v2560);
  uint64_t v519 = sub_DD714( v511,  v512,  v513,  v514,  v515,  v516,  v517,  v518,  v590,  v653,  v715,  v776,  v836,  v895,  v953,  v1010,  v1066,  v1121,  v1175,  v1228,  v1280,  v1331,  v1381,  v1430,  v1478,  v1525,  v1571,  v1616,  v1660,  v1703,  v1745,  v1786,  v1826,  v1865,  v1903,  v1940,  v1976,  v2011,  v2045,  v2078,  v2110,  v2141,  v2171,  v2200,  v2228,  v2255,  v2281,  v2306,  v2330,
           v2353,
           v2375,
           v2396,
           v2416,
           v2435,
           v2453,
           v2470,
           v2486,
           v2501,
           v2515,
           v2528,
           v2540,
           v2551,
           v2561);
  sub_DD70C( v519,  v520,  v521,  v522,  v523,  v524,  v525,  v526,  v591,  v654,  v716,  v777,  v837,  v896,  v954,  v1011,  v1067,  v1122,  v1176,  v1229,  v1281,  v1332,  v1382,  v1431,  v1479,  v1526,  v1572,  v1617,  v1661,  v1704,  v1746,  v1787,  v1827,  v1866,  v1904,  v1941,  v1977,  v2012,  v2046,  v2079,  v2111,  v2142,  v2172,  v2201,  v2229,  v2256,  v2282,  v2307,  v2331,
    v2354,
    v2376,
    v2397,
    v2417,
    v2436,
    v2454,
    v2471,
    v2487,
    v2502,
    v2516,
    v2529,
    v2541,
    v2552,
    v2562);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_DDE30();
  sub_DDE28();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  uint64_t v527 = (uint64_t (*)(void))sub_DE600();
  return sub_36148(v527);
}

uint64_t sub_CD1F8()
{
  os_log_type_t v5 = sub_AB70();
  BOOL v6 = sub_46614(v5);
  uint64_t v7 = (void *)v1[3377];
  if (v6)
  {
    uint64_t v8 = (_WORD *)sub_3635C();
    sub_36908(v8);
    sub_DD494();
    sub_DA1C();
    sub_232EC(&dword_0, v0, v2, "Couldn't create specificMedicationLogFailed_Dialog, returning GenericErrorFlow", v3);
    sub_37128();
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  sub_3747C();
  uint64_t v9 = (void *)v1[3494];
  sub_DED84();
  sub_DE90C();
  sub_DE1BC((_OWORD *)(v1[3247] + 64LL));
  sub_DE338(v1 + 1216);
  sub_A178();
  static ExecuteResponse.complete<A>(next:)(v1 + 1216);

  sub_DA1C();
  sub_369F4();
  sub_36C34();

  uint64_t v10 = sub_DE304();
  sub_99450((uint64_t)v10, type metadata accessor for SnippetHeaderModel);
  sub_DDA68(v11, &qword_189D00);
  sub_DDBDC(v12, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v13 = sub_A78C();
  uint64_t v21 = sub_AAD8(v13, v14, v15, v16, v17, v18, v19, v20, v519, v582);
  uint64_t v29 = sub_A888(v21, v22, v23, v24, v25, v26, v27, v28, v520, v583, v645);
  uint64_t v37 = sub_A854(v29, v30, v31, v32, v33, v34, v35, v36, v521, v584, v646, v707);
  uint64_t v45 = sub_A84C(v37, v38, v39, v40, v41, v42, v43, v44, v522, v585, v647, v708, v768);
  uint64_t v53 = sub_A844(v45, v46, v47, v48, v49, v50, v51, v52, v523, v586, v648, v709, v769, v828);
  uint64_t v61 = sub_A83C(v53, v54, v55, v56, v57, v58, v59, v60, v524, v587, v649, v710, v770, v829, v887);
  uint64_t v69 = sub_A95C(v61, v62, v63, v64, v65, v66, v67, v68, v525, v588, v650, v711, v771, v830, v888, v945);
  uint64_t v77 = sub_A954(v69, v70, v71, v72, v73, v74, v75, v76, v526, v589, v651, v712, v772, v831, v889, v946, v1002);
  uint64_t v85 = sub_A938(v77, v78, v79, v80, v81, v82, v83, v84, v527, v590, v652, v713, v773, v832, v890, v947, v1003, v1058);
  uint64_t v93 = sub_A930( v85,  v86,  v87,  v88,  v89,  v90,  v91,  v92,  v528,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113);
  uint64_t v101 = sub_A928( v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167);
  uint64_t v109 = sub_A920( v101,  v102,  v103,  v104,  v105,  v106,  v107,  v108,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220);
  uint64_t v117 = sub_36374( v109,  v110,  v111,  v112,  v113,  v114,  v115,  v116,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272);
  uint64_t v125 = sub_3636C( v117,  v118,  v119,  v120,  v121,  v122,  v123,  v124,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323);
  uint64_t v133 = sub_36364( v125,  v126,  v127,  v128,  v129,  v130,  v131,  v132,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373);
  uint64_t v141 = sub_363F0( v133,  v134,  v135,  v136,  v137,  v138,  v139,  v140,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422);
  uint64_t v149 = sub_36430( v141,  v142,  v143,  v144,  v145,  v146,  v147,  v148,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470);
  uint64_t v157 = sub_36428( v149,  v150,  v151,  v152,  v153,  v154,  v155,  v156,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517);
  uint64_t v165 = sub_36478( v157,  v158,  v159,  v160,  v161,  v162,  v163,  v164,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563);
  uint64_t v173 = sub_36524( v165,  v166,  v167,  v168,  v169,  v170,  v171,  v172,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608);
  uint64_t v181 = sub_3651C( v173,  v174,  v175,  v176,  v177,  v178,  v179,  v180,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652);
  uint64_t v189 = sub_36514( v181,  v182,  v183,  v184,  v185,  v186,  v187,  v188,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695);
  uint64_t v197 = sub_3650C( v189,  v190,  v191,  v192,  v193,  v194,  v195,  v196,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737);
  uint64_t v205 = sub_36504( v197,  v198,  v199,  v200,  v201,  v202,  v203,  v204,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778);
  uint64_t v213 = sub_364FC( v205,  v206,  v207,  v208,  v209,  v210,  v211,  v212,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818);
  uint64_t v221 = sub_364F4( v213,  v214,  v215,  v216,  v217,  v218,  v219,  v220,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857);
  uint64_t v229 = sub_364EC( v221,  v222,  v223,  v224,  v225,  v226,  v227,  v228,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895);
  uint64_t v237 = sub_364E4( v229,  v230,  v231,  v232,  v233,  v234,  v235,  v236,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932);
  uint64_t v245 = sub_364DC( v237,  v238,  v239,  v240,  v241,  v242,  v243,  v244,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968);
  uint64_t v253 = sub_364D4( v245,  v246,  v247,  v248,  v249,  v250,  v251,  v252,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003);
  uint64_t v261 = sub_366F8( v253,  v254,  v255,  v256,  v257,  v258,  v259,  v260,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037);
  uint64_t v269 = sub_366F0( v261,  v262,  v263,  v264,  v265,  v266,  v267,  v268,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070);
  uint64_t v277 = sub_36B90( v269,  v270,  v271,  v272,  v273,  v274,  v275,  v276,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102);
  uint64_t v285 = sub_36EF4( v277,  v278,  v279,  v280,  v281,  v282,  v283,  v284,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133);
  uint64_t v293 = sub_36EEC( v285,  v286,  v287,  v288,  v289,  v290,  v291,  v292,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163);
  uint64_t v301 = sub_DD7E4( v293,  v294,  v295,  v296,  v297,  v298,  v299,  v300,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192);
  uint64_t v309 = sub_DD7DC( v301,  v302,  v303,  v304,  v305,  v306,  v307,  v308,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220);
  uint64_t v317 = sub_DD7D4( v309,  v310,  v311,  v312,  v313,  v314,  v315,  v316,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247);
  uint64_t v325 = sub_DD7CC( v317,  v318,  v319,  v320,  v321,  v322,  v323,  v324,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273);
  uint64_t v333 = sub_DD7C4( v325,  v326,  v327,  v328,  v329,  v330,  v331,  v332,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298);
  uint64_t v341 = sub_DD7BC( v333,  v334,  v335,  v336,  v337,  v338,  v339,  v340,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322);
  uint64_t v349 = sub_DD7B4( v341,  v342,  v343,  v344,  v345,  v346,  v347,  v348,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345);
  uint64_t v357 = sub_DD7AC( v349,  v350,  v351,  v352,  v353,  v354,  v355,  v356,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367);
  uint64_t v365 = sub_DD7A4( v357,  v358,  v359,  v360,  v361,  v362,  v363,  v364,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388);
  uint64_t v373 = sub_DD79C( v365,  v366,  v367,  v368,  v369,  v370,  v371,  v372,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408);
  uint64_t v381 = sub_DD794( v373,  v374,  v375,  v376,  v377,  v378,  v379,  v380,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427);
  uint64_t v389 = sub_DD78C( v381,  v382,  v383,  v384,  v385,  v386,  v387,  v388,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445);
  uint64_t v397 = sub_DD784( v389,  v390,  v391,  v392,  v393,  v394,  v395,  v396,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462);
  uint64_t v405 = sub_DD77C( v397,  v398,  v399,  v400,  v401,  v402,  v403,  v404,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463,
           v2478);
  uint64_t v413 = sub_DD774( v405,  v406,  v407,  v408,  v409,  v410,  v411,  v412,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479,
           v2493);
  uint64_t v421 = sub_DD76C( v413,  v414,  v415,  v416,  v417,  v418,  v419,  v420,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494,
           v2507);
  uint64_t v429 = sub_DD764( v421,  v422,  v423,  v424,  v425,  v426,  v427,  v428,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508,
           v2520);
  uint64_t v437 = sub_DD75C( v429,  v430,  v431,  v432,  v433,  v434,  v435,  v436,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521,
           v2532);
  uint64_t v445 = sub_DD754( v437,  v438,  v439,  v440,  v441,  v442,  v443,  v444,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533,
           v2543);
  uint64_t v453 = sub_DD74C( v445,  v446,  v447,  v448,  v449,  v450,  v451,  v452,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v461 = sub_DD744( v453,  v454,  v455,  v456,  v457,  v458,  v459,  v460,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v469 = sub_DD73C( v461,  v462,  v463,  v464,  v465,  v466,  v467,  v468,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v477 = sub_DD734( v469,  v470,  v471,  v472,  v473,  v474,  v475,  v476,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v485 = sub_DD72C( v477,  v478,  v479,  v480,  v481,  v482,  v483,  v484,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v493 = sub_DD724( v485,  v486,  v487,  v488,  v489,  v490,  v491,  v492,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v501 = sub_DD71C( v493,  v494,  v495,  v496,  v497,  v498,  v499,  v500,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  uint64_t v509 = sub_DD714( v501,  v502,  v503,  v504,  v505,  v506,  v507,  v508,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518,
           v2530,
           v2541,
           v2551);
  sub_DD70C( v509,  v510,  v511,  v512,  v513,  v514,  v515,  v516,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
    v2344,
    v2366,
    v2387,
    v2407,
    v2426,
    v2444,
    v2461,
    v2477,
    v2492,
    v2506,
    v2519,
    v2531,
    v2542,
    v2552);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v517 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v517);
}

uint64_t sub_CD5C8()
{
  v1[3509] = v5;
  v1[3510] = v0;
  sub_36900(v6);
  if (v0)
  {
    sub_DEC24();
    swift_bridgeObjectRelease(v7);
    sub_37034();
    sub_DE8A8();
    if (v9) {
      uint64_t v10 = v8;
    }
    else {
      uint64_t v10 = v2;
    }
    swift_bridgeObjectRelease(v10);
    sub_DDFD8();
    if (v9) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v3;
    }
    swift_bridgeObjectRelease(v12);
    sub_DDFCC();
    if (v9) {
      uint64_t v14 = v13;
    }
    else {
      uint64_t v14 = v4;
    }
    swift_bridgeObjectRelease(v14);
    sub_6D64();
    uint64_t v15 = sub_36860();
    sub_73370(v15, &qword_189D00);
  }

  else
  {
    sub_279E0(v1[3319], &qword_189D00);
    sub_37034();
  }

  sub_A964();
  return sub_DD94C(v16, v17, v18);
}

uint64_t sub_CD680()
{
  uint64_t v5 = *(void *)(v0 + 19320);
  if ((sub_DD9F0() & 1) != 0)
  {
    uint64_t v6 = sub_DDB50();
  }

  else
  {
    sub_DDB70(19328LL);
    sub_DD964();
    uint64_t v2 = *(void *)(v0 + 19392);
    uint64_t v3 = *(void *)(v0 + 19400);
    sub_DD9B0((void *)(v0 + 19368));
    uint64_t v6 = sub_DD8C4();
    if (v454) {
      unsigned __int8 v8 = 0;
    }
    else {
      unsigned __int8 v8 = 4;
    }
  }

  sub_DDA20(v6, v7, v8);
  sub_DE0D8();
  sub_DD83C();
  if ((sub_DD9D0((void *)(v0 + 19448)) & 1) != 0)
  {
    uint64_t v9 = sub_DDCC8();
  }

  else
  {
    sub_DDAF8();
    sub_DD468();
    uint64_t v5 = *(void *)(v0 + 19560);
    sub_DD92C((void *)(v0 + 19528));
    sub_DD8F8();
    if (v454) {
      uint64_t v9 = 9LL;
    }
    else {
      uint64_t v9 = 11LL;
    }
  }

  uint64_t v10 = HealthApps.rawValue.getter(v9);
  uint64_t v12 = v11;
  sub_DEE18( v10,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
  if (v13 && (id v14 = sub_DE6C4(v13), sub_6D64(), v14) && (v15 = sub_1141DC(v14), v16))
  {
    uint64_t v17 = v15;
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)(v0 + 25976);
    uint64_t v20 = *(void *)(v19 + 16);
    uint64_t v21 = sub_372CC();
    getMedStatus(from:)(v21, v22, v23, v24, v25, v26);
    char v28 = v27;
    sub_367AC();
    uint64_t v29 = sub_72C38();
    getLocalizedMedName(from:)(v29, v30, v31, v32, v33, v34);
    sub_DEE28();
    sub_36EBC();
    if (v20)
    {
      swift_bridgeObjectRelease(*(void *)(v0 + 27928));
      uint64_t v2411 = v20;
    }

    else
    {
      uint64_t v2411 = *(void *)(v0 + 27928);
      uint64_t v19 = *(void *)(v0 + 27920);
    }

    uint64_t v2425 = v17;
    uint64_t v2424 = v18;
    char v2423 = v28;
    uint64_t v2420 = v19;
    if ((*(_BYTE *)(v0 + 28516) & 1) != 0)
    {
      sub_DA680( *(void **)(v0 + 27952),  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v449 && (id v450 = sub_DE6C4(v449), sub_6D64(), v450))
      {
        sub_134BCC(v450);
        unint64_t v2409 = v452;
        uint64_t v2410 = v451;
      }

      else
      {
        unint64_t v2409 = 0LL;
        uint64_t v2410 = 0LL;
      }
    }

    else
    {
      unint64_t v2409 = *(void *)(v0 + 27416);
      uint64_t v2410 = *(void *)(v0 + 27424);
    }

    sub_DE3B4(19688LL);
    uint64_t v2418 = *(void **)(v0 + 28072);
    sub_DE594();
    uint64_t v453 = *(void *)(v0 + 26432);
    uint64_t v2415 = *(void *)(v0 + 26080);
    sub_DEC0C();
    unint64_t v459 = v458 & 0xFFFF00000000FFFFLL | 0x646567670000LL;
    if (v454) {
      unint64_t v455 = v459;
    }
    uint64_t v2414 = v455;
    uint64_t v460 = *(void *)(v0 + 25984);
    uint64_t v2416 = *(void *)(v0 + 25976);
    unint64_t v461 = 0xE600000000000000LL;
    if (!v454) {
      unint64_t v461 = v456;
    }
    uint64_t v2412 = v457;
    uint64_t v2413 = v461;
    sub_DEED8();
    uint64_t v470 = v469 | 0x64657070690000LL;
    if (v462) {
      uint64_t v471 = v470;
    }
    else {
      uint64_t v471 = v467;
    }
    if (v462) {
      uint64_t v472 = 0xE700000000000000LL;
    }
    else {
      uint64_t v472 = v468;
    }
    if (v466) {
      uint64_t v473 = v465;
    }
    else {
      uint64_t v473 = 0x6E656B6154LL;
    }
    if (v466) {
      uint64_t v474 = v466;
    }
    else {
      uint64_t v474 = 0xE500000000000000LL;
    }
    sub_DED74(v463, v464, &qword_189CF8);
    PhoneRingsSnippet.body.getter(v475);
    char v476 = sub_11B244();
    sub_98DE0(v453, v460, type metadata accessor for SnippetHeaderModel);
    sub_99194();
    _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v477, v478, v479, v2412);
    char v480 = sub_DE95C(v2423);
    SpecificMedCompletedLogModel.init(medStatus:givenTimeString:requestedMedName:requestedMedSchedule:dosage:dosageUnit:url:sashBundleID:dontDisplayGranularTime:isSmartEnabled:loggedLabel:skippedLabel:takenLabel:snippetHeaderModel:)( v480,  v2425,  v2424,  v2420,  v2411,  v2410,  v2409,  0LL,  v2415,  1,  0LL,  0LL,  v641,  v690,  v739,  v788,  v476 & 1,  v2414,  v2413,  v471,  v472,  v473,  v474,  v460);
    sub_36878(v2416 + 296);
    uint64_t v481 = sub_DE0B8();
    *(void *)(v0 + 19792) = v481;
    sub_36F4C((unint64_t *)&qword_18A468, v482, type metadata accessor for WellnessSnippets);
    *(void *)(v0 + 19800) = v483;
    uint64_t v484 = sub_72E20();
    sub_DE774((uint64_t)v484, v485, type metadata accessor for SpecificMedCompletedLogModel);
    sub_DE18C((uint64_t)v484, v481);
    uint64_t v486 = sub_494C(&qword_18A460);
    uint64_t v487 = sub_20308(v486, 40LL);
    uint64_t v488 = sub_373F8(v487);
    sub_DE284(v488, v489, v490);
    *(void *)(v0 + 28088) = v491;
    id v492 = v2418;
    uint64_t v493 = (void *)sub_DEA40();
    *(void *)(v0 + 28096) = v493;
    *uint64_t v493 = v0;
    v493[1] = sub_CE33C;
    sub_DE938();
    return sub_DDEFC();
  }

  else
  {
    sub_DEB38();
    uint64_t v2426 = *(void (**)(uint64_t))(v0 + 27384);
    uint64_t v35 = *(void *)(v0 + 27376);
    uint64_t v36 = *(uint8_t **)(v0 + 26736);
    swift_bridgeObjectRelease(v37);
    sub_249D4();
    sub_DEEF4();
    if (v454) {
      uint64_t v39 = v38;
    }
    else {
      uint64_t v39 = v5;
    }
    swift_bridgeObjectRelease(v39);
    sub_DE89C();
    if (v454) {
      uint64_t v41 = v40;
    }
    else {
      uint64_t v41 = v2;
    }
    swift_bridgeObjectRelease(v41);
    sub_DE8B4();
    if (v454) {
      uint64_t v43 = v42;
    }
    else {
      uint64_t v43 = v3;
    }
    swift_bridgeObjectRelease(v43);
    sub_6D64();
    sub_A5DC(v35, v0 + 19408);
    uint64_t v44 = sub_DEA1C();
    v2426(v44);
    sub_368A0();
    os_log_type_t v45 = sub_A898();
    if (sub_A988(v45))
    {
      uint64_t v46 = *(void *)(v0 + 26952);
      uint64_t v47 = (_WORD *)sub_3635C();
      uint64_t v48 = sub_36908(v47);
      sub_DDA60((uint64_t)v48, (uint64_t)&v2427, (uint64_t)&v2428, (uint64_t)&v2429);
      sub_DA1C();
      sub_232EC( &dword_0,  v12,  (os_log_type_t)(v0 - 48),  "No loggedTime present nested inside intentResponse, returning GenericErrorFlow",  v36);
      sub_37128();

      sub_DDCC0(v46);
    }

    else
    {
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);

      sub_36D90();
    }

    uint64_t v49 = *(void **)(v0 + 27952);
    uint64_t v50 = *(void **)(v0 + 27896);
    uint64_t v2422 = *(void *)(v0 + 26256);
    uint64_t v2417 = *(void **)(v0 + 28072);
    uint64_t v2419 = *(void *)(v0 + 26216);
    uint64_t v2421 = *(void *)(v0 + 26208);
    uint64_t v51 = (_OWORD *)sub_DE9DC();
    sub_DE1B4(v51);
    sub_DE23C((void *)(v0 + 14848));
    sub_A178();
    sub_DE2BC();

    sub_249D4();
    sub_82234();
    sub_B25F0();

    uint64_t v52 = sub_DE9BC();
    sub_36A94((uint64_t)v52, &qword_189CF8);
    uint64_t v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v2419 + 8))(v2422, v2421);
    sub_DDE0C(v53, type metadata accessor for SnippetHeaderModel);
    sub_DDA68(v54, &qword_189D00);
    sub_DDBDC(v55, &qword_18B168);
    uint64_t v1229 = *(void *)(v0 + 27288);
    uint64_t v1278 = *(void *)(v0 + 27280);
    uint64_t v1326 = *(void *)(v0 + 27272);
    uint64_t v1373 = *(void *)(v0 + 27264);
    uint64_t v1419 = *(void *)(v0 + 27256);
    uint64_t v1464 = *(void *)(v0 + 27248);
    uint64_t v1508 = *(void *)(v0 + 27240);
    uint64_t v1551 = *(void *)(v0 + 27232);
    uint64_t v1593 = *(void *)(v0 + 27224);
    uint64_t v1634 = *(void *)(v0 + 27216);
    uint64_t v1674 = *(void *)(v0 + 27208);
    uint64_t v1713 = *(void *)(v0 + 27200);
    uint64_t v1751 = *(void *)(v0 + 27192);
    uint64_t v1788 = *(void *)(v0 + 27184);
    uint64_t v1824 = *(void *)(v0 + 27176);
    uint64_t v1859 = *(void *)(v0 + 27168);
    uint64_t v1893 = *(void *)(v0 + 27160);
    uint64_t v1926 = *(void *)(v0 + 27152);
    uint64_t v1958 = *(void *)(v0 + 27144);
    uint64_t v1989 = *(void *)(v0 + 27136);
    uint64_t v2019 = *(void *)(v0 + 27128);
    uint64_t v2048 = *(void *)(v0 + 27120);
    uint64_t v2076 = *(void *)(v0 + 27112);
    uint64_t v2103 = *(void *)(v0 + 27104);
    uint64_t v2129 = *(void *)(v0 + 27096);
    uint64_t v2154 = *(void *)(v0 + 27088);
    uint64_t v2178 = *(void *)(v0 + 27080);
    uint64_t v2201 = *(void *)(v0 + 27072);
    uint64_t v2223 = *(void *)(v0 + 27064);
    uint64_t v2244 = *(void *)(v0 + 27056);
    uint64_t v2264 = *(void *)(v0 + 27048);
    uint64_t v2283 = *(void *)(v0 + 27040);
    uint64_t v2301 = *(void *)(v0 + 27032);
    uint64_t v2318 = *(void *)(v0 + 27024);
    uint64_t v2334 = *(void *)(v0 + 27016);
    uint64_t v2349 = *(void *)(v0 + 27008);
    uint64_t v2363 = *(void *)(v0 + 27000);
    uint64_t v2376 = *(void *)(v0 + 26992);
    uint64_t v2388 = *(void *)(v0 + 26984);
    uint64_t v2399 = *(void *)(v0 + 26976);
    sub_DCB38(*(void *)(v0 + 27368));
    sub_A8F4();
    sub_A85C();
    sub_A864();
    sub_A910();
    sub_A8EC();
    sub_A760();
    sub_A7C8();
    sub_A67C();
    uint64_t v56 = sub_A78C();
    uint64_t v64 = sub_36364( v56,  v57,  v58,  v59,  v60,  v61,  v62,  v63,  v494,  v543,  v592,  v641,  v690,  v739,  v788,  v837,  v886,  v935,  v984,  v1033,  v1082,  v1131,  v1180,  v1229);
    uint64_t v72 = sub_363F0( v64,  v65,  v66,  v67,  v68,  v69,  v70,  v71,  v495,  v544,  v593,  v642,  v691,  v740,  v789,  v838,  v887,  v936,  v985,  v1034,  v1083,  v1132,  v1181,  v1230,  v1278);
    uint64_t v80 = sub_36430( v72,  v73,  v74,  v75,  v76,  v77,  v78,  v79,  v496,  v545,  v594,  v643,  v692,  v741,  v790,  v839,  v888,  v937,  v986,  v1035,  v1084,  v1133,  v1182,  v1231,  v1279,  v1326);
    uint64_t v88 = sub_36428( v80,  v81,  v82,  v83,  v84,  v85,  v86,  v87,  v497,  v546,  v595,  v644,  v693,  v742,  v791,  v840,  v889,  v938,  v987,  v1036,  v1085,  v1134,  v1183,  v1232,  v1280,  v1327,  v1373);
    uint64_t v96 = sub_36478( v88,  v89,  v90,  v91,  v92,  v93,  v94,  v95,  v498,  v547,  v596,  v645,  v694,  v743,  v792,  v841,  v890,  v939,  v988,  v1037,  v1086,  v1135,  v1184,  v1233,  v1281,  v1328,  v1374,  v1419);
    uint64_t v104 = sub_36524( v96,  v97,  v98,  v99,  v100,  v101,  v102,  v103,  v499,  v548,  v597,  v646,  v695,  v744,  v793,  v842,  v891,  v940,  v989,  v1038,  v1087,  v1136,  v1185,  v1234,  v1282,  v1329,  v1375,  v1420,  v1464);
    uint64_t v112 = sub_3651C( v104,  v105,  v106,  v107,  v108,  v109,  v110,  v111,  v500,  v549,  v598,  v647,  v696,  v745,  v794,  v843,  v892,  v941,  v990,  v1039,  v1088,  v1137,  v1186,  v1235,  v1283,  v1330,  v1376,  v1421,  v1465,  v1508);
    uint64_t v120 = sub_36514( v112,  v113,  v114,  v115,  v116,  v117,  v118,  v119,  v501,  v550,  v599,  v648,  v697,  v746,  v795,  v844,  v893,  v942,  v991,  v1040,  v1089,  v1138,  v1187,  v1236,  v1284,  v1331,  v1377,  v1422,  v1466,  v1509,  v1551);
    uint64_t v128 = sub_3650C( v120,  v121,  v122,  v123,  v124,  v125,  v126,  v127,  v502,  v551,  v600,  v649,  v698,  v747,  v796,  v845,  v894,  v943,  v992,  v1041,  v1090,  v1139,  v1188,  v1237,  v1285,  v1332,  v1378,  v1423,  v1467,  v1510,  v1552,  v1593);
    uint64_t v136 = sub_36504( v128,  v129,  v130,  v131,  v132,  v133,  v134,  v135,  v503,  v552,  v601,  v650,  v699,  v748,  v797,  v846,  v895,  v944,  v993,  v1042,  v1091,  v1140,  v1189,  v1238,  v1286,  v1333,  v1379,  v1424,  v1468,  v1511,  v1553,  v1594,  v1634);
    uint64_t v144 = sub_364FC( v136,  v137,  v138,  v139,  v140,  v141,  v142,  v143,  v504,  v553,  v602,  v651,  v700,  v749,  v798,  v847,  v896,  v945,  v994,  v1043,  v1092,  v1141,  v1190,  v1239,  v1287,  v1334,  v1380,  v1425,  v1469,  v1512,  v1554,  v1595,  v1635,  v1674);
    uint64_t v152 = sub_364F4( v144,  v145,  v146,  v147,  v148,  v149,  v150,  v151,  v505,  v554,  v603,  v652,  v701,  v750,  v799,  v848,  v897,  v946,  v995,  v1044,  v1093,  v1142,  v1191,  v1240,  v1288,  v1335,  v1381,  v1426,  v1470,  v1513,  v1555,  v1596,  v1636,  v1675,  v1713);
    uint64_t v160 = sub_364EC( v152,  v153,  v154,  v155,  v156,  v157,  v158,  v159,  v506,  v555,  v604,  v653,  v702,  v751,  v800,  v849,  v898,  v947,  v996,  v1045,  v1094,  v1143,  v1192,  v1241,  v1289,  v1336,  v1382,  v1427,  v1471,  v1514,  v1556,  v1597,  v1637,  v1676,  v1714,  v1751);
    uint64_t v168 = sub_364E4( v160,  v161,  v162,  v163,  v164,  v165,  v166,  v167,  v507,  v556,  v605,  v654,  v703,  v752,  v801,  v850,  v899,  v948,  v997,  v1046,  v1095,  v1144,  v1193,  v1242,  v1290,  v1337,  v1383,  v1428,  v1472,  v1515,  v1557,  v1598,  v1638,  v1677,  v1715,  v1752,  v1788);
    uint64_t v176 = sub_364DC( v168,  v169,  v170,  v171,  v172,  v173,  v174,  v175,  v508,  v557,  v606,  v655,  v704,  v753,  v802,  v851,  v900,  v949,  v998,  v1047,  v1096,  v1145,  v1194,  v1243,  v1291,  v1338,  v1384,  v1429,  v1473,  v1516,  v1558,  v1599,  v1639,  v1678,  v1716,  v1753,  v1789,  v1824);
    uint64_t v184 = sub_364D4( v176,  v177,  v178,  v179,  v180,  v181,  v182,  v183,  v509,  v558,  v607,  v656,  v705,  v754,  v803,  v852,  v901,  v950,  v999,  v1048,  v1097,  v1146,  v1195,  v1244,  v1292,  v1339,  v1385,  v1430,  v1474,  v1517,  v1559,  v1600,  v1640,  v1679,  v1717,  v1754,  v1790,  v1825,  v1859);
    uint64_t v192 = sub_366F8( v184,  v185,  v186,  v187,  v188,  v189,  v190,  v191,  v510,  v559,  v608,  v657,  v706,  v755,  v804,  v853,  v902,  v951,  v1000,  v1049,  v1098,  v1147,  v1196,  v1245,  v1293,  v1340,  v1386,  v1431,  v1475,  v1518,  v1560,  v1601,  v1641,  v1680,  v1718,  v1755,  v1791,  v1826,  v1860,  v1893);
    uint64_t v200 = sub_366F0( v192,  v193,  v194,  v195,  v196,  v197,  v198,  v199,  v511,  v560,  v609,  v658,  v707,  v756,  v805,  v854,  v903,  v952,  v1001,  v1050,  v1099,  v1148,  v1197,  v1246,  v1294,  v1341,  v1387,  v1432,  v1476,  v1519,  v1561,  v1602,  v1642,  v1681,  v1719,  v1756,  v1792,  v1827,  v1861,  v1894,  v1926);
    uint64_t v208 = sub_36B90( v200,  v201,  v202,  v203,  v204,  v205,  v206,  v207,  v512,  v561,  v610,  v659,  v708,  v757,  v806,  v855,  v904,  v953,  v1002,  v1051,  v1100,  v1149,  v1198,  v1247,  v1295,  v1342,  v1388,  v1433,  v1477,  v1520,  v1562,  v1603,  v1643,  v1682,  v1720,  v1757,  v1793,  v1828,  v1862,  v1895,  v1927,  v1958);
    uint64_t v216 = sub_36EF4( v208,  v209,  v210,  v211,  v212,  v213,  v214,  v215,  v513,  v562,  v611,  v660,  v709,  v758,  v807,  v856,  v905,  v954,  v1003,  v1052,  v1101,  v1150,  v1199,  v1248,  v1296,  v1343,  v1389,  v1434,  v1478,  v1521,  v1563,  v1604,  v1644,  v1683,  v1721,  v1758,  v1794,  v1829,  v1863,  v1896,  v1928,  v1959,  v1989);
    uint64_t v224 = sub_36EEC( v216,  v217,  v218,  v219,  v220,  v221,  v222,  v223,  v514,  v563,  v612,  v661,  v710,  v759,  v808,  v857,  v906,  v955,  v1004,  v1053,  v1102,  v1151,  v1200,  v1249,  v1297,  v1344,  v1390,  v1435,  v1479,  v1522,  v1564,  v1605,  v1645,  v1684,  v1722,  v1759,  v1795,  v1830,  v1864,  v1897,  v1929,  v1960,  v1990,  v2019);
    uint64_t v232 = sub_DD7E4( v224,  v225,  v226,  v227,  v228,  v229,  v230,  v231,  v515,  v564,  v613,  v662,  v711,  v760,  v809,  v858,  v907,  v956,  v1005,  v1054,  v1103,  v1152,  v1201,  v1250,  v1298,  v1345,  v1391,  v1436,  v1480,  v1523,  v1565,  v1606,  v1646,  v1685,  v1723,  v1760,  v1796,  v1831,  v1865,  v1898,  v1930,  v1961,  v1991,  v2020,  v2048);
    uint64_t v240 = sub_DD7DC( v232,  v233,  v234,  v235,  v236,  v237,  v238,  v239,  v516,  v565,  v614,  v663,  v712,  v761,  v810,  v859,  v908,  v957,  v1006,  v1055,  v1104,  v1153,  v1202,  v1251,  v1299,  v1346,  v1392,  v1437,  v1481,  v1524,  v1566,  v1607,  v1647,  v1686,  v1724,  v1761,  v1797,  v1832,  v1866,  v1899,  v1931,  v1962,  v1992,  v2021,  v2049,  v2076);
    uint64_t v248 = sub_DD7D4( v240,  v241,  v242,  v243,  v244,  v245,  v246,  v247,  v517,  v566,  v615,  v664,  v713,  v762,  v811,  v860,  v909,  v958,  v1007,  v1056,  v1105,  v1154,  v1203,  v1252,  v1300,  v1347,  v1393,  v1438,  v1482,  v1525,  v1567,  v1608,  v1648,  v1687,  v1725,  v1762,  v1798,  v1833,  v1867,  v1900,  v1932,  v1963,  v1993,  v2022,  v2050,  v2077,  v2103);
    uint64_t v256 = sub_DD7CC( v248,  v249,  v250,  v251,  v252,  v253,  v254,  v255,  v518,  v567,  v616,  v665,  v714,  v763,  v812,  v861,  v910,  v959,  v1008,  v1057,  v1106,  v1155,  v1204,  v1253,  v1301,  v1348,  v1394,  v1439,  v1483,  v1526,  v1568,  v1609,  v1649,  v1688,  v1726,  v1763,  v1799,  v1834,  v1868,  v1901,  v1933,  v1964,  v1994,  v2023,  v2051,  v2078,  v2104,  v2129);
    uint64_t v264 = sub_DD7C4( v256,  v257,  v258,  v259,  v260,  v261,  v262,  v263,  v519,  v568,  v617,  v666,  v715,  v764,  v813,  v862,  v911,  v960,  v1009,  v1058,  v1107,  v1156,  v1205,  v1254,  v1302,  v1349,  v1395,  v1440,  v1484,  v1527,  v1569,  v1610,  v1650,  v1689,  v1727,  v1764,  v1800,  v1835,  v1869,  v1902,  v1934,  v1965,  v1995,  v2024,  v2052,  v2079,  v2105,  v2130,  v2154);
    uint64_t v272 = sub_DD7BC( v264,  v265,  v266,  v267,  v268,  v269,  v270,  v271,  v520,  v569,  v618,  v667,  v716,  v765,  v814,  v863,  v912,  v961,  v1010,  v1059,  v1108,  v1157,  v1206,  v1255,  v1303,  v1350,  v1396,  v1441,  v1485,  v1528,  v1570,  v1611,  v1651,  v1690,  v1728,  v1765,  v1801,  v1836,  v1870,  v1903,  v1935,  v1966,  v1996,  v2025,  v2053,  v2080,  v2106,  v2131,  v2155,
             v2178);
    uint64_t v280 = sub_DD7B4( v272,  v273,  v274,  v275,  v276,  v277,  v278,  v279,  v521,  v570,  v619,  v668,  v717,  v766,  v815,  v864,  v913,  v962,  v1011,  v1060,  v1109,  v1158,  v1207,  v1256,  v1304,  v1351,  v1397,  v1442,  v1486,  v1529,  v1571,  v1612,  v1652,  v1691,  v1729,  v1766,  v1802,  v1837,  v1871,  v1904,  v1936,  v1967,  v1997,  v2026,  v2054,  v2081,  v2107,  v2132,  v2156,
             v2179,
             v2201);
    uint64_t v288 = sub_DD7AC( v280,  v281,  v282,  v283,  v284,  v285,  v286,  v287,  v522,  v571,  v620,  v669,  v718,  v767,  v816,  v865,  v914,  v963,  v1012,  v1061,  v1110,  v1159,  v1208,  v1257,  v1305,  v1352,  v1398,  v1443,  v1487,  v1530,  v1572,  v1613,  v1653,  v1692,  v1730,  v1767,  v1803,  v1838,  v1872,  v1905,  v1937,  v1968,  v1998,  v2027,  v2055,  v2082,  v2108,  v2133,  v2157,
             v2180,
             v2202,
             v2223);
    uint64_t v296 = sub_DD7A4( v288,  v289,  v290,  v291,  v292,  v293,  v294,  v295,  v523,  v572,  v621,  v670,  v719,  v768,  v817,  v866,  v915,  v964,  v1013,  v1062,  v1111,  v1160,  v1209,  v1258,  v1306,  v1353,  v1399,  v1444,  v1488,  v1531,  v1573,  v1614,  v1654,  v1693,  v1731,  v1768,  v1804,  v1839,  v1873,  v1906,  v1938,  v1969,  v1999,  v2028,  v2056,  v2083,  v2109,  v2134,  v2158,
             v2181,
             v2203,
             v2224,
             v2244);
    uint64_t v304 = sub_DD79C( v296,  v297,  v298,  v299,  v300,  v301,  v302,  v303,  v524,  v573,  v622,  v671,  v720,  v769,  v818,  v867,  v916,  v965,  v1014,  v1063,  v1112,  v1161,  v1210,  v1259,  v1307,  v1354,  v1400,  v1445,  v1489,  v1532,  v1574,  v1615,  v1655,  v1694,  v1732,  v1769,  v1805,  v1840,  v1874,  v1907,  v1939,  v1970,  v2000,  v2029,  v2057,  v2084,  v2110,  v2135,  v2159,
             v2182,
             v2204,
             v2225,
             v2245,
             v2264);
    uint64_t v312 = sub_DD794( v304,  v305,  v306,  v307,  v308,  v309,  v310,  v311,  v525,  v574,  v623,  v672,  v721,  v770,  v819,  v868,  v917,  v966,  v1015,  v1064,  v1113,  v1162,  v1211,  v1260,  v1308,  v1355,  v1401,  v1446,  v1490,  v1533,  v1575,  v1616,  v1656,  v1695,  v1733,  v1770,  v1806,  v1841,  v1875,  v1908,  v1940,  v1971,  v2001,  v2030,  v2058,  v2085,  v2111,  v2136,  v2160,
             v2183,
             v2205,
             v2226,
             v2246,
             v2265,
             v2283);
    uint64_t v320 = sub_DD78C( v312,  v313,  v314,  v315,  v316,  v317,  v318,  v319,  v526,  v575,  v624,  v673,  v722,  v771,  v820,  v869,  v918,  v967,  v1016,  v1065,  v1114,  v1163,  v1212,  v1261,  v1309,  v1356,  v1402,  v1447,  v1491,  v1534,  v1576,  v1617,  v1657,  v1696,  v1734,  v1771,  v1807,  v1842,  v1876,  v1909,  v1941,  v1972,  v2002,  v2031,  v2059,  v2086,  v2112,  v2137,  v2161,
             v2184,
             v2206,
             v2227,
             v2247,
             v2266,
             v2284,
             v2301);
    uint64_t v328 = sub_DD784( v320,  v321,  v322,  v323,  v324,  v325,  v326,  v327,  v527,  v576,  v625,  v674,  v723,  v772,  v821,  v870,  v919,  v968,  v1017,  v1066,  v1115,  v1164,  v1213,  v1262,  v1310,  v1357,  v1403,  v1448,  v1492,  v1535,  v1577,  v1618,  v1658,  v1697,  v1735,  v1772,  v1808,  v1843,  v1877,  v1910,  v1942,  v1973,  v2003,  v2032,  v2060,  v2087,  v2113,  v2138,  v2162,
             v2185,
             v2207,
             v2228,
             v2248,
             v2267,
             v2285,
             v2302,
             v2318);
    uint64_t v336 = sub_DD77C( v328,  v329,  v330,  v331,  v332,  v333,  v334,  v335,  v528,  v577,  v626,  v675,  v724,  v773,  v822,  v871,  v920,  v969,  v1018,  v1067,  v1116,  v1165,  v1214,  v1263,  v1311,  v1358,  v1404,  v1449,  v1493,  v1536,  v1578,  v1619,  v1659,  v1698,  v1736,  v1773,  v1809,  v1844,  v1878,  v1911,  v1943,  v1974,  v2004,  v2033,  v2061,  v2088,  v2114,  v2139,  v2163,
             v2186,
             v2208,
             v2229,
             v2249,
             v2268,
             v2286,
             v2303,
             v2319,
             v2334);
    uint64_t v344 = sub_DD774( v336,  v337,  v338,  v339,  v340,  v341,  v342,  v343,  v529,  v578,  v627,  v676,  v725,  v774,  v823,  v872,  v921,  v970,  v1019,  v1068,  v1117,  v1166,  v1215,  v1264,  v1312,  v1359,  v1405,  v1450,  v1494,  v1537,  v1579,  v1620,  v1660,  v1699,  v1737,  v1774,  v1810,  v1845,  v1879,  v1912,  v1944,  v1975,  v2005,  v2034,  v2062,  v2089,  v2115,  v2140,  v2164,
             v2187,
             v2209,
             v2230,
             v2250,
             v2269,
             v2287,
             v2304,
             v2320,
             v2335,
             v2349);
    uint64_t v352 = sub_DD76C( v344,  v345,  v346,  v347,  v348,  v349,  v350,  v351,  v530,  v579,  v628,  v677,  v726,  v775,  v824,  v873,  v922,  v971,  v1020,  v1069,  v1118,  v1167,  v1216,  v1265,  v1313,  v1360,  v1406,  v1451,  v1495,  v1538,  v1580,  v1621,  v1661,  v1700,  v1738,  v1775,  v1811,  v1846,  v1880,  v1913,  v1945,  v1976,  v2006,  v2035,  v2063,  v2090,  v2116,  v2141,  v2165,
             v2188,
             v2210,
             v2231,
             v2251,
             v2270,
             v2288,
             v2305,
             v2321,
             v2336,
             v2350,
             v2363);
    uint64_t v360 = sub_DD764( v352,  v353,  v354,  v355,  v356,  v357,  v358,  v359,  v531,  v580,  v629,  v678,  v727,  v776,  v825,  v874,  v923,  v972,  v1021,  v1070,  v1119,  v1168,  v1217,  v1266,  v1314,  v1361,  v1407,  v1452,  v1496,  v1539,  v1581,  v1622,  v1662,  v1701,  v1739,  v1776,  v1812,  v1847,  v1881,  v1914,  v1946,  v1977,  v2007,  v2036,  v2064,  v2091,  v2117,  v2142,  v2166,
             v2189,
             v2211,
             v2232,
             v2252,
             v2271,
             v2289,
             v2306,
             v2322,
             v2337,
             v2351,
             v2364,
             v2376);
    uint64_t v368 = sub_DD75C( v360,  v361,  v362,  v363,  v364,  v365,  v366,  v367,  v532,  v581,  v630,  v679,  v728,  v777,  v826,  v875,  v924,  v973,  v1022,  v1071,  v1120,  v1169,  v1218,  v1267,  v1315,  v1362,  v1408,  v1453,  v1497,  v1540,  v1582,  v1623,  v1663,  v1702,  v1740,  v1777,  v1813,  v1848,  v1882,  v1915,  v1947,  v1978,  v2008,  v2037,  v2065,  v2092,  v2118,  v2143,  v2167,
             v2190,
             v2212,
             v2233,
             v2253,
             v2272,
             v2290,
             v2307,
             v2323,
             v2338,
             v2352,
             v2365,
             v2377,
             v2388);
    uint64_t v376 = sub_DD754( v368,  v369,  v370,  v371,  v372,  v373,  v374,  v375,  v533,  v582,  v631,  v680,  v729,  v778,  v827,  v876,  v925,  v974,  v1023,  v1072,  v1121,  v1170,  v1219,  v1268,  v1316,  v1363,  v1409,  v1454,  v1498,  v1541,  v1583,  v1624,  v1664,  v1703,  v1741,  v1778,  v1814,  v1849,  v1883,  v1916,  v1948,  v1979,  v2009,  v2038,  v2066,  v2093,  v2119,  v2144,  v2168,
             v2191,
             v2213,
             v2234,
             v2254,
             v2273,
             v2291,
             v2308,
             v2324,
             v2339,
             v2353,
             v2366,
             v2378,
             v2389,
             v2399);
    uint64_t v384 = sub_DD74C( v376,  v377,  v378,  v379,  v380,  v381,  v382,  v383,  v534,  v583,  v632,  v681,  v730,  v779,  v828,  v877,  v926,  v975,  v1024,  v1073,  v1122,  v1171,  v1220,  v1269,  v1317,  v1364,  v1410,  v1455,  v1499,  v1542,  v1584,  v1625,  v1665,  v1704,  v1742,  v1779,  v1815,  v1850,  v1884,  v1917,  v1949,  v1980,  v2010,  v2039,  v2067,  v2094,  v2120,  v2145,  v2169,
             v2192,
             v2214,
             v2235,
             v2255,
             v2274,
             v2292,
             v2309,
             v2325,
             v2340,
             v2354,
             v2367,
             v2379,
             v2390,
             v2400);
    uint64_t v392 = sub_DD744( v384,  v385,  v386,  v387,  v388,  v389,  v390,  v391,  v535,  v584,  v633,  v682,  v731,  v780,  v829,  v878,  v927,  v976,  v1025,  v1074,  v1123,  v1172,  v1221,  v1270,  v1318,  v1365,  v1411,  v1456,  v1500,  v1543,  v1585,  v1626,  v1666,  v1705,  v1743,  v1780,  v1816,  v1851,  v1885,  v1918,  v1950,  v1981,  v2011,  v2040,  v2068,  v2095,  v2121,  v2146,  v2170,
             v2193,
             v2215,
             v2236,
             v2256,
             v2275,
             v2293,
             v2310,
             v2326,
             v2341,
             v2355,
             v2368,
             v2380,
             v2391,
             v2401);
    uint64_t v400 = sub_DD73C( v392,  v393,  v394,  v395,  v396,  v397,  v398,  v399,  v536,  v585,  v634,  v683,  v732,  v781,  v830,  v879,  v928,  v977,  v1026,  v1075,  v1124,  v1173,  v1222,  v1271,  v1319,  v1366,  v1412,  v1457,  v1501,  v1544,  v1586,  v1627,  v1667,  v1706,  v1744,  v1781,  v1817,  v1852,  v1886,  v1919,  v1951,  v1982,  v2012,  v2041,  v2069,  v2096,  v2122,  v2147,  v2171,
             v2194,
             v2216,
             v2237,
             v2257,
             v2276,
             v2294,
             v2311,
             v2327,
             v2342,
             v2356,
             v2369,
             v2381,
             v2392,
             v2402);
    uint64_t v408 = sub_DD734( v400,  v401,  v402,  v403,  v404,  v405,  v406,  v407,  v537,  v586,  v635,  v684,  v733,  v782,  v831,  v880,  v929,  v978,  v1027,  v1076,  v1125,  v1174,  v1223,  v1272,  v1320,  v1367,  v1413,  v1458,  v1502,  v1545,  v1587,  v1628,  v1668,  v1707,  v1745,  v1782,  v1818,  v1853,  v1887,  v1920,  v1952,  v1983,  v2013,  v2042,  v2070,  v2097,  v2123,  v2148,  v2172,
             v2195,
             v2217,
             v2238,
             v2258,
             v2277,
             v2295,
             v2312,
             v2328,
             v2343,
             v2357,
             v2370,
             v2382,
             v2393,
             v2403);
    uint64_t v416 = sub_DD72C( v408,  v409,  v410,  v411,  v412,  v413,  v414,  v415,  v538,  v587,  v636,  v685,  v734,  v783,  v832,  v881,  v930,  v979,  v1028,  v1077,  v1126,  v1175,  v1224,  v1273,  v1321,  v1368,  v1414,  v1459,  v1503,  v1546,  v1588,  v1629,  v1669,  v1708,  v1746,  v1783,  v1819,  v1854,  v1888,  v1921,  v1953,  v1984,  v2014,  v2043,  v2071,  v2098,  v2124,  v2149,  v2173,
             v2196,
             v2218,
             v2239,
             v2259,
             v2278,
             v2296,
             v2313,
             v2329,
             v2344,
             v2358,
             v2371,
             v2383,
             v2394,
             v2404);
    uint64_t v424 = sub_DD724( v416,  v417,  v418,  v419,  v420,  v421,  v422,  v423,  v539,  v588,  v637,  v686,  v735,  v784,  v833,  v882,  v931,  v980,  v1029,  v1078,  v1127,  v1176,  v1225,  v1274,  v1322,  v1369,  v1415,  v1460,  v1504,  v1547,  v1589,  v1630,  v1670,  v1709,  v1747,  v1784,  v1820,  v1855,  v1889,  v1922,  v1954,  v1985,  v2015,  v2044,  v2072,  v2099,  v2125,  v2150,  v2174,
             v2197,
             v2219,
             v2240,
             v2260,
             v2279,
             v2297,
             v2314,
             v2330,
             v2345,
             v2359,
             v2372,
             v2384,
             v2395,
             v2405);
    uint64_t v432 = sub_DD71C( v424,  v425,  v426,  v427,  v428,  v429,  v430,  v431,  v540,  v589,  v638,  v687,  v736,  v785,  v834,  v883,  v932,  v981,  v1030,  v1079,  v1128,  v1177,  v1226,  v1275,  v1323,  v1370,  v1416,  v1461,  v1505,  v1548,  v1590,  v1631,  v1671,  v1710,  v1748,  v1785,  v1821,  v1856,  v1890,  v1923,  v1955,  v1986,  v2016,  v2045,  v2073,  v2100,  v2126,  v2151,  v2175,
             v2198,
             v2220,
             v2241,
             v2261,
             v2280,
             v2298,
             v2315,
             v2331,
             v2346,
             v2360,
             v2373,
             v2385,
             v2396,
             v2406);
    uint64_t v440 = sub_DD714( v432,  v433,  v434,  v435,  v436,  v437,  v438,  v439,  v541,  v590,  v639,  v688,  v737,  v786,  v835,  v884,  v933,  v982,  v1031,  v1080,  v1129,  v1178,  v1227,  v1276,  v1324,  v1371,  v1417,  v1462,  v1506,  v1549,  v1591,  v1632,  v1672,  v1711,  v1749,  v1786,  v1822,  v1857,  v1891,  v1924,  v1956,  v1987,  v2017,  v2046,  v2074,  v2101,  v2127,  v2152,  v2176,
             v2199,
             v2221,
             v2242,
             v2262,
             v2281,
             v2299,
             v2316,
             v2332,
             v2347,
             v2361,
             v2374,
             v2386,
             v2397,
             v2407);
    sub_DD70C( v440,  v441,  v442,  v443,  v444,  v445,  v446,  v447,  v542,  v591,  v640,  v689,  v738,  v787,  v836,  v885,  v934,  v983,  v1032,  v1081,  v1130,  v1179,  v1228,  v1277,  v1325,  v1372,  v1418,  v1463,  v1507,  v1550,  v1592,  v1633,  v1673,  v1712,  v1750,  v1787,  v1823,  v1858,  v1892,  v1925,  v1957,  v1988,  v2018,  v2047,  v2075,  v2102,  v2128,  v2153,  v2177,
      v2200,
      v2222,
      v2243,
      v2263,
      v2282,
      v2300,
      v2317,
      v2333,
      v2348,
      v2362,
      v2375,
      v2387,
      v2398,
      v2408);
    sub_DD704();
    sub_DD6FC();
    sub_DD6F4();
    sub_DD6EC();
    sub_DD6E4();
    sub_DD6DC();
    sub_DD6D4();
    sub_DD6CC();
    sub_DD6C4();
    sub_DD6BC();
    sub_DD6B4();
    sub_DD6AC();
    sub_DD6A4();
    sub_DD69C();
    sub_DD694();
    sub_DD68C();
    sub_DD684();
    sub_DD67C();
    sub_DD674();
    sub_DD66C();
    sub_DD664();
    sub_DD65C();
    sub_DD654();
    sub_DD64C();
    sub_DD644();
    sub_DD63C();
    sub_DD634();
    sub_DD62C();
    sub_DD624();
    sub_DD61C();
    sub_DD614();
    sub_DD60C();
    sub_DD604();
    sub_DD5FC();
    sub_DD5F4();
    sub_DD5EC();
    sub_DD5E4();
    sub_DD5DC();
    sub_DD5D4();
    sub_DD5CC();
    sub_DD5C4();
    sub_DD5BC();
    sub_DD5B4();
    sub_DD5AC();
    sub_DD5A4();
    sub_DD59C();
    sub_DD594();
    sub_DD58C();
    sub_DD584();
    sub_DD57C();
    sub_DD574();
    sub_DD56C();
    sub_DD564();
    sub_DD55C();
    sub_DD554();
    sub_DD54C();
    sub_DD544();
    sub_DD53C();
    sub_DD534();
    sub_DD52C();
    sub_DD524();
    sub_DD51C();
    sub_DD514();
    sub_DD50C();
    sub_DD504();
    sub_DD4FC();
    sub_DD4F4();
    sub_DD4EC();
    sub_DD4DC();
    sub_DD4E4();
    sub_DD868();
    sub_DD870();
    sub_DDA48();
    sub_DDA58();
    sub_DDE30();
    sub_DDE28();
    sub_DE6BC();
    sub_DE6B4();
    sub_DE6AC();
    sub_DE6A4();
    sub_DE69C();
    sub_DE694();
    sub_DEA78();
    sub_DEA70();
    sub_DEA68();
    sub_DEB50();
    sub_36B88();
    sub_366E8();
    sub_3677C();
    sub_36588();
    sub_36624();
    sub_3661C();
    sub_36614();
    sub_3660C();
    sub_36604();
    sub_365FC();
    sub_365F4();
    sub_365EC();
    sub_365E4();
    sub_365DC();
    sub_366B8();
    sub_366B0();
    sub_366A8();
    sub_36814();
    return sub_36148(*(uint64_t (**)(void))(v0 + 8));
  }

uint64_t sub_CE33C()
{
  return sub_D954();
}

uint64_t sub_CE388()
{
  uint64_t v1 = (void *)v0[3487];
  sub_DEC60();
  uint64_t v2538 = v0[3260];
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v2);
  sub_369CC();
  sub_36878((uint64_t)(v0 + 2461));
  uint64_t v3 = sub_20308((uint64_t)&unk_180120, 56LL);
  sub_DDC44(v3);
  v0[3224] = SimpleOutputFlowAsync.__allocating_init(outputPublisher:outputGenerator:)(&v2539, &unk_18EA58, v3);
  static ExecuteResponse.complete<A>(next:)(v0 + 3224);

  sub_1EBF4();
  sub_6D64();
  sub_DE7D8();
  sub_DE15C();
  sub_DE48C();
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v0 + 2461);
  sub_26F04(v2538, type metadata accessor for SpecificMedCompletedLogModel);
  sub_DE1AC(v4, &qword_189CF8);
  uint64_t v5 = sub_DDB08();
  sub_DDC20(v5, type metadata accessor for SnippetHeaderModel);
  sub_DE3DC(v6, &qword_189D00);
  sub_DDA68(v7, &qword_18B168);
  sub_3652C();
  sub_DC288();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v8 = sub_A78C();
  uint64_t v16 = sub_A888(v8, v9, v10, v11, v12, v13, v14, v15, v506, v568, v630);
  uint64_t v24 = sub_A854(v16, v17, v18, v19, v20, v21, v22, v23, v507, v569, v631, v692);
  uint64_t v32 = sub_A84C(v24, v25, v26, v27, v28, v29, v30, v31, v508, v570, v632, v693, v753);
  uint64_t v40 = sub_A844(v32, v33, v34, v35, v36, v37, v38, v39, v509, v571, v633, v694, v754, v813);
  uint64_t v48 = sub_A83C(v40, v41, v42, v43, v44, v45, v46, v47, v510, v572, v634, v695, v755, v814, v872);
  uint64_t v56 = sub_A95C(v48, v49, v50, v51, v52, v53, v54, v55, v511, v573, v635, v696, v756, v815, v873, v930);
  uint64_t v64 = sub_A954(v56, v57, v58, v59, v60, v61, v62, v63, v512, v574, v636, v697, v757, v816, v874, v931, v987);
  uint64_t v72 = sub_A938(v64, v65, v66, v67, v68, v69, v70, v71, v513, v575, v637, v698, v758, v817, v875, v932, v988, v1043);
  uint64_t v80 = sub_A930( v72,  v73,  v74,  v75,  v76,  v77,  v78,  v79,  v514,  v576,  v638,  v699,  v759,  v818,  v876,  v933,  v989,  v1044,  v1098);
  uint64_t v88 = sub_A928( v80,  v81,  v82,  v83,  v84,  v85,  v86,  v87,  v515,  v577,  v639,  v700,  v760,  v819,  v877,  v934,  v990,  v1045,  v1099,  v1152);
  uint64_t v96 = sub_A920( v88,  v89,  v90,  v91,  v92,  v93,  v94,  v95,  v516,  v578,  v640,  v701,  v761,  v820,  v878,  v935,  v991,  v1046,  v1100,  v1153,  v1205);
  uint64_t v104 = sub_36374( v96,  v97,  v98,  v99,  v100,  v101,  v102,  v103,  v517,  v579,  v641,  v702,  v762,  v821,  v879,  v936,  v992,  v1047,  v1101,  v1154,  v1206,  v1257);
  uint64_t v112 = sub_3636C( v104,  v105,  v106,  v107,  v108,  v109,  v110,  v111,  v518,  v580,  v642,  v703,  v763,  v822,  v880,  v937,  v993,  v1048,  v1102,  v1155,  v1207,  v1258,  v1308);
  uint64_t v120 = sub_36364( v112,  v113,  v114,  v115,  v116,  v117,  v118,  v119,  v519,  v581,  v643,  v704,  v764,  v823,  v881,  v938,  v994,  v1049,  v1103,  v1156,  v1208,  v1259,  v1309,  v1358);
  uint64_t v128 = sub_363F0( v120,  v121,  v122,  v123,  v124,  v125,  v126,  v127,  v520,  v582,  v644,  v705,  v765,  v824,  v882,  v939,  v995,  v1050,  v1104,  v1157,  v1209,  v1260,  v1310,  v1359,  v1407);
  uint64_t v136 = sub_36430( v128,  v129,  v130,  v131,  v132,  v133,  v134,  v135,  v521,  v583,  v645,  v706,  v766,  v825,  v883,  v940,  v996,  v1051,  v1105,  v1158,  v1210,  v1261,  v1311,  v1360,  v1408,  v1455);
  uint64_t v144 = sub_36428( v136,  v137,  v138,  v139,  v140,  v141,  v142,  v143,  v522,  v584,  v646,  v707,  v767,  v826,  v884,  v941,  v997,  v1052,  v1106,  v1159,  v1211,  v1262,  v1312,  v1361,  v1409,  v1456,  v1502);
  uint64_t v152 = sub_36478( v144,  v145,  v146,  v147,  v148,  v149,  v150,  v151,  v523,  v585,  v647,  v708,  v768,  v827,  v885,  v942,  v998,  v1053,  v1107,  v1160,  v1212,  v1263,  v1313,  v1362,  v1410,  v1457,  v1503,  v1548);
  uint64_t v160 = sub_36524( v152,  v153,  v154,  v155,  v156,  v157,  v158,  v159,  v524,  v586,  v648,  v709,  v769,  v828,  v886,  v943,  v999,  v1054,  v1108,  v1161,  v1213,  v1264,  v1314,  v1363,  v1411,  v1458,  v1504,  v1549,  v1593);
  uint64_t v168 = sub_3651C( v160,  v161,  v162,  v163,  v164,  v165,  v166,  v167,  v525,  v587,  v649,  v710,  v770,  v829,  v887,  v944,  v1000,  v1055,  v1109,  v1162,  v1214,  v1265,  v1315,  v1364,  v1412,  v1459,  v1505,  v1550,  v1594,  v1637);
  uint64_t v176 = sub_36514( v168,  v169,  v170,  v171,  v172,  v173,  v174,  v175,  v526,  v588,  v650,  v711,  v771,  v830,  v888,  v945,  v1001,  v1056,  v1110,  v1163,  v1215,  v1266,  v1316,  v1365,  v1413,  v1460,  v1506,  v1551,  v1595,  v1638,  v1680);
  uint64_t v184 = sub_3650C( v176,  v177,  v178,  v179,  v180,  v181,  v182,  v183,  v527,  v589,  v651,  v712,  v772,  v831,  v889,  v946,  v1002,  v1057,  v1111,  v1164,  v1216,  v1267,  v1317,  v1366,  v1414,  v1461,  v1507,  v1552,  v1596,  v1639,  v1681,  v1722);
  uint64_t v192 = sub_36504( v184,  v185,  v186,  v187,  v188,  v189,  v190,  v191,  v528,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112,  v1165,  v1217,  v1268,  v1318,  v1367,  v1415,  v1462,  v1508,  v1553,  v1597,  v1640,  v1682,  v1723,  v1763);
  uint64_t v200 = sub_364FC( v192,  v193,  v194,  v195,  v196,  v197,  v198,  v199,  v529,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166,  v1218,  v1269,  v1319,  v1368,  v1416,  v1463,  v1509,  v1554,  v1598,  v1641,  v1683,  v1724,  v1764,  v1803);
  uint64_t v208 = sub_364F4( v200,  v201,  v202,  v203,  v204,  v205,  v206,  v207,  v530,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219,  v1270,  v1320,  v1369,  v1417,  v1464,  v1510,  v1555,  v1599,  v1642,  v1684,  v1725,  v1765,  v1804,  v1842);
  uint64_t v216 = sub_364EC( v208,  v209,  v210,  v211,  v212,  v213,  v214,  v215,  v531,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271,  v1321,  v1370,  v1418,  v1465,  v1511,  v1556,  v1600,  v1643,  v1685,  v1726,  v1766,  v1805,  v1843,  v1880);
  uint64_t v224 = sub_364E4( v216,  v217,  v218,  v219,  v220,  v221,  v222,  v223,  v532,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322,  v1371,  v1419,  v1466,  v1512,  v1557,  v1601,  v1644,  v1686,  v1727,  v1767,  v1806,  v1844,  v1881,  v1917);
  uint64_t v232 = sub_364DC( v224,  v225,  v226,  v227,  v228,  v229,  v230,  v231,  v533,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372,  v1420,  v1467,  v1513,  v1558,  v1602,  v1645,  v1687,  v1728,  v1768,  v1807,  v1845,  v1882,  v1918,  v1953);
  uint64_t v240 = sub_364D4( v232,  v233,  v234,  v235,  v236,  v237,  v238,  v239,  v534,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421,  v1468,  v1514,  v1559,  v1603,  v1646,  v1688,  v1729,  v1769,  v1808,  v1846,  v1883,  v1919,  v1954,  v1988);
  uint64_t v248 = sub_366F8( v240,  v241,  v242,  v243,  v244,  v245,  v246,  v247,  v535,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469,  v1515,  v1560,  v1604,  v1647,  v1689,  v1730,  v1770,  v1809,  v1847,  v1884,  v1920,  v1955,  v1989,  v2022);
  uint64_t v256 = sub_366F0( v248,  v249,  v250,  v251,  v252,  v253,  v254,  v255,  v536,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516,  v1561,  v1605,  v1648,  v1690,  v1731,  v1771,  v1810,  v1848,  v1885,  v1921,  v1956,  v1990,  v2023,  v2055);
  uint64_t v264 = sub_36B90( v256,  v257,  v258,  v259,  v260,  v261,  v262,  v263,  v537,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562,  v1606,  v1649,  v1691,  v1732,  v1772,  v1811,  v1849,  v1886,  v1922,  v1957,  v1991,  v2024,  v2056,  v2087);
  uint64_t v272 = sub_36EF4( v264,  v265,  v266,  v267,  v268,  v269,  v270,  v271,  v538,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607,  v1650,  v1692,  v1733,  v1773,  v1812,  v1850,  v1887,  v1923,  v1958,  v1992,  v2025,  v2057,  v2088,  v2118);
  uint64_t v280 = sub_36EEC( v272,  v273,  v274,  v275,  v276,  v277,  v278,  v279,  v539,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651,  v1693,  v1734,  v1774,  v1813,  v1851,  v1888,  v1924,  v1959,  v1993,  v2026,  v2058,  v2089,  v2119,  v2148);
  uint64_t v288 = sub_DD7E4( v280,  v281,  v282,  v283,  v284,  v285,  v286,  v287,  v540,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694,  v1735,  v1775,  v1814,  v1852,  v1889,  v1925,  v1960,  v1994,  v2027,  v2059,  v2090,  v2120,  v2149,  v2177);
  uint64_t v296 = sub_DD7DC( v288,  v289,  v290,  v291,  v292,  v293,  v294,  v295,  v541,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736,  v1776,  v1815,  v1853,  v1890,  v1926,  v1961,  v1995,  v2028,  v2060,  v2091,  v2121,  v2150,  v2178,  v2205);
  uint64_t v304 = sub_DD7D4( v296,  v297,  v298,  v299,  v300,  v301,  v302,  v303,  v542,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777,  v1816,  v1854,  v1891,  v1927,  v1962,  v1996,  v2029,  v2061,  v2092,  v2122,  v2151,  v2179,  v2206,  v2232);
  uint64_t v312 = sub_DD7CC( v304,  v305,  v306,  v307,  v308,  v309,  v310,  v311,  v543,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817,  v1855,  v1892,  v1928,  v1963,  v1997,  v2030,  v2062,  v2093,  v2123,  v2152,  v2180,  v2207,  v2233,  v2258);
  uint64_t v320 = sub_DD7C4( v312,  v313,  v314,  v315,  v316,  v317,  v318,  v319,  v544,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856,  v1893,  v1929,  v1964,  v1998,  v2031,  v2063,  v2094,  v2124,  v2153,  v2181,  v2208,  v2234,  v2259,  v2283);
  uint64_t v328 = sub_DD7BC( v320,  v321,  v322,  v323,  v324,  v325,  v326,  v327,  v545,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894,  v1930,  v1965,  v1999,  v2032,  v2064,  v2095,  v2125,  v2154,  v2182,  v2209,  v2235,  v2260,  v2284,
           v2307);
  uint64_t v336 = sub_DD7B4( v328,  v329,  v330,  v331,  v332,  v333,  v334,  v335,  v546,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931,  v1966,  v2000,  v2033,  v2065,  v2096,  v2126,  v2155,  v2183,  v2210,  v2236,  v2261,  v2285,
           v2308,
           v2330);
  uint64_t v344 = sub_DD7AC( v336,  v337,  v338,  v339,  v340,  v341,  v342,  v343,  v547,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967,  v2001,  v2034,  v2066,  v2097,  v2127,  v2156,  v2184,  v2211,  v2237,  v2262,  v2286,
           v2309,
           v2331,
           v2352);
  uint64_t v352 = sub_DD7A4( v344,  v345,  v346,  v347,  v348,  v349,  v350,  v351,  v548,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002,  v2035,  v2067,  v2098,  v2128,  v2157,  v2185,  v2212,  v2238,  v2263,  v2287,
           v2310,
           v2332,
           v2353,
           v2373);
  uint64_t v360 = sub_DD79C( v352,  v353,  v354,  v355,  v356,  v357,  v358,  v359,  v549,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036,  v2068,  v2099,  v2129,  v2158,  v2186,  v2213,  v2239,  v2264,  v2288,
           v2311,
           v2333,
           v2354,
           v2374,
           v2393);
  uint64_t v368 = sub_DD794( v360,  v361,  v362,  v363,  v364,  v365,  v366,  v367,  v550,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069,  v2100,  v2130,  v2159,  v2187,  v2214,  v2240,  v2265,  v2289,
           v2312,
           v2334,
           v2355,
           v2375,
           v2394,
           v2412);
  uint64_t v376 = sub_DD78C( v368,  v369,  v370,  v371,  v372,  v373,  v374,  v375,  v551,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101,  v2131,  v2160,  v2188,  v2215,  v2241,  v2266,  v2290,
           v2313,
           v2335,
           v2356,
           v2376,
           v2395,
           v2413,
           v2430);
  uint64_t v384 = sub_DD784( v376,  v377,  v378,  v379,  v380,  v381,  v382,  v383,  v552,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132,  v2161,  v2189,  v2216,  v2242,  v2267,  v2291,
           v2314,
           v2336,
           v2357,
           v2377,
           v2396,
           v2414,
           v2431,
           v2447);
  uint64_t v392 = sub_DD77C( v384,  v385,  v386,  v387,  v388,  v389,  v390,  v391,  v553,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162,  v2190,  v2217,  v2243,  v2268,  v2292,
           v2315,
           v2337,
           v2358,
           v2378,
           v2397,
           v2415,
           v2432,
           v2448,
           v2463);
  uint64_t v400 = sub_DD774( v392,  v393,  v394,  v395,  v396,  v397,  v398,  v399,  v554,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191,  v2218,  v2244,  v2269,  v2293,
           v2316,
           v2338,
           v2359,
           v2379,
           v2398,
           v2416,
           v2433,
           v2449,
           v2464,
           v2478);
  uint64_t v408 = sub_DD76C( v400,  v401,  v402,  v403,  v404,  v405,  v406,  v407,  v555,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219,  v2245,  v2270,  v2294,
           v2317,
           v2339,
           v2360,
           v2380,
           v2399,
           v2417,
           v2434,
           v2450,
           v2465,
           v2479,
           v2492);
  uint64_t v416 = sub_DD764( v408,  v409,  v410,  v411,  v412,  v413,  v414,  v415,  v556,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246,  v2271,  v2295,
           v2318,
           v2340,
           v2361,
           v2381,
           v2400,
           v2418,
           v2435,
           v2451,
           v2466,
           v2480,
           v2493,
           v2505);
  uint64_t v424 = sub_DD75C( v416,  v417,  v418,  v419,  v420,  v421,  v422,  v423,  v557,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272,  v2296,
           v2319,
           v2341,
           v2362,
           v2382,
           v2401,
           v2419,
           v2436,
           v2452,
           v2467,
           v2481,
           v2494,
           v2506,
           v2517);
  uint64_t v432 = sub_DD754( v424,  v425,  v426,  v427,  v428,  v429,  v430,  v431,  v558,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297,
           v2320,
           v2342,
           v2363,
           v2383,
           v2402,
           v2420,
           v2437,
           v2453,
           v2468,
           v2482,
           v2495,
           v2507,
           v2518,
           v2528);
  uint64_t v440 = sub_DD74C( v432,  v433,  v434,  v435,  v436,  v437,  v438,  v439,  v559,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321,
           v2343,
           v2364,
           v2384,
           v2403,
           v2421,
           v2438,
           v2454,
           v2469,
           v2483,
           v2496,
           v2508,
           v2519,
           v2529);
  uint64_t v448 = sub_DD744( v440,  v441,  v442,  v443,  v444,  v445,  v446,  v447,  v560,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344,
           v2365,
           v2385,
           v2404,
           v2422,
           v2439,
           v2455,
           v2470,
           v2484,
           v2497,
           v2509,
           v2520,
           v2530);
  uint64_t v456 = sub_DD73C( v448,  v449,  v450,  v451,  v452,  v453,  v454,  v455,  v561,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366,
           v2386,
           v2405,
           v2423,
           v2440,
           v2456,
           v2471,
           v2485,
           v2498,
           v2510,
           v2521,
           v2531);
  uint64_t v464 = sub_DD734( v456,  v457,  v458,  v459,  v460,  v461,  v462,  v463,  v562,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387,
           v2406,
           v2424,
           v2441,
           v2457,
           v2472,
           v2486,
           v2499,
           v2511,
           v2522,
           v2532);
  uint64_t v472 = sub_DD72C( v464,  v465,  v466,  v467,  v468,  v469,  v470,  v471,  v563,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407,
           v2425,
           v2442,
           v2458,
           v2473,
           v2487,
           v2500,
           v2512,
           v2523,
           v2533);
  uint64_t v480 = sub_DD724( v472,  v473,  v474,  v475,  v476,  v477,  v478,  v479,  v564,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426,
           v2443,
           v2459,
           v2474,
           v2488,
           v2501,
           v2513,
           v2524,
           v2534);
  uint64_t v488 = sub_DD71C( v480,  v481,  v482,  v483,  v484,  v485,  v486,  v487,  v565,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444,
           v2460,
           v2475,
           v2489,
           v2502,
           v2514,
           v2525,
           v2535);
  uint64_t v496 = sub_DD714( v488,  v489,  v490,  v491,  v492,  v493,  v494,  v495,  v566,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461,
           v2476,
           v2490,
           v2503,
           v2515,
           v2526,
           v2536);
  sub_DD70C( v496,  v497,  v498,  v499,  v500,  v501,  v502,  v503,  v567,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
    v2329,
    v2351,
    v2372,
    v2392,
    v2411,
    v2429,
    v2446,
    v2462,
    v2477,
    v2491,
    v2504,
    v2516,
    v2527,
    v2537);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  uint64_t v504 = (uint64_t (*)(void))sub_DE01C();
  return sub_36148(v504);
}

uint64_t sub_CE770()
{
  os_log_type_t v5 = sub_AB70();
  if (sub_46614(v5))
  {
    uint64_t v6 = (_WORD *)sub_3635C();
    sub_36908(v6);
    sub_DD494();
    sub_DA1C();
    sub_232EC( &dword_0,  v0,  v2,  "Couldn't create specificMedicationStatusBothSkipped_Dialog, returning GenericErrorFlow",  v3);
    sub_37128();
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  sub_3747C();
  uint64_t v7 = (void *)v1[3487];
  sub_DEA80();
  uint64_t v2555 = v8;
  uint64_t v2554 = v1[3282];
  uint64_t v9 = v1[3277];
  uint64_t v10 = v1[3276];
  sub_DDE20((_OWORD *)(v1[3247] + 64LL));
  sub_DE1C4(v1 + 1896);
  sub_A178();
  sub_DDFA4();

  sub_B25F0();
  sub_DA1C();
  sub_369F4();

  sub_BB2EC();
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v2554, v10);
  sub_DDE0C(v11, type metadata accessor for SnippetHeaderModel);
  sub_DDA68(v12, &qword_189D00);
  sub_DDBDC(v13, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v14 = sub_A78C();
  uint64_t v22 = sub_AAD8(v14, v15, v16, v17, v18, v19, v20, v21, v520, v583);
  uint64_t v30 = sub_A888(v22, v23, v24, v25, v26, v27, v28, v29, v521, v584, v646);
  uint64_t v38 = sub_A854(v30, v31, v32, v33, v34, v35, v36, v37, v522, v585, v647, v708);
  uint64_t v46 = sub_A84C(v38, v39, v40, v41, v42, v43, v44, v45, v523, v586, v648, v709, v769);
  uint64_t v54 = sub_A844(v46, v47, v48, v49, v50, v51, v52, v53, v524, v587, v649, v710, v770, v829);
  uint64_t v62 = sub_A83C(v54, v55, v56, v57, v58, v59, v60, v61, v525, v588, v650, v711, v771, v830, v888);
  uint64_t v70 = sub_A95C(v62, v63, v64, v65, v66, v67, v68, v69, v526, v589, v651, v712, v772, v831, v889, v946);
  uint64_t v78 = sub_A954(v70, v71, v72, v73, v74, v75, v76, v77, v527, v590, v652, v713, v773, v832, v890, v947, v1003);
  uint64_t v86 = sub_A938(v78, v79, v80, v81, v82, v83, v84, v85, v528, v591, v653, v714, v774, v833, v891, v948, v1004, v1059);
  uint64_t v94 = sub_A930( v86,  v87,  v88,  v89,  v90,  v91,  v92,  v93,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114);
  uint64_t v102 = sub_A928( v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168);
  uint64_t v110 = sub_A920( v102,  v103,  v104,  v105,  v106,  v107,  v108,  v109,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221);
  uint64_t v118 = sub_36374( v110,  v111,  v112,  v113,  v114,  v115,  v116,  v117,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273);
  uint64_t v126 = sub_3636C( v118,  v119,  v120,  v121,  v122,  v123,  v124,  v125,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324);
  uint64_t v134 = sub_36364( v126,  v127,  v128,  v129,  v130,  v131,  v132,  v133,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374);
  uint64_t v142 = sub_363F0( v134,  v135,  v136,  v137,  v138,  v139,  v140,  v141,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423);
  uint64_t v150 = sub_36430( v142,  v143,  v144,  v145,  v146,  v147,  v148,  v149,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471);
  uint64_t v158 = sub_36428( v150,  v151,  v152,  v153,  v154,  v155,  v156,  v157,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518);
  uint64_t v166 = sub_36478( v158,  v159,  v160,  v161,  v162,  v163,  v164,  v165,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564);
  uint64_t v174 = sub_36524( v166,  v167,  v168,  v169,  v170,  v171,  v172,  v173,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609);
  uint64_t v182 = sub_3651C( v174,  v175,  v176,  v177,  v178,  v179,  v180,  v181,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653);
  uint64_t v190 = sub_36514( v182,  v183,  v184,  v185,  v186,  v187,  v188,  v189,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696);
  uint64_t v198 = sub_3650C( v190,  v191,  v192,  v193,  v194,  v195,  v196,  v197,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738);
  uint64_t v206 = sub_36504( v198,  v199,  v200,  v201,  v202,  v203,  v204,  v205,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779);
  uint64_t v214 = sub_364FC( v206,  v207,  v208,  v209,  v210,  v211,  v212,  v213,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819);
  uint64_t v222 = sub_364F4( v214,  v215,  v216,  v217,  v218,  v219,  v220,  v221,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858);
  uint64_t v230 = sub_364EC( v222,  v223,  v224,  v225,  v226,  v227,  v228,  v229,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896);
  uint64_t v238 = sub_364E4( v230,  v231,  v232,  v233,  v234,  v235,  v236,  v237,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933);
  uint64_t v246 = sub_364DC( v238,  v239,  v240,  v241,  v242,  v243,  v244,  v245,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969);
  uint64_t v254 = sub_364D4( v246,  v247,  v248,  v249,  v250,  v251,  v252,  v253,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004);
  uint64_t v262 = sub_366F8( v254,  v255,  v256,  v257,  v258,  v259,  v260,  v261,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038);
  uint64_t v270 = sub_366F0( v262,  v263,  v264,  v265,  v266,  v267,  v268,  v269,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071);
  uint64_t v278 = sub_36B90( v270,  v271,  v272,  v273,  v274,  v275,  v276,  v277,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103);
  uint64_t v286 = sub_36EF4( v278,  v279,  v280,  v281,  v282,  v283,  v284,  v285,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134);
  uint64_t v294 = sub_36EEC( v286,  v287,  v288,  v289,  v290,  v291,  v292,  v293,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164);
  uint64_t v302 = sub_DD7E4( v294,  v295,  v296,  v297,  v298,  v299,  v300,  v301,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193);
  uint64_t v310 = sub_DD7DC( v302,  v303,  v304,  v305,  v306,  v307,  v308,  v309,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221);
  uint64_t v318 = sub_DD7D4( v310,  v311,  v312,  v313,  v314,  v315,  v316,  v317,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248);
  uint64_t v326 = sub_DD7CC( v318,  v319,  v320,  v321,  v322,  v323,  v324,  v325,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274);
  uint64_t v334 = sub_DD7C4( v326,  v327,  v328,  v329,  v330,  v331,  v332,  v333,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299);
  uint64_t v342 = sub_DD7BC( v334,  v335,  v336,  v337,  v338,  v339,  v340,  v341,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323);
  uint64_t v350 = sub_DD7B4( v342,  v343,  v344,  v345,  v346,  v347,  v348,  v349,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346);
  uint64_t v358 = sub_DD7AC( v350,  v351,  v352,  v353,  v354,  v355,  v356,  v357,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368);
  uint64_t v366 = sub_DD7A4( v358,  v359,  v360,  v361,  v362,  v363,  v364,  v365,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389);
  uint64_t v374 = sub_DD79C( v366,  v367,  v368,  v369,  v370,  v371,  v372,  v373,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409);
  uint64_t v382 = sub_DD794( v374,  v375,  v376,  v377,  v378,  v379,  v380,  v381,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428);
  uint64_t v390 = sub_DD78C( v382,  v383,  v384,  v385,  v386,  v387,  v388,  v389,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446);
  uint64_t v398 = sub_DD784( v390,  v391,  v392,  v393,  v394,  v395,  v396,  v397,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463);
  uint64_t v406 = sub_DD77C( v398,  v399,  v400,  v401,  v402,  v403,  v404,  v405,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479);
  uint64_t v414 = sub_DD774( v406,  v407,  v408,  v409,  v410,  v411,  v412,  v413,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494);
  uint64_t v422 = sub_DD76C( v414,  v415,  v416,  v417,  v418,  v419,  v420,  v421,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508);
  uint64_t v430 = sub_DD764( v422,  v423,  v424,  v425,  v426,  v427,  v428,  v429,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521);
  uint64_t v438 = sub_DD75C( v430,  v431,  v432,  v433,  v434,  v435,  v436,  v437,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533);
  uint64_t v446 = sub_DD754( v438,  v439,  v440,  v441,  v442,  v443,  v444,  v445,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v454 = sub_DD74C( v446,  v447,  v448,  v449,  v450,  v451,  v452,  v453,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v462 = sub_DD744( v454,  v455,  v456,  v457,  v458,  v459,  v460,  v461,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v470 = sub_DD73C( v462,  v463,  v464,  v465,  v466,  v467,  v468,  v469,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v478 = sub_DD734( v470,  v471,  v472,  v473,  v474,  v475,  v476,  v477,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v486 = sub_DD72C( v478,  v479,  v480,  v481,  v482,  v483,  v484,  v485,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v494 = sub_DD724( v486,  v487,  v488,  v489,  v490,  v491,  v492,  v493,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  uint64_t v502 = sub_DD71C( v494,  v495,  v496,  v497,  v498,  v499,  v500,  v501,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518,
           v2530,
           v2541,
           v2551);
  uint64_t v510 = sub_DD714( v502,  v503,  v504,  v505,  v506,  v507,  v508,  v509,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
           v2344,
           v2366,
           v2387,
           v2407,
           v2426,
           v2444,
           v2461,
           v2477,
           v2492,
           v2506,
           v2519,
           v2531,
           v2542,
           v2552);
  sub_DD70C( v510,  v511,  v512,  v513,  v514,  v515,  v516,  v517,  v582,  v645,  v707,  v768,  v828,  v887,  v945,  v1002,  v1058,  v1113,  v1167,  v1220,  v1272,  v1323,  v1373,  v1422,  v1470,  v1517,  v1563,  v1608,  v1652,  v1695,  v1737,  v1778,  v1818,  v1857,  v1895,  v1932,  v1968,  v2003,  v2037,  v2070,  v2102,  v2133,  v2163,  v2192,  v2220,  v2247,  v2273,  v2298,  v2322,
    v2345,
    v2367,
    v2388,
    v2408,
    v2427,
    v2445,
    v2462,
    v2478,
    v2493,
    v2507,
    v2520,
    v2532,
    v2543,
    v2553);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v518 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v518);
}

uint64_t sub_CEB68()
{
  return sub_A5D0();
}

uint64_t sub_CEB94()
{
  uint64_t v3 = *(void *)(v1 + 28128);
  uint64_t v4 = *(os_log_s **)(v1 + 25888);
  *(void *)(v1 + 28136) = v4;
  uint64_t v5 = swift_unknownObjectRelease(v3);
  uint64_t v6 = v4;
  uint64_t v7 = (*(uint64_t (**)(uint64_t))((char *)&stru_20.maxprot + (swift_isaMask & *(void *)v4)))(v5);
  switch(v7)
  {
    case 4LL:
      uint64_t v21 = *(void (**)(uint64_t))(v1 + 27384);
      uint64_t v22 = *(void *)(v1 + 27376);
      uint64_t v23 = *(void *)(v1 + 26920);
      sub_DEDC8(*(void *)(v1 + 27416));
      sub_A5DC(v22, v1 + 25328);
      uint64_t v24 = sub_DEBCC();
      v21(v24);
      sub_AB5C();
      os_log_type_t v25 = sub_AB70();
      if (sub_A634(v25))
      {
        uint64_t v26 = *(void *)(v1 + 28104);
        uint64_t v27 = (uint8_t *)sub_3635C();
        *(void *)&v2834[0] = 0LL;
        *(void *)&v2833[0] = 0LL;
        sub_DD4BC(v27);
        sub_DE578();
        uint64_t v2831 = v26;
        sub_B25F0();
        sub_232EC( &dword_0,  (os_log_s *)(v1 + 25328),  (os_log_type_t)v23,  "Received successful intent response, creating output.",  v27);
        sub_5050((uint64_t)v27);

        uint64_t v28 = sub_DED98();
      }

      else
      {
        sub_DE124();
        swift_bridgeObjectRelease();
        uint64_t v28 = sub_DEE0C();
        uint64_t v2831 = *(void *)(v1 + 28104);
      }

      sub_DE7D0( v28,  (SEL *)&selRef_matchingMedsBeforeUpdate,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v66) {
        uint64_t v67 = v66;
      }
      else {
        uint64_t v67 = _swiftEmptyArrayStorage;
      }
      sub_D91E4((uint64_t)v67);
      sub_1EBF4();
      id v68 = -[os_log_s medCount](v4, "medCount");
      if (v68)
      {
        uint64_t v69 = v68;
        uint64_t v2821 = (void *)(v1 + 20168);
        uint64_t v70 = *(void *)(v1 + 26200);
        uint64_t v71 = *(void *)(v1 + 25976);
        [v68 doubleValue];
        uint64_t v73 = v72;

        uint64_t v74 = *(void *)(v71 + 16);
        uint64_t v75 = v4;
        sub_363E8();
        uint64_t v76 = (void *)sub_1EB8C();
        sub_D69DC(v76, v77, v78);
        static DialogPhase.completion.getter(v79, v80, v81, v82, v83, v84, v85, v86);
        sub_DDDB4(v70, (uint64_t)PhoneRingsSnippet.body.getter);
        uint64_t v87 = sub_DE46C();
        sub_A304(v87, v88);
        sub_500C((void *)(v1 + 20368), *(void *)(v1 + 20392));
        sub_DEB94();
        sub_500C((void *)(v1 + 20328), *(void *)(v1 + 20352));
        if ((sub_DEBA4() & 1) != 0)
        {
          uint64_t v89 = sub_DE780();
          unsigned __int8 v91 = 4;
        }

        else
        {
          sub_DDAF8();
          uint64_t v157 = (void *)sub_DEBDC();
          sub_500C(v157, v158);
          sub_DDB18();
          uint64_t v74 = sub_DD9B0((void *)(v1 + 20248));
          _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v1 + 20248));
          sub_9BC44();
          uint64_t v89 = sub_DE780();
          if ((v74 & 1) != 0) {
            unsigned __int8 v91 = 4;
          }
          else {
            unsigned __int8 v91 = 0;
          }
        }

        sub_DDA20(v89, v90, v91);
        sub_DE62C(v74);
        sub_500C((void *)(v1 + 20208), *(void *)(v1 + 20232));
        sub_DEB94();
        sub_500C(v2821, *(void *)(v1 + 20192));
        if ((sub_DEBA4() & 1) != 0)
        {
          sub_DE760(v2821);
          uint64_t v159 = 11LL;
        }

        else
        {
          sub_DDAF8();
          sub_500C((void *)(v1 + 20128), *(void *)(v1 + 20152));
          sub_DD4CC();
          char v160 = sub_DD92C((void *)(v1 + 20088));
          _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v1 + 20088));
          sub_9BC44();
          sub_DE760(v2821);
          if ((v160 & 1) != 0) {
            uint64_t v159 = 11LL;
          }
          else {
            uint64_t v159 = 9LL;
          }
        }

        uint64_t v161 = *(unsigned __int8 *)(v1 + 27552);
        uint64_t v162 = HealthApps.rawValue.getter(v159);
        *(void *)(v1 + 28144) = v164;
        *(void *)(v1 + 28152) = v162;
        if (v161 != 5)
        {
          uint64_t v180 = *(void *)(v1 + 26512);
          uint64_t v181 = *(void *)(v1 + 26384);
          uint64_t v182 = *(void *)(v1 + 26328);
          uint64_t v183 = *(int *)(*(void *)(v1 + 26320) + 36LL);
          *(_DWORD *)(v1 + 28512) = v183;
          uint64_t v184 = (uint64_t *)(v182 + v183);
          uint64_t v185 = *v184;
          uint64_t v186 = *((unsigned __int8 *)v184 + 8);
          sub_A66C(v180, 1LL, v163, v181);
          if ((v186 & 1) == 0)
          {
            uint64_t v186 = *(void *)(v1 + 26512);
            uint64_t v187 = *(void *)(v1 + 26504);
            uint64_t v188 = *(void *)(v1 + 26384);
            uint64_t v189 = sub_494C(&qword_18D778);
            uint64_t v190 = sub_20308(v189, 72LL);
            uint64_t v191 = sub_DECE0(v190);
            v192[3] = &type metadata for Double;
            v192[4] = &protocol witness table for Double;
            *uint64_t v192 = v185;
            uint64_t v193 = PhoneRingsSnippet.body.getter(v191);
            uint64_t v194 = sub_DE068(v193);
            sub_DEE50(v194, v195);
            sub_36C34();
            sub_DED7C(v186);
            _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(v187, 0LL, 1LL, v188);
            uint64_t v196 = sub_DEB0C();
            sub_DADFC(v196, v197, v198);
          }

          uint64_t v199 = *(void *)(v1 + 26488);
          uint64_t v200 = *(char **)(v1 + 26328);
          uint64_t v201 = *(int **)(v1 + 26320);
          sub_DE3E4();
          *(void *)(v1 + 28312) = v186;
          char v202 = *v200;
          sub_9A688(v203, 1LL);
          sub_363E8();
          sub_DA6D8(v75, (SEL *)&selRef_medSchedule);
          if (!v205) {
            uint64_t v204 = 0LL;
          }
          sub_DE710(v204);
          sub_2A184();
          sub_9A688(v199, 0LL);
          char v206 = v200[v201[8]];
          uint64_t v207 = &v200[v201[10]];
          char v208 = v200[v201[11]];
          uint64_t v209 = (void *)swift_task_alloc(dword_190C3C);
          *(void *)(v1 + 28320) = v209;
          *uint64_t v209 = v1;
          v209[1] = sub_D37C0;
          uint64_t v210 = *(void *)(v1 + 26512);
          uint64_t v211 = *(void *)(v1 + 26496);
          uint64_t v212 = *(void *)(v1 + 26488);
          char v2837 = v208;
          v2836[16] = v207;
          return sub_132434(v202, *(double *)&v73 == 1.0, v211, v212, v73, 0, v206, v210);
        }

        uint64_t v165 = *(void *)(v1 + 27600);
        uint64_t v166 = *(void (**)(uint64_t))(v1 + 27384);
        uint64_t v167 = *(os_log_s **)(v1 + 27376);
        sub_A5DC((uint64_t)v167, v1 + 25616);
        uint64_t v168 = sub_DEB0C();
        v166(v168);
        uint64_t v169 = sub_20308((uint64_t)&unk_17FC08, 24LL);
        *(void *)(v169 + 16) = v75;
        uint64_t v2827 = v75;
        sub_A86C();
        os_log_type_t v170 = sub_AB70();
        uint64_t v171 = sub_20308((uint64_t)&unk_17FC30, 17LL);
        *(_BYTE *)(v171 + 16) = 32;
        uint64_t v172 = sub_20308((uint64_t)&unk_17FC58, 17LL);
        sub_DE91C(v172);
        uint64_t v173 = sub_20308((uint64_t)&unk_17FC80, 32LL);
        *(void *)(v173 + 16) = sub_DA988;
        *(void *)(v173 + 24) = v169;
        uint64_t v174 = sub_20308((uint64_t)&unk_17FCA8, 32LL);
        *(void *)(v174 + 16) = sub_DBD74;
        *(void *)(v174 + 24) = v173;
        uint64_t v175 = sub_20308(v165, 80LL);
        sub_DE4D8(v175);
        *uint64_t v176 = sub_DBD84;
        v176[1] = v171;
        v176[2] = sub_DBD84;
        v176[3] = v172;
        v176[4] = sub_DBD7C;
        v176[5] = v174;
        sub_DEA04();
        sub_41D48();
        sub_36C5C();
        uint64_t v177 = sub_2A184();
        if (sub_DE7E0(v177, v170))
        {
          uint64_t v178 = (_WORD *)sub_DE58C();
          uint64_t v2818 = sub_A5E8(32LL);
          *(void *)&v2834[0] = v2818;
          *uint64_t v178 = 258;
          uint64_t v2835 = v178 + 1;
          v2836[0] = 0LL;
          *(void *)&v2833[0] = sub_DBD84;
          *((void *)&v2833[0] + 1) = v171;
          sub_387E0( (uint64_t (**)(uint64_t, uint64_t, uint64_t))v2833,  (uint64_t)&v2835,  (uint64_t)v2836,  (uint64_t)v2834);
          if (v2831)
          {
            sub_DDC60();
            return swift_errorRelease(v179);
          }

          sub_A37E4();
          *(void *)&v2833[0] = sub_DBD84;
          *((void *)&v2833[0] + 1) = v172;
          sub_DE810();
          sub_39BAC();
          *(void *)&v2833[0] = sub_DBD7C;
          *((void *)&v2833[0] + 1) = v174;
          sub_DE810();
          uint64_t v769 = *(uint64_t (**)(uint64_t))(v1 + 28112);
          uint64_t v172 = *(void *)(v1 + 26736);
          sub_37110();
          sub_DDDF4(&dword_0, v167, v170, "got .rejectedOverwriteInGroup, starting with %s matchingMeds");
          sub_A81C(v2818);
          sub_5050(v2818);
          sub_DE340();

          uint64_t v770 = sub_DEB1C();
          uint64_t v727 = v769(v770);
          uint64_t v2831 = 0LL;
        }

        else
        {
          uint64_t v725 = *(uint64_t (**)(uint64_t))(v1 + 28112);
          sub_DDA50();
          sub_37110();
          sub_39BAC();
          sub_A37E4();
          uint64_t v726 = sub_372A0();
          uint64_t v727 = v725(v726);
        }

        sub_DEA2C( v727,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
        if (!v728) {
          goto LABEL_73;
        }
        uint64_t v729 = v728;
        sub_BFBDC(v728);
        uint64_t v731 = v730;
        sub_249D4();
        if (v731 == 1)
        {
          sub_DE3E4();
          *(void *)(v1 + 28216) = v729;
          uint64_t v735 = sub_363E8();
          sub_DEA2C( v735,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
          if (v736 && (id v738 = sub_DEE20(v736), sub_2A184(), v738) && (sub_134BCC(v738), v740))
          {
            String.toSpeakableString.getter(v739, v740);
            sub_2A184();
            uint64_t v741 = 0LL;
          }

          else
          {
            uint64_t v741 = 1LL;
          }

          sub_A66C(*(void *)(v1 + 26536), v741, v737, *(void *)(v1 + 26384));
          uint64_t v752 = (void *)swift_task_alloc(dword_190BF4);
          *(void *)(v1 + 28224) = v752;
          *uint64_t v752 = v1;
          v752[1] = sub_D15B4;
          goto LABEL_87;
        }

        if (!v731)
        {
LABEL_73:
          uint64_t v732 = *(void *)(v1 + 26544);
          uint64_t v733 = *(void *)(v1 + 25976);
          sub_1EBF4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          *(void *)(v1 + 28160) = *(void *)(v733 + 336);
          sub_DE99C(v732);
          sub_372CC();
          uint64_t v734 = (void *)sub_A5B8();
          *(void *)(v1 + 28168) = v734;
          *uint64_t v734 = v1;
          v734[1] = sub_D0A80;
LABEL_87:
          sub_DDC60();
          return sub_1317D4(v754, v755, v756);
        }

        sub_1EBF4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v742 = swift_bridgeObjectRelease();
        sub_DEA2C( v742,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
        if (v743)
        {
          uint64_t v744 = *(void *)(v1 + 25976);
          sub_BFBDC(v743);
          sub_249D4();
          *(void *)(v1 + 28256) = *(void *)(v744 + 336);
          uint64_t v745 = sub_363E8();
          sub_DEA2C( v745,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
          if (v746 && (id v748 = sub_DE6C4(v746), sub_6D64(), v748) && (sub_134BCC(v748), v750))
          {
            String.toSpeakableString.getter(v749, v750);
            sub_6D64();
            uint64_t v751 = 0LL;
          }

          else
          {
            uint64_t v751 = 1LL;
          }

          sub_A66C(*(void *)(v1 + 26528), v751, v747, *(void *)(v1 + 26384));
          uint64_t v753 = (void *)swift_task_alloc(dword_190BF4);
          *(void *)(v1 + 28264) = v753;
          *uint64_t v753 = v1;
          v753[1] = sub_D21CC;
          goto LABEL_87;
        }

        sub_DE8F0(14368LL);
        uint64_t v758 = *(void (**)(uint64_t))(v1 + 27384);
        uint64_t v759 = *(os_log_s **)(v1 + 27376);
        sub_A5DC((uint64_t)v759, v1 + v757);
        uint64_t v760 = sub_DEB0C();
        v758(v760);
        sub_A86C();
        os_log_type_t v761 = sub_A898();
        BOOL v762 = sub_46514(v761);
        uint64_t v763 = *(void (**)(uint64_t))(v1 + 28112);
        if (v762)
        {
          uint64_t v764 = (uint8_t *)sub_3635C();
          *(void *)&v2834[0] = 0LL;
          *(void *)&v2833[0] = 0LL;
          sub_DD4BC(v764);
          uint64_t v765 = sub_DEC8C();
          sub_D9904(v765, v766, v767, v768);
          sub_82234();
          sub_232EC( &dword_0,  v759,  (os_log_type_t)v172,  "Couldn't create logMedConfirmationRejected_Dialog, returning GenericErrorFlow",  v764);
          sub_DDDAC();
        }

        else
        {

          swift_bridgeObjectRelease();
        }

        uint64_t v771 = sub_37084();
        v763(v771);
        uint64_t v772 = *(void **)(v1 + 28136);
        uint64_t v773 = *(void **)(v1 + 28120);
        sub_DE6CC();
        uint64_t v2815 = *(void *)(v1 + 26328);
        uint64_t v2813 = *(void *)(v1 + 26248);
        uint64_t v774 = *(void *)(v1 + 26216);
        uint64_t v2811 = *(void *)(v1 + 26208);
        uint64_t v775 = (_OWORD *)sub_DE9DC();
        sub_DE1BC(v775);
        sub_DE338(v2827);
        sub_A178();
        sub_DED2C();

        sub_DA1C();
        sub_B25F0();

        uint64_t v776 = sub_DED1C();
        sub_57F00((uint64_t)v776, &qword_189CF8);
        (*(void (**)(uint64_t, uint64_t))(v774 + 8))(v2813, v2811);
        sub_26F04(v2815, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
        sub_26F04(v2816, type metadata accessor for SnippetHeaderModel);
        uint64_t v216 = v2818;
      }

      else
      {
        sub_DE8F0(17248LL);
        uint64_t v135 = (void *)(v1 + v134);
        uint64_t v137 = (os_log_s *)(v1 + v136);
        uint64_t v138 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 27384);
        uint64_t v139 = *(void *)(v1 + 27376);
        uint64_t v140 = *(void *)(v1 + 26848);
        uint64_t v141 = *(void *)(v1 + 26736);
        sub_DDD24();
        swift_bridgeObjectRelease();
        sub_DEB68();
        swift_bridgeObjectRelease();
        sub_DE3A8();
        swift_bridgeObjectRelease();
        sub_A5DC(v139, (uint64_t)v137);
        v138(v140, v139, v141);
        sub_37018();
        os_log_type_t v142 = sub_AB70();
        BOOL v143 = sub_37140(v142);
        uint64_t v144 = *(void *)(v1 + 26848);
        if (v143)
        {
          uint64_t v2823 = v135;
          uint64_t v145 = (uint8_t *)sub_3635C();
          *(void *)&v2834[0] = 0LL;
          *(void *)&v2833[0] = 0LL;
          sub_DD4BC(v145);
          sub_D9904((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v2836, (uint64_t)v2834, (uint64_t)v2833);
          sub_36C34();
          sub_232EC( &dword_0,  v137,  (os_log_type_t)v138,  "There were no doseEvents in the chosen schedule, returning GenericErrorFlow",  v145);
          uint64_t v146 = (uint64_t)v145;
          uint64_t v135 = v2823;
          sub_5050(v146);
        }

        else
        {

          swift_bridgeObjectRelease();
        }

        sub_DE60C();
        uint64_t v213 = *(void **)(v1 + 28120);
        uint64_t v2831 = *(void *)(v1 + 26728);
        uint64_t v214 = (_OWORD *)sub_DE244();
        sub_7DFCC(v214);
        sub_5A9B0(v2826, v135);
        sub_A178();
        sub_DED2C();

        sub_6D64();
        sub_36C34();

        uint64_t v215 = sub_DED1C();
        sub_990D4((uint64_t)v215, type metadata accessor for SnippetHeaderModel);
        uint64_t v216 = v144;
      }

      sub_279E0(v216, &qword_189D00);
      uint64_t v65 = v2831;
      goto LABEL_67;
    case 5LL:
      sub_DD990();
      sub_DDD24();
      swift_bridgeObjectRelease();
      sub_DDFD8();
      swift_bridgeObjectRelease();
      sub_DDFCC();
      swift_bridgeObjectRelease();
      sub_2A184();
      sub_A5DC(v0, (uint64_t)v4);
      sub_DDBF0();
      sub_AB5C();
      os_log_type_t v29 = sub_AB70();
      BOOL v30 = sub_A988(v29);
      uint64_t v31 = *(void (**)(uint64_t))(v1 + 28112);
      if (v30)
      {
        uint64_t v32 = (uint8_t *)sub_3635C();
        *(void *)&v2834[0] = 0LL;
        *(void *)&v2833[0] = 0LL;
        uint64_t v33 = sub_DD4BC(v32);
        sub_DDA60((uint64_t)v33, (uint64_t)v2836, (uint64_t)v2834, (uint64_t)v2833);
        sub_DA1C();
        sub_232EC(&dword_0, v4, (os_log_type_t)v4, "Received failure intent response, creating output.", v32);
        sub_37128();

        uint64_t v34 = sub_373E0();
      }

      else
      {
        sub_DDA50();
        swift_bridgeObjectRelease();
        uint64_t v34 = sub_372A0();
      }

      v31(v34);
      sub_DE3E4();
      *(void *)(v1 + 28392) = v4;
      sub_363E8();
      uint64_t v92 = sub_732B8();
      getLocalizedMedName(from:)(v92, v93, v94, v95, v96, v97);
      uint64_t v99 = v98;
      uint64_t v101 = v100;
      sub_36BE0();
      if (v101)
      {
        sub_DE710(v99);
        sub_2A184();
        uint64_t v102 = 0LL;
      }

      else
      {
        uint64_t v102 = 1LL;
      }

      _s18WellnessFlowPlugin16WellnessSnippetsOwst_0(*(void *)(v1 + 26480), v102, 1LL, *(void *)(v1 + 26384));
      sub_DE07C();
      uint64_t v147 = (void *)swift_task_alloc(dword_190C2C);
      *(void *)(v1 + 28400) = v147;
      *uint64_t v147 = v1;
      v147[1] = sub_D5098;
      sub_DDC60();
      return sub_1320A4(v148, v149);
    case 110LL:
      sub_DEDD0();
      uint64_t v35 = *(void **)(v1 + 27440);
      uint64_t v36 = *(void (**)(uint64_t))(v1 + 27384);
      uint64_t v37 = *(void *)(v1 + 27376);
      sub_DDD24();
      swift_bridgeObjectRelease();
      sub_DE350();
      swift_bridgeObjectRelease();
      sub_DE25C();
      swift_bridgeObjectRelease();
      sub_6D64();
      uint64_t v38 = sub_DEBE8();
      sub_A5DC(v38, v39);
      uint64_t v40 = sub_DEA1C();
      v36(v40);
      sub_368A0();
      os_log_type_t v41 = sub_AB70();
      if (sub_A634(v41))
      {
        uint64_t v42 = (uint8_t *)sub_3635C();
        *(void *)&v2834[0] = 0LL;
        *(void *)&v2833[0] = 0LL;
        sub_DD4BC(v42);
        uint64_t v35 = _swiftEmptyArrayStorage;
        sub_DE578();
        sub_B25F0();
        sub_232EC( &dword_0,  v4,  (os_log_type_t)v37,  "SpecificMedLoggingFlow's .scheduleSelected case received .needsConfirmMixedLogging in intent response, creating confirmation.",  v42);
        sub_DE328();

        sub_DED98();
      }

      else
      {
        sub_DE124();
        swift_bridgeObjectRelease();
        sub_DEE0C();
      }

      uint64_t v103 = sub_DDB84();
      sub_DE7D0( v103,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
      if (v104)
      {
        uint64_t v105 = v104;
        uint64_t v2822 = *(void **)(v1 + 28120);
        sub_DE6E8();
        uint64_t v106 = *(void *)(v1 + 25976);
        type metadata accessor for LogMedScheduleMixedStatusConfirmationStrategy();
        uint64_t v107 = sub_72C38();
        getMedStatus(from:)(v107, v108, v109, v110, v111, v112);
        char v114 = v113;
        sub_36EBC();
        sub_BFCF4((uint64_t *)v2833);
        uint64_t v115 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATsSimple,  (uint64_t (*)(uint64_t, void))&CATWrapperSimple.__allocating_init(options:globals:));
        uint64_t v116 = sub_D6FFC( (void (*)(void))type metadata accessor for WellnessLoggingCATs,  (uint64_t (*)(uint64_t, void))&CATWrapper.__allocating_init(options:globals:));
        sub_D7060((uint64_t *)v2834);
        uint64_t v117 = sub_5F1B8(v114 & 1, v105, v2833, v115, v116, v2834);
        swift_retain();
        static OutputPublisherFactory.makeOutputPublisherAsync()(v2833);
        sub_BFB6C( v117,  (uint64_t)v2833,  &qword_18E9F0,  (uint64_t (*)(void))type metadata accessor for LogMedScheduleMixedStatusConfirmationStrategy);
        *(void *)(v1 + 25856) = v118;
        uint64_t v119 = sub_D7764(v106);
        sub_494C(&qword_18E9F0);
        sub_3586C(&qword_18E9F8, &qword_18E9F0);
        sub_DEE68(v1 + 25856, (uint64_t)v119);
        sub_36BE0();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_37110();

        sub_26F04(v2818, type metadata accessor for SnippetHeaderModel);
        sub_279E0((uint64_t)v2826, &qword_189D00);
        sub_279E0(v2829, &qword_18B168);
        sub_3652C();
        goto LABEL_68;
      }

      uint64_t v150 = *(os_log_s **)(v1 + 27376);
      uint64_t v151 = *(void *)(v1 + 26784);
      sub_A5DC((uint64_t)v150, v1 + 24704);
      sub_BB230(v151, (uint64_t)v150);
      sub_37018();
      os_log_type_t v152 = sub_AB70();
      BOOL v153 = sub_37140(v152);
      uint64_t v154 = *(void *)(v1 + 26784);
      if (v153)
      {
        uint64_t v155 = (uint8_t *)sub_3635C();
        *(void *)&v2834[0] = 0LL;
        *(void *)&v2833[0] = 0LL;
        uint64_t v156 = sub_DD4BC(v155);
        sub_DE634((uint64_t)v156, (uint64_t)v2836, (uint64_t)v2834, (uint64_t)v2833);
        sub_36C34();
        sub_232EC( &dword_0,  v150,  (os_log_type_t)v35,  "Needed confirmation for mixed logging, but intentResponse.matchingMeds was nil.",  v155);
        sub_37268();
      }

      else
      {

        swift_bridgeObjectRelease();
      }

      sub_DE60C();
      uint64_t v217 = *(void **)(v1 + 28120);
      uint64_t v2824 = *(void *)(v1 + 26728);
      uint64_t v218 = (_OWORD *)sub_DE244();
      sub_DE1BC(v218);
      sub_DE338((void *)(v1 + 5248));
      sub_A178();
      sub_36C08();

      sub_6D64();
      sub_36C34();

      uint64_t v219 = sub_36DD8();
      sub_990D4((uint64_t)v219, type metadata accessor for SnippetHeaderModel);
      sub_279E0(v154, &qword_189D00);
      uint64_t v65 = v2824;
LABEL_67:
      sub_279E0(v65, &qword_18B168);
LABEL_68:
      uint64_t v840 = *(void *)(v1 + 27288);
      uint64_t v903 = *(void *)(v1 + 27280);
      uint64_t v965 = *(void *)(v1 + 27272);
      uint64_t v1026 = *(void *)(v1 + 27264);
      uint64_t v1086 = *(void *)(v1 + 27256);
      uint64_t v1145 = *(void *)(v1 + 27248);
      uint64_t v1203 = *(void *)(v1 + 27240);
      uint64_t v1260 = *(void *)(v1 + 27232);
      uint64_t v1316 = *(void *)(v1 + 27224);
      uint64_t v1371 = *(void *)(v1 + 27216);
      uint64_t v1425 = *(void *)(v1 + 27208);
      uint64_t v1478 = *(void *)(v1 + 27200);
      uint64_t v1530 = *(void *)(v1 + 27192);
      uint64_t v1581 = *(void *)(v1 + 27184);
      uint64_t v1631 = *(void *)(v1 + 27176);
      uint64_t v1680 = *(void *)(v1 + 27168);
      uint64_t v1728 = *(void *)(v1 + 27160);
      uint64_t v1775 = *(void *)(v1 + 27152);
      uint64_t v1821 = *(void *)(v1 + 27144);
      uint64_t v1866 = *(void *)(v1 + 27136);
      uint64_t v1910 = *(void *)(v1 + 27128);
      uint64_t v1953 = *(void *)(v1 + 27120);
      uint64_t v1995 = *(void *)(v1 + 27112);
      uint64_t v2036 = *(void *)(v1 + 27104);
      uint64_t v2076 = *(void *)(v1 + 27096);
      uint64_t v2115 = *(void *)(v1 + 27088);
      uint64_t v2153 = *(void *)(v1 + 27080);
      uint64_t v2190 = *(void *)(v1 + 27072);
      uint64_t v2226 = *(void *)(v1 + 27064);
      uint64_t v2261 = *(void *)(v1 + 27056);
      uint64_t v2295 = *(void *)(v1 + 27048);
      uint64_t v2328 = *(void *)(v1 + 27040);
      uint64_t v2360 = *(void *)(v1 + 27032);
      uint64_t v2391 = *(void *)(v1 + 27024);
      uint64_t v2421 = *(void *)(v1 + 27016);
      uint64_t v2450 = *(void *)(v1 + 27008);
      uint64_t v2478 = *(void *)(v1 + 27000);
      uint64_t v2505 = *(void *)(v1 + 26992);
      uint64_t v2531 = *(void *)(v1 + 26984);
      uint64_t v2556 = *(void *)(v1 + 26976);
      uint64_t v2580 = *(void *)(v1 + 26968);
      uint64_t v2603 = *(void *)(v1 + 26960);
      uint64_t v2625 = *(void *)(v1 + 26952);
      uint64_t v2646 = *(void *)(v1 + 26944);
      uint64_t v2666 = *(void *)(v1 + 26936);
      uint64_t v2685 = *(void *)(v1 + 26928);
      uint64_t v2703 = *(void *)(v1 + 26920);
      uint64_t v2720 = *(void *)(v1 + 26912);
      uint64_t v2736 = *(void *)(v1 + 26904);
      uint64_t v2751 = *(void *)(v1 + 26896);
      uint64_t v2765 = *(void *)(v1 + 26888);
      uint64_t v2778 = *(void *)(v1 + 26880);
      uint64_t v2790 = *(void *)(v1 + 26872);
      uint64_t v2801 = *(void *)(v1 + 26864);
      uint64_t v2820 = *(void *)(v1 + 26024);
      uint64_t v2825 = *(void *)(v1 + 26016);
      uint64_t v2828 = *(void *)(v1 + 26008);
      uint64_t v2832 = *(void *)(v1 + 25984);
      swift_task_dealloc(*(void *)(v1 + 27368));
      sub_A8F4();
      sub_A85C();
      sub_A864();
      sub_A910();
      sub_A8EC();
      sub_A760();
      sub_A7C8();
      sub_A67C();
      uint64_t v220 = sub_A78C();
      uint64_t v228 = sub_AAD8(v220, v221, v222, v223, v224, v225, v226, v227, v777, v840);
      uint64_t v236 = sub_A888(v228, v229, v230, v231, v232, v233, v234, v235, v778, v841, v903);
      uint64_t v244 = sub_A854(v236, v237, v238, v239, v240, v241, v242, v243, v779, v842, v904, v965);
      uint64_t v252 = sub_A84C(v244, v245, v246, v247, v248, v249, v250, v251, v780, v843, v905, v966, v1026);
      uint64_t v260 = sub_A844(v252, v253, v254, v255, v256, v257, v258, v259, v781, v844, v906, v967, v1027, v1086);
      uint64_t v268 = sub_A83C(v260, v261, v262, v263, v264, v265, v266, v267, v782, v845, v907, v968, v1028, v1087, v1145);
      uint64_t v276 = sub_A95C( v268,  v269,  v270,  v271,  v272,  v273,  v274,  v275,  v783,  v846,  v908,  v969,  v1029,  v1088,  v1146,  v1203);
      uint64_t v284 = sub_A954( v276,  v277,  v278,  v279,  v280,  v281,  v282,  v283,  v784,  v847,  v909,  v970,  v1030,  v1089,  v1147,  v1204,  v1260);
      uint64_t v292 = sub_A938( v284,  v285,  v286,  v287,  v288,  v289,  v290,  v291,  v785,  v848,  v910,  v971,  v1031,  v1090,  v1148,  v1205,  v1261,  v1316);
      uint64_t v300 = sub_A930( v292,  v293,  v294,  v295,  v296,  v297,  v298,  v299,  v786,  v849,  v911,  v972,  v1032,  v1091,  v1149,  v1206,  v1262,  v1317,  v1371);
      uint64_t v308 = sub_A928( v300,  v301,  v302,  v303,  v304,  v305,  v306,  v307,  v787,  v850,  v912,  v973,  v1033,  v1092,  v1150,  v1207,  v1263,  v1318,  v1372,  v1425);
      uint64_t v316 = sub_A920( v308,  v309,  v310,  v311,  v312,  v313,  v314,  v315,  v788,  v851,  v913,  v974,  v1034,  v1093,  v1151,  v1208,  v1264,  v1319,  v1373,  v1426,  v1478);
      uint64_t v324 = sub_36374( v316,  v317,  v318,  v319,  v320,  v321,  v322,  v323,  v789,  v852,  v914,  v975,  v1035,  v1094,  v1152,  v1209,  v1265,  v1320,  v1374,  v1427,  v1479,  v1530);
      uint64_t v332 = sub_3636C( v324,  v325,  v326,  v327,  v328,  v329,  v330,  v331,  v790,  v853,  v915,  v976,  v1036,  v1095,  v1153,  v1210,  v1266,  v1321,  v1375,  v1428,  v1480,  v1531,  v1581);
      uint64_t v340 = sub_36364( v332,  v333,  v334,  v335,  v336,  v337,  v338,  v339,  v791,  v854,  v916,  v977,  v1037,  v1096,  v1154,  v1211,  v1267,  v1322,  v1376,  v1429,  v1481,  v1532,  v1582,  v1631);
      uint64_t v348 = sub_363F0( v340,  v341,  v342,  v343,  v344,  v345,  v346,  v347,  v792,  v855,  v917,  v978,  v1038,  v1097,  v1155,  v1212,  v1268,  v1323,  v1377,  v1430,  v1482,  v1533,  v1583,  v1632,  v1680);
      uint64_t v356 = sub_36430( v348,  v349,  v350,  v351,  v352,  v353,  v354,  v355,  v793,  v856,  v918,  v979,  v1039,  v1098,  v1156,  v1213,  v1269,  v1324,  v1378,  v1431,  v1483,  v1534,  v1584,  v1633,  v1681,  v1728);
      uint64_t v364 = sub_36428( v356,  v357,  v358,  v359,  v360,  v361,  v362,  v363,  v794,  v857,  v919,  v980,  v1040,  v1099,  v1157,  v1214,  v1270,  v1325,  v1379,  v1432,  v1484,  v1535,  v1585,  v1634,  v1682,  v1729,  v1775);
      uint64_t v372 = sub_36478( v364,  v365,  v366,  v367,  v368,  v369,  v370,  v371,  v795,  v858,  v920,  v981,  v1041,  v1100,  v1158,  v1215,  v1271,  v1326,  v1380,  v1433,  v1485,  v1536,  v1586,  v1635,  v1683,  v1730,  v1776,  v1821);
      uint64_t v380 = sub_36524( v372,  v373,  v374,  v375,  v376,  v377,  v378,  v379,  v796,  v859,  v921,  v982,  v1042,  v1101,  v1159,  v1216,  v1272,  v1327,  v1381,  v1434,  v1486,  v1537,  v1587,  v1636,  v1684,  v1731,  v1777,  v1822,  v1866);
      uint64_t v388 = sub_3651C( v380,  v381,  v382,  v383,  v384,  v385,  v386,  v387,  v797,  v860,  v922,  v983,  v1043,  v1102,  v1160,  v1217,  v1273,  v1328,  v1382,  v1435,  v1487,  v1538,  v1588,  v1637,  v1685,  v1732,  v1778,  v1823,  v1867,  v1910);
      uint64_t v396 = sub_36514( v388,  v389,  v390,  v391,  v392,  v393,  v394,  v395,  v798,  v861,  v923,  v984,  v1044,  v1103,  v1161,  v1218,  v1274,  v1329,  v1383,  v1436,  v1488,  v1539,  v1589,  v1638,  v1686,  v1733,  v1779,  v1824,  v1868,  v1911,  v1953);
      uint64_t v404 = sub_3650C( v396,  v397,  v398,  v399,  v400,  v401,  v402,  v403,  v799,  v862,  v924,  v985,  v1045,  v1104,  v1162,  v1219,  v1275,  v1330,  v1384,  v1437,  v1489,  v1540,  v1590,  v1639,  v1687,  v1734,  v1780,  v1825,  v1869,  v1912,  v1954,  v1995);
      uint64_t v412 = sub_36504( v404,  v405,  v406,  v407,  v408,  v409,  v410,  v411,  v800,  v863,  v925,  v986,  v1046,  v1105,  v1163,  v1220,  v1276,  v1331,  v1385,  v1438,  v1490,  v1541,  v1591,  v1640,  v1688,  v1735,  v1781,  v1826,  v1870,  v1913,  v1955,  v1996,  v2036);
      uint64_t v420 = sub_364FC( v412,  v413,  v414,  v415,  v416,  v417,  v418,  v419,  v801,  v864,  v926,  v987,  v1047,  v1106,  v1164,  v1221,  v1277,  v1332,  v1386,  v1439,  v1491,  v1542,  v1592,  v1641,  v1689,  v1736,  v1782,  v1827,  v1871,  v1914,  v1956,  v1997,  v2037,  v2076);
      uint64_t v428 = sub_364F4( v420,  v421,  v422,  v423,  v424,  v425,  v426,  v427,  v802,  v865,  v927,  v988,  v1048,  v1107,  v1165,  v1222,  v1278,  v1333,  v1387,  v1440,  v1492,  v1543,  v1593,  v1642,  v1690,  v1737,  v1783,  v1828,  v1872,  v1915,  v1957,  v1998,  v2038,  v2077,  v2115);
      uint64_t v436 = sub_364EC( v428,  v429,  v430,  v431,  v432,  v433,  v434,  v435,  v803,  v866,  v928,  v989,  v1049,  v1108,  v1166,  v1223,  v1279,  v1334,  v1388,  v1441,  v1493,  v1544,  v1594,  v1643,  v1691,  v1738,  v1784,  v1829,  v1873,  v1916,  v1958,  v1999,  v2039,  v2078,  v2116,  v2153);
      uint64_t v444 = sub_364E4( v436,  v437,  v438,  v439,  v440,  v441,  v442,  v443,  v804,  v867,  v929,  v990,  v1050,  v1109,  v1167,  v1224,  v1280,  v1335,  v1389,  v1442,  v1494,  v1545,  v1595,  v1644,  v1692,  v1739,  v1785,  v1830,  v1874,  v1917,  v1959,  v2000,  v2040,  v2079,  v2117,  v2154,  v2190);
      uint64_t v452 = sub_364DC( v444,  v445,  v446,  v447,  v448,  v449,  v450,  v451,  v805,  v868,  v930,  v991,  v1051,  v1110,  v1168,  v1225,  v1281,  v1336,  v1390,  v1443,  v1495,  v1546,  v1596,  v1645,  v1693,  v1740,  v1786,  v1831,  v1875,  v1918,  v1960,  v2001,  v2041,  v2080,  v2118,  v2155,  v2191,  v2226);
      uint64_t v460 = sub_364D4( v452,  v453,  v454,  v455,  v456,  v457,  v458,  v459,  v806,  v869,  v931,  v992,  v1052,  v1111,  v1169,  v1226,  v1282,  v1337,  v1391,  v1444,  v1496,  v1547,  v1597,  v1646,  v1694,  v1741,  v1787,  v1832,  v1876,  v1919,  v1961,  v2002,  v2042,  v2081,  v2119,  v2156,  v2192,  v2227,  v2261);
      uint64_t v468 = sub_366F8( v460,  v461,  v462,  v463,  v464,  v465,  v466,  v467,  v807,  v870,  v932,  v993,  v1053,  v1112,  v1170,  v1227,  v1283,  v1338,  v1392,  v1445,  v1497,  v1548,  v1598,  v1647,  v1695,  v1742,  v1788,  v1833,  v1877,  v1920,  v1962,  v2003,  v2043,  v2082,  v2120,  v2157,  v2193,  v2228,  v2262,  v2295);
      uint64_t v476 = sub_366F0( v468,  v469,  v470,  v471,  v472,  v473,  v474,  v475,  v808,  v871,  v933,  v994,  v1054,  v1113,  v1171,  v1228,  v1284,  v1339,  v1393,  v1446,  v1498,  v1549,  v1599,  v1648,  v1696,  v1743,  v1789,  v1834,  v1878,  v1921,  v1963,  v2004,  v2044,  v2083,  v2121,  v2158,  v2194,  v2229,  v2263,  v2296,  v2328);
      uint64_t v484 = sub_36B90( v476,  v477,  v478,  v479,  v480,  v481,  v482,  v483,  v809,  v872,  v934,  v995,  v1055,  v1114,  v1172,  v1229,  v1285,  v1340,  v1394,  v1447,  v1499,  v1550,  v1600,  v1649,  v1697,  v1744,  v1790,  v1835,  v1879,  v1922,  v1964,  v2005,  v2045,  v2084,  v2122,  v2159,  v2195,  v2230,  v2264,  v2297,  v2329,  v2360);
      uint64_t v492 = sub_36EF4( v484,  v485,  v486,  v487,  v488,  v489,  v490,  v491,  v810,  v873,  v935,  v996,  v1056,  v1115,  v1173,  v1230,  v1286,  v1341,  v1395,  v1448,  v1500,  v1551,  v1601,  v1650,  v1698,  v1745,  v1791,  v1836,  v1880,  v1923,  v1965,  v2006,  v2046,  v2085,  v2123,  v2160,  v2196,  v2231,  v2265,  v2298,  v2330,  v2361,  v2391);
      uint64_t v500 = sub_36EEC( v492,  v493,  v494,  v495,  v496,  v497,  v498,  v499,  v811,  v874,  v936,  v997,  v1057,  v1116,  v1174,  v1231,  v1287,  v1342,  v1396,  v1449,  v1501,  v1552,  v1602,  v1651,  v1699,  v1746,  v1792,  v1837,  v1881,  v1924,  v1966,  v2007,  v2047,  v2086,  v2124,  v2161,  v2197,  v2232,  v2266,  v2299,  v2331,  v2362,  v2392,  v2421);
      uint64_t v508 = sub_DD7E4( v500,  v501,  v502,  v503,  v504,  v505,  v506,  v507,  v812,  v875,  v937,  v998,  v1058,  v1117,  v1175,  v1232,  v1288,  v1343,  v1397,  v1450,  v1502,  v1553,  v1603,  v1652,  v1700,  v1747,  v1793,  v1838,  v1882,  v1925,  v1967,  v2008,  v2048,  v2087,  v2125,  v2162,  v2198,  v2233,  v2267,  v2300,  v2332,  v2363,  v2393,  v2422,  v2450);
      uint64_t v516 = sub_DD7DC( v508,  v509,  v510,  v511,  v512,  v513,  v514,  v515,  v813,  v876,  v938,  v999,  v1059,  v1118,  v1176,  v1233,  v1289,  v1344,  v1398,  v1451,  v1503,  v1554,  v1604,  v1653,  v1701,  v1748,  v1794,  v1839,  v1883,  v1926,  v1968,  v2009,  v2049,  v2088,  v2126,  v2163,  v2199,  v2234,  v2268,  v2301,  v2333,  v2364,  v2394,  v2423,  v2451,  v2478);
      uint64_t v524 = sub_DD7D4( v516,  v517,  v518,  v519,  v520,  v521,  v522,  v523,  v814,  v877,  v939,  v1000,  v1060,  v1119,  v1177,  v1234,  v1290,  v1345,  v1399,  v1452,  v1504,  v1555,  v1605,  v1654,  v1702,  v1749,  v1795,  v1840,  v1884,  v1927,  v1969,  v2010,  v2050,  v2089,  v2127,  v2164,  v2200,  v2235,  v2269,  v2302,  v2334,  v2365,  v2395,  v2424,  v2452,  v2479,  v2505);
      uint64_t v532 = sub_DD7CC( v524,  v525,  v526,  v527,  v528,  v529,  v530,  v531,  v815,  v878,  v940,  v1001,  v1061,  v1120,  v1178,  v1235,  v1291,  v1346,  v1400,  v1453,  v1505,  v1556,  v1606,  v1655,  v1703,  v1750,  v1796,  v1841,  v1885,  v1928,  v1970,  v2011,  v2051,  v2090,  v2128,  v2165,  v2201,  v2236,  v2270,  v2303,  v2335,  v2366,  v2396,  v2425,  v2453,  v2480,  v2506,  v2531);
      uint64_t v540 = sub_DD7C4( v532,  v533,  v534,  v535,  v536,  v537,  v538,  v539,  v816,  v879,  v941,  v1002,  v1062,  v1121,  v1179,  v1236,  v1292,  v1347,  v1401,  v1454,  v1506,  v1557,  v1607,  v1656,  v1704,  v1751,  v1797,  v1842,  v1886,  v1929,  v1971,  v2012,  v2052,  v2091,  v2129,  v2166,  v2202,  v2237,  v2271,  v2304,  v2336,  v2367,  v2397,  v2426,  v2454,  v2481,  v2507,  v2532,  v2556);
      uint64_t v548 = sub_DD7BC( v540,  v541,  v542,  v543,  v544,  v545,  v546,  v547,  v817,  v880,  v942,  v1003,  v1063,  v1122,  v1180,  v1237,  v1293,  v1348,  v1402,  v1455,  v1507,  v1558,  v1608,  v1657,  v1705,  v1752,  v1798,  v1843,  v1887,  v1930,  v1972,  v2013,  v2053,  v2092,  v2130,  v2167,  v2203,  v2238,  v2272,  v2305,  v2337,  v2368,  v2398,  v2427,  v2455,  v2482,  v2508,  v2533,  v2557,
               v2580);
      uint64_t v556 = sub_DD7B4( v548,  v549,  v550,  v551,  v552,  v553,  v554,  v555,  v818,  v881,  v943,  v1004,  v1064,  v1123,  v1181,  v1238,  v1294,  v1349,  v1403,  v1456,  v1508,  v1559,  v1609,  v1658,  v1706,  v1753,  v1799,  v1844,  v1888,  v1931,  v1973,  v2014,  v2054,  v2093,  v2131,  v2168,  v2204,  v2239,  v2273,  v2306,  v2338,  v2369,  v2399,  v2428,  v2456,  v2483,  v2509,  v2534,  v2558,
               v2581,
               v2603);
      uint64_t v564 = sub_DD7AC( v556,  v557,  v558,  v559,  v560,  v561,  v562,  v563,  v819,  v882,  v944,  v1005,  v1065,  v1124,  v1182,  v1239,  v1295,  v1350,  v1404,  v1457,  v1509,  v1560,  v1610,  v1659,  v1707,  v1754,  v1800,  v1845,  v1889,  v1932,  v1974,  v2015,  v2055,  v2094,  v2132,  v2169,  v2205,  v2240,  v2274,  v2307,  v2339,  v2370,  v2400,  v2429,  v2457,  v2484,  v2510,  v2535,  v2559,
               v2582,
               v2604,
               v2625);
      uint64_t v572 = sub_DD7A4( v564,  v565,  v566,  v567,  v568,  v569,  v570,  v571,  v820,  v883,  v945,  v1006,  v1066,  v1125,  v1183,  v1240,  v1296,  v1351,  v1405,  v1458,  v1510,  v1561,  v1611,  v1660,  v1708,  v1755,  v1801,  v1846,  v1890,  v1933,  v1975,  v2016,  v2056,  v2095,  v2133,  v2170,  v2206,  v2241,  v2275,  v2308,  v2340,  v2371,  v2401,  v2430,  v2458,  v2485,  v2511,  v2536,  v2560,
               v2583,
               v2605,
               v2626,
               v2646);
      uint64_t v580 = sub_DD79C( v572,  v573,  v574,  v575,  v576,  v577,  v578,  v579,  v821,  v884,  v946,  v1007,  v1067,  v1126,  v1184,  v1241,  v1297,  v1352,  v1406,  v1459,  v1511,  v1562,  v1612,  v1661,  v1709,  v1756,  v1802,  v1847,  v1891,  v1934,  v1976,  v2017,  v2057,  v2096,  v2134,  v2171,  v2207,  v2242,  v2276,  v2309,  v2341,  v2372,  v2402,  v2431,  v2459,  v2486,  v2512,  v2537,  v2561,
               v2584,
               v2606,
               v2627,
               v2647,
               v2666);
      uint64_t v588 = sub_DD794( v580,  v581,  v582,  v583,  v584,  v585,  v586,  v587,  v822,  v885,  v947,  v1008,  v1068,  v1127,  v1185,  v1242,  v1298,  v1353,  v1407,  v1460,  v1512,  v1563,  v1613,  v1662,  v1710,  v1757,  v1803,  v1848,  v1892,  v1935,  v1977,  v2018,  v2058,  v2097,  v2135,  v2172,  v2208,  v2243,  v2277,  v2310,  v2342,  v2373,  v2403,  v2432,  v2460,  v2487,  v2513,  v2538,  v2562,
               v2585,
               v2607,
               v2628,
               v2648,
               v2667,
               v2685);
      uint64_t v596 = sub_DD78C( v588,  v589,  v590,  v591,  v592,  v593,  v594,  v595,  v823,  v886,  v948,  v1009,  v1069,  v1128,  v1186,  v1243,  v1299,  v1354,  v1408,  v1461,  v1513,  v1564,  v1614,  v1663,  v1711,  v1758,  v1804,  v1849,  v1893,  v1936,  v1978,  v2019,  v2059,  v2098,  v2136,  v2173,  v2209,  v2244,  v2278,  v2311,  v2343,  v2374,  v2404,  v2433,  v2461,  v2488,  v2514,  v2539,  v2563,
               v2586,
               v2608,
               v2629,
               v2649,
               v2668,
               v2686,
               v2703);
      uint64_t v604 = sub_DD784( v596,  v597,  v598,  v599,  v600,  v601,  v602,  v603,  v824,  v887,  v949,  v1010,  v1070,  v1129,  v1187,  v1244,  v1300,  v1355,  v1409,  v1462,  v1514,  v1565,  v1615,  v1664,  v1712,  v1759,  v1805,  v1850,  v1894,  v1937,  v1979,  v2020,  v2060,  v2099,  v2137,  v2174,  v2210,  v2245,  v2279,  v2312,  v2344,  v2375,  v2405,  v2434,  v2462,  v2489,  v2515,  v2540,  v2564,
               v2587,
               v2609,
               v2630,
               v2650,
               v2669,
               v2687,
               v2704,
               v2720);
      uint64_t v612 = sub_DD77C( v604,  v605,  v606,  v607,  v608,  v609,  v610,  v611,  v825,  v888,  v950,  v1011,  v1071,  v1130,  v1188,  v1245,  v1301,  v1356,  v1410,  v1463,  v1515,  v1566,  v1616,  v1665,  v1713,  v1760,  v1806,  v1851,  v1895,  v1938,  v1980,  v2021,  v2061,  v2100,  v2138,  v2175,  v2211,  v2246,  v2280,  v2313,  v2345,  v2376,  v2406,  v2435,  v2463,  v2490,  v2516,  v2541,  v2565,
               v2588,
               v2610,
               v2631,
               v2651,
               v2670,
               v2688,
               v2705,
               v2721,
               v2736);
      uint64_t v620 = sub_DD774( v612,  v613,  v614,  v615,  v616,  v617,  v618,  v619,  v826,  v889,  v951,  v1012,  v1072,  v1131,  v1189,  v1246,  v1302,  v1357,  v1411,  v1464,  v1516,  v1567,  v1617,  v1666,  v1714,  v1761,  v1807,  v1852,  v1896,  v1939,  v1981,  v2022,  v2062,  v2101,  v2139,  v2176,  v2212,  v2247,  v2281,  v2314,  v2346,  v2377,  v2407,  v2436,  v2464,  v2491,  v2517,  v2542,  v2566,
               v2589,
               v2611,
               v2632,
               v2652,
               v2671,
               v2689,
               v2706,
               v2722,
               v2737,
               v2751);
      uint64_t v628 = sub_DD76C( v620,  v621,  v622,  v623,  v624,  v625,  v626,  v627,  v827,  v890,  v952,  v1013,  v1073,  v1132,  v1190,  v1247,  v1303,  v1358,  v1412,  v1465,  v1517,  v1568,  v1618,  v1667,  v1715,  v1762,  v1808,  v1853,  v1897,  v1940,  v1982,  v2023,  v2063,  v2102,  v2140,  v2177,  v2213,  v2248,  v2282,  v2315,  v2347,  v2378,  v2408,  v2437,  v2465,  v2492,  v2518,  v2543,  v2567,
               v2590,
               v2612,
               v2633,
               v2653,
               v2672,
               v2690,
               v2707,
               v2723,
               v2738,
               v2752,
               v2765);
      uint64_t v636 = sub_DD764( v628,  v629,  v630,  v631,  v632,  v633,  v634,  v635,  v828,  v891,  v953,  v1014,  v1074,  v1133,  v1191,  v1248,  v1304,  v1359,  v1413,  v1466,  v1518,  v1569,  v1619,  v1668,  v1716,  v1763,  v1809,  v1854,  v1898,  v1941,  v1983,  v2024,  v2064,  v2103,  v2141,  v2178,  v2214,  v2249,  v2283,  v2316,  v2348,  v2379,  v2409,  v2438,  v2466,  v2493,  v2519,  v2544,  v2568,
               v2591,
               v2613,
               v2634,
               v2654,
               v2673,
               v2691,
               v2708,
               v2724,
               v2739,
               v2753,
               v2766,
               v2778);
      uint64_t v644 = sub_DD75C( v636,  v637,  v638,  v639,  v640,  v641,  v642,  v643,  v829,  v892,  v954,  v1015,  v1075,  v1134,  v1192,  v1249,  v1305,  v1360,  v1414,  v1467,  v1519,  v1570,  v1620,  v1669,  v1717,  v1764,  v1810,  v1855,  v1899,  v1942,  v1984,  v2025,  v2065,  v2104,  v2142,  v2179,  v2215,  v2250,  v2284,  v2317,  v2349,  v2380,  v2410,  v2439,  v2467,  v2494,  v2520,  v2545,  v2569,
               v2592,
               v2614,
               v2635,
               v2655,
               v2674,
               v2692,
               v2709,
               v2725,
               v2740,
               v2754,
               v2767,
               v2779,
               v2790);
      uint64_t v652 = sub_DD754( v644,  v645,  v646,  v647,  v648,  v649,  v650,  v651,  v830,  v893,  v955,  v1016,  v1076,  v1135,  v1193,  v1250,  v1306,  v1361,  v1415,  v1468,  v1520,  v1571,  v1621,  v1670,  v1718,  v1765,  v1811,  v1856,  v1900,  v1943,  v1985,  v2026,  v2066,  v2105,  v2143,  v2180,  v2216,  v2251,  v2285,  v2318,  v2350,  v2381,  v2411,  v2440,  v2468,  v2495,  v2521,  v2546,  v2570,
               v2593,
               v2615,
               v2636,
               v2656,
               v2675,
               v2693,
               v2710,
               v2726,
               v2741,
               v2755,
               v2768,
               v2780,
               v2791,
               v2801);
      uint64_t v660 = sub_DD74C( v652,  v653,  v654,  v655,  v656,  v657,  v658,  v659,  v831,  v894,  v956,  v1017,  v1077,  v1136,  v1194,  v1251,  v1307,  v1362,  v1416,  v1469,  v1521,  v1572,  v1622,  v1671,  v1719,  v1766,  v1812,  v1857,  v1901,  v1944,  v1986,  v2027,  v2067,  v2106,  v2144,  v2181,  v2217,  v2252,  v2286,  v2319,  v2351,  v2382,  v2412,  v2441,  v2469,  v2496,  v2522,  v2547,  v2571,
               v2594,
               v2616,
               v2637,
               v2657,
               v2676,
               v2694,
               v2711,
               v2727,
               v2742,
               v2756,
               v2769,
               v2781,
               v2792,
               v2802);
      uint64_t v668 = sub_DD744( v660,  v661,  v662,  v663,  v664,  v665,  v666,  v667,  v832,  v895,  v957,  v1018,  v1078,  v1137,  v1195,  v1252,  v1308,  v1363,  v1417,  v1470,  v1522,  v1573,  v1623,  v1672,  v1720,  v1767,  v1813,  v1858,  v1902,  v1945,  v1987,  v2028,  v2068,  v2107,  v2145,  v2182,  v2218,  v2253,  v2287,  v2320,  v2352,  v2383,  v2413,  v2442,  v2470,  v2497,  v2523,  v2548,  v2572,
               v2595,
               v2617,
               v2638,
               v2658,
               v2677,
               v2695,
               v2712,
               v2728,
               v2743,
               v2757,
               v2770,
               v2782,
               v2793,
               v2803);
      uint64_t v676 = sub_DD73C( v668,  v669,  v670,  v671,  v672,  v673,  v674,  v675,  v833,  v896,  v958,  v1019,  v1079,  v1138,  v1196,  v1253,  v1309,  v1364,  v1418,  v1471,  v1523,  v1574,  v1624,  v1673,  v1721,  v1768,  v1814,  v1859,  v1903,  v1946,  v1988,  v2029,  v2069,  v2108,  v2146,  v2183,  v2219,  v2254,  v2288,  v2321,  v2353,  v2384,  v2414,  v2443,  v2471,  v2498,  v2524,  v2549,  v2573,
               v2596,
               v2618,
               v2639,
               v2659,
               v2678,
               v2696,
               v2713,
               v2729,
               v2744,
               v2758,
               v2771,
               v2783,
               v2794,
               v2804);
      uint64_t v684 = sub_DD734( v676,  v677,  v678,  v679,  v680,  v681,  v682,  v683,  v834,  v897,  v959,  v1020,  v1080,  v1139,  v1197,  v1254,  v1310,  v1365,  v1419,  v1472,  v1524,  v1575,  v1625,  v1674,  v1722,  v1769,  v1815,  v1860,  v1904,  v1947,  v1989,  v2030,  v2070,  v2109,  v2147,  v2184,  v2220,  v2255,  v2289,  v2322,  v2354,  v2385,  v2415,  v2444,  v2472,  v2499,  v2525,  v2550,  v2574,
               v2597,
               v2619,
               v2640,
               v2660,
               v2679,
               v2697,
               v2714,
               v2730,
               v2745,
               v2759,
               v2772,
               v2784,
               v2795,
               v2805);
      uint64_t v692 = sub_DD72C( v684,  v685,  v686,  v687,  v688,  v689,  v690,  v691,  v835,  v898,  v960,  v1021,  v1081,  v1140,  v1198,  v1255,  v1311,  v1366,  v1420,  v1473,  v1525,  v1576,  v1626,  v1675,  v1723,  v1770,  v1816,  v1861,  v1905,  v1948,  v1990,  v2031,  v2071,  v2110,  v2148,  v2185,  v2221,  v2256,  v2290,  v2323,  v2355,  v2386,  v2416,  v2445,  v2473,  v2500,  v2526,  v2551,  v2575,
               v2598,
               v2620,
               v2641,
               v2661,
               v2680,
               v2698,
               v2715,
               v2731,
               v2746,
               v2760,
               v2773,
               v2785,
               v2796,
               v2806);
      uint64_t v700 = sub_DD724( v692,  v693,  v694,  v695,  v696,  v697,  v698,  v699,  v836,  v899,  v961,  v1022,  v1082,  v1141,  v1199,  v1256,  v1312,  v1367,  v1421,  v1474,  v1526,  v1577,  v1627,  v1676,  v1724,  v1771,  v1817,  v1862,  v1906,  v1949,  v1991,  v2032,  v2072,  v2111,  v2149,  v2186,  v2222,  v2257,  v2291,  v2324,  v2356,  v2387,  v2417,  v2446,  v2474,  v2501,  v2527,  v2552,  v2576,
               v2599,
               v2621,
               v2642,
               v2662,
               v2681,
               v2699,
               v2716,
               v2732,
               v2747,
               v2761,
               v2774,
               v2786,
               v2797,
               v2807);
      uint64_t v708 = sub_DD71C( v700,  v701,  v702,  v703,  v704,  v705,  v706,  v707,  v837,  v900,  v962,  v1023,  v1083,  v1142,  v1200,  v1257,  v1313,  v1368,  v1422,  v1475,  v1527,  v1578,  v1628,  v1677,  v1725,  v1772,  v1818,  v1863,  v1907,  v1950,  v1992,  v2033,  v2073,  v2112,  v2150,  v2187,  v2223,  v2258,  v2292,  v2325,  v2357,  v2388,  v2418,  v2447,  v2475,  v2502,  v2528,  v2553,  v2577,
               v2600,
               v2622,
               v2643,
               v2663,
               v2682,
               v2700,
               v2717,
               v2733,
               v2748,
               v2762,
               v2775,
               v2787,
               v2798,
               v2808);
      uint64_t v716 = sub_DD714( v708,  v709,  v710,  v711,  v712,  v713,  v714,  v715,  v838,  v901,  v963,  v1024,  v1084,  v1143,  v1201,  v1258,  v1314,  v1369,  v1423,  v1476,  v1528,  v1579,  v1629,  v1678,  v1726,  v1773,  v1819,  v1864,  v1908,  v1951,  v1993,  v2034,  v2074,  v2113,  v2151,  v2188,  v2224,  v2259,  v2293,  v2326,  v2358,  v2389,  v2419,  v2448,  v2476,  v2503,  v2529,  v2554,  v2578,
               v2601,
               v2623,
               v2644,
               v2664,
               v2683,
               v2701,
               v2718,
               v2734,
               v2749,
               v2763,
               v2776,
               v2788,
               v2799,
               v2809);
      sub_DD70C( v716,  v717,  v718,  v719,  v720,  v721,  v722,  v723,  v839,  v902,  v964,  v1025,  v1085,  v1144,  v1202,  v1259,  v1315,  v1370,  v1424,  v1477,  v1529,  v1580,  v1630,  v1679,  v1727,  v1774,  v1820,  v1865,  v1909,  v1952,  v1994,  v2035,  v2075,  v2114,  v2152,  v2189,  v2225,  v2260,  v2294,  v2327,  v2359,  v2390,  v2420,  v2449,  v2477,  v2504,  v2530,  v2555,  v2579,
        v2602,
        v2624,
        v2645,
        v2665,
        v2684,
        v2702,
        v2719,
        v2735,
        v2750,
        v2764,
        v2777,
        v2789,
        v2800,
        v2810);
      sub_DD704();
      sub_DD6FC();
      sub_DD6F4();
      sub_DD6EC();
      sub_DD6E4();
      sub_DD6DC();
      sub_DD6D4();
      sub_DD6CC();
      sub_DD6C4();
      sub_DD6BC();
      sub_DD6B4();
      sub_DD6AC();
      sub_DD6A4();
      sub_DD69C();
      sub_DD694();
      sub_DD68C();
      sub_DD684();
      sub_DD67C();
      sub_DD674();
      sub_DD66C();
      sub_DD664();
      sub_DD65C();
      sub_DD654();
      sub_DD64C();
      sub_DD644();
      sub_DD63C();
      sub_DD634();
      sub_DD62C();
      sub_DD624();
      sub_DD61C();
      sub_DD614();
      sub_DD60C();
      sub_DD604();
      sub_DD5FC();
      sub_DD5F4();
      sub_DD5EC();
      sub_DD5E4();
      sub_DD5DC();
      sub_DD5D4();
      sub_DD5CC();
      sub_DD5C4();
      sub_DD5BC();
      sub_DD5B4();
      sub_DD5AC();
      sub_DD5A4();
      sub_DD59C();
      sub_DD594();
      sub_DD58C();
      sub_DD584();
      sub_DD57C();
      sub_DD574();
      sub_DD56C();
      sub_DD564();
      sub_DD55C();
      sub_DD554();
      sub_DD54C();
      sub_DD544();
      sub_DD53C();
      sub_DD534();
      sub_DD52C();
      sub_DD524();
      sub_DD51C();
      sub_DD514();
      sub_DD50C();
      sub_DD504();
      sub_DD4FC();
      sub_DD4F4();
      sub_DD4EC();
      sub_DD4DC();
      sub_DD4E4();
      sub_DD868();
      sub_DD870();
      sub_DDA48();
      sub_DDA58();
      sub_DDE30();
      sub_DDE28();
      sub_DE6BC();
      sub_DE6B4();
      sub_DE6AC();
      sub_DE6A4();
      sub_DE69C();
      sub_DE694();
      sub_DEA78();
      sub_DEA70();
      sub_DEA68();
      sub_DEB50();
      swift_task_dealloc(v2820);
      swift_task_dealloc(v2825);
      swift_task_dealloc(v2828);
      swift_task_dealloc(v2832);
      sub_DDC60();
      __asm { BR              X0 }

      break;
  }

  if (v7 != 111)
  {
    if (v7 == 112)
    {
      uint64_t v2830 = (void *)(v1 + 520);
      sub_DE8F0(11008LL);
      sub_DEDD0();
      uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 27384);
      uint64_t v9 = *(void *)(v1 + 27376);
      uint64_t v10 = *(void *)(v1 + 26840);
      uint64_t v11 = *(void *)(v1 + 26736);
      sub_DDD24();
      swift_bridgeObjectRelease();
      sub_DEB68();
      swift_bridgeObjectRelease();
      sub_DE3A8();
      swift_bridgeObjectRelease();
      sub_6D64();
      sub_A5DC(v9, (uint64_t)v4);
      v8(v10, v9, v11);
      sub_DECA0();
      os_log_type_t v12 = sub_A898();
      BOOL v13 = sub_46514(v12);
      uint64_t v14 = *(void (**)(uint64_t))(v1 + 28112);
      if (v13)
      {
        uint64_t v15 = (uint8_t *)sub_3635C();
        *(void *)&v2834[0] = 0LL;
        *(void *)&v2833[0] = 0LL;
        sub_DD4BC(v15);
        uint64_t v16 = sub_DEC8C();
        sub_D9904(v16, v17, v18, v19);
        sub_82234();
        sub_232EC(&dword_0, v4, (os_log_type_t)v9, "Received gotComplexDosageLoggingError, creating output.", v15);
        sub_DDDAC();

        uint64_t v20 = sub_37084();
      }

      else
      {

        swift_bridgeObjectRelease();
        uint64_t v20 = sub_DEB1C();
      }

      v14(v20);
      uint64_t v2812 = *(void **)(v1 + 28120);
      uint64_t v2819 = *(void *)(v1 + 26728);
      uint64_t v2817 = *(void *)(v1 + 26688);
      uint64_t v2814 = *(void *)(v1 + 26432);
      uint64_t v60 = *(void *)(v1 + 25976);
      uint64_t v61 = v60 + 24;
      uint64_t v62 = *(void *)(v60 + 16);
      sub_DE7C8((_OWORD *)(v60 + 64));
      sub_DED44(v61);
      sub_732B8();
      sub_74964((uint64_t *)v2834);
      uint64_t v63 = sub_801D0();
      uint64_t v64 = sub_749C4();
      sub_310A0(v2833);
      sub_801E4(v62, v2826, (__int128 *)(v1 + 20448), 0, 0, v2834, v63, v64, (uint64_t)v2830, v2833);
      sub_808CC();
      sub_DEE80();

      sub_82234();
      swift_bridgeObjectRelease();

      sub_80810(v2830);
      sub_26F04(v2814, type metadata accessor for SnippetHeaderModel);
      sub_279E0(v2817, &qword_189D00);
      uint64_t v65 = v2819;
    }

    else
    {
      uint64_t v52 = (void *)(v1 + 24488);
      sub_DE8C0();
      uint64_t v53 = *(void **)(v1 + 26776);
      sub_DDD24();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_DE3A8();
      swift_bridgeObjectRelease();
      sub_6D64();
      sub_A5DC(v2, v1 + 24488);
      sub_DEBB4();
      sub_DDE60();
      os_log_type_t v54 = sub_AB70();
      BOOL v55 = sub_561AC(v54);
      uint64_t v56 = *(void (**)(uint64_t))(v1 + 28112);
      if (v55)
      {
        uint64_t v57 = (uint8_t *)sub_3635C();
        *(void *)&v2834[0] = 0LL;
        *(void *)&v2833[0] = 0LL;
        uint64_t v58 = sub_DD4BC(v57);
        uint64_t v53 = _swiftEmptyArrayStorage;
        sub_DDA60((uint64_t)v58, (uint64_t)v2836, (uint64_t)v2834, (uint64_t)v2833);
        sub_DA1C();
        sub_232EC( &dword_0,  (os_log_s *)(v1 + 24488),  (os_log_type_t)v2,  "Intent response code within .nameSelected was not an expected one || is one we're not handling yet, returning nil output.",  v57);
        sub_37268();

        uint64_t v59 = sub_373E0();
      }

      else
      {

        swift_bridgeObjectRelease();
        uint64_t v59 = sub_DE46C();
      }

      v56(v59);
      uint64_t v130 = *(void **)(v1 + 28120);
      uint64_t v131 = *(void *)(v1 + 26728);
      uint64_t v132 = (_OWORD *)sub_DEAB0();
      sub_36590(v132);
      sub_DE348((void *)(v1 + 4608));
      sub_A178();
      sub_DEA48();

      sub_6D64();
      sub_369F4();

      uint64_t v133 = sub_DEA50();
      sub_99450((uint64_t)v133, type metadata accessor for SnippetHeaderModel);
      sub_279E0((uint64_t)v53, &qword_189D00);
      uint64_t v65 = v131;
    }

    goto LABEL_67;
  }

  sub_DD878();
  uint64_t v43 = *(void *)(v1 + 26832);
  uint64_t v44 = *(void *)(v1 + 26736);
  sub_A5DC((uint64_t)v6, v45);
  sub_36170();
  sub_23374();
  os_log_type_t v46 = sub_AB70();
  BOOL v47 = sub_A988(v46);
  uint64_t v48 = *(void (**)(uint64_t))(v1 + 28112);
  if (v47)
  {
    uint64_t v44 = *(void *)(v1 + 28104);
    uint64_t v49 = (uint8_t *)sub_3635C();
    *(void *)&v2834[0] = 0LL;
    *(void *)&v2833[0] = 0LL;
    uint64_t v50 = sub_DD4BC(v49);
    sub_DDA60((uint64_t)v50, (uint64_t)v2836, (uint64_t)v2834, (uint64_t)v2833);
    sub_DA1C();
    sub_232EC( &dword_0,  v6,  (os_log_type_t)v43,  "SpecificMedLoggingFlow received .allMedsLoggedAlready in intent response, creating output.",  v49);
    sub_37128();

    uint64_t v51 = sub_373E0();
  }

  else
  {
    uint64_t v43 = *(void *)(v1 + 26832);
    sub_DDA50();
    swift_bridgeObjectRelease();
    uint64_t v51 = sub_372A0();
  }

  v48(v51);
  sub_DEB28();
  sub_DDDB4(v43, (uint64_t)PhoneRingsSnippet.body.getter);
  sub_368F8();
  *(void *)(v1 + 28352) = *(void *)(v44 + 336);
  sub_363E8();
  uint64_t v120 = sub_4195C();
  getMedStatus(from:)(v120, v121, v122, v123, v124, v125);
  sub_37034();
  uint64_t v126 = (void *)swift_task_alloc(dword_190C24);
  *(void *)(v1 + 28360) = v126;
  sub_DE974(v126, (uint64_t)sub_D4414);
  sub_DDC60();
  return sub_131F84(v127, v128);
}

uint64_t sub_D0A80()
{
  *(void *)(v0 + 28176) = v2;
  *(void *)(v0 + 28184) = v1;
  uint64_t v4 = sub_36900(v3);
  if (v1)
  {
    sub_367AC();
    uint64_t v5 = sub_36860();
    sub_36A94(v5, &qword_189D00);
  }

  else
  {
    sub_36A94(v4, &qword_189D00);
    sub_367AC();
  }

  sub_A964();
  return sub_363F8(v6, v7, v8);
}

uint64_t sub_D0B00()
{
  uint64_t v2 = *(void *)(v0 + 25976);
  sub_DE508((uint64_t)[*(id *)(v0 + 28176) catId]);
  sub_DE030();
  sub_DDDA4(v1);
  sub_368F8();
  sub_36CEC(v2 + 24);
  sub_36590((_OWORD *)(v2 + 64));
  sub_DDB48(v2 + 296);
  uint64_t v3 = *(void *)(v2 + 336);
  *(void *)(v0 + 28192) = v3;
  uint64_t v4 = *(void *)(v2 + 344);
  *(void *)(v0 + 28200) = v4;
  sub_363E8();
  sub_36C5C();
  uint64_t v5 = (void *)sub_3709C();
  *(void *)(v0 + 28208) = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_D0BF8;
  return sub_3619C(v7, *(void *)(v0 + 28176), *(void *)(v0 + 26248), v0 + 18368, v0 + 3808, v0 + 18408, v3, v4);
}

uint64_t sub_D0BF8()
{
  uint64_t v1 = (void *)(v0 + 18408);
  sub_20264(*(void *)(v0 + 28208));
  sub_36EBC();
  sub_36BE0();
  sub_36B74(v1);
  sub_20300();
  sub_A964();
  return sub_36348(v2, v3, v4);
}

uint64_t sub_D0C60()
{
  if (v1[2309])
  {
    uint64_t v2567 = (void *)v1[3522];
    uint64_t v3 = (void *)v1[3517];
    sub_DE394();
    uint64_t v2571 = v1[3291];
    uint64_t v2564 = v4;
    uint64_t v2565 = v1[3268];
    sub_20004(v5, (uint64_t)(v1 + 2311));
    sub_369CC();
    sub_36878((uint64_t)(v1 + 2311));
    uint64_t v6 = sub_20308((uint64_t)&unk_17FCF8, 56LL);
    sub_DDAC0(v6);
    v1[3222] = sub_DE278((uint64_t)&v2573, (uint64_t)&unk_18EA48);
    sub_DE28C();

    sub_6D64();
    sub_2A184();

    sub_DEA0C();
    sub_279E0(v2565, &qword_189CF8);
    sub_DE928();
    sub_26F04(v2571, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
    sub_37458(v7, type metadata accessor for SnippetHeaderModel);
    sub_DE154(v8, &qword_189D00);
    sub_37450(v9, &qword_18B168);
    sub_3652C();
  }

  else
  {
    sub_DE3B4(16608LL);
    sub_DEC74(17728LL);
    sub_DE950();
    uint64_t v10 = v1[3363];
    sub_279E0(v11, &qword_18A448);
    sub_A5DC(v0, (uint64_t)(v1 + 3175));
    sub_DE2AC();
    sub_368A0();
    os_log_type_t v12 = sub_AB70();
    if (sub_46614(v12))
    {
      BOOL v13 = (void (*)(uint64_t))v1[3514];
      uint64_t v14 = (_WORD *)sub_3635C();
      sub_DDA70(v14);
      sub_DDA34();
      sub_82234();
      sub_232EC( &dword_0,  (os_log_s *)(v1 + 3175),  (os_log_type_t)v10,  "Couldn't create output, returning GenericErrorFlow",  v2);
      sub_DDDAC();

      uint64_t v15 = sub_37104();
    }

    else
    {
      BOOL v13 = (void (*)(uint64_t))v1[3514];
      sub_DEDC0();
      swift_bridgeObjectRelease();
      uint64_t v15 = sub_7DFE8();
    }

    v13(v15);
    uint64_t v16 = (void *)v1[3522];
    uint64_t v17 = (void *)v1[3517];
    uint64_t v18 = (void *)v1[3515];
    uint64_t v2570 = v1[3291];
    uint64_t v2566 = v1[3277];
    uint64_t v2568 = v1[3276];
    uint64_t v2569 = v1[3281];
    uint64_t v19 = (_OWORD *)sub_DE9EC();
    sub_DE1B4(v19);
    sub_DE23C(v2572);
    sub_A178();
    static ExecuteResponse.complete<A>(next:)();

    sub_82234();
    sub_1EBF4();

    uint64_t v20 = sub_DE9FC();
    sub_57F00((uint64_t)v20, &qword_189CF8);
    (*(void (**)(uint64_t, uint64_t))(v2566 + 8))(v2569, v2568);
    sub_26F04(v2570, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
    sub_DE9B4(v21, type metadata accessor for SnippetHeaderModel);
    sub_DE1AC(v22, &qword_189D00);
    sub_DE510(v23, &qword_18B168);
  }

  sub_DC6E0();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v24 = sub_A78C();
  uint64_t v32 = sub_AAD8(v24, v25, v26, v27, v28, v29, v30, v31, v530, v593);
  uint64_t v40 = sub_A888(v32, v33, v34, v35, v36, v37, v38, v39, v531, v594, v656);
  uint64_t v48 = sub_A854(v40, v41, v42, v43, v44, v45, v46, v47, v532, v595, v657, v718);
  uint64_t v56 = sub_A84C(v48, v49, v50, v51, v52, v53, v54, v55, v533, v596, v658, v719, v779);
  uint64_t v64 = sub_A844(v56, v57, v58, v59, v60, v61, v62, v63, v534, v597, v659, v720, v780, v839);
  uint64_t v72 = sub_A83C(v64, v65, v66, v67, v68, v69, v70, v71, v535, v598, v660, v721, v781, v840, v898);
  uint64_t v80 = sub_A95C(v72, v73, v74, v75, v76, v77, v78, v79, v536, v599, v661, v722, v782, v841, v899, v956);
  uint64_t v88 = sub_A954(v80, v81, v82, v83, v84, v85, v86, v87, v537, v600, v662, v723, v783, v842, v900, v957, v1013);
  uint64_t v96 = sub_A938(v88, v89, v90, v91, v92, v93, v94, v95, v538, v601, v663, v724, v784, v843, v901, v958, v1014, v1069);
  uint64_t v104 = sub_A930( v96,  v97,  v98,  v99,  v100,  v101,  v102,  v103,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124);
  uint64_t v112 = sub_A928( v104,  v105,  v106,  v107,  v108,  v109,  v110,  v111,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178);
  uint64_t v120 = sub_A920( v112,  v113,  v114,  v115,  v116,  v117,  v118,  v119,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231);
  uint64_t v128 = sub_36374( v120,  v121,  v122,  v123,  v124,  v125,  v126,  v127,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283);
  uint64_t v136 = sub_3636C( v128,  v129,  v130,  v131,  v132,  v133,  v134,  v135,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334);
  uint64_t v144 = sub_36364( v136,  v137,  v138,  v139,  v140,  v141,  v142,  v143,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384);
  uint64_t v152 = sub_363F0( v144,  v145,  v146,  v147,  v148,  v149,  v150,  v151,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433);
  uint64_t v160 = sub_36430( v152,  v153,  v154,  v155,  v156,  v157,  v158,  v159,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481);
  uint64_t v168 = sub_36428( v160,  v161,  v162,  v163,  v164,  v165,  v166,  v167,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528);
  uint64_t v176 = sub_36478( v168,  v169,  v170,  v171,  v172,  v173,  v174,  v175,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574);
  uint64_t v184 = sub_36524( v176,  v177,  v178,  v179,  v180,  v181,  v182,  v183,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619);
  uint64_t v192 = sub_3651C( v184,  v185,  v186,  v187,  v188,  v189,  v190,  v191,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663);
  uint64_t v200 = sub_36514( v192,  v193,  v194,  v195,  v196,  v197,  v198,  v199,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706);
  uint64_t v208 = sub_3650C( v200,  v201,  v202,  v203,  v204,  v205,  v206,  v207,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748);
  uint64_t v216 = sub_36504( v208,  v209,  v210,  v211,  v212,  v213,  v214,  v215,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789);
  uint64_t v224 = sub_364FC( v216,  v217,  v218,  v219,  v220,  v221,  v222,  v223,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829);
  uint64_t v232 = sub_364F4( v224,  v225,  v226,  v227,  v228,  v229,  v230,  v231,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868);
  uint64_t v240 = sub_364EC( v232,  v233,  v234,  v235,  v236,  v237,  v238,  v239,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906);
  uint64_t v248 = sub_364E4( v240,  v241,  v242,  v243,  v244,  v245,  v246,  v247,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943);
  uint64_t v256 = sub_364DC( v248,  v249,  v250,  v251,  v252,  v253,  v254,  v255,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979);
  uint64_t v264 = sub_364D4( v256,  v257,  v258,  v259,  v260,  v261,  v262,  v263,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014);
  uint64_t v272 = sub_366F8( v264,  v265,  v266,  v267,  v268,  v269,  v270,  v271,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048);
  uint64_t v280 = sub_366F0( v272,  v273,  v274,  v275,  v276,  v277,  v278,  v279,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081);
  uint64_t v288 = sub_36B90( v280,  v281,  v282,  v283,  v284,  v285,  v286,  v287,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113);
  uint64_t v296 = sub_36EF4( v288,  v289,  v290,  v291,  v292,  v293,  v294,  v295,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144);
  uint64_t v304 = sub_36EEC( v296,  v297,  v298,  v299,  v300,  v301,  v302,  v303,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174);
  uint64_t v312 = sub_DD7E4( v304,  v305,  v306,  v307,  v308,  v309,  v310,  v311,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203);
  uint64_t v320 = sub_DD7DC( v312,  v313,  v314,  v315,  v316,  v317,  v318,  v319,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231);
  uint64_t v328 = sub_DD7D4( v320,  v321,  v322,  v323,  v324,  v325,  v326,  v327,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258);
  uint64_t v336 = sub_DD7CC( v328,  v329,  v330,  v331,  v332,  v333,  v334,  v335,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284);
  uint64_t v344 = sub_DD7C4( v336,  v337,  v338,  v339,  v340,  v341,  v342,  v343,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309);
  uint64_t v352 = sub_DD7BC( v344,  v345,  v346,  v347,  v348,  v349,  v350,  v351,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333);
  uint64_t v360 = sub_DD7B4( v352,  v353,  v354,  v355,  v356,  v357,  v358,  v359,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356);
  uint64_t v368 = sub_DD7AC( v360,  v361,  v362,  v363,  v364,  v365,  v366,  v367,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378);
  uint64_t v376 = sub_DD7A4( v368,  v369,  v370,  v371,  v372,  v373,  v374,  v375,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399);
  uint64_t v384 = sub_DD79C( v376,  v377,  v378,  v379,  v380,  v381,  v382,  v383,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419);
  uint64_t v392 = sub_DD794( v384,  v385,  v386,  v387,  v388,  v389,  v390,  v391,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438);
  uint64_t v400 = sub_DD78C( v392,  v393,  v394,  v395,  v396,  v397,  v398,  v399,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456);
  uint64_t v408 = sub_DD784( v400,  v401,  v402,  v403,  v404,  v405,  v406,  v407,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473);
  uint64_t v416 = sub_DD77C( v408,  v409,  v410,  v411,  v412,  v413,  v414,  v415,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489);
  uint64_t v424 = sub_DD774( v416,  v417,  v418,  v419,  v420,  v421,  v422,  v423,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504);
  uint64_t v432 = sub_DD76C( v424,  v425,  v426,  v427,  v428,  v429,  v430,  v431,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518);
  uint64_t v440 = sub_DD764( v432,  v433,  v434,  v435,  v436,  v437,  v438,  v439,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
           v2344,
           v2366,
           v2387,
           v2407,
           v2426,
           v2444,
           v2461,
           v2477,
           v2492,
           v2506,
           v2519,
           v2531);
  uint64_t v448 = sub_DD75C( v440,  v441,  v442,  v443,  v444,  v445,  v446,  v447,  v582,  v645,  v707,  v768,  v828,  v887,  v945,  v1002,  v1058,  v1113,  v1167,  v1220,  v1272,  v1323,  v1373,  v1422,  v1470,  v1517,  v1563,  v1608,  v1652,  v1695,  v1737,  v1778,  v1818,  v1857,  v1895,  v1932,  v1968,  v2003,  v2037,  v2070,  v2102,  v2133,  v2163,  v2192,  v2220,  v2247,  v2273,  v2298,  v2322,
           v2345,
           v2367,
           v2388,
           v2408,
           v2427,
           v2445,
           v2462,
           v2478,
           v2493,
           v2507,
           v2520,
           v2532,
           v2543);
  uint64_t v456 = sub_DD754( v448,  v449,  v450,  v451,  v452,  v453,  v454,  v455,  v583,  v646,  v708,  v769,  v829,  v888,  v946,  v1003,  v1059,  v1114,  v1168,  v1221,  v1273,  v1324,  v1374,  v1423,  v1471,  v1518,  v1564,  v1609,  v1653,  v1696,  v1738,  v1779,  v1819,  v1858,  v1896,  v1933,  v1969,  v2004,  v2038,  v2071,  v2103,  v2134,  v2164,  v2193,  v2221,  v2248,  v2274,  v2299,  v2323,
           v2346,
           v2368,
           v2389,
           v2409,
           v2428,
           v2446,
           v2463,
           v2479,
           v2494,
           v2508,
           v2521,
           v2533,
           v2544,
           v2554);
  uint64_t v464 = sub_DD74C( v456,  v457,  v458,  v459,  v460,  v461,  v462,  v463,  v584,  v647,  v709,  v770,  v830,  v889,  v947,  v1004,  v1060,  v1115,  v1169,  v1222,  v1274,  v1325,  v1375,  v1424,  v1472,  v1519,  v1565,  v1610,  v1654,  v1697,  v1739,  v1780,  v1820,  v1859,  v1897,  v1934,  v1970,  v2005,  v2039,  v2072,  v2104,  v2135,  v2165,  v2194,  v2222,  v2249,  v2275,  v2300,  v2324,
           v2347,
           v2369,
           v2390,
           v2410,
           v2429,
           v2447,
           v2464,
           v2480,
           v2495,
           v2509,
           v2522,
           v2534,
           v2545,
           v2555);
  uint64_t v472 = sub_DD744( v464,  v465,  v466,  v467,  v468,  v469,  v470,  v471,  v585,  v648,  v710,  v771,  v831,  v890,  v948,  v1005,  v1061,  v1116,  v1170,  v1223,  v1275,  v1326,  v1376,  v1425,  v1473,  v1520,  v1566,  v1611,  v1655,  v1698,  v1740,  v1781,  v1821,  v1860,  v1898,  v1935,  v1971,  v2006,  v2040,  v2073,  v2105,  v2136,  v2166,  v2195,  v2223,  v2250,  v2276,  v2301,  v2325,
           v2348,
           v2370,
           v2391,
           v2411,
           v2430,
           v2448,
           v2465,
           v2481,
           v2496,
           v2510,
           v2523,
           v2535,
           v2546,
           v2556);
  uint64_t v480 = sub_DD73C( v472,  v473,  v474,  v475,  v476,  v477,  v478,  v479,  v586,  v649,  v711,  v772,  v832,  v891,  v949,  v1006,  v1062,  v1117,  v1171,  v1224,  v1276,  v1327,  v1377,  v1426,  v1474,  v1521,  v1567,  v1612,  v1656,  v1699,  v1741,  v1782,  v1822,  v1861,  v1899,  v1936,  v1972,  v2007,  v2041,  v2074,  v2106,  v2137,  v2167,  v2196,  v2224,  v2251,  v2277,  v2302,  v2326,
           v2349,
           v2371,
           v2392,
           v2412,
           v2431,
           v2449,
           v2466,
           v2482,
           v2497,
           v2511,
           v2524,
           v2536,
           v2547,
           v2557);
  uint64_t v488 = sub_DD734( v480,  v481,  v482,  v483,  v484,  v485,  v486,  v487,  v587,  v650,  v712,  v773,  v833,  v892,  v950,  v1007,  v1063,  v1118,  v1172,  v1225,  v1277,  v1328,  v1378,  v1427,  v1475,  v1522,  v1568,  v1613,  v1657,  v1700,  v1742,  v1783,  v1823,  v1862,  v1900,  v1937,  v1973,  v2008,  v2042,  v2075,  v2107,  v2138,  v2168,  v2197,  v2225,  v2252,  v2278,  v2303,  v2327,
           v2350,
           v2372,
           v2393,
           v2413,
           v2432,
           v2450,
           v2467,
           v2483,
           v2498,
           v2512,
           v2525,
           v2537,
           v2548,
           v2558);
  uint64_t v496 = sub_DD72C( v488,  v489,  v490,  v491,  v492,  v493,  v494,  v495,  v588,  v651,  v713,  v774,  v834,  v893,  v951,  v1008,  v1064,  v1119,  v1173,  v1226,  v1278,  v1329,  v1379,  v1428,  v1476,  v1523,  v1569,  v1614,  v1658,  v1701,  v1743,  v1784,  v1824,  v1863,  v1901,  v1938,  v1974,  v2009,  v2043,  v2076,  v2108,  v2139,  v2169,  v2198,  v2226,  v2253,  v2279,  v2304,  v2328,
           v2351,
           v2373,
           v2394,
           v2414,
           v2433,
           v2451,
           v2468,
           v2484,
           v2499,
           v2513,
           v2526,
           v2538,
           v2549,
           v2559);
  uint64_t v504 = sub_DD724( v496,  v497,  v498,  v499,  v500,  v501,  v502,  v503,  v589,  v652,  v714,  v775,  v835,  v894,  v952,  v1009,  v1065,  v1120,  v1174,  v1227,  v1279,  v1330,  v1380,  v1429,  v1477,  v1524,  v1570,  v1615,  v1659,  v1702,  v1744,  v1785,  v1825,  v1864,  v1902,  v1939,  v1975,  v2010,  v2044,  v2077,  v2109,  v2140,  v2170,  v2199,  v2227,  v2254,  v2280,  v2305,  v2329,
           v2352,
           v2374,
           v2395,
           v2415,
           v2434,
           v2452,
           v2469,
           v2485,
           v2500,
           v2514,
           v2527,
           v2539,
           v2550,
           v2560);
  uint64_t v512 = sub_DD71C( v504,  v505,  v506,  v507,  v508,  v509,  v510,  v511,  v590,  v653,  v715,  v776,  v836,  v895,  v953,  v1010,  v1066,  v1121,  v1175,  v1228,  v1280,  v1331,  v1381,  v1430,  v1478,  v1525,  v1571,  v1616,  v1660,  v1703,  v1745,  v1786,  v1826,  v1865,  v1903,  v1940,  v1976,  v2011,  v2045,  v2078,  v2110,  v2141,  v2171,  v2200,  v2228,  v2255,  v2281,  v2306,  v2330,
           v2353,
           v2375,
           v2396,
           v2416,
           v2435,
           v2453,
           v2470,
           v2486,
           v2501,
           v2515,
           v2528,
           v2540,
           v2551,
           v2561);
  uint64_t v520 = sub_DD714( v512,  v513,  v514,  v515,  v516,  v517,  v518,  v519,  v591,  v654,  v716,  v777,  v837,  v896,  v954,  v1011,  v1067,  v1122,  v1176,  v1229,  v1281,  v1332,  v1382,  v1431,  v1479,  v1526,  v1572,  v1617,  v1661,  v1704,  v1746,  v1787,  v1827,  v1866,  v1904,  v1941,  v1977,  v2012,  v2046,  v2079,  v2111,  v2142,  v2172,  v2201,  v2229,  v2256,  v2282,  v2307,  v2331,
           v2354,
           v2376,
           v2397,
           v2417,
           v2436,
           v2454,
           v2471,
           v2487,
           v2502,
           v2516,
           v2529,
           v2541,
           v2552,
           v2562);
  sub_DD70C( v520,  v521,  v522,  v523,  v524,  v525,  v526,  v527,  v592,  v655,  v717,  v778,  v838,  v897,  v955,  v1012,  v1068,  v1123,  v1177,  v1230,  v1282,  v1333,  v1383,  v1432,  v1480,  v1527,  v1573,  v1618,  v1662,  v1705,  v1747,  v1788,  v1828,  v1867,  v1905,  v1942,  v1978,  v2013,  v2047,  v2080,  v2112,  v2143,  v2173,  v2202,  v2230,  v2257,  v2283,  v2308,  v2332,
    v2355,
    v2377,
    v2398,
    v2418,
    v2437,
    v2455,
    v2472,
    v2488,
    v2503,
    v2517,
    v2530,
    v2542,
    v2553,
    v2563);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_DDE30();
  sub_DDE28();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  uint64_t v528 = (uint64_t (*)(void))sub_DE600();
  return sub_36148(v528);
}

uint64_t sub_D11EC()
{
  os_log_type_t v6 = sub_AB70();
  if (sub_46614(v6))
  {
    uint64_t v7 = (_WORD *)sub_3635C();
    sub_36908(v7);
    sub_DD494();
    sub_DA1C();
    sub_232EC(&dword_0, v0, v2, "Couldn't create logMedConfirmationRejected_Dialog, returning GenericErrorFlow", v3);
    sub_37128();
  }

  else
  {

    swift_bridgeObjectRelease();
  }

  sub_3747C();
  uint64_t v8 = *(void **)(v1 + 28136);
  sub_DD7EC();
  sub_DE1C4(v3);
  sub_A178();
  sub_DE2BC();

  sub_DA1C();
  sub_B25F0();

  uint64_t v9 = sub_DE9BC();
  sub_36A94((uint64_t)v9, &qword_189CF8);
  uint64_t v10 = sub_DE4FC();
  sub_DDC20(v10, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
  sub_DDE0C(v11, type metadata accessor for SnippetHeaderModel);
  sub_DDA68(v12, &qword_189D00);
  sub_DDBDC(v13, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v14 = sub_A78C();
  uint64_t v22 = sub_AAD8(v14, v15, v16, v17, v18, v19, v20, v21, v520, v583);
  uint64_t v30 = sub_A888(v22, v23, v24, v25, v26, v27, v28, v29, v521, v584, v646);
  uint64_t v38 = sub_A854(v30, v31, v32, v33, v34, v35, v36, v37, v522, v585, v647, v708);
  uint64_t v46 = sub_A84C(v38, v39, v40, v41, v42, v43, v44, v45, v523, v586, v648, v709, v769);
  uint64_t v54 = sub_A844(v46, v47, v48, v49, v50, v51, v52, v53, v524, v587, v649, v710, v770, v829);
  uint64_t v62 = sub_A83C(v54, v55, v56, v57, v58, v59, v60, v61, v525, v588, v650, v711, v771, v830, v888);
  uint64_t v70 = sub_A95C(v62, v63, v64, v65, v66, v67, v68, v69, v526, v589, v651, v712, v772, v831, v889, v946);
  uint64_t v78 = sub_A954(v70, v71, v72, v73, v74, v75, v76, v77, v527, v590, v652, v713, v773, v832, v890, v947, v1003);
  uint64_t v86 = sub_A938(v78, v79, v80, v81, v82, v83, v84, v85, v528, v591, v653, v714, v774, v833, v891, v948, v1004, v1059);
  uint64_t v94 = sub_A930( v86,  v87,  v88,  v89,  v90,  v91,  v92,  v93,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114);
  uint64_t v102 = sub_A928( v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168);
  uint64_t v110 = sub_A920( v102,  v103,  v104,  v105,  v106,  v107,  v108,  v109,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221);
  uint64_t v118 = sub_36374( v110,  v111,  v112,  v113,  v114,  v115,  v116,  v117,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273);
  uint64_t v126 = sub_3636C( v118,  v119,  v120,  v121,  v122,  v123,  v124,  v125,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324);
  uint64_t v134 = sub_36364( v126,  v127,  v128,  v129,  v130,  v131,  v132,  v133,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374);
  uint64_t v142 = sub_363F0( v134,  v135,  v136,  v137,  v138,  v139,  v140,  v141,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423);
  uint64_t v150 = sub_36430( v142,  v143,  v144,  v145,  v146,  v147,  v148,  v149,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471);
  uint64_t v158 = sub_36428( v150,  v151,  v152,  v153,  v154,  v155,  v156,  v157,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518);
  uint64_t v166 = sub_36478( v158,  v159,  v160,  v161,  v162,  v163,  v164,  v165,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564);
  uint64_t v174 = sub_36524( v166,  v167,  v168,  v169,  v170,  v171,  v172,  v173,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609);
  uint64_t v182 = sub_3651C( v174,  v175,  v176,  v177,  v178,  v179,  v180,  v181,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653);
  uint64_t v190 = sub_36514( v182,  v183,  v184,  v185,  v186,  v187,  v188,  v189,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696);
  uint64_t v198 = sub_3650C( v190,  v191,  v192,  v193,  v194,  v195,  v196,  v197,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738);
  uint64_t v206 = sub_36504( v198,  v199,  v200,  v201,  v202,  v203,  v204,  v205,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779);
  uint64_t v214 = sub_364FC( v206,  v207,  v208,  v209,  v210,  v211,  v212,  v213,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819);
  uint64_t v222 = sub_364F4( v214,  v215,  v216,  v217,  v218,  v219,  v220,  v221,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858);
  uint64_t v230 = sub_364EC( v222,  v223,  v224,  v225,  v226,  v227,  v228,  v229,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896);
  uint64_t v238 = sub_364E4( v230,  v231,  v232,  v233,  v234,  v235,  v236,  v237,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933);
  uint64_t v246 = sub_364DC( v238,  v239,  v240,  v241,  v242,  v243,  v244,  v245,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969);
  uint64_t v254 = sub_364D4( v246,  v247,  v248,  v249,  v250,  v251,  v252,  v253,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004);
  uint64_t v262 = sub_366F8( v254,  v255,  v256,  v257,  v258,  v259,  v260,  v261,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038);
  uint64_t v270 = sub_366F0( v262,  v263,  v264,  v265,  v266,  v267,  v268,  v269,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071);
  uint64_t v278 = sub_36B90( v270,  v271,  v272,  v273,  v274,  v275,  v276,  v277,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103);
  uint64_t v286 = sub_36EF4( v278,  v279,  v280,  v281,  v282,  v283,  v284,  v285,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134);
  uint64_t v294 = sub_36EEC( v286,  v287,  v288,  v289,  v290,  v291,  v292,  v293,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164);
  uint64_t v302 = sub_DD7E4( v294,  v295,  v296,  v297,  v298,  v299,  v300,  v301,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193);
  uint64_t v310 = sub_DD7DC( v302,  v303,  v304,  v305,  v306,  v307,  v308,  v309,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221);
  uint64_t v318 = sub_DD7D4( v310,  v311,  v312,  v313,  v314,  v315,  v316,  v317,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248);
  uint64_t v326 = sub_DD7CC( v318,  v319,  v320,  v321,  v322,  v323,  v324,  v325,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274);
  uint64_t v334 = sub_DD7C4( v326,  v327,  v328,  v329,  v330,  v331,  v332,  v333,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299);
  uint64_t v342 = sub_DD7BC( v334,  v335,  v336,  v337,  v338,  v339,  v340,  v341,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323);
  uint64_t v350 = sub_DD7B4( v342,  v343,  v344,  v345,  v346,  v347,  v348,  v349,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346);
  uint64_t v358 = sub_DD7AC( v350,  v351,  v352,  v353,  v354,  v355,  v356,  v357,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368);
  uint64_t v366 = sub_DD7A4( v358,  v359,  v360,  v361,  v362,  v363,  v364,  v365,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389);
  uint64_t v374 = sub_DD79C( v366,  v367,  v368,  v369,  v370,  v371,  v372,  v373,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409);
  uint64_t v382 = sub_DD794( v374,  v375,  v376,  v377,  v378,  v379,  v380,  v381,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428);
  uint64_t v390 = sub_DD78C( v382,  v383,  v384,  v385,  v386,  v387,  v388,  v389,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446);
  uint64_t v398 = sub_DD784( v390,  v391,  v392,  v393,  v394,  v395,  v396,  v397,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463);
  uint64_t v406 = sub_DD77C( v398,  v399,  v400,  v401,  v402,  v403,  v404,  v405,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479);
  uint64_t v414 = sub_DD774( v406,  v407,  v408,  v409,  v410,  v411,  v412,  v413,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494);
  uint64_t v422 = sub_DD76C( v414,  v415,  v416,  v417,  v418,  v419,  v420,  v421,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508);
  uint64_t v430 = sub_DD764( v422,  v423,  v424,  v425,  v426,  v427,  v428,  v429,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521);
  uint64_t v438 = sub_DD75C( v430,  v431,  v432,  v433,  v434,  v435,  v436,  v437,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533);
  uint64_t v446 = sub_DD754( v438,  v439,  v440,  v441,  v442,  v443,  v444,  v445,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v454 = sub_DD74C( v446,  v447,  v448,  v449,  v450,  v451,  v452,  v453,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v462 = sub_DD744( v454,  v455,  v456,  v457,  v458,  v459,  v460,  v461,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v470 = sub_DD73C( v462,  v463,  v464,  v465,  v466,  v467,  v468,  v469,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v478 = sub_DD734( v470,  v471,  v472,  v473,  v474,  v475,  v476,  v477,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v486 = sub_DD72C( v478,  v479,  v480,  v481,  v482,  v483,  v484,  v485,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v494 = sub_DD724( v486,  v487,  v488,  v489,  v490,  v491,  v492,  v493,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  uint64_t v502 = sub_DD71C( v494,  v495,  v496,  v497,  v498,  v499,  v500,  v501,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518,
           v2530,
           v2541,
           v2551);
  uint64_t v510 = sub_DD714( v502,  v503,  v504,  v505,  v506,  v507,  v508,  v509,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
           v2344,
           v2366,
           v2387,
           v2407,
           v2426,
           v2444,
           v2461,
           v2477,
           v2492,
           v2506,
           v2519,
           v2531,
           v2542,
           v2552);
  sub_DD70C( v510,  v511,  v512,  v513,  v514,  v515,  v516,  v517,  v582,  v645,  v707,  v768,  v828,  v887,  v945,  v1002,  v1058,  v1113,  v1167,  v1220,  v1272,  v1323,  v1373,  v1422,  v1470,  v1517,  v1563,  v1608,  v1652,  v1695,  v1737,  v1778,  v1818,  v1857,  v1895,  v1932,  v1968,  v2003,  v2037,  v2070,  v2102,  v2133,  v2163,  v2192,  v2220,  v2247,  v2273,  v2298,  v2322,
    v2345,
    v2367,
    v2388,
    v2408,
    v2427,
    v2445,
    v2462,
    v2478,
    v2493,
    v2507,
    v2520,
    v2532,
    v2543,
    v2553);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v518 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v518);
}

uint64_t sub_D15B4()
{
  *(void *)(v1 + 28232) = v2;
  sub_36900(v3);
  if (v0)
  {
    sub_DE844();
    sub_37034();
    sub_6D64();
    sub_DE8A8();
    swift_bridgeObjectRelease();
    sub_DDFD8();
    swift_bridgeObjectRelease();
    sub_DDFCC();
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_36860();
    sub_73370(v4, &qword_189D00);
  }

  else
  {
    sub_279E0(*(void *)(v1 + 26536), &qword_189D00);
    sub_37034();
  }

  sub_A964();
  return sub_DD94C(v5, v6, v7);
}

uint64_t sub_D1664()
{
  uint64_t v1 = *(void **)(v0 + 28232);
  sub_368F8();
  sub_DEDFC((uint64_t)[v1 catId]);

  uint64_t v2 = sub_37084();
  OutputGenerationManifest.responseViewId.setter(v2, v3);
  uint64_t v4 = sub_363E8();
  getMedStatus(from:)(v4, v5, v6, v7, v8, v9);
  char v11 = v10;
  uint64_t v12 = sub_3652C();
  uint64_t v13 = Date.init()(v12);
  sub_DE7D0( v13,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
  if (v14 && (id v15 = sub_DEB8C(v14), sub_249D4(), v15))
  {
    sub_134BD8(v15);
    uint64_t v65 = v17;
    uint64_t v66 = v16;
  }

  else
  {
    uint64_t v65 = 0LL;
    uint64_t v66 = 0LL;
  }

  sub_DA680( *(void **)(v0 + 28136),  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
  char v75 = v11;
  if (v18 && (id v19 = sub_DEB8C(v18), sub_249D4(), v19))
  {
    sub_DEED0();
    unint64_t v63 = v21;
    uint64_t v64 = v20;
  }

  else
  {
    unint64_t v63 = 0LL;
    uint64_t v64 = 0LL;
  }

  uint64_t v74 = *(void **)(v0 + 28232);
  uint64_t v72 = *(void *)(v0 + 28144);
  uint64_t v73 = *(void *)(v0 + 28152);
  sub_DE594();
  sub_DEC0C();
  unint64_t v31 = v30 & 0xFFFF00000000FFFFLL | 0x646567670000LL;
  uint64_t v32 = *(void *)(v0 + 26184);
  if (v22) {
    unint64_t v33 = v31;
  }
  else {
    unint64_t v33 = v28;
  }
  unint64_t v34 = 0xE600000000000000LL;
  if (!v22) {
    unint64_t v34 = v29;
  }
  uint64_t v67 = v34;
  uint64_t v68 = v33;
  uint64_t v70 = *(void *)(v0 + 26072);
  if (v27) {
    uint64_t v35 = v26;
  }
  else {
    uint64_t v35 = 0x64657070696B53LL;
  }
  if (v27) {
    uint64_t v36 = v27;
  }
  else {
    uint64_t v36 = 0xE700000000000000LL;
  }
  uint64_t v69 = *(void *)(v0 + 26024);
  uint64_t v37 = *(void *)(v0 + 25984);
  if (v25) {
    uint64_t v38 = v24;
  }
  else {
    uint64_t v38 = 0x6E656B6154LL;
  }
  if (v25) {
    uint64_t v39 = v25;
  }
  else {
    uint64_t v39 = 0xE500000000000000LL;
  }
  uint64_t v71 = *(void *)(v0 + 25976);
  sub_DEDB8(*(void *)(v0 + 26144), v23, &qword_189CF8);
  PhoneRingsSnippet.body.getter(v40);
  char v41 = sub_11B244();
  uint64_t v42 = sub_372A0();
  sub_98DE0(v42, v43, v44);
  sub_5F150(v37, 0LL);
  SpecificMedCompletedLogModel.init(medStatus:givenTime:requestedMedName:requestedMedSchedule:dosage:dosageUnit:url:sashBundleID:dontDisplayGranularTime:isSmartEnabled:loggedLabel:skippedLabel:takenLabel:snippetHeaderModel:)( v75 & 1,  v69,  v66,  v65,  v64,  v63,  0LL,  1,  v70,  0LL,  0LL,  v32,  v73,  v72,  0,  v41 & 1,  v68,  v67,  v35,  v36,  v38,  v39,  v37);
  sub_36878(v71 + 296);
  uint64_t v45 = *(void *)(v0 + 18752);
  uint64_t v46 = *(void *)(v0 + 18760);
  sub_500C((void *)(v0 + 18728), v45);
  *(void *)(v0 + 18712) = type metadata accessor for WellnessSnippets(0LL);
  sub_36F4C((unint64_t *)&qword_18A468, v47, type metadata accessor for WellnessSnippets);
  *(void *)(v0 + 18720) = v48;
  uint64_t v49 = sub_72E20();
  sub_98DE0(v70, (uint64_t)v49, type metadata accessor for SpecificMedCompletedLogModel);
  uint64_t v50 = sub_80C98();
  sub_DE18C(v50, v51);
  uint64_t v52 = sub_494C(&qword_18A460);
  uint64_t v53 = sub_20308(v52, 40LL);
  uint64_t v54 = sub_373F8(v53);
  sub_DE284(v54, v55, v56);
  uint64_t v58 = v57;
  *(void *)(v0 + 28240) = v57;
  uint64_t v59 = async function pointer to dispatch thunk of ResponseGenerating.makeResponseOutput(resultModel:dialog:outputGenerationManifest:)[1];
  id v60 = v74;
  uint64_t v61 = (void *)swift_task_alloc(v59);
  *(void *)(v0 + 28248) = v61;
  *uint64_t v61 = v0;
  v61[1] = sub_D19C4;
  return dispatch thunk of ResponseGenerating.makeResponseOutput(resultModel:dialog:outputGenerationManifest:)( v0 + 18768,  v0 + 18688,  v58,  *(void *)(v0 + 26248),  v45,  v46);
}

uint64_t sub_D19C4()
{
  return sub_D954();
}

uint64_t sub_D1A10()
{
  uint64_t v1 = *(void **)(v0 + 28232);
  uint64_t v2 = *(void **)(v0 + 28136);
  sub_DEC60();
  uint64_t v2540 = *(void *)(v0 + 26144);
  uint64_t v2539 = *(void *)(v0 + 26072);
  _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0(v3);
  sub_369CC();
  sub_A304(v0 + 18768, v0 + 18648);
  uint64_t v4 = sub_20308((uint64_t)&unk_17FCD0, 56LL);
  sub_DDD10((__int128 *)(v0 + 18648), v4 + 16);
  *(void *)(v0 + 25760) = SimpleOutputFlowAsync.__allocating_init(outputPublisher:outputGenerator:)( &v2541,  &unk_18EA38,  v4);
  sub_DEA34();
  static ExecuteResponse.complete<A>(next:)();

  sub_1EBF4();
  sub_DE7D8();
  sub_DE15C();
  sub_DED34();
  sub_26F04(v2539, type metadata accessor for SpecificMedCompletedLogModel);
  sub_279E0(v2540, &qword_189CF8);
  uint64_t v5 = sub_DEAC8();
  sub_DE82C(v5, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
  sub_DDC20(v6, type metadata accessor for SnippetHeaderModel);
  sub_DE3DC(v7, &qword_189D00);
  sub_DDA68(v8, &qword_18B168);
  sub_39BAC();
  sub_DC288();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v9 = sub_A78C();
  uint64_t v17 = sub_A888(v9, v10, v11, v12, v13, v14, v15, v16, v507, v569, v631);
  uint64_t v25 = sub_A854(v17, v18, v19, v20, v21, v22, v23, v24, v508, v570, v632, v693);
  uint64_t v33 = sub_A84C(v25, v26, v27, v28, v29, v30, v31, v32, v509, v571, v633, v694, v754);
  uint64_t v41 = sub_A844(v33, v34, v35, v36, v37, v38, v39, v40, v510, v572, v634, v695, v755, v814);
  uint64_t v49 = sub_A83C(v41, v42, v43, v44, v45, v46, v47, v48, v511, v573, v635, v696, v756, v815, v873);
  uint64_t v57 = sub_A95C(v49, v50, v51, v52, v53, v54, v55, v56, v512, v574, v636, v697, v757, v816, v874, v931);
  uint64_t v65 = sub_A954(v57, v58, v59, v60, v61, v62, v63, v64, v513, v575, v637, v698, v758, v817, v875, v932, v988);
  uint64_t v73 = sub_A938(v65, v66, v67, v68, v69, v70, v71, v72, v514, v576, v638, v699, v759, v818, v876, v933, v989, v1044);
  uint64_t v81 = sub_A930( v73,  v74,  v75,  v76,  v77,  v78,  v79,  v80,  v515,  v577,  v639,  v700,  v760,  v819,  v877,  v934,  v990,  v1045,  v1099);
  uint64_t v89 = sub_A928( v81,  v82,  v83,  v84,  v85,  v86,  v87,  v88,  v516,  v578,  v640,  v701,  v761,  v820,  v878,  v935,  v991,  v1046,  v1100,  v1153);
  uint64_t v97 = sub_A920( v89,  v90,  v91,  v92,  v93,  v94,  v95,  v96,  v517,  v579,  v641,  v702,  v762,  v821,  v879,  v936,  v992,  v1047,  v1101,  v1154,  v1206);
  uint64_t v105 = sub_36374( v97,  v98,  v99,  v100,  v101,  v102,  v103,  v104,  v518,  v580,  v642,  v703,  v763,  v822,  v880,  v937,  v993,  v1048,  v1102,  v1155,  v1207,  v1258);
  uint64_t v113 = sub_3636C( v105,  v106,  v107,  v108,  v109,  v110,  v111,  v112,  v519,  v581,  v643,  v704,  v764,  v823,  v881,  v938,  v994,  v1049,  v1103,  v1156,  v1208,  v1259,  v1309);
  uint64_t v121 = sub_36364( v113,  v114,  v115,  v116,  v117,  v118,  v119,  v120,  v520,  v582,  v644,  v705,  v765,  v824,  v882,  v939,  v995,  v1050,  v1104,  v1157,  v1209,  v1260,  v1310,  v1359);
  uint64_t v129 = sub_363F0( v121,  v122,  v123,  v124,  v125,  v126,  v127,  v128,  v521,  v583,  v645,  v706,  v766,  v825,  v883,  v940,  v996,  v1051,  v1105,  v1158,  v1210,  v1261,  v1311,  v1360,  v1408);
  uint64_t v137 = sub_36430( v129,  v130,  v131,  v132,  v133,  v134,  v135,  v136,  v522,  v584,  v646,  v707,  v767,  v826,  v884,  v941,  v997,  v1052,  v1106,  v1159,  v1211,  v1262,  v1312,  v1361,  v1409,  v1456);
  uint64_t v145 = sub_36428( v137,  v138,  v139,  v140,  v141,  v142,  v143,  v144,  v523,  v585,  v647,  v708,  v768,  v827,  v885,  v942,  v998,  v1053,  v1107,  v1160,  v1212,  v1263,  v1313,  v1362,  v1410,  v1457,  v1503);
  uint64_t v153 = sub_36478( v145,  v146,  v147,  v148,  v149,  v150,  v151,  v152,  v524,  v586,  v648,  v709,  v769,  v828,  v886,  v943,  v999,  v1054,  v1108,  v1161,  v1213,  v1264,  v1314,  v1363,  v1411,  v1458,  v1504,  v1549);
  uint64_t v161 = sub_36524( v153,  v154,  v155,  v156,  v157,  v158,  v159,  v160,  v525,  v587,  v649,  v710,  v770,  v829,  v887,  v944,  v1000,  v1055,  v1109,  v1162,  v1214,  v1265,  v1315,  v1364,  v1412,  v1459,  v1505,  v1550,  v1594);
  uint64_t v169 = sub_3651C( v161,  v162,  v163,  v164,  v165,  v166,  v167,  v168,  v526,  v588,  v650,  v711,  v771,  v830,  v888,  v945,  v1001,  v1056,  v1110,  v1163,  v1215,  v1266,  v1316,  v1365,  v1413,  v1460,  v1506,  v1551,  v1595,  v1638);
  uint64_t v177 = sub_36514( v169,  v170,  v171,  v172,  v173,  v174,  v175,  v176,  v527,  v589,  v651,  v712,  v772,  v831,  v889,  v946,  v1002,  v1057,  v1111,  v1164,  v1216,  v1267,  v1317,  v1366,  v1414,  v1461,  v1507,  v1552,  v1596,  v1639,  v1681);
  uint64_t v185 = sub_3650C( v177,  v178,  v179,  v180,  v181,  v182,  v183,  v184,  v528,  v590,  v652,  v713,  v773,  v832,  v890,  v947,  v1003,  v1058,  v1112,  v1165,  v1217,  v1268,  v1318,  v1367,  v1415,  v1462,  v1508,  v1553,  v1597,  v1640,  v1682,  v1723);
  uint64_t v193 = sub_36504( v185,  v186,  v187,  v188,  v189,  v190,  v191,  v192,  v529,  v591,  v653,  v714,  v774,  v833,  v891,  v948,  v1004,  v1059,  v1113,  v1166,  v1218,  v1269,  v1319,  v1368,  v1416,  v1463,  v1509,  v1554,  v1598,  v1641,  v1683,  v1724,  v1764);
  uint64_t v201 = sub_364FC( v193,  v194,  v195,  v196,  v197,  v198,  v199,  v200,  v530,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114,  v1167,  v1219,  v1270,  v1320,  v1369,  v1417,  v1464,  v1510,  v1555,  v1599,  v1642,  v1684,  v1725,  v1765,  v1804);
  uint64_t v209 = sub_364F4( v201,  v202,  v203,  v204,  v205,  v206,  v207,  v208,  v531,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168,  v1220,  v1271,  v1321,  v1370,  v1418,  v1465,  v1511,  v1556,  v1600,  v1643,  v1685,  v1726,  v1766,  v1805,  v1843);
  uint64_t v217 = sub_364EC( v209,  v210,  v211,  v212,  v213,  v214,  v215,  v216,  v532,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221,  v1272,  v1322,  v1371,  v1419,  v1466,  v1512,  v1557,  v1601,  v1644,  v1686,  v1727,  v1767,  v1806,  v1844,  v1881);
  uint64_t v225 = sub_364E4( v217,  v218,  v219,  v220,  v221,  v222,  v223,  v224,  v533,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273,  v1323,  v1372,  v1420,  v1467,  v1513,  v1558,  v1602,  v1645,  v1687,  v1728,  v1768,  v1807,  v1845,  v1882,  v1918);
  uint64_t v233 = sub_364DC( v225,  v226,  v227,  v228,  v229,  v230,  v231,  v232,  v534,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324,  v1373,  v1421,  v1468,  v1514,  v1559,  v1603,  v1646,  v1688,  v1729,  v1769,  v1808,  v1846,  v1883,  v1919,  v1954);
  uint64_t v241 = sub_364D4( v233,  v234,  v235,  v236,  v237,  v238,  v239,  v240,  v535,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374,  v1422,  v1469,  v1515,  v1560,  v1604,  v1647,  v1689,  v1730,  v1770,  v1809,  v1847,  v1884,  v1920,  v1955,  v1989);
  uint64_t v249 = sub_366F8( v241,  v242,  v243,  v244,  v245,  v246,  v247,  v248,  v536,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423,  v1470,  v1516,  v1561,  v1605,  v1648,  v1690,  v1731,  v1771,  v1810,  v1848,  v1885,  v1921,  v1956,  v1990,  v2023);
  uint64_t v257 = sub_366F0( v249,  v250,  v251,  v252,  v253,  v254,  v255,  v256,  v537,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471,  v1517,  v1562,  v1606,  v1649,  v1691,  v1732,  v1772,  v1811,  v1849,  v1886,  v1922,  v1957,  v1991,  v2024,  v2056);
  uint64_t v265 = sub_36B90( v257,  v258,  v259,  v260,  v261,  v262,  v263,  v264,  v538,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518,  v1563,  v1607,  v1650,  v1692,  v1733,  v1773,  v1812,  v1850,  v1887,  v1923,  v1958,  v1992,  v2025,  v2057,  v2088);
  uint64_t v273 = sub_36EF4( v265,  v266,  v267,  v268,  v269,  v270,  v271,  v272,  v539,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564,  v1608,  v1651,  v1693,  v1734,  v1774,  v1813,  v1851,  v1888,  v1924,  v1959,  v1993,  v2026,  v2058,  v2089,  v2119);
  uint64_t v281 = sub_36EEC( v273,  v274,  v275,  v276,  v277,  v278,  v279,  v280,  v540,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609,  v1652,  v1694,  v1735,  v1775,  v1814,  v1852,  v1889,  v1925,  v1960,  v1994,  v2027,  v2059,  v2090,  v2120,  v2149);
  uint64_t v289 = sub_DD7E4( v281,  v282,  v283,  v284,  v285,  v286,  v287,  v288,  v541,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653,  v1695,  v1736,  v1776,  v1815,  v1853,  v1890,  v1926,  v1961,  v1995,  v2028,  v2060,  v2091,  v2121,  v2150,  v2178);
  uint64_t v297 = sub_DD7DC( v289,  v290,  v291,  v292,  v293,  v294,  v295,  v296,  v542,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696,  v1737,  v1777,  v1816,  v1854,  v1891,  v1927,  v1962,  v1996,  v2029,  v2061,  v2092,  v2122,  v2151,  v2179,  v2206);
  uint64_t v305 = sub_DD7D4( v297,  v298,  v299,  v300,  v301,  v302,  v303,  v304,  v543,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738,  v1778,  v1817,  v1855,  v1892,  v1928,  v1963,  v1997,  v2030,  v2062,  v2093,  v2123,  v2152,  v2180,  v2207,  v2233);
  uint64_t v313 = sub_DD7CC( v305,  v306,  v307,  v308,  v309,  v310,  v311,  v312,  v544,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779,  v1818,  v1856,  v1893,  v1929,  v1964,  v1998,  v2031,  v2063,  v2094,  v2124,  v2153,  v2181,  v2208,  v2234,  v2259);
  uint64_t v321 = sub_DD7C4( v313,  v314,  v315,  v316,  v317,  v318,  v319,  v320,  v545,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819,  v1857,  v1894,  v1930,  v1965,  v1999,  v2032,  v2064,  v2095,  v2125,  v2154,  v2182,  v2209,  v2235,  v2260,  v2284);
  uint64_t v329 = sub_DD7BC( v321,  v322,  v323,  v324,  v325,  v326,  v327,  v328,  v546,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858,  v1895,  v1931,  v1966,  v2000,  v2033,  v2065,  v2096,  v2126,  v2155,  v2183,  v2210,  v2236,  v2261,  v2285,
           v2308);
  uint64_t v337 = sub_DD7B4( v329,  v330,  v331,  v332,  v333,  v334,  v335,  v336,  v547,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896,  v1932,  v1967,  v2001,  v2034,  v2066,  v2097,  v2127,  v2156,  v2184,  v2211,  v2237,  v2262,  v2286,
           v2309,
           v2331);
  uint64_t v345 = sub_DD7AC( v337,  v338,  v339,  v340,  v341,  v342,  v343,  v344,  v548,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933,  v1968,  v2002,  v2035,  v2067,  v2098,  v2128,  v2157,  v2185,  v2212,  v2238,  v2263,  v2287,
           v2310,
           v2332,
           v2353);
  uint64_t v353 = sub_DD7A4( v345,  v346,  v347,  v348,  v349,  v350,  v351,  v352,  v549,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969,  v2003,  v2036,  v2068,  v2099,  v2129,  v2158,  v2186,  v2213,  v2239,  v2264,  v2288,
           v2311,
           v2333,
           v2354,
           v2374);
  uint64_t v361 = sub_DD79C( v353,  v354,  v355,  v356,  v357,  v358,  v359,  v360,  v550,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004,  v2037,  v2069,  v2100,  v2130,  v2159,  v2187,  v2214,  v2240,  v2265,  v2289,
           v2312,
           v2334,
           v2355,
           v2375,
           v2394);
  uint64_t v369 = sub_DD794( v361,  v362,  v363,  v364,  v365,  v366,  v367,  v368,  v551,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038,  v2070,  v2101,  v2131,  v2160,  v2188,  v2215,  v2241,  v2266,  v2290,
           v2313,
           v2335,
           v2356,
           v2376,
           v2395,
           v2413);
  uint64_t v377 = sub_DD78C( v369,  v370,  v371,  v372,  v373,  v374,  v375,  v376,  v552,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071,  v2102,  v2132,  v2161,  v2189,  v2216,  v2242,  v2267,  v2291,
           v2314,
           v2336,
           v2357,
           v2377,
           v2396,
           v2414,
           v2431);
  uint64_t v385 = sub_DD784( v377,  v378,  v379,  v380,  v381,  v382,  v383,  v384,  v553,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103,  v2133,  v2162,  v2190,  v2217,  v2243,  v2268,  v2292,
           v2315,
           v2337,
           v2358,
           v2378,
           v2397,
           v2415,
           v2432,
           v2448);
  uint64_t v393 = sub_DD77C( v385,  v386,  v387,  v388,  v389,  v390,  v391,  v392,  v554,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134,  v2163,  v2191,  v2218,  v2244,  v2269,  v2293,
           v2316,
           v2338,
           v2359,
           v2379,
           v2398,
           v2416,
           v2433,
           v2449,
           v2464);
  uint64_t v401 = sub_DD774( v393,  v394,  v395,  v396,  v397,  v398,  v399,  v400,  v555,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164,  v2192,  v2219,  v2245,  v2270,  v2294,
           v2317,
           v2339,
           v2360,
           v2380,
           v2399,
           v2417,
           v2434,
           v2450,
           v2465,
           v2479);
  uint64_t v409 = sub_DD76C( v401,  v402,  v403,  v404,  v405,  v406,  v407,  v408,  v556,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193,  v2220,  v2246,  v2271,  v2295,
           v2318,
           v2340,
           v2361,
           v2381,
           v2400,
           v2418,
           v2435,
           v2451,
           v2466,
           v2480,
           v2493);
  uint64_t v417 = sub_DD764( v409,  v410,  v411,  v412,  v413,  v414,  v415,  v416,  v557,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221,  v2247,  v2272,  v2296,
           v2319,
           v2341,
           v2362,
           v2382,
           v2401,
           v2419,
           v2436,
           v2452,
           v2467,
           v2481,
           v2494,
           v2506);
  uint64_t v425 = sub_DD75C( v417,  v418,  v419,  v420,  v421,  v422,  v423,  v424,  v558,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248,  v2273,  v2297,
           v2320,
           v2342,
           v2363,
           v2383,
           v2402,
           v2420,
           v2437,
           v2453,
           v2468,
           v2482,
           v2495,
           v2507,
           v2518);
  uint64_t v433 = sub_DD754( v425,  v426,  v427,  v428,  v429,  v430,  v431,  v432,  v559,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274,  v2298,
           v2321,
           v2343,
           v2364,
           v2384,
           v2403,
           v2421,
           v2438,
           v2454,
           v2469,
           v2483,
           v2496,
           v2508,
           v2519,
           v2529);
  uint64_t v441 = sub_DD74C( v433,  v434,  v435,  v436,  v437,  v438,  v439,  v440,  v560,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299,
           v2322,
           v2344,
           v2365,
           v2385,
           v2404,
           v2422,
           v2439,
           v2455,
           v2470,
           v2484,
           v2497,
           v2509,
           v2520,
           v2530);
  uint64_t v449 = sub_DD744( v441,  v442,  v443,  v444,  v445,  v446,  v447,  v448,  v561,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323,
           v2345,
           v2366,
           v2386,
           v2405,
           v2423,
           v2440,
           v2456,
           v2471,
           v2485,
           v2498,
           v2510,
           v2521,
           v2531);
  uint64_t v457 = sub_DD73C( v449,  v450,  v451,  v452,  v453,  v454,  v455,  v456,  v562,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346,
           v2367,
           v2387,
           v2406,
           v2424,
           v2441,
           v2457,
           v2472,
           v2486,
           v2499,
           v2511,
           v2522,
           v2532);
  uint64_t v465 = sub_DD734( v457,  v458,  v459,  v460,  v461,  v462,  v463,  v464,  v563,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368,
           v2388,
           v2407,
           v2425,
           v2442,
           v2458,
           v2473,
           v2487,
           v2500,
           v2512,
           v2523,
           v2533);
  uint64_t v473 = sub_DD72C( v465,  v466,  v467,  v468,  v469,  v470,  v471,  v472,  v564,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389,
           v2408,
           v2426,
           v2443,
           v2459,
           v2474,
           v2488,
           v2501,
           v2513,
           v2524,
           v2534);
  uint64_t v481 = sub_DD724( v473,  v474,  v475,  v476,  v477,  v478,  v479,  v480,  v565,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409,
           v2427,
           v2444,
           v2460,
           v2475,
           v2489,
           v2502,
           v2514,
           v2525,
           v2535);
  uint64_t v489 = sub_DD71C( v481,  v482,  v483,  v484,  v485,  v486,  v487,  v488,  v566,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428,
           v2445,
           v2461,
           v2476,
           v2490,
           v2503,
           v2515,
           v2526,
           v2536);
  uint64_t v497 = sub_DD714( v489,  v490,  v491,  v492,  v493,  v494,  v495,  v496,  v567,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446,
           v2462,
           v2477,
           v2491,
           v2504,
           v2516,
           v2527,
           v2537);
  sub_DD70C( v497,  v498,  v499,  v500,  v501,  v502,  v503,  v504,  v568,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
    v2330,
    v2352,
    v2373,
    v2393,
    v2412,
    v2430,
    v2447,
    v2463,
    v2478,
    v2492,
    v2505,
    v2517,
    v2528,
    v2538);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_DDA48();
  sub_DDA58();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  uint64_t v505 = (uint64_t (*)(void))sub_DE01C();
  return sub_36148(v505);
}

uint64_t sub_D1E04()
{
  os_log_type_t v6 = sub_AB70();
  if (sub_46614(v6))
  {
    uint64_t v7 = (_WORD *)sub_3635C();
    sub_36908(v7);
    sub_DD494();
    sub_DA1C();
    sub_232EC(&dword_0, v0, v2, "Couldn't create logMedConfirmationRejected_Dialog, returning GenericErrorFlow", v3);
    sub_37128();
  }

  else
  {

    swift_bridgeObjectRelease();
  }

  sub_3747C();
  uint64_t v8 = *(void **)(v1 + 28136);
  sub_DD7EC();
  sub_DE1C4(v3);
  sub_A178();
  sub_DE2BC();

  sub_DA1C();
  sub_B25F0();

  uint64_t v9 = sub_DE9BC();
  sub_36A94((uint64_t)v9, &qword_189CF8);
  uint64_t v10 = sub_DE4FC();
  sub_DDC20(v10, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
  sub_DDE0C(v11, type metadata accessor for SnippetHeaderModel);
  sub_DDA68(v12, &qword_189D00);
  sub_DDBDC(v13, &qword_18B168);
  sub_DBE38();
  sub_A8F4();
  sub_A85C();
  sub_A864();
  sub_A910();
  sub_A8EC();
  sub_A760();
  sub_A7C8();
  sub_A67C();
  uint64_t v14 = sub_A78C();
  uint64_t v22 = sub_AAD8(v14, v15, v16, v17, v18, v19, v20, v21, v520, v583);
  uint64_t v30 = sub_A888(v22, v23, v24, v25, v26, v27, v28, v29, v521, v584, v646);
  uint64_t v38 = sub_A854(v30, v31, v32, v33, v34, v35, v36, v37, v522, v585, v647, v708);
  uint64_t v46 = sub_A84C(v38, v39, v40, v41, v42, v43, v44, v45, v523, v586, v648, v709, v769);
  uint64_t v54 = sub_A844(v46, v47, v48, v49, v50, v51, v52, v53, v524, v587, v649, v710, v770, v829);
  uint64_t v62 = sub_A83C(v54, v55, v56, v57, v58, v59, v60, v61, v525, v588, v650, v711, v771, v830, v888);
  uint64_t v70 = sub_A95C(v62, v63, v64, v65, v66, v67, v68, v69, v526, v589, v651, v712, v772, v831, v889, v946);
  uint64_t v78 = sub_A954(v70, v71, v72, v73, v74, v75, v76, v77, v527, v590, v652, v713, v773, v832, v890, v947, v1003);
  uint64_t v86 = sub_A938(v78, v79, v80, v81, v82, v83, v84, v85, v528, v591, v653, v714, v774, v833, v891, v948, v1004, v1059);
  uint64_t v94 = sub_A930( v86,  v87,  v88,  v89,  v90,  v91,  v92,  v93,  v529,  v592,  v654,  v715,  v775,  v834,  v892,  v949,  v1005,  v1060,  v1114);
  uint64_t v102 = sub_A928( v94,  v95,  v96,  v97,  v98,  v99,  v100,  v101,  v530,  v593,  v655,  v716,  v776,  v835,  v893,  v950,  v1006,  v1061,  v1115,  v1168);
  uint64_t v110 = sub_A920( v102,  v103,  v104,  v105,  v106,  v107,  v108,  v109,  v531,  v594,  v656,  v717,  v777,  v836,  v894,  v951,  v1007,  v1062,  v1116,  v1169,  v1221);
  uint64_t v118 = sub_36374( v110,  v111,  v112,  v113,  v114,  v115,  v116,  v117,  v532,  v595,  v657,  v718,  v778,  v837,  v895,  v952,  v1008,  v1063,  v1117,  v1170,  v1222,  v1273);
  uint64_t v126 = sub_3636C( v118,  v119,  v120,  v121,  v122,  v123,  v124,  v125,  v533,  v596,  v658,  v719,  v779,  v838,  v896,  v953,  v1009,  v1064,  v1118,  v1171,  v1223,  v1274,  v1324);
  uint64_t v134 = sub_36364( v126,  v127,  v128,  v129,  v130,  v131,  v132,  v133,  v534,  v597,  v659,  v720,  v780,  v839,  v897,  v954,  v1010,  v1065,  v1119,  v1172,  v1224,  v1275,  v1325,  v1374);
  uint64_t v142 = sub_363F0( v134,  v135,  v136,  v137,  v138,  v139,  v140,  v141,  v535,  v598,  v660,  v721,  v781,  v840,  v898,  v955,  v1011,  v1066,  v1120,  v1173,  v1225,  v1276,  v1326,  v1375,  v1423);
  uint64_t v150 = sub_36430( v142,  v143,  v144,  v145,  v146,  v147,  v148,  v149,  v536,  v599,  v661,  v722,  v782,  v841,  v899,  v956,  v1012,  v1067,  v1121,  v1174,  v1226,  v1277,  v1327,  v1376,  v1424,  v1471);
  uint64_t v158 = sub_36428( v150,  v151,  v152,  v153,  v154,  v155,  v156,  v157,  v537,  v600,  v662,  v723,  v783,  v842,  v900,  v957,  v1013,  v1068,  v1122,  v1175,  v1227,  v1278,  v1328,  v1377,  v1425,  v1472,  v1518);
  uint64_t v166 = sub_36478( v158,  v159,  v160,  v161,  v162,  v163,  v164,  v165,  v538,  v601,  v663,  v724,  v784,  v843,  v901,  v958,  v1014,  v1069,  v1123,  v1176,  v1228,  v1279,  v1329,  v1378,  v1426,  v1473,  v1519,  v1564);
  uint64_t v174 = sub_36524( v166,  v167,  v168,  v169,  v170,  v171,  v172,  v173,  v539,  v602,  v664,  v725,  v785,  v844,  v902,  v959,  v1015,  v1070,  v1124,  v1177,  v1229,  v1280,  v1330,  v1379,  v1427,  v1474,  v1520,  v1565,  v1609);
  uint64_t v182 = sub_3651C( v174,  v175,  v176,  v177,  v178,  v179,  v180,  v181,  v540,  v603,  v665,  v726,  v786,  v845,  v903,  v960,  v1016,  v1071,  v1125,  v1178,  v1230,  v1281,  v1331,  v1380,  v1428,  v1475,  v1521,  v1566,  v1610,  v1653);
  uint64_t v190 = sub_36514( v182,  v183,  v184,  v185,  v186,  v187,  v188,  v189,  v541,  v604,  v666,  v727,  v787,  v846,  v904,  v961,  v1017,  v1072,  v1126,  v1179,  v1231,  v1282,  v1332,  v1381,  v1429,  v1476,  v1522,  v1567,  v1611,  v1654,  v1696);
  uint64_t v198 = sub_3650C( v190,  v191,  v192,  v193,  v194,  v195,  v196,  v197,  v542,  v605,  v667,  v728,  v788,  v847,  v905,  v962,  v1018,  v1073,  v1127,  v1180,  v1232,  v1283,  v1333,  v1382,  v1430,  v1477,  v1523,  v1568,  v1612,  v1655,  v1697,  v1738);
  uint64_t v206 = sub_36504( v198,  v199,  v200,  v201,  v202,  v203,  v204,  v205,  v543,  v606,  v668,  v729,  v789,  v848,  v906,  v963,  v1019,  v1074,  v1128,  v1181,  v1233,  v1284,  v1334,  v1383,  v1431,  v1478,  v1524,  v1569,  v1613,  v1656,  v1698,  v1739,  v1779);
  uint64_t v214 = sub_364FC( v206,  v207,  v208,  v209,  v210,  v211,  v212,  v213,  v544,  v607,  v669,  v730,  v790,  v849,  v907,  v964,  v1020,  v1075,  v1129,  v1182,  v1234,  v1285,  v1335,  v1384,  v1432,  v1479,  v1525,  v1570,  v1614,  v1657,  v1699,  v1740,  v1780,  v1819);
  uint64_t v222 = sub_364F4( v214,  v215,  v216,  v217,  v218,  v219,  v220,  v221,  v545,  v608,  v670,  v731,  v791,  v850,  v908,  v965,  v1021,  v1076,  v1130,  v1183,  v1235,  v1286,  v1336,  v1385,  v1433,  v1480,  v1526,  v1571,  v1615,  v1658,  v1700,  v1741,  v1781,  v1820,  v1858);
  uint64_t v230 = sub_364EC( v222,  v223,  v224,  v225,  v226,  v227,  v228,  v229,  v546,  v609,  v671,  v732,  v792,  v851,  v909,  v966,  v1022,  v1077,  v1131,  v1184,  v1236,  v1287,  v1337,  v1386,  v1434,  v1481,  v1527,  v1572,  v1616,  v1659,  v1701,  v1742,  v1782,  v1821,  v1859,  v1896);
  uint64_t v238 = sub_364E4( v230,  v231,  v232,  v233,  v234,  v235,  v236,  v237,  v547,  v610,  v672,  v733,  v793,  v852,  v910,  v967,  v1023,  v1078,  v1132,  v1185,  v1237,  v1288,  v1338,  v1387,  v1435,  v1482,  v1528,  v1573,  v1617,  v1660,  v1702,  v1743,  v1783,  v1822,  v1860,  v1897,  v1933);
  uint64_t v246 = sub_364DC( v238,  v239,  v240,  v241,  v242,  v243,  v244,  v245,  v548,  v611,  v673,  v734,  v794,  v853,  v911,  v968,  v1024,  v1079,  v1133,  v1186,  v1238,  v1289,  v1339,  v1388,  v1436,  v1483,  v1529,  v1574,  v1618,  v1661,  v1703,  v1744,  v1784,  v1823,  v1861,  v1898,  v1934,  v1969);
  uint64_t v254 = sub_364D4( v246,  v247,  v248,  v249,  v250,  v251,  v252,  v253,  v549,  v612,  v674,  v735,  v795,  v854,  v912,  v969,  v1025,  v1080,  v1134,  v1187,  v1239,  v1290,  v1340,  v1389,  v1437,  v1484,  v1530,  v1575,  v1619,  v1662,  v1704,  v1745,  v1785,  v1824,  v1862,  v1899,  v1935,  v1970,  v2004);
  uint64_t v262 = sub_366F8( v254,  v255,  v256,  v257,  v258,  v259,  v260,  v261,  v550,  v613,  v675,  v736,  v796,  v855,  v913,  v970,  v1026,  v1081,  v1135,  v1188,  v1240,  v1291,  v1341,  v1390,  v1438,  v1485,  v1531,  v1576,  v1620,  v1663,  v1705,  v1746,  v1786,  v1825,  v1863,  v1900,  v1936,  v1971,  v2005,  v2038);
  uint64_t v270 = sub_366F0( v262,  v263,  v264,  v265,  v266,  v267,  v268,  v269,  v551,  v614,  v676,  v737,  v797,  v856,  v914,  v971,  v1027,  v1082,  v1136,  v1189,  v1241,  v1292,  v1342,  v1391,  v1439,  v1486,  v1532,  v1577,  v1621,  v1664,  v1706,  v1747,  v1787,  v1826,  v1864,  v1901,  v1937,  v1972,  v2006,  v2039,  v2071);
  uint64_t v278 = sub_36B90( v270,  v271,  v272,  v273,  v274,  v275,  v276,  v277,  v552,  v615,  v677,  v738,  v798,  v857,  v915,  v972,  v1028,  v1083,  v1137,  v1190,  v1242,  v1293,  v1343,  v1392,  v1440,  v1487,  v1533,  v1578,  v1622,  v1665,  v1707,  v1748,  v1788,  v1827,  v1865,  v1902,  v1938,  v1973,  v2007,  v2040,  v2072,  v2103);
  uint64_t v286 = sub_36EF4( v278,  v279,  v280,  v281,  v282,  v283,  v284,  v285,  v553,  v616,  v678,  v739,  v799,  v858,  v916,  v973,  v1029,  v1084,  v1138,  v1191,  v1243,  v1294,  v1344,  v1393,  v1441,  v1488,  v1534,  v1579,  v1623,  v1666,  v1708,  v1749,  v1789,  v1828,  v1866,  v1903,  v1939,  v1974,  v2008,  v2041,  v2073,  v2104,  v2134);
  uint64_t v294 = sub_36EEC( v286,  v287,  v288,  v289,  v290,  v291,  v292,  v293,  v554,  v617,  v679,  v740,  v800,  v859,  v917,  v974,  v1030,  v1085,  v1139,  v1192,  v1244,  v1295,  v1345,  v1394,  v1442,  v1489,  v1535,  v1580,  v1624,  v1667,  v1709,  v1750,  v1790,  v1829,  v1867,  v1904,  v1940,  v1975,  v2009,  v2042,  v2074,  v2105,  v2135,  v2164);
  uint64_t v302 = sub_DD7E4( v294,  v295,  v296,  v297,  v298,  v299,  v300,  v301,  v555,  v618,  v680,  v741,  v801,  v860,  v918,  v975,  v1031,  v1086,  v1140,  v1193,  v1245,  v1296,  v1346,  v1395,  v1443,  v1490,  v1536,  v1581,  v1625,  v1668,  v1710,  v1751,  v1791,  v1830,  v1868,  v1905,  v1941,  v1976,  v2010,  v2043,  v2075,  v2106,  v2136,  v2165,  v2193);
  uint64_t v310 = sub_DD7DC( v302,  v303,  v304,  v305,  v306,  v307,  v308,  v309,  v556,  v619,  v681,  v742,  v802,  v861,  v919,  v976,  v1032,  v1087,  v1141,  v1194,  v1246,  v1297,  v1347,  v1396,  v1444,  v1491,  v1537,  v1582,  v1626,  v1669,  v1711,  v1752,  v1792,  v1831,  v1869,  v1906,  v1942,  v1977,  v2011,  v2044,  v2076,  v2107,  v2137,  v2166,  v2194,  v2221);
  uint64_t v318 = sub_DD7D4( v310,  v311,  v312,  v313,  v314,  v315,  v316,  v317,  v557,  v620,  v682,  v743,  v803,  v862,  v920,  v977,  v1033,  v1088,  v1142,  v1195,  v1247,  v1298,  v1348,  v1397,  v1445,  v1492,  v1538,  v1583,  v1627,  v1670,  v1712,  v1753,  v1793,  v1832,  v1870,  v1907,  v1943,  v1978,  v2012,  v2045,  v2077,  v2108,  v2138,  v2167,  v2195,  v2222,  v2248);
  uint64_t v326 = sub_DD7CC( v318,  v319,  v320,  v321,  v322,  v323,  v324,  v325,  v558,  v621,  v683,  v744,  v804,  v863,  v921,  v978,  v1034,  v1089,  v1143,  v1196,  v1248,  v1299,  v1349,  v1398,  v1446,  v1493,  v1539,  v1584,  v1628,  v1671,  v1713,  v1754,  v1794,  v1833,  v1871,  v1908,  v1944,  v1979,  v2013,  v2046,  v2078,  v2109,  v2139,  v2168,  v2196,  v2223,  v2249,  v2274);
  uint64_t v334 = sub_DD7C4( v326,  v327,  v328,  v329,  v330,  v331,  v332,  v333,  v559,  v622,  v684,  v745,  v805,  v864,  v922,  v979,  v1035,  v1090,  v1144,  v1197,  v1249,  v1300,  v1350,  v1399,  v1447,  v1494,  v1540,  v1585,  v1629,  v1672,  v1714,  v1755,  v1795,  v1834,  v1872,  v1909,  v1945,  v1980,  v2014,  v2047,  v2079,  v2110,  v2140,  v2169,  v2197,  v2224,  v2250,  v2275,  v2299);
  uint64_t v342 = sub_DD7BC( v334,  v335,  v336,  v337,  v338,  v339,  v340,  v341,  v560,  v623,  v685,  v746,  v806,  v865,  v923,  v980,  v1036,  v1091,  v1145,  v1198,  v1250,  v1301,  v1351,  v1400,  v1448,  v1495,  v1541,  v1586,  v1630,  v1673,  v1715,  v1756,  v1796,  v1835,  v1873,  v1910,  v1946,  v1981,  v2015,  v2048,  v2080,  v2111,  v2141,  v2170,  v2198,  v2225,  v2251,  v2276,  v2300,
           v2323);
  uint64_t v350 = sub_DD7B4( v342,  v343,  v344,  v345,  v346,  v347,  v348,  v349,  v561,  v624,  v686,  v747,  v807,  v866,  v924,  v981,  v1037,  v1092,  v1146,  v1199,  v1251,  v1302,  v1352,  v1401,  v1449,  v1496,  v1542,  v1587,  v1631,  v1674,  v1716,  v1757,  v1797,  v1836,  v1874,  v1911,  v1947,  v1982,  v2016,  v2049,  v2081,  v2112,  v2142,  v2171,  v2199,  v2226,  v2252,  v2277,  v2301,
           v2324,
           v2346);
  uint64_t v358 = sub_DD7AC( v350,  v351,  v352,  v353,  v354,  v355,  v356,  v357,  v562,  v625,  v687,  v748,  v808,  v867,  v925,  v982,  v1038,  v1093,  v1147,  v1200,  v1252,  v1303,  v1353,  v1402,  v1450,  v1497,  v1543,  v1588,  v1632,  v1675,  v1717,  v1758,  v1798,  v1837,  v1875,  v1912,  v1948,  v1983,  v2017,  v2050,  v2082,  v2113,  v2143,  v2172,  v2200,  v2227,  v2253,  v2278,  v2302,
           v2325,
           v2347,
           v2368);
  uint64_t v366 = sub_DD7A4( v358,  v359,  v360,  v361,  v362,  v363,  v364,  v365,  v563,  v626,  v688,  v749,  v809,  v868,  v926,  v983,  v1039,  v1094,  v1148,  v1201,  v1253,  v1304,  v1354,  v1403,  v1451,  v1498,  v1544,  v1589,  v1633,  v1676,  v1718,  v1759,  v1799,  v1838,  v1876,  v1913,  v1949,  v1984,  v2018,  v2051,  v2083,  v2114,  v2144,  v2173,  v2201,  v2228,  v2254,  v2279,  v2303,
           v2326,
           v2348,
           v2369,
           v2389);
  uint64_t v374 = sub_DD79C( v366,  v367,  v368,  v369,  v370,  v371,  v372,  v373,  v564,  v627,  v689,  v750,  v810,  v869,  v927,  v984,  v1040,  v1095,  v1149,  v1202,  v1254,  v1305,  v1355,  v1404,  v1452,  v1499,  v1545,  v1590,  v1634,  v1677,  v1719,  v1760,  v1800,  v1839,  v1877,  v1914,  v1950,  v1985,  v2019,  v2052,  v2084,  v2115,  v2145,  v2174,  v2202,  v2229,  v2255,  v2280,  v2304,
           v2327,
           v2349,
           v2370,
           v2390,
           v2409);
  uint64_t v382 = sub_DD794( v374,  v375,  v376,  v377,  v378,  v379,  v380,  v381,  v565,  v628,  v690,  v751,  v811,  v870,  v928,  v985,  v1041,  v1096,  v1150,  v1203,  v1255,  v1306,  v1356,  v1405,  v1453,  v1500,  v1546,  v1591,  v1635,  v1678,  v1720,  v1761,  v1801,  v1840,  v1878,  v1915,  v1951,  v1986,  v2020,  v2053,  v2085,  v2116,  v2146,  v2175,  v2203,  v2230,  v2256,  v2281,  v2305,
           v2328,
           v2350,
           v2371,
           v2391,
           v2410,
           v2428);
  uint64_t v390 = sub_DD78C( v382,  v383,  v384,  v385,  v386,  v387,  v388,  v389,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097,  v1151,  v1204,  v1256,  v1307,  v1357,  v1406,  v1454,  v1501,  v1547,  v1592,  v1636,  v1679,  v1721,  v1762,  v1802,  v1841,  v1879,  v1916,  v1952,  v1987,  v2021,  v2054,  v2086,  v2117,  v2147,  v2176,  v2204,  v2231,  v2257,  v2282,  v2306,
           v2329,
           v2351,
           v2372,
           v2392,
           v2411,
           v2429,
           v2446);
  uint64_t v398 = sub_DD784( v390,  v391,  v392,  v393,  v394,  v395,  v396,  v397,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152,  v1205,  v1257,  v1308,  v1358,  v1407,  v1455,  v1502,  v1548,  v1593,  v1637,  v1680,  v1722,  v1763,  v1803,  v1842,  v1880,  v1917,  v1953,  v1988,  v2022,  v2055,  v2087,  v2118,  v2148,  v2177,  v2205,  v2232,  v2258,  v2283,  v2307,
           v2330,
           v2352,
           v2373,
           v2393,
           v2412,
           v2430,
           v2447,
           v2463);
  uint64_t v406 = sub_DD77C( v398,  v399,  v400,  v401,  v402,  v403,  v404,  v405,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206,  v1258,  v1309,  v1359,  v1408,  v1456,  v1503,  v1549,  v1594,  v1638,  v1681,  v1723,  v1764,  v1804,  v1843,  v1881,  v1918,  v1954,  v1989,  v2023,  v2056,  v2088,  v2119,  v2149,  v2178,  v2206,  v2233,  v2259,  v2284,  v2308,
           v2331,
           v2353,
           v2374,
           v2394,
           v2413,
           v2431,
           v2448,
           v2464,
           v2479);
  uint64_t v414 = sub_DD774( v406,  v407,  v408,  v409,  v410,  v411,  v412,  v413,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259,  v1310,  v1360,  v1409,  v1457,  v1504,  v1550,  v1595,  v1639,  v1682,  v1724,  v1765,  v1805,  v1844,  v1882,  v1919,  v1955,  v1990,  v2024,  v2057,  v2089,  v2120,  v2150,  v2179,  v2207,  v2234,  v2260,  v2285,  v2309,
           v2332,
           v2354,
           v2375,
           v2395,
           v2414,
           v2432,
           v2449,
           v2465,
           v2480,
           v2494);
  uint64_t v422 = sub_DD76C( v414,  v415,  v416,  v417,  v418,  v419,  v420,  v421,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311,  v1361,  v1410,  v1458,  v1505,  v1551,  v1596,  v1640,  v1683,  v1725,  v1766,  v1806,  v1845,  v1883,  v1920,  v1956,  v1991,  v2025,  v2058,  v2090,  v2121,  v2151,  v2180,  v2208,  v2235,  v2261,  v2286,  v2310,
           v2333,
           v2355,
           v2376,
           v2396,
           v2415,
           v2433,
           v2450,
           v2466,
           v2481,
           v2495,
           v2508);
  uint64_t v430 = sub_DD764( v422,  v423,  v424,  v425,  v426,  v427,  v428,  v429,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362,  v1411,  v1459,  v1506,  v1552,  v1597,  v1641,  v1684,  v1726,  v1767,  v1807,  v1846,  v1884,  v1921,  v1957,  v1992,  v2026,  v2059,  v2091,  v2122,  v2152,  v2181,  v2209,  v2236,  v2262,  v2287,  v2311,
           v2334,
           v2356,
           v2377,
           v2397,
           v2416,
           v2434,
           v2451,
           v2467,
           v2482,
           v2496,
           v2509,
           v2521);
  uint64_t v438 = sub_DD75C( v430,  v431,  v432,  v433,  v434,  v435,  v436,  v437,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412,  v1460,  v1507,  v1553,  v1598,  v1642,  v1685,  v1727,  v1768,  v1808,  v1847,  v1885,  v1922,  v1958,  v1993,  v2027,  v2060,  v2092,  v2123,  v2153,  v2182,  v2210,  v2237,  v2263,  v2288,  v2312,
           v2335,
           v2357,
           v2378,
           v2398,
           v2417,
           v2435,
           v2452,
           v2468,
           v2483,
           v2497,
           v2510,
           v2522,
           v2533);
  uint64_t v446 = sub_DD754( v438,  v439,  v440,  v441,  v442,  v443,  v444,  v445,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461,  v1508,  v1554,  v1599,  v1643,  v1686,  v1728,  v1769,  v1809,  v1848,  v1886,  v1923,  v1959,  v1994,  v2028,  v2061,  v2093,  v2124,  v2154,  v2183,  v2211,  v2238,  v2264,  v2289,  v2313,
           v2336,
           v2358,
           v2379,
           v2399,
           v2418,
           v2436,
           v2453,
           v2469,
           v2484,
           v2498,
           v2511,
           v2523,
           v2534,
           v2544);
  uint64_t v454 = sub_DD74C( v446,  v447,  v448,  v449,  v450,  v451,  v452,  v453,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509,  v1555,  v1600,  v1644,  v1687,  v1729,  v1770,  v1810,  v1849,  v1887,  v1924,  v1960,  v1995,  v2029,  v2062,  v2094,  v2125,  v2155,  v2184,  v2212,  v2239,  v2265,  v2290,  v2314,
           v2337,
           v2359,
           v2380,
           v2400,
           v2419,
           v2437,
           v2454,
           v2470,
           v2485,
           v2499,
           v2512,
           v2524,
           v2535,
           v2545);
  uint64_t v462 = sub_DD744( v454,  v455,  v456,  v457,  v458,  v459,  v460,  v461,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556,  v1601,  v1645,  v1688,  v1730,  v1771,  v1811,  v1850,  v1888,  v1925,  v1961,  v1996,  v2030,  v2063,  v2095,  v2126,  v2156,  v2185,  v2213,  v2240,  v2266,  v2291,  v2315,
           v2338,
           v2360,
           v2381,
           v2401,
           v2420,
           v2438,
           v2455,
           v2471,
           v2486,
           v2500,
           v2513,
           v2525,
           v2536,
           v2546);
  uint64_t v470 = sub_DD73C( v462,  v463,  v464,  v465,  v466,  v467,  v468,  v469,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602,  v1646,  v1689,  v1731,  v1772,  v1812,  v1851,  v1889,  v1926,  v1962,  v1997,  v2031,  v2064,  v2096,  v2127,  v2157,  v2186,  v2214,  v2241,  v2267,  v2292,  v2316,
           v2339,
           v2361,
           v2382,
           v2402,
           v2421,
           v2439,
           v2456,
           v2472,
           v2487,
           v2501,
           v2514,
           v2526,
           v2537,
           v2547);
  uint64_t v478 = sub_DD734( v470,  v471,  v472,  v473,  v474,  v475,  v476,  v477,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647,  v1690,  v1732,  v1773,  v1813,  v1852,  v1890,  v1927,  v1963,  v1998,  v2032,  v2065,  v2097,  v2128,  v2158,  v2187,  v2215,  v2242,  v2268,  v2293,  v2317,
           v2340,
           v2362,
           v2383,
           v2403,
           v2422,
           v2440,
           v2457,
           v2473,
           v2488,
           v2502,
           v2515,
           v2527,
           v2538,
           v2548);
  uint64_t v486 = sub_DD72C( v478,  v479,  v480,  v481,  v482,  v483,  v484,  v485,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691,  v1733,  v1774,  v1814,  v1853,  v1891,  v1928,  v1964,  v1999,  v2033,  v2066,  v2098,  v2129,  v2159,  v2188,  v2216,  v2243,  v2269,  v2294,  v2318,
           v2341,
           v2363,
           v2384,
           v2404,
           v2423,
           v2441,
           v2458,
           v2474,
           v2489,
           v2503,
           v2516,
           v2528,
           v2539,
           v2549);
  uint64_t v494 = sub_DD724( v486,  v487,  v488,  v489,  v490,  v491,  v492,  v493,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734,  v1775,  v1815,  v1854,  v1892,  v1929,  v1965,  v2000,  v2034,  v2067,  v2099,  v2130,  v2160,  v2189,  v2217,  v2244,  v2270,  v2295,  v2319,
           v2342,
           v2364,
           v2385,
           v2405,
           v2424,
           v2442,
           v2459,
           v2475,
           v2490,
           v2504,
           v2517,
           v2529,
           v2540,
           v2550);
  uint64_t v502 = sub_DD71C( v494,  v495,  v496,  v497,  v498,  v499,  v500,  v501,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776,  v1816,  v1855,  v1893,  v1930,  v1966,  v2001,  v2035,  v2068,  v2100,  v2131,  v2161,  v2190,  v2218,  v2245,  v2271,  v2296,  v2320,
           v2343,
           v2365,
           v2386,
           v2406,
           v2425,
           v2443,
           v2460,
           v2476,
           v2491,
           v2505,
           v2518,
           v2530,
           v2541,
           v2551);
  uint64_t v510 = sub_DD714( v502,  v503,  v504,  v505,  v506,  v507,  v508,  v509,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817,  v1856,  v1894,  v1931,  v1967,  v2002,  v2036,  v2069,  v2101,  v2132,  v2162,  v2191,  v2219,  v2246,  v2272,  v2297,  v2321,
           v2344,
           v2366,
           v2387,
           v2407,
           v2426,
           v2444,
           v2461,
           v2477,
           v2492,
           v2506,
           v2519,
           v2531,
           v2542,
           v2552);
  sub_DD70C( v510,  v511,  v512,  v513,  v514,  v515,  v516,  v517,  v582,  v645,  v707,  v768,  v828,  v887,  v945,  v1002,  v1058,  v1113,  v1167,  v1220,  v1272,  v1323,  v1373,  v1422,  v1470,  v1517,  v1563,  v1608,  v1652,  v1695,  v1737,  v1778,  v1818,  v1857,  v1895,  v1932,  v1968,  v2003,  v2037,  v2070,  v2102,  v2133,  v2163,  v2192,  v2220,  v2247,  v2273,  v2298,  v2322,
    v2345,
    v2367,
    v2388,
    v2408,
    v2427,
    v2445,
    v2462,
    v2478,
    v2493,
    v2507,
    v2520,
    v2532,
    v2543,
    v2553);
  sub_DD704();
  sub_DD6FC();
  sub_DD6F4();
  sub_DD6EC();
  sub_DD6E4();
  sub_DD6DC();
  sub_DD6D4();
  sub_DD6CC();
  sub_DD6C4();
  sub_DD6BC();
  sub_DD6B4();
  sub_DD6AC();
  sub_DD6A4();
  sub_DD69C();
  sub_DD694();
  sub_DD68C();
  sub_DD684();
  sub_DD67C();
  sub_DD674();
  sub_DD66C();
  sub_DD664();
  sub_DD65C();
  sub_DD654();
  sub_DD64C();
  sub_DD644();
  sub_DD63C();
  sub_DD634();
  sub_DD62C();
  sub_DD624();
  sub_DD61C();
  sub_DD614();
  sub_DD60C();
  sub_DD604();
  sub_DD5FC();
  sub_DD5F4();
  sub_DD5EC();
  sub_DD5E4();
  sub_DD5DC();
  sub_DD5D4();
  sub_DD5CC();
  sub_DD5C4();
  sub_DD5BC();
  sub_DD5B4();
  sub_DD5AC();
  sub_DD5A4();
  sub_DD59C();
  sub_DD594();
  sub_DD58C();
  sub_DD584();
  sub_DD57C();
  sub_DD574();
  sub_DD56C();
  sub_DD564();
  sub_DD55C();
  sub_DD554();
  sub_DD54C();
  sub_DD544();
  sub_DD53C();
  sub_DD534();
  sub_DD52C();
  sub_DD524();
  sub_DD51C();
  sub_DD514();
  sub_DD50C();
  sub_DD504();
  sub_DD4FC();
  sub_DD4F4();
  sub_DD4EC();
  sub_DD4DC();
  sub_DD4E4();
  sub_DD868();
  sub_DD870();
  sub_36B88();
  sub_366E8();
  sub_3677C();
  sub_36588();
  sub_36624();
  sub_3661C();
  sub_36614();
  sub_3660C();
  sub_36604();
  sub_365FC();
  sub_365F4();
  sub_365EC();
  sub_365E4();
  sub_365DC();
  sub_366B8();
  sub_366B0();
  sub_366A8();
  sub_36814();
  uint64_t v518 = (uint64_t (*)(void))sub_DDBE4();
  return sub_36148(v518);
}

uint64_t sub_D21CC()
{
  *(void *)(v0 + 28272) = v2;
  *(void *)(v0 + 28280) = v1;
  uint64_t v4 = sub_36900(v3);
  if (v1)
  {
    sub_367AC();
    uint64_t v5 = sub_36860();
    sub_36A94(v5, &qword_189D00);
  }

  else
  {
    sub_36A94(v4, &qword_189D00);
    sub_367AC();
  }

  sub_A964();
  return sub_363F8(v6, v7, v8);
}

uint64_t sub_D224C()
{
  uint64_t v2598 = v1 | 0x1000000000000000LL;
  uint64_t v2599 = v2;
  uint64_t v2597 = v0;
  uint64_t v3 = *(void *)(v0 + 25976) + 24LL;
  id v4 = [*(id *)(v0 + 28272) catId];
  uint64_t v5 = (uint8_t *)static String._unconditionallyBridgeFromObjectiveC(_:)(v4);

  uint64_t v6 = sub_37104();
  OutputGenerationManifest.responseViewId.setter(v6, v7);
  sub_368F8();
  sub_DE214(v3);
  sub_DD83C();
  if ((sub_DD9D0((void *)(v0 + 19608)) & 1) != 0)
  {
    _s18WellnessFlowPlugin22DateTimeInferenceUtilsVwxx_0((void *)(v0 + 19608));
    sub_20300();
    unsigned __int8 v8 = 4;
  }

  else
  {
    sub_DDAF8();
    sub_DD468();
    uint64_t v5 = *(uint8_t **)(v0 + 19192);
    sub_DD92C((void *)(v0 + 19168));
    sub_DD8F8();
    if (v9) {
      unsigned __int8 v8 = 0;
    }
    else {
      unsigned __int8 v8 = 4;
    }
  }

  uint64_t v10 = *(void *)(v0 + 26128);
  sub_12BE9C(0LL, 0LL, v8);
  uint64_t v11 = sub_BB080();
  sub_DABC0(v11, v12, v13);
  uint64_t v14 = type metadata accessor for URL(0LL);
  uint64_t v15 = _s18WellnessFlowPlugin16WellnessSnippetsOwet_0(v10, 1LL, v14);
  uint64_t v16 = *(void *)(v0 + 26520);
  uint64_t v17 = *(void *)(v0 + 26128);
  if ((_DWORD)v15 == 1)
  {
    sub_57F00(v15, &qword_189CF8);
    sub_DE99C(v16);
    goto LABEL_9;
  }

  sub_59024(*(void *)(v0 + 26520));
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL))(v17, v14);
  if (sub_DE2F4() == 1)
  {
LABEL_9:
    uint64_t v18 = *(void (**)(uint64_t))(v0 + 27384);
    uint64_t v19 = *(void *)(v0 + 27376);
    sub_279E0(*(void *)(v0 + 26520), &qword_189D00);
    sub_A5DC(v19, v0 + 25544);
    uint64_t v20 = sub_80C98();
    v18(v20);
    sub_A86C();
    os_log_type_t v21 = sub_A898();
    if (sub_A988(v21))
    {
      uint64_t v22 = *(void *)(v0 + 26872);
      uint64_t v23 = (_WORD *)sub_3635C();
      uint64_t v24 = sub_36908(v23);
      sub_DDA60((uint64_t)v24, (uint64_t)&v2594, (uint64_t)&v2595, (uint64_t)&v2596);
      sub_DA1C();
      sub_232EC( &dword_0,  (os_log_s *)(v0 + 25544),  (os_log_type_t)v19,  "Couldn't create actionAceCommandString while trying to create logMedConfirmationRejected_Dialog, returning GenericErrorFlow",  v5);
      sub_37128();

      sub_DDCC0(v22);
    }

    else
    {
      sub_DDA50();
      swift_bridgeObjectRelease();
      sub_36D90();
    }

    uint64_t v25 = *(void **)(v0 + 28272);
    uint64_t v26 = *(void **)(v0 + 28136);
    uint64_t v27 = *(void **)(v0 + 28120);
    uint64_t v2592 = *(void *)(v0 + 26144);
    uint64_t v28 = *(void *)(v0 + 26136);
    sub_DE1B4((_OWORD *)(*(void *)(v0 + 25976) + 64LL));
    sub_DE23C((void *)(v0 + 15488));
    sub_A178();
    sub_DE4CC();

    sub_82234();
    sub_249D4();

    sub_DE9FC();
    sub_464D0(v28);
    sub_464D0(v2592);
    uint64_t v29 = sub_DDB08();
    sub_DDC20(v29, type metadata accessor for SpecificMedLoggingFlow.SpecifiedMedicationSuccessParameters);
    sub_DDE0C(v30, type metadata accessor for SnippetHeaderModel);
    sub_DDA68(v31, &qword_189D00);
    sub_DDBDC(v32, &qword_18B168);
    sub_DBE38();
    sub_A8F4();
    sub_A85C();
    sub_A864();
    sub_A910();
    sub_A8EC();
    sub_A760();
    sub_A7C8();
    sub_A67C();
    uint64_t v33 = sub_A78C();
    uint64_t v41 = sub_AAD8(v33, v34, v35, v36, v37, v38, v39, v40, v558, v621);
    uint64_t v49 = sub_A888(v41, v42, v43, v44, v45, v46, v47, v48, v559, v622, v684);
    uint64_t v57 = sub_A854(v49, v50, v51, v52, v53, v54, v55, v56, v560, v623, v685, v746);
    uint64_t v65 = sub_A84C(v57, v58, v59, v60, v61, v62, v63, v64, v561, v624, v686, v747, v807);
    uint64_t v73 = sub_A844(v65, v66, v67, v68, v69, v70, v71, v72, v562, v625, v687, v748, v808, v867);
    uint64_t v81 = sub_A83C(v73, v74, v75, v76, v77, v78, v79, v80, v563, v626, v688, v749, v809, v868, v926);
    uint64_t v89 = sub_A95C(v81, v82, v83, v84, v85, v86, v87, v88, v564, v627, v689, v750, v810, v869, v927, v984);
    uint64_t v97 = sub_A954(v89, v90, v91, v92, v93, v94, v95, v96, v565, v628, v690, v751, v811, v870, v928, v985, v1041);
    uint64_t v105 = sub_A938( v97,  v98,  v99,  v100,  v101,  v102,  v103,  v104,  v566,  v629,  v691,  v752,  v812,  v871,  v929,  v986,  v1042,  v1097);
    uint64_t v113 = sub_A930( v105,  v106,  v107,  v108,  v109,  v110,  v111,  v112,  v567,  v630,  v692,  v753,  v813,  v872,  v930,  v987,  v1043,  v1098,  v1152);
    uint64_t v121 = sub_A928( v113,  v114,  v115,  v116,  v117,  v118,  v119,  v120,  v568,  v631,  v693,  v754,  v814,  v873,  v931,  v988,  v1044,  v1099,  v1153,  v1206);
    uint64_t v129 = sub_A920( v121,  v122,  v123,  v124,  v125,  v126,  v127,  v128,  v569,  v632,  v694,  v755,  v815,  v874,  v932,  v989,  v1045,  v1100,  v1154,  v1207,  v1259);
    uint64_t v137 = sub_36374( v129,  v130,  v131,  v132,  v133,  v134,  v135,  v136,  v570,  v633,  v695,  v756,  v816,  v875,  v933,  v990,  v1046,  v1101,  v1155,  v1208,  v1260,  v1311);
    uint64_t v145 = sub_3636C( v137,  v138,  v139,  v140,  v141,  v142,  v143,  v144,  v571,  v634,  v696,  v757,  v817,  v876,  v934,  v991,  v1047,  v1102,  v1156,  v1209,  v1261,  v1312,  v1362);
    uint64_t v153 = sub_36364( v145,  v146,  v147,  v148,  v149,  v150,  v151,  v152,  v572,  v635,  v697,  v758,  v818,  v877,  v935,  v992,  v1048,  v1103,  v1157,  v1210,  v1262,  v1313,  v1363,  v1412);
    uint64_t v161 = sub_363F0( v153,  v154,  v155,  v156,  v157,  v158,  v159,  v160,  v573,  v636,  v698,  v759,  v819,  v878,  v936,  v993,  v1049,  v1104,  v1158,  v1211,  v1263,  v1314,  v1364,  v1413,  v1461);
    uint64_t v169 = sub_36430( v161,  v162,  v163,  v164,  v165,  v166,  v167,  v168,  v574,  v637,  v699,  v760,  v820,  v879,  v937,  v994,  v1050,  v1105,  v1159,  v1212,  v1264,  v1315,  v1365,  v1414,  v1462,  v1509);
    uint64_t v177 = sub_36428( v169,  v170,  v171,  v172,  v173,  v174,  v175,  v176,  v575,  v638,  v700,  v761,  v821,  v880,  v938,  v995,  v1051,  v1106,  v1160,  v1213,  v1265,  v1316,  v1366,  v1415,  v1463,  v1510,  v1556);
    uint64_t v185 = sub_36478( v177,  v178,  v179,  v180,  v181,  v182,  v183,  v184,  v576,  v639,  v701,  v762,  v822,  v881,  v939,  v996,  v1052,  v1107,  v1161,  v1214,  v1266,  v1317,  v1367,  v1416,  v1464,  v1511,  v1557,  v1602);
    uint64_t v193 = sub_36524( v185,  v186,  v187,  v188,  v189,  v190,  v191,  v192,  v577,  v640,  v702,  v763,  v823,  v882,  v940,  v997,  v1053,  v1108,  v1162,  v1215,  v1267,  v1318,  v1368,  v1417,  v1465,  v1512,  v1558,  v1603,  v1647);
    uint64_t v201 = sub_3651C( v193,  v194,  v195,  v196,  v197,  v198,  v199,  v200,  v578,  v641,  v703,  v764,  v824,  v883,  v941,  v998,  v1054,  v1109,  v1163,  v1216,  v1268,  v1319,  v1369,  v1418,  v1466,  v1513,  v1559,  v1604,  v1648,  v1691);
    uint64_t v209 = sub_36514( v201,  v202,  v203,  v204,  v205,  v206,  v207,  v208,  v579,  v642,  v704,  v765,  v825,  v884,  v942,  v999,  v1055,  v1110,  v1164,  v1217,  v1269,  v1320,  v1370,  v1419,  v1467,  v1514,  v1560,  v1605,  v1649,  v1692,  v1734);
    uint64_t v217 = sub_3650C( v209,  v210,  v211,  v212,  v213,  v214,  v215,  v216,  v580,  v643,  v705,  v766,  v826,  v885,  v943,  v1000,  v1056,  v1111,  v1165,  v1218,  v1270,  v1321,  v1371,  v1420,  v1468,  v1515,  v1561,  v1606,  v1650,  v1693,  v1735,  v1776);
    uint64_t v225 = sub_36504( v217,  v218,  v219,  v220,  v221,  v222,  v223,  v224,  v581,  v644,  v706,  v767,  v827,  v886,  v944,  v1001,  v1057,  v1112,  v1166,  v1219,  v1271,  v1322,  v1372,  v1421,  v1469,  v1516,  v1562,  v1607,  v1651,  v1694,  v1736,  v1777,  v1817);
    uint64_t v233 = sub_364FC( v225,  v226,  v227,  v228,  v229,  v230,  v231,  v232,  v582,  v645,  v707,  v768,  v828,  v887,  v945,  v1002,  v1058,  v1113,  v1167,  v1220,  v1272,  v1323,  v1373,  v1422,  v1470,  v1517,  v1563,  v1608,  v1652,  v1695,  v1737,  v1778,  v1818,  v1857);
    uint64_t v241 = sub_364F4( v233,  v234,  v235,  v236,  v237,  v238,  v239,  v240,  v583,  v646,  v708,  v769,  v829,  v888,  v946,  v1003,  v1059,  v1114,  v1168,  v1221,  v1273,  v1324,  v1374,  v1423,  v1471,  v1518,  v1564,  v1609,  v1653,  v1696,  v1738,  v1779,  v1819,  v1858,  v1896);
    uint64_t v249 = sub_364EC( v241,  v242,  v243,  v244,  v245,  v246,  v247,  v248,  v584,  v647,  v709,  v770,  v830,  v889,  v947,  v1004,  v1060,  v1115,  v1169,  v1222,  v1274,  v1325,  v1375,  v1424,  v1472,  v1519,  v1565,  v1610,  v1654,  v1697,  v1739,  v1780,  v1820,  v1859,  v1897,  v1934);
    uint64_t v257 = sub_364E4( v249,  v250,  v251,  v252,  v253,  v254,  v255,  v256,  v585,  v648,  v710,  v771,  v831,  v890,  v948,  v1005,  v1061,  v1116,  v1170,  v1223,  v1275,  v1326,  v1376,  v1425,  v1473,  v1520,  v1566,  v1611,  v1655,  v1698,  v1740,  v1781,  v1821,  v1860,  v1898,  v1935,  v1971);
    uint64_t v265 = sub_364DC( v257,  v258,  v259,  v260,  v261,  v262,  v263,  v264,  v586,  v649,  v711,  v772,  v832,  v891,  v949,  v1006,  v1062,  v1117,  v1171,  v1224,  v1276,  v1327,  v1377,  v1426,  v1474,  v1521,  v1567,  v1612,  v1656,  v1699,  v1741,  v1782,  v1822,  v1861,  v1899,  v1936,  v1972,  v2007);
    uint64_t v273 = sub_364D4( v265,  v266,  v267,  v268,  v269,  v270,  v271,  v272,  v587,  v650,  v712,  v773,  v833,  v892,  v950,  v1007,  v1063,  v1118,  v1172,  v1225,  v1277,  v1328,  v1378,  v1427,  v1475,  v1522,  v1568,  v1613,  v1657,  v1700,  v1742,  v1783,  v1823,  v1862,  v1900,  v1937,  v1973,  v2008,  v2042);
    uint64_t v281 = sub_366F8( v273,  v274,  v275,  v276,  v277,  v278,  v279,  v280,  v588,  v651,  v713,  v774,  v834,  v893,  v951,  v1008,  v1064,  v1119,  v1173,  v1226,  v1278,  v1329,  v1379,  v1428,  v1476,  v1523,  v1569,  v1614,  v1658,  v1701,  v1743,  v1784,  v1824,  v1863,  v1901,  v1938,  v1974,  v2009,  v2043,  v2076);
    uint64_t v289 = sub_366F0( v281,  v282,  v283,  v284,  v285,  v286,  v287,  v288,  v589,  v652,  v714,  v775,  v835,  v894,  v952,  v1009,  v1065,  v1120,  v1174,  v1227,  v1279,  v1330,  v1380,  v1429,  v1477,  v1524,  v1570,  v1615,  v1659,  v1702,  v1744,  v1785,  v1825,  v1864,  v1902,  v1939,  v1975,  v2010,  v2044,  v2077,  v2109);
    uint64_t v297 = sub_36B90( v289,  v290,  v291,  v292,  v293,  v294,  v295,  v296,  v590,  v653,  v715,  v776,  v836,  v895,  v953,  v1010,  v1066,  v1121,  v1175,  v1228,  v1280,  v1331,  v1381,  v1430,  v1478,  v1525,  v1571,  v1616,  v1660,  v1703,  v1745,  v1786,  v1826,  v1865,  v1903,  v1940,  v1976,  v2011,  v2045,  v2078,  v2110,  v2141);
    uint64_t v305 = sub_36EF4( v297,  v298,  v299,  v300,  v301,  v302,  v303,  v304,  v591,  v654,  v716,  v777,  v837,  v896,  v954,  v1011,  v1067,  v1122,  v1176,  v1229,  v1281,  v1332,  v1382,  v1431,  v1479,  v1526,  v1572,  v1617,  v1661,  v1704,  v1746,  v1787,  v1827,  v1866,  v1904,  v1941,  v1977,  v2012,  v2046,  v2079,  v2111,  v2142,  v2172);
    uint64_t v313 = sub_36EEC( v305,  v306,  v307,  v308,  v309,  v310,  v311,  v312,  v592,  v655,  v717,  v778,  v838,  v897,  v955,  v1012,  v1068,  v1123,  v1177,  v1230,  v1282,  v1333,  v1383,  v1432,  v1480,  v1527,  v1573,  v1618,  v1662,  v1705,  v1747,  v1788,  v1828,  v1867,  v1905,  v1942,  v1978,  v2013,  v2047,  v2080,  v2112,  v2143,  v2173,  v2202);
    uint64_t v321 = sub_DD7E4( v313,  v314,  v315,  v316,  v317,  v318,  v319,  v320,  v593,  v656,  v718,  v779,  v839,  v898,  v956,  v1013,  v1069,  v1124,  v1178,  v1231,  v1283,  v1334,  v1384,  v1433,  v1481,  v1528,  v1574,  v1619,  v1663,  v1706,  v1748,  v1789,  v1829,  v1868,  v1906,  v1943,  v1979,  v2014,  v2048,  v2081,  v2113,  v2144,  v2174,  v2203,  v2231);
    uint64_t v329 = sub_DD7DC( v321,  v322,  v323,  v324,  v325,  v326,  v327,  v328,  v594,  v657,  v719,  v780,  v840,  v899,  v957,  v1014,  v1070,  v1125,  v1179,  v1232,  v1284,  v1335,  v1385,  v1434,  v1482,  v1529,  v1575,  v1620,  v1664,  v1707,  v1749,  v1790,  v1830,  v1869,  v1907,  v1944,  v1980,  v2015,  v2049,  v2082,  v2114,  v2145,  v2175,  v2204,  v2232,  v2259);
    uint64_t v337 = sub_DD7D4( v329,  v330,  v331,  v332,  v333,  v334,  v335,  v336,  v595,  v658,  v720,  v781,  v841,  v900,  v958,  v1015,  v1071,  v1126,  v1180,  v1233,  v1285,  v1336,  v1386,  v1435,  v1483,  v1530,  v1576,  v1621,  v1665,  v1708,  v1750,  v1791,  v1831,  v1870,  v1908,  v1945,  v1981,  v2016,  v2050,  v2083,  v2115,  v2146,  v2176,  v2205,  v2233,  v2260,  v2286);
    uint64_t v345 = sub_DD7CC( v337,  v338,  v339,  v340,  v341,  v342,  v343,  v344,  v596,  v659,  v721,  v782,  v842,  v901,  v959,  v1016,  v1072,  v1127,  v1181,  v1234,  v1286,  v1337,  v1387,  v1436,  v1484,  v1531,  v1577,  v1622,  v1666,  v1709,  v1751,  v1792,  v1832,  v1871,  v1909,  v1946,  v1982,  v2017,  v2051,  v2084,  v2116,  v2147,  v2177,  v2206,  v2234,  v2261,  v2287,  v2312);
    uint64_t v353 = sub_DD7C4( v345,  v346,  v347,  v348,  v349,  v350,  v351,  v352,  v597,  v660,  v722,  v783,  v843,  v902,  v960,  v1017,  v1073,  v1128,  v1182,  v1235,  v1287,  v1338,  v1388,  v1437,  v1485,  v1532,  v1578,  v1623,  v1667,  v1710,  v1752,  v1793,  v1833,  v1872,  v1910,  v1947,  v1983,  v2018,  v2052,  v2085,  v2117,  v2148,  v2178,  v2207,  v2235,  v2262,  v2288,  v2313,  v2337);
    uint64_t v361 = sub_DD7BC( v353,  v354,  v355,  v356,  v357,  v358,  v359,  v360,  v598,  v661,  v723,  v784,  v844,  v903,  v961,  v1018,  v1074,  v1129,  v1183,  v1236,  v1288,  v1339,  v1389,  v1438,  v1486,  v1533,  v1579,  v1624,  v1668,  v1711,  v1753,  v1794,  v1834,  v1873,  v1911,  v1948,  v1984,  v2019,  v2053,  v2086,  v2118,  v2149,  v2179,  v2208,  v2236,  v2263,  v2289,  v2314,  v2338,
             v2361);
    uint64_t v369 = sub_DD7B4( v361,  v362,  v363,  v364,  v365,  v366,  v367,  v368,  v599,  v662,  v724,  v785,  v845,  v904,  v962,  v1019,  v1075,  v1130,  v1184,  v1237,  v1289,  v1340,  v1390,  v1439,  v1487,  v1534,  v1580,  v1625,  v1669,  v1712,  v1754,  v1795,  v1835,  v1874,  v1912,  v1949,  v1985,  v2020,  v2054,  v2087,  v2119,  v2150,  v2180,  v2209,  v2237,  v2264,  v2290,  v2315,  v2339,
             v2362,
             v2384);
    uint64_t v377 = sub_DD7AC( v369,  v370,  v371,  v372,  v373,  v374,  v375,  v376,  v600,  v663,  v725,  v786,  v846,  v905,  v963,  v1020,  v1076,  v1131,  v1185,  v1238,  v1290,  v1341,  v1391,  v1440,  v1488,  v1535,  v1581,  v1626,  v1670,  v1713,  v1755,  v1796,  v1836,  v1875,  v1913,  v1950,  v1986,  v2021,  v2055,  v2088,  v2120,  v2151,  v2181,  v2210,  v2238,  v2265,  v2291,  v2316,  v2340,
             v2363,
             v2385,
             v2406);
    uint64_t v385 = sub_DD7A4( v377,  v378,  v379,  v380,  v381,  v382,  v383,  v384,  v601,  v664,  v726,  v787,  v847,  v906,  v964,  v1021,  v1077,  v1132,  v1186,  v1239,  v1291,  v1342,  v1392,  v1441,  v1489,  v1536,  v1582,  v1627,  v1671,  v1714,  v1756,  v1797,  v1837,  v1876,  v1914,  v1951,  v1987,  v2022,  v2056,  v2089,  v2121,  v2152,  v2182,  v2211,  v2239,  v2266,  v2292,  v2317,  v2341,
             v2364,
             v2386,
             v2407,
             v2427);
    uint64_t v393 = sub_DD79C( v385,  v386,  v387,  v388,  v389,  v390,  v391,  v392,  v602,  v665,  v727,  v788,  v848,  v907,  v965,  v1022,  v1078,  v1133,  v1187,  v1240,  v1292,  v1343,  v1393,  v1442,  v1490,  v1537,  v1583,  v1628,  v1672,  v1715,  v1757,  v1798,  v1838,  v1877,  v1915,  v1952,  v1988,  v2023,  v2057,  v2090,  v2122,  v2153,  v2183,  v2212,  v2240,  v2267,  v2293,  v2318,  v2342,
             v2365,
             v2387,
             v2408,
             v2428,
             v2447);
    uint64_t v401 = sub_DD794( v393,  v394,  v395,  v396,  v397,  v398,  v399,  v400,  v603,  v666,  v728,  v789,  v849,  v908,  v966,  v1023,  v1079,  v1134,  v1188,  v1241,  v1293,  v1344,  v1394,  v1443,  v1491,  v1538,  v1584,  v1629,  v1673,  v1716,  v1758,  v1799,  v1839,  v1878,  v1916,  v1953,  v1989,  v2024,  v2058,  v2091,  v2123,  v2154,  v2184,  v2213,  v2241,  v2268,  v2294,  v2319,  v2343,
             v2366,
             v2388,
             v2409,
             v2429,
             v2448,
             v2466);
    uint64_t v409 = sub_DD78C( v401,  v402,  v403,  v404,  v405,  v406,  v407,  v408,  v604,  v667,  v729,  v790,  v850,  v909,  v967,  v1024,  v1080,  v1135,  v1189,  v1242,  v1294,  v1345,  v1395,  v1444,  v1492,  v1539,  v1585,  v1630,  v1674,  v1717,  v1759,  v1800,  v1840,  v1879,  v1917,  v1954,  v1990,  v2025,  v2059,  v2092,  v2124,  v2155,  v2185,  v2214,  v2242,  v2269,  v2295,  v2320,  v2344,
             v2367,
             v2389,
             v2410,
             v2430,
             v2449,
             v2467,
             v2484);
    uint64_t v417 = sub_DD784( v409,  v410,  v411,  v412,  v413,  v414,  v415,  v416,  v605,  v668,  v730,  v791,  v851,  v910,  v968,  v1025,  v1081,  v1136,  v1190,  v1243,  v1295,  v1346,  v1396,  v1445,  v1493,  v1540,  v1586,  v1631,  v1675,  v1718,  v1760,  v1801,  v1841,  v1880,  v1918,  v1955,  v1991,  v2026,  v2060,  v2093,  v2125,  v2156,  v2186,  v2215,  v2243,  v2270,  v2296,  v2321,  v2345,
             v2368,
             v2390,
             v2411,
             v2431,
             v2450,
             v2468,
             v2485,
             v2501);
    uint64_t v425 = sub_DD77C( v417,  v418,  v419,  v420,  v421,  v422,  v423,  v424,  v606,  v669,  v731,  v792,  v852,  v911,  v969,  v1026,  v1082,  v1137,  v1191,  v1244,  v1296,  v1347,  v1397,  v1446,  v1494,  v1541,  v1587,  v1632,  v1676,  v1719,  v1761,  v1802,  v1842,  v1881,  v1919,  v1956,  v1992,  v2027,  v2061,  v2094,  v2126,  v2157,  v2187,  v2216,  v2244,  v2271,  v2297,  v2322,  v2346,
             v2369,
             v2391,
             v2412,
             v2432,
             v2451,
             v2469,
             v2486,
             v2502,
             v2517);
    uint64_t v433 = sub_DD774( v425,  v426,  v427,  v428,  v429,  v430,  v431,  v432,  v607,  v670,  v732,  v793,  v853,  v912,  v970,  v1027,  v1083,  v1138,  v1192,  v1245,  v1297,  v1348,  v1398,  v1447,  v1495,  v1542,  v1588,  v1633,  v1677,  v1720,  v1762,  v1803,  v1843,  v1882,  v1920,  v1957,  v1993,  v2028,  v2062,  v2095,  v2127,  v2158,  v2188,  v2217,  v2245,  v2272,  v2298,  v2323,  v2347,
             v2370,
             v2392,
             v2413,
             v2433,
             v2452,
             v2470,
             v2487,
             v2503,
             v2518,
             v2532);
    uint64_t v441 = sub_DD76C( v433,  v434,  v435,  v436,  v437,  v438,  v439,  v440,  v608,  v671,  v733,  v794,  v854,  v913,  v971,  v1028,  v1084,  v1139,  v1193,  v1246,  v1298,  v1349,  v1399,  v1448,  v1496,  v1543,  v1589,  v1634,  v1678,  v1721,  v1763,  v1804,  v1844,  v1883,  v1921,  v1958,  v1994,  v2029,  v2063,  v2096,  v2128,  v2159,  v2189,  v2218,  v2246,  v2273,  v2299,  v2324,  v2348,
             v2371,
             v2393,
             v2414,
             v2434,
             v2453,
             v2471,
             v2488,
             v2504,
             v2519,
             v2533,
             v2546);
    uint64_t v449 = sub_DD764( v441,  v442,  v443,  v444,  v445,  v446,  v447,  v448,  v609,  v672,  v734,  v795,  v855,  v914,  v972,  v1029,  v1085,  v1140,  v1194,  v1247,  v1299,  v1350,  v1400,  v1449,  v1497,  v1544,  v1590,  v1635,  v1679,  v1722,  v1764,  v1805,  v1845,  v1884,  v1922,  v1959,  v1995,  v2030,  v2064,  v2097,  v2129,  v2160,  v2190,  v2219,  v2247,  v2274,  v2300,  v2325,  v2349,
             v2372,
             v2394,
             v2415,
             v2435,
             v2454,
             v2472,
             v2489,
             v2505,
             v2520,
             v2534,
             v2547,
             v2559);
    uint64_t v457 = sub_DD75C( v449,  v450,  v451,  v452,  v453,  v454,  v455,  v456,  v610,  v673,  v735,  v796,  v856,  v915,  v973,  v1030,  v1086,  v1141,  v1195,  v1248,  v1300,  v1351,  v1401,  v1450,  v1498,  v1545,  v1591,  v1636,  v1680,  v1723,  v1765,  v1806,  v1846,  v1885,  v1923,  v1960,  v1996,  v2031,  v2065,  v2098,  v2130,  v2161,  v2191,  v2220,  v2248,  v2275,  v2301,  v2326,  v2350,
             v2373,
             v2395,
             v2416,
             v2436,
             v2455,
             v2473,
             v2490,
             v2506,
             v2521,
             v2535,
             v2548,
             v2560,
             v2571);
    uint64_t v465 = sub_DD754( v457,  v458,  v459,  v460,  v461,  v462,  v463,  v464,  v611,  v674,  v736,  v797,  v857,  v916,  v974,  v1031,  v1087,  v1142,  v1196,  v1249,  v1301,  v1352,  v1402,  v1451,  v1499,  v1546,  v1592,  v1637,  v1681,  v1724,  v1766,  v1807,  v1847,  v1886,  v1924,  v1961,  v1997,  v2032,  v2066,  v2099,  v2131,  v2162,  v2192,  v2221,  v2249,  v2276,  v2302,  v2327,  v2351,
             v2374,
             v2396,
             v2417,
             v2437,
             v2456,
             v2474,
             v2491,
             v2507,
             v2522,
             v2536,
             v2549,
             v2561,
             v2572,
             v2582);
    uint64_t v473 = sub_DD74C( v465,  v466,  v467,  v468,  v469,  v470,  v471,  v472,  v612,  v675,  v737,  v798,  v858,  v917,  v975,  v1032,  v1088,  v1143,  v1197,  v1250,  v1302,  v1353,  v1403,  v1452,  v1500,  v1547,  v1593,  v1638,  v1682,  v1725,  v1767,  v1808,  v1848,  v1887,  v1925,  v1962,  v1998,  v2033,  v2067,  v2100,  v2132,  v2163,  v2193,  v2222,  v2250,  v2277,  v2303,  v2328,  v2352,
             v2375,
             v2397,
             v2418,
             v2438,
             v2457,
             v2475,
             v2492,
             v2508,
             v2523,
             v2537,
             v2550,
             v2562,
             v2573,
             v2583);
    uint64_t v481 = sub_DD744( v473,  v474,  v475,  v476,  v477,  v478,  v479,  v480,  v613,  v676,  v738,  v799,  v859,  v918,  v976,  v1033,  v1089,  v1144,  v1198,  v1251,  v1303,  v1354,  v1404,  v1453,  v1501,  v1548,  v1594,  v1639,  v1683,  v1726,  v1768,  v1809,  v1849,  v1888,  v1926,  v1963,  v1999,  v2034,  v2068,  v2101,  v2133,  v2164,  v2194,  v2223,  v2251,  v2278,  v2304,  v2329,  v2353,
             v2376,
             v2398,
             v2419,
             v2439,
             v2458,
             v2476,
             v2493,
             v2509,
             v2524,
             v2538,
             v2551,
             v2563,
             v2574,
             v2584);
    uint64_t v489 = sub_DD73C( v481,  v482,  v483,  v484,  v485,  v486,  v487,  v488,  v614,  v677,  v739,  v800,  v860,  v919,  v977,  v1034,  v1090,  v1145,  v1199,  v1252,  v1304,  v1355,  v1405,  v1454,  v1502,  v1549,  v1595,  v1640,  v1684,  v1727,  v1769,  v1810,  v1850,  v1889,  v1927,  v1964,  v2000,  v2035,  v2069,  v2102,  v2134,  v2165,  v2195,  v2224,  v2252,  v2279,  v2305,  v2330,  v2354,
             v2377,
             v2399,
             v2420,
             v2440,
             v2459,
             v2477,
             v2494,
             v2510,
             v2525,
             v2539,
             v2552,
             v2564,
             v2575,
             v2585);
    uint64_t v497 = sub_DD734( v489,  v490,  v491,  v492,  v493,  v494,  v495,  v496,  v615,  v678,  v740,  v801,  v861,  v920,  v978,  v1035,  v1091,  v1146,  v1200,  v1253,  v1305,  v1356,  v1406,  v1455,  v1503,  v1550,  v1596,  v1641,  v1685,  v1728,  v1770,  v1811,  v1851,  v1890,  v1928,  v1965,  v2001,  v2036,  v2070,  v2103,  v2135,  v2166,  v2196,  v2225,  v2253,  v2280,  v2306,  v2331,  v2355,
             v2378,
             v2400,
             v2421,
             v2441,
             v2460,
             v2478,
             v2495,
             v2511,
             v2526,
             v2540,
             v2553,
             v2565,
             v2576,
             v2586);
    uint64_t v505 = sub_DD72C( v497,  v498,  v499,  v500,  v501,  v502,  v503,  v504,  v616,  v679,  v741,  v802,  v862,  v921,  v979,  v1036,  v1092,  v1147,  v1201,  v1254,  v1306,  v1357,  v1407,  v1456,  v1504,  v1551,  v1597,  v1642,  v1686,  v1729,  v1771,  v1812,  v1852,  v1891,  v1929,  v1966,  v2002,  v2037,  v2071,  v2104,  v2136,  v2167,  v2197,  v2226,  v2254,  v2281,  v2307,  v2332,  v2356,
             v2379,
             v2401,
             v2422,
             v2442,
             v2461,
             v2479,
             v2496,
             v2512,
             v2527,
             v2541,
             v2554,
             v2566,
             v2577,
             v2587);
    uint64_t v513 = sub_DD724( v505,  v506,  v507,  v508,  v509,  v510,  v511,  v512,  v617,  v680,  v742,  v803,  v863,  v922,  v980,  v1037,  v1093,  v1148,  v1202,  v1255,  v1307,  v1358,  v1408,  v1457,  v1505,  v1552,  v1598,  v1643,  v1687,  v1730,  v1772,  v1813,  v1853,  v1892,  v1930,  v1967,  v2003,  v2038,  v2072,  v2105,  v2137,  v2168,  v2198,  v2227,  v2255,  v2282,  v2308,  v2333,  v2357,
             v2380,
             v2402,
             v2423,
             v2443,
             v2462,
             v2480,
             v2497,
             v2513,
             v2528,
             v2542,
             v2555,
             v2567,
             v2578,
             v2588);
    uint64_t v521 = sub_DD71C( v513,  v514,  v515,  v516,  v517,  v518,  v519,  v520,  v618,  v681,  v743,  v804,  v864,  v923,  v981,  v1038,  v1094,  v1149,  v1203,  v1256,  v1308,  v1359,  v1409,  v1458,  v1506,  v1553,  v1599,  v1644,  v1688,  v1731,  v1773,  v1814,  v1854,  v1893,  v1931,  v1968,  v2004,  v2039,  v2073,  v2106,  v2138,  v2169,  v2199,  v2228,  v2256,  v2283,  v2309,  v2334,  v2358,
             v2381,
             v2403,
             v2424,
             v2444,
             v2463,
             v2481,
             v2498,
             v2514,
             v2529,
             v2543,
             v2556,
             v2568,
             v2579,
             v2589);
    uint64_t v529 = sub_DD714( v521,  v522,  v523,  v524,  v525,  v526,  v527,  v528,  v619,  v682,  v744,  v805,  v865,  v924,  v982,  v1039,  v1095,  v1150,  v1204,  v1257,  v1309,  v1360,  v1410,  v1459,  v1507,  v1554,  v1600,  v1645,  v1689,  v1732,  v1774,  v1815,  v1855,  v1894,  v1932,  v1969,  v2005,  v2040,  v2074,  v2107,  v2139,  v2170,  v2200,  v2229,  v2257,  v2284,  v2310,  v2335,  v2359,
             v2382,
             v2404,
             v2425,
             v2445,
             v2464,
             v2482,
             v2499,
             v2515,
             v2530,
             v2544,
             v2557,
             v2569,
             v2580,
             v2590);
    sub_DD70C( v529,  v530,  v531,  v532,  v533,  v534,  v535,  v536,  v620,  v683,  v745,  v806,  v866,  v925,  v983,  v1040,  v1096,  v1151,  v1205,  v1258,  v1310,  v1361,  v1411,  v1460,  v1508,  v1555,  v1601,  v1646,  v1690,  v1733,  v1775,  v1816,  v1856,  v1895,  v1933,  v1970,  v2006,  v2041,  v2075,  v2108,  v2140,  v2171,  v2201,  v2230,  v2258,  v2285,  v2311,  v2336,  v2360,
      v2383,
      v2405,
      v2426,
      v2446,
      v2465,
      v2483,
      v2500,
      v2516,
      v2531,
      v2545,
      v2558,
      v2570,
      v2581,
      v2591);
    sub_DD704();
    sub_DD6FC();
    sub_DD6F4();
    sub_DD6EC();
    sub_DD6E4();
    sub_DD6DC();
    sub_DD6D4();
    sub_DD6CC();
    sub_DD6C4();
    sub_DD6BC();
    sub_DD6B4();
    sub_DD6AC();
    sub_DD6A4();
    sub_DD69C();
    sub_DD694();
    sub_DD68C();
    sub_DD684();
    sub_DD67C();
    sub_DD674();
    sub_DD66C();
    sub_DD664();
    sub_DD65C();
    sub_DD654();
    sub_DD64C();
    sub_DD644();
    sub_DD63C();
    sub_DD634();
    sub_DD62C();
    sub_DD624();
    sub_DD61C();
    sub_DD614();
    sub_DD60C();
    sub_DD604();
    sub_DD5FC();
    sub_DD5F4();
    sub_DD5EC();
    sub_DD5E4();
    sub_DD5DC();
    sub_DD5D4();
    sub_DD5CC();
    sub_DD5C4();
    sub_DD5BC();
    sub_DD5B4();
    sub_DD5AC();
    sub_DD5A4();
    sub_DD59C();
    sub_DD594();
    sub_DD58C();
    sub_DD584();
    sub_DD57C();
    sub_DD574();
    sub_DD56C();
    sub_DD564();
    sub_DD55C();
    sub_DD554();
    sub_DD54C();
    sub_DD544();
    sub_DD53C();
    sub_DD534();
    sub_DD52C();
    sub_DD524();
    sub_DD51C();
    sub_DD514();
    sub_DD50C();
    sub_DD504();
    sub_DD4FC();
    sub_DD4F4();
    sub_DD4EC();
    sub_DD4DC();
    sub_DD4E4();
    sub_DD868();
    sub_DD870();
    sub_36B88();
    sub_366E8();
    sub_3677C();
    sub_36588();
    sub_36624();
    sub_3661C();
    sub_36614();
    sub_3660C();
    sub_36604();
    sub_365FC();
    sub_365F4();
    sub_365EC();
    sub_365E4();
    sub_365DC();
    sub_366B8();
    sub_366B0();
    sub_366A8();
    sub_36814();
    uint64_t v537 = sub_DDBE4();
    __asm { BR              X0 }
  }

  uint64_t v538 = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 26392) + 32LL))( *(void *)(v0 + 26400),  *(void *)(v0 + 26520),  *(void *)(v0 + 26384));
  uint64_t v539 = _swiftEmptyArrayStorage;
  *(void *)(v0 + 25752) = _swiftEmptyArrayStorage;
  sub_DEE18( v538,  (SEL *)&selRef_matchingMeds,  (uint64_t (*)(void))&type metadata accessor for MatchedMedName);
  if (!v540) {
    uint64_t v540 = _swiftEmptyArrayStorage;
  }
  uint64_t v2593 = (uint64_t)v540;
  uint64_t v541 = sub_134B6C(v540);
  if (!v541)
  {
LABEL_23:
    *(void *)(v0 + 28288) = v539;
    uint64_t v552 = *(void **)(v0 + 28136);
    uint64_t v553 = *(void *)(v0 + 25976);
    swift_bridgeObjectRelease();
    sub_500C((void *)(v553 + 144), *(void *)(v553 + 168));
    sub_732B8();
    id v554 = v552;
    swift_bridgeObjectRetain(v539);
    uint64_t v555 = (void *)sub_DEA40();
    *(void *)(v0 + 28296) = v555;
    *uint64_t v555 = v0;
    v555[1] = sub_D29E0;
    uint64_t v556 = *(void *)(v0 + 25976);
    uint64_t v2600 = *(void *)(v0 + 28136);
    uint64_t v2601 = v556;
    sub_99194();
    sub_371E0();
    __asm { BR              X8 }
  }

  uint64_t v542 = v541;
  uint64_t result = type metadata accessor for WellnessMedicationDialogObject(0LL);
  if (v542 >= 1)
  {
    uint64_t v544 = *(void *)(v0 + 26392);
    BOOL v545 = sub_134BC0(v2593);
    uint64_t v546 = 0LL;
    do
    {
      if (v545) {
        id v547 = sub_DEEE4(v2593 + 8 * v546);
      }
      else {
        id v547 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v546, v2593);
      }
      uint64_t v548 = v547;
      uint64_t v549 = *(void *)(v0 + 26416);
      ++v546;
      (*(void (**)(uint64_t, void, void))(v544 + 16))( v549,  *(void *)(v0 + 26400),  *(void *)(v0 + 26384));
      id v550 = v548;
      sub_FAA40(v550, v549);
      sub_BFC30(v551);
    }

    while (v542 != v546);
    uint64_t v539 = *(void **)(v0 + 25752);
    goto LABEL_23;
  }

  __break(1u);
  return result;
}