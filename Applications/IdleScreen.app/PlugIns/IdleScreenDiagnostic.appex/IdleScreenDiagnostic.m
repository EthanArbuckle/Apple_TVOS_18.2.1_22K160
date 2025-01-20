uint64_t sub_100001D84(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  v3 = a2[3];
  v4 = a2[4];
  sub_100001DF0(a2, v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
}

void *sub_100001DF0(void *result, uint64_t a2)
{
  int v2 = *(_DWORD *)(*(void *)(a2 - 8) + 80LL);
  if ((v2 & 0x20000) != 0) {
    return (void *)(*result + ((v2 + 16LL) & ~(unint64_t)v2));
  }
  return result;
}

void *type metadata accessor for DiagnosticStringUtility()
{
  return &unk_10000C5A8;
}

uint64_t sub_100001E58()
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100001EFC(v3, qword_100010298);
  sub_100001F6C(v3, (uint64_t)qword_100010298);
  Swift::String v0 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "com.apple.IdleScreen.diagnosticextension",  0x28uLL,  1);
  Swift::String v1 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
  return Logger.init(subsystem:category:)(v0._countAndFlagsBits, v0._object, v1._countAndFlagsBits, v1._object);
}

uint64_t sub_100001EFC(uint64_t a1, uint64_t *a2)
{
  v5 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v2 = swift_slowAlloc( *(void *)(*(void *)(a1 - 8) + 64LL),  *(_DWORD *)(*(void *)(a1 - 8) + 80LL));
    *a2 = v2;
    return v2;
  }

  return (uint64_t)v5;
}

uint64_t sub_100001F6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0) {
    return *(void *)a2;
  }
  return v3;
}

uint64_t sub_100001FAC()
{
  if (qword_100010198 != -1) {
    ((void (*)(uint64_t *, uint64_t (*)()))swift_once)(&qword_100010198, sub_100001E58);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  return sub_100001F6C(v0, (uint64_t)qword_100010298);
}

uint64_t sub_10000200C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  int v176 = a1;
  uint64_t v144 = a2;
  uint64_t v145 = a3;
  uint64_t v123 = a4;
  uint64_t v122 = a5;
  uint64_t v146 = a6;
  uint64_t v147 = a7;
  char v201 = 0;
  uint64_t v199 = 0LL;
  uint64_t v200 = 0LL;
  uint64_t v197 = 0LL;
  uint64_t v198 = 0LL;
  uint64_t v195 = 0LL;
  uint64_t v196 = 0LL;
  uint64_t v194 = 0LL;
  uint64_t v192 = 0LL;
  uint64_t v193 = 0LL;
  uint64_t v184 = 0LL;
  uint64_t v185 = 0LL;
  uint64_t v121 = 0LL;
  uint64_t v130 = 0LL;
  uint64_t v126 = type metadata accessor for URL(0LL);
  uint64_t v124 = *(void *)(v126 - 8);
  uint64_t v7 = __chkstk_darwin(v123, v122, v145);
  v125 = (char *)v111 - v8;
  char v201 = v176;
  uint64_t v199 = v144;
  uint64_t v200 = v9;
  uint64_t v197 = v7;
  uint64_t v198 = v10;
  uint64_t v195 = v11;
  uint64_t v196 = v12;
  uint64_t v194 = v13;
  uint64_t v14 = URL.init(fileURLWithPath:)();
  uint64_t v128 = URL.lastPathComponent.getter(v14);
  uint64_t v129 = v15;
  uint64_t v192 = v128;
  uint64_t v193 = v15;
  (*(void (**)(char *, uint64_t))(v124 + 8))(v125, v126);
  Builtin::Word v136 = 1LL;
  uint64_t v16 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)(2LL);
  v139 = &v190;
  uint64_t v190 = v16;
  uint64_t v191 = v17;
  int v137 = 1;
  Swift::String v18 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("[", v136, 1);
  object = v18._object;
  DefaultStringInterpolation.appendLiteral(_:)(v18);
  swift_bridgeObjectRelease(object);
  uint64_t v188 = v128;
  uint64_t v189 = v129;
  Swift::String v19 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)(" ", v136, v137 & 1);
  v131 = &v187;
  Swift::String v187 = v19;
  unint64_t v20 = sub_100002F84();
  v134 = &type metadata for String;
  uint64_t v132 = StringProtocol.padding<A>(toLength:withPad:startingAt:)( 30LL,  v131,  v130,  &type metadata for String,  &type metadata for String,  v20);
  uint64_t v133 = v21;
  sub_100002FEC((uint64_t)v131);
  v135 = v186;
  v186[0] = v132;
  v186[1] = v133;
  DefaultStringInterpolation.appendInterpolation<A>(_:)();
  sub_100002FEC((uint64_t)v135);
  Swift::String v22 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("]", v136, v137 & 1);
  v138 = v22._object;
  DefaultStringInterpolation.appendLiteral(_:)(v22);
  swift_bridgeObjectRelease(v138);
  uint64_t v141 = v190;
  uint64_t v140 = v191;
  swift_bridgeObjectRetain(v191);
  sub_100003014((uint64_t)v139);
  uint64_t v142 = String.init(stringInterpolation:)(v141, v140);
  uint64_t v143 = v23;
  uint64_t v184 = v142;
  uint64_t v185 = v23;
  swift_bridgeObjectRetain(v23);
  uint64_t v159 = 32LL;
  uint64_t v160 = 7LL;
  uint64_t v24 = swift_allocObject(&unk_10000C5C8, 32LL, 7LL);
  uint64_t v25 = v143;
  uint64_t v26 = v24;
  uint64_t v27 = v145;
  uint64_t v152 = v26;
  *(void *)(v26 + 16) = v142;
  *(void *)(v26 + 24) = v25;
  swift_bridgeObjectRetain(v27);
  uint64_t v28 = swift_allocObject(&unk_10000C5F0, v159, v160);
  uint64_t v29 = v145;
  uint64_t v30 = v28;
  uint64_t v31 = v147;
  uint64_t v154 = v30;
  *(void *)(v30 + 16) = v144;
  *(void *)(v30 + 24) = v29;
  swift_bridgeObjectRetain(v31);
  uint64_t v32 = swift_allocObject(&unk_10000C618, v159, v160);
  uint64_t v33 = v147;
  uint64_t v161 = v32;
  *(void *)(v32 + 16) = v146;
  *(void *)(v32 + 24) = v33;
  v175 = (os_log_s *)Logger.logObject.getter();
  v150 = &v182;
  uint64_t v182 = v159;
  unint64_t v148 = sub_1000034F8();
  unint64_t v149 = sub_100003560();
  unint64_t v34 = sub_1000035C8();
  UnsignedInteger<>.init<A>(_:)(&v183, v150, &type metadata for UInt32, &type metadata for Int, v148, v149, v34);
  uint32_t v151 = v183;
  uint64_t v157 = 17LL;
  uint64_t v35 = swift_allocObject(&unk_10000C640, 17LL, v160);
  uint64_t v36 = v157;
  uint64_t v37 = v160;
  uint64_t v163 = v35;
  int v156 = 32;
  *(_BYTE *)(v35 + 16) = 32;
  uint64_t v38 = swift_allocObject(&unk_10000C668, v36, v37);
  uint64_t v39 = v159;
  uint64_t v40 = v160;
  uint64_t v164 = v38;
  int v158 = 8;
  *(_BYTE *)(v38 + 16) = 8;
  uint64_t v41 = swift_allocObject(&unk_10000C690, v39, v40);
  uint64_t v42 = v159;
  uint64_t v43 = v160;
  uint64_t v44 = v41;
  uint64_t v45 = v152;
  uint64_t v153 = v44;
  *(void *)(v44 + 16) = sub_1000030A8;
  *(void *)(v44 + 24) = v45;
  uint64_t v46 = swift_allocObject(&unk_10000C6B8, v42, v43);
  uint64_t v47 = v157;
  uint64_t v48 = v160;
  uint64_t v49 = v46;
  uint64_t v50 = v153;
  uint64_t v165 = v49;
  *(void *)(v49 + 16) = sub_1000046E8;
  *(void *)(v49 + 24) = v50;
  uint64_t v51 = swift_allocObject(&unk_10000C6E0, v47, v48);
  uint64_t v52 = v157;
  uint64_t v53 = v160;
  uint64_t v166 = v51;
  *(_BYTE *)(v51 + 16) = v156;
  uint64_t v54 = swift_allocObject(&unk_10000C708, v52, v53);
  uint64_t v55 = v159;
  uint64_t v56 = v160;
  uint64_t v167 = v54;
  *(_BYTE *)(v54 + 16) = v158;
  uint64_t v57 = swift_allocObject(&unk_10000C730, v55, v56);
  uint64_t v58 = v159;
  uint64_t v59 = v160;
  uint64_t v60 = v57;
  uint64_t v61 = v154;
  uint64_t v155 = v60;
  *(void *)(v60 + 16) = sub_100003120;
  *(void *)(v60 + 24) = v61;
  uint64_t v62 = swift_allocObject(&unk_10000C758, v58, v59);
  uint64_t v63 = v157;
  uint64_t v64 = v160;
  uint64_t v65 = v62;
  uint64_t v66 = v155;
  uint64_t v168 = v65;
  *(void *)(v65 + 16) = sub_1000047D8;
  *(void *)(v65 + 24) = v66;
  uint64_t v67 = swift_allocObject(&unk_10000C780, v63, v64);
  uint64_t v68 = v157;
  uint64_t v69 = v160;
  uint64_t v169 = v67;
  *(_BYTE *)(v67 + 16) = v156;
  uint64_t v70 = swift_allocObject(&unk_10000C7A8, v68, v69);
  uint64_t v71 = v159;
  uint64_t v72 = v160;
  uint64_t v170 = v70;
  *(_BYTE *)(v70 + 16) = v158;
  uint64_t v73 = swift_allocObject(&unk_10000C7D0, v71, v72);
  uint64_t v74 = v159;
  uint64_t v75 = v160;
  uint64_t v76 = v73;
  uint64_t v77 = v161;
  uint64_t v162 = v76;
  *(void *)(v76 + 16) = sub_100003198;
  *(void *)(v76 + 24) = v77;
  uint64_t v78 = swift_allocObject(&unk_10000C7F8, v74, v75);
  uint64_t v79 = v162;
  uint64_t v172 = v78;
  *(void *)(v78 + 16) = sub_1000048C8;
  *(void *)(v78 + 24) = v79;
  uint64_t v174 = sub_10000491C(&qword_1000101C0);
  uint64_t v171 = _allocateUninitializedArray<A>(_:)(9LL);
  v173 = v80;
  swift_retain(v163);
  uint64_t v81 = v164;
  uint64_t v82 = v163;
  v83 = v173;
  void *v173 = sub_100004674;
  v83[1] = v82;
  swift_retain(v81);
  uint64_t v84 = v165;
  uint64_t v85 = v164;
  v86 = v173;
  v173[2] = sub_1000046A4;
  v86[3] = v85;
  swift_retain(v84);
  uint64_t v87 = v166;
  uint64_t v88 = v165;
  v89 = v173;
  v173[4] = sub_100004730;
  v89[5] = v88;
  swift_retain(v87);
  uint64_t v90 = v167;
  uint64_t v91 = v166;
  v92 = v173;
  v173[6] = sub_100004764;
  v92[7] = v91;
  swift_retain(v90);
  uint64_t v93 = v168;
  uint64_t v94 = v167;
  v95 = v173;
  v173[8] = sub_100004794;
  v95[9] = v94;
  swift_retain(v93);
  uint64_t v96 = v169;
  uint64_t v97 = v168;
  v98 = v173;
  v173[10] = sub_100004820;
  v98[11] = v97;
  swift_retain(v96);
  uint64_t v99 = v170;
  uint64_t v100 = v169;
  v101 = v173;
  v173[12] = sub_100004854;
  v101[13] = v100;
  swift_retain(v99);
  uint64_t v102 = v172;
  uint64_t v103 = v170;
  v104 = v173;
  v173[14] = sub_100004884;
  v104[15] = v103;
  swift_retain(v102);
  uint64_t v105 = v171;
  uint64_t v106 = v172;
  v107 = v173;
  v173[16] = sub_100004910;
  v107[17] = v106;
  sub_1000034B8();
  swift_bridgeObjectRelease(v105);
  if (os_log_type_enabled(v175, (os_log_type_t)v176))
  {
    uint64_t v108 = v121;
    v114 = (uint8_t *)static UnsafeMutablePointer.allocate(capacity:)(32LL, &type metadata for UInt8);
    uint64_t v113 = sub_10000491C(&qword_1000101C8);
    uint64_t v115 = sub_100003630(0LL, v113, v113);
    uint64_t v116 = sub_100003630(3LL, (uint64_t)&type metadata for Any + 8, (uint64_t)&type metadata for Any + 8);
    v117 = &v181;
    v181 = v114;
    v118 = &v180;
    uint64_t v180 = v115;
    v119 = &v179;
    uint64_t v179 = v116;
    sub_100003688(2LL, &v181);
    sub_100003688(3LL, v117);
    v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100004674;
    uint64_t v178 = v163;
    sub_10000369C(&v177, (uint64_t)v117, (uint64_t)v118, (uint64_t)v119);
    uint64_t v120 = v108;
    if (v108)
    {
      __break(1u);
    }

    else
    {
      v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1000046A4;
      uint64_t v178 = v164;
      sub_10000369C(&v177, (uint64_t)&v181, (uint64_t)&v180, (uint64_t)&v179);
      uint64_t v112 = 0LL;
      uint64_t v109 = v112;
      v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100004730;
      uint64_t v178 = v165;
      sub_10000369C(&v177, (uint64_t)&v181, (uint64_t)&v180, (uint64_t)&v179);
      v111[5] = v109;
      v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100004764;
      uint64_t v178 = v166;
      sub_10000369C(&v177, (uint64_t)&v181, (uint64_t)&v180, (uint64_t)&v179);
      v111[4] = 0LL;
      v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100004794;
      uint64_t v178 = v167;
      sub_10000369C(&v177, (uint64_t)&v181, (uint64_t)&v180, (uint64_t)&v179);
      v111[3] = 0LL;
      v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100004820;
      uint64_t v178 = v168;
      sub_10000369C(&v177, (uint64_t)&v181, (uint64_t)&v180, (uint64_t)&v179);
      v111[2] = 0LL;
      v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100004854;
      uint64_t v178 = v169;
      sub_10000369C(&v177, (uint64_t)&v181, (uint64_t)&v180, (uint64_t)&v179);
      v111[1] = 0LL;
      v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100004884;
      uint64_t v178 = v170;
      sub_10000369C(&v177, (uint64_t)&v181, (uint64_t)&v180, (uint64_t)&v179);
      v111[0] = 0LL;
      v177 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100004910;
      uint64_t v178 = v172;
      sub_10000369C(&v177, (uint64_t)&v181, (uint64_t)&v180, (uint64_t)&v179);
      _os_log_impl((void *)&_mh_execute_header, v175, (os_log_type_t)v176, "%s %s\nIn function: %s", v114, v151);
      sub_1000036E0(v115, 0LL);
      sub_1000036E0(v116, 3LL);
      UnsafeMutablePointer.deallocate()();
      swift_release(v163);
      swift_release(v164);
      swift_release(v165);
      swift_release(v166);
      swift_release(v167);
      swift_release(v168);
      swift_release(v169);
      swift_release(v170);
      swift_release(v172);
    }
  }

  else
  {
    swift_release(v163);
    swift_release(v164);
    swift_release(v165);
    swift_release(v166);
    swift_release(v167);
    swift_release(v168);
    swift_release(v169);
    swift_release(v170);
    swift_release(v172);
  }

  swift_bridgeObjectRelease(v143);
  return swift_bridgeObjectRelease(v129);
}

