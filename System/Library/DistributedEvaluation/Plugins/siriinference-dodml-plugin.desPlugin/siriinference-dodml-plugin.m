void sub_2984(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(unint64_t, uint64_t, uint64_t);
  Class isa;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  os_log_s *v54;
  os_log_type_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v68;
  Swift::Bool v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  BOOL v73;
  Swift::Int v74;
  unint64_t v75;
  char v76;
  Swift::Bool v77;
  unint64_t v78;
  char v79;
  uint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  BOOL v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  Class v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  void *v103;
  uint64_t v104;
  int64_t v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  int64_t v116;
  id v117;
  v3 = type metadata accessor for UUID(0LL);
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  sub_6950();
  v7 = v5 - v6;
  __chkstk_darwin();
  sub_6AC0();
  __chkstk_darwin();
  v9 = (char *)&v95 - v8;
  sub_583C(&qword_C6C0);
  sub_68C4();
  __chkstk_darwin();
  sub_6950();
  v12 = v10 - v11;
  __chkstk_darwin();
  sub_6A78();
  v114 = v13;
  v14 = type metadata accessor for Logger(0LL);
  v100 = *(void *)(v14 - 8);
  v101 = v14;
  sub_68C4();
  v15 = __chkstk_darwin();
  v17 = (char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Constants.subsystem.getter(v15);
  v112 = v17;
  sub_685C();
  Logger.init(subsystem:category:)();
  v18 = [a1 matchingRecordSet];
  v102 = a1;
  v19 = [a1 recipe];
  v20 = [v19 recipeUserInfo];

  v99 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v20,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  v21 = v12;
  sub_66BC( &qword_C6C8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  v23 = v22;
  v103 = (void *)Dictionary.init(dictionaryLiteral:)(&_swiftEmptyArrayStorage, v3, &type metadata for Data, v22);
  v113 = v18;
  v24 = v18;
  v25 = (uint64_t)v9;
  v26 = [v24 nativeRecordInfo];
  v27 = sub_583C(&qword_C618);
  v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v26, v3, v27, v23);

  v111 = 0LL;
  v104 = v28 + 64;
  v108 = v28;
  sub_675C();
  v32 = v31 & v30;
  v105 = (unint64_t)(v33 + 63) >> 6;
  v96 = v105 - 1;
  *(void *)&v34 = 136315138LL;
  v106 = v34;
  v109 = v21;
  v110 = v1;
  v107 = v4;
LABEL_2:
  v35 = v114;
  if (v32)
  {
LABEL_3:
    v115 = (v32 - 1) & v32;
    v116 = v29;
    v36 = __clz(__rbit64(v32)) | (v29 << 6);
LABEL_4:
    v37 = v108;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v4 + 16))( v21,  *(void *)(v108 + 48) + *(void *)(v4 + 72) * v36,  v3);
    v38 = *(void *)(v37 + 56);
    v39 = sub_6AE0();
    v40 = *(void *)(v38 + 8 * v36);
    *(void *)(v21 + *(int *)(v39 + 48)) = v40;
    sub_58CC(v21, 0LL, 1LL, v39);
    swift_bridgeObjectRetain(v40);
    goto LABEL_11;
  }

  while (1)
  {
    v41 = v29 + 1;
    if (__OFADD__(v29, 1LL))
    {
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
    }

    if (v41 >= v105)
    {
      v116 = v29;
    }

    else
    {
      if (*(void *)(v104 + 8 * v41)) {
        goto LABEL_8;
      }
      if (v29 + 2 >= v105) {
        goto LABEL_33;
      }
      if (*(void *)(v104 + 8 * (v29 + 2))) {
        goto LABEL_8;
      }
      if (v29 + 3 >= v105)
      {
        v116 = v29 + 2;
      }

      else
      {
        if (*(void *)(v104 + 8 * (v29 + 3))) {
          goto LABEL_8;
        }
        v62 = v29 + 4;
        if (v29 + 4 < v105)
        {
          if (*(void *)(v104 + 8 * v62))
          {
LABEL_8:
            sub_6A84();
            v115 = v43;
            v116 = v42;
            v36 = v44 + (v42 << 6);
            goto LABEL_4;
          }

          while (1)
          {
            v63 = v62 + 1;
            if (__OFADD__(v62, 1LL)) {
              goto LABEL_50;
            }
            if (v63 >= v105) {
              break;
            }
            ++v62;
            if (*(void *)(v104 + 8 * v63)) {
              goto LABEL_8;
            }
          }

          v41 = v96;
LABEL_33:
          v116 = v41;
          goto LABEL_10;
        }

        v116 = v29 + 3;
      }
    }

LABEL_10:
    v45 = sub_6AE0();
    sub_58CC(v21, 1LL, 1LL, v45);
    v115 = 0LL;
LABEL_11:
    sub_667C(v21, v35, &qword_C6C0);
    v46 = sub_6AE0();
    swift_bridgeObjectRelease(*(void *)(v35 + *(int *)(v46 + 48)));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v25, v35, v3);
    v47 = *(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16);
    sub_6A4C(v1);
    isa = UUID._bridgeToObjectiveC()().super.isa;
    v117 = 0LL;
    v49 = [v113 nativeRecordDataForRecordUUID:isa error:&v117];

    v50 = v117;
    if (v49)
    {
      v97 = v25;
      v98 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v49);
      v65 = v64;

      v66 = v103;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v103);
      v68 = v1;
      v69 = isUniquelyReferenced_nonNull_native;
      v117 = v66;
      v70 = sub_617C(v68);
      v72 = v66[2];
      v73 = (v71 & 1) == 0;
      v74 = v72 + v73;
      if (__OFADD__(v72, v73)) {
        goto LABEL_48;
      }
      v75 = v70;
      v76 = v71;
      sub_583C(&qword_C6D8);
      v77 = _NativeDictionary.ensureUnique(isUnique:capacity:)(v69, v74);
      v1 = v110;
      if (v77)
      {
        v78 = sub_617C(v110);
        if ((v76 & 1) != (v79 & 1))
        {
          KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v3);
          __break(1u);
          return;
        }

        v75 = v78;
      }

      v80 = v65;
      v81 = v117;
      v103 = v117;
      if ((v76 & 1) != 0)
      {
        v82 = *((void *)v117 + 7) + 16 * v75;
        sub_5928(*(void *)v82, *(void *)(v82 + 8));
        *(void *)v82 = v98;
        *(void *)(v82 + 8) = v80;
      }

      else
      {
        *((void *)v117 + (v75 >> 6) + 8) |= 1LL << v75;
        v47(v81[6] + *(void *)(v4 + 72) * v75, v1, v3);
        v83 = (uint64_t *)(v81[7] + 16 * v75);
        *v83 = v98;
        v83[1] = v80;
        v84 = v81[2];
        v85 = __OFADD__(v84, 1LL);
        v86 = v84 + 1;
        if (v85) {
          goto LABEL_49;
        }
        v81[2] = v86;
      }

      swift_bridgeObjectRelease(0x8000000000000000LL);
      sub_6854(v1);
      v25 = v97;
      sub_6854(v97);
      v21 = v109;
      v32 = v115;
      v29 = v116;
      goto LABEL_2;
    }

    v51 = v50;
    sub_6854(v1);
    v52 = _convertNSErrorToError(_:)(v51);

    swift_willThrow();
    v53 = sub_6A4C(v7);
    v54 = (os_log_s *)Logger.logObject.getter(v53);
    v55 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = swift_slowAlloc(12LL, -1LL);
      v57 = (void *)swift_slowAlloc(32LL, -1LL);
      v117 = v57;
      *(_DWORD *)v56 = v106;
      v58 = UUID.uuidString.getter();
      v60 = v59;
      *(void *)(v56 + 4) = sub_596C(v58, v59, (uint64_t *)&v117);
      swift_bridgeObjectRelease(v60);
      sub_6854(v7);
      _os_log_impl( &dword_0,  v54,  v55,  "failure retrieving native record data for %s; skipping from collection",
        (uint8_t *)v56,
        0xCu);
      swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
      v61 = (uint64_t)v57;
      v4 = v107;
      sub_66F8(v61);
      sub_66F8(v56);
    }

    else
    {
      sub_6854(v7);
    }

    swift_errorRelease(v52);

    sub_6854(v25);
    v111 = 0LL;
    v21 = v109;
    v1 = v110;
    v35 = v114;
    v32 = v115;
    v29 = v116;
    if (v115) {
      goto LABEL_3;
    }
  }

  swift_release(v108);
  v87 = v99;
  v88 = v103;
  v89 = v111;
  v90 = sub_325C(v99, (uint64_t)v103);
  if (v89)
  {
    swift_bridgeObjectRelease(v88);
    swift_bridgeObjectRelease(v87);
    v91 = (Class)_convertErrorToNSError(_:)(v89);
    [v102 completeWithError:v91 completionHandler:0];

    swift_errorRelease(v89);
  }

  else
  {
    v92 = v90;
    swift_bridgeObjectRelease(v88);
    swift_bridgeObjectRelease(v87);
    v91 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v92);
    [v102 completeWithJSONResult:v91 binaryResult:0 completionHandler:0];
  }

  v94 = v100;
  v93 = v101;

  (*(void (**)(char *, uint64_t))(v94 + 8))(v112, v93);
  sub_681C();
}

