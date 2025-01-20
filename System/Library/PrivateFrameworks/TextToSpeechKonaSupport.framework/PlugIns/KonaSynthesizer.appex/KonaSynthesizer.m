BOOL sub_100003B38(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100003B4C()
{
  Swift::UInt64 v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100003B90()
{
}

Swift::Int sub_100003BB8(uint64_t a1)
{
  Swift::UInt64 v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

unint64_t sub_100003BF8@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_100008198(*a1);
  *a2 = result;
  return result;
}

void sub_100003C20(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_100003C2C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  id v12 = 0LL;
  v10[0] = a1;
  v10[1] = a2;
  int v11 = a3;
  id v5 = [objc_allocWithZone(v4) initWithComponentDescription:v10 options:a4 error:&v12];
  id v6 = v12;
  if (v5)
  {
    id v7 = v12;
  }

  else
  {
    id v8 = v12;
    _convertNSErrorToError(_:)(v6);

    swift_willThrow();
  }

  return v5;
}

uint64_t sub_100003D18(unint64_t a1, unint64_t a2, int a3, unsigned int a4)
{
  unsigned int v215 = a4;
  int v214 = a3;
  unint64_t v213 = a2;
  unint64_t v212 = a1;
  sub_100008DCC(&qword_100010C90);
  __chkstk_darwin();
  v218 = (char *)&v207 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_100008DCC(&qword_100010C98);
  __chkstk_darwin();
  v217 = (char *)&v207 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v222 = &v4[qword_100010B00];
  id v7 = (void *)objc_opt_self(&OBJC_CLASS___AUParameterTree);
  LOBYTE(v233) = 0;
  id v8 = v4;
  v216 = v8;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v10 = v9;
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  v220 = (objc_class *)type metadata accessor for KonaSynthesizerAudioUnit(0LL);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v226 = ObjCClassFromMetadata;
  v227 = (char *)objc_opt_self(&OBJC_CLASS___NSBundle);
  v13 = (NSBundle *)[v227 bundleForClass:ObjCClassFromMetadata];
  v238._object = (void *)0xE000000000000000LL;
  v14._countAndFlagsBits = 0x4C554D5F45544152LL;
  v14._object = (void *)0xEF5245494C504954LL;
  v15.value._countAndFlagsBits = 0xD000000000000010LL;
  v15.value._object = (void *)0x800000010000AC10LL;
  v228 = (void *)0x800000010000AC10LL;
  v16._countAndFlagsBits = 0LL;
  v16._object = (void *)0xE000000000000000LL;
  v238._countAndFlagsBits = 0LL;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v14, v15, v13, v16, v238)._object;

  NSString v18 = String._bridgeToObjectiveC()();
  __n128 v19 = swift_bridgeObjectRelease(object);
  v19.n128_u32[0] = 1112014848;
  LODWORD(v20) = 1128792064;
  v21 = v7;
  id v225 = v7;
  id v22 =  [v7 createParameterWithIdentifier:v11 name:v18 address:0 min:3 max:0 unit:0 unitName:v19.n128_f64[0] flags:v20 valueStrings:0 dependentParameters:0];

  v236 = 0LL;
  char v237 = 1;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  uint64_t v23 = sub_100008DCC(&qword_100010BD0);
  unint64_t v223 = sub_100007EA0();
  uint64_t v224 = v23;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)(v22, &v236, 0LL, &v233, v23, v223);
  v24 = &v8[qword_100010B08];
  LOBYTE(v233) = 1;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v26 = v25;
  NSString v27 = String._bridgeToObjectiveC()();
  *(void *)&double v28 = swift_bridgeObjectRelease(v26).n128_u64[0];
  uint64_t v30 = v226;
  id v29 = v227;
  v31 = (NSBundle *)objc_msgSend(v227, "bundleForClass:", v226, v28);
  v239._object = (void *)0xE000000000000000LL;
  v32._countAndFlagsBits = 0x5A49535F44414548LL;
  v32._object = (void *)0xE900000000000045LL;
  v33.value._countAndFlagsBits = 0xD000000000000010LL;
  v33.value._object = (void *)0x800000010000AC10LL;
  v34._countAndFlagsBits = 0LL;
  v34._object = (void *)0xE000000000000000LL;
  v239._countAndFlagsBits = 0LL;
  v35 = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, v33, v31, v34, v239)._object;

  NSString v36 = String._bridgeToObjectiveC()();
  __n128 v37 = swift_bridgeObjectRelease(v35);
  v37.n128_u32[0] = 0;
  LODWORD(v38) = 1120403456;
  id v39 =  [v21 createParameterWithIdentifier:v27 name:v36 address:1 min:3 max:0 unit:0 unitName:v37.n128_f64[0] flags:v38 valueStrings:0 dependentParameters:0];

  v236 = 0LL;
  char v237 = 1;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  v211 = v24;
  unint64_t v40 = v223;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)(v39, &v236, 0LL, &v233, v23, v223);
  v41 = v216;
  v221 = &v216[qword_100010B10];
  LOBYTE(v233) = 2;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v43 = v42;
  NSString v44 = String._bridgeToObjectiveC()();
  v45 = (NSBundle *)objc_msgSend(v29, "bundleForClass:", v30, swift_bridgeObjectRelease(v43).n128_f64[0]);
  v240._object = (void *)0xE000000000000000LL;
  v46._countAndFlagsBits = 0x41425F4843544950LL;
  v46._object = (void *)0xEA00000000004553LL;
  v47.value._countAndFlagsBits = 0xD000000000000010LL;
  v47.value._object = v228;
  v48._countAndFlagsBits = 0LL;
  v48._object = (void *)0xE000000000000000LL;
  v240._countAndFlagsBits = 0LL;
  v49 = NSLocalizedString(_:tableName:bundle:value:comment:)(v46, v47, v45, v48, v240)._object;

  NSString v50 = String._bridgeToObjectiveC()();
  __n128 v51 = swift_bridgeObjectRelease(v49);
  v51.n128_u32[0] = 1109393408;
  LODWORD(v52) = 1137901568;
  id v53 = v225;
  id v54 =  [v225 createParameterWithIdentifier:v44 name:v50 address:2 min:8 max:0 unit:0 unitName:v51.n128_f64[0] flags:v52 valueStrings:0 dependentParameters:0];

  v236 = 0LL;
  char v237 = 1;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)(v54, &v236, 0LL, &v233, v224, v40);
  v55 = &v41[qword_100010B18];
  LOBYTE(v233) = 3;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v57 = v56;
  NSString v58 = String._bridgeToObjectiveC()();
  *(void *)&double v59 = swift_bridgeObjectRelease(v57).n128_u64[0];
  v60 = v29;
  v61 = v29;
  uint64_t v62 = v226;
  v63 = (NSBundle *)objc_msgSend(v61, "bundleForClass:", v226, v59);
  v241._object = (void *)0xE000000000000000LL;
  v64._countAndFlagsBits = 0x41525F4843544950LL;
  v64._object = (void *)0xEB0000000045474ELL;
  v65.value._countAndFlagsBits = 0xD000000000000010LL;
  v65.value._object = v228;
  v66._countAndFlagsBits = 0LL;
  v66._object = (void *)0xE000000000000000LL;
  v241._countAndFlagsBits = 0LL;
  v67 = NSLocalizedString(_:tableName:bundle:value:comment:)(v64, v65, v63, v66, v241)._object;

  NSString v68 = String._bridgeToObjectiveC()();
  __n128 v69 = swift_bridgeObjectRelease(v67);
  v69.n128_u32[0] = 0;
  LODWORD(v70) = 1120403456;
  id v71 =  [v53 createParameterWithIdentifier:v58 name:v68 address:3 min:3 max:0 unit:0 unitName:v69.n128_f64[0] flags:v70 valueStrings:0 dependentParameters:0];

  v236 = 0LL;
  char v237 = 1;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  v210 = v55;
  uint64_t v72 = v224;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)(v71, &v236, 0LL, &v233, v224, v223);
  v73 = &v41[qword_100010B20];
  LOBYTE(v233) = 4;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v75 = v74;
  NSString v76 = String._bridgeToObjectiveC()();
  v77 = (NSBundle *)objc_msgSend(v60, "bundleForClass:", v62, swift_bridgeObjectRelease(v75).n128_f64[0]);
  v242._object = (void *)0xE000000000000000LL;
  v78._countAndFlagsBits = 0x4E49485441455242LL;
  v78._object = (void *)0xEB00000000535345LL;
  v79.value._countAndFlagsBits = 0xD000000000000010LL;
  v79.value._object = v228;
  v80._countAndFlagsBits = 0LL;
  v80._object = (void *)0xE000000000000000LL;
  v242._countAndFlagsBits = 0LL;
  v81 = NSLocalizedString(_:tableName:bundle:value:comment:)(v78, v79, v77, v80, v242)._object;

  NSString v82 = String._bridgeToObjectiveC()();
  __n128 v83 = swift_bridgeObjectRelease(v81);
  v83.n128_u32[0] = 0;
  id v84 = v225;
  LODWORD(v85) = 1120403456;
  id v86 =  [v225 createParameterWithIdentifier:v76 name:v82 address:4 min:3 max:0 unit:0 unitName:v83.n128_f64[0] flags:v85 valueStrings:0 dependentParameters:0];

  v236 = 0LL;
  char v237 = 1;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  v209 = v73;
  unint64_t v87 = v223;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)(v86, &v236, 0LL, &v233, v72, v223);
  v88 = &v41[qword_100010B28];
  v89 = v41;
  LOBYTE(v233) = 5;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v91 = v90;
  NSString v92 = String._bridgeToObjectiveC()();
  *(void *)&double v93 = swift_bridgeObjectRelease(v91).n128_u64[0];
  v94 = (NSBundle *)objc_msgSend(v227, "bundleForClass:", v226, v93);
  v95._object = (void *)0xE900000000000053LL;
  v243._object = (void *)0xE000000000000000LL;
  v95._countAndFlagsBits = 0x53454E4847554F52LL;
  v96.value._countAndFlagsBits = 0xD000000000000010LL;
  v97 = v228;
  v96.value._object = v228;
  v98._countAndFlagsBits = 0LL;
  v98._object = (void *)0xE000000000000000LL;
  v243._countAndFlagsBits = 0LL;
  v99 = NSLocalizedString(_:tableName:bundle:value:comment:)(v95, v96, v94, v98, v243)._object;

  NSString v100 = String._bridgeToObjectiveC()();
  __n128 v101 = swift_bridgeObjectRelease(v99);
  v101.n128_u32[0] = 0;
  LODWORD(v102) = 1120403456;
  id v103 =  [v84 createParameterWithIdentifier:v92 name:v100 address:5 min:3 max:0 unit:0 unitName:v101.n128_f64[0] flags:v102 valueStrings:0 dependentParameters:0];

  v236 = 0LL;
  char v237 = 1;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  v208 = v88;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)(v103, &v236, 0LL, &v233, v224, v87);
  v104 = &v89[qword_100010B30];
  LOBYTE(v233) = 6;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v106 = v105;
  NSString v107 = String._bridgeToObjectiveC()();
  *(void *)&double v108 = swift_bridgeObjectRelease(v106).n128_u64[0];
  uint64_t v109 = v226;
  id v110 = v227;
  v111 = (NSBundle *)objc_msgSend(v227, "bundleForClass:", v226, v108);
  v244._object = (void *)0xE000000000000000LL;
  v112._countAndFlagsBits = 0x5441525F504D4153LL;
  v112._object = (void *)0xE900000000000045LL;
  v113.value._countAndFlagsBits = 0xD000000000000010LL;
  v113.value._object = v97;
  v114._countAndFlagsBits = 0LL;
  v114._object = (void *)0xE000000000000000LL;
  v244._countAndFlagsBits = 0LL;
  v115 = NSLocalizedString(_:tableName:bundle:value:comment:)(v112, v113, v111, v114, v244)._object;

  NSString v116 = String._bridgeToObjectiveC()();
  __n128 v117 = swift_bridgeObjectRelease(v115);
  v117.n128_u32[0] = 0;
  LODWORD(v118) = 1.0;
  id v119 =  [v225 createParameterWithIdentifier:v107 name:v116 address:6 min:2 max:0 unit:0 unitName:v117.n128_f64[0] flags:v118 valueStrings:0 dependentParameters:0];

  LOBYTE(v236) = 0;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  uint64_t v224 = (uint64_t)v104;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)( v119,  &v236,  0LL,  &v233,  &type metadata for Bool,  &protocol witness table for Bool);
  v120 = &v89[qword_100010B38];
  LOBYTE(v233) = 7;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v122 = v121;
  NSString v123 = String._bridgeToObjectiveC()();
  v124 = (NSBundle *)objc_msgSend(v110, "bundleForClass:", v109, swift_bridgeObjectRelease(v122).n128_f64[0]);
  v125._countAndFlagsBits = 0xD000000000000011LL;
  v245._object = (void *)0xE000000000000000LL;
  v125._object = (void *)0x800000010000AC30LL;
  v126.value._countAndFlagsBits = 0xD000000000000010LL;
  v127 = v228;
  v126.value._object = v228;
  v128._countAndFlagsBits = 0LL;
  v128._object = (void *)0xE000000000000000LL;
  v245._countAndFlagsBits = 0LL;
  v129 = NSLocalizedString(_:tableName:bundle:value:comment:)(v125, v126, v124, v128, v245)._object;

  NSString v130 = String._bridgeToObjectiveC()();
  __n128 v131 = swift_bridgeObjectRelease(v129);
  v131.n128_u32[0] = 0;
  LODWORD(v132) = 1.0;
  id v133 = v225;
  id v134 =  [v225 createParameterWithIdentifier:v123 name:v130 address:7 min:2 max:0 unit:0 unitName:v131.n128_f64[0] flags:v132 valueStrings:0 dependentParameters:0];

  LOBYTE(v236) = 0;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  unint64_t v223 = (unint64_t)v120;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)( v134,  &v236,  0LL,  &v233,  &type metadata for Bool,  &protocol witness table for Bool);
  v135 = &v89[qword_100010B40];
  LOBYTE(v233) = 8;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v137 = v136;
  NSString v138 = String._bridgeToObjectiveC()();
  *(void *)&double v139 = swift_bridgeObjectRelease(v137).n128_u64[0];
  uint64_t v140 = v226;
  v141 = (NSBundle *)objc_msgSend(v227, "bundleForClass:", v226, v139);
  v142._countAndFlagsBits = 0xD000000000000017LL;
  v246._object = (void *)0xE000000000000000LL;
  v142._object = (void *)0x800000010000AC50LL;
  v143.value._countAndFlagsBits = 0xD000000000000010LL;
  v143.value._object = v127;
  v144._countAndFlagsBits = 0LL;
  v144._object = (void *)0xE000000000000000LL;
  v246._countAndFlagsBits = 0LL;
  v145 = NSLocalizedString(_:tableName:bundle:value:comment:)(v142, v143, v141, v144, v246)._object;

  NSString v146 = String._bridgeToObjectiveC()();
  __n128 v147 = swift_bridgeObjectRelease(v145);
  v147.n128_u32[0] = 0;
  LODWORD(v148) = 1.0;
  v149 = v133;
  id v150 =  [v133 createParameterWithIdentifier:v138 name:v146 address:8 min:2 max:0 unit:0 unitName:v147.n128_f64[0] flags:v148 valueStrings:0 dependentParameters:0];

  LOBYTE(v236) = 1;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  v207 = v135;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)( v150,  &v236,  0LL,  &v233,  &type metadata for Bool,  &protocol witness table for Bool);
  v151 = &v89[qword_100010B48];
  LOBYTE(v233) = 9;
  String.init<A>(describing:)(&v233, &type metadata for KonaAUParameters);
  uint64_t v153 = v152;
  NSString v154 = String._bridgeToObjectiveC()();
  *(void *)&double v155 = swift_bridgeObjectRelease(v153).n128_u64[0];
  v156 = (NSBundle *)objc_msgSend(v227, "bundleForClass:", v140, v155);
  v157._countAndFlagsBits = 0xD000000000000014LL;
  v247._object = (void *)0xE000000000000000LL;
  v157._object = (void *)0x800000010000AC70LL;
  v158.value._countAndFlagsBits = 0xD000000000000010LL;
  v158.value._object = v127;
  v159._countAndFlagsBits = 0LL;
  v159._object = (void *)0xE000000000000000LL;
  v247._countAndFlagsBits = 0LL;
  v160 = NSLocalizedString(_:tableName:bundle:value:comment:)(v157, v158, v156, v159, v247)._object;

  NSString v161 = String._bridgeToObjectiveC()();
  __n128 v162 = swift_bridgeObjectRelease(v160);
  v162.n128_u32[0] = 0;
  LODWORD(v163) = 1.0;
  id v164 =  [v149 createParameterWithIdentifier:v154 name:v161 address:9 min:2 max:0 unit:0 unitName:v162.n128_f64[0] flags:v163 valueStrings:0 dependentParameters:0];

  LOBYTE(v236) = 0;
  uint64_t v235 = 0LL;
  __int128 v233 = 0u;
  __int128 v234 = 0u;
  v228 = v151;
  AUParamValue.init(param:defaultValue:internalOnly:featureFlag:)( v164,  &v236,  0LL,  &v233,  &type metadata for Bool,  &protocol witness table for Bool);
  uint64_t v165 = qword_100010B58;
  *(void *)&v89[qword_100010B58] = 0LL;
  uint64_t v166 = qword_100010B60;
  *(void *)&v89[qword_100010B60] = 0LL;
  uint64_t v167 = qword_100010B68;
  *(void *)&v89[qword_100010B68] = &_swiftEmptyArrayStorage;
  v227 = (char *)qword_100010B70;
  *(void *)&v89[qword_100010B70] = 0LL;
  uint64_t v168 = qword_100010B78;
  *(void *)&v89[qword_100010B78] = 0LL;
  *(void *)&v89[qword_100010B80] = 0LL;
  v169 = &v89[qword_100010B88];
  *(void *)v169 = 0LL;
  v169[8] = 1;
  uint64_t v230 = 0x40CF400000000000LL;
  __int128 v231 = xmmword_100009E20;
  __int128 v232 = xmmword_100009E30;
  type metadata accessor for CMFormatDescription(0LL);
  uint64_t v171 = v170;
  uint64_t v172 = type metadata accessor for ManagedAudioChannelLayout(0LL);
  v173 = v217;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v172 - 8) + 56LL))(v217, 1LL, 1LL, v172);
  uint64_t v174 = type metadata accessor for CMFormatDescriptionRef.Extensions(0LL);
  v175 = v218;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v174 - 8) + 56LL))(v218, 1LL, 1LL, v174);
  uint64_t v176 = v219;
  _CMFormatDescriptionInitTrampoline.init(audioStreamBasicDescription:layout:magicCookie:extensions:)( &v233,  &v230,  v173,  0LL,  0xF000000000000000LL,  v175,  v171,  &protocol witness table for CMFormatDescriptionRef);
  if (v176)
  {
    uint64_t result = swift_unexpectedError(v176, "KonaSynthesizer/KonaSynthesizerAudioUnit.swift", 46LL, 1LL, 106LL);
    __break(1u);
  }

  else
  {
    v177 = (void *)v233;
    id v178 = [objc_allocWithZone(AVAudioFormat) initWithCMAudioFormatDescription:(void)v233];
    id v179 = objc_allocWithZone(&OBJC_CLASS___AUAudioUnitBus);
    *(void *)&__int128 v233 = 0LL;
    id v180 = [v179 initWithFormat:v178 error:&v233];
    v181 = (void *)v233;
    if (v180)
    {
      unsigned int v182 = v212;
      unint64_t v183 = HIDWORD(v212);
      unsigned int v184 = v213;
      unint64_t v185 = HIDWORD(v213);
      *(void *)&v89[qword_100010B50] = v180;
      id v186 = v181;

      v236 = 0LL;
      v229.receiver = v89;
      v229.super_class = v220;
      *(void *)&__int128 v233 = __PAIR64__(v183, v182);
      *((void *)&v233 + 1) = __PAIR64__(v185, v184);
      LODWORD(v234) = v214;
      id v187 = objc_msgSendSuper2(&v229, "initWithComponentDescription:options:error:", &v233, v215, &v236);
      v89 = v236;
      if (v187)
      {
        v188 = v187;
        v189 = v236;
        v190 = v188;
        [v190 setMaximumFramesToRender:256];
        uint64_t v191 = sub_100008DCC(&qword_100010C58);
        uint64_t v192 = swift_allocObject(v191, 40LL, 7LL);
        *(_OWORD *)(v192 + 16) = xmmword_100009E40;
        v193 = *(void **)&v190[qword_100010B50];
        *(void *)(v192 + 32) = v193;
        *(void *)&__int128 v233 = v192;
        specialized Array._endMutation()();
        uint64_t v194 = v233;
        id v195 = objc_allocWithZone(&OBJC_CLASS___AUAudioUnitBusArray);
        sub_100009054(0LL, &qword_100010CA0, &OBJC_CLASS___AUAudioUnitBus_ptr);
        v89 = v190;
        id v196 = v193;
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        id v198 = objc_msgSend( v195,  "initWithAudioUnit:busType:busses:",  v89,  2,  isa,  swift_bridgeObjectRelease(v194).n128_f64[0]);

        v177 = *(void **)&v89[qword_100010B60];
        *(void *)&v89[qword_100010B60] = v198;
      }

      else
      {
        v205 = v236;
        _convertNSErrorToError(_:)(v89);

        swift_willThrow();
      }
    }

    else
    {
      id v199 = (id)v233;
      uint64_t v226 = v168;
      id v200 = v199;
      _convertNSErrorToError(_:)(v181);

      swift_willThrow();
      uint64_t v201 = sub_100008DCC(&qword_100010C38);
      v202 = *(void (**)(char *, uint64_t))(*(void *)(v201 - 8) + 8LL);
      v202(v222, v201);
      v202(v211, v201);
      v202(v221, v201);
      v202(v210, v201);
      v202(v209, v201);
      v202(v208, v201);
      uint64_t v203 = sub_100008DCC(&qword_100010C30);
      v204 = *(void (**)(uint64_t, uint64_t))(*(void *)(v203 - 8) + 8LL);
      v204(v224, v203);
      v204(v223, v203);
      v204((uint64_t)v207, v203);
      v204((uint64_t)v228, v203);

      swift_bridgeObjectRelease(*(void *)&v89[v167]);
      swift_deallocPartialClassInstance( v89,  v220,  *(unsigned int *)((swift_isaMask & *(void *)v89) + 0x30LL),  *(unsigned __int16 *)((swift_isaMask & *(void *)v89) + 0x34LL));
    }

    return (uint64_t)v89;
  }

  return result;
}