unint64_t sub_100002F84()
{
  uint64_t v2 = qword_1000101A0;
  if (!qword_1000101A0)
  {
    unint64_t v0 = ((uint64_t (*)(void *, void *))swift_getWitnessTable)( &protocol conformance descriptor for String,  &type metadata for String);
    atomic_store(v0, (unint64_t *)&qword_1000101A0);
    return v0;
  }

  return v2;
}

uint64_t sub_100002FEC(uint64_t a1)
{
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100003014( uint64_t a1)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000303C()
{
}

uint64_t sub_10000306C()
{
  return swift_deallocObject(v2, 32LL, 7LL);
}

uint64_t sub_1000030A8()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_10000303C();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000030B4()
{
}

uint64_t sub_1000030E4()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100003120()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_1000030B4();
  return result;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000312C()
{
}

uint64_t sub_10000315C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100003198()
{
  uint64_t result = *(void *)(v0 + 16);
  sub_10000312C();
  return result;
}

uint64_t sub_1000031A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v26 = 0LL;
  uint64_t v31 = a1;
  uint64_t v29 = a2;
  uint64_t v30 = a3;
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  int v20 = static os_log_type_t.error.getter();
  uint64_t v24 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)(19LL);
  uint64_t v25 = v5;
  Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Encountered error: ", 0x13uLL, 1);
  object = v6._object;
  DefaultStringInterpolation.appendLiteral(_:)(v6);
  swift_bridgeObjectRelease(object);
  uint64_t v23 = a1;
  uint64_t v7 = sub_10000491C(&qword_1000101D0);
  DefaultStringInterpolation.appendInterpolation<A>(_:)(&v23, v7);
  Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
  uint64_t v13 = v8._object;
  DefaultStringInterpolation.appendLiteral(_:)(v8);
  swift_bridgeObjectRelease(v13);
  uint64_t v15 = v24;
  uint64_t v14 = v25;
  swift_bridgeObjectRetain(v25);
  sub_100003014((uint64_t)&v24);
  uint64_t v21 = String.init(stringInterpolation:)(v15, v14);
  uint64_t v22 = v9;
  sub_10000200C(v20, v21, v9, a2, a3, a4, a5);
  return swift_bridgeObjectRelease(v22);
}

uint64_t sub_100003324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v27 = 0LL;
  uint64_t v32 = a1;
  uint64_t v33 = a2;
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  uint64_t v28 = a5;
  uint64_t v29 = a6;
  int v21 = static os_log_type_t.error.getter();
  uint64_t v25 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)(19LL);
  uint64_t v26 = v6;
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Encountered error: ", 0x13uLL, 1);
  object = v7._object;
  DefaultStringInterpolation.appendLiteral(_:)(v7);
  swift_bridgeObjectRelease(object);
  v24[0] = a1;
  v24[1] = a2;
  DefaultStringInterpolation.appendInterpolation<A>(_:)( v24,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
  Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
  uint64_t v14 = v8._object;
  DefaultStringInterpolation.appendLiteral(_:)(v8);
  swift_bridgeObjectRelease(v14);
  uint64_t v16 = v25;
  uint64_t v15 = v26;
  swift_bridgeObjectRetain(v26);
  sub_100003014((uint64_t)&v25);
  uint64_t v22 = String.init(stringInterpolation:)(v16, v15);
  uint64_t v23 = v9;
  sub_10000200C(v21, v22, v9, a3, a4, a5, a6);
  return swift_bridgeObjectRelease(v23);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000034B8()
{
}

unint64_t sub_1000034F8()
{
  uint64_t v2 = qword_1000101A8;
  if (!qword_1000101A8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000101A8);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_100003560()
{
  uint64_t v2 = qword_1000101B0;
  if (!qword_1000101B0)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000101B0);
    return WitnessTable;
  }

  return v2;
}

unint64_t sub_1000035C8()
{
  uint64_t v2 = qword_1000101B8;
  if (!qword_1000101B8)
  {
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000101B8);
    return WitnessTable;
  }

  return v2;
}

uint64_t sub_100003630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return static UnsafeMutablePointer.allocate(capacity:)(a1, a3);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100003688(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_10000369C( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

void sub_1000036E0(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    UnsafeMutablePointer.deinitialize(count:)(a2);
    UnsafeMutablePointer.deallocate()();
  }
}

void sub_10000374C()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_100003758(uint64_t (*a1)(void))
{
  return a1();
}

void *sub_100003778(void *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v4 = a4();
  uint64_t v9 = v5;
  uint64_t v6 = sub_1000037F4(v4, v5, a3);
  uint64_t v10 = *a1;
  uint64_t v12 = v6;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  swift_bridgeObjectRelease(v9);
  uint64_t result = a1;
  *a1 = v10 + 8;
  return result;
}

uint64_t sub_1000037F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v14 = sub_100003964((uint64_t)&v17, 0LL, 0LL, 1, a1, a2);
  uint64_t v15 = v3;
  __int16 v16 = v4;
  uint64_t v11 = v17;
  if (v14)
  {
    v12[3] = swift_getObjectType();
    v12[0] = v14;
    uint64_t v6 = *a3;
    if (*a3)
    {
      sub_1000049F0((uint64_t)v12, v6);
      *a3 = v6 + 32;
    }

    sub_100004988(v12);
  }

  else
  {
    v13[3] = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v7 = *a3;
    if (*a3)
    {
      sub_1000049F0((uint64_t)v13, v7);
      *a3 = v7 + 32;
    }

    swift_bridgeObjectRetain(a2);
    sub_100004988(v13);
  }

  return v11;
}

uint64_t sub_100003964(uint64_t result, void *a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v17 = (void *)result;
  uint64_t v25 = a6;
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (a2)
      {
        if (!a3) {
          __break(1u);
        }
        int64_t v16 = a3 - (void)a2;
      }

      else
      {
        int64_t v16 = 0LL;
      }

      int64_t v15 = (a6 & 0xF00000000000000uLL) >> 56;
      if (v15 < v16)
      {
        if (a2)
        {
          v22[0] = a5;
          v22[1] = a6 & (-(uint64_t)bswap64(0xFFuLL) - 1);
          sub_100003CD8(v22, v15, a2);
          UnsafeMutableRawBufferPointer.subscript.setter(0LL, v15, a2, a3);
          *uint64_t v17 = a2;
          uint64_t v11 = 0LL;
          uint64_t v12 = v15;
          char v13 = 1;
          char v14 = 0;
LABEL_26:
          v22[2] = v11;
          v22[3] = v12;
          char v23 = v13 & 1;
          char v24 = v14 & 1;
          return (uint64_t)v11;
        }

        goto LABEL_28;
      }
    }