uint64_t sub_325C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  uint64_t v335 = a2;
  *(void *)&__int128 v319 = type metadata accessor for CustomSignalType(0LL);
  uint64_t v6 = *(void *)(v319 - 8);
  __chkstk_darwin();
  sub_6A98();
  sub_674C();
  __chkstk_darwin();
  sub_6A78();
  uint64_t v317 = v7;
  sub_583C(&qword_C630);
  sub_68C4();
  __chkstk_darwin();
  sub_6AAC();
  uint64_t v9 = sub_68F8(v8);
  uint64_t v330 = type metadata accessor for CustomSignal(v9);
  uint64_t v322 = *(void *)(v330 - 8);
  sub_68C4();
  __chkstk_darwin();
  sub_6AAC();
  uint64_t v11 = sub_68F8(v10);
  uint64_t v12 = type metadata accessor for UUID(v11);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  sub_6950();
  uint64_t v16 = v14 - v15;
  __chkstk_darwin();
  sub_68D0();
  sub_674C();
  __chkstk_darwin();
  sub_68D0();
  sub_674C();
  __chkstk_darwin();
  sub_68D0();
  sub_674C();
  __chkstk_darwin();
  sub_68D0();
  sub_674C();
  __chkstk_darwin();
  sub_68D0();
  sub_674C();
  __chkstk_darwin();
  sub_6A78();
  *(void *)&__int128 v329 = v17;
  sub_583C(&qword_C638);
  sub_68C4();
  __chkstk_darwin();
  sub_6A98();
  sub_674C();
  __chkstk_darwin();
  sub_68D0();
  sub_674C();
  __chkstk_darwin();
  sub_6AC0();
  __chkstk_darwin();
  sub_6A78();
  uint64_t v19 = sub_68F8(v18);
  uint64_t v314 = type metadata accessor for Logger(v19);
  uint64_t v313 = *(void *)(v314 - 8);
  sub_68C4();
  uint64_t v20 = __chkstk_darwin();
  v22 = (char *)&v294 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static Constants.subsystem.getter(v20);
  v337 = v22;
  sub_685C();
  Logger.init(subsystem:category:)();
  uint64_t v312 = a1;
  sub_4E84(1701667182LL, 0xE400000000000000LL, a1, &v346);
  uint64_t v336 = v12;
  if (!*((void *)&v347 + 1))
  {
    sub_6224((uint64_t)&v346, &qword_C640);
LABEL_10:
    uint64_t v327 = v16;
    uint64_t v331 = v2;
    uint64_t v330 = sub_583C(&qword_C618);
    uint64_t v25 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  v330,  &protocol witness table for String);
    sub_6910(v25, (uint64_t)v345);
    uint64_t v325 = v26;
    sub_675C();
    uint64_t v29 = v28 & v27;
    int64_t v328 = (unint64_t)(v30 + 63) >> 6;
    uint64_t v317 = v328 - 1;
    uint64_t v32 = swift_bridgeObjectRetain(v31);
    unint64_t v33 = 0LL;
    uint64_t v318 = v32 + 104;
    *(void *)&__int128 v34 = 136315138LL;
    __int128 v329 = v34;
    v323 = (char *)&type metadata for Any + 8;
    v321 = (void *)0x8000000000007430LL;
    __int128 v319 = xmmword_6FD0;
    uint64_t v35 = v320;
    uint64_t v36 = v334;