uint64_t sub_1000050C8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return sub_100003D18(*(void *)a3, *(void *)(a3 + 8), *(_DWORD *)(a3 + 16), a4);
}

id sub_100005144(uint64_t a1)
{
  id result = *(id *)(a1 + qword_100010B60);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

void sub_10000515C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100008DCC(&qword_100010C30);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v9 = [(id)objc_opt_self(AXKonaSpeechEngine) allVoices];
  uint64_t v10 = sub_100009054(0LL, &qword_100010C08, &OBJC_CLASS___AXKonaVoice_ptr);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  swift_bridgeObjectRetain(a2);
  id v12 = sub_1000081A8(v11, a1, a2);
  swift_bridgeObjectRelease(v11);
  __n128 v13 = swift_bridgeObjectRelease(a2);
  if (v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v6 + 16))(v8, v2 + qword_100010B48, v5, v13);
    uint64_t v14 = AUParamValue.projectedValue.getter(v5);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    dispatch thunk of AUParamWrapper.enabled.setter([v12 konaLanguage] == 0);

    swift_release(v14);
  }
}

double sub_1000052C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  id v7 = a1;
  sub_10000515C(v4, v6);

  *(void *)&double result = swift_bridgeObjectRelease(v6).n128_u64[0];
  return result;
}