LABEL_13:
    uint64_t v6 = sub_100003D14(a5, a6);
    *uint64_t v17 = v7;
    uint64_t v11 = v6;
    uint64_t v12 = v8;
    char v13 = 0;
    char v14 = 1;
    goto LABEL_26;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0xFFFFFFFFFFFFFFE0LL)
    {
      uint64_t v10 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
      goto LABEL_21;
    }

    __break(1u);
  }

  uint64_t result = _StringObject.sharedUTF8.getter(a5, a6);
  if (!result) {
    goto LABEL_29;
  }
  uint64_t v10 = result;
LABEL_21:
  *uint64_t v17 = v10;
  if (a6 < 0)
  {
    uint64_t v9 = 0LL;
LABEL_25:
    uint64_t v11 = (void *)v9;
    uint64_t v12 = a5 & 0xFFFFFFFFFFFFLL;
    char v13 = 0;
    char v14 = 0;
    goto LABEL_26;
  }

  if ((a6 & 0xFFFFFFFFFFFFFFFLL) != 0)
  {
    swift_unknownObjectRetain();
    uint64_t v9 = a6 & 0xFFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }

  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void *sub_100003CD8(const void *a1, size_t a2, void *__dst)
{
  return __dst;
}

void *sub_100003D14(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = sub_100003DC4(a1, a2);
  sub_100003F3C();
  uint64_t v4 = v6[2];
  sub_100003FB0(v4);
  sub_100004030(v4, 0);
  sub_10000409C();
  swift_retain(v6);
  uint64_t v5 = sub_1000040A8((uint64_t)v6);
  swift_bridgeObjectRelease(v6);
  uint64_t result = (void *)v5;
  if (!__OFSUB__(v5, 1LL)) {
    return v6;
  }
  __break(1u);
  return result;
}