LABEL_11:
    uint64_t v37 = v332;
    if (v29)
    {
LABEL_12:
      sub_6AE8();
      uint64_t v339 = v29;
      unint64_t v338 = v38;
      unint64_t v40 = v39 | (v38 << 6);
LABEL_13:
      sub_68DC();
      sub_67C8(v37, v41, v42);
      v43 = (uint64_t *)(*(void *)(a1 + 56) + 16 * v40);
      uint64_t v44 = sub_6A28();
      v45 = (void *)(v37 + *(int *)(v44 + 48));
      uint64_t v46 = *v43;
      uint64_t v47 = v43[1];
      void *v45 = v46;
      v45[1] = v47;
      sub_6960(v37, v48, v49, v44);
      goto LABEL_20;
    }

    while (1)
    {
      if (__OFADD__(v33, 1LL))
      {
        __break(1u);
LABEL_177:
        __break(1u);
LABEL_178:
        __break(1u);
LABEL_179:
        __break(1u);
LABEL_180:
        __break(1u);
      }

      sub_67D8();
      if (v51 != v52)
      {
        sub_68B8();
        if (v54) {
          goto LABEL_18;
        }
        if (*(void *)(v325 + 8 * (v53 + 1))) {
          goto LABEL_18;
        }
        if ((uint64_t)(v53 + 2) >= v328)
        {
          unint64_t v338 = v53 + 1;
        }

        else
        {
          if (*(void *)(v325 + 8 * (v53 + 2))) {
            goto LABEL_18;
          }
          sub_67D8();
          if (v51 != v52)
          {
            sub_68B8();
            if (v109)
            {
LABEL_18:
              sub_6A84();
              uint64_t v339 = v55;
              unint64_t v40 = v57 + (v56 << 6);
              unint64_t v338 = v56;
              goto LABEL_13;
            }

            while (1)
            {
              sub_67D8();
              if (v51 == v52) {
                break;
              }
              if (*(void *)(v318 + 8 * v110)) {
                goto LABEL_18;
              }
            }

            unint64_t v53 = v317;
LABEL_53:
            unint64_t v338 = v53;
            goto LABEL_19;
          }

          unint64_t v338 = v108;
        }
      }

      else
      {
        unint64_t v338 = v50;
      }

LABEL_19:
      uint64_t v58 = sub_6A28();
      sub_6A6C(v37, v59, v60, v58);
      uint64_t v339 = 0LL;
LABEL_20:
      sub_667C(v37, v36, &qword_C638);
      uint64_t v61 = sub_6A28();
      if (sub_591C(v36, 1LL, v61) == 1)
      {
        sub_687C((uint64_t)&v351);
        sub_679C(&v346);
        if (*((void *)&v347 + 1))
        {
          sub_6948( (uint64_t)&v342,  (uint64_t)&v346,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Bool);
          sub_69D8();
          if ((_DWORD)v127 && (v342 & 1) != 0)
          {
            uint64_t v128 = swift_bridgeObjectRetain(v12);
            uint64_t v129 = sub_6980(v128);
            uint64_t v130 = v29;
            if (v29)
            {
              sub_6778();
              v131 = (void *)sub_6738();
              os_log_type_t v132 = static os_log_type_t.error.getter();
              if (sub_6938(v132))
              {
                v133 = (_WORD *)sub_6744(2LL);
                _WORD *v133 = 0;
                sub_6898( &dword_0,  v134,  v135,  "SiriInference dodml failed to convert and compress records when requested for some reason, returning as raw data");
                sub_66F8((uint64_t)v133);
              }

              sub_6908(v136, &qword_C618);
              uint64_t v138 = v137;
              sub_6778();
LABEL_170:
              swift_errorRelease(v130);
            }

            else
            {
              uint64_t v138 = v129;
              swift_bridgeObjectRelease_n(v12, 2LL);
            }

LABEL_173:
            (*(void (**)(char *, uint64_t))(v313 + 8))(v337, v314);
            return v138;
          }
        }

        else
        {
          sub_6224((uint64_t)&v346, &qword_C640);
          sub_69D8();
        }

        sub_6908(v127, &qword_C618);
        uint64_t v138 = v139;
        unint64_t v140 = v12;
LABEL_66:
        swift_bridgeObjectRelease(v140);
        goto LABEL_173;
      }

      v62 = (uint64_t *)(v36 + *(int *)(v61 + 48));
      uint64_t v63 = *v62;
      v64 = (void *)v62[1];
      sub_67C8(v35, v36, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
      v65 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      *(void *)&__int128 v346 = 0LL;
      a1 = (uint64_t)[v65 JSONObjectWithData:isa options:0 error:&v346];

      if (a1)
      {
        id v67 = (id)v346;
        _bridgeAnyObjectToAny(_:)(&v346, a1);
        swift_unknownObjectRelease(a1);
        if (!sub_6948((uint64_t)&v342, (uint64_t)&v346, (uint64_t)&type metadata for Any + 8, v330))
        {
          NSString v333 = v64;
          uint64_t v96 = v326;
          uint64_t v97 = sub_6A1C();
          sub_67C8(v97, v98, v99);
          v100 = (os_log_s *)sub_6738();
          os_log_type_t v101 = static os_log_type_t.debug.getter();
          if (sub_6788(v101))
          {
            uint64_t v102 = sub_6744(12LL);
            uint64_t v103 = sub_6744(32LL);
            uint64_t v104 = sub_67F4(v103);
            *(void *)(v102 + 4) = sub_688C(v104, v105);
            sub_67C0();
            a1 = *(void *)(v36 + 8);
            sub_6810(v96);
            sub_6884( &dword_0,  v100,  (os_log_type_t)v13,  "Couldn't decode data for %s into a record, skipping",  (uint8_t *)v102);
            sub_6928((uint64_t)&type metadata for Any);
            uint64_t v106 = v12;
            uint64_t v12 = v336;
            sub_66F8(v106);
            uint64_t v107 = v102;
            uint64_t v37 = v332;
            sub_66F8(v107);
            sub_6780(v63, (uint64_t)&v350);

            sub_67D0(v35);
          }

          else
          {
            sub_6780(v63, (uint64_t)&v350);
            sub_6854(v96);

            sub_6854(v35);
          }

          uint64_t v13 = v36;
          goto LABEL_38;
        }

        uint64_t v68 = v342;
        if (!*(void *)(v342 + 16) || (unint64_t v69 = sub_6118(0x79546C616E676973LL, 0xEA00000000006570LL), (v70 & 1) == 0))
        {
          __int128 v346 = 0u;
          __int128 v347 = 0u;
          sub_6224((uint64_t)&v346, &qword_C640);
          v111 = (os_log_s *)sub_6738();
          os_log_type_t v112 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v111, v112))
          {
            v113 = (_WORD *)sub_6744(2LL);
            _WORD *v113 = 0;
            sub_6998(&dword_0, v111, v112, "SiriInference dodML plugin ran succesfully");
            sub_66F8((uint64_t)v113);
          }

          uint64_t v114 = sub_60D4(24LL);
          uint64_t v115 = static Constants.subsystem.getter(v114);
          uint64_t v117 = v116;
          sub_67C0();
          *(void *)&__int128 v346 = v115;
          *((void *)&v346 + 1) = v117;
          v118._countAndFlagsBits = 0xD000000000000016LL;
          v118._object = v321;
          String.append(_:)(v118);
          NSString v333 = String._bridgeToObjectiveC()();
          sub_67C0();
          uint64_t v119 = sub_583C(&qword_C650);
          uint64_t inited = swift_initStackObject(v119, v344);
          *(_OWORD *)(inited + 16) = v319;
          *(void *)(inited + 32) = 0x656D6F6374756FLL;
          *(void *)(inited + 40) = 0xE700000000000000LL;
          sub_625C(0LL, &qword_C658, &OBJC_CLASS___NSString_ptr);
          *(void *)(inited + 48) = NSString.init(stringLiteral:)("success", 7LL, 2LL);
          uint64_t v121 = sub_625C(0LL, &qword_C660, &OBJC_CLASS___NSObject_ptr);
          Dictionary.init(dictionaryLiteral:)( inited,  &type metadata for String,  v121,  &protocol witness table for String);
          Class v122 = Dictionary._bridgeToObjectiveC()().super.isa;
          sub_6778();
          v123 = v333;
          AnalyticsSendEvent(v333, v122);

          uint64_t v124 = sub_69A4();
          uint64_t v12 = v125;
          char v126 = sub_6A10((uint64_t)v345);
          *(void *)&__int128 v346 = v122;
          a1 = (uint64_t)&v346;
          sub_629C(v68, v124, v12, v126, &qword_C6B0);
          uint64_t v322 = v346;
          sub_6778();
          sub_6A44();
          sub_68AC();
          sub_67E4(v35, *(uint64_t (**)(uint64_t, void))(v13 + 8));
          unint64_t v33 = v338;
          uint64_t v29 = v339;
          goto LABEL_11;
        }

        sub_61E8(*(void *)(v68 + 56) + 32 * v69, (uint64_t)&v346);
        swift_bridgeObjectRelease(v68);
        sub_6224((uint64_t)&v346, &qword_C640);
        uint64_t v71 = v324;
        sub_67C8(v324, v35, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
        v72 = (os_log_s *)sub_6738();
        os_log_type_t v73 = static os_log_type_t.debug.getter();
        if (sub_6788(v73))
        {
          uint64_t v74 = v71;
          uint64_t v75 = sub_6744(12LL);
          uint64_t v76 = sub_6744(32LL);
          uint64_t v77 = sub_67F4(v76);
          *(void *)(v75 + 4) = sub_688C(v77, v78);
          sub_67C0();
          a1 = *(void *)(v36 + 8);
          uint64_t v79 = v320;
          sub_6810(v74);
          sub_6884(&dword_0, v72, (os_log_type_t)v13, "Record %s looks like a CustomSignal, skipping", (uint8_t *)v75);
          sub_6928((uint64_t)&type metadata for Any);
          uint64_t v80 = v12;
          uint64_t v12 = v336;
          sub_66F8(v80);
          sub_66F8(v75);
          uint64_t v81 = sub_6A1C();
          uint64_t v35 = v79;
          sub_5928(v81, v82);

          uint64_t v83 = v79;
        }

        else
        {
          a1 = *(void *)(v36 + 8);
          sub_67D0(v71);
          sub_68AC();

          uint64_t v83 = v35;
        }

        sub_67D0(v83);
        uint64_t v13 = v36;
      }

      else
      {
        id v84 = (id)v346;
        uint64_t v85 = sub_6A04();

        uint64_t v331 = v85;
        swift_willThrow();
        uint64_t v86 = v35;
        uint64_t v87 = v327;
        sub_67C8(v327, v86, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
        v88 = (os_log_s *)sub_6738();
        os_log_type_t v89 = static os_log_type_t.error.getter();
        if (sub_6788(v89))
        {
          uint64_t v90 = sub_6744(12LL);
          uint64_t v91 = sub_6744(32LL);
          NSString v333 = v64;
          uint64_t v92 = v91;
          *(void *)&__int128 v346 = v91;
          *(_DWORD *)uint64_t v90 = v329;
          uint64_t v93 = sub_69A4();
          *(void *)(v90 + 4) = sub_688C(v93, v94);
          sub_67C0();
          a1 = *(void *)(v36 + 8);
          sub_6810(v87);
          sub_6884(&dword_0, v88, (os_log_type_t)v13, "Unable to decode record %s, skipping", (uint8_t *)v90);
          swift_arrayDestroy(v92, 1LL, v323);
          sub_66F8(v92);
          uint64_t v95 = v90;
          uint64_t v12 = v336;
          sub_66F8(v95);
          sub_6780(v63, (uint64_t)&v350);
          sub_69EC();

          sub_67D0(v86);
        }

        else
        {
          sub_68AC();
          sub_6854(v87);
          sub_69EC();

          sub_6854(v86);
        }

        uint64_t v331 = 0LL;
        uint64_t v13 = v36;
        uint64_t v35 = v86;
      }

      uint64_t v37 = v332;
LABEL_38:
      uint64_t v36 = v334;
      unint64_t v33 = v338;
      uint64_t v29 = v339;
      if (v339) {
        goto LABEL_12;
      }
    }
  }

  if ((sub_6948( (uint64_t)&v342,  (uint64_t)&v346,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for String) & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v23 = *((void *)&v342 + 1);
  if ((void)v342 != 0x536F747541736D73LL || *((void *)&v342 + 1) != 0xEB00000000646E65LL)
  {
    a1 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease(v23);
    if ((a1 & 1) != 0) {
      goto LABEL_68;
    }
    goto LABEL_10;
  }

  swift_bridgeObjectRelease(*((void *)&v342 + 1));
LABEL_68:
  uint64_t v320 = v6;
  uint64_t v141 = type metadata accessor for JSONDecoder(0LL);
  v142 = (__int128 *)swift_allocObject(v141, *(unsigned int *)(v141 + 48), *(unsigned __int16 *)(v141 + 52));
  uint64_t v332 = JSONDecoder.init()();
  uint64_t v143 = sub_583C(&qword_C668);
  uint64_t v144 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  v143,  &protocol witness table for String);
  sub_6910(v144, (uint64_t)&v329 + 8);
  uint64_t v311 = v145;
  sub_675C();
  unint64_t v148 = v147 & v146;
  unsigned int v316 = enum case for CustomSignalType.messagesAutoSend(_:);
  uint64_t v324 = (unint64_t)(v149 + 63) >> 6;
  uint64_t v299 = v324 - 1;
  uint64_t v151 = swift_bridgeObjectRetain(v150);
  uint64_t v152 = 0LL;
  uint64_t v300 = v151 + 104;
  *(void *)&__int128 v153 = 136315138LL;
  __int128 v315 = v153;
  v304 = (char *)&type metadata for Any + 8;
  v301 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v326 = v13;
  v323 = (char *)v3;
  while (1)
  {
    while (1)
    {
      if (v148)
      {
        unint64_t v154 = __clz(__rbit64(v148));
        uint64_t v155 = (v148 - 1) & v148;
        uint64_t v339 = v152;
        unint64_t v156 = v154 | (v152 << 6);
LABEL_71:
        sub_68DC();
        sub_67C8(v3, v157, v158);
        v159 = (uint64_t *)(*((void *)v142 + 7) + 16 * v156);
        uint64_t v160 = sub_583C(&qword_C648);
        v161 = (void *)(v3 + *(int *)(v160 + 48));
        uint64_t v162 = *v159;
        uint64_t v163 = v159[1];
        void *v161 = v162;
        v161[1] = v163;
        sub_6960(v3, v164, v165, v160);
        v142 = (__int128 *)v328;
        goto LABEL_78;
      }

      if (__OFADD__(v152, 1LL)) {
        goto LABEL_177;
      }
      sub_67D8();
      if (v51 != v52)
      {
        sub_68B8();
        v142 = (__int128 *)v328;
        if (v168) {
          goto LABEL_76;
        }
        if (v167 + 1 >= v324)
        {
LABEL_162:
          uint64_t v339 = v167;
          goto LABEL_77;
        }

        unint64_t v168 = *(void *)(v311 + 8 * (v167 + 1));
        if (v168)
        {
          ++v167;
LABEL_76:
          uint64_t v155 = (v168 - 1) & v168;
          unint64_t v156 = __clz(__rbit64(v168)) + (v167 << 6);
          uint64_t v339 = v167;
          goto LABEL_71;
        }

        if (v167 + 2 >= v324)
        {
          uint64_t v339 = v167 + 1;
        }

        else
        {
          unint64_t v168 = *(void *)(v311 + 8 * (v167 + 2));
          if (v168)
          {
            v167 += 2LL;
            goto LABEL_76;
          }

          sub_67D8();
          if (v51 != v52)
          {
            sub_68B8();
            if (!v168)
            {
              do
              {
                sub_67D8();
                if (v51 == v52)
                {
                  uint64_t v167 = v299;
                  goto LABEL_162;
                }

                unint64_t v168 = *(void *)(v227 + 8 * v228);
                uint64_t v229 = v228 + 1;
              }

              while (!v168);
              uint64_t v167 = v229 + 4;
            }

            goto LABEL_76;
          }

          uint64_t v339 = v226;
        }
      }

      else
      {
        uint64_t v339 = v166;
        v142 = (__int128 *)v328;
      }

LABEL_77:
      uint64_t v169 = sub_583C(&qword_C648);
      sub_6A6C(v3, v170, v171, v169);
      uint64_t v155 = 0LL;
LABEL_78:
      sub_667C(v3, (uint64_t)v142, &qword_C638);
      uint64_t v172 = sub_583C(&qword_C648);
      if (sub_591C((uint64_t)v142, 1LL, v172) == 1)
      {
        sub_687C((uint64_t)&v351);
        sub_679C(&v342);
        if (v343)
        {
          uint64_t v281 = sub_6948( (uint64_t)&v340,  (uint64_t)&v342,  (uint64_t)&type metadata for Any + 8,  (uint64_t)&type metadata for Bool);
          if ((_DWORD)v281 && (v340 & 1) != 0)
          {
            uint64_t v282 = swift_bridgeObjectRetain(v303);
            unint64_t v283 = sub_4ED4(v282);
            sub_6778();
            uint64_t v284 = sub_6980(v283);
            uint64_t v130 = v2;
            if (v2)
            {
              swift_bridgeObjectRelease(v283);
              v285 = (void *)sub_6738();
              os_log_type_t v286 = static os_log_type_t.error.getter();
              if (sub_6938(v286))
              {
                v287 = (_WORD *)sub_6744(2LL);
                _WORD *v287 = 0;
                sub_6898( &dword_0,  v288,  v289,  "SiriInference dodml failed to convert and compress records when requested for some reason, returning as raw data");
                sub_66F8((uint64_t)v287);
              }

              sub_6908(v290, &qword_C668);
              uint64_t v138 = v291;
              sub_6778();
              sub_687C((uint64_t)&v349);
              goto LABEL_170;
            }

            uint64_t v138 = v284;
            sub_6778();
            sub_687C((uint64_t)&v349);
            unint64_t v140 = v283;
            goto LABEL_66;
          }
        }

        else
        {
          sub_6224((uint64_t)&v342, &qword_C640);
        }

        sub_6908(v281, &qword_C668);
        uint64_t v138 = v292;
        sub_6778();
        sub_687C((uint64_t)&v349);
        goto LABEL_173;
      }

      unint64_t v338 = v155;
      v173 = (void **)((char *)v142 + *(int *)(v172 + 48));
      uint64_t v174 = v4;
      v175 = *v173;
      v176 = v173[1];
      uint64_t v177 = v329;
      sub_67C8(v329, (uint64_t)v142, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
      sub_66BC( &qword_C670,  (uint64_t (*)(uint64_t))&type metadata accessor for CustomSignal,  (uint64_t)&protocol conformance descriptor for CustomSignal);
      uint64_t v178 = v325;
      uint64_t v179 = v330;
      NSString v333 = v175;
      uint64_t v334 = (uint64_t)v176;
      v142 = (__int128 *)v332;
      uint64_t v2 = v174;
      dispatch thunk of JSONDecoder.decode<A>(_:from:)(v330, v175, v176, v330, v180);
      if (v174)
      {
        swift_errorRelease(v174);
        sub_6AD4(v178, 1LL);
        sub_6224(v178, &qword_C630);
        v181 = (__int128 *)v321;
        sub_67C8((uint64_t)v321, v177, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
        v182 = (os_log_s *)sub_6738();
        os_log_type_t v183 = static os_log_type_t.debug.getter();
        BOOL v184 = os_log_type_enabled(v182, v183);
        unint64_t v148 = v338;
        if (v184)
        {
          uint64_t v185 = sub_6744(12LL);
          uint64_t v186 = sub_6744(32LL);
          *(_DWORD *)uint64_t v185 = sub_6A30(v186).n128_u32[0];
          v142 = v181;
          uint64_t v187 = UUID.uuidString.getter();
          *(void *)(v185 + 4) = sub_69F8(v187, v188);
          sub_67C0();
          uint64_t v189 = sub_69C4();
          sub_6810(v189);
          sub_6884(&dword_0, v182, v183, "Unable to decode %s to CustomSignal, so not an SMS record", (uint8_t *)v185);
          swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
          uint64_t v190 = v13;
          uint64_t v13 = v326;
          sub_66F8(v190);
          sub_66F8(v185);
          sub_6724();

          sub_67D0(v177);
        }

        else
        {
          sub_6724();
          sub_6854((uint64_t)v181);

          sub_6854(v177);
        }

        uint64_t v4 = 0LL;
        goto LABEL_91;
      }

      uint64_t v331 = 0LL;
      sub_6AD4(v178, 0LL);
      uint64_t v191 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v322 + 32))(v327, v178, v179);
      uint64_t v192 = v317;
      CustomSignal.signalType.getter(v191);
      uint64_t v193 = v318;
      uint64_t v194 = v320;
      uint64_t v195 = v319;
      (*(void (**)(uint64_t, void, void))(v320 + 104))(v318, v316, v319);
      sub_66BC( &qword_C678,  (uint64_t (*)(uint64_t))&type metadata accessor for CustomSignalType,  (uint64_t)&protocol conformance descriptor for CustomSignalType);
      sub_69B8();
      sub_69B8();
      uint64_t v196 = v341;
      if ((void)v342 == v340 && *((void *)&v342 + 1) == v341) {
        break;
      }
      uint64_t v198 = v195;
      char v199 = _stringCompareWithSmolCheck(_:_:expecting:)();
      sub_67C0();
      swift_bridgeObjectRelease(v196);
      v142 = *(__int128 **)(v194 + 8);
      ((void (*)(uint64_t, uint64_t))v142)(v193, v198);
      ((void (*)(uint64_t, uint64_t))v142)(v192, v198);
      unint64_t v148 = v338;
      if ((v199 & 1) != 0) {
        goto LABEL_93;
      }
      v200 = v310;
      uint64_t v201 = v336;
      (*(void (**)(__int128 *, void, uint64_t))(v13 + 16))(v310, v329, v336);
      v202 = (os_log_s *)sub_6738();
      os_log_type_t v203 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v202, v203))
      {
        uint64_t v204 = sub_6744(12LL);
        uint64_t v205 = sub_6744(32LL);
        *(_DWORD *)uint64_t v204 = sub_6A30(v205).n128_u32[0];
        v142 = v200;
        uint64_t v206 = UUID.uuidString.getter();
        *(void *)(v204 + 4) = sub_69F8(v206, v207);
        sub_67C0();
        uint64_t v208 = sub_69C4();
        ((void (*)(uint64_t, uint64_t))v200)(v208, v201);
        sub_6884(&dword_0, v202, v203, "Record %s was not an SMS auto-send record, skipping", (uint8_t *)v204);
        swift_arrayDestroy(v13, 1LL, v304);
        uint64_t v209 = v13;
        uint64_t v13 = v326;
        sub_66F8(v209);
        sub_66F8(v204);
        sub_6724();
      }

      else
      {
        sub_6724();

        v219 = v200;
        v200 = *(__int128 **)(v13 + 8);
        ((void (*)(__int128 *, uint64_t))v200)(v219, v201);
      }

      sub_6704();
      uint64_t v210 = sub_6A1C();
      ((void (*)(uint64_t))v200)(v210);
      uint64_t v4 = v331;
LABEL_91:
      uint64_t v3 = (uint64_t)v323;
      uint64_t v152 = v339;
    }

    swift_bridgeObjectRelease_n(*((void *)&v342 + 1), 2LL);
    sub_67D0(v193);
    sub_67D0(v192);
    unint64_t v148 = v338;
