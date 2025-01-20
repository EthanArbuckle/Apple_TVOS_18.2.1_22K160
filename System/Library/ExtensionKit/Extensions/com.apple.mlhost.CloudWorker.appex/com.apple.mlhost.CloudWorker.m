void sub_1000047AC()
{
  qword_100038990 = 0x736B736154LL;
  *(void *)algn_100038998 = 0xE500000000000000LL;
}

uint64_t sub_1000047CC(char a1)
{
  return *(void *)&aTasknameextens[8 * a1];
}

BOOL sub_1000047EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_100004804()
{
}

uint64_t sub_100004830()
{
  return sub_1000047CC(*v0);
}

uint64_t sub_100004838@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10000A8E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000485C()
{
  return 0LL;
}

void sub_100004868(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_100004874(uint64_t a1)
{
  unint64_t v2 = sub_10000A1F4();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000489C(uint64_t a1)
{
  unint64_t v2 = sub_10000A1F4();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000048C4(void *a1)
{
  v3 = v1;
  uint64_t v5 = sub_100007B74(&qword_100038680);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A1D0(a1, v9);
  unint64_t v11 = sub_10000A1F4();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for TaskRecord.CodingKeys,  &type metadata for TaskRecord.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  LOBYTE(v24) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v24, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    LOBYTE(v24) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v24, v5);
    __int128 v24 = *((_OWORD *)v3 + 2);
    char v25 = 2;
    unint64_t v16 = sub_10000A29C();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v24, &v25, v5, &type metadata for Data, v16);
    v17 = (int *)type metadata accessor for TaskRecord(0LL);
    uint64_t v18 = (uint64_t)v3 + v17[7];
    LOBYTE(v24) = 3;
    uint64_t v19 = type metadata accessor for Date(0LL);
    uint64_t v20 = sub_100009FBC( &qword_100038690,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v18, &v24, v5, v19, v20);
    uint64_t v21 = (uint64_t)v3 + v17[8];
    LOBYTE(v24) = 4;
    KeyedEncodingContainer.encode<A>(_:forKey:)(v21, &v24, v5, v19, v20);
    uint64_t v22 = (uint64_t)v3 + v17[9];
    LOBYTE(v24) = 5;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v22, &v24, v5, v19, v20);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100004AF8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v44 = a2;
  sub_100007B74(&qword_1000383B0);
  ((void (*)(void))__chkstk_darwin)();
  v45 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v46 = (uint64_t *)((char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v6);
  v48 = (char *)&v41 - v8;
  uint64_t v49 = sub_100007B74(&qword_100038660);
  uint64_t v47 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for TaskRecord(0LL);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t *)((char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v15 = *(void (**)(void))(v5 + 56);
  v51 = (char *)v14 + *(int *)(v12 + 36);
  v15();
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  v50 = a1;
  sub_10000A1D0(a1, v16);
  unint64_t v18 = sub_10000A1F4();
  uint64_t v19 = v52;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for TaskRecord.CodingKeys,  &type metadata for TaskRecord.CodingKeys,  v18,  v16,  v17);
  if (v19)
  {
    uint64_t v24 = (uint64_t)v51;
    sub_10000A238(v50);
    return sub_100008880(v24, &qword_1000383B0);
  }

  else
  {
    uint64_t v20 = v47;
    uint64_t v21 = v48;
    uint64_t v42 = v11;
    uint64_t v43 = v5;
    v52 = v14;
    LOBYTE(v53) = 0;
    uint64_t v22 = v49;
    uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)(&v53, v49);
    uint64_t v25 = (uint64_t)v52;
    uint64_t *v52 = v23;
    *(void *)(v25 + 8) = v26;
    LOBYTE(v53) = 1;
    *(void *)(v25 + 16) = KeyedDecodingContainer.decode(_:forKey:)(&v53, v22);
    *(void *)(v25 + 24) = v27;
    char v54 = 2;
    unint64_t v28 = sub_10000A258();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v53, &type metadata for Data, &v54, v22, &type metadata for Data, v28);
    uint64_t v29 = v20;
    *(_OWORD *)(v25 + 32) = v53;
    LOBYTE(v53) = 3;
    uint64_t v30 = sub_100009FBC( &qword_100038678,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    v31 = v21;
    v32 = v21;
    uint64_t v33 = v4;
    uint64_t v34 = v30;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v32, v4, &v53, v22, v4, v30);
    uint64_t v41 = 0LL;
    uint64_t v35 = v42;
    uint64_t v36 = v25 + *(int *)(v42 + 28);
    v48 = *(char **)(v43 + 32);
    ((void (*)(uint64_t, void *, uint64_t))v48)(v36, v31, v33);
    LOBYTE(v53) = 4;
    v37 = v46;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v46, v33, &v53, v22, v33, v34);
    ((void (*)(uint64_t, void *, uint64_t))v48)(v25 + *(int *)(v35 + 32), v37, v33);
    LOBYTE(v53) = 5;
    uint64_t v38 = (uint64_t)v45;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v33, &v53, v22, v33, v34);
    uint64_t v39 = (uint64_t)v51;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v22);
    sub_10000863C(v38, v39);
    sub_1000087B8(v25, v44, type metadata accessor for TaskRecord);
    sub_10000A238(v50);
    return sub_1000087FC(v25, type metadata accessor for TaskRecord);
  }
}

uint64_t sub_100005018@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100004AF8(a1, a2);
}

uint64_t sub_10000502C(void *a1)
{
  return sub_1000048C4(a1);
}

uint64_t sub_100005040@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007B74(&qword_1000383B0);
  uint64_t v5 = __chkstk_darwin(v4);
  v110 = (char *)&v102 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v102 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v102 - v10;
  uint64_t v12 = type metadata accessor for Date(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  v111 = (char *)&v102 - v17;
  uint64_t v18 = type metadata accessor for TaskRecord(0LL);
  uint64_t v114 = *(void *)(v18 - 8);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v21 = (uint64_t *)((char *)&v102 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v115 = v19;
  uint64_t v22 = *(uint64_t (**)(void))(v13 + 56);
  uint64_t v113 = (uint64_t)v21 + *(int *)(v19 + 36);
  uint64_t v23 = v22();
  id v116 = a1;
  uint64_t v24 = CKRecord.recordType.getter(v23);
  uint64_t v26 = v25;
  if (qword_100038380 != -1) {
    swift_once(&qword_100038380, sub_1000047AC);
  }
  if (v24 == qword_100038990 && v26 == *(void *)algn_100038998)
  {
    swift_bridgeObjectRelease(v26);
  }

  else
  {
    char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v26, qword_100038990, *(void *)algn_100038998, 0LL);
    swift_bridgeObjectRelease(v26);
    if ((v27 & 1) == 0)
    {
      if (qword_100038398 != -1) {
        swift_once(&qword_100038398, sub_10000AF84);
      }
      uint64_t v75 = type metadata accessor for Logger(0LL);
      sub_100007BC8(v75, (uint64_t)qword_1000389C0);
      id v76 = v116;
      v77 = (os_log_s *)Logger.logObject.getter();
      os_log_type_t v78 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v77, v78))
      {
        v79 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v80 = swift_slowAlloc(32LL, -1LL);
        uint64_t v117 = v80;
        *(_DWORD *)v79 = 136315138;
        uint64_t v81 = CKRecord.recordType.getter(v80);
        unint64_t v83 = v82;
        uint64_t v119 = sub_100007F10(v81, v82, &v117);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v119, &v120);

        swift_bridgeObjectRelease(v83);
        _os_log_impl((void *)&_mh_execute_header, v77, v78, "Invalid recordType: %s", v79, 0xCu);
        swift_arrayDestroy(v80, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v80, -1LL, -1LL);
        swift_slowDealloc(v79, -1LL, -1LL);
      }

      else
      {
      }

      goto LABEL_37;
    }
  }

  uint64_t v112 = a2;
  id v28 = [v116 values];
  uint64_t v29 = sub_100007B74(&qword_100038418);
  uint64_t v30 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v28,  &type metadata for String,  v29,  &protocol witness table for String);

  if (!*(void *)(v30 + 16) || (unint64_t v31 = sub_100008550(0x656D614E6B736174LL, 0xE800000000000000LL), (v32 & 1) == 0))
  {
    swift_bridgeObjectRelease(v30);
    goto LABEL_25;
  }

  uint64_t v33 = *(void *)(*(void *)(v30 + 56) + 8 * v31);
  swift_unknownObjectRetain(v33, v32);
  swift_bridgeObjectRelease(v30);
  uint64_t v119 = v33;
  if ((swift_dynamicCast(&v117, &v119, v29, &type metadata for String, 6LL) & 1) == 0)
  {
LABEL_25:
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v70 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v70, (uint64_t)qword_1000389C0);
    v71 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v72 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v71, v72)) {
      goto LABEL_30;
    }
    v73 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v73 = 0;
    v74 = "Failed at parsing taskName";
LABEL_29:
    _os_log_impl((void *)&_mh_execute_header, v71, v72, v74, v73, 2u);
    swift_slowDealloc(v73, -1LL, -1LL);
    goto LABEL_30;
  }

  uint64_t v107 = v117;
  v108 = v22;
  unint64_t v34 = v118;
  id v35 = [v116 values];
  uint64_t v36 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v35,  &type metadata for String,  v29,  &protocol witness table for String);

  if (!*(void *)(v36 + 16))
  {
    unint64_t v86 = v34;
LABEL_40:
    swift_bridgeObjectRelease(v86);
    uint64_t v87 = v36;
LABEL_41:
    swift_bridgeObjectRelease(v87);
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v88 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v88, (uint64_t)qword_1000389C0);
    v71 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v72 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v71, v72)) {
      goto LABEL_30;
    }
    v73 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v73 = 0;
    v74 = "Failed at parsing extensionID";
    goto LABEL_29;
  }

  unint64_t v109 = v34;
  unint64_t v37 = sub_100008550(0x6F69736E65747865LL, 0xEB0000000044496ELL);
  if ((v38 & 1) == 0)
  {
    unint64_t v86 = v109;
    goto LABEL_40;
  }

  uint64_t v39 = *(void *)(*(void *)(v36 + 56) + 8 * v37);
  swift_unknownObjectRetain(v39, v38);
  swift_bridgeObjectRelease(v36);
  uint64_t v119 = v39;
  if ((swift_dynamicCast(&v117, &v119, v29, &type metadata for String, 6LL) & 1) == 0)
  {
    uint64_t v87 = v109;
    goto LABEL_41;
  }

  unint64_t v40 = v118;
  uint64_t v106 = v117;
  id v41 = [v116 values];
  uint64_t v42 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v41,  &type metadata for String,  v29,  &protocol witness table for String);

  if (!*(void *)(v42 + 16) || (unint64_t v43 = sub_100008550(0x666E6F436B736174LL, 0xEE00617461446769LL), (v44 & 1) == 0))
  {
    swift_bridgeObjectRelease(v109);
    swift_bridgeObjectRelease(v42);
    unint64_t v89 = v40;
LABEL_47:
    swift_bridgeObjectRelease(v89);
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v90 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v90, (uint64_t)qword_1000389C0);
    v71 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v72 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v71, v72)) {
      goto LABEL_30;
    }
    v73 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v73 = 0;
    v74 = "Failed at parsing taskConfigData";
    goto LABEL_29;
  }

  uint64_t v45 = *(void *)(*(void *)(v42 + 56) + 8 * v43);
  swift_unknownObjectRetain(v45, v44);
  swift_bridgeObjectRelease(v42);
  uint64_t v119 = v45;
  if ((swift_dynamicCast(&v117, &v119, v29, &type metadata for Data, 6LL) & 1) == 0)
  {
    swift_bridgeObjectRelease(v40);
    unint64_t v89 = v109;
    goto LABEL_47;
  }

  uint64_t v104 = v117;
  unint64_t v105 = v118;
  id v46 = [v116 values];
  uint64_t v47 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v46,  &type metadata for String,  v29,  &protocol witness table for String);

  if (!*(void *)(v47 + 16) || (unint64_t v48 = sub_100008550(0x7461447472617473LL, 0xE900000000000065LL), (v49 & 1) == 0))
  {
    swift_bridgeObjectRelease(v47);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v108)(v11, 1LL, 1LL, v12);
    goto LABEL_53;
  }

  uint64_t v50 = *(void *)(*(void *)(v47 + 56) + 8 * v48);
  swift_unknownObjectRetain(v50, v49);
  swift_bridgeObjectRelease(v47);
  uint64_t v117 = v50;
  int v51 = swift_dynamicCast(v11, &v117, v29, v12, 6LL);
  ((void (*)(char *, void, uint64_t, uint64_t))v108)(v11, v51 ^ 1u, 1LL, v12);
  v52 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v52(v11, 1LL, v12) == 1)
  {
LABEL_53:
    swift_bridgeObjectRelease(v40);
    swift_bridgeObjectRelease(v109);
    sub_100008880((uint64_t)v11, &qword_1000383B0);
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v91 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v91, (uint64_t)qword_1000389C0);
    v71 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v92 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v71, v92))
    {
      v93 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v93 = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, v92, "Failed at parsing startDate", v93, 2u);
      swift_slowDealloc(v93, -1LL, -1LL);

      sub_1000085B4(v104, v105);
      a2 = v112;
      goto LABEL_37;
    }

    sub_1000085B4(v104, v105);
LABEL_30:

    a2 = v112;
LABEL_37:
    uint64_t v84 = v114;
    sub_100008880(v113, &qword_1000383B0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v84 + 56))(a2, 1LL, 1LL, v115);
  }

  v103 = (uint64_t (*)(char *, uint64_t, uint64_t))v52;
  __int128 v53 = v11;
  char v54 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v54(v111, v53, v12);
  id v55 = [v116 values];
  uint64_t v56 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v55,  &type metadata for String,  v29,  &protocol witness table for String);

  if (!*(void *)(v56 + 16) || (unint64_t v57 = sub_100008550(0x65746144646E65LL, 0xE700000000000000LL), (v58 & 1) == 0))
  {
    swift_bridgeObjectRelease(v56);
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v108)(v9, 1LL, 1LL, v12);
    uint64_t v62 = v109;
    goto LABEL_59;
  }

  uint64_t v59 = *(void *)(*(void *)(v56 + 56) + 8 * v57);
  swift_unknownObjectRetain(v59, v58);
  swift_bridgeObjectRelease(v56);
  uint64_t v117 = v59;
  int v60 = swift_dynamicCast(v9, &v117, v29, v12, 6LL);
  ((void (*)(char *, void, uint64_t, uint64_t))v108)(v9, v60 ^ 1u, 1LL, v12);
  int v61 = v103(v9, 1LL, v12);
  uint64_t v62 = v109;
  if (v61 == 1)
  {
LABEL_59:
    swift_bridgeObjectRelease(v40);
    swift_bridgeObjectRelease(v62);
    sub_100008880((uint64_t)v9, &qword_1000383B0);
    a2 = v112;
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v94 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v94, (uint64_t)qword_1000389C0);
    v95 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v96 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v95, v96))
    {
      v97 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)v97 = 0;
      _os_log_impl((void *)&_mh_execute_header, v95, v96, "Failed at parsing endDate", v97, 2u);
      v98 = v97;
      a2 = v112;
      swift_slowDealloc(v98, -1LL, -1LL);
    }

    sub_1000085B4(v104, v105);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v111, v12);
    goto LABEL_37;
  }

  v54(v16, v9, v12);
  *uint64_t v21 = v107;
  v21[1] = v62;
  unint64_t v63 = v105;
  v21[2] = v106;
  v21[3] = v40;
  uint64_t v64 = v104;
  v21[4] = v104;
  v21[5] = v63;
  uint64_t v65 = v115;
  v66 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v66((char *)v21 + *(int *)(v115 + 28), v111, v12);
  v66((char *)v21 + *(int *)(v65 + 32), v16, v12);
  sub_1000085F8(v64, v63);
  id v67 = [v116 creationDate];
  if (v67)
  {
    v68 = v67;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v69 = 0LL;
  }

  else
  {
    uint64_t v69 = 1LL;
  }

  sub_1000085B4(v104, v105);
  v99 = *(void (**)(char *, uint64_t))(v13 + 8);
  v99(v16, v12);
  v99(v111, v12);
  uint64_t v100 = (uint64_t)v110;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v108)(v110, v69, 1LL, v12);
  sub_10000863C(v100, v113);
  uint64_t v101 = v112;
  sub_1000087B8((uint64_t)v21, v112, type metadata accessor for TaskRecord);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v114 + 56))(v101, 0LL, 1LL, v115);
  return sub_1000087FC((uint64_t)v21, type metadata accessor for TaskRecord);
}

void sub_100005D0C()
{
  algn_1000389A8[7] = -18;
}

uint64_t sub_100005D3C(char a1)
{
  return *(void *)&aTasknameextens_0[8 * a1];
}

uint64_t sub_100005D5C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100007B74(&qword_1000386A8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A1D0(a1, v9);
  unint64_t v11 = sub_10000A2E0();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for TaskParametersRecord.CodingKeys,  &type metadata for TaskParametersRecord.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  LOBYTE(v23) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v23, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    LOBYTE(v23) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v23, v5);
    __int128 v23 = *((_OWORD *)v3 + 2);
    char v22 = 2;
    unint64_t v16 = sub_10000A29C();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v23, &v22, v5, &type metadata for Data, v16);
    uint64_t v17 = (uint64_t)v3 + *(int *)(type metadata accessor for TaskParametersRecord(0LL) + 28);
    LOBYTE(v23) = 3;
    uint64_t v18 = type metadata accessor for Date(0LL);
    uint64_t v19 = sub_100009FBC( &qword_100038690,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v17, &v23, v5, v18, v19);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100005F18@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = sub_100007B74(&qword_1000383B0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = sub_100007B74(&qword_100038698);
  uint64_t v6 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TaskParametersRecord(0LL);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = (uint64_t)&v12[*(int *)(v10 + 28)];
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL);
  uint64_t v32 = v13;
  v15(v13, 1LL, 1LL, v14);
  uint64_t v17 = a1[3];
  uint64_t v16 = a1[4];
  sub_10000A1D0(a1, v17);
  unint64_t v18 = sub_10000A2E0();
  unint64_t v31 = v8;
  uint64_t v19 = v33;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for TaskParametersRecord.CodingKeys,  &type metadata for TaskParametersRecord.CodingKeys,  v18,  v17,  v16);
  if (v19)
  {
    sub_10000A238(a1);
    return sub_100008880(v32, &qword_1000383B0);
  }

  else
  {
    uint64_t v20 = a1;
    uint64_t v21 = (uint64_t)v5;
    LOBYTE(v34) = 0;
    uint64_t v22 = v30;
    *(void *)uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v30);
    *((void *)v12 + 1) = v23;
    LOBYTE(v34) = 1;
    *((void *)v12 + 2) = KeyedDecodingContainer.decode(_:forKey:)(&v34, v22);
    *((void *)v12 + 3) = v24;
    char v35 = 2;
    unint64_t v25 = sub_10000A258();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v34, &type metadata for Data, &v35, v22, &type metadata for Data, v25);
    *((_OWORD *)v12 + 2) = v34;
    LOBYTE(v34) = 3;
    uint64_t v26 = sub_100009FBC( &qword_100038678,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v14, &v34, v22, v14, v26);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v31, v22);
    sub_10000863C(v21, v32);
    sub_1000087B8(0LL, v29, type metadata accessor for TaskParametersRecord);
    sub_10000A238(v20);
    return sub_1000087FC(0LL, type metadata accessor for TaskParametersRecord);
  }

uint64_t sub_100006268()
{
  return sub_100005D3C(*v0);
}

uint64_t sub_100006270@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10000AB7C(a1, a2);
  *a3 = result;
  return result;
}

void sub_100006294(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1000062A0(uint64_t a1)
{
  unint64_t v2 = sub_10000A2E0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000062C8(uint64_t a1)
{
  unint64_t v2 = sub_10000A2E0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000062F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100005F18(a1, a2);
}

uint64_t sub_100006304(void *a1)
{
  return sub_100005D5C(a1);
}

uint64_t sub_100006318@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007B74(&qword_1000383B0);
  __chkstk_darwin(v4);
  os_log_type_t v72 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for TaskParametersRecord(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (uint64_t *)((char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = (uint64_t)v10 + *(int *)(v8 + 28);
  uint64_t v12 = type metadata accessor for Date(0LL);
  uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL);
  uint64_t v14 = v13(v11, 1LL, 1LL, v12);
  uint64_t v15 = CKRecord.recordType.getter(v14);
  uint64_t v17 = v16;
  if (qword_100038388 != -1) {
    swift_once(&qword_100038388, sub_100005D0C);
  }
  if (v15 == qword_1000389A0 && v17 == *(void *)algn_1000389A8)
  {
    swift_bridgeObjectRelease(v17);
  }

  else
  {
    char v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, qword_1000389A0, *(void *)algn_1000389A8, 0LL);
    swift_bridgeObjectRelease(v17);
    if ((v18 & 1) == 0)
    {
      if (qword_100038398 != -1) {
        swift_once(&qword_100038398, sub_10000AF84);
      }
      uint64_t v53 = type metadata accessor for Logger(0LL);
      sub_100007BC8(v53, (uint64_t)qword_1000389C0);
      id v54 = a1;
      id v55 = (os_log_s *)Logger.logObject.getter();
      os_log_type_t v56 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v55, v56))
      {
        unint64_t v57 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v58 = swift_slowAlloc(32LL, -1LL);
        uint64_t v74 = v11;
        uint64_t v75 = v58;
        uint64_t v73 = v7;
        *(_DWORD *)unint64_t v57 = 136315138;
        uint64_t v59 = CKRecord.recordType.getter(v58);
        unint64_t v61 = v60;
        uint64_t v77 = sub_100007F10(v59, v60, &v75);
        uint64_t v7 = v73;
        uint64_t v11 = v74;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, &v78);

        swift_bridgeObjectRelease(v61);
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "Invalid recordType: %s", v57, 0xCu);
        swift_arrayDestroy(v58, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v58, -1LL, -1LL);
        swift_slowDealloc(v57, -1LL, -1LL);
      }

      else
      {
      }

      uint64_t v38 = a2;
      goto LABEL_31;
    }
  }

  uint64_t v73 = v7;
  uint64_t v74 = v11;
  uint64_t v19 = a2;
  id v20 = [a1 values];
  uint64_t v21 = sub_100007B74(&qword_100038418);
  uint64_t v22 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v20,  &type metadata for String,  v21,  &protocol witness table for String);

  if (!*(void *)(v22 + 16) || (unint64_t v23 = sub_100008550(0x656D614E6B736174LL, 0xE800000000000000LL), (v24 & 1) == 0))
  {
    swift_bridgeObjectRelease(v22);
    goto LABEL_19;
  }

  uint64_t v25 = *(void *)(*(void *)(v22 + 56) + 8 * v23);
  swift_unknownObjectRetain(v25, v24);
  swift_bridgeObjectRelease(v22);
  uint64_t v77 = v25;
  if ((swift_dynamicCast(&v75, &v77, v21, &type metadata for String, 6LL) & 1) == 0)
  {
LABEL_19:
    uint64_t v7 = v73;
    uint64_t v38 = a2;
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v47 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v47, (uint64_t)qword_1000389C0);
    unint64_t v48 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v49 = static os_log_type_t.debug.getter();
    BOOL v50 = os_log_type_enabled(v48, v49);
    uint64_t v11 = v74;
    if (!v50) {
      goto LABEL_24;
    }
    int v51 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)int v51 = 0;
    v52 = "Failed at parsing taskName";
    goto LABEL_23;
  }

  uint64_t v71 = v75;
  unint64_t v26 = v76;
  id v27 = [a1 values];
  uint64_t v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v27,  &type metadata for String,  v21,  &protocol witness table for String);

  if (!*(void *)(v28 + 16) || (unint64_t v29 = sub_100008550(0x6F69736E65747865LL, 0xEB0000000044496ELL), (v30 & 1) == 0))
  {
    swift_bridgeObjectRelease(v26);
    uint64_t v63 = v28;
LABEL_33:
    swift_bridgeObjectRelease(v63);
    uint64_t v7 = v73;
    uint64_t v38 = v19;
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v64 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v64, (uint64_t)qword_1000389C0);
    unint64_t v48 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v49 = static os_log_type_t.debug.getter();
    BOOL v65 = os_log_type_enabled(v48, v49);
    uint64_t v11 = v74;
    if (!v65) {
      goto LABEL_24;
    }
    int v51 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)int v51 = 0;
    v52 = "Failed at parsing extensionID";
    goto LABEL_23;
  }

  uint64_t v31 = *(void *)(*(void *)(v28 + 56) + 8 * v29);
  swift_unknownObjectRetain(v31, v30);
  swift_bridgeObjectRelease(v28);
  uint64_t v77 = v31;
  if ((swift_dynamicCast(&v75, &v77, v21, &type metadata for String, 6LL) & 1) == 0)
  {
    uint64_t v63 = v26;
    goto LABEL_33;
  }

  uint64_t v69 = v75;
  unint64_t v70 = v76;
  id v32 = [a1 values];
  uint64_t v33 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v32,  &type metadata for String,  v21,  &protocol witness table for String);

  if (!*(void *)(v33 + 16) || (unint64_t v34 = sub_100008550(0x6574656D61726170LL, 0xEE00617461447372LL), (v35 & 1) == 0))
  {
    swift_bridgeObjectRelease(v26);
    swift_bridgeObjectRelease(v33);
    swift_bridgeObjectRelease(v70);
    uint64_t v38 = v19;
LABEL_39:
    uint64_t v7 = v73;
    uint64_t v11 = v74;
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v66 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v66, (uint64_t)qword_1000389C0);
    unint64_t v48 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v49 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v48, v49)) {
      goto LABEL_24;
    }
    int v51 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)int v51 = 0;
    v52 = "Failed at parsing parametersData";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v48, v49, v52, v51, 2u);
    swift_slowDealloc(v51, -1LL, -1LL);
LABEL_24:

LABEL_31:
    sub_100008880(v11, &qword_1000383B0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v38, 1LL, 1LL, v6);
  }

  uint64_t v36 = *(void *)(*(void *)(v33 + 56) + 8 * v34);
  swift_unknownObjectRetain(v36, v35);
  swift_bridgeObjectRelease(v33);
  uint64_t v77 = v36;
  char v37 = swift_dynamicCast(&v75, &v77, v21, &type metadata for Data, 6LL);
  uint64_t v38 = v19;
  if ((v37 & 1) == 0)
  {
    swift_bridgeObjectRelease(v70);
    swift_bridgeObjectRelease(v26);
    goto LABEL_39;
  }

  uint64_t v68 = v19;
  uint64_t v39 = v75;
  unint64_t v40 = v76;
  *uint64_t v10 = v71;
  v10[1] = v26;
  uint64_t v41 = v70;
  v10[2] = v69;
  v10[3] = v41;
  v10[4] = v39;
  v10[5] = v40;
  sub_1000085F8(v39, v40);
  id v42 = [a1 creationDate];
  uint64_t v43 = v74;
  if (v42)
  {
    uint64_t v44 = v42;
    uint64_t v45 = (uint64_t)v72;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    sub_1000085B4(v39, v40);
    uint64_t v46 = 0LL;
  }

  else
  {

    sub_1000085B4(v39, v40);
    uint64_t v46 = 1LL;
    uint64_t v45 = (uint64_t)v72;
  }

  v13(v45, v46, 1LL, v12);
  sub_10000863C(v45, v43);
  uint64_t v67 = v68;
  sub_1000087B8((uint64_t)v10, v68, type metadata accessor for TaskParametersRecord);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v73 + 56))(v67, 0LL, 1LL, v6);
  return sub_1000087FC((uint64_t)v10, type metadata accessor for TaskParametersRecord);
}

void sub_100006B58()
{
  algn_1000389B8[5] = 0;
  *(_WORD *)&algn_1000389B8[6] = -5120;
}

uint64_t sub_100006B84(char a1)
{
  return *(void *)&aTasknameextens_1[8 * a1];
}

uint64_t sub_100006BA4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100007B74(&qword_1000386C0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A1D0(a1, v9);
  unint64_t v11 = sub_10000A324();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for TaskPayloadRecord.CodingKeys,  &type metadata for TaskPayloadRecord.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v26 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v26, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    char v25 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v25, v5);
    uint64_t v16 = v3[4];
    uint64_t v17 = v3[5];
    char v24 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v24, v5);
    char v18 = (char *)v3 + *(int *)(type metadata accessor for TaskPayloadRecord(0LL) + 28);
    char v23 = 3;
    uint64_t v19 = type metadata accessor for Date(0LL);
    uint64_t v20 = sub_100009FBC( &qword_100038690,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v18, &v23, v5, v19, v20);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100006D48@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v29 = a2;
  uint64_t v3 = sub_100007B74(&qword_1000383B0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v30 = sub_100007B74(&qword_1000386B0);
  uint64_t v6 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TaskPayloadRecord(0LL);
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (uint64_t *)((char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v13 = (uint64_t)v12 + *(int *)(v10 + 28);
  uint64_t v14 = type metadata accessor for Date(0LL);
  uint64_t v15 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL);
  uint64_t v32 = v13;
  v15(v13, 1LL, 1LL, v14);
  uint64_t v17 = a1[3];
  uint64_t v16 = a1[4];
  sub_10000A1D0(a1, v17);
  unint64_t v18 = sub_10000A324();
  uint64_t v31 = v8;
  uint64_t v19 = v33;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for TaskPayloadRecord.CodingKeys,  &type metadata for TaskPayloadRecord.CodingKeys,  v18,  v17,  v16);
  if (v19)
  {
    sub_10000A238(a1);
    return sub_100008880(v32, &qword_1000383B0);
  }

  else
  {
    uint64_t v20 = a1;
    uint64_t v21 = (uint64_t)v5;
    char v37 = 0;
    uint64_t v22 = v30;
    *uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(&v37, v30);
    v12[1] = v23;
    char v36 = 1;
    v12[2] = KeyedDecodingContainer.decode(_:forKey:)(&v36, v22);
    v12[3] = v24;
    char v35 = 2;
    v12[4] = KeyedDecodingContainer.decode(_:forKey:)(&v35, v22);
    v12[5] = v25;
    char v34 = 3;
    uint64_t v26 = sub_100009FBC( &qword_100038678,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v14, &v34, v22, v14, v26);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v31, v22);
    sub_10000863C(v21, v32);
    sub_1000087B8((uint64_t)v12, v29, type metadata accessor for TaskPayloadRecord);
    sub_10000A238(v20);
    return sub_1000087FC((uint64_t)v12, type metadata accessor for TaskPayloadRecord);
  }

Swift::Int sub_10000707C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_1000070C0(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100007100()
{
  return sub_100006B84(*v0);
}

uint64_t sub_100007108@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10000AD54(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000712C(uint64_t a1)
{
  unint64_t v2 = sub_10000A324();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100007154(uint64_t a1)
{
  unint64_t v2 = sub_10000A324();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000717C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100006D48(a1, a2);
}

uint64_t sub_100007190(void *a1)
{
  return sub_100006BA4(a1);
}

uint64_t sub_1000071A4@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007B74(&qword_1000383B0);
  __chkstk_darwin(v4);
  uint64_t v90 = (char *)&v83 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_100007B74(&qword_100038428);
  __chkstk_darwin(v6);
  os_log_type_t v92 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v93 = v8;
  uint64_t v94 = v9;
  uint64_t v10 = __chkstk_darwin(v8);
  __chkstk_darwin(v10);
  uint64_t v91 = (char *)&v83 - v11;
  uint64_t v12 = (void *)type metadata accessor for TaskPayloadRecord(0LL);
  uint64_t v13 = *(v12 - 1);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (Swift::String *)((char *)&v83 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v17 = (uint64_t)v16 + *(int *)(v14 + 28);
  uint64_t v18 = type metadata accessor for Date(0LL);
  unint64_t v89 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL);
  uint64_t v19 = v89(v17, 1LL, 1LL, v18);
  uint64_t v20 = CKRecord.recordType.getter(v19);
  uint64_t v22 = v21;
  if (qword_100038390 != -1) {
    swift_once(&qword_100038390, sub_100006B58);
  }
  if (v20 == qword_1000389B0 && v22 == *(void *)algn_1000389B8)
  {
    swift_bridgeObjectRelease(v22);
  }

  else
  {
    char v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v22, qword_1000389B0, *(void *)algn_1000389B8, 0LL);
    swift_bridgeObjectRelease(v22);
    if ((v23 & 1) == 0)
    {
      if (qword_100038398 != -1) {
        swift_once(&qword_100038398, sub_10000AF84);
      }
      uint64_t v60 = type metadata accessor for Logger(0LL);
      sub_100007BC8(v60, (uint64_t)qword_1000389C0);
      id v61 = a1;
      uint64_t v62 = (os_log_s *)Logger.logObject.getter();
      os_log_type_t v63 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v62, v63))
      {
        uint64_t v64 = swift_slowAlloc(12LL, -1LL);
        v95 = v12;
        BOOL v65 = (uint8_t *)v64;
        uint64_t v66 = swift_slowAlloc(32LL, -1LL);
        uint64_t v94 = v17;
        uint64_t v67 = v13;
        uint64_t v68 = v66;
        uint64_t v96 = v66;
        *(_DWORD *)BOOL v65 = 136315138;
        uint64_t v69 = CKRecord.recordType.getter(v66);
        unint64_t v71 = v70;
        uint64_t v98 = sub_100007F10(v69, v70, &v96);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99);

        swift_bridgeObjectRelease(v71);
        _os_log_impl((void *)&_mh_execute_header, v62, v63, "Invalid recordType: %s", v65, 0xCu);
        swift_arrayDestroy(v68, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v72 = v68;
        uint64_t v13 = v67;
        uint64_t v17 = v94;
        swift_slowDealloc(v72, -1LL, -1LL);
        uint64_t v73 = v65;
        uint64_t v12 = v95;
        swift_slowDealloc(v73, -1LL, -1LL);
      }

      else
      {
      }

      goto LABEL_33;
    }
  }

  v95 = a1;
  id v24 = [a1 values];
  uint64_t v25 = sub_100007B74(&qword_100038418);
  uint64_t v26 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v24,  &type metadata for String,  v25,  &protocol witness table for String);

  if (!*(void *)(v26 + 16) || (unint64_t v27 = sub_100008550(0x656D614E6B736174LL, 0xE800000000000000LL), (v28 & 1) == 0))
  {
    swift_bridgeObjectRelease(v26);
    goto LABEL_21;
  }

  uint64_t v29 = *(void *)(*(void *)(v26 + 56) + 8 * v27);
  swift_unknownObjectRetain(v29, v28);
  swift_bridgeObjectRelease(v26);
  uint64_t v98 = v29;
  if ((swift_dynamicCast(&v96, &v98, v25, &type metadata for String, 6LL) & 1) == 0)
  {
LABEL_21:
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v55 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v55, (uint64_t)qword_1000389C0);
    os_log_type_t v56 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v57 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v56, v57)) {
      goto LABEL_26;
    }
    uint64_t v58 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v58 = 0;
    uint64_t v59 = "Failed at parsing taskName";
    goto LABEL_25;
  }

  uint64_t v87 = v96;
  uint64_t v88 = v97;
  id v30 = [v95 values];
  uint64_t v31 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v30,  &type metadata for String,  v25,  &protocol witness table for String);

  if (!*(void *)(v31 + 16) || (unint64_t v32 = sub_100008550(0x6F69736E65747865LL, 0xEB0000000044496ELL), (v33 & 1) == 0))
  {
    swift_bridgeObjectRelease(v88);
    uint64_t v75 = v31;
LABEL_35:
    swift_bridgeObjectRelease(v75);
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v76 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v76, (uint64_t)qword_1000389C0);
    os_log_type_t v56 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v57 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v56, v57)) {
      goto LABEL_26;
    }
    uint64_t v58 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v58 = 0;
    uint64_t v59 = "Failed at parsing extensionID";
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v56, v57, v59, v58, 2u);
    swift_slowDealloc(v58, -1LL, -1LL);
LABEL_26:

LABEL_33:
    sub_100008880(v17, &qword_1000383B0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void *))(v13 + 56))(a2, 1LL, 1LL, v12);
  }

  uint64_t v34 = *(void *)(*(void *)(v31 + 56) + 8 * v32);
  swift_unknownObjectRetain(v34, v33);
  swift_bridgeObjectRelease(v31);
  uint64_t v98 = v34;
  if ((swift_dynamicCast(&v96, &v98, v25, &type metadata for String, 6LL) & 1) == 0)
  {
    uint64_t v75 = (uint64_t)v88;
    goto LABEL_35;
  }

  uint64_t v85 = v96;
  unint64_t v86 = v97;
  id v35 = [v95 values];
  uint64_t v36 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v35,  &type metadata for String,  v25,  &protocol witness table for String);

  if (!*(void *)(v36 + 16) || (unint64_t v37 = sub_100008550(0x617474416B736174LL, 0xEE00746E656D6863LL), (v38 & 1) == 0))
  {
    swift_bridgeObjectRelease(v88);
    swift_bridgeObjectRelease(v36);
    uint64_t v77 = v86;
LABEL_41:
    swift_bridgeObjectRelease(v77);
    id v44 = v95;
LABEL_42:
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v78 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v78, (uint64_t)qword_1000389C0);
    v79 = (os_log_s *)Logger.logObject.getter();
    os_log_type_t v80 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v79, v80))
    {
      uint64_t v81 = v44;
      unint64_t v82 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v82 = 0;
      _os_log_impl((void *)&_mh_execute_header, v79, v80, "Failed at parsing taskAttachment", v82, 2u);
      swift_slowDealloc(v82, -1LL, -1LL);
    }

    else
    {
    }

    goto LABEL_33;
  }

  uint64_t v39 = *(void *)(*(void *)(v36 + 56) + 8 * v37);
  swift_unknownObjectRetain(v39, v38);
  swift_bridgeObjectRelease(v36);
  uint64_t v40 = objc_opt_self(&OBJC_CLASS___CKAsset);
  uint64_t v41 = (void *)swift_dynamicCastObjCClass(v39, v40);
  id v42 = v88;
  if (!v41)
  {
    swift_unknownObjectRelease(v39);
    swift_bridgeObjectRelease(v86);
    uint64_t v77 = v42;
    goto LABEL_41;
  }

  uint64_t v84 = v39;
  id v43 = [v41 fileURL];
  id v44 = v95;
  if (!v43)
  {
    uint64_t v48 = (uint64_t)v92;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v94 + 56))(v92, 1LL, 1LL, v93);
    goto LABEL_49;
  }

  uint64_t v45 = v43;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v47 = v93;
  uint64_t v46 = v94;
  uint64_t v48 = (uint64_t)v92;
  unint64_t v83 = *(void (**)(void))(v94 + 32);
  v83();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v46 + 56))(v48, 0LL, 1LL, v47);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v46 + 48))(v48, 1LL, v47) == 1)
  {
LABEL_49:
    swift_bridgeObjectRelease(v86);
    swift_bridgeObjectRelease(v88);
    swift_unknownObjectRelease(v84);
    sub_100008880(v48, &qword_100038428);
    goto LABEL_42;
  }

  ((void (*)(char *, uint64_t, uint64_t))v83)(v91, v48, v47);
  os_log_type_t v49 = v88;
  v16->_countAndFlagsBits = v87;
  v16->_object = v49;
  BOOL v50 = v86;
  v16[1]._countAndFlagsBits = v85;
  v16[1]._object = v50;
  v16[2] = URL.path(percentEncoded:)(0);
  id v51 = [v44 creationDate];
  if (v51)
  {
    v52 = v51;
    uint64_t v53 = (uint64_t)v90;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v54 = 0LL;
  }

  else
  {
    uint64_t v54 = 1LL;
    uint64_t v53 = (uint64_t)v90;
  }

  swift_unknownObjectRelease(v84);
  (*(void (**)(char *, uint64_t))(v94 + 8))(v91, v47);
  v89(v53, v54, 1LL, v18);
  sub_10000863C(v53, v17);
  sub_1000087B8((uint64_t)v16, a2, type metadata accessor for TaskPayloadRecord);
  (*(void (**)(uint64_t, void, uint64_t, void *))(v13 + 56))(a2, 0LL, 1LL, v12);
  return sub_1000087FC((uint64_t)v16, type metadata accessor for TaskPayloadRecord);
}

uint64_t sub_100007B74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t type metadata accessor for TaskRecord(uint64_t a1)
{
  return sub_10000884C(a1, (uint64_t *)&unk_100038490, (uint64_t)&nominal type descriptor for TaskRecord);
}

uint64_t sub_100007BC8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007BE0(uint64_t a1)
{
  uint64_t v2 = sub_100009FBC( &qword_100038620,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F638);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100007C20(uint64_t a1)
{
  uint64_t v2 = sub_100009FBC( &qword_100038620,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F638);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100007C64(uint64_t a1)
{
  uint64_t v2 = sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100007CA4()
{
  return *v0;
}

uint64_t sub_100007CAC@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

BOOL sub_100007CB4(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100007CC8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(CKErrorDomain);
}

uint64_t sub_100007CD8(uint64_t a1)
{
  uint64_t v2 = sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100007D18(uint64_t a1)
{
  uint64_t v2 = sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100007D58(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100007DBC()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100007DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100007E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[9] = *v3;
  Hasher.init(_seed:)(v7, a1);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

void *sub_100007E9C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_100007EAC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100007EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100007F10(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007FE0(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008764((uint64_t)v12, *a3);
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
      sub_100008764((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_10000A238(v12);
  return v7;
}

uint64_t sub_100007FE0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0LL, HIBYTE(a6) & 0xF, __dst, a3);
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_100008198(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  uint64_t v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

        uint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << v2) - 1;
    uint64_t result = swift_release(v3);
  }

  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << result) - 1;
  }

  uint64_t v18 = *(void *)(v3 + 16);
  uint64_t v19 = __OFSUB__(v18, 1LL);
  uint64_t v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }

  return result;
}

uint64_t sub_100008198(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000822C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_100008404(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008404(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000822C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v4)
  {
    while (1)
    {
      uint64_t v5 = sub_1000083A0(v4, 0LL);
      if (v4 < 0) {
        break;
      }
      uint64_t v6 = v5;
      uint64_t v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0) {
        goto LABEL_14;
      }
      if (v7 == v4) {
        return v6;
      }
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "invalid Collection: less than 'count' elements in collection",  60LL,  2LL,  "Swift/ContiguousArrayBuffer.swift",  33LL,  v10,  1122LL,  0);
      __break(1u);
LABEL_10:
      uint64_t v4 = String.UTF8View._foreignCount()();
      if (!v4) {
        return &_swiftEmptyArrayStorage;
      }
    }

    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableBufferPointer with negative count",  46LL,  2LL,  "Swift/UnsafeBufferPointer.swift",  31LL,  v10,  71LL,  0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Insufficient space allocated to copy string contents",  52LL,  2LL,  "Swift/StringUTF8View.swift",  26LL,  v10,  430LL,  0);
    __break(1u);
  }

  else
  {
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_1000083A0(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100007B74(&qword_100038420);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100008404(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_30;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_100007B74(&qword_100038420);
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
  int v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }

LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

unint64_t sub_100008550(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100008684(a1, a2, v5);
}

uint64_t sub_1000085B4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000085F8(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000863C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007B74(&qword_1000383B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_100008684(uint64_t a1, uint64_t a2, uint64_t a3)
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
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }

  return v6;
}

uint64_t sub_100008764(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for TaskParametersRecord(uint64_t a1)
{
  return sub_10000884C(a1, qword_100038538, (uint64_t)&nominal type descriptor for TaskParametersRecord);
}

uint64_t sub_1000087B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000087FC(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for TaskPayloadRecord(uint64_t a1)
{
  return sub_10000884C(a1, qword_1000385D0, (uint64_t)&nominal type descriptor for TaskPayloadRecord);
}

uint64_t sub_10000884C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata(a1, a3);
  }
  return result;
}

uint64_t sub_100008880(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007B74(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void type metadata accessor for CKError(uint64_t a1)
{
}

char *sub_1000088D0(char *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *(void *)a1 = *a2;
    a1 = (char *)(v21 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v21);
  }

  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *((void *)a1 + 1) = v7;
    uint64_t v8 = a2[3];
    *((void *)a1 + 2) = a2[2];
    *((void *)a1 + 3) = v8;
    uint64_t v9 = a2[4];
    unint64_t v10 = a2[5];
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    sub_1000085F8(v9, v10);
    *((void *)a1 + 4) = v9;
    *((void *)a1 + 5) = v10;
    uint64_t v11 = a3[7];
    uint64_t v12 = &a1[v11];
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = type metadata accessor for Date(0LL);
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
    v16(v12, v13, v14);
    v16(&a1[a3[8]], (char *)a2 + a3[8], v14);
    uint64_t v17 = a3[9];
    uint64_t v18 = &a1[v17];
    uint64_t v19 = (char *)a2 + v17;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 1LL, v14))
    {
      uint64_t v20 = sub_100007B74(&qword_1000383B0);
      memcpy(v18, v19, *(void *)(*(void *)(v20 - 8) + 64LL));
    }

    else
    {
      v16(v18, v19, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v18, 0LL, 1LL, v14);
    }
  }

  return a1;
}

uint64_t sub_100008A20(char *a1, int *a2)
{
  uint64_t v4 = &a1[a2[7]];
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v9 = *(void (**)(char *, uint64_t))(v6 + 8);
  v9(v4, v5);
  v9(&a1[a2[8]], v5);
  uint64_t v7 = &a1[a2[9]];
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v7, 1LL, v5);
  if (!(_DWORD)result) {
    return ((uint64_t (*)(char *, uint64_t))v9)(v7, v5);
  }
  return result;
}

char *sub_100008AF8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = *((void *)a2 + 1);
  *(void *)a1 = *(void *)a2;
  *((void *)a1 + 1) = v6;
  uint64_t v7 = *((void *)a2 + 3);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  *((void *)a1 + 3) = v7;
  uint64_t v8 = *((void *)a2 + 4);
  unint64_t v9 = *((void *)a2 + 5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  sub_1000085F8(v8, v9);
  *((void *)a1 + 4) = v8;
  *((void *)a1 + 5) = v9;
  uint64_t v10 = a3[7];
  uint64_t v11 = &a1[v10];
  uint64_t v12 = &a2[v10];
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v15(v11, v12, v13);
  v15(&a1[a3[8]], &a2[a3[8]], v13);
  uint64_t v16 = a3[9];
  uint64_t v17 = &a1[v16];
  uint64_t v18 = &a2[v16];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v18, 1LL, v13))
  {
    uint64_t v19 = sub_100007B74(&qword_1000383B0);
    memcpy(v17, v18, *(void *)(*(void *)(v19 - 8) + 64LL));
  }

  else
  {
    v15(v17, v18, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v17, 0LL, 1LL, v13);
  }

  return a1;
}

char *sub_100008C1C(char *a1, char *a2, int *a3)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v6 = *((void *)a2 + 1);
  uint64_t v7 = *((void *)a1 + 1);
  *((void *)a1 + 1) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *((void *)a1 + 2) = *((void *)a2 + 2);
  uint64_t v8 = *((void *)a2 + 3);
  uint64_t v9 = *((void *)a1 + 3);
  *((void *)a1 + 3) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *((void *)a2 + 4);
  unint64_t v11 = *((void *)a2 + 5);
  sub_1000085F8(v10, v11);
  uint64_t v12 = *((void *)a1 + 4);
  unint64_t v13 = *((void *)a1 + 5);
  *((void *)a1 + 4) = v10;
  *((void *)a1 + 5) = v11;
  sub_1000085B4(v12, v13);
  uint64_t v14 = a3[7];
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v17 = type metadata accessor for Date(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(void (**)(char *, char *, uint64_t))(v18 + 24);
  v19(v15, v16, v17);
  v19(&a1[a3[8]], &a2[a3[8]], v17);
  uint64_t v20 = a3[9];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  char v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v15) = v23(&a1[v20], 1LL, v17);
  int v24 = v23(v22, 1LL, v17);
  if (!(_DWORD)v15)
  {
    if (!v24)
    {
      v19(v21, v22, v17);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
    goto LABEL_6;
  }

  if (v24)
  {
LABEL_6:
    uint64_t v25 = sub_100007B74(&qword_1000383B0);
    memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v21, v22, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v21, 0LL, 1LL, v17);
  return a1;
}

char *sub_100008DB0(char *a1, char *a2, int *a3)
{
  __int128 v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  uint64_t v7 = a3[7];
  uint64_t v8 = &a1[v7];
  uint64_t v9 = &a2[v7];
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v12(v8, v9, v10);
  v12(&a1[a3[8]], &a2[a3[8]], v10);
  uint64_t v13 = a3[9];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v15, 1LL, v10))
  {
    uint64_t v16 = sub_100007B74(&qword_1000383B0);
    memcpy(v14, v15, *(void *)(*(void *)(v16 - 8) + 64LL));
  }

  else
  {
    v12(v14, v15, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v14, 0LL, 1LL, v10);
  }

  return a1;
}

void *sub_100008EB4(void *a1, uint64_t a2, int *a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = a1[1];
  *a1 = *(void *)a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = a1[3];
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a1[4];
  unint64_t v11 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_1000085B4(v10, v11);
  uint64_t v12 = a3[7];
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = type metadata accessor for Date(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 40);
  v17(v13, v14, v15);
  v17((char *)a1 + a3[8], a2 + a3[8], v15);
  uint64_t v18 = a3[9];
  uint64_t v19 = (char *)a1 + v18;
  uint64_t v20 = (char *)(a2 + v18);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  LODWORD(v13) = v21((char *)a1 + v18, 1LL, v15);
  int v22 = v21(v20, 1LL, v15);
  if (!(_DWORD)v13)
  {
    if (!v22)
    {
      v17(v19, (uint64_t)v20, v15);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    goto LABEL_6;
  }

  if (v22)
  {
LABEL_6:
    uint64_t v23 = sub_100007B74(&qword_1000383B0);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v19, v20, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v19, 0LL, 1LL, v15);
  return a1;
}

uint64_t sub_10000901C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009028);
}

uint64_t sub_100009028(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for Date(0LL);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 28);
    }

    else
    {
      uint64_t v10 = sub_100007B74(&qword_1000383B0);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a3 + 36);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }

uint64_t sub_1000090CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000090D8);
}

uint64_t sub_1000090D8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for Date(0LL);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 28);
    }

    else
    {
      uint64_t v10 = sub_100007B74(&qword_1000383B0);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a4 + 36);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }

  return result;
}

void sub_100009178(uint64_t a1)
{
  v6[0] = &unk_10002F3B8;
  v6[1] = &unk_10002F3B8;
  v6[2] = &unk_10002F3D0;
  uint64_t v2 = type metadata accessor for Date(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v7 = *(void *)(v2 - 8) + 64LL;
    uint64_t v8 = v7;
    sub_100009214(319LL);
    if (v5 <= 0x3F)
    {
      uint64_t v9 = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 6LL, v6, a1 + 16);
    }
  }

void sub_100009214(uint64_t a1)
{
  if (!qword_1000384A0)
  {
    uint64_t v2 = type metadata accessor for Date(255LL);
    unint64_t v3 = type metadata accessor for Optional(a1, v2);
    if (!v4) {
      atomic_store(v3, (unint64_t *)&qword_1000384A0);
    }
  }

uint64_t *sub_100009268(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v17);
  }

  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    uint64_t v9 = a2[4];
    unint64_t v10 = a2[5];
    swift_bridgeObjectRetain(v7);
    swift_bridgeObjectRetain(v8);
    sub_1000085F8(v9, v10);
    a1[4] = v9;
    a1[5] = v10;
    uint64_t v11 = *(int *)(a3 + 28);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = type metadata accessor for Date(0LL);
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1LL, v14))
    {
      uint64_t v16 = sub_100007B74(&qword_1000383B0);
      memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0LL, 1LL, v14);
    }
  }

  return a1;
}

uint64_t sub_100009380(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  return result;
}

void *sub_10000940C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  uint64_t v8 = a2[4];
  unint64_t v9 = a2[5];
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  sub_1000085F8(v8, v9);
  a1[4] = v8;
  a1[5] = v9;
  uint64_t v10 = *(int *)(a3 + 28);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for Date(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1LL, v13))
  {
    uint64_t v15 = sub_100007B74(&qword_1000383B0);
    memcpy(v11, v12, *(void *)(*(void *)(v15 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0LL, 1LL, v13);
  }

  return a1;
}

void *sub_1000094F8(void *a1, void *a2, uint64_t a3)
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
  uint64_t v10 = a2[4];
  unint64_t v11 = a2[5];
  sub_1000085F8(v10, v11);
  uint64_t v12 = a1[4];
  unint64_t v13 = a1[5];
  a1[4] = v10;
  a1[5] = v11;
  sub_1000085B4(v12, v13);
  uint64_t v14 = *(int *)(a3 + 28);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for Date(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v11) = v19(v15, 1LL, v17);
  int v20 = v19(v16, 1LL, v17);
  if (!(_DWORD)v11)
  {
    if (!v20)
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 24))(v15, v16, v17);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v15, v17);
    goto LABEL_6;
  }

  if (v20)
  {
LABEL_6:
    uint64_t v21 = sub_100007B74(&qword_1000383B0);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0LL, 1LL, v17);
  return a1;
}

void *sub_100009660(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v7 = a1[1];
  *a1 = *(void *)a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v9 = a1[3];
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a1[4];
  unint64_t v11 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  sub_1000085B4(v10, v11);
  uint64_t v12 = *(int *)(a3 + 28);
  unint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)(a2 + v12);
  uint64_t v15 = type metadata accessor for Date(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1LL, v15);
  int v19 = v17(v14, 1LL, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }

  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_100007B74(&qword_1000383B0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 1LL, v15);
  return a1;
}

uint64_t sub_100009798(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000097A4);
}

uint64_t sub_1000097A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000097B4);
}

void sub_1000097B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *sub_1000097C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    uint64_t *v3 = *a2;
    unint64_t v3 = (uint64_t *)(v15 + ((v4 + 16LL) & ~(unint64_t)v4));
    swift_retain(v15);
  }

  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = a2[5];
    uint64_t v8 = *(int *)(a3 + 28);
    uint64_t v9 = (char *)a2 + v8;
    uint64_t v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    uint64_t v11 = type metadata accessor for Date(0LL);
    uint64_t v12 = *(void *)(v11 - 8);
    unint64_t v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v7);
    if (v13(v9, 1LL, v11))
    {
      uint64_t v14 = sub_100007B74(&qword_1000383B0);
      memcpy(v10, v9, *(void *)(*(void *)(v14 - 8) + 64LL));
    }

    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v10, v9, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0LL, 1LL, v11);
    }
  }

  return v3;
}

uint64_t sub_1000098E4(void *a1, uint64_t a2)
{
  int v4 = (char *)a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for Date(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1LL, v5);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  return result;
}

void *sub_100009970(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = a2[5];
  uint64_t v7 = *(int *)(a3 + 28);
  uint64_t v8 = (char *)a2 + v7;
  uint64_t v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  uint64_t v10 = type metadata accessor for Date(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  if (v12(v8, 1LL, v10))
  {
    uint64_t v13 = sub_100007B74(&qword_1000383B0);
    memcpy(v9, v8, *(void *)(*(void *)(v13 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v8, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0LL, 1LL, v10);
  }

  return a1;
}

void *sub_100009A64(void *a1, void *a2, uint64_t a3)
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
  a1[4] = a2[4];
  uint64_t v10 = a2[5];
  uint64_t v11 = a1[5];
  a1[5] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for Date(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1LL, v15);
  int v19 = v17(v14, 1LL, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }

  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_100007B74(&qword_1000383B0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 1LL, v15);
  return a1;
}

_OWORD *sub_100009BCC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8))
  {
    uint64_t v10 = sub_100007B74(&qword_1000383B0);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0LL, 1LL, v8);
  }

  return a1;
}

void *sub_100009C90(void *a1, void *a2, uint64_t a3)
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
  uint64_t v10 = a2[5];
  uint64_t v11 = a1[5];
  a1[4] = a2[4];
  a1[5] = v10;
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(int *)(a3 + 28);
  uint64_t v13 = (char *)a1 + v12;
  uint64_t v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for Date(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1LL, v15);
  int v19 = v17(v14, 1LL, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }

  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_100007B74(&qword_1000383B0);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64LL));
    return a1;
  }

  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0LL, 1LL, v15);
  return a1;
}

uint64_t sub_100009DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009DD4);
}

uint64_t sub_100009DD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_100007B74(&qword_1000383B0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 28),  a2,  v8);
  }

uint64_t sub_100009E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009E64);
}

uint64_t sub_100009E68(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_100007B74(&qword_1000383B0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 28),  a2,  a2,  v7);
  }

  return result;
}

void sub_100009EE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_100009EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[0] = &unk_10002F3B8;
  v7[1] = &unk_10002F3B8;
  v7[2] = a4;
  sub_100009214(319LL);
  if (v6 <= 0x3F)
  {
    v7[3] = *(void *)(v5 - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 4LL, v7, a1 + 16);
  }

uint64_t sub_100009F64()
{
  return sub_100009FBC( &qword_100038610,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F550);
}

uint64_t sub_100009F90()
{
  return sub_100009FBC( &qword_100038618,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F57C);
}

uint64_t sub_100009FBC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100009FFC()
{
  return sub_100009FBC( &qword_100038620,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F638);
}

uint64_t sub_10000A028()
{
  return sub_100009FBC( &qword_100038628,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F604);
}

uint64_t sub_10000A054()
{
  return sub_100009FBC( &qword_100038630,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F5C0);
}

uint64_t sub_10000A080()
{
  return sub_100009FBC( &qword_100038638,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_10002F724);
}

void type metadata accessor for Code(uint64_t a1)
{
}

void sub_10000A0C0(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t sub_10000A104()
{
  return sub_100009FBC( &qword_100038640,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_10002F6E8);
}

unint64_t sub_10000A134()
{
  unint64_t result = qword_100038648;
  if (!qword_100038648)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_100038648);
  }

  return result;
}

uint64_t sub_10000A178()
{
  return sub_100009FBC( &qword_100038650,  (uint64_t (*)(uint64_t))type metadata accessor for Code,  (uint64_t)&unk_10002F760);
}

uint64_t sub_10000A1A4()
{
  return sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
}

void *sub_10000A1D0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_10000A1F4()
{
  unint64_t result = qword_100038668;
  if (!qword_100038668)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002FA7C, &type metadata for TaskRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100038668);
  }

  return result;
}

uint64_t sub_10000A238(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10000A258()
{
  unint64_t result = qword_100038670;
  if (!qword_100038670)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100038670);
  }

  return result;
}

unint64_t sub_10000A29C()
{
  unint64_t result = qword_100038688;
  if (!qword_100038688)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Data, &type metadata for Data);
    atomic_store(result, (unint64_t *)&qword_100038688);
  }

  return result;
}

unint64_t sub_10000A2E0()
{
  unint64_t result = qword_1000386A0;
  if (!qword_1000386A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002FA2C, &type metadata for TaskParametersRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000386A0);
  }

  return result;
}

unint64_t sub_10000A324()
{
  unint64_t result = qword_1000386B8;
  if (!qword_1000386B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F9DC, &type metadata for TaskPayloadRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000386B8);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for TaskPayloadRecord.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for TaskPayloadRecord.CodingKeys()
{
  return &type metadata for TaskPayloadRecord.CodingKeys;
}

uint64_t _s28com_apple_mlhost_CloudWorker17TaskPayloadRecordV10CodingKeysOwet_0( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 3;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t _s28com_apple_mlhost_CloudWorker17TaskPayloadRecordV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_10000A470 + 4 * byte_10002F325[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000A4A4 + 4 * byte_10002F320[v4]))();
}

uint64_t sub_10000A4A4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A4AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000A4B4LL);
  }
  return result;
}

uint64_t sub_10000A4C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000A4C8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_10000A4CC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A4D4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TaskParametersRecord.CodingKeys()
{
  return &type metadata for TaskParametersRecord.CodingKeys;
}

uint64_t getEnumTagSinglePayload for TaskRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 5;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }

uint64_t storeEnumTagSinglePayload for TaskRecord.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFA) {
    return ((uint64_t (*)(void))((char *)&loc_10000A5CC + 4 * byte_10002F32F[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10000A600 + 4 * byte_10002F32A[v4]))();
}

uint64_t sub_10000A600(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A608(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000A610LL);
  }
  return result;
}

uint64_t sub_10000A61C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000A624LL);
  }
  *(_BYTE *)unint64_t result = a2 + 5;
  return result;
}

uint64_t sub_10000A628(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A630(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000A63C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000A644(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TaskRecord.CodingKeys()
{
  return &type metadata for TaskRecord.CodingKeys;
}

unint64_t sub_10000A660()
{
  unint64_t result = qword_1000386D0;
  if (!qword_1000386D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F844, &type metadata for TaskRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000386D0);
  }

  return result;
}

unint64_t sub_10000A6A8()
{
  unint64_t result = qword_1000386D8;
  if (!qword_1000386D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F8FC, &type metadata for TaskParametersRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000386D8);
  }

  return result;
}

unint64_t sub_10000A6F0()
{
  unint64_t result = qword_1000386E0;
  if (!qword_1000386E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F9B4, &type metadata for TaskPayloadRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000386E0);
  }

  return result;
}

unint64_t sub_10000A738()
{
  unint64_t result = qword_1000386E8;
  if (!qword_1000386E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F924, &type metadata for TaskPayloadRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000386E8);
  }

  return result;
}

unint64_t sub_10000A780()
{
  unint64_t result = qword_1000386F0;
  if (!qword_1000386F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F94C, &type metadata for TaskPayloadRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000386F0);
  }

  return result;
}

unint64_t sub_10000A7C8()
{
  unint64_t result = qword_1000386F8;
  if (!qword_1000386F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F86C, &type metadata for TaskParametersRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000386F8);
  }

  return result;
}

unint64_t sub_10000A810()
{
  unint64_t result = qword_100038700;
  if (!qword_100038700)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F894, &type metadata for TaskParametersRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100038700);
  }

  return result;
}

unint64_t sub_10000A858()
{
  unint64_t result = qword_100038708;
  if (!qword_100038708)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F7B4, &type metadata for TaskRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100038708);
  }

  return result;
}

unint64_t sub_10000A8A0()
{
  unint64_t result = qword_100038710;
  if (!qword_100038710)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002F7DC, &type metadata for TaskRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100038710);
  }

  return result;
}

uint64_t sub_10000A8E4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D614E6B736174LL && a2 == 0xE800000000000000LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656D614E6B736174LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x6F69736E65747865LL && a2 == 0xEB0000000064496ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6F69736E65747865LL, 0xEB0000000064496ELL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else if (a1 == 0x666E6F436B736174LL && a2 == 0xEE00617461446769LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x666E6F436B736174LL, 0xEE00617461446769LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  else if (a1 == 0x7461447472617473LL && a2 == 0xE900000000000065LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x7461447472617473LL, 0xE900000000000065LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 3LL;
  }

  else if (a1 == 0x65746144646E65LL && a2 == 0xE700000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x65746144646E65LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 4LL;
  }

  else if (a1 == 0x6E6F697461657263LL && a2 == 0xEC00000065746144LL)
  {
    swift_bridgeObjectRelease(0xEC00000065746144LL);
    return 5LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461657263LL, 0xEC00000065746144LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 5LL;
    }
    else {
      return 6LL;
    }
  }

uint64_t sub_10000AB7C(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D614E6B736174LL && a2 == 0xE800000000000000LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656D614E6B736174LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x6F69736E65747865LL && a2 == 0xEB0000000064496ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6F69736E65747865LL, 0xEB0000000064496ELL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else if (a1 == 0x6574656D61726170LL && a2 == 0xEE00617461447372LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6574656D61726170LL, 0xEE00617461447372LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  else if (a1 == 0x6E6F697461657263LL && a2 == 0xEC00000065746144LL)
  {
    swift_bridgeObjectRelease(0xEC00000065746144LL);
    return 3LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461657263LL, 0xEC00000065746144LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_10000AD54(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656D614E6B736174LL && a2 == 0xE800000000000000LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656D614E6B736174LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x6F69736E65747865LL && a2 == 0xEB0000000064496ELL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6F69736E65747865LL, 0xEB0000000064496ELL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else if (a1 == 0x617474416B736174LL && a2 == 0xEE00746E656D6863LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x617474416B736174LL, 0xEE00746E656D6863LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  else if (a1 == 0x6E6F697461657263LL && a2 == 0xEC00000065746144LL)
  {
    swift_bridgeObjectRelease(0xEC00000065746144LL);
    return 3LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F697461657263LL, 0xEC00000065746144LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_10000AF3C()
{
  if (qword_100038398 != -1) {
    swift_once(&qword_100038398, sub_10000AF84);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_100007BC8(v0, (uint64_t)qword_1000389C0);
}

uint64_t sub_10000AF84()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10002DDB0(v0, qword_1000389C0);
  sub_100007BC8(v0, (uint64_t)qword_1000389C0);
  return Logger.init(subsystem:category:)( 0xD000000000000014LL,  0x8000000100030150LL,  0x726F5764756F6C43LL,  0xEB0000000072656BLL);
}

void sub_10000B000()
{
  qword_100038780 = 0x737465737361LL;
  *(void *)algn_100038788 = 0xE600000000000000LL;
}

void sub_10000B020()
{
  qword_100038790 = 0x6574656D61726170LL;
  *(void *)algn_100038798 = 0xEF6E6F736A2E7372LL;
}

com_apple_mlhost_CloudWorker::CloudError_optional __swiftcall CloudError.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100034A80, v2);
  swift_bridgeObjectRelease(object);
  if (v3 == 1) {
    v4.value = com_apple_mlhost_CloudWorker_CloudError_queryError;
  }
  else {
    v4.value = com_apple_mlhost_CloudWorker_CloudError_unknownDefault;
  }
  if (v3) {
    return v4;
  }
  else {
    return 0;
  }
}

uint64_t CloudError.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x7272457972657571LL;
  }
  else {
    return 0x656C6C65636E6163LL;
  }
}

uint64_t sub_10000B0E0(char *a1, char *a2)
{
  return sub_10000B0EC(*a1, *a2);
}

uint64_t sub_10000B0EC(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    uint64_t v3 = 0x7272457972657571LL;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163LL;
  }
  if (v2) {
    unint64_t v4 = 0xE900000000000064LL;
  }
  else {
    unint64_t v4 = 0xEA0000000000726FLL;
  }
  if ((a2 & 1) != 0) {
    uint64_t v5 = 0x7272457972657571LL;
  }
  else {
    uint64_t v5 = 0x656C6C65636E6163LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0xEA0000000000726FLL;
  }
  else {
    unint64_t v6 = 0xE900000000000064LL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v5, v6, 0LL);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

Swift::Int sub_10000B194()
{
  return sub_10000B19C(*v0);
}

Swift::Int sub_10000B19C(char a1)
{
  if ((a1 & 1) != 0) {
    uint64_t v2 = 0x7272457972657571LL;
  }
  else {
    uint64_t v2 = 0x656C6C65636E6163LL;
  }
  if ((a1 & 1) != 0) {
    unint64_t v3 = 0xEA0000000000726FLL;
  }
  else {
    unint64_t v3 = 0xE900000000000064LL;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000B224(uint64_t a1)
{
  return sub_10000B22C(a1, *v1);
}

uint64_t sub_10000B22C(uint64_t a1, char a2)
{
  BOOL v2 = (a2 & 1) == 0;
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x7272457972657571LL;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163LL;
  }
  if (v2) {
    unint64_t v4 = 0xE900000000000064LL;
  }
  else {
    unint64_t v4 = 0xEA0000000000726FLL;
  }
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int sub_10000B28C(uint64_t a1)
{
  return sub_10000B294(a1, *v1);
}

Swift::Int sub_10000B294(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0) {
    uint64_t v3 = 0x7272457972657571LL;
  }
  else {
    uint64_t v3 = 0x656C6C65636E6163LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v4 = 0xEA0000000000726FLL;
  }
  else {
    unint64_t v4 = 0xE900000000000064LL;
  }
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10000B318@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  unint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100034A80, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_10000B374@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = CloudError.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000B3A8(uint64_t a1, uint64_t a2)
{
  v2[52] = a1;
  v2[53] = a2;
  unint64_t v3 = (*(void *)(*(void *)(sub_100007B74(&qword_1000387F0) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[54] = swift_task_alloc(v3);
  v2[55] = swift_task_alloc(v3);
  uint64_t v4 = sub_100007B74(&qword_1000387F8);
  v2[56] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for TaskPayloadRecord(0LL);
  v2[57] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[58] = v6;
  uint64_t v7 = *(void *)(v6 + 64);
  v2[59] = v7;
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[60] = swift_task_alloc(v8);
  v2[61] = swift_task_alloc(v8);
  v2[62] = swift_task_alloc(v8);
  uint64_t v9 = sub_100007B74(&qword_100038800);
  v2[63] = swift_task_alloc((*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for TaskParametersRecord(0LL);
  v2[64] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v2[65] = v11;
  uint64_t v12 = *(void *)(v11 + 64);
  v2[66] = v12;
  unint64_t v13 = (v12 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[67] = swift_task_alloc(v13);
  v2[68] = swift_task_alloc(v13);
  v2[69] = swift_task_alloc(v13);
  uint64_t v14 = type metadata accessor for URL.DirectoryHint(0LL);
  v2[70] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v2[71] = v15;
  v2[72] = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = sub_100007B74(&qword_100038428);
  v2[73] = swift_task_alloc((*(void *)(*(void *)(v16 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  v2[74] = v17;
  uint64_t v18 = *(void *)(v17 - 8);
  v2[75] = v18;
  uint64_t v19 = *(void *)(v18 + 64);
  v2[76] = v19;
  unint64_t v20 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[77] = swift_task_alloc(v20);
  v2[78] = swift_task_alloc(v20);
  v2[79] = swift_task_alloc(v20);
  v2[80] = swift_task_alloc(v20);
  v2[81] = swift_task_alloc(v20);
  v2[82] = swift_task_alloc(v20);
  uint64_t v21 = type metadata accessor for MLHostTask(0LL);
  v2[83] = v21;
  uint64_t v22 = *(void *)(v21 - 8);
  v2[84] = v22;
  uint64_t v23 = *(void *)(v22 + 64);
  v2[85] = v23;
  unint64_t v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[86] = swift_task_alloc(v24);
  v2[87] = swift_task_alloc(v24);
  v2[88] = swift_task_alloc(v24);
  v2[89] = swift_task_alloc(v24);
  uint64_t v25 = sub_100007B74(&qword_1000383B0);
  v2[90] = swift_task_alloc((*(void *)(*(void *)(v25 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v26 = (*(void *)(*(void *)(sub_100007B74(&qword_100038808) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[91] = swift_task_alloc(v26);
  v2[92] = swift_task_alloc(v26);
  uint64_t v27 = type metadata accessor for TaskDefinition(0LL);
  v2[93] = v27;
  uint64_t v28 = *(void *)(v27 - 8);
  v2[94] = v28;
  uint64_t v29 = *(void *)(v28 + 64);
  v2[95] = v29;
  unint64_t v30 = (v29 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[96] = swift_task_alloc(v30);
  v2[97] = swift_task_alloc(v30);
  v2[98] = swift_task_alloc(v30);
  uint64_t v31 = sub_100007B74(&qword_100038810);
  v2[99] = swift_task_alloc((*(void *)(*(void *)(v31 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = type metadata accessor for TaskRecord(0LL);
  v2[100] = v32;
  uint64_t v33 = *(void *)(v32 - 8);
  v2[101] = v33;
  uint64_t v34 = *(void *)(v33 + 64);
  v2[102] = v34;
  unint64_t v35 = (v34 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[103] = swift_task_alloc(v35);
  v2[104] = swift_task_alloc(v35);
  v2[105] = swift_task_alloc(v35);
  uint64_t v36 = type metadata accessor for Calendar(0LL);
  v2[106] = v36;
  uint64_t v37 = *(void *)(v36 - 8);
  v2[107] = v37;
  v2[108] = swift_task_alloc((*(void *)(v37 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v38 = type metadata accessor for Date(0LL);
  v2[109] = v38;
  uint64_t v39 = *(void *)(v38 - 8);
  v2[110] = v39;
  uint64_t v40 = *(void *)(v39 + 64);
  v2[111] = v40;
  unint64_t v41 = (v40 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  v2[112] = swift_task_alloc(v41);
  v2[113] = swift_task_alloc(v41);
  v2[114] = swift_task_alloc(v41);
  v2[115] = swift_task_alloc(v41);
  uint64_t v42 = sub_100007B74(&qword_100038818);
  v2[116] = swift_task_alloc((*(void *)(*(void *)(v42 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v43 = type metadata accessor for MLHostConfig(0LL);
  v2[117] = v43;
  uint64_t v44 = *(void *)(v43 - 8);
  v2[118] = v44;
  v2[119] = swift_task_alloc((*(void *)(v44 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v45 = type metadata accessor for Logger(0LL);
  v2[120] = v45;
  uint64_t v46 = *(void *)(v45 - 8);
  v2[121] = v46;
  unint64_t v47 = (*(void *)(v46 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v2[122] = swift_task_alloc(v47);
  v2[123] = swift_task_alloc(v47);
  v2[124] = swift_task_alloc(v47);
  v2[125] = swift_task_alloc(v47);
  v2[126] = swift_task_alloc(v47);
  v2[127] = swift_task_alloc(v47);
  v2[128] = swift_task_alloc(v47);
  v2[129] = swift_task_alloc(v47);
  v2[130] = swift_task_alloc(v47);
  v2[131] = swift_task_alloc(v47);
  v2[132] = swift_task_alloc(v47);
  v2[133] = swift_task_alloc(v47);
  v2[134] = swift_task_alloc(v47);
  v2[135] = swift_task_alloc(v47);
  v2[136] = swift_task_alloc(v47);
  v2[137] = swift_task_alloc(v47);
  v2[138] = swift_task_alloc(v47);
  v2[139] = swift_task_alloc(v47);
  v2[140] = swift_task_alloc(v47);
  v2[141] = swift_task_alloc(v47);
  v2[142] = swift_task_alloc(v47);
  v2[143] = swift_task_alloc(v47);
  v2[144] = swift_task_alloc(v47);
  v2[145] = swift_task_alloc(v47);
  v2[146] = swift_task_alloc(v47);
  v2[147] = swift_task_alloc(v47);
  v2[148] = swift_task_alloc(v47);
  v2[149] = swift_task_alloc(v47);
  v2[150] = swift_task_alloc(v47);
  v2[151] = swift_task_alloc(v47);
  v2[152] = swift_task_alloc(v47);
  v2[153] = swift_task_alloc(v47);
  v2[154] = swift_task_alloc(v47);
  v2[155] = swift_task_alloc(v47);
  v2[156] = swift_task_alloc(v47);
  v2[157] = swift_task_alloc(v47);
  v2[158] = swift_task_alloc(v47);
  v2[159] = swift_task_alloc(v47);
  v2[160] = swift_task_alloc(v47);
  v2[161] = swift_task_alloc(v47);
  v2[162] = swift_task_alloc(v47);
  v2[163] = swift_task_alloc(v47);
  v2[164] = swift_task_alloc(v47);
  v2[165] = swift_task_alloc(v47);
  v2[166] = swift_task_alloc(v47);
  v2[167] = swift_task_alloc(v47);
  v2[168] = swift_task_alloc(v47);
  v2[169] = swift_task_alloc(v47);
  v2[170] = swift_task_alloc(v47);
  v2[171] = swift_task_alloc(v47);
  v2[172] = swift_task_alloc(v47);
  v2[173] = swift_task_alloc(v47);
  v2[174] = swift_task_alloc(v47);
  v2[175] = swift_task_alloc(v47);
  v2[176] = swift_task_alloc(v47);
  v2[177] = swift_task_alloc(v47);
  v2[178] = swift_task_alloc(v47);
  return swift_task_switch(sub_10000BAC4, 0LL, 0LL);
}

uint64_t sub_10000BAC4()
{
  uint64_t v1 = v0[178];
  uint64_t v2 = v0[121];
  uint64_t v3 = v0[120];
  uint64_t v4 = (void *)v0[52];
  uint64_t v5 = sub_10000AF3C();
  v0[179] = v5;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[180] = v6;
  v6(v1, v5, v3);
  uint64_t v7 = swift_allocObject(&unk_100034F98, 24LL, 7LL);
  *(void *)(v7 + 16) = v4;
  unint64_t v8 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v9 = static os_log_type_t.info.getter();
  uint64_t v10 = swift_allocObject(&unk_100034FC0, 17LL, 7LL);
  *(_BYTE *)(v10 + 16) = 64;
  uint64_t v11 = swift_allocObject(&unk_100034FE8, 17LL, 7LL);
  *(_BYTE *)(v11 + 16) = 8;
  uint64_t v12 = swift_allocObject(&unk_100035010, 32LL, 7LL);
  *(void *)(v12 + 16) = sub_10002E254;
  *(void *)(v12 + 24) = v7;
  uint64_t v13 = swift_allocObject(&unk_100035038, 32LL, 7LL);
  *(void *)(v13 + 16) = sub_10002E010;
  *(void *)(v13 + 24) = v12;
  uint64_t v14 = sub_100007B74(&qword_100038820);
  v0[181] = v14;
  uint64_t v15 = swift_allocObject(v14, 80LL, 7LL);
  *(_OWORD *)(v15 + 16) = xmmword_10002FBB0;
  *(void *)(v15 + 32) = sub_100029310;
  *(void *)(v15 + 40) = v10;
  *(void *)(v15 + 48) = sub_10002E258;
  *(void *)(v15 + 56) = v11;
  *(void *)(v15 + 64) = sub_1000293E4;
  *(void *)(v15 + 72) = v13;
  swift_retain(v10);
  swift_retain(v11);
  swift_retain(v13);
  swift_bridgeObjectRelease(v15);
  os_log_type_t v16 = v9;
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v18 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v31 = v18;
    uint64_t v32 = 0LL;
    *(_WORD *)uint64_t v17 = 258;
    v17[2] = *(_BYTE *)(v10 + 16);
    swift_release(v10);
    v17[3] = *(_BYTE *)(v11 + 16);
    unint64_t v30 = v17 + 4;
    swift_release(v11);
    sub_100029334((uint64_t *)&v30, &v31, (uint64_t)&v32, *(uint64_t (**)(void))(v13 + 16));
    uint64_t v19 = v0[178];
    uint64_t v20 = v0[121];
    uint64_t v21 = v0[120];
    swift_release(v13);
    _os_log_impl((void *)&_mh_execute_header, v8, v16, "Context: %@", v17, 0xCu);
    uint64_t v22 = sub_100007B74(&qword_1000388A0);
    swift_arrayDestroy(v18, 1LL, v22);
    swift_slowDealloc(v18, -1LL, -1LL);
    swift_slowDealloc(v17, -1LL, -1LL);

    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v23(v19, v21);
  }

  else
  {
    uint64_t v24 = v0[178];
    uint64_t v25 = v0[121];
    uint64_t v26 = v0[120];
    swift_release(v10);
    swift_release(v11);
    swift_release(v13);

    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
    v23(v24, v26);
  }

  v0[182] = v23;
  uint64_t v27 = async function pointer to dispatch thunk of MLHostClient.getConfig();
  v0[183] = v28;
  *uint64_t v28 = v0;
  v28[1] = sub_10000BE04;
}

uint64_t sub_10000BE04()
{
  uint64_t v2 = *(void *)(*(void *)v1 + 1464LL);
  *(void *)(*(void *)v1 + 1472LL) = v0;
  swift_task_dealloc(v2);
  if (v0)
  {
    swift_errorRelease(v0);
    uint64_t v3 = sub_100021D7C;
  }

  else
  {
    uint64_t v3 = sub_10000BEB4;
  }

  return swift_task_switch(v3, 0LL, 0LL);
}

uint64_t sub_10000BEB4()
{
  uint64_t v1 = *(void *)(v0 + 952);
  uint64_t v2 = *(void *)(v0 + 944);
  uint64_t v3 = *(void *)(v0 + 936);
  uint64_t v4 = *(void *)(v0 + 928);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v2 + 56))(v4, 0LL, 1LL, v3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v1, v4, v3);
  uint64_t v6 = MLHostConfig.cloudEnvironment.getter(v5);
  if (v6 == 0x6D706F6C65766564LL && v7 == 0xEB00000000746E65LL)
  {
    swift_bridgeObjectRelease(0xEB00000000746E65LL);
    char v10 = 1;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, 0x6D706F6C65766564LL, 0xEB00000000746E65LL, 0LL);
    swift_bridgeObjectRelease(v9);
  }

  uint64_t v11 = *(void *)(v0 + 1448);
  (*(void (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1416),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
  uint64_t v12 = swift_allocObject(&unk_100035060, 17LL, 7LL);
  *(_BYTE *)(v12 + 16) = v10 & 1;
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.info.getter();
  uint64_t v15 = swift_allocObject(&unk_100035088, 17LL, 7LL);
  *(_BYTE *)(v15 + 16) = 0;
  uint64_t v16 = swift_allocObject(&unk_1000350B0, 17LL, 7LL);
  *(_BYTE *)(v16 + 16) = 4;
  uint64_t v17 = swift_allocObject(&unk_1000350D8, 32LL, 7LL);
  *(void *)(v17 + 16) = sub_1000293FC;
  *(void *)(v17 + 24) = v12;
  uint64_t v18 = swift_allocObject(&unk_100035100, 32LL, 7LL);
  *(void *)(v18 + 16) = sub_100029424;
  *(void *)(v18 + 24) = v17;
  uint64_t v19 = swift_allocObject(&unk_100035128, 32LL, 7LL);
  *(void *)(v19 + 16) = sub_100029448;
  *(void *)(v19 + 24) = v18;
  uint64_t v20 = swift_allocObject(&unk_100035150, 32LL, 7LL);
  *(void *)(v20 + 16) = sub_100029468;
  *(void *)(v20 + 24) = v19;
  uint64_t v21 = swift_allocObject(v11, 80LL, 7LL);
  *(_OWORD *)(v21 + 16) = xmmword_10002FBB0;
  *(void *)(v21 + 32) = sub_10002E258;
  *(void *)(v21 + 40) = v15;
  *(void *)(v21 + 48) = sub_10002E258;
  *(void *)(v21 + 56) = v16;
  *(void *)(v21 + 64) = sub_100029490;
  *(void *)(v21 + 72) = v20;
  swift_retain(v15);
  swift_retain(v16);
  swift_retain(v20);
  swift_bridgeObjectRelease(v21);
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v22 = (void *)(v0 + 1472);
    uint64_t v23 = *(void *)(v0 + 1472);
    uint64_t v24 = swift_slowAlloc(8LL, -1LL);
    *(_WORD *)uint64_t v24 = 256;
    *(_BYTE *)(v24 + 2) = *(_BYTE *)(v15 + 16);
    if (v23) {
      return swift_errorRelease(*v22);
    }
    uint64_t v25 = (uint8_t *)v24;
    uint64_t v26 = *v22;
    swift_release(v15);
    v25[3] = *(_BYTE *)(v16 + 16);
    if (v26) {
      return swift_errorRelease(*v22);
    }
    char v240 = v10;
    uint64_t v27 = *v22;
    uint64_t v28 = swift_release(v16);
    (*(void (**)(double *__return_ptr, uint64_t))(v20 + 16))(&v246, v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v246, (char *)&v246 + 4);
    if (v27) {
      return swift_errorRelease(*v22);
    }
    uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1456);
    uint64_t v30 = *(void *)(v0 + 1416);
    uint64_t v31 = *(void *)(v0 + 960);
    swift_release(v20);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "useSandboxEnvironment: %{BOOL}d", v25, 8u);
    swift_slowDealloc(v25, -1LL, -1LL);

    uint64_t v32 = v30;
    uint64_t v33 = v31;
  }

  else
  {
    char v240 = v10;
    uint64_t v29 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1456);
    uint64_t v34 = *(void *)(v0 + 1416);
    uint64_t v35 = *(void *)(v0 + 960);
    swift_release(v15);
    swift_release(v16);
    swift_release(v20);

    uint64_t v32 = v34;
    uint64_t v33 = v35;
  }

  uint64_t v36 = v29(v32, v33);
  unint64_t v37 = 0xD00000000000001ALL;
  uint64_t v38 = *(void *)(v0 + 1448);
  uint64_t v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v40 = *(void *)(v0 + 1432);
  uint64_t v41 = *(void *)(v0 + 1408);
  uint64_t v42 = *(void *)(v0 + 960);
  uint64_t v43 = MLHostConfig.cloudContainer.getter(v36);
  if (v44)
  {
    unint64_t v37 = v43;
    unint64_t v45 = v44;
  }

  else
  {
    unint64_t v45 = 0x8000000100030050LL;
  }

  v39(v41, v40, v42);
  uint64_t v46 = swift_allocObject(&unk_100035178, 32LL, 7LL);
  uint64_t v236 = v37;
  uint64_t v238 = v45;
  *(void *)(v46 + 16) = v37;
  *(void *)(v46 + 24) = v45;
  uint64_t v47 = swift_bridgeObjectRetain(v45);
  uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
  os_log_type_t v49 = static os_log_type_t.info.getter();
  uint64_t v50 = swift_allocObject(&unk_1000351A0, 17LL, 7LL);
  *(_BYTE *)(v50 + 16) = 32;
  uint64_t v51 = swift_allocObject(&unk_1000351C8, 17LL, 7LL);
  *(_BYTE *)(v51 + 16) = 8;
  uint64_t v52 = swift_allocObject(&unk_1000351F0, 32LL, 7LL);
  *(void *)(v52 + 16) = sub_10002950C;
  *(void *)(v52 + 24) = v46;
  uint64_t v53 = swift_allocObject(&unk_100035218, 32LL, 7LL);
  *(void *)(v53 + 16) = sub_100029448;
  *(void *)(v53 + 24) = v52;
  uint64_t v54 = swift_allocObject(v38, 80LL, 7LL);
  *(_OWORD *)(v54 + 16) = xmmword_10002FBB0;
  *(void *)(v54 + 32) = sub_10002E258;
  *(void *)(v54 + 40) = v50;
  *(void *)(v54 + 48) = sub_10002E258;
  *(void *)(v54 + 56) = v51;
  *(void *)(v54 + 64) = sub_100029558;
  *(void *)(v54 + 72) = v53;
  swift_retain(v50);
  swift_retain(v51);
  swift_retain(v53);
  swift_bridgeObjectRelease(v54);
  if (os_log_type_enabled(v48, v49))
  {
    uint64_t v22 = (void *)(v0 + 1472);
    uint64_t v55 = *(void *)(v0 + 1472);
    os_log_type_t v56 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v57 = swift_slowAlloc(32LL, -1LL);
    uint64_t v245 = 0LL;
    double v246 = *(double *)&v57;
    *(_WORD *)os_log_type_t v56 = 258;
    v56[2] = *(_BYTE *)(v50 + 16);
    if (v55) {
      return swift_errorRelease(*v22);
    }
    uint64_t v58 = v57;
    uint64_t v59 = *v22;
    swift_release(v50);
    v56[3] = *(_BYTE *)(v51 + 16);
    v244[0] = (uint64_t)(v56 + 4);
    if (v59) {
      return swift_errorRelease(*v22);
    }
    uint64_t v60 = *v22;
    swift_release(v51);
    sub_100029290(v244, (uint64_t)&v245, (uint64_t *)&v246, *(uint64_t (**)(void))(v53 + 16));
    if (v60) {
      return swift_errorRelease(*v22);
    }
    id v61 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1456);
    uint64_t v62 = *(void *)(v0 + 1408);
    uint64_t v63 = *(void *)(v0 + 960);
    swift_release(v53);
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "containerName: %s", v56, 0xCu);
    swift_arrayDestroy(v58, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v58, -1LL, -1LL);
    swift_slowDealloc(v56, -1LL, -1LL);

    uint64_t v64 = v62;
    uint64_t v65 = v63;
  }

  else
  {
    id v61 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1456);
    uint64_t v66 = *(void *)(v0 + 1408);
    uint64_t v67 = *(void *)(v0 + 960);
    swift_release(v50);
    swift_release(v51);
    swift_release(v53);

    uint64_t v64 = v66;
    uint64_t v65 = v67;
  }

  uint64_t v68 = v61(v64, v65);
  uint64_t v69 = *(void *)(v0 + 920);
  uint64_t v70 = *(void *)(v0 + 880);
  uint64_t v71 = *(void *)(v0 + 872);
  uint64_t v72 = static Date.distantPast.getter(v68);
  double v73 = Date.timeIntervalSinceReferenceDate.getter(v72);
  uint64_t v74 = *(uint64_t (**)(uint64_t, uint64_t))(v70 + 8);
  *(void *)(v0 + 1480) = v74;
  id v75 = (id)v74(v69, v71);
  if ((v240 & 1) == 0)
  {
    sub_10002DFC0(0LL, &qword_100038828, &OBJC_CLASS___NSUserDefaults_ptr);
    id v75 = sub_100025B00(0xD000000000000010LL, 0x8000000100030070LL);
    if (v75)
    {
      uint64_t v76 = v75;
      NSString v77 = String._bridgeToObjectiveC()();
      [v76 doubleForKey:v77];
      double v73 = v78;
    }
  }

  uint64_t v79 = *(void *)(v0 + 920);
  uint64_t v80 = *(void *)(v0 + 872);
  uint64_t v81 = static Date.now.getter(v75);
  double v82 = Date.timeIntervalSinceReferenceDate.getter(v81);
  uint64_t v83 = v74(v79, v80);
  if (v82 - v73 < 604800.0)
  {
    uint64_t v84 = *(void *)(v0 + 1448);
    uint64_t v85 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
    uint64_t v86 = *(void *)(v0 + 1432);
    uint64_t v87 = *(void *)(v0 + 1400);
    uint64_t v88 = *(void *)(v0 + 960);
    swift_bridgeObjectRelease(v238);
    v85(v87, v86, v88);
    uint64_t v89 = swift_allocObject(&unk_100037608, 24LL, 7LL);
    *(double *)(v89 + 16) = v73;
    uint64_t v90 = (os_log_s *)Logger.logObject.getter(v89);
    os_log_type_t v91 = static os_log_type_t.info.getter();
    uint64_t v92 = swift_allocObject(&unk_100037630, 17LL, 7LL);
    *(_BYTE *)(v92 + 16) = 0;
    uint64_t v93 = swift_allocObject(&unk_100037658, 17LL, 7LL);
    *(_BYTE *)(v93 + 16) = 8;
    uint64_t v94 = swift_allocObject(&unk_100037680, 32LL, 7LL);
    *(void *)(v94 + 16) = sub_10002DD18;
    *(void *)(v94 + 24) = v89;
    uint64_t v95 = swift_allocObject(&unk_1000376A8, 32LL, 7LL);
    *(void *)(v95 + 16) = sub_10002E010;
    *(void *)(v95 + 24) = v94;
    uint64_t v96 = swift_allocObject(&unk_1000376D0, 17LL, 7LL);
    *(_BYTE *)(v96 + 16) = 0;
    uint64_t v97 = swift_allocObject(&unk_1000376F8, 17LL, 7LL);
    *(_BYTE *)(v97 + 16) = 8;
    uint64_t v98 = swift_allocObject(v84, 128LL, 7LL);
    *(_OWORD *)(v98 + 16) = xmmword_10002FBC0;
    *(void *)(v98 + 32) = sub_10002E258;
    *(void *)(v98 + 40) = v92;
    *(void *)(v98 + 48) = sub_10002E258;
    *(void *)(v98 + 56) = v93;
    *(void *)(v98 + 64) = sub_10002D570;
    *(void *)(v98 + 72) = v95;
    *(void *)(v98 + 80) = sub_10002E258;
    *(void *)(v98 + 88) = v96;
    *(void *)(v98 + 96) = sub_10002E258;
    *(void *)(v98 + 104) = v97;
    *(void *)(v98 + 112) = sub_100029584;
    *(void *)(v98 + 120) = 0LL;
    swift_retain(v92);
    swift_retain(v93);
    swift_retain(v95);
    swift_retain(v96);
    swift_retain(v97);
    swift_bridgeObjectRelease(v98);
    if (os_log_type_enabled(v90, v91))
    {
      os_log_type_t v242 = v91;
      uint64_t v22 = (void *)(v0 + 1472);
      uint64_t v99 = *(void *)(v0 + 1472);
      uint64_t v100 = swift_slowAlloc(22LL, -1LL);
      *(_WORD *)uint64_t v100 = 512;
      *(_BYTE *)(v100 + 2) = *(_BYTE *)(v92 + 16);
      if (v99) {
        return swift_errorRelease(*v22);
      }
      uint64_t v101 = v100;
      uint64_t v102 = *v22;
      swift_release(v92);
      *(_BYTE *)(v101 + 3) = *(_BYTE *)(v93 + 16);
      if (v102) {
        return swift_errorRelease(*v22);
      }
      uint64_t v103 = *v22;
      uint64_t v104 = swift_release(v93);
      double v246 = (*(double (**)(uint64_t))(v95 + 16))(v104);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v246, &v247);
      if (v103) {
        return swift_errorRelease(*v22);
      }
      uint64_t v105 = *v22;
      swift_release(v95);
      *(_BYTE *)(v101 + 12) = *(_BYTE *)(v96 + 16);
      if (v105) {
        return swift_errorRelease(*v22);
      }
      uint64_t v106 = *v22;
      swift_release(v96);
      *(_BYTE *)(v101 + 13) = *(_BYTE *)(v97 + 16);
      if (v106) {
        return swift_errorRelease(*v22);
      }
      uint64_t v107 = *v22;
      swift_release(v97);
      *(void *)(v101 + 14) = 0x4122750000000000LL;
      if (v107) {
        return swift_errorRelease(*v22);
      }
      uint64_t v120 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v151 = *(void *)(v0 + 1400);
      uint64_t v152 = *(void *)(v0 + 960);
      _os_log_impl( (void *)&_mh_execute_header,  v90,  v242,  "Last CloudSync was %f. Skipping execution due to minInterval: %f.",  (uint8_t *)v101,  0x16u);
      swift_slowDealloc(v101, -1LL, -1LL);

      uint64_t v123 = v151;
      uint64_t v124 = v152;
    }

    else
    {
      uint64_t v120 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v121 = *(void *)(v0 + 1400);
      uint64_t v122 = *(void *)(v0 + 960);
      swift_release(v92);
      swift_release(v93);
      swift_release(v95);
      swift_release(v96);
      swift_release(v97);

      uint64_t v123 = v121;
      uint64_t v124 = v122;
    }

    v120(v123, v124);
    uint64_t v125 = 2LL;
    goto LABEL_45;
  }

  if ((static Task<>.isCancelled.getter(v83) & 1) != 0)
  {
    unint64_t v109 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
    uint64_t v110 = *(void *)(v0 + 1432);
    uint64_t v111 = *(void *)(v0 + 1392);
    uint64_t v112 = *(void *)(v0 + 960);
    swift_bridgeObjectRelease(v238);
    uint64_t v113 = v109(v111, v110, v112);
    uint64_t v114 = (os_log_s *)Logger.logObject.getter(v113);
    os_log_type_t v115 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v114, v115))
    {
      id v116 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v117 = *(void *)(v0 + 1392);
      uint64_t v118 = *(void *)(v0 + 960);
      uint64_t v119 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      uint64_t v245 = 0LL;
      double v246 = 0.0;
      *(_WORD *)uint64_t v119 = 0;
      v244[0] = (uint64_t)(v119 + 2);
      sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v244, (uint64_t)&v245, (uint64_t)&v246);
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      _os_log_impl((void *)&_mh_execute_header, v114, v115, "Task cancelled.", v119, 2u);
      swift_slowDealloc(v119, -1LL, -1LL);

      v116(v117, v118);
    }

    else
    {
      v135 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v136 = *(void *)(v0 + 1392);
      uint64_t v137 = *(void *)(v0 + 960);
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);

      v135(v136, v137);
    }

    uint64_t v125 = 1LL;
LABEL_45:
    uint64_t v138 = *(void *)(v0 + 952);
    uint64_t v139 = *(void *)(v0 + 944);
    uint64_t v140 = *(void *)(v0 + 936);
    id v141 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v153 = MLHostResult.init(status:policy:)(v125, 1LL);
    (*(void (**)(uint64_t, uint64_t))(v139 + 8))(v138, v140);
    uint64_t v142 = *(void *)(v0 + 1416);
    uint64_t v143 = *(void *)(v0 + 1408);
    uint64_t v144 = *(void *)(v0 + 1400);
    uint64_t v145 = *(void *)(v0 + 1392);
    uint64_t v146 = *(void *)(v0 + 1384);
    uint64_t v147 = *(void *)(v0 + 1376);
    uint64_t v148 = *(void *)(v0 + 1368);
    uint64_t v149 = *(void *)(v0 + 1360);
    uint64_t v150 = *(void *)(v0 + 1352);
    uint64_t v154 = *(void *)(v0 + 1344);
    uint64_t v155 = *(void *)(v0 + 1336);
    uint64_t v156 = *(void *)(v0 + 1328);
    uint64_t v157 = *(void *)(v0 + 1320);
    uint64_t v158 = *(void *)(v0 + 1312);
    uint64_t v159 = *(void *)(v0 + 1304);
    uint64_t v160 = *(void *)(v0 + 1296);
    uint64_t v161 = *(void *)(v0 + 1288);
    uint64_t v162 = *(void *)(v0 + 1280);
    uint64_t v163 = *(void *)(v0 + 1272);
    uint64_t v164 = *(void *)(v0 + 1264);
    uint64_t v165 = *(void *)(v0 + 1256);
    uint64_t v166 = *(void *)(v0 + 1248);
    uint64_t v167 = *(void *)(v0 + 1240);
    uint64_t v168 = *(void *)(v0 + 1232);
    uint64_t v169 = *(void *)(v0 + 1224);
    uint64_t v170 = *(void *)(v0 + 1216);
    uint64_t v171 = *(void *)(v0 + 1208);
    uint64_t v172 = *(void *)(v0 + 1200);
    uint64_t v173 = *(void *)(v0 + 1192);
    uint64_t v174 = *(void *)(v0 + 1184);
    uint64_t v175 = *(void *)(v0 + 1176);
    uint64_t v176 = *(void *)(v0 + 1168);
    uint64_t v177 = *(void *)(v0 + 1160);
    uint64_t v178 = *(void *)(v0 + 1152);
    uint64_t v179 = *(void *)(v0 + 1144);
    uint64_t v180 = *(void *)(v0 + 1136);
    uint64_t v181 = *(void *)(v0 + 1128);
    uint64_t v182 = *(void *)(v0 + 1120);
    uint64_t v183 = *(void *)(v0 + 1112);
    uint64_t v184 = *(void *)(v0 + 1104);
    uint64_t v185 = *(void *)(v0 + 1096);
    uint64_t v186 = *(void *)(v0 + 1088);
    uint64_t v187 = *(void *)(v0 + 1080);
    uint64_t v188 = *(void *)(v0 + 1072);
    uint64_t v189 = *(void *)(v0 + 1064);
    uint64_t v190 = *(void *)(v0 + 1056);
    uint64_t v191 = *(void *)(v0 + 1048);
    uint64_t v192 = *(void *)(v0 + 1040);
    uint64_t v193 = *(void *)(v0 + 1032);
    uint64_t v194 = *(void *)(v0 + 1024);
    uint64_t v195 = *(void *)(v0 + 1016);
    uint64_t v196 = *(void *)(v0 + 1008);
    uint64_t v197 = *(void *)(v0 + 1000);
    uint64_t v198 = *(void *)(v0 + 992);
    uint64_t v199 = *(void *)(v0 + 984);
    uint64_t v200 = *(void *)(v0 + 976);
    uint64_t v201 = *(void *)(v0 + 952);
    uint64_t v202 = *(void *)(v0 + 928);
    uint64_t v203 = *(void *)(v0 + 920);
    uint64_t v204 = *(void *)(v0 + 912);
    uint64_t v205 = *(void *)(v0 + 904);
    uint64_t v206 = *(void *)(v0 + 896);
    uint64_t v207 = *(void *)(v0 + 864);
    uint64_t v208 = *(void *)(v0 + 840);
    uint64_t v209 = *(void *)(v0 + 832);
    uint64_t v210 = *(void *)(v0 + 824);
    uint64_t v211 = *(void *)(v0 + 792);
    uint64_t v212 = *(void *)(v0 + 784);
    uint64_t v213 = *(void *)(v0 + 776);
    uint64_t v214 = *(void *)(v0 + 768);
    uint64_t v215 = *(void *)(v0 + 736);
    uint64_t v216 = *(void *)(v0 + 728);
    uint64_t v217 = *(void *)(v0 + 720);
    uint64_t v218 = *(void *)(v0 + 712);
    uint64_t v219 = *(void *)(v0 + 704);
    uint64_t v220 = *(void *)(v0 + 696);
    uint64_t v221 = *(void *)(v0 + 688);
    uint64_t v222 = *(void *)(v0 + 656);
    uint64_t v223 = *(void *)(v0 + 648);
    uint64_t v224 = *(void *)(v0 + 640);
    uint64_t v225 = *(void *)(v0 + 632);
    uint64_t v226 = *(void *)(v0 + 624);
    uint64_t v227 = *(void *)(v0 + 616);
    uint64_t v228 = *(void *)(v0 + 584);
    uint64_t v229 = *(void *)(v0 + 576);
    uint64_t v230 = *(void *)(v0 + 552);
    uint64_t v231 = *(void *)(v0 + 544);
    uint64_t v232 = *(void *)(v0 + 536);
    uint64_t v233 = *(void *)(v0 + 504);
    uint64_t v234 = *(void *)(v0 + 496);
    uint64_t v235 = *(void *)(v0 + 488);
    uint64_t v237 = *(void *)(v0 + 480);
    uint64_t v239 = *(void *)(v0 + 448);
    uint64_t v241 = *(void *)(v0 + 440);
    uint64_t v243 = *(void *)(v0 + 432);
    swift_task_dealloc(*(void *)(v0 + 1424));
    swift_task_dealloc(v142);
    swift_task_dealloc(v143);
    swift_task_dealloc(v144);
    swift_task_dealloc(v145);
    swift_task_dealloc(v146);
    swift_task_dealloc(v147);
    swift_task_dealloc(v148);
    swift_task_dealloc(v149);
    swift_task_dealloc(v150);
    swift_task_dealloc(v154);
    swift_task_dealloc(v155);
    swift_task_dealloc(v156);
    swift_task_dealloc(v157);
    swift_task_dealloc(v158);
    swift_task_dealloc(v159);
    swift_task_dealloc(v160);
    swift_task_dealloc(v161);
    swift_task_dealloc(v162);
    swift_task_dealloc(v163);
    swift_task_dealloc(v164);
    swift_task_dealloc(v165);
    swift_task_dealloc(v166);
    swift_task_dealloc(v167);
    swift_task_dealloc(v168);
    swift_task_dealloc(v169);
    swift_task_dealloc(v170);
    swift_task_dealloc(v171);
    swift_task_dealloc(v172);
    swift_task_dealloc(v173);
    swift_task_dealloc(v174);
    swift_task_dealloc(v175);
    swift_task_dealloc(v176);
    swift_task_dealloc(v177);
    swift_task_dealloc(v178);
    swift_task_dealloc(v179);
    swift_task_dealloc(v180);
    swift_task_dealloc(v181);
    swift_task_dealloc(v182);
    swift_task_dealloc(v183);
    swift_task_dealloc(v184);
    swift_task_dealloc(v185);
    swift_task_dealloc(v186);
    swift_task_dealloc(v187);
    swift_task_dealloc(v188);
    swift_task_dealloc(v189);
    swift_task_dealloc(v190);
    swift_task_dealloc(v191);
    swift_task_dealloc(v192);
    swift_task_dealloc(v193);
    swift_task_dealloc(v194);
    swift_task_dealloc(v195);
    swift_task_dealloc(v196);
    swift_task_dealloc(v197);
    swift_task_dealloc(v198);
    swift_task_dealloc(v199);
    swift_task_dealloc(v200);
    swift_task_dealloc(v201);
    swift_task_dealloc(v202);
    swift_task_dealloc(v203);
    swift_task_dealloc(v204);
    swift_task_dealloc(v205);
    swift_task_dealloc(v206);
    swift_task_dealloc(v207);
    swift_task_dealloc(v208);
    swift_task_dealloc(v209);
    swift_task_dealloc(v210);
    swift_task_dealloc(v211);
    swift_task_dealloc(v212);
    swift_task_dealloc(v213);
    swift_task_dealloc(v214);
    swift_task_dealloc(v215);
    swift_task_dealloc(v216);
    swift_task_dealloc(v217);
    swift_task_dealloc(v218);
    swift_task_dealloc(v219);
    swift_task_dealloc(v220);
    swift_task_dealloc(v221);
    swift_task_dealloc(v222);
    swift_task_dealloc(v223);
    swift_task_dealloc(v224);
    swift_task_dealloc(v225);
    swift_task_dealloc(v226);
    swift_task_dealloc(v227);
    swift_task_dealloc(v228);
    swift_task_dealloc(v229);
    swift_task_dealloc(v230);
    swift_task_dealloc(v231);
    swift_task_dealloc(v232);
    swift_task_dealloc(v233);
    swift_task_dealloc(v234);
    swift_task_dealloc(v235);
    swift_task_dealloc(v237);
    swift_task_dealloc(v239);
    swift_task_dealloc(v241);
    swift_task_dealloc(v243);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v153);
  }

  uint64_t v126 = swift_allocObject(&unk_100035240, 120LL, 7LL);
  *(void *)(v0 + 1488) = v126;
  *(_OWORD *)(v126 + 16) = 0u;
  *(_OWORD *)(v126 + 32) = 0u;
  *(_OWORD *)(v126 + 48) = 0u;
  *(_OWORD *)(v126 + 64) = 0u;
  *(_OWORD *)(v126 + 80) = 0u;
  *(_OWORD *)(v126 + 96) = 0u;
  *(void *)(v126 + 112) = _swiftEmptyArrayStorage;
  uint64_t v127 = type metadata accessor for PropertyListDecoder(0LL);
  swift_allocObject(v127, *(unsigned int *)(v127 + 48), *(unsigned __int16 *)(v127 + 52));
  *(void *)(v0 + 1496) = PropertyListDecoder.init()();
  if ((v240 & 1) != 0) {
    uint64_t v128 = 2LL;
  }
  else {
    uint64_t v128 = 1LL;
  }
  sub_10002DFC0(0LL, &qword_100038830, &OBJC_CLASS___CKContainerID_ptr);
  id v129 = sub_100025EC4(v236, v238, v128);
  *(void *)(v0 + 1504) = v129;
  id v130 = [objc_allocWithZone(CKContainer) initWithContainerID:v129];
  *(void *)(v0 + 1512) = v130;
  *(void *)(v0 + 1520) = [v130 publicCloudDatabase];
  id v131 = [(id)objc_opt_self(CKRecordZone) defaultRecordZone];
  *(void *)(v0 + 1528) = [v131 zoneID];

  *(void *)(v0 + 1536) = sub_100025F3C();
  id v132 = [objc_allocWithZone(CKOperationConfiguration) init];
  *(void *)(v0 + 1544) = v132;
  [v132 setPreferAnonymousRequests:1];
  uint64_t v133 = async function pointer to dispatch thunk of MLHostClient.getExtensions();
  *(void *)(v0 + 1552) = v134;
  void *v134 = v0;
  v134[1] = sub_10000D200;
  return ((uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of MLHostClient.getExtensions() + v133))();
}

uint64_t sub_10000D200(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 1552);
  *(void *)(*v2 + 1560) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    swift_errorRelease(v1);
    uint64_t v6 = sub_100021654;
  }

  else
  {
    *(void *)(v4 + 1568) = a1;
    uint64_t v6 = sub_10000D2C0;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_10000D2C0()
{
  uint64_t v1 = v0[196];
  uint64_t v2 = v0[195];
  uint64_t v3 = v0[181];
  uint64_t v4 = (void (*)(uint64_t, uint64_t, uint64_t))v0[180];
  uint64_t v5 = v0[179];
  uint64_t v6 = v0[173];
  uint64_t v7 = v0[120];
  unint64_t v8 = sub_100025FA8(v1);
  swift_bridgeObjectRelease(v1);
  uint64_t v9 = sub_10002C780((uint64_t)v8);
  v0[197] = v9;
  swift_bridgeObjectRelease(v8);
  v4(v6, v5, v7);
  uint64_t v10 = swift_allocObject(&unk_100035268, 24LL, 7LL);
  *(void *)(v10 + 16) = v9;
  uint64_t v11 = swift_allocObject(&unk_100035290, 32LL, 7LL);
  *(void *)(v11 + 16) = sub_10002C814;
  *(void *)(v11 + 24) = v10;
  uint64_t v12 = swift_bridgeObjectRetain(v9);
  uint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
  os_log_type_t v14 = static os_log_type_t.info.getter();
  uint64_t v15 = swift_allocObject(&unk_1000352B8, 17LL, 7LL);
  *(_BYTE *)(v15 + 16) = 32;
  uint64_t v16 = swift_allocObject(&unk_1000352E0, 17LL, 7LL);
  *(_BYTE *)(v16 + 16) = 8;
  uint64_t v17 = swift_allocObject(&unk_100035308, 32LL, 7LL);
  *(void *)(v17 + 16) = sub_10002C820;
  *(void *)(v17 + 24) = v11;
  uint64_t v18 = swift_allocObject(&unk_100035330, 32LL, 7LL);
  *(void *)(v18 + 16) = sub_10002E010;
  *(void *)(v18 + 24) = v17;
  uint64_t v19 = swift_allocObject(v3, 80LL, 7LL);
  *(_OWORD *)(v19 + 16) = xmmword_10002FBB0;
  *(void *)(v19 + 32) = sub_10002E258;
  *(void *)(v19 + 40) = v15;
  *(void *)(v19 + 48) = sub_10002E258;
  *(void *)(v19 + 56) = v16;
  *(void *)(v19 + 64) = sub_10002E01C;
  *(void *)(v19 + 72) = v18;
  swift_retain(v15);
  swift_retain(v16);
  swift_retain(v18);
  swift_bridgeObjectRelease(v19);
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v21 = swift_slowAlloc(32LL, -1LL);
    uint64_t v89 = 0LL;
    v90[0] = v21;
    *(_WORD *)uint64_t v20 = 258;
    v20[2] = *(_BYTE *)(v15 + 16);
    if (v2) {
      return swift_errorRelease(v2);
    }
    uint64_t v22 = v21;
    uint64_t v81 = 0LL;
    swift_release(v15);
    v20[3] = *(_BYTE *)(v16 + 16);
    v88[0] = (uint64_t)(v20 + 4);
    swift_release(v16);
    sub_100029290(v88, (uint64_t)&v89, v90, *(uint64_t (**)(void))(v18 + 16));
    uint64_t v23 = (uint64_t (*)(uint64_t, uint64_t))v0[182];
    uint64_t v24 = v0[173];
    uint64_t v25 = v0[120];
    swift_release(v18);
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Available extensions: %s", v20, 0xCu);
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v22, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);

    uint64_t v26 = v23(v24, v25);
  }

  else
  {
    uint64_t v81 = v2;
    uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t))v0[182];
    uint64_t v28 = v0[173];
    uint64_t v29 = v0[120];
    swift_release(v15);
    swift_release(v16);
    swift_release(v18);

    uint64_t v26 = v27(v28, v29);
  }

  uint64_t v30 = (void (*)(uint64_t, uint64_t))v0[185];
  uint64_t v84 = v0[179];
  uint64_t v85 = (void (*)(uint64_t, uint64_t, uint64_t))v0[180];
  uint64_t v82 = v0[172];
  uint64_t v83 = v0[120];
  uint64_t v31 = v0[115];
  uint64_t v32 = v0[114];
  uint64_t v33 = v0[113];
  uint64_t v86 = v0[111];
  uint64_t v87 = v0[181];
  uint64_t v34 = v0[110];
  uint64_t v35 = v0[109];
  uint64_t v36 = v0[108];
  uint64_t v37 = v0[107];
  uint64_t v38 = v0[106];
  uint64_t v39 = static Calendar.current.getter(v26);
  static Date.now.getter(v39);
  Calendar.startOfDay(for:)(v33);
  v30(v33, v35);
  uint64_t v40 = (*(uint64_t (**)(uint64_t, uint64_t))(v37 + 8))(v36, v38);
  Date.advanced(by:)(v40, 86400.0);
  v30(v31, v35);
  uint64_t v41 = sub_100007B74(&qword_100038838);
  v0[198] = v41;
  uint64_t v42 = swift_allocObject(v41, 112LL, 7LL);
  *(_OWORD *)(v42 + 16) = xmmword_10002FBD0;
  v0[199] = sub_10002DFC0(0LL, &qword_100038840, &OBJC_CLASS___NSPredicate_ptr);
  *(void *)(v42 + 56) = &type metadata for String;
  unint64_t v43 = sub_10002C844();
  v0[200] = v43;
  *(void *)(v42 + 64) = v43;
  *(void *)(v42 + 32) = 0x65746144646E65LL;
  *(void *)(v42 + 40) = 0xE700000000000000LL;
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  *(void *)(v42 + 96) = sub_10002DFC0(0LL, &qword_100038850, &OBJC_CLASS___NSDate_ptr);
  *(void *)(v42 + 104) = sub_10002C888();
  *(void *)(v42 + 72) = isa;
  unint64_t v45 = (void *)NSPredicate.init(format:_:)(0x4025203D3E204B25LL, 0xE800000000000000LL, v42);
  v0[201] = v45;
  v85(v82, v84, v83);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v31, v32, v35);
  uint64_t v46 = *(unsigned __int8 *)(v34 + 80);
  uint64_t v47 = (v46 + 16) & ~v46;
  uint64_t v48 = swift_allocObject(&unk_100035358, v47 + v86, v46 | 7);
  os_log_type_t v49 = *(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32);
  v0[202] = v49;
  v49(v48 + v47, v31, v35);
  uint64_t v50 = swift_allocObject(&unk_100035380, 32LL, 7LL);
  *(void *)(v50 + 16) = sub_10002C8EC;
  *(void *)(v50 + 24) = v48;
  uint64_t v51 = (os_log_s *)Logger.logObject.getter(v50);
  os_log_type_t v52 = static os_log_type_t.info.getter();
  uint64_t v53 = swift_allocObject(&unk_1000353A8, 17LL, 7LL);
  *(_BYTE *)(v53 + 16) = 32;
  uint64_t v54 = swift_allocObject(&unk_1000353D0, 17LL, 7LL);
  *(_BYTE *)(v54 + 16) = 8;
  uint64_t v55 = swift_allocObject(&unk_1000353F8, 32LL, 7LL);
  *(void *)(v55 + 16) = sub_10002C8F8;
  *(void *)(v55 + 24) = v50;
  uint64_t v56 = swift_allocObject(&unk_100035420, 32LL, 7LL);
  *(void *)(v56 + 16) = sub_10002E010;
  *(void *)(v56 + 24) = v55;
  uint64_t v57 = swift_allocObject(v87, 80LL, 7LL);
  *(_OWORD *)(v57 + 16) = xmmword_10002FBB0;
  *(void *)(v57 + 32) = sub_10002E258;
  *(void *)(v57 + 40) = v53;
  *(void *)(v57 + 48) = sub_10002E258;
  *(void *)(v57 + 56) = v54;
  *(void *)(v57 + 64) = sub_10002E01C;
  *(void *)(v57 + 72) = v56;
  swift_retain(v53);
  swift_retain(v54);
  swift_retain(v56);
  swift_bridgeObjectRelease(v57);
  if (os_log_type_enabled(v51, v52))
  {
    uint64_t v58 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v59 = swift_slowAlloc(32LL, -1LL);
    uint64_t v89 = 0LL;
    v90[0] = v59;
    *(_WORD *)uint64_t v58 = 258;
    v58[2] = *(_BYTE *)(v53 + 16);
    uint64_t v2 = v81;
    if (v81) {
      return swift_errorRelease(v2);
    }
    uint64_t v64 = v59;
    swift_release(v53);
    v58[3] = *(_BYTE *)(v54 + 16);
    v88[0] = (uint64_t)(v58 + 4);
    swift_release(v54);
    sub_100029290(v88, (uint64_t)&v89, v90, *(uint64_t (**)(void))(v56 + 16));
    uint64_t v65 = (void (*)(uint64_t, uint64_t))v0[182];
    uint64_t v66 = v0[172];
    uint64_t v67 = v0[120];
    swift_release(v56);
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "Querying Tasks with endDate after cutoff: %s", v58, 0xCu);
    swift_arrayDestroy(v64, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v64, -1LL, -1LL);
    swift_slowDealloc(v58, -1LL, -1LL);

    v65(v66, v67);
  }

  else
  {
    id v61 = (void (*)(uint64_t, uint64_t))v0[182];
    uint64_t v62 = v0[172];
    uint64_t v63 = v0[120];
    swift_release(v53);
    swift_release(v54);
    swift_release(v56);

    v61(v62, v63);
  }

  uint64_t v68 = (void *)v0[193];
  uint64_t v69 = (void *)v0[192];
  uint64_t v70 = v0[191];
  v0[203] = sub_10002DFC0(0LL, &qword_100038860, &OBJC_CLASS___CKQuery_ptr);
  uint64_t v71 = v45;
  v72._countAndFlagsBits = 0x736B736154LL;
  v72._object = (void *)0xE500000000000000LL;
  Class v73 = CKQuery.init(recordType:predicate:)(v72, v71).super.isa;
  v0[204] = v73;
  uint64_t v74 = swift_task_alloc(32LL);
  v0[205] = v74;
  *(void *)(v74 + 16) = v73;
  *(void *)(v74 + 24) = v70;
  uint64_t v75 = swift_task_alloc(32LL);
  v0[206] = v75;
  *(void *)(v75 + 16) = &unk_100038870;
  *(void *)(v75 + 24) = v74;
  uint64_t v76 = async function pointer to CKDatabase.configuredWith<A>(configuration:group:body:)[1];
  id v77 = v68;
  id v78 = v69;
  uint64_t v79 = (void *)swift_task_alloc(v76);
  v0[207] = v79;
  uint64_t v80 = sub_100007B74(&qword_100038888);
  v0[208] = v80;
  void *v79 = v0;
  v79[1] = sub_10000DB70;
  return CKDatabase.configuredWith<A>(configuration:group:body:)(v0 + 24, v68, v69, &unk_100038880, v75, v80);
}

uint64_t sub_10000DB70()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1656);
  *(void *)(*v1 + 1672) = v0;
  swift_task_dealloc(v3);
  uint64_t v4 = *(void *)(v2 + 1648);
  uint64_t v5 = *(void *)(v2 + 1640);
  if (v0)
  {
    uint64_t v6 = *(void *)(v2 + 1576);
    uint64_t v7 = *(void **)(v2 + 1544);

    swift_bridgeObjectRelease(v6);
    swift_task_dealloc(v4);
    swift_task_dealloc(v5);
    unint64_t v8 = sub_10002246C;
  }

  else
  {
    uint64_t v9 = *(void **)(v2 + 1544);

    swift_task_dealloc(v4);
    swift_task_dealloc(v5);
    unint64_t v8 = sub_10000DC7C;
  }

  return swift_task_switch(v8, 0LL, 0LL);
}

uint64_t sub_10000DC7C()
{
  uint64_t v1 = *(void **)(v0 + 1632);
  uint64_t v2 = *(void *)(v0 + 1488);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 1480);
  uint64_t v4 = *(void *)(v0 + 912);
  uint64_t v5 = *(void *)(v0 + 872);

  uint64_t v6 = *(void *)(v0 + 192);
  uint64_t v7 = *(void *)(v6 + 16);
  v3(v4, v5);
  *(void *)(v2 + 16) = v7;
  type metadata accessor for TaskRecord(0LL);
  *(void *)(v0 + 304) = _swiftEmptyArrayStorage;
  uint64_t v8 = *(void *)(v6 + 16);
  if (v8)
  {
    uint64_t v9 = *(void **)(v6 + 40);
    char v10 = *(_BYTE *)(v6 + 48);
    id v11 = *(id *)(v6 + 32);
    id v12 = sub_10002CB60(v9, v10);
    if ((static Task<>.isCancelled.getter(v12) & 1) != 0)
    {
      v372 = v9;
      swift_bridgeObjectRelease(*(void *)(v0 + 1576));
      swift_bridgeObjectRelease(v6);
      uint64_t v13 = _swiftEmptyArrayStorage;
LABEL_60:
      uint64_t v211 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
      uint64_t v212 = *(void *)(v0 + 1432);
      uint64_t v213 = *(void *)(v0 + 1368);
      uint64_t v214 = *(void *)(v0 + 960);
      swift_bridgeObjectRelease(v13);
      uint64_t v215 = v211(v213, v212, v214);
      uint64_t v216 = (os_log_s *)Logger.logObject.getter(v215);
      os_log_type_t v217 = static os_log_type_t.info.getter();
      BOOL v218 = os_log_type_enabled(v216, v217);
      uint64_t v219 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v220 = *(void *)(v0 + 1368);
      uint64_t v221 = *(void *)(v0 + 960);
      if (v218)
      {
        uint64_t v222 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        v378 = 0LL;
        v379[0] = 0LL;
        *(_WORD *)uint64_t v222 = 0;
        v377[0] = (uint64_t)(v222 + 2);
        sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v377, (uint64_t)&v378, (uint64_t)v379);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        _os_log_impl((void *)&_mh_execute_header, v216, v217, "Task cancelled.", v222, 2u);
        swift_slowDealloc(v222, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      }

      v219(v220, v221);
      uint64_t v223 = *(void **)(v0 + 1544);
      uint64_t v224 = *(void **)(v0 + 1536);
      uint64_t v225 = *(void **)(v0 + 1528);
      uint64_t v226 = *(void **)(v0 + 1520);
      uint64_t v227 = *(void **)(v0 + 1504);
      v356 = *(void **)(v0 + 1512);
      uint64_t v359 = *(void *)(v0 + 1496);
      uint64_t v209 = *(void *)(v0 + 1488);
      uint64_t v370 = *(void *)(v0 + 952);
      uint64_t v362 = *(void *)(v0 + 944);
      uint64_t v365 = *(void *)(v0 + 936);
      id v228 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v268 = MLHostResult.init(status:policy:)(1LL, 1LL);

      swift_release(v359);
      sub_10002CBAC(v372, v10);

      sub_100025B68(v209);
      (*(void (**)(uint64_t, uint64_t))(v362 + 8))(v370, v365);
      goto LABEL_64;
    }

    unint64_t v15 = 0LL;
    uint64_t v349 = v8 - 1;
    v345 = *(void **)(v0 + 840);
    uint64_t v347 = *(void *)(v0 + 808);
    uint64_t v343 = *(void *)(v0 + 752);
    uint64_t v355 = *(void *)(v0 + 1672);
    v358 = (char *)(v6 + 72);
    v367 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
    uint64_t v351 = v6;
    while (1)
    {
      v373 = v9;
      unint64_t v361 = v15;
      uint64_t v16 = *(void *)(v0 + 1448);
      (*(void (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1360),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
      uint64_t v17 = swift_allocObject(&unk_100035628, 24LL, 7LL);
      *(void *)(v17 + 16) = v11;
      id v18 = v11;
      uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
      os_log_type_t v20 = static os_log_type_t.debug.getter();
      uint64_t v21 = swift_allocObject(&unk_100035650, 17LL, 7LL);
      *(_BYTE *)(v21 + 16) = 64;
      uint64_t v22 = swift_allocObject(&unk_100035678, 17LL, 7LL);
      *(_BYTE *)(v22 + 16) = 8;
      uint64_t v23 = swift_allocObject(&unk_1000356A0, 32LL, 7LL);
      *(void *)(v23 + 16) = sub_10002E254;
      *(void *)(v23 + 24) = v17;
      uint64_t v24 = swift_allocObject(&unk_1000356C8, 32LL, 7LL);
      *(void *)(v24 + 16) = sub_10002E010;
      *(void *)(v24 + 24) = v23;
      uint64_t v25 = swift_allocObject(v16, 80LL, 7LL);
      *(_OWORD *)(v25 + 16) = xmmword_10002FBB0;
      *(void *)(v25 + 32) = sub_10002E258;
      *(void *)(v25 + 40) = v21;
      *(void *)(v25 + 48) = sub_10002E258;
      *(void *)(v25 + 56) = v22;
      *(void *)(v25 + 64) = sub_10002E020;
      *(void *)(v25 + 72) = v24;
      swift_retain(v21);
      swift_retain(v22);
      swift_retain(v24);
      swift_bridgeObjectRelease(v25);
      if (os_log_type_enabled(v19, v20))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v27 = (void *)swift_slowAlloc(8LL, -1LL);
        v378 = v27;
        v379[0] = 0LL;
        *(_WORD *)uint64_t v26 = 258;
        v26[2] = *(_BYTE *)(v21 + 16);
        if (v355) {
          return swift_errorRelease(v355);
        }
        uint64_t v28 = v27;
        swift_release(v21);
        v26[3] = *(_BYTE *)(v22 + 16);
        v377[0] = (uint64_t)(v26 + 4);
        swift_release(v22);
        sub_100029334(v377, &v378, (uint64_t)v379, *(uint64_t (**)(void))(v24 + 16));
        uint64_t v29 = *(void *)(v0 + 1360);
        uint64_t v30 = *(void *)(v0 + 960);
        swift_release(v24);
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "CKRecordID: %@", v26, 0xCu);
        uint64_t v31 = sub_100007B74(&qword_1000388A0);
        swift_arrayDestroy(v28, 1LL, v31);
        swift_slowDealloc(v28, -1LL, -1LL);
        swift_slowDealloc(v26, -1LL, -1LL);

        uint64_t v32 = v29;
        uint64_t v33 = v30;
      }

      else
      {
        uint64_t v34 = *(void *)(v0 + 1360);
        uint64_t v35 = *(void *)(v0 + 960);
        swift_release(v21);
        swift_release(v22);
        swift_release(v24);

        uint64_t v32 = v34;
        uint64_t v33 = v35;
      }

      v367(v32, v33);
      if ((v10 & 1) != 0)
      {
        uint64_t v36 = *(void *)(v0 + 1448);
        (*(void (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1320),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
        uint64_t v37 = swift_allocObject(&unk_1000356F0, 24LL, 7LL);
        *(void *)(v37 + 16) = v373;
        swift_errorRetain(v373);
        uint64_t v38 = swift_errorRetain(v373);
        uint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
        os_log_type_t v40 = static os_log_type_t.error.getter();
        uint64_t v41 = swift_allocObject(&unk_100035718, 17LL, 7LL);
        *(_BYTE *)(v41 + 16) = 64;
        uint64_t v42 = swift_allocObject(&unk_100035740, 17LL, 7LL);
        *(_BYTE *)(v42 + 16) = 8;
        uint64_t v43 = swift_allocObject(&unk_100035768, 32LL, 7LL);
        *(void *)(v43 + 16) = sub_10002E250;
        *(void *)(v43 + 24) = v37;
        uint64_t v44 = swift_allocObject(&unk_100035790, 32LL, 7LL);
        *(void *)(v44 + 16) = sub_10002CAF8;
        *(void *)(v44 + 24) = v43;
        uint64_t v45 = swift_allocObject(&unk_1000357B8, 32LL, 7LL);
        *(void *)(v45 + 16) = sub_10002E010;
        *(void *)(v45 + 24) = v44;
        uint64_t v46 = swift_allocObject(v36, 80LL, 7LL);
        *(_OWORD *)(v46 + 16) = xmmword_10002FBB0;
        *(void *)(v46 + 32) = sub_10002E258;
        *(void *)(v46 + 40) = v41;
        *(void *)(v46 + 48) = sub_10002E258;
        *(void *)(v46 + 56) = v42;
        *(void *)(v46 + 64) = sub_10002E020;
        *(void *)(v46 + 72) = v45;
        swift_retain(v41);
        swift_retain(v42);
        swift_retain(v45);
        swift_bridgeObjectRelease(v46);
        if (os_log_type_enabled(v39, v40))
        {
          uint64_t v47 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v48 = (void *)swift_slowAlloc(8LL, -1LL);
          v378 = v48;
          v379[0] = 0LL;
          *(_WORD *)uint64_t v47 = 258;
          v47[2] = *(_BYTE *)(v41 + 16);
          if (v355) {
            return swift_errorRelease(v355);
          }
          os_log_type_t v49 = v48;
          swift_release(v41);
          v47[3] = *(_BYTE *)(v42 + 16);
          v377[0] = (uint64_t)(v47 + 4);
          swift_release(v42);
          sub_100029334(v377, &v378, (uint64_t)v379, *(uint64_t (**)(void))(v45 + 16));
          uint64_t v50 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
          uint64_t v51 = *(void *)(v0 + 1320);
          uint64_t v52 = *(void *)(v0 + 960);
          swift_release(v45);
          _os_log_impl((void *)&_mh_execute_header, v39, v40, "Error: %@", v47, 0xCu);
          uint64_t v53 = sub_100007B74(&qword_1000388A0);
          swift_arrayDestroy(v49, 1LL, v53);
          swift_slowDealloc(v49, -1LL, -1LL);
          swift_slowDealloc(v47, -1LL, -1LL);

          sub_10002CBAC(v373, 1);
          sub_10002CBAC(v373, 1);

          v50(v51, v52);
          v367 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
        }

        else
        {
          uint64_t v76 = *(void *)(v0 + 1320);
          uint64_t v77 = *(void *)(v0 + 960);

          sub_10002CBAC(v373, 1);
          swift_release(v41);
          swift_release(v42);
          swift_release(v45);

          sub_10002CBAC(v373, 1);
          v367(v76, v77);
        }

        uint64_t v78 = *(void *)(v0 + 1488);
        uint64_t v79 = *(void *)(v78 + 32);
        BOOL v80 = __OFADD__(v79, 1LL);
        uint64_t v81 = v79 + 1;
        uint64_t v6 = v351;
        unint64_t v82 = v361;
        if (v80) {
          goto LABEL_75;
        }
        goto LABEL_20;
      }

      uint64_t v54 = *(void *)(v0 + 800);
      uint64_t v55 = *(void *)(v0 + 792);
      id v56 = v373;
      sub_100005040(v56, v55);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v347 + 48))(v55, 1LL, v54) == 1)
      {
        uint64_t v57 = *(void *)(v0 + 1448);
        uint64_t v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
        uint64_t v59 = *(void *)(v0 + 1432);
        uint64_t v60 = *(void *)(v0 + 1328);
        uint64_t v61 = *(void *)(v0 + 960);
        sub_100008880(*(void *)(v0 + 792), &qword_100038810);
        v58(v60, v59, v61);
        uint64_t v62 = swift_allocObject(&unk_1000372C0, 24LL, 7LL);
        *(void *)(v62 + 16) = v56;
        uint64_t v63 = (os_log_s *)Logger.logObject.getter(v56);
        os_log_type_t v64 = static os_log_type_t.error.getter();
        uint64_t v65 = swift_allocObject(&unk_1000372E8, 17LL, 7LL);
        *(_BYTE *)(v65 + 16) = 64;
        uint64_t v66 = swift_allocObject(&unk_100037310, 17LL, 7LL);
        *(_BYTE *)(v66 + 16) = 8;
        uint64_t v67 = swift_allocObject(&unk_100037338, 32LL, 7LL);
        *(void *)(v67 + 16) = sub_10002DAB0;
        *(void *)(v67 + 24) = v62;
        uint64_t v68 = swift_allocObject(&unk_100037360, 32LL, 7LL);
        *(void *)(v68 + 16) = sub_10002E010;
        *(void *)(v68 + 24) = v67;
        uint64_t v69 = swift_allocObject(v57, 80LL, 7LL);
        *(_OWORD *)(v69 + 16) = xmmword_10002FBB0;
        *(void *)(v69 + 32) = sub_10002E258;
        *(void *)(v69 + 40) = v65;
        *(void *)(v69 + 48) = sub_10002E258;
        *(void *)(v69 + 56) = v66;
        *(void *)(v69 + 64) = sub_10002E020;
        *(void *)(v69 + 72) = v68;
        swift_retain(v65);
        swift_retain(v66);
        swift_retain(v68);
        swift_bridgeObjectRelease(v69);
        if (os_log_type_enabled(v63, v64))
        {
          uint64_t v70 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v71 = (void *)swift_slowAlloc(8LL, -1LL);
          v378 = v71;
          v379[0] = 0LL;
          *(_WORD *)uint64_t v70 = 258;
          v70[2] = *(_BYTE *)(v65 + 16);
          uint64_t v72 = v355;
          if (v355) {
            return swift_errorRelease(v72);
          }
          swift_release(v65);
          v70[3] = *(_BYTE *)(v66 + 16);
          v377[0] = (uint64_t)(v70 + 4);
          swift_release(v66);
          sub_100029334(v377, &v378, (uint64_t)v379, *(uint64_t (**)(void))(v68 + 16));
          uint64_t v73 = *(void *)(v0 + 1328);
          uint64_t v74 = *(void *)(v0 + 960);
          swift_release(v68);
          _os_log_impl((void *)&_mh_execute_header, v63, v64, "Skipping record: %@", v70, 0xCu);
          uint64_t v75 = sub_100007B74(&qword_1000388A0);
          swift_arrayDestroy(v71, 1LL, v75);
          swift_slowDealloc(v71, -1LL, -1LL);
          swift_slowDealloc(v70, -1LL, -1LL);

          sub_10002CBAC(v373, 0);
          sub_10002CBAC(v373, 0);

          v367(v73, v74);
LABEL_29:
          uint64_t v355 = 0LL;
          goto LABEL_42;
        }

        uint64_t v110 = *(void *)(v0 + 1328);
        uint64_t v111 = *(void *)(v0 + 960);

        sub_10002CBAC(v373, 0);
        swift_release(v65);
        swift_release(v66);
        swift_release(v68);

        sub_10002CBAC(v373, 0);
        v367(v110, v111);
      }

      else
      {
        v353 = v18;
        uint64_t v83 = *(void *)(v0 + 1576);
        sub_10002DAD8(*(void *)(v0 + 792), *(void *)(v0 + 840), type metadata accessor for TaskRecord);
        uint64_t v84 = v345[2];
        uint64_t v85 = v345[3];
        swift_bridgeObjectRetain(v85);
        char v86 = sub_10002625C(v84, v85, v83);
        swift_bridgeObjectRelease(v85);
        uint64_t v87 = *(void *)(v0 + 1448);
        uint64_t v88 = *(void (**)(void, uint64_t, uint64_t))(v0 + 1440);
        uint64_t v89 = *(void *)(v0 + 1432);
        uint64_t v90 = *(void *)(v0 + 960);
        uint64_t v91 = *(void *)(v0 + 840);
        uint64_t v92 = *(void *)(v0 + 832);
        uint64_t v93 = *(void *)(v0 + 816);
        if ((v86 & 1) == 0)
        {
          v88(*(void *)(v0 + 1352), v89, v90);
          sub_1000087B8(v91, v92, type metadata accessor for TaskRecord);
          uint64_t v112 = *(unsigned __int8 *)(v347 + 80);
          uint64_t v113 = (v112 + 16) & ~v112;
          uint64_t v114 = swift_allocObject(&unk_100037388, v113 + v93, v112 | 7);
          uint64_t v115 = sub_10002DAD8(v92, v114 + v113, type metadata accessor for TaskRecord);
          id v116 = (void *)Logger.logObject.getter(v115);
          os_log_type_t v117 = static os_log_type_t.debug.getter();
          uint64_t v118 = swift_allocObject(&unk_1000373B0, 17LL, 7LL);
          *(_BYTE *)(v118 + 16) = 32;
          uint64_t v119 = swift_allocObject(&unk_1000373D8, 17LL, 7LL);
          *(_BYTE *)(v119 + 16) = 8;
          uint64_t v120 = swift_allocObject(&unk_100037400, 32LL, 7LL);
          *(void *)(v120 + 16) = sub_10002DB20;
          *(void *)(v120 + 24) = v114;
          uint64_t v121 = swift_allocObject(&unk_100037428, 32LL, 7LL);
          *(void *)(v121 + 16) = sub_10002E010;
          *(void *)(v121 + 24) = v120;
          uint64_t v122 = swift_allocObject(v87, 80LL, 7LL);
          *(_OWORD *)(v122 + 16) = xmmword_10002FBB0;
          *(void *)(v122 + 32) = sub_10002E258;
          *(void *)(v122 + 40) = v118;
          *(void *)(v122 + 48) = sub_10002E258;
          *(void *)(v122 + 56) = v119;
          *(void *)(v122 + 64) = sub_10002E01C;
          *(void *)(v122 + 72) = v121;
          swift_retain(v118);
          swift_retain(v119);
          swift_retain(v121);
          swift_bridgeObjectRelease(v122);
          if (!os_log_type_enabled((os_log_t)v116, v117))
          {
            uint64_t v148 = *(void *)(v0 + 1352);
            uint64_t v149 = *(void *)(v0 + 960);
            uint64_t v150 = *(void *)(v0 + 840);

            sub_10002CBAC(v373, 0);
            swift_release(v121);
            swift_release(v119);
            swift_release(v118);
            sub_10002CBAC(v373, 0);

            v367(v148, v149);
            sub_1000087FC(v150, type metadata accessor for TaskRecord);
            goto LABEL_42;
          }

          uint64_t v123 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v124 = swift_slowAlloc(32LL, -1LL);
          v378 = 0LL;
          v379[0] = v124;
          *(_WORD *)uint64_t v123 = 258;
          v123[2] = *(_BYTE *)(v118 + 16);
          uint64_t v72 = v355;
          if (v355) {
            return swift_errorRelease(v72);
          }
          swift_release(v118);
          v123[3] = *(_BYTE *)(v119 + 16);
          v377[0] = (uint64_t)(v123 + 4);
          swift_release(v119);
          sub_100029290(v377, (uint64_t)&v378, v379, *(uint64_t (**)(void))(v121 + 16));
          uint64_t v125 = *(void *)(v0 + 1352);
          uint64_t v126 = *(void *)(v0 + 960);
          uint64_t v127 = *(void *)(v0 + 840);
          swift_release(v121);
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v116,  v117,  "Skipping task %s because extensionId is not available.",  v123,  0xCu);
          swift_arrayDestroy(v124, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v124, -1LL, -1LL);
          swift_slowDealloc(v123, -1LL, -1LL);

          sub_10002CBAC(v373, 0);
          sub_10002CBAC(v373, 0);

          v367(v125, v126);
          sub_1000087FC(v127, type metadata accessor for TaskRecord);
          goto LABEL_29;
        }

        v88(*(void *)(v0 + 1344), v89, v90);
        sub_1000087B8(v91, v92, type metadata accessor for TaskRecord);
        uint64_t v94 = *(unsigned __int8 *)(v347 + 80);
        uint64_t v95 = (v94 + 16) & ~v94;
        uint64_t v96 = swift_allocObject(&unk_100037450, v95 + v93, v94 | 7);
        uint64_t v97 = sub_10002DAD8(v92, v96 + v95, type metadata accessor for TaskRecord);
        uint64_t v98 = (os_log_s *)Logger.logObject.getter(v97);
        os_log_type_t v99 = static os_log_type_t.debug.getter();
        uint64_t v100 = swift_allocObject(&unk_100037478, 17LL, 7LL);
        *(_BYTE *)(v100 + 16) = 32;
        uint64_t v101 = swift_allocObject(&unk_1000374A0, 17LL, 7LL);
        *(_BYTE *)(v101 + 16) = 8;
        uint64_t v102 = swift_allocObject(&unk_1000374C8, 32LL, 7LL);
        *(void *)(v102 + 16) = sub_10002DB20;
        *(void *)(v102 + 24) = v96;
        uint64_t v103 = swift_allocObject(&unk_1000374F0, 32LL, 7LL);
        *(void *)(v103 + 16) = sub_10002E010;
        *(void *)(v103 + 24) = v102;
        uint64_t v104 = swift_allocObject(v87, 80LL, 7LL);
        *(_OWORD *)(v104 + 16) = xmmword_10002FBB0;
        *(void *)(v104 + 32) = sub_10002E258;
        *(void *)(v104 + 40) = v100;
        *(void *)(v104 + 48) = sub_10002E258;
        *(void *)(v104 + 56) = v101;
        *(void *)(v104 + 64) = sub_10002E01C;
        *(void *)(v104 + 72) = v103;
        swift_retain(v100);
        swift_retain(v101);
        swift_retain(v103);
        swift_bridgeObjectRelease(v104);
        if (os_log_type_enabled(v98, v99))
        {
          uint64_t v105 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v106 = swift_slowAlloc(32LL, -1LL);
          v378 = 0LL;
          v379[0] = v106;
          *(_WORD *)uint64_t v105 = 258;
          v105[2] = *(_BYTE *)(v100 + 16);
          if (v355) {
            return swift_errorRelease(v355);
          }
          uint64_t v107 = v106;
          swift_release(v100);
          v105[3] = *(_BYTE *)(v101 + 16);
          v377[0] = (uint64_t)(v105 + 4);
          swift_release(v101);
          sub_100029290(v377, (uint64_t)&v378, v379, *(uint64_t (**)(void))(v103 + 16));
          uint64_t v108 = *(void *)(v0 + 1344);
          uint64_t v109 = *(void *)(v0 + 960);
          swift_release(v103);
          _os_log_impl((void *)&_mh_execute_header, v98, v99, "Parsing  config file for taskName: %s", v105, 0xCu);
          swift_arrayDestroy(v107, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v107, -1LL, -1LL);
          swift_slowDealloc(v105, -1LL, -1LL);

          v367(v108, v109);
        }

        else
        {
          uint64_t v128 = *(void *)(v0 + 1344);
          uint64_t v129 = *(void *)(v0 + 960);
          swift_release(v100);
          swift_release(v101);
          swift_release(v103);

          v367(v128, v129);
        }

        uint64_t v130 = *(void *)(v0 + 744);
        uint64_t v131 = v345[4];
        unint64_t v132 = v345[5];
        sub_1000085F8(v131, v132);
        uint64_t v133 = sub_100009FBC( &qword_1000388A8,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition,  (uint64_t)&protocol conformance descriptor for TaskDefinition);
        dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v130, v131, v132, v130, v133);
        if (v355)
        {
          v134 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
          uint64_t v135 = *(void *)(v0 + 1432);
          uint64_t v136 = *(void *)(v0 + 1336);
          uint64_t v137 = *(void *)(v0 + 960);
          uint64_t v138 = *(void *)(v0 + 744);
          uint64_t v139 = *(void *)(v0 + 736);
          swift_errorRelease(v355);
          sub_1000085B4(v131, v132);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v343 + 56))(v139, 1LL, 1LL, v138);
          sub_100008880(v139, &qword_100038808);
          uint64_t v140 = v134(v136, v135, v137);
          id v141 = (os_log_s *)Logger.logObject.getter(v140);
          os_log_type_t v142 = static os_log_type_t.error.getter();
          BOOL v143 = os_log_type_enabled(v141, v142);
          uint64_t v144 = *(void *)(v0 + 1336);
          uint64_t v145 = *(void *)(v0 + 960);
          uint64_t v146 = *(void *)(v0 + 840);
          if (v143)
          {
            uint64_t v147 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
            v378 = 0LL;
            v379[0] = 0LL;
            *(_WORD *)uint64_t v147 = 0;
            v377[0] = (uint64_t)(v147 + 2);
            sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v377, (uint64_t)&v378, (uint64_t)v379);
            swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
            _os_log_impl( (void *)&_mh_execute_header,  v141,  v142,  "Failed to parse TaskDefinition from config file, skipping task.",  v147,  2u);
            swift_slowDealloc(v147, -1LL, -1LL);
          }

          else
          {
            swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
          }

          sub_10002CBAC(v373, 0);
          sub_10002CBAC(v373, 0);

          v367(v144, v145);
          sub_1000087FC(v146, type metadata accessor for TaskRecord);
          uint64_t v355 = 0LL;
          uint64_t v6 = v351;
          unint64_t v82 = v361;
          uint64_t v78 = *(void *)(v0 + 1488);
          uint64_t v154 = *(void *)(v78 + 32);
          BOOL v80 = __OFADD__(v154, 1LL);
          uint64_t v81 = v154 + 1;
          if (v80) {
            goto LABEL_76;
          }
LABEL_20:
          *(void *)(v78 + 32) = v81;
          goto LABEL_43;
        }

        uint64_t v151 = *(void *)(v0 + 784);
        uint64_t v152 = *(void *)(v0 + 744);
        uint64_t v153 = *(void *)(v0 + 736);
        sub_1000085B4(v131, v132);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v343 + 56))(v153, 0LL, 1LL, v152);
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v343 + 32))(v151, v153, v152);
        validateTaskDefinition(_:)(v151);
        uint64_t v155 = *(void *)(v0 + 1488);
        uint64_t v156 = *(void *)(v0 + 840);
        uint64_t v157 = *(void *)(v0 + 832);
        uint64_t v158 = *(void *)(v0 + 784);
        uint64_t v159 = *(void *)(v0 + 744);
        sub_1000087B8(v156, v157, type metadata accessor for TaskRecord);
        sub_10002642C(v157, &qword_1000388F0, type metadata accessor for TaskRecord);
        sub_10002CBAC(v373, 0);
        sub_10002CBAC(v373, 0);

        (*(void (**)(uint64_t, uint64_t))(v343 + 8))(v158, v159);
        sub_1000087FC(v156, type metadata accessor for TaskRecord);
        uint64_t v160 = *(void *)(v155 + 24);
        BOOL v80 = __OFADD__(v160, 1LL);
        uint64_t v161 = v160 + 1;
        if (v80) {
          goto LABEL_77;
        }
        uint64_t v355 = 0LL;
        *(void *)(*(void *)(v0 + 1488) + 24LL) = v161;
      }

LABEL_42:
      uint64_t v6 = v351;
      unint64_t v82 = v361;
LABEL_43:
      if (v349 == v82)
      {
        uint64_t v14 = v355;
        goto LABEL_48;
      }

      unint64_t v15 = v82 + 1;
      if (*(void *)(v6 + 16) <= v15)
      {
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
        __break(1u);
LABEL_77:
        __break(1u);
      }

      uint64_t v9 = (void *)*((void *)v358 - 1);
      char v10 = *v358;
      id v11 = *((id *)v358 - 2);
      id v162 = sub_10002CB60(v9, v10);
      v358 += 24;
      if ((static Task<>.isCancelled.getter(v162) & 1) != 0)
      {
        v372 = v9;
        swift_bridgeObjectRelease(*(void *)(v0 + 1576));
        swift_bridgeObjectRelease(v6);
        uint64_t v13 = *(void **)(v0 + 304);
        goto LABEL_60;
      }
    }
  }

  uint64_t v14 = *(void *)(v0 + 1672);
LABEL_48:
  uint64_t v163 = *(void *)(v0 + 1576);
  swift_bridgeObjectRelease(v6);
  uint64_t v164 = swift_bridgeObjectRelease(v163);
  if ((static Task<>.isCancelled.getter(v164) & 1) != 0)
  {
    uint64_t v165 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
    uint64_t v166 = *(void *)(v0 + 1432);
    uint64_t v167 = *(void *)(v0 + 1312);
    uint64_t v168 = *(void *)(v0 + 960);
    swift_bridgeObjectRelease(*(void *)(v0 + 304));
    uint64_t v169 = v165(v167, v166, v168);
    uint64_t v170 = (os_log_s *)Logger.logObject.getter(v169);
    os_log_type_t v171 = static os_log_type_t.info.getter();
    BOOL v172 = os_log_type_enabled(v170, v171);
    uint64_t v173 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
    uint64_t v174 = *(void *)(v0 + 1312);
    uint64_t v175 = *(void *)(v0 + 960);
    if (v172)
    {
      uint64_t v176 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      v378 = 0LL;
      v379[0] = 0LL;
      *(_WORD *)uint64_t v176 = 0;
      v377[0] = (uint64_t)(v176 + 2);
      sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v377, (uint64_t)&v378, (uint64_t)v379);
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      _os_log_impl((void *)&_mh_execute_header, v170, v171, "Task cancelled before adding tasks to mlhost.", v176, 2u);
      swift_slowDealloc(v176, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    }

    v173(v174, v175);
    uint64_t v202 = *(void **)(v0 + 1544);
    uint64_t v203 = *(void **)(v0 + 1536);
    uint64_t v204 = *(void **)(v0 + 1528);
    uint64_t v205 = *(void **)(v0 + 1520);
    uint64_t v206 = *(void **)(v0 + 1512);
    uint64_t v207 = *(void **)(v0 + 1504);
    uint64_t v208 = *(void *)(v0 + 1496);
    uint64_t v209 = *(void *)(v0 + 1488);
    uint64_t v364 = *(void *)(v0 + 944);
    uint64_t v369 = *(void *)(v0 + 936);
    uint64_t v375 = *(void *)(v0 + 952);
    id v210 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v268 = MLHostResult.init(status:policy:)(1LL, 1LL);

    swift_release(v208);
    sub_100025B68(v209);
    (*(void (**)(uint64_t, uint64_t))(v364 + 8))(v375, v369);
LABEL_64:
    swift_release(v209);
    uint64_t v229 = *(void *)(v0 + 1416);
    uint64_t v230 = *(void *)(v0 + 1408);
    uint64_t v231 = *(void *)(v0 + 1400);
    uint64_t v232 = *(void *)(v0 + 1392);
    uint64_t v233 = *(void *)(v0 + 1384);
    uint64_t v234 = *(void *)(v0 + 1376);
    uint64_t v235 = *(void *)(v0 + 1368);
    uint64_t v236 = *(void *)(v0 + 1360);
    uint64_t v237 = *(void *)(v0 + 1352);
    uint64_t v269 = *(void *)(v0 + 1344);
    uint64_t v270 = *(void *)(v0 + 1336);
    uint64_t v271 = *(void *)(v0 + 1328);
    uint64_t v272 = *(void *)(v0 + 1320);
    uint64_t v273 = *(void *)(v0 + 1312);
    uint64_t v274 = *(void *)(v0 + 1304);
    uint64_t v275 = *(void *)(v0 + 1296);
    uint64_t v276 = *(void *)(v0 + 1288);
    uint64_t v277 = *(void *)(v0 + 1280);
    uint64_t v278 = *(void *)(v0 + 1272);
    uint64_t v279 = *(void *)(v0 + 1264);
    uint64_t v280 = *(void *)(v0 + 1256);
    uint64_t v281 = *(void *)(v0 + 1248);
    uint64_t v282 = *(void *)(v0 + 1240);
    uint64_t v283 = *(void *)(v0 + 1232);
    uint64_t v284 = *(void *)(v0 + 1224);
    uint64_t v285 = *(void *)(v0 + 1216);
    uint64_t v286 = *(void *)(v0 + 1208);
    uint64_t v287 = *(void *)(v0 + 1200);
    uint64_t v288 = *(void *)(v0 + 1192);
    uint64_t v289 = *(void *)(v0 + 1184);
    uint64_t v290 = *(void *)(v0 + 1176);
    uint64_t v291 = *(void *)(v0 + 1168);
    uint64_t v292 = *(void *)(v0 + 1160);
    uint64_t v293 = *(void *)(v0 + 1152);
    uint64_t v294 = *(void *)(v0 + 1144);
    uint64_t v295 = *(void *)(v0 + 1136);
    uint64_t v296 = *(void *)(v0 + 1128);
    uint64_t v297 = *(void *)(v0 + 1120);
    uint64_t v298 = *(void *)(v0 + 1112);
    uint64_t v299 = *(void *)(v0 + 1104);
    uint64_t v300 = *(void *)(v0 + 1096);
    uint64_t v301 = *(void *)(v0 + 1088);
    uint64_t v302 = *(void *)(v0 + 1080);
    uint64_t v303 = *(void *)(v0 + 1072);
    uint64_t v304 = *(void *)(v0 + 1064);
    uint64_t v305 = *(void *)(v0 + 1056);
    uint64_t v306 = *(void *)(v0 + 1048);
    uint64_t v307 = *(void *)(v0 + 1040);
    uint64_t v308 = *(void *)(v0 + 1032);
    uint64_t v309 = *(void *)(v0 + 1024);
    uint64_t v310 = *(void *)(v0 + 1016);
    uint64_t v311 = *(void *)(v0 + 1008);
    uint64_t v312 = *(void *)(v0 + 1000);
    uint64_t v313 = *(void *)(v0 + 992);
    uint64_t v314 = *(void *)(v0 + 984);
    uint64_t v315 = *(void *)(v0 + 976);
    uint64_t v316 = *(void *)(v0 + 952);
    uint64_t v317 = *(void *)(v0 + 928);
    uint64_t v318 = *(void *)(v0 + 920);
    uint64_t v319 = *(void *)(v0 + 912);
    uint64_t v320 = *(void *)(v0 + 904);
    uint64_t v321 = *(void *)(v0 + 896);
    uint64_t v322 = *(void *)(v0 + 864);
    uint64_t v323 = *(void *)(v0 + 840);
    uint64_t v324 = *(void *)(v0 + 832);
    uint64_t v325 = *(void *)(v0 + 824);
    uint64_t v326 = *(void *)(v0 + 792);
    uint64_t v327 = *(void *)(v0 + 784);
    uint64_t v328 = *(void *)(v0 + 776);
    uint64_t v329 = *(void *)(v0 + 768);
    uint64_t v330 = *(void *)(v0 + 736);
    uint64_t v331 = *(void *)(v0 + 728);
    uint64_t v332 = *(void *)(v0 + 720);
    uint64_t v333 = *(void *)(v0 + 712);
    uint64_t v334 = *(void *)(v0 + 704);
    uint64_t v335 = *(void *)(v0 + 696);
    uint64_t v336 = *(void *)(v0 + 688);
    uint64_t v337 = *(void *)(v0 + 656);
    uint64_t v338 = *(void *)(v0 + 648);
    uint64_t v339 = *(void *)(v0 + 640);
    uint64_t v340 = *(void *)(v0 + 632);
    uint64_t v341 = *(void *)(v0 + 624);
    uint64_t v342 = *(void *)(v0 + 616);
    uint64_t v344 = *(void *)(v0 + 584);
    uint64_t v346 = *(void *)(v0 + 576);
    uint64_t v348 = *(void *)(v0 + 552);
    uint64_t v350 = *(void *)(v0 + 544);
    uint64_t v352 = *(void *)(v0 + 536);
    uint64_t v354 = *(void *)(v0 + 504);
    uint64_t v357 = *(void *)(v0 + 496);
    uint64_t v360 = *(void *)(v0 + 488);
    uint64_t v363 = *(void *)(v0 + 480);
    uint64_t v366 = *(void *)(v0 + 448);
    uint64_t v371 = *(void *)(v0 + 440);
    uint64_t v376 = *(void *)(v0 + 432);
    swift_task_dealloc(*(void *)(v0 + 1424));
    swift_task_dealloc(v229);
    swift_task_dealloc(v230);
    swift_task_dealloc(v231);
    swift_task_dealloc(v232);
    swift_task_dealloc(v233);
    swift_task_dealloc(v234);
    swift_task_dealloc(v235);
    swift_task_dealloc(v236);
    swift_task_dealloc(v237);
    swift_task_dealloc(v269);
    swift_task_dealloc(v270);
    swift_task_dealloc(v271);
    swift_task_dealloc(v272);
    swift_task_dealloc(v273);
    swift_task_dealloc(v274);
    swift_task_dealloc(v275);
    swift_task_dealloc(v276);
    swift_task_dealloc(v277);
    swift_task_dealloc(v278);
    swift_task_dealloc(v279);
    swift_task_dealloc(v280);
    swift_task_dealloc(v281);
    swift_task_dealloc(v282);
    swift_task_dealloc(v283);
    swift_task_dealloc(v284);
    swift_task_dealloc(v285);
    swift_task_dealloc(v286);
    swift_task_dealloc(v287);
    swift_task_dealloc(v288);
    swift_task_dealloc(v289);
    swift_task_dealloc(v290);
    swift_task_dealloc(v291);
    swift_task_dealloc(v292);
    swift_task_dealloc(v293);
    swift_task_dealloc(v294);
    swift_task_dealloc(v295);
    swift_task_dealloc(v296);
    swift_task_dealloc(v297);
    swift_task_dealloc(v298);
    swift_task_dealloc(v299);
    swift_task_dealloc(v300);
    swift_task_dealloc(v301);
    swift_task_dealloc(v302);
    swift_task_dealloc(v303);
    swift_task_dealloc(v304);
    swift_task_dealloc(v305);
    swift_task_dealloc(v306);
    swift_task_dealloc(v307);
    swift_task_dealloc(v308);
    swift_task_dealloc(v309);
    swift_task_dealloc(v310);
    swift_task_dealloc(v311);
    swift_task_dealloc(v312);
    swift_task_dealloc(v313);
    swift_task_dealloc(v314);
    swift_task_dealloc(v315);
    swift_task_dealloc(v316);
    swift_task_dealloc(v317);
    swift_task_dealloc(v318);
    swift_task_dealloc(v319);
    swift_task_dealloc(v320);
    swift_task_dealloc(v321);
    swift_task_dealloc(v322);
    swift_task_dealloc(v323);
    swift_task_dealloc(v324);
    swift_task_dealloc(v325);
    swift_task_dealloc(v326);
    swift_task_dealloc(v327);
    swift_task_dealloc(v328);
    swift_task_dealloc(v329);
    swift_task_dealloc(v330);
    swift_task_dealloc(v331);
    swift_task_dealloc(v332);
    swift_task_dealloc(v333);
    swift_task_dealloc(v334);
    swift_task_dealloc(v335);
    swift_task_dealloc(v336);
    swift_task_dealloc(v337);
    swift_task_dealloc(v338);
    swift_task_dealloc(v339);
    swift_task_dealloc(v340);
    swift_task_dealloc(v341);
    swift_task_dealloc(v342);
    swift_task_dealloc(v344);
    swift_task_dealloc(v346);
    swift_task_dealloc(v348);
    swift_task_dealloc(v350);
    swift_task_dealloc(v352);
    swift_task_dealloc(v354);
    swift_task_dealloc(v357);
    swift_task_dealloc(v360);
    swift_task_dealloc(v363);
    swift_task_dealloc(v366);
    swift_task_dealloc(v371);
    swift_task_dealloc(v376);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v268);
  }

  uint64_t v177 = swift_allocObject(&unk_1000357E0, 24LL, 7LL);
  *(void *)(v0 + 1680) = v177;
  *(void *)(v177 + 16) = &_swiftEmptySetSingleton;
  uint64_t v178 = *(void *)(v0 + 304);
  *(void *)(v0 + 1688) = v178;
  uint64_t v179 = *(void *)(v178 + 16);
  *(void *)(v0 + 1696) = v179;
  if (v179)
  {
    uint64_t v180 = *(void *)(v0 + 808);
    *(_DWORD *)(v0 + 1912) = *(_DWORD *)(v180 + 80);
    *(void *)(v0 + 1704) = *(void *)(v180 + 72);
    uint64_t v181 = *(void (**)(void, void))(v0 + 1456);
    swift_bridgeObjectRetain(v178);
    uint64_t v182 = 0LL;
    v368 = v181;
    do
    {
      *(void *)(v0 + 1736) = v182;
      *(void *)(v0 + 1728) = v181;
      *(void *)(v0 + 1720) = v181;
      *(void *)(v0 + 1712) = v181;
      uint64_t v183 = *(void *)(v0 + 824);
      uint64_t v184 = *(void *)(v0 + 744);
      sub_1000087B8( *(void *)(v0 + 1688)
      + ((*(unsigned __int8 *)(v0 + 1912) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1912))
      + *(void *)(v0 + 1704) * v182,
        v183,
        type metadata accessor for TaskRecord);
      uint64_t v185 = *(void *)(v183 + 32);
      unint64_t v186 = *(void *)(v183 + 40);
      sub_1000085F8(v185, v186);
      uint64_t v187 = sub_100009FBC( &qword_1000388A8,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition,  (uint64_t)&protocol conformance descriptor for TaskDefinition);
      dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v184, v185, v186, v184, v187);
      if (!v14)
      {
        uint64_t v239 = *(void *)(v0 + 776);
        uint64_t v240 = *(void *)(v0 + 752);
        uint64_t v241 = *(void *)(v0 + 744);
        uint64_t v242 = *(void *)(v0 + 728);
        sub_1000085B4(v185, v186);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v240 + 56))(v242, 0LL, 1LL, v241);
        uint64_t v243 = *(void (**)(uint64_t, uint64_t, uint64_t))(v240 + 32);
        *(void *)(v0 + 1744) = v243;
        v243(v239, v242, v241);
        uint64_t v244 = async function pointer to dispatch thunk of MLHostClient.addTask(taskDefinition:);
        *(void *)(v0 + 1752) = v245;
        *uint64_t v245 = v0;
        v245[1] = sub_1000102C4;
      }

      v374 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
      uint64_t v188 = *(void *)(v0 + 1432);
      uint64_t v189 = *(void *)(v0 + 1288);
      uint64_t v190 = *(void *)(v0 + 960);
      uint64_t v191 = *(void *)(v0 + 752);
      uint64_t v192 = *(void *)(v0 + 744);
      uint64_t v193 = *(void *)(v0 + 728);
      swift_errorRelease(v14);
      sub_1000085B4(v185, v186);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v191 + 56))(v193, 1LL, 1LL, v192);
      sub_100008880(v193, &qword_100038808);
      uint64_t v194 = v374(v189, v188, v190);
      uint64_t v195 = (os_log_s *)Logger.logObject.getter(v194);
      os_log_type_t v196 = static os_log_type_t.error.getter();
      BOOL v197 = os_log_type_enabled(v195, v196);
      uint64_t v198 = *(void *)(v0 + 1288);
      uint64_t v199 = *(void *)(v0 + 960);
      uint64_t v200 = *(void *)(v0 + 824);
      if (v197)
      {
        uint64_t v201 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        v378 = 0LL;
        v379[0] = 0LL;
        *(_WORD *)uint64_t v201 = 0;
        v377[0] = (uint64_t)(v201 + 2);
        uint64_t v14 = 0LL;
        sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v377, (uint64_t)&v378, (uint64_t)v379);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        _os_log_impl( (void *)&_mh_execute_header,  v195,  v196,  "Failed to parse TaskDefinition from config file, skipping task.",  v201,  2u);
        swift_slowDealloc(v201, -1LL, -1LL);

        uint64_t v181 = v368;
        v368(v198, v199);
        sub_1000087FC(v200, type metadata accessor for TaskRecord);
      }

      else
      {
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);

        uint64_t v181 = v368;
        v368(v198, v199);
        sub_1000087FC(v200, type metadata accessor for TaskRecord);
        uint64_t v14 = 0LL;
      }

      uint64_t v182 = *(void *)(v0 + 1736) + 1LL;
    }

    while (v182 != *(void *)(v0 + 1696));
    swift_bridgeObjectRelease(*(void *)(v0 + 1688));
    uint64_t v177 = *(void *)(v0 + 1680);
  }

  uint64_t v246 = *(void *)(v0 + 1448);
  (*(void (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1280),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
  uint64_t v247 = (void *)v0;
  uint64_t v248 = swift_allocObject(&unk_100035808, 32LL, 7LL);
  *(void *)(v248 + 16) = sub_10002CBDC;
  *(void *)(v248 + 24) = v177;
  uint64_t v249 = swift_retain(v177);
  v250 = (os_log_s *)Logger.logObject.getter(v249);
  os_log_type_t v251 = static os_log_type_t.info.getter();
  uint64_t v252 = swift_allocObject(&unk_100035830, 17LL, 7LL);
  *(_BYTE *)(v252 + 16) = 32;
  uint64_t v253 = swift_allocObject(&unk_100035858, 17LL, 7LL);
  *(_BYTE *)(v253 + 16) = 8;
  uint64_t v254 = swift_allocObject(&unk_100035880, 32LL, 7LL);
  *(void *)(v254 + 16) = sub_10002C820;
  *(void *)(v254 + 24) = v248;
  uint64_t v255 = swift_allocObject(&unk_1000358A8, 32LL, 7LL);
  *(void *)(v255 + 16) = sub_10002E010;
  *(void *)(v255 + 24) = v254;
  uint64_t v256 = swift_allocObject(v246, 80LL, 7LL);
  *(_OWORD *)(v256 + 16) = xmmword_10002FBB0;
  *(void *)(v256 + 32) = sub_10002E258;
  *(void *)(v256 + 40) = v252;
  *(void *)(v256 + 48) = sub_10002E258;
  *(void *)(v256 + 56) = v253;
  *(void *)(v256 + 64) = sub_10002E01C;
  *(void *)(v256 + 72) = v255;
  swift_retain(v252);
  swift_retain(v253);
  swift_retain(v255);
  swift_bridgeObjectRelease(v256);
  if (os_log_type_enabled(v250, v251))
  {
    v257 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v258 = swift_slowAlloc(32LL, -1LL);
    v378 = 0LL;
    v379[0] = v258;
    *(_WORD *)v257 = 258;
    v257[2] = *(_BYTE *)(v252 + 16);
    uint64_t v72 = v14;
    if (v14) {
      return swift_errorRelease(v72);
    }
    swift_release(v252);
    v257[3] = *(_BYTE *)(v253 + 16);
    v377[0] = (uint64_t)(v257 + 4);
    swift_release(v253);
    sub_100029290(v377, (uint64_t)&v378, v379, *(uint64_t (**)(void))(v255 + 16));
    v259 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
    uint64_t v264 = v247[160];
    uint64_t v265 = v247[120];
    swift_release(v255);
    _os_log_impl((void *)&_mh_execute_header, v250, v251, "Computed addedTaskNames: %s", v257, 0xCu);
    swift_arrayDestroy(v258, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v258, -1LL, -1LL);
    swift_slowDealloc(v257, -1LL, -1LL);

    uint64_t v262 = v264;
    uint64_t v263 = v265;
  }

  else
  {
    v259 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
    uint64_t v260 = v247[160];
    uint64_t v261 = v247[120];
    swift_release(v252);
    swift_release(v253);
    swift_release(v255);

    uint64_t v262 = v260;
    uint64_t v263 = v261;
  }

  v259(v262, v263);
  uint64_t v266 = async function pointer to dispatch thunk of MLHostClient.getTasks();
  v247[221] = v267;
  void *v267 = v247;
  v267[1] = sub_100011288;
  return ((uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of MLHostClient.getTasks() + v266))();
}

    sub_10002AF18((void **)&v24, (const void **)&v23, &v22);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_1000102C4(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 1752);
  *(void *)(*v2 + 1760) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    swift_errorRelease(v1);
    uint64_t v6 = sub_10002330C;
  }

  else
  {
    *(_BYTE *)(v4 + 1916) = a1 & 1;
    uint64_t v6 = sub_100010388;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_100010388()
{
  if ((*(_BYTE *)(v0 + 1916) & 1) == 0)
  {
    uint64_t v22 = *(void *)(v0 + 1760);
    uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1744);
    uint64_t v27 = *(void *)(v0 + 1448);
    uint64_t v28 = *(void *)(v0 + 776);
    uint64_t v29 = *(void *)(v0 + 768);
    uint64_t v30 = *(void *)(v0 + 760);
    uint64_t v31 = *(void *)(v0 + 752);
    uint64_t v32 = *(void *)(v0 + 744);
    (*(void (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1296),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v29, v28, v32);
    uint64_t v33 = *(unsigned __int8 *)(v31 + 80);
    uint64_t v34 = (v33 + 16) & ~v33;
    uint64_t v35 = swift_allocObject(&unk_100037130, v34 + v30, v33 | 7);
    uint64_t v36 = v26(v35 + v34, v29, v32);
    uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
    os_log_type_t v38 = static os_log_type_t.error.getter();
    uint64_t v39 = swift_allocObject(&unk_100037158, 17LL, 7LL);
    *(_BYTE *)(v39 + 16) = 32;
    uint64_t v40 = swift_allocObject(&unk_100037180, 17LL, 7LL);
    *(_BYTE *)(v40 + 16) = 8;
    uint64_t v41 = swift_allocObject(&unk_1000371A8, 32LL, 7LL);
    *(void *)(v41 + 16) = sub_10002D964;
    *(void *)(v41 + 24) = v35;
    uint64_t v42 = swift_allocObject(&unk_1000371D0, 32LL, 7LL);
    *(void *)(v42 + 16) = sub_10002E010;
    *(void *)(v42 + 24) = v41;
    uint64_t v43 = swift_allocObject(v27, 80LL, 7LL);
    *(_OWORD *)(v43 + 16) = xmmword_10002FBB0;
    *(void *)(v43 + 32) = sub_10002E258;
    *(void *)(v43 + 40) = v39;
    *(void *)(v43 + 48) = sub_10002E258;
    *(void *)(v43 + 56) = v40;
    *(void *)(v43 + 64) = sub_10002E01C;
    *(void *)(v43 + 72) = v42;
    swift_retain(v39);
    swift_retain(v40);
    swift_retain(v42);
    swift_bridgeObjectRelease(v43);
    if (os_log_type_enabled(v37, v38))
    {
      os_log_type_t v159 = v38;
      log = v37;
      uint64_t v44 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v45 = swift_slowAlloc(32LL, -1LL);
      *(void *)(v0 + 368) = 0LL;
      *(void *)(v0 + 376) = v45;
      *(_WORD *)uint64_t v44 = 258;
      v44[2] = *(_BYTE *)(v39 + 16);
      *(void *)(v0 + 360) = v44 + 3;
      if (v22) {
        return swift_errorRelease(v22);
      }
      uint64_t v46 = v45;
      swift_release(v39);
      uint64_t v47 = *(_BYTE **)(v0 + 360);
      *uint64_t v47 = *(_BYTE *)(v40 + 16);
      *(void *)(v0 + 360) = v47 + 1;
      swift_release(v40);
      sub_100029290((uint64_t *)(v0 + 360), v0 + 368, (uint64_t *)(v0 + 376), *(uint64_t (**)(void))(v42 + 16));
      uint64_t v166 = (os_log_s **)(v0 + 1720);
      uint64_t v48 = *(void *)(v0 + 1296);
      uint64_t v49 = *(void *)(v0 + 960);
      uint64_t v155 = *(void (**)(uint64_t, uint64_t))(v0 + 1720);
      uint64_t v156 = *(void *)(v0 + 824);
      uint64_t v50 = *(void *)(v0 + 776);
      uint64_t v51 = *(void *)(v0 + 752);
      uint64_t v52 = *(void *)(v0 + 744);
      swift_release(v42);
      _os_log_impl((void *)&_mh_execute_header, log, v159, "Invalid remote reply for taskName: %s", v44, 0xCu);
      swift_arrayDestroy(v46, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v46, -1LL, -1LL);
      swift_slowDealloc(v44, -1LL, -1LL);

      v155(v48, v49);
      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v52);
      uint64_t v53 = v156;
    }

    else
    {
      uint64_t v73 = *(void *)(v0 + 1296);
      uint64_t v74 = *(void *)(v0 + 960);
      os_log_t logb = *(os_log_t *)(v0 + 824);
      uint64_t v166 = (os_log_s **)(v0 + 1728);
      uint64_t v157 = *(void *)(v0 + 776);
      uint64_t v160 = *(void (**)(uint64_t, uint64_t))(v0 + 1728);
      uint64_t v75 = *(void *)(v0 + 752);
      uint64_t v76 = *(void *)(v0 + 744);

      swift_release(v42);
      swift_release(v40);
      swift_release(v39);
      v160(v73, v74);
      (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v157, v76);
      uint64_t v53 = (uint64_t)logb;
    }

    sub_1000087FC(v53, type metadata accessor for TaskRecord);
    uint64_t v77 = *(void *)(v0 + 1488);
    uint64_t v78 = *(void *)(v77 + 48);
    BOOL v61 = __OFADD__(v78, 1LL);
    uint64_t v79 = v78 + 1;
    if (!v61)
    {
      BOOL v80 = *v166;
      *(void *)(v77 + 48) = v79;
      os_log_t loga = *(os_log_t *)(v0 + 1720);
      uint64_t v63 = *(os_log_s **)(v0 + 1712);
      goto LABEL_21;
    }

    __break(1u);
LABEL_39:
    __break(1u);
  }

  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1744);
  uint64_t v2 = *(void *)(v0 + 1448);
  uint64_t v3 = *(void *)(v0 + 776);
  uint64_t v4 = *(void *)(v0 + 768);
  uint64_t v5 = *(void *)(v0 + 760);
  uint64_t v6 = *(void *)(v0 + 752);
  uint64_t v7 = *(void *)(v0 + 744);
  (*(void (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1304),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v7);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = (v8 + 16) & ~v8;
  uint64_t v10 = swift_allocObject(&unk_1000371F8, v9 + v5, v8 | 7);
  uint64_t v11 = v1(v10 + v9, v4, v7);
  id v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  uint64_t v14 = swift_allocObject(&unk_100037220, 17LL, 7LL);
  *(_BYTE *)(v14 + 16) = 32;
  uint64_t v15 = swift_allocObject(&unk_100037248, 17LL, 7LL);
  *(_BYTE *)(v15 + 16) = 8;
  uint64_t v16 = swift_allocObject(&unk_100037270, 32LL, 7LL);
  *(void *)(v16 + 16) = sub_10002D964;
  *(void *)(v16 + 24) = v10;
  uint64_t v17 = swift_allocObject(&unk_100037298, 32LL, 7LL);
  *(void *)(v17 + 16) = sub_10002E010;
  *(void *)(v17 + 24) = v16;
  uint64_t v18 = swift_allocObject(v2, 80LL, 7LL);
  *(_OWORD *)(v18 + 16) = xmmword_10002FBB0;
  *(void *)(v18 + 32) = sub_10002E258;
  *(void *)(v18 + 40) = v14;
  *(void *)(v18 + 48) = sub_10002E258;
  *(void *)(v18 + 56) = v15;
  *(void *)(v18 + 64) = sub_10002E01C;
  *(void *)(v18 + 72) = v17;
  swift_retain(v14);
  swift_retain(v15);
  swift_retain(v17);
  swift_bridgeObjectRelease(v18);
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v19 = *(void *)(v0 + 1760);
    os_log_type_t v20 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v21 = swift_slowAlloc(32LL, -1LL);
    *(void *)(v0 + 400) = 0LL;
    *(void *)(v0 + 408) = v21;
    *(_WORD *)os_log_type_t v20 = 258;
    v20[2] = *(_BYTE *)(v14 + 16);
    *(void *)(v0 + 392) = v20 + 3;
    uint64_t v22 = *(void *)(v0 + 1760);
    if (v19) {
      return swift_errorRelease(v22);
    }
    uint64_t v23 = v21;
    swift_release(v14);
    uint64_t v24 = *(_BYTE **)(v0 + 392);
    *uint64_t v24 = *(_BYTE *)(v15 + 16);
    *(void *)(v0 + 392) = v24 + 1;
    uint64_t v25 = *(void *)(v0 + 1760);
    if (v22)
    {
      uint64_t v22 = *(void *)(v0 + 1760);
      return swift_errorRelease(v22);
    }

    swift_release(v15);
    sub_100029290((uint64_t *)(v0 + 392), v0 + 400, (uint64_t *)(v0 + 408), *(uint64_t (**)(void))(v17 + 16));
    if (v25)
    {
      uint64_t v22 = *(void *)(v0 + 1760);
      return swift_errorRelease(v22);
    }

    uint64_t v54 = (os_log_s **)(v0 + 1456);
    uint64_t v152 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1456);
    uint64_t v153 = *(void *)(v0 + 1304);
    uint64_t v154 = *(void *)(v0 + 960);
    swift_release(v17);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Task %s is successfully registered.", v20, 0xCu);
    swift_arrayDestroy(v23, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);

    uint64_t v58 = v152(v153, v154);
  }

  else
  {
    uint64_t v54 = (os_log_s **)(v0 + 1712);
    uint64_t v55 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1712);
    uint64_t v56 = *(void *)(v0 + 1304);
    uint64_t v57 = *(void *)(v0 + 960);
    swift_release(v14);
    swift_release(v15);
    swift_release(v17);

    uint64_t v58 = v55(v56, v57);
  }

  uint64_t v59 = *(void *)(v0 + 1488);
  uint64_t v60 = *(void *)(v59 + 40);
  BOOL v61 = __OFADD__(v60, 1LL);
  uint64_t v62 = v60 + 1;
  if (v61) {
    goto LABEL_39;
  }
  uint64_t v63 = *v54;
  uint64_t v64 = *(void *)(v0 + 880);
  uint64_t v65 = *(void *)(v0 + 872);
  uint64_t v66 = *(void *)(v0 + 824);
  uint64_t v67 = *(void *)(v0 + 800);
  uint64_t v68 = *(void *)(v0 + 720);
  *(void *)(v59 + 40) = v62;
  uint64_t v69 = TaskDefinition.name.getter(v58);
  sub_10002959C((uint64_t *)(v0 + 224), v69, v70);
  swift_bridgeObjectRelease(*(void *)(v0 + 232));
  sub_10002DA68(v66 + *(int *)(v67 + 36), v68);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48))(v68, 1LL, v65) == 1)
  {
    uint64_t v71 = *(void *)(v0 + 824);
    uint64_t v72 = *(void *)(v0 + 720);
    (*(void (**)(void, void))(*(void *)(v0 + 752) + 8LL))(*(void *)(v0 + 776), *(void *)(v0 + 744));
    sub_1000087FC(v71, type metadata accessor for TaskRecord);
    sub_100008880(v72, &qword_1000383B0);
  }

  else
  {
    uint64_t v81 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 1480);
    uint64_t v82 = *(void *)(v0 + 920);
    uint64_t v83 = *(void *)(v0 + 896);
    uint64_t v84 = *(void *)(v0 + 872);
    uint64_t v85 = (*(uint64_t (**)(uint64_t, void, uint64_t))(v0 + 1616))(v83, *(void *)(v0 + 720), v84);
    static Date.now.getter(v85);
    LOBYTE(v83) = sub_100026510(v83, v82);
    uint64_t v86 = v81(v82, v84);
    if ((v83 & 1) != 0)
    {
      uint64_t v161 = v63;
      uint64_t v87 = *(void (**)(uint64_t, uint64_t))(v0 + 1480);
      uint64_t v88 = *(void *)(v0 + 920);
      uint64_t v89 = *(void *)(v0 + 896);
      uint64_t v90 = *(void *)(v0 + 872);
      uint64_t v167 = *(void *)(v0 + 824);
      uint64_t v91 = *(void *)(v0 + 776);
      uint64_t v92 = *(void *)(v0 + 752);
      uint64_t v93 = *(void *)(v0 + 744);
      static Date.now.getter(v86);
      double v94 = Date.distance(to:)(v88);
      v87(v88, v90);
      sub_100026390(v94);
      v87(v89, v90);
      uint64_t v63 = v161;
      (*(void (**)(uint64_t, uint64_t))(v92 + 8))(v91, v93);
      uint64_t v95 = v167;
    }

    else
    {
      uint64_t v96 = *(void *)(v0 + 824);
      uint64_t v97 = *(void *)(v0 + 776);
      uint64_t v98 = *(void *)(v0 + 752);
      uint64_t v99 = *(void *)(v0 + 744);
      (*(void (**)(void, void))(v0 + 1480))(*(void *)(v0 + 896), *(void *)(v0 + 872));
      (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v97, v99);
      uint64_t v95 = v96;
    }

    sub_1000087FC(v95, type metadata accessor for TaskRecord);
  }

  uint64_t v22 = *(void *)(v0 + 1760);
  os_log_t loga = v63;
  BOOL v80 = v63;
LABEL_21:
  uint64_t v100 = *(void *)(v0 + 1736) + 1LL;
  if (v100 == *(void *)(v0 + 1696))
  {
LABEL_22:
    swift_bridgeObjectRelease(*(void *)(v0 + 1688));
    uint64_t v101 = *(void *)(v0 + 1680);
    uint64_t v102 = *(void *)(v0 + 1448);
    (*(void (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1280),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
    uint64_t v103 = swift_allocObject(&unk_100035808, 32LL, 7LL);
    *(void *)(v103 + 16) = sub_10002CBDC;
    *(void *)(v103 + 24) = v101;
    uint64_t v104 = swift_retain(v101);
    uint64_t v105 = (os_log_s *)Logger.logObject.getter(v104);
    os_log_type_t v106 = static os_log_type_t.info.getter();
    uint64_t v107 = swift_allocObject(&unk_100035830, 17LL, 7LL);
    *(_BYTE *)(v107 + 16) = 32;
    uint64_t v108 = swift_allocObject(&unk_100035858, 17LL, 7LL);
    *(_BYTE *)(v108 + 16) = 8;
    uint64_t v109 = swift_allocObject(&unk_100035880, 32LL, 7LL);
    *(void *)(v109 + 16) = sub_10002C820;
    *(void *)(v109 + 24) = v103;
    uint64_t v110 = swift_allocObject(&unk_1000358A8, 32LL, 7LL);
    *(void *)(v110 + 16) = sub_10002E010;
    *(void *)(v110 + 24) = v109;
    uint64_t v111 = swift_allocObject(v102, 80LL, 7LL);
    *(_OWORD *)(v111 + 16) = xmmword_10002FBB0;
    *(void *)(v111 + 32) = sub_10002E258;
    *(void *)(v111 + 40) = v107;
    *(void *)(v111 + 48) = sub_10002E258;
    *(void *)(v111 + 56) = v108;
    *(void *)(v111 + 64) = sub_10002E01C;
    *(void *)(v111 + 72) = v110;
    swift_retain(v107);
    swift_retain(v108);
    swift_retain(v110);
    swift_bridgeObjectRelease(v111);
    if (os_log_type_enabled(v105, v106))
    {
      uint64_t v112 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v113 = swift_slowAlloc(32LL, -1LL);
      uint64_t v170 = 0LL;
      uint64_t v171 = v113;
      *(_WORD *)uint64_t v112 = 258;
      v112[2] = *(_BYTE *)(v107 + 16);
      if (v22) {
        return swift_errorRelease(v22);
      }
      uint64_t v147 = v113;
      swift_release(v107);
      v112[3] = *(_BYTE *)(v108 + 16);
      v169[0] = (uint64_t)(v112 + 4);
      swift_release(v108);
      sub_100029290(v169, (uint64_t)&v170, &v171, *(uint64_t (**)(void))(v110 + 16));
      v134 = (void *)v0;
      uint64_t v135 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v148 = v134[160];
      uint64_t v149 = v134[120];
      swift_release(v110);
      _os_log_impl((void *)&_mh_execute_header, v105, v106, "Computed addedTaskNames: %s", v112, 0xCu);
      swift_arrayDestroy(v147, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v147, -1LL, -1LL);
      swift_slowDealloc(v112, -1LL, -1LL);

      uint64_t v138 = v148;
      uint64_t v139 = v149;
    }

    else
    {
      v134 = (void *)v0;
      uint64_t v135 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v136 = v134[160];
      uint64_t v137 = v134[120];
      swift_release(v107);
      swift_release(v108);
      swift_release(v110);

      uint64_t v138 = v136;
      uint64_t v139 = v137;
    }

    v135(v138, v139);
    uint64_t v150 = async function pointer to dispatch thunk of MLHostClient.getTasks();
    v134[221] = v151;
    *uint64_t v151 = v134;
    v151[1] = sub_100011288;
    return ((uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of MLHostClient.getTasks() + v150))();
  }

  else
  {
    uint64_t v158 = v80;
    id v162 = v63;
    while (1)
    {
      *(void *)(v0 + 1736) = v100;
      *(void *)(v0 + 1728) = v80;
      *(void *)(v0 + 1720) = loga;
      *(void *)(v0 + 1712) = v63;
      uint64_t v115 = *(void *)(v0 + 824);
      uint64_t v116 = *(void *)(v0 + 744);
      sub_1000087B8( *(void *)(v0 + 1688)
      + ((*(unsigned __int8 *)(v0 + 1912) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1912))
      + *(void *)(v0 + 1704) * v100,
        v115,
        type metadata accessor for TaskRecord);
      uint64_t v117 = *(void *)(v115 + 32);
      unint64_t v118 = *(void *)(v115 + 40);
      sub_1000085F8(v117, v118);
      uint64_t v119 = sub_100009FBC( &qword_1000388A8,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition,  (uint64_t)&protocol conformance descriptor for TaskDefinition);
      dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v116, v117, v118, v116, v119);
      if (!v22) {
        break;
      }
      uint64_t v168 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
      uint64_t v120 = *(void *)(v0 + 1432);
      uint64_t v121 = *(void *)(v0 + 1288);
      uint64_t v122 = *(void *)(v0 + 960);
      uint64_t v123 = *(void *)(v0 + 752);
      uint64_t v124 = *(void *)(v0 + 744);
      uint64_t v125 = *(void *)(v0 + 728);
      swift_errorRelease(v22);
      sub_1000085B4(v117, v118);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v123 + 56))(v125, 1LL, 1LL, v124);
      sub_100008880(v125, &qword_100038808);
      uint64_t v126 = v168(v121, v120, v122);
      uint64_t v127 = (os_log_s *)Logger.logObject.getter(v126);
      os_log_type_t v128 = static os_log_type_t.error.getter();
      BOOL v129 = os_log_type_enabled(v127, v128);
      uint64_t v130 = *(void *)(v0 + 1288);
      uint64_t v131 = *(void *)(v0 + 960);
      uint64_t v132 = *(void *)(v0 + 824);
      if (v129)
      {
        uint64_t v133 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        uint64_t v170 = 0LL;
        uint64_t v171 = 0LL;
        *(_WORD *)uint64_t v133 = 0;
        v169[0] = (uint64_t)(v133 + 2);
        uint64_t v22 = 0LL;
        sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v169, (uint64_t)&v170, (uint64_t)&v171);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        _os_log_impl( (void *)&_mh_execute_header,  v127,  v128,  "Failed to parse TaskDefinition from config file, skipping task.",  v133,  2u);
        swift_slowDealloc(v133, -1LL, -1LL);

        BOOL v80 = v158;
        ((void (*)(uint64_t, uint64_t))v158)(v130, v131);
        sub_1000087FC(v132, type metadata accessor for TaskRecord);
      }

      else
      {
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);

        BOOL v80 = v158;
        ((void (*)(uint64_t, uint64_t))v158)(v130, v131);
        sub_1000087FC(v132, type metadata accessor for TaskRecord);
        uint64_t v22 = 0LL;
      }

      uint64_t v100 = *(void *)(v0 + 1736) + 1LL;
      uint64_t v63 = v162;
      if (v100 == *(void *)(v0 + 1696)) {
        goto LABEL_22;
      }
    }

    uint64_t v140 = *(void *)(v0 + 776);
    uint64_t v141 = *(void *)(v0 + 752);
    uint64_t v142 = *(void *)(v0 + 744);
    uint64_t v143 = *(void *)(v0 + 728);
    sub_1000085B4(v117, v118);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v141 + 56))(v143, 0LL, 1LL, v142);
    uint64_t v144 = *(void (**)(uint64_t, uint64_t, uint64_t))(v141 + 32);
    *(void *)(v0 + 1744) = v144;
    v144(v140, v143, v142);
    uint64_t v145 = async function pointer to dispatch thunk of MLHostClient.addTask(taskDefinition:);
    *(void *)(v0 + 1752) = v146;
    *uint64_t v146 = v0;
    v146[1] = sub_1000102C4;
  }

uint64_t sub_100011288(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 1768);
  *(void *)(*v2 + 1776) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    swift_errorRelease(v1);
    uint64_t v6 = sub_100020F0C;
  }

  else
  {
    *(void *)(v4 + 1784) = a1;
    uint64_t v6 = sub_100011348;
  }

  return swift_task_switch(v6, 0LL, 0LL);
}

uint64_t sub_100011348()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 8;
  uint64_t v3 = v0[223];
  uint64_t v4 = (os_log_s *)v0[222];
  uint64_t v5 = v0[210];
  uint64_t v6 = sub_10002CCE8(v3);
  v985 = v4;
  v1[224] = v6;
  swift_bridgeObjectRelease(v3);
  uint64_t v7 = swift_allocObject(&unk_1000357E0, 24LL, 7LL);
  v1[225] = v7;
  swift_beginAccess(v5 + 16, v2, 0LL, 0LL);
  uint64_t v8 = *(void *)(v5 + 16);
  *(void *)(v7 + 16) = v8;
  uint64_t v9 = v6[2];
  uint64_t v10 = &loc_10002F000;
  v1033 = v1;
  if (v9)
  {
    uint64_t v911 = v7;
    v949 = v1 + 20;
    uint64_t v11 = v1[84];
    uint64_t v12 = v1[75];
    uint64_t v931 = v1[71];
    uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
    uint64_t v14 = (char *)v6 + ((v13 + 32) & ~v13);
    unsigned int v15 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v973 = ((v13 + 16) & ~v13) + v1[85];
    uint64_t v978 = (v13 + 16) & ~v13;
    uint64_t v969 = v13 | 7;
    uint64_t v992 = *(void *)(v11 + 72);
    v1018 = *(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 16);
    v961 = (uint64_t (*)(uint64_t, uint64_t))v1[182];
    swift_bridgeObjectRetain(v8);
    v907 = v6;
    swift_bridgeObjectRetain(v6);
    uint64_t v999 = v11;
    uint64_t v940 = v12;
    unsigned int v924 = v15;
    do
    {
      uint64_t v17 = v1018(v1[89], v14, v1[83]);
      uint64_t v18 = MLHostTask.taskFolder.getter(v17);
      uint64_t v1022 = v9;
      if (v19)
      {
        uint64_t v20 = v18;
        uint64_t v21 = v19;
        uint64_t v22 = v1[73];
        uint64_t v23 = v1[72];
        (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v940 + 56))(v22, 1LL, 1LL, v1[74]);
        uint64_t v24 = type metadata accessor for URL.DirectoryHint(0LL);
        uint64_t v25 = *(void (**)(uint64_t, void, uint64_t))(*(void *)(v24 - 8) + 104LL);
        v25(v23, v924, v24);
        URL.init(filePath:directoryHint:relativeTo:)(v20, v21, v23, v22);
        if (qword_1000383A0 != -1) {
          swift_once(&qword_1000383A0, sub_10000B000);
        }
        uint64_t v26 = v1[82];
        uint64_t v27 = v1[81];
        uint64_t v28 = v1[74];
        uint64_t v29 = v1[72];
        uint64_t v30 = v1[70];
        uint64_t v31 = *(void *)algn_100038788;
        v1033[20] = qword_100038780;
        v1033[21] = v31;
        v25(v29, v924, v24);
        unint64_t v32 = sub_100028A54();
        uint64_t v33 = v31;
        uint64_t v1 = v1033;
        swift_bridgeObjectRetain(v33);
        URL.appending<A>(path:directoryHint:)(v949, v29, &type metadata for String, v32);
        (*(void (**)(uint64_t, uint64_t))(v931 + 8))(v29, v30);
        swift_bridgeObjectRelease(v1033[21]);
        uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v940 + 8);
        v34(v27, v28);
        object = URL.path(percentEncoded:)(0)._object;
        v34(v26, v28);
        id v36 = [(id)objc_opt_self(NSFileManager) defaultManager];
        NSString v37 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(object);
        LODWORD(object) = [v36 fileExistsAtPath:v37];

        if ((_DWORD)object)
        {
          uint64_t v38 = v1033[181];
          uint64_t v39 = (char *)v1033[89];
          uint64_t v40 = v1033[88];
          uint64_t v41 = v1033[83];
          ((void (*)(void, void, void))v1033[180])(v1033[159], v1033[179], v1033[120]);
          v1018(v40, v39, v41);
          uint64_t v42 = swift_allocObject(&unk_100037068, v973, v969);
          uint64_t v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v999 + 32))(v42 + v978, v40, v41);
          uint64_t v44 = (os_log_s *)Logger.logObject.getter(v43);
          os_log_type_t v45 = static os_log_type_t.info.getter();
          uint64_t v46 = swift_allocObject(&unk_100037090, 17LL, 7LL);
          *(_BYTE *)(v46 + 16) = 32;
          uint64_t v47 = swift_allocObject(&unk_1000370B8, 17LL, 7LL);
          *(_BYTE *)(v47 + 16) = 8;
          uint64_t v48 = swift_allocObject(&unk_1000370E0, 32LL, 7LL);
          *(void *)(v48 + 16) = sub_10002D034;
          *(void *)(v48 + 24) = v42;
          uint64_t v49 = swift_allocObject(&unk_100037108, 32LL, 7LL);
          *(void *)(v49 + 16) = sub_10002E010;
          *(void *)(v49 + 24) = v48;
          uint64_t v50 = swift_allocObject(v38, 80LL, 7LL);
          *(_OWORD *)(v50 + 16) = xmmword_10002FBB0;
          *(void *)(v50 + 32) = sub_10002E258;
          *(void *)(v50 + 40) = v46;
          *(void *)(v50 + 48) = sub_10002E258;
          *(void *)(v50 + 56) = v47;
          *(void *)(v50 + 64) = sub_10002E01C;
          *(void *)(v50 + 72) = v49;
          swift_retain(v46);
          swift_retain(v47);
          swift_retain(v49);
          swift_bridgeObjectRelease(v50);
          if (os_log_type_enabled(v44, v45))
          {
            uint64_t v51 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v52 = swift_slowAlloc(32LL, -1LL);
            v1035 = 0LL;
            double v1036 = *(double *)&v52;
            *(_WORD *)uint64_t v51 = 258;
            v51[2] = *(_BYTE *)(v46 + 16);
            if (v985) {
              return swift_errorRelease(v985);
            }
            uint64_t v53 = v52;
            swift_release(v46);
            v51[3] = *(_BYTE *)(v47 + 16);
            v1034[0] = (uint64_t)(v51 + 4);
            swift_release(v47);
            sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v49 + 16));
            uint64_t v54 = v1033[159];
            uint64_t v55 = v1033[120];
            swift_release(v49);
            _os_log_impl( (void *)&_mh_execute_header,  v44,  v45,  "Assets already available. Skipping payload download for task: %s",  v51,  0xCu);
            swift_arrayDestroy(v53, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v53, -1LL, -1LL);
            uint64_t v56 = v51;
            uint64_t v1 = v1033;
            swift_slowDealloc(v56, -1LL, -1LL);

            uint64_t v57 = v54;
            uint64_t v58 = v55;
          }

          else
          {
            uint64_t v84 = v1033[159];
            uint64_t v85 = v1033[120];
            swift_release(v46);
            swift_release(v47);
            swift_release(v49);

            uint64_t v57 = v84;
            uint64_t v58 = v85;
          }

          uint64_t v86 = v961(v57, v58);
          uint64_t v10 = (_OWORD *)&loc_10002F000;
          uint64_t v87 = MLHostTask.name.getter(v86);
          uint64_t v89 = v88;
          sub_10002982C(v87, v88);
          uint64_t v91 = v90;
          swift_bridgeObjectRelease(v89);
          swift_bridgeObjectRelease(v91);
          uint64_t v11 = v999;
        }

        else
        {
          uint64_t v10 = (_OWORD *)&loc_10002F000;
          uint64_t v11 = v999;
        }

        uint64_t v16 = v1022;
        (*(void (**)(void, void))(v11 + 8))(v1[89], v1[83]);
      }

      else
      {
        uint64_t v1009 = v1[181];
        uint64_t v59 = (char *)v1[89];
        uint64_t v60 = v1[88];
        uint64_t v61 = v1[83];
        ((void (*)(void, void, void))v1[180])(v1[158], v1[179], v1[120]);
        v1018(v60, v59, v61);
        uint64_t v62 = swift_allocObject(&unk_1000358D0, v973, v969);
        uint64_t v63 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v62 + v978, v60, v61);
        uint64_t v64 = (os_log_s *)Logger.logObject.getter(v63);
        os_log_type_t v65 = static os_log_type_t.debug.getter();
        uint64_t v66 = swift_allocObject(&unk_1000358F8, 17LL, 7LL);
        *(_BYTE *)(v66 + 16) = 32;
        uint64_t v67 = swift_allocObject(&unk_100035920, 17LL, 7LL);
        *(_BYTE *)(v67 + 16) = 8;
        uint64_t v68 = swift_allocObject(&unk_100035948, 32LL, 7LL);
        *(void *)(v68 + 16) = sub_10002D034;
        *(void *)(v68 + 24) = v62;
        uint64_t v69 = v11;
        uint64_t v70 = swift_allocObject(&unk_100035970, 32LL, 7LL);
        *(void *)(v70 + 16) = sub_10002E010;
        *(void *)(v70 + 24) = v68;
        uint64_t v71 = swift_allocObject(v1009, 80LL, 7LL);
        *(_OWORD *)(v71 + 16) = xmmword_10002FBB0;
        *(void *)(v71 + 32) = sub_10002E258;
        *(void *)(v71 + 40) = v66;
        *(void *)(v71 + 48) = sub_10002E258;
        *(void *)(v71 + 56) = v67;
        *(void *)(v71 + 64) = sub_10002E01C;
        *(void *)(v71 + 72) = v70;
        swift_retain(v66);
        swift_retain(v67);
        swift_retain(v70);
        swift_bridgeObjectRelease(v71);
        if (os_log_type_enabled(v64, v65))
        {
          uint64_t v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v73 = swift_slowAlloc(32LL, -1LL);
          v1035 = 0LL;
          double v1036 = *(double *)&v73;
          *(_WORD *)uint64_t v72 = 258;
          v72[2] = *(_BYTE *)(v66 + 16);
          if (v985) {
            return swift_errorRelease(v985);
          }
          uint64_t v74 = v73;
          swift_release(v66);
          v72[3] = *(_BYTE *)(v67 + 16);
          v1034[0] = (uint64_t)(v72 + 4);
          swift_release(v67);
          sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v70 + 16));
          uint64_t v75 = (void (*)(uint64_t, uint64_t))v1033[182];
          uint64_t v76 = v1033[158];
          uint64_t v77 = v1033[120];
          uint64_t v1010 = v1033[89];
          uint64_t v962 = v1033[83];
          swift_release(v70);
          _os_log_impl( (void *)&_mh_execute_header,  v64,  v65,  "Skipping registeredTask %s due to lack of taskFolder.",  v72,  0xCu);
          swift_arrayDestroy(v74, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v74, -1LL, -1LL);
          uint64_t v78 = v72;
          uint64_t v1 = v1033;
          swift_slowDealloc(v78, -1LL, -1LL);

          v75(v76, v77);
          uint64_t v11 = v999;
          (*(void (**)(uint64_t, uint64_t))(v999 + 8))(v1010, v962);
          v961 = (uint64_t (*)(uint64_t, uint64_t))v1033[182];
          uint64_t v10 = (_OWORD *)&loc_10002F000;
          uint64_t v16 = v1022;
        }

        else
        {
          uint64_t v79 = v1[158];
          uint64_t v80 = v1[120];
          uint64_t v81 = v1[89];
          uint64_t v82 = v64;
          uint64_t v83 = v1[83];

          swift_release(v70);
          swift_release(v67);
          swift_release(v66);
          v961(v79, v80);
          (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v81, v83);
          uint64_t v10 = (_OWORD *)&loc_10002F000;
          uint64_t v11 = v69;
          uint64_t v16 = v1022;
        }
      }

      v14 += v992;
      uint64_t v9 = v16 - 1;
    }

    while (v9);
    swift_bridgeObjectRelease(v907);
    uint64_t v7 = v911;
  }

  else
  {
    swift_bridgeObjectRetain(v8);
  }

  uint64_t v92 = v1[181];
  ((void (*)(void, void, void))v1[180])(v1[157], v1[179], v1[120]);
  uint64_t v93 = swift_allocObject(&unk_100035998, 32LL, 7LL);
  *(void *)(v93 + 16) = sub_10002CBDC;
  *(void *)(v93 + 24) = v7;
  uint64_t v94 = swift_retain(v7);
  uint64_t v95 = (os_log_s *)Logger.logObject.getter(v94);
  os_log_type_t v96 = static os_log_type_t.info.getter();
  uint64_t v97 = swift_allocObject(&unk_1000359C0, 17LL, 7LL);
  *(_BYTE *)(v97 + 16) = 32;
  uint64_t v98 = swift_allocObject(&unk_1000359E8, 17LL, 7LL);
  *(_BYTE *)(v98 + 16) = 8;
  uint64_t v99 = swift_allocObject(&unk_100035A10, 32LL, 7LL);
  *(void *)(v99 + 16) = sub_10002C820;
  *(void *)(v99 + 24) = v93;
  uint64_t v100 = swift_allocObject(&unk_100035A38, 32LL, 7LL);
  *(void *)(v100 + 16) = sub_10002E010;
  *(void *)(v100 + 24) = v99;
  uint64_t v101 = swift_allocObject(v92, 80LL, 7LL);
  __int128 v1019 = v10[187];
  *(_OWORD *)(v101 + 16) = v1019;
  *(void *)(v101 + 32) = sub_10002E258;
  *(void *)(v101 + 40) = v97;
  *(void *)(v101 + 48) = sub_10002E258;
  *(void *)(v101 + 56) = v98;
  *(void *)(v101 + 64) = sub_10002E01C;
  *(void *)(v101 + 72) = v100;
  swift_retain(v97);
  swift_retain(v98);
  swift_retain(v100);
  swift_bridgeObjectRelease(v101);
  if (os_log_type_enabled(v95, v96))
  {
    uint64_t v102 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v103 = swift_slowAlloc(32LL, -1LL);
    v1035 = 0LL;
    double v1036 = *(double *)&v103;
    *(_WORD *)uint64_t v102 = 258;
    v102[2] = *(_BYTE *)(v97 + 16);
    if (v985) {
      return swift_errorRelease(v985);
    }
    uint64_t v104 = v103;
    swift_release(v97);
    v102[3] = *(_BYTE *)(v98 + 16);
    v1034[0] = (uint64_t)(v102 + 4);
    swift_release(v98);
    sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v100 + 16));
    uint64_t v105 = (void (*)(uint64_t, uint64_t))v1[182];
    uint64_t v106 = v1[157];
    uint64_t v107 = v1[120];
    swift_release(v100);
    _os_log_impl((void *)&_mh_execute_header, v95, v96, "Computed payloadsTaskNames: %s", v102, 0xCu);
    swift_arrayDestroy(v104, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v104, -1LL, -1LL);
    swift_slowDealloc(v102, -1LL, -1LL);

    v105(v106, v107);
  }

  else
  {
    uint64_t v108 = (void (*)(uint64_t, uint64_t))v1[182];
    uint64_t v109 = v1[157];
    uint64_t v110 = v1[120];
    swift_release(v97);
    swift_release(v98);
    swift_release(v100);

    v108(v109, v110);
  }

  uint64_t v111 = v1[210];
  uint64_t v112 = swift_allocObject(&unk_100035A60, 24LL, 7LL);
  v1[226] = v112;
  type metadata accessor for TaskParametersRecord(0LL);
  *(void *)(v112 + 16) = _swiftEmptyArrayStorage;
  if (*(void *)(*(void *)(v111 + 16) + 16LL))
  {
    uint64_t v113 = v1[181];
    uint64_t v114 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
    uint64_t v115 = v1[179];
    uint64_t v116 = v1[156];
    uint64_t v117 = v1[120];
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    v114(v116, v115, v117);
    uint64_t v118 = swift_allocObject(&unk_100035A88, 32LL, 7LL);
    *(void *)(v118 + 16) = sub_10002D0F0;
    *(void *)(v118 + 24) = v111;
    uint64_t v119 = swift_retain(v111);
    uint64_t v120 = (void *)Logger.logObject.getter(v119);
    os_log_type_t v121 = static os_log_type_t.info.getter();
    uint64_t v122 = swift_allocObject(&unk_100035AB0, 17LL, 7LL);
    *(_BYTE *)(v122 + 16) = 32;
    uint64_t v123 = swift_allocObject(&unk_100035AD8, 17LL, 7LL);
    *(_BYTE *)(v123 + 16) = 8;
    uint64_t v124 = swift_allocObject(&unk_100035B00, 32LL, 7LL);
    *(void *)(v124 + 16) = sub_10002D108;
    *(void *)(v124 + 24) = v118;
    uint64_t v125 = swift_allocObject(&unk_100035B28, 32LL, 7LL);
    *(void *)(v125 + 16) = sub_10002E010;
    *(void *)(v125 + 24) = v124;
    uint64_t v126 = swift_allocObject(v113, 80LL, 7LL);
    *(_OWORD *)(v126 + 16) = v1019;
    *(void *)(v126 + 32) = sub_10002E258;
    *(void *)(v126 + 40) = v122;
    *(void *)(v126 + 48) = sub_10002E258;
    *(void *)(v126 + 56) = v123;
    *(void *)(v126 + 64) = sub_10002E01C;
    *(void *)(v126 + 72) = v125;
    swift_retain(v122);
    swift_retain(v123);
    swift_retain(v125);
    swift_bridgeObjectRelease(v126);
    if (!os_log_type_enabled((os_log_t)v120, v121))
    {
      uint64_t v203 = (void (*)(uint64_t, uint64_t))v1[182];
      uint64_t v204 = v1[156];
      uint64_t v205 = v1[120];
      swift_release(v122);
      swift_release(v123);
      swift_release(v125);

      v203(v204, v205);
      goto LABEL_53;
    }

    uint64_t v127 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v128 = swift_slowAlloc(32LL, -1LL);
    v1035 = 0LL;
    double v1036 = *(double *)&v128;
    *(_WORD *)uint64_t v127 = 258;
    v127[2] = *(_BYTE *)(v122 + 16);
    if (!v985)
    {
      uint64_t v129 = v128;
      swift_release(v122);
      v127[3] = *(_BYTE *)(v123 + 16);
      v1034[0] = (uint64_t)(v127 + 4);
      swift_release(v123);
      sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v125 + 16));
      uint64_t v1 = v1033;
      uint64_t v130 = (void (*)(uint64_t, uint64_t))v1033[182];
      uint64_t v131 = v1033[156];
      uint64_t v132 = v1033[120];
      swift_release(v125);
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v120,  v121,  "Querying TaskParameters for added tasks: %s",  v127,  0xCu);
      swift_arrayDestroy(v129, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v129, -1LL, -1LL);
      swift_slowDealloc(v127, -1LL, -1LL);

      v130(v131, v132);
LABEL_53:
      uint64_t v206 = v1[210];
      uint64_t v207 = v1[200];
      uint64_t v208 = (void *)v1[193];
      uint64_t v209 = (void *)v1[192];
      uint64_t v210 = v1[191];
      uint64_t v211 = swift_allocObject(v1[198], 112LL, 7LL);
      *(_OWORD *)(v211 + 16) = xmmword_10002FBD0;
      *(void *)(v211 + 56) = &type metadata for String;
      *(void *)(v211 + 64) = v207;
      *(void *)(v211 + 32) = 0x656D614E6B736174LL;
      *(void *)(v211 + 40) = 0xE800000000000000LL;
      uint64_t v212 = *(void *)(v206 + 16);
      uint64_t v213 = swift_bridgeObjectRetain(v212);
      uint64_t v214 = sub_100026580(v213);
      swift_bridgeObjectRelease(v212);
      *(void *)(v211 + 96) = sub_100007B74(&qword_1000388B0);
      *(void *)(v211 + 104) = sub_10002DF08( &qword_1000388B8,  &qword_1000388B0,  (uint64_t)&protocol conformance descriptor for [A]);
      *(void *)(v211 + 72) = v214;
      uint64_t v215 = (NSPredicate *)NSPredicate.init(format:_:)(0x4025204E49204B25LL, 0xE800000000000000LL, v211);
      v216._countAndFlagsBits = 0x617261506B736154LL;
      v216._object = (void *)0xEE0073726574656DLL;
      Class isa = CKQuery.init(recordType:predicate:)(v216, v215).super.isa;
      v1[227] = isa;
      uint64_t v218 = swift_task_alloc(32LL);
      v1[228] = v218;
      *(void *)(v218 + 16) = isa;
      *(void *)(v218 + 24) = v210;
      uint64_t v219 = swift_task_alloc(32LL);
      v1[229] = v219;
      *(void *)(v219 + 16) = &unk_1000388C8;
      *(void *)(v219 + 24) = v218;
      uint64_t v220 = async function pointer to CKDatabase.configuredWith<A>(configuration:group:body:)[1];
      id v221 = v208;
      id v222 = v209;
      uint64_t v223 = (void *)swift_task_alloc(v220);
      v1[230] = v223;
      *uint64_t v223 = v1;
      v223[1] = sub_100017518;
      uint64_t v224 = v1[208];
      uint64_t v225 = v1 + 22;
      uint64_t v226 = &unk_1000388D0;
      return CKDatabase.configuredWith<A>(configuration:group:body:)(v225, v221, v222, v226, v219, v224);
    }

    return swift_errorRelease(v985);
  }

  uint64_t v133 = _swiftEmptyArrayStorage[2];
  if (v133)
  {
    v134 = &_swiftEmptyArrayStorage[6];
    uint64_t v979 = v1[69];
    uint64_t v1000 = v1[65];
    v1011 = (void (*)(uint64_t, uint64_t))v1[182];
    do
    {
      uint64_t v137 = (void *)*((void *)v134 - 1);
      if ((*v134 & 1) != 0)
      {
        uint64_t v1023 = v133;
        uint64_t v138 = v1[181];
        ((void (*)(void, void, void))v1[180])(v1[153], v1[179], v1[120]);
        uint64_t v139 = swift_allocObject(&unk_100035D30, 24LL, 7LL);
        *(void *)(v139 + 16) = v137;
        sub_10002CB60(v137, 1);
        sub_10002CB60(v137, 1);
        uint64_t v140 = swift_errorRetain(v137);
        uint64_t v141 = (os_log_s *)Logger.logObject.getter(v140);
        os_log_type_t v142 = static os_log_type_t.error.getter();
        uint64_t v143 = swift_allocObject(&unk_100035D58, 17LL, 7LL);
        *(_BYTE *)(v143 + 16) = 64;
        uint64_t v144 = swift_allocObject(&unk_100035D80, 17LL, 7LL);
        *(_BYTE *)(v144 + 16) = 8;
        uint64_t v145 = swift_allocObject(&unk_100035DA8, 32LL, 7LL);
        *(void *)(v145 + 16) = sub_10002E250;
        *(void *)(v145 + 24) = v139;
        uint64_t v146 = swift_allocObject(&unk_100035DD0, 32LL, 7LL);
        *(void *)(v146 + 16) = sub_10002CAF8;
        *(void *)(v146 + 24) = v145;
        uint64_t v147 = swift_allocObject(&unk_100035DF8, 32LL, 7LL);
        *(void *)(v147 + 16) = sub_10002E010;
        *(void *)(v147 + 24) = v146;
        uint64_t v148 = swift_allocObject(v138, 80LL, 7LL);
        *(_OWORD *)(v148 + 16) = v1019;
        *(void *)(v148 + 32) = sub_10002E258;
        *(void *)(v148 + 40) = v143;
        *(void *)(v148 + 48) = sub_10002E258;
        *(void *)(v148 + 56) = v144;
        *(void *)(v148 + 64) = sub_10002E020;
        *(void *)(v148 + 72) = v147;
        swift_retain(v143);
        swift_retain(v144);
        swift_retain(v147);
        swift_bridgeObjectRelease(v148);
        if (os_log_type_enabled(v141, v142))
        {
          uint64_t v149 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v150 = (void *)swift_slowAlloc(8LL, -1LL);
          v1035 = v150;
          double v1036 = 0.0;
          *(_WORD *)uint64_t v149 = 258;
          v149[2] = *(_BYTE *)(v143 + 16);
          if (v985) {
            return swift_errorRelease(v985);
          }
          uint64_t v151 = v150;
          swift_release(v143);
          v149[3] = *(_BYTE *)(v144 + 16);
          v1034[0] = (uint64_t)(v149 + 4);
          swift_release(v144);
          sub_100029334(v1034, &v1035, (uint64_t)&v1036, *(uint64_t (**)(void))(v147 + 16));
          uint64_t v1 = v1033;
          v1012 = (void (*)(uint64_t, uint64_t))v1033[182];
          uint64_t v152 = v1033[153];
          uint64_t v153 = v1033[120];
          swift_release(v147);
          _os_log_impl((void *)&_mh_execute_header, v141, v142, "Error: %@", v149, 0xCu);
          uint64_t v154 = sub_100007B74(&qword_1000388A0);
          swift_arrayDestroy(v151, 1LL, v154);
          swift_slowDealloc(v151, -1LL, -1LL);
          swift_slowDealloc(v149, -1LL, -1LL);

          sub_10002CBAC(v137, 1);
          sub_10002CBAC(v137, 1);
          v1012(v152, v153);
          v1011 = (void (*)(uint64_t, uint64_t))v1033[182];
        }

        else
        {
          uint64_t v179 = v1[153];
          uint64_t v180 = v1[120];
          sub_10002CBAC(v137, 1);
          swift_release(v143);
          swift_release(v144);
          swift_release(v147);

          sub_10002CBAC(v137, 1);
          v1011(v179, v180);
        }

        uint64_t v181 = v1[186];
        uint64_t v182 = *(void *)(v181 + 72);
        BOOL v183 = __OFADD__(v182, 1LL);
        uint64_t v184 = v182 + 1;
        uint64_t v133 = v1023;
        if (v183)
        {
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
        }

        *(void *)(v181 + 72) = v184;
      }

      else
      {
        uint64_t v155 = v1[63];
        uint64_t v156 = v1[64];
        sub_10002CB60(*((void **)v134 - 1), 0);
        sub_10002CB60(v137, 0);
        id v157 = v137;
        sub_100006318(v157, v155);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1000 + 48))(v155, 1LL, v156) == 1)
        {
          uint64_t v1024 = v133;
          uint64_t v993 = v1[181];
          uint64_t v158 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v159 = v1[179];
          uint64_t v160 = v1[154];
          uint64_t v161 = v1[120];
          sub_100008880(v1[63], &qword_100038800);
          v158(v160, v159, v161);
          uint64_t v162 = swift_allocObject(&unk_100036FA0, 24LL, 7LL);
          *(void *)(v162 + 16) = v157;
          uint64_t v163 = (os_log_s *)Logger.logObject.getter(v157);
          os_log_type_t v164 = static os_log_type_t.error.getter();
          uint64_t v165 = swift_allocObject(&unk_100036FC8, 17LL, 7LL);
          *(_BYTE *)(v165 + 16) = 64;
          uint64_t v166 = swift_allocObject(&unk_100036FF0, 17LL, 7LL);
          *(_BYTE *)(v166 + 16) = 8;
          uint64_t v167 = v1;
          uint64_t v168 = swift_allocObject(&unk_100037018, 32LL, 7LL);
          *(void *)(v168 + 16) = sub_10002E254;
          *(void *)(v168 + 24) = v162;
          uint64_t v169 = swift_allocObject(&unk_100037040, 32LL, 7LL);
          *(void *)(v169 + 16) = sub_10002E010;
          *(void *)(v169 + 24) = v168;
          uint64_t v170 = swift_allocObject(v993, 80LL, 7LL);
          *(_OWORD *)(v170 + 16) = v1019;
          *(void *)(v170 + 32) = sub_10002E258;
          *(void *)(v170 + 40) = v165;
          *(void *)(v170 + 48) = sub_10002E258;
          *(void *)(v170 + 56) = v166;
          *(void *)(v170 + 64) = sub_10002E020;
          *(void *)(v170 + 72) = v169;
          swift_retain(v165);
          swift_retain(v166);
          swift_retain(v169);
          swift_bridgeObjectRelease(v170);
          if (os_log_type_enabled(v163, v164))
          {
            uint64_t v171 = v163;
            BOOL v172 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v173 = (void *)swift_slowAlloc(8LL, -1LL);
            v1035 = v173;
            double v1036 = 0.0;
            *(_WORD *)BOOL v172 = 258;
            v172[2] = *(_BYTE *)(v165 + 16);
            if (v985) {
              return swift_errorRelease(v985);
            }
            uint64_t v174 = v173;
            swift_release(v165);
            v172[3] = *(_BYTE *)(v166 + 16);
            v1034[0] = (uint64_t)(v172 + 4);
            swift_release(v166);
            sub_100029334(v1034, &v1035, (uint64_t)&v1036, *(uint64_t (**)(void))(v169 + 16));
            uint64_t v175 = v1033[154];
            uint64_t v176 = v1033[120];
            swift_release(v169);
            _os_log_impl((void *)&_mh_execute_header, v171, v164, "Skipping record: %@", v172, 0xCu);
            uint64_t v177 = sub_100007B74(&qword_1000388A0);
            swift_arrayDestroy(v174, 1LL, v177);
            uint64_t v178 = v174;
            uint64_t v1 = v1033;
            swift_slowDealloc(v178, -1LL, -1LL);
            swift_slowDealloc(v172, -1LL, -1LL);

            sub_10002CBAC(v137, 0);
            sub_10002CBAC(v137, 0);
            v1011(v175, v176);
            v985 = 0LL;
          }

          else
          {
            uint64_t v135 = v167[154];
            uint64_t v136 = v167[120];
            sub_10002CBAC(v137, 0);
            swift_release(v165);
            swift_release(v166);
            swift_release(v169);

            sub_10002CBAC(v137, 0);
            v1011(v135, v136);
            uint64_t v1 = v167;
          }

          uint64_t v133 = v1024;
        }

        else
        {
          uint64_t v185 = v1[210];
          unint64_t v186 = (uint64_t *)v1[69];
          sub_10002DAD8(v1[63], (uint64_t)v186, type metadata accessor for TaskParametersRecord);
          uint64_t v187 = *(void *)(v185 + 16);
          uint64_t v188 = *v186;
          uint64_t v189 = *(void *)(v979 + 8);
          swift_bridgeObjectRetain(v187);
          swift_bridgeObjectRetain(v189);
          LOBYTE(v188) = sub_10002625C(v188, v189, v187);
          swift_bridgeObjectRelease(v187);
          swift_bridgeObjectRelease(v189);
          if ((v188 & 1) != 0)
          {
            uint64_t v190 = v1[186];
            uint64_t v191 = v1[69];
            uint64_t v192 = v1[68];
            sub_1000087B8(v191, v192, type metadata accessor for TaskParametersRecord);
            sub_10002642C(v192, &qword_100038910, type metadata accessor for TaskParametersRecord);
            sub_10002CBAC(v137, 0);
            sub_10002CBAC(v137, 0);
            sub_1000087FC(v191, type metadata accessor for TaskParametersRecord);
            uint64_t v193 = *(void *)(v190 + 64);
            BOOL v183 = __OFADD__(v193, 1LL);
            uint64_t v194 = v193 + 1;
            if (v183) {
              goto LABEL_177;
            }
            *(void *)(v1[186] + 64LL) = v194;
          }

          else
          {
            uint64_t v1025 = v133;
            uint64_t v195 = ((uint64_t (*)(void, void, void))v1[180])(v1[155], v1[179], v1[120]);
            os_log_type_t v196 = (os_log_s *)Logger.logObject.getter(v195);
            os_log_type_t v197 = static os_log_type_t.debug.getter();
            BOOL v198 = os_log_type_enabled(v196, v197);
            uint64_t v199 = v1[155];
            uint64_t v200 = v1[120];
            uint64_t v201 = v1[69];
            if (v198)
            {
              uint64_t v202 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
              v1035 = 0LL;
              double v1036 = 0.0;
              *(_WORD *)uint64_t v202 = 0;
              v1034[0] = (uint64_t)(v202 + 2);
              sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v1034, (uint64_t)&v1035, (uint64_t)&v1036);
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
              _os_log_impl( (void *)&_mh_execute_header,  v196,  v197,  "Skipping taskParametersRecord because associated with an unavailable taskName.",  v202,  2u);
              swift_slowDealloc(v202, -1LL, -1LL);
            }

            else
            {
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
            }

            sub_10002CBAC(v137, 0);
            sub_10002CBAC(v137, 0);
            v1011(v199, v200);
            sub_1000087FC(v201, type metadata accessor for TaskParametersRecord);
            uint64_t v133 = v1025;
          }
        }
      }

      v134 += 24;
      --v133;
    }

    while (v133);
  }

  uint64_t v227 = v1[225];
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  uint64_t v228 = swift_allocObject(&unk_100035E20, 24LL, 7LL);
  v1[232] = v228;
  type metadata accessor for TaskPayloadRecord(0LL);
  *(void *)(v228 + 16) = _swiftEmptyArrayStorage;
  swift_beginAccess(v227 + 16, v1 + 11, 0LL, 0LL);
  if (*(void *)(*(void *)(v227 + 16) + 16LL))
  {
    uint64_t v229 = v1[225];
    uint64_t v230 = v1[181];
    uint64_t v231 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
    uint64_t v232 = v1[179];
    uint64_t v233 = v1[152];
    uint64_t v234 = v1[120];
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    v231(v233, v232, v234);
    uint64_t v235 = swift_allocObject(&unk_100035E48, 32LL, 7LL);
    *(void *)(v235 + 16) = sub_10002D0F0;
    *(void *)(v235 + 24) = v229;
    uint64_t v236 = swift_retain(v229);
    uint64_t v237 = (os_log_s *)Logger.logObject.getter(v236);
    os_log_type_t v238 = static os_log_type_t.info.getter();
    uint64_t v239 = swift_allocObject(&unk_100035E70, 17LL, 7LL);
    *(_BYTE *)(v239 + 16) = 32;
    uint64_t v240 = swift_allocObject(&unk_100035E98, 17LL, 7LL);
    *(_BYTE *)(v240 + 16) = 8;
    uint64_t v241 = swift_allocObject(&unk_100035EC0, 32LL, 7LL);
    *(void *)(v241 + 16) = sub_10002D108;
    *(void *)(v241 + 24) = v235;
    uint64_t v242 = swift_allocObject(&unk_100035EE8, 32LL, 7LL);
    *(void *)(v242 + 16) = sub_10002E010;
    *(void *)(v242 + 24) = v241;
    uint64_t v243 = swift_allocObject(v230, 80LL, 7LL);
    *(_OWORD *)(v243 + 16) = v1019;
    *(void *)(v243 + 32) = sub_10002E258;
    *(void *)(v243 + 40) = v239;
    *(void *)(v243 + 48) = sub_10002E258;
    *(void *)(v243 + 56) = v240;
    *(void *)(v243 + 64) = sub_10002E01C;
    *(void *)(v243 + 72) = v242;
    swift_retain(v239);
    swift_retain(v240);
    swift_retain(v242);
    swift_bridgeObjectRelease(v243);
    if (os_log_type_enabled(v237, v238))
    {
      uint64_t v244 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v245 = swift_slowAlloc(32LL, -1LL);
      v1035 = 0LL;
      double v1036 = *(double *)&v245;
      *(_WORD *)uint64_t v244 = 258;
      uint64_t v244[2] = *(_BYTE *)(v239 + 16);
      if (v985) {
        return swift_errorRelease(v985);
      }
      uint64_t v246 = v245;
      swift_release(v239);
      v244[3] = *(_BYTE *)(v240 + 16);
      v1034[0] = (uint64_t)(v244 + 4);
      swift_release(v240);
      sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v242 + 16));
      uint64_t v1 = v1033;
      uint64_t v247 = v1033[152];
      uint64_t v248 = v1033[121];
      uint64_t v249 = v1033[120];
      swift_release(v242);
      _os_log_impl((void *)&_mh_execute_header, v237, v238, "Querying TaskPayloads for new tasks: %s", v244, 0xCu);
      swift_arrayDestroy(v246, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v246, -1LL, -1LL);
      swift_slowDealloc(v244, -1LL, -1LL);

      v250 = *(void (**)(uint64_t, uint64_t))(v248 + 8);
      v250(v247, v249);
    }

    else
    {
      uint64_t v319 = v1[152];
      uint64_t v320 = v1[121];
      uint64_t v321 = v1[120];
      swift_release(v239);
      swift_release(v240);
      swift_release(v242);

      v250 = *(void (**)(uint64_t, uint64_t))(v320 + 8);
      v250(v319, v321);
    }

    v1[233] = v250;
    uint64_t v322 = v1[225];
    uint64_t v323 = v1[200];
    uint64_t v324 = (void *)v1[193];
    uint64_t v325 = (void *)v1[192];
    uint64_t v326 = v1[191];
    uint64_t v327 = swift_allocObject(v1[198], 112LL, 7LL);
    *(_OWORD *)(v327 + 16) = xmmword_10002FBD0;
    *(void *)(v327 + 56) = &type metadata for String;
    *(void *)(v327 + 64) = v323;
    *(void *)(v327 + 32) = 0x656D614E6B736174LL;
    *(void *)(v327 + 40) = 0xE800000000000000LL;
    uint64_t v328 = *(void *)(v322 + 16);
    uint64_t v329 = swift_bridgeObjectRetain(v328);
    uint64_t v330 = sub_100026580(v329);
    swift_bridgeObjectRelease(v328);
    *(void *)(v327 + 96) = sub_100007B74(&qword_1000388B0);
    *(void *)(v327 + 104) = sub_10002DF08( &qword_1000388B8,  &qword_1000388B0,  (uint64_t)&protocol conformance descriptor for [A]);
    *(void *)(v327 + 72) = v330;
    uint64_t v331 = (NSPredicate *)NSPredicate.init(format:_:)(0x4025204E49204B25LL, 0xE800000000000000LL, v327);
    v332._countAndFlagsBits = 0x6C7961506B736154LL;
    v332._object = (void *)0xEC0000007364616FLL;
    Class v333 = CKQuery.init(recordType:predicate:)(v332, v331).super.isa;
    v1[234] = v333;
    uint64_t v334 = swift_task_alloc(32LL);
    v1[235] = v334;
    *(void *)(v334 + 16) = v333;
    *(void *)(v334 + 24) = v326;
    uint64_t v219 = swift_task_alloc(32LL);
    v1[236] = v219;
    *(void *)(v219 + 16) = &unk_1000388E0;
    *(void *)(v219 + 24) = v334;
    uint64_t v335 = async function pointer to CKDatabase.configuredWith<A>(configuration:group:body:)[1];
    id v221 = v324;
    id v222 = v325;
    uint64_t v336 = (void *)swift_task_alloc(v335);
    v1[237] = v336;
    *uint64_t v336 = v1;
    v336[1] = sub_10001C8E8;
    uint64_t v224 = v1[208];
    uint64_t v225 = v1 + 26;
    uint64_t v226 = &unk_1000388E8;
    return CKDatabase.configuredWith<A>(configuration:group:body:)(v225, v221, v222, v226, v219, v224);
  }

  uint64_t v251 = _swiftEmptyArrayStorage[2];
  if (v251)
  {
    uint64_t v252 = &_swiftEmptyArrayStorage[6];
    uint64_t v980 = v1033[62];
    uint64_t v1001 = v1033[58];
    uint64_t v1013 = v1033[121];
    do
    {
      uint64_t v255 = (void *)*((void *)v252 - 1);
      if ((*v252 & 1) != 0)
      {
        uint64_t v1026 = v251;
        uint64_t v256 = v1033;
        uint64_t v257 = v1033[181];
        ((void (*)(void, void, void))v1033[180])(v1033[149], v1033[179], v1033[120]);
        uint64_t v258 = swift_allocObject(&unk_1000360F0, 24LL, 7LL);
        *(void *)(v258 + 16) = v255;
        sub_10002CB60(v255, 1);
        sub_10002CB60(v255, 1);
        uint64_t v259 = swift_errorRetain(v255);
        uint64_t v260 = (os_log_s *)Logger.logObject.getter(v259);
        os_log_type_t v261 = static os_log_type_t.error.getter();
        uint64_t v262 = swift_allocObject(&unk_100036118, 17LL, 7LL);
        *(_BYTE *)(v262 + 16) = 64;
        uint64_t v263 = swift_allocObject(&unk_100036140, 17LL, 7LL);
        *(_BYTE *)(v263 + 16) = 8;
        uint64_t v264 = swift_allocObject(&unk_100036168, 32LL, 7LL);
        *(void *)(v264 + 16) = sub_10002E250;
        *(void *)(v264 + 24) = v258;
        uint64_t v265 = swift_allocObject(&unk_100036190, 32LL, 7LL);
        *(void *)(v265 + 16) = sub_10002CAF8;
        *(void *)(v265 + 24) = v264;
        uint64_t v266 = swift_allocObject(&unk_1000361B8, 32LL, 7LL);
        *(void *)(v266 + 16) = sub_10002E010;
        *(void *)(v266 + 24) = v265;
        uint64_t v267 = swift_allocObject(v257, 80LL, 7LL);
        *(_OWORD *)(v267 + 16) = v1019;
        *(void *)(v267 + 32) = sub_10002E258;
        *(void *)(v267 + 40) = v262;
        *(void *)(v267 + 48) = sub_10002E258;
        *(void *)(v267 + 56) = v263;
        *(void *)(v267 + 64) = sub_10002E020;
        *(void *)(v267 + 72) = v266;
        swift_retain(v262);
        swift_retain(v263);
        swift_retain(v266);
        swift_bridgeObjectRelease(v267);
        if (os_log_type_enabled(v260, v261))
        {
          uint64_t v268 = v252;
          uint64_t v269 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v270 = (void *)swift_slowAlloc(8LL, -1LL);
          v1035 = v270;
          double v1036 = 0.0;
          *(_WORD *)uint64_t v269 = 258;
          v269[2] = *(_BYTE *)(v262 + 16);
          if (v985) {
            return swift_errorRelease(v985);
          }
          uint64_t v271 = v270;
          swift_release(v262);
          v269[3] = *(_BYTE *)(v263 + 16);
          v1034[0] = (uint64_t)(v269 + 4);
          swift_release(v263);
          sub_100029334(v1034, &v1035, (uint64_t)&v1036, *(uint64_t (**)(void))(v266 + 16));
          uint64_t v256 = v1033;
          uint64_t v272 = v1033[149];
          uint64_t v273 = v1033[120];
          swift_release(v266);
          _os_log_impl((void *)&_mh_execute_header, v260, v261, "Error: %@", v269, 0xCu);
          uint64_t v274 = sub_100007B74(&qword_1000388A0);
          swift_arrayDestroy(v271, 1LL, v274);
          swift_slowDealloc(v271, -1LL, -1LL);
          swift_slowDealloc(v269, -1LL, -1LL);

          sub_10002CBAC(v255, 1);
          sub_10002CBAC(v255, 1);
          (*(void (**)(uint64_t, uint64_t))(v1013 + 8))(v272, v273);
          uint64_t v252 = v268;
        }

        else
        {
          uint64_t v296 = v1033[149];
          uint64_t v297 = v1033[120];
          sub_10002CBAC(v255, 1);
          swift_release(v262);
          swift_release(v263);
          swift_release(v266);

          sub_10002CBAC(v255, 1);
          (*(void (**)(uint64_t, uint64_t))(v1013 + 8))(v296, v297);
        }

        uint64_t v298 = v256[186];
        uint64_t v299 = *(void *)(v298 + 96);
        BOOL v183 = __OFADD__(v299, 1LL);
        uint64_t v300 = v299 + 1;
        if (v183) {
          goto LABEL_176;
        }
        *(void *)(v298 + 96) = v300;
        uint64_t v251 = v1026;
      }

      else
      {
        uint64_t v275 = v1033[56];
        uint64_t v276 = v1033[57];
        sub_10002CB60(*((void **)v252 - 1), 0);
        sub_10002CB60(v255, 0);
        id v277 = v255;
        sub_1000071A4(v277, v275);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1001 + 48))(v275, 1LL, v276) == 1)
        {
          v1027 = v252;
          uint64_t v994 = v1033[181];
          uint64_t v278 = (void (*)(uint64_t, uint64_t, uint64_t))v1033[180];
          uint64_t v279 = v1033[179];
          uint64_t v280 = v1033[150];
          uint64_t v281 = v1033[120];
          sub_100008880(v1033[56], &qword_1000387F8);
          v278(v280, v279, v281);
          uint64_t v282 = swift_allocObject(&unk_100036ED8, 24LL, 7LL);
          *(void *)(v282 + 16) = v277;
          uint64_t v283 = (os_log_s *)Logger.logObject.getter(v277);
          os_log_type_t v284 = static os_log_type_t.error.getter();
          uint64_t v285 = swift_allocObject(&unk_100036F00, 17LL, 7LL);
          *(_BYTE *)(v285 + 16) = 64;
          uint64_t v286 = swift_allocObject(&unk_100036F28, 17LL, 7LL);
          *(_BYTE *)(v286 + 16) = 8;
          uint64_t v287 = swift_allocObject(&unk_100036F50, 32LL, 7LL);
          *(void *)(v287 + 16) = sub_10002E254;
          *(void *)(v287 + 24) = v282;
          uint64_t v288 = swift_allocObject(&unk_100036F78, 32LL, 7LL);
          *(void *)(v288 + 16) = sub_10002E010;
          *(void *)(v288 + 24) = v287;
          uint64_t v289 = swift_allocObject(v994, 80LL, 7LL);
          *(_OWORD *)(v289 + 16) = v1019;
          *(void *)(v289 + 32) = sub_10002E258;
          *(void *)(v289 + 40) = v285;
          *(void *)(v289 + 48) = sub_10002E258;
          *(void *)(v289 + 56) = v286;
          *(void *)(v289 + 64) = sub_10002E020;
          *(void *)(v289 + 72) = v288;
          swift_retain(v285);
          swift_retain(v286);
          swift_retain(v288);
          swift_bridgeObjectRelease(v289);
          if (os_log_type_enabled(v283, v284))
          {
            uint64_t v290 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v291 = (void *)swift_slowAlloc(8LL, -1LL);
            v1035 = v291;
            double v1036 = 0.0;
            *(_WORD *)uint64_t v290 = 258;
            v290[2] = *(_BYTE *)(v285 + 16);
            if (v985) {
              return swift_errorRelease(v985);
            }
            uint64_t v292 = v291;
            swift_release(v285);
            v290[3] = *(_BYTE *)(v286 + 16);
            v1034[0] = (uint64_t)(v290 + 4);
            swift_release(v286);
            sub_100029334(v1034, &v1035, (uint64_t)&v1036, *(uint64_t (**)(void))(v288 + 16));
            uint64_t v293 = v1033[150];
            uint64_t v294 = v1033[120];
            swift_release(v288);
            _os_log_impl((void *)&_mh_execute_header, v283, v284, "Skipping record: %@", v290, 0xCu);
            uint64_t v295 = sub_100007B74(&qword_1000388A0);
            swift_arrayDestroy(v292, 1LL, v295);
            swift_slowDealloc(v292, -1LL, -1LL);
            swift_slowDealloc(v290, -1LL, -1LL);

            sub_10002CBAC(v255, 0);
            sub_10002CBAC(v255, 0);
            (*(void (**)(uint64_t, uint64_t))(v1013 + 8))(v293, v294);
            v985 = 0LL;
          }

          else
          {
            uint64_t v253 = v1033[150];
            uint64_t v254 = v1033[120];
            sub_10002CBAC(v255, 0);
            swift_release(v285);
            swift_release(v286);
            swift_release(v288);

            sub_10002CBAC(v255, 0);
            (*(void (**)(uint64_t, uint64_t))(v1013 + 8))(v253, v254);
          }

          uint64_t v252 = v1027;
        }

        else
        {
          uint64_t v301 = v1033[210];
          uint64_t v302 = (uint64_t *)v1033[62];
          sub_10002DAD8(v1033[56], (uint64_t)v302, type metadata accessor for TaskPayloadRecord);
          uint64_t v303 = *(void *)(v301 + 16);
          uint64_t v304 = *v302;
          uint64_t v305 = *(void *)(v980 + 8);
          swift_bridgeObjectRetain(v303);
          swift_bridgeObjectRetain(v305);
          LOBYTE(v304) = sub_10002625C(v304, v305, v303);
          swift_bridgeObjectRelease(v303);
          swift_bridgeObjectRelease(v305);
          if ((v304 & 1) != 0)
          {
            uint64_t v306 = v1033[186];
            uint64_t v307 = v1033[61];
            uint64_t v308 = v1033[62];
            sub_1000087B8(v308, v307, type metadata accessor for TaskPayloadRecord);
            sub_10002642C(v307, &qword_100038918, type metadata accessor for TaskPayloadRecord);
            sub_10002CBAC(v255, 0);
            sub_10002CBAC(v255, 0);
            sub_1000087FC(v308, type metadata accessor for TaskPayloadRecord);
            uint64_t v309 = *(void *)(v306 + 88);
            BOOL v183 = __OFADD__(v309, 1LL);
            uint64_t v310 = v309 + 1;
            if (v183) {
              goto LABEL_178;
            }
            *(void *)(v1033[186] + 88LL) = v310;
          }

          else
          {
            v1028 = v252;
            uint64_t v311 = ((uint64_t (*)(void, void, void))v1033[180])(v1033[151], v1033[179], v1033[120]);
            uint64_t v312 = (os_log_s *)Logger.logObject.getter(v311);
            os_log_type_t v313 = static os_log_type_t.debug.getter();
            BOOL v314 = os_log_type_enabled(v312, v313);
            uint64_t v315 = v1033[151];
            uint64_t v316 = v1033[120];
            uint64_t v317 = v1033[62];
            if (v314)
            {
              uint64_t v318 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
              v1035 = 0LL;
              double v1036 = 0.0;
              *(_WORD *)uint64_t v318 = 0;
              v1034[0] = (uint64_t)(v318 + 2);
              sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v1034, (uint64_t)&v1035, (uint64_t)&v1036);
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
              _os_log_impl( (void *)&_mh_execute_header,  v312,  v313,  "Skipping taskPayloadRecord because associated with an unavailable taskName.",  v318,  2u);
              swift_slowDealloc(v318, -1LL, -1LL);
            }

            else
            {
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
            }

            sub_10002CBAC(v255, 0);
            sub_10002CBAC(v255, 0);
            (*(void (**)(uint64_t, uint64_t))(v1013 + 8))(v315, v316);
            sub_1000087FC(v317, type metadata accessor for TaskPayloadRecord);
            uint64_t v252 = v1028;
          }
        }
      }

      v252 += 24;
      --v251;
    }

    while (v251);
  }

  uint64_t v338 = v1033;
  uint64_t v339 = v1033[226];
  uint64_t v340 = v1033[181];
  uint64_t v341 = (void (*)(uint64_t, uint64_t, uint64_t))v1033[180];
  uint64_t v342 = v1033[179];
  uint64_t v343 = v1033[148];
  uint64_t v344 = v1033[120];
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v341(v343, v342, v344);
  uint64_t v345 = swift_allocObject(&unk_1000361E0, 32LL, 7LL);
  *(void *)(v345 + 16) = sub_10002CBDC;
  *(void *)(v345 + 24) = v339;
  uint64_t v346 = swift_retain(v339);
  uint64_t v347 = (os_log_s *)Logger.logObject.getter(v346);
  os_log_type_t v348 = static os_log_type_t.info.getter();
  uint64_t v349 = swift_allocObject(&unk_100036208, 17LL, 7LL);
  *(_BYTE *)(v349 + 16) = 32;
  uint64_t v350 = swift_allocObject(&unk_100036230, 17LL, 7LL);
  *(_BYTE *)(v350 + 16) = 8;
  uint64_t v351 = swift_allocObject(&unk_100036258, 32LL, 7LL);
  *(void *)(v351 + 16) = sub_10002D400;
  *(void *)(v351 + 24) = v345;
  uint64_t v352 = swift_allocObject(&unk_100036280, 32LL, 7LL);
  *(void *)(v352 + 16) = sub_10002E010;
  *(void *)(v352 + 24) = v351;
  uint64_t v353 = swift_allocObject(v340, 80LL, 7LL);
  *(_OWORD *)(v353 + 16) = v1019;
  *(void *)(v353 + 32) = sub_10002E258;
  *(void *)(v353 + 40) = v349;
  *(void *)(v353 + 48) = sub_10002E258;
  *(void *)(v353 + 56) = v350;
  *(void *)(v353 + 64) = sub_10002E01C;
  *(void *)(v353 + 72) = v352;
  swift_retain(v349);
  swift_retain(v350);
  swift_retain(v352);
  swift_bridgeObjectRelease(v353);
  if (os_log_type_enabled(v347, v348))
  {
    uint64_t v354 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v355 = swift_slowAlloc(32LL, -1LL);
    v1035 = 0LL;
    double v1036 = *(double *)&v355;
    *(_WORD *)uint64_t v354 = 258;
    v354[2] = *(_BYTE *)(v349 + 16);
    if (v985) {
      return swift_errorRelease(v985);
    }
    uint64_t v356 = v355;
    swift_release(v349);
    v354[3] = *(_BYTE *)(v350 + 16);
    v1034[0] = (uint64_t)(v354 + 4);
    swift_release(v350);
    sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v352 + 16));
    uint64_t v357 = v1033[148];
    uint64_t v358 = v1033[121];
    uint64_t v359 = v1033[120];
    swift_release(v352);
    _os_log_impl((void *)&_mh_execute_header, v347, v348, "Processing TaskParametersRecords: %s", v354, 0xCu);
    swift_arrayDestroy(v356, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v356, -1LL, -1LL);
    swift_slowDealloc(v354, -1LL, -1LL);

    uint64_t v360 = *(void (**)(uint64_t, uint64_t))(v358 + 8);
    uint64_t v361 = v357;
    uint64_t v362 = v359;
  }

  else
  {
    uint64_t v363 = v1033[148];
    uint64_t v364 = v1033[121];
    uint64_t v365 = v1033[120];
    swift_release(v349);
    swift_release(v350);
    swift_release(v352);

    uint64_t v360 = *(void (**)(uint64_t, uint64_t))(v364 + 8);
    uint64_t v361 = v363;
    uint64_t v362 = v365;
  }

  v1002 = v360;
  v360(v361, v362);
  uint64_t v366 = v1033[226];
  swift_beginAccess(v366 + 16, v1033 + 5, 0LL, 0LL);
  uint64_t v367 = *(void *)(v366 + 16);
  uint64_t v368 = *(void *)(v367 + 16);
  if (v368)
  {
    uint64_t v904 = v1033[121];
    uint64_t v995 = v1033[84];
    uint64_t v963 = v1033[75];
    uint64_t v925 = v1033[71];
    uint64_t v918 = v1033[67];
    uint64_t v369 = v1033[65];
    uint64_t v370 = *(unsigned __int8 *)(v369 + 80);
    uint64_t v371 = v367 + ((v370 + 32) & ~v370);
    unsigned int v372 = enum case for URL.DirectoryHint.inferFromPath(_:);
    uint64_t v970 = ((v370 + 16) & ~v370) + v1033[66];
    uint64_t v974 = (v370 + 16) & ~v370;
    uint64_t v966 = v370 | 7;
    uint64_t v981 = *(void *)(v369 + 72);
    uint64_t v893 = *(void *)(v366 + 16);
    swift_bridgeObjectRetain(v367);
    unsigned int v915 = v372;
    while (1)
    {
      v378 = v1033;
      uint64_t v379 = v1033[224];
      uint64_t v380 = v1033[83];
      uint64_t v381 = v1033[67];
      uint64_t v382 = v1033[55];
      sub_1000087B8(v371, v381, type metadata accessor for TaskParametersRecord);
      uint64_t v383 = swift_task_alloc(32LL);
      *(void *)(v383 + 16) = v381;
      sub_100026728((uint64_t (*)(char *))sub_10002D440, v379, v382);
      swift_task_dealloc(v383);
      uint64_t v1029 = v368;
      uint64_t v1014 = v371;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v995 + 48))(v382, 1LL, v380) == 1)
      {
        uint64_t v384 = v1033[181];
        v385 = (void (*)(uint64_t, uint64_t, uint64_t))v1033[180];
        uint64_t v386 = v1033[179];
        uint64_t v387 = v1033[146];
        uint64_t v388 = v1033[120];
        uint64_t v389 = v1033[68];
        uint64_t v390 = v1033[67];
        sub_100008880(v1033[55], &qword_1000387F0);
        v385(v387, v386, v388);
        sub_1000087B8(v390, v389, type metadata accessor for TaskParametersRecord);
        uint64_t v391 = swift_allocObject(&unk_1000362A8, v970, v966);
        uint64_t v392 = sub_10002DAD8(v389, v391 + v974, type metadata accessor for TaskParametersRecord);
        v393 = (os_log_s *)Logger.logObject.getter(v392);
        os_log_type_t v394 = static os_log_type_t.error.getter();
        uint64_t v395 = swift_allocObject(&unk_1000362D0, 17LL, 7LL);
        *(_BYTE *)(v395 + 16) = 32;
        uint64_t v396 = swift_allocObject(&unk_1000362F8, 17LL, 7LL);
        *(_BYTE *)(v396 + 16) = 8;
        uint64_t v397 = swift_allocObject(&unk_100036320, 32LL, 7LL);
        *(void *)(v397 + 16) = sub_10002D460;
        *(void *)(v397 + 24) = v391;
        uint64_t v398 = swift_allocObject(&unk_100036348, 32LL, 7LL);
        *(void *)(v398 + 16) = sub_10002E010;
        *(void *)(v398 + 24) = v397;
        uint64_t v399 = swift_allocObject(v384, 80LL, 7LL);
        *(_OWORD *)(v399 + 16) = v1019;
        *(void *)(v399 + 32) = sub_10002E258;
        *(void *)(v399 + 40) = v395;
        *(void *)(v399 + 48) = sub_10002E258;
        *(void *)(v399 + 56) = v396;
        *(void *)(v399 + 64) = sub_10002E01C;
        *(void *)(v399 + 72) = v398;
        swift_retain(v395);
        swift_retain(v396);
        swift_retain(v398);
        swift_bridgeObjectRelease(v399);
        if (os_log_type_enabled(v393, v394))
        {
          v400 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v401 = swift_slowAlloc(32LL, -1LL);
          v1035 = 0LL;
          double v1036 = *(double *)&v401;
          *(_WORD *)v400 = 258;
          v400[2] = *(_BYTE *)(v395 + 16);
          if (v985) {
            return swift_errorRelease(v985);
          }
          uint64_t v402 = v401;
          swift_release(v395);
          v400[3] = *(_BYTE *)(v396 + 16);
          v1034[0] = (uint64_t)(v400 + 4);
          swift_release(v396);
          sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v398 + 16));
          uint64_t v403 = v1033[146];
          uint64_t v404 = v1033[120];
          swift_release(v398);
          _os_log_impl( (void *)&_mh_execute_header,  v393,  v394,  "Task %s not registered on the system. Skipping task.",  v400,  0xCu);
          swift_arrayDestroy(v402, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v402, -1LL, -1LL);
          swift_slowDealloc(v400, -1LL, -1LL);

          uint64_t v375 = v403;
          uint64_t v376 = v404;
        }

        else
        {
          uint64_t v373 = v1033[146];
          uint64_t v374 = v1033[120];
          swift_release(v395);
          swift_release(v396);
          swift_release(v398);

          uint64_t v375 = v373;
          uint64_t v376 = v374;
        }

        v1002(v375, v376);
      }

      else
      {
        uint64_t v405 = (*(uint64_t (**)(void, void, void))(v995 + 32))(v1033[87], v1033[55], v1033[83]);
        uint64_t v406 = MLHostTask.taskFolder.getter(v405);
        if (v407)
        {
          uint64_t v408 = v406;
          uint64_t v409 = v407;
          uint64_t v410 = v1033[73];
          uint64_t v411 = v1033[72];
          (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v963 + 56))(v410, 1LL, 1LL, v1033[74]);
          uint64_t v412 = type metadata accessor for URL.DirectoryHint(0LL);
          v413 = *(void (**)(uint64_t, void, uint64_t))(*(void *)(v412 - 8) + 104LL);
          v413(v411, v915, v412);
          URL.init(filePath:directoryHint:relativeTo:)(v408, v409, v411, v410);
          if (qword_1000383A8 != -1) {
            swift_once(&qword_1000383A8, sub_10000B020);
          }
          uint64_t v414 = v1033[82];
          uint64_t v415 = v1033[80];
          uint64_t v416 = v1033[74];
          uint64_t v417 = v1033[72];
          uint64_t v418 = v1033[70];
          uint64_t v419 = *(void *)algn_100038798;
          v1033[18] = qword_100038790;
          v1033[19] = v419;
          v413(v417, v915, v412);
          unint64_t v420 = sub_100028A54();
          swift_bridgeObjectRetain(v419);
          URL.appending<A>(path:directoryHint:)(v1033 + 18, v417, &type metadata for String, v420);
          (*(void (**)(uint64_t, uint64_t))(v925 + 8))(v417, v418);
          swift_bridgeObjectRelease(v1033[19]);
          v421 = *(void (**)(uint64_t, uint64_t))(v963 + 8);
          v421(v414, v416);
          uint64_t v422 = *(void *)(v918 + 32);
          unint64_t v423 = *(void *)(v918 + 40);
          sub_1000085F8(v422, v423);
          Data.write(to:options:)(v415, 0LL, v422, v423);
          if (v985)
          {
            v941 = v421;
            uint64_t v1003 = v1033[181];
            v424 = (void (*)(uint64_t, uint64_t, uint64_t))v1033[180];
            uint64_t v425 = v1033[179];
            uint64_t v426 = v1033[124];
            uint64_t v427 = v1033[120];
            uint64_t v428 = v1033[82];
            uint64_t v429 = v1033[80];
            uint64_t v950 = v1033[76];
            uint64_t v430 = v1033[74];
            sub_1000085B4(v422, v423);
            v424(v426, v425, v427);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v963 + 16))(v428, v429, v430);
            uint64_t v431 = *(unsigned __int8 *)(v963 + 80);
            uint64_t v432 = (v431 + 16) & ~v431;
            uint64_t v433 = swift_allocObject(&unk_100036CF8, v432 + v950, v431 | 7);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v963 + 32))(v433 + v432, v428, v430);
            uint64_t v434 = swift_allocObject(&unk_100036D20, 32LL, 7LL);
            *(void *)(v434 + 16) = sub_10002D65C;
            *(void *)(v434 + 24) = v433;
            uint64_t v435 = swift_allocObject(&unk_100036D48, 24LL, 7LL);
            *(void *)(v435 + 16) = v985;
            uint64_t v436 = swift_errorRetain(v985);
            v437 = (os_log_s *)Logger.logObject.getter(v436);
            LOBYTE(v950) = static os_log_type_t.error.getter();
            uint64_t v438 = swift_allocObject(&unk_100036D70, 17LL, 7LL);
            *(_BYTE *)(v438 + 16) = 32;
            uint64_t v439 = swift_allocObject(&unk_100036D98, 17LL, 7LL);
            *(_BYTE *)(v439 + 16) = 8;
            uint64_t v440 = swift_allocObject(&unk_100036DC0, 32LL, 7LL);
            *(void *)(v440 + 16) = sub_10002E014;
            *(void *)(v440 + 24) = v434;
            uint64_t v441 = swift_allocObject(&unk_100036DE8, 32LL, 7LL);
            *(void *)(v441 + 16) = sub_10002E010;
            *(void *)(v441 + 24) = v440;
            uint64_t v442 = swift_allocObject(&unk_100036E10, 17LL, 7LL);
            *(_BYTE *)(v442 + 16) = 64;
            uint64_t v443 = swift_allocObject(&unk_100036E38, 17LL, 7LL);
            *(_BYTE *)(v443 + 16) = 8;
            uint64_t v444 = swift_allocObject(&unk_100036E60, 32LL, 7LL);
            *(void *)(v444 + 16) = sub_10002E250;
            *(void *)(v444 + 24) = v435;
            uint64_t v445 = swift_allocObject(&unk_100036E88, 32LL, 7LL);
            *(void *)(v445 + 16) = sub_10002CAF8;
            *(void *)(v445 + 24) = v444;
            uint64_t v446 = swift_allocObject(&unk_100036EB0, 32LL, 7LL);
            *(void *)(v446 + 16) = sub_10002E010;
            *(void *)(v446 + 24) = v445;
            uint64_t v447 = swift_allocObject(v1003, 128LL, 7LL);
            *(_OWORD *)(v447 + 16) = xmmword_10002FBC0;
            *(void *)(v447 + 32) = sub_10002E258;
            *(void *)(v447 + 40) = v438;
            *(void *)(v447 + 48) = sub_10002E258;
            *(void *)(v447 + 56) = v439;
            *(void *)(v447 + 64) = sub_10002E01C;
            *(void *)(v447 + 72) = v441;
            *(void *)(v447 + 80) = sub_10002E258;
            *(void *)(v447 + 88) = v442;
            *(void *)(v447 + 96) = sub_10002E258;
            *(void *)(v447 + 104) = v443;
            *(void *)(v447 + 112) = sub_10002E020;
            *(void *)(v447 + 120) = v446;
            swift_retain(v438);
            swift_retain(v439);
            swift_retain(v441);
            swift_retain(v442);
            swift_retain(v443);
            swift_retain(v446);
            swift_bridgeObjectRelease(v447);
            os_log_type_t v448 = v950;
            v1004 = v437;
            if (os_log_type_enabled(v437, (os_log_type_t)v950))
            {
              v449 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
              v900 = (void *)swift_slowAlloc(8LL, -1LL);
              uint64_t v951 = swift_slowAlloc(32LL, -1LL);
              v1035 = v900;
              double v1036 = *(double *)&v951;
              *(_WORD *)v449 = 514;
              v449[2] = *(_BYTE *)(v438 + 16);
              swift_release(v438);
              v449[3] = *(_BYTE *)(v439 + 16);
              v1034[0] = (uint64_t)(v449 + 4);
              swift_release(v439);
              sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v441 + 16));
              swift_release(v441);
              uint64_t v450 = v1034[0];
              *(_BYTE *)v1034[0] = *(_BYTE *)(v442 + 16);
              swift_release(v442);
              *(_BYTE *)(v450 + 1) = *(_BYTE *)(v443 + 16);
              v1034[0] = v450 + 2;
              swift_release(v443);
              sub_100029334(v1034, &v1035, (uint64_t)&v1036, *(uint64_t (**)(void))(v446 + 16));
              v451 = v1033;
              uint64_t v452 = v1033[124];
              uint64_t v453 = v1033[120];
              uint64_t v896 = v1033[87];
              uint64_t v454 = v1033[83];
              uint64_t v455 = v1033[80];
              uint64_t v456 = v1033[74];
              swift_release(v446);
              _os_log_impl( (void *)&_mh_execute_header,  v1004,  v448,  "Failed at writing taskParamFile: %s : %@",  v449,  0x16u);
              uint64_t v457 = sub_100007B74(&qword_1000388A0);
              swift_arrayDestroy(v900, 1LL, v457);
              swift_slowDealloc(v900, -1LL, -1LL);
              swift_arrayDestroy(v951, 1LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v951, -1LL, -1LL);
              swift_slowDealloc(v449, -1LL, -1LL);

              swift_errorRelease(v985);
              v1002 = *(void (**)(uint64_t, uint64_t))(v904 + 8);
              v1002(v452, v453);
              v941(v455, v456);
              (*(void (**)(uint64_t, uint64_t))(v995 + 8))(v896, v454);
            }

            else
            {
              v451 = v1033;
              uint64_t v481 = v1033[124];
              uint64_t v482 = v1033[120];
              uint64_t v952 = v1033[87];
              uint64_t v901 = v1033[83];
              uint64_t v483 = v1033[80];
              uint64_t v897 = v1033[74];

              swift_release(v446);
              swift_release(v443);
              swift_release(v442);
              swift_release(v441);
              swift_release(v439);
              swift_release(v438);
              swift_errorRelease(v985);
              v1002 = *(void (**)(uint64_t, uint64_t))(v904 + 8);
              v1002(v481, v482);
              v941(v483, v897);
              (*(void (**)(uint64_t, uint64_t))(v995 + 8))(v952, v901);
            }

            v985 = 0LL;
            uint64_t v377 = v451[67];
          }

          else
          {
            uint64_t v477 = v1033[87];
            uint64_t v478 = v1033[83];
            uint64_t v479 = v1033[80];
            uint64_t v480 = v1033[74];
            uint64_t v377 = v1033[67];
            sub_1000085B4(v422, v423);
            v421(v479, v480);
            (*(void (**)(uint64_t, uint64_t))(v995 + 8))(v477, v478);
            v985 = 0LL;
          }

          goto LABEL_93;
        }

        uint64_t v458 = v1033[181];
        uint64_t v459 = v1033[68];
        uint64_t v460 = v1033[67];
        ((void (*)(void, void, void))v1033[180])(v1033[147], v1033[179], v1033[120]);
        sub_1000087B8(v460, v459, type metadata accessor for TaskParametersRecord);
        uint64_t v461 = swift_allocObject(&unk_100036C30, v970, v966);
        uint64_t v462 = sub_10002DAD8(v459, v461 + v974, type metadata accessor for TaskParametersRecord);
        v463 = (os_log_s *)Logger.logObject.getter(v462);
        os_log_type_t v464 = static os_log_type_t.error.getter();
        uint64_t v465 = swift_allocObject(&unk_100036C58, 17LL, 7LL);
        *(_BYTE *)(v465 + 16) = 32;
        uint64_t v466 = swift_allocObject(&unk_100036C80, 17LL, 7LL);
        *(_BYTE *)(v466 + 16) = 8;
        uint64_t v467 = swift_allocObject(&unk_100036CA8, 32LL, 7LL);
        *(void *)(v467 + 16) = sub_10002D460;
        *(void *)(v467 + 24) = v461;
        uint64_t v468 = swift_allocObject(&unk_100036CD0, 32LL, 7LL);
        *(void *)(v468 + 16) = sub_10002E010;
        *(void *)(v468 + 24) = v467;
        uint64_t v469 = swift_allocObject(v458, 80LL, 7LL);
        *(_OWORD *)(v469 + 16) = v1019;
        *(void *)(v469 + 32) = sub_10002E258;
        *(void *)(v469 + 40) = v465;
        *(void *)(v469 + 48) = sub_10002E258;
        *(void *)(v469 + 56) = v466;
        *(void *)(v469 + 64) = sub_10002E01C;
        *(void *)(v469 + 72) = v468;
        swift_retain(v465);
        swift_retain(v466);
        swift_retain(v468);
        swift_bridgeObjectRelease(v469);
        if (os_log_type_enabled(v463, v464))
        {
          v470 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v471 = swift_slowAlloc(32LL, -1LL);
          v1035 = 0LL;
          double v1036 = *(double *)&v471;
          *(_WORD *)v470 = 258;
          v470[2] = *(_BYTE *)(v465 + 16);
          if (v985) {
            return swift_errorRelease(v985);
          }
          uint64_t v472 = v471;
          swift_release(v465);
          v470[3] = *(_BYTE *)(v466 + 16);
          v1034[0] = (uint64_t)(v470 + 4);
          swift_release(v466);
          sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v468 + 16));
          uint64_t v473 = v1033[147];
          uint64_t v474 = v1033[120];
          uint64_t v475 = v1033[87];
          uint64_t v476 = v1033[83];
          swift_release(v468);
          _os_log_impl( (void *)&_mh_execute_header,  v463,  v464,  "Task %s doesn't have a valid taskFolder. Skipping task.",  v470,  0xCu);
          swift_arrayDestroy(v472, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v472, -1LL, -1LL);
          swift_slowDealloc(v470, -1LL, -1LL);

          v1002(v473, v474);
          v378 = v1033;
          (*(void (**)(uint64_t, uint64_t))(v995 + 8))(v475, v476);
        }

        else
        {
          uint64_t v484 = v1033[147];
          uint64_t v485 = v1033[120];
          uint64_t v486 = v1033[87];
          uint64_t v487 = v1033[83];

          swift_release(v468);
          swift_release(v466);
          swift_release(v465);
          v1002(v484, v485);
          (*(void (**)(uint64_t, uint64_t))(v995 + 8))(v486, v487);
        }
      }

      uint64_t v377 = v378[67];
LABEL_93:
      sub_1000087FC(v377, type metadata accessor for TaskParametersRecord);
      uint64_t v371 = v1014 + v981;
      uint64_t v368 = v1029 - 1;
      if (v1029 == 1)
      {
        v488 = v1002;
        swift_bridgeObjectRelease(v893);
        uint64_t v338 = v1033;
        goto LABEL_113;
      }
    }
  }

  v488 = v1002;
LABEL_113:
  uint64_t v489 = v338[232];
  uint64_t v490 = v338[181];
  ((void (*)(void, void, void))v338[180])(v338[145], v338[179], v338[120]);
  uint64_t v491 = swift_allocObject(&unk_100036370, 32LL, 7LL);
  *(void *)(v491 + 16) = sub_10002CBDC;
  *(void *)(v491 + 24) = v489;
  uint64_t v492 = swift_retain(v489);
  v493 = (os_log_s *)Logger.logObject.getter(v492);
  os_log_type_t v494 = static os_log_type_t.info.getter();
  uint64_t v495 = swift_allocObject(&unk_100036398, 17LL, 7LL);
  *(_BYTE *)(v495 + 16) = 32;
  uint64_t v496 = swift_allocObject(&unk_1000363C0, 17LL, 7LL);
  *(_BYTE *)(v496 + 16) = 8;
  uint64_t v497 = swift_allocObject(&unk_1000363E8, 32LL, 7LL);
  *(void *)(v497 + 16) = sub_10002D4D0;
  *(void *)(v497 + 24) = v491;
  uint64_t v498 = swift_allocObject(&unk_100036410, 32LL, 7LL);
  *(void *)(v498 + 16) = sub_10002E010;
  *(void *)(v498 + 24) = v497;
  uint64_t v499 = swift_allocObject(v490, 80LL, 7LL);
  *(_OWORD *)(v499 + 16) = v1019;
  *(void *)(v499 + 32) = sub_10002E258;
  *(void *)(v499 + 40) = v495;
  *(void *)(v499 + 48) = sub_10002E258;
  *(void *)(v499 + 56) = v496;
  *(void *)(v499 + 64) = sub_10002E01C;
  *(void *)(v499 + 72) = v498;
  swift_retain(v495);
  swift_retain(v496);
  swift_retain(v498);
  swift_bridgeObjectRelease(v499);
  if (os_log_type_enabled(v493, v494))
  {
    v500 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v501 = swift_slowAlloc(32LL, -1LL);
    v1035 = 0LL;
    double v1036 = *(double *)&v501;
    *(_WORD *)v500 = 258;
    v500[2] = *(_BYTE *)(v495 + 16);
    if (v985) {
      return swift_errorRelease(v985);
    }
    uint64_t v502 = v501;
    swift_release(v495);
    v500[3] = *(_BYTE *)(v496 + 16);
    v1034[0] = (uint64_t)(v500 + 4);
    swift_release(v496);
    sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v498 + 16));
    uint64_t v503 = v338[145];
    uint64_t v504 = v338[120];
    swift_release(v498);
    _os_log_impl((void *)&_mh_execute_header, v493, v494, "Processing TaskPayloadRecords: %s", v500, 0xCu);
    swift_arrayDestroy(v502, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v502, -1LL, -1LL);
    swift_slowDealloc(v500, -1LL, -1LL);

    uint64_t v505 = v503;
    uint64_t v506 = v504;
  }

  else
  {
    uint64_t v507 = v338[145];
    uint64_t v508 = v338[120];
    swift_release(v495);
    swift_release(v496);
    swift_release(v498);

    uint64_t v505 = v507;
    uint64_t v506 = v508;
  }

  v509 = v488;
  v488(v505, v506);
  uint64_t v510 = v338[232];
  swift_beginAccess(v510 + 16, v338 + 2, 0LL, 0LL);
  uint64_t v511 = *(void *)(v510 + 16);
  uint64_t v512 = *(void *)(v511 + 16);
  if (!v512)
  {
LABEL_164:
    v762 = v1033;
    v763 = (void (*)(uint64_t, uint64_t))v1033[185];
    uint64_t v764 = v1033[115];
    uint64_t v765 = v1033[109];
    swift_bridgeObjectRelease(v1033[224]);
    uint64_t v766 = swift_bridgeObjectRelease(v1033[38]);
    uint64_t v767 = static Date.now.getter(v766);
    double v768 = Date.timeIntervalSinceReferenceDate.getter(v767);
    v763(v764, v765);
    sub_10002DFC0(0LL, &qword_100038828, &OBJC_CLASS___NSUserDefaults_ptr);
    id v769 = sub_100025B00(0xD000000000000010LL, 0x8000000100030070LL);
    if (v769)
    {
      v770 = v769;
      v771 = v509;
      uint64_t v772 = v1033[181];
      ((void (*)(void, void, void))v1033[180])(v1033[138], v1033[179], v1033[120]);
      uint64_t v773 = swift_allocObject(&unk_100036500, 24LL, 7LL);
      *(double *)(v773 + 16) = v768;
      v774 = (os_log_s *)Logger.logObject.getter(v773);
      os_log_type_t v775 = static os_log_type_t.info.getter();
      uint64_t v776 = swift_allocObject(&unk_100036528, 17LL, 7LL);
      *(_BYTE *)(v776 + 16) = 0;
      uint64_t v777 = swift_allocObject(&unk_100036550, 17LL, 7LL);
      *(_BYTE *)(v777 + 16) = 8;
      uint64_t v778 = swift_allocObject(&unk_100036578, 32LL, 7LL);
      *(void *)(v778 + 16) = sub_10002E02C;
      *(void *)(v778 + 24) = v773;
      uint64_t v779 = swift_allocObject(&unk_1000365A0, 32LL, 7LL);
      *(void *)(v779 + 16) = sub_100029448;
      *(void *)(v779 + 24) = v778;
      uint64_t v780 = swift_allocObject(v772, 80LL, 7LL);
      *(_OWORD *)(v780 + 16) = v1019;
      *(void *)(v780 + 32) = sub_10002E258;
      *(void *)(v780 + 40) = v776;
      *(void *)(v780 + 48) = sub_10002E258;
      *(void *)(v780 + 56) = v777;
      *(void *)(v780 + 64) = sub_10002D570;
      *(void *)(v780 + 72) = v779;
      swift_retain(v776);
      swift_retain(v777);
      swift_retain(v779);
      swift_bridgeObjectRelease(v780);
      if (os_log_type_enabled(v774, v775))
      {
        uint64_t v781 = swift_slowAlloc(12LL, -1LL);
        *(_WORD *)uint64_t v781 = 256;
        *(_BYTE *)(v781 + 2) = *(_BYTE *)(v776 + 16);
        if (v985) {
          return swift_errorRelease(v985);
        }
        v795 = (uint8_t *)v781;
        swift_release(v776);
        v795[3] = *(_BYTE *)(v777 + 16);
        uint64_t v796 = swift_release(v777);
        double v1036 = (*(double (**)(uint64_t))(v779 + 16))(v796);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v1036, &v1037);
        uint64_t v797 = v1033[138];
        uint64_t v798 = v1033[120];
        swift_release(v779);
        _os_log_impl((void *)&_mh_execute_header, v774, v775, "Marking lastSuccessTimestamp: %f", v795, 0xCu);
        swift_slowDealloc(v795, -1LL, -1LL);

        uint64_t v784 = v797;
        uint64_t v785 = v798;
      }

      else
      {
        uint64_t v782 = v1033[138];
        uint64_t v783 = v1033[120];
        swift_release(v776);
        swift_release(v777);
        swift_release(v779);

        uint64_t v784 = v782;
        uint64_t v785 = v783;
      }

      v771(v784, v785);
      Class v799 = Double._bridgeToObjectiveC()().super.super.isa;
      NSString v800 = String._bridgeToObjectiveC()();
      [v770 setValue:v799 forKey:v800];

      v762 = v1033;
    }

    uint64_t v983 = v762[232];
    v990 = (os_log_s *)v762[226];
    uint64_t v1031 = v762[210];
    v801 = (void *)v762[193];
    v802 = (void *)v762[192];
    v803 = (void *)v762[191];
    v804 = (void *)v762[190];
    v805 = (void *)v762[189];
    v806 = (void *)v762[188];
    uint64_t v807 = v762[187];
    uint64_t v792 = v762[186];
    uint64_t v997 = v762[118];
    uint64_t v1007 = v762[225];
    uint64_t v1016 = v762[117];
    uint64_t v1020 = v762[119];
    id v808 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v818 = MLHostResult.init(status:policy:)(2LL, 1LL);

    swift_release(v807);
    goto LABEL_174;
  }

  v902 = v338 + 16;
  v898 = v338 + 40;
  v872 = v338 + 42;
  v874 = v338 + 14;
  uint64_t v878 = v338[121];
  uint64_t v513 = v338[84];
  uint64_t v964 = v338[75];
  uint64_t v894 = v338[71];
  uint64_t v876 = v338[60];
  uint64_t v514 = v338[58];
  uint64_t v515 = *(unsigned __int8 *)(v514 + 80);
  uint64_t v516 = v511 + ((v515 + 32) & ~v515);
  unsigned int v905 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v971 = ((v515 + 16) & ~v515) + v338[59];
  uint64_t v975 = (v515 + 16) & ~v515;
  uint64_t v967 = v515 | 7;
  uint64_t v996 = *(void *)(v514 + 72);
  uint64_t v870 = *(void *)(v510 + 16);
  swift_bridgeObjectRetain(v511);
  uint64_t v982 = v513;
  while (1)
  {
    uint64_t v524 = sub_1000087B8(v516, v338[60], type metadata accessor for TaskPayloadRecord);
    char v525 = static Task<>.isCancelled.getter(v524);
    uint64_t v526 = v338[224];
    if ((v525 & 1) != 0) {
      break;
    }
    uint64_t v1015 = v516;
    uint64_t v527 = v338[83];
    uint64_t v528 = v338[60];
    uint64_t v529 = v338[54];
    uint64_t v530 = swift_task_alloc(32LL);
    *(void *)(v530 + 16) = v528;
    sub_100026728((uint64_t (*)(char *))sub_10002DFF8, v526, v529);
    swift_task_dealloc(v530);
    v1005 = v509;
    uint64_t v1030 = v512;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v513 + 48))(v529, 1LL, v527) == 1)
    {
      uint64_t v531 = v338[181];
      v532 = (void (*)(uint64_t, uint64_t, uint64_t))v338[180];
      uint64_t v533 = v338[179];
      uint64_t v534 = v338[139];
      uint64_t v535 = v338[120];
      uint64_t v537 = v338[60];
      uint64_t v536 = v338[61];
      sub_100008880(v338[54], &qword_1000387F0);
      v532(v534, v533, v535);
      sub_1000087B8(v537, v536, type metadata accessor for TaskPayloadRecord);
      uint64_t v538 = swift_allocObject(&unk_100036438, v971, v967);
      uint64_t v539 = sub_10002DAD8(v536, v538 + v975, type metadata accessor for TaskPayloadRecord);
      v540 = (os_log_s *)Logger.logObject.getter(v539);
      os_log_type_t v541 = static os_log_type_t.error.getter();
      uint64_t v542 = swift_allocObject(&unk_100036460, 17LL, 7LL);
      *(_BYTE *)(v542 + 16) = 32;
      uint64_t v543 = swift_allocObject(&unk_100036488, 17LL, 7LL);
      *(_BYTE *)(v543 + 16) = 8;
      uint64_t v544 = swift_allocObject(&unk_1000364B0, 32LL, 7LL);
      *(void *)(v544 + 16) = sub_10002D514;
      *(void *)(v544 + 24) = v538;
      uint64_t v545 = swift_allocObject(&unk_1000364D8, 32LL, 7LL);
      *(void *)(v545 + 16) = sub_10002E010;
      *(void *)(v545 + 24) = v544;
      uint64_t v546 = swift_allocObject(v531, 80LL, 7LL);
      *(_OWORD *)(v546 + 16) = v1019;
      *(void *)(v546 + 32) = sub_10002E258;
      *(void *)(v546 + 40) = v542;
      *(void *)(v546 + 48) = sub_10002E258;
      *(void *)(v546 + 56) = v543;
      *(void *)(v546 + 64) = sub_10002E01C;
      *(void *)(v546 + 72) = v545;
      swift_retain(v542);
      swift_retain(v543);
      swift_retain(v545);
      swift_bridgeObjectRelease(v546);
      if (os_log_type_enabled(v540, v541))
      {
        v547 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v548 = swift_slowAlloc(32LL, -1LL);
        v1035 = 0LL;
        double v1036 = *(double *)&v548;
        *(_WORD *)v547 = 258;
        v547[2] = *(_BYTE *)(v542 + 16);
        if (v985) {
          return swift_errorRelease(v985);
        }
        uint64_t v549 = v548;
        swift_release(v542);
        v547[3] = *(_BYTE *)(v543 + 16);
        v1034[0] = (uint64_t)(v547 + 4);
        swift_release(v543);
        sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v545 + 16));
        uint64_t v550 = v338[139];
        uint64_t v551 = v338[120];
        swift_release(v545);
        _os_log_impl( (void *)&_mh_execute_header,  v540,  v541,  "Task %s not registered on the system. Skipping task.",  v547,  0xCu);
        swift_arrayDestroy(v549, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v549, -1LL, -1LL);
        swift_slowDealloc(v547, -1LL, -1LL);

        uint64_t v519 = v550;
        uint64_t v520 = v551;
      }

      else
      {
        uint64_t v517 = v338[139];
        uint64_t v518 = v338[120];
        swift_release(v542);
        swift_release(v543);
        swift_release(v545);

        uint64_t v519 = v517;
        uint64_t v520 = v518;
      }

      v509 = v1005;
      v1005(v519, v520);
      uint64_t v521 = v338[60];
      uint64_t v522 = v1030;
      uint64_t v513 = v982;
      goto LABEL_121;
    }

    uint64_t v552 = (*(uint64_t (**)(void, void, void))(v513 + 32))(v338[86], v338[54], v338[83]);
    uint64_t v553 = MLHostTask.taskFolder.getter(v552);
    if (!v554)
    {
      uint64_t v598 = v338[181];
      uint64_t v599 = v338[60];
      uint64_t v600 = v338[61];
      ((void (*)(void, void, void))v338[180])(v338[140], v338[179], v338[120]);
      sub_1000087B8(v599, v600, type metadata accessor for TaskPayloadRecord);
      uint64_t v601 = swift_allocObject(&unk_1000365C8, v971, v967);
      uint64_t v602 = sub_10002DAD8(v600, v601 + v975, type metadata accessor for TaskPayloadRecord);
      v603 = (os_log_s *)Logger.logObject.getter(v602);
      os_log_type_t v604 = static os_log_type_t.error.getter();
      uint64_t v605 = swift_allocObject(&unk_1000365F0, 17LL, 7LL);
      *(_BYTE *)(v605 + 16) = 32;
      uint64_t v606 = swift_allocObject(&unk_100036618, 17LL, 7LL);
      *(_BYTE *)(v606 + 16) = 8;
      uint64_t v607 = swift_allocObject(&unk_100036640, 32LL, 7LL);
      *(void *)(v607 + 16) = sub_10002D514;
      *(void *)(v607 + 24) = v601;
      uint64_t v608 = swift_allocObject(&unk_100036668, 32LL, 7LL);
      *(void *)(v608 + 16) = sub_10002E010;
      *(void *)(v608 + 24) = v607;
      uint64_t v609 = swift_allocObject(v598, 80LL, 7LL);
      *(_OWORD *)(v609 + 16) = v1019;
      *(void *)(v609 + 32) = sub_10002E258;
      *(void *)(v609 + 40) = v605;
      *(void *)(v609 + 48) = sub_10002E258;
      *(void *)(v609 + 56) = v606;
      *(void *)(v609 + 64) = sub_10002E01C;
      *(void *)(v609 + 72) = v608;
      swift_retain(v605);
      swift_retain(v606);
      swift_retain(v608);
      swift_bridgeObjectRelease(v609);
      if (os_log_type_enabled(v603, v604))
      {
        v610 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v611 = swift_slowAlloc(32LL, -1LL);
        v1035 = 0LL;
        double v1036 = *(double *)&v611;
        *(_WORD *)v610 = 258;
        v610[2] = *(_BYTE *)(v605 + 16);
        if (v985) {
          return swift_errorRelease(v985);
        }
        uint64_t v612 = v611;
        swift_release(v605);
        v610[3] = *(_BYTE *)(v606 + 16);
        v1034[0] = (uint64_t)(v610 + 4);
        swift_release(v606);
        sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v608 + 16));
        uint64_t v613 = v338[140];
        uint64_t v614 = v338[120];
        uint64_t v615 = v338[86];
        uint64_t v616 = v338[83];
        swift_release(v608);
        _os_log_impl( (void *)&_mh_execute_header,  v603,  v604,  "Task %s doesn't have a valid taskFolder. Skipping task.",  v610,  0xCu);
        swift_arrayDestroy(v612, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v612, -1LL, -1LL);
        swift_slowDealloc(v610, -1LL, -1LL);

        v509 = v1005;
        v1005(v613, v614);
        uint64_t v513 = v982;
        (*(void (**)(uint64_t, uint64_t))(v982 + 8))(v615, v616);
      }

      else
      {
        uint64_t v648 = v338[140];
        uint64_t v649 = v338[120];
        uint64_t v650 = v338[86];
        uint64_t v651 = v338[83];

        swift_release(v608);
        swift_release(v606);
        swift_release(v605);
        v509 = v1005;
        v1005(v648, v649);
        uint64_t v652 = v651;
        uint64_t v513 = v982;
        (*(void (**)(uint64_t, uint64_t))(v982 + 8))(v650, v652);
      }

      uint64_t v521 = v338[60];
      goto LABEL_142;
    }

    uint64_t v555 = v553;
    uint64_t v556 = v554;
    uint64_t v557 = v338[73];
    uint64_t v558 = v338[72];
    v908 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v964 + 56);
    v908(v557, 1LL, 1LL, v338[74]);
    uint64_t v559 = type metadata accessor for URL.DirectoryHint(0LL);
    v560 = *(void (**)(uint64_t, void, uint64_t))(*(void *)(v559 - 8) + 104LL);
    v560(v558, v905, v559);
    URL.init(filePath:directoryHint:relativeTo:)(v555, v556, v558, v557);
    if (qword_1000383A0 != -1) {
      swift_once(&qword_1000383A0, sub_10000B000);
    }
    uint64_t v561 = v338[82];
    uint64_t v562 = v338[74];
    uint64_t v563 = v338[72];
    uint64_t v564 = v338[70];
    uint64_t v565 = *(void *)algn_100038788;
    v338[16] = qword_100038780;
    v338[17] = v565;
    v560(v563, v905, v559);
    v912 = v560;
    unint64_t v566 = sub_100028A54();
    swift_bridgeObjectRetain(v565);
    unint64_t v891 = v566;
    URL.appending<A>(path:directoryHint:)(v902, v563, &type metadata for String, v566);
    v889 = *(void (**)(uint64_t, uint64_t))(v894 + 8);
    v889(v563, v564);
    swift_bridgeObjectRelease(v338[17]);
    v916 = *(void (**)(uint64_t, uint64_t))(v964 + 8);
    v916(v561, v562);
    id v887 = (id)objc_opt_self(&OBJC_CLASS___NSFileManager);
    id v567 = [v887 defaultManager];
    v568 = URL.path(percentEncoded:)(0)._object;
    NSString v569 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v568);
    v338[40] = 0LL;
    v570 = v338;
    unsigned int v571 = [v567 createDirectoryAtPath:v569 withIntermediateDirectories:1 attributes:0 error:v898];

    v572 = (void *)v570[40];
    uint64_t v953 = v570[181];
    v926 = (void (*)(uint64_t, uint64_t, uint64_t))v570[180];
    uint64_t v919 = v570[179];
    uint64_t v573 = v570[120];
    uint64_t v942 = v570[82];
    uint64_t v932 = v570[76];
    uint64_t v574 = v570[74];
    if (v571)
    {
      uint64_t v575 = v1033[78];
      uint64_t v576 = v1033[73];
      uint64_t v577 = v1033[72];
      uint64_t v578 = *(void *)(v876 + 40);
      uint64_t v881 = *(void *)(v876 + 32);
      uint64_t v884 = v1033[143];
      v908(v576, 1LL, 1LL, v574);
      uint64_t v909 = v559;
      v912(v577, v905, v559);
      id v579 = v572;
      swift_bridgeObjectRetain(v578);
      URL.init(filePath:directoryHint:relativeTo:)(v881, v578, v577, v576);
      v926(v884, v919, v573);
      uint64_t v580 = v942;
      v927 = *(void (**)(uint64_t, uint64_t, uint64_t))(v964 + 16);
      v927(v942, v575, v574);
      uint64_t v581 = *(unsigned __int8 *)(v964 + 80);
      uint64_t v582 = (v581 + 16) & ~v581;
      uint64_t v583 = v582 + v932;
      uint64_t v920 = v582 + v932;
      uint64_t v933 = v581 | 7;
      uint64_t v584 = swift_allocObject(&unk_100036870, v583, v581 | 7);
      v943 = *(void (**)(uint64_t, uint64_t, uint64_t))(v964 + 32);
      v943(v584 + v582, v580, v574);
      uint64_t v585 = swift_allocObject(&unk_100036898, 32LL, 7LL);
      *(void *)(v585 + 16) = sub_10002D65C;
      *(void *)(v585 + 24) = v584;
      v586 = (os_log_s *)Logger.logObject.getter(v585);
      os_log_type_t v587 = static os_log_type_t.info.getter();
      uint64_t v588 = swift_allocObject(&unk_1000368C0, 17LL, 7LL);
      *(_BYTE *)(v588 + 16) = 32;
      uint64_t v589 = swift_allocObject(&unk_1000368E8, 17LL, 7LL);
      *(_BYTE *)(v589 + 16) = 8;
      uint64_t v590 = swift_allocObject(&unk_100036910, 32LL, 7LL);
      *(void *)(v590 + 16) = sub_10002E014;
      *(void *)(v590 + 24) = v585;
      uint64_t v591 = swift_allocObject(&unk_100036938, 32LL, 7LL);
      *(void *)(v591 + 16) = sub_10002E010;
      *(void *)(v591 + 24) = v590;
      uint64_t v592 = swift_allocObject(v953, 80LL, 7LL);
      *(_OWORD *)(v592 + 16) = v1019;
      *(void *)(v592 + 32) = sub_10002E258;
      *(void *)(v592 + 40) = v588;
      *(void *)(v592 + 48) = sub_10002E258;
      *(void *)(v592 + 56) = v589;
      *(void *)(v592 + 64) = sub_10002E01C;
      *(void *)(v592 + 72) = v591;
      swift_retain(v588);
      swift_retain(v589);
      swift_retain(v591);
      swift_bridgeObjectRelease(v592);
      if (os_log_type_enabled(v586, v587))
      {
        v593 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v594 = swift_slowAlloc(32LL, -1LL);
        v1035 = 0LL;
        double v1036 = *(double *)&v594;
        *(_WORD *)v593 = 258;
        v593[2] = *(_BYTE *)(v588 + 16);
        if (v985) {
          return swift_errorRelease(v985);
        }
        uint64_t v595 = v594;
        swift_release(v588);
        v593[3] = *(_BYTE *)(v589 + 16);
        v1034[0] = (uint64_t)(v593 + 4);
        swift_release(v589);
        sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v591 + 16));
        uint64_t v338 = v1033;
        uint64_t v596 = v1033[143];
        uint64_t v597 = v1033[120];
        swift_release(v591);
        _os_log_impl((void *)&_mh_execute_header, v586, v587, "Processing: %s", v593, 0xCu);
        swift_arrayDestroy(v595, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v595, -1LL, -1LL);
        swift_slowDealloc(v593, -1LL, -1LL);

        v1005(v596, v597);
      }

      else
      {
        uint64_t v653 = v1033[143];
        uint64_t v654 = v1033[120];
        swift_release(v588);
        swift_release(v589);
        swift_release(v591);

        v1005(v653, v654);
        uint64_t v338 = v1033;
      }

      if ((sub_10002690C(v338[78], v338[79]) & 1) != 0)
      {
        uint64_t v655 = v338[181];
        uint64_t v656 = v338[82];
        uint64_t v657 = v338[79];
        uint64_t v658 = v338[74];
        ((void (*)(void, void, void))v338[180])(v338[142], v338[179], v338[120]);
        v927(v656, v657, v658);
        uint64_t v659 = swift_allocObject(&unk_100036B40, v920, v933);
        v943(v659 + v582, v656, v658);
        uint64_t v660 = swift_allocObject(&unk_100036B68, 32LL, 7LL);
        *(void *)(v660 + 16) = sub_10002D65C;
        *(void *)(v660 + 24) = v659;
        v661 = (os_log_s *)Logger.logObject.getter(v660);
        os_log_type_t v662 = static os_log_type_t.info.getter();
        uint64_t v663 = swift_allocObject(&unk_100036B90, 17LL, 7LL);
        *(_BYTE *)(v663 + 16) = 32;
        uint64_t v664 = swift_allocObject(&unk_100036BB8, 17LL, 7LL);
        *(_BYTE *)(v664 + 16) = 8;
        uint64_t v665 = swift_allocObject(&unk_100036BE0, 32LL, 7LL);
        *(void *)(v665 + 16) = sub_10002E014;
        *(void *)(v665 + 24) = v660;
        uint64_t v666 = swift_allocObject(&unk_100036C08, 32LL, 7LL);
        *(void *)(v666 + 16) = sub_10002E010;
        *(void *)(v666 + 24) = v665;
        uint64_t v667 = swift_allocObject(v655, 80LL, 7LL);
        *(_OWORD *)(v667 + 16) = v1019;
        *(void *)(v667 + 32) = sub_10002E258;
        *(void *)(v667 + 40) = v663;
        *(void *)(v667 + 48) = sub_10002E258;
        *(void *)(v667 + 56) = v664;
        *(void *)(v667 + 64) = sub_10002E01C;
        *(void *)(v667 + 72) = v666;
        swift_retain(v663);
        swift_retain(v664);
        swift_retain(v666);
        swift_bridgeObjectRelease(v667);
        if (os_log_type_enabled(v661, v662))
        {
          v668 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v669 = swift_slowAlloc(32LL, -1LL);
          v1035 = 0LL;
          double v1036 = *(double *)&v669;
          *(_WORD *)v668 = 258;
          v668[2] = *(_BYTE *)(v663 + 16);
          if (v985) {
            return swift_errorRelease(v985);
          }
          uint64_t v670 = v669;
          swift_release(v663);
          v668[3] = *(_BYTE *)(v664 + 16);
          v1034[0] = (uint64_t)(v668 + 4);
          swift_release(v664);
          sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v666 + 16));
          uint64_t v671 = v338[142];
          uint64_t v672 = v338[120];
          uint64_t v955 = v338[86];
          uint64_t v945 = v338[83];
          uint64_t v935 = v338[79];
          uint64_t v673 = v338[78];
          uint64_t v674 = v338[74];
          swift_release(v666);
          _os_log_impl((void *)&_mh_execute_header, v661, v662, "TaskPayload extracted at: %s", v668, 0xCu);
          swift_arrayDestroy(v670, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v670, -1LL, -1LL);
          swift_slowDealloc(v668, -1LL, -1LL);

          v509 = v1005;
          v1005(v671, v672);
          v675 = v916;
          v916(v673, v674);
          uint64_t v676 = v935;
          uint64_t v677 = v674;
        }

        else
        {
          uint64_t v690 = v338[142];
          uint64_t v691 = v338[120];
          uint64_t v955 = v338[86];
          uint64_t v945 = v338[83];
          uint64_t v692 = v338[79];
          uint64_t v693 = v338[78];
          uint64_t v694 = v338[74];

          swift_release(v666);
          swift_release(v664);
          swift_release(v663);
          v509 = v1005;
          v1005(v690, v691);
          v675 = v916;
          v916(v693, v694);
          uint64_t v676 = v692;
          uint64_t v677 = v694;
        }

        v675(v676, v677);
        uint64_t v513 = v982;
        (*(void (**)(uint64_t, uint64_t))(v982 + 8))(v955, v945);
        uint64_t v521 = v338[60];
        goto LABEL_154;
      }

      uint64_t v683 = ((uint64_t (*)(void, void, void))v338[180])(v338[141], v338[179], v338[120]);
      v684 = (os_log_s *)Logger.logObject.getter(v683);
      os_log_type_t v685 = static os_log_type_t.info.getter();
      BOOL v686 = os_log_type_enabled(v684, v685);
      uint64_t v687 = v338[141];
      uint64_t v688 = v338[120];
      uint64_t v882 = v582;
      if (v686)
      {
        v689 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        v1035 = 0LL;
        double v1036 = 0.0;
        *(_WORD *)v689 = 0;
        v1034[0] = (uint64_t)(v689 + 2);
        sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v1034, (uint64_t)&v1035, (uint64_t)&v1036);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        _os_log_impl( (void *)&_mh_execute_header,  v684,  v685,  "Failed at processing archive, copying raw archive into taskFolder.",  v689,  2u);
        swift_slowDealloc(v689, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      }

      v1005(v687, v688);
      uint64_t v695 = v338[72];
      uint64_t v696 = v338[70];
      v338[14] = 0x612E737465737361LL;
      v338[15] = 0xEA00000000007261LL;
      v912(v695, v905, v909);
      URL.appending<A>(path:directoryHint:)(v874, v695, &type metadata for String, v891);
      v889(v695, v696);
      swift_bridgeObjectRelease(v338[15]);
      id v697 = [v887 defaultManager];
      URL._bridgeToObjectiveC()(v698);
      v700 = v699;
      URL._bridgeToObjectiveC()(v701);
      v703 = v702;
      v338[42] = 0LL;
      LODWORD(v696) = [v697 copyItemAtURL:v700 toURL:v702 error:v872];

      v704 = (void *)v338[42];
      if ((_DWORD)v696)
      {
        uint64_t v705 = v338[86];
        uint64_t v706 = v338[83];
        uint64_t v707 = v338[79];
        uint64_t v708 = v338[78];
        uint64_t v709 = v338[77];
        uint64_t v710 = v338[74];
        uint64_t v521 = v338[60];
        id v711 = v704;
        v916(v709, v710);
        v916(v708, v710);
        v916(v707, v710);
        uint64_t v513 = v982;
        (*(void (**)(uint64_t, uint64_t))(v982 + 8))(v705, v706);
        v509 = v1005;
LABEL_142:
        uint64_t v522 = v1030;
        uint64_t v523 = v1015;
        goto LABEL_122;
      }

      v988 = (os_log_s *)v338[181];
      v712 = (void (*)(uint64_t, uint64_t, uint64_t))v338[180];
      uint64_t v713 = v338[179];
      uint64_t v714 = v338[122];
      uint64_t v715 = v338[120];
      uint64_t v716 = v338[82];
      uint64_t v717 = v338[77];
      uint64_t v718 = v338[74];
      id v719 = v704;
      uint64_t v720 = _convertNSErrorToError(_:)(v704);

      swift_willThrow();
      v712(v714, v713, v715);
      v927(v716, v717, v718);
      uint64_t v721 = swift_allocObject(&unk_100036960, v920, v933);
      v943(v721 + v882, v716, v718);
      uint64_t v722 = swift_allocObject(&unk_100036988, 32LL, 7LL);
      *(void *)(v722 + 16) = sub_10002D65C;
      *(void *)(v722 + 24) = v721;
      uint64_t v723 = swift_allocObject(&unk_1000369B0, 24LL, 7LL);
      *(void *)(v723 + 16) = v720;
      uint64_t v947 = v720;
      uint64_t v724 = swift_errorRetain(v720);
      v725 = (os_log_s *)Logger.logObject.getter(v724);
      os_log_type_t v957 = static os_log_type_t.error.getter();
      uint64_t v726 = swift_allocObject(&unk_1000369D8, 17LL, 7LL);
      *(_BYTE *)(v726 + 16) = 32;
      uint64_t v727 = swift_allocObject(&unk_100036A00, 17LL, 7LL);
      *(_BYTE *)(v727 + 16) = 8;
      uint64_t v728 = swift_allocObject(&unk_100036A28, 32LL, 7LL);
      *(void *)(v728 + 16) = sub_10002E014;
      *(void *)(v728 + 24) = v722;
      uint64_t v729 = swift_allocObject(&unk_100036A50, 32LL, 7LL);
      *(void *)(v729 + 16) = sub_10002E010;
      *(void *)(v729 + 24) = v728;
      uint64_t v730 = swift_allocObject(&unk_100036A78, 17LL, 7LL);
      *(_BYTE *)(v730 + 16) = 64;
      uint64_t v731 = swift_allocObject(&unk_100036AA0, 17LL, 7LL);
      *(_BYTE *)(v731 + 16) = 8;
      uint64_t v732 = swift_allocObject(&unk_100036AC8, 32LL, 7LL);
      *(void *)(v732 + 16) = sub_10002E250;
      *(void *)(v732 + 24) = v723;
      uint64_t v733 = swift_allocObject(&unk_100036AF0, 32LL, 7LL);
      *(void *)(v733 + 16) = sub_10002CAF8;
      *(void *)(v733 + 24) = v732;
      v617 = v338;
      uint64_t v734 = swift_allocObject(&unk_100036B18, 32LL, 7LL);
      *(void *)(v734 + 16) = sub_10002E010;
      *(void *)(v734 + 24) = v733;
      uint64_t v735 = swift_allocObject(v988, 128LL, 7LL);
      *(_OWORD *)(v735 + 16) = xmmword_10002FBC0;
      *(void *)(v735 + 32) = sub_10002E258;
      *(void *)(v735 + 40) = v726;
      *(void *)(v735 + 48) = sub_10002E258;
      *(void *)(v735 + 56) = v727;
      *(void *)(v735 + 64) = sub_10002E01C;
      *(void *)(v735 + 72) = v729;
      *(void *)(v735 + 80) = sub_10002E258;
      *(void *)(v735 + 88) = v730;
      *(void *)(v735 + 96) = sub_10002E258;
      *(void *)(v735 + 104) = v731;
      *(void *)(v735 + 112) = sub_10002E020;
      *(void *)(v735 + 120) = v734;
      swift_retain(v726);
      swift_retain(v727);
      swift_retain(v729);
      swift_retain(v730);
      swift_retain(v731);
      swift_retain(v734);
      swift_bridgeObjectRelease(v735);
      os_log_type_t v736 = v957;
      v989 = v725;
      if (os_log_type_enabled(v725, v957))
      {
        v737 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
        v921 = (void *)swift_slowAlloc(8LL, -1LL);
        uint64_t v958 = swift_slowAlloc(32LL, -1LL);
        v1035 = v921;
        double v1036 = *(double *)&v958;
        *(_WORD *)v737 = 514;
        v737[2] = *(_BYTE *)(v726 + 16);
        swift_release(v726);
        v737[3] = *(_BYTE *)(v727 + 16);
        v1034[0] = (uint64_t)(v737 + 4);
        swift_release(v727);
        sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v729 + 16));
        swift_release(v729);
        uint64_t v738 = v1034[0];
        *(_BYTE *)v1034[0] = *(_BYTE *)(v730 + 16);
        swift_release(v730);
        *(_BYTE *)(v738 + 1) = *(_BYTE *)(v731 + 16);
        v1034[0] = v738 + 2;
        swift_release(v731);
        sub_100029334(v1034, &v1035, (uint64_t)&v1036, *(uint64_t (**)(void))(v734 + 16));
        uint64_t v739 = v617[122];
        uint64_t v740 = v617[120];
        uint64_t v937 = v617[86];
        uint64_t v928 = v617[83];
        uint64_t v741 = v617[79];
        uint64_t v742 = v617[78];
        uint64_t v743 = v617[77];
        uint64_t v744 = v617[74];
        swift_release(v734);
        _os_log_impl((void *)&_mh_execute_header, v989, v736, "Failed at asset to: %s : %@", v737, 0x16u);
        uint64_t v745 = sub_100007B74(&qword_1000388A0);
        swift_arrayDestroy(v921, 1LL, v745);
        swift_slowDealloc(v921, -1LL, -1LL);
        swift_arrayDestroy(v958, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v958, -1LL, -1LL);
        swift_slowDealloc(v737, -1LL, -1LL);

        swift_errorRelease(v947);
        v1005(v739, v740);
        v916(v743, v744);
        v916(v742, v744);
        uint64_t v746 = v741;
        v509 = v1005;
        v916(v746, v744);
        uint64_t v513 = v982;
        (*(void (**)(uint64_t, uint64_t))(v982 + 8))(v937, v928);
      }

      else
      {
        uint64_t v747 = v617[122];
        uint64_t v913 = v617[120];
        uint64_t v959 = v617[86];
        uint64_t v938 = v617[83];
        uint64_t v929 = v617[79];
        uint64_t v922 = v617[78];
        uint64_t v748 = v617[77];
        uint64_t v749 = v617[74];

        swift_release(v734);
        swift_release(v731);
        swift_release(v730);
        swift_release(v729);
        swift_release(v727);
        swift_release(v726);
        swift_errorRelease(v947);
        v509 = v1005;
        v1005(v747, v913);
        v916(v748, v749);
        v916(v922, v749);
        v916(v929, v749);
        uint64_t v513 = v982;
        (*(void (**)(uint64_t, uint64_t))(v982 + 8))(v959, v938);
      }
    }

    else
    {
      v617 = v1033;
      uint64_t v618 = v1033[123];
      uint64_t v619 = v1033[79];
      id v620 = v572;
      uint64_t v621 = _convertNSErrorToError(_:)(v572);

      swift_willThrow();
      v926(v618, v919, v573);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v964 + 16))(v942, v619, v574);
      uint64_t v622 = *(unsigned __int8 *)(v964 + 80);
      uint64_t v623 = (v622 + 16) & ~v622;
      uint64_t v624 = swift_allocObject(&unk_100036690, v623 + v932, v622 | 7);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v964 + 32))(v624 + v623, v942, v574);
      uint64_t v625 = swift_allocObject(&unk_1000366B8, 32LL, 7LL);
      *(void *)(v625 + 16) = sub_10002D65C;
      *(void *)(v625 + 24) = v624;
      uint64_t v626 = swift_allocObject(&unk_1000366E0, 24LL, 7LL);
      *(void *)(v626 + 16) = v621;
      uint64_t v1006 = v621;
      uint64_t v627 = swift_errorRetain(v621);
      v628 = (os_log_s *)Logger.logObject.getter(v627);
      os_log_type_t v986 = static os_log_type_t.error.getter();
      uint64_t v629 = swift_allocObject(&unk_100036708, 17LL, 7LL);
      *(_BYTE *)(v629 + 16) = 32;
      uint64_t v630 = swift_allocObject(&unk_100036730, 17LL, 7LL);
      *(_BYTE *)(v630 + 16) = 8;
      uint64_t v631 = swift_allocObject(&unk_100036758, 32LL, 7LL);
      *(void *)(v631 + 16) = sub_10002D668;
      *(void *)(v631 + 24) = v625;
      uint64_t v632 = swift_allocObject(&unk_100036780, 32LL, 7LL);
      *(void *)(v632 + 16) = sub_10002E010;
      *(void *)(v632 + 24) = v631;
      uint64_t v633 = swift_allocObject(&unk_1000367A8, 17LL, 7LL);
      *(_BYTE *)(v633 + 16) = 64;
      uint64_t v634 = swift_allocObject(&unk_1000367D0, 17LL, 7LL);
      *(_BYTE *)(v634 + 16) = 8;
      uint64_t v635 = swift_allocObject(&unk_1000367F8, 32LL, 7LL);
      *(void *)(v635 + 16) = sub_10002E250;
      *(void *)(v635 + 24) = v626;
      uint64_t v636 = swift_allocObject(&unk_100036820, 32LL, 7LL);
      *(void *)(v636 + 16) = sub_10002CAF8;
      *(void *)(v636 + 24) = v635;
      uint64_t v637 = swift_allocObject(&unk_100036848, 32LL, 7LL);
      *(void *)(v637 + 16) = sub_10002E010;
      *(void *)(v637 + 24) = v636;
      uint64_t v638 = swift_allocObject(v953, 128LL, 7LL);
      *(_OWORD *)(v638 + 16) = xmmword_10002FBC0;
      *(void *)(v638 + 32) = sub_10002E258;
      *(void *)(v638 + 40) = v629;
      *(void *)(v638 + 48) = sub_10002E258;
      *(void *)(v638 + 56) = v630;
      *(void *)(v638 + 64) = sub_10002E01C;
      *(void *)(v638 + 72) = v632;
      *(void *)(v638 + 80) = sub_10002E258;
      *(void *)(v638 + 88) = v633;
      *(void *)(v638 + 96) = sub_10002E258;
      *(void *)(v638 + 104) = v634;
      *(void *)(v638 + 112) = sub_10002E020;
      *(void *)(v638 + 120) = v637;
      swift_retain(v629);
      swift_retain(v630);
      swift_retain(v632);
      swift_retain(v633);
      swift_retain(v634);
      swift_retain(v637);
      swift_bridgeObjectRelease(v638);
      os_log_type_t v639 = v986;
      v987 = v628;
      if (os_log_type_enabled(v628, v639))
      {
        v640 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
        v944 = (void *)swift_slowAlloc(8LL, -1LL);
        uint64_t v954 = swift_slowAlloc(32LL, -1LL);
        v1035 = v944;
        double v1036 = *(double *)&v954;
        *(_WORD *)v640 = 514;
        v640[2] = *(_BYTE *)(v629 + 16);
        swift_release(v629);
        v640[3] = *(_BYTE *)(v630 + 16);
        v1034[0] = (uint64_t)(v640 + 4);
        swift_release(v630);
        sub_100029290(v1034, (uint64_t)&v1035, (uint64_t *)&v1036, *(uint64_t (**)(void))(v632 + 16));
        swift_release(v632);
        uint64_t v641 = v1034[0];
        *(_BYTE *)v1034[0] = *(_BYTE *)(v633 + 16);
        swift_release(v633);
        *(_BYTE *)(v641 + 1) = *(_BYTE *)(v634 + 16);
        v1034[0] = v641 + 2;
        swift_release(v634);
        sub_100029334(v1034, &v1035, (uint64_t)&v1036, *(uint64_t (**)(void))(v637 + 16));
        uint64_t v642 = v1033[123];
        uint64_t v643 = v1033[120];
        uint64_t v934 = v1033[86];
        uint64_t v644 = v1033[83];
        uint64_t v645 = v1033[79];
        uint64_t v646 = v1033[74];
        swift_release(v637);
        _os_log_impl((void *)&_mh_execute_header, v987, v639, "Failed at creating taskAssetsURL: %s : %@", v640, 0x16u);
        uint64_t v647 = sub_100007B74(&qword_1000388A0);
        swift_arrayDestroy(v944, 1LL, v647);
        swift_slowDealloc(v944, -1LL, -1LL);
        swift_arrayDestroy(v954, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v954, -1LL, -1LL);
        swift_slowDealloc(v640, -1LL, -1LL);

        swift_errorRelease(v1006);
        v509 = *(void (**)(uint64_t, uint64_t))(v878 + 8);
        v509(v642, v643);
        v916(v645, v646);
        uint64_t v513 = v982;
        (*(void (**)(uint64_t, uint64_t))(v982 + 8))(v934, v644);
      }

      else
      {
        uint64_t v678 = v1033[123];
        uint64_t v679 = v1033[120];
        uint64_t v956 = v1033[86];
        uint64_t v946 = v1033[83];
        uint64_t v680 = v1033[79];
        uint64_t v936 = v1033[74];

        swift_release(v637);
        swift_release(v634);
        swift_release(v633);
        swift_release(v632);
        swift_release(v630);
        swift_release(v629);
        swift_errorRelease(v1006);
        v681 = *(void (**)(uint64_t, uint64_t))(v878 + 8);
        v681(v678, v679);
        uint64_t v682 = v680;
        v509 = v681;
        v916(v682, v936);
        uint64_t v513 = v982;
        (*(void (**)(uint64_t, uint64_t))(v982 + 8))(v956, v946);
      }
    }

    v985 = 0LL;
    uint64_t v521 = v617[60];
    uint64_t v338 = v617;
LABEL_154:
    uint64_t v522 = v1030;
LABEL_121:
    uint64_t v523 = v1015;
LABEL_122:
    sub_1000087FC(v521, type metadata accessor for TaskPayloadRecord);
    uint64_t v516 = v523 + v996;
    uint64_t v512 = v522 - 1;
    if (!v512)
    {
      swift_bridgeObjectRelease(v870);
      goto LABEL_164;
    }
  }

  v750 = v509;
  v751 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v338[180];
  uint64_t v752 = v338[179];
  uint64_t v753 = v338[144];
  uint64_t v754 = v338[120];
  swift_bridgeObjectRelease(v338[224]);
  swift_bridgeObjectRelease(v870);
  swift_bridgeObjectRelease(v338[38]);
  uint64_t v755 = v751(v753, v752, v754);
  v756 = (os_log_s *)Logger.logObject.getter(v755);
  os_log_type_t v757 = static os_log_type_t.info.getter();
  BOOL v758 = os_log_type_enabled(v756, v757);
  uint64_t v759 = v338[144];
  uint64_t v760 = v338[120];
  if (v758)
  {
    v761 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    v1035 = 0LL;
    double v1036 = 0.0;
    *(_WORD *)v761 = 0;
    v1034[0] = (uint64_t)(v761 + 2);
    sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v1034, (uint64_t)&v1035, (uint64_t)&v1036);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    _os_log_impl( (void *)&_mh_execute_header,  v756,  v757,  "Task cancelled before while processing TaskPayloads.",  v761,  2u);
    swift_slowDealloc(v761, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  v750(v759, v760);
  uint64_t v983 = v338[232];
  v990 = (os_log_s *)v338[226];
  uint64_t v1031 = v338[210];
  v786 = (void *)v338[193];
  v787 = (void *)v338[192];
  v788 = (void *)v338[191];
  v789 = (void *)v338[190];
  v790 = (void *)v338[189];
  v791 = (void *)v338[188];
  uint64_t v976 = v338[187];
  uint64_t v792 = v338[186];
  uint64_t v997 = v338[118];
  uint64_t v1007 = v338[225];
  uint64_t v1016 = v338[117];
  uint64_t v1020 = v338[119];
  v762 = v338;
  uint64_t v793 = v338[60];
  id v794 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v818 = MLHostResult.init(status:policy:)(1LL, 1LL);

  swift_release(v976);
  sub_1000087FC(v793, type metadata accessor for TaskPayloadRecord);
LABEL_174:
  swift_release(v983);
  swift_release(v990);
  swift_release(v1007);
  swift_release(v1031);
  sub_100025B68(v792);
  (*(void (**)(uint64_t, uint64_t))(v997 + 8))(v1020, v1016);
  swift_release(v792);
  uint64_t v809 = v762[177];
  uint64_t v810 = v762[176];
  uint64_t v811 = v762[175];
  uint64_t v812 = v762[174];
  uint64_t v813 = v762[173];
  uint64_t v814 = v762[172];
  uint64_t v815 = v762[171];
  uint64_t v816 = v762[170];
  uint64_t v817 = v762[169];
  uint64_t v819 = v762[168];
  uint64_t v820 = v762[167];
  uint64_t v821 = v762[166];
  uint64_t v822 = v762[165];
  uint64_t v823 = v762[164];
  uint64_t v824 = v762[163];
  uint64_t v825 = v762[162];
  uint64_t v826 = v762[161];
  uint64_t v827 = v762[160];
  uint64_t v828 = v762[159];
  uint64_t v829 = v762[158];
  uint64_t v830 = v762[157];
  uint64_t v831 = v762[156];
  uint64_t v832 = v762[155];
  uint64_t v833 = v762[154];
  uint64_t v834 = v762[153];
  uint64_t v835 = v762[152];
  uint64_t v836 = v762[151];
  uint64_t v837 = v762[150];
  uint64_t v838 = v762[149];
  uint64_t v839 = v762[148];
  uint64_t v840 = v762[147];
  uint64_t v841 = v762[146];
  uint64_t v842 = v762[145];
  uint64_t v843 = v762[144];
  uint64_t v844 = v762[143];
  uint64_t v845 = v762[142];
  uint64_t v846 = v762[141];
  uint64_t v847 = v762[140];
  uint64_t v848 = v762[139];
  uint64_t v849 = v762[138];
  uint64_t v850 = v762[137];
  uint64_t v851 = v762[136];
  uint64_t v852 = v762[135];
  uint64_t v853 = v762[134];
  uint64_t v854 = v762[133];
  uint64_t v855 = v762[132];
  uint64_t v856 = v762[131];
  uint64_t v857 = v762[130];
  uint64_t v858 = v762[129];
  uint64_t v859 = v762[128];
  uint64_t v860 = v762[127];
  uint64_t v861 = v762[126];
  uint64_t v862 = v762[125];
  uint64_t v863 = v762[124];
  uint64_t v864 = v762[123];
  uint64_t v865 = v762[122];
  uint64_t v866 = v762[119];
  uint64_t v867 = v762[116];
  uint64_t v868 = v762[115];
  uint64_t v869 = v762[114];
  uint64_t v871 = v762[113];
  uint64_t v873 = v762[112];
  uint64_t v875 = v762[108];
  uint64_t v877 = v762[105];
  uint64_t v879 = v762[104];
  uint64_t v880 = v762[103];
  uint64_t v883 = v762[99];
  uint64_t v885 = v762[98];
  uint64_t v886 = v762[97];
  id v888 = (id)v762[96];
  uint64_t v890 = v762[92];
  uint64_t v892 = v762[91];
  uint64_t v895 = v762[90];
  uint64_t v899 = v762[89];
  uint64_t v903 = v762[88];
  uint64_t v906 = v762[87];
  uint64_t v910 = v762[86];
  uint64_t v914 = v762[82];
  uint64_t v917 = v762[81];
  uint64_t v923 = v762[80];
  uint64_t v930 = v762[79];
  uint64_t v939 = v762[78];
  uint64_t v948 = v762[77];
  uint64_t v960 = v762[73];
  uint64_t v965 = v762[72];
  uint64_t v968 = v762[69];
  uint64_t v972 = v762[68];
  uint64_t v977 = v762[67];
  uint64_t v984 = v762[63];
  v991 = (os_log_s *)v762[62];
  uint64_t v998 = v762[61];
  uint64_t v1008 = v762[60];
  uint64_t v1017 = v762[56];
  uint64_t v1021 = v762[55];
  uint64_t v1032 = v762[54];
  swift_task_dealloc(v762[178]);
  swift_task_dealloc(v809);
  swift_task_dealloc(v810);
  swift_task_dealloc(v811);
  swift_task_dealloc(v812);
  swift_task_dealloc(v813);
  swift_task_dealloc(v814);
  swift_task_dealloc(v815);
  swift_task_dealloc(v816);
  swift_task_dealloc(v817);
  swift_task_dealloc(v819);
  swift_task_dealloc(v820);
  swift_task_dealloc(v821);
  swift_task_dealloc(v822);
  swift_task_dealloc(v823);
  swift_task_dealloc(v824);
  swift_task_dealloc(v825);
  swift_task_dealloc(v826);
  swift_task_dealloc(v827);
  swift_task_dealloc(v828);
  swift_task_dealloc(v829);
  swift_task_dealloc(v830);
  swift_task_dealloc(v831);
  swift_task_dealloc(v832);
  swift_task_dealloc(v833);
  swift_task_dealloc(v834);
  swift_task_dealloc(v835);
  swift_task_dealloc(v836);
  swift_task_dealloc(v837);
  swift_task_dealloc(v838);
  swift_task_dealloc(v839);
  swift_task_dealloc(v840);
  swift_task_dealloc(v841);
  swift_task_dealloc(v842);
  swift_task_dealloc(v843);
  swift_task_dealloc(v844);
  swift_task_dealloc(v845);
  swift_task_dealloc(v846);
  swift_task_dealloc(v847);
  swift_task_dealloc(v848);
  swift_task_dealloc(v849);
  swift_task_dealloc(v850);
  swift_task_dealloc(v851);
  swift_task_dealloc(v852);
  swift_task_dealloc(v853);
  swift_task_dealloc(v854);
  swift_task_dealloc(v855);
  swift_task_dealloc(v856);
  swift_task_dealloc(v857);
  swift_task_dealloc(v858);
  swift_task_dealloc(v859);
  swift_task_dealloc(v860);
  swift_task_dealloc(v861);
  swift_task_dealloc(v862);
  swift_task_dealloc(v863);
  swift_task_dealloc(v864);
  swift_task_dealloc(v865);
  swift_task_dealloc(v866);
  swift_task_dealloc(v867);
  swift_task_dealloc(v868);
  swift_task_dealloc(v869);
  swift_task_dealloc(v871);
  swift_task_dealloc(v873);
  swift_task_dealloc(v875);
  swift_task_dealloc(v877);
  swift_task_dealloc(v879);
  swift_task_dealloc(v880);
  swift_task_dealloc(v883);
  swift_task_dealloc(v885);
  swift_task_dealloc(v886);
  swift_task_dealloc(v888);
  swift_task_dealloc(v890);
  swift_task_dealloc(v892);
  swift_task_dealloc(v895);
  swift_task_dealloc(v899);
  swift_task_dealloc(v903);
  swift_task_dealloc(v906);
  swift_task_dealloc(v910);
  swift_task_dealloc(v914);
  swift_task_dealloc(v917);
  swift_task_dealloc(v923);
  swift_task_dealloc(v930);
  swift_task_dealloc(v939);
  swift_task_dealloc(v948);
  swift_task_dealloc(v960);
  swift_task_dealloc(v965);
  swift_task_dealloc(v968);
  swift_task_dealloc(v972);
  swift_task_dealloc(v977);
  swift_task_dealloc(v984);
  swift_task_dealloc(v991);
  swift_task_dealloc(v998);
  swift_task_dealloc(v1008);
  swift_task_dealloc(v1017);
  swift_task_dealloc(v1021);
  swift_task_dealloc(v1032);
  return ((uint64_t (*)(uint64_t))v762[1])(v818);
}

uint64_t sub_100017518()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1840);
  *(void *)(*v1 + 1848) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = *(void *)(v2 + 1832);
    uint64_t v5 = *(void *)(v2 + 1824);
    uint64_t v6 = *(void *)(v2 + 1792);
    uint64_t v7 = *(void **)(v2 + 1544);
    uint64_t v8 = *(void **)(v2 + 1536);
    swift_bridgeObjectRelease(*(void *)(v2 + 304));

    swift_bridgeObjectRelease(v6);
    swift_task_dealloc(v4);
    swift_task_dealloc(v5);
    uint64_t v9 = sub_100023CE8;
  }

  else
  {
    uint64_t v10 = *(void *)(v2 + 1832);
    uint64_t v11 = *(void *)(v2 + 1824);
    uint64_t v12 = *(void **)(v2 + 1544);

    swift_task_dealloc(v10);
    swift_task_dealloc(v11);
    uint64_t v9 = sub_10001763C;
  }

  return swift_task_switch(v9, 0LL, 0LL);
}

uint64_t sub_10001763C()
{
  uint64_t v1 = (void *)v0;
  uint64_t v2 = *(void *)(v0 + 1488);

  uint64_t v3 = *(void *)(v0 + 176);
  *(void *)(v2 + 56) = *(void *)(v3 + 16);
  uint64_t v853 = v1[231];
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v845 = v1;
  uint64_t v820 = v3;
  if (v4)
  {
    uint64_t v5 = (_BYTE *)(v3 + 48);
    uint64_t v826 = v1[69];
    uint64_t v832 = v1[65];
    uint64_t v846 = (void (*)(uint64_t, uint64_t))v1[182];
    do
    {
      uint64_t v8 = (void *)*((void *)v5 - 1);
      if ((*v5 & 1) != 0)
      {
        uint64_t v859 = v4;
        uint64_t v9 = v1[181];
        ((void (*)(void, void, void))v1[180])(v1[153], v1[179], v1[120]);
        uint64_t v10 = swift_allocObject(&unk_100035D30, 24LL, 7LL);
        *(void *)(v10 + 16) = v8;
        sub_10002CB60(v8, 1);
        sub_10002CB60(v8, 1);
        uint64_t v11 = swift_errorRetain(v8);
        uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
        os_log_type_t v13 = static os_log_type_t.error.getter();
        uint64_t v14 = swift_allocObject(&unk_100035D58, 17LL, 7LL);
        *(_BYTE *)(v14 + 16) = 64;
        uint64_t v15 = swift_allocObject(&unk_100035D80, 17LL, 7LL);
        *(_BYTE *)(v15 + 16) = 8;
        uint64_t v16 = v1;
        uint64_t v17 = swift_allocObject(&unk_100035DA8, 32LL, 7LL);
        *(void *)(v17 + 16) = sub_10002E250;
        *(void *)(v17 + 24) = v10;
        uint64_t v18 = swift_allocObject(&unk_100035DD0, 32LL, 7LL);
        *(void *)(v18 + 16) = sub_10002CAF8;
        *(void *)(v18 + 24) = v17;
        uint64_t v19 = swift_allocObject(&unk_100035DF8, 32LL, 7LL);
        *(void *)(v19 + 16) = sub_10002E010;
        *(void *)(v19 + 24) = v18;
        uint64_t v20 = swift_allocObject(v9, 80LL, 7LL);
        *(_OWORD *)(v20 + 16) = xmmword_10002FBB0;
        *(void *)(v20 + 32) = sub_10002E258;
        *(void *)(v20 + 40) = v14;
        *(void *)(v20 + 48) = sub_10002E258;
        *(void *)(v20 + 56) = v15;
        *(void *)(v20 + 64) = sub_10002E020;
        *(void *)(v20 + 72) = v19;
        swift_retain(v14);
        swift_retain(v15);
        swift_retain(v19);
        swift_bridgeObjectRelease(v20);
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v22 = (void *)swift_slowAlloc(8LL, -1LL);
          uint64_t v870 = v22;
          double v871 = 0.0;
          *(_WORD *)uint64_t v21 = 258;
          v21[2] = *(_BYTE *)(v14 + 16);
          uint64_t v23 = v853;
          if (v853) {
            return swift_errorRelease(v23);
          }
          swift_release(v14);
          v21[3] = *(_BYTE *)(v15 + 16);
          v869[0] = (uint64_t)(v21 + 4);
          swift_release(v15);
          sub_100029334(v869, &v870, (uint64_t)&v871, *(uint64_t (**)(void))(v19 + 16));
          uint64_t v24 = (void (*)(uint64_t, uint64_t))v845[182];
          uint64_t v25 = v845[153];
          uint64_t v26 = v845[120];
          uint64_t v27 = v19;
          uint64_t v1 = v845;
          swift_release(v27);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Error: %@", v21, 0xCu);
          uint64_t v28 = sub_100007B74(&qword_1000388A0);
          swift_arrayDestroy(v22, 1LL, v28);
          swift_slowDealloc(v22, -1LL, -1LL);
          swift_slowDealloc(v21, -1LL, -1LL);

          sub_10002CBAC(v8, 1);
          sub_10002CBAC(v8, 1);
          v24(v25, v26);
          uint64_t v846 = (void (*)(uint64_t, uint64_t))v845[182];
        }

        else
        {
          uint64_t v53 = v16[153];
          uint64_t v54 = v16[120];
          sub_10002CBAC(v8, 1);
          swift_release(v14);
          swift_release(v15);
          swift_release(v19);

          sub_10002CBAC(v8, 1);
          v846(v53, v54);
          uint64_t v1 = v16;
        }

        uint64_t v55 = v1[186];
        uint64_t v56 = *(void *)(v55 + 72);
        BOOL v57 = __OFADD__(v56, 1LL);
        uint64_t v58 = v56 + 1;
        uint64_t v4 = v859;
        if (v57)
        {
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
        }

        *(void *)(v55 + 72) = v58;
      }

      else
      {
        uint64_t v30 = v1[63];
        uint64_t v29 = v1[64];
        sub_10002CB60(*((void **)v5 - 1), 0);
        sub_10002CB60(v8, 0);
        id v31 = v8;
        sub_100006318(v31, v30);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v832 + 48))(v30, 1LL, v29) == 1)
        {
          uint64_t v860 = v4;
          uint64_t v32 = v1[181];
          uint64_t v33 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v34 = v1[179];
          uint64_t v35 = v1[154];
          uint64_t v36 = v1[120];
          sub_100008880(v1[63], &qword_100038800);
          v33(v35, v34, v36);
          uint64_t v37 = swift_allocObject(&unk_100036FA0, 24LL, 7LL);
          *(void *)(v37 + 16) = v31;
          uint64_t v38 = Logger.logObject.getter(v31);
          os_log_type_t v39 = static os_log_type_t.error.getter();
          uint64_t v40 = swift_allocObject(&unk_100036FC8, 17LL, 7LL);
          *(_BYTE *)(v40 + 16) = 64;
          uint64_t v41 = swift_allocObject(&unk_100036FF0, 17LL, 7LL);
          *(_BYTE *)(v41 + 16) = 8;
          uint64_t v42 = swift_allocObject(&unk_100037018, 32LL, 7LL);
          *(void *)(v42 + 16) = sub_10002E254;
          *(void *)(v42 + 24) = v37;
          uint64_t v43 = swift_allocObject(&unk_100037040, 32LL, 7LL);
          *(void *)(v43 + 16) = sub_10002E010;
          *(void *)(v43 + 24) = v42;
          uint64_t v44 = (os_log_s *)v38;
          os_log_type_t v45 = v39;
          uint64_t v46 = swift_allocObject(v32, 80LL, 7LL);
          *(_OWORD *)(v46 + 16) = xmmword_10002FBB0;
          *(void *)(v46 + 32) = sub_10002E258;
          *(void *)(v46 + 40) = v40;
          *(void *)(v46 + 48) = sub_10002E258;
          *(void *)(v46 + 56) = v41;
          *(void *)(v46 + 64) = sub_10002E020;
          *(void *)(v46 + 72) = v43;
          swift_retain(v40);
          swift_retain(v41);
          swift_retain(v43);
          swift_bridgeObjectRelease(v46);
          if (os_log_type_enabled(v44, v39))
          {
            uint64_t v47 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v48 = (void *)swift_slowAlloc(8LL, -1LL);
            uint64_t v870 = v48;
            double v871 = 0.0;
            *(_WORD *)uint64_t v47 = 258;
            v47[2] = *(_BYTE *)(v40 + 16);
            uint64_t v23 = v853;
            if (v853) {
              return swift_errorRelease(v23);
            }
            swift_release(v40);
            v47[3] = *(_BYTE *)(v41 + 16);
            v869[0] = (uint64_t)(v47 + 4);
            swift_release(v41);
            sub_100029334(v869, &v870, (uint64_t)&v871, *(uint64_t (**)(void))(v43 + 16));
            uint64_t v1 = v845;
            uint64_t v49 = v44;
            uint64_t v50 = v845[154];
            uint64_t v51 = v845[120];
            swift_release(v43);
            _os_log_impl((void *)&_mh_execute_header, v49, v45, "Skipping record: %@", v47, 0xCu);
            uint64_t v52 = sub_100007B74(&qword_1000388A0);
            swift_arrayDestroy(v48, 1LL, v52);
            swift_slowDealloc(v48, -1LL, -1LL);
            swift_slowDealloc(v47, -1LL, -1LL);

            sub_10002CBAC(v8, 0);
            sub_10002CBAC(v8, 0);
            v846(v50, v51);
            uint64_t v853 = 0LL;
          }

          else
          {
            uint64_t v6 = v845[154];
            uint64_t v7 = v845[120];
            sub_10002CBAC(v8, 0);
            swift_release(v40);
            swift_release(v41);
            swift_release(v43);

            sub_10002CBAC(v8, 0);
            v846(v6, v7);
            uint64_t v1 = v845;
          }

          uint64_t v4 = v860;
        }

        else
        {
          uint64_t v59 = v1[210];
          uint64_t v60 = (uint64_t *)v1[69];
          sub_10002DAD8(v1[63], (uint64_t)v60, type metadata accessor for TaskParametersRecord);
          uint64_t v61 = *(void *)(v59 + 16);
          uint64_t v62 = *v60;
          uint64_t v63 = *(void *)(v826 + 8);
          swift_bridgeObjectRetain(v61);
          swift_bridgeObjectRetain(v63);
          LOBYTE(v62) = sub_10002625C(v62, v63, v61);
          swift_bridgeObjectRelease(v61);
          swift_bridgeObjectRelease(v63);
          if ((v62 & 1) != 0)
          {
            uint64_t v64 = v1[186];
            uint64_t v65 = v1[69];
            uint64_t v66 = v1[68];
            sub_1000087B8(v65, v66, type metadata accessor for TaskParametersRecord);
            sub_10002642C(v66, &qword_100038910, type metadata accessor for TaskParametersRecord);
            sub_10002CBAC(v8, 0);
            sub_10002CBAC(v8, 0);
            sub_1000087FC(v65, type metadata accessor for TaskParametersRecord);
            uint64_t v67 = *(void *)(v64 + 64);
            BOOL v57 = __OFADD__(v67, 1LL);
            uint64_t v68 = v67 + 1;
            if (v57) {
              goto LABEL_146;
            }
            *(void *)(v1[186] + 64LL) = v68;
          }

          else
          {
            uint64_t v69 = ((uint64_t (*)(void, void, void))v1[180])(v1[155], v1[179], v1[120]);
            uint64_t v70 = (os_log_s *)Logger.logObject.getter(v69);
            os_log_type_t v71 = static os_log_type_t.debug.getter();
            BOOL v72 = os_log_type_enabled(v70, v71);
            uint64_t v73 = v1[155];
            uint64_t v74 = v1[120];
            uint64_t v75 = v1[69];
            if (v72)
            {
              uint64_t v861 = v4;
              uint64_t v76 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
              uint64_t v870 = 0LL;
              double v871 = 0.0;
              *(_WORD *)uint64_t v76 = 0;
              v869[0] = (uint64_t)(v76 + 2);
              sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v869, (uint64_t)&v870, (uint64_t)&v871);
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
              _os_log_impl( (void *)&_mh_execute_header,  v70,  v71,  "Skipping taskParametersRecord because associated with an unavailable taskName.",  v76,  2u);
              uint64_t v77 = v76;
              uint64_t v4 = v861;
              swift_slowDealloc(v77, -1LL, -1LL);
            }

            else
            {
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
            }

            sub_10002CBAC(v8, 0);
            sub_10002CBAC(v8, 0);
            v846(v73, v74);
            sub_1000087FC(v75, type metadata accessor for TaskParametersRecord);
          }
        }
      }

      v5 += 24;
      --v4;
    }

    while (v4);
  }

  uint64_t v78 = v1[225];
  swift_bridgeObjectRelease(v820);
  uint64_t v79 = swift_allocObject(&unk_100035E20, 24LL, 7LL);
  v1[232] = v79;
  type metadata accessor for TaskPayloadRecord(0LL);
  *(void *)(v79 + 16) = _swiftEmptyArrayStorage;
  swift_beginAccess(v78 + 16, v1 + 11, 0LL, 0LL);
  if (*(void *)(*(void *)(v78 + 16) + 16LL))
  {
    uint64_t v80 = v1[225];
    uint64_t v81 = v1[181];
    uint64_t v82 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
    uint64_t v83 = v1[179];
    uint64_t v84 = v1[152];
    uint64_t v85 = v1[120];
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    v82(v84, v83, v85);
    uint64_t v86 = swift_allocObject(&unk_100035E48, 32LL, 7LL);
    *(void *)(v86 + 16) = sub_10002D0F0;
    *(void *)(v86 + 24) = v80;
    uint64_t v87 = swift_retain(v80);
    uint64_t v88 = (os_log_s *)Logger.logObject.getter(v87);
    os_log_type_t v89 = static os_log_type_t.info.getter();
    uint64_t v90 = swift_allocObject(&unk_100035E70, 17LL, 7LL);
    *(_BYTE *)(v90 + 16) = 32;
    uint64_t v91 = swift_allocObject(&unk_100035E98, 17LL, 7LL);
    *(_BYTE *)(v91 + 16) = 8;
    uint64_t v92 = swift_allocObject(&unk_100035EC0, 32LL, 7LL);
    *(void *)(v92 + 16) = sub_10002D108;
    *(void *)(v92 + 24) = v86;
    uint64_t v93 = swift_allocObject(&unk_100035EE8, 32LL, 7LL);
    *(void *)(v93 + 16) = sub_10002E010;
    *(void *)(v93 + 24) = v92;
    uint64_t v94 = swift_allocObject(v81, 80LL, 7LL);
    *(_OWORD *)(v94 + 16) = xmmword_10002FBB0;
    *(void *)(v94 + 32) = sub_10002E258;
    *(void *)(v94 + 40) = v90;
    *(void *)(v94 + 48) = sub_10002E258;
    *(void *)(v94 + 56) = v91;
    *(void *)(v94 + 64) = sub_10002E01C;
    *(void *)(v94 + 72) = v93;
    swift_retain(v90);
    swift_retain(v91);
    swift_retain(v93);
    swift_bridgeObjectRelease(v94);
    if (os_log_type_enabled(v88, v89))
    {
      uint64_t v95 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v96 = swift_slowAlloc(32LL, -1LL);
      uint64_t v870 = 0LL;
      double v871 = *(double *)&v96;
      *(_WORD *)uint64_t v95 = 258;
      v95[2] = *(_BYTE *)(v90 + 16);
      uint64_t v23 = v853;
      if (v853) {
        return swift_errorRelease(v23);
      }
      swift_release(v90);
      v95[3] = *(_BYTE *)(v91 + 16);
      v869[0] = (uint64_t)(v95 + 4);
      swift_release(v91);
      sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v93 + 16));
      uint64_t v1 = v845;
      uint64_t v97 = v845[152];
      uint64_t v98 = v845[121];
      uint64_t v99 = v845[120];
      swift_release(v93);
      _os_log_impl((void *)&_mh_execute_header, v88, v89, "Querying TaskPayloads for new tasks: %s", v95, 0xCu);
      swift_arrayDestroy(v96, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v96, -1LL, -1LL);
      swift_slowDealloc(v95, -1LL, -1LL);

      uint64_t v100 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
      v100(v97, v99);
    }

    else
    {
      uint64_t v170 = v1[152];
      uint64_t v171 = v1[121];
      uint64_t v172 = v1[120];
      swift_release(v90);
      swift_release(v91);
      swift_release(v93);

      uint64_t v100 = *(void (**)(uint64_t, uint64_t))(v171 + 8);
      v100(v170, v172);
    }

    v1[233] = v100;
    uint64_t v173 = v1[225];
    uint64_t v174 = v1[200];
    uint64_t v175 = (void *)v1[193];
    uint64_t v176 = (void *)v1[192];
    uint64_t v177 = v1[191];
    uint64_t v178 = swift_allocObject(v1[198], 112LL, 7LL);
    *(_OWORD *)(v178 + 16) = xmmword_10002FBD0;
    *(void *)(v178 + 56) = &type metadata for String;
    *(void *)(v178 + 64) = v174;
    *(void *)(v178 + 32) = 0x656D614E6B736174LL;
    *(void *)(v178 + 40) = 0xE800000000000000LL;
    uint64_t v179 = *(void *)(v173 + 16);
    uint64_t v180 = swift_bridgeObjectRetain(v179);
    uint64_t v181 = sub_100026580(v180);
    swift_bridgeObjectRelease(v179);
    *(void *)(v178 + 96) = sub_100007B74(&qword_1000388B0);
    *(void *)(v178 + 104) = sub_10002DF08( &qword_1000388B8,  &qword_1000388B0,  (uint64_t)&protocol conformance descriptor for [A]);
    *(void *)(v178 + 72) = v181;
    uint64_t v182 = (NSPredicate *)NSPredicate.init(format:_:)(0x4025204E49204B25LL, 0xE800000000000000LL, v178);
    v183._countAndFlagsBits = 0x6C7961506B736154LL;
    v183._object = (void *)0xEC0000007364616FLL;
    Class isa = CKQuery.init(recordType:predicate:)(v183, v182).super.isa;
    v1[234] = isa;
    uint64_t v185 = swift_task_alloc(32LL);
    v1[235] = v185;
    *(void *)(v185 + 16) = isa;
    *(void *)(v185 + 24) = v177;
    uint64_t v186 = swift_task_alloc(32LL);
    v1[236] = v186;
    *(void *)(v186 + 16) = &unk_1000388E0;
    *(void *)(v186 + 24) = v185;
    uint64_t v187 = async function pointer to CKDatabase.configuredWith<A>(configuration:group:body:)[1];
    id v188 = v175;
    id v189 = v176;
    uint64_t v190 = (void *)swift_task_alloc(v187);
    v1[237] = v190;
    *uint64_t v190 = v1;
    v190[1] = sub_10001C8E8;
    return CKDatabase.configuredWith<A>(configuration:group:body:)(v1 + 26, v188, v189, &unk_1000388E8, v186, v1[208]);
  }

  uint64_t v101 = _swiftEmptyArrayStorage[2];
  if (v101)
  {
    uint64_t v102 = &_swiftEmptyArrayStorage[6];
    uint64_t v835 = v1[121];
    uint64_t v821 = v1[62];
    uint64_t v827 = v1[58];
    do
    {
      uint64_t v105 = (void *)*((void *)v102 - 1);
      if ((*v102 & 1) != 0)
      {
        uint64_t v847 = v102;
        uint64_t v862 = v101;
        uint64_t v106 = v1[181];
        ((void (*)(void, void, void))v1[180])(v1[149], v1[179], v1[120]);
        uint64_t v107 = swift_allocObject(&unk_1000360F0, 24LL, 7LL);
        *(void *)(v107 + 16) = v105;
        sub_10002CB60(v105, 1);
        sub_10002CB60(v105, 1);
        uint64_t v108 = swift_errorRetain(v105);
        uint64_t v109 = (os_log_s *)Logger.logObject.getter(v108);
        os_log_type_t v110 = static os_log_type_t.error.getter();
        uint64_t v111 = swift_allocObject(&unk_100036118, 17LL, 7LL);
        *(_BYTE *)(v111 + 16) = 64;
        uint64_t v112 = swift_allocObject(&unk_100036140, 17LL, 7LL);
        *(_BYTE *)(v112 + 16) = 8;
        uint64_t v113 = swift_allocObject(&unk_100036168, 32LL, 7LL);
        *(void *)(v113 + 16) = sub_10002E250;
        *(void *)(v113 + 24) = v107;
        uint64_t v114 = swift_allocObject(&unk_100036190, 32LL, 7LL);
        *(void *)(v114 + 16) = sub_10002CAF8;
        *(void *)(v114 + 24) = v113;
        uint64_t v115 = v1;
        uint64_t v116 = swift_allocObject(&unk_1000361B8, 32LL, 7LL);
        *(void *)(v116 + 16) = sub_10002E010;
        *(void *)(v116 + 24) = v114;
        uint64_t v117 = swift_allocObject(v106, 80LL, 7LL);
        *(_OWORD *)(v117 + 16) = xmmword_10002FBB0;
        *(void *)(v117 + 32) = sub_10002E258;
        *(void *)(v117 + 40) = v111;
        *(void *)(v117 + 48) = sub_10002E258;
        *(void *)(v117 + 56) = v112;
        *(void *)(v117 + 64) = sub_10002E020;
        *(void *)(v117 + 72) = v116;
        swift_retain(v111);
        swift_retain(v112);
        swift_retain(v116);
        swift_bridgeObjectRelease(v117);
        os_log_type_t v118 = v110;
        if (os_log_type_enabled(v109, v110))
        {
          uint64_t v119 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v120 = (void *)swift_slowAlloc(8LL, -1LL);
          uint64_t v870 = v120;
          double v871 = 0.0;
          *(_WORD *)uint64_t v119 = 258;
          v119[2] = *(_BYTE *)(v111 + 16);
          uint64_t v23 = v853;
          if (v853) {
            return swift_errorRelease(v23);
          }
          swift_release(v111);
          v119[3] = *(_BYTE *)(v112 + 16);
          v869[0] = (uint64_t)(v119 + 4);
          swift_release(v112);
          sub_100029334(v869, &v870, (uint64_t)&v871, *(uint64_t (**)(void))(v116 + 16));
          uint64_t v115 = v845;
          uint64_t v121 = v845[149];
          uint64_t v122 = v845[120];
          swift_release(v116);
          _os_log_impl((void *)&_mh_execute_header, v109, v118, "Error: %@", v119, 0xCu);
          uint64_t v123 = sub_100007B74(&qword_1000388A0);
          swift_arrayDestroy(v120, 1LL, v123);
          swift_slowDealloc(v120, -1LL, -1LL);
          swift_slowDealloc(v119, -1LL, -1LL);

          sub_10002CBAC(v105, 1);
          sub_10002CBAC(v105, 1);
          (*(void (**)(uint64_t, uint64_t))(v835 + 8))(v121, v122);
        }

        else
        {
          uint64_t v146 = v115[149];
          uint64_t v147 = v115[120];
          sub_10002CBAC(v105, 1);
          swift_release(v111);
          swift_release(v112);
          swift_release(v116);

          sub_10002CBAC(v105, 1);
          (*(void (**)(uint64_t, uint64_t))(v835 + 8))(v146, v147);
        }

        uint64_t v148 = v115[186];
        uint64_t v149 = *(void *)(v148 + 96);
        BOOL v57 = __OFADD__(v149, 1LL);
        uint64_t v150 = v149 + 1;
        uint64_t v101 = v862;
        uint64_t v102 = v847;
        if (v57) {
          goto LABEL_145;
        }
        uint64_t v1 = v115;
        *(void *)(v148 + 96) = v150;
      }

      else
      {
        uint64_t v125 = v1[56];
        uint64_t v124 = v1[57];
        sub_10002CB60(*((void **)v102 - 1), 0);
        sub_10002CB60(v105, 0);
        id v126 = v105;
        sub_1000071A4(v126, v125);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v827 + 48))(v125, 1LL, v124) == 1)
        {
          uint64_t v863 = v101;
          uint64_t v127 = v1[181];
          uint64_t v128 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v129 = v1[179];
          uint64_t v130 = v1[150];
          uint64_t v131 = v1[120];
          sub_100008880(v1[56], &qword_1000387F8);
          v128(v130, v129, v131);
          uint64_t v132 = swift_allocObject(&unk_100036ED8, 24LL, 7LL);
          *(void *)(v132 + 16) = v126;
          uint64_t v133 = (os_log_s *)Logger.logObject.getter(v126);
          os_log_type_t v134 = static os_log_type_t.error.getter();
          uint64_t v135 = swift_allocObject(&unk_100036F00, 17LL, 7LL);
          *(_BYTE *)(v135 + 16) = 64;
          uint64_t v136 = swift_allocObject(&unk_100036F28, 17LL, 7LL);
          *(_BYTE *)(v136 + 16) = 8;
          uint64_t v137 = swift_allocObject(&unk_100036F50, 32LL, 7LL);
          *(void *)(v137 + 16) = sub_10002E254;
          *(void *)(v137 + 24) = v132;
          uint64_t v138 = swift_allocObject(&unk_100036F78, 32LL, 7LL);
          *(void *)(v138 + 16) = sub_10002E010;
          *(void *)(v138 + 24) = v137;
          uint64_t v139 = swift_allocObject(v127, 80LL, 7LL);
          *(_OWORD *)(v139 + 16) = xmmword_10002FBB0;
          *(void *)(v139 + 32) = sub_10002E258;
          *(void *)(v139 + 40) = v135;
          *(void *)(v139 + 48) = sub_10002E258;
          *(void *)(v139 + 56) = v136;
          *(void *)(v139 + 64) = sub_10002E020;
          *(void *)(v139 + 72) = v138;
          swift_retain(v135);
          swift_retain(v136);
          swift_retain(v138);
          swift_bridgeObjectRelease(v139);
          os_log_type_t v140 = v134;
          if (os_log_type_enabled(v133, v134))
          {
            uint64_t v141 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            os_log_type_t v142 = (void *)swift_slowAlloc(8LL, -1LL);
            uint64_t v870 = v142;
            double v871 = 0.0;
            *(_WORD *)uint64_t v141 = 258;
            v141[2] = *(_BYTE *)(v135 + 16);
            uint64_t v23 = v853;
            if (v853) {
              return swift_errorRelease(v23);
            }
            swift_release(v135);
            v141[3] = *(_BYTE *)(v136 + 16);
            v869[0] = (uint64_t)(v141 + 4);
            swift_release(v136);
            sub_100029334(v869, &v870, (uint64_t)&v871, *(uint64_t (**)(void))(v138 + 16));
            uint64_t v1 = v845;
            uint64_t v143 = v845[150];
            uint64_t v144 = v845[120];
            swift_release(v138);
            _os_log_impl((void *)&_mh_execute_header, v133, v140, "Skipping record: %@", v141, 0xCu);
            uint64_t v145 = sub_100007B74(&qword_1000388A0);
            swift_arrayDestroy(v142, 1LL, v145);
            swift_slowDealloc(v142, -1LL, -1LL);
            swift_slowDealloc(v141, -1LL, -1LL);

            sub_10002CBAC(v105, 0);
            sub_10002CBAC(v105, 0);
            (*(void (**)(uint64_t, uint64_t))(v835 + 8))(v143, v144);
            uint64_t v853 = 0LL;
          }

          else
          {
            uint64_t v103 = v845[150];
            uint64_t v104 = v845[120];
            sub_10002CBAC(v105, 0);
            swift_release(v135);
            swift_release(v136);
            swift_release(v138);

            sub_10002CBAC(v105, 0);
            (*(void (**)(uint64_t, uint64_t))(v835 + 8))(v103, v104);
            uint64_t v1 = v845;
          }

          uint64_t v101 = v863;
        }

        else
        {
          uint64_t v151 = v1[210];
          uint64_t v152 = (uint64_t *)v1[62];
          sub_10002DAD8(v1[56], (uint64_t)v152, type metadata accessor for TaskPayloadRecord);
          uint64_t v153 = *(void *)(v151 + 16);
          uint64_t v154 = *v152;
          uint64_t v155 = *(void *)(v821 + 8);
          swift_bridgeObjectRetain(v153);
          swift_bridgeObjectRetain(v155);
          LOBYTE(v154) = sub_10002625C(v154, v155, v153);
          swift_bridgeObjectRelease(v153);
          swift_bridgeObjectRelease(v155);
          if ((v154 & 1) != 0)
          {
            uint64_t v156 = v1[186];
            uint64_t v158 = v1[61];
            uint64_t v157 = v1[62];
            sub_1000087B8(v157, v158, type metadata accessor for TaskPayloadRecord);
            sub_10002642C(v158, &qword_100038918, type metadata accessor for TaskPayloadRecord);
            sub_10002CBAC(v105, 0);
            sub_10002CBAC(v105, 0);
            sub_1000087FC(v157, type metadata accessor for TaskPayloadRecord);
            uint64_t v159 = *(void *)(v156 + 88);
            BOOL v57 = __OFADD__(v159, 1LL);
            uint64_t v160 = v159 + 1;
            if (v57) {
              goto LABEL_147;
            }
            *(void *)(v1[186] + 88LL) = v160;
          }

          else
          {
            uint64_t v161 = ((uint64_t (*)(void, void, void))v1[180])(v1[151], v1[179], v1[120]);
            uint64_t v162 = (os_log_s *)Logger.logObject.getter(v161);
            os_log_type_t v163 = static os_log_type_t.debug.getter();
            BOOL v164 = os_log_type_enabled(v162, v163);
            uint64_t v165 = v1[151];
            uint64_t v166 = v1[120];
            uint64_t v167 = v1[62];
            if (v164)
            {
              uint64_t v864 = v101;
              uint64_t v168 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
              uint64_t v870 = 0LL;
              double v871 = 0.0;
              *(_WORD *)uint64_t v168 = 0;
              v869[0] = (uint64_t)(v168 + 2);
              sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v869, (uint64_t)&v870, (uint64_t)&v871);
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
              _os_log_impl( (void *)&_mh_execute_header,  v162,  v163,  "Skipping taskPayloadRecord because associated with an unavailable taskName.",  v168,  2u);
              uint64_t v169 = v168;
              uint64_t v101 = v864;
              swift_slowDealloc(v169, -1LL, -1LL);
            }

            else
            {
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
            }

            sub_10002CBAC(v105, 0);
            sub_10002CBAC(v105, 0);
            (*(void (**)(uint64_t, uint64_t))(v835 + 8))(v165, v166);
            sub_1000087FC(v167, type metadata accessor for TaskPayloadRecord);
          }
        }
      }

      v102 += 24;
      --v101;
    }

    while (v101);
  }

  uint64_t v192 = v1[226];
  uint64_t v193 = v1[181];
  uint64_t v194 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
  uint64_t v195 = v1[179];
  uint64_t v196 = v1[148];
  uint64_t v197 = v1[120];
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v194(v196, v195, v197);
  uint64_t v198 = swift_allocObject(&unk_1000361E0, 32LL, 7LL);
  *(void *)(v198 + 16) = sub_10002CBDC;
  *(void *)(v198 + 24) = v192;
  uint64_t v199 = swift_retain(v192);
  uint64_t v200 = (os_log_s *)Logger.logObject.getter(v199);
  os_log_type_t v201 = static os_log_type_t.info.getter();
  uint64_t v202 = swift_allocObject(&unk_100036208, 17LL, 7LL);
  *(_BYTE *)(v202 + 16) = 32;
  uint64_t v203 = swift_allocObject(&unk_100036230, 17LL, 7LL);
  *(_BYTE *)(v203 + 16) = 8;
  uint64_t v204 = swift_allocObject(&unk_100036258, 32LL, 7LL);
  *(void *)(v204 + 16) = sub_10002D400;
  *(void *)(v204 + 24) = v198;
  uint64_t v205 = swift_allocObject(&unk_100036280, 32LL, 7LL);
  *(void *)(v205 + 16) = sub_10002E010;
  *(void *)(v205 + 24) = v204;
  uint64_t v206 = swift_allocObject(v193, 80LL, 7LL);
  *(_OWORD *)(v206 + 16) = xmmword_10002FBB0;
  *(void *)(v206 + 32) = sub_10002E258;
  *(void *)(v206 + 40) = v202;
  *(void *)(v206 + 48) = sub_10002E258;
  *(void *)(v206 + 56) = v203;
  *(void *)(v206 + 64) = sub_10002E01C;
  *(void *)(v206 + 72) = v205;
  swift_retain(v202);
  swift_retain(v203);
  swift_retain(v205);
  swift_bridgeObjectRelease(v206);
  if (os_log_type_enabled(v200, v201))
  {
    uint64_t v207 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v208 = swift_slowAlloc(32LL, -1LL);
    uint64_t v870 = 0LL;
    double v871 = *(double *)&v208;
    *(_WORD *)uint64_t v207 = 258;
    v207[2] = *(_BYTE *)(v202 + 16);
    uint64_t v23 = v853;
    if (v853) {
      return swift_errorRelease(v23);
    }
    swift_release(v202);
    v207[3] = *(_BYTE *)(v203 + 16);
    v869[0] = (uint64_t)(v207 + 4);
    swift_release(v203);
    sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v205 + 16));
    uint64_t v209 = v1[148];
    uint64_t v210 = v1[121];
    uint64_t v211 = v1[120];
    swift_release(v205);
    _os_log_impl((void *)&_mh_execute_header, v200, v201, "Processing TaskParametersRecords: %s", v207, 0xCu);
    swift_arrayDestroy(v208, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v208, -1LL, -1LL);
    swift_slowDealloc(v207, -1LL, -1LL);

    uint64_t v212 = *(void (**)(uint64_t, uint64_t))(v210 + 8);
    uint64_t v213 = v209;
    uint64_t v214 = v211;
  }

  else
  {
    uint64_t v215 = v1[148];
    uint64_t v216 = v1[121];
    uint64_t v217 = v1[120];
    swift_release(v202);
    swift_release(v203);
    swift_release(v205);

    uint64_t v212 = *(void (**)(uint64_t, uint64_t))(v216 + 8);
    uint64_t v213 = v215;
    uint64_t v214 = v217;
  }

  uint64_t v836 = v212;
  v212(v213, v214);
  uint64_t v218 = v1[226];
  swift_beginAccess(v218 + 16, v1 + 5, 0LL, 0LL);
  uint64_t v219 = *(void *)(v218 + 16);
  uint64_t v220 = *(void *)(v219 + 16);
  if (!v220) {
    goto LABEL_83;
  }
  uint64_t v793 = v1 + 18;
  uint64_t v754 = v1[121];
  uint64_t v221 = v1[84];
  uint64_t v784 = v1[75];
  uint64_t v776 = v1[71];
  uint64_t v770 = v1[67];
  uint64_t v222 = v1[65];
  uint64_t v223 = *(unsigned __int8 *)(v222 + 80);
  uint64_t v224 = v219 + ((v223 + 32) & ~v223);
  unsigned int v225 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v808 = ((v223 + 16) & ~v223) + v1[66];
  uint64_t v816 = (v223 + 16) & ~v223;
  uint64_t v805 = v223 | 7;
  uint64_t v828 = *(void *)(v222 + 72);
  uint64_t v747 = *(void *)(v218 + 16);
  swift_bridgeObjectRetain(v219);
  uint64_t v822 = v221;
  unsigned int v764 = v225;
  do
  {
    uint64_t v231 = v1[224];
    uint64_t v232 = v1[83];
    uint64_t v233 = v1[67];
    uint64_t v234 = v1[55];
    sub_1000087B8(v224, v233, type metadata accessor for TaskParametersRecord);
    uint64_t v235 = swift_task_alloc(32LL);
    *(void *)(v235 + 16) = v233;
    sub_100026728((uint64_t (*)(char *))sub_10002D440, v231, v234);
    swift_task_dealloc(v235);
    uint64_t v865 = v220;
    uint64_t v848 = v224;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v221 + 48))(v234, 1LL, v232) == 1)
    {
      uint64_t v236 = v1[181];
      uint64_t v237 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
      uint64_t v238 = v1[179];
      uint64_t v239 = v1[146];
      uint64_t v240 = v1[120];
      uint64_t v241 = v1[68];
      uint64_t v242 = v1[67];
      sub_100008880(v1[55], &qword_1000387F0);
      v237(v239, v238, v240);
      sub_1000087B8(v242, v241, type metadata accessor for TaskParametersRecord);
      uint64_t v243 = swift_allocObject(&unk_1000362A8, v808, v805);
      uint64_t v244 = sub_10002DAD8(v241, v243 + v816, type metadata accessor for TaskParametersRecord);
      uint64_t v245 = (os_log_s *)Logger.logObject.getter(v244);
      os_log_type_t v246 = static os_log_type_t.error.getter();
      uint64_t v247 = swift_allocObject(&unk_1000362D0, 17LL, 7LL);
      *(_BYTE *)(v247 + 16) = 32;
      uint64_t v248 = swift_allocObject(&unk_1000362F8, 17LL, 7LL);
      *(_BYTE *)(v248 + 16) = 8;
      uint64_t v249 = v1;
      uint64_t v250 = swift_allocObject(&unk_100036320, 32LL, 7LL);
      *(void *)(v250 + 16) = sub_10002D460;
      *(void *)(v250 + 24) = v243;
      uint64_t v251 = swift_allocObject(&unk_100036348, 32LL, 7LL);
      *(void *)(v251 + 16) = sub_10002E010;
      *(void *)(v251 + 24) = v250;
      uint64_t v252 = swift_allocObject(v236, 80LL, 7LL);
      *(_OWORD *)(v252 + 16) = xmmword_10002FBB0;
      *(void *)(v252 + 32) = sub_10002E258;
      *(void *)(v252 + 40) = v247;
      *(void *)(v252 + 48) = sub_10002E258;
      *(void *)(v252 + 56) = v248;
      *(void *)(v252 + 64) = sub_10002E01C;
      *(void *)(v252 + 72) = v251;
      swift_retain(v247);
      swift_retain(v248);
      swift_retain(v251);
      swift_bridgeObjectRelease(v252);
      if (os_log_type_enabled(v245, v246))
      {
        uint64_t v253 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v254 = swift_slowAlloc(32LL, -1LL);
        uint64_t v870 = 0LL;
        double v871 = *(double *)&v254;
        *(_WORD *)uint64_t v253 = 258;
        v253[2] = *(_BYTE *)(v247 + 16);
        uint64_t v23 = v853;
        if (v853) {
          return swift_errorRelease(v23);
        }
        swift_release(v247);
        v253[3] = *(_BYTE *)(v248 + 16);
        v869[0] = (uint64_t)(v253 + 4);
        swift_release(v248);
        sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v251 + 16));
        uint64_t v255 = v845[146];
        uint64_t v256 = v845[120];
        swift_release(v251);
        _os_log_impl( (void *)&_mh_execute_header,  v245,  v246,  "Task %s not registered on the system. Skipping task.",  v253,  0xCu);
        swift_arrayDestroy(v254, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v257 = v254;
        uint64_t v1 = v845;
        swift_slowDealloc(v257, -1LL, -1LL);
        swift_slowDealloc(v253, -1LL, -1LL);

        v836(v255, v256);
      }

      else
      {
        uint64_t v226 = v249[146];
        uint64_t v227 = v249[120];
        swift_release(v247);
        swift_release(v248);
        swift_release(v251);

        v836(v226, v227);
        uint64_t v1 = v249;
      }

      uint64_t v228 = v1[67];
      uint64_t v229 = v865;
      uint64_t v221 = v822;
      goto LABEL_61;
    }

    uint64_t v258 = (*(uint64_t (**)(void, void, void))(v221 + 32))(v1[87], v1[55], v1[83]);
    uint64_t v259 = MLHostTask.taskFolder.getter(v258);
    if (!v260)
    {
      uint64_t v310 = v1[181];
      uint64_t v311 = v1[68];
      uint64_t v312 = v1[67];
      ((void (*)(void, void, void))v1[180])(v1[147], v1[179], v1[120]);
      sub_1000087B8(v312, v311, type metadata accessor for TaskParametersRecord);
      uint64_t v313 = swift_allocObject(&unk_100036C30, v808, v805);
      uint64_t v314 = sub_10002DAD8(v311, v313 + v816, type metadata accessor for TaskParametersRecord);
      uint64_t v315 = (os_log_s *)Logger.logObject.getter(v314);
      os_log_type_t v316 = static os_log_type_t.error.getter();
      uint64_t v317 = swift_allocObject(&unk_100036C58, 17LL, 7LL);
      *(_BYTE *)(v317 + 16) = 32;
      uint64_t v318 = swift_allocObject(&unk_100036C80, 17LL, 7LL);
      *(_BYTE *)(v318 + 16) = 8;
      uint64_t v319 = v1;
      uint64_t v320 = swift_allocObject(&unk_100036CA8, 32LL, 7LL);
      *(void *)(v320 + 16) = sub_10002D460;
      *(void *)(v320 + 24) = v313;
      uint64_t v321 = swift_allocObject(&unk_100036CD0, 32LL, 7LL);
      *(void *)(v321 + 16) = sub_10002E010;
      *(void *)(v321 + 24) = v320;
      uint64_t v322 = swift_allocObject(v310, 80LL, 7LL);
      *(_OWORD *)(v322 + 16) = xmmword_10002FBB0;
      *(void *)(v322 + 32) = sub_10002E258;
      *(void *)(v322 + 40) = v317;
      *(void *)(v322 + 48) = sub_10002E258;
      *(void *)(v322 + 56) = v318;
      *(void *)(v322 + 64) = sub_10002E01C;
      *(void *)(v322 + 72) = v321;
      swift_retain(v317);
      swift_retain(v318);
      swift_retain(v321);
      swift_bridgeObjectRelease(v322);
      if (os_log_type_enabled(v315, v316))
      {
        uint64_t v323 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v324 = swift_slowAlloc(32LL, -1LL);
        uint64_t v870 = 0LL;
        double v871 = *(double *)&v324;
        *(_WORD *)uint64_t v323 = 258;
        v323[2] = *(_BYTE *)(v317 + 16);
        uint64_t v23 = v853;
        if (v853) {
          return swift_errorRelease(v23);
        }
        swift_release(v317);
        v323[3] = *(_BYTE *)(v318 + 16);
        v869[0] = (uint64_t)(v323 + 4);
        swift_release(v318);
        sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v321 + 16));
        uint64_t v319 = v845;
        uint64_t v325 = v845[147];
        uint64_t v326 = v845[120];
        uint64_t v327 = v845[87];
        uint64_t v328 = v845[83];
        swift_release(v321);
        _os_log_impl( (void *)&_mh_execute_header,  v315,  v316,  "Task %s doesn't have a valid taskFolder. Skipping task.",  v323,  0xCu);
        swift_arrayDestroy(v324, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v324, -1LL, -1LL);
        swift_slowDealloc(v323, -1LL, -1LL);

        v836(v325, v326);
        uint64_t v221 = v822;
        (*(void (**)(uint64_t, uint64_t))(v822 + 8))(v327, v328);
      }

      else
      {
        uint64_t v337 = v319[147];
        uint64_t v338 = v319[120];
        uint64_t v339 = v319[87];
        uint64_t v340 = v319[83];

        swift_release(v321);
        swift_release(v318);
        swift_release(v317);
        v836(v337, v338);
        uint64_t v221 = v822;
        (*(void (**)(uint64_t, uint64_t))(v822 + 8))(v339, v340);
      }

      uint64_t v228 = v319[67];
      uint64_t v1 = v319;
      goto LABEL_81;
    }

    uint64_t v261 = v259;
    uint64_t v262 = v260;
    uint64_t v263 = v1[73];
    uint64_t v264 = v1[72];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v784 + 56))(v263, 1LL, 1LL, v1[74]);
    uint64_t v265 = type metadata accessor for URL.DirectoryHint(0LL);
    uint64_t v266 = *(void (**)(uint64_t, void, uint64_t))(*(void *)(v265 - 8) + 104LL);
    v266(v264, v764, v265);
    URL.init(filePath:directoryHint:relativeTo:)(v261, v262, v264, v263);
    if (qword_1000383A8 != -1) {
      swift_once(&qword_1000383A8, sub_10000B020);
    }
    uint64_t v267 = v1[82];
    uint64_t v268 = v1[80];
    uint64_t v801 = v1[74];
    uint64_t v269 = v1[72];
    uint64_t v270 = v1[70];
    uint64_t v271 = *(void *)algn_100038798;
    v1[18] = qword_100038790;
    v1[19] = v271;
    v266(v269, v764, v265);
    unint64_t v272 = sub_100028A54();
    swift_bridgeObjectRetain(v271);
    URL.appending<A>(path:directoryHint:)(v793, v269, &type metadata for String, v272);
    (*(void (**)(uint64_t, uint64_t))(v776 + 8))(v269, v270);
    swift_bridgeObjectRelease(v1[19]);
    uint64_t v273 = *(void (**)(uint64_t, uint64_t))(v784 + 8);
    v273(v267, v801);
    uint64_t v274 = *(void *)(v770 + 32);
    unint64_t v275 = *(void *)(v770 + 40);
    sub_1000085F8(v274, v275);
    Data.write(to:options:)(v268, 0LL, v274, v275);
    if (!v853)
    {
      uint64_t v329 = v1[87];
      uint64_t v330 = v1[83];
      uint64_t v331 = v1[80];
      uint64_t v332 = v1[74];
      uint64_t v228 = v1[67];
      sub_1000085B4(v274, v275);
      v273(v331, v332);
      uint64_t v221 = v822;
      (*(void (**)(uint64_t, uint64_t))(v822 + 8))(v329, v330);
      uint64_t v853 = 0LL;
LABEL_81:
      uint64_t v229 = v865;
LABEL_61:
      uint64_t v230 = v848;
      goto LABEL_62;
    }

    v802 = v273;
    uint64_t v837 = v1[181];
    uint64_t v276 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
    uint64_t v277 = v1[179];
    uint64_t v278 = v1[124];
    uint64_t v279 = v1[120];
    uint64_t v280 = v1[82];
    uint64_t v281 = v1[80];
    uint64_t v796 = v1[76];
    uint64_t v282 = v1[74];
    sub_1000085B4(v274, v275);
    v276(v278, v277, v279);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v784 + 16))(v280, v281, v282);
    uint64_t v283 = *(unsigned __int8 *)(v784 + 80);
    uint64_t v284 = (v283 + 16) & ~v283;
    uint64_t v285 = swift_allocObject(&unk_100036CF8, v284 + v796, v283 | 7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v784 + 32))(v285 + v284, v280, v282);
    uint64_t v286 = swift_allocObject(&unk_100036D20, 32LL, 7LL);
    *(void *)(v286 + 16) = sub_10002D65C;
    *(void *)(v286 + 24) = v285;
    uint64_t v287 = swift_allocObject(&unk_100036D48, 24LL, 7LL);
    *(void *)(v287 + 16) = v853;
    uint64_t v288 = swift_errorRetain(v853);
    uint64_t v289 = (os_log_s *)Logger.logObject.getter(v288);
    LOBYTE(v278) = static os_log_type_t.error.getter();
    uint64_t v290 = swift_allocObject(&unk_100036D70, 17LL, 7LL);
    *(_BYTE *)(v290 + 16) = 32;
    uint64_t v291 = swift_allocObject(&unk_100036D98, 17LL, 7LL);
    *(_BYTE *)(v291 + 16) = 8;
    uint64_t v292 = swift_allocObject(&unk_100036DC0, 32LL, 7LL);
    *(void *)(v292 + 16) = sub_10002E014;
    *(void *)(v292 + 24) = v286;
    uint64_t v293 = swift_allocObject(&unk_100036DE8, 32LL, 7LL);
    *(void *)(v293 + 16) = sub_10002E010;
    *(void *)(v293 + 24) = v292;
    uint64_t v294 = swift_allocObject(&unk_100036E10, 17LL, 7LL);
    *(_BYTE *)(v294 + 16) = 64;
    uint64_t v295 = swift_allocObject(&unk_100036E38, 17LL, 7LL);
    *(_BYTE *)(v295 + 16) = 8;
    uint64_t v296 = swift_allocObject(&unk_100036E60, 32LL, 7LL);
    *(void *)(v296 + 16) = sub_10002E250;
    *(void *)(v296 + 24) = v287;
    uint64_t v297 = swift_allocObject(&unk_100036E88, 32LL, 7LL);
    *(void *)(v297 + 16) = sub_10002CAF8;
    *(void *)(v297 + 24) = v296;
    uint64_t v298 = swift_allocObject(&unk_100036EB0, 32LL, 7LL);
    *(void *)(v298 + 16) = sub_10002E010;
    *(void *)(v298 + 24) = v297;
    uint64_t v299 = swift_allocObject(v837, 128LL, 7LL);
    *(_OWORD *)(v299 + 16) = xmmword_10002FBC0;
    *(void *)(v299 + 32) = sub_10002E258;
    *(void *)(v299 + 40) = v290;
    *(void *)(v299 + 48) = sub_10002E258;
    *(void *)(v299 + 56) = v291;
    *(void *)(v299 + 64) = sub_10002E01C;
    *(void *)(v299 + 72) = v293;
    *(void *)(v299 + 80) = sub_10002E258;
    *(void *)(v299 + 88) = v294;
    *(void *)(v299 + 96) = sub_10002E258;
    *(void *)(v299 + 104) = v295;
    *(void *)(v299 + 112) = sub_10002E020;
    *(void *)(v299 + 120) = v298;
    swift_retain(v290);
    swift_retain(v291);
    swift_retain(v293);
    swift_retain(v294);
    swift_retain(v295);
    swift_retain(v298);
    swift_bridgeObjectRelease(v299);
    os_log_type_t v300 = v278;
    uint64_t v838 = v289;
    if (os_log_type_enabled(v289, (os_log_type_t)v278))
    {
      uint64_t v301 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
      uint64_t v797 = (void *)swift_slowAlloc(8LL, -1LL);
      uint64_t v302 = swift_slowAlloc(32LL, -1LL);
      uint64_t v870 = v797;
      double v871 = *(double *)&v302;
      *(_WORD *)uint64_t v301 = 514;
      v301[2] = *(_BYTE *)(v290 + 16);
      swift_release(v290);
      v301[3] = *(_BYTE *)(v291 + 16);
      v869[0] = (uint64_t)(v301 + 4);
      swift_release(v291);
      sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v293 + 16));
      swift_release(v293);
      uint64_t v303 = v869[0];
      *(_BYTE *)v869[0] = *(_BYTE *)(v294 + 16);
      swift_release(v294);
      *(_BYTE *)(v303 + 1) = *(_BYTE *)(v295 + 16);
      v869[0] = v303 + 2;
      swift_release(v295);
      sub_100029334(v869, &v870, (uint64_t)&v871, *(uint64_t (**)(void))(v298 + 16));
      uint64_t v304 = v845[124];
      uint64_t v305 = v845[120];
      uint64_t v750 = v845[87];
      uint64_t v306 = v845[83];
      uint64_t v307 = v845[80];
      uint64_t v308 = v845[74];
      swift_release(v298);
      _os_log_impl((void *)&_mh_execute_header, v838, v300, "Failed at writing taskParamFile: %s : %@", v301, 0x16u);
      uint64_t v309 = sub_100007B74(&qword_1000388A0);
      swift_arrayDestroy(v797, 1LL, v309);
      swift_slowDealloc(v797, -1LL, -1LL);
      swift_arrayDestroy(v302, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v302, -1LL, -1LL);
      swift_slowDealloc(v301, -1LL, -1LL);

      swift_errorRelease(v853);
      uint64_t v836 = *(void (**)(uint64_t, uint64_t))(v754 + 8);
      v836(v304, v305);
      v802(v307, v308);
      uint64_t v221 = v822;
      (*(void (**)(uint64_t, uint64_t))(v822 + 8))(v750, v306);
    }

    else
    {
      uint64_t v333 = v845[124];
      uint64_t v334 = v845[120];
      uint64_t v335 = v845[87];
      uint64_t v336 = v845[83];
      uint64_t v798 = v845[80];
      uint64_t v751 = v845[74];

      swift_release(v298);
      swift_release(v295);
      swift_release(v294);
      swift_release(v293);
      swift_release(v291);
      swift_release(v290);
      swift_errorRelease(v853);
      uint64_t v836 = *(void (**)(uint64_t, uint64_t))(v754 + 8);
      v836(v333, v334);
      v802(v798, v751);
      uint64_t v221 = v822;
      (*(void (**)(uint64_t, uint64_t))(v822 + 8))(v335, v336);
    }

    uint64_t v229 = v865;
    uint64_t v1 = v845;
    uint64_t v230 = v848;
    uint64_t v853 = 0LL;
    uint64_t v228 = v845[67];
LABEL_62:
    sub_1000087FC(v228, type metadata accessor for TaskParametersRecord);
    uint64_t v224 = v230 + v828;
    uint64_t v220 = v229 - 1;
  }

  while (v220);
  swift_bridgeObjectRelease(v747);
LABEL_83:
  uint64_t v341 = v1[232];
  uint64_t v342 = v1[181];
  ((void (*)(void, void, void))v1[180])(v1[145], v1[179], v1[120]);
  uint64_t v343 = swift_allocObject(&unk_100036370, 32LL, 7LL);
  *(void *)(v343 + 16) = sub_10002CBDC;
  *(void *)(v343 + 24) = v341;
  uint64_t v344 = swift_retain(v341);
  uint64_t v345 = (os_log_s *)Logger.logObject.getter(v344);
  os_log_type_t v346 = static os_log_type_t.info.getter();
  uint64_t v347 = swift_allocObject(&unk_100036398, 17LL, 7LL);
  *(_BYTE *)(v347 + 16) = 32;
  uint64_t v348 = swift_allocObject(&unk_1000363C0, 17LL, 7LL);
  *(_BYTE *)(v348 + 16) = 8;
  uint64_t v349 = swift_allocObject(&unk_1000363E8, 32LL, 7LL);
  *(void *)(v349 + 16) = sub_10002D4D0;
  *(void *)(v349 + 24) = v343;
  uint64_t v350 = swift_allocObject(&unk_100036410, 32LL, 7LL);
  *(void *)(v350 + 16) = sub_10002E010;
  *(void *)(v350 + 24) = v349;
  uint64_t v351 = swift_allocObject(v342, 80LL, 7LL);
  *(_OWORD *)(v351 + 16) = xmmword_10002FBB0;
  *(void *)(v351 + 32) = sub_10002E258;
  *(void *)(v351 + 40) = v347;
  *(void *)(v351 + 48) = sub_10002E258;
  *(void *)(v351 + 56) = v348;
  *(void *)(v351 + 64) = sub_10002E01C;
  *(void *)(v351 + 72) = v350;
  swift_retain(v347);
  swift_retain(v348);
  swift_retain(v350);
  swift_bridgeObjectRelease(v351);
  if (os_log_type_enabled(v345, v346))
  {
    uint64_t v352 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v353 = swift_slowAlloc(32LL, -1LL);
    uint64_t v870 = 0LL;
    double v871 = *(double *)&v353;
    *(_WORD *)uint64_t v352 = 258;
    v352[2] = *(_BYTE *)(v347 + 16);
    uint64_t v23 = v853;
    if (!v853)
    {
      swift_release(v347);
      v352[3] = *(_BYTE *)(v348 + 16);
      v869[0] = (uint64_t)(v352 + 4);
      swift_release(v348);
      sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v350 + 16));
      uint64_t v354 = v1[145];
      uint64_t v355 = v1[120];
      swift_release(v350);
      _os_log_impl((void *)&_mh_execute_header, v345, v346, "Processing TaskPayloadRecords: %s", v352, 0xCu);
      swift_arrayDestroy(v353, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v353, -1LL, -1LL);
      swift_slowDealloc(v352, -1LL, -1LL);

      uint64_t v356 = v354;
      uint64_t v357 = v355;
      goto LABEL_87;
    }

    return swift_errorRelease(v23);
  }

  else
  {
    uint64_t v358 = v1[145];
    uint64_t v359 = v1[120];
    swift_release(v347);
    swift_release(v348);
    swift_release(v350);

    uint64_t v356 = v358;
    uint64_t v357 = v359;
LABEL_87:
    uint64_t v360 = v836;
    v836(v356, v357);
    uint64_t v361 = v1[232];
    swift_beginAccess(v361 + 16, v1 + 2, 0LL, 0LL);
    uint64_t v362 = *(void *)(v361 + 16);
    uint64_t v363 = *(void *)(v362 + 16);
    if (v363)
    {
      uint64_t v752 = v1 + 16;
      uint64_t v748 = v1 + 40;
      uint64_t v723 = v1 + 42;
      v725 = v1 + 14;
      uint64_t v364 = v1[84];
      uint64_t v365 = v1[75];
      uint64_t v745 = v1[71];
      uint64_t v729 = v1[60];
      uint64_t v731 = v1[121];
      uint64_t v366 = v1[58];
      uint64_t v367 = *(unsigned __int8 *)(v366 + 80);
      uint64_t v368 = v362 + ((v367 + 32) & ~v367);
      unsigned int v806 = enum case for URL.DirectoryHint.inferFromPath(_:);
      uint64_t v799 = ((v367 + 16) & ~v367) + v1[59];
      uint64_t v803 = (v367 + 16) & ~v367;
      uint64_t v794 = v367 | 7;
      uint64_t v829 = *(void *)(v366 + 72);
      uint64_t v721 = *(void *)(v361 + 16);
      swift_bridgeObjectRetain(v362);
      uint64_t v817 = v364;
      uint64_t v823 = v365;
      while (1)
      {
        uint64_t v839 = v360;
        uint64_t v375 = sub_1000087B8(v368, v1[60], type metadata accessor for TaskPayloadRecord);
        char v376 = static Task<>.isCancelled.getter(v375);
        uint64_t v377 = v1[224];
        if ((v376 & 1) != 0) {
          break;
        }
        uint64_t v866 = v368;
        uint64_t v378 = v1[83];
        uint64_t v379 = v1[60];
        uint64_t v380 = v1[54];
        uint64_t v381 = swift_task_alloc(32LL);
        *(void *)(v381 + 16) = v379;
        sub_100026728((uint64_t (*)(char *))sub_10002DFF8, v377, v380);
        swift_task_dealloc(v381);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v364 + 48))(v380, 1LL, v378) == 1)
        {
          uint64_t v849 = v363;
          uint64_t v382 = v1[181];
          uint64_t v383 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v384 = v1[179];
          uint64_t v385 = v1[139];
          uint64_t v386 = v1[120];
          uint64_t v388 = v1[60];
          uint64_t v387 = v1[61];
          sub_100008880(v1[54], &qword_1000387F0);
          v383(v385, v384, v386);
          sub_1000087B8(v388, v387, type metadata accessor for TaskPayloadRecord);
          uint64_t v389 = swift_allocObject(&unk_100036438, v799, v794);
          uint64_t v390 = sub_10002DAD8(v387, v389 + v803, type metadata accessor for TaskPayloadRecord);
          uint64_t v391 = (os_log_s *)Logger.logObject.getter(v390);
          os_log_type_t v392 = static os_log_type_t.error.getter();
          uint64_t v393 = swift_allocObject(&unk_100036460, 17LL, 7LL);
          *(_BYTE *)(v393 + 16) = 32;
          uint64_t v394 = swift_allocObject(&unk_100036488, 17LL, 7LL);
          *(_BYTE *)(v394 + 16) = 8;
          uint64_t v395 = swift_allocObject(&unk_1000364B0, 32LL, 7LL);
          *(void *)(v395 + 16) = sub_10002D514;
          *(void *)(v395 + 24) = v389;
          uint64_t v396 = swift_allocObject(&unk_1000364D8, 32LL, 7LL);
          *(void *)(v396 + 16) = sub_10002E010;
          *(void *)(v396 + 24) = v395;
          uint64_t v397 = swift_allocObject(v382, 80LL, 7LL);
          *(_OWORD *)(v397 + 16) = xmmword_10002FBB0;
          *(void *)(v397 + 32) = sub_10002E258;
          *(void *)(v397 + 40) = v393;
          *(void *)(v397 + 48) = sub_10002E258;
          *(void *)(v397 + 56) = v394;
          *(void *)(v397 + 64) = sub_10002E01C;
          *(void *)(v397 + 72) = v396;
          swift_retain(v393);
          swift_retain(v394);
          swift_retain(v396);
          swift_bridgeObjectRelease(v397);
          if (os_log_type_enabled(v391, v392))
          {
            uint64_t v398 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v399 = swift_slowAlloc(32LL, -1LL);
            uint64_t v870 = 0LL;
            double v871 = *(double *)&v399;
            *(_WORD *)uint64_t v398 = 258;
            v398[2] = *(_BYTE *)(v393 + 16);
            uint64_t v23 = v853;
            if (v853) {
              return swift_errorRelease(v23);
            }
            swift_release(v393);
            v398[3] = *(_BYTE *)(v394 + 16);
            v869[0] = (uint64_t)(v398 + 4);
            swift_release(v394);
            sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v396 + 16));
            uint64_t v400 = v1[139];
            uint64_t v401 = v1[120];
            swift_release(v396);
            _os_log_impl( (void *)&_mh_execute_header,  v391,  v392,  "Task %s not registered on the system. Skipping task.",  v398,  0xCu);
            swift_arrayDestroy(v399, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v399, -1LL, -1LL);
            swift_slowDealloc(v398, -1LL, -1LL);

            uint64_t v371 = v400;
            uint64_t v372 = v401;
          }

          else
          {
            uint64_t v369 = v1[139];
            uint64_t v370 = v1[120];
            swift_release(v393);
            swift_release(v394);
            swift_release(v396);

            uint64_t v371 = v369;
            uint64_t v372 = v370;
          }

          uint64_t v360 = v839;
          v839(v371, v372);
          uint64_t v373 = v1[60];
          uint64_t v374 = v849;
          uint64_t v364 = v817;
        }

        else
        {
          uint64_t v402 = (*(uint64_t (**)(void, void, void))(v364 + 32))(v1[86], v1[54], v1[83]);
          uint64_t v403 = MLHostTask.taskFolder.getter(v402);
          if (v404)
          {
            uint64_t v405 = v403;
            uint64_t v406 = v404;
            uint64_t v850 = v363;
            uint64_t v407 = v1[73];
            uint64_t v408 = v1[72];
            uint64_t v755 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v365 + 56);
            v755(v407, 1LL, 1LL, v1[74]);
            uint64_t v409 = type metadata accessor for URL.DirectoryHint(0LL);
            uint64_t v410 = v365;
            uint64_t v809 = *(void (**)(uint64_t))(*(void *)(v409 - 8) + 104LL);
            v809(v408);
            URL.init(filePath:directoryHint:relativeTo:)(v405, v406, v408, v407);
            if (qword_1000383A0 != -1) {
              swift_once(&qword_1000383A0, sub_10000B000);
            }
            uint64_t v411 = v1[82];
            uint64_t v412 = v1[74];
            uint64_t v413 = v1[72];
            uint64_t v414 = v1[70];
            uint64_t v415 = *(void *)algn_100038788;
            v1[16] = qword_100038780;
            v1[17] = v415;
            ((void (*)(uint64_t, void, uint64_t))v809)(v413, v806, v409);
            unint64_t v416 = sub_100028A54();
            swift_bridgeObjectRetain(v415);
            unint64_t v743 = v416;
            URL.appending<A>(path:directoryHint:)(v752, v413, &type metadata for String, v416);
            uint64_t v741 = *(void (**)(uint64_t, uint64_t))(v745 + 8);
            v741(v413, v414);
            swift_bridgeObjectRelease(v1[17]);
            BOOL v758 = *(void (**)(uint64_t, uint64_t))(v410 + 8);
            v758(v411, v412);
            id v739 = (id)objc_opt_self(&OBJC_CLASS___NSFileManager);
            id v417 = [v739 defaultManager];
            object = URL.path(percentEncoded:)(0)._object;
            NSString v419 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(object);
            v1[40] = 0LL;
            LODWORD(v414) = [v417 createDirectoryAtPath:v419 withIntermediateDirectories:1 attributes:0 error:v748];

            unint64_t v420 = (void *)v1[40];
            uint64_t v785 = v1[181];
            uint64_t v765 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
            uint64_t v421 = v1[179];
            uint64_t v422 = v410;
            uint64_t v760 = v1[120];
            uint64_t v777 = v1[82];
            uint64_t v771 = v1[76];
            uint64_t v423 = v1[74];
            if ((_DWORD)v414)
            {
              uint64_t v424 = v1[143];
              uint64_t v425 = v1[78];
              uint64_t v426 = v1;
              uint64_t v427 = v1[73];
              uint64_t v428 = v426[72];
              uint64_t v429 = *(void *)(v729 + 40);
              uint64_t v734 = *(void *)(v729 + 32);
              uint64_t v736 = v424;
              v755(v427, 1LL, 1LL, v423);
              uint64_t v727 = v409;
              ((void (*)(uint64_t, void, uint64_t))v809)(v428, v806, v409);
              id v430 = v420;
              swift_bridgeObjectRetain(v429);
              URL.init(filePath:directoryHint:relativeTo:)(v734, v429, v428, v427);
              v765(v736, v421, v760);
              uint64_t v766 = *(void (**)(uint64_t, uint64_t, uint64_t))(v410 + 16);
              v766(v777, v425, v423);
              uint64_t v431 = *(unsigned __int8 *)(v410 + 80);
              uint64_t v432 = (v431 + 16) & ~v431;
              uint64_t v756 = v432 + v771;
              uint64_t v761 = v431 | 7;
              uint64_t v433 = swift_allocObject(&unk_100036870, v432 + v771, v431 | 7);
              uint64_t v772 = v432;
              uint64_t v434 = *(void (**)(uint64_t, uint64_t, uint64_t))(v422 + 32);
              v434(v433 + v432, v777, v423);
              uint64_t v435 = swift_allocObject(&unk_100036898, 32LL, 7LL);
              *(void *)(v435 + 16) = sub_10002D65C;
              *(void *)(v435 + 24) = v433;
              uint64_t v436 = (os_log_s *)Logger.logObject.getter(v435);
              os_log_type_t v437 = static os_log_type_t.info.getter();
              uint64_t v438 = swift_allocObject(&unk_1000368C0, 17LL, 7LL);
              *(_BYTE *)(v438 + 16) = 32;
              uint64_t v439 = swift_allocObject(&unk_1000368E8, 17LL, 7LL);
              *(_BYTE *)(v439 + 16) = 8;
              uint64_t v440 = swift_allocObject(&unk_100036910, 32LL, 7LL);
              *(void *)(v440 + 16) = sub_10002E014;
              *(void *)(v440 + 24) = v435;
              uint64_t v441 = swift_allocObject(&unk_100036938, 32LL, 7LL);
              *(void *)(v441 + 16) = sub_10002E010;
              *(void *)(v441 + 24) = v440;
              uint64_t v442 = swift_allocObject(v785, 80LL, 7LL);
              *(_OWORD *)(v442 + 16) = xmmword_10002FBB0;
              *(void *)(v442 + 32) = sub_10002E258;
              *(void *)(v442 + 40) = v438;
              *(void *)(v442 + 48) = sub_10002E258;
              *(void *)(v442 + 56) = v439;
              *(void *)(v442 + 64) = sub_10002E01C;
              *(void *)(v442 + 72) = v441;
              swift_retain(v438);
              swift_retain(v439);
              swift_retain(v441);
              swift_bridgeObjectRelease(v442);
              if (os_log_type_enabled(v436, v437))
              {
                uint64_t v443 = v434;
                uint64_t v444 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
                uint64_t v445 = swift_slowAlloc(32LL, -1LL);
                uint64_t v870 = 0LL;
                double v871 = *(double *)&v445;
                *(_WORD *)uint64_t v444 = 258;
                v444[2] = *(_BYTE *)(v438 + 16);
                uint64_t v23 = v853;
                if (v853) {
                  return swift_errorRelease(v23);
                }
                swift_release(v438);
                v444[3] = *(_BYTE *)(v439 + 16);
                v869[0] = (uint64_t)(v444 + 4);
                swift_release(v439);
                sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v441 + 16));
                uint64_t v1 = v845;
                uint64_t v446 = v845[143];
                uint64_t v447 = v845[120];
                swift_release(v441);
                _os_log_impl((void *)&_mh_execute_header, v436, v437, "Processing: %s", v444, 0xCu);
                swift_arrayDestroy(v445, 1LL, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v445, -1LL, -1LL);
                swift_slowDealloc(v444, -1LL, -1LL);

                v839(v446, v447);
                uint64_t v434 = v443;
              }

              else
              {
                uint64_t v506 = v845[143];
                uint64_t v507 = v845[120];
                swift_release(v438);
                swift_release(v439);
                swift_release(v441);

                v839(v506, v507);
                uint64_t v1 = v845;
              }

              if ((sub_10002690C(v1[78], v1[79]) & 1) != 0)
              {
                uint64_t v508 = v1[181];
                uint64_t v509 = v1[82];
                uint64_t v510 = v1[79];
                uint64_t v511 = v1[74];
                ((void (*)(void, void, void))v1[180])(v1[142], v1[179], v1[120]);
                v766(v509, v510, v511);
                uint64_t v512 = swift_allocObject(&unk_100036B40, v756, v761);
                v434(v512 + v772, v509, v511);
                uint64_t v513 = swift_allocObject(&unk_100036B68, 32LL, 7LL);
                *(void *)(v513 + 16) = sub_10002D65C;
                *(void *)(v513 + 24) = v512;
                uint64_t v514 = (os_log_s *)Logger.logObject.getter(v513);
                os_log_type_t v515 = static os_log_type_t.info.getter();
                uint64_t v516 = swift_allocObject(&unk_100036B90, 17LL, 7LL);
                *(_BYTE *)(v516 + 16) = 32;
                uint64_t v517 = swift_allocObject(&unk_100036BB8, 17LL, 7LL);
                *(_BYTE *)(v517 + 16) = 8;
                uint64_t v518 = swift_allocObject(&unk_100036BE0, 32LL, 7LL);
                *(void *)(v518 + 16) = sub_10002E014;
                *(void *)(v518 + 24) = v513;
                uint64_t v519 = swift_allocObject(&unk_100036C08, 32LL, 7LL);
                *(void *)(v519 + 16) = sub_10002E010;
                *(void *)(v519 + 24) = v518;
                uint64_t v520 = swift_allocObject(v508, 80LL, 7LL);
                *(_OWORD *)(v520 + 16) = xmmword_10002FBB0;
                *(void *)(v520 + 32) = sub_10002E258;
                *(void *)(v520 + 40) = v516;
                *(void *)(v520 + 48) = sub_10002E258;
                *(void *)(v520 + 56) = v517;
                *(void *)(v520 + 64) = sub_10002E01C;
                *(void *)(v520 + 72) = v519;
                swift_retain(v516);
                swift_retain(v517);
                swift_retain(v519);
                swift_bridgeObjectRelease(v520);
                if (os_log_type_enabled(v514, v515))
                {
                  uint64_t v521 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
                  uint64_t v522 = swift_slowAlloc(32LL, -1LL);
                  uint64_t v870 = 0LL;
                  double v871 = *(double *)&v522;
                  *(_WORD *)uint64_t v521 = 258;
                  v521[2] = *(_BYTE *)(v516 + 16);
                  uint64_t v23 = v853;
                  if (v853) {
                    return swift_errorRelease(v23);
                  }
                  swift_release(v516);
                  v521[3] = *(_BYTE *)(v517 + 16);
                  v869[0] = (uint64_t)(v521 + 4);
                  swift_release(v517);
                  sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v519 + 16));
                  uint64_t v523 = v1[142];
                  uint64_t v524 = v1;
                  uint64_t v525 = v1[120];
                  uint64_t v811 = v524[86];
                  uint64_t v787 = v524[83];
                  uint64_t v779 = v524[79];
                  uint64_t v526 = v524[78];
                  uint64_t v527 = v524[74];
                  swift_release(v519);
                  _os_log_impl((void *)&_mh_execute_header, v514, v515, "TaskPayload extracted at: %s", v521, 0xCu);
                  swift_arrayDestroy(v522, 1LL, (char *)&type metadata for Any + 8);
                  swift_slowDealloc(v522, -1LL, -1LL);
                  swift_slowDealloc(v521, -1LL, -1LL);

                  v839(v523, v525);
                  uint64_t v528 = v526;
                  uint64_t v360 = v839;
                  uint64_t v529 = v758;
                  v758(v528, v527);
                  uint64_t v530 = v779;
                  uint64_t v531 = v527;
                }

                else
                {
                  uint64_t v543 = v1[142];
                  uint64_t v544 = v1[120];
                  uint64_t v811 = v1[86];
                  uint64_t v787 = v1[83];
                  uint64_t v524 = v1;
                  uint64_t v545 = v1[79];
                  uint64_t v546 = v524[78];
                  uint64_t v547 = v524[74];

                  swift_release(v519);
                  swift_release(v517);
                  swift_release(v516);
                  uint64_t v360 = v839;
                  v839(v543, v544);
                  uint64_t v529 = v758;
                  v758(v546, v547);
                  uint64_t v530 = v545;
                  uint64_t v531 = v547;
                }

                v529(v530, v531);
                uint64_t v364 = v817;
                (*(void (**)(uint64_t, uint64_t))(v817 + 8))(v811, v787);
                uint64_t v373 = v524[60];
                uint64_t v1 = v524;
              }

              else
              {
                uint64_t v536 = ((uint64_t (*)(void, void, void))v1[180])(v1[141], v1[179], v1[120]);
                uint64_t v537 = (os_log_s *)Logger.logObject.getter(v536);
                os_log_type_t v538 = static os_log_type_t.info.getter();
                BOOL v539 = os_log_type_enabled(v537, v538);
                uint64_t v540 = v1[141];
                uint64_t v541 = v1[120];
                if (v539)
                {
                  uint64_t v542 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
                  uint64_t v870 = 0LL;
                  double v871 = 0.0;
                  *(_WORD *)uint64_t v542 = 0;
                  v869[0] = (uint64_t)(v542 + 2);
                  sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v869, (uint64_t)&v870, (uint64_t)&v871);
                  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
                  _os_log_impl( (void *)&_mh_execute_header,  v537,  v538,  "Failed at processing archive, copying raw archive into taskFolder.",  v542,  2u);
                  swift_slowDealloc(v542, -1LL, -1LL);
                }

                else
                {
                  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
                }

                v839(v540, v541);
                uint64_t v548 = v1[72];
                uint64_t v549 = v1[70];
                v1[14] = 0x612E737465737361LL;
                v1[15] = 0xEA00000000007261LL;
                ((void (*)(uint64_t, void, uint64_t))v809)(v548, v806, v727);
                URL.appending<A>(path:directoryHint:)(v725, v548, &type metadata for String, v743);
                v741(v548, v549);
                swift_bridgeObjectRelease(v1[15]);
                id v550 = [v739 defaultManager];
                URL._bridgeToObjectiveC()(v551);
                uint64_t v553 = v552;
                URL._bridgeToObjectiveC()(v554);
                uint64_t v556 = v555;
                v1[42] = 0LL;
                unsigned int v557 = [v550 copyItemAtURL:v553 toURL:v555 error:v723];

                uint64_t v558 = (void *)v1[42];
                if (v557)
                {
                  uint64_t v559 = v1[86];
                  uint64_t v560 = v1[83];
                  uint64_t v561 = v1[79];
                  uint64_t v562 = v1[78];
                  uint64_t v563 = v1[77];
                  uint64_t v564 = v1[74];
                  uint64_t v373 = v1[60];
                  id v565 = v558;
                  v758(v563, v564);
                  v758(v562, v564);
                  v758(v561, v564);
                  uint64_t v364 = v817;
                  (*(void (**)(uint64_t, uint64_t))(v817 + 8))(v559, v560);
                  uint64_t v360 = v839;
                }

                else
                {
                  uint64_t v813 = v1[181];
                  v789 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
                  uint64_t v566 = v1[179];
                  uint64_t v567 = v1[122];
                  uint64_t v568 = v1[120];
                  uint64_t v569 = v1[82];
                  uint64_t v570 = v1[77];
                  uint64_t v855 = v434;
                  uint64_t v571 = v1[74];
                  id v572 = v558;
                  uint64_t v573 = _convertNSErrorToError(_:)(v558);

                  swift_willThrow();
                  v789(v567, v566, v568);
                  v766(v569, v570, v571);
                  uint64_t v574 = swift_allocObject(&unk_100036960, v756, v761);
                  v855(v574 + v772, v569, v571);
                  uint64_t v575 = swift_allocObject(&unk_100036988, 32LL, 7LL);
                  *(void *)(v575 + 16) = sub_10002D65C;
                  *(void *)(v575 + 24) = v574;
                  uint64_t v576 = swift_allocObject(&unk_1000369B0, 24LL, 7LL);
                  *(void *)(v576 + 16) = v573;
                  uint64_t v856 = v573;
                  uint64_t v577 = swift_errorRetain(v573);
                  uint64_t v578 = (os_log_s *)Logger.logObject.getter(v577);
                  LOBYTE(v789) = static os_log_type_t.error.getter();
                  uint64_t v579 = swift_allocObject(&unk_1000369D8, 17LL, 7LL);
                  *(_BYTE *)(v579 + 16) = 32;
                  uint64_t v580 = swift_allocObject(&unk_100036A00, 17LL, 7LL);
                  *(_BYTE *)(v580 + 16) = 8;
                  uint64_t v581 = swift_allocObject(&unk_100036A28, 32LL, 7LL);
                  *(void *)(v581 + 16) = sub_10002E014;
                  *(void *)(v581 + 24) = v575;
                  uint64_t v582 = swift_allocObject(&unk_100036A50, 32LL, 7LL);
                  *(void *)(v582 + 16) = sub_10002E010;
                  *(void *)(v582 + 24) = v581;
                  uint64_t v583 = swift_allocObject(&unk_100036A78, 17LL, 7LL);
                  *(_BYTE *)(v583 + 16) = 64;
                  uint64_t v584 = swift_allocObject(&unk_100036AA0, 17LL, 7LL);
                  *(_BYTE *)(v584 + 16) = 8;
                  uint64_t v585 = swift_allocObject(&unk_100036AC8, 32LL, 7LL);
                  *(void *)(v585 + 16) = sub_10002E250;
                  *(void *)(v585 + 24) = v576;
                  uint64_t v586 = swift_allocObject(&unk_100036AF0, 32LL, 7LL);
                  *(void *)(v586 + 16) = sub_10002CAF8;
                  *(void *)(v586 + 24) = v585;
                  os_log_type_t v587 = v1;
                  uint64_t v588 = swift_allocObject(&unk_100036B18, 32LL, 7LL);
                  *(void *)(v588 + 16) = sub_10002E010;
                  *(void *)(v588 + 24) = v586;
                  uint64_t v589 = swift_allocObject(v813, 128LL, 7LL);
                  *(_OWORD *)(v589 + 16) = xmmword_10002FBC0;
                  *(void *)(v589 + 32) = sub_10002E258;
                  *(void *)(v589 + 40) = v579;
                  *(void *)(v589 + 48) = sub_10002E258;
                  *(void *)(v589 + 56) = v580;
                  *(void *)(v589 + 64) = sub_10002E01C;
                  *(void *)(v589 + 72) = v582;
                  *(void *)(v589 + 80) = sub_10002E258;
                  *(void *)(v589 + 88) = v583;
                  *(void *)(v589 + 96) = sub_10002E258;
                  *(void *)(v589 + 104) = v584;
                  *(void *)(v589 + 112) = sub_10002E020;
                  *(void *)(v589 + 120) = v588;
                  swift_retain(v579);
                  swift_retain(v580);
                  swift_retain(v582);
                  swift_retain(v583);
                  swift_retain(v584);
                  swift_retain(v588);
                  swift_bridgeObjectRelease(v589);
                  os_log_type_t v590 = v789;
                  uint64_t v814 = v578;
                  if (os_log_type_enabled(v578, (os_log_type_t)v789))
                  {
                    uint64_t v591 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
                    uint64_t v767 = (void *)swift_slowAlloc(8LL, -1LL);
                    uint64_t v790 = swift_slowAlloc(32LL, -1LL);
                    uint64_t v870 = v767;
                    double v871 = *(double *)&v790;
                    *(_WORD *)uint64_t v591 = 514;
                    v591[2] = *(_BYTE *)(v579 + 16);
                    swift_release(v579);
                    v591[3] = *(_BYTE *)(v580 + 16);
                    v869[0] = (uint64_t)(v591 + 4);
                    swift_release(v580);
                    sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v582 + 16));
                    swift_release(v582);
                    uint64_t v592 = v869[0];
                    *(_BYTE *)v869[0] = *(_BYTE *)(v583 + 16);
                    swift_release(v583);
                    *(_BYTE *)(v592 + 1) = *(_BYTE *)(v584 + 16);
                    v869[0] = v592 + 2;
                    swift_release(v584);
                    sub_100029334(v869, &v870, (uint64_t)&v871, *(uint64_t (**)(void))(v588 + 16));
                    uint64_t v593 = v587[122];
                    uint64_t v594 = v587[120];
                    uint64_t v781 = v587[86];
                    uint64_t v773 = v587[83];
                    uint64_t v595 = v587[79];
                    uint64_t v596 = v587[78];
                    uint64_t v597 = v587[77];
                    uint64_t v598 = v587[74];
                    swift_release(v588);
                    _os_log_impl((void *)&_mh_execute_header, v814, v590, "Failed at asset to: %s : %@", v591, 0x16u);
                    uint64_t v599 = sub_100007B74(&qword_1000388A0);
                    swift_arrayDestroy(v767, 1LL, v599);
                    swift_slowDealloc(v767, -1LL, -1LL);
                    swift_arrayDestroy(v790, 1LL, (char *)&type metadata for Any + 8);
                    swift_slowDealloc(v790, -1LL, -1LL);
                    swift_slowDealloc(v591, -1LL, -1LL);

                    swift_errorRelease(v856);
                    v839(v593, v594);
                    v758(v597, v598);
                    v758(v596, v598);
                    uint64_t v600 = v595;
                    uint64_t v360 = v839;
                    v758(v600, v598);
                    uint64_t v364 = v817;
                    (*(void (**)(uint64_t, uint64_t))(v817 + 8))(v781, v773);
                  }

                  else
                  {
                    uint64_t v601 = v587[122];
                    uint64_t v762 = v587[120];
                    uint64_t v791 = v587[86];
                    uint64_t v782 = v587[83];
                    uint64_t v774 = v587[79];
                    uint64_t v768 = v587[78];
                    uint64_t v602 = v587[77];
                    uint64_t v603 = v587[74];

                    swift_release(v588);
                    swift_release(v584);
                    swift_release(v583);
                    swift_release(v582);
                    swift_release(v580);
                    swift_release(v579);
                    swift_errorRelease(v856);
                    uint64_t v360 = v839;
                    v839(v601, v762);
                    v758(v602, v603);
                    v758(v768, v603);
                    v758(v774, v603);
                    uint64_t v364 = v817;
                    (*(void (**)(uint64_t, uint64_t))(v817 + 8))(v791, v782);
                  }

                  uint64_t v853 = 0LL;
                  uint64_t v373 = v587[60];
                  uint64_t v1 = v587;
                }
              }
            }

            else
            {
              uint64_t v469 = v1[123];
              uint64_t v470 = v1[79];
              id v471 = v420;
              uint64_t v472 = _convertNSErrorToError(_:)(v420);

              swift_willThrow();
              v765(v469, v421, v760);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v410 + 16))(v777, v470, v423);
              uint64_t v473 = *(unsigned __int8 *)(v410 + 80);
              uint64_t v474 = (v473 + 16) & ~v473;
              uint64_t v475 = swift_allocObject(&unk_100036690, v474 + v771, v473 | 7);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v422 + 32))(v475 + v474, v777, v423);
              uint64_t v476 = swift_allocObject(&unk_1000366B8, 32LL, 7LL);
              *(void *)(v476 + 16) = sub_10002D65C;
              *(void *)(v476 + 24) = v475;
              uint64_t v477 = swift_allocObject(&unk_1000366E0, 24LL, 7LL);
              *(void *)(v477 + 16) = v472;
              uint64_t v854 = v472;
              uint64_t v478 = swift_errorRetain(v472);
              uint64_t v479 = (os_log_s *)Logger.logObject.getter(v478);
              os_log_type_t v840 = static os_log_type_t.error.getter();
              uint64_t v480 = swift_allocObject(&unk_100036708, 17LL, 7LL);
              *(_BYTE *)(v480 + 16) = 32;
              uint64_t v481 = swift_allocObject(&unk_100036730, 17LL, 7LL);
              *(_BYTE *)(v481 + 16) = 8;
              uint64_t v482 = swift_allocObject(&unk_100036758, 32LL, 7LL);
              *(void *)(v482 + 16) = sub_10002D668;
              *(void *)(v482 + 24) = v476;
              uint64_t v483 = swift_allocObject(&unk_100036780, 32LL, 7LL);
              *(void *)(v483 + 16) = sub_10002E010;
              *(void *)(v483 + 24) = v482;
              uint64_t v484 = swift_allocObject(&unk_1000367A8, 17LL, 7LL);
              *(_BYTE *)(v484 + 16) = 64;
              uint64_t v485 = v1;
              uint64_t v486 = swift_allocObject(&unk_1000367D0, 17LL, 7LL);
              *(_BYTE *)(v486 + 16) = 8;
              uint64_t v487 = swift_allocObject(&unk_1000367F8, 32LL, 7LL);
              *(void *)(v487 + 16) = sub_10002E250;
              *(void *)(v487 + 24) = v477;
              uint64_t v488 = swift_allocObject(&unk_100036820, 32LL, 7LL);
              *(void *)(v488 + 16) = sub_10002CAF8;
              *(void *)(v488 + 24) = v487;
              uint64_t v489 = swift_allocObject(&unk_100036848, 32LL, 7LL);
              *(void *)(v489 + 16) = sub_10002E010;
              *(void *)(v489 + 24) = v488;
              uint64_t v490 = swift_allocObject(v785, 128LL, 7LL);
              *(_OWORD *)(v490 + 16) = xmmword_10002FBC0;
              *(void *)(v490 + 32) = sub_10002E258;
              *(void *)(v490 + 40) = v480;
              *(void *)(v490 + 48) = sub_10002E258;
              *(void *)(v490 + 56) = v481;
              *(void *)(v490 + 64) = sub_10002E01C;
              *(void *)(v490 + 72) = v483;
              *(void *)(v490 + 80) = sub_10002E258;
              *(void *)(v490 + 88) = v484;
              *(void *)(v490 + 96) = sub_10002E258;
              *(void *)(v490 + 104) = v486;
              *(void *)(v490 + 112) = sub_10002E020;
              *(void *)(v490 + 120) = v489;
              swift_retain(v480);
              swift_retain(v481);
              swift_retain(v483);
              swift_retain(v484);
              swift_retain(v486);
              swift_retain(v489);
              swift_bridgeObjectRelease(v490);
              os_log_type_t v491 = v840;
              uint64_t v841 = v479;
              if (os_log_type_enabled(v479, v491))
              {
                uint64_t v492 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
                v786 = (void *)swift_slowAlloc(8LL, -1LL);
                uint64_t v810 = swift_slowAlloc(32LL, -1LL);
                uint64_t v870 = v786;
                double v871 = *(double *)&v810;
                *(_WORD *)uint64_t v492 = 514;
                v492[2] = *(_BYTE *)(v480 + 16);
                swift_release(v480);
                v492[3] = *(_BYTE *)(v481 + 16);
                v869[0] = (uint64_t)(v492 + 4);
                swift_release(v481);
                sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v483 + 16));
                swift_release(v483);
                uint64_t v493 = v869[0];
                *(_BYTE *)v869[0] = *(_BYTE *)(v484 + 16);
                swift_release(v484);
                *(_BYTE *)(v493 + 1) = *(_BYTE *)(v486 + 16);
                v869[0] = v493 + 2;
                swift_release(v486);
                sub_100029334(v869, &v870, (uint64_t)&v871, *(uint64_t (**)(void))(v489 + 16));
                uint64_t v494 = v485[123];
                uint64_t v495 = v485[120];
                uint64_t v778 = v485[86];
                uint64_t v496 = v485[83];
                uint64_t v497 = v485[79];
                uint64_t v498 = v485[74];
                swift_release(v489);
                _os_log_impl( (void *)&_mh_execute_header,  v841,  v491,  "Failed at creating taskAssetsURL: %s : %@",  v492,  0x16u);
                uint64_t v499 = sub_100007B74(&qword_1000388A0);
                swift_arrayDestroy(v786, 1LL, v499);
                swift_slowDealloc(v786, -1LL, -1LL);
                swift_arrayDestroy(v810, 1LL, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v810, -1LL, -1LL);
                swift_slowDealloc(v492, -1LL, -1LL);

                swift_errorRelease(v854);
                v500 = *(void (**)(uint64_t, uint64_t))(v731 + 8);
                v500(v494, v495);
                v758(v497, v498);
                uint64_t v364 = v817;
                (*(void (**)(uint64_t, uint64_t))(v817 + 8))(v778, v496);
              }

              else
              {
                uint64_t v532 = v485[123];
                uint64_t v533 = v485[120];
                uint64_t v812 = v485[86];
                uint64_t v788 = v485[83];
                uint64_t v534 = v485[79];
                uint64_t v780 = v485[74];

                swift_release(v489);
                swift_release(v486);
                swift_release(v484);
                swift_release(v483);
                swift_release(v481);
                swift_release(v480);
                swift_errorRelease(v854);
                uint64_t v535 = v533;
                v500 = *(void (**)(uint64_t, uint64_t))(v731 + 8);
                v500(v532, v535);
                v758(v534, v780);
                uint64_t v364 = v817;
                (*(void (**)(uint64_t, uint64_t))(v817 + 8))(v812, v788);
              }

              uint64_t v853 = 0LL;
              uint64_t v373 = v485[60];
              uint64_t v1 = v485;
              uint64_t v360 = v500;
            }

            uint64_t v374 = v850;
          }

          else
          {
            uint64_t v448 = v363;
            uint64_t v449 = v1[181];
            uint64_t v451 = v1[60];
            uint64_t v450 = v1[61];
            ((void (*)(void, void, void))v1[180])(v1[140], v1[179], v1[120]);
            sub_1000087B8(v451, v450, type metadata accessor for TaskPayloadRecord);
            uint64_t v452 = swift_allocObject(&unk_1000365C8, v799, v794);
            uint64_t v453 = sub_10002DAD8(v450, v452 + v803, type metadata accessor for TaskPayloadRecord);
            uint64_t v454 = (os_log_s *)Logger.logObject.getter(v453);
            os_log_type_t v455 = static os_log_type_t.error.getter();
            uint64_t v456 = swift_allocObject(&unk_1000365F0, 17LL, 7LL);
            *(_BYTE *)(v456 + 16) = 32;
            uint64_t v457 = swift_allocObject(&unk_100036618, 17LL, 7LL);
            *(_BYTE *)(v457 + 16) = 8;
            uint64_t v458 = swift_allocObject(&unk_100036640, 32LL, 7LL);
            *(void *)(v458 + 16) = sub_10002D514;
            *(void *)(v458 + 24) = v452;
            uint64_t v459 = swift_allocObject(&unk_100036668, 32LL, 7LL);
            *(void *)(v459 + 16) = sub_10002E010;
            *(void *)(v459 + 24) = v458;
            uint64_t v460 = swift_allocObject(v449, 80LL, 7LL);
            *(_OWORD *)(v460 + 16) = xmmword_10002FBB0;
            *(void *)(v460 + 32) = sub_10002E258;
            *(void *)(v460 + 40) = v456;
            *(void *)(v460 + 48) = sub_10002E258;
            *(void *)(v460 + 56) = v457;
            *(void *)(v460 + 64) = sub_10002E01C;
            *(void *)(v460 + 72) = v459;
            swift_retain(v456);
            swift_retain(v457);
            swift_retain(v459);
            swift_bridgeObjectRelease(v460);
            if (os_log_type_enabled(v454, v455))
            {
              uint64_t v461 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
              uint64_t v462 = swift_slowAlloc(32LL, -1LL);
              uint64_t v870 = 0LL;
              double v871 = *(double *)&v462;
              *(_WORD *)uint64_t v461 = 258;
              v461[2] = *(_BYTE *)(v456 + 16);
              uint64_t v23 = v853;
              if (v853) {
                return swift_errorRelease(v23);
              }
              swift_release(v456);
              v461[3] = *(_BYTE *)(v457 + 16);
              v869[0] = (uint64_t)(v461 + 4);
              swift_release(v457);
              sub_100029290(v869, (uint64_t)&v870, (uint64_t *)&v871, *(uint64_t (**)(void))(v459 + 16));
              uint64_t v463 = v1[140];
              uint64_t v464 = v1[120];
              uint64_t v465 = v1[86];
              uint64_t v466 = v845[83];
              swift_release(v459);
              _os_log_impl( (void *)&_mh_execute_header,  v454,  v455,  "Task %s doesn't have a valid taskFolder. Skipping task.",  v461,  0xCu);
              swift_arrayDestroy(v462, 1LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v462, -1LL, -1LL);
              swift_slowDealloc(v461, -1LL, -1LL);

              v839(v463, v464);
              uint64_t v364 = v817;
              uint64_t v467 = v465;
              uint64_t v360 = v839;
              uint64_t v468 = v466;
              uint64_t v1 = v845;
              (*(void (**)(uint64_t, uint64_t))(v817 + 8))(v467, v468);
            }

            else
            {
              uint64_t v501 = v1[140];
              uint64_t v502 = v1[120];
              uint64_t v503 = v1[86];
              uint64_t v504 = v1[83];

              swift_release(v459);
              swift_release(v457);
              swift_release(v456);
              uint64_t v360 = v839;
              v839(v501, v502);
              uint64_t v505 = v503;
              uint64_t v364 = v817;
              (*(void (**)(uint64_t, uint64_t))(v817 + 8))(v505, v504);
            }

            uint64_t v373 = v1[60];
            uint64_t v374 = v448;
          }
        }

        uint64_t v365 = v823;
        sub_1000087FC(v373, type metadata accessor for TaskPayloadRecord);
        uint64_t v368 = v866 + v829;
        uint64_t v363 = v374 - 1;
        if (!v363)
        {
          swift_bridgeObjectRelease(v721);
          goto LABEL_133;
        }
      }

      os_log_type_t v604 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v1[180];
      uint64_t v605 = v1[179];
      uint64_t v606 = v1[144];
      uint64_t v607 = v1[120];
      swift_bridgeObjectRelease(v1[224]);
      swift_bridgeObjectRelease(v721);
      swift_bridgeObjectRelease(v1[38]);
      uint64_t v608 = v604(v606, v605, v607);
      uint64_t v609 = (os_log_s *)Logger.logObject.getter(v608);
      os_log_type_t v610 = static os_log_type_t.info.getter();
      BOOL v611 = os_log_type_enabled(v609, v610);
      uint64_t v612 = v1[144];
      uint64_t v613 = v1[120];
      if (v611)
      {
        uint64_t v614 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        uint64_t v870 = 0LL;
        double v871 = 0.0;
        *(_WORD *)uint64_t v614 = 0;
        v869[0] = (uint64_t)(v614 + 2);
        sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v869, (uint64_t)&v870, (uint64_t)&v871);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        _os_log_impl( (void *)&_mh_execute_header,  v609,  v610,  "Task cancelled before while processing TaskPayloads.",  v614,  2u);
        swift_slowDealloc(v614, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      }

      v839(v612, v613);
      uint64_t v824 = v1[232];
      uint64_t v830 = v1[226];
      uint64_t v843 = v1[225];
      uint64_t v636 = v1[210];
      uint64_t v637 = (void *)v1[193];
      uint64_t v638 = (void *)v1[192];
      os_log_type_t v639 = (void *)v1[191];
      v640 = (void *)v1[190];
      uint64_t v641 = (void *)v1[189];
      uint64_t v642 = (void *)v1[188];
      uint64_t v643 = v1;
      uint64_t v644 = v1[187];
      uint64_t v645 = v643[186];
      uint64_t v857 = v643[119];
      uint64_t v867 = v636;
      uint64_t v833 = v643[118];
      uint64_t v851 = v643[117];
      uint64_t v818 = v643[60];
      id v646 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v670 = MLHostResult.init(status:policy:)(1LL, 1LL);

      swift_release(v644);
      sub_1000087FC(v818, type metadata accessor for TaskPayloadRecord);
    }

    else
    {
LABEL_133:
      uint64_t v615 = (void (*)(uint64_t, uint64_t))v1[185];
      uint64_t v616 = v1[115];
      uint64_t v617 = v1[109];
      swift_bridgeObjectRelease(v1[224]);
      uint64_t v618 = swift_bridgeObjectRelease(v1[38]);
      uint64_t v619 = static Date.now.getter(v618);
      double v620 = Date.timeIntervalSinceReferenceDate.getter(v619);
      v615(v616, v617);
      sub_10002DFC0(0LL, &qword_100038828, &OBJC_CLASS___NSUserDefaults_ptr);
      id v621 = sub_100025B00(0xD000000000000010LL, 0x8000000100030070LL);
      if (v621)
      {
        uint64_t v622 = v621;
        uint64_t v842 = v360;
        uint64_t v623 = v1[181];
        ((void (*)(void, void, void))v1[180])(v1[138], v1[179], v1[120]);
        uint64_t v624 = swift_allocObject(&unk_100036500, 24LL, 7LL);
        *(double *)(v624 + 16) = v620;
        uint64_t v625 = (os_log_s *)Logger.logObject.getter(v624);
        os_log_type_t v626 = static os_log_type_t.info.getter();
        uint64_t v627 = swift_allocObject(&unk_100036528, 17LL, 7LL);
        *(_BYTE *)(v627 + 16) = 0;
        uint64_t v628 = swift_allocObject(&unk_100036550, 17LL, 7LL);
        *(_BYTE *)(v628 + 16) = 8;
        uint64_t v629 = v1;
        uint64_t v630 = swift_allocObject(&unk_100036578, 32LL, 7LL);
        *(void *)(v630 + 16) = sub_10002E02C;
        *(void *)(v630 + 24) = v624;
        uint64_t v631 = swift_allocObject(&unk_1000365A0, 32LL, 7LL);
        *(void *)(v631 + 16) = sub_100029448;
        *(void *)(v631 + 24) = v630;
        uint64_t v632 = swift_allocObject(v623, 80LL, 7LL);
        *(_OWORD *)(v632 + 16) = xmmword_10002FBB0;
        *(void *)(v632 + 32) = sub_10002E258;
        *(void *)(v632 + 40) = v627;
        *(void *)(v632 + 48) = sub_10002E258;
        *(void *)(v632 + 56) = v628;
        *(void *)(v632 + 64) = sub_10002D570;
        *(void *)(v632 + 72) = v631;
        swift_retain(v627);
        swift_retain(v628);
        swift_retain(v631);
        swift_bridgeObjectRelease(v632);
        if (os_log_type_enabled(v625, v626))
        {
          uint64_t v633 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          *(_WORD *)uint64_t v633 = 256;
          v633[2] = *(_BYTE *)(v627 + 16);
          uint64_t v23 = v853;
          if (v853) {
            return swift_errorRelease(v23);
          }
          swift_release(v627);
          v633[3] = *(_BYTE *)(v628 + 16);
          uint64_t v647 = swift_release(v628);
          double v871 = (*(double (**)(uint64_t))(v631 + 16))(v647);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v871, &v872);
          uint64_t v1 = v845;
          uint64_t v648 = v845[138];
          uint64_t v649 = v845[120];
          swift_release(v631);
          _os_log_impl((void *)&_mh_execute_header, v625, v626, "Marking lastSuccessTimestamp: %f", v633, 0xCu);
          swift_slowDealloc(v633, -1LL, -1LL);

          v842(v648, v649);
        }

        else
        {
          uint64_t v634 = v629[138];
          uint64_t v635 = v629[120];
          swift_release(v627);
          swift_release(v628);
          swift_release(v631);

          v842(v634, v635);
          uint64_t v1 = v629;
        }

        Class v650 = Double._bridgeToObjectiveC()().super.super.isa;
        NSString v651 = String._bridgeToObjectiveC()();
        [v622 setValue:v650 forKey:v651];
      }

      uint64_t v824 = v1[232];
      uint64_t v830 = v1[226];
      uint64_t v843 = v1[225];
      uint64_t v652 = v1[210];
      uint64_t v653 = (void *)v1[193];
      uint64_t v654 = (void *)v1[192];
      uint64_t v655 = (void *)v1[191];
      uint64_t v656 = (void *)v1[190];
      uint64_t v657 = (void *)v1[189];
      uint64_t v658 = (void *)v1[188];
      uint64_t v643 = v1;
      uint64_t v659 = v1[187];
      uint64_t v645 = v643[186];
      uint64_t v857 = v643[119];
      uint64_t v867 = v652;
      uint64_t v833 = v643[118];
      uint64_t v851 = v643[117];
      id v660 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v670 = MLHostResult.init(status:policy:)(2LL, 1LL);

      swift_release(v659);
    }

    swift_release(v824);
    swift_release(v830);
    swift_release(v843);
    swift_release(v867);
    sub_100025B68(v645);
    (*(void (**)(uint64_t, uint64_t))(v833 + 8))(v857, v851);
    swift_release(v645);
    uint64_t v661 = v643[177];
    uint64_t v662 = v643[176];
    uint64_t v663 = v643[175];
    uint64_t v664 = v643[174];
    uint64_t v665 = v643[173];
    uint64_t v666 = v643[172];
    uint64_t v667 = v643[171];
    uint64_t v668 = v643[170];
    uint64_t v669 = v643[169];
    uint64_t v671 = v643[168];
    uint64_t v672 = v643[167];
    uint64_t v673 = v643[166];
    uint64_t v674 = v643[165];
    uint64_t v675 = v643[164];
    uint64_t v676 = v643[163];
    uint64_t v677 = v643[162];
    uint64_t v678 = v643[161];
    uint64_t v679 = v643[160];
    uint64_t v680 = v643[159];
    uint64_t v681 = v643[158];
    uint64_t v682 = v643[157];
    uint64_t v683 = v643[156];
    uint64_t v684 = v643[155];
    uint64_t v685 = v643[154];
    uint64_t v686 = v643[153];
    uint64_t v687 = v643[152];
    uint64_t v688 = v643[151];
    uint64_t v689 = v643[150];
    uint64_t v690 = v643[149];
    uint64_t v691 = v643[148];
    uint64_t v692 = v643[147];
    uint64_t v693 = v643[146];
    uint64_t v694 = v643[145];
    uint64_t v695 = v643[144];
    uint64_t v696 = v643[143];
    uint64_t v697 = v643[142];
    uint64_t v698 = v643[141];
    uint64_t v699 = v643[140];
    uint64_t v700 = v643[139];
    uint64_t v701 = v643[138];
    uint64_t v702 = v643[137];
    uint64_t v703 = v643[136];
    uint64_t v704 = v643[135];
    uint64_t v705 = v643[134];
    uint64_t v706 = v643[133];
    uint64_t v707 = v643[132];
    uint64_t v708 = v643[131];
    uint64_t v709 = v643[130];
    uint64_t v710 = v643[129];
    uint64_t v711 = v643[128];
    uint64_t v712 = v643[127];
    uint64_t v713 = v643[126];
    uint64_t v714 = v643[125];
    uint64_t v715 = v643[124];
    uint64_t v716 = v643[123];
    uint64_t v717 = v643[122];
    uint64_t v718 = v643[119];
    uint64_t v719 = v643[116];
    uint64_t v720 = v643[115];
    uint64_t v722 = v643[114];
    uint64_t v724 = v643[113];
    uint64_t v726 = v643[112];
    uint64_t v728 = v643[108];
    uint64_t v730 = v643[105];
    uint64_t v732 = v643[104];
    uint64_t v733 = v643[103];
    uint64_t v735 = v643[99];
    uint64_t v737 = v643[98];
    uint64_t v738 = v643[97];
    id v740 = (id)v643[96];
    uint64_t v742 = v643[92];
    uint64_t v744 = v643[91];
    uint64_t v746 = v643[90];
    uint64_t v749 = v643[89];
    uint64_t v753 = v643[88];
    uint64_t v757 = v643[87];
    uint64_t v759 = v643[86];
    uint64_t v763 = v643[82];
    uint64_t v769 = v643[81];
    uint64_t v775 = v643[80];
    uint64_t v783 = v643[79];
    uint64_t v792 = v643[78];
    uint64_t v795 = v643[77];
    uint64_t v800 = v643[73];
    uint64_t v804 = v643[72];
    uint64_t v807 = v643[69];
    uint64_t v815 = v643[68];
    uint64_t v819 = v643[67];
    uint64_t v825 = v643[63];
    uint64_t v831 = v643[62];
    uint64_t v834 = v643[61];
    uint64_t v844 = v643[60];
    uint64_t v852 = v643[56];
    uint64_t v858 = v643[55];
    uint64_t v868 = v643[54];
    swift_task_dealloc(v643[178]);
    swift_task_dealloc(v661);
    swift_task_dealloc(v662);
    swift_task_dealloc(v663);
    swift_task_dealloc(v664);
    swift_task_dealloc(v665);
    swift_task_dealloc(v666);
    swift_task_dealloc(v667);
    swift_task_dealloc(v668);
    swift_task_dealloc(v669);
    swift_task_dealloc(v671);
    swift_task_dealloc(v672);
    swift_task_dealloc(v673);
    swift_task_dealloc(v674);
    swift_task_dealloc(v675);
    swift_task_dealloc(v676);
    swift_task_dealloc(v677);
    swift_task_dealloc(v678);
    swift_task_dealloc(v679);
    swift_task_dealloc(v680);
    swift_task_dealloc(v681);
    swift_task_dealloc(v682);
    swift_task_dealloc(v683);
    swift_task_dealloc(v684);
    swift_task_dealloc(v685);
    swift_task_dealloc(v686);
    swift_task_dealloc(v687);
    swift_task_dealloc(v688);
    swift_task_dealloc(v689);
    swift_task_dealloc(v690);
    swift_task_dealloc(v691);
    swift_task_dealloc(v692);
    swift_task_dealloc(v693);
    swift_task_dealloc(v694);
    swift_task_dealloc(v695);
    swift_task_dealloc(v696);
    swift_task_dealloc(v697);
    swift_task_dealloc(v698);
    swift_task_dealloc(v699);
    swift_task_dealloc(v700);
    swift_task_dealloc(v701);
    swift_task_dealloc(v702);
    swift_task_dealloc(v703);
    swift_task_dealloc(v704);
    swift_task_dealloc(v705);
    swift_task_dealloc(v706);
    swift_task_dealloc(v707);
    swift_task_dealloc(v708);
    swift_task_dealloc(v709);
    swift_task_dealloc(v710);
    swift_task_dealloc(v711);
    swift_task_dealloc(v712);
    swift_task_dealloc(v713);
    swift_task_dealloc(v714);
    swift_task_dealloc(v715);
    swift_task_dealloc(v716);
    swift_task_dealloc(v717);
    swift_task_dealloc(v718);
    swift_task_dealloc(v719);
    swift_task_dealloc(v720);
    swift_task_dealloc(v722);
    swift_task_dealloc(v724);
    swift_task_dealloc(v726);
    swift_task_dealloc(v728);
    swift_task_dealloc(v730);
    swift_task_dealloc(v732);
    swift_task_dealloc(v733);
    swift_task_dealloc(v735);
    swift_task_dealloc(v737);
    swift_task_dealloc(v738);
    swift_task_dealloc(v740);
    swift_task_dealloc(v742);
    swift_task_dealloc(v744);
    swift_task_dealloc(v746);
    swift_task_dealloc(v749);
    swift_task_dealloc(v753);
    swift_task_dealloc(v757);
    swift_task_dealloc(v759);
    swift_task_dealloc(v763);
    swift_task_dealloc(v769);
    swift_task_dealloc(v775);
    swift_task_dealloc(v783);
    swift_task_dealloc(v792);
    swift_task_dealloc(v795);
    swift_task_dealloc(v800);
    swift_task_dealloc(v804);
    swift_task_dealloc(v807);
    swift_task_dealloc(v815);
    swift_task_dealloc(v819);
    swift_task_dealloc(v825);
    swift_task_dealloc(v831);
    swift_task_dealloc(v834);
    swift_task_dealloc(v844);
    swift_task_dealloc(v852);
    swift_task_dealloc(v858);
    swift_task_dealloc(v868);
    return ((uint64_t (*)(uint64_t))v643[1])(v670);
  }

uint64_t sub_10001C8E8()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 1896);
  *(void *)(*v1 + 1904) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v4 = *(void *)(v2 + 1888);
    uint64_t v5 = *(void *)(v2 + 1880);
    uint64_t v6 = *(void *)(v2 + 1792);
    uint64_t v7 = *(void **)(v2 + 1544);
    uint64_t v8 = *(void **)(v2 + 1536);
    swift_bridgeObjectRelease(*(void *)(v2 + 304));

    swift_bridgeObjectRelease(v6);
    swift_task_dealloc(v4);
    swift_task_dealloc(v5);
    uint64_t v9 = sub_100024BF0;
  }

  else
  {
    uint64_t v10 = *(void *)(v2 + 1888);
    uint64_t v11 = *(void *)(v2 + 1880);
    uint64_t v12 = *(void **)(v2 + 1544);

    swift_task_dealloc(v10);
    swift_task_dealloc(v11);
    uint64_t v9 = sub_10001CA0C;
  }

  return swift_task_switch(v9, 0LL, 0LL);
}

uint64_t sub_10001CA0C()
{
  uint64_t v1 = (void *)v0;
  uint64_t v2 = *(void *)(v0 + 1488);

  uint64_t v3 = *(void *)(v0 + 208);
  *(void *)(v2 + 80) = *(void *)(v3 + 16);
  uint64_t v748 = (os_log_s *)v1[238];
  uint64_t v4 = *(void *)(v3 + 16);
  uint64_t v735 = v1;
  uint64_t v714 = v3;
  if (v4)
  {
    uint64_t v5 = (_BYTE *)(v3 + 48);
    uint64_t v736 = v1[121];
    uint64_t v719 = v1[62];
    uint64_t v724 = v1[58];
    do
    {
      uint64_t v8 = (void *)*((void *)v5 - 1);
      if ((*v5 & 1) != 0)
      {
        uint64_t v741 = v4;
        uint64_t v9 = v1[181];
        ((void (*)(void, void, void))v1[180])(v1[149], v1[179], v1[120]);
        uint64_t v10 = swift_allocObject(&unk_1000360F0, 24LL, 7LL);
        *(void *)(v10 + 16) = v8;
        sub_10002CB60(v8, 1);
        sub_10002CB60(v8, 1);
        uint64_t v11 = swift_errorRetain(v8);
        uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
        os_log_type_t v13 = static os_log_type_t.error.getter();
        uint64_t v14 = swift_allocObject(&unk_100036118, 17LL, 7LL);
        *(_BYTE *)(v14 + 16) = 64;
        uint64_t v15 = swift_allocObject(&unk_100036140, 17LL, 7LL);
        *(_BYTE *)(v15 + 16) = 8;
        uint64_t v16 = v1;
        uint64_t v17 = swift_allocObject(&unk_100036168, 32LL, 7LL);
        *(void *)(v17 + 16) = sub_10002E250;
        *(void *)(v17 + 24) = v10;
        uint64_t v18 = swift_allocObject(&unk_100036190, 32LL, 7LL);
        *(void *)(v18 + 16) = sub_10002CAF8;
        *(void *)(v18 + 24) = v17;
        uint64_t v19 = swift_allocObject(&unk_1000361B8, 32LL, 7LL);
        *(void *)(v19 + 16) = sub_10002E010;
        *(void *)(v19 + 24) = v18;
        uint64_t v20 = swift_allocObject(v9, 80LL, 7LL);
        *(_OWORD *)(v20 + 16) = xmmword_10002FBB0;
        *(void *)(v20 + 32) = sub_10002E258;
        *(void *)(v20 + 40) = v14;
        *(void *)(v20 + 48) = sub_10002E258;
        *(void *)(v20 + 56) = v15;
        *(void *)(v20 + 64) = sub_10002E020;
        *(void *)(v20 + 72) = v19;
        swift_retain(v14);
        swift_retain(v15);
        swift_retain(v19);
        swift_bridgeObjectRelease(v20);
        if (os_log_type_enabled(v12, v13))
        {
          uint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v22 = (void *)swift_slowAlloc(8LL, -1LL);
          uint64_t v756 = v22;
          double v757 = 0.0;
          *(_WORD *)uint64_t v21 = 258;
          v21[2] = *(_BYTE *)(v14 + 16);
          if (v748) {
            return swift_errorRelease(v748);
          }
          uint64_t v23 = v22;
          swift_release(v14);
          v21[3] = *(_BYTE *)(v15 + 16);
          v755[0] = (uint64_t)(v21 + 4);
          swift_release(v15);
          sub_100029334(v755, &v756, (uint64_t)&v757, *(uint64_t (**)(void))(v19 + 16));
          uint64_t v16 = v735;
          uint64_t v24 = v735[149];
          uint64_t v25 = v735[120];
          swift_release(v19);
          _os_log_impl((void *)&_mh_execute_header, v12, v13, "Error: %@", v21, 0xCu);
          uint64_t v26 = sub_100007B74(&qword_1000388A0);
          swift_arrayDestroy(v23, 1LL, v26);
          swift_slowDealloc(v23, -1LL, -1LL);
          swift_slowDealloc(v21, -1LL, -1LL);

          sub_10002CBAC(v8, 1);
          sub_10002CBAC(v8, 1);
          (*(void (**)(uint64_t, uint64_t))(v736 + 8))(v24, v25);
        }

        else
        {
          uint64_t v52 = v16[149];
          uint64_t v53 = v16[120];
          sub_10002CBAC(v8, 1);
          swift_release(v14);
          swift_release(v15);
          swift_release(v19);

          sub_10002CBAC(v8, 1);
          (*(void (**)(uint64_t, uint64_t))(v736 + 8))(v52, v53);
        }

        uint64_t v54 = v16[186];
        uint64_t v55 = *(void *)(v54 + 96);
        BOOL v56 = __OFADD__(v55, 1LL);
        uint64_t v57 = v55 + 1;
        uint64_t v4 = v741;
        if (v56)
        {
          __break(1u);
LABEL_116:
          __break(1u);
        }

        uint64_t v1 = v16;
        *(void *)(v54 + 96) = v57;
      }

      else
      {
        uint64_t v28 = v1[56];
        uint64_t v27 = v1[57];
        sub_10002CB60(*((void **)v5 - 1), 0);
        sub_10002CB60(v8, 0);
        id v29 = v8;
        sub_1000071A4(v29, v28);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v724 + 48))(v28, 1LL, v27) == 1)
        {
          uint64_t v742 = v4;
          uint64_t v30 = v1[181];
          id v31 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v32 = v1[179];
          uint64_t v33 = v1[150];
          uint64_t v34 = v1[120];
          sub_100008880(v1[56], &qword_1000387F8);
          v31(v33, v32, v34);
          uint64_t v35 = swift_allocObject(&unk_100036ED8, 24LL, 7LL);
          *(void *)(v35 + 16) = v29;
          uint64_t v36 = Logger.logObject.getter(v29);
          os_log_type_t v37 = static os_log_type_t.error.getter();
          uint64_t v38 = swift_allocObject(&unk_100036F00, 17LL, 7LL);
          *(_BYTE *)(v38 + 16) = 64;
          uint64_t v39 = swift_allocObject(&unk_100036F28, 17LL, 7LL);
          *(_BYTE *)(v39 + 16) = 8;
          uint64_t v40 = swift_allocObject(&unk_100036F50, 32LL, 7LL);
          *(void *)(v40 + 16) = sub_10002E254;
          *(void *)(v40 + 24) = v35;
          uint64_t v41 = swift_allocObject(&unk_100036F78, 32LL, 7LL);
          *(void *)(v41 + 16) = sub_10002E010;
          *(void *)(v41 + 24) = v40;
          uint64_t v42 = (os_log_s *)v36;
          os_log_type_t v43 = v37;
          uint64_t v44 = swift_allocObject(v30, 80LL, 7LL);
          *(_OWORD *)(v44 + 16) = xmmword_10002FBB0;
          *(void *)(v44 + 32) = sub_10002E258;
          *(void *)(v44 + 40) = v38;
          *(void *)(v44 + 48) = sub_10002E258;
          *(void *)(v44 + 56) = v39;
          *(void *)(v44 + 64) = sub_10002E020;
          *(void *)(v44 + 72) = v41;
          swift_retain(v38);
          swift_retain(v39);
          swift_retain(v41);
          swift_bridgeObjectRelease(v44);
          if (os_log_type_enabled(v42, v37))
          {
            os_log_type_t v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v46 = (void *)swift_slowAlloc(8LL, -1LL);
            uint64_t v756 = v46;
            double v757 = 0.0;
            *(_WORD *)os_log_type_t v45 = 258;
            v45[2] = *(_BYTE *)(v38 + 16);
            if (v748) {
              return swift_errorRelease(v748);
            }
            uint64_t v47 = v46;
            swift_release(v38);
            v45[3] = *(_BYTE *)(v39 + 16);
            v755[0] = (uint64_t)(v45 + 4);
            swift_release(v39);
            sub_100029334(v755, &v756, (uint64_t)&v757, *(uint64_t (**)(void))(v41 + 16));
            uint64_t v1 = v735;
            uint64_t v48 = v42;
            uint64_t v49 = v735[150];
            uint64_t v50 = v735[120];
            swift_release(v41);
            _os_log_impl((void *)&_mh_execute_header, v48, v43, "Skipping record: %@", v45, 0xCu);
            uint64_t v51 = sub_100007B74(&qword_1000388A0);
            swift_arrayDestroy(v47, 1LL, v51);
            swift_slowDealloc(v47, -1LL, -1LL);
            swift_slowDealloc(v45, -1LL, -1LL);

            sub_10002CBAC(v8, 0);
            sub_10002CBAC(v8, 0);
            (*(void (**)(uint64_t, uint64_t))(v736 + 8))(v49, v50);
            uint64_t v748 = 0LL;
          }

          else
          {
            uint64_t v6 = v735[150];
            uint64_t v7 = v735[120];
            sub_10002CBAC(v8, 0);
            swift_release(v38);
            swift_release(v39);
            swift_release(v41);

            sub_10002CBAC(v8, 0);
            (*(void (**)(uint64_t, uint64_t))(v736 + 8))(v6, v7);
            uint64_t v1 = v735;
          }

          uint64_t v4 = v742;
        }

        else
        {
          uint64_t v58 = v1[210];
          uint64_t v59 = (uint64_t *)v1[62];
          sub_10002DAD8(v1[56], (uint64_t)v59, type metadata accessor for TaskPayloadRecord);
          uint64_t v60 = *(void *)(v58 + 16);
          uint64_t v61 = *v59;
          uint64_t v62 = *(void *)(v719 + 8);
          swift_bridgeObjectRetain(v60);
          swift_bridgeObjectRetain(v62);
          LOBYTE(v61) = sub_10002625C(v61, v62, v60);
          swift_bridgeObjectRelease(v60);
          swift_bridgeObjectRelease(v62);
          if ((v61 & 1) != 0)
          {
            uint64_t v63 = v1[186];
            uint64_t v65 = v1[61];
            uint64_t v64 = v1[62];
            sub_1000087B8(v64, v65, type metadata accessor for TaskPayloadRecord);
            sub_10002642C(v65, &qword_100038918, type metadata accessor for TaskPayloadRecord);
            sub_10002CBAC(v8, 0);
            sub_10002CBAC(v8, 0);
            sub_1000087FC(v64, type metadata accessor for TaskPayloadRecord);
            uint64_t v66 = *(void *)(v63 + 88);
            BOOL v56 = __OFADD__(v66, 1LL);
            uint64_t v67 = v66 + 1;
            if (v56) {
              goto LABEL_116;
            }
            *(void *)(v1[186] + 88LL) = v67;
          }

          else
          {
            uint64_t v68 = ((uint64_t (*)(void, void, void))v1[180])(v1[151], v1[179], v1[120]);
            uint64_t v69 = (os_log_s *)Logger.logObject.getter(v68);
            os_log_type_t v70 = static os_log_type_t.debug.getter();
            BOOL v71 = os_log_type_enabled(v69, v70);
            uint64_t v72 = v1[151];
            uint64_t v73 = v1[120];
            uint64_t v74 = v1[62];
            if (v71)
            {
              uint64_t v743 = v4;
              uint64_t v75 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
              uint64_t v756 = 0LL;
              double v757 = 0.0;
              *(_WORD *)uint64_t v75 = 0;
              v755[0] = (uint64_t)(v75 + 2);
              sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v755, (uint64_t)&v756, (uint64_t)&v757);
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
              _os_log_impl( (void *)&_mh_execute_header,  v69,  v70,  "Skipping taskPayloadRecord because associated with an unavailable taskName.",  v75,  2u);
              uint64_t v76 = v75;
              uint64_t v4 = v743;
              swift_slowDealloc(v76, -1LL, -1LL);
            }

            else
            {
              swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
            }

            sub_10002CBAC(v8, 0);
            sub_10002CBAC(v8, 0);
            (*(void (**)(uint64_t, uint64_t))(v736 + 8))(v72, v73);
            sub_1000087FC(v74, type metadata accessor for TaskPayloadRecord);
          }
        }
      }

      v5 += 24;
      --v4;
    }

    while (v4);
  }

  uint64_t v77 = v1[226];
  uint64_t v78 = v1[181];
  uint64_t v79 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
  uint64_t v80 = v1[179];
  uint64_t v81 = v1[148];
  uint64_t v82 = v1[120];
  swift_bridgeObjectRelease(v714);
  v79(v81, v80, v82);
  uint64_t v83 = swift_allocObject(&unk_1000361E0, 32LL, 7LL);
  *(void *)(v83 + 16) = sub_10002CBDC;
  *(void *)(v83 + 24) = v77;
  uint64_t v84 = swift_retain(v77);
  uint64_t v85 = (os_log_s *)Logger.logObject.getter(v84);
  os_log_type_t v86 = static os_log_type_t.info.getter();
  uint64_t v87 = swift_allocObject(&unk_100036208, 17LL, 7LL);
  *(_BYTE *)(v87 + 16) = 32;
  uint64_t v88 = swift_allocObject(&unk_100036230, 17LL, 7LL);
  *(_BYTE *)(v88 + 16) = 8;
  uint64_t v89 = swift_allocObject(&unk_100036258, 32LL, 7LL);
  *(void *)(v89 + 16) = sub_10002D400;
  *(void *)(v89 + 24) = v83;
  uint64_t v90 = swift_allocObject(&unk_100036280, 32LL, 7LL);
  *(void *)(v90 + 16) = sub_10002E010;
  *(void *)(v90 + 24) = v89;
  uint64_t v91 = swift_allocObject(v78, 80LL, 7LL);
  *(_OWORD *)(v91 + 16) = xmmword_10002FBB0;
  *(void *)(v91 + 32) = sub_10002E258;
  *(void *)(v91 + 40) = v87;
  *(void *)(v91 + 48) = sub_10002E258;
  *(void *)(v91 + 56) = v88;
  *(void *)(v91 + 64) = sub_10002E01C;
  *(void *)(v91 + 72) = v90;
  swift_retain(v87);
  swift_retain(v88);
  swift_retain(v90);
  swift_bridgeObjectRelease(v91);
  if (os_log_type_enabled(v85, v86))
  {
    uint64_t v92 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v93 = swift_slowAlloc(32LL, -1LL);
    uint64_t v756 = 0LL;
    double v757 = *(double *)&v93;
    *(_WORD *)uint64_t v92 = 258;
    v92[2] = *(_BYTE *)(v87 + 16);
    if (v748) {
      return swift_errorRelease(v748);
    }
    uint64_t v94 = v93;
    swift_release(v87);
    v92[3] = *(_BYTE *)(v88 + 16);
    v755[0] = (uint64_t)(v92 + 4);
    swift_release(v88);
    sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v90 + 16));
    uint64_t v95 = v1[148];
    uint64_t v96 = v1[121];
    uint64_t v97 = v1[120];
    swift_release(v90);
    _os_log_impl((void *)&_mh_execute_header, v85, v86, "Processing TaskParametersRecords: %s", v92, 0xCu);
    swift_arrayDestroy(v94, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v94, -1LL, -1LL);
    swift_slowDealloc(v92, -1LL, -1LL);

    uint64_t v98 = *(void (**)(void, void))(v96 + 8);
    uint64_t v99 = v95;
    uint64_t v100 = v97;
  }

  else
  {
    uint64_t v101 = v1[148];
    uint64_t v102 = v1[121];
    uint64_t v103 = v1[120];
    swift_release(v87);
    swift_release(v88);
    swift_release(v90);

    uint64_t v98 = *(void (**)(void, void))(v102 + 8);
    uint64_t v99 = v101;
    uint64_t v100 = v103;
  }

  uint64_t v727 = v98;
  v98(v99, v100);
  uint64_t v104 = v1[226];
  swift_beginAccess(v104 + 16, v1 + 5, 0LL, 0LL);
  uint64_t v105 = *(void *)(v104 + 16);
  uint64_t v106 = *(void *)(v105 + 16);
  if (!v106) {
    goto LABEL_54;
  }
  uint64_t v686 = v1 + 18;
  uint64_t v651 = v1[121];
  uint64_t v107 = v1[84];
  uint64_t v678 = v1[75];
  uint64_t v670 = v1[71];
  uint64_t v664 = v1[67];
  uint64_t v108 = v1[65];
  uint64_t v109 = *(unsigned __int8 *)(v108 + 80);
  uint64_t v110 = v105 + ((v109 + 32) & ~v109);
  unsigned int v111 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v701 = ((v109 + 16) & ~v109) + v1[66];
  uint64_t v710 = (v109 + 16) & ~v109;
  uint64_t v698 = v109 | 7;
  uint64_t v720 = *(void *)(v108 + 72);
  uint64_t v641 = *(void *)(v104 + 16);
  swift_bridgeObjectRetain(v105);
  uint64_t v715 = v107;
  unsigned int v658 = v111;
  do
  {
    uint64_t v117 = v1[224];
    uint64_t v118 = v1[83];
    uint64_t v119 = v1[67];
    uint64_t v120 = v1[55];
    sub_1000087B8(v110, v119, type metadata accessor for TaskParametersRecord);
    uint64_t v121 = swift_task_alloc(32LL);
    *(void *)(v121 + 16) = v119;
    sub_100026728((uint64_t (*)(char *))sub_10002D440, v117, v120);
    swift_task_dealloc(v121);
    uint64_t v737 = v110;
    uint64_t v744 = v106;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v107 + 48))(v120, 1LL, v118) == 1)
    {
      uint64_t v122 = v1[181];
      uint64_t v123 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
      uint64_t v124 = v1[179];
      uint64_t v125 = v1[146];
      uint64_t v126 = v1[120];
      uint64_t v127 = v1[68];
      uint64_t v128 = v1[67];
      sub_100008880(v1[55], &qword_1000387F0);
      v123(v125, v124, v126);
      sub_1000087B8(v128, v127, type metadata accessor for TaskParametersRecord);
      uint64_t v129 = swift_allocObject(&unk_1000362A8, v701, v698);
      uint64_t v130 = sub_10002DAD8(v127, v129 + v710, type metadata accessor for TaskParametersRecord);
      uint64_t v131 = (os_log_s *)Logger.logObject.getter(v130);
      os_log_type_t v132 = static os_log_type_t.error.getter();
      uint64_t v133 = swift_allocObject(&unk_1000362D0, 17LL, 7LL);
      *(_BYTE *)(v133 + 16) = 32;
      uint64_t v134 = swift_allocObject(&unk_1000362F8, 17LL, 7LL);
      *(_BYTE *)(v134 + 16) = 8;
      uint64_t v135 = v1;
      uint64_t v136 = swift_allocObject(&unk_100036320, 32LL, 7LL);
      *(void *)(v136 + 16) = sub_10002D460;
      *(void *)(v136 + 24) = v129;
      uint64_t v137 = swift_allocObject(&unk_100036348, 32LL, 7LL);
      *(void *)(v137 + 16) = sub_10002E010;
      *(void *)(v137 + 24) = v136;
      uint64_t v138 = swift_allocObject(v122, 80LL, 7LL);
      *(_OWORD *)(v138 + 16) = xmmword_10002FBB0;
      *(void *)(v138 + 32) = sub_10002E258;
      *(void *)(v138 + 40) = v133;
      *(void *)(v138 + 48) = sub_10002E258;
      *(void *)(v138 + 56) = v134;
      *(void *)(v138 + 64) = sub_10002E01C;
      *(void *)(v138 + 72) = v137;
      swift_retain(v133);
      swift_retain(v134);
      swift_retain(v137);
      swift_bridgeObjectRelease(v138);
      if (os_log_type_enabled(v131, v132))
      {
        uint64_t v139 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v140 = swift_slowAlloc(32LL, -1LL);
        uint64_t v756 = 0LL;
        double v757 = *(double *)&v140;
        *(_WORD *)uint64_t v139 = 258;
        v139[2] = *(_BYTE *)(v133 + 16);
        if (v748) {
          return swift_errorRelease(v748);
        }
        uint64_t v141 = v140;
        swift_release(v133);
        v139[3] = *(_BYTE *)(v134 + 16);
        v755[0] = (uint64_t)(v139 + 4);
        swift_release(v134);
        sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v137 + 16));
        uint64_t v142 = v735[146];
        uint64_t v143 = v735[120];
        swift_release(v137);
        _os_log_impl( (void *)&_mh_execute_header,  v131,  v132,  "Task %s not registered on the system. Skipping task.",  v139,  0xCu);
        swift_arrayDestroy(v141, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v144 = v141;
        uint64_t v1 = v735;
        swift_slowDealloc(v144, -1LL, -1LL);
        swift_slowDealloc(v139, -1LL, -1LL);

        v727(v142, v143);
      }

      else
      {
        uint64_t v112 = v135[146];
        uint64_t v113 = v135[120];
        swift_release(v133);
        swift_release(v134);
        swift_release(v137);

        v727(v112, v113);
        uint64_t v1 = v135;
      }

      uint64_t v114 = v1[67];
      uint64_t v115 = v744;
      uint64_t v107 = v715;
      goto LABEL_32;
    }

    uint64_t v145 = (*(uint64_t (**)(void, void, void))(v107 + 32))(v1[87], v1[55], v1[83]);
    uint64_t v146 = MLHostTask.taskFolder.getter(v145);
    if (!v147)
    {
      uint64_t v197 = v1[181];
      uint64_t v198 = v1[68];
      uint64_t v199 = v1[67];
      ((void (*)(void, void, void))v1[180])(v1[147], v1[179], v1[120]);
      sub_1000087B8(v199, v198, type metadata accessor for TaskParametersRecord);
      uint64_t v200 = swift_allocObject(&unk_100036C30, v701, v698);
      uint64_t v201 = sub_10002DAD8(v198, v200 + v710, type metadata accessor for TaskParametersRecord);
      uint64_t v202 = (os_log_s *)Logger.logObject.getter(v201);
      os_log_type_t v203 = static os_log_type_t.error.getter();
      uint64_t v204 = swift_allocObject(&unk_100036C58, 17LL, 7LL);
      *(_BYTE *)(v204 + 16) = 32;
      uint64_t v205 = swift_allocObject(&unk_100036C80, 17LL, 7LL);
      *(_BYTE *)(v205 + 16) = 8;
      uint64_t v206 = v1;
      uint64_t v207 = swift_allocObject(&unk_100036CA8, 32LL, 7LL);
      *(void *)(v207 + 16) = sub_10002D460;
      *(void *)(v207 + 24) = v200;
      uint64_t v208 = swift_allocObject(&unk_100036CD0, 32LL, 7LL);
      *(void *)(v208 + 16) = sub_10002E010;
      *(void *)(v208 + 24) = v207;
      uint64_t v209 = swift_allocObject(v197, 80LL, 7LL);
      *(_OWORD *)(v209 + 16) = xmmword_10002FBB0;
      *(void *)(v209 + 32) = sub_10002E258;
      *(void *)(v209 + 40) = v204;
      *(void *)(v209 + 48) = sub_10002E258;
      *(void *)(v209 + 56) = v205;
      *(void *)(v209 + 64) = sub_10002E01C;
      *(void *)(v209 + 72) = v208;
      swift_retain(v204);
      swift_retain(v205);
      swift_retain(v208);
      swift_bridgeObjectRelease(v209);
      if (os_log_type_enabled(v202, v203))
      {
        uint64_t v210 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v211 = swift_slowAlloc(32LL, -1LL);
        uint64_t v756 = 0LL;
        double v757 = *(double *)&v211;
        *(_WORD *)uint64_t v210 = 258;
        v210[2] = *(_BYTE *)(v204 + 16);
        if (v748) {
          return swift_errorRelease(v748);
        }
        uint64_t v212 = v211;
        swift_release(v204);
        v210[3] = *(_BYTE *)(v205 + 16);
        v755[0] = (uint64_t)(v210 + 4);
        swift_release(v205);
        sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v208 + 16));
        uint64_t v206 = v735;
        uint64_t v213 = v735[147];
        uint64_t v214 = v735[120];
        uint64_t v215 = v735[87];
        uint64_t v216 = v735[83];
        swift_release(v208);
        _os_log_impl( (void *)&_mh_execute_header,  v202,  v203,  "Task %s doesn't have a valid taskFolder. Skipping task.",  v210,  0xCu);
        swift_arrayDestroy(v212, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v212, -1LL, -1LL);
        swift_slowDealloc(v210, -1LL, -1LL);

        v727(v213, v214);
        uint64_t v107 = v715;
        (*(void (**)(uint64_t, uint64_t))(v715 + 8))(v215, v216);
      }

      else
      {
        uint64_t v225 = v206[147];
        uint64_t v226 = v206[120];
        uint64_t v227 = v206[87];
        uint64_t v228 = v206[83];

        swift_release(v208);
        swift_release(v205);
        swift_release(v204);
        v727(v225, v226);
        uint64_t v107 = v715;
        (*(void (**)(uint64_t, uint64_t))(v715 + 8))(v227, v228);
      }

      uint64_t v114 = v206[67];
      uint64_t v1 = v206;
      goto LABEL_52;
    }

    uint64_t v148 = v146;
    uint64_t v149 = v147;
    uint64_t v150 = v1[73];
    uint64_t v151 = v1[72];
    (*(void (**)(uint64_t, uint64_t, uint64_t, void))(v678 + 56))(v150, 1LL, 1LL, v1[74]);
    uint64_t v152 = type metadata accessor for URL.DirectoryHint(0LL);
    uint64_t v153 = *(void (**)(uint64_t, void, uint64_t))(*(void *)(v152 - 8) + 104LL);
    v153(v151, v658, v152);
    URL.init(filePath:directoryHint:relativeTo:)(v148, v149, v151, v150);
    if (qword_1000383A8 != -1) {
      swift_once(&qword_1000383A8, sub_10000B020);
    }
    uint64_t v154 = v1[82];
    uint64_t v155 = v1[80];
    uint64_t v692 = v1[74];
    uint64_t v156 = v1[72];
    uint64_t v157 = v1[70];
    uint64_t v158 = *(void *)algn_100038798;
    v1[18] = qword_100038790;
    v1[19] = v158;
    v153(v156, v658, v152);
    unint64_t v159 = sub_100028A54();
    swift_bridgeObjectRetain(v158);
    URL.appending<A>(path:directoryHint:)(v686, v156, &type metadata for String, v159);
    (*(void (**)(uint64_t, uint64_t))(v670 + 8))(v156, v157);
    swift_bridgeObjectRelease(v1[19]);
    uint64_t v160 = *(void (**)(uint64_t, uint64_t))(v678 + 8);
    v160(v154, v692);
    uint64_t v161 = *(void *)(v664 + 32);
    unint64_t v162 = *(void *)(v664 + 40);
    sub_1000085F8(v161, v162);
    Data.write(to:options:)(v155, 0LL, v161, v162);
    if (!v748)
    {
      uint64_t v217 = v1[87];
      uint64_t v218 = v1[83];
      uint64_t v219 = v1[80];
      uint64_t v220 = v1[74];
      uint64_t v114 = v1[67];
      sub_1000085B4(v161, v162);
      v160(v219, v220);
      uint64_t v107 = v715;
      (*(void (**)(uint64_t, uint64_t))(v715 + 8))(v217, v218);
      uint64_t v748 = 0LL;
LABEL_52:
      uint64_t v115 = v744;
LABEL_32:
      uint64_t v116 = v737;
      goto LABEL_33;
    }

    uint64_t v689 = v160;
    uint64_t v728 = v1[181];
    os_log_type_t v163 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
    uint64_t v164 = v1[179];
    uint64_t v165 = v1[124];
    uint64_t v166 = v1[120];
    uint64_t v167 = v1[82];
    uint64_t v168 = v1[80];
    uint64_t v693 = v1[76];
    uint64_t v169 = v1[74];
    sub_1000085B4(v161, v162);
    v163(v165, v164, v166);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v678 + 16))(v167, v168, v169);
    uint64_t v170 = *(unsigned __int8 *)(v678 + 80);
    uint64_t v171 = (v170 + 16) & ~v170;
    uint64_t v172 = swift_allocObject(&unk_100036CF8, v171 + v693, v170 | 7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v678 + 32))(v172 + v171, v167, v169);
    uint64_t v173 = swift_allocObject(&unk_100036D20, 32LL, 7LL);
    *(void *)(v173 + 16) = sub_10002D65C;
    *(void *)(v173 + 24) = v172;
    uint64_t v174 = swift_allocObject(&unk_100036D48, 24LL, 7LL);
    *(void *)(v174 + 16) = v748;
    uint64_t v175 = swift_errorRetain(v748);
    uint64_t v176 = (os_log_s *)Logger.logObject.getter(v175);
    LOBYTE(v165) = static os_log_type_t.error.getter();
    uint64_t v177 = swift_allocObject(&unk_100036D70, 17LL, 7LL);
    *(_BYTE *)(v177 + 16) = 32;
    uint64_t v178 = swift_allocObject(&unk_100036D98, 17LL, 7LL);
    *(_BYTE *)(v178 + 16) = 8;
    uint64_t v179 = swift_allocObject(&unk_100036DC0, 32LL, 7LL);
    *(void *)(v179 + 16) = sub_10002E014;
    *(void *)(v179 + 24) = v173;
    uint64_t v180 = swift_allocObject(&unk_100036DE8, 32LL, 7LL);
    *(void *)(v180 + 16) = sub_10002E010;
    *(void *)(v180 + 24) = v179;
    uint64_t v181 = swift_allocObject(&unk_100036E10, 17LL, 7LL);
    *(_BYTE *)(v181 + 16) = 64;
    uint64_t v182 = swift_allocObject(&unk_100036E38, 17LL, 7LL);
    *(_BYTE *)(v182 + 16) = 8;
    uint64_t v183 = swift_allocObject(&unk_100036E60, 32LL, 7LL);
    *(void *)(v183 + 16) = sub_10002E250;
    *(void *)(v183 + 24) = v174;
    uint64_t v184 = swift_allocObject(&unk_100036E88, 32LL, 7LL);
    *(void *)(v184 + 16) = sub_10002CAF8;
    *(void *)(v184 + 24) = v183;
    uint64_t v185 = swift_allocObject(&unk_100036EB0, 32LL, 7LL);
    *(void *)(v185 + 16) = sub_10002E010;
    *(void *)(v185 + 24) = v184;
    uint64_t v186 = swift_allocObject(v728, 128LL, 7LL);
    *(_OWORD *)(v186 + 16) = xmmword_10002FBC0;
    *(void *)(v186 + 32) = sub_10002E258;
    *(void *)(v186 + 40) = v177;
    *(void *)(v186 + 48) = sub_10002E258;
    *(void *)(v186 + 56) = v178;
    *(void *)(v186 + 64) = sub_10002E01C;
    *(void *)(v186 + 72) = v180;
    *(void *)(v186 + 80) = sub_10002E258;
    *(void *)(v186 + 88) = v181;
    *(void *)(v186 + 96) = sub_10002E258;
    *(void *)(v186 + 104) = v182;
    *(void *)(v186 + 112) = sub_10002E020;
    *(void *)(v186 + 120) = v185;
    swift_retain(v177);
    swift_retain(v178);
    swift_retain(v180);
    swift_retain(v181);
    swift_retain(v182);
    swift_retain(v185);
    swift_bridgeObjectRelease(v186);
    os_log_type_t v187 = v165;
    uint64_t v729 = v176;
    if (os_log_type_enabled(v176, (os_log_type_t)v165))
    {
      id v188 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
      uint64_t v694 = (void *)swift_slowAlloc(8LL, -1LL);
      uint64_t v189 = swift_slowAlloc(32LL, -1LL);
      uint64_t v756 = v694;
      double v757 = *(double *)&v189;
      *(_WORD *)id v188 = 514;
      v188[2] = *(_BYTE *)(v177 + 16);
      swift_release(v177);
      v188[3] = *(_BYTE *)(v178 + 16);
      v755[0] = (uint64_t)(v188 + 4);
      swift_release(v178);
      sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v180 + 16));
      swift_release(v180);
      uint64_t v190 = v755[0];
      *(_BYTE *)v755[0] = *(_BYTE *)(v181 + 16);
      swift_release(v181);
      *(_BYTE *)(v190 + 1) = *(_BYTE *)(v182 + 16);
      v755[0] = v190 + 2;
      swift_release(v182);
      sub_100029334(v755, &v756, (uint64_t)&v757, *(uint64_t (**)(void))(v185 + 16));
      uint64_t v191 = v735[124];
      uint64_t v192 = v735[120];
      uint64_t v644 = v735[87];
      uint64_t v193 = v735[83];
      uint64_t v194 = v735[80];
      uint64_t v195 = v735[74];
      swift_release(v185);
      _os_log_impl((void *)&_mh_execute_header, v729, v187, "Failed at writing taskParamFile: %s : %@", v188, 0x16u);
      uint64_t v196 = sub_100007B74(&qword_1000388A0);
      swift_arrayDestroy(v694, 1LL, v196);
      swift_slowDealloc(v694, -1LL, -1LL);
      swift_arrayDestroy(v189, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v189, -1LL, -1LL);
      swift_slowDealloc(v188, -1LL, -1LL);

      swift_errorRelease(v748);
      uint64_t v727 = *(void (**)(uint64_t, uint64_t))(v651 + 8);
      v727(v191, v192);
      v689(v194, v195);
      uint64_t v107 = v715;
      (*(void (**)(uint64_t, uint64_t))(v715 + 8))(v644, v193);
    }

    else
    {
      uint64_t v221 = v735[124];
      uint64_t v222 = v735[120];
      uint64_t v223 = v735[87];
      uint64_t v224 = v735[83];
      uint64_t v695 = v735[80];
      uint64_t v645 = v735[74];

      swift_release(v185);
      swift_release(v182);
      swift_release(v181);
      swift_release(v180);
      swift_release(v178);
      swift_release(v177);
      swift_errorRelease(v748);
      uint64_t v727 = *(void (**)(uint64_t, uint64_t))(v651 + 8);
      v727(v221, v222);
      v689(v695, v645);
      uint64_t v107 = v715;
      (*(void (**)(uint64_t, uint64_t))(v715 + 8))(v223, v224);
    }

    uint64_t v116 = v737;
    uint64_t v115 = v744;
    uint64_t v748 = 0LL;
    uint64_t v1 = v735;
    uint64_t v114 = v735[67];
LABEL_33:
    sub_1000087FC(v114, type metadata accessor for TaskParametersRecord);
    uint64_t v110 = v116 + v720;
    uint64_t v106 = v115 - 1;
  }

  while (v106);
  swift_bridgeObjectRelease(v641);
LABEL_54:
  uint64_t v229 = v1[232];
  uint64_t v230 = v1[181];
  ((void (*)(void, void, void))v1[180])(v1[145], v1[179], v1[120]);
  uint64_t v231 = swift_allocObject(&unk_100036370, 32LL, 7LL);
  *(void *)(v231 + 16) = sub_10002CBDC;
  *(void *)(v231 + 24) = v229;
  uint64_t v232 = swift_retain(v229);
  uint64_t v233 = (os_log_s *)Logger.logObject.getter(v232);
  os_log_type_t v234 = static os_log_type_t.info.getter();
  uint64_t v235 = swift_allocObject(&unk_100036398, 17LL, 7LL);
  *(_BYTE *)(v235 + 16) = 32;
  uint64_t v236 = swift_allocObject(&unk_1000363C0, 17LL, 7LL);
  *(_BYTE *)(v236 + 16) = 8;
  uint64_t v237 = swift_allocObject(&unk_1000363E8, 32LL, 7LL);
  *(void *)(v237 + 16) = sub_10002D4D0;
  *(void *)(v237 + 24) = v231;
  uint64_t v238 = swift_allocObject(&unk_100036410, 32LL, 7LL);
  *(void *)(v238 + 16) = sub_10002E010;
  *(void *)(v238 + 24) = v237;
  uint64_t v239 = swift_allocObject(v230, 80LL, 7LL);
  *(_OWORD *)(v239 + 16) = xmmword_10002FBB0;
  *(void *)(v239 + 32) = sub_10002E258;
  *(void *)(v239 + 40) = v235;
  *(void *)(v239 + 48) = sub_10002E258;
  *(void *)(v239 + 56) = v236;
  *(void *)(v239 + 64) = sub_10002E01C;
  *(void *)(v239 + 72) = v238;
  swift_retain(v235);
  swift_retain(v236);
  swift_retain(v238);
  swift_bridgeObjectRelease(v239);
  if (os_log_type_enabled(v233, v234))
  {
    uint64_t v240 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v241 = swift_slowAlloc(32LL, -1LL);
    uint64_t v756 = 0LL;
    double v757 = *(double *)&v241;
    *(_WORD *)uint64_t v240 = 258;
    v240[2] = *(_BYTE *)(v235 + 16);
    if (!v748)
    {
      uint64_t v242 = v241;
      swift_release(v235);
      v240[3] = *(_BYTE *)(v236 + 16);
      v755[0] = (uint64_t)(v240 + 4);
      swift_release(v236);
      sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v238 + 16));
      uint64_t v243 = v1[145];
      uint64_t v244 = v1[120];
      swift_release(v238);
      _os_log_impl((void *)&_mh_execute_header, v233, v234, "Processing TaskPayloadRecords: %s", v240, 0xCu);
      swift_arrayDestroy(v242, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v242, -1LL, -1LL);
      swift_slowDealloc(v240, -1LL, -1LL);

      uint64_t v245 = v243;
      uint64_t v246 = v244;
      goto LABEL_58;
    }

    return swift_errorRelease(v748);
  }

  else
  {
    uint64_t v247 = v1[145];
    uint64_t v248 = v1[120];
    swift_release(v235);
    swift_release(v236);
    swift_release(v238);

    uint64_t v245 = v247;
    uint64_t v246 = v248;
LABEL_58:
    uint64_t v249 = v727;
    v727(v245, v246);
    uint64_t v250 = v1[232];
    swift_beginAccess(v250 + 16, v1 + 2, 0LL, 0LL);
    uint64_t v251 = *(void *)(v250 + 16);
    uint64_t v252 = *(void *)(v251 + 16);
    if (v252)
    {
      id v646 = v1 + 16;
      uint64_t v642 = v1 + 40;
      uint64_t v617 = v1 + 42;
      uint64_t v619 = v1 + 14;
      uint64_t v253 = v1[84];
      uint64_t v254 = v1[75];
      uint64_t v639 = v1[71];
      uint64_t v623 = v1[121];
      uint64_t v625 = v1[60];
      uint64_t v255 = v1[58];
      uint64_t v256 = *(unsigned __int8 *)(v255 + 80);
      uint64_t v257 = v251 + ((v256 + 32) & ~v256);
      unsigned int v699 = enum case for URL.DirectoryHint.inferFromPath(_:);
      uint64_t v690 = ((v256 + 16) & ~v256) + v1[59];
      uint64_t v696 = (v256 + 16) & ~v256;
      uint64_t v687 = v256 | 7;
      uint64_t v721 = *(void *)(v255 + 72);
      uint64_t v615 = *(void *)(v250 + 16);
      swift_bridgeObjectRetain(v251);
      uint64_t v711 = v254;
      uint64_t v716 = v253;
      while (1)
      {
        uint64_t v730 = v249;
        uint64_t v265 = sub_1000087B8(v257, v1[60], type metadata accessor for TaskPayloadRecord);
        char v266 = static Task<>.isCancelled.getter(v265);
        uint64_t v267 = v1[224];
        if ((v266 & 1) != 0) {
          break;
        }
        uint64_t v738 = v257;
        uint64_t v268 = v1[83];
        uint64_t v269 = v1[60];
        uint64_t v270 = v1[54];
        uint64_t v271 = swift_task_alloc(32LL);
        *(void *)(v271 + 16) = v269;
        sub_100026728((uint64_t (*)(char *))sub_10002DFF8, v267, v270);
        swift_task_dealloc(v271);
        uint64_t v745 = v252;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v253 + 48))(v270, 1LL, v268) == 1)
        {
          uint64_t v272 = v1[181];
          uint64_t v273 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
          uint64_t v274 = v1[179];
          uint64_t v275 = v1[139];
          uint64_t v276 = v1[120];
          uint64_t v278 = v1[60];
          uint64_t v277 = v1[61];
          sub_100008880(v1[54], &qword_1000387F0);
          v273(v275, v274, v276);
          sub_1000087B8(v278, v277, type metadata accessor for TaskPayloadRecord);
          uint64_t v279 = swift_allocObject(&unk_100036438, v690, v687);
          uint64_t v280 = sub_10002DAD8(v277, v279 + v696, type metadata accessor for TaskPayloadRecord);
          uint64_t v281 = (os_log_s *)Logger.logObject.getter(v280);
          os_log_type_t v282 = static os_log_type_t.error.getter();
          uint64_t v283 = swift_allocObject(&unk_100036460, 17LL, 7LL);
          *(_BYTE *)(v283 + 16) = 32;
          uint64_t v284 = swift_allocObject(&unk_100036488, 17LL, 7LL);
          *(_BYTE *)(v284 + 16) = 8;
          uint64_t v285 = swift_allocObject(&unk_1000364B0, 32LL, 7LL);
          *(void *)(v285 + 16) = sub_10002D514;
          *(void *)(v285 + 24) = v279;
          uint64_t v286 = swift_allocObject(&unk_1000364D8, 32LL, 7LL);
          *(void *)(v286 + 16) = sub_10002E010;
          *(void *)(v286 + 24) = v285;
          uint64_t v287 = swift_allocObject(v272, 80LL, 7LL);
          *(_OWORD *)(v287 + 16) = xmmword_10002FBB0;
          *(void *)(v287 + 32) = sub_10002E258;
          *(void *)(v287 + 40) = v283;
          *(void *)(v287 + 48) = sub_10002E258;
          *(void *)(v287 + 56) = v284;
          *(void *)(v287 + 64) = sub_10002E01C;
          *(void *)(v287 + 72) = v286;
          swift_retain(v283);
          swift_retain(v284);
          swift_retain(v286);
          swift_bridgeObjectRelease(v287);
          if (os_log_type_enabled(v281, v282))
          {
            uint64_t v288 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            uint64_t v289 = swift_slowAlloc(32LL, -1LL);
            uint64_t v756 = 0LL;
            double v757 = *(double *)&v289;
            *(_WORD *)uint64_t v288 = 258;
            v288[2] = *(_BYTE *)(v283 + 16);
            if (v748) {
              return swift_errorRelease(v748);
            }
            uint64_t v290 = v289;
            swift_release(v283);
            v288[3] = *(_BYTE *)(v284 + 16);
            v755[0] = (uint64_t)(v288 + 4);
            swift_release(v284);
            sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v286 + 16));
            uint64_t v291 = v1[139];
            uint64_t v292 = v1[120];
            swift_release(v286);
            _os_log_impl( (void *)&_mh_execute_header,  v281,  v282,  "Task %s not registered on the system. Skipping task.",  v288,  0xCu);
            swift_arrayDestroy(v290, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v290, -1LL, -1LL);
            swift_slowDealloc(v288, -1LL, -1LL);

            uint64_t v293 = v291;
            uint64_t v294 = v292;
          }

          else
          {
            uint64_t v342 = v1[139];
            uint64_t v343 = v1[120];
            swift_release(v283);
            swift_release(v284);
            swift_release(v286);

            uint64_t v293 = v342;
            uint64_t v294 = v343;
          }

          uint64_t v249 = v730;
          v730(v293, v294);
          uint64_t v263 = v1[60];
          uint64_t v264 = v745;
          uint64_t v253 = v716;
        }

        else
        {
          uint64_t v295 = (*(uint64_t (**)(void, void, void))(v253 + 32))(v1[86], v1[54], v1[83]);
          uint64_t v296 = MLHostTask.taskFolder.getter(v295);
          if (v297)
          {
            uint64_t v298 = v296;
            uint64_t v299 = v297;
            uint64_t v300 = v1[73];
            uint64_t v301 = v1[72];
            uint64_t v648 = *(void (**)(uint64_t, uint64_t, uint64_t, void))(v254 + 56);
            v648(v300, 1LL, 1LL, v1[74]);
            uint64_t v302 = type metadata accessor for URL.DirectoryHint(0LL);
            uint64_t v303 = v254;
            uint64_t v702 = *(void (**)(uint64_t))(*(void *)(v302 - 8) + 104LL);
            v702(v301);
            URL.init(filePath:directoryHint:relativeTo:)(v298, v299, v301, v300);
            if (qword_1000383A0 != -1) {
              swift_once(&qword_1000383A0, sub_10000B000);
            }
            uint64_t v304 = v1[82];
            uint64_t v305 = v1[74];
            uint64_t v306 = v1[72];
            uint64_t v307 = v1[70];
            uint64_t v308 = *(void *)algn_100038788;
            v1[16] = qword_100038780;
            v1[17] = v308;
            ((void (*)(uint64_t, void, uint64_t))v702)(v306, v699, v302);
            unint64_t v309 = sub_100028A54();
            swift_bridgeObjectRetain(v308);
            unint64_t v637 = v309;
            URL.appending<A>(path:directoryHint:)(v646, v306, &type metadata for String, v309);
            uint64_t v635 = *(void (**)(uint64_t, uint64_t))(v639 + 8);
            v635(v306, v307);
            swift_bridgeObjectRelease(v1[17]);
            uint64_t v652 = *(void (**)(uint64_t, uint64_t))(v303 + 8);
            v652(v304, v305);
            id v633 = (id)objc_opt_self(&OBJC_CLASS___NSFileManager);
            id v310 = [v633 defaultManager];
            object = URL.path(percentEncoded:)(0)._object;
            NSString v312 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(object);
            v1[40] = 0LL;
            LODWORD(v307) = [v310 createDirectoryAtPath:v312 withIntermediateDirectories:1 attributes:0 error:v642];

            uint64_t v313 = (void *)v1[40];
            uint64_t v679 = v1[181];
            uint64_t v659 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
            uint64_t v314 = v1[179];
            uint64_t v315 = v303;
            uint64_t v654 = v1[120];
            uint64_t v671 = v1[82];
            uint64_t v665 = v1[76];
            uint64_t v316 = v1[74];
            if ((_DWORD)v307)
            {
              uint64_t v317 = v1[143];
              uint64_t v318 = v1[78];
              uint64_t v319 = v1;
              uint64_t v320 = v1[73];
              uint64_t v321 = v319[72];
              uint64_t v322 = *(void *)(v625 + 40);
              uint64_t v628 = *(void *)(v625 + 32);
              uint64_t v630 = v317;
              v648(v320, 1LL, 1LL, v316);
              uint64_t v621 = v302;
              ((void (*)(uint64_t, void, uint64_t))v702)(v321, v699, v302);
              id v323 = v313;
              swift_bridgeObjectRetain(v322);
              URL.init(filePath:directoryHint:relativeTo:)(v628, v322, v321, v320);
              v659(v630, v314, v654);
              id v660 = *(void (**)(uint64_t, uint64_t, uint64_t))(v303 + 16);
              v660(v671, v318, v316);
              uint64_t v324 = *(unsigned __int8 *)(v303 + 80);
              uint64_t v325 = (v324 + 16) & ~v324;
              uint64_t v649 = v325 + v665;
              uint64_t v655 = v324 | 7;
              uint64_t v326 = swift_allocObject(&unk_100036870, v325 + v665, v324 | 7);
              uint64_t v666 = v325;
              uint64_t v327 = *(void (**)(uint64_t, uint64_t, uint64_t))(v315 + 32);
              v327(v326 + v325, v671, v316);
              uint64_t v328 = swift_allocObject(&unk_100036898, 32LL, 7LL);
              *(void *)(v328 + 16) = sub_10002D65C;
              *(void *)(v328 + 24) = v326;
              uint64_t v329 = (os_log_s *)Logger.logObject.getter(v328);
              os_log_type_t v330 = static os_log_type_t.info.getter();
              uint64_t v331 = swift_allocObject(&unk_1000368C0, 17LL, 7LL);
              *(_BYTE *)(v331 + 16) = 32;
              uint64_t v332 = swift_allocObject(&unk_1000368E8, 17LL, 7LL);
              *(_BYTE *)(v332 + 16) = 8;
              uint64_t v333 = swift_allocObject(&unk_100036910, 32LL, 7LL);
              *(void *)(v333 + 16) = sub_10002E014;
              *(void *)(v333 + 24) = v328;
              uint64_t v334 = swift_allocObject(&unk_100036938, 32LL, 7LL);
              *(void *)(v334 + 16) = sub_10002E010;
              *(void *)(v334 + 24) = v333;
              uint64_t v335 = swift_allocObject(v679, 80LL, 7LL);
              *(_OWORD *)(v335 + 16) = xmmword_10002FBB0;
              *(void *)(v335 + 32) = sub_10002E258;
              *(void *)(v335 + 40) = v331;
              *(void *)(v335 + 48) = sub_10002E258;
              *(void *)(v335 + 56) = v332;
              *(void *)(v335 + 64) = sub_10002E01C;
              *(void *)(v335 + 72) = v334;
              swift_retain(v331);
              swift_retain(v332);
              swift_retain(v334);
              swift_bridgeObjectRelease(v335);
              if (os_log_type_enabled(v329, v330))
              {
                uint64_t v336 = v327;
                uint64_t v337 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
                uint64_t v338 = swift_slowAlloc(32LL, -1LL);
                uint64_t v756 = 0LL;
                double v757 = *(double *)&v338;
                *(_WORD *)uint64_t v337 = 258;
                v337[2] = *(_BYTE *)(v331 + 16);
                if (v748) {
                  return swift_errorRelease(v748);
                }
                uint64_t v339 = v338;
                swift_release(v331);
                v337[3] = *(_BYTE *)(v332 + 16);
                v755[0] = (uint64_t)(v337 + 4);
                swift_release(v332);
                sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v334 + 16));
                uint64_t v1 = v735;
                uint64_t v340 = v735[143];
                uint64_t v341 = v735[120];
                swift_release(v334);
                _os_log_impl((void *)&_mh_execute_header, v329, v330, "Processing: %s", v337, 0xCu);
                swift_arrayDestroy(v339, 1LL, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v339, -1LL, -1LL);
                swift_slowDealloc(v337, -1LL, -1LL);

                v730(v340, v341);
                uint64_t v327 = v336;
              }

              else
              {
                uint64_t v397 = v735[143];
                uint64_t v398 = v735[120];
                swift_release(v331);
                swift_release(v332);
                swift_release(v334);

                v730(v397, v398);
                uint64_t v1 = v735;
              }

              if ((sub_10002690C(v1[78], v1[79]) & 1) != 0)
              {
                uint64_t v399 = v1[181];
                uint64_t v400 = v1[82];
                uint64_t v401 = v1[79];
                uint64_t v402 = v1[74];
                ((void (*)(void, void, void))v1[180])(v1[142], v1[179], v1[120]);
                v660(v400, v401, v402);
                uint64_t v403 = swift_allocObject(&unk_100036B40, v649, v655);
                v327(v403 + v666, v400, v402);
                uint64_t v404 = swift_allocObject(&unk_100036B68, 32LL, 7LL);
                *(void *)(v404 + 16) = sub_10002D65C;
                *(void *)(v404 + 24) = v403;
                uint64_t v405 = (os_log_s *)Logger.logObject.getter(v404);
                os_log_type_t v406 = static os_log_type_t.info.getter();
                uint64_t v407 = swift_allocObject(&unk_100036B90, 17LL, 7LL);
                *(_BYTE *)(v407 + 16) = 32;
                uint64_t v408 = swift_allocObject(&unk_100036BB8, 17LL, 7LL);
                *(_BYTE *)(v408 + 16) = 8;
                uint64_t v409 = swift_allocObject(&unk_100036BE0, 32LL, 7LL);
                *(void *)(v409 + 16) = sub_10002E014;
                *(void *)(v409 + 24) = v404;
                uint64_t v410 = swift_allocObject(&unk_100036C08, 32LL, 7LL);
                *(void *)(v410 + 16) = sub_10002E010;
                *(void *)(v410 + 24) = v409;
                uint64_t v411 = swift_allocObject(v399, 80LL, 7LL);
                *(_OWORD *)(v411 + 16) = xmmword_10002FBB0;
                *(void *)(v411 + 32) = sub_10002E258;
                *(void *)(v411 + 40) = v407;
                *(void *)(v411 + 48) = sub_10002E258;
                *(void *)(v411 + 56) = v408;
                *(void *)(v411 + 64) = sub_10002E01C;
                *(void *)(v411 + 72) = v410;
                swift_retain(v407);
                swift_retain(v408);
                swift_retain(v410);
                swift_bridgeObjectRelease(v411);
                if (os_log_type_enabled(v405, v406))
                {
                  uint64_t v412 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
                  uint64_t v413 = swift_slowAlloc(32LL, -1LL);
                  uint64_t v756 = 0LL;
                  double v757 = *(double *)&v413;
                  *(_WORD *)uint64_t v412 = 258;
                  v412[2] = *(_BYTE *)(v407 + 16);
                  if (v748) {
                    return swift_errorRelease(v748);
                  }
                  uint64_t v414 = v413;
                  swift_release(v407);
                  v412[3] = *(_BYTE *)(v408 + 16);
                  v755[0] = (uint64_t)(v412 + 4);
                  swift_release(v408);
                  sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v410 + 16));
                  uint64_t v415 = v1[142];
                  unint64_t v416 = v1;
                  uint64_t v417 = v1[120];
                  uint64_t v704 = v416[86];
                  uint64_t v681 = v416[83];
                  uint64_t v673 = v416[79];
                  uint64_t v418 = v416[78];
                  uint64_t v419 = v416[74];
                  swift_release(v410);
                  _os_log_impl((void *)&_mh_execute_header, v405, v406, "TaskPayload extracted at: %s", v412, 0xCu);
                  swift_arrayDestroy(v414, 1LL, (char *)&type metadata for Any + 8);
                  swift_slowDealloc(v414, -1LL, -1LL);
                  swift_slowDealloc(v412, -1LL, -1LL);

                  v730(v415, v417);
                  uint64_t v420 = v418;
                  uint64_t v249 = v730;
                  uint64_t v421 = v652;
                  v652(v420, v419);
                  uint64_t v422 = v673;
                  uint64_t v423 = v419;
                }

                else
                {
                  uint64_t v435 = v1[142];
                  uint64_t v436 = v1[120];
                  uint64_t v704 = v1[86];
                  uint64_t v681 = v1[83];
                  unint64_t v416 = v1;
                  uint64_t v437 = v1[79];
                  uint64_t v438 = v416[78];
                  uint64_t v439 = v416[74];

                  swift_release(v410);
                  swift_release(v408);
                  swift_release(v407);
                  uint64_t v249 = v730;
                  v730(v435, v436);
                  uint64_t v421 = v652;
                  v652(v438, v439);
                  uint64_t v422 = v437;
                  uint64_t v423 = v439;
                }

                v421(v422, v423);
                uint64_t v253 = v716;
                (*(void (**)(uint64_t, uint64_t))(v716 + 8))(v704, v681);
                uint64_t v263 = v416[60];
                uint64_t v1 = v416;
              }

              else
              {
                uint64_t v428 = ((uint64_t (*)(void, void, void))v1[180])(v1[141], v1[179], v1[120]);
                uint64_t v429 = (os_log_s *)Logger.logObject.getter(v428);
                os_log_type_t v430 = static os_log_type_t.info.getter();
                BOOL v431 = os_log_type_enabled(v429, v430);
                uint64_t v432 = v1[141];
                uint64_t v433 = v1[120];
                if (v431)
                {
                  uint64_t v434 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
                  uint64_t v756 = 0LL;
                  double v757 = 0.0;
                  *(_WORD *)uint64_t v434 = 0;
                  v755[0] = (uint64_t)(v434 + 2);
                  sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v755, (uint64_t)&v756, (uint64_t)&v757);
                  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
                  _os_log_impl( (void *)&_mh_execute_header,  v429,  v430,  "Failed at processing archive, copying raw archive into taskFolder.",  v434,  2u);
                  swift_slowDealloc(v434, -1LL, -1LL);
                }

                else
                {
                  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
                }

                v730(v432, v433);
                uint64_t v440 = v1[72];
                uint64_t v441 = v1[70];
                v1[14] = 0x612E737465737361LL;
                v1[15] = 0xEA00000000007261LL;
                ((void (*)(uint64_t, void, uint64_t))v702)(v440, v699, v621);
                URL.appending<A>(path:directoryHint:)(v619, v440, &type metadata for String, v637);
                v635(v440, v441);
                swift_bridgeObjectRelease(v1[15]);
                id v442 = [v633 defaultManager];
                URL._bridgeToObjectiveC()(v443);
                uint64_t v445 = v444;
                URL._bridgeToObjectiveC()(v446);
                uint64_t v448 = v447;
                v1[42] = 0LL;
                unsigned int v449 = [v442 copyItemAtURL:v445 toURL:v447 error:v617];

                uint64_t v450 = (void *)v1[42];
                if (v449)
                {
                  uint64_t v451 = v1[86];
                  uint64_t v452 = v1[83];
                  uint64_t v453 = v1[79];
                  uint64_t v454 = v1[78];
                  uint64_t v455 = v1[77];
                  uint64_t v456 = v1[74];
                  uint64_t v263 = v1[60];
                  id v457 = v450;
                  v652(v455, v456);
                  v652(v454, v456);
                  v652(v453, v456);
                  uint64_t v253 = v716;
                  (*(void (**)(uint64_t, uint64_t))(v716 + 8))(v451, v452);
                  uint64_t v249 = v730;
                }

                else
                {
                  uint64_t v751 = (os_log_s *)v1[181];
                  uint64_t v683 = (void (*)(uint64_t, uint64_t, uint64_t))v1[180];
                  uint64_t v458 = v1[179];
                  uint64_t v459 = v1[122];
                  uint64_t v460 = v1[120];
                  uint64_t v461 = v1[82];
                  uint64_t v462 = v1[77];
                  uint64_t v706 = v327;
                  uint64_t v463 = v1[74];
                  id v464 = v450;
                  uint64_t v465 = _convertNSErrorToError(_:)(v450);

                  swift_willThrow();
                  v683(v459, v458, v460);
                  v660(v461, v462, v463);
                  uint64_t v466 = swift_allocObject(&unk_100036960, v649, v655);
                  v706(v466 + v666, v461, v463);
                  uint64_t v467 = swift_allocObject(&unk_100036988, 32LL, 7LL);
                  *(void *)(v467 + 16) = sub_10002D65C;
                  *(void *)(v467 + 24) = v466;
                  uint64_t v468 = swift_allocObject(&unk_1000369B0, 24LL, 7LL);
                  *(void *)(v468 + 16) = v465;
                  uint64_t v684 = v465;
                  uint64_t v469 = swift_errorRetain(v465);
                  uint64_t v470 = (os_log_s *)Logger.logObject.getter(v469);
                  LOBYTE(v706) = static os_log_type_t.error.getter();
                  uint64_t v471 = swift_allocObject(&unk_1000369D8, 17LL, 7LL);
                  *(_BYTE *)(v471 + 16) = 32;
                  uint64_t v472 = swift_allocObject(&unk_100036A00, 17LL, 7LL);
                  *(_BYTE *)(v472 + 16) = 8;
                  uint64_t v473 = swift_allocObject(&unk_100036A28, 32LL, 7LL);
                  *(void *)(v473 + 16) = sub_10002E014;
                  *(void *)(v473 + 24) = v467;
                  uint64_t v474 = swift_allocObject(&unk_100036A50, 32LL, 7LL);
                  *(void *)(v474 + 16) = sub_10002E010;
                  *(void *)(v474 + 24) = v473;
                  uint64_t v475 = swift_allocObject(&unk_100036A78, 17LL, 7LL);
                  *(_BYTE *)(v475 + 16) = 64;
                  uint64_t v476 = swift_allocObject(&unk_100036AA0, 17LL, 7LL);
                  *(_BYTE *)(v476 + 16) = 8;
                  uint64_t v477 = swift_allocObject(&unk_100036AC8, 32LL, 7LL);
                  *(void *)(v477 + 16) = sub_10002E250;
                  *(void *)(v477 + 24) = v468;
                  uint64_t v478 = swift_allocObject(&unk_100036AF0, 32LL, 7LL);
                  *(void *)(v478 + 16) = sub_10002CAF8;
                  *(void *)(v478 + 24) = v477;
                  uint64_t v479 = v1;
                  uint64_t v480 = swift_allocObject(&unk_100036B18, 32LL, 7LL);
                  *(void *)(v480 + 16) = sub_10002E010;
                  *(void *)(v480 + 24) = v478;
                  uint64_t v481 = swift_allocObject(v751, 128LL, 7LL);
                  *(_OWORD *)(v481 + 16) = xmmword_10002FBC0;
                  *(void *)(v481 + 32) = sub_10002E258;
                  *(void *)(v481 + 40) = v471;
                  *(void *)(v481 + 48) = sub_10002E258;
                  *(void *)(v481 + 56) = v472;
                  *(void *)(v481 + 64) = sub_10002E01C;
                  *(void *)(v481 + 72) = v474;
                  *(void *)(v481 + 80) = sub_10002E258;
                  *(void *)(v481 + 88) = v475;
                  *(void *)(v481 + 96) = sub_10002E258;
                  *(void *)(v481 + 104) = v476;
                  *(void *)(v481 + 112) = sub_10002E020;
                  *(void *)(v481 + 120) = v480;
                  swift_retain(v471);
                  swift_retain(v472);
                  swift_retain(v474);
                  swift_retain(v475);
                  swift_retain(v476);
                  swift_retain(v480);
                  swift_bridgeObjectRelease(v481);
                  os_log_type_t v482 = v706;
                  uint64_t v752 = v470;
                  if (os_log_type_enabled(v470, (os_log_type_t)v706))
                  {
                    uint64_t v483 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
                    uint64_t v661 = (void *)swift_slowAlloc(8LL, -1LL);
                    uint64_t v707 = swift_slowAlloc(32LL, -1LL);
                    uint64_t v756 = v661;
                    double v757 = *(double *)&v707;
                    *(_WORD *)uint64_t v483 = 514;
                    v483[2] = *(_BYTE *)(v471 + 16);
                    swift_release(v471);
                    v483[3] = *(_BYTE *)(v472 + 16);
                    v755[0] = (uint64_t)(v483 + 4);
                    swift_release(v472);
                    sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v474 + 16));
                    swift_release(v474);
                    uint64_t v484 = v755[0];
                    *(_BYTE *)v755[0] = *(_BYTE *)(v475 + 16);
                    swift_release(v475);
                    *(_BYTE *)(v484 + 1) = *(_BYTE *)(v476 + 16);
                    v755[0] = v484 + 2;
                    swift_release(v476);
                    sub_100029334(v755, &v756, (uint64_t)&v757, *(uint64_t (**)(void))(v480 + 16));
                    uint64_t v485 = v479[122];
                    uint64_t v486 = v479[120];
                    uint64_t v675 = v479[86];
                    uint64_t v667 = v479[83];
                    uint64_t v487 = v479[79];
                    uint64_t v488 = v479[78];
                    uint64_t v489 = v479[77];
                    uint64_t v490 = v479[74];
                    swift_release(v480);
                    _os_log_impl((void *)&_mh_execute_header, v752, v482, "Failed at asset to: %s : %@", v483, 0x16u);
                    uint64_t v491 = sub_100007B74(&qword_1000388A0);
                    swift_arrayDestroy(v661, 1LL, v491);
                    swift_slowDealloc(v661, -1LL, -1LL);
                    swift_arrayDestroy(v707, 1LL, (char *)&type metadata for Any + 8);
                    swift_slowDealloc(v707, -1LL, -1LL);
                    swift_slowDealloc(v483, -1LL, -1LL);

                    swift_errorRelease(v684);
                    v730(v485, v486);
                    v652(v489, v490);
                    v652(v488, v490);
                    uint64_t v492 = v487;
                    uint64_t v249 = v730;
                    v652(v492, v490);
                    uint64_t v253 = v716;
                    (*(void (**)(uint64_t, uint64_t))(v716 + 8))(v675, v667);
                  }

                  else
                  {
                    uint64_t v493 = v479[122];
                    uint64_t v656 = v479[120];
                    uint64_t v708 = v479[86];
                    uint64_t v676 = v479[83];
                    uint64_t v668 = v479[79];
                    uint64_t v662 = v479[78];
                    uint64_t v494 = v479[77];
                    uint64_t v495 = v479[74];

                    swift_release(v480);
                    swift_release(v476);
                    swift_release(v475);
                    swift_release(v474);
                    swift_release(v472);
                    swift_release(v471);
                    swift_errorRelease(v684);
                    uint64_t v249 = v730;
                    v730(v493, v656);
                    v652(v494, v495);
                    v652(v662, v495);
                    v652(v668, v495);
                    uint64_t v253 = v716;
                    (*(void (**)(uint64_t, uint64_t))(v716 + 8))(v708, v676);
                  }

                  uint64_t v748 = 0LL;
                  uint64_t v263 = v479[60];
                  uint64_t v1 = v479;
                }
              }
            }

            else
            {
              uint64_t v365 = v1[123];
              uint64_t v366 = v1[79];
              id v367 = v313;
              uint64_t v368 = _convertNSErrorToError(_:)(v313);

              swift_willThrow();
              v659(v365, v314, v654);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v303 + 16))(v671, v366, v316);
              uint64_t v369 = *(unsigned __int8 *)(v303 + 80);
              uint64_t v370 = (v369 + 16) & ~v369;
              uint64_t v371 = swift_allocObject(&unk_100036690, v370 + v665, v369 | 7);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(v315 + 32))(v371 + v370, v671, v316);
              uint64_t v372 = swift_allocObject(&unk_1000366B8, 32LL, 7LL);
              *(void *)(v372 + 16) = sub_10002D65C;
              *(void *)(v372 + 24) = v371;
              uint64_t v373 = swift_allocObject(&unk_1000366E0, 24LL, 7LL);
              *(void *)(v373 + 16) = v368;
              uint64_t v731 = v368;
              uint64_t v374 = swift_errorRetain(v368);
              uint64_t v375 = (os_log_s *)Logger.logObject.getter(v374);
              os_log_type_t v749 = static os_log_type_t.error.getter();
              uint64_t v376 = swift_allocObject(&unk_100036708, 17LL, 7LL);
              *(_BYTE *)(v376 + 16) = 32;
              uint64_t v377 = swift_allocObject(&unk_100036730, 17LL, 7LL);
              *(_BYTE *)(v377 + 16) = 8;
              uint64_t v378 = swift_allocObject(&unk_100036758, 32LL, 7LL);
              *(void *)(v378 + 16) = sub_10002D668;
              *(void *)(v378 + 24) = v372;
              uint64_t v379 = swift_allocObject(&unk_100036780, 32LL, 7LL);
              *(void *)(v379 + 16) = sub_10002E010;
              *(void *)(v379 + 24) = v378;
              uint64_t v380 = swift_allocObject(&unk_1000367A8, 17LL, 7LL);
              *(_BYTE *)(v380 + 16) = 64;
              uint64_t v381 = v1;
              uint64_t v382 = swift_allocObject(&unk_1000367D0, 17LL, 7LL);
              *(_BYTE *)(v382 + 16) = 8;
              uint64_t v383 = swift_allocObject(&unk_1000367F8, 32LL, 7LL);
              *(void *)(v383 + 16) = sub_10002E250;
              *(void *)(v383 + 24) = v373;
              uint64_t v384 = swift_allocObject(&unk_100036820, 32LL, 7LL);
              *(void *)(v384 + 16) = sub_10002CAF8;
              *(void *)(v384 + 24) = v383;
              uint64_t v385 = swift_allocObject(&unk_100036848, 32LL, 7LL);
              *(void *)(v385 + 16) = sub_10002E010;
              *(void *)(v385 + 24) = v384;
              uint64_t v386 = swift_allocObject(v679, 128LL, 7LL);
              *(_OWORD *)(v386 + 16) = xmmword_10002FBC0;
              *(void *)(v386 + 32) = sub_10002E258;
              *(void *)(v386 + 40) = v376;
              *(void *)(v386 + 48) = sub_10002E258;
              *(void *)(v386 + 56) = v377;
              *(void *)(v386 + 64) = sub_10002E01C;
              *(void *)(v386 + 72) = v379;
              *(void *)(v386 + 80) = sub_10002E258;
              *(void *)(v386 + 88) = v380;
              *(void *)(v386 + 96) = sub_10002E258;
              *(void *)(v386 + 104) = v382;
              *(void *)(v386 + 112) = sub_10002E020;
              *(void *)(v386 + 120) = v385;
              swift_retain(v376);
              swift_retain(v377);
              swift_retain(v379);
              swift_retain(v380);
              swift_retain(v382);
              swift_retain(v385);
              swift_bridgeObjectRelease(v386);
              os_log_type_t v387 = v749;
              uint64_t v750 = v375;
              if (os_log_type_enabled(v375, v387))
              {
                uint64_t v388 = (uint8_t *)swift_slowAlloc(22LL, -1LL);
                uint64_t v680 = (void *)swift_slowAlloc(8LL, -1LL);
                uint64_t v703 = swift_slowAlloc(32LL, -1LL);
                uint64_t v756 = v680;
                double v757 = *(double *)&v703;
                *(_WORD *)uint64_t v388 = 514;
                v388[2] = *(_BYTE *)(v376 + 16);
                swift_release(v376);
                v388[3] = *(_BYTE *)(v377 + 16);
                v755[0] = (uint64_t)(v388 + 4);
                swift_release(v377);
                sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v379 + 16));
                swift_release(v379);
                uint64_t v389 = v755[0];
                *(_BYTE *)v755[0] = *(_BYTE *)(v380 + 16);
                swift_release(v380);
                *(_BYTE *)(v389 + 1) = *(_BYTE *)(v382 + 16);
                v755[0] = v389 + 2;
                swift_release(v382);
                sub_100029334(v755, &v756, (uint64_t)&v757, *(uint64_t (**)(void))(v385 + 16));
                uint64_t v390 = v381[123];
                uint64_t v391 = v381[120];
                uint64_t v672 = v381[86];
                uint64_t v392 = v381[83];
                uint64_t v393 = v381[79];
                uint64_t v394 = v381[74];
                swift_release(v385);
                _os_log_impl( (void *)&_mh_execute_header,  v750,  v387,  "Failed at creating taskAssetsURL: %s : %@",  v388,  0x16u);
                uint64_t v395 = sub_100007B74(&qword_1000388A0);
                swift_arrayDestroy(v680, 1LL, v395);
                swift_slowDealloc(v680, -1LL, -1LL);
                swift_arrayDestroy(v703, 1LL, (char *)&type metadata for Any + 8);
                swift_slowDealloc(v703, -1LL, -1LL);
                swift_slowDealloc(v388, -1LL, -1LL);

                swift_errorRelease(v731);
                uint64_t v396 = *(void (**)(uint64_t, uint64_t))(v623 + 8);
                v396(v390, v391);
                v652(v393, v394);
                uint64_t v253 = v716;
                (*(void (**)(uint64_t, uint64_t))(v716 + 8))(v672, v392);
              }

              else
              {
                uint64_t v424 = v381[123];
                uint64_t v425 = v381[120];
                uint64_t v705 = v381[86];
                uint64_t v682 = v381[83];
                uint64_t v426 = v381[79];
                uint64_t v674 = v381[74];

                swift_release(v385);
                swift_release(v382);
                swift_release(v380);
                swift_release(v379);
                swift_release(v377);
                swift_release(v376);
                swift_errorRelease(v731);
                uint64_t v427 = v425;
                uint64_t v396 = *(void (**)(uint64_t, uint64_t))(v623 + 8);
                v396(v424, v427);
                v652(v426, v674);
                uint64_t v253 = v716;
                (*(void (**)(uint64_t, uint64_t))(v716 + 8))(v705, v682);
              }

              uint64_t v748 = 0LL;
              uint64_t v263 = v381[60];
              uint64_t v1 = v381;
              uint64_t v249 = v396;
            }
          }

          else
          {
            uint64_t v344 = v1[181];
            uint64_t v346 = v1[60];
            uint64_t v345 = v1[61];
            ((void (*)(void, void, void))v1[180])(v1[140], v1[179], v1[120]);
            sub_1000087B8(v346, v345, type metadata accessor for TaskPayloadRecord);
            uint64_t v347 = swift_allocObject(&unk_1000365C8, v690, v687);
            uint64_t v348 = sub_10002DAD8(v345, v347 + v696, type metadata accessor for TaskPayloadRecord);
            uint64_t v349 = (os_log_s *)Logger.logObject.getter(v348);
            os_log_type_t v350 = static os_log_type_t.error.getter();
            uint64_t v351 = swift_allocObject(&unk_1000365F0, 17LL, 7LL);
            *(_BYTE *)(v351 + 16) = 32;
            uint64_t v352 = swift_allocObject(&unk_100036618, 17LL, 7LL);
            *(_BYTE *)(v352 + 16) = 8;
            uint64_t v353 = swift_allocObject(&unk_100036640, 32LL, 7LL);
            *(void *)(v353 + 16) = sub_10002D514;
            *(void *)(v353 + 24) = v347;
            uint64_t v354 = swift_allocObject(&unk_100036668, 32LL, 7LL);
            *(void *)(v354 + 16) = sub_10002E010;
            *(void *)(v354 + 24) = v353;
            uint64_t v355 = swift_allocObject(v344, 80LL, 7LL);
            *(_OWORD *)(v355 + 16) = xmmword_10002FBB0;
            *(void *)(v355 + 32) = sub_10002E258;
            *(void *)(v355 + 40) = v351;
            *(void *)(v355 + 48) = sub_10002E258;
            *(void *)(v355 + 56) = v352;
            *(void *)(v355 + 64) = sub_10002E01C;
            *(void *)(v355 + 72) = v354;
            swift_retain(v351);
            swift_retain(v352);
            swift_retain(v354);
            swift_bridgeObjectRelease(v355);
            if (os_log_type_enabled(v349, v350))
            {
              uint64_t v356 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
              uint64_t v357 = swift_slowAlloc(32LL, -1LL);
              uint64_t v756 = 0LL;
              double v757 = *(double *)&v357;
              *(_WORD *)uint64_t v356 = 258;
              v356[2] = *(_BYTE *)(v351 + 16);
              if (v748) {
                return swift_errorRelease(v748);
              }
              uint64_t v358 = v357;
              swift_release(v351);
              v356[3] = *(_BYTE *)(v352 + 16);
              v755[0] = (uint64_t)(v356 + 4);
              swift_release(v352);
              sub_100029290(v755, (uint64_t)&v756, (uint64_t *)&v757, *(uint64_t (**)(void))(v354 + 16));
              uint64_t v359 = v1[140];
              uint64_t v360 = v1[120];
              uint64_t v361 = v1[86];
              uint64_t v362 = v735[83];
              swift_release(v354);
              _os_log_impl( (void *)&_mh_execute_header,  v349,  v350,  "Task %s doesn't have a valid taskFolder. Skipping task.",  v356,  0xCu);
              swift_arrayDestroy(v358, 1LL, (char *)&type metadata for Any + 8);
              swift_slowDealloc(v358, -1LL, -1LL);
              swift_slowDealloc(v356, -1LL, -1LL);

              v730(v359, v360);
              uint64_t v253 = v716;
              uint64_t v363 = v361;
              uint64_t v249 = v730;
              uint64_t v364 = v362;
              uint64_t v1 = v735;
              (*(void (**)(uint64_t, uint64_t))(v716 + 8))(v363, v364);
            }

            else
            {
              uint64_t v258 = v1[140];
              uint64_t v259 = v1[120];
              uint64_t v260 = v1[86];
              uint64_t v261 = v1[83];

              swift_release(v354);
              swift_release(v352);
              swift_release(v351);
              uint64_t v249 = v730;
              v730(v258, v259);
              uint64_t v262 = v260;
              uint64_t v253 = v716;
              (*(void (**)(uint64_t, uint64_t))(v716 + 8))(v262, v261);
            }

            uint64_t v263 = v1[60];
          }

          uint64_t v264 = v745;
        }

        uint64_t v254 = v711;
        sub_1000087FC(v263, type metadata accessor for TaskPayloadRecord);
        uint64_t v257 = v738 + v721;
        uint64_t v252 = v264 - 1;
        if (!v252)
        {
          swift_bridgeObjectRelease(v615);
          goto LABEL_104;
        }
      }

      uint64_t v496 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v1[180];
      uint64_t v497 = v1[179];
      uint64_t v498 = v1[144];
      uint64_t v499 = v1[120];
      swift_bridgeObjectRelease(v1[224]);
      swift_bridgeObjectRelease(v615);
      swift_bridgeObjectRelease(v1[38]);
      uint64_t v500 = v496(v498, v497, v499);
      uint64_t v501 = (os_log_s *)Logger.logObject.getter(v500);
      os_log_type_t v502 = static os_log_type_t.info.getter();
      BOOL v503 = os_log_type_enabled(v501, v502);
      uint64_t v504 = v1[144];
      uint64_t v505 = v1[120];
      if (v503)
      {
        uint64_t v506 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        uint64_t v756 = 0LL;
        double v757 = 0.0;
        *(_WORD *)uint64_t v506 = 0;
        v755[0] = (uint64_t)(v506 + 2);
        sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v755, (uint64_t)&v756, (uint64_t)&v757);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        _os_log_impl( (void *)&_mh_execute_header,  v501,  v502,  "Task cancelled before while processing TaskPayloads.",  v506,  2u);
        swift_slowDealloc(v506, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      }

      v730(v504, v505);
      uint64_t v717 = v1[232];
      uint64_t v722 = v1[226];
      uint64_t v733 = v1[225];
      uint64_t v529 = (os_log_s *)v1[210];
      uint64_t v530 = (void *)v1[193];
      uint64_t v531 = (void *)v1[192];
      uint64_t v532 = (void *)v1[191];
      uint64_t v533 = (void *)v1[190];
      uint64_t v534 = (void *)v1[189];
      uint64_t v535 = (void *)v1[188];
      uint64_t v536 = v1;
      uint64_t v537 = v1[187];
      uint64_t v538 = v536[186];
      uint64_t v746 = v536[119];
      uint64_t v753 = v529;
      uint64_t v725 = v536[118];
      uint64_t v739 = v536[117];
      uint64_t v712 = v536[60];
      id v539 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v564 = MLHostResult.init(status:policy:)(1LL, 1LL);

      swift_release(v537);
      sub_1000087FC(v712, type metadata accessor for TaskPayloadRecord);
    }

    else
    {
LABEL_104:
      uint64_t v507 = (void (*)(uint64_t, uint64_t))v1[185];
      uint64_t v508 = v1[115];
      uint64_t v509 = v1[109];
      swift_bridgeObjectRelease(v1[224]);
      uint64_t v510 = swift_bridgeObjectRelease(v1[38]);
      uint64_t v511 = static Date.now.getter(v510);
      double v512 = Date.timeIntervalSinceReferenceDate.getter(v511);
      v507(v508, v509);
      sub_10002DFC0(0LL, &qword_100038828, &OBJC_CLASS___NSUserDefaults_ptr);
      id v513 = sub_100025B00(0xD000000000000010LL, 0x8000000100030070LL);
      if (v513)
      {
        uint64_t v514 = v513;
        uint64_t v732 = v249;
        uint64_t v515 = v1[181];
        ((void (*)(void, void, void))v1[180])(v1[138], v1[179], v1[120]);
        uint64_t v516 = swift_allocObject(&unk_100036500, 24LL, 7LL);
        *(double *)(v516 + 16) = v512;
        uint64_t v517 = (os_log_s *)Logger.logObject.getter(v516);
        os_log_type_t v518 = static os_log_type_t.info.getter();
        uint64_t v519 = swift_allocObject(&unk_100036528, 17LL, 7LL);
        *(_BYTE *)(v519 + 16) = 0;
        uint64_t v520 = swift_allocObject(&unk_100036550, 17LL, 7LL);
        *(_BYTE *)(v520 + 16) = 8;
        uint64_t v521 = v1;
        uint64_t v522 = swift_allocObject(&unk_100036578, 32LL, 7LL);
        *(void *)(v522 + 16) = sub_10002E02C;
        *(void *)(v522 + 24) = v516;
        uint64_t v523 = swift_allocObject(&unk_1000365A0, 32LL, 7LL);
        *(void *)(v523 + 16) = sub_100029448;
        *(void *)(v523 + 24) = v522;
        uint64_t v524 = swift_allocObject(v515, 80LL, 7LL);
        *(_OWORD *)(v524 + 16) = xmmword_10002FBB0;
        *(void *)(v524 + 32) = sub_10002E258;
        *(void *)(v524 + 40) = v519;
        *(void *)(v524 + 48) = sub_10002E258;
        *(void *)(v524 + 56) = v520;
        *(void *)(v524 + 64) = sub_10002D570;
        *(void *)(v524 + 72) = v523;
        swift_retain(v519);
        swift_retain(v520);
        swift_retain(v523);
        swift_bridgeObjectRelease(v524);
        if (os_log_type_enabled(v517, v518))
        {
          uint64_t v525 = swift_slowAlloc(12LL, -1LL);
          *(_WORD *)uint64_t v525 = 256;
          *(_BYTE *)(v525 + 2) = *(_BYTE *)(v519 + 16);
          if (v748) {
            return swift_errorRelease(v748);
          }
          uint64_t v540 = (uint8_t *)v525;
          swift_release(v519);
          v540[3] = *(_BYTE *)(v520 + 16);
          uint64_t v541 = swift_release(v520);
          double v757 = (*(double (**)(uint64_t))(v523 + 16))(v541);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v757, &v758);
          uint64_t v1 = v735;
          uint64_t v542 = v735[138];
          uint64_t v543 = v735[120];
          swift_release(v523);
          _os_log_impl((void *)&_mh_execute_header, v517, v518, "Marking lastSuccessTimestamp: %f", v540, 0xCu);
          swift_slowDealloc(v540, -1LL, -1LL);

          v732(v542, v543);
        }

        else
        {
          uint64_t v527 = v521[138];
          uint64_t v528 = v521[120];
          swift_release(v519);
          swift_release(v520);
          swift_release(v523);

          v732(v527, v528);
          uint64_t v1 = v521;
        }

        Class isa = Double._bridgeToObjectiveC()().super.super.isa;
        NSString v545 = String._bridgeToObjectiveC()();
        [v514 setValue:isa forKey:v545];
      }

      uint64_t v717 = v1[232];
      uint64_t v722 = v1[226];
      uint64_t v733 = v1[225];
      uint64_t v546 = (os_log_s *)v1[210];
      uint64_t v547 = (void *)v1[193];
      uint64_t v548 = (void *)v1[192];
      uint64_t v549 = (void *)v1[191];
      id v550 = (void *)v1[190];
      uint64_t v551 = (void *)v1[189];
      uint64_t v552 = (void *)v1[188];
      uint64_t v536 = v1;
      uint64_t v553 = v1[187];
      uint64_t v538 = v536[186];
      uint64_t v746 = v536[119];
      uint64_t v753 = v546;
      uint64_t v725 = v536[118];
      uint64_t v739 = v536[117];
      id v554 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v564 = MLHostResult.init(status:policy:)(2LL, 1LL);

      swift_release(v553);
    }

    swift_release(v717);
    swift_release(v722);
    swift_release(v733);
    swift_release(v753);
    sub_100025B68(v538);
    (*(void (**)(uint64_t, uint64_t))(v725 + 8))(v746, v739);
    swift_release(v538);
    uint64_t v555 = v536[177];
    uint64_t v556 = v536[176];
    uint64_t v557 = v536[175];
    uint64_t v558 = v536[174];
    uint64_t v559 = v536[173];
    uint64_t v560 = v536[172];
    uint64_t v561 = v536[171];
    uint64_t v562 = v536[170];
    uint64_t v563 = v536[169];
    uint64_t v565 = v536[168];
    uint64_t v566 = v536[167];
    uint64_t v567 = v536[166];
    uint64_t v568 = v536[165];
    uint64_t v569 = v536[164];
    uint64_t v570 = v536[163];
    uint64_t v571 = v536[162];
    uint64_t v572 = v536[161];
    uint64_t v573 = v536[160];
    uint64_t v574 = v536[159];
    uint64_t v575 = v536[158];
    uint64_t v576 = v536[157];
    uint64_t v577 = v536[156];
    uint64_t v578 = v536[155];
    uint64_t v579 = v536[154];
    uint64_t v580 = v536[153];
    uint64_t v581 = v536[152];
    uint64_t v582 = v536[151];
    uint64_t v583 = v536[150];
    uint64_t v584 = v536[149];
    uint64_t v585 = v536[148];
    uint64_t v586 = v536[147];
    uint64_t v587 = v536[146];
    uint64_t v588 = v536[145];
    uint64_t v589 = v536[144];
    uint64_t v590 = v536[143];
    uint64_t v591 = v536[142];
    uint64_t v592 = v536[141];
    uint64_t v593 = v536[140];
    uint64_t v594 = v536[139];
    uint64_t v595 = v536[138];
    uint64_t v596 = v536[137];
    uint64_t v597 = v536[136];
    uint64_t v598 = v536[135];
    uint64_t v599 = v536[134];
    uint64_t v600 = v536[133];
    uint64_t v601 = v536[132];
    uint64_t v602 = v536[131];
    uint64_t v603 = v536[130];
    uint64_t v604 = v536[129];
    uint64_t v605 = v536[128];
    uint64_t v606 = v536[127];
    uint64_t v607 = v536[126];
    uint64_t v608 = v536[125];
    uint64_t v609 = v536[124];
    uint64_t v610 = v536[123];
    uint64_t v611 = v536[122];
    uint64_t v612 = v536[119];
    uint64_t v613 = v536[116];
    uint64_t v614 = v536[115];
    uint64_t v616 = v536[114];
    uint64_t v618 = v536[113];
    uint64_t v620 = v536[112];
    uint64_t v622 = v536[108];
    uint64_t v624 = v536[105];
    uint64_t v626 = v536[104];
    uint64_t v627 = v536[103];
    uint64_t v629 = v536[99];
    uint64_t v631 = v536[98];
    uint64_t v632 = v536[97];
    id v634 = (id)v536[96];
    uint64_t v636 = v536[92];
    uint64_t v638 = v536[91];
    uint64_t v640 = v536[90];
    uint64_t v643 = v536[89];
    uint64_t v647 = v536[88];
    uint64_t v650 = v536[87];
    uint64_t v653 = v536[86];
    uint64_t v657 = v536[82];
    uint64_t v663 = v536[81];
    uint64_t v669 = v536[80];
    uint64_t v677 = v536[79];
    uint64_t v685 = v536[78];
    uint64_t v688 = v536[77];
    uint64_t v691 = v536[73];
    uint64_t v697 = v536[72];
    uint64_t v700 = v536[69];
    uint64_t v709 = v536[68];
    uint64_t v713 = v536[67];
    uint64_t v718 = v536[63];
    uint64_t v723 = v536[62];
    uint64_t v726 = v536[61];
    uint64_t v734 = v536[60];
    uint64_t v740 = v536[56];
    uint64_t v747 = v536[55];
    uint64_t v754 = (os_log_s *)v536[54];
    swift_task_dealloc(v536[178]);
    swift_task_dealloc(v555);
    swift_task_dealloc(v556);
    swift_task_dealloc(v557);
    swift_task_dealloc(v558);
    swift_task_dealloc(v559);
    swift_task_dealloc(v560);
    swift_task_dealloc(v561);
    swift_task_dealloc(v562);
    swift_task_dealloc(v563);
    swift_task_dealloc(v565);
    swift_task_dealloc(v566);
    swift_task_dealloc(v567);
    swift_task_dealloc(v568);
    swift_task_dealloc(v569);
    swift_task_dealloc(v570);
    swift_task_dealloc(v571);
    swift_task_dealloc(v572);
    swift_task_dealloc(v573);
    swift_task_dealloc(v574);
    swift_task_dealloc(v575);
    swift_task_dealloc(v576);
    swift_task_dealloc(v577);
    swift_task_dealloc(v578);
    swift_task_dealloc(v579);
    swift_task_dealloc(v580);
    swift_task_dealloc(v581);
    swift_task_dealloc(v582);
    swift_task_dealloc(v583);
    swift_task_dealloc(v584);
    swift_task_dealloc(v585);
    swift_task_dealloc(v586);
    swift_task_dealloc(v587);
    swift_task_dealloc(v588);
    swift_task_dealloc(v589);
    swift_task_dealloc(v590);
    swift_task_dealloc(v591);
    swift_task_dealloc(v592);
    swift_task_dealloc(v593);
    swift_task_dealloc(v594);
    swift_task_dealloc(v595);
    swift_task_dealloc(v596);
    swift_task_dealloc(v597);
    swift_task_dealloc(v598);
    swift_task_dealloc(v599);
    swift_task_dealloc(v600);
    swift_task_dealloc(v601);
    swift_task_dealloc(v602);
    swift_task_dealloc(v603);
    swift_task_dealloc(v604);
    swift_task_dealloc(v605);
    swift_task_dealloc(v606);
    swift_task_dealloc(v607);
    swift_task_dealloc(v608);
    swift_task_dealloc(v609);
    swift_task_dealloc(v610);
    swift_task_dealloc(v611);
    swift_task_dealloc(v612);
    swift_task_dealloc(v613);
    swift_task_dealloc(v614);
    swift_task_dealloc(v616);
    swift_task_dealloc(v618);
    swift_task_dealloc(v620);
    swift_task_dealloc(v622);
    swift_task_dealloc(v624);
    swift_task_dealloc(v626);
    swift_task_dealloc(v627);
    swift_task_dealloc(v629);
    swift_task_dealloc(v631);
    swift_task_dealloc(v632);
    swift_task_dealloc(v634);
    swift_task_dealloc(v636);
    swift_task_dealloc(v638);
    swift_task_dealloc(v640);
    swift_task_dealloc(v643);
    swift_task_dealloc(v647);
    swift_task_dealloc(v650);
    swift_task_dealloc(v653);
    swift_task_dealloc(v657);
    swift_task_dealloc(v663);
    swift_task_dealloc(v669);
    swift_task_dealloc(v677);
    swift_task_dealloc(v685);
    swift_task_dealloc(v688);
    swift_task_dealloc(v691);
    swift_task_dealloc(v697);
    swift_task_dealloc(v700);
    swift_task_dealloc(v709);
    swift_task_dealloc(v713);
    swift_task_dealloc(v718);
    swift_task_dealloc(v723);
    swift_task_dealloc(v726);
    swift_task_dealloc(v734);
    swift_task_dealloc(v740);
    swift_task_dealloc(v747);
    swift_task_dealloc(v754);
    return ((uint64_t (*)(uint64_t))v536[1])(v564);
  }

uint64_t sub_100020F0C()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v2 = *(void *)(v0 + 1432);
  uint64_t v3 = *(void *)(v0 + 1096);
  uint64_t v4 = *(void *)(v0 + 960);
  swift_bridgeObjectRelease(*(void *)(v0 + 304));
  uint64_t v5 = v1(v3, v2, v4);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.error.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
  uint64_t v10 = *(void *)(v0 + 1096);
  uint64_t v11 = *(void *)(v0 + 960);
  if (v8)
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    uint64_t v124 = 0LL;
    v125[0] = 0LL;
    *(_WORD *)uint64_t v12 = 0;
    uint64_t v123 = v12 + 2;
    sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&v123, (uint64_t)&v124, (uint64_t)v125);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Invalid remote reply when requesting active tasks.", v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  v9(v10, v11);
  os_log_type_t v13 = *(void **)(v0 + 1544);
  uint64_t v14 = *(void **)(v0 + 1536);
  uint64_t v15 = *(void **)(v0 + 1528);
  uint64_t v16 = *(void **)(v0 + 1520);
  uint64_t v17 = *(void **)(v0 + 1512);
  uint64_t v18 = *(void **)(v0 + 1504);
  uint64_t v19 = *(void *)(v0 + 1496);
  uint64_t v20 = *(void *)(v0 + 1488);
  uint64_t v119 = *(void *)(v0 + 952);
  uint64_t v121 = *(void *)(v0 + 1680);
  uint64_t v115 = *(void *)(v0 + 944);
  uint64_t v117 = *(void *)(v0 + 936);
  id v21 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v32 = MLHostResult.init(status:policy:)(0LL, 1LL);

  swift_release(v19);
  swift_release(v121);
  sub_100025B68(v20);
  (*(void (**)(uint64_t, uint64_t))(v115 + 8))(v119, v117);
  swift_release(v20);
  uint64_t v22 = *(void *)(v0 + 1416);
  uint64_t v23 = *(void *)(v0 + 1408);
  uint64_t v24 = *(void *)(v0 + 1400);
  uint64_t v25 = *(void *)(v0 + 1392);
  uint64_t v26 = *(void *)(v0 + 1384);
  uint64_t v27 = *(void *)(v0 + 1376);
  uint64_t v28 = *(void *)(v0 + 1368);
  uint64_t v29 = *(void *)(v0 + 1360);
  uint64_t v30 = *(void *)(v0 + 1352);
  uint64_t v33 = *(void *)(v0 + 1344);
  uint64_t v34 = *(void *)(v0 + 1336);
  uint64_t v35 = *(void *)(v0 + 1328);
  uint64_t v36 = *(void *)(v0 + 1320);
  uint64_t v37 = *(void *)(v0 + 1312);
  uint64_t v38 = *(void *)(v0 + 1304);
  uint64_t v39 = *(void *)(v0 + 1296);
  uint64_t v40 = *(void *)(v0 + 1288);
  uint64_t v41 = *(void *)(v0 + 1280);
  uint64_t v42 = *(void *)(v0 + 1272);
  uint64_t v43 = *(void *)(v0 + 1264);
  uint64_t v44 = *(void *)(v0 + 1256);
  uint64_t v45 = *(void *)(v0 + 1248);
  uint64_t v46 = *(void *)(v0 + 1240);
  uint64_t v47 = *(void *)(v0 + 1232);
  uint64_t v48 = *(void *)(v0 + 1224);
  uint64_t v49 = *(void *)(v0 + 1216);
  uint64_t v50 = *(void *)(v0 + 1208);
  uint64_t v51 = *(void *)(v0 + 1200);
  uint64_t v52 = *(void *)(v0 + 1192);
  uint64_t v53 = *(void *)(v0 + 1184);
  uint64_t v54 = *(void *)(v0 + 1176);
  uint64_t v55 = *(void *)(v0 + 1168);
  uint64_t v56 = *(void *)(v0 + 1160);
  uint64_t v57 = *(void *)(v0 + 1152);
  uint64_t v58 = *(void *)(v0 + 1144);
  uint64_t v59 = *(void *)(v0 + 1136);
  uint64_t v60 = *(void *)(v0 + 1128);
  uint64_t v61 = *(void *)(v0 + 1120);
  uint64_t v62 = *(void *)(v0 + 1112);
  uint64_t v63 = *(void *)(v0 + 1104);
  uint64_t v64 = *(void *)(v0 + 1096);
  uint64_t v65 = *(void *)(v0 + 1088);
  uint64_t v66 = *(void *)(v0 + 1080);
  uint64_t v67 = *(void *)(v0 + 1072);
  uint64_t v68 = *(void *)(v0 + 1064);
  uint64_t v69 = *(void *)(v0 + 1056);
  uint64_t v70 = *(void *)(v0 + 1048);
  uint64_t v71 = *(void *)(v0 + 1040);
  uint64_t v72 = *(void *)(v0 + 1032);
  uint64_t v73 = *(void *)(v0 + 1024);
  uint64_t v74 = *(void *)(v0 + 1016);
  uint64_t v75 = *(void *)(v0 + 1008);
  uint64_t v76 = *(void *)(v0 + 1000);
  uint64_t v77 = *(void *)(v0 + 992);
  uint64_t v78 = *(void *)(v0 + 984);
  uint64_t v79 = *(void *)(v0 + 976);
  uint64_t v80 = *(void *)(v0 + 952);
  uint64_t v81 = *(void *)(v0 + 928);
  uint64_t v82 = *(void *)(v0 + 920);
  uint64_t v83 = *(void *)(v0 + 912);
  uint64_t v84 = *(void *)(v0 + 904);
  uint64_t v85 = *(void *)(v0 + 896);
  uint64_t v86 = *(void *)(v0 + 864);
  uint64_t v87 = *(void *)(v0 + 840);
  uint64_t v88 = *(void *)(v0 + 832);
  uint64_t v89 = *(void *)(v0 + 824);
  uint64_t v90 = *(void *)(v0 + 792);
  uint64_t v91 = *(void *)(v0 + 784);
  uint64_t v92 = *(void *)(v0 + 776);
  uint64_t v93 = *(void *)(v0 + 768);
  uint64_t v94 = *(void *)(v0 + 736);
  uint64_t v95 = *(void *)(v0 + 728);
  uint64_t v96 = *(void *)(v0 + 720);
  uint64_t v97 = *(void *)(v0 + 712);
  uint64_t v98 = *(void *)(v0 + 704);
  uint64_t v99 = *(void *)(v0 + 696);
  uint64_t v100 = *(void *)(v0 + 688);
  uint64_t v101 = *(void *)(v0 + 656);
  uint64_t v102 = *(void *)(v0 + 648);
  uint64_t v103 = *(void *)(v0 + 640);
  uint64_t v104 = *(void *)(v0 + 632);
  uint64_t v105 = *(void *)(v0 + 624);
  uint64_t v106 = *(void *)(v0 + 616);
  uint64_t v107 = *(void *)(v0 + 584);
  uint64_t v108 = *(void *)(v0 + 576);
  uint64_t v109 = *(void *)(v0 + 552);
  uint64_t v110 = *(void *)(v0 + 544);
  uint64_t v111 = *(void *)(v0 + 536);
  uint64_t v112 = *(void *)(v0 + 504);
  uint64_t v113 = *(void *)(v0 + 496);
  uint64_t v114 = *(void *)(v0 + 488);
  uint64_t v116 = *(void *)(v0 + 480);
  uint64_t v118 = *(void *)(v0 + 448);
  uint64_t v120 = *(void *)(v0 + 440);
  uint64_t v122 = *(void *)(v0 + 432);
  swift_task_dealloc(*(void *)(v0 + 1424));
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  swift_task_dealloc(v55);
  swift_task_dealloc(v56);
  swift_task_dealloc(v57);
  swift_task_dealloc(v58);
  swift_task_dealloc(v59);
  swift_task_dealloc(v60);
  swift_task_dealloc(v61);
  swift_task_dealloc(v62);
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  swift_task_dealloc(v65);
  swift_task_dealloc(v66);
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  swift_task_dealloc(v69);
  swift_task_dealloc(v70);
  swift_task_dealloc(v71);
  swift_task_dealloc(v72);
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  swift_task_dealloc(v77);
  swift_task_dealloc(v78);
  swift_task_dealloc(v79);
  swift_task_dealloc(v80);
  swift_task_dealloc(v81);
  swift_task_dealloc(v82);
  swift_task_dealloc(v83);
  swift_task_dealloc(v84);
  swift_task_dealloc(v85);
  swift_task_dealloc(v86);
  swift_task_dealloc(v87);
  swift_task_dealloc(v88);
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v91);
  swift_task_dealloc(v92);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  swift_task_dealloc(v97);
  swift_task_dealloc(v98);
  swift_task_dealloc(v99);
  swift_task_dealloc(v100);
  swift_task_dealloc(v101);
  swift_task_dealloc(v102);
  swift_task_dealloc(v103);
  swift_task_dealloc(v104);
  swift_task_dealloc(v105);
  swift_task_dealloc(v106);
  swift_task_dealloc(v107);
  swift_task_dealloc(v108);
  swift_task_dealloc(v109);
  swift_task_dealloc(v110);
  swift_task_dealloc(v111);
  swift_task_dealloc(v112);
  swift_task_dealloc(v113);
  swift_task_dealloc(v114);
  swift_task_dealloc(v116);
  swift_task_dealloc(v118);
  swift_task_dealloc(v120);
  swift_task_dealloc(v122);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v32);
}

uint64_t sub_100021654()
{
  uint64_t v1 = (*(uint64_t (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1088),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
  uint64_t v2 = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v3 = static os_log_type_t.error.getter();
  BOOL v4 = os_log_type_enabled(v2, v3);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
  uint64_t v6 = *(void *)(v0 + 1088);
  uint64_t v7 = *(void *)(v0 + 960);
  if (v4)
  {
    BOOL v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    uint64_t v119 = 0LL;
    v120[0] = 0LL;
    *(_WORD *)BOOL v8 = 0;
    uint64_t v118 = v8 + 2;
    sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&v118, (uint64_t)&v119, (uint64_t)v120);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Failed at fetching available extentions from mlhostd.", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  v5(v6, v7);
  uint64_t v9 = *(void **)(v0 + 1544);
  uint64_t v10 = *(void **)(v0 + 1536);
  uint64_t v11 = *(void **)(v0 + 1528);
  uint64_t v12 = *(void **)(v0 + 1520);
  os_log_type_t v13 = *(void **)(v0 + 1512);
  uint64_t v14 = *(void **)(v0 + 1504);
  uint64_t v15 = *(void *)(v0 + 1496);
  uint64_t v16 = *(void *)(v0 + 1488);
  uint64_t v112 = *(void *)(v0 + 944);
  uint64_t v114 = *(void *)(v0 + 936);
  uint64_t v116 = *(void *)(v0 + 952);
  id v17 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v28 = MLHostResult.init(status:policy:)(0LL, 1LL);

  swift_release(v15);
  sub_100025B68(v16);
  (*(void (**)(uint64_t, uint64_t))(v112 + 8))(v116, v114);
  swift_release(v16);
  uint64_t v18 = *(void *)(v0 + 1416);
  uint64_t v19 = *(void *)(v0 + 1408);
  uint64_t v20 = *(void *)(v0 + 1400);
  uint64_t v21 = *(void *)(v0 + 1392);
  uint64_t v22 = *(void *)(v0 + 1384);
  uint64_t v23 = *(void *)(v0 + 1376);
  uint64_t v24 = *(void *)(v0 + 1368);
  uint64_t v25 = *(void *)(v0 + 1360);
  uint64_t v26 = *(void *)(v0 + 1352);
  uint64_t v29 = *(void *)(v0 + 1344);
  uint64_t v30 = *(void *)(v0 + 1336);
  uint64_t v31 = *(void *)(v0 + 1328);
  uint64_t v32 = *(void *)(v0 + 1320);
  uint64_t v33 = *(void *)(v0 + 1312);
  uint64_t v34 = *(void *)(v0 + 1304);
  uint64_t v35 = *(void *)(v0 + 1296);
  uint64_t v36 = *(void *)(v0 + 1288);
  uint64_t v37 = *(void *)(v0 + 1280);
  uint64_t v38 = *(void *)(v0 + 1272);
  uint64_t v39 = *(void *)(v0 + 1264);
  uint64_t v40 = *(void *)(v0 + 1256);
  uint64_t v41 = *(void *)(v0 + 1248);
  uint64_t v42 = *(void *)(v0 + 1240);
  uint64_t v43 = *(void *)(v0 + 1232);
  uint64_t v44 = *(void *)(v0 + 1224);
  uint64_t v45 = *(void *)(v0 + 1216);
  uint64_t v46 = *(void *)(v0 + 1208);
  uint64_t v47 = *(void *)(v0 + 1200);
  uint64_t v48 = *(void *)(v0 + 1192);
  uint64_t v49 = *(void *)(v0 + 1184);
  uint64_t v50 = *(void *)(v0 + 1176);
  uint64_t v51 = *(void *)(v0 + 1168);
  uint64_t v52 = *(void *)(v0 + 1160);
  uint64_t v53 = *(void *)(v0 + 1152);
  uint64_t v54 = *(void *)(v0 + 1144);
  uint64_t v55 = *(void *)(v0 + 1136);
  uint64_t v56 = *(void *)(v0 + 1128);
  uint64_t v57 = *(void *)(v0 + 1120);
  uint64_t v58 = *(void *)(v0 + 1112);
  uint64_t v59 = *(void *)(v0 + 1104);
  uint64_t v60 = *(void *)(v0 + 1096);
  uint64_t v61 = *(void *)(v0 + 1088);
  uint64_t v62 = *(void *)(v0 + 1080);
  uint64_t v63 = *(void *)(v0 + 1072);
  uint64_t v64 = *(void *)(v0 + 1064);
  uint64_t v65 = *(void *)(v0 + 1056);
  uint64_t v66 = *(void *)(v0 + 1048);
  uint64_t v67 = *(void *)(v0 + 1040);
  uint64_t v68 = *(void *)(v0 + 1032);
  uint64_t v69 = *(void *)(v0 + 1024);
  uint64_t v70 = *(void *)(v0 + 1016);
  uint64_t v71 = *(void *)(v0 + 1008);
  uint64_t v72 = *(void *)(v0 + 1000);
  uint64_t v73 = *(void *)(v0 + 992);
  uint64_t v74 = *(void *)(v0 + 984);
  uint64_t v75 = *(void *)(v0 + 976);
  uint64_t v76 = *(void *)(v0 + 952);
  uint64_t v77 = *(void *)(v0 + 928);
  uint64_t v78 = *(void *)(v0 + 920);
  uint64_t v79 = *(void *)(v0 + 912);
  uint64_t v80 = *(void *)(v0 + 904);
  uint64_t v81 = *(void *)(v0 + 896);
  uint64_t v82 = *(void *)(v0 + 864);
  uint64_t v83 = *(void *)(v0 + 840);
  uint64_t v84 = *(void *)(v0 + 832);
  uint64_t v85 = *(void *)(v0 + 824);
  uint64_t v86 = *(void *)(v0 + 792);
  uint64_t v87 = *(void *)(v0 + 784);
  uint64_t v88 = *(void *)(v0 + 776);
  uint64_t v89 = *(void *)(v0 + 768);
  uint64_t v90 = *(void *)(v0 + 736);
  uint64_t v91 = *(void *)(v0 + 728);
  uint64_t v92 = *(void *)(v0 + 720);
  uint64_t v93 = *(void *)(v0 + 712);
  uint64_t v94 = *(void *)(v0 + 704);
  uint64_t v95 = *(void *)(v0 + 696);
  uint64_t v96 = *(void *)(v0 + 688);
  uint64_t v97 = *(void *)(v0 + 656);
  uint64_t v98 = *(void *)(v0 + 648);
  uint64_t v99 = *(void *)(v0 + 640);
  uint64_t v100 = *(void *)(v0 + 632);
  uint64_t v101 = *(void *)(v0 + 624);
  uint64_t v102 = *(void *)(v0 + 616);
  uint64_t v103 = *(void *)(v0 + 584);
  uint64_t v104 = *(void *)(v0 + 576);
  uint64_t v105 = *(void *)(v0 + 552);
  uint64_t v106 = *(void *)(v0 + 544);
  uint64_t v107 = *(void *)(v0 + 536);
  uint64_t v108 = *(void *)(v0 + 504);
  uint64_t v109 = *(void *)(v0 + 496);
  uint64_t v110 = *(void *)(v0 + 488);
  uint64_t v111 = *(void *)(v0 + 480);
  uint64_t v113 = *(void *)(v0 + 448);
  uint64_t v115 = *(void *)(v0 + 440);
  uint64_t v117 = *(void *)(v0 + 432);
  swift_task_dealloc(*(void *)(v0 + 1424));
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  swift_task_dealloc(v55);
  swift_task_dealloc(v56);
  swift_task_dealloc(v57);
  swift_task_dealloc(v58);
  swift_task_dealloc(v59);
  swift_task_dealloc(v60);
  swift_task_dealloc(v61);
  swift_task_dealloc(v62);
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  swift_task_dealloc(v65);
  swift_task_dealloc(v66);
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  swift_task_dealloc(v69);
  swift_task_dealloc(v70);
  swift_task_dealloc(v71);
  swift_task_dealloc(v72);
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  swift_task_dealloc(v77);
  swift_task_dealloc(v78);
  swift_task_dealloc(v79);
  swift_task_dealloc(v80);
  swift_task_dealloc(v81);
  swift_task_dealloc(v82);
  swift_task_dealloc(v83);
  swift_task_dealloc(v84);
  swift_task_dealloc(v85);
  swift_task_dealloc(v86);
  swift_task_dealloc(v87);
  swift_task_dealloc(v88);
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v91);
  swift_task_dealloc(v92);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  swift_task_dealloc(v97);
  swift_task_dealloc(v98);
  swift_task_dealloc(v99);
  swift_task_dealloc(v100);
  swift_task_dealloc(v101);
  swift_task_dealloc(v102);
  swift_task_dealloc(v103);
  swift_task_dealloc(v104);
  swift_task_dealloc(v105);
  swift_task_dealloc(v106);
  swift_task_dealloc(v107);
  swift_task_dealloc(v108);
  swift_task_dealloc(v109);
  swift_task_dealloc(v110);
  swift_task_dealloc(v111);
  swift_task_dealloc(v113);
  swift_task_dealloc(v115);
  swift_task_dealloc(v117);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v28);
}

uint64_t sub_100021D7C()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v2 = *(void *)(v0 + 1432);
  uint64_t v3 = *(void *)(v0 + 1080);
  uint64_t v4 = *(void *)(v0 + 960);
  uint64_t v5 = *(void *)(v0 + 928);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)(v0 + 944) + 56LL))( v5,  1LL,  1LL,  *(void *)(v0 + 936));
  sub_100008880(v5, &qword_100038818);
  uint64_t v6 = v1(v3, v2, v4);
  uint64_t v7 = (os_log_s *)Logger.logObject.getter(v6);
  os_log_type_t v8 = static os_log_type_t.error.getter();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
  uint64_t v11 = *(void *)(v0 + 1080);
  uint64_t v12 = *(void *)(v0 + 960);
  if (v9)
  {
    os_log_type_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    uint64_t v113 = 0LL;
    v114[0] = 0LL;
    *(_WORD *)os_log_type_t v13 = 0;
    uint64_t v112 = v13 + 2;
    sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)&v112, (uint64_t)&v113, (uint64_t)v114);
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Failed at querying mlhostd.", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  }

  v10(v11, v12);
  id v14 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
  uint64_t v25 = MLHostResult.init(status:policy:)(0LL, 1LL);
  uint64_t v15 = *(void *)(v0 + 1416);
  uint64_t v16 = *(void *)(v0 + 1408);
  uint64_t v17 = *(void *)(v0 + 1400);
  uint64_t v18 = *(void *)(v0 + 1392);
  uint64_t v19 = *(void *)(v0 + 1384);
  uint64_t v20 = *(void *)(v0 + 1376);
  uint64_t v21 = *(void *)(v0 + 1368);
  uint64_t v22 = *(void *)(v0 + 1360);
  uint64_t v23 = *(void *)(v0 + 1352);
  uint64_t v26 = *(void *)(v0 + 1344);
  uint64_t v27 = *(void *)(v0 + 1336);
  uint64_t v28 = *(void *)(v0 + 1328);
  uint64_t v29 = *(void *)(v0 + 1320);
  uint64_t v30 = *(void *)(v0 + 1312);
  uint64_t v31 = *(void *)(v0 + 1304);
  uint64_t v32 = *(void *)(v0 + 1296);
  uint64_t v33 = *(void *)(v0 + 1288);
  uint64_t v34 = *(void *)(v0 + 1280);
  uint64_t v35 = *(void *)(v0 + 1272);
  uint64_t v36 = *(void *)(v0 + 1264);
  uint64_t v37 = *(void *)(v0 + 1256);
  uint64_t v38 = *(void *)(v0 + 1248);
  uint64_t v39 = *(void *)(v0 + 1240);
  uint64_t v40 = *(void *)(v0 + 1232);
  uint64_t v41 = *(void *)(v0 + 1224);
  uint64_t v42 = *(void *)(v0 + 1216);
  uint64_t v43 = *(void *)(v0 + 1208);
  uint64_t v44 = *(void *)(v0 + 1200);
  uint64_t v45 = *(void *)(v0 + 1192);
  uint64_t v46 = *(void *)(v0 + 1184);
  uint64_t v47 = *(void *)(v0 + 1176);
  uint64_t v48 = *(void *)(v0 + 1168);
  uint64_t v49 = *(void *)(v0 + 1160);
  uint64_t v50 = *(void *)(v0 + 1152);
  uint64_t v51 = *(void *)(v0 + 1144);
  uint64_t v52 = *(void *)(v0 + 1136);
  uint64_t v53 = *(void *)(v0 + 1128);
  uint64_t v54 = *(void *)(v0 + 1120);
  uint64_t v55 = *(void *)(v0 + 1112);
  uint64_t v56 = *(void *)(v0 + 1104);
  uint64_t v57 = *(void *)(v0 + 1096);
  uint64_t v58 = *(void *)(v0 + 1088);
  uint64_t v59 = *(void *)(v0 + 1080);
  uint64_t v60 = *(void *)(v0 + 1072);
  uint64_t v61 = *(void *)(v0 + 1064);
  uint64_t v62 = *(void *)(v0 + 1056);
  uint64_t v63 = *(void *)(v0 + 1048);
  uint64_t v64 = *(void *)(v0 + 1040);
  uint64_t v65 = *(void *)(v0 + 1032);
  uint64_t v66 = *(void *)(v0 + 1024);
  uint64_t v67 = *(void *)(v0 + 1016);
  uint64_t v68 = *(void *)(v0 + 1008);
  uint64_t v69 = *(void *)(v0 + 1000);
  uint64_t v70 = *(void *)(v0 + 992);
  uint64_t v71 = *(void *)(v0 + 984);
  uint64_t v72 = *(void *)(v0 + 976);
  uint64_t v73 = *(void *)(v0 + 952);
  uint64_t v74 = *(void *)(v0 + 928);
  uint64_t v75 = *(void *)(v0 + 920);
  uint64_t v76 = *(void *)(v0 + 912);
  uint64_t v77 = *(void *)(v0 + 904);
  uint64_t v78 = *(void *)(v0 + 896);
  uint64_t v79 = *(void *)(v0 + 864);
  uint64_t v80 = *(void *)(v0 + 840);
  uint64_t v81 = *(void *)(v0 + 832);
  uint64_t v82 = *(void *)(v0 + 824);
  uint64_t v83 = *(void *)(v0 + 792);
  uint64_t v84 = *(void *)(v0 + 784);
  uint64_t v85 = *(void *)(v0 + 776);
  uint64_t v86 = *(void *)(v0 + 768);
  uint64_t v87 = *(void *)(v0 + 736);
  uint64_t v88 = *(void *)(v0 + 728);
  uint64_t v89 = *(void *)(v0 + 720);
  uint64_t v90 = *(void *)(v0 + 712);
  uint64_t v91 = *(void *)(v0 + 704);
  uint64_t v92 = *(void *)(v0 + 696);
  uint64_t v93 = *(void *)(v0 + 688);
  uint64_t v94 = *(void *)(v0 + 656);
  uint64_t v95 = *(void *)(v0 + 648);
  uint64_t v96 = *(void *)(v0 + 640);
  uint64_t v97 = *(void *)(v0 + 632);
  uint64_t v98 = *(void *)(v0 + 624);
  uint64_t v99 = *(void *)(v0 + 616);
  uint64_t v100 = *(void *)(v0 + 584);
  uint64_t v101 = *(void *)(v0 + 576);
  uint64_t v102 = *(void *)(v0 + 552);
  uint64_t v103 = *(void *)(v0 + 544);
  uint64_t v104 = *(void *)(v0 + 536);
  uint64_t v105 = *(void *)(v0 + 504);
  uint64_t v106 = *(void *)(v0 + 496);
  uint64_t v107 = *(void *)(v0 + 488);
  uint64_t v108 = *(void *)(v0 + 480);
  uint64_t v109 = *(void *)(v0 + 448);
  uint64_t v110 = *(void *)(v0 + 440);
  uint64_t v111 = *(void *)(v0 + 432);
  swift_task_dealloc(*(void *)(v0 + 1424));
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  swift_task_dealloc(v45);
  swift_task_dealloc(v46);
  swift_task_dealloc(v47);
  swift_task_dealloc(v48);
  swift_task_dealloc(v49);
  swift_task_dealloc(v50);
  swift_task_dealloc(v51);
  swift_task_dealloc(v52);
  swift_task_dealloc(v53);
  swift_task_dealloc(v54);
  swift_task_dealloc(v55);
  swift_task_dealloc(v56);
  swift_task_dealloc(v57);
  swift_task_dealloc(v58);
  swift_task_dealloc(v59);
  swift_task_dealloc(v60);
  swift_task_dealloc(v61);
  swift_task_dealloc(v62);
  swift_task_dealloc(v63);
  swift_task_dealloc(v64);
  swift_task_dealloc(v65);
  swift_task_dealloc(v66);
  swift_task_dealloc(v67);
  swift_task_dealloc(v68);
  swift_task_dealloc(v69);
  swift_task_dealloc(v70);
  swift_task_dealloc(v71);
  swift_task_dealloc(v72);
  swift_task_dealloc(v73);
  swift_task_dealloc(v74);
  swift_task_dealloc(v75);
  swift_task_dealloc(v76);
  swift_task_dealloc(v77);
  swift_task_dealloc(v78);
  swift_task_dealloc(v79);
  swift_task_dealloc(v80);
  swift_task_dealloc(v81);
  swift_task_dealloc(v82);
  swift_task_dealloc(v83);
  swift_task_dealloc(v84);
  swift_task_dealloc(v85);
  swift_task_dealloc(v86);
  swift_task_dealloc(v87);
  swift_task_dealloc(v88);
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v91);
  swift_task_dealloc(v92);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  swift_task_dealloc(v97);
  swift_task_dealloc(v98);
  swift_task_dealloc(v99);
  swift_task_dealloc(v100);
  swift_task_dealloc(v101);
  swift_task_dealloc(v102);
  swift_task_dealloc(v103);
  swift_task_dealloc(v104);
  swift_task_dealloc(v105);
  swift_task_dealloc(v106);
  swift_task_dealloc(v107);
  swift_task_dealloc(v108);
  swift_task_dealloc(v109);
  swift_task_dealloc(v110);
  swift_task_dealloc(v111);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v25);
}

uint64_t sub_10002246C()
{
  uint64_t v1 = *(void *)(v0 + 1672);
  uint64_t v2 = *(void **)(v0 + 1632);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 1480);
  uint64_t v4 = *(void *)(v0 + 912);
  uint64_t v5 = *(void *)(v0 + 872);

  v3(v4, v5);
  *(void *)(v0 + 352) = v1;
  swift_errorRetain(v1);
  uint64_t v6 = sub_100007B74(&qword_100038890);
  type metadata accessor for CKError(0LL);
  uint64_t v8 = v7;
  char v9 = swift_dynamicCast(v0 + 344, v0 + 352, v6, v7, 0LL);
  uint64_t v10 = *(void *)(v0 + 1672);
  uint64_t v11 = *(void *)(v0 + 1448);
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v13 = *(void *)(v0 + 1432);
  uint64_t v14 = *(void *)(v0 + 960);
  if ((v9 & 1) != 0)
  {
    uint64_t v15 = *(void *)(v0 + 1072);
    swift_errorRelease(v10);
    uint64_t v16 = *(void **)(v0 + 344);
    v12(v15, v13, v14);
    uint64_t v17 = swift_allocObject(&unk_100035538, 24LL, 7LL);
    *(void *)(v17 + 16) = v16;
    id v18 = v16;
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
    os_log_type_t v20 = static os_log_type_t.error.getter();
    uint64_t v21 = swift_allocObject(&unk_100035560, 17LL, 7LL);
    *(_BYTE *)(v21 + 16) = 64;
    uint64_t v22 = swift_allocObject(&unk_100035588, 17LL, 7LL);
    *(_BYTE *)(v22 + 16) = 8;
    uint64_t v23 = swift_allocObject(&unk_1000355B0, 32LL, 7LL);
    *(void *)(v23 + 16) = sub_10002E250;
    *(void *)(v23 + 24) = v17;
    uint64_t v24 = swift_allocObject(&unk_1000355D8, 32LL, 7LL);
    *(void *)(v24 + 16) = sub_10002CAF8;
    *(void *)(v24 + 24) = v23;
    uint64_t v25 = swift_allocObject(&unk_100035600, 32LL, 7LL);
    *(void *)(v25 + 16) = sub_10002E010;
    *(void *)(v25 + 24) = v24;
    uint64_t v26 = swift_allocObject(v11, 80LL, 7LL);
    *(_OWORD *)(v26 + 16) = xmmword_10002FBB0;
    *(void *)(v26 + 32) = sub_10002E258;
    *(void *)(v26 + 40) = v21;
    *(void *)(v26 + 48) = sub_10002E258;
    *(void *)(v26 + 56) = v22;
    *(void *)(v26 + 64) = sub_10002E020;
    *(void *)(v26 + 72) = v25;
    swift_retain(v21);
    swift_retain(v22);
    swift_retain(v25);
    swift_bridgeObjectRelease(v26);
    os_log_type_t v27 = v20;
    uint64_t v192 = v18;
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v29 = (void *)swift_slowAlloc(8LL, -1LL);
      v199[0] = v29;
      v196[0] = 0LL;
      *(_WORD *)uint64_t v28 = 258;
      v28[2] = *(_BYTE *)(v21 + 16);
      swift_release(v21);
      v28[3] = *(_BYTE *)(v22 + 16);
      v195[0] = (uint64_t)(v28 + 4);
      swift_release(v22);
      sub_100029334(v195, v199, (uint64_t)v196, *(uint64_t (**)(void))(v25 + 16));
      uint64_t v30 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v31 = *(void *)(v0 + 1072);
      uint64_t v32 = *(void *)(v0 + 960);
      swift_release(v25);
      _os_log_impl((void *)&_mh_execute_header, v19, v27, "CKError: %@", v28, 0xCu);
      uint64_t v33 = sub_100007B74(&qword_1000388A0);
      swift_arrayDestroy(v29, 1LL, v33);
      swift_slowDealloc(v29, -1LL, -1LL);
      swift_slowDealloc(v28, -1LL, -1LL);

      v30(v31, v32);
      id v18 = v192;
    }

    else
    {
      uint64_t v52 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v53 = *(void *)(v0 + 1072);
      uint64_t v54 = *(void *)(v0 + 960);
      swift_release(v21);
      swift_release(v22);
      swift_release(v25);

      v52(v53, v54);
    }

    *(void *)(v0 + 312) = v18;
    uint64_t v55 = sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
    _BridgedStoredNSError.code.getter(v8, v55);
    if (*(void *)(v0 + 328) == 7LL)
    {
      uint64_t v56 = (*(uint64_t (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1064),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
      uint64_t v57 = (os_log_s *)Logger.logObject.getter(v56);
      os_log_type_t v58 = static os_log_type_t.info.getter();
      BOOL v59 = os_log_type_enabled(v57, v58);
      uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v61 = *(void *)(v0 + 1064);
      uint64_t v62 = *(void *)(v0 + 960);
      if (v59)
      {
        uint64_t v63 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        v199[0] = 0LL;
        v196[0] = 0LL;
        *(_WORD *)uint64_t v63 = 0;
        v195[0] = (uint64_t)(v63 + 2);
        sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v195, (uint64_t)v199, (uint64_t)v196);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        _os_log_impl((void *)&_mh_execute_header, v57, v58, "Found CloudKit rate-limit, deferring execution.", v63, 2u);
        swift_slowDealloc(v63, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      }

      v60(v61, v62);
      uint64_t v84 = *(void **)(v0 + 1544);
      uint64_t v85 = *(void **)(v0 + 1536);
      uint64_t v86 = *(void **)(v0 + 1528);
      uint64_t v87 = *(void **)(v0 + 1520);
      uint64_t v88 = *(void **)(v0 + 1512);
      uint64_t v89 = *(void **)(v0 + 1504);
      uint64_t v90 = *(void *)(v0 + 1496);
      uint64_t v74 = *(void *)(v0 + 1488);
      uint64_t v186 = *(void *)(v0 + 944);
      uint64_t v188 = *(void *)(v0 + 936);
      uint64_t v190 = *(void *)(v0 + 952);
      id v91 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v102 = MLHostResult.init(status:policy:)(1LL, 1LL);

      swift_release(v90);
    }

    else
    {
      uint64_t v77 = *(void **)(v0 + 1544);
      uint64_t v78 = *(void **)(v0 + 1536);
      uint64_t v79 = *(void **)(v0 + 1528);
      uint64_t v80 = *(void **)(v0 + 1520);
      uint64_t v81 = *(void **)(v0 + 1512);
      uint64_t v82 = *(void **)(v0 + 1504);
      uint64_t v74 = *(void *)(v0 + 1488);
      uint64_t v184 = *(void *)(v0 + 1496);
      uint64_t v186 = *(void *)(v0 + 944);
      uint64_t v188 = *(void *)(v0 + 936);
      uint64_t v190 = *(void *)(v0 + 952);
      uint64_t v197 = &type metadata for CloudError;
      unint64_t v198 = sub_10002CAFC();
      LOBYTE(v196[0]) = 1;
      id v83 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v102 = MLHostResult.init(error:policy:)(v196, 1LL);

      swift_release(v184);
    }

    uint64_t v76 = *(void *)(v0 + 352);
  }

  else
  {
    uint64_t v34 = *(void *)(v0 + 1056);
    swift_errorRelease(*(void *)(v0 + 352));
    v12(v34, v13, v14);
    uint64_t v35 = swift_allocObject(&unk_100035448, 24LL, 7LL);
    *(void *)(v35 + 16) = v10;
    uint64_t v36 = swift_errorRetain(v10);
    uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
    os_log_type_t v38 = static os_log_type_t.error.getter();
    uint64_t v39 = swift_allocObject(&unk_100035470, 17LL, 7LL);
    *(_BYTE *)(v39 + 16) = 64;
    uint64_t v40 = swift_allocObject(&unk_100035498, 17LL, 7LL);
    *(_BYTE *)(v40 + 16) = 8;
    uint64_t v41 = swift_allocObject(&unk_1000354C0, 32LL, 7LL);
    *(void *)(v41 + 16) = sub_10002E250;
    *(void *)(v41 + 24) = v35;
    uint64_t v42 = swift_allocObject(&unk_1000354E8, 32LL, 7LL);
    *(void *)(v42 + 16) = sub_10002CAF8;
    *(void *)(v42 + 24) = v41;
    uint64_t v43 = swift_allocObject(&unk_100035510, 32LL, 7LL);
    *(void *)(v43 + 16) = sub_100029448;
    *(void *)(v43 + 24) = v42;
    uint64_t v44 = swift_allocObject(v11, 80LL, 7LL);
    *(_OWORD *)(v44 + 16) = xmmword_10002FBB0;
    *(void *)(v44 + 32) = sub_10002E258;
    *(void *)(v44 + 40) = v39;
    *(void *)(v44 + 48) = sub_10002E258;
    *(void *)(v44 + 56) = v40;
    *(void *)(v44 + 64) = sub_10002E020;
    *(void *)(v44 + 72) = v43;
    swift_retain(v39);
    swift_retain(v40);
    swift_retain(v43);
    swift_bridgeObjectRelease(v44);
    os_log_type_t v45 = v38;
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v47 = (void *)swift_slowAlloc(8LL, -1LL);
      v199[0] = v47;
      v196[0] = 0LL;
      *(_WORD *)uint64_t v46 = 258;
      v46[2] = *(_BYTE *)(v39 + 16);
      swift_release(v39);
      v46[3] = *(_BYTE *)(v40 + 16);
      v195[0] = (uint64_t)(v46 + 4);
      swift_release(v40);
      sub_100029334(v195, v199, (uint64_t)v196, *(uint64_t (**)(void))(v43 + 16));
      uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v49 = *(void *)(v0 + 1056);
      uint64_t v50 = *(void *)(v0 + 960);
      swift_release(v43);
      _os_log_impl((void *)&_mh_execute_header, v37, v45, "Error: %@", v46, 0xCu);
      uint64_t v51 = sub_100007B74(&qword_1000388A0);
      swift_arrayDestroy(v47, 1LL, v51);
      swift_slowDealloc(v47, -1LL, -1LL);
      swift_slowDealloc(v46, -1LL, -1LL);

      v48(v49, v50);
    }

    else
    {
      uint64_t v64 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v65 = *(void *)(v0 + 1056);
      uint64_t v66 = *(void *)(v0 + 960);
      swift_release(v39);
      swift_release(v40);
      swift_release(v43);

      v64(v65, v66);
    }

    uint64_t v67 = *(void **)(v0 + 1544);
    uint64_t v68 = *(void **)(v0 + 1536);
    uint64_t v69 = *(void **)(v0 + 1528);
    uint64_t v70 = *(void **)(v0 + 1520);
    uint64_t v71 = *(void **)(v0 + 1512);
    uint64_t v72 = *(void **)(v0 + 1504);
    uint64_t v73 = *(void *)(v0 + 1496);
    uint64_t v74 = *(void *)(v0 + 1488);
    uint64_t v190 = *(void *)(v0 + 952);
    uint64_t v193 = *(void *)(v0 + 1672);
    uint64_t v186 = *(void *)(v0 + 944);
    uint64_t v188 = *(void *)(v0 + 936);
    uint64_t v197 = &type metadata for CloudError;
    unint64_t v198 = sub_10002CAFC();
    LOBYTE(v196[0]) = 1;
    id v75 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v102 = MLHostResult.init(error:policy:)(v196, 1LL);

    swift_release(v73);
    uint64_t v76 = v193;
  }

  swift_errorRelease(v76);
  sub_100025B68(v74);
  (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v190, v188);
  swift_release(v74);
  uint64_t v92 = *(void *)(v0 + 1416);
  uint64_t v93 = *(void *)(v0 + 1408);
  uint64_t v94 = *(void *)(v0 + 1400);
  uint64_t v95 = *(void *)(v0 + 1392);
  uint64_t v96 = *(void *)(v0 + 1384);
  uint64_t v97 = *(void *)(v0 + 1376);
  uint64_t v98 = *(void *)(v0 + 1368);
  uint64_t v99 = *(void *)(v0 + 1360);
  uint64_t v100 = *(void *)(v0 + 1352);
  uint64_t v103 = *(void *)(v0 + 1344);
  uint64_t v104 = *(void *)(v0 + 1336);
  uint64_t v105 = *(void *)(v0 + 1328);
  uint64_t v106 = *(void *)(v0 + 1320);
  uint64_t v107 = *(void *)(v0 + 1312);
  uint64_t v108 = *(void *)(v0 + 1304);
  uint64_t v109 = *(void *)(v0 + 1296);
  uint64_t v110 = *(void *)(v0 + 1288);
  uint64_t v111 = *(void *)(v0 + 1280);
  uint64_t v112 = *(void *)(v0 + 1272);
  uint64_t v113 = *(void *)(v0 + 1264);
  uint64_t v114 = *(void *)(v0 + 1256);
  uint64_t v115 = *(void *)(v0 + 1248);
  uint64_t v116 = *(void *)(v0 + 1240);
  uint64_t v117 = *(void *)(v0 + 1232);
  uint64_t v118 = *(void *)(v0 + 1224);
  uint64_t v119 = *(void *)(v0 + 1216);
  uint64_t v120 = *(void *)(v0 + 1208);
  uint64_t v121 = *(void *)(v0 + 1200);
  uint64_t v122 = *(void *)(v0 + 1192);
  uint64_t v123 = *(void *)(v0 + 1184);
  uint64_t v124 = *(void *)(v0 + 1176);
  uint64_t v125 = *(void *)(v0 + 1168);
  uint64_t v126 = *(void *)(v0 + 1160);
  uint64_t v127 = *(void *)(v0 + 1152);
  uint64_t v128 = *(void *)(v0 + 1144);
  uint64_t v129 = *(void *)(v0 + 1136);
  uint64_t v130 = *(void *)(v0 + 1128);
  uint64_t v131 = *(void *)(v0 + 1120);
  uint64_t v132 = *(void *)(v0 + 1112);
  uint64_t v133 = *(void *)(v0 + 1104);
  uint64_t v134 = *(void *)(v0 + 1096);
  uint64_t v135 = *(void *)(v0 + 1088);
  uint64_t v136 = *(void *)(v0 + 1080);
  uint64_t v137 = *(void *)(v0 + 1072);
  uint64_t v138 = *(void *)(v0 + 1064);
  uint64_t v139 = *(void *)(v0 + 1056);
  uint64_t v140 = *(void *)(v0 + 1048);
  uint64_t v141 = *(void *)(v0 + 1040);
  uint64_t v142 = *(void *)(v0 + 1032);
  uint64_t v143 = *(void *)(v0 + 1024);
  uint64_t v144 = *(void *)(v0 + 1016);
  uint64_t v145 = *(void *)(v0 + 1008);
  uint64_t v146 = *(void *)(v0 + 1000);
  uint64_t v147 = *(void *)(v0 + 992);
  uint64_t v148 = *(void *)(v0 + 984);
  uint64_t v149 = *(void *)(v0 + 976);
  uint64_t v150 = *(void *)(v0 + 952);
  uint64_t v151 = *(void *)(v0 + 928);
  uint64_t v152 = *(void *)(v0 + 920);
  uint64_t v153 = *(void *)(v0 + 912);
  uint64_t v154 = *(void *)(v0 + 904);
  uint64_t v155 = *(void *)(v0 + 896);
  uint64_t v156 = *(void *)(v0 + 864);
  uint64_t v157 = *(void *)(v0 + 840);
  uint64_t v158 = *(void *)(v0 + 832);
  uint64_t v159 = *(void *)(v0 + 824);
  uint64_t v160 = *(void *)(v0 + 792);
  uint64_t v161 = *(void *)(v0 + 784);
  uint64_t v162 = *(void *)(v0 + 776);
  uint64_t v163 = *(void *)(v0 + 768);
  uint64_t v164 = *(void *)(v0 + 736);
  uint64_t v165 = *(void *)(v0 + 728);
  uint64_t v166 = *(void *)(v0 + 720);
  uint64_t v167 = *(void *)(v0 + 712);
  uint64_t v168 = *(void *)(v0 + 704);
  uint64_t v169 = *(void *)(v0 + 696);
  uint64_t v170 = *(void *)(v0 + 688);
  uint64_t v171 = *(void *)(v0 + 656);
  uint64_t v172 = *(void *)(v0 + 648);
  uint64_t v173 = *(void *)(v0 + 640);
  uint64_t v174 = *(void *)(v0 + 632);
  uint64_t v175 = *(void *)(v0 + 624);
  uint64_t v176 = *(void *)(v0 + 616);
  uint64_t v177 = *(void *)(v0 + 584);
  uint64_t v178 = *(void *)(v0 + 576);
  uint64_t v179 = *(void *)(v0 + 552);
  uint64_t v180 = *(void *)(v0 + 544);
  uint64_t v181 = *(void *)(v0 + 536);
  uint64_t v182 = *(void *)(v0 + 504);
  uint64_t v183 = *(void *)(v0 + 496);
  uint64_t v185 = *(void *)(v0 + 488);
  uint64_t v187 = *(void *)(v0 + 480);
  uint64_t v189 = *(void *)(v0 + 448);
  uint64_t v191 = *(void *)(v0 + 440);
  uint64_t v194 = *(void *)(v0 + 432);
  swift_task_dealloc(*(void *)(v0 + 1424));
  swift_task_dealloc(v92);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  swift_task_dealloc(v97);
  swift_task_dealloc(v98);
  swift_task_dealloc(v99);
  swift_task_dealloc(v100);
  swift_task_dealloc(v103);
  swift_task_dealloc(v104);
  swift_task_dealloc(v105);
  swift_task_dealloc(v106);
  swift_task_dealloc(v107);
  swift_task_dealloc(v108);
  swift_task_dealloc(v109);
  swift_task_dealloc(v110);
  swift_task_dealloc(v111);
  swift_task_dealloc(v112);
  swift_task_dealloc(v113);
  swift_task_dealloc(v114);
  swift_task_dealloc(v115);
  swift_task_dealloc(v116);
  swift_task_dealloc(v117);
  swift_task_dealloc(v118);
  swift_task_dealloc(v119);
  swift_task_dealloc(v120);
  swift_task_dealloc(v121);
  swift_task_dealloc(v122);
  swift_task_dealloc(v123);
  swift_task_dealloc(v124);
  swift_task_dealloc(v125);
  swift_task_dealloc(v126);
  swift_task_dealloc(v127);
  swift_task_dealloc(v128);
  swift_task_dealloc(v129);
  swift_task_dealloc(v130);
  swift_task_dealloc(v131);
  swift_task_dealloc(v132);
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v135);
  swift_task_dealloc(v136);
  swift_task_dealloc(v137);
  swift_task_dealloc(v138);
  swift_task_dealloc(v139);
  swift_task_dealloc(v140);
  swift_task_dealloc(v141);
  swift_task_dealloc(v142);
  swift_task_dealloc(v143);
  swift_task_dealloc(v144);
  swift_task_dealloc(v145);
  swift_task_dealloc(v146);
  swift_task_dealloc(v147);
  swift_task_dealloc(v148);
  swift_task_dealloc(v149);
  swift_task_dealloc(v150);
  swift_task_dealloc(v151);
  swift_task_dealloc(v152);
  swift_task_dealloc(v153);
  swift_task_dealloc(v154);
  swift_task_dealloc(v155);
  swift_task_dealloc(v156);
  swift_task_dealloc(v157);
  swift_task_dealloc(v158);
  swift_task_dealloc(v159);
  swift_task_dealloc(v160);
  swift_task_dealloc(v161);
  swift_task_dealloc(v162);
  swift_task_dealloc(v163);
  swift_task_dealloc(v164);
  swift_task_dealloc(v165);
  swift_task_dealloc(v166);
  swift_task_dealloc(v167);
  swift_task_dealloc(v168);
  swift_task_dealloc(v169);
  swift_task_dealloc(v170);
  swift_task_dealloc(v171);
  swift_task_dealloc(v172);
  swift_task_dealloc(v173);
  swift_task_dealloc(v174);
  swift_task_dealloc(v175);
  swift_task_dealloc(v176);
  swift_task_dealloc(v177);
  swift_task_dealloc(v178);
  swift_task_dealloc(v179);
  swift_task_dealloc(v180);
  swift_task_dealloc(v181);
  swift_task_dealloc(v182);
  swift_task_dealloc(v183);
  swift_task_dealloc(v185);
  swift_task_dealloc(v187);
  swift_task_dealloc(v189);
  swift_task_dealloc(v191);
  swift_task_dealloc(v194);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v102);
}

uint64_t sub_10002330C()
{
  uint64_t v1 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 1744);
  uint64_t v2 = *(void *)(v0 + 1448);
  uint64_t v3 = *(void *)(v0 + 776);
  uint64_t v4 = *(void *)(v0 + 768);
  uint64_t v5 = *(void *)(v0 + 760);
  uint64_t v6 = *(void *)(v0 + 752);
  uint64_t v7 = *(void *)(v0 + 744);
  (*(void (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1296),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v7);
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = (v8 + 16) & ~v8;
  uint64_t v10 = swift_allocObject(&unk_100037130, v9 + v5, v8 | 7);
  uint64_t v11 = v1(v10 + v9, v4, v7);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.error.getter();
  uint64_t v14 = swift_allocObject(&unk_100037158, 17LL, 7LL);
  *(_BYTE *)(v14 + 16) = 32;
  uint64_t v15 = swift_allocObject(&unk_100037180, 17LL, 7LL);
  *(_BYTE *)(v15 + 16) = 8;
  uint64_t v16 = swift_allocObject(&unk_1000371A8, 32LL, 7LL);
  *(void *)(v16 + 16) = sub_10002D964;
  *(void *)(v16 + 24) = v10;
  uint64_t v17 = swift_allocObject(&unk_1000371D0, 32LL, 7LL);
  *(void *)(v17 + 16) = sub_10002E010;
  *(void *)(v17 + 24) = v16;
  uint64_t v18 = swift_allocObject(v2, 80LL, 7LL);
  *(_OWORD *)(v18 + 16) = xmmword_10002FBB0;
  *(void *)(v18 + 32) = sub_10002E258;
  *(void *)(v18 + 40) = v14;
  *(void *)(v18 + 48) = sub_10002E258;
  *(void *)(v18 + 56) = v15;
  *(void *)(v18 + 64) = sub_10002E01C;
  *(void *)(v18 + 72) = v17;
  swift_retain(v14);
  swift_retain(v15);
  swift_retain(v17);
  swift_bridgeObjectRelease(v18);
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v20 = swift_slowAlloc(32LL, -1LL);
    *(void *)(v0 + 368) = 0LL;
    *(void *)(v0 + 376) = v20;
    *(_WORD *)uint64_t v19 = 258;
    v19[2] = *(_BYTE *)(v14 + 16);
    *(void *)(v0 + 360) = v19 + 3;
    swift_release(v14);
    uint64_t v21 = *(_BYTE **)(v0 + 360);
    *uint64_t v21 = *(_BYTE *)(v15 + 16);
    *(void *)(v0 + 360) = v21 + 1;
    swift_release(v15);
    sub_100029290((uint64_t *)(v0 + 360), v0 + 368, (uint64_t *)(v0 + 376), *(uint64_t (**)(void))(v17 + 16));
    uint64_t v80 = (uint64_t *)(v0 + 1720);
    uint64_t v22 = *(void *)(v0 + 1296);
    uint64_t v23 = *(void *)(v0 + 960);
    uint64_t v77 = *(void (**)(uint64_t, uint64_t))(v0 + 1720);
    uint64_t v78 = *(void *)(v0 + 824);
    uint64_t v76 = *(void *)(v0 + 776);
    uint64_t v24 = *(void *)(v0 + 752);
    uint64_t v25 = *(void *)(v0 + 744);
    swift_release(v17);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Invalid remote reply for taskName: %s", v19, 0xCu);
    swift_arrayDestroy(v20, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1LL, -1LL);
    swift_slowDealloc(v19, -1LL, -1LL);

    v77(v22, v23);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v76, v25);
  }

  else
  {
    uint64_t v80 = (uint64_t *)(v0 + 1728);
    uint64_t v26 = v12;
    os_log_type_t v27 = *(void (**)(uint64_t, uint64_t))(v0 + 1728);
    uint64_t v28 = *(void *)(v0 + 1296);
    uint64_t v29 = *(void *)(v0 + 960);
    uint64_t v78 = *(void *)(v0 + 824);
    uint64_t v30 = *(void *)(v0 + 776);
    uint64_t v31 = *(void *)(v0 + 752);
    uint64_t v32 = *(void *)(v0 + 744);

    swift_release(v17);
    swift_release(v15);
    swift_release(v14);
    v27(v28, v29);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  }

  sub_1000087FC(v78, type metadata accessor for TaskRecord);
  uint64_t v33 = *(void *)(v0 + 1488);
  uint64_t v34 = *(void *)(v33 + 48);
  BOOL v35 = __OFADD__(v34, 1LL);
  uint64_t v36 = v34 + 1;
  if (v35) {
    __break(1u);
  }
  uint64_t v37 = *v80;
  *(void *)(v33 + 48) = v36;
  uint64_t v38 = *(void *)(v0 + 1736) + 1LL;
  if (v38 == *(void *)(v0 + 1696))
  {
    swift_bridgeObjectRelease(*(void *)(v0 + 1688));
    uint64_t v39 = *(void *)(v0 + 1680);
    uint64_t v40 = *(void *)(v0 + 1448);
    (*(void (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1280),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
    uint64_t v41 = swift_allocObject(&unk_100035808, 32LL, 7LL);
    *(void *)(v41 + 16) = sub_10002CBDC;
    *(void *)(v41 + 24) = v39;
    uint64_t v42 = swift_retain(v39);
    uint64_t v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.info.getter();
    uint64_t v45 = swift_allocObject(&unk_100035830, 17LL, 7LL);
    *(_BYTE *)(v45 + 16) = 32;
    uint64_t v46 = swift_allocObject(&unk_100035858, 17LL, 7LL);
    *(_BYTE *)(v46 + 16) = 8;
    uint64_t v47 = swift_allocObject(&unk_100035880, 32LL, 7LL);
    *(void *)(v47 + 16) = sub_10002C820;
    *(void *)(v47 + 24) = v41;
    uint64_t v48 = swift_allocObject(&unk_1000358A8, 32LL, 7LL);
    *(void *)(v48 + 16) = sub_10002E010;
    *(void *)(v48 + 24) = v47;
    uint64_t v49 = swift_allocObject(v40, 80LL, 7LL);
    *(_OWORD *)(v49 + 16) = xmmword_10002FBB0;
    *(void *)(v49 + 32) = sub_10002E258;
    *(void *)(v49 + 40) = v45;
    *(void *)(v49 + 48) = sub_10002E258;
    *(void *)(v49 + 56) = v46;
    *(void *)(v49 + 64) = sub_10002E01C;
    *(void *)(v49 + 72) = v48;
    swift_retain(v45);
    swift_retain(v46);
    swift_retain(v48);
    swift_bridgeObjectRelease(v49);
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v51 = swift_slowAlloc(32LL, -1LL);
      uint64_t v82 = 0LL;
      uint64_t v83 = v51;
      *(_WORD *)uint64_t v50 = 258;
      v50[2] = *(_BYTE *)(v45 + 16);
      uint64_t v67 = v51;
      swift_release(v45);
      v50[3] = *(_BYTE *)(v46 + 16);
      uint64_t v81 = v50 + 4;
      swift_release(v46);
      sub_100029290((uint64_t *)&v81, (uint64_t)&v82, &v83, *(uint64_t (**)(void))(v48 + 16));
      uint64_t v68 = (void *)v0;
      uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v70 = v68[160];
      uint64_t v71 = v68[120];
      swift_release(v48);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Computed addedTaskNames: %s", v50, 0xCu);
      swift_arrayDestroy(v67, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v67, -1LL, -1LL);
      swift_slowDealloc(v50, -1LL, -1LL);

      uint64_t v72 = v70;
      uint64_t v73 = v71;
    }

    else
    {
      uint64_t v68 = (void *)v0;
      uint64_t v69 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v57 = v68[160];
      uint64_t v58 = v68[120];
      swift_release(v45);
      swift_release(v46);
      swift_release(v48);

      uint64_t v72 = v57;
      uint64_t v73 = v58;
    }

    v69(v72, v73);
    uint64_t v74 = async function pointer to dispatch thunk of MLHostClient.getTasks();
    v68[221] = v75;
    *id v75 = v68;
    v75[1] = sub_100011288;
    return ((uint64_t (*)(void))((char *)&async function pointer to dispatch thunk of MLHostClient.getTasks() + v74))();
  }

  else
  {
    __int128 v79 = *(_OWORD *)(v0 + 1712);
    *(void *)(v0 + 1736) = v38;
    *(void *)(v0 + 1728) = v37;
    *(_OWORD *)(v0 + 1712) = v79;
    uint64_t v52 = *(void *)(v0 + 824);
    uint64_t v53 = *(void *)(v0 + 744);
    sub_1000087B8( *(void *)(v0 + 1688)
    + ((*(unsigned __int8 *)(v0 + 1912) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v0 + 1912))
    + *(void *)(v0 + 1704) * v38,
      v52,
      type metadata accessor for TaskRecord);
    uint64_t v54 = *(void *)(v52 + 32);
    unint64_t v55 = *(void *)(v52 + 40);
    sub_1000085F8(v54, v55);
    uint64_t v56 = sub_100009FBC( &qword_1000388A8,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskDefinition,  (uint64_t)&protocol conformance descriptor for TaskDefinition);
    dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v53, v54, v55, v53, v56);
    uint64_t v59 = *(void *)(v0 + 776);
    uint64_t v60 = *(void *)(v0 + 752);
    uint64_t v61 = *(void *)(v0 + 744);
    uint64_t v62 = *(void *)(v0 + 728);
    sub_1000085B4(v54, v55);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v60 + 56))(v62, 0LL, 1LL, v61);
    uint64_t v63 = *(void (**)(uint64_t, uint64_t, uint64_t))(v60 + 32);
    *(void *)(v0 + 1744) = v63;
    v63(v59, v62, v61);
    uint64_t v64 = async function pointer to dispatch thunk of MLHostClient.addTask(taskDefinition:);
    *(void *)(v0 + 1752) = v65;
    *uint64_t v65 = v0;
    v65[1] = sub_1000102C4;
  }

uint64_t sub_100023CE8()
{
  uint64_t v1 = *(void *)(v0 + 1848);

  *(void *)(v0 + 296) = v1;
  swift_errorRetain(v1);
  uint64_t v2 = sub_100007B74(&qword_100038890);
  type metadata accessor for CKError(0LL);
  uint64_t v4 = v3;
  char v5 = swift_dynamicCast(v0 + 256, v0 + 296, v2, v3, 0LL);
  uint64_t v6 = *(void *)(v0 + 1848);
  uint64_t v7 = *(void *)(v0 + 1448);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v9 = *(void *)(v0 + 1432);
  uint64_t v10 = *(void *)(v0 + 960);
  if ((v5 & 1) != 0)
  {
    uint64_t v11 = *(void *)(v0 + 1040);
    swift_errorRelease(v6);
    uint64_t v12 = *(void **)(v0 + 256);
    v8(v11, v9, v10);
    uint64_t v13 = swift_allocObject(&unk_100035C40, 24LL, 7LL);
    *(void *)(v13 + 16) = v12;
    id v14 = v12;
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    uint64_t v17 = swift_allocObject(&unk_100035C68, 17LL, 7LL);
    *(_BYTE *)(v17 + 16) = 64;
    uint64_t v18 = swift_allocObject(&unk_100035C90, 17LL, 7LL);
    *(_BYTE *)(v18 + 16) = 8;
    uint64_t v19 = swift_allocObject(&unk_100035CB8, 32LL, 7LL);
    *(void *)(v19 + 16) = sub_10002E250;
    *(void *)(v19 + 24) = v13;
    uint64_t v20 = swift_allocObject(&unk_100035CE0, 32LL, 7LL);
    *(void *)(v20 + 16) = sub_10002CAF8;
    *(void *)(v20 + 24) = v19;
    uint64_t v21 = swift_allocObject(&unk_100035D08, 32LL, 7LL);
    *(void *)(v21 + 16) = sub_10002E010;
    *(void *)(v21 + 24) = v20;
    uint64_t v22 = swift_allocObject(v7, 80LL, 7LL);
    *(_OWORD *)(v22 + 16) = xmmword_10002FBB0;
    *(void *)(v22 + 32) = sub_10002E258;
    *(void *)(v22 + 40) = v17;
    *(void *)(v22 + 48) = sub_10002E258;
    *(void *)(v22 + 56) = v18;
    *(void *)(v22 + 64) = sub_10002E020;
    *(void *)(v22 + 72) = v21;
    swift_retain(v17);
    swift_retain(v18);
    swift_retain(v21);
    swift_bridgeObjectRelease(v22);
    os_log_type_t v23 = v16;
    unint64_t v198 = v14;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v25 = (void *)swift_slowAlloc(8LL, -1LL);
      v205[0] = v25;
      v202[0] = 0LL;
      *(_WORD *)uint64_t v24 = 258;
      v24[2] = *(_BYTE *)(v17 + 16);
      swift_release(v17);
      v24[3] = *(_BYTE *)(v18 + 16);
      v201[0] = (uint64_t)(v24 + 4);
      swift_release(v18);
      sub_100029334(v201, v205, (uint64_t)v202, *(uint64_t (**)(void))(v21 + 16));
      uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v27 = *(void *)(v0 + 1040);
      uint64_t v28 = *(void *)(v0 + 960);
      swift_release(v21);
      _os_log_impl((void *)&_mh_execute_header, v15, v23, "CKError: %@", v24, 0xCu);
      uint64_t v29 = sub_100007B74(&qword_1000388A0);
      swift_arrayDestroy(v25, 1LL, v29);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);

      v26(v27, v28);
      id v14 = v198;
    }

    else
    {
      uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v49 = *(void *)(v0 + 1040);
      uint64_t v50 = *(void *)(v0 + 960);
      swift_release(v17);
      swift_release(v18);
      swift_release(v21);

      v48(v49, v50);
    }

    *(void *)(v0 + 240) = v14;
    uint64_t v51 = sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
    _BridgedStoredNSError.code.getter(v4, v51);
    if (*(void *)(v0 + 248) == 7LL)
    {
      uint64_t v52 = (*(uint64_t (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1032),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
      uint64_t v53 = (os_log_s *)Logger.logObject.getter(v52);
      os_log_type_t v54 = static os_log_type_t.info.getter();
      BOOL v55 = os_log_type_enabled(v53, v54);
      uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v57 = *(void *)(v0 + 1032);
      uint64_t v58 = *(void *)(v0 + 960);
      if (v55)
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        v205[0] = 0LL;
        v202[0] = 0LL;
        *(_WORD *)uint64_t v59 = 0;
        v201[0] = (uint64_t)(v59 + 2);
        sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v201, (uint64_t)v205, (uint64_t)v202);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "Found CloudKit rate-limit, deferring execution.", v59, 2u);
        swift_slowDealloc(v59, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      }

      v56(v57, v58);
      uint64_t v81 = *(void **)(v0 + 1544);
      uint64_t v82 = *(void **)(v0 + 1536);
      uint64_t v83 = *(void **)(v0 + 1528);
      uint64_t v84 = *(void **)(v0 + 1520);
      uint64_t v85 = *(void **)(v0 + 1512);
      uint64_t v86 = *(void **)(v0 + 1504);
      uint64_t v87 = *(void *)(v0 + 1496);
      uint64_t v70 = *(void *)(v0 + 1488);
      uint64_t v193 = *(void *)(v0 + 952);
      uint64_t v196 = *(void *)(v0 + 1680);
      uint64_t v181 = *(void *)(v0 + 1808);
      uint64_t v184 = *(void *)(v0 + 944);
      uint64_t v187 = *(void *)(v0 + 1800);
      uint64_t v190 = *(void *)(v0 + 936);
      id v88 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v99 = MLHostResult.init(status:policy:)(1LL, 1LL);

      swift_release(v87);
    }

    else
    {
      uint64_t v72 = v14;
      uint64_t v73 = *(void **)(v0 + 1544);
      uint64_t v74 = *(void **)(v0 + 1536);
      id v75 = *(void **)(v0 + 1528);
      uint64_t v76 = *(void **)(v0 + 1520);
      uint64_t v77 = *(void **)(v0 + 1512);
      uint64_t v78 = *(void **)(v0 + 1504);
      uint64_t v79 = *(void *)(v0 + 1496);
      uint64_t v178 = *(void *)(v0 + 1488);
      uint64_t v181 = *(void *)(v0 + 1808);
      uint64_t v193 = *(void *)(v0 + 952);
      uint64_t v196 = *(void *)(v0 + 1680);
      uint64_t v184 = *(void *)(v0 + 944);
      uint64_t v187 = *(void *)(v0 + 1800);
      uint64_t v190 = *(void *)(v0 + 936);
      os_log_type_t v203 = &type metadata for CloudError;
      unint64_t v204 = sub_10002CAFC();
      LOBYTE(v202[0]) = 1;
      id v80 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v99 = MLHostResult.init(error:policy:)(v202, 1LL);

      swift_release(v79);
      uint64_t v70 = v178;
    }

    swift_errorRelease(*(void *)(v0 + 296));
    swift_release(v181);
    swift_release(v187);
    swift_release(v196);
    sub_100025B68(v70);
    (*(void (**)(uint64_t, uint64_t))(v184 + 8))(v193, v190);
  }

  else
  {
    uint64_t v30 = *(void *)(v0 + 1024);
    swift_errorRelease(*(void *)(v0 + 296));
    v8(v30, v9, v10);
    uint64_t v31 = swift_allocObject(&unk_100035B50, 24LL, 7LL);
    *(void *)(v31 + 16) = v6;
    uint64_t v32 = swift_errorRetain(v6);
    uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v34 = static os_log_type_t.error.getter();
    uint64_t v35 = swift_allocObject(&unk_100035B78, 17LL, 7LL);
    *(_BYTE *)(v35 + 16) = 64;
    uint64_t v36 = swift_allocObject(&unk_100035BA0, 17LL, 7LL);
    *(_BYTE *)(v36 + 16) = 8;
    uint64_t v37 = swift_allocObject(&unk_100035BC8, 32LL, 7LL);
    *(void *)(v37 + 16) = sub_10002E250;
    *(void *)(v37 + 24) = v31;
    uint64_t v38 = swift_allocObject(&unk_100035BF0, 32LL, 7LL);
    *(void *)(v38 + 16) = sub_10002CAF8;
    *(void *)(v38 + 24) = v37;
    uint64_t v39 = swift_allocObject(&unk_100035C18, 32LL, 7LL);
    *(void *)(v39 + 16) = sub_10002E010;
    *(void *)(v39 + 24) = v38;
    uint64_t v40 = swift_allocObject(v7, 80LL, 7LL);
    *(_OWORD *)(v40 + 16) = xmmword_10002FBB0;
    *(void *)(v40 + 32) = sub_10002E258;
    *(void *)(v40 + 40) = v35;
    *(void *)(v40 + 48) = sub_10002E258;
    *(void *)(v40 + 56) = v36;
    *(void *)(v40 + 64) = sub_10002E020;
    *(void *)(v40 + 72) = v39;
    swift_retain(v35);
    swift_retain(v36);
    swift_retain(v39);
    swift_bridgeObjectRelease(v40);
    os_log_type_t v41 = v34;
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v43 = (void *)swift_slowAlloc(8LL, -1LL);
      v205[0] = v43;
      v202[0] = 0LL;
      *(_WORD *)uint64_t v42 = 258;
      v42[2] = *(_BYTE *)(v35 + 16);
      swift_release(v35);
      v42[3] = *(_BYTE *)(v36 + 16);
      v201[0] = (uint64_t)(v42 + 4);
      swift_release(v36);
      sub_100029334(v201, v205, (uint64_t)v202, *(uint64_t (**)(void))(v39 + 16));
      os_log_type_t v44 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v45 = *(void *)(v0 + 1024);
      uint64_t v46 = *(void *)(v0 + 960);
      swift_release(v39);
      _os_log_impl((void *)&_mh_execute_header, v33, v41, "Error: %@", v42, 0xCu);
      uint64_t v47 = sub_100007B74(&qword_1000388A0);
      swift_arrayDestroy(v43, 1LL, v47);
      swift_slowDealloc(v43, -1LL, -1LL);
      swift_slowDealloc(v42, -1LL, -1LL);

      v44(v45, v46);
    }

    else
    {
      uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v0 + 1456);
      uint64_t v61 = *(void *)(v0 + 1024);
      uint64_t v62 = *(void *)(v0 + 960);
      swift_release(v35);
      swift_release(v36);
      swift_release(v39);

      v60(v61, v62);
    }

    uint64_t v180 = *(void *)(v0 + 1848);
    uint64_t v183 = *(void *)(v0 + 1808);
    uint64_t v63 = *(void **)(v0 + 1544);
    uint64_t v64 = *(void **)(v0 + 1536);
    uint64_t v65 = *(void **)(v0 + 1528);
    uint64_t v66 = *(void **)(v0 + 1520);
    uint64_t v67 = *(void **)(v0 + 1512);
    uint64_t v68 = *(void **)(v0 + 1504);
    uint64_t v69 = *(void *)(v0 + 1496);
    uint64_t v70 = *(void *)(v0 + 1488);
    uint64_t v195 = *(void *)(v0 + 952);
    uint64_t v199 = *(void *)(v0 + 1680);
    uint64_t v186 = *(void *)(v0 + 944);
    uint64_t v189 = *(void *)(v0 + 1800);
    uint64_t v192 = *(void *)(v0 + 936);
    os_log_type_t v203 = &type metadata for CloudError;
    unint64_t v204 = sub_10002CAFC();
    LOBYTE(v202[0]) = 1;
    id v71 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v99 = MLHostResult.init(error:policy:)(v202, 1LL);

    swift_release(v69);
    swift_errorRelease(v180);
    swift_release(v183);
    swift_release(v189);
    swift_release(v199);
    sub_100025B68(v70);
    (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v195, v192);
  }

  swift_release(v70);
  uint64_t v89 = *(void *)(v0 + 1416);
  uint64_t v90 = *(void *)(v0 + 1408);
  uint64_t v91 = *(void *)(v0 + 1400);
  uint64_t v92 = *(void *)(v0 + 1392);
  uint64_t v93 = *(void *)(v0 + 1384);
  uint64_t v94 = *(void *)(v0 + 1376);
  uint64_t v95 = *(void *)(v0 + 1368);
  uint64_t v96 = *(void *)(v0 + 1360);
  uint64_t v97 = *(void *)(v0 + 1352);
  uint64_t v100 = *(void *)(v0 + 1344);
  uint64_t v101 = *(void *)(v0 + 1336);
  uint64_t v102 = *(void *)(v0 + 1328);
  uint64_t v103 = *(void *)(v0 + 1320);
  uint64_t v104 = *(void *)(v0 + 1312);
  uint64_t v105 = *(void *)(v0 + 1304);
  uint64_t v106 = *(void *)(v0 + 1296);
  uint64_t v107 = *(void *)(v0 + 1288);
  uint64_t v108 = *(void *)(v0 + 1280);
  uint64_t v109 = *(void *)(v0 + 1272);
  uint64_t v110 = *(void *)(v0 + 1264);
  uint64_t v111 = *(void *)(v0 + 1256);
  uint64_t v112 = *(void *)(v0 + 1248);
  uint64_t v113 = *(void *)(v0 + 1240);
  uint64_t v114 = *(void *)(v0 + 1232);
  uint64_t v115 = *(void *)(v0 + 1224);
  uint64_t v116 = *(void *)(v0 + 1216);
  uint64_t v117 = *(void *)(v0 + 1208);
  uint64_t v118 = *(void *)(v0 + 1200);
  uint64_t v119 = *(void *)(v0 + 1192);
  uint64_t v120 = *(void *)(v0 + 1184);
  uint64_t v121 = *(void *)(v0 + 1176);
  uint64_t v122 = *(void *)(v0 + 1168);
  uint64_t v123 = *(void *)(v0 + 1160);
  uint64_t v124 = *(void *)(v0 + 1152);
  uint64_t v125 = *(void *)(v0 + 1144);
  uint64_t v126 = *(void *)(v0 + 1136);
  uint64_t v127 = *(void *)(v0 + 1128);
  uint64_t v128 = *(void *)(v0 + 1120);
  uint64_t v129 = *(void *)(v0 + 1112);
  uint64_t v130 = *(void *)(v0 + 1104);
  uint64_t v131 = *(void *)(v0 + 1096);
  uint64_t v132 = *(void *)(v0 + 1088);
  uint64_t v133 = *(void *)(v0 + 1080);
  uint64_t v134 = *(void *)(v0 + 1072);
  uint64_t v135 = *(void *)(v0 + 1064);
  uint64_t v136 = *(void *)(v0 + 1056);
  uint64_t v137 = *(void *)(v0 + 1048);
  uint64_t v138 = *(void *)(v0 + 1040);
  uint64_t v139 = *(void *)(v0 + 1032);
  uint64_t v140 = *(void *)(v0 + 1024);
  uint64_t v141 = *(void *)(v0 + 1016);
  uint64_t v142 = *(void *)(v0 + 1008);
  uint64_t v143 = *(void *)(v0 + 1000);
  uint64_t v144 = *(void *)(v0 + 992);
  uint64_t v145 = *(void *)(v0 + 984);
  uint64_t v146 = *(void *)(v0 + 976);
  uint64_t v147 = *(void *)(v0 + 952);
  uint64_t v148 = *(void *)(v0 + 928);
  uint64_t v149 = *(void *)(v0 + 920);
  uint64_t v150 = *(void *)(v0 + 912);
  uint64_t v151 = *(void *)(v0 + 904);
  uint64_t v152 = *(void *)(v0 + 896);
  uint64_t v153 = *(void *)(v0 + 864);
  uint64_t v154 = *(void *)(v0 + 840);
  uint64_t v155 = *(void *)(v0 + 832);
  uint64_t v156 = *(void *)(v0 + 824);
  uint64_t v157 = *(void *)(v0 + 792);
  uint64_t v158 = *(void *)(v0 + 784);
  uint64_t v159 = *(void *)(v0 + 776);
  uint64_t v160 = *(void *)(v0 + 768);
  uint64_t v161 = *(void *)(v0 + 736);
  uint64_t v162 = *(void *)(v0 + 728);
  uint64_t v163 = *(void *)(v0 + 720);
  uint64_t v164 = *(void *)(v0 + 712);
  uint64_t v165 = *(void *)(v0 + 704);
  uint64_t v166 = *(void *)(v0 + 696);
  uint64_t v167 = *(void *)(v0 + 688);
  uint64_t v168 = *(void *)(v0 + 656);
  uint64_t v169 = *(void *)(v0 + 648);
  uint64_t v170 = *(void *)(v0 + 640);
  uint64_t v171 = *(void *)(v0 + 632);
  uint64_t v172 = *(void *)(v0 + 624);
  uint64_t v173 = *(void *)(v0 + 616);
  uint64_t v174 = *(void *)(v0 + 584);
  uint64_t v175 = *(void *)(v0 + 576);
  uint64_t v176 = *(void *)(v0 + 552);
  uint64_t v177 = *(void *)(v0 + 544);
  uint64_t v179 = *(void *)(v0 + 536);
  uint64_t v182 = *(void *)(v0 + 504);
  uint64_t v185 = *(void *)(v0 + 496);
  uint64_t v188 = *(void *)(v0 + 488);
  uint64_t v191 = *(void *)(v0 + 480);
  uint64_t v194 = *(void *)(v0 + 448);
  uint64_t v197 = *(void *)(v0 + 440);
  uint64_t v200 = *(void *)(v0 + 432);
  swift_task_dealloc(*(void *)(v0 + 1424));
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v91);
  swift_task_dealloc(v92);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  swift_task_dealloc(v97);
  swift_task_dealloc(v100);
  swift_task_dealloc(v101);
  swift_task_dealloc(v102);
  swift_task_dealloc(v103);
  swift_task_dealloc(v104);
  swift_task_dealloc(v105);
  swift_task_dealloc(v106);
  swift_task_dealloc(v107);
  swift_task_dealloc(v108);
  swift_task_dealloc(v109);
  swift_task_dealloc(v110);
  swift_task_dealloc(v111);
  swift_task_dealloc(v112);
  swift_task_dealloc(v113);
  swift_task_dealloc(v114);
  swift_task_dealloc(v115);
  swift_task_dealloc(v116);
  swift_task_dealloc(v117);
  swift_task_dealloc(v118);
  swift_task_dealloc(v119);
  swift_task_dealloc(v120);
  swift_task_dealloc(v121);
  swift_task_dealloc(v122);
  swift_task_dealloc(v123);
  swift_task_dealloc(v124);
  swift_task_dealloc(v125);
  swift_task_dealloc(v126);
  swift_task_dealloc(v127);
  swift_task_dealloc(v128);
  swift_task_dealloc(v129);
  swift_task_dealloc(v130);
  swift_task_dealloc(v131);
  swift_task_dealloc(v132);
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v135);
  swift_task_dealloc(v136);
  swift_task_dealloc(v137);
  swift_task_dealloc(v138);
  swift_task_dealloc(v139);
  swift_task_dealloc(v140);
  swift_task_dealloc(v141);
  swift_task_dealloc(v142);
  swift_task_dealloc(v143);
  swift_task_dealloc(v144);
  swift_task_dealloc(v145);
  swift_task_dealloc(v146);
  swift_task_dealloc(v147);
  swift_task_dealloc(v148);
  swift_task_dealloc(v149);
  swift_task_dealloc(v150);
  swift_task_dealloc(v151);
  swift_task_dealloc(v152);
  swift_task_dealloc(v153);
  swift_task_dealloc(v154);
  swift_task_dealloc(v155);
  swift_task_dealloc(v156);
  swift_task_dealloc(v157);
  swift_task_dealloc(v158);
  swift_task_dealloc(v159);
  swift_task_dealloc(v160);
  swift_task_dealloc(v161);
  swift_task_dealloc(v162);
  swift_task_dealloc(v163);
  swift_task_dealloc(v164);
  swift_task_dealloc(v165);
  swift_task_dealloc(v166);
  swift_task_dealloc(v167);
  swift_task_dealloc(v168);
  swift_task_dealloc(v169);
  swift_task_dealloc(v170);
  swift_task_dealloc(v171);
  swift_task_dealloc(v172);
  swift_task_dealloc(v173);
  swift_task_dealloc(v174);
  swift_task_dealloc(v175);
  swift_task_dealloc(v176);
  swift_task_dealloc(v177);
  swift_task_dealloc(v179);
  swift_task_dealloc(v182);
  swift_task_dealloc(v185);
  swift_task_dealloc(v188);
  swift_task_dealloc(v191);
  swift_task_dealloc(v194);
  swift_task_dealloc(v197);
  swift_task_dealloc(v200);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v99);
}

uint64_t sub_100024BF0()
{
  uint64_t v1 = *(void *)(v0 + 1904);

  *(void *)(v0 + 264) = v1;
  swift_errorRetain(v1);
  uint64_t v2 = sub_100007B74(&qword_100038890);
  type metadata accessor for CKError(0LL);
  uint64_t v4 = v3;
  char v5 = swift_dynamicCast(v0 + 272, v0 + 264, v2, v3, 0LL);
  uint64_t v6 = *(void *)(v0 + 1904);
  uint64_t v7 = *(void *)(v0 + 1448);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 1440);
  uint64_t v9 = *(void *)(v0 + 1432);
  uint64_t v10 = *(void *)(v0 + 960);
  if ((v5 & 1) != 0)
  {
    uint64_t v11 = *(void *)(v0 + 1016);
    swift_errorRelease(v6);
    uint64_t v12 = *(void **)(v0 + 272);
    v8(v11, v9, v10);
    uint64_t v13 = swift_allocObject(&unk_100036000, 24LL, 7LL);
    *(void *)(v13 + 16) = v12;
    id v14 = v12;
    uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
    os_log_type_t v16 = static os_log_type_t.error.getter();
    uint64_t v17 = swift_allocObject(&unk_100036028, 17LL, 7LL);
    *(_BYTE *)(v17 + 16) = 64;
    uint64_t v18 = swift_allocObject(&unk_100036050, 17LL, 7LL);
    *(_BYTE *)(v18 + 16) = 8;
    uint64_t v19 = swift_allocObject(&unk_100036078, 32LL, 7LL);
    *(void *)(v19 + 16) = sub_10002E250;
    *(void *)(v19 + 24) = v13;
    uint64_t v20 = swift_allocObject(&unk_1000360A0, 32LL, 7LL);
    *(void *)(v20 + 16) = sub_10002CAF8;
    *(void *)(v20 + 24) = v19;
    uint64_t v21 = swift_allocObject(&unk_1000360C8, 32LL, 7LL);
    *(void *)(v21 + 16) = sub_10002E010;
    *(void *)(v21 + 24) = v20;
    uint64_t v22 = swift_allocObject(v7, 80LL, 7LL);
    *(_OWORD *)(v22 + 16) = xmmword_10002FBB0;
    *(void *)(v22 + 32) = sub_10002E258;
    *(void *)(v22 + 40) = v17;
    *(void *)(v22 + 48) = sub_10002E258;
    *(void *)(v22 + 56) = v18;
    *(void *)(v22 + 64) = sub_10002E020;
    *(void *)(v22 + 72) = v21;
    swift_retain(v17);
    swift_retain(v18);
    swift_retain(v21);
    swift_bridgeObjectRelease(v22);
    os_log_type_t v23 = v16;
    uint64_t v200 = v14;
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v25 = (void *)swift_slowAlloc(8LL, -1LL);
      v205[0] = v25;
      v204[0] = 0LL;
      *(_WORD *)uint64_t v24 = 258;
      v24[2] = *(_BYTE *)(v17 + 16);
      swift_release(v17);
      v24[3] = *(_BYTE *)(v18 + 16);
      v203[0] = (uint64_t)(v24 + 4);
      swift_release(v18);
      sub_100029334(v203, v205, (uint64_t)v204, *(uint64_t (**)(void))(v21 + 16));
      uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v0 + 1864);
      uint64_t v27 = *(void *)(v0 + 1016);
      uint64_t v28 = *(void *)(v0 + 960);
      swift_release(v21);
      _os_log_impl((void *)&_mh_execute_header, v15, v23, "CKError: %@", v24, 0xCu);
      uint64_t v29 = sub_100007B74(&qword_1000388A0);
      swift_arrayDestroy(v25, 1LL, v29);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);

      v26(v27, v28);
      id v14 = v200;
    }

    else
    {
      uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v0 + 1864);
      uint64_t v49 = *(void *)(v0 + 1016);
      uint64_t v50 = *(void *)(v0 + 960);
      swift_release(v17);
      swift_release(v18);
      swift_release(v21);

      v48(v49, v50);
    }

    *(void *)(v0 + 288) = v14;
    uint64_t v51 = sub_100009FBC( &qword_100038658,  (uint64_t (*)(uint64_t))type metadata accessor for CKError,  (uint64_t)&unk_10002F67C);
    _BridgedStoredNSError.code.getter(v4, v51);
    if (*(void *)(v0 + 280) == 7LL)
    {
      uint64_t v52 = (*(uint64_t (**)(void, void, void))(v0 + 1440))( *(void *)(v0 + 1008),  *(void *)(v0 + 1432),  *(void *)(v0 + 960));
      uint64_t v53 = (os_log_s *)Logger.logObject.getter(v52);
      os_log_type_t v54 = static os_log_type_t.info.getter();
      BOOL v55 = os_log_type_enabled(v53, v54);
      uint64_t v56 = *(void (**)(uint64_t, uint64_t))(v0 + 1864);
      uint64_t v57 = *(void *)(v0 + 1008);
      uint64_t v58 = *(void *)(v0 + 960);
      if (v55)
      {
        uint64_t v59 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        v205[0] = 0LL;
        v204[0] = 0LL;
        *(_WORD *)uint64_t v59 = 0;
        v203[0] = (uint64_t)(v59 + 2);
        sub_100028DBC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)v203, (uint64_t)v205, (uint64_t)v204);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "Found CloudKit rate-limit, deferring execution.", v59, 2u);
        swift_slowDealloc(v59, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      }

      v56(v57, v58);
      uint64_t v180 = *(void *)(v0 + 1856);
      uint64_t v183 = *(void *)(v0 + 1808);
      uint64_t v81 = *(void **)(v0 + 1544);
      uint64_t v82 = *(void **)(v0 + 1536);
      uint64_t v83 = *(void **)(v0 + 1528);
      uint64_t v84 = *(void **)(v0 + 1520);
      uint64_t v85 = *(void **)(v0 + 1512);
      uint64_t v86 = *(void **)(v0 + 1504);
      uint64_t v87 = *(void *)(v0 + 1496);
      uint64_t v70 = *(void *)(v0 + 1488);
      uint64_t v195 = *(void *)(v0 + 952);
      uint64_t v198 = *(void *)(v0 + 1680);
      uint64_t v186 = *(void *)(v0 + 944);
      uint64_t v189 = *(void *)(v0 + 1800);
      uint64_t v192 = *(void *)(v0 + 936);
      id v88 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v99 = MLHostResult.init(status:policy:)(1LL, 1LL);

      swift_release(v87);
    }

    else
    {
      uint64_t v72 = v14;
      uint64_t v180 = *(void *)(v0 + 1856);
      uint64_t v183 = *(void *)(v0 + 1808);
      uint64_t v73 = *(void **)(v0 + 1544);
      uint64_t v74 = *(void **)(v0 + 1536);
      id v75 = *(void **)(v0 + 1528);
      uint64_t v76 = *(void **)(v0 + 1520);
      uint64_t v77 = *(void **)(v0 + 1512);
      uint64_t v78 = *(void **)(v0 + 1504);
      uint64_t v79 = *(void *)(v0 + 1496);
      uint64_t v177 = *(void *)(v0 + 1488);
      uint64_t v195 = *(void *)(v0 + 952);
      uint64_t v198 = *(void *)(v0 + 1680);
      uint64_t v186 = *(void *)(v0 + 944);
      uint64_t v189 = *(void *)(v0 + 1800);
      uint64_t v192 = *(void *)(v0 + 936);
      v204[3] = &type metadata for CloudError;
      v204[4] = sub_10002CAFC();
      LOBYTE(v204[0]) = 1;
      id v80 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
      uint64_t v99 = MLHostResult.init(error:policy:)(v204, 1LL);

      swift_release(v79);
      uint64_t v70 = v177;
    }

    swift_errorRelease(*(void *)(v0 + 264));
    swift_release(v180);
    swift_release(v183);
    swift_release(v189);
    swift_release(v198);
    sub_100025B68(v70);
    (*(void (**)(uint64_t, uint64_t))(v186 + 8))(v195, v192);
  }

  else
  {
    uint64_t v30 = *(void *)(v0 + 1000);
    swift_errorRelease(*(void *)(v0 + 264));
    v8(v30, v9, v10);
    uint64_t v31 = swift_allocObject(&unk_100035F10, 24LL, 7LL);
    *(void *)(v31 + 16) = v6;
    uint64_t v32 = swift_errorRetain(v6);
    uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
    os_log_type_t v34 = static os_log_type_t.error.getter();
    uint64_t v35 = swift_allocObject(&unk_100035F38, 17LL, 7LL);
    *(_BYTE *)(v35 + 16) = 64;
    uint64_t v36 = swift_allocObject(&unk_100035F60, 17LL, 7LL);
    *(_BYTE *)(v36 + 16) = 8;
    uint64_t v37 = swift_allocObject(&unk_100035F88, 32LL, 7LL);
    *(void *)(v37 + 16) = sub_10002E250;
    *(void *)(v37 + 24) = v31;
    uint64_t v38 = swift_allocObject(&unk_100035FB0, 32LL, 7LL);
    *(void *)(v38 + 16) = sub_10002CAF8;
    *(void *)(v38 + 24) = v37;
    uint64_t v39 = swift_allocObject(&unk_100035FD8, 32LL, 7LL);
    *(void *)(v39 + 16) = sub_10002E010;
    *(void *)(v39 + 24) = v38;
    uint64_t v40 = swift_allocObject(v7, 80LL, 7LL);
    *(_OWORD *)(v40 + 16) = xmmword_10002FBB0;
    *(void *)(v40 + 32) = sub_10002E258;
    *(void *)(v40 + 40) = v35;
    *(void *)(v40 + 48) = sub_10002E258;
    *(void *)(v40 + 56) = v36;
    *(void *)(v40 + 64) = sub_10002E020;
    *(void *)(v40 + 72) = v39;
    swift_retain(v35);
    swift_retain(v36);
    swift_retain(v39);
    swift_bridgeObjectRelease(v40);
    os_log_type_t v41 = v34;
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v43 = (void *)swift_slowAlloc(8LL, -1LL);
      v205[0] = v43;
      v204[0] = 0LL;
      *(_WORD *)uint64_t v42 = 258;
      v42[2] = *(_BYTE *)(v35 + 16);
      swift_release(v35);
      v42[3] = *(_BYTE *)(v36 + 16);
      v203[0] = (uint64_t)(v42 + 4);
      swift_release(v36);
      sub_100029334(v203, v205, (uint64_t)v204, *(uint64_t (**)(void))(v39 + 16));
      os_log_type_t v44 = *(void (**)(uint64_t, uint64_t))(v0 + 1864);
      uint64_t v45 = *(void *)(v0 + 1000);
      uint64_t v46 = *(void *)(v0 + 960);
      swift_release(v39);
      _os_log_impl((void *)&_mh_execute_header, v33, v41, "Error: %@", v42, 0xCu);
      uint64_t v47 = sub_100007B74(&qword_1000388A0);
      swift_arrayDestroy(v43, 1LL, v47);
      swift_slowDealloc(v43, -1LL, -1LL);
      swift_slowDealloc(v42, -1LL, -1LL);

      v44(v45, v46);
    }

    else
    {
      uint64_t v60 = *(void (**)(uint64_t, uint64_t))(v0 + 1864);
      uint64_t v61 = *(void *)(v0 + 1000);
      uint64_t v62 = *(void *)(v0 + 960);
      swift_release(v35);
      swift_release(v36);
      swift_release(v39);

      v60(v61, v62);
    }

    uint64_t v179 = *(void *)(v0 + 1904);
    uint64_t v182 = *(void *)(v0 + 1856);
    uint64_t v63 = *(void **)(v0 + 1544);
    uint64_t v64 = *(void **)(v0 + 1536);
    uint64_t v65 = *(void **)(v0 + 1528);
    uint64_t v66 = *(void **)(v0 + 1520);
    uint64_t v67 = *(void **)(v0 + 1512);
    uint64_t v68 = *(void **)(v0 + 1504);
    uint64_t v69 = *(void *)(v0 + 1496);
    uint64_t v70 = *(void *)(v0 + 1488);
    uint64_t v197 = *(void *)(v0 + 952);
    uint64_t v201 = *(void *)(v0 + 1680);
    uint64_t v185 = *(void *)(v0 + 1808);
    uint64_t v188 = *(void *)(v0 + 944);
    uint64_t v191 = *(void *)(v0 + 1800);
    uint64_t v194 = *(void *)(v0 + 936);
    id v71 = objc_allocWithZone((Class)type metadata accessor for MLHostResult(0LL));
    uint64_t v99 = MLHostResult.init(status:policy:)(0LL, 1LL);

    swift_release(v69);
    swift_errorRelease(v179);
    swift_release(v182);
    swift_release(v185);
    swift_release(v191);
    swift_release(v201);
    sub_100025B68(v70);
    (*(void (**)(uint64_t, uint64_t))(v188 + 8))(v197, v194);
  }

  swift_release(v70);
  uint64_t v89 = *(void *)(v0 + 1416);
  uint64_t v90 = *(void *)(v0 + 1408);
  uint64_t v91 = *(void *)(v0 + 1400);
  uint64_t v92 = *(void *)(v0 + 1392);
  uint64_t v93 = *(void *)(v0 + 1384);
  uint64_t v94 = *(void *)(v0 + 1376);
  uint64_t v95 = *(void *)(v0 + 1368);
  uint64_t v96 = *(void *)(v0 + 1360);
  uint64_t v97 = *(void *)(v0 + 1352);
  uint64_t v100 = *(void *)(v0 + 1344);
  uint64_t v101 = *(void *)(v0 + 1336);
  uint64_t v102 = *(void *)(v0 + 1328);
  uint64_t v103 = *(void *)(v0 + 1320);
  uint64_t v104 = *(void *)(v0 + 1312);
  uint64_t v105 = *(void *)(v0 + 1304);
  uint64_t v106 = *(void *)(v0 + 1296);
  uint64_t v107 = *(void *)(v0 + 1288);
  uint64_t v108 = *(void *)(v0 + 1280);
  uint64_t v109 = *(void *)(v0 + 1272);
  uint64_t v110 = *(void *)(v0 + 1264);
  uint64_t v111 = *(void *)(v0 + 1256);
  uint64_t v112 = *(void *)(v0 + 1248);
  uint64_t v113 = *(void *)(v0 + 1240);
  uint64_t v114 = *(void *)(v0 + 1232);
  uint64_t v115 = *(void *)(v0 + 1224);
  uint64_t v116 = *(void *)(v0 + 1216);
  uint64_t v117 = *(void *)(v0 + 1208);
  uint64_t v118 = *(void *)(v0 + 1200);
  uint64_t v119 = *(void *)(v0 + 1192);
  uint64_t v120 = *(void *)(v0 + 1184);
  uint64_t v121 = *(void *)(v0 + 1176);
  uint64_t v122 = *(void *)(v0 + 1168);
  uint64_t v123 = *(void *)(v0 + 1160);
  uint64_t v124 = *(void *)(v0 + 1152);
  uint64_t v125 = *(void *)(v0 + 1144);
  uint64_t v126 = *(void *)(v0 + 1136);
  uint64_t v127 = *(void *)(v0 + 1128);
  uint64_t v128 = *(void *)(v0 + 1120);
  uint64_t v129 = *(void *)(v0 + 1112);
  uint64_t v130 = *(void *)(v0 + 1104);
  uint64_t v131 = *(void *)(v0 + 1096);
  uint64_t v132 = *(void *)(v0 + 1088);
  uint64_t v133 = *(void *)(v0 + 1080);
  uint64_t v134 = *(void *)(v0 + 1072);
  uint64_t v135 = *(void *)(v0 + 1064);
  uint64_t v136 = *(void *)(v0 + 1056);
  uint64_t v137 = *(void *)(v0 + 1048);
  uint64_t v138 = *(void *)(v0 + 1040);
  uint64_t v139 = *(void *)(v0 + 1032);
  uint64_t v140 = *(void *)(v0 + 1024);
  uint64_t v141 = *(void *)(v0 + 1016);
  uint64_t v142 = *(void *)(v0 + 1008);
  uint64_t v143 = *(void *)(v0 + 1000);
  uint64_t v144 = *(void *)(v0 + 992);
  uint64_t v145 = *(void *)(v0 + 984);
  uint64_t v146 = *(void *)(v0 + 976);
  uint64_t v147 = *(void *)(v0 + 952);
  uint64_t v148 = *(void *)(v0 + 928);
  uint64_t v149 = *(void *)(v0 + 920);
  uint64_t v150 = *(void *)(v0 + 912);
  uint64_t v151 = *(void *)(v0 + 904);
  uint64_t v152 = *(void *)(v0 + 896);
  uint64_t v153 = *(void *)(v0 + 864);
  uint64_t v154 = *(void *)(v0 + 840);
  uint64_t v155 = *(void *)(v0 + 832);
  uint64_t v156 = *(void *)(v0 + 824);
  uint64_t v157 = *(void *)(v0 + 792);
  uint64_t v158 = *(void *)(v0 + 784);
  uint64_t v159 = *(void *)(v0 + 776);
  uint64_t v160 = *(void *)(v0 + 768);
  uint64_t v161 = *(void *)(v0 + 736);
  uint64_t v162 = *(void *)(v0 + 728);
  uint64_t v163 = *(void *)(v0 + 720);
  uint64_t v164 = *(void *)(v0 + 712);
  uint64_t v165 = *(void *)(v0 + 704);
  uint64_t v166 = *(void *)(v0 + 696);
  uint64_t v167 = *(void *)(v0 + 688);
  uint64_t v168 = *(void *)(v0 + 656);
  uint64_t v169 = *(void *)(v0 + 648);
  uint64_t v170 = *(void *)(v0 + 640);
  uint64_t v171 = *(void *)(v0 + 632);
  uint64_t v172 = *(void *)(v0 + 624);
  uint64_t v173 = *(void *)(v0 + 616);
  uint64_t v174 = *(void *)(v0 + 584);
  uint64_t v175 = *(void *)(v0 + 576);
  uint64_t v176 = *(void *)(v0 + 552);
  uint64_t v178 = *(void *)(v0 + 544);
  uint64_t v181 = *(void *)(v0 + 536);
  uint64_t v184 = *(void *)(v0 + 504);
  uint64_t v187 = *(void *)(v0 + 496);
  uint64_t v190 = *(void *)(v0 + 488);
  uint64_t v193 = *(void *)(v0 + 480);
  uint64_t v196 = *(void *)(v0 + 448);
  uint64_t v199 = *(void *)(v0 + 440);
  uint64_t v202 = *(void *)(v0 + 432);
  swift_task_dealloc(*(void *)(v0 + 1424));
  swift_task_dealloc(v89);
  swift_task_dealloc(v90);
  swift_task_dealloc(v91);
  swift_task_dealloc(v92);
  swift_task_dealloc(v93);
  swift_task_dealloc(v94);
  swift_task_dealloc(v95);
  swift_task_dealloc(v96);
  swift_task_dealloc(v97);
  swift_task_dealloc(v100);
  swift_task_dealloc(v101);
  swift_task_dealloc(v102);
  swift_task_dealloc(v103);
  swift_task_dealloc(v104);
  swift_task_dealloc(v105);
  swift_task_dealloc(v106);
  swift_task_dealloc(v107);
  swift_task_dealloc(v108);
  swift_task_dealloc(v109);
  swift_task_dealloc(v110);
  swift_task_dealloc(v111);
  swift_task_dealloc(v112);
  swift_task_dealloc(v113);
  swift_task_dealloc(v114);
  swift_task_dealloc(v115);
  swift_task_dealloc(v116);
  swift_task_dealloc(v117);
  swift_task_dealloc(v118);
  swift_task_dealloc(v119);
  swift_task_dealloc(v120);
  swift_task_dealloc(v121);
  swift_task_dealloc(v122);
  swift_task_dealloc(v123);
  swift_task_dealloc(v124);
  swift_task_dealloc(v125);
  swift_task_dealloc(v126);
  swift_task_dealloc(v127);
  swift_task_dealloc(v128);
  swift_task_dealloc(v129);
  swift_task_dealloc(v130);
  swift_task_dealloc(v131);
  swift_task_dealloc(v132);
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v135);
  swift_task_dealloc(v136);
  swift_task_dealloc(v137);
  swift_task_dealloc(v138);
  swift_task_dealloc(v139);
  swift_task_dealloc(v140);
  swift_task_dealloc(v141);
  swift_task_dealloc(v142);
  swift_task_dealloc(v143);
  swift_task_dealloc(v144);
  swift_task_dealloc(v145);
  swift_task_dealloc(v146);
  swift_task_dealloc(v147);
  swift_task_dealloc(v148);
  swift_task_dealloc(v149);
  swift_task_dealloc(v150);
  swift_task_dealloc(v151);
  swift_task_dealloc(v152);
  swift_task_dealloc(v153);
  swift_task_dealloc(v154);
  swift_task_dealloc(v155);
  swift_task_dealloc(v156);
  swift_task_dealloc(v157);
  swift_task_dealloc(v158);
  swift_task_dealloc(v159);
  swift_task_dealloc(v160);
  swift_task_dealloc(v161);
  swift_task_dealloc(v162);
  swift_task_dealloc(v163);
  swift_task_dealloc(v164);
  swift_task_dealloc(v165);
  swift_task_dealloc(v166);
  swift_task_dealloc(v167);
  swift_task_dealloc(v168);
  swift_task_dealloc(v169);
  swift_task_dealloc(v170);
  swift_task_dealloc(v171);
  swift_task_dealloc(v172);
  swift_task_dealloc(v173);
  swift_task_dealloc(v174);
  swift_task_dealloc(v175);
  swift_task_dealloc(v176);
  swift_task_dealloc(v178);
  swift_task_dealloc(v181);
  swift_task_dealloc(v184);
  swift_task_dealloc(v187);
  swift_task_dealloc(v190);
  swift_task_dealloc(v193);
  swift_task_dealloc(v196);
  swift_task_dealloc(v199);
  swift_task_dealloc(v202);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v99);
}

id sub_100025B00(uint64_t a1, uint64_t a2)
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

  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2)) initWithSuiteName:v4];

  return v5;
}

void sub_100025B68(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CoreAnalyticsEvents(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_100038398 != -1) {
    swift_once(&qword_100038398, sub_10000AF84);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  sub_100007BC8(v6, (uint64_t)qword_1000389C0);
  uint64_t v7 = swift_retain_n(a1, 2LL);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc(12LL, -1LL);
    uint64_t v30 = v2;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v29 = swift_slowAlloc(32LL, -1LL);
    aBlock[0] = v29;
    *(_DWORD *)uint64_t v11 = 136315138;
    v28[1] = v11 + 4;
    swift_beginAccess(a1 + 16, v32, 0LL, 0LL);
    __int128 v12 = *(_OWORD *)(a1 + 96);
    v35[4] = *(_OWORD *)(a1 + 80);
    v35[5] = v12;
    uint64_t v36 = *(void *)(a1 + 112);
    __int128 v13 = *(_OWORD *)(a1 + 32);
    v35[0] = *(_OWORD *)(a1 + 16);
    v35[1] = v13;
    __int128 v14 = *(_OWORD *)(a1 + 64);
    v35[2] = *(_OWORD *)(a1 + 48);
    v35[3] = v14;
    sub_10002DF70((uint64_t)v35);
    unint64_t v15 = sub_100027F54();
    sub_10002DF98((uint64_t)v35);
    uint64_t v16 = sub_10002DFC0(0LL, &qword_100038978, &OBJC_CLASS___NSObject_ptr);
    uint64_t v17 = Dictionary.description.getter(v15, &type metadata for String, v16, &protocol witness table for String);
    unint64_t v19 = v18;
    swift_bridgeObjectRelease(v15);
    uint64_t v31 = sub_100007F10(v17, v19, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, v32);
    swift_release_n(a1, 2LL);
    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "CloudWorker Telemetry: %s", v11, 0xCu);
    uint64_t v20 = v29;
    swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1LL, -1LL);
    uint64_t v21 = v11;
    uint64_t v2 = v30;
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  else
  {

    swift_release_n(a1, 2LL);
  }

  uint64_t v22 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))( v5,  enum case for CoreAnalyticsEvents.cloudWorkerTelemetry(_:),  v2);
  CoreAnalyticsEvents.rawValue.getter(v22);
  uint64_t v24 = v23;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  NSString v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v24);
  aBlock[4] = (uint64_t)sub_10002DF50;
  uint64_t v34 = a1;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_100028D38;
  aBlock[3] = (uint64_t)&unk_100037710;
  uint64_t v26 = _Block_copy(aBlock);
  uint64_t v27 = v34;
  swift_retain(a1);
  swift_release(v27);
  AnalyticsSendEventLazy(v25, v26);
  _Block_release(v26);
}

id sub_100025EC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v3));
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  id v8 = [v6 initWithContainerIdentifier:v7 environment:a3];

  return v8;
}

id sub_100025F3C()
{
  id v0 = [objc_allocWithZone(CKOperationGroup) init];
  NSString v1 = String._bridgeToObjectiveC()();
  [v0 setName:v1];

  return v0;
}

void *sub_100025FA8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10002B8EC(0, v1, 0);
    uint64_t v3 = *(void *)(type metadata accessor for ExtensionRecord(0LL) - 8);
    uint64_t v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    do
    {
      uint64_t v6 = ExtensionRecord.bundleIdentifier.getter();
      uint64_t v8 = v7;
      unint64_t v10 = _swiftEmptyArrayStorage[2];
      unint64_t v9 = _swiftEmptyArrayStorage[3];
      if (v10 >= v9 >> 1) {
        sub_10002B8EC(v9 > 1, v10 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v10 + 1;
      uint64_t v11 = &_swiftEmptyArrayStorage[2 * v10];
      v11[4] = v6;
      v11[5] = v8;
      v4 += v5;
      --v1;
    }

    while (v1);
  }

  return _swiftEmptyArrayStorage;
}

uint64_t sub_1000260A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch(sub_1000260C0, 0LL, 0LL);
}

uint64_t sub_1000260C0()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to CKDatabase.records(matching:inZoneWith:desiredKeys:resultsLimit:)[1]);
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100026134;
  return CKDatabase.records(matching:inZoneWith:desiredKeys:resultsLimit:)( v0[3],  v1,  0LL,  CKQueryOperationMaximumResults);
}

uint64_t sub_100026134(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(void *)(*v3 + 40);
  uint64_t v7 = *v3;
  uint64_t v8 = swift_task_dealloc(v6);
  if (!v2)
  {
    uint64_t v8 = a1;
    uint64_t v9 = a2;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
}

uint64_t sub_100026198(uint64_t a1, uint64_t a2, int *a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  uint64_t v5 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_1000261FC;
  return v7(a2);
}

uint64_t sub_1000261FC(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *(void *)(*v3 + 24);
  uint64_t v8 = *v3;
  swift_task_dealloc(v7);
  if (!v2)
  {
    uint64_t v9 = *(void **)(v6 + 16);
    *uint64_t v9 = a1;
    v9[1] = a2;
  }

  return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t sub_10002625C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)(v20, *(void *)(a3 + 40));
    String.hash(into:)(v20, a1, a2);
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1LL << *(_BYTE *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if (((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0)
    {
      uint64_t v10 = *(void *)(a3 + 48);
      uint64_t v11 = (void *)(v10 + 16 * v8);
      uint64_t v12 = v11[1];
      BOOL v13 = *v11 == a1 && v12 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v11, v12, a1, a2, 0LL) & 1) != 0) {
        return 1LL;
      }
      uint64_t v15 = ~v7;
      unint64_t v16 = (v8 + 1) & v15;
      if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) != 0)
      {
        while (1)
        {
          uint64_t v17 = (void *)(v10 + 16 * v16);
          uint64_t v18 = v17[1];
          BOOL v19 = *v17 == a1 && v18 == a2;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0) {
            break;
          }
          uint64_t result = 0LL;
          unint64_t v16 = (v16 + 1) & v15;
          if (((*(void *)(v9 + ((v16 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v16) & 1) == 0) {
            return result;
          }
        }

        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_100026390(double a1)
{
  uint64_t v3 = (void *)*v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((result & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100029184(0LL, v3[2] + 1LL, 1, v3);
    uint64_t v3 = (void *)result;
  }

  unint64_t v6 = v3[2];
  unint64_t v5 = v3[3];
  if (v6 >= v5 >> 1)
  {
    uint64_t result = (uint64_t)sub_100029184((void *)(v5 > 1), v6 + 1, 1, v3);
    uint64_t v3 = (void *)result;
  }

  v3[2] = v6 + 1;
  *(double *)&v3[v6 + 4] = a1;
  void *v1 = v3;
  return result;
}

uint64_t sub_10002642C(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  unint64_t v7 = *v3;
  if ((swift_isUniquelyReferenced_nonNull_native(*v3) & 1) == 0) {
    unint64_t v7 = sub_100028F78(0, *(void *)(v7 + 16) + 1LL, 1, v7, a2, a3);
  }
  unint64_t v9 = *(void *)(v7 + 16);
  unint64_t v8 = *(void *)(v7 + 24);
  if (v9 >= v8 >> 1) {
    unint64_t v7 = sub_100028F78(v8 > 1, v9 + 1, 1, v7, a2, a3);
  }
  *(void *)(v7 + 16) = v9 + 1;
  uint64_t v10 = a3(0LL);
  uint64_t result = sub_10002DAD8( a1,  v7 + ((*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v10 - 8) + 80LL))
           + *(void *)(*(void *)(v10 - 8) + 72LL) * v9,
             a3);
  unint64_t *v3 = v7;
  return result;
}

BOOL sub_100026510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = sub_100009FBC( &qword_100038900,  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  (uint64_t)&protocol conformance descriptor for Date);
  return (dispatch thunk of static Comparable.< infix(_:_:)(a2, a1, v4, v5) & 1) == 0;
}

uint64_t sub_100026580(uint64_t a1)
{
  uint64_t v2 = swift_bridgeObjectRetain(a1);
  uint64_t v3 = sub_100029748(v2);
  swift_bridgeObjectRelease(a1);
  uint64_t v5 = v3;
  sub_1000299B8((uint64_t *)&v5, sub_10002C758, sub_100029A30);
  return (uint64_t)v5;
}

uint64_t sub_1000265F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch(sub_10002660C, 0LL, 0LL);
}

uint64_t sub_10002660C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)swift_task_alloc(async function pointer to CKDatabase.records(matching:inZoneWith:desiredKeys:resultsLimit:)[1]);
  v0[5] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10002E25C;
  return CKDatabase.records(matching:inZoneWith:desiredKeys:resultsLimit:)( v0[3],  v1,  0LL,  CKQueryOperationMaximumResults);
}

uint64_t sub_100026680@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain_n(v4, 2LL);
  uint64_t v5 = sub_100029748(v4);
  swift_bridgeObjectRelease(v4);
  unint64_t v7 = v5;
  sub_1000299B8((uint64_t *)&v7, sub_10002C758, sub_100029A30);
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v7;
  return result;
}

uint64_t sub_100026728@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v6 = type metadata accessor for MLHostTask(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  unint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = *(void *)(a2 + 16);
  if (v10)
  {
    uint64_t v18 = a3;
    uint64_t v11 = a2 + ((*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    uint64_t v12 = *(void *)(v7 + 72);
    uint64_t v13 = a2;
    __int128 v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    uint64_t v19 = v13;
    swift_bridgeObjectRetain();
    while (1)
    {
      v14(v9, v11, v6);
      char v15 = v20(v9);
      if (v3)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
        return swift_bridgeObjectRelease(v19);
      }

      if ((v15 & 1) != 0) {
        break;
      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      v11 += v12;
      if (!--v10)
      {
        swift_bridgeObjectRelease(v19);
        uint64_t v16 = 1LL;
        a3 = v18;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a3, v16, 1LL, v6);
      }
    }

    swift_bridgeObjectRelease(v19);
    a3 = v18;
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v18, v9, v6);
    uint64_t v16 = 0LL;
  }

  else
  {
    uint64_t v16 = 1LL;
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a3, v16, 1LL, v6);
}

uint64_t sub_1000268A0(uint64_t a1, void *a2)
{
  uint64_t v3 = MLHostTask.name.getter();
  uint64_t v5 = v4;
  uint64_t v6 = a2[1];
  if (v3 == *a2 && v4 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, *a2, v6, 0LL);
  }
  swift_bridgeObjectRelease(v5);
  return v8 & 1;
}

uint64_t sub_10002690C(uint64_t a1, uint64_t a2)
{
  uint64_t v190 = type metadata accessor for URL(0LL);
  uint64_t v192 = *(void *)(v190 - 8);
  __chkstk_darwin(v190);
  uint64_t v189 = (char *)&v179 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for ArchiveFlags(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v187 = (char *)&v179 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  unint64_t v9 = (char *)&v179 - v8;
  uint64_t v10 = type metadata accessor for FilePath(0LL);
  uint64_t v197 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v184 = (char *)&v179 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v11);
  char v15 = (char *)&v179 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v179 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v191 = (char *)&v179 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v185 = (char *)&v179 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  NSString v25 = (char *)&v179 - v24;
  __chkstk_darwin(v23);
  uint64_t v27 = (char *)&v179 - v26;
  Swift::String v28 = URL.path(percentEncoded:)(0);
  FilePath.init(_:)(v28._countAndFlagsBits, v28._object);
  uint64_t v188 = a2;
  Swift::String v29 = URL.path(percentEncoded:)(0);
  uint64_t v196 = v25;
  FilePath.init(_:)(v29._countAndFlagsBits, v29._object);
  type metadata accessor for ArchiveByteStream(0LL);
  uint64_t v195 = v27;
  uint64_t v30 = static ArchiveByteStream.fileStream(path:mode:options:permissions:)(v27, 0LL, 0LL, 420LL);
  if (!v30)
  {
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v62 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v62, (uint64_t)qword_1000389C0);
    uint64_t v63 = v197;
    uint64_t v64 = v195;
    uint64_t v65 = (*(uint64_t (**)(char *, char *, uint64_t))(v197 + 16))(v15, v195, v10);
    uint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
    os_log_type_t v67 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v66, v67))
    {
      uint64_t v68 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v69 = (void *)swift_slowAlloc(32LL, -1LL);
      uint64_t v199 = v69;
      *(_DWORD *)uint64_t v68 = 136315138;
      uint64_t v70 = sub_100009FBC( &qword_100038920,  (uint64_t (*)(uint64_t))&type metadata accessor for FilePath,  (uint64_t)&protocol conformance descriptor for FilePath);
      uint64_t v71 = dispatch thunk of CustomStringConvertible.description.getter(v10, v70);
      unint64_t v73 = v72;
      uint64_t v198 = sub_100007F10(v71, v72, (uint64_t *)&v199);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v198, &v199);
      swift_bridgeObjectRelease(v73);
      uint64_t v74 = *(void (**)(char *, uint64_t))(v197 + 8);
      v74(v15, v10);
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Failed at reading archive: %s", v68, 0xCu);
      swift_arrayDestroy(v69, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v69, -1LL, -1LL);
      swift_slowDealloc(v68, -1LL, -1LL);
    }

    else
    {

      uint64_t v74 = *(void (**)(char *, uint64_t))(v63 + 8);
      v74(v15, v10);
    }

    v74(v196, v10);
    v74(v64, v10);
    return 0LL;
  }

  uint64_t v31 = v30;
  uint64_t v194 = v10;
  uint64_t v199 = _swiftEmptyArrayStorage;
  uint64_t v32 = sub_100009FBC( &qword_100038928,  (uint64_t (*)(uint64_t))&type metadata accessor for ArchiveFlags,  (uint64_t)&protocol conformance descriptor for ArchiveFlags);
  uint64_t v33 = sub_100007B74(&qword_100038930);
  uint64_t v34 = sub_10002DF08(&qword_100038938, &qword_100038930, (uint64_t)&protocol conformance descriptor for [A]);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v199, v33, v34, v4, v32);
  uint64_t v193 = v31;
  uint64_t v35 = static ArchiveByteStream.decompressionStream(readingFrom:flags:threadCount:)(v31, v9, 0LL);
  uint64_t v36 = v5;
  uint64_t v37 = *(void (**)(char *, uint64_t))(v5 + 8);
  v37(v9, v4);
  if (!v35)
  {
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v75 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v75, (uint64_t)qword_1000389C0);
    uint64_t v76 = v197;
    uint64_t v77 = v194;
    uint64_t v78 = v195;
    uint64_t v79 = (*(uint64_t (**)(char *, char *, uint64_t))(v197 + 16))(v18, v195, v194);
    id v80 = (os_log_s *)Logger.logObject.getter(v79);
    os_log_type_t v81 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v80, v81))
    {
      uint64_t v82 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v83 = (void *)swift_slowAlloc(32LL, -1LL);
      uint64_t v199 = v83;
      *(_DWORD *)uint64_t v82 = 136315138;
      uint64_t v84 = sub_100009FBC( &qword_100038920,  (uint64_t (*)(uint64_t))&type metadata accessor for FilePath,  (uint64_t)&protocol conformance descriptor for FilePath);
      uint64_t v85 = dispatch thunk of CustomStringConvertible.description.getter(v77, v84);
      unint64_t v87 = v86;
      uint64_t v198 = sub_100007F10(v85, v86, (uint64_t *)&v199);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v198, &v199);
      swift_bridgeObjectRelease(v87);
      id v88 = *(void (**)(char *, uint64_t))(v197 + 8);
      v88(v18, v77);
      _os_log_impl((void *)&_mh_execute_header, v80, v81, "Failed at decompressing archive: %s", v82, 0xCu);
      swift_arrayDestroy(v83, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v83, -1LL, -1LL);
      swift_slowDealloc(v82, -1LL, -1LL);
    }

    else
    {
      id v88 = *(void (**)(char *, uint64_t))(v76 + 8);
      v88(v18, v77);
    }

    uint64_t v105 = v193;
    ((void (*)(void))dispatch thunk of ArchiveByteStream.close())();
    uint64_t v106 = v196;
    swift_release(v105);
    v88(v106, v77);
    v88(v78, v77);
    return 0LL;
  }

  uint64_t v38 = type metadata accessor for ArchiveStream(0LL);
  uint64_t v199 = _swiftEmptyArrayStorage;
  uint64_t v182 = v34;
  uint64_t v183 = v33;
  uint64_t v186 = v37;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v199, v33, v34, v4, v32);
  uint64_t v181 = v38;
  uint64_t v39 = static ArchiveStream.decodeStream(readingFrom:selectUsing:flags:threadCount:)(v35, 0LL, 0LL, v9, 0LL);
  v186(v9, v4);
  if (!v39)
  {
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v89 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v89, (uint64_t)qword_1000389C0);
    uint64_t v90 = v197;
    uint64_t v91 = v191;
    uint64_t v93 = v194;
    uint64_t v92 = v195;
    uint64_t v94 = (*(uint64_t (**)(char *, char *, uint64_t))(v197 + 16))(v191, v195, v194);
    uint64_t v95 = (os_log_s *)Logger.logObject.getter(v94);
    os_log_type_t v96 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v95, v96))
    {
      uint64_t v97 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v98 = (void *)swift_slowAlloc(32LL, -1LL);
      uint64_t v199 = v98;
      *(_DWORD *)uint64_t v97 = 136315138;
      uint64_t v99 = sub_100009FBC( &qword_100038920,  (uint64_t (*)(uint64_t))&type metadata accessor for FilePath,  (uint64_t)&protocol conformance descriptor for FilePath);
      uint64_t v100 = dispatch thunk of CustomStringConvertible.description.getter(v93, v99);
      unint64_t v102 = v101;
      uint64_t v198 = sub_100007F10(v100, v101, (uint64_t *)&v199);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v198, &v199);
      swift_bridgeObjectRelease(v102);
      uint64_t v103 = *(void (**)(char *, uint64_t))(v197 + 8);
      v103(v91, v93);
      _os_log_impl((void *)&_mh_execute_header, v95, v96, "Failed at decoding archive: %s", v97, 0xCu);
      swift_arrayDestroy(v98, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v104 = v98;
      uint64_t v92 = v195;
      swift_slowDealloc(v104, -1LL, -1LL);
      swift_slowDealloc(v97, -1LL, -1LL);
    }

    else
    {
      uint64_t v103 = *(void (**)(char *, uint64_t))(v90 + 8);
      v103(v91, v93);
    }

    uint64_t v107 = v193;
    ((void (*)(void))dispatch thunk of ArchiveByteStream.close())();
    uint64_t v108 = swift_release(v35);
    dispatch thunk of ArchiveByteStream.close()(v108);
    swift_release(v107);
    v103(v196, v93);
    v103(v92, v93);
    return 0LL;
  }

  uint64_t v191 = (char *)v32;
  uint64_t v180 = v35;
  uint64_t v40 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v41 = [v40 defaultManager];
  uint64_t v42 = v196;
  FilePath.string.getter();
  uint64_t v44 = v43;
  NSString v45 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v44);
  LOBYTE(v44) = [v41 fileExistsAtPath:v45];

  if ((v44 & 1) == 0)
  {
    id v46 = [v40 defaultManager];
    FilePath.string.getter();
    uint64_t v48 = v47;
    NSString v49 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v48);
    uint64_t v199 = 0LL;
    unsigned int v50 = [v46 createDirectoryAtPath:v49 withIntermediateDirectories:1 attributes:0 error:&v199];

    uint64_t v51 = v199;
    if (!v50)
    {
      uint64_t v191 = (char *)v39;
      uint64_t v130 = v199;
      uint64_t v131 = _convertNSErrorToError(_:)(v51);

      swift_willThrow();
      if (qword_100038398 != -1) {
        swift_once(&qword_100038398, sub_10000AF84);
      }
      uint64_t v132 = type metadata accessor for Logger(0LL);
      sub_100007BC8(v132, (uint64_t)qword_1000389C0);
      uint64_t v134 = v196;
      uint64_t v133 = v197;
      uint64_t v135 = v184;
      uint64_t v136 = v194;
      uint64_t v137 = (*(uint64_t (**)(char *, char *, uint64_t))(v197 + 16))(v184, v196, v194);
      uint64_t v138 = (os_log_s *)Logger.logObject.getter(v137);
      os_log_type_t v139 = static os_log_type_t.error.getter();
      BOOL v140 = os_log_type_enabled(v138, v139);
      uint64_t v141 = v195;
      if (v140)
      {
        uint64_t v142 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v143 = (void *)swift_slowAlloc(32LL, -1LL);
        uint64_t v199 = v143;
        *(_DWORD *)uint64_t v142 = 136315138;
        uint64_t v144 = sub_100009FBC( &qword_100038920,  (uint64_t (*)(uint64_t))&type metadata accessor for FilePath,  (uint64_t)&protocol conformance descriptor for FilePath);
        uint64_t v145 = dispatch thunk of CustomStringConvertible.description.getter(v136, v144);
        unint64_t v147 = v146;
        uint64_t v198 = sub_100007F10(v145, v146, (uint64_t *)&v199);
        uint64_t v134 = v196;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v198, &v199);
        swift_bridgeObjectRelease(v147);
        uint64_t v148 = *(void (**)(char *, uint64_t))(v197 + 8);
        v148(v135, v136);
        _os_log_impl((void *)&_mh_execute_header, v138, v139, "Unable to create destination directory: %s", v142, 0xCu);
        swift_arrayDestroy(v143, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v143, -1LL, -1LL);
        uint64_t v149 = v142;
        uint64_t v141 = v195;
        swift_slowDealloc(v149, -1LL, -1LL);
      }

      else
      {
        uint64_t v148 = *(void (**)(char *, uint64_t))(v133 + 8);
        v148(v135, v136);
      }

      swift_errorRelease(v131);

      uint64_t v176 = v193;
      ((void (*)(void))dispatch thunk of ArchiveStream.close())();
      uint64_t v177 = swift_release(v191);
      dispatch thunk of ArchiveByteStream.close()(v177);
      uint64_t v178 = swift_release(v180);
      dispatch thunk of ArchiveByteStream.close()(v178);
      swift_release(v176);
      v148(v134, v136);
      v148(v141, v136);
      return 0LL;
    }

    uint64_t v52 = v199;
    uint64_t v42 = v196;
  }

  uint64_t v53 = (char *)v39;
  uint64_t v54 = sub_100007B74(&qword_100038940);
  BOOL v55 = (_OWORD *)swift_allocObject( v54,  ((*(unsigned __int8 *)(v36 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))
                  + *(void *)(v36 + 72),
                    *(unsigned __int8 *)(v36 + 80) | 7LL);
  v55[1] = xmmword_10002FBE0;
  static ArchiveFlags.ignoreOperationNotPermitted.getter();
  uint64_t v199 = v55;
  uint64_t v57 = v182;
  uint64_t v56 = v183;
  uint64_t v58 = v191;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v199, v183, v182, v4, v191);
  uint64_t v59 = static ArchiveStream.extractStream(extractingTo:selectUsing:flags:threadCount:)(v42, 0LL, 0LL, v9, 0LL);
  v186(v9, v4);
  if (!v59)
  {
    if (qword_100038398 != -1) {
      swift_once(&qword_100038398, sub_10000AF84);
    }
    uint64_t v109 = type metadata accessor for Logger(0LL);
    sub_100007BC8(v109, (uint64_t)qword_1000389C0);
    uint64_t v110 = v197;
    uint64_t v111 = v185;
    uint64_t v112 = v42;
    uint64_t v113 = v194;
    uint64_t v114 = (*(uint64_t (**)(char *, char *, uint64_t))(v197 + 16))(v185, v112, v194);
    uint64_t v115 = (os_log_s *)Logger.logObject.getter(v114);
    os_log_type_t v116 = static os_log_type_t.error.getter();
    BOOL v117 = os_log_type_enabled(v115, v116);
    uint64_t v118 = v195;
    if (v117)
    {
      uint64_t v119 = swift_slowAlloc(12LL, -1LL);
      uint64_t v191 = v53;
      uint64_t v120 = (uint8_t *)v119;
      uint64_t v121 = (void *)swift_slowAlloc(32LL, -1LL);
      uint64_t v199 = v121;
      *(_DWORD *)uint64_t v120 = 136315138;
      uint64_t v122 = sub_100009FBC( &qword_100038920,  (uint64_t (*)(uint64_t))&type metadata accessor for FilePath,  (uint64_t)&protocol conformance descriptor for FilePath);
      uint64_t v123 = dispatch thunk of CustomStringConvertible.description.getter(v113, v122);
      unint64_t v125 = v124;
      uint64_t v198 = sub_100007F10(v123, v124, (uint64_t *)&v199);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v198, &v199);
      swift_bridgeObjectRelease(v125);
      uint64_t v126 = *(void (**)(char *, uint64_t))(v197 + 8);
      v126(v111, v113);
      _os_log_impl((void *)&_mh_execute_header, v115, v116, "Failed at creating extractStream: %s", v120, 0xCu);
      swift_arrayDestroy(v121, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v121, -1LL, -1LL);
      uint64_t v127 = v191;
      swift_slowDealloc(v120, -1LL, -1LL);

      uint64_t v128 = v193;
      uint64_t v129 = v180;
    }

    else
    {
      uint64_t v126 = *(void (**)(char *, uint64_t))(v110 + 8);
      v126(v111, v113);

      uint64_t v128 = v193;
      uint64_t v129 = v180;
      uint64_t v127 = v53;
    }

    ((void (*)(void))dispatch thunk of ArchiveStream.close())();
    uint64_t v174 = swift_release(v127);
    dispatch thunk of ArchiveByteStream.close()(v174);
    uint64_t v175 = swift_release(v129);
    dispatch thunk of ArchiveByteStream.close()(v175);
    swift_release(v128);
    v126(v196, v113);
    v126(v118, v113);
    return 0LL;
  }

  uint64_t v199 = _swiftEmptyArrayStorage;
  uint64_t v60 = v187;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v199, v56, v57, v4, v58);
  uint64_t v191 = v53;
  static ArchiveStream.process(readingFrom:writingTo:selectUsing:flags:threadCount:)(v53, v59, 0LL, 0LL, v60, 0LL);
  uint64_t v61 = v42;
  v186(v60, v4);
  uint64_t v150 = v194;
  uint64_t v152 = v189;
  uint64_t v151 = v190;
  uint64_t v153 = v192;
  if (qword_100038398 != -1) {
    swift_once(&qword_100038398, sub_10000AF84);
  }
  uint64_t v154 = type metadata accessor for Logger(0LL);
  sub_100007BC8(v154, (uint64_t)qword_1000389C0);
  uint64_t v155 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v153 + 16))(v152, v188, v151);
  uint64_t v156 = (os_log_s *)Logger.logObject.getter(v155);
  os_log_type_t v157 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v156, v157))
  {
    uint64_t v158 = v151;
    uint64_t v159 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v160 = (void *)swift_slowAlloc(32LL, -1LL);
    uint64_t v199 = v160;
    *(_DWORD *)uint64_t v159 = 136315138;
    uint64_t v190 = v59;
    uint64_t v161 = sub_100009FBC( &qword_100038948,  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  (uint64_t)&protocol conformance descriptor for URL);
    uint64_t v162 = dispatch thunk of CustomStringConvertible.description.getter(v158, v161);
    unint64_t v164 = v163;
    uint64_t v198 = sub_100007F10(v162, v163, (uint64_t *)&v199);
    uint64_t v59 = v190;
    uint64_t v61 = v196;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v198, &v199);
    swift_bridgeObjectRelease(v164);
    uint64_t v165 = v158;
    uint64_t v150 = v194;
    (*(void (**)(char *, uint64_t))(v192 + 8))(v152, v165);
    _os_log_impl((void *)&_mh_execute_header, v156, v157, "Decompression completed: %s", v159, 0xCu);
    swift_arrayDestroy(v160, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v160, -1LL, -1LL);
    swift_slowDealloc(v159, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v153 + 8))(v152, v151);
  }

  uint64_t v166 = v193;
  uint64_t v167 = v197;
  ((void (*)(void))dispatch thunk of ArchiveStream.close())();
  uint64_t v168 = swift_release(v59);
  dispatch thunk of ArchiveStream.close()(v168);
  uint64_t v169 = v180;
  uint64_t v170 = swift_release(v191);
  dispatch thunk of ArchiveByteStream.close()(v170);
  uint64_t v171 = swift_release(v169);
  dispatch thunk of ArchiveByteStream.close()(v171);
  swift_release(v166);
  uint64_t v172 = *(void (**)(char *, uint64_t))(v167 + 8);
  v172(v61, v150);
  v172(v195, v150);
  return 1LL;
}

uint64_t sub_100027CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc(async function pointer to MLHostExtension.shouldRun(context:)[1]);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10002E024;
  return MLHostExtension.shouldRun(context:)(a1, a2, a3);
}

uint64_t sub_100027D64(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v5 = (void *)swift_task_alloc(dword_1000387EC);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100027DB8;
  return sub_10000B3A8(a1, v4);
}

uint64_t sub_100027DB8(uint64_t a1)
{
  uint64_t v4 = *v1;
  swift_task_dealloc(*(void *)(*v1 + 16));
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_100027E08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char v15 = (void *)swift_task_alloc(async function pointer to MLHostExtension.loadConfig<A>(context:)[1]);
  *(void *)(v7 + 16) = v15;
  *char v15 = v7;
  v15[1] = sub_100027EA4;
  return MLHostExtension.loadConfig<A>(context:)(a1, a2, a6, a3, a7, a4, a5);
}

uint64_t sub_100027EA4()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100027EEC(uint64_t a1)
{
  unint64_t v2 = sub_100028C58();
  return MLHostExtension.configuration.getter(a1, v2);
}

uint64_t sub_100027F24@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = MLHostClient.__allocating_init()();
  *a1 = result;
  return result;
}

unint64_t sub_100027F54()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for BucketInterval(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = (*(uint64_t (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for BucketInterval.hour(_:), v2);
  BucketInterval.rawValue.getter(v6);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  unint64_t v7 = sub_100028588((uint64_t)_swiftEmptyArrayStorage);
  Class isa = Int._bridgeToObjectiveC()().super.super.isa;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
  unint64_t v65 = v7;
  sub_10002C250((uint64_t)isa, 0xD000000000000013LL, 0x8000000100030220LL, isUniquelyReferenced_nonNull_native);
  unint64_t v10 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v11 = Int._bridgeToObjectiveC()().super.super.isa;
  char v12 = swift_isUniquelyReferenced_nonNull_native(v10);
  unint64_t v65 = v10;
  sub_10002C250((uint64_t)v11, 0xD00000000000001ALL, 0x8000000100030240LL, v12);
  unint64_t v13 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v14 = Int._bridgeToObjectiveC()().super.super.isa;
  char v15 = swift_isUniquelyReferenced_nonNull_native(v13);
  unint64_t v65 = v13;
  sub_10002C250((uint64_t)v14, 0xD00000000000001ALL, 0x8000000100030260LL, v15);
  unint64_t v16 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v17 = Int._bridgeToObjectiveC()().super.super.isa;
  char v18 = swift_isUniquelyReferenced_nonNull_native(v16);
  unint64_t v65 = v16;
  sub_10002C250((uint64_t)v17, 0xD000000000000024LL, 0x8000000100030280LL, v18);
  unint64_t v19 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v20 = Int._bridgeToObjectiveC()().super.super.isa;
  char v21 = swift_isUniquelyReferenced_nonNull_native(v19);
  unint64_t v65 = v19;
  sub_10002C250((uint64_t)v20, 0xD00000000000002ALL, 0x80000001000302B0LL, v21);
  unint64_t v22 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v23 = Int._bridgeToObjectiveC()().super.super.isa;
  char v24 = swift_isUniquelyReferenced_nonNull_native(v22);
  unint64_t v65 = v22;
  sub_10002C250((uint64_t)v23, 0xD000000000000018LL, 0x80000001000302E0LL, v24);
  unint64_t v25 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v26 = Int._bridgeToObjectiveC()().super.super.isa;
  char v27 = swift_isUniquelyReferenced_nonNull_native(v25);
  unint64_t v65 = v25;
  sub_10002C250((uint64_t)v26, 0xD00000000000001FLL, 0x8000000100030300LL, v27);
  unint64_t v28 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v29 = Int._bridgeToObjectiveC()().super.super.isa;
  char v30 = swift_isUniquelyReferenced_nonNull_native(v28);
  unint64_t v65 = v28;
  sub_10002C250((uint64_t)v29, 0xD00000000000001FLL, 0x8000000100030320LL, v30);
  unint64_t v31 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v32 = Int._bridgeToObjectiveC()().super.super.isa;
  char v33 = swift_isUniquelyReferenced_nonNull_native(v31);
  unint64_t v65 = v31;
  sub_10002C250((uint64_t)v32, 0xD00000000000001ALL, 0x8000000100030340LL, v33);
  unint64_t v34 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v35 = Int._bridgeToObjectiveC()().super.super.isa;
  char v36 = swift_isUniquelyReferenced_nonNull_native(v34);
  unint64_t v65 = v34;
  sub_10002C250((uint64_t)v35, 0xD00000000000001ALL, 0x8000000100030360LL, v36);
  unint64_t v37 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v38 = Int._bridgeToObjectiveC()().super.super.isa;
  char v39 = swift_isUniquelyReferenced_nonNull_native(v37);
  unint64_t v65 = v37;
  sub_10002C250((uint64_t)v38, 0xD00000000000001ALL, 0x8000000100030380LL, v39);
  unint64_t v40 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  Class v41 = Double._bridgeToObjectiveC()().super.super.isa;
  char v42 = swift_isUniquelyReferenced_nonNull_native(v40);
  unint64_t v65 = v40;
  sub_10002C250((uint64_t)v41, 0xD00000000000001BLL, 0x80000001000303A0LL, v42);
  unint64_t v43 = v65;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  uint64_t v44 = *(void *)(v1 + 96);
  sub_1000286A0(v44);
  if ((v45 & 1) == 0)
  {
    Class v46 = Double._bridgeToObjectiveC()().super.super.isa;
    char v47 = swift_isUniquelyReferenced_nonNull_native(v43);
    unint64_t v65 = v43;
    sub_10002C250((uint64_t)v46, 0xD000000000000012LL, 0x8000000100030450LL, v47);
    unint64_t v48 = v65;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    Class v49 = Double._bridgeToObjectiveC()().super.super.isa;
    char v50 = swift_isUniquelyReferenced_nonNull_native(v48);
    unint64_t v65 = v48;
    sub_10002C250((uint64_t)v49, 0xD00000000000001BLL, 0x8000000100030470LL, v50);
    unint64_t v43 = v65;
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  sub_100028700(v44);
  if ((v51 & 1) == 0)
  {
    Class v52 = Double._bridgeToObjectiveC()().super.super.isa;
    char v53 = swift_isUniquelyReferenced_nonNull_native(v43);
    unint64_t v65 = v43;
    sub_10002C250((uint64_t)v52, 0xD000000000000014LL, 0x8000000100030410LL, v53);
    unint64_t v54 = v65;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    Class v55 = Double._bridgeToObjectiveC()().super.super.isa;
    char v56 = swift_isUniquelyReferenced_nonNull_native(v54);
    unint64_t v65 = v54;
    sub_10002C250((uint64_t)v55, 0xD00000000000001DLL, 0x8000000100030430LL, v56);
    unint64_t v43 = v65;
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  sub_1000287D8(v44);
  if ((v57 & 1) == 0)
  {
    Class v58 = Double._bridgeToObjectiveC()().super.super.isa;
    char v59 = swift_isUniquelyReferenced_nonNull_native(v43);
    unint64_t v65 = v43;
    sub_10002C250((uint64_t)v58, 0xD00000000000001FLL, 0x80000001000303C0LL, v59);
    unint64_t v60 = v65;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    Class v61 = Double._bridgeToObjectiveC()().super.super.isa;
    char v62 = swift_isUniquelyReferenced_nonNull_native(v60);
    unint64_t v65 = v60;
    sub_10002C250((uint64_t)v61, 0xD000000000000028LL, 0x80000001000303E0LL, v62);
    unint64_t v43 = v65;
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  return v43;
}

unint64_t sub_100028588(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100007B74(&qword_100038980);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v6 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v7 = (uint64_t)*(v6 - 2);
    uint64_t v8 = (uint64_t)*(v6 - 1);
    unint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    id v10 = v9;
    unint64_t result = sub_100008550(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    unint64_t v13 = (uint64_t *)(v4[6] + 16 * result);
    *unint64_t v13 = v7;
    v13[1] = v8;
    *(void *)(v4[7] + 8 * result) = v10;
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1000286A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0LL;
  }
  double v2 = *(double *)(a1 + 32) + 0.0;
  if (v1 != 1)
  {
    uint64_t v3 = 0LL;
    do
    {
      double v2 = v2 + (*(double *)(a1 + 40 + 8 * v3) - v2) / (double)(v3 + 2);
      ++v3;
    }

    while (v1 - 1 != v3);
  }

  return *(void *)&v2;
}

uint64_t sub_100028700(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (!v1)
  {
    double v8 = 0.0;
    return *(void *)&v8;
  }

  uint64_t v10 = a1;
  swift_bridgeObjectRetain(a1);
  sub_1000299B8(&v10, sub_10002C76C, sub_10002A118);
  uint64_t v2 = v10;
  unint64_t v3 = v1 >> 1;
  unint64_t v4 = *(void *)(v10 + 16);
  if ((v1 & 1) != 0)
  {
    if (v1 >> 1 < v4)
    {
      double v8 = *(double *)(v10 + 8 * v3 + 32);
      swift_release(v10);
      return *(void *)&v8;
    }

    goto LABEL_11;
  }

  if (v1 >> 1 >= v4)
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if (v1 >= 2)
  {
    uint64_t v5 = v10 + 8 * v3;
    double v7 = *(double *)(v5 + 24);
    double v6 = *(double *)(v5 + 32);
    swift_release(v10);
    double v8 = (v6 + v7) * 0.5;
    return *(void *)&v8;
  }

LABEL_12:
  __break(1u);
  uint64_t result = swift_release(v2);
  __break(1u);
  return result;
}

uint64_t sub_1000287D8(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (v1 < 2) {
    return 0LL;
  }
  uint64_t v2 = 0LL;
  double v3 = *(double *)(result + 32) + 0.0;
  unint64_t v4 = v1 - 1;
  while (v4 != v2)
  {
    double v3 = v3 + (*(double *)(result + 40 + 8 * v2) - v3) / (double)(v2 + 2);
    if (v4 == ++v2)
    {
      if (v1 < 4)
      {
        uint64_t v5 = 0LL;
        double v6 = 0.0;
        goto LABEL_11;
      }

      uint64_t v5 = v1 & 0x7FFFFFFFFFFFFFFCLL;
      float64x2_t v7 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v3, 0);
      double v8 = (float64x2_t *)(result + 48);
      double v6 = 0.0;
      uint64_t v9 = v1 & 0x7FFFFFFFFFFFFFFCLL;
      do
      {
        float64x2_t v10 = vsubq_f64(v8[-1], v7);
        float64x2_t v11 = vsubq_f64(*v8, v7);
        float64x2_t v12 = vmulq_f64(v10, v10);
        float64x2_t v13 = vmulq_f64(v11, v11);
        double v6 = v6 + v12.f64[0] + v12.f64[1] + v13.f64[0] + v13.f64[1];
        v8 += 2;
        v9 -= 4LL;
      }

      while (v9);
      if (v1 != v5)
      {
LABEL_11:
        unint64_t v14 = v1 - v5;
        BOOL v15 = (double *)(result + 8 * v5 + 32);
        do
        {
          double v16 = *v15++;
          double v6 = v6 + (v16 - v3) * (v16 - v3);
          --v14;
        }

        while (v14);
      }

      return sqrt(v6 / (double)(uint64_t)v1);
    }
  }

  __break(1u);
  return result;
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100028934()
{
  unint64_t result = qword_1000387A0;
  if (!qword_1000387A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002FD94, &type metadata for CloudWorker);
    atomic_store(result, (unint64_t *)&qword_1000387A0);
  }

  return result;
}

unint64_t sub_10002897C()
{
  unint64_t result = qword_1000387A8;
  if (!qword_1000387A8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CloudError, &type metadata for CloudError);
    atomic_store(result, (unint64_t *)&qword_1000387A8);
  }

  return result;
}

unint64_t sub_1000289C4()
{
  unint64_t result = qword_1000387B0;
  if (!qword_1000387B0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CloudError, &type metadata for CloudError);
    atomic_store(result, (unint64_t *)&qword_1000387B0);
  }

  return result;
}

unint64_t sub_100028A0C()
{
  unint64_t result = qword_1000387B8;
  if (!qword_1000387B8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CloudError, &type metadata for CloudError);
    atomic_store(result, (unint64_t *)&qword_1000387B8);
  }

  return result;
}

unint64_t sub_100028A54()
{
  unint64_t result = qword_1000387C0[0];
  if (!qword_1000387C0[0])
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, qword_1000387C0);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for CloudError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }

uint64_t storeEnumTagSinglePayload for CloudError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_100028B74 + 4 * byte_10002FC05[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100028BA8 + 4 * byte_10002FC00[v4]))();
}

uint64_t sub_100028BA8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100028BB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100028BB8LL);
  }
  return result;
}

uint64_t sub_100028BC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100028BCCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_100028BD0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100028BD8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_100028BE4(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CloudError()
{
  return &type metadata for CloudError;
}

ValueMetadata *type metadata accessor for CloudWorker()
{
  return &type metadata for CloudWorker;
}

uint64_t sub_100028C14(uint64_t a1, uint64_t a2)
{
  v3[0] = a2;
  v3[1] = sub_100028C58();
  return *(void *)(swift_getOpaqueTypeConformance2( v3,  &opaque type descriptor for <<opaque return type of MLHostExtension.configuration>>,  1LL)
                   + 8);
}

unint64_t sub_100028C58()
{
  unint64_t result = qword_1000387E0;
  if (!qword_1000387E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10002FD54, &type metadata for CloudWorker);
    atomic_store(result, &qword_1000387E0);
  }

  return result;
}

uint64_t sub_100028C9C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

unint64_t sub_100028CC0(uint64_t a1)
{
  __int128 v2 = *(_OWORD *)(a1 + 96);
  v8[4] = *(_OWORD *)(a1 + 80);
  v8[5] = v2;
  uint64_t v9 = *(void *)(a1 + 112);
  __int128 v3 = *(_OWORD *)(a1 + 32);
  v8[0] = *(_OWORD *)(a1 + 16);
  v8[1] = v3;
  __int128 v4 = *(_OWORD *)(a1 + 64);
  v8[2] = *(_OWORD *)(a1 + 48);
  v8[3] = v4;
  sub_10002DF70((uint64_t)v8);
  unint64_t v5 = sub_100027F54();
  sub_10002DF98((uint64_t)v8);
  return v5;
}

Class sub_100028D38(uint64_t a1)
{
  __int16 v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  uint64_t v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_10002DFC0(0LL, &qword_100038978, &OBJC_CLASS___NSObject_ptr);
    v5.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.Class isa = 0LL;
  }

  return v5.super.isa;
}

uint64_t sub_100028DBC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(result + 16);
  if (v4)
  {
    uint64_t v8 = result;
    uint64_t v9 = (void *)(swift_bridgeObjectRetain() + 40);
    do
    {
      float64x2_t v11 = (void (*)(uint64_t, uint64_t, uint64_t))*(v9 - 1);
      uint64_t v10 = *v9;
      swift_retain(*v9);
      v11(a2, a3, a4);
      swift_release(v10);
      v9 += 2;
      --v4;
    }

    while (v4);
    return swift_bridgeObjectRelease(v8);
  }

  return result;
}

uint64_t sub_100028E4C( void (*a1)(uint64_t), uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v9 = a3(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  float64x2_t v13 = (char *)&v17 - v12;
  a1(v11);
  uint64_t v14 = sub_100009FBC(a4, a3, a5);
  uint64_t v15 = dispatch thunk of CustomStringConvertible.description.getter(v9, v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  return v15;
}

uint64_t sub_100028F10( void (*a1)(uint64_t *__return_ptr), uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = v8;
  uint64_t v5 = a3(0LL);
  uint64_t v6 = Array.description.getter(v4, v5);
  swift_bridgeObjectRelease(v4);
  return v6;
}

uint64_t sub_100028F78( char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
{
  if ((a3 & 1) != 0)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000LL < 0)
      {
        __break(1u);
LABEL_29:
        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division by zero",  16LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14377LL,  0);
LABEL_31:
        __break(1u);
        return result;
      }

      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    uint64_t v10 = a2;
  }

  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    char v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_100007B74(a5);
  uint64_t v14 = *(void *)(a6(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  char v18 = (void *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
  size_t v19 = j__malloc_size(v18);
  if (!v15) {
    goto LABEL_29;
  }
  if (v19 - v17 == 0x8000000000000000LL && v15 == -1)
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Division results in an overflow",  31LL,  2LL,  "Swift/IntegerTypes.swift",  24LL,  2,  14384LL,  0);
    goto LABEL_31;
  }

  v18[2] = v11;
  v18[3] = 2 * ((uint64_t)(v19 - v17) / v15);
LABEL_19:
  uint64_t v21 = a6(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  unint64_t v23 = (*(unsigned __int8 *)(v22 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
  unint64_t v24 = (unint64_t)v18 + v23;
  if ((a1 & 1) != 0)
  {
    unint64_t v25 = a4 + v23;
    if ((unint64_t)v18 < a4 || v24 >= v25 + *(void *)(v22 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v18 + v23, v25, v11, v21);
    }

    else if (v18 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v18 + v23);
    }

    *(void *)(a4 + 16) = 0LL;
  }

  else
  {
    sub_10002DDF0(0LL, v11, v24, a4, a6);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

void *sub_100029184(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_100007B74(&qword_1000388F8);
      uint64_t v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 3);
      uint64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[v8 + 4]) {
          memmove(v14, a4 + 4, 8 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_10002CC00(0LL, v8, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_100029290(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_100007F10(v6, v7, a3);
  uint64_t v10 = *a1 + 8;
  uint64_t v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_100029300()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

_BYTE **sub_100029310(_BYTE **result)
{
  uint64_t v2 = *result;
  *uint64_t v2 = *(_BYTE *)(v1 + 16);
  *uint64_t result = v2 + 1;
  return result;
}

uint64_t sub_100029324()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

void sub_100029334(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v7 = (void *)v6;
  uint64_t v8 = *a1 + 8;
  if (v6) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0LL;
  }
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v10, &v11);
  *a1 = v8;
  uint64_t v9 = *a2;
  if (*a2)
  {
    *uint64_t v9 = v7;
    *a2 = v9 + 1;
  }

  else
  {
  }

void sub_1000293E4(uint64_t *a1, void **a2, uint64_t a3)
{
}

uint64_t sub_1000293EC()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_1000293FC()
{
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_100029404()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_100029414()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_100029424()
{
  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_100029448()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100029468@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_100029490(uint64_t *a1)
{
  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  uint64_t v3 = *a1 + 4;
  uint64_t result = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v5, (char *)&v5 + 4);
  *a1 = v3;
  return result;
}

uint64_t sub_1000294E8()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002950C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_bridgeObjectRetain(*(void *)(v0 + 24));
  return v1;
}

uint64_t sub_100029538()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_100029548()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_100029558(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100029290(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_100029560()
{
  return swift_deallocObject(v0, 120LL, 7LL);
}

void **sub_100029584(void **result)
{
  uint64_t v1 = *result;
  void *v1 = 0x4122750000000000LL;
  *uint64_t result = v1 + 1;
  return result;
}

uint64_t sub_10002959C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
      size_t v19 = (void *)(v11 + 16 * v10);
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
  void *v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_10002BDAC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  void *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

void *sub_100029748(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_100007B74(&qword_100038950);
  uint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_10002C55C((uint64_t)&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10002DF48(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

uint64_t sub_10002982C(uint64_t a1, uint64_t a2)
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
  uint64_t v10 = (void *)(v9 + 16 * v8);
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
  *uint64_t v2 = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10002AFD4();
    uint64_t v14 = v22[0];
  }

  uint64_t v15 = *(void *)(*(void *)(v14 + 48) + 16 * v8);
  sub_10002B70C(v8);
  uint64_t v16 = *v2;
  *uint64_t v2 = v22[0];
  swift_bridgeObjectRelease(v16);
  return v15;
}

uint64_t sub_1000299B8(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(void *))
{
  uint64_t v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v6 = a2(v6);
  }
  uint64_t v7 = *(void *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  uint64_t result = a3(v9);
  *a1 = v6;
  return result;
}

Swift::Int sub_100029A30(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_10002A7A8(0LL, v3, 1LL, a1);
      }
      return result;
    }

    goto LABEL_154;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1)
  {
LABEL_162:
    Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
    return result;
  }

  Swift::Int v111 = result;
  uint64_t v108 = a1;
  if (v3 < 2)
  {
    unint64_t v8 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      uint64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_120:
      unint64_t v101 = v11;
      uint64_t v110 = v8;
      if (v12 < 2) {
        goto LABEL_117;
      }
      uint64_t v102 = *v108;
      while (1)
      {
        unint64_t v103 = v12 - 2;
        if (v12 < 2) {
          goto LABEL_149;
        }
        if (!v102) {
          goto LABEL_161;
        }
        uint64_t v100 = v101;
        uint64_t v104 = *(void *)&v101[16 * v103 + 32];
        uint64_t v105 = *(void *)&v101[16 * v12 + 24];
        sub_10002A874( (char *)(v102 + 16 * v104),  (char *)(v102 + 16LL * *(void *)&v101[16 * v12 + 16]),  v102 + 16 * v105,  __dst);
        if (v1) {
          goto LABEL_116;
        }
        if (v105 < v104) {
          goto LABEL_150;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v100) & 1) == 0) {
          uint64_t v100 = sub_10002AFC0((uint64_t)v100);
        }
        if (v103 >= *((void *)v100 + 2)) {
          goto LABEL_151;
        }
        uint64_t v106 = &v100[16 * v103 + 32];
        *(void *)uint64_t v106 = v104;
        *((void *)v106 + 1) = v105;
        unint64_t v107 = *((void *)v100 + 2);
        if (v12 > v107) {
          goto LABEL_152;
        }
        memmove(&v100[16 * v12 + 16], &v100[16 * v12 + 32], 16 * (v107 - v12));
        unint64_t v101 = v100;
        *((void *)v100 + 2) = v107 - 1;
        unint64_t v12 = v107 - 1;
        if (v107 <= 2) {
          goto LABEL_117;
        }
      }
    }

    uint64_t v110 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for String);
    *(void *)(v7 + 16) = v6;
    uint64_t v110 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }

  Swift::Int v9 = 0LL;
  uint64_t v10 = *a1;
  uint64_t v109 = v10 + 8;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v112 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    uint64_t v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    uint64_t v18 = v17[1];
    if (v15 == *v17 && v16 == v18)
    {
      Swift::Int v21 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v20 = 0;
    }

    else
    {
      int v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, *v17, v18, 1LL);
      Swift::Int v21 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }

    uint64_t v22 = (uint64_t *)(v109 + 16 * v21);
    do
    {
      uint64_t v24 = *(v22 - 1);
      uint64_t v25 = *v22;
      Class v26 = (void *)(v10 + 16 * v9);
      uint64_t v27 = v26[1];
      if (v24 == *v26 && v25 == v27)
      {
        if ((v20 & 1) != 0) {
          goto LABEL_37;
        }
      }

      else if (((v20 ^ _stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, *v26, v27, 1LL)) & 1) != 0)
      {
        goto LABEL_36;
      }

      v22 += 2;
      Swift::Int v23 = v21 + 1;
      Swift::Int v9 = v21;
      Swift::Int v21 = v23;
    }

    while (v23 < v3);
    Swift::Int v21 = v23;
LABEL_36:
    Swift::Int v9 = v21;
    if ((v20 & 1) != 0)
    {
LABEL_37:
      if (v21 < v13) {
        goto LABEL_157;
      }
      if (v13 < v21)
      {
        uint64_t v29 = 16 * v21;
        uint64_t v30 = 16 * v13;
        Swift::Int v31 = v21;
        Swift::Int v32 = v13;
        do
        {
          if (v32 != --v31)
          {
            if (!v10) {
              goto LABEL_160;
            }
            uint64_t v33 = v10 + v29;
            uint64_t v34 = *(void *)(v10 + v30);
            uint64_t v35 = *(void *)(v10 + v30 + 8);
            *(_OWORD *)(v10 + v30) = *(_OWORD *)(v10 + v29 - 16);
            *(void *)(v33 - 16) = v34;
            *(void *)(v33 - 8) = v35;
          }

          ++v32;
          v29 -= 16LL;
          v30 += 16LL;
        }

        while (v32 < v31);
      }

LABEL_45:
      Swift::Int v9 = v21;
    }

LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_153;
      }
      if (v9 - v13 < v111)
      {
        if (__OFADD__(v13, v111)) {
          goto LABEL_155;
        }
        if (v13 + v111 >= v3) {
          Swift::Int v36 = v3;
        }
        else {
          Swift::Int v36 = v13 + v111;
        }
        if (v36 < v13) {
          goto LABEL_156;
        }
        if (v9 != v36)
        {
          unint64_t v37 = (void *)(v10 + 16 * v9);
          do
          {
            Class v38 = (uint64_t *)(v10 + 16 * v9);
            uint64_t v39 = *v38;
            uint64_t v40 = v38[1];
            Swift::Int v41 = v13;
            char v42 = v37;
            do
            {
              uint64_t v43 = *(v42 - 2);
              uint64_t v44 = *(v42 - 1);
              BOOL v45 = v39 == v43 && v40 == v44;
              if (v45 || (_stringCompareWithSmolCheck(_:_:expecting:)(v39, v40, v43, v44, 1LL) & 1) == 0) {
                break;
              }
              if (!v10) {
                goto LABEL_158;
              }
              uint64_t v39 = *v42;
              uint64_t v40 = v42[1];
              *(_OWORD *)char v42 = *((_OWORD *)v42 - 1);
              *(v42 - 1) = v40;
              *(v42 - 2) = v39;
              v42 -= 2;
              ++v41;
            }

            while (v9 != v41);
            ++v9;
            v37 += 2;
          }

          while (v9 != v36);
          Swift::Int v9 = v36;
        }
      }
    }

    if (v9 < v13)
    {
LABEL_148:
      __break(1u);
LABEL_149:
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
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
      goto LABEL_162;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0) {
      uint64_t v11 = sub_10002AD78(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    unint64_t v47 = *((void *)v11 + 2);
    unint64_t v46 = *((void *)v11 + 3);
    unint64_t v12 = v47 + 1;
    if (v47 >= v46 >> 1) {
      uint64_t v11 = sub_10002AD78((char *)(v46 > 1), v47 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    unint64_t v48 = v11 + 32;
    Class v49 = &v11[16 * v47 + 32];
    *(void *)Class v49 = v13;
    *((void *)v49 + 1) = v9;
    if (v47) {
      break;
    }
    unint64_t v12 = 1LL;
LABEL_15:
    Swift::Int v3 = v112;
    if (v9 >= v112)
    {
      unint64_t v8 = v110;
      goto LABEL_120;
    }
  }

  Swift::Int v113 = v9;
  while (1)
  {
    unint64_t v50 = v12 - 1;
    if (v12 >= 4)
    {
      Class v55 = &v48[16 * v12];
      uint64_t v56 = *((void *)v55 - 8);
      uint64_t v57 = *((void *)v55 - 7);
      BOOL v61 = __OFSUB__(v57, v56);
      uint64_t v58 = v57 - v56;
      if (v61) {
        goto LABEL_137;
      }
      uint64_t v60 = *((void *)v55 - 6);
      uint64_t v59 = *((void *)v55 - 5);
      BOOL v61 = __OFSUB__(v59, v60);
      uint64_t v53 = v59 - v60;
      char v54 = v61;
      if (v61) {
        goto LABEL_138;
      }
      unint64_t v62 = v12 - 2;
      uint64_t v63 = &v48[16 * v12 - 32];
      uint64_t v65 = *(void *)v63;
      uint64_t v64 = *((void *)v63 + 1);
      BOOL v61 = __OFSUB__(v64, v65);
      uint64_t v66 = v64 - v65;
      if (v61) {
        goto LABEL_140;
      }
      BOOL v61 = __OFADD__(v53, v66);
      uint64_t v67 = v53 + v66;
      if (v61) {
        goto LABEL_143;
      }
      if (v67 >= v58)
      {
        uint64_t v85 = &v48[16 * v50];
        uint64_t v87 = *(void *)v85;
        uint64_t v86 = *((void *)v85 + 1);
        BOOL v61 = __OFSUB__(v86, v87);
        uint64_t v88 = v86 - v87;
        if (v61) {
          goto LABEL_147;
        }
        BOOL v78 = v53 < v88;
        goto LABEL_105;
      }
    }

    else
    {
      if (v12 != 3)
      {
        uint64_t v79 = *((void *)v11 + 4);
        uint64_t v80 = *((void *)v11 + 5);
        BOOL v61 = __OFSUB__(v80, v79);
        uint64_t v72 = v80 - v79;
        char v73 = v61;
        goto LABEL_99;
      }

      uint64_t v52 = *((void *)v11 + 4);
      uint64_t v51 = *((void *)v11 + 5);
      BOOL v61 = __OFSUB__(v51, v52);
      uint64_t v53 = v51 - v52;
      char v54 = v61;
    }

    if ((v54 & 1) != 0) {
      goto LABEL_139;
    }
    unint64_t v62 = v12 - 2;
    uint64_t v68 = &v48[16 * v12 - 32];
    uint64_t v70 = *(void *)v68;
    uint64_t v69 = *((void *)v68 + 1);
    BOOL v71 = __OFSUB__(v69, v70);
    uint64_t v72 = v69 - v70;
    char v73 = v71;
    if (v71) {
      goto LABEL_142;
    }
    uint64_t v74 = &v48[16 * v50];
    uint64_t v76 = *(void *)v74;
    uint64_t v75 = *((void *)v74 + 1);
    BOOL v61 = __OFSUB__(v75, v76);
    uint64_t v77 = v75 - v76;
    if (v61) {
      goto LABEL_145;
    }
    if (__OFADD__(v72, v77)) {
      goto LABEL_146;
    }
    if (v72 + v77 >= v53)
    {
      BOOL v78 = v53 < v77;
LABEL_105:
      if (v78) {
        unint64_t v50 = v62;
      }
      goto LABEL_107;
    }

LABEL_99:
    if ((v73 & 1) != 0) {
      goto LABEL_141;
    }
    os_log_type_t v81 = &v48[16 * v50];
    uint64_t v83 = *(void *)v81;
    uint64_t v82 = *((void *)v81 + 1);
    BOOL v61 = __OFSUB__(v82, v83);
    uint64_t v84 = v82 - v83;
    if (v61) {
      goto LABEL_144;
    }
    if (v84 < v72) {
      goto LABEL_15;
    }
LABEL_107:
    unint64_t v89 = v50 - 1;
    if (v50 - 1 >= v12)
    {
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
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
LABEL_147:
      __break(1u);
      goto LABEL_148;
    }

    uint64_t v90 = v10;
    if (!v10) {
      goto LABEL_159;
    }
    uint64_t v91 = v11;
    uint64_t v92 = &v48[16 * v89];
    uint64_t v93 = *(void *)v92;
    uint64_t v94 = v48;
    unint64_t v95 = v50;
    os_log_type_t v96 = &v48[16 * v50];
    uint64_t v97 = *((void *)v96 + 1);
    uint64_t v98 = v90;
    sub_10002A874((char *)(v90 + 16LL * *(void *)v92), (char *)(v90 + 16LL * *(void *)v96), v90 + 16 * v97, __dst);
    if (v1) {
      break;
    }
    if (v97 < v93) {
      goto LABEL_134;
    }
    if (v95 > *((void *)v91 + 2)) {
      goto LABEL_135;
    }
    *(void *)uint64_t v92 = v93;
    *(void *)&v94[16 * v89 + 8] = v97;
    unint64_t v99 = *((void *)v91 + 2);
    if (v95 >= v99) {
      goto LABEL_136;
    }
    uint64_t v11 = v91;
    unint64_t v12 = v99 - 1;
    memmove(v96, v96 + 16, 16 * (v99 - 1 - v95));
    unint64_t v48 = v94;
    *((void *)v91 + 2) = v99 - 1;
    uint64_t v10 = v98;
    Swift::Int v9 = v113;
    if (v99 <= 2) {
      goto LABEL_15;
    }
  }

  uint64_t v100 = v91;
LABEL_116:
  unint64_t v101 = v100;
LABEL_117:
  swift_bridgeObjectRelease(v101);
  v110[2] = 0LL;
  return swift_bridgeObjectRelease(v110);
}

Swift::Int sub_10002A118(void *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      uint64_t v82 = 0LL;
      uint64_t v83 = *v2;
      uint64_t v84 = 1LL;
      while (1)
      {
        double v85 = *(double *)(v83 + 8 * v84);
        uint64_t v86 = v82;
        do
        {
          uint64_t v87 = v83 + 8 * v86;
          if (!v83) {
            goto LABEL_142;
          }
          *(void *)(v87 + 8) = *(void *)v87;
          *(double *)(v83 + 8 * v86--) = v85;
        }

        while (v86 != -1);
        ++v84;
        ++v82;
        if (v84 == v3) {
          return result;
        }
      }
    }

    goto LABEL_138;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1)
  {
LABEL_147:
    Swift::Int result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
    return result;
  }

  Swift::Int v98 = result;
  Swift::Int v99 = v3;
  if (v3 < 2)
  {
    unint64_t v8 = &_swiftEmptyArrayStorage;
    __dst = (double *)((char *)&_swiftEmptyArrayStorage + 32);
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      goto LABEL_103;
    }

    uint64_t v97 = &_swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)(v5 >> 1, &type metadata for Double);
    *(void *)(v7 + 16) = v6;
    Swift::Int v3 = v99;
    uint64_t v97 = (void *)v7;
    __dst = (double *)(v7 + 32);
  }

  Swift::Int v9 = 0LL;
  uint64_t v10 = *v2;
  unint64_t v95 = v2;
  uint64_t v96 = *v2 - 8LL;
  uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  uint64_t v100 = *v2;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 < v3)
    {
      double v14 = *(double *)(v10 + 8 * v9);
      double v15 = *(double *)(v10 + 8 * v13);
      Swift::Int v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        double v16 = v14;
        while (1)
        {
          double v17 = v16;
          double v16 = *(double *)(v10 + 8 * v9);
          if (v14 < v15 == v16 >= v17) {
            break;
          }
          if (v3 == ++v9)
          {
            Swift::Int v9 = v3;
            break;
          }
        }
      }

      if (v14 < v15)
      {
        if (v9 < v13) {
          goto LABEL_139;
        }
        if (v13 < v9)
        {
          uint64_t v18 = (uint64_t *)(v96 + 8 * v9);
          Swift::Int v19 = v9;
          Swift::Int v20 = v13;
          Swift::Int v21 = (uint64_t *)(v10 + 8 * v13);
          do
          {
            if (v20 != --v19)
            {
              if (!v10) {
                goto LABEL_145;
              }
              uint64_t v22 = *v21;
              *Swift::Int v21 = *v18;
              *uint64_t v18 = v22;
            }

            ++v20;
            --v18;
            ++v21;
          }

          while (v20 < v19);
        }
      }
    }

    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_137;
      }
      if (v9 - v13 < v98)
      {
        Swift::Int v23 = v13 + v98;
        if (__OFADD__(v13, v98)) {
          goto LABEL_140;
        }
        if (v23 >= v3) {
          Swift::Int v23 = v3;
        }
        if (v23 < v13) {
          goto LABEL_141;
        }
        if (v9 != v23)
        {
          uint64_t v24 = (double *)(v96 + 8 * v9);
          do
          {
            double v25 = *(double *)(v10 + 8 * v9);
            Swift::Int v26 = v13;
            uint64_t v27 = v24;
            do
            {
              double v28 = *v27;
              if (v25 >= *v27) {
                break;
              }
              if (!v10) {
                goto LABEL_143;
              }
              *uint64_t v27 = v25;
              v27[1] = v28;
              --v27;
              ++v26;
            }

            while (v9 != v26);
            ++v9;
            ++v24;
          }

          while (v9 != v23);
          Swift::Int v9 = v23;
        }
      }
    }

    if (v9 < v13)
    {
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0) {
      uint64_t v11 = sub_10002AD78(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    unint64_t v30 = *((void *)v11 + 2);
    unint64_t v29 = *((void *)v11 + 3);
    unint64_t v12 = v30 + 1;
    uint64_t v10 = v100;
    if (v30 >= v29 >> 1)
    {
      uint64_t v79 = sub_10002AD78((char *)(v29 > 1), v30 + 1, 1, v11);
      uint64_t v10 = v100;
      uint64_t v11 = v79;
    }

    *((void *)v11 + 2) = v12;
    Swift::Int v31 = v11 + 32;
    Swift::Int v32 = &v11[16 * v30 + 32];
    *(void *)Swift::Int v32 = v13;
    *((void *)v32 + 1) = v9;
    if (v30) {
      break;
    }
    unint64_t v12 = 1LL;
LABEL_15:
    Swift::Int v3 = v99;
    if (v9 >= v99)
    {
      unint64_t v8 = v97;
      uint64_t v2 = v95;
LABEL_103:
      uint64_t v97 = v8;
      if (v12 < 2)
      {
LABEL_114:
        os_log_type_t v81 = v11;
        goto LABEL_115;
      }

      uint64_t v88 = *v2;
      while (1)
      {
        unint64_t v89 = v12 - 2;
        if (v12 < 2) {
          break;
        }
        if (!v88) {
          goto LABEL_146;
        }
        uint64_t v80 = v11;
        uint64_t v90 = v11 + 32;
        uint64_t v91 = *(void *)&v11[16 * v89 + 32];
        uint64_t v92 = *(void *)&v11[16 * v12 + 24];
        sub_10002AB0C( (double *)(v88 + 8 * v91),  (double *)(v88 + 8LL * *(void *)&v90[16 * v12 - 16]),  v88 + 8 * v92,  __dst);
        if (v1) {
          goto LABEL_94;
        }
        if (v92 < v91) {
          goto LABEL_134;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v80) & 1) == 0) {
          uint64_t v80 = sub_10002AFC0((uint64_t)v80);
        }
        if (v89 >= *((void *)v80 + 2)) {
          goto LABEL_135;
        }
        uint64_t v93 = &v80[16 * v89 + 32];
        *(void *)uint64_t v93 = v91;
        *((void *)v93 + 1) = v92;
        unint64_t v94 = *((void *)v80 + 2);
        if (v12 > v94) {
          goto LABEL_136;
        }
        memmove(&v80[16 * v12 + 16], &v80[16 * v12 + 32], 16 * (v94 - v12));
        uint64_t v11 = v80;
        *((void *)v80 + 2) = v94 - 1;
        unint64_t v12 = v94 - 1;
        if (v94 <= 2) {
          goto LABEL_114;
        }
      }

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
LABEL_145:
      __break(1u);
LABEL_146:
      __break(1u);
      goto LABEL_147;
    }
  }

  while (1)
  {
    unint64_t v33 = v12 - 1;
    if (v12 >= 4)
    {
      Class v38 = &v31[16 * v12];
      uint64_t v39 = *((void *)v38 - 8);
      uint64_t v40 = *((void *)v38 - 7);
      BOOL v44 = __OFSUB__(v40, v39);
      uint64_t v41 = v40 - v39;
      if (v44) {
        goto LABEL_121;
      }
      uint64_t v43 = *((void *)v38 - 6);
      uint64_t v42 = *((void *)v38 - 5);
      BOOL v44 = __OFSUB__(v42, v43);
      uint64_t v36 = v42 - v43;
      char v37 = v44;
      if (v44) {
        goto LABEL_122;
      }
      unint64_t v45 = v12 - 2;
      unint64_t v46 = &v31[16 * v12 - 32];
      uint64_t v48 = *(void *)v46;
      uint64_t v47 = *((void *)v46 + 1);
      BOOL v44 = __OFSUB__(v47, v48);
      uint64_t v49 = v47 - v48;
      if (v44) {
        goto LABEL_124;
      }
      BOOL v44 = __OFADD__(v36, v49);
      uint64_t v50 = v36 + v49;
      if (v44) {
        goto LABEL_127;
      }
      if (v50 >= v41)
      {
        uint64_t v68 = &v31[16 * v33];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v44 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v44) {
          goto LABEL_131;
        }
        BOOL v61 = v36 < v71;
        goto LABEL_83;
      }
    }

    else
    {
      if (v12 != 3)
      {
        uint64_t v62 = *((void *)v11 + 4);
        uint64_t v63 = *((void *)v11 + 5);
        BOOL v44 = __OFSUB__(v63, v62);
        uint64_t v55 = v63 - v62;
        char v56 = v44;
        goto LABEL_77;
      }

      uint64_t v35 = *((void *)v11 + 4);
      uint64_t v34 = *((void *)v11 + 5);
      BOOL v44 = __OFSUB__(v34, v35);
      uint64_t v36 = v34 - v35;
      char v37 = v44;
    }

    if ((v37 & 1) != 0) {
      goto LABEL_123;
    }
    unint64_t v45 = v12 - 2;
    uint64_t v51 = &v31[16 * v12 - 32];
    uint64_t v53 = *(void *)v51;
    uint64_t v52 = *((void *)v51 + 1);
    BOOL v54 = __OFSUB__(v52, v53);
    uint64_t v55 = v52 - v53;
    char v56 = v54;
    if (v54) {
      goto LABEL_126;
    }
    uint64_t v57 = &v31[16 * v33];
    uint64_t v59 = *(void *)v57;
    uint64_t v58 = *((void *)v57 + 1);
    BOOL v44 = __OFSUB__(v58, v59);
    uint64_t v60 = v58 - v59;
    if (v44) {
      goto LABEL_129;
    }
    if (__OFADD__(v55, v60)) {
      goto LABEL_130;
    }
    if (v55 + v60 >= v36)
    {
      BOOL v61 = v36 < v60;
LABEL_83:
      if (v61) {
        unint64_t v33 = v45;
      }
      goto LABEL_85;
    }

LABEL_77:
    if ((v56 & 1) != 0) {
      goto LABEL_125;
    }
    uint64_t v64 = &v31[16 * v33];
    uint64_t v66 = *(void *)v64;
    uint64_t v65 = *((void *)v64 + 1);
    BOOL v44 = __OFSUB__(v65, v66);
    uint64_t v67 = v65 - v66;
    if (v44) {
      goto LABEL_128;
    }
    if (v67 < v55) {
      goto LABEL_15;
    }
LABEL_85:
    unint64_t v72 = v33 - 1;
    if (v33 - 1 >= v12)
    {
      __break(1u);
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
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
      goto LABEL_132;
    }

    if (!v10) {
      goto LABEL_144;
    }
    char v73 = &v31[16 * v72];
    uint64_t v74 = *(void *)v73;
    uint64_t v75 = v31;
    uint64_t v76 = &v31[16 * v33];
    uint64_t v77 = *((void *)v76 + 1);
    sub_10002AB0C((double *)(v10 + 8LL * *(void *)v73), (double *)(v10 + 8LL * *(void *)v76), v10 + 8 * v77, __dst);
    if (v1) {
      break;
    }
    if (v77 < v74) {
      goto LABEL_118;
    }
    if (v33 > *((void *)v11 + 2)) {
      goto LABEL_119;
    }
    *(void *)char v73 = v74;
    *(void *)&v75[16 * v72 + 8] = v77;
    unint64_t v78 = *((void *)v11 + 2);
    if (v33 >= v78) {
      goto LABEL_120;
    }
    unint64_t v12 = v78 - 1;
    memmove(v76, v76 + 16, 16 * (v78 - 1 - v33));
    Swift::Int v31 = v75;
    *((void *)v11 + 2) = v78 - 1;
    uint64_t v10 = v100;
    if (v78 <= 2) {
      goto LABEL_15;
    }
  }

  uint64_t v80 = v11;
LABEL_94:
  os_log_type_t v81 = v80;
LABEL_115:
  swift_bridgeObjectRelease(v81);
  *((void *)v97 + 2) = 0LL;
  return swift_bridgeObjectRelease(v97);
}

uint64_t sub_10002A7A8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      uint64_t v13 = *(v12 - 2);
      uint64_t v14 = *(v12 - 1);
      BOOL v15 = result == v13 && v10 == v14;
      if (v15 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v10, v13, v14, 1LL), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16LL;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }

      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_10002A874(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  uint64_t v13 = v12 >> 4;
  Swift::Int v31 = __src;
  unint64_t v30 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      Swift::Int v19 = &v4[16 * v13];
      unint64_t v29 = v19;
      Swift::Int v31 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        Swift::Int v20 = (char *)(a3 - 16);
        Swift::Int v21 = v6;
        while (1)
        {
          uint64_t v22 = v20 + 16;
          uint64_t v23 = *((void *)v19 - 2);
          uint64_t v24 = *((void *)v19 - 1);
          uint64_t v25 = *((void *)v21 - 2);
          uint64_t v26 = *((void *)v21 - 1);
          v21 -= 16;
          BOOL v27 = v23 == v25 && v24 == v26;
          if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v25, v26, 1LL) & 1) == 0)
          {
            unint64_t v29 = v19 - 16;
            if (v22 < v19 || v20 >= v19 || v22 != v19) {
              *(_OWORD *)Swift::Int v20 = *((_OWORD *)v19 - 1);
            }
            Swift::Int v21 = v6;
            v19 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }

          else
          {
            if (v22 != v6 || v20 >= v6) {
              *(_OWORD *)Swift::Int v20 = *(_OWORD *)v21;
            }
            Swift::Int v31 = v21;
            if (v21 <= v7) {
              goto LABEL_50;
            }
          }

          v20 -= 16;
          uint64_t v6 = v21;
          if (v19 <= v4) {
            goto LABEL_50;
          }
        }
      }

      goto LABEL_50;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    uint64_t v14 = &v4[16 * v10];
    unint64_t v29 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        uint64_t v15 = *((void *)v6 + 1);
        uint64_t v16 = *((void *)v4 + 1);
        BOOL v17 = *(void *)v6 == *(void *)v4 && v15 == v16;
        if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v6, v15, *(void *)v4, v16, 1LL) & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          unint64_t v30 = v4;
          uint64_t v18 = v6;
        }

        else
        {
          uint64_t v18 = v6 + 16;
          if (v7 < v6 || v7 >= v18 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }

        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v18;
      }

      while ((unint64_t)v18 < a3);
      Swift::Int v31 = v7;
    }

LABEL_50:
    sub_10002AE70((void **)&v31, (const void **)&v30, &v29);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10002AB0C(double *__src, double *a2, unint64_t a3, double *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = (char *)a2 - (char *)__src;
  int64_t v9 = (char *)a2 - (char *)__src + 7;
  uint64_t v10 = v9 >> 3;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 7;
  uint64_t v13 = v12 >> 3;
  uint64_t v24 = __src;
  uint64_t v23 = __dst;
  if (v10 >= v12 >> 3)
  {
    if (v11 >= -7)
    {
      if (__dst != a2 || &a2[v13] <= __dst) {
        memmove(__dst, a2, 8 * v13);
      }
      uint64_t v16 = &v4[v13];
      uint64_t v22 = v16;
      uint64_t v24 = v6;
      if (v7 < v6 && v11 >= 8)
      {
        BOOL v17 = (double *)(a3 - 8);
        while (1)
        {
          uint64_t v18 = v17 + 1;
          Swift::Int v19 = v6 - 1;
          double v20 = *(v6 - 1);
          if (*(v16 - 1) >= v20)
          {
            uint64_t v22 = v16 - 1;
            if (v18 < v16 || v17 >= v16 || v18 != v16) {
              double *v17 = *(v16 - 1);
            }
            --v16;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }

          else
          {
            if (v18 != v6 || v17 >= v6) {
              double *v17 = v20;
            }
            uint64_t v24 = --v6;
            if (v19 <= v7) {
              goto LABEL_42;
            }
          }

          --v17;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }

      goto LABEL_42;
    }
  }

  else if (v8 >= -7)
  {
    if (__dst != __src || &__src[v10] <= __dst) {
      memmove(__dst, __src, 8 * v10);
    }
    uint64_t v14 = &v4[v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 8)
    {
      do
      {
        if (*v6 >= *v4)
        {
          if (v7 != v4) {
            *uint64_t v7 = *v4;
          }
          uint64_t v23 = ++v4;
          uint64_t v15 = v6;
        }

        else
        {
          uint64_t v15 = v6 + 1;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *uint64_t v7 = *v6;
          }
        }

        ++v7;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v15;
      }

      while ((unint64_t)v15 < a3);
      uint64_t v24 = v7;
    }

char *sub_10002AD78(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100007B74(&qword_100038958);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_10002AE70(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7]) {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }

  return result;
}

char *sub_10002AF18(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    char v9 = 2;
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v9,  1046LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7]) {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }

  return result;
}

char *sub_10002AFC0(uint64_t a1)
{
  return sub_10002AD78(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_10002AFD4()
{
  uint64_t v1 = v0;
  sub_100007B74(&qword_100038908);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }

LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    BOOL v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    Swift::Int v19 = (void *)(*(void *)(v4 + 48) + v16);
    *Swift::Int v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }

Swift::Int sub_10002B184(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100007B74(&qword_100038908);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
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
  Swift::Int v31 = v2;
  int64_t v32 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v32) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      int64_t v13 = v18 + 1;
      if (v18 + 1 >= v32) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v13);
      if (!v19)
      {
        int64_t v13 = v18 + 2;
        if (v18 + 2 >= v32) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v13);
        if (!v19) {
          break;
        }
      }
    }

LABEL_26:
    unint64_t v10 = (v19 - 1) & v19;
    unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    unint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
    uint64_t v22 = *v21;
    uint64_t v23 = v21[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    Swift::Int result = Hasher._finalize()();
    uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v25 = result & ~v24;
    unint64_t v26 = v25 >> 6;
    if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      unint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        BOOL v29 = v26 == v28;
        if (v26 == v28) {
          unint64_t v26 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v26);
      }

      while (v30 == -1);
      unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }

    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    unint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
    *unint64_t v15 = v22;
    v15[1] = v23;
    ++*(void *)(v6 + 16);
  }

  int64_t v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    Swift::Int result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_38;
  }

  unint64_t v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    int64_t v13 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    int64_t v13 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v13 >= v32) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v13);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

        uint64_t v9 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      unint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
      uint64_t v22 = *v21;
      uint64_t v23 = v21[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      Swift::Int result = Hasher._finalize()();
      uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
      unint64_t v25 = result & ~v24;
      unint64_t v26 = v25 >> 6;
      if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v27 = 0;
        unint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          BOOL v29 = v26 == v28;
          if (v26 == v28) {
            unint64_t v26 = 0LL;
          }
          v27 |= v29;
          uint64_t v30 = *(void *)(v11 + 8 * v26);
        }

        while (v30 == -1);
        unint64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      unint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
      *unint64_t v15 = v22;
      v15[1] = v23;
      ++*(void *)(v6 + 16);
    }
  }

  Swift::Int result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

LABEL_40:
  __break(1u);
  return result;
}

Swift::Int sub_10002B430(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100007B74(&qword_100038908);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    int64_t v32 = v2;
    unint64_t v33 = (void *)(v3 + 56);
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
    while (1)
    {
      if (v9)
      {
        unint64_t v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }

      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v10) {
          goto LABEL_36;
        }
        unint64_t v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v10) {
            goto LABEL_36;
          }
          unint64_t v19 = v33[v13];
          if (!v19)
          {
            int64_t v13 = v18 + 2;
            if (v18 + 2 >= v10) {
              goto LABEL_36;
            }
            unint64_t v19 = v33[v13];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v32;
                uint64_t v31 = 1LL << *(_BYTE *)(v3 + 32);
                if (v31 > 63) {
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *unint64_t v33 = -1LL << v31;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v13 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v13 >= v10) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v33[v13];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v13 = v20;
            }
          }
        }

unint64_t sub_10002B70C(unint64_t result)
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
        int64_t v10 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v6);
        uint64_t v11 = *v10;
        uint64_t v12 = v10[1];
        Hasher.init(_seed:)(v21, *(void *)(v3 + 40));
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v21, v11, v12);
        Swift::Int v13 = Hasher._finalize()();
        swift_bridgeObjectRelease(v12);
        unint64_t v14 = v13 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v14 < v9) {
            goto LABEL_5;
          }
        }

        else if (v14 >= v9)
        {
          goto LABEL_11;
        }

        if (v2 >= (uint64_t)v14)
        {
LABEL_11:
          uint64_t v15 = *(void *)(v3 + 48);
          unint64_t v16 = (_OWORD *)(v15 + 16 * v2);
          unint64_t v17 = (_OWORD *)(v15 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v16 >= v17 + 1))
          {
            *unint64_t v16 = *v17;
            int64_t v2 = v6;
          }
        }

uint64_t sub_10002B8D0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002BA70(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_10002B8EC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10002B908(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_10002B908(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    uint64_t v10 = sub_100007B74(&qword_100038950);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  unint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

LABEL_32:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10002BA70(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }

      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v7 = a2;
  }

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_100007B74(&qword_100038968);
  uint64_t v11 = *(void *)(type metadata accessor for MLHostTask(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  size_t v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }

  if (v16 - v14 == 0x8000000000000000LL && v12 == -1) {
    goto LABEL_34;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  uint64_t v18 = type metadata accessor for MLHostTask(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  unint64_t v21 = (char *)v15 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront(v21);
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v23 = *(void *)(v19 + 72) * v8;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_10002BC50(char a1, int64_t a2, char a3, char *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    uint64_t v10 = sub_100007B74(&qword_1000388F8);
    uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_10002BDAC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_10002B430(v11);
  }

  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_10002AFD4();
      goto LABEL_22;
    }

    sub_10002B184(v11);
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
    size_t v16 = (void *)(v15 + 16 * a3);
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
        unint64_t v20 = (void *)(v15 + 16 * a3);
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

LABEL_22:
  uint64_t v23 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  uint64_t v24 = (uint64_t *)(*(void *)(v23 + 48) + 16 * a3);
  *uint64_t v24 = v8;
  v24[1] = a2;
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1LL);
  uint64_t v27 = v25 + 1;
  if (v26) {
    __break(1u);
  }
  else {
    *(void *)(v23 + 16) = v27;
  }
  return result;
}

Swift::Int sub_10002BF44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100007B74(&qword_100038980);
  char v39 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v38 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  uint64_t v36 = v3;
  int64_t v37 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }

    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v22 >= v37) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v37) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v38 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          uint64_t v3 = v36;
          if ((v39 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v37) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v38 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

LABEL_33:
    unint64_t v11 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    uint64_t v30 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v21);
    uint64_t v32 = *v30;
    uint64_t v31 = v30[1];
    unint64_t v33 = *(void **)(*(void *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      id v34 = v33;
    }

    Hasher.init(_seed:)(v40, *(void *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    Swift::Int result = Hasher._finalize()();
    uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }

      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }

    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    uint64_t v19 = (void *)(*(void *)(v8 + 48) + 16 * v18);
    *uint64_t v19 = v32;
    v19[1] = v31;
    *(void *)(*(void *)(v8 + 56) + 8 * v18) = v33;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v36;
  uint64_t v23 = (void *)(v5 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v23 = -1LL << v35;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

void sub_10002C250(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100008550(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_10002C3AC();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }

LABEL_11:
    v18[(v12 >> 6) + 8] |= 1LL << v12;
    int64_t v22 = (uint64_t *)(v18[6] + 16 * v12);
    *int64_t v22 = a2;
    v22[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v23 = v18[2];
    BOOL v24 = __OFADD__(v23, 1LL);
    uint64_t v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain(a3);
      return;
    }

    goto LABEL_14;
  }

  sub_10002BF44(v15, a4 & 1);
  unint64_t v20 = sub_100008550(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    unint64_t v12 = v20;
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

id sub_10002C3AC()
{
  uint64_t v1 = v0;
  sub_100007B74(&qword_100038980);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1LL << *(_BYTE *)(v2 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }

    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    unint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    *char v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    id result = v20;
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_10002C55C(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    v5[2] = ~v7;
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
    unint64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }

    v11 += 2;
    id result = swift_bridgeObjectRetain(v21);
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

uint64_t sub_10002C758(uint64_t a1)
{
  return sub_10002B908(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10002C76C(uint64_t a1)
{
  return sub_10002BC50(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10002C780(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_10002959C(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }

    while (v2);
    return v8;
  }

  return result;
}

uint64_t sub_10002C814@<X0>(void *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 16);
  *a1 = v2;
  return swift_bridgeObjectRetain(v2);
}

uint64_t sub_10002C824()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002C834()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

unint64_t sub_10002C844()
{
  unint64_t result = qword_100038848;
  if (!qword_100038848)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100038848);
  }

  return result;
}

unint64_t sub_10002C888()
{
  unint64_t result = qword_100038858;
  if (!qword_100038858)
  {
    uint64_t v1 = sub_10002DFC0(255LL, &qword_100038850, &OBJC_CLASS___NSDate_ptr);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_100038858);
  }

  return result;
}

uint64_t sub_10002C8E0()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for Date);
}

uint64_t sub_10002C8EC@<X0>(uint64_t a1@<X8>)
{
  return sub_10002D864((uint64_t (*)(void))&type metadata accessor for Date, a1);
}

uint64_t sub_10002C8F8()
{
  return sub_100028E4C( *(void (**)(uint64_t))(v0 + 16),  *(void *)(v0 + 24),  (uint64_t (*)(uint64_t))&type metadata accessor for Date,  &qword_100038970,  (uint64_t)&protocol conformance descriptor for Date);
}

uint64_t sub_10002C928()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002C938()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002C948()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10002C96C(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc(dword_10003886C);
  __int128 v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_10002C9D4;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return swift_task_switch(sub_1000260C0, 0LL, 0LL);
}

uint64_t sub_10002C9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  swift_task_dealloc(*(void *)(*v2 + 16));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t sub_10002CA34(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc(dword_10003887C);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_10002E028;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100038878 + dword_100038878))(a1, a2, v6);
}

uint64_t sub_10002CAB4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10002CAD8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002CAE8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

unint64_t sub_10002CAFC()
{
  unint64_t result = qword_100038898;
  if (!qword_100038898)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CloudError, &type metadata for CloudError);
    atomic_store(result, (unint64_t *)&qword_100038898);
  }

  return result;
}

uint64_t sub_10002CB40()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002CB50()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

id sub_10002CB60(void *a1, char a2)
{
  if ((a2 & 1) != 0) {
    return (id)swift_errorRetain();
  }
  else {
    return a1;
  }
}

uint64_t sub_10002CB6C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002CB7C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002CB8C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002CB9C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

void sub_10002CBAC(void *a1, char a2)
{
  if ((a2 & 1) != 0) {
    swift_errorRelease(a1);
  }
  else {
}
  }

uint64_t sub_10002CBB8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10002CBE0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002CBF0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

char *sub_10002CC00(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v4 < 0)
    {
      unint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    __int128 v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  unint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

void *sub_10002CCE8(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for TaskType(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  unint64_t v9 = (char *)&v37 - v8;
  uint64_t v10 = type metadata accessor for MLHostTask(0LL);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v47 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  uint64_t v48 = (char *)&v37 - v14;
  unint64_t result = _swiftEmptyArrayStorage;
  uint64_t v53 = _swiftEmptyArrayStorage;
  uint64_t v16 = *(void *)(a1 + 16);
  if (v16)
  {
    uint64_t v17 = *(unsigned __int8 *)(v13 + 80);
    uint64_t v18 = *(void *)(v13 + 72);
    uint64_t v37 = v1;
    uint64_t v38 = (v17 + 32) & ~v17;
    uint64_t v19 = a1 + v38;
    uint64_t v44 = v13;
    uint64_t v42 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 16);
    unsigned int v41 = enum case for TaskType.dynamicTask(_:);
    uint64_t v39 = v4;
    uint64_t v40 = v10;
    unint64_t v45 = v9;
    unint64_t v46 = v7;
    uint64_t v43 = v18;
    for (uint64_t i = v42(v48, v19, v10); ; uint64_t i = v42(v48, v19, v21))
    {
      MLHostTask.taskType.getter(i);
      (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, v41, v3);
      uint64_t v23 = v4;
      uint64_t v24 = sub_100009FBC( &qword_100038960,  (uint64_t (*)(uint64_t))&type metadata accessor for TaskType,  (uint64_t)&protocol conformance descriptor for TaskType);
      dispatch thunk of RawRepresentable.rawValue.getter(&v51, v3, v24);
      dispatch thunk of RawRepresentable.rawValue.getter(&v49, v3, v24);
      uint64_t v25 = v52;
      uint64_t v26 = v50;
      if (v51 == v49 && v52 == v50)
      {
        swift_bridgeObjectRelease_n(v52, 2LL);
        uint64_t v31 = *(void (**)(char *, uint64_t))(v23 + 8);
        v31(v7, v3);
        v31(v9, v3);
      }

      else
      {
        char v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v51, v52, v49, v50, 0LL);
        swift_bridgeObjectRelease(v25);
        swift_bridgeObjectRelease(v26);
        uint64_t v29 = v23;
        uint64_t v30 = *(void (**)(char *, uint64_t))(v23 + 8);
        v30(v7, v3);
        v30(v9, v3);
        if ((v28 & 1) == 0)
        {
          uint64_t v21 = v40;
          (*(void (**)(char *, uint64_t))(v44 + 8))(v48, v40);
          unint64_t v9 = v45;
          uint64_t v22 = v43;
          uint64_t v4 = v29;
          goto LABEL_4;
        }
      }

      uint64_t v32 = *(void (**)(char *, char *, uint64_t))(v44 + 32);
      uint64_t v21 = v40;
      v32(v47, v48, v40);
      unint64_t v33 = v53;
      if ((swift_isUniquelyReferenced_nonNull_native(v53) & 1) == 0)
      {
        sub_10002B8D0(0, v33[2] + 1LL, 1);
        unint64_t v33 = v53;
      }

      unint64_t v9 = v45;
      unint64_t v35 = v33[2];
      unint64_t v34 = v33[3];
      if (v35 >= v34 >> 1)
      {
        sub_10002B8D0(v34 > 1, v35 + 1, 1);
        unint64_t v33 = v53;
      }

      v33[2] = v35 + 1;
      uint64_t v36 = (uint64_t)v33 + v38 + v35 * v43;
      uint64_t v22 = v43;
      v32((char *)v36, v47, v21);
      uint64_t v53 = v33;
      uint64_t v4 = v39;
LABEL_4:
      v19 += v22;
      --v16;
      uint64_t v7 = v46;
      if (!v16) {
        return v53;
      }
    }
  }

  return result;
}

uint64_t sub_10002D028()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for MLHostTask);
}

uint64_t sub_10002D034()
{
  return sub_10002DA08( (void (*)(void))&type metadata accessor for MLHostTask,  (uint64_t (*)(void))&MLHostTask.name.getter);
}

uint64_t sub_10002D048()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D058()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D068()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v4);
  uint64_t v1 = v4;
  uint64_t v2 = Set.description.getter(v4, &type metadata for String, &protocol witness table for String);
  swift_bridgeObjectRelease(v1);
  return v2;
}

uint64_t sub_10002D0D0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D0E0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D0F0@<X0>(void *a1@<X8>)
{
  return sub_100026680(v1, a1);
}

uint64_t sub_10002D10C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D11C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D12C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_10002D170(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc(dword_1000388C4);
  __int128 v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_10002E018;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return swift_task_switch(sub_10002660C, 0LL, 0LL);
}

uint64_t sub_10002D1D8(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc(dword_10003887C);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_100027EA4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100038878 + dword_100038878))(a1, a2, v6);
}

uint64_t sub_10002D258()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D268()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D278()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D288()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D298()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D2A8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D2B8()
{
  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v4);
  uint64_t v1 = v4;
  uint64_t v2 = Array.description.getter(v4, &type metadata for String);
  swift_bridgeObjectRelease(v1);
  return v2;
}

uint64_t sub_10002D318()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D328()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D338(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc(dword_1000388DC);
  __int128 v5 = *(_OWORD *)(v1 + 16);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_10002E018;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return swift_task_switch(sub_10002660C, 0LL, 0LL);
}

uint64_t sub_10002D3A0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D3B0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D3C0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D3D0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D3E0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D3F0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D400()
{
  return sub_100028F10( *(void (**)(uint64_t *__return_ptr))(v0 + 16),  *(void *)(v0 + 24),  type metadata accessor for TaskParametersRecord);
}

uint64_t sub_10002D420()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D430()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D440(uint64_t a1)
{
  return sub_1000268A0(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_10002D460()
{
  return sub_10002DC34(type metadata accessor for TaskParametersRecord);
}

uint64_t sub_10002D46C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D47C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D48C@<X0>(void *a1@<X8>)
{
  uint64_t v3 = *(void *)(v1 + 16);
  *a1 = v3;
  return swift_bridgeObjectRetain(v3);
}

uint64_t sub_10002D4D0()
{
  return sub_100028F10( *(void (**)(uint64_t *__return_ptr))(v0 + 16),  *(void *)(v0 + 24),  type metadata accessor for TaskPayloadRecord);
}

uint64_t sub_10002D4F0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D500()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D514()
{
  return sub_10002DC34(type metadata accessor for TaskPayloadRecord);
}

uint64_t sub_10002D520()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D530()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D540()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10002D550()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D560()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D578()
{
  uint64_t v1 = type metadata accessor for TaskPayloadRecord(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 8));
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 24));
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 40));
  uint64_t v6 = v0 + v4 + *(int *)(v1 + 28);
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10002D630()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D640()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D650()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_10002D65C@<X0>(uint64_t a1@<X8>)
{
  return sub_10002D864((uint64_t (*)(void))&type metadata accessor for URL, a1);
}

uint64_t sub_10002D668()
{
  return sub_100028E4C( *(void (**)(uint64_t))(v0 + 16),  *(void *)(v0 + 24),  (uint64_t (*)(uint64_t))&type metadata accessor for URL,  &qword_100038948,  (uint64_t)&protocol conformance descriptor for URL);
}

uint64_t sub_10002D698()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D6A8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D6B8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D6C8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D6D8()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_10002D6E4()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D6F4()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D704()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_10002D710()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D720()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D730()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D740()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D750()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_10002D75C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D76C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D780()
{
  uint64_t v1 = type metadata accessor for TaskParametersRecord(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 8));
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 24));
  sub_1000085B4(*(void *)(v0 + v4 + 32), *(void *)(v0 + v4 + 40));
  uint64_t v6 = v0 + v4 + *(int *)(v1 + 28);
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10002D838()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D848()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D858()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_10002D864@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0LL);
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))( a2,  v2 + ((*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL) + 16LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v4 - 8) + 80LL)),  v4);
}

uint64_t sub_10002D8AC()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D8BC()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D8CC()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D8DC()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D8EC()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D8FC()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D90C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D91C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D92C()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for MLHostTask);
}

uint64_t sub_10002D938()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D948()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D958()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for TaskDefinition);
}

uint64_t sub_10002D964()
{
  return sub_10002DA08( (void (*)(void))&type metadata accessor for TaskDefinition,  (uint64_t (*)(void))&TaskDefinition.name.getter);
}

uint64_t sub_10002D978()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D988()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002D998()
{
  return sub_10002D9A4((uint64_t (*)(void))&type metadata accessor for TaskDefinition);
}

uint64_t sub_10002D9A4(uint64_t (*a1)(void))
{
  uint64_t v2 = a1(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return swift_deallocObject(v1, v6, v7);
}

uint64_t sub_10002DA08(void (*a1)(void), uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_10002DA48()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DA58()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DA68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007B74(&qword_1000383B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

id sub_10002DAB0()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_10002DAB8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DAC8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DAD8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002DB20()
{
  return sub_10002DC34(type metadata accessor for TaskRecord);
}

uint64_t sub_10002DB2C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DB3C()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DB50()
{
  uint64_t v1 = (int *)type metadata accessor for TaskRecord(0LL);
  uint64_t v2 = *((void *)v1 - 1);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 8));
  swift_bridgeObjectRelease(*(void *)(v0 + v4 + 24));
  sub_1000085B4(*(void *)(v0 + v4 + 32), *(void *)(v0 + v4 + 40));
  uint64_t v6 = v0 + v4 + v1[7];
  uint64_t v7 = type metadata accessor for Date(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  unint64_t v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v9(v6, v7);
  v9(v0 + v4 + v1[8], v7);
  uint64_t v10 = v0 + v4 + v1[9];
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_10002DC34(uint64_t (*a1)(void))
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(a1(0LL) - 8) + 80LL);
  uint64_t v3 = (uint64_t *)(v1 + ((v2 + 16) & ~v2));
  uint64_t v4 = *v3;
  swift_bridgeObjectRetain(v3[1]);
  return v4;
}

uint64_t sub_10002DC80()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DC90()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DCA0()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_errorRetain(v1);
  return v1;
}

uint64_t sub_10002DCC8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DCD8()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DCE8()
{
  uint64_t v1 = (*(uint64_t (**)(void))(v0 + 16))();
  return _swift_stdlib_bridgeErrorToNSError(v1);
}

uint64_t sub_10002DD08()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

double sub_10002DD18()
{
  return *(double *)(v0 + 16);
}

uint64_t sub_10002DD20()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DD30()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DD40(uint64_t *a1)
{
  double v3 = (*(double (**)(void))(v1 + 16))();
  uint64_t v4 = *a1 + 8;
  double v6 = v3;
  uint64_t result = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v6, &v7);
  *a1 = v4;
  return result;
}

uint64_t sub_10002DD90()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_10002DDA0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t *sub_10002DDB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    uint64_t v4 = swift_slowAlloc(*(void *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }

  return a2;
}

uint64_t sub_10002DDF0( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
    goto LABEL_11;
  }

  uint64_t v9 = *(void *)(a5(0LL) - 8);
  uint64_t v10 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v11 = *(void *)(v9 + 72);
  unint64_t v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  uint64_t v13 = v11 * v5;
  unint64_t v14 = a3 + v13;
  unint64_t v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v14;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10002DF08(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_10002D12C(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_10002DF48(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10002DF50()
{
  return sub_100028CC0(v0);
}

uint64_t sub_10002DF58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002DF68(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10002DF70(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002DF98(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002DFC0(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_10002DFF8(uint64_t a1)
{
  return sub_10002D440(a1) & 1;
}

uint64_t Array<A>.mean()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __chkstk_darwin(a1);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = Array.count.getter(v4);
  uint64_t v8 = v7 - 1;
  if (v7 < 1) {
    return 0LL;
  }
  double v9 = 0.0;
  uint64_t v10 = 1LL;
  while (1)
  {
    Array.subscript.getter(v10 - 1, a1, a2);
    sub_10002E7B4();
    BinaryFloatingPoint.init<A>(_:)(&v14, v6);
    double v9 = v9 + (v14 - v9) / (double)v10;
    if (!v8) {
      break;
    }
    --v8;
    if (__OFADD__(v10++, 1LL))
    {
      __break(1u);
      return *(void *)&v9;
    }
  }

  return *(void *)&v9;
}

uint64_t Array<A>.median()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 - 8);
  uint64_t v7 = __chkstk_darwin(a1);
  double v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v7);
  unint64_t v12 = (char *)&v23 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  unint64_t v15 = (char *)&v23 - v14;
  uint64_t v16 = Array.count.getter(v13);
  if (v16 < 1)
  {
    *(double *)&uint64_t result = 0.0;
  }

  else
  {
    double v24 = *(double *)&a1;
    uint64_t v17 = type metadata accessor for Array(0LL, a2);
    uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v17);
    uint64_t v19 = *(void *)(a3 + 16);
    uint64_t v20 = Sequence<>.sorted()(v17, WitnessTable, *(void *)(*(void *)(v19 + 24) + 8LL));
    Array.subscript.getter((unint64_t)v16 >> 1, v20, a2);
    if ((v16 & 1) != 0)
    {
      swift_bridgeObjectRelease(v20);
      sub_10002E7B4();
      BinaryFloatingPoint.init<A>(_:)(&v24, v15);
      *(double *)&uint64_t result = v24;
    }

    else
    {
      Array.subscript.getter(((unint64_t)v16 >> 1) - 1, v20, a2);
      swift_bridgeObjectRelease(v20);
      dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)( v12,  v9,  a2,  *(void *)(*(void *)(*(void *)(v19 + 16) + 8LL) + 8LL));
      uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
      v21(v9, a2);
      v21(v12, a2);
      sub_10002E7B4();
      BinaryFloatingPoint.init<A>(_:)(&v24, v15);
      *(double *)&uint64_t result = v24 * 0.5;
    }
  }

  return result;
}

uint64_t Array<A>.stddev()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = __chkstk_darwin(a1);
  uint64_t v7 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v22 - v9;
  uint64_t v11 = Array.count.getter(v8);
  if (v11 < 2)
  {
LABEL_13:
    double v13 = 0.0;
    return *(void *)&v13;
  }

  uint64_t v12 = v11;
  double v13 = COERCE_DOUBLE(Array<A>.mean()(a1, a2));
  if ((v14 & 1) != 0) {
    return *(void *)&v13;
  }
  uint64_t v15 = swift_bridgeObjectRetain(a1);
  if (!Array.endIndex.getter(v15, a2))
  {
    swift_bridgeObjectRelease(a1);
    double v17 = 0.0;
LABEL_16:
    double v13 = sqrt(v17 / (double)v12);
    return *(void *)&v13;
  }

  uint64_t v22 = v12;
  uint64_t v16 = 0LL;
  double v17 = 0.0;
  while (1)
  {
    Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
    Array._checkSubscript(_:wasNativeTypeChecked:)(v16, IsNativeType, a1, a2);
    if (IsNativeType)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))( v10,  a1 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))
      + *(void *)(v4 + 72) * v16,
        a2);
      uint64_t v19 = v16 + 1;
      if (__OFADD__(v16, 1LL)) {
        goto LABEL_12;
      }
      goto LABEL_7;
    }

    uint64_t result = _ArrayBuffer._getElementSlowPath(_:)(v16, a1, a2);
    if (v5 != 8) {
      break;
    }
    uint64_t v21 = result;
    double v23 = *(double *)&result;
    (*(void (**)(char *, double *, uint64_t))(v4 + 16))(v10, &v23, a2);
    swift_unknownObjectRelease(v21);
    uint64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1LL))
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }

LABEL_7:
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v10, a2);
    sub_10002E7B4();
    BinaryFloatingPoint.init<A>(_:)(&v23, v7);
    double v17 = v17 + (v23 - v13) * (v23 - v13);
    ++v16;
    if (v19 == Array.endIndex.getter(a1, a2))
    {
      swift_bridgeObjectRelease(a1);
      uint64_t v12 = v22;
      goto LABEL_16;
    }
  }

  __break(1u);
  return result;
}

unint64_t sub_10002E7B4()
{
  unint64_t result = qword_100038988;
  if (!qword_100038988)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Double, &type metadata for Double);
    atomic_store(result, (unint64_t *)&qword_100038988);
  }

  return result;
}