void *sub_100003DC4(uint64_t a1, uint64_t a2)
{
  v10[2] = a2;
  if ((a2 & 0x1000000000000000LL) != 0)
  {
    uint64_t v7 = String.UTF8View._foreignCount()();
  }

  else if ((a2 & 0x2000000000000000LL) != 0)
  {
    uint64_t v7 = (a2 & 0xF00000000000000uLL) >> 56;
  }

  else
  {
    uint64_t v7 = a1 & 0xFFFFFFFFFFFFLL;
  }

  if (!v7) {
    return sub_100004224();
  }
  uint64_t v5 = sub_1000040BC(v7, 0LL);
  swift_retain(v5);
  swift_release(v5);
  uint64_t result = (void *)_StringGuts.copyUTF8(into:)(v5 + 4, v7, a1, a2);
  uint64_t v6 = result;
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    swift_bridgeObjectRetain(0xE000000000000000LL);
    uint64_t result = v10;
    v10[0] = 0LL;
    v10[1] = 0xE000000000000000LL;
    sub_100004A64((uint64_t)v10);
    if (v6 == (void *)v7) {
      return v5;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_100003F3C()
{
  uint64_t v4 = *v0;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v0 = v4;
  if ((result & 1) == 0)
  {
    uint64_t v2 = sub_1000040A8(*v3);
    uint64_t result = sub_100004250(0, v2 + 1, 1, *v3);
    *char v3 = result;
  }

  return result;
}

uint64_t sub_100003FB0(uint64_t result)
{
  if (*(void *)(*(void *)v1 + 24LL) >> 1 < result + 1)
  {
    uint64_t result = sub_100004250(*(void *)(*(void *)v1 + 24LL) >> 1 != 0LL, result + 1, 1, *v2);
    *uint64_t v2 = result;
  }

  return result;
}

uint64_t sub_100004030(uint64_t a1, char a2)
{
  uint64_t v5 = a1 + 1;
  uint64_t v4 = *v2;
  swift_bridgeObjectRetain();
  *(void *)(v4 + 16) = v5;
  swift_release();
  uint64_t v6 = *v2;
  swift_retain();
  *(_BYTE *)(v6 + 32 + a1) = a2;
  return swift_release();
}

void sub_10000409C()
{
  *uint64_t v0 = *v0;
}

uint64_t sub_1000040A8(uint64_t a1)
{
  return sub_10000454C(a1);
}

void *sub_1000040BC(uint64_t a1, uint64_t a2)
{
  if (a2 < a1) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = a2;
  }
  if (v7)
  {
    uint64_t v2 = sub_10000491C(&qword_1000101D8);
    uint64_t v6 = (void *)swift_allocObject(v2, v7 + 32, 7LL);
    if ((sub_100004A34() & 1) != 0)
    {
      size_t v4 = (size_t)v6 + sub_100004A40(v6);
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * (v4 - (void)(v6 + 4));
    }

    else
    {
      swift_retain(v6);
      v6[2] = a1;
      v6[3] = 2 * v7;
    }

    swift_release(v6);
    return v6;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    return &_swiftEmptyArrayStorage;
  }

void *sub_100004224()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100004250(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t result = swift_retain(a4);
  uint64_t v16 = *(void *)(a4 + 24) >> 1;
  if ((a3 & 1) != 0)
  {
    if (v16 < a2)
    {
      if ((unsigned __int128)(v16 * (__int128)2LL) >> 64 != (2 * v16) >> 63)
      {
        __break(1u);
        return result;
      }

      if (2 * v16 < a2) {
        uint64_t v11 = a2;
      }
      else {
        uint64_t v11 = 2 * v16;
      }
    }

    else
    {
      uint64_t v11 = *(void *)(a4 + 24) >> 1;
    }
  }

  else
  {
    uint64_t v11 = a2;
  }

  int64_t v10 = *(void *)(a4 + 16);
  if (v11 < v10) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v11;
  }
  if (v9)
  {
    uint64_t v5 = sub_10000491C(&qword_1000101D8);
    uint64_t v8 = (void *)swift_allocObject(v5, v9 + 32, 7LL);
    if ((sub_100004A34() & 1) != 0)
    {
      size_t v6 = (size_t)v8 + sub_100004A40(v8);
      swift_retain(v8);
      v8[2] = v10;
      v8[3] = 2 * (v6 - (void)(v8 + 4));
    }

    else
    {
      swift_retain(v8);
      v8[2] = v10;
      v8[3] = 2 * v9;
    }

    swift_release(v8);
    uint64_t v7 = (char *)v8;
  }

  else
  {
    swift_retain(&_swiftEmptyArrayStorage);
    uint64_t v7 = (char *)&_swiftEmptyArrayStorage;
  }

  if ((a1 & 1) != 0)
  {
    swift_release(a4);
    swift_bridgeObjectRelease(a4);
    sub_100004588((char *)(a4 + 32), v10, v7 + 32);
    *(void *)(a4 + 16) = 0LL;
    swift_release(a4);
  }

  else
  {
    swift_bridgeObjectRelease(a4);
    swift_release(a4);
    swift_retain(a4);
    swift_release(a4);
    sub_100004554((const void *)(a4 + 32), v10, v7 + 32);
    swift_unknownObjectRelease(a4);
  }

  return (uint64_t)v7;
}

uint64_t sub_10000454C(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

void *sub_100004554(const void *a1, size_t a2, void *__dst)
{
  return memcpy(__dst, a1, a2);
}

char *sub_100004588(char *result, size_t a2, char *a3)
{
  if (a3 < result || a3 >= &result[a2] || a3 != result) {
    return (char *)memmove(a3, result, a2);
  }
  return result;
}

_BYTE **sub_100004638(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  size_t v4 = *result;
  *size_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_10000464C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100004674(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100004638(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000467C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_1000046A4(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100004638(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1000046AC()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000046E8()
{
  return sub_100003758(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000046F4()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100004730(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100003778(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000473C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100004764(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100004638(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000476C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100004794(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100004638(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000479C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000047D8()
{
  return sub_100003758(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000047E4()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100004820(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100003778(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000482C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100004854(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100004638(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000485C()
{
  return swift_deallocObject(v0, 17LL);
}

_BYTE **sub_100004884(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  return sub_100004638(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_10000488C()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_1000048C8()
{
  return sub_100003758(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1000048D4()
{
  return swift_deallocObject(v2, 32LL);
}

void *sub_100004910(void *a1, uint64_t a2, uint64_t *a3)
{
  return sub_100003778(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10000491C(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContext2 = swift_getTypeByMangledNameInContext2((char *)a1 + (int)*a1, -(*a1 >> 32), 0LL);
    *a1 = TypeByMangledNameInContext2;
    return TypeByMangledNameInContext2;
  }

  return v4;
}

uint64_t sub_100004988(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

uint64_t sub_1000049F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

uint64_t sub_100004A34()
{
  return 1LL;
}

size_t sub_100004A40(const void *a1)
{
  return malloc_size(a1);
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100004A64( uint64_t a1)
{
}

uint64_t sub_100004A90(uint64_t a1)
{
  v9[2] = a1;
  v9[1] = a1;
  uint64_t v7 = sub_10000491C(&qword_1000101E0);
  unint64_t v1 = sub_1000056E8();
  v9[0] = sub_100004EFC( (void (*)(char *, char *))sub_100004BB4,  0LL,  v7,  (uint64_t)&type metadata for String,  (uint64_t)&type metadata for Never,  v1,  (uint64_t)&protocol witness table for Never,  v8);
  Swift::String v2 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\n\n", 2uLL, 1);
  uint64_t v5 = sub_10000491C(&qword_1000101F0);
  unint64_t v3 = sub_1000057CC();
  uint64_t v6 = BidirectionalCollection<>.joined(separator:)(v2._countAndFlagsBits, v2._object, v5, v3);
  swift_bridgeObjectRelease(v2._object);
  sub_10000583C(v9);
  return v6;
}

uint64_t *sub_100004BB4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v42 = 0LL;
  uint64_t v39 = 0LL;
  uint64_t v31 = *(uint64_t (**)(uint64_t))a1;
  uint64_t v32 = *(void *)(a1 + 8);
  unint64_t v34 = *(uint64_t (**)(uint64_t))(a1 + 16);
  uint64_t v33 = *(void *)(a1 + 24);
  uint64_t v42 = a1;
  uint64_t v3 = swift_retain(v33);
  uint64_t v35 = v34(v3);
  if (v2)
  {
    swift_release(v33);
    swift_errorRetain(v2);
    uint64_t v39 = v2;
    uint64_t v37 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)(16LL);
    uint64_t v38 = v11;
    Swift::String v12 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Error occurred: ", 0x10uLL, 1);
    object = v12._object;
    DefaultStringInterpolation.appendLiteral(_:)(v12);
    swift_bridgeObjectRelease(object);
    uint64_t v36 = v2;
    uint64_t v13 = sub_10000491C(&qword_1000101D0);
    DefaultStringInterpolation.appendInterpolation<A>(_:)(&v36, v13);
    Swift::String v14 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, 1);
    uint64_t v17 = v14._object;
    DefaultStringInterpolation.appendLiteral(_:)(v14);
    swift_bridgeObjectRelease(v17);
    uint64_t v19 = v37;
    uint64_t v18 = v38;
    swift_bridgeObjectRetain(v38);
    sub_100003014((uint64_t)&v37);
    uint64_t v40 = String.init(stringInterpolation:)(v19, v18);
    uint64_t v41 = v15;
    swift_errorRelease(v2);
    swift_errorRelease(v2);
  }

  else
  {
    uint64_t v40 = v35;
    uint64_t v41 = v4;
    swift_release(v33);
  }

  uint64_t v5 = swift_retain(v32);
  uint64_t v24 = v31(v5);
  uint64_t v27 = v6;
  Swift::String v7 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\n----------\n", 0xCuLL, 1);
  uint64_t v25 = static String.+ infix(_:_:)(v24, v27, v7._countAndFlagsBits);
  uint64_t v26 = v8;
  swift_bridgeObjectRelease(v7._object);
  swift_bridgeObjectRelease(v27);
  swift_release(v32);
  uint64_t v28 = v40;
  uint64_t v29 = v41;
  swift_bridgeObjectRetain(v41);
  if (v29)
  {
    uint64_t v22 = v28;
    uint64_t v23 = v29;
  }

  else
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while implicitly unwrapping an Optional value",  68LL,  2LL,  "IdleScreenDiagnostic/DiagnosticStringFormatter.swift",  52LL,  2,  24LL,  0);
    __break(1u);
  }

  uint64_t v20 = static String.+ infix(_:_:)(v25, v26, v22);
  uint64_t v21 = v9;
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v26);
  *a2 = v20;
  a2[1] = v21;
  uint64_t result = &v40;
  sub_1000058B4((uint64_t)&v40);
  return result;
}

uint64_t sub_100004EFC( void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v61 = a3;
  uint64_t v52 = a4;
  uint64_t v39 = a5;
  uint64_t v60 = a6;
  uint64_t v42 = a8;
  uint64_t v43 = "Fatal error";
  uint64_t v44 = "Index out of bounds";
  uint64_t v45 = "Swift/Collection.swift";
  uint64_t v46 = "Range requires lowerBound <= upperBound";
  uint64_t v47 = "Swift/Range.swift";
  uint64_t v48 = "Index out of range";
  v72[3] = a3;
  v72[2] = a4;
  v72[1] = a5;
  uint64_t v49 = *(void *)(a5 - 8);
  unint64_t v50 = (*(void *)(v49 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(a1, a2, a3);
  uint64_t v51 = (char *)v22 - v50;
  uint64_t v53 = 0LL;
  uint64_t v54 = ((uint64_t (*)(void))swift_getAssociatedTypeWitness)();
  uint64_t v55 = *(void *)(v54 - 8);
  unint64_t v56 = (*(void *)(v55 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v8 = __chkstk_darwin(v53, v60, v61);
  uint64_t v57 = (char *)v22 - v56;
  unint64_t v58 = (*(void *)(*(void *)(v9 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v12 = __chkstk_darwin(v8, v10, v11);
  uint64_t v59 = (char *)v22 - v58;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(v12);
  uint64_t v63 = *(void *)(AssociatedTypeWitness - 8);
  unint64_t v64 = (*(void *)(v63 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v14 = __chkstk_darwin(v61, v60, v13);
  uint64_t v65 = (char *)v22 - v64;
  unint64_t v66 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v17 = __chkstk_darwin(v14, v16, (char *)v22 - v64);
  uint64_t v67 = (char *)v22 - v66;
  Swift::Int v68 = dispatch thunk of Collection.count.getter(v17);
  if (v68)
  {
    v72[0] = ContiguousArray.init()(v52);
    uint64_t v36 = type metadata accessor for ContiguousArray(0LL, v52);
    ContiguousArray.reserveCapacity(_:)(v68);
    uint64_t result = dispatch thunk of Collection.startIndex.getter(v61, v60);
    if (v68 >= 0)
    {
      uint64_t v34 = 0LL;
      for (uint64_t i = v41; ; uint64_t i = v25)
      {
        uint64_t v32 = i;
        uint64_t v33 = v34;
        if (v34 == v68) {
          goto LABEL_17;
        }
        if (v33 < 0 || v33 >= v68) {
          goto LABEL_16;
        }
        uint64_t v70 = v33;
        if (v68 < 0) {
          goto LABEL_15;
        }
        if (v33 >= v68) {
          break;
        }
        uint64_t v31 = v33 + 1;
        if (__OFADD__(v33, 1LL))
        {
          __break(1u);
          return result;
        }

        char v71 = 0;
        uint64_t v30 = v31;
LABEL_18:
        uint64_t v29 = v30;
        if ((v71 & 1) != 0)
        {
          (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v65, v67, AssociatedTypeWitness);
          _expectEnd<A>(of:is:)(v40, v65, v61, v60);
          (*(void (**)(char *, uint64_t))(v63 + 8))(v65, AssociatedTypeWitness);
          uint64_t v26 = v72[0];
          swift_retain(v72[0]);
          swift_release(v26);
          uint64_t v27 = v26;
          uint64_t v28 = v32;
          return v27;
        }

        uint64_t v24 = &v69;
        uint64_t v23 = (void (*)(char *, void))dispatch thunk of Collection.subscript.read();
        (*(void (**)(char *))(v55 + 16))(v57);
        v23(v24, 0LL);
        uint64_t v20 = v32;
        v37(v57, v51);
        uint64_t v25 = v20;
        if (v20)
        {
          (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v54);
          (*(void (**)(char *, uint64_t))(v63 + 8))(v67, AssociatedTypeWitness);
          sub_10000588C(v72);
          (*(void (**)(uint64_t, char *, uint64_t))(v49 + 32))(v42, v51, v39);
          return v22[1];
        }

        (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v54);
        ContiguousArray.append(_:)(v59, v36);
        dispatch thunk of Collection.formIndex(after:)(v67, v61, v60);
        uint64_t result = v25;
        uint64_t v34 = v29;
      }

      LOBYTE(v21) = 2;
      _assertionFailure(_:_:file:line:flags:)(v43, 11LL, 2LL, v44, 19LL, 2LL, v45, 22LL, v21, 714LL, 0);
      __break(1u);
LABEL_15:
      LOBYTE(v21) = 2;
      _assertionFailure(_:_:file:line:flags:)(v43, 11LL, 2LL, v46, 39LL, 2LL, v47, 17LL, v21, 754LL, 0);
      __break(1u);
LABEL_16:
      LOBYTE(v21) = 2;
      _fatalErrorMessage(_:_:file:line:flags:)(v43, 11LL, 2LL, v48, 18LL, 2LL, v47, 17LL, v21, 305LL, 0);
      __break(1u);
LABEL_17:
      uint64_t v70 = 0LL;
      char v71 = 1;
      uint64_t v30 = v33;
      goto LABEL_18;
    }

    _assertionFailure(_:_:file:line:flags:)(v43, 11LL, 2LL, v46, 39LL, 2LL, v47, 17LL, 2, 754LL, 0);
    __break(1u);
  }

  uint64_t v27 = static Array._allocateUninitialized(_:)(0LL, v52);
  uint64_t v28 = v41;
  return v27;
}

unint64_t sub_1000056E8()
{
  uint64_t v3 = qword_1000101E8;
  if (!qword_1000101E8)
  {
    uint64_t v0 = sub_100005758(&qword_1000101E0);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000101E8);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_100005758(uint64_t *a1)
{
  uint64_t v4 = *a1;
  if (*a1 < 0)
  {
    uint64_t TypeByMangledNameInContextInMetadataState2 = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)*a1,  -(*a1 >> 32),  0LL);
    *a1 = TypeByMangledNameInContextInMetadataState2;
    return TypeByMangledNameInContextInMetadataState2;
  }

  return v4;
}

unint64_t sub_1000057CC()
{
  uint64_t v3 = qword_1000101F8;
  if (!qword_1000101F8)
  {
    uint64_t v0 = sub_100005758(&qword_1000101F0);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_1000101F8);
    return WitnessTable;
  }

  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000583C( void *a1)
{
}

uint64_t sub_100005864(uint64_t a1)
{
  return sub_100004A90(a1);
}

void *type metadata accessor for DiagnosticStringDefaultFormatter()
{
  return &unk_10000C820;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_10000588C( void *a1)
{
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1000058B4( uint64_t a1)
{
}

uint64_t sub_1000058DC(uint64_t a1)
{
  uint64_t v11 = 0LL;
  uint64_t v12 = a1;
  sub_100005990(v1 + OBJC_IVAR____TtC20IdleScreenDiagnostic27DiagnosticExtensionProvider_provider, (uint64_t)v8);
  uint64_t v5 = v9;
  uint64_t v4 = v10;
  sub_100001DF0(v8, v9);
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
  unint64_t v2 = sub_1000059DC();
  uint64_t v7 = _arrayForceCast<A, B>(_:)(v6, v2, (char *)&type metadata for Any + 8);
  swift_bridgeObjectRelease(v6);
  sub_100005A40(v8);
  return v7;
}

uint64_t sub_100005990(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t))(v2 - 8))(a2);
  return a2;
}

unint64_t sub_1000059DC()
{
  uint64_t v3 = qword_100010208;
  if (!qword_100010208)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___DEAttachmentItem);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100010208);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_100005A40(void *a1)
{
  uint64_t v2 = a1[3];
  if ((*(_DWORD *)(*(void *)(v2 - 8) + 80LL) & 0x20000) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void *))(*(void *)(v2 - 8) + 8LL))(a1);
  }
}

id sub_100005BDC()
{
  id v1 = v0;
  uint64_t v16 = v0;
  uint64_t v12 = OBJC_IVAR____TtC20IdleScreenDiagnostic27DiagnosticExtensionProvider_provider;
  sub_10000491C(&qword_100010238);
  uint64_t v11 = _allocateUninitializedArray<A>(_:)(1LL);
  uint64_t v10 = v2;
  id v3 = sub_1000075F0();
  void v10[3] = &unk_10000CB00;
  v10[4] = &off_10000CB18;
  *uint64_t v10 = v3;
  v10[1] = v4;
  v10[2] = v5;
  sub_1000034B8();
  uint64_t v6 = sub_1000072CC(v11);
  uint64_t v7 = (uint64_t *)&v13[v12];
  v7[3] = (uint64_t)&unk_10000C9F0;
  v7[4] = (uint64_t)&off_10000CA08;
  *uint64_t v7 = v6;

  v15.receiver = v16;
  v15.super_class = (Class)type metadata accessor for DiagnosticExtensionProvider();
  id v14 = objc_msgSendSuper2(&v15, "init");
  id v8 = v14;
  uint64_t v16 = v14;

  return v14;
}

id sub_100005D1C()
{
  id v3 = v0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DiagnosticExtensionProvider();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DiagnosticExtensionProvider()
{
  return objc_opt_self(&OBJC_CLASS____TtC20IdleScreenDiagnostic27DiagnosticExtensionProvider);
}

uint64_t sub_100005DB8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  return swift_release(a4);
}

uint64_t sub_100005E3C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), uint64_t a5)
{
  return swift_release(a5);
}

uint64_t sub_100005EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&__int128 v6 = a3;
  *((void *)&v6 + 1) = a4;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  swift_retain(a2);
  swift_retain(a2);
  *(void *)&__int128 v8 = a1;
  *((void *)&v8 + 1) = a2;
  swift_retain(*((void *)&v6 + 1));
  swift_retain(*((void *)&v6 + 1));
  __int128 v9 = v6;
  swift_retain(a2);
  swift_retain(*((void *)&v6 + 1));
  swift_release(*((void *)&v6 + 1));
  swift_release(a2);
  swift_release(*((void *)&v6 + 1));
  swift_release(a2);
  sub_100005FA0((uint64_t)&v8);
  return a1;
}

uint64_t sub_100005FA0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100005FD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  swift_retain(a2);
  swift_retain(a2);
  *(void *)&__int128 v10 = a1;
  *((void *)&v10 + 1) = a2;
  swift_retain(a4);
  uint64_t v8 = swift_allocObject(&unk_10000C850, 32LL, 7LL);
  *(void *)(v8 + 16) = a3;
  *(void *)(v8 + 24) = a4;
  swift_retain(v8);
  *(void *)&__int128 v11 = sub_100006490;
  *((void *)&v11 + 1) = v8;
  swift_retain(a2);
  swift_retain(v8);
  swift_release(v8);
  swift_release(a2);
  swift_release(a4);
  swift_release(a2);
  sub_100005FA0((uint64_t)&v10);
  return a1;
}

uint64_t sub_1000060F8(void (*a1)(void, void, void, void), uint64_t a2)
{
  uint64_t v31 = a1;
  uint64_t v32 = a2;
  dispatch_semaphore_t v19 = dispatch_semaphore_create(0LL);
  dispatch_semaphore_t v30 = v19;
  uint64_t v21 = swift_allocObject(&unk_10000C978, 33LL, 7LL);
  uint64_t v29 = v21 + 16;
  *(void *)(v21 + 16) = 0LL;
  *(void *)(v21 + 24) = 0LL;
  *(_BYTE *)(v21 + 32) = -1;
  swift_retain(v21);
  id v3 = v19;
  uint64_t v13 = swift_allocObject(&unk_10000C9A0, 32LL, 7LL);
  *(void *)(v13 + 16) = v21;
  *(void *)(v13 + 24) = v19;
  swift_retain(v21);
  uint64_t v4 = v19;
  uint64_t v5 = swift_allocObject(&unk_10000C9C8, 32LL, 7LL);
  *(void *)(v5 + 16) = v21;
  *(void *)(v5 + 24) = v19;
  uint64_t v14 = nullsub_2(sub_1000070EC, v13, sub_1000071E0);
  uint64_t v15 = v6;
  uint64_t v16 = v7;
  uint64_t v17 = v8;
  uint64_t v25 = v14;
  uint64_t v26 = v6;
  uint64_t v27 = v7;
  uint64_t v28 = v8;
  swift_retain(a2);
  a1(v14, v15, v16, v17);
  swift_release(a2);
  OS_dispatch_semaphore.wait()();
  swift_beginAccess(v21 + 16);
  uint64_t v22 = *(void *)(v21 + 16);
  uint64_t v23 = *(unsigned __int8 *)(v21 + 32);
  sub_1000071EC(v22, *(void *)(v21 + 24), v23);
  uint64_t v9 = swift_endAccess(v24);
  if (v23 == 255)
  {
    Swift::String v11 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Programming error.", 0x12uLL, 1);
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v11._countAndFlagsBits,  v11._object,  "IdleScreenDiagnostic/DiagnosticStringItem.swift",  47LL);
    __break(1u);
  }

  else if ((v23 & 1) != 0)
  {
    swift_willThrow(v9);
    swift_release(v15);
    swift_release(v17);
    swift_release(v21);

    return v12;
  }

  else
  {
    swift_release(v15);
    swift_release(v17);
    swift_release(v21);

    return v22;
  }

  return result;
}

uint64_t sub_100006454()
{
  return swift_deallocObject(v2, 32LL);
}

uint64_t sub_100006490()
{
  return sub_1000060F8(*(void (**)(void, void, void, void))(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_1000064B8(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  swift_retain(*a2);
  *a1 = v4;
  return *a1 + 16LL;
}

uint64_t sub_1000064F4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 24));
}

void *sub_100006524(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  swift_retain(v4);
  *a1 = v3;
  a1[1] = v4;
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  swift_retain(v8);
  uint64_t result = a1;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

void *sub_100006598(void *a1, uint64_t *a2)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  swift_retain(v6);
  *a1 = v5;
  uint64_t v2 = a1[1];
  a1[1] = v6;
  swift_release(v2);
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  swift_retain(v9);
  a1[2] = v8;
  uint64_t v3 = a1[3];
  a1[3] = v9;
  swift_release(v3);
  return a1;
}

__n128 sub_100006620(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  *(__n128 *)(a1 + 16) = result;
  return result;
}

void *sub_100006634(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_release(v4);
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  uint64_t v6 = a1[3];
  a1[3] = v5;
  swift_release(v6);
  return a1;
}

uint64_t sub_100006694(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    {
      int v4 = *(void *)a1 + 0x7FFFFFFF;
    }

    else
    {
      int v3 = -1;
      int v4 = v3;
    }
  }

  else
  {
    int v4 = -1;
  }

  return (v4 + 1);
}

uint64_t sub_1000067F0(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)__n128 result = a2 + 0x80000000;
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 32) = 1;
      }
      else {
        __break(1u);
      }
    }
  }

  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 32) = 0;
      }
      else {
        __break(1u);
      }
    }

    if (a2) {
      *(void *)__n128 result = a2 - 1;
    }
  }

  return result;
}

void *type metadata accessor for DiagnosticStringItem()
{
  return &unk_10000C8D0;
}

uint64_t sub_100006A0C(void *a1, void *a2)
{
  uint64_t v4 = *a2;
  swift_retain(*a2);
  *a1 = v4;
  return *a1 + 16LL;
}

uint64_t sub_100006A48(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 24));
}

void *sub_100006A78(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  swift_retain(v4);
  *a1 = v3;
  a1[1] = v4;
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  swift_retain(v8);
  __n128 result = a1;
  a1[2] = v7;
  a1[3] = v8;
  return result;
}

void *sub_100006AEC(void *a1, uint64_t *a2)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  swift_retain(v6);
  *a1 = v5;
  uint64_t v2 = a1[1];
  a1[1] = v6;
  swift_release(v2);
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  swift_retain(v9);
  a1[2] = v8;
  uint64_t v3 = a1[3];
  a1[3] = v9;
  swift_release(v3);
  return a1;
}

void *sub_100006B74(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_release(v4);
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  uint64_t v6 = a1[3];
  a1[3] = v5;
  swift_release(v6);
  return a1;
}

uint64_t sub_100006BD4(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 > 0x7FFFFFFF && *(_BYTE *)(a1 + 32))
    {
      int v4 = *(void *)a1 + 0x7FFFFFFF;
    }

    else
    {
      int v3 = -1;
      int v4 = v3;
    }
  }

  else
  {
    int v4 = -1;
  }

  return (v4 + 1);
}

uint64_t sub_100006D30(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)__n128 result = a2 + 0x80000000;
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 32) = 1;
      }
      else {
        __break(1u);
      }
    }
  }

  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 32) = 0;
      }
      else {
        __break(1u);
      }
    }

    if (a2) {
      *(void *)__n128 result = a2 - 1;
    }
  }

  return result;
}