LABEL_93:
    sub_625C(0LL, &qword_C680, &OBJC_CLASS___NSKeyedUnarchiver_ptr);
    uint64_t v211 = sub_625C(0LL, &qword_C658, &OBJC_CLASS___NSString_ptr);
    uint64_t v212 = sub_625C(0LL, &qword_C688, &OBJC_CLASS___NSNumber_ptr);
    uint64_t v213 = CustomSignal.item.getter();
    uint64_t v2 = v331;
    uint64_t v215 = static NSKeyedUnarchiver.unarchivedDictionary<A, B>(ofKeyClass:objectClass:from:)( v211,  v212,  v213,  v214,  v211,  v212);
    if (v2)
    {
      swift_errorRelease(v2);
      sub_69AC();
      uint64_t v331 = 0LL;
      uint64_t v3 = (uint64_t)v323;
      goto LABEL_96;
    }

    uint64_t v216 = v215;
    uint64_t v309 = v212;
    unint64_t v338 = v211;
    uint64_t v331 = 0LL;
    sub_69AC();
    uint64_t v3 = (uint64_t)v323;
    if (v216) {
      break;
    }
LABEL_96:
    v142 = (__int128 *)sub_6738();
    os_log_type_t v217 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v142, v217))
    {
      v218 = (_WORD *)sub_6744(2LL);
      _WORD *v218 = 0;
      sub_6998( &dword_0,  (os_log_s *)v142,  v217,  "SiriInference dodML plugin tried to decode smsAutoSend record but failed - skipping");
      sub_66F8((uint64_t)v218);
    }

    sub_6724();

    sub_6704();
    sub_67E4(v329, *(uint64_t (**)(uint64_t, void))(v13 + 8));
    uint64_t v4 = v331;
    uint64_t v152 = v339;
  }

  uint64_t v220 = Dictionary.init(dictionaryLiteral:)( &_swiftEmptyArrayStorage,  &type metadata for String,  &type metadata for Int,  &protocol witness table for String);
  if ((v216 & 0xC000000000000001LL) != 0)
  {
    if (v216 >= 0) {
      uint64_t v221 = v216 & 0xFFFFFFFFFFFFFF8LL;
    }
    else {
      uint64_t v221 = v216;
    }
    uint64_t v222 = __CocoaDictionary.makeIterator()(v221);
    uint64_t v298 = 0LL;
    uint64_t v2 = 0LL;
    uint64_t v223 = 0LL;
    unint64_t v224 = 0LL;
    unint64_t v225 = v222 | 0x8000000000000000LL;
  }

  else
  {
    sub_6610(v216, &v346);
    uint64_t v298 = *((void *)&v346 + 1);
    unint64_t v225 = v346;
    uint64_t v223 = *((void *)&v347 + 1);
    uint64_t v2 = v347;
    unint64_t v224 = v348;
  }

  unint64_t v230 = v338;
  uint64_t v294 = v2;
  uint64_t v231 = swift_bridgeObjectRetain(v216);
  uint64_t v296 = v225 & 0x7FFFFFFFFFFFFFFFLL;
  int64_t v297 = (unint64_t)(v2 + 64) >> 6;
  uint64_t v295 = v216;
  uint64_t v232 = v225;
  unint64_t v302 = v225;
  if ((v225 & 0x8000000000000000LL) == 0)
  {
LABEL_122:
    if (v224)
    {
      uint64_t v308 = (v224 - 1) & v224;
      unint64_t v233 = __clz(__rbit64(v224)) | (v223 << 6);
      uint64_t v234 = v223;
    }

    else
    {
      if (__OFADD__(v223, 1LL)) {
        goto LABEL_180;
      }
      sub_67D8();
      if (v51 == v52) {
        goto LABEL_161;
      }
      sub_68B8();
      uint64_t v234 = v247;
      if (v248) {
        goto LABEL_148;
      }
      uint64_t v234 = v247 + 1;
      sub_6834();
      if (v51 == v52) {
        goto LABEL_161;
      }
      sub_6844();
      if (v248) {
        goto LABEL_148;
      }
      uint64_t v234 = v249 + 2;
      sub_6834();
      if (v51 == v52) {
        goto LABEL_161;
      }
      sub_6844();
      if (v248) {
        goto LABEL_148;
      }
      uint64_t v234 = v250 + 3;
      sub_6834();
      if (v51 == v52) {
        goto LABEL_161;
      }
      sub_6844();
      if (v248) {
        goto LABEL_148;
      }
      uint64_t v234 = v251 + 4;
      sub_6834();
      if (v51 == v52) {
        goto LABEL_161;
      }
      sub_6844();
      if (v248) {
        goto LABEL_148;
      }
      uint64_t v234 = v252 + 5;
      if (v252 + 5 >= v297)
      {
LABEL_161:
        sub_6294(v302);
        swift_bridgeObjectRelease(v295);
        uint64_t v275 = v329;
        uint64_t v276 = sub_69A4();
        uint64_t v277 = v220;
        uint64_t v279 = v278;
        char v280 = sub_6A10((uint64_t)&v329 + 8);
        *(void *)&__int128 v342 = v216;
        v142 = &v342;
        sub_629C(v277, v276, v279, v280, &qword_C698);
        uint64_t v303 = v342;
        sub_6778();
        sub_6A44();
        sub_6724();
        sub_6704();
        sub_67E4(v275, *(uint64_t (**)(uint64_t, void))(v13 + 8));
        uint64_t v4 = v331;
        goto LABEL_91;
      }

      unint64_t v248 = *(void *)(v298 + 8 * v234);
      if (!v248)
      {
        do
        {
          sub_67D8();
          if (v51 == v52) {
            goto LABEL_161;
          }
          sub_68B8();
          uint64_t v254 = v253 + 1;
        }

        while (!v248);
        uint64_t v234 = v254 - 1;
      }

LABEL_148:
      uint64_t v308 = (v248 - 1) & v248;
      unint64_t v233 = __clz(__rbit64(v248)) + (v234 << 6);
    }

    v255 = *(void **)(*(void *)(v232 + 56) + 8 * v233);
    id v243 = *(id *)(*(void *)(v232 + 48) + 8 * v233);
    uint64_t v216 = v255;
    goto LABEL_150;
  }

  while (2)
  {
    uint64_t v216 = v296;
    uint64_t v235 = __CocoaDictionary.Iterator.next()(v231);
    if (!v235) {
      goto LABEL_161;
    }
    uint64_t v237 = v235;
    uint64_t v238 = v236;
    uint64_t v340 = v235;
    swift_unknownObjectRetain(v235, v236);
    unint64_t v239 = v224;
    uint64_t v240 = v223;
    uint64_t v241 = v220;
    v242 = v301;
    swift_dynamicCast(&v342, &v340, v301, v230, 7LL);
    id v243 = (id)v342;
    swift_unknownObjectRelease(v237);
    uint64_t v340 = v238;
    swift_unknownObjectRetain(v238, v244);
    v245 = v242;
    uint64_t v220 = v241;
    swift_dynamicCast(&v342, &v340, v245, v309, 7LL);
    uint64_t v246 = v238;
    uint64_t v216 = v342;
    swift_unknownObjectRelease(v246);
    uint64_t v234 = v240;
    uint64_t v308 = v239;
LABEL_150:
    if (!v243) {
      goto LABEL_161;
    }
    uint64_t v305 = v234;
    id v306 = v243;
    uint64_t v256 = static String._unconditionallyBridgeFromObjectiveC(_:)(v243);
    uint64_t v258 = v257;
    v259 = (void *)v216;
    id v307 = [(id)v216 integerValue];
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v220);
    *(void *)&__int128 v342 = v220;
    uint64_t v261 = v256;
    unint64_t v262 = sub_6118(v256, v258);
    uint64_t v264 = *(void *)(v220 + 16);
    BOOL v265 = (v263 & 1) == 0;
    Swift::Int v266 = v264 + v265;
    if (__OFADD__(v264, v265)) {
      goto LABEL_178;
    }
    unint64_t v267 = v262;
    char v268 = v263;
    sub_583C(&qword_C690);
    Swift::Bool v269 = _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v266);
    uint64_t v13 = v326;
    if (!v269)
    {
LABEL_155:
      uint64_t v220 = v342;
      if ((v268 & 1) != 0)
      {
        sub_6A58();
      }

      else
      {
        *(void *)(v342 + 8 * (v267 >> 6) + 64) |= 1LL << v267;
        v272 = (uint64_t *)(*(void *)(v220 + 48) + 16 * v267);
        uint64_t *v272 = v261;
        v272[1] = v258;
        sub_6A58();
        uint64_t v273 = *(void *)(v220 + 16);
        BOOL v52 = __OFADD__(v273, 1LL);
        uint64_t v274 = v273 + 1;
        if (v52) {
          goto LABEL_179;
        }
        *(void *)(v220 + 16) = v274;
        swift_bridgeObjectRetain(v258);
      }

      unint64_t v230 = v338;
      uint64_t v216 = v305;
      unint64_t v224 = v308;

      swift_bridgeObjectRelease(v258);
      uint64_t v231 = sub_6A44();
      uint64_t v223 = v216;
      uint64_t v232 = v302;
      if ((v302 & 0x8000000000000000LL) == 0) {
        goto LABEL_122;
      }
      continue;
    }

    break;
  }

  unint64_t v270 = sub_6118(v261, v258);
  if ((v268 & 1) == (v271 & 1))
  {
    unint64_t v267 = v270;
    goto LABEL_155;
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

double sub_4E84@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_6118(a1, a2), (v7 & 1) != 0))
  {
    sub_61E8(*(void *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }

  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }

  return result;
}

