uint64_t sub_100061FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10[3];
  void v11[5];
  char v12;
  void v13[4];
  v13[3] = &type metadata for Int;
  v13[0] = 0LL;
  sub_10003D8D8((uint64_t)v13, (uint64_t)v11);
  v10[0] = a3;
  v10[1] = a4;
  v10[2] = a5;
  v11[4] = a1;
  v12 = 1;
  swift_bridgeObjectRetain(a4);
  swift_bridgeObjectRetain(a5);
  swift_bridgeObjectRetain(a1);
  sub_10007029C(v10);
  sub_10003D920(v10);
  return sub_10004E740((uint64_t)v13, &qword_1000B9360);
}

uint64_t sub_1000620AC(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a2 + 16);
  if (v5)
  {
    uint64_t v8 = result;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    uint64_t v9 = v5 - 1;
    for (uint64_t i = 32LL; ; i += 192LL)
    {
      __int128 v11 = *(_OWORD *)(a2 + i + 144);
      v18[8] = *(_OWORD *)(a2 + i + 128);
      v18[9] = v11;
      __int128 v12 = *(_OWORD *)(a2 + i + 176);
      v18[10] = *(_OWORD *)(a2 + i + 160);
      __int128 v19 = v12;
      __int128 v13 = *(_OWORD *)(a2 + i + 80);
      v18[4] = *(_OWORD *)(a2 + i + 64);
      v18[5] = v13;
      __int128 v14 = *(_OWORD *)(a2 + i + 112);
      v18[6] = *(_OWORD *)(a2 + i + 96);
      v18[7] = v14;
      __int128 v15 = *(_OWORD *)(a2 + i + 16);
      v18[0] = *(_OWORD *)(a2 + i);
      v18[1] = v15;
      __int128 v16 = *(_OWORD *)(a2 + i + 48);
      v18[2] = *(_OWORD *)(a2 + i + 32);
      v18[3] = v16;
      v17 = (void (*)(void *, uint64_t))v19;
      sub_10002D724((uint64_t)v18);
      v17(&_swiftEmptySetSingleton, v8);
      sub_10002D8A4((uint64_t)v18);
      if (v4 || !v9) {
        break;
      }
      --v9;
    }

    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(a2);
  }

  return result;
}

uint64_t sub_1000621A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int v7 = v45;
  if (v45 < 0)
  {
    v45 &= ~0x8000000000000000LL;
    if (!*(void *)(a3 + 16))
    {
LABEL_10:
      sub_100033E1C(v41);
      goto LABEL_11;
    }
  }

  else if (!*(void *)(a3 + 16))
  {
    goto LABEL_10;
  }

  uint64_t v9 = v43;
  uint64_t v8 = v44;
  sub_100030508(v43, v44, v7);
  unint64_t v10 = sub_100058B9C(v9, v8, v7);
  if ((v11 & 1) == 0)
  {
    sub_10002DA24(v9, v8, v7);
    goto LABEL_10;
  }

  unint64_t v12 = *(void *)(*(void *)(a3 + 56) + 8 * v10);
  uint64_t result = sub_10002DA24(v9, v8, v7);
  if ((v12 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (v12 < *(void *)(a2 + 16))
  {
    __int128 v15 = (_OWORD *)(a2 + 192 * v12);
    __int128 v16 = v15[11];
    __int128 v17 = v15[9];
    __int128 v37 = v15[10];
    __int128 v38 = v16;
    __int128 v18 = v15[11];
    __int128 v19 = v15[13];
    __int128 v39 = v15[12];
    __int128 v40 = v19;
    __int128 v20 = v15[7];
    __int128 v21 = v15[5];
    __int128 v33 = v15[6];
    __int128 v34 = v20;
    __int128 v22 = v15[7];
    __int128 v23 = v15[9];
    __int128 v35 = v15[8];
    __int128 v36 = v23;
    __int128 v24 = v15[3];
    v30[0] = v15[2];
    v30[1] = v24;
    __int128 v25 = v15[5];
    __int128 v27 = v15[2];
    __int128 v26 = v15[3];
    __int128 v31 = v15[4];
    __int128 v32 = v25;
    v41[8] = v37;
    v41[9] = v18;
    __int128 v28 = v15[13];
    v41[10] = v39;
    v41[11] = v28;
    v41[4] = v33;
    v41[5] = v22;
    v41[6] = v35;
    v41[7] = v17;
    v41[0] = v27;
    v41[1] = v26;
    v41[2] = v31;
    v41[3] = v21;
    v29 = v41;
    String.init(argument:)(*(Swift::String *)(&v14 - 1));
    sub_10002D724((uint64_t)v30);
LABEL_11:
    sub_10002AACC((uint64_t)v41, (uint64_t)v42, &qword_1000B9148);
    return sub_10002AACC((uint64_t)v42, a4, &qword_1000B9148);
  }

  __break(1u);
  return result;
}

void sub_100062330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5)
{
  uint64_t v16 = a2;
  sub_100066F84(a2, (uint64_t)v15);
  uint64_t v9 = sub_100005104(&qword_1000B96E8);
  uint64_t v10 = swift_allocObject(v9, 56LL, 7LL);
  v11._uint64_t countAndFlagsBits = sub_10007A75C(v10, 1LL);
  *(void *)v11._object = a3;
  *((void *)v11._object + 1) = a4;
  *((_BYTE *)v11._object + 16) = a5;
  *((_BYTE *)v11._object + 17) = HIBYTE(a5) & 1;
  uint64_t countAndFlagsBits = String.init(argument:)(v11).value._countAndFlagsBits;
  uint64_t v13 = sub_100088348(0LL);
  if (sub_100057AB0(v13))
  {
    Swift::Int v14 = sub_10008CA80(v13);
    swift_bridgeObjectRelease(v14);
  }

  swift_bridgeObjectRelease(v13);
  sub_10006D354(countAndFlagsBits);
  swift_bridgeObjectRelease(countAndFlagsBits);
  __asm { BR              X10 }

uint64_t sub_100062428()
{
  unint64_t v1 = sub_10002EA1C();
  uint64_t v2 = swift_allocError(&type metadata for ParserError, v1, 0LL, 0LL);
  *(void *)uint64_t v3 = 3LL;
  *(_OWORD *)(v3 + 8) = 0u;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(void *)(v3 + 72) = 0LL;
  *(_BYTE *)(v3 + 80) = 15;
  return swift_willThrow(v2);
}

uint64_t sub_100064278(uint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
  if (v11 < a2) {
    goto LABEL_212;
  }
  unint64_t v9 = a2;
  if (a2 < 0)
  {
LABEL_213:
    __break(1u);
LABEL_214:
    __break(1u);
    goto LABEL_215;
  }

  Swift::UInt v6 = isUniquelyReferenced_nonNull_native;
  uint64_t v177 = v5;
  uint64_t v12 = *(void *)(v4 + 16);
  uint64_t v13 = *(void *)(v12 + 16);
  uint64_t v167 = v4;
  if (!v13) {
    goto LABEL_17;
  }
  __int128 v14 = *(_OWORD *)(v12 + 176);
  __int128 v200 = *(_OWORD *)(v12 + 160);
  __int128 v201 = v14;
  __int128 v15 = *(_OWORD *)(v12 + 208);
  __int128 v202 = *(_OWORD *)(v12 + 192);
  __int128 v203 = v15;
  __int128 v16 = *(_OWORD *)(v12 + 112);
  __int128 v196 = *(_OWORD *)(v12 + 96);
  __int128 v197 = v16;
  __int128 v17 = *(_OWORD *)(v12 + 144);
  __int128 v198 = *(_OWORD *)(v12 + 128);
  __int128 v199 = v17;
  __int128 v18 = *(_OWORD *)(v12 + 48);
  __int128 v192 = *(_OWORD *)(v12 + 32);
  __int128 v193 = v18;
  __int128 v19 = *(_OWORD *)(v12 + 80);
  __int128 v194 = *(_OWORD *)(v12 + 64);
  __int128 v195 = v19;
  for (uint64_t i = (__int128 *)(v12 + 224); ; i += 12)
  {
    --v13;
    if (!(void)v192 && (BYTE8(v192) & 2) != 0 && BYTE1(v201) == 5) {
      break;
    }
    if (!v13) {
      goto LABEL_17;
    }
    __int128 v21 = *i;
    __int128 v22 = i[1];
    __int128 v23 = i[3];
    __int128 v194 = i[2];
    __int128 v195 = v23;
    __int128 v192 = v21;
    __int128 v193 = v22;
    __int128 v24 = i[4];
    __int128 v25 = i[5];
    __int128 v26 = i[7];
    __int128 v198 = i[6];
    __int128 v199 = v26;
    __int128 v196 = v24;
    __int128 v197 = v25;
    __int128 v27 = i[8];
    __int128 v28 = i[9];
    __int128 v29 = i[11];
    __int128 v202 = i[10];
    __int128 v203 = v29;
    __int128 v200 = v27;
    __int128 v201 = v28;
  }

  if (BYTE8(v202) == 1)
  {
    unint64_t v8 = *((void *)&v201 + 1);
    unint64_t v7 = v202;
    uint64_t v161 = isUniquelyReferenced_nonNull_native + 32;
    uint64_t v30 = sub_100066CC0(isUniquelyReferenced_nonNull_native + 32, a2, (2 * v11) | 1);
    uint64_t v4 = v31;
    sub_10002D724((uint64_t)&v192);
    isUniquelyReferenced_nonNull_native = sub_10002D860(v8, v7);
    if ((v4 & 1) != 0)
    {
      sub_10002D9E0(v8, v7);
      isUniquelyReferenced_nonNull_native = sub_10002D8A4((uint64_t)&v192);
      uint64_t v30 = v11;
      goto LABEL_154;
    }

    uint64_t v32 = v30 + 1;
    if (__OFADD__(v30, 1LL)) {
      goto LABEL_222;
    }
    if (v11 < v32) {
      goto LABEL_223;
    }
    if (v32 == v11)
    {
      uint64_t v33 = v8;
      uint64_t v34 = v7;
      goto LABEL_153;
    }

    Swift::UInt v173 = v6;
    isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain(v6);
    unint64_t v157 = v8;
    unint64_t v159 = v7;
    Swift::UInt v6 = v30 + 1;
    do
    {
      Swift::UInt v180 = v6;
      Swift::UInt v107 = v161 + (v6 << 6);
      unint64_t v108 = *(void *)(v107 + 16);
      if ((v108 & 0x6000000000000000LL) != 0x2000000000000000LL) {
        goto LABEL_228;
      }
      uint64_t v109 = *(void *)(v107 + 8);
      unint64_t v183 = *(void *)v107;
      Swift::UInt v6 = *(void *)(v107 + 40);
      uint64_t v164 = *(void *)(v107 + 24);
      uint64_t v166 = *(void *)(v107 + 32);
      Swift::UInt v110 = *(void *)(v107 + 48);
      int v111 = *(unsigned __int8 *)(v107 + 56);
      unint64_t v112 = sub_100067054();
      uint64_t v170 = v109;
      swift_bridgeObjectRetain(v109);
      unint64_t v7 = Set.init(minimumCapacity:)(1LL, &type metadata for InputOrigin.Element, v112);
      Hasher.init(_seed:)(v186, *(void *)(v7 + 40));
      Hasher._combine(_:)(1uLL);
      Hasher._combine(_:)(v6);
      LODWORD(v210) = v111;
      unint64_t v169 = v108;
      if (v111)
      {
        uint64_t v113 = v110;
        Swift::UInt v114 = 0LL;
      }

      else
      {
        Hasher._combine(_:)(1uLL);
        uint64_t v113 = v110;
        Swift::UInt v114 = v110;
      }

      Hasher._combine(_:)(v114);
      Swift::Int v115 = Hasher._finalize()();
      uint64_t v116 = -1LL << *(_BYTE *)(v7 + 32);
      unint64_t v8 = v115 & ~v116;
      int v117 = v210;
      if (((*(void *)(v7 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0)
      {
        uint64_t v118 = ~v116;
        unint64_t v119 = v183;
        uint64_t v4 = v113;
        unint64_t v10 = 24LL;
        while (1)
        {
          uint64_t v120 = *(void *)(v7 + 48) + 24 * v8;
          if ((*(_BYTE *)(v120 + 17) & 1) == 0 && *(void *)v120 == v6)
          {
            if ((*(_BYTE *)(v120 + 16) & 1) != 0)
            {
              if ((v210 & 1) != 0) {
                goto LABEL_127;
              }
            }

            else if ((v210 & 1) == 0 && *(void *)(v120 + 8) == v4)
            {
LABEL_127:
              unint64_t v10 = v157;
              uint64_t v4 = v159;
              Swift::UInt v121 = v180;
              goto LABEL_150;
            }
          }

          unint64_t v8 = (v8 + 1) & v118;
          if (((*(void *)(v7 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0) {
            goto LABEL_129;
          }
        }
      }

      uint64_t v4 = v113;
      unint64_t v10 = 24LL;
LABEL_129:
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
      unint64_t v188 = v7;
      unint64_t v122 = *(void *)(v7 + 16);
      if (*(void *)(v7 + 24) <= v122)
      {
        uint64_t v123 = v122 + 1;
        if ((_DWORD)isUniquelyReferenced_nonNull_native) {
          sub_100059EC8(v123);
        }
        else {
          sub_10005B338(v123);
        }
        unint64_t v7 = v188;
        Hasher.init(_seed:)(v186, *(void *)(v188 + 40));
        Hasher._combine(_:)(1uLL);
        Hasher._combine(_:)(v6);
        if (v117)
        {
          Swift::UInt v124 = 0LL;
        }

        else
        {
          Hasher._combine(_:)(1uLL);
          Swift::UInt v124 = v4;
        }

        Hasher._combine(_:)(v124);
        isUniquelyReferenced_nonNull_native = Hasher._finalize()();
        uint64_t v125 = -1LL << *(_BYTE *)(v7 + 32);
        unint64_t v8 = isUniquelyReferenced_nonNull_native & ~v125;
        if (((*(void *)(v7 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0)
        {
          uint64_t v126 = ~v125;
          do
          {
            uint64_t v127 = *(void *)(v7 + 48) + 24 * v8;
            if ((*(_BYTE *)(v127 + 17) & 1) == 0 && *(void *)v127 == v6)
            {
              if ((*(_BYTE *)(v127 + 16) & 1) != 0)
              {
                if ((v117 & 1) != 0) {
                  goto LABEL_229;
                }
              }

              else if ((v117 & 1) == 0 && *(void *)(v127 + 8) == v4)
              {
                goto LABEL_229;
              }
            }

            unint64_t v8 = (v8 + 1) & v126;
          }

          while (((*(void *)(v7 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) != 0);
        }
      }

      else if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_10005ACA8();
        LOBYTE(v117) = v210;
        unint64_t v7 = v188;
      }

      *(void *)(v7 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8LL) + 56) |= 1LL << v8;
      uint64_t v128 = *(void *)(v7 + 48) + 24 * v8;
      *(void *)uint64_t v128 = v6;
      *(void *)(v128 + 8) = v4;
      *(_BYTE *)(v128 + 16) = v117;
      *(_BYTE *)(v128 + 17) = 0;
      uint64_t v129 = *(void *)(v7 + 16);
      BOOL v84 = __OFADD__(v129, 1LL);
      uint64_t v130 = v129 + 1;
      if (v84) {
        goto LABEL_220;
      }
      *(void *)(v7 + 16) = v130;
      swift_bridgeObjectRelease(0x8000000000000000LL);
      unint64_t v10 = v157;
      uint64_t v4 = v159;
      Swift::UInt v121 = v180;
      unint64_t v119 = v183;
LABEL_150:
      unint64_t v8 = v119;
      ((void (*)(unint64_t, void, void, uint64_t, unint64_t, uint64_t, void *))v10)( v7,  0LL,  0LL,  254LL,  v119,  v170,  a4);
      if (v177)
      {
        swift_bridgeObjectRelease(v173);
        sub_10002D9E0(v10, v4);
        swift_bridgeObjectRelease(v7);
        sub_100066ED8(v8, v170, v169, v164, v166);
        return sub_10002D8A4((uint64_t)&v192);
      }

      Swift::UInt v6 = v121 + 1;
      swift_bridgeObjectRelease(v7);
      isUniquelyReferenced_nonNull_native = sub_100066ED8(v8, v170, v169, v164, v166);
    }

    while (v6 != v11);
    Swift::UInt v6 = v173;
    swift_bridgeObjectRelease(v173);
    uint64_t v33 = v10;
    uint64_t v34 = v4;
LABEL_153:
    sub_10002D9E0(v33, v34);
    isUniquelyReferenced_nonNull_native = sub_10002D8A4((uint64_t)&v192);
LABEL_154:
    uint64_t v4 = v167;
    if (v30 < (uint64_t)v9)
    {
LABEL_155:
      __break(1u);
      goto LABEL_156;
    }
  }

  else
  {
LABEL_17:
    uint64_t v30 = v11;
    if (v11 < a2) {
      goto LABEL_155;
    }
  }

  if (v11 < v30) {
    goto LABEL_214;
  }
  uint64_t v11 = (uint64_t)_swiftEmptyArrayStorage;
  unint64_t v8 = v30 - v9;
  if (v30 == v9) {
    goto LABEL_30;
  }
  if (v30 <= (uint64_t)v9)
  {
LABEL_215:
    __break(1u);
LABEL_216:
    __break(1u);
    while (1)
    {
      __break(1u);
LABEL_218:
      __break(1u);
LABEL_219:
      __break(1u);
LABEL_220:
      __break(1u);
LABEL_221:
      __break(1u);
LABEL_222:
      __break(1u);
LABEL_223:
      __break(1u);
LABEL_224:
      __break(1u);
LABEL_225:
      __break(1u);
LABEL_226:
      swift_unknownObjectRelease(isUniquelyReferenced_nonNull_native);
LABEL_110:
      sub_10004FB38(v8, v11, v6, v10);
      uint64_t v11 = v106;
LABEL_162:
      swift_unknownObjectRelease(v8);
      swift_bridgeObjectRelease(a4[2]);
      isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease(a4[4]);
      a4[2] = v11;
      a4[3] = 0LL;
      a4[4] = _swiftEmptyArrayStorage;
      int64_t v135 = v190;
      int64_t v136 = v191 >> 1;
      if (v190 == v191 >> 1) {
        break;
      }
      unint64_t v8 = 24LL;
      unint64_t v174 = v7;
      while (v135 < v136)
      {
        v137 = (void (*)(uint64_t, void, void, uint64_t, uint64_t, uint64_t, void *))v9;
        uint64_t v138 = v189 + (v135 << 6);
        unint64_t v7 = *(void *)(v138 + 40);
        unint64_t v9 = *(void *)(v138 + 48);
        int v139 = *(unsigned __int8 *)(v138 + 56);
        Swift::UInt v190 = v135 + 1;
        if ((v7 & 0x8000000000000000LL) != 0) {
          goto LABEL_218;
        }
        unint64_t v171 = v188;
        if (v7 >= *(void *)(a3 + 16)) {
          goto LABEL_219;
        }
        Swift::UInt v6 = v4;
        v140 = (uint64_t *)(a3 + 32 + 16 * v7);
        uint64_t v141 = v140[1];
        uint64_t v210 = *v140;
        unint64_t v142 = sub_100067054();
        swift_bridgeObjectRetain(v141);
        uint64_t v11 = Set.init(minimumCapacity:)(1LL, &type metadata for InputOrigin.Element, v142);
        Hasher.init(_seed:)(v186, *(void *)(v11 + 40));
        Hasher._combine(_:)(1uLL);
        Hasher._combine(_:)(v7);
        uint64_t v184 = v141;
        if (v139)
        {
          Swift::UInt v143 = 0LL;
        }

        else
        {
          Hasher._combine(_:)(1uLL);
          Swift::UInt v143 = v9;
        }

        Hasher._combine(_:)(v143);
        uint64_t v4 = (uint64_t)v186;
        Swift::Int v144 = Hasher._finalize()();
        uint64_t v145 = -1LL << *(_BYTE *)(v11 + 32);
        unint64_t v10 = v144 & ~v145;
        if (((*(void *)(v11 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
        {
          uint64_t v146 = ~v145;
          do
          {
            uint64_t v147 = *(void *)(v11 + 48) + 24 * v10;
            if ((*(_BYTE *)(v147 + 17) & 1) == 0 && *(void *)v147 == v7)
            {
              if ((*(_BYTE *)(v147 + 16) & 1) != 0)
              {
                if ((v139 & 1) != 0) {
                  goto LABEL_201;
                }
              }

              else if ((v139 & 1) == 0 && *(void *)(v147 + 8) == v9)
              {
                goto LABEL_201;
              }
            }

            unint64_t v10 = (v10 + 1) & v146;
          }

          while (((*(void *)(v11 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
        }

        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v11);
        uint64_t v185 = v11;
        unint64_t v148 = *(void *)(v11 + 16);
        if (*(void *)(v11 + 24) <= v148)
        {
          uint64_t v149 = v148 + 1;
          if ((_DWORD)isUniquelyReferenced_nonNull_native) {
            sub_100059EC8(v149);
          }
          else {
            sub_10005B338(v149);
          }
          uint64_t v11 = v185;
          Hasher.init(_seed:)(v186, *(void *)(v185 + 40));
          Hasher._combine(_:)(1uLL);
          Hasher._combine(_:)(v7);
          if (v139)
          {
            Swift::UInt v150 = 0LL;
          }

          else
          {
            Hasher._combine(_:)(1uLL);
            Swift::UInt v150 = v9;
          }

          Hasher._combine(_:)(v150);
          uint64_t v4 = (uint64_t)v186;
          isUniquelyReferenced_nonNull_native = Hasher._finalize()();
          uint64_t v151 = -1LL << *(_BYTE *)(v11 + 32);
          unint64_t v10 = isUniquelyReferenced_nonNull_native & ~v151;
          if (((*(void *)(v11 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0)
          {
            uint64_t v152 = ~v151;
            do
            {
              uint64_t v153 = *(void *)(v11 + 48) + 24 * v10;
              if ((*(_BYTE *)(v153 + 17) & 1) == 0 && *(void *)v153 == v7)
              {
                if ((*(_BYTE *)(v153 + 16) & 1) != 0)
                {
                  if ((v139 & 1) != 0) {
                    goto LABEL_229;
                  }
                }

                else if ((v139 & 1) == 0 && *(void *)(v153 + 8) == v9)
                {
                  goto LABEL_229;
                }
              }

              unint64_t v10 = (v10 + 1) & v152;
            }

            while (((*(void *)(v11 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) != 0);
          }
        }

        else if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t v4 = (uint64_t)&v185;
          isUniquelyReferenced_nonNull_native = (uint64_t)sub_10005ACA8();
          uint64_t v11 = v185;
        }

        *(void *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8LL) + 56) |= 1LL << v10;
        uint64_t v154 = *(void *)(v11 + 48) + 24 * v10;
        *(void *)uint64_t v154 = v7;
        *(void *)(v154 + 8) = v9;
        *(_BYTE *)(v154 + 16) = v139;
        *(_BYTE *)(v154 + 17) = 0;
        uint64_t v155 = *(void *)(v11 + 16);
        BOOL v84 = __OFADD__(v155, 1LL);
        uint64_t v156 = v155 + 1;
        if (v84) {
          goto LABEL_221;
        }
        *(void *)(v11 + 16) = v156;
        swift_bridgeObjectRelease(0x8000000000000000LL);
LABEL_201:
        unint64_t v7 = v174;
        uint64_t v4 = v6;
        unint64_t v9 = (unint64_t)v137;
        v137(v11, 0LL, 0LL, 254LL, v210, v184, a4);
        if (v177)
        {
          swift_bridgeObjectRelease(v184);
          swift_bridgeObjectRelease(v11);
          sub_10002D9E0((uint64_t)v137, v6);
          sub_10002D8A4((uint64_t)&v192);
          swift_unknownObjectRelease(v171);
          return swift_bridgeObjectRelease(v174);
        }

        swift_bridgeObjectRelease(v184);
        isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease(v11);
        int64_t v135 = v190;
        int64_t v136 = v191 >> 1;
        if (v190 == v191 >> 1) {
          goto LABEL_203;
        }
      }
    }

LABEL_203:
    sub_10002D9E0(v9, v4);
    sub_10002D8A4((uint64_t)&v192);
LABEL_204:
    unint64_t v87 = v7;
LABEL_205:
    swift_bridgeObjectRelease(v87);
    return swift_unknownObjectRelease(v188);
  }

  swift_bridgeObjectRetain(v6);
  Swift::UInt v172 = v6;
  unint64_t v10 = v6 + (v9 << 6) + 48;
  do
  {
    if (*(_BYTE *)(v10 + 40) == 1)
    {
      Swift::UInt v6 = *(void *)(v10 - 8);
      unint64_t v38 = *(void *)v10;
      unint64_t v9 = *(void *)(v10 + 8);
      uint64_t v178 = *(void *)(v10 + 32);
      __int128 v181 = *(_OWORD *)(v10 + 16);
      uint64_t v39 = *(void *)(v10 + 16);
      uint64_t v210 = *(void *)(v10 - 16);
      sub_10005BDF8(v210, v6, v38, v9, v39);
      char v40 = swift_isUniquelyReferenced_nonNull_native(v11);
      *(void *)&__int128 v192 = v11;
      if ((v40 & 1) == 0)
      {
        sub_10004FE80(0LL, *(void *)(v11 + 16) + 1LL, 1);
        uint64_t v11 = v192;
      }

      unint64_t v36 = *(void *)(v11 + 16);
      unint64_t v35 = *(void *)(v11 + 24);
      if (v36 >= v35 >> 1)
      {
        sub_10004FE80((char *)(v35 > 1), v36 + 1, 1);
        uint64_t v11 = v192;
      }

      *(void *)(v11 + 16) = v36 + 1;
      uint64_t v37 = v11 + (v36 << 6);
      *(void *)(v37 + 32) = v210;
      *(void *)(v37 + 40) = v6;
      *(void *)(v37 + 48) = v38;
      *(void *)(v37 + 56) = v9;
      *(_OWORD *)(v37 + 64) = v181;
      *(void *)(v37 + 80) = v178;
      *(_BYTE *)(v37 + 88) = 1;
    }

    v10 += 64LL;
    --v8;
  }

  while (v8);
  swift_bridgeObjectRelease(v172);
  uint64_t v4 = v167;
LABEL_30:
  uint64_t v41 = *(void *)(v11 + 16);
  unint64_t v188 = v11;
  uint64_t v189 = v11 + 32;
  Swift::UInt v190 = 0LL;
  unint64_t v191 = (2 * v41) | 1;
  if (!v41) {
    return swift_release(v11);
  }
  unint64_t v42 = *(void *)(v4 + 16);
  if (!*(void *)(v42 + 16))
  {
    unint64_t v7 = (unint64_t)&_swiftEmptySetSingleton;
    goto LABEL_100;
  }

  uint64_t v43 = *(void *)(v4 + 24);
  uint64_t v4 = v42 + 32;
  uint64_t v163 = *(void *)(v42 + 16);
  unint64_t v165 = v42;
  swift_bridgeObjectRetain(v42);
  uint64_t v162 = v43;
  isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain(v43);
  uint64_t v44 = v4;
  uint64_t v45 = v163;
  unint64_t v46 = v165;
  Swift::UInt v47 = 0LL;
  unint64_t v7 = (unint64_t)&_swiftEmptySetSingleton;
  uint64_t v11 = 24LL;
  uint64_t v158 = v4;
  while (1)
  {
    v48 = (__int128 *)(v44 + 192 * v47);
    __int128 v49 = *v48;
    __int128 v50 = v48[1];
    __int128 v51 = v48[3];
    __int128 v194 = v48[2];
    __int128 v195 = v51;
    __int128 v192 = v49;
    __int128 v193 = v50;
    __int128 v52 = v48[4];
    __int128 v53 = v48[5];
    __int128 v54 = v48[7];
    __int128 v198 = v48[6];
    __int128 v199 = v54;
    __int128 v196 = v52;
    __int128 v197 = v53;
    __int128 v55 = v48[8];
    __int128 v56 = v48[9];
    __int128 v57 = v48[11];
    __int128 v202 = v48[10];
    __int128 v203 = v57;
    __int128 v200 = v55;
    __int128 v201 = v56;
    if (!(void)v192)
    {
      int v179 = BYTE1(v201);
      if ((BYTE1(v201) | 4) == 4) {
        break;
      }
    }

LABEL_156:
        swift_unknownObjectRetain_n(v8, 2LL);
        sub_10002D724((uint64_t)&v192);
        sub_10002D860(v9, v4);
        uint64_t v131 = type metadata accessor for __ContiguousArrayStorageBase(0LL);
        uint64_t v132 = swift_unknownObjectRetain(v8);
        v133 = (void *)swift_dynamicCastClass(v132, v131);
        if (!v133)
        {
          swift_unknownObjectRelease(v8);
          v133 = _swiftEmptyArrayStorage;
        }

        uint64_t v134 = v133[2];
        isUniquelyReferenced_nonNull_native = swift_release(v133);
        if (__OFSUB__(v10 >> 1, v6)) {
          goto LABEL_225;
        }
        isUniquelyReferenced_nonNull_native = v8;
        if (v134 != (v10 >> 1) - v6) {
          goto LABEL_226;
        }
        uint64_t v11 = swift_dynamicCastClass(v8, v131);
        if (!v11)
        {
          swift_unknownObjectRelease(v8);
          uint64_t v11 = (uint64_t)_swiftEmptyArrayStorage;
        }

        goto LABEL_162;
      }
    }

    goto LABEL_204;
  }

  __break(1u);
LABEL_228:
  __break(1u);
LABEL_229:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for InputOrigin.Element);
  __break(1u);
  return result;
}

uint64_t sub_100065564@<X0>(char a1@<W0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result = swift_beginAccess(a2, v21, 1LL, 0LL);
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3] >> 1;
  if (v7 <= v8) {
    uint64_t v9 = a2[3] >> 1;
  }
  else {
    uint64_t v9 = a2[2];
  }
  uint64_t v10 = (v7 << 6) | 0x38;
  while (1)
  {
    if (v8 == v7)
    {
      uint64_t v12 = 0LL;
      uint64_t v13 = 0LL;
      uint64_t v14 = 0LL;
      uint64_t v17 = 0LL;
      char v18 = 0;
      __int128 v19 = 0uLL;
      unint64_t v15 = 0x7FFFFFF3ELL;
      goto LABEL_11;
    }

    if (v9 == v7) {
      break;
    }
    uint64_t v11 = (_BYTE *)(a2[1] + v10);
    uint64_t v12 = *((void *)v11 - 7);
    uint64_t v13 = *((void *)v11 - 6);
    unint64_t v15 = *((void *)v11 - 5);
    uint64_t v14 = *((void *)v11 - 4);
    __int128 v16 = *(_OWORD *)(v11 - 24);
    uint64_t v17 = *((void *)v11 - 1);
    char v18 = *v11;
    a2[2] = ++v7;
    if ((v15 & 0x6000000000000000LL) != 0x2000000000000000LL)
    {
      v10 += 64LL;
      if ((a1 & 1) == 0) {
        continue;
      }
    }

    __int128 v20 = v16;
    uint64_t result = sub_10005BDF8(v12, v13, v15, v14, v16);
    __int128 v19 = v20;
LABEL_11:
    *(void *)a3 = v12;
    *(void *)(a3 + 8) = v13;
    *(void *)(a3 + 16) = v15;
    *(void *)(a3 + 24) = v14;
    *(_OWORD *)(a3 + 32) = v19;
    *(void *)(a3 + 48) = v17;
    *(_BYTE *)(a3 + 56) = v18;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t sub_100065684@<X0>(uint64_t a1@<X8>)
{
  void (*v41)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  unint64_t v61;
  _OWORD *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t, uint64_t, uint64_t, unint64_t, __int128 *);
  uint64_t v87;
  uint64_t inited;
  uint64_t v89;
  Swift::UInt v90;
  Swift::Int v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  Swift::UInt v96;
  Swift::Int v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v103;
  Swift::UInt v104;
  uint64_t v105;
  Swift::UInt v106;
  Swift::Int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  BOOL v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v137;
  uint64_t v138;
  Swift::UInt v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t *v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  __int128 v146;
  uint64_t v147;
  __int128 v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char v152[64];
  void *v153;
  void *v154;
  __int128 v155;
  __int128 v156;
  void *v157;
  void v158[13];
  uint64_t v159;
  uint64_t v160;
  _OWORD v161[9];
  _OWORD v162[3];
  void v163[5];
  __n128 v164;
  __n128 v165;
  char v166;
  uint64_t v167;
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[6];
  v140 = v1[5];
  uint64_t v7 = *v1;
  uint64_t v8 = v4[1];
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  if ((sub_10004F6A0(v7, v8) & 1) != 0)
  {
    int v9 = 1;
  }

  else
  {
    uint64_t v10 = v4[2];
    uint64_t v11 = *(void *)(v10 + 16);
    if (v11)
    {
      uint64_t v12 = v11 - 1;
      uint64_t v13 = (_BYTE *)(v10 + 177);
      do
      {
        uint64_t v14 = v12;
        int v9 = (*(void *)(v13 - 145) == 0LL) & (*(v13 - 137) >> 1);
        if (*v13 != 4) {
          int v9 = 0;
        }
        if ((v9 & 1) != 0) {
          break;
        }
        --v12;
        v13 += 192;
      }

      while (v14);
    }

    else
    {
      int v9 = 0;
    }
  }

  Swift::UInt v143 = v9;
  *(void *)&uint64_t v155 = sub_1000796D0((uint64_t)_swiftEmptyArrayStorage);
  *((void *)&v155 + 1) = v6;
  *(void *)&uint64_t v156 = _swiftEmptyArrayStorage;
  *((void *)&v156 + 1) = 0LL;
  unint64_t v157 = _swiftEmptyArrayStorage;
  uint64_t v154 = &_swiftEmptySetSingleton;
  uint64_t v16 = v4[2];
  uint64_t v15 = v4[3];
  swift_bridgeObjectRetain(v6);
  sub_1000620AC((uint64_t)&v155, v16, v15);
  uint64_t v17 = v3;
  if (v3)
  {
    swift_bridgeObjectRelease(v155);
    swift_bridgeObjectRelease(*((void *)&v155 + 1));
    swift_bridgeObjectRelease(v156);
    char v18 = v157;
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v5);
    uint64_t result = swift_bridgeObjectRelease(v18);
    v4[4] = v5;
    v4[5] = v140;
    v4[6] = v6;
    return result;
  }

  int64_t v135 = v6;
  uint64_t v20 = *(void *)(v5 + 16);
  if (v20 < v140) {
    goto LABEL_118;
  }
  if ((v140 & 0x8000000000000000LL) == 0)
  {
    if (v140 == v20)
    {
LABEL_16:
      uint64_t v149 = v5;
      Swift::UInt v150 = v140;
      uint64_t v151 = v135;
      __int128 v21 = v154;
      swift_bridgeObjectRetain(v5);
      swift_bridgeObjectRetain(v135);
      uint64_t v22 = swift_bridgeObjectRetain(v21);
      sub_100069D4C(v22);
      swift_bridgeObjectRelease_n(v21, 2LL);
      uint64_t v23 = v149;
      __int128 v24 = v4;
      uint64_t v25 = v151;
      sub_100064278(v149, v150, v151, &v155);
      swift_bridgeObjectRelease(v25);
      swift_bridgeObjectRelease(v23);
      Swift::Int v115 = v157;
      uint64_t v146 = v155;
      unint64_t v148 = v156;
      uint64_t v116 = v24[4];
      int v117 = v24[6];
      v24[4] = v5;
      v24[5] = v140;
      v24[6] = v135;
      uint64_t v118 = swift_bridgeObjectRetain(v5);
      swift_bridgeObjectRelease(v118);
      swift_bridgeObjectRelease(v117);
      uint64_t result = swift_bridgeObjectRelease(v116);
      *(_OWORD *)a1 = v146;
      *(_OWORD *)(a1 + 16) = v148;
      *(void *)(a1 + 32) = v115;
      return result;
    }

    uint64_t v26 = v140;
    uint64_t v27 = v5;
    uint64_t v141 = v5;
    unint64_t v142 = v4;
    __int128 v28 = &_swiftEmptySetSingleton;
    while (1)
    {
      if (v26 >= (unint64_t)v20)
      {
        __break(1u);
LABEL_116:
        __break(1u);
LABEL_117:
        __break(1u);
LABEL_118:
        __break(1u);
        goto LABEL_119;
      }

      uint64_t v147 = v17;
      uint64_t v29 = v27 + (v26 << 6);
      uint64_t v31 = *(void *)(v29 + 32);
      uint64_t v30 = *(void *)(v29 + 40);
      unint64_t v33 = *(void *)(v29 + 48);
      uint64_t v32 = *(void *)(v29 + 56);
      uint64_t v34 = *(void *)(v29 + 64);
      Swift::UInt v35 = *(void *)(v29 + 72);
      Swift::UInt v36 = *(void *)(v29 + 80);
      uint64_t v37 = *(unsigned __int8 *)(v29 + 88);
      v4[5] = v26 + 1;
      uint64_t v153 = &_swiftEmptySetSingleton;
      uint64_t v38 = (v33 >> 61) & 3;
      if ((_DWORD)v38) {
        break;
      }
      int v139 = v36;
      v163[0] = v31;
      v163[1] = v30;
      v163[2] = v33;
      v163[3] = v32;
      v163[4] = v34;
      __int128 v55 = v4;
      __int128 v56 = v4[2];
      __int128 v57 = v55[3];
      uint64_t v58 = *(void *)(v57 + 16);
      uint64_t v145 = v32;
      uint64_t v167 = v34;
      sub_10005BDF8(v31, v30, v33, v32, v34);
      if (v58)
      {
        sub_100030508(v31, v30, v33);
        char v59 = sub_100058B9C(v31, v30, v33);
        if ((v60 & 1) != 0)
        {
          uint64_t v61 = *(void *)(*(void *)(v57 + 56) + 8 * v59);
          sub_10002DA24(v31, v30, v33);
          if ((v61 & 0x8000000000000000LL) != 0) {
            goto LABEL_120;
          }
          if (v61 >= *(void *)(v56 + 16)) {
            goto LABEL_121;
          }
          uint64_t v62 = (_OWORD *)(v56 + 192 * v61);
          uint64_t v63 = v62[2];
          Swift::UInt v64 = v62[3];
          Swift::UInt v65 = v62[5];
          v161[2] = v62[4];
          v161[3] = v65;
          v161[0] = v63;
          v161[1] = v64;
          Swift::Int v66 = v62[6];
          uint64_t v67 = v62[7];
          unint64_t v68 = v62[9];
          v161[6] = v62[8];
          v161[7] = v68;
          v161[4] = v66;
          v161[5] = v67;
          uint64_t v69 = v62[10];
          uint64_t v70 = v62[11];
          Swift::UInt v71 = v62[13];
          v162[1] = v62[12];
          v162[2] = v71;
          v161[8] = v69;
          v162[0] = v70;
          sub_10002D868((__n128 *)((char *)v162 + 8), &v164);
          sub_10002D868(&v164, &v165);
          if ((v166 & 1) != 0)
          {
            sub_10002D724((uint64_t)v161);
            sub_100066F24((uint64_t *)&v164);
            uint64_t v4 = v142;
            sub_100062330((uint64_t)v161, (uint64_t)v163, v35, v139, v37);
            sub_100066ED8(v31, v30, v33, v145, v167);
            sub_10002D8A4((uint64_t)v161);
            sub_100066F54((uint64_t *)&v164);
            __int128 v28 = v153;
            __int128 v54 = 0LL;
            uint64_t v5 = v141;
            goto LABEL_50;
          }

          if ((v33 & 0x8000000000000000LL) != 0)
          {
            sub_10002D724((uint64_t)v161);
            sub_100066F24((uint64_t *)&v164);
            sub_100030508(v31, v30, v33);
            uint64_t v125 = v167;
            swift_bridgeObjectRetain(v167);
            sub_100066ED8(v31, v30, v33, v145, v125);
            swift_bridgeObjectRelease(v155);
            swift_bridgeObjectRelease(*((void *)&v155 + 1));
            swift_bridgeObjectRelease(v156);
            swift_bridgeObjectRelease(v157);
            uint64_t v126 = sub_10002EA1C();
            uint64_t v127 = swift_allocError(&type metadata for ParserError, v126, 0LL, 0LL);
            *(void *)uint64_t v128 = v35;
            *(void *)(v128 + 8) = v139;
            *(void *)(v128 + 16) = v37;
            *(void *)(v128 + 24) = v31;
            *(void *)(v128 + 32) = v30;
            *(void *)(v128 + 40) = v33;
            *(void *)(v128 + 48) = v145;
            *(void *)(v128 + 56) = v125;
            *(void *)(v128 + 64) = 0LL;
            *(void *)(v128 + 72) = 0LL;
            *(_BYTE *)(v128 + 80) = 8;
            swift_willThrow(v127);
            sub_100066F54((uint64_t *)&v164);
            sub_10002D8A4((uint64_t)v161);
            uint64_t v129 = v153;
            uint64_t v130 = swift_bridgeObjectRetain(v153);
            sub_100069D4C(v130);
            swift_bridgeObjectRelease(v129);
            uint64_t v131 = swift_bridgeObjectRetain(v129);
            sub_10005750C(v131);
            swift_bridgeObjectRelease(v129);
            swift_bridgeObjectRelease(v154);
            uint64_t v132 = v142[4];
            v133 = v142[6];
            v142[4] = v141;
            v142[5] = v140;
            v142[6] = v135;
            uint64_t v134 = swift_bridgeObjectRetain(v141);
            swift_bridgeObjectRelease(v134);
            swift_bridgeObjectRelease(v133);
            return swift_bridgeObjectRelease(v132);
          }

          v86 = (void (*)(uint64_t, uint64_t, uint64_t, unint64_t, __int128 *))v165.n128_u64[0];
          unint64_t v87 = sub_100005104(&qword_1000B96E8);
          inited = swift_initStackObject(v87, v152);
          *(_OWORD *)(inited + 16) = xmmword_100096510;
          *(void *)(inited + 32) = v35;
          *(void *)(inited + 40) = v139;
          *(_BYTE *)(inited + 48) = v37;
          *(_BYTE *)(inited + 49) = 0;
          sub_10002D724((uint64_t)v161);
          sub_100066F24((uint64_t *)&v164);
          uint64_t v89 = sub_10006D354(inited);
          swift_setDeallocating(inited);
          v86(v89, v31, v30, v33, &v155);
          sub_100066ED8(v31, v30, v33, v145, v167);
          swift_bridgeObjectRelease(v89);
          uint64_t v5 = v141;
          uint64_t v4 = v142;
          __int128 v54 = 0LL;
          __int128 v28 = &_swiftEmptySetSingleton;
          if (*((void *)&_swiftEmptySetSingleton + 2))
          {
            Hasher.init(_seed:)(&v149, *((void *)&_swiftEmptySetSingleton + 5));
            Hasher._combine(_:)(1uLL);
            Hasher._combine(_:)(v35);
            if ((_DWORD)v37)
            {
              __int128 v90 = 0LL;
            }

            else
            {
              Hasher._combine(_:)(1uLL);
              __int128 v90 = v139;
            }

            Hasher._combine(_:)(v90);
            __int128 v91 = Hasher._finalize()();
            __int128 v92 = -1LL << *((_BYTE *)&_swiftEmptySetSingleton + 32);
            __int128 v93 = v91 & ~v92;
            if (((*(void *)((char *)&_swiftEmptySetSingleton + ((v93 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> v93) & 1) != 0)
            {
              __int128 v94 = ~v92;
              do
              {
                __int128 v95 = *((void *)&_swiftEmptySetSingleton + 6) + 24 * v93;
                if ((*(_BYTE *)(v95 + 17) & 1) == 0 && *(void *)v95 == v35)
                {
                  if ((*(_BYTE *)(v95 + 16) & 1) != 0)
                  {
                    if ((v37 & 1) != 0) {
                      goto LABEL_74;
                    }
                  }

                  else if ((v37 & 1) == 0 && *(void *)(v95 + 8) == v139)
                  {
LABEL_74:
                    sub_10002D8A4((uint64_t)v161);
                    sub_100066F54((uint64_t *)&v164);
                    goto LABEL_50;
                  }
                }

                __int128 v93 = (v93 + 1) & v94;
              }

              while (((*(void *)((char *)&_swiftEmptySetSingleton + ((v93 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> v93) & 1) != 0);
            }
          }

          Hasher.init(_seed:)(&v149, *((void *)&_swiftEmptySetSingleton + 5));
          Hasher._combine(_:)(1uLL);
          Hasher._combine(_:)(v35);
          if ((_DWORD)v37)
          {
            v96 = 0LL;
          }

          else
          {
            Hasher._combine(_:)(1uLL);
            v96 = v139;
          }

          Hasher._combine(_:)(v96);
          __int128 v97 = Hasher._finalize()();
          __int128 v98 = -1LL << *((_BYTE *)&_swiftEmptySetSingleton + 32);
          __int128 v99 = v97 & ~v98;
          if (((*(void *)((char *)&_swiftEmptySetSingleton + ((v99 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> v99) & 1) != 0)
          {
            __int128 v100 = ~v98;
            do
            {
              __int128 v101 = *((void *)&_swiftEmptySetSingleton + 6) + 24 * v99;
              if ((*(_BYTE *)(v101 + 17) & 1) == 0 && *(void *)v101 == v35)
              {
                if ((*(_BYTE *)(v101 + 16) & 1) != 0)
                {
                  if ((v37 & 1) != 0) {
                    goto LABEL_110;
                  }
                }

                else if ((v37 & 1) == 0 && *(void *)(v101 + 8) == v139)
                {
                  goto LABEL_110;
                }
              }

              __int128 v99 = (v99 + 1) & v100;
            }

            while (((*(void *)((char *)&_swiftEmptySetSingleton + ((v99 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> v99) & 1) != 0);
          }

          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptySetSingleton);
          __int128 v103 = *((void *)&_swiftEmptySetSingleton + 2);
          if (*((void *)&_swiftEmptySetSingleton + 3) <= v103)
          {
            __int128 v105 = v103 + 1;
            if (isUniquelyReferenced_nonNull_native) {
              sub_100059EC8(v105);
            }
            else {
              sub_10005B338(v105);
            }
            __int128 v28 = &_swiftEmptySetSingleton;
            Hasher.init(_seed:)(&v149, *((void *)&_swiftEmptySetSingleton + 5));
            Hasher._combine(_:)(1uLL);
            Hasher._combine(_:)(v35);
            if ((_DWORD)v37)
            {
              uint64_t v106 = 0LL;
            }

            else
            {
              Hasher._combine(_:)(1uLL);
              uint64_t v106 = v139;
            }

            Hasher._combine(_:)(v106);
            Swift::UInt v107 = Hasher._finalize()();
            unint64_t v108 = -1LL << *((_BYTE *)&_swiftEmptySetSingleton + 32);
            __int128 v99 = v107 & ~v108;
            if (((*(void *)((char *)&_swiftEmptySetSingleton + ((v99 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> v99) & 1) != 0)
            {
              uint64_t v109 = ~v108;
              do
              {
                Swift::UInt v110 = *((void *)&_swiftEmptySetSingleton + 6) + 24 * v99;
                if ((*(_BYTE *)(v110 + 17) & 1) == 0 && *(void *)v110 == v35)
                {
                  if ((*(_BYTE *)(v110 + 16) & 1) != 0)
                  {
                    if ((v37 & 1) != 0) {
                      goto LABEL_123;
                    }
                  }

                  else if ((v37 & 1) == 0 && *(void *)(v110 + 8) == v139)
                  {
                    goto LABEL_123;
                  }
                }

                __int128 v99 = (v99 + 1) & v109;
              }

              while (((*(void *)((char *)&_swiftEmptySetSingleton + ((v99 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> v99) & 1) != 0);
            }

            __int128 v104 = v139;
          }

          else
          {
            __int128 v104 = v139;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_10005ACA8();
              __int128 v104 = v139;
              __int128 v28 = &_swiftEmptySetSingleton;
            }
          }

          *(void *)((char *)&_swiftEmptySetSingleton + ((v99 >> 3) & 0xFFFFFFFFFFFFFF8LL) + 56) |= 1LL << v99;
          int v111 = *((void *)&_swiftEmptySetSingleton + 6) + 24 * v99;
          *(void *)int v111 = v35;
          *(void *)(v111 + 8) = v104;
          *(_BYTE *)(v111 + 16) = v37;
          *(_BYTE *)(v111 + 17) = 0;
          unint64_t v112 = *((void *)&_swiftEmptySetSingleton + 2);
          uint64_t v113 = __OFADD__(v112, 1LL);
          Swift::UInt v114 = v112 + 1;
          if (v113) {
            goto LABEL_122;
          }
          *((void *)&_swiftEmptySetSingleton + 2) = v114;
          uint64_t v153 = &_swiftEmptySetSingleton;
          swift_bridgeObjectRelease(0x8000000000000000LL);
LABEL_110:
          sub_10002D8A4((uint64_t)v161);
          sub_100066F54((uint64_t *)&v164);
          uint64_t v4 = v142;
LABEL_50:
          uint64_t v81 = swift_bridgeObjectRetain(v28);
          sub_100069D4C(v81);
          uint64_t v17 = v54;
          swift_bridgeObjectRelease(v28);
          uint64_t v82 = swift_bridgeObjectRetain(v28);
          sub_10005750C(v82);
          swift_bridgeObjectRelease(v28);
LABEL_51:
          __int128 v28 = &_swiftEmptySetSingleton;
          goto LABEL_56;
        }

        sub_10002DA24(v31, v30, v33);
      }

      if (v143)
      {
        uint64_t v4 = v142;
        __int128 v28 = &_swiftEmptySetSingleton;
        if ((v33 & 0x8000000000000080LL) == 0x80)
        {
          sub_100030508(v31, v30, v33);
          Swift::Int v72 = sub_100060EC4(v31, v30);
          uint64_t v73 = v145;
          uint64_t v74 = v167;
          sub_100066ED8(v31, v30, v33, v145, v167);
          uint64_t v75 = v33;
        }

        else
        {
          uint64_t v75 = v33;
          Swift::Int v72 = _swiftEmptyArrayStorage;
          uint64_t v74 = v167;
          uint64_t v73 = v145;
        }

        sub_100066ED8(v31, v30, v75, v73, v74);
        uint64_t v83 = v72[2];
        swift_bridgeObjectRelease(v72);
        if (!v83)
        {
          Swift::UInt v121 = swift_bridgeObjectRetain(&_swiftEmptySetSingleton);
          sub_100069D4C(v121);
          swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
          unint64_t v122 = swift_bridgeObjectRetain(&_swiftEmptySetSingleton);
          sub_10005750C(v122);
          swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
          uint64_t v5 = v141;
          goto LABEL_16;
        }

        unint64_t v76 = v147;
      }

      else
      {
        sub_100066ED8(v31, v30, v33, v145, v167);
        uint64_t v4 = v142;
        unint64_t v76 = v147;
        __int128 v28 = &_swiftEmptySetSingleton;
      }

      uint64_t v5 = v141;
      BOOL v84 = swift_bridgeObjectRetain(&_swiftEmptySetSingleton);
      sub_100069D4C(v84);
      uint64_t v17 = v76;
      swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
      uint64_t v85 = swift_bridgeObjectRetain(&_swiftEmptySetSingleton);
      sub_10005750C(v85);
      swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
LABEL_56:
      uint64_t v27 = v4[4];
      uint64_t v26 = v4[5];
      uint64_t v20 = *(void *)(v27 + 16);
      if (v20 < v26) {
        goto LABEL_116;
      }
      if (v26 < 0) {
        goto LABEL_117;
      }
      if (v26 == v20) {
        goto LABEL_16;
      }
    }

    if ((_DWORD)v38 != 1)
    {
      __int128 v54 = v147;
      goto LABEL_50;
    }

    uint64_t v39 = *v4;
    uint64_t v40 = v4[1];
    uint64_t v41 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(v40 + 16);
    unint64_t v42 = v32;
    uint64_t v43 = v34;
    sub_10005BDF8(v31, v30, v33, v32, v34);
    v137 = v40;
    uint64_t v138 = v39;
    v41(v158, v39, v40);
    uint64_t v44 = v159;
    Swift::UInt v160 = v159;
    swift_bridgeObjectRetain(v159);
    sub_10002CC24(v158);
    uint64_t v45 = *(void *)(v44 + 16);
    if (v45)
    {
      Swift::Int v144 = v42;
      uint64_t v167 = v43;
      swift_bridgeObjectRetain(v44);
      unint64_t v46 = (uint64_t *)(v44 + 40);
      while (1)
      {
        Swift::UInt v47 = *(v46 - 1);
        v48 = *v46;
        __int128 v49 = (*(uint64_t (**)(uint64_t, uint64_t))(*v46 + 24))(v47, *v46);
        __int128 v51 = v50;
        if (v49 == v31 && v30 == v50) {
          break;
        }
        __int128 v53 = _stringCompareWithSmolCheck(_:_:expecting:)(v49, v50, v31, v30, 0LL);
        swift_bridgeObjectRelease(v51);
        if ((v53 & 1) != 0) {
          goto LABEL_44;
        }
        v46 += 2;
        if (!--v45)
        {
          sub_10002ABC8(&v160);
          sub_10002ABC8(&v160);
          sub_100066ED8(v31, v30, v33, v144, v167);
          __int128 v28 = v153;
          uint64_t v5 = v141;
          uint64_t v4 = v142;
          __int128 v54 = v147;
          goto LABEL_49;
        }
      }

      swift_bridgeObjectRelease(v50);
LABEL_44:
      sub_10002ABC8(&v160);
      sub_10002ABC8(&v160);
      sub_100066ED8(v31, v30, v33, v144, v167);
      if ((sub_10004F578(v47, v48) & 1) == 0 && (sub_10004F6A0(v138, v137) & 1) != 0)
      {
        uint64_t v77 = v153;
        Swift::UInt v78 = swift_bridgeObjectRetain(v153);
        sub_100069D4C(v78);
        uint64_t v17 = v147;
        swift_bridgeObjectRelease(v77);
        uint64_t v79 = swift_bridgeObjectRetain(v77);
        sub_10005750C(v79);
        swift_bridgeObjectRelease(v77);
        uint64_t v5 = v141;
        uint64_t v4 = v142;
        goto LABEL_51;
      }

      uint64_t v80 = sub_10004F578(v47, v48);
      __int128 v28 = v153;
      uint64_t v5 = v141;
      __int128 v54 = v147;
      if ((v80 & 1) != 0)
      {
        uint64_t v123 = swift_bridgeObjectRetain(v153);
        sub_100069D4C(v123);
        swift_bridgeObjectRelease(v28);
        Swift::UInt v124 = swift_bridgeObjectRetain(v28);
        sub_10005750C(v124);
        swift_bridgeObjectRelease(v28);
        uint64_t v4 = v142;
        goto LABEL_16;
      }
    }

    else
    {
      sub_10002ABC8(&v160);
      sub_100066ED8(v31, v30, v33, v42, v43);
      __int128 v54 = v147;
      uint64_t v5 = v141;
    }

    uint64_t v4 = v142;
LABEL_49:
    if (v143)
    {
      unint64_t v119 = swift_bridgeObjectRetain(v28);
      sub_100069D4C(v119);
      swift_bridgeObjectRelease(v28);
      uint64_t v120 = swift_bridgeObjectRetain(v28);
      sub_10005750C(v120);
      swift_bridgeObjectRelease(v28);
      goto LABEL_16;
    }

    goto LABEL_50;
  }

LABEL_119:
  __break(1u);
LABEL_120:
  __break(1u);
LABEL_121:
  __break(1u);
LABEL_122:
  __break(1u);
LABEL_123:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for InputOrigin.Element);
  __break(1u);
  return result;
}

uint64_t sub_10006668C(Swift::UInt a1, Swift::UInt a2, __int16 a3, uint64_t a4)
{
  if (*(void *)(a4 + 16))
  {
    Hasher.init(_seed:)(v15, *(void *)(a4 + 40));
    if ((a3 & 0x100) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(a1), (a3 & 1) != 0))
    {
      Swift::UInt v8 = 0LL;
    }

    else
    {
      Hasher._combine(_:)(1uLL);
      Swift::UInt v8 = a2;
    }

    Hasher._combine(_:)(v8);
    Swift::Int v9 = Hasher._finalize()();
    uint64_t v10 = -1LL << *(_BYTE *)(a4 + 32);
    unint64_t v11 = v9 & ~v10;
    if (((*(void *)(a4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v11) & 1) != 0)
    {
      uint64_t v12 = ~v10;
      do
      {
        uint64_t v13 = *(void *)(a4 + 48) + 24 * v11;
        if ((*(_BYTE *)(v13 + 17) & 1) != 0)
        {
          if ((a3 & 0x100) != 0) {
            return 1LL;
          }
        }

        else if ((a3 & 0x100) == 0 && *(void *)v13 == a1)
        {
          if ((*(_BYTE *)(v13 + 16) & 1) != 0)
          {
            if ((a3 & 1) != 0) {
              return 1LL;
            }
          }

          else if ((a3 & 1) == 0 && *(void *)(v13 + 8) == a2)
          {
            return 1LL;
          }
        }

        unint64_t v11 = (v11 + 1) & v12;
      }

      while (((*(void *)(a4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v11) & 1) != 0);
    }
  }

  return 0LL;
}

uint64_t sub_1000667C8( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5, char a6, char a7, char a8, uint64_t *a9)
{
  int v14 = a5;
  if ((a7 & 1) != 0)
  {
    uint64_t v16 = sub_10003E944(0x656C62616E65LL, 0xE600000000000000LL, 1, a4, a1, a2, a3);
    uint64_t v17 = 0x656C6261736964LL;
    uint64_t v18 = 0xE700000000000000LL;
  }

  else
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    uint64_t v15 = swift_bridgeObjectRetain(a4);
    uint64_t v16 = sub_10007F258(v15, a1, a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(a2);
    uint64_t v17 = 28526LL;
    uint64_t v18 = 0xE200000000000000LL;
  }

  __int128 v19 = sub_10003E944(v17, v18, 0, a4, a1, a2, a3);
  char v56 = v14;
  __int128 v54 = v19;
  __int128 v55 = v16;
  if (v14 == 2 || ((v14 & 1) != 0 ? (uint64_t v20 = v16) : (uint64_t v20 = v19), !*((void *)v20 + 2)))
  {
    uint64_t v24 = 0LL;
    uint64_t v26 = 0LL;
  }

  else
  {
    uint64_t v21 = *((void *)v20 + 4);
    uint64_t v22 = (void *)*((void *)v20 + 5);
    unsigned __int8 v23 = v20[48];
    sub_100030508(v21, (uint64_t)v22, v23);
    v80._uint64_t countAndFlagsBits = v21;
    v80._object = v22;
    uint64_t v24 = sub_10006D63C(v80, v23);
    uint64_t v26 = v25;
    sub_10002DA24(v21, (uint64_t)v22, v23);
  }

  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_100037ACC(a9);
  sub_10005EC6C((uint64_t)_swiftEmptyArrayStorage, (a6 & 1) == 0, (uint64_t)a9, v24, v26, a1, a2, a3, (uint64_t)&v58, 1);
  __int128 v45 = v58;
  uint64_t v44 = v59;
  char v53 = v61;
  __int128 v51 = v63;
  __int128 v52 = v62;
  uint64_t v49 = v65;
  uint64_t v50 = v64;
  char v48 = v66;
  uint64_t v46 = v68;
  uint64_t v47 = v67;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_100037ACC(a9);
  sub_10005EC6C((uint64_t)_swiftEmptyArrayStorage, 1LL, (uint64_t)a9, 0LL, 0LL, a1, a2, a3, (uint64_t)&v69, 0);
  uint64_t v27 = v70;
  char v28 = v72;
  __int128 v36 = v69;
  __int128 v37 = v73;
  __int128 v43 = v74;
  uint64_t v41 = v76;
  uint64_t v42 = v75;
  char v40 = v77;
  uint64_t v38 = v79;
  uint64_t v39 = v78;
  uint64_t v29 = swift_allocObject(&unk_1000B28F8, 17LL, 7LL);
  *(_BYTE *)(v29 + 16) = 0;
  uint64_t v30 = swift_allocObject(&unk_1000B2920, 49LL, 7LL);
  *(void *)(v30 + 16) = v29;
  *(void *)(v30 + 24) = a1;
  *(void *)(v30 + 32) = a2;
  *(void *)(v30 + 40) = a3;
  *(_BYTE *)(v30 + 48) = a8;
  uint64_t v31 = swift_allocObject(&unk_1000B2948, 48LL, 7LL);
  *(_BYTE *)(v31 + 16) = v56;
  *(void *)(v31 + 24) = a1;
  *(void *)(v31 + 32) = a2;
  *(void *)(v31 + 40) = a3;
  uint64_t v32 = swift_allocObject(&unk_1000B2970, 49LL, 7LL);
  *(void *)(v32 + 16) = v29;
  *(void *)(v32 + 24) = a1;
  *(void *)(v32 + 32) = a2;
  *(void *)(v32 + 40) = a3;
  *(_BYTE *)(v32 + 48) = a8;
  uint64_t v33 = sub_100005104(&qword_1000B9230);
  uint64_t v34 = swift_allocObject(v33, 416LL, 7LL);
  *(_OWORD *)(v34 + 16) = xmmword_1000970B0;
  *(void *)(v34 + 32) = v55;
  *(_OWORD *)(v34 + 40) = v45;
  *(void *)(v34 + 56) = v44;
  *(_OWORD *)(v34 + 64) = v60;
  *(_BYTE *)(v34 + 80) = v53;
  *(_OWORD *)(v34 + 88) = v52;
  *(_OWORD *)(v34 + 104) = v51;
  *(void *)(v34 + 120) = v50;
  *(void *)(v34 + 128) = v49;
  *(_BYTE *)(v34 + 136) = v48;
  *(void *)(v34 + 144) = v47;
  *(void *)(v34 + 152) = v46;
  *(void *)(v34 + 160) = 0LL;
  *(void *)(v34 + 168) = 0LL;
  *(_WORD *)(v34 + 176) = 4;
  *(void *)(v34 + 184) = sub_100067104;
  *(void *)(v34 + 192) = v30;
  *(_BYTE *)(v34 + 200) = 0;
  *(void *)(v34 + 208) = sub_100067148;
  *(void *)(v34 + 216) = v31;
  *(void *)(v34 + 224) = v54;
  *(_OWORD *)(v34 + 232) = v36;
  *(void *)(v34 + 248) = v27;
  *(_OWORD *)(v34 + 256) = v71;
  *(_BYTE *)(v34 + 272) = v28;
  *(_OWORD *)(v34 + 280) = v37;
  *(_OWORD *)(v34 + 296) = v43;
  *(void *)(v34 + 312) = v42;
  *(void *)(v34 + 320) = v41;
  *(_BYTE *)(v34 + 328) = v40;
  *(void *)(v34 + 336) = v39;
  *(void *)(v34 + 344) = v38;
  *(void *)(v34 + 352) = 0LL;
  *(void *)(v34 + 360) = 0LL;
  *(_WORD *)(v34 + 368) = 4;
  *(void *)(v34 + 376) = sub_10006716C;
  *(void *)(v34 + 384) = v32;
  *(_BYTE *)(v34 + 392) = 0;
  *(void *)(v34 + 400) = String.init(argument:);
  *(void *)(v34 + 408) = 0LL;
  swift_bridgeObjectRetain_n(a2, 3LL);
  swift_bridgeObjectRetain_n(a3, 3LL);
  swift_retain(v29);
  return sub_100079288(v34);
}

unint64_t sub_100066C54(unint64_t result, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a4 + 16);
  if (v4 < result || v4 < a3)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v6 = a3 - result;
  if (a2 >= 1)
  {
    return 0LL;
  }

  if (v6 <= 0 && v6 > a2) {
    return 0LL;
  }
LABEL_13:
  BOOL v7 = __OFADD__(result, a2);
  result += a2;
  if (v7) {
    goto LABEL_16;
  }
  if (result > v4) {
LABEL_17:
  }
    __break(1u);
  return result;
}

uint64_t sub_100066CC0(uint64_t result, uint64_t a2, unint64_t a3)
{
  int64_t v3 = a3 >> 1;
  if (a3 >> 1 == a2)
  {
    return 0LL;
  }

  else
  {
    unint64_t v4 = (int8x16_t *)(result + (a2 << 6) + 24);
    while (a2 < v3)
    {
      uint64_t v5 = v4[-1].i64[1];
      if ((v5 & 0x6000000000000000LL) == 0x4000000000000000LL)
      {
        int8x16_t v6 = vorrq_s8(*v4, *(int8x16_t *)((char *)v4 - 24));
        int8x16_t v7 = vextq_s8(v6, v6, 8uLL);
        int8x8_t v8 = vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL));
        if (v5 == 0x4000000000000000LL && *(void *)&v8 == 0LL) {
          return a2;
        }
      }

      ++a2;
      v4 += 4;
      if (v3 == a2) {
        return 0LL;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_100066D4C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain(a1);
    sub_10004FDF4(0LL, v1, 0);
    uint64_t v3 = 32LL;
    do
    {
      __int128 v4 = *(_OWORD *)(a1 + v3 + 144);
      v20[8] = *(_OWORD *)(a1 + v3 + 128);
      v20[9] = v4;
      __int128 v5 = *(_OWORD *)(a1 + v3 + 176);
      v20[10] = *(_OWORD *)(a1 + v3 + 160);
      v20[11] = v5;
      __int128 v6 = *(_OWORD *)(a1 + v3 + 80);
      v20[4] = *(_OWORD *)(a1 + v3 + 64);
      v20[5] = v6;
      __int128 v7 = *(_OWORD *)(a1 + v3 + 112);
      v20[6] = *(_OWORD *)(a1 + v3 + 96);
      v20[7] = v7;
      __int128 v8 = *(_OWORD *)(a1 + v3 + 16);
      v20[0] = *(_OWORD *)(a1 + v3);
      v20[1] = v8;
      __int128 v9 = *(_OWORD *)(a1 + v3 + 48);
      v20[2] = *(_OWORD *)(a1 + v3 + 32);
      v20[3] = v9;
      sub_10002D724((uint64_t)v20);
      unint64_t v10 = sub_10005D31C();
      uint64_t v12 = v11;
      sub_10002D8A4((uint64_t)v20);
      unint64_t v14 = _swiftEmptyArrayStorage[2];
      unint64_t v13 = _swiftEmptyArrayStorage[3];
      if (v14 >= v13 >> 1) {
        sub_10004FDF4((char *)(v13 > 1), v14 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v14 + 1;
      uint64_t v15 = &_swiftEmptyArrayStorage[2 * v14];
      v15[4] = v10;
      v15[5] = v12;
      v3 += 192LL;
      --v1;
    }

    while (v1);
    swift_bridgeObjectRelease(a1);
  }

  uint64_t v16 = sub_100005104(&qword_1000B90C8);
  uint64_t v17 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v18 = BidirectionalCollection<>.joined(separator:)(2109216LL, 0xE300000000000000LL, v16, v17);
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  return v18;
}

uint64_t sub_100066ED8(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = (a3 >> 61) & 3;
  if ((_DWORD)v5 == 1) {
    return swift_bridgeObjectRelease(a2);
  }
  if (!(_DWORD)v5) {
    return sub_100066EF8(result, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_100066EF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((a3 & 0x8000000000000000LL) == 0) {
    return sub_10002DA24(a1, a2, a3);
  }
  sub_10002DA24(a1, a2, a3);
  return swift_bridgeObjectRelease(a5);
}

uint64_t *sub_100066F24(uint64_t *a1)
{
  return a1;
}

uint64_t *sub_100066F54(uint64_t *a1)
{
  return a1;
}

uint64_t sub_100066F84(uint64_t a1, uint64_t a2)
{
  return a2;
}

__n128 *sub_100066FC0(__n128 *a1, __n128 *a2)
{
  return a2;
}

uint64_t *sub_100066FFC(uint64_t *a1)
{
  return a1;
}

uint64_t sub_10006702C(uint64_t a1)
{
  return a1;
}

unint64_t sub_100067054()
{
  unint64_t result = qword_1000B9BB8;
  if (!qword_1000B9BB8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A404, &type metadata for InputOrigin.Element);
    atomic_store(result, (unint64_t *)&qword_1000B9BB8);
  }

  return result;
}

uint64_t sub_100067098(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000670D0(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((a3 & 0x7FFFFFFFFFFFFF3ELL) != 0x7FFFFFF3ELL) {
    return sub_100066ED8(result, a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_1000670F0()
{
  return swift_deallocObject(v0, 17LL, 7LL);
}

uint64_t sub_100067104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  return sub_100067184(a1, a2, a3, a4, a5, 1u);
}

uint64_t sub_10006711C()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t sub_100067148(uint64_t a1, uint64_t a2)
{
  return sub_100061C30(a1, a2, *(_BYTE *)(v2 + 16), *(void *)(v2 + 24), *(void *)(v2 + 32), *(void *)(v2 + 40));
}

uint64_t sub_10006716C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  return sub_100067184(a1, a2, a3, a4, a5, 0);
}

uint64_t sub_100067184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, unsigned __int8 a6)
{
  return sub_100061D28( a1,  a2,  a3,  a4,  a5,  *(void *)(v6 + 16),  *(void *)(v6 + 24),  *(void *)(v6 + 32),  *(void **)(v6 + 40),  *(_BYTE *)(v6 + 48),  a6);
}

uint64_t sub_1000671BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005104(&qword_1000B9360);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t destroy for ArgumentSet(void *a1)
{
  return swift_bridgeObjectRelease(a1[1]);
}

uint64_t *_s14ArgumentParser11ArgumentSetVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t *assignWithCopy for ArgumentSet(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

void *assignWithTake for ArgumentSet(void *a1, _OWORD *a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease(v4);
  return a1;
}

ValueMetadata *type metadata accessor for ArgumentSet()
{
  return &type metadata for ArgumentSet;
}

uint64_t sub_100067314( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  unsigned __int8 v13 = a4;
  switch(a11)
  {
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
      unint64_t result = a2;
      return swift_bridgeObjectRetain(result);
    case 4:
      uint64_t v16 = a4;
      uint64_t v17 = a5;
      unsigned __int8 v18 = a6;
      return sub_100030508(v16, v17, v18);
    case 7:
      swift_bridgeObjectRetain(result);
      uint64_t v16 = a2;
      uint64_t v17 = a3;
      unsigned __int8 v18 = v13;
      return sub_100030508(v16, v17, v18);
    case 8:
      sub_100030508(a4, a5, a6);
      unint64_t result = a8;
      return swift_bridgeObjectRetain(result);
    case 9:
      return swift_bridgeObjectRetain(result);
    case 10:
      swift_bridgeObjectRetain(result);
      goto LABEL_8;
    case 11:
LABEL_8:
      swift_bridgeObjectRetain(a2);
      unint64_t result = a3;
      return swift_bridgeObjectRetain(result);
    case 12:
      swift_bridgeObjectRetain(result);
      sub_10005EF34(a2, a3, v13);
      swift_bridgeObjectRetain(a6);
      swift_bridgeObjectRetain(a8);
      swift_bridgeObjectRetain(a9);
      goto LABEL_11;
    case 13:
    case 14:
LABEL_11:
      unint64_t result = swift_errorRetain();
      break;
    default:
      return result;
  }

  return result;
}

uint64_t destroy for CommandError(uint64_t a1)
{
  return sub_10006749C( *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(_BYTE *)(a1 + 88));
}

uint64_t sub_10006749C( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  unsigned __int8 v13 = a4;
  switch(a11)
  {
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
      unint64_t result = a2;
      return swift_bridgeObjectRelease(result);
    case 4:
      uint64_t v16 = a4;
      uint64_t v17 = a5;
      unsigned __int8 v18 = a6;
      return sub_10002DA24(v16, v17, v18);
    case 7:
      swift_bridgeObjectRelease(result);
      uint64_t v16 = a2;
      uint64_t v17 = a3;
      unsigned __int8 v18 = v13;
      return sub_10002DA24(v16, v17, v18);
    case 8:
      sub_10002DA24(a4, a5, a6);
      unint64_t result = a8;
      return swift_bridgeObjectRelease(result);
    case 9:
      return swift_bridgeObjectRelease(result);
    case 10:
      swift_bridgeObjectRelease(result);
      goto LABEL_8;
    case 11:
LABEL_8:
      swift_bridgeObjectRelease(a2);
      unint64_t result = a3;
      return swift_bridgeObjectRelease(result);
    case 12:
      swift_bridgeObjectRelease(result);
      sub_10002DA3C(a2, a3, v13);
      swift_bridgeObjectRelease(a9);
      swift_bridgeObjectRelease(a8);
      swift_bridgeObjectRelease(a6);
      unint64_t result = a10;
      goto LABEL_11;
    case 13:
    case 14:
LABEL_11:
      unint64_t result = swift_errorRelease(result);
      break;
    default:
      return result;
  }

  return result;
}

uint64_t initializeWithCopy for CommandError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  uint64_t v5 = a2[2];
  uint64_t v6 = a2[3];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  uint64_t v9 = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a2[9];
  uint64_t v15 = a2[8];
  uint64_t v16 = v4;
  uint64_t v12 = a2[10];
  char v13 = *((_BYTE *)a2 + 88);
  swift_bridgeObjectRetain(v3);
  sub_100067314(v16, v5, v6, v7, v8, v9, v10, v15, v11, v12, v13);
  *(void *)(a1 + 8) = v16;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v15;
  *(void *)(a1 + 72) = v11;
  *(void *)(a1 + 80) = v12;
  *(_BYTE *)(a1 + 88) = v13;
  return a1;
}

uint64_t *assignWithCopy for CommandError(uint64_t *a1, void *a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = v2[1];
  uint64_t v7 = v2[2];
  uint64_t v8 = v2[3];
  uint64_t v9 = v2[4];
  uint64_t v10 = v2[5];
  uint64_t v11 = v2[6];
  uint64_t v12 = v2[7];
  uint64_t v13 = v2[8];
  uint64_t v26 = v2[9];
  uint64_t v27 = v2[10];
  LOBYTE(v2) = *((_BYTE *)v2 + 88);
  sub_100067314(v6, v7, v8, v9, v10, v11, v12, v13, v26, v27, (char)v2);
  uint64_t v14 = a1[1];
  uint64_t v15 = a1[2];
  uint64_t v16 = a1[3];
  uint64_t v17 = a1[4];
  uint64_t v18 = a1[5];
  uint64_t v19 = a1[6];
  uint64_t v20 = a1[7];
  uint64_t v21 = a1[8];
  uint64_t v22 = a1[9];
  uint64_t v23 = a1[10];
  char v24 = *((_BYTE *)a1 + 88);
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  a1[4] = v9;
  a1[5] = v10;
  a1[6] = v11;
  a1[7] = v12;
  a1[8] = v13;
  a1[9] = v26;
  a1[10] = v27;
  *((_BYTE *)a1 + 88) = (_BYTE)v2;
  sub_10006749C(v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24);
  return a1;
}

__n128 initializeWithTake for CommandError(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t *assignWithTake for CommandError(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  char v5 = *((_BYTE *)a2 + 88);
  uint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  uint64_t v10 = a1[5];
  uint64_t v11 = a1[6];
  uint64_t v12 = a1[7];
  uint64_t v13 = a1[8];
  uint64_t v14 = a1[9];
  uint64_t v15 = a1[10];
  char v16 = *((_BYTE *)a1 + 88);
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 1);
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
  *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *((_BYTE *)a1 + 88) = v5;
  sub_10006749C(v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

uint64_t getEnumTagSinglePayload for CommandError(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 89)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CommandError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 89) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 89) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for CommandError()
{
  return &type metadata for CommandError;
}

uint64_t sub_1000678F4( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, char a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v16 = swift_bridgeObjectRetain(a4);
  uint64_t v17 = sub_10007F258(v16, a1, a2);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a2);
  if (a9 == 255) {
    uint64_t v18 = 0LL;
  }
  else {
    uint64_t v18 = a7;
  }
  if (a9 == 255) {
    uint64_t v19 = 0LL;
  }
  else {
    uint64_t v19 = a8;
  }
  uint64_t v37 = v19;
  uint64_t v38 = v18;
  if (a9 == 255) {
    char v20 = 4;
  }
  else {
    char v20 = a9;
  }
  char v36 = v20;
  sub_100037B40(a7, a8, a9);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_100037B40(a7, a8, a9);
  sub_100037ACC(a5);
  sub_10005EC6C((uint64_t)_swiftEmptyArrayStorage, 0LL, (uint64_t)a5, 0LL, 0LL, a1, a2, a3, (uint64_t)&v42, 0);
  __int128 v27 = v42;
  uint64_t v21 = v43;
  char v35 = v45;
  __int128 v33 = v47;
  __int128 v34 = v46;
  uint64_t v31 = v49;
  uint64_t v32 = v48;
  char v30 = v50;
  uint64_t v28 = v52;
  uint64_t v29 = v51;
  uint64_t v22 = (void *)swift_allocObject(&unk_1000B2ED8, 56LL, 7LL);
  v22[2] = sub_100069EBC;
  v22[3] = 0LL;
  v22[4] = a1;
  v22[5] = a2;
  v22[6] = a3;
  v40[0] = 0LL;
  v40[1] = 0LL;
  uint64_t v23 = (void *)swift_allocObject(&unk_1000B2F00, 64LL, 7LL);
  v23[2] = v17;
  sub_10002AACC((uint64_t)v40, (uint64_t)(v23 + 3), &qword_1000B9110);
  v23[5] = a1;
  v23[6] = a2;
  v23[7] = a3;
  char v41 = 1;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(v17);
  sub_10006C0F8(a7, a8, a9);
  uint64_t v24 = sub_100005104(&qword_1000B9230);
  uint64_t v25 = swift_allocObject(v24, 224LL, 7LL);
  *(_OWORD *)(v25 + 16) = xmmword_100096510;
  *(void *)(v25 + 32) = v17;
  *(_OWORD *)(v25 + 40) = v27;
  *(void *)(v25 + 56) = v21;
  *(_OWORD *)(v25 + 64) = v44;
  *(_BYTE *)(v25 + 80) = v35;
  *(_OWORD *)(v25 + 88) = v34;
  *(_OWORD *)(v25 + 104) = v33;
  *(void *)(v25 + 120) = v32;
  *(void *)(v25 + 128) = v31;
  *(_BYTE *)(v25 + 136) = v30;
  *(void *)(v25 + 144) = v29;
  *(void *)(v25 + 152) = v28;
  *(void *)(v25 + 160) = v38;
  *(void *)(v25 + 168) = v37;
  *(_BYTE *)(v25 + 176) = v36;
  *(_BYTE *)(v25 + 177) = a6;
  *(void *)(v25 + 184) = sub_10006C064;
  *(void *)(v25 + 192) = v22;
  *(_BYTE *)(v25 + 200) = v41;
  *(void *)(v25 + 208) = sub_10006C0D8;
  *(void *)(v25 + 216) = v23;
  return sub_100079288(v25);
}

uint64_t sub_100067BB4@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_8:
    sub_100033E1C(&v33);
    char v30 = &v33;
    goto LABEL_9;
  }

  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a2);
  __int128 v13 = *(_OWORD *)(a1 + 176);
  __int128 v41 = *(_OWORD *)(a1 + 160);
  __int128 v42 = v13;
  __int128 v14 = *(_OWORD *)(a1 + 208);
  __int128 v43 = *(_OWORD *)(a1 + 192);
  __int128 v44 = v14;
  __int128 v15 = *(_OWORD *)(a1 + 112);
  __int128 v37 = *(_OWORD *)(a1 + 96);
  __int128 v38 = v15;
  __int128 v16 = *(_OWORD *)(a1 + 144);
  __int128 v39 = *(_OWORD *)(a1 + 128);
  __int128 v40 = v16;
  __int128 v17 = *(_OWORD *)(a1 + 48);
  __int128 v33 = *(_OWORD *)(a1 + 32);
  __int128 v34 = v17;
  __int128 v18 = *(_OWORD *)(a1 + 80);
  __int128 v35 = *(_OWORD *)(a1 + 64);
  __int128 v36 = v18;
  if ((sub_100084464(a3, a4, a5, v35) & 1) == 0)
  {
    uint64_t v19 = 224LL;
    while (--v9)
    {
      uint64_t v20 = v19 + 192;
      uint64_t v21 = (__int128 *)(a1 + v19);
      __int128 v22 = v21[9];
      __int128 v41 = v21[8];
      __int128 v42 = v22;
      __int128 v23 = v21[11];
      __int128 v43 = v21[10];
      __int128 v44 = v23;
      __int128 v24 = v21[5];
      __int128 v37 = v21[4];
      __int128 v38 = v24;
      __int128 v25 = v21[7];
      __int128 v39 = v21[6];
      __int128 v40 = v25;
      __int128 v26 = v21[1];
      __int128 v33 = *v21;
      __int128 v34 = v26;
      __int128 v27 = v21[3];
      __int128 v35 = v21[2];
      __int128 v36 = v27;
      char v28 = sub_100084464(a3, a4, a5, v35);
      uint64_t v19 = v20;
      if ((v28 & 1) != 0) {
        goto LABEL_6;
      }
    }

    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a1);
    goto LABEL_8;
  }

uint64_t sub_100067D6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v5 = *(uint64_t **)v2;
  uint64_t v6 = *(void *)(v2 + 8);
  uint64_t v7 = *(void *)(v2 + 16);
  sub_10006A740(a1, *(uint64_t **)v2);
  uint64_t v8 = swift_bridgeObjectRetain(a1);
  uint64_t v68 = sub_100075808(v8);
  int64_t v69 = v9;
  uint64_t v70 = v10;
  sub_100069740(&v68, (uint64_t)v5, v6, v7);
  sub_100069068((uint64_t *)&v68);
  uint64_t v11 = v68;
  uint64_t v12 = v70;
  sub_100068758(v68, v69, v70, *(void *)(v2 + 8), *(void *)(v2 + 16), (uint64_t)v60);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v11);
  sub_100033F10((uint64_t)v60, (uint64_t)v59);
  uint64_t v13 = sub_100005104(&qword_1000B9528);
  if (!swift_dynamicCast(v61, v59, v13, &type metadata for HelpCommand, 6LL))
  {
    uint64_t result = sub_100045320(v60, a2);
    goto LABEL_35;
  }

  if ((v62 & 1) != 0)
  {
LABEL_38:
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0x1000000000000246LL,  0x800000010009D5D0LL,  "ArgumentParser/Argument.swift",  29LL,  2LL,  77LL,  0);
    __break(1u);
    return result;
  }

  uint64_t v15 = v61[1];
  uint64_t v14 = v61[0];
  uint64_t v16 = v63;
  uint64_t v17 = v64;
  char v18 = v65;
  uint64_t v49 = v66;
  char v19 = v67;
  uint64_t v20 = *(uint64_t **)v2;
  uint64_t v21 = sub_100005104(&qword_1000B90C0);
  uint64_t v22 = swift_allocObject(v21, 48LL, 7LL);
  *(_OWORD *)(v22 + 16) = xmmword_100096510;
  *(_OWORD *)(v22 + 32) = *((_OWORD *)v20 + 1);
  uint64_t v50 = *(void *)(v14 + 16);
  if (!v50) {
    goto LABEL_34;
  }
  char v45 = v19;
  char v46 = v18;
  uint64_t v47 = v17;
  uint64_t v48 = v16;
  uint64_t v53 = v14 + 32;
  sub_10006B81C(v14, v15, 0);
  sub_10006B81C(v14, v15, 0);
  swift_retain(v20);
  unint64_t v23 = 0LL;
  uint64_t v51 = v15;
  uint64_t v52 = v14;
  while (1)
  {
    uint64_t v55 = v22;
    if (v23 >= *(void *)(v14 + 16))
    {
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }

    unint64_t v56 = v23;
    __int128 v24 = (uint64_t *)(v53 + 16 * v23);
    uint64_t v25 = *v24;
    uint64_t v26 = v24[1];
    swift_beginAccess(v20 + 5, v61, 0LL, 0LL);
    uint64_t v27 = v20[5];
    __int128 v54 = v20;
    uint64_t v28 = *(void *)((v27 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain_n(v27, 2LL);
    swift_bridgeObjectRetain(v26);
    if (!v28) {
      goto LABEL_32;
    }
LABEL_8:
    unint64_t v57 = v56 + 1;
    uint64_t v29 = 4LL;
    while (1)
    {
      if ((v27 & 0xC000000000000001LL) != 0)
      {
        uint64_t v30 = specialized _ArrayBuffer._getElementSlowPath(_:)(v29 - 4, v27);
      }

      else
      {
        uint64_t v30 = *(void *)(v27 + 8 * v29);
        swift_retain(v30);
      }

      uint64_t v31 = v29 - 3;
      if (__OFADD__(v29 - 4, 1LL))
      {
        __break(1u);
        goto LABEL_37;
      }

      uint64_t v32 = (*(uint64_t (**)(void))(*(void *)(v30 + 24) + 24LL))();
      if (v32 == v25 && v33 == v26)
      {
        swift_bridgeObjectRelease(v27);
        uint64_t v37 = v26;
        goto LABEL_22;
      }

      uint64_t v35 = v33;
      char v36 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v33, v25, v26, 0LL);
      swift_bridgeObjectRelease(v35);
      if ((v36 & 1) != 0) {
        break;
      }
      swift_release(v30);
      ++v29;
      if (v31 == v28) {
        goto LABEL_32;
      }
    }

    uint64_t v37 = v27;
LABEL_22:
    swift_bridgeObjectRelease(v27);
    swift_bridgeObjectRelease(v37);
    swift_bridgeObjectRelease(v26);
    __int128 v38 = *(_OWORD *)(v30 + 16);
    uint64_t v22 = v55;
    unint64_t v40 = *(void *)(v55 + 16);
    unint64_t v39 = *(void *)(v55 + 24);
    if (v40 >= v39 >> 1)
    {
      __int128 v58 = *(_OWORD *)(v30 + 16);
      __int128 v42 = sub_100057FEC((char *)(v39 > 1), v40 + 1, 1, (char *)v55);
      __int128 v38 = v58;
      uint64_t v22 = (uint64_t)v42;
    }

    uint64_t v15 = v51;
    uint64_t v14 = v52;
    *(void *)(v22 + 16) = v40 + 1;
    *(_OWORD *)(v22 + 16 * v40 + 32) = v38;
    swift_release(v54);
    uint64_t v20 = (uint64_t *)v30;
    unint64_t v23 = v57;
    if (v57 == v50)
    {
      sub_10004CB6C(v52, v51, 0);
      swift_release(v30);
      goto LABEL_33;
    }
  }

  if (v27 < 0) {
    uint64_t v41 = v20[5];
  }
  else {
    uint64_t v41 = v27 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain_n(v27, 3LL);
  swift_bridgeObjectRetain(v26);
  uint64_t v28 = _CocoaArrayWrapper.endIndex.getter(v41);
  swift_bridgeObjectRelease(v27);
  if (v28) {
    goto LABEL_8;
  }
LABEL_32:
  swift_bridgeObjectRelease_n(v27, 2LL);
  swift_bridgeObjectRelease(v26);
  uint64_t v15 = v51;
  uint64_t v14 = v52;
  sub_10004CB6C(v52, v51, 0);
  swift_release(v54);
  uint64_t v22 = v55;
LABEL_33:
  sub_10004CB6C(v14, v15, 0);
  uint64_t v17 = v47;
  uint64_t v16 = v48;
  char v18 = v46;
  char v19 = v45;
LABEL_34:
  swift_bridgeObjectRelease(v49);
  *(void *)(a2 + 24) = &type metadata for HelpCommand;
  *(void *)(a2 + 32) = sub_10002D6E0();
  uint64_t v44 = swift_allocObject(&unk_1000B2C40, 73LL, 7LL);
  *(void *)a2 = v44;
  *(void *)(v44 + 16) = v14;
  *(void *)(v44 + 24) = v15;
  *(_BYTE *)(v44 + 32) = 0;
  *(void *)(v44 + 40) = v16;
  *(void *)(v44 + 48) = v17;
  *(_BYTE *)(v44 + 56) = v18;
  *(void *)(v44 + 64) = v22;
  *(_BYTE *)(v44 + 72) = v19;
  uint64_t result = sub_1000062D8(v60);
LABEL_35:
  *(_BYTE *)(a2 + 89) = 0;
  return result;
}

uint64_t sub_100068758@<X0>( void *a1@<X0>, int64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t result = sub_10006B22C((uint64_t)a1, a2, 0, a4, a5);
  if (!v6)
  {
    uint64_t result = sub_100075C04((uint64_t)a1, a2);
    if ((result & 1) != 0)
    {
      int64_t v13 = a1[2];
      if (v13 < a2)
      {
LABEL_38:
        __break(1u);
        goto LABEL_39;
      }

      if (a2 < 0)
      {
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }

      if (v13 != a2)
      {
        uint64_t v14 = (uint64_t)&a1[8 * a2 + 6];
        int64_t v15 = a2;
        while (v15 < v13)
        {
          uint64_t v16 = *(void *)v14;
          if ((*(void *)v14 & 0x6000000000000000LL) == 0)
          {
            uint64_t v32 = *(void *)(v14 - 16);
            uint64_t v33 = *(void *)(v14 - 8);
            uint64_t v34 = *(void *)(v14 + 24);
            uint64_t v35 = *(void *)(v14 + 32);
            uint64_t v36 = *(unsigned __int8 *)(v14 + 40);
            unint64_t v37 = sub_10002EA1C();
            swift_allocError(&type metadata for ParserError, v37, 0LL, 0LL);
            *(void *)uint64_t v38 = v34;
            *(void *)(v38 + 8) = v35;
            *(void *)(v38 + 16) = v36;
            *(void *)(v38 + 24) = v32;
            *(void *)(v38 + 32) = v33;
            *(void *)(v38 + 40) = v16;
            *(_OWORD *)(v38 + 48) = 0u;
            *(_OWORD *)(v38 + 64) = 0u;
            *(_BYTE *)(v38 + 80) = 4;
            uint64_t v19 = sub_100030508(v32, v33, v16);
            return swift_willThrow(v19);
          }

          ++v15;
          v14 += 64LL;
          if (v13 == v15) {
            goto LABEL_10;
          }
        }

        __break(1u);
        goto LABEL_38;
      }

LABEL_10:
      uint64_t v17 = sub_100072ADC(a1, a2, a3);
      unint64_t v18 = sub_10002EA1C();
      uint64_t v19 = swift_allocError(&type metadata for ParserError, v18, 0LL, 0LL);
      *(void *)uint64_t v20 = v17;
      *(_OWORD *)(v20 + 8) = 0u;
      *(_OWORD *)(v20 + 24) = 0u;
      *(_OWORD *)(v20 + 40) = 0u;
      *(_OWORD *)(v20 + 56) = 0u;
      *(void *)(v20 + 72) = 0LL;
      char v21 = 9;
    }

    else
    {
      uint64_t v40 = a6;
      uint64_t v52 = 0LL;
      unint64_t v22 = *(void *)(a5 + 16);
      if (v22)
      {
        unint64_t v23 = (_OWORD *)(a5 + 32);
        swift_bridgeObjectRetain(a5);
        unint64_t v39 = v22;
        while (1)
        {
          sub_10005C00C(v23, &v44);
          sub_100033F10((uint64_t)v45, (uint64_t)&v41);
          swift_bridgeObjectRetain(a5);
          uint64_t v24 = sub_100005104(&qword_1000B9920);
          uint64_t v25 = sub_100005104(&qword_1000B9528);
          if ((swift_dynamicCast(&v46, &v41, v24, v25, 6LL) & 1) == 0)
          {
            uint64_t v48 = 0LL;
            __int128 v46 = 0u;
            __int128 v47 = 0u;
          }

          sub_10005C058((uint64_t)&v44);
          sub_10002AACC((uint64_t)&v46, (uint64_t)&v44, &qword_1000B9BC8);
          swift_bridgeObjectRelease(a5);
          uint64_t v26 = v45[1];
          sub_10006B82C((uint64_t)&v44);
          if (v26) {
            break;
          }
          unint64_t v23 = (_OWORD *)((char *)v23 + 56);
          if (!--v22) {
            goto LABEL_25;
          }
        }

        unint64_t v27 = v39 - 1;
        uint64_t v28 = (_OWORD *)(a5 + 56 * v39 - 24);
        while (1)
        {
          sub_10005C00C(v28, &v44);
          sub_100033F10((uint64_t)v45, (uint64_t)&v41);
          if ((swift_dynamicCast(&v46, &v41, v24, v25, 6LL) & 1) == 0)
          {
            uint64_t v48 = 0LL;
            __int128 v46 = 0u;
            __int128 v47 = 0u;
          }

          sub_10005C058((uint64_t)&v44);
          uint64_t v29 = *((void *)&v47 + 1);
          sub_10006B82C((uint64_t)&v46);
          if (v29) {
            break;
          }
          --v27;
          uint64_t v28 = (_OWORD *)((char *)v28 - 56);
          if (v27 >= v39)
          {
            __break(1u);
            goto LABEL_25;
          }
        }

        sub_10005C00C(v28, &v44);
        sub_100033F10((uint64_t)v45, (uint64_t)&v46);
        if ((swift_dynamicCast(&v41, &v46, v24, v25, 6LL) & 1) == 0)
        {
          uint64_t v43 = 0LL;
          __int128 v41 = 0u;
          __int128 v42 = 0u;
        }

        sub_10005C058((uint64_t)&v44);
        sub_10002AACC((uint64_t)&v41, (uint64_t)&v46, &qword_1000B9BC8);
        uint64_t result = sub_10006B86C((uint64_t)&v46, (uint64_t)&v41);
        uint64_t v30 = v40;
        if (!*((void *)&v42 + 1)) {
          goto LABEL_40;
        }
        sub_100045320(&v41, (uint64_t)&v44);
        sub_10006B82C((uint64_t)&v46);
        sub_100045320(&v44, (uint64_t)&v49);
      }

      else
      {
        swift_bridgeObjectRetain(a5);
LABEL_25:
        uint64_t v51 = 0LL;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        uint64_t v30 = v40;
      }

      swift_bridgeObjectRelease(a5);
      if (*((void *)&v50 + 1)) {
        return sub_100045320(&v49, v30);
      }
      sub_10006B82C((uint64_t)&v49);
      unint64_t v31 = sub_10002EA1C();
      uint64_t v19 = swift_allocError(&type metadata for ParserError, v31, 0LL, 0LL);
      *(void *)uint64_t v20 = 3LL;
      *(_OWORD *)(v20 + 8) = 0u;
      *(_OWORD *)(v20 + 24) = 0u;
      *(_OWORD *)(v20 + 40) = 0u;
      *(_OWORD *)(v20 + 56) = 0u;
      *(void *)(v20 + 72) = 0LL;
      char v21 = 15;
    }

    *(_BYTE *)(v20 + 80) = v21;
    return swift_willThrow(v19);
  }

  return result;
}

    if (__OFADD__(v2, 1LL)) {
      __break(1u);
    }
    else {
      v3[1] = (char *)(v2 + 1);
    }
  }

  return result;
}

  __break(1u);
  return result;
}

      sub_10003F6B0(v7, v8, v9);
      if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0) {
        uint64_t v6 = sub_100057BB8(0LL, *((void *)v6 + 2) + 1LL, 1, v6);
      }
      uint64_t v14 = *((void *)v6 + 2);
      int64_t v13 = *((void *)v6 + 3);
      if (v14 >= v13 >> 1) {
        uint64_t v6 = sub_100057BB8((char *)(v13 > 1), v14 + 1, 1, v6);
      }
      v5 += 24;
      *((void *)v6 + 2) = v14 + 1;
      int64_t v15 = &v6[24 * v14];
      *((void *)v15 + 4) = v11;
      *((void *)v15 + 5) = v12;
      v15[48] = v10;
      if (!--v3)
      {
        swift_bridgeObjectRelease(v22);
        return v6;
      }
    }

    uint64_t v10 = (_BYTE)v9 << 7;
    goto LABEL_9;
  }

  return (char *)_swiftEmptyArrayStorage;
}

uint64_t sub_100068B8C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v4 = v2[1];
  uint64_t v5 = *(void *)(v4 + 16);
  uint64_t v6 = *(void *)(v4 + 24);
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v9 = a1[2];
  uint64_t v10 = *(void *)(v6 + 8);
  swift_bridgeObjectRetain(*a1);
  swift_bridgeObjectRetain(v9);
  uint64_t v11 = sub_10004D160(v5, v10, 2, 0LL, 0LL, 0LL);
  uint64_t v13 = v12;
  v53[5] = v5;
  v53[6] = v6;
  uint64_t v14 = v11;
  v53[7] = v11;
  v53[8] = v12;
  uint64_t v54 = v7;
  uint64_t v55 = v8;
  uint64_t v56 = v9;
  uint64_t v15 = v61;
  sub_100065684((uint64_t)&v57);
  if (v15)
  {
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v14);
    swift_bridgeObjectRelease(v54);
    return swift_bridgeObjectRelease(v56);
  }

  else
  {
    uint64_t v61 = v13;
    uint64_t v47 = v14;
    if ((sub_10004F60C(*(void *)(v4 + 16), *(void *)(v4 + 24)) & 1) != 0)
    {
      uint64_t v17 = *v3;
      uint64_t v18 = v3[2];
      __int128 v19 = v58;
      uint64_t v60 = v58;
      swift_retain(v17);
      swift_retain(v4);
      swift_bridgeObjectRetain(v18);
      sub_10006B22C(v19, *((uint64_t *)&v19 + 1), 0, v4, v18);
      swift_bridgeObjectRelease(v18);
      swift_release(v4);
      swift_release(v17);
    }

    uint64_t v46 = (uint64_t)v3;
    char v21 = (char **)(v3 + 2);
    uint64_t v20 = v3[2];
    uint64_t v22 = type metadata accessor for ArgumentDecoder();
    uint64_t v23 = swift_allocObject(v22, 96LL, 7LL);
    *(void *)(v23 + 64) = 0LL;
    *(void *)(v23 + 72) = _swiftEmptyArrayStorage;
    *(void *)(v23 + 80) = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v20);
    *(void *)(v23 + 88) = sub_100079838((uint64_t)_swiftEmptyArrayStorage);
    __int128 v24 = v58;
    *(_OWORD *)(v23 + 16) = v57;
    *(_OWORD *)(v23 + 32) = v24;
    *(void *)(v23 + 48) = v59;
    *(void *)(v23 + 72) = v20;
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    *(void *)(v23 + 56) = &_swiftEmptySetSingleton;
    uint64_t v26 = *(void *)(v4 + 16);
    uint64_t v25 = *(void *)(v4 + 24);
    v53[3] = v22;
    v53[4] = sub_10006B97C();
    v53[0] = v23;
    *((void *)&v50 + 1) = v26;
    *(void *)&__int128 v51 = v25;
    sub_10000B40C(&v49);
    uint64_t v27 = *(void *)(*(void *)(v25 + 8) + 8LL);
    swift_retain(v23);
    dispatch thunk of Decodable.init(from:)(v53, v26, v27);
    sub_100045320(&v49, (uint64_t)a2);
    swift_beginAccess(v23 + 56, v53, 0LL, 0LL);
    uint64_t v28 = *(void *)(v23 + 56);
    uint64_t v29 = swift_bridgeObjectRetain(v28);
    sub_100069D4C(v29);
    swift_bridgeObjectRelease(v28);
    uint64_t v30 = *(void *)(v23 + 72);
    uint64_t v31 = swift_bridgeObjectRetain(v30);
    uint64_t v32 = (char *)sub_100069ED8(v31, v46);
    swift_bridgeObjectRelease(v61);
    swift_bridgeObjectRelease(v47);
    swift_bridgeObjectRelease(v30);
    swift_bridgeObjectRelease(v54);
    swift_bridgeObjectRelease(v56);
    sub_100056C48(v32);
    uint64_t v33 = *(void *)(v4 + 16);
    uint64_t v34 = *(void *)(*(void *)(v4 + 24) + 8LL);
    uint64_t v35 = a2[3];
    uint64_t v36 = a2[4];
    unint64_t v37 = sub_100006270(a2, v35);
    *((void *)&v51 + 1) = v35;
    uint64_t v52 = *(void *)(v36 + 8);
    uint64_t v38 = sub_10000B40C(&v50);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v35 - 8) + 16LL))(v38, v37, v35);
    *(void *)&__int128 v49 = v33;
    *((void *)&v49 + 1) = v34;
    unint64_t v39 = *(char **)(v46 + 16);
    if ((swift_isUniquelyReferenced_nonNull_native(v39) & 1) == 0) {
      unint64_t v39 = sub_100058204(0LL, *((void *)v39 + 2) + 1LL, 1, v39);
    }
    unint64_t v41 = *((void *)v39 + 2);
    unint64_t v40 = *((void *)v39 + 3);
    if (v41 >= v40 >> 1) {
      unint64_t v39 = sub_100058204((char *)(v40 > 1), v41 + 1, 1, v39);
    }
    *((void *)v39 + 2) = v41 + 1;
    __int128 v42 = &v39[56 * v41];
    __int128 v43 = v49;
    __int128 v44 = v50;
    __int128 v45 = v51;
    *((void *)v42 + 10) = v52;
    *((_OWORD *)v42 + 3) = v44;
    *((_OWORD *)v42 + 4) = v45;
    *((_OWORD *)v42 + 2) = v43;
    uint64_t result = swift_release(v23);
    *char v21 = v39;
  }

  return result;
}

uint64_t sub_100069068(uint64_t *a1)
{
  uint64_t v3 = v1;
  uint64_t v4 = a1;
  uint64_t result = sub_100068B8C(a1, v87);
  uint64_t v6 = v2;
  if (v2) {
    return result;
  }
  __int128 v74 = v4;
  uint64_t v75 = v1;
  do
  {
    uint64_t v8 = v88;
    uint64_t v7 = v89;
    sub_1000099D4((uint64_t)v87, v88);
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)(v7 + 8) + 24LL))(v8);
    if (v6)
    {
      uint64_t v67 = *(void *)(v3 + 8);
      uint64_t v68 = *(void *)(v3 + 16);
      sub_10006B22C(*v4, v4[1], 0, v67, v68);
      int64_t v69 = sub_10006B05C(v67, v68);
      unint64_t v70 = sub_10005134C();
      uint64_t v71 = swift_allocError(&type metadata for CommandError, v70, 0LL, 0LL);
      *(void *)uint64_t v72 = v69;
      *(void *)(v72 + 8) = v6;
      *(_OWORD *)(v72 + 16) = 0u;
      *(_OWORD *)(v72 + 32) = 0u;
      *(_OWORD *)(v72 + 48) = 0u;
      *(_OWORD *)(v72 + 64) = 0u;
      *(void *)(v72 + 80) = 0LL;
      *(_BYTE *)(v72 + 88) = 13;
      swift_willThrow(v71);
      return sub_1000062D8(v87);
    }

    uint64_t v9 = *(void *)(v3 + 16);
    if (!*(void *)(v9 + 16)) {
      goto LABEL_68;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(*(void *)(v3 + 16));
    if ((result & 1) != 0)
    {
      uint64_t v10 = *(void *)(v9 + 16);
      if (!v10) {
        goto LABEL_69;
      }
    }

    else
    {
      uint64_t result = (uint64_t)sub_10005B8AC(v9);
      uint64_t v9 = result;
      uint64_t v10 = *(void *)(result + 16);
      if (!v10) {
        goto LABEL_69;
      }
    }

    uint64_t v11 = v10 - 1;
    uint64_t v12 = v9 + 56 * v11;
    uint64_t v13 = *(void *)(v12 + 80);
    __int128 v15 = *(_OWORD *)(v12 + 48);
    __int128 v14 = *(_OWORD *)(v12 + 64);
    __int128 v16 = *(_OWORD *)(v12 + 32);
    *(void *)(v9 + 16) = v11;
    *(void *)(v3 + 16) = v9;
    __int128 v84 = v16;
    v85[0] = v15;
    v85[1] = v14;
    uint64_t v86 = v13;
    uint64_t v17 = v88;
    uint64_t v18 = v89;
    __int128 v19 = sub_100006270(v87, v88);
    *((void *)&v81 + 1) = v17;
    *(void *)&__int128 v82 = *(void *)(v18 + 8);
    uint64_t v20 = sub_10000B40C(&v80);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v17 - 8) + 16LL))(v20, v19, v17);
    sub_1000062D8(v85);
    sub_100045320(&v80, (uint64_t)v85);
    sub_10005C00C(&v84, &v80);
    char v21 = *(char **)(v3 + 16);
    if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0) {
      char v21 = sub_100058204(0LL, *((void *)v21 + 2) + 1LL, 1, v21);
    }
    unint64_t v23 = *((void *)v21 + 2);
    unint64_t v22 = *((void *)v21 + 3);
    uint64_t v99 = 0LL;
    if (v23 >= v22 >> 1) {
      char v21 = sub_100058204((char *)(v22 > 1), v23 + 1, 1, v21);
    }
    *((void *)v21 + 2) = v23 + 1;
    __int128 v24 = &v21[56 * v23];
    __int128 v25 = v80;
    __int128 v26 = v81;
    __int128 v27 = v82;
    *((void *)v24 + 10) = v83;
    *((_OWORD *)v24 + 3) = v26;
    *((_OWORD *)v24 + 4) = v27;
    *((_OWORD *)v24 + 2) = v25;
    *(void *)(v3 + 16) = v21;
    sub_10005C058((uint64_t)&v84);
    uint64_t v28 = *(void *)(v3 + 8);
    uint64_t v29 = *v4;
    uint64_t v30 = v4[2];
    unint64_t v77 = v4[1];
    sub_100075B28(*v4, v77, (uint64_t)v90);
    sub_10002AACC((uint64_t)v90, (uint64_t)&v94, &qword_1000B9BD8);
    uint64_t v31 = v96;
    uint64_t v76 = v28;
    if ((v96 & 0x7FFFFFFFFFFFFF3ELL) == 0x7FFFFFF3ELL) {
      goto LABEL_31;
    }
    unint64_t v32 = v94;
    char v33 = v95;
    uint64_t result = sub_10006B8F8((uint64_t)v90);
    if ((v31 & 0x6000000000000000LL) != 0x2000000000000000LL || (v33 & 1) != 0) {
      goto LABEL_31;
    }
    if ((v32 & 0x8000000000000000LL) != 0) {
      goto LABEL_70;
    }
    if (v32 >= *(void *)(v30 + 16)) {
      goto LABEL_71;
    }
    uint64_t v34 = v30 + 16 * v32;
    uint64_t v36 = *(void *)(v34 + 32);
    uint64_t v35 = *(void *)(v34 + 40);
    swift_beginAccess(v28 + 40, v78, 0LL, 0LL);
    uint64_t v37 = *(void *)(v28 + 40);
    uint64_t v73 = v29;
    if (!((unint64_t)v37 >> 62))
    {
      uint64_t v38 = *(void *)((v37 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      swift_bridgeObjectRetain_n(v37, 2LL);
      swift_bridgeObjectRetain(v35);
      if (!v38) {
        goto LABEL_30;
      }
      goto LABEL_18;
    }

    if (v37 < 0) {
      uint64_t v63 = *(void *)(v28 + 40);
    }
    else {
      uint64_t v63 = v37 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain_n(v37, 2LL);
    swift_bridgeObjectRetain(v35);
    uint64_t v38 = _CocoaArrayWrapper.endIndex.getter(v63);
    if (!v38)
    {
LABEL_30:
      swift_bridgeObjectRelease_n(v37, 2LL);
      swift_bridgeObjectRelease(v35);
      uint64_t v3 = v75;
      uint64_t v28 = v76;
      uint64_t v29 = v73;
LABEL_31:
      uint64_t v51 = v99;
      sub_10006B22C(v29, v77, 1, v28, *(void *)(v3 + 16));
      if (!v51)
      {
        (*(void (**)(void *__return_ptr))(*(void *)(v28 + 24) + 16LL))(v92);
        sub_10002CC24(v92);
        sub_10002AACC((uint64_t)&v93, (uint64_t)v97, &qword_1000B9720);
        sub_10002AACC((uint64_t)v97, (uint64_t)v98, &qword_1000B9720);
        uint64_t v52 = v98[0];
        if (v98[0])
        {
          swift_beginAccess(v28 + 40, v79, 0LL, 0LL);
          uint64_t v53 = *(void *)(v28 + 40);
          uint64_t v99 = 0LL;
          if ((unint64_t)v53 >> 62)
          {
            if (v53 < 0) {
              uint64_t v62 = v53;
            }
            else {
              uint64_t v62 = v53 & 0xFFFFFFFFFFFFFF8LL;
            }
            swift_bridgeObjectRetain_n(v53, 3LL);
            uint64_t v54 = _CocoaArrayWrapper.endIndex.getter(v62);
            swift_bridgeObjectRelease(v53);
            if (v54) {
              goto LABEL_35;
            }
          }

          else
          {
            uint64_t v54 = *(void *)((v53 & 0xFFFFFFFFFFFFF8LL) + 0x10);
            swift_bridgeObjectRetain_n(v53, 2LL);
            if (v54)
            {
LABEL_35:
              uint64_t v55 = 4LL;
              do
              {
                uint64_t v56 = v55 - 4;
                if ((v53 & 0xC000000000000001LL) != 0)
                {
                  uint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)(v55 - 4, v53);
                  uint64_t v57 = result;
                  BOOL v58 = __OFADD__(v56, 1LL);
                  uint64_t v59 = v55 - 3;
                  if (v58) {
                    goto LABEL_66;
                  }
                }

                else
                {
                  uint64_t v57 = *(void *)(v53 + 8 * v55);
                  uint64_t result = swift_retain(v57);
                  BOOL v58 = __OFADD__(v56, 1LL);
                  uint64_t v59 = v55 - 3;
                  if (v58)
                  {
LABEL_66:
                    __break(1u);
                    goto LABEL_67;
                  }
                }

                if (*(void *)(v57 + 16) == v52)
                {
                  swift_release(v76);
                  swift_bridgeObjectRelease_n(v53, 2LL);
                  uint64_t v3 = v75;
                  *(void *)(v75 + 8) = v57;
                  sub_1000062D8(v87);
                  uint64_t v4 = v74;
                  goto LABEL_48;
                }

                swift_release(v57);
                ++v55;
              }

              while (v59 != v54);
            }
          }

          swift_bridgeObjectRelease_n(v53, 2LL);
          unint64_t v64 = sub_10002EA1C();
          uint64_t v65 = swift_allocError(&type metadata for ParserError, v64, 0LL, 0LL);
          *(void *)uint64_t v66 = 3LL;
          *(_OWORD *)(v66 + 8) = 0u;
          *(_OWORD *)(v66 + 24) = 0u;
          *(_OWORD *)(v66 + 40) = 0u;
          *(_OWORD *)(v66 + 56) = 0u;
          *(void *)(v66 + 72) = 0LL;
          *(_BYTE *)(v66 + 80) = 15;
          swift_willThrow(v65);
        }
      }

      return sub_1000062D8(v87);
    }

uint64_t sub_100069740(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(void *__return_ptr))(*(void *)(a2 + 24) + 16LL))(v38);
  sub_10002CC24(v38);
  sub_10002AACC((uint64_t)&v39, (uint64_t)v40, &qword_1000B9110);
  uint64_t result = sub_10002AACC((uint64_t)v40, (uint64_t)v41, &qword_1000B9110);
  if (!v42)
  {
    unint64_t v9 = sub_10006B9F8();
    uint64_t v35 = sub_10006A41C((uint64_t)&type metadata for GenerateCompletions, v9);
    uint64_t v36 = v10;
    uint64_t v37 = v11;
    sub_100068B8C(a1, v34);
    if (v4)
    {
      swift_errorRelease(v4);
    }

    else
    {
      uint64_t v12 = sub_100005104(&qword_1000B9528);
      if ((swift_dynamicCast(&v31, v34, v12, &type metadata for GenerateCompletions, 6LL) & 1) != 0)
      {
        uint64_t v13 = v31;
        uint64_t v14 = v32;
        char v15 = v33;
        __int128 v16 = sub_10006B05C(a3, a4);
        if ((v15 & 1) == 0)
        {
          uint64_t v17 = v16;
          unint64_t v18 = sub_10005134C();
          uint64_t v19 = swift_allocError(&type metadata for CommandError, v18, 0LL, 0LL);
          *(void *)uint64_t v20 = v17;
          *(void *)(v20 + 8) = v13;
          *(void *)(v20 + 16) = v14;
          *(_OWORD *)(v20 + 24) = 0u;
          *(_OWORD *)(v20 + 40) = 0u;
          *(_OWORD *)(v20 + 56) = 0u;
          *(_OWORD *)(v20 + 72) = 0u;
          *(_BYTE *)(v20 + 88) = 1;
          swift_willThrow(v19);
LABEL_12:
          swift_release(v35);
          swift_release(v36);
          return swift_bridgeObjectRelease(v37);
        }

        uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0x1000000000000246LL,  0x800000010009D5D0LL,  "ArgumentParser/Option.swift",  27LL,  2LL,  82LL,  0);
        goto LABEL_16;
      }
    }

    unint64_t v21 = sub_10006BA3C();
    uint64_t v31 = sub_10006A41C((uint64_t)&type metadata for AutodetectedGenerateCompletions, v21);
    uint64_t v32 = v22;
    uint64_t v33 = v23;
    sub_100068B8C(a1, v34);
    uint64_t v24 = sub_100005104(&qword_1000B9528);
    if ((swift_dynamicCast(&v29, v34, v24, &type metadata for AutodetectedGenerateCompletions, 6LL) & 1) == 0)
    {
LABEL_11:
      swift_release(v31);
      swift_release(v32);
      swift_bridgeObjectRelease(v33);
      goto LABEL_12;
    }

    if ((v30 & 1) == 0)
    {
      if ((v29 & 1) != 0)
      {
        __int128 v25 = sub_10006B05C(a3, a4);
        unint64_t v26 = sub_10005134C();
        uint64_t v27 = swift_allocError(&type metadata for CommandError, v26, 0LL, 0LL);
        *(void *)uint64_t v28 = v25;
        *(_OWORD *)(v28 + 8) = 0u;
        *(_OWORD *)(v28 + 24) = 0u;
        *(_OWORD *)(v28 + 40) = 0u;
        *(_OWORD *)(v28 + 56) = 0u;
        *(_OWORD *)(v28 + 72) = 0u;
        *(_BYTE *)(v28 + 88) = 1;
        swift_willThrow(v27);
      }

      goto LABEL_11;
    }

    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0x1000000000000246LL,  0x800000010009D5D0LL,  "ArgumentParser/Flag.swift",  25LL,  2LL,  103LL,  0);
LABEL_16:
    __break(1u);
  }

  return result;
}

unint64_t sub_100069A64()
{
  return 0xD000000000000018LL;
}

uint64_t sub_100069A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10006A030(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_100069AA8(uint64_t a1)
{
  unint64_t v2 = sub_10006C10C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100069AD0(uint64_t a1)
{
  unint64_t v2 = sub_10006C10C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100069AF8@<X0>(uint64_t a1@<X8>)
{
  char v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v2 = sub_10003F288((uint64_t)&off_1000AFB58);
  swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
  swift_arrayDestroy(&unk_1000AFB78, 1LL, &type metadata for NameSpecification.Element);
  uint64_t v3 = swift_allocObject(&unk_1000B2EB0, 97LL, 7LL);
  *(void *)(v3 + 16) = v2;
  uint64_t result = sub_10002AACC((uint64_t)v5, v3 + 24, &qword_1000B9158);
  *(_BYTE *)(v3 + 73) = 0;
  *(void *)(v3 + 80) = 0LL;
  *(void *)(v3 + 88) = 0LL;
  *(_BYTE *)(v3 + 96) = -1;
  *(void *)a1 = sub_10006BFFC;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

uint64_t sub_100069BCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100069D1C((uint64_t (*)(void))sub_10006A0B4, a1);
}

uint64_t sub_100069BE8(uint64_t a1)
{
  unint64_t v2 = sub_10006BF64();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100069C10(uint64_t a1)
{
  unint64_t v2 = sub_10006BF64();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100069C38@<X0>(uint64_t a1@<X8>)
{
  char v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v2 = sub_10003F288((uint64_t)&off_1000AFB90);
  swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
  swift_arrayDestroy(&unk_1000AFBB0, 1LL, &type metadata for NameSpecification.Element);
  uint64_t v3 = swift_allocObject(&unk_1000B2E88, 81LL, 7LL);
  *(void *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 24) = 0;
  uint64_t result = sub_10002AACC((uint64_t)v5, v3 + 32, &qword_1000B9158);
  *(void *)a1 = sub_1000398D4;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

uint64_t sub_100069D00@<X0>(uint64_t a1@<X8>)
{
  return sub_100069D1C((uint64_t (*)(void))sub_10006A268, a1);
}

uint64_t sub_100069D1C@<X0>(uint64_t (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result = a1();
  if (!v2)
  {
    *(void *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(_BYTE *)(a2 + 16) = v6 & 1;
  }

  return result;
}

uint64_t sub_100069D4C(uint64_t a1)
{
  uint64_t v2 = a1 + 56;
  uint64_t v3 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v4 = -1LL;
  if (v3 < 64) {
    uint64_t v4 = ~(-1LL << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 56);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v8 = 0LL;
  while (v5)
  {
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
    unint64_t v10 = v9 | (v8 << 6);
LABEL_22:
    uint64_t v14 = *(void *)(a1 + 48) + 24 * v10;
    if ((*(_BYTE *)(v14 + 17) & 1) == 0) {
      uint64_t result = sub_100074388(*(void *)v14, *(void *)(v14 + 8), *(_BYTE *)(v14 + 16) & 1);
    }
  }

  int64_t v11 = v8 + 1;
  if (__OFADD__(v8, 1LL))
  {
    __break(1u);
    goto LABEL_26;
  }

  if (v11 >= v6) {
    return swift_release(a1);
  }
  unint64_t v12 = *(void *)(v2 + 8 * v11);
  ++v8;
  if (v12) {
    goto LABEL_21;
  }
  int64_t v8 = v11 + 1;
  if (v11 + 1 >= v6) {
    return swift_release(a1);
  }
  unint64_t v12 = *(void *)(v2 + 8 * v8);
  if (v12) {
    goto LABEL_21;
  }
  int64_t v8 = v11 + 2;
  if (v11 + 2 >= v6) {
    return swift_release(a1);
  }
  unint64_t v12 = *(void *)(v2 + 8 * v8);
  if (v12) {
    goto LABEL_21;
  }
  int64_t v8 = v11 + 3;
  if (v11 + 3 >= v6) {
    return swift_release(a1);
  }
  unint64_t v12 = *(void *)(v2 + 8 * v8);
  if (v12)
  {
LABEL_21:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_22;
  }

  int64_t v13 = v11 + 4;
  if (v13 >= v6) {
    return swift_release(a1);
  }
  unint64_t v12 = *(void *)(v2 + 8 * v13);
  if (v12)
  {
    int64_t v8 = v13;
    goto LABEL_21;
  }

  while (1)
  {
    int64_t v8 = v13 + 1;
    if (__OFADD__(v13, 1LL)) {
      break;
    }
    if (v8 >= v6) {
      return swift_release(a1);
    }
    unint64_t v12 = *(void *)(v2 + 8 * v8);
    ++v13;
    if (v12) {
      goto LABEL_21;
    }
  }

uint64_t sub_100069EBC@<X0>(uint64_t a1@<X7>, void *a2@<X8>, uint64_t a3)
{
  *a2 = a1;
  a2[1] = a3;
  return swift_bridgeObjectRetain(a3);
}

void *sub_100069ED8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = _swiftEmptyArrayStorage;
  uint64_t v20 = _swiftEmptyArrayStorage;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = a1 + 32;
    do
    {
      sub_10005C00C((_OWORD *)(v6 + 56 * v5), v18);
      uint64_t v7 = *(void *)(a2 + 16);
      uint64_t v8 = *(void *)(v7 + 16);
      if (v8)
      {
        unint64_t v9 = (void *)(v7 + 32);
        while (*v9 != *(void *)&v18[0])
        {
          v9 += 7;
          if (!--v8) {
            goto LABEL_9;
          }
        }

        sub_10005C058((uint64_t)v18);
      }

      else
      {
LABEL_9:
        __int128 v14 = v18[0];
        __int128 v15 = v18[1];
        __int128 v16 = v18[2];
        uint64_t v17 = v19;
        if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
          sub_10004FE9C(0LL, v2[2] + 1LL, 1);
        }
        uint64_t v2 = v20;
        unint64_t v11 = v20[2];
        unint64_t v10 = v20[3];
        if (v11 >= v10 >> 1)
        {
          sub_10004FE9C((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v2 = v20;
        }

        v2[2] = v11 + 1;
        unint64_t v12 = &v2[7 * v11];
        *((_OWORD *)v12 + 2) = v14;
        *((_OWORD *)v12 + 3) = v15;
        *((_OWORD *)v12 + 4) = v16;
        v12[10] = v17;
      }

      ++v5;
    }

    while (v5 != v3);
  }

  return v2;
}

uint64_t sub_10006A030(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000018LL && a2 == 0x800000010009DB30LL)
  {
    swift_bridgeObjectRelease(0x800000010009DB30LL);
    char v3 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000018LL, 0x800000010009DB30LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    char v3 = v4 ^ 1;
  }

  return v3 & 1;
}

void *sub_10006A0B4(void *a1)
{
  uint64_t v3 = sub_100005104(&qword_1000B9C40);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = &_swiftEmptySetSingleton;
  uint64_t v7 = sub_10003F288((uint64_t)&off_1000AFD60);
  swift_bridgeObjectRelease(v17);
  swift_arrayDestroy(&unk_1000AFD80, 1LL, &type metadata for NameSpecification.Element);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  unint64_t v10 = sub_100006270(a1, v8);
  unint64_t v11 = sub_10006C10C();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for GenerateCompletions.CodingKeys,  &type metadata for GenerateCompletions.CodingKeys,  v11,  v8,  v9);
  if (v1)
  {
    swift_bridgeObjectRelease(v7);
    sub_1000062D8(a1);
  }

  else
  {
    uint64_t v12 = sub_100005104(&qword_1000B9C50);
    uint64_t v13 = sub_1000062F8(&qword_1000B9C58, &qword_1000B9C50, (uint64_t)&protocol conformance descriptor for Option<A>);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v17, v12, v14, v3, v12, v13);
    swift_bridgeObjectRelease(v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    unint64_t v10 = v17;
    sub_1000062D8(a1);
  }

  return v10;
}

void *sub_10006A268(void *a1)
{
  uint64_t v3 = sub_100005104(&qword_1000B9C20);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = &_swiftEmptySetSingleton;
  uint64_t v7 = sub_10003F288((uint64_t)&off_1000AFD98);
  swift_bridgeObjectRelease(v17);
  swift_arrayDestroy(&unk_1000AFDB8, 1LL, &type metadata for NameSpecification.Element);
  uint64_t v8 = a1[3];
  uint64_t v9 = a1[4];
  unint64_t v10 = sub_100006270(a1, v8);
  unint64_t v11 = sub_10006BF64();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for AutodetectedGenerateCompletions.CodingKeys,  &type metadata for AutodetectedGenerateCompletions.CodingKeys,  v11,  v8,  v9);
  if (v1)
  {
    swift_bridgeObjectRelease(v7);
    sub_1000062D8(a1);
  }

  else
  {
    uint64_t v12 = sub_100005104(&qword_1000B9C30);
    uint64_t v13 = sub_1000062F8(&qword_1000B9C38, &qword_1000B9C30, (uint64_t)&protocol conformance descriptor for Flag<A>);
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v17, v12, v14, v3, v12, v13);
    swift_bridgeObjectRelease(v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    unint64_t v10 = v17;
    sub_1000062D8(a1);
  }

  return v10;
}

void *sub_10006A41C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_10008C87C(a1, a2);
  uint64_t v3 = v2 + 5;
  swift_beginAccess(v2 + 5, &v18, 0LL, 0LL);
  uint64_t v4 = v2[5];
  if ((unint64_t)v4 >> 62)
  {
    if (v4 < 0) {
      uint64_t v15 = v2[5];
    }
    else {
      uint64_t v15 = v4 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_retain_n(v2, 2LL);
    swift_bridgeObjectRetain(v4);
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(v4);
    uint64_t v6 = v2;
    if (!v16) {
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_retain_n(v2, 2LL);
    uint64_t v6 = v2;
    if (!v5) {
      goto LABEL_6;
    }
  }

  unint64_t v7 = sub_10002D6E0();
  uint64_t v8 = sub_100005104(&qword_1000B98E0);
  uint64_t v6 = (void *)swift_allocObject(v8, 48LL, 7LL);
  uint64_t v9 = swift_weakInit(v6 + 4, 0LL);
  v6[2] = &type metadata for HelpCommand;
  v6[3] = v7;
  swift_weakAssign(v9, 0LL);
  v6[5] = _swiftEmptyArrayStorage;
  swift_beginAccess(v3, &v17, 33LL, 0LL);
  uint64_t v10 = swift_retain(v6);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v10);
  unint64_t v12 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v11 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v12 >= v11 >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1LL);
  }
  uint64_t v13 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v12, v6);
  specialized Array._endMutation()(v13);
  swift_endAccess(&v17);
  swift_weakAssign(v6 + 4, v2);
  swift_release(v2);
LABEL_6:
  swift_release(v6);
  return v2;
}

uint64_t sub_10006A740(uint64_t result, uint64_t *a2)
{
  unint64_t v5 = v2;
  unint64_t v6 = *(void *)(result + 16);
  if (v6)
  {
    uint64_t v8 = result;
    uint64_t v9 = result;
    uint64_t v10 = *(void *)(result + 32);
    uint64_t v11 = *(void *)(v9 + 40);
    uint64_t v12 = v9 + 32;
    BOOL v13 = v10 == 0x6C706D6F632D2D2DLL && v11 == 0xED00006E6F697465LL;
    if (v13
      || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)( v10,  v11,  0x6C706D6F632D2D2DLL,  0xED00006E6F697465LL,  0LL),  (result & 1) != 0))
    {
      uint64_t v87 = v8;
      swift_bridgeObjectRetain(v8);
      swift_retain(a2);
      if (v6 == 1)
      {
LABEL_8:
        uint64_t v15 = (uint64_t)a2;
LABEL_9:
        unint64_t v16 = sub_10002EA1C();
        uint64_t v17 = swift_allocError(&type metadata for ParserError, v16, 0LL, 0LL);
        *(void *)uint64_t v18 = 3LL;
        *(_OWORD *)(v18 + 8) = 0u;
        *(_OWORD *)(v18 + 24) = 0u;
        *(_OWORD *)(v18 + 40) = 0u;
        *(_OWORD *)(v18 + 56) = 0u;
        *(void *)(v18 + 72) = 0LL;
        *(_BYTE *)(v18 + 80) = 15;
        swift_willThrow(v17);
        swift_unknownObjectRelease(v87);
        uint64_t v19 = v15;
        return swift_release(v19);
      }

      uint64_t v84 = v12;
      uint64_t v20 = 1LL;
      unint64_t v85 = v6;
      while (2)
      {
        if (v20 == v6)
        {
          __break(1u);
        }

        else
        {
          unint64_t v21 = (unint64_t *)(v12 + 16 * v20);
          unint64_t v5 = *v21;
          unint64_t v22 = v21[1];
          uint64_t v88 = a2;
          unint64_t v89 = v20 + 1;
          BOOL v23 = *v21 == 11565 && v22 == 0xE200000000000000LL;
          if (!v23
            && (_stringCompareWithSmolCheck(_:_:expecting:)(v5, v22, 11565LL, 0xE200000000000000LL, 0LL) & 1) == 0)
          {
            swift_beginAccess(a2 + 5, v96, 0LL, 0LL);
            unint64_t v4 = a2[5];
            if (v4 >> 62)
            {
              if ((v4 & 0x8000000000000000LL) != 0LL) {
                uint64_t v33 = a2[5];
              }
              else {
                uint64_t v33 = v4 & 0xFFFFFFFFFFFFFF8LL;
              }
              swift_bridgeObjectRetain_n(a2[5], 3LL);
              swift_bridgeObjectRetain(v22);
              uint64_t v24 = _CocoaArrayWrapper.endIndex.getter(v33);
              swift_bridgeObjectRelease(v4);
              if (v24)
              {
LABEL_19:
                uint64_t v86 = v89;
                unint64_t v121 = v4 & 0xC000000000000001LL;
                uint64_t v25 = 4LL;
                while (1)
                {
                  uint64_t v26 = v25 - 4;
                  if (v121)
                  {
                    uint64_t v15 = specialized _ArrayBuffer._getElementSlowPath(_:)(v25 - 4, v4);
                    uint64_t v27 = v25 - 3;
                    if (__OFADD__(v26, 1LL)) {
                      goto LABEL_63;
                    }
                  }

                  else
                  {
                    uint64_t v15 = *(void *)(v4 + 8 * v25);
                    swift_retain(v15);
                    uint64_t v27 = v25 - 3;
                    if (__OFADD__(v26, 1LL))
                    {
LABEL_63:
                      __break(1u);
                      goto LABEL_64;
                    }
                  }

                  uint64_t v28 = (*(uint64_t (**)(void))(*(void *)(v15 + 24) + 24LL))();
                  if (v28 == v5 && v29 == v22)
                  {
                    swift_bridgeObjectRelease(v4);
                    unint64_t v32 = v22;
                    goto LABEL_34;
                  }

                  uint64_t v31 = v29;
                  uint64_t v3 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v5, v22, 0LL);
                  swift_bridgeObjectRelease(v31);
                  if ((v3 & 1) != 0) {
                    break;
                  }
                  swift_release(v15);
                  ++v25;
                  if (v27 == v24) {
                    goto LABEL_40;
                  }
                }

                unint64_t v32 = v4;
LABEL_34:
                uint64_t v12 = v84;
                swift_bridgeObjectRelease(v4);
                swift_bridgeObjectRelease(v32);
                swift_release(v88);
                swift_bridgeObjectRelease(v22);
                a2 = (uint64_t *)v15;
                unint64_t v6 = v85;
                uint64_t v20 = v89;
                if (v89 != v85) {
                  continue;
                }
                goto LABEL_9;
              }
            }

            else
            {
              uint64_t v24 = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10);
              swift_bridgeObjectRetain_n(a2[5], 2LL);
              swift_bridgeObjectRetain(v22);
              if (v24) {
                goto LABEL_19;
              }
            }

LABEL_73:
          swift_release(v41);
          unint64_t v79 = sub_10002EA1C();
          uint64_t v80 = swift_allocError(&type metadata for ParserError, v79, 0LL, 0LL);
          *(void *)uint64_t v81 = 3LL;
          *(_OWORD *)(v81 + 8) = 0u;
          *(_OWORD *)(v81 + 24) = 0u;
          *(_OWORD *)(v81 + 40) = 0u;
          *(_OWORD *)(v81 + 56) = 0u;
          *(void *)(v81 + 72) = 0LL;
          *(_BYTE *)(v81 + 80) = 15;
          swift_willThrow(v80);
          swift_unknownObjectRelease(v52);
          uint64_t v19 = (uint64_t)v53;
          return swift_release(v19);
        }

        if ((_DWORD)v47 != 1)
        {
          swift_bridgeObjectRelease(v121);
          swift_bridgeObjectRelease(v42);
          swift_release(v41);
          goto LABEL_41;
        }

        swift_bridgeObjectRetain(v5);
        uint64_t v48 = sub_10005141C(v3, v5);
        unint64_t v89 = (unint64_t)v41;
        uint64_t v86 = v42;
        if (!v49)
        {
LABEL_64:
          uint64_t v56 = v3;
          uint64_t v57 = v5;
          goto LABEL_67;
        }

        uint64_t v50 = v49;
        if (v48 == 95 && v49 == 0xE100000000000000LL)
        {
          swift_bridgeObjectRelease(0xE100000000000000LL);
        }

        else
        {
          char v58 = _stringCompareWithSmolCheck(_:_:expecting:)(v48, v49, 95LL, 0xE100000000000000LL, 0LL);
          swift_bridgeObjectRelease(v50);
          uint64_t v56 = v3;
          uint64_t v57 = v5;
          if ((v58 & 1) == 0) {
            goto LABEL_67;
          }
        }

        unint64_t v59 = sub_100033710(1uLL, v3, v5);
        uint64_t v61 = v60;
        uint64_t v63 = v62;
        uint64_t v65 = v64;
        sub_100066ED8(v3, v5, v4, v15, v25);
        uint64_t v56 = static String._fromSubstring(_:)(v59, v61, v63, v65);
        uint64_t v57 = v66;
        swift_bridgeObjectRelease(v65);
LABEL_67:
        swift_bridgeObjectRetain(v57);
        unint64_t v67 = v121;
        sub_100067BB4(v86, v121, v56, v57, _swiftEmptyArrayStorage, (uint64_t)v90);
        swift_bridgeObjectRelease(v57);
        sub_10002AACC((uint64_t)v90, (uint64_t)v91, &qword_1000B9148);
        swift_bridgeObjectRelease(v67);
        swift_bridgeObjectRelease(v86);
        sub_100066ED8(v3, v5, v4, v15, v25);
        sub_10002AACC((uint64_t)v91, (uint64_t)v92, &qword_1000B9148);
        uint64_t v52 = v87;
        uint64_t v53 = v88;
        uint64_t v41 = (void *)v89;
        if (sub_100033CB4((uint64_t)v92) != 1)
        {
          uint64_t v68 = v93;
          uint64_t v54 = v94;
          int v69 = v95;
          sub_10002D820((uint64_t)v93, v94, v95);
          sub_100033CCC((uint64_t)v91);
          if (v69 == 3)
          {
            uint64_t v55 = v68(v89);
            goto LABEL_70;
          }

          sub_10002D9A0((uint64_t)v68, v54, v69);
        }

        goto LABEL_73;
      }

      swift_bridgeObjectRelease(v46);
      __break(1u);
LABEL_77:
      __break(1u);
      goto LABEL_78;
    }
  }

  return result;
}

char *sub_10006B05C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  if (v3)
  {
    unint64_t v5 = (_OWORD *)(a2 + 32);
    swift_bridgeObjectRetain(a2);
    unint64_t v6 = (char *)_swiftEmptyArrayStorage;
    do
    {
      sub_10005C00C(v5, v21);
      uint64_t v8 = *(void *)&v21[0];
      uint64_t v9 = swift_conformsToProtocol2(*(void *)&v21[0], &protocol descriptor for ParsableCommand);
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0LL;
      }
      if (v9) {
        uint64_t v11 = v8;
      }
      else {
        uint64_t v11 = 0LL;
      }
      sub_10005C058((uint64_t)v21);
      if (v11)
      {
        if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0) {
          unint64_t v6 = sub_100057FEC(0LL, *((void *)v6 + 2) + 1LL, 1, v6);
        }
        unint64_t v13 = *((void *)v6 + 2);
        unint64_t v12 = *((void *)v6 + 3);
        if (v13 >= v12 >> 1) {
          unint64_t v6 = sub_100057FEC((char *)(v12 > 1), v13 + 1, 1, v6);
        }
        *((void *)v6 + 2) = v13 + 1;
        unint64_t v7 = &v6[16 * v13];
        *((void *)v7 + 4) = v11;
        *((void *)v7 + 5) = v10;
      }

      unint64_t v5 = (_OWORD *)((char *)v5 + 56);
      --v3;
    }

    while (v3);
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    unint64_t v6 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = *((void *)v6 + 2);
  if (!v14 || *(void *)(a1 + 16) != *(void *)&v6[16 * v14 + 16])
  {
    __int128 v20 = *(_OWORD *)(a1 + 16);
    uint64_t v15 = swift_bridgeObjectRetain(v6);
    unint64_t v16 = v6;
    if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0) {
      unint64_t v16 = sub_100057FEC(0LL, v14 + 1, 1, v6);
    }
    unint64_t v18 = *((void *)v16 + 2);
    unint64_t v17 = *((void *)v16 + 3);
    if (v18 >= v17 >> 1) {
      unint64_t v16 = sub_100057FEC((char *)(v17 > 1), v18 + 1, 1, v16);
    }
    *((void *)v16 + 2) = v18 + 1;
    *(_OWORD *)&v16[16 * v18 + 32] = v20;
    swift_bridgeObjectRelease(v6);
    return v16;
  }

  return v6;
}

uint64_t sub_10006B22C(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a2;
  uint64_t v6 = result;
  if ((a3 & 1) != 0)
  {
    uint64_t v7 = *(void *)(result + 16);
    BOOL v8 = v7 < a2;
    uint64_t v9 = v7 - a2;
    if (v8)
    {
LABEL_99:
      __break(1u);
      goto LABEL_100;
    }

    if (a2 < 0)
    {
LABEL_100:
      __break(1u);
      return result;
    }

    if (v9 != 1) {
      return result;
    }
  }

  uint64_t v10 = sub_10006B05C(a4, a5);
  uint64_t v66 = sub_100032880(0, (uint64_t)v10);
  uint64_t result = swift_bridgeObjectRelease(v10);
  uint64_t v63 = v6;
  uint64_t v11 = *(void *)(v6 + 16);
  if (v11 < v5)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }

  if (v5 < 0)
  {
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }

  uint64_t v73 = v6 + 32;
  uint64_t v68 = v11;
  uint64_t v69 = v5;
  if (v11 != v5)
  {
    uint64_t v20 = v5;
    while (v20 < v11)
    {
      unint64_t v21 = (uint64_t *)(v73 + (v20 << 6));
      uint64_t v22 = v21[2];
      if ((v22 & 0x6000000000000000LL) == 0)
      {
        uint64_t v23 = *(void *)(v66 + 16);
        if (v23)
        {
          uint64_t v24 = *v21;
          uint64_t v25 = v21[1];
          int v26 = v22 & 0xC0;
          uint64_t v27 = (unsigned __int8 *)(v66 + 48);
          do
          {
            uint64_t result = *((void *)v27 - 2);
            uint64_t v28 = *((void *)v27 - 1);
            unsigned int v29 = *v27;
            if (v29 >> 6)
            {
              if (v29 >> 6 == 1)
              {
                if (v26 == 64)
                {
                  if (result == v24 && v28 == v25)
                  {
                  }

                  else
                  {
                    uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v28, v24, v25, 0LL);
                  }
                }

                goto LABEL_24;
              }

              if (v26 != 128) {
                goto LABEL_24;
              }
            }

            else if (v22 >= 0x40u)
            {
              goto LABEL_24;
            }

            BOOL v31 = result == v24 && v28 == v25;
            if (v31
              || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v28, v24, v25, 0LL), (result & 1) != 0))
            {
LABEL_43:
              swift_bridgeObjectRelease(v66);
              unint64_t v32 = sub_10006B8B4();
              uint64_t v33 = swift_allocError(&type metadata for HelpRequested, v32, 0LL, 0LL);
              *unint64_t v34 = 0;
              return swift_willThrow(v33);
            }

LABEL_51:
      v42 += 24;
      if (!--v38) {
        goto LABEL_45;
      }
    }
  }

  swift_bridgeObjectRelease(v13);
LABEL_10:
  uint64_t v14 = sub_10006B05C(a4, a5);
  uint64_t v15 = v14;
  uint64_t v16 = *((void *)v14 + 2);
  if (!v16) {
    return swift_bridgeObjectRelease(v15);
  }
  for (uint64_t i = v14 + 40; ; i += 16)
  {
    (*(void (**)(void *__return_ptr))(*(void *)i + 16LL))(v70);
    __int128 v72 = v71;
    __int128 v18 = v71;
    swift_bridgeObjectRetain(*((void *)&v71 + 1));
    sub_10002CC24(v70);
    sub_100030564((uint64_t)&v72);
    uint64_t v19 = HIBYTE(*((void *)&v18 + 1)) & 0xFLL;
    if ((*((void *)&v18 + 1) & 0x2000000000000000LL) == 0) {
      uint64_t v19 = v18 & 0xFFFFFFFFFFFFLL;
    }
    if (v19) {
      break;
    }
    if (!--v16) {
      return swift_bridgeObjectRelease(v15);
    }
  }

  uint64_t result = swift_bridgeObjectRelease(v15);
  if (v11 != v5)
  {
    uint64_t v49 = (void *)(v63 + (v5 << 6) + 48);
    while (v5 < v11)
    {
      if ((*v49 & 0x60000000000000C0LL) == 0)
      {
        uint64_t v50 = *(v49 - 2);
        uint64_t v51 = *(v49 - 1);
        BOOL v52 = v50 == 0x6E6F6973726576LL && v51 == 0xE700000000000000LL;
        if (v52
          || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)( v50,  v51,  0x6E6F6973726576LL,  0xE700000000000000LL,  0LL),  (result & 1) != 0))
        {
          uint64_t v53 = sub_10006B05C(a4, a5);
          unint64_t v54 = sub_10005134C();
          uint64_t v33 = swift_allocError(&type metadata for CommandError, v54, 0LL, 0LL);
          *(void *)uint64_t v55 = v53;
          *(_OWORD *)(v55 + 8) = 0u;
          *(_OWORD *)(v55 + 24) = 0u;
          *(_OWORD *)(v55 + 40) = 0u;
          *(_OWORD *)(v55 + 56) = 0u;
          *(_OWORD *)(v55 + 72) = 0u;
          goto LABEL_92;
        }
      }

      ++v5;
      v49 += 8;
      if (v11 == v5) {
        return result;
      }
    }

    goto LABEL_98;
  }

  return result;
}

uint64_t sub_10006B7E0()
{
  return swift_deallocObject(v0, 73LL, 7LL);
}

uint64_t sub_10006B81C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_retain(a2);
  }
  else {
    return swift_bridgeObjectRetain(a1);
  }
}

uint64_t sub_10006B82C(uint64_t a1)
{
  uint64_t v2 = sub_100005104(&qword_1000B9BC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10006B86C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005104(&qword_1000B9BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_10006B8B4()
{
  unint64_t result = qword_1000B9BD0;
  if (!qword_1000B9BD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A014, &type metadata for HelpRequested);
    atomic_store(result, (unint64_t *)&qword_1000B9BD0);
  }

  return result;
}

uint64_t sub_10006B8F8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10006B948( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a6 & 0x7FFFFFFFFFFFFF3ELL) != 0x7FFFFFF3ELL) {
    return sub_100066ED8(a4, a5, a6, a7, a8);
  }
  return result;
}

unint64_t sub_10006B97C()
{
  unint64_t result = qword_1000B9BE0;
  if (!qword_1000B9BE0)
  {
    uint64_t v1 = type metadata accessor for ArgumentDecoder();
    unint64_t result = swift_getWitnessTable(&unk_1000994FC, v1);
    atomic_store(result, (unint64_t *)&qword_1000B9BE0);
  }

  return result;
}

void *sub_10006B9C4(void *result)
{
  uint64_t v1 = *(void *)(result[3] - 8LL);
  if ((*(_DWORD *)(v1 + 80) & 0x20000) != 0) {
    return (void *)swift_slowDealloc( *result,  *(void *)(v1 + 64)
  }
                     + ((*(_DWORD *)(v1 + 80) + 16LL) & ~(unint64_t)*(_DWORD *)(v1 + 80)),
                       *(_DWORD *)(v1 + 80) | 7LL);
  return result;
}

unint64_t sub_10006B9F8()
{
  unint64_t result = qword_1000B9BE8;
  if (!qword_1000B9BE8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100099FF8, &type metadata for GenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9BE8);
  }

  return result;
}

unint64_t sub_10006BA3C()
{
  unint64_t result = qword_1000B9BF0;
  if (!qword_1000B9BF0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100099FDC, &type metadata for AutodetectedGenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9BF0);
  }

  return result;
}

uint64_t sub_10006BA80(uint64_t a1)
{
  return a1;
}

uint64_t sub_10006BAB0(uint64_t a1)
{
  return a1;
}

void sub_10006BAE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!qword_1000B9BF8)
  {
    unint64_t v4 = _s19InitializationErrorOMa(0LL, a2, a3, a4);
    if (!v5) {
      atomic_store(v4, (unint64_t *)&qword_1000B9BF8);
    }
  }

uint64_t initializeBufferWithCopyOfBuffer for AutodetectedGenerateCompletions( uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_10006BB9C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_100003B00);
}

uint64_t destroy for AutodetectedGenerateCompletions(uint64_t a1)
{
  return sub_100003C60(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t *assignWithCopy for AutodetectedGenerateCompletions(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_10006BBF8( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t))sub_100003B00,  (void (*)(uint64_t, uint64_t, uint64_t))sub_100003C60);
}

uint64_t *assignWithTake for AutodetectedGenerateCompletions(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_10006BC64(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_100003C60);
}

ValueMetadata *type metadata accessor for AutodetectedGenerateCompletions()
{
  return &type metadata for AutodetectedGenerateCompletions;
}

uint64_t initializeBufferWithCopyOfBuffer for GenerateCompletions(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_10006BB9C(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_100003AF0);
}

uint64_t destroy for GenerateCompletions(uint64_t a1)
{
  return sub_100003C50(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10006BB9C(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for GenerateCompletions(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_10006BBF8( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t))sub_100003AF0,  (void (*)(uint64_t, uint64_t, uint64_t))sub_100003C50);
}

uint64_t *sub_10006BBF8( uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  uint64_t v12 = *((unsigned __int8 *)a1 + 16);
  *a1 = v7;
  a1[1] = v8;
  *((_BYTE *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for GenerateCompletions(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_10006BC64(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_100003C50);
}

uint64_t *sub_10006BC64( uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5 = *(_BYTE *)(a2 + 16);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_BYTE *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

ValueMetadata *type metadata accessor for GenerateCompletions()
{
  return &type metadata for GenerateCompletions;
}

uint64_t storeEnumTagSinglePayload for HelpRequested(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_10006BD04 + 4 * byte_100099E99[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10006BD38 + 4 * byte_100099E94[v4]))();
}

uint64_t sub_10006BD38(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10006BD40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10006BD48LL);
  }
  return result;
}

uint64_t sub_10006BD54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10006BD5CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_10006BD60(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10006BD68(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HelpRequested()
{
  return &type metadata for HelpRequested;
}

unint64_t sub_10006BD84(uint64_t a1)
{
  unint64_t result = sub_10006BDA8();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10006BDA8()
{
  unint64_t result = qword_1000B9C00;
  if (!qword_1000B9C00)
  {
    unint64_t result = swift_getWitnessTable(&unk_100099F54, &type metadata for GenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9C00);
  }

  return result;
}

unint64_t sub_10006BDEC(uint64_t a1)
{
  unint64_t result = sub_10006BE10();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10006BE10()
{
  unint64_t result = qword_1000B9C08;
  if (!qword_1000B9C08)
  {
    unint64_t result = swift_getWitnessTable(&unk_100099F98, &type metadata for AutodetectedGenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9C08);
  }

  return result;
}

unint64_t sub_10006BE54(uint64_t a1)
{
  unint64_t result = sub_10006BE78();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10006BE78()
{
  unint64_t result = qword_1000B9C10;
  if (!qword_1000B9C10)
  {
    unint64_t result = swift_getWitnessTable(&unk_100099FC0, &type metadata for AutodetectedGenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9C10);
  }

  return result;
}

unint64_t sub_10006BEBC(uint64_t a1)
{
  unint64_t result = sub_10006BEE0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10006BEE0()
{
  unint64_t result = qword_1000B9C18;
  if (!qword_1000B9C18)
  {
    unint64_t result = swift_getWitnessTable(&unk_100099F7C, &type metadata for GenerateCompletions);
    atomic_store(result, (unint64_t *)&qword_1000B9C18);
  }

  return result;
}

uint64_t sub_10006BF24()
{
  uint64_t v1 = v0[5];
  if (v1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(v0[7]);
    swift_bridgeObjectRelease(v0[9]);
  }

  return swift_deallocObject(v0, 81LL, 7LL);
}

unint64_t sub_10006BF64()
{
  unint64_t result = qword_1000B9C28;
  if (!qword_1000B9C28)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A220, &type metadata for AutodetectedGenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C28);
  }

  return result;
}

uint64_t sub_10006BFA8()
{
  uint64_t v1 = *(void *)(v0 + 32);
  if (v1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(*(void *)(v0 + 48));
    swift_bridgeObjectRelease(*(void *)(v0 + 64));
  }

  int v2 = *(unsigned __int8 *)(v0 + 96);
  if (v2 != 255) {
    sub_10002D9A0(*(void *)(v0 + 80), *(void *)(v0 + 88), v2);
  }
  return swift_deallocObject(v0, 97LL, 7LL);
}

uint64_t sub_10006BFFC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  return sub_1000678F4( a1,  a2,  a3,  *(void *)(v3 + 16),  (uint64_t *)(v3 + 24),  *(_BYTE *)(v3 + 73),  *(void *)(v3 + 80),  *(void *)(v3 + 88),  *(_BYTE *)(v3 + 96));
}

uint64_t sub_10006C030()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

void *sub_10006C064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100079BE4( a1,  a2,  a3,  a4,  a5,  a6,  a7,  *(void *(**)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16),  *(void *)(v7 + 24),  *(void *)(v7 + 32),  *(void *)(v7 + 40),  *(void *)(v7 + 48));
}

uint64_t sub_10006C094()
{
  unint64_t v1 = v0[2];
  if (v1 >= 2) {
    swift_bridgeObjectRelease(v1);
  }
  swift_bridgeObjectRelease(v0[4]);
  swift_bridgeObjectRelease(v0[6]);
  swift_bridgeObjectRelease(v0[7]);
  return swift_deallocObject(v0, 64LL, 7LL);
}

uint64_t sub_10006C0D8(uint64_t a1, uint64_t a2)
{
  return sub_100079F3C(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_10006C0F8(uint64_t result, uint64_t a2, char a3)
{
  if (a3 != -1) {
    return sub_10002D9A0(result, a2, a3);
  }
  return result;
}

unint64_t sub_10006C10C()
{
  unint64_t result = qword_1000B9C48;
  if (!qword_1000B9C48)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A1D0, &type metadata for GenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C48);
  }

  return result;
}

ValueMetadata *type metadata accessor for GenerateCompletions.CodingKeys()
{
  return &type metadata for GenerateCompletions.CodingKeys;
}

uint64_t _s14ArgumentParser19GenerateCompletionsV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_10006C1A8 + 4 * byte_100099E9E[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_10006C1C8 + 4 * byte_100099EA3[v4]))();
  }
}

_BYTE *sub_10006C1A8(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_10006C1C8(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10006C1D0(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10006C1D8(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_10006C1E0(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_10006C1E8(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AutodetectedGenerateCompletions.CodingKeys()
{
  return &type metadata for AutodetectedGenerateCompletions.CodingKeys;
}

unint64_t sub_10006C208()
{
  unint64_t result = qword_1000B9C60;
  if (!qword_1000B9C60)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A0F0, &type metadata for AutodetectedGenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C60);
  }

  return result;
}

unint64_t sub_10006C250()
{
  unint64_t result = qword_1000B9C68;
  if (!qword_1000B9C68)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A1A8, &type metadata for GenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C68);
  }

  return result;
}

unint64_t sub_10006C298()
{
  unint64_t result = qword_1000B9C70;
  if (!qword_1000B9C70)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A118, &type metadata for GenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C70);
  }

  return result;
}

unint64_t sub_10006C2E0()
{
  unint64_t result = qword_1000B9C78;
  if (!qword_1000B9C78)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A140, &type metadata for GenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C78);
  }

  return result;
}

unint64_t sub_10006C328()
{
  unint64_t result = qword_1000B9C80;
  if (!qword_1000B9C80)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A060, &type metadata for AutodetectedGenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C80);
  }

  return result;
}

unint64_t sub_10006C370()
{
  unint64_t result = qword_1000B9C88;
  if (!qword_1000B9C88)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A088, &type metadata for AutodetectedGenerateCompletions.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9C88);
  }

  return result;
}

void sub_10006C3BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Swift::UInt v8 = *(void *)(a4 + 16);
  Hasher._combine(_:)(v8);
  if (v8)
  {
    swift_bridgeObjectRetain(a4);
    uint64_t v9 = (void *)(a4 + 40);
    do
    {
      uint64_t v10 = *(v9 - 1);
      uint64_t v11 = *v9;
      swift_bridgeObjectRetain(*v9);
      String.hash(into:)(a1, v10, v11);
      swift_bridgeObjectRelease(v11);
      v9 += 2;
      --v8;
    }

    while (v8);
    swift_bridgeObjectRelease(a4);
  }

Swift::Int sub_10006C478()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  Hasher.init(_seed:)(v5, 0LL);
  sub_10006C3BC((uint64_t)v5, v1, v2, v3);
  return Hasher._finalize()();
}

void sub_10006C4D0(uint64_t a1)
{
}

Swift::Int sub_10006C4DC(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  Hasher.init(_seed:)(v6, a1);
  sub_10006C3BC((uint64_t)v6, v2, v3, v4);
  return Hasher._finalize()();
}

uint64_t sub_10006C530(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = (void *)a1[2];
  uint64_t v7 = a2[1];
  Swift::UInt v8 = (void *)a2[2];
  BOOL v9 = v4 == *a2 && v5 == v7;
  if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *a2, v7, 0LL) & 1) != 0) {
    return sub_100057670(v6, v8);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10006C590(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = swift_bridgeObjectRetain(a3);
  if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0) {
    a3 = sub_100057AB8(0LL, *((void *)a3 + 2) + 1LL, 1, a3);
  }
  unint64_t v8 = *((void *)a3 + 2);
  unint64_t v7 = *((void *)a3 + 3);
  if (v8 >= v7 >> 1) {
    a3 = sub_100057AB8((char *)(v7 > 1), v8 + 1, 1, a3);
  }
  *((void *)a3 + 2) = v8 + 1;
  BOOL v9 = &a3[16 * v8];
  *((void *)v9 + 4) = a1;
  *((void *)v9 + 5) = a2;
  swift_bridgeObjectRelease(a2);
  uint64_t v10 = sub_100005104(&qword_1000B90C8);
  unint64_t v11 = sub_10005EC18();
  uint64_t v12 = BidirectionalCollection<>.joined(separator:)(46LL, 0xE100000000000000LL, v10, v11);
  swift_bridgeObjectRelease(a3);
  return v12;
}

uint64_t sub_10006C694()
{
  return sub_10006C590(*(void *)v0, *(void *)(v0 + 8), *(char **)(v0 + 16));
}

uint64_t sub_10006C6A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a3 - 8);
  __chkstk_darwin(a1);
  BOOL v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v7 + 32))(v9);
  uint64_t v10 = dispatch thunk of CodingKey.stringValue.getter(a3, a4);
  uint64_t v12 = v10;
  int64_t v13 = *(void *)(a2 + 16);
  if (v13)
  {
    uint64_t v25 = v11;
    uint64_t v26 = v10;
    uint64_t v28 = v7;
    unint64_t v32 = _swiftEmptyArrayStorage;
    sub_10004FDF4(0LL, v13, 0);
    uint64_t v27 = a2;
    uint64_t v14 = a2 + 32;
    uint64_t v15 = v32;
    do
    {
      sub_100033F10(v14, (uint64_t)v29);
      uint64_t v16 = v30;
      uint64_t v17 = v31;
      sub_100006270(v29, v30);
      uint64_t v18 = dispatch thunk of CodingKey.stringValue.getter(v16, v17);
      uint64_t v20 = v19;
      sub_1000062D8(v29);
      if ((swift_isUniquelyReferenced_nonNull_native(v15) & 1) == 0)
      {
        sub_10004FDF4(0LL, v15[2] + 1LL, 1);
        uint64_t v15 = v32;
      }

      unint64_t v22 = v15[2];
      unint64_t v21 = v15[3];
      if (v22 >= v21 >> 1)
      {
        sub_10004FDF4((char *)(v21 > 1), v22 + 1, 1);
        uint64_t v15 = v32;
      }

      v15[2] = v22 + 1;
      uint64_t v23 = &v15[2 * v22];
      v23[4] = v18;
      v23[5] = v20;
      v14 += 40LL;
      --v13;
    }

    while (v13);
    swift_bridgeObjectRelease(v27);
    uint64_t v7 = v28;
    uint64_t v12 = v26;
  }

  else
  {
    swift_bridgeObjectRelease(a2);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a3);
  return v12;
}

uint64_t sub_10006C86C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_10005141C(a1, a2);
  uint64_t v12 = v11;
  swift_bridgeObjectRelease(a2);
  if (v12)
  {
    if (v10 == 95 && v12 == 0xE100000000000000LL)
    {
      swift_bridgeObjectRelease(0xE100000000000000LL);
    }

    else
    {
      char v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v12, 95LL, 0xE100000000000000LL, 0LL);
      swift_bridgeObjectRelease(v12);
      if ((v13 & 1) == 0) {
        goto LABEL_7;
      }
    }

    unint64_t v14 = sub_100033710(1uLL, a1, a2);
    uint64_t v16 = v15;
    uint64_t v18 = v17;
    uint64_t v20 = v19;
    swift_bridgeObjectRelease(a2);
    a1 = static String._fromSubstring(_:)(v14, v16, v18, v20);
    swift_bridgeObjectRelease(v20);
  }

uint64_t destroy for InputKey(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 16));
}

void *_s14ArgumentParser8InputKeyVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

void *assignWithCopy for InputKey(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for InputKey(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void *assignWithTake for InputKey(void *a1, uint64_t a2)
{
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease(a1[1]);
  uint64_t v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for InputKey(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InputKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
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

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for InputKey()
{
  return &type metadata for InputKey;
}

unint64_t sub_10006CBD0()
{
  unint64_t result = qword_1000B9C90;
  if (!qword_1000B9C90)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A2B0, &type metadata for InputKey);
    atomic_store(result, (unint64_t *)&qword_1000B9C90);
  }

  return result;
}

ValueMetadata *type metadata accessor for InputOrigin()
{
  return &type metadata for InputOrigin;
}

uint64_t sub_10006CC24(Swift::UInt a1, Swift::UInt a2, __int16 a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if ((sub_10006668C(a1, a2, a3 & 0x1FF, a4) & 1) != 0 || (uint64_t v10 = v4, (sub_10006668C(a1, a2, a3 & 0x1FF, v4) & 1) != 0))
  {
    swift_bridgeObjectRetain(v4);
  }

  else
  {
    swift_bridgeObjectRetain(v4);
    sub_10005954C((uint64_t)v9, a1, a2, a3 & 0x1FF);
    return v10;
  }

  return v4;
}

BOOL sub_10006CCCC(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 17) & 1) != 0) {
    return 0LL;
  }
  if ((*(_BYTE *)(a2 + 17) & 1) != 0) {
    return 1LL;
  }
  if (*(void *)a1 < *(void *)a2) {
    return 1LL;
  }
  if (*(void *)a1 != *(void *)a2) {
    return 0LL;
  }
  if ((*(_BYTE *)(a1 + 16) & 1) == 0) {
    return (*(_BYTE *)(a2 + 16) & 1) == 0 && *(void *)(a1 + 8) < *(void *)(a2 + 8);
  }
  return (*(_BYTE *)(a2 + 16) & 1) == 0;
}

uint64_t sub_10006CD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10006CD98( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void, void, void, void, void))sub_10006CD48);
}

BOOL sub_10006CD48(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, __int16 a6)
{
  if ((a6 & 0x100) == 0)
  {
    if ((a3 & 0x100) != 0 || a4 < a1) {
      return 0LL;
    }
    if (a4 == a1)
    {
      if ((a6 & 1) == 0) {
        return (a3 & 1) != 0 || a5 >= a2;
      }
      if ((a3 & 1) == 0) {
        return 0LL;
      }
    }
  }

  return 1LL;
}

uint64_t sub_10006CD8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10006CD98( a1,  a2,  a3,  a4,  (uint64_t (*)(void, void, void, void, void, void))sub_10006CDD0);
}

uint64_t sub_10006CD98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void, void, void, void, void, void))
{
  return a5( *(void *)a1,  *(void *)(a1 + 8),  *(unsigned __int8 *)(a1 + 16) | (*(unsigned __int8 *)(a1 + 17) << 8),  *(void *)a2,  *(void *)(a2 + 8),  *(unsigned __int8 *)(a2 + 16) | (*(unsigned __int8 *)(a2 + 17) << 8));
}

BOOL sub_10006CDD0(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5, __int16 a6)
{
  if ((a3 & 0x100) == 0)
  {
    if ((a6 & 0x100) != 0 || a1 < a4) {
      return 0LL;
    }
    if (a1 == a4)
    {
      if ((a3 & 1) == 0) {
        return (a6 & 1) != 0 || a2 >= a5;
      }
      if ((a6 & 1) == 0) {
        return 0LL;
      }
    }
  }

  return 1LL;
}

BOOL sub_10006CE14(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a2 + 17) & 1) != 0) {
    return 0LL;
  }
  if ((*(_BYTE *)(a1 + 17) & 1) != 0) {
    return 1LL;
  }
  if (*(void *)a2 < *(void *)a1) {
    return 1LL;
  }
  if (*(void *)a2 != *(void *)a1) {
    return 0LL;
  }
  if ((*(_BYTE *)(a2 + 16) & 1) == 0) {
    return (*(_BYTE *)(a1 + 16) & 1) == 0 && *(void *)(a2 + 8) < *(void *)(a1 + 8);
  }
  return (*(_BYTE *)(a1 + 16) & 1) == 0;
}

Swift::Int sub_10006CE84()
{
  Swift::UInt v1 = *(void *)v0;
  Swift::UInt v2 = *(void *)(v0 + 8);
  char v3 = *(_BYTE *)(v0 + 16);
  char v4 = *(_BYTE *)(v0 + 17);
  Hasher.init(_seed:)(v7, 0LL);
  Swift::UInt v5 = 0LL;
  if ((v4 & 1) == 0)
  {
    Hasher._combine(_:)(1uLL);
    Hasher._combine(_:)(v1);
    if ((v3 & 1) != 0)
    {
      Swift::UInt v5 = 0LL;
    }

    else
    {
      Hasher._combine(_:)(1uLL);
      Swift::UInt v5 = v2;
    }
  }

  Hasher._combine(_:)(v5);
  return Hasher._finalize()();
}

void sub_10006CF10()
{
  if ((*(_BYTE *)(v0 + 17) & 1) != 0
    || (char v1 = *(_BYTE *)(v0 + 16),
        Swift::UInt v3 = *(void *)v0,
        Swift::UInt v2 = *(void *)(v0 + 8),
        Hasher._combine(_:)(1uLL),
        Hasher._combine(_:)(v3),
        (v1 & 1) != 0))
  {
    Swift::UInt v2 = 0LL;
  }

  else
  {
    Hasher._combine(_:)(1uLL);
  }

  Hasher._combine(_:)(v2);
}

Swift::Int sub_10006CF74(uint64_t a1)
{
  Swift::UInt v3 = *(void *)v1;
  Swift::UInt v2 = *(void *)(v1 + 8);
  char v4 = *(_BYTE *)(v1 + 16);
  char v5 = *(_BYTE *)(v1 + 17);
  Hasher.init(_seed:)(v7, a1);
  if ((v5 & 1) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(v3), (v4 & 1) != 0)) {
    Swift::UInt v2 = 0LL;
  }
  else {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10006CFF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a2 + 17);
  if ((*(_BYTE *)(a1 + 17) & 1) == 0)
  {
    if ((v2 & 1) == 0 && *(void *)a1 == *(void *)a2)
    {
      if ((*(_BYTE *)(a1 + 16) & 1) != 0)
      {
        if ((*(_BYTE *)(a2 + 16) & 1) != 0) {
          return 1LL;
        }
      }

      else if ((*(_BYTE *)(a2 + 16) & 1) == 0 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
      {
        return 1LL;
      }
    }

    return 0LL;
  }

  return v2;
}

Swift::Int sub_10006D050(Swift::Int *a1, uint64_t *a2)
{
  return sub_10006D098(*a1, *a2);
}

uint64_t sub_10006D05C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_10006D354(a1);
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = v4;
  return result;
}

Swift::Int sub_10006D098(Swift::Int result, uint64_t a2)
{
  if (result != a2)
  {
    Swift::Int v3 = result;
    if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
      return 0LL;
    }
    int64_t v4 = 0LL;
    Swift::Int v26 = result + 56;
    uint64_t v5 = 1LL << *(_BYTE *)(result + 32);
    if (v5 < 64) {
      uint64_t v6 = ~(-1LL << v5);
    }
    else {
      uint64_t v6 = -1LL;
    }
    unint64_t v7 = v6 & *(void *)(result + 56);
    int64_t v27 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = a2 + 56;
LABEL_7:
    if (v7)
    {
      unint64_t v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      int64_t v28 = v4;
      unint64_t v10 = v9 | (v4 << 6);
LABEL_25:
      uint64_t v15 = *(void *)(v3 + 48) + 24 * v10;
      Swift::UInt v16 = *(void *)v15;
      Swift::UInt v17 = *(void *)(v15 + 8);
      char v18 = *(_BYTE *)(v15 + 16);
      char v19 = *(_BYTE *)(v15 + 17);
      Hasher.init(_seed:)(v29, *(void *)(a2 + 40));
      if ((v19 & 1) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(v16), (v18 & 1) != 0))
      {
        Swift::UInt v20 = 0LL;
      }

      else
      {
        Hasher._combine(_:)(1uLL);
        Swift::UInt v20 = v17;
      }

      Hasher._combine(_:)(v20);
      uint64_t result = Hasher._finalize()();
      uint64_t v21 = -1LL << *(_BYTE *)(a2 + 32);
      unint64_t v22 = result & ~v21;
      if (((*(void *)(v8 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v22) & 1) != 0)
      {
        uint64_t v23 = ~v21;
        while (1)
        {
          uint64_t v24 = *(void *)(a2 + 48) + 24 * v22;
          if ((*(_BYTE *)(v24 + 17) & 1) != 0)
          {
            if ((v19 & 1) != 0)
            {
              int64_t v4 = v28;
              goto LABEL_7;
            }
          }

          else
          {
            if (*(void *)v24 == v16) {
              char v25 = v19;
            }
            else {
              char v25 = 1;
            }
            if ((v25 & 1) == 0)
            {
              if ((*(_BYTE *)(v24 + 16) & 1) != 0)
              {
                if ((v18 & 1) != 0)
                {
                  int64_t v4 = v28;
                  goto LABEL_7;
                }
              }

              else if ((v18 & 1) == 0 && *(void *)(v24 + 8) == v17)
              {
                int64_t v4 = v28;
                goto LABEL_7;
              }
            }
          }

          unint64_t v22 = (v22 + 1) & v23;
          if (((*(void *)(v8 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v22) & 1) == 0) {
            return 0LL;
          }
        }
      }

      return 0LL;
    }

    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1LL))
    {
      __break(1u);
LABEL_49:
      __break(1u);
      return result;
    }

    if (v11 < v27)
    {
      unint64_t v12 = *(void *)(v26 + 8 * v11);
      int64_t v13 = v4 + 1;
      if (v12) {
        goto LABEL_24;
      }
      int64_t v13 = v4 + 2;
      if (v4 + 2 >= v27) {
        return 1LL;
      }
      unint64_t v12 = *(void *)(v26 + 8 * v13);
      if (v12) {
        goto LABEL_24;
      }
      int64_t v13 = v4 + 3;
      if (v4 + 3 >= v27) {
        return 1LL;
      }
      unint64_t v12 = *(void *)(v26 + 8 * v13);
      if (v12) {
        goto LABEL_24;
      }
      int64_t v13 = v4 + 4;
      if (v4 + 4 >= v27) {
        return 1LL;
      }
      unint64_t v12 = *(void *)(v26 + 8 * v13);
      if (v12)
      {
LABEL_24:
        unint64_t v7 = (v12 - 1) & v12;
        int64_t v28 = v13;
        unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
        goto LABEL_25;
      }

      uint64_t v14 = v4 + 5;
      if (v4 + 5 < v27)
      {
        unint64_t v12 = *(void *)(v26 + 8 * v14);
        if (v12)
        {
          int64_t v13 = v4 + 5;
          goto LABEL_24;
        }

        while (1)
        {
          int64_t v13 = v14 + 1;
          if (__OFADD__(v14, 1LL)) {
            goto LABEL_49;
          }
          if (v13 >= v27) {
            return 1LL;
          }
          unint64_t v12 = *(void *)(v26 + 8 * v13);
          ++v14;
          if (v12) {
            goto LABEL_24;
          }
        }
      }
    }
  }

  return 1LL;
}

uint64_t sub_10006D354(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = sub_100067054();
  uint64_t result = Set.init(minimumCapacity:)(v2, &type metadata for InputOrigin.Element, v3);
  uint64_t v11 = result;
  if (v2)
  {
    uint64_t v5 = (unsigned __int8 *)(a1 + 49);
    do
    {
      Swift::UInt v6 = *(void *)(v5 - 17);
      Swift::UInt v7 = *(void *)(v5 - 9);
      int v8 = *(v5 - 1);
      int v9 = *v5;
      v5 += 24;
      sub_10005954C((uint64_t)v10, v6, v7, v8 | (v9 << 8));
      --v2;
    }

    while (v2);
    return v11;
  }

  return result;
}

__n128 initializeBufferWithCopyOfBuffer for InputOrigin.Element(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for InputOrigin.Element(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 18)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for InputOrigin.Element(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_WORD *)(result + 16) = 0;
    *(_DWORD *)__n128 result = a2 - 1;
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

  *(_BYTE *)(result + 18) = v3;
  return result;
}

uint64_t sub_10006D438(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10006D454(uint64_t result, int a2)
{
  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0LL;
    *(_BYTE *)(result + 17) = 1;
  }

  else
  {
    *(_BYTE *)(result + 17) = 0;
  }

  return result;
}

ValueMetadata *type metadata accessor for InputOrigin.Element()
{
  return &type metadata for InputOrigin.Element;
}

unint64_t sub_10006D48C()
{
  unint64_t result = qword_1000B9C98;
  if (!qword_1000B9C98)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A394, &type metadata for InputOrigin.Element);
    atomic_store(result, (unint64_t *)&qword_1000B9C98);
  }

  return result;
}

uint64_t destroy for Name(uint64_t a1)
{
  return sub_10002DA24(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s14ArgumentParser4NameOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_100030508(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Name(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_100030508(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_10002DA24(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for Name(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_10002DA24(v4, v5, v6);
  return a1;
}

uint64_t sub_10006D5C4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_10006D5D0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 1 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for Name()
{
  return &type metadata for Name;
}

unint64_t sub_10006D5F8()
{
  unint64_t result = qword_1000B9CA0[0];
  if (!qword_1000B9CA0[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A498, &type metadata for Name);
    atomic_store(result, qword_1000B9CA0);
  }

  return result;
}

uint64_t sub_10006D63C(Swift::String a1, unsigned __int8 a2)
{
  object = a1._object;
  uint64_t countAndFlagsBits = a1._countAndFlagsBits;
  if (!(a2 >> 6))
  {
    uint64_t v5 = 11565LL;
    unint64_t v6 = 0xE200000000000000LL;
LABEL_6:
    uint64_t v8 = v5;
    unint64_t v9 = v6;
    String.append(_:)(a1);
    return v8;
  }

  if (a2 >> 6 != 1)
  {
    uint64_t v5 = 45LL;
    unint64_t v6 = 0xE100000000000000LL;
    goto LABEL_6;
  }

  uint64_t v8 = 0LL;
  unint64_t v9 = 0xE000000000000000LL;
  v4._uint64_t countAndFlagsBits = 45LL;
  v4._object = (void *)0xE100000000000000LL;
  String.append(_:)(v4);
  Character.write<A>(to:)( &v8,  countAndFlagsBits,  object,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  return v8;
}

Swift::Int sub_10006D6E4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (!(a3 >> 6))
  {
    Swift::UInt v6 = 0LL;
LABEL_6:
    Hasher._combine(_:)(v6);
    String.hash(into:)(v8, a1, a2);
    return Hasher._finalize()();
  }

  if (a3 >> 6 != 1)
  {
    Swift::UInt v6 = 2LL;
    goto LABEL_6;
  }

  Hasher._combine(_:)(1uLL);
  Character.hash(into:)(v8, a1, a2);
  Hasher._combine(_:)(a3 & 1);
  return Hasher._finalize()();
}

uint64_t sub_10006D794(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void *)a2;
  Swift::String v4 = *(void **)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a1 + 16);
  unsigned __int8 v6 = *(_BYTE *)(a2 + 16);
  v16._uint64_t countAndFlagsBits = *(void *)a1;
  v16._object = v2;
  uint64_t v7 = sub_10006D63C(v16, v5);
  uint64_t v9 = v8;
  v17._uint64_t countAndFlagsBits = v3;
  v17._object = v4;
  uint64_t v10 = sub_10006D63C(v17, v6);
  if (v7 == v10 && v9 == v11)
  {
    char v14 = 0;
    uint64_t v13 = v9;
  }

  else
  {
    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 1LL);
  }

  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v13);
  return v14 & 1;
}

uint64_t sub_10006D83C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  unsigned __int8 v4 = *(_BYTE *)(a1 + 16);
  uint64_t v5 = sub_10006D63C(*(Swift::String *)a2, *(_BYTE *)(a2 + 16));
  uint64_t v7 = v6;
  v15._uint64_t countAndFlagsBits = v2;
  v15._object = v3;
  uint64_t v8 = sub_10006D63C(v15, v4);
  if (v5 == v8 && v7 == v9)
  {
    swift_bridgeObjectRelease_n(v7, 2LL);
    char v13 = 1;
  }

  else
  {
    uint64_t v11 = v9;
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v8, v9, 1LL);
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v11);
    char v13 = v12 ^ 1;
  }

  return v13 & 1;
}

uint64_t sub_10006D8F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = *(void *)a2;
  unsigned __int8 v4 = *(void **)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a1 + 16);
  unsigned __int8 v6 = *(_BYTE *)(a2 + 16);
  v17._uint64_t countAndFlagsBits = *(void *)a1;
  v17._object = v2;
  uint64_t v7 = sub_10006D63C(v17, v5);
  uint64_t v9 = v8;
  v18._uint64_t countAndFlagsBits = v3;
  v18._object = v4;
  uint64_t v10 = sub_10006D63C(v18, v6);
  if (v7 == v10 && v9 == v11)
  {
    swift_bridgeObjectRelease_n(v9, 2LL);
    char v15 = 1;
  }

  else
  {
    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 1LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    char v15 = v14 ^ 1;
  }

  return v15 & 1;
}

uint64_t sub_10006D9A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void **)(a1 + 8);
  unsigned __int8 v4 = *(_BYTE *)(a1 + 16);
  uint64_t v5 = sub_10006D63C(*(Swift::String *)a2, *(_BYTE *)(a2 + 16));
  uint64_t v7 = v6;
  v14._uint64_t countAndFlagsBits = v2;
  v14._object = v3;
  uint64_t v8 = sub_10006D63C(v14, v4);
  if (v5 == v8 && v7 == v9)
  {
    char v12 = 0;
    uint64_t v11 = v7;
  }

  else
  {
    uint64_t v11 = v9;
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v8, v9, 1LL);
  }

  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v11);
  return v12 & 1;
}

uint64_t sub_10006DA4C(uint64_t a1, uint64_t a2)
{
  return sub_10006DD50( *(void *)a1,  *(void *)(a1 + 8),  *(_BYTE *)(a1 + 16),  *(void *)a2,  *(void *)(a2 + 8),  *(_BYTE *)(a2 + 16));
}

Swift::Int sub_10006DA68()
{
  return sub_10006D6E4(*(void *)v0, *(void *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

void sub_10006DA74(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1[1];
  unsigned int v5 = *((unsigned __int8 *)v1 + 16);
  if (v5 >> 6)
  {
    if (v5 >> 6 == 1)
    {
      Swift::UInt8 v6 = v5 & 1;
      Hasher._combine(_:)(1uLL);
      Character.hash(into:)(a1, v4, v3);
      Hasher._combine(_:)(v6);
      return;
    }

    Swift::UInt v7 = 2LL;
  }

  else
  {
    Swift::UInt v7 = 0LL;
  }

  Hasher._combine(_:)(v7);
  String.hash(into:)(a1, v4, v3);
}

Swift::Int sub_10006DB14(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  unsigned int v4 = *((unsigned __int8 *)v1 + 16);
  Hasher.init(_seed:)(v7, a1);
  if (!(v4 >> 6))
  {
    Swift::UInt v5 = 0LL;
LABEL_6:
    Hasher._combine(_:)(v5);
    String.hash(into:)(v7, v3, v2);
    return Hasher._finalize()();
  }

  if (v4 >> 6 != 1)
  {
    Swift::UInt v5 = 2LL;
    goto LABEL_6;
  }

  Hasher._combine(_:)(1uLL);
  Character.hash(into:)(v7, v3, v2);
  Hasher._combine(_:)(v4 & 1);
  return Hasher._finalize()();
}

BOOL sub_10006DBBC(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v10 = a4 >> 14;
  swift_bridgeObjectRetain(a2);
  if (v10 == a3 >> 14)
  {
LABEL_10:
    object = String.Iterator.next()().value._object;
    swift_bridgeObjectRelease(a2);
    BOOL v18 = object == 0LL;
  }

  else
  {
    swift_bridgeObjectRetain(a6);
    unint64_t v11 = a3;
    while (1)
    {
      while (1)
      {
        uint64_t v13 = Substring.subscript.getter(v11, a3, a4, a5, a6);
        char v15 = v14;
        unint64_t v11 = Substring.index(after:)(v11, a3, a4, a5, a6);
        Swift::String_optional v16 = String.Iterator.next()();
        if (!v16.value._object)
        {
          swift_bridgeObjectRelease(a6);
          swift_bridgeObjectRelease(v15);
          BOOL v18 = 1LL;
          goto LABEL_13;
        }

        if (v13 != v16.value._countAndFlagsBits || v16.value._object != v15) {
          break;
        }
        swift_bridgeObjectRelease(v15);
        swift_bridgeObjectRelease(v16.value._object);
        if (v10 == v11 >> 14)
        {
LABEL_9:
          swift_bridgeObjectRelease(a6);
          goto LABEL_10;
        }
      }

      char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v16.value._countAndFlagsBits, v16.value._object, 0LL);
      swift_bridgeObjectRelease(v15);
      swift_bridgeObjectRelease(v16.value._object);
      if ((v12 & 1) == 0) {
        break;
      }
      if (v10 == v11 >> 14) {
        goto LABEL_9;
      }
    }

    swift_bridgeObjectRelease(a6);
    BOOL v18 = 0LL;
LABEL_13:
    object = a2;
  }

  swift_bridgeObjectRelease(object);
  return v18;
}

uint64_t sub_10006DD50( uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a3 >> 6)
  {
    if (a3 >> 6 == 1)
    {
      if ((a6 & 0xC0) == 0x40)
      {
        if (a1 == a4 && a2 == a5
          || (char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a4, a5, 0LL), v9 = 0, (v8 & 1) != 0))
        {
          char v9 = ((a3 & 1) == 0) ^ a6;
        }

        return v9 & 1;
      }

      goto LABEL_13;
    }

    if ((a6 & 0xC0) != 0x80)
    {
LABEL_13:
      char v9 = 0;
      return v9 & 1;
    }
  }

  else if (a6 >= 0x40u)
  {
    goto LABEL_13;
  }

  if (a1 == a4 && a2 == a5)
  {
    char v9 = 1;
    return v9 & 1;
  }

  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a4, a5, 0LL);
}

uint64_t sub_10006DE14(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (sub_10006DBBC(11565LL, (void *)0xE200000000000000LL, a1, a2, a3, a4))
  {
    unint64_t v8 = Substring.index(_:offsetBy:limitedBy:)(a1, 2LL, a2, a1, a2, a3, v4);
    if ((v9 & 1) != 0) {
      unint64_t v8 = a2;
    }
    if (a2 >> 14 >= v8 >> 14)
    {
LABEL_12:
      uint64_t v14 = Substring.subscript.getter(v8);
      uint64_t v16 = v15;
      uint64_t v18 = v17;
      uint64_t v20 = v19;
      swift_bridgeObjectRelease(v4);
      uint64_t v12 = static String._fromSubstring(_:)(v14, v16, v18, v20);
      uint64_t v4 = v20;
      goto LABEL_13;
    }

    __break(1u);
    goto LABEL_15;
  }

  swift_bridgeObjectRetain(v4);
  uint64_t v10 = Substring.distance(from:to:)(a1, a2, a1, a2, a3, v4);
  swift_bridgeObjectRelease(v4);
  if (v10 != 2)
  {
    unint64_t v8 = Substring.index(_:offsetBy:limitedBy:)(a1, 1LL, a2, a1, a2, a3, v4);
    if ((v13 & 1) != 0) {
      unint64_t v8 = a2;
    }
    if (a2 >> 14 >= v8 >> 14) {
      goto LABEL_12;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  if ((a2 ^ a1) >= 0x4000)
  {
    uint64_t v11 = Substring.index(before:)(a2, a1, a2, a3, v4);
    uint64_t v12 = Substring.subscript.getter(v11, a1, a2, a3, v4);
LABEL_13:
    swift_bridgeObjectRelease(v4);
    return v12;
  }

uint64_t sub_10006E024(uint64_t a1)
{
  uint64_t result = swift_checkMetadataState(319LL, *(void *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for () + 64;
    swift_initEnumMetadataMultiPayload(a1, 0LL, 2LL, v4);
    return 0LL;
  }

  return result;
}

uint64_t *sub_10006E098(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  if (*(void *)(v4 + 64) <= 0x10uLL) {
    uint64_t v5 = 16LL;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 64);
  }
  int v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    uint64_t v8 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }

  else
  {
    unsigned int v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
    {
      else {
        uint64_t v10 = 4LL;
      }
      __asm { BR              X13 }
    }

    if (v9 != 1)
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v5) = 0;
      return v3;
    }

    uint64_t v8 = a2[1];
    *unint64_t v3 = *a2;
    v3[1] = v8;
    *((_BYTE *)v3 + v5) = 1;
  }

  swift_retain(v8);
  return v3;
}

uint64_t sub_10006E1AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a2 + 16) - 8LL);
  unint64_t v3 = *(void *)(v2 + 64);
  if (v3 <= 0x10) {
    unint64_t v3 = 16LL;
  }
  unsigned int v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1) {
      return swift_release(*(void *)(a1 + 8));
    }
    else {
      return (*(uint64_t (**)(void))(v2 + 8))();
    }
  }

  else
  {
    else {
      uint64_t v5 = 4LL;
    }
    return ((uint64_t (*)(void))((char *)&loc_10006E1F4 + 4 * byte_10009A515[v5]))();
  }

void *sub_10006E24C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  if (*(void *)(v4 + 64) <= 0x10uLL) {
    uint64_t v5 = 16LL;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 64);
  }
  unsigned int v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    else {
      uint64_t v7 = 4LL;
    }
    __asm { BR              X13 }
  }

  if (v6 == 1)
  {
    uint64_t v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_retain(v8);
    char v9 = 1;
  }

  else
  {
    (*(void (**)(void *))(v4 + 16))(a1);
    char v9 = 0;
  }

  *((_BYTE *)a1 + v5) = v9;
  return a1;
}

void *sub_10006E324(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16LL;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2)
    {
      else {
        uint64_t v9 = 4LL;
      }
      __asm { BR              X12 }
    }

    if (v8 == 1) {
      swift_release(a1[1]);
    }
    else {
      (*(void (**)(void *, void))(v6 + 8))(a1, *(void *)(a3 + 16));
    }
    unsigned int v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      else {
        uint64_t v11 = 4LL;
      }
      __asm { BR              X12 }
    }

    if (v10 == 1)
    {
      uint64_t v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      *((_BYTE *)a1 + v7) = 1;
      swift_retain(v12);
    }

    else
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      *((_BYTE *)a1 + v7) = 0;
    }
  }

  return a1;
}

_OWORD *sub_10006E4B4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  if (*(void *)(v4 + 64) <= 0x10uLL) {
    uint64_t v5 = 16LL;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 64);
  }
  unsigned int v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    else {
      uint64_t v7 = 4LL;
    }
    __asm { BR              X13 }
  }

  if (v6 == 1)
  {
    *a1 = *a2;
    char v8 = 1;
  }

  else
  {
    (*(void (**)(_OWORD *))(v4 + 32))(a1);
    char v8 = 0;
  }

  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

uint64_t sub_10006E588(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  if ((_OWORD *)a1 != a2)
  {
    uint64_t v5 = *(void *)(a3 + 16);
    uint64_t v6 = *(void *)(v5 - 8);
    if (*(void *)(v6 + 64) <= 0x10uLL) {
      uint64_t v7 = 16LL;
    }
    else {
      uint64_t v7 = *(void *)(v6 + 64);
    }
    unsigned int v8 = *(unsigned __int8 *)(a1 + v7);
    if (v8 >= 2)
    {
      else {
        uint64_t v9 = 4LL;
      }
      __asm { BR              X12 }
    }

    if (v8 == 1) {
      swift_release(*(void *)(a1 + 8));
    }
    else {
      (*(void (**)(uint64_t, void))(v6 + 8))(a1, *(void *)(a3 + 16));
    }
    unsigned int v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      else {
        uint64_t v11 = 4LL;
      }
      __asm { BR              X12 }
    }

    if (v10 == 1)
    {
      *(_OWORD *)a1 = *a2;
      char v12 = 1;
    }

    else
    {
      (*(void (**)(uint64_t, _OWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      char v12 = 0;
    }

    *(_BYTE *)(a1 + v7) = v12;
  }

  return a1;
}

uint64_t sub_10006E714(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = 16LL;
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8LL) + 64LL) > 0x10uLL) {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8LL) + 64LL);
  }
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFF) {
    goto LABEL_21;
  }
  uint64_t v4 = v3 + 1;
  char v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    unsigned int v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      int v6 = *(_DWORD *)(a1 + v4);
      if (!v6) {
        goto LABEL_21;
      }
      goto LABEL_14;
    }

    if (v8 > 0xFF)
    {
      int v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4)) {
        goto LABEL_21;
      }
      goto LABEL_14;
    }

    if (v8 < 2)
    {
LABEL_21:
      unsigned int v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2) {
        return (v10 ^ 0xFF) + 1;
      }
      else {
        return 0LL;
      }
    }
  }

  int v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4)) {
    goto LABEL_21;
  }
LABEL_14:
  int v9 = (v6 - 1) << v5;
  if (!(_DWORD)v4) {
    return (v9 + 255);
  }
  return ((uint64_t (*)(void))((char *)&loc_10006E7D8 + 4 * byte_10009A538[(v4 - 1)]))();
}

void sub_10006E824(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a4 + 16) - 8LL) + 64LL);
  if (v5 <= 0x10) {
    unint64_t v5 = 16LL;
  }
  size_t v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    unsigned int v7 = 0;
  }

  else if (v6 <= 3)
  {
    unsigned int v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      unsigned int v7 = &dword_100000004;
    }

    else if (v9 >= 0x100)
    {
      unsigned int v7 = 2;
    }

    else
    {
      unsigned int v7 = v9 > 1;
    }
  }

  else
  {
    unsigned int v7 = &_mh_execute_header.magic + 1;
  }

  if (a2 <= 0xFE) {
    __asm { BR              X11 }
  }

  unsigned int v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      int v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }

      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }

      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }

  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }

  __asm { BR              X10 }

uint64_t sub_10006E9CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 16LL;
  if (*(void *)(*(void *)(*(void *)(a2 + 16) - 8LL) + 64LL) > 0x10uLL) {
    uint64_t v2 = *(void *)(*(void *)(*(void *)(a2 + 16) - 8LL) + 64LL);
  }
  else {
    uint64_t v3 = 4LL;
  }
  return ((uint64_t (*)(void))((char *)&loc_10006EA14 + 4 * byte_10009A546[v3]))();
}

void sub_10006EA5C(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  if (*(void *)(*(void *)(*(void *)(a3 + 16) - 8LL) + 64LL) <= 0x10uLL) {
    size_t v4 = 16LL;
  }
  else {
    size_t v4 = *(void *)(*(void *)(*(void *)(a3 + 16) - 8LL) + 64LL);
  }
  if (a2 > 1)
  {
    unsigned int v5 = a2 - 2;
    if (v4 < 4)
    {
      unsigned int v6 = v5 >> (8 * v4);
      int v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }

      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }

      else
      {
        *a1 = v7;
      }
    }

    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }

  else
  {
    a1[v4] = a2;
  }

uint64_t type metadata accessor for Parsed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100037B54(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Parsed);
}

void *sub_10006EB30@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v47 = a4;
  uint64_t v48 = a3;
  uint64_t v46 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(255LL, a3);
  uint64_t v45 = type metadata accessor for Parsed(0LL, AssociatedTypeWitness, v6, v7);
  __chkstk_darwin(v45);
  unsigned int v9 = (char *)&v39 - v8;
  uint64_t v10 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v39 - v13;
  uint64_t v15 = *(void *)(AssociatedTypeWitness - 8);
  __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v39 - v16;
  unint64_t v61 = a1;
  sub_100033F10((uint64_t)a1, (uint64_t)v57);
  uint64_t v18 = sub_100005104(&qword_1000B9460);
  if ((swift_dynamicCast(&v49, v57, v18, &type metadata for SingleValueDecoder, 6LL) & 1) != 0)
  {
    uint64_t v19 = AssociatedTypeWitness;
    uint64_t v40 = v11;
    uint64_t v41 = v10;
    uint64_t v42 = v14;
    uint64_t v43 = v15;
    unsigned int v44 = v17;
    uint64_t v20 = v48;
    v59[1] = v53;
    v59[2] = v54;
    v59[3] = v55;
    char v60 = v56;
    v58[0] = v49;
    v58[1] = v50;
    v58[2] = v51;
    v59[0] = v52;
    sub_10005BCDC((uint64_t)v59, (uint64_t)&v49, &qword_1000B9888);
    if (*((void *)&v49 + 1))
    {
      sub_10005BCDC((uint64_t)&v50 + 8, (uint64_t)v57, &qword_1000B9360);
      sub_10003D920(&v49);
    }

    else
    {
      sub_10004E740((uint64_t)&v49, &qword_1000B9888);
      memset(v57, 0, 32);
    }

    char v25 = v9;
    uint64_t v27 = v43;
    Swift::Int v26 = v44;
    int64_t v28 = v42;
    uint64_t v29 = sub_100005104(&qword_1000B9360);
    char v30 = swift_dynamicCast(v28, v57, v29, v19, 6LL);
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
    if ((v30 & 1) != 0)
    {
      v31(v28, 0LL, 1LL, v19);
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v26, v28, v19);
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v25, v26, v19);
      swift_storeEnumTagMultiPayload(v25, v45, 0LL);
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 40))(v25, v46, v20);
      sub_1000062D8(v61);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v26, v19);
      return sub_10004408C(v58);
    }

    else
    {
      v31(v28, 1LL, 1LL, v19);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v28, v41);
      sub_10005BCDC((uint64_t)v59, (uint64_t)&v49, &qword_1000B9888);
      uint64_t v32 = *((void *)&v49 + 1);
      if (*((void *)&v49 + 1))
      {
        uint64_t v33 = v49;
        uint64_t v34 = v50;
        swift_bridgeObjectRetain(*((void *)&v49 + 1));
        swift_bridgeObjectRetain(v34);
        sub_10003D920(&v49);
        sub_10005BCA8((uint64_t *)v58, (uint64_t)&v49);
      }

      else
      {
        sub_10004E740((uint64_t)&v49, &qword_1000B9888);
        sub_10005BCA8((uint64_t *)v58, (uint64_t)&v49);
        uint64_t v33 = *((void *)&v50 + 1);
        uint64_t v34 = *((void *)&v51 + 1);
        uint64_t v32 = v51;
        swift_bridgeObjectRetain(v51);
        swift_bridgeObjectRetain(v34);
      }

      uint64_t v35 = v61;
      sub_10004408C(&v49);
      unint64_t v36 = sub_10002EA1C();
      uint64_t v37 = swift_allocError(&type metadata for ParserError, v36, 0LL, 0LL);
      *(void *)uint64_t v38 = v33;
      *(void *)(v38 + 8) = v32;
      *(void *)(v38 + 16) = v34;
      *(_OWORD *)(v38 + 24) = 0u;
      *(_OWORD *)(v38 + 40) = 0u;
      *(_OWORD *)(v38 + 56) = 0u;
      *(void *)(v38 + 72) = 0LL;
      *(_BYTE *)(v38 + 80) = 11;
      swift_willThrow(v37);
      sub_1000062D8(v35);
      return sub_10004408C(v58);
    }
  }

  else
  {
    char v56 = 0;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v49 = 0u;
    sub_10004E740((uint64_t)&v49, &qword_1000B9468);
    unint64_t v21 = sub_10002EA1C();
    uint64_t v22 = swift_allocError(&type metadata for ParserError, v21, 0LL, 0LL);
    *(void *)uint64_t v23 = 3LL;
    *(_OWORD *)(v23 + 8) = 0u;
    *(_OWORD *)(v23 + 24) = 0u;
    *(_OWORD *)(v23 + 40) = 0u;
    *(_OWORD *)(v23 + 56) = 0u;
    *(void *)(v23 + 72) = 0LL;
    *(_BYTE *)(v23 + 80) = 15;
    swift_willThrow(v22);
    return (void *)sub_1000062D8(v61);
  }

uint64_t sub_10006EF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100098020, a4);
  return sub_10006EFD4(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_10006EFD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(255LL, a5);
  uint64_t v13 = type metadata accessor for Parsed(0LL, AssociatedTypeWitness, v11, v12);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v19 - v14;
  (*(void (**)(uint64_t, uint64_t))(a5 + 32))(a4, a5);
  if (swift_getEnumCaseMultiPayload(v15, v13) == 1)
  {
    uint64_t v16 = *((void *)v15 + 1);
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))v15)(a1, a2, a3);
    swift_release(v16);
    return v17;
  }

  else
  {
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000003FLL,  0x800000010009DB70LL,  "ArgumentParser/Parsed.swift",  27LL,  2LL,  59LL,  0);
    __break(1u);
  }

  return result;
}

uint64_t sub_10006F11C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  uint64_t v6 = type metadata accessor for Parsed(0LL, a3, a3, a4);
  return swift_storeEnumTagMultiPayload(a5, v6, 1LL);
}

uint64_t sub_10006F154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100098634, a4);
  return sub_10006EFD4(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_10006F1B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100098A70, a4);
  return sub_10006EFD4(a1, a2, a3, a4, WitnessTable);
}

uint64_t sub_10006F20C@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v34 = a5;
  uint64_t v48 = a3;
  uint64_t v35 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(255LL, a3);
  uint64_t v9 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v29 = *(void *)(v9 - 8);
  uint64_t v30 = v9;
  __chkstk_darwin(v9);
  uint64_t v31 = (char *)&v29 - v10;
  uint64_t v33 = type metadata accessor for Parsed(0LL, AssociatedTypeWitness, v11, v12);
  uint64_t v13 = __chkstk_darwin(v33);
  uint64_t v32 = (char *)&v29 - v14;
  uint64_t v15 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v29 - v19;
  sub_100033F10((uint64_t)a1, (uint64_t)v45);
  dispatch thunk of Decodable.init(from:)(v45, AssociatedTypeWitness, a4);
  if (!v5)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v18, AssociatedTypeWitness);
LABEL_10:
    uint64_t v27 = v32;
    (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v32, v20, AssociatedTypeWitness);
    swift_storeEnumTagMultiPayload(v27, v33, 0LL);
    (*(void (**)(char *, uint64_t))(v48 + 40))(v27, v35);
    sub_1000062D8(a1);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v20, AssociatedTypeWitness);
  }

  sub_100033F10((uint64_t)a1, (uint64_t)v44);
  uint64_t v21 = sub_100005104(&qword_1000B9460);
  if ((swift_dynamicCast(&v36, v44, v21, &type metadata for SingleValueDecoder, 6LL) & 1) != 0)
  {
    v46[1] = v40;
    v46[2] = v41;
    v46[3] = v42;
    char v47 = v43;
    v45[0] = v36;
    v45[1] = v37;
    v45[2] = v38;
    v46[0] = v39;
    sub_10005BCDC((uint64_t)v46, (uint64_t)&v36, &qword_1000B9888);
    sub_10004408C(v45);
    if (*((void *)&v36 + 1))
    {
      sub_10005BCDC((uint64_t)&v37 + 8, (uint64_t)v44, &qword_1000B9360);
      sub_10003D920(&v36);
    }

    else
    {
      sub_10004E740((uint64_t)&v36, &qword_1000B9888);
      memset(v44, 0, 32);
    }

    uint64_t v23 = sub_100005104(&qword_1000B9360);
    uint64_t v24 = v31;
    char v25 = swift_dynamicCast(v31, v44, v23, AssociatedTypeWitness, 6LL);
    Swift::Int v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    if ((v25 & 1) != 0)
    {
      v26(v24, 0LL, 1LL, AssociatedTypeWitness);
      swift_errorRelease(v5);
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v24, AssociatedTypeWitness);
      goto LABEL_10;
    }

    v26(v24, 1LL, 1LL, AssociatedTypeWitness);
    uint64_t v22 = (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v24, v30);
  }

  else
  {
    char v43 = 0;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v36 = 0u;
    uint64_t v22 = sub_10004E740((uint64_t)&v36, &qword_1000B9468);
  }

  swift_willThrow(v22);
  return sub_1000062D8(a1);
}

uint64_t sub_10006F588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t WitnessTable = swift_getWitnessTable(&unk_100098C84, a4);
  return sub_10006EFD4(a1, a2, a3, a4, WitnessTable);
}

uint64_t destroy for ParsedValues(void *a1)
{
  return swift_bridgeObjectRelease(a1[4]);
}

uint64_t *initializeWithCopy for ParsedValues(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2[2];
  uint64_t v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  uint64_t v7 = a2[4];
  a1[4] = v7;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t *assignWithCopy for ParsedValues(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a2[2];
  uint64_t v9 = a1[2];
  a1[2] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[3] = a2[3];
  uint64_t v10 = a2[4];
  uint64_t v11 = a1[4];
  a1[4] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  return a1;
}

__n128 initializeWithTake for ParsedArgument(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for ParsedValues(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = a1[2];
  a1[2] = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = a1[4];
  a1[3] = *(void *)(a2 + 24);
  a1[4] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParsedValues(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParsedValues(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ParsedValues()
{
  return &type metadata for ParsedValues;
}

uint64_t destroy for ParsedValues.Element(void *a1)
{
  if (a1[6]) {
    sub_1000062D8(a1 + 3);
  }
  return swift_bridgeObjectRelease(a1[7]);
}

uint64_t initializeWithCopy for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = *(void *)(a2 + 16);
  *(void *)(a1 + 16) = v5;
  uint64_t v6 = (_OWORD *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  if (v7)
  {
    *(void *)(a1 + 48) = v7;
    (**(void (***)(uint64_t, _OWORD *, uint64_t))(v7 - 8))(a1 + 24, v6, v7);
  }

  else
  {
    __int128 v8 = v6[1];
    *(_OWORD *)(a1 + 24) = *v6;
    *(_OWORD *)(a1 + 40) = v8;
  }

  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 56) = v9;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain(v9);
  return a1;
}

uint64_t assignWithCopy for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v8)
    {
      *(void *)(a1 + 48) = v8;
      (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 24, a2 + 24);
      goto LABEL_8;
    }

__n128 initializeWithTake for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ParsedValues.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(v6);
  if (*(void *)(a1 + 48)) {
    sub_1000062D8((void *)(a1 + 24));
  }
  __int128 v7 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = v7;
  uint64_t v8 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRelease(v8);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParsedValues.Element(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ParsedValues.Element(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 65) = 1;
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

    *(_BYTE *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ParsedValues.Element()
{
  return &type metadata for ParsedValues.Element;
}

void *sub_10006FB28( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t *), uint64_t a7, uint64_t a8)
{
  __int128 v16 = v8[1];
  __int128 v32 = *v8;
  __int128 v33 = v16;
  uint64_t v34 = *((void *)v8 + 4);
  sub_10006FD1C(a1, a2, a3, (uint64_t)&v23);
  if (*((void *)&v23 + 1))
  {
    v29[1] = v25;
    __int128 v30 = v26;
    char v31 = v27;
    __int128 v28 = v23;
    v29[0] = v24;
  }

  else
  {
    uint64_t v17 = type metadata accessor for Array(0LL, a8);
    *(void *)&__int128 v28 = a1;
    *((void *)&v28 + 1) = a2;
    *(void *)&v29[0] = a3;
    *((void *)&v29[0] + 1) = a5;
    *(void *)&__int128 v30 = v17;
    *((void *)&v30 + 1) = &_swiftEmptySetSingleton;
    char v31 = 1;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRetain(a5);
    sub_10004E740((uint64_t)&v23, &qword_1000B9888);
  }

  sub_10003D8D8((uint64_t)v29 + 8, (uint64_t)&v23);
  if (!*((void *)&v24 + 1))
  {
    sub_10004E740((uint64_t)&v23, &qword_1000B9360);
    goto LABEL_8;
  }

  uint64_t v18 = type metadata accessor for Array(0LL, a8);
  if (!swift_dynamicCast(&v22, &v23, (char *)&type metadata for Any + 8, v18, 6LL))
  {
LABEL_8:
    uint64_t v22 = a5;
    swift_bridgeObjectRetain(a5);
  }

  if (v31 == 1)
  {
    type metadata accessor for Array(0LL, a8);
    Array.removeAll(keepingCapacity:)(0);
    char v31 = 0;
  }

  a6(&v22);
  uint64_t v19 = v22;
  *((void *)&v24 + 1) = type metadata accessor for Array(0LL, a8);
  *(void *)&__int128 v23 = v19;
  sub_1000671BC((uint64_t)&v23, (uint64_t)v29 + 8);
  uint64_t v20 = swift_bridgeObjectRetain(a4);
  sub_10005750C(v20);
  sub_10007029C((uint64_t *)&v28);
  return sub_10003D920(&v28);
}

uint64_t sub_10006FD1C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *v4;
  if (*(void *)(v6 + 16))
  {
    uint64_t v9 = result;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    unint64_t v10 = sub_100058C68(v9, a2, a3);
    if ((v11 & 1) != 0)
    {
      sub_10005BD20(*(void *)(v6 + 56) + 72 * v10, a4);
    }

    else
    {
      *(_BYTE *)(a4 + 64) = 0;
      *(_OWORD *)(a4 + 32) = 0u;
      *(_OWORD *)(a4 + 48) = 0u;
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
    }

    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(a2);
  }

  else
  {
    *(_BYTE *)(a4 + 64) = 0;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }

  return result;
}

uint64_t sub_10006FDDC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5 = v4;
  if (*(void *)(a1 + 8))
  {
    __int128 v9 = *(_OWORD *)(a1 + 48);
    v15[2] = *(_OWORD *)(a1 + 32);
    v15[3] = v9;
    char v16 = *(_BYTE *)(a1 + 64);
    __int128 v10 = *(_OWORD *)(a1 + 16);
    v15[0] = *(_OWORD *)a1;
    v15[1] = v10;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v4);
    uint64_t v14 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    sub_100071CE0((uint64_t)v15, a2, a3, a4, isUniquelyReferenced_nonNull_native);
    uint64_t v12 = *v4;
    *uint64_t v5 = v14;
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a3);
    return swift_bridgeObjectRelease(v12);
  }

  else
  {
    sub_10004E740(a1, &qword_1000B9888);
    sub_10007192C(a2, a3, a4, (uint64_t)v15);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a3);
    return sub_10004E740((uint64_t)v15, &qword_1000B9888);
  }

void *sub_10006FEDC( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(char *), uint64_t a7, uint64_t a8)
{
  uint64_t v40 = a7;
  __int128 v41 = a6;
  uint64_t v45 = a5;
  uint64_t v42 = a4;
  uint64_t v39 = type metadata accessor for Optional(0LL, a8);
  uint64_t v38 = *(void *)(v39 - 8);
  uint64_t v13 = __chkstk_darwin(v39);
  uint64_t v15 = (char *)&v35 - v14;
  uint64_t v16 = *(void *)(a8 - 8);
  uint64_t v17 = __chkstk_darwin(v13);
  unsigned int v44 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v35 - v20;
  __chkstk_darwin(v19);
  __int128 v23 = (char *)&v35 - v22;
  __int128 v24 = v8[1];
  __int128 v54 = *v8;
  __int128 v55 = v24;
  char v43 = v8;
  uint64_t v56 = *((void *)v8 + 4);
  uint64_t v37 = a1;
  sub_10006FD1C(a1, a2, a3, (uint64_t)v48);
  __int128 v25 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v25(v23, v45, a8);
  if (*((void *)&v48[0] + 1))
  {
    __int128 v26 = *(void (**)(char *, uint64_t))(v16 + 8);
    v26(v23, a8);
    v51[1] = v48[2];
    __int128 v52 = v48[3];
    char v53 = v49;
    __int128 v50 = v48[0];
    v51[0] = v48[1];
  }

  else
  {
    uint64_t v47 = a8;
    char v27 = (char *)sub_10000B40C(v46);
    v25(v27, (uint64_t)v23, a8);
    __int128 v26 = *(void (**)(char *, uint64_t))(v16 + 8);
    __int128 v36 = v25;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    v26(v23, a8);
    *(void *)&__int128 v50 = v37;
    *((void *)&v50 + 1) = a2;
    __int128 v25 = v36;
    *(void *)&v51[0] = a3;
    sub_10004E85C((uint64_t)v46, (uint64_t)v51 + 8);
    *((void *)&v52 + 1) = &_swiftEmptySetSingleton;
    char v53 = 1;
    sub_10004E740((uint64_t)v48, &qword_1000B9888);
  }

  sub_10003D8D8((uint64_t)v51 + 8, (uint64_t)v46);
  uint64_t v28 = sub_100005104(&qword_1000B9360);
  int v29 = swift_dynamicCast(v15, v46, v28, a8, 6LL);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v15, v29 ^ 1u, 1LL, a8);
  __int128 v30 = v44;
  v25(v44, v45, a8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1LL, a8) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v30, a8);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v15, v39);
  }

  else
  {
    v26(v30, a8);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v21, v15, a8);
  }

  uint64_t v31 = v42;
  v41(v21);
  uint64_t v47 = a8;
  __int128 v32 = (char *)sub_10000B40C(v46);
  v25(v32, (uint64_t)v21, a8);
  sub_1000671BC((uint64_t)v46, (uint64_t)v51 + 8);
  uint64_t v33 = swift_bridgeObjectRetain(v31);
  sub_10005750C(v33);
  sub_10007029C((uint64_t *)&v50);
  v26(v21, a8);
  return sub_10003D920(&v50);
}

void *sub_10007029C(uint64_t *a1)
{
  uint64_t v3 = *v1;
  if (*(void *)(v3 + 16))
  {
    uint64_t v5 = *a1;
    uint64_t v4 = a1[1];
    uint64_t v6 = (void *)a1[2];
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRetain(v6);
    unint64_t v7 = sub_100058C68(v5, v4, v6);
    if ((v8 & 1) != 0)
    {
      sub_10005BD20(*(void *)(v3 + 56) + 72 * v7, (uint64_t)&v17);
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(v4);
      if (*((void *)&v17 + 1))
      {
        v22[2] = v19;
        __int128 v23 = v20;
        char v24 = v21;
        v22[0] = v17;
        v22[1] = v18;
        sub_10005BD20((uint64_t)a1, (uint64_t)&v17);
        uint64_t v9 = swift_bridgeObjectRetain(*((void *)&v23 + 1));
        sub_10005750C(v9);
        __int128 v10 = v17;
        char v11 = (void *)v18;
        sub_10005BD20((uint64_t)&v17, (uint64_t)v16);
        swift_bridgeObjectRetain(*((void *)&v10 + 1));
        swift_bridgeObjectRetain(v11);
        sub_10006FDDC((uint64_t)v16, v10, *((uint64_t *)&v10 + 1), v11);
        sub_10003D920(&v17);
        return sub_10003D920(v22);
      }
    }

    else
    {
      char v21 = 0;
      __int128 v19 = 0u;
      __int128 v20 = 0u;
      __int128 v17 = 0u;
      __int128 v18 = 0u;
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(v4);
    }
  }

  else
  {
    char v21 = 0;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
  }

  sub_10004E740((uint64_t)&v17, &qword_1000B9888);
  uint64_t v13 = *a1;
  uint64_t v14 = a1[1];
  uint64_t v15 = (void *)a1[2];
  sub_10005BD20((uint64_t)a1, (uint64_t)v22);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  return (void *)sub_10006FDDC((uint64_t)v22, v13, v14, v15);
}

void *sub_10007044C()
{
  uint64_t v1 = v0;
  sub_100005104(qword_1000B9608);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    __n128 result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  __n128 result = (void *)(v3 + 64);
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

    if (__OFADD__(v9++, 1LL)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    if (!v25) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 24 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + 24 * v15;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v20 = 8 * v15;
    uint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    uint64_t v22 = *(void *)(v4 + 48) + v16;
    unsigned __int8 v23 = *(_BYTE *)(v17 + 16);
    *(void *)uint64_t v22 = *(void *)v17;
    *(void *)(v22 + 8) = v19;
    *(_BYTE *)(v22 + 16) = v23;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    __n128 result = (void *)sub_100030508(v18, v19, v23);
  }

  int64_t v26 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v25 = *(void *)(v6 + 8 * v26);
  if (v25)
  {
    ++v9;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v9 = v26 + 1;
    if (__OFADD__(v26, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v25 = *(void *)(v6 + 8 * v9);
    ++v26;
    if (v25) {
      goto LABEL_23;
    }
  }

  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_1000705EC()
{
  uint64_t v1 = v0;
  sub_100005104(&qword_1000B9D28);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  __n128 result = (void *)(v3 + 64);
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

    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }

void *sub_1000707FC()
{
  uint64_t v1 = v0;
  sub_100005104(&qword_1000B9D38);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  __n128 result = (void *)(v3 + 64);
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

void *sub_1000709B0()
{
  uint64_t v1 = v0;
  sub_100005104(&qword_1000B9D30);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    __n128 result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  __n128 result = (void *)(v3 + 64);
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

    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }

Swift::Int sub_100070B58(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005104(qword_1000B9608);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_47;
  }
  __int128 v36 = v3;
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v39 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v38 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v14 = 0LL;
  char v37 = a2;
  while (1)
  {
    if (v11)
    {
      unint64_t v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v18 = v17 | (v14 << 6);
      goto LABEL_23;
    }

    if (__OFADD__(v14++, 1LL)) {
      goto LABEL_49;
    }
    if (v14 >= v38) {
      break;
    }
    unint64_t v20 = (void *)(v5 + 64);
    unint64_t v21 = *(void *)(v39 + 8 * v14);
    if (!v21)
    {
      int64_t v22 = v14 + 1;
      if (v14 + 1 >= v38)
      {
LABEL_40:
        swift_release(v5);
        uint64_t v3 = v36;
        if ((a2 & 1) == 0) {
          goto LABEL_47;
        }
        goto LABEL_43;
      }

      unint64_t v21 = *(void *)(v39 + 8 * v22);
      if (!v21)
      {
        while (1)
        {
          int64_t v14 = v22 + 1;
          if (__OFADD__(v22, 1LL)) {
            break;
          }
          if (v14 >= v38) {
            goto LABEL_40;
          }
          unint64_t v21 = *(void *)(v39 + 8 * v14);
          ++v22;
          if (v21) {
            goto LABEL_22;
          }
        }

LABEL_48:
        __break(1u);
LABEL_49:
        __break(1u);
        return result;
      }

      ++v14;
    }

Swift::Int sub_100070EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005104(&qword_1000B9D28);
  char v51 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_48;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  __int128 v50 = (void *)(v5 + 64);
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  uint64_t v48 = v3;
  int64_t v49 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  for (int64_t i = 0LL; ; int64_t i = v52)
  {
    if (v11)
    {
      unint64_t v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v23 = v22 | (i << 6);
      goto LABEL_25;
    }

    int64_t v24 = i + 1;
    if (__OFADD__(i, 1LL))
    {
LABEL_49:
      __break(1u);
LABEL_50:
      __break(1u);
      return result;
    }

    if (v24 >= v49) {
      break;
    }
    uint64_t v25 = v50;
    unint64_t v26 = v50[v24];
    ++i;
    if (!v26)
    {
      int64_t i = v24 + 1;
      if (v24 + 1 >= v49) {
        goto LABEL_41;
      }
      unint64_t v26 = v50[i];
      if (!v26)
      {
        int64_t v27 = v24 + 2;
        if (v27 >= v49)
        {
LABEL_41:
          swift_release(v5);
          uint64_t v3 = v48;
          if ((v51 & 1) == 0) {
            goto LABEL_48;
          }
          goto LABEL_44;
        }

        unint64_t v26 = v50[v27];
        if (!v26)
        {
          while (1)
          {
            int64_t i = v27 + 1;
            if (__OFADD__(v27, 1LL)) {
              goto LABEL_50;
            }
            if (i >= v49) {
              goto LABEL_41;
            }
            unint64_t v26 = v50[i];
            ++v27;
            if (v26) {
              goto LABEL_24;
            }
          }
        }

        int64_t i = v27;
      }
    }

Swift::Int sub_1000712CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005104(&qword_1000B9D38);
  char v37 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v35 = (unint64_t)(v9 + 63) >> 6;
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

    if (v22 >= v35) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v35) {
        goto LABEL_36;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1LL)) {
              goto LABEL_45;
            }
            if (v14 >= v35) {
              goto LABEL_36;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_33;
            }
          }
        }

        int64_t v14 = v25;
      }
    }

Swift::Int sub_1000715E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  Swift::Int v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005104(&qword_1000B9D30);
  Swift::Int result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  Swift::Int v8 = result;
  if (*(void *)(v5 + 16))
  {
    uint64_t v33 = v3;
    int64_t v9 = 0LL;
    int64_t v35 = (void *)(v5 + 64);
    uint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1LL << v10);
    }
    else {
      uint64_t v11 = -1LL;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v34 = (unint64_t)(v10 + 63) >> 6;
    Swift::Int v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v20 = v19 | (v9 << 6);
      }

      else
      {
        int64_t v21 = v9 + 1;
        if (__OFADD__(v9, 1LL))
        {
LABEL_44:
          __break(1u);
LABEL_45:
          __break(1u);
          return result;
        }

        Swift::Int result = v5 + 64;
        if (v21 >= v34) {
          goto LABEL_36;
        }
        unint64_t v22 = v35[v21];
        ++v9;
        if (!v22)
        {
          int64_t v9 = v21 + 1;
          if (v21 + 1 >= v34) {
            goto LABEL_36;
          }
          unint64_t v22 = v35[v9];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v34)
            {
LABEL_36:
              if ((a2 & 1) == 0)
              {
                Swift::Int result = swift_release(v5);
                uint64_t v3 = v33;
                goto LABEL_43;
              }

              uint64_t v32 = 1LL << *(_BYTE *)(v5 + 32);
              if (v32 >= 64) {
                bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
              }
              else {
                *int64_t v35 = -1LL << v32;
              }
              uint64_t v3 = v33;
              *(void *)(v5 + 16) = 0LL;
              break;
            }

            unint64_t v22 = v35[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v9 = v23 + 1;
                if (__OFADD__(v23, 1LL)) {
                  goto LABEL_45;
                }
                if (v9 >= v34) {
                  goto LABEL_36;
                }
                unint64_t v22 = v35[v9];
                ++v23;
                if (v22) {
                  goto LABEL_33;
                }
              }
            }

            int64_t v9 = v23;
          }
        }

unint64_t sub_1000718C0( unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  a6[(result >> 6) + 8] |= 1LL << result;
  uint64_t v6 = (void *)(a6[6] + 24 * result);
  *uint64_t v6 = a2;
  v6[1] = a3;
  v6[2] = a4;
  uint64_t v7 = a6[7] + 72 * result;
  *(_BYTE *)(v7 + 64) = *(_BYTE *)(a5 + 64);
  __int128 v8 = *(_OWORD *)(a5 + 48);
  *(_OWORD *)(v7 + 32) = *(_OWORD *)(a5 + 32);
  *(_OWORD *)(v7 + 48) = v8;
  __int128 v9 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)a5;
  *(_OWORD *)(v7 + 16) = v9;
  uint64_t v10 = a6[2];
  BOOL v11 = __OFADD__(v10, 1LL);
  uint64_t v12 = v10 + 1;
  if (v11) {
    __break(1u);
  }
  else {
    a6[2] = v12;
  }
  return result;
}

double sub_10007192C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  Swift::Int v5 = v4;
  uint64_t v10 = *v5;
  swift_bridgeObjectRetain(*v5);
  unint64_t v11 = sub_100058C68(a1, a2, a3);
  LOBYTE(a3) = v12;
  swift_bridgeObjectRelease(v10);
  if ((a3 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v5);
    uint64_t v14 = *v5;
    uint64_t v22 = *v5;
    *Swift::Int v5 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1000705EC();
      uint64_t v14 = v22;
    }

    uint64_t v15 = *(void *)(v14 + 48) + 24 * v11;
    uint64_t v16 = *(void *)(v15 + 8);
    swift_bridgeObjectRelease(*(void *)(v15 + 16));
    swift_bridgeObjectRelease(v16);
    uint64_t v17 = *(void *)(v14 + 56) + 72 * v11;
    __int128 v18 = *(_OWORD *)(v17 + 48);
    *(_OWORD *)(a4 + 32) = *(_OWORD *)(v17 + 32);
    *(_OWORD *)(a4 + 48) = v18;
    *(_BYTE *)(a4 + 64) = *(_BYTE *)(v17 + 64);
    __int128 v19 = *(_OWORD *)(v17 + 16);
    *(_OWORD *)a4 = *(_OWORD *)v17;
    *(_OWORD *)(a4 + 16) = v19;
    sub_100071A4C(v11, v14);
    uint64_t v20 = *v5;
    *Swift::Int v5 = v14;
    swift_bridgeObjectRelease(v20);
  }

  else
  {
    *(_BYTE *)(a4 + 64) = 0;
    double result = 0.0;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }

  return result;
}

unint64_t sub_100071A4C(unint64_t result, uint64_t a2)
{
  uint64_t v2 = a2;
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    double result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      unint64_t v35 = v8;
      do
      {
        __int128 v9 = (uint64_t *)(*(void *)(v2 + 48) + 24 * v6);
        uint64_t v10 = *v9;
        uint64_t v11 = v9[1];
        uint64_t v12 = v9[2];
        Hasher.init(_seed:)(v37, *(void *)(v2 + 40));
        swift_bridgeObjectRetain(v11);
        swift_bridgeObjectRetain(v12);
        String.hash(into:)(v37, v10, v11);
        Hasher._combine(_:)(*(void *)(v12 + 16));
        uint64_t v13 = *(void *)(v12 + 16);
        if (v13)
        {
          int64_t v36 = v3;
          uint64_t v14 = v2;
          uint64_t v15 = v7;
          uint64_t v16 = v4;
          swift_bridgeObjectRetain(v12);
          uint64_t v17 = (void *)(v12 + 40);
          do
          {
            uint64_t v18 = *(v17 - 1);
            uint64_t v19 = *v17;
            swift_bridgeObjectRetain(*v17);
            String.hash(into:)(v37, v18, v19);
            swift_bridgeObjectRelease(v19);
            v17 += 2;
            --v13;
          }

          while (v13);
          swift_bridgeObjectRelease(v12);
          uint64_t v4 = v16;
          uint64_t v7 = v15;
          uint64_t v2 = v14;
          unint64_t v8 = v35;
          int64_t v3 = v36;
        }

        Swift::Int v20 = Hasher._finalize()();
        swift_bridgeObjectRelease(v12);
        double result = swift_bridgeObjectRelease(v11);
        unint64_t v21 = v20 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v21 < v8) {
            goto LABEL_5;
          }
        }

        else if (v21 >= v8)
        {
          goto LABEL_15;
        }

        if (v3 >= (uint64_t)v21)
        {
LABEL_15:
          uint64_t v22 = *(void *)(v2 + 48);
          unint64_t v23 = v22 + 24 * v3;
          char v24 = (__int128 *)(v22 + 24 * v6);
          if (v3 != v6 || v23 >= (unint64_t)v24 + 24)
          {
            __int128 v25 = *v24;
            *(void *)(v23 + 16) = *((void *)v24 + 2);
            *(_OWORD *)unint64_t v23 = v25;
          }

          uint64_t v26 = *(void *)(v2 + 56);
          double result = v26 + 72 * v3;
          uint64_t v27 = (const void *)(v26 + 72 * v6);
          if (72 * v3 < (uint64_t)(72 * v6) || result >= (unint64_t)v27 + 72 || (v28 = v3 == v6, int64_t v3 = v6, !v28))
          {
            double result = (unint64_t)memmove((void *)result, v27, 0x48uLL);
            int64_t v3 = v6;
          }
        }

uint64_t sub_100071CE0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, char a5)
{
  unint64_t v6 = (void **)v5;
  uint64_t v12 = (void *)*v5;
  unint64_t v14 = sub_100058C68(a2, a3, a4);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }

  else
  {
    char v18 = v13;
    uint64_t v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      Swift::Int v20 = *v6;
      if ((v18 & 1) != 0) {
        return sub_100071E2C(a1, v20[7] + 72 * v14);
      }
      goto LABEL_11;
    }

    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_1000705EC();
      goto LABEL_7;
    }

    sub_100070EC4(v17, a5 & 1);
    unint64_t v22 = sub_100058C68(a2, a3, a4);
    if ((v18 & 1) == (v23 & 1))
    {
      unint64_t v14 = v22;
      Swift::Int v20 = *v6;
      if ((v18 & 1) != 0) {
        return sub_100071E2C(a1, v20[7] + 72 * v14);
      }
LABEL_11:
      sub_1000718C0(v14, a2, a3, (uint64_t)a4, a1, v20);
      swift_bridgeObjectRetain(a3);
      return swift_bridgeObjectRetain(a4);
    }
  }

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for InputKey);
  __break(1u);
  return result;
}

uint64_t sub_100071E2C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t destroy for ParserError(uint64_t a1)
{
  return sub_10006749C( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(_BYTE *)(a1 + 80));
}

uint64_t initializeWithCopy for ParserError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v13 = *(void *)(a2 + 72);
  char v14 = *(_BYTE *)(a2 + 80);
  sub_100067314(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for ParserError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = *(void *)(a2 + 64);
  uint64_t v24 = *(void *)(a2 + 72);
  char v25 = *(_BYTE *)(a2 + 80);
  sub_100067314(*(void *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v20 = *(void *)(a1 + 64);
  uint64_t v21 = *(void *)(a1 + 72);
  char v22 = *(_BYTE *)(a1 + 80);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(void *)(a1 + 48) = v9;
  *(void *)(a1 + 56) = v10;
  *(void *)(a1 + 64) = v11;
  *(void *)(a1 + 72) = v24;
  *(_BYTE *)(a1 + 80) = v25;
  sub_10006749C(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

__n128 initializeWithTake for ParserError(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for ParserError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 80);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  char v14 = *(_BYTE *)(a1 + 80);
  __int128 v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  __int128 v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = v3;
  sub_10006749C(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for ParserError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xF1 && *(_BYTE *)(a1 + 81)) {
    return (*(_DWORD *)a1 + 241);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 <= 0xF) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ParserError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF0)
  {
    *(void *)(result + 72) = 0LL;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(void *)__n128 result = a2 - 241;
    if (a3 >= 0xF1) {
      *(_BYTE *)(result + 81) = 1;
    }
  }

  else
  {
    if (a3 >= 0xF1) {
      *(_BYTE *)(result + 81) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 80) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100072168(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 15);
  }
}

uint64_t sub_100072180(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xF)
  {
    *(void *)__n128 result = a2 - 15;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(void *)(result + 72) = 0LL;
    LOBYTE(a2) = 15;
  }

  *(_BYTE *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ParserError()
{
  return &type metadata for ParserError;
}

uint64_t destroy for InternalParseError(uint64_t result)
{
  uint64_t v1 = result;
  unsigned int v2 = *(unsigned __int8 *)(result + 56);
  if (v2 >= 4) {
    unsigned int v2 = *(_DWORD *)result + 4;
  }
  if (!v2)
  {
    if (*(void *)(result + 24)) {
      sub_1000062D8((void *)result);
    }
    swift_bridgeObjectRelease(*(void *)(v1 + 40));
    return swift_bridgeObjectRelease(*(void *)(v1 + 48));
  }

  return result;
}

uint64_t initializeWithCopy for InternalParseError(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = *(unsigned __int8 *)(a2 + 56);
  if (v4 >= 4) {
    unsigned int v4 = *(_DWORD *)a2 + 4;
  }
  switch(v4)
  {
    case 0u:
      uint64_t v5 = *(void *)(a2 + 24);
      if (v5)
      {
        *(void *)(a1 + 24) = v5;
        (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
      }

      else
      {
        __int128 v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
      }

      uint64_t v8 = *(void *)(a2 + 40);
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = v8;
      uint64_t v9 = *(void *)(a2 + 48);
      *(void *)(a1 + 48) = v9;
      *(_BYTE *)(a1 + 56) = 0;
      swift_bridgeObjectRetain(v8);
      swift_bridgeObjectRetain(v9);
      break;
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_BYTE *)(a1 + 56) = 1;
      break;
    case 2u:
      *(void *)a1 = *(void *)a2;
      *(_BYTE *)(a1 + 56) = 2;
      break;
    case 3u:
      *(void *)a1 = *(void *)a2;
      *(_BYTE *)(a1 + 56) = 3;
      break;
    default:
      __int128 v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
      break;
  }

  return a1;
}

uint64_t assignWithCopy for InternalParseError(uint64_t a1, __int128 *a2)
{
  if ((__int128 *)a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    if (!v4)
    {
      if (*(void *)(a1 + 24)) {
        sub_1000062D8((void *)a1);
      }
      swift_bridgeObjectRelease(*(void *)(a1 + 40));
      swift_bridgeObjectRelease(*(void *)(a1 + 48));
    }

    unsigned int v5 = *((unsigned __int8 *)a2 + 56);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 0u:
        uint64_t v6 = *((void *)a2 + 3);
        if (v6)
        {
          *(void *)(a1 + 24) = v6;
          (**(void (***)(uint64_t, __int128 *))(v6 - 8))(a1, a2);
        }

        else
        {
          __int128 v10 = a2[1];
          *(_OWORD *)a1 = *a2;
          *(_OWORD *)(a1 + 16) = v10;
        }

        *(void *)(a1 + 32) = *((void *)a2 + 4);
        uint64_t v11 = *((void *)a2 + 5);
        *(void *)(a1 + 40) = v11;
        uint64_t v12 = *((void *)a2 + 6);
        *(void *)(a1 + 48) = v12;
        *(_BYTE *)(a1 + 56) = 0;
        swift_bridgeObjectRetain(v11);
        swift_bridgeObjectRetain(v12);
        break;
      case 1u:
        *(_OWORD *)a1 = *a2;
        *(_BYTE *)(a1 + 56) = 1;
        break;
      case 2u:
        *(void *)a1 = *(void *)a2;
        *(_BYTE *)(a1 + 56) = 2;
        break;
      case 3u:
        *(void *)a1 = *(void *)a2;
        *(_BYTE *)(a1 + 56) = 3;
        break;
      default:
        __int128 v7 = *a2;
        __int128 v8 = a2[1];
        __int128 v9 = a2[2];
        *(_OWORD *)(a1 + 41) = *(__int128 *)((char *)a2 + 41);
        *(_OWORD *)(a1 + 16) = v8;
        *(_OWORD *)(a1 + 32) = v9;
        *(_OWORD *)a1 = v7;
        break;
    }
  }

  return a1;
}

__n128 initializeWithTake for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for InternalParseError(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 56);
    if (v4 >= 4) {
      unsigned int v4 = *(_DWORD *)a1 + 4;
    }
    if (!v4)
    {
      if (*(void *)(a1 + 24)) {
        sub_1000062D8((void *)a1);
      }
      swift_bridgeObjectRelease(*(void *)(a1 + 40));
      swift_bridgeObjectRelease(*(void *)(a1 + 48));
    }

    unsigned int v5 = *(unsigned __int8 *)(a2 + 56);
    if (v5 >= 4) {
      unsigned int v5 = *(_DWORD *)a2 + 4;
    }
    switch(v5)
    {
      case 0u:
        __int128 v6 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v6;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(void *)(a1 + 48) = *(void *)(a2 + 48);
        *(_BYTE *)(a1 + 56) = 0;
        return a1;
      case 1u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        char v8 = 1;
        goto LABEL_16;
      case 2u:
        *(void *)a1 = *(void *)a2;
        char v8 = 2;
        goto LABEL_16;
      case 3u:
        *(void *)a1 = *(void *)a2;
        char v8 = 3;
LABEL_16:
        *(_BYTE *)(a1 + 56) = v8;
        break;
      default:
        __int128 v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
        break;
    }
  }

  return a1;
}

uint64_t getEnumTagSinglePayload for InternalParseError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 56);
  if (v3 >= 5) {
    return (v3 ^ 0xFF) + 1;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for InternalParseError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_OWORD *)(result + 41) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)__n128 result = 0u;
    *(_DWORD *)__n128 result = a2 - 252;
    if (a3 >= 0xFC) {
      *(_BYTE *)(result + 57) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFC) {
      *(_BYTE *)(result + 57) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 56) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100072614(uint64_t a1)
{
  uint64_t result = *(unsigned __int8 *)(a1 + 56);
  return result;
}

uint64_t sub_100072630(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(void *)(result + 48) = 0LL;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)uint64_t result = 0u;
    *(_DWORD *)uint64_t result = a2 - 4;
    LOBYTE(a2) = 4;
  }

  *(_BYTE *)(result + 56) = a2;
  return result;
}

ValueMetadata *type metadata accessor for InternalParseError()
{
  return &type metadata for InternalParseError;
}

uint64_t sub_10007266C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *v4;
  uint64_t v7 = v4[1];
  uint64_t result = sub_100075A84(a1, a2, a3 & 0x1FF, *v4, v7);
  int64x2_t v9 = 0uLL;
  if ((v10 & 1) != 0) {
    goto LABEL_16;
  }
  if (v7 < 0)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  int64_t v11 = result;
  int64_t v12 = *(void *)(v6 + 16);
  if (result >= v7)
  {
    if (result != v12)
    {
      uint64_t v14 = v6 + (result << 6) + 48;
      while (1)
      {
        if (v11 >= v12)
        {
          __break(1u);
          goto LABEL_19;
        }

        if ((*(_BYTE *)(v14 + 40) & 1) != 0) {
          break;
        }
        ++v11;
        v14 += 64LL;
        if (v12 == v11) {
          goto LABEL_16;
        }
      }

      if ((*(void *)v14 & 0x6000000000000000LL) != 0x2000000000000000LL) {
        goto LABEL_16;
      }
      uint64_t v15 = *(void *)(v14 - 16);
      uint64_t v16 = *(void *)(v14 - 8);
      uint64_t v17 = *(void *)(v14 + 24);
      int64x2_t v18 = vdupq_n_s64(1uLL);
      v18.i64[0] = *(void *)(v14 + 32);
      int64x2_t v19 = v18;
      sub_10005BDF8(v15, v16, *(void *)v14, *(void *)(v14 + 8), *(void *)(v14 + 16));
      uint64_t result = (uint64_t)sub_100074228((char **)v4, v11);
      int64x2_t v9 = v19;
      goto LABEL_17;
    }

uint64_t sub_10007278C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, void *a4@<X8>)
{
  uint64_t v6 = *v4;
  uint64_t v7 = v4[1];
  uint64_t result = sub_100075A84(a1, a2, a3 & 0x1FF, *v4, v7);
  if ((v9 & 1) != 0) {
    goto LABEL_16;
  }
  if (v7 < 0)
  {
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }

  int64_t v10 = result;
  int64_t v11 = *(void *)(v6 + 16);
  if (result < v7) {
    goto LABEL_25;
  }
  if (result == v11)
  {
LABEL_16:
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    goto LABEL_17;
  }

  uint64_t result = swift_bridgeObjectRetain(v6);
  uint64_t v13 = v6 + (v10 << 6) + 48;
  while (1)
  {
    if (v10 >= v11)
    {
      __break(1u);
      goto LABEL_23;
    }

    uint64_t v14 = (*(void *)v13 >> 61) & 3LL;
    if ((_DWORD)v14) {
      break;
    }
LABEL_10:
    ++v10;
    v13 += 64LL;
    if (v11 == v10)
    {
      uint64_t result = swift_bridgeObjectRelease(v6);
      goto LABEL_16;
    }
  }

  if ((_DWORD)v14 == 2)
  {
    uint64_t result = sub_100066ED8( *(void *)(v13 - 16),  *(void *)(v13 - 8),  *(void *)v13,  *(void *)(v13 + 8),  *(void *)(v13 + 16));
    goto LABEL_10;
  }

  uint64_t result = swift_bridgeObjectRelease(v6);
  int64_t v20 = *(void *)(v6 + 16);
  if (v20 < v7) {
    goto LABEL_26;
  }
  if (v10 >= v20)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    return result;
  }

  unint64_t v21 = *(void *)v13;
  if ((*(void *)v13 & 0x6000000000000000LL) != 0x2000000000000000LL) {
    goto LABEL_28;
  }
  uint64_t v22 = *(void *)(v13 + 8);
  uint64_t v23 = *(void *)(v13 + 16);
  uint64_t v18 = *(void *)(v13 - 16);
  uint64_t v19 = *(void *)(v13 - 8);
  uint64_t v17 = *(unsigned __int8 *)(v13 + 40);
  uint64_t v24 = v13 + 24;
  uint64_t v15 = *(void *)(v13 + 24);
  uint64_t v16 = *(void *)(v24 + 8);
  sub_10005BDF8(v18, v19, v21, v22, v23);
  uint64_t result = (uint64_t)sub_100074228((char **)v4, v10);
LABEL_17:
  *a4 = v15;
  a4[1] = v16;
  a4[2] = v17;
  a4[3] = v18;
  a4[4] = v19;
  return result;
}

uint64_t sub_1000728F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v6 = *v4;
  uint64_t v7 = v4[1];
  uint64_t result = sub_100075A84(a1, a2, a3 & 0x1FF, *v4, v7);
  int64x2_t v9 = 0uLL;
  if ((v10 & 1) != 0) {
    goto LABEL_13;
  }
  if (v7 < 0)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    return result;
  }

  int64_t v11 = *(void *)(v6 + 16);
  if (result < v7) {
    goto LABEL_21;
  }
  if (result != v11)
  {
    uint64_t v13 = (_BYTE *)(v6 + (result << 6) + 88);
    while (1)
    {
      if (result >= v11)
      {
        __break(1u);
        goto LABEL_19;
      }

      if ((*v13 & 1) != 0) {
        break;
      }
      ++result;
      v13 += 64;
      if (v11 == result) {
        goto LABEL_13;
      }
    }

    unint64_t v14 = *((void *)v13 - 2);
    uint64_t v16 = *((void *)v13 - 1);
    uint64_t result = sub_100074388(v14, v16, 1);
    if ((v14 & 0x8000000000000000LL) != 0) {
      goto LABEL_22;
    }
    uint64_t v17 = v4[2];
    if (v14 < *(void *)(v17 + 16))
    {
      unint64_t v18 = v17 + 16 * v14;
      uint64_t v15 = *(void *)(v18 + 32);
      uint64_t result = swift_bridgeObjectRetain(*(void *)(v18 + 40));
      int64x2_t v9 = vdupq_n_s64(1uLL);
      v9.i64[0] = v16;
      goto LABEL_14;
    }

    goto LABEL_23;
  }

uint64_t sub_100072A00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1[1];
  uint64_t v4 = *(void *)(*v1 + 16LL);
  if (v4 < v3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  if (v3 < 0)
  {
LABEL_13:
    __break(1u);
    return result;
  }

  __int128 v5 = 0uLL;
  if (v3 != v4)
  {
    uint64_t v6 = *v1 + (v3 << 6) + 48;
    while (v3 < v4)
    {
      if ((*(void *)v6 & 0x6000000000000000LL) == 0x2000000000000000LL)
      {
        uint64_t v8 = *(void *)(v6 - 16);
        uint64_t v9 = *(void *)(v6 - 8);
        __int128 v11 = *(_OWORD *)(v6 + 24);
        uint64_t v7 = *(unsigned __int8 *)(v6 + 40);
        sub_10005BDF8(v8, v9, *(void *)v6, *(void *)(v6 + 8), *(void *)(v6 + 16));
        uint64_t result = sub_100074524(v3);
        __int128 v5 = v11;
        goto LABEL_10;
      }

      ++v3;
      v6 += 64LL;
      if (v4 == v3) {
        goto LABEL_8;
      }
    }

    __break(1u);
    goto LABEL_12;
  }

void *sub_100072ADC(void *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = result[2];
  if (v3 < a2)
  {
    __break(1u);
    goto LABEL_17;
  }

  if (a2 < 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  uint64_t v6 = result;
  uint64_t v7 = v3 - a2;
  if (v3 == a2)
  {
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
LABEL_15:
    swift_bridgeObjectRetain(v6);
    uint64_t v13 = sub_100074E94(v6 + 4, a2, (2 * v3) | 1, v8);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(a3);
    unint64_t v14 = sub_10007509C((uint64_t)v13, a3);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(v6);
    return v14;
  }

  if (v3 > (unint64_t)a2)
  {
    swift_bridgeObjectRetain(result);
    uint64_t v9 = &v6[8 * a2 + 11];
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
    do
    {
      if (*v9 == 1)
      {
        uint64_t v10 = *((void *)v9 - 2);
        if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0) {
          uint64_t v8 = sub_100058538(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        }
        unint64_t v12 = *((void *)v8 + 2);
        unint64_t v11 = *((void *)v8 + 3);
        if (v12 >= v11 >> 1) {
          uint64_t v8 = sub_100058538((char *)(v11 > 1), v12 + 1, 1, v8);
        }
        *((void *)v8 + 2) = v12 + 1;
        *(void *)&v8[8 * v12 + 32] = v10;
      }

      v9 += 64;
      --v7;
    }

    while (v7);
    swift_bridgeObjectRelease(v6);
    goto LABEL_15;
  }

uint64_t sub_100072C84(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v6 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v6 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
LABEL_11:
    unint64_t v13 = String.count.getter(a1, a2);
    if (v13 < 2)
    {
      uint64_t v14 = sub_100005104(&qword_1000B9700);
      unint64_t v3 = swift_allocObject(v14, 96LL, 7LL);
      *(_OWORD *)(v3 + 16) = xmmword_100096510;
      *(void *)(v3 + 32) = a1;
      *(void *)(v3 + 40) = a2;
      *(void *)(v3 + 48) = 0x2000000000000000LL;
      *(void *)(v3 + 56) = 0LL;
      *(void *)(v3 + 64) = 0LL;
      *(void *)(v3 + 72) = a3;
      *(void *)(v3 + 80) = 0LL;
      *(_BYTE *)(v3 + 88) = 1;
      swift_bridgeObjectRetain(a2);
      return v3;
    }

    if (v13 != 2) {
      goto LABEL_27;
    }
    uint64_t v15 = sub_100005104(&qword_1000B9700);
    uint64_t v16 = swift_allocObject(v15, 96LL, 7LL);
    unint64_t v3 = v16;
    *(_OWORD *)(v16 + 16) = xmmword_100096510;
    *(void *)(v16 + 32) = 0LL;
    *(void *)(v16 + 40) = 0LL;
    *(void *)(v16 + 48) = 0x4000000000000000LL;
    *(void *)(v16 + 56) = 0LL;
    *(void *)(v16 + 64) = 0LL;
    *(void *)(v16 + 72) = a3;
    goto LABEL_15;
  }

  unint64_t v7 = 0LL;
  unint64_t v8 = 4 * v6;
  unint64_t v3 = 15LL;
  while (1)
  {
    uint64_t v10 = String.subscript.getter(v3, a1, a2);
    uint64_t v12 = v11;
    if (v10 == 45 && v11 == 0xE100000000000000LL)
    {
      swift_bridgeObjectRelease(0xE100000000000000LL);
      goto LABEL_7;
    }

    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v11, 45LL, 0xE100000000000000LL, 0LL);
    swift_bridgeObjectRelease(v12);
    if ((v9 & 1) == 0) {
      break;
    }
LABEL_7:
    unint64_t v3 = String.index(after:)(v3, a1, a2);
    unint64_t v7 = v3 >> 14;
    if (v3 >> 14 == v8) {
      goto LABEL_11;
    }
  }

  uint64_t v17 = String.distance(from:to:)(15LL, v3, a1, a2);
  if (v8 < v7)
  {
    __break(1u);
LABEL_48:
    uint64_t result = swift_bridgeObjectRelease(v12);
    __break(1u);
    return result;
  }

  uint64_t v18 = v17;
  uint64_t v19 = 7LL;
  if (((a2 >> 60) & ((a1 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v19 = 11LL;
  }
  uint64_t v20 = String.subscript.getter(v3, v19 | (v6 << 16), a1, a2);
  uint64_t v12 = v23;
  if (v18 == 1)
  {
    unint64_t v25 = v20;
    unint64_t v26 = v21;
    uint64_t v27 = v22;
    swift_bridgeObjectRetain(v23);
    sub_100075434(v25, v26, v27, v12, v67);
    if (v64)
    {
      swift_bridgeObjectRelease(v12);
      return v3;
    }

    uint64_t v60 = v67[0];
    uint64_t v62 = v67[1];
    uint64_t v35 = v67[3];
    uint64_t v65 = v67[2];
    uint64_t v36 = v67[4];
    sub_100066F84((uint64_t)v67, (uint64_t)&v70);
    if (v71 < 0)
    {
      v71 &= ~0x8000000000000000LL;
    }

    else
    {
      sub_100066FC0(&v70, &v72);
      sub_100066FC0(&v72, &v73);
      if (v74 >> 6 > 1u)
      {
        v74 &= 0x3Fu;
        uint64_t v39 = v73.n128_i64[1];
        uint64_t v38 = v73.n128_u64[0];
        sub_100030508(v60, v62, v65);
        char v37 = sub_100060EC4(v38, v39);
        sub_100066FFC(v67);
        goto LABEL_35;
      }

      v74 &= 0x3Fu;
    }

    char v37 = _swiftEmptyArrayStorage;
LABEL_35:
    uint64_t v40 = v37[2];
    if (v40)
    {
      if (v40 != 1)
      {
        swift_bridgeObjectRelease(v12);
        uint64_t v47 = sub_100005104(&qword_1000B9700);
        unint64_t v3 = swift_allocObject(v47, 96LL, 7LL);
        *(_OWORD *)(v3 + 16) = xmmword_100096510;
        *(void *)(v3 + 32) = v60;
        *(void *)(v3 + 40) = v62;
        *(void *)(v3 + 48) = v65;
        *(void *)(v3 + 56) = v35;
        *(void *)(v3 + 64) = v36;
        *(void *)(v3 + 72) = a3;
        *(void *)(v3 + 80) = 0LL;
        *(_BYTE *)(v3 + 88) = 1;
        uint64_t v48 = v37[2];
        if (v48)
        {
          unint64_t v61 = v37;
          int64_t v49 = v37 + 9;
          do
          {
            uint64_t v50 = *(v49 - 4);
            uint64_t v63 = *(v49 - 5);
            uint64_t v51 = *(v49 - 3);
            uint64_t v52 = *(v49 - 2);
            uint64_t v53 = *(v49 - 1);
            uint64_t v54 = *v49;
            sub_10005BE18(v50, v51, v52, v53, *v49);
            unint64_t v56 = *(void *)(v3 + 16);
            unint64_t v55 = *(void *)(v3 + 24);
            unint64_t v57 = v56 + 1;
            if (v56 >= v55 >> 1)
            {
              char v59 = sub_100058438((char *)(v55 > 1), v56 + 1, 1, (char *)v3);
              unint64_t v57 = v56 + 1;
              unint64_t v3 = (unint64_t)v59;
            }

            v49 += 6;
            *(void *)(v3 + 16) = v57;
            unint64_t v58 = v3 + (v56 << 6);
            *(void *)(v58 + 32) = v50;
            *(void *)(v58 + 40) = v51;
            *(void *)(v58 + 48) = v52;
            *(void *)(v58 + 56) = v53;
            *(void *)(v58 + 64) = v54;
            *(void *)(v58 + 72) = a3;
            *(void *)(v58 + 80) = v63;
            *(_BYTE *)(v58 + 88) = 0;
            --v48;
          }

          while (v48);
          swift_bridgeObjectRelease(v61);
        }

        else
        {
          swift_bridgeObjectRelease(v37);
        }

        return v3;
      }

      sub_100066FFC(v67);
      swift_bridgeObjectRelease(v37);
      uint64_t v41 = sub_100005104(&qword_1000B9700);
      uint64_t v42 = swift_allocObject(v41, 96LL, 7LL);
      *(_OWORD *)(v42 + 16) = xmmword_100096510;
      if ((v25 ^ v26) >> 14)
      {
        unint64_t v3 = v42;
        uint64_t v43 = Substring.subscript.getter(v25, v25, v26, v27, v12);
        uint64_t v45 = v44;
        swift_bridgeObjectRelease(v12);
        *(void *)(v3 + 32) = v43;
        *(void *)(v3 + 40) = v45;
        *(void *)(v3 + 48) = 64LL;
        *(void *)(v3 + 56) = 0LL;
        *(void *)(v3 + 64) = 0LL;
LABEL_26:
        *(void *)(v3 + 72) = a3;
        *(void *)(v3 + 80) = 0LL;
        *(_BYTE *)(v3 + 88) = 1;
        return v3;
      }

      goto LABEL_48;
    }

    swift_bridgeObjectRelease(v37);
    swift_bridgeObjectRelease(v12);
    uint64_t v46 = sub_100005104(&qword_1000B9700);
    uint64_t v16 = swift_allocObject(v46, 96LL, 7LL);
    unint64_t v3 = v16;
    *(_OWORD *)(v16 + 16) = xmmword_100096510;
    *(void *)(v16 + 32) = v60;
    *(void *)(v16 + 40) = v62;
    *(void *)(v16 + 48) = v65;
    *(void *)(v16 + 56) = v35;
    *(void *)(v16 + 64) = v36;
    *(void *)(v16 + 72) = a3;
LABEL_15:
    *(void *)(v16 + 80) = 0LL;
    *(_BYTE *)(v16 + 88) = 1;
    return v3;
  }

  if (!v18)
  {
    swift_bridgeObjectRelease(v23);
    uint64_t v24 = sub_100005104(&qword_1000B9700);
    unint64_t v3 = swift_allocObject(v24, 96LL, 7LL);
    *(_OWORD *)(v3 + 16) = xmmword_100096510;
    *(void *)(v3 + 32) = a1;
    *(void *)(v3 + 40) = a2;
    *(void *)(v3 + 48) = 0x2000000000000000LL;
    *(void *)(v3 + 56) = 0LL;
    *(void *)(v3 + 64) = 0LL;
    *(void *)(v3 + 72) = a3;
    *(void *)(v3 + 80) = 0LL;
    *(_BYTE *)(v3 + 88) = 1;
    swift_bridgeObjectRetain(a2);
    return v3;
  }

  swift_bridgeObjectRelease(v23);
  if (v18 == 2)
  {
    uint64_t v28 = sub_100005104(&qword_1000B9700);
    unint64_t v3 = swift_allocObject(v28, 96LL, 7LL);
    *(_OWORD *)(v3 + 16) = xmmword_100096510;
    swift_bridgeObjectRetain(a2);
    sub_1000732B4(a1, a2, (uint64_t *)v68);
    uint64_t v29 = v69;
    __int128 v30 = v68[1];
    *(_OWORD *)(v3 + 32) = v68[0];
    *(_OWORD *)(v3 + 48) = v30;
    *(void *)(v3 + 64) = v29;
    goto LABEL_26;
  }

unint64_t sub_1000732B4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v6 = sub_10007CD40(61LL, 0xE100000000000000LL, a1, a2);
  if ((v7 & 1) != 0)
  {
    uint64_t v9 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000LL) == 0) {
      uint64_t v9 = a1;
    }
    uint64_t v10 = v9 << 16;
    if ((a2 & 0x1000000000000000LL) == 0 || (a1 & 0x800000000000000LL) != 0) {
      unint64_t v8 = v10 | 7;
    }
    else {
      unint64_t v8 = v10 | 0xB;
    }
  }

  else
  {
    unint64_t v8 = v6;
  }

  unint64_t v11 = String.subscript.getter(15LL, v8, a1, a2);
  unint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v41 = v16;
  unint64_t v17 = sub_100014AA0(v8, a1, a2);
  unint64_t v19 = v18;
  uint64_t v21 = v20;
  unint64_t result = Substring.index(_:offsetBy:limitedBy:)(v17, 1LL, v19, v17, v19, v22, v20);
  if ((v24 & 1) != 0) {
    unint64_t result = v19;
  }
  if (v19 >> 14 < result >> 14)
  {
    __break(1u);
  }

  else
  {
    uint64_t v25 = Substring.subscript.getter(result);
    unint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    swift_bridgeObjectRelease(v21);
    uint64_t v32 = sub_10006DE14(v11, v13, v15, v41);
    uint64_t v34 = v33;
    unsigned __int8 v36 = v35;
    if ((v25 ^ v27) >> 14)
    {
      uint64_t v37 = static String._fromSubstring(_:)(v25, v27, v29, v31);
      uint64_t v38 = v40;
      swift_bridgeObjectRelease(a2);
      unint64_t result = swift_bridgeObjectRelease(v31);
      unint64_t v39 = v36 | 0x8000000000000000LL;
    }

    else
    {
      swift_bridgeObjectRelease(v31);
      unint64_t result = swift_bridgeObjectRelease(a2);
      uint64_t v37 = 0LL;
      uint64_t v38 = 0LL;
      unint64_t v39 = v36;
    }

    *a3 = v32;
    a3[1] = v34;
    a3[2] = v39;
    a3[3] = v37;
    a3[4] = v38;
  }

  return result;
}

unint64_t sub_10007347C()
{
  unsigned __int8 v1 = v18;
  if (v18 < 0)
  {
    v18 &= ~0x8000000000000000LL;
    uint64_t v5 = v19;
    unint64_t v6 = v20;
    v22.n128_u64[0] = sub_10006D63C(v17, v1);
    v22.n128_u64[1] = v7;
    v8._uint64_t countAndFlagsBits = 61LL;
    v8._object = (void *)0xE100000000000000LL;
    String.append(_:)(v8);
    v9._uint64_t countAndFlagsBits = v5;
    v9._object = v6;
    String.append(_:)(v9);
    return v22.n128_u64[0];
  }

  sub_100066FC0((__n128 *)&v17, &v21);
  sub_100066FC0(&v21, &v22);
  int v2 = v23 >> 6;
  if (!v2)
  {
    v23 &= 0x3Fu;
    unint64_t v12 = v22.n128_u64[1];
    unint64_t v11 = v22.n128_u64[0];
    uint64_t v13 = 11565LL;
    unint64_t v14 = 0xE200000000000000LL;
LABEL_8:
    uint64_t v15 = v13;
    unint64_t v16 = v14;
    String.append(_:)(*(Swift::String *)&v11);
    return v15;
  }

  if (v2 != 1)
  {
    v23 &= 0x3Fu;
    unint64_t v12 = v22.n128_u64[1];
    unint64_t v11 = v22.n128_u64[0];
    uint64_t v13 = 45LL;
    unint64_t v14 = 0xE100000000000000LL;
    goto LABEL_8;
  }

  v23 &= 0x3Fu;
  __n128 v3 = v22;
  uint64_t v15 = 0LL;
  unint64_t v16 = 0xE000000000000000LL;
  v4._uint64_t countAndFlagsBits = 45LL;
  v4._object = (void *)0xE100000000000000LL;
  String.append(_:)(v4);
  Character.write<A>(to:)( &v15,  v3.n128_u64[0],  v3.n128_u64[1],  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  return v15;
}

uint64_t sub_1000735A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000735FC( a1,  a2,  a3,  a4,  (void (*)(uint64_t, _BYTE *))sub_100066F84,  (uint64_t (*)(_BYTE *, _BYTE *))sub_10007482C);
}

unint64_t sub_1000735B4()
{
  return sub_10007347C();
}

uint64_t sub_1000735E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000735FC( a1,  a2,  a3,  a4,  (void (*)(uint64_t, _BYTE *))sub_100045320,  (uint64_t (*)(_BYTE *, _BYTE *))sub_100074AE8);
}

uint64_t sub_1000735FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, _BYTE *), uint64_t (*a6)(_BYTE *, _BYTE *))
{
  return a6(v10, v11) & 1;
}

uint64_t sub_100073654(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v6 = *(unsigned __int8 *)(a1 + 56);
  sub_100066F84(a2, (uint64_t)v13);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 48);
  int v9 = *(unsigned __int8 *)(a2 + 56);
  if ((sub_100074AE8((uint64_t)v12, (uint64_t)v13) & 1) != 0 && v5 == v8)
  {
    if (v6)
    {
      if ((v9 & 1) != 0) {
        return 1LL;
      }
    }

    else
    {
      if (v4 == v7) {
        int v11 = v9;
      }
      else {
        int v11 = 1;
      }
      if (v11 != 1) {
        return 1LL;
      }
    }
  }

  return 0LL;
}

Swift::Int sub_1000736EC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100073730()
{
}

Swift::Int sub_100073758(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

BOOL sub_100073798(void *a1, void *a2)
{
  return *a1 < *a2;
}

BOOL sub_1000737AC(void *a1, void *a2)
{
  return *a2 >= *a1;
}

BOOL sub_1000737C0(void *a1, void *a2)
{
  return *a1 >= *a2;
}

BOOL sub_1000737D4(void *a1, void *a2)
{
  return *a2 < *a1;
}

Swift::Int sub_1000737E8()
{
  Swift::UInt v1 = *(void *)v0;
  char v2 = *(_BYTE *)(v0 + 8);
  Hasher.init(_seed:)(v5, 0LL);
  Swift::UInt v3 = 0LL;
  if ((v2 & 1) == 0)
  {
    Hasher._combine(_:)(1uLL);
    Swift::UInt v3 = v1;
  }

  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

void sub_100073844()
{
  if ((*(_BYTE *)(v0 + 8) & 1) != 0)
  {
    Swift::UInt v1 = 0LL;
  }

  else
  {
    Swift::UInt v1 = *(void *)v0;
    Hasher._combine(_:)(1uLL);
  }

  Hasher._combine(_:)(v1);
}

Swift::Int sub_100073888(uint64_t a1)
{
  Swift::UInt v2 = *(void *)v1;
  char v3 = *(_BYTE *)(v1 + 8);
  Hasher.init(_seed:)(v5, a1);
  if ((v3 & 1) != 0) {
    Swift::UInt v2 = 0LL;
  }
  else {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_1000738E4(uint64_t a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0) {
      return 1LL;
    }
  }

  else
  {
    if (*(void *)a1 >= *(void *)a2) {
      char v2 = 1;
    }
    if ((v2 & 1) == 0) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t sub_10007391C(uint64_t a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a1 + 8);
  if (*(_BYTE *)(a2 + 8) == 1)
  {
    if ((*(_BYTE *)(a1 + 8) & 1) == 0) {
      return 0LL;
    }
  }

  else
  {
    if (*(void *)a2 >= *(void *)a1) {
      char v2 = 1;
    }
    if ((v2 & 1) == 0) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t sub_100073954(uint64_t a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a2 + 8);
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0) {
      return 0LL;
    }
  }

  else
  {
    if (*(void *)a1 >= *(void *)a2) {
      char v2 = 1;
    }
    if ((v2 & 1) == 0) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t sub_10007398C(uint64_t a1, uint64_t a2)
{
  char v2 = *(_BYTE *)(a1 + 8);
  if (*(_BYTE *)(a2 + 8) == 1)
  {
    if ((*(_BYTE *)(a1 + 8) & 1) == 0) {
      return 1LL;
    }
  }

  else
  {
    if (*(void *)a2 >= *(void *)a1) {
      char v2 = 1;
    }
    if ((v2 & 1) == 0) {
      return 1LL;
    }
  }

  return 0LL;
}

BOOL sub_1000739C4(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 8) == 1) {
    return (*(_BYTE *)(a2 + 8) & 1) != 0;
  }
  if ((*(_BYTE *)(a2 + 8) & 1) != 0) {
    return 0LL;
  }
  return *(void *)a1 == *(void *)a2;
}

Swift::Int sub_100073A00()
{
  Swift::UInt v1 = *(void *)v0;
  Swift::UInt v2 = *(void *)(v0 + 8);
  char v3 = *(_BYTE *)(v0 + 16);
  Hasher.init(_seed:)(v6, 0LL);
  Hasher._combine(_:)(v1);
  Swift::UInt v4 = 0LL;
  if ((v3 & 1) == 0)
  {
    Hasher._combine(_:)(1uLL);
    Swift::UInt v4 = v2;
  }

  Hasher._combine(_:)(v4);
  return Hasher._finalize()();
}

void sub_100073A70()
{
  Swift::UInt v1 = *(void *)(v0 + 8);
  char v2 = *(_BYTE *)(v0 + 16);
  Hasher._combine(_:)(*(void *)v0);
  if ((v2 & 1) != 0) {
    Swift::UInt v1 = 0LL;
  }
  else {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v1);
}

Swift::Int sub_100073AC0(uint64_t a1)
{
  Swift::UInt v3 = *(void *)v1;
  Swift::UInt v2 = *(void *)(v1 + 8);
  char v4 = *(_BYTE *)(v1 + 16);
  Hasher.init(_seed:)(v6, a1);
  Hasher._combine(_:)(v3);
  if ((v4 & 1) != 0) {
    Swift::UInt v2 = 0LL;
  }
  else {
    Hasher._combine(_:)(1uLL);
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100073B30(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < *(void *)a2) {
    return 1LL;
  }
  if (*(void *)a1 == *(void *)a2)
  {
    int v3 = *(unsigned __int8 *)(a2 + 16);
    if (*(_BYTE *)(a1 + 16))
    {
      if ((v3 & 1) == 0) {
        return 1LL;
      }
    }

    else
    {
      if (*(void *)(a1 + 8) >= *(void *)(a2 + 8)) {
        int v3 = 1;
      }
      if (v3 != 1) {
        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_100073B80(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < *(void *)a1) {
    return 0LL;
  }
  if (*(void *)a2 == *(void *)a1)
  {
    int v3 = *(unsigned __int8 *)(a1 + 16);
    if (*(_BYTE *)(a2 + 16))
    {
      if ((v3 & 1) == 0) {
        return 0LL;
      }
    }

    else
    {
      if (*(void *)(a2 + 8) >= *(void *)(a1 + 8)) {
        int v3 = 1;
      }
      if (v3 != 1) {
        return 0LL;
      }
    }
  }

  return 1LL;
}

uint64_t sub_100073BD0(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 < *(void *)a2) {
    return 0LL;
  }
  if (*(void *)a1 == *(void *)a2)
  {
    int v3 = *(unsigned __int8 *)(a2 + 16);
    if (*(_BYTE *)(a1 + 16))
    {
      if ((v3 & 1) == 0) {
        return 0LL;
      }
    }

    else
    {
      if (*(void *)(a1 + 8) >= *(void *)(a2 + 8)) {
        int v3 = 1;
      }
      if (v3 != 1) {
        return 0LL;
      }
    }
  }

  return 1LL;
}

uint64_t sub_100073C20(uint64_t a1, uint64_t a2)
{
  if (*(void *)a2 < *(void *)a1) {
    return 1LL;
  }
  if (*(void *)a2 == *(void *)a1)
  {
    int v3 = *(unsigned __int8 *)(a1 + 16);
    if (*(_BYTE *)(a2 + 16))
    {
      if ((v3 & 1) == 0) {
        return 1LL;
      }
    }

    else
    {
      if (*(void *)(a2 + 8) >= *(void *)(a1 + 8)) {
        int v3 = 1;
      }
      if (v3 != 1) {
        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_100073C70(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2)
  {
    int v2 = *(unsigned __int8 *)(a2 + 16);
    if (*(_BYTE *)(a1 + 16) == 1)
    {
      if ((v2 & 1) != 0) {
        return 1LL;
      }
    }

    else
    {
      if (*(void *)(a1 + 8) != *(void *)(a2 + 8)) {
        int v2 = 1;
      }
      if (v2 != 1) {
        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_100073CBC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = a1[1];
  int v3 = (void *)a1[2];
  uint64_t v4 = a2[1];
  uint64_t v5 = (void *)a2[2];
  if ((sub_100057734(*a1, *a2) & 1) != 0 && v2 == v4) {
    return sub_100057670(v3, v5);
  }
  else {
    return 0LL;
  }
}

unint64_t sub_100073D20()
{
  uint64_t v1 = (v24 >> 61) & 3;
  if (!(_DWORD)v1)
  {
    v24 &= 0x9FFFFFFFFFFFFFFFLL;
    sub_100066F84((uint64_t)&v23, (uint64_t)v25);
    sub_100066F84((uint64_t)v25, (uint64_t)&v26);
    unsigned __int8 v4 = v27;
    if (v27 < 0)
    {
      v27 &= ~0x8000000000000000LL;
      uint64_t v8 = v28;
      int v9 = v29;
      uint64_t v10 = sub_10006D63C(v26, v4);
      unint64_t v12 = v11;
      v31.n128_u64[0] = 0x2065756C6176203BLL;
      v31.n128_u64[1] = 0xE900000000000027LL;
      v13._uint64_t countAndFlagsBits = v8;
      v13._object = v9;
      String.append(_:)(v13);
      v14._uint64_t countAndFlagsBits = 39LL;
      v14._object = (void *)0xE100000000000000LL;
      String.append(_:)(v14);
      Swift::String v15 = (Swift::String)v31;
      v31.n128_u64[0] = v10;
      v31.n128_u64[1] = v12;
      swift_bridgeObjectRetain(v12);
      String.append(_:)(v15);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v15._object);
      return v31.n128_u64[0];
    }

    sub_100066FC0((__n128 *)&v26, &v30);
    sub_100066FC0(&v30, &v31);
    int v5 = v32 >> 6;
    if (v5)
    {
      if (v5 == 1)
      {
        v32 &= 0x3Fu;
        __n128 v6 = v31;
        uint64_t v20 = 0LL;
        unint64_t v21 = 0xE000000000000000LL;
        v7._uint64_t countAndFlagsBits = 45LL;
        v7._object = (void *)0xE100000000000000LL;
        String.append(_:)(v7);
        Character.write<A>(to:)( &v20,  v6.n128_u64[0],  v6.n128_u64[1],  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        return v20;
      }

      v32 &= 0x3Fu;
      unint64_t v17 = v31.n128_u64[1];
      unint64_t v16 = v31.n128_u64[0];
      uint64_t v18 = 45LL;
      unint64_t v19 = 0xE100000000000000LL;
    }

    else
    {
      v32 &= 0x3Fu;
      unint64_t v17 = v31.n128_u64[1];
      unint64_t v16 = v31.n128_u64[0];
      uint64_t v18 = 11565LL;
      unint64_t v19 = 0xE200000000000000LL;
    }

    uint64_t v20 = v18;
    unint64_t v21 = v19;
    String.append(_:)(*(Swift::String *)&v16);
    return v20;
  }

  if ((_DWORD)v1 != 1) {
    return 0x74616E696D726574LL;
  }
  v24 &= 0x9FFFFFFFFFFFFFFFLL;
  v26._uint64_t countAndFlagsBits = 0x272065756C6176LL;
  v26._object = (void *)0xE700000000000000LL;
  String.append(_:)(v23);
  v2._uint64_t countAndFlagsBits = 39LL;
  v2._object = (void *)0xE100000000000000LL;
  String.append(_:)(v2);
  return v26._countAndFlagsBits;
}

unint64_t sub_100073F38()
{
  return sub_100073D20();
}

uint64_t sub_100073F78(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  }
  uint64_t v7 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  v3._uint64_t countAndFlagsBits = 46LL;
  v3._object = (void *)0xE100000000000000LL;
  String.append(_:)(v3);
  v4._uint64_t countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
  object = v4._object;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(object);
  return v7;
}

uint64_t sub_10007402C()
{
  return sub_100073F78(*(void *)v0, *(void *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

void sub_100074038(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = *(void *)a1;
  Swift::String v4 = *(void **)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  char v9 = *(_BYTE *)(a1 + 56);
  uint64_t v10 = (v6 >> 61) & 3;
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 != 1)
    {
      v21._uint64_t countAndFlagsBits = sub_100073F78(v7, v8, v9);
      object = v21._object;
      String.append(_:)(v21);
      swift_bridgeObjectRelease(object);
      uint64_t v23 = 757932125LL;
      unint64_t v24 = 0xE400000000000000LL;
LABEL_9:
      String.append(_:)(*(Swift::String *)&v23);
      goto LABEL_10;
    }

    v11._uint64_t countAndFlagsBits = sub_100073F78(v7, v8, v9);
    unint64_t v12 = v11._object;
    String.append(_:)(v11);
    swift_bridgeObjectRelease(v12);
    v13._uint64_t countAndFlagsBits = 2564189LL;
    v13._object = (void *)0xE300000000000000LL;
    String.append(_:)(v13);
    uint64_t v14 = v5;
    Swift::String v15 = v4;
LABEL_8:
    String.append(_:)(*(Swift::String *)&v14);
    uint64_t v23 = 39LL;
    unint64_t v24 = 0xE100000000000000LL;
    goto LABEL_9;
  }

  if ((v6 & 0x8000000000000000LL) != 0)
  {
    uint64_t v25 = *(void *)(a1 + 24);
    Swift::String v26 = *(void **)(a1 + 32);
    v27._uint64_t countAndFlagsBits = sub_100073F78(v7, v8, v9);
    uint64_t v28 = v27._object;
    String.append(_:)(v27);
    swift_bridgeObjectRelease(v28);
    v29._uint64_t countAndFlagsBits = 8285LL;
    v29._object = (void *)0xE200000000000000LL;
    String.append(_:)(v29);
    v34._uint64_t countAndFlagsBits = v5;
    v34._object = v4;
    v30._uint64_t countAndFlagsBits = sub_10006D63C(v34, v6);
    __n128 v31 = v30._object;
    String.append(_:)(v30);
    swift_bridgeObjectRelease(v31);
    v32._uint64_t countAndFlagsBits = 10045LL;
    v32._object = (void *)0xE200000000000000LL;
    String.append(_:)(v32);
    uint64_t v14 = v25;
    Swift::String v15 = v26;
    goto LABEL_8;
  }

  v16._uint64_t countAndFlagsBits = sub_100073F78(v7, v8, v9);
  unint64_t v17 = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v17);
  v18._uint64_t countAndFlagsBits = 8285LL;
  v18._object = (void *)0xE200000000000000LL;
  String.append(_:)(v18);
  v33._uint64_t countAndFlagsBits = v5;
  v33._object = v4;
  v19._uint64_t countAndFlagsBits = sub_10006D63C(v33, v6);
  uint64_t v20 = v19._object;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v20);
LABEL_10:
  *a2 = 91LL;
  a2[1] = 0xE100000000000000LL;
}

void sub_100074220()
{
}

char **sub_100074228(char **result, int64_t a2)
{
  int64_t v2 = (int64_t)result[1];
  if (v2 <= a2)
  {
    Swift::String v3 = result;
    if (v2 != a2)
    {
      uint64_t v4 = a2;
      uint64_t v5 = *result;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*result);
      *Swift::String v3 = v5;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        goto LABEL_16;
      }
      while (1)
      {
        uint64_t v7 = (v4 << 6) + 88;
        int64_t v19 = v2;
        while (v2 < v4)
        {
          unint64_t v8 = v4 - 1;
          if (v4 < 1) {
            goto LABEL_13;
          }
          unint64_t v9 = *((void *)v5 + 2);
          if (v8 >= v9) {
            goto LABEL_14;
          }
          uint64_t v10 = &v5[v7];
          uint64_t v4 = *(void *)&v5[v7 - 120];
          uint64_t v11 = *(void *)&v5[v7 - 112];
          uint64_t v23 = v5;
          int64_t v2 = *(void *)&v5[v7 - 104];
          uint64_t v5 = *(char **)&v5[v7 - 96];
          uint64_t v12 = *((void *)v10 - 11);
          uint64_t v21 = *((void *)v10 - 9);
          uint64_t v22 = *((void *)v10 - 10);
          char v20 = *(v10 - 64);
          sub_10005BDF8(v4, v11, v2, (uint64_t)v5, v12);
          *Swift::String v3 = v23;
          unint64_t v13 = v8 + 1;
          if (v13 >= v9) {
            goto LABEL_15;
          }
          uint64_t v14 = *((void *)v10 - 7);
          uint64_t v15 = *((void *)v10 - 6);
          unint64_t v16 = *((void *)v10 - 5);
          uint64_t v17 = *((void *)v10 - 4);
          uint64_t v18 = *((void *)v10 - 3);
          *((void *)v10 - 7) = v4;
          *((void *)v10 - 6) = v11;
          *((void *)v10 - 5) = v2;
          *((void *)v10 - 4) = v5;
          *((void *)v10 - 3) = v12;
          *((void *)v10 - 2) = v22;
          *((void *)v10 - 1) = v21;
          *uint64_t v10 = v20;
          unint64_t result = (char **)sub_100066ED8(v14, v15, v16, v17, v18);
          uint64_t v5 = *v3;
          v7 -= 64LL;
          uint64_t v4 = v13 - 1;
          int64_t v2 = v19;
          if (v13 - 1 == v19) {
            goto LABEL_10;
          }
        }

        __break(1u);
LABEL_13:
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        uint64_t v5 = sub_10005B898((uint64_t)v5);
      }
    }

uint64_t sub_100074388(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v4 = *v3;
  uint64_t v5 = v3[1];
  uint64_t v6 = *(void *)(*v3 + 16LL);
  if (v6 < v5)
  {
    __break(1u);
    goto LABEL_39;
  }

  if (v5 < 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }

  if (v5 != v6)
  {
    uint64_t v8 = result;
    uint64_t v9 = v3[1];
    if (v5 < (unint64_t)v6)
    {
      uint64_t v10 = (uint64_t *)(v4 + (v5 << 6) + 72);
      uint64_t v9 = v3[1];
      while (1)
      {
        uint64_t v11 = *v10;
        v10 += 8;
        BOOL v12 = v11 <= result;
        if (v11 == result) {
          break;
        }
        if (!v12 || v6 - 1 == v9++) {
          return result;
        }
      }
    }

    if (v9 < v6)
    {
      if ((a3 & 1) != 0)
      {
        if (v9 >= v5)
        {
          uint64_t v15 = (uint64_t *)(v4 + (v9 << 6) + 72);
          int64_t v16 = v9;
          while (1)
          {
            uint64_t v17 = *v15;
            v15 += 8;
            if (v17 != result) {
              break;
            }
            if (v6 == ++v16)
            {
              int64_t v16 = *(void *)(*v3 + 16LL);
              break;
            }
          }

          if (v16 >= v9) {
            return sub_100074674(v9, v16);
          }
          goto LABEL_46;
        }

uint64_t sub_100074524(uint64_t result)
{
  uint64_t v2 = (uint64_t)v1[1];
  if (v2 <= result)
  {
    if (v2 != result)
    {
      uint64_t v3 = result;
      char v20 = *v1;
      uint64_t v18 = v1;
      if ((swift_isUniquelyReferenced_nonNull_native(*v1) & 1) == 0) {
LABEL_17:
      }
        char v20 = sub_10005B898((uint64_t)v20);
      uint64_t v4 = (uint64_t)&v20[64 * v3 + 32];
      uint64_t v19 = v2;
      do
      {
        if (v2 >= v3)
        {
          __break(1u);
LABEL_14:
          __break(1u);
LABEL_15:
          __break(1u);
LABEL_16:
          __break(1u);
          goto LABEL_17;
        }

        unint64_t v5 = v3 - 1;
        if (v3 < 1) {
          goto LABEL_14;
        }
        unint64_t v6 = *((void *)v20 + 2);
        if (v5 >= v6) {
          goto LABEL_15;
        }
        uint64_t v3 = *(void *)(v4 - 64);
        uint64_t v2 = *(void *)(v4 - 56);
        unint64_t v7 = *(void *)(v4 - 48);
        uint64_t v8 = *(void *)(v4 - 40);
        uint64_t v9 = *(void *)(v4 - 32);
        uint64_t v21 = *(void *)(v4 - 24);
        uint64_t v10 = *(void *)(v4 - 16);
        char v11 = *(_BYTE *)(v4 - 8);
        sub_10005BDF8(v3, v2, v7, v8, v9);
        unint64_t v12 = v5 + 1;
        if (v12 >= v6) {
          goto LABEL_16;
        }
        uint64_t v13 = *(void *)v4;
        uint64_t v14 = *(void *)(v4 + 8);
        unint64_t v15 = *(void *)(v4 + 16);
        uint64_t v16 = *(void *)(v4 + 24);
        uint64_t v17 = *(void *)(v4 + 32);
        *(void *)uint64_t v4 = v3;
        *(void *)(v4 + 8) = v2;
        *(void *)(v4 + 16) = v7;
        *(void *)(v4 + 24) = v8;
        *(void *)(v4 + 32) = v9;
        *(void *)(v4 + 40) = v21;
        *(void *)(v4 + 48) = v10;
        *(_BYTE *)(v4 + 56) = v11;
        unint64_t result = sub_100066ED8(v13, v14, v15, v16, v17);
        v4 -= 64LL;
        uint64_t v3 = v12 - 1;
        uint64_t v2 = v19;
      }

      while (v12 - 1 != v19);
      uint64_t v1 = v18;
      *uint64_t v18 = v20;
    }

    if (__OFADD__(v2, 1LL)) {
      __break(1u);
    }
    else {
      v1[1] = (char *)(v2 + 1);
    }
  }

  return result;
}

uint64_t sub_100074674(uint64_t result, unint64_t a2)
{
  uint64_t v4 = result;
  uint64_t v27 = (uint64_t)v2[1];
  if (v27 >= result) {
    goto LABEL_10;
  }
  Swift::String v26 = *v2;
  uint64_t v25 = v2;
  if ((swift_isUniquelyReferenced_nonNull_native(*v2) & 1) == 0) {
    goto LABEL_19;
  }
  while (1)
  {
    uint64_t v23 = v4;
    unint64_t v24 = a2;
    uint64_t v5 = v4;
    unint64_t v6 = &v26[64 * v4];
    do
    {
      BOOL v7 = __OFSUB__(a2--, 1LL);
      if (v7)
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
        goto LABEL_17;
      }

      if (v5-- < 1) {
        goto LABEL_14;
      }
      unint64_t v9 = *((void *)v26 + 2);
      if (v5 >= v9) {
        goto LABEL_15;
      }
      uint64_t v10 = *((void *)v6 - 4);
      uint64_t v11 = *((void *)v6 - 3);
      unint64_t v12 = *((void *)v6 - 2);
      uint64_t v13 = *((void *)v6 - 1);
      uint64_t v14 = *(void *)v6;
      uint64_t v4 = *((void *)v6 + 1);
      uint64_t v29 = *((void *)v6 + 2);
      char v28 = v6[24];
      sub_10005BDF8(v10, v11, v12, v13, *(void *)v6);
      if (a2 >= v9) {
        goto LABEL_16;
      }
      uint64_t v15 = (uint64_t)&v26[64 * a2 + 32];
      uint64_t v16 = *(void *)v15;
      uint64_t v17 = *(void *)(v15 + 8);
      unint64_t v18 = *(void *)(v15 + 16);
      uint64_t v19 = *(void *)(v15 + 24);
      uint64_t v20 = *(void *)(v15 + 32);
      *(void *)uint64_t v15 = v10;
      *(void *)(v15 + 8) = v11;
      *(void *)(v15 + 16) = v12;
      *(void *)(v15 + 24) = v13;
      *(void *)(v15 + 32) = v14;
      *(void *)(v15 + 40) = v4;
      *(void *)(v15 + 48) = v29;
      *(_BYTE *)(v15 + 56) = v28;
      unint64_t result = sub_100066ED8(v16, v17, v18, v19, v20);
      v6 -= 64;
    }

    while (v27 < v5);
    a2 = v24;
    uint64_t v2 = v25;
    *uint64_t v25 = v26;
    uint64_t v4 = v23;
LABEL_10:
    unint64_t v21 = a2 - v4;
    if (__OFSUB__(a2, v4))
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }

    BOOL v7 = __OFADD__(v27, v21);
    uint64_t v22 = (char *)(v27 + v21);
    if (!v7) {
      break;
    }
LABEL_18:
    __break(1u);
LABEL_19:
    Swift::String v26 = sub_10005B898((uint64_t)v26);
  }

  v2[1] = v22;
  return result;
}

uint64_t sub_1000747E8(uint64_t result, uint64_t a2, __int16 a3)
{
  if ((a3 & 0x100) == 0) {
    return sub_100074388(result, a2, a3 & 1);
  }
  return result;
}

uint64_t sub_100074810(uint64_t result, uint64_t a2)
{
  if (*(void *)(a2 + 16) < result)
  {
    __break(1u);
    goto LABEL_5;
  }

  if (result < 0) {
LABEL_5:
  }
    __break(1u);
  return result;
}

uint64_t sub_10007482C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v3 = v32;
  if ((v32 & 0x8000000000000000LL) == 0)
  {
    sub_100066FC0(&v31, &v35);
    sub_100066F84(a2, (uint64_t)&v27);
    if (v28 < 0) {
      goto LABEL_32;
    }
    sub_100066FC0(&v27, &v24);
    sub_100066FC0(&v35, &v36);
    int v4 = v37;
    int v5 = v37 >> 6;
    if (v5)
    {
      if (v5 == 1)
      {
        v37 &= 0x3Fu;
        __n128 v6 = v36;
        sub_100066FC0(&v24, &v25);
        int v7 = v26;
        if ((v26 & 0xC0) == 0x40)
        {
          v26 &= 0x3Fu;
          if (*(_OWORD *)&v6 == *(_OWORD *)&v25)
          {
            if (((v4 ^ v7) & 1) != 0) {
              goto LABEL_32;
            }
          }

          else
          {
            char v21 = _stringCompareWithSmolCheck(_:_:expecting:)( v6.n128_u64[0],  v6.n128_u64[1],  v25.n128_u64[0],  v25.n128_u64[1],  0LL);
            if (((v4 ^ v7) & 1) != 0 || (v21 & 1) == 0) {
              goto LABEL_32;
            }
          }

uint64_t sub_100074AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (v42 >> 61) & 3;
  if (!(_DWORD)v3)
  {
    v42 &= 0x9FFFFFFFFFFFFFFFLL;
    sub_100066F84((uint64_t)v41, (uint64_t)v43);
    sub_100066F84(a2, (uint64_t)v31);
    if ((v32 & 0x6000000000000000LL) != 0) {
      goto LABEL_47;
    }
    v32 &= 0x9FFFFFFFFFFFFFFFLL;
    sub_100066F84((uint64_t)v31, (uint64_t)v33);
    sub_100066F84((uint64_t)v43, (uint64_t)&v44);
    unsigned __int8 v7 = v45;
    if ((v45 & 0x8000000000000000LL) == 0)
    {
      sub_100066FC0((__n128 *)&v44, &v47);
      sub_100066F84((uint64_t)v33, (uint64_t)&v37);
      if (v38 < 0) {
        goto LABEL_47;
      }
      sub_100066FC0(&v37, &v34);
      sub_100066FC0(&v47, &v48);
      int v8 = v49;
      int v9 = v49 >> 6;
      if (v9)
      {
        if (v9 == 1)
        {
          v49 &= 0x3Fu;
          __n128 v10 = v48;
          sub_100066FC0(&v34, &v35);
          int v11 = v36;
          if ((v36 & 0xC0) == 0x40)
          {
            v36 &= 0x3Fu;
            if (*(_OWORD *)&v10 == *(_OWORD *)&v35)
            {
              if (((v8 ^ v11) & 1) == 0) {
                goto LABEL_18;
              }
            }

            else
            {
              char v28 = _stringCompareWithSmolCheck(_:_:expecting:)( v10.n128_u64[0],  v10.n128_u64[1],  v35.n128_u64[0],  v35.n128_u64[1],  0LL);
              if (((v8 ^ v11) & 1) == 0 && (v28 & 1) != 0) {
                goto LABEL_18;
              }
            }
          }

LABEL_47:
          char v6 = 0;
          return v6 & 1;
        }

        v49 &= 0x3Fu;
        unint64_t v23 = v48.n128_u64[1];
        unint64_t v22 = v48.n128_u64[0];
        sub_100066FC0(&v34, &v35);
        if ((v36 & 0xC0) != 0x80) {
          goto LABEL_47;
        }
        v36 &= 0x3Fu;
      }

      else
      {
        v49 &= 0x3Fu;
        unint64_t v23 = v48.n128_u64[1];
        unint64_t v22 = v48.n128_u64[0];
        sub_100066FC0(&v34, &v35);
        if (v36 >= 0x40u) {
          goto LABEL_47;
        }
      }

      unint64_t v25 = v35.n128_u64[1];
      unint64_t v24 = v35.n128_u64[0];
      if (__PAIR128__(v23, v22) == *(_OWORD *)&v35) {
        goto LABEL_18;
      }
      unint64_t v26 = v22;
      unint64_t v27 = v23;
LABEL_46:
      if ((_stringCompareWithSmolCheck(_:_:expecting:)(v26, v27, v24, v25, 0LL) & 1) != 0) {
        goto LABEL_18;
      }
      goto LABEL_47;
    }

    v45 &= ~0x8000000000000000LL;
    int8x16_t v14 = v44;
    int8x16_t v15 = v46;
    sub_100066F84((uint64_t)v33, (uint64_t)&v37);
    unsigned __int8 v16 = v38;
    if ((v38 & 0x8000000000000000LL) == 0)
    {
      sub_100066FC0(&v37, &v48);
      goto LABEL_47;
    }

    int v17 = v7;
    v38 &= ~0x8000000000000000LL;
    unsigned int v18 = v16;
    int v19 = v7 >> 6;
    unint64_t v21 = v39;
    unint64_t v20 = v40;
    if (v19)
    {
      if (v19 == 1)
      {
        if ((v18 & 0xC0) != 0x40) {
          goto LABEL_47;
        }
        if (*(_OWORD *)&v14 == *(_OWORD *)&v37)
        {
          if (((v17 ^ v18) & 1) != 0) {
            goto LABEL_47;
          }
        }

        else
        {
          char v29 = _stringCompareWithSmolCheck(_:_:expecting:)( v14.i64[0],  v14.i64[1],  v37.n128_u64[0],  v37.n128_u64[1],  0LL);
          if (((v17 ^ v18) & 1) != 0 || (v29 & 1) == 0) {
            goto LABEL_47;
          }
        }

        goto LABEL_44;
      }

      if ((v18 & 0xC0) != 0x80) {
        goto LABEL_47;
      }
    }

    else if (v18 >= 0x40)
    {
      goto LABEL_47;
    }

    if (*(_OWORD *)&v14 != *(_OWORD *)&v37
      && (_stringCompareWithSmolCheck(_:_:expecting:)(v14.i64[0], v14.i64[1], v37.n128_u64[0], v37.n128_u64[1], 0LL) & 1) == 0)
    {
      goto LABEL_47;
    }

  if (v12 == v103 && v28 == v105) {
    return;
  }
  if (v12 >= v26 >> 14)
  {
    __n128 v47 = v13;
    unint64_t v26 = v27;
    __n128 v48 = v109;
    unsigned __int8 v49 = v111;
    goto LABEL_56;
  }

  __n128 v47 = v14;
  __n128 v48 = v5;
  unsigned __int8 v49 = a4;
  if (v28 >= v27 >> 14)
  {
LABEL_56:
    String.distance(from:to:)(v47, v26, v48, v49);
    return;
  }

  uint64_t v50 = String.subscript.getter(v14, v26, v5, a4);
  uint64_t v52 = v51;
  uint64_t v54 = v53;
  unint64_t v56 = v55;
  unint64_t v57 = String.subscript.getter(v13, v27, v109, v111);
  char v59 = v58;
  unint64_t v61 = v60;
  uint64_t v63 = v62;
  swift_bridgeObjectRetain(v56);
  __int128 v108 = v50;
  __n128 v99 = v54;
  __int128 v102 = v52;
  __int128 v90 = Substring.distance(from:to:)(v50, v52, v50, v52, v54, v56);
  __int128 v106 = v56;
  swift_bridgeObjectRelease(v56);
  swift_bridgeObjectRetain(v63);
  __int128 v104 = v61;
  uint64_t v64 = Substring.distance(from:to:)(v57, v59, v57, v59, v61, v63);
  swift_bridgeObjectRelease(v63);
  uint64_t v65 = v64 + 1;
  if (__OFADD__(v64, 1LL))
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }

  if (v65 < 0)
  {
LABEL_98:
    __break(1u);
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }

  if (v64 == -1)
  {
    uint64_t v66 = (char *)_swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v66 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(v64 + 1, &type metadata for Int);
    *((void *)v66 + 2) = v65;
    bzero(v66 + 32, 8 * v64 + 8);
  }

  if (v64 < 0) {
    goto LABEL_99;
  }
  uint64_t v96 = v59;
  uint64_t v67 = (char *)sub_10004FCF8(0LL, v64);
  if (v90 < 1 || !v64) {
    goto LABEL_100;
  }
  uint64_t v68 = v67;
  uint64_t v69 = 1LL;
  __int128 v110 = v50;
  __int128 v92 = v64;
  uint64_t v93 = v57;
  while (1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v66) & 1) != 0)
    {
      __n128 v70 = v66;
      if (!*((void *)v66 + 2)) {
        break;
      }
      goto LABEL_64;
    }

    __n128 v70 = sub_10005B93C((uint64_t)v66);
    if (!*((void *)v70 + 2)) {
      break;
    }
LABEL_64:
    uint64_t v71 = 0LL;
    __n128 v72 = 0LL;
    __int128 v91 = v69;
    *((void *)v70 + 4) = v69;
    __n128 v73 = v57;
    unsigned __int8 v74 = v96;
    uint64_t v75 = v104;
    unsigned __int8 v95 = v70;
    do
    {
      unint64_t v76 = v68;
      __int128 v112 = v72 + 1;
      uint64_t v77 = Substring.subscript.getter(v110, v108, v102, v99, v106);
      unint64_t v79 = v78;
      uint64_t v80 = v57;
      uint64_t v81 = v63;
      uint64_t v83 = Substring.subscript.getter(v73, v80, v74, v75, v63);
      uint64_t v84 = v82;
      if (v77 == v83 && v79 == v82)
      {
        swift_bridgeObjectRelease_n(v79, 2LL);
      }

      else
      {
        unint64_t v85 = _stringCompareWithSmolCheck(_:_:expecting:)(v77, v79, v83, v82, 0LL);
        swift_bridgeObjectRelease(v79);
        swift_bridgeObjectRelease(v84);
        if ((v85 & 1) == 0)
        {
          if (v112 >= *((void *)v76 + 2)) {
            goto LABEL_92;
          }
          uint64_t v68 = v76;
          __n128 v70 = v95;
          uint64_t v87 = *((void *)v95 + 2);
          if (v72 >= v87) {
            goto LABEL_93;
          }
          uint64_t v88 = *(void *)&v68[v71 + 32];
          if (v88 >= *(void *)&v95[v71 + 32]) {
            uint64_t v88 = *(void *)&v95[v71 + 32];
          }
          if (v88 >= *(void *)&v68[v71 + 40]) {
            uint64_t v88 = *(void *)&v68[v71 + 40];
          }
          unint64_t v89 = __OFADD__(v88, 1LL);
          uint64_t v86 = v88 + 1;
          if (v89) {
            goto LABEL_94;
          }
          if (v112 >= v87) {
            goto LABEL_95;
          }
          uint64_t v63 = v81;
          uint64_t v75 = v104;
          goto LABEL_65;
        }
      }

      uint64_t v75 = v104;
      if (v72 >= *((void *)v76 + 2))
      {
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        __break(1u);
        goto LABEL_97;
      }

      uint64_t v68 = v76;
      __n128 v70 = v95;
      if (v112 >= *((void *)v95 + 2)) {
        goto LABEL_91;
      }
      uint64_t v63 = v81;
      uint64_t v86 = *(void *)&v68[v71 + 32];
LABEL_65:
      *(void *)&v70[v71 + 40] = v86;
      unint64_t v57 = v93;
      unsigned __int8 v74 = v96;
      __n128 v73 = Substring.index(after:)(v73, v93, v96, v75, v63);
      ++v72;
      v71 += 8LL;
      uint64_t v64 = v92;
    }

    while (v92 != v72);
    __int128 v110 = Substring.index(after:)(v110, v108, v102, v99, v106);
    if (v91 == v90) {
      goto LABEL_88;
    }
    uint64_t v66 = v68;
    uint64_t v68 = v70;
    uint64_t v69 = v91 + 1;
    if (__OFADD__(v91, 1LL)) {
      goto LABEL_96;
    }
  }

  __break(1u);
LABEL_88:
  swift_bridgeObjectRelease(v63);
  swift_bridgeObjectRelease(v106);
  if (v64 < *((void *)v70 + 2))
  {
    swift_bridgeObjectRelease(v68);
    swift_bridgeObjectRelease(v70);
    return;
  }

void *sub_100074E94(void *result, uint64_t a2, unint64_t a3, void *a4)
{
  int64_t v4 = a3 >> 1;
  if (a3 >> 1 != a2)
  {
    uint64_t v6 = a2;
    unint64_t v29 = a3 >> 1;
    uint64_t v30 = a2;
    char v28 = result;
    do
    {
      uint64_t v7 = v6;
      while (1)
      {
        if (v7 < a2 || v6 >= v4) {
          goto LABEL_32;
        }
        int v8 = &result[8 * v6];
        uint64_t v9 = *v8;
        uint64_t v10 = v8[1];
        unint64_t v11 = v8[2];
        uint64_t v12 = v8[3];
        uint64_t v13 = v8[4];
        ++v6;
        BOOL v14 = (v11 & 0x6000000000000000LL) == 0x4000000000000000LL && v11 == 0x4000000000000000LL;
        if (!v14 || (v10 | *v8 | v12 | v13) != 0)
        {
          uint64_t v16 = v8[5];
          char v17 = *((_BYTE *)v8 + 56);
          if ((v17 & 1) != 0) {
            goto LABEL_25;
          }
          uint64_t v18 = a4[2];
          if (!v18) {
            goto LABEL_25;
          }
          if (a4[4] != v16)
          {
            if (v18 == 1) {
              goto LABEL_25;
            }
            if (a4[5] != v16) {
              break;
            }
          }
        }

void *sub_10007509C(uint64_t a1, uint64_t a2)
{
  int64_t v3 = *(void *)(a1 + 16);
  unint64_t result = _swiftEmptyArrayStorage;
  if (!v3) {
    return result;
  }
  __n128 v48 = _swiftEmptyArrayStorage;
  sub_10004FEB8(0LL, v3, 0);
  unint64_t result = _swiftEmptyArrayStorage;
  uint64_t v38 = a2 + 32;
  uint64_t v39 = a2;
  for (uint64_t i = a1 + 48; ; i += 64LL)
  {
    uint64_t v7 = *(void *)(i - 16);
    int v8 = *(void **)(i - 8);
    unint64_t v9 = *(void *)i;
    uint64_t v10 = *(void *)(i + 8);
    uint64_t v11 = *(void *)(i + 16);
    Swift::UInt v12 = *(void *)(i + 24);
    Swift::UInt v43 = *(void *)(i + 32);
    int8x16_t v44 = result;
    unsigned int v42 = *(unsigned __int8 *)(i + 40);
    uint64_t v41 = v10;
    if (v42 == 1) {
      break;
    }
    if ((v9 & 0x6000000000000000LL) == 0)
    {
      int v21 = v9 >> 6;
      if ((v9 & 0x8000000000000000LL) != 0)
      {
        unint64_t v37 = *(void *)i;
        if (v9 >> 6)
        {
          if (v21 == 1)
          {
            uint64_t v45 = 0LL;
            unint64_t v46 = 0xE000000000000000LL;
            unint64_t v24 = v9;
            uint64_t v25 = v10;
            uint64_t v26 = v10;
            int8x16_t v15 = (void *)v11;
            sub_10005BDF8(v7, (uint64_t)v8, v24, v26, v11);
            v27._uint64_t countAndFlagsBits = 45LL;
            v27._object = (void *)0xE100000000000000LL;
            String.append(_:)(v27);
            Character.write<A>(to:)( &v45,  v7,  v8,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
LABEL_29:
            v35._uint64_t countAndFlagsBits = 61LL;
            v35._object = (void *)0xE100000000000000LL;
            String.append(_:)(v35);
            v36._uint64_t countAndFlagsBits = v25;
            v36._object = v15;
            String.append(_:)(v36);
            unint64_t v14 = v46;
            uint64_t v40 = v45;
            unint64_t v9 = v37;
            goto LABEL_11;
          }

          uint64_t v45 = 45LL;
          unint64_t v31 = 0xE100000000000000LL;
        }

        else
        {
          uint64_t v45 = 11565LL;
          unint64_t v31 = 0xE200000000000000LL;
        }

        unint64_t v46 = v31;
        unint64_t v32 = v9;
        uint64_t v25 = v10;
        uint64_t v33 = v10;
        int8x16_t v15 = (void *)v11;
        sub_10005BDF8(v7, (uint64_t)v8, v32, v33, v11);
        v34._uint64_t countAndFlagsBits = v7;
        v34._object = v8;
        String.append(_:)(v34);
        goto LABEL_29;
      }

      if (v9 >> 6)
      {
        if (v21 == 1)
        {
          uint64_t v45 = 0LL;
          unint64_t v46 = 0xE000000000000000LL;
          uint64_t v22 = v10;
          int8x16_t v15 = (void *)v11;
          sub_10005BDF8(v7, (uint64_t)v8, v9, v22, v11);
          v23._uint64_t countAndFlagsBits = 45LL;
          v23._object = (void *)0xE100000000000000LL;
          String.append(_:)(v23);
          Character.write<A>(to:)( &v45,  v7,  v8,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
LABEL_25:
          unint64_t v14 = v46;
          uint64_t v40 = v45;
          goto LABEL_11;
        }

        uint64_t v45 = 45LL;
        unint64_t v28 = 0xE100000000000000LL;
      }

      else
      {
        uint64_t v45 = 11565LL;
        unint64_t v28 = 0xE200000000000000LL;
      }

      unint64_t v46 = v28;
      uint64_t v29 = v10;
      int8x16_t v15 = (void *)v11;
      sub_10005BDF8(v7, (uint64_t)v8, v9, v29, v11);
      v30._uint64_t countAndFlagsBits = v7;
      v30._object = v8;
      String.append(_:)(v30);
      goto LABEL_25;
    }

    if ((v12 & 0x8000000000000000LL) != 0) {
      goto LABEL_33;
    }
    if (v12 >= *(void *)(v39 + 16)) {
      goto LABEL_34;
    }
LABEL_10:
    uint64_t v13 = (uint64_t *)(v38 + 16 * v12);
    unint64_t v14 = v13[1];
    uint64_t v40 = *v13;
    int8x16_t v15 = *(void **)(i + 16);
    sub_10005BDF8(v7, (uint64_t)v8, v9, *(void *)(i + 8), v11);
    swift_bridgeObjectRetain(v14);
LABEL_11:
    unint64_t v16 = sub_100067054();
    uint64_t v47 = Set.init(minimumCapacity:)(1LL, &type metadata for InputOrigin.Element, v16);
    sub_10005954C((uint64_t)&v45, v12, v43, v42);
    uint64_t v17 = v47;
    sub_100066ED8(v7, (uint64_t)v8, v9, v41, (uint64_t)v15);
    unint64_t result = v44;
    __n128 v48 = v44;
    unint64_t v19 = v44[2];
    unint64_t v18 = v44[3];
    if (v19 >= v18 >> 1)
    {
      sub_10004FEB8((void *)(v18 > 1), v19 + 1, 1);
      unint64_t result = v48;
    }

    result[2] = v19 + 1;
    uint64_t v20 = &result[3 * v19];
    v20[4] = v17;
    v20[5] = v40;
    v20[6] = v14;
    if (!--v3) {
      return result;
    }
  }

  if ((v12 & 0x8000000000000000LL) == 0)
  {
    if (v12 >= *(void *)(v39 + 16)) {
      goto LABEL_32;
    }
    goto LABEL_10;
  }

  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

unint64_t sub_100075434@<X0>( unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  unint64_t result = sub_10007CBC8(61LL, 0xE100000000000000LL, a1, a2, a3, a4);
  if ((v11 & 1) != 0)
  {
    swift_bridgeObjectRetain(a4);
    uint64_t v22 = Substring.distance(from:to:)(a1, a2, a1, a2, a3, a4);
    unint64_t result = swift_bridgeObjectRelease(a4);
    if (v22 == 1)
    {
      if ((a2 ^ a1) < 0x4000)
      {
LABEL_20:
        __break(1u);
        goto LABEL_21;
      }

      swift_bridgeObjectRetain(a4);
      uint64_t v23 = Substring.subscript.getter(a1, a1, a2, a3, a4);
      uint64_t v25 = v24;
      unint64_t result = swift_bridgeObjectRelease_n(a4, 2LL);
      uint64_t v26 = 0LL;
      uint64_t v27 = 0LL;
      unint64_t v28 = 64LL;
    }

    else
    {
      uint64_t v23 = static String._fromSubstring(_:)(a1, a2, a3, a4);
      uint64_t v25 = v29;
      unint64_t result = swift_bridgeObjectRelease(a4);
      uint64_t v26 = 0LL;
      uint64_t v27 = 0LL;
      unint64_t v28 = 128LL;
    }

char *sub_100075808(uint64_t a1)
{
  uint64_t v2 = v1;
  int64_t v4 = (char *)_swiftEmptyArrayStorage;
  unint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain(a1);
    uint64_t v6 = 0LL;
    uint64_t v7 = (void *)(a1 + 56);
    uint64_t v26 = a1;
    unint64_t v27 = v5 - 1;
    while (1)
    {
      uint64_t v9 = *(v7 - 3);
      unint64_t v8 = *(v7 - 2);
      swift_bridgeObjectRetain(v8);
      uint64_t v10 = sub_100072C84(v9, v8, v6);
      if (v2)
      {
        swift_unknownObjectRelease(v26);
        swift_bridgeObjectRelease(v8);
        int64_t v4 = (char *)_swiftEmptyArrayStorage;
        swift_bridgeObjectRelease(v26);
        swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
        return v4;
      }

      uint64_t v11 = v10;
      swift_bridgeObjectRelease(v8);
      swift_bridgeObjectRetain(v11);
      sub_100056B60((char *)v11);
      if (!*(void *)(v11 + 16)) {
        goto LABEL_30;
      }
      uint64_t v12 = *(void *)(v11 + 32);
      uint64_t v13 = *(void *)(v11 + 40);
      uint64_t v14 = *(void *)(v11 + 48);
      uint64_t v15 = *(void *)(v11 + 56);
      uint64_t v16 = *(void *)(v11 + 64);
      swift_bridgeObjectRelease(v11);
      if ((v14 & 0x6000000000000000LL) == 0x4000000000000000LL)
      {
        BOOL v18 = v14 == 0x4000000000000000LL && (v13 | v12 | v15 | v16) == 0;
        if (v27 == v6 || v18)
        {
          if (v27 == v6)
          {
LABEL_17:
            swift_unknownObjectRelease(v26);
            return (char *)_swiftEmptyArrayStorage;
          }

          uint64_t v19 = v6 + 1;
          if (v6 + 1 < v5)
          {
            int64_t v4 = (char *)_swiftEmptyArrayStorage;
            swift_unknownObjectRetain(v26);
            do
            {
              uint64_t v21 = *(v7 - 1);
              uint64_t v20 = *v7;
              swift_bridgeObjectRetain(*v7);
              if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0) {
                int64_t v4 = sub_100058438(0LL, *((void *)v4 + 2) + 1LL, 1, v4);
              }
              unint64_t v23 = *((void *)v4 + 2);
              unint64_t v22 = *((void *)v4 + 3);
              if (v23 >= v22 >> 1) {
                int64_t v4 = sub_100058438((char *)(v22 > 1), v23 + 1, 1, v4);
              }
              uint64_t v24 = &v4[64 * v23];
              *((void *)v24 + 8) = 0LL;
              *((void *)v24 + 9) = v19;
              v7 += 2;
              *((void *)v4 + 2) = v23 + 1;
              *((void *)v24 + 4) = v21;
              *((void *)v24 + 5) = v20;
              *((void *)v24 + 6) = 0x2000000000000000LL;
              *((void *)v24 + 7) = 0LL;
              *((void *)v24 + 10) = 0LL;
              ++v19;
              v24[88] = 1;
            }

            while (v5 != v19);
            swift_unknownObjectRelease_n(v26, 2LL);
            return v4;
          }

uint64_t sub_100075A84(uint64_t result, uint64_t a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  if ((a3 & 0x100) != 0) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(a4 + 16);
  if (v5 < a5)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  if ((a5 & 0x8000000000000000LL) == 0)
  {
    if (v5 != a5)
    {
      uint64_t v6 = (unsigned __int8 *)(a4 + (a5 << 6) + 88);
      while (a5 < v5)
      {
        uint64_t v7 = *((void *)v6 - 2);
        if (v7 > result) {
          return a5;
        }
        if (v7 == result)
        {
          int v8 = *v6;
          if ((a3 & 1) != 0)
          {
            if ((v8 & 1) == 0) {
              return a5;
            }
          }

          else
          {
            if (*((void *)v6 - 1) <= a2) {
              int v8 = 1;
            }
            if (v8 != 1) {
              return a5;
            }
          }
        }

        if (__OFADD__(a5, 1LL)) {
          goto LABEL_20;
        }
        ++a5;
        v6 += 64;
        if (a5 == v5) {
          return 0LL;
        }
      }

      __break(1u);
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }

    return 0LL;
  }

uint64_t sub_100075B28@<X0>(uint64_t result@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = *(void *)(result + 16);
  if ((uint64_t)v4 < (uint64_t)a2)
  {
    __break(1u);
    goto LABEL_9;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  if (v4 == a2)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    uint64_t v11 = 0LL;
    char v12 = 0;
    unint64_t v13 = 0x7FFFFFF3ELL;
LABEL_7:
    *(void *)a3 = v5;
    *(void *)(a3 + 8) = v6;
    *(void *)(a3 + 16) = v7;
    *(void *)(a3 + 24) = v8;
    *(void *)(a3 + 32) = v9;
    *(void *)(a3 + 40) = v13;
    *(void *)(a3 + 48) = v10;
    *(void *)(a3 + 56) = v11;
    *(void *)(a3 + 64) = v5;
    *(void *)(a3 + 72) = v6;
    *(_BYTE *)(a3 + 80) = v12;
    return result;
  }

  if (v4 > a2)
  {
    uint64_t v14 = result + (a2 << 6);
    uint64_t v8 = *(void *)(v14 + 32);
    uint64_t v9 = *(void *)(v14 + 40);
    unint64_t v13 = *(void *)(v14 + 48);
    uint64_t v10 = *(void *)(v14 + 56);
    uint64_t v11 = *(void *)(v14 + 64);
    uint64_t v5 = *(void *)(v14 + 72);
    uint64_t v6 = *(void *)(v14 + 80);
    uint64_t v7 = *(unsigned __int8 *)(v14 + 88);
    unint64_t result = sub_10005BDF8(v8, v9, v13, v10, v11);
    char v12 = v7;
    goto LABEL_7;
  }

uint64_t sub_100075C04(uint64_t result, unint64_t a2)
{
  unint64_t v2 = *(void *)(result + 16);
  if ((uint64_t)v2 < (uint64_t)a2)
  {
    __break(1u);
    goto LABEL_15;
  }

  if ((a2 & 0x8000000000000000LL) != 0)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return result;
  }

  if (v2 == a2) {
    return 0LL;
  }
  if (v2 <= a2) {
    goto LABEL_16;
  }
  uint64_t v3 = result + (a2 << 6);
  int8x16_t v4 = vorrq_s8(*(int8x16_t *)(v3 + 32), *(int8x16_t *)(v3 + 56));
  int8x8_t v5 = vorr_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
  return *(void *)(v3 + 48) != 0x4000000000000000LL || *(void *)&v5 != 0LL;
}

void sub_100075C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *(void *)(a1 + 16);
  if (v22 < a2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  if (a2 < 0)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }

  uint64_t v2 = v22 - a2;
  if (v22 == a2) {
    return;
  }
  unint64_t v27 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(a1);
  sub_10004FDF4(0LL, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    uint64_t v4 = 0LL;
    int8x8_t v5 = v27;
    uint64_t v19 = a1;
    uint64_t v6 = a2;
    uint64_t v7 = (_BYTE *)(a1 + (a2 << 6) + 88);
    uint64_t v21 = v2;
    while (1)
    {
      uint64_t v8 = v4 + 1;
      if (__OFADD__(v4, 1LL)) {
        break;
      }
      if (v6 + v4 >= v22 || v4 >= v2) {
        goto LABEL_14;
      }
      uint64_t v9 = *((void *)v7 - 1);
      char v10 = *v7;
      __int128 v11 = *(_OWORD *)(v7 - 40);
      v23[0] = *(_OWORD *)(v7 - 56);
      v23[1] = v11;
      v23[2] = *(_OWORD *)(v7 - 24);
      uint64_t v24 = v9;
      char v25 = v10;
      sub_100074038((uint64_t)v23, v26);
      uint64_t v13 = v26[0];
      uint64_t v12 = v26[1];
      unint64_t v27 = v5;
      unint64_t v15 = v5[2];
      unint64_t v14 = v5[3];
      if (v15 >= v14 >> 1)
      {
        sub_10004FDF4((char *)(v14 > 1), v15 + 1, 1);
        uint64_t v6 = a2;
        int8x8_t v5 = v27;
      }

      v5[2] = v15 + 1;
      uint64_t v16 = &v5[2 * v15];
      v16[4] = v13;
      v16[5] = v12;
      ++v4;
      v7 += 64;
      uint64_t v2 = v21;
      if (v8 == v21)
      {
        swift_bridgeObjectRelease(v19);
        *(void *)&v23[0] = v5;
        uint64_t v17 = sub_100005104(&qword_1000B90C8);
        unint64_t v18 = sub_10005EC18();
        BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v17, v18);
        swift_bridgeObjectRelease(v5);
        return;
      }
    }

    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

ValueMetadata *type metadata accessor for SplitArguments.InputIndex()
{
  return &type metadata for SplitArguments.InputIndex;
}

uint64_t destroy for ParsedArgument(void *a1, uint64_t a2)
{
  return sub_100076180(a1, a2, sub_100066EF8);
}

void *initializeWithCopy for ParsedArgument(void *a1, void *a2, uint64_t a3)
{
  return sub_100075F08(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_10005BE18);
}

uint64_t *assignWithCopy for ParsedArgument(uint64_t *a1, void *a2, uint64_t a3)
{
  return sub_100075F80( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_10005BE18,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100066EF8);
}

void *assignWithTake for ParsedArgument(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10007600C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100066EF8);
}

uint64_t sub_100075EAC(uint64_t a1)
{
  return *(void *)(a1 + 16) >> 63;
}

uint64_t sub_100075EB8(uint64_t result)
{
  *(void *)(result + 16) &= ~0x8000000000000000LL;
  return result;
}

uint64_t sub_100075EC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = *(void *)(result + 16) & 0xC1LL | (a2 << 63);
  return result;
}

ValueMetadata *type metadata accessor for ParsedArgument()
{
  return &type metadata for ParsedArgument;
}

uint64_t destroy for SplitArguments.Element.Value(void *a1, uint64_t a2)
{
  return sub_100076180(a1, a2, sub_100066ED8);
}

void *initializeWithCopy for SplitArguments.Element.Value(void *a1, void *a2, uint64_t a3)
{
  return sub_100075F08(a1, a2, a3, (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_10005BDF8);
}

void *sub_100075F08( void *a1, void *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a2[2];
  uint64_t v8 = a2[3];
  uint64_t v9 = a2[4];
  a4(*a2, v6, v7, v8, v9);
  *a1 = v5;
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  a1[4] = v9;
  return a1;
}

uint64_t *assignWithCopy for SplitArguments.Element.Value(uint64_t *a1, void *a2, uint64_t a3)
{
  return sub_100075F80( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t, uint64_t, uint64_t))sub_10005BDF8,  (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100066ED8);
}

uint64_t *sub_100075F80( uint64_t *a1, void *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = a2[2];
  uint64_t v10 = a2[3];
  uint64_t v11 = a2[4];
  a4(*a2, v8, v9, v10, v11);
  uint64_t v12 = *a1;
  uint64_t v13 = a1[1];
  uint64_t v14 = a1[2];
  uint64_t v15 = a1[3];
  uint64_t v16 = a1[4];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v9;
  a1[3] = v10;
  a1[4] = v11;
  a5(v12, v13, v14, v15, v16);
  return a1;
}

void *assignWithTake for SplitArguments.Element.Value(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10007600C(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100066ED8);
}

void *sub_10007600C( void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *a1;
  uint64_t v9 = a1[1];
  uint64_t v8 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  __int128 v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v12;
  a1[4] = v6;
  a4(v7, v9, v8, v10, v11);
  return a1;
}

uint64_t _s14ArgumentParser14ParsedArgumentOwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unsigned int v2 = (*(void *)(a1 + 16) >> 3) & 0xFFFFFFE0 | (*(void *)(a1 + 16) >> 1) & 0x1F;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t sub_1000760A8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 40) = 1;
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
      *(void *)unint64_t result = 0LL;
      *(void *)(result + 8) = 0LL;
      *(void *)(result + 24) = 0LL;
      *(void *)(result + 32) = 0LL;
      *(void *)(result + 16) = (8LL * -a2) & 0x7FFFFFF00LL | (2 * (-a2 & 0x1FLL));
      return result;
    }

    *(_BYTE *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

uint64_t sub_100076104(uint64_t a1)
{
  if (((*(void *)(a1 + 16) >> 61) & 2) != 0) {
    return (*(_DWORD *)a1 + 2);
  }
  else {
    return (*(void *)(a1 + 16) >> 61) & 3LL;
  }
}

uint64_t sub_100076124(uint64_t result)
{
  *(void *)(result + 16) &= 0x9FFFFFFFFFFFFFFFLL;
  return result;
}

uint64_t sub_100076134(uint64_t result, uint64_t a2)
{
  if (a2 < 2)
  {
    *(void *)(result + 16) = *(void *)(result + 16) & 0x80000000000000C1LL | (a2 << 61);
  }

  else
  {
    *(void *)unint64_t result = (a2 - 2);
    *(_OWORD *)(result + 8) = xmmword_100097E40;
    *(void *)(result + 24) = 0LL;
    *(void *)(result + 32) = 0LL;
  }

  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.Element.Value()
{
  return &type metadata for SplitArguments.Element.Value;
}

uint64_t sub_100076180( void *a1, uint64_t a2, uint64_t (*a3)(void, void, void, void, void))
{
  return a3(*a1, a1[1], a1[2], a1[3], a1[4]);
}

uint64_t initializeWithCopy for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  sub_10005BDF8(*(void *)a2, v5, v6, v7, v8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t assignWithCopy for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  sub_10005BDF8(*(void *)a2, v5, v6, v7, v8);
  uint64_t v9 = *(void *)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  unint64_t v11 = *(void *)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  sub_100066ED8(v9, v10, v11, v12, v13);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v14 = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 48) = v14;
  return a1;
}

uint64_t assignWithTake for SplitArguments.Element(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  unint64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  __int128 v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v9;
  sub_100066ED8(v4, v5, v6, v7, v8);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for SplitArguments.Element(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unsigned int v2 = (*(void *)(a1 + 16) >> 3) & 0xFFFFFFE0 | (*(void *)(a1 + 16) >> 1) & 0x1F;
  if (v2 > 0x80000000) {
    int v3 = ~v2;
  }
  else {
    int v3 = -1;
  }
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SplitArguments.Element(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 57) = 1;
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
      *(void *)unint64_t result = 0LL;
      *(void *)(result + 8) = 0LL;
      *(void *)(result + 24) = 0LL;
      *(void *)(result + 32) = 0LL;
      *(void *)(result + 16) = (8LL * -a2) & 0x7FFFFFF00LL | (2 * (-a2 & 0x1FLL));
      return result;
    }

    *(_BYTE *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.Element()
{
  return &type metadata for SplitArguments.Element;
}

uint64_t getEnumTagSinglePayload for SplitArguments.Index(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for SplitArguments.Index(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)unint64_t result = (a2 - 1);
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

  *(_BYTE *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.Index()
{
  return &type metadata for SplitArguments.Index;
}

uint64_t destroy for SplitArguments(void *a1)
{
  return swift_bridgeObjectRelease(a1[2]);
}

uint64_t *_s14ArgumentParser14SplitArgumentsVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[2];
  a1[2] = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t *assignWithCopy for SplitArguments(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[1] = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t *assignWithTake for SplitArguments(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = a2[2];
  uint64_t v6 = a1[2];
  a1[1] = a2[1];
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  return a1;
}

ValueMetadata *type metadata accessor for SplitArguments()
{
  return &type metadata for SplitArguments;
}

unint64_t sub_100076544()
{
  unint64_t result = qword_1000B9D40;
  if (!qword_1000B9D40)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A7A0, &type metadata for SplitArguments.Index);
    atomic_store(result, (unint64_t *)&qword_1000B9D40);
  }

  return result;
}

unint64_t sub_10007658C()
{
  unint64_t result = qword_1000B9D48;
  if (!qword_1000B9D48)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A8F0, &type metadata for SplitArguments.InputIndex);
    atomic_store(result, (unint64_t *)&qword_1000B9D48);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for SplitArguments.SubIndex(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SplitArguments.SubIndex(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for SplitArguments.SubIndex(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)unint64_t result = 0LL;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 1;
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

  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_100076634(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100076650(uint64_t result, int a2)
{
  if (a2)
  {
    *(void *)unint64_t result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }

  else
  {
    *(_BYTE *)(result + 8) = 0;
  }

  return result;
}

ValueMetadata *type metadata accessor for SplitArguments.SubIndex()
{
  return &type metadata for SplitArguments.SubIndex;
}

unint64_t sub_100076684()
{
  unint64_t result = qword_1000B9D50;
  if (!qword_1000B9D50)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009A9E4, &type metadata for SplitArguments.SubIndex);
    atomic_store(result, (unint64_t *)&qword_1000B9D50);
  }

  return result;
}

void *sub_1000766C8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v44 = _swiftEmptyArrayStorage;
  sub_10004FDF4(0LL, v1, 0);
  uint64_t v3 = 0LL;
  uint64_t v4 = _swiftEmptyArrayStorage;
  uint64_t v5 = a1 + 32;
  uint64_t v31 = a1 + 32;
  do
  {
    uint64_t v6 = (_OWORD *)(v5 + 192 * v3);
    __int128 v7 = v6[9];
    __int128 v40 = v6[8];
    __int128 v41 = v7;
    __int128 v8 = v6[11];
    __int128 v42 = v6[10];
    __int128 v43 = v8;
    __int128 v9 = v6[5];
    __int128 v36 = v6[4];
    __int128 v37 = v9;
    __int128 v10 = v6[7];
    __int128 v38 = v6[6];
    __int128 v39 = v10;
    __int128 v11 = v6[1];
    v33[0] = *v6;
    v33[1] = v11;
    __int128 v12 = v6[3];
    __int128 v34 = v6[2];
    __int128 v35 = v12;
    unint64_t v14 = *((void *)&v37 + 1);
    uint64_t v13 = v38;
    unint64_t v15 = BYTE7(v38) & 0xF;
    if ((v38 & 0x2000000000000000LL) == 0) {
      unint64_t v15 = *((void *)&v37 + 1) & 0xFFFFFFFFFFFFLL;
    }
    if (v15)
    {
      swift_bridgeObjectRetain(v38);
    }

    else
    {
      uint64_t v16 = (void *)v34;
      uint64_t v17 = _swiftEmptyArrayStorage;
      if (*(void *)&v33[0] >= 2uLL) {
        uint64_t v17 = (void *)swift_bridgeObjectRetain(*(void *)&v33[0]);
      }
      uint64_t v18 = v17[2];
      if (v18)
      {
        uint64_t v19 = v17 + 4;
        do
        {
          unsigned int v20 = *((unsigned __int8 *)v19 + 16);
          if (v20 >> 6 != 1)
          {
            unint64_t v14 = *v19;
            uint64_t v13 = v19[1];
            sub_10002D724((uint64_t)v33);
            sub_100030508(v14, v13, v20);
            swift_bridgeObjectRelease(v17);
            sub_10002D8A4((uint64_t)v33);
            goto LABEL_21;
          }

          v19 += 3;
          --v18;
        }

        while (v18);
        unint64_t v14 = v17[4];
        uint64_t v21 = v17[5];
        unsigned int v22 = *((unsigned __int8 *)v17 + 48);
        sub_10002D724((uint64_t)v33);
        swift_bridgeObjectRetain(v13);
        uint64_t v32 = v21;
        sub_100030508(v14, v21, v22);
        swift_bridgeObjectRelease(v17);
        if (v22 >> 6)
        {
          uint64_t v5 = v31;
          swift_bridgeObjectRelease(v13);
          sub_10002D8A4((uint64_t)v33);
        }

        else
        {
          swift_bridgeObjectRelease(v13);
          sub_10002D8A4((uint64_t)v33);
          uint64_t v5 = v31;
        }

        uint64_t v13 = v32;
      }

      else
      {
        sub_10002D724((uint64_t)v33);
        swift_bridgeObjectRetain(v13);
        swift_bridgeObjectRelease(v17);
        if (v16[2])
        {
          uint64_t v23 = v16[4];
          unint64_t v24 = v16[5];
          swift_bridgeObjectRetain(v24);
          unint64_t v14 = sub_10004E9B4(45LL, 0xE100000000000000LL, v23, v24);
          uint64_t v26 = v25;
          swift_bridgeObjectRelease(v13);
          swift_bridgeObjectRelease(v24);
          sub_10002D8A4((uint64_t)v33);
          uint64_t v13 = v26;
        }

        else
        {
          swift_bridgeObjectRelease(v13);
          sub_10002D8A4((uint64_t)v33);
          uint64_t v13 = 0xE500000000000000LL;
          unint64_t v14 = 0x65756C6176LL;
        }
      }
    }

void *sub_10007698C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10004FDF4(0LL, v1, 0);
    uint64_t v3 = (void *)(a1 + 96);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain(*v3);
      if (v7 >= v6 >> 1) {
        sub_10004FDF4((char *)(v6 > 1), v7 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v7 + 1;
      __int128 v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v5;
      v8[5] = v4;
      v3 += 24;
      --v1;
    }

    while (v1);
  }

  return _swiftEmptyArrayStorage;
}

void *sub_100076A60(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_10004FDF4(0LL, v1, 0);
    uint64_t v3 = (void *)(a1 + 112);
    do
    {
      uint64_t v5 = *(v3 - 1);
      uint64_t v4 = *v3;
      unint64_t v7 = _swiftEmptyArrayStorage[2];
      unint64_t v6 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain(*v3);
      if (v7 >= v6 >> 1) {
        sub_10004FDF4((char *)(v6 > 1), v7 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v7 + 1;
      __int128 v8 = &_swiftEmptyArrayStorage[2 * v7];
      v8[4] = v5;
      v8[5] = v4;
      v3 += 24;
      --v1;
    }

    while (v1);
  }

  return _swiftEmptyArrayStorage;
}

void *sub_100076B34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10007889C(a1, a2);
  swift_bridgeObjectRelease(a2);
  return v3;
}

char *sub_100076B80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t v3 = 32LL;
  uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    unint64_t result = *(char **)(a1 + v3);
    unint64_t v6 = (unint64_t)result >= 2 ? *(void **)(a1 + v3) : _swiftEmptyArrayStorage;
    uint64_t v7 = v6[2];
    int64_t v8 = *((void *)v4 + 2);
    int64_t v9 = v8 + v7;
    if (__OFADD__(v8, v7)) {
      break;
    }
    sub_10002D810((unint64_t)result);
    unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native(v4);
    if ((_DWORD)result && v9 <= *((void *)v4 + 3) >> 1)
    {
      if (v6[2]) {
        goto LABEL_17;
      }
    }

    else
    {
      if (v8 <= v9) {
        int64_t v10 = v8 + v7;
      }
      else {
        int64_t v10 = v8;
      }
      unint64_t result = sub_100057BB8(result, v10, 1, v4);
      uint64_t v4 = result;
      if (v6[2])
      {
LABEL_17:
        uint64_t v11 = *((void *)v4 + 2);
        if ((*((void *)v4 + 3) >> 1) - v11 < v7) {
          goto LABEL_26;
        }
        unint64_t result = (char *)swift_arrayInitWithCopy(&v4[24 * v11 + 32], v6 + 4, v7, &type metadata for Name);
        if (v7)
        {
          uint64_t v12 = *((void *)v4 + 2);
          BOOL v13 = __OFADD__(v12, v7);
          uint64_t v14 = v12 + v7;
          if (v13) {
            goto LABEL_27;
          }
          *((void *)v4 + 2) = v14;
        }

        goto LABEL_4;
      }
    }

    if (v7) {
      goto LABEL_25;
    }
LABEL_4:
    swift_bridgeObjectRelease(v6);
    v3 += 192LL;
    if (!--v1)
    {
      swift_bridgeObjectRelease(a1);
      return v4;
    }
  }

  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

char *sub_100076CD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v3 = (void *)(swift_bridgeObjectRetain(a1) + 56);
  uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  do
  {
    uint64_t v6 = *v3;
    if (*v3)
    {
      uint64_t v7 = *(v3 - 1);
      swift_bridgeObjectRetain(*v3);
      if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0) {
        uint64_t v4 = sub_100057AB8(0LL, *((void *)v4 + 2) + 1LL, 1, v4);
      }
      unint64_t v9 = *((void *)v4 + 2);
      unint64_t v8 = *((void *)v4 + 3);
      if (v9 >= v8 >> 1) {
        uint64_t v4 = sub_100057AB8((char *)(v8 > 1), v9 + 1, 1, v4);
      }
      *((void *)v4 + 2) = v9 + 1;
      uint64_t v5 = &v4[16 * v9];
      *((void *)v5 + 4) = v7;
      *((void *)v5 + 5) = v6;
    }

    v3 += 24;
    --v1;
  }

  while (v1);
  swift_bridgeObjectRelease(a1);
  return v4;
}

uint64_t sub_100076DD0()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v2);
  uint64_t v4 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v5 = type metadata accessor for JSONEncoder.OutputFormatting(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v9 = &v29[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v7);
  uint64_t v11 = &v29[-v10];
  uint64_t v12 = type metadata accessor for JSONEncoder(0LL);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  uint64_t v13 = JSONEncoder.init()();
  static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  uint64_t v14 = dispatch thunk of JSONEncoder.outputFormatting.setter(v11);
  static JSONEncoder.OutputFormatting.sortedKeys.getter(v14);
  unint64_t v15 = (void (*)(_OWORD *, void))dispatch thunk of JSONEncoder.outputFormatting.modify(v30);
  sub_100076FE4(v11, (uint64_t)v9);
  uint64_t v16 = *(void (**)(char *, uint64_t))(v6 + 8);
  v16(v9, v5);
  v16(v11, v5);
  v15(v30, 0LL);
  __int128 v17 = *(_OWORD *)(v1 + 48);
  _OWORD v30[2] = *(_OWORD *)(v1 + 32);
  v30[3] = v17;
  __int128 v18 = *(_OWORD *)(v1 + 80);
  v30[4] = *(_OWORD *)(v1 + 64);
  v30[5] = v18;
  __int128 v19 = *(_OWORD *)(v1 + 16);
  v30[0] = *(_OWORD *)v1;
  v30[1] = v19;
  sub_100077204((void *)v1);
  unint64_t v20 = sub_100077288();
  uint64_t v21 = dispatch thunk of JSONEncoder.encode<A>(_:)(v30, &type metadata for ToolInfoV0, v20);
  unint64_t v23 = v22;
  unint64_t v24 = sub_1000772CC((void *)v1);
  static String.Encoding.utf8.getter(v24);
  uint64_t v25 = String.init(data:encoding:)(v21, v23, v4);
  if (v26)
  {
    uint64_t v27 = v25;
    sub_10001BB38(v21, v23);
    swift_release(v13);
  }

  else
  {
    sub_10001BB38(v21, v23);
    swift_release(v13);
    return 0LL;
  }

  return v27;
}

uint64_t sub_100076FE4(char *a1, uint64_t a2)
{
  uint64_t v30 = a1;
  uint64_t v4 = sub_100005104(&qword_1000B9D60);
  uint64_t v5 = __chkstk_darwin(v4);
  unint64_t v28 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - v7;
  uint64_t v9 = type metadata accessor for JSONEncoder.OutputFormatting(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v25 - v14;
  uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v27 = v2;
  v16(v13, v2, v9);
  uint64_t v17 = sub_100077350(&qword_1000B9D68, (uint64_t)&protocol conformance descriptor for JSONEncoder.OutputFormatting);
  dispatch thunk of SetAlgebra.intersection(_:)(a2, v9, v17);
  uint64_t v18 = sub_100077350(&qword_1000B9D70, (uint64_t)&protocol conformance descriptor for JSONEncoder.OutputFormatting);
  uint64_t v26 = a2;
  char v19 = dispatch thunk of static Equatable.== infix(_:_:)(v15, a2, v9, v18) ^ 1;
  uint64_t v29 = v4;
  unint64_t v20 = &v8[*(int *)(v4 + 48)];
  *uint64_t v8 = v19 & 1;
  if ((v19 & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
    uint64_t v22 = v26;
    v16(v20, v26, v9);
    v16(v13, v22, v9);
    dispatch thunk of SetAlgebra.formUnion(_:)(v13, v9, v17);
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  }

  else
  {
    uint64_t v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v21(v20, v15, v9);
  }

  unint64_t v23 = &v28[*(int *)(v29 + 48)];
  v21(v23, v20, v9);
  v21(v30, v23, v9);
  return v19 & 1;
}

void *sub_100077204(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[9];
  uint64_t v7 = a1[10];
  swift_bridgeObjectRetain(a1[11]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

unint64_t sub_100077288()
{
  unint64_t result = qword_1000B9D58;
  if (!qword_1000B9D58)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ToolInfoV0, &type metadata for ToolInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000B9D58);
  }

  return result;
}

void *sub_1000772CC(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[10];
  uint64_t v7 = a1[11];
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t sub_100077350(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v5 = type metadata accessor for JSONEncoder.OutputFormatting(255LL);
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

void *sub_100077390(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v21 = sub_10004D160( *(void *)(a1 + 16 * v1 + 16),  *(void *)(*(void *)(a1 + 16 * v1 + 24) + 8LL),  2,  0LL,  0LL,  0LL);
    uint64_t v22 = v3;
    sub_100032A2C(a1, (uint64_t)v23);
    sub_10002AACC((uint64_t)v23, (uint64_t)v20, &qword_1000B9148);
    sub_10002AACC((uint64_t)v23, (uint64_t)v34, &qword_1000B9148);
    if (sub_100033CB4((uint64_t)v34) != 1)
    {
      sub_10002AACC((uint64_t)v20, (uint64_t)&v35, &qword_1000B9148);
      v52[8] = v43;
      v52[9] = v44;
      v52[10] = v45;
      v52[11] = v46;
      v52[4] = v39;
      v52[5] = v40;
      v52[6] = v41;
      v52[7] = v42;
      v52[0] = v35;
      v52[1] = v36;
      v52[2] = v37;
      v52[3] = v38;
      sub_100060FF8((uint64_t)v52);
      sub_100033CCC((uint64_t)v23);
    }

    uint64_t v4 = sub_100032880(0, a1);
    uint64_t v5 = v4;
    if (*(void *)(v4 + 16))
    {
      v47[0] = 0xD000000000000016LL;
      v47[1] = 0x800000010009D570LL;
      __int128 v48 = xmmword_100097E30;
      uint64_t v50 = 0LL;
      uint64_t v49 = 0LL;
      char v51 = 0;
      sub_10005EC6C( (uint64_t)_swiftEmptyArrayStorage,  1LL,  (uint64_t)v47,  0LL,  0LL,  0LL,  0xE000000000000000LL,  (uint64_t)_swiftEmptyArrayStorage,  (uint64_t)&v24,  0);
      *(void *)uint64_t v8 = v5;
      *(_OWORD *)&v8[8] = v24;
      *(void *)&v8[24] = v25;
      __int128 v9 = v26;
      LOBYTE(v10) = v27;
      *((void *)&v10 + 1) = v28;
      __int128 v11 = v29;
      __int128 v12 = v30;
      *(void *)&__int128 v13 = v31;
      BYTE8(v13) = v32;
      __int128 v14 = v33;
      __int128 v15 = 0uLL;
      LOWORD(v16) = 4;
      *((void *)&v16 + 1) = String.init(argument:);
      *(void *)&__int128 v17 = 0LL;
      BYTE8(v17) = 0;
      uint64_t v18 = String.init(argument:);
      uint64_t v19 = 0LL;
      __int128 v37 = v26;
      __int128 v38 = v10;
      __int128 v35 = *(_OWORD *)v8;
      __int128 v36 = *(_OWORD *)&v8[16];
      __int128 v42 = v33;
      __int128 v40 = v30;
      __int128 v41 = v13;
      __int128 v39 = v29;
      __int128 v46 = (unint64_t)String.init(argument:);
      __int128 v45 = v17;
      __int128 v44 = v16;
      __int128 v43 = 0uLL;
      sub_100060FF8((uint64_t)&v35);
      sub_10002D8A4((uint64_t)v8);
    }

    else
    {
      swift_bridgeObjectRelease(v4);
    }

    return (void *)v21;
  }

  else
  {
    uint64_t v6 = _swiftEmptyArrayStorage;
    sub_100079598((uint64_t)_swiftEmptyArrayStorage);
  }

  return v6;
}

uint64_t sub_100077610(unint64_t a1, uint64_t a2)
{
  uint64_t v4 = _swiftEmptyArrayStorage;
  int64_t v135 = _swiftEmptyArrayStorage;
  unint64_t v136 = sub_100079598((uint64_t)_swiftEmptyArrayStorage);
  int64_t v5 = *(void *)(a1 + 16);
  swift_bridgeObjectRetain(a1);
  uint64_t v91 = a2;
  uint64_t result = swift_bridgeObjectRetain(a2);
  if (!v5)
  {
LABEL_87:
    swift_bridgeObjectRelease(v91);
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v4;
  }

  int64_t v7 = 0LL;
  unint64_t v98 = a1 + 32;
  unint64_t v93 = a1;
  int64_t v97 = v5;
  while (1)
  {
    if (v7 >= v5)
    {
      __break(1u);
LABEL_89:
      __break(1u);
LABEL_90:
      __break(1u);
      goto LABEL_91;
    }

    if (v7 < 0) {
      goto LABEL_89;
    }
    int64_t v17 = *(void *)(a1 + 16);
    uint64_t v18 = (__int128 *)(v98 + 192 * v7);
    __int128 v19 = v18[9];
    __int128 v132 = v18[8];
    *(_OWORD *)v133 = v19;
    __int128 v20 = v18[11];
    *(_OWORD *)&v133[16] = v18[10];
    __int128 v134 = v20;
    __int128 v21 = v18[5];
    __int128 v128 = v18[4];
    __int128 v129 = v21;
    __int128 v22 = v18[7];
    __int128 v130 = v18[6];
    __int128 v131 = v22;
    __int128 v23 = v18[1];
    __int128 v124 = *v18;
    __int128 v125 = v23;
    __int128 v24 = v18[3];
    __int128 v126 = v18[2];
    __int128 v127 = v24;
    char v25 = v24;
    unint64_t v26 = v7 + 1;
    uint64_t v27 = *((void *)&v125 + 1);
    unint64_t v99 = v129;
    unint64_t v28 = v128;
    unint64_t v29 = v130;
    __int128 v107 = *(_OWORD *)&v133[8];
    __int128 v108 = v132;
    __int128 v109 = v134;
    __int128 v110 = v126;
    char v106 = BYTE8(v130);
    uint64_t v104 = *((void *)&v131 + 1);
    uint64_t v105 = v131;
    char v102 = v133[1];
    char v103 = v133[0];
    char v101 = v133[24];
    uint64_t v100 = *((void *)&v124 + 1);
    unint64_t v111 = v124;
    if (v24 != 1)
    {
      uint64_t v8 = *((void *)&v127 + 1);
      unint64_t v9 = a1;
      uint64_t v10 = v125;
      uint64_t v11 = *((void *)&v129 + 1);
      uint64_t v12 = *((void *)&v128 + 1);
      sub_10002D724((uint64_t)&v124);
      uint64_t v13 = v27;
      int64_t v14 = v26;
      uint64_t v15 = v10;
      a1 = v9;
      unint64_t v16 = v99;
      goto LABEL_4;
    }

    uint64_t v94 = v130;
    uint64_t v95 = *((void *)&v125 + 1);
    uint64_t v96 = v128;
    if (v26 != v5) {
      break;
    }
    int64_t v14 = v5;
LABEL_54:
    uint64_t v60 = sub_100005104(&qword_1000B9230);
    uint64_t result = swift_initStackObject(v60, v112);
    *(_OWORD *)(result + 16) = xmmword_100096510;
    unint64_t v61 = v124;
    __int128 v63 = v130;
    __int128 v62 = v131;
    __int128 v64 = v129;
    *(_OWORD *)(result + 96) = v128;
    *(_OWORD *)(result + 112) = v64;
    __int128 v66 = v126;
    __int128 v65 = v127;
    __int128 v67 = v125;
    *(_OWORD *)(result + 32) = v124;
    *(_OWORD *)(result + 48) = v67;
    __int128 v69 = *(_OWORD *)&v133[16];
    __int128 v68 = v134;
    __int128 v70 = *(_OWORD *)v133;
    *(_OWORD *)(result + 160) = v132;
    *(_OWORD *)(result + 176) = v70;
    *(_OWORD *)(result + 192) = v69;
    *(_OWORD *)(result + 208) = v68;
    *(_OWORD *)(result + 128) = v63;
    *(_OWORD *)(result + 144) = v62;
    *(_OWORD *)(result + 64) = v66;
    *(_OWORD *)(result + 80) = v65;
    if (v14 <= v7) {
      goto LABEL_94;
    }
    if (v5 < v14) {
      goto LABEL_95;
    }
    *(void *)&__int128 v113 = result;
    sub_10002D724((uint64_t)&v124);
    sub_10002D724((uint64_t)&v124);
    swift_bridgeObjectRetain(a1);
    swift_bridgeObjectRetain(v91);
    sub_100056F0C(v26, v14, a1, v91);
    uint64_t v71 = v113;
    if (v61 >= 2)
    {
      __n128 v72 = sub_100076B80(v113);
      sub_10002D990(v111);
      unint64_t v111 = (unint64_t)v72;
    }

    __n128 v73 = sub_1000766C8(v71);
    unsigned __int8 v74 = v73;
    uint64_t v75 = v73[2];
    if (v75)
    {
      unint64_t v76 = v73 + 5;
      while (1)
      {
        uint64_t v11 = *(v76 - 1);
        unint64_t v29 = *v76;
        uint64_t v77 = HIBYTE(*v76) & 0xF;
        if ((*v76 & 0x2000000000000000LL) == 0) {
          uint64_t v77 = v11 & 0xFFFFFFFFFFFFLL;
        }
        if (v77) {
          break;
        }
        v76 += 2;
        if (!--v75) {
          goto LABEL_64;
        }
      }

      swift_bridgeObjectRetain(*v76);
    }

    else
    {
LABEL_64:
      uint64_t v11 = 0LL;
      unint64_t v29 = 0xE000000000000000LL;
    }

    swift_bridgeObjectRelease(v74);
    swift_bridgeObjectRelease(v94);
    uint64_t v78 = sub_100076CD0(v71);
    unint64_t v79 = v78;
    if (*((void *)v78 + 2))
    {
      uint64_t v15 = *((void *)v78 + 4);
      uint64_t v80 = *((void *)v78 + 5);
      swift_bridgeObjectRetain(v80);
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v80 = 0LL;
    }

    swift_bridgeObjectRelease(v79);
    swift_bridgeObjectRelease(v95);
    uint64_t v81 = sub_10007698C(v71);
    unint64_t v82 = v81;
    uint64_t v83 = v81[2];
    if (v83)
    {
      uint64_t v84 = v81 + 5;
      while (1)
      {
        uint64_t v8 = *(v84 - 1);
        unint64_t v28 = *v84;
        uint64_t v85 = HIBYTE(*v84) & 0xF;
        if ((*v84 & 0x2000000000000000LL) == 0) {
          uint64_t v85 = v8 & 0xFFFFFFFFFFFFLL;
        }
        if (v85) {
          break;
        }
        v84 += 2;
        if (!--v83) {
          goto LABEL_75;
        }
      }

      swift_bridgeObjectRetain(*v84);
    }

    else
    {
LABEL_75:
      uint64_t v8 = 0LL;
      unint64_t v28 = 0xE000000000000000LL;
    }

    swift_bridgeObjectRelease(v82);
    swift_bridgeObjectRelease(v96);
    uint64_t v86 = sub_100076A60(v71);
    swift_bridgeObjectRelease(v71);
    uint64_t v87 = v86[2];
    if (v87)
    {
      uint64_t v88 = v86 + 5;
      while (1)
      {
        uint64_t v12 = *(v88 - 1);
        unint64_t v89 = *v88;
        uint64_t v90 = HIBYTE(*v88) & 0xF;
        if ((*v88 & 0x2000000000000000LL) == 0) {
          uint64_t v90 = v12 & 0xFFFFFFFFFFFFLL;
        }
        if (v90) {
          break;
        }
        v88 += 2;
        if (!--v87) {
          goto LABEL_83;
        }
      }

      swift_bridgeObjectRetain(*v88);
    }

    else
    {
LABEL_83:
      uint64_t v12 = 0LL;
      unint64_t v89 = 0xE000000000000000LL;
    }

    swift_bridgeObjectRelease(v86);
    swift_bridgeObjectRelease(v99);
    unint64_t v16 = v89;
    a1 = v93;
    char v25 = 1;
    uint64_t v13 = v80;
LABEL_4:
    *(void *)&__int128 v113 = v111;
    *((void *)&v113 + 1) = v100;
    *(void *)&__int128 v114 = v15;
    *((void *)&v114 + 1) = v13;
    __int128 v115 = v110;
    LOBYTE(v116) = v25 & 1;
    *((void *)&v116 + 1) = v8;
    *(void *)&__int128 v117 = v28;
    *((void *)&v117 + 1) = v12;
    *(void *)&__int128 v118 = v16;
    *((void *)&v118 + 1) = v11;
    *(void *)&__int128 v119 = v29;
    BYTE8(v119) = v106;
    *(void *)&__int128 v120 = v105;
    *((void *)&v120 + 1) = v104;
    __int128 v121 = v108;
    v122[0] = v103;
    v122[1] = v102;
    *(_OWORD *)&v122[8] = v107;
    v122[24] = v101 & 1;
    __int128 v123 = v109;
    v137[0] = v113;
    v137[1] = v114;
    v137[9] = *(_OWORD *)v122;
    v137[2] = v110;
    v137[3] = v116;
    v137[7] = v120;
    v137[8] = v108;
    v137[5] = v118;
    v137[6] = v119;
    v137[4] = v117;
    v137[11] = v109;
    v137[10] = *(_OWORD *)&v122[16];
    sub_10002D724((uint64_t)&v113);
    sub_100060FF8((uint64_t)v137);
    sub_10002D8A4((uint64_t)&v113);
    uint64_t result = sub_10002D8A4((uint64_t)&v113);
    int64_t v7 = v14;
    int64_t v5 = v97;
    if (v14 == v97)
    {
      uint64_t v4 = v135;
      goto LABEL_87;
    }
  }

  uint64_t v30 = *(void *)(v126 + 16);
  int64_t v92 = v17;
  uint64_t v31 = v126 + 32;
  int64_t v14 = v7 + 1;
  while (v14 < v5)
  {
    if (v14 >= v17) {
      goto LABEL_92;
    }
    uint64_t v32 = *(void *)(v98 + 192 * v14 + 32);
    if (*(void *)(v32 + 16) != v30) {
      goto LABEL_52;
    }
    if (v30 && v32 != (void)v110)
    {
      uint64_t v33 = 0LL;
      uint64_t v34 = v32 + 32;
      while (1)
      {
        __int128 v35 = (uint64_t *)(v34 + 24 * v33);
        uint64_t result = *v35;
        uint64_t v36 = v35[1];
        __int128 v37 = (void *)v35[2];
        __int128 v38 = (void *)(v31 + 24 * v33);
        uint64_t v39 = v38[1];
        __int128 v40 = (void *)v38[2];
        if (*v35 != *v38 || v36 != v39)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v36, *v38, v39, 0LL);
          if ((result & 1) == 0) {
            break;
          }
        }

        uint64_t v42 = v37[2];
        if (v42 != v40[2]) {
          break;
        }
        if (v42) {
          BOOL v43 = v37 == v40;
        }
        else {
          BOOL v43 = 1;
        }
        if (!v43)
        {
          uint64_t result = v37[4];
          uint64_t v44 = v37[5];
          uint64_t v45 = v40[4];
          uint64_t v46 = v40[5];
          if (result != v45 || v44 != v46)
          {
            uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v44, v45, v46, 0LL);
            if ((result & 1) == 0) {
              break;
            }
          }

          if (v42 != 1)
          {
            uint64_t result = v37[6];
            uint64_t v48 = v37[7];
            uint64_t v49 = v40[6];
            uint64_t v50 = v40[7];
            if (result != v49 || v48 != v50)
            {
              uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v48, v49, v50, 0LL);
              if ((result & 1) == 0) {
                break;
              }
            }

            uint64_t v52 = v42 - 2;
            if (v52)
            {
              uint64_t v53 = v40 + 9;
              uint64_t v54 = v37 + 9;
              do
              {
                uint64_t result = *(v54 - 1);
                uint64_t v55 = *v54;
                uint64_t v56 = *(v53 - 1);
                uint64_t v57 = *v53;
                if (result != v56 || v55 != v57)
                {
                  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v55, v56, v57, 0LL);
                  if ((result & 1) == 0) {
                    goto LABEL_53;
                  }
                }

                v53 += 2;
                v54 += 2;
              }

              while (--v52);
            }
          }
        }

        if (++v33 == v30) {
          goto LABEL_49;
        }
      }

LABEL_49:
    if (__OFADD__(v14++, 1LL)) {
      goto LABEL_93;
    }
    int64_t v5 = v97;
    unint64_t v26 = v7 + 1;
    int64_t v17 = v92;
    if (v14 == v97)
    {
      int64_t v14 = v97;
LABEL_52:
      a1 = v93;
      goto LABEL_54;
    }
  }

LABEL_91:
  __break(1u);
LABEL_92:
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_100077CF4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  void (*v18)(_OWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  void (*v60)(_OWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v63;
  void *v64;
  void v65[2];
  uint64_t v66;
  void v67[14];
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void v71[13];
  uint64_t v72;
  _OWORD v73[2];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  void v81[9];
  unint64_t v82;
  _OWORD v83[5];
  uint64_t v84;
  _BYTE v85[136];
  _BYTE v86[136];
  _BYTE v87[16];
  _BYTE v88[16];
  _OWORD v89[12];
  uint64_t v90;
  uint64_t v91;
  void v92[4];
  uint64_t v2 = *(void *)(result + 16);
  if (v2)
  {
    uint64_t v3 = result;
    uint64_t v4 = v2 - 1;
    BOOL v9 = v2 == 1;
    uint64_t v5 = result + 16 * (v2 - 1);
    uint64_t v7 = *(void *)(v5 + 32);
    uint64_t v6 = *(void *)(v5 + 40);
    int64_t v8 = v4 & 0x7FFFFFFFFFFFFFFFLL;
    BOOL v9 = v9 || v8 == 0;
    __int128 v63 = *(void *)(v5 + 40);
    if (v9)
    {
      __int128 v64 = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(result);
    }

    else
    {
      *(void *)&v89[0] = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain(result);
      sub_10004FDF4(0LL, v8, 0);
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v11 = v3 + 40;
      do
      {
        uint64_t v12 = (*(uint64_t (**)(void))(*(void *)v11 + 24LL))();
        uint64_t v14 = v13;
        *(void *)&v89[0] = v10;
        unint64_t v16 = v10[2];
        unint64_t v15 = v10[3];
        if (v16 >= v15 >> 1)
        {
          sub_10004FDF4((char *)(v15 > 1), v16 + 1, 1);
          uint64_t v10 = *(void **)&v89[0];
        }

        v10[2] = v16 + 1;
        int64_t v17 = &v10[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
        v11 += 16LL;
        --v8;
      }

      while (v8);
      __int128 v64 = v10;
      (*(void (**)(void *__return_ptr))(*(void *)(v3 + 40) + 16LL))(v65);
      sub_10002AACC((uint64_t)&v66, (uint64_t)v88, &qword_1000B9110);
      sub_10002E7A0((uint64_t)v88);
      sub_10002CC24(v65);
      sub_10002AACC((uint64_t)v88, (uint64_t)&v90, &qword_1000B9110);
      uint64_t v6 = v63;
      if (v91) {
        sub_10007826C(0LL, 0LL, v90, v91);
      }
    }

    uint64_t v18 = *(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(v6 + 16);
    v18(v67, v7, v6);
    sub_10002CC24(v67);
    sub_10002AACC((uint64_t)&v68, (uint64_t)v87, &qword_1000B9720);
    sub_10002AACC((uint64_t)v87, (uint64_t)v92, &qword_1000B9720);
    if (v92[0])
    {
      (*(void (**)(uint64_t *__return_ptr))(v92[1] + 16LL))(&v69);
      unint64_t v58 = v70;
      char v59 = v69;
      swift_bridgeObjectRetain(v70);
      sub_10002CC24(&v69);
    }

    else
    {
      unint64_t v58 = 0LL;
      char v59 = 0LL;
    }

    uint64_t v60 = v18;
    v18(v71, v7, v6);
    __int128 v19 = v72;
    swift_bridgeObjectRetain(v72);
    sub_10002CC24(v71);
    swift_bridgeObjectRetain(v3);
    uint64_t v57 = sub_100076B34(v19, v3);
    swift_bridgeObjectRelease(v19);
    __int128 v20 = sub_100077390(v3);
    __int128 v22 = v21;
    unint64_t v61 = v3;
    swift_bridgeObjectRelease(v3);
    __int128 v23 = sub_100077610((unint64_t)v20, v22);
    char v25 = v24;
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRelease(v20);
    unint64_t v26 = *(void *)(v23 + 16);
    if (v26)
    {
      swift_bridgeObjectRetain(v23);
      uint64_t v56 = v25;
      swift_bridgeObjectRetain(v25);
      uint64_t v27 = v26 - 1;
      unint64_t v28 = (char *)_swiftEmptyArrayStorage;
      for (uint64_t i = 32LL; ; i += 192LL)
      {
        uint64_t v30 = *(_OWORD *)(v23 + i);
        uint64_t v31 = *(_OWORD *)(v23 + i + 16);
        uint64_t v32 = *(_OWORD *)(v23 + i + 32);
        v89[3] = *(_OWORD *)(v23 + i + 48);
        v89[2] = v32;
        v89[1] = v31;
        v89[0] = v30;
        uint64_t v33 = *(_OWORD *)(v23 + i + 64);
        uint64_t v34 = *(_OWORD *)(v23 + i + 80);
        __int128 v35 = *(_OWORD *)(v23 + i + 96);
        v89[7] = *(_OWORD *)(v23 + i + 112);
        v89[6] = v35;
        v89[5] = v34;
        v89[4] = v33;
        uint64_t v36 = *(_OWORD *)(v23 + i + 128);
        __int128 v37 = *(_OWORD *)(v23 + i + 144);
        __int128 v38 = *(_OWORD *)(v23 + i + 160);
        v89[11] = *(_OWORD *)(v23 + i + 176);
        v89[10] = v38;
        v89[9] = v37;
        v89[8] = v36;
        sub_10002D724((uint64_t)v89);
        sub_1000784E4((uint64_t)v89, (uint64_t)v85);
        sub_10002AACC((uint64_t)v85, (uint64_t)v81, &qword_1000B9D78);
        sub_10002D8A4((uint64_t)v89);
        sub_10002AACC((uint64_t)v85, (uint64_t)v86, &qword_1000B9D78);
        if (sub_100078848((uint64_t)v86) != 1)
        {
          if ((swift_isUniquelyReferenced_nonNull_native(v28) & 1) == 0) {
            unint64_t v28 = sub_10005885C(0LL, *((void *)v28 + 2) + 1LL, 1, v28);
          }
          __int128 v40 = *((void *)v28 + 2);
          uint64_t v39 = *((void *)v28 + 3);
          if (v40 >= v39 >> 1) {
            unint64_t v28 = sub_10005885C((char *)(v39 > 1), v40 + 1, 1, v28);
          }
          sub_10002AACC((uint64_t)v81, (uint64_t)v73, &qword_1000B9D78);
          *((void *)v28 + 2) = v40 + 1;
          __int128 v41 = &v28[136 * v40];
          *((_OWORD *)v41 + 2) = v73[0];
          uint64_t v42 = v76;
          uint64_t v44 = v73[1];
          BOOL v43 = v74;
          *((_OWORD *)v41 + 5) = v75;
          *((_OWORD *)v41 + 6) = v42;
          *((_OWORD *)v41 + 3) = v44;
          *((_OWORD *)v41 + 4) = v43;
          uint64_t v46 = v78;
          uint64_t v45 = v79;
          uint64_t v47 = v77;
          *((void *)v41 + 20) = v80;
          *((_OWORD *)v41 + 8) = v46;
          *((_OWORD *)v41 + 9) = v45;
          *((_OWORD *)v41 + 7) = v47;
        }

        if (!v27) {
          break;
        }
        --v27;
      }

      swift_bridgeObjectRelease_n(v56, 2LL);
      swift_bridgeObjectRelease_n(v23, 2LL);
    }

    else
    {
      swift_bridgeObjectRelease(v25);
      swift_bridgeObjectRelease(v23);
      unint64_t v28 = (char *)_swiftEmptyArrayStorage;
    }

    uint64_t v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v63 + 24))(v7, v63);
    uint64_t v50 = v49;
    v60(v73, v7, v63);
    char v51 = v74;
    swift_bridgeObjectRetain(*((void *)&v74 + 1));
    sub_10002CC24(v73);
    v60(v81, v7, v63);
    uint64_t v52 = v81[8];
    uint64_t v53 = v82;
    swift_bridgeObjectRetain(v82);
    sub_10002CC24(v81);
    CommandInfoV0.init(superCommands:commandName:abstract:discussion:defaultSubcommand:subcommands:arguments:)( (uint64_t)v64,  v48,  v50,  v51,  *((unint64_t *)&v51 + 1),  v52,  v53,  v59,  v83,  v58,  (uint64_t)v57,  (uint64_t)v28);
    uint64_t result = swift_unknownObjectRelease(v61);
    uint64_t v54 = v83[3];
    *(_OWORD *)(a2 + 32) = v83[2];
    *(_OWORD *)(a2 + 48) = v54;
    *(_OWORD *)(a2 + 64) = v83[4];
    *(void *)(a2 + 80) = v84;
    uint64_t v55 = v83[1];
    *(_OWORD *)a2 = v83[0];
    *(_OWORD *)(a2 + 16) = v55;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_10007822C(uint64_t result, uint64_t a2)
{
  if ((result & 0x8000000000000000LL) == 0) {
    return a2;
  }
  __break(1u);
  return result;
}

unint64_t sub_10007826C(unint64_t result, int64_t a2, uint64_t a3, uint64_t a4)
{
  if ((result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v6 = *v4;
  int64_t v7 = *((void *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  unint64_t v8 = result;
  unint64_t v9 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  unint64_t v10 = 1 - v9;
  if (__OFSUB__(1LL, v9))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }

  int64_t v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v4);
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v11 > *((void *)v6 + 3) >> 1)
  {
    if (v7 <= v11) {
      int64_t v15 = v7 + v10;
    }
    else {
      int64_t v15 = v7;
    }
    uint64_t v6 = sub_100057AB8(isUniquelyReferenced_nonNull_native, v15, 1, v6);
  }

  unint64_t v16 = &v6[16 * v8 + 32];
  uint64_t result = swift_arrayDestroy(v16, v9, &type metadata for String);
  if (!v10) {
    goto LABEL_19;
  }
  uint64_t v17 = *((void *)v6 + 2);
  BOOL v18 = __OFSUB__(v17, a2);
  uint64_t v19 = v17 - a2;
  if (v18) {
    goto LABEL_25;
  }
  uint64_t result = (unint64_t)(v16 + 16);
  __int128 v20 = &v6[16 * a2 + 32];
  uint64_t v21 = *((void *)v6 + 2);
  BOOL v18 = __OFADD__(v21, v10);
  uint64_t v22 = v21 + v10;
  if (!v18)
  {
    *((void *)v6 + 2) = v22;
LABEL_19:
    *(void *)unint64_t v16 = a3;
    *((void *)v16 + 1) = a4;
    *uint64_t v4 = v6;
    return result;
  }

_OWORD *sub_100078398(void *a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = malloc(0x240uLL);
  *a1 = result;
  if (a2 < a3 || a2 >= a4)
  {
    __break(1u);
    goto LABEL_7;
  }

  if (a2 < 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }

  if (*(void *)(a5 + 16) > (unint64_t)a2)
  {
    int64_t v11 = (_OWORD *)(a5 + 192 * a2);
    __int128 v13 = v11[10];
    __int128 v12 = v11[11];
    __int128 v14 = v11[9];
    result[8] = v13;
    result[9] = v12;
    __int128 v15 = v11[11];
    __int128 v17 = v11[12];
    __int128 v16 = v11[13];
    result[10] = v17;
    result[11] = v16;
    __int128 v19 = v11[6];
    __int128 v18 = v11[7];
    __int128 v20 = v11[5];
    result[4] = v19;
    result[5] = v18;
    __int128 v21 = v11[7];
    __int128 v23 = v11[8];
    __int128 v22 = v11[9];
    result[6] = v23;
    result[7] = v22;
    __int128 v24 = v11[3];
    *uint64_t result = v11[2];
    result[1] = v24;
    __int128 v25 = v11[5];
    __int128 v27 = v11[2];
    __int128 v26 = v11[3];
    __int128 v28 = v11[4];
    result[2] = v28;
    result[3] = v25;
    result[20] = v13;
    result[21] = v15;
    __int128 v29 = v11[13];
    result[22] = v17;
    result[23] = v29;
    result[16] = v19;
    result[17] = v21;
    result[18] = v23;
    result[19] = v14;
    result[12] = v27;
    result[13] = v26;
    result[14] = v28;
    result[15] = v20;
    sub_10002D724((uint64_t)result);
    return sub_10007848C;
  }

void sub_10007848C(_OWORD **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (uint64_t)(*a1 + 24);
  __int128 v3 = v1[21];
  v1[32] = v1[20];
  v1[33] = v3;
  __int128 v4 = v1[23];
  v1[34] = v1[22];
  v1[35] = v4;
  __int128 v5 = v1[17];
  v1[28] = v1[16];
  v1[29] = v5;
  __int128 v6 = v1[19];
  v1[30] = v1[18];
  v1[31] = v6;
  __int128 v7 = v1[13];
  v1[24] = v1[12];
  v1[25] = v7;
  __int128 v8 = v1[15];
  v1[26] = v1[14];
  v1[27] = v8;
  sub_10002D8A4(v2);
  free(v1);
}

uint64_t sub_1000784E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v4 = *(void **)a1;
  if (*(void *)a1)
  {
    if (v4 == (void *)1)
    {
      sub_10007886C((uint64_t)v52);
      sub_10002AACC((uint64_t)v52, (uint64_t)v58, &qword_1000B9D78);
      return sub_10002AACC((uint64_t)v58, a2, &qword_1000B9D78);
    }

    sub_10002D868((__n128 *)(a1 + 152), &v55);
    sub_10002D868(&v55, &v56);
    if (v57) {
      char v5 = 1;
    }
    else {
      char v5 = 2;
    }
    char v49 = v5;
  }

  else
  {
    char v49 = 0;
  }

  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v47 = *(void *)(a1 + 24);
  uint64_t v48 = *(void *)(a1 + 16);
  uint64_t v45 = *(void *)(a1 + 40);
  unint64_t v42 = *(void *)(a1 + 64);
  uint64_t v43 = *(void *)(a1 + 56);
  uint64_t v40 = *(void *)(a1 + 80);
  uint64_t v41 = *(void *)(a1 + 72);
  __int128 v53 = *(_OWORD *)(a1 + 88);
  unint64_t v7 = *(void *)(a1 + 120);
  uint64_t v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000LL) == 0) {
    uint64_t v8 = *(void *)(a1 + 112) & 0xFFFFFFFFFFFFLL;
  }
  int v9 = *(unsigned __int8 *)(a1 + 104);
  if (v8)
  {
    uint64_t v46 = *(void *)(a1 + 112);
    unint64_t v44 = *(void *)(a1 + 120);
    swift_bridgeObjectRetain(v7);
  }

  else
  {
    uint64_t v46 = 0LL;
    unint64_t v44 = 0LL;
  }

  unint64_t v10 = _swiftEmptyArrayStorage;
  if ((unint64_t)v4 >= 2)
  {
    swift_bridgeObjectRetain(v4);
    unint64_t v10 = v4;
  }

  int64_t v11 = v10[2];
  uint64_t v50 = a2;
  if (v11)
  {
    int v35 = v9;
    unint64_t v36 = (unint64_t)v4;
    char v38 = v6;
    v58[0] = _swiftEmptyArrayStorage;
    sub_10004FF54(0LL, v11, 0);
    __int128 v12 = (void *)v58[0];
    uint64_t v34 = v10;
    __int128 v13 = (unsigned __int8 *)(v10 + 6);
    do
    {
      uint64_t v14 = *((void *)v13 - 2);
      uint64_t v15 = *((void *)v13 - 1);
      unsigned int v16 = *v13;
      sub_100030508(v14, v15, *v13);
      v58[0] = v12;
      unint64_t v18 = v12[2];
      unint64_t v17 = v12[3];
      if (v18 >= v17 >> 1)
      {
        sub_10004FF54((char *)(v17 > 1), v18 + 1, 1);
        __int128 v12 = (void *)v58[0];
      }

      v12[2] = v18 + 1;
      __int128 v19 = &v12[3 * v18];
      *((_BYTE *)v19 + 32) = v16 >> 6;
      v13 += 24;
      v19[5] = v14;
      v19[6] = v15;
      --v11;
    }

    while (v11);
    swift_bridgeObjectRelease(v34);
    __int128 v4 = (void *)v36;
    LOBYTE(v6) = v38;
    int v9 = v35;
    if (v36 < 2) {
      goto LABEL_22;
    }
LABEL_24:
    swift_bridgeObjectRetain(v4);
    goto LABEL_25;
  }

  swift_bridgeObjectRelease(v10);
  __int128 v12 = _swiftEmptyArrayStorage;
LABEL_22:
  __int128 v4 = _swiftEmptyArrayStorage;
LABEL_25:
  uint64_t v20 = sub_10005CF90((uint64_t)v4);
  uint64_t v22 = v21;
  unsigned __int8 v24 = v23;
  unsigned int v25 = v23;
  swift_bridgeObjectRelease(v4);
  if (v25 <= 0xFD) {
    uint64_t v26 = v24 >> 6;
  }
  else {
    uint64_t v26 = 0LL;
  }
  uint64_t v39 = v26;
  if (v25 <= 0xFD) {
    uint64_t v27 = v20;
  }
  else {
    uint64_t v27 = 0LL;
  }
  uint64_t v37 = v27;
  if (v25 <= 0xFD) {
    uint64_t v28 = v22;
  }
  else {
    uint64_t v28 = 0LL;
  }
  __int128 v54 = v53;
  uint64_t v29 = v53 & 0xFFFFFFFFFFFFLL;
  if ((*((void *)&v53 + 1) & 0x2000000000000000LL) != 0) {
    uint64_t v29 = HIBYTE(*((void *)&v53 + 1)) & 0xFLL;
  }
  if (v29)
  {
    __int128 v51 = v53;
    swift_bridgeObjectRetain(*((void *)&v53 + 1));
  }

  else
  {
    swift_bridgeObjectRetain(*((void *)&v53 + 1));
    sub_10005D218((void *)a1, (unint64_t *)&v51);
    sub_100030564((uint64_t)&v54);
  }

  __int128 v30 = v51;
  swift_bridgeObjectRetain(v47);
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRetain(v42);
  unint64_t v31 = swift_bridgeObjectRetain(v40);
  ArgumentInfoV0.init(kind:shouldDisplay:sectionTitle:isOptional:isRepeating:names:preferredName:valueName:defaultValue:allValues:abstract:discussion:)( v49,  v9 == 0,  v46,  v44,  v6 & 1,  (v6 & 2) != 0,  (uint64_t)v12,  v39,  (uint64_t)v52,  v37,  v28,  v30,  *((unint64_t *)&v30 + 1),  v48,  v47,  v45,  v43,  v42,  v41,  v31);
  v32._uint64_t countAndFlagsBits = (uint64_t)v52;
  String.init(argument:)(v32);
  sub_10002AACC((uint64_t)v52, (uint64_t)v58, &qword_1000B9D78);
  a2 = v50;
  return sub_10002AACC((uint64_t)v58, a2, &qword_1000B9D78);
}

uint64_t sub_100078848(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 16);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

double sub_10007886C(uint64_t a1)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 1LL;
  double result = 0.0;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  return result;
}

void *sub_10007889C(uint64_t a1, uint64_t a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_10004FF1C(0LL, v2, 0);
    char v5 = (__int128 *)(a1 + 32);
    do
    {
      __int128 v19 = *v5;
      uint64_t v6 = swift_bridgeObjectRetain(a2);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v6);
      uint64_t v8 = (char *)a2;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
        uint64_t v8 = sub_100057FEC(0LL, *(void *)(a2 + 16) + 1LL, 1, (char *)a2);
      }
      unint64_t v10 = *((void *)v8 + 2);
      unint64_t v9 = *((void *)v8 + 3);
      if (v10 >= v9 >> 1) {
        uint64_t v8 = sub_100057FEC((char *)(v9 > 1), v10 + 1, 1, v8);
      }
      *((void *)v8 + 2) = v10 + 1;
      *(_OWORD *)&v8[16 * v10 + 32] = v19;
      sub_100077CF4(v20, v8);
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      unint64_t v11 = _swiftEmptyArrayStorage[3];
      if (v12 >= v11 >> 1) {
        sub_10004FF1C((char *)(v11 > 1), v12 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v12 + 1;
      __int128 v13 = &_swiftEmptyArrayStorage[11 * v12];
      __int128 v14 = v20[1];
      *((_OWORD *)v13 + 2) = v20[0];
      *((_OWORD *)v13 + 3) = v14;
      __int128 v15 = v20[2];
      __int128 v16 = v20[3];
      __int128 v17 = v20[4];
      v13[14] = v21;
      *((_OWORD *)v13 + 5) = v16;
      *((_OWORD *)v13 + 6) = v17;
      *((_OWORD *)v13 + 4) = v15;
      ++v5;
      --v2;
    }

    while (v2);
  }

  return _swiftEmptyArrayStorage;
}

uint64_t destroy for HelpCommand(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 48));
}

uint64_t initializeWithCopy for HelpCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(_BYTE *)(a2 + 16);
  sub_10006B81C(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  char v9 = *(_BYTE *)(a2 + 40);
  sub_100003B00(v7, v8, v9);
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v9;
  uint64_t v10 = *(void *)(a2 + 48);
  *(void *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain(v10);
  return a1;
}

uint64_t assignWithCopy for HelpCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  char v6 = *(_BYTE *)(a2 + 16);
  sub_10006B81C(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  char v9 = *(_BYTE *)(a1 + 16);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_10004CB6C(v7, v8, v9);
  uint64_t v10 = *(void *)(a2 + 24);
  uint64_t v11 = *(void *)(a2 + 32);
  char v12 = *(_BYTE *)(a2 + 40);
  sub_100003B00(v10, v11, v12);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = *(_BYTE *)(a1 + 40);
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = v11;
  *(_BYTE *)(a1 + 40) = v12;
  sub_100003C60(v13, v14, v15);
  uint64_t v16 = *(void *)(a2 + 48);
  uint64_t v17 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t assignWithTake for HelpCommand(uint64_t a1, uint64_t a2)
{
  char v4 = *(_BYTE *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  char v7 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_10004CB6C(v5, v6, v7);
  char v8 = *(_BYTE *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(a1 + 32);
  char v11 = *(_BYTE *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = v8;
  sub_100003C60(v9, v10, v11);
  uint64_t v12 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRelease(v12);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpCommand(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 57)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 48);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HelpCommand(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(void *)double result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 57) = 1;
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
      *(void *)(result + 48) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 57) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HelpCommand()
{
  return &type metadata for HelpCommand;
}

uint64_t sub_100078CA4(uint64_t a1)
{
  uint64_t v42 = *(void *)(a1 + 16);
  if (!v42) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v41 = a1 + 32;
  unint64_t v1 = (_OWORD *)swift_bridgeObjectRetain(a1);
  uint64_t v2 = 0LL;
  __int128 v3 = v1[11];
  __int128 v53 = v1[10];
  __int128 v54 = v3;
  __int128 v4 = v1[13];
  __int128 v55 = v1[12];
  __int128 v56 = v4;
  __int128 v5 = v1[7];
  __int128 v49 = v1[6];
  __int128 v50 = v5;
  __int128 v6 = v1[9];
  __int128 v51 = v1[8];
  __int128 v52 = v6;
  __int128 v7 = v1[3];
  __int128 v45 = v1[2];
  __int128 v46 = v7;
  __int128 v8 = v1[4];
  __int128 v9 = v1[5];
  uint64_t v40 = v1;
  uint64_t v10 = 1LL;
  char v11 = _swiftEmptyArrayStorage;
  while (1)
  {
    __int128 v47 = v8;
    __int128 v48 = v9;
    uint64_t v12 = v10;
    unint64_t v13 = v45;
    uint64_t v14 = (unint64_t)v45 >= 2 ? (void *)v45 : _swiftEmptyArrayStorage;
    int64_t v15 = v14[2];
    if (v15)
    {
      uint64_t v44 = v10;
      char v57 = v11;
      sub_10002D724((uint64_t)&v45);
      sub_10002D810(v13);
      sub_10004FF38(0LL, v15, 0);
      uint64_t v43 = v14;
      uint64_t v16 = (unsigned __int8 *)(v14 + 6);
      do
      {
        uint64_t v17 = *((void *)v16 - 2);
        uint64_t v18 = *((void *)v16 - 1);
        if ((*v16 & 0xC0) == 0x40) {
          unsigned __int8 v19 = 64;
        }
        else {
          unsigned __int8 v19 = *v16;
        }
        sub_100030508(*((void *)v16 - 2), *((void *)v16 - 1), *v16);
        unint64_t v21 = _swiftEmptyArrayStorage[2];
        unint64_t v20 = _swiftEmptyArrayStorage[3];
        if (v21 >= v20 >> 1) {
          sub_10004FF38((void *)(v20 > 1), v21 + 1, 1);
        }
        v16 += 24;
        _swiftEmptyArrayStorage[2] = v21 + 1;
        uint64_t v22 = &_swiftEmptyArrayStorage[4 * v21];
        v22[4] = v17;
        v22[5] = v18;
        *((_BYTE *)v22 + 48) = v19;
        v22[7] = v2;
        --v15;
      }

      while (v15);
      swift_bridgeObjectRelease(v43);
      uint64_t result = sub_10002D8A4((uint64_t)&v45);
      char v11 = v57;
      uint64_t v12 = v44;
    }

    else
    {
      sub_10002D810(v45);
      uint64_t result = swift_bridgeObjectRelease(v14);
    }

    uint64_t v24 = _swiftEmptyArrayStorage[2];
    int64_t v25 = v11[2];
    int64_t v26 = v25 + v24;
    if (__OFADD__(v25, v24)) {
      break;
    }
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v11);
    if ((result & 1) != 0 && v26 <= v11[3] >> 1)
    {
      if (_swiftEmptyArrayStorage[2]) {
        goto LABEL_20;
      }
    }

    else
    {
      if (v25 <= v26) {
        int64_t v33 = v25 + v24;
      }
      else {
        int64_t v33 = v25;
      }
      uint64_t result = (uint64_t)sub_100057CCC((void *)result, v33, 1, v11);
      char v11 = (void *)result;
      if (_swiftEmptyArrayStorage[2])
      {
LABEL_20:
        uint64_t v27 = v11[2];
        if ((v11[3] >> 1) - v27 < v24) {
          goto LABEL_36;
        }
        uint64_t v28 = (uint64_t)&v11[4 * v27 + 4];
        uint64_t v29 = sub_100005104(&qword_1000B96B0);
        uint64_t result = swift_arrayInitWithCopy(v28, &_swiftEmptyArrayStorage[4], v24, v29);
        if (v24)
        {
          uint64_t v30 = v11[2];
          BOOL v31 = __OFADD__(v30, v24);
          uint64_t v32 = v30 + v24;
          if (v31) {
            goto LABEL_37;
          }
          v11[2] = v32;
        }

        goto LABEL_29;
      }
    }

    if (v24) {
      goto LABEL_35;
    }
LABEL_29:
    swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
    if (v12 == v42)
    {
      swift_bridgeObjectRelease(v40);
      return (uint64_t)v11;
    }

    uint64_t v34 = (__int128 *)(v41 + 192 * v12);
    __int128 v35 = v34[9];
    __int128 v53 = v34[8];
    __int128 v54 = v35;
    __int128 v36 = v34[11];
    __int128 v55 = v34[10];
    __int128 v56 = v36;
    __int128 v37 = v34[5];
    __int128 v49 = v34[4];
    __int128 v50 = v37;
    __int128 v38 = v34[7];
    __int128 v51 = v34[6];
    __int128 v52 = v38;
    __int128 v39 = v34[1];
    __int128 v45 = *v34;
    __int128 v46 = v39;
    __int128 v8 = v34[2];
    __int128 v9 = v34[3];
    uint64_t v10 = v12 + 1;
    uint64_t v2 = v12;
  }

  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100078F80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  if (*(void *)(a6 + 16))
  {
    *(void *)&__int128 v45 = a6;
    *((void *)&v45 + 1) = sub_10007A76C;
    uint64_t v46 = 0LL;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    sub_100037ACC(a4);
    swift_bridgeObjectRetain(a6);
    sub_100037B40(a7, a8, a9);
    uint64_t v16 = sub_100005104(&qword_1000B9D90);
    unint64_t v17 = sub_10007A928();
    uint64_t v18 = BidirectionalCollection<>.joined(separator:)(8236LL, 0xE200000000000000LL, v16, v17);
    uint64_t v20 = v19;
  }

  else
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    sub_100037ACC(a4);
    swift_bridgeObjectRetain(a6);
    sub_100037B40(a7, a8, a9);
    uint64_t v18 = 0LL;
    uint64_t v20 = 0LL;
  }

  if (a9 == 255) {
    uint64_t v21 = 0LL;
  }
  else {
    uint64_t v21 = a7;
  }
  if (a9 == 255) {
    uint64_t v22 = 0LL;
  }
  else {
    uint64_t v22 = a8;
  }
  uint64_t v40 = v22;
  uint64_t v41 = v21;
  if (a9 == 255) {
    char v23 = 4;
  }
  else {
    char v23 = a9;
  }
  char v39 = v23;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_100037B40(a7, a8, a9);
  sub_10005EC6C((uint64_t)_swiftEmptyArrayStorage, 3LL, (uint64_t)a4, v18, v20, a1, a2, a3, (uint64_t)&v45, 0);
  __int128 v31 = v45;
  uint64_t v24 = v46;
  char v38 = v48;
  __int128 v36 = v50;
  __int128 v37 = v49;
  uint64_t v25 = v51;
  uint64_t v35 = v52;
  char v34 = v53;
  uint64_t v32 = v55;
  uint64_t v33 = v54;
  int64_t v26 = (void *)swift_allocObject(&unk_1000B3C20, 56LL, 7LL);
  void v26[2] = sub_100069EBC;
  v26[3] = 0LL;
  v26[4] = a1;
  v26[5] = a2;
  v26[6] = a3;
  uint64_t v43 = a6;
  uint64_t v27 = (void *)swift_allocObject(&unk_1000B3C48, 56LL, 7LL);
  v27[2] = 0LL;
  sub_10002AACC((uint64_t)&v43, (uint64_t)(v27 + 3), &qword_1000B9DA0);
  v27[4] = a1;
  v27[5] = a2;
  v27[6] = a3;
  char v44 = 1;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_10006C0F8(a7, a8, a9);
  uint64_t v28 = sub_100005104(&qword_1000B9230);
  uint64_t v29 = swift_allocObject(v28, 224LL, 7LL);
  *(_OWORD *)(v29 + 16) = xmmword_100096510;
  *(void *)(v29 + 32) = 0LL;
  *(_OWORD *)(v29 + 40) = v31;
  *(void *)(v29 + 56) = v24;
  *(_OWORD *)(v29 + 64) = v47;
  *(_BYTE *)(v29 + 80) = v38;
  *(_OWORD *)(v29 + 88) = v37;
  *(_OWORD *)(v29 + 104) = v36;
  *(void *)(v29 + 120) = v25;
  *(void *)(v29 + 128) = v35;
  *(_BYTE *)(v29 + 136) = v34;
  *(void *)(v29 + 144) = v33;
  *(void *)(v29 + 152) = v32;
  *(void *)(v29 + 160) = v41;
  *(void *)(v29 + 168) = v40;
  *(_BYTE *)(v29 + 176) = v39;
  *(_BYTE *)(v29 + 177) = a5;
  *(void *)(v29 + 184) = sub_10007A9C0;
  *(void *)(v29 + 192) = v26;
  *(_BYTE *)(v29 + 200) = v44;
  *(void *)(v29 + 208) = sub_10007AA34;
  *(void *)(v29 + 216) = v27;
  return sub_100079288(v29);
}

uint64_t sub_100079288(uint64_t a1)
{
  unint64_t v2 = sub_100079598((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(v2);
  uint64_t v3 = swift_bridgeObjectRetain(a1);
  uint64_t v4 = sub_100078CA4(v3);
  swift_bridgeObjectRelease(a1);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v5)
  {
    sub_100005104(qword_1000B9608);
    __int128 v6 = (void *)static _DictionaryStorage.allocate(capacity:)(v5);
  }

  else
  {
    __int128 v6 = &_swiftEmptyDictionarySingleton;
  }

  __int128 v8 = v6;
  sub_10007AA54(v4, 1, &v8);
  swift_bridgeObjectRelease(v4);
  return a1;
}

void *sub_100079344( uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void (*a6)(void **))
{
  uint64_t v13 = *v6;
  if (*(void *)(v13 + 16))
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    unint64_t v14 = sub_100058C68(a1, a2, a3);
    if ((v15 & 1) != 0)
    {
      sub_10005BD20(*(void *)(v13 + 56) + 72 * v14, (uint64_t)&v22);
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(a2);
      if (*((void *)&v22 + 1))
      {
        v28[1] = v24;
        __int128 v29 = v25;
        char v30 = v26;
        __int128 v27 = v22;
        v28[0] = v23;
        goto LABEL_8;
      }
    }

    else
    {
      char v26 = 0;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(a2);
    }
  }

  else
  {
    char v26 = 0;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
  }

  uint64_t v16 = sub_100005104(&qword_1000B90C8);
  *(void *)&__int128 v27 = a1;
  *((void *)&v27 + 1) = a2;
  *(void *)&v28[0] = a3;
  *((void *)&v28[0] + 1) = a5;
  *(void *)&__int128 v29 = v16;
  *((void *)&v29 + 1) = &_swiftEmptySetSingleton;
  char v30 = 1;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a5);
  sub_10004E740((uint64_t)&v22, &qword_1000B9888);
LABEL_8:
  sub_10005BCDC((uint64_t)v28 + 8, (uint64_t)&v22, &qword_1000B9360);
  if (*((void *)&v23 + 1))
  {
    uint64_t v17 = sub_100005104(&qword_1000B90C8);
    if ((swift_dynamicCast(&v21, &v22, (char *)&type metadata for Any + 8, v17, 6LL) & 1) != 0)
    {
      a5 = v21;
      goto LABEL_13;
    }
  }

  else
  {
    sub_10004E740((uint64_t)&v22, &qword_1000B9360);
  }

  uint64_t v21 = a5;
  swift_bridgeObjectRetain(a5);
LABEL_13:
  if (v30 == 1)
  {
    swift_bridgeObjectRelease(a5);
    uint64_t v21 = _swiftEmptyArrayStorage;
    char v30 = 0;
  }

  a6(&v21);
  uint64_t v18 = v21;
  *((void *)&v23 + 1) = sub_100005104(&qword_1000B90C8);
  *(void *)&__int128 v22 = v18;
  sub_1000671BC((uint64_t)&v22, (uint64_t)v28 + 8);
  uint64_t v19 = swift_bridgeObjectRetain(a4);
  sub_10005750C(v19);
  sub_10007029C((uint64_t *)&v27);
  return sub_10003D920(&v27);
}

unint64_t sub_100079598(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005104(qword_1000B9608);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(v1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(v1);
    return (unint64_t)v4;
  }

  swift_retain(v3);
  uint64_t v17 = v1;
  __int128 v6 = (void *)(v1 + 56);
  while (1)
  {
    uint64_t v7 = *(v6 - 3);
    uint64_t v8 = *(v6 - 2);
    int v9 = *((unsigned __int8 *)v6 - 8);
    uint64_t v10 = *v6;
    sub_100030508(v7, v8, *((_BYTE *)v6 - 8));
    unint64_t result = sub_100058B9C(v7, v8, v9);
    if ((v12 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v13 = v4[6] + 24 * result;
    *(void *)uint64_t v13 = v7;
    *(void *)(v13 + 8) = v8;
    *(_BYTE *)(v13 + 16) = v9;
    *(void *)(v4[7] + 8 * result) = v10;
    uint64_t v14 = v4[2];
    BOOL v15 = __OFADD__(v14, 1LL);
    uint64_t v16 = v14 + 1;
    if (v15) {
      goto LABEL_11;
    }
    v6 += 4;
    void v4[2] = v16;
    if (!--v5)
    {
      swift_release(v4);
      uint64_t v1 = v17;
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000796D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v20 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v20);
    return (unint64_t)v4;
  }

  sub_100005104(&qword_1000B9D28);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v6 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10005BCDC(v6, (uint64_t)&v21, &qword_1000B9DD0);
    uint64_t v7 = v21;
    uint64_t v8 = v22;
    int v9 = v23;
    unint64_t result = sub_100058C68(v21, v22, v23);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    char v12 = (uint64_t *)(v4[6] + 24 * result);
    *char v12 = v7;
    v12[1] = v8;
    v12[2] = (uint64_t)v9;
    uint64_t v13 = v4[7] + 72 * result;
    *(_OWORD *)uint64_t v13 = v24;
    __int128 v14 = v25;
    __int128 v15 = v26;
    __int128 v16 = v27;
    *(_BYTE *)(v13 + 64) = v28;
    *(_OWORD *)(v13 + 32) = v15;
    *(_OWORD *)(v13 + 48) = v16;
    *(_OWORD *)(v13 + 16) = v14;
    uint64_t v17 = v4[2];
    BOOL v18 = __OFADD__(v17, 1LL);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_12;
    }
    void v4[2] = v19;
    v6 += 96LL;
    if (!--v5)
    {
      swift_release(v4);
      uint64_t v20 = a1;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_100079838(uint64_t a1)
{
  uint64_t v2 = sub_100005104(&qword_1000B9DC0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v23 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v23);
    return (unint64_t)v8;
  }

  sub_100005104(&qword_1000B9DC8);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = &v5[*(int *)(v2 + 48)];
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v25 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_10005BCDC(v13, (uint64_t)v5, &qword_1000B9DC0);
    unint64_t result = sub_100058CE0((uint64_t)v5);
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for CodingUserInfoKey(0LL);
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))( v18 + *(void *)(*(void *)(v19 - 8) + 72LL) * v17,  v5,  v19);
    unint64_t result = (unint64_t)sub_10005BD5C(v10, (_OWORD *)(v8[7] + 32 * v17));
    uint64_t v20 = v8[2];
    BOOL v21 = __OFADD__(v20, 1LL);
    uint64_t v22 = v20 + 1;
    if (v21) {
      goto LABEL_12;
    }
    v8[2] = v22;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v23 = v25;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_1000799D4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005104(&qword_1000B9D38);
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
  uint64_t v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *(v6 - 2);
    uint64_t v8 = *(v6 - 1);
    uint64_t v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    unint64_t result = sub_100023BB8(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    unint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *unint64_t v12 = v7;
    v12[1] = v8;
    *(void *)(v4[7] + 8 * result) = v9;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    void v4[2] = v15;
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

void *sub_100079AEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *(*a8)(void *__return_ptr, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  unint64_t result = a8(v16, a10, a11, a12, a1, a2, a3, a4, a5, a6);
  if (!v12)
  {
    uint64_t v15 = v16[1];
    __chkstk_darwin(result);
    sub_100079344(a10, a11, a12, a1, _swiftEmptyArrayStorage, (void (*)(void **))sub_10007AD10);
    return (void *)swift_bridgeObjectRelease(v15);
  }

  return result;
}

void *sub_100079BE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *(*a8)(uint64_t *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t result = a8(&v20, a10, a11, a12, a1, a2, a3, a4, a5, a6);
  if (!v12)
  {
    uint64_t v15 = v21;
    v19[3] = &type metadata for String;
    v19[0] = v20;
    v19[1] = v21;
    sub_10005BCDC((uint64_t)v19, (uint64_t)v17, &qword_1000B9360);
    v16[0] = a10;
    v16[1] = a11;
    void v16[2] = a12;
    v17[4] = a1;
    char v18 = 1;
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(a11);
    swift_bridgeObjectRetain(a12);
    swift_bridgeObjectRetain(a1);
    sub_10007029C(v16);
    sub_10003D920(v16);
    sub_10004E740((uint64_t)v19, &qword_1000B9360);
    return (void *)swift_bridgeObjectRelease(v15);
  }

  return result;
}

void *sub_100079D00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *(*a8)(void *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  unint64_t result = a8(v19, a10, a11, a12, a1, a2, a3, a4, a5, a6);
  if (!v12)
  {
    _OWORD v18[3] = (char *)&type metadata for Any + 8;
    v18[0] = swift_allocObject(&unk_1000B3C70, 48LL, 7LL);
    sub_10004E704((uint64_t)v19, v18[0] + 16LL);
    sub_10005BCDC((uint64_t)v18, (uint64_t)v16, &qword_1000B9360);
    v15[0] = a10;
    v15[1] = a11;
    v15[2] = a12;
    v16[4] = a1;
    char v17 = 1;
    swift_bridgeObjectRetain(a11);
    swift_bridgeObjectRetain(a12);
    swift_bridgeObjectRetain(a1);
    sub_10007029C(v15);
    sub_10003D920(v15);
    sub_10004E740((uint64_t)v18, &qword_1000B9360);
    return (void *)sub_1000062D8(v19);
  }

  return result;
}

uint64_t sub_100079E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != 1)
  {
    uint64_t v11 = a1;
    swift_bridgeObjectRetain(a1);
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    goto LABEL_6;
  }

  uint64_t v11 = sub_10006D354((uint64_t)&off_1000AFE08);
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  *((void *)&v17 + 1) = sub_100005104(&qword_1000B90C8);
  *(void *)&__int128 v16 = a4;
LABEL_6:
  sub_10005BCDC((uint64_t)&v16, (uint64_t)v14, &qword_1000B9360);
  v13[0] = a5;
  v13[1] = a6;
  v13[2] = a7;
  v14[4] = v11;
  char v15 = 1;
  swift_bridgeObjectRetain(a4);
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRetain(v11);
  sub_10007029C(v13);
  sub_10003D920(v13);
  swift_bridgeObjectRelease(v11);
  return sub_10004E740((uint64_t)&v16, &qword_1000B9360);
}

uint64_t sub_100079F3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 != 1)
  {
    uint64_t v13 = a1;
    swift_bridgeObjectRetain(a1);
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    goto LABEL_6;
  }

  uint64_t v13 = sub_10006D354((uint64_t)&off_1000AFE40);
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  *((void *)&v19 + 1) = &type metadata for String;
  *(void *)&__int128 v18 = a4;
  *((void *)&v18 + 1) = a5;
LABEL_6:
  sub_10005BCDC((uint64_t)&v18, (uint64_t)v16, &qword_1000B9360);
  v15[0] = a6;
  v15[1] = a7;
  v15[2] = a8;
  v16[4] = v13;
  char v17 = 1;
  swift_bridgeObjectRetain(a5);
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRetain(a8);
  swift_bridgeObjectRetain(v13);
  sub_10007029C(v15);
  sub_10003D920(v15);
  swift_bridgeObjectRelease(v13);
  return sub_10004E740((uint64_t)&v18, &qword_1000B9360);
}

uint64_t sub_10007A04C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 == 1)
  {
    uint64_t v11 = sub_10006D354((uint64_t)&off_1000AFE78);
  }

  else
  {
    uint64_t v11 = a1;
    swift_bridgeObjectRetain(a1);
  }

  sub_10005BCDC(a4, (uint64_t)&v13, &qword_1000B9360);
  if (v15[0])
  {
    *((void *)&v18 + 1) = (char *)&type metadata for Any + 8;
    *(void *)&__int128 v17 = swift_allocObject(&unk_1000B3C70, 48LL, 7LL);
    sub_10005BD5C(&v13, (_OWORD *)(v17 + 16));
  }

  else
  {
    sub_10004E740((uint64_t)&v13, &qword_1000B9360);
    __int128 v17 = 0u;
    __int128 v18 = 0u;
  }

  sub_10005BCDC((uint64_t)&v17, (uint64_t)v15, &qword_1000B9360);
  *(void *)&__int128 v13 = a5;
  *((void *)&v13 + 1) = a6;
  uint64_t v14 = a7;
  _OWORD v15[4] = v11;
  char v16 = 1;
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRetain(v11);
  sub_10007029C((uint64_t *)&v13);
  sub_10003D920(&v13);
  swift_bridgeObjectRelease(v11);
  return sub_10004E740((uint64_t)&v17, &qword_1000B9360);
}

char *sub_10007A19C(char **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  swift_bridgeObjectRetain(a3);
  unint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native(v6);
  if ((result & 1) == 0)
  {
    unint64_t result = sub_100057AB8(0LL, *((void *)v6 + 2) + 1LL, 1, v6);
    uint64_t v6 = result;
  }

  unint64_t v9 = *((void *)v6 + 2);
  unint64_t v8 = *((void *)v6 + 3);
  if (v9 >= v8 >> 1)
  {
    unint64_t result = sub_100057AB8((char *)(v8 > 1), v9 + 1, 1, v6);
    uint64_t v6 = result;
  }

  *((void *)v6 + 2) = v9 + 1;
  uint64_t v10 = &v6[16 * v9];
  *((void *)v10 + 4) = a2;
  *((void *)v10 + 5) = a3;
  *a1 = v6;
  return result;
}

double sub_10007A248()
{
  uint64_t v0 = sub_10003F288((uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
  *(void *)&double result = 1886152040LL;
  xmmword_1000BA560 = xmmword_100097E50;
  qword_1000BA570 = 0LL;
  unk_1000BA578 = 0LL;
  *(void *)&xmmword_1000BA580 = 0xD000000000000021LL;
  *((void *)&xmmword_1000BA580 + 1) = 0x800000010009DBB0LL;
  qword_1000BA590 = 0LL;
  unk_1000BA598 = 0LL;
  *(void *)&xmmword_1000BA5A0 = 0LL;
  *((void *)&xmmword_1000BA5A0 + 1) = 0xE000000000000000LL;
  qword_1000BA5B0 = 0LL;
  unk_1000BA5B8 = 0xE000000000000000LL;
  LOBYTE(xmmword_1000BA5C0) = 1;
  *((void *)&xmmword_1000BA5C0 + 1) = _swiftEmptyArrayStorage;
  unk_1000BA5D0 = 0LL;
  qword_1000BA5D8 = 0LL;
  qword_1000BA5E0 = v0;
  return result;
}

uint64_t (*sub_10007A2F4(char a1))(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v2 = sub_10003F288((uint64_t)&off_1000AFAF0);
  swift_bridgeObjectRelease(&_swiftEmptySetSingleton);
  swift_arrayDestroy(&unk_1000AFB10, 3LL, &type metadata for NameSpecification.Element);
  v5[0] = xmmword_100097E30;
  v5[1] = xmmword_100097E30;
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  char v8 = 2;
  uint64_t v3 = swift_allocObject(&unk_1000B3BF8, 81LL, 7LL);
  *(void *)(v3 + 16) = v2;
  *(_BYTE *)(v3 + 24) = a1;
  sub_10002AACC((uint64_t)v5, v3 + 32, &qword_1000B9158);
  return sub_1000398D4;
}

uint64_t sub_10007A3C0()
{
  if (*v0) {
    return 1886152040LL;
  }
  else {
    return 0x616D6D6F63627573LL;
  }
}

uint64_t sub_10007A3FC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10007AD1C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10007A420(uint64_t a1)
{
  unint64_t v2 = sub_10007B018();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10007A448(uint64_t a1)
{
  unint64_t v2 = sub_10007B018();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_10007A470@<Q0>(uint64_t a1@<X8>)
{
  if (qword_1000B90B8 != -1) {
    swift_once(&qword_1000B90B8, sub_10007A248);
  }
  __int128 v12 = xmmword_1000BA5C0;
  __int128 v13 = unk_1000BA5D0;
  uint64_t v14 = qword_1000BA5E0;
  __int128 v8 = xmmword_1000BA580;
  __int128 v9 = *(_OWORD *)&qword_1000BA590;
  __int128 v10 = xmmword_1000BA5A0;
  __int128 v11 = *(_OWORD *)&qword_1000BA5B0;
  __int128 v6 = xmmword_1000BA560;
  __n128 v7 = *(__n128 *)&qword_1000BA570;
  sub_10007A7CC(&v6);
  __int128 v2 = v13;
  *(_OWORD *)(a1 + 96) = v12;
  *(_OWORD *)(a1 + 112) = v2;
  *(void *)(a1 + 128) = v14;
  __int128 v3 = v9;
  *(_OWORD *)(a1 + 32) = v8;
  *(_OWORD *)(a1 + 48) = v3;
  __int128 v4 = v11;
  *(_OWORD *)(a1 + 64) = v10;
  *(_OWORD *)(a1 + 80) = v4;
  __n128 result = v7;
  *(_OWORD *)a1 = v6;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_10007A51C()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(unsigned __int8 *)(v0 + 56);
  unint64_t v3 = sub_10005134C();
  swift_allocError(&type metadata for CommandError, v3, 0LL, 0LL);
  *(void *)uint64_t v4 = v1;
  *(void *)(v4 + 8) = v2;
  *(_OWORD *)(v4 + 16) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 73) = 0u;
  uint64_t v5 = swift_bridgeObjectRetain(v1);
  return swift_willThrow(v5);
}

uint64_t (*sub_10007A58C@<X0>(uint64_t a1@<X8>))(uint64_t a1, unint64_t a2, uint64_t a3)
{
  char v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v2 = swift_allocObject(&unk_1000B3BD0, 97LL, 7LL);
  sub_10002AACC((uint64_t)v5, v2 + 16, &qword_1000B9158);
  *(_BYTE *)(v2 + 65) = 0;
  *(void *)(v2 + 80) = 0LL;
  *(void *)(v2 + 88) = 0LL;
  *(void *)(v2 + 72) = _swiftEmptyArrayStorage;
  *(_BYTE *)(v2 + 96) = -1;
  __n128 result = sub_10007A2F4(0);
  *(void *)a1 = sub_10007A8B4;
  *(void *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = sub_1000398D4;
  *(void *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = 1;
  *(void *)(a1 + 48) = _swiftEmptyArrayStorage;
  *(_BYTE *)(a1 + 56) = 0;
  return result;
}

double sub_10007A644@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    a2[2] = v7[0];
    double result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 41) = *(_OWORD *)((char *)v7 + 9);
  }

  return result;
}

unint64_t sub_10007A68C(uint64_t a1)
{
  unint64_t result = sub_10007A6B0();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10007A6B0()
{
  unint64_t result = qword_1000B9D80;
  if (!qword_1000B9D80)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009AACC, &type metadata for HelpCommand);
    atomic_store(result, (unint64_t *)&qword_1000B9D80);
  }

  return result;
}

unint64_t sub_10007A6F4(uint64_t a1)
{
  unint64_t result = sub_10007A718();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10007A718()
{
  unint64_t result = qword_1000B9D88;
  if (!qword_1000B9D88)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009AAF4, &type metadata for HelpCommand);
    atomic_store(result, (unint64_t *)&qword_1000B9D88);
  }

  return result;
}

uint64_t sub_10007A75C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_10007A76C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v8 = 0LL;
  unint64_t v9 = 0xE000000000000000LL;
  v7[0] = v3;
  v7[1] = v4;
  uint64_t result = _print_unlocked<A, B>(_:_:)( v7,  &v8,  &type metadata for String,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  unint64_t v6 = v9;
  *a2 = v8;
  a2[1] = v6;
  return result;
}

void *sub_10007A7CC(void *a1)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[9];
  uint64_t v7 = a1[11];
  uint64_t v8 = a1[13];
  swift_bridgeObjectRetain(a1[16]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  return a1;
}

uint64_t sub_10007A860()
{
  uint64_t v1 = *(void *)(v0 + 24);
  if (v1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(*(void *)(v0 + 40));
    swift_bridgeObjectRelease(*(void *)(v0 + 56));
  }

  swift_bridgeObjectRelease(*(void *)(v0 + 72));
  int v2 = *(unsigned __int8 *)(v0 + 96);
  if (v2 != 255) {
    sub_10002D9A0(*(void *)(v0 + 80), *(void *)(v0 + 88), v2);
  }
  return swift_deallocObject(v0, 97LL, 7LL);
}

uint64_t sub_10007A8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100078F80( a1,  a2,  a3,  (uint64_t *)(v3 + 16),  *(_BYTE *)(v3 + 65),  *(void *)(v3 + 72),  *(void *)(v3 + 80),  *(void *)(v3 + 88),  *(_BYTE *)(v3 + 96));
}

uint64_t sub_10007A8E8()
{
  uint64_t v1 = v0[5];
  if (v1)
  {
    swift_bridgeObjectRelease(v1);
    swift_bridgeObjectRelease(v0[7]);
    swift_bridgeObjectRelease(v0[9]);
  }

  return swift_deallocObject(v0, 81LL, 7LL);
}

unint64_t sub_10007A928()
{
  unint64_t result = qword_1000B9D98;
  if (!qword_1000B9D98)
  {
    uint64_t v1 = sub_10000593C(&qword_1000B9D90);
    sub_10005EC18();
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> LazyMapSequence<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000B9D98);
  }

  return result;
}

uint64_t sub_10007A98C()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

void *sub_10007A9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_100079AEC( a1,  a2,  a3,  a4,  a5,  a6,  a7,  *(void *(**)(void *__return_ptr, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16),  *(void *)(v7 + 24),  *(void *)(v7 + 32),  *(void *)(v7 + 40),  *(void **)(v7 + 48));
}

uint64_t sub_10007A9F0()
{
  unint64_t v1 = v0[2];
  if (v1 >= 2) {
    swift_bridgeObjectRelease(v1);
  }
  swift_bridgeObjectRelease(v0[3]);
  swift_bridgeObjectRelease(v0[5]);
  swift_bridgeObjectRelease(v0[6]);
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_10007AA34(uint64_t a1, uint64_t a2)
{
  return sub_100079E2C(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_10007AA54(uint64_t result, char a2, void *a3)
{
  if (*(void *)(result + 16))
  {
    uint64_t v5 = result;
    uint64_t v43 = *(void *)(result + 16);
    uint64_t v7 = *(void *)(result + 32);
    uint64_t v6 = *(void *)(result + 40);
    int v8 = *(unsigned __int8 *)(result + 48);
    uint64_t v42 = *(void *)(result + 56);
    unint64_t v9 = (void *)*a3;
    sub_100030508(v7, v6, v8);
    unint64_t v11 = sub_100058B9C(v7, v6, v8);
    uint64_t v12 = v9[2];
    BOOL v13 = (v10 & 1) == 0;
    unint64_t result = v12 + v13;
    if (__OFADD__(v12, v13))
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }

    char v14 = v10;
    if (v9[3] < result)
    {
      sub_100070B58(result, a2 & 1);
      unint64_t result = sub_100058B9C(v7, v6, v8);
      if ((v14 & 1) != (v15 & 1))
      {
LABEL_26:
        unint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Name);
        __break(1u);
        return result;
      }

      unint64_t v11 = result;
      char v16 = (void *)*a3;
      if ((v14 & 1) == 0) {
        goto LABEL_11;
      }
LABEL_9:
      uint64_t v17 = 8 * v11;
      uint64_t v18 = *(void *)(v16[7] + 8 * v11);
      unint64_t result = sub_10002DA24(v7, v6, v8);
      *(void *)(v16[7] + v17) = v18;
LABEL_13:
      uint64_t v23 = v43 - 1;
      if (v43 == 1) {
        return result;
      }
      for (uint64_t i = (void *)(v5 + 88); ; i += 4)
      {
        uint64_t v28 = *(i - 3);
        uint64_t v27 = *(i - 2);
        int v29 = *((unsigned __int8 *)i - 8);
        uint64_t v30 = *i;
        __int128 v31 = (void *)*a3;
        sub_100030508(v28, v27, *((_BYTE *)i - 8));
        unint64_t result = sub_100058B9C(v28, v27, v29);
        uint64_t v33 = v31[2];
        BOOL v34 = (v32 & 1) == 0;
        BOOL v21 = __OFADD__(v33, v34);
        uint64_t v35 = v33 + v34;
        if (v21) {
          break;
        }
        char v36 = v32;
        if (v31[3] < v35)
        {
          sub_100070B58(v35, 1LL);
          unint64_t result = sub_100058B9C(v28, v27, v29);
          if ((v36 & 1) != (v37 & 1)) {
            goto LABEL_26;
          }
        }

        char v38 = (void *)*a3;
        if ((v36 & 1) != 0)
        {
          uint64_t v25 = 8 * result;
          uint64_t v26 = *(void *)(v38[7] + 8 * result);
          unint64_t result = sub_10002DA24(v28, v27, v29);
          *(void *)(v38[7] + v25) = v26;
        }

        else
        {
          v38[((unint64_t)result >> 6) + 8] |= 1LL << result;
          uint64_t v39 = v38[6] + 24 * result;
          *(void *)uint64_t v39 = v28;
          *(void *)(v39 + 8) = v27;
          *(_BYTE *)(v39 + 16) = v29;
          *(void *)(v38[7] + 8 * result) = v30;
          uint64_t v40 = v38[2];
          BOOL v21 = __OFADD__(v40, 1LL);
          uint64_t v41 = v40 + 1;
          if (v21) {
            goto LABEL_25;
          }
          void v38[2] = v41;
        }

        if (!--v23) {
          return result;
        }
      }

      goto LABEL_24;
    }

    if ((a2 & 1) != 0)
    {
      char v16 = (void *)*a3;
      if ((v10 & 1) != 0) {
        goto LABEL_9;
      }
    }

    else
    {
      unint64_t result = (uint64_t)sub_10007044C();
      char v16 = (void *)*a3;
      if ((v14 & 1) != 0) {
        goto LABEL_9;
      }
    }

char *sub_10007AD10(char **a1)
{
  return sub_10007A19C(a1, **(void **)(v1 + 16), *(void *)(*(void *)(v1 + 16) + 8LL));
}

uint64_t sub_10007AD1C(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x616D6D6F63627573LL && a2 == 0xEB0000000073646ELL)
  {
    unint64_t v5 = 0xEB0000000073646ELL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x616D6D6F63627573LL, 0xEB0000000073646ELL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 1886152040 && a2 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease(0xE400000000000000LL);
    return 1LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(1886152040LL, 0xE400000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_10007AE14@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v4 = sub_100005104(&qword_1000B9DA8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_10007A2F4(0);
  uint64_t v9 = v8;
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  sub_100006270(a1, v10);
  unint64_t v12 = sub_10007B018();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for HelpCommand.CodingKeys,  &type metadata for HelpCommand.CodingKeys,  v12,  v10,  v11);
  if (v2)
  {
    sub_100003C60((uint64_t)sub_1000398D4, v9, 1);
    return sub_1000062D8(a1);
  }

  else
  {
    uint64_t v13 = v5;
    uint64_t v14 = v9;
    uint64_t v15 = v20;
    uint64_t v16 = sub_100005104(&qword_1000B90C8);
    char v22 = 0;
    unint64_t v17 = sub_10007B05C();
    KeyedDecodingContainer.decode<A>(_:forKey:)(&v23, v16, &v22, v4, v16, v17);
    uint64_t v18 = v23;
    char v21 = 1;
    LOBYTE(v16) = KeyedDecodingContainer.decode(_:forKey:)(&v21, v4);
    sub_100003C60((uint64_t)sub_1000398D4, v14, 1);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v7, v4);
    uint64_t result = sub_1000062D8(a1);
    *(void *)uint64_t v15 = v18;
    *(void *)(v15 + 8) = 0LL;
    *(_BYTE *)(v15 + 16) = 0;
    *(void *)(v15 + 24) = v16 & 1;
    *(void *)(v15 + 32) = 0LL;
    *(_BYTE *)(v15 + 40) = 0;
    *(void *)(v15 + 48) = _swiftEmptyArrayStorage;
    *(_BYTE *)(v15 + 56) = 0;
  }

  return result;
}

unint64_t sub_10007B018()
{
  unint64_t result = qword_1000B9DB0;
  if (!qword_1000B9DB0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009ABF0, &type metadata for HelpCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9DB0);
  }

  return result;
}

unint64_t sub_10007B05C()
{
  unint64_t result = qword_1000B9DB8;
  if (!qword_1000B9DB8)
  {
    uint64_t v1 = sub_10000593C(&qword_1000B90C8);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <A> [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000B9DB8);
  }

  return result;
}

uint64_t sub_10007B0B8@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  int64_t v7 = *(void *)(a1 + 16);
  if (v7)
  {
    uint64_t v16 = v6;
    char v17 = a2;
    swift_bridgeObjectRetain(a1);
    sub_10004FDF4(0LL, v7, 0);
    uint64_t v8 = a1 + 40;
    do
    {
      uint64_t v9 = (*(uint64_t (**)(void))(*(void *)v8 + 24LL))();
      uint64_t v11 = v10;
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        sub_10004FDF4((char *)(v12 > 1), v13 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v13 + 1;
      uint64_t v14 = &_swiftEmptyArrayStorage[2 * v13];
      v14[4] = v9;
      void v14[5] = v11;
      v8 += 16LL;
      --v7;
    }

    while (v7);
    swift_bridgeObjectRelease(a1);
    uint64_t result = sub_100003C60((uint64_t)sub_1000398D4, v16, 1);
    a2 = v17;
  }

  else
  {
    uint64_t result = sub_100003C60((uint64_t)sub_1000398D4, v6, 1);
  }

  *(void *)a3 = _swiftEmptyArrayStorage;
  *(void *)(a3 + 8) = 0LL;
  *(_BYTE *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0LL;
  *(void *)(a3 + 32) = 0LL;
  *(_BYTE *)(a3 + 40) = 0;
  *(void *)(a3 + 48) = a1;
  *(_BYTE *)(a3 + 56) = a2;
  return result;
}

unint64_t sub_10007B208(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_100005104(&qword_1000B9D30);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v1);
  __int128 v14 = *(_OWORD *)(a1 + 32);
  unint64_t result = sub_100058D30(*(void *)(a1 + 32));
  if ((v5 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain(result);
    swift_retain(v1);
    return (unint64_t)v3;
  }

  uint64_t v6 = (__int128 *)(a1 + 48);
  uint64_t v7 = v1 - 1;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v8 = v14;
    *(void *)(v3[6] + 8 * result) = v14;
    *(void *)(v3[7] + 8 * result) = *((void *)&v14 + 1);
    uint64_t v9 = v3[2];
    BOOL v10 = __OFADD__(v9, 1LL);
    uint64_t v11 = v9 + 1;
    if (v10) {
      break;
    }
    uint64_t v1 = *((void *)&v14 + 1);
    unint64_t result = v14;
    v3[2] = v11;
    if (!v7) {
      goto LABEL_8;
    }
    __int128 v12 = *v6++;
    __int128 v14 = v12;
    swift_retain(v8);
    swift_retain(v1);
    unint64_t result = sub_100058D30(v12);
    --v7;
    if ((v13 & 1) != 0) {
      goto LABEL_7;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_10007B320()
{
  return swift_deallocObject(v0, 48LL, 7LL);
}

uint64_t storeEnumTagSinglePayload for HelpCommand.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10007B390 + 4 * byte_10009AAA9[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10007B3C4 + 4 * byte_10009AAA4[v4]))();
}

uint64_t sub_10007B3C4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10007B3CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10007B3D4LL);
  }
  return result;
}

uint64_t sub_10007B3E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10007B3E8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10007B3EC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10007B3F4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HelpCommand.CodingKeys()
{
  return &type metadata for HelpCommand.CodingKeys;
}

unint64_t sub_10007B414()
{
  unint64_t result = qword_1000B9DD8;
  if (!qword_1000B9DD8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009ABC8, &type metadata for HelpCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9DD8);
  }

  return result;
}

unint64_t sub_10007B45C()
{
  unint64_t result = qword_1000B9DE0;
  if (!qword_1000B9DE0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009AB38, &type metadata for HelpCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9DE0);
  }

  return result;
}

unint64_t sub_10007B4A4()
{
  unint64_t result = qword_1000B9DE8;
  if (!qword_1000B9DE8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009AB60, &type metadata for HelpCommand.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000B9DE8);
  }

  return result;
}

uint64_t sub_10007B4E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000LL) == 0) {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0LL;
  }
  uint64_t v5 = 7LL;
  if (((a2 >> 60) & ((a1 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v5 = 11LL;
  }
  uint64_t v6 = String.index(before:)(v5 | (v2 << 16), a1, a2);
  return String.subscript.getter(v6, a1, a2);
}

void *sub_10007B560(uint64_t a1, uint64_t *a2)
{
  int64_t v2 = *(void *)(a1 + 16);
  int v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    sub_10004FF00(0LL, v2, 0);
    uint64_t v5 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v7 = *(v5 - 1);
      uint64_t v6 = *v5;
      uint64_t v8 = *a2;
      uint64_t v9 = *(void *)(*a2 + 16);
      swift_bridgeObjectRetain(*v5);
      if (v9)
      {
        swift_bridgeObjectRetain_n(v6, 2LL);
        unint64_t v10 = sub_100023BB8(v7, v6);
        if ((v11 & 1) != 0)
        {
          int v3 = *(void **)(*(void *)(v8 + 56) + 8 * v10);
          swift_bridgeObjectRetain(v3);
        }

        swift_bridgeObjectRelease_n(v6, 2LL);
      }

      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        sub_10004FF00((char *)(v12 > 1), v13 + 1, 1);
      }
      v5 += 2;
      _swiftEmptyArrayStorage[2] = v13 + 1;
      __int128 v14 = &_swiftEmptyArrayStorage[6 * v13];
      v14[4] = v7;
      void v14[5] = v6;
      v14[6] = v3;
      v14[7] = 0LL;
      v14[8] = 0xE000000000000000LL;
      *((_BYTE *)v14 + 72) = 0;
      --v2;
      int v3 = _swiftEmptyArrayStorage;
    }

    while (v2);
  }

  return _swiftEmptyArrayStorage;
}

uint64_t sub_10007B6A8(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    uint64_t v90 = 0LL;
    uint64_t v4 = TIOCGWINSZ.getter();
    int v5 = ioctl(_:_:_:)(1LL, v4, &v90);
    if (WORD1(v90)) {
      uint64_t v6 = WORD1(v90);
    }
    else {
      uint64_t v6 = 80LL;
    }
    if (v5) {
      a1 = 80LL;
    }
    else {
      a1 = v6;
    }
  }

  uint64_t v86 = v2;
  uint64_t v7 = v2[5];
  uint64_t v89 = v7;
  int64_t v8 = *(void *)(v7 + 16);
  uint64_t v9 = _swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t v90 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v7);
    sub_10004FDF4(0LL, v8, 0);
    uint64_t v9 = (void *)v90;
    unint64_t v10 = (uint64_t *)(v7 + 64);
    do
    {
      uint64_t v11 = *(v10 - 4);
      unint64_t v12 = *(v10 - 3);
      uint64_t v13 = *(v10 - 2);
      uint64_t v14 = *v10;
      sub_100080D20(v11, v12);
      swift_bridgeObjectRetain(v13);
      swift_bridgeObjectRetain(v14);
      uint64_t v15 = sub_100080A88(a1, v11, v12, v13);
      uint64_t v17 = v16;
      sub_100080D34(v11, v12);
      swift_bridgeObjectRelease(v14);
      swift_bridgeObjectRelease(v13);
      uint64_t v90 = (uint64_t)v9;
      unint64_t v19 = v9[2];
      unint64_t v18 = v9[3];
      if (v19 >= v18 >> 1)
      {
        sub_10004FDF4((char *)(v18 > 1), v19 + 1, 1);
        uint64_t v9 = (void *)v90;
      }

      v9[2] = v19 + 1;
      uint64_t v20 = &v9[2 * v19];
      v20[4] = v15;
      _OWORD v20[5] = v17;
      v10 += 6;
      --v8;
    }

    while (v8);
    sub_10002ABC8(&v89);
  }

  uint64_t v21 = v9[2];
  char v22 = _swiftEmptyArrayStorage;
  if (v21)
  {
    uint64_t v23 = v9 + 5;
    do
    {
      uint64_t v27 = *(v23 - 1);
      uint64_t v28 = *v23;
      uint64_t v29 = HIBYTE(*v23) & 0xFLL;
      if ((*v23 & 0x2000000000000000LL) == 0) {
        uint64_t v29 = v27 & 0xFFFFFFFFFFFFLL;
      }
      if (v29)
      {
        swift_bridgeObjectRetain(*v23);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v22);
        uint64_t v90 = (uint64_t)v22;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_10004FDF4(0LL, v22[2] + 1LL, 1);
          char v22 = (void *)v90;
        }

        unint64_t v25 = v22[2];
        unint64_t v24 = v22[3];
        if (v25 >= v24 >> 1)
        {
          sub_10004FDF4((char *)(v24 > 1), v25 + 1, 1);
          char v22 = (void *)v90;
        }

        v22[2] = v25 + 1;
        uint64_t v26 = &v22[2 * v25];
        v26[4] = v27;
        v26[5] = v28;
      }

      v23 += 2;
      --v21;
    }

    while (v21);
  }

  swift_bridgeObjectRelease(v9);
  uint64_t v90 = (uint64_t)v22;
  uint64_t v31 = sub_100005104(&qword_1000B90C8);
  uint64_t v32 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v33 = BidirectionalCollection<>.joined(separator:)(10LL, 0xE100000000000000LL, v31, v32);
  uint64_t v35 = v34;
  uint64_t result = swift_release(v22);
  char v37 = v86;
  uint64_t v38 = v86[1];
  unint64_t v39 = v86[2];
  uint64_t v40 = HIBYTE(v39) & 0xF;
  if ((v39 & 0x2000000000000000LL) == 0) {
    uint64_t v40 = v38 & 0xFFFFFFFFFFFFLL;
  }
  if (v40)
  {
    uint64_t v90 = 0x574549565245564FLL;
    unint64_t v91 = 0xEA0000000000203ALL;
    swift_bridgeObjectRetain(v39);
    v41._uint64_t countAndFlagsBits = v38;
    v41._object = (void *)v39;
    String.append(_:)(v41);
    swift_bridgeObjectRelease(v39);
    unint64_t v42 = v91;
    uint64_t v43 = sub_10007BD34(a1, 0LL, v90, v91);
    unint64_t v45 = v44;
    swift_bridgeObjectRelease(v42);
    uint64_t v90 = v43;
    unint64_t v91 = v45;
    swift_bridgeObjectRetain(v45);
    v46._uint64_t countAndFlagsBits = 2570LL;
    v46._object = (void *)0xE200000000000000LL;
    String.append(_:)(v46);
    uint64_t result = swift_bridgeObjectRelease(v45);
    uint64_t v47 = v90;
  }

  else
  {
    uint64_t v47 = 0LL;
  }

  uint64_t v48 = v86[5];
  uint64_t v49 = *(void *)(v48 + 16);
  if (!v49) {
    goto LABEL_42;
  }
  uint64_t v50 = v48 + 48;
  while (*(void *)(v50 - 8) != 1LL)
  {
    v50 += 48LL;
    if (!--v49) {
      goto LABEL_42;
    }
  }

  if (*(void *)(*(void *)v50 + 16LL))
  {
    uint64_t v82 = v31;
    uint64_t v83 = v47;
    uint64_t v84 = v33;
    uint64_t v85 = v35;
    uint64_t v51 = *v86;
    uint64_t v88 = v51;
    int64_t v52 = *(void *)(v51 + 16);
    if (!v52)
    {
      __break(1u);
      return result;
    }

    uint64_t v90 = (uint64_t)_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain(v51);
    sub_10004FDF4(0LL, v52, 0);
    uint64_t v53 = v90;
    uint64_t v54 = v51 + 40;
    do
    {
      uint64_t v55 = (*(uint64_t (**)(void))(*(void *)v54 + 24LL))();
      uint64_t v57 = v56;
      uint64_t v90 = v53;
      unint64_t v59 = *(void *)(v53 + 16);
      unint64_t v58 = *(void *)(v53 + 24);
      if (v59 >= v58 >> 1)
      {
        sub_10004FDF4((char *)(v58 > 1), v59 + 1, 1);
        uint64_t v53 = v90;
      }

      *(void *)(v53 + 16) = v59 + 1;
      uint64_t v60 = v53 + 16 * v59;
      *(void *)(v60 + 32) = v55;
      *(void *)(v60 + 40) = v57;
      v54 += 16LL;
      --v52;
    }

    while (v52);
    sub_10002ABC8(&v88);
    uint64_t v87 = v53;
    (*(void (**)(uint64_t *__return_ptr))(*(void *)(v51 + 40) + 16LL))(&v90);
    sub_10002AACC((uint64_t)&v92, (uint64_t)v93, &qword_1000B9110);
    sub_10002E7A0((uint64_t)v93);
    sub_10002CC24(&v90);
    sub_10002AACC((uint64_t)v93, (uint64_t)&v94, &qword_1000B9110);
    if (v95) {
      sub_10007826C(0LL, 0LL, v94, v95);
    }
    uint64_t v35 = v85;
    char v37 = v86;
    uint64_t v47 = v83;
    uint64_t v33 = v84;
    if (!*(void *)(v53 + 16)) {
      __break(1u);
    }
    sub_10007826C(1uLL, 1LL, 1886152040LL, 0xE400000000000000LL);
    _StringGuts.grow(_:)(43LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v77 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v82, v32);
    unint64_t v79 = v78;
    swift_bridgeObjectRelease(v87);
    v80._uint64_t countAndFlagsBits = v77;
    v80._object = v79;
    String.append(_:)(v80);
    swift_bridgeObjectRelease(v79);
    v81._object = (void *)0x800000010009DBE0LL;
    v81._uint64_t countAndFlagsBits = 0xD000000000000021LL;
    String.append(_:)(v81);
    uint64_t v61 = 0x272065655320200ALL;
    __int128 v62 = (void *)0xE800000000000000LL;
  }

  else
  {
LABEL_42:
    uint64_t v61 = 0LL;
    __int128 v62 = (void *)0xE000000000000000LL;
  }

  uint64_t v64 = v37[3];
  unint64_t v63 = v37[4];
  uint64_t v65 = HIBYTE(v63) & 0xF;
  if ((v63 & 0x2000000000000000LL) == 0) {
    uint64_t v65 = v64 & 0xFFFFFFFFFFFFLL;
  }
  if (v65)
  {
    swift_bridgeObjectRetain(v63);
    sub_10007D540(7LL, v64, v63);
    uint64_t v67 = v66;
    __int128 v69 = v68;
    swift_bridgeObjectRelease(v63);
    v70._uint64_t countAndFlagsBits = v67;
    v70._object = v69;
    String.append(_:)(v70);
    swift_bridgeObjectRelease(v69);
    v71._uint64_t countAndFlagsBits = 2570LL;
    v71._object = (void *)0xE200000000000000LL;
    String.append(_:)(v71);
    uint64_t v72 = 0x203A4547415355LL;
    unint64_t v73 = 0xE700000000000000LL;
  }

  else
  {
    uint64_t v72 = 0LL;
    unint64_t v73 = 0xE000000000000000LL;
  }

  unint64_t v74 = v73;
  String.append(_:)(*(Swift::String *)&v72);
  swift_bridgeObjectRelease(v73);
  v75._uint64_t countAndFlagsBits = v33;
  v75._object = v35;
  String.append(_:)(v75);
  swift_bridgeObjectRelease(v35);
  v76._uint64_t countAndFlagsBits = v61;
  v76._object = v62;
  String.append(_:)(v76);
  swift_bridgeObjectRelease(v62);
  return v47;
}

uint64_t sub_10007BD34(uint64_t a1, Swift::Int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(a1, a2)) {
    goto LABEL_142;
  }
  if (v8 < 1) {
    return 0LL;
  }
  unint64_t v9 = 0LL;
  __int128 v194 = (char *)_swiftEmptyArrayStorage;
  uint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    uint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v11 = 7LL;
  if (((a4 >> 60) & ((a3 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v11 = 11LL;
  }
  uint64_t v177 = v11 | (v10 << 16);
  unint64_t v178 = 4 * v10;
  unint64_t v5 = 15LL;
  uint64_t v173 = a1 - a2;
  uint64_t v12 = String.subscript.getter(15LL, v177, a3, a4);
  while (2)
  {
    unint64_t v4 = v12;
    unint64_t v28 = v13;
    unint64_t v7 = v14;
    unint64_t v6 = (unint64_t)v15;
    uint64_t v29 = Substring.index(_:offsetBy:limitedBy:)(v12, v8, v28, v12, v28, v14, v15);
    if ((v30 & 1) != 0) {
      unint64_t v31 = v28;
    }
    else {
      unint64_t v31 = v29;
    }
    if (v31 >> 14 < v4 >> 14)
    {
LABEL_137:
      __break(1u);
      break;
    }

    unint64_t v32 = Substring.subscript.getter(v4);
    unint64_t v34 = v33;
    unint64_t v4 = v35;
    unint64_t v37 = v36;
    swift_bridgeObjectRelease(v6);
    uint64_t v8 = v32 >> 14;
    if (v34 >> 14 == v32 >> 14)
    {
      if (v8 != v178)
      {
LABEL_20:
        swift_bridgeObjectRelease(v37);
        unint64_t v38 = String.subscript.getter(v5, v177, a3, a4);
        unint64_t v4 = v41;
        unint64_t v42 = v39 >> 14;
        unint64_t v43 = v38 >> 14;
        if (v38 >> 14 != v39 >> 14)
        {
          unint64_t v7 = v38;
          unint64_t v44 = v39;
          uint64_t v45 = v40;
          uint64_t v46 = Substring.subscript.getter(v38, v38, v39, v40, v41);
          unint64_t v6 = (unint64_t)v47;
          unint64_t v174 = v7;
          char v53 = _stringCompareWithSmolCheck(_:_:expecting:)(v46, v47, 32LL, 0xE100000000000000LL, 0LL);
          swift_bridgeObjectRelease(v6);
          if ((v53 & 1) != 0)
          {
            swift_bridgeObjectRelease(v4);
            unint64_t v7 = v174;
            goto LABEL_32;
          }

          unint64_t v69 = Substring.index(after:)(v174, v174, v44, v45, v4);
          unint64_t v43 = v69 >> 14;
          if (v69 >> 14 != v42)
          {
            unint64_t v7 = v69;
            uint64_t v70 = Substring.subscript.getter(v69, v174, v44, v45, v4);
            unint64_t v6 = (unint64_t)v71;
            if (v70 == 32 && v71 == (char *)0xE100000000000000LL)
            {
LABEL_23:
              swift_bridgeObjectRelease(v4);
              swift_bridgeObjectRelease(0xE100000000000000LL);
              goto LABEL_32;
            }

            uint64_t v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v70, v71, 32LL, 0xE100000000000000LL, 0LL);
            swift_bridgeObjectRelease(v6);
            if ((v8 & 1) == 0)
            {
              for (unint64_t i = v7; ; unint64_t i = v8)
              {
                unint64_t v107 = Substring.index(after:)(i, v174, v44, v45, v4);
                unint64_t v43 = v107 >> 14;
                if (v107 >> 14 == v42) {
                  goto LABEL_123;
                }
                uint64_t v8 = v107;
                uint64_t v108 = Substring.subscript.getter(v107, v174, v44, v45, v4);
                unint64_t v6 = (unint64_t)v109;
                char v110 = _stringCompareWithSmolCheck(_:_:expecting:)(v108, v109, 32LL, 0xE100000000000000LL, 0LL);
                swift_bridgeObjectRelease(v6);
                if ((v110 & 1) != 0)
                {
                  unint64_t v122 = v4;
                  goto LABEL_119;
                }
              }

              swift_bridgeObjectRelease(v4);
              unint64_t v122 = 0xE100000000000000LL;
LABEL_119:
              swift_bridgeObjectRelease(v122);
              unint64_t v7 = v8;
              goto LABEL_32;
            }

            swift_bridgeObjectRelease(v4);
LABEL_32:
            BOOL v54 = v43 >= v9;
            uint64_t v56 = a3;
            unint64_t v55 = a4;
            if (!v54) {
              goto LABEL_139;
            }
            goto LABEL_34;
          }
        }

LABEL_123:
        unint64_t v131 = v4;
LABEL_125:
        swift_bridgeObjectRelease(v131);
        unint64_t v4 = sub_100014AA0(v5, a3, a4);
        unint64_t v5 = v132;
        unint64_t v6 = (unint64_t)v133;
        unint64_t v7 = v134;
        uint64_t v8 = (uint64_t)v194;
        if ((swift_isUniquelyReferenced_nonNull_native(v194) & 1) == 0) {
          goto LABEL_144;
        }
        goto LABEL_126;
      }

LABEL_124:
      unint64_t v131 = v37;
      goto LABEL_125;
    }

    unint64_t v7 = Substring.index(before:)(v34, v32, v34, v4, v37);
    uint64_t v48 = Substring.subscript.getter(v7, v32, v34, v4, v37);
    BOOL v50 = v48 == 10 && v49 == (char *)0xE100000000000000LL;
    if (v50) {
      goto LABEL_52;
    }
    unint64_t v6 = (unint64_t)v49;
    unint64_t v185 = v32 >> 14;
    uint64_t v8 = v4;
    unint64_t v4 = v9;
    unint64_t v51 = v7;
    char v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v48, v49, 10LL, 0xE100000000000000LL, 0LL);
    swift_bridgeObjectRelease(v6);
    if ((v52 & 1) == 0)
    {
      unint64_t v66 = v51;
      BOOL v50 = v185 == v51 >> 14;
      unint64_t v9 = v4;
      unint64_t v4 = v8;
      if (!v50)
      {
        unint64_t v7 = Substring.index(before:)(v66, v32, v34, v8, v37);
        uint64_t v72 = Substring.subscript.getter(v7, v32, v34, v8, v37);
        unint64_t v6 = (unint64_t)v73;
        if (v72 == 10 && v73 == (char *)0xE100000000000000LL)
        {
LABEL_52:
          swift_bridgeObjectRelease(v37);
          unint64_t v74 = 0xE100000000000000LL;
LABEL_53:
          swift_bridgeObjectRelease(v74);
          goto LABEL_54;
        }

        unint64_t v176 = v7;
        char v105 = _stringCompareWithSmolCheck(_:_:expecting:)(v72, v73, 10LL, 0xE100000000000000LL, 0LL);
        swift_bridgeObjectRelease(v6);
        if ((v105 & 1) != 0)
        {
LABEL_81:
          swift_bridgeObjectRelease(v37);
          unint64_t v7 = v176;
          goto LABEL_54;
        }

        if (v185 != v176 >> 14)
        {
          unint64_t v7 = Substring.index(before:)(v176, v32, v34, v8, v37);
          uint64_t v123 = Substring.subscript.getter(v7, v32, v34, v8, v37);
          unint64_t v6 = (unint64_t)v124;
          unint64_t v176 = v7;
          char v125 = _stringCompareWithSmolCheck(_:_:expecting:)(v123, v124, 10LL, 0xE100000000000000LL, 0LL);
          swift_bridgeObjectRelease(v6);
          if ((v125 & 1) != 0) {
            goto LABEL_81;
          }
          unint64_t v126 = v176;
          if (v185 != v176 >> 14)
          {
            do
            {
              unint64_t v7 = Substring.index(before:)(v126, v32, v34, v4, v37);
              uint64_t v127 = Substring.subscript.getter(v7, v32, v34, v4, v37);
              unint64_t v6 = (unint64_t)v128;
              uint64_t v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v127, v128, 10LL, 0xE100000000000000LL, 0LL);
              swift_bridgeObjectRelease(v6);
              if ((v8 & 1) != 0)
              {
                unint64_t v74 = v37;
                goto LABEL_53;
              }

              unint64_t v126 = v7;
            }

            while (v185 != v7 >> 14);
          }
        }
      }

      uint64_t v8 = v32 >> 14;
      if (v34 >> 14 == v178) {
        goto LABEL_124;
      }
      unint64_t v7 = Substring.index(before:)(v34, v32, v34, v4, v37);
      uint64_t v67 = Substring.subscript.getter(v7, v32, v34, v4, v37);
      unint64_t v6 = (unint64_t)v68;
      unint64_t v103 = v7;
      char v104 = _stringCompareWithSmolCheck(_:_:expecting:)(v67, v68, 32LL, 0xE100000000000000LL, 0LL);
      swift_bridgeObjectRelease(v6);
      if ((v104 & 1) != 0)
      {
LABEL_77:
        swift_bridgeObjectRelease(v37);
        unint64_t v7 = v103;
LABEL_78:
        uint64_t v56 = a3;
        unint64_t v55 = a4;
        if (v9 > v7 >> 14) {
          goto LABEL_143;
        }
LABEL_34:
        unint64_t v57 = v7;
        unint64_t v4 = String.subscript.getter(v5, v7, v56, v55);
        uint64_t v59 = v58;
        uint64_t v61 = v60;
        unint64_t v7 = v62;
        unint64_t v6 = (unint64_t)v194;
        if ((swift_isUniquelyReferenced_nonNull_native(v194) & 1) == 0) {
          unint64_t v6 = (unint64_t)sub_100057EEC(0LL, *((void *)v194 + 2) + 1LL, 1, v194);
        }
        unint64_t v64 = *(void *)(v6 + 16);
        unint64_t v63 = *(void *)(v6 + 24);
        if (v64 >= v63 >> 1) {
          unint64_t v6 = (unint64_t)sub_100057EEC((char *)(v63 > 1), v64 + 1, 1, (char *)v6);
        }
        *(void *)(v6 + 16) = v64 + 1;
        uint64_t v65 = (char *)(v6 + 32 * v64);
        *((void *)v65 + 4) = v4;
        *((void *)v65 + 5) = v59;
        *((void *)v65 + 6) = v61;
        *((void *)v65 + 7) = v7;
        __int128 v194 = (char *)v6;
        unint64_t v27 = v57;
        goto LABEL_12;
      }

      if (v185 == v103 >> 14) {
        goto LABEL_20;
      }
      unint64_t v7 = Substring.index(before:)(v103, v32, v34, v4, v37);
      uint64_t v111 = Substring.subscript.getter(v7, v32, v34, v4, v37);
      unint64_t v6 = (unint64_t)v112;
      if (v111 != 32 || v112 != (char *)0xE100000000000000LL)
      {
        unint64_t v103 = v7;
        char v113 = _stringCompareWithSmolCheck(_:_:expecting:)(v111, v112, 32LL, 0xE100000000000000LL, 0LL);
        swift_bridgeObjectRelease(v6);
        if ((v113 & 1) != 0) {
          goto LABEL_77;
        }
        if (v185 == v103 >> 14) {
          goto LABEL_20;
        }
        unint64_t v7 = Substring.index(before:)(v103, v32, v34, v4, v37);
        uint64_t v114 = Substring.subscript.getter(v7, v32, v34, v4, v37);
        unint64_t v6 = (unint64_t)v115;
        if (v114 != 32 || v115 != (char *)0xE100000000000000LL)
        {
          unint64_t v103 = v7;
          char v116 = _stringCompareWithSmolCheck(_:_:expecting:)(v114, v115, 32LL, 0xE100000000000000LL, 0LL);
          swift_bridgeObjectRelease(v6);
          if ((v116 & 1) != 0) {
            goto LABEL_77;
          }
          if (v185 == v103 >> 14) {
            goto LABEL_20;
          }
          unint64_t v117 = v103;
          while (1)
          {
            unint64_t v7 = Substring.index(before:)(v117, v32, v34, v4, v37);
            uint64_t v118 = Substring.subscript.getter(v7, v32, v34, v4, v37);
            unint64_t v6 = (unint64_t)v119;
            unint64_t v103 = v7;
            char v121 = _stringCompareWithSmolCheck(_:_:expecting:)(v118, v119, 32LL, 0xE100000000000000LL, 0LL);
            swift_bridgeObjectRelease(v6);
            if ((v121 & 1) != 0) {
              goto LABEL_77;
            }
            unint64_t v117 = v103;
            if (v185 == v103 >> 14) {
              goto LABEL_20;
            }
          }
        }
      }

unint64_t sub_10007CBC8( uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v23 = a4 >> 14;
  if (a4 >> 14 == a3 >> 14) {
    return 0LL;
  }
  uint64_t v13 = Substring.subscript.getter(a3, a3, a4, a5, a6);
  uint64_t v15 = v14;
  if (v13 == a1 && v14 == a2)
  {
    unint64_t v6 = a3;
LABEL_6:
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v14, a1, a2, 0LL);
    swift_bridgeObjectRelease(v15);
    if ((v16 & 1) != 0)
    {
      return a3;
    }

    else
    {
      unint64_t v6 = a3;
      while (1)
      {
        unint64_t v18 = Substring.index(after:)(v6, a3, a4, a5, a6);
        if (v18 >> 14 == v23) {
          return 0LL;
        }
        unint64_t v6 = v18;
        uint64_t v19 = Substring.subscript.getter(v18, a3, a4, a5, a6);
        uint64_t v21 = v20;
        if (v19 == a1 && v20 == a2) {
          goto LABEL_6;
        }
        char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v19, v20, a1, a2, 0LL);
        swift_bridgeObjectRelease(v21);
        if ((v17 & 1) != 0) {
          return v6;
        }
      }
    }
  }

  return v6;
}

unint64_t sub_10007CD40(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    uint64_t v4 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v4) {
    return 0LL;
  }
  uint64_t v9 = 4 * v4;
  unint64_t v10 = 15LL;
  while (1)
  {
    uint64_t v11 = String.subscript.getter(v10, a3, a4);
    uint64_t v13 = v12;
    if (v11 == a1 && v12 == a2) {
      break;
    }
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v12, a1, a2, 0LL);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) != 0) {
      return v10;
    }
    unint64_t v10 = String.index(after:)(v10, a3, a4);
    if (v9 == v10 >> 14) {
      return 0LL;
    }
  }

  swift_bridgeObjectRelease(a2);
  return v10;
}

uint64_t sub_10007CE2C(uint64_t a1)
{
  int64_t v2 = v1;
  v4._uint64_t countAndFlagsBits = 32LL;
  v4._object = (void *)0xE100000000000000LL;
  Swift::String v5 = String.init(repeating:count:)(v4, 2LL);
  uint64_t v6 = *v1;
  unint64_t v7 = (void *)v1[1];
  swift_bridgeObjectRetain(v5._object);
  v8._uint64_t countAndFlagsBits = v6;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v5._object);
  uint64_t v9 = v1[2];
  unint64_t v10 = v1[3];
  swift_bridgeObjectRetain(v10);
  uint64_t v11 = sub_10007BD34(a1, 26LL, v9, v10);
  uint64_t v13 = v12;
  swift_bridgeObjectRelease(v10);
  uint64_t v15 = v1[4];
  unint64_t v14 = v1[5];
  uint64_t v16 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000LL) == 0) {
    uint64_t v16 = v15 & 0xFFFFFFFFFFFFLL;
  }
  if (v16)
  {
    swift_bridgeObjectRetain(v2[5]);
    uint64_t v17 = sub_10007BD34(a1, 8LL, v15, v14);
    uint64_t v19 = v18;
    swift_bridgeObjectRelease(v14);
    uint64_t v40 = v19;
    swift_bridgeObjectRetain(v19);
    v20._uint64_t countAndFlagsBits = 10LL;
    v20._object = (void *)0xE100000000000000LL;
    String.append(_:)(v20);
    swift_bridgeObjectRelease(v19);
    uint64_t v22 = v17;
    uint64_t v21 = v40;
  }

  else
  {
    uint64_t v22 = 0LL;
    uint64_t v21 = (void *)0xE000000000000000LL;
  }

  uint64_t v23 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000LL) == 0) {
    uint64_t v23 = v9 & 0xFFFFFFFFFFFFLL;
  }
  if (v23)
  {
    if (String.count.getter(v5._countAndFlagsBits, v5._object) >= 26)
    {
      v35._uint64_t countAndFlagsBits = v11;
      v35._object = v13;
      String.append(_:)(v35);
      swift_bridgeObjectRelease(v13);
      uint64_t v32 = 10LL;
      unint64_t v34 = (void *)0xE100000000000000LL;
    }

    else
    {
      swift_bridgeObjectRetain(v13);
      unint64_t v24 = String.count.getter(v5._countAndFlagsBits, v5._object);
      unint64_t v25 = sub_100033710(v24, v11, (unint64_t)v13);
      uint64_t v27 = v26;
      uint64_t v29 = v28;
      uint64_t v31 = v30;
      swift_bridgeObjectRelease(v13);
      uint64_t v32 = static String._fromSubstring(_:)(v25, v27, v29, v31);
      unint64_t v34 = v33;
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v31);
    }
  }

  else
  {
    swift_bridgeObjectRelease(v13);
    uint64_t v32 = 0LL;
    unint64_t v34 = (void *)0xE000000000000000LL;
  }

  swift_bridgeObjectRetain(v5._object);
  v36._uint64_t countAndFlagsBits = v32;
  v36._object = v34;
  String.append(_:)(v36);
  swift_bridgeObjectRelease(v34);
  swift_bridgeObjectRelease(v5._object);
  swift_bridgeObjectRetain(v5._object);
  v37._uint64_t countAndFlagsBits = 10LL;
  v37._object = (void *)0xE100000000000000LL;
  String.append(_:)(v37);
  swift_bridgeObjectRelease(v5._object);
  swift_bridgeObjectRetain(v5._object);
  v38._uint64_t countAndFlagsBits = v22;
  v38._object = v21;
  String.append(_:)(v38);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v5._object);
  return v5._countAndFlagsBits;
}

Swift::Int sub_10007D0B0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  uint64_t v6 = v0[4];
  uint64_t v5 = v0[5];
  Hasher.init(_seed:)(v8, 0LL);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v8, v1, v2);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v8, v6, v5);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_10007D160(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v7 = v1[5];
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(a1, v5, v6);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(a1, v8, v7);
  return swift_bridgeObjectRelease(v7);
}

Swift::Int sub_10007D1FC(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  Hasher.init(_seed:)(v9, a1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v9, v2, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v9, v4, v5);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v9, v7, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

uint64_t sub_10007D2A8(_OWORD *a1, __int128 *a2)
{
  __int128 v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  __int128 v3 = *a2;
  __int128 v4 = a2[1];
  void v7[2] = a1[2];
  v8[0] = v3;
  __int128 v5 = a2[2];
  v8[1] = v4;
  v8[2] = v5;
  return sub_10007F1B8((uint64_t *)v7, v8) & 1;
}

uint64_t sub_10007D2EC()
{
  unint64_t v1 = v0[1];
  uint64_t v2 = 0x616D6D6F63627553LL;
  uint64_t v3 = 0x736E6F6974704FLL;
  if (v1 != 2) {
    uint64_t v3 = *v0;
  }
  if (v1 != 1) {
    uint64_t v2 = v3;
  }
  if (v1) {
    uint64_t v4 = v2;
  }
  else {
    uint64_t v4 = 0x746E656D75677241LL;
  }
  sub_100080D20(*v0, v1);
  return v4;
}

uint64_t sub_10007D380(uint64_t *a1, void *a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = a2[1];
  switch(v3)
  {
    case 0LL:
      return !v4;
    case 1LL:
      return v4 == 1;
    case 2LL:
      return v4 == 2;
  }

  if (v4 < 3) {
    return 0LL;
  }
  uint64_t v6 = *a1;
  if (v6 == *a2 && v3 == v4) {
    return 1LL;
  }
  return _stringCompareWithSmolCheck(_:_:expecting:)(v6, v3, *a2, v4, 0LL);
}

unint64_t sub_10007D3F8@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_100084E38();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_10007D45C(void *a1)
{
  unint64_t v1 = a1[1];
  uint64_t v2 = *a1 & 0xFFFFFFFFFFFFLL;
  if ((v1 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(v1) & 0xF;
  }
  return v2 != 0;
}

uint64_t sub_10007D47C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  *a2 = v2;
  a2[1] = v3;
  return swift_bridgeObjectRetain(v3);
}

void sub_10007D488(void *a1@<X8>)
{
  *a1 = _swiftEmptyArrayStorage;
}

uint64_t sub_10007D498()
{
  uint64_t v2 = *(void *)(v0 + 24);
  unint64_t v1 = *(void *)(v0 + 32);
  uint64_t v3 = HIBYTE(v1) & 0xF;
  if ((v1 & 0x2000000000000000LL) == 0) {
    uint64_t v3 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v3) {
    return 0LL;
  }
  swift_bridgeObjectRetain(v1);
  sub_10007D540(7LL, v2, v1);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  swift_bridgeObjectRelease(v1);
  v8._uint64_t countAndFlagsBits = v5;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(v7);
  return 0x203A6567617355LL;
}

void sub_10007D540(Swift::Int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v39 = 10LL;
  unint64_t v40 = 0xE100000000000000LL;
  Swift::String v37 = &v39;
  swift_bridgeObjectRetain(a3);
  uint64_t v6 = sub_100032C14(1LL, 0, sub_10002D680, (uint64_t)v36, a2, a3);
  uint64_t v7 = v6;
  if (*((void *)v6 + 2) == 2LL)
  {
    uint64_t v8 = *((void *)v6 + 4);
    uint64_t v9 = *((void *)v6 + 5);
    uint64_t v10 = *((void *)v6 + 6);
    uint64_t v11 = *((void *)v6 + 7);
    swift_bridgeObjectRetain(v11);
    uint64_t v12 = static String._fromSubstring(_:)(v8, v9, v10, v11);
    unint64_t v14 = v13;
    swift_bridgeObjectRelease(v11);
    uint64_t v39 = v12;
    unint64_t v40 = v14;
    v15._uint64_t countAndFlagsBits = 10LL;
    v15._object = (void *)0xE100000000000000LL;
    String.append(_:)(v15);
    if (*((void *)v7 + 2) < 2uLL)
    {
      __break(1u);
    }

    else
    {
      unint64_t v16 = *((void *)v7 + 8);
      unint64_t v17 = *((void *)v7 + 9);
      uint64_t v19 = *((void *)v7 + 10);
      uint64_t v18 = *((void *)v7 + 11);
      swift_bridgeObjectRetain(v18);
      uint64_t v20 = swift_bridgeObjectRelease(v7);
      v38[0] = 10LL;
      v38[1] = 0xE100000000000000LL;
      __chkstk_darwin(v20);
      v35[2] = v38;
      swift_bridgeObjectRetain(v18);
      unint64_t v21 = sub_10003302C(0x7FFFFFFFFFFFFFFFLL, 0, sub_1000155F8, (uint64_t)v35, v16, v17, v19, v18);
      v22._uint64_t countAndFlagsBits = 32LL;
      v22._object = (void *)0xE100000000000000LL;
      Swift::String v23 = String.init(repeating:count:)(v22, a1);
      unint64_t v24 = sub_1000337AC(v21, v23._countAndFlagsBits, (uint64_t)v23._object);
      swift_bridgeObjectRelease(v21);
      swift_bridgeObjectRelease(v23._object);
      v38[0] = v24;
      uint64_t v25 = sub_100005104(&qword_1000B90D8);
      uint64_t v26 = sub_1000062F8(&qword_1000B90E0, &qword_1000B90D8, (uint64_t)&protocol conformance descriptor for [A]);
      unint64_t v27 = sub_10002D69C();
      uint64_t v28 = Sequence<>.joined(separator:)(10LL, 0xE100000000000000LL, v25, v26, v27);
      uint64_t v30 = v29;
      swift_bridgeObjectRelease(v18);
      swift_bridgeObjectRelease(v24);
      v31._uint64_t countAndFlagsBits = v28;
      v31._object = v30;
      String.append(_:)(v31);
      swift_bridgeObjectRelease(v30);
    }
  }

  else
  {
    uint64_t v39 = (uint64_t)v6;
    uint64_t v32 = sub_100005104(&qword_1000B90D8);
    uint64_t v33 = sub_1000062F8(&qword_1000B90E0, &qword_1000B90D8, (uint64_t)&protocol conformance descriptor for [A]);
    unint64_t v34 = sub_10002D69C();
    Sequence<>.joined(separator:)(0LL, 0xE000000000000000LL, v32, v33, v34);
    swift_bridgeObjectRelease(v7);
  }

BOOL sub_10007D7F0()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0LL;
  }
  for (uint64_t i = v1 + 48; *(void *)(i - 8) != 1LL; i += 48LL)
  {
    if (!--v2) {
      return 0LL;
    }
  }

  return *(void *)(*(void *)i + 16LL) != 0LL;
}

char *sub_10007D834(char a1, uint64_t a2)
{
  uint64_t v4 = 1886152040LL;
  uint64_t v5 = String.subscript.getter(15LL, 1886152040LL, 0xE400000000000000LL);
  if (v5 == 95 && v6 == 0xE100000000000000LL)
  {
    swift_bridgeObjectRelease(0xE100000000000000LL);
    goto LABEL_8;
  }

  uint64_t v8 = v6;
  char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, 95LL, 0xE100000000000000LL, 0LL);
  swift_bridgeObjectRelease(v8);
  if ((v9 & 1) != 0)
  {
LABEL_8:
    unint64_t v11 = sub_100033710(1uLL, 1886152040LL, 0xE400000000000000LL);
    uint64_t v13 = v12;
    uint64_t v4 = static String._fromSubstring(_:)(v11, v14, v15, v12);
    unint64_t v10 = v16;
    swift_bridgeObjectRelease(v13);
    goto LABEL_9;
  }

  unint64_t v10 = 0xE400000000000000LL;
LABEL_9:
  swift_bridgeObjectRetain(v10);
  uint64_t v17 = swift_bridgeObjectRetain(a2);
  uint64_t v18 = sub_10007F258(v17, v4, v10);
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease_n(v10, 2LL);
  uint64_t v19 = *((void *)v18 + 2);
  if (!v19)
  {
    swift_bridgeObjectRelease(v18);
    unint64_t v21 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_25;
  }

  swift_bridgeObjectRetain(v18);
  uint64_t v33 = v18;
  uint64_t v20 = (unsigned __int8 *)(v18 + 48);
  unint64_t v21 = (char *)_swiftEmptyArrayStorage;
  do
  {
    unint64_t v24 = (char *)*((void *)v20 - 2);
    Swift::String v23 = (void *)*((void *)v20 - 1);
    unsigned int v25 = *v20;
    if (a1)
    {
      if (v25 >> 6)
      {
        if (v25 >> 6 == 1) {
          goto LABEL_12;
        }
        Swift::String v35 = 0LL;
        unint64_t v36 = 0xE000000000000000LL;
        swift_bridgeObjectRetain(v23);
        v26._uint64_t countAndFlagsBits = (uint64_t)v24;
        v26._object = v23;
        String.append(_:)(v26);
        v27._uint64_t countAndFlagsBits = 45LL;
        v27._object = (void *)0xE100000000000000LL;
        String.append(_:)(v27);
        char v34 = a1;
        _print_unlocked<A, B>(_:_:)( &v34,  &v35,  &type metadata for ArgumentVisibility,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        sub_10002DA24((uint64_t)v24, (uint64_t)v23, v25);
        unint64_t v24 = v35;
        Swift::String v23 = (void *)v36;
        LOBYTE(v25) = 0x80;
      }

      else
      {
        Swift::String v35 = 0LL;
        unint64_t v36 = 0xE000000000000000LL;
        swift_bridgeObjectRetain(v23);
        v28._uint64_t countAndFlagsBits = (uint64_t)v24;
        v28._object = v23;
        String.append(_:)(v28);
        v29._uint64_t countAndFlagsBits = 45LL;
        v29._object = (void *)0xE100000000000000LL;
        String.append(_:)(v29);
        char v34 = a1;
        _print_unlocked<A, B>(_:_:)( &v34,  &v35,  &type metadata for ArgumentVisibility.Representation,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        sub_10002DA24((uint64_t)v24, (uint64_t)v23, v25);
        LOBYTE(v25) = 0;
        unint64_t v24 = v35;
        Swift::String v23 = (void *)v36;
      }
    }

    else
    {
      sub_100030508(*((void *)v20 - 2), *((void *)v20 - 1), *v20);
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0) {
      unint64_t v21 = sub_100057BB8(0LL, *((void *)v21 + 2) + 1LL, 1, v21);
    }
    unint64_t v31 = *((void *)v21 + 2);
    unint64_t v30 = *((void *)v21 + 3);
    if (v31 >= v30 >> 1) {
      unint64_t v21 = sub_100057BB8((char *)(v30 > 1), v31 + 1, 1, v21);
    }
    *((void *)v21 + 2) = v31 + 1;
    Swift::String v22 = &v21[24 * v31];
    *((void *)v22 + 4) = v24;
    *((void *)v22 + 5) = v23;
    v22[48] = v25;
LABEL_12:
    v20 += 24;
    --v19;
  }

  while (v19);
  swift_bridgeObjectRelease_n(v33, 2LL);
LABEL_25:
  Swift::String v35 = v21;
  swift_bridgeObjectRetain(v21);
  sub_10007DB50(&v35);
  swift_bridgeObjectRelease(v21);
  return v35;
}

uint64_t sub_10007DB50(char **a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = sub_10007F164((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_10007DBB8(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_10007DBB8(uint64_t *a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v4);
  if (result >= v4)
  {
    if (v4 < 0) {
      goto LABEL_179;
    }
    if (v4) {
      return sub_10007E758(0LL, v4, 1LL, a1);
    }
    return result;
  }

  if (v4 >= 0) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = v4 + 1;
  }
  if (v4 < -1) {
    goto LABEL_178;
  }
  uint64_t v138 = result;
  unint64_t v135 = a1;
  if (v4 <= 1)
  {
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
    uint64_t v147 = (char *)&_swiftEmptyArrayStorage[4];
    unint64_t v137 = _swiftEmptyArrayStorage;
    if (v4 != 1)
    {
      unint64_t v11 = _swiftEmptyArrayStorage[2];
LABEL_144:
      if (v11 >= 2)
      {
        uint64_t v129 = *v135;
        do
        {
          unint64_t v130 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_173;
          }
          if (!v129) {
            goto LABEL_186;
          }
          uint64_t v131 = *(void *)&v8[16 * v130 + 32];
          uint64_t v132 = *(void *)&v8[16 * v11 + 24];
          uint64_t result = sub_10007EA28( (char *)(v129 + 24 * v131),  (char *)(v129 + 24LL * *(void *)&v8[16 * v11 + 16]),  v129 + 24 * v132,  v147);
          if (v2) {
            break;
          }
          if (v132 < v131) {
            goto LABEL_174;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native(v8);
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_10007F150((uint64_t)v8);
            uint64_t v8 = (char *)result;
          }

          if (v130 >= *((void *)v8 + 2)) {
            goto LABEL_175;
          }
          v133 = &v8[16 * v130 + 32];
          *(void *)v133 = v131;
          *((void *)v133 + 1) = v132;
          unint64_t v134 = *((void *)v8 + 2);
          if (v11 > v134) {
            goto LABEL_176;
          }
          uint64_t result = (uint64_t)memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v134 - v11));
          *((void *)v8 + 2) = v134 - 1;
          unint64_t v11 = v134 - 1;
        }

        while (v134 > 2);
      }

LABEL_155:
      swift_bridgeObjectRelease(v8);
      v137[2] = 0LL;
      return swift_bridgeObjectRelease(v137);
    }
  }

  else
  {
    uint64_t v7 = v6 >> 1;
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)(v6 >> 1, &type metadata for Name);
    *(void *)(result + 16) = v7;
    unint64_t v137 = (void *)result;
    uint64_t v147 = (char *)(result + 32);
  }

  Swift::Int v9 = 0LL;
  uint64_t v10 = *a1;
  uint64_t v136 = *a1 + 64;
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v144 = v4;
  uint64_t v148 = *a1;
  while (2)
  {
    Swift::Int v12 = v9;
    Swift::Int v13 = v9 + 1;
    Swift::Int v145 = v9;
    if (v9 + 1 >= v4) {
      goto LABEL_64;
    }
    int v139 = v8;
    uint64_t v141 = v2;
    uint64_t v14 = v10 + 24 * v13;
    uint64_t v15 = *(void *)v14;
    unint64_t v16 = *(void **)(v14 + 8);
    unsigned int v17 = *(unsigned __int8 *)(v14 + 16);
    uint64_t v18 = v10 + 24 * v9;
    uint64_t v19 = *(void *)v18;
    uint64_t v20 = *(void **)(v18 + 8);
    unsigned int v21 = *(unsigned __int8 *)(v18 + 16);
    if (v21 >> 6)
    {
      if (v21 >> 6 == 1)
      {
        uint64_t v155 = 0LL;
        unint64_t v156 = 0xE000000000000000LL;
        sub_100030508(v15, (uint64_t)v16, v17);
        sub_100030508(v19, (uint64_t)v20, v21);
        v22._uint64_t countAndFlagsBits = 45LL;
        v22._object = (void *)0xE100000000000000LL;
        String.append(_:)(v22);
        Character.write<A>(to:)( &v155,  v19,  v20,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        goto LABEL_22;
      }

      uint64_t v155 = 45LL;
      unint64_t v23 = 0xE100000000000000LL;
    }

    else
    {
      uint64_t v155 = 11565LL;
      unint64_t v23 = 0xE200000000000000LL;
    }

    unint64_t v156 = v23;
    sub_100030508(v15, (uint64_t)v16, v17);
    sub_100030508(v19, (uint64_t)v20, v21);
    v24._uint64_t countAndFlagsBits = v19;
    v24._object = v20;
    String.append(_:)(v24);
LABEL_22:
    uint64_t v25 = v155;
    unint64_t v26 = v156;
    if (v17 >> 6)
    {
      if (v17 >> 6 == 1)
      {
        uint64_t v155 = 0LL;
        unint64_t v156 = 0xE000000000000000LL;
        v27._uint64_t countAndFlagsBits = 45LL;
        v27._object = (void *)0xE100000000000000LL;
        String.append(_:)(v27);
        Character.write<A>(to:)( &v155,  v15,  v16,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        goto LABEL_28;
      }

      uint64_t v155 = 45LL;
      unint64_t v28 = 0xE100000000000000LL;
    }

    else
    {
      uint64_t v155 = 11565LL;
      unint64_t v28 = 0xE200000000000000LL;
    }

    unint64_t v156 = v28;
    v29._uint64_t countAndFlagsBits = v15;
    v29._object = v16;
    String.append(_:)(v29);
LABEL_28:
    unint64_t v30 = v156;
    if (v25 == v155 && v26 == v156)
    {
      int v153 = 0;
      unint64_t v30 = v26;
    }

    else
    {
      int v153 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v26, v155, v156, 1LL);
    }

    swift_bridgeObjectRelease(v26);
    swift_bridgeObjectRelease(v30);
    sub_10002DA24(v19, (uint64_t)v20, v21);
    uint64_t result = sub_10002DA24(v15, (uint64_t)v16, v17);
    Swift::Int v4 = v144;
    Swift::Int v12 = v145;
    Swift::Int v13 = v145 + 2;
    if (v145 + 2 >= v144) {
      goto LABEL_55;
    }
    Swift::Int v149 = v145 + 2;
    unint64_t v31 = (unsigned __int8 *)(v136 + 24 * v145);
    while (1)
    {
      uint64_t v32 = *((void *)v31 - 2);
      uint64_t v33 = (void *)*((void *)v31 - 1);
      unsigned int v34 = *v31;
      uint64_t v36 = *((void *)v31 - 5);
      Swift::String v35 = (void *)*((void *)v31 - 4);
      unsigned int v37 = *(v31 - 24);
      uint64_t v157 = v32;
      if (v37 >> 6)
      {
        if (v37 >> 6 == 1)
        {
          uint64_t v155 = 0LL;
          unint64_t v156 = 0xE000000000000000LL;
          sub_100030508(v32, (uint64_t)v33, v34);
          sub_100030508(v36, (uint64_t)v35, v37);
          v38._uint64_t countAndFlagsBits = 45LL;
          v38._object = (void *)0xE100000000000000LL;
          String.append(_:)(v38);
          Character.write<A>(to:)( &v155,  v36,  v35,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
          goto LABEL_40;
        }

        uint64_t v155 = 45LL;
        unint64_t v39 = 0xE100000000000000LL;
      }

      else
      {
        uint64_t v155 = 11565LL;
        unint64_t v39 = 0xE200000000000000LL;
      }

      unint64_t v156 = v39;
      sub_100030508(v32, (uint64_t)v33, v34);
      sub_100030508(v36, (uint64_t)v35, v37);
      v40._uint64_t countAndFlagsBits = v36;
      v40._object = v35;
      String.append(_:)(v40);
LABEL_40:
      uint64_t v41 = v155;
      unint64_t v42 = v156;
      if (!(v34 >> 6))
      {
        uint64_t v155 = 11565LL;
        unint64_t v44 = 0xE200000000000000LL;
LABEL_45:
        unint64_t v156 = v44;
        v45._uint64_t countAndFlagsBits = v157;
        v45._object = v33;
        String.append(_:)(v45);
        goto LABEL_46;
      }

      if (v34 >> 6 != 1)
      {
        uint64_t v155 = 45LL;
        unint64_t v44 = 0xE100000000000000LL;
        goto LABEL_45;
      }

      uint64_t v155 = 0LL;
      unint64_t v156 = 0xE000000000000000LL;
      v43._uint64_t countAndFlagsBits = 45LL;
      v43._object = (void *)0xE100000000000000LL;
      String.append(_:)(v43);
      Character.write<A>(to:)( &v155,  v157,  v33,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
LABEL_46:
      unint64_t v46 = v156;
      if (v41 == v155 && v42 == v156)
      {
        int v47 = 0;
        unint64_t v46 = v42;
      }

      else
      {
        int v47 = _stringCompareWithSmolCheck(_:_:expecting:)(v41, v42, v155, v156, 1LL);
      }

      swift_bridgeObjectRelease(v42);
      swift_bridgeObjectRelease(v46);
      sub_10002DA24(v36, (uint64_t)v35, v37);
      uint64_t result = sub_10002DA24(v157, (uint64_t)v33, v34);
      if (((v153 ^ v47) & 1) != 0) {
        break;
      }
      v31 += 24;
      if (v144 == ++v149)
      {
        Swift::Int v4 = v144;
        Swift::Int v13 = v144;
        goto LABEL_54;
      }
    }

    Swift::Int v4 = v144;
    Swift::Int v13 = v149;
LABEL_54:
    Swift::Int v12 = v145;
LABEL_55:
    uint64_t v8 = v139;
    uint64_t v2 = v141;
    uint64_t v10 = v148;
    if ((v153 & 1) != 0)
    {
      if (v13 < v12) {
        goto LABEL_180;
      }
      if (v12 < v13)
      {
        uint64_t v48 = 24 * v13;
        uint64_t v49 = 24 * v12;
        Swift::Int v50 = v13;
        do
        {
          if (v12 != --v50)
          {
            if (!v148) {
              goto LABEL_185;
            }
            uint64_t v51 = v148 + v49;
            uint64_t v52 = v148 + v48;
            char v53 = *(_BYTE *)(v148 + v49 + 16);
            __int128 v54 = *(_OWORD *)(v148 + v49);
            uint64_t v55 = *(void *)(v148 + v48 - 8);
            *(_OWORD *)uint64_t v51 = *(_OWORD *)(v148 + v48 - 24);
            *(void *)(v51 + 16) = v55;
            *(_OWORD *)(v52 - 24) = v54;
            *(_BYTE *)(v52 - 8) = v53;
          }

          ++v12;
          v48 -= 24LL;
          v49 += 24LL;
        }

        while (v12 < v50);
        Swift::Int v12 = v145;
      }
    }

LABEL_96:
      if (v13 < v12) {
        goto LABEL_172;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(v8);
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10007F058(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        uint64_t v8 = (char *)result;
      }

      unint64_t v80 = *((void *)v8 + 2);
      unint64_t v79 = *((void *)v8 + 3);
      unint64_t v11 = v80 + 1;
      if (v80 >= v79 >> 1)
      {
        uint64_t result = (uint64_t)sub_10007F058((char *)(v79 > 1), v80 + 1, 1, v8);
        uint64_t v8 = (char *)result;
      }

      *((void *)v8 + 2) = v11;
      uint64_t v81 = v8 + 32;
      unint64_t v82 = &v8[16 * v80 + 32];
      *(void *)unint64_t v82 = v145;
      *((void *)v82 + 1) = v13;
      Swift::Int v151 = v13;
      if (!v80)
      {
        unint64_t v11 = 1LL;
LABEL_14:
        Swift::Int v4 = v144;
        Swift::Int v9 = v151;
        if (v151 >= v144) {
          goto LABEL_144;
        }
        continue;
      }

LABEL_102:
      unint64_t v83 = v11 - 1;
      if (v11 >= 4)
      {
        uint64_t v88 = &v81[2 * v11];
        uint64_t v89 = *(v88 - 8);
        uint64_t v90 = *(v88 - 7);
        BOOL v94 = __OFSUB__(v90, v89);
        uint64_t v91 = v90 - v89;
        if (v94) {
          goto LABEL_161;
        }
        uint64_t v93 = *(v88 - 6);
        uint64_t v92 = *(v88 - 5);
        BOOL v94 = __OFSUB__(v92, v93);
        uint64_t v86 = v92 - v93;
        char v87 = v94;
        if (v94) {
          goto LABEL_162;
        }
        unint64_t v95 = v11 - 2;
        uint64_t v96 = &v81[2 * v11 - 4];
        uint64_t v98 = *v96;
        uint64_t v97 = v96[1];
        BOOL v94 = __OFSUB__(v97, v98);
        uint64_t v99 = v97 - v98;
        if (v94) {
          goto LABEL_163;
        }
        BOOL v94 = __OFADD__(v86, v99);
        uint64_t v100 = v86 + v99;
        if (v94) {
          goto LABEL_165;
        }
        if (v100 >= v91)
        {
          uint64_t v118 = &v81[2 * v83];
          uint64_t v120 = *v118;
          uint64_t v119 = v118[1];
          BOOL v94 = __OFSUB__(v119, v120);
          uint64_t v121 = v119 - v120;
          if (v94) {
            goto LABEL_171;
          }
          BOOL v111 = v86 < v121;
        }

        else
        {
LABEL_115:
          if ((v87 & 1) != 0) {
            goto LABEL_164;
          }
          unint64_t v95 = v11 - 2;
          unint64_t v101 = &v81[2 * v11 - 4];
          uint64_t v103 = *v101;
          uint64_t v102 = v101[1];
          BOOL v104 = __OFSUB__(v102, v103);
          uint64_t v105 = v102 - v103;
          char v106 = v104;
          if (v104) {
            goto LABEL_166;
          }
          unint64_t v107 = &v81[2 * v83];
          uint64_t v109 = *v107;
          uint64_t v108 = v107[1];
          BOOL v94 = __OFSUB__(v108, v109);
          uint64_t v110 = v108 - v109;
          if (v94) {
            goto LABEL_168;
          }
          if (__OFADD__(v105, v110)) {
            goto LABEL_170;
          }
          if (v105 + v110 < v86) {
            goto LABEL_127;
          }
          BOOL v111 = v86 < v110;
        }

        if (v111) {
          unint64_t v83 = v95;
        }
      }

      else
      {
        if (v11 == 3)
        {
          uint64_t v85 = *((void *)v8 + 4);
          uint64_t v84 = *((void *)v8 + 5);
          BOOL v94 = __OFSUB__(v84, v85);
          uint64_t v86 = v84 - v85;
          char v87 = v94;
          goto LABEL_115;
        }

        uint64_t v112 = *((void *)v8 + 4);
        uint64_t v113 = *((void *)v8 + 5);
        BOOL v94 = __OFSUB__(v113, v112);
        uint64_t v105 = v113 - v112;
        char v106 = v94;
LABEL_127:
        if ((v106 & 1) != 0) {
          goto LABEL_167;
        }
        uint64_t v114 = &v81[2 * v83];
        uint64_t v116 = *v114;
        uint64_t v115 = v114[1];
        BOOL v94 = __OFSUB__(v115, v116);
        uint64_t v117 = v115 - v116;
        if (v94) {
          goto LABEL_169;
        }
        if (v117 < v105) {
          goto LABEL_14;
        }
      }

      unint64_t v122 = v83 - 1;
      if (v83 - 1 >= v11)
      {
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
LABEL_169:
        __break(1u);
LABEL_170:
        __break(1u);
LABEL_171:
        __break(1u);
LABEL_172:
        __break(1u);
LABEL_173:
        __break(1u);
LABEL_174:
        __break(1u);
LABEL_175:
        __break(1u);
LABEL_176:
        __break(1u);
LABEL_177:
        __break(1u);
LABEL_178:
        __break(1u);
LABEL_179:
        __break(1u);
LABEL_180:
        __break(1u);
LABEL_181:
        __break(1u);
        break;
      }

      if (!v10) {
        goto LABEL_184;
      }
      uint64_t v123 = v10;
      __int128 v124 = &v81[2 * v122];
      uint64_t v125 = *v124;
      unint64_t v126 = &v81[2 * v83];
      uint64_t v127 = v126[1];
      uint64_t result = sub_10007EA28((char *)(v123 + 24 * *v124), (char *)(v123 + 24LL * *v126), v123 + 24 * v127, v147);
      if (v2) {
        goto LABEL_155;
      }
      if (v127 < v125) {
        goto LABEL_158;
      }
      if (v83 > *((void *)v8 + 2)) {
        goto LABEL_159;
      }
      *__int128 v124 = v125;
      v81[2 * v122 + 1] = v127;
      unint64_t v128 = *((void *)v8 + 2);
      if (v83 >= v128) {
        goto LABEL_160;
      }
      unint64_t v11 = v128 - 1;
      uint64_t result = (uint64_t)memmove(&v81[2 * v83], v126 + 2, 16 * (v128 - 1 - v83));
      *((void *)v8 + 2) = v128 - 1;
      uint64_t v10 = v148;
      if (v128 <= 2) {
        goto LABEL_14;
      }
      goto LABEL_102;
    }

    break;
  }

  __break(1u);
LABEL_183:
  __break(1u);
LABEL_184:
  __break(1u);
LABEL_185:
  __break(1u);
LABEL_186:
  __break(1u);
  return result;
}

uint64_t sub_10007E758(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v25 = result;
  uint64_t v28 = a3;
  if (a3 != a2)
  {
    uint64_t v27 = *a4;
    uint64_t v4 = *a4 + 24 * a3;
LABEL_6:
    uint64_t v5 = v25;
    uint64_t v26 = v4;
    uint64_t v6 = v4;
    while (1)
    {
      uint64_t v33 = *(void *)v4;
      unint64_t v30 = *(void **)(v4 + 8);
      unsigned int v7 = *(unsigned __int8 *)(v4 + 16);
      uint64_t v9 = *(void *)(v6 - 24);
      v6 -= 24LL;
      uint64_t v8 = v9;
      uint64_t v10 = *(void **)(v4 - 16);
      unsigned int v11 = *(unsigned __int8 *)(v4 - 8);
      uint64_t v29 = (uint64_t)v10;
      if (v11 >> 6)
      {
        if (v11 >> 6 == 1)
        {
          uint64_t v31 = 0LL;
          unint64_t v32 = 0xE000000000000000LL;
          sub_100030508(v33, (uint64_t)v30, v7);
          sub_100030508(v8, (uint64_t)v10, v11);
          v12._uint64_t countAndFlagsBits = 45LL;
          v12._object = (void *)0xE100000000000000LL;
          String.append(_:)(v12);
          Character.write<A>(to:)( &v31,  v8,  v10,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
          goto LABEL_13;
        }

        uint64_t v31 = 45LL;
        unint64_t v13 = 0xE100000000000000LL;
      }

      else
      {
        uint64_t v31 = 11565LL;
        unint64_t v13 = 0xE200000000000000LL;
      }

      unint64_t v32 = v13;
      sub_100030508(v33, (uint64_t)v30, v7);
      sub_100030508(v8, (uint64_t)v10, v11);
      v14._uint64_t countAndFlagsBits = v8;
      v14._object = v10;
      String.append(_:)(v14);
LABEL_13:
      uint64_t v15 = v31;
      unint64_t v16 = v32;
      if (!(v7 >> 6))
      {
        uint64_t v31 = 11565LL;
        unint64_t v18 = 0xE200000000000000LL;
LABEL_18:
        unint64_t v32 = v18;
        v19._uint64_t countAndFlagsBits = v33;
        v19._object = v30;
        String.append(_:)(v19);
        goto LABEL_19;
      }

      if (v7 >> 6 != 1)
      {
        uint64_t v31 = 45LL;
        unint64_t v18 = 0xE100000000000000LL;
        goto LABEL_18;
      }

      uint64_t v31 = 0LL;
      unint64_t v32 = 0xE000000000000000LL;
      v17._uint64_t countAndFlagsBits = 45LL;
      v17._object = (void *)0xE100000000000000LL;
      String.append(_:)(v17);
      Character.write<A>(to:)( &v31,  v33,  v30,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
LABEL_19:
      unint64_t v20 = v32;
      if (v15 == v31 && v16 == v32)
      {
        swift_bridgeObjectRelease_n(v16, 2LL);
        sub_10002DA24(v8, v29, v11);
        uint64_t result = sub_10002DA24(v33, (uint64_t)v30, v7);
LABEL_5:
        uint64_t v4 = v26 + 24;
        if (++v28 == a2) {
          return result;
        }
        goto LABEL_6;
      }

      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v31, v32, 1LL);
      swift_bridgeObjectRelease(v16);
      swift_bridgeObjectRelease(v20);
      sub_10002DA24(v8, v29, v11);
      uint64_t result = sub_10002DA24(v33, (uint64_t)v30, v7);
      if ((v21 & 1) == 0) {
        goto LABEL_5;
      }
      if (!v27)
      {
        __break(1u);
        return result;
      }

      char v22 = *(_BYTE *)(v4 + 16);
      __int128 v23 = *(_OWORD *)v4;
      *(_OWORD *)uint64_t v4 = *(_OWORD *)v6;
      *(void *)(v4 + 16) = *(void *)(v6 + 16);
      *(_OWORD *)(v4 - 24) = v23;
      *(_BYTE *)(v4 - 8) = v22;
      ++v5;
      uint64_t v4 = v6;
      if (v28 == v5) {
        goto LABEL_5;
      }
    }
  }

  return result;
}

uint64_t sub_10007EA28(char *__dst, char *__src, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = __src;
  uint64_t v6 = __dst;
  int64_t v7 = __src - __dst;
  int64_t v8 = (__src - __dst) / 24;
  uint64_t v9 = a3 - (void)__src;
  uint64_t v10 = (uint64_t)(a3 - (void)__src) / 24;
  if (v8 >= v10)
  {
    uint64_t v32 = 24 * v10;
    if (a4 != __src || &__src[v32] <= a4) {
      memmove(a4, __src, 24 * v10);
    }
    Swift::String v12 = &v4[v32];
    if (v6 >= v5 || v9 < 24) {
      goto LABEL_66;
    }
    unint64_t v33 = a3 - 24;
    unsigned int v66 = v6;
    unint64_t v68 = v4;
    while (1)
    {
      uint64_t v34 = *((void *)v12 - 3);
      Swift::String v35 = (void *)*((void *)v12 - 2);
      uint64_t v36 = v12 - 24;
      unsigned int v37 = *(v12 - 8);
      uint64_t v38 = *((void *)v5 - 3);
      unint64_t v39 = v5 - 24;
      unsigned int v62 = (void *)*((void *)v5 - 2);
      unsigned int v40 = *(v5 - 8);
      unint64_t v71 = v5;
      uint64_t v64 = v12;
      uint64_t v59 = v38;
      unsigned __int8 v58 = v40;
      if (v40 >> 6)
      {
        if (v40 >> 6 == 1)
        {
          uint64_t v69 = 0LL;
          unint64_t v70 = 0xE000000000000000LL;
          sub_100030508(v34, (uint64_t)v35, v37);
          sub_100030508(v38, (uint64_t)v62, v40);
          v41._uint64_t countAndFlagsBits = 45LL;
          v41._object = (void *)0xE100000000000000LL;
          String.append(_:)(v41);
          Character.write<A>(to:)( &v69,  v38,  v62,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
          goto LABEL_43;
        }

        uint64_t v69 = 45LL;
        unint64_t v42 = 0xE100000000000000LL;
      }

      else
      {
        uint64_t v69 = 11565LL;
        unint64_t v42 = 0xE200000000000000LL;
      }

      unint64_t v70 = v42;
      sub_100030508(v34, (uint64_t)v35, v37);
      sub_100030508(v38, (uint64_t)v62, v40);
      v43._uint64_t countAndFlagsBits = v38;
      v43._object = v62;
      String.append(_:)(v43);
LABEL_43:
      uint64_t v45 = v69;
      unint64_t v44 = v70;
      unsigned __int8 v60 = v37;
      if (!(v37 >> 6))
      {
        uint64_t v69 = 11565LL;
        unint64_t v47 = 0xE200000000000000LL;
LABEL_48:
        unint64_t v70 = v47;
        v48._uint64_t countAndFlagsBits = v34;
        v48._object = v35;
        String.append(_:)(v48);
        goto LABEL_49;
      }

      if (v37 >> 6 != 1)
      {
        uint64_t v69 = 45LL;
        unint64_t v47 = 0xE100000000000000LL;
        goto LABEL_48;
      }

      uint64_t v69 = 0LL;
      unint64_t v70 = 0xE000000000000000LL;
      v46._uint64_t countAndFlagsBits = 45LL;
      v46._object = (void *)0xE100000000000000LL;
      String.append(_:)(v46);
      Character.write<A>(to:)( &v69,  v34,  v35,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
LABEL_49:
      unint64_t v49 = v70;
      uint64_t v50 = (uint64_t)v35;
      if (v45 == v69 && v44 == v70)
      {
        uint64_t v51 = v34;
        char v52 = 0;
        unint64_t v49 = v44;
      }

      else
      {
        uint64_t v51 = v34;
        char v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v45, v44, v69, v70, 1LL);
      }

      char v53 = (char *)(v33 + 24);
      swift_bridgeObjectRelease(v44);
      swift_bridgeObjectRelease(v49);
      sub_10002DA24(v59, (uint64_t)v62, v58);
      sub_10002DA24(v51, v50, v60);
      if ((v52 & 1) != 0)
      {
        uint64_t v4 = v68;
        Swift::String v12 = v64;
        if (v53 == v71)
        {
          uint64_t v5 = v39;
          unint64_t v54 = (unint64_t)v66;
          goto LABEL_63;
        }

        uint64_t v5 = v39;
      }

      else
      {
        uint64_t v4 = v68;
        unint64_t v39 = v36;
        if (v53 == v64)
        {
          Swift::String v12 = v36;
          uint64_t v5 = v71;
          unint64_t v54 = (unint64_t)v66;
          goto LABEL_63;
        }

        Swift::String v12 = v36;
        uint64_t v5 = v71;
      }

      unint64_t v54 = (unint64_t)v66;
LABEL_63:
      __int128 v55 = *(_OWORD *)v39;
      *(void *)(v33 + 16) = *((void *)v39 + 2);
      *(_OWORD *)unint64_t v33 = v55;
LABEL_64:
      if ((unint64_t)v5 > v54)
      {
        v33 -= 24LL;
        if (v12 > v4) {
          continue;
        }
      }

      goto LABEL_66;
    }
  }

  size_t v11 = 24 * v8;
  if (a4 != __dst || &__dst[v11] <= a4) {
    memmove(a4, __dst, v11);
  }
  Swift::String v12 = &v4[v11];
  if ((unint64_t)v5 < a3 && v7 >= 24)
  {
    uint64_t v63 = &v4[v11];
    do
    {
      uint64_t v65 = v6;
      Swift::String v67 = v4;
      uint64_t v14 = *(void *)v5;
      unint64_t v13 = (void *)*((void *)v5 + 1);
      unsigned int v15 = v5[16];
      uint64_t v16 = *(void *)v4;
      Swift::String v17 = (void *)*((void *)v4 + 1);
      unsigned int v18 = v4[16];
      unint64_t v71 = v5;
      if (v18 >> 6)
      {
        if (v18 >> 6 == 1)
        {
          uint64_t v69 = 0LL;
          unint64_t v70 = 0xE000000000000000LL;
          sub_100030508(v14, (uint64_t)v13, v15);
          sub_100030508(v16, (uint64_t)v17, v18);
          v19._uint64_t countAndFlagsBits = 45LL;
          v19._object = (void *)0xE100000000000000LL;
          String.append(_:)(v19);
          Character.write<A>(to:)( &v69,  v16,  v17,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
          goto LABEL_14;
        }

        uint64_t v69 = 45LL;
        unint64_t v20 = 0xE100000000000000LL;
      }

      else
      {
        uint64_t v69 = 11565LL;
        unint64_t v20 = 0xE200000000000000LL;
      }

      unint64_t v70 = v20;
      sub_100030508(v14, (uint64_t)v13, v15);
      sub_100030508(v16, (uint64_t)v17, v18);
      v21._uint64_t countAndFlagsBits = v16;
      v21._object = v17;
      String.append(_:)(v21);
LABEL_14:
      uint64_t v23 = v69;
      unint64_t v22 = v70;
      if (!(v15 >> 6))
      {
        uint64_t v69 = 11565LL;
        unint64_t v25 = 0xE200000000000000LL;
LABEL_19:
        unint64_t v70 = v25;
        v26._uint64_t countAndFlagsBits = v14;
        v26._object = v13;
        String.append(_:)(v26);
        goto LABEL_20;
      }

      if (v15 >> 6 != 1)
      {
        uint64_t v69 = 45LL;
        unint64_t v25 = 0xE100000000000000LL;
        goto LABEL_19;
      }

      uint64_t v69 = 0LL;
      unint64_t v70 = 0xE000000000000000LL;
      v24._uint64_t countAndFlagsBits = 45LL;
      v24._object = (void *)0xE100000000000000LL;
      String.append(_:)(v24);
      Character.write<A>(to:)( &v69,  v14,  v13,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
LABEL_20:
      unint64_t v27 = v70;
      if (v23 == v69 && v22 == v70)
      {
        swift_bridgeObjectRelease_n(v22, 2LL);
        sub_10002DA24(v16, (uint64_t)v17, v18);
        sub_10002DA24(v14, (uint64_t)v13, v15);
LABEL_26:
        unint64_t v30 = v65;
        uint64_t v29 = v67;
        uint64_t v4 = v67 + 24;
        uint64_t v5 = v71;
        if (v65 == v67) {
          goto LABEL_28;
        }
LABEL_27:
        __int128 v31 = *(_OWORD *)v29;
        *((void *)v30 + 2) = *((void *)v29 + 2);
        *(_OWORD *)unint64_t v30 = v31;
        goto LABEL_28;
      }

      char v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v22, v69, v70, 1LL);
      swift_bridgeObjectRelease(v22);
      swift_bridgeObjectRelease(v27);
      sub_10002DA24(v16, (uint64_t)v17, v18);
      sub_10002DA24(v14, (uint64_t)v13, v15);
      if ((v28 & 1) == 0) {
        goto LABEL_26;
      }
      uint64_t v29 = v71;
      uint64_t v5 = v71 + 24;
      unint64_t v30 = v65;
      uint64_t v4 = v67;
      if (v65 != v71) {
        goto LABEL_27;
      }
LABEL_28:
      uint64_t v6 = v30 + 24;
      Swift::String v12 = v63;
    }

    while (v4 < v63 && (unint64_t)v5 < a3);
  }

  uint64_t v5 = v6;
LABEL_66:
  size_t v56 = 24 * ((v12 - v4) / 24);
  if (v5 != v4 || v5 >= &v4[v56]) {
    memmove(v5, v4, v56);
  }
  return 1LL;
}

char *sub_10007F058(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005104(&qword_1000B9DF0);
    size_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
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
    size_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v14 = v11 + 32;
  unsigned int v15 = a4 + 32;
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

char *sub_10007F150(uint64_t a1)
{
  return sub_10007F058(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_10007F164(uint64_t a1)
{
  return sub_10004FF70(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_10007F178(uint64_t a1)
{
  return sub_100050B68(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

BOOL sub_10007F18C(uint64_t a1)
{
  return *(void *)(a1 + 8) != 0LL;
}

uint64_t sub_10007F19C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t result = a1[1];
  if (result)
  {
    *a2 = *a1;
    a2[1] = result;
    return swift_bridgeObjectRetain(result);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_10007F1B8(uint64_t *a1, void *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a2[1];
  BOOL v7 = v4 == *a2 && v5 == v6;
  if (v7 || (char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *a2, v6, 0LL), result = 0LL, (v8 & 1) != 0))
  {
    uint64_t v10 = a1[2];
    uint64_t v11 = a1[3];
    uint64_t v12 = a2[2];
    uint64_t v13 = a2[3];
    BOOL v14 = v10 == v12 && v11 == v13;
    if (v14
      || (char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v11, v12, v13, 0LL), result = 0LL, (v15 & 1) != 0))
    {
      uint64_t v16 = a1[4];
      uint64_t v17 = a1[5];
      uint64_t v18 = a2[4];
      uint64_t v19 = a2[5];
      if (v16 == v18 && v17 == v19) {
        return 1LL;
      }
      else {
        return _stringCompareWithSmolCheck(_:_:expecting:)(v16, v17, v18, v19, 0LL);
      }
    }
  }

  return result;
}

char *sub_10007F258(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000LL) == 0) {
      uint64_t v4 = a2 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v23 = v4;
    uint64_t v22 = swift_bridgeObjectRetain(a1);
    uint64_t v5 = (unsigned __int8 *)(v22 + 48);
    uint64_t v6 = (char *)_swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v7 = *((void *)v5 - 2);
      uint64_t v8 = *((void *)v5 - 1);
      unsigned int v9 = *v5;
      if (!(v9 >> 6)) {
        break;
      }
      if (v9 >> 6 == 1)
      {
        char v10 = v9 & 1 | 0x40;
LABEL_9:
        unint64_t v11 = *((void *)v5 - 2);
        uint64_t v12 = *((void *)v5 - 1);
        goto LABEL_10;
      }

      if (v8 | v7 || v9 != 128)
      {
        if (!v23)
        {
          _StringGuts.grow(_:)(54LL);
          v19._uint64_t countAndFlagsBits = 0x272079654BLL;
          v19._object = (void *)0xE500000000000000LL;
          String.append(_:)(v19);
          swift_bridgeObjectRetain(a3);
          v20._uint64_t countAndFlagsBits = a2;
          v20._object = (void *)a3;
          String.append(_:)(v20);
          swift_bridgeObjectRelease(a3);
          v21._object = (void *)0x800000010009D8E0LL;
          v21._uint64_t countAndFlagsBits = 0xD00000000000002FLL;
          String.append(_:)(v21);
          uint64_t result = (char *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "ArgumentParser/NameSpecification.swift",  38LL,  2LL,  141LL,  0);
          __break(1u);
          return result;
        }

        swift_bridgeObjectRetain(a3);
        unint64_t v11 = String.subscript.getter(15LL, a2, a3);
        uint64_t v12 = v17;
        swift_bridgeObjectRelease(a3);
        char v10 = 64;
      }

      else
      {
        swift_bridgeObjectRetain(a3);
        unint64_t v11 = sub_10004E9B4(45LL, 0xE100000000000000LL, a2, a3);
        uint64_t v12 = v16;
        swift_bridgeObjectRelease(a3);
        char v10 = 0;
      }

char *sub_10007F4E0(uint64_t a1, uint64_t a2)
{
  void (*v8)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::String v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void v20[12];
  char v21;
  void v22[5];
  uint64_t v23;
  _BYTE v24[16];
  void v25[3];
  uint64_t v26;
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return (char *)_swiftEmptyArrayStorage;
  }
  Swift::String v26 = a2 + 112;
  uint64_t v18 = swift_bridgeObjectRetain(a1);
  uint64_t v3 = (uint64_t *)(v18 + 40);
  uint64_t v4 = (char *)_swiftEmptyArrayStorage;
  do
  {
    uint64_t v7 = *(v3 - 1);
    uint64_t v6 = *v3;
    uint64_t v8 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(*v3 + 16);
    v8(v20, v7, *v3);
    sub_10002CC24(v20);
    if ((v21 & 1) != 0)
    {
      unsigned int v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v7, v6);
      unint64_t v11 = v10;
      Swift::String v19 = v10;
      sub_10002AACC(v26, (uint64_t)v24, &qword_1000B9720);
      sub_10002AACC((uint64_t)v24, (uint64_t)v25, &qword_1000B9720);
      if (v25[0] && v7 == v25[0])
      {
        v12._uint64_t countAndFlagsBits = 0x6C75616665642820LL;
        v12._object = (void *)0xEA00000000002974LL;
        String.append(_:)(v12);
        unint64_t v11 = v19;
      }

      v8(v22, v7, v6);
      unint64_t v14 = v22[4];
      unint64_t v13 = v23;
      swift_bridgeObjectRetain(v23);
      sub_10002CC24(v22);
      if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0) {
        uint64_t v4 = sub_100058744(0LL, *((void *)v4 + 2) + 1LL, 1, v4);
      }
      uint64_t v16 = *((void *)v4 + 2);
      char v15 = *((void *)v4 + 3);
      if (v16 >= v15 >> 1) {
        uint64_t v4 = sub_100058744((char *)(v15 > 1), v16 + 1, 1, v4);
      }
      *((void *)v4 + 2) = v16 + 1;
      uint64_t v5 = &v4[48 * v16];
      *((void *)v5 + 4) = v9;
      *((void *)v5 + 5) = v11;
      *((void *)v5 + 6) = v14;
      *((void *)v5 + 7) = v13;
      *((void *)v5 + 8) = 0LL;
      *((void *)v5 + 9) = 0xE000000000000000LL;
    }

    v3 += 2;
    --v2;
  }

  while (v2);
  swift_bridgeObjectRelease(v18);
  return v4;
}

void *sub_10007F6BC(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 16)) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v6 = (char *)a1;
  uint64_t v137 = *(void *)(a1 + 16);
  unint64_t v154 = sub_1000799D4((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v138 = v6;
  uint64_t v7 = sub_10003076C(a2, (uint64_t)v6);
  unint64_t v8 = (unint64_t)v7;
  uint64_t v140 = v9;
  char v10 = (void *)v7[2];
  if (!v10)
  {
    Swift::Int v145 = 0LL;
    uint64_t v147 = (char *)_swiftEmptyArrayStorage;
    uint64_t v142 = (char *)_swiftEmptyArrayStorage;
    int v139 = (char *)_swiftEmptyArrayStorage;
LABEL_117:
    (*(void (**)(uint64_t *__return_ptr))(*(void *)&v138[16 * v137 + 24] + 16LL))(&v155);
    uint64_t v125 = v164;
    uint64_t v126 = swift_bridgeObjectRetain(v164);
    a2 = (uint64_t)sub_10007F4E0(v126, (uint64_t)&v155);
    swift_bridgeObjectRelease(v125);
    sub_10002CC24(&v155);
    uint64_t v127 = sub_100005104(&qword_1000B96D8);
    uint64_t v6 = (char *)swift_allocObject(v127, 80LL, 7LL);
    *((_OWORD *)v6 + 1) = xmmword_100096510;
    *((void *)v6 + 4) = 0LL;
    *((void *)v6 + 5) = 0LL;
    *((void *)v6 + 6) = v139;
    *((void *)v6 + 7) = 0LL;
    *((void *)v6 + 8) = 0xE000000000000000LL;
    v6[72] = 0;
    swift_bridgeObjectRetain(v139);
    uint64_t v128 = swift_bridgeObjectRetain(v147);
    uint64_t v11 = (uint64_t)sub_10007B560(v128, (uint64_t *)&v154);
    swift_bridgeObjectRelease(v139);
    swift_bridgeObjectRelease_n(v147, 2LL);
    sub_100056E20((char *)v11);
    unint64_t v2 = *((void *)v6 + 2);
    int64_t v3 = v2 + 2;
    if (__OFADD__(v2, 2LL))
    {
LABEL_139:
      __break(1u);
    }

    else
    {
      uint64_t v129 = swift_bridgeObjectRetain(v6);
      char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(v129);
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || (uint64_t v11 = (uint64_t)v6, v3 > *((void *)v6 + 3) >> 1))
      {
        else {
          int64_t v131 = v2;
        }
        uint64_t v11 = (uint64_t)sub_100058630(isUniquelyReferenced_nonNull_native, v131, 1, v6);
      }

      int64_t v3 = *(void *)(v11 + 16);
      unint64_t v4 = *(void *)(v11 + 24);
      unint64_t v2 = v3 + 1;
      swift_bridgeObjectRetain(v142);
      if (v3 < v4 >> 1) {
        goto LABEL_125;
      }
    }

    uint64_t v11 = (uint64_t)sub_100058630((char *)(v4 > 1), v2, 1, (char *)v11);
LABEL_125:
    *(void *)(v11 + 16) = v2;
    uint64_t v132 = (char *)(v11 + 48 * v3);
    *((_OWORD *)v132 + 2) = xmmword_100097E60;
    *((void *)v132 + 6) = v142;
    *((void *)v132 + 7) = 0LL;
    *((void *)v132 + 8) = 0xE000000000000000LL;
    v132[72] = 0;
    unint64_t v133 = *(void *)(v11 + 24);
    int64_t v134 = v3 + 2;
    swift_bridgeObjectRetain(a2);
    if (v2 >= v133 >> 1) {
      uint64_t v11 = (uint64_t)sub_100058630((char *)(v133 > 1), v134, 1, (char *)v11);
    }
    *(void *)(v11 + 16) = v134;
    unint64_t v135 = (char *)(v11 + 48 * v2);
    *((_OWORD *)v135 + 2) = xmmword_100097E70;
    *((void *)v135 + 6) = a2;
    *((void *)v135 + 7) = 0LL;
    *((void *)v135 + 8) = 0xE000000000000000LL;
    v135[72] = 0;
    swift_bridgeObjectRelease(v140);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v142);
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(v154);
    sub_100080EF4((uint64_t)v145, 0LL);
    return (void *)v11;
  }

  Swift::Int v145 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v148 = v7 + 4;
  int64_t v146 = v7[2];
  uint64_t v147 = (char *)_swiftEmptyArrayStorage;
  uint64_t v142 = (char *)_swiftEmptyArrayStorage;
  int v139 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v144 = v7;
  while (1)
  {
    if (v11 >= (uint64_t)v10)
    {
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
      goto LABEL_132;
    }

    if (v11 < 0) {
      goto LABEL_130;
    }
    uint64_t v6 = *(char **)(v8 + 16);
    unint64_t v13 = (__int128 *)&v148[24 * v11];
    __int128 v14 = *v13;
    __int128 v15 = v13[1];
    __int128 v16 = v13[3];
    __int128 v167 = v13[2];
    __int128 v168 = v16;
    __int128 v165 = v14;
    __int128 v166 = v15;
    __int128 v17 = v13[4];
    __int128 v18 = v13[5];
    __int128 v19 = v13[7];
    __int128 v171 = v13[6];
    __int128 v172 = v19;
    __int128 v169 = v17;
    __int128 v170 = v18;
    __int128 v20 = v13[8];
    __int128 v21 = v13[9];
    __int128 v22 = v13[11];
    __int128 v175 = v13[10];
    __int128 v176 = v22;
    __int128 v173 = v20;
    __int128 v174 = v21;
    unint64_t v2 = *((void *)&v166 + 1);
    uint64_t v149 = v166;
    uint64_t v150 = *((void *)&v169 + 1);
    uint64_t v151 = v172;
    uint64_t v152 = v170;
    unint64_t v153 = *((void *)&v172 + 1);
    unint64_t v23 = v11 + 1;
    if ((v168 & 1) != 0)
    {
      uint64_t v143 = *((void *)&v166 + 1);
      int64_t v3 = (int64_t)v10;
      if ((void *)v23 != v10)
      {
        unint64_t v8 = *(void *)(v167 + 16);
        uint64_t v141 = v167;
        unint64_t v2 = v167 + 32;
        int64_t v3 = v11 + 1;
        while (v3 < (uint64_t)v10)
        {
          uint64_t v34 = v148[24 * v3 + 4];
          if (*(void *)(v34 + 16) != v8) {
            goto LABEL_58;
          }
          if (v8 && v34 != v141)
          {
            a2 = 0LL;
            uint64_t v35 = v34 + 32;
            while (1)
            {
              uint64_t v36 = (void *)(v35 + 24 * a2);
              uint64_t v37 = v36[1];
              uint64_t v38 = (void *)v36[2];
              unint64_t v39 = (void *)(v2 + 24 * a2);
              uint64_t v40 = v39[1];
              Swift::String v41 = (void *)v39[2];
              BOOL v42 = *v36 == *v39 && v37 == v40;
              if (!v42 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v36, v37, *v39, v40, 0LL) & 1) == 0) {
                break;
              }
              unint64_t v4 = v38[2];
              if (v4 != v41[2]) {
                break;
              }
              if (v4) {
                BOOL v43 = v38 == v41;
              }
              else {
                BOOL v43 = 1;
              }
              if (!v43)
              {
                uint64_t v44 = v38[4];
                uint64_t v45 = v38[5];
                uint64_t v46 = v41[4];
                uint64_t v47 = v41[5];
                BOOL v48 = v44 == v46 && v45 == v47;
                if (!v48 && (_stringCompareWithSmolCheck(_:_:expecting:)(v44, v45, v46, v47, 0LL) & 1) == 0) {
                  break;
                }
                if (v4 != 1)
                {
                  uint64_t v49 = v38[6];
                  uint64_t v50 = v38[7];
                  uint64_t v51 = v41[6];
                  uint64_t v52 = v41[7];
                  BOOL v53 = v49 == v51 && v50 == v52;
                  if (!v53 && (_stringCompareWithSmolCheck(_:_:expecting:)(v49, v50, v51, v52, 0LL) & 1) == 0) {
                    break;
                  }
                  v4 -= 2LL;
                  if (v4)
                  {
                    unint64_t v54 = v41 + 9;
                    __int128 v55 = v38 + 9;
                    do
                    {
                      uint64_t v56 = *(v55 - 1);
                      uint64_t v57 = *v55;
                      uint64_t v58 = *(v54 - 1);
                      uint64_t v59 = *v54;
                      BOOL v60 = v56 == v58 && v57 == v59;
                      if (!v60 && (_stringCompareWithSmolCheck(_:_:expecting:)(v56, v57, v58, v59, 0LL) & 1) == 0) {
                        goto LABEL_59;
                      }
                      v54 += 2;
                      v55 += 2;
                    }

                    while (--v4);
                  }
                }
              }

              if (++a2 == v8) {
                goto LABEL_55;
              }
            }

LABEL_59:
            unint64_t v8 = (unint64_t)v144;
            char v10 = (void *)v146;
            unint64_t v23 = v11 + 1;
            goto LABEL_60;
          }

LABEL_55:
          BOOL v61 = __OFADD__(v3++, 1LL);
          unint64_t v23 = v11 + 1;
          if (v61) {
            goto LABEL_135;
          }
          char v10 = (void *)v146;
          if (v3 == v146)
          {
            int64_t v3 = v146;
LABEL_58:
            unint64_t v8 = (unint64_t)v144;
            goto LABEL_60;
          }
        }

  uint64_t v6 = v7;
LABEL_56:
  uint64_t v25 = (unsigned __int128)((v13 - v4) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
  unint64_t v26 = 24 * ((v25 >> 2) + ((unint64_t)v25 >> 63));
  if (v6 != v4 || v6 >= &v4[v26]) {
    memmove(v6, v4, v26);
  }
  return 1LL;
}

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

LABEL_60:
      uint64_t v62 = sub_100005104(&qword_1000B9230);
      uint64_t v63 = (_OWORD *)swift_allocObject(v62, 224LL, 7LL);
      __int128 v64 = v173;
      __int128 v65 = v175;
      __int128 v66 = v176;
      v63[11] = v174;
      v63[12] = v65;
      v63[13] = v66;
      __int128 v67 = v169;
      __int128 v68 = v171;
      __int128 v69 = v172;
      v63[7] = v170;
      v63[8] = v68;
      v63[9] = v69;
      v63[10] = v64;
      __int128 v70 = v165;
      __int128 v71 = v166;
      v63[1] = xmmword_100096510;
      v63[2] = v70;
      __int128 v72 = v167;
      __int128 v73 = v168;
      v63[3] = v71;
      v63[4] = v72;
      v63[5] = v73;
      v63[6] = v67;
      if (v3 <= v11) {
        goto LABEL_136;
      }
      uint64_t v155 = (uint64_t)v63;
      sub_10002D724((uint64_t)&v165);
      sub_10002D724((uint64_t)&v165);
      swift_bridgeObjectRetain(v8);
      swift_bridgeObjectRetain(v140);
      sub_100056F0C(v23, v3, v8, v140);
      uint64_t v74 = v155;
      unint64_t v156 = sub_10007D3F8;
      uint64_t v157 = 0LL;
      swift_bridgeObjectRetain(v155);
      uint64_t v75 = sub_100005104(&qword_1000B9E50);
      uint64_t v76 = sub_100080E54(&qword_1000B9E58, &qword_1000B9E50, &qword_1000B9E60, &qword_1000B9E68);
      unint64_t v27 = BidirectionalCollection<>.joined(separator:)(47LL, 0xE100000000000000LL, v75, v76);
      unint64_t v78 = v77;
      swift_bridgeObjectRelease(v155);
      uint64_t v79 = v143;
      if (v143)
      {
        uint64_t v155 = 0x746C756166656428LL;
        unint64_t v156 = (void *)0xEA0000000000203ALL;
        uint64_t v80 = v149;
        String.append(_:)(*(Swift::String *)(&v79 - 1));
        v81._uint64_t countAndFlagsBits = 41LL;
        v81._object = (void *)0xE100000000000000LL;
        String.append(_:)(v81);
        uint64_t v82 = 0x746C756166656428LL;
        unint64_t v83 = 0xEA0000000000203ALL;
        uint64_t v84 = *(void *)(v74 + 16);
        if (!v84) {
          goto LABEL_72;
        }
      }

      else
      {
        uint64_t v82 = 0LL;
        unint64_t v83 = 0xE000000000000000LL;
        uint64_t v84 = *(void *)(v155 + 16);
        if (!v84)
        {
LABEL_72:
          unint64_t v8 = v78;
          uint64_t v87 = 0LL;
          uint64_t v86 = 0LL;
LABEL_74:
          swift_bridgeObjectRelease(v74);
          uint64_t v89 = sub_100005104(&qword_1000B9DF8);
          uint64_t v90 = swift_allocObject(v89, 64LL, 7LL);
          *(_OWORD *)(v90 + 16) = xmmword_1000970B0;
          *(void *)(v90 + 32) = v87;
          *(void *)(v90 + 40) = v86;
          *(void *)(v90 + 48) = v82;
          *(void *)(v90 + 56) = v83;
          uint64_t v155 = v90;
          unint64_t v156 = sub_10007D458;
          uint64_t v157 = 0LL;
          uint64_t v158 = sub_10007F18C;
          uint64_t v159 = 0LL;
          unint64_t v160 = sub_10007F19C;
          uint64_t v161 = 0LL;
          uint64_t v162 = sub_10007D45C;
          uint64_t v163 = 0LL;
          uint64_t v91 = sub_100005104(&qword_1000B9E00);
          uint64_t v92 = sub_100080D6C( &qword_1000B9E08,  &qword_1000B9E00,  (void (*)(void))sub_100080D48,  (uint64_t)&protocol conformance descriptor for <> LazyFilterSequence<A>);
          a2 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v91, v92);
          unint64_t v4 = v93;
          swift_bridgeObjectRelease(v90);
          goto LABEL_77;
        }
      }

      uint64_t v85 = (void *)(v74 + 96);
      while (1)
      {
        uint64_t v87 = *(v85 - 1);
        uint64_t v86 = *v85;
        uint64_t v88 = HIBYTE(*v85) & 0xFLL;
        if ((*v85 & 0x2000000000000000LL) == 0) {
          uint64_t v88 = v87 & 0xFFFFFFFFFFFFLL;
        }
        if (v88) {
          break;
        }
        v85 += 24;
        if (!--v84) {
          goto LABEL_72;
        }
      }

      unint64_t v8 = v78;
      swift_bridgeObjectRetain(*v85);
      goto LABEL_74;
    }

    uint64_t v24 = *((void *)&v168 + 1);
    uint64_t v25 = v169;
    sub_10002D724((uint64_t)&v165);
    unint64_t v27 = sub_100084E38();
    if (v2)
    {
      uint64_t v28 = HIBYTE(v2) & 0xF;
      uint64_t v29 = v149;
      unint64_t v8 = v26;
      if ((v2 & 0x2000000000000000LL) == 0) {
        uint64_t v28 = v149 & 0xFFFFFFFFFFFFLL;
      }
      if (v28)
      {
        unint64_t v30 = v2;
        String.append(_:)(*(Swift::String *)&v29);
        v31._uint64_t countAndFlagsBits = 41LL;
        v31._object = (void *)0xE100000000000000LL;
        String.append(_:)(v31);
        uint64_t v33 = 0x746C756166656428LL;
        unint64_t v32 = 0xEA0000000000203ALL;
      }

      else
      {
        uint64_t v33 = 0LL;
        unint64_t v32 = 0LL;
      }
    }

    else
    {
      unint64_t v8 = v26;
      unint64_t v32 = 0LL;
      uint64_t v33 = v149;
    }

    uint64_t v94 = sub_100005104(&qword_1000B9DF8);
    uint64_t v95 = swift_allocObject(v94, 64LL, 7LL);
    *(_OWORD *)(v95 + 16) = xmmword_1000970B0;
    *(void *)(v95 + 32) = v24;
    *(void *)(v95 + 40) = v25;
    *(void *)(v95 + 48) = v33;
    *(void *)(v95 + 56) = v32;
    uint64_t v155 = v95;
    unint64_t v156 = sub_10007D458;
    uint64_t v157 = 0LL;
    uint64_t v158 = sub_10007F18C;
    uint64_t v159 = 0LL;
    unint64_t v160 = sub_10007F19C;
    uint64_t v161 = 0LL;
    uint64_t v162 = sub_1000819A4;
    uint64_t v163 = 0LL;
    swift_bridgeObjectRetain(v25);
    uint64_t v96 = sub_100005104(&qword_1000B9E00);
    uint64_t v97 = sub_100080D6C( &qword_1000B9E08,  &qword_1000B9E00,  (void (*)(void))sub_100080D48,  (uint64_t)&protocol conformance descriptor for <> LazyFilterSequence<A>);
    a2 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v96, v97);
    unint64_t v4 = v98;
    swift_bridgeObjectRelease(v95);
    int64_t v3 = v23;
LABEL_77:
    uint64_t v11 = v3;
    int64_t v3 = v153;
    if ((v153 & 0x2000000000000000LL) != 0) {
      uint64_t v99 = HIBYTE(v153) & 0xF;
    }
    else {
      uint64_t v99 = v151 & 0xFFFFFFFFFFFFLL;
    }
    sub_10005EC08(&v165, &v177);
    if (!v99)
    {
      sub_10005EC08(&v177, v178);
      if (v178[0])
      {
        swift_bridgeObjectRetain(v152);
        if ((swift_isUniquelyReferenced_nonNull_native(v142) & 1) == 0) {
          uint64_t v142 = sub_100058744(0LL, *((void *)v142 + 2) + 1LL, 1, v142);
        }
        unint64_t v2 = *((void *)v142 + 2);
        unint64_t v113 = *((void *)v142 + 3);
        uint64_t v6 = (char *)(v2 + 1);
        if (v2 >= v113 >> 1) {
          uint64_t v142 = sub_100058744((char *)(v113 > 1), v2 + 1, 1, v142);
        }
        *((void *)v142 + 2) = v6;
        uint64_t v12 = &v142[48 * v2];
        *((void *)v12 + 4) = v27;
        *((void *)v12 + 5) = v8;
        *((void *)v12 + 6) = a2;
        *((void *)v12 + 7) = v4;
        *((void *)v12 + 8) = v150;
        *((void *)v12 + 9) = v152;
      }

      else
      {
        swift_bridgeObjectRetain(v153);
        swift_bridgeObjectRetain(v152);
        if ((swift_isUniquelyReferenced_nonNull_native(v139) & 1) == 0) {
          int v139 = sub_100058744(0LL, *((void *)v139 + 2) + 1LL, 1, v139);
        }
        unint64_t v2 = *((void *)v139 + 2);
        unint64_t v123 = *((void *)v139 + 3);
        uint64_t v6 = (char *)(v2 + 1);
        if (v2 >= v123 >> 1) {
          int v139 = sub_100058744((char *)(v123 > 1), v2 + 1, 1, v139);
        }
        *((void *)v139 + 2) = v6;
        __int128 v124 = &v139[48 * v2];
        *((void *)v124 + 4) = v27;
        *((void *)v124 + 5) = v8;
        *((void *)v124 + 6) = a2;
        *((void *)v124 + 7) = v4;
        *((void *)v124 + 8) = v150;
        *((void *)v124 + 9) = v152;
        swift_bridgeObjectRelease(v153);
      }

      sub_10002D8A4((uint64_t)&v165);
      goto LABEL_6;
    }

    uint64_t v6 = (char *)v154;
    uint64_t v100 = *(void *)(v154 + 16);
    swift_bridgeObjectRetain_n(v153, 2LL);
    swift_bridgeObjectRetain(v152);
    sub_100080ECC(&v177);
    if (!v100
      || (swift_bridgeObjectRetain(v154),
          sub_100023BB8(v151, v153),
          char v102 = v101,
          swift_bridgeObjectRelease(v154),
          (v102 & 1) == 0))
    {
      swift_bridgeObjectRetain(v153);
      if ((swift_isUniquelyReferenced_nonNull_native(v147) & 1) == 0) {
        uint64_t v147 = sub_100057AB8(0LL, *((void *)v147 + 2) + 1LL, 1, v147);
      }
      unint64_t v104 = *((void *)v147 + 2);
      unint64_t v103 = *((void *)v147 + 3);
      if (v104 >= v103 >> 1) {
        uint64_t v147 = sub_100057AB8((char *)(v103 > 1), v104 + 1, 1, v147);
      }
      *((void *)v147 + 2) = v104 + 1;
      uint64_t v105 = &v147[16 * v104];
      *((void *)v105 + 4) = v151;
      *((void *)v105 + 5) = v153;
      uint64_t v6 = (char *)v154;
    }

    sub_100080EF4((uint64_t)v145, 0LL);
    unint64_t v2 = swift_isUniquelyReferenced_nonNull_native(v6);
    uint64_t v155 = (uint64_t)v6;
    int64_t v3 = sub_100023BB8(v151, v153);
    uint64_t v107 = *((void *)v6 + 2);
    BOOL v108 = (v106 & 1) == 0;
    uint64_t v109 = v107 + v108;
    if (__OFADD__(v107, v108)) {
      goto LABEL_134;
    }
    char v110 = v106;
    if (*((void *)v6 + 3) >= v109)
    {
      if ((v2 & 1) == 0)
      {
        sub_1000707FC();
        uint64_t v6 = (char *)v155;
      }

      goto LABEL_99;
    }

    sub_1000712CC(v109, v2);
    uint64_t v6 = (char *)v155;
    unint64_t v111 = sub_100023BB8(v151, v153);
    if ((v110 & 1) != (v112 & 1)) {
      break;
    }
    int64_t v3 = v111;
LABEL_99:
    unint64_t v154 = (unint64_t)v6;
    swift_bridgeObjectRelease(0x8000000000000000LL);
    unint64_t v114 = (unint64_t)v6;
    if ((v110 & 1) == 0)
    {
      *(void *)&v6[8 * ((unint64_t)v3 >> 6) + 64] |= 1LL << v3;
      uint64_t v115 = (uint64_t *)(*((void *)v6 + 6) + 16 * v3);
      *uint64_t v115 = v151;
      v115[1] = v153;
      *(void *)(*((void *)v6 + 7) + 8 * v3) = _swiftEmptyArrayStorage;
      uint64_t v116 = *((void *)v6 + 2);
      unint64_t v2 = v116 + 1;
      BOOL v117 = __OFADD__(v116, 1LL);
      swift_bridgeObjectRetain(v6);
      if (v117) {
        goto LABEL_138;
      }
      *((void *)v6 + 2) = v2;
      unint64_t v114 = v153;
    }

    swift_bridgeObjectRetain(v114);
    uint64_t v118 = *((void *)v6 + 7);
    swift_bridgeObjectRelease(v6);
    uint64_t v6 = *(char **)(v118 + 8 * v3);
    char v119 = swift_isUniquelyReferenced_nonNull_native(v6);
    *(void *)(v118 + 8 * v3) = v6;
    if ((v119 & 1) == 0)
    {
      uint64_t v6 = sub_100058744(0LL, *((void *)v6 + 2) + 1LL, 1, v6);
      *(void *)(v118 + 8 * v3) = v6;
    }

    unint64_t v121 = *((void *)v6 + 2);
    unint64_t v120 = *((void *)v6 + 3);
    unint64_t v2 = v121 + 1;
    if (v121 >= v120 >> 1)
    {
      uint64_t v6 = sub_100058744((char *)(v120 > 1), v121 + 1, 1, v6);
      *(void *)(v118 + 8 * v3) = v6;
    }

    *((void *)v6 + 2) = v2;
    unint64_t v122 = &v6[48 * v121];
    *((void *)v122 + 4) = v27;
    *((void *)v122 + 5) = v8;
    *((void *)v122 + 6) = a2;
    *((void *)v122 + 7) = v4;
    *((void *)v122 + 8) = v150;
    *((void *)v122 + 9) = v152;
    sub_100080F04(&v177);
    a2 = v153;
    swift_bridgeObjectRelease(v153);
    sub_10002D8A4((uint64_t)&v165);
    swift_bridgeObjectRelease(v153);
    Swift::Int v145 = sub_10007D488;
    char v10 = (void *)v146;
LABEL_6:
    unint64_t v8 = (unint64_t)v144;
  }

  uint64_t result = (void *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void *sub_100080428@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  void (*v25)(void *__return_ptr, void);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  Swift::String v46;
  Swift::String v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  Swift::String v52;
  uint64_t v53;
  void *v54;
  Swift::String v55;
  Swift::String v56;
  void *result;
  uint64_t v58;
  uint64_t v59;
  uint64_t v62;
  _BYTE v63[24];
  void v64[2];
  uint64_t v65;
  void v66[6];
  uint64_t v67;
  void v68[10];
  uint64_t v69;
  void v70[4];
  __int128 v71;
  void v72[8];
  __int128 v73;
  _OWORD v74[4];
  uint64_t v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  _BYTE v80[16];
  _BYTE v81[16];
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  int64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0LL,  0xE000000000000000LL,  "ArgumentParser/HelpGenerator.swift",  34LL,  2LL,  97LL,  0);
    __break(1u);
    uint64_t result = (void *)swift_release(v3);
    __break(1u);
    return result;
  }

  uint64_t v6 = a1 + 16 * v4;
  uint64_t v7 = *(void *)(v6 + 16);
  uint64_t v62 = *(void *)(v6 + 24);
  uint64_t v8 = sub_10004D160(v7, *(void *)(v62 + 8), a2, 0LL, 0LL, 0LL);
  uint64_t v58 = v9;
  uint64_t v59 = v8;
  *(void *)uint64_t v63 = a1;
  *(void *)&v74[0] = _swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(a1);
  sub_10004FDF4(0LL, v4, 0);
  char v10 = _swiftEmptyArrayStorage;
  uint64_t v11 = a1 + 40;
  do
  {
    uint64_t v12 = (*(uint64_t (**)(void))(*(void *)v11 + 24LL))();
    uint64_t v14 = v13;
    *(void *)&v74[0] = v10;
    unint64_t v16 = v10[2];
    unint64_t v15 = v10[3];
    if (v16 >= v15 >> 1)
    {
      sub_10004FDF4((char *)(v15 > 1), v16 + 1, 1);
      char v10 = *(void **)&v74[0];
    }

    v10[2] = v16 + 1;
    __int128 v17 = &v10[2 * v16];
    v17[4] = v12;
    void v17[5] = v14;
    v11 += 16LL;
    --v4;
  }

  while (v4);
  *(void *)&v74[0] = v10;
  uint64_t v18 = sub_100005104(&qword_1000B90C8);
  uint64_t v19 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v20 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v18, v19);
  __int128 v22 = v21;
  swift_release(v10);
  (*(void (**)(void *__return_ptr))(*(void *)(a1 + 40) + 16LL))(v64);
  sub_10002AACC((uint64_t)&v65, (uint64_t)v81, &qword_1000B9110);
  sub_10002E7A0((uint64_t)v81);
  sub_10002CC24(v64);
  sub_10002AACC((uint64_t)v81, (uint64_t)&v82, &qword_1000B9110);
  if (*((void *)&v82 + 1))
  {
    v74[0] = v82;
    v23._uint64_t countAndFlagsBits = 32LL;
    v23._object = (void *)0xE100000000000000LL;
    String.append(_:)(v23);
    v24._uint64_t countAndFlagsBits = v20;
    v24._object = v22;
    String.append(_:)(v24);
    swift_bridgeObjectRelease(v22);
    __int128 v22 = (void *)*((void *)&v74[0] + 1);
    uint64_t v20 = *(void *)&v74[0];
  }

  uint64_t v25 = *(void (**)(void *__return_ptr, void))(v62 + 16);
  v25(v66, v7);
  sub_10002AACC((uint64_t)&v67, (uint64_t)v80, &qword_1000B9110);
  sub_10002E7A0((uint64_t)v80);
  sub_10002CC24(v66);
  sub_10002AACC((uint64_t)v80, (uint64_t)&v83, &qword_1000B9110);
  unint64_t v26 = v84;
  if (!v84)
  {
    uint64_t v28 = sub_100005104(&qword_1000B98F0);
    uint64_t v29 = swift_allocObject(v28, 48LL, 7LL);
    *(_OWORD *)(v29 + 16) = xmmword_100096510;
    *(void *)(v29 + 32) = v59;
    *(void *)(v29 + 40) = v58;
    unint64_t v30 = sub_100079598((uint64_t)_swiftEmptyArrayStorage);
    swift_bridgeObjectRelease(v30);
    Swift::String v31 = sub_10008C304(v29);
    unint64_t v32 = swift_bridgeObjectRetain(v31);
    uint64_t v33 = sub_100078CA4(v32);
    swift_release(v31);
    uint64_t v34 = *(void *)(v33 + 16);
    if (v34)
    {
      sub_100005104(qword_1000B9608);
      uint64_t v35 = (void *)static _DictionaryStorage.allocate(capacity:)(v34);
    }

    else
    {
      uint64_t v35 = &_swiftEmptyDictionarySingleton;
    }

    *(void *)&v74[0] = v35;
    sub_10007AA54(v33, 1, v74);
    swift_bridgeObjectRelease(v33);
    uint64_t v36 = *(void *)&v74[0];
    swift_setDeallocating(v29);
    swift_arrayDestroy(v29 + 32, *(void *)(v29 + 16), &type metadata for ArgumentSet);
    swift_deallocClassInstance(v29, 32LL, 7LL);
    uint64_t v37 = sub_1000847CC(v20, v22, v31, v36);
    unint64_t v39 = v38;
    swift_release(v36);
    swift_release(v31);
    swift_bridgeObjectRelease(v22);
    *(void *)&v74[0] = v37;
    *((void *)&v74[0] + 1) = v39;
    swift_bridgeObjectRetain(v39);
    ((void (*)(void *__return_ptr, uint64_t, uint64_t))v25)(v68, v7, v62);
    uint64_t v40 = v69;
    uint64_t v79 = v69;
    swift_bridgeObjectRetain(v69);
    sub_10002CC24(v68);
    Swift::String v41 = *(void *)(v40 + 16);
    sub_10002ABC8(&v79);
    if (!v41)
    {
      swift_bridgeObjectRelease(v39);
LABEL_22:
      unint64_t v26 = *((void *)&v74[0] + 1);
      unint64_t v27 = *(void *)&v74[0];
      goto LABEL_23;
    }

    BOOL v42 = sub_10007B4E8(v37, v39);
    uint64_t v44 = v43;
    swift_bridgeObjectRelease(v39);
    if (v44)
    {
      if (v42 == 32 && v44 == 0xE100000000000000LL)
      {
        swift_bridgeObjectRelease(0xE100000000000000LL);
LABEL_21:
        v47._uint64_t countAndFlagsBits = 0x6D6D6F636275733CLL;
        v47._object = (void *)0xEC0000003E646E61LL;
        String.append(_:)(v47);
        goto LABEL_22;
      }

      uint64_t v45 = _stringCompareWithSmolCheck(_:_:expecting:)(v42, v44, 32LL, 0xE100000000000000LL, 0LL);
      swift_bridgeObjectRelease(v44);
      if ((v45 & 1) != 0) {
        goto LABEL_21;
      }
    }

    v46._uint64_t countAndFlagsBits = 32LL;
    v46._object = (void *)0xE100000000000000LL;
    String.append(_:)(v46);
    goto LABEL_21;
  }

  unint64_t v27 = v83;
  swift_bridgeObjectRelease(v58);
  swift_bridgeObjectRelease(v59);
  swift_bridgeObjectRelease(v22);
LABEL_23:
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v25)(v70, v7, v62);
  unint64_t v78 = v71;
  BOOL v48 = v71;
  swift_bridgeObjectRetain(*((void *)&v71 + 1));
  sub_10002CC24(v70);
  *(_OWORD *)&v63[8] = v78;
  swift_bridgeObjectRetain(*((void *)&v48 + 1));
  ((void (*)(void *__return_ptr, uint64_t, uint64_t))v25)(v72, v7, v62);
  unint64_t v77 = v73;
  uint64_t v49 = v73;
  swift_bridgeObjectRetain(*((void *)&v73 + 1));
  sub_10002CC24(v72);
  sub_100030564((uint64_t)&v77);
  uint64_t v50 = HIBYTE(*((void *)&v49 + 1)) & 0xFLL;
  if ((*((void *)&v49 + 1) & 0x2000000000000000LL) == 0) {
    uint64_t v50 = v49 & 0xFFFFFFFFFFFFLL;
  }
  if (v50)
  {
    sub_100030564((uint64_t)&v78);
    uint64_t v51 = HIBYTE(*((void *)&v48 + 1)) & 0xFLL;
    if ((*((void *)&v48 + 1) & 0x2000000000000000LL) == 0) {
      uint64_t v51 = v48 & 0xFFFFFFFFFFFFLL;
    }
    if (v51)
    {
      v52._uint64_t countAndFlagsBits = 10LL;
      v52._object = (void *)0xE100000000000000LL;
      String.append(_:)(v52);
    }

    ((void (*)(_OWORD *__return_ptr, uint64_t, uint64_t))v25)(v74, v7, v62);
    BOOL v53 = v75;
    unint64_t v54 = v76;
    swift_bridgeObjectRetain(v76);
    sub_10002CC24(v74);
    v55._uint64_t countAndFlagsBits = v53;
    v55._object = v54;
    String.append(_:)(v55);
    swift_bridgeObjectRelease(v54);
    v56._uint64_t countAndFlagsBits = 10LL;
    v56._object = (void *)0xE100000000000000LL;
    String.append(_:)(v56);
    swift_bridgeObjectRelease(0xE100000000000000LL);
  }

  else
  {
    sub_100030564((uint64_t)&v78);
  }

  uint64_t result = sub_10007F6BC(a1, a2);
  *(_OWORD *)a3 = *(_OWORD *)v63;
  *(void *)(a3 + 16) = *(void *)&v63[16];
  *(void *)(a3 + 24) = v27;
  *(void *)(a3 + 32) = v26;
  *(void *)(a3 + 40) = result;
  *(void *)(a3 + 48) = _swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_100080A88(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  int64_t v4 = *(void *)(a4 + 16);
  if (!v4) {
    return 0LL;
  }
  swift_bridgeObjectRetain(a4);
  sub_10004FDF4(0LL, v4, 0);
  uint64_t v28 = a4;
  uint64_t v7 = (uint64_t *)(a4 + 72);
  do
  {
    uint64_t v8 = *(v7 - 2);
    uint64_t v9 = *v7;
    uint64_t v31 = *(v7 - 4);
    swift_bridgeObjectRetain(v31);
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    uint64_t v10 = sub_10007CE2C(a1);
    uint64_t v12 = v11;
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v8);
    swift_bridgeObjectRelease(v31);
    unint64_t v14 = _swiftEmptyArrayStorage[2];
    unint64_t v13 = _swiftEmptyArrayStorage[3];
    if (v14 >= v13 >> 1) {
      sub_10004FDF4((char *)(v13 > 1), v14 + 1, 1);
    }
    v7 += 6;
    _swiftEmptyArrayStorage[2] = v14 + 1;
    unint64_t v15 = &_swiftEmptyArrayStorage[2 * v14];
    _OWORD v15[4] = v10;
    void v15[5] = v12;
    --v4;
  }

  while (v4);
  swift_bridgeObjectRelease(v28);
  uint64_t v16 = sub_100005104(&qword_1000B90C8);
  uint64_t v17 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v18 = BidirectionalCollection<>.joined(separator:)(0LL, 0xE000000000000000LL, v16, v17);
  uint64_t v20 = v19;
  swift_release(_swiftEmptyArrayStorage);
  unint64_t v21 = 0xEB0000000073646ELL;
  unint64_t v22 = 0xE700000000000000LL;
  if (a3 != 2) {
    unint64_t v22 = a3;
  }
  if (a3 != 1) {
    unint64_t v21 = v22;
  }
  if (a3) {
    unint64_t v23 = v21;
  }
  else {
    unint64_t v23 = 0xE900000000000073LL;
  }
  Swift::String v24 = String.uppercased()();
  sub_100080D20(a2, a3);
  swift_bridgeObjectRelease(v23);
  String.append(_:)(v24);
  swift_bridgeObjectRelease(v24._object);
  v25._uint64_t countAndFlagsBits = 2618LL;
  v25._object = (void *)0xE200000000000000LL;
  String.append(_:)(v25);
  swift_bridgeObjectRetain(0xE000000000000000LL);
  v26._uint64_t countAndFlagsBits = v18;
  v26._object = v20;
  String.append(_:)(v26);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  return 0LL;
}

uint64_t sub_100080D20(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t sub_100080D34(uint64_t a1, unint64_t a2)
{
  if (a2 >= 3) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t sub_100080D48()
{
  return sub_100080D6C( &qword_1000B9E10,  &qword_1000B9E18,  (void (*)(void))sub_100080DD0,  (uint64_t)&protocol conformance descriptor for <> LazyMapSequence<A, B>);
}

uint64_t sub_100080D6C(unint64_t *a1, uint64_t *a2, void (*a3)(void), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_10000593C(a2);
    a3();
    uint64_t result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100080DD0()
{
  unint64_t result = qword_1000B9E20;
  if (!qword_1000B9E20)
  {
    uint64_t v1 = sub_10000593C(&qword_1000B9E28);
    sub_100080E54(&qword_1000B9E30, &qword_1000B9E38, &qword_1000B9E40, &qword_1000B9E48);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> LazyFilterSequence<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000B9E20);
  }

  return result;
}

uint64_t sub_100080E54(unint64_t *a1, uint64_t *a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_10000593C(a2);
    sub_1000062F8(a3, a4, (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> LazyMapSequence<A, B>, v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t *sub_100080ECC(unint64_t *a1)
{
  return a1;
}

uint64_t sub_100080EF4(uint64_t result, uint64_t a2)
{
  if (result) {
    return swift_release(a2);
  }
  return result;
}

unint64_t *sub_100080F04(unint64_t *a1)
{
  return a1;
}

void *initializeWithCopy for HelpGenerator.Section.Element(void *a1, void *a2)
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

void *assignWithCopy for HelpGenerator.Section.Element(void *a1, void *a2)
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

__n128 initializeWithTake for HelpGenerator.Section.Element(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for HelpGenerator.Section.Element(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for HelpGenerator.Section.Element(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HelpGenerator.Section.Element(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HelpGenerator.Section.Element()
{
  return &type metadata for HelpGenerator.Section.Element;
}

uint64_t destroy for HelpGenerator(void *a1)
{
  return swift_bridgeObjectRelease(a1[6]);
}

uint64_t *initializeWithCopy for HelpGenerator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2[2];
  uint64_t v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  a1[4] = v7;
  a1[5] = v8;
  uint64_t v9 = a2[6];
  a1[6] = v9;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  return a1;
}

uint64_t *assignWithCopy for HelpGenerator(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[1] = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = a2[5];
  uint64_t v11 = a1[5];
  a1[5] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = a2[6];
  uint64_t v13 = a1[6];
  a1[6] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  return a1;
}

void *assignWithTake for HelpGenerator(void *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = a1[2];
  a1[1] = *(void *)(a2 + 8);
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  a1[3] = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(a1[4]);
  uint64_t v7 = a1[5];
  *((_OWORD *)a1 + 2) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = a1[6];
  a1[6] = *(void *)(a2 + 48);
  swift_bridgeObjectRelease(v8);
  return a1;
}

ValueMetadata *type metadata accessor for HelpGenerator()
{
  return &type metadata for HelpGenerator;
}

uint64_t destroy for HelpGenerator.Section(void *a1)
{
  unint64_t v2 = a1[1];
  if (v2 >= 3) {
    swift_bridgeObjectRelease(v2);
  }
  swift_bridgeObjectRelease(a1[2]);
  return swift_bridgeObjectRelease(a1[4]);
}

uint64_t initializeWithCopy for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 >= 3)
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v4;
    swift_bridgeObjectRetain(v4);
  }

  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t assignWithCopy for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a2 + 8);
  if (v4 >= 3)
  {
    if (v5 >= 3)
    {
      *(void *)a1 = *(void *)a2;
      uint64_t v7 = *(void *)(a2 + 8);
      *(void *)(a1 + 8) = v7;
      swift_bridgeObjectRetain(v7);
      swift_bridgeObjectRelease(v4);
      goto LABEL_8;
    }

    sub_100081484(a1);
    goto LABEL_6;
  }

  if (v5 < 3)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }

  *(void *)a1 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRetain(v6);
LABEL_8:
  uint64_t v8 = *(void *)(a2 + 16);
  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t sub_100081484(uint64_t a1)
{
  return a1;
}

__n128 initializeWithTake for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for HelpGenerator.Section(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 >= 3)
  {
    unint64_t v5 = *(void *)(a2 + 8);
    if (v5 >= 3)
    {
      *(void *)a1 = *(void *)a2;
      *(void *)(a1 + 8) = v5;
      swift_bridgeObjectRelease(v4);
      goto LABEL_6;
    }

    sub_100081484(a1);
  }

  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  uint64_t v6 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRelease(v8);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpGenerator.Section(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HelpGenerator.Section(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 41) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HelpGenerator.Section()
{
  return &type metadata for HelpGenerator.Section;
}

unint64_t sub_1000815F8()
{
  unint64_t result = qword_1000B9E70;
  if (!qword_1000B9E70)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009AC78, &type metadata for HelpGenerator.Section.Element);
    atomic_store(result, (unint64_t *)&qword_1000B9E70);
  }

  return result;
}

void *initializeWithCopy for HelpGenerator.DiscussionSection(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

void *assignWithCopy for HelpGenerator.DiscussionSection(void *a1, void *a2)
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
  return a1;
}

void *assignWithTake for HelpGenerator.DiscussionSection(void *a1, void *a2)
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
  return a1;
}

ValueMetadata *type metadata accessor for HelpGenerator.DiscussionSection()
{
  return &type metadata for HelpGenerator.DiscussionSection;
}

unint64_t destroy for HelpGenerator.Section.Header(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

uint64_t _s14ArgumentParser13HelpGeneratorV7SectionV6HeaderOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  else
  {
    *(void *)a1 = *(void *)a2;
    *(void *)(a1 + 8) = v3;
    swift_bridgeObjectRetain(v3);
  }

  return a1;
}

void *assignWithCopy for HelpGenerator.Section.Header(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  unint64_t v5 = a2[1];
  if (v4 < 0xFFFFFFFF)
  {
    if (v5 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      uint64_t v7 = a2[1];
      a1[1] = v7;
      swift_bridgeObjectRetain(v7);
      return a1;
    }

uint64_t assignWithTake for HelpGenerator.Section.Header(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  unint64_t v5 = *(void *)(a2 + 8);
  if (v5 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease(v4);
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }

  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for HelpGenerator.Section.Header(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483645);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 2;
  if (v4 >= 4) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for HelpGenerator.Section.Header( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)unint64_t result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFD) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 2;
    }
  }

  return result;
}

uint64_t sub_100081948(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100081960(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0LL;
  }

  else if (a2)
  {
    result[1] = (a2 - 1);
  }

  return result;
}

ValueMetadata *type metadata accessor for HelpGenerator.Section.Header()
{
  return &type metadata for HelpGenerator.Section.Header;
}

uint64_t sub_100081990(uint64_t a1, uint64_t a2)
{
  return String.init(argument:)(*(Swift::String *)&a1).value._countAndFlagsBits;
}

uint64_t sub_1000819A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if (!a7 || a7 == 2) {
    return swift_bridgeObjectRetain(a2);
  }
  if (a7 == 1)
  {
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a4);
    return swift_bridgeObjectRetain(a6);
  }

  return result;
}

uint64_t destroy for MessageInfo(uint64_t a1)
{
  return sub_10004CBB4( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(void *)(a1 + 32),  *(void *)(a1 + 40),  *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for MessageInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(_BYTE *)(a2 + 48);
  sub_1000819A8(*(void *)a2, v4, v5, v6, v7, v8, v9);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for MessageInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = *(void *)(a2 + 40);
  char v9 = *(_BYTE *)(a2 + 48);
  sub_1000819A8(*(void *)a2, v4, v5, v6, v7, v8, v9);
  uint64_t v10 = *(void *)a1;
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v12 = *(void *)(a1 + 16);
  uint64_t v13 = *(void *)(a1 + 24);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 40) = v8;
  char v16 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v9;
  sub_10004CBB4(v10, v11, v12, v13, v14, v15, v16);
  return a1;
}

uint64_t assignWithTake for MessageInfo(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 48);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  __int128 v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  char v11 = *(_BYTE *)(a1 + 48);
  *(_BYTE *)(a1 + 48) = v3;
  sub_10004CBB4(v4, v6, v5, v7, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for MessageInfo(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 49)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageInfo(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(void *)uint64_t result = a2 - 254;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 49) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 49) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 48) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_100081C14(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t sub_100081C1C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 48) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageInfo()
{
  return &type metadata for MessageInfo;
}

uint64_t sub_100081C34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  v302[0] = a1;
  swift_errorRetain(a1);
  uint64_t v8 = sub_100005104(&qword_1000B98A0);
  uint64_t v9 = swift_dynamicCast(&v307, v302, v8, &type metadata for CommandError, 0LL);
  uint64_t v290 = a1;
  if ((_DWORD)v9)
  {
    uint64_t v281 = v8;
    uint64_t v288 = a3;
    *(void *)&__int128 v289 = a2;
    uint64_t v11 = *((void *)&v307 + 1);
    uint64_t v10 = v307;
    uint64_t v12 = *((void *)&v309 + 1);
    uint64_t v15 = *((void *)&v310 + 1);
    uint64_t v13 = v310;
    uint64_t v14 = v311;
    uint64_t v16 = v312;
    uint64_t v296 = v308;
    v297 = (void *)*((void *)&v311 + 1);
    uint64_t v293 = v309;
    switch(v313)
    {
      case 0u:
        uint64_t v295 = *((void *)&v312 + 1);
        uint64_t v17 = *((void *)&v310 + 1);
        uint64_t v18 = v312;
        uint64_t v19 = swift_bridgeObjectRetain(v307);
        sub_100080428(v19, v11, (uint64_t)&v320);
        swift_bridgeObjectRelease(v10);
        uint64_t v20 = v13;
        uint64_t v21 = v14;
        uint64_t v294 = sub_10007B6A8(0LL, 1);
        unint64_t v23 = v22;
        swift_errorRelease(v290);
        swift_bridgeObjectRelease(v10);
        sub_10006749C(v11, v296, v293, v12, v20, v17, v21, (uint64_t)v297, v18, v295, 0);
        sub_10004DBA8(&v320);
        uint64_t result = swift_errorRelease(v302[0]);
        uint64_t v25 = 0LL;
        uint64_t v288 = 0LL;
        *(void *)&__int128 v289 = 0LL;
        unint64_t v26 = 0LL;
        char v27 = 0;
        uint64_t v11 = v294;
        unint64_t v28 = v23;
        goto LABEL_48;
      case 1u:
        uint64_t v282 = v307;
        uint64_t v62 = v309;
        uint64_t v63 = *((void *)&v312 + 1);
        uint64_t v287 = *((void *)&v307 + 1);
        uint64_t v64 = v311;
        uint64_t v291 = v311;
        uint64_t v65 = v312;
        uint64_t v281 = sub_10004C608(v289, v288);
        uint64_t v285 = v66;
        sub_100067314(v287, v296, v62, v12, v13, v15, v64, (uint64_t)v297, v65, v63, 1);
        sub_100067314(v287, v296, v62, v12, v13, v15, v291, (uint64_t)v297, v65, v63, 1);
        uint64_t v67 = sub_10002E7C8(v281, v285, v287, v296);
        unint64_t v280 = v199;
        uint64_t v285 = sub_10002E1A0(v67, v199, v200, v201);
        uint64_t v281 = v202;
        swift_errorRelease(v290);
        swift_bridgeObjectRelease(v282);
        sub_10006749C(v287, v296, v293, v12, v13, v15, v291, (uint64_t)v297, v65, v63, 1);
        sub_10006749C(v287, v296, v293, v12, v13, v15, v291, (uint64_t)v297, v65, v63, 1);
        swift_bridgeObjectRelease(v280);
        uint64_t result = swift_errorRelease(v302[0]);
        uint64_t v25 = 0LL;
        uint64_t v288 = 0LL;
        *(void *)&__int128 v289 = 0LL;
        unint64_t v26 = 0LL;
        char v27 = 0;
        uint64_t v11 = v285;
        unint64_t v28 = v281;
        goto LABEL_48;
      case 2u:
        uint64_t v58 = v307;
        uint64_t v59 = a4;
        uint64_t v60 = *((void *)&v312 + 1);
        uint64_t v294 = *((void *)&v310 + 1);
        uint64_t v61 = v312;
        swift_errorRelease(v290);
        unint64_t v28 = v296;
        swift_bridgeObjectRetain(v296);
        swift_bridgeObjectRelease(v58);
        uint64_t v276 = v60;
        a4 = v59;
        sub_10006749C(v11, v296, v293, v12, v13, v294, v14, (uint64_t)v297, v61, v276, 2);
        uint64_t result = swift_errorRelease(v302[0]);
        uint64_t v25 = 0LL;
        uint64_t v288 = 0LL;
        *(void *)&__int128 v289 = 0LL;
        unint64_t v26 = 0LL;
        char v27 = 0;
        goto LABEL_48;
      case 0xFu:
        uint64_t v68 = v310 | *((void *)&v310 + 1) | v311;
        uint64_t v69 = *((void *)&v311 + 1) | v312 | *((void *)&v312 + 1);
        if (!((unint64_t)v309 | v296 | *((void *)&v307 + 1) | *((void *)&v309 + 1) | v68 | v69))
        {
          uint64_t v295 = *((void *)&v312 + 1);
          uint64_t v283 = v310;
          uint64_t v291 = v311;
          int64_t v203 = *(void *)(v307 + 16);
          v204 = _swiftEmptyArrayStorage;
          uint64_t v286 = a4;
          uint64_t v287 = *((void *)&v307 + 1);
          uint64_t v284 = *((void *)&v309 + 1);
          if (v203)
          {
            v292 = (void *)v312;
            uint64_t v294 = *((void *)&v310 + 1);
            *(void *)&__int128 v314 = _swiftEmptyArrayStorage;
            swift_bridgeObjectRetain(v307);
            sub_10004FDF4(0LL, v203, 0);
            v204 = (void *)v314;
            uint64_t v205 = v10 + 40;
            do
            {
              (*(void (**)(uint64_t *__return_ptr))(*(void *)v205 + 16LL))(&v320);
              __int128 v206 = v326;
              swift_bridgeObjectRetain(*((void *)&v326 + 1));
              sub_10002CC24(&v320);
              *(void *)&__int128 v314 = v204;
              unint64_t v208 = v204[2];
              unint64_t v207 = v204[3];
              if (v208 >= v207 >> 1)
              {
                sub_10004FDF4((char *)(v207 > 1), v208 + 1, 1);
                v204 = (void *)v314;
              }

              v204[2] = v208 + 1;
              *(_OWORD *)&v204[2 * v208 + 4] = v206;
              v205 += 16LL;
              --v203;
            }

            while (v203);
            uint64_t v9 = swift_bridgeObjectRelease(v10);
            uint64_t v15 = v294;
            uint64_t v16 = (uint64_t)v292;
          }

          *(void *)&__int128 v314 = v204;
          uint64_t v209 = v204[2];
          if (v209)
          {
            uint64_t v210 = v209 - 1;
            v211 = &v204[2 * v209 + 3];
            while (1)
            {
              uint64_t v212 = *(v211 - 1) & 0xFFFFFFFFFFFFLL;
              if ((*v211 & 0x2000000000000000LL) != 0) {
                uint64_t v212 = HIBYTE(*v211) & 0xFLL;
              }
              if (v212) {
                break;
              }
              v211 -= 2;
              if (--v210 == -1)
              {
                uint64_t v213 = v16;
                goto LABEL_74;
              }
            }

            uint64_t v213 = v16;
          }

          else
          {
            uint64_t v213 = v16;
          }

LABEL_74:
          __chkstk_darwin(v9);
          v277 = &v314;
          v222 = sub_100033664( (void *(*)(uint64_t *__return_ptr, uint64_t *))sub_100083D34,  (uint64_t)&v275,  v220,  v221);
          unint64_t v224 = v223;
          swift_bridgeObjectRelease(v204);
          unint64_t v225 = 0xD000000000000013LL;
          if (v224) {
            unint64_t v225 = (unint64_t)v222;
          }
          uint64_t v294 = v225;
          unint64_t v226 = 0x800000010009DC60LL;
          if (v224) {
            unint64_t v226 = v224;
          }
          v292 = (void *)v226;
          swift_errorRelease(v290);
          swift_bridgeObjectRelease(v10);
          uint64_t v227 = v295;
          v275 = (void *)v213;
          uint64_t v228 = v213;
          uint64_t v229 = v287;
          uint64_t v230 = (uint64_t)v297;
          uint64_t v231 = v293;
          uint64_t v232 = v283;
          uint64_t v233 = v284;
          uint64_t v234 = v291;
          sub_10006749C(v287, v296, v293, v284, v283, v15, v291, (uint64_t)v297, (uint64_t)v275, v295, 15);
          sub_10006749C(v229, v296, v231, v233, v232, v15, v234, v230, v228, v227, 15);
          uint64_t result = swift_errorRelease(v302[0]);
          uint64_t v25 = 0LL;
          uint64_t v288 = 0LL;
          *(void *)&__int128 v289 = 0LL;
          unint64_t v26 = 0LL;
          char v27 = 0;
          uint64_t v11 = v294;
          unint64_t v28 = (unint64_t)v292;
          goto LABEL_47;
        }

        if (*((void *)&v307 + 1) == 1LL && !((unint64_t)v309 | v296 | *((void *)&v309 + 1) | v68 | v69))
        {
          uint64_t v286 = a4;
          uint64_t v70 = *((void *)&v312 + 1);
          uint64_t v71 = *((void *)&v310 + 1);
          uint64_t v72 = v312;
          uint64_t v73 = swift_bridgeObjectRetain(v307);
          sub_100077CF4(v73, (uint64_t)&v314);
          __int128 v321 = v314;
          uint64_t v320 = 0LL;
          uint64_t v322 = v315;
          __int128 v323 = v316;
          __int128 v324 = v317;
          __int128 v325 = v318;
          __int128 v326 = v319;
          uint64_t v74 = v72;
          uint64_t v75 = v13;
          uint64_t v11 = sub_100076DD0();
          uint64_t v76 = v12;
          unint64_t v78 = v77;
          swift_errorRelease(v290);
          swift_bridgeObjectRelease(v10);
          uint64_t v276 = v70;
          a4 = v286;
          sub_10006749C(1LL, v296, v293, v76, v75, v71, v14, (uint64_t)v297, v74, v276, 15);
          sub_10004DC0C((uint64_t *)&v314);
          uint64_t result = swift_errorRelease(v302[0]);
          uint64_t v25 = 0LL;
          uint64_t v288 = 0LL;
          *(void *)&__int128 v289 = 0LL;
          unint64_t v26 = 0LL;
          char v27 = 0;
          unint64_t v28 = v78;
          goto LABEL_48;
        }

uint64_t sub_100083A6C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v35;
  sub_10004CAE0(v2, (uint64_t)&v36);
  if (v42)
  {
    if (v42 == 1)
    {
      uint64_t v6 = v36;
      unint64_t v7 = v37;
      uint64_t v8 = v38;
      uint64_t v9 = v39;
      uint64_t v10 = v40;
      unint64_t v11 = v41;
      uint64_t v12 = HIBYTE(v41) & 0xF;
      if ((v41 & 0x2000000000000000LL) == 0) {
        uint64_t v12 = v40 & 0xFFFFFFFFFFFFLL;
      }
      if (v12)
      {
        String.append(_:)(*(Swift::String *)&v10);
        v13._uint64_t countAndFlagsBits = 10LL;
        v13._object = (void *)0xE100000000000000LL;
        String.append(_:)(v13);
        uint64_t v15 = 0x20203A706C6548LL;
        uint64_t v14 = (void *)0xE700000000000000LL;
      }

      else
      {
        uint64_t v15 = 0LL;
        uint64_t v14 = (void *)0xE000000000000000LL;
      }

      uint64_t v22 = HIBYTE(v7) & 0xF;
      if ((v7 & 0x2000000000000000LL) == 0) {
        uint64_t v22 = v6 & 0xFFFFFFFFFFFFLL;
      }
      if (v22)
      {
        uint64_t v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
        unint64_t v33 = v23;
        v24._uint64_t countAndFlagsBits = 8250LL;
        v24._object = (void *)0xE200000000000000LL;
        String.append(_:)(v24);
        v25._uint64_t countAndFlagsBits = v6;
        v25._object = (void *)v7;
        String.append(_:)(v25);
        v26._uint64_t countAndFlagsBits = 10LL;
        v26._object = (void *)0xE100000000000000LL;
        String.append(_:)(v26);
        uint64_t v22 = v32;
        unint64_t v27 = v33;
      }

      else
      {
        unint64_t v27 = 0xE000000000000000LL;
      }

      uint64_t v31 = v22;
      swift_bridgeObjectRetain(v27);
      v28._uint64_t countAndFlagsBits = v15;
      v28._object = v14;
      String.append(_:)(v28);
      swift_bridgeObjectRelease(v27);
      swift_bridgeObjectRelease(v14);
      swift_bridgeObjectRetain(v27);
      v29._uint64_t countAndFlagsBits = v8;
      v29._object = v9;
      String.append(_:)(v29);
      swift_bridgeObjectRelease(v27);
    }

    else
    {
      uint64_t v17 = v36;
      uint64_t v18 = (void *)v37;
      uint64_t v19 = HIBYTE(v37) & 0xF;
      if ((v37 & 0x2000000000000000LL) == 0) {
        uint64_t v19 = v36 & 0xFFFFFFFFFFFFLL;
      }
      if (!v19) {
        return 0LL;
      }
      uint64_t v31 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
      v20._uint64_t countAndFlagsBits = 8250LL;
      v20._object = (void *)0xE200000000000000LL;
      String.append(_:)(v20);
      v21._uint64_t countAndFlagsBits = v17;
      v21._object = v18;
      String.append(_:)(v21);
    }

    return v31;
  }

  else
  {
    uint64_t v16 = v36;
    swift_bridgeObjectRetain(v5);
  }

  return v16;
}

unint64_t *sub_100083C78@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  unint64_t v3 = *result;
  if ((*result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
  }

  else if (v3 < *(void *)(*(void *)a2 + 16LL))
  {
    uint64_t v4 = *(void *)a2 + 16 * v3;
    uint64_t v5 = *(void *)(v4 + 40);
    *a3 = *(void *)(v4 + 32);
    a3[1] = v5;
    return (unint64_t *)swift_bridgeObjectRetain(v5);
  }

  __break(1u);
  return result;
}

uint64_t sub_100083CB8( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255) {
    return sub_100067314(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
  return result;
}

uint64_t sub_100083CD8( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, unsigned __int8 a11)
{
  if (a11 != 255) {
    return sub_10006749C(result, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
  }
  return result;
}

unint64_t sub_100083CF8()
{
  unint64_t result = qword_1000B9E80[0];
  if (!qword_1000B9E80[0])
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___NSError);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, qword_1000B9E80);
  }

  return result;
}

unint64_t *sub_100083D34@<X0>(unint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100083C78(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_100083D50@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_8:
    sub_100033E1C(&v33);
    uint64_t v30 = &v33;
    goto LABEL_9;
  }

  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRetain(a2);
  __int128 v13 = *(_OWORD *)(a1 + 176);
  __int128 v41 = *(_OWORD *)(a1 + 160);
  __int128 v42 = v13;
  __int128 v14 = *(_OWORD *)(a1 + 208);
  __int128 v43 = *(_OWORD *)(a1 + 192);
  __int128 v44 = v14;
  __int128 v15 = *(_OWORD *)(a1 + 112);
  __int128 v37 = *(_OWORD *)(a1 + 96);
  __int128 v38 = v15;
  __int128 v16 = *(_OWORD *)(a1 + 144);
  __int128 v39 = *(_OWORD *)(a1 + 128);
  __int128 v40 = v16;
  __int128 v17 = *(_OWORD *)(a1 + 48);
  __int128 v33 = *(_OWORD *)(a1 + 32);
  __int128 v34 = v17;
  __int128 v18 = *(_OWORD *)(a1 + 80);
  __int128 v35 = *(_OWORD *)(a1 + 64);
  __int128 v36 = v18;
  if ((sub_100084464(a3, a4, a5, v35) & 1) == 0)
  {
    uint64_t v19 = 224LL;
    while (--v9)
    {
      uint64_t v20 = v19 + 192;
      Swift::String v21 = (__int128 *)(a1 + v19);
      __int128 v22 = v21[9];
      __int128 v41 = v21[8];
      __int128 v42 = v22;
      __int128 v23 = v21[11];
      __int128 v43 = v21[10];
      __int128 v44 = v23;
      __int128 v24 = v21[5];
      __int128 v37 = v21[4];
      __int128 v38 = v24;
      __int128 v25 = v21[7];
      __int128 v39 = v21[6];
      __int128 v40 = v25;
      __int128 v26 = v21[1];
      __int128 v33 = *v21;
      __int128 v34 = v26;
      __int128 v27 = v21[3];
      __int128 v35 = v21[2];
      __int128 v36 = v27;
      char v28 = sub_100084464(a3, a4, a5, v35);
      uint64_t v19 = v20;
      if ((v28 & 1) != 0) {
        goto LABEL_6;
      }
    }

    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a1);
    goto LABEL_8;
  }

uint64_t sub_100083EF8@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v9 = a6;
  uint64_t v53 = *(void *)(a1 + 16);
  if (v53)
  {
    uint64_t v12 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    uint64_t v37 = a2;
    swift_bridgeObjectRetain(a2);
    uint64_t v13 = 0LL;
    __int128 v14 = *(_OWORD *)(a1 + 176);
    __int128 v49 = *(_OWORD *)(a1 + 160);
    __int128 v50 = v14;
    __int128 v15 = *(_OWORD *)(a1 + 208);
    __int128 v51 = *(_OWORD *)(a1 + 192);
    __int128 v52 = v15;
    __int128 v16 = *(_OWORD *)(a1 + 112);
    __int128 v45 = *(_OWORD *)(a1 + 96);
    __int128 v46 = v16;
    __int128 v17 = *(_OWORD *)(a1 + 144);
    __int128 v47 = *(_OWORD *)(a1 + 128);
    __int128 v48 = v17;
    __int128 v18 = *(_OWORD *)(a1 + 48);
    __int128 v41 = *(_OWORD *)(a1 + 32);
    __int128 v42 = v18;
    __int128 v19 = *(_OWORD *)(a1 + 80);
    __int128 v43 = *(_OWORD *)(a1 + 64);
    __int128 v44 = v19;
    uint64_t v39 = v12;
    while (1)
    {
      uint64_t v20 = _swiftEmptyArrayStorage;
      if ((unint64_t)v41 >= 2)
      {
        sub_10002D810(v41);
        uint64_t v20 = (void *)v41;
      }

      uint64_t v21 = v20[2];
      if (v21) {
        break;
      }
      swift_bridgeObjectRelease(v20);
LABEL_29:
      if (++v13 == v53)
      {
        swift_bridgeObjectRelease(v37);
        swift_bridgeObjectRelease(a1);
        sub_10002DA24(a3, a4, a5);
        uint64_t v9 = a6;
        goto LABEL_33;
      }

      char v28 = (__int128 *)(v12 + 192 * v13);
      __int128 v29 = v28[9];
      __int128 v49 = v28[8];
      __int128 v50 = v29;
      __int128 v30 = v28[11];
      __int128 v51 = v28[10];
      __int128 v52 = v30;
      __int128 v31 = v28[5];
      __int128 v45 = v28[4];
      __int128 v46 = v31;
      __int128 v32 = v28[7];
      __int128 v47 = v28[6];
      __int128 v48 = v32;
      __int128 v33 = v28[1];
      __int128 v41 = *v28;
      __int128 v42 = v33;
      __int128 v34 = v28[3];
      __int128 v43 = v28[2];
      __int128 v44 = v34;
    }

    __int128 v22 = (unsigned __int8 *)(v20 + 6);
    while (1)
    {
      uint64_t v23 = *((void *)v22 - 2);
      uint64_t v24 = *((void *)v22 - 1);
      unsigned int v25 = *v22;
      if (v25 >> 6)
      {
        if (v25 >> 6 == 1)
        {
          if ((a5 & 0xC0) == 0x40)
          {
            BOOL v26 = v23 == a3 && v24 == a4;
            if ((v26 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, a3, a4, 0LL) & 1) != 0)
              && ((a5 ^ v25) & 1) == 0)
            {
              goto LABEL_31;
            }
          }

          goto LABEL_8;
        }

        if ((a5 & 0xC0) != 0x80) {
          goto LABEL_8;
        }
      }

      else if (a5 >= 0x40u)
      {
        goto LABEL_8;
      }

      BOOL v27 = v23 == a3 && v24 == a4;
      if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, a3, a4, 0LL) & 1) != 0)
      {
LABEL_31:
        sub_10002D724((uint64_t)&v41);
        swift_bridgeObjectRelease(v37);
        swift_bridgeObjectRelease(a1);
        swift_bridgeObjectRelease(v20);
        sub_10002DA24(a3, a4, a5);
        v40[8] = v49;
        v40[9] = v50;
        v40[10] = v51;
        v40[11] = v52;
        v40[4] = v45;
        v40[5] = v46;
        v40[6] = v47;
        v40[7] = v48;
        v40[0] = v41;
        v40[1] = v42;
        void v40[2] = v43;
        v40[3] = v44;
        v35._uint64_t countAndFlagsBits = (uint64_t)v40;
        String.init(argument:)(v35);
        return sub_10005BFC4((uint64_t)v40, a6);
      }

uint64_t sub_1000841B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)v0;
  if (!*(void *)v0)
  {
    v32.n128_u64[0] = 60LL;
    v32.n128_u64[1] = 0xE100000000000000LL;
    Swift::String v4 = *(Swift::String *)(v0 + 88);
    __int128 v37 = *(_OWORD *)(v0 + 72);
    Swift::String v38 = v4;
    __int128 v39 = *(_OWORD *)(v0 + 104);
    uint64_t v40 = *(void *)(v0 + 120);
    __int128 v5 = *(_OWORD *)(v0 + 24);
    __int128 v33 = *(_OWORD *)(v0 + 8);
    __int128 v34 = v5;
    __int128 v6 = *(_OWORD *)(v0 + 56);
    __int128 v35 = *(_OWORD *)(v0 + 40);
    __int128 v36 = v6;
    Swift::String v41 = v38;
    uint64_t v7 = v38._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (v7)
    {
      Swift::String v31 = v38;
      swift_bridgeObjectRetain(v38._object);
    }

    else
    {
      swift_bridgeObjectRetain(v38._object);
      sub_10005D218((void *)v0, (unint64_t *)&v31);
      sub_100030564((uint64_t)&v41);
    }

    object = v31._object;
    String.append(_:)(v31);
    swift_bridgeObjectRelease(object);
    v24._uint64_t countAndFlagsBits = 62LL;
    v24._object = (void *)0xE100000000000000LL;
    String.append(_:)(v24);
    return v32.n128_u64[0];
  }

  if (v2 == 1) {
    return 0LL;
  }
  uint64_t v8 = sub_10005CF90(v2);
  if (v10 <= 0xFDu)
  {
    uint64_t v11 = v8;
    uint64_t v12 = v9;
    unsigned __int8 v13 = v10;
    sub_10002D868((__n128 *)(v1 + 152), &v32);
    sub_10002D868(&v32, (__n128 *)&v41);
    v14._uint64_t countAndFlagsBits = v11;
    v14._object = v12;
    if (v42 == 1)
    {
      uint64_t v15 = sub_10006D63C(v14, v13);
      uint64_t v17 = v16;
      sub_10002DA3C(v11, (uint64_t)v12, v13);
      uint64_t v29 = v15;
      uint64_t v30 = v17;
      v18._uint64_t countAndFlagsBits = 15392LL;
      v18._object = (void *)0xE200000000000000LL;
      String.append(_:)(v18);
      Swift::String v19 = *(Swift::String *)(v1 + 88);
      __int128 v37 = *(_OWORD *)(v1 + 72);
      Swift::String v38 = v19;
      __int128 v39 = *(_OWORD *)(v1 + 104);
      uint64_t v40 = *(void *)(v1 + 120);
      __int128 v20 = *(_OWORD *)(v1 + 24);
      __int128 v33 = *(_OWORD *)(v1 + 8);
      __int128 v34 = v20;
      __int128 v21 = *(_OWORD *)(v1 + 56);
      __int128 v35 = *(_OWORD *)(v1 + 40);
      __int128 v36 = v21;
      Swift::String v31 = v19;
      uint64_t v22 = v19._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
      if (v22)
      {
        Swift::String v28 = v38;
        swift_bridgeObjectRetain(v19._object);
      }

      else
      {
        swift_bridgeObjectRetain(v19._object);
        sub_10005D218((void *)v1, (unint64_t *)&v28);
        sub_100030564((uint64_t)&v31);
      }

      unsigned int v25 = v28._object;
      String.append(_:)(v28);
      swift_bridgeObjectRelease(v25);
      v26._uint64_t countAndFlagsBits = 62LL;
      v26._object = (void *)0xE100000000000000LL;
      String.append(_:)(v26);
      return v29;
    }

    else
    {
      uint64_t v3 = sub_10006D63C(v14, v13);
      sub_10002DA3C(v11, (uint64_t)v12, v13);
    }

    return v3;
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  0xD00000000000002FLL,  0x800000010009DCB0LL,  "ArgumentParser/UsageGenerator.swift",  35LL,  2LL,  95LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_100084464(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 16);
  if (v4)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = a4 + 32;
    __int128 v34 = a3 + 9;
    do
    {
      unsigned __int8 v10 = (void *)(v9 + 24 * v8);
      uint64_t v11 = v10[1];
      uint64_t v12 = (void *)v10[2];
      BOOL v13 = *v10 == a1 && v11 == a2;
      if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0LL) & 1) != 0)
      {
        uint64_t v14 = v12[2];
        if (v14 == a3[2])
        {
          if (!v14 || v12 == a3) {
            return 1LL;
          }
          uint64_t v15 = v12[4];
          uint64_t v16 = v12[5];
          uint64_t v17 = a3[4];
          uint64_t v18 = a3[5];
          BOOL v19 = v15 == v17 && v16 == v18;
          if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v17, v18, 0LL) & 1) != 0)
          {
            if (v14 == 1) {
              return 1LL;
            }
            uint64_t v20 = v12[6];
            uint64_t v21 = v12[7];
            uint64_t v22 = a3[6];
            uint64_t v23 = a3[7];
            BOOL v24 = v20 == v22 && v21 == v23;
            if (v24 || (_stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, v22, v23, 0LL) & 1) != 0)
            {
              uint64_t v25 = v14 - 2;
              if (!v25) {
                return 1LL;
              }
              Swift::String v26 = v12 + 9;
              for (uint64_t i = v34; ; i += 2)
              {
                uint64_t v28 = *(v26 - 1);
                uint64_t v29 = *v26;
                uint64_t v30 = *(i - 1);
                uint64_t v31 = *i;
                BOOL v32 = v28 == v30 && v29 == v31;
                if (!v32 && (_stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v30, v31, 0LL) & 1) == 0) {
                  break;
                }
                v26 += 2;
                if (!--v25) {
                  return 1LL;
                }
              }
            }
          }
        }
      }

      ++v8;
    }

    while (v8 != v4);
  }

  return 0LL;
}

void *sub_1000845C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v18 = swift_bridgeObjectRetain(a1);
    uint64_t v2 = (_BYTE *)(v18 + 48);
    uint64_t v3 = v1;
    do
    {
      char v7 = *v2;
      if ((*v2 & 0xC0) == 0x40)
      {
        uint64_t v9 = *((void *)v2 - 2);
        uint64_t v8 = *((void *)v2 - 1);
        swift_bridgeObjectRetain(v8);
        if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0) {
          sub_10004FED4(0LL, _swiftEmptyArrayStorage[2] + 1LL, 1);
        }
        unint64_t v5 = _swiftEmptyArrayStorage[2];
        unint64_t v4 = _swiftEmptyArrayStorage[3];
        if (v5 >= v4 >> 1) {
          sub_10004FED4((char *)(v4 > 1), v5 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v5 + 1;
        __int128 v6 = &_swiftEmptyArrayStorage[3 * v5];
        v6[4] = v9;
        v6[5] = v8;
        *((_BYTE *)v6 + 48) = v7;
      }

      v2 += 24;
      --v3;
    }

    while (v3);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRetain(v18);
    unsigned __int8 v10 = (unsigned __int8 *)(v18 + 48);
    do
    {
      unsigned __int8 v14 = *v10;
      if ((*v10 & 0xC0) != 0x40)
      {
        uint64_t v15 = *((void *)v10 - 2);
        uint64_t v16 = *((void *)v10 - 1);
        sub_100030508(v15, v16, *v10);
        if ((swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage) & 1) == 0) {
          sub_10004FED4(0LL, _swiftEmptyArrayStorage[2] + 1LL, 1);
        }
        unint64_t v12 = _swiftEmptyArrayStorage[2];
        unint64_t v11 = _swiftEmptyArrayStorage[3];
        if (v12 >= v11 >> 1) {
          sub_10004FED4((char *)(v11 > 1), v12 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v12 + 1;
        BOOL v13 = &_swiftEmptyArrayStorage[3 * v12];
        v13[4] = v15;
        v13[5] = v16;
        *((_BYTE *)v13 + 48) = v14;
      }

      v10 += 24;
      --v1;
    }

    while (v1);
    swift_bridgeObjectRelease(v18);
  }

  sub_100056D34((char *)_swiftEmptyArrayStorage);
  return _swiftEmptyArrayStorage;
}

uint64_t sub_1000847CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10004F988(a3, a4);
  swift_bridgeObjectRelease(a4);
  swift_bridgeObjectRelease(a3);
  unint64_t v9 = v8[2];
  if (v9)
  {
    v93._uint64_t countAndFlagsBits = a1;
    v93._object = a2;
    if (v9 < 0xD)
    {
      sub_10004FDF4(0LL, v9, 0);
      uint64_t v35 = 4LL;
      do
      {
        __int128 v36 = *(_OWORD *)&v8[v35];
        __int128 v37 = *(_OWORD *)&v8[v35 + 2];
        __int128 v38 = *(_OWORD *)&v8[v35 + 6];
        __int128 v111 = *(_OWORD *)&v8[v35 + 4];
        __int128 v112 = v38;
        __int128 v109 = v36;
        __int128 v110 = v37;
        __int128 v39 = *(_OWORD *)&v8[v35 + 8];
        __int128 v40 = *(_OWORD *)&v8[v35 + 10];
        __int128 v41 = *(_OWORD *)&v8[v35 + 14];
        __int128 v115 = *(_OWORD *)&v8[v35 + 12];
        __int128 v116 = v41;
        __int128 v113 = v39;
        __int128 v114 = v40;
        __int128 v42 = *(_OWORD *)&v8[v35 + 16];
        __int128 v43 = *(_OWORD *)&v8[v35 + 18];
        __int128 v44 = *(_OWORD *)&v8[v35 + 22];
        __int128 v119 = *(_OWORD *)&v8[v35 + 20];
        __int128 v120 = v44;
        __int128 v117 = v42;
        __int128 v118 = v43;
        sub_10002D724((uint64_t)&v109);
        v95._uint64_t countAndFlagsBits = sub_1000841B8();
        v95._object = v45;
        char v46 = BYTE8(v109);
        if ((BYTE8(v109) & 2) != 0)
        {
          v47._uint64_t countAndFlagsBits = 774778400LL;
          v47._object = (void *)0xE400000000000000LL;
          String.append(_:)(v47);
        }

        if ((v46 & 1) != 0)
        {
          v108._uint64_t countAndFlagsBits = 91LL;
          v108._object = (void *)0xE100000000000000LL;
          String.append(_:)(v95);
          swift_bridgeObjectRelease(v95._object);
          v48._uint64_t countAndFlagsBits = 93LL;
          v48._object = (void *)0xE100000000000000LL;
          String.append(_:)(v48);
          Swift::String v95 = v108;
        }

        if (BYTE1(v118) == 5)
        {
          v108._uint64_t countAndFlagsBits = 2108717LL;
          v108._object = (void *)0xE300000000000000LL;
          String.append(_:)(v95);
          swift_bridgeObjectRelease(v95._object);
          sub_10002D8A4((uint64_t)&v109);
          object = (void *)0xE300000000000000LL;
          uint64_t countAndFlagsBits = 2108717LL;
        }

        else
        {
          sub_10002D8A4((uint64_t)&v109);
          object = v95._object;
          uint64_t countAndFlagsBits = v95._countAndFlagsBits;
        }

        unint64_t v52 = _swiftEmptyArrayStorage[2];
        unint64_t v51 = _swiftEmptyArrayStorage[3];
        if (v52 >= v51 >> 1) {
          sub_10004FDF4((char *)(v51 > 1), v52 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v52 + 1;
        uint64_t v53 = &_swiftEmptyArrayStorage[2 * v52];
        v53[4] = countAndFlagsBits;
        v53[5] = object;
        v35 += 24LL;
        --v9;
      }

      while (v9);
      swift_release(v8);
      uint64_t v56 = sub_100005104(&qword_1000B90C8);
      uint64_t v57 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
      uint64_t v58 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v56, v57);
      uint64_t v60 = v59;
      swift_release(_swiftEmptyArrayStorage);
      swift_bridgeObjectRetain(v93._object);
      v61._uint64_t countAndFlagsBits = 32LL;
      v61._object = (void *)0xE100000000000000LL;
      String.append(_:)(v61);
      v62._uint64_t countAndFlagsBits = v58;
      v62._object = v60;
      String.append(_:)(v62);
      swift_bridgeObjectRelease(v60);
      return v93._countAndFlagsBits;
    }

    else
    {
      unint64_t v10 = v9 - 1;
      uint64_t v11 = 4LL;
      unint64_t v12 = _swiftEmptyArrayStorage;
      while (1)
      {
        Swift::String v13 = *(Swift::String *)&v8[v11];
        __int128 v14 = *(_OWORD *)&v8[v11 + 2];
        __int128 v15 = *(_OWORD *)&v8[v11 + 6];
        __int128 v97 = *(_OWORD *)&v8[v11 + 4];
        __int128 v98 = v15;
        Swift::String v95 = v13;
        __int128 v96 = v14;
        __int128 v16 = *(_OWORD *)&v8[v11 + 8];
        __int128 v17 = *(_OWORD *)&v8[v11 + 10];
        __int128 v18 = *(_OWORD *)&v8[v11 + 12];
        __int128 v102 = *(_OWORD *)&v8[v11 + 14];
        __int128 v100 = v17;
        __int128 v101 = v18;
        __int128 v99 = v16;
        __int128 v19 = *(_OWORD *)&v8[v11 + 16];
        __int128 v20 = *(_OWORD *)&v8[v11 + 18];
        __int128 v21 = *(_OWORD *)&v8[v11 + 22];
        __int128 v105 = *(_OWORD *)&v8[v11 + 20];
        __int128 v106 = v21;
        __int128 v103 = v19;
        __int128 v104 = v20;
        if (!v95._countAndFlagsBits || ((uint64_t)v95._object & 1) == 0)
        {
          sub_10002D724((uint64_t)&v95);
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v12);
          uint64_t v107 = v12;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_10004FE10(0LL, v12[2] + 1LL, 1);
            unint64_t v12 = v107;
          }

          unint64_t v24 = v12[2];
          unint64_t v23 = v12[3];
          if (v24 >= v23 >> 1)
          {
            sub_10004FE10((char *)(v23 > 1), v24 + 1, 1);
            unint64_t v12 = v107;
          }

          v12[2] = v24 + 1;
          uint64_t v25 = &v12[24 * v24];
          Swift::String v26 = v95;
          __int128 v27 = v96;
          __int128 v28 = v98;
          v25[4] = v97;
          v25[5] = v28;
          v25[2] = v26;
          v25[3] = v27;
          __int128 v29 = v99;
          __int128 v30 = v100;
          __int128 v31 = v102;
          v25[8] = v101;
          v25[9] = v31;
          v25[6] = v29;
          v25[7] = v30;
          __int128 v32 = v103;
          __int128 v33 = v104;
          __int128 v34 = v106;
          v25[12] = v105;
          v25[13] = v34;
          v25[10] = v32;
          v25[11] = v33;
        }

        if (!v10) {
          break;
        }
        --v10;
        v11 += 24LL;
      }

      swift_release(v8);
      int64_t v54 = v12[2];
      if ((unint64_t)(v54 - 13) >= 0xFFFFFFFFFFFFFFF4LL)
      {
        sub_10004FDF4(0LL, v54, 0);
        uint64_t v63 = 4LL;
        do
        {
          __int128 v64 = *(_OWORD *)&v12[v63];
          __int128 v65 = *(_OWORD *)&v12[v63 + 2];
          __int128 v66 = *(_OWORD *)&v12[v63 + 6];
          __int128 v111 = *(_OWORD *)&v12[v63 + 4];
          __int128 v112 = v66;
          __int128 v109 = v64;
          __int128 v110 = v65;
          __int128 v67 = *(_OWORD *)&v12[v63 + 8];
          __int128 v68 = *(_OWORD *)&v12[v63 + 10];
          __int128 v69 = *(_OWORD *)&v12[v63 + 14];
          __int128 v115 = *(_OWORD *)&v12[v63 + 12];
          __int128 v116 = v69;
          __int128 v113 = v67;
          __int128 v114 = v68;
          __int128 v70 = *(_OWORD *)&v12[v63 + 16];
          __int128 v71 = *(_OWORD *)&v12[v63 + 18];
          __int128 v72 = *(_OWORD *)&v12[v63 + 22];
          __int128 v119 = *(_OWORD *)&v12[v63 + 20];
          __int128 v120 = v72;
          __int128 v117 = v70;
          __int128 v118 = v71;
          sub_10002D724((uint64_t)&v109);
          v108._uint64_t countAndFlagsBits = sub_1000841B8();
          v108._object = v73;
          char v74 = BYTE8(v109);
          if ((BYTE8(v109) & 2) != 0)
          {
            v75._uint64_t countAndFlagsBits = 774778400LL;
            v75._object = (void *)0xE400000000000000LL;
            String.append(_:)(v75);
          }

          if ((v74 & 1) != 0)
          {
            v94._uint64_t countAndFlagsBits = 91LL;
            v94._object = (void *)0xE100000000000000LL;
            uint64_t v76 = v108._object;
            String.append(_:)(v108);
            swift_bridgeObjectRelease(v76);
            v77._uint64_t countAndFlagsBits = 93LL;
            v77._object = (void *)0xE100000000000000LL;
            String.append(_:)(v77);
            Swift::String v108 = v94;
          }

          if (BYTE1(v118) == 5)
          {
            unint64_t v78 = v108._object;
            String.append(_:)(v108);
            swift_bridgeObjectRelease(v78);
            sub_10002D8A4((uint64_t)&v109);
            uint64_t v79 = (void *)0xE300000000000000LL;
            uint64_t v80 = 2108717LL;
          }

          else
          {
            sub_10002D8A4((uint64_t)&v109);
            uint64_t v79 = v108._object;
            uint64_t v80 = v108._countAndFlagsBits;
          }

          unint64_t v82 = _swiftEmptyArrayStorage[2];
          unint64_t v81 = _swiftEmptyArrayStorage[3];
          if (v82 >= v81 >> 1) {
            sub_10004FDF4((char *)(v81 > 1), v82 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v82 + 1;
          uint64_t v83 = &_swiftEmptyArrayStorage[2 * v82];
          v83[4] = v80;
          v83[5] = v79;
          v63 += 24LL;
          --v54;
        }

        while (v54);
        swift_release(v12);
        v108._uint64_t countAndFlagsBits = (uint64_t)_swiftEmptyArrayStorage;
        uint64_t v84 = sub_100005104(&qword_1000B90C8);
        uint64_t v85 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
        uint64_t v86 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v84, v85);
        unint64_t v88 = v87;
        swift_release(_swiftEmptyArrayStorage);
        v108._uint64_t countAndFlagsBits = 0LL;
        v108._object = (void *)0xE000000000000000LL;
        _StringGuts.grow(_:)(17LL);
        int64_t v89 = v108._object;
        swift_bridgeObjectRetain(v93._object);
        swift_bridgeObjectRelease(v89);
        Swift::String v108 = v93;
        v90._uint64_t countAndFlagsBits = 0x6F6974706F3C5B20LL;
        v90._object = (void *)0xED0000205D3E736ELL;
        String.append(_:)(v90);
        v91._uint64_t countAndFlagsBits = v86;
        v91._object = v88;
        String.append(_:)(v91);
        swift_bridgeObjectRelease(v88);
        return v108._countAndFlagsBits;
      }

      else
      {
        swift_release(v12);
        *(void *)&__int128 v109 = v93._countAndFlagsBits;
        *((void *)&v109 + 1) = a2;
        swift_bridgeObjectRetain(a2);
        v55._uint64_t countAndFlagsBits = 0x6E6F6974706F3C20LL;
        v55._object = (void *)0xEA00000000003E73LL;
        String.append(_:)(v55);
        return v109;
      }
    }
  }

  else
  {
    swift_release(v8);
    swift_bridgeObjectRetain(a2);
  }

  return a1;
}

unint64_t sub_100084E38()
{
  uint64_t v1 = v0;
  unint64_t v2 = *v0;
  if (!v2)
  {
    v41.n128_u64[0] = 60LL;
    v41.n128_u64[1] = 0xE100000000000000LL;
    Swift::String v4 = *(Swift::String *)(v1 + 11);
    __int128 v46 = *(_OWORD *)(v1 + 9);
    Swift::String v47 = v4;
    __int128 v48 = *(_OWORD *)(v1 + 13);
    unint64_t v49 = v1[15];
    __int128 v5 = *(_OWORD *)(v1 + 3);
    __int128 v42 = *(_OWORD *)(v1 + 1);
    __int128 v43 = v5;
    __int128 v6 = *(_OWORD *)(v1 + 7);
    __int128 v44 = *(_OWORD *)(v1 + 5);
    __int128 v45 = v6;
    Swift::String v50 = v47;
    uint64_t v7 = v47._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (v7)
    {
      Swift::String v40 = v47;
      swift_bridgeObjectRetain(v47._object);
    }

    else
    {
      swift_bridgeObjectRetain(v47._object);
      sub_10005D218(v1, (unint64_t *)&v40);
      sub_100030564((uint64_t)&v50);
    }

    object = v40._object;
    String.append(_:)(v40);
    swift_bridgeObjectRelease(object);
    v23._uint64_t countAndFlagsBits = 62LL;
    v23._object = (void *)0xE100000000000000LL;
    String.append(_:)(v23);
    return v41.n128_u64[0];
  }

  if (v2 == 1) {
    return 0LL;
  }
  uint64_t v8 = swift_bridgeObjectRetain(v2);
  unint64_t v9 = sub_1000845C8(v8);
  sub_10002D990(v2);
  int64_t v10 = v9[2];
  if (!v10)
  {
    swift_bridgeObjectRelease(v9);
    uint64_t countAndFlagsBits = _swiftEmptyArrayStorage;
    goto LABEL_23;
  }

  v50._uint64_t countAndFlagsBits = (uint64_t)_swiftEmptyArrayStorage;
  sub_10004FDF4(0LL, v10, 0);
  uint64_t countAndFlagsBits = _swiftEmptyArrayStorage;
  __int128 v36 = v9;
  unint64_t v12 = (unsigned __int8 *)(v9 + 6);
  do
  {
    uint64_t v14 = *((void *)v12 - 2);
    Swift::String v13 = (void *)*((void *)v12 - 1);
    unsigned int v15 = *v12;
    if (v15 >> 6)
    {
      if (v15 >> 6 == 1)
      {
        *(void *)&__int128 v42 = 0LL;
        *((void *)&v42 + 1) = 0xE000000000000000LL;
        swift_bridgeObjectRetain(v13);
        v16._uint64_t countAndFlagsBits = 45LL;
        v16._object = (void *)0xE100000000000000LL;
        String.append(_:)(v16);
        Character.write<A>(to:)( &v42,  v14,  v13,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        goto LABEL_16;
      }

      *(void *)&__int128 v42 = 45LL;
      unint64_t v17 = 0xE100000000000000LL;
    }

    else
    {
      *(void *)&__int128 v42 = 11565LL;
      unint64_t v17 = 0xE200000000000000LL;
    }

    *((void *)&v42 + 1) = v17;
    swift_bridgeObjectRetain(v13);
    v18._uint64_t countAndFlagsBits = v14;
    v18._object = v13;
    String.append(_:)(v18);
LABEL_16:
    sub_10002DA24(v14, (uint64_t)v13, v15);
    __int128 v19 = v42;
    v50._uint64_t countAndFlagsBits = (uint64_t)countAndFlagsBits;
    unint64_t v21 = countAndFlagsBits[2];
    unint64_t v20 = countAndFlagsBits[3];
    if (v21 >= v20 >> 1)
    {
      sub_10004FDF4((char *)(v20 > 1), v21 + 1, 1);
      uint64_t countAndFlagsBits = (void *)v50._countAndFlagsBits;
    }

    v12 += 24;
    countAndFlagsBits[2] = v21 + 1;
    *(_OWORD *)&countAndFlagsBits[2 * v21 + 4] = v19;
    --v10;
  }

  while (v10);
  swift_bridgeObjectRelease(v36);
LABEL_23:
  *(void *)&__int128 v42 = countAndFlagsBits;
  uint64_t v24 = sub_100005104(&qword_1000B90C8);
  uint64_t v25 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v3 = BidirectionalCollection<>.joined(separator:)(8236LL, 0xE200000000000000LL, v24, v25);
  uint64_t v27 = v26;
  swift_bridgeObjectRelease(countAndFlagsBits);
  sub_10002D868((__n128 *)(v1 + 19), &v41);
  sub_10002D868(&v41, (__n128 *)&v50);
  if ((v51 & 1) != 0)
  {
    uint64_t v38 = v3;
    uint64_t v39 = v27;
    v28._uint64_t countAndFlagsBits = 15392LL;
    v28._object = (void *)0xE200000000000000LL;
    String.append(_:)(v28);
    Swift::String v29 = *(Swift::String *)(v1 + 11);
    __int128 v46 = *(_OWORD *)(v1 + 9);
    Swift::String v47 = v29;
    __int128 v48 = *(_OWORD *)(v1 + 13);
    unint64_t v49 = v1[15];
    __int128 v30 = *(_OWORD *)(v1 + 3);
    __int128 v42 = *(_OWORD *)(v1 + 1);
    __int128 v43 = v30;
    __int128 v31 = *(_OWORD *)(v1 + 7);
    __int128 v44 = *(_OWORD *)(v1 + 5);
    __int128 v45 = v31;
    Swift::String v40 = v29;
    uint64_t v32 = v29._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (v32)
    {
      Swift::String v37 = v47;
      swift_bridgeObjectRetain(v29._object);
    }

    else
    {
      swift_bridgeObjectRetain(v29._object);
      sub_10005D218(v1, (unint64_t *)&v37);
      sub_100030564((uint64_t)&v40);
    }

    __int128 v33 = v37._object;
    String.append(_:)(v37);
    swift_bridgeObjectRelease(v33);
    v34._uint64_t countAndFlagsBits = 62LL;
    v34._object = (void *)0xE100000000000000LL;
    String.append(_:)(v34);
    return v38;
  }

  return v3;
}

uint64_t sub_1000851F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v55 = a1;
  swift_errorRetain(a1);
  uint64_t v6 = sub_100005104(&qword_1000B98A0);
  if (swift_dynamicCast(&v43, &v55, v6, &type metadata for ParserError, 0LL))
  {
    uint64_t v7 = v43;
    uint64_t v8 = v44;
    uint64_t v26 = v46;
    uint64_t v27 = v45;
    uint64_t v9 = v47;
    uint64_t v10 = v49;
    uint64_t v11 = v50;
    uint64_t v12 = v51;
    char v13 = v53;
    uint64_t v56 = a2;
    uint64_t v57 = a3;
    uint64_t v58 = v43;
    uint64_t v59 = v44;
    uint64_t v33 = v43;
    uint64_t v35 = v49;
    uint64_t v37 = v47;
    uint64_t v39 = v44;
    uint64_t v60 = v45;
    uint64_t v61 = v46;
    uint64_t v62 = v47;
    uint64_t v63 = v48;
    uint64_t v64 = v49;
    uint64_t v65 = v50;
    uint64_t v29 = v48;
    uint64_t v31 = v50;
    uint64_t v66 = v51;
    uint64_t v67 = v52;
    uint64_t v14 = v52;
    char v68 = v53;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    sub_100067314(v7, v8, v27, v26, v9, v29, v10, v11, v12, v14, v13);
    sub_100085DBC();
    uint64_t v42 = v15;
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(a2);
    sub_10006749C(v33, v39, v27, v26, v37, v29, v35, v31, v12, v14, v13);
    sub_10006749C(v33, v39, v27, v26, v37, v29, v35, v31, v12, v14, v13);
LABEL_5:
    swift_errorRelease(v55);
    return v42;
  }

  swift_errorRelease(v55);
  uint64_t v55 = a1;
  swift_errorRetain(a1);
  if (swift_dynamicCast(&v43, &v55, v6, &type metadata for CommandError, 0LL))
  {
    uint64_t v16 = v44;
    uint64_t v41 = v43;
    uint64_t v18 = v45;
    uint64_t v17 = v46;
    uint64_t v28 = v48;
    uint64_t v30 = v47;
    uint64_t v20 = v49;
    uint64_t v19 = v50;
    uint64_t v21 = v52;
    char v22 = v54;
    uint64_t v56 = a2;
    uint64_t v57 = a3;
    uint64_t v58 = v44;
    uint64_t v59 = v45;
    uint64_t v36 = v45;
    uint64_t v38 = v44;
    uint64_t v60 = v46;
    uint64_t v61 = v47;
    uint64_t v62 = v48;
    uint64_t v63 = v49;
    uint64_t v40 = v49;
    uint64_t v64 = v50;
    uint64_t v65 = v51;
    uint64_t v66 = v52;
    uint64_t v67 = v53;
    uint64_t v23 = v53;
    uint64_t v32 = v51;
    uint64_t v34 = v53;
    char v68 = v54;
    swift_bridgeObjectRetain(a2);
    swift_bridgeObjectRetain(a3);
    sub_100067314(v16, v18, v17, v30, v28, v20, v19, v32, v21, v23, v22);
    sub_100085DBC();
    uint64_t v42 = v24;
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease(a2);
    sub_10006749C(v38, v36, v17, v30, v28, v40, v19, v32, v21, v34, v22);
    swift_bridgeObjectRelease(v41);
    sub_10006749C(v38, v36, v17, v30, v28, v40, v19, v32, v21, v34, v22);
    goto LABEL_5;
  }

  swift_errorRelease(v55);
  return 0LL;
}

uint64_t sub_100085524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v83 = a1;
  swift_errorRetain(a1);
  uint64_t v6 = sub_100005104(&qword_1000B98A0);
  if (swift_dynamicCast(&v71, &v83, v6, &type metadata for ParserError, 0LL))
  {
    uint64_t v7 = v71;
    uint64_t v8 = v72;
    uint64_t v10 = v73;
    uint64_t v9 = (uint64_t)v74;
    uint64_t v11 = a2;
    uint64_t v12 = v79;
    uint64_t v13 = (uint64_t)v80;
    char v14 = v81;
    uint64_t v84 = v11;
    uint64_t v85 = a3;
    uint64_t v15 = a3;
    uint64_t v86 = v71;
    uint64_t v87 = v72;
    unint64_t v88 = v73;
    int64_t v89 = v74;
    uint64_t v90 = v75;
    uint64_t v91 = v76;
    uint64_t v16 = v77;
    uint64_t v92 = v77;
    Swift::String v93 = (void *)v78;
    uint64_t v17 = v78;
    Swift::String v94 = v79;
    Swift::String v95 = v80;
    char v96 = v81;
    uint64_t v67 = v11;
    uint64_t v60 = v75;
    if (v81 == 7)
    {
      uint64_t v34 = v76;
      uint64_t v57 = v76;
      uint64_t v48 = v72;
      uint64_t v35 = v75;
      swift_bridgeObjectRetain(v11);
      uint64_t v63 = v15;
      swift_bridgeObjectRetain(v15);
      uint64_t v47 = (uint64_t)v12;
      uint64_t v36 = v16;
      uint64_t v37 = (uint64_t)v12;
      uint64_t v49 = (uint64_t)v12;
      uint64_t v38 = v36;
      sub_100067314(v7, v48, (uint64_t)v10, v9, v35, v34, v36, v17, v47, v13, 7);
      uint64_t v20 = sub_100086BE0(v48, v10, v9);
      swift_bridgeObjectRelease(v63);
      swift_bridgeObjectRelease(v67);
      sub_10006749C(v7, v48, (uint64_t)v10, v9, v60, v57, v38, v17, v37, v13, 7);
      sub_10006749C(v7, v48, (uint64_t)v10, v9, v60, v57, v38, v17, v49, v13, 7);
      goto LABEL_21;
    }

    if (v81 == 11)
    {
      uint64_t v39 = v76;
      uint64_t v58 = v76;
      uint64_t v53 = v73;
      uint64_t v40 = v75;
      swift_bridgeObjectRetain(v11);
      uint64_t v64 = v15;
      swift_bridgeObjectRetain(v15);
      sub_100067314(v7, v8, (uint64_t)v53, v9, v40, v39, v16, v17, (uint64_t)v12, v13, 11);
      uint64_t v20 = sub_100086DA8(v7, v8, v53);
      swift_bridgeObjectRelease(v64);
      swift_bridgeObjectRelease(v67);
      sub_10006749C(v7, v8, (uint64_t)v53, v9, v60, v58, v16, v17, (uint64_t)v12, v13, 11);
      sub_10006749C(v7, v8, (uint64_t)v53, v9, v60, v58, v16, v17, (uint64_t)v12, v13, 11);
      goto LABEL_21;
    }

    uint64_t v54 = v77;
    if (v81 == 12)
    {
      uint64_t v18 = v76;
      uint64_t v50 = v78;
      uint64_t v19 = v75;
      swift_bridgeObjectRetain(v11);
      uint64_t v62 = v15;
      swift_bridgeObjectRetain(v15);
      sub_100067314(v7, v8, (uint64_t)v10, v9, v19, v18, v16, v50, (uint64_t)v12, v13, 12);
      swift_errorRetain(v13);
      uint64_t v20 = sub_10008A9CC(v8, v10, v9, v16, v50, v12);
      swift_errorRelease(v13);
      swift_bridgeObjectRelease(v62);
      swift_bridgeObjectRelease(v67);
      sub_10006749C(v7, v8, (uint64_t)v10, v9, v60, v18, v16, v50, (uint64_t)v12, v13, 12);
      sub_10006749C(v7, v8, (uint64_t)v10, v9, v60, v18, v54, v50, (uint64_t)v12, v13, 12);
LABEL_21:
      swift_errorRelease(v83);
      return v20;
    }

    uint64_t v59 = v76;
    uint64_t v41 = v75;
    swift_bridgeObjectRetain(v11);
    swift_bridgeObjectRetain(v15);
    sub_100067314(v7, v8, (uint64_t)v10, v9, v41, v59, v54, v17, (uint64_t)v12, v13, v14);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v67);
    sub_10006749C(v7, v8, (uint64_t)v10, v9, v41, v59, v54, v17, (uint64_t)v12, v13, v14);
    sub_10006749C(v7, v8, (uint64_t)v10, v9, v60, v59, v54, v17, (uint64_t)v12, v13, v14);
LABEL_20:
    uint64_t v20 = 0LL;
    goto LABEL_21;
  }

  swift_errorRelease(v83);
  uint64_t v83 = a1;
  swift_errorRetain(a1);
  if (swift_dynamicCast(&v71, &v83, v6, &type metadata for CommandError, 0LL))
  {
    uint64_t v21 = v72;
    uint64_t v23 = (uint64_t)v73;
    char v22 = v74;
    uint64_t v24 = v75;
    uint64_t v25 = v78;
    uint64_t v26 = v80;
    uint64_t v27 = v81;
    char v28 = v82;
    uint64_t v84 = a2;
    uint64_t v85 = a3;
    uint64_t v86 = v72;
    uint64_t v87 = (uint64_t)v73;
    unint64_t v88 = v74;
    int64_t v89 = (void *)v75;
    uint64_t v90 = v76;
    uint64_t v91 = v77;
    uint64_t v92 = v78;
    Swift::String v93 = v79;
    Swift::String v94 = v80;
    Swift::String v95 = (void *)v81;
    char v96 = v82;
    uint64_t v55 = v71;
    uint64_t v56 = v77;
    uint64_t v61 = (uint64_t)v79;
    uint64_t v52 = v76;
    switch(v82)
    {
      case 7:
        uint64_t v42 = (uint64_t)v79;
        swift_bridgeObjectRetain(a2);
        uint64_t v65 = a3;
        swift_bridgeObjectRetain(a3);
        uint64_t v68 = a2;
        uint64_t v30 = v52;
        uint64_t v32 = v56;
        sub_100067314(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v42, (uint64_t)v26, v27, 7);
        uint64_t v51 = sub_100086BE0(v23, v22, v24);
        swift_bridgeObjectRelease(v65);
        swift_bridgeObjectRelease(v68);
        uint64_t v31 = v61;
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v61, (uint64_t)v26, v27, 7);
        swift_bridgeObjectRelease(v55);
        char v33 = 7;
        break;
      case 11:
        uint64_t v43 = (uint64_t)v79;
        swift_bridgeObjectRetain(a2);
        uint64_t v66 = a3;
        swift_bridgeObjectRetain(a3);
        uint64_t v69 = a2;
        uint64_t v30 = v52;
        uint64_t v32 = v56;
        sub_100067314(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v43, (uint64_t)v26, v27, 11);
        uint64_t v51 = sub_100086DA8(v21, v23, v22);
        swift_bridgeObjectRelease(v66);
        swift_bridgeObjectRelease(v69);
        uint64_t v31 = v61;
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v61, (uint64_t)v26, v27, 11);
        swift_bridgeObjectRelease(v55);
        char v33 = 11;
        break;
      case 12:
        uint64_t v29 = v77;
        swift_bridgeObjectRetain(a2);
        swift_bridgeObjectRetain(a3);
        sub_100067314(v21, v23, (uint64_t)v22, v24, v52, v29, v25, v61, (uint64_t)v26, v27, 12);
        swift_errorRetain(v27);
        uint64_t v51 = sub_10008A9CC(v23, v22, v24, v25, v61, v26);
        swift_errorRelease(v27);
        swift_bridgeObjectRelease(a3);
        swift_bridgeObjectRelease(a2);
        uint64_t v30 = v52;
        uint64_t v32 = v56;
        uint64_t v31 = v61;
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v52, v56, v25, v61, (uint64_t)v26, v27, 12);
        swift_bridgeObjectRelease(v55);
        char v33 = 12;
        break;
      default:
        uint64_t v70 = v78;
        uint64_t v45 = v76;
        swift_bridgeObjectRetain(a2);
        swift_bridgeObjectRetain(a3);
        sub_100067314(v21, v23, (uint64_t)v22, v24, v45, v56, v70, v61, (uint64_t)v26, v27, v28);
        swift_bridgeObjectRelease(a3);
        swift_bridgeObjectRelease(a2);
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v45, v56, v70, v61, (uint64_t)v26, v27, v28);
        swift_bridgeObjectRelease(v55);
        sub_10006749C(v21, v23, (uint64_t)v22, v24, v52, v56, v70, v61, (uint64_t)v26, v27, v28);
        goto LABEL_20;
    }

    uint64_t v44 = v24;
    uint64_t v20 = v51;
    sub_10006749C(v21, v23, (uint64_t)v22, v44, v30, v32, v25, v31, (uint64_t)v26, v27, v33);
    goto LABEL_21;
  }

  swift_errorRelease(v83);
  return 0LL;
}

void sub_100085DBC()
{
  __asm { BR              X10 }

uint64_t sub_100085E18()
{
  if (!v7) {
    return sub_100089454();
  }
  uint64_t v15 = v8;
  uint64_t v16 = v1;
  uint64_t v9 = v2;
  uint64_t v10 = v8;
  uint64_t v11 = v2;
  uint64_t v12 = v0;
  sub_100067314(v3, (uint64_t)v7, v4, v9, v10, v0, v17, v5, v1, v6, 3);
  uint64_t v13 = sub_10008929C(v3, v7);
  sub_10006749C(v3, (uint64_t)v7, v4, v11, v15, v12, v17, v5, v16, v6, 3);
  return v13;
}

uint64_t sub_100086728(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v7 = *v3;
  uint64_t v65 = v3[1];
  uint64_t v66 = v7;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  sub_10002AB10(&v66);
  sub_10002AB10(&v65);
  uint64_t v8 = sub_10008A29C(v7, a1, a2, a3);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a2);
  sub_10002ABC8(&v66);
  sub_10002ABC8(&v65);
  uint64_t v9 = *(void *)(v8 + 16);
  if (!v9)
  {
    swift_bridgeObjectRelease(v8);
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
    uint64_t v31 = _swiftEmptyArrayStorage[2];
    if (v31) {
      goto LABEL_17;
    }
LABEL_21:
    swift_bridgeObjectRelease(v11);
    *(void *)&__int128 v55 = 0LL;
    *((void *)&v55 + 1) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(86LL);
    v34._uint64_t countAndFlagsBits = 0xD000000000000022LL;
    v34._object = (void *)0x800000010009E040LL;
    String.append(_:)(v34);
    v35._uint64_t countAndFlagsBits = sub_10006C590(a1, a2, a3);
    object = v35._object;
    String.append(_:)(v35);
    swift_bridgeObjectRelease(object);
    unint64_t v37 = 0xD000000000000032LL;
    unint64_t v38 = 0x800000010009E070LL;
LABEL_24:
    String.append(_:)(*(Swift::String *)&v37);
    return v55;
  }

  uint64_t v44 = a1;
  uint64_t v45 = a3;
  swift_bridgeObjectRetain(v8);
  uint64_t v10 = v9 - 1;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  for (uint64_t i = 32LL; ; i += 192LL)
  {
    __int128 v13 = *(_OWORD *)(v8 + i);
    __int128 v14 = *(_OWORD *)(v8 + i + 16);
    __int128 v15 = *(_OWORD *)(v8 + i + 48);
    __int128 v57 = *(_OWORD *)(v8 + i + 32);
    *(_OWORD *)uint64_t v58 = v15;
    __int128 v55 = v13;
    __int128 v56 = v14;
    __int128 v16 = *(_OWORD *)(v8 + i + 64);
    __int128 v17 = *(_OWORD *)(v8 + i + 80);
    __int128 v18 = *(_OWORD *)(v8 + i + 112);
    __int128 v60 = *(_OWORD *)(v8 + i + 96);
    __int128 v61 = v18;
    *(_OWORD *)&v58[16] = v16;
    __int128 v59 = v17;
    __int128 v19 = *(_OWORD *)(v8 + i + 128);
    __int128 v20 = *(_OWORD *)(v8 + i + 144);
    __int128 v21 = *(_OWORD *)(v8 + i + 176);
    *(_OWORD *)&v63[16] = *(_OWORD *)(v8 + i + 160);
    __int128 v64 = v21;
    __int128 v62 = v19;
    *(_OWORD *)uint64_t v63 = v20;
    if (!BYTE8(v60))
    {
      char v22 = BYTE8(v55);
      int v23 = v63[1];
      *(void *)&v47[0] = v55;
      *((void *)&v47[0] + 1) = *((void *)&v55 + 1) & 0xFFFFFFFFFFFFFFFELL;
      v47[1] = v56;
      void v47[2] = v57;
      v48[0] = v58[0];
      *(_OWORD *)&v48[8] = *(_OWORD *)&v58[8];
      *(void *)&v48[24] = *(void *)&v58[24];
      __int128 v49 = v59;
      *(void *)&__int128 v50 = v60;
      BYTE8(v50) = 0;
      __int128 v51 = v61;
      __int128 v52 = v62;
      *(_WORD *)uint64_t v53 = *(_WORD *)v63;
      *(_OWORD *)&v53[8] = *(_OWORD *)&v63[8];
      v53[24] = v63[24];
      __int128 v54 = v64;
      __int128 v73 = v50;
      __int128 v74 = v61;
      __int128 v71 = *(_OWORD *)&v48[16];
      __int128 v72 = v59;
      __int128 v69 = v57;
      __int128 v70 = *(_OWORD *)v48;
      __int128 v67 = v47[0];
      __int128 v68 = v56;
      __int128 v77 = *(_OWORD *)&v53[16];
      __int128 v78 = v64;
      __int128 v75 = v62;
      __int128 v76 = *(_OWORD *)v53;
      sub_10002D724((uint64_t)&v55);
      sub_10002D724((uint64_t)&v55);
      v46._uint64_t countAndFlagsBits = sub_1000841B8();
      v46._object = v24;
      if ((v22 & 2) != 0)
      {
        v25._uint64_t countAndFlagsBits = 774778400LL;
        v25._object = (void *)0xE400000000000000LL;
        String.append(_:)(v25);
      }

      if (v23 == 5)
      {
        String.append(_:)(v46);
        swift_bridgeObjectRelease(v46._object);
        sub_10002D8A4((uint64_t)v47);
        sub_10002D8A4((uint64_t)&v55);
        uint64_t countAndFlagsBits = 2108717LL;
        unint64_t v27 = 0xE300000000000000LL;
      }

      else
      {
        sub_10002D8A4((uint64_t)v47);
        sub_10002D8A4((uint64_t)&v55);
        unint64_t v27 = (unint64_t)v46._object;
        uint64_t countAndFlagsBits = v46._countAndFlagsBits;
      }

      if ((swift_isUniquelyReferenced_nonNull_native(v11) & 1) == 0) {
        uint64_t v11 = sub_100057AB8(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
      }
      unint64_t v29 = *((void *)v11 + 2);
      unint64_t v28 = *((void *)v11 + 3);
      if (v29 >= v28 >> 1) {
        uint64_t v11 = sub_100057AB8((char *)(v28 > 1), v29 + 1, 1, v11);
      }
      *((void *)v11 + 2) = v29 + 1;
      uint64_t v30 = &v11[16 * v29];
      *((void *)v30 + 4) = countAndFlagsBits;
      *((void *)v30 + 5) = v27;
    }

    if (!v10) {
      break;
    }
    --v10;
  }

  swift_bridgeObjectRelease_n(v8, 2LL);
  a1 = v44;
  a3 = v45;
  uint64_t v31 = *((void *)v11 + 2);
  if (!v31) {
    goto LABEL_21;
  }
LABEL_17:
  if (v31 != 1)
  {
    *(void *)&__int128 v55 = v11;
    uint64_t v39 = sub_100005104(&qword_1000B90C8);
    uint64_t v40 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v32 = BidirectionalCollection<>.joined(separator:)(656419879LL, 0xE400000000000000LL, v39, v40);
    char v33 = v41;
    swift_bridgeObjectRelease(v11);
    *(void *)&__int128 v55 = 0LL;
    *((void *)&v55 + 1) = 0xE000000000000000LL;
    _StringGuts.grow(_:)(20LL);
    swift_bridgeObjectRelease(*((void *)&v55 + 1));
    *(void *)&__int128 v55 = 0xD000000000000011LL;
    *((void *)&v55 + 1) = 0x800000010009E000LL;
    goto LABEL_23;
  }

  *(void *)&__int128 v55 = 0LL;
  *((void *)&v55 + 1) = 0xE000000000000000LL;
  _StringGuts.grow(_:)(30LL);
  swift_bridgeObjectRelease(*((void *)&v55 + 1));
  *(void *)&__int128 v55 = 0xD00000000000001BLL;
  *((void *)&v55 + 1) = 0x800000010009E020LL;
  if (*((void *)v11 + 2))
  {
    uint64_t v32 = *((void *)v11 + 4);
    char v33 = (void *)*((void *)v11 + 5);
    swift_bridgeObjectRetain(v33);
    swift_bridgeObjectRelease(v11);
LABEL_23:
    v42._uint64_t countAndFlagsBits = v32;
    v42._object = v33;
    String.append(_:)(v42);
    swift_bridgeObjectRelease(v33);
    unint64_t v37 = 39LL;
    unint64_t v38 = 0xE100000000000000LL;
    goto LABEL_24;
  }

  uint64_t result = swift_bridgeObjectRelease(v11);
  __break(1u);
  return result;
}

uint64_t sub_100086BE0(uint64_t a1, void *a2, int a3)
{
  uint64_t v8 = *v3;
  uint64_t v7 = v3[1];
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v7);
  sub_100030508(a1, (uint64_t)a2, a3);
  sub_100083EF8(v8, v7, a1, (uint64_t)a2, a3, (uint64_t)v21);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  sub_10005BFC4((uint64_t)v21, (uint64_t)v23);
  sub_10005BFC4((uint64_t)v23, (uint64_t)v24);
  v22[8] = v30;
  v22[9] = v31;
  v22[10] = v32;
  v22[11] = v33;
  v22[4] = v26;
  v22[5] = v27;
  v22[6] = v28;
  v22[7] = v29;
  v22[0] = v24[0];
  v22[1] = v24[1];
  v22[2] = v24[2];
  _OWORD v22[3] = v25;
  uint64_t v10 = *((void *)&v25 + 1);
  uint64_t v11 = (void *)v26;
  uint64_t v12 = *((void *)&v27 + 1);
  unint64_t v13 = v28;
  swift_bridgeObjectRetain(v26);
  v34._uint64_t countAndFlagsBits = a1;
  v34._object = a2;
  v21[0] = sub_10006D63C(v34, a3);
  v21[1] = v14;
  v15._uint64_t countAndFlagsBits = 15392LL;
  v15._object = (void *)0xE200000000000000LL;
  String.append(_:)(v15);
  if ((v13 & 0x2000000000000000LL) != 0) {
    uint64_t v16 = HIBYTE(v13) & 0xF;
  }
  else {
    uint64_t v16 = v12 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain(v13);
  if (!v16)
  {
    sub_10005D218(v22, v20);
    swift_bridgeObjectRelease(v13);
    uint64_t v12 = v20[0];
    unint64_t v13 = v20[1];
  }

  v17._uint64_t countAndFlagsBits = v12;
  v17._object = (void *)v13;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v13);
  v18._uint64_t countAndFlagsBits = 2105406LL;
  v18._object = (void *)0xE300000000000000LL;
  String.append(_:)(v18);
  v19._uint64_t countAndFlagsBits = v10;
  v19._object = v11;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v11);
  sub_100033CCC((uint64_t)v23);
  return v21[0];
}

uint64_t sub_100086DA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = *v3;
  uint64_t v8 = v3[1];
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  sub_100083D50(v7, v8, a1, a2, a3, (uint64_t)v53);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  sub_10005BFC4((uint64_t)v53, (uint64_t)v68);
  sub_10005BFC4((uint64_t)v68, (uint64_t)v69);
  sub_10005BFC4((uint64_t)v68, (uint64_t)v44);
  uint64_t v40 = a1;
  uint64_t v9 = v46;
  uint64_t v39 = v45;
  uint64_t v10 = v47;
  uint64_t v11 = v49;
  uint64_t v37 = v48;
  uint64_t v12 = v50;
  uint64_t v13 = v51;
  uint64_t v14 = v52;
  swift_bridgeObjectRetain(v45);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  unint64_t v38 = v11;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  sub_100033CCC((uint64_t)v68);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v39);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  uint64_t v15 = sub_10008A29C(v7, v40, a2, a3);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(a3);
  swift_bridgeObjectRelease(a2);
  if (!*(void *)(v15 + 16))
  {
    swift_bridgeObjectRelease(v38);
    swift_bridgeObjectRelease(v15);
    return 0LL;
  }

  __int128 v16 = *(_OWORD *)(v15 + 176);
  __int128 v55 = *(_OWORD *)(v15 + 160);
  __int128 v56 = v16;
  __int128 v17 = *(_OWORD *)(v15 + 208);
  __int128 v57 = *(_OWORD *)(v15 + 192);
  __int128 v58 = v17;
  __int128 v18 = *(_OWORD *)(v15 + 112);
  *(_OWORD *)&v54[64] = *(_OWORD *)(v15 + 96);
  *(_OWORD *)&v54[80] = v18;
  __int128 v19 = *(_OWORD *)(v15 + 144);
  *(_OWORD *)&v54[96] = *(_OWORD *)(v15 + 128);
  *(_OWORD *)&v54[112] = v19;
  __int128 v20 = *(_OWORD *)(v15 + 48);
  *(_OWORD *)__int128 v54 = *(_OWORD *)(v15 + 32);
  *(_OWORD *)&v54[16] = v20;
  __int128 v21 = *(_OWORD *)(v15 + 80);
  *(_OWORD *)&v54[32] = *(_OWORD *)(v15 + 64);
  *(_OWORD *)&v54[48] = v21;
  char v22 = *(void **)v54;
  sub_10002D724((uint64_t)v54);
  swift_bridgeObjectRelease(v15);
  else {
    char v22 = _swiftEmptyArrayStorage;
  }
  __int128 v63 = *(_OWORD *)&v54[72];
  __int128 v64 = *(_OWORD *)&v54[88];
  __int128 v65 = *(_OWORD *)&v54[104];
  uint64_t v66 = *(void *)&v54[120];
  __int128 v59 = *(_OWORD *)&v54[8];
  __int128 v60 = *(_OWORD *)&v54[24];
  __int128 v61 = *(_OWORD *)&v54[40];
  __int128 v62 = *(_OWORD *)&v54[56];
  Swift::String v67 = *(Swift::String *)&v54[88];
  if (v22[2])
  {
    uint64_t v24 = v22[4];
    __int128 v25 = (void *)v22[5];
    unsigned __int8 v26 = *((_BYTE *)v22 + 48);
    sub_100030508(v24, (uint64_t)v25, v26);
    swift_bridgeObjectRelease(v22);
    v70._uint64_t countAndFlagsBits = v24;
    v70._object = v25;
    uint64_t v27 = sub_10006D63C(v70, v26);
    unint64_t v29 = v28;
    sub_10002DA24(v24, (uint64_t)v25, v26);
    uint64_t v42 = v27;
    unint64_t v43 = v29;
    v30._uint64_t countAndFlagsBits = 15392LL;
    v30._object = (void *)0xE200000000000000LL;
    String.append(_:)(v30);
    uint64_t v31 = v67._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    if (v31)
    {
      Swift::String v41 = v67;
      swift_bridgeObjectRetain(v67._object);
    }

    else
    {
      swift_bridgeObjectRetain(v67._object);
      sub_10005D218(v54, (unint64_t *)&v41);
      sub_100030564((uint64_t)&v67);
    }

    __int128 v33 = v38;
  }

  else
  {
    swift_bridgeObjectRelease(v22);
    uint64_t v42 = 60LL;
    unint64_t v43 = 0xE100000000000000LL;
    uint64_t v32 = v67._countAndFlagsBits & 0xFFFFFFFFFFFFLL;
    __int128 v33 = v38;
    if (v32)
    {
      Swift::String v41 = v67;
      swift_bridgeObjectRetain(v67._object);
    }

    else
    {
      swift_bridgeObjectRetain(v67._object);
      sub_10005D218(v54, (unint64_t *)&v41);
      sub_100030564((uint64_t)&v67);
    }
  }

  object = v41._object;
  String.append(_:)(v41);
  swift_bridgeObjectRelease(object);
  v35._uint64_t countAndFlagsBits = 2105406LL;
  v35._object = (void *)0xE300000000000000LL;
  String.append(_:)(v35);
  v36._uint64_t countAndFlagsBits = v37;
  v36._object = v33;
  String.append(_:)(v36);
  swift_bridgeObjectRelease(v33);
  sub_10002D8A4((uint64_t)v54);
  return v42;
}

unint64_t sub_100087188(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v8 = *v3;
  uint64_t v7 = v3[1];
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v7);
  sub_100030508(a1, a2, a3);
  sub_100083EF8(v8, v7, a1, a2, a3, (uint64_t)v22);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  sub_10005BFC4((uint64_t)v22, (uint64_t)v24);
  sub_10005BFC4((uint64_t)v24, (uint64_t)v25);
  uint64_t v9 = 0LL;
  if (sub_100033CB4((uint64_t)v25) != 1)
  {
    sub_10005BFC4((uint64_t)v24, (uint64_t)v14);
    uint64_t v9 = *((void *)&v15 + 1);
    uint64_t v10 = v16;
    if ((v16 & 0x2000000000000000LL) != 0) {
      unint64_t v11 = BYTE7(v16) & 0xF;
    }
    else {
      unint64_t v11 = *((void *)&v15 + 1) & 0xFFFFFFFFFFFFLL;
    }
    v23[8] = v18;
    v23[9] = v19;
    v23[10] = v20;
    v23[11] = v21;
    v23[4] = v14[4];
    v23[5] = v15;
    v23[6] = v16;
    v23[7] = v17;
    v23[0] = v14[0];
    v23[1] = v14[1];
    v23[2] = v14[2];
    _OWORD v23[3] = v14[3];
    swift_bridgeObjectRetain(v16);
    if (v11)
    {
      sub_100033CCC((uint64_t)v24);
    }

    else
    {
      sub_10005D218(v23, &v13);
      swift_bridgeObjectRelease(v10);
      sub_100033CCC((uint64_t)v24);
      return v13;
    }
  }

  return v9;
}

void sub_1000872F4(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v8 = String.count.getter(a3, a4);
  uint64_t v109 = a1;
  unint64_t v111 = a2;
  uint64_t v9 = String.count.getter(a1, a2);
  if (v8 < 1 || v9 < 1) {
    return;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v10 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v10 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if ((a4 & 0x2000000000000000LL) != 0) {
    uint64_t v11 = HIBYTE(a4) & 0xF;
  }
  else {
    uint64_t v11 = v5 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v103 = 4 * v11;
  unint64_t v105 = 4 * v10;
  uint64_t v107 = v5;
  unint64_t v12 = 0LL;
  if (!v11)
  {
    int v23 = 0;
LABEL_22:
    unint64_t v13 = 15LL;
    unint64_t v14 = 15LL;
    goto LABEL_25;
  }

  if (!v10)
  {
    int v23 = 1;
    goto LABEL_22;
  }

  unint64_t v13 = 15LL;
  unint64_t v14 = 15LL;
  while (1)
  {
    swift_bridgeObjectRetain(a4);
    uint64_t v15 = String.subscript.getter(v14, v5, a4);
    uint64_t v17 = v16;
    uint64_t v19 = String.subscript.getter(v13, v109, v111);
    uint64_t v20 = v18;
    if (v15 == v19 && v17 == v18)
    {
      swift_bridgeObjectRelease(a4);
      swift_bridgeObjectRelease_n(v17, 2LL);
      goto LABEL_16;
    }

    char v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v17, v19, v18, 0LL);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v20);
    if ((v21 & 1) == 0) {
      break;
    }
LABEL_16:
    uint64_t v5 = v107;
    unint64_t v14 = String.index(after:)(v14, v107, a4);
    unint64_t v22 = String.index(after:)(v13, v109, v111);
    unint64_t v13 = v22;
    unint64_t v12 = v14 >> 14;
    if (v14 >> 14 >= v103)
    {
      int v23 = 0;
      goto LABEL_25;
    }

    if (v105 <= v22 >> 14)
    {
      int v23 = 1;
      goto LABEL_25;
    }
  }

  int v23 = 1;
  uint64_t v5 = v107;
LABEL_25:
  uint64_t v24 = 7LL;
  if (((a4 >> 60) & ((v5 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v25 = 11LL;
  }
  else {
    uint64_t v25 = 7LL;
  }
  unint64_t v26 = v25 | (v11 << 16);
  if (((v111 >> 60) & ((v109 & 0x800000000000000LL) == 0)) != 0) {
    uint64_t v24 = 11LL;
  }
  unint64_t v27 = v24 | (v10 << 16);
  unint64_t v28 = v13 >> 14;
  if (v23 && v28 < v105)
  {
    uint64_t v97 = v25 | (v11 << 16);
    uint64_t v29 = String.index(before:)(v26, v5, a4);
    unint64_t v100 = v27;
    unint64_t v30 = String.index(before:)(v27, v109, v111);
    unint64_t v94 = v29;
    uint64_t v31 = String.subscript.getter(v29, v5, a4);
    uint64_t v33 = v32;
    uint64_t v35 = String.subscript.getter(v30, v109, v111);
    uint64_t v36 = v34;
    if (v31 == v35 && v33 == v34)
    {
      swift_bridgeObjectRelease_n(v33, 2LL);
      unint64_t v28 = v13 >> 14;
LABEL_36:
      unint64_t v26 = v94;
      if (v12 >= v94 >> 14)
      {
        unint64_t v27 = v30;
      }

      else
      {
        unint64_t v27 = v30;
        if (v28 < v30 >> 14)
        {
          while (1)
          {
            unint64_t v98 = v26;
            unint64_t v38 = String.index(before:)(v26, v5, a4);
            unint64_t v101 = v27;
            unint64_t v39 = String.index(before:)(v27, v109, v111);
            uint64_t v40 = String.subscript.getter(v38, v5, a4);
            uint64_t v42 = v41;
            uint64_t v44 = String.subscript.getter(v39, v109, v111);
            uint64_t v45 = v43;
            if (v40 != v44) {
              goto LABEL_41;
            }
            if (v42 == v43)
            {
              swift_bridgeObjectRelease_n(v42, 2LL);
              uint64_t v5 = v107;
              unint64_t v28 = v13 >> 14;
            }

            else
            {
LABEL_41:
              char v46 = _stringCompareWithSmolCheck(_:_:expecting:)(v40, v42, v44, v43, 0LL);
              swift_bridgeObjectRelease(v42);
              swift_bridgeObjectRelease(v45);
              uint64_t v5 = v107;
              unint64_t v28 = v13 >> 14;
              unint64_t v26 = v98;
              unint64_t v27 = v101;
              if ((v46 & 1) == 0) {
                goto LABEL_47;
              }
            }

            if (v12 >= v38 >> 14) {
              break;
            }
            unint64_t v27 = v39;
            unint64_t v26 = v38;
            if (v28 >= v39 >> 14) {
              goto LABEL_47;
            }
          }

          unint64_t v27 = v39;
          unint64_t v26 = v38;
        }
      }
    }

    else
    {
      char v37 = _stringCompareWithSmolCheck(_:_:expecting:)(v31, v33, v35, v34, 0LL);
      swift_bridgeObjectRelease(v33);
      swift_bridgeObjectRelease(v36);
      unint64_t v28 = v13 >> 14;
      unint64_t v26 = v97;
      unint64_t v27 = v100;
      if ((v37 & 1) != 0) {
        goto LABEL_36;
      }
    }
  }

uint64_t sub_100087B00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = swift_bridgeObjectRetain(a1);
  uint64_t v5 = (char *)sub_10004FC04(v4);
  swift_bridgeObjectRelease(a1);
  uint64_t v26 = (uint64_t)v5;
  swift_retain(v5);
  sub_100088394((char **)&v26);
  swift_release(v5);
  if (*(void *)(v26 + 16))
  {
    unint64_t v6 = *(void *)(v26 + 32);
    uint64_t v7 = *(void *)(v26 + 40);
    char v8 = *(_BYTE *)(v26 + 48);
    char v9 = *(_BYTE *)(v26 + 49);
    swift_release(v26);
    if ((v9 & 1) == 0)
    {
      uint64_t v26 = 39LL;
      unint64_t v27 = 0xE100000000000000LL;
      if ((v6 & 0x8000000000000000LL) != 0)
      {
        __break(1u);
      }

      else if (v6 < *(void *)(a2 + 16))
      {
        uint64_t v10 = a2 + 16 * v6;
        uint64_t v11 = *(void *)(v10 + 32);
        unint64_t v12 = *(void **)(v10 + 40);
        swift_bridgeObjectRetain(v12);
        v13._uint64_t countAndFlagsBits = v11;
        v13._object = v12;
        String.append(_:)(v13);
        swift_bridgeObjectRelease(v12);
        v14._uint64_t countAndFlagsBits = 39LL;
        v14._object = (void *)0xE100000000000000LL;
        String.append(_:)(v14);
        uint64_t v16 = (char *)v26;
        uint64_t v15 = (void *)v27;
        if ((v8 & 1) != 0)
        {
LABEL_8:
          uint64_t v26 = 0x2067616C66LL;
          unint64_t v27 = 0xE500000000000000LL;
          v24._uint64_t countAndFlagsBits = (uint64_t)v16;
          v24._object = v15;
          String.append(_:)(v24);
          swift_bridgeObjectRelease(v15);
          return v26;
        }

        if (!__OFADD__(v7, 2LL))
        {
          uint64_t v17 = String.index(_:offsetBy:)(15LL, v7 + 2, v26, v27);
          uint64_t v26 = 0LL;
          unint64_t v27 = 0xE000000000000000LL;
          v18._uint64_t countAndFlagsBits = 39LL;
          v18._object = (void *)0xE100000000000000LL;
          String.append(_:)(v18);
          uint64_t v19 = String.subscript.getter(v17, v16, v15);
          uint64_t v21 = v20;
          Character.write<A>(to:)( &v26,  v19,  v20,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
          swift_bridgeObjectRelease(v21);
          v22._uint64_t countAndFlagsBits = 0x206E692027LL;
          v22._object = (void *)0xE500000000000000LL;
          String.append(_:)(v22);
          v23._uint64_t countAndFlagsBits = (uint64_t)v16;
          v23._object = v15;
          String.append(_:)(v23);
          swift_bridgeObjectRelease(v15);
          uint64_t v16 = (char *)v26;
          uint64_t v15 = (void *)v27;
          goto LABEL_8;
        }

        goto LABEL_14;
      }

      __break(1u);
LABEL_14:
      __break(1u);
      uint64_t result = swift_release(v26);
      __break(1u);
      return result;
    }
  }

  else
  {
    swift_release(v26);
  }

  return 0LL;
}

uint64_t sub_100087CEC(uint64_t a1, uint64_t a2)
{
  if (!a1)
  {
    sub_10005BFC4(a2, (uint64_t)&v18);
    v30[8] = v26;
    v30[9] = v27;
    v30[10] = v28;
    v30[11] = v29;
    v30[4] = v22;
    v30[5] = v23;
    _OWORD v30[6] = v24;
    v30[7] = v25;
    v30[0] = v18;
    v30[1] = v19;
    _OWORD v30[2] = v20;
    v30[3] = v21;
    return sub_100087EDC();
  }

  uint64_t v17 = a1;
  swift_errorRetain(a1);
  uint64_t v3 = sub_100005104(&qword_1000B98A0);
  uint64_t v4 = sub_100005104(&qword_1000B9E78);
  sub_100045320(v30, (uint64_t)&v18);
  uint64_t v5 = *((void *)&v19 + 1);
  uint64_t v6 = v20;
  sub_100006270(&v18, *((uint64_t *)&v19 + 1));
  dispatch thunk of LocalizedError.errorDescription.getter(v5, v6);
  uint64_t v8 = v7;
  swift_bridgeObjectRelease(v7);
  if (!v8)
  {
    sub_1000062D8(&v18);
LABEL_10:
    swift_errorRelease(v17);
    *(void *)&v30[0] = a1;
    swift_errorRetain(a1);
    swift_errorRetain(a1);
    v15._uint64_t countAndFlagsBits = String.init<A>(describing:)(v30, v3);
    object = v15._object;
    *(void *)&v30[0] = 8250LL;
    *((void *)&v30[0] + 1) = 0xE200000000000000LL;
    String.append(_:)(v15);
    swift_bridgeObjectRelease(object);
    swift_errorRelease(a1);
    return *(void *)&v30[0];
  }

  uint64_t v9 = *((void *)&v19 + 1);
  uint64_t v10 = v20;
  sub_100006270(&v18, *((uint64_t *)&v19 + 1));
  uint64_t result = dispatch thunk of LocalizedError.errorDescription.getter(v9, v10);
  if (v12)
  {
    uint64_t v13 = v12;
    String.append(_:)(*(Swift::String *)&result);
    swift_bridgeObjectRelease(v13);
    uint64_t v14 = 8250LL;
    sub_1000062D8(&v18);
    swift_errorRelease(v17);
    return v14;
  }

  __break(1u);
  return result;
}

uint64_t sub_100087EDC()
{
  uint64_t v1 = *(void *)(v0 + 40);
  uint64_t v43 = v1;
  unint64_t v2 = *(void *)(v1 + 16);
  if (!v2) {
    return 0LL;
  }
  if (v2 > 5)
  {
    swift_bridgeObjectRetain(v1);
    sub_10004FDF4(0LL, v2, 0);
    uint64_t v12 = (void *)(v1 + 40);
    do
    {
      uint64_t v13 = *(v12 - 1);
      uint64_t v14 = (void *)*v12;
      swift_bridgeObjectRetain(*v12);
      v15._uint64_t countAndFlagsBits = v13;
      v15._object = v14;
      String.append(_:)(v15);
      swift_bridgeObjectRelease(v14);
      unint64_t v17 = _swiftEmptyArrayStorage[2];
      unint64_t v16 = _swiftEmptyArrayStorage[3];
      if (v17 >= v16 >> 1) {
        sub_10004FDF4((char *)(v16 > 1), v17 + 1, 1);
      }
      v12 += 2;
      _swiftEmptyArrayStorage[2] = v17 + 1;
      __int128 v18 = &_swiftEmptyArrayStorage[2 * v17];
      void v18[4] = 539828256LL;
      v18[5] = 0xE400000000000000LL;
      --v2;
    }

    while (v2);
    sub_10002ABC8(&v43);
    uint64_t v31 = sub_100005104(&qword_1000B90C8);
    uint64_t v32 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v33 = BidirectionalCollection<>.joined(separator:)(10LL, 0xE100000000000000LL, v31, v32);
    uint64_t v35 = v34;
    swift_release(_swiftEmptyArrayStorage);
    _StringGuts.grow(_:)(41LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    unint64_t v42 = 0xD000000000000027LL;
    v36._uint64_t countAndFlagsBits = v33;
    v36._object = v35;
    String.append(_:)(v36);
    swift_bridgeObjectRelease(v35);
    return v42;
  }

  swift_bridgeObjectRetain(v1);
  sub_10004FDF4(0LL, v2, 0);
  uint64_t v3 = (void *)(v1 + 40);
  do
  {
    uint64_t v4 = *(v3 - 1);
    uint64_t v5 = (void *)*v3;
    swift_bridgeObjectRetain(*v3);
    v6._uint64_t countAndFlagsBits = v4;
    v6._object = v5;
    String.append(_:)(v6);
    v7._uint64_t countAndFlagsBits = 39LL;
    v7._object = (void *)0xE100000000000000LL;
    String.append(_:)(v7);
    swift_bridgeObjectRelease(v5);
    unint64_t v9 = _swiftEmptyArrayStorage[2];
    unint64_t v8 = _swiftEmptyArrayStorage[3];
    if (v9 >= v8 >> 1) {
      sub_10004FDF4((char *)(v8 > 1), v9 + 1, 1);
    }
    v3 += 2;
    _swiftEmptyArrayStorage[2] = v9 + 1;
    uint64_t v10 = &_swiftEmptyArrayStorage[2 * v9 + 4];
    *uint64_t v10 = 39LL;
    v10[1] = 0xE100000000000000LL;
    --v2;
  }

  while (v2);
  sub_10002ABC8(&v43);
  if (_swiftEmptyArrayStorage[2] <= 2uLL)
  {
    uint64_t v37 = sub_100005104(&qword_1000B90C8);
    uint64_t v38 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
    uint64_t v22 = BidirectionalCollection<>.joined(separator:)(0x20646E6120LL, 0xE500000000000000LL, v37, v38);
    __int128 v24 = v39;
    swift_release(_swiftEmptyArrayStorage);
    goto LABEL_18;
  }

  uint64_t v19 = sub_10007822C(1LL, (uint64_t)_swiftEmptyArrayStorage);
  swift_bridgeObjectRetain(_swiftEmptyArrayStorage);
  uint64_t v20 = sub_100005104(&qword_1000B9130);
  uint64_t v21 = sub_1000062F8(&qword_1000B9138, &qword_1000B9130, (uint64_t)&protocol conformance descriptor for ArraySlice<A>);
  uint64_t v22 = BidirectionalCollection<>.joined(separator:)(8236LL, 0xE200000000000000LL, v20, v21);
  __int128 v24 = v23;
  swift_unknownObjectRelease(v19);
  uint64_t v25 = _swiftEmptyArrayStorage[2];
  if (v25)
  {
    __int128 v26 = &_swiftEmptyArrayStorage[2 * v25 + 4];
    uint64_t v27 = *(v26 - 2);
    __int128 v28 = (void *)*(v26 - 1);
    swift_bridgeObjectRetain(v28);
    swift_release(_swiftEmptyArrayStorage);
    v29._uint64_t countAndFlagsBits = v27;
    v29._object = v28;
    String.append(_:)(v29);
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRetain(v24);
    v30._uint64_t countAndFlagsBits = 544370464LL;
    v30._object = (void *)0xE400000000000000LL;
    String.append(_:)(v30);
    swift_bridgeObjectRelease(v24);
    swift_bridgeObjectRelease(0xE400000000000000LL);
LABEL_18:
    _StringGuts.grow(_:)(27LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    unint64_t v42 = 0xD000000000000018LL;
    v40._uint64_t countAndFlagsBits = v22;
    v40._object = v24;
    String.append(_:)(v40);
    swift_bridgeObjectRelease(v24);
    v41._uint64_t countAndFlagsBits = 46LL;
    v41._object = (void *)0xE100000000000000LL;
    String.append(_:)(v41);
    return v42;
  }

  uint64_t result = swift_release(_swiftEmptyArrayStorage);
  __break(1u);
  return result;
}

uint64_t sub_100088348(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v1 = result;
    if (result)
    {
      uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)( result,  &type metadata for InputOrigin.Element);
      *(void *)(result + 16) = v1;
    }

    else
    {
      return (uint64_t)_swiftEmptyArrayStorage;
    }
  }

  return result;
}

uint64_t sub_100088394(char **a1)
{
  unint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    unint64_t v2 = sub_10007F178((uint64_t)v2);
  }
  uint64_t v3 = *((void *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  uint64_t result = sub_1000883FC(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1000883FC(uint64_t *a1)
{
  unint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  uint64_t result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_169;
    }
    if (v3) {
      return sub_100088B40(0LL, v3, 1LL, v2);
    }
    return result;
  }

  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_168;
  }
  uint64_t v6 = result;
  if (v3 <= 1)
  {
    unint64_t v8 = (char *)_swiftEmptyArrayStorage;
    unint64_t v100 = (char *)&_swiftEmptyArrayStorage[4];
    uint64_t v96 = _swiftEmptyArrayStorage;
    if (v3 != 1)
    {
      unint64_t v11 = _swiftEmptyArrayStorage[2];
      if (v11 < 2) {
        goto LABEL_146;
      }
      goto LABEL_134;
    }
  }

  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t result = static Array._allocateBufferUninitialized(minimumCapacity:)( v5 >> 1,  &type metadata for InputOrigin.Element);
    *(void *)(result + 16) = v7;
    uint64_t v96 = (void *)result;
    unint64_t v100 = (char *)(result + 32);
  }

  Swift::Int v9 = 0LL;
  Swift::String v95 = v2;
  uint64_t v10 = *v2;
  unint64_t v8 = (char *)_swiftEmptyArrayStorage;
  uint64_t v97 = v6;
  Swift::Int v98 = v3;
  while (2)
  {
    Swift::Int v12 = v9 + 1;
    if (v9 + 1 >= v3) {
      goto LABEL_53;
    }
    uint64_t v13 = v10 + 24 * v12;
    if ((*(_BYTE *)(v13 + 17) & 1) != 0) {
      goto LABEL_17;
    }
    uint64_t v16 = v10 + 24 * v9;
    if ((*(_BYTE *)(v16 + 17) & 1) == 0 && *(void *)v13 >= *(void *)v16)
    {
      if (*(void *)v13 == *(void *)v16)
      {
        if ((*(_BYTE *)(v13 + 16) & 1) != 0)
        {
          if ((*(_BYTE *)(v16 + 16) & 1) == 0) {
            goto LABEL_21;
          }
        }

        else if ((*(_BYTE *)(v16 + 16) & 1) == 0 && *(void *)(v13 + 8) < *(void *)(v16 + 8))
        {
          goto LABEL_21;
        }
      }

LABEL_52:
    Swift::Int v12 = v14;
LABEL_53:
    if (v12 >= v3) {
      goto LABEL_62;
    }
    if (__OFSUB__(v12, v9)) {
      goto LABEL_167;
    }
    if (v12 - v9 >= v6)
    {
LABEL_62:
      Swift::Int v17 = v12;
      goto LABEL_63;
    }

    if (__OFADD__(v9, v6)) {
      goto LABEL_171;
    }
    if (v9 + v6 >= v3) {
      Swift::Int v17 = v3;
    }
    else {
      Swift::Int v17 = v9 + v6;
    }
    if (v17 >= v9)
    {
      if (v12 == v17) {
        goto LABEL_62;
      }
      uint64_t v80 = v10 - 24 + 24 * v12;
      do
      {
        Swift::Int v81 = v9;
        uint64_t v82 = v80;
        do
        {
          if ((*(_BYTE *)(v82 + 41) & 1) != 0) {
            break;
          }
          uint64_t v83 = v82 + 24;
          uint64_t v84 = *(void *)(v82 + 24);
          uint64_t v85 = *(void *)(v82 + 32);
          char v86 = *(_BYTE *)(v82 + 40);
          if ((*(_BYTE *)(v82 + 17) & 1) == 0 && v84 >= *(void *)v82)
          {
            if (v84 != *(void *)v82) {
              break;
            }
            if ((*(_BYTE *)(v82 + 40) & 1) != 0)
            {
              if ((*(_BYTE *)(v82 + 16) & 1) != 0) {
                break;
              }
            }

            else if ((*(_BYTE *)(v82 + 16) & 1) != 0 || v85 >= *(void *)(v82 + 8))
            {
              break;
            }
          }

          if (!v10) {
            goto LABEL_173;
          }
          __int128 v87 = *(_OWORD *)v82;
          uint64_t v88 = *(void *)(v82 + 16);
          *(void *)uint64_t v82 = v84;
          *(void *)(v82 + 8) = v85;
          *(_BYTE *)(v82 + 16) = v86;
          *(_BYTE *)(v82 + 17) = 0;
          v82 -= 24LL;
          *(_OWORD *)uint64_t v83 = v87;
          *(void *)(v83 + 16) = v88;
          ++v81;
        }

        while (v12 != v81);
        ++v12;
        v80 += 24LL;
      }

      while (v12 != v17);
LABEL_63:
      if (v17 < v9) {
        goto LABEL_162;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native(v8);
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10007F058(0LL, *((void *)v8 + 2) + 1LL, 1, v8);
        unint64_t v8 = (char *)result;
      }

      unint64_t v32 = *((void *)v8 + 2);
      unint64_t v31 = *((void *)v8 + 3);
      unint64_t v11 = v32 + 1;
      Swift::Int v99 = v17;
      if (v32 >= v31 >> 1)
      {
        uint64_t result = (uint64_t)sub_10007F058((char *)(v31 > 1), v32 + 1, 1, v8);
        unint64_t v8 = (char *)result;
      }

      *((void *)v8 + 2) = v11;
      uint64_t v33 = v8 + 32;
      uint64_t v34 = &v8[16 * v32 + 32];
      *(void *)uint64_t v34 = v9;
      *((void *)v34 + 1) = v99;
      if (v32)
      {
        while (2)
        {
          unint64_t v35 = v11 - 1;
          if (v11 >= 4)
          {
            Swift::String v40 = &v33[2 * v11];
            uint64_t v41 = *(v40 - 8);
            uint64_t v42 = *(v40 - 7);
            BOOL v46 = __OFSUB__(v42, v41);
            uint64_t v43 = v42 - v41;
            if (v46) {
              goto LABEL_151;
            }
            uint64_t v45 = *(v40 - 6);
            uint64_t v44 = *(v40 - 5);
            BOOL v46 = __OFSUB__(v44, v45);
            uint64_t v38 = v44 - v45;
            char v39 = v46;
            if (v46) {
              goto LABEL_152;
            }
            unint64_t v47 = v11 - 2;
            uint64_t v48 = &v33[2 * v11 - 4];
            uint64_t v50 = *v48;
            uint64_t v49 = v48[1];
            BOOL v46 = __OFSUB__(v49, v50);
            uint64_t v51 = v49 - v50;
            if (v46) {
              goto LABEL_153;
            }
            BOOL v46 = __OFADD__(v38, v51);
            uint64_t v52 = v38 + v51;
            if (v46) {
              goto LABEL_155;
            }
            if (v52 >= v43)
            {
              Swift::String v70 = &v33[2 * v35];
              uint64_t v72 = *v70;
              uint64_t v71 = v70[1];
              BOOL v46 = __OFSUB__(v71, v72);
              uint64_t v73 = v71 - v72;
              if (v46) {
                goto LABEL_161;
              }
              BOOL v63 = v38 < v73;
            }

            else
            {
LABEL_82:
              if ((v39 & 1) != 0) {
                goto LABEL_154;
              }
              unint64_t v47 = v11 - 2;
              uint64_t v53 = &v33[2 * v11 - 4];
              uint64_t v55 = *v53;
              uint64_t v54 = v53[1];
              BOOL v56 = __OFSUB__(v54, v55);
              uint64_t v57 = v54 - v55;
              char v58 = v56;
              if (v56) {
                goto LABEL_156;
              }
              uint64_t v59 = &v33[2 * v35];
              uint64_t v61 = *v59;
              uint64_t v60 = v59[1];
              BOOL v46 = __OFSUB__(v60, v61);
              uint64_t v62 = v60 - v61;
              if (v46) {
                goto LABEL_158;
              }
              if (__OFADD__(v57, v62)) {
                goto LABEL_160;
              }
              if (v57 + v62 < v38) {
                goto LABEL_94;
              }
              BOOL v63 = v38 < v62;
            }

            if (v63) {
              unint64_t v35 = v47;
            }
          }

          else
          {
            if (v11 == 3)
            {
              uint64_t v37 = *((void *)v8 + 4);
              uint64_t v36 = *((void *)v8 + 5);
              BOOL v46 = __OFSUB__(v36, v37);
              uint64_t v38 = v36 - v37;
              char v39 = v46;
              goto LABEL_82;
            }

            uint64_t v64 = *((void *)v8 + 4);
            uint64_t v65 = *((void *)v8 + 5);
            BOOL v46 = __OFSUB__(v65, v64);
            uint64_t v57 = v65 - v64;
            char v58 = v46;
LABEL_94:
            if ((v58 & 1) != 0) {
              goto LABEL_157;
            }
            uint64_t v66 = &v33[2 * v35];
            uint64_t v68 = *v66;
            uint64_t v67 = v66[1];
            BOOL v46 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v46) {
              goto LABEL_159;
            }
            if (v69 < v57) {
              goto LABEL_14;
            }
          }

          unint64_t v74 = v35 - 1;
          if (v35 - 1 >= v11)
          {
            __break(1u);
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
LABEL_169:
            __break(1u);
LABEL_170:
            __break(1u);
LABEL_171:
            __break(1u);
            goto LABEL_172;
          }

          if (!v10) {
            goto LABEL_174;
          }
          uint64_t v75 = &v33[2 * v74];
          uint64_t v76 = *v75;
          uint64_t v77 = &v33[2 * v35];
          uint64_t v78 = v77[1];
          uint64_t result = sub_100088C00((char *)(v10 + 24 * *v75), (char *)(v10 + 24LL * *v77), v10 + 24 * v78, v100);
          if (v1) {
            goto LABEL_146;
          }
          if (v78 < v76) {
            goto LABEL_148;
          }
          if (v35 > *((void *)v8 + 2)) {
            goto LABEL_149;
          }
          *uint64_t v75 = v76;
          v33[2 * v74 + 1] = v78;
          unint64_t v79 = *((void *)v8 + 2);
          if (v35 >= v79) {
            goto LABEL_150;
          }
          unint64_t v11 = v79 - 1;
          uint64_t result = (uint64_t)memmove(&v33[2 * v35], v77 + 2, 16 * (v79 - 1 - v35));
          *((void *)v8 + 2) = v79 - 1;
          if (v79 <= 2) {
            goto LABEL_14;
          }
          continue;
        }
      }

      unint64_t v11 = 1LL;
LABEL_14:
      Swift::Int v3 = v98;
      Swift::Int v9 = v99;
      uint64_t v6 = v97;
      if (v99 >= v98)
      {
        unint64_t v2 = v95;
        if (v11 < 2)
        {
LABEL_146:
          swift_bridgeObjectRelease(v8);
          v96[2] = 0LL;
          return swift_bridgeObjectRelease(v96);
        }

LABEL_134:
        uint64_t v89 = *v2;
        while (1)
        {
          unint64_t v90 = v11 - 2;
          if (v11 < 2) {
            goto LABEL_163;
          }
          if (!v89) {
            goto LABEL_176;
          }
          uint64_t v91 = *(void *)&v8[16 * v90 + 32];
          uint64_t v92 = *(void *)&v8[16 * v11 + 24];
          uint64_t result = sub_100088C00( (char *)(v89 + 24 * v91),  (char *)(v89 + 24LL * *(void *)&v8[16 * v11 + 16]),  v89 + 24 * v92,  v100);
          if (v1) {
            goto LABEL_146;
          }
          if (v92 < v91) {
            goto LABEL_164;
          }
          uint64_t result = swift_isUniquelyReferenced_nonNull_native(v8);
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_10007F150((uint64_t)v8);
            unint64_t v8 = (char *)result;
          }

          if (v90 >= *((void *)v8 + 2)) {
            goto LABEL_165;
          }
          uint64_t v93 = &v8[16 * v90 + 32];
          *(void *)uint64_t v93 = v91;
          *((void *)v93 + 1) = v92;
          unint64_t v94 = *((void *)v8 + 2);
          if (v11 > v94) {
            goto LABEL_166;
          }
          uint64_t result = (uint64_t)memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v94 - v11));
          *((void *)v8 + 2) = v94 - 1;
          unint64_t v11 = v94 - 1;
          if (v94 <= 2) {
            goto LABEL_146;
          }
        }
      }

      continue;
    }

    break;
  }

LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
  return result;
}

uint64_t sub_100088B40(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = *a4;
    uint64_t v5 = *a4 + 24 * a3 - 24;
LABEL_5:
    uint64_t v6 = result;
    uint64_t v7 = v5;
    while (1)
    {
      if ((*(_BYTE *)(v7 + 41) & 1) != 0)
      {
LABEL_4:
        ++a3;
        v5 += 24LL;
        if (a3 == a2) {
          return result;
        }
        goto LABEL_5;
      }

      uint64_t v8 = v7 + 24;
      uint64_t v9 = *(void *)(v7 + 24);
      uint64_t v10 = *(void *)(v7 + 32);
      char v11 = *(_BYTE *)(v7 + 40);
      if ((*(_BYTE *)(v7 + 17) & 1) == 0 && v9 >= *(void *)v7)
      {
        if (v9 != *(void *)v7) {
          goto LABEL_4;
        }
        if ((*(_BYTE *)(v7 + 40) & 1) != 0)
        {
          if ((*(_BYTE *)(v7 + 16) & 1) != 0) {
            goto LABEL_4;
          }
        }

        else if ((*(_BYTE *)(v7 + 16) & 1) != 0 || v10 >= *(void *)(v7 + 8))
        {
          goto LABEL_4;
        }
      }

      if (!v4) {
        break;
      }
      __int128 v12 = *(_OWORD *)v7;
      uint64_t v13 = *(void *)(v7 + 16);
      *(void *)uint64_t v7 = v9;
      *(void *)(v7 + 8) = v10;
      *(_BYTE *)(v7 + 16) = v11;
      *(_BYTE *)(v7 + 17) = 0;
      v7 -= 24LL;
      *(_OWORD *)uint64_t v8 = v12;
      *(void *)(v8 + 16) = v13;
      if (a3 == ++v6) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_100088C00(char *__src, char *__dst, unint64_t a3, char *a4)
{
  uint64_t v4 = a4;
  uint64_t v6 = __dst;
  uint64_t v7 = __src;
  int64_t v8 = __dst - __src;
  int64_t v9 = (__dst - __src) / 24;
  uint64_t v10 = a3 - (void)__dst;
  uint64_t v11 = (uint64_t)(a3 - (void)__dst) / 24;
  if (v9 >= v11)
  {
    uint64_t v17 = 24 * v11;
    if (a4 != __dst || &__dst[v17] <= a4) {
      memmove(a4, __dst, 24 * v11);
    }
    uint64_t v13 = &v4[v17];
    if (v7 >= v6 || v10 < 24) {
      goto LABEL_56;
    }
    unint64_t v18 = a3 - 24;
    while (1)
    {
      uint64_t v19 = (char *)(v18 + 24);
      uint64_t v20 = *((void *)v13 - 3);
      if ((*(v13 - 7) & 1) != 0) {
        break;
      }
      uint64_t v21 = v6 - 24;
      uint64_t v23 = *((void *)v6 - 3);
      if ((*(v6 - 7) & 1) == 0 && v20 >= v23)
      {
        if (v20 != v23) {
          break;
        }
        if ((*(v13 - 8) & 1) != 0)
        {
          if ((*(v6 - 8) & 1) != 0) {
            break;
          }
        }

        else if ((*(v6 - 8) & 1) != 0 || *((void *)v13 - 2) >= *((void *)v6 - 2))
        {
          break;
        }
      }

      if (v19 != v6)
      {
        v6 -= 24;
        goto LABEL_49;
      }

      BOOL v22 = v18 >= (unint64_t)v6;
      v6 -= 24;
      if (v22) {
        goto LABEL_49;
      }
LABEL_50:
      if (v6 > v7)
      {
        v18 -= 24LL;
        if (v13 > v4) {
          continue;
        }
      }

      goto LABEL_56;
    }

    uint64_t v21 = v13 - 24;
    if (v19 != v13)
    {
      v13 -= 24;
LABEL_49:
      __int128 v24 = *(_OWORD *)v21;
      *(void *)(v18 + 16) = *((void *)v21 + 2);
      *(_OWORD *)unint64_t v18 = v24;
      goto LABEL_50;
    }

    BOOL v22 = v18 >= (unint64_t)v13;
    v13 -= 24;
    if (v22) {
      goto LABEL_49;
    }
    goto LABEL_50;
  }

  size_t v12 = 24 * v9;
  if (a4 != __src || &__src[v12] <= a4) {
    memmove(a4, __src, v12);
  }
  uint64_t v13 = &v4[v12];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while ((v6[17] & 1) == 0)
    {
      if ((v4[17] & 1) == 0 && *(void *)v6 >= *(void *)v4)
      {
        if (*(void *)v6 != *(void *)v4) {
          break;
        }
        if ((v6[16] & 1) != 0)
        {
          if ((v4[16] & 1) != 0) {
            break;
          }
        }

        else if ((v4[16] & 1) != 0 || *((void *)v6 + 1) >= *((void *)v4 + 1))
        {
          break;
        }
      }

      Swift::Int v14 = v6;
      BOOL v15 = v7 == v6;
      v6 += 24;
      if (!v15) {
        goto LABEL_9;
      }
LABEL_10:
      v7 += 24;
    }

    Swift::Int v14 = v4;
    BOOL v15 = v7 == v4;
    v4 += 24;
    if (v15) {
      goto LABEL_10;
    }
LABEL_9:
    __int128 v16 = *(_OWORD *)v14;
    *((void *)v7 + 2) = *((void *)v14 + 2);
    *(_OWORD *)uint64_t v7 = v16;
    goto LABEL_10;
  }

char *sub_100088EB4(char *result)
{
  unint64_t v1 = 0LL;
  unint64_t v2 = *((void *)result + 2);
  Swift::Int v3 = result + 48;
LABEL_2:
  if (v1 <= v2) {
    unint64_t v4 = v2;
  }
  else {
    unint64_t v4 = v1;
  }
  unint64_t v5 = v4 + 1;
  uint64_t v6 = (unsigned __int8 *)&v3[24 * v1];
  while (1)
  {
    if (v2 == v1) {
      return (char *)_swiftEmptyArrayStorage;
    }
    if (v5 == ++v1) {
      break;
    }
    uint64_t v7 = v6 + 24;
    unsigned __int8 v8 = *v6;
    int v9 = *v6 & 0xC0;
    v6 += 24;
    if (v9 != 64)
    {
      BOOL v15 = v3;
      uint64_t v10 = *((void *)v7 - 5);
      uint64_t v11 = *((void *)v7 - 4);
      sub_100030508(v10, v11, v8);
      uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage);
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        uint64_t result = sub_10004FED4((char *)(v12 > 1), v13 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v13 + 1;
      Swift::Int v14 = &_swiftEmptyArrayStorage[3 * v13];
      v14[4] = v10;
      _OWORD v14[5] = v11;
      *((_BYTE *)v14 + 48) = v8;
      Swift::Int v3 = v15;
      goto LABEL_2;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_100088FE8(uint64_t result, uint64_t a2, void *a3, unsigned __int8 a4, uint64_t a5)
{
  v32._object = a3;
  v32._uint64_t countAndFlagsBits = a2;
  unint64_t v5 = *(void *)(result + 16);
  if (v5)
  {
    unint64_t v6 = 0LL;
    int v7 = a4 >> 6;
    uint64_t v8 = result + 48;
    uint64_t v31 = -(uint64_t)v5;
    int v9 = _swiftEmptyArrayStorage;
    uint64_t v28 = result + 48;
    unint64_t v29 = *(void *)(result + 16);
    while (1)
    {
      uint64_t v30 = v9;
      if (v6 <= v5) {
        unint64_t v10 = v5;
      }
      else {
        unint64_t v10 = v6;
      }
      uint64_t v34 = -(uint64_t)v10;
      for (uint64_t i = (unsigned __int8 *)(v8 + 24 * v6++); ; i += 24)
      {
        if (v34 + v6 == 1)
        {
          __break(1u);
          return result;
        }

        uint64_t v13 = *((void *)i - 2);
        unint64_t v12 = (void *)*((void *)i - 1);
        unsigned int v14 = *i;
        if (v14 >> 6)
        {
          if (v14 >> 6 == 1)
          {
            uint64_t v35 = 0LL;
            unint64_t v36 = 0xE000000000000000LL;
            swift_bridgeObjectRetain(v12);
            v15._uint64_t countAndFlagsBits = 45LL;
            v15._object = (void *)0xE100000000000000LL;
            String.append(_:)(v15);
            Character.write<A>(to:)( &v35,  v13,  v12,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
            uint64_t v16 = v35;
            unint64_t v17 = v36;
            if (!v7) {
              goto LABEL_11;
            }
            goto LABEL_15;
          }

          uint64_t v35 = 45LL;
          unint64_t v19 = 0xE100000000000000LL;
        }

        else
        {
          uint64_t v35 = 11565LL;
          unint64_t v19 = 0xE200000000000000LL;
        }

        unint64_t v36 = v19;
        swift_bridgeObjectRetain(v12);
        v20._uint64_t countAndFlagsBits = v13;
        v20._object = v12;
        String.append(_:)(v20);
        uint64_t v16 = v35;
        unint64_t v17 = v36;
        if (!v7)
        {
LABEL_11:
          uint64_t v35 = 11565LL;
          unint64_t v18 = 0xE200000000000000LL;
          goto LABEL_18;
        }

uint64_t sub_10008929C(uint64_t a1, void *a2)
{
  v4._object = (void *)0x800000010009DE30LL;
  v4._uint64_t countAndFlagsBits = 0xD000000000000027LL;
  String.append(_:)(v4);
  v5._uint64_t countAndFlagsBits = a1;
  v5._object = a2;
  String.append(_:)(v5);
  v6._uint64_t countAndFlagsBits = 0xD000000000000044LL;
  v6._object = (void *)0x800000010009DE60LL;
  String.append(_:)(v6);
  uint64_t v7 = 3LL;
  sub_10004FDF4(0LL, 3LL, 0);
  uint64_t v8 = &unk_1000AFC78;
  do
  {
    uint64_t v10 = *(v8 - 1);
    uint64_t v9 = *v8;
    unint64_t v12 = _swiftEmptyArrayStorage[2];
    unint64_t v11 = _swiftEmptyArrayStorage[3];
    swift_bridgeObjectRetain(*v8);
    if (v12 >= v11 >> 1) {
      sub_10004FDF4((char *)(v11 > 1), v12 + 1, 1);
    }
    v8 += 2;
    _swiftEmptyArrayStorage[2] = v12 + 1;
    uint64_t v13 = &_swiftEmptyArrayStorage[2 * v12];
    v13[4] = v10;
    v13[5] = v9;
    --v7;
  }

  while (v7);
  uint64_t v14 = sub_100005104(&qword_1000B90C8);
  uint64_t v15 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v16 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v14, v15);
  unint64_t v18 = v17;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v19._uint64_t countAndFlagsBits = v16;
  v19._object = v18;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v18);
  return 0LL;
}

uint64_t sub_100089454()
{
  v0._object = (void *)0x800000010009DEB0LL;
  v0._uint64_t countAndFlagsBits = 0xD000000000000065LL;
  String.append(_:)(v0);
  uint64_t v1 = 3LL;
  sub_10004FDF4(0LL, 3LL, 0);
  unint64_t v2 = &unk_1000AFC78;
  do
  {
    uint64_t v4 = *(v2 - 1);
    uint64_t v3 = *v2;
    unint64_t v6 = _swiftEmptyArrayStorage[2];
    unint64_t v5 = _swiftEmptyArrayStorage[3];
    swift_bridgeObjectRetain(*v2);
    if (v6 >= v5 >> 1) {
      sub_10004FDF4((char *)(v5 > 1), v6 + 1, 1);
    }
    v2 += 2;
    _swiftEmptyArrayStorage[2] = v6 + 1;
    uint64_t v7 = &_swiftEmptyArrayStorage[2 * v6];
    v7[4] = v4;
    v7[5] = v3;
    --v1;
  }

  while (v1);
  uint64_t v8 = sub_100005104(&qword_1000B90C8);
  uint64_t v9 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
  uint64_t v10 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v8, v9);
  unint64_t v12 = v11;
  swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
  v13._uint64_t countAndFlagsBits = v10;
  v13._object = v12;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(v12);
  return 0LL;
}

uint64_t sub_1000895D0(uint64_t a1, uint64_t a2, void *a3, unsigned __int8 a4)
{
  uint64_t v48 = a3;
  v46._uint64_t countAndFlagsBits = a2;
  unint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return 0LL;
  }
  uint64_t v6 = a1;
  uint64_t countAndFlagsBits = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(a1 + 40);
  unsigned __int8 v9 = *(_BYTE *)(a1 + 48);
  swift_bridgeObjectRetain(a1);
  uint64_t result = sub_100030508(countAndFlagsBits, (uint64_t)v7, v9);
  if (v4 == 1) {
    goto LABEL_37;
  }
  int v11 = a4 >> 6;
  uint64_t v12 = v6 + 48;
  uint64_t v41 = -(uint64_t)v4;
  unint64_t v13 = 1LL;
  uint64_t v37 = v6 + 48;
  unint64_t v38 = v4;
  uint64_t v39 = v6;
  while (2)
  {
    v44._uint64_t countAndFlagsBits = countAndFlagsBits;
    v44._object = v7;
    unsigned __int8 v40 = v9;
    int v42 = v9 >> 6;
    if (v13 <= v4) {
      unint64_t v14 = v4;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v43 = -(uint64_t)v14;
    uint64_t v15 = (unsigned __int8 *)(v12 + 24 * v13++);
    while (1)
    {
      if (v43 + v13 == 1)
      {
        __break(1u);
        return result;
      }

      uint64_t countAndFlagsBits = *((void *)v15 - 2);
      uint64_t v7 = (void *)*((void *)v15 - 1);
      unsigned int v45 = *v15;
      if (v45 >> 6)
      {
        if (v45 >> 6 == 1)
        {
          v46._object = 0LL;
          unint64_t v47 = 0xE000000000000000LL;
          swift_bridgeObjectRetain(v7);
          v16._uint64_t countAndFlagsBits = 45LL;
          v16._object = (void *)0xE100000000000000LL;
          String.append(_:)(v16);
          Character.write<A>(to:)( &v46._object,  countAndFlagsBits,  v7,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
          object = v46._object;
          unint64_t v18 = v47;
          if (!v11) {
            goto LABEL_12;
          }
          goto LABEL_16;
        }

        v46._object = (void *)45;
        unint64_t v20 = 0xE100000000000000LL;
      }

      else
      {
        v46._object = (void *)11565;
        unint64_t v20 = 0xE200000000000000LL;
      }

      unint64_t v47 = v20;
      swift_bridgeObjectRetain(v7);
      v21._uint64_t countAndFlagsBits = countAndFlagsBits;
      v21._object = v7;
      String.append(_:)(v21);
      object = v46._object;
      unint64_t v18 = v47;
      if (!v11)
      {
LABEL_12:
        v46._object = (void *)11565;
        unint64_t v19 = 0xE200000000000000LL;
        goto LABEL_19;
      }

char *sub_10008999C(uint64_t a1, void *a2, unsigned __int8 a3)
{
  unsigned __int8 v4 = a3;
  unint64_t v5 = a2;
  uint64_t v6 = a1;
  if ((a3 & 0xC0) == 0x40)
  {
    _StringGuts.grow(_:)(19LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    goto LABEL_27;
  }

  uint64_t v7 = *v3;
  uint64_t v8 = v3[1];
  uint64_t v46 = v7;
  uint64_t v9 = *(void *)(v7 + 16);
  if (!v9)
  {
    int v11 = (char *)_swiftEmptyArrayStorage;
LABEL_25:
    sub_100030508(v6, (uint64_t)v5, v4);
    Swift::String v23 = (char *)sub_100088FE8((uint64_t)v11, v6, v5, v4, 4LL);
    sub_10002DA24(v6, (uint64_t)v5, v4);
    swift_bridgeObjectRelease(v11);
    unint64_t v24 = sub_100088EB4(v23);
    swift_bridgeObjectRelease(v23);
    sub_100030508(v6, (uint64_t)v5, v4);
    uint64_t v25 = sub_1000895D0((uint64_t)v24, v6, v5, v4);
    Swift::String v27 = v26;
    unsigned __int8 v29 = v28;
    unsigned int v30 = v28;
    sub_10002DA24(v6, (uint64_t)v5, v4);
    swift_bridgeObjectRelease(v24);
    if (v30 <= 0xFD)
    {
      _StringGuts.grow(_:)(39LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      v48._uint64_t countAndFlagsBits = v6;
      v48._object = v5;
      v35._uint64_t countAndFlagsBits = sub_10006D63C(v48, v4);
      object = v35._object;
      String.append(_:)(v35);
      swift_bridgeObjectRelease(object);
      v37._uint64_t countAndFlagsBits = 0xD000000000000011LL;
      v37._object = (void *)0x800000010009DF40LL;
      String.append(_:)(v37);
      v49._uint64_t countAndFlagsBits = v25;
      v49._object = v27;
      uint64_t v38 = sub_10006D63C(v49, v29);
      unsigned __int8 v40 = v39;
      sub_10002DA3C(v25, (uint64_t)v27, v29);
      v41._uint64_t countAndFlagsBits = v38;
      v41._object = v40;
      String.append(_:)(v41);
      swift_bridgeObjectRelease(v40);
      uint64_t v33 = 16167LL;
      unint64_t v34 = 0xE200000000000000LL;
      goto LABEL_29;
    }

    _StringGuts.grow(_:)(19LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
LABEL_27:
    v47._uint64_t countAndFlagsBits = v6;
    v47._object = v5;
    v31._uint64_t countAndFlagsBits = sub_10006D63C(v47, v4);
    Swift::String v32 = v31._object;
    String.append(_:)(v31);
    swift_bridgeObjectRelease(v32);
    uint64_t v33 = 39LL;
    unint64_t v34 = 0xE100000000000000LL;
LABEL_29:
    String.append(_:)(*(Swift::String *)&v33);
    return (char *)0xD000000000000010LL;
  }

  uint64_t v45 = v8;
  uint64_t v10 = (unint64_t *)(v7 + 32);
  sub_10002AB10(&v46);
  sub_10002AB10(&v45);
  sub_10002AB10(&v46);
  sub_10002AB10(&v45);
  int v11 = (char *)_swiftEmptyArrayStorage;
  while (1)
  {
    unint64_t v13 = *v10;
    v10 += 24;
    uint64_t result = (char *)v13;
    unint64_t v14 = v13 >= 2 ? result : (char *)_swiftEmptyArrayStorage;
    uint64_t v15 = *((void *)v14 + 2);
    int64_t v16 = *((void *)v11 + 2);
    int64_t v17 = v16 + v15;
    if (__OFADD__(v16, v15)) {
      break;
    }
    sub_10002D810((unint64_t)result);
    uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native(v11);
    if ((_DWORD)result && v17 <= *((void *)v11 + 3) >> 1)
    {
      if (*((void *)v14 + 2)) {
        goto LABEL_19;
      }
    }

    else
    {
      if (v16 <= v17) {
        int64_t v18 = v16 + v15;
      }
      else {
        int64_t v18 = v16;
      }
      uint64_t result = sub_100057BB8(result, v18, 1, v11);
      int v11 = result;
      if (*((void *)v14 + 2))
      {
LABEL_19:
        uint64_t v19 = *((void *)v11 + 2);
        if ((*((void *)v11 + 3) >> 1) - v19 < v15) {
          goto LABEL_32;
        }
        uint64_t result = (char *)swift_arrayInitWithCopy(&v11[24 * v19 + 32], v14 + 32, v15, &type metadata for Name);
        if (v15)
        {
          uint64_t v20 = *((void *)v11 + 2);
          BOOL v21 = __OFADD__(v20, v15);
          uint64_t v22 = v20 + v15;
          if (v21) {
            goto LABEL_33;
          }
          *((void *)v11 + 2) = v22;
        }

        goto LABEL_6;
      }
    }

    if (v15) {
      goto LABEL_31;
    }
LABEL_6:
    swift_bridgeObjectRelease(v14);
    if (!--v9)
    {
      sub_10002ABC8(&v46);
      sub_10002ABC8(&v45);
      sub_10002ABC8(&v46);
      sub_10002ABC8(&v45);
      unsigned __int8 v4 = a3;
      uint64_t v6 = a1;
      unint64_t v5 = a2;
      goto LABEL_25;
    }
  }

  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

unint64_t sub_100089D64(uint64_t a1, void *a2, int a3)
{
  unsigned __int8 v3 = a3;
  unint64_t v6 = sub_100087188(a1, (uint64_t)a2, a3);
  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
    _StringGuts.grow(_:)(27LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v19._uint64_t countAndFlagsBits = a1;
    v19._object = a2;
    v10._uint64_t countAndFlagsBits = sub_10006D63C(v19, v3);
    object = v10._object;
    String.append(_:)(v10);
    swift_bridgeObjectRelease(object);
    v12._uint64_t countAndFlagsBits = 15392LL;
    v12._object = (void *)0xE200000000000000LL;
    String.append(_:)(v12);
    v13._uint64_t countAndFlagsBits = v8;
    v13._object = v9;
    String.append(_:)(v13);
    swift_bridgeObjectRelease(v9);
    uint64_t v14 = 10046LL;
    unint64_t v15 = 0xE200000000000000LL;
  }

  else
  {
    _StringGuts.grow(_:)(22LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v20._uint64_t countAndFlagsBits = a1;
    v20._object = a2;
    v16._uint64_t countAndFlagsBits = sub_10006D63C(v20, v3);
    int64_t v17 = v16._object;
    String.append(_:)(v16);
    swift_bridgeObjectRelease(v17);
    uint64_t v14 = 39LL;
    unint64_t v15 = 0xE100000000000000LL;
  }

  String.append(_:)(*(Swift::String *)&v14);
  return 0xD000000000000013LL;
}

unint64_t sub_100089EB4(void *a1)
{
  int64_t v1 = a1[2];
  if (v1)
  {
    if (v1 == 1)
    {
      _StringGuts.grow(_:)(24LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      unint64_t v24 = 0xD000000000000015LL;
      uint64_t v3 = a1[5];
      unsigned __int8 v4 = (void *)a1[6];
      swift_bridgeObjectRetain(v4);
      v5._uint64_t countAndFlagsBits = v3;
      v5._object = v4;
      String.append(_:)(v5);
      unint64_t v6 = v4;
    }

    else
    {
      sub_10004FDF4(0LL, v1, 0);
      uint64_t v7 = a1 + 6;
      int64_t v8 = v1;
      do
      {
        uint64_t v10 = *(v7 - 1);
        uint64_t v9 = *v7;
        unint64_t v12 = _swiftEmptyArrayStorage[2];
        unint64_t v11 = _swiftEmptyArrayStorage[3];
        swift_bridgeObjectRetain(*v7);
        if (v12 >= v11 >> 1) {
          sub_10004FDF4((char *)(v11 > 1), v12 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v12 + 1;
        Swift::String v13 = &_swiftEmptyArrayStorage[2 * v12];
        v13[4] = v10;
        v13[5] = v9;
        v7 += 3;
        --v8;
      }

      while (v8);
      uint64_t v14 = sub_100005104(&qword_1000B90C8);
      uint64_t v15 = sub_1000062F8( (unint64_t *)&qword_1000B90D0,  &qword_1000B90C8,  (uint64_t)&protocol conformance descriptor for [A]);
      uint64_t v16 = BidirectionalCollection<>.joined(separator:)(656419879LL, 0xE400000000000000LL, v14, v15);
      int64_t v18 = v17;
      swift_release(_swiftEmptyArrayStorage);
      _StringGuts.grow(_:)(29LL);
      uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      unint64_t v24 = v19;
      v20._uint64_t countAndFlagsBits = 0xD000000000000018LL;
      v20._object = (void *)0x800000010009DF80LL;
      String.append(_:)(v20);
      v21._uint64_t countAndFlagsBits = v16;
      v21._object = v18;
      String.append(_:)(v21);
      unint64_t v6 = v18;
    }

    swift_bridgeObjectRelease(v6);
    v22._uint64_t countAndFlagsBits = 39LL;
    v22._object = (void *)0xE100000000000000LL;
    String.append(_:)(v22);
    return v24;
  }

  return v1;
}

uint64_t sub_10008A0EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100087B00(a2, a3);
  if (v7)
  {
    uint64_t v8 = v6;
    uint64_t v9 = v7;
  }

  else
  {
    uint64_t v22 = 0LL;
    unint64_t v23 = 0xE000000000000000LL;
    v10._uint64_t countAndFlagsBits = 0x6E6F697469736F70LL;
    v10._object = (void *)0xE900000000000020LL;
    String.append(_:)(v10);
    uint64_t v21 = a2;
    _print_unlocked<A, B>(_:_:)( &v21,  &v22,  &type metadata for InputOrigin,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    uint64_t v8 = v22;
    uint64_t v9 = (void *)v23;
  }

  uint64_t v11 = sub_100087B00(a1, a3);
  if (v12)
  {
    uint64_t v13 = v11;
    uint64_t v14 = v12;
  }

  else
  {
    uint64_t v22 = 0LL;
    unint64_t v23 = 0xE000000000000000LL;
    v15._uint64_t countAndFlagsBits = 0x6E6F697469736F70LL;
    v15._object = (void *)0xE900000000000020LL;
    String.append(_:)(v15);
    uint64_t v21 = a1;
    _print_unlocked<A, B>(_:_:)( &v21,  &v22,  &type metadata for InputOrigin,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    uint64_t v13 = v22;
    uint64_t v14 = (void *)v23;
  }

  uint64_t v22 = 0LL;
  unint64_t v23 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(52LL);
  v16._object = (void *)0x800000010009DFC0LL;
  v16._uint64_t countAndFlagsBits = 0xD000000000000015LL;
  String.append(_:)(v16);
  v17._uint64_t countAndFlagsBits = v8;
  v17._object = v9;
  String.append(_:)(v17);
  swift_bridgeObjectRelease(v9);
  v18._uint64_t countAndFlagsBits = 0xD00000000000001BLL;
  v18._object = (void *)0x800000010009DFE0LL;
  String.append(_:)(v18);
  v19._uint64_t countAndFlagsBits = v13;
  v19._object = v14;
  String.append(_:)(v19);
  swift_bridgeObjectRelease(v14);
  return v22;
}

uint64_t sub_10008A29C(uint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v4 = *(void *)(result + 16);
  if (!v4) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  unint64_t v8 = 0LL;
  uint64_t v9 = result + 32;
  Swift::String v10 = _swiftEmptyArrayStorage;
  uint64_t v32 = result + 32;
  do
  {
    if (v8 <= v4) {
      unint64_t v11 = v4;
    }
    else {
      unint64_t v11 = v8;
    }
    unint64_t v12 = (__int128 *)(v9 + 192 * v8);
    for (unint64_t i = v8; ; ++i)
    {
      if (v11 == i)
      {
        __break(1u);
        return result;
      }

      __int128 v14 = v12[9];
      __int128 v41 = v12[8];
      __int128 v42 = v14;
      __int128 v15 = v12[11];
      __int128 v43 = v12[10];
      __int128 v44 = v15;
      __int128 v16 = v12[5];
      __int128 v37 = v12[4];
      __int128 v38 = v16;
      __int128 v17 = v12[7];
      __int128 v39 = v12[6];
      __int128 v40 = v17;
      __int128 v18 = v12[1];
      __int128 v33 = *v12;
      __int128 v34 = v18;
      __int128 v19 = v12[3];
      __int128 v35 = v12[2];
      __int128 v36 = v19;
      unint64_t v8 = i + 1;
      uint64_t result = sub_100084464(a2, a3, a4, v35);
      if ((result & 1) != 0) {
        break;
      }
      v12 += 12;
      if (v4 == v8) {
        return (uint64_t)v10;
      }
    }

    sub_10002D724((uint64_t)&v33);
    uint64_t result = swift_isUniquelyReferenced_nonNull_native(v10);
    uint64_t v45 = v10;
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_10004FE10(0LL, v10[2] + 1LL, 1);
      Swift::String v10 = v45;
    }

    unint64_t v21 = v10[2];
    unint64_t v20 = v10[3];
    if (v21 >= v20 >> 1)
    {
      uint64_t result = (uint64_t)sub_10004FE10((char *)(v20 > 1), v21 + 1, 1);
      Swift::String v10 = v45;
    }

    v10[2] = v21 + 1;
    uint64_t v22 = &v10[24 * v21];
    __int128 v23 = v33;
    __int128 v24 = v34;
    __int128 v25 = v36;
    v22[4] = v35;
    v22[5] = v25;
    v22[2] = v23;
    _OWORD v22[3] = v24;
    __int128 v26 = v37;
    __int128 v27 = v38;
    __int128 v28 = v40;
    v22[8] = v39;
    v22[9] = v28;
    v22[6] = v26;
    v22[7] = v27;
    __int128 v29 = v41;
    __int128 v30 = v42;
    __int128 v31 = v44;
    _OWORD v22[12] = v43;
    v22[13] = v31;
    v22[10] = v29;
    v22[11] = v30;
    uint64_t v9 = v32;
  }

  while (v4 - 1 != i);
  return (uint64_t)v10;
}

uint64_t sub_10008A454( uint64_t a1, void *a2, unsigned __int8 a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9)
{
  uint64_t v17 = *v9;
  uint64_t v74 = v9[1];
  uint64_t v75 = v17;
  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRetain(a8);
  sub_10002AB10(&v75);
  sub_10002AB10(&v74);
  uint64_t v18 = sub_10008A29C(v17, a6, a7, a8);
  swift_bridgeObjectRelease(a8);
  swift_bridgeObjectRelease(a7);
  sub_10002ABC8(&v75);
  sub_10002ABC8(&v74);
  if (*(void *)(v18 + 16))
  {
    __int128 v20 = *(_OWORD *)(v18 + 32);
    __int128 v19 = *(_OWORD *)(v18 + 48);
    __int128 v21 = *(_OWORD *)(v18 + 80);
    *(_OWORD *)&v77[32] = *(_OWORD *)(v18 + 64);
    *(_OWORD *)&v77[48] = v21;
    __int128 v22 = *(_OWORD *)(v18 + 96);
    __int128 v23 = *(_OWORD *)(v18 + 112);
    __int128 v24 = *(_OWORD *)(v18 + 144);
    *(_OWORD *)&v77[96] = *(_OWORD *)(v18 + 128);
    *(_OWORD *)&v77[112] = v24;
    *(_OWORD *)&v77[64] = v22;
    *(_OWORD *)&v77[80] = v23;
    __int128 v25 = *(_OWORD *)(v18 + 160);
    __int128 v26 = *(_OWORD *)(v18 + 176);
    __int128 v27 = *(_OWORD *)(v18 + 208);
    __int128 v80 = *(_OWORD *)(v18 + 192);
    __int128 v81 = v27;
    __int128 v78 = v25;
    __int128 v79 = v26;
    *(_OWORD *)uint64_t v77 = v20;
    *(_OWORD *)&v77[16] = v19;
    __int128 v70 = *(_OWORD *)(v18 + 160);
    __int128 v71 = *(_OWORD *)(v18 + 176);
    __int128 v72 = *(_OWORD *)(v18 + 192);
    __int128 v73 = *(_OWORD *)(v18 + 208);
    __int128 v66 = *(_OWORD *)(v18 + 96);
    __int128 v67 = *(_OWORD *)(v18 + 112);
    __int128 v68 = *(_OWORD *)(v18 + 128);
    __int128 v69 = *(_OWORD *)(v18 + 144);
    __int128 v62 = *(_OWORD *)(v18 + 32);
    __int128 v63 = *(_OWORD *)(v18 + 48);
    __int128 v64 = *(_OWORD *)(v18 + 64);
    __int128 v65 = *(_OWORD *)(v18 + 80);
    sub_10002D724((uint64_t)v77);
    swift_bridgeObjectRelease(v18);
    __int128 v86 = *(_OWORD *)&v77[72];
    __int128 v87 = *(_OWORD *)&v77[88];
    __int128 v88 = *(_OWORD *)&v77[104];
    uint64_t v89 = *(void *)&v77[120];
    __int128 v82 = *(_OWORD *)&v77[8];
    __int128 v83 = *(_OWORD *)&v77[24];
    __int128 v84 = *(_OWORD *)&v77[40];
    __int128 v85 = *(_OWORD *)&v77[56];
    __int128 v90 = *(_OWORD *)&v77[88];
    v76[10] = v72;
    v76[11] = v73;
    v76[8] = v70;
    v76[9] = v71;
    v76[6] = v68;
    v76[7] = v69;
    v76[4] = v66;
    v76[5] = v67;
    v76[2] = v64;
    v76[3] = v65;
    v76[0] = v62;
    v76[1] = v63;
    v28._uint64_t countAndFlagsBits = (uint64_t)v76;
    String.init(argument:)(v28);
    uint64_t v29 = v90 & 0xFFFFFFFFFFFFLL;
    if ((*((void *)&v90 + 1) & 0x2000000000000000LL) != 0) {
      uint64_t v29 = HIBYTE(*((void *)&v90 + 1)) & 0xFLL;
    }
    if (v29)
    {
      *(_OWORD *)uint64_t v91 = v90;
      swift_bridgeObjectRetain(*((void *)&v90 + 1));
    }

    else
    {
      sub_10002D724((uint64_t)v77);
      sub_10002E7A0((uint64_t)&v90);
      sub_10005D218(v77, v91);
      sub_100030564((uint64_t)&v90);
      sub_10002D8A4((uint64_t)v77);
    }

    __int128 v31 = (void *)v91[1];
    uint64_t v30 = v91[0];
    sub_10005BFC4((uint64_t)v76, (uint64_t)v91);
  }

  else
  {
    swift_bridgeObjectRelease(v18);
    sub_100033E1C(v77);
    sub_10005BFC4((uint64_t)v77, (uint64_t)v91);
    uint64_t v30 = 0LL;
    __int128 v31 = 0LL;
  }

  sub_10005BFC4((uint64_t)v91, (uint64_t)v76);
  uint64_t v32 = sub_100087CEC(a9, (uint64_t)v76);
  __int128 v34 = v33;
  if (!v31)
  {
    uint64_t v40 = v32;
    if (a3 <= 0xFDu)
    {
      sub_100030508(a1, (uint64_t)a2, a3);
      _StringGuts.grow(_:)(36LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      v52._uint64_t countAndFlagsBits = a4;
      v52._object = a5;
      String.append(_:)(v52);
      v53._object = (void *)0x800000010009E0B0LL;
      v53._uint64_t countAndFlagsBits = 0xD000000000000012LL;
      String.append(_:)(v53);
      v93._uint64_t countAndFlagsBits = a1;
      v93._object = a2;
      uint64_t v54 = sub_10006D63C(v93, a3);
      BOOL v56 = v55;
      sub_10002DA3C(a1, (uint64_t)a2, a3);
      v57._uint64_t countAndFlagsBits = v54;
      v57._object = v56;
      String.append(_:)(v57);
      swift_bridgeObjectRelease(v56);
      uint64_t v42 = 39LL;
      unint64_t v43 = 0xE100000000000000LL;
    }

    else
    {
      _StringGuts.grow(_:)(28LL);
      swift_bridgeObjectRelease(0xE000000000000000LL);
      v41._uint64_t countAndFlagsBits = a4;
      v41._object = a5;
      String.append(_:)(v41);
      uint64_t v42 = 0x766E692073692027LL;
      unint64_t v43 = 0xED00002E64696C61LL;
    }

    String.append(_:)(*(Swift::String *)&v42);
    v58._uint64_t countAndFlagsBits = v40;
    v58._object = v34;
    String.append(_:)(v58);
    goto LABEL_17;
  }

  uint64_t v60 = v32;
  if (a3 > 0xFDu)
  {
    _StringGuts.grow(_:)(38LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    v35._uint64_t countAndFlagsBits = a4;
    v35._object = a5;
    String.append(_:)(v35);
    v36._uint64_t countAndFlagsBits = 0xD000000000000013LL;
    v36._object = (void *)0x800000010009E0D0LL;
    String.append(_:)(v36);
    v37._uint64_t countAndFlagsBits = v30;
    v37._object = v31;
    String.append(_:)(v37);
    v38._uint64_t countAndFlagsBits = 10046LL;
    v38._object = (void *)0xE200000000000000LL;
    String.append(_:)(v38);
    v39._uint64_t countAndFlagsBits = v60;
    v39._object = v34;
    String.append(_:)(v39);
    swift_bridgeObjectRelease(v31);
LABEL_17:
    swift_bridgeObjectRelease(v34);
    goto LABEL_18;
  }

  sub_100030508(a1, (uint64_t)a2, a3);
  _StringGuts.grow(_:)(41LL);
  swift_bridgeObjectRelease(0xE000000000000000LL);
  v44._uint64_t countAndFlagsBits = a4;
  v44._object = a5;
  String.append(_:)(v44);
  v45._object = (void *)0x800000010009E0B0LL;
  v45._uint64_t countAndFlagsBits = 0xD000000000000012LL;
  String.append(_:)(v45);
  v92._uint64_t countAndFlagsBits = a1;
  v92._object = a2;
  v46._uint64_t countAndFlagsBits = sub_10006D63C(v92, a3);
  object = v46._object;
  String.append(_:)(v46);
  swift_bridgeObjectRelease(object);
  v48._uint64_t countAndFlagsBits = 15392LL;
  v48._object = (void *)0xE200000000000000LL;
  String.append(_:)(v48);
  v49._uint64_t countAndFlagsBits = v30;
  v49._object = v31;
  String.append(_:)(v49);
  v50._uint64_t countAndFlagsBits = 10046LL;
  v50._object = (void *)0xE200000000000000LL;
  String.append(_:)(v50);
  v51._uint64_t countAndFlagsBits = v60;
  v51._object = v34;
  String.append(_:)(v51);
  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease(v34);
  sub_10002DA3C(a1, (uint64_t)a2, a3);
LABEL_18:
  sub_100033CCC((uint64_t)v91);
  return 0x756C617620656854LL;
}

uint64_t sub_10008A9CC(uint64_t a1, void *a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v13 = *v6;
  uint64_t v14 = v6[1];
  swift_bridgeObjectRetain(a5);
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  sub_100083D50(v13, v14, a4, a5, a6, (uint64_t)v50);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v13);
  sub_10005BFC4((uint64_t)v50, (uint64_t)v65);
  sub_10005BFC4((uint64_t)v65, (uint64_t)v66);
  v35._uint64_t countAndFlagsBits = a1;
  v35._object = a2;
  unsigned __int8 v37 = a3;
  sub_10005BFC4((uint64_t)v65, (uint64_t)v41);
  uint64_t v39 = a4;
  uint64_t v15 = v43;
  uint64_t v38 = v42;
  uint64_t v16 = v44;
  uint64_t v17 = v46;
  uint64_t v36 = v45;
  uint64_t v18 = v47;
  uint64_t v19 = v48;
  uint64_t v20 = v49;
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v20);
  sub_100033CCC((uint64_t)v65);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v38);
  swift_bridgeObjectRetain(a5);
  swift_bridgeObjectRetain(a6);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  uint64_t v21 = sub_10008A29C(v13, v39, a5, a6);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(a6);
  swift_bridgeObjectRelease(a5);
  if (!*(void *)(v21 + 16))
  {
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v21);
    return 0LL;
  }

  __int128 v22 = *(_OWORD *)(v21 + 176);
  __int128 v52 = *(_OWORD *)(v21 + 160);
  __int128 v53 = v22;
  __int128 v23 = *(_OWORD *)(v21 + 208);
  __int128 v54 = *(_OWORD *)(v21 + 192);
  __int128 v55 = v23;
  __int128 v24 = *(_OWORD *)(v21 + 112);
  *(_OWORD *)&v51[64] = *(_OWORD *)(v21 + 96);
  *(_OWORD *)&v51[80] = v24;
  __int128 v25 = *(_OWORD *)(v21 + 144);
  *(_OWORD *)&v51[96] = *(_OWORD *)(v21 + 128);
  *(_OWORD *)&v51[112] = v25;
  __int128 v26 = *(_OWORD *)(v21 + 48);
  *(_OWORD *)Swift::String v51 = *(_OWORD *)(v21 + 32);
  *(_OWORD *)&v51[16] = v26;
  __int128 v27 = *(_OWORD *)(v21 + 80);
  *(_OWORD *)&v51[32] = *(_OWORD *)(v21 + 64);
  *(_OWORD *)&v51[48] = v27;
  sub_10002D724((uint64_t)v51);
  swift_bridgeObjectRelease(v21);
  __int128 v60 = *(_OWORD *)&v51[72];
  Swift::String v61 = *(Swift::String *)&v51[88];
  __int128 v62 = *(_OWORD *)&v51[104];
  uint64_t v63 = *(void *)&v51[120];
  __int128 v56 = *(_OWORD *)&v51[8];
  __int128 v57 = *(_OWORD *)&v51[24];
  __int128 v58 = *(_OWORD *)&v51[40];
  __int128 v59 = *(_OWORD *)&v51[56];
  __int128 v64 = *(_OWORD *)&v51[88];
  uint64_t v28 = *(void *)&v51[88] & 0xFFFFFFFFFFFFLL;
  if ((*(void *)&v51[96] & 0x2000000000000000LL) != 0) {
    uint64_t v28 = HIBYTE(*(void *)&v51[96]) & 0xFLL;
  }
  if (v28)
  {
    Swift::String v40 = v61;
    swift_bridgeObjectRetain(*(void *)&v51[96]);
  }

  else
  {
    swift_bridgeObjectRetain(*(void *)&v51[96]);
    sub_10005D218(v51, (unint64_t *)&v40);
    sub_100030564((uint64_t)&v64);
  }

  sub_10002D8A4((uint64_t)v51);
  Swift::String v30 = v40;
  if (v37 <= 0xFDu)
  {
    v40._uint64_t countAndFlagsBits = sub_10006D63C(v35, v37);
    v40._object = v31;
    v32._uint64_t countAndFlagsBits = 15392LL;
    v32._object = (void *)0xE200000000000000LL;
    String.append(_:)(v32);
  }

  else
  {
    v40._uint64_t countAndFlagsBits = 60LL;
    v40._object = (void *)0xE100000000000000LL;
  }

  String.append(_:)(v30);
  v33._uint64_t countAndFlagsBits = 2105406LL;
  v33._object = (void *)0xE300000000000000LL;
  String.append(_:)(v33);
  v34._uint64_t countAndFlagsBits = v36;
  v34._object = v17;
  String.append(_:)(v34);
  swift_bridgeObjectRelease(v30._object);
  swift_bridgeObjectRelease(v17);
  return v40._countAndFlagsBits;
}

ValueMetadata *type metadata accessor for Platform.StandardError()
{
  return &type metadata for Platform.StandardError;
}

unint64_t sub_10008AD30(unint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000LL) != 0) {
    unint64_t v4 = HIBYTE(a2) & 0xF;
  }
  else {
    unint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain(a2);
  if (!v4) {
    return swift_bridgeObjectRelease(a2);
  }
  uint64_t v6 = (a1 >> 59) & 1;
  if ((a2 & 0x1000000000000000LL) == 0) {
    LOBYTE(v6) = 1;
  }
  uint64_t v7 = 4LL << v6;
  unint64_t v8 = 15LL;
  while (1)
  {
    unint64_t v10 = v8 & 0xC;
    unint64_t result = v8;
    if (v10 == v7) {
      unint64_t result = sub_10008AED8(v8, a1, a2);
    }
    unint64_t v12 = result >> 16;
    if (result >> 16 >= v4) {
      break;
    }
    if ((a2 & 0x1000000000000000LL) != 0)
    {
      unint64_t result = String.UTF8View._foreignSubscript(position:)(result, a1, a2);
      unsigned __int8 v13 = result;
      if (v10 != v7) {
        goto LABEL_20;
      }
    }

    else if ((a2 & 0x2000000000000000LL) != 0)
    {
      v14[0] = a1;
      v14[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      unsigned __int8 v13 = *((_BYTE *)v14 + v12);
      if (v10 != v7) {
        goto LABEL_20;
      }
    }

    else
    {
      unint64_t result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      if ((a1 & 0x1000000000000000LL) == 0) {
        unint64_t result = _StringObject.sharedUTF8.getter(a1, a2);
      }
      unsigned __int8 v13 = *(_BYTE *)(result + v12);
      if (v10 != v7)
      {
LABEL_20:
        if ((a2 & 0x1000000000000000LL) == 0) {
          goto LABEL_8;
        }
        goto LABEL_21;
      }
    }

    unint64_t result = sub_10008AED8(v8, a1, a2);
    unint64_t v8 = result;
    if ((a2 & 0x1000000000000000LL) == 0)
    {
LABEL_8:
      unint64_t v8 = (v8 & 0xFFFFFFFFFFFF0000LL) + 65540;
      goto LABEL_9;
    }

unint64_t sub_10008AEC4(unint64_t a1, unint64_t a2)
{
  return sub_10008AD30(a1, a2);
}

uint64_t sub_10008AED8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5 = a1;
  unint64_t v6 = a1 >> 16;
  uint64_t v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000LL) == 0 || (a2 & 0x800000000000000LL) != 0)
  {
    uint64_t v13 = String.UTF16View.index(_:offsetBy:)(15LL, v6, a2);
    uint64_t v14 = v13 + (v7 << 16);
    unint64_t v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    unint64_t v16 = v14 & 0xFFFFFFFFFFFF0000LL;
    if (!v7) {
      unint64_t v16 = v15;
    }
    return v16 | 4;
  }

  else
  {
    uint64_t v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15LL, v6);
    uint64_t v9 = v8 + (v7 << 16);
    unint64_t v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    unint64_t v11 = v9 & 0xFFFFFFFFFFFF0000LL;
    if (!v7) {
      unint64_t v11 = v10;
    }
    return v11 | 8;
  }

uint64_t sub_10008AF50()
{
  Swift::String v0 = getenv("SHELL");
  if (!v0) {
    return 0LL;
  }
  uint64_t v1 = String.init(cString:)(v0);
  unint64_t v3 = v2;
  v15[0] = 47LL;
  v15[1] = 0xE100000000000000LL;
  __chkstk_darwin(v1);
  void v14[2] = v15;
  swift_bridgeObjectRetain(v4);
  char v5 = sub_100032C14(0x7FFFFFFFFFFFFFFFLL, 1, sub_10002D680, (uint64_t)v14, v1, v3);
  swift_bridgeObjectRelease(v3);
  uint64_t v6 = *((void *)v5 + 2);
  if (!v6)
  {
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  uint64_t v7 = &v5[32 * v6];
  uint64_t v8 = *(void *)v7;
  uint64_t v9 = *((void *)v7 + 1);
  uint64_t v10 = *((void *)v7 + 2);
  uint64_t v11 = *((void *)v7 + 3);
  swift_bridgeObjectRetain_n(v11, 2LL);
  swift_bridgeObjectRelease(v5);
  uint64_t v12 = static String._fromSubstring(_:)(v8, v9, v10, v11);
  swift_bridgeObjectRelease_n(v11, 2LL);
  return v12;
}

uint64_t sub_10008B078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(a1 - 8);
  __chkstk_darwin(a1);
  uint64_t v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(0LL, v10);
  uint64_t v19 = Set.init()(AssociatedTypeWitness, a3);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, v3, a1);
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = &v19;
  uint64_t v12 = Sequence.filter(_:)(sub_10008B25C, v14, a1, a2);
  swift_bridgeObjectRelease(v19);
  return v12;
}

uint64_t sub_10008B158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness(0LL, a4);
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v9 = __chkstk_darwin(AssociatedTypeWitness);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v16 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, AssociatedTypeWitness);
  uint64_t v14 = type metadata accessor for Set(0LL, AssociatedTypeWitness, a5);
  LOBYTE(a5) = Set.insert(_:)(v13, v11, v14);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, AssociatedTypeWitness);
  return a5 & 1;
}

uint64_t sub_10008B25C(uint64_t a1)
{
  return sub_10008B158(a1, v1[5], v1[2], v1[3], v1[4]) & 1;
}

uint64_t sub_10008B27C(uint64_t a1)
{
  uint64_t result = swift_checkMetadataState(319LL, *(void *)(a1 + 80));
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = "\b";
    void v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    uint64_t result = swift_initClassMetadata2(a1, 0LL, 3LL, v4, a1 + 88);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_10008B304(Swift::UInt a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if ((a2 & 0xC000000000000001LL) == 0)
  {
    if (*(void *)(a2 + 16))
    {
      unint64_t v8 = sub_100058D30(a1);
      if ((v9 & 1) != 0)
      {
        uint64_t v7 = *(void *)(*(void *)(v2 + 56) + 8 * v8);
        swift_retain(v7);
        return v7;
      }
    }

    return 0LL;
  }

  if (a2 >= 0) {
    uint64_t v2 = a2 & 0xFFFFFFFFFFFFFF8LL;
  }
  uint64_t v4 = swift_retain(a1);
  uint64_t v5 = __CocoaDictionary.lookup(_:)(v4, v2);
  swift_release(a1);
  if (!v5) {
    return 0LL;
  }
  uint64_t v11 = v5;
  swift_unknownObjectRetain(v5);
  uint64_t v6 = sub_100005104(&qword_1000B98E0);
  swift_dynamicCast(&v12, &v11, (char *)&type metadata for Swift.AnyObject + 8, v6, 7LL);
  uint64_t v7 = v12;
  swift_unknownObjectRelease(v5);
  return v7;
}

uint64_t sub_10008B3DC()
{
  return v0;
}

uint64_t sub_10008B428()
{
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t type metadata accessor for Tree(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100037B54(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Tree);
}

BOOL sub_10008B458(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_10008B464()
{
}

Swift::Int sub_10008B48C()
{
  return Hasher._finalize()();
}

Swift::Int sub_10008B4D0()
{
  return sub_10008B48C();
}

void sub_10008B4F0()
{
}

Swift::Int sub_10008B510(uint64_t a1)
{
  return Hasher._finalize()();
}

BOOL sub_10008B54C(uint64_t *a1, uint64_t *a2)
{
  return sub_10008B458(*a1, *a2);
}

uint64_t sub_10008B56C(uint64_t a1)
{
  return swift_getWitnessTable(&unk_10009AE88, a1);
}

uint64_t sub_10008B57C(uint64_t a1, uint64_t a2)
{
LABEL_2:
  unint64_t v3 = &_swiftEmptySetSingleton;
LABEL_3:
  uint64_t v87 = (uint64_t)v3;
  uint64_t v4 = sub_100005104(&qword_1000B9F08);
  uint64_t v5 = swift_allocObject(v4, 40LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_100097E80;
  *(void *)(v5 + 32) = a1;
  uint64_t v80 = v5;
  specialized Array._endMutation()(v5);
  uint64_t v6 = v80;
  uint64_t v86 = v80;
  uint64_t v7 = sub_10007B208((uint64_t)_swiftEmptyArrayStorage);
  swift_retain(a1);
  Swift::Int v8 = 0LL;
  while (1)
  {
    if ((unint64_t)v6 >> 62)
    {
      if (v6 < 0) {
        uint64_t v61 = v6;
      }
      else {
        uint64_t v61 = v6 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v6);
      uint64_t v9 = _CocoaArrayWrapper.endIndex.getter(v61);
      swift_bridgeObjectRelease(v6);
      if (v9 < v8)
      {
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        uint64_t v69 = sub_100005104(&qword_1000B98E0);
        uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v69);
        __break(1u);
        return result;
      }

      swift_bridgeObjectRetain(v6);
      uint64_t v62 = _CocoaArrayWrapper.endIndex.getter(v61);
      swift_bridgeObjectRelease(v6);
      if (v62 < v8) {
        goto LABEL_127;
      }
      swift_bridgeObjectRetain(v6);
      a1 = _CocoaArrayWrapper.endIndex.getter(v61);
      swift_bridgeObjectRelease(v6);
      if (a1 < v9) {
        goto LABEL_118;
      }
    }

    else
    {
      uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFF8LL) + 0x10);
      a1 = v9;
    }

    if (v9 < 0) {
      goto LABEL_119;
    }
    if ((v6 & 0xC000000000000001LL) != 0 && v8 != v9)
    {
      Swift::Int v10 = v8;
      do
      {
        sub_100005104(&qword_1000B98E0);
        _ArrayBuffer._typeCheckSlowPath(_:)(v10++);
      }

      while (v9 != v10);
    }

    if ((unint64_t)v6 >> 62)
    {
      if (v6 < 0) {
        uint64_t v14 = v6;
      }
      else {
        uint64_t v14 = v6 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v6);
      a1 = _CocoaArrayWrapper.subscript.getter(v8, v9, v14);
      uint64_t v11 = v15;
      int64_t v13 = v16;
      unint64_t v12 = v17;
      swift_bridgeObjectRelease(v6);
    }

    else
    {
      a1 = v6 & 0xFFFFFFFFFFFFFF8LL;
      uint64_t v11 = (v6 & 0xFFFFFFFFFFFFFF8LL) + 32;
      unint64_t v12 = (2 * v9) | 1;
      swift_bridgeObjectRetain(v6);
      int64_t v13 = v8;
    }

    if (v13 == v12 >> 1)
    {
      swift_bridgeObjectRelease(v7);
      swift_unknownObjectRelease(a1);
      uint64_t v64 = v87;
      swift_bridgeObjectRelease(v6);
      __int128 v65 = _swiftEmptyArrayStorage;
      goto LABEL_110;
    }

    Swift::UInt v18 = *(void *)(v11 + 8 * v13);
    swift_retain(v18);
    swift_unknownObjectRelease(a1);
    BOOL v19 = __OFADD__(v8++, 1LL);
    if (v19)
    {
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      if (!_CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage)) {
        goto LABEL_2;
      }
      unint64_t v3 = (void *)sub_10008CC44((Swift::Int)_swiftEmptyArrayStorage);
      goto LABEL_3;
    }

    if (*(void *)(v18 + 16) == a2) {
      break;
    }
    swift_retain(v18);
    sub_100059704((Swift::UInt *)&v80, v18);
    swift_release(v80);
    swift_beginAccess(v18 + 40, v85, 0LL, 0LL);
    Swift::UInt v76 = v18;
    a1 = *(void *)(v18 + 40);
    if ((unint64_t)a1 >> 62)
    {
      if (a1 < 0) {
        uint64_t v63 = *(void *)(v18 + 40);
      }
      else {
        uint64_t v63 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain_n(*(void *)(v18 + 40), 2LL);
      uint64_t v20 = _CocoaArrayWrapper.endIndex.getter(v63);
      swift_bridgeObjectRelease(a1);
      if (!v20) {
        goto LABEL_107;
      }
LABEL_26:
      unint64_t v21 = 0LL;
      uint64_t v22 = v87;
      unint64_t v78 = v87 & 0xC000000000000001LL;
      unint64_t v79 = a1 & 0xC000000000000001LL;
      Swift::Int v72 = v8;
      uint64_t v73 = a1 + 32;
      uint64_t v23 = v87 & 0xFFFFFFFFFFFFFF8LL;
      if (v87 < 0) {
        uint64_t v23 = v87;
      }
      uint64_t v74 = a1 & 0xFFFFFFFFFFFFFF8LL;
      uint64_t v75 = v23;
      uint64_t v77 = v87 + 56;
      Swift::UInt v24 = v18;
      while (2)
      {
        while (2)
        {
          if (v79)
          {
            Swift::UInt v25 = specialized _ArrayBuffer._getElementSlowPath(_:)(v21, a1);
            BOOL v19 = __OFADD__(v21++, 1LL);
            if (v19) {
              goto LABEL_111;
            }
          }

          else
          {
            if (v21 >= *(void *)(v74 + 16)) {
              goto LABEL_114;
            }
            Swift::UInt v25 = *(void *)(v73 + 8 * v21);
            swift_retain(v25);
            BOOL v19 = __OFADD__(v21++, 1LL);
            if (v19)
            {
LABEL_111:
              __break(1u);
LABEL_112:
              __break(1u);
              goto LABEL_113;
            }
          }

          if (v78)
          {
            swift_bridgeObjectRetain(v22);
            uint64_t v26 = swift_retain(v25);
            char v27 = __CocoaSet.contains(_:)(v26, v75);
            swift_bridgeObjectRelease(v22);
            swift_release(v25);
            if ((v27 & 1) != 0) {
              goto LABEL_29;
            }
          }

          else if (*(void *)(v22 + 16))
          {
            Hasher.init(_seed:)(&v80, *(void *)(v22 + 40));
            Hasher._combine(_:)(v25);
            Swift::Int v28 = Hasher._finalize()();
            uint64_t v29 = -1LL << *(_BYTE *)(v22 + 32);
            unint64_t v30 = v28 & ~v29;
            if (((*(void *)(v77 + ((v30 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v30) & 1) != 0)
            {
              uint64_t v31 = *(void *)(v22 + 48);
              if (*(void *)(v31 + 8 * v30) == v25)
              {
LABEL_29:
                swift_release(v25);
                if (v21 == v20) {
                  goto LABEL_4;
                }
                continue;
              }

              uint64_t v32 = ~v29;
              while (1)
              {
                unint64_t v30 = (v30 + 1) & v32;
                if (((*(void *)(v77 + ((v30 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v30) & 1) == 0) {
                  break;
                }
                if (*(void *)(v31 + 8 * v30) == v25) {
                  goto LABEL_29;
                }
              }
            }
          }

          break;
        }

        uint64_t v33 = a1;
        uint64_t v34 = v86;
        if (!((unint64_t)v86 >> 62))
        {
          a1 = *(void *)((v86 & 0xFFFFFFFFFFFFF8LL) + 0x10);
          swift_bridgeObjectRetain(v86);
          if (a1) {
            goto LABEL_48;
          }
LABEL_57:
          swift_bridgeObjectRelease(v34);
LABEL_58:
          uint64_t v37 = swift_retain(v25);
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v37);
          unint64_t v39 = *(void *)((v86 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
          unint64_t v38 = *(void *)((v86 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
          if (v39 >= v38 >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v38 > 1, v39 + 1, 1LL);
          }
          uint64_t v40 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v39, v25);
          specialized Array._endMutation()(v40);
          if ((v7 & 0xC000000000000001LL) != 0)
          {
LABEL_61:
            if (v7 < 0) {
              uint64_t v41 = v7;
            }
            else {
              uint64_t v41 = v7 & 0xFFFFFFFFFFFFFF8LL;
            }
            swift_retain(v24);
            uint64_t v42 = __CocoaDictionary.count.getter(v41);
            if (__OFADD__(v42, 1LL)) {
              goto LABEL_115;
            }
            uint64_t v7 = sub_10008C03C(v41, v42 + 1);
            goto LABEL_82;
          }

LABEL_81:
          swift_retain(v24);
LABEL_82:
          uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v7);
          uint64_t v80 = v7;
          unint64_t v51 = sub_100058D30(v25);
          uint64_t v52 = *(void *)(v7 + 16);
          BOOL v53 = (v50 & 1) == 0;
          uint64_t v54 = v52 + v53;
          if (__OFADD__(v52, v53)) {
            goto LABEL_112;
          }
          a1 = v50;
          if (*(void *)(v7 + 24) >= v54)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
              sub_1000709B0();
            }
          }

          else
          {
            sub_1000715E0(v54, isUniquelyReferenced_nonNull_native);
            unint64_t v55 = sub_100058D30(v25);
            if ((a1 & 1) != (v56 & 1)) {
              goto LABEL_128;
            }
            unint64_t v51 = v55;
          }

          Swift::UInt v24 = v76;
          uint64_t v7 = v80;
          uint64_t v57 = 8 * v51;
          if ((a1 & 1) != 0)
          {
            uint64_t v58 = *(void *)(v80 + 56);
            swift_release(*(void *)(v58 + v57));
            *(void *)(v58 + v57) = v76;
          }

          else
          {
            *(void *)(v80 + 8 * (v51 >> 6) + 64) |= 1LL << v51;
            *(void *)(*(void *)(v7 + 48) + 8 * v51) = v25;
            *(void *)(*(void *)(v7 + 56) + 8 * v51) = v76;
            uint64_t v59 = *(void *)(v7 + 16);
            BOOL v19 = __OFADD__(v59, 1LL);
            uint64_t v60 = v59 + 1;
            if (v19) {
              goto LABEL_116;
            }
            *(void *)(v7 + 16) = v60;
            swift_retain(v25);
          }

          swift_release(v25);
          swift_bridgeObjectRelease(0x8000000000000000LL);
          a1 = v33;
          if (v21 == v20)
          {
LABEL_4:
            swift_release(v24);
            Swift::Int v8 = v72;
            goto LABEL_5;
          }

          continue;
        }

        break;
      }

      if (v86 < 0) {
        uint64_t v43 = v86;
      }
      else {
        uint64_t v43 = v86 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v86);
      a1 = _CocoaArrayWrapper.endIndex.getter(v43);
      if (!a1) {
        goto LABEL_57;
      }
LABEL_48:
      if ((v34 & 0xC000000000000001LL) != 0)
      {
        uint64_t v44 = specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v34);
        swift_unknownObjectRelease(v44);
        if (v44 != v25)
        {
          if (a1 == 1) {
            goto LABEL_57;
          }
          uint64_t v45 = specialized _ArrayBuffer._getElementSlowPath(_:)(1LL, v34);
          swift_unknownObjectRelease(v45);
          if (v45 != v25)
          {
            if (a1 == 2) {
              goto LABEL_57;
            }
            uint64_t v46 = 2LL;
            while (1)
            {
              uint64_t v47 = specialized _ArrayBuffer._getElementSlowPath(_:)(v46, v34);
              uint64_t v70 = v46 + 1;
              if (__OFADD__(v46, 1LL))
              {
                __break(1u);
                goto LABEL_126;
              }

              uint64_t v48 = v47;
              swift_unknownObjectRelease(v47);
              if (v48 == v25) {
                break;
              }
              ++v46;
              if (v70 == a1)
              {
                swift_bridgeObjectRelease(v34);
                Swift::UInt v24 = v76;
                goto LABEL_58;
              }
            }

            swift_bridgeObjectRelease(v34);
            Swift::UInt v24 = v76;
            if ((v7 & 0xC000000000000001LL) != 0) {
              goto LABEL_61;
            }
            goto LABEL_81;
          }
        }
      }

      else if (*(void *)(v34 + 32) != v25)
      {
        if (a1 == 1) {
          goto LABEL_57;
        }
        if (*(void *)(v34 + 40) != v25)
        {
          if (a1 != 2)
          {
            uint64_t v35 = 6LL;
            while (1)
            {
              uint64_t v36 = v35 - 3;
              if (__OFADD__(v35 - 4, 1LL)) {
                break;
              }
              if (*(void *)(v34 + 8 * v35) == v25) {
                goto LABEL_80;
              }
              ++v35;
              if (v36 == a1) {
                goto LABEL_57;
              }
            }

LABEL_80:
      swift_bridgeObjectRelease(v34);
      if ((v7 & 0xC000000000000001LL) != 0) {
        goto LABEL_61;
      }
      goto LABEL_81;
    }

    uint64_t v20 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(*(void *)(v18 + 40));
    if (v20) {
      goto LABEL_26;
    }
LABEL_107:
    swift_release(v18);
LABEL_5:
    swift_bridgeObjectRelease(a1);
    uint64_t v6 = v86;
  }

  swift_bridgeObjectRelease(v87);
  uint64_t v66 = swift_allocObject(&unk_1000B4260, 24LL, 7LL);
  *(void *)(v66 + 16) = v7;
  uint64_t v67 = swift_allocObject(&unk_1000B4288, 32LL, 7LL);
  *(void *)(v67 + 16) = sub_10008CF28;
  *(void *)(v67 + 24) = v66;
  uint64_t v80 = v18;
  char v81 = 1;
  __int128 v82 = sub_10008CF54;
  uint64_t v83 = v67;
  char v84 = 0;
  __int128 v65 = (void *)sub_10008BDFC();
  uint64_t v64 = v86;
LABEL_110:
  swift_bridgeObjectRelease(v64);
  return (uint64_t)v65;
}

unint64_t sub_10008BDFC()
{
  uint64_t v18 = *(void *)v0;
  char v19 = *(_BYTE *)(v0 + 8);
  unint64_t v1 = *(void *)(v0 + 24);
  sub_10008CF7C(&v18);
  swift_retain(v1);
  unint64_t v2 = sub_10008C658((uint64_t *)v0);
  sub_10008CFA4(&v18);
  swift_release(v1);
  uint64_t v17 = v2;
  if ((v2 & 0x8000000000000000LL) != 0 || (v2 & 0x4000000000000000LL) != 0) {
    goto LABEL_37;
  }
  uint64_t v3 = *(void *)(v2 + 16);
  sub_10008CFA4(&v18);
  swift_release(v1);
  unint64_t v4 = (unint64_t)v3 >> 1;
  while ((unint64_t)(v3 + 1) >= 3)
  {
    unint64_t v2 = 0LL;
    while (1)
    {
      unint64_t v7 = v2 + 1;
      unint64_t v1 = v3 - (v2 + 1);
      if (__OFSUB__(v3, v2 + 1)) {
        break;
      }
      if (v2 != v1)
      {
        uint64_t v8 = v17;
        if ((v17 & 0xC000000000000001LL) != 0)
        {
          uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)(v2, v17);
          uint64_t v11 = specialized _ArrayBuffer._getElementSlowPath(_:)(v3 - (v2 + 1), v17);
        }

        else
        {
          if ((v2 & 0x8000000000000000LL) != 0) {
            goto LABEL_31;
          }
          unint64_t v9 = *(void *)((v17 & 0xFFFFFFFFFFFFF8LL) + 0x10);
          if (v2 >= v9) {
            goto LABEL_32;
          }
          uint64_t v10 = *(void *)(v17 + 8 * v2 + 32);
          swift_retain(v10);
          if ((v1 & 0x8000000000000000LL) != 0) {
            goto LABEL_33;
          }
          if (v1 >= v9) {
            goto LABEL_35;
          }
          uint64_t v11 = *(void *)(v17 + 32 + 8 * v1);
          swift_retain(v11);
        }

        if (!swift_isUniquelyReferenced_nonNull_bridgeObject(v17)
          || v17 < 0
          || (v17 & 0x4000000000000000LL) != 0)
        {
          uint64_t v8 = sub_10005B8C0(v17);
          uint64_t v17 = v8;
        }

        uint64_t v12 = (v8 & 0xFFFFFFFFFFFFFF8LL) + 8 * v2;
        uint64_t v13 = swift_release(*(void *)(v12 + 32));
        *(void *)(v12 + 32) = v11;
        specialized Array._endMutation()(v13);
        unint64_t v2 = v17;
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject(v17)
          || v17 < 0
          || (v17 & 0x4000000000000000LL) != 0)
        {
          unint64_t v2 = sub_10005B8C0(v17);
          uint64_t v17 = v2;
        }

        if ((v1 & 0x8000000000000000LL) != 0) {
          goto LABEL_34;
        }
        if (v1 >= *(void *)((v2 & 0xFFFFFFFFFFFFFF8LL) + 0x10)) {
          goto LABEL_36;
        }
        uint64_t v5 = (v2 & 0xFFFFFFFFFFFFFF8LL) + 8 * v1;
        uint64_t v6 = swift_release(*(void *)(v5 + 32));
        *(void *)(v5 + 32) = v10;
        specialized Array._endMutation()(v6);
      }

      unint64_t v2 = v7;
      if (v4 == v7) {
        return v17;
      }
    }

    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
LABEL_37:
    uint64_t v15 = swift_retain(v2);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_release(v2);
    sub_10008CFA4(&v18);
    swift_release(v1);
    if (v3 >= 0) {
      uint64_t v16 = v3;
    }
    else {
      uint64_t v16 = v3 + 1;
    }
    if (v3 < -1) {
      __break(1u);
    }
    unint64_t v4 = v16 >> 1;
  }

  return v2;
}

Swift::Int sub_10008C03C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100005104(&qword_1000B9D30);
    uint64_t v4 = static _DictionaryStorage.convert(_:capacity:)(a1, a2);
    uint64_t v28 = v4;
    uint64_t v5 = __CocoaDictionary.makeIterator()(a1);
    uint64_t v6 = __CocoaDictionary.Iterator.next()();
    if (v6)
    {
      uint64_t v8 = v7;
      do
      {
        v25[0] = v6;
        uint64_t v19 = sub_100005104(&qword_1000B98E0);
        swift_dynamicCast(&v27, v25, (char *)&type metadata for Swift.AnyObject + 8, v19, 7LL);
        v25[0] = v8;
        swift_dynamicCast(&v26, v25, (char *)&type metadata for Swift.AnyObject + 8, v19, 7LL);
        unint64_t v20 = *(void *)(v4 + 16);
        if (*(void *)(v4 + 24) <= v20)
        {
          sub_1000715E0(v20 + 1, 1LL);
          uint64_t v4 = v28;
        }

        uint64_t v10 = v26;
        Swift::UInt v9 = v27;
        Hasher.init(_seed:)(v25, *(void *)(v4 + 40));
        Hasher._combine(_:)(v9);
        Swift::Int result = Hasher._finalize()();
        uint64_t v12 = v4 + 64;
        uint64_t v13 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v14 = result & ~v13;
        unint64_t v15 = v14 >> 6;
        if (((-1LL << v14) & ~*(void *)(v4 + 64 + 8 * (v14 >> 6))) != 0)
        {
          unint64_t v16 = __clz(__rbit64((-1LL << v14) & ~*(void *)(v4 + 64 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v21 = 0;
          unint64_t v22 = (unint64_t)(63 - v13) >> 6;
          do
          {
            if (++v15 == v22 && (v21 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v23 = v15 == v22;
            if (v15 == v22) {
              unint64_t v15 = 0LL;
            }
            v21 |= v23;
            uint64_t v24 = *(void *)(v12 + 8 * v15);
          }

          while (v24 == -1);
          unint64_t v16 = __clz(__rbit64(~v24)) + (v15 << 6);
        }

        *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v16;
        uint64_t v17 = 8 * v16;
        *(void *)(*(void *)(v4 + 48) + v17) = v9;
        *(void *)(*(void *)(v4 + 56) + v17) = v10;
        ++*(void *)(v4 + 16);
        uint64_t v6 = __CocoaDictionary.Iterator.next()();
        uint64_t v8 = v18;
      }

      while (v6);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }

  return v4;
}

uint64_t sub_10008C26C(uint64_t *a1, void (*a2)(uint64_t *__return_ptr, uint64_t *))
{
  uint64_t v3 = *a1;
  if (*((_BYTE *)a1 + 8) == 1)
  {
    *((_BYTE *)a1 + 8) = 0;
    swift_retain(v3);
  }

  else if (v3)
  {
    uint64_t v7 = *a1;
    swift_retain(v3);
    a2(&v8, &v7);
    swift_release(v3);
    uint64_t v5 = v8;
    swift_retain(v8);
    swift_release(v3);
    *a1 = v5;
    return v5;
  }

  return v3;
}

uint64_t sub_10008C304(uint64_t a1)
{
  uint64_t v55 = a1 + 32;
  uint64_t result = swift_bridgeObjectRetain(a1);
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  unint64_t v6 = 0LL;
  uint64_t v54 = result + 56;
  uint64_t v7 = _swiftEmptyArrayStorage;
  uint64_t v8 = &_swiftEmptyArrayStorage[4];
LABEL_3:
  unint64_t v10 = *(void *)(a1 + 16);
  if (v6 == v10) {
    goto LABEL_32;
  }
  uint64_t v57 = v5;
  if (v6 >= v10)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }

  uint64_t v11 = v7;
  uint64_t v12 = 16 * v6;
  uint64_t v13 = (uint64_t *)(v55 + 16 * v6);
  uint64_t v15 = *v13;
  uint64_t v14 = v13[1];
  swift_bridgeObjectRetain(*v13);
  swift_bridgeObjectRetain(v14);
  uint64_t result = sub_10004E8C8(v4, v3);
  ++v6;
  unint64_t v16 = (uint64_t *)(v54 + v12);
  uint64_t v4 = v15;
  if (!v15) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v9 = *(void *)(v4 + 16);
  if (v9)
  {
    unint64_t v20 = 0LL;
    uint64_t v3 = v14;
    uint64_t v7 = v11;
    uint64_t v5 = v57;
    while (1)
    {
      if (v20 >= v9) {
        goto LABEL_37;
      }
      char v21 = (_OWORD *)(v4 + 192 * v20);
      __int128 v22 = v21[2];
      __int128 v23 = v21[3];
      __int128 v24 = v21[5];
      __int128 v61 = v21[4];
      __int128 v62 = v24;
      __int128 v59 = v22;
      __int128 v60 = v23;
      __int128 v25 = v21[6];
      __int128 v26 = v21[7];
      __int128 v27 = v21[9];
      __int128 v65 = v21[8];
      __int128 v66 = v27;
      __int128 v63 = v25;
      __int128 v64 = v26;
      __int128 v28 = v21[10];
      __int128 v29 = v21[11];
      __int128 v30 = v21[13];
      __int128 v69 = v21[12];
      __int128 v70 = v30;
      __int128 v67 = v28;
      __int128 v68 = v29;
      uint64_t v56 = v3;
      if (v5)
      {
        uint64_t result = sub_10002D724((uint64_t)&v59);
        uint64_t v31 = v7;
      }

      else
      {
        unint64_t v32 = v7[3];
        int64_t v33 = v32 & 0xFFFFFFFFFFFFFFFELL;
        if (v33 <= 1) {
          uint64_t v34 = 1LL;
        }
        else {
          uint64_t v34 = v33;
        }
        uint64_t v35 = sub_100005104(&qword_1000B9230);
        uint64_t v31 = (void *)swift_allocObject(v35, (192 * v34) | 0x20, 7LL);
        uint64_t v36 = (uint64_t)(j__malloc_size(v31) - 32) / 192;
        v31[2] = v34;
        v31[3] = 2 * v36;
        uint64_t v37 = v7[3] >> 1;
        uint64_t v8 = &v31[24 * v37 + 4];
        uint64_t v38 = v36 & 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v5 = v38 - v37;
        if (v7[2])
        {
          uint64_t v58 = v38 - v37;
          unint64_t v39 = v7;
          if (v31 < v7 || v31 + 4 >= &v7[24 * v37 + 4])
          {
            uint64_t v40 = v7 + 4;
            sub_10002D724((uint64_t)&v59);
          }

          else
          {
            uint64_t v40 = v7 + 4;
            sub_10002D724((uint64_t)&v59);
            if (v31 == v39) {
              goto LABEL_27;
            }
          }

          memmove(v31 + 4, v40, 192 * v37);
LABEL_27:
          v39[2] = 0LL;
          uint64_t result = swift_release(v39);
          uint64_t v5 = v58;
          goto LABEL_28;
        }

        sub_10002D724((uint64_t)&v59);
        uint64_t result = swift_release(v7);
      }

uint64_t sub_10008C658(uint64_t *a1)
{
  void (*v2)(uint64_t *__return_ptr, uint64_t *);
  char v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  __int128 v28 = *a1;
  __int128 v29 = *((_BYTE *)a1 + 8);
  unint64_t v2 = (void (*)(uint64_t *__return_ptr, uint64_t *))a1[2];
  uint64_t v1 = a1[3];
  uint64_t v3 = *((_BYTE *)a1 + 32);
  __int128 v26 = v28;
  __int128 v27 = v29;
  sub_10008CF7C(&v28);
  swift_retain(v1);
  if ((v3 & 1) != 0)
  {
    uint64_t v7 = 0LL;
    unint64_t v6 = _swiftEmptyArrayStorage;
  }

  else
  {
    swift_retain(v1);
    v2(&v25, &v26);
    uint64_t result = swift_release(v1);
    uint64_t v5 = v25;
    unint64_t v6 = _swiftEmptyArrayStorage;
    uint64_t v7 = 0LL;
    if (v25)
    {
      uint64_t v8 = &_swiftEmptyArrayStorage[4];
      while (1)
      {
        if (!v7)
        {
          unint64_t v9 = v6[3];
          unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
          if (v10 <= 1) {
            uint64_t v11 = 1LL;
          }
          else {
            uint64_t v11 = v10;
          }
          uint64_t v12 = sub_100005104(&qword_1000B9F08);
          uint64_t v13 = (void *)swift_allocObject(v12, 8 * v11 + 32, 7LL);
          uint64_t v14 = j__malloc_size(v13);
          uint64_t v15 = v14 - 32;
          if (v14 < 32) {
            uint64_t v15 = v14 - 25;
          }
          unint64_t v16 = v15 >> 3;
          v13[2] = v11;
          uint64_t v13[3] = (2 * (v15 >> 3)) | 1;
          unint64_t v17 = (unint64_t)(v13 + 4);
          uint64_t v18 = v6[3] >> 1;
          if (v6[2])
          {
            _OWORD v6[2] = 0LL;
          }

          uint64_t v8 = (void *)(v17 + 8 * v18);
          uint64_t v7 = (v16 & 0x7FFFFFFFFFFFFFFFLL) - v18;
          uint64_t result = swift_release(v6);
          unint64_t v6 = v13;
        }

        unint64_t v20 = __OFSUB__(v7--, 1LL);
        if (v20) {
          break;
        }
        *v8++ = v5;
        swift_retain(v1);
        v2(&v25, &v26);
        uint64_t result = swift_release(v1);
        uint64_t v5 = v25;
        if (!v25) {
          goto LABEL_24;
        }
      }

      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
  }

uint64_t sub_10008C830@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5 = *a1;
  Swift::UInt v6 = swift_retain(*a1);
  uint64_t v7 = sub_10008B304(v6, a2);
  uint64_t result = swift_release(v5);
  *a3 = v7;
  return result;
}

void *sub_10008C87C(uint64_t a1, uint64_t a2)
{
  void (*v10)(void *__return_ptr, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  _BYTE v34[24];
  void v35[13];
  uint64_t v36;
  uint64_t v37;
  uint64_t v3 = v2;
  uint64_t v6 = sub_100005104(&qword_1000B98E0);
  uint64_t v7 = (void *)swift_allocObject(v6, 48LL, 7LL);
  uint64_t v8 = swift_weakInit(v7 + 4, 0LL);
  void v7[2] = a1;
  _OWORD v7[3] = a2;
  swift_weakAssign(v8, 0LL);
  v7[5] = _swiftEmptyArrayStorage;
  unint64_t v9 = v7 + 5;
  unint64_t v10 = *(void (**)(void *__return_ptr, uint64_t, uint64_t))(a2 + 16);
  swift_retain(v7);
  v10(v35, a1, a2);
  uint64_t v11 = v36;
  uint64_t v37 = v36;
  swift_bridgeObjectRetain(v36);
  sub_10002CC24(v35);
  uint64_t v12 = *(void *)(v11 + 16);
  if (v12)
  {
    uint64_t v13 = (void *)(v11 + 40);
    while (1)
    {
      uint64_t v14 = *(v13 - 1);
      uint64_t v15 = *v13;
      if (v14 == a1)
      {
        sub_10002ABC8(&v37);
        swift_release(v7);
        sub_10006BAE0(0LL, v22, v23, v24);
        __int128 v26 = v25;
        __int128 v30 = sub_10008CFD8(v25, v27, v28, v29);
        uint64_t v31 = swift_allocError(v26, v30, 0LL, 0LL);
        *unint64_t v32 = a1;
        v32[1] = v15;
        swift_willThrow(v31);
        goto LABEL_10;
      }

      unint64_t v16 = sub_10008C87C(v14, *v13);
      if (v3) {
        break;
      }
      unint64_t v17 = v16;
      swift_beginAccess(v7 + 5, v34, 33LL, 0LL);
      uint64_t v18 = swift_retain(v17);
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v18);
      unint64_t v20 = *(void *)((*v9 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
      uint64_t v19 = *(void *)((*v9 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
      if (v20 >= v19 >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v19 > 1, v20 + 1, 1LL);
      }
      char v21 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v20, v17);
      specialized Array._endMutation()(v21);
      swift_endAccess(v34);
      swift_weakAssign(v17 + 32, v7);
      swift_release(v17);
      v13 += 2;
      if (!--v12) {
        goto LABEL_8;
      }
    }

    sub_10002ABC8(&v37);
    swift_release_n(v7, 2LL);
  }

  else
  {
LABEL_8:
    sub_10002ABC8(&v37);
LABEL_10:
    swift_release(v7);
  }

  return v7;
}

Swift::Int sub_10008CA80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100005104(&qword_1000B98B0);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = v1;
    uint64_t v26 = a1 + 32;
    while (1)
    {
      uint64_t v6 = v26 + 24 * v4;
      Swift::UInt v7 = *(void *)v6;
      Swift::UInt v8 = *(void *)(v6 + 8);
      char v9 = *(_BYTE *)(v6 + 16);
      char v10 = *(_BYTE *)(v6 + 17);
      Hasher.init(_seed:)(v27, *(void *)(v3 + 40));
      if ((v10 & 1) != 0 || (Hasher._combine(_:)(1uLL), Hasher._combine(_:)(v7), (v9 & 1) != 0))
      {
        Swift::UInt v11 = 0LL;
      }

      else
      {
        Hasher._combine(_:)(1uLL);
        Swift::UInt v11 = v8;
      }

      Hasher._combine(_:)(v11);
      Swift::Int result = Hasher._finalize()();
      uint64_t v13 = ~(-1LL << *(_BYTE *)(v3 + 32));
      unint64_t v14 = result & v13;
      unint64_t v15 = (result & (unint64_t)v13) >> 6;
      uint64_t v16 = *(void *)(v5 + 8 * v15);
      uint64_t v17 = 1LL << (result & v13);
      uint64_t v18 = *(void *)(v3 + 48);
      if ((v17 & v16) != 0)
      {
        do
        {
          uint64_t v23 = v18 + 24 * v14;
          if ((*(_BYTE *)(v23 + 17) & 1) != 0)
          {
            if ((v10 & 1) != 0) {
              goto LABEL_3;
            }
          }

          else
          {
            if (*(void *)v23 == v7) {
              char v24 = v10;
            }
            else {
              char v24 = 1;
            }
            if ((v24 & 1) == 0)
            {
              if ((*(_BYTE *)(v23 + 16) & 1) != 0)
              {
                if ((v9 & 1) != 0) {
                  goto LABEL_3;
                }
              }

              else if ((v9 & 1) == 0 && *(void *)(v23 + 8) == v8)
              {
                goto LABEL_3;
              }
            }
          }

          unint64_t v14 = (v14 + 1) & v13;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)(v5 + 8 * (v14 >> 6));
          uint64_t v17 = 1LL << v14;
        }

        while ((v16 & (1LL << v14)) != 0);
      }

      *(void *)(v5 + 8 * v15) = v17 | v16;
      uint64_t v19 = v18 + 24 * v14;
      *(void *)uint64_t v19 = v7;
      *(void *)(v19 + 8) = v8;
      *(_BYTE *)(v19 + 16) = v9;
      *(_BYTE *)(v19 + 17) = v10;
      uint64_t v20 = *(void *)(v3 + 16);
      BOOL v21 = __OFADD__(v20, 1LL);
      uint64_t v22 = v20 + 1;
      if (v21) {
        break;
      }
      *(void *)(v3 + 16) = v22;
LABEL_3:
      if (++v4 == v25) {
        return v3;
      }
    }

    __break(1u);
  }

  else
  {
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  return result;
}

Swift::Int sub_10008CC44(Swift::Int result)
{
  uint64_t v1 = result;
  unint64_t v2 = (unint64_t)result >> 62;
  if ((unint64_t)result >> 62)
  {
    if (result < 0) {
      uint64_t v6 = result;
    }
    else {
      uint64_t v6 = result & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(result);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v6);
    Swift::Int result = swift_bridgeObjectRelease(v1);
    if (v3)
    {
LABEL_3:
      sub_100005104(&qword_1000B98E8);
      Swift::Int result = static _SetStorage.allocate(capacity:)(v3);
      uint64_t v4 = (void *)result;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_11:
      if (v1 < 0) {
        uint64_t v7 = v1;
      }
      else {
        uint64_t v7 = v1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(v1);
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v7);
      Swift::Int result = swift_bridgeObjectRelease(v1);
      if (!v5) {
        return (Swift::Int)v4;
      }
      goto LABEL_15;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (v3) {
      goto LABEL_3;
    }
  }

  uint64_t v4 = &_swiftEmptySetSingleton;
  if (v2) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v5) {
    return (Swift::Int)v4;
  }
LABEL_15:
  Swift::UInt v8 = (char *)(v4 + 7);
  if ((v1 & 0xC000000000000001LL) == 0)
  {
    uint64_t v21 = 0LL;
    uint64_t v22 = v1 + 32;
    uint64_t v23 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    while (1)
    {
      if (v21 == v23) {
        goto LABEL_41;
      }
      Swift::UInt v26 = *(void *)(v22 + 8 * v21);
      Hasher.init(_seed:)(v34, v4[5]);
      Hasher._combine(_:)(v26);
      Swift::Int result = Hasher._finalize()();
      uint64_t v27 = -1LL << *((_BYTE *)v4 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      uint64_t v30 = *(void *)&v8[8 * (v28 >> 6)];
      uint64_t v31 = 1LL << v28;
      uint64_t v32 = v4[6];
      if (((1LL << v28) & v30) == 0) {
        goto LABEL_29;
      }
      if (*(void *)(v32 + 8 * v28) != v26) {
        break;
      }
LABEL_31:
      if (++v21 == v5) {
        return (Swift::Int)v4;
      }
    }

    uint64_t v33 = ~v27;
    while (1)
    {
      unint64_t v28 = (v28 + 1) & v33;
      unint64_t v29 = v28 >> 6;
      uint64_t v30 = *(void *)&v8[8 * (v28 >> 6)];
      uint64_t v31 = 1LL << v28;
      if ((v30 & (1LL << v28)) == 0) {
        break;
      }
      if (*(void *)(v32 + 8 * v28) == v26) {
        goto LABEL_31;
      }
    }

uint64_t sub_10008CF04()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_10008CF28@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_10008C830(a1, *(void *)(v2 + 16), a2);
}

uint64_t sub_10008CF30()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_10008CF54@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10008C26C(a1, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v2 + 16));
  *a2 = result;
  return result;
}

void *sub_10008CF7C(void *a1)
{
  return a1;
}

void *sub_10008CFA4(void *a1)
{
  return a1;
}

uint64_t _s19InitializationErrorOMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100037B54(a1, a2, a3, a4, (uint64_t)&_s19InitializationErrorOMn);
}

unint64_t sub_10008CFD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t result = qword_1000B9F10[0];
  if (!qword_1000B9F10[0])
  {
    sub_10006BAE0(255LL, a2, a3, a4);
    unint64_t result = swift_getWitnessTable(&unk_10009AF18, v5);
    atomic_store(result, qword_1000B9F10);
  }

  return result;
}

uint64_t sub_10008D020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 0LL);
}

uint64_t ToolInfoHeader.serializationVersion.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

unint64_t sub_10008D030()
{
  return 0xD000000000000014LL;
}

uint64_t sub_10008D04C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result = sub_100091224(a1, a2);
  *a3 = result != 0;
  return result;
}

uint64_t sub_10008D078(uint64_t a1)
{
  unint64_t v2 = sub_10008D1CC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10008D0A0(uint64_t a1)
{
  unint64_t v2 = sub_10008D1CC();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *ToolInfoHeader.init(from:)(void *a1)
{
  uint64_t v3 = sub_100005104(&qword_1000B9F98);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = sub_100006270(a1, v7);
  unint64_t v10 = sub_10008D1CC();
  uint64_t v11 = dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ToolInfoHeader.CodingKeys,  &type metadata for ToolInfoHeader.CodingKeys,  v10,  v7,  v8);
  if (!v1)
  {
    uint64_t v9 = (void *)KeyedDecodingContainer.decode(_:forKey:)(v11, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  sub_1000062D8(a1);
  return v9;
}

unint64_t sub_10008D1CC()
{
  unint64_t result = qword_1000C2670;
  if (!qword_1000C2670)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B9E4, &type metadata for ToolInfoHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C2670);
  }

  return result;
}

uint64_t sub_10008D210@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100005104(&qword_1000B9F98);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006270(a1, v9);
  unint64_t v11 = sub_10008D1CC();
  uint64_t v12 = dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ToolInfoHeader.CodingKeys,  &type metadata for ToolInfoHeader.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_1000062D8(a1);
  }
  uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)(v12, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t result = sub_1000062D8(a1);
  *a2 = v13;
  return result;
}

uint64_t ToolInfoV0.serializationVersion.getter()
{
  return *(void *)v0;
}

uint64_t *ToolInfoV0.command.getter@<X0>(uint64_t *a1@<X8>)
{
  return sub_10008D334((uint64_t *)(v1 + 8), a1);
}

uint64_t *sub_10008D334(uint64_t *a1, uint64_t *a2)
{
  return initializeWithCopy for CommandInfoV0(a2, a1);
}

void *ToolInfoV0.command.setter(uint64_t a1)
{
  return sub_10008D34C(a1, (void *)(v1 + 8));
}

void *sub_10008D34C(uint64_t a1, void *a2)
{
  return assignWithTake for CommandInfoV0(a2, a1);
}

Swift::String_optional (__swiftcall *ToolInfoV0.command.modify())(Swift::String argument)
{
  return String.init(argument:);
}

__n128 ToolInfoV0.init(command:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)a2 = 0LL;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)a1;
  *(void *)(a2 + 24) = v2;
  __int128 v3 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 48) = v3;
  __n128 result = *(__n128 *)(a1 + 56);
  __int128 v5 = *(_OWORD *)(a1 + 72);
  *(__n128 *)(a2 + 64) = result;
  *(_OWORD *)(a2 + 80) = v5;
  return result;
}

void *ToolInfoV0.hash(into:)(uint64_t a1)
{
  return sub_1000772CC(v1);
}

uint64_t static ToolInfoV0.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(void *)a1 == *(void *)a2)
  {
    __int128 v2 = *(_OWORD *)(a1 + 56);
    v10[2] = *(_OWORD *)(a1 + 40);
    v10[3] = v2;
    v10[4] = *(_OWORD *)(a1 + 72);
    uint64_t v11 = *(void *)(a1 + 88);
    __int128 v3 = *(_OWORD *)(a1 + 24);
    v10[0] = *(_OWORD *)(a1 + 8);
    v10[1] = v3;
    __int128 v4 = *(_OWORD *)(a2 + 56);
    v8[2] = *(_OWORD *)(a2 + 40);
    _OWORD v8[3] = v4;
    v8[4] = *(_OWORD *)(a2 + 72);
    uint64_t v9 = *(void *)(a2 + 88);
    __int128 v5 = *(_OWORD *)(a2 + 24);
    v8[0] = *(_OWORD *)(a2 + 8);
    v8[1] = v5;
    char v6 = _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v10, (uint64_t)v8);
  }

  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

uint64_t sub_10008D4AC()
{
  if (*v0) {
    return 0x646E616D6D6F63LL;
  }
  else {
    return 0xD000000000000014LL;
  }
}

uint64_t sub_10008D4EC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100091998(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10008D510(uint64_t a1)
{
  unint64_t v2 = sub_100091910();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10008D538(uint64_t a1)
{
  unint64_t v2 = sub_100091910();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ToolInfoV0.encode(to:)(void *a1)
{
  __int128 v3 = v1;
  uint64_t v5 = sub_100005104(&qword_1000B9FA0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006270(a1, v9);
  unint64_t v11 = sub_100091910();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ToolInfoV0.CodingKeys,  &type metadata for ToolInfoV0.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  LOBYTE(v19[0]) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v19, v5);
  if (!v2)
  {
    __int128 v13 = *(_OWORD *)(v3 + 7);
    v19[2] = *(_OWORD *)(v3 + 5);
    v19[3] = v13;
    void v19[4] = *(_OWORD *)(v3 + 9);
    uint64_t v20 = v3[11];
    __int128 v14 = *(_OWORD *)(v3 + 3);
    v19[0] = *(_OWORD *)(v3 + 1);
    v19[1] = v14;
    char v18 = 1;
    unint64_t v15 = sub_100091954();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v19, &v18, v5, &type metadata for CommandInfoV0, v15);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int ToolInfoV0.hashValue.getter()
{
  __int128 v1 = *(_OWORD *)(v0 + 56);
  __int128 v7 = *(_OWORD *)(v0 + 40);
  __int128 v8 = v1;
  __int128 v9 = *(_OWORD *)(v0 + 72);
  uint64_t v10 = *(void *)(v0 + 88);
  __int128 v2 = *(_OWORD *)(v0 + 24);
  __int128 v5 = *(_OWORD *)(v0 + 8);
  __int128 v6 = v2;
  sub_100077204((void *)v0);
  CommandInfoV0.hash(into:)((uint64_t)v4);
  sub_1000772CC((void *)v0);
  return Hasher._finalize()();
}

double ToolInfoV0.init(from:)@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v8[3];
    a2[2] = v8[2];
    a2[3] = v5;
    __int128 v6 = v8[5];
    a2[4] = v8[4];
    a2[5] = v6;
    double result = *(double *)v8;
    __int128 v7 = v8[1];
    *a2 = v8[0];
    a2[1] = v7;
  }

  return result;
}

uint64_t sub_10008D77C(void *a1)
{
  return ToolInfoV0.encode(to:)(a1);
}

Swift::Int sub_10008D790()
{
  Swift::UInt v2 = *v0;
  Swift::UInt v1 = v0[1];
  Swift::UInt v4 = v0[2];
  Swift::UInt v3 = v0[3];
  Swift::UInt v5 = v0[5];
  Swift::UInt v6 = v0[7];
  Swift::UInt v12 = v0[6];
  Swift::UInt v13 = v0[4];
  Swift::UInt v7 = v0[9];
  Swift::UInt v11 = v0[8];
  Swift::UInt v8 = v0[10];
  Swift::UInt v9 = v0[11];
  Hasher.init(_seed:)(v14, 0LL);
  Hasher._combine(_:)(v2);
  v14[9] = v1;
  v14[10] = v4;
  v14[11] = v3;
  v14[12] = v13;
  v14[13] = v5;
  v14[14] = v12;
  v14[15] = v6;
  _BYTE v14[16] = v11;
  v14[17] = v7;
  v14[18] = v8;
  v14[19] = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v1);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  CommandInfoV0.hash(into:)((uint64_t)v14);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v1);
  return Hasher._finalize()();
}

uint64_t sub_10008D8B0(uint64_t a1)
{
  Swift::UInt v2 = v1[1];
  Swift::UInt v3 = v1[3];
  Swift::UInt v4 = v1[5];
  Swift::UInt v5 = v1[7];
  Swift::UInt v6 = v1[9];
  Swift::UInt v7 = v1[10];
  Swift::UInt v8 = v1[11];
  Hasher._combine(_:)(*v1);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  CommandInfoV0.hash(into:)(a1);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  return swift_bridgeObjectRelease(v2);
}

Swift::Int sub_10008D9C4(uint64_t a1)
{
  Swift::UInt v3 = *v1;
  Swift::UInt v2 = v1[1];
  Swift::UInt v5 = v1[2];
  Swift::UInt v4 = v1[3];
  Swift::UInt v6 = v1[5];
  Swift::UInt v7 = v1[7];
  Swift::UInt v13 = v1[6];
  Swift::UInt v14 = v1[4];
  Swift::UInt v8 = v1[9];
  Swift::UInt v12 = v1[8];
  Swift::UInt v9 = v1[10];
  Swift::UInt v10 = v1[11];
  Hasher.init(_seed:)(v15, a1);
  Hasher._combine(_:)(v3);
  void v15[9] = v2;
  v15[10] = v5;
  v15[11] = v4;
  v15[12] = v14;
  v15[13] = v6;
  v15[14] = v13;
  v15[15] = v7;
  _BYTE v15[16] = v12;
  v15[17] = v8;
  v15[18] = v9;
  v15[19] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  CommandInfoV0.hash(into:)((uint64_t)v15);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v2);
  return Hasher._finalize()();
}

uint64_t sub_10008DAE0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  __int128 v3 = *(_OWORD *)(a1 + 7);
  v12[2] = *(_OWORD *)(a1 + 5);
  v12[3] = v3;
  v12[4] = *(_OWORD *)(a1 + 9);
  uint64_t v13 = a1[11];
  __int128 v4 = *(_OWORD *)(a1 + 3);
  v12[0] = *(_OWORD *)(a1 + 1);
  v12[1] = v4;
  uint64_t v5 = *a2;
  __int128 v6 = *(_OWORD *)(a2 + 3);
  v14[0] = *(_OWORD *)(a2 + 1);
  v14[1] = v6;
  __int128 v7 = *(_OWORD *)(a2 + 5);
  __int128 v8 = *(_OWORD *)(a2 + 7);
  __int128 v9 = *(_OWORD *)(a2 + 9);
  uint64_t v15 = a2[11];
  v14[3] = v8;
  v14[4] = v9;
  void v14[2] = v7;
  if (v2 == v5) {
    char v10 = _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v12, (uint64_t)v14);
  }
  else {
    char v10 = 0;
  }
  return v10 & 1;
}

uint64_t CommandInfoV0.superCommands.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*v1);
  *Swift::UInt v1 = a1;
  return result;
}

uint64_t ArgumentInfoV0.sectionTitle.getter()
{
  uint64_t v1 = *(void *)(v0 + 8);
  swift_bridgeObjectRetain(*(void *)(v0 + 16));
  return v1;
}

uint64_t ArgumentInfoV0.sectionTitle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 16));
  *(void *)(v2 + 8) = a1;
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t CommandInfoV0.abstract.getter()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain(*(void *)(v0 + 32));
  return v1;
}

uint64_t CommandInfoV0.abstract.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 32));
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.isOptional.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.discussion.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain(*(void *)(v0 + 48));
  return v1;
}

uint64_t CommandInfoV0.discussion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 48));
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.preferredName.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.defaultSubcommand.getter()
{
  uint64_t v1 = *(void *)(v0 + 56);
  swift_bridgeObjectRetain(*(void *)(v0 + 64));
  return v1;
}

uint64_t CommandInfoV0.defaultSubcommand.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 64));
  *(void *)(v2 + 56) = a1;
  *(void *)(v2 + 64) = a2;
  return result;
}

Swift::String_optional (__swiftcall *CommandInfoV0.defaultSubcommand.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.subcommands.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 72));
}

uint64_t CommandInfoV0.subcommands.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 72));
  *(void *)(v1 + 72) = a1;
  return result;
}

Swift::String_optional (__swiftcall *CommandInfoV0.subcommands.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t CommandInfoV0.arguments.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 80));
}

uint64_t CommandInfoV0.arguments.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 80));
  *(void *)(v1 + 80) = a1;
  return result;
}

uint64_t CommandInfoV0.init(superCommands:commandName:abstract:discussion:defaultSubcommand:subcommands:arguments:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, void *a9@<X8>, unint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17 = a1;
  if (!*(void *)(a1 + 16))
  {
    swift_bridgeObjectRelease(a1);
    uint64_t v17 = 0LL;
  }

  unint64_t v19 = a10;
  if ((a5 & 0x2000000000000000LL) != 0) {
    uint64_t v20 = HIBYTE(a5) & 0xF;
  }
  else {
    uint64_t v20 = a4 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(a3);
  if (!v20)
  {
    swift_bridgeObjectRelease(a5);
    a4 = 0LL;
    a5 = 0LL;
  }

  uint64_t v21 = a11;
  if ((a7 & 0x2000000000000000LL) != 0) {
    uint64_t v22 = HIBYTE(a7) & 0xF;
  }
  else {
    uint64_t v22 = a6 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain(a5);
  if (v22)
  {
    uint64_t v23 = a12;
    if (!a10) {
      goto LABEL_18;
    }
  }

  else
  {
    swift_bridgeObjectRelease(a7);
    a6 = 0LL;
    a7 = 0LL;
    uint64_t v23 = a12;
    if (!a10) {
      goto LABEL_18;
    }
  }

  uint64_t v24 = HIBYTE(a10) & 0xF;
  if ((a10 & 0x2000000000000000LL) == 0) {
    uint64_t v24 = a8 & 0xFFFFFFFFFFFFLL;
  }
  if (v24)
  {
LABEL_18:
    swift_bridgeObjectRetain(a7);
    if (*(void *)(a11 + 16)) {
      goto LABEL_19;
    }
LABEL_22:
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRelease(a11);
    uint64_t v21 = 0LL;
    if (*(void *)(v23 + 16)) {
      goto LABEL_20;
    }
LABEL_23:
    swift_bridgeObjectRetain(v21);
    swift_bridgeObjectRelease(v23);
    uint64_t v23 = 0LL;
    goto LABEL_24;
  }

  swift_bridgeObjectRetain(a7);
  swift_bridgeObjectRelease(a10);
  a8 = 0LL;
  unint64_t v19 = 0LL;
  if (!*(void *)(a11 + 16)) {
    goto LABEL_22;
  }
LABEL_19:
  swift_bridgeObjectRetain(v19);
  if (!*(void *)(v23 + 16)) {
    goto LABEL_23;
  }
LABEL_20:
  swift_bridgeObjectRetain(v21);
LABEL_24:
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(a7);
  swift_bridgeObjectRelease(a5);
  swift_bridgeObjectRelease(a3);
  uint64_t result = swift_bridgeObjectRelease_n(v17, 2LL);
  *a9 = v17;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = v19;
  a9[9] = v21;
  a9[10] = v23;
  return result;
}

void CommandInfoV0.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if (*v1)
  {
    Hasher._combine(_:)(1u);
    Swift::UInt v5 = *(void *)(v4 + 16);
    Hasher._combine(_:)(v5);
    if (v5)
    {
      swift_bridgeObjectRetain(v4);
      __int128 v6 = (void *)(v4 + 40);
      do
      {
        uint64_t v7 = *(v6 - 1);
        uint64_t v8 = *v6;
        swift_bridgeObjectRetain(*v6);
        String.hash(into:)(a1, v7, v8);
        swift_bridgeObjectRelease(v8);
        v6 += 2;
        --v5;
      }

      while (v5);
      swift_bridgeObjectRelease(v4);
    }
  }

  else
  {
    Hasher._combine(_:)(0);
  }

  uint64_t v9 = v2[1];
  uint64_t v10 = v2[2];
  swift_bridgeObjectRetain(v10);
  String.hash(into:)(a1, v9, v10);
  swift_bridgeObjectRelease(v10);
  uint64_t v11 = v2[4];
  if (v11)
  {
    uint64_t v12 = v2[3];
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v11);
    String.hash(into:)(a1, v12, v11);
    swift_bridgeObjectRelease(v11);
    uint64_t v13 = v2[6];
    if (v13) {
      goto LABEL_9;
    }
  }

  else
  {
    Hasher._combine(_:)(0);
    uint64_t v13 = v2[6];
    if (v13)
    {
LABEL_9:
      uint64_t v14 = v2[5];
      Hasher._combine(_:)(1u);
      swift_bridgeObjectRetain(v13);
      String.hash(into:)(a1, v14, v13);
      swift_bridgeObjectRelease(v13);
      uint64_t v15 = v2[8];
      if (v15) {
        goto LABEL_10;
      }
      goto LABEL_22;
    }
  }

  Hasher._combine(_:)(0);
  uint64_t v15 = v2[8];
  if (v15)
  {
LABEL_10:
    uint64_t v16 = v2[7];
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v15);
    String.hash(into:)(a1, v16, v15);
    swift_bridgeObjectRelease(v15);
    uint64_t v17 = v2[9];
    if (v17) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }

uint64_t sub_10008E2A4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10008E2E4 + 4 * byte_10009AF60[a1]))( 0x6D6F437265707573LL,  0xED000073646E616DLL);
}

uint64_t sub_10008E2E4()
{
  return 0x4E646E616D6D6F63LL;
}

uint64_t sub_10008E304()
{
  return 0x7463617274736261LL;
}

uint64_t sub_10008E31C()
{
  return 0x6973737563736964LL;
}

unint64_t sub_10008E338()
{
  return 0xD000000000000011LL;
}

uint64_t sub_10008E354()
{
  return 0x616D6D6F63627573LL;
}

uint64_t sub_10008E374()
{
  return 0x746E656D75677261LL;
}

uint64_t sub_10008E390()
{
  return sub_10008E2A4(*v0);
}

uint64_t sub_10008E398@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100091EF8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10008E3BC(uint64_t a1)
{
  unint64_t v2 = sub_100091E70();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10008E3E4(uint64_t a1)
{
  unint64_t v2 = sub_100091E70();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t CommandInfoV0.encode(to:)(void *a1)
{
  __int128 v3 = v1;
  uint64_t v5 = sub_100005104(&qword_1000B9FB0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006270(a1, v9);
  unint64_t v11 = sub_100091E70();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for CommandInfoV0.CodingKeys,  &type metadata for CommandInfoV0.CodingKeys,  v11,  v9,  v10);
  sub_10002AACC((uint64_t)v3, (uint64_t)v32, &qword_1000B9FB8);
  sub_10002AACC((uint64_t)v32, (uint64_t)v29, &qword_1000B9FB8);
  char v28 = 0;
  uint64_t v12 = sub_100005104(&qword_1000B9FC0);
  uint64_t v13 = sub_1000952B8( &qword_1000B9FC8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v29, &v28, v5, v12, v13);
  if (!v2)
  {
    uint64_t v14 = v3[1];
    uint64_t v15 = v3[2];
    v29[0] = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, v29, v5);
    uint64_t v16 = v3[3];
    uint64_t v17 = v3[4];
    v29[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16, v17, v29, v5);
    uint64_t v18 = v3[5];
    uint64_t v19 = v3[6];
    v29[0] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v18, v19, v29, v5);
    uint64_t v20 = v3[7];
    uint64_t v21 = v3[8];
    v29[0] = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v20, v21, v29, v5);
    sub_10002AACC((uint64_t)(v3 + 9), (uint64_t)v31, &qword_1000B9FD0);
    sub_10002AACC((uint64_t)v31, (uint64_t)v29, &qword_1000B9FD0);
    char v28 = 5;
    uint64_t v22 = sub_100005104(&qword_1000B9FD8);
    uint64_t v23 = sub_100080D6C( &qword_1000B9FE0,  &qword_1000B9FD8,  (void (*)(void))sub_100091954,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v29, &v28, v5, v22, v23);
    sub_10002AACC((uint64_t)(v3 + 10), (uint64_t)v30, &qword_1000B9FE8);
    sub_10002AACC((uint64_t)v30, (uint64_t)v29, &qword_1000B9FE8);
    char v28 = 6;
    uint64_t v24 = sub_100005104(&qword_1000B9FF0);
    uint64_t v25 = sub_100080D6C( &qword_1000B9FF8,  &qword_1000B9FF0,  (void (*)(void))sub_100091EB4,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v29, &v28, v5, v24, v25);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int CommandInfoV0.hashValue.getter()
{
  return Hasher._finalize()();
}

double CommandInfoV0.init(from:)@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(void *)(a2 + 80) = v8;
    double result = *(double *)v7;
    __int128 v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }

  return result;
}

uint64_t sub_10008E7A0(void *a1)
{
  return CommandInfoV0.encode(to:)(a1);
}

Swift::Int sub_10008E7EC(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_10008E824(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a1 + 48);
  void v7[2] = *(_OWORD *)(a1 + 32);
  _OWORD v7[3] = v2;
  v7[4] = *(_OWORD *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  __int128 v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  __int128 v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  v9[4] = *(_OWORD *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 80);
  __int128 v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((uint64_t)v7, (uint64_t)v9) & 1;
}

ArgumentParserToolInfo::ArgumentInfoV0::NameInfoV0::KindV0_optional __swiftcall ArgumentInfoV0.NameInfoV0.KindV0.init(rawValue:)( Swift::String rawValue)
{
  v1._rawValue = &off_1000B4370;
  return (ArgumentParserToolInfo::ArgumentInfoV0::NameInfoV0::KindV0_optional)sub_100092C10(rawValue, v1);
}

uint64_t ArgumentInfoV0.NameInfoV0.KindV0.rawValue.getter(char a1)
{
  if (!a1) {
    return 1735290732LL;
  }
  if (a1 == 1) {
    return 0x74726F6873LL;
  }
  return 0xD000000000000012LL;
}

uint64_t sub_10008E8F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10008E904(*a1, *a2);
}

uint64_t sub_10008E904(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 1735290732LL;
  int v3 = a1;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v4 = 0x74726F6873LL;
    }
    else {
      unint64_t v4 = 0xD000000000000012LL;
    }
    if (v3 == 1) {
      unint64_t v5 = 0xE500000000000000LL;
    }
    else {
      unint64_t v5 = 0x800000010009E170LL;
    }
    int v6 = a2;
    if (a2)
    {
LABEL_9:
      if (v6 == 1) {
        unint64_t v2 = 0x74726F6873LL;
      }
      else {
        unint64_t v2 = 0xD000000000000012LL;
      }
      if (v6 == 1) {
        unint64_t v7 = 0xE500000000000000LL;
      }
      else {
        unint64_t v7 = 0x800000010009E170LL;
      }
      if (v4 != v2) {
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }

  else
  {
    unint64_t v5 = 0xE400000000000000LL;
    unint64_t v4 = 1735290732LL;
    int v6 = a2;
    if (a2) {
      goto LABEL_9;
    }
  }

  unint64_t v7 = 0xE400000000000000LL;
  if (v4 != 1735290732)
  {
LABEL_21:
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v2, v7, 0LL);
    goto LABEL_22;
  }

uint64_t sub_10008EA04(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xEA00000000006C61LL;
  uint64_t v3 = 0x6E6F697469736F70LL;
  int v4 = a1;
  if (a1)
  {
    if (a1 == 1) {
      uint64_t v5 = 0x6E6F6974706FLL;
    }
    else {
      uint64_t v5 = 1734437990LL;
    }
    if (v4 == 1) {
      unint64_t v6 = 0xE600000000000000LL;
    }
    else {
      unint64_t v6 = 0xE400000000000000LL;
    }
    int v7 = a2;
    if (!a2) {
      goto LABEL_15;
    }
    goto LABEL_9;
  }

  uint64_t v5 = 0x6E6F697469736F70LL;
  unint64_t v6 = 0xEA00000000006C61LL;
  int v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1) {
      uint64_t v3 = 0x6E6F6974706FLL;
    }
    else {
      uint64_t v3 = 1734437990LL;
    }
    if (v7 == 1) {
      unint64_t v2 = 0xE600000000000000LL;
    }
    else {
      unint64_t v2 = 0xE400000000000000LL;
    }
  }

unint64_t sub_10008EB04@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  v3._rawValue = &off_1000B4370;
  unint64_t result = sub_100092C10(*a1, v3);
  *a2 = result;
  return result;
}

void sub_10008EB38(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xE400000000000000LL;
  unint64_t v4 = 0xE500000000000000LL;
  unint64_t v5 = 0x74726F6873LL;
  if (v2 != 1)
  {
    unint64_t v5 = 0xD000000000000012LL;
    unint64_t v4 = 0x800000010009E170LL;
  }

  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 1735290732LL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_10008EB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000951EC();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10008EBEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000951EC();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

Swift::Int sub_10008EC38()
{
  int v1 = *v0;
  Hasher.init(_seed:)(v7, 0LL);
  unint64_t v2 = 0xE500000000000000LL;
  unint64_t v3 = 0x74726F6873LL;
  if (v1 != 1)
  {
    unint64_t v3 = 0xD000000000000012LL;
    unint64_t v2 = 0x800000010009E170LL;
  }

  if (v1) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 1735290732LL;
  }
  if (v1) {
    unint64_t v5 = v2;
  }
  else {
    unint64_t v5 = 0xE400000000000000LL;
  }
  String.hash(into:)(v7, v4, v5);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_10008ECD0(uint64_t a1)
{
  unint64_t v2 = 0xE500000000000000LL;
  unint64_t v3 = 0x74726F6873LL;
  if (*v1 != 1)
  {
    unint64_t v3 = 0xD000000000000012LL;
    unint64_t v2 = 0x800000010009E170LL;
  }

  if (*v1) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 1735290732LL;
  }
  if (*v1) {
    unint64_t v5 = v2;
  }
  else {
    unint64_t v5 = 0xE400000000000000LL;
  }
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10008ED44(uint64_t a1)
{
  int v2 = *v1;
  Hasher.init(_seed:)(v8, a1);
  unint64_t v3 = 0xE500000000000000LL;
  unint64_t v4 = 0x74726F6873LL;
  if (v2 != 1)
  {
    unint64_t v4 = 0xD000000000000012LL;
    unint64_t v3 = 0x800000010009E170LL;
  }

  if (v2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 1735290732LL;
  }
  if (v2) {
    unint64_t v6 = v3;
  }
  else {
    unint64_t v6 = 0xE400000000000000LL;
  }
  String.hash(into:)(v8, v5, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

uint64_t ArgumentInfoV0.kind.setter(uint64_t result)
{
  *int v1 = result;
  return result;
}

uint64_t ArgumentInfoV0.NameInfoV0.name.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2;
}

uint64_t ArgumentInfoV0.NameInfoV0.hash(into:)(uint64_t a1, unsigned __int8 a2, uint64_t a3, uint64_t a4)
{
  int v7 = a2;
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v8 = 0x74726F6873LL;
    }
    else {
      unint64_t v8 = 0xD000000000000012LL;
    }
    if (v7 == 1) {
      unint64_t v9 = 0xE500000000000000LL;
    }
    else {
      unint64_t v9 = 0x800000010009E170LL;
    }
  }

  else
  {
    unint64_t v9 = 0xE400000000000000LL;
    unint64_t v8 = 1735290732LL;
  }

  String.hash(into:)(a1, v8, v9);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRetain(a4);
  String.hash(into:)(a1, a3, a4);
  return swift_bridgeObjectRelease(a4);
}

uint64_t sub_10008EEBC()
{
  if (*v0) {
    return 1701667182LL;
  }
  else {
    return 1684957547LL;
  }
}

uint64_t sub_10008EEE0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1000929D4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10008EF04(uint64_t a1)
{
  unint64_t v2 = sub_10009294C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10008EF2C(uint64_t a1)
{
  unint64_t v2 = sub_10009294C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ArgumentInfoV0.NameInfoV0.encode(to:)(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v18 = a4;
  uint64_t v8 = sub_100005104(&qword_1000BA008);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = a1[3];
  uint64_t v13 = a1[4];
  sub_100006270(a1, v12);
  unint64_t v14 = sub_10009294C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys,  &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys,  v14,  v12,  v13);
  char v21 = a2;
  char v20 = 0;
  unint64_t v15 = sub_100092990();
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v20, v8, &type metadata for ArgumentInfoV0.NameInfoV0.KindV0, v15);
  if (!v4)
  {
    char v19 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(a3, v18, &v19, v8);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

Swift::Int ArgumentInfoV0.NameInfoV0.hashValue.getter(char a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v6 = 0x74726F6873LL;
    }
    else {
      unint64_t v6 = 0xD000000000000012LL;
    }
    if (a1 == 1) {
      unint64_t v7 = 0xE500000000000000LL;
    }
    else {
      unint64_t v7 = 0x800000010009E170LL;
    }
  }

  else
  {
    unint64_t v7 = 0xE400000000000000LL;
    unint64_t v6 = 1735290732LL;
  }

  String.hash(into:)(v9, v6, v7);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRetain(a3);
  String.hash(into:)(v9, a2, a3);
  swift_bridgeObjectRelease(a3);
  return Hasher._finalize()();
}

uint64_t ArgumentInfoV0.NameInfoV0.init(from:)(void *a1)
{
  return sub_100092AA4(a1);
}

uint64_t sub_10008F178@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100092AA4(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result;
    *(void *)(a2 + 8) = v5;
    *(void *)(a2 + 16) = v6;
  }

  return result;
}

uint64_t sub_10008F1A4(void *a1)
{
  return ArgumentInfoV0.NameInfoV0.encode(to:)(a1, *(_BYTE *)v1, *(void *)(v1 + 8), *(void *)(v1 + 16));
}

Swift::Int sub_10008F1C0()
{
  return ArgumentInfoV0.NameInfoV0.hashValue.getter(*(_BYTE *)v0, *(void *)(v0 + 8), *(void *)(v0 + 16));
}

uint64_t sub_10008F1CC(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 8);
  uint64_t v2 = *(void *)(v1 + 16);
  unint64_t v4 = 0xE500000000000000LL;
  unint64_t v5 = 0x74726F6873LL;
  if (*(_BYTE *)v1 != 1)
  {
    unint64_t v5 = 0xD000000000000012LL;
    unint64_t v4 = 0x800000010009E170LL;
  }

  if (*(_BYTE *)v1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 1735290732LL;
  }
  if (*(_BYTE *)v1) {
    unint64_t v7 = v4;
  }
  else {
    unint64_t v7 = 0xE400000000000000LL;
  }
  String.hash(into:)(a1, v6, v7);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(a1, v3, v2);
  return swift_bridgeObjectRelease(v2);
}

Swift::Int sub_10008F278(uint64_t a1)
{
  int v2 = *v1;
  uint64_t v4 = *((void *)v1 + 1);
  uint64_t v3 = *((void *)v1 + 2);
  Hasher.init(_seed:)(v10, a1);
  unint64_t v5 = 0xE500000000000000LL;
  unint64_t v6 = 0x74726F6873LL;
  if (v2 != 1)
  {
    unint64_t v6 = 0xD000000000000012LL;
    unint64_t v5 = 0x800000010009E170LL;
  }

  if (v2) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 1735290732LL;
  }
  if (v2) {
    unint64_t v8 = v5;
  }
  else {
    unint64_t v8 = 0xE400000000000000LL;
  }
  String.hash(into:)(v10, v7, v8);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v10, v4, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10008F338(uint64_t a1, uint64_t a2)
{
  return _s22ArgumentParserToolInfo0aD2V0V04NamedE0V23__derived_struct_equalsySbAE_AEtFZ_0( *(_BYTE *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(_BYTE *)a2,  *(void *)(a2 + 8),  *(void *)(a2 + 16));
}

ArgumentParserToolInfo::ArgumentInfoV0::KindV0_optional __swiftcall ArgumentInfoV0.KindV0.init(rawValue:)( Swift::String rawValue)
{
  v1._rawValue = &off_1000B43D8;
  return (ArgumentParserToolInfo::ArgumentInfoV0::KindV0_optional)sub_100092C10(rawValue, v1);
}

uint64_t ArgumentInfoV0.KindV0.rawValue.getter(char a1)
{
  if (!a1) {
    return 0x6E6F697469736F70LL;
  }
  if (a1 == 1) {
    return 0x6E6F6974706FLL;
  }
  return 1734437990LL;
}

uint64_t sub_10008F3BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_10008EA04(*a1, *a2);
}

unint64_t sub_10008F3C8@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  v3._rawValue = &off_1000B43D8;
  unint64_t result = sub_100092C10(*a1, v3);
  *a2 = result;
  return result;
}

void sub_10008F3FC(uint64_t *a1@<X8>)
{
  int v2 = *v1;
  unint64_t v3 = 0xEA00000000006C61LL;
  unint64_t v4 = 0xE600000000000000LL;
  uint64_t v5 = 0x6E6F6974706FLL;
  if (v2 != 1)
  {
    uint64_t v5 = 1734437990LL;
    unint64_t v4 = 0xE400000000000000LL;
  }

  BOOL v6 = v2 == 0;
  if (*v1) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0x6E6F697469736F70LL;
  }
  if (!v6) {
    unint64_t v3 = v4;
  }
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_10008F454(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000951A8();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10008F4B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000951A8();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

Swift::Int sub_10008F4FC()
{
  int v1 = *v0;
  Hasher.init(_seed:)(v7, 0LL);
  unint64_t v2 = 0xE600000000000000LL;
  uint64_t v3 = 0x6E6F6974706FLL;
  if (v1 != 1)
  {
    uint64_t v3 = 1734437990LL;
    unint64_t v2 = 0xE400000000000000LL;
  }

  if (v1) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0x6E6F697469736F70LL;
  }
  if (v1) {
    unint64_t v5 = v2;
  }
  else {
    unint64_t v5 = 0xEA00000000006C61LL;
  }
  String.hash(into:)(v7, v4, v5);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

uint64_t sub_10008F594(uint64_t a1)
{
  unint64_t v2 = 0xE600000000000000LL;
  uint64_t v3 = 0x6E6F6974706FLL;
  if (*v1 != 1)
  {
    uint64_t v3 = 1734437990LL;
    unint64_t v2 = 0xE400000000000000LL;
  }

  if (*v1) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 0x6E6F697469736F70LL;
  }
  if (*v1) {
    unint64_t v5 = v2;
  }
  else {
    unint64_t v5 = 0xEA00000000006C61LL;
  }
  String.hash(into:)(a1, v4, v5);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10008F608(uint64_t a1)
{
  int v2 = *v1;
  Hasher.init(_seed:)(v8, a1);
  unint64_t v3 = 0xE600000000000000LL;
  uint64_t v4 = 0x6E6F6974706FLL;
  if (v2 != 1)
  {
    uint64_t v4 = 1734437990LL;
    unint64_t v3 = 0xE400000000000000LL;
  }

  if (v2) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0x6E6F697469736F70LL;
  }
  if (v2) {
    unint64_t v6 = v3;
  }
  else {
    unint64_t v6 = 0xEA00000000006C61LL;
  }
  String.hash(into:)(v8, v5, v6);
  swift_bridgeObjectRelease(v6);
  return Hasher._finalize()();
}

uint64_t ArgumentInfoV0.kind.getter()
{
  return *v0;
}

uint64_t ArgumentInfoV0.shouldDisplay.getter()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t ArgumentInfoV0.shouldDisplay.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 1) = result;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.shouldDisplay.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t ArgumentInfoV0.isOptional.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t ArgumentInfoV0.isOptional.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 24) = result;
  return result;
}

uint64_t ArgumentInfoV0.isRepeating.getter()
{
  return *(unsigned __int8 *)(v0 + 25);
}

uint64_t ArgumentInfoV0.isRepeating.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 25) = result;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.isRepeating.modify())(Swift::String argument)
{
  return String.init(argument:);
}

uint64_t ArgumentInfoV0.names.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 32));
}

uint64_t ArgumentInfoV0.names.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 32));
  *(void *)(v1 + 32) = a1;
  return result;
}

uint64_t variable initialization expression of ArgumentInfoV0.preferredName()
{
  return 0LL;
}

uint64_t ArgumentInfoV0.preferredName.getter()
{
  uint64_t v1 = *(void *)(v0 + 40);
  swift_bridgeObjectRetain(*(void *)(v0 + 56));
  return v1;
}

uint64_t ArgumentInfoV0.preferredName.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = swift_bridgeObjectRelease(v3[7]);
  v3[5] = a1;
  v3[6] = a2;
  v3[7] = a3;
  return result;
}

uint64_t ArgumentInfoV0.allValues.getter()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 96));
}

uint64_t ArgumentInfoV0.allValues.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + 96));
  *(void *)(v1 + 96) = a1;
  return result;
}

uint64_t ArgumentInfoV0.abstract.getter()
{
  uint64_t v1 = *(void *)(v0 + 104);
  swift_bridgeObjectRetain(*(void *)(v0 + 112));
  return v1;
}

uint64_t ArgumentInfoV0.abstract.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 112));
  *(void *)(v2 + 104) = a1;
  *(void *)(v2 + 112) = a2;
  return result;
}

uint64_t ArgumentInfoV0.discussion.getter()
{
  uint64_t v1 = *(void *)(v0 + 120);
  swift_bridgeObjectRetain(*(void *)(v0 + 128));
  return v1;
}

uint64_t ArgumentInfoV0.discussion.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v2 + 128));
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = a2;
  return result;
}

Swift::String_optional (__swiftcall *ArgumentInfoV0.discussion.modify())(Swift::String argument)
{
  return String.init(argument:);
}

__n128 ArgumentInfoV0.init(kind:shouldDisplay:sectionTitle:isOptional:isRepeating:names:preferredName:valueName:defaultValue:allValues:abstract:discussion:)@<Q0>( char a1@<W0>, char a2@<W1>, uint64_t a3@<X2>, unint64_t a4@<X3>, char a5@<W4>, char a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12, unint64_t a13, uint64_t a14, unint64_t a15, uint64_t a16, uint64_t a17, unint64_t a18, uint64_t a19, unint64_t a20)
{
  uint64_t v20 = a7;
  unint64_t v23 = a15;
  uint64_t v25 = a12;
  unint64_t v24 = a13;
  if (a7)
  {
    uint64_t v26 = *(void *)(a7 + 16);
    swift_bridgeObjectRetain(a4);
    if (!v26)
    {
      swift_bridgeObjectRelease(v20);
      uint64_t v20 = 0LL;
    }
  }

  else
  {
    swift_bridgeObjectRetain(a4);
  }

  uint64_t v27 = a16;
  uint64_t v28 = a14;
  if (!a13) {
    goto LABEL_9;
  }
  uint64_t v29 = HIBYTE(a13) & 0xF;
  if ((a13 & 0x2000000000000000LL) == 0) {
    uint64_t v29 = a12 & 0xFFFFFFFFFFFFLL;
  }
  if (!v29)
  {
    swift_bridgeObjectRetain(a11);
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRelease(a13);
    uint64_t v25 = 0LL;
    unint64_t v24 = 0LL;
  }

  else
  {
LABEL_9:
    swift_bridgeObjectRetain(a11);
    swift_bridgeObjectRetain(v20);
  }

  unint64_t v30 = a18;
  uint64_t v51 = v25;
  if (a15)
  {
    unint64_t v31 = a4;
    uint64_t v32 = HIBYTE(a15) & 0xF;
    if ((a15 & 0x2000000000000000LL) == 0) {
      uint64_t v32 = a14 & 0xFFFFFFFFFFFFLL;
    }
    if (!v32)
    {
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRelease(a15);
      uint64_t v28 = 0LL;
      unint64_t v23 = 0LL;
      goto LABEL_18;
    }
  }

  else
  {
    unint64_t v31 = a4;
  }

  swift_bridgeObjectRetain(v24);
LABEL_18:
  unint64_t v33 = a20;
  uint64_t v50 = v28;
  if (a16)
  {
    uint64_t v34 = *(void *)(a16 + 16);
    swift_bridgeObjectRetain(v23);
    if (!v34)
    {
      swift_bridgeObjectRelease(a16);
      uint64_t v27 = 0LL;
    }

    uint64_t v35 = a19;
    if (!a18) {
      goto LABEL_27;
    }
  }

  else
  {
    swift_bridgeObjectRetain(v23);
    uint64_t v35 = a19;
    if (!a18) {
      goto LABEL_27;
    }
  }

  uint64_t v36 = HIBYTE(a18) & 0xF;
  if ((a18 & 0x2000000000000000LL) == 0) {
    uint64_t v36 = a17 & 0xFFFFFFFFFFFFLL;
  }
  if (!v36)
  {
    swift_bridgeObjectRetain(v27);
    swift_bridgeObjectRelease(a18);
    uint64_t v43 = 0LL;
    unint64_t v30 = 0LL;
    uint64_t v37 = a10;
    if (!a20) {
      goto LABEL_33;
    }
    goto LABEL_30;
  }

void ArgumentInfoV0.hash(into:)(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v3 = 0xE600000000000000LL;
  uint64_t v4 = 0x6E6F6974706FLL;
  if (*v1 != 1)
  {
    uint64_t v4 = 1734437990LL;
    unint64_t v3 = 0xE400000000000000LL;
  }

  if (*v1) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0x6E6F697469736F70LL;
  }
  if (*v1) {
    unint64_t v6 = v3;
  }
  else {
    unint64_t v6 = 0xEA00000000006C61LL;
  }
  String.hash(into:)(a1, v5, v6);
  swift_bridgeObjectRelease(v6);
  Hasher._combine(_:)(v2[1] & 1);
  uint64_t v8 = *((void *)v2 + 2);
  if (v8)
  {
    uint64_t v9 = *((void *)v2 + 1);
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v8);
    String.hash(into:)(a1, v9, v8);
    swift_bridgeObjectRelease(v8);
  }

  else
  {
    Hasher._combine(_:)(0);
  }

  Hasher._combine(_:)(v2[24] & 1);
  Hasher._combine(_:)(v2[25] & 1);
  uint64_t v10 = *((void *)v2 + 4);
  if (v10)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v10);
    sub_10009112C(a1, v10);
    swift_bridgeObjectRelease(v10);
    uint64_t v11 = *((void *)v2 + 7);
    if (v11) {
      goto LABEL_14;
    }
LABEL_33:
    Hasher._combine(_:)(0);
    uint64_t v18 = *((void *)v2 + 9);
    if (v18) {
      goto LABEL_23;
    }
    goto LABEL_34;
  }

  Hasher._combine(_:)(0);
  uint64_t v11 = *((void *)v2 + 7);
  if (!v11) {
    goto LABEL_33;
  }
LABEL_14:
  uint64_t v12 = *((void *)v2 + 6);
  int v13 = v2[40];
  Hasher._combine(_:)(1u);
  unint64_t v14 = 0xE500000000000000LL;
  unint64_t v15 = 0x74726F6873LL;
  if (v13 != 1)
  {
    unint64_t v15 = 0xD000000000000012LL;
    unint64_t v14 = 0x800000010009E170LL;
  }

  if (v13) {
    uint64_t v16 = v15;
  }
  else {
    uint64_t v16 = 1735290732LL;
  }
  if (v13) {
    unint64_t v17 = v14;
  }
  else {
    unint64_t v17 = 0xE400000000000000LL;
  }
  swift_bridgeObjectRetain_n(v11, 2LL);
  String.hash(into:)(a1, v16, v17);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRetain(v11);
  String.hash(into:)(a1, v12, v11);
  swift_bridgeObjectRelease_n(v11, 3LL);
  uint64_t v18 = *((void *)v2 + 9);
  if (v18)
  {
LABEL_23:
    uint64_t v19 = *((void *)v2 + 8);
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v18);
    String.hash(into:)(a1, v19, v18);
    swift_bridgeObjectRelease(v18);
    uint64_t v20 = *((void *)v2 + 11);
    if (v20) {
      goto LABEL_24;
    }
    goto LABEL_35;
  }

uint64_t sub_10008FEF8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_10008FF24 + 4 * byte_10009AF67[a1]))( 1684957547LL,  0xE400000000000000LL);
}

uint64_t sub_10008FF24()
{
  return 0x6944646C756F6873LL;
}

uint64_t sub_10008FF48()
{
  return 0x546E6F6974636573LL;
}

uint64_t sub_10008FF68()
{
  return 0x6E6F6974704F7369LL;
}

uint64_t sub_10008FF84()
{
  return 0x7461657065527369LL;
}

uint64_t sub_10008FFA4()
{
  return 0x73656D616ELL;
}

uint64_t sub_10008FFB8()
{
  return 0x6572726566657270LL;
}

uint64_t sub_10008FFDC()
{
  return 0x6D614E65756C6176LL;
}

uint64_t sub_10008FFF8()
{
  return 0x56746C7561666564LL;
}

uint64_t sub_100090018()
{
  return 0x65756C61566C6C61LL;
}

uint64_t sub_100090038()
{
  return 0x7463617274736261LL;
}

uint64_t sub_100090050()
{
  return 0x6973737563736964LL;
}

uint64_t sub_100090074()
{
  return sub_10008FEF8(*v0);
}

uint64_t sub_10009007C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_100092D20(a1, a2);
  *a3 = result;
  return result;
}

void sub_1000900A0(_BYTE *a1@<X8>)
{
  *a1 = 12;
}

uint64_t sub_1000900AC(uint64_t a1)
{
  unint64_t v2 = sub_100092C54();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000900D4(uint64_t a1)
{
  unint64_t v2 = sub_100092C54();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t ArgumentInfoV0.encode(to:)(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005104(&qword_1000BA018);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = &v33[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL) - 8];
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006270(a1, v9);
  unint64_t v11 = sub_100092C54();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ArgumentInfoV0.CodingKeys,  &type metadata for ArgumentInfoV0.CodingKeys,  v11,  v9,  v10);
  v33[0] = *(_BYTE *)v3;
  char v34 = 0;
  unint64_t v12 = sub_100092C98();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v33, &v34, v5, &type metadata for ArgumentInfoV0.KindV0, v12);
  if (!v2)
  {
    uint64_t v13 = *(unsigned __int8 *)(v3 + 1);
    v33[0] = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v13, v33, v5);
    uint64_t v14 = *(void *)(v3 + 8);
    uint64_t v15 = *(void *)(v3 + 16);
    v33[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v14, v15, v33, v5);
    uint64_t v16 = *(unsigned __int8 *)(v3 + 24);
    v33[0] = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v33, v5);
    uint64_t v17 = *(unsigned __int8 *)(v3 + 25);
    v33[0] = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v17, v33, v5);
    sub_10002AACC(v3 + 32, (uint64_t)v37, &qword_1000BA028);
    sub_10002AACC((uint64_t)v37, (uint64_t)v33, &qword_1000BA028);
    char v34 = 5;
    uint64_t v18 = sub_100005104(&qword_1000BA030);
    uint64_t v19 = sub_100080D6C( &qword_1000BA038,  &qword_1000BA030,  (void (*)(void))sub_100092CDC,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v33, &v34, v5, v18, v19);
    sub_10002AACC(v3 + 40, (uint64_t)v36, &qword_1000BA048);
    sub_10002AACC((uint64_t)v36, (uint64_t)v33, &qword_1000BA048);
    char v34 = 6;
    unint64_t v20 = sub_100092CDC();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)( v33,  &v34,  v5,  &type metadata for ArgumentInfoV0.NameInfoV0,  v20);
    uint64_t v21 = *(void *)(v3 + 64);
    uint64_t v22 = *(void *)(v3 + 72);
    v33[0] = 7;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v21, v22, v33, v5);
    uint64_t v23 = *(void *)(v3 + 80);
    uint64_t v24 = *(void *)(v3 + 88);
    v33[0] = 8;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v23, v24, v33, v5);
    sub_10002AACC(v3 + 96, (uint64_t)v35, &qword_1000B9FB8);
    sub_10002AACC((uint64_t)v35, (uint64_t)v33, &qword_1000B9FB8);
    char v34 = 9;
    uint64_t v25 = sub_100005104(&qword_1000B9FC0);
    uint64_t v26 = sub_1000952B8( &qword_1000B9FC8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v33, &v34, v5, v25, v26);
    uint64_t v27 = *(void *)(v3 + 104);
    uint64_t v28 = *(void *)(v3 + 112);
    v33[0] = 10;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v27, v28, v33, v5);
    uint64_t v29 = *(void *)(v3 + 120);
    uint64_t v30 = *(void *)(v3 + 128);
    v33[0] = 11;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v29, v30, v33, v5);
  }

  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int ArgumentInfoV0.hashValue.getter()
{
  return Hasher._finalize()();
}

__n128 ArgumentInfoV0.init(from:)@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v8[7];
    *(_OWORD *)(a2 + 96) = v8[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(void *)(a2 + 128) = v9;
    __int128 v6 = v8[3];
    *(_OWORD *)(a2 + 32) = v8[2];
    *(_OWORD *)(a2 + 48) = v6;
    __int128 v7 = v8[5];
    *(_OWORD *)(a2 + 64) = v8[4];
    *(_OWORD *)(a2 + 80) = v7;
    __n128 result = (__n128)v8[1];
    *(_OWORD *)a2 = v8[0];
    *(__n128 *)(a2 + 16) = result;
  }

  return result;
}

uint64_t sub_100090554(void *a1)
{
  return ArgumentInfoV0.encode(to:)(a1);
}

Swift::Int sub_1000905A8(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_1000905E0(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  uint64_t v12 = *(void *)(a1 + 128);
  __int128 v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  __int128 v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  __int128 v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  __int128 v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  uint64_t v14 = *(void *)(a2 + 128);
  __int128 v7 = *(_OWORD *)(a2 + 48);
  v13[2] = *(_OWORD *)(a2 + 32);
  uint64_t v13[3] = v7;
  __int128 v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  __int128 v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0((unsigned __int8 *)v11, (uint64_t)v13) & 1;
}

uint64_t sub_100090660(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0LL;
  }
  if (!v2 || a1 == a2) {
    return 1LL;
  }
  __int128 v3 = (uint64_t *)(a2 + 48);
  __int128 v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *(v4 - 1);
    uint64_t v6 = *v4;
    int v8 = *((unsigned __int8 *)v4 - 16);
    int v9 = *((unsigned __int8 *)v3 - 16);
    uint64_t v11 = *(v3 - 1);
    uint64_t v10 = *v3;
    v3 += 3;
    v4 += 3;
    if (v8 == 1) {
      unint64_t v12 = 0x74726F6873LL;
    }
    else {
      unint64_t v12 = 0xD000000000000012LL;
    }
    unint64_t v13 = 0x800000010009E170LL;
    if (v8 == 1) {
      unint64_t v13 = 0xE500000000000000LL;
    }
    if (v8) {
      uint64_t v14 = v12;
    }
    else {
      uint64_t v14 = 1735290732LL;
    }
    if (v8) {
      unint64_t v15 = v13;
    }
    else {
      unint64_t v15 = 0xE400000000000000LL;
    }
    unint64_t v16 = 0x800000010009E170LL;
    if (v9 == 1) {
      unint64_t v17 = 0x74726F6873LL;
    }
    else {
      unint64_t v17 = 0xD000000000000012LL;
    }
    if (v9 == 1) {
      unint64_t v16 = 0xE500000000000000LL;
    }
    if (v9) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 1735290732LL;
    }
    if (v9) {
      unint64_t v19 = v16;
    }
    else {
      unint64_t v19 = 0xE400000000000000LL;
    }
    if (v14 == v18 && v15 == v19)
    {
      swift_bridgeObjectRetain(v6);
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRelease_n(v15, 2LL);
      goto LABEL_33;
    }

    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, v18, v19, 0LL);
    swift_bridgeObjectRetain(v6);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v19);
    if ((v20 & 1) == 0) {
      break;
    }
LABEL_33:
    if (v7 == v11 && v6 == v10)
    {
      swift_bridgeObjectRelease_n(v6, 2LL);
    }

    else
    {
      char v5 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v6, v11, v10, 0LL);
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(v10);
      if ((v5 & 1) == 0) {
        return 0LL;
      }
    }

    if (!--v2) {
      return 1LL;
    }
  }

  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v10);
  return 0LL;
}

uint64_t sub_100090860(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0LL;
  }
  if (!v2 || a1 == a2) {
    return 1LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = a1 + 32;
  uint64_t v5 = a2 + 32;
  uint64_t v64 = a1 + 32;
  uint64_t v65 = *(void *)(a1 + 16);
  uint64_t v63 = a2 + 32;
  while (1)
  {
    uint64_t v68 = v3;
    uint64_t v6 = 88 * v3;
    uint64_t v7 = *(void **)(v4 + 88 * v3);
    uint64_t v8 = *(void *)(v4 + 88 * v3 + 8);
    uint64_t v9 = *(void *)(v4 + 88 * v3 + 24);
    uint64_t v81 = *(void *)(v4 + 88 * v3 + 16);
    uint64_t v10 = *(void *)(v4 + 88 * v3 + 40);
    uint64_t v76 = *(void *)(v4 + v6 + 32);
    uint64_t v12 = *(void *)(v4 + v6 + 48);
    uint64_t v11 = *(void *)(v4 + v6 + 56);
    uint64_t v13 = *(void *)(v4 + v6 + 64);
    uint64_t v14 = *(void **)(v4 + v6 + 72);
    uint64_t v73 = *(void **)(v4 + v6 + 80);
    unint64_t v15 = (void *)(v5 + v6);
    unint64_t v16 = (void *)*v15;
    uint64_t v17 = v15[3];
    uint64_t v82 = v15[2];
    uint64_t v78 = v15[4];
    unint64_t v79 = (void *)*v15;
    uint64_t v66 = v11;
    uint64_t v67 = v15[5];
    uint64_t v77 = v15[6];
    uint64_t v69 = v15[7];
    uint64_t v71 = v15[8];
    Swift::Int v72 = (void *)v15[9];
    __int128 v70 = (void *)v15[10];
    uint64_t v80 = v7;
    uint64_t v74 = v15[1];
    if (!v7)
    {
      if (v16) {
        return 0LL;
      }
      goto LABEL_28;
    }

    if (!v16) {
      return 0LL;
    }
    uint64_t v18 = v7[2];
    if (v18 != v16[2]) {
      return 0LL;
    }
    if (v18 && v7 != v16)
    {
      uint64_t result = v7[4];
      uint64_t v21 = v7[5];
      uint64_t v22 = v79[4];
      uint64_t v23 = v79[5];
      if (result != v22 || v21 != v23)
      {
        uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(result, v21, v22, v23, 0LL);
        if ((result & 1) == 0) {
          return 0LL;
        }
      }

      uint64_t v25 = v18 - 1;
      if (v18 != 1) {
        break;
      }
    }

uint64_t sub_100091028(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v14 = 1;
    }

    else
    {
      uint64_t v3 = a1 + 32;
      uint64_t v4 = a2 + 32;
      uint64_t v5 = v2 - 1;
      do
      {
        __int128 v6 = *(_OWORD *)(v3 + 112);
        v18[6] = *(_OWORD *)(v3 + 96);
        v18[7] = v6;
        uint64_t v19 = *(void *)(v3 + 128);
        __int128 v7 = *(_OWORD *)(v3 + 48);
        v18[2] = *(_OWORD *)(v3 + 32);
        _OWORD v18[3] = v7;
        __int128 v8 = *(_OWORD *)(v3 + 80);
        void v18[4] = *(_OWORD *)(v3 + 64);
        v18[5] = v8;
        __int128 v9 = *(_OWORD *)(v3 + 16);
        v18[0] = *(_OWORD *)v3;
        v18[1] = v9;
        __int128 v10 = *(_OWORD *)(v4 + 112);
        v20[6] = *(_OWORD *)(v4 + 96);
        v20[7] = v10;
        uint64_t v21 = *(void *)(v4 + 128);
        __int128 v11 = *(_OWORD *)(v4 + 48);
        v20[2] = *(_OWORD *)(v4 + 32);
        unint64_t v20[3] = v11;
        __int128 v12 = *(_OWORD *)(v4 + 80);
        v20[4] = *(_OWORD *)(v4 + 64);
        _OWORD v20[5] = v12;
        __int128 v13 = *(_OWORD *)(v4 + 16);
        v20[0] = *(_OWORD *)v4;
        v20[1] = v13;
        sub_100091D50(v18);
        sub_100091D50(v20);
        char v14 = _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0( (unsigned __int8 *)v18,  (uint64_t)v20);
        sub_100091DE0(v20);
        sub_100091DE0(v18);
        BOOL v16 = v5-- != 0;
        if ((v14 & 1) == 0) {
          break;
        }
        v3 += 136LL;
        v4 += 136LL;
      }

      while (v16);
    }
  }

  else
  {
    char v14 = 0;
  }

  return v14 & 1;
}

void sub_10009112C(uint64_t a1, uint64_t a2)
{
  Swift::UInt v4 = *(void *)(a2 + 16);
  Hasher._combine(_:)(v4);
  if (v4)
  {
    uint64_t v5 = (uint64_t *)(a2 + 48);
    do
    {
      int v6 = *((unsigned __int8 *)v5 - 16);
      uint64_t v8 = *(v5 - 1);
      uint64_t v7 = *v5;
      v5 += 3;
      if (v6 == 1) {
        unint64_t v9 = 0x74726F6873LL;
      }
      else {
        unint64_t v9 = 0xD000000000000012LL;
      }
      unint64_t v10 = 0xE500000000000000LL;
      if (v6 != 1) {
        unint64_t v10 = 0x800000010009E170LL;
      }
      if (v6) {
        uint64_t v11 = v9;
      }
      else {
        uint64_t v11 = 1735290732LL;
      }
      if (v6) {
        unint64_t v12 = v10;
      }
      else {
        unint64_t v12 = 0xE400000000000000LL;
      }
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(a1, v11, v12);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(a1, v8, v7);
      swift_bridgeObjectRelease_n(v7, 2LL);
      --v4;
    }

    while (v4);
  }

uint64_t sub_100091224(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000014LL && a2 == 0x800000010009E1A0LL)
  {
    swift_bridgeObjectRelease(0x800000010009E1A0LL);
    char v3 = 0;
  }

  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x800000010009E1A0LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    char v3 = v4 ^ 1;
  }

  return v3 & 1;
}

uint64_t _s22ArgumentParserToolInfo0aD2V0V23__derived_struct_equalsySbAC_ACtFZ_0( unsigned __int8 *a1, uint64_t a2)
{
  int v3 = *a1;
  unint64_t v4 = 0xE600000000000000LL;
  uint64_t v5 = 0x6E6F6974706FLL;
  if (v3 != 1)
  {
    uint64_t v5 = 1734437990LL;
    unint64_t v4 = 0xE400000000000000LL;
  }

  if (*a1) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0x6E6F697469736F70LL;
  }
  if (v3) {
    unint64_t v7 = v4;
  }
  else {
    unint64_t v7 = 0xEA00000000006C61LL;
  }
  unint64_t v9 = 0xE600000000000000LL;
  uint64_t v10 = 0x6E6F6974706FLL;
  if (*(_BYTE *)a2 != 1)
  {
    uint64_t v10 = 1734437990LL;
    unint64_t v9 = 0xE400000000000000LL;
  }

  if (*(_BYTE *)a2) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0x6E6F697469736F70LL;
  }
  if (*(_BYTE *)a2) {
    unint64_t v12 = v9;
  }
  else {
    unint64_t v12 = 0xEA00000000006C61LL;
  }
  if (v6 == v11 && v7 == v12)
  {
    swift_bridgeObjectRelease_n(v7, 2LL);
  }

  else
  {
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, v11, v12, 0LL);
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v12);
    uint64_t result = 0LL;
    if ((v13 & 1) == 0) {
      return result;
    }
  }

  uint64_t v15 = *((void *)a1 + 2);
  uint64_t v16 = *(void *)(a2 + 16);
  if (v15)
  {
    if (!v16) {
      return 0LL;
    }
    uint64_t v17 = *((void *)a1 + 1);
    uint64_t v18 = *(void *)(a2 + 8);
    if (v17 != v18 || v15 != v16)
    {
      char v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v17, v15, v18, v16, 0LL);
      uint64_t result = 0LL;
      if ((v19 & 1) == 0) {
        return result;
      }
    }
  }

  else if (v16)
  {
    return 0LL;
  }

  uint64_t v20 = *((void *)a1 + 4);
  uint64_t v21 = *(void *)(a2 + 32);
  if (v20)
  {
    if (!v21) {
      return 0LL;
    }
    swift_bridgeObjectRetain(*(void *)(a2 + 32));
    uint64_t v22 = swift_bridgeObjectRetain(v20);
    char v23 = sub_100090660(v22, v21);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v21);
    if ((v23 & 1) == 0) {
      return 0LL;
    }
  }

  else if (v21)
  {
    return 0LL;
  }

  uint64_t v24 = *((void *)a1 + 7);
  uint64_t v25 = *(void *)(a2 + 56);
  if (v24)
  {
    if (!v25) {
      return 0LL;
    }
    unint64_t v26 = 1735290732LL;
    int v27 = *((void *)a1 + 5);
    if (*((void *)a1 + 5))
    {
      if (v27 == 1) {
        unint64_t v28 = 0x74726F6873LL;
      }
      else {
        unint64_t v28 = 0xD000000000000012LL;
      }
      if (v27 == 1) {
        unint64_t v29 = 0xE500000000000000LL;
      }
      else {
        unint64_t v29 = 0x800000010009E170LL;
      }
    }

    else
    {
      unint64_t v29 = 0xE400000000000000LL;
      unint64_t v28 = 1735290732LL;
    }

    int v30 = *(void *)(a2 + 40);
    if (*(void *)(a2 + 40))
    {
      if (v30 == 1) {
        unint64_t v26 = 0x74726F6873LL;
      }
      else {
        unint64_t v26 = 0xD000000000000012LL;
      }
      if (v30 == 1) {
        unint64_t v31 = 0xE500000000000000LL;
      }
      else {
        unint64_t v31 = 0x800000010009E170LL;
      }
    }

    else
    {
      unint64_t v31 = 0xE400000000000000LL;
    }

    uint64_t v32 = *((void *)a1 + 6);
    uint64_t v33 = *(void *)(a2 + 48);
    if (v28 == v26 && v29 == v31)
    {
      swift_bridgeObjectRetain(*(void *)(a2 + 56));
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRelease_n(v29, 2LL);
    }

    else
    {
      char v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, v26, v31, 0LL);
      swift_bridgeObjectRetain(v25);
      swift_bridgeObjectRetain(v24);
      swift_bridgeObjectRelease(v29);
      swift_bridgeObjectRelease(v31);
      if ((v34 & 1) == 0)
      {
        swift_bridgeObjectRelease(v24);
        swift_bridgeObjectRelease(v25);
        return 0LL;
      }
    }

    if (v32 == v33 && v24 == v25)
    {
      swift_bridgeObjectRelease(v24);
      swift_bridgeObjectRelease(v25);
    }

    else
    {
      char v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v24, v33, v25, 0LL);
      swift_bridgeObjectRelease(v24);
      swift_bridgeObjectRelease(v25);
      uint64_t result = 0LL;
      if ((v35 & 1) == 0) {
        return result;
      }
    }
  }

  else if (v25)
  {
    return 0LL;
  }

  uint64_t v36 = *((void *)a1 + 9);
  uint64_t v37 = *(void *)(a2 + 72);
  if (v36)
  {
    if (!v37) {
      return 0LL;
    }
    uint64_t v38 = *((void *)a1 + 8);
    uint64_t v39 = *(void *)(a2 + 64);
    if (v38 != v39 || v36 != v37)
    {
      char v40 = _stringCompareWithSmolCheck(_:_:expecting:)(v38, v36, v39, v37, 0LL);
      uint64_t result = 0LL;
      if ((v40 & 1) == 0) {
        return result;
      }
    }
  }

  else if (v37)
  {
    return 0LL;
  }

  uint64_t v41 = *((void *)a1 + 11);
  uint64_t v42 = *(void *)(a2 + 88);
  if (v41)
  {
    if (!v42) {
      return 0LL;
    }
    uint64_t v43 = *((void *)a1 + 10);
    uint64_t v44 = *(void *)(a2 + 80);
    if (v43 != v44 || v41 != v42)
    {
      char v45 = _stringCompareWithSmolCheck(_:_:expecting:)(v43, v41, v44, v42, 0LL);
      uint64_t result = 0LL;
      if ((v45 & 1) == 0) {
        return result;
      }
    }
  }

  else if (v42)
  {
    return 0LL;
  }

  __int128 v46 = (void *)*((void *)a1 + 12);
  __int128 v47 = *(void **)(a2 + 96);
  if (v46)
  {
    if (!v47 || (sub_100057670(v46, v47) & 1) == 0) {
      return 0LL;
    }
  }

  else if (v47)
  {
    return 0LL;
  }

  uint64_t v48 = *((void *)a1 + 14);
  uint64_t v49 = *(void *)(a2 + 112);
  if (!v48)
  {
    if (v49) {
      return 0LL;
    }
LABEL_93:
    uint64_t v53 = *((void *)a1 + 16);
    uint64_t v54 = *(void *)(a2 + 128);
    if (v53)
    {
      if (v54)
      {
        uint64_t v55 = *((void *)a1 + 15);
        uint64_t v56 = *(void *)(a2 + 120);
        if (v55 == v56 && v53 == v54) {
          return 1LL;
        }
        if ((_stringCompareWithSmolCheck(_:_:expecting:)(v55, v53, v56, v54, 0LL) & 1) != 0) {
          return 1LL;
        }
      }
    }

    else if (!v54)
    {
      return 1LL;
    }

    return 0LL;
  }

  if (!v49) {
    return 0LL;
  }
  uint64_t v50 = *((void *)a1 + 13);
  uint64_t v51 = *(void *)(a2 + 104);
  if (v50 == v51 && v48 == v49) {
    goto LABEL_93;
  }
  char v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v50, v48, v51, v49, 0LL);
  uint64_t result = 0LL;
  if ((v52 & 1) != 0) {
    goto LABEL_93;
  }
  return result;
}

uint64_t _s22ArgumentParserToolInfo07CommandD2V0V23__derived_struct_equalsySbAC_ACtFZ_0( uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  if (v4)
  {
    if (!v5 || (sub_100057670(v4, v5) & 1) == 0) {
      return 0LL;
    }
  }

  else if (v5)
  {
    return 0LL;
  }

  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  uint64_t v8 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  BOOL v10 = v6 == v8 && v7 == v9;
  if (v10 || (char v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v6, v7, v8, v9, 0LL), result = 0LL, (v11 & 1) != 0))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(a2 + 32);
    if (v13)
    {
      if (!v14) {
        return 0LL;
      }
      uint64_t v15 = *(void *)(a1 + 24);
      uint64_t v16 = *(void *)(a2 + 24);
      if (v15 != v16 || v13 != v14)
      {
        char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v13, v16, v14, 0LL);
        uint64_t result = 0LL;
        if ((v17 & 1) == 0) {
          return result;
        }
      }
    }

    else if (v14)
    {
      return 0LL;
    }

    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = *(void *)(a2 + 48);
    if (v18)
    {
      if (!v19) {
        return 0LL;
      }
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v21 = *(void *)(a2 + 40);
      if (v20 != v21 || v18 != v19)
      {
        char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v18, v21, v19, 0LL);
        uint64_t result = 0LL;
        if ((v22 & 1) == 0) {
          return result;
        }
      }
    }

    else if (v19)
    {
      return 0LL;
    }

    uint64_t v23 = *(void *)(a1 + 64);
    uint64_t v24 = *(void *)(a2 + 64);
    if (v23)
    {
      if (!v24) {
        return 0LL;
      }
      uint64_t v25 = *(void *)(a1 + 56);
      uint64_t v26 = *(void *)(a2 + 56);
      if (v25 != v26 || v23 != v24)
      {
        char v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v23, v26, v24, 0LL);
        uint64_t result = 0LL;
        if ((v27 & 1) == 0) {
          return result;
        }
      }
    }

    else if (v24)
    {
      return 0LL;
    }

    uint64_t v28 = *(void *)(a1 + 72);
    uint64_t v29 = *(void *)(a2 + 72);
    if (v28)
    {
      if (!v29) {
        return 0LL;
      }
      swift_bridgeObjectRetain(*(void *)(a2 + 72));
      uint64_t v30 = swift_bridgeObjectRetain(v28);
      char v31 = sub_100090860(v30, v29);
      swift_bridgeObjectRelease(v28);
      swift_bridgeObjectRelease(v29);
      if ((v31 & 1) == 0) {
        return 0LL;
      }
    }

    else if (v29)
    {
      return 0LL;
    }

    uint64_t v32 = *(void *)(a1 + 80);
    uint64_t v33 = *(void *)(a2 + 80);
    if (v32)
    {
      if (v33)
      {
        swift_bridgeObjectRetain(v33);
        uint64_t v34 = swift_bridgeObjectRetain(v32);
        char v35 = sub_100091028(v34, v33);
        swift_bridgeObjectRelease(v32);
        swift_bridgeObjectRelease(v33);
        if ((v35 & 1) != 0) {
          return 1LL;
        }
      }
    }

    else if (!v33)
    {
      return 1LL;
    }

    return 0LL;
  }

  return result;
}

unint64_t sub_100091910()
{
  unint64_t result = qword_1000C2678;
  if (!qword_1000C2678)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B994, &type metadata for ToolInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C2678);
  }

  return result;
}

unint64_t sub_100091954()
{
  unint64_t result = qword_1000B9FA8;
  if (!qword_1000B9FA8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CommandInfoV0, &type metadata for CommandInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000B9FA8);
  }

  return result;
}

uint64_t sub_100091998(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v4 = 0x800000010009E1A0LL;
    if (a2 == 0x800000010009E1A0LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x800000010009E1A0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  if (a1 == 0x646E616D6D6F63LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(0xE700000000000000LL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x646E616D6D6F63LL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_100091A84@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_100005104((uint64_t *)&unk_1000BA0F0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006270(a1, v9);
  unint64_t v11 = sub_100091910();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ToolInfoV0.CodingKeys,  &type metadata for ToolInfoV0.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_1000062D8(a1);
  }
  LOBYTE(v37[0]) = 0;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)(v37, v5);
  char v45 = 1;
  unint64_t v13 = sub_10009535C();
  KeyedDecodingContainer.decode<A>(_:forKey:)( v37,  &type metadata for CommandInfoV0,  &v45,  v5,  &type metadata for CommandInfoV0,  v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v14 = v37[0];
  uint64_t v15 = v37[2];
  uint64_t v35 = v37[3];
  uint64_t v36 = v37[1];
  uint64_t v16 = v38;
  uint64_t v34 = v39;
  uint64_t v17 = v40;
  uint64_t v32 = v37[0];
  uint64_t v33 = v41;
  uint64_t v18 = v43;
  uint64_t v29 = v42;
  uint64_t v30 = v38;
  uint64_t v19 = v44;
  uint64_t v31 = v44;
  swift_bridgeObjectRetain(v44);
  swift_bridgeObjectRetain(v14);
  uint64_t v20 = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  uint64_t v21 = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRetain(v18);
  sub_1000062D8(a1);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v18);
  uint64_t v22 = v21;
  swift_bridgeObjectRelease(v21);
  uint64_t v23 = v17;
  swift_bridgeObjectRelease(v17);
  uint64_t v24 = v30;
  swift_bridgeObjectRelease(v30);
  swift_bridgeObjectRelease(v20);
  uint64_t v25 = v32;
  uint64_t result = swift_bridgeObjectRelease(v32);
  *a2 = v12;
  a2[1] = v25;
  a2[2] = v36;
  a2[3] = v20;
  a2[4] = v35;
  a2[5] = v24;
  a2[6] = v34;
  a2[7] = v23;
  a2[8] = v33;
  a2[9] = v22;
  uint64_t v27 = v31;
  a2[10] = v18;
  a2[11] = v27;
  return result;
}

uint64_t *sub_100091CCC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[2];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[8];
  uint64_t v7 = a1[9];
  swift_bridgeObjectRetain(a1[10]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

void *sub_100091D50(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[7];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[11];
  uint64_t v7 = a1[12];
  uint64_t v8 = a1[14];
  swift_bridgeObjectRetain(a1[16]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  return a1;
}

void *sub_100091DE0(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[7];
  uint64_t v4 = a1[9];
  uint64_t v5 = a1[11];
  uint64_t v6 = a1[12];
  uint64_t v7 = a1[14];
  uint64_t v8 = a1[16];
  swift_bridgeObjectRelease(a1[2]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  return a1;
}

unint64_t sub_100091E70()
{
  unint64_t result = qword_1000C2680;
  if (!qword_1000C2680)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B944, &type metadata for CommandInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C2680);
  }

  return result;
}

unint64_t sub_100091EB4()
{
  unint64_t result = qword_1000BA000;
  if (!qword_1000BA000)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0,  &type metadata for ArgumentInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA000);
  }

  return result;
}

uint64_t sub_100091EF8(uint64_t a1, unint64_t a2)
{
  if (a1 == 0x6D6F437265707573LL && a2 == 0xED000073646E616DLL)
  {
    unint64_t v5 = 0xED000073646E616DLL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6D6F437265707573LL, 0xED000073646E616DLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x4E646E616D6D6F63LL && a2 == 0xEB00000000656D61LL)
  {
    unint64_t v7 = 0xEB00000000656D61LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x4E646E616D6D6F63LL, 0xEB00000000656D61LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x7463617274736261LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v8 = 0xE800000000000000LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7463617274736261LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x6973737563736964LL && a2 == 0xEA00000000006E6FLL)
  {
    unint64_t v9 = 0xEA00000000006E6FLL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6973737563736964LL, 0xEA00000000006E6FLL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0xD000000000000011LL)
  {
    unint64_t v10 = 0x800000010009E1C0LL;
    if (a2 == 0x800000010009E1C0LL) {
      goto LABEL_31;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011LL, 0x800000010009E1C0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
LABEL_31:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if (a1 == 0x616D6D6F63627573LL && a2 == 0xEB0000000073646ELL)
  {
    unint64_t v11 = 0xEB0000000073646ELL;
LABEL_37:
    swift_bridgeObjectRelease(v11);
    return 5LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x616D6D6F63627573LL, 0xEB0000000073646ELL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
    goto LABEL_37;
  }

  if (a1 == 0x746E656D75677261LL && a2 == 0xE900000000000073LL)
  {
    swift_bridgeObjectRelease(0xE900000000000073LL);
    return 6LL;
  }

  else
  {
    char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(0x746E656D75677261LL, 0xE900000000000073LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v12 & 1) != 0) {
      return 6LL;
    }
    else {
      return 7LL;
    }
  }

uint64_t sub_100092240@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_100005104(&qword_1000BA0C8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_100006270(a1, v9);
  unint64_t v11 = sub_100091E70();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for CommandInfoV0.CodingKeys,  &type metadata for CommandInfoV0.CodingKeys,  v11,  v9,  v10);
  if (v2)
  {
    sub_1000062D8(a1);
    swift_bridgeObjectRelease(0LL);
    swift_bridgeObjectRelease(0LL);
    swift_bridgeObjectRelease(0LL);
    swift_bridgeObjectRelease(0LL);
    swift_bridgeObjectRelease(0LL);
    return swift_bridgeObjectRelease(0LL);
  }

  else
  {
    uint64_t v12 = sub_100005104(&qword_1000B9FC0);
    char v51 = 0;
    uint64_t v13 = sub_1000952B8( &qword_1000BA0B0,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v52, v12, &v51, v5, v12, v13);
    uint64_t v14 = v52;
    LOBYTE(v52) = 1;
    swift_bridgeObjectRetain(v14);
    uint64_t v48 = KeyedDecodingContainer.decode(_:forKey:)(&v52, v5);
    uint64_t v49 = v14;
    LOBYTE(v52) = 2;
    uint64_t v16 = v15;
    swift_bridgeObjectRetain(v15);
    uint64_t v17 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v52, v5);
    uint64_t v50 = v16;
    uint64_t v19 = v18;
    uint64_t v47 = v17;
    LOBYTE(v52) = 3;
    swift_bridgeObjectRetain(v18);
    uint64_t v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v52, v5);
    char v45 = a2;
    uint64_t v46 = v19;
    LOBYTE(v52) = 4;
    uint64_t v22 = v21;
    swift_bridgeObjectRetain(v21);
    uint64_t v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v52, v5);
    uint64_t v25 = v24;
    uint64_t v42 = v23;
    uint64_t v43 = v20;
    uint64_t v44 = v22;
    uint64_t v26 = sub_100005104(&qword_1000B9FD8);
    char v51 = 5;
    uint64_t v27 = sub_100080D6C( &qword_1000BA0D0,  &qword_1000B9FD8,  (void (*)(void))sub_10009535C,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v25);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v52, v26, &v51, v5, v26, v27);
    uint64_t v28 = v52;
    uint64_t v29 = sub_100005104(&qword_1000B9FF0);
    char v51 = 6;
    uint64_t v30 = sub_100080D6C( &qword_1000BA0E0,  &qword_1000B9FF0,  (void (*)(void))sub_1000953A0,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    swift_bridgeObjectRetain(v28);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v52, v29, &v51, v5, v29, v30);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v31 = v52;
    swift_bridgeObjectRetain(v52);
    swift_bridgeObjectRelease(0LL);
    sub_1000062D8(a1);
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease(v28);
    swift_bridgeObjectRelease(v25);
    uint64_t v32 = v44;
    swift_bridgeObjectRelease(v44);
    uint64_t v33 = v46;
    swift_bridgeObjectRelease(v46);
    uint64_t v34 = v50;
    swift_bridgeObjectRelease(v50);
    uint64_t v35 = v49;
    uint64_t result = swift_bridgeObjectRelease(v49);
    uint64_t v37 = v45;
    uint64_t v38 = v48;
    *char v45 = v35;
    v37[1] = v38;
    uint64_t v39 = v47;
    v37[2] = v34;
    v37[3] = v39;
    uint64_t v40 = v43;
    void v37[4] = v33;
    v37[5] = v40;
    uint64_t v41 = v42;
    v37[6] = v32;
    v37[7] = v41;
    _BYTE v37[8] = v25;
    void v37[9] = v28;
    v37[10] = v31;
  }

  return result;
}

uint64_t _s22ArgumentParserToolInfo0aD2V0V04NamedE0V23__derived_struct_equalsySbAE_AEtFZ_0( unsigned __int8 a1, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t a5, uint64_t a6)
{
  unint64_t v10 = 1735290732LL;
  int v11 = a1;
  if (!a1)
  {
    unint64_t v13 = 0xE400000000000000LL;
    unint64_t v12 = 1735290732LL;
    int v14 = a4;
    if (a4) {
      goto LABEL_9;
    }
LABEL_18:
    unint64_t v15 = 0xE400000000000000LL;
    if (v12 != 1735290732) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

  if (a1 == 1) {
    unint64_t v12 = 0x74726F6873LL;
  }
  else {
    unint64_t v12 = 0xD000000000000012LL;
  }
  if (v11 == 1) {
    unint64_t v13 = 0xE500000000000000LL;
  }
  else {
    unint64_t v13 = 0x800000010009E170LL;
  }
  int v14 = a4;
  if (!a4) {
    goto LABEL_18;
  }
LABEL_9:
  if (v14 == 1) {
    unint64_t v10 = 0x74726F6873LL;
  }
  else {
    unint64_t v10 = 0xD000000000000012LL;
  }
  if (v14 == 1) {
    unint64_t v15 = 0xE500000000000000LL;
  }
  else {
    unint64_t v15 = 0x800000010009E170LL;
  }
  if (v12 != v10)
  {
LABEL_21:
    char v16 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v13, v10, v15, 0LL);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v15);
    uint64_t result = 0LL;
    if ((v16 & 1) == 0) {
      return result;
    }
    goto LABEL_22;
  }

unint64_t sub_10009294C()
{
  unint64_t result = qword_1000C2688;
  if (!qword_1000C2688)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B8F4, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C2688);
  }

  return result;
}

unint64_t sub_100092990()
{
  unint64_t result = qword_1000BA010;
  if (!qword_1000BA010)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.NameInfoV0.KindV0,  &type metadata for ArgumentInfoV0.NameInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA010);
  }

  return result;
}

uint64_t sub_1000929D4(uint64_t a1, unint64_t a2)
{
  if (a1 == 1684957547 && a2 == 0xE400000000000000LL)
  {
    unint64_t v5 = 0xE400000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684957547LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 1701667182 && a2 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease(0xE400000000000000LL);
    return 1LL;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(1701667182LL, 0xE400000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v7 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_100092AA4(void *a1)
{
  uint64_t v3 = sub_100005104(&qword_1000BA0B8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_100006270(a1, v7);
  unint64_t v9 = sub_10009294C();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys,  &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys,  v9,  v7,  v8);
  if (!v1)
  {
    char v14 = 0;
    unint64_t v10 = sub_100095318();
    KeyedDecodingContainer.decode<A>(_:forKey:)( &v15,  &type metadata for ArgumentInfoV0.NameInfoV0.KindV0,  &v14,  v3,  &type metadata for ArgumentInfoV0.NameInfoV0.KindV0,  v10);
    uint64_t v7 = v15;
    char v13 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v13, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  sub_1000062D8(a1);
  return v7;
}

unint64_t sub_100092C10(Swift::String string, Swift::OpaquePointer cases)
{
  object = string._object;
  v3._uint64_t countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  unint64_t v5 = _findStringSwitchCase(cases:string:)(cases, v3);
  swift_bridgeObjectRelease(object);
  if (v5 >= 3) {
    return 3LL;
  }
  else {
    return v5;
  }
}

unint64_t sub_100092C54()
{
  unint64_t result = qword_1000C2690[0];
  if (!qword_1000C2690[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B8A4, &type metadata for ArgumentInfoV0.CodingKeys);
    atomic_store(result, qword_1000C2690);
  }

  return result;
}

unint64_t sub_100092C98()
{
  unint64_t result = qword_1000BA020;
  if (!qword_1000BA020)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.KindV0,  &type metadata for ArgumentInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA020);
  }

  return result;
}

unint64_t sub_100092CDC()
{
  unint64_t result = qword_1000BA040;
  if (!qword_1000BA040)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.NameInfoV0,  &type metadata for ArgumentInfoV0.NameInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA040);
  }

  return result;
}

uint64_t sub_100092D20(uint64_t a1, unint64_t a2)
{
  if (a1 == 1684957547 && a2 == 0xE400000000000000LL)
  {
    unint64_t v5 = 0xE400000000000000LL;
    goto LABEL_8;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(1684957547LL, 0xE400000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v5 = a2;
LABEL_8:
    swift_bridgeObjectRelease(v5);
    return 0LL;
  }

  if (a1 == 0x6944646C756F6873LL && a2 == 0xED000079616C7073LL)
  {
    unint64_t v7 = 0xED000079616C7073LL;
LABEL_14:
    swift_bridgeObjectRelease(v7);
    return 1LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6944646C756F6873LL, 0xED000079616C7073LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_14;
  }

  if (a1 == 0x546E6F6974636573LL && a2 == 0xEC000000656C7469LL)
  {
    unint64_t v8 = 0xEC000000656C7469LL;
LABEL_20:
    swift_bridgeObjectRelease(v8);
    return 2LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x546E6F6974636573LL, 0xEC000000656C7469LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
    goto LABEL_20;
  }

  if (a1 == 0x6E6F6974704F7369LL && a2 == 0xEA00000000006C61LL)
  {
    unint64_t v9 = 0xEA00000000006C61LL;
LABEL_26:
    swift_bridgeObjectRelease(v9);
    return 3LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6E6F6974704F7369LL, 0xEA00000000006C61LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v9 = a2;
    goto LABEL_26;
  }

  if (a1 == 0x7461657065527369LL && a2 == 0xEB00000000676E69LL)
  {
    unint64_t v10 = 0xEB00000000676E69LL;
LABEL_32:
    swift_bridgeObjectRelease(v10);
    return 4LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7461657065527369LL, 0xEB00000000676E69LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v10 = a2;
    goto LABEL_32;
  }

  if (a1 == 0x73656D616ELL && a2 == 0xE500000000000000LL)
  {
    unint64_t v11 = 0xE500000000000000LL;
LABEL_38:
    swift_bridgeObjectRelease(v11);
    return 5LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x73656D616ELL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v11 = a2;
    goto LABEL_38;
  }

  if (a1 == 0x6572726566657270LL && a2 == 0xED0000656D614E64LL)
  {
    unint64_t v12 = 0xED0000656D614E64LL;
LABEL_44:
    swift_bridgeObjectRelease(v12);
    return 6LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6572726566657270LL, 0xED0000656D614E64LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v12 = a2;
    goto LABEL_44;
  }

  if (a1 == 0x6D614E65756C6176LL && a2 == 0xE900000000000065LL)
  {
    unint64_t v13 = 0xE900000000000065LL;
LABEL_50:
    swift_bridgeObjectRelease(v13);
    return 7LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x6D614E65756C6176LL, 0xE900000000000065LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v13 = a2;
    goto LABEL_50;
  }

  if (a1 == 0x56746C7561666564LL && a2 == 0xEC00000065756C61LL)
  {
    unint64_t v14 = 0xEC00000065756C61LL;
LABEL_56:
    swift_bridgeObjectRelease(v14);
    return 8LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x56746C7561666564LL, 0xEC00000065756C61LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v14 = a2;
    goto LABEL_56;
  }

  if (a1 == 0x65756C61566C6C61LL && a2 == 0xE900000000000073LL)
  {
    unint64_t v15 = 0xE900000000000073LL;
LABEL_62:
    swift_bridgeObjectRelease(v15);
    return 9LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x65756C61566C6C61LL, 0xE900000000000073LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v15 = a2;
    goto LABEL_62;
  }

  if (a1 == 0x7463617274736261LL && a2 == 0xE800000000000000LL)
  {
    unint64_t v16 = 0xE800000000000000LL;
LABEL_68:
    swift_bridgeObjectRelease(v16);
    return 10LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0x7463617274736261LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v16 = a2;
    goto LABEL_68;
  }

  if (a1 == 0x6973737563736964LL && a2 == 0xEA00000000006E6FLL)
  {
    swift_bridgeObjectRelease(0xEA00000000006E6FLL);
    return 11LL;
  }

  else
  {
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6973737563736964LL, 0xEA00000000006E6FLL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v17 & 1) != 0) {
      return 11LL;
    }
    else {
      return 12LL;
    }
  }

void *sub_100093288@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100005104(&qword_1000BA090);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  unint64_t v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  uint64_t v78 = a1;
  sub_100006270(a1, v9);
  unint64_t v11 = sub_100092C54();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ArgumentInfoV0.CodingKeys,  &type metadata for ArgumentInfoV0.CodingKeys,  v11,  v9,  v10);
  if (v2)
  {
    uint64_t v113 = v2;
    uint64_t v15 = 0LL;
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    uint64_t v19 = 0LL;
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
LABEL_4:
    sub_1000062D8(v78);
    swift_bridgeObjectRelease(0LL);
    swift_bridgeObjectRelease(v20);
    swift_bridgeObjectRelease(v21);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v17);
    swift_bridgeObjectRelease(v16);
    return (void *)swift_bridgeObjectRelease(v15);
  }

  uint64_t v12 = v6;
  LOBYTE(v79) = 0;
  unint64_t v13 = sub_100095230();
  KeyedDecodingContainer.decode<A>(_:forKey:)( &v88,  &type metadata for ArgumentInfoV0.KindV0,  &v79,  v5,  &type metadata for ArgumentInfoV0.KindV0,  v13);
  int v14 = v88;
  LOBYTE(v88) = 1;
  int v77 = KeyedDecodingContainer.decode(_:forKey:)(&v88, v5);
  LOBYTE(v88) = 2;
  uint64_t v23 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v88, v5);
  uint64_t v25 = v24;
  int v76 = v14;
  LOBYTE(v88) = 3;
  swift_bridgeObjectRetain(v24);
  int v73 = KeyedDecodingContainer.decode(_:forKey:)(&v88, v5);
  uint64_t v74 = v23;
  uint64_t v75 = v25;
  LOBYTE(v88) = 4;
  int v72 = KeyedDecodingContainer.decode(_:forKey:)(&v88, v5);
  uint64_t v26 = sub_100005104(&qword_1000BA030);
  LOBYTE(v79) = 5;
  uint64_t v27 = sub_100080D6C( &qword_1000BA0A0,  &qword_1000BA030,  (void (*)(void))sub_100095274,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v88, v26, &v79, v5, v26, v27);
  uint64_t v28 = v88;
  LOBYTE(v79) = 6;
  unint64_t v29 = sub_100095274();
  uint64_t v71 = v28;
  swift_bridgeObjectRetain(v28);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)( &v88,  &type metadata for ArgumentInfoV0.NameInfoV0,  &v79,  v5,  &type metadata for ArgumentInfoV0.NameInfoV0,  v29);
  uint64_t v30 = v88;
  uint64_t v70 = v89;
  LOBYTE(v88) = 7;
  uint64_t v31 = v90;
  swift_bridgeObjectRetain(v90);
  uint64_t v67 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v88, v5);
  uint64_t v68 = v30;
  uint64_t v69 = v31;
  LOBYTE(v88) = 8;
  uint64_t v17 = v32;
  swift_bridgeObjectRetain(v32);
  uint64_t v33 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v88, v5);
  uint64_t v113 = 0LL;
  uint64_t v35 = v33;
  uint64_t v36 = v34;
  uint64_t v65 = a2;
  uint64_t v37 = sub_100005104(&qword_1000B9FC0);
  LOBYTE(v79) = 9;
  uint64_t v38 = sub_1000952B8( &qword_1000BA0B0,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  uint64_t v66 = v36;
  swift_bridgeObjectRetain(v36);
  uint64_t v39 = v38;
  uint64_t v40 = v113;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v88, v37, &v79, v5, v37, v39);
  uint64_t v113 = v40;
  if (v40)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v5);
    uint64_t v21 = v75;
    swift_bridgeObjectRelease(v75);
    uint64_t v19 = v71;
    swift_bridgeObjectRelease(v71);
    uint64_t v18 = v69;
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRelease(v17);
    uint64_t v16 = v66;
    swift_bridgeObjectRelease(v66);
    uint64_t v15 = 0LL;
    uint64_t v20 = 0LL;
    goto LABEL_4;
  }

  uint64_t v41 = v88;
  LOBYTE(v88) = 10;
  uint64_t v64 = v41;
  swift_bridgeObjectRetain(v41);
  uint64_t v42 = v113;
  uint64_t v43 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v88, v5);
  uint64_t v113 = v42;
  if (v42)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v5);
    uint64_t v21 = v75;
    swift_bridgeObjectRelease(v75);
    uint64_t v19 = v71;
    swift_bridgeObjectRelease(v71);
    uint64_t v18 = v69;
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRelease(v17);
    uint64_t v16 = v66;
    swift_bridgeObjectRelease(v66);
    uint64_t v15 = v64;
    swift_bridgeObjectRelease(v64);
    uint64_t v20 = 0LL;
    goto LABEL_4;
  }

  uint64_t v45 = v43;
  uint64_t v20 = v44;
  char v108 = 11;
  swift_bridgeObjectRetain(v44);
  uint64_t v46 = v113;
  uint64_t v63 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v108, v5);
  uint64_t v113 = v46;
  if (v46)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v5);
    uint64_t v21 = v75;
    swift_bridgeObjectRelease(v75);
    uint64_t v19 = v71;
    swift_bridgeObjectRelease(v71);
    uint64_t v18 = v69;
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRelease(v17);
    uint64_t v16 = v66;
    swift_bridgeObjectRelease(v66);
    uint64_t v15 = v64;
    swift_bridgeObjectRelease(v64);
    swift_bridgeObjectRelease(v20);
    goto LABEL_4;
  }

  uint64_t v48 = v47;
  int v62 = v77 & 1;
  int v77 = v73 & 1;
  int v73 = v72 & 1;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v5);
  swift_bridgeObjectRetain(v48);
  swift_bridgeObjectRelease(0LL);
  LOBYTE(v79) = v76;
  BYTE1(v79) = v62;
  uint64_t v49 = v75;
  *((void *)&v79 + 1) = v74;
  *(void *)&__int128 v80 = v75;
  BYTE8(v80) = v77;
  BYTE9(v80) = v73;
  uint64_t v50 = v71;
  uint64_t v51 = v69;
  *(void *)&__int128 v81 = v71;
  *((void *)&v81 + 1) = v68;
  *(void *)&__int128 v82 = v70;
  *((void *)&v82 + 1) = v69;
  *(void *)&__int128 v83 = v67;
  *((void *)&v83 + 1) = v17;
  uint64_t v61 = v35;
  *(void *)&__int128 v84 = v35;
  uint64_t v52 = v66;
  *((void *)&v84 + 1) = v66;
  *(void *)&__int128 v85 = v64;
  *((void *)&v85 + 1) = v45;
  *(void *)&__int128 v86 = v20;
  *((void *)&v86 + 1) = v63;
  uint64_t v87 = v48;
  sub_100091D50(&v79);
  swift_bridgeObjectRelease(v49);
  swift_bridgeObjectRelease(v50);
  swift_bridgeObjectRelease(v51);
  uint64_t v53 = v17;
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v52);
  uint64_t v54 = v64;
  swift_bridgeObjectRelease(v64);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v48);
  sub_1000062D8(v78);
  LOBYTE(v88) = v76;
  BYTE1(v88) = v62;
  *(_DWORD *)((char *)&v88 + 2) = v111;
  HIWORD(v88) = v112;
  uint64_t v89 = v74;
  uint64_t v90 = v49;
  char v91 = v77;
  char v92 = v73;
  int v93 = v109;
  __int16 v94 = v110;
  uint64_t v95 = v71;
  uint64_t v96 = v68;
  uint64_t v97 = v70;
  uint64_t v98 = v51;
  uint64_t v99 = v67;
  uint64_t v100 = v53;
  uint64_t v101 = v61;
  uint64_t v102 = v52;
  uint64_t v103 = v54;
  uint64_t v104 = v45;
  uint64_t v105 = v20;
  uint64_t v106 = v63;
  uint64_t v107 = v48;
  unint64_t result = sub_100091DE0(&v88);
  __int128 v55 = v86;
  uint64_t v56 = v65;
  *(_OWORD *)(v65 + 96) = v85;
  *(_OWORD *)(v56 + 112) = v55;
  *(void *)(v56 + 128) = v87;
  __int128 v57 = v82;
  *(_OWORD *)(v56 + 32) = v81;
  *(_OWORD *)(v56 + 48) = v57;
  __int128 v58 = v84;
  *(_OWORD *)(v56 + 64) = v83;
  *(_OWORD *)(v56 + 80) = v58;
  __int128 v59 = v80;
  *(_OWORD *)uint64_t v56 = v79;
  *(_OWORD *)(v56 + 16) = v59;
  return result;
}

unint64_t sub_100093ADC()
{
  unint64_t result = qword_1000BA050;
  if (!qword_1000BA050)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for ToolInfoV0, &type metadata for ToolInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA050);
  }

  return result;
}

unint64_t sub_100093B24()
{
  unint64_t result = qword_1000BA058;
  if (!qword_1000BA058)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CommandInfoV0, &type metadata for CommandInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA058);
  }

  return result;
}

unint64_t sub_100093B6C()
{
  unint64_t result = qword_1000BA060;
  if (!qword_1000BA060)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.NameInfoV0.KindV0,  &type metadata for ArgumentInfoV0.NameInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA060);
  }

  return result;
}

unint64_t sub_100093BB4()
{
  unint64_t result = qword_1000BA068;
  if (!qword_1000BA068)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.NameInfoV0,  &type metadata for ArgumentInfoV0.NameInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA068);
  }

  return result;
}

unint64_t sub_100093BFC()
{
  unint64_t result = qword_1000BA070;
  if (!qword_1000BA070)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.KindV0,  &type metadata for ArgumentInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA070);
  }

  return result;
}

unint64_t sub_100093C44()
{
  unint64_t result = qword_1000BA078;
  if (!qword_1000BA078)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0,  &type metadata for ArgumentInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA078);
  }

  return result;
}

ValueMetadata *type metadata accessor for ToolInfoHeader()
{
  return &type metadata for ToolInfoHeader;
}

uint64_t destroy for ToolInfoV0(void *a1)
{
  return swift_bridgeObjectRelease(a1[11]);
}

void *initializeWithCopy for ToolInfoV0(void *a1, void *a2)
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
  uint64_t v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  uint64_t v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  uint64_t v8 = a2[10];
  uint64_t v9 = a2[11];
  a1[10] = v8;
  a1[11] = v9;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  return a1;
}

void *assignWithCopy for ToolInfoV0(void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v4 = a1[1];
  uint64_t v5 = a2[1];
  a1[1] = v5;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRelease(v4);
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
  a1[6] = a2[6];
  uint64_t v10 = a2[7];
  uint64_t v11 = a1[7];
  a1[7] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[8] = a2[8];
  uint64_t v12 = a2[9];
  uint64_t v13 = a1[9];
  a1[9] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = a1[10];
  uint64_t v15 = a2[10];
  a1[10] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v14);
  uint64_t v16 = a1[11];
  uint64_t v17 = a2[11];
  a1[11] = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v16);
  return a1;
}

__n128 initializeWithTake for ToolInfoV0(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  __int128 v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

void *assignWithTake for ToolInfoV0(void *a1, uint64_t a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v5;
  swift_bridgeObjectRelease(v4);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = a1[3];
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = a1[5];
  a1[4] = *(void *)(a2 + 32);
  a1[5] = v8;
  swift_bridgeObjectRelease(v9);
  uint64_t v10 = *(void *)(a2 + 56);
  uint64_t v11 = a1[7];
  a1[6] = *(void *)(a2 + 48);
  a1[7] = v10;
  swift_bridgeObjectRelease(v11);
  a1[8] = *(void *)(a2 + 64);
  swift_bridgeObjectRelease(a1[9]);
  uint64_t v12 = a1[10];
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = a1[11];
  a1[11] = *(void *)(a2 + 88);
  swift_bridgeObjectRelease(v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for ToolInfoV0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 96)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ToolInfoV0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 88) = 0LL;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 96) = 1;
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
      *(void *)(result + 24) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 96) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ToolInfoV0()
{
  return &type metadata for ToolInfoV0;
}

uint64_t destroy for CommandInfoV0(void *a1)
{
  return swift_bridgeObjectRelease(a1[10]);
}

uint64_t *initializeWithCopy for CommandInfoV0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v6 = a2[2];
  uint64_t v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  uint64_t v8 = a2[4];
  uint64_t v7 = a2[5];
  a1[4] = v8;
  a1[5] = v7;
  uint64_t v10 = a2[6];
  uint64_t v9 = a2[7];
  a1[6] = v10;
  a1[7] = v9;
  uint64_t v11 = a2[8];
  uint64_t v12 = a2[9];
  a1[8] = v11;
  a1[9] = v12;
  uint64_t v13 = a2[10];
  a1[10] = v13;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  return a1;
}

uint64_t *assignWithCopy for CommandInfoV0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRelease(v4);
  a1[1] = a2[1];
  uint64_t v6 = a2[2];
  uint64_t v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  uint64_t v8 = a2[4];
  uint64_t v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[5] = a2[5];
  uint64_t v10 = a2[6];
  uint64_t v11 = a1[6];
  a1[6] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[7] = a2[7];
  uint64_t v12 = a2[8];
  uint64_t v13 = a1[8];
  a1[8] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = a1[9];
  uint64_t v15 = a2[9];
  a1[9] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v14);
  uint64_t v16 = a1[10];
  uint64_t v17 = a2[10];
  a1[10] = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v16);
  return a1;
}

__n128 initializeWithTake for CommandInfoV0(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  __int128 v5 = *(_OWORD *)(a2 + 64);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

void *assignWithTake for CommandInfoV0(void *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  *a1 = *(void *)a2;
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = a1[2];
  a1[1] = *(void *)(a2 + 8);
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  uint64_t v7 = *(void *)(a2 + 32);
  uint64_t v8 = a1[4];
  a1[3] = *(void *)(a2 + 24);
  a1[4] = v7;
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = a1[6];
  a1[5] = *(void *)(a2 + 40);
  a1[6] = v9;
  swift_bridgeObjectRelease(v10);
  a1[7] = *(void *)(a2 + 56);
  swift_bridgeObjectRelease(a1[8]);
  uint64_t v11 = a1[9];
  *((_OWORD *)a1 + 4) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = a1[10];
  a1[10] = *(void *)(a2 + 80);
  swift_bridgeObjectRelease(v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for CommandInfoV0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 88)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CommandInfoV0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 88) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 88) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for CommandInfoV0()
{
  return &type metadata for CommandInfoV0;
}

uint64_t destroy for ArgumentInfoV0(void *a1)
{
  return swift_bridgeObjectRelease(a1[16]);
}

uint64_t initializeWithCopy for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v4;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  uint64_t v6 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v6;
  uint64_t v7 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v7;
  uint64_t v9 = *(void *)(a2 + 96);
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = v9;
  *(void *)(a1 + 104) = v8;
  uint64_t v11 = *(void *)(a2 + 112);
  uint64_t v10 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = v11;
  *(void *)(a1 + 120) = v10;
  uint64_t v12 = *(void *)(a2 + 128);
  *(void *)(a1 + 128) = v12;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  return a1;
}

uint64_t assignWithCopy for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a2 + 32);
  *(void *)(a1 + 32) = v7;
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRelease(v6);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v10 = *(void *)(a2 + 72);
  uint64_t v11 = *(void *)(a1 + 72);
  *(void *)(a1 + 72) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  uint64_t v12 = *(void *)(a2 + 88);
  uint64_t v13 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = *(void *)(a1 + 96);
  uint64_t v15 = *(void *)(a2 + 96);
  *(void *)(a1 + 96) = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v14);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v16 = *(void *)(a2 + 112);
  uint64_t v17 = *(void *)(a1 + 112);
  *(void *)(a1 + 112) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  uint64_t v18 = *(void *)(a2 + 128);
  uint64_t v19 = *(void *)(a1 + 128);
  *(void *)(a1 + 128) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  return a1;
}

__n128 initializeWithTake for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __int128 v2 = *(_OWORD *)(a2 + 16);
  __int128 v3 = *(_OWORD *)(a2 + 32);
  __int128 v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  __n128 result = *(__n128 *)(a2 + 80);
  __int128 v6 = *(_OWORD *)(a2 + 96);
  __int128 v7 = *(_OWORD *)(a2 + 112);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t assignWithTake for ArgumentInfoV0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(a2 + 25);
  uint64_t v6 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease(v6);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  uint64_t v7 = *(void *)(a2 + 56);
  uint64_t v8 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = *(void *)(a2 + 72);
  uint64_t v10 = *(void *)(a1 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v9;
  swift_bridgeObjectRelease(v10);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRelease(*(void *)(a1 + 88));
  uint64_t v11 = *(void *)(a1 + 96);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(void *)(a2 + 112);
  uint64_t v13 = *(void *)(a1 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v12;
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = *(void *)(a2 + 128);
  uint64_t v15 = *(void *)(a1 + 128);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  *(void *)(a1 + 128) = v14;
  swift_bridgeObjectRelease(v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 136)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 136) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 136) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0()
{
  return &type metadata for ArgumentInfoV0;
}

uint64_t destroy for ArgumentInfoV0.NameInfoV0(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 16));
}

uint64_t _s22ArgumentParserToolInfo14ArgumentInfoV0V10NameInfoV0VwCP_0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t assignWithCopy for ArgumentInfoV0.NameInfoV0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for ArgumentInfoV0.NameInfoV0(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ArgumentInfoV0.NameInfoV0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0.NameInfoV0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0.NameInfoV0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0LL;
    *(void *)(result + 16) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 24) = 1;
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
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0;
}

_BYTE *initializeBufferWithCopyOfBuffer for ArgumentInfoV0.KindV0(_BYTE *result, _BYTE *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0.KindV0()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0.KindV0;
}

uint64_t _s22ArgumentParserToolInfo14ArgumentInfoV0V6KindV0Owst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_100094948 + 4 * byte_10009AF78[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10009497C + 4 * byte_10009AF73[v4]))();
}

uint64_t sub_10009497C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094984(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10009498CLL);
  }
  return result;
}

uint64_t sub_100094998(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000949A0LL);
  }
  *(_BYTE *)__n128 result = a2 + 2;
  return result;
}

uint64_t sub_1000949A4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000949AC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.KindV0()
{
  return &type metadata for ArgumentInfoV0.KindV0;
}

uint64_t getEnumTagSinglePayload for ArgumentInfoV0.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF5) {
    goto LABEL_17;
  }
  if (a2 + 11 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 11) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 11;
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
      return (*a1 | (v4 << 8)) - 11;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 11;
    }
  }

uint64_t storeEnumTagSinglePayload for ArgumentInfoV0.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF4) {
    return ((uint64_t (*)(void))((char *)&loc_100094AA4 + 4 * byte_10009AF82[v4]))();
  }
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_100094AD8 + 4 * byte_10009AF7D[v4]))();
}

uint64_t sub_100094AD8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094AE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100094AE8LL);
  }
  return result;
}

uint64_t sub_100094AF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100094AFCLL);
  }
  *(_BYTE *)__n128 result = a2 + 11;
  return result;
}

uint64_t sub_100094B00(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094B08(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.CodingKeys()
{
  return &type metadata for ArgumentInfoV0.CodingKeys;
}

ValueMetadata *type metadata accessor for ArgumentInfoV0.NameInfoV0.CodingKeys()
{
  return &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for CommandInfoV0.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_100094B84 + 4 * byte_10009AF8C[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_100094BB8 + 4 * byte_10009AF87[v4]))();
}

uint64_t sub_100094BB8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094BC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100094BC8LL);
  }
  return result;
}

uint64_t sub_100094BD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100094BDCLL);
  }
  *(_BYTE *)__n128 result = a2 + 6;
  return result;
}

uint64_t sub_100094BE0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094BE8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CommandInfoV0.CodingKeys()
{
  return &type metadata for CommandInfoV0.CodingKeys;
}

uint64_t _s22ArgumentParserToolInfo14ArgumentInfoV0V10NameInfoV0V10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100094C50 + 4 * byte_10009AF96[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100094C84 + 4 * byte_10009AF91[v4]))();
}

uint64_t sub_100094C84(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094C8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100094C94LL);
  }
  return result;
}

uint64_t sub_100094CA0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100094CA8LL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_100094CAC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100094CB4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoV0.CodingKeys()
{
  return &type metadata for ToolInfoV0.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for ToolInfoHeader.CodingKeys(uint64_t a1, int a2, int a3)
{
  else {
    int v3 = 2;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2) {
    return ((uint64_t (*)(void))((char *)sub_100094D14 + 4 * byte_10009AF9B[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_100094D34 + 4 * byte_10009AFA0[v4]))();
  }
}

_BYTE *sub_100094D14(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

_BYTE *sub_100094D34(_BYTE *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_100094D3C(_DWORD *result, int a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_100094D44(_WORD *result, __int16 a2)
{
  *__n128 result = a2;
  return result;
}

_WORD *sub_100094D4C(_WORD *result)
{
  *__n128 result = 0;
  return result;
}

_DWORD *sub_100094D54(_DWORD *result)
{
  *__n128 result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ToolInfoHeader.CodingKeys()
{
  return &type metadata for ToolInfoHeader.CodingKeys;
}

unint64_t sub_100094D74()
{
  unint64_t result = qword_1000C3520[0];
  if (!qword_1000C3520[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B59C, &type metadata for ToolInfoHeader.CodingKeys);
    atomic_store(result, qword_1000C3520);
  }

  return result;
}

unint64_t sub_100094DBC()
{
  unint64_t result = qword_1000C3730[0];
  if (!qword_1000C3730[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B654, &type metadata for ToolInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3730);
  }

  return result;
}

unint64_t sub_100094E04()
{
  unint64_t result = qword_1000C3940[0];
  if (!qword_1000C3940[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B70C, &type metadata for CommandInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3940);
  }

  return result;
}

unint64_t sub_100094E4C()
{
  unint64_t result = qword_1000C3B50[0];
  if (!qword_1000C3B50[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B7C4, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3B50);
  }

  return result;
}

unint64_t sub_100094E94()
{
  unint64_t result = qword_1000C3D60[0];
  if (!qword_1000C3D60[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B87C, &type metadata for ArgumentInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3D60);
  }

  return result;
}

unint64_t sub_100094EDC()
{
  unint64_t result = qword_1000C3E70;
  if (!qword_1000C3E70)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B7EC, &type metadata for ArgumentInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C3E70);
  }

  return result;
}

unint64_t sub_100094F24()
{
  unint64_t result = qword_1000C3E78;
  if (!qword_1000C3E78)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B814, &type metadata for ArgumentInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C3E78);
  }

  return result;
}

unint64_t sub_100094F6C()
{
  unint64_t result = qword_1000C3F00;
  if (!qword_1000C3F00)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B734, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C3F00);
  }

  return result;
}

unint64_t sub_100094FB4()
{
  unint64_t result = qword_1000C3F08[0];
  if (!qword_1000C3F08[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B75C, &type metadata for ArgumentInfoV0.NameInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3F08);
  }

  return result;
}

unint64_t sub_100094FFC()
{
  unint64_t result = qword_1000C3F90;
  if (!qword_1000C3F90)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B67C, &type metadata for CommandInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C3F90);
  }

  return result;
}

unint64_t sub_100095044()
{
  unint64_t result = qword_1000C3F98[0];
  if (!qword_1000C3F98[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B6A4, &type metadata for CommandInfoV0.CodingKeys);
    atomic_store(result, qword_1000C3F98);
  }

  return result;
}

unint64_t sub_10009508C()
{
  unint64_t result = qword_1000C4020;
  if (!qword_1000C4020)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B5C4, &type metadata for ToolInfoV0.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C4020);
  }

  return result;
}

unint64_t sub_1000950D4()
{
  unint64_t result = qword_1000C4028[0];
  if (!qword_1000C4028[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B5EC, &type metadata for ToolInfoV0.CodingKeys);
    atomic_store(result, qword_1000C4028);
  }

  return result;
}

unint64_t sub_10009511C()
{
  unint64_t result = qword_1000C40B0;
  if (!qword_1000C40B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B50C, &type metadata for ToolInfoHeader.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000C40B0);
  }

  return result;
}

unint64_t sub_100095164()
{
  unint64_t result = qword_1000C40B8[0];
  if (!qword_1000C40B8[0])
  {
    unint64_t result = swift_getWitnessTable(&unk_10009B534, &type metadata for ToolInfoHeader.CodingKeys);
    atomic_store(result, qword_1000C40B8);
  }

  return result;
}

unint64_t sub_1000951A8()
{
  unint64_t result = qword_1000BA080;
  if (!qword_1000BA080)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.KindV0,  &type metadata for ArgumentInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA080);
  }

  return result;
}

unint64_t sub_1000951EC()
{
  unint64_t result = qword_1000BA088;
  if (!qword_1000BA088)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.NameInfoV0.KindV0,  &type metadata for ArgumentInfoV0.NameInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA088);
  }

  return result;
}

unint64_t sub_100095230()
{
  unint64_t result = qword_1000BA098;
  if (!qword_1000BA098)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.KindV0,  &type metadata for ArgumentInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA098);
  }

  return result;
}

unint64_t sub_100095274()
{
  unint64_t result = qword_1000BA0A8;
  if (!qword_1000BA0A8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.NameInfoV0,  &type metadata for ArgumentInfoV0.NameInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA0A8);
  }

  return result;
}

uint64_t sub_1000952B8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_10000593C(&qword_1000B9FC0);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100095318()
{
  unint64_t result = qword_1000BA0C0;
  if (!qword_1000BA0C0)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0.NameInfoV0.KindV0,  &type metadata for ArgumentInfoV0.NameInfoV0.KindV0);
    atomic_store(result, (unint64_t *)&qword_1000BA0C0);
  }

  return result;
}

unint64_t sub_10009535C()
{
  unint64_t result = qword_1000BA0D8;
  if (!qword_1000BA0D8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for CommandInfoV0, &type metadata for CommandInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA0D8);
  }

  return result;
}

unint64_t sub_1000953A0()
{
  unint64_t result = qword_1000BA0E8;
  if (!qword_1000BA0E8)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ArgumentInfoV0,  &type metadata for ArgumentInfoV0);
    atomic_store(result, (unint64_t *)&qword_1000BA0E8);
  }

  return result;
}