void *type metadata accessor for DiagnosticStringItem.Continuation()
{
  return &unk_10000C950;
}

uint64_t sub_100006F4C()
{
  return swift_deallocObject(v2, 33LL);
}

uint64_t sub_100006FB0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_errorRelease(a1);
  }
  else {
    return swift_bridgeObjectRelease(a2);
  }
}

Swift::Int sub_100006FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v8 = a3 + 16;
  uint64_t v14 = a3 + 16;
  uint64_t v13 = a4;
  swift_bridgeObjectRetain(a2);
  swift_beginAccess(v8);
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(a3 + 24);
  unsigned __int8 v6 = *(_BYTE *)(a3 + 32);
  *(void *)(a3 + 16) = a1;
  *(void *)(a3 + 24) = a2;
  *(_BYTE *)(a3 + 32) = 0;
  sub_10000727C(v4, v5, v6);
  swift_endAccess(v12);
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_1000070A8()
{
  return swift_deallocObject(v2, 32LL);
}

Swift::Int sub_1000070EC(uint64_t a1, uint64_t a2)
{
  return sub_100006FF0(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

Swift::Int sub_1000070F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v13 = a1;
  uint64_t v7 = a2 + 16;
  uint64_t v12 = a2 + 16;
  uint64_t v11 = a3;
  swift_errorRetain(a1);
  swift_beginAccess(v7);
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a2 + 24);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 32);
  *(void *)(a2 + 16) = a1;
  *(void *)(a2 + 24) = 0LL;
  *(_BYTE *)(a2 + 32) = 1;
  sub_10000727C(v3, v4, v5);
  swift_endAccess(v10);
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_10000719C()
{
  return swift_deallocObject(v2, 32LL);
}

Swift::Int sub_1000071E0(uint64_t a1)
{
  return sub_1000070F8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_1000071EC(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_10000723C(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_10000723C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_errorRetain(a1);
  }
  else {
    return swift_bridgeObjectRetain(a2);
  }
}

uint64_t sub_10000727C(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255) {
    return sub_100006FB0(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_1000072CC(uint64_t a1)
{
  uint64_t v3 = 0LL;
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a1);
  uint64_t v3 = a1;
  swift_bridgeObjectRelease(a1);
  sub_100007328(&v3);
  return a1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100007328( void *a1)
{
}

uint64_t sub_100007350(uint64_t a1)
{
  v8[1] = a1;
  swift_bridgeObjectRetain(a1);
  v8[0] = a1;
  uint64_t v4 = sub_10000491C(&qword_100010240);
  uint64_t v5 = sub_10000491C(&qword_100010248);
  unint64_t v6 = sub_100007480();
  unint64_t v1 = sub_1000074F0();
  uint64_t v7 = Sequence.flatMap<A>(_:)(sub_100007418, 0LL, v4, v5, v6, v1);
  sub_100007560(v8);
  return v7;
}

uint64_t sub_100007418@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = a1[3];
  uint64_t v3 = a1[4];
  sub_100001DF0(a1, v4);
  uint64_t result = (*(uint64_t (**)(uint64_t))(v3 + 8))(v4);
  *a2 = result;
  return result;
}

unint64_t sub_100007480()
{
  uint64_t v3 = qword_100010250;
  if (!qword_100010250)
  {
    uint64_t v0 = sub_100005758(&qword_100010240);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100010250);
    return WitnessTable;
  }

  return v3;
}

unint64_t sub_1000074F0()
{
  uint64_t v3 = qword_100010258;
  if (!qword_100010258)
  {
    uint64_t v0 = sub_100005758(&qword_100010248);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100010258);
    return WitnessTable;
  }

  return v3;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100007560( void *a1)
{
}

uint64_t sub_100007588()
{
  return sub_100007350(*v0);
}

void *type metadata accessor for RootDiagnosticProvider()
{
  return &unk_10000C9F0;
}

uint64_t sub_1000075B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = nullsub_1();
  *(void *)(a1 + 24) = &unk_10000C820;
  *(void *)(a1 + 32) = &off_10000C830;
  return result;
}