unint64_t sub_4ED4(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_583C(&qword_C6A0);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v38 = v1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 64);
  int64_t v37 = (unint64_t)(63 - v4) >> 6;
  unint64_t result = swift_bridgeObjectRetain(v1);
  int64_t v8 = 0LL;
  uint64_t v9 = (uint64_t *)&unk_C668;
  uint64_t v10 = (uint64_t *)&unk_C618;
  while (1)
  {
    while (1)
    {
      if (v6)
      {
        unint64_t v11 = __clz(__rbit64(v6));
        v6 &= v6 - 1;
        unint64_t v12 = v11 | (v8 << 6);
      }

      else
      {
        int64_t v13 = v8 + 1;
        if (__OFADD__(v8, 1LL)) {
          goto LABEL_34;
        }
        if (v13 >= v37)
        {
LABEL_31:
          sub_6294(v1);
          return (unint64_t)v3;
        }

        unint64_t v14 = *(void *)(v38 + 8 * v13);
        int64_t v15 = v8 + 1;
        if (!v14)
        {
          int64_t v15 = v8 + 2;
          if (v8 + 2 >= v37) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v38 + 8 * v15);
          if (!v14)
          {
            int64_t v15 = v8 + 3;
            if (v8 + 3 >= v37) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v38 + 8 * v15);
            if (!v14)
            {
              int64_t v15 = v8 + 4;
              if (v8 + 4 >= v37) {
                goto LABEL_31;
              }
              unint64_t v14 = *(void *)(v38 + 8 * v15);
              if (!v14)
              {
                int64_t v16 = v8 + 5;
                if (v8 + 5 >= v37) {
                  goto LABEL_31;
                }
                unint64_t v14 = *(void *)(v38 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    int64_t v15 = v16 + 1;
                    if (__OFADD__(v16, 1LL)) {
                      goto LABEL_35;
                    }
                    if (v15 >= v37) {
                      goto LABEL_31;
                    }
                    unint64_t v14 = *(void *)(v38 + 8 * v15);
                    ++v16;
                    if (v14) {
                      goto LABEL_25;
                    }
                  }
                }

                int64_t v15 = v8 + 5;
              }
            }
          }
        }