Class sub_100005314()
{
  return NSNumber.init(BOOLeanLiteral:)(0).super.super.isa;
}

unint64_t sub_100005350(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100008DCC(&qword_100010C88);
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
    id v9 = *v6;
    swift_bridgeObjectRetain(v8);
    id v10 = v9;
    unint64_t result = sub_100007F60(v7, v8);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    __n128 v13 = (uint64_t *)(v4[6] + 16 * result);
    uint64_t *v13 = v7;
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

unint64_t sub_100005468(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100008DCC(&qword_100010C20);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }

  uint64_t v6 = v3 + 64;
  uint64_t v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100008E0C(v7, (uint64_t)v16);
    unint64_t result = sub_100007FC4((uint64_t)v16);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v10 = v4[6] + 40 * result;
    __int128 v11 = v16[0];
    __int128 v12 = v16[1];
    *(void *)(v10 + 32) = v17;
    *(_OWORD *)uint64_t v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    unint64_t result = (unint64_t)sub_100008E54(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 72LL;
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

Class sub_100005594(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  id v7 = a1;
  unint64_t v8 = sub_10000852C(v4, v6);

  swift_bridgeObjectRelease(v6);
  sub_100009054(0LL, &qword_100010C78, &OBJC_CLASS___NSNumber_ptr);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return isa;
}

id sub_100005630(uint64_t a1)
{
  uint64_t v2 = swift_allocObject(&unk_10000C710, 24LL, 7LL);
  swift_unknownObjectWeakInit(v2 + 16, a1);
  v5[4] = sub_100008FCC;
  uint64_t v6 = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256LL;
  v5[2] = sub_1000056C8;
  v5[3] = &unk_10000C728;
  uint64_t v3 = _Block_copy(v5);
  swift_release(v6);
  return v3;
}

uint64_t sub_1000056C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *aBlock)
{
  uint64_t v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t))(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v16 = _Block_copy(aBlock);
  if (v16)
  {
    uint64_t v17 = swift_allocObject(&unk_10000C760, 24LL, 7LL);
    *(void *)(v17 + 16) = v16;
    uint64_t v16 = sub_100009020;
  }

  else
  {
    uint64_t v17 = 0LL;
  }

  swift_retain(v14);
  uint64_t v18 = v15(a2, a3, a4, a5, a6, a7, v16, v17);
  sub_100008FEC((uint64_t)v16, v17);
  swift_release(v14);
  return v18;
}