id sub_1000075F0()
{
  id v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  sub_10000A3B8();
  id v8 = sub_1000076C0();
  id v0 = v8;
  id v9 = v8;
  id v5 = (id)PRSPosterRoleAmbient;
  id v1 = PRSPosterRoleAmbient;
  uint64_t v6 = sub_1000076EC(v5);
  uint64_t v7 = v2;

  swift_bridgeObjectRetain(v7);
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  id v3 = v8;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v7);

  sub_10000A41C((uint64_t)&v9);
  return v8;
}

id sub_1000076C0()
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v0));
  return sub_10000A450();
}

uint64_t sub_1000076EC(void *a1)
{
  id v1 = a1;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);

  return v4;
}

uint64_t sub_100007738(void *a1, uint64_t a2, uint64_t a3)
{
  v38[18] = a1;
  v38[19] = a2;
  v38[20] = a3;
  id v3 = a1;
  swift_bridgeObjectRetain(a3);
  uint64_t v4 = (void *)swift_allocObject(&unk_10000CA30, 40LL, 7LL);
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  uint64_t v23 = sub_100005FD4((uint64_t)sub_100007A6C, 0LL, (uint64_t)sub_100007C18, (uint64_t)v4);
  uint64_t v35 = v5;
  uint64_t v24 = v6;
  uint64_t v36 = v7;
  v38[13] = v23;
  v38[14] = v5;
  v38[15] = v6;
  v38[16] = v7;
  id v8 = a1;
  swift_bridgeObjectRetain(a3);
  id v9 = (void *)swift_allocObject(&unk_10000CA58, 40LL, 7LL);
  v9[2] = a1;
  void v9[3] = a2;
  v9[4] = a3;
  uint64_t v25 = sub_100005FD4((uint64_t)sub_100007E64, 0LL, (uint64_t)sub_100008048, (uint64_t)v9);
  uint64_t v33 = v10;
  uint64_t v26 = v11;
  uint64_t v34 = v12;
  v38[9] = v25;
  v38[10] = v10;
  v38[11] = v11;
  v38[12] = v12;
  id v13 = a1;
  swift_bridgeObjectRetain(a3);
  uint64_t v14 = (void *)swift_allocObject(&unk_10000CA80, 40LL, 7LL);
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = a3;
  uint64_t v28 = sub_100005FD4((uint64_t)sub_100008B24, 0LL, (uint64_t)sub_100008D08, (uint64_t)v14);
  uint64_t v31 = v15;
  uint64_t v29 = v16;
  uint64_t v32 = v17;
  v38[5] = v28;
  v38[6] = v15;
  v38[7] = v16;
  v38[8] = v17;
  uint64_t v27 = _allocateUninitializedArray<A>(_:)(3LL);
  dispatch_semaphore_t v30 = v18;
  swift_retain(v35);
  swift_retain(v36);
  *dispatch_semaphore_t v30 = v23;
  v30[1] = v35;
  v30[2] = v24;
  v30[3] = v36;
  swift_retain(v33);
  swift_retain(v34);
  v30[4] = v25;
  v30[5] = v33;
  v30[6] = v26;
  v30[7] = v34;
  swift_retain(v31);
  swift_retain(v32);
  v30[8] = v28;
  v30[9] = v31;
  v30[10] = v29;
  v30[11] = v32;
  sub_1000034B8();
  sub_1000075B4((uint64_t)v38);
  uint64_t v37 = sub_100001D84(v27, v38);
  sub_100005A40(v38);
  swift_bridgeObjectRelease(v27);
  swift_release(v31);
  swift_release(v32);
  swift_release(v33);
  swift_release(v34);
  swift_release(v35);
  swift_release(v36);
  return v37;
}

uint64_t sub_100007A6C()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Known Poster extensions", 0x17uLL, 1)._countAndFlagsBits;
}

void sub_100007A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, id a5, uint64_t a6, uint64_t a7)
{
  uint64_t v25 = a1;
  uint64_t v26 = a2;
  uint64_t v27 = a3;
  uint64_t v28 = a4;
  id v22 = a5;
  uint64_t v23 = a6;
  uint64_t v24 = a7;
  id v7 = a5;
  swift_retain(a2);
  swift_retain(a4);
  id v8 = (void *)swift_allocObject(&unk_10000CBD8, 48LL, 7LL);
  void v8[2] = a1;
  void v8[3] = a2;
  v8[4] = a3;
  v8[5] = a4;
  uint64_t v20 = sub_10000A7B8;
  uint64_t v21 = v8;
  aBlock = _NSConcreteStackBlock;
  int v16 = 1107296256;
  int v17 = 0;
  uint64_t v18 = sub_100007D90;
  dispatch_semaphore_t v19 = &unk_10000CBF0;
  id v13 = _Block_copy(&aBlock);
  swift_release(v21);
  [a5 fetchExtensionIdentifiersWithCompletion:v13];
  _Block_release(v13);
}

uint64_t sub_100007BD4()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  return swift_deallocObject(v2, 40LL);
}

void sub_100007C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_100007C28( uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, void (*a5)(uint64_t), uint64_t a6)
{
  if (a2)
  {
    sub_100005E3C(a2, (uint64_t)a3, a4, a5, a6);
    return swift_errorRelease(a2);
  }

  else
  {
    Swift::String v6 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\n", 1uLL, 1);
    uint64_t v10 = sub_10000491C(&qword_1000101F0);
    unint64_t v7 = sub_1000057CC();
    uint64_t v11 = BidirectionalCollection<>.joined(separator:)(v6._countAndFlagsBits, v6._object, v10, v7);
    uint64_t v12 = v8;
    swift_bridgeObjectRelease(v6._object);
    sub_100005DB8(v11, v12, a3, a4);
    return swift_bridgeObjectRelease(v12);
  }

uint64_t sub_100007D90(uint64_t a1, void *a2, void *a3)
{
  unint64_t v7 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  swift_retain(v8);
  id v3 = a2;
  uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for String);
  id v4 = a3;
  if (a3) {
    Swift::String v6 = a3;
  }
  else {
    Swift::String v6 = 0LL;
  }
  v7(v10);
  swift_errorRelease(v6);
  swift_bridgeObjectRelease(v10);

  return swift_release(v8);
}

uint64_t sub_100007E64()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Selected Poster", 0xFuLL, 1)._countAndFlagsBits;
}

void sub_100007E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, id a5, uint64_t a6, uint64_t a7)
{
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  id v24 = a5;
  uint64_t v25 = a6;
  uint64_t v26 = a7;
  id v7 = a5;
  swift_bridgeObjectRetain(a7);
  id v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a7);
  swift_retain(a2);
  swift_retain(a4);
  uint64_t v8 = (void *)swift_allocObject(&unk_10000CB88, 48LL, 7LL);
  void v8[2] = a1;
  void v8[3] = a2;
  v8[4] = a3;
  v8[5] = a4;
  id v22 = sub_10000A704;
  uint64_t v23 = v8;
  aBlock = _NSConcreteStackBlock;
  int v18 = 1107296256;
  int v19 = 0;
  uint64_t v20 = sub_100008A70;
  uint64_t v21 = &unk_10000CBA0;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_release(v23);
  [a5 fetchSelectedPosterForRole:v15 completion:v14];
  _Block_release(v14);
}

uint64_t sub_100008004()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  return swift_deallocObject(v2, 40LL);
}

void sub_100008048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void sub_100008058( void *a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, void (*a5)(uint64_t), uint64_t a6)
{
  if (a2)
  {
    sub_100005E3C(a2, (uint64_t)a3, a4, a5, a6);
    swift_errorRelease(a2);
  }

  else
  {
    id v6 = a1;
    if (a1)
    {
      uint64_t v7 = sub_1000081F8();
      uint64_t v10 = v8;
      sub_100005DB8(v7, v8, a3, a4);
      swift_bridgeObjectRelease(v10);
    }

    else
    {
      Swift::String v9 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("Programing Error", 0x10uLL, 1);
      _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  v9._countAndFlagsBits,  v9._object,  "IdleScreenDiagnostic/PosterBoardDiagnosticProvider.swift",  56LL);
      __break(1u);
    }
  }

