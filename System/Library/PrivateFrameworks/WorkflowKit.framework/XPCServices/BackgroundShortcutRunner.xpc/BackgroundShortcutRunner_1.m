uint64_t sub_1000367F8( uint64_t a1, Swift::Int64 a2, void *a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8, __int128 a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, uint64_t a14)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  Swift::String v26;
  Swift::String v27;
  uint64_t v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  Swift::String_optional v42;
  uint64_t v43;
  v42.value._object = a7;
  v43 = a8;
  v41 = a1;
  v42.value._countAndFlagsBits = a6;
  v39 = a10;
  v40 = a9;
  v37 = a12;
  v38 = a11;
  v36 = a13;
  v18 = type metadata accessor for Locale(0LL);
  v19 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v22 = [a3 locale];
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();

  v23 = Locale.identifier.getter();
  v25 = v24;
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  v35 = a14;
  v34 = v36;
  v33 = v37;
  v32 = v38;
  v31 = v39;
  v30 = v40;
  v26._countAndFlagsBits = v23;
  v26._object = v25;
  v27._countAndFlagsBits = a4;
  v27._object = a5;
  v28 = v43;
  ToolDatabase.Accessor.addToolLocalization(toolId:locale:name:outputResultName:descriptionSummary:descriptionAttribution:descriptionResult:descriptionNote:descriptionRequires:deprecationMessage:)( a2,  v26,  v27,  v42,  *(Swift::String_optional *)((char *)&v30 - 8),  *(Swift::String_optional *)((char *)&v31 - 8),  *(Swift::String_optional *)((char *)&v32 - 8),  *(Swift::String_optional *)((char *)&v33 - 8),  *(Swift::String_optional *)((char *)&v34 - 8),  *(Swift::String_optional *)(&v35 - 1));
  return swift_bridgeObjectRelease(v25);
}

uint64_t sub_100036960(uint64_t a1, uint64_t a2, Swift::Int64 a3)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain(a2);
    uint64_t v6 = 0LL;
    uint64_t v7 = v3 - 1;
    do
    {
      ToolDatabase.Accessor.addAdditionalAttributionContainer(toolId:containerId:)(a3, *(void *)(a2 + 8 * v6 + 32));
      if (v8) {
        break;
      }
    }

    while (v7 != v6++);
    return swift_bridgeObjectRelease(a2);
  }

  return result;
}

uint64_t sub_1000369E8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v16 = a3;
  uint64_t v5 = type metadata accessor for SystemToolProtocol(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = *a2;
  uint64_t v10 = *(void *)(*a2 + 16);
  if (v10)
  {
    unint64_t v11 = result + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v12 = *(void *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v15 = result;
    swift_bridgeObjectRetain(result);
    while (1)
    {
      v13(v8, v11, v5);
      ToolDatabase.Accessor.addSystemToolProtocol(toolId:systemToolProtocol:)(v16, v8);
      if (v3) {
        break;
      }
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      v11 += v12;
      if (!--v10) {
        return swift_bridgeObjectRelease(v15);
      }
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return swift_bridgeObjectRelease(v15);
  }

  return result;
}

uint64_t sub_100036B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v28 = a3;
  uint64_t v27 = a1;
  uint64_t v4 = type metadata accessor for TypeIdentifier(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v6);
  unint64_t v11 = (char *)&v24 - v10;
  uint64_t result = TypeInstance.typeIdentifiers.getter(v9);
  uint64_t v13 = result;
  int64_t v14 = 0LL;
  uint64_t v15 = *(void *)(result + 56);
  uint64_t v25 = result + 56;
  uint64_t v16 = 1LL << *(_BYTE *)(result + 32);
  uint64_t v17 = -1LL;
  if (v16 < 64) {
    uint64_t v17 = ~(-1LL << v16);
  }
  unint64_t v18 = v17 & v15;
  int64_t v26 = (unint64_t)(v16 + 63) >> 6;
  if ((v17 & v15) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v19 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  for (unint64_t i = v19 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v14 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))( v11,  *(void *)(v13 + 48) + *(void *)(v5 + 72) * i,  v4);
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v11, v4);
    ToolDatabase.Accessor.addToolOutputType(toolId:typeIdentifier:)(v28, v8);
    if (v3)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return swift_release(v13);
    }

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    if (v18) {
      goto LABEL_4;
    }
LABEL_5:
    if (__OFADD__(v14++, 1LL))
    {
      __break(1u);
      goto LABEL_26;
    }

    if (v14 >= v26) {
      return swift_release(v13);
    }
    unint64_t v22 = *(void *)(v25 + 8 * v14);
    if (!v22) {
      break;
    }
LABEL_15:
    unint64_t v18 = (v22 - 1) & v22;
  }

  int64_t v23 = v14 + 1;
  if (v14 + 1 >= v26) {
    return swift_release(v13);
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22) {
    goto LABEL_14;
  }
  int64_t v23 = v14 + 2;
  if (v14 + 2 >= v26) {
    return swift_release(v13);
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22) {
    goto LABEL_14;
  }
  int64_t v23 = v14 + 3;
  if (v14 + 3 >= v26) {
    return swift_release(v13);
  }
  unint64_t v22 = *(void *)(v25 + 8 * v23);
  if (v22)
  {
LABEL_14:
    int64_t v14 = v23;
    goto LABEL_15;
  }

  while (1)
  {
    int64_t v14 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v14 >= v26) {
      return swift_release(v13);
    }
    unint64_t v22 = *(void *)(v25 + 8 * v14);
    ++v23;
    if (v22) {
      goto LABEL_15;
    }
  }

uint64_t sub_100036D40(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = type metadata accessor for TypeIdentifier(0LL);
  __chkstk_darwin(v9);
  unint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *a3;
  uint64_t v13 = a3[1];
  (*(void (**)(char *, uint64_t))(v14 + 16))(v11, a4);
  uint64_t v15 = String.init(typeIdentifier:)(v11);
  uint64_t v17 = v16;
  uint64_t v18 = _s15ActionParameterVMa(0LL);
  ToolDatabase.Accessor.addParameter(toolId:key:typeId:typeInstance:sortOrder:relationships:flags:)( a2,  v12,  v13,  v15,  v17,  (char *)a3 + *(int *)(v18 + 32),  a5,  a3[3],  (char *)a3 + *(int *)(v18 + 36));
  return swift_bridgeObjectRelease(v17);
}

void sub_100036E44(int a1, Swift::Int64 toolId, Swift::String *a3, Swift::String_optional *a4)
{
}

void sub_100036E8C(uint64_t a1, Swift::Int64 a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = (void *)a3[1];
  uint64_t v7 = _s15ActionParameterVMa(0LL);
  v8.value._countAndFlagsBits = v5;
  v8.value._object = v6;
  ToolDatabase.Accessor.addSampleInvocations(toolId:parameterKey:sampleInvocations:)( a2,  v8,  *(Swift::OpaquePointer *)((char *)a3 + *(int *)(v7 + 40)));
}

void sub_100036EF0(int a1, id a2, Swift::Int64 a3)
{
  if (!a2) {
    return;
  }
  id v4 = [a2 backingActionIdentifiers];
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, &type metadata for String);

  uint64_t v6 = *(void *)(v5 + 16);
  if (!v6)
  {
    uint64_t v17 = v5;
    goto LABEL_12;
  }

  uint64_t v18 = v5;
  uint64_t v7 = (void *)(v5 + 40);
  while (1)
  {
    uint64_t v8 = *v7;
    swift_bridgeObjectRetain(*v7);
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v8);
    id v10 = (id)WFLinkActionIdentifierFromShortcutsActionIdentifier(v9);

    if (v10) {
      break;
    }
LABEL_7:
    v7 += 2;
    if (!--v6) {
      goto LABEL_11;
    }
  }

  id v11 = [v10 actionIdentifier];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  uint64_t v14 = v13;

  v15._countAndFlagsBits = v12;
  v15._object = v14;
  ToolDatabase.Accessor.addLinkActionIdentifier(toolId:identifier:)(a3, v15);
  if (!v16)
  {

    swift_bridgeObjectRelease(v14);
    goto LABEL_7;
  }

  swift_bridgeObjectRelease(v14);
LABEL_11:
  uint64_t v17 = v18;
LABEL_12:
  swift_bridgeObjectRelease(v17);
}

uint64_t sub_100037040(uint64_t a1, uint64_t a2, void *a3, Swift::Int64 a4)
{
  Swift::Int64 v131 = a4;
  id v124 = a3;
  uint64_t v127 = a1;
  uint64_t v5 = type metadata accessor for Logger(0LL);
  uint64_t v121 = *(void *)(v5 - 8);
  uint64_t v122 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v104 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  id v10 = (char *)&v104 - v9;
  uint64_t v130 = type metadata accessor for Locale(0LL);
  uint64_t v126 = *(void *)(v130 - 8);
  uint64_t v11 = __chkstk_darwin(v130);
  v117 = (char *)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v11);
  v125 = (char *)&v104 - v14;
  __chkstk_darwin(v13);
  v106 = (char *)&v104 - v15;
  uint64_t v16 = *(void *)((a2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a2);
  while (v16)
  {
    unint64_t v110 = a2 & 0xC000000000000001LL;
    uint64_t v107 = sub_10000E518(0LL, &qword_10006A478, &OBJC_CLASS___NSOrderedSet_ptr);
    uint64_t v17 = 0LL;
    uint64_t v105 = a2 + 32;
    uint64_t v120 = WFLogCategoryToolKitIndexing;
    v104 = &v134;
    *(void *)&__int128 v18 = 136315906LL;
    __int128 v116 = v18;
    v115 = (char *)&type metadata for Any + 8;
    v111 = v10;
    uint64_t v109 = a2;
    uint64_t v108 = v16;
    v114 = v8;
    while (1)
    {
      unint64_t v19 = v110;
      sub_100052278(v17, v110 == 0, a2);
      id v20 = v19 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17, a2) : *(id *)(v105 + 8 * v17);
      v21 = v20;
      BOOL v22 = __OFADD__(v17, 1LL);
      uint64_t v23 = v17 + 1;
      if (v22) {
        break;
      }
      uint64_t v113 = v23;
      id v24 = [v124 localizedCategoryWithContext:v20];
      v123 = v21;
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
        uint64_t v28 = v27;

        id v29 = [v21 locale];
        v30 = v106;
        static Locale._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v31 = Locale.identifier.getter();
        v33 = v32;
        v34 = *(void (**)(char *, uint64_t))(v126 + 8);
        v34(v30, v130);
        v35._countAndFlagsBits = v31;
        v35._object = v33;
        v36._countAndFlagsBits = v26;
        v36._object = v28;
        ToolDatabase.Accessor.addCategory(toolId:locale:category:)(v131, v35, v36);
        uint64_t v132 = v37;
        if (v37)
        {
          swift_bridgeObjectRelease(v33);
          static WFLog.subscript.getter(v120);
          id v38 = v124;
          id v39 = v21;
          swift_bridgeObjectRetain(v28);
          id v40 = v38;
          id v41 = v39;
          v42 = (os_log_s *)Logger.logObject.getter(v41);
          os_log_type_t v43 = static os_log_type_t.error.getter();
          int v44 = v43;
          if (os_log_type_enabled(v42, v43))
          {
            uint64_t v45 = swift_slowAlloc(42LL, -1LL);
            id v118 = v41;
            uint64_t v46 = v45;
            uint64_t v47 = swift_slowAlloc(96LL, -1LL);
            os_log_t v128 = v42;
            v129 = (void (*)(void, void))v47;
            uint64_t v135 = v47;
            *(_DWORD *)uint64_t v46 = v116;
            swift_bridgeObjectRetain(v28);
            uint64_t v133 = sub_100038098(v26, (unint64_t)v28, &v135);
            v48 = v104;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v104);
            swift_bridgeObjectRelease_n(v28, 3LL);
            *(_WORD *)(v46 + 12) = 2080;
            id v49 = [v40 identifier];
            v50 = v8;
            uint64_t v51 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
            LODWORD(v119) = v44;
            unint64_t v53 = v52;

            uint64_t v54 = v51;
            uint64_t v8 = v50;
            uint64_t v133 = sub_100038098(v54, v53, &v135);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v48);

            swift_bridgeObjectRelease(v53);
            *(_WORD *)(v46 + 22) = 2048;
            uint64_t v133 = v131;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v48);
            *(_WORD *)(v46 + 32) = 2080;
            id v55 = v118;
            id v56 = [v118 locale];
            v57 = v117;
            static Locale._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v58 = Locale.identifier.getter();
            unint64_t v60 = v59;
            v34(v57, v130);
            uint64_t v133 = sub_100038098(v58, v60, &v135);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v133, v48);

            swift_bridgeObjectRelease(v60);
            os_log_t v61 = v128;
            _os_log_impl( (void *)&_mh_execute_header,  v128,  (os_log_type_t)v119,  "Failed to index category %s for action: %s (%lld) in locale: %s",  (uint8_t *)v46,  0x2Au);
            v62 = v129;
            swift_arrayDestroy(v129, 3LL);
            swift_slowDealloc(v62, -1LL, -1LL);
            swift_slowDealloc(v46, -1LL, -1LL);
            swift_errorRelease(v132);

            (*(void (**)(char *, uint64_t))(v121 + 8))(v111, v122);
          }

          else
          {
            swift_errorRelease(v132);

            swift_bridgeObjectRelease_n(v28, 2LL);
            (*(void (**)(char *, uint64_t))(v121 + 8))(v10, v122);
          }

          uint64_t v63 = 0LL;
          v21 = v123;
          goto LABEL_16;
        }

        swift_bridgeObjectRelease(v33);
        swift_bridgeObjectRelease(v28);
      }

      uint64_t v63 = v132;
LABEL_16:
      id v64 = objc_msgSend(v124, "localizedKeywordsWithContext:", v21, v104);
      uint64_t v65 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v64, &type metadata for String);

      v66 = sub_100037A08(v65);
      swift_bridgeObjectRelease(v65);
      id v67 = sub_100037B2C((uint64_t)v66);
      v68 = sub_100013E0C(v67);
      uint64_t v132 = v63;

      os_log_t v128 = (os_log_t)v68[2];
      v112 = v68;
      if (v128)
      {
        v69 = 0LL;
        v70 = v68 + 5;
        do
        {
          uint64_t v71 = *(v70 - 1);
          v72 = (void *)*v70;
          swift_bridgeObjectRetain(*v70);
          id v73 = [v21 locale];
          v74 = v125;
          static Locale._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v75 = Locale.identifier.getter();
          v77 = v76;
          v129 = *(void (**)(void, void))(v126 + 8);
          v129(v74, v130);
          v78._countAndFlagsBits = v75;
          v78._object = v77;
          v79._countAndFlagsBits = v71;
          v79._object = v72;
          ToolDatabase.Accessor.addSearchKeyword(toolId:locale:keyword:order:)(v131, v78, v79, (Swift::Int)v69);
          uint64_t v132 = v80;
          if (v80)
          {
            swift_bridgeObjectRelease(v77);
            static WFLog.subscript.getter(v120);
            id v81 = v124;
            id v82 = v21;
            swift_bridgeObjectRetain(v72);
            id v83 = v81;
            v84 = v8;
            id v85 = v83;
            id v86 = v82;
            v87 = (os_log_s *)Logger.logObject.getter(v86);
            os_log_type_t v88 = static os_log_type_t.error.getter();
            int v89 = v88;
            if (os_log_type_enabled(v87, v88))
            {
              uint64_t v90 = swift_slowAlloc(42LL, -1LL);
              LODWORD(v118) = v89;
              uint64_t v91 = v90;
              uint64_t v119 = swift_slowAlloc(96LL, -1LL);
              uint64_t v135 = v119;
              *(_DWORD *)uint64_t v91 = v116;
              swift_bridgeObjectRetain(v72);
              *(void *)(v91 + 4) = sub_100038098(v71, (unint64_t)v72, &v135);
              swift_bridgeObjectRelease_n(v72, 3LL);
              *(_WORD *)(v91 + 12) = 2080;
              id v92 = [v85 identifier];
              uint64_t v93 = static String._unconditionallyBridgeFromObjectiveC(_:)(v92);
              unint64_t v95 = v94;

              *(void *)(v91 + 14) = sub_100038098(v93, v95, &v135);
              swift_bridgeObjectRelease(v95);
              *(_WORD *)(v91 + 22) = 2048;
              *(void *)(v91 + 24) = v131;
              *(_WORD *)(v91 + 32) = 2080;
              id v96 = [v86 locale];
              v97 = v117;
              static Locale._unconditionallyBridgeFromObjectiveC(_:)();

              uint64_t v98 = Locale.identifier.getter();
              unint64_t v100 = v99;
              v129(v97, v130);
              *(void *)(v91 + 34) = sub_100038098(v98, v100, &v135);

              swift_bridgeObjectRelease(v100);
              _os_log_impl( (void *)&_mh_execute_header,  v87,  (os_log_type_t)v118,  "Failed to index keyword %s for action: %s (%lld) in locale: %s",  (uint8_t *)v91,  0x2Au);
              uint64_t v101 = v119;
              swift_arrayDestroy(v119, 3LL);
              swift_slowDealloc(v101, -1LL, -1LL);
              swift_slowDealloc(v91, -1LL, -1LL);
              swift_errorRelease(v132);

              uint64_t v8 = v114;
              (*(void (**)(char *, uint64_t))(v121 + 8))(v114, v122);
              uint64_t v132 = 0LL;
            }

            else
            {
              swift_errorRelease(v132);

              swift_bridgeObjectRelease_n(v72, 2LL);
              (*(void (**)(char *, uint64_t))(v121 + 8))(v84, v122);
              uint64_t v132 = 0LL;
              uint64_t v8 = v84;
            }

            v21 = v123;
          }

          else
          {
            swift_bridgeObjectRelease(v77);
            swift_bridgeObjectRelease(v72);
          }

          v69 = (os_log_s *)((char *)v69 + 1);
          v70 += 2;
        }

        while (v128 != v69);
      }

      swift_bridgeObjectRelease(v112);
      uint64_t v17 = v113;
      a2 = v109;
      id v10 = v111;
      if (v113 == v108) {
        return swift_bridgeObjectRelease(a2);
      }
    }

    __break(1u);
LABEL_28:
    if (a2 < 0) {
      uint64_t v103 = a2;
    }
    else {
      uint64_t v103 = a2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a2);
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v103);
  }

  return swift_bridgeObjectRelease(a2);
}

void *sub_100037A08(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  v2 = _swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
    sub_1000523B4(0LL, v1, 0);
    v2 = _swiftEmptyArrayStorage;
    id v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *v4;
      v9[0] = *(v4 - 1);
      v9[1] = v5;
      swift_bridgeObjectRetain(v5);
      swift_dynamicCast(v10, v9, &type metadata for String, (char *)&type metadata for Any + 8, 7LL);
      if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
      {
        sub_1000523B4(0LL, v2[2] + 1LL, 1);
        v2 = v11;
      }

      unint64_t v7 = v2[2];
      unint64_t v6 = v2[3];
      if (v7 >= v6 >> 1)
      {
        sub_1000523B4((char *)(v6 > 1), v7 + 1, 1);
        v2 = v11;
      }

      v4 += 2;
      v2[2] = v7 + 1;
      sub_100009AC4(v10, &v2[4 * v7 + 4]);
      --v1;
    }

    while (v1);
  }

  return v2;
}

id sub_100037B2C(uint64_t a1)
{
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1));
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  id v5 = [v3 initWithArray:isa];

  return v5;
}

id sub_100037BA0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    NSString v4 = 0LL;
  }

  id v5 = [v2 initWithLanguageCode:v4];

  return v5;
}

id sub_100037C00(uint64_t a1, void *a2)
{
  id v3 = v2;
  Class isa = Locale._bridgeToObjectiveC()().super.isa;
  id v7 = [v3 initWithLocale:isa stringLocalizer:a2];

  uint64_t v8 = type metadata accessor for Locale(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8LL))(a1, v8);
  return v7;
}

uint64_t sub_100037C78(Swift::Int a1)
{
  if (a1 < 16) {
    return 0LL;
  }
  _StringGuts.grow(_:)(a1);
  return 0LL;
}

uint64_t sub_100037CBC(void (*a1)(uint64_t))
{
  uint64_t v2 = type metadata accessor for ToolVisibilityFlag(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  a1(v4);
  sub_100040370(&qword_10006A418, (uint64_t (*)(uint64_t))&type metadata accessor for ToolVisibilityFlag);
  uint64_t v8 = dispatch thunk of CustomStringConvertible.description.getter(v2, v7);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return v8;
}

uint64_t sub_100037D80(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t result = sub_100046B40();
  *uint64_t v3 = v4;
  if (!(_DWORD)result || v2 > *(void *)(v4 + 24) >> 1) {
    return a2();
  }
  return result;
}

void *sub_100037DEC(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_100046A50();
    uint64_t result = (void *)sub_100045688( (uint64_t)"Fatal error",  v3,  v4,  (uint64_t)"Can't construct Array with count < 0",  v5,  v6,  (uint64_t)"Swift/Array.swift");
    __break(1u);
  }

  else if (a1)
  {
    uint64_t result = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(a1, &type metadata for String);
    result[2] = a1;
  }

  else
  {
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void sub_100037E60(uint64_t a1)
{
  if (a1 < 0)
  {
    sub_100046A50();
    sub_100045688( (uint64_t)"Fatal error",  v5,  v6,  (uint64_t)"Can't construct Array with count < 0",  v7,  v8,  (uint64_t)"Swift/Array.swift");
    __break(1u);
  }

  else
  {
    sub_100046148();
    if (v3)
    {
      uint64_t v4 = v1(0LL);
      *(void *)(static Array._allocateBufferUninitialized(minimumCapacity:)(v2, v4) + 16) = v2;
    }

    v1(0LL);
    sub_100045544();
    sub_100046378();
  }

uint64_t sub_100037EF0(uint64_t (*a1)(void))
{
  uint64_t v1 = a1();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

void sub_100037F10()
{
  uint64_t v3 = sub_100046B40();
  *uint64_t v1 = v2;
  if (!(_DWORD)v3) {
    *uint64_t v1 = v0(v3, *(void *)(v2 + 16) + 1LL, 1LL, v2);
  }
  sub_10000F6AC();
}

uint64_t sub_100037F50(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24LL);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    uint64_t result = a2(v3 > 1);
    *(void *)uint64_t v2 = result;
  }

  return result;
}

void sub_100037F90(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  *(void *)(v5 + 16) = a1 + 1;
  uint64_t v6 = _s15ActionParameterVMa(0LL);
  sub_100041264( a2,  v5 + ((*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v6 - 8) + 80LL))
  + *(void *)(*(void *)(v6 - 8) + 72LL) * a1,
    _s15ActionParameterVMa);
}

uint64_t sub_100037FF8()
{
  *(void *)(*(void *)v0 + 16LL) = v1 + 1;
  uint64_t v4 = sub_100045FE4(v1, v2, v3);
  unint64_t v5 = sub_100044A80(v4);
  return sub_10004422C(v5, v6, v7, v8);
}

uint64_t sub_100038028(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_100038098(v6, v7, a3);
  uint64_t v10 = *a1 + 8;
  uint64_t v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_100038098(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100038168(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    unint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100009A44((uint64_t)v12, *a3);
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
      sub_100009A44((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100040830(v12);
  return v7;
}

void *sub_100038168(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000382BC((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = sub_100038380(a5, a6);
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
      uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL);
      __break(1u);
      return result;
    }
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return (void *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

void *sub_1000382BC(char *__src, size_t __n, char *__dst)
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

void *sub_100038380(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100038414(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_1000385E8(0LL, v2[2] + 1LL, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000385E8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100038414(uint64_t a1, unint64_t a2)
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
  unint64_t v5 = sub_100038584(v4, 0LL);
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
    uint64_t v9 = "Insufficient space allocated to copy string contents";
    uint64_t v10 = "Swift/StringUTF8View.swift";
    uint64_t v11 = 52LL;
    uint64_t v12 = 26LL;
    goto LABEL_15;
  }

  if (v7 == v4) {
    return v6;
  }
  uint64_t v9 = "invalid Collection: less than 'count' elements in collection";
  uint64_t v10 = "Swift/ContiguousArrayBuffer.swift";
  uint64_t v11 = 60LL;
  uint64_t v12 = 33LL;
LABEL_15:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11LL, 2LL, v9, v11, 2LL, v10, v12);
  __break(1u);
  return result;
}

void *sub_100038584(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_10000844C(&qword_10006A328);
  unint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_1000385E8(char *result, int64_t a2, char a3, uint64_t a4)
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
    uint64_t v10 = sub_10000844C(&qword_10006A328);
    uint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100038780(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_1000386BC(v14, v8, v13);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_1000386BC(char *__src, size_t __n, char *__dst)
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

char *sub_100038780(char *__src, size_t __len, char *__dst)
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

void sub_100038800(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  int64_t v7 = (void *)v6;
  uint64_t v8 = *a1 + 8;
  if (v6) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0LL;
  }
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  int64_t v9 = *a2;
  if (*a2)
  {
    *int64_t v9 = v7;
    *a2 = v9 + 1;
  }

  else
  {
  }

uint64_t sub_1000388B0(unint64_t a1, uint64_t a2)
{
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (*(void *)(a2 + 16) <= a1)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  uint64_t v12 = *(void *)((a2 & 0xFFFFFFFFFFFFF8LL) + 8 * a1 + 0x20);
  uint64_t v2 = v12;
  type metadata accessor for WFExecutionPlatform(0LL);
  uint64_t v4 = v3;
  swift_unknownObjectRetain_n(v12, 2LL);
  if (swift_dynamicCast(&v14, &v12, (char *)&type metadata for Swift.AnyObject + 8, v4, 6LL))
  {

    return v2;
  }

LABEL_7:
  uint64_t v12 = 0LL;
  unint64_t v13 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(82LL);
  v6._countAndFlagsBits = 0xD000000000000043LL;
  v6._object = (void *)0x800000010005A550LL;
  String.append(_:)(v6);
  v7._object = (void *)0x800000010005A670LL;
  v7._countAndFlagsBits = 0xD000000000000013LL;
  String.append(_:)(v7);
  v8._countAndFlagsBits = 0x756F662074756220LL;
  v8._object = (void *)0xEB0000000020646ELL;
  String.append(_:)(v8);
  uint64_t ObjectType = swift_getObjectType(v2);
  swift_unknownObjectRelease(v2);
  v10._countAndFlagsBits = _typeName(_:qualified:)(ObjectType, 0LL);
  object = v10._object;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(object);
  uint64_t result = _assertionFailure(_:_:flags:)("Fatal error", 11LL, 2LL, v12, v13, 0LL);
  __break(1u);
  return result;
}

  uint64_t v15 = 0LL;
  uint64_t v16 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(82LL);
  v11._object = (void *)0x800000010005A550LL;
  v11._countAndFlagsBits = 0xD000000000000043LL;
  String.append(_:)(v11);
  v12._countAndFlagsBits = sub_1000477EC();
  String.append(_:)(v12);
  sub_100047150(0x756F662074756220LL, 25710LL);
  uint64_t ObjectType = swift_getObjectType(v4);
  swift_unknownObjectRelease(v4);
  v14._countAndFlagsBits = sub_1000446C4(ObjectType);
  String.append(_:)(v14);
  sub_100042E4C();
  uint64_t result = _assertionFailure(_:_:flags:)("Fatal error", 11LL, 2LL, v15, v16, 0LL);
  __break(1u);
  return result;
}

uint64_t sub_100038A18(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v4 = a1;
  uint64_t v5 = sub_100045FE4(a1, a2, a3);
  uint64_t v6 = *(void *)(v5 - 8);
  sub_100046B98();
  __chkstk_darwin(v7);
  int64_t v9 = (char *)&v15 - v8;
  if ((v4 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (*(void *)(a2 + 16) <= v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  unint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFF8LL) + 8 * v4 + 0x20);
  unint64_t v15 = v4;
  swift_unknownObjectRetain_n(v4, 2LL);
  if (sub_100009C04((uint64_t)v9, (uint64_t)&v15, (uint64_t)&type metadata for Swift.AnyObject + 8, v5))
  {
    sub_100043F9C((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    return v4;
  }

uint64_t sub_100038B90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  uint64_t v7 = sub_100051B7C(a1, a2);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) == 0) {
    return 0LL;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v15 = *v3;
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  Swift::Int v11 = *(void *)(v10 + 24);
  sub_10000844C((uint64_t *)&unk_10006A500);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v11);
  swift_bridgeObjectRelease(*(void *)(*(void *)(v15 + 48) + 16 * v7 + 8));
  uint64_t v12 = *(void *)(*(void *)(v15 + 56) + 8 * v7);
  _NativeDictionary._delete(at:)( v7,  v15,  &type metadata for String,  &type metadata for Int64,  &protocol witness table for String);
  uint64_t v13 = *v3;
  *uint64_t v3 = v15;
  swift_bridgeObjectRelease(v13);
  return v12;
}

uint64_t sub_100038C9C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain(*v2);
  unint64_t v5 = sub_100051BE8(a1);
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease(v4);
  if ((a1 & 1) == 0) {
    return 0LL;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v16 = *v2;
  uint64_t v8 = *v2;
  void *v2 = 0x8000000000000000LL;
  Swift::Int v9 = *(void *)(v8 + 24);
  sub_10000844C(&qword_10006A510);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v9);
  uint64_t v10 = *(void *)(v16 + 48);
  uint64_t v11 = type metadata accessor for ToolKitIndexer.TypeRegistryKey(0LL);
  sub_100040FB8( v10 + *(void *)(*(void *)(v11 - 8) + 72LL) * v5,  type metadata accessor for ToolKitIndexer.TypeRegistryKey);
  uint64_t v12 = *(void *)(*(void *)(v16 + 56) + 16 * v5);
  sub_100040370(&qword_10006A518, type metadata accessor for ToolKitIndexer.TypeRegistryKey);
  _NativeDictionary._delete(at:)(v5, v16, v11, &type metadata for String, v13);
  uint64_t v14 = *v2;
  void *v2 = v16;
  swift_bridgeObjectRelease(v14);
  return v12;
}

uint64_t sub_100038DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  sub_100038ED0(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = *v3;
  *uint64_t v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_100038E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  uint64_t v10 = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  sub_100038FDC(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = *v3;
  *uint64_t v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

uint64_t sub_100038ED0(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  uint64_t v11 = sub_100051B7C(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }

  unint64_t v16 = v11;
  char v17 = v12;
  sub_10000844C((uint64_t *)&unk_10006A500);
  uint64_t result = _NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15);
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t result = sub_100051B7C(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
    return result;
  }

  unint64_t v16 = result;
LABEL_5:
  id v20 = *v5;
  if ((v17 & 1) != 0)
  {
    *(void *)(v20[7] + 8 * v16) = a1;
  }

  else
  {
    sub_10003912C(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain(a3);
  }

  return result;
}

void sub_100038FDC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v5 = (void **)v4;
  uint64_t v10 = type metadata accessor for ToolKitIndexer.TypeRegistryKey(0LL);
  __chkstk_darwin(v10);
  char v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = (void *)*v4;
  unint64_t v14 = sub_100051BE8(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v15 & 1) == 0;
  Swift::Int v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_10;
  }

  unint64_t v19 = v14;
  char v20 = v15;
  sub_10000844C(&qword_10006A510);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v18)) {
    goto LABEL_5;
  }
  unint64_t v21 = sub_100051BE8(a3);
  if ((v20 & 1) != (v22 & 1))
  {
LABEL_10:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v10);
    __break(1u);
    return;
  }

  unint64_t v19 = v21;
LABEL_5:
  uint64_t v23 = *v5;
  if ((v20 & 1) != 0)
  {
    id v24 = (uint64_t *)(v23[7] + 16 * v19);
    swift_bridgeObjectRelease(v24[1]);
    *id v24 = a1;
    v24[1] = a2;
  }

  else
  {
    sub_100041230(a3, (uint64_t)v12, type metadata accessor for ToolKitIndexer.TypeRegistryKey);
    sub_100039174(v19, (uint64_t)v12, a1, a2, v23);
  }

unint64_t sub_10003912C(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1LL << result;
  unint64_t v5 = (void *)(a5[6] + 16 * result);
  *unint64_t v5 = a2;
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

void sub_100039174(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v10 = a5[6];
  uint64_t v11 = type metadata accessor for ToolKitIndexer.TypeRegistryKey(0LL);
  sub_100041264( a2,  v10 + *(void *)(*(void *)(v11 - 8) + 72LL) * a1,  type metadata accessor for ToolKitIndexer.TypeRegistryKey);
  char v12 = (void *)(a5[7] + 16 * a1);
  *char v12 = a3;
  v12[1] = a4;
  uint64_t v13 = a5[2];
  BOOL v14 = __OFADD__(v13, 1LL);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a5[2] = v15;
  }
}

uint64_t sub_100039214(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }

  return result;
}

uint64_t sub_100039230(uint64_t result)
{
  if (!*(void *)(*(void *)v1 + 16LL)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = result + 56;
  uint64_t v4 = 1LL << *(_BYTE *)(result + 32);
  uint64_t v5 = -1LL;
  if (v4 < 64) {
    uint64_t v5 = ~(-1LL << v4);
  }
  unint64_t v6 = v5 & *(void *)(result + 56);
  int64_t v7 = (unint64_t)(v4 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(result);
  int64_t v8 = 0LL;
  if (!v6) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (unint64_t i = v9 | (v8 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v8 << 6))
  {
    BOOL v14 = (uint64_t *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    swift_bridgeObjectRetain(v16);
    sub_100039C84(v15, v16);
    uint64_t v18 = v17;
    swift_bridgeObjectRelease(v16);
    uint64_t result = swift_bridgeObjectRelease(v18);
    if (v6) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1LL))
    {
      __break(1u);
      goto LABEL_27;
    }

    if (v11 >= v7) {
      return swift_release(v2);
    }
    unint64_t v12 = *(void *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      int64_t v8 = v11 + 1;
      if (v11 + 1 >= v7) {
        return swift_release(v2);
      }
      unint64_t v12 = *(void *)(v3 + 8 * v8);
      if (!v12)
      {
        int64_t v8 = v11 + 2;
        if (v11 + 2 >= v7) {
          return swift_release(v2);
        }
        unint64_t v12 = *(void *)(v3 + 8 * v8);
        if (!v12)
        {
          int64_t v8 = v11 + 3;
          if (v11 + 3 >= v7) {
            return swift_release(v2);
          }
          unint64_t v12 = *(void *)(v3 + 8 * v8);
          if (!v12) {
            break;
          }
        }
      }
    }

LABEL_27:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_1000393C8(uint64_t a1)
{
  uint64_t v3 = sub_10000844C(&qword_10006A3A0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for RuntimePlatform(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = __chkstk_darwin(v8);
  int64_t v13 = (char *)&v25 - v12;
  if (!*(void *)(*(void *)v1 + 16LL)) {
    return result;
  }
  uint64_t v14 = *(void *)(a1 + 56);
  uint64_t v26 = a1 + 56;
  uint64_t v15 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v16 = -1LL;
  if (v15 < 64) {
    uint64_t v16 = ~(-1LL << v15);
  }
  unint64_t v17 = v16 & v14;
  int64_t v18 = (unint64_t)(v15 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v19 = 0LL;
  if (!v17) {
    goto LABEL_6;
  }
LABEL_5:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (unint64_t i = v20 | (v19 << 6); ; unint64_t i = __clz(__rbit64(v23)) + (v19 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))( v13,  *(void *)(a1 + 48) + *(void *)(v7 + 72) * i,  v6);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v13, v6);
    sub_100039E10((uint64_t)v10, (uint64_t)v5);
    sub_100041358((uint64_t)v5, &qword_10006A3A0);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    if (v17) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v22 = v19 + 1;
    if (__OFADD__(v19, 1LL))
    {
      __break(1u);
      goto LABEL_27;
    }

    if (v22 >= v18) {
      return swift_release(a1);
    }
    unint64_t v23 = *(void *)(v26 + 8 * v22);
    ++v19;
    if (!v23)
    {
      int64_t v19 = v22 + 1;
      if (v22 + 1 >= v18) {
        return swift_release(a1);
      }
      unint64_t v23 = *(void *)(v26 + 8 * v19);
      if (!v23)
      {
        int64_t v19 = v22 + 2;
        if (v22 + 2 >= v18) {
          return swift_release(a1);
        }
        unint64_t v23 = *(void *)(v26 + 8 * v19);
        if (!v23)
        {
          int64_t v19 = v22 + 3;
          if (v22 + 3 >= v18) {
            return swift_release(a1);
          }
          unint64_t v23 = *(void *)(v26 + 8 * v19);
          if (!v23) {
            break;
          }
        }
      }
    }

Swift::Int sub_100039630(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  sub_10000844C(&qword_100069E18);
  uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
  uint64_t v22 = v4;
  uint64_t v5 = __CocoaSet.makeIterator()(a1);
  uint64_t v6 = __CocoaSet.Iterator.next()();
  if (!v6)
  {
LABEL_16:
    swift_release(v5);
    return v4;
  }

  uint64_t v7 = v6;
  uint64_t v8 = sub_10000E518(0LL, &qword_100069E08, &OBJC_CLASS___WFAction_ptr);
  while (1)
  {
    uint64_t v20 = v7;
    swift_dynamicCast(&v21, &v20, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
    uint64_t v4 = v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      sub_10003A328();
      uint64_t v4 = v22;
    }

    uint64_t v9 = v21;
    Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
    uint64_t v11 = v4 + 56;
    uint64_t v12 = -1LL << *(_BYTE *)(v4 + 32);
    unint64_t v13 = result & ~v12;
    unint64_t v14 = v13 >> 6;
    if (((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6))) == 0) {
      break;
    }
    unint64_t v15 = __clz(__rbit64((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_15:
    *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = v9;
    ++*(void *)(v4 + 16);
    uint64_t v7 = __CocoaSet.Iterator.next()();
    if (!v7) {
      goto LABEL_16;
    }
  }

  char v16 = 0;
  unint64_t v17 = (unint64_t)(63 - v12) >> 6;
  while (++v14 != v17 || (v16 & 1) == 0)
  {
    BOOL v18 = v14 == v17;
    if (v14 == v17) {
      unint64_t v14 = 0LL;
    }
    v16 |= v18;
    uint64_t v19 = *(void *)(v11 + 8 * v14);
    if (v19 != -1)
    {
      unint64_t v15 = __clz(__rbit64(~v19)) + (v14 << 6);
      goto LABEL_15;
    }
  }

  __break(1u);
  return result;
}

unint64_t *sub_100039814(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (*(void *)(a2 + 16))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v41 = a1 + 56;
    uint64_t v5 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v39 = ~v5;
    if (-v5 < 64) {
      uint64_t v6 = ~(-1LL << -(char)v5);
    }
    else {
      uint64_t v6 = -1LL;
    }
    unint64_t v7 = v6 & v4;
    int64_t v40 = (unint64_t)(63 - v5) >> 6;
    uint64_t v8 = a2 + 56;
    swift_bridgeObjectRetain(a1);
    int64_t v9 = 0LL;
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v10 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v11 = v10 | (v9 << 6);
    while (1)
    {
      char v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
      uint64_t v18 = *v16;
      uint64_t v17 = v16[1];
      Hasher.init(_seed:)(v42, *(void *)(v2 + 40));
      swift_bridgeObjectRetain(v17);
      String.hash(into:)(v42, v18, v17);
      Swift::Int v19 = Hasher._finalize()();
      uint64_t v20 = -1LL << *(_BYTE *)(v2 + 32);
      unint64_t v21 = v19 & ~v20;
      if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v21) & 1) != 0) {
        break;
      }
LABEL_37:
      swift_bridgeObjectRelease(v17);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v12 = v9 + 1;
      if (__OFADD__(v9, 1LL))
      {
        __break(1u);
        goto LABEL_50;
      }

      if (v12 >= v40) {
        goto LABEL_48;
      }
      unint64_t v13 = *(void *)(v41 + 8 * v12);
      int64_t v14 = v9 + 1;
      if (!v13)
      {
        int64_t v14 = v9 + 2;
        if (v9 + 2 >= v40) {
          goto LABEL_48;
        }
        unint64_t v13 = *(void *)(v41 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v9 + 3;
          if (v9 + 3 >= v40) {
            goto LABEL_48;
          }
          unint64_t v13 = *(void *)(v41 + 8 * v14);
          if (!v13)
          {
            int64_t v14 = v9 + 4;
            if (v9 + 4 >= v40) {
              goto LABEL_48;
            }
            unint64_t v13 = *(void *)(v41 + 8 * v14);
            if (!v13)
            {
              int64_t v15 = v9 + 5;
              if (v9 + 5 >= v40)
              {
LABEL_48:
                sub_10000E5A0(a1);
                return (unint64_t *)v2;
              }

              unint64_t v13 = *(void *)(v41 + 8 * v15);
              if (!v13)
              {
                while (1)
                {
                  int64_t v14 = v15 + 1;
                  if (__OFADD__(v15, 1LL)) {
                    break;
                  }
                  if (v14 >= v40) {
                    goto LABEL_48;
                  }
                  unint64_t v13 = *(void *)(v41 + 8 * v14);
                  ++v15;
                  if (v13) {
                    goto LABEL_22;
                  }
                }

LABEL_22:
      unint64_t v7 = (v13 - 1) & v13;
      unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
      int64_t v9 = v14;
    }

    uint64_t v22 = *(void *)(v2 + 48);
    unint64_t v23 = (void *)(v22 + 16 * v21);
    uint64_t v24 = v23[1];
    BOOL v25 = *v23 == v18 && v24 == v17;
    if (v25 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v23, v24, v18, v17, 0LL) & 1) != 0)
    {
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease(v17);
      uint64_t v43 = a1;
      uint64_t v44 = v41;
      uint64_t v45 = v39;
      int64_t v46 = v9;
      unint64_t v47 = v7;
    }

    else
    {
      uint64_t v26 = ~v20;
      do
      {
        unint64_t v21 = (v21 + 1) & v26;
        if (((*(void *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v21) & 1) == 0) {
          goto LABEL_37;
        }
        uint64_t v27 = (void *)(v22 + 16 * v21);
        uint64_t v28 = v27[1];
        BOOL v29 = *v27 == v18 && v28 == v17;
      }

      while (!v29 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v27, v28, v18, v17, 0LL) & 1) == 0);
      uint64_t v43 = a1;
      uint64_t v44 = v41;
      uint64_t v45 = v39;
      int64_t v46 = v9;
      unint64_t v47 = v7;
      uint64_t isStackAllocationSafe = swift_bridgeObjectRelease(v17);
    }

    char v31 = *(_BYTE *)(v2 + 32);
    unsigned int v32 = v31 & 0x3F;
    unint64_t v33 = (1LL << v31) + 63;
    uint64_t v34 = v33 >> 6;
    size_t v35 = 8 * (v33 >> 6);
    if (v32 < 0xE
      || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v33 >> 6), 8LL), (_DWORD)isStackAllocationSafe))
    {
      __chkstk_darwin(isStackAllocationSafe);
      memcpy((char *)&v39 - ((v35 + 15) & 0x3FFFFFFFFFFFFFF0LL), (const void *)(v2 + 56), v35);
      Swift::String v36 = sub_10003A82C((unint64_t *)((char *)&v39 - ((v35 + 15) & 0x3FFFFFFFFFFFFFF0LL)), v34, v2, v21, &v43);
      swift_release(v2);
      sub_10000E5A0(v43);
    }

    else
    {
      uint64_t v37 = (void *)swift_slowAlloc(v35, -1LL);
      memcpy(v37, (const void *)(v2 + 56), v35);
      Swift::String v36 = sub_10003A82C((unint64_t *)v37, v34, v2, v21, &v43);
      swift_release(v2);
      sub_10000E5A0(v43);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    return v36;
  }

  else
  {
    swift_release(a2);
    return (unint64_t *)&_swiftEmptySetSingleton;
  }

  unint64_t v23 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  uint64_t v24 = (uint64_t *)(*(void *)(v23 + 48) + 16 * a3);
  *uint64_t v24 = v8;
  v24[1] = a2;
  BOOL v25 = *(void *)(v23 + 16);
  uint64_t v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (v26) {
    __break(1u);
  }
  else {
    *(void *)(v23 + 16) = v27;
  }
  return result;
}

uint64_t sub_100039C84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)(v22, *(void *)(*v2 + 40LL));
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v22, a1, a2);
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1LL << *(_BYTE *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  uint64_t v9 = *(void *)(v5 + 48);
  unint64_t v10 = (void *)(v9 + 16 * v8);
  uint64_t v11 = v10[1];
  BOOL v12 = *v10 == a1 && v11 == a2;
  if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
  {
    uint64_t v17 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v17;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      uint64_t v18 = (void *)(v9 + 16 * v8);
      uint64_t v19 = v18[1];
      BOOL v20 = *v18 == a1 && v19 == a2;
    }

    while (!v20 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v18, v19, a1, a2, 0LL) & 1) == 0);
  }

  swift_bridgeObjectRelease(v5);
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  uint64_t v14 = *v2;
  v22[0] = *v2;
  void *v2 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10003AB04();
    uint64_t v14 = v22[0];
  }

  uint64_t v15 = *(void *)(*(void *)(v14 + 48) + 16 * v8);
  sub_10003B7BC(v8);
  uint64_t v16 = *v2;
  void *v2 = v22[0];
  swift_bridgeObjectRelease(v16);
  return v15;
}

uint64_t sub_100039E10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for RuntimePlatform(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v3;
  uint64_t v11 = *(void *)(*v3 + 40);
  sub_100040370(&qword_10006A498, v12);
  uint64_t v14 = v13;
  swift_bridgeObjectRetain(v10);
  uint64_t v34 = a1;
  uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v14);
  uint64_t v16 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v17 = v15 & ~v16;
  if (((*(void *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) != 0)
  {
    char v31 = v3;
    uint64_t v32 = a2;
    uint64_t v18 = ~v16;
    uint64_t v19 = *(void *)(v7 + 72);
    uint64_t v33 = v7;
    BOOL v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    while (1)
    {
      v20(v9, *(void *)(v10 + 48) + v19 * v17, v6);
      sub_100040370(&qword_10006A4A0, (uint64_t (*)(uint64_t))&type metadata accessor for RuntimePlatform);
      char v22 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v34, v6, v21);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v9, v6);
      if ((v22 & 1) != 0) {
        break;
      }
      unint64_t v17 = (v17 + 1) & v18;
      if (((*(void *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) == 0)
      {
        swift_bridgeObjectRelease(v10);
        uint64_t v23 = 1LL;
        a2 = v32;
        return sub_10000848C(a2, v23, 1LL, v6);
      }
    }

    swift_bridgeObjectRelease(v10);
    uint64_t v24 = v31;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v31);
    uint64_t v26 = *v24;
    uint64_t v35 = *v24;
    *uint64_t v24 = 0x8000000000000000LL;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_10003AE5C();
      uint64_t v26 = v35;
    }

    unint64_t v27 = *(void *)(v26 + 48) + v19 * v17;
    a2 = v32;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v33 + 32))(v32, v27, v6);
    sub_10003B974(v17);
    uint64_t v28 = *v24;
    *uint64_t v24 = v35;
    swift_bridgeObjectRelease(v28);
    uint64_t v23 = 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v10);
    uint64_t v23 = 1LL;
  }

  return sub_10000848C(a2, v23, 1LL, v6);
}

Swift::Int sub_10003A050(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000844C(&qword_10006A2F0);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v32 = v2;
    uint64_t v33 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v13 = 0LL;
    if (!v9) {
      goto LABEL_10;
    }
LABEL_9:
    unint64_t v14 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      uint64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v20, v21);
      Swift::Int result = Hasher._finalize()();
      uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) == 0)
      {
        char v26 = 0;
        unint64_t v27 = (unint64_t)(63 - v22) >> 6;
        while (++v24 != v27 || (v26 & 1) == 0)
        {
          BOOL v28 = v24 == v27;
          if (v24 == v27) {
            unint64_t v24 = 0LL;
          }
          v26 |= v28;
          uint64_t v29 = *(void *)(v11 + 8 * v24);
          if (v29 != -1)
          {
            unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
            goto LABEL_33;
          }
        }

        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }

      unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
      *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
      uint64_t v30 = (void *)(*(void *)(v6 + 48) + 16 * v25);
      void *v30 = v20;
      v30[1] = v21;
      ++*(void *)(v6 + 16);
      if (v9) {
        goto LABEL_9;
      }
LABEL_10:
      int64_t v16 = v13 + 1;
      if (__OFADD__(v13, 1LL)) {
        goto LABEL_41;
      }
      if (v16 >= v10) {
        goto LABEL_35;
      }
      unint64_t v17 = v33[v16];
      ++v13;
      if (!v17)
      {
        int64_t v13 = v16 + 1;
        if (v16 + 1 >= v10) {
          goto LABEL_35;
        }
        unint64_t v17 = v33[v13];
        if (!v17)
        {
          int64_t v13 = v16 + 2;
          if (v16 + 2 >= v10) {
            goto LABEL_35;
          }
          unint64_t v17 = v33[v13];
          if (!v17)
          {
            int64_t v18 = v16 + 3;
            if (v18 >= v10)
            {
LABEL_35:
              swift_release(v3);
              uint64_t v2 = v32;
              uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
              if (v31 > 63) {
                sub_100039214(0LL, (unint64_t)(v31 + 63) >> 6, v33);
              }
              else {
                void *v33 = -1LL << v31;
              }
              *(void *)(v3 + 16) = 0LL;
              break;
            }

            unint64_t v17 = v33[v18];
            if (!v17)
            {
              while (1)
              {
                int64_t v13 = v18 + 1;
                if (__OFADD__(v18, 1LL)) {
                  goto LABEL_42;
                }
                if (v13 >= v10) {
                  goto LABEL_35;
                }
                unint64_t v17 = v33[v13];
                ++v18;
                if (v17) {
                  goto LABEL_23;
                }
              }
            }

            int64_t v13 = v18;
          }
        }
      }

void sub_10003A328()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_10000844C(&qword_100069E18);
  uint64_t v3 = sub_100046AF4(v2);
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    unint64_t v25 = v0;
    uint64_t v5 = 1LL << *(_BYTE *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1LL << v5);
    }
    else {
      uint64_t v7 = -1LL;
    }
    uint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    sub_100043D5C();
    int64_t v11 = 0LL;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    sub_100047100();
    for (unint64_t i = v12 | (v11 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      unint64_t v18 = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40)) & ~(-1LL << *(_BYTE *)(v4 + 32));
      if (((-1LL << v18) & ~*(void *)(v10 + 8 * (v18 >> 6))) == 0)
      {
        sub_1000458D8();
        while (++v21 != v22 || (v20 & 1) == 0)
        {
          BOOL v23 = v21 == v22;
          if (v21 == v22) {
            uint64_t v21 = 0LL;
          }
          v20 |= v23;
          if (*(void *)(v10 + 8 * v21) != -1LL)
          {
            sub_1000458B4();
            goto LABEL_30;
          }
        }

        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return;
      }

      sub_1000458F8();
LABEL_30:
      *(void *)(v10 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
      *(void *)(*(void *)(v4 + 48) + 8 * v19) = v17;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v11 + 1;
      if (__OFADD__(v11, 1LL)) {
        goto LABEL_38;
      }
      if (v14 >= v9) {
        goto LABEL_32;
      }
      unint64_t v15 = v6[v14];
      ++v11;
      if (!v15)
      {
        int64_t v11 = v14 + 1;
        if (v14 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v15 = v6[v11];
        if (!v15)
        {
          int64_t v11 = v14 + 2;
          if (v14 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v15 = v6[v11];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v9)
            {
LABEL_32:
              sub_100043678();
              uint64_t v1 = v25;
              uint64_t v24 = 1LL << *(_BYTE *)(v2 + 32);
              if (v24 > 63) {
                sub_100039214(0LL, (unint64_t)(v24 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *uint64_t v6 = -1LL << v24;
              }
              *(void *)(v2 + 16) = 0LL;
              break;
            }

            unint64_t v15 = v6[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v11 = v16 + 1;
                if (__OFADD__(v16, 1LL)) {
                  goto LABEL_39;
                }
                if (v11 >= v9) {
                  goto LABEL_32;
                }
                unint64_t v15 = v6[v11];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }

            int64_t v11 = v16;
          }
        }
      }

void sub_10003A578()
{
  uint64_t v50 = v1;
  uint64_t v51 = v2;
  uint64_t v4 = v3;
  uint64_t v5 = v0;
  uint64_t v8 = sub_10004697C(v6, v7);
  uint64_t v49 = *(void *)(v8 - 8);
  sub_100046B98();
  __chkstk_darwin(v9);
  int64_t v11 = (char *)&v45 - v10;
  uint64_t v12 = *v0;
  sub_10000844C(v4);
  uint64_t v13 = sub_100046AF4(v12);
  if (*(void *)(v12 + 16))
  {
    sub_100045550();
    v48 = (void *)(v12 + 56);
    sub_100047528();
    uint64_t v16 = v15 & v14;
    int64_t v46 = v0;
    int64_t v47 = (unint64_t)(v17 + 63) >> 6;
    uint64_t v18 = v13 + 56;
    sub_100044D54();
    int64_t v19 = 0LL;
    if (!v16) {
      goto LABEL_4;
    }
LABEL_3:
    sub_100046A80();
    v16 &= v20;
    for (int64_t i = v21 | (v19 << 6); ; int64_t i = v29 + (v19 << 6))
    {
      uint64_t v30 = v12;
      uint64_t v31 = *(void *)(v12 + 48);
      uint64_t v32 = *(void *)(v49 + 72);
      uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t))(v49 + 32);
      v33(v11, v31 + v32 * i, v8);
      sub_100047510();
      uint64_t v34 = sub_100046AC8();
      dispatch thunk of Hashable._rawHashValue(seed:)(v34, v8, v35);
      sub_1000474FC();
      if (((v38 << v37) & ~*(void *)(v18 + 8 * v36)) == 0)
      {
        sub_1000458D8();
        while (++v41 != v42 || (v40 & 1) == 0)
        {
          BOOL v43 = v41 == v42;
          if (v41 == v42) {
            uint64_t v41 = 0LL;
          }
          v40 |= v43;
          if (*(void *)(v18 + 8 * v41) != -1LL)
          {
            sub_1000458B4();
            goto LABEL_27;
          }
        }

        __break(1u);
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
        return;
      }

      sub_1000458F8();
LABEL_27:
      *(void *)(v18 + ((v39 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v39;
      v33((char *)(*(void *)(v13 + 48) + v39 * v32), (uint64_t)v11, v8);
      ++*(void *)(v13 + 16);
      uint64_t v12 = v30;
      if (v16) {
        goto LABEL_3;
      }
LABEL_4:
      if (__OFADD__(v19, 1LL)) {
        goto LABEL_35;
      }
      if (v19 + 1 >= v47) {
        goto LABEL_29;
      }
      sub_10004705C();
      int64_t v19 = v23;
      if (!v24)
      {
        int64_t v19 = v23 + 1;
        if (v23 + 1 >= v47) {
          goto LABEL_29;
        }
        if (!v48[v19])
        {
          int64_t v19 = v23 + 2;
          if (v23 + 2 >= v47) {
            goto LABEL_29;
          }
          if (!v48[v19])
          {
            if (v23 + 3 >= v47)
            {
LABEL_29:
              sub_100043DA4();
              uint64_t v5 = v46;
              uint64_t v44 = 1LL << *(_BYTE *)(v12 + 32);
              if (v44 > 63) {
                sub_100039214(0LL, (unint64_t)(v44 + 63) >> 6, v48);
              }
              else {
                void *v48 = -1LL << v44;
              }
              *(void *)(v12 + 16) = 0LL;
              break;
            }

            sub_10004705C();
            if (!v26)
            {
              while (1)
              {
                int64_t v19 = v25 + 1;
                if (__OFADD__(v25, 1LL)) {
                  goto LABEL_36;
                }
                if (v19 >= v47) {
                  goto LABEL_29;
                }
                ++v25;
                if (v48[v19]) {
                  goto LABEL_17;
                }
              }
            }

            int64_t v19 = v25;
          }
        }
      }

unint64_t *sub_10003A82C( unint64_t *result, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v7 = *(void *)(a3 + 16);
  char v40 = result;
  *(unint64_t *)((char *)result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << a4) - 1;
  uint64_t v8 = v7 - 1;
  uint64_t v42 = a3 + 56;
  while (2)
  {
    uint64_t v39 = v8;
    do
    {
      while (1)
      {
        int64_t v9 = a5[3];
        unint64_t v10 = a5[4];
        if (v10)
        {
          uint64_t v11 = (v10 - 1) & v10;
          unint64_t v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }

        else
        {
          int64_t v13 = v9 + 1;
          if (__OFADD__(v9, 1LL))
          {
            __break(1u);
            goto LABEL_46;
          }

          int64_t v14 = (unint64_t)(a5[2] + 64LL) >> 6;
          int64_t v15 = a5[3];
          if (v13 >= v14) {
            goto LABEL_44;
          }
          uint64_t v16 = a5[1];
          unint64_t v17 = *(void *)(v16 + 8 * v13);
          if (!v17)
          {
            int64_t v15 = v9 + 1;
            if (v9 + 2 >= v14) {
              goto LABEL_44;
            }
            unint64_t v17 = *(void *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              int64_t v13 = v9 + 2;
            }

            else
            {
              int64_t v15 = v9 + 2;
              if (v9 + 3 >= v14) {
                goto LABEL_44;
              }
              unint64_t v17 = *(void *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                int64_t v13 = v9 + 3;
              }

              else
              {
                int64_t v13 = v9 + 4;
                int64_t v15 = v9 + 3;
                if (v9 + 4 >= v14) {
                  goto LABEL_44;
                }
                unint64_t v17 = *(void *)(v16 + 8 * v13);
                if (!v17)
                {
                  int64_t v18 = v9 + 5;
                  while (v18 < v14)
                  {
                    unint64_t v17 = *(void *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      int64_t v13 = v18 - 1;
                      goto LABEL_20;
                    }
                  }

                  int64_t v15 = v14 - 1;
LABEL_44:
                  a5[3] = v15;
                  a5[4] = 0LL;
                  swift_retain(a3);
                  return (unint64_t *)sub_10000D9F8(v40, a2, v39, a3);
                }
              }
            }
          }

void *sub_10003AB04()
{
  uint64_t v1 = v0;
  sub_10000844C(&qword_10006A2F0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    Swift::Int result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1LL;
  if (v10 < 64) {
    uint64_t v12 = ~(-1LL << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = (void *)(*(void *)(v2 + 48) + 16 * i);
    uint64_t v21 = v20[1];
    Swift::Int v22 = (void *)(*(void *)(v4 + 48) + 16 * i);
    *Swift::Int v22 = *v20;
    v22[1] = v21;
    Swift::Int result = (void *)swift_bridgeObjectRetain(v21);
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }

id sub_10003ACB4()
{
  uint64_t v1 = v0;
  sub_10000844C(&qword_100069E18);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1LL;
  if (v10 < 64) {
    uint64_t v12 = ~(-1LL << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }

void sub_10003AE5C()
{
  uint64_t v2 = v1;
  uint64_t v3 = v0;
  uint64_t v5 = *(void *)(v4(0LL) - 8);
  sub_100046B98();
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v27 - v7;
  sub_10000844C(v2);
  int64_t v9 = (void *)*v0;
  uint64_t v10 = static _SetStorage.copy(original:)(*v0);
  if (!v9[2])
  {
    sub_100044EE8();
LABEL_30:
    *uint64_t v3 = v10;
    sub_1000436A4();
    return;
  }

  uint64_t v28 = v3;
  sub_100045550();
  uint64_t v12 = v9 + 7;
  unint64_t v14 = (unint64_t)(v13 + 63) >> 6;
  if ((void *)v10 != v9 || v11 >= &v9[v14 + 7]) {
    memmove(v11, v9 + 7, 8 * v14);
  }
  int64_t v16 = 0LL;
  *(void *)(v10 + 16) = v9[2];
  sub_100045550();
  uint64_t v18 = v9[7];
  uint64_t v19 = -1LL;
  if (v17 < 64) {
    uint64_t v19 = ~(-1LL << v17);
  }
  uint64_t v20 = v19 & v18;
  int64_t v21 = (unint64_t)(v17 + 63) >> 6;
  if ((v19 & v18) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  sub_100047100();
  int64_t v23 = v22 | (v16 << 6);
  while (1)
  {
    int64_t v26 = *(void *)(v5 + 72) * v23;
    sub_10004314C((uint64_t)v8, v9[6] + v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    sub_10004314C( *(void *)(v10 + 48) + v26,  (uint64_t)v8,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 32));
    if (v20) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v24 = v16 + 1;
    if (__OFADD__(v16, 1LL))
    {
      __break(1u);
      goto LABEL_32;
    }

    if (v24 >= v21) {
      goto LABEL_28;
    }
    ++v16;
    if (!v12[v24])
    {
      int64_t v16 = v24 + 1;
      if (v24 + 1 >= v21) {
        goto LABEL_28;
      }
      if (!v12[v16])
      {
        int64_t v16 = v24 + 2;
        if (v24 + 2 >= v21) {
          goto LABEL_28;
        }
        if (!v12[v16]) {
          break;
        }
      }
    }

LABEL_32:
  __break(1u);
}

Swift::Int sub_10003B030(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000844C(&qword_10006A2F0);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_37:
    uint64_t *v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  unint64_t v31 = v2;
  int64_t v32 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v13 = 0LL;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v14 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v13 << 6))
  {
    uint64_t v19 = (uint64_t *)(*(void *)(v3 + 48) + 16 * i);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v21);
    String.hash(into:)(v33, v20, v21);
    Swift::Int result = Hasher._finalize()();
    uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v11 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
    BOOL v30 = (void *)(*(void *)(v6 + 48) + 16 * v25);
    void *v30 = v20;
    v30[1] = v21;
    ++*(void *)(v6 + 16);
    if (v10) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v16 = v13 + 1;
    if (__OFADD__(v13, 1LL)) {
      goto LABEL_39;
    }
    if (v16 >= v32) {
      goto LABEL_35;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    ++v13;
    if (!v17)
    {
      int64_t v13 = v16 + 1;
      if (v16 + 1 >= v32) {
        goto LABEL_35;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v13);
      if (!v17)
      {
        int64_t v13 = v16 + 2;
        if (v16 + 2 >= v32) {
          goto LABEL_35;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v13);
        if (!v17) {
          break;
        }
      }
    }

Swift::Int sub_10003B2D8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_10000844C(&qword_100069E18);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_37:
    uint64_t *v2 = v6;
    return result;
  }

  BOOL v30 = v2;
  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v8 = v3 + 56;
  if (v7 < 64) {
    uint64_t v9 = ~(-1LL << v7);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v3 + 56);
  int64_t v11 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v12 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v14 = 0LL;
  if (!v10) {
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v15 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (unint64_t i = v15 | (v14 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v14 << 6))
  {
    Swift::Int v20 = *(void *)(v6 + 40);
    id v21 = *(id *)(*(void *)(v3 + 48) + 8 * i);
    Swift::Int result = NSObject._rawHashValue(seed:)(v20);
    uint64_t v22 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) == 0)
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        BOOL v28 = v24 == v27;
        if (v24 == v27) {
          unint64_t v24 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v24);
        if (v29 != -1)
        {
          unint64_t v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_33;
        }
      }

      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    unint64_t v25 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
LABEL_33:
    *(void *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v25;
    *(void *)(*(void *)(v6 + 48) + 8 * v25) = v21;
    ++*(void *)(v6 + 16);
    if (v10) {
      goto LABEL_9;
    }
LABEL_10:
    int64_t v17 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      goto LABEL_39;
    }
    if (v17 >= v11) {
      goto LABEL_35;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v14;
    if (!v18)
    {
      int64_t v14 = v17 + 1;
      if (v17 + 1 >= v11) {
        goto LABEL_35;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v14);
      if (!v18)
      {
        int64_t v14 = v17 + 2;
        if (v17 + 2 >= v11) {
          goto LABEL_35;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v14);
        if (!v18) {
          break;
        }
      }
    }

void sub_10003B54C()
{
  uint64_t v44 = v1;
  uint64_t v45 = v2;
  uint64_t v4 = v3;
  uint64_t v5 = v0;
  uint64_t v8 = sub_10004697C(v6, v7);
  uint64_t v9 = *(void *)(v8 - 8);
  sub_100046B98();
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v41 - v11;
  uint64_t v13 = *v0;
  sub_10000844C(v4);
  uint64_t v14 = static _SetStorage.resize(original:capacity:move:)(v13, v0, 0LL);
  if (!*(void *)(v13 + 16))
  {
    sub_1000434B8();
LABEL_33:
    *uint64_t v5 = v14;
    sub_1000436A4();
    return;
  }

  sub_100045550();
  uint64_t v41 = v5;
  uint64_t v42 = v13 + 56;
  sub_100047528();
  uint64_t v17 = v16 & v15;
  int64_t v43 = (unint64_t)(v18 + 63) >> 6;
  uint64_t v19 = v14 + 56;
  sub_100043FDC();
  int64_t v20 = 0LL;
  if (!v17) {
    goto LABEL_6;
  }
LABEL_5:
  sub_10004720C();
  for (int64_t i = v21 | (v20 << 6); ; int64_t i = v29 + (v20 << 6))
  {
    uint64_t v30 = *(void *)(v9 + 72);
    sub_1000442EC( (uint64_t)v12,  *(void *)(v13 + 48) + v30 * i,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
    sub_100047510();
    uint64_t v31 = sub_100046AC8();
    dispatch thunk of Hashable._rawHashValue(seed:)(v31, v8, v32);
    sub_1000474FC();
    if (((v35 << v34) & ~*(void *)(v19 + 8 * v33)) == 0)
    {
      sub_1000458D8();
      while (++v38 != v39 || (v37 & 1) == 0)
      {
        BOOL v40 = v38 == v39;
        if (v38 == v39) {
          uint64_t v38 = 0LL;
        }
        v37 |= v40;
        if (*(void *)(v19 + 8 * v38) != -1LL)
        {
          sub_1000458B4();
          goto LABEL_29;
        }
      }

      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }

    sub_1000458F8();
LABEL_29:
    *(void *)(v19 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v36;
    sub_1000442EC( *(void *)(v14 + 48) + v36 * v30,  (uint64_t)v12,  *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 32));
    ++*(void *)(v14 + 16);
    if (v17) {
      goto LABEL_5;
    }
LABEL_6:
    if (__OFADD__(v20, 1LL)) {
      goto LABEL_35;
    }
    if (v20 + 1 >= v43) {
      goto LABEL_31;
    }
    sub_10004705C();
    int64_t v20 = v23;
    if (!v24)
    {
      int64_t v20 = v23 + 1;
      if (v23 + 1 >= v43) {
        goto LABEL_31;
      }
      if (!*(void *)(v42 + 8 * v20))
      {
        int64_t v20 = v23 + 2;
        if (v23 + 2 >= v43) {
          goto LABEL_31;
        }
        if (!*(void *)(v42 + 8 * v20)) {
          break;
        }
      }
    }

unint64_t sub_10003B7BC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56LL;
  uint64_t v5 = -1LL << *(_BYTE *)(*v1 + 32LL);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain(*v1);
    uint64_t v8 = _HashTable.previousHole(before:)(v2, v4, v7);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        uint64_t v10 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v6);
        uint64_t v11 = *v10;
        uint64_t v12 = v10[1];
        Hasher.init(_seed:)(v24, *(void *)(v3 + 40));
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v24, v11, v12);
        Swift::Int v13 = Hasher._finalize()();
        swift_bridgeObjectRelease(v12);
        Swift::Int v14 = v13 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v14 >= v9 && v2 >= v14)
          {
LABEL_15:
            uint64_t v17 = *(void *)(v3 + 48);
            uint64_t v18 = (_OWORD *)(v17 + 16 * v2);
            uint64_t v19 = (_OWORD *)(v17 + 16 * v6);
            BOOL v20 = v2 != v6 || v18 >= v19 + 1;
            int64_t v2 = v6;
            if (v20)
            {
              *uint64_t v18 = *v19;
              int64_t v2 = v6;
            }
          }
        }

        else if (v14 >= v9 || v2 >= v14)
        {
          goto LABEL_15;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << v2) - 1;
    Swift::Int result = swift_release(v3);
  }

  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << result) - 1;
  }

  uint64_t v21 = *(void *)(v3 + 16);
  BOOL v22 = __OFSUB__(v21, 1LL);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v3 + 16) = v23;
    ++*(_DWORD *)(v3 + 36);
  }

  return result;
}

uint64_t sub_10003B974(int64_t a1)
{
  uint64_t v3 = type metadata accessor for RuntimePlatform(0LL);
  uint64_t v35 = *(void *)(v3 - 8);
  uint64_t result = __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1LL << *(_BYTE *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1LL << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v32 = v1;
    uint64_t v11 = ~v9;
    swift_retain(v7);
    uint64_t v12 = _HashTable.previousHole(before:)(a1, v8, v11);
    uint64_t v34 = v8;
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1LL << v10)) != 0)
    {
      unint64_t v13 = (v12 + 1) & v11;
      uint64_t v14 = *(void *)(v35 + 72);
      uint64_t v33 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      while (1)
      {
        int64_t v15 = v14 * v10;
        v33(v6, *(void *)(v7 + 48) + v14 * v10, v3);
        uint64_t v16 = *(void *)(v7 + 40);
        sub_100040370(&qword_10006A498, (uint64_t (*)(uint64_t))&type metadata accessor for RuntimePlatform);
        uint64_t v18 = dispatch thunk of Hashable._rawHashValue(seed:)(v16, v3, v17);
        (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v3);
        unint64_t v19 = v18 & v11;
        if (a1 >= (uint64_t)v13)
        {
        }

        else if (v19 < v13 && a1 < (uint64_t)v19)
        {
          goto LABEL_24;
        }

        uint64_t v22 = *(void *)(v7 + 48);
        int64_t v23 = v14 * a1;
        unint64_t v24 = v22 + v14 * a1;
        uint64_t v25 = v22 + v15;
        unint64_t v26 = v22 + v15 + v14;
        if (v14 * a1 < v15 || v24 >= v26) {
          break;
        }
        a1 = v10;
        if (v23 != v15)
        {
          swift_arrayInitWithTakeBackToFront(v24);
          goto LABEL_23;
        }

LABEL_24:
        unint64_t v10 = (v10 + 1) & v11;
        if (((*(void *)(v34 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
          goto LABEL_25;
        }
      }

      swift_arrayInitWithTakeFrontToBack(v24, v25, 1LL, v3);
LABEL_23:
      a1 = v10;
      goto LABEL_24;
    }

      uint64_t v25 = v164;
      if ((v178 & 1) != 0)
      {
        if (v41 < v27) {
          goto LABEL_161;
        }
        if (v27 < v41)
        {
          v176 = (char *)v26;
          id v56 = 0LL;
          v57 = v179 * (v41 - 1);
          uint64_t v58 = v41 * v179;
          unint64_t v59 = v27 * v179;
          do
          {
            if (v27 != v41 + v56 - 1)
            {
              unint64_t v60 = v173;
              if (!v173) {
                goto LABEL_167;
              }
              os_log_t v61 = v173 + v59;
              v174 = v173 + v57;
              uint64_t v42 = v175;
              v178 = (void (*)(char *, uint64_t, uint64_t, char *))v181[4];
              v178(v165, v173 + v59, v175, v25);
              if (v59 < v57 || v61 >= v60 + v58)
              {
                uint64_t v63 = v60 + v59;
                id v64 = v174;
                swift_arrayInitWithTakeFrontToBack(v63, v174, 1LL, v42);
              }

              else
              {
                id v64 = v174;
                if (v59 != v57) {
                  swift_arrayInitWithTakeBackToFront(v61);
                }
              }

              ((void (*)(uint64_t, char *, uint64_t))v178)(v64, v165, v42);
              uint64_t v25 = v164;
              uint64_t v12 = v162;
            }

            ++v27;
            --v56;
            v57 -= v179;
            v58 -= v179;
            v59 += v179;
          }

          while (v27 < v41 + v56);
          uint64_t v27 = (uint64_t)v166;
          unint64_t v26 = (uint64_t)v176;
        }
      }
    }

    if (v41 < v26)
    {
      if (__OFSUB__(v41, v27)) {
        goto LABEL_159;
      }
      if (v41 - v27 < v159)
      {
        if (__OFADD__(v27, v159)) {
          goto LABEL_162;
        }
        if (v27 + v159 >= v26) {
          uint64_t v65 = v26;
        }
        else {
          uint64_t v65 = v27 + v159;
        }
        if (v65 < v27) {
          goto LABEL_163;
        }
        if (v41 != v65)
        {
          v66 = v181[9];
          v171 = (uint64_t (*)(char *, uint64_t, uint64_t))v181[2];
          id v67 = v66 * (v41 - 1);
          v173 = v66;
          v179 = v41 * v66;
          v163 = v65;
          do
          {
            v68 = 0LL;
            v176 = (char *)v41;
            v174 = v67;
            while (1)
            {
              v178 = (void (*)(char *, uint64_t, uint64_t, char *))v27;
              v69 = *v180;
              v70 = v171;
              v171(v12, v179 + v68 + *v180, v42);
              uint64_t v71 = v67 + v68 + v69;
              v72 = v12;
              id v73 = v172;
              v74 = v70(v172, v71, v42);
              uint64_t v75 = v42;
              v76 = RuntimePlatform.description.getter(v74);
              Swift::String v78 = v77;
              Swift::String v79 = RuntimePlatform.description.getter(v76);
              if (v76 == v79 && v78 == v80)
              {
                swift_bridgeObjectRelease_n(v78, 2LL);
                uint64_t v91 = (void (*)(char *, uint64_t))v181[1];
                v91(v73, v42);
                v91(v72, v42);
                uint64_t v12 = v72;
                goto LABEL_62;
              }

              id v82 = v80;
              id v83 = _stringCompareWithSmolCheck(_:_:expecting:)(v76, v78, v79, v80, 1LL);
              swift_bridgeObjectRelease(v78);
              swift_bridgeObjectRelease(v82);
              v84 = (void (*)(char *, uint64_t))v181[1];
              v84(v73, v75);
              v84(v72, v75);
              uint64_t v12 = v72;
              if ((v83 & 1) == 0) {
                break;
              }
              id v85 = *v180;
              id v67 = v174;
              if (!*v180) {
                goto LABEL_165;
              }
              id v86 = v85 + v179 + v68;
              v87 = (char *)(v85 + v174 + v68);
              os_log_type_t v88 = (void (*)(char *, uint64_t, uint64_t))v181[4];
              int v89 = v175;
              v88(v177, v86, v175);
              swift_arrayInitWithTakeFrontToBack(v86, v87, 1LL, v89);
              v88(v87, (uint64_t)v177, v89);
              v68 -= v173;
              uint64_t v27 = (uint64_t)v178 + 1;
              uint64_t v90 = v176;
              uint64_t v42 = v89;
            }

            uint64_t v42 = v75;
LABEL_62:
            uint64_t v90 = v176;
            id v67 = v174;
LABEL_63:
            uint64_t v41 = (uint64_t)(v90 + 1);
            v67 += v173;
            v179 += v173;
            uint64_t v27 = (uint64_t)v166;
          }

          while (v41 != v163);
          uint64_t v41 = v163;
          uint64_t v25 = v164;
        }
      }
    }

    if (v41 < v27) {
      goto LABEL_158;
    }
    if ((swift_isUniquelyReferenced_nonNull_native(v25) & 1) != 0) {
      uint64_t v25 = v164;
    }
    else {
      uint64_t v25 = sub_10003F9CC(0LL, *((void *)v164 + 2) + 1LL, 1, v164);
    }
    uint64_t v93 = *((void *)v25 + 2);
    id v92 = *((void *)v25 + 3);
    unint64_t v94 = v93 + 1;
    v176 = (char *)v41;
    if (v93 >= v92 >> 1) {
      uint64_t v25 = sub_10003F9CC((char *)(v92 > 1), v93 + 1, 1, v25);
    }
    *((void *)v25 + 2) = v94;
    unint64_t v95 = v25 + 32;
    id v96 = &v25[16 * v93 + 32];
    v97 = v176;
    *(void *)id v96 = v27;
    *((void *)v96 + 1) = v97;
    if (v93) {
      break;
    }
    unint64_t v94 = 1LL;
LABEL_113:
    unint64_t v26 = v180[1];
    unint64_t v24 = v176;
  }

  while (1)
  {
    uint64_t v98 = v94 - 1;
    if (v94 >= 4)
    {
      uint64_t v103 = &v95[16 * v94];
      v104 = *((void *)v103 - 8);
      uint64_t v105 = *((void *)v103 - 7);
      uint64_t v109 = __OFSUB__(v105, v104);
      v106 = v105 - v104;
      if (v109) {
        goto LABEL_143;
      }
      uint64_t v108 = *((void *)v103 - 6);
      uint64_t v107 = *((void *)v103 - 5);
      uint64_t v109 = __OFSUB__(v107, v108);
      uint64_t v101 = v107 - v108;
      v102 = v109;
      if (v109) {
        goto LABEL_144;
      }
      unint64_t v110 = v94 - 2;
      v111 = &v95[16 * v94 - 32];
      uint64_t v113 = *(void *)v111;
      v112 = *((void *)v111 + 1);
      uint64_t v109 = __OFSUB__(v112, v113);
      v114 = v112 - v113;
      if (v109) {
        goto LABEL_145;
      }
      uint64_t v109 = __OFADD__(v101, v114);
      v115 = v101 + v114;
      if (v109) {
        goto LABEL_147;
      }
      if (v115 >= v106)
      {
        uint64_t v133 = &v95[16 * v98];
        uint64_t v135 = *(void *)v133;
        uint64_t v134 = *((void *)v133 + 1);
        uint64_t v109 = __OFSUB__(v134, v135);
        v136 = v134 - v135;
        if (v109) {
          goto LABEL_153;
        }
        uint64_t v126 = v101 < v136;
        goto LABEL_102;
      }
    }

    else
    {
      if (v94 != 3)
      {
        uint64_t v127 = *((void *)v25 + 4);
        os_log_t v128 = *((void *)v25 + 5);
        uint64_t v109 = __OFSUB__(v128, v127);
        uint64_t v120 = v128 - v127;
        uint64_t v121 = v109;
        goto LABEL_96;
      }

      unint64_t v100 = *((void *)v25 + 4);
      unint64_t v99 = *((void *)v25 + 5);
      uint64_t v109 = __OFSUB__(v99, v100);
      uint64_t v101 = v99 - v100;
      v102 = v109;
    }

    if ((v102 & 1) != 0) {
      goto LABEL_146;
    }
    unint64_t v110 = v94 - 2;
    __int128 v116 = &v95[16 * v94 - 32];
    id v118 = *(void *)v116;
    v117 = *((void *)v116 + 1);
    uint64_t v119 = __OFSUB__(v117, v118);
    uint64_t v120 = v117 - v118;
    uint64_t v121 = v119;
    if (v119) {
      goto LABEL_148;
    }
    uint64_t v122 = &v95[16 * v98];
    id v124 = *(void *)v122;
    v123 = *((void *)v122 + 1);
    uint64_t v109 = __OFSUB__(v123, v124);
    v125 = v123 - v124;
    if (v109) {
      goto LABEL_150;
    }
    if (__OFADD__(v120, v125)) {
      goto LABEL_152;
    }
    if (v120 + v125 >= v101)
    {
      uint64_t v126 = v101 < v125;
LABEL_102:
      if (v126) {
        uint64_t v98 = v110;
      }
      goto LABEL_104;
    }

void sub_10003BBE8(unint64_t a1)
{
  unint64_t v1 = a1;
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    sub_100045790();
    uint64_t v3 = sub_100046DEC();
    sub_100043908();
    if (v3)
    {
LABEL_3:
      sub_10000844C(&qword_100069E18);
      uint64_t v4 = (void *)static _SetStorage.allocate(capacity:)(v3);
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      sub_100045790();
      uint64_t v5 = sub_100046DEC();
      sub_100043908();
      if (!v5)
      {
LABEL_25:
        sub_100043908();
        sub_100045038();
        return;
      }

      goto LABEL_9;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = &_swiftEmptySetSingleton;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v5) {
    goto LABEL_25;
  }
LABEL_9:
  unint64_t v6 = 0LL;
  uint64_t v7 = (char *)(v4 + 7);
  unint64_t v27 = v1;
  unint64_t v28 = v1 & 0xC000000000000001LL;
  unint64_t v24 = (char *)(v1 + 32);
  uint64_t v25 = v1 & 0xFFFFFFFFFFFFFF8LL;
  uint64_t v26 = v5;
  while (1)
  {
    if (v28)
    {
      id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6, v1);
    }

    else
    {
      if (v6 >= *(void *)(v25 + 16)) {
        goto LABEL_28;
      }
      id v8 = *(id *)&v24[8 * v6];
    }

    uint64_t v9 = v8;
    BOOL v10 = __OFADD__(v6++, 1LL);
    if (v10) {
      break;
    }
    Swift::Int v11 = NSObject._rawHashValue(seed:)(v4[5]);
    uint64_t v12 = -1LL << *((_BYTE *)v4 + 32);
    unint64_t v13 = v11 & ~v12;
    unint64_t v14 = v13 >> 6;
    uint64_t v15 = *(void *)&v7[8 * (v13 >> 6)];
    uint64_t v16 = 1LL << v13;
    if (((1LL << v13) & v15) != 0)
    {
      sub_10000E518(0LL, &qword_100069E08, &OBJC_CLASS___WFAction_ptr);
      id v17 = sub_1000473A4();
      char v18 = sub_100047364((uint64_t)v17);

      if ((v18 & 1) != 0)
      {
LABEL_20:

        uint64_t v5 = v26;
        unint64_t v1 = v27;
        goto LABEL_24;
      }

      uint64_t v19 = ~v12;
      while (1)
      {
        unint64_t v13 = (v13 + 1) & v19;
        unint64_t v14 = v13 >> 6;
        uint64_t v15 = *(void *)&v7[8 * (v13 >> 6)];
        uint64_t v16 = 1LL << v13;
        if ((v15 & (1LL << v13)) == 0) {
          break;
        }
        id v20 = sub_1000473A4();
        char v21 = sub_100047364((uint64_t)v20);

        if ((v21 & 1) != 0) {
          goto LABEL_20;
        }
      }

      uint64_t v5 = v26;
      unint64_t v1 = v27;
    }

    *(void *)&v7[8 * v14] = v16 | v15;
    *(void *)(v4[6] + 8 * v13) = v9;
    uint64_t v22 = v4[2];
    BOOL v10 = __OFADD__(v22, 1LL);
    uint64_t v23 = v22 + 1;
    if (v10) {
      goto LABEL_27;
    }
    v4[2] = v23;
LABEL_24:
    if (v6 == v5) {
      goto LABEL_25;
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
}

uint64_t sub_10003BDEC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RuntimePlatform(0LL);
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v30 - v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
    BOOL v10 = &_swiftEmptySetSingleton;
    goto LABEL_16;
  }

  sub_10000844C(&qword_10006A4A8);
  uint64_t result = static _SetStorage.allocate(capacity:)(v8);
  BOOL v10 = (void *)result;
  uint64_t v32 = *(void *)(a1 + 16);
  if (!v32)
  {
LABEL_16:
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v10;
  }

  unint64_t v11 = 0LL;
  uint64_t v34 = result + 56;
  uint64_t v12 = *(unsigned __int8 *)(v35 + 80);
  uint64_t v30 = a1;
  uint64_t v31 = a1 + ((v12 + 32) & ~v12);
  while (v11 < *(void *)(a1 + 16))
  {
    uint64_t v13 = *(void *)(v35 + 72);
    unint64_t v14 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
    v14(v7, v31 + v13 * v11, v2);
    uint64_t v15 = v10[5];
    sub_100040370(&qword_10006A498, (uint64_t (*)(uint64_t))&type metadata accessor for RuntimePlatform);
    uint64_t v17 = dispatch thunk of Hashable._rawHashValue(seed:)(v15, v2, v16);
    uint64_t v18 = -1LL << *((_BYTE *)v10 + 32);
    unint64_t v19 = v17 & ~v18;
    unint64_t v20 = v19 >> 6;
    uint64_t v21 = *(void *)(v34 + 8 * (v19 >> 6));
    uint64_t v22 = 1LL << v19;
    if (((1LL << v19) & v21) != 0)
    {
      unint64_t v33 = v11;
      uint64_t v23 = ~v18;
      while (1)
      {
        v14(v5, v10[6] + v19 * v13, v2);
        sub_100040370(&qword_10006A4A0, (uint64_t (*)(uint64_t))&type metadata accessor for RuntimePlatform);
        char v25 = dispatch thunk of static Equatable.== infix(_:_:)(v5, v7, v2, v24);
        uint64_t v26 = *(void (**)(char *, uint64_t))(v35 + 8);
        v26(v5, v2);
        if ((v25 & 1) != 0) {
          break;
        }
        unint64_t v19 = (v19 + 1) & v23;
        unint64_t v20 = v19 >> 6;
        uint64_t v21 = *(void *)(v34 + 8 * (v19 >> 6));
        uint64_t v22 = 1LL << v19;
        if ((v21 & (1LL << v19)) == 0)
        {
          a1 = v30;
          unint64_t v11 = v33;
          goto LABEL_10;
        }
      }

      uint64_t result = ((uint64_t (*)(char *, uint64_t))v26)(v7, v2);
      a1 = v30;
      unint64_t v11 = v33;
    }

    else
    {
LABEL_10:
      *(void *)(v34 + 8 * v20) = v22 | v21;
      uint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v35 + 32))(v10[6] + v19 * v13, v7, v2);
      uint64_t v27 = v10[2];
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        goto LABEL_18;
      }
      _OWORD v10[2] = v29;
    }

    if (++v11 == v32) {
      goto LABEL_16;
    }
  }

  __break(1u);
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_10003C084(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v24, *(void *)(*v3 + 40LL));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    uint64_t v13 = v12[1];
    BOOL v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0LL) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      uint64_t v15 = (uint64_t *)(*(void *)(*v3 + 48LL) + 16 * v10);
      uint64_t v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0LL;
    }

    uint64_t v18 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v18;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        break;
      }
      unint64_t v19 = (void *)(v11 + 16 * v10);
      uint64_t v20 = v19[1];
      BOOL v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0LL) & 1) != 0) {
        goto LABEL_7;
      }
    }
  }

  swift_bridgeObjectRelease(v7);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *uint64_t v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_10003CDD4(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  *uint64_t v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

uint64_t sub_10003C230(Swift::Int *a1, void *a2)
{
  uint64_t v4 = v2;
  uint64_t v7 = *v2;
  if ((*v2 & 0xC000000000000001LL) != 0)
  {
    if (v7 < 0) {
      uint64_t v8 = *v2;
    }
    else {
      uint64_t v8 = v7 & 0xFFFFFFFFFFFFFF8LL;
    }
    sub_1000436BC();
    id v9 = a2;
    uint64_t v10 = __CocoaSet.member(for:)();

    if (v10)
    {
      sub_100043174();

      uint64_t v36 = v10;
      uint64_t v12 = sub_1000132F0(v11, &qword_100069E08, &OBJC_CLASS___WFAction_ptr);
      sub_100045520();
      sub_1000452E4((uint64_t)&v37, (uint64_t)&v36, (uint64_t)&type metadata for Swift.AnyObject + 8, v12);
      *a1 = v37;
      sub_1000431C0();
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v8);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v28 = sub_100039630(v8, result + 1);
    Swift::Int v37 = v28;
    if (*(void *)(v28 + 24) <= *(void *)(v28 + 16))
    {
      id v33 = v9;
      sub_10003A328();
      Swift::Int v29 = v37;
    }

    else
    {
      Swift::Int v29 = v28;
      id v30 = v9;
    }

    uint64_t v34 = sub_100046D74();
    sub_10000D980(v34, v35);
    Swift::Int v32 = *v4;
    *uint64_t v4 = v29;
  }

  else
  {
    Swift::Int v13 = *(void *)(v7 + 40);
    sub_1000436BC();
    Swift::Int v14 = NSObject._rawHashValue(seed:)(v13);
    uint64_t v15 = -1LL << *(_BYTE *)(v7 + 32);
    unint64_t v16 = v14 & ~v15;
    sub_1000471C4();
    if ((v18 & 1) != 0)
    {
      sub_1000132F0(v17, &qword_100069E08, &OBJC_CLASS___WFAction_ptr);
      id v19 = sub_1000472D4();
      char v20 = sub_100046F40((uint64_t)v19);

      if ((v20 & 1) != 0)
      {
LABEL_12:

        sub_100043174();
        char v25 = *(void **)(*(void *)(*v4 + 48) + 8 * v16);
        *a1 = (Swift::Int)v25;
        id v26 = v25;
        return 0LL;
      }

      uint64_t v21 = ~v15;
      while (1)
      {
        unint64_t v16 = (v16 + 1) & v21;
        sub_1000471C4();
        if ((v22 & 1) == 0) {
          break;
        }
        id v23 = sub_1000472D4();
        char v24 = sub_100046F40((uint64_t)v23);

        if ((v24 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    sub_100043174();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    Swift::Int v37 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    id v9 = a2;
    sub_10003CF6C((uint64_t)v9, v16, isUniquelyReferenced_nonNull_native);
    Swift::Int v32 = *v4;
    *uint64_t v4 = v37;
  }

  swift_bridgeObjectRelease(v32);
  *a1 = (Swift::Int)v9;
  return 1LL;
}

uint64_t sub_10003C464(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for RuntimePlatform(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v3;
  uint64_t v11 = *(void *)(*v3 + 40LL);
  sub_100040370(&qword_10006A498, v12);
  uint64_t v14 = v13;
  swift_bridgeObjectRetain(v10);
  uint64_t v36 = a2;
  uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v14);
  uint64_t v16 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v17 = v15 & ~v16;
  uint64_t v18 = v10;
  uint64_t v19 = v10 + 56;
  if (((*(void *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) != 0)
  {
    Swift::Int v32 = v3;
    uint64_t v33 = a1;
    uint64_t v34 = ~v16;
    uint64_t v35 = v7;
    uint64_t v20 = *(void *)(v7 + 72);
    uint64_t v21 = *(void (**)(void, void, void))(v7 + 16);
    while (1)
    {
      uint64_t v22 = v18;
      id v23 = v21;
      v21(v9, *(void *)(v18 + 48) + v20 * v17, v6);
      sub_100040370(&qword_10006A4A0, (uint64_t (*)(uint64_t))&type metadata accessor for RuntimePlatform);
      char v25 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v36, v6, v24);
      id v26 = *(void (**)(char *, uint64_t))(v35 + 8);
      v26(v9, v6);
      if ((v25 & 1) != 0) {
        break;
      }
      unint64_t v17 = (v17 + 1) & v34;
      uint64_t v18 = v22;
      uint64_t v21 = v23;
      if (((*(void *)(v19 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) == 0)
      {
        swift_bridgeObjectRelease(v22);
        uint64_t v3 = v32;
        a1 = v33;
        uint64_t v27 = v35;
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease(v22);
    v26(v36, v6);
    v23(v33, *(void *)(*v32 + 48LL) + v20 * v17, v6);
    return 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v10);
    uint64_t v21 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v27 = v7;
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v29 = v36;
    v21(v9, v36, v6);
    uint64_t v37 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_10003D0F0((uint64_t)v9, v17, isUniquelyReferenced_nonNull_native);
    uint64_t v30 = *v3;
    *uint64_t v3 = v37;
    swift_bridgeObjectRelease(v30);
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(a1, v29, v6);
    return 1LL;
  }

uint64_t sub_10003C6C0(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for TypeInstance(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v3;
  uint64_t v11 = *(void *)(*v3 + 40LL);
  sub_100040370(&qword_10006A4C0, v12);
  uint64_t v14 = v13;
  swift_bridgeObjectRetain(v10);
  uint64_t v36 = a2;
  uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v14);
  uint64_t v16 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v17 = v15 & ~v16;
  uint64_t v18 = v10;
  uint64_t v19 = v10 + 56;
  if (((*(void *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) != 0)
  {
    Swift::Int v32 = v3;
    uint64_t v33 = a1;
    uint64_t v34 = ~v16;
    uint64_t v35 = v7;
    uint64_t v20 = *(void *)(v7 + 72);
    uint64_t v21 = *(void (**)(void, void, void))(v7 + 16);
    while (1)
    {
      uint64_t v22 = v18;
      id v23 = v21;
      v21(v9, *(void *)(v18 + 48) + v20 * v17, v6);
      sub_100040370(&qword_10006A4C8, (uint64_t (*)(uint64_t))&type metadata accessor for TypeInstance);
      char v25 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v36, v6, v24);
      id v26 = *(void (**)(char *, uint64_t))(v35 + 8);
      v26(v9, v6);
      if ((v25 & 1) != 0) {
        break;
      }
      unint64_t v17 = (v17 + 1) & v34;
      uint64_t v18 = v22;
      uint64_t v21 = v23;
      if (((*(void *)(v19 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) == 0)
      {
        swift_bridgeObjectRelease(v22);
        uint64_t v3 = v32;
        a1 = v33;
        uint64_t v27 = v35;
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease(v22);
    v26(v36, v6);
    v23(v33, *(void *)(*v32 + 48LL) + v20 * v17, v6);
    return 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v10);
    uint64_t v21 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v27 = v7;
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v29 = v36;
    v21(v9, v36, v6);
    uint64_t v37 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_10003D344((uint64_t)v9, v17, isUniquelyReferenced_nonNull_native);
    uint64_t v30 = *v3;
    *uint64_t v3 = v37;
    swift_bridgeObjectRelease(v30);
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(a1, v29, v6);
    return 1LL;
  }

uint64_t sub_10003C91C(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for TypeIdentifier(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v3;
  uint64_t v11 = *(void *)(*v3 + 40LL);
  sub_100040370(&qword_10006A2D8, v12);
  uint64_t v14 = v13;
  swift_bridgeObjectRetain(v10);
  uint64_t v36 = a2;
  uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v14);
  uint64_t v16 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v17 = v15 & ~v16;
  uint64_t v18 = v10;
  uint64_t v19 = v10 + 56;
  if (((*(void *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) != 0)
  {
    Swift::Int v32 = v3;
    uint64_t v33 = a1;
    uint64_t v34 = ~v16;
    uint64_t v35 = v7;
    uint64_t v20 = *(void *)(v7 + 72);
    uint64_t v21 = *(void (**)(void, void, void))(v7 + 16);
    while (1)
    {
      uint64_t v22 = v18;
      id v23 = v21;
      v21(v9, *(void *)(v18 + 48) + v20 * v17, v6);
      sub_100040370(&qword_10006A4D8, (uint64_t (*)(uint64_t))&type metadata accessor for TypeIdentifier);
      char v25 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v36, v6, v24);
      id v26 = *(void (**)(char *, uint64_t))(v35 + 8);
      v26(v9, v6);
      if ((v25 & 1) != 0) {
        break;
      }
      unint64_t v17 = (v17 + 1) & v34;
      uint64_t v18 = v22;
      uint64_t v21 = v23;
      if (((*(void *)(v19 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) == 0)
      {
        swift_bridgeObjectRelease(v22);
        uint64_t v3 = v32;
        a1 = v33;
        uint64_t v27 = v35;
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease(v22);
    v26(v36, v6);
    v23(v33, *(void *)(*v32 + 48LL) + v20 * v17, v6);
    return 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v10);
    uint64_t v21 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v27 = v7;
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v29 = v36;
    v21(v9, v36, v6);
    uint64_t v37 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_10003D598((uint64_t)v9, v17, isUniquelyReferenced_nonNull_native);
    uint64_t v30 = *v3;
    *uint64_t v3 = v37;
    swift_bridgeObjectRelease(v30);
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(a1, v29, v6);
    return 1LL;
  }

uint64_t sub_10003CB78(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for TypeDefinition(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *v3;
  uint64_t v11 = *(void *)(*v3 + 40LL);
  sub_100040370(&qword_10006A4E8, v12);
  uint64_t v14 = v13;
  swift_bridgeObjectRetain(v10);
  uint64_t v36 = a2;
  uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v11, v6, v14);
  uint64_t v16 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v17 = v15 & ~v16;
  uint64_t v18 = v10;
  uint64_t v19 = v10 + 56;
  if (((*(void *)(v10 + 56 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) != 0)
  {
    Swift::Int v32 = v3;
    uint64_t v33 = a1;
    uint64_t v34 = ~v16;
    uint64_t v35 = v7;
    uint64_t v20 = *(void *)(v7 + 72);
    uint64_t v21 = *(void (**)(void, void, void))(v7 + 16);
    while (1)
    {
      uint64_t v22 = v18;
      id v23 = v21;
      v21(v9, *(void *)(v18 + 48) + v20 * v17, v6);
      sub_100040370(&qword_10006A4F0, (uint64_t (*)(uint64_t))&type metadata accessor for TypeDefinition);
      char v25 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v36, v6, v24);
      id v26 = *(void (**)(char *, uint64_t))(v35 + 8);
      v26(v9, v6);
      if ((v25 & 1) != 0) {
        break;
      }
      unint64_t v17 = (v17 + 1) & v34;
      uint64_t v18 = v22;
      uint64_t v21 = v23;
      if (((*(void *)(v19 + ((v17 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v17) & 1) == 0)
      {
        swift_bridgeObjectRelease(v22);
        uint64_t v3 = v32;
        a1 = v33;
        uint64_t v27 = v35;
        goto LABEL_7;
      }
    }

    swift_bridgeObjectRelease(v22);
    v26(v36, v6);
    v23(v33, *(void *)(*v32 + 48LL) + v20 * v17, v6);
    return 0LL;
  }

  else
  {
    swift_bridgeObjectRelease(v10);
    uint64_t v21 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v27 = v7;
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v29 = v36;
    v21(v9, v36, v6);
    uint64_t v37 = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_10003D7EC((uint64_t)v9, v17, isUniquelyReferenced_nonNull_native);
    uint64_t v30 = *v3;
    *uint64_t v3 = v37;
    swift_bridgeObjectRelease(v30);
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(a1, v29, v6);
    return 1LL;
  }

uint64_t sub_10003CDD4(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_10003A050(v11);
  }

  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_10003AB04();
      goto LABEL_22;
    }

    sub_10003B030(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v28, *(void *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  uint64_t result = Hasher._finalize()();
  uint64_t v13 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  uint64_t v14 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v12 + 48);
    uint64_t v16 = (void *)(v15 + 16 * a3);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v8 && v17 == a2;
    if (v18 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0LL), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }

    else
    {
      uint64_t v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(void *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v20 = (void *)(v15 + 16 * a3);
        uint64_t v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0LL);
          if ((result & 1) == 0) {
            continue;
          }
        }

        goto LABEL_21;
      }
    }
  }

void sub_10003CF6C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if ((a3 & 1) != 0)
  {
    sub_10003A328();
  }

  else
  {
    if (v8 > v7)
    {
      sub_10003ACB4();
      goto LABEL_14;
    }

    sub_10003B2D8(v7 + 1);
  }

  uint64_t v9 = *v3;
  Swift::Int v10 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v11 = -1LL << *(_BYTE *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v12 = sub_10000E518(0LL, &qword_100069E08, &OBJC_CLASS___WFAction_ptr);
    id v13 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
    char v14 = static NSObject.== infix(_:_:)(v13, a1);

    if ((v14 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v12);
      __break(1u);
    }

    else
    {
      uint64_t v15 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v15;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        id v16 = *(id *)(*(void *)(v9 + 48) + 8 * a2);
        char v17 = static NSObject.== infix(_:_:)(v16, a1);

        if ((v17 & 1) != 0) {
          goto LABEL_13;
        }
      }
    }
  }

LABEL_14:
  uint64_t v18 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v18 + 48) + 8 * a2) = a1;
  uint64_t v19 = *(void *)(v18 + 16);
  BOOL v20 = __OFADD__(v19, 1LL);
  uint64_t v21 = v19 + 1;
  if (v20) {
    __break(1u);
  }
  else {
    *(void *)(v18 + 16) = v21;
  }
}

uint64_t sub_10003D0F0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v29 = a1;
  uint64_t v6 = type metadata accessor for RuntimePlatform(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  Swift::Int v28 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) != 0)
  {
    sub_10003A578();
  }

  else
  {
    if (v11 > v10)
    {
      sub_10003AE5C();
      goto LABEL_12;
    }

    sub_10003B54C();
  }

  uint64_t v12 = *v3;
  uint64_t v13 = *(void *)(*v3 + 40);
  sub_100040370(&qword_10006A498, (uint64_t (*)(uint64_t))&type metadata accessor for RuntimePlatform);
  uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v13, v6, v14);
  uint64_t v16 = -1LL << *(_BYTE *)(v12 + 32);
  a2 = v15 & ~v16;
  if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v17 = ~v16;
    uint64_t v18 = *(void *)(v7 + 72);
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v19(v9, *(void *)(v12 + 48) + v18 * a2, v6);
      sub_100040370(&qword_10006A4A0, (uint64_t (*)(uint64_t))&type metadata accessor for RuntimePlatform);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v29, v6, v20);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v21 & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v17;
    }

    while (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(*v28 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))( *(void *)(v23 + 48) + *(void *)(v7 + 72) * a2,  v22,  v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }

  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(*v28 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))( *(void *)(v23 + 48) + *(void *)(v7 + 72) * a2,  v22,  v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }

  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(*v28 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))( *(void *)(v23 + 48) + *(void *)(v7 + 72) * a2,  v22,  v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }

  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(*v28 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))( *(void *)(v23 + 48) + *(void *)(v7 + 72) * a2,  v22,  v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }

  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v6);
  __break(1u);
  return result;
}

uint64_t sub_10003D344(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v29 = a1;
  uint64_t v6 = type metadata accessor for TypeInstance(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  Swift::Int v28 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) != 0)
  {
    sub_10003A578();
  }

  else
  {
    if (v11 > v10)
    {
      sub_10003AE5C();
      goto LABEL_12;
    }

    sub_10003B54C();
  }

  uint64_t v12 = *v3;
  uint64_t v13 = *(void *)(*v3 + 40);
  sub_100040370(&qword_10006A4C0, (uint64_t (*)(uint64_t))&type metadata accessor for TypeInstance);
  uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v13, v6, v14);
  uint64_t v16 = -1LL << *(_BYTE *)(v12 + 32);
  a2 = v15 & ~v16;
  if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v17 = ~v16;
    uint64_t v18 = *(void *)(v7 + 72);
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v19(v9, *(void *)(v12 + 48) + v18 * a2, v6);
      sub_100040370(&qword_10006A4C8, (uint64_t (*)(uint64_t))&type metadata accessor for TypeInstance);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v29, v6, v20);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v21 & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v17;
    }

    while (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

uint64_t sub_10003D598(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v29 = a1;
  uint64_t v6 = type metadata accessor for TypeIdentifier(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  Swift::Int v28 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) != 0)
  {
    sub_10003A578();
  }

  else
  {
    if (v11 > v10)
    {
      sub_10003AE5C();
      goto LABEL_12;
    }

    sub_10003B54C();
  }

  uint64_t v12 = *v3;
  uint64_t v13 = *(void *)(*v3 + 40);
  sub_100040370(&qword_10006A2D8, (uint64_t (*)(uint64_t))&type metadata accessor for TypeIdentifier);
  uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v13, v6, v14);
  uint64_t v16 = -1LL << *(_BYTE *)(v12 + 32);
  a2 = v15 & ~v16;
  if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v17 = ~v16;
    uint64_t v18 = *(void *)(v7 + 72);
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v19(v9, *(void *)(v12 + 48) + v18 * a2, v6);
      sub_100040370(&qword_10006A4D8, (uint64_t (*)(uint64_t))&type metadata accessor for TypeIdentifier);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v29, v6, v20);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v21 & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v17;
    }

    while (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

uint64_t sub_10003D7EC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v29 = a1;
  uint64_t v6 = type metadata accessor for TypeDefinition(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  Swift::Int v28 = v3;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) != 0)
  {
    sub_10003A578();
  }

  else
  {
    if (v11 > v10)
    {
      sub_10003AE5C();
      goto LABEL_12;
    }

    sub_10003B54C();
  }

  uint64_t v12 = *v3;
  uint64_t v13 = *(void *)(*v3 + 40);
  sub_100040370(&qword_10006A4E8, (uint64_t (*)(uint64_t))&type metadata accessor for TypeDefinition);
  uint64_t v15 = dispatch thunk of Hashable._rawHashValue(seed:)(v13, v6, v14);
  uint64_t v16 = -1LL << *(_BYTE *)(v12 + 32);
  a2 = v15 & ~v16;
  if (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v17 = ~v16;
    uint64_t v18 = *(void *)(v7 + 72);
    uint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v19(v9, *(void *)(v12 + 48) + v18 * a2, v6);
      sub_100040370(&qword_10006A4F0, (uint64_t (*)(uint64_t))&type metadata accessor for TypeDefinition);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v29, v6, v20);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v21 & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v17;
    }

    while (((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

uint64_t sub_10003DA40(uint64_t (*a1)(void, uint64_t, uint64_t))
{
  uint64_t v2 = *v1;
  uint64_t result = sub_1000460BC();
  *unint64_t v1 = v2;
  if ((result & 1) == 0) {
    return a1(0LL, *(void *)(v2 + 16) + 1LL, 1LL);
  }
  return result;
}

uint64_t sub_10003DA98(uint64_t result, uint64_t (*a2)(BOOL))
{
  unint64_t v3 = *(void *)(*(void *)v2 + 24LL);
  return result;
}

uint64_t sub_10003DAC4()
{
  *(void *)(*(void *)v0 + 16LL) = v1 + 1;
  uint64_t v4 = sub_100045FE4(v1, v2, v3);
  unint64_t v5 = sub_100044A80(v4);
  return sub_10004422C(v5, v6, v7, v8);
}

uint64_t sub_10003DAF4(void *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
  {
    sub_1000411A8();
    uint64_t v2 = v3;
  }

  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  uint64_t result = sub_10003DDB0(v6);
  *a1 = v2;
  return result;
}

void sub_10003DB5C(uint64_t *a1)
{
  uint64_t v2 = *(void *)(type metadata accessor for RuntimePlatform(0LL) - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0)
  {
    sub_1000411BC(v3);
    uint64_t v3 = v4;
  }

  uint64_t v5 = *(void *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v5;
  sub_10003E414(v6);
  *a1 = v3;
}

void sub_10003DBDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v3 = sub_10000844C(&qword_100069A98);
    uint64_t v4 = (void *)sub_100042644(v3, 16 * v1 + 32);
    size_t v5 = j__malloc_size(v4);
    v4[2] = v1;
    v4[3] = 2 * ((uint64_t)(v5 - 32) / 16);
    uint64_t v6 = sub_100040594((uint64_t)&v8, v4 + 4, v1, a1);
    sub_1000443C0();
    uint64_t v7 = sub_1000443F4();
    sub_10000E5A0(v7);
    if (v6 != v1) {
      __break(1u);
    }
  }

  sub_100045038();
}

void *sub_10003DC98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_10000844C(&qword_10006A488);
  uint64_t v4 = *(void *)(type metadata accessor for RuntimePlatform(0LL) - 8);
  uint64_t v5 = *(void *)(v4 + 72);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = (v6 + 32) & ~v6;
  uint64_t v8 = (void *)swift_allocObject(v3, v7 + v5 * v1, v6 | 7);
  uint64_t result = (void *)j__malloc_size(v8);
  if (v5)
  {
    if ((void *)((char *)result - v7) != (void *)0x8000000000000000LL || v5 != -1)
    {
      v8[2] = v1;
      v8[3] = 2 * (((uint64_t)result - v7) / v5);
      uint64_t v11 = sub_1000409D0(&v13, (uint64_t)v8 + v7, v1, a1);
      uint64_t v12 = v13;
      swift_bridgeObjectRetain(a1);
      sub_10000E5A0(v12);
      if (v11 == v1) {
        return v8;
      }
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_10003DDB0(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_10003EF70(0LL, v3, 1LL, a1);
      }
      return result;
    }

LABEL_145:
    __break(1u);
    goto LABEL_146;
  }

  uint64_t v5 = result;
  uint64_t result = (uint64_t)sub_100037DEC(v3 / 2);
  uint64_t v100 = result;
  uint64_t v101 = v3;
  __dst = v6;
  uint64_t v98 = a1;
  if (v3 > 0)
  {
    uint64_t v99 = v5;
    Swift::Int v7 = 0LL;
    uint64_t v8 = *a1;
    uint64_t v97 = *a1 + 8;
    uint64_t v103 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      Swift::Int v9 = v7++;
      if (v7 >= v3) {
        goto LABEL_32;
      }
      unint64_t v10 = (uint64_t *)(v8 + 16 * v7);
      uint64_t result = *v10;
      uint64_t v11 = v10[1];
      uint64_t v12 = (void *)(v8 + 16 * v9);
      uint64_t v13 = v12[1];
      if (result == *v12 && v11 == v13) {
        break;
      }
      uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v11, *v12, v13, 1LL);
      int v15 = result;
      Swift::Int v16 = v9 + 2;
      if (v9 + 2 < v3) {
        goto LABEL_13;
      }
LABEL_23:
      Swift::Int v7 = v16;
      if ((v15 & 1) == 0) {
        goto LABEL_32;
      }
LABEL_24:
      if (v16 < v9) {
        goto LABEL_149;
      }
      if (v9 < v16)
      {
        uint64_t v23 = 16 * v16;
        uint64_t v24 = 16 * v9;
        Swift::Int v25 = v16;
        Swift::Int v26 = v9;
        do
        {
          if (v26 != --v25)
          {
            if (!v8) {
              goto LABEL_153;
            }
            uint64_t v27 = v8 + v23;
            uint64_t v28 = *(void *)(v8 + v24);
            uint64_t v29 = *(void *)(v8 + v24 + 8);
            *(_OWORD *)(v8 + v24) = *(_OWORD *)(v8 + v23 - 16);
            *(void *)(v27 - 16) = v28;
            *(void *)(v27 - 8) = v29;
          }

          ++v26;
          v23 -= 16LL;
          v24 += 16LL;
        }

        while (v26 < v25);
      }

LABEL_73:
          if ((v60 & 1) != 0) {
            goto LABEL_134;
          }
          v68 = &v35[2 * v37];
          uint64_t v70 = *v68;
          uint64_t v69 = v68[1];
          BOOL v48 = __OFSUB__(v69, v70);
          uint64_t v71 = v69 - v70;
          if (v48) {
            goto LABEL_136;
          }
          if (v71 < v59) {
            goto LABEL_90;
          }
LABEL_81:
          unint64_t v76 = v37 - 1;
          if (v37 - 1 >= v34)
          {
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
            goto LABEL_139;
          }

          if (!v8) {
            goto LABEL_152;
          }
          v77 = &v35[2 * v76];
          uint64_t v78 = *v77;
          Swift::String v79 = &v35[2 * v37];
          uint64_t v80 = v79[1];
          uint64_t result = sub_10003F308((char *)(v8 + 16 * *v77), (char *)(v8 + 16LL * *v79), v8 + 16 * v80, __dst);
          if (v1)
          {
            uint64_t v90 = v103;
LABEL_107:
            uint64_t result = swift_bridgeObjectRelease(v90);
            if (v101 >= -1)
            {
              *(void *)(v100 + 16) = 0LL;
              return swift_bridgeObjectRelease(v100);
            }

LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
            goto LABEL_148;
          }

          if (v80 < v78) {
            goto LABEL_125;
          }
          if (v37 > *((void *)v103 + 2)) {
            goto LABEL_126;
          }
          uint64_t *v77 = v78;
          v35[2 * v76 + 1] = v80;
          unint64_t v81 = *((void *)v103 + 2);
          if (v37 >= v81) {
            goto LABEL_127;
          }
          uint64_t v31 = v103;
          unint64_t v34 = v81 - 1;
          uint64_t result = (uint64_t)memmove(&v35[2 * v37], v79 + 2, 16 * (v81 - 1 - v37));
          *((void *)v103 + 2) = v81 - 1;
          if (v81 <= 2) {
            goto LABEL_90;
          }
        }
      }

      unint64_t v34 = 1LL;
LABEL_90:
      Swift::Int v3 = v101;
      if (v7 >= v101) {
        goto LABEL_111;
      }
    }

    Swift::Int v16 = v9 + 2;
    if (v9 + 2 >= v3) {
      goto LABEL_31;
    }
    int v15 = 0;
LABEL_13:
    uint64_t v17 = (uint64_t *)(v97 + 16 * v16);
    do
    {
      uint64_t result = *(v17 - 1);
      uint64_t v18 = *v17;
      uint64_t v19 = (void *)(v8 + 16 * v7);
      uint64_t v20 = v19[1];
      if (result == *v19 && v18 == v20)
      {
        if ((v15 & 1) != 0) {
          goto LABEL_24;
        }
      }

      else
      {
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v18, *v19, v20, 1LL);
      }

      v17 += 2;
      Swift::Int v22 = v16 + 1;
      Swift::Int v7 = v16;
      Swift::Int v16 = v22;
    }

    while (v22 < v3);
    Swift::Int v16 = v22;
    goto LABEL_23;
  }

  uint64_t v103 = (char *)_swiftEmptyArrayStorage;
  unint64_t v34 = _swiftEmptyArrayStorage[2];
LABEL_111:
  if (v34 >= 2)
  {
    uint64_t v91 = *v98;
    while (1)
    {
      unint64_t v92 = v34 - 2;
      if (v34 < 2) {
        break;
      }
      if (!v91) {
        goto LABEL_154;
      }
      uint64_t v90 = v103;
      uint64_t v93 = *(void *)&v103[16 * v92 + 32];
      uint64_t v94 = *(void *)&v103[16 * v34 + 24];
      uint64_t result = sub_10003F308( (char *)(v91 + 16 * v93),  (char *)(v91 + 16LL * *(void *)&v103[16 * v34 + 16]),  v91 + 16 * v94,  __dst);
      if (v1) {
        goto LABEL_107;
      }
      if (v94 < v93) {
        goto LABEL_140;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(v103);
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10003FAC0((uint64_t)v103);
        uint64_t v90 = (char *)result;
      }

      if (v92 >= *((void *)v90 + 2)) {
        goto LABEL_141;
      }
      unint64_t v95 = &v90[16 * v92 + 32];
      *(void *)unint64_t v95 = v93;
      *((void *)v95 + 1) = v94;
      unint64_t v96 = *((void *)v90 + 2);
      if (v34 > v96) {
        goto LABEL_142;
      }
      uint64_t result = (uint64_t)memmove(&v90[16 * v34 + 16], &v90[16 * v34 + 32], 16 * (v96 - v34));
      uint64_t v103 = v90;
      *((void *)v90 + 2) = v96 - 1;
      unint64_t v34 = v96 - 1;
      Swift::Int v3 = v101;
      if (v96 <= 2) {
        goto LABEL_122;
      }
    }

LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
    goto LABEL_145;
  }

LABEL_122:
  uint64_t result = swift_bridgeObjectRelease(v103);
  if (v3 < -1) {
    goto LABEL_150;
  }
  *(void *)(v100 + 16) = 0LL;
  return swift_bridgeObjectRelease(v100);
}

void sub_10003E414(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for RuntimePlatform(0LL);
  v181 = *(void **)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  v165 = (char *)&v156 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = __chkstk_darwin(v3);
  v177 = (char *)&v156 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  Swift::Int v9 = (char *)&v156 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v156 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  v169 = (char *)&v156 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  v168 = (char *)&v156 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v161 = (char *)&v156 - v18;
  __chkstk_darwin(v17);
  v160 = (char *)&v156 - v19;
  v180 = a1;
  Swift::Int v20 = a1[1];
  Swift::Int v21 = _minimumMergeRunLength(_:)(v20);
  if (v21 >= v20)
  {
    if ((v20 & 0x8000000000000000LL) == 0)
    {
      if (v20) {
        sub_10003F034(0LL, v20, 1LL, v180);
      }
      return;
    }

    goto LABEL_160;
  }

  Swift::Int v159 = v21;
  sub_100037E60(v20 / 2);
  uint64_t v157 = v22;
  uint64_t v158 = v20;
  unint64_t v167 = v23;
  if (v20 <= 0)
  {
LABEL_122:
    Swift::Int v25 = (char *)_swiftEmptyArrayStorage;
    unint64_t v94 = _swiftEmptyArrayStorage[2];
LABEL_123:
    if (v94 < 2)
    {
LABEL_136:
      swift_bridgeObjectRelease(v25);
      if (v158 >= -1) {
        goto LABEL_137;
      }
      goto LABEL_164;
    }

    uint64_t v146 = *v180;
    uint64_t v147 = v170;
    unint64_t v148 = v167;
    while (1)
    {
      unint64_t v149 = v94 - 2;
      if (v94 < 2) {
        break;
      }
      if (!v146) {
        goto LABEL_168;
      }
      v150 = v25;
      uint64_t v151 = *(void *)&v25[16 * v149 + 32];
      uint64_t v152 = *(void *)&v25[16 * v94 + 24];
      sub_10003F4AC(v146 + v181[9] * v151, v146 + v181[9] * *(void *)&v25[16 * v94 + 16], v146 + v181[9] * v152, v148);
      if (v147)
      {
        v145 = v150;
        goto LABEL_120;
      }

      if (v152 < v151) {
        goto LABEL_155;
      }
      if ((swift_isUniquelyReferenced_nonNull_native(v150) & 1) == 0) {
        v150 = sub_10003FAC0((uint64_t)v150);
      }
      if (v149 >= *((void *)v150 + 2)) {
        goto LABEL_156;
      }
      v153 = &v150[16 * v149 + 32];
      *(void *)v153 = v151;
      *((void *)v153 + 1) = v152;
      unint64_t v154 = *((void *)v150 + 2);
      if (v94 > v154) {
        goto LABEL_157;
      }
      memmove(&v150[16 * v94 + 16], &v150[16 * v94 + 32], 16 * (v154 - v94));
      Swift::Int v25 = v150;
      *((void *)v150 + 2) = v154 - 1;
      unint64_t v94 = v154 - 1;
      if (v154 <= 2) {
        goto LABEL_136;
      }
    }

LABEL_154:
    __break(1u);
LABEL_155:
    __break(1u);
LABEL_156:
    __break(1u);
LABEL_157:
    __break(1u);
LABEL_158:
    __break(1u);
LABEL_159:
    __break(1u);
LABEL_160:
    __break(1u);
LABEL_161:
    __break(1u);
LABEL_162:
    __break(1u);
LABEL_163:
    __break(1u);
LABEL_164:
    __break(1u);
LABEL_165:
    __break(1u);
LABEL_166:
    __break(1u);
LABEL_167:
    __break(1u);
LABEL_168:
    __break(1u);
    return;
  }

  uint64_t v175 = v2;
  uint64_t v24 = 0LL;
  Swift::Int v25 = (char *)_swiftEmptyArrayStorage;
  uint64_t v26 = v20;
  v172 = v9;
  v162 = v12;
  while (1)
  {
    uint64_t v27 = (uint64_t)v24;
    uint64_t v28 = v24 + 1;
    v164 = v25;
    v166 = v24;
    if ((uint64_t)(v24 + 1) >= v26)
    {
      uint64_t v41 = (uint64_t)(v24 + 1);
      uint64_t v42 = v175;
    }

    else
    {
      uint64_t v29 = *v180;
      uint64_t v30 = v181[9];
      uint64_t v31 = (void (*)(char *, uint64_t, uint64_t))v181[2];
      uint64_t v32 = v175;
      v31(v160, *v180 + v30 * (void)v28, v175);
      uint64_t v173 = v29;
      uint64_t v179 = v30;
      uint64_t v33 = ((uint64_t (*)(char *, uint64_t, uint64_t))v31)(v161, v29 + v30 * v27, v32);
      uint64_t v34 = RuntimePlatform.description.getter(v33);
      uint64_t v36 = v35;
      uint64_t v37 = RuntimePlatform.description.getter(v34);
      if (v34 == v37 && v36 == v38)
      {
        LODWORD(v178) = 0;
        uint64_t v40 = v36;
      }

      else
      {
        uint64_t v40 = v38;
        LODWORD(v178) = _stringCompareWithSmolCheck(_:_:expecting:)(v34, v36, v37, v38, 1LL);
      }

      swift_bridgeObjectRelease(v36);
      swift_bridgeObjectRelease(v40);
      uint64_t v43 = (void (*)(char *, uint64_t))v181[1];
      uint64_t v42 = v175;
      v43(v161, v175);
      v43(v160, v42);
      uint64_t v27 = (uint64_t)v166;
      uint64_t v41 = (uint64_t)(v166 + 2);
      if ((uint64_t)(v166 + 2) < v26)
      {
        v176 = (char *)v26;
        uint64_t v174 = v179 * (void)v28;
        uint64_t v44 = v173;
        uint64_t v45 = v179 * v41;
        while (1)
        {
          uint64_t v46 = v41;
          v31(v168, v44 + v45, v42);
          uint64_t v47 = ((uint64_t (*)(char *, uint64_t, uint64_t))v31)(v169, v44 + v174, v42);
          uint64_t v48 = RuntimePlatform.description.getter(v47);
          uint64_t v50 = v49;
          uint64_t v51 = RuntimePlatform.description.getter(v48);
          if (v48 == v51 && v50 == v52)
          {
            int v55 = 0;
            uint64_t v54 = v50;
          }

          else
          {
            uint64_t v54 = v52;
            int v55 = _stringCompareWithSmolCheck(_:_:expecting:)(v48, v50, v51, v52, 1LL);
          }

          swift_bridgeObjectRelease(v50);
          swift_bridgeObjectRelease(v54);
          uint64_t v42 = v175;
          v43(v169, v175);
          v43(v168, v42);
          ++v41;
          v44 += v179;
          if (v46 + 1 >= (uint64_t)v176)
          {
            uint64_t v26 = (uint64_t)v176;
            uint64_t v41 = (uint64_t)v176;
            uint64_t v12 = v162;
            uint64_t v27 = (uint64_t)v166;
            goto LABEL_24;
          }
        }

        uint64_t v12 = v162;
        uint64_t v27 = (uint64_t)v166;
        uint64_t v26 = (uint64_t)v176;
      }

LABEL_137:
  uint64_t v155 = v157;
  *(void *)(v157 + 16) = 0LL;
  swift_bridgeObjectRelease(v155);
}

uint64_t sub_10003EF70(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
    while (2)
    {
      Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
      uint64_t result = *v9;
      uint64_t v10 = v9[1];
      uint64_t v11 = v6;
      uint64_t v12 = (uint64_t *)v8;
      do
      {
        uint64_t v13 = *(v12 - 2);
        uint64_t v14 = *(v12 - 1);
        if (result == v13 && v10 == v14) {
          break;
        }
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v10, v13, v14, 1LL);
        if ((result & 1) == 0) {
          break;
        }
        if (!v7)
        {
          __break(1u);
          return result;
        }

        uint64_t result = *v12;
        uint64_t v10 = v12[1];
        *(_OWORD *)uint64_t v12 = *((_OWORD *)v12 - 1);
        *(v12 - 1) = v10;
        *(v12 - 2) = result;
        v12 -= 2;
        ++v11;
      }

      while (v4 != v11);
      ++v4;
      v8 += 16LL;
      if (v4 != a2) {
        continue;
      }
      break;
    }
  }

  return result;
}

uint64_t sub_10003F034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v45 = a4;
  uint64_t v38 = a1;
  uint64_t v41 = type metadata accessor for RuntimePlatform(0LL);
  uint64_t v46 = *(void **)(v41 - 8);
  uint64_t v6 = __chkstk_darwin(v41);
  uint64_t v43 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v36 - v9;
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v36 - v12;
  uint64_t v42 = a3;
  uint64_t v37 = a2;
  if (a3 != a2)
  {
    uint64_t v14 = v46[9];
    uint64_t v39 = (uint64_t (*)(char *, uint64_t, uint64_t))v46[2];
    uint64_t v40 = v14;
    uint64_t v48 = v14 * (v42 - 1);
    uint64_t v47 = v14 * v42;
    while (2)
    {
      uint64_t v15 = 0LL;
      uint64_t v16 = v38;
      uint64_t v17 = v41;
      while (1)
      {
        uint64_t v18 = *v45;
        uint64_t v44 = v47 + v15;
        uint64_t v19 = v39;
        v39(v13, v47 + v15 + v18, v17);
        uint64_t v20 = v19(v10, v48 + v15 + v18, v17);
        uint64_t v21 = RuntimePlatform.description.getter(v20);
        uint64_t v22 = v10;
        uint64_t v24 = v23;
        uint64_t v25 = RuntimePlatform.description.getter(v21);
        if (v21 == v25 && v24 == v26) {
          break;
        }
        uint64_t v28 = v26;
        char v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v24, v25, v26, 1LL);
        swift_bridgeObjectRelease(v24);
        swift_bridgeObjectRelease(v28);
        uint64_t v30 = (void (*)(char *, uint64_t))v46[1];
        v30(v22, v17);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v30)(v13, v17);
        uint64_t v10 = v22;
        if ((v29 & 1) != 0)
        {
          uint64_t v31 = *v45;
          if (!*v45)
          {
            __break(1u);
            return result;
          }

          uint64_t v32 = v31 + v47 + v15;
          uint64_t v33 = v31 + v48 + v15;
          uint64_t v34 = (void (*)(char *, uint64_t, uint64_t))v46[4];
          uint64_t v17 = v41;
          v34(v43, v32, v41);
          swift_arrayInitWithTakeFrontToBack(v32, v33, 1LL, v17);
          uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v34)(v33, v43, v17);
          v15 -= v40;
          ++v16;
          uint64_t v10 = v22;
          if (v42 != v16) {
            continue;
          }
        }

        goto LABEL_13;
      }

      swift_bridgeObjectRelease_n(v24, 2LL);
      uint64_t v35 = (void (*)(char *, uint64_t))v46[1];
      v35(v22, v17);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v35)(v13, v17);
      uint64_t v10 = v22;
LABEL_13:
      v48 += v40;
      v47 += v40;
      if (++v42 != v37) {
        continue;
      }
      break;
    }
  }

  return result;
}

uint64_t sub_10003F308(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = (a2 - __src) / 16;
  uint64_t v10 = a3 - (void)a2;
  uint64_t v11 = (uint64_t)(a3 - (void)a2) / 16;
  if (v9 >= v11)
  {
    sub_100051430(a2, (uint64_t)(a3 - (void)a2) / 16, __dst);
    uint64_t v12 = &v4[16 * v11];
    if (v7 >= v6 || v10 < 16) {
      goto LABEL_47;
    }
    uint64_t v20 = (char *)(a3 - 16);
    while (1)
    {
      uint64_t v21 = v20 + 16;
      uint64_t v22 = *((void *)v12 - 2);
      uint64_t v23 = *((void *)v12 - 1);
      uint64_t v24 = v12 - 16;
      uint64_t v25 = *((void *)v6 - 2);
      uint64_t v26 = *((void *)v6 - 1);
      BOOL v27 = v22 == v25 && v23 == v26;
      if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v22, v23, v25, v26, 1LL) & 1) == 0)
      {
        BOOL v29 = v21 != v12 || v20 >= v12;
        v12 -= 16;
        if (!v29) {
          goto LABEL_43;
        }
      }

      else
      {
        BOOL v28 = v21 != v6 || v20 >= v6;
        uint64_t v24 = v6 - 16;
        v6 -= 16;
        if (!v28) {
          goto LABEL_43;
        }
      }

      *(_OWORD *)uint64_t v20 = *(_OWORD *)v24;
LABEL_43:
      v20 -= 16;
      if (v6 <= v7 || v12 <= v4) {
        goto LABEL_47;
      }
    }
  }

  sub_100051430(__src, (a2 - __src) / 16, __dst);
  uint64_t v12 = &v4[16 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      uint64_t v14 = *((void *)v6 + 1);
      uint64_t v15 = *((void *)v4 + 1);
      BOOL v16 = *(void *)v6 == *(void *)v4 && v14 == v15;
      if (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v6, v14, *(void *)v4, v15, 1LL) & 1) != 0) {
        break;
      }
      uint64_t v17 = v4;
      BOOL v16 = v7 == v4;
      v4 += 16;
      if (!v16) {
        goto LABEL_15;
      }
LABEL_16:
      v7 += 16;
    }

    uint64_t v17 = v6;
    BOOL v16 = v7 == v6;
    v6 += 16;
    if (v16) {
      goto LABEL_16;
    }
LABEL_15:
    *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
    goto LABEL_16;
  }

void sub_10003F4AC(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8 = type metadata accessor for RuntimePlatform(0LL);
  uint64_t v9 = __chkstk_darwin(v8);
  unint64_t v81 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v80 = (char *)&v73 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  __chkstk_darwin(v13);
  BOOL v16 = (char *)&v73 - v15;
  uint64_t v82 = v17;
  uint64_t v18 = *(void *)(v17 + 72);
  if (!v18)
  {
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }

  int64_t v19 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000LL && v18 == -1) {
    goto LABEL_91;
  }
  int64_t v21 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000LL && v18 == -1) {
    goto LABEL_92;
  }
  uint64_t v78 = v14;
  uint64_t v79 = v18;
  uint64_t v23 = v19 / v18;
  uint64_t v24 = v21 / v18;
  if (v19 / v18 >= v21 / v18)
  {
    sub_1000514A0(a2, v21 / v18, a4);
    unint64_t v25 = a4 + v24 * v18;
    if (v24 * v18 < 1 || a1 >= a2) {
      goto LABEL_22;
    }
    uint64_t v78 = -v18;
    uint64_t v51 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v82 + 16);
    unint64_t v74 = a4;
    uint64_t v75 = v51;
    unint64_t v76 = a1;
    while (1)
    {
      unint64_t v52 = a3;
      unint64_t v83 = v25;
      uint64_t v53 = v78;
      unint64_t v77 = v25 + v78;
      uint64_t v54 = v75;
      ((void (*)(char *))v75)(v80);
      unint64_t v55 = a2 + v53;
      unint64_t v56 = a2 + v53;
      uint64_t v57 = v8;
      uint64_t v58 = v54(v81, v56, v8);
      uint64_t v59 = RuntimePlatform.description.getter(v58);
      uint64_t v61 = v60;
      uint64_t v63 = RuntimePlatform.description.getter(v59);
      if (v59 == v63 && v61 == v62)
      {
        char v66 = 0;
        uint64_t v65 = v61;
      }

      else
      {
        uint64_t v65 = v62;
        char v66 = _stringCompareWithSmolCheck(_:_:expecting:)(v59, v61, v63, v62, 1LL);
      }

      swift_bridgeObjectRelease(v61);
      swift_bridgeObjectRelease(v65);
      a3 = v52 + v78;
      uint64_t v67 = *(void (**)(char *, uint64_t))(v82 + 8);
      uint64_t v8 = v57;
      v67(v81, v57);
      v67(v80, v57);
      unint64_t v68 = v76;
      if ((v66 & 1) != 0)
      {
        BOOL v69 = v52 < a2 || a3 >= a2;
        uint64_t v18 = v79;
        if (v69)
        {
          swift_arrayInitWithTakeFrontToBack(a3, v55, 1LL, v8);
        }

        else if (v52 != a2)
        {
          swift_arrayInitWithTakeBackToFront(a3);
        }

        a2 = v55;
        a4 = v74;
        unint64_t v25 = v83;
        goto LABEL_84;
      }

      BOOL v70 = v52 < v83 || a3 >= v83;
      uint64_t v18 = v79;
      if (v70)
      {
        unint64_t v71 = v77;
        swift_arrayInitWithTakeFrontToBack(a3, v77, 1LL, v8);
      }

      else
      {
        if (v52 == v83)
        {
          unint64_t v25 = v77;
          goto LABEL_83;
        }

        unint64_t v71 = v77;
        swift_arrayInitWithTakeBackToFront(a3);
      }

      unint64_t v25 = v71;
LABEL_83:
      a4 = v74;
LABEL_84:
      if (v25 <= a4 || a2 <= v68) {
        goto LABEL_22;
      }
    }
  }

  sub_1000514A0(a1, v19 / v18, a4);
  unint64_t v25 = a4 + v23 * v18;
  if (v23 * v18 >= 1 && a2 < a3)
  {
    uint64_t v80 = *(char **)(v82 + 16);
    unint64_t v81 = v16;
    uint64_t v30 = v78;
    unint64_t v83 = a4 + v23 * v18;
    unint64_t v77 = a3;
    while (1)
    {
      uint64_t v31 = (uint64_t (*)(uint64_t, unint64_t, uint64_t))v80;
      ((void (*)(char *, unint64_t, uint64_t))v80)(v16, a2, v8);
      uint64_t v32 = v31(v30, a4, v8);
      uint64_t v33 = v8;
      uint64_t v34 = RuntimePlatform.description.getter(v32);
      uint64_t v36 = v35;
      uint64_t v37 = RuntimePlatform.description.getter(v34);
      if (v34 == v37 && v36 == v38) {
        break;
      }
      uint64_t v40 = v38;
      char v41 = _stringCompareWithSmolCheck(_:_:expecting:)(v34, v36, v37, v38, 1LL);
      uint64_t v42 = v30;
      char v43 = v41;
      swift_bridgeObjectRelease(v36);
      swift_bridgeObjectRelease(v40);
      uint64_t v44 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
      v44(v42, v33);
      v44((uint64_t)v16, v33);
      uint64_t v8 = v33;
      if ((v43 & 1) == 0) {
        goto LABEL_39;
      }
      uint64_t v18 = v79;
      unint64_t v45 = a2 + v79;
      BOOL v46 = a1 < a2 || a1 >= v45;
      unint64_t v47 = v77;
      if (!v46)
      {
        uint64_t v30 = v78;
        if (a1 != a2) {
          swift_arrayInitWithTakeBackToFront(a1);
        }
        unint64_t v25 = v83;
        goto LABEL_49;
      }

      swift_arrayInitWithTakeFrontToBack(a1, a2, 1LL, v8);
LABEL_48:
      unint64_t v25 = v83;
      uint64_t v30 = v78;
LABEL_49:
      a1 += v18;
      BOOL v50 = a4 >= v25 || v45 >= v47;
      a2 = v45;
      if (v50) {
        goto LABEL_16;
      }
    }

    swift_bridgeObjectRelease_n(v36, 2LL);
    uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v82 + 8);
    v48(v30, v33);
    v48((uint64_t)v16, v33);
    uint64_t v8 = v33;
LABEL_39:
    uint64_t v18 = v79;
    BOOL v49 = a1 < a4 || a1 >= a4 + v79;
    unint64_t v47 = v77;
    if (v49)
    {
      swift_arrayInitWithTakeFrontToBack(a1, a4, 1LL, v8);
    }

    else if (a1 != a4)
    {
      swift_arrayInitWithTakeBackToFront(a1);
    }

    unint64_t v45 = a2;
    a4 += v18;
    goto LABEL_48;
  }

LABEL_16:
  a2 = a1;
LABEL_22:
  int64_t v28 = v25 - a4;
  if (v18 != -1 || v28 != 0x8000000000000000LL)
  {
    sub_1000514A0(a4, v28 / v18, a2);
    return;
  }

LABEL_93:
  __break(1u);
}

char *sub_10003F9CC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000844C(&qword_10006A490);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || &v14[16 * v8] <= v13) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v13, v14, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_10003FAC0(uint64_t a1)
{
  return sub_10003F9CC(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

void sub_10003FAD4(uint64_t a1)
{
}

void sub_10003FAE8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a3);
  [a4 postNotificationName:a1 object:a2 userInfo:isa];
}

uint64_t sub_10003FB70()
{
  uint64_t v1 = *(void *)(sub_100047790() - 8);
  uint64_t v2 = *(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = v2 | 7;
  sub_100047304();

  sub_1000431A8(v0 + v3, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  uint64_t v5 = sub_10000F674();
  return swift_deallocObject(v5, v6, v4);
}

uint64_t sub_10003FBDC()
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + v6;
  uint64_t v8 = (void *)swift_task_alloc(dword_10006A14C);
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_10003FC64;
  return sub_10001711C(v2, v0, v4, v5, v7);
}

uint64_t sub_10003FC64()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10003FC90(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10003FCA4(result, a2);
  }
  return result;
}

uint64_t sub_10003FCA4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain(result);
  }

  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10003FCE8(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10003FCFC(result, a2);
  }
  return result;
}

uint64_t sub_10003FCFC(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release(result);
  }

  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t type metadata accessor for ToolKitIndexer.SharedIndexingState()
{
  return objc_opt_self(&OBJC_CLASS____TtCC24BackgroundShortcutRunner14ToolKitIndexer19SharedIndexingState);
}

uint64_t *sub_10003FD60(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v12);
  }

  else
  {
    uint64_t v7 = type metadata accessor for TypeIdentifier(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Locale(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  }

  return a1;
}

uint64_t sub_10003FE08(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TypeIdentifier(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for Locale(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

uint64_t sub_10003FE64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TypeIdentifier(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Locale(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 16LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_10003FEE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TypeIdentifier(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Locale(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_10003FF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TypeIdentifier(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Locale(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_10003FFD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TypeIdentifier(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = type metadata accessor for Locale(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 40LL))(v8, v9, v10);
  return a1;
}

uint64_t sub_100040054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100040060);
}

uint64_t sub_100040060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (v6)
  {
    uint64_t v8 = sub_100046AC8();
  }

  else
  {
    uint64_t v7 = sub_100045374();
    uint64_t v8 = a1 + *(int *)(a3 + 20);
  }

  return sub_1000455E8(v8, a2, v7);
}

uint64_t sub_1000400AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000400B8);
}

uint64_t sub_1000400B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (v8)
  {
    uint64_t v9 = v7;
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v9 = sub_100045374();
    uint64_t v10 = a1 + *(int *)(a4 + 20);
  }

  return sub_1000455F4(v10, a2, a2, v9);
}

uint64_t type metadata accessor for ToolKitIndexer.TypeRegistryKey(uint64_t a1)
{
  return sub_10000D5BC(a1, qword_10006A298, (uint64_t)&nominal type descriptor for ToolKitIndexer.TypeRegistryKey);
}

uint64_t sub_100040124(uint64_t a1)
{
  uint64_t result = type metadata accessor for TypeIdentifier(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for Locale(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v5, a1 + 16);
      return 0LL;
    }
  }

  return result;
}

void *initializeBufferWithCopyOfBuffer for ToolKitIndexer.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for ToolKitIndexer.Error(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

void *assignWithCopy for ToolKitIndexer.Error(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for ToolKitIndexer.Error(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for ToolKitIndexer.Error(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolKitIndexer.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for ToolKitIndexer.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

uint64_t sub_1000402FC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100040314(void *result, int a2)
{
  if (a2 < 0)
  {
    *__n128 result = a2 ^ 0x80000000;
    result[1] = 0LL;
  }

  else if (a2)
  {
    result[1] = (a2 - 1);
  }

  return result;
}

ValueMetadata *type metadata accessor for ToolKitIndexer.Error()
{
  return &type metadata for ToolKitIndexer.Error;
}

void sub_100040344()
{
}

void sub_100040370(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    uint64_t v3 = a2(255LL);
    atomic_store(sub_10004764C(v3), a1);
  }

  sub_100008D60();
}

void sub_1000403A4(uint64_t a1)
{
}

uint64_t sub_1000403BC(void *a1)
{
  id v2 = [a1 languageCode];

  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

void sub_100040428(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];
  if (v3)
  {
    sub_100046E8C((uint64_t)v3);
  }

  sub_1000460C4();
  sub_10000F6AC();
}

uint64_t sub_100040474(void *a1)
{
  id v2 = [a1 availabilityAnnotations];

  if (!v2) {
    return 0LL;
  }
  type metadata accessor for LNPlatformName(0LL);
  uint64_t v4 = v3;
  uint64_t v5 = sub_10000E518(0LL, &qword_10006A458, &OBJC_CLASS___LNAvailabilityAnnotation_ptr);
  sub_100040370(&qword_10006A460, (uint64_t (*)(uint64_t))type metadata accessor for LNPlatformName);
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v2, v4, v5, v6);

  return v7;
}

void sub_100040528(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v5 = v4;
  if (v3 != static String._unconditionallyBridgeFromObjectiveC(_:)(a2) || v5 != v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = sub_1000477EC();
    sub_10004320C(v9, v10, v11, v8);
  }

  sub_100042E4C();
  sub_100008D58();
  sub_10000F6AC();
}

uint64_t sub_100040594(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 56;
  uint64_t v7 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v12 = 0LL;
    uint64_t v10 = 0LL;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    void v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }

  uint64_t v10 = a3;
  if (!a3)
  {
    int64_t v12 = 0LL;
    goto LABEL_38;
  }

  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v11 = a2;
  int64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int64_t v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  unint64_t v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    uint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }

    v11 += 2;
    __n128 result = swift_bridgeObjectRetain(v21);
    if (v9) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v14) {
      goto LABEL_33;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    if (!v18) {
      break;
    }
LABEL_18:
    unint64_t v9 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v17 << 6);
    int64_t v12 = v17;
  }

  v12 += 2LL;
  if (v17 + 1 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18) {
    goto LABEL_14;
  }
  int64_t v19 = v17 + 2;
  if (v17 + 2 >= v14) {
    goto LABEL_33;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18) {
    goto LABEL_17;
  }
  int64_t v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    unint64_t v9 = 0LL;
    int64_t v12 = v17 + 2;
    goto LABEL_37;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    int64_t v17 = v12;
    goto LABEL_18;
  }

  int64_t v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    unint64_t v9 = 0LL;
LABEL_37:
    uint64_t v10 = v13;
    goto LABEL_38;
  }

  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    int64_t v17 = v19;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v17 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v17 >= v14)
    {
      unint64_t v9 = 0LL;
      int64_t v12 = v14 - 1;
      goto LABEL_37;
    }

    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v19;
    if (v18) {
      goto LABEL_18;
    }
  }

LABEL_41:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_100040794()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_1000407C4()
{
  id v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v4 = (void *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc(dword_10006A2FC);
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10003FC64;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_10006A2F8 + dword_10006A2F8))(v2, v3, v4);
}

uint64_t sub_100040830(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100040850(uint64_t a1)
{
  return sub_100033E70(a1);
}

uint64_t sub_100040868(uint64_t a1)
{
  return sub_1000339D8(a1, *(void *)(v1 + 16));
}

void sub_100040880(unint64_t *a1, unint64_t *a2, void *a3)
{
  if (!*a1)
  {
    uint64_t v4 = sub_10000E518(255LL, a2, a3);
    atomic_store(sub_10004764C(v4), a1);
  }

  sub_100008D60();
}

uint64_t sub_1000408B4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t sub_1000408CC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t sub_1000408E4(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

unint64_t sub_1000408F4()
{
  unint64_t result = qword_10006A348;
  if (!qword_10006A348)
  {
    unint64_t result = swift_getWitnessTable(&unk_100059A9C, &type metadata for ToolKitIndexer.IncompatibleActionReason);
    atomic_store(result, (unint64_t *)&qword_10006A348);
  }

  return result;
}

uint64_t sub_100040930(uint64_t result, char a2)
{
  if (a2 == 1) {
    return swift_errorRetain();
  }
  if (!a2) {
    return swift_bridgeObjectRetain(result);
  }
  return result;
}

uint64_t sub_10004094C(uint64_t result, char a2)
{
  if (a2 == 1) {
    return swift_errorRelease();
  }
  if (!a2) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

uint64_t sub_100040968()
{
  uint64_t v0 = sub_100046DDC();
  return swift_deallocObject(v0, v1, v2);
}

void sub_100040980()
{
}

_BYTE **sub_10004099C(_BYTE **result)
{
  uint64_t v2 = *result;
  _BYTE *v2 = *(_BYTE *)(v1 + 16);
  *unint64_t result = v2 + 1;
  return result;
}

uint64_t sub_1000409B4(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100038028(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t _s15ActionParameterVMa(uint64_t a1)
{
  return sub_10000D5BC(a1, qword_10006A5E0, (uint64_t)&_s15ActionParameterVMn);
}

uint64_t sub_1000409D0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for RuntimePlatform(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  int64_t v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = __chkstk_darwin(v10);
  unint64_t v15 = (char *)&v32 - v14;
  uint64_t v39 = a4;
  uint64_t v18 = *(void *)(a4 + 56);
  uint64_t v17 = a4 + 56;
  uint64_t v16 = v18;
  uint64_t v37 = v17;
  uint64_t v19 = -1LL << *(_BYTE *)(v17 - 24);
  if (-v19 < 64) {
    uint64_t v20 = ~(-1LL << -(char)v19);
  }
  else {
    uint64_t v20 = -1LL;
  }
  unint64_t v21 = v20 & v16;
  if (!a2)
  {
    int64_t v22 = 0LL;
    a3 = 0LL;
LABEL_38:
    uint64_t v31 = v37;
    *a1 = v39;
    a1[1] = v31;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }

  if (!a3)
  {
    int64_t v22 = 0LL;
    goto LABEL_38;
  }

  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }

  uint64_t v34 = -1LL << *(_BYTE *)(v17 - 24);
  uint64_t v35 = a1;
  int64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  int64_t v36 = (unint64_t)(63 - v19) >> 6;
  int64_t v33 = v36 - 1;
  uint64_t v38 = a3;
  if (!v21) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  unint64_t v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    uint64_t v29 = *(void *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v12, *(void *)(v39 + 48) + v29 * v25, v8);
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v15, v12, v8);
    uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v15, v8);
    a3 = v38;
    if (v23 == v38) {
      goto LABEL_37;
    }
    a2 += v29;
    if (v21) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v26 = v22 + 1;
    if (__OFADD__(v22, 1LL))
    {
      __break(1u);
      goto LABEL_40;
    }

    if (v26 >= v36) {
      goto LABEL_32;
    }
    unint64_t v27 = *(void *)(v37 + 8 * v26);
    if (!v27) {
      break;
    }
LABEL_18:
    unint64_t v21 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v26 << 6);
    int64_t v22 = v26;
  }

  v22 += 2LL;
  if (v26 + 1 >= v36)
  {
    unint64_t v21 = 0LL;
    int64_t v22 = v26;
    goto LABEL_36;
  }

  unint64_t v27 = *(void *)(v37 + 8 * v22);
  if (v27) {
    goto LABEL_14;
  }
  int64_t v28 = v26 + 2;
  if (v26 + 2 >= v36) {
    goto LABEL_32;
  }
  unint64_t v27 = *(void *)(v37 + 8 * v28);
  if (v27) {
    goto LABEL_17;
  }
  int64_t v22 = v26 + 3;
  if (v26 + 3 >= v36)
  {
    unint64_t v21 = 0LL;
    int64_t v22 = v26 + 2;
    goto LABEL_36;
  }

  unint64_t v27 = *(void *)(v37 + 8 * v22);
  if (v27)
  {
LABEL_14:
    int64_t v26 = v22;
    goto LABEL_18;
  }

  int64_t v28 = v26 + 4;
  if (v26 + 4 >= v36)
  {
LABEL_32:
    unint64_t v21 = 0LL;
LABEL_36:
    a3 = v23;
LABEL_37:
    uint64_t v19 = v34;
    a1 = v35;
    goto LABEL_38;
  }

  unint64_t v27 = *(void *)(v37 + 8 * v28);
  if (v27)
  {
LABEL_17:
    int64_t v26 = v28;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v26 = v28 + 1;
    if (__OFADD__(v28, 1LL)) {
      break;
    }
    if (v26 >= v36)
    {
      unint64_t v21 = 0LL;
      int64_t v22 = v33;
      goto LABEL_36;
    }

    unint64_t v27 = *(void *)(v37 + 8 * v26);
    ++v28;
    if (v27) {
      goto LABEL_18;
    }
  }

uint64_t sub_100040C98@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
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

int64_t sub_100040CD4(int64_t result, int a2, char a3, uint64_t a4)
{
  if ((a3 & 1) != 0) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1LL << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }

  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }

  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }

  unint64_t v8 = v7 & (-2LL << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0LL;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }

  return result;
}

void sub_100040DB8(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if ((a1 & 0x8000000000000000LL) != 0 || (sub_100045550(), v7 <= v6))
  {
    __break(1u);
    goto LABEL_7;
  }

  if (((*(void *)(v5 + ((a1 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> a1) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(_DWORD *)(v5 + 36) == v4)
  {
    uint64_t v8 = *(void *)(v5 + 48);
    uint64_t v9 = sub_100044E9C();
    sub_10004422C( a2,  v8 + *(void *)(*(void *)(v9 - 8) + 72LL) * a1,  v9,  *(uint64_t (**)(void))(*(void *)(v9 - 8) + 16LL));
    return;
  }

LABEL_8:
  __break(1u);
}

uint64_t sub_100040E40()
{
  uint64_t v1 = sub_100046DDC();
  return swift_deallocObject(v1, v2, v3);
}

id sub_100040E5C()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_100040E64()
{
  uint64_t v1 = sub_100046DDC();
  return swift_deallocObject(v1, v2, v3);
}

void sub_100040E80()
{
}

void sub_100040EAC(uint64_t *a1, void **a2, uint64_t a3)
{
}

uint64_t sub_100040EBC()
{
  return sub_100037EF0(*(uint64_t (**)(void))(v0 + 16));
}

void sub_100040EC4()
{
}

unint64_t sub_100040EE0()
{
  unint64_t result = qword_10006A408;
  if (!qword_10006A408)
  {
    uint64_t v1 = sub_10000D89C(&qword_10006A400);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10006A408);
  }

  return result;
}

uint64_t sub_100040F24@<X0>(uint64_t a1@<X8>)
{
  return sub_100034F38(v1, a1);
}

uint64_t sub_100040F2C()
{
  return sub_100037CBC(*(void (**)(uint64_t))(v0 + 16));
}

uint64_t sub_100040F3C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100040F64()
{
  uint64_t v1 = sub_100046DCC();
  return swift_deallocObject(v1, v2, v3);
}

void sub_100040F80()
{
  __n128 v1 = sub_100045D18();
  sub_100035308( v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v1.n128_i64[0],  v1.n128_i64[1],  v10,  *(void *)(v0 + 104),  *(void *)(v0 + 112),  *(void **)(v0 + 120),  *(void *)(v0 + 128),  *(void **)(v0 + 136),  *(void *)(v0 + 144));
}

void sub_100040FB8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2 = sub_1000477B0(a1, a2);
  sub_100045080(*(void *)(v2 - 8));
  sub_100008D60();
}

void sub_100040FE0()
{
  __n128 v1 = sub_100045D18();
  sub_1000363C8( v2,  v3,  v4,  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t **)v1.n128_u64[0],  (uint64_t *)v1.n128_u64[1],  v11,  v12,  *(char **)(v0 + 104));
  sub_100047054();
}

uint64_t sub_100041008(uint64_t a1)
{
  return sub_1000367F8( a1,  *(void *)(v1 + 16),  *(void **)(v1 + 24),  *(void *)(v1 + 32),  *(void **)(v1 + 40),  *(void *)(v1 + 48),  *(void **)(v1 + 56),  *(void *)(v1 + 64),  *(_OWORD *)(v1 + 72),  *(_OWORD *)(v1 + 88),  *(_OWORD *)(v1 + 104),  *(_OWORD *)(v1 + 120),  *(_OWORD *)(v1 + 136),  *(void *)(v1 + 152));
}

uint64_t sub_10004105C(uint64_t a1)
{
  return sub_100036960(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100041074(uint64_t a1)
{
  return sub_1000369E8(a1, *(uint64_t **)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10004108C(uint64_t a1)
{
  return sub_100036B00(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

void sub_1000410A4(int a1)
{
}

uint64_t sub_1000410BC(uint64_t a1)
{
  return sub_100037040(a1, *(void *)(v1 + 16), *(void **)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_1000410D8(uint64_t a1)
{
  return sub_100036D40(a1, *(void *)(v1 + 16), *(uint64_t **)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40));
}

void sub_1000410F4(int a1)
{
}

void sub_100041110(uint64_t a1)
{
}

uint64_t sub_100041128(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
  if (v1)
  {
    uint64_t v2 = 0LL;
    return __clz(__rbit64(v1)) + v2;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v3 = 1LL << v5;
  if (v6 < 7) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64LL;
    return __clz(__rbit64(v1)) + v2;
  }

  uint64_t v2 = 64LL;
  for (uint64_t i = 9LL; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64LL;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

void sub_1000411A8()
{
}

void sub_1000411BC(uint64_t a1)
{
}

void *sub_1000411D0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_1000411F4()
{
  uint64_t v1 = sub_100046DCC();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_100041218()
{
  return sub_10001F358(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_100041230(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_100045FE4(a1, a2, a3);
  sub_100045440(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_100008D60();
}

void sub_100041264(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3 = sub_100045FE4(a1, a2, a3);
  sub_100045440(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_100008D60();
}

void sub_100041298()
{
}

void sub_1000412CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_100046EA0(a1, a2, a3);
  sub_100045440(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL));
  sub_100008D60();
}

void sub_1000412F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = sub_100046EA0(a1, a2, a3);
  sub_100045440(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 32LL));
  sub_100008D60();
}

void sub_100041324()
{
}

void sub_100041358(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = sub_10000844C(a2);
  sub_100045080(*(void *)(v2 - 8));
  sub_100008D60();
}

uint64_t _s27ActionParameterLocalizationVwxx(void *a1)
{
  return swift_bridgeObjectRelease(a1[5]);
}

void *_s27ActionParameterLocalizationVwcp(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

void *_s27ActionParameterLocalizationVwca(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 _s27ActionParameterLocalizationVwtk(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *_s27ActionParameterLocalizationVwta(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[3];
  uint64_t v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[5];
  uint64_t v9 = a1[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t _s27ActionParameterLocalizationVwet(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      unint64_t v2 = *(void *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF) {
        LODWORD(v2) = -1;
      }
    }
  }

  else
  {
    LODWORD(v2) = -1;
  }

  return (v2 + 1);
}

uint64_t _s27ActionParameterLocalizationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 48) = 1;
    }
  }

  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *_s27ActionParameterLocalizationVMa()
{
  return &_s27ActionParameterLocalizationVN;
}

uint64_t *sub_10004159C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v26 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v26);
  }

  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a3[7];
    __int128 v10 = (char *)a1 + v9;
    unint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for TypeDefinition(0LL);
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL);
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    v13(v10, v11, v12);
    uint64_t v14 = a3[8];
    unint64_t v15 = (char *)v4 + v14;
    uint64_t v16 = (char *)a2 + v14;
    uint64_t v17 = type metadata accessor for TypeInstance(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 16LL))(v15, v16, v17);
    uint64_t v18 = a3[9];
    uint64_t v19 = (char *)v4 + v18;
    uint64_t v20 = (char *)a2 + v18;
    uint64_t v21 = type metadata accessor for ParameterDefinition.ParameterFlags(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 16LL))(v19, v20, v21);
    uint64_t v22 = a3[10];
    uint64_t v23 = a3[11];
    uint64_t v24 = *(uint64_t *)((char *)a2 + v22);
    *(uint64_t *)((char *)v4 + v22) = v24;
    uint64_t v25 = *(uint64_t *)((char *)a2 + v23);
    *(uint64_t *)((char *)v4 + v23) = v25;
    swift_bridgeObjectRetain(v24);
    swift_bridgeObjectRetain(v25);
  }

  return v4;
}

uint64_t sub_1000416D8(uint64_t a1, int *a2)
{
  uint64_t v4 = a1 + a2[7];
  uint64_t v5 = type metadata accessor for TypeDefinition(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  uint64_t v6 = a1 + a2[8];
  uint64_t v7 = type metadata accessor for TypeInstance(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8LL))(v6, v7);
  uint64_t v8 = a1 + a2[9];
  uint64_t v9 = type metadata accessor for ParameterDefinition.ParameterFlags(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8LL))(v8, v9);
  swift_bridgeObjectRelease(*(void *)(a1 + a2[10]));
  return swift_bridgeObjectRelease(*(void *)(a1 + a2[11]));
}

void *sub_100041790(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a3[7];
  uint64_t v9 = (char *)a1 + v8;
  __int128 v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for TypeDefinition(0LL);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  v12(v9, v10, v11);
  uint64_t v13 = a3[8];
  uint64_t v14 = (char *)a1 + v13;
  unint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for TypeInstance(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v16 - 8) + 16LL))(v14, v15, v16);
  uint64_t v17 = a3[9];
  uint64_t v18 = (char *)a1 + v17;
  uint64_t v19 = (char *)a2 + v17;
  uint64_t v20 = type metadata accessor for ParameterDefinition.ParameterFlags(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v20 - 8) + 16LL))(v18, v19, v20);
  uint64_t v21 = a3[10];
  uint64_t v22 = a3[11];
  uint64_t v23 = *(void *)((char *)a2 + v21);
  *(void *)((char *)a1 + v21) = v23;
  uint64_t v24 = *(void *)((char *)a2 + v22);
  *(void *)((char *)a1 + v22) = v24;
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRetain(v24);
  return a1;
}

void *sub_1000418A0(void *a1, void *a2, int *a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for TypeDefinition(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 24LL))(v11, v12, v13);
  uint64_t v14 = a3[8];
  unint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for TypeInstance(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 24LL))(v15, v16, v17);
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = type metadata accessor for ParameterDefinition.ParameterFlags(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 24LL))(v19, v20, v21);
  uint64_t v22 = a3[10];
  uint64_t v23 = *(void *)((char *)a2 + v22);
  uint64_t v24 = *(void *)((char *)a1 + v22);
  *(void *)((char *)a1 + v22) = v23;
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRelease(v24);
  uint64_t v25 = a3[11];
  uint64_t v26 = *(void *)((char *)a2 + v25);
  uint64_t v27 = *(void *)((char *)a1 + v25);
  *(void *)((char *)a1 + v25) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  return a1;
}

_OWORD *sub_1000419D4(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a3[7];
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for TypeDefinition(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 32LL))(v8, v9, v10);
  uint64_t v11 = a3[8];
  uint64_t v12 = (char *)a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = type metadata accessor for TypeInstance(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 32LL))(v12, v13, v14);
  uint64_t v15 = a3[9];
  uint64_t v16 = (char *)a1 + v15;
  uint64_t v17 = (char *)a2 + v15;
  uint64_t v18 = type metadata accessor for ParameterDefinition.ParameterFlags(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v18 - 8) + 32LL))(v16, v17, v18);
  uint64_t v19 = a3[11];
  *(void *)((char *)a1 + a3[10]) = *(void *)((char *)a2 + a3[10]);
  *(void *)((char *)a1 + v19) = *(void *)((char *)a2 + v19);
  return a1;
}

void *sub_100041AAC(void *a1, void *a2, int *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[3];
  uint64_t v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a3[7];
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for TypeDefinition(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 40LL))(v11, v12, v13);
  uint64_t v14 = a3[8];
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for TypeInstance(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v17 - 8) + 40LL))(v15, v16, v17);
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)a2 + v18;
  uint64_t v21 = type metadata accessor for ParameterDefinition.ParameterFlags(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 40LL))(v19, v20, v21);
  uint64_t v22 = a3[10];
  uint64_t v23 = *(void *)((char *)a1 + v22);
  *(void *)((char *)a1 + v22) = *(void *)((char *)a2 + v22);
  swift_bridgeObjectRelease(v23);
  uint64_t v24 = a3[11];
  uint64_t v25 = *(void *)((char *)a1 + v24);
  *(void *)((char *)a1 + v24) = *(void *)((char *)a2 + v24);
  swift_bridgeObjectRelease(v25);
  return a1;
}

uint64_t sub_100041BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100041BBC);
}

void sub_100041BBC(uint64_t a1, uint64_t a2, int *a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    sub_10000F6AC();
  }

  else
  {
    sub_100047778();
    sub_1000468B0();
    if (v9)
    {
      uint64_t v7 = v6;
      uint64_t v8 = a3[7];
    }

    else
    {
      sub_100047780();
      sub_1000468B0();
      if (v9)
      {
        uint64_t v7 = v10;
        uint64_t v8 = a3[8];
      }

      else
      {
        uint64_t v7 = sub_100047798();
        uint64_t v8 = a3[9];
      }
    }

    sub_1000455E8(a1 + v8, a2, v7);
  }

uint64_t sub_100041C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100041C58);
}

void sub_100041C58(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + 8) = (a2 - 1);
    sub_10000F6AC();
  }

  else
  {
    sub_100047778();
    sub_1000468C0();
    if (v10)
    {
      uint64_t v8 = v7;
      uint64_t v9 = a4[7];
    }

    else
    {
      sub_100047780();
      sub_1000468C0();
      if (v10)
      {
        uint64_t v8 = v11;
        uint64_t v9 = a4[8];
      }

      else
      {
        uint64_t v8 = sub_100047798();
        uint64_t v9 = a4[9];
      }
    }

    sub_1000455F4(a1 + v9, a2, a2, v8);
  }

uint64_t sub_100041CE4(uint64_t a1)
{
  v6[0] = &unk_1000599F0;
  v6[1] = (char *)&value witness table for Builtin.Int64 + 64;
  uint64_t v6[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
  uint64_t result = type metadata accessor for TypeDefinition(319LL);
  if (v3 <= 0x3F)
  {
    v6[3] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for TypeInstance(319LL);
    if (v4 <= 0x3F)
    {
      v6[4] = *(void *)(result - 8) + 64LL;
      uint64_t result = type metadata accessor for ParameterDefinition.ParameterFlags(319LL);
      if (v5 <= 0x3F)
      {
        v6[5] = *(void *)(result - 8) + 64LL;
        v6[6] = (char *)&value witness table for Builtin.BridgeObject + 64;
        v6[7] = (char *)&value witness table for Builtin.BridgeObject + 64;
        swift_initStructMetadata(a1, 256LL, 8LL, v6, a1 + 16);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ToolKitIndexer.ActionIndexingReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_100040930(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for ToolKitIndexer.ActionIndexingReport(uint64_t a1)
{
  return sub_10004094C(*(void *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for ToolKitIndexer.ActionIndexingReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(_BYTE *)(a2 + 8);
  sub_100040930(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  *(void *)a1 = v3;
  char v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_10004094C(v5, v6);
  return a1;
}

uint64_t initializeWithTake for ToolKitIndexer.ActionIndexingReport(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for ToolKitIndexer.ActionIndexingReport(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 8);
  uint64_t v4 = *(void *)a1;
  *(void *)a1 = *(void *)a2;
  char v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_10004094C(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolKitIndexer.ActionIndexingReport(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToolKitIndexer.ActionIndexingReport( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 9) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 9) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 8) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100041F2C(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100041F44(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)uint64_t result = a2 - 2;
    LOBYTE(a2) = 2;
  }

  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ToolKitIndexer.ActionIndexingReport()
{
  return &type metadata for ToolKitIndexer.ActionIndexingReport;
}

uint64_t destroy for ToolKitIndexer.IncompatibleActionReason(uint64_t a1)
{
  return sub_1000408CC(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s24BackgroundShortcutRunner14ToolKitIndexerC24IncompatibleActionReasonOwCP_0( uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  unsigned __int8 v5 = *((_BYTE *)a2 + 16);
  uint64_t v6 = sub_10000F674();
  sub_1000408B4(v6, v7, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ToolKitIndexer.IncompatibleActionReason(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_1000408B4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1000408CC(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ToolKitIndexer.IncompatibleActionReason(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ToolKitIndexer.IncompatibleActionReason(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1000408CC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolKitIndexer.IncompatibleActionReason(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }

    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }

  else
  {
    int v2 = -1;
  }

  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToolKitIndexer.IncompatibleActionReason( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_1000420F4(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_10004210C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0LL;
    LOBYTE(a2) = 2;
  }

  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ToolKitIndexer.IncompatibleActionReason()
{
  return &type metadata for ToolKitIndexer.IncompatibleActionReason;
}

unint64_t sub_100042138()
{
  unint64_t result = qword_10006A630;
  if (!qword_10006A630)
  {
    unint64_t result = swift_getWitnessTable(&unk_100059A4C, &type metadata for ToolKitIndexer.IncompatibleActionReason);
    atomic_store(result, (unint64_t *)&qword_10006A630);
  }

  return result;
}

uint64_t sub_1000421E4()
{
  return swift_task_alloc(v0);
}

#error "10004241C: call analysis failed (funcsize=141)"
#error "100042640: call analysis failed (funcsize=137)"
uint64_t sub_100042644(uint64_t a1, uint64_t a2)
{
  return swift_allocObject(a1, a2, 7LL);
}

uint64_t sub_10004264C()
{
  uint64_t v2 = v0[204];
  STACK[0x200] = v0[109];
  STACK[0x208] = v0[108];
  STACK[0x210] = v0[107];
  STACK[0x228] = v0[103];
  STACK[0x230] = v0[100];
  STACK[0x238] = v0[97];
  STACK[0x240] = v0[96];
  STACK[0x248] = v0[95];
  STACK[0x250] = v0[94];
  STACK[0x258] = v0[91];
  uint64_t v3 = v0[89];
  *(void *)(v1 - 256) = v0[90];
  *(void *)(v1 - 248) = v3;
  uint64_t v4 = v0[87];
  *(void *)(v1 - 240) = v0[88];
  *(void *)(v1 - 232) = v4;
  uint64_t v5 = v0[83];
  *(void *)(v1 - 216) = v0[86];
  *(void *)(v1 - 208) = v5;
  uint64_t v6 = v0[81];
  *(void *)(v1 - 200) = v0[82];
  *(void *)(v1 - 192) = v6;
  return swift_task_dealloc(v2);
}

uint64_t sub_100042810()
{
  uint64_t v2 = v0[204];
  STACK[0x200] = v0[109];
  STACK[0x208] = v0[108];
  uint64_t v3 = v0[103];
  *(void *)(v1 - 256) = v0[107];
  *(void *)(v1 - 248) = v3;
  uint64_t v4 = v0[97];
  *(void *)(v1 - 240) = v0[100];
  *(void *)(v1 - 232) = v4;
  uint64_t v5 = v0[95];
  *(void *)(v1 - 224) = v0[96];
  *(void *)(v1 - 216) = v5;
  uint64_t v6 = v0[91];
  *(void *)(v1 - 208) = v0[94];
  *(void *)(v1 - 200) = v6;
  uint64_t v7 = v0[89];
  *(void *)(v1 - 192) = v0[90];
  *(void *)(v1 - 184) = v7;
  uint64_t v8 = v0[87];
  *(void *)(v1 - 176) = v0[88];
  *(void *)(v1 - 168) = v8;
  uint64_t v9 = v0[83];
  *(void *)(v1 - 152) = v0[86];
  *(void *)(v1 - 144) = v9;
  uint64_t v10 = v0[81];
  *(void *)(v1 - 136) = v0[82];
  *(void *)(v1 - 128) = v10;
  return swift_task_dealloc(v2);
}

uint64_t sub_1000429C4(uint64_t a1)
{
  STACK[0x200] = v1[110];
  STACK[0x208] = v1[109];
  STACK[0x210] = v1[108];
  STACK[0x218] = v1[107];
  STACK[0x220] = v1[103];
  STACK[0x228] = v1[100];
  STACK[0x230] = v1[97];
  STACK[0x238] = v1[96];
  STACK[0x240] = v1[95];
  STACK[0x248] = v1[94];
  uint64_t v3 = v1[90];
  *(void *)(v2 - 256) = v1[91];
  *(void *)(v2 - 248) = v3;
  uint64_t v4 = v1[88];
  *(void *)(v2 - 240) = v1[89];
  *(void *)(v2 - 232) = v4;
  uint64_t v5 = v1[86];
  *(void *)(v2 - 224) = v1[87];
  *(void *)(v2 - 216) = v5;
  uint64_t v6 = v1[82];
  *(void *)(v2 - 208) = v1[83];
  *(void *)(v2 - 200) = v6;
  *(void *)(v2 - 192) = v1[81];
  return swift_task_dealloc(a1);
}

void sub_100042B6C()
{
  uint64_t v2 = v0[110];
  *(void *)(v1 - 256) = v0[111];
  *(void *)(v1 - 248) = v2;
  uint64_t v3 = v0[108];
  *(void *)(v1 - 240) = v0[109];
  *(void *)(v1 - 232) = v3;
  uint64_t v4 = v0[103];
  *(void *)(v1 - 224) = v0[107];
  *(void *)(v1 - 216) = v4;
  uint64_t v5 = v0[97];
  *(void *)(v1 - 208) = v0[100];
  *(void *)(v1 - 200) = v5;
  uint64_t v6 = v0[95];
  *(void *)(v1 - 192) = v0[96];
  *(void *)(v1 - 184) = v6;
  uint64_t v7 = v0[91];
  *(void *)(v1 - 176) = v0[94];
  *(void *)(v1 - 168) = v7;
  uint64_t v8 = v0[89];
  *(void *)(v1 - 160) = v0[90];
  *(void *)(v1 - 152) = v8;
  uint64_t v9 = v0[87];
  *(void *)(v1 - 144) = v0[88];
  *(void *)(v1 - 136) = v9;
}

uint64_t sub_100042CE8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

#error "100042E48: call analysis failed (funcsize=85)"
uint64_t sub_100042E4C()
{
  uint64_t v0;
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100042E54()
{
  return swift_task_dealloc(*(void *)(v0 + 232));
}

uint64_t sub_100042EB0()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_100042ECC()
{
  return swift_task_dealloc(*(void *)(v0 + 232));
}

uint64_t sub_100042F20()
{
  return dispatch thunk of Actor.unownedExecutor.getter(v0);
}

  ;
}

uint64_t sub_100043000(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return sub_100038A18(a1, a2, a3);
}

uint64_t sub_100043024()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10004302C()
{
  return swift_task_dealloc(*(void *)(v0 + 232));
}

uint64_t sub_100043084(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 104LL))(v2, v1, a1);
}

uint64_t sub_1000430A0(uint64_t a1)
{
  return sub_100048784(a1, v1);
}

id sub_1000430AC@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 + 32);
}

uint64_t sub_1000430B4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000430D0()
{
  return ((uint64_t (*)(void))ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:))();
}

uint64_t sub_1000430EC()
{
  return ((uint64_t (*)(void))WFParameter.toolkitTypeDefinition(for:localizationContext:))();
}

  ;
}

uint64_t sub_100043124@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_100043130(uint64_t a1)
{
  return sub_100048784(a1, v1);
}

uint64_t sub_100043138(uint64_t a1, uint64_t a2)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, 1953392980LL, 0xE400000000000000LL, 0LL);
}

uint64_t sub_10004314C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_100043154(uint64_t a1, uint64_t a2)
{
  return swift_beginAccess(a1, a2, 0LL, 0LL);
}

  ;
}

uint64_t sub_10004316C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100043174()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10004317C()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_100043184@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  return a1(v1);
}

  ;
}

uint64_t sub_1000431A8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

id sub_1000431B0()
{
  return v0;
}

void sub_1000431B8(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_1000431C0()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t sub_1000431C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(a2, v2 + *(void *)(v3 + 72) * a1);
}

uint64_t sub_1000431DC()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1000431E4()
{
  uint64_t v5 = *(void *)(v1 + 1144);
  uint64_t v6 = *(_BYTE **)(v1 + 1128);
  uint64_t v7 = &v6[*(int *)(*(void *)(v4 - 248) + 48LL)];
  *uint64_t v6 = v3;
  return v2(v7, v0, v5);
}

uint64_t sub_10004320C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, a4, 0LL);
}

uint64_t sub_100043214(uint64_t (*a1)(void))
{
  return a1();
}

void sub_100043230()
{
}

uint64_t sub_100043238(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 2LL);
}

uint64_t sub_100043240()
{
  return type metadata accessor for MainActor(0LL);
}

uint64_t sub_100043248()
{
  return v0(v1, v2);
}

uint64_t sub_100043254()
{
  return sub_100034CC4(v0, v1);
}

void sub_100043260()
{
  uint64_t v2 = v0[254];
  *(void *)(v1 - 240) = v0[234];
  *(void *)(v1 - 232) = v0[209];
  *(void *)(v1 - 224) = v2;
  STACK[0x250] = v0[194];
  STACK[0x258] = v0[162];
  uint64_t v3 = v0[77];
  *(void *)(v1 - 256) = v0[157];
  *(void *)(v1 - 248) = v3;
  STACK[0x248] = *(void *)(*(void *)(v1 - 184) + 592LL);
  *(void *)(*(void *)(v1 - 184) + 480LL) = *(void *)(*(void *)(v1 - 184) + 584LL);
}

  ;
}

uint64_t sub_1000432E0(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_1000432E8()
{
  return type metadata accessor for ToolIcon(0LL);
}

uint64_t sub_1000432F0()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000432F8()
{
  return (*(uint64_t (**)(void, unint64_t, void))(*(void *)(v1 - 256) + 16LL))( *(void *)(*(void *)(v1 - 184) + 944LL),  *(void *)(v1 - 208)
         + ((*(unsigned __int8 *)(*(void *)(v1 - 256) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 256) + 80LL))
         + *(void *)(*(void *)(v1 - 256) + 72LL) * v0,
           *(void *)(*(void *)(v1 - 184) + 920LL));
}

uint64_t sub_10004332C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, unint64_t))(a2 + 16))( a1,  *(void *)(v3 - 216)
}

uint64_t sub_100043350( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, 11LL, 2LL, a4, a5, a6, 45LL, 2LL, a9, a10);
}

uint64_t sub_100043364(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return sub_100038A18(a1, a2, a3);
}

uint64_t sub_100043380@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

  ;
}

uint64_t sub_1000433B0(uint64_t a1)
{
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v2;
  *(_BYTE *)(a1 + 48) = v1 & 1;
  *(void *)(a1 + 56) = STACK[0x250];
  *(void *)(a1 + 64) = v3;
  unint64_t v8 = STACK[0x258];
  *(void *)(a1 + 72) = STACK[0x240];
  *(void *)(a1 + 80) = v8;
  uint64_t v9 = *(void *)(v7 - 256);
  *(void *)(a1 + 88) = *(void *)(v7 - 192);
  *(void *)(a1 + 96) = v9;
  unint64_t v10 = STACK[0x248];
  *(void *)(a1 + 104) = *(void *)(v7 - 240);
  *(void *)(a1 + 112) = v10;
  uint64_t v11 = *(void *)(v7 - 200);
  *(void *)(a1 + 120) = *(void *)(v7 - 248);
  *(void *)(a1 + 128) = v11;
  uint64_t v12 = *(void *)(v7 - 232);
  *(void *)(a1 + 136) = *(void *)(v7 - 216);
  *(void *)(a1 + 144) = v12;
  return type metadata accessor for ToolDatabase.Transaction(0LL);
}

uint64_t sub_100043410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000848C(a1, 1LL, 1LL, a4);
}

id sub_10004341C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

void sub_100043424()
{
}

uint64_t sub_100043434(uint64_t a1, uint64_t a2)
{
  return WFLogSignpost.init(_:_:_:)(a1, a2, 9LL, 2LL, v2);
}

void sub_100043444()
{
}

uint64_t sub_100043454()
{
  return *(void *)(v0 + 976);
}

uint64_t sub_100043488()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

  ;
}

uint64_t sub_1000434B8()
{
  return swift_release(v0);
}

uint64_t sub_1000434C0(uint64_t a1)
{
  return RuntimeAvailabilityAnnotation.init(platform:introducingVersion:deprecatingVersion:obsoletingVersion:)( v1,  v2,  v3,  v4);
}

uint64_t sub_100043524(uint64_t a1)
{
  return RuntimeAvailabilityAnnotation.init(platform:introducingVersion:deprecatingVersion:obsoletingVersion:)( v1,  v2,  v3,  v4);
}

uint64_t sub_100043588()
{
  uint64_t v1 = *(void **)(v0 - 184);
  STACK[0x228] = (unint64_t)(v1 + 68);
  STACK[0x210] = v1[151];
  STACK[0x200] = (unint64_t)(v1 + 42);
  STACK[0x208] = v1[143];
  STACK[0x240] = v1[138];
  STACK[0x248] = v1[136];
  STACK[0x258] = v1[135];
  return sub_10000D524(22LL);
}

uint64_t sub_1000435DC()
{
  return swift_release(*(void *)(v0 - 200));
}

uint64_t sub_1000435E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  return swift_task_dealloc(a18);
}

  ;
}

  ;
}

uint64_t sub_100043614( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33)
{
  return swift_task_dealloc(a33);
}

uint64_t sub_10004361C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32)
{
  return swift_task_dealloc(a32);
}

uint64_t sub_100043624( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29)
{
  return swift_task_dealloc(a29);
}

uint64_t sub_10004362C(uint64_t result)
{
  *(_BYTE *)STACK[0x240] = (result & 1) == 0;
  return result;
}

void sub_100043650()
{
}

uint64_t sub_100043658( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30)
{
  return swift_task_dealloc(a30);
}

uint64_t sub_100043660( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31)
{
  return swift_task_dealloc(a31);
}

uint64_t sub_100043668(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1LL);
}

void sub_100043670()
{
}

uint64_t sub_100043678()
{
  return swift_release(v0);
}

uint64_t sub_100043680()
{
  uint64_t v2 = v0[233];
  *(void *)(v1 - 208) = v0[209];
  *(void *)(v1 - 200) = v2;
  *(void *)(v1 - 216) = v0[208];
  return v0[204];
}

  ;
}

uint64_t sub_1000436BC()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1000436C4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28)
{
  return swift_task_dealloc(a28);
}

  ;
}

uint64_t sub_1000436E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27)
{
  return swift_task_dealloc(a27);
}

uint64_t sub_1000436F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26)
{
  return swift_task_dealloc(a26);
}

uint64_t sub_1000436F8(uint64_t a1)
{
  return RuntimeAvailabilityAnnotation.init(platform:introducingVersion:deprecatingVersion:obsoletingVersion:)( v1,  v3,  v4,  v2);
}

uint64_t sub_100043758@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 224) = v1;
  uint64_t v4 = v2[162];
  uint64_t v5 = v2[159];
  *(void *)(v3 - 240) = v2[158];
  *(void *)(v3 - 232) = v4;
  *(void *)(v3 - 256) = v2[157];
  *(void *)(v3 - 248) = v5;
  STACK[0x258] = v2[155];
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t sub_1000437A4()
{
  return ((uint64_t (*)(void))KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:))();
}

uint64_t sub_1000437C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10001FCC0(a1, a2, a3, a4, a5);
}

uint64_t sub_1000437DC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000437F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36)
{
  return swift_task_dealloc(a36);
}

uint64_t sub_100043800@<X0>(uint64_t a1@<X8>)
{
  return sub_100037F50(*(void *)(a1 + 16), v1);
}

BOOL sub_100043810(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100043820@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t sub_100043828(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_beginAccess(a1, a2, a3, 0LL);
}

uint64_t sub_100043830@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v6 = &a1[*(int *)(v1 + 48)];
  *a1 = v5;
  return v4(v6, v2, v3);
}

uint64_t sub_10004384C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
{
  return swift_task_dealloc(a37);
}

id sub_100043854(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_10004385C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_100043868()
{
  return swift_release(v0);
}

uint64_t sub_100043870()
{
  uint64_t v2 = *(void **)(v1 - 184);
  uint64_t v3 = v2[181];
  uint64_t v4 = v2[178];
  uint64_t v5 = v2[177];
  uint64_t v6 = v2[49];
  *(void *)(v6 + ((v0 >> 3) & 0xFFFFFFFFFFFFFF8LL) + 56) |= 1LL << v0;
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v1 - 200))( *(void *)(v6 + 48) + *(void *)(v4 + 72) * v0,  v3,  v5);
}

uint64_t sub_1000438B8()
{
  uint64_t v2 = *(void **)(v1 - 184);
  uint64_t v3 = v2[181];
  uint64_t v4 = v2[178];
  uint64_t v5 = v2[177];
  uint64_t v6 = v2[49];
  *(void *)(v6 + ((v0 >> 3) & 0xFFFFFFFFFFFFFF8LL) + 56) |= 1LL << v0;
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v1 - 200))( *(void *)(v6 + 48) + *(void *)(v4 + 72) * v0,  v3,  v5);
}

uint64_t sub_100043900( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return swift_task_dealloc(a19);
}

uint64_t sub_100043908()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100043910@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_100043918(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_100043920()
{
  return swift_task_dealloc(*(void *)(v0 - 232));
}

uint64_t sub_100043928()
{
  return swift_task_dealloc(*(void *)(v0 - 240));
}

uint64_t sub_100043930()
{
  return swift_task_dealloc(*(void *)(v0 - 248));
}

uint64_t sub_100043938()
{
  return swift_task_dealloc(*(void *)(v0 - 256));
}

uint64_t sub_100043940( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a68);
}

uint64_t sub_100043948( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a67);
}

uint64_t sub_100043950( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a66);
}

uint64_t sub_100043958( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a65);
}

uint64_t sub_100043960( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a64);
}

uint64_t sub_100043968( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a63);
}

uint64_t sub_100043970( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62)
{
  return swift_task_dealloc(a62);
}

uint64_t sub_100043978( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  return swift_task_dealloc(a61);
}

uint64_t sub_100043980( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60)
{
  return swift_task_dealloc(a60);
}

uint64_t sub_100043988( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59)
{
  return swift_task_dealloc(a59);
}

uint64_t sub_100043990( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  return swift_task_dealloc(a58);
}

uint64_t sub_100043998( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57)
{
  return swift_task_dealloc(a57);
}

uint64_t sub_1000439A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56)
{
  return swift_task_dealloc(a56);
}

uint64_t sub_1000439A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55)
{
  return swift_task_dealloc(a55);
}

uint64_t sub_1000439B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54)
{
  return swift_task_dealloc(a54);
}

uint64_t sub_1000439B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  return swift_task_dealloc(a53);
}

uint64_t sub_1000439C0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52)
{
  return swift_task_dealloc(a52);
}

uint64_t sub_1000439C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51)
{
  return swift_task_dealloc(a51);
}

uint64_t sub_1000439D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50)
{
  return swift_task_dealloc(a50);
}

uint64_t sub_1000439D8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49)
{
  return swift_task_dealloc(a49);
}

uint64_t sub_1000439E0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48)
{
  return swift_task_dealloc(a48);
}

uint64_t sub_1000439E8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47)
{
  return swift_task_dealloc(a47);
}

uint64_t sub_1000439F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46)
{
  return swift_task_dealloc(a46);
}

uint64_t sub_1000439F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45)
{
  return swift_task_dealloc(a45);
}

uint64_t sub_100043A00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44)
{
  return swift_task_dealloc(a44);
}

uint64_t sub_100043A08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43)
{
  return swift_task_dealloc(a43);
}

uint64_t sub_100043A10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42)
{
  return swift_task_dealloc(a42);
}

uint64_t sub_100043A18( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41)
{
  return swift_task_dealloc(a41);
}

uint64_t sub_100043A20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40)
{
  return swift_task_dealloc(a40);
}

uint64_t sub_100043A28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39)
{
  return swift_task_dealloc(a39);
}

uint64_t sub_100043A30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38)
{
  return swift_task_dealloc(a38);
}

uint64_t sub_100043A38()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 400));
}

uint64_t sub_100043A40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  return swift_task_dealloc(a35);
}

uint64_t sub_100043A48( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34)
{
  return swift_task_dealloc(a34);
}

id sub_100043A50()
{
  STACK[0x248] = v1[162];
  uint64_t v3 = v1[77];
  *(void *)(v2 - 256) = v1[157];
  *(void *)(v2 - 248) = v3;
  STACK[0x230] = v1[74];
  uint64_t v4 = (void *)v1[72];
  v1[60] = v1[73];
  return [v4 *(SEL *)(v0 + 528)];
}

uint64_t sub_100043A98()
{
  return (*(uint64_t (**)(void, void, void))(v1 + 32))(v0[121], v0[118], v0[115]);
}

void sub_100043ADC(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100043AE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  return swift_task_dealloc(a20);
}

uint64_t sub_100043AEC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

uint64_t sub_100043AF8(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

uint64_t sub_100043B04()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 488));
}

uint64_t sub_100043B0C(uint64_t a1)
{
  return swift_bridgeObjectRetain(a1);
}

uint64_t sub_100043B50()
{
  return swift_release(v0);
}

uint64_t sub_100043B58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(a1 + 136) = v2;
  *(void *)(a1 + 144) = a2;
  return type metadata accessor for ToolDatabase.Transaction(0LL);
}

uint64_t sub_100043B64()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 456));
}

  ;
}

uint64_t sub_100043B84@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(void, uint64_t, void))(v2 + 104))( *(void *)(a2 + 904),  a1,  *(void *)(a2 + 920));
}

uint64_t sub_100043B9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100034FA8(a1, *(void *)(a2 + 960));
}

uint64_t sub_100043BB4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return swift_task_dealloc(a17);
}

uint64_t sub_100043BBC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return swift_task_dealloc(a16);
}

  ;
}

  ;
}

uint64_t sub_100043BF0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100043BF8()
{
  return swift_release(*(void *)(v0 - 240));
}

uint64_t sub_100043C00@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_100043C08@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_100043C10()
{
  return sub_10000E518(0LL, v0, v1);
}

id sub_100043C20()
{
  return v0;
}

uint64_t sub_100043C28()
{
  return swift_errorRelease(v0);
}

uint64_t sub_100043C30()
{
  return dispatch thunk of static Equatable.== infix(_:_:)(v0, v1, v3, v2);
}

uint64_t sub_100043C48()
{
  return swift_release(v0);
}

uint64_t sub_100043C50()
{
  return dispatch thunk of static Equatable.== infix(_:_:)(v2, v1, v3, v0);
}

uint64_t sub_100043C68()
{
  return dispatch thunk of static Equatable.== infix(_:_:)(v2, v1, v3, v0);
}

uint64_t sub_100043C80()
{
  *(void *)(v2 - 200) = v1[131];
  return (*(uint64_t (**)(void, void, void))(v0 + 32))(v1[121], v1[118], v1[115]);
}

uint64_t sub_100043CBC(uint64_t a1, uint64_t a2)
{
  return IndexingLog.log(failedIndexOfTypeWithDescription:in:metadata:)(v3, v4, v2, a1, a2);
}

uint64_t sub_100043CDC(uint64_t a1)
{
  return v3(a1, v1, v2);
}

uint64_t sub_100043CE8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  return swift_task_dealloc(a15);
}

uint64_t sub_100043CF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  return swift_task_dealloc(a11);
}

uint64_t sub_100043CF8(uint64_t a1)
{
  return v3(a1, v1, v2);
}

uint64_t sub_100043D04(uint64_t a1)
{
  return swift_dynamicCastObjCProtocolConditional(a1, 1LL, v1);
}

uint64_t sub_100043D10@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_100043D18(uint64_t a1)
{
  return sub_100034FA8(a1, *(void *)(*(void *)(v1 - 184) + 960LL));
}

uint64_t sub_100043D38(uint64_t a1)
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(a1, *(void *)(v1 - 248), *(void *)(v1 - 256));
}

uint64_t sub_100043D44()
{
  return swift_task_dealloc(*(void *)(v0 - 224));
}

uint64_t sub_100043D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of static Equatable.== infix(_:_:)(a1, a2, a3, v3);
}

void sub_100043D54(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
}

uint64_t sub_100043D5C()
{
  return swift_retain(v0);
}

uint64_t sub_100043D64()
{
  return swift_errorRetain(v0);
}

void sub_100043D6C()
{
}

uint64_t sub_100043D74()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100043D7C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_100043D84()
{
  return *(void *)(v0 + 1632);
}

uint64_t sub_100043D94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  return swift_task_dealloc(a14);
}

uint64_t sub_100043D9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return swift_task_dealloc(a12);
}

uint64_t sub_100043DA4()
{
  return swift_release(v0);
}

uint64_t sub_100043DAC()
{
  return swift_task_dealloc(*(void *)(v0 - 208));
}

uint64_t sub_100043DB4()
{
  return swift_task_dealloc(*(void *)(v0 - 216));
}

uint64_t sub_100043DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000084E0(a1, a2, a3);
}

uint64_t sub_100043DD0()
{
  return swift_release(v0);
}

uint64_t sub_100043DD8()
{
  return (*(uint64_t (**)(void, void, void))(v0 + 32))(v1[121], v1[118], v1[115]);
}

uint64_t sub_100043E10()
{
  return sub_1000531E4();
}

uint64_t sub_100043E18()
{
  return swift_release(*(void *)(v0 - 232));
}

uint64_t sub_100043E20()
{
  return swift_task_dealloc(STACK[0x208]);
}

uint64_t sub_100043E28()
{
  return swift_task_dealloc(STACK[0x200]);
}

uint64_t sub_100043E30( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a72);
}

uint64_t sub_100043E38( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a71);
}

uint64_t sub_100043E40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a70);
}

uint64_t sub_100043E48( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  return swift_task_dealloc(a69);
}

uint64_t sub_100043E50()
{
  return swift_task_dealloc(*(void *)(v0 - 192));
}

void sub_100043E58()
{
  uint64_t v1 = *(void *)(*(void *)(v0 - 184) + 1296LL);
  uint64_t v2 = *(void *)(*(void *)(v0 - 184) + 1272LL);
  *(void *)(v0 - 232) = *(void *)(*(void *)(v0 - 184) + 1264LL);
  *(void *)(v0 - 224) = v1;
  *(void *)(v0 - 248) = *(void *)(*(void *)(v0 - 184) + 1256LL);
  *(void *)(v0 - 240) = v2;
}

uint64_t sub_100043E98()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_100043EA0()
{
  return sub_10003BDEC(v0);
}

uint64_t sub_100043EA8(uint64_t a1)
{
  *(void *)(v1 - 96) = a1;
  return type metadata accessor for WFDeviceIdiomResource(0LL);
}

uint64_t sub_100043EB8()
{
  return type metadata accessor for WFDeviceCapabilityResource(0LL);
}

uint64_t sub_100043EC4()
{
  *(void *)(v0 - 208) = *(void *)(*(void *)(v0 - 184) + 1056LL);
  return sub_1000531F0(*(void *)(v0 - 200));
}

BOOL sub_100043ED8(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100043EE8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  return swift_task_dealloc(a24);
}

uint64_t sub_100043EF0()
{
  return swift_task_dealloc(*(void *)(v0 - 200));
}

uint64_t sub_100043EF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return swift_task_dealloc(a13);
}

uint64_t sub_100043F00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a13, a12);
}

uint64_t sub_100043F10()
{
  return WFFeatureFlagResource.domain.getter();
}

uint64_t sub_100043F1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(a1, v2 + a2 + *(void *)(v3 + 72) * v4);
}

BOOL sub_100043F30(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100043F40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  return swift_task_dealloc(a25);
}

uint64_t sub_100043F48( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a14 + 8))(a16, a15);
}

uint64_t sub_100043F5C(uint64_t a1)
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)(v1, a1);
}

void sub_100043F68()
{
}

uint64_t sub_100043F74()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(v0);
}

uint64_t sub_100043F84()
{
  return swift_release(*(void *)(v0 - 248));
}

uint64_t sub_100043F8C(uint64_t a1)
{
  return swift_task_dealloc(a1);
}

uint64_t sub_100043F9C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_100043FA4()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 464));
}

uint64_t sub_100043FB8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 104LL))(v1, v2, a1);
}

uint64_t sub_100043FD4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_100043FDC()
{
  return swift_retain(v0);
}

uint64_t sub_100043FE4()
{
  return sub_1000388B0(v1, v0);
}

uint64_t sub_100043FF0()
{
  return dispatch thunk of SetAlgebra.formUnion(_:)(v0, v1, v2);
}

uint64_t sub_100044004()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 536));
}

uint64_t sub_10004400C()
{
  uint64_t v1 = *(void **)(v0 - 184);
  STACK[0x248] = (unint64_t)(v1 + 56);
  uint64_t v2 = v1[132];
  *(void *)(v0 - 240) = v1[127];
  *(void *)(v0 - 232) = v2;
  STACK[0x258] = v1[117];
  *(void *)(v0 - 256) = v1[116];
  return sub_100052268(*(void *)(v0 - 208));
}

uint64_t sub_10004403C()
{
  return v0;
}

uint64_t sub_100044050(char a1)
{
  void *v2 = v5;
  uint64_t v8 = *(void *)(v7 - 216);
  *(void *)(v8 + 8) = v6;
  *(void *)(v8 + 16) = v3;
  *(void *)(v8 + 24) = v4;
  *(_BYTE *)(v8 + 32) = a1 & 1;
  return (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v7 - 224) + 104LL))( v2,  *(unsigned int *)(v7 - 240),  v1);
}

void sub_100044080()
{
}

uint64_t sub_100044088()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 200));
}

  ;
}

uint64_t sub_1000440B0()
{
  return *(void *)(v0 + 1256);
}

uint64_t sub_1000440C4()
{
  return swift_release(*(void *)(v0 - 208));
}

uint64_t sub_1000440CC()
{
  return swift_release(*(void *)(v0 - 216));
}

uint64_t sub_1000440D4()
{
  uint64_t v3 = v1[11];
  uint64_t v4 = v1[9];
  uint64_t v5 = v1[4];
  sub_10000848C(v1[21], v0, 1LL, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v3, v5);
}

uint64_t sub_100044114()
{
  return *(void *)(v0 + 648);
}

uint64_t sub_100044128()
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(v1 - 184) + 32LL))( *(void *)(v0 + 800),  *(void *)(*(void *)(v1 - 120) + 776LL),  *(void *)(*(void *)(v1 - 120) + 784LL));
}

uint64_t sub_100044158()
{
  return *(void *)(v0 + 656);
}

id sub_10004416C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_100044174()
{
  return v0;
}

uint64_t sub_100044180()
{
  return v0;
}

uint64_t sub_10004418C(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_100044194()
{
  *(void *)(v2 - 232) = v0 + 512;
  *(void *)(v2 - 200) = *(void *)(v0 + 848);
  *(void *)(v2 - 256) = *(void *)(v0 + 792);
  return sub_100052268(v1);
}

uint64_t sub_1000441C0()
{
  return static ToolFlag.isDiscontinued.getter();
}

uint64_t sub_1000441D8()
{
  uint64_t v1 = *(void *)(v0 - 184);
  uint64_t v2 = *(void *)(v1 + 1072);
  *(void *)(v0 - 224) = *(void *)(v1 + 1056);
  *(void *)(v0 - 216) = v2;
  return sub_1000531F0(*(void *)(v0 - 200));
}

void sub_1000441F0( void *a1, os_log_s *a2, os_signpost_type_t a3, os_signpost_id_t a4, const char *a5, const char *a6)
{
}

uint64_t sub_1000441FC()
{
  return (*(uint64_t (**)(uint64_t, void, void))(*(void *)(v1 - 232) + 104LL))( v0,  *(unsigned int *)(v1 - 248),  *(void *)(v1 - 200));
}

uint64_t sub_100044214(uint64_t a1)
{
  return dispatch thunk of static Equatable.== infix(_:_:)(v2, v1, v3, a1);
}

uint64_t sub_10004422C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_100044238()
{
  return (*(uint64_t (**)(void, unint64_t, void))(v1 + 16))( *(void *)(v0 + 1232),  *(void *)(v3 - 208)
         + ((*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
         + *(void *)(v1 + 72) * v2,
           *(void *)(v0 + 1144));
}

uint64_t sub_100044264()
{
  return static ToolFlag.isDiscontinued.getter();
}

uint64_t sub_100044290()
{
  return (*(uint64_t (**)(void, unint64_t, void))(v0 + 16))( *(void *)(*(void *)(v3 - 184) + 872LL),  v1 + ((*(unsigned __int8 *)(v0 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80))
         + *(void *)(v0 + 72) * v2,
           *(void *)(*(void *)(v3 - 184) + 832LL));
}

uint64_t sub_1000442BC(uint64_t a1)
{
  return swift_arrayDestroy(a1, 2LL);
}

void sub_1000442C4(unint64_t *a1)
{
}

uint64_t sub_1000442D0(_WORD *a1)
{
  *a1 = 0;
  return OSSignpostID.rawValue.getter();
}

uint64_t sub_1000442DC()
{
  return swift_task_dealloc(*(void *)(v0 - 176));
}

uint64_t sub_1000442E4()
{
  return swift_task_dealloc(*(void *)(v0 - 184));
}

uint64_t sub_1000442EC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_1000442F4()
{
  return swift_retain(v0);
}

void sub_1000442FC(uint64_t a1)
{
}

uint64_t sub_100044304(uint64_t a1)
{
  return swift_release_n(a1, 2LL);
}

uint64_t sub_10004430C()
{
  *(void *)(v2 - 168) = v1 + 64;
  *(void *)(v2 - 152) = v1[106];
  *(void *)(v2 - 136) = v1[102];
  *(void *)(v2 - 184) = v1[99];
  return sub_100052268(v0);
}

uint64_t sub_100044338@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 192) = a1;
  uint64_t v4 = v1[154];
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
  uint64_t v6 = v1[153];
  uint64_t v7 = v1[143];
  *(void *)(v3 - 200) = v5;
  return v5(v6, v4, v7);
}

uint64_t sub_100044364@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 192) = a1;
  uint64_t v4 = v1[154];
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32);
  uint64_t v6 = v1[153];
  uint64_t v7 = v1[143];
  *(void *)(v3 - 200) = v5;
  return v5(v6, v4, v7);
}

uint64_t sub_100044390(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 104LL))(v1, v2, a1);
}

void sub_1000443A8()
{
  *(void *)(v0 - 104) = 0LL;
  *(void *)(v0 - 96) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(22LL);
}

uint64_t sub_1000443C0()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1000443C8()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1000443D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v5 - 192) = v4;
  return ToolDatabase.Rollbackable.inSavepoint<A>(name:work:)(a1, v4, a3, v3);
}

uint64_t sub_1000443E8()
{
  return sub_10003C464(v1, v0);
}

uint64_t sub_1000443F4()
{
  return v0;
}

uint64_t sub_100044400()
{
  return swift_retain(v0);
}

uint64_t sub_100044408@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(v3, a1, v2);
}

void sub_100044414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_100044430()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 464));
}

uint64_t sub_100044438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  return swift_dynamicCast(a1, v3, a3 + 8, a2, 6LL);
}

uint64_t sub_100044448()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v0, v1);
}

uint64_t sub_100044458(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, a2, v3);
}

uint64_t sub_100044468(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100044484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(a1, a2 + *(void *)(v3 + 72) * v2);
}

uint64_t sub_100044494()
{
  return v2( *(void *)(*(void *)(v4 - 184) + 1440LL),  *(void *)(v3 + 48) + v1 * v0,  *(void *)(*(void *)(v4 - 184) + 1416LL));
}

uint64_t sub_1000444BC()
{
  return v2( *(void *)(*(void *)(v4 - 184) + 1440LL),  *(void *)(v0 + 48) + v1 * v3,  *(void *)(*(void *)(v4 - 184) + 1416LL));
}

uint64_t sub_1000444E4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(v2 + 104))( *(void *)(*(void *)(v3 - 184) + 912LL),  a2,  *(void *)(*(void *)(v3 - 184) + 920LL));
}

uint64_t sub_10004450C()
{
  return v2( *(void *)(*(void *)(v4 - 184) + 1440LL),  *(void *)(v3 + 48) + v1 * v0,  *(void *)(*(void *)(v4 - 184) + 1416LL));
}

uint64_t sub_100044534()
{
  return v1( *(void *)(*(void *)(v4 - 184) + 1440LL),  *(void *)(v3 + 48) + v0 * v2,  *(void *)(*(void *)(v4 - 184) + 1416LL));
}

uint64_t sub_10004455C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(v2 + 104))( *(void *)(*(void *)(v3 - 184) + 904LL),  a2,  *(void *)(*(void *)(v3 - 184) + 920LL));
}

uint64_t sub_100044584( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23)
{
  return swift_task_dealloc(a23);
}

void sub_10004458C()
{
}

BOOL sub_10004459C()
{
  return sub_10005226C(v0);
}

uint64_t sub_1000445AC()
{
  STACK[0x248] = v0 + 416;
  STACK[0x258] = *(void *)(v0 + 1160);
  *(void *)(v1 - 248) = *(void *)(v0 + 1112);
  return sub_100052268(*(void *)(v1 - 208));
}

uint64_t sub_1000445D4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v4 - 200))(v2, a2, *(void *)(v3 + 1144));
}

void sub_1000445E4()
{
}

uint64_t sub_1000445EC(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, *(void *)(v1 - 200));
}

uint64_t sub_1000445F4()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_100044604()
{
  return *(void *)(v0 + 1320);
}

  ;
}

uint64_t sub_10004462C@<X0>(uint64_t (*a1)(void)@<X8>)
{
  *(void *)(v1 - 200) = a1;
  return a1();
}

uint64_t sub_100044634(uint64_t a1, uint64_t a2)
{
  return dispatch thunk of Hashable._rawHashValue(seed:)(a1, a2, *(void *)(v2 - 208));
}

uint64_t sub_10004463C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100010CA0(a1, a2, a3, a4);
}

uint64_t sub_100044658(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100044674()
{
  return *(void *)(v0 + 8);
}

uint64_t sub_100044680()
{
  return *(void *)(v0 + 16 * v1);
}

uint64_t sub_100044690@<X0>(uint64_t a1@<X8>)
{
  return sub_100037F50(*(void *)(a1 + 16), v1);
}

uint64_t sub_1000446A0()
{
  return swift_retain(v0);
}

uint64_t sub_1000446A8()
{
  return ((uint64_t (*)(void))_diagnoseUnexpectedEnumCase<A>(type:))();
}

uint64_t sub_1000446C4(uint64_t a1)
{
  return _typeName(_:qualified:)(a1, 0LL);
}

uint64_t sub_1000446CC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_1000446D4()
{
  return v2(v0, *(void *)(v1 + 1144));
}

void *sub_1000446E4(void *result)
{
  unint64_t v3 = STACK[0x248];
  result[9] = v1;
  result[10] = v3;
  uint64_t v4 = *(void *)(v2 - 256);
  result[11] = *(void *)(v2 - 192);
  result[12] = v4;
  unint64_t v5 = STACK[0x230];
  result[13] = *(void *)(v2 - 240);
  result[14] = v5;
  uint64_t v6 = *(void *)(v2 - 200);
  result[15] = *(void *)(v2 - 248);
  result[16] = v6;
  return result;
}

uint64_t sub_100044714(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v4 - 200))(v2, a2, *(void *)(v3 + 1144));
}

uint64_t sub_100044724@<X0>(uint64_t a1@<X8>)
{
  return sub_100037F50(*(void *)(a1 + 16), v1);
}

uint64_t sub_100044734@<X0>(uint64_t a1@<X8>)
{
  return sub_100037F50(*(void *)(a1 + 16), v1);
}

uint64_t sub_100044744()
{
  return TypeInstance.collectionIfMultiple(isCollection:)(v0);
}

  ;
}

  ;
}

uint64_t sub_1000447A4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

void sub_1000447AC()
{
}

uint64_t sub_1000447B4()
{
  uint64_t v2 = v0[132];
  *(void *)(v1 - 176) = v0[127];
  *(void *)(v1 - 168) = v2;
  uint64_t v3 = v0[117];
  *(void *)(v1 - 200) = v0 + 56;
  *(void *)(v1 - 192) = v3;
  *(void *)(v1 - 160) = v0[116];
  return sub_100052268(*(void *)(v1 - 136));
}

  ;
}

uint64_t sub_1000447F8()
{
  return swift_release(*(void *)(v0 - 256));
}

uint64_t sub_100044800()
{
  return swift_task_dealloc(STACK[0x248]);
}

uint64_t sub_100044808()
{
  return swift_task_dealloc(STACK[0x240]);
}

uint64_t sub_100044810()
{
  return swift_task_dealloc(STACK[0x238]);
}

uint64_t sub_100044818()
{
  return swift_task_dealloc(STACK[0x230]);
}

uint64_t sub_100044820()
{
  return swift_task_dealloc(STACK[0x228]);
}

uint64_t sub_100044828()
{
  return swift_task_dealloc(STACK[0x210]);
}

uint64_t sub_100044830()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 192));
}

uint64_t sub_100044838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of static Equatable.== infix(_:_:)(a1, v4, v5, a4);
}

void sub_100044848()
{
}

  ;
}

uint64_t sub_10004486C()
{
  return swift_retain(v0);
}

uint64_t sub_100044874(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100038098(a1, v3, a3);
}

uint64_t sub_10004487C(uint64_t a1)
{
  return sub_100037F50(a1, v1);
}

void sub_100044884()
{
  *(void *)(v1 + 8 * (v0 >> 6) + 64) |= 1LL << v0;
}

uint64_t sub_1000448B0()
{
  return v0;
}

uint64_t sub_1000448C4()
{
  return WFDeviceCapabilityResource.capability.getter();
}

uint64_t sub_1000448D0()
{
  return _bridgeAnyObjectToAny(_:)(v0);
}

uint64_t sub_1000448DC()
{
  return swift_task_dealloc(*(void *)(v0 - 136));
}

uint64_t sub_1000448E4()
{
  return static ToolFlag.isHomeResidentCompatible.getter();
}

void sub_100044908(void *a1@<X8>)
{
}

uint64_t sub_10004492C()
{
  *(void *)(v1 - 200) = v0;
  return sub_100050950(v0);
}

uint64_t sub_100044938()
{
  return swift_task_dealloc(*(void *)(v0 - 168));
}

uint64_t sub_100044940( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22)
{
  return swift_task_dealloc(a22);
}

uint64_t sub_100044948()
{
  return swift_task_dealloc(*(void *)(v0 - 144));
}

  ;
}

uint64_t sub_10004497C(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_100044984(uint64_t a1)
{
  return static WFLog.subscript.getter(v1);
}

void sub_1000449A4()
{
}

uint64_t sub_1000449B0()
{
  return swift_errorRelease(v0);
}

uint64_t sub_1000449B8(uint64_t a1)
{
  uint64_t v3 = v1[83];
  *(void *)(v2 - 144) = v1[86];
  *(void *)(v2 - 136) = v3;
  uint64_t v4 = v1[81];
  *(void *)(v2 - 128) = v1[82];
  *(void *)(v2 - 120) = v4;
  *(void *)(v2 - 112) = v1[78];
  return swift_task_dealloc(a1);
}

uint64_t sub_1000449DC(uint64_t result)
{
  *uint64_t v1 = (result & 1) == 0;
  return result;
}

  ;
}

uint64_t sub_1000449FC(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_100044A04(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(a1, v2);
}

uint64_t sub_100044A10()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_100044A18()
{
  return swift_bridgeObjectRelease(**(void **)(v0 - 240));
}

uint64_t sub_100044A2C(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2);
}

uint64_t sub_100044A38@<X0>(void *a1@<X8>)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t sub_100044A40(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 - 184);
  uint64_t v4 = v3[118];
  uint64_t v5 = v3[115];
  v3[56] = a1;
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v1 - 256) + 16LL))( v4,  STACK[0x248],  v5);
}

id sub_100044A64(uint64_t a1, const char *a2)
{
  return [*(id *)(v2 - 224) a2];
}

uint64_t sub_100044A6C(uint64_t a1)
{
  *(void *)(v3 - 256) = a1;
  *(void *)(v3 - 248) = v2;
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(v1, v2, a1);
}

unint64_t sub_100044A80(uint64_t a1)
{
  return v1
}

uint64_t sub_100044AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v4 - 208) = a3;
  return Set.init(minimumCapacity:)(a1, v3);
}

uint64_t sub_100044AB8(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_100044AC0()
{
  return type metadata accessor for IndexingLog(0LL);
}

void sub_100044AC8()
{
}

id sub_100044AD4(uint64_t a1)
{
  *(void *)(v2 + 1880) = a1;
  return v1;
}

void sub_100044AE0(Swift::String a1)
{
}

uint64_t sub_100044AEC@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_100044AF4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  return swift_task_dealloc(a21);
}

uint64_t sub_100044AFC()
{
  return swift_retain(v0);
}

uint64_t sub_100044B04()
{
  return v0;
}

uint64_t sub_100044B10()
{
  return swift_task_alloc(160LL);
}

uint64_t sub_100044B18(uint64_t a1)
{
  return sub_10003C464(a1, v1);
}

id sub_100044B20(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_100044B28()
{
  return v0;
}

uint64_t sub_100044B34()
{
  return swift_retain(v0);
}

uint64_t sub_100044B3C()
{
  return sub_10004094C(v0, 0);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100044BA4()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 136));
}

uint64_t sub_100044BAC()
{
  return sub_10000D524(22LL);
}

uint64_t sub_100044BB4()
{
  return *(void *)(v0 + 576);
}

void sub_100044BCC( void *a1, os_log_s *a2, os_signpost_type_t a3, os_signpost_id_t a4, const char *a5, const char *a6, uint8_t *a7)
{
}

uint64_t sub_100044BD4()
{
  *(void *)(v1 - 216) = v0 + 144;
  STACK[0x250] = v0 + 536;
  return swift_bridgeObjectRelease(*(void *)(v1 - 208));
}

void sub_100044BF4()
{
  *(void *)(v0 - 104) = 0x766974696D697270LL;
  *(void *)(v0 - 96) = 0xEA00000000002065LL;
}

uint64_t sub_100044C1C()
{
  *(void *)(v0 + 1856) = 0LL;
  return swift_bridgeObjectRelease(*(void *)(v0 + 1704));
}

void sub_100044C3C(uint64_t a1)
{
}

  ;
}

uint64_t sub_100044C54()
{
  STACK[0x240] = *(void *)(v0 + 1120);
  return static ToolVisibilityFlag.assistant.getter();
}

uint64_t sub_100044C74()
{
  STACK[0x240] = *(void *)(v0 + 1136);
  return static ToolVisibilityFlag.shortcuts.getter();
}

uint64_t sub_100044C94(uint64_t a1)
{
  return swift_release(a1);
}

uint64_t sub_100044C9C()
{
  return swift_task_dealloc(*(void *)(v0 - 152));
}

uint64_t sub_100044CA4()
{
  return v2(*(void *)(v1 + 728), v0, *(void *)(v1 + 712));
}

void sub_100044CC4(uint64_t a1@<X8>)
{
  *(void *)(v2 - 176) = a1;
  *(void *)(v2 - 168) = (v1 - 32) | 0x8000000000000000LL;
}

uint64_t sub_100044CD4()
{
  uint64_t v2 = *v0;
  *(void *)(v1 - 8) = *v0;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_100044CF4()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 240);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 248) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_100044D14()
{
  uint64_t v3 = *v1;
  uint64_t v4 = (uint64_t *)(v2 - 8);
  *uint64_t v4 = *v1;
  uint64_t v5 = *(void *)(v3 + 264);
  *uint64_t v4 = *v1;
  *(void *)(v3 + 272) = v0;
  return swift_task_dealloc(v5);
}

uint64_t sub_100044D34(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_100044D3C@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  return a1(v1);
}

uint64_t sub_100044D44@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_100044D4C()
{
  return swift_task_dealloc(*(void *)(v0 - 160));
}

uint64_t sub_100044D54()
{
  return swift_retain(v0);
}

uint64_t sub_100044D5C(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

uint64_t sub_100044D64(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100044D78()
{
  *(void *)(v1 + 1856) = v0;
  return swift_bridgeObjectRelease(*(void *)(v1 + 1704));
}

  ;
}

uint64_t sub_100044DA4@<X0>(void *a1@<X8>)
{
  return sub_1000531E4(*a1);
}

uint64_t sub_100044DAC()
{
  return static AssistantSchemaProvider.shared.getter();
}

uint64_t sub_100044DB4(uint64_t a1)
{
  uint64_t v4 = v1[183];
  uint64_t v5 = v1[178];
  uint64_t v6 = v1[177];
  v1[53] = a1;
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 16))(v4, *(void *)(v2 - 248), v6);
}

uint64_t sub_100044DD4()
{
  return static IndexingLog.shared.getter();
}

uint64_t sub_100044DDC(uint64_t a1)
{
  uint64_t v4 = v1[183];
  uint64_t v5 = v1[178];
  uint64_t v6 = v1[177];
  v1[53] = a1;
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v5 + 16))(v4, *(void *)(v2 - 248), v6);
}

uint64_t sub_100044DFC()
{
  return AssistantSchemaProvider.tools.getter();
}

uint64_t sub_100044E04(uint64_t a1)
{
  uint64_t v4 = *(void **)(v2 - 184);
  uint64_t v5 = v4[109];
  uint64_t v6 = v4[104];
  v4[64] = a1;
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v1 + 16))(v5, *(void *)(v2 - 232), v6);
}

  ;
}

uint64_t sub_100044E4C(uint64_t a1)
{
  return dispatch thunk of SetAlgebra.init<A>(_:)(v1, v2, a1, v3, v4);
}

uint64_t sub_100044E6C(uint64_t a1)
{
  return dispatch thunk of SetAlgebra.init<A>(_:)(v2, v1, a1, v3, v4);
}

uint64_t sub_100044E8C(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, v1);
}

uint64_t sub_100044E94()
{
  return type metadata accessor for AssistantSchemaProvider(0LL);
}

uint64_t sub_100044E9C()
{
  return type metadata accessor for TypeIdentifier(0LL);
}

void sub_100044EA4(uint64_t a1, uint64_t *a2)
{
}

  ;
}

uint64_t sub_100044EB8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_100044ED8(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_100044EE0()
{
  return swift_retain(v0);
}

uint64_t sub_100044EE8()
{
  return swift_release(v0);
}

void sub_100044EF0()
{
}

uint64_t sub_100044EF8(uint64_t a1, uint64_t a2)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(v2, a2);
}

uint64_t sub_100044F00()
{
  return sub_1000531E4(v0);
}

uint64_t sub_100044F08()
{
  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_100044F10()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100044F2C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 104))(v1);
}

uint64_t sub_100044F38@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 + 104))();
}

uint64_t sub_100044F40@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 104))(v1);
}

uint64_t sub_100044F4C()
{
  return WFFeatureFlagResource.feature.getter();
}

uint64_t sub_100044F58()
{
  return sub_100052268(v0);
}

double sub_100044F68()
{
  double result = 0.0;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  return result;
}

  ;
}

uint64_t sub_100044F98()
{
  return ToolSymbolIconColor.init(rawValue:)(v1, v0);
}

uint64_t sub_100044FA8()
{
  return sub_100052268(v0);
}

uint64_t sub_100044FB4()
{
  return (*(uint64_t (**)(void, void, void))(v1 - 120))(v0[104], v0[99], v0[97]);
}

uint64_t sub_100044FD0()
{
  return dispatch thunk of SetAlgebra.init()(v0);
}

uint64_t sub_100044FDC()
{
  return swift_task_dealloc(*(void *)(v0 - 128));
}

  ;
}

uint64_t sub_100044FF4(uint64_t result)
{
  *(_BYTE *)(result + 16) = 32;
  return result;
}

uint64_t sub_100045000()
{
  return static ToolFlag.isHomeResidentCompatible.getter();
}

uint64_t sub_10004501C()
{
  return static ToolFlag.isHomeResidentCompatible.getter();
}

  ;
}

void sub_100045054()
{
}

uint64_t sub_100045064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_dynamicCast(a1, a2, a3, v3, 7LL);
}

uint64_t sub_100045070()
{
  return String.hash(into:)(v2 - 176, v1, v0);
}

uint64_t sub_100045080@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_10004508C()
{
  return sub_10003C464(v0, v1);
}

uint64_t sub_10004509C()
{
  return sub_100052278(v1, v2 & 1, v0);
}

uint64_t sub_1000450AC(uint64_t a1)
{
  return dispatch thunk of SetAlgebra.formUnion(_:)(a1, v1, v2);
}

uint64_t sub_1000450B8(uint64_t a1)
{
  uint64_t v3 = sub_1000408B4(a1, v1, v2);
  return Logger.logObject.getter(v3);
}

BOOL sub_1000450D4(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_1000450E4()
{
  return WFDeviceIdiomResource.requirement.getter();
}

uint64_t sub_1000450F0()
{
  return (*(uint64_t (**)(void))(v0 - 280))();
}

void sub_1000450FC()
{
}

uint64_t sub_100045118(uint64_t a1)
{
  return sub_10000848C(a1, 0LL, 1LL, v1);
}

uint64_t sub_100045128()
{
  return static WFLog.subscript.getter(*(void *)(v0 - 288));
}

uint64_t sub_100045134(uint64_t a1, uint64_t a2)
{
  return dispatch thunk of SetAlgebra.intersection(_:)(a1, a2, *(void *)(v2 - 256));
}

void sub_100045140()
{
}

void sub_100045148()
{
}

uint64_t sub_100045150()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(v0, v1);
}

uint64_t sub_10004515C()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 216));
}

uint64_t sub_100045164()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_100045174()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t sub_10004517C()
{
  return ParameterRelationshipDefinition.init(key:relation:)(v2, v0, v1);
}

uint64_t sub_10004518C(uint64_t result)
{
  *(_BYTE *)STACK[0x230] = (result & 1) == 0;
  return result;
}

uint64_t sub_1000451B0(uint64_t result)
{
  *(_DWORD *)(v2 - 232) = result;
  STACK[0x208] = v1 + 1208;
  STACK[0x228] = v1 + 1184;
  STACK[0x230] = v1 + 1200;
  return result;
}

uint64_t sub_1000451D4(uint64_t a1)
{
  return v3(a1, v1, v2);
}

uint64_t sub_1000451E0()
{
  return v3(v1, v0, v2);
}

uint64_t sub_1000451FC()
{
  return ToolSymbolIconColor.init(rawValue:)(v0, v1);
}

uint64_t sub_100045218(uint64_t a1)
{
  return swift_dynamicCastObjCProtocolConditional(a1, 1LL, v1);
}

uint64_t sub_100045224()
{
  return ToolSymbolIconColor.init(rawValue:)(*(void *)(v0 + 376), *(void *)(v0 + 384));
}

void sub_100045230(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10004523C(uint64_t a1)
{
  return sub_100037F50(a1, v1);
}

uint64_t sub_100045244(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

uint64_t sub_100045250(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

uint64_t sub_10004525C(uint64_t a1)
{
  uint64_t v5 = v1[109];
  uint64_t v6 = v1[104];
  v1[64] = a1;
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v2 + 16))(v5, *(void *)(v3 - 168), v6);
}

uint64_t sub_100045278(uint64_t a1)
{
  uint64_t v5 = v2[118];
  uint64_t v6 = v2[115];
  v2[56] = a1;
  return (*(uint64_t (**)(uint64_t, void, uint64_t))(v1 + 16))(v5, *(void *)(v3 - 200), v6);
}

uint64_t sub_100045294()
{
  return dispatch thunk of Actor.unownedExecutor.getter(v0);
}

uint64_t sub_1000452A0(uint64_t a1)
{
  uint64_t v4 = v1[154];
  uint64_t v5 = v1[143];
  v1[52] = a1;
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v2 + 16))(v4, STACK[0x248], v5);
}

uint64_t sub_1000452BC(uint64_t a1)
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(a1, *(void *)(v1 - 184), *(void *)(v1 - 192));
}

uint64_t sub_1000452C8()
{
  return WFDeviceCapabilityResource.capability.getter();
}

uint64_t sub_1000452E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_dynamicCast(a1, a2, a3, a4, 7LL);
}

uint64_t sub_1000452EC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_1000452FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  return swift_release(a19);
}

uint64_t sub_100045318(uint64_t a1, uint64_t a2, ...)
{
  return dispatch thunk of Hashable.hash(into:)(va, v2, a1);
}

uint64_t sub_100045328(uint64_t a1)
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(v1, v2, a1);
}

uint64_t sub_100045338(uint64_t a1)
{
  return ToolKitSeedSnapshot.adding(other:)(v1, v2, a1);
}

uint64_t sub_100045354()
{
  return type metadata accessor for RuntimePlatformVersion(0LL);
}

uint64_t sub_10004535C()
{
  return sub_10000E518(0LL, v0, v1);
}

uint64_t sub_10004536C()
{
  return type metadata accessor for WFFeatureFlagResource(0LL);
}

uint64_t sub_100045374()
{
  return type metadata accessor for Locale(0LL);
}

uint64_t sub_10004537C()
{
  return swift_unknownObjectRetain(v0);
}

uint64_t sub_100045388()
{
  return sub_100037FF8();
}

uint64_t sub_100045394()
{
  return v0;
}

void sub_1000453A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t sub_1000453AC(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_1000453B4(uint64_t a1)
{
  return sub_100037F50(a1, v1);
}

uint64_t sub_1000453BC()
{
  return v0;
}

uint64_t sub_1000453C8()
{
  return sub_1000408CC(v1, v0, v2);
}

uint64_t sub_1000453D8()
{
  return sub_10001F608(v1, v0);
}

void sub_1000453E4()
{
}

uint64_t sub_100045410@<X0>(uint64_t a1@<X8>)
{
  return sub_100037F50(*(void *)(a1 + 16), v1);
}

  ;
}

uint64_t sub_10004542C()
{
  return sub_1000531E4(v0);
}

uint64_t sub_100045434()
{
  return v2(v0, v1);
}

uint64_t sub_100045440@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

void sub_10004544C()
{
  v2._countAndFlagsBits = v0;
  v2._object = v1;
  String.append(_:)(v2);
}

id sub_100045458@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return *(id *)(*(void *)(a1 + 48) + 8 * a2);
}

BOOL sub_100045464(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_100045474(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2);
}

void sub_10004547C(unint64_t *a1)
{
}

uint64_t sub_100045488()
{
  return v0;
}

uint64_t sub_100045494()
{
  return swift_arrayDestroy(v0, 1LL);
}

uint64_t sub_1000454A4()
{
  return *(void *)(v2 + 648);
}

uint64_t sub_1000454D8()
{
  return *(void *)(v2 + 656);
}

id sub_10004550C(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

uint64_t sub_100045514()
{
  return sub_100037FF8();
}

uint64_t sub_100045520()
{
  return swift_unknownObjectRetain(v0);
}

void sub_100045528()
{
}

uint64_t sub_100045534()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 248) + 8LL))( *(void *)(v0 - 232),  *(void *)(v0 - 240));
}

  ;
}

  ;
}

uint64_t sub_10004555C(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 1576);
}

uint64_t sub_10004557C()
{
  unsigned __int8 v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 128) + 8LL);
  *(void *)(v2 - 128) = v3;
  return v3(v0, v1);
}

uint64_t sub_100045594()
{
  return (*(uint64_t (**)(void))(v0 - 128))();
}

uint64_t sub_10004559C(uint64_t a1)
{
  return dispatch thunk of static Equatable.== infix(_:_:)(v3, v2, v1, a1);
}

float *sub_1000455B4(float *result, float a2)
{
  *double result = a2;
  return result;
}

uint64_t sub_1000455C4()
{
  return *(void *)(v1 + 16 * v0);
}

  ;
}

uint64_t sub_1000455E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000084E0(a1, a2, a3);
}

uint64_t sub_1000455F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000848C(a1, a2, a3, a4);
}

uint64_t sub_100045600()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 144) + 104LL))(v0, v2, v1);
}

uint64_t sub_100045618()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 208) + 104LL))(v1, v2, v0);
}

uint64_t sub_100045630( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  *(void *)(v71 + 528) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a71, STACK[0x250]);
}

uint64_t sub_100045648()
{
  *(void *)(v2 + 1792) = v0;
  return sub_100052278(v0, *v1, *(void *)(v2 + 1704));
}

  ;
}

void sub_100045670()
{
}

uint64_t sub_100045688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, 11LL, 2LL, a4, 36LL, 2LL, a7, 17LL);
}

uint64_t sub_1000456A0@<X0>(_BYTE *a1@<X8>)
{
  *a1 = v5;
  return v2(&a1[v1], v4, v3);
}

  ;
}

  ;
}

uint64_t sub_1000456E0()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 96));
}

uint64_t sub_1000456E8(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a2);
}

uint64_t sub_1000456F0(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

uint64_t sub_1000456F8()
{
  return WFDeviceIdiomResource.requirement.getter();
}

  ;
}

uint64_t sub_100045730()
{
  return dispatch thunk of SetAlgebra.intersection(_:)(v0, v1, STACK[0x248]);
}

uint64_t sub_100045748()
{
  return dispatch thunk of SetAlgebra.intersection(_:)(v0, v1, *(void *)(v2 - 256));
}

uint64_t sub_100045760()
{
  return swift_task_alloc(32LL);
}

id sub_100045778()
{
  return [v0 *(SEL *)(v1 + 528)];
}

uint64_t sub_100045790()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_100045798(uint64_t a1)
{
  *(void *)(v1 - 152) = a1;
  return v1 - 152;
}

void sub_1000457AC()
{
  *(_WORD *)uint64_t v0 = 514;
  *(_BYTE *)(v0 + 2) = 64;
}

uint64_t sub_1000457C0(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 736);
}

uint64_t sub_1000457E0()
{
  return *(void *)(v0 + 1320);
}

uint64_t sub_1000457F4(uint64_t a1)
{
  return sub_10000848C(a1, 0LL, 1LL, v1);
}

uint64_t sub_100045814()
{
  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_10004581C()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 208));
}

uint64_t sub_100045824(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

  ;
}

uint64_t sub_10004584C()
{
  return *(void *)(v0 + 720);
}

  ;
}

  ;
}

uint64_t sub_10004589C()
{
  return v3(v0, v1, v2);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_1000458EC(uint64_t (*a1)(void))
{
  return a1();
}

  ;
}

  ;
}

  ;
}

void sub_10004593C()
{
}

  ;
}

uint64_t sub_100045950(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100038098(a1, v3, a3);
}

uint64_t sub_100045958(uint64_t result)
{
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = v6;
  *(void *)(result + 32) = v4;
  *(void *)(result + 4sub_10004094C(v0, 0) = v1;
  *(_BYTE *)(result + 48) = v5 & 1;
  *(void *)(result + 56) = *(void *)(v7 - 216);
  *(void *)(result + 64) = v2;
  return result;
}

uint64_t sub_100045978()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100045980()
{
  return swift_release(*(void *)(v0 - 224));
}

uint64_t sub_100045988()
{
  return swift_task_dealloc(STACK[0x220]);
}

uint64_t sub_100045990()
{
  return swift_task_dealloc(STACK[0x218]);
}

  ;
}

uint64_t sub_1000459B8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(a1 - 8) + 104LL))(v2, v1, a1);
}

uint64_t sub_1000459D0(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_1000459D8(uint64_t a1, unint64_t *a2)
{
  return sub_10000E518(a1, a2, v2);
}

uint64_t sub_1000459E0()
{
  return type metadata accessor for RuntimeDeviceState(0LL);
}

uint64_t sub_1000459E8(uint64_t a1)
{
  return dispatch thunk of static Equatable.== infix(_:_:)(v3, v2, v1, a1);
}

uint64_t sub_100045A00()
{
  uint64_t v2 = *(void *)(v0 + 784);
  *(void *)(v1 - 144) = *(void *)(v0 + 776);
  *(void *)(v1 - 136) = v2;
  uint64_t v3 = *(uint64_t (**)(void))(v2 + 16);
  *(void *)(v1 - 128) = v3;
  return v3();
}

uint64_t sub_100045A18()
{
  return sub_1000408CC(v1, v0, v2);
}

unint64_t sub_100045A48()
{
  return sub_10001F880(v1, v0, v2);
}

uint64_t sub_100045A70()
{
  return _CocoaArrayWrapper.endIndex.getter(v0);
}

uint64_t sub_100045A78()
{
  return v0;
}

void sub_100045A84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t sub_100045A8C()
{
  return static WFLog.subscript.getter(v0);
}

void sub_100045A94(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_100045A9C()
{
  return sub_1000084E0(v0, 1LL, v1);
}

uint64_t sub_100045ACC()
{
  return v0;
}

void *sub_100045AD8()
{
  return Hasher.init(_seed:)((void *)(v0 - 176), *(void *)(*(void *)(*(void *)(v0 - 184) + 1696LL) + 40LL));
}

uint64_t sub_100045AEC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_1000408E4(v3, 0LL);
}

  ;
}

uint64_t sub_100045B20()
{
  *(void *)(v0 - 144) = *(void *)(*(void *)(v0 - 120) + 1056LL);
  return sub_1000531F0(*(void *)(v0 - 136));
}

void sub_100045B34()
{
  *(void *)(*(void *)(v0 - 120) + 480LL) = *(void *)(*(void *)(v0 - 120) + 584LL);
}

  ;
}

uint64_t sub_100045B5C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_100045B70()
{
  return v1(v2, v0, v3);
}

uint64_t sub_100045B84()
{
  return v1(v3, v2, v0);
}

uint64_t sub_100045B98()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_100045BAC()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_100045BC0()
{
  return _bridgeAnyObjectToAny(_:)(v0);
}

uint64_t sub_100045BCC()
{
  return swift_retain_n(v0, 3LL);
}

uint64_t sub_100045BE0()
{
  uint64_t v2 = *(void *)(v0 + 1072);
  *(void *)(v1 - 16sub_10004094C(v0, 0) = *(void *)(v0 + 1056);
  *(void *)(v1 - 152) = v2;
  return sub_1000531F0(*(void *)(v1 - 136));
}

uint64_t sub_100045BF4()
{
  return sub_100052278(v0, STACK[0x240] & 1, v1);
}

BOOL sub_100045C08()
{
  return os_log_type_enabled(*(os_log_t *)(v0 - 192), (os_log_type_t)LODWORD(STACK[0x258]));
}

uint64_t sub_100045C1C()
{
  return Logger.logObject.getter();
}

  ;
}

uint64_t sub_100045C40()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_100045C4C()
{
  *(void *)(v1 - 216) = v0;
  return sub_1000531E4(v0);
}

uint64_t sub_100045C58(uint64_t a1)
{
  *(void *)(v1 - 192) = a1;
  return static os_log_type_t.debug.getter();
}

void sub_100045C60()
{
  *(void *)(v1 - 256) = v0 + 392;
  *(void *)(v1 - 248) = v0 + 424;
}

uint64_t sub_100045C7C()
{
  return swift_errorRelease(*(void *)(v0 - 192));
}

uint64_t sub_100045C90@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v2);
}

uint64_t sub_100045C98@<X0>(uint64_t a1@<X0>, unsigned int *a2@<X8>)
{
  return v2(a1, *a2);
}

uint64_t sub_100045CA0()
{
  return String.init(stringInterpolation:)(*(void *)(v0 - 176), *(void *)(v0 - 168));
}

void sub_100045CA8()
{
}

uint64_t sub_100045CB0()
{
  return static ToolVisibilityFlag.approved.getter();
}

uint64_t sub_100045CC4()
{
  return sub_100037F50(*(void *)(*(void *)(v0 + 400) + 16LL), v1);
}

uint64_t sub_100045CD8()
{
  return sub_100037F50(*(void *)(*(void *)(v0 + 400) + 16LL), v1);
}

Swift::Int sub_100045CEC()
{
  return Hasher._finalize()();
}

uint64_t sub_100045CF4()
{
  *(void *)(v1 - 208) = v0;
  return sub_1000531E4(v0);
}

uint64_t sub_100045D00()
{
  return swift_retain(*(void *)(v0 - 200));
}

uint64_t sub_100045D08()
{
  return swift_bridgeObjectRelease(0x8000000000000000LL);
}

uint64_t sub_100045D10( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return swift_task_dealloc(a9);
}

__n128 sub_100045D18()
{
  return *(__n128 *)(v0 + 72);
}

uint64_t sub_100045D34(uint64_t result)
{
  *(void *)(v1 - 136) = result;
  return result;
}

uint64_t sub_100045D50()
{
  return static ToolVisibilityFlag.shortcuts.getter();
}

void sub_100045D58()
{
  v0._countAndFlagsBits = 32LL;
  v0._object = (void *)0xE100000000000000LL;
  String.append(_:)(v0);
}

uint64_t sub_100045D64()
{
  return sub_100037C78(27LL);
}

uint64_t sub_100045D6C(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2);
}

uint64_t sub_100045D74()
{
  return v0(v1, v3, *(void *)(v2 + 776));
}

uint64_t sub_100045D88()
{
  return OSSignpostIntervalState.signpostID.getter();
}

void *sub_100045D90(uint64_t a1)
{
  return Hasher.init(_seed:)((void *)(v1 - 176), a1);
}

uint64_t sub_100045D98(uint64_t a1)
{
  return swift_retain_n(a1, 3LL);
}

uint64_t sub_100045DA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return swift_bridgeObjectRelease(a10);
}

uint64_t sub_100045DA8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v0);
}

uint64_t sub_100045DB4()
{
  return *(void *)(v0 + 72);
}

uint64_t sub_100045DD0()
{
  return swift_task_dealloc(*(void *)(v0 - 112));
}

uint64_t sub_100045DD8()
{
  return swift_task_dealloc(*(void *)(v0 - 120));
}

uint64_t sub_100045DE0()
{
  return swift_errorRetain(v0);
}

uint64_t sub_100045DE8()
{
  return sub_100052268(*(void *)(v0 - 216));
}

id sub_100045DF0()
{
  return *(id *)(STACK[0x208] + 8 * v0);
}

uint64_t sub_100045DFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30)
{
  return static WFLogSignpost.signposter(for:)(a30);
}

id sub_100045E08(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 1);
}

uint64_t sub_100045E10()
{
  return v0(v2, v1);
}

  ;
}

uint64_t sub_100045E38()
{
  return static ToolVisibilityFlag.approved.getter();
}

uint64_t sub_100045E4C()
{
  return 0LL;
}

uint64_t sub_100045E68()
{
  return 0LL;
}

uint64_t sub_100045E84()
{
  return Error.localizedDescription.getter(*(void *)(v0 + 328), *(void *)(v0 + 336));
}

uint64_t sub_100045E90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(a1, v2 + a2 + *(void *)(v4 + 72) * v3);
}

uint64_t sub_100045EA4(uint64_t a1)
{
  return v2(a1, v1);
}

void sub_100045EAC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

id sub_100045EB4(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, 0);
}

uint64_t sub_100045EBC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(a1, v2);
}

uint64_t sub_100045EC8()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v0, v2);
}

uint64_t sub_100045EDC()
{
  return *(void *)(v0 + 720);
}

uint64_t sub_100045EF8()
{
  return *(void *)(v0 + 720);
}

uint64_t sub_100045F14()
{
  return ToolSymbolIconColor.init(rawValue:)(*(void *)(v0 + 376), *(void *)(v0 + 384));
}

uint64_t sub_100045F20(uint64_t a1, uint64_t a2)
{
  return sub_10000848C(a1, a2, 1LL, v2);
}

uint64_t sub_100045F2C()
{
  return sub_10003C464(v0, v1);
}

uint64_t sub_100045F40()
{
  return WFFeatureFlagResource.feature.getter();
}

uint64_t sub_100045F4C(uint64_t a1)
{
  return dispatch thunk of CustomStringConvertible.description.getter(v1, a1);
}

uint64_t sub_100045F58()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 1048));
}

uint64_t sub_100045F64()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(v0);
}

unint64_t sub_100045F70()
{
  return sub_100040EE0();
}

void sub_100045F78(uint64_t a1)
{
  *(void *)(v2 + 1048) = a1;
}

uint64_t sub_100045F84(uint64_t a1)
{
  return sub_1000393C8(a1);
}

Swift::Int sub_100045F8C()
{
  return Hasher._finalize()();
}

uint64_t sub_100045F94()
{
  return WFLogSignpost.signposter.getter();
}

uint64_t sub_100045FA8(uint64_t a1)
{
  *(void *)(v3 - 192) = a1;
  *(void *)(v3 - 184) = v2;
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(v1, v2, a1);
}

void sub_100045FBC()
{
}

  ;
}

void sub_100045FD4(unint64_t *a1)
{
}

uint64_t sub_100045FDC()
{
  return type metadata accessor for Logger(0LL);
}

uint64_t sub_100045FE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3(0LL);
}

uint64_t sub_100045FEC()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 464));
}

uint64_t sub_100046000()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 464));
}

uint64_t sub_100046014(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_10004601C()
{
  return swift_allocBox(v0);
}

uint64_t sub_100046024()
{
  return v0(v1, v2);
}

uint64_t sub_100046030()
{
  return v0;
}

uint64_t sub_10004603C()
{
  return WFLogSignpost.state.getter();
}

  ;
}

void sub_100046054()
{
}

void sub_100046060()
{
}

uint64_t sub_100046074()
{
  return ParameterRelationshipDefinition.init(key:relation:)(v2, v1, v0);
}

id sub_100046088(uint64_t a1, const char *a2)
{
  return [v2 a2];
}

void *sub_100046090()
{
  return sub_100013D08(v0);
}

uint64_t sub_10004609C()
{
  return sub_100037FF8();
}

uint64_t sub_1000460A8()
{
  return v0;
}

uint64_t sub_1000460B4()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t sub_1000460BC()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_1000460C4()
{
  return v0;
}

uint64_t sub_1000460D0(uint64_t a1)
{
  return v2(a1, v1);
}

uint64_t sub_1000460D8(uint64_t a1)
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)(a1, v1, *(void *)(v2 - 256));
}

uint64_t sub_1000460E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100038098(v3, v4, a3);
}

uint64_t sub_1000460F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a15 + 8))(a16, a14);
}

uint64_t sub_100046104()
{
  return sub_1000531F0(v0);
}

void sub_10004610C(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_100046114()
{
  return sub_100050950(v0);
}

uint64_t sub_10004611C()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t sub_100046128()
{
  return v3(v0, v1, v2);
}

void sub_10004613C()
{
}

  ;
}

void sub_100046154()
{
  *(void *)(v2 - 168) = *(void *)(v1 + 1256);
  *(void *)(v2 - 16sub_10004094C(v0, 0) = *(void *)(v1 + 616);
  *(void *)(v2 - 152) = v0;
}

  ;
}

void sub_100046184()
{
  uint64_t v2 = *(void *)(v0 + 2032);
  *(void *)(v1 - 144) = *(void *)(v0 + 1672);
  *(void *)(v1 - 136) = v2;
}

uint64_t sub_10004619C()
{
  return v0;
}

uint64_t sub_1000461AC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 104LL))(a1, a2, v2);
}

uint64_t sub_1000461BC(uint64_t a1)
{
  return swift_bridgeObjectRetain(a1);
}

uint64_t sub_1000461CC(uint64_t a1)
{
  *(void *)(v1 - 104) = a1;
  return type metadata accessor for WFDeviceIdiomResource(0LL);
}

uint64_t sub_1000461DC()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000461EC()
{
  return swift_bridgeObjectRelease(v0);
}

void sub_1000461FC()
{
}

  ;
}

void sub_100046214()
{
  STACK[0x208] = *(void *)(v0 - 184) + 336LL;
}

BOOL sub_10004622C()
{
  return sub_10005226C(v0);
}

  ;
}

  ;
}

uint64_t sub_10004626C()
{
  return *(void *)(*(void *)(v0 - 184) + 1416LL);
}

id sub_10004627C()
{
  return *(id *)(v0 + 576);
}

void sub_100046284()
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

uint64_t sub_1000462D0()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_1000462D8()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000462E0()
{
  return swift_release(*(void *)(v0 - 136));
}

  ;
}

uint64_t sub_1000462F4(uint64_t a1)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(a1, *(void *)(v1 - 136));
}

void sub_1000462FC()
{
  *(void *)(v0 + 48sub_10004094C(v0, 0) = *(void *)(v0 + 584);
}

uint64_t sub_10004630C()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 128));
}

__n128 sub_100046314( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, __n128 a17)
{
  __n128 result = a17;
  *uint64_t v17 = a17.n128_u32[0];
  return result;
}

uint64_t sub_10004632C@<X0>(uint64_t (*a1)(void)@<X8>)
{
  *(void *)(v1 - 12sub_10004094C(v0, 0) = a1;
  return a1();
}

uint64_t sub_100046334()
{
  return static ToolVisibilityFlag.assistant.getter();
}

uint64_t sub_100046344()
{
  return static ToolVisibilityFlag.approved.getter();
}

void sub_100046354()
{
}

  ;
}

  ;
}

  ;
}

void sub_100046388(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

void sub_100046390(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

uint64_t sub_100046398()
{
  return swift_task_dealloc(STACK[0x250]);
}

uint64_t sub_1000463A0()
{
  return swift_release(STACK[0x250]);
}

uint64_t sub_1000463A8()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 152) + 8LL))( *(void *)(v0 - 136),  *(void *)(v0 - 144));
}

uint64_t sub_1000463B8()
{
  return swift_task_dealloc(STACK[0x258]);
}

uint64_t sub_1000463C0()
{
  return swift_release(STACK[0x258]);
}

void sub_1000463C8()
{
}

uint64_t sub_1000463D8()
{
  return v2(v0, *(void *)(v1 + 1144));
}

uint64_t sub_1000463E8()
{
  return v2(v0, *(void *)(v1 + 1144));
}

uint64_t sub_1000463F8(uint64_t a1)
{
  return v2(a1, *(void *)(v1 + 1144));
}

uint64_t sub_100046400()
{
  return *(void *)(v0 + 576);
}

  ;
}

  ;
}

void sub_100046448()
{
}

uint64_t sub_100046450(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a2, v2);
}

void sub_100046460()
{
  *(void *)(v1 + 392) = v0;
}

uint64_t sub_100046470()
{
  return String.hash(into:)(v2 - 176, v1, v0);
}

uint64_t sub_100046480@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 8))(v1, *(void *)(v2 - 144));
}

void sub_100046490( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
}

uint64_t sub_1000464A0()
{
  return sub_10003C464(v1, v0);
}

id sub_1000464B0(uint64_t a1)
{
  *(void *)(a1 + 16) = v2;
  *(void *)(v3 - 208) = a1;
  return v1;
}

uint64_t sub_1000464C0()
{
  return sub_10003C464(v0, v1);
}

  ;
}

uint64_t sub_1000464E8(uint64_t a1)
{
  return swift_bridgeObjectRelease_n(a1, 3LL);
}

void sub_1000464F0()
{
  STACK[0x208] = v0 + 32;
}

uint64_t sub_1000464FC()
{
  return AssistantToolSchemaDefinition.sampleInvocations.getter();
}

uint64_t sub_100046504()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10004650C()
{
  return sub_100050950(v0);
}

unint64_t sub_100046514()
{
  return sub_100051D14(v1, v2, v0);
}

uint64_t sub_100046524()
{
  return static ToolVisibilityFlag.shortcuts.getter();
}

uint64_t sub_10004652C()
{
  return static ToolVisibilityFlag.assistant.getter();
}

  ;
}

void sub_100046540()
{
}

  ;
}

void sub_100046558()
{
}

uint64_t sub_100046560()
{
  return sub_100038098(v1, v0, (uint64_t *)(v2 - 176));
}

uint64_t sub_100046570()
{
  return sub_100038098(v1, v0, (uint64_t *)(v2 - 176));
}

uint64_t sub_100046580(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 56);
}

uint64_t sub_100046598()
{
  return *(void *)(*(void *)(v0 - 184) + 1320LL);
}

BOOL sub_1000465B0@<W0>(os_log_type_t a1@<W8>)
{
  return os_log_type_enabled(*(os_log_t *)(v1 - 192), a1);
}

uint64_t sub_1000465C0()
{
  return swift_bridgeObjectRelease(*(void *)(v0 - 104));
}

uint64_t sub_1000465C8(uint64_t a1)
{
  return sub_10000848C(a1, 0LL, 1LL, v1);
}

uint64_t sub_1000465D8(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

uint64_t sub_1000465E0(uint64_t result)
{
  *(void *)(result + 16) = v1;
  *(void *)(v2 - 20sub_10004094C(v0, 0) = result;
  return result;
}

  ;
}

void sub_1000465FC(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_100046604()
{
  return v0;
}

unint64_t sub_100046614()
{
  return sub_100051D14(v0, v1, v2);
}

uint64_t sub_100046624()
{
  return v0(v3, v1, v2);
}

uint64_t sub_100046634()
{
  return (*(uint64_t (**)(void, unint64_t))(v0 + 8))(*(void *)(v1 - 256), STACK[0x258]);
}

uint64_t sub_100046644()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t sub_100046654()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v0);
}

uint64_t sub_100046664()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 88))(v0, v2);
}

uint64_t sub_100046674()
{
  return WFAction.toolkitSystemProtocols.getter();
}

uint64_t sub_10004667C()
{
  return *(void *)(v0 + 80);
}

uint64_t sub_100046694()
{
  return static ToolVisibilityFlag.approved.getter();
}

  ;
}

void sub_1000466BC(uint64_t a1)
{
}

uint64_t sub_1000466C4(uint64_t a1)
{
  return v1(a1, v2);
}

uint64_t sub_1000466CC()
{
  return v0;
}

uint64_t sub_1000466D8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000466E0(uint64_t a1, uint64_t a2)
{
  return v2(a1, a2, v3);
}

uint64_t sub_1000466E8(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2);
}

uint64_t sub_1000466F0()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(*(void *)(*(void *)(v0 - 176)
                                                                                               + 16LL));
}

uint64_t sub_100046700(uint64_t a1)
{
  return v2(a1, *(void *)(v1 + 1144));
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100046748()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 184) + 8LL))( *(void *)(v0 - 168),  *(void *)(v0 - 176));
}

  ;
}

uint64_t sub_100046764(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return sub_100038A18(a1, a2, a3);
}

uint64_t sub_100046774(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return sub_100038A18(a1, a2, a3);
}

uint64_t sub_100046784(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return sub_100038A18(a1, a2, a3);
}

uint64_t sub_100046794(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return sub_100038A18(a1, a2, a3);
}

uint64_t sub_1000467A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return sub_100038A18(a1, a2, a3);
}

  ;
}

  ;
}

uint64_t sub_1000467CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  return swift_getErrorValue(v24, a23, a24);
}

uint64_t sub_1000467DC()
{
  return *(void *)(v0 + 1232);
}

void sub_1000467F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  *(void *)(v21 - 104) = 0xD000000000000014LL;
  *(void *)(v21 - 96) = a21;
}

uint64_t sub_10004680C(uint64_t result)
{
  *(_DWORD *)(v2 - 232) = result;
  *(void *)(v2 - 24sub_10004094C(v0, 0) = v1;
  return result;
}

uint64_t sub_10004681C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100038098(a1, v3, a3);
}

uint64_t sub_100046824(uint64_t a1)
{
  return v1(a1, v2);
}

__n128 sub_10004682C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __n128 a11)
{
  *(void *)(v12 - 8sub_10004094C(v0, 0) = a1;
  __n128 result = a11;
  *uint64_t v11 = a11.n128_u32[0];
  return result;
}

uint64_t sub_100046844()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 8));
}

uint64_t sub_100046854()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 536));
}

uint64_t sub_10004685C(char *a1)
{
  return sub_100034CC4(a1, v1);
}

  ;
}

uint64_t sub_100046870(uint64_t a1)
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)(a1, v1);
}

uint64_t sub_100046878()
{
  return sub_100052278(v0, v1, *(void *)(v2 + 1704));
}

uint64_t sub_100046888(uint64_t a1)
{
  return swift_bridgeObjectRetain_n(a1, 2LL);
}

uint64_t sub_100046890()
{
  return objc_opt_self(*(void *)(v0 + 1776));
}

  ;
}

  ;
}

  ;
}

  ;
}

void sub_1000468DC(uint64_t a1@<X8>)
{
  STACK[0x250] = (a1 - 32) | 0x8000000000000000LL;
  *(void *)(v3 - 256) = v2;
  *(void *)(v3 - 24sub_10004094C(v0, 0) = v1;
}

  ;
}

  ;
}

uint64_t sub_10004691C(uint64_t result)
{
  *(void *)(result + 16) = v3;
  *(void *)(result + 24) = v5;
  *(void *)(result + 32) = v1;
  *(void *)(result + 4sub_10004094C(v0, 0) = v2;
  *(_BYTE *)(result + 48) = v4 & 1;
  return result;
}

uint64_t sub_100046934()
{
  return *(void *)(v0 + 576);
}

char *sub_10004694C(void *a1)
{
  return sub_1000137AC(v1, a1);
}

uint64_t sub_10004695C(uint64_t a1)
{
  return dispatch thunk of CustomStringConvertible.description.getter(v1, a1);
}

uint64_t sub_10004696C(uint64_t a1)
{
  return dispatch thunk of CustomStringConvertible.description.getter(v1, a1);
}

uint64_t sub_10004697C(uint64_t a1, uint64_t (*a2)(void))
{
  *(void *)(v2 - 104) = a2;
  return a2(0LL);
}

uint64_t sub_10004698C(uint64_t a1)
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(a1, *(void *)(v1 - 256), STACK[0x248]);
}

uint64_t sub_10004699C()
{
  return IndexingLog.log(successfulIndexOfType:in:)(v0, v1);
}

uint64_t sub_1000469AC(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 944);
  *(void *)(v1 + 448) = a1;
  return result;
}

  ;
}

  ;
}

void sub_1000469E0()
{
}

uint64_t sub_1000469E8(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 1232);
  *(void *)(v1 + 416) = a1;
  return result;
}

uint64_t sub_100046A00(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 872);
  *(void *)(v1 + 512) = a1;
  return result;
}

uint64_t sub_100046A18()
{
  return IndexingLog.log(successfulIndexOfType:in:)(v0, v1);
}

  ;
}

  ;
}

  ;
}

id sub_100046A68(uint64_t a1, const char *a2)
{
  return [*(id *)(v2 - 240) a2];
}

uint64_t sub_100046A70(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2);
}

uint64_t sub_100046A78()
{
  return swift_release(STACK[0x248]);
}

  ;
}

uint64_t sub_100046A90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a13, a12);
}

  ;
}

uint64_t sub_100046AB8(uint64_t a1)
{
  return dispatch thunk of Hashable.hash(into:)(v1, v2, a1);
}

uint64_t sub_100046AC8()
{
  return v0;
}

uint64_t sub_100046AD4(uint64_t a1)
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)(v1, v2, a1);
}

uint64_t sub_100046AE4()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 240) + 8LL))( *(void *)(v0 - 224),  *(void *)(v0 - 232));
}

uint64_t sub_100046AF4(uint64_t a1)
{
  return static _SetStorage.resize(original:capacity:move:)(a1, v1, 1LL);
}

  ;
}

uint64_t sub_100046B10()
{
  return sub_10000E518(0LL, v1, v0);
}

uint64_t sub_100046B20(uint64_t result)
{
  *(void *)(v1 + 1072) = result;
  return result;
}

uint64_t sub_100046B30()
{
  *(void *)(v1 - 216) = v0;
  return sub_1000531E4(v0);
}

uint64_t sub_100046B40()
{
  return swift_isUniquelyReferenced_nonNull_native(*v0);
}

uint64_t sub_100046B50()
{
  return sub_1000084E0(v0, 1LL, v1);
}

void sub_100046B78()
{
}

uint64_t sub_100046B88()
{
  return v2(v0, v1, v3);
}

  ;
}

uint64_t sub_100046BA4()
{
  return sub_1000084E0(v1, 1LL, v0);
}

uint64_t sub_100046BCC()
{
  uint64_t result = v0;
  *(void *)(v2 - 128) = v1;
  return result;
}

uint64_t sub_100046BE4()
{
  return v0;
}

unint64_t sub_100046BF0()
{
  return sub_100051D14(v0, v1, v2);
}

uint64_t sub_100046C00()
{
  return v3(v2, v0, v1);
}

void sub_100046C10()
{
}

uint64_t sub_100046C18()
{
  return v3(v2, v0, v1);
}

uint64_t sub_100046C28()
{
  return v0;
}

void sub_100046C34(uint64_t a1, uint64_t (*a2)(void))
{
}

  ;
}

id sub_100046C4C()
{
  return v0;
}

uint64_t sub_100046C54()
{
  return v0;
}

uint64_t sub_100046C60()
{
  return v0;
}

void sub_100046C6C()
{
}

uint64_t sub_100046C74()
{
  return *(void *)(v1 + 176);
}

uint64_t sub_100046C9C()
{
  return sub_1000084E0(v0, 1LL, v1);
}

void sub_100046CC4()
{
}

uint64_t sub_100046CD4()
{
  return v1(v0, v2);
}

void sub_100046CE4()
{
}

uint64_t sub_100046CF4()
{
  return v3(v2, v0, v1);
}

uint64_t sub_100046D04()
{
  return sub_10000848C(v1, 0LL, 1LL, v0);
}

void sub_100046D2C()
{
}

uint64_t sub_100046D3C()
{
  return sub_1000531E4(v0);
}

uint64_t sub_100046D44()
{
  return sub_1000084E0(v1, 1LL, v0);
}

uint64_t sub_100046D6C@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  return a1(v1);
}

uint64_t sub_100046D74()
{
  return v0;
}

uint64_t sub_100046D80()
{
  return v3(v2, v1, v0);
}

uint64_t sub_100046D90()
{
  return sub_100034A90(v0, v1);
}

uint64_t sub_100046DA0()
{
  return v0;
}

uint64_t sub_100046DAC()
{
  return sub_100034A90(v1, v0);
}

uint64_t sub_100046DBC()
{
  return v1(v0, v3, v2);
}

uint64_t sub_100046DCC()
{
  return v0;
}

uint64_t sub_100046DDC()
{
  return v0;
}

uint64_t sub_100046DEC()
{
  return _CocoaArrayWrapper.endIndex.getter(v0);
}

uint64_t sub_100046DF4()
{
  return swift_arrayDestroy(v0, 1LL);
}

uint64_t sub_100046E04()
{
  return swift_arrayDestroy(v0, 1LL);
}

uint64_t sub_100046E14()
{
  return v0;
}

uint64_t sub_100046E24()
{
  return v3(v0, v2, v1);
}

uint64_t sub_100046E34()
{
  return v3(v1, v2, v0);
}

void sub_100046E44()
{
}

uint64_t sub_100046E54()
{
  return swift_errorRetain(v0);
}

uint64_t sub_100046E5C()
{
  return *(void *)(v0 + 984);
}

id sub_100046E6C()
{
  return *(id *)(v0 + 576);
}

id sub_100046E7C()
{
  return *(id *)(v0 + 576);
}

uint64_t sub_100046E8C(uint64_t a1)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
}

  ;
}

uint64_t sub_100046EA0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000844C(a3);
}

uint64_t sub_100046EB0()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100046EB8()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 536));
}

  ;
}

uint64_t sub_100046ED4()
{
  return v0;
}

void sub_100046EE8()
{
  *(void *)(*(void *)(v1 + 56) + 8 * vsub_10004094C(v0, 0) = 0LL;
}

BOOL sub_100046EFC(os_log_s *a1)
{
  return os_log_type_enabled(a1, v1);
}

uint64_t sub_100046F04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, uint64_t a3)
{
  return ToolDatabase.Transaction.perform<A>(work:)(a1, &a3, a2 + 8);
}

uint64_t sub_100046F10()
{
  uint64_t result = *(void *)(v0 + 576);
  *os_log_type_t v1 = 0LL;
  v1[1] = 0LL;
  return result;
}

void sub_100046F1C()
{
}

void sub_100046F28()
{
}

uint64_t sub_100046F34()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_100046F40(uint64_t a1)
{
  return static NSObject.== infix(_:_:)(a1, v1);
}

void sub_100046F4C()
{
}

uint64_t sub_100046F58()
{
  return static WFContentItem.toolkitTypeDefinition(context:)();
}

void sub_100046F64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31)
{
  uint64_t v34 = *(void *)(a31 + 8 * v31);
  *(void *)(v33 - 112) = v34;
  *(void *)(v32 + 512) = v34;
}

void *sub_100046F78()
{
  *uint64_t v0 = v1;
  return v0;
}

void sub_100046F8C()
{
}

  ;
}

uint64_t sub_100046FAC()
{
  return swift_bridgeObjectRelease(*(void *)(*(void *)(v0 - 184) + 536LL));
}

  ;
}

double sub_100046FCC()
{
  double result = 0.0;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  return result;
}

void sub_100046FE0(void *a1, os_log_s *a2, os_log_type_t a3, const char *a4)
{
}

uint64_t sub_100046FEC()
{
  return v1(*(void *)(v0 + 1456), *(void *)(v0 + 1416));
}

  ;
}

id sub_100047004(uint64_t a1, const char *a2)
{
  return [*(id *)(v2 - 240) a2];
}

  ;
}

uint64_t sub_100047024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return dispatch thunk of static Equatable.== infix(_:_:)(a1, a2, v4, a4);
}

uint64_t sub_100047030()
{
  return AssistantToolSchemaDefinition.sampleInvocations.getter();
}

uint64_t sub_100047038()
{
  return WFAction.outputContentClasses.getter();
}

uint64_t sub_100047040()
{
  return OSSignpostID.init(log:)();
}

uint64_t sub_100047048(uint64_t result)
{
  *(_DWORD *)(v1 - 224) = result;
  return result;
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100047088()
{
  return OSSignposter.logHandle.getter();
}

uint64_t sub_100047090(uint64_t a1, unint64_t a2)
{
  return sub_100038098(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t sub_100047098()
{
  return *(void *)(v0 + 576);
}

  ;
}

  ;
}

uint64_t sub_1000470CC()
{
  return *(void *)(v0 + 832);
}

uint64_t sub_1000470E0()
{
  return OS_os_log.signpostsEnabled.getter();
}

uint64_t sub_1000470EC(uint64_t result)
{
  *(void *)(v1 + 8) = v3;
  *(void *)(v1 + 16) = v4;
  *(void *)(v1 + 24) = v2;
  *(_BYTE *)(v1 + 32) = result & 1;
  return result;
}

  ;
}

  ;
}

uint64_t sub_100047120(uint64_t result)
{
  *(_BYTE *)(result + 16) = 8;
  return result;
}

  ;
}

  ;
}

uint64_t sub_100047144(uint64_t a1)
{
  *(void *)(v2 + 40sub_10004094C(v0, 0) = a1;
  return swift_allocBox(v1);
}

void sub_100047150(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 & 0xFFFF0000FFFFLL | 0xEB00000000200000LL;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t sub_10004715C(uint64_t a1)
{
  return v3(a1, v1, v2);
}

void sub_100047168(unint64_t *a1)
{
}

uint64_t sub_100047174()
{
  return WFFeatureFlagResource.value.getter();
}

uint64_t sub_10004717C()
{
  return v0;
}

uint64_t sub_100047190@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v2;
  a1[1] = a2;
  return *(void *)(v2 + 1576);
}

uint64_t sub_1000471A4(uint64_t result)
{
  *(void *)(v1 + 92sub_10004094C(v0, 0) = result;
  *(void *)(v1 + 928) = *(void *)(result - 8);
  return result;
}

uint64_t sub_1000471B8(uint64_t a1, uint64_t a2)
{
  return dispatch thunk of SetAlgebra.intersection(_:)(a1, a2, *(void *)(v2 - 256));
}

  ;
}

uint64_t sub_1000471D8()
{
  return WFAction.toolkitSystemProtocols.getter();
}

void *sub_1000471E4()
{
  *uint64_t v1 = v0;
  return v1;
}

void *sub_1000471F8(uint64_t a1, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, 0LL);
}

void *sub_100047204(uint64_t a1, uint64_t a2, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, a1);
}

  ;
}

  ;
}

uint64_t sub_100047234()
{
  return v0(*(void *)(v1 + 1456), *(void *)(v1 + 1416));
}

uint64_t sub_100047240()
{
  return static IndexingLog.shared.getter();
}

void sub_10004724C()
{
  *(void *)(v1 - 112) = *(void *)(v0 + 72);
}

void *sub_100047260( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  *a13 = a1;
  return a13;
}

uint64_t sub_100047274()
{
  return v0;
}

uint64_t sub_100047280(uint64_t a1)
{
  *(void *)(v1 - 20sub_10004094C(v0, 0) = a1;
  return static os_log_type_t.error.getter();
}

  ;
}

void sub_10004729C(void *a1@<X8>)
{
  *a1 = *v1;
}

void sub_1000472A8()
{
  *uint64_t v0 = *v1;
}

uint64_t sub_1000472B4()
{
  return swift_errorRetain(v0);
}

void sub_1000472C0(Swift::String a1)
{
}

  ;
}

id sub_1000472D4()
{
  return *(id *)(*(void *)(v0 + 48) + 8 * v1);
}

__n128 sub_1000472E0(__n128 *a1)
{
  __n128 result = *(__n128 *)(v1 - 176);
  a1[1] = result;
  return result;
}

uint64_t sub_1000472EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100038098(v3, v4, a3);
}

uint64_t sub_1000472F8()
{
  return v1(*(void *)(v0 + 56), *(void *)(v0 + 32));
}

void sub_100047304()
{
}

void sub_10004730C()
{
  *(void *)(v1 - 128) = *(void *)(v0 + 1080);
}

void sub_100047320()
{
}

uint64_t sub_100047328()
{
  return static LaunchServicesSnapshot.empty.getter();
}

  ;
}

void sub_100047348()
{
}

uint64_t sub_100047354()
{
  return swift_bridgeObjectRelease(*(void *)(v0 + 176));
}

uint64_t sub_10004735C(uint64_t a1)
{
  return swift_retain(a1);
}

uint64_t sub_100047364(uint64_t a1)
{
  return static NSObject.== infix(_:_:)(a1, v1);
}

uint64_t sub_100047370()
{
  return WFFeatureFlagResource.value.getter();
}

uint64_t sub_10004737C()
{
  return WFFeatureFlagResource.value.getter();
}

uint64_t sub_100047388(uint64_t a1)
{
  return swift_initStackObject(a1, *(void *)(v1 - 224));
}

uint64_t sub_100047390()
{
  return *(void *)(v0 + 88);
}

id sub_1000473A4()
{
  return *(id *)(*(void *)(v0 + 48) + 8 * v1);
}

uint64_t sub_1000473B0()
{
  return *(void *)(v0 + 192);
}

uint64_t sub_1000473C4(uint64_t a1)
{
  return v2(a1, *(void *)(v1 + 72), *(void *)(v1 + 32));
}

uint64_t sub_1000473D0()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v1 - 160), *(void *)(v1 - 168));
}

uint64_t sub_1000473DC()
{
  return _swift_stdlib_bridgeErrorToNSError(v0);
}

uint64_t sub_1000473E4()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000473F0()
{
  return sub_1000531E4(v0);
}

uint64_t sub_1000473F8()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100047404()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100047410()
{
  return swift_unknownObjectRelease(v0);
}

uint64_t sub_100047418()
{
  return sub_100050950(v0);
}

uint64_t sub_100047420()
{
  return sub_10001F608(v1, v0);
}

id sub_10004742C()
{
  return *(id *)(STACK[0x208] + 8 * v0);
}

unint64_t sub_100047438()
{
  return sub_100013FF4(v1, v0);
}

uint64_t sub_100047444( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22)
{
  return static WFLog.subscript.getter(a22);
}

uint64_t sub_100047450(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2);
}

  ;
}

uint64_t sub_10004746C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a3(a1, a2, v3);
}

uint64_t sub_100047474(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(a1, v1);
}

uint64_t sub_100047480(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(a1, v1);
}

uint64_t sub_10004748C(uint64_t a1)
{
  return AnyHashable.init<A>(_:)(a1, v2, v1);
}

uint64_t sub_100047498()
{
  return ToolSymbolIconColor.init(rawValue:)(*(void *)(v0 + 376), *(void *)(v0 + 384));
}

  ;
}

  ;
}

unint64_t sub_1000474C4()
{
  return STACK[0x240];
}

uint64_t sub_1000474D8()
{
  return sub_1000408CC(v1, v0, v2);
}

  ;
}

void sub_100047510()
{
}

uint64_t sub_10004751C(uint64_t result)
{
  *(_DWORD *)(v1 - 232) = result;
  return result;
}

  ;
}

uint64_t sub_10004753C(uint64_t a1)
{
  *(void *)(v1 - 208) = a1;
  return sub_1000531E4(a1);
}

  ;
}

void sub_100047550(uint64_t a1, uint64_t a2, uint64_t *a3)
{
}

void sub_100047558(unint64_t *a1)
{
}

uint64_t sub_100047564(uint64_t a1)
{
  *(void *)(v1 + 88) = a1;
  return type metadata accessor for ToolKitIndexingReason.Changeset.Provenance(0LL);
}

uint64_t sub_100047570()
{
  return *(void *)(*(void *)(v0 - 184) + 720LL);
}

uint64_t sub_100047584()
{
  return WFAction.toolkitSystemProtocols.getter();
}

  ;
}

void sub_1000475A4(uint64_t a1@<X8>)
{
  *(void *)(v3 - 216) = v2;
  *(void *)(v3 - 208) = (a1 - 32) | 0x8000000000000000LL;
  *(void *)(v3 - 224) = v1;
}

void sub_1000475B8(uint64_t a1@<X8>)
{
  *(void *)(v2 - 16sub_10004094C(v0, 0) = (a1 - 32) | 0x8000000000000000LL;
  *(void *)(v2 - 192) = v1;
}

int64_t sub_1000475CC(int64_t a1, uint64_t a2, char a3)
{
  return sub_100040CD4(a1, *(void *)(v4 - 192), a3, v3);
}

  ;
}

uint64_t sub_1000475E4(uint64_t a1)
{
  return sub_10000E5A0(a1);
}

id sub_1000475EC@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(*(void *)(a1 + 48) + 8 * v1);
}

void sub_1000475F8(uint64_t a1, uint64_t a2)
{
}

id sub_100047604(uint64_t a1, const char *a2)
{
  return [*(id *)(v2 - 224) a2];
}

  ;
}

uint64_t sub_100047624@<X0>(uint64_t a1@<X8>)
{
  if (v1) {
    return swift_bridgeObjectRelease(v1);
  }
  else {
    return swift_bridgeObjectRelease(a1);
  }
}

uint64_t sub_100047630()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v1 - 192), *(void *)(v1 - 200));
}

uint64_t sub_10004763C@<X0>(uint64_t (*a1)(void)@<X8>)
{
  return a1();
}

void sub_100047644()
{
}

uint64_t sub_10004764C(uint64_t a1)
{
  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_100047658(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

uint64_t sub_100047664(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

uint64_t sub_100047670(uint64_t a1)
{
  return dispatch thunk of CustomStringConvertible.description.getter(v1, a1);
}

uint64_t sub_10004767C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33)
{
  return String.init<A>(describing:)(a33, a1);
}

uint64_t sub_100047688(uint64_t a1)
{
  return swift_dynamicCastObjCClass(v1, a1);
}

uint64_t sub_100047694()
{
  return v0;
}

void sub_1000476A0()
{
}

void sub_1000476A8(uint64_t a1)
{
  *(void *)(v2 + 1704) = a1;
}

uint64_t sub_1000476B4(uint64_t a1)
{
  uint64_t result = *(void *)(v1 + 872);
  *(void *)(v1 + 512) = a1;
  return result;
}

void sub_1000476C8()
{
  STACK[0x240] = v0;
}

uint64_t sub_1000476D4()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(v0);
}

uint64_t sub_1000476E0(uint64_t a1)
{
  **(void **)(v1 - 112) = a1;
  return 0LL;
}

uint64_t sub_1000476F4()
{
  return (*(uint64_t (**)(void))(v0 - 136))();
}

void sub_1000476FC(Swift::String a1)
{
}

void sub_100047704()
{
}

uint64_t sub_100047710()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t sub_100047718(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + 1864) = result;
  *(void *)(v2 + 1872) = a2;
  return result;
}

void sub_10004772C()
{
}

void sub_100047738()
{
}

uint64_t sub_100047744()
{
  *(void *)(v1 - 136) = v0;
  return sub_100050950(v0);
}

void sub_100047750()
{
}

uint64_t sub_10004775C(uint64_t a1, uint64_t a2)
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2);
}

  ;
}

uint64_t sub_100047778()
{
  return type metadata accessor for TypeDefinition(0LL);
}

uint64_t sub_100047780()
{
  return type metadata accessor for TypeInstance(0LL);
}

uint64_t sub_100047788()
{
  return _s23IndexingPreflightResultVMa(0LL);
}

uint64_t sub_100047790()
{
  return type metadata accessor for UUID(0LL);
}

uint64_t sub_100047798()
{
  return type metadata accessor for ParameterDefinition.ParameterFlags(0LL);
}

uint64_t sub_1000477A0()
{
  return type metadata accessor for OSSignposter(0LL);
}

uint64_t sub_1000477A8()
{
  return type metadata accessor for TypeIdentifier.PrimitiveTypeIdentifier(0LL);
}

uint64_t sub_1000477B0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2(0LL);
}

uint64_t sub_1000477BC(uint64_t result)
{
  *(void *)(*(void *)(v1 - 184) + 1800LL) = result;
  return result;
}

uint64_t sub_1000477D0(uint64_t result, uint64_t a2)
{
  *(void *)(v2 + 1864) = result;
  *(void *)(v2 + 1872) = a2;
  return result;
}

uint64_t sub_1000477E4()
{
  return _swift_stdlib_bridgeErrorToNSError(v0);
}

uint64_t sub_1000477EC()
{
  return v0;
}

uint64_t sub_1000477F8()
{
  return (*(uint64_t (**)(uint64_t))(v1 - 200))(v0);
}

unint64_t *sub_100047804( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return sub_1000345DC(v10, a10);
}

void sub_100047810()
{
}

  ;
}

uint64_t sub_100047828(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(a1, v1);
}

uint64_t sub_100047834(uint64_t a1)
{
  return v2(a1, v3, v1);
}

void *sub_100047840(unint64_t a1, uint64_t a2)
{
  return sub_10001F388(a1, a2, v2);
}

uint64_t sub_10004784C()
{
  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100047858()
{
  return v0;
}

uint64_t sub_100047864()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(v1, v0);
}

void sub_100047870()
{
}

void *sub_100047878@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  result[13] = v2;
  result[14] = a2;
  uint64_t v4 = *(void *)(v3 - 104);
  result[15] = *(void *)(v3 - 160);
  result[16] = v4;
  return result;
}

uint64_t sub_10004788C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21)
{
  return a21;
}

void sub_1000478A0()
{
}

uint64_t sub_1000478AC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_1000478B8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v0, v1);
}

void sub_1000478C4()
{
}

uint64_t sub_1000478D0(uint64_t a1)
{
  return sub_100015784(a1);
}

void sub_1000478DC()
{
  STACK[0x208] = v0 + 1208;
}

uint64_t sub_1000478F0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v0, v1);
}

uint64_t sub_1000478FC()
{
  return sub_1000479A4(v0);
}

uint64_t sub_100047904()
{
  return sub_10000848C(v1, 0LL, 1LL, v0);
}

uint64_t sub_100047928()
{
  return swift_errorRelease(v0);
}

void sub_100047930()
{
}

uint64_t sub_10004793C()
{
  return swift_allocBox(v0);
}

uint64_t sub_100047944()
{
  return sub_100037FF8();
}

uint64_t sub_100047950(uint64_t a1, uint64_t a2)
{
  return v4(v3, a2, v2);
}

void sub_10004795C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_100047978()
{
  return swift_errorRelease(v0);
}

uint64_t sub_100047980()
{
  return v0;
}

uint64_t sub_10004798C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_100047998(uint64_t a1)
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)(a1, STACK[0x228]);
}

uint64_t sub_1000479A4(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_1000479AC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    specialized ContiguousArray.reserveCapacity(_:)(v3);
    uint64_t v5 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v6 = *(v5 - 1);
      uint64_t v7 = *v5;
      swift_bridgeObjectRetain(*v5);
      id v8 = [a2 entityType];
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
      uint64_t v11 = v10;

      id v12 = objc_allocWithZone(&OBJC_CLASS___LNEntityIdentifier);
      id v13 = sub_100050378(v9, v11, v6, v7);
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v13);
      uint64_t v14 = _swiftEmptyArrayStorage[2];
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v14);
      uint64_t v15 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v13);
      specialized ContiguousArray._endMutation()(v15);
      v5 += 2;
      --v3;
    }

    while (v3);
  }

  else
  {
  }

  return _swiftEmptyArrayStorage;
}

void sub_100047AE8()
{
  uint64_t v5 = v4 - v3;
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  sub_100043410(v5, v7, v8, v6);
  uint64_t v9 = (void *)sub_100042644((uint64_t)&unk_100066CF8, 48LL);
  void v9[2] = 0LL;
  v9[3] = 0LL;
  v9[4] = v1;
  v9[5] = v0;
  uint64_t v10 = (void *)sub_100042644((uint64_t)&unk_100066D20, 48LL);
  _OWORD v10[2] = 0LL;
  v10[3] = 0LL;
  v10[4] = &unk_10006A8D0;
  v10[5] = v9;
  uint64_t v11 = sub_1000504A4(v5, (uint64_t)&unk_10006A8E0, (uint64_t)v10);
  swift_release(v11);
  sub_10000F6AC();
}

void sub_100047B9C(uint64_t a1)
{
}

void sub_100047BB8(uint64_t a1)
{
}

void sub_100047BD4(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void), void *a4)
{
  uint64_t v6 = a2(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  *a4 = a3();
  sub_10000F6AC();
}

uint64_t WFToolKitTypedValueContent.resolve(with:)(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = sub_10000844C(&qword_10006A658);
  v2[4] = sub_100013328(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for ContentGraphRepresentationContext(0LL);
  v2[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[6] = v5;
  v2[7] = sub_100013328(v5);
  uint64_t v6 = sub_1000538F8();
  v2[8] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v2[9] = v7;
  v2[10] = sub_100013328(v7);
  sub_10000F3A0();
  return sub_10000F2D0();
}

uint64_t sub_100047C8C()
{
  if (qword_1000699C0 != -1) {
    swift_once(&qword_1000699C0, sub_100047B9C);
  }
  uint64_t v1 = *(void *)(v0 + 80);
  id v2 = [*(id *)(v0 + 24) encodedTypedValue];
  uint64_t v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v5 = v4;

  sub_100053180(&qword_10006A660, (void (*)(uint64_t))&type metadata accessor for TypedValue);
  uint64_t v6 = sub_100053E2C();
  sub_1000538C8(v6, v7, v8, v9, v10);
  sub_10003FCFC(v3, v5);
  uint64_t v11 = *(void *)(v0 + 32);
  if (v1)
  {
    swift_task_dealloc(*(void *)(v0 + 80));
    sub_10000F338();
    sub_10000F404();
    sub_100044674();
    sub_100053878();
    __asm { BR              X0 }
  }

  uint64_t v13 = *(void *)(v0 + 16);
  uint64_t v14 = type metadata accessor for ParameterDefinition(0LL);
  sub_100043410(v11, v15, v16, v14);
  swift_unknownObjectRetain(v13);
  ContentGraphRepresentationContext.init(shortcutsParameter:shortcutsVariableSource:toolkitParameter:)(0LL, v13, v11);
  uint64_t v17 = (void *)swift_task_alloc(async function pointer to TypedValue.resolve(in:)[1]);
  *(void *)(v0 + 88) = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_100047DF4;
  sub_100053878();
  return TypedValue.resolve(in:)();
}

uint64_t sub_100047DF4(uint64_t a1)
{
  *(void *)(v2 + 96) = v1;
  swift_task_dealloc(v5);
  if (!v1) {
    *(void *)(v2 + 104) = a1;
  }
  sub_10000F3A0();
  return sub_100053330();
}

uint64_t sub_100047E4C()
{
  uint64_t v1 = *(void *)(v0 + 72);
  sub_100053448(*(void *)(v0 + 48));
  sub_100043124(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_10000F404();
  sub_10000F4A0();
  sub_10000F484();
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 104));
}

uint64_t sub_100047EB0()
{
  uint64_t v1 = *(void *)(v0 + 72);
  sub_100043820(*(void *)(v0 + 48));
  sub_100043124(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  swift_task_dealloc(*(void *)(v0 + 80));
  sub_10000F338();
  sub_10000F4A0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

BOOL sub_100047F80(char a1, char a2)
{
  return a1 == a2;
}

void sub_100047F90(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_100047FB4(unsigned __int8 a1)
{
  return sub_100045CEC();
}

uint64_t sub_100047FF4(uint64_t a1, void *aBlock, void *a3)
{
  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  uint64_t v6 = dword_10006A654;
  swift_unknownObjectRetain(a1);
  a3;
  uint64_t v7 = (void *)swift_task_alloc(v6);
  v3[5] = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100048070;
  return WFToolKitTypedValueContent.resolve(with:)(a1);
}

uint64_t sub_100048070( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16)
{
  a15 = v18;
  a16 = v19;
  a14 = (void *)v17;
  uint64_t v20 = v16;
  uint64_t v22 = v21;
  uint64_t v23 = *(void **)v17;
  a14 = v23;
  uint64_t v24 = v23[2];
  uint64_t v25 = (void *)v23[3];
  sub_10000F668(v23[5], &a14);
  swift_unknownObjectRelease(v24);

  uint64_t v26 = (void (**)(void, void, void))v23[4];
  if (v20)
  {
    uint64_t v27 = (void *)_convertErrorToNSError(_:)(v20);
    sub_100043C28();
    ((void (**)(void, void, void *))v26)[2](v26, 0LL, v27);

    _Block_release(v26);
  }

  else
  {
    uint64_t v28 = sub_1000460C4();
    v29(v28);
    _Block_release(v26);
  }

  return sub_100053298(*(uint64_t (**)(void))(v17 + 8));
}

BOOL sub_100048118(char *a1, char *a2)
{
  return sub_100047F80(*a1, *a2);
}

Swift::Int sub_100048124()
{
  return sub_100047FB4(*v0);
}

void sub_10004812C(uint64_t a1)
{
}

id ToolKitHelper.DynamicEnumerationDefinition.actionIdentifier.getter()
{
  return sub_100053838(*v0);
}

void ToolKitHelper.DynamicEnumerationDefinition.actionIdentifier.setter(void *a1)
{
}

void ToolKitHelper.DynamicEnumerationDefinition.actionIdentifier.modify(uint64_t a1)
{
}

id ToolKitHelper.DynamicEnumerationDefinition.parameterKey.getter()
{
  return sub_100053838(*v0);
}

void ToolKitHelper.DynamicEnumerationDefinition.parameterKey.setter(void *a1)
{
}

void sub_10004829C(void *a1, uint64_t *a2)
{
  unint64_t v4 = *v2;
  void *v2 = a1;

  sub_100053D4C();
}

void ToolKitHelper.DynamicEnumerationDefinition.parameterKey.modify(uint64_t a1)
{
}

id sub_100048300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v4);
  uint64_t v8 = v4;
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  *(void *)&v8[OBJC_IVAR___WFToolKitDynamicEnumerationDefinition_actionIdentifier] = v9;
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  *(void *)&v8[OBJC_IVAR___WFToolKitDynamicEnumerationDefinition_parameterKey] = v10;

  v12.receiver = v8;
  v12.super_class = ObjectType;
  return objc_msgSendSuper2(&v12, "init");
}

void ToolKitHelper.DynamicEnumerationDefinition.init()()
{
}

uint64_t ToolKitHelper.ContentPropertyPossibleValuesDefinition.contentItemClass.getter()
{
  return *(void *)v0;
}

void ToolKitHelper.ContentPropertyPossibleValuesDefinition.contentItemClass.setter(uint64_t a1)
{
  *uint64_t v1 = a1;
  sub_100053D4C();
}

void ToolKitHelper.ContentPropertyPossibleValuesDefinition.contentItemClass.modify(uint64_t a1)
{
}

uint64_t ToolKitHelper.ContentPropertyPossibleValuesDefinition.propertyName.getter()
{
  uint64_t v1 = *v0;
  sub_100009BEC();
  return v1;
}

void ToolKitHelper.ContentPropertyPossibleValuesDefinition.propertyName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2[1];
  void *v2 = a1;
  v2[1] = a2;
  swift_bridgeObjectRelease(v5);
  sub_100046378();
}

void ToolKitHelper.ContentPropertyPossibleValuesDefinition.propertyName.modify(uint64_t a1)
{
}

id sub_10004864C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = v3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType(v4);
  NSString v9 = (uint64_t *)&v4[OBJC_IVAR___WFToolKitContentPropertyPossibleValuesDefinition_contentItemClass];
  *(void *)&v4[OBJC_IVAR___WFToolKitContentPropertyPossibleValuesDefinition_contentItemClass] = 0LL;
  NSString v10 = v4;
  uint64_t v11 = ContentItemClassDescriptor.load()();
  swift_beginAccess(v9, v17, 1LL, 0LL);
  *NSString v9 = v11;
  objc_super v12 = &v10[OBJC_IVAR___WFToolKitContentPropertyPossibleValuesDefinition_propertyName];
  *(void *)objc_super v12 = a2;
  *((void *)v12 + 1) = a3;

  v16.receiver = v10;
  v16.super_class = ObjectType;
  id v13 = objc_msgSendSuper2(&v16, "init");
  uint64_t v14 = type metadata accessor for ContentItemClassDescriptor(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL))(a1, v14);
  return v13;
}

void ToolKitHelper.ContentPropertyPossibleValuesDefinition.init()()
{
}

unint64_t ToolKitHelper.ValueSetType.init(rawValue:)(unint64_t result)
{
  if (result > 3) {
    return 0LL;
  }
  return result;
}

BOOL sub_100048778(uint64_t *a1, uint64_t *a2)
{
  return sub_1000487FC(*a1, *a2);
}

uint64_t sub_100048784(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)(a2) && v5 == v6)
  {
    char v12 = 1;
  }

  else
  {
    uint64_t v8 = v6;
    uint64_t v9 = sub_1000477EC();
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, v11, v8, 0LL);
  }

  sub_100042E4C();
  sub_100008D58();
  return v12 & 1;
}

BOOL sub_1000487FC(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

Swift::Int sub_100048808()
{
  return sub_100048810(*v0);
}

Swift::Int sub_100048810(Swift::UInt a1)
{
  return Hasher._finalize()();
}

void sub_100048854(int a1)
{
}

void sub_10004885C(int a1, Swift::UInt a2)
{
}

Swift::Int sub_100048880(uint64_t a1)
{
  return sub_100048888(a1, *v1);
}

Swift::Int sub_100048888(uint64_t a1, Swift::UInt a2)
{
  return Hasher._finalize()();
}

unint64_t sub_1000488C8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = ToolKitHelper.ValueSetType.init(rawValue:)(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1000488F8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t static ToolKitHelper.createAction(encodedToolInvocation:)(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = ToolInvocationBox.__allocating_init(encodedToolInvocation:)(a1, a2);
  if (!v2)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [(id)objc_opt_self(WFActionRegistry) sharedRegistry];
    a1 = ToolInvocationBox.createAction(given:)();
  }

  return a1;
}

uint64_t static ToolKitHelper.produceVariable(encodedReference:)()
{
  if (qword_1000699C0 != -1) {
    swift_once(&qword_1000699C0, sub_100047B9C);
  }
  uint64_t v3 = qword_10006A640;
  sub_100053180(&qword_10006A688, (void (*)(uint64_t))&type metadata accessor for TypedValue.ID);
  uint64_t v4 = sub_100053E2C();
  uint64_t v9 = dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v4, v5, v6, v7, v8);
  if (!v0)
  {
    uint64_t v3 = TypedValue.ID.variable.getter(v9);
    sub_1000537B4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  }

  return v3;
}

uint64_t static ToolKitHelper.decodeValueSetType(encodedDefinition:)(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = type metadata accessor for RestrictionContext.ValueSetDefinition.Inner(0LL);
  sub_100053BE8();
  __chkstk_darwin(v7);
  sub_100013318();
  uint64_t v10 = (void *)(v9 - v8);
  uint64_t v11 = type metadata accessor for RestrictionContext.ValueSetDefinition(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  sub_100053CCC();
  if (qword_1000699C0 != -1) {
    swift_once(&qword_1000699C0, sub_100047B9C);
  }
  sub_100053180( &qword_10006A690,  (void (*)(uint64_t))&type metadata accessor for RestrictionContext.ValueSetDefinition);
  uint64_t v14 = sub_1000538C8(v11, a1, a2, v11, v13);
  if (a1)
  {
    sub_100043C28();
    return 0LL;
  }

  RestrictionContext.ValueSetDefinition.inner.getter(v14);
  int v16 = (*(uint64_t (**)(void *, uint64_t))(v3 + 88))(v10, v6);
  if (v16 == enum case for RestrictionContext.ValueSetDefinition.Inner.dynamicEnumeration(_:))
  {
    sub_10000F508(v2, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
    sub_10005359C();
    swift_bridgeObjectRelease(v10[3]);
    sub_100008D58();
    return 1LL;
  }

  if (v16 == enum case for RestrictionContext.ValueSetDefinition.Inner.contentPropertyPossibleValues(_:))
  {
    sub_10000F508(v2, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
    sub_10005359C();
    uint64_t v17 = sub_10000844C(&qword_10006A698);
    swift_bridgeObjectRelease(*(void *)((char *)v10 + *(int *)(v17 + 48) + 8));
    uint64_t v18 = type metadata accessor for ContentItemClassDescriptor(0LL);
    sub_10000F4F4(v18);
    return 2LL;
  }

  if (v16 == enum case for RestrictionContext.ValueSetDefinition.Inner.linkQuery(_:))
  {
    sub_10000F508(v2, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
    sub_10005359C();
    uint64_t v19 = v10[1];
LABEL_13:
    swift_bridgeObjectRelease(v19);
    return 3LL;
  }

  if (v16 == enum case for RestrictionContext.ValueSetDefinition.Inner.linkQueryOnParameter(_:))
  {
    sub_10000F508(v2, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
    sub_10005359C();
    uint64_t v20 = v10[1];
    uint64_t v21 = v10[3];
    swift_bridgeObjectRelease(v10[5]);
    swift_bridgeObjectRelease(v21);
    uint64_t v19 = v20;
    goto LABEL_13;
  }

  uint64_t result = _diagnoseUnexpectedEnumCase<A>(type:)(v6, v6);
  __break(1u);
  return result;
}

void static ToolKitHelper.decodeDynamicEnumerationDefinition(encodedDefinition:)(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100053EC8();
  uint64_t v33 = *(void *)(v5 - 8);
  uint64_t v34 = v5;
  sub_100044D98();
  __chkstk_darwin(v6);
  uint64_t v32 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for RestrictionContext.ValueSetDefinition.Inner(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  sub_100013318();
  uint64_t v12 = (uint64_t *)(v11 - v10);
  uint64_t v13 = sub_100053DB4();
  uint64_t v35 = *(void *)(v13 - 8);
  sub_100044D98();
  __chkstk_darwin(v14);
  sub_100013318();
  if (qword_1000699C0 != -1) {
    swift_once(&qword_1000699C0, sub_100047B9C);
  }
  sub_100053180( &qword_10006A690,  (void (*)(uint64_t))&type metadata accessor for RestrictionContext.ValueSetDefinition);
  uint64_t v16 = dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v13, a1, a2, v13, v15);
  if (!v2)
  {
    RestrictionContext.ValueSetDefinition.inner.getter(v16);
    if ((*(unsigned int (**)(uint64_t *, uint64_t))(v9 + 88))(v12, v8) == enum case for RestrictionContext.ValueSetDefinition.Inner.dynamicEnumeration(_:))
    {
      sub_100043910((uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 96));
      uint64_t v17 = *v12;
      uint64_t v18 = v12[1];
      uint64_t v19 = v12[2];
      uint64_t v20 = v12[3];
      id v21 = objc_allocWithZone((Class)type metadata accessor for ToolKitHelper.DynamicEnumerationDefinition());
      sub_100048300(v17, v18, v19, v20);
    }

    else
    {
      sub_100043910((uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
      int v36 = 22;
      unint64_t v22 = sub_100050684((uint64_t)_swiftEmptyArrayStorage);
      sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
      uint64_t v24 = _BridgedStoredNSError.init(_:userInfo:)(&v36, v22, v34, v23);
      POSIXError._nsError.getter(v24);
      uint64_t v25 = sub_10005375C(v33);
      swift_willThrow(v25, v26, v27, v28, v29, v30, v31);
    }

    sub_100053984();
  }

  sub_100008D04();
}

void static ToolKitHelper.decodeContentPropertyPossibleValuesDefinition(encodedDefinition:)( uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100053EC8();
  uint64_t v45 = *(void *)(v5 - 8);
  uint64_t v46 = v5;
  sub_100044D98();
  __chkstk_darwin(v6);
  uint64_t v8 = sub_100053914(v7, v42);
  uint64_t v9 = type metadata accessor for RestrictionContext.ValueSetDefinition.Inner(v8);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = sub_100053A44();
  uint64_t v12 = type metadata accessor for ContentItemClassDescriptor(v11);
  uint64_t v43 = *(void *)(v12 - 8);
  uint64_t v44 = v12;
  sub_100044D98();
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v42 = (uint64_t)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v42 - v16;
  uint64_t v18 = sub_100053DB4();
  uint64_t v47 = *(void *)(v18 - 8);
  sub_100044D98();
  __chkstk_darwin(v19);
  sub_100053CB4();
  if (qword_1000699C0 != -1) {
    swift_once(&qword_1000699C0, sub_100047B9C);
  }
  sub_100053180( &qword_10006A690,  (void (*)(uint64_t))&type metadata accessor for RestrictionContext.ValueSetDefinition);
  uint64_t v20 = v48;
  uint64_t v22 = dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v18, a1, a2, v18, v21);
  if (!v20)
  {
    RestrictionContext.ValueSetDefinition.inner.getter(v22);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v10 + 88))(v2, v9) == enum case for RestrictionContext.ValueSetDefinition.Inner.contentPropertyPossibleValues(_:))
    {
      sub_100053D64(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 96));
      uint64_t v23 = (uint64_t *)(v2 + *(int *)(sub_10000844C(&qword_10006A698) + 48));
      uint64_t v24 = *v23;
      uint64_t v25 = v23[1];
      uint64_t v27 = v43;
      uint64_t v26 = v44;
      sub_100053D58((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 32));
      uint64_t v28 = v42;
      (*(void (**)(uint64_t, char *, uint64_t))(v27 + 16))(v42, v17, v26);
      id v29 = objc_allocWithZone((Class)type metadata accessor for ToolKitHelper.ContentPropertyPossibleValuesDefinition());
      sub_10004864C(v28, v24, v25);
      sub_100043910((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
    }

    else
    {
      sub_100053D64(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
      int v49 = 22;
      unint64_t v30 = sub_100050684((uint64_t)_swiftEmptyArrayStorage);
      sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
      uint64_t v31 = sub_100053EB4();
      uint64_t v34 = sub_100053D14(v31, v30, v32, v33);
      POSIXError._nsError.getter(v34);
      uint64_t v35 = sub_100053A88();
      swift_willThrow(v35, v36, v37, v38, v39, v40, v41);
    }

    sub_1000537B4(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 8));
  }

  sub_100008D04();
}

id sub_100049240(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  id v7 = a3;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v10 = v9;

  uint64_t v11 = (void *)a5(v8, v10);
  sub_100053750();
  return v11;
}

uint64_t static ToolKitHelper.runLinkQuery(_:encodedValueSet:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[31] = a3;
  v4[32] = a4;
  v4[29] = a1;
  v4[30] = a2;
  uint64_t v5 = sub_10000844C(&qword_10006A6B0);
  v4[33] = sub_100013328(*(void *)(v5 - 8));
  uint64_t v6 = sub_1000538F8();
  v4[34] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v4[35] = v7;
  v4[36] = sub_10005324C(v7);
  v4[37] = sub_1000421E4();
  uint64_t v8 = sub_10000844C(&qword_10006A6B8);
  v4[38] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v4[39] = v9;
  v4[40] = sub_100013328(v9);
  uint64_t v10 = type metadata accessor for SearchableItemPredicate(0LL);
  v4[41] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v4[42] = v11;
  v4[43] = sub_100013328(v11);
  uint64_t v12 = type metadata accessor for IdSearchPredicate(0LL);
  v4[44] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v4[45] = v13;
  v4[46] = sub_100013328(v13);
  uint64_t v14 = type metadata accessor for StringSearchPredicate(0LL);
  v4[47] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v4[48] = v15;
  v4[49] = sub_100013328(v15);
  uint64_t v16 = type metadata accessor for AnyPredicate(0LL);
  v4[50] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v4[51] = v17;
  v4[52] = sub_100013328(v17);
  uint64_t v18 = sub_100053EC8();
  v4[53] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v4[54] = v19;
  v4[55] = sub_100013328(v19);
  uint64_t v20 = type metadata accessor for Query(0LL);
  v4[56] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v4[57] = v21;
  v4[58] = sub_10005324C(v21);
  v4[59] = sub_1000421E4();
  uint64_t v22 = type metadata accessor for RestrictionContext.ValueSetDefinition.Inner(0LL);
  v4[60] = v22;
  uint64_t v23 = *(void *)(v22 - 8);
  v4[61] = v23;
  v4[62] = sub_10005324C(v23);
  v4[63] = sub_1000421E4();
  uint64_t v24 = type metadata accessor for RestrictionContext.ValueSetDefinition(0LL);
  v4[64] = v24;
  uint64_t v25 = *(void *)(v24 - 8);
  v4[65] = v25;
  v4[66] = sub_100013328(v25);
  sub_10000F3A0();
  return sub_10000F2D0();
}

uint64_t sub_100049488()
{
  id v2 = [(id)objc_opt_self(WFLinkActionProvider) sharedProvider];
  *(void *)(v0 + 536) = v2;
  if (qword_1000699C0 != -1) {
    swift_once(&qword_1000699C0, sub_100047B9C);
  }
  NSString v3 = *(NSString *)(v0 + 512);
  uint64_t v5 = *(void *)(v0 + 248);
  uint64_t v4 = *(void *)(v0 + 256);
  sub_100053180( &qword_10006A690,  (void (*)(uint64_t))&type metadata accessor for RestrictionContext.ValueSetDefinition);
  uint64_t v7 = sub_1000538C8((uint64_t)v3, v5, v4, (uint64_t)v3, v6);
  uint64_t v367 = v0;
  if (v3)
  {

    goto LABEL_23;
  }

  uint64_t v8 = RestrictionContext.ValueSetDefinition.bundleIdentifier.getter(v7);
  *(void *)(v0 + 544) = v8;
  *(void *)(v0 + 552) = v9;
  uint64_t v10 = *(void *)(v0 + 528);
  if (!v9)
  {
    uint64_t v16 = v0 + 756;
    sub_100053BB0();
    *(_DWORD *)(v0 + 756) = v17;
LABEL_22:
    unint64_t v42 = sub_100050684((uint64_t)_swiftEmptyArrayStorage);
    sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
    sub_100053E00(v16, v42, v44, v43);
    sub_1000536E0();
    sub_100043910( (uint64_t)v3,  (uint64_t (*)(uint64_t, uint64_t))OBJC_METACLASS____TtC24BackgroundShortcutRunner11TypeIndexer.vtable);
    sub_100053614();

    (*((void (**)(uint64_t, uint64_t))v1 + 1))(v10, v5);
    goto LABEL_23;
  }

  uint64_t v5 = v9;
  uint64_t v11 = *(void *)(v0 + 504);
  uint64_t v12 = *(void *)(v0 + 480);
  uint64_t v13 = *(void *)(v0 + 488);
  RestrictionContext.ValueSetDefinition.inner.getter(v8);
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 88);
  int v14 = v1(v11, v12);
  int v15 = enum case for RestrictionContext.ValueSetDefinition.Inner.linkQuery(_:);
  *(_DWORD *)(v0 + 76sub_10004094C(v0, 0) = enum case for RestrictionContext.ValueSetDefinition.Inner.linkQuery(_:);
  if (v14 == v15)
  {
    int v360 = v15;
    v349 = *(void (**)(void, void))(*(void *)(v0 + 488) + 96LL);
    v356 = v1;
    v349(*(void *)(v0 + 504), *(void *)(v0 + 480));
  }

  else
  {
    uint64_t v18 = *(void *)(v0 + 504);
    NSString v3 = *(NSString *)(v0 + 480);
    uint64_t v19 = *(void *)(v0 + 488);
    if (v14 != enum case for RestrictionContext.ValueSetDefinition.Inner.linkQueryOnParameter(_:))
    {
      sub_1000432F0();
      sub_100043380(v18, *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8));
      goto LABEL_21;
    }

    int v360 = v15;
    uint64_t v20 = sub_10000F674();
    v349 = (void (*)(void, void))v21;
    v356 = v1;
    v21(v20);
    swift_bridgeObjectRelease(*(void *)(v18 + 24));
    sub_100043024();
  }

  NSString v22 = sub_1000539AC();
  NSString v3 = String._bridgeToObjectiveC()();
  sub_100008D58();
  uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t)) [v2 queryMetadataByAppBundleIdentifier:v22 queryIdentifier:v3];
  *(void *)(v0 + 56sub_10004094C(v0, 0) = v1;

  if (!v1)
  {
    sub_1000432F0();
LABEL_21:
    uint64_t v16 = v0 + 744;
    uint64_t v10 = *(void *)(v0 + 528);
    sub_100053BB0();
    *(_DWORD *)(v0 + 744) = v41;
    goto LABEL_22;
  }

  NSString v23 = sub_1000539AC();
  NSString v24 = [v1 entityType];
  if (!v24)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    NSString v24 = String._bridgeToObjectiveC()();
    sub_100043D74();
  }

  id v25 = [v2 entityMetadataByAppBundleIdentifier:v23 entityIdentifier:v24];
  *(void *)(v0 + 568) = v25;

  if (!v25)
  {
    uint64_t v362 = *(void *)(v0 + 528);
    uint64_t v78 = *(void *)(v0 + 520);
    uint64_t v79 = *(void *)(v0 + 512);
    uint64_t v80 = *(void *)(v0 + 432);
    sub_1000432F0();
    *(_DWORD *)(v0 + 74sub_10004094C(v0, 0) = 22;
    sub_100050684((uint64_t)_swiftEmptyArrayStorage);
    sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
    sub_1000533D0(v81);
    sub_1000536E0();
    sub_100053388(*(uint64_t (**)(uint64_t, uint64_t))(v80 + 8));
    sub_100053614();

    (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v362, v79);
    goto LABEL_23;
  }

  unint64_t v26 = *(void *)(v0 + 240);
  v343 = v25;
  if (v26 >> 60 == 15)
  {
    if ((sub_100053DC0() & 1) != 0)
    {
      uint64_t v86 = v0 + 80;
      *(void *)(v0 + 104) = type metadata accessor for AllPredicate(0LL);
      sub_100053180(&qword_10006A6F8, (void (*)(uint64_t))&type metadata accessor for AllPredicate);
      *(void *)(v0 + 112) = v87;
      sub_1000527CC((void *)(v0 + 80));
      AllPredicate.init()();
    }

    else
    {
      if ((sub_100053DC0() & 2) == 0)
      {
        uint64_t v27 = *(void *)(v0 + 528);
        uint64_t v28 = *(void *)(v0 + 520);
        id v29 = v1;
        uint64_t v30 = *(void *)(v367 + 512);
        uint64_t v31 = *(void *)(v367 + 432);
        sub_1000432F0();
        *(_DWORD *)(v367 + 736) = 22;
        sub_100050684((uint64_t)_swiftEmptyArrayStorage);
        sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
        sub_1000533D0(v32);
        sub_1000536E0();
        sub_100053388(*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8));
        sub_100053614();

        sub_100053860( v33,  v34,  v35,  v36,  v37,  v38,  v39,  v40,  v231,  v240,  v248,  (uint64_t)v257,  v266,  (uint64_t)v275,  v285,  v295,  v306,  (uint64_t)v315,  (uint64_t)v325,  v335,  v25);
        (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v30);
        goto LABEL_23;
      }

      uint64_t v86 = v0 + 160;
      *(void *)(v0 + 184) = type metadata accessor for SuggestedPredicate(0LL);
      sub_100053180(&qword_10006A6C0, (void (*)(uint64_t))&type metadata accessor for SuggestedPredicate);
      *(void *)(v0 + 192) = v92;
      sub_1000527CC((void *)(v0 + 160));
      SuggestedPredicate.init()();
    }

    uint64_t v91 = Query.init(predicate:sort:limit:)(v86, 0LL, 0LL, 1LL);
  }

  else
  {
    uint64_t v82 = *(void *)(v0 + 448);
    sub_10003FCA4(*(void *)(v0 + 232), v26);
    sub_100053180(&qword_10006A700, (void (*)(uint64_t))&type metadata accessor for Query);
    uint64_t v83 = sub_100053F28();
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v83, v84, v26, v82, v85);
    sub_10003FCE8(*(void *)(v0 + 232), *(void *)(v0 + 240));
    uint64_t v88 = sub_10000F674();
    uint64_t v91 = sub_100043C08(v88, v89, v90);
  }

  uint64_t v94 = *(void *)(v0 + 408);
  uint64_t v93 = *(void *)(v0 + 416);
  uint64_t v95 = *(void *)(v0 + 400);
  Query.predicate.getter(v91);
  int v96 = (*(uint64_t (**)(uint64_t, uint64_t))(v94 + 88))(v93, v95);
  if (v96 == enum case for AnyPredicate.comparison(_:) || v96 == enum case for AnyPredicate.compound(_:))
  {
    uint64_t v98 = sub_100043820(*(void *)(v0 + 408));
    uint64_t v117 = (void *)Query.toTableTemplateValue()(v98);
    sub_10000F3A0();
    uint64_t v118 = TableTemplateValue<>.propertyQuery(metadata:actionIdentifier:)();
    uint64_t v119 = Query.limit.getter();
    char v121 = v120;

    uint64_t v123 = v121 & 1;
    uint64_t v124 = v119;
    uint64_t v125 = v123 | 0x4000000000000000LL;
LABEL_41:
    int v136 = v360;
    goto LABEL_42;
  }

  if (v96 == enum case for AnyPredicate.stringSearch(_:))
  {
    uint64_t v99 = *(void *)(v0 + 416);
    uint64_t v100 = *(void *)(v0 + 392);
    uint64_t v101 = *(void *)(v0 + 384);
    sub_100053620(*(void *)(v0 + 408));
    uint64_t v102 = sub_100043C08(v100, v99, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v101 + 32));
    uint64_t v118 = StringSearchPredicate.searchString.getter(v102);
    uint64_t v124 = v103;
    uint64_t v122 = sub_100053388(*(uint64_t (**)(uint64_t, uint64_t))(v101 + 8));
    uint64_t v125 = 0x2000000000000000LL;
    goto LABEL_41;
  }

  if (v96 == enum case for AnyPredicate.idSearch(_:))
  {
    uint64_t v104 = *(void *)(v0 + 408);
    uint64_t v105 = *(void *)(v0 + 416);
    uint64_t v107 = *(void *)(v0 + 360);
    uint64_t v106 = *(void *)(v0 + 368);
    uint64_t v108 = v1;
    uint64_t v109 = *(void *)(v367 + 352);
    sub_100053620(v104);
    uint64_t v110 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v107 + 32))(v106, v105, v109);
    IdSearchPredicate.identifiers.getter(v110);
    v111 = v108;
    uint64_t v112 = sub_100053D40();
    uint64_t v114 = sub_1000479AC(v112, v113);
    sub_100008D58();
    uint64_t v118 = (uint64_t)v114;
    uint64_t v115 = sub_100053F28();
    uint64_t v1 = v108;
    uint64_t v0 = v367;
    uint64_t v122 = v116(v115);
    uint64_t v124 = 0LL;
    uint64_t v125 = 0LL;
    goto LABEL_41;
  }

  if (v96 == enum case for AnyPredicate.searchableItem(_:))
  {
    uint64_t v126 = *(void *)(v0 + 416);
    uint64_t v128 = *(void *)(v0 + 336);
    uint64_t v127 = *(void *)(v0 + 344);
    uint64_t v129 = *(void *)(v0 + 320);
    uint64_t v130 = *(void *)(v0 + 328);
    uint64_t v365 = v130;
    uint64_t v319 = *(void *)(v0 + 304);
    uint64_t v329 = *(void *)(v0 + 312);
    sub_100053620(*(void *)(v0 + 408));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v128 + 32))(v127, v126, v130);
    uint64_t v131 = sub_10000844C(&qword_10006A6F0);
    uint64_t v132 = v1;
    uint64_t v133 = sub_100042644(v131, 40LL);
    *(_OWORD *)(v133 + 16) = xmmword_100059AE0;
    SearchableItemPredicate.searchableItem.getter();
    uint64_t v134 = SecureCodable.wrappedValue.getter(v319);
    uint64_t v135 = sub_100043FD4(v129, *(uint64_t (**)(uint64_t, uint64_t))(v329 + 8));
    *(void *)(v133 + 32) = v134;
    uint64_t v368 = v133;
    uint64_t v1 = v132;
    uint64_t v0 = v367;
    specialized Array._endMutation()(v135);
    uint64_t v118 = v368;
    uint64_t v122 = (*(uint64_t (**)(uint64_t, uint64_t))(v128 + 8))(v127, v365);
    uint64_t v124 = 0LL;
    uint64_t v125 = 0x6000000000000000LL;
    goto LABEL_41;
  }

  int v136 = v360;
  if (v96 == enum case for AnyPredicate.all(_:))
  {
    uint64_t v122 = sub_100043820(*(void *)(v0 + 408));
    uint64_t v124 = 0LL;
    uint64_t v125 = 0x8000000000000000LL;
    uint64_t v118 = 1LL;
    goto LABEL_42;
  }

  if (v96 == enum case for AnyPredicate.valid(_:) || v96 == enum case for AnyPredicate.suggested(_:))
  {
    uint64_t v122 = sub_100043820(*(void *)(v0 + 408));
    uint64_t v124 = 0LL;
    uint64_t v125 = 0x8000000000000000LL;
    uint64_t v118 = 2LL;
LABEL_42:
    uint64_t v310 = v125;
    uint64_t v320 = v124;
    *(void *)(v0 + 60sub_10004094C(v0, 0) = v125;
    *(void *)(v0 + 592) = v124;
    *(void *)(v0 + 584) = v118;
    *(void *)(v0 + 576) = 0LL;
    unint64_t v137 = *(void **)(v0 + 528);
    uint64_t v138 = *(void *)(v0 + 496);
    uint64_t v139 = *(void *)(v0 + 480);
    RestrictionContext.ValueSetDefinition.inner.getter(v122);
    uint64_t v140 = v356(v138, v139);
    *(_DWORD *)(v0 + 764) = v140;
    int v366 = v140;
    uint64_t v330 = v118;
    int v363 = v136;
    if ((_DWORD)v140 == v136)
    {
      sub_100053A00( v140,  v141,  v142,  v143,  v144,  v145,  v146,  v147,  v231,  v240,  v248,  (uint64_t)v257,  v266,  (uint64_t)v275,  v285,  v295,  v310,  v320,  v118,  (uint64_t)v1,  (uint64_t)v343,  (uint64_t (*)(void, void))v349);
      swift_bridgeObjectRelease(v137[1]);
      id v151 = v348;
      uint64_t v153 = 0LL;
      uint64_t v152 = 0LL;
    }

    else
    {
      if ((_DWORD)v140 != enum case for RestrictionContext.ValueSetDefinition.Inner.linkQueryOnParameter(_:))
      {
        uint64_t v165 = *(void *)(v0 + 520);
        uint64_t v364 = *(void *)(v0 + 496);
        uint64_t v290 = *(void *)(v0 + 512);
        uint64_t v301 = *(void *)(v0 + 488);
        uint64_t v354 = *(void *)(v0 + 528);
        uint64_t v359 = *(void *)(v0 + 480);
        uint64_t v166 = *(void *)(v0 + 456);
        sub_100053554();
        *(_DWORD *)(v367 + 752) = 22;
        sub_100050684((uint64_t)_swiftEmptyArrayStorage);
        sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
        sub_1000533D0(v167);
        sub_1000536E0();
        sub_100053388(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
        uint64_t v168 = sub_100053614();
        sub_100053AE4( v168,  v169,  v170,  v171,  v172,  v173,  v174,  v175,  v231,  v240,  v248,  (uint64_t)v257,  v266,  (uint64_t)v275,  v290,  v301,  v310,  v320,  v330,  v1);

        sub_100053860( v176,  v177,  v178,  v179,  v180,  v181,  v182,  v183,  v237,  v245,  v253,  v263,  v272,  (uint64_t)v282,  v291,  v302,  v312,  v322,  v332,  v340,  v343);
        sub_10005360C(v325, v315, v306);
        sub_100053B34(*(uint64_t (**)(uint64_t, uint64_t))(v166 + 8));
        (*(void (**)(uint64_t, uint64_t))(v165 + 8))(v354, v285);
LABEL_51:
        uint64_t v210 = v295;
LABEL_52:
        (*(void (**)(uint64_t, uint64_t))(v210 + 8))(v364, v359);
LABEL_23:
        sub_1000539B8();
        uint64_t v344 = *(void *)(v367 + 320);
        uint64_t v350 = *(void *)(v367 + 296);
        uint64_t v357 = *(void *)(v367 + 288);
        uint64_t v361 = *(void *)(v367 + 264);
        swift_task_dealloc();
        sub_10000F404();
        sub_10000F338();
        sub_10000F4A0();
        sub_10000F484();
        sub_10000F3FC();
        sub_10000F41C();
        sub_10000F3F4();
        swift_task_dealloc();
        uint64_t v45 = sub_10000F4EC();
        uint64_t v53 = sub_100044AF4( v45,  v46,  v47,  v48,  v49,  v50,  v51,  v52,  v231,  v240,  v248,  (uint64_t)v257,  v266,  (uint64_t)v275,  v285,  v295,  v306,  (uint64_t)v315,  (uint64_t)v325,  v335,  v344);
        uint64_t v61 = sub_100044940( v53,  v54,  v55,  v56,  v57,  v58,  v59,  v60,  v232,  v241,  v249,  v258,  v267,  (uint64_t)v276,  v286,  v296,  v307,  v316,  v326,  v336,  v345,  v350);
        uint64_t v69 = sub_100044584( v61,  v62,  v63,  v64,  v65,  v66,  v67,  v68,  v233,  v242,  v250,  v259,  v268,  (uint64_t)v277,  v287,  v297,  v308,  v317,  v327,  v337,  v346,  v351,  v357);
        sub_100043EE8( v69,  v70,  v71,  v72,  v73,  v74,  v75,  v76,  v234,  v243,  v251,  v260,  v269,  (uint64_t)v278,  v288,  v298,  v309,  v318,  v328,  v338,  v347,  v352,  v358,  v361);
        sub_100053AEC();
        __asm { BR              X0 }
      }

      sub_100053A00( v140,  v141,  v142,  v143,  v144,  v145,  v146,  v147,  v231,  v240,  v248,  (uint64_t)v257,  v266,  (uint64_t)v275,  v285,  v295,  v310,  v320,  v118,  (uint64_t)v1,  (uint64_t)v343,  (uint64_t (*)(void, void))v349);
      uint64_t v148 = v137[3];
      id v279 = (id)v137[2];
      swift_bridgeObjectRelease(v137[5]);
      NSString v149 = sub_1000539AC();
      NSString v150 = String._bridgeToObjectiveC()();
      sub_100043D74();
      id v151 = [v2 actionMetadataByAppBundleIdentifier:v149 actionIdentifier:v150];

      if (!v151)
      {
        uint64_t v355 = *(void *)(v0 + 520);
        uint64_t v359 = *(void *)(v0 + 512);
        uint64_t v364 = *(void *)(v0 + 528);
        uint64_t v211 = *(void *)(v0 + 456);
        sub_100053554();
        swift_bridgeObjectRelease(v148);
        *(_DWORD *)(v367 + 748) = 22;
        sub_100050684((uint64_t)_swiftEmptyArrayStorage);
        sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
        sub_1000533D0(v212);
        sub_1000536E0();
        sub_100053388(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
        uint64_t v213 = sub_100053614();
        sub_100053AE4( v213,  v214,  v215,  v216,  v217,  v218,  v219,  v220,  v235,  v244,  v252,  v261,  v270,  (uint64_t)v279,  v289,  v299,  v311,  v321,  (uint64_t)v331,  v339);

        sub_100053860( v221,  v222,  v223,  v224,  v225,  v226,  v227,  v228,  v239,  v247,  v256,  v265,  v274,  (uint64_t)v284,  v294,  v305,  v314,  v324,  v334,  v342,  v348);
        sub_10005360C(v325, v315, v306);
        sub_100053B34(*(uint64_t (**)(uint64_t, uint64_t))(v211 + 8));
        uint64_t v210 = v355;
        goto LABEL_52;
      }

      uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t))v339;
      uint64_t v152 = v148;
      uint64_t v153 = (uint64_t)v279;
    }

    BOOL v300 = v366 != v136;
    *(void *)(v0 + 624) = v152;
    *(void *)(v0 + 616) = v153;
    *(void *)(v0 + 608) = v151;
    uint64_t v154 = v153;
    id v353 = [(id)objc_opt_self(LNConnectionPolicy) policyWithEntityQueryMetadata:v1];
    *(void *)(v0 + 632) = v353;
    sub_10005349C((uint64_t)v353, &qword_10006A6C8, &OBJC_CLASS___LNConfigurableQueryRequest_ptr);
    id v280 = objc_allocWithZone(&OBJC_CLASS___LNQueryRequestOptions);
    uint64_t v155 = (uint64_t)v151;
    sub_100052860(v331, v321, v311, 0LL);
    sub_1000528BC(v151, v154, v152, v300);
    id v236 = [v280 init];
    unint64_t v156 = v311;
    uint64_t v262 = v155;
    uint64_t v271 = v152;
    id v281 = (id)v154;
    uint64_t v157 = (void *)LNConfigurableQueryRequest.init(query:target:options:)(v331, v321, v311, 0LL, v155, v154, v152, v300);
    *(void *)(v0 + 64sub_10004094C(v0, 0) = v157;
    *(void *)(v0 + 20sub_10004094C(v0, 0) = 0LL;
    id v158 = [v353 connectionWithError:v0 + 200];
    *(void *)(v0 + 648) = v158;
    Swift::Int v159 = *(void **)(v0 + 200);
    if (v158)
    {
      v160 = v158;
      *(void *)(v0 + 56) = v0 + 224;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 24) = sub_10004A33C;
      uint64_t v161 = swift_continuation_init(v0 + 16, 1LL);
      *(void *)(v0 + 12sub_10004094C(v0, 0) = _NSConcreteStackBlock;
      uint64_t v162 = v0 + 120;
      *(void *)(v162 + 8) = 0x40000000LL;
      sub_100053DE0(v161, (uint64_t)sub_10004B11C);
      id v163 = v159;
      [v160 performConfigurableQuery:v157 completionHandler:v162];
      sub_100053AEC();
      return swift_continuation_await();
    }

    char v184 = v366 != v363;
    uint64_t v359 = *(void *)(v0 + 512);
    uint64_t v364 = *(void *)(v0 + 528);
    uint64_t v292 = *(void *)(v0 + 472);
    uint64_t v303 = *(void *)(v0 + 520);
    uint64_t v185 = *(void *)(v0 + 456);
    uint64_t v254 = *(void *)(v0 + 448);
    id v186 = v159;
    sub_1000432F0();
    _convertNSErrorToError(_:)(v159);

    uint64_t v194 = swift_willThrow(v187, v188, v189, v190, v191, v192, v193);
    sub_100053AE4( v194,  v195,  v196,  v197,  v198,  v199,  v200,  v201,  (uint64_t)v236,  v244,  v254,  v262,  v271,  (uint64_t)v281,  v292,  v303,  v311,  v321,  (uint64_t)v331,  v339);

    sub_100053860( v202,  v203,  v204,  v205,  v206,  v207,  v208,  v209,  v238,  v246,  v255,  v264,  v273,  (uint64_t)v283,  v293,  v304,  v313,  v323,  v333,  v341,  v348);
    sub_1000528E8(v257, (uint64_t)v275, v266, v184);
    sub_10005360C(v325, v315, v156);
    (*(void (**)(uint64_t, uint64_t))(v185 + 8))(v285, v248);
    goto LABEL_51;
  }

  sub_100053AEC();
  return _diagnoseUnexpectedEnumCase<A>(type:)(v229, v230);
}

uint64_t sub_10004A33C()
{
  *(void *)(v0 + 656) = v1;
  if (v1) {
    swift_bridgeObjectRelease(*(void *)(v0 + 552));
  }
  sub_10000F3A0();
  return sub_10000F2D0();
}

uint64_t sub_10004A3C8()
{
  *(void *)(v0 + 664) = *(void *)(v0 + 224);
  id v1 = sub_100053D70();
  id v2 = [v1 valueType];

  id v3 = sub_100053D70();
  sub_1000477EC();
  NSString v4 = String._bridgeToObjectiveC()();
  sub_100042E4C();
  *(void *)(v0 + 672) =  objc_msgSend( v2,  "wf_contentCollectionFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:",  v3,  v4,  0);

  id v6 = sub_100043854(v5, "items");
  sub_10005349C((uint64_t)v6, &qword_10006A6D0, &OBJC_CLASS___WFContentItem_ptr);
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v7);
  *(void *)(v0 + 68sub_10004094C(v0, 0) = v8;

  if ((unint64_t)v8 >> 62)
  {
    if (v8 < 0) {
      uint64_t v131 = v8;
    }
    else {
      uint64_t v131 = v8 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v8);
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter(v131);
    uint64_t v9 = sub_100008D58();
  }

  else
  {
    uint64_t v10 = *(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  *(void *)(v0 + 688) = v10;
  if (!v10)
  {
    uint64_t v13 = *(void *)(v0 + 576);
    swift_bridgeObjectRelease(*(void *)(v0 + 680));
    if (qword_1000699C8 != -1) {
      swift_once(&qword_1000699C8, sub_100047BB8);
    }
    *(void *)(v0 + 216) = _swiftEmptyArrayStorage;
    sub_10000844C(&qword_10006A6D8);
    sub_100052920();
    uint64_t v14 = sub_100044B04();
    dispatch thunk of PropertyListEncoder.encode<A>(_:)(v14, v15, v16);
    int v17 = *(void **)(v0 + 672);
    uint64_t v18 = *(void **)(v0 + 664);
    uint64_t v19 = *(void **)(v0 + 648);
    uint64_t v20 = *(void **)(v0 + 640);
    uint64_t v261 = *(void **)(v0 + 632);
    sub_100053A9C();
    int v21 = *(_DWORD *)(v0 + 764);
    uint64_t v262 = *(void **)(v0 + 592);
    unint64_t v263 = *(void *)(v0 + 600);
    NSString v22 = *(void **)(v0 + 584);
    uint64_t v264 = *(void **)(v0 + 568);
    int v23 = *(_DWORD *)(v0 + 760);
    NSString v24 = *(void **)(v0 + 536);
    sub_100053CFC();
    if (v13)
    {
      uint64_t v253 = *(void *)(v0 + 456);
      uint64_t v257 = *(void *)(v0 + 448);
      uint64_t v259 = *(void *)(v0 + 472);

      sub_10005360C(v22, v262, v263);
      sub_100053C7C();
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      (*(void (**)(uint64_t, uint64_t))(v253 + 8))(v259, v257);
      sub_100053C5C();
      uint64_t v28 = sub_1000539B8();
      sub_1000537E0(v28);
      sub_10000F404();
      sub_10000F338();
      sub_10000F4A0();
      sub_10000F484();
      sub_10000F3FC();
      sub_10000F41C();
      sub_10000F3F4();
      sub_10000F4EC();
      sub_10000F4A8();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_100053C18();
      __asm { BR              X0 }
    }

    uint64_t v132 = v26;
    uint64_t v144 = v25;
    uint64_t v180 = *(void *)(v0 + 504);
    uint64_t v192 = *(void *)(v0 + 496);
    uint64_t v156 = *(void *)(v0 + 456);
    uint64_t v168 = *(void *)(v0 + 448);
    uint64_t v213 = *(void *)(v0 + 464);
    uint64_t v222 = *(void *)(v0 + 440);
    sub_100053708();
    uint64_t v260 = *(void *)(v0 + 288);
    uint64_t v203 = *(void *)(v0 + 264);

    sub_10005360C(v22, v262, v263);
    sub_1000528E8(v265, v266, v267, v21 != v23);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    sub_100053448(v156);
    sub_100043184(*(uint64_t (**)(uint64_t))(v268 + 8));
    uint64_t v34 = sub_10000F404();
    uint64_t v42 = sub_100043EF8(v34, v35, v36, v37, v38, v39, v40, v41, v132, v144, v156, v168, v180);
    sub_100043D94(v42, v43, v44, v45, v46, v47, v48, v49, v133, v145, v157, v169, v181, v192);
    uint64_t v50 = sub_10000F4A0();
    uint64_t v58 = sub_100043BBC(v50, v51, v52, v53, v54, v55, v56, v57, v134, v146, v158, v170, v182, v193, v203, v213);
    uint64_t v66 = sub_100043BB4(v58, v59, v60, v61, v62, v63, v64, v65, v135, v147, v159, v171, v183, v194, v204, v214, v222);
    uint64_t v74 = sub_1000435E4( v66,  v67,  v68,  v69,  v70,  v71,  v72,  v73,  v136,  v148,  v160,  v172,  v184,  v195,  v205,  v215,  v223,  v230);
    uint64_t v82 = sub_100043900( v74,  v75,  v76,  v77,  v78,  v79,  v80,  v81,  v137,  v149,  v161,  v173,  v185,  v196,  v206,  v216,  v224,  v231,  v237);
    uint64_t v90 = sub_100043AE4( v82,  v83,  v84,  v85,  v86,  v87,  v88,  v89,  v138,  v150,  v162,  v174,  v186,  v197,  v207,  v217,  v225,  v232,  v238,  v243);
    uint64_t v98 = sub_100044AF4( v90,  v91,  v92,  v93,  v94,  v95,  v96,  v97,  v139,  v151,  v163,  v175,  v187,  v198,  v208,  v218,  v226,  v233,  v239,  v244,  v248);
    uint64_t v106 = sub_100044940( v98,  v99,  v100,  v101,  v102,  v103,  v104,  v105,  v140,  v152,  v164,  v176,  v188,  v199,  v209,  v219,  v227,  v234,  v240,  v245,  v249,  v252);
    uint64_t v114 = sub_100044584( v106,  v107,  v108,  v109,  v110,  v111,  v112,  v113,  v141,  v153,  v165,  v177,  v189,  v200,  v210,  v220,  v228,  v235,  v241,  v246,  v250,  v254,  v256);
    uint64_t v122 = sub_100043EE8( v114,  v115,  v116,  v117,  v118,  v119,  v120,  v121,  v142,  v154,  v166,  v178,  v190,  v201,  v211,  v221,  v229,  v236,  v242,  v247,  v251,  v255,  v258,  v260);
    sub_100043CE8(v122, v123, v124, v125, v126, v127, v128, v129, v143, v155, v167, v179, v191, v202, v212);
    sub_100053C18();
    __asm { BR              X2 }
  }

  *(void *)(v0 + 696) = _swiftEmptyArrayStorage;
  uint64_t v11 = *(void *)(v0 + 680);
  if ((v11 & 0xC000000000000001LL) != 0) {
    uint64_t v12 = sub_100053CAC(v9, v11);
  }
  else {
    uint64_t v12 = (uint64_t)sub_100053C10(v9, v11);
  }
  *(void *)(v0 + 704) = v12;
  *(void *)(v0 + 712) = 1LL;
  uint64_t v30 = sub_100053C8C();
  sub_100053488(v30);
  uint64_t v31 = (void *)swift_task_alloc(async function pointer to WFContentItem.resolve(with:)[1]);
  *(void *)(v0 + 72sub_10004094C(v0, 0) = v31;
  sub_100053E68(v31);
  sub_100053C18();
  return WFContentItem.resolve(with:)();
}

uint64_t sub_10004A87C()
{
  *(void *)(v1 + 728) = v0;
  swift_task_dealloc();
  sub_10000D8E0(*(void *)(v1 + 264), &qword_10006A6B0);
  if (v0)
  {
    sub_100042E4C();
    sub_100008D58();
  }

  sub_10000F3A0();
  return sub_100053330();
}

uint64_t sub_10004A940()
{
  char v1 = sub_1000538C0();
  uint64_t v4 = *(void *)(v0 + 696);
  if ((v1 & 1) == 0) {
    uint64_t v4 = sub_100053654( 0LL,  *(void *)(v4 + 16) + 1LL,  v2,  v3,  &qword_10006A970,  (void (*)(void))&type metadata accessor for TypedValue);
  }
  unint64_t v6 = *(void *)(v4 + 16);
  unint64_t v5 = *(void *)(v4 + 24);
  if (v6 >= v5 >> 1) {
    uint64_t v4 = sub_100053654( v5 > 1,  v6 + 1,  v2,  v3,  &qword_10006A970,  (void (*)(void))&type metadata accessor for TypedValue);
  }
  uint64_t v7 = *(void *)(v0 + 712);
  uint64_t v8 = *(void **)(v0 + 704);
  uint64_t v9 = *(void *)(v0 + 688);
  uint64_t v10 = *(void *)(v0 + 288);
  uint64_t v11 = *(void *)(v0 + 280);
  *(void *)(v4 + 16) = v6 + 1;
  sub_100043C08( v4 + ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))
  + *(void *)(v11 + 72) * v6,
    v10,
    *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));

  sub_100053388(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  if (v7 == v9)
  {
    uint64_t v12 = *(void *)(v0 + 728);
    swift_bridgeObjectRelease(*(void *)(v0 + 680));
    if (qword_1000699C8 != -1) {
      swift_once(&qword_1000699C8, sub_100047BB8);
    }
    *(void *)(v0 + 216) = v4;
    sub_10000844C(&qword_10006A6D8);
    unint64_t v13 = sub_100053E40();
    sub_1000537D0(v13);
    uint64_t v14 = *(void **)(v0 + 672);
    uint64_t v15 = *(void **)(v0 + 664);
    uint64_t v16 = *(void **)(v0 + 648);
    int v17 = *(void **)(v0 + 640);
    uint64_t v244 = *(void **)(v0 + 632);
    sub_100053A9C();
    int v18 = *(_DWORD *)(v0 + 764);
    uint64_t v245 = *(void **)(v0 + 592);
    unint64_t v246 = *(void *)(v0 + 600);
    uint64_t v243 = *(void **)(v0 + 584);
    uint64_t v247 = *(void **)(v0 + 568);
    int v19 = *(_DWORD *)(v0 + 760);
    uint64_t v20 = *(void **)(v0 + 536);
    sub_100053CFC();
    if (v12)
    {
      uint64_t v241 = *(void *)(v0 + 456);

      sub_10005360C(v243, v245, v246);
      sub_1000528E8(v248, v249, v250, v18 != v19);
      sub_100042E4C();
      sub_100053448(v241);
      sub_100053C5C();
      sub_1000537E0(*(void *)(v0 + 528));
      sub_10000F404();
      sub_10000F338();
      sub_10000F484();
      sub_10000F3FC();
      sub_10000F41C();
      sub_10000F3F4();
      sub_10000F4EC();
      sub_10000F4A8();
      sub_10000F4A0();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      sub_100053B18();
      __asm { BR              X0 }
    }

    uint64_t v121 = v22;
    uint64_t v132 = v21;
    uint64_t v176 = *(void *)(v0 + 504);
    uint64_t v187 = *(void *)(v0 + 496);
    uint64_t v143 = *(void *)(v0 + 456);
    uint64_t v154 = *(void *)(v0 + 448);
    uint64_t v165 = *(void *)(v0 + 472);
    uint64_t v197 = *(void *)(v0 + 464);
    uint64_t v206 = *(void *)(v0 + 440);
    sub_100053708();
    uint64_t v242 = *(void *)(v0 + 288);

    sub_10005360C(v243, v245, v246);
    sub_100053C7C();
    sub_100042E4C();
    (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v165, v154);
    sub_100043184(*(uint64_t (**)(uint64_t))(v251 + 8));
    uint64_t v29 = sub_10000F404();
    uint64_t v37 = sub_100043D94(v29, v30, v31, v32, v33, v34, v35, v36, v121, v132, v143, v154, v165, v176);
    sub_100043CE8(v37, v38, v39, v40, v41, v42, v43, v44, v122, v133, v144, v155, v166, v177, v187);
    uint64_t v45 = sub_10000F338();
    uint64_t v53 = sub_100043BBC(v45, v46, v47, v48, v49, v50, v51, v52, v123, v134, v145, v156, v167, v178, v188, v197);
    uint64_t v61 = sub_100043BB4(v53, v54, v55, v56, v57, v58, v59, v60, v124, v135, v146, v157, v168, v179, v189, v198, v206);
    uint64_t v69 = sub_1000435E4( v61,  v62,  v63,  v64,  v65,  v66,  v67,  v68,  v125,  v136,  v147,  v158,  v169,  v180,  v190,  v199,  v207,  v214);
    uint64_t v77 = sub_100043900( v69,  v70,  v71,  v72,  v73,  v74,  v75,  v76,  v126,  v137,  v148,  v159,  v170,  v181,  v191,  v200,  v208,  v215,  v221);
    uint64_t v85 = sub_100043AE4( v77,  v78,  v79,  v80,  v81,  v82,  v83,  v84,  v127,  v138,  v149,  v160,  v171,  v182,  v192,  v201,  v209,  v216,  v222,  v227);
    uint64_t v93 = sub_100044AF4( v85,  v86,  v87,  v88,  v89,  v90,  v91,  v92,  v128,  v139,  v150,  v161,  v172,  v183,  v193,  v202,  v210,  v217,  v223,  v228,  v232);
    uint64_t v101 = sub_100044940( v93,  v94,  v95,  v96,  v97,  v98,  v99,  v100,  v129,  v140,  v151,  v162,  v173,  v184,  v194,  v203,  v211,  v218,  v224,  v229,  v233,  v236);
    uint64_t v109 = sub_100044584( v101,  v102,  v103,  v104,  v105,  v106,  v107,  v108,  v130,  v141,  v152,  v163,  v174,  v185,  v195,  v204,  v212,  v219,  v225,  v230,  v234,  v237,  v239);
    sub_100043EE8( v109,  v110,  v111,  v112,  v113,  v114,  v115,  v116,  v131,  v142,  v153,  v164,  v175,  v186,  v196,  v205,  v213,  v220,  v226,  v231,  v235,  v238,  v240,  v242);
    swift_task_dealloc();
    sub_100053B18();
    __asm { BR              X2 }
  }

  uint64_t v25 = *(void *)(v0 + 712);
  *(void *)(v0 + 696) = v4;
  uint64_t v26 = *(void *)(v0 + 680);
  if ((v26 & 0xC000000000000001LL) != 0) {
    id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v25, v26);
  }
  else {
    id v27 = sub_1000430AC(v26 + 8 * v25);
  }
  *(void *)(v0 + 704) = v27;
  *(void *)(v0 + 712) = v25 + 1;
  if (__OFADD__(v25, 1LL)) {
    __break(1u);
  }
  uint64_t v118 = sub_100053C8C();
  sub_100053488(v118);
  uint64_t v119 = (void *)swift_task_alloc(async function pointer to WFContentItem.resolve(with:)[1]);
  *(void *)(v0 + 72sub_10004094C(v0, 0) = v119;
  sub_100053E68(v119);
  sub_100053B18();
  return WFContentItem.resolve(with:)();
}

uint64_t sub_10004ADB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = *(void **)(v7 + 648);
  uint64_t v9 = *(void **)(v7 + 640);
  uint64_t v10 = *(void **)(v7 + 632);
  uint64_t v55 = *(void *)(v7 + 616);
  uint64_t v11 = *(void **)(v7 + 608);
  uint64_t v71 = *(void *)(v7 + 624);
  uint64_t v75 = *(void **)(v7 + 592);
  uint64_t v67 = *(void **)(v7 + 584);
  uint64_t v12 = *(void **)(v7 + 568);
  unint64_t v13 = *(void **)(v7 + 560);
  uint64_t v14 = *(void **)(v7 + 536);
  uint64_t v92 = *(void *)(v7 + 528);
  unint64_t v80 = *(void *)(v7 + 600);
  uint64_t v85 = *(void *)(v7 + 520);
  uint64_t v89 = *(void *)(v7 + 512);
  uint64_t v51 = *(void *)(v7 + 456);
  uint64_t v59 = *(void *)(v7 + 448);
  uint64_t v63 = *(void *)(v7 + 472);
  char v15 = *(_DWORD *)(v7 + 764) != *(_DWORD *)(v7 + 760);
  swift_willThrow(a1, a2, a3, a4, a5, a6, a7);

  sub_1000528E8(v11, v55, v71, v15);
  sub_10005360C(v67, v75, v80);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v63, v59);
  (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v92, v89);
  sub_1000536A0();
  uint64_t v76 = v17;
  uint64_t v81 = v16;
  uint64_t v86 = *(void *)(v7 + 296);
  uint64_t v90 = *(void *)(v7 + 288);
  uint64_t v93 = *(void *)(v7 + 264);
  swift_task_dealloc();
  sub_10000F338();
  sub_10000F4A0();
  sub_10000F484();
  sub_10000F3FC();
  sub_10000F41C();
  sub_10000F3F4();
  sub_10000F4EC();
  sub_10000F4A8();
  uint64_t v18 = sub_10000F404();
  uint64_t v26 = sub_100043BBC(v18, v19, v20, v21, v22, v23, v24, v25, v51, v55, v59, v63, (uint64_t)v67, v71, v76, v81);
  uint64_t v34 = sub_100043BB4(v26, v27, v28, v29, v30, v31, v32, v33, v52, v56, v60, v64, v68, v72, v77, v82, v86);
  uint64_t v42 = sub_1000435E4(v34, v35, v36, v37, v38, v39, v40, v41, v53, v57, v61, v65, v69, v73, v78, v83, v87, v90);
  sub_100043900(v42, v43, v44, v45, v46, v47, v48, v49, v54, v58, v62, v66, v70, v74, v79, v84, v88, v91, v93);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_10004AF58()
{
  char v1 = *(void **)(v0 + 704);
  uint64_t v2 = *(void **)(v0 + 672);
  uint64_t v3 = *(void **)(v0 + 664);
  uint64_t v4 = *(void **)(v0 + 648);
  unint64_t v5 = *(void **)(v0 + 640);
  unint64_t v6 = *(void **)(v0 + 632);
  uint64_t v49 = *(void *)(v0 + 616);
  uint64_t v43 = *(void **)(v0 + 608);
  HIDWORD(v4sub_10004094C(v0, 0) = *(_DWORD *)(v0 + 764);
  unint64_t v68 = *(void *)(v0 + 600);
  uint64_t v61 = *(void *)(v0 + 624);
  uint64_t v64 = *(void **)(v0 + 592);
  uint64_t v58 = *(void **)(v0 + 584);
  uint64_t v7 = *(void **)(v0 + 568);
  int v8 = *(_DWORD *)(v0 + 760);
  uint64_t v9 = *(void **)(v0 + 536);
  uint64_t v77 = *(void *)(v0 + 528);
  uint64_t v72 = *(void *)(v0 + 520);
  uint64_t v75 = *(void *)(v0 + 512);
  uint64_t v46 = *(void *)(v0 + 456);
  uint64_t v52 = *(void *)(v0 + 448);
  uint64_t v55 = *(void *)(v0 + 472);

  sub_1000528E8(v43, v49, v61, HIDWORD(v40) != v8);
  sub_10005360C(v58, v64, v68);
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v55, v52);
  (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v77, v75);
  sub_1000536A0();
  uint64_t v65 = v11;
  uint64_t v69 = v10;
  uint64_t v73 = *(void *)(v0 + 296);
  uint64_t v76 = *(void *)(v0 + 288);
  swift_task_dealloc();
  sub_10000F338();
  sub_10000F4A0();
  sub_10000F484();
  sub_10000F3FC();
  sub_10000F41C();
  sub_10000F3F4();
  sub_10000F4EC();
  sub_10000F4A8();
  uint64_t v12 = sub_10000F404();
  uint64_t v20 = sub_100043900( v12,  v13,  v14,  v15,  v16,  v17,  v18,  v19,  v37,  v40,  (uint64_t)v43,  v46,  v49,  v52,  v55,  (uint64_t)v58,  v61,  v65,  v69);
  uint64_t v28 = sub_100043AE4( v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v38,  v41,  v44,  v47,  v50,  v53,  v56,  v59,  v62,  v66,  v70,  v73);
  sub_100044AF4(v28, v29, v30, v31, v32, v33, v34, v35, v39, v42, v45, v48, v51, v54, v57, v60, v63, v67, v71, v74, v76);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10004B11C(uint64_t a1, void *a2, void *a3)
{
  return sub_1000500F0(a1, a2, a3, (uint64_t (*)(void, void *))sub_10004B16C);
}

uint64_t sub_10004B128()
{
  uint64_t v2 = sub_10000844C(&qword_100069A88);
  uint64_t v3 = sub_100009BE0(v2, (uint64_t)&protocol self-conformance witness table for Error);
  *uint64_t v4 = v0;
  return swift_continuation_throwingResumeWithError(v1, v3);
}

uint64_t sub_10004B16C(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 4Hasher.init(_seed:)(v3, 0LL) = a2;
  return swift_continuation_throwingResume();
}

uint64_t sub_10004B1F0(void *a1, void *a2, void *aBlock)
{
  v3[2] = _Block_copy(aBlock);
  if (a1)
  {
    id v6 = a1;
    id v7 = a2;
    a1 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)(a1);
    uint64_t v9 = v8;
  }

  else
  {
    id v10 = a2;
    uint64_t v9 = 0xF000000000000000LL;
  }

  v3[3] = a1;
  v3[4] = v9;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v13 = v12;

  v3[5] = v11;
  v3[6] = v13;
  uint64_t v14 = (void *)swift_task_alloc(dword_10006A6AC);
  v3[7] = v14;
  *uint64_t v14 = v3;
  v14[1] = sub_10004B2B4;
  return static ToolKitHelper.runLinkQuery(_:encodedValueSet:)((uint64_t)a1, v9, v11, v13);
}

uint64_t sub_10004B2B4()
{
  uint64_t v5 = *v1;
  sub_10000F668(*(void *)(v5 + 56), &v5);
  sub_100053E5C();
  sub_10003FCE8(v3, (unint64_t)v2);
  if (v0)
  {
    sub_10005376C();
    sub_1000534A4();
    sub_100053E50();
  }

  else
  {
    sub_10005347C();
    sub_1000533C0();
    sub_100053D94();
  }

  sub_100053364();

  sub_1000537FC();
  return sub_100044D64((uint64_t (*)(void))v1[1]);
}

uint64_t static ToolKitHelper.decodeSearchString(in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = sub_100053914(v7, v34);
  uint64_t v9 = type metadata accessor for AnyPredicate(v8);
  sub_100053BE8();
  __chkstk_darwin(v10);
  uint64_t v11 = sub_100053A44();
  uint64_t v35 = *(void *)(type metadata accessor for StringSearchPredicate(v11) - 8);
  sub_100044D98();
  __chkstk_darwin(v12);
  sub_100013318();
  uint64_t v15 = v14 - v13;
  uint64_t v16 = type metadata accessor for Query(0LL);
  uint64_t v36 = *(void *)(v16 - 8);
  sub_100044D98();
  __chkstk_darwin(v17);
  sub_100053CCC();
  if (qword_1000699C0 != -1) {
    swift_once(&qword_1000699C0, sub_100047B9C);
  }
  sub_100053180(&qword_10006A700, (void (*)(uint64_t))&type metadata accessor for Query);
  uint64_t v19 = dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v16, a1, a2, v16, v18);
  if (!v37)
  {
    Query.predicate.getter(v19);
    if ((*(unsigned int (**)(uint64_t, uint64_t))(v2 + 88))(v3, v9) == enum case for AnyPredicate.stringSearch(_:))
    {
      sub_100043910(v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 96));
      uint64_t v20 = sub_100053D58(v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 32));
      StringSearchPredicate.searchString.getter(v20);
      sub_100043910(v15, *(uint64_t (**)(uint64_t, uint64_t))(v35 + 8));
    }

    else
    {
      sub_100043910(v3, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      unint64_t v21 = sub_100050684((uint64_t)_swiftEmptyArrayStorage);
      sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
      uint64_t v22 = sub_100053EB4();
      uint64_t v25 = sub_100053D14(v22, v21, v23, v24);
      POSIXError._nsError.getter(v25);
      uint64_t v26 = sub_100053A88();
      swift_willThrow(v26, v27, v28, v29, v30, v31, v32);
    }

    sub_10005375C(v36);
  }

  return sub_1000539E8();
}

uint64_t static ToolKitHelper.produceEncodedTypedValue(collection:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  uint64_t v4 = sub_100053ED0();
  v3[5] = sub_100013328(*(void *)(v4 - 8));
  uint64_t v5 = sub_10000844C(&qword_10006A710);
  v3[6] = sub_100013328(*(void *)(v5 - 8));
  uint64_t v6 = sub_1000538F8();
  v3[7] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[8] = v7;
  void v3[9] = sub_100013328(v7);
  uint64_t v8 = type metadata accessor for TypeInstance(0LL);
  v3[10] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[11] = v9;
  v3[12] = sub_10005324C(v9);
  v3[13] = sub_1000421E4();
  sub_10000F3A0();
  return sub_10000F2D0();
}

uint64_t sub_10004B6E4()
{
  if (qword_1000699C0 != -1) {
    swift_once(&qword_1000699C0, sub_100047B9C);
  }
  uint64_t v1 = v0[4];
  sub_100053180(&qword_10006A718, (void (*)(uint64_t))&type metadata accessor for TypeInstance);
  sub_1000536E8(v2);
  if (v1)
  {
    sub_100053BC8();
    sub_10000F404();
    sub_10000F338();
    sub_10000F484();
    sub_10000F3FC();
    uint64_t v3 = (uint64_t (*)(void))sub_100044674();
    return sub_100053298(v3);
  }

  else
  {
    uint64_t v5 = (*(uint64_t (**)(void, void, void))(v0[11] + 16LL))(v0[12], v0[13], v0[10]);
    ((void (*)(uint64_t))static DisplayRepresentationConfiguration.fileBackedImages.getter)(v5);
    uint64_t v6 = sub_10000F674();
    ((void (*)(uint64_t))WFContentCollection.TypedValueResolutionContext.init(expectedType:displayRepresentationConfig:))(v6);
    uint64_t v7 = ((uint64_t (*)(void))type metadata accessor for WFContentCollection.TypedValueResolutionContext)(0LL);
    sub_100053A30(v7);
    uint64_t v8 = (void *)swift_task_alloc(async function pointer to WFContentCollection.resolve(with:)[1]);
    v0[14] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_10004B800;
    return ((uint64_t (*)(void, void))WFContentCollection.resolve(with:))(v0[9], v0[6]);
  }

uint64_t sub_10004B800()
{
  uint64_t v3 = *(void *)(v2 + 48);
  *uint64_t v4 = *v1;
  *(void *)(v2 + 12sub_10004094C(v0, 0) = v0;
  swift_task_dealloc();
  sub_10000D8E0(v3, &qword_10006A710);
  sub_10000F3A0();
  return sub_100053474();
}

uint64_t sub_10004B868()
{
  if (qword_1000699C8 != -1) {
    swift_once(&qword_1000699C8, sub_100047BB8);
  }
  uint64_t v1 = v0[15];
  sub_100053180(&qword_10006A6E8, (void (*)(uint64_t))&type metadata accessor for TypedValue);
  sub_100053378(v2);
  if (v1)
  {
    sub_100043820(v0[8]);
    sub_100043820(v0[11]);
    sub_100053BC8();
    sub_10000F404();
    sub_10000F338();
    sub_10000F484();
    sub_10000F3FC();
    uint64_t v3 = (uint64_t (*)(void))sub_100044674();
    return v3();
  }

  else
  {
    uint64_t v5 = v0[13];
    uint64_t v6 = v0[11];
    (*(void (**)(void, void))(v0[8] + 8LL))(v0[9], v0[7]);
    sub_100043C00(v5, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    sub_10000F4A0();
    sub_10000F484();
    sub_10000F41C();
    sub_10000F3F4();
    sub_10000F4EC();
    uint64_t v7 = sub_100053420();
    return v8(v7);
  }

uint64_t sub_10004B9A8()
{
  return sub_100053298(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10004BA10(void *a1, void *a2, void *aBlock)
{
  v3[2] = a1;
  v3[3] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a2;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v10 = v9;

  v3[4] = v8;
  v3[5] = v10;
  uint64_t v11 = (void *)swift_task_alloc(dword_10006A70C);
  v3[6] = v11;
  *uint64_t v11 = v3;
  v11[1] = sub_10004BAA8;
  return static ToolKitHelper.produceEncodedTypedValue(collection:for:)((uint64_t)v6, v8, v10);
}

uint64_t sub_10004BAA8()
{
  uint64_t v4 = (void *)v3[2];
  sub_10000F668(v3[6], v5);

  sub_10003FCFC(v3[4], v3[5]);
  if (v0)
  {
    sub_10005376C();
    sub_1000534A4();
    id v6 = v1;
  }

  else
  {
    sub_10005347C();
    sub_1000533C0();
    id v6 = 0LL;
  }

  sub_100053364();

  sub_1000537FC();
  return sub_100053298(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t static ToolKitHelper.produceEncodedTypedPossibleValues(contentProperty:)(uint64_t a1)
{
  v1[21] = a1;
  uint64_t v2 = sub_100053EC8();
  v1[22] = v2;
  uint64_t v3 = *(void *)(v2 - 8);
  v1[23] = v3;
  v1[24] = sub_100013328(v3);
  uint64_t v4 = sub_10000844C(&qword_10006A6B0);
  v1[25] = sub_100013328(*(void *)(v4 - 8));
  uint64_t v5 = sub_1000538F8();
  v1[26] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v1[27] = v6;
  v1[28] = sub_100013328(v6);
  sub_10000F3A0();
  return sub_10000F2D0();
}

uint64_t sub_10004BB94()
{
  id v1 = [*(id *)(v0 + 168) possibleValues];
  *(void *)(v0 + 56) = v0 + 152;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 24) = sub_10004BC44;
  uint64_t v2 = swift_continuation_init(v0 + 16, 0LL);
  *(void *)(v0 + 8sub_10004094C(v0, 0) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 0x40000000LL;
  uint64_t v3 = sub_100053DE0(v2, (uint64_t)sub_10004C1D4);
  sub_100053E20(v3, "getValuesWithCompletionBlock:");
  swift_unknownObjectRelease(v1);
  return swift_continuation_await(v0 + 16);
}

uint64_t sub_10004BC44()
{
  return sub_10000F2D0();
}

uint64_t sub_10004BC70()
{
  uint64_t v2 = *(void *)(v0 + 152);
  *(void *)(v0 + 232) = v2;
  uint64_t v3 = *(void *)(v2 + 16);
  *(void *)(v0 + 24sub_10004094C(v0, 0) = v3;
  if (v3)
  {
    sub_10005349C(v1, &qword_10006A6D0, &OBJC_CLASS___WFContentItem_ptr);
    *(void *)(v0 + 256) = 0LL;
    *(void *)(v0 + 264) = _swiftEmptyArrayStorage;
    *(void *)(v0 + 248) = v4;
    sub_100009A44(v2 + 32, v0 + 120);
    id v5 = sub_10004C254((void *)(v0 + 120));
    *(void *)(v0 + 272) = v5;
    if (v5)
    {
      uint64_t v6 = sub_100053C8C();
      sub_100053488(v6);
      id v7 = (void *)swift_task_alloc(async function pointer to WFContentItem.resolve(with:)[1]);
      *(void *)(v0 + 28sub_10004094C(v0, 0) = v7;
      uint64_t v8 = sub_100053E7C(v7);
      return ((uint64_t (*)(uint64_t))WFContentItem.resolve(with:))(v8);
    }

    uint64_t v12 = *(void *)(v0 + 184);
    uint64_t v11 = *(void *)(v0 + 192);
    swift_bridgeObjectRelease(*(void *)(v0 + 232));
    sub_100043024();
    *(_DWORD *)(v0 + 296) = 22;
    sub_100050684((uint64_t)_swiftEmptyArrayStorage);
    sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
    uint64_t v13 = sub_100053BA0();
    uint64_t v17 = _BridgedStoredNSError.init(_:userInfo:)(v13, v14, v15, v16);
    POSIXError._nsError.getter(v17);
    sub_100043380(v11, *(uint64_t (**)(uint64_t, uint64_t))(v12 + 8));
    sub_100053684();
    goto LABEL_9;
  }

  sub_100042E4C();
  if (qword_1000699C8 != -1) {
    swift_once(&qword_1000699C8, sub_100047BB8);
  }
  *(void *)(v0 + 16sub_10004094C(v0, 0) = _swiftEmptyArrayStorage;
  sub_10000844C(&qword_10006A6D8);
  unint64_t v10 = sub_100052920();
  sub_10005362C(v10);
  if (v0 != -160)
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
LABEL_9:
    sub_100053978();
    sub_10000F338();
    sub_10000F4A0();
    return sub_100053298(*(uint64_t (**)(void))(v0 + 8));
  }

  sub_1000539D4();
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  sub_10000F404();
  sub_10000F4A0();
  sub_10000F3FC();
  uint64_t v18 = sub_100044B04();
  return sub_10005368C(v18, v19, v20);
}

uint64_t sub_10004BE78()
{
  *(void *)(v1 + 288) = v0;
  swift_task_dealloc();
  sub_10000D8E0(*(void *)(v1 + 200), &qword_10006A6B0);
  if (v0)
  {
    sub_100042E4C();
    sub_100008D58();
  }

  sub_10000F3A0();
  return sub_100053330();
}

uint64_t sub_10004BEF8()
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*(void *)(v0 + 264));
  uint64_t v4 = *(void *)(v0 + 264);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    uint64_t v4 = sub_100053654( 0LL,  *(void *)(v4 + 16) + 1LL,  v2,  v3,  &qword_10006A970,  (void (*)(void))&type metadata accessor for TypedValue);
  }
  unint64_t v6 = *(void *)(v4 + 16);
  unint64_t v5 = *(void *)(v4 + 24);
  if (v6 >= v5 >> 1) {
    uint64_t v4 = sub_100053654( v5 > 1,  v6 + 1,  v2,  v3,  &qword_10006A970,  (void (*)(void))&type metadata accessor for TypedValue);
  }
  id v7 = *(void **)(v0 + 272);
  uint64_t v8 = *(void *)(v0 + 240);
  uint64_t v10 = *(void *)(v0 + 216);
  uint64_t v9 = *(void *)(v0 + 224);
  uint64_t v11 = *(void *)(v0 + 208);
  uint64_t v12 = *(void *)(v0 + 256) + 1LL;
  *(void *)(v4 + 16) = v6 + 1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v10 + 32))( v4 + ((*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))
  + *(void *)(v10 + 72) * v6,
    v9,
    v11);

  if (v12 == v8)
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 232));
    uint64_t v13 = *(void *)(v0 + 288);
    if (qword_1000699C8 != -1) {
      swift_once(&qword_1000699C8, sub_100047BB8);
    }
    *(void *)(v0 + 16sub_10004094C(v0, 0) = v4;
    sub_10000844C(&qword_10006A6D8);
    unint64_t v14 = sub_100053E40();
    sub_1000537D0(v14);
    if (!v13)
    {
      sub_100042E4C();
      sub_10000F404();
      sub_10000F4A0();
      sub_10000F41C();
      sub_100053878();
      __asm { BR              X2 }
    }

    sub_100042E4C();
LABEL_14:
    sub_100053978();
    sub_10000F338();
    sub_10000F4A0();
    sub_100053878();
    __asm { BR              X0 }
  }

  uint64_t v15 = *(void *)(v0 + 256) + 1LL;
  *(void *)(v0 + 256) = v15;
  *(void *)(v0 + 264) = v4;
  sub_100009A44(*(void *)(v0 + 232) + 32 * v15 + 32, v0 + 120);
  id v16 = sub_10004C254((void *)(v0 + 120));
  *(void *)(v0 + 272) = v16;
  if (!v16)
  {
    uint64_t v21 = *(void *)(v0 + 184);
    uint64_t v22 = *(void *)(v0 + 176);
    swift_bridgeObjectRelease(*(void *)(v0 + 232));
    sub_100042E4C();
    *(_DWORD *)(v0 + 296) = 22;
    unint64_t v23 = sub_100050684((uint64_t)_swiftEmptyArrayStorage);
    sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
    _BridgedStoredNSError.init(_:userInfo:)(v0 + 296, v23, v22, v24);
    sub_1000536E0();
    sub_100053388(*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
    sub_100053684();
    goto LABEL_14;
  }

  uint64_t v17 = sub_100053C8C();
  sub_100053488(v17);
  uint64_t v18 = (void *)swift_task_alloc(async function pointer to WFContentItem.resolve(with:)[1]);
  *(void *)(v0 + 28sub_10004094C(v0, 0) = v18;
  sub_100053E7C(v18);
  sub_100053878();
  return WFContentItem.resolve(with:)();
}

uint64_t sub_10004C198()
{
  sub_100053978();
  sub_10000F338();
  sub_10000F4A0();
  return sub_100053454(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10004C1D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, (char *)&type metadata for Any + 8);
  return sub_10004C210(v2, v3);
}

uint64_t sub_10004C210(uint64_t a1, uint64_t a2)
{
  **(void **)(*(void *)(a1 + 64) + 4Hasher.init(_seed:)(v3, 0LL) = a2;
  return swift_continuation_resume();
}

uint64_t sub_10004C220(uint64_t a1, uint64_t a2)
{
  return swift_continuation_resume(a1);
}

id sub_10004C254(void *a1)
{
  uint64_t v3 = a1[3];
  uint64_t v4 = sub_1000411D0(a1, v3);
  uint64_t v5 = _bridgeAnythingToObjectiveC<A>(_:)(v4, v3);
  id v6 = [(id)swift_getObjCClassFromMetadata(v1) itemWithObject:v5];
  swift_unknownObjectRelease(v5);
  sub_100040830(a1);
  return v6;
}

uint64_t sub_10004C2DC(void *a1, void *aBlock)
{
  v2[2] = a1;
  v2[3] = _Block_copy(aBlock);
  uint64_t v4 = dword_10006A724;
  id v5 = a1;
  id v6 = (void *)swift_task_alloc(v4);
  v2[4] = v6;
  *id v6 = v2;
  v6[1] = sub_10004C344;
  return static ToolKitHelper.produceEncodedTypedPossibleValues(contentProperty:)((uint64_t)v5);
}

uint64_t sub_10004C344()
{
  uint64_t v4 = *(void **)(v3 + 16);
  sub_10000F668(*(void *)(v3 + 32), v5);

  if (v0)
  {
    sub_10005376C();
    sub_1000534A4();
    id v6 = v1;
  }

  else
  {
    sub_10005347C();
    sub_1000533C0();
    id v6 = 0LL;
  }

  sub_100053364();

  sub_1000537FC();
  return sub_100053298(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t static ToolKitHelper.produceEncodedTypedValues(states:of:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  uint64_t v4 = sub_1000538F8();
  v3[6] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[7] = v5;
  v3[8] = sub_10005324C(v5);
  void v3[9] = sub_1000421E4();
  uint64_t v6 = type metadata accessor for TypeDefinition(0LL);
  v3[10] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[11] = v7;
  v3[12] = sub_100013328(v7);
  sub_10000F3A0();
  return sub_10000F2D0();
}

uint64_t sub_10004C420()
{
  unint64_t v1 = v0[3];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain(v1);
    uint64_t v2 = sub_100046DEC();
  }

  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v1);
  }

  v0[13] = v2;
  if (v2)
  {
    uint64_t v3 = objc_opt_self(&OBJC_CLASS___WFLocalizationContext);
    v0[14] = v3;
    v0[15] = _swiftEmptyArrayStorage;
    uint64_t v4 = v0[3];
    if ((v4 & 0xC000000000000001LL) != 0) {
      uint64_t v5 = sub_100053CAC(v3, v4);
    }
    else {
      uint64_t v5 = (uint64_t)sub_100053C10(v3, v4);
    }
    v0[16] = v5;
    v0[17] = 1LL;
    v0[18] = sub_10004341C(v5, "defaultContext");
    uint64_t v8 = (void *)swift_task_alloc(async function pointer to WFParameter.toolkitTypeDefinition(for:localizationContext:)[1]);
    uint64_t v9 = sub_100053A60(v8);
    return WFParameter.toolkitTypeDefinition(for:localizationContext:)(v9, v10, v11);
  }

  else
  {
    swift_bridgeObjectRelease(v0[3]);
    if (qword_1000699C8 != -1) {
      swift_once(&qword_1000699C8, sub_100047BB8);
    }
    v0[2] = _swiftEmptyArrayStorage;
    uint64_t v6 = sub_10000844C(&qword_10006A6D8);
    unint64_t v7 = sub_100052920();
    dispatch thunk of PropertyListEncoder.encode<A>(_:)(v0 + 2, v6, v7);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    sub_10000F4A0();
    sub_10000F484();
    sub_10000F3FC();
    uint64_t v12 = sub_100053420();
    return sub_10005368C(v12, v13, v14);
  }

uint64_t sub_10004C5D4()
{
  *(void *)(v1 + 16sub_10004094C(v0, 0) = v0;
  swift_task_dealloc();

  if (v0)
  {
    sub_100042E4C();
    sub_100008D58();
    sub_10000F3A0();
    return sub_100053330();
  }

  else
  {
    uint64_t v5 = (void *)swift_task_alloc(async function pointer to WFParameterState.toolkitTypedValue(in:of:with:)[1]);
    *(void *)(v1 + 168) = v5;
    uint64_t v6 = sub_10000844C(&qword_10006A730);
    *uint64_t v5 = v2;
    v5[1] = sub_10004C690;
    return WFParameterState.toolkitTypedValue(in:of:with:)( *(void *)(v1 + 72),  *(void *)(v1 + 32),  *(void *)(v1 + 40),  *(void *)(v1 + 96),  v6);
  }

uint64_t sub_10004C690()
{
  uint64_t v4 = *v1;
  uint64_t v2 = v4;
  sub_10004729C(&v4);
  *(void *)(v2 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease(*(void *)(v2 + 24));
    sub_100008D58();
  }

  sub_10000F3A0();
  return sub_100053474();
}

id sub_10004C6F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  char v15 = sub_1000538C0();
  uint64_t v18 = *(void *)(v14 + 120);
  if ((v15 & 1) == 0) {
    uint64_t v18 = sub_100053654( 0LL,  *(void *)(v18 + 16) + 1LL,  v16,  v17,  &qword_10006A970,  (void (*)(void))&type metadata accessor for TypedValue);
  }
  unint64_t v20 = *(void *)(v18 + 16);
  unint64_t v19 = *(void *)(v18 + 24);
  unint64_t v21 = v20 + 1;
  if (v20 >= v19 >> 1)
  {
    uint64_t v46 = sub_100050A8C( v19 > 1,  v20 + 1,  1LL,  v18,  &qword_10006A970,  (void (*)(void))&type metadata accessor for TypedValue);
    unint64_t v21 = v20 + 1;
    uint64_t v18 = v46;
  }

  uint64_t v22 = *(void **)(v14 + 128);
  uint64_t v47 = *(void *)(v14 + 104);
  uint64_t v48 = *(void *)(v14 + 136);
  uint64_t v23 = *(void *)(v14 + 88);
  uint64_t v24 = *(void *)(v14 + 64);
  uint64_t v25 = *(void *)(v14 + 72);
  uint64_t v27 = *(void *)(v14 + 48);
  uint64_t v26 = *(void *)(v14 + 56);
  *(void *)(v18 + 16) = v21;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v26 + 32))( v18 + ((*(unsigned __int8 *)(v26 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80))
  + *(void *)(v26 + 72) * v20,
    v24,
    v27);

  sub_100043910(v25, *(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
  sub_100053388(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
  if (v48 == v47)
  {
    uint64_t v28 = *(void *)(v14 + 176);
    swift_bridgeObjectRelease(*(void *)(v14 + 24));
    if (qword_1000699C8 != -1) {
      swift_once(&qword_1000699C8, sub_100047BB8);
    }
    *(void *)(v14 + 16) = v18;
    sub_10000844C(&qword_10006A6D8);
    unint64_t v29 = sub_100053E40();
    sub_1000537D0(v29);
    sub_100042E4C();
    if (v28)
    {
      sub_100053F10();
      sub_10000F404();
      sub_10000F338();
      uint64_t v30 = (uint64_t (*)(void))sub_100044674();
      return (id)sub_1000532E4(v30);
    }

    else
    {
      sub_10000F4A0();
      sub_10000F3FC();
      sub_10000F41C();
      sub_1000539E8();
      sub_10000F5DC();
      return (id)v36(v34, v35, v36, v37, v38, v39, v40, v41, v47, v48, a11, a12, a13, a14);
    }
  }

  else
  {
    uint64_t v32 = *(void *)(v14 + 136);
    *(void *)(v14 + 12sub_10004094C(v0, 0) = v18;
    uint64_t v33 = *(void *)(v14 + 24);
    if ((v33 & 0xC000000000000001LL) != 0) {
      id result = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v32, v33);
    }
    else {
      id result = sub_1000430AC(v33 + 8 * v32);
    }
    *(void *)(v14 + 128) = result;
    *(void *)(v14 + 136) = v32 + 1;
    if (__OFADD__(v32, 1LL))
    {
      __break(1u);
    }

    else
    {
      *(void *)(v14 + 144) = [*(id *)(v14 + 112) defaultContext];
      uint64_t v42 = (void *)swift_task_alloc(async function pointer to WFParameter.toolkitTypeDefinition(for:localizationContext:)[1]);
      sub_100053A60(v42);
      sub_10000F5DC();
      return (id)WFParameter.toolkitTypeDefinition(for:localizationContext:)(v43, v44, v45);
    }
  }

  return result;
}

uint64_t sub_10004C948()
{
  sub_100053F04();
  sub_10000F338();
  sub_10000F4A0();
  return sub_100053454(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10004C984()
{
  uint64_t v1 = *(void *)(v0 + 88);

  sub_100043124(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_100053F04();
  sub_10000F338();
  sub_10000F4A0();
  return sub_100053454(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10004CA50(uint64_t a1, void *a2, void *a3, void *aBlock)
{
  v4[2] = a2;
  v4[3] = a3;
  v4[4] = _Block_copy(aBlock);
  uint64_t v8 = sub_10000844C(&qword_10006A730);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a1, v8);
  v4[5] = v9;
  uint64_t v10 = dword_10006A72C;
  id v11 = a2;
  id v12 = a3;
  uint64_t v13 = (void *)swift_task_alloc(v10);
  v4[6] = v13;
  *uint64_t v13 = v4;
  v13[1] = sub_10004CAF8;
  return static ToolKitHelper.produceEncodedTypedValues(states:of:in:)(v9, (uint64_t)v11, (uint64_t)v12);
}

uint64_t sub_10004CAF8()
{
  uint64_t v3 = (void *)v2[5];
  uint64_t v5 = (void *)v2[2];
  uint64_t v4 = (void *)v2[3];
  sub_10000F668(v2[6], v6);

  sub_100043024();
  if (v0)
  {
    sub_10005376C();
    sub_1000534A4();
    sub_100053E50();
  }

  else
  {
    sub_10005347C();
    sub_1000533C0();
    sub_100053D94();
  }

  sub_100053364();

  sub_1000537FC();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t static ToolKitHelper.produceEncodedDisplayRepresentation(for:)(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  uint64_t v3 = sub_10000844C(&qword_10006A740);
  v2[4] = sub_100013328(*(void *)(v3 - 8));
  uint64_t v4 = type metadata accessor for DisplayRepresentation.AltText(0LL);
  v2[5] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[6] = v5;
  v2[7] = sub_100013328(v5);
  uint64_t v6 = sub_10000844C(&qword_10006A748);
  v2[8] = sub_100013328(*(void *)(v6 - 8));
  uint64_t v7 = type metadata accessor for DisplayRepresentation.Subtitle(0LL);
  v2[9] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v2[10] = v8;
  v2[11] = sub_100013328(v8);
  uint64_t v9 = sub_100053EC8();
  v2[12] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v2[13] = v10;
  v2[14] = sub_100013328(v10);
  uint64_t v11 = sub_100053ED0();
  v2[15] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v2[16] = v12;
  v2[17] = sub_100013328(v12);
  uint64_t v13 = sub_10000844C(&qword_10006A118);
  v2[18] = sub_100013328(*(void *)(v13 - 8));
  uint64_t v14 = type metadata accessor for DisplayRepresentation.Image(0LL);
  v2[19] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v2[20] = v15;
  v2[21] = sub_100013328(v15);
  uint64_t v16 = type metadata accessor for HashableCGSize(0LL);
  v2[22] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v2[23] = v17;
  v2[24] = sub_100013328(v17);
  uint64_t v18 = type metadata accessor for DisplayRepresentation.Storage(0LL);
  v2[25] = v18;
  uint64_t v19 = *(void *)(v18 - 8);
  v2[26] = v19;
  v2[27] = sub_100013328(v19);
  uint64_t v20 = type metadata accessor for DisplayRepresentation.ResolvingRequest(0LL);
  v2[28] = v20;
  uint64_t v21 = *(void *)(v20 - 8);
  v2[29] = v21;
  v2[30] = sub_10005324C(v21);
  v2[31] = sub_1000421E4();
  sub_10000F3A0();
  return sub_10000F2D0();
}

uint64_t sub_10004CCD8()
{
  if (qword_1000699C0 != -1) {
    swift_once(&qword_1000699C0, sub_100047B9C);
  }
  uint64_t v1 = *(void *)(v0 + 24);
  sub_100053180( &qword_10006A750,  (void (*)(uint64_t))&type metadata accessor for DisplayRepresentation.ResolvingRequest);
  uint64_t v3 = sub_1000536E8(v2);
  if (v1)
  {
LABEL_5:
    uint64_t v80 = *(void *)(v0 + 56);
    uint64_t v82 = *(void *)(v0 + 32);
    swift_task_dealloc();
    sub_10000F404();
    sub_10000F338();
    sub_10000F4A0();
    sub_10000F3FC();
    sub_10000F41C();
    sub_10000F3F4();
    sub_10000F4EC();
    sub_10000F4A8();
    uint64_t v15 = sub_10000F484();
    uint64_t v23 = sub_10000F6A4(v15, v16, v17, v18, v19, v20, v21, v22, v78, v80);
    sub_100043CF0(v23, v24, v25, v26, v27, v28, v29, v30, v79, v81, v82);
    sub_10005357C();
    __asm { BR              X0 }
  }

  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v4 = *(void *)(v0 + 216);
  sub_10005349C(v3, &qword_10006A758, &OBJC_CLASS___NSKeyedUnarchiver_ptr);
  sub_10005349C(v6, &qword_10006A6D0, &OBJC_CLASS___WFContentItem_ptr);
  uint64_t v8 = v7;
  uint64_t v9 = DisplayRepresentation.ResolvingRequest.storage.getter();
  uint64_t v10 = DisplayRepresentation.Storage.data.getter(v9);
  uint64_t v12 = v11;
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  *(void *)(v0 + 256) = v13;
  sub_100043380(v4, v13);
  uint64_t v14 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)(v8, v10, v12, v8);
  *(void *)(v0 + 264) = v14;
  *(void *)(v0 + 272) = 0LL;
  uint64_t v32 = (void *)v14;
  sub_100053F34();
  uint64_t v33 = *(void *)(v0 + 248);
  if (!v32)
  {
    uint64_t v39 = *(void *)(v0 + 224);
    uint64_t v40 = *(void *)(v0 + 232);
    uint64_t v42 = *(void *)(v0 + 104);
    uint64_t v41 = *(void *)(v0 + 112);
    *(_DWORD *)(v0 + 304) = 22;
    sub_100050684((uint64_t)_swiftEmptyArrayStorage);
    sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
    uint64_t v43 = sub_1000539E8();
    sub_100053E00(v43, v44, v45, v46);
    sub_1000536E0();
    uint64_t v47 = sub_100043910(v41, *(uint64_t (**)(uint64_t, uint64_t))(v42 + 8));
    swift_willThrow(v47, v48, v49, v50, v51, v52, v53);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v33, v39);
    goto LABEL_5;
  }

  (*(void (**)(void, void, void))(*(void *)(v0 + 232) + 16LL))( *(void *)(v0 + 240),  *(void *)(v0 + 248),  *(void *)(v0 + 224));
  uint64_t v34 = sub_10000F674();
  int v36 = v35(v34);
  if (v36 == enum case for DisplayRepresentation.ResolvingRequest.subtitle(_:))
  {
    sub_100053B44();
    uint64_t v37 = (void *)swift_task_alloc(async function pointer to WFContentItem.asyncDisplaySubtitle()[1]);
    *(void *)(v0 + 288) = v37;
    *uint64_t v37 = v0;
    v37[1] = sub_10004D420;
    sub_10005357C();
    return WFContentItem.asyncDisplaySubtitle()();
  }

  if (v36 == enum case for DisplayRepresentation.ResolvingRequest.altText(_:))
  {
    sub_100053B44();
    uint64_t v54 = (void *)swift_task_alloc(async function pointer to WFContentItem.asyncDisplayAltText()[1]);
    *(void *)(v0 + 296) = v54;
    *uint64_t v54 = v0;
    v54[1] = sub_10004D65C;
    sub_10005357C();
    return WFContentItem.asyncDisplayAltText()();
  }

  if (v36 != enum case for DisplayRepresentation.ResolvingRequest.image(_:))
  {
    uint64_t v61 = *(void *)(v0 + 248);
    uint64_t v83 = *(void *)(v0 + 240);
    uint64_t v62 = *(void *)(v0 + 224);
    uint64_t v63 = *(void *)(v0 + 232);
    uint64_t v65 = *(void *)(v0 + 104);
    uint64_t v64 = *(void *)(v0 + 112);
    uint64_t v66 = *(void *)(v0 + 96);
    *(_DWORD *)(v0 + 308) = 22;
    sub_100050684((uint64_t)_swiftEmptyArrayStorage);
    sub_100053180(&qword_10006A6A0, (void (*)(uint64_t))&type metadata accessor for POSIXError);
    uint64_t v67 = sub_1000539E8();
    _BridgedStoredNSError.init(_:userInfo:)(v67, v68, v66, v69);
    sub_1000536E0();
    uint64_t v70 = sub_100043FD4(v64, *(uint64_t (**)(uint64_t, uint64_t))(v65 + 8));
    swift_willThrow(v70, v71, v72, v73, v74, v75, v76);

    uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
    v77(v61, v62);
    v77(v83, v62);
    goto LABEL_5;
  }

  uint64_t v55 = *(void *)(v0 + 240);
  uint64_t v57 = *(void *)(v0 + 184);
  uint64_t v56 = *(void *)(v0 + 192);
  sub_100053620(*(void *)(v0 + 232));
  uint64_t v58 = sub_10000844C(&qword_10006A770);
  uint64_t v59 = sub_100043C08(v56, v55 + *(int *)(v58 + 48), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v57 + 32));
  HashableCGSize.size.getter(v59);
  static DisplayRepresentationConfiguration.fileBackedImages.getter();
  uint64_t v60 = (void *)swift_task_alloc(async function pointer to WFContentItem.asyncDisplayImage(with:displayRepresentationConfig:)[1]);
  *(void *)(v0 + 28sub_10004094C(v0, 0) = v60;
  *uint64_t v60 = v0;
  v60[1] = sub_10004D144;
  sub_10005357C();
  return WFContentItem.asyncDisplayImage(with:displayRepresentationConfig:)();
}

uint64_t sub_10004D144()
{
  uint64_t v1 = *(void *)(v0 + 128);
  sub_10000F384(*(void *)(v0 + 280));
  sub_100043124(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_10000F3A0();
  return sub_100053330();
}

#error "10004D3E0: call analysis failed (funcsize=160)"
uint64_t sub_10004D420()
{
  uint64_t v0;
  sub_10000F520();
  sub_10000F384(*(void *)(v0 + 288));
  sub_10000F3A0();
  return sub_10000F2D0();
}

#error "10004D4F0: call analysis failed (funcsize=125)"
uint64_t sub_10004D65C()
{
  uint64_t v0;
  sub_10000F520();
  sub_10000F384(*(void *)(v0 + 296));
  sub_10000F3A0();
  return sub_10000F2D0();
}

#error "10004D72C: call analysis failed (funcsize=128)"
void __cdecl +[WFToolKitHelper produceEncodedDisplayRepresentationForRequest:completionBlock:]( id a1,  SEL a2,  NSData *a3,  id a4)
{
  sub_10004D8B8((uint64_t)a1, (int)a2, a3, a4, (uint64_t)&unk_100066D98);
}

void sub_10004D8B8(uint64_t a1, int a2, void *a3, void *aBlock, uint64_t a5)
{
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = (void *)sub_100042644(a5, 40LL);
  void v9[2] = a3;
  v9[3] = v8;
  v9[4] = a1;
  id v10 = a3;
  sub_1000460C4();
  sub_100053730();
}

uint64_t sub_10004D910(void *a1, void *aBlock)
{
  v2[2] = _Block_copy(aBlock);
  id v4 = a1;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v7 = v6;

  v2[3] = v5;
  v2[4] = v7;
  uint64_t v8 = (void *)swift_task_alloc(dword_10006A73C);
  v2[5] = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10004D994;
  return static ToolKitHelper.produceEncodedDisplayRepresentation(for:)(v5, v7);
}

uint64_t sub_10004D994()
{
  if (v0)
  {
    sub_10005376C();
    sub_1000534A4();
    uint64_t v5 = v1;
  }

  else
  {
    sub_10005347C();
    sub_1000533C0();
    uint64_t v5 = 0LL;
  }

  sub_100053364();

  sub_1000537FC();
  return sub_100053298(*(uint64_t (**)(void))(v2 + 8));
}

uint64_t static ToolKitHelper.resolveDeferredValue(for:encodedExpectedType:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[43] = a3;
  v4[44] = a4;
  v4[41] = a1;
  v4[42] = a2;
  uint64_t v5 = sub_10000844C(&qword_10006A788);
  v4[45] = v5;
  v4[46] = sub_100013328(*(void *)(v5 - 8));
  uint64_t v6 = sub_100053ED0();
  v4[47] = sub_100013328(*(void *)(v6 - 8));
  uint64_t v7 = sub_10000844C(&qword_10006A710);
  v4[48] = sub_100013328(*(void *)(v7 - 8));
  uint64_t v8 = sub_1000538F8();
  v4[49] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v4[50] = v9;
  v4[51] = sub_10005324C(v9);
  v4[52] = sub_1000421E4();
  v4[53] = sub_1000421E4();
  uint64_t v10 = type metadata accessor for TypeInstance(0LL);
  v4[54] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v4[55] = v11;
  v4[56] = sub_10005324C(v11);
  v4[57] = sub_1000421E4();
  v4[58] = sub_1000421E4();
  uint64_t v12 = type metadata accessor for TypedValue.DeferredValue.Storage(0LL);
  v4[59] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v4[60] = v13;
  v4[61] = sub_10005324C(v13);
  v4[62] = sub_1000421E4();
  sub_10000F3A0();
  return sub_10000F2D0();
}

#error "10004DCE4: call analysis failed (funcsize=234)"
uint64_t sub_10004DECC()
{
  sub_100053940();
  sub_10000F3A0();
  return sub_10000F2D0();
}

uint64_t sub_10004DEF8()
{
  uint64_t v1 = *(void **)(v0 + 528);
  if (*(void *)(v0 + 208))
  {
    uint64_t v2 = (_OWORD *)sub_1000477EC();
    sub_100009AC4(v2, v3);

    uint64_t v4 = sub_100053E14();
    sub_10005349C(v4, &qword_10006A7A0, &OBJC_CLASS___WFFileRepresentation_ptr);
    uint64_t v5 = sub_100053BA0();
    if (swift_dynamicCast(v5, v6, v7, v8, 6LL))
    {
      uint64_t v9 = *(void **)(v0 + 320);
      id v10 = [(id)objc_opt_self(WFContentItem) itemWithFile:v9];

      if (!v10) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v41 = *(void *)(v0 + 520);
      sub_100053E14();
      uint64_t v42 = sub_100053BA0();
      if (swift_dynamicCast(v42, v43, v44, v41, 6LL))
      {
        id v10 = *(id *)(v0 + 312);
      }

      else
      {
        sub_100009A44(v0 + 152, v0 + 248);
        id v10 = sub_10004C254((void *)(v0 + 248));
        if (!v10)
        {
LABEL_15:
          uint64_t v73 = *(void **)(v0 + 544);
          uint64_t v74 = *(void **)(v0 + 528);
          uint64_t v141 = *(void *)(v0 + 480);
          uint64_t v143 = *(void *)(v0 + 472);
          uint64_t v147 = *(void *)(v0 + 496);
          uint64_t v75 = *(void *)(v0 + 440);
          unint64_t v76 = sub_10005299C();
          uint64_t v77 = sub_100009BE0((uint64_t)&type metadata for ToolKitDeferredValueResolutionError, v76);
          sub_100053B64(v77, v78, v79, v80, v81, v82, v83, 3);

          sub_100053DF4();
          sub_100040830((void *)(v0 + 152));
          sub_100053934(*(uint64_t (**)(uint64_t, uint64_t))(v75 + 8));
          (*(void (**)(uint64_t, uint64_t))(v141 + 8))(v147, v143);
          goto LABEL_16;
        }
      }
    }

    id v60 = v10;
    *(void *)(v0 + 56sub_10004094C(v0, 0) = v10;
    *(void *)(v0 + 552) = v60;
    uint64_t v61 = *(void *)(v0 + 456);
    uint64_t v62 = *(void *)(v0 + 464);
    uint64_t v63 = *(void *)(v0 + 432);
    uint64_t v64 = *(void *)(v0 + 440);
    uint64_t v65 = *(void *)(v0 + 376);
    sub_10005349C((uint64_t)v60, &qword_10006A7A8, &OBJC_CLASS___WFContentCollection_ptr);
    uint64_t v66 = sub_10000844C(&qword_10006A6F0);
    uint64_t v67 = sub_100042644(v66, 40LL);
    *(_OWORD *)(v67 + 16) = xmmword_100059AE0;
    *(void *)(v67 + 32) = v60;
    uint64_t v150 = v67;
    specialized Array._endMutation()(v67);
    id v68 = v60;
    *(void *)(v0 + 568) = sub_10004E8BC(v150);
    uint64_t v69 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v64 + 16))(v61, v62, v63);
    ((void (*)(uint64_t))static DisplayRepresentationConfiguration.fileBackedImages.getter)(v69);
    ((void (*)(uint64_t, uint64_t))WFContentCollection.TypedValueResolutionContext.init(expectedType:displayRepresentationConfig:))( v61,  v65);
    uint64_t v70 = ((uint64_t (*)(void))type metadata accessor for WFContentCollection.TypedValueResolutionContext)(0LL);
    sub_100053A30(v70);
    uint64_t v71 = (void *)swift_task_alloc(async function pointer to WFContentCollection.resolve(with:)[1]);
    *(void *)(v0 + 576) = v71;
    *uint64_t v71 = v0;
    v71[1] = sub_10004E4C4;
    return ((uint64_t (*)(void, void))WFContentCollection.resolve(with:))( *(void *)(v0 + 416),  *(void *)(v0 + 384));
  }

  uint64_t v11 = *(void *)(v0 + 440);
  sub_10000D8E0(v0 + 184, &qword_10006A420);

  uint64_t v12 = *(void (**)(uint64_t))(v11 + 16);
  uint64_t v13 = sub_1000460C4();
  v12(v13);
  uint64_t v14 = sub_100044B04();
  if (v15(v14) != enum case for TypeInstance.optional(_:))
  {
    uint64_t v45 = *(void **)(v0 + 544);
    uint64_t v46 = *(void **)(v0 + 528);
    uint64_t v47 = *(void *)(v0 + 504);
    uint64_t v48 = *(void *)(v0 + 480);
    uint64_t v143 = *(void *)(v0 + 472);
    uint64_t v146 = *(void *)(v0 + 496);
    uint64_t v49 = *(void *)(v0 + 464);
    uint64_t v50 = *(void *)(v0 + 432);
    uint64_t v51 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 440) + 8LL);
    v51(*(void *)(v0 + 448), v50);
    unint64_t v52 = sub_10005299C();
    uint64_t v53 = sub_100009BE0((uint64_t)&type metadata for ToolKitDeferredValueResolutionError, v52);
    sub_100053B64(v53, v54, v55, v56, v57, v58, v59, 2);

    sub_1000539A4(v47);
    v51(v49, v50);
    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v146, v143);
    goto LABEL_16;
  }

  uint64_t v16 = *(uint64_t **)(v0 + 448);
  uint64_t v17 = *(void *)(v0 + 432);
  uint64_t v19 = *(void *)(v0 + 360);
  uint64_t v18 = *(void *)(v0 + 368);
  sub_100043124(*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v0 + 440) + 96LL));
  uint64_t v20 = *v16;
  uint64_t v21 = swift_projectBox(v20);
  uint64_t v22 = v18 + *(int *)(v19 + 48);
  ((void (*)(uint64_t, uint64_t, uint64_t))v12)(v18, v21, v17);
  sub_100053148();
  sub_10000D8E0(v22, &qword_10006A4B0);
  uint64_t v23 = sub_1000477EC();
  uint64_t v145 = v24;
  ((void (*)(uint64_t))v24)(v23);
  swift_release(v20);
  if (qword_1000699C8 != -1) {
    swift_once(&qword_1000699C8, sub_100047BB8);
  }
  uint64_t v25 = *(void *)(v0 + 536);
  uint64_t v27 = *(void *)(v0 + 400);
  uint64_t v26 = *(uint64_t **)(v0 + 408);
  uint64_t v28 = *(void *)(v0 + 392);
  uint64_t v29 = type metadata accessor for TypedValue.PrimitiveValue(0LL);
  uint64_t v30 = swift_allocBox(v29);
  (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v29 - 8) + 104LL))( v31,  enum case for TypedValue.PrimitiveValue.none(_:),  v29);
  *uint64_t v26 = v30;
  (*(void (**)(uint64_t *, void, uint64_t))(v27 + 104))(v26, enum case for TypedValue.primitive(_:), v28);
  sub_100053180(&qword_10006A6E8, (void (*)(uint64_t))&type metadata accessor for TypedValue);
  uint64_t v33 = sub_100053378(v32);
  uint64_t v35 = *(void **)(v0 + 544);
  int v36 = *(void **)(v0 + 528);
  uint64_t v37 = *(void *)(v0 + 504);
  if (v25)
  {
    uint64_t v138 = *(void *)(v0 + 480);
    uint64_t v38 = *(void *)(v0 + 464);
    uint64_t v141 = *(void *)(v0 + 472);
    uint64_t v143 = *(void *)(v0 + 496);
    uint64_t v39 = *(void *)(v0 + 432);
    uint64_t v40 = *(void *)(v0 + 400);

    sub_1000539A4(v37);
    sub_100053934(*(uint64_t (**)(uint64_t, uint64_t))(v40 + 8));
    v145(v38, v39);
    (*(void (**)(uint64_t, uint64_t))(v138 + 8))(v143, v141);
LABEL_16:
    sub_1000538D8();
    uint64_t v148 = v84;
    swift_task_dealloc();
    sub_10000F338();
    sub_10000F4A0();
    sub_10000F484();
    sub_10000F3FC();
    sub_10000F41C();
    sub_10000F3F4();
    sub_10000F4EC();
    sub_10000F4A8();
    uint64_t v85 = sub_10000F404();
    sub_100043D94(v85, v86, v87, v88, v89, v90, v91, v92, v129, v134, v138, v141, v143, v148);
    return sub_100053260(*(uint64_t (**)(void))(v0 + 8));
  }

  uint64_t v94 = *(void *)(v0 + 400);
  uint64_t v93 = *(void *)(v0 + 408);
  uint64_t v144 = v33;
  uint64_t v149 = v34;

  sub_1000539A4(v37);
  sub_100043910(v93, *(uint64_t (**)(uint64_t, uint64_t))(v94 + 8));
  uint64_t v95 = *(void *)(v0 + 496);
  uint64_t v96 = *(void *)(v0 + 480);
  uint64_t v130 = *(void *)(v0 + 408);
  uint64_t v135 = *(void *)(v0 + 384);
  uint64_t v139 = *(void *)(v0 + 376);
  uint64_t v142 = *(void *)(v0 + 368);
  v145(*(void *)(v0 + 464), *(void *)(v0 + 432));
  sub_100043C00(v95, *(uint64_t (**)(uint64_t, uint64_t))(v96 + 8));
  sub_10000F404();
  sub_10000F4A0();
  sub_10000F41C();
  sub_10000F3F4();
  sub_10000F4EC();
  sub_10000F4A8();
  uint64_t v97 = sub_10000F338();
  uint64_t v105 = sub_100045D10(v97, v98, v99, v100, v101, v102, v103, v104, v130);
  uint64_t v113 = sub_10000F6A4(v105, v106, v107, v108, v109, v110, v111, v112, v131, v135);
  uint64_t v121 = sub_100043CF0(v113, v114, v115, v116, v117, v118, v119, v120, v132, v136, v139);
  sub_100043D9C(v121, v122, v123, v124, v125, v126, v127, v128, v133, v137, v140, v142);
  return sub_10005327C(v144, v149, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10004E4C4()
{
  uint64_t v4 = *v1;
  uint64_t v2 = v4;
  sub_10004729C(&v4);
  *(void *)(v2 + 584) = v0;
  swift_task_dealloc();
  sub_10000D8E0(*(void *)(v2 + 384), &qword_10006A710);
  sub_10000F3A0();
  return sub_100053474();
}

uint64_t sub_10004E52C()
{
  uint64_t v1 = *(void **)(v0 + 568);
  uint64_t v2 = *(void **)(v0 + 560);
  uint64_t v3 = *(void **)(v0 + 552);
  uint64_t v4 = *(void **)(v0 + 528);
  uint64_t v5 = *(void *)(v0 + 504);
  uint64_t v6 = *(void *)(v0 + 416);
  uint64_t v101 = *(void *)(v0 + 424);
  uint64_t v8 = *(void *)(v0 + 392);
  uint64_t v7 = *(void *)(v0 + 400);

  sub_1000539A4(v5);
  sub_100040830((void *)(v0 + 152));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v101, v6, v8);
  if (qword_1000699C8 != -1) {
    swift_once(&qword_1000699C8, sub_100047BB8);
  }
  uint64_t v9 = *(void *)(v0 + 584);
  sub_100053180(&qword_10006A6E8, (void (*)(uint64_t))&type metadata accessor for TypedValue);
  uint64_t v11 = sub_100053378(v10);
  if (v9)
  {
    uint64_t v13 = *(void *)(v0 + 480);
    uint64_t v14 = *(void *)(v0 + 464);
    uint64_t v15 = *(void *)(v0 + 440);
    sub_100043820(*(void *)(v0 + 400));
    sub_100043C00(v14, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    sub_100043124(*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8));
    sub_100053B74();
    uint64_t v102 = *(void *)(v0 + 376);
    uint64_t v105 = *(void *)(v0 + 368);
    swift_task_dealloc();
    sub_10000F404();
    sub_10000F338();
    sub_10000F484();
    sub_10000F3FC();
    sub_10000F41C();
    sub_10000F3F4();
    sub_10000F4EC();
    uint64_t v16 = sub_10000F4A8();
    uint64_t v24 = sub_100043EF8(v16, v17, v18, v19, v20, v21, v22, v23, v79, v86, v92, v97, v102);
    sub_100043D94(v24, v25, v26, v27, v28, v29, v30, v31, v80, v87, v93, v98, v103, v105);
    uint64_t v32 = (uint64_t (*)(void))sub_100044674();
    return v32();
  }

  else
  {
    uint64_t v34 = v12;
    uint64_t v35 = *(void *)(v0 + 440);
    uint64_t v106 = v11;
    sub_100043820(*(void *)(v0 + 400));
    int v36 = *(void (**)(void, void))(v35 + 8);
    uint64_t v37 = *(void *)(v0 + 496);
    uint64_t v38 = *(void *)(v0 + 480);
    uint64_t v81 = *(void *)(v0 + 416);
    uint64_t v88 = *(void *)(v0 + 408);
    uint64_t v94 = *(void *)(v0 + 384);
    uint64_t v99 = *(void *)(v0 + 376);
    uint64_t v104 = *(void *)(v0 + 368);
    v36(*(void *)(v0 + 464), *(void *)(v0 + 432));
    sub_100043C00(v37, *(uint64_t (**)(uint64_t, uint64_t))(v38 + 8));
    sub_10000F4A0();
    sub_10000F484();
    sub_10000F41C();
    sub_10000F3F4();
    sub_10000F4EC();
    uint64_t v39 = sub_10000F4A8();
    uint64_t v47 = sub_100045D10(v39, v40, v41, v42, v43, v44, v45, v46, v81);
    uint64_t v55 = sub_10000F6A4(v47, v48, v49, v50, v51, v52, v53, v54, v82, v88);
    uint64_t v63 = sub_100043CF0(v55, v56, v57, v58, v59, v60, v61, v62, v83, v89, v94);
    uint64_t v71 = sub_100043D9C(v63, v64, v65, v66, v67, v68, v69, v70, v84, v90, v95, v99);
    sub_100043EF8(v71, v72, v73, v74, v75, v76, v77, v78, v85, v91, v96, v100, v104);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v106, v34);
  }

uint64_t sub_10004E760()
{
  uint64_t v1 = *(void **)(v0 + 568);
  uint64_t v2 = *(void **)(v0 + 560);
  uint64_t v3 = *(void **)(v0 + 552);
  uint64_t v4 = *(void **)(v0 + 528);
  uint64_t v5 = *(void *)(v0 + 504);
  uint64_t v18 = *(void *)(v0 + 480);
  uint64_t v19 = *(void *)(v0 + 472);
  uint64_t v21 = *(void *)(v0 + 496);
  uint64_t v6 = *(void *)(v0 + 440);

  sub_1000539A4(v5);
  sub_100040830((void *)(v0 + 152));
  sub_10005382C(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v21, v19);
  sub_1000538D8();
  uint64_t v20 = v7;
  swift_task_dealloc();
  sub_10000F338();
  sub_10000F4A0();
  sub_10000F484();
  sub_10000F3FC();
  sub_10000F41C();
  sub_10000F3F4();
  sub_10000F4EC();
  sub_10000F4A8();
  uint64_t v8 = sub_10000F404();
  sub_100043D9C(v8, v9, v10, v11, v12, v13, v14, v15, v17, v0 + 152, v18, v20);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10004E854(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2)
  {
    *((void *)&v6 + 1) = swift_getObjectType(a2);
    *(void *)&__int128 v5 = a2;
  }

  else
  {
    __int128 v5 = 0u;
    __int128 v6 = 0u;
  }

  sub_1000529D8((uint64_t)&v5, (uint64_t)v7);
  swift_unknownObjectRetain(a2);
  return sub_10004C220(v3, (uint64_t)v7);
}

id sub_10004E8BC(uint64_t a1)
{
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  id v4 = [(id)swift_getObjCClassFromMetadata(v1) collectionWithItems:isa];

  return v4;
}

void sub_10004E950(uint64_t a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6)
{
  uint64_t v10 = _Block_copy(aBlock);
  uint64_t v11 = (void *)sub_100042644(a6, 48LL);
  v11[2] = a3;
  v11[3] = a4;
  v11[4] = v10;
  v11[5] = a1;
  id v12 = a3;
  id v13 = a4;
  sub_1000460C4();
  sub_100053730();
}

uint64_t sub_10004E9B0(void *a1, void *a2, void *aBlock)
{
  v3[2] = _Block_copy(aBlock);
  id v6 = a1;
  id v7 = a2;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v10 = v9;

  v3[3] = v8;
  v3[4] = v10;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v7);
  uint64_t v13 = v12;

  v3[5] = v11;
  v3[6] = v13;
  uint64_t v14 = (void *)swift_task_alloc(dword_10006A784);
  v3[7] = v14;
  *uint64_t v14 = v3;
  v14[1] = sub_10004EA68;
  return static ToolKitHelper.resolveDeferredValue(for:encodedExpectedType:)(v8, v10, v11, v13);
}

uint64_t sub_10004EA68()
{
  uint64_t v4 = *v1;
  sub_10000F668(*(void *)(v4 + 56), &v4);
  sub_100053E5C();
  sub_100053DF4();
  if (v0)
  {
    sub_10005376C();
    sub_1000534A4();
    sub_100053E50();
  }

  else
  {
    sub_10005347C();
    sub_1000533C0();
    sub_100053D94();
  }

  sub_100053364();

  sub_1000537FC();
  return sub_100044D64((uint64_t (*)(void))v1[1]);
}

uint64_t static ToolKitHelper.fetchToolInvocationSummary(for:with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[22] = a3;
  v4[23] = v3;
  v4[20] = a1;
  v4[21] = a2;
  uint64_t v5 = type metadata accessor for ToolInvocationSummary(0LL);
  v4[24] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v4[25] = v6;
  v4[26] = sub_100013328(v6);
  uint64_t v7 = type metadata accessor for ToolInvocationSummary.ParameterSummary.Value(0LL);
  v4[27] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v4[28] = v8;
  v4[29] = sub_10005324C(v8);
  v4[30] = sub_1000421E4();
  v4[31] = sub_1000421E4();
  uint64_t v9 = type metadata accessor for ToolInvocationSummary.ParameterSummary(0LL);
  v4[32] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v4[33] = v10;
  v4[34] = sub_10005324C(v10);
  v4[35] = sub_1000421E4();
  v4[36] = sub_1000421E4();
  v4[37] = sub_1000421E4();
  v4[38] = sub_1000421E4();
  v4[39] = sub_1000421E4();
  uint64_t v11 = type metadata accessor for DispatchQoS.QoSClass(0LL);
  v4[40] = v11;
  uint64_t v12 = *(void *)(v11 - 8);
  v4[41] = v12;
  v4[42] = sub_100013328(v12);
  sub_10000F3A0();
  return sub_10000F2D0();
}

#error "10004EC6C: call analysis failed (funcsize=83)"
uint64_t sub_10004ED18(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  uint64_t v8 = *v3;
  uint64_t v5 = v8;
  sub_10004729C(&v8);
  *(void *)(v5 + 376) = v2;
  swift_task_dealloc();
  if (!v2)
  {
    uint64_t v6 = *(void **)(v5 + 360);
    sub_100042E4C();
  }

  sub_10000F3A0();
  return sub_100053474();
}

uint64_t sub_10004ED90()
{
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_10004EE18;
  uint64_t v1 = swift_continuation_init(v0 + 2, 1LL);
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000LL;
  uint64_t v2 = sub_100053DE0(v1, (uint64_t)sub_1000500E4);
  sub_100053E20(v2, "updateParameterSummaryIfNeeded:");
  return swift_continuation_await(v0 + 2);
}

uint64_t sub_10004EE18()
{
  *(void *)(v0 + 384) = v1;
  sub_10000F3A0();
  return sub_10000F2D0();
}

#error "10004F0D8: call analysis failed (funcsize=180)"
uint64_t sub_10004F144(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v3 = *v2;
  *(void *)(v3 + 464) = a1;
  *(void *)(v3 + 472) = v1;
  swift_task_dealloc();
  if (v1) {
    swift_errorRelease(v1);
  }
  sub_10000F3A0();
  return sub_10000F2D0();
}

#error "10004F72C: call analysis failed (funcsize=541)"
#error "10004FAD8: call analysis failed (funcsize=35)"
#error "10004FD1C: call analysis failed (funcsize=161)"
#error "100050044: call analysis failed (funcsize=207)"
uint64_t sub_1000500E4(uint64_t a1, void *a2, void *a3)
{
  return sub_1000500F0(a1, a2, a3, (uint64_t (*)(void, void *))sub_1000531F4);
}

uint64_t sub_1000500F0(uint64_t result, void *a2, void *a3, uint64_t (*a4)(void, void *))
{
  if (a3)
  {
    id v4 = a3;
    return sub_10004B128();
  }

  else if (a2)
  {
    return a4(*(void *)(result + 32), a2);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1000501CC(void *a1, uint64_t a2, void *aBlock, uint64_t a4)
{
  v4[2] = a2;
  v4[3] = _Block_copy(aBlock);
  id v8 = a1;
  swift_unknownObjectRetain(a2);
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v11 = v10;

  v4[4] = v9;
  v4[5] = v11;
  swift_getObjCClassMetadata(a4);
  uint64_t v12 = (void *)swift_task_alloc(dword_10006A7B4);
  v4[6] = v12;
  *uint64_t v12 = v4;
  v12[1] = sub_10005027C;
  return static ToolKitHelper.fetchToolInvocationSummary(for:with:)(v9, v11, a2);
}

uint64_t sub_10005027C()
{
  uint64_t v3 = (void *)v2[2];
  sub_10000F668(v2[6], v4);
  swift_unknownObjectRelease(v3);
  sub_10003FCFC(v2[4], v2[5]);
  if (v0)
  {
    sub_10005376C();
    sub_1000534A4();
    sub_100053E50();
  }

  else
  {
    sub_10005347C();
    sub_1000533C0();
    sub_100053D94();
  }

  sub_100053364();

  sub_1000537FC();
  return sub_100053298(*(uint64_t (**)(void))(v1 + 8));
}

id ToolKitHelper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "init");
}

id _s24BackgroundShortcutRunner13ToolKitHelperCfD_0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_100050378(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
  id v9 = [v4 initWithTypeIdentifier:v7 instanceIdentifier:v8];

  return v9;
}

uint64_t sub_1000503FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  id v4 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v4;
  *id v4 = v3;
  v4[1] = sub_1000531E8;
  return v6();
}

uint64_t sub_100050450(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  NSString v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc(a4[1]);
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000531E8;
  return v7();
}

uint64_t sub_1000504A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  if (sub_1000084E0(a1, 1LL, v6) == 1)
  {
    sub_10000D8E0(a1, &qword_100069D88);
    uint64_t v7 = 7168LL;
  }

  else
  {
    unsigned __int8 v8 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
    uint64_t v7 = v8 | 0x1C00LL;
  }

  uint64_t v9 = *(void *)(a3 + 16);
  if (v9)
  {
    uint64_t ObjectType = swift_getObjectType(*(void *)(a3 + 16));
    swift_unknownObjectRetain(v9);
    uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType);
    uint64_t v13 = v12;
    swift_unknownObjectRelease(v9);
  }

  else
  {
    uint64_t v11 = 0LL;
    uint64_t v13 = 0LL;
  }

  uint64_t v14 = swift_allocObject(&unk_100066D48, 32LL, 7LL);
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v17[0] = 0LL;
    v17[1] = 0LL;
    uint64_t v15 = v17;
    v17[2] = v11;
    v17[3] = v13;
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return swift_task_create(v7, v15, (char *)&type metadata for () + 8, &unk_10006A8F0, v14);
}

uint64_t sub_1000505E8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10005064C;
  return v6(a1);
}

uint64_t sub_10005064C()
{
  return sub_10000F2C4(v0[1]);
}

unint64_t sub_100050684(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v14 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v14);
    return (unint64_t)v4;
  }

  sub_10000844C(&qword_10006A978);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100053148();
    unint64_t result = sub_100051B88(v15, v16, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10005080C);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v10 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v10 = v15;
    v10[1] = v16;
    unint64_t result = (unint64_t)sub_100009AC4(&v17, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v11 = v4[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_12;
    }
    v4[2] = v13;
    v7 += 48LL;
    if (!--v5)
    {
      swift_release(v4);
      uint64_t v14 = a1;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ToolKitHelper.DynamicEnumerationDefinition()
{
  return objc_opt_self(&OBJC_CLASS___WFToolKitDynamicEnumerationDefinition);
}

uint64_t type metadata accessor for ToolKitHelper.ContentPropertyPossibleValuesDefinition()
{
  return objc_opt_self(&OBJC_CLASS___WFToolKitContentPropertyPossibleValuesDefinition);
}

unint64_t sub_10005080C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * i);
    uint64_t v11 = v10[1];
    if ((*v10 != a1 || v11 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      unint64_t i = (i + 1) & v13;
      if (((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
      {
        uint64_t v14 = (void *)(v9 + 16 * i);
        uint64_t v15 = v14[1];
        if ((*v14 != a1 || v15 != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v13; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v13)
          {
            __int128 v17 = (void *)(v9 + 16 * i);
            uint64_t v18 = v17[1];
            if (*v17 == a1 && v18 == a2) {
              break;
            }
            if ((_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0) {
              break;
            }
          }
        }
      }
    }
  }

  return i;
}

void sub_100050954(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_100009BEC();
    sub_100046DEC();
    sub_100042E4C();
  }

  sub_100008D60();
}

void sub_1000509A0()
{
  if ((v3 & 1) != 0)
  {
    sub_1000534C0();
    if (v4 != v5)
    {
      sub_100053854();
      if (v4)
      {
        __break(1u);
        return;
      }

      sub_1000534B0();
    }
  }

  sub_100053844();
  if (v2)
  {
    uint64_t v6 = sub_10000844C(&qword_10006A9F0);
    uint64_t v7 = (const void *)sub_100042644(v6, 8 * v2 + 32);
    size_t v8 = j__malloc_size(v7);
    sub_100053B08(v8 - 32);
  }

  if ((v1 & 1) != 0)
  {
    uint64_t v9 = (char *)sub_100053D7C();
    sub_1000513AC(v9, v10, v11);
    *(void *)(v0 + 16) = 0LL;
    sub_100042E4C();
  }

  else
  {
    uint64_t v12 = sub_100053C9C();
    sub_100050EF8(v12, v13, v14, v15);
  }

  sub_10000F6AC();
}

void sub_100050A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_100050A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100050A8C( a1,  a2,  a3,  a4,  &qword_10006AA00,  (void (*)(void))&type metadata accessor for TypeDefinition);
}

uint64_t sub_100050A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100050A8C( a1,  a2,  a3,  a4,  &qword_10006A9E8,  (void (*)(void))&type metadata accessor for TypeIdentifier);
}

uint64_t sub_100050A8C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(void))
{
  char v10 = a1;
  if ((a3 & 1) != 0)
  {
    sub_1000534C0();
    if (v12 != v13)
    {
      sub_100053854();
      if (v12)
      {
        __break(1u);
LABEL_23:
        sub_10005331C();
        uint64_t v23 = "Division by zero";
        uint64_t v24 = 16LL;
LABEL_25:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v23,  v24,  2LL,  "Swift/IntegerTypes.swift",  24LL);
        __break(1u);
        return result;
      }

      sub_1000534B0();
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (!v15)
  {
    __int128 v17 = &_swiftEmptyArrayStorage;
    goto LABEL_18;
  }

  sub_100053E0C(a1, a2, a3, a4, a5);
  uint64_t v16 = sub_100053C94();
  __int128 v17 = (void *)sub_100053660(v16);
  size_t v18 = j__malloc_size(v17);
  if (!v6) {
    goto LABEL_23;
  }
  if (v18 - v7 == 0x8000000000000000LL && v6 == -1)
  {
    sub_10005331C();
    uint64_t v23 = "Division results in an overflow";
    uint64_t v24 = 31LL;
    goto LABEL_25;
  }

  v17[2] = v14;
  v17[3] = 2 * ((uint64_t)(v18 - v7) / v6);
LABEL_18:
  sub_100053C94();
  sub_100053CE4();
  if ((v10 & 1) != 0)
  {
    sub_1000516C8(a4 + v21, v14, v20, a6);
    *(void *)(a4 + 16) = 0LL;
    sub_100042E4C();
  }

  else
  {
    sub_1000510DC(0LL, v14, v20, a4, a6);
  }

  return (uint64_t)v17;
}

void sub_100050BF8()
{
  if ((v3 & 1) != 0)
  {
    sub_1000534C0();
    if (v4 != v5)
    {
      sub_100053854();
      if (v4)
      {
        __break(1u);
        return;
      }

      sub_1000534B0();
    }
  }

  sub_100053844();
  if (v2)
  {
    uint64_t v6 = sub_100050EBC();
    uint64_t v7 = (const void *)swift_allocObject( v6,  ((*(unsigned int *)(v6 + 48) + 7LL) & 0x1FFFFFFF8LL) + 8 * v2,  *(unsigned __int16 *)(v6 + 52) | 7LL);
    size_t v8 = j__malloc_size(v7);
    sub_100053B08(v8 - 32);
  }

  if ((v1 & 1) != 0)
  {
    uint64_t v9 = (char *)sub_100053D7C();
    sub_1000513AC(v9, v10, v11);
    *(void *)(v0 + 16) = 0LL;
    sub_100042E4C();
  }

  else
  {
    uint64_t v12 = sub_100053C9C();
    sub_100050EF8(v12, v13, v14, v15);
  }

  sub_10000F6AC();
}

uint64_t sub_100050CA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100050A8C( a1,  a2,  a3,  a4,  &qword_10006A9D0,  (void (*)(void))&type metadata accessor for SystemToolProtocol);
}

uint64_t sub_100050CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100050A8C( a1,  a2,  a3,  a4,  &qword_10006A9B0,  (void (*)(void))&type metadata accessor for SampleInvocationDefinition);
}

uint64_t sub_100050CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100050A8C( a1,  a2,  a3,  a4,  &qword_10006A9A8,  (void (*)(void))&type metadata accessor for RuntimeRequirement);
}

uint64_t sub_100050CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100050A8C(a1, a2, a3, a4, &qword_10006A998, (void (*)(void))_s15ActionParameterVMa);
}

uint64_t sub_100050CF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100050A8C( a1,  a2,  a3,  a4,  &qword_10006A9D8,  (void (*)(void))&type metadata accessor for ParameterRelationshipDefinition);
}

uint64_t sub_100050D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100050A8C( a1,  a2,  a3,  a4,  &qword_10006A970,  (void (*)(void))&type metadata accessor for TypedValue);
}

void sub_100050D20()
{
  if ((v4 & 1) != 0)
  {
    sub_1000534C0();
    if (v5 != v6)
    {
      sub_100053854();
      if (v5)
      {
        __break(1u);
        return;
      }

      sub_1000534B0();
    }
  }

  sub_100053844();
  if (v3)
  {
    uint64_t v7 = sub_10000844C(&qword_10006A990);
    size_t v8 = (void *)sub_100042644(v7, 24 * v3 + 32);
    size_t v9 = j__malloc_size(v8);
    v8[2] = v2;
    v8[3] = 2 * ((uint64_t)(v9 - 32) / 24);
  }

  if ((v1 & 1) != 0)
  {
    uint64_t v10 = (char *)sub_100053D7C();
    sub_100051538(v10, v11, v12);
    *(void *)(v0 + 16) = 0LL;
    sub_100042E4C();
  }

  else
  {
    uint64_t v13 = sub_100053C9C();
    sub_1000511BC(v13, v14, v15, v16);
  }

  sub_100053AB4();
}

void sub_100050DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_100050DF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(void, uint64_t, void *, uint64_t), void (*a7)(uint64_t, uint64_t, void *))
{
  char v10 = a1;
  if ((a3 & 1) != 0)
  {
    sub_1000534C0();
    if (v12 != v13)
    {
      sub_100053854();
      if (v12)
      {
        __break(1u);
        return;
      }

      sub_1000534B0();
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (v15)
  {
    uint64_t v16 = sub_100053E0C(a1, a2, a3, a4, a5);
    __int128 v17 = (void *)sub_100042644(v16, 16 * v15 + 32);
    size_t v18 = j__malloc_size(v17);
    v17[2] = v14;
    v17[3] = 2 * ((uint64_t)(v18 - 32) / 16);
  }

  else
  {
    __int128 v17 = &_swiftEmptyArrayStorage;
  }

  uint64_t v19 = v17 + 4;
  if ((v10 & 1) != 0)
  {
    a7(a4 + 32, v14, v19);
    *(void *)(a4 + 16) = 0LL;
    sub_100042E4C();
  }

  else
  {
    a6(0LL, v14, v19, a4);
  }

  sub_100053AB4();
}

uint64_t sub_100050EBC()
{
  uint64_t v0 = sub_10000844C(&qword_10006A108);
  if (sub_1000531B8(v0, v0)) {
    return sub_10000844C(&qword_10006A6F0);
  }
  else {
    return sub_10000844C(&qword_10006A9F8);
  }
}

char *sub_100050EF8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  char v6 = (char *)(a4 + 8 * a1 + 32);
  uint64_t v7 = &__dst[8 * v4];
  if (v6 >= v7 || &v6[8 * v4] <= __dst)
  {
    memcpy(__dst, v6, 8 * v4);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100050FE8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 16 * a1 + 32;
  unint64_t v7 = a3 + 16 * v4;
  if (v6 >= v7 || v6 + 16 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1000510DC( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v5 < 0)
  {
LABEL_9:
    sub_10005331C();
    sub_100053AC4();
    goto LABEL_11;
  }

  a5(0LL);
  sub_100053D2C();
  uint64_t v9 = *(void *)(v8 + 72);
  unint64_t v11 = v10 + v9 * a1;
  uint64_t v12 = v9 * v5;
  unint64_t v13 = a3 + v12;
  unint64_t v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    sub_100042E4C();
    return v13;
  }

  sub_10005331C();
  sub_100053AD4();
LABEL_11:
  uint64_t result = sub_100053600(v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27);
  __break(1u);
  return result;
}

uint64_t sub_1000511BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 24 * a1 + 32;
  unint64_t v7 = a3 + 24 * v4;
  if (v6 >= v7 || v6 + 24 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1000512B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 < 0)
  {
LABEL_9:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  unint64_t v6 = a4 + 16 * a1 + 32;
  unint64_t v7 = a3 + 16 * v4;
  if (v6 >= v7 || v6 + 16 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    swift_bridgeObjectRelease(a4);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_1000513AC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }

  return __src;
}

char *sub_100051430(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_10005331C();
    __src = (char *)sub_100053600( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count",  55LL,  v4,  (uint64_t)"Swift/UnsafePointer.swift",  v5,  v6,  v7,  v8);
    __break(1u);
  }

  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }

  return __src;
}

void sub_1000514A0(uint64_t a1, uint64_t a2, unint64_t a3)
{
}

char *sub_1000514AC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }

  return __src;
}

char *sub_100051538(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }

  return __src;
}

char *sub_1000515C0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }

  return __src;
}

char *sub_100051644(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    char v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v4,  1046LL,  0);
    __break(1u);
  }

  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }

  return __src;
}

void sub_1000516C8(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_10005331C();
    sub_100053600( (uint64_t)"Fatal error",  11LL,  2LL,  (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count",  55LL,  v15,  (uint64_t)"Swift/UnsafePointer.swift",  v16,  v17,  v18,  v19);
    __break(1u);
  }

  else
  {
    sub_100053EF8();
    if (v9 < v8 || v5 + *(void *)(*(void *)(((uint64_t (*)(void))a4)(0LL) - 8) + 72LL) * v4 <= a3)
    {
      a4(0LL);
      uint64_t v11 = sub_100053C6C();
      swift_arrayInitWithTakeFrontToBack(v11, v12, v13, v14);
    }

    else if (a3 == v5)
    {
      sub_100046378();
    }

    else
    {
      uint64_t v10 = sub_100053C6C();
      swift_arrayInitWithTakeBackToFront(v10);
    }
  }

uint64_t sub_100051794(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3) {
      return swift_arrayInitWithCopy(a3);
    }
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

uint64_t sub_100051860(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_100051ABC(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for TypeDefinition);
}

void *sub_10005186C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_10005331C();
    sub_100053AC4();
  }

  else
  {
    if (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst) {
      return memcpy(__dst, __src, 8 * a2);
    }
    sub_10005331C();
    sub_100053AD4();
  }

  uint64_t result = (void *)sub_100053600(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  __break(1u);
  return result;
}

uint64_t sub_100051904(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_100051ABC( a1,  a2,  a3,  (uint64_t (*)(void))&type metadata accessor for SampleInvocationDefinition);
}

uint64_t sub_100051910(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_100051ABC(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for RuntimeRequirement);
}

uint64_t sub_10005191C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (a3 + 48 * a2 <= a1 || a1 + 48 * a2 <= a3) {
      return swift_arrayInitWithCopy(a3);
    }
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

uint64_t sub_1000519EC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    if (a3 + 32 * a2 <= a1 || a1 + 32 * a2 <= a3) {
      return swift_arrayInitWithCopy(a3);
    }
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

uint64_t sub_100051ABC( unint64_t a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(void))
{
  if (a2 < 0)
  {
    sub_10005331C();
    sub_100053AC4();
  }

  else
  {
    uint64_t v6 = *(void *)(*(void *)(a4(0LL) - 8) + 72LL) * a2;
    unint64_t v7 = a3 + v6;
    unint64_t v8 = a1 + v6;
    if (v7 <= a1 || v8 <= a3)
    {
      uint64_t v10 = sub_10000F674();
      return swift_arrayInitWithCopy(v10);
    }

    sub_10005331C();
    sub_100053AD4();
  }

  uint64_t result = sub_100053600(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  __break(1u);
  return result;
}

uint64_t sub_100051B7C(uint64_t a1, uint64_t a2)
{
  return sub_100051B88(a1, a2, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_100051D80);
}

uint64_t sub_100051B88(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  Swift::Int v5 = sub_100045CEC();
  return a3(a1, a2, v5);
}

unint64_t sub_100051BE8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TypeIdentifier(0LL);
  sub_100053180(&qword_10006A2D8, (void (*)(uint64_t))&type metadata accessor for TypeIdentifier);
  dispatch thunk of Hashable.hash(into:)(v8, v2, v3);
  type metadata accessor for ToolKitIndexer.TypeRegistryKey(0LL);
  uint64_t v4 = type metadata accessor for Locale(0LL);
  sub_100053180((unint64_t *)&unk_10006A2E0, (void (*)(uint64_t))&type metadata accessor for Locale);
  dispatch thunk of Hashable.hash(into:)(v8, v4, v5);
  Swift::Int v6 = sub_100045CEC();
  return sub_100051E60(a1, v6);
}

unint64_t sub_100051CAC()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = type metadata accessor for AssistantSchemaIdentifier(0LL);
  sub_100053180(&qword_10006A9B8, (void (*)(uint64_t))&type metadata accessor for AssistantSchemaIdentifier);
  dispatch thunk of Hashable._rawHashValue(seed:)(v1, v2, v3);
  uint64_t v4 = sub_100053D40();
  return sub_100051F74(v4, v5);
}

unint64_t sub_100051D14(uint64_t a1, uint64_t a2, char a3)
{
  Swift::Int v6 = sub_100045CEC();
  return sub_1000520B4(a1, a2, a3, v6);
}

unint64_t sub_100051D80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    uint64_t v11 = v10[1];
    BOOL v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) == 0)
    {
      uint64_t v13 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v13;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_100051E60(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for ToolKitIndexer.TypeRegistryKey(0LL);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    while (1)
    {
      sub_1000131F0(*(void *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      if ((static TypeIdentifier.== infix(_:_:)(v8, a1) & 1) != 0
        && (static Locale.== infix(_:_:)(&v8[*(int *)(v5 + 20)], a1 + *(int *)(v5 + 20)) & 1) != 0)
      {
        break;
      }

      sub_100013160((uint64_t)v8);
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        return v10;
      }
    }

    sub_100013160((uint64_t)v8);
  }

  return v10;
}

unint64_t sub_100051F74(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for AssistantSchemaIdentifier(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v10 = a2 & ~v9;
  if (((*(void *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
  {
    uint64_t v11 = ~v9;
    uint64_t v12 = *(void *)(v6 + 72);
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(void *)(v3 + 48) + v12 * v10, v5);
      sub_100053180( &qword_10006A9C0,  (void (*)(uint64_t))&type metadata accessor for AssistantSchemaIdentifier);
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

unint64_t sub_1000520B4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v5 = v4 + 64;
  uint64_t v6 = -1LL << *(_BYTE *)(v4 + 32);
  unint64_t v7 = a4 & ~v6;
  if (((*(void *)(v4 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0)
  {
    uint64_t v11 = ~v6;
    uint64_t v12 = *(void *)(v4 + 48);
    do
    {
      uint64_t v13 = (uint64_t *)(v12 + 24 * v7);
      uint64_t v14 = *v13;
      uint64_t v15 = v13[1];
      int v16 = *((unsigned __int8 *)v13 + 16);
      if (v16)
      {
        if (v16 != 1) {
          __asm { BR              X8 }
        }

        if (a3 != 1) {
          goto LABEL_13;
        }
      }

      else if (a3)
      {
        goto LABEL_13;
      }

      BOOL v17 = v14 == a1 && v15 == a2;
      if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0LL) & 1) != 0) {
        return v7;
      }
LABEL_13:
      unint64_t v7 = (v7 + 1) & v11;
    }

    while (((*(void *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0);
  }

  return v7;
}

BOOL sub_10005226C(uint64_t a1)
{
  return (a1 & 0xC000000000000001LL) == 0;
}

unint64_t sub_10005227C(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000LL) != 0)
    {
      __break(1u);
    }

    else if (*(void *)((a3 & 0xFFFFFFFFFFFFF8LL) + 0x10) > result)
    {
      return result;
    }

    __break(1u);
  }

  return result;
}

void sub_1000522A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *uint64_t v3 = v4;
}

void sub_1000522CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *uint64_t v3 = v4;
}

void sub_1000522F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *uint64_t v3 = v4;
}

void sub_100052324(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *uint64_t v3 = v4;
}

char *sub_100052350(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000525AC(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_10005236C()
{
  *uint64_t v0 = v1;
}

void sub_100052388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *uint64_t v3 = v4;
}

char *sub_1000523B4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100052694(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_1000523D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *uint64_t v3 = v4;
}

void sub_1000523FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(void))
{
  char v10 = a1;
  if ((a3 & 1) != 0)
  {
    sub_1000534C0();
    if (v12 != v13)
    {
      sub_100053854();
      if (v12)
      {
LABEL_23:
        __break(1u);
        return;
      }

      sub_1000534B0();
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  uint64_t v14 = *(void *)(a4 + 16);
  if (v11 <= v14) {
    uint64_t v15 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v15 = v11;
  }
  if (!v15) {
    goto LABEL_17;
  }
  sub_100053E0C(a1, a2, a3, a4, a5);
  uint64_t v16 = sub_100053C94();
  BOOL v17 = (void *)sub_100053660(v16);
  size_t v18 = j__malloc_size(v17);
  if (!v6)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  if (v18 - v7 == 0x8000000000000000LL && v6 == -1) {
    goto LABEL_22;
  }
  v17[2] = v14;
  v17[3] = 2 * ((uint64_t)(v18 - v7) / v6);
LABEL_17:
  sub_100053C94();
  sub_100053CE4();
  unint64_t v22 = a4 + v21;
  if ((v10 & 1) != 0)
  {
    sub_1000516C8(v22, v14, v20, a6);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_100051ABC(v22, v14, v20, (uint64_t (*)(void))a6);
  }

  swift_release(a4);
}

void sub_1000524F0()
{
  if ((v3 & 1) != 0)
  {
    sub_1000534C0();
    if (v4 != v5)
    {
      sub_100053854();
      if (v4)
      {
        __break(1u);
        return;
      }

      sub_1000534B0();
    }
  }

  sub_100053844();
  if (v2)
  {
    uint64_t v6 = sub_10000844C(&qword_100069A98);
    uint64_t v7 = (const void *)sub_100042644(v6, 16 * v2 + 32);
    size_t v8 = j__malloc_size(v7);
    sub_100053B08(v8 - 32);
  }

  uint64_t v9 = (char *)sub_100053D7C();
  if ((v1 & 1) != 0)
  {
    sub_100051430(v9, v10, v11);
    *(void *)(v0 + 16) = 0LL;
  }

  else
  {
    sub_100051794((unint64_t)v9, v10, (unint64_t)v11);
  }

  swift_release(v0);
  sub_10000F6AC();
}

void sub_100052598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

char *sub_1000525AC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000844C(&qword_10006A9A0);
    uint64_t v11 = (char *)swift_allocObject(v10, 48 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 48);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  char v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1000514AC(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_10005191C((unint64_t)v14, v8, (unint64_t)v13);
  }

  swift_release(a4);
  return v11;
}

char *sub_100052694(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v7 = a2;
  }

  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_10000844C(&qword_10006A9C8);
    uint64_t v11 = (char *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 32);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  char v13 = v11 + 32;
  uint64_t v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_100051644(v14, v8, v13);
    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_1000519EC((unint64_t)v14, v8, (unint64_t)v13);
  }

  swift_release(a4);
  return v11;
}

uint64_t sub_100052774(void *a1, SEL *a2)
{
  id v2 = [a1 *a2];
  if (v2)
  {
    char v3 = v2;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  }

  return sub_1000460C4();
}

void *sub_1000527CC(void *a1)
{
  char v1 = a1;
  uint64_t v2 = a1[3];
  if ((*(_BYTE *)(*(void *)(v2 - 8) + 82LL) & 2) != 0)
  {
    *char v1 = swift_allocBox(v2);
    return (void *)v3;
  }

  return v1;
}

void *sub_100052808(void *result, id a2, unint64_t a3, uint64_t a4)
{
  switch(a3 >> 61)
  {
    case 0uLL:
    case 3uLL:
      uint64_t result = (void *)swift_bridgeObjectRelease(result);
      break;
    case 1uLL:
      uint64_t result = (void *)swift_bridgeObjectRelease(a2);
      break;
    case 2uLL:

      uint64_t result = (void *)swift_bridgeObjectRelease(a4);
      break;
    default:
      return result;
  }

  return result;
}

id sub_100052860(id result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  switch(a3 >> 61)
  {
    case 0uLL:
    case 3uLL:
      uint64_t result = (id)swift_bridgeObjectRetain(result);
      break;
    case 1uLL:
      uint64_t result = (id)swift_bridgeObjectRetain(a2);
      break;
    case 2uLL:
      id v4 = result;
      swift_bridgeObjectRetain(a4);
      uint64_t result = v4;
      break;
    default:
      return result;
  }

  return result;
}

id sub_1000528BC(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0) {
    return a1;
  }
  id v5 = a1;
  return (id)swift_bridgeObjectRetain(a3);
}

void sub_1000528E8(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0) {
    swift_bridgeObjectRelease(a3);
  }
}

unint64_t sub_100052920()
{
  unint64_t result = qword_10006A6E0;
  if (!qword_10006A6E0)
  {
    uint64_t v1 = sub_10000D89C(&qword_10006A6D8);
    sub_100053180(&qword_10006A6E8, (void (*)(uint64_t))&type metadata accessor for TypedValue);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_10006A6E0);
  }

  return result;
}

unint64_t sub_10005299C()
{
  unint64_t result = qword_10006A798;
  if (!qword_10006A798)
  {
    unint64_t result = swift_getWitnessTable(&unk_100059CDC, &type metadata for ToolKitDeferredValueResolutionError);
    atomic_store(result, (unint64_t *)&qword_10006A798);
  }

  return result;
}

uint64_t sub_1000529D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000844C(&qword_10006A420);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_100052A20(uint64_t a1, unint64_t *a2, void *a3)
{
  if (!*a2)
  {
    uint64_t v4 = objc_opt_self(*a3);
    atomic_store(swift_getObjCClassMetadata(v4), a2);
  }

  sub_100008D60();
}

unint64_t sub_100052A58()
{
  unint64_t result = qword_10006A7D0;
  if (!qword_10006A7D0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ToolKitHelper.ValueSetType,  &type metadata for ToolKitHelper.ValueSetType);
    atomic_store(result, (unint64_t *)&qword_10006A7D0);
  }

  return result;
}

uint64_t type metadata accessor for ToolKitHelper()
{
  return objc_opt_self(&OBJC_CLASS___WFToolKitHelper);
}

ValueMetadata *type metadata accessor for ToolKitHelper.ValueSetType()
{
  return &type metadata for ToolKitHelper.ValueSetType;
}

uint64_t getEnumTagSinglePayload for ToolKitDeferredValueResolutionError( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }

  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }

    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }

    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }

    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }

uint64_t storeEnumTagSinglePayload for ToolKitDeferredValueResolutionError( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(sub_10000F668(*(void *)(v3 + 40), v4) = 1;
  }
  else {
    LODWORD(sub_10000F668(*(void *)(v3 + 40), v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_100052B98 + 4 * byte_100059B12[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_100052BCC + 4 * byte_100059B0D[v4]))();
}

uint64_t sub_100052BCC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100052BD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100052BDCLL);
  }
  return result;
}

uint64_t sub_100052BE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100052BF0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_100052BF4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100052BFC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100052C08(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ToolKitDeferredValueResolutionError()
{
  return &type metadata for ToolKitDeferredValueResolutionError;
}

unint64_t sub_100052C24()
{
  unint64_t result = qword_10006A850;
  if (!qword_10006A850)
  {
    unint64_t result = swift_getWitnessTable(&unk_100059CB4, &type metadata for ToolKitDeferredValueResolutionError);
    atomic_store(result, (unint64_t *)&qword_10006A850);
  }

  return result;
}

uint64_t sub_100052C60()
{
  uint64_t v1 = sub_1000538B0();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_100052C88()
{
  uint64_t v1 = (void *)sub_1000539E0();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_1000532C0(v1, (uint64_t)sub_100052CC8);
  return sub_1000532AC(v2, v3, v4, v5, v6);
}

uint64_t sub_100052CC8()
{
  return v0[1]();
}

uint64_t sub_100052D08()
{
  uint64_t v1 = (void *)sub_1000539E0();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_1000532C0(v1, (uint64_t)sub_1000531E8);
  return sub_1000532AC(v2, v3, v4, v5, v6);
}

uint64_t sub_100052D4C()
{
  uint64_t v1 = sub_1000538B0();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_100052D70()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10006A8DC);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000531E8;
  sub_100053DCC();
  return v2();
}

uint64_t sub_100052DE8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_100052E0C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)sub_100053B8C();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000D718;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10006A8E8 + dword_10006A8E8))(a1, v4);
}

uint64_t sub_100052E7C()
{
  uint64_t v1 = (void *)sub_1000539E0();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_1000532C0(v1, (uint64_t)sub_1000531E8);
  return sub_1000532AC(v2, v3, v4, v5, v6);
}

uint64_t sub_100052EC0()
{
  uint64_t v1 = (void *)sub_100053B8C();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_1000534D0(v1, (uint64_t)sub_1000531E8);
  return sub_100053464(v2, v3, v4, v5);
}

uint64_t sub_100052F04()
{
  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_100052F3C()
{
  uint64_t v1 = (void *)swift_task_alloc(dword_10006A91C);
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1000531E8;
  sub_100053DCC();
  return v2();
}

uint64_t sub_100052FB4()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100052FDC()
{
  uint64_t v1 = (void *)sub_100053B8C();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_1000534D0(v1, (uint64_t)sub_1000531E8);
  return sub_100053464(v2, v3, v4, v5);
}

uint64_t sub_100053024()
{
  uint64_t v1 = (void *)sub_1000539E0();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_1000532C0(v1, (uint64_t)sub_1000531E8);
  return sub_1000532AC(v2, v3, v4, v5, v6);
}

uint64_t sub_100053068()
{
  _Block_release(*(const void **)(v0 + 32));
  uint64_t v1 = sub_1000538B0();
  return swift_deallocObject(v1, v2, v3);
}

uint64_t sub_100053090()
{
  uint64_t v1 = (void *)sub_1000539E0();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_1000532C0(v1, (uint64_t)sub_1000531E8);
  return sub_1000532AC(v2, v3, v4, v5, v6);
}

uint64_t sub_1000530D0()
{
  return swift_deallocObject(v0, 40LL, 7LL);
}

uint64_t sub_100053104()
{
  uint64_t v1 = (void *)sub_100053B8C();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = sub_1000534D0(v1, (uint64_t)sub_1000531E8);
  return sub_100053464(v2, v3, v4, v5);
}

void sub_100053148()
{
  uint64_t v1 = sub_1000460C4();
  v2(v1);
  sub_100008D60();
}

void sub_100053180(unint64_t *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255LL);
    uint64_t v3 = sub_100053D40();
    atomic_store(swift_getWitnessTable(v3, v4), a1);
  }

  sub_100008D60();
}

uint64_t sub_1000531B8(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

uint64_t sub_1000531FC()
{
  return (*(uint64_t (**)(void, void))(v0[25] + 8LL))(v0[26], v0[24]);
}

uint64_t sub_10005324C@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(void *)(a1 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
}

uint64_t sub_100053260(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10005327C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_100053298(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000532AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t sub_1000532C0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_1000532E4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100053300()
{
  return ((uint64_t (*)(void))ToolInvocationBox.contentCollection(for:variableSource:))();
}

  ;
}

uint64_t sub_100053330()
{
  return ((uint64_t (*)(void))swift_task_switch)();
}

uint64_t sub_100053340()
{
  return swift_task_dealloc(*(void *)(v0 + 336));
}

uint64_t sub_100053364()
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v2, v0, v1);
}

uint64_t sub_100053378(uint64_t a1)
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)(v2, v1, a1);
}

uint64_t sub_100053388@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_100053394()
{
  return swift_task_dealloc(*(void *)(v0 + 248));
}

uint64_t sub_1000533C0()
{
  return sub_10003FCFC(v1, v0);
}

uint64_t sub_1000533D0(uint64_t a1)
{
  return _BridgedStoredNSError.init(_:userInfo:)(v1, v3, v2, a1);
}

uint64_t sub_1000533EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_100053408@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  return swift_beginAccess(v2 + a1, va, 0LL, 0LL);
}

uint64_t sub_100053420()
{
  return v0;
}

uint64_t sub_100053434@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return swift_beginAccess(v2 + a2, a1, 33LL, 0LL);
}

uint64_t sub_100053448@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_100053454(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100053464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t sub_100053474()
{
  return swift_task_switch();
}

NSData sub_10005347C()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100053488(uint64_t a1)
{
  return sub_10000848C(v1, 1LL, 1LL, a1);
}

void sub_10005349C(uint64_t a1, unint64_t *a2, void *a3)
{
}

uint64_t sub_1000534A4()
{
  return swift_errorRelease(v0);
}

  ;
}

  ;
}

uint64_t sub_1000534D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_1000534F0@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 + 8 * (v4 >> 6) + 64) |= 1LL << v4;
  uint64_t v5 = (void *)(*(void *)(v2 + 48) + 16 * v4);
  *uint64_t v5 = v3;
  v5[1] = v1;
  return *(void *)(v2 + 56) + *(void *)(a1 + 72) * v4;
}

  ;
}

uint64_t sub_10005353C@<X0>(uint64_t a1@<X8>, uint64_t a2, ...)
{
  return swift_beginAccess(v2 + a1, va, 1LL, 0LL);
}

uint64_t sub_100053554()
{
  return swift_bridgeObjectRelease(v0);
}

  ;
}

uint64_t sub_10005359C()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96))(v0, v1);
}

void sub_1000535AC()
{
  *(void *)(v1 - 8) = *v0;
}

  ;
}

uint64_t sub_1000535E4()
{
  return ((uint64_t (*)(void))KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:))();
}

uint64_t sub_100053600( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  return _fatalErrorMessage(_:_:file:line:flags:)(a1, a2, a3, a4, a5, 2LL, a7, 25LL, a9, a10, a11);
}

void *sub_10005360C(void *a1, void *a2, unint64_t a3)
{
  return sub_100052808(a1, a2, a3, 0LL);
}

uint64_t sub_100053614()
{
  *(void *)(v1 - 112) = v0;
  return swift_willThrow();
}

uint64_t sub_100053620@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 96))(v1);
}

uint64_t sub_10005362C(uint64_t a1)
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)(v2, v1, a1);
}

uint64_t sub_100053640@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 40))(*(void *)(v1 + 56) + *(void *)(a1 + 72) * v2);
}

uint64_t sub_100053654( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(void))
{
  return sub_100050A8C(a1, a2, 1LL, v6, a5, a6);
}

uint64_t sub_100053660(uint64_t a1)
{
  return swift_allocObject( v1,  ((*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL))
         + *(void *)(*(void *)(a1 - 8) + 72LL) * v2,
           *(unsigned __int8 *)(*(void *)(a1 - 8) + 80LL) | 7LL);
}

uint64_t sub_100053684()
{
  return swift_willThrow();
}

uint64_t sub_10005368C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_1000536A0()
{
  return *(void *)(v0 + 528);
}

uint64_t sub_1000536C8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t sub_1000536E0()
{
  return POSIXError._nsError.getter();
}

uint64_t sub_1000536E8(uint64_t a1)
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v1, v3, v2, v1, a1);
}

  ;
}

void sub_100053730()
{
}

uint64_t sub_100053740@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 32))(a1, v3, v2);
}

uint64_t sub_100053750()
{
  return sub_10003FCFC(v0, v1);
}

uint64_t sub_10005375C@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t sub_10005376C()
{
  return _convertErrorToNSError(_:)(v0);
}

  ;
}

  ;
}

uint64_t sub_1000537B4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

BOOL sub_1000537C0()
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(v0, v1);
}

uint64_t sub_1000537D0(uint64_t a1)
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)(v1, v2, a1);
}

uint64_t sub_1000537E0(uint64_t a1)
{
  uint64_t v3 = v1[37];
  *(void *)(v2 - 128) = v1[40];
  *(void *)(v2 - 12sub_10004094C(v0, 0) = v3;
  uint64_t v4 = v1[33];
  *(void *)(v2 - 112) = v1[36];
  *(void *)(v2 - 104) = v4;
  return swift_task_dealloc(a1);
}

void sub_1000537FC()
{
}

uint64_t sub_100053804(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  return sub_100051B88(v4, v3, a3);
}

uint64_t sub_100053810(uint64_t a1)
{
  return _BridgedStoredNSError.init(_:userInfo:)(v2, v1, v3, a1);
}

uint64_t sub_10005382C@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

id sub_100053838(id a1)
{
  return a1;
}

  ;
}

  ;
}

void sub_100053860( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21)
{
}

void sub_100053868()
{
  *(void *)(v1 - 8) = *v0;
}

  ;
}

uint64_t sub_100053890()
{
  return sub_1000084E0(v1, 1LL, v0);
}

uint64_t sub_1000538B0()
{
  return v0;
}

uint64_t sub_1000538C0()
{
  return swift_isUniquelyReferenced_nonNull_native(v0);
}

uint64_t sub_1000538C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(a1, a2, a3, a4, a5);
}

uint64_t sub_1000538D0()
{
  return 1LL;
}

uint64_t sub_1000538D8()
{
  return *(void *)(v0 + 496);
}

uint64_t sub_1000538F8()
{
  return type metadata accessor for TypedValue(0LL);
}

  ;
}

uint64_t sub_100053914@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 12sub_10004094C(v0, 0) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  return 0LL;
}

uint64_t sub_100053934@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

void sub_100053940()
{
  *(void *)(v1 - 8) = *v0;
  *(void *)(v1 - 8) = *v0;
}

void sub_10005395C()
{
  uint64_t v2 = (void *)(v1 - 8);
  void *v2 = *v0;
  void *v2 = *v0;
}

uint64_t sub_100053978()
{
  return swift_task_dealloc(*(void *)(v0 + 224));
}

uint64_t sub_100053984()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 88) + 8LL))(v1, v0);
}

uint64_t sub_100053998(uint64_t a1)
{
  return ToolInvocationSummary.init(formatString:parameterSummaries:)(a1, v1, v2);
}

uint64_t sub_1000539A4(uint64_t a1)
{
  return sub_10003FCFC(a1, v1);
}

NSString sub_1000539AC()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000539B8()
{
  return *(void *)(v0 + 528);
}

  ;
}

uint64_t sub_1000539E0()
{
  return swift_task_alloc(*(unsigned int *)(v0 + 4));
}

uint64_t sub_1000539E8()
{
  return v0;
}

void *sub_1000539F4(uint64_t a1, ...)
{
  return Hasher.init(_seed:)((uint64_t *)va, *(void *)(v1 + 40));
}

uint64_t sub_100053A00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t (*a22)(void, void))
{
  return a22(*(void *)(v22 + 496), *(void *)(v22 + 480));
}

void sub_100053A14()
{
  *(void *)(v1 - 8) = *v0;
}

uint64_t sub_100053A30(uint64_t a1)
{
  return sub_10000848C(v1, 0LL, 1LL, a1);
}

uint64_t sub_100053A44()
{
  return 0LL;
}

uint64_t sub_100053A60(void *a1)
{
  *(void *)(v2 + 152) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 96);
}

uint64_t sub_100053A7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t (*a17)(uint64_t, uint64_t))
{
  return a17(a16, a15);
}

uint64_t sub_100053A88()
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 112) + 8LL))(v1, v0);
}

void sub_100053A9C()
{
  uint64_t v2 = v0[78];
  *(void *)(v1 - 136) = v0[77];
  *(void *)(v1 - 128) = v2;
  *(void *)(v1 - 144) = v0[76];
}

  ;
}

  ;
}

  ;
}

void sub_100053AE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
}

  ;
}

void sub_100053B08(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

  ;
}

uint64_t sub_100053B34@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v1, v2);
}

uint64_t sub_100053B44()
{
  return (*(uint64_t (**)(void, void))(v0[29] + 96LL))(v0[30], v0[28]);
}

void sub_100053B54()
{
  *(void *)(v1 + 432) = v0;
}

uint64_t sub_100053B64@<X0>( uint64_t a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W8>)
{
  *a2 = a8;
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_100053B74()
{
  return *(void *)(v0 + 496);
}

uint64_t sub_100053B8C()
{
  return swift_task_alloc(*(unsigned int *)(v0 + 4));
}

  ;
}

uint64_t sub_100053BA0()
{
  return v0;
}

  ;
}

uint64_t sub_100053BC8()
{
  return swift_task_dealloc(*(void *)(v0 + 104));
}

uint64_t sub_100053BD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return a17;
}

  ;
}

  ;
}

id sub_100053C10(uint64_t a1, uint64_t a2)
{
  return *(id *)(a2 + 32);
}

  ;
}

  ;
}

  ;
}

uint64_t sub_100053C5C()
{
  return (*(uint64_t (**)(void, void))(*(void *)(v0 - 120) + 8LL))( *(void *)(v0 - 104),  *(void *)(v0 - 112));
}

uint64_t sub_100053C6C()
{
  return v0;
}

void sub_100053C7C()
{
}

uint64_t sub_100053C8C()
{
  return type metadata accessor for WFContentItem.TypedValueResolutionContext(0LL);
}

uint64_t sub_100053C94()
{
  return v0(0LL);
}

uint64_t sub_100053C9C()
{
  return 0LL;
}

uint64_t sub_100053CAC(uint64_t a1, uint64_t a2)
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, a2);
}

  ;
}

  ;
}

  ;
}

void sub_100053CFC()
{
  uint64_t v2 = v0[66];
  *(void *)(v1 - 12sub_10004094C(v0, 0) = v0[65];
  *(void *)(v1 - 112) = v0[64];
  *(void *)(v1 - 104) = v2;
}

uint64_t sub_100053D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _BridgedStoredNSError.init(_:userInfo:)(a1, a2, *(void *)(v4 - 104), a4);
}

uint64_t sub_100053D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return swift_willThrow(a1, a2, a3, a4, a5, a6, a7);
}

  ;
}

uint64_t sub_100053D40()
{
  return v0;
}

  ;
}

uint64_t sub_100053D58@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  return a2(a1, v3, v2);
}

uint64_t sub_100053D64@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  return a1(v2, v1);
}

id sub_100053D70()
{
  return [v0 *(SEL *)(v1 + 1384)];
}

uint64_t sub_100053D7C()
{
  return v0 + 32;
}

  ;
}

  ;
}

uint64_t sub_100053DA0(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

uint64_t sub_100053DA8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  return sub_100051B88(v4, v3, a3);
}

uint64_t sub_100053DB4()
{
  return type metadata accessor for RestrictionContext.ValueSetDefinition(0LL);
}

id sub_100053DC0()
{
  return [v1 *(SEL *)(v0 + 1344)];
}

  ;
}

uint64_t sub_100053DE0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  v3[2] = a2;
  v3[3] = v2;
  v3[4] = result;
  return result;
}

void sub_100053DEC(uint64_t a1, uint64_t *a2)
{
}

uint64_t sub_100053DF4()
{
  return sub_10003FCFC(v1, v0);
}

uint64_t sub_100053E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _BridgedStoredNSError.init(_:userInfo:)(a1, a2, v4, a4);
}

uint64_t sub_100053E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  return sub_10000844C(a5);
}

uint64_t sub_100053E14()
{
  return sub_100009A44(v0, v1);
}

id sub_100053E20(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

uint64_t sub_100053E2C()
{
  return v0;
}

unint64_t sub_100053E40()
{
  return sub_100052920();
}

uint64_t sub_100053E48( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  return swift_bridgeObjectRelease(a16);
}

  ;
}

uint64_t sub_100053E5C()
{
  return sub_10003FCFC(*(void *)(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_100053E68(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 296);
}

uint64_t sub_100053E7C(void *a1)
{
  *a1 = v2;
  a1[1] = v1;
  return *(void *)(v2 + 224);
}

  ;
}

uint64_t sub_100053E9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  return sub_100051B88(v3, v4, a3);
}

uint64_t sub_100053EA8()
{
  return v0(v1, v2);
}

uint64_t sub_100053EB4()
{
  return v0 - 68;
}

uint64_t sub_100053EC8()
{
  return type metadata accessor for POSIXError(0LL);
}

uint64_t sub_100053ED0()
{
  return type metadata accessor for DisplayRepresentationConfiguration(0LL);
}

uint64_t sub_100053ED8()
{
  return swift_bridgeObjectRelease_n(0LL, 2LL);
}

  ;
}

void sub_100053EF0(void *a1@<X8>)
{
}

  ;
}

uint64_t sub_100053F04()
{
  return swift_task_dealloc(*(void *)(v0 + 96));
}

uint64_t sub_100053F10()
{
  return swift_task_dealloc(*(void *)(v0 + 96));
}

uint64_t sub_100053F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_stdlib_reportUnimplementedInitializer(a1, a2, a3, 6LL, 0LL);
}

uint64_t sub_100053F28()
{
  return v0;
}

uint64_t sub_100053F34()
{
  return sub_10003FCFC(v1, v0);
}

uint64_t sub_100054A68(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  a2,  *(void *)(a1 + 32));
}

void sub_100054A78(uint64_t a1, void *a2)
{
  uint64_t v3 = WFHandoffSourceKey;
  id v4 = a2;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKey:v3]);
  uint64_t v6 = (void *)v5;
  BOOL v7 = (void *)WFWorkflowRunSourceHandoff;
  if (v5) {
    BOOL v7 = (void *)v5;
  }
  id v8 = v7;

  id v9 = (id)objc_claimAutoreleasedReturnValue([v4 objectForKey:WFHandoffWorkflowControllerStateKey]);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100054B24(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 parameters]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"type"]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"webpageURL"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"userInfoURL"]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100054C50;
  void v12[3] = &unk_100066F00;
  id v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v14 = v5;
  id v15 = v9;
  id v13 = v4;
  id v10 = v5;
  id v11 = v4;
  [v8 deserializeUserInfoAtURL:v7 completionHandler:v12];
}

uint64_t sub_100054C50(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[6] + 16LL))(a1[6], a1[4], a1[5], a2);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t WFRunningLifecycleLogObject = getWFRunningLifecycleLogObject(*(void *)&argc, argv, envp);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(WFRunningLifecycleLogObject);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v4,  OS_SIGNPOST_INTERVAL_BEGIN,  0xFFFFFFFFuLL,  "UntilFirstAction",  " enableTelemetry=YES ",  buf,  2u);
  }

  uint64_t v5 = ((uint64_t (*)(void))getWFGeneralLogObject)();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = ((uint64_t (*)(void))getWFGeneralLogObject)();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = v9;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)BOOL v17 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v10,  OS_SIGNPOST_INTERVAL_BEGIN,  v7,  "BackgroundRunnerMain",  "",  v17,  2u);
  }

  unsetenv("TMPDIR");
  unsetenv("HOME");
  unsetenv("CFFIXED_USER_HOME");
  _set_user_dir_suffix([VCBundleIdentifierRunner UTF8String]);
  id v11 = objc_alloc_init(&OBJC_CLASS___WFIsolatedShortcutRunner);
  size_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  uint64_t WFGeneralLogObject = getWFGeneralLogObject([v12 setDelegate:v11]);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(WFGeneralLogObject);
  id v15 = v14;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v15,  OS_SIGNPOST_INTERVAL_END,  v7,  "BackgroundRunnerMain",  "",  v16,  2u);
  }

  [v12 resume];
  exit(1);
}

void sub_100056038(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100056250;
  v26[3] = &unk_100067090;
  id v13 = v11;
  id v29 = v13;
  id v14 = v10;
  uint64_t v15 = *(void *)(a1 + 32);
  id v27 = v14;
  uint64_t v28 = v15;
  uint64_t v16 = objc_retainBlock(v26);
  if ([v9 count])
  {
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue([v14 url]);
    [v17 startAccessingSecurityScopedResource];

    id v25 = 0LL;
    size_t v18 = -[WFToolKitIndexer initWithClientIdentifier:error:]( objc_alloc(&OBJC_CLASS___WFToolKitIndexer),  "initWithClientIdentifier:error:",  @"BackgroundShortcutRunner",  &v25);
    id v19 = v25;
    if (v19)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
      ((void (*)(void *, const __CFString *))v16[2])( v16,  @"ToolKit indexing failed because database failed to initialize");
    }

    else
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000562CC;
      v21[3] = &unk_1000670B8;
      uint64_t v20 = *(void *)(a1 + 40);
      id v23 = *(id *)(a1 + 48);
      uint64_t v24 = v16;
      uint64_t v22 = v18;
      -[WFToolKitIndexer reindexWithRequest:completionHandler:](v22, "reindexWithRequest:completionHandler:", v20, v21);
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
    id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ToolKit indexing failed with result: %@",  v9));
    ((void (*)(void *, id))v16[2])(v16, v19);
  }
}

void sub_100056250(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void (**)(uint64_t))(v3 + 16);
  id v5 = a2;
  v4(v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) url]);
  [v6 stopAccessingSecurityScopedResource];

  id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) stateMachine]);
  [v7 exitWithReason:v5];
}

uint64_t sub_1000562CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[WFShortcutRunnerSandboxExtensionManager sharedManager]( &OBJC_CLASS___WFShortcutRunnerSandboxExtensionManager,  "sharedManager"));
  [v4 resignIssuedExtensionsWithReason:@"done with ToolKit indexing"];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100056344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2 | a3)
  {
    (*(void (**)(void))(v3 + 16))(*(void *)(a1 + 32));
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0LL, v4);
  }

void sub_1000563C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a2 | a3)
  {
    (*(void (**)(void))(v3 + 16))(*(void *)(a1 + 32));
  }

  else
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  22LL,  0LL));
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0LL, v4);
  }

void sub_10005644C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 allItems]);
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000566E0;
    v8[3] = &unk_100066FF0;
    id v9 = *(id *)(a1 + 48);
    +[WFToolKitHelper produceEncodedTypedValuesFromPossibleStates:ofParameter:inAction:completionBlock:]( &OBJC_CLASS___WFToolKitHelper,  "produceEncodedTypedValuesFromPossibleStates:ofParameter:inAction:completionBlock:",  v5,  v6,  v7,  v8);
  }

id sub_100056524(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v4 = v3;
  if (v3 && (objc_opt_isKindOfClass(v3, a2) & 1) == 0)
  {
    uint64_t WFGeneralLogObject = getWFGeneralLogObject();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(WFGeneralLogObject);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315906;
      id v11 = "WFEnforceClass";
      __int16 v12 = 2114;
      id v13 = v4;
      __int16 v14 = 2114;
      id v15 = (id)objc_opt_class(v4);
      __int16 v16 = 2114;
      uint64_t v17 = a2;
      id v8 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_FAULT,  "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.",  (uint8_t *)&v10,  0x2Au);
    }

    id v5 = 0LL;
  }

  else
  {
    id v5 = v4;
  }

  return v5;
}

id sub_100056638(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___WFContentProperty);
  id v5 = sub_100056524(v3, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) propertyName]);
  id v9 = [v7 isEqualToString:v8];

  return v9;
}

id sub_1000566CC(uint64_t a1)
{
  return +[WFToolKitHelper produceEncodedTypedPossibleValuesForContentProperty:completionBlock:]( &OBJC_CLASS___WFToolKitHelper,  "produceEncodedTypedPossibleValuesForContentProperty:completionBlock:",  *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

uint64_t sub_1000566E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id sub_1000566EC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return +[WFToolKitHelper produceEncodedTypedValueFromCollection:forEncodedExpectedType:completionBlock:]( &OBJC_CLASS___WFToolKitHelper,  "produceEncodedTypedValueFromCollection:forEncodedExpectedType:completionBlock:",  a2,  *(void *)(a1 + 32),  *(void *)(a1 + 40));
  }
  else {
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void sub_100056714(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) name]);
    [v3 injectResolvedContent:v5 asVariableWithName:v4 completionHandler:*(void *)(a1 + 48)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForSimulatingHandoffWithActivityType_userInfo_webpageURL_fromSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForSimulatingHandoffWithActivityType:userInfo:webpageURL:fromSource:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_accessSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 accessSpecifier];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allItems(void *a1, const char *a2, ...)
{
  return _[a1 allItems];
}

id objc_msgSend_allProperties(void *a1, const char *a2, ...)
{
  return _[a1 allProperties];
}

id objc_msgSend_allowVariableInjection(void *a1, const char *a2, ...)
{
  return _[a1 allowVariableInjection];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_contentItemClass(void *a1, const char *a2, ...)
{
  return _[a1 contentItemClass];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_createActionFromEncodedToolInvocation_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActionFromEncodedToolInvocation:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_decodeContentPropertyPossibleValuesDefinition_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeContentPropertyPossibleValuesDefinition:error:");
}

id objc_msgSend_decodeDynamicEnumerationDefinition_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeDynamicEnumerationDefinition:error:");
}

id objc_msgSend_decodeSearchStringInEncodedQuery_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeSearchStringInEncodedQuery:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_deserializeUserInfoAtURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeUserInfoAtURL:completionHandler:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exitWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exitWithReason:");
}

id objc_msgSend_fetchToolInvocationSummaryForInvocation_variableSource_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchToolInvocationSummaryForInvocation:variableSource:completionBlock:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileWithURL_options_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileWithURL:options:ofType:");
}

id objc_msgSend_getValuesWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getValuesWithCompletionBlock:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handlingRequestStateWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlingRequestStateWithReason:");
}

id objc_msgSend_if_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "if_firstObjectPassingTest:");
}

id objc_msgSend_initWithActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityType:");
}

id objc_msgSend_initWithClientIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClientIdentifier:error:");
}

id objc_msgSend_initWithName_variableProvider_aggrandizements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:variableProvider:aggrandizements:");
}

id objc_msgSend_injectResolvedContent_asVariableWithName_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "injectResolvedContent:asVariableWithName:completionHandler:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_mappedData(void *a1, const char *a2, ...)
{
  return _[a1 mappedData];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectWithPropertyListObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectWithPropertyListObject:");
}

id objc_msgSend_parameterForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameterForKey:");
}

id objc_msgSend_parameterKey(void *a1, const char *a2, ...)
{
  return _[a1 parameterKey];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _[a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_possibleValues(void *a1, const char *a2, ...)
{
  return _[a1 possibleValues];
}

id objc_msgSend_produceEncodedDisplayRepresentationForRequest_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "produceEncodedDisplayRepresentationForRequest:completionBlock:");
}

id objc_msgSend_produceEncodedTypedValuesFromPossibleStates_ofParameter_inAction_completionBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "produceEncodedTypedValuesFromPossibleStates:ofParameter:inAction:completionBlock:");
}

id objc_msgSend_produceVariableFromEncodedReference_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "produceVariableFromEncodedReference:error:");
}

id objc_msgSend_propertyName(void *a1, const char *a2, ...)
{
  return _[a1 propertyName];
}

id objc_msgSend_proposedSharedTemporaryFileURLForFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proposedSharedTemporaryFileURLForFilename:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_registerHandler_forIncomingRequestsWithAction_scheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerHandler:forIncomingRequestsWithAction:scheme:");
}

id objc_msgSend_reindexWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reindexWithRequest:completionHandler:");
}

id objc_msgSend_requestSandboxExtensionForToolKitIndexingWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSandboxExtensionForToolKitIndexingWithCompletionHandler:");
}

id objc_msgSend_resignIssuedExtensionsWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resignIssuedExtensionsWithReason:");
}

id objc_msgSend_resolveDeferredValueForEncodedStorage_encodedExpectedType_completionBlock_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveDeferredValueForEncodedStorage:encodedExpectedType:completionBlock:");
}

id objc_msgSend_resolveWithVariableSource_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resolveWithVariableSource:completionHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_retrieveContentCollectionWithVariableSource_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retrieveContentCollectionWithVariableSource:completionHandler:");
}

id objc_msgSend_runLinkQuery_valueSet_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runLinkQuery:valueSet:completionBlock:");
}

id objc_msgSend_serializedRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 serializedRepresentation];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_setContent_forVariableWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContent:forVariableWithName:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedAppGroupDirectoryURL(void *a1, const char *a2, ...)
{
  return _[a1 sharedAppGroupDirectoryURL];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return _[a1 stateMachine];
}

id objc_msgSend_stepWithAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stepWithAction:");
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_temporaryFileURLBySerializingUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporaryFileURLBySerializingUserInfo:");
}

id objc_msgSend_typeWithUTType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithUTType:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_valueSetTypeForDefinition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueSetTypeForDefinition:");
}

id objc_msgSend_variableContent(void *a1, const char *a2, ...)
{
  return _[a1 variableContent];
}

id objc_msgSend_wf_isContainedByDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_isContainedByDirectoryAtURL:");
}

id objc_msgSend_wf_loadStatesWithSearchTerm_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_loadStatesWithSearchTerm:completionHandler:");
}

id objc_msgSend_wf_securelyArchivedDataWithRootObject_deletionResponsibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:");
}

id objc_msgSend_wf_securelyUnarchiveObjectWithData_allowedClasses_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:");
}

id objc_msgSend_workflowController(void *a1, const char *a2, ...)
{
  return _[a1 workflowController];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}