void sub_1000057A0( _DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12 = type metadata accessor for UnsafeMutableAudioBufferListPointer(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  uint64_t v15 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess(a9 + 16, v59, 0LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(a9 + 16);
  if (Strong)
  {
    uint64_t v17 = (char *)Strong;
    UnsafeMutableAudioBufferListPointer.init(_:)(a5);
    uint64_t v18 = (void (*)(_BYTE *, void))UnsafeMutableAudioBufferListPointer.subscript.read(v58, 0LL);
    uint64_t v20 = v19;
    v18(v58, 0LL);
    uint64_t v21 = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    if (v20)
    {
      if (!a3) {
        goto LABEL_12;
      }
      if (a3 >= 8)
      {
        uint64_t v23 = a3 & 0xFFFFFFF8;
        v24 = (_OWORD *)(v20 + 16);
        __n128 v22 = 0uLL;
        uint64_t v25 = v23;
        do
        {
          *(v24 - 1) = 0uLL;
          _OWORD *v24 = 0uLL;
          v24 += 2;
          v25 -= 8LL;
        }

        while (v25);
        if (v23 == a3)
        {
LABEL_12:
          uint64_t v28 = qword_100010B68;
          uint64_t v29 = *(void *)&v17[qword_100010B68];
          if ((unint64_t)v29 >> 62)
          {
LABEL_39:
            if (v29 < 0) {
              uint64_t v53 = v29;
            }
            else {
              uint64_t v53 = v29 & 0xFFFFFFFFFFFFFF8LL;
            }
            swift_bridgeObjectRetain(v29);
            uint64_t v54 = _CocoaArrayWrapper.endIndex.getter(v53);
            __n128 v22 = swift_bridgeObjectRelease(v29);
            if (!v54) {
              goto LABEL_43;
            }
          }

          else if (!*(void *)((v29 & 0xFFFFFFFFFFFFF8LL) + 0x10))
          {
LABEL_43:

            return;
          }

          uint64_t v30 = qword_100010B78;
          if (!*(void *)&v17[qword_100010B78])
          {
            id v31 = [*(id *)&v17[qword_100010B58] nextBuffer];
            Swift::String v32 = *(void **)&v17[v30];
            *(void *)&v17[v30] = v31;

            Swift::String_optional v33 = *(void **)&v17[v30];
            if (v33)
            {
              id v34 = [v33 markers];
              uint64_t v35 = sub_100009054(0LL, &qword_100010C70, &OBJC_CLASS___AXKonaMarker_ptr);
              NSString v36 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v34, v35);
            }

            else
            {
              NSString v36 = &_swiftEmptyArrayStorage;
            }

            sub_100006F80((unint64_t)v36);
            __n128 v22 = swift_bridgeObjectRelease(v36);
            *(void *)&v17[qword_100010B80] = 0LL;
            if (!*(void *)&v17[v30]) {
              goto LABEL_36;
            }
          }

          if (!a3)
          {
LABEL_37:
            noErr.getter(v21, v22);
            goto LABEL_43;
          }

          uint64_t v55 = v28;
          uint64_t v56 = a1;
          uint64_t v37 = 0LL;
          uint64_t v28 = qword_100010B80;
          uint64_t v57 = qword_100010B58;
          do
          {
            double v38 = *(void **)&v17[v30];
            if (!v38) {
              goto LABEL_47;
            }
            uint64_t v39 = *(void *)&v17[v28];
            id v40 = [v38 buffer];
            unsigned int v41 = [v40 frameLength];

            if (v39 >= v41)
            {
              *(void *)&v17[v28] = 0LL;
              id v42 = [*(id *)&v17[v57] nextBuffer];
              uint64_t v43 = *(void **)&v17[v30];
              *(void *)&v17[v30] = v42;

              NSString v44 = *(void **)&v17[v30];
              if (v44)
              {
                id v45 = [v44 markers];
                uint64_t v46 = sub_100009054(0LL, &qword_100010C70, &OBJC_CLASS___AXKonaMarker_ptr);
                Swift::String_optional v47 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v45, v46);
              }

              else
              {
                Swift::String_optional v47 = &_swiftEmptyArrayStorage;
              }

              sub_100006F80((unint64_t)v47);
              __n128 v22 = swift_bridgeObjectRelease(v47);
            }

            uint64_t v29 = *(void *)&v17[v30];
            if (!v29) {
              goto LABEL_32;
            }
            a1 = objc_msgSend(*(id *)&v17[v30], "buffer", v22.n128_f64[0]);
            uint64_t v48 = *((void *)[a1 mutableAudioBufferList] + 2);
            if (!v48) {
              goto LABEL_48;
            }
            *(_DWORD *)(v20 + 4 * v37) = *(_DWORD *)(v48 + 4LL * *(void *)&v17[v28]);

            uint64_t v49 = *(void *)&v17[v28];
            BOOL v50 = __OFADD__(v49, 1LL);
            uint64_t v51 = v49 + 1;
            if (v50)
            {
              __break(1u);
              goto LABEL_39;
            }

            ++v37;
            *(void *)&v17[v28] = v51;
          }

          while (a3 != v37);
          uint64_t v37 = a3;
LABEL_32:
          if ((unint64_t)(v37 - 0x2000000000000000LL) >> 62 == 3)
          {
            if (((4 * v37) & 0x8000000000000000LL) == 0)
            {
              if (!((unint64_t)(4 * v37) >> 32))
              {
                uint64_t v28 = v55;
                a1 = v56;
                if (v29) {
                  goto LABEL_37;
                }
LABEL_36:
                *a1 = 128;
                uint64_t v52 = *(void *)&v17[v28];
                *(void *)&v17[v28] = &_swiftEmptyArrayStorage;
                __n128 v22 = swift_bridgeObjectRelease(v52);
                goto LABEL_37;
              }

LABEL_46:
              __break(1u);
LABEL_47:
              __break(1u);
LABEL_48:
              __break(1u);
              goto LABEL_49;
            }
          }

          else
          {
            __break(1u);
          }

          __break(1u);
          goto LABEL_46;
        }
      }

      else
      {
        uint64_t v23 = 0LL;
      }

      uint64_t v26 = (_DWORD *)(v20 + 4 * v23);
      uint64_t v27 = a3 - v23;
      do
      {
        *v26++ = 0;
        --v27;
      }

      while (v27);
      goto LABEL_12;
    }

LABEL_49:
    __break(1u);
  }

void sub_100005BD0(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v168 = sub_100008DCC(&qword_100010C30);
  uint64_t v164 = *(void *)(v168 - 8);
  __chkstk_darwin();
  uint64_t v167 = (char *)&v155 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v177 = sub_100008DCC(&qword_100010C38);
  uint64_t v172 = *(void **)(v177 - 8);
  __chkstk_darwin();
  v173 = (char *)&v155 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v176 = sub_100008DCC(&qword_100010C40);
  uint64_t v171 = *(void *)(v176 - 8);
  __chkstk_darwin();
  id v179 = (char *)&v155 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for TTSMarkup.SpeechDocument(0LL);
  uint64_t v174 = *(void *)(v7 - 8);
  uint64_t v175 = v7;
  __chkstk_darwin();
  char v9 = (char *)&v155 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for TTSSpeechEvent(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  uint64_t v13 = (uint64_t *)((char *)&v155 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v165 = type metadata accessor for TTSSpeechTracer(0LL);
  uint64_t v14 = (void *)((uint64_t (*)(void))static TTSSpeechTracer.shared.getter)();
  uint64_t v166 = *(void (**)(uint64_t *, void, uint64_t))(v11 + 104);
  v166(v13, enum case for TTSSpeechEvent.receivedStart(_:), v10);
  id v15 = [a1 jobIdentifier];
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  uint64_t v18 = v17;

  dispatch thunk of TTSSpeechTracer.emit(event:forIdentifier:)(v13, v16, v18);
  __n128 v19 = swift_bridgeObjectRelease(v18);
  uint64_t v20 = *(void (**)(uint64_t *, uint64_t, __n128))(v11 + 8);
  v169 = v13;
  uint64_t v170 = v10;
  v20(v13, v10, v19);
  id v21 = [(id)objc_opt_self(AXKonaSpeechEngine) allVoices];
  uint64_t v22 = sub_100009054(0LL, &qword_100010C08, &OBJC_CLASS___AXKonaVoice_ptr);
  uint64_t v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v21, v22);

  id v24 = a1;
  uint64_t v25 = (void *)sub_10000834C(v23, v24);
  swift_bridgeObjectRelease(v23);

  if (!v25)
  {
    id v31 = (id)AXTTSLogKona();
    if (v31)
    {
      Swift::String v32 = v31;
      uint64_t v33 = static os_log_type_t.error.getter();
      uint64_t v34 = sub_100008DCC(&qword_100010C48);
      uint64_t v35 = swift_allocObject(v34, 72LL, 7LL);
      *(_OWORD *)(v35 + 16) = xmmword_100009E50;
      id v36 = [v24 voice];
      id v37 = [v36 identifier];

      uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)(v37);
      uint64_t v40 = v39;

      *(void *)(v35 + 56) = &type metadata for String;
      *(void *)(v35 + 64) = sub_100008ED4();
      *(void *)(v35 + 32) = v38;
      *(void *)(v35 + 40) = v40;
      os_log(_:dso:log:type:_:)( "Invalid eloquence voice identifier %{PUBLIC}@",  45LL,  2LL,  &_mh_execute_header,  v32,  v33,  v35);

      swift_bridgeObjectRelease(v35);
      return;
    }

    goto LABEL_51;
  }

  double v163 = v20;
  id v180 = v25;

  uint64_t v26 = v2 + qword_100010B88;
  *(void *)uint64_t v26 = 15LL;
  *(_BYTE *)(v26 + 8) = 0;
  id v27 = [v24 ssmlRepresentation];
  uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  uint64_t v30 = v29;

  TTSMarkup.SpeechDocument.init(ssml:)(v28, v30);
  id v160 = v24;
  __n128 v162 = v9;
  uint64_t v41 = qword_100010B58;
  id v42 = *(void **)(v2 + qword_100010B58);
  uint64_t v43 = v42;
  id v44 = v180;
  if (!v42)
  {
    id v45 = [objc_allocWithZone(AXKonaSpeechEngine) initWithVoice:v180];
    uint64_t v46 = *(void **)(v2 + v41);
    *(void *)(v2 + v41) = v45;

    uint64_t v43 = *(void **)(v2 + v41);
    if (!v43)
    {
      id v75 = (id)AXTTSLogKona();
      if (v75)
      {
        NSString v76 = v75;
        uint64_t v77 = static os_log_type_t.error.getter();
        uint64_t v78 = sub_100008DCC(&qword_100010C48);
        uint64_t v79 = swift_allocObject(v78, 72LL, 7LL);
        *(_OWORD *)(v79 + 16) = xmmword_100009E50;
        id v80 = [v160 voice];
        id v81 = [v80 identifier];

        uint64_t v82 = static String._unconditionallyBridgeFromObjectiveC(_:)(v81);
        uint64_t v84 = v83;

        *(void *)(v79 + 56) = &type metadata for String;
        *(void *)(v79 + 64) = sub_100008ED4();
        *(void *)(v79 + 32) = v82;
        *(void *)(v79 + 40) = v84;
        os_log(_:dso:log:type:_:)( "Could not initialize engine with voice identifier %{PUBLIC}@",  60LL,  2LL,  &_mh_execute_header,  v76,  v77,  v79);

        __n128 v85 = swift_bridgeObjectRelease(v79);
        (*(void (**)(char *, uint64_t, __n128))(v174 + 8))(v162, v175, v85);
        return;
      }

      goto LABEL_52;
    }
  }

  uint64_t v178 = v2;
  id v47 = v43;
  id v48 = [v47 voice];
  id v49 = [v48 identifier];

  uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
  uint64_t v52 = v51;

  id v53 = [v44 identifier];
  uint64_t v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v53);
  uint64_t v56 = v55;

  if (v50 == v54 && v52 == v56)
  {
    swift_bridgeObjectRelease_n(v52, 2LL);
    id v57 = v180;
    [v47 setVoice:v180];
    NSString v58 = v173;
    if (v42) {
      goto LABEL_31;
    }
  }

  else
  {
    char v59 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v52, v54, v56, 0LL);
    swift_bridgeObjectRelease(v52);
    *(void *)&double v60 = swift_bridgeObjectRelease(v56).n128_u64[0];
    id v57 = v180;
    objc_msgSend(v47, "setVoice:", v180, v60);
    NSString v58 = v173;
    if (v42 && (v59 & 1) != 0) {
      goto LABEL_31;
    }
  }

  id v61 = [v47 ruleSetRunner];
  [v61 reset];

  id v62 = [(id)objc_opt_self(TTSAXResourceManager) sharedInstance];
  NSString v63 = [v57 identifier];
  if (!v63)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
    uint64_t v66 = v65;
    NSString v63 = String._bridgeToObjectiveC()();
    *(void *)&double v64 = swift_bridgeObjectRelease(v66).n128_u64[0];
  }

  v67 = (char *)objc_msgSend(v62, "resourceWithVoiceId:", v63, v64);

  if (v67)
  {
    type metadata accessor for TTSPronunciationUtils(0LL);
    uint64_t v68 = dispatch thunk of static TTSPronunciationUtils.rulesets(for:)(v67);
    uint64_t v69 = v68;
    v173 = v67;
    if ((unint64_t)v68 >> 62)
    {
      if (v68 < 0) {
        uint64_t v86 = v68;
      }
      else {
        uint64_t v86 = v68 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v68);
      uint64_t v70 = _CocoaArrayWrapper.endIndex.getter(v86);
      if (v70) {
        goto LABEL_18;
      }
    }

    else
    {
      uint64_t v70 = *(void *)((v68 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      swift_bridgeObjectRetain(v68);
      if (v70)
      {
LABEL_18:
        if (v70 < 1)
        {
LABEL_50:
          __break(1u);
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
          return;
        }

        uint64_t v71 = 0LL;
        do
        {
          if ((v69 & 0xC000000000000001LL) != 0) {
            id v72 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v71, v69);
          }
          else {
            id v72 = *(id *)(v69 + 8 * v71 + 32);
          }
          v73 = v72;
          ++v71;
          id v74 = [v47 ruleSetRunner];
          [v74 loadRuleSet:v73];
        }

        while (v70 != v71);
      }
    }

    swift_bridgeObjectRelease_n(v69, 2LL);
    id v57 = v180;
  }

LABEL_31:
  id v87 = [v47 parameters];
  id v88 = [v87 copy];

  id v159 = v88;
  v173 = (char *)[v88 copy];
  uint64_t v89 = type metadata accessor for StringStream(0LL);
  swift_allocObject(v89, *(unsigned int *)(v89 + 48), *(unsigned __int16 *)(v89 + 52));
  uint64_t v90 = StringStream.init()();
  aBlock = (void **)v90;
  uint64_t v91 = sub_100008DCC(&qword_100010C60);
  swift_allocObject(v91, *(unsigned int *)(v91 + 48), *(unsigned __int16 *)(v91 + 52));
  uint64_t v161 = v90;
  swift_retain(v90);
  uint64_t v92 = FormattedStream.init(_:)(&aBlock);
  EloquenceMarkupWriter.init(stream:)(v92);
  id v93 = [v57 parameters];
  id v94 = [v93 speed];

  uint64_t v95 = v177;
  Swift::String_optional v96 = v172;
  v97 = (void (*)(char *, uint64_t, uint64_t))v172[2];
  v97(v58, v178 + qword_100010B00, v177);
  AUParamValue.wrappedValue.getter(&aBlock, v95);
  Swift::String v98 = (void (*)(char *, uint64_t))v96[1];
  v98(v58, v95);
  float v99 = (float)(uint64_t)aBlock / 100.0;
  if ((_BYTE)v182) {
    float v99 = 1.0;
  }
  float v100 = v99 * (float)(uint64_t)v94;
  if ((~LODWORD(v100) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_48;
  }

  if (v100 <= -9.2234e18)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }

  uint64_t v172 = v47;
  if (v100 >= 9.2234e18)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }

  uint64_t v101 = (uint64_t)v100;
  id v102 = v180;
  id v103 = [v180 parameters];
  id v104 = [v103 pitchBase];

  uint64_t v105 = v176;
  EloquenceMarkupWriter.voiceNormalPitch.setter(v104, v176);
  uint64_t v156 = v101;
  EloquenceMarkupWriter.voiceNormalRate.setter(v101, v105);
  id v106 = [v102 parameters];
  id v107 = [v106 volume];

  EloquenceMarkupWriter.voiceNormalVolume.setter(v107, v105);
  id v108 = [v102 languageCode];
  uint64_t v109 = static String._unconditionallyBridgeFromObjectiveC(_:)(v108);
  uint64_t v111 = v110;

  EloquenceMarkupWriter.language.setter(v109, v111, v105);
  unint64_t v112 = sub_100008F18();
  uint64_t v113 = TTSMarkupVisitor.visit(_:)(v162, v105, v112);
  uint64_t v157 = dispatch thunk of StringStream.string.getter(v113);
  uint64_t v158 = v114;
  uint64_t v115 = v177;
  uint64_t v116 = v178;
  v97(v58, v178 + qword_100010B08, v177);
  AUParamValue.wrappedValue.getter(&aBlock, v115);
  v98(v58, v115);
  id v117 = v173;
  if ((v182 & 1) == 0) {
    [v173 setHeadSize:aBlock];
  }
  v97(v58, v116 + qword_100010B18, v115);
  AUParamValue.wrappedValue.getter(&aBlock, v115);
  v98(v58, v115);
  double v118 = v172;
  if ((v182 & 1) == 0) {
    [v117 setPitchFluctuation:aBlock];
  }
  v97(v58, v116 + qword_100010B20, v115);
  AUParamValue.wrappedValue.getter(&aBlock, v115);
  v98(v58, v115);
  if ((v182 & 1) == 0) {
    [v117 setBreathiness:aBlock];
  }
  v97(v58, v116 + qword_100010B28, v115);
  AUParamValue.wrappedValue.getter(&aBlock, v115);
  v98(v58, v115);
  if ((v182 & 1) == 0) {
    [v117 setRoughness:aBlock];
  }
  v97(v58, v116 + qword_100010B10, v115);
  AUParamValue.wrappedValue.getter(&aBlock, v115);
  v98(v58, v115);
  if ((v182 & 1) == 0) {
    [v117 setPitchBase:aBlock];
  }
  [v117 setSpeed:v156];
  uint64_t v119 = v116 + qword_100010B30;
  uint64_t v120 = v164;
  uint64_t v121 = *(void (**)(char *, uint64_t, uint64_t))(v164 + 16);
  uint64_t v122 = v167;
  uint64_t v123 = v168;
  v121(v167, v119, v168);
  AUParamValue.wrappedValue.getter(&aBlock, v123);
  v124 = *(void (**)(char *, uint64_t))(v120 + 8);
  v124(v122, v123);
  [v118 setHighQualityMode:aBlock];
  v121(v122, v178 + qword_100010B38, v123);
  AUParamValue.wrappedValue.getter(&aBlock, v123);
  v124(v122, v123);
  [v118 setPhrasePrediction:aBlock];
  v121(v122, v178 + qword_100010B40, v123);
  AUParamValue.wrappedValue.getter(&aBlock, v123);
  v124(v122, v123);
  [v118 setAbbreviationDictionary:aBlock];
  v121(v122, v178 + qword_100010B48, v123);
  AUParamValue.wrappedValue.getter(&aBlock, v123);
  v124(v122, v123);
  [v118 setPreferCommunityDictionary:aBlock];
  Swift::String v125 = (void *)static TTSSpeechTracer.shared.getter([v118 setParameters:v117]);
  id v126 = v160;
  id v127 = [v160 ssmlRepresentation];
  uint64_t v128 = static String._unconditionallyBridgeFromObjectiveC(_:)(v127);
  uint64_t v130 = v129;

  __n128 v131 = v169;
  uint64_t *v169 = v128;
  v131[1] = v130;
  uint64_t v132 = v158;
  v131[2] = v157;
  v131[3] = v132;
  uint64_t v133 = v170;
  v166(v131, enum case for TTSSpeechEvent.markupConversion(_:), v170);
  swift_bridgeObjectRetain(v132);
  id v134 = [v126 jobIdentifier];
  uint64_t v135 = static String._unconditionallyBridgeFromObjectiveC(_:)(v134);
  uint64_t v137 = v136;

  uint64_t v138 = v135;
  uint64_t v139 = v178;
  dispatch thunk of TTSSpeechTracer.emit(event:forIdentifier:)(v131, v138, v137);

  __n128 v140 = swift_bridgeObjectRelease(v137);
  v163(v131, v133, v140);
  id v141 = [v118 ruleSetRunner];
  uint64_t v142 = swift_allocObject(&unk_10000C6C0, 24LL, 7LL);
  *(void *)(v142 + 16) = v126;
  unint64_t v185 = sub_100008F88;
  uint64_t v186 = v142;
  aBlock = _NSConcreteStackBlock;
  uint64_t v182 = 1107296256LL;
  unint64_t v183 = sub_100006E68;
  unsigned int v184 = &unk_10000C6D8;
  Swift::String_optional v143 = _Block_copy(&aBlock);
  uint64_t v144 = v186;
  id v145 = v126;
  swift_release(v144);
  [v141 setMatchLogger:v143];
  _Block_release(v143);

  NSString v146 = String._bridgeToObjectiveC()();
  objc_msgSend(v118, "synthesizeText:", v146, swift_bridgeObjectRelease(v132).n128_f64[0]);
  swift_release(v161);

  (*(void (**)(char *, uint64_t))(v171 + 8))(v179, v176);
  __n128 v147 = v126;
  (*(void (**)(char *, uint64_t))(v174 + 8))(v162, v175);
  id v148 = v180;
  v149 = *(void **)(v139 + qword_100010B70);
  *(void *)(v139 + qword_100010B70) = v180;
  id v150 = v148;

  uint64_t v151 = sub_100008DCC(&qword_100010C58);
  uint64_t v152 = swift_allocObject(v151, 40LL, 7LL);
  *(_OWORD *)(v152 + 16) = xmmword_100009E40;
  *(void *)(v152 + 32) = v147;
  aBlock = (void **)v152;
  specialized Array._endMutation()(v152);
  uint64_t v153 = *(void *)(v139 + qword_100010B68);
  *(void *)(v139 + qword_100010B68) = aBlock;
  id v154 = v147;

  swift_bridgeObjectRelease(v153);
  *(void *)(v139 + qword_100010B80) = 0LL;
}