LABEL_25:
        unint64_t v6 = (v14 - 1) & v14;
        unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
        int64_t v8 = v15;
      }

      uint64_t v17 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v12);
      uint64_t v19 = *v17;
      uint64_t v18 = v17[1];
      uint64_t v40 = *(void *)(*(void *)(v1 + 56) + 8 * v12);
      uint64_t v20 = v40;
      swift_bridgeObjectRetain(v18);
      swift_bridgeObjectRetain(v20);
      uint64_t v21 = sub_583C(v9);
      uint64_t v22 = sub_583C(v10);
      swift_dynamicCast(&v41, &v40, v21, v22, 7LL);
      uint64_t v23 = v41;
      unint64_t result = sub_6118(v19, v18);
      unint64_t v24 = result;
      if ((v25 & 1) == 0) {
        break;
      }
      uint64_t v39 = v23;
      unint64_t v26 = v6;
      uint64_t v27 = v1;
      int64_t v28 = v8;
      uint64_t v29 = v10;
      uint64_t v30 = v9;
      uint64_t v31 = (uint64_t *)(v3[6] + 16 * result);
      swift_bridgeObjectRelease(v31[1]);
      *uint64_t v31 = v19;
      v31[1] = v18;
      uint64_t v9 = v30;
      uint64_t v10 = v29;
      int64_t v8 = v28;
      uint64_t v1 = v27;
      unint64_t v6 = v26;
      uint64_t v32 = v3[7];
      unint64_t result = swift_bridgeObjectRelease(*(void *)(v32 + 8 * v24));
      *(void *)(v32 + 8 * v24) = v39;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    unint64_t v33 = (uint64_t *)(v3[6] + 16 * result);
    *unint64_t v33 = v19;
    v33[1] = v18;
    *(void *)(v3[7] + 8 * result) = v23;
    uint64_t v34 = v3[2];
    BOOL v35 = __OFADD__(v34, 1LL);
    uint64_t v36 = v34 + 1;
    if (v35) {
      goto LABEL_33;
    }
    v3[2] = v36;
  }

  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_51E4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    sub_583C(&qword_C6A8);
    uint64_t v4 = (void *)static _DictionaryStorage.allocate(capacity:)(v3);
  }

  else
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v42 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1LL << -(char)v5);
  }
  else {
    uint64_t v6 = -1LL;
  }
  uint64_t v7 = v6 & *(void *)(v2 + 64);
  int64_t v41 = (unint64_t)(63 - v5) >> 6;
  int64_t v8 = &v48;
  uint64_t v9 = &v50;
  swift_bridgeObjectRetain(v2);
  int64_t v10 = 0LL;
  unint64_t v11 = (char *)&type metadata for Any + 8;
  while (1)
  {
    while (1)
    {
      if (v7)
      {
        sub_6AE8();
        unint64_t v13 = v12 | (v10 << 6);
      }

      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1LL)) {
          goto LABEL_38;
        }
        if (v14 >= v41)
        {
LABEL_35:
          sub_6294(v2);
          return;
        }

        unint64_t v15 = *(void *)(v42 + 8 * v14);
        int64_t v16 = v10 + 1;
        if (!v15)
        {
          sub_6B08();
          if (v17 == v18) {
            goto LABEL_35;
          }
          sub_6AFC();
          if (!v15)
          {
            sub_6B08();
            if (v17 == v18) {
              goto LABEL_35;
            }
            sub_6AFC();
            if (!v15)
            {
              sub_6B08();
              if (v17 == v18) {
                goto LABEL_35;
              }
              sub_6AFC();
              if (!v15)
              {
                int64_t v20 = v19 + 4;
                if (v20 >= v41) {
                  goto LABEL_35;
                }
                unint64_t v15 = *(void *)(v42 + 8 * v20);
                if (!v15)
                {
                  while (!__OFADD__(v20, 1LL))
                  {
                    sub_6B08();
                    if (v17 == v18) {
                      goto LABEL_35;
                    }
                    sub_6AFC();
                    int64_t v20 = v21 + 1;
                    if (v15) {
                      goto LABEL_29;
                    }
                  }

                  goto LABEL_39;
                }

                int64_t v16 = v20;
              }
            }
          }
        }