uint64_t sub_1000081F8()
{
  uint64_t v77 = v92;
  v92[1] = 0LL;
  v92[0] = 0LL;
  uint64_t v69 = 0LL;
  uint64_t v61 = type metadata accessor for IdlePosterState();
  uint64_t v62 = *(void *)(v61 - 8);
  unint64_t v63 = (*(void *)(v62 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v3 = __chkstk_darwin(0LL, v1, v2);
  unint64_t v64 = (char *)&v31 - v63;
  uint64_t v65 = type metadata accessor for UUID(v3);
  uint64_t v66 = *(void *)(v65 - 8);
  unint64_t v67 = (*(void *)(v66 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v65, v4, v5);
  Swift::Int v68 = (char *)&v31 - v67;
  unint64_t v70 = (*(void *)(*(void *)(sub_10000491C(&qword_100010260) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v8 = __chkstk_darwin(v69, v6, v7);
  char v71 = (char *)&v31 - v70;
  unint64_t v72 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v11 = __chkstk_darwin(v8, (char *)&v31 - v70, v10);
  uint64_t v73 = (char *)&v31 - v72;
  uint64_t v74 = type metadata accessor for IdlePosterInfo(v11);
  uint64_t v75 = *(void *)(v74 - 8);
  unint64_t v76 = (*(void *)(v75 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v14 = __chkstk_darwin(v74, v12, v13);
  id v15 = v77;
  uint64_t v78 = (char *)&v31 - v76;
  v77[1] = (char *)&v31 - v76;
  *id v15 = v0;
  PRSPosterConfiguration.getIdlePosterInfo()(v14);
  uint64_t v90 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)(54LL);
  uint64_t v91 = v16;
  Swift::String v17 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("    UUID:\t ", 0xBuLL, 1);
  object = v17._object;
  DefaultStringInterpolation.appendLiteral(_:)(v17);
  swift_bridgeObjectRelease(object);
  id v81 = [v80 serverUUID];
  if (v81)
  {
    id v60 = v81;
    id v59 = v81;
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, char *, uint64_t))(v66 + 32))(v71, v68, v65);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v66 + 56))(v71, 0LL, 1LL, v65);
  }

  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v66 + 56))(v71, 1LL, 1LL, v65);
  }

  sub_100008D18(v71, v73);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v66 + 48))(v73, 1LL, v65) == 1)
  {
    uint64_t v32 = 0LL;
    sub_100008DD4((uint64_t)v73);
    v58._countAndFlagsBits = (uint64_t)v32;
    v58._object = v32;
  }

  else
  {
    v57._countAndFlagsBits = UUID.uuidString.getter();
    v57._object = v18;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v73, v65);
    Swift::String v58 = v57;
  }

  Swift::String v88 = v58;
  if (v58._object)
  {
    Swift::String v89 = v88;
  }

  else
  {
    Swift::String v89 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nil", 3uLL, 1);
    sub_1000058B4((uint64_t)&v88);
  }

  uint64_t v54 = &v87;
  Swift::String v87 = v89;
  uint64_t v53 = &v90;
  DefaultStringInterpolation.appendInterpolation<A>(_:)( &v87,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
  sub_100002FEC((uint64_t)v54);
  Swift::String v19 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\n    Provider:\t ", 0x10uLL, 1);
  uint64_t v55 = v19._object;
  DefaultStringInterpolation.appendLiteral(_:)(v19);
  swift_bridgeObjectRelease(v55);
  id v56 = [v80 providerBundleIdentifier];
  if (v56)
  {
    id v52 = v56;
    id v49 = v56;
    v50._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)(v56);
    v50._object = v20;

    Swift::String v51 = v50;
  }

  else
  {
    v51._countAndFlagsBits = 0LL;
    v51._object = 0LL;
  }

  Swift::String v85 = v51;
  if (v51._object)
  {
    Swift::String v86 = v85;
  }

  else
  {
    Swift::String v86 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("nil", 3uLL, 1);
    sub_1000058B4((uint64_t)&v85);
  }

  uint64_t v33 = &v84;
  Swift::String v84 = v86;
  uint64_t v37 = &type metadata for String;
  uint64_t v38 = &protocol witness table for String;
  uint64_t v39 = &protocol witness table for String;
  uint64_t v44 = &v90;
  DefaultStringInterpolation.appendInterpolation<A>(_:)( &v84,  &type metadata for String,  &protocol witness table for String,  &protocol witness table for String);
  sub_100002FEC((uint64_t)v33);
  int v42 = 1;
  Swift::String v21 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\n    State:\t ", 0xDuLL, 1);
  uint64_t v34 = v21._object;
  DefaultStringInterpolation.appendLiteral(_:)(v21);
  uint64_t v22 = swift_bridgeObjectRelease(v34);
  uint64_t v23 = IdlePosterInfo.posterState.getter(v22);
  uint64_t v35 = IdlePosterState.debugDescription.getter(v23);
  uint64_t v36 = v24;
  (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v61);
  uint64_t v40 = v83;
  v83[0] = v35;
  v83[1] = v36;
  DefaultStringInterpolation.appendInterpolation<A>(_:)(v83, v37, v38, v39);
  sub_100002FEC((uint64_t)v40);
  Swift::String v25 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\n    hidden:\t ", 0xEuLL, v42 & 1);
  uint64_t v41 = v25._object;
  DefaultStringInterpolation.appendLiteral(_:)(v25);
  uint64_t v26 = swift_bridgeObjectRelease(v41);
  char v27 = IdlePosterInfo.shouldHideInSwitcher.getter(v26);
  char v82 = v27 & v42;
  DefaultStringInterpolation.appendInterpolation<A>(_:)(&v82, &type metadata for Bool, &protocol witness table for Bool);
  Swift::String v28 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("", 0LL, v42 & 1);
  uint64_t v43 = v28._object;
  DefaultStringInterpolation.appendLiteral(_:)(v28);
  swift_bridgeObjectRelease(v43);
  uint64_t v46 = v90;
  uint64_t v45 = v91;
  swift_bridgeObjectRetain(v91);
  sub_100003014((uint64_t)v44);
  uint64_t v47 = String.init(stringInterpolation:)(v46, v45);
  uint64_t v48 = v29;
  (*(void (**)(char *, uint64_t))(v75 + 8))(v78, v74);
  return v47;
}

uint64_t sub_100008A70(uint64_t a1, void *a2, void *a3)
{
  uint64_t v7 = *(void (**)(void *))(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  swift_retain(v8);
  id v3 = a2;
  id v4 = a3;
  if (a3) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = 0LL;
  }
  v7(a2);
  swift_errorRelease(v6);

  return swift_release(v8);
}

uint64_t sub_100008B24()
{
  return String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("All Poster Configurations", 0x19uLL, 1)._countAndFlagsBits;
}

void sub_100008B50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, id a5, uint64_t a6, uint64_t a7)
{
  uint64_t v27 = a1;
  uint64_t v28 = a2;
  uint64_t v29 = a3;
  uint64_t v30 = a4;
  id v24 = a5;
  uint64_t v25 = a6;
  uint64_t v26 = a7;
  id v7 = a5;
  swift_bridgeObjectRetain(a7);
  id v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a7);
  swift_retain(a2);
  swift_retain(a4);
  uint64_t v8 = (void *)swift_allocObject(&unk_10000CB38, 48LL, 7LL);
  void v8[2] = a1;
  void v8[3] = a2;
  v8[4] = a3;
  v8[5] = a4;
  uint64_t v22 = sub_10000A57C;
  uint64_t v23 = v8;
  aBlock = _NSConcreteStackBlock;
  int v18 = 1107296256;
  int v19 = 0;
  uint64_t v20 = sub_100009080;
  Swift::String v21 = &unk_10000CB50;
  uint64_t v14 = _Block_copy(&aBlock);
  swift_release(v23);
  [a5 fetchPosterConfigurationsForRole:v15 completion:v14];
  _Block_release(v14);
}

uint64_t sub_100008CC4()
{
  swift_bridgeObjectRelease(*(void *)(v0 + 32));
  return swift_deallocObject(v2, 40LL);
}

void sub_100008D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void *sub_100008D18(const void *a1, void *a2)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t))(v7 + 48))(a1, 1LL))
  {
    uint64_t v2 = sub_10000491C(&qword_100010260);
    memcpy(a2, a1, *(void *)(*(void *)(v2 - 8) + 64LL));
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a2, a1, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a2, 0LL, 1LL, v6);
  }

  return a2;
}

uint64_t sub_100008DD4(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  return a1;
}

uint64_t sub_100008E44( uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t), uint64_t a4, void (*a5)(uint64_t), uint64_t a6)
{
  v22[7] = a1;
  v22[6] = a2;
  void v22[2] = a3;
  v22[3] = a4;
  void v22[4] = a5;
  v22[5] = a6;
  swift_errorRetain(a2);
  if (a2)
  {
    sub_100005E3C(a2, (uint64_t)a3, a4, a5, a6);
    return swift_errorRelease(a2);
  }

  else
  {
    v22[1] = a1;
    uint64_t v14 = sub_10000491C(&qword_100010288);
    unint64_t v6 = sub_10000A650();
    v22[0] = sub_100004EFC( (void (*)(char *, char *))sub_100009038,  0LL,  v14,  (uint64_t)&type metadata for String,  (uint64_t)&type metadata for Never,  v6,  (uint64_t)&protocol witness table for Never,  v15);
    Swift::String v8 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("\n\n", 2uLL, 1);
    uint64_t v11 = sub_10000491C(&qword_1000101F0);
    unint64_t v9 = sub_1000057CC();
    uint64_t v12 = BidirectionalCollection<>.joined(separator:)(v8._countAndFlagsBits, v8._object, v11, v9);
    uint64_t v13 = v10;
    swift_bridgeObjectRelease(v8._object);
    sub_10000583C(v22);
    sub_100005DB8(v12, v13, a3, a4);
    return swift_bridgeObjectRelease(v13);
  }

uint64_t sub_100009038@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000081F8();
  *a1 = result;
  a1[1] = v2;
  return result;
}

uint64_t sub_100009080(uint64_t a1, void *a2, void *a3)
{
  Swift::String v8 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  swift_retain(v9);
  id v3 = a2;
  unint64_t v4 = sub_10000A5EC();
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v4);
  id v5 = a3;
  if (a3) {
    uint64_t v7 = a3;
  }
  else {
    uint64_t v7 = 0LL;
  }
  v8(v11);
  swift_errorRelease(v7);
  swift_bridgeObjectRelease(v11);

  return swift_release(v9);
}