uint64_t sub_100006CF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v29 = a4;
  id v30 = a8;
  uint64_t v27 = a5;
  uint64_t v28 = a3;
  uint64_t v12 = type metadata accessor for TTSSpeechEvent(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  id v15 = (uint64_t *)((char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  type metadata accessor for TTSSpeechTracer(0LL);
  uint64_t v16 = (void *)static TTSSpeechTracer.shared.getter();
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a6);
  id v17 = [a7 identifier];
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = v19;

  *id v15 = a1;
  v15[1] = a2;
  v15[2] = v27;
  v15[3] = a6;
  uint64_t v21 = v29;
  v15[4] = v28;
  v15[5] = v21;
  v15[6] = v18;
  v15[7] = v20;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))( v15,  enum case for TTSSpeechEvent.ruleRewrite(_:),  v12);
  id v22 = [v30 jobIdentifier];
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;

  dispatch thunk of TTSSpeechTracer.emit(event:forIdentifier:)(v15, v23, v25);
  swift_bridgeObjectRelease(v25);
  return (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_100006E68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  uint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  uint64_t v17 = v16;
  swift_retain(v10);
  id v18 = a6;
  v11(v12, v14, a3, a4, v15, v17, v18);
  swift_release(v10);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v17);
}

void sub_100006F2C(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  sub_100005BD0(v4);
}