LABEL_29:
        uint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v16 << 6);
        int64_t v10 = v16;
      }

      uint64_t v22 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v13);
      uint64_t v23 = v22[1];
      uint64_t v24 = *(void *)(*(void *)(v2 + 56) + 8 * v13);
      uint64_t v46 = *v22;
      uint64_t v47 = v23;
      uint64_t v45 = v24;
      swift_bridgeObjectRetain(v23);
      swift_bridgeObjectRetain(v24);
      uint64_t v25 = sub_583C(a2);
      swift_dynamicCast(v8, &v45, v25, v11, 7LL);
      uint64_t v26 = v46;
      uint64_t v27 = v47;
      sub_6648(v8, v9);
      sub_6648(v9, v51);
      sub_6648(v51, &v49);
      unint64_t v28 = sub_6118(v26, v27);
      unint64_t v29 = v28;
      if ((v30 & 1) == 0) {
        break;
      }
      uint64_t v43 = v7;
      uint64_t v31 = v9;
      uint64_t v32 = v8;
      uint64_t v33 = v2;
      uint64_t v34 = v10;
      BOOL v35 = v11;
      uint64_t v36 = (uint64_t *)(v4[6] + 16 * v28);
      swift_bridgeObjectRelease(v36[1]);
      *uint64_t v36 = v26;
      v36[1] = v27;
      unint64_t v11 = v35;
      int64_t v10 = v34;
      uint64_t v2 = v33;
      int64_t v8 = v32;
      uint64_t v9 = v31;
      uint64_t v7 = v43;
      int64_t v37 = (void *)(v4[7] + 32 * v29);
      sub_6658(v37);
      sub_6648(&v49, v37);
    }

    if (v4[2] >= v4[3]) {
      break;
    }
    *(void *)((char *)v4 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << v28;
    uint64_t v38 = (uint64_t *)(v4[6] + 16 * v28);
    *uint64_t v38 = v26;
    v38[1] = v27;
    sub_6648(&v49, (_OWORD *)(v4[7] + 32 * v28));
    uint64_t v39 = v4[2];
    BOOL v18 = __OFADD__(v39, 1LL);
    uint64_t v40 = v39 + 1;
    if (v18) {
      goto LABEL_37;
    }
    v4[2] = v40;
  }

  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_5504(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    uint64_t v2 = sub_583C(&qword_C620);
    uint64_t inited = swift_initStackObject(v2, &v9);
    *(_OWORD *)(inited + 16) = xmmword_6FD0;
    *(void *)(inited + 32) = 0x73736572706D6F63LL;
    *(void *)(inited + 40) = 0xEA00000000006465LL;
    Class v4 = sub_5608();
    if (v1)
    {
      swift_bridgeObjectRelease(*(void *)(inited + 40));
      *(void *)(inited + 16) = 0LL;
      swift_setDeallocating(inited);
      return sub_587C();
    }

    *(void *)(inited + 72) = &type metadata for String;
    *(void *)(inited + 48) = v4;
    *(void *)(inited + 56) = v5;
    uint64_t v7 = (char *)&type metadata for Any + 8;
    int64_t v8 = (void *)inited;
  }

  else
  {
    uint64_t v7 = (char *)&type metadata for Any + 8;
    int64_t v8 = &_swiftEmptyArrayStorage;
  }

  return Dictionary.init(dictionaryLiteral:)(v8, &type metadata for String, v7, &protocol witness table for String);
}

Class sub_5608()
{
  v0 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  sub_583C(&qword_C618);
  v1.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  uint64_t v12 = 0LL;
  id v2 = [v0 dataWithJSONObject:v1.super.isa options:0 error:&v12];

  uint64_t v3 = v12;
  if (v2)
  {
    uint64_t v12 = 0LL;
    Class v4 = v3;
    id v5 = [v2 compressedDataUsingAlgorithm:3 error:&v12];
    v1.super.Class isa = v12;
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = v12;
      id v8 = [v6 base64EncodedStringWithOptions:0];
      v1.super.Class isa = (Class)static String._unconditionallyBridgeFromObjectiveC(_:)();
    }

    else
    {
      int64_t v10 = v12;
      _convertNSErrorToError(_:)(v1.super.isa);

      swift_willThrow();
    }
  }

  else
  {
    uint64_t v9 = v12;
    sub_6A04();

    swift_willThrow();
  }

  return v1.super.isa;
}

id sub_57A0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceDodMLPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_57EC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriInferenceDodMLPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriInferenceDodMLPlugin()
{
  return objc_opt_self(&OBJC_CLASS___SiriInferenceDodMLPlugin);
}