uint64_t sub_100009158(void *a1, uint64_t a2, uint64_t a3)
{
  v95 = a1;
  uint64_t v94 = a2;
  uint64_t v93 = a3;
  uint64_t v77 = "Fatal error";
  uint64_t v78 = "Unexpectedly found nil while implicitly unwrapping an Optional value";
  uint64_t v79 = "IdleScreenDiagnostic/PosterBoardDiagnosticProvider.swift";
  v139 = 0LL;
  v138 = 0LL;
  int v137 = 0LL;
  uint64_t v134 = 0LL;
  uint64_t v135 = 0LL;
  uint64_t v136 = 0LL;
  uint64_t v120 = 0LL;
  uint64_t v80 = 0LL;
  uint64_t v130 = 0LL;
  uint64_t v128 = 0LL;
  uint64_t v129 = 0LL;
  id v125 = 0LL;
  uint64_t v91 = 0LL;
  uint64_t v81 = type metadata accessor for Logger(0LL);
  uint64_t v82 = *(void *)(v81 - 8);
  unint64_t v83 = (*(void *)(v82 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  __chkstk_darwin(v81, v3, v4);
  Swift::String v84 = (char *)&v53 - v83;
  unint64_t v85 = (*(void *)(*(void *)(sub_10000491C(&qword_100010268) - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v7 = __chkstk_darwin(v91, v5, v6);
  Swift::String v86 = (char *)&v53 - v85;
  uint64_t v87 = type metadata accessor for String.Encoding(v7);
  uint64_t v88 = *(void *)(v87 - 8);
  unint64_t v89 = (*(void *)(v88 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v10 = __chkstk_darwin(v91, v8, v9);
  uint64_t v90 = (char *)&v53 - v89;
  uint64_t v109 = type metadata accessor for URL.DirectoryHint(v10);
  uint64_t v103 = *(void *)(v109 - 8);
  unint64_t v92 = (*(void *)(v103 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v13 = __chkstk_darwin(v91, v11, v12);
  uint64_t v108 = (uint64_t)&v53 - v92;
  uint64_t v116 = type metadata accessor for URL(v13);
  uint64_t v115 = *(void *)(v116 - 8);
  unint64_t v96 = (*(void *)(v115 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v14 = __chkstk_darwin(v95, v94, v93);
  uint64_t v105 = (char *)&v53 - v96;
  v139 = (char *)&v53 - v96;
  unint64_t v97 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v18 = __chkstk_darwin(v14, v16, v17);
  uint64_t v113 = (char *)&v53 - v97;
  v138 = (char *)&v53 - v97;
  unint64_t v98 = (v19 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v22 = __chkstk_darwin(v18, v20, v21);
  v117 = (char *)&v53 - v98;
  unint64_t v99 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  uint64_t v26 = __chkstk_darwin(v22, v24, v25);
  uint64_t v27 = (char *)&v53 - v99;
  uint64_t v100 = (char *)&v53 - v99;
  int v137 = (char *)&v53 - v99;
  uint64_t v134 = v26;
  uint64_t v135 = v28;
  uint64_t v136 = v29;
  uint64_t v30 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  uint64_t v112 = &DiagnosticExtensionProvider;
  id v101 = [v30 defaultManager];
  id v102 = [v101 temporaryDirectory];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v27, v117, v116);

  int v119 = 1;
  Swift::String v31 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PosterBoard", 0xBuLL, 1);
  v104 = &v133;
  Swift::String v133 = v31;
  (*(void (**)(uint64_t, void, uint64_t))(v103 + 104))( v108,  enum case for URL.DirectoryHint.isDirectory(_:),  v109);
  unint64_t v107 = sub_100002F84();
  uint64_t v106 = &type metadata for String;
  URL.appending<A>(component:directoryHint:)(v104, v108);
  v110 = *(void (**)(uint64_t, uint64_t))(v103 + 8);
  v110(v108, v109);
  sub_100002FEC((uint64_t)v104);
  Swift::String v32 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("PostersStatus.txt", 0x11uLL, v119 & 1);
  v111 = &v132;
  Swift::String v132 = v32;
  sub_100009DB0(v108);
  URL.appending<A>(path:directoryHint:)(v111, v108, v106, v107);
  uint64_t v33 = v117;
  v110(v108, v109);
  sub_100002FEC((uint64_t)v111);
  uint64_t v140 = 0LL;
  uint64_t v34 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
  id v123 = objc_msgSend(v34, (SEL)v112[2].ivar_lyt);
  v114 = *(void (**)(char *, char *, uint64_t))(v115 + 16);
  v114(v33, v113, v116);
  URL._bridgeToObjectiveC()(v35);
  id v122 = v36;
  v118 = *(void (**)(char *, uint64_t))(v115 + 8);
  v118(v117, v116);
  id v131 = v140;
  unsigned int v124 = [v123 createDirectoryAtURL:v122 withIntermediateDirectories:v119 & 1 attributes:v120 error:&v131];
  id v121 = v131;
  id v37 = v131;
  uint64_t v38 = v140;
  uint64_t v140 = v121;

  if ((v124 & 1) == 0)
  {
    id v55 = v140;
    uint64_t v56 = _convertNSErrorToError(_:)();

    swift_willThrow(v51);
    uint64_t v57 = v56;
LABEL_11:
    uint64_t v47 = v84;
    uint64_t v63 = v57;
    swift_errorRetain(v57);
    uint64_t v130 = v63;
    uint64_t v48 = sub_100001FAC();
    (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v47, v48, v81);
    int v58 = 1;
    Swift::String v49 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)( "/Library/Caches/com.apple.xbs/Sources/IdleScreen/IdleScreenDiagnostic/DiagnosticProviders/PosterBoardDiagnos ticProvider.swift",  0x7DuLL,  1);
    uint64_t countAndFlagsBits = v49._countAndFlagsBits;
    object = v49._object;
    Swift::String v50 = String.init(_builtinStringLiteral:utf8CodeUnitCount:isASCII:)("attachments()", 0xDuLL, v58 & 1);
    id v60 = v50._object;
    sub_1000031A4(v63, countAndFlagsBits, (uint64_t)object, v50._countAndFlagsBits, (uint64_t)v50._object);
    swift_bridgeObjectRelease(v60);
    swift_bridgeObjectRelease(object);
    (*(void (**)(char *, uint64_t))(v82 + 8))(v84, v81);
    uint64_t v62 = 0LL;
    sub_1000059DC();
    uint64_t v64 = _allocateUninitializedArray<A>(_:)(v62);
    swift_errorRelease(v63);
    swift_errorRelease(v63);
    v118(v105, v116);
    v118(v113, v116);
    v118(v100, v116);
    return v64;
  }

  uint64_t v39 = v80;
  uint64_t v40 = sub_100007738(v95, v94, v93);
  uint64_t v75 = v41;
  uint64_t v128 = v40;
  uint64_t v129 = v41;
  uint64_t v126 = v40;
  uint64_t v127 = v41;
  static String.Encoding.utf8.getter();
  StringProtocol.write(to:atomically:encoding:)(v105, 0LL, v90, &type metadata for String, v107);
  uint64_t v76 = v39;
  if (v39)
  {
    uint64_t v54 = v76;
    (*(void (**)(char *, uint64_t))(v88 + 8))(v90, v87);
    swift_bridgeObjectRelease(v75);
    uint64_t v57 = v54;
    goto LABEL_11;
  }

  (*(void (**)(char *, uint64_t))(v88 + 8))(v90, v87);
  unint64_t v73 = sub_1000059DC();
  v114(v86, v105, v116);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v115 + 56))(v86, 0LL, 1LL, v116);
  id v74 = sub_100009E00((uint64_t)v86);
  id v125 = v74;
  id v42 = v74;
  if (v74)
  {
    id v72 = v74;
  }

  else
  {
    _assertionFailure(_:_:file:line:flags:)(v77, 11LL, 2LL, v78, 68LL, 2LL, v79, 56LL, 2, 89LL, 0);
    __break(1u);
  }

  id v69 = v72;
  sub_100009E3C();
  Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
  objc_msgSend(v69, "setDeleteOnAttach:");

  uint64_t v70 = _allocateUninitializedArray<A>(_:)(1LL);
  char v71 = v43;
  id v44 = v74;
  if (v74)
  {
    id v67 = v74;
  }

  else
  {
    LOBYTE(v52) = 2;
    _assertionFailure(_:_:file:line:flags:)(v77, 11LL, 2LL, v78, 68LL, 2LL, v79, 56LL, v52, 90LL, 0);
    __break(1u);
  }

  uint64_t v45 = v70;
  *char v71 = v67;
  sub_1000034B8();
  uint64_t v65 = v45;

  swift_bridgeObjectRelease(v75);
  v118(v105, v116);
  v118(v113, v116);
  v118(v100, v116);
  return v65;
}

uint64_t sub_100009DB0@<X0>(uint64_t a1@<X8>)
{
  unsigned int v3 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v1 = type metadata accessor for URL.DirectoryHint(0LL);
  return (*(uint64_t (**)(uint64_t, void))(*(void *)(v1 - 8) + 104LL))(a1, v3);
}

id sub_100009E00(uint64_t a1)
{
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v1));
  return sub_10000A470(a1);
}

unint64_t sub_100009E3C()
{
  uint64_t v3 = qword_100010270;
  if (!qword_100010270)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___NSNumber);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100010270);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_100009EA0()
{
  return sub_100009158(*(void **)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

void *sub_100009EC0(void *a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  id v2 = *(id *)a2;
  *a1 = v4;
  a1[1] = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain(v7);
  uint64_t result = a1;
  a1[2] = v7;
  return result;
}

uint64_t sub_100009F1C(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 16));
}

void *sub_100009F4C(void *a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  id v2 = *(id *)a2;
  *a1 = v4;
  a1[1] = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain(v7);
  uint64_t result = a1;
  a1[2] = v7;
  return result;
}

uint64_t sub_100009FA8(uint64_t a1, uint64_t a2)
{
  id v6 = *(id *)a2;
  id v2 = *(id *)a2;
  uint64_t v3 = *(void **)a1;
  *(void *)a1 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v8 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain(v8);
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v8;
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 sub_10000A01C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  return result;
}

uint64_t sub_10000A030(uint64_t a1, void *a2)
{
  id v2 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  uint64_t v3 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2[2];
  swift_bridgeObjectRelease(v3);
  return a1;
}

uint64_t sub_10000A088(uint64_t a1, int a2)
{
  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      int v4 = *(_DWORD *)a1 + 0x7FFFFFFF;
    }

    else
    {
      int v3 = -1;
      if (!HIDWORD(*(void *)a1)) {
        int v3 = *(void *)a1;
      }
      int v4 = v3;
    }
  }

  else
  {
    int v4 = -1;
  }

  return (v4 + 1);
}

uint64_t sub_10000A1A0(uint64_t result, unsigned int a2, unsigned int a3)
{
  BOOL v3 = a3 > 0x7FFFFFFF;
  if (a2 > 0x7FFFFFFF)
  {
    *(void *)__n128 result = a2 + 0x80000000;
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 24) = 1;
      }
      else {
        __break(1u);
      }
    }
  }

  else
  {
    if (a3 > 0x7FFFFFFF)
    {
      if (v3) {
        *(_BYTE *)(result + 24) = 0;
      }
      else {
        __break(1u);
      }
    }

    if (a2) {
      *(void *)__n128 result = a2 - 1;
    }
  }

  return result;
}

void *type metadata accessor for PosterBoardDiagnosticProvider()
{
  return &unk_10000CB00;
}

unint64_t sub_10000A3B8()
{
  uint64_t v3 = qword_100010278;
  if (!qword_100010278)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRSService);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100010278);
    return ObjCClassMetadata;
  }

  return v3;
}

uint64_t sub_10000A41C(uint64_t a1)
{
  return a1;
}

id sub_10000A450()
{
  return [v0 init];
}

id sub_10000A470(uint64_t a1)
{
  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  BOOL v1 = (*(unsigned int (**)(uint64_t, uint64_t))(v11 + 48))(a1, 1LL) == 1;
  if (v1)
  {
    id v3 = [v8 initWithPathURL:0];
  }

  else
  {
    URL._bridgeToObjectiveC()((NSURL *)v1);
    uint64_t v7 = v2;
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
    id v3 = [v8 initWithPathURL:v7];
  }

  id v6 = v3;

  return v6;
}

uint64_t sub_10000A538()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000A57C(uint64_t a1, uint64_t a2)
{
  return sub_100008E44( a1,  a2,  *(void (**)(uint64_t, uint64_t))(v2 + 16),  *(void *)(v2 + 24),  *(void (**)(uint64_t))(v2 + 32),  *(void *)(v2 + 40));
}

uint64_t sub_10000A590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain(v5);
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_10000A5D4(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

unint64_t sub_10000A5EC()
{
  uint64_t v3 = qword_100010280;
  if (!qword_100010280)
  {
    uint64_t v0 = objc_opt_self(&OBJC_CLASS___PRSPosterConfiguration);
    unint64_t ObjCClassMetadata = swift_getObjCClassMetadata(v0);
    atomic_store(ObjCClassMetadata, (unint64_t *)&qword_100010280);
    return ObjCClassMetadata;
  }

  return v3;
}

unint64_t sub_10000A650()
{
  uint64_t v3 = qword_100010290;
  if (!qword_100010290)
  {
    uint64_t v0 = sub_100005758(&qword_100010288);
    unint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v0);
    atomic_store(WitnessTable, (unint64_t *)&qword_100010290);
    return WitnessTable;
  }

  return v3;
}

uint64_t sub_10000A6C0()
{
  return swift_deallocObject(v2, 48LL);
}

void sub_10000A704(void *a1, uint64_t a2)
{
}

uint64_t sub_10000A718(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain(v5);
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_10000A75C(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10000A774()
{
  return swift_deallocObject(v2, 48LL);
}

uint64_t sub_10000A7B8(uint64_t a1, uint64_t a2)
{
  return sub_100007C28( a1,  a2,  *(void (**)(uint64_t, uint64_t))(v2 + 16),  *(void *)(v2 + 24),  *(void (**)(uint64_t))(v2 + 32),  *(void *)(v2 + 40));
}

uint64_t sub_10000A7CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 40);
  swift_retain(v5);
  uint64_t result = a1;
  *(void *)(a1 + 32) = v4;
  *(void *)(a1 + 40) = v5;
  return result;
}

uint64_t sub_10000A810(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}