void sub_100006F80(unint64_t a1)
{
  uint64_t v3 = qword_100010B68;
  uint64_t v4 = *(void *)&v1[qword_100010B68];
  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0) {
      uint64_t v19 = *(void *)&v1[qword_100010B68];
    }
    else {
      uint64_t v19 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*(void *)&v1[qword_100010B68]);
    id v5 = (char *)_CocoaArrayWrapper.endIndex.getter(v19);
    if (!v5) {
      goto LABEL_15;
    }
  }

  else
  {
    id v5 = *(char **)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(*(void *)&v1[qword_100010B68]);
    if (!v5) {
      goto LABEL_15;
    }
  }

  if ((v4 & 0xC000000000000001LL) != 0)
  {
    id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v4);
  }

  else
  {
    if (!*(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10))
    {
      __break(1u);
      goto LABEL_23;
    }

    id v6 = *(id *)(v4 + 32);
  }

  uint64_t v7 = v6;
  id v8 = objc_msgSend(v6, "ssmlRepresentation", swift_bridgeObjectRelease(v4).n128_f64[0]);

  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  unint64_t v11 = v10;

  swift_bridgeObjectRetain(v11);
  id v5 = v1;
  uint64_t v4 = (uint64_t)sub_100008910(a1, v9, v11, (uint64_t)v5);
  swift_bridgeObjectRelease_n(v11, 2LL);

  if (!((unint64_t)v4 >> 62))
  {
    if (*(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
      goto LABEL_8;
    }
LABEL_15:
    swift_bridgeObjectRelease(v4);
    return;
  }

LABEL_23:
  if (v4 < 0) {
    uint64_t v20 = v4;
  }
  else {
    uint64_t v20 = v4 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v4);
  uint64_t v21 = _CocoaArrayWrapper.endIndex.getter(v20);
  swift_bridgeObjectRelease(v4);
  if (!v21) {
    goto LABEL_15;
  }
LABEL_8:
  id v12 = [v5 speechSynthesisOutputMetadataBlock];
  if (!v12) {
    goto LABEL_15;
  }
  uint64_t v13 = (void (**)(void, void, void))v12;
  uint64_t v14 = *(void *)&v1[v3];
  if (!((unint64_t)v14 >> 62))
  {
    uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    _Block_copy(v12);
    swift_bridgeObjectRetain(v14);
    if (v15) {
      goto LABEL_11;
    }
LABEL_32:
    _Block_release(v13);
    _Block_release(v13);
    swift_bridgeObjectRelease(v14);
    __break(1u);
    goto LABEL_33;
  }

  if (v14 < 0) {
    uint64_t v22 = v14;
  }
  else {
    uint64_t v22 = v14 & 0xFFFFFFFFFFFFFF8LL;
  }
  _Block_copy(v12);
  swift_bridgeObjectRetain(v14);
  if (!_CocoaArrayWrapper.endIndex.getter(v22)) {
    goto LABEL_32;
  }
LABEL_11:
  if ((v14 & 0xC000000000000001LL) != 0)
  {
LABEL_33:
    id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v14);
    goto LABEL_14;
  }

  if (*(void *)((v14 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    id v16 = *(id *)(v14 + 32);
LABEL_14:
    uint64_t v17 = v16;
    swift_bridgeObjectRelease(v14);
    sub_100009054(0LL, &qword_100010CA8, &OBJC_CLASS___AVSpeechSynthesisMarker_ptr);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    ((void (**)(void, Class, void *))v13)[2](v13, isa, v17);

    _Block_release(v13);
    _Block_release(v13);

    goto LABEL_15;
  }

  __break(1u);
}

uint64_t sub_100007220(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((a4 & 1) != 0)
  {
    uint64_t v31 = a5;
    unint64_t v32 = a6;
    uint64_t v29 = a1;
    uint64_t v30 = a2;
    uint64_t v16 = type metadata accessor for Locale(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v13, 1LL, 1LL, v16);
    unint64_t v26 = sub_10000908C();
    uint64_t v17 = StringProtocol.range<A>(of:options:range:locale:)( &v29,  2LL,  0LL,  0LL,  1LL,  v13,  &type metadata for String,  &type metadata for String,  v26,  v26);
    goto LABEL_11;
  }

  uint64_t v14 = HIBYTE(a6) & 0xF;
  if ((a6 & 0x2000000000000000LL) == 0) {
    uint64_t v14 = a5 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v14 < a3 >> 14) {
    return 0LL;
  }
  uint64_t v19 = 7LL;
  if (((a6 >> 60) & ((a5 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v19 = 11LL;
  }
  uint64_t v31 = a5;
  unint64_t v32 = a6;
  uint64_t v20 = v19 | (v14 << 16);
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v21 = type metadata accessor for Locale(0LL);
  uint64_t v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL);
  v28(v13, 1LL, 1LL, v21);
  unint64_t v22 = sub_10000908C();
  uint64_t v15 = StringProtocol.range<A>(of:options:range:locale:)( &v29,  2LL,  a3,  v20,  0LL,  v13,  &type metadata for String,  &type metadata for String,  v22,  v22);
  LOBYTE(v20) = v23;
  sub_1000090D0((uint64_t)v13);
  if ((v20 & 1) != 0)
  {
    uint64_t v31 = a5;
    unint64_t v32 = a6;
    uint64_t v29 = a1;
    uint64_t v30 = a2;
    v28(v13, 1LL, 1LL, v21);
    uint64_t v17 = StringProtocol.range<A>(of:options:range:locale:)( &v29,  4LL,  15LL,  a3,  0LL,  v13,  &type metadata for String,  &type metadata for String,  v22,  v22);
LABEL_11:
    uint64_t v15 = v17;
    char v24 = v18;
    sub_1000090D0((uint64_t)v13);
    if ((v24 & 1) != 0) {
      return 0LL;
    }
  }

  return v15;
}

Class sub_100007454()
{
  v0 = sub_100008C1C();
  sub_100009054(0LL, &qword_100010C00, &OBJC_CLASS___AVSpeechSynthesisProviderVoice_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v0);
  return isa;
}

void sub_1000074AC(id *a1@<X0>, void *a2@<X8>)
{
  id v2 = *a1;
  id v3 = [*a1 name];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  uint64_t v5 = v4;

  id v6 = [v2 identifier];
  static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  uint64_t v8 = v7;

  uint64_t v9 = sub_100008DCC(&qword_100010C10);
  uint64_t v10 = swift_allocObject(v9, 48LL, 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_100009E50;
  id v11 = [v2 languageCode];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  uint64_t v14 = v13;

  *(void *)(v10 + 32) = v12;
  *(void *)(v10 + 40) = v14;
  uint64_t v15 = swift_allocObject(v9, 48LL, 7LL);
  *(_OWORD *)(v15 + 16) = xmmword_100009E50;
  id v16 = [v2 languageCode];
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  uint64_t v19 = v18;

  *(void *)(v15 + 32) = v17;
  *(void *)(v15 + 40) = v19;
  id v20 = objc_allocWithZone(&OBJC_CLASS___AVSpeechSynthesisProviderVoice);
  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v10);
  Class v24 = Array._bridgeToObjectiveC()().super.isa;
  id v25 = objc_msgSend( v20,  "initWithName:identifier:primaryLanguages:supportedLanguages:",  v21,  v22,  isa,  v24,  swift_bridgeObjectRelease(v15).n128_f64[0]);

  uint64_t v26 = sub_100008DCC(&qword_100010C18);
  uint64_t inited = swift_initStackObject(v26, v33);
  *(_OWORD *)(inited + 16) = xmmword_100009E50;
  v32[0] = static String._unconditionallyBridgeFromObjectiveC(_:)(kTTSSynthesisProviderVoiceAttributeGroupName);
  v32[1] = v28;
  AnyHashable.init<A>(_:)(v32, &type metadata for String, &protocol witness table for String);
  *(void *)(inited + 96) = &type metadata for String;
  *(void *)(inited + 72) = 0x636E6575716F6C45LL;
  *(void *)(inited + 80) = 0xE900000000000065LL;
  unint64_t v29 = sub_100005468(inited);
  Class v30 = Dictionary._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v25, "setExtraAttributes:", v30, swift_bridgeObjectRelease(v29).n128_f64[0]);

  *a2 = v25;
}

void sub_100007770()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for TTSSpeechEvent(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  type metadata accessor for TTSSpeechTracer(0LL);
  id v6 = (void *)static TTSSpeechTracer.shared.getter();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for TTSSpeechEvent.receivedStop(_:), v2);
  uint64_t v7 = qword_100010B68;
  uint64_t v8 = *(void *)(v1 + qword_100010B68);
  if (!((unint64_t)v8 >> 62))
  {
    uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(*(void *)(v1 + qword_100010B68));
    if (v9) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease(v8);
    unint64_t v14 = 0xE000000000000000LL;
    goto LABEL_12;
  }

  if (v8 < 0) {
    uint64_t v15 = *(void *)(v1 + qword_100010B68);
  }
  else {
    uint64_t v15 = v8 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(*(void *)(v1 + qword_100010B68));
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v15);
  if (!v9) {
    goto LABEL_11;
  }
LABEL_3:
  if ((v8 & 0xC000000000000001LL) != 0)
  {
    id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v8);
    goto LABEL_6;
  }

  if (*(void *)((v8 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    id v10 = *(id *)(v8 + 32);
LABEL_6:
    id v11 = v10;
    swift_bridgeObjectRelease(v8);
    id v12 = [v11 jobIdentifier];

    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    unint64_t v14 = v13;

LABEL_12:
    dispatch thunk of TTSSpeechTracer.emit(event:forIdentifier:)(v5, v9, v14);
    swift_bridgeObjectRelease(v14);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    [*(id *)(v1 + qword_100010B58) cancelSynthesis];
    uint64_t v16 = *(void *)(v1 + v7);
    *(void *)(v1 + v7) = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRelease(v16);
    *(void *)(v1 + qword_100010B80) = 0LL;
    uint64_t v17 = *(void **)(v1 + qword_100010B78);
    *(void *)(v1 + qword_100010B78) = 0LL;

    uint64_t v18 = v1 + qword_100010B88;
    *(void *)uint64_t v18 = 0LL;
    *(_BYTE *)(v18 + 8) = 1;
    return;
  }

  __break(1u);
}

void sub_100007974(void *a1)
{
  id v1 = a1;
  sub_100007770();
}

void sub_1000079A8()
{
  uint64_t v1 = v0 + qword_100010B00;
  uint64_t v2 = sub_100008DCC(&qword_100010C38);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL);
  v3(v1, v2);
  v3(v0 + qword_100010B08, v2);
  v3(v0 + qword_100010B10, v2);
  v3(v0 + qword_100010B18, v2);
  v3(v0 + qword_100010B20, v2);
  v3(v0 + qword_100010B28, v2);
  uint64_t v4 = v0 + qword_100010B30;
  uint64_t v5 = sub_100008DCC(&qword_100010C30);
  id v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL);
  v6(v4, v5);
  v6(v0 + qword_100010B38, v5);
  v6(v0 + qword_100010B40, v5);
  v6(v0 + qword_100010B48, v5);

  swift_bridgeObjectRelease(*(void *)(v0 + qword_100010B68));
}