uint64_t sub_583C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_587C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = sub_583C(&qword_C628);
  swift_arrayDestroy(v0 + 32, v1, v2);
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t sub_58CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_58D8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_retain)();
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_591C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t sub_5928(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    ((void (*)(void))swift_release)();
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_596C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_5A3C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    id v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_61E8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_61E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_6658(v12);
  return v7;
}

void *sub_5A3C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_5B90((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
      uint64_t result = 0LL;
      *a1 = __dst;
      return result;
    }

    goto LABEL_11;
  }

  if ((a6 & 0x1000000000000000LL) != 0)
  {
LABEL_11:
    uint64_t result = sub_5C54(a5, a6);
    *a1 = v12;
    return result;
  }

  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }

  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
      __break(1u);
      return result;
    }
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

void *sub_5B90(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory with negative count",  60LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1170LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  2,  1173LL,  0);
  }

  __break(1u);
  return result;
}

void *sub_5C54(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_5CE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_5EBC(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_5EBC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_5CE8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    Swift::Int v4 = String.UTF8View._foreignCount()();
    if (v4) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }

  if ((a2 & 0x2000000000000000LL) != 0) {
    Swift::Int v4 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  id v5 = sub_5E58(v4, 0LL);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  71LL,  0);
    __break(1u);
    goto LABEL_14;
  }

  uint64_t v6 = v5;
  uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  2,  1122LL,  0);
LABEL_15:
  __break(1u);
  return result;
}

void *sub_5E58(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_583C(&qword_C6B8);
  id v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_5EBC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_583C(&qword_C6B8);
    unint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    unint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  unint64_t v13 = v11 + 32;
  int64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_6054(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_5F90(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_5F90(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000LL) != 0)
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst) {
      return memcpy(__dst, __src, __n);
    }
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

char *sub_6054(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000LL) != 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }

  return __src;
}

uint64_t sub_60D4(Swift::Int a1)
{
  if (a1 < 16) {
    return 0LL;
  }
  _StringGuts.grow(_:)(a1);
  return 0LL;
}

unint64_t sub_6118(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_63F0(a1, a2, v5);
}

unint64_t sub_617C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  sub_66BC( &qword_C6C8,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_64D0(a1, v7);
}

uint64_t sub_61E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_6224(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_583C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  sub_6990();
}

uint64_t sub_625C(uint64_t a1, unint64_t *a2, void *a3)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    uint64_t v5 = objc_opt_self(*a3);
    uint64_t result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_6294(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

void sub_629C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = (void **)v5;
  size_t v12 = (void *)*v5;
  unint64_t v13 = sub_6118(a2, a3);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v18 = v13;
  char v19 = v14;
  sub_583C(a5);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_6118(a2, a3);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return;
  }

  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v7;
  if ((v19 & 1) != 0)
  {
    uint64_t v23 = v22[7];
    swift_bridgeObjectRelease(*(void *)(v23 + 8 * v18));
    *(void *)(v23 + 8 * v18) = a1;
    sub_681C();
  }

  else
  {
    sub_63A8(v18, a2, a3, a1, v22);
    swift_bridgeObjectRetain(a3);
  }
}

unint64_t sub_63A8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1LL << result;
  uint64_t v5 = (void *)(a5[6] + 16 * result);
  *uint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1LL);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

unint64_t sub_63F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_64D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    unint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      sub_66BC( (unint64_t *)&unk_C6E0,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v18, v5, v14);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v15 & 1) != 0) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
    }

    while (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
  }

  return v10;
}

uint64_t sub_6610@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1LL;
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1LL << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0LL;
  a2[4] = v2 & v5;
  return result;
}

_OWORD *sub_6648(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_6658(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void sub_667C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_583C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  sub_6990();
}

void sub_66BC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  if (!*a1)
  {
    uint64_t v5 = a2(255LL);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }

  sub_6990();
}

uint64_t sub_66F8(uint64_t a1)
{
  return swift_slowDealloc(a1, -1LL, -1LL);
}

uint64_t sub_6704()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 408) + 8LL))( *(void *)(v0 - 368),  *(void *)(v0 - 328));
}

uint64_t sub_6724()
{
  return sub_5928(*(void *)(v0 - 304), *(void *)(v0 - 296));
}

uint64_t sub_6738()
{
  return Logger.logObject.getter();
}

uint64_t sub_6744(uint64_t a1)
{
  return swift_slowAlloc(a1, -1LL);
}

void sub_674C()
{
  *(void *)(v1 - 256) = v0;
}

  ;
}

uint64_t sub_6778()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_6780@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_5928(a1, *(void *)(a2 - 256));
}

BOOL sub_6788(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

double sub_679C@<D0>(_OWORD *a1@<X8>)
{
  return sub_4E84(0x73736572706D6F63LL, 0xEA00000000006465LL, *(void *)(v1 - 520), a1);
}

uint64_t sub_67C0()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_67C8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_67D0(uint64_t a1)
{
  return v1(a1, v2);
}

  ;
}

uint64_t sub_67E4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, void)@<X8>)
{
  return a2(a1, *(void *)(v2 - 280));
}

uint64_t sub_67F4(uint64_t a1)
{
  *(void *)(v2 - 144) = a1;
  *uint64_t v1 = *(_OWORD *)(v2 - 352);
  return UUID.uuidString.getter();
}

uint64_t sub_6810(uint64_t a1)
{
  return v1(a1, *(void *)(v2 - 280));
}

  ;
}

  ;
}

  ;
}

uint64_t sub_6854(uint64_t a1)
{
  return v1(a1, v2);
}

  ;
}

uint64_t sub_687C@<X0>(uint64_t a1@<X8>)
{
  return swift_release(*(void *)(a1 - 256));
}

void sub_6884(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_688C(uint64_t a1, unint64_t a2)
{
  return sub_596C(a1, a2, (uint64_t *)(v2 - 144));
}

void sub_6898(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
}

uint64_t sub_68AC()
{
  return sub_5928(v0, v1);
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_68F8@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0LL;
}

void sub_6908(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_6910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a2 - 256) = a1;
  return *(void *)(v2 - 288);
}

uint64_t sub_6928@<X0>(uint64_t a1@<X8>)
{
  return swift_arrayDestroy(v1, 1LL, a1 + 8);
}

BOOL sub_6938(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_6948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, a2, a3, a4, 6LL);
}

  ;
}

uint64_t sub_6960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_58D8(v4, v5);
}

uint64_t sub_6980(uint64_t a1)
{
  return sub_5504(a1);
}

  ;
}

void sub_6998(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_69A4()
{
  return UUID.uuidString.getter();
}

uint64_t sub_69AC()
{
  return sub_5928(v1, v0);
}

uint64_t sub_69B8()
{
  return dispatch thunk of RawRepresentable.rawValue.getter(v1, v0);
}

uint64_t sub_69C4()
{
  return v0;
}

  ;
}

uint64_t sub_69EC()
{
  return swift_errorRelease(*(void *)(v0 - 320));
}

uint64_t sub_69F8(uint64_t a1, unint64_t a2)
{
  return sub_596C(a1, a2, (uint64_t *)(v2 - 232));
}

uint64_t sub_6A04()
{
  return _convertNSErrorToError(_:)(v0);
}

uint64_t sub_6A10@<X0>(uint64_t a1@<X8>)
{
  return swift_isUniquelyReferenced_nonNull_native(*(void *)(a1 - 256));
}

uint64_t sub_6A1C()
{
  return v0;
}

uint64_t sub_6A28()
{
  return sub_583C(v0);
}

__n128 sub_6A30(uint64_t a1)
{
  *(void *)(v1 - 232) = a1;
  return *(__n128 *)(v1 - 496);
}

uint64_t sub_6A44()
{
  return swift_bridgeObjectRelease(0x8000000000000000LL);
}

uint64_t sub_6A4C(uint64_t a1)
{
  return v1(a1, v3, v2);
}

void sub_6A58()
{
  *(void *)(*(void *)(v1 + 56) + 8 * v0) = *(void *)(v2 - 568);
}

uint64_t sub_6A6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_58CC(a1, 1LL, 1LL, a4);
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_6AD4(uint64_t a1, uint64_t a2)
{
  return sub_58CC(a1, a2, 1LL, v2);
}

uint64_t sub_6AE0()
{
  return sub_583C(v0);
}

  ;
}

  ;
}

  ;
}