id sub_100007B24()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for KonaSynthesizerAudioUnit(0LL);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100007B58(uint64_t a1)
{
  uint64_t v2 = a1 + qword_100010B00;
  uint64_t v3 = sub_100008DCC(&qword_100010C38);
  uint64_t v4 = *(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL);
  v4(v2, v3);
  v4(a1 + qword_100010B08, v3);
  v4(a1 + qword_100010B10, v3);
  v4(a1 + qword_100010B18, v3);
  v4(a1 + qword_100010B20, v3);
  v4(a1 + qword_100010B28, v3);
  uint64_t v5 = a1 + qword_100010B30;
  uint64_t v6 = sub_100008DCC(&qword_100010C30);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL);
  v7(v5, v6);
  v7(a1 + qword_100010B38, v6);
  v7(a1 + qword_100010B40, v6);
  v7(a1 + qword_100010B48, v6);

  swift_bridgeObjectRelease(*(void *)(a1 + qword_100010B68));
}

uint64_t variable initialization expression of AudioUnitFactory.audioUnit()
{
  return 0LL;
}

uint64_t type metadata accessor for KonaSynthesizerAudioUnit(uint64_t a1)
{
  uint64_t result = qword_100010B90;
  if (!qword_100010B90) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for KonaSynthesizerAudioUnit);
  }
  return result;
}

void sub_100007D1C(uint64_t a1)
{
  uint64_t v2 = qword_100010E68;
  sub_100007DF8(319LL);
  if (v4 <= 0x3F)
  {
    v7[0] = *(void *)(v3 - 8) + 64LL;
    v7[1] = v7[0];
    v7[2] = v7[0];
    v7[3] = v7[0];
    v7[4] = v7[0];
    v7[5] = v7[0];
    sub_100007EFC();
    if (v6 <= 0x3F)
    {
      uint64_t v8 = *(void *)(v5 - 8) + 64LL;
      uint64_t v9 = v8;
      uint64_t v10 = v8;
      uint64_t v11 = v8;
      id v12 = (char *)&value witness table for Builtin.UnknownObject + 64;
      unint64_t v13 = "\b";
      unint64_t v14 = "\b";
      uint64_t v15 = (char *)&value witness table for Builtin.BridgeObject + 64;
      uint64_t v16 = "\b";
      uint64_t v17 = "\b";
      uint64_t v18 = (char *)&value witness table for Builtin.Int64 + 64;
      uint64_t v19 = &unk_100009ED8;
      swift_initClassMetadata2(a1, 0LL, 18LL, v7, a1 + v2);
    }
  }

void sub_100007DF8(uint64_t a1)
{
  if (!qword_100010BC8)
  {
    uint64_t v2 = sub_100007E5C(&qword_100010BD0);
    unint64_t v3 = sub_100007EA0();
    unint64_t v4 = type metadata accessor for AUParamValue(a1, v2, v3);
    if (!v5) {
      atomic_store(v4, (unint64_t *)&qword_100010BC8);
    }
  }

uint64_t sub_100007E5C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100007EA0()
{
  unint64_t result = qword_100010BD8;
  if (!qword_100010BD8)
  {
    uint64_t v1 = sub_100007E5C(&qword_100010BD0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_100010BD8);
  }

  return result;
}

void sub_100007EFC()
{
  if (!qword_100010BE0)
  {
    unint64_t v0 = type metadata accessor for AUParamValue(0LL, &type metadata for Bool, &protocol witness table for Bool);
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010BE0);
    }
  }

uint64_t sub_100007F58()
{
  return type metadata accessor for KonaSynthesizerAudioUnit(0LL);
}

unint64_t sub_100007F60(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_100007FF4(a1, a2, v5);
}

unint64_t sub_100007FC4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_1000080D4(a1, v4);
}

unint64_t sub_100007FF4(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_1000080D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_100008E64(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100008EA0((uint64_t)v9);
      if ((v7 & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

unint64_t sub_100008198(unint64_t result)
{
  if (result >= 0xA) {
    return 10LL;
  }
  return result;
}

void *sub_1000081A8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = a1;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v8)
  {
    uint64_t v23 = v4;
    uint64_t v24 = v7;
    unint64_t v25 = v7 & 0xC000000000000001LL;
    uint64_t v4 = 4LL;
    while (1)
    {
      uint64_t v9 = v4 - 4;
      if (!v25) {
        break;
      }
      id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4 - 4, v7);
      uint64_t v11 = v4 - 3;
      if (__OFADD__(v9, 1LL)) {
        goto LABEL_20;
      }
LABEL_9:
      uint64_t v12 = v8;
      unint64_t v13 = v10;
      uint64_t v14 = a3;
      id v15 = objc_msgSend(v10, "identifier", v23);
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      uint64_t v18 = v17;

      a3 = v14;
      BOOL v19 = v16 == a2 && v18 == v14;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
LABEL_19:
        swift_bridgeObjectRelease(a3);
        return v13;
      }

      char v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v18, a2, v14, 0LL);
      swift_bridgeObjectRelease(v18);
      if ((v20 & 1) != 0)
      {
        a3 = v24;
        goto LABEL_19;
      }

      ++v4;
      uint64_t v8 = v12;
      BOOL v19 = v11 == v12;
      uint64_t v7 = v24;
      if (v19)
      {
        swift_bridgeObjectRelease(v24);
        return 0LL;
      }
    }

    id v10 = *(id *)(v7 + 8 * v4);
    uint64_t v11 = v4 - 3;
    if (!__OFADD__(v9, 1LL)) {
      goto LABEL_9;
    }
LABEL_20:
    __break(1u);
LABEL_21:
    if (v7 < 0) {
      uint64_t v21 = v7;
    }
    else {
      uint64_t v21 = v7 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v7);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v21);
  }

  swift_bridgeObjectRelease(v7);
  return 0LL;
}

uint64_t sub_10000834C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v3)
  {
    for (uint64_t i = 4LL; ; ++i)
    {
      uint64_t v5 = i - 4;
      if ((a1 & 0xC000000000000001LL) == 0) {
        break;
      }
      id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(i - 4, a1);
      uint64_t v7 = i - 3;
      if (__OFADD__(v5, 1LL)) {
        goto LABEL_19;
      }
LABEL_9:
      NSString v22 = v6;
      id v8 = [v6 identifier];
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
      uint64_t v11 = v10;

      id v12 = [a2 voice];
      id v13 = [v12 identifier];

      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      uint64_t v16 = v15;

      if (v9 == v14 && v11 == v16)
      {
        swift_bridgeObjectRelease(a1);
        swift_bridgeObjectRelease(v11);
LABEL_18:
        uint64_t v3 = (uint64_t)v22;
        swift_bridgeObjectRelease(v11);
        return v3;
      }

      char v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v11, v14, v16, 0LL);
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v16);
      if ((v18 & 1) != 0)
      {
        uint64_t v11 = a1;
        goto LABEL_18;
      }

      if (v7 == v3)
      {
        swift_bridgeObjectRelease(a1);
        return 0LL;
      }
    }

    id v6 = *(id *)(a1 + 8 * i);
    uint64_t v7 = i - 3;
    if (!__OFADD__(v5, 1LL)) {
      goto LABEL_9;
    }
LABEL_19:
    __break(1u);
LABEL_20:
    if (a1 < 0) {
      uint64_t v19 = a1;
    }
    else {
      uint64_t v19 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v19);
  }

  swift_bridgeObjectRelease(a1);
  return v3;
}

unint64_t sub_10000852C(uint64_t a1, uint64_t a2)
{
  id v4 = [(id)objc_opt_self(AXKonaSpeechEngine) allVoices];
  uint64_t v5 = sub_100009054(0LL, &qword_100010C08, &OBJC_CLASS___AXKonaVoice_ptr);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  swift_bridgeObjectRetain(a2);
  uint64_t v7 = sub_1000081A8(v6, a1, a2);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(a2);
  if (!v7) {
    return sub_100005350((uint64_t)&_swiftEmptyArrayStorage);
  }
  uint64_t v8 = sub_100008DCC(&qword_100010C80);
  uint64_t inited = swift_initStackObject(v8, v33);
  *(_OWORD *)(inited + 16) = xmmword_100009E60;
  char v32 = 0;
  *(void *)(inited + 32) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 40) = v10;
  *(void *)(inited + 48) = [objc_allocWithZone(NSNumber) initWithInteger:100];
  char v32 = 1;
  *(void *)(inited + 56) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 64) = v11;
  id v12 = [v7 parameters];
  id v13 = [v12 headSize];

  *(void *)(inited + 72) = [objc_allocWithZone(NSNumber) initWithInteger:v13];
  char v32 = 2;
  *(void *)(inited + 80) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 88) = v14;
  id v15 = [v7 parameters];
  id v16 = [v15 pitchBase];

  *(void *)(inited + 96) = [objc_allocWithZone(NSNumber) initWithInteger:v16];
  char v32 = 3;
  *(void *)(inited + 104) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 112) = v17;
  id v18 = [v7 parameters];
  id v19 = [v18 pitchFluctuation];

  *(void *)(inited + 120) = [objc_allocWithZone(NSNumber) initWithInteger:v19];
  char v32 = 4;
  *(void *)(inited + 128) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 136) = v20;
  id v21 = [v7 parameters];
  id v22 = [v21 breathiness];

  *(void *)(inited + 144) = [objc_allocWithZone(NSNumber) initWithInteger:v22];
  char v32 = 5;
  *(void *)(inited + 152) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 160) = v23;
  id v24 = [v7 parameters];
  id v25 = [v24 roughness];

  *(void *)(inited + 168) = [objc_allocWithZone(NSNumber) initWithInteger:v25];
  char v32 = 6;
  *(void *)(inited + 176) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 184) = v26;
  sub_100009054(0LL, &qword_100010C78, &OBJC_CLASS___NSNumber_ptr);
  *(NSNumber *)(inited + 192) = NSNumber.init(BOOLeanLiteral:)(0);
  char v32 = 8;
  *(void *)(inited + 200) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 208) = v27;
  *(NSNumber *)(inited + 216) = NSNumber.init(BOOLeanLiteral:)(1);
  char v32 = 7;
  *(void *)(inited + 224) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 232) = v28;
  *(NSNumber *)(inited + 240) = NSNumber.init(BOOLeanLiteral:)(0);
  char v32 = 9;
  *(void *)(inited + 248) = String.init<A>(describing:)(&v32, &type metadata for KonaAUParameters);
  *(void *)(inited + 256) = v29;
  *(NSNumber *)(inited + 264) = NSNumber.init(BOOLeanLiteral:)(0);
  unint64_t v30 = sub_100005350(inited);

  return v30;
}

void *sub_100008910(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = a1;
  unint64_t v44 = (unint64_t)&_swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_26;
  }
  uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v9; uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v36))
  {
    id v37 = v5;
    uint64_t v38 = v9;
    uint64_t v40 = a2;
    unint64_t v41 = v8 & 0xC000000000000001LL;
    uint64_t v10 = a4 + qword_100010B88;
    a2 = 4LL;
    uint64_t v39 = v8;
    while (1)
    {
      a4 = a2 - 4;
      id v12 = v41 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2 - 4, v8) : *(id *)(v8 + 8 * a2);
      uint64_t v5 = v12;
      uint64_t v13 = a2 - 3;
      if (__OFADD__(a4, 1LL)) {
        break;
      }
      NSString v14 = [v12 text];
      if (!v14)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
        uint64_t v17 = v16;
        NSString v14 = String._bridgeToObjectiveC()();
        *(void *)&double v15 = swift_bridgeObjectRelease(v17).n128_u64[0];
      }

      id v18 = objc_msgSend(v14, "xmlEscaped", v15, v37);

      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
      unint64_t v21 = v20;

      uint64_t v8 = a3;
      uint64_t v22 = sub_100007220(v19, v21, *(void *)v10, *(_BYTE *)(v10 + 8), v40, a3);
      if ((v23 & 1) != 0)
      {

        swift_bridgeObjectRelease(v21);
        uint64_t v11 = v38;
        uint64_t v8 = v39;
      }

      else
      {
        uint64_t v24 = v22;
        uint64_t v25 = String.count.getter(v19, v21);
        *(void *)uint64_t v10 = String.index(_:offsetBy:)(v24, v25, v40, a3);
        *(_BYTE *)(v10 + 8) = 0;
        v43[0] = v40;
        v43[1] = a3;
        unint64_t v26 = sub_10000908C();
        a4 = String.Index.utf16Offset<A>(in:)(v43, v24, &type metadata for String, v26);
        if ((v21 & 0x1000000000000000LL) != 0)
        {
          Swift::Int v28 = String.UTF16View._foreignCount()();
        }

        else
        {
          uint64_t v27 = HIBYTE(v21) & 0xF;
          if ((v21 & 0x2000000000000000LL) == 0) {
            uint64_t v27 = v19;
          }
          Swift::Int v28 = String.UTF16View._nativeGetOffset(for:)((v27 << 16) | 7, v19, v21);
        }

        Swift::Int v29 = v28;
        unsigned int v30 = objc_msgSend(v5, "framePosition", swift_bridgeObjectRelease(v21).n128_f64[0]);
        if (v30 >> 30) {
          goto LABEL_25;
        }
        id v31 = objc_msgSend( objc_allocWithZone(AVSpeechSynthesisMarker),  "initWithMarkerType:forTextRange:atByteSampleOffset:",  1,  a4,  v29,  4 * v30);

        uint64_t v11 = v38;
        uint64_t v8 = v39;
        if (v31)
        {
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          unint64_t v33 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v32 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v33 >= v32 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v32 > 1, v33 + 1, 1LL);
          }
          uint64_t v34 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v33, v31);
          specialized Array._endMutation()(v34);
        }
      }

      ++a2;
      if (v13 == v11)
      {
        swift_bridgeObjectRelease(v8);
        return (void *)v44;
      }
    }

    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    if (v8 < 0) {
      uint64_t v36 = v8;
    }
    else {
      uint64_t v36 = v8 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v8);
  }

  swift_bridgeObjectRelease(v8);
  return &_swiftEmptyArrayStorage;
}

void *sub_100008C1C()
{
  id v0 = [(id)objc_opt_self(AXKonaSpeechEngine) allVoices];
  uint64_t v1 = sub_100009054(0LL, &qword_100010C08, &OBJC_CLASS___AXKonaVoice_ptr);
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v0, v1);

  uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (v3)
  {
    while (1)
    {
      double v15 = &_swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(v3);
      if (v3 < 0) {
        break;
      }
      uint64_t v4 = 0LL;
      while (v3 != v4)
      {
        if ((v2 & 0xC000000000000001LL) != 0) {
          id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v4, v2);
        }
        else {
          id v5 = *(id *)(v2 + 8 * v4 + 32);
        }
        unint64_t v6 = v5;
        id v13 = v5;
        sub_1000074AC(&v13, &v14);

        ++v4;
        uint64_t v7 = v14;
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        uint64_t v8 = v15[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v8);
        uint64_t v9 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v8, v7);
        specialized ContiguousArray._endMutation()(v9);
        if (v3 == v4)
        {
          uint64_t v10 = v15;
          swift_bridgeObjectRelease(v2);
          return v10;
        }
      }

      __break(1u);
LABEL_12:
      if (v2 < 0) {
        uint64_t v11 = v2;
      }
      else {
        uint64_t v11 = v2 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v2);
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v11);
      swift_bridgeObjectRelease(v2);
      if (!v3) {
        goto LABEL_16;
      }
    }

    __break(1u);
    unint64_t result = (void *)swift_release(v15);
    __break(1u);
  }

  else
  {
LABEL_16:
    swift_bridgeObjectRelease(v2);
    return &_swiftEmptyArrayStorage;
  }

  return result;
}

uint64_t sub_100008DCC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100008E0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100008DCC(&qword_100010C28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100008E54(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100008E64(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100008EA0(uint64_t a1)
{
  return a1;
}

unint64_t sub_100008ED4()
{
  unint64_t result = qword_100010C50;
  if (!qword_100010C50)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100010C50);
  }

  return result;
}

unint64_t sub_100008F18()
{
  unint64_t result = qword_100010C68;
  if (!qword_100010C68)
  {
    uint64_t v1 = sub_100007E5C(&qword_100010C40);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for EloquenceMarkupWriter<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100010C68);
  }

  return result;
}

uint64_t sub_100008F64()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100008F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  return sub_100006CF8(a1, a2, a3, a4, a5, a6, a7, *(void **)(v7 + 16));
}

uint64_t sub_100008F90(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100008FA0(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_100008FA8()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_100008FCC( _DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_100008FEC(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

uint64_t sub_100008FFC()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_100009020()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16LL))();
}

void type metadata accessor for CMFormatDescription(uint64_t a1)
{
}

uint64_t sub_100009054(uint64_t a1, unint64_t *a2, void *a3)
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

unint64_t sub_10000908C()
{
  unint64_t result = qword_100010CB0;
  if (!qword_100010CB0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100010CB0);
  }

  return result;
}

uint64_t sub_1000090D0(uint64_t a1)
{
  uint64_t v2 = sub_100008DCC(&qword_100010CB8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

_BYTE *initializeBufferWithCopyOfBuffer for KonaAUParameters(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for KonaAUParameters(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF7) {
    goto LABEL_17;
  }
  if (a2 + 9 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 9) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 9;
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
      return (*a1 | (v4 << 8)) - 9;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 9;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for KonaAUParameters(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF6) {
    return ((uint64_t (*)(void))((char *)&loc_1000091FC + 4 * byte_100009E85[v4]))();
  }
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_100009230 + 4 * byte_100009E80[v4]))();
}

uint64_t sub_100009230(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009238(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100009240LL);
  }
  return result;
}

uint64_t sub_10000924C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100009254LL);
  }
  *(_BYTE *)unint64_t result = a2 + 9;
  return result;
}

uint64_t sub_100009258(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009260(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000926C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100009278(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for KonaAUParameters()
{
  return &type metadata for KonaAUParameters;
}

__n128 sub_100009290(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_1000092A4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000092C4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + swift_unknownObjectWeakDestroy(v0 + 16) = 0LL;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for AudioBufferList(uint64_t a1)
{
}

uint64_t sub_100009304(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

__n128 sub_100009334(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  return result;
}

uint64_t sub_100009348(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100009368(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + 64) = v3;
  return result;
}

void type metadata accessor for AudioTimeStamp(uint64_t a1)
{
}

void type metadata accessor for AudioUnitRenderActionFlags(uint64_t a1)
{
}

unint64_t sub_1000093D0()
{
  unint64_t result = qword_100010CE0;
  if (!qword_100010CE0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100009FF4, &type metadata for KonaAUParameters);
    atomic_store(result, (unint64_t *)&qword_100010CE0);
  }

  return result;
}

void type metadata accessor for AudioTimeStampFlags(uint64_t a1)
{
}

__n128 sub_100009428(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for SMPTETime(uint64_t a1)
{
}

__n128 sub_100009450(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000945C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000947C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }

  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }

  *(_BYTE *)(result + swift_unknownObjectWeakDestroy(v0 + 16) = v3;
  return result;
}

void type metadata accessor for AudioBuffer(uint64_t a1)
{
}

void type metadata accessor for SMPTETimeFlags(uint64_t a1)
{
}

void type metadata accessor for SMPTETimeType(uint64_t a1)
{
}

void sub_1000094E0(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, a3);
    if (!v5) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

AUAudioUnit __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> AudioUnitFactory.createAudioUnit(with:)( AudioComponentDescription with)
{
  uint64_t v3 = v1;
  UInt32 componentFlagsMask = with.componentFlagsMask;
  uint64_t v5 = *(void *)&with.componentManufacturer;
  uint64_t v6 = *(void *)&with.componentType;
  type metadata accessor for KonaSynthesizerAudioUnit(0LL);
  result.super.Class isa = (Class)sub_100003C2C(v6, v5, componentFlagsMask, 0LL);
  if (!v2)
  {
    uint64_t v8 = OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit;
    uint64_t v9 = *(void **)(v3 + OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit);
    *(AUAudioUnit *)(v3 + OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit) = result;

    uint64_t v10 = *(void **)(v3 + v8);
    if (v10) {
      return (AUAudioUnit)v10;
    }
    else {
      __break(1u);
    }
  }

  return result;
}

id AudioUnitFactory.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id AudioUnitFactory.init()()
{
  *(void *)&v0[OBJC_IVAR____TtC15KonaSynthesizer16AudioUnitFactory_audioUnit] = 0LL;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "init");
}

id AudioUnitFactory.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioUnitFactory();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AudioUnitFactory()
{
  return objc_opt_self(&OBJC_CLASS____TtC15KonaSynthesizer16AudioUnitFactory);
}