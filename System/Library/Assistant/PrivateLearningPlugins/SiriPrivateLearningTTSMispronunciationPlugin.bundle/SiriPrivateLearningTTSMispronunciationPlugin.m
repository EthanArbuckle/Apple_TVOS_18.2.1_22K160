void sub_36D0( uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint8_t *buf)
{
  uint64_t v17;
  uint64_t v18;
  os_log_s *v19;
  os_log_type_t v20;
  uint8_t *v21;
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  v17 = type metadata accessor for Logger(0LL);
  v18 = sub_4F30(v17, (uint64_t)qword_4FC70);
  v19 = (os_log_s *)Logger.logObject.getter(v18);
  v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_0, v19, v20, "Start runP2P()", v21, 2u);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  __asm { BR              X10 }
}

uint64_t sub_3F98(void *a1, uint64_t a2)
{
  if ((a2 & 0xC000000000000001LL) != 0)
  {
    id v4 = a1;
    char v5 = __CocoaSet.contains(_:)();

    return v5 & 1;
  }

  if (!*(void *)(a2 + 16)
    || (Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40)),
        uint64_t v8 = -1LL << *(_BYTE *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v9) & 1) == 0))
  {
LABEL_11:
    char v13 = 0;
    return v13 & 1;
  }

  type metadata accessor for PhonemeString();
  id v11 = *(id *)(*(void *)(a2 + 48) + 8 * v9);
  char v12 = static NSObject.== infix(_:_:)(v11, a1);

  if ((v12 & 1) == 0)
  {
    uint64_t v14 = ~v8;
    unint64_t v15 = (v9 + 1) & v14;
    if (((*(void *)(v10 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) != 0)
    {
      do
      {
        id v16 = *(id *)(*(void *)(a2 + 48) + 8 * v15);
        char v13 = static NSObject.== infix(_:_:)(v16, a1);

        if ((v13 & 1) != 0) {
          break;
        }
        unint64_t v15 = (v15 + 1) & v14;
      }

      while (((*(void *)(v10 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) != 0);
      return v13 & 1;
    }

    goto LABEL_11;
  }

  char v13 = 1;
  return v13 & 1;
}

void sub_40E4(void *a1)
{
  v3 = (double **)0xE100000000000000LL;
  unint64_t v4 = sub_1686C(32LL, 0xE100000000000000LL);
  uint64_t v6 = v5;
  v68 = a1;
  unint64_t v7 = sub_1686C(32LL, 0xE100000000000000LL);
  unint64_t v9 = v8;
  if (qword_4A730 != -1) {
    goto LABEL_81;
  }
  while (1)
  {
    uint64_t v10 = qword_4FC50;
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v6);
    sub_5084(v4, v6, v10, v7, (uint64_t)v9);
    uint64_t v12 = v11;
    unint64_t v14 = v13;
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v9);
    uint64_t v15 = qword_4FC50;
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRetain(v15);
    sub_5084(v7, (uint64_t)v9, v15, v12, v14);
    unint64_t v17 = v16;
    unint64_t v19 = v18;
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v14);
    unint64_t v78 = v12;
    unint64_t v79 = v14;
    uint64_t v6 = 32LL;
    uint64_t v76 = 32LL;
    v77 = v3;
    unint64_t v20 = sub_53D8();
    unint64_t v4 = StringProtocol.components<A>(separatedBy:)( &v76,  &type metadata for String,  &type metadata for String,  v20,  v20);
    swift_bridgeObjectRelease(v14);
    unint64_t v78 = v17;
    unint64_t v79 = v19;
    uint64_t v76 = 32LL;
    v77 = v3;
    unint64_t v9 = (double *)StringProtocol.components<A>(separatedBy:)( &v76,  &type metadata for String,  &type metadata for String,  v20,  v20);
    swift_bridgeObjectRelease(v19);
    unint64_t v70 = v4;
    v21 = *(void **)(v4 + 16);
    v72 = v9;
    unint64_t v7 = *((void *)v9 + 2);
    v22 = sub_4A1C(v7 + 1, 0.0);
    v23 = sub_4B0C((uint64_t)v22, (uint64_t)v21 + 1);
    v69 = v21;
    if (v21)
    {
      unint64_t v14 = (unint64_t)v23;
      if ((swift_isUniquelyReferenced_nonNull_native(v23) & 1) != 0) {
        goto LABEL_4;
      }
    }

    else
    {
      __break(1u);
    }

    unint64_t v14 = (unint64_t)sub_5070((void *)v14);
LABEL_4:
    if (*(void *)(v14 + 16) < 2uLL)
    {
      __break(1u);
    }

    else
    {
      unint64_t v9 = *(double **)(v14 + 40);
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v9);
      *(void *)(v14 + 40) = v9;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if (!*((void *)v9 + 2)) {
          goto LABEL_86;
        }
        goto LABEL_7;
      }
    }

    unint64_t v9 = (double *)sub_505C(v9);
    if (!*((void *)v9 + 2))
    {
LABEL_86:
      __break(1u);
LABEL_87:
      __break(1u);
      goto LABEL_88;
    }

LABEL_7:
    v9[4] = 1.0;
    v71 = (void *)v14;
    *(void *)(v14 + 40) = v9;
    unint64_t v14 = (unint64_t)v21 - 1;
LABEL_8:
    if (!v7) {
      goto LABEL_87;
    }
    v21 = v71;
    if (v71[2])
    {
      v3 = (double **)(v71 + 4);
      unint64_t v9 = (double *)v71[4];
      char v25 = swift_isUniquelyReferenced_nonNull_native(v9);
      v71[4] = v9;
      if ((v25 & 1) != 0) {
        goto LABEL_11;
      }
      goto LABEL_89;
    }

  __break(1u);
}

LABEL_88:
    __break(1u);
LABEL_89:
    unint64_t v9 = (double *)sub_505C(v9);
LABEL_11:
    if (*((void *)v9 + 2) < 2uLL) {
      break;
    }
    v9[5] = 1.0;
    *v3 = v9;
    unint64_t v80 = v7 - 1;
    if (v7 == 1)
    {
LABEL_13:
      if (*(void *)(v70 + 16))
      {
        unint64_t v14 = 1LL;
        double v1 = 1.0;
        unint64_t v73 = 0LL;
        v74 = (unint64_t *)(v70 + 32);
LABEL_15:
        if (*((void *)v72 + 2))
        {
          unint64_t v4 = 0LL;
          v26 = (uint64_t *)(v72 + 5);
          while (1)
          {
            unint64_t v7 = *v74;
            uint64_t v27 = v74[1];
            uint64_t v29 = *(v26 - 1);
            uint64_t v28 = *v26;
            double v30 = 0.0;
            BOOL v31 = *v74 == v29 && v27 == v28;
            if (!v31 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v74, v74[1], *(v26 - 1), *v26, 0LL) & 1) == 0)
            {
              uint64_t v32 = qword_4A728;
              swift_bridgeObjectRetain(v27);
              swift_bridgeObjectRetain(v28);
              if (v32 != -1) {
                swift_once(&qword_4A728, sub_17F78);
              }
              uint64_t v33 = qword_4FC48;
              if (*(void *)(qword_4FC48 + 16))
              {
                swift_bridgeObjectRetain(v27);
                swift_bridgeObjectRetain(v28);
                uint64_t v34 = v7;
                unint64_t v7 = v33;
                unint64_t v35 = sub_2DF2C(v34, v27, v29, v28);
                double v30 = 1.0;
                if ((v36 & 1) != 0) {
                  double v30 = *(double *)(*(void *)(v33 + 56) + 8 * v35);
                }
                swift_bridgeObjectRelease_n(v28, 2LL);
                uint64_t v28 = v27;
              }

              else
              {
                double v30 = 1.0;
              }

              swift_bridgeObjectRelease(v28);
              swift_bridgeObjectRelease(v27);
              v21 = v71;
            }

            unint64_t v37 = v21[2];
            if (v14 > v37) {
              break;
            }
            unint64_t v7 = v4 + 1;
            v38 = v3[v73];
            if (v4 + 1 >= *((void *)v38 + 2)) {
              goto LABEL_72;
            }
            if (v14 >= v37) {
              goto LABEL_73;
            }
            unint64_t v9 = v3[v14];
            if (v4 >= *((void *)v9 + 2)) {
              goto LABEL_74;
            }
            double v39 = v38[v4 + 5] + 1.0;
            v40 = &v9[v4];
            double v41 = v38[v4 + 4];
            if (v40[4] + 1.0 < v39) {
              double v39 = v40[4] + 1.0;
            }
            if (v30 + v41 >= v39) {
              double v42 = v39;
            }
            else {
              double v42 = v30 + v41;
            }
            char v43 = swift_isUniquelyReferenced_nonNull_native(v3[v14]);
            v3[v14] = v9;
            if ((v43 & 1) == 0)
            {
              unint64_t v9 = (double *)sub_505C(v9);
              v3[v14] = v9;
            }

            if (v7 >= *((void *)v9 + 2)) {
              goto LABEL_75;
            }
            v9[v4 + 5] = v42;
            if (v80 == v4)
            {
              if ((void *)v14 != v69)
              {
                unint64_t v73 = v14;
                v74 = (unint64_t *)(v70 + 32 + 16 * v14);
                if (v14++ >= *(void *)(v70 + 16)) {
                  goto LABEL_48;
                }
                goto LABEL_15;
              }

              swift_bridgeObjectRelease(v72);
              swift_bridgeObjectRelease(v70);
              uint64_t v47 = v21[2];
              if (!v47 || (v48 = v3[v47 - 1], (uint64_t v49 = *((void *)v48 + 2)) == 0))
              {
                unint64_t v78 = 0LL;
                unint64_t v79 = 0xE000000000000000LL;
                _StringGuts.grow(_:)(24LL);
                swift_bridgeObjectRelease(v79);
                unint64_t v78 = 0xD000000000000016LL;
                unint64_t v79 = 0x800000000003AC60LL;
                swift_bridgeObjectRetain(v21);
                uint64_t v59 = sub_501C(&qword_4A8B8);
                v60._countAndFlagsBits = Array.description.getter(v21, v59);
                object = v60._object;
                String.append(_:)(v60);
                swift_bridgeObjectRelease(v21);
                swift_bridgeObjectRelease(object);
                unint64_t v62 = v78;
                unint64_t v63 = v79;
                unint64_t v64 = sub_4F48();
                uint64_t v65 = swift_allocError(&type metadata for P2PRunningError, v64, 0LL, 0LL);
                *(void *)uint64_t v66 = v62;
                *(void *)(v66 + 8) = v63;
                *(_BYTE *)(v66 + 16) = 1;
                swift_willThrow(v65);
                swift_bridgeObjectRelease(v21);
                return;
              }

              double v1 = v48[v49 + 3];
              if (qword_4A778 != -1) {
                goto LABEL_91;
              }
              goto LABEL_67;
            }

            v26 += 2;
            if (++v4 >= *((void *)v72 + 2)) {
              goto LABEL_70;
            }
          }
        }

        else
        {
LABEL_70:
          __break(1u);
        }

        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
        goto LABEL_76;
      }

LABEL_48:
      __break(1u);
LABEL_49:
      v21 = 0LL;
      v3 = (double **)(v71 + 6);
      while (1)
      {
        uint64_t v6 = (uint64_t)v21 + 2;
        unint64_t v4 = 8LL * (void)v21;
        unint64_t v9 = v3[(void)v21];
        char v45 = swift_isUniquelyReferenced_nonNull_native(v9);
        v3[(void)v21] = v9;
        if ((v45 & 1) != 0)
        {
          if (!*((void *)v9 + 2)) {
            goto LABEL_56;
          }
        }

        else
        {
          unint64_t v9 = (double *)sub_505C(v9);
          v3[(void)v21] = v9;
          if (!*((void *)v9 + 2))
          {
LABEL_56:
            __break(1u);
            goto LABEL_57;
          }
        }

        v9[4] = (double)v6;
        v21 = (void *)((char *)v21 + 1);
        if ((void *)v14 == v21) {
          goto LABEL_8;
        }
      }

      __break(1u);
      goto LABEL_79;
    }

      v71 = v104;
      v81 = v96;
      v82 = v97;
      v83 = (uint64_t)v98;
      v84 = v99;
      v77 = v103;
      unint64_t v79 = v108;
      unint64_t v78 = v109;
      unint64_t v80 = v102;
      uint64_t v76 = v101;
      goto LABEL_43;
    }
  }

  else
  {
    swift_bridgeObjectRelease(0xE400000000000000LL);
  }

  result = sub_E450(v67, v28, v29);
  unint64_t v80 = v16;
  v71 = v104;
  v67 = v96;
  uint64_t v28 = v97;
  uint64_t v29 = (uint64_t)v98;
  double v30 = v99;
  v77 = v103;
  unint64_t v79 = v108;
  unint64_t v78 = v109;
  uint64_t v76 = v101;
LABEL_42:
  v82 = v106;
  v81 = v107;
  v83 = v100;
  v84 = v105;
  LOBYTE(v16) = v110;
LABEL_43:
  *(void *)a4 = v76;
  *(void *)(a4 + 8) = v77;
  *(void *)(a4 + 16) = v78;
  *(void *)(a4 + 24) = v79;
  *(void *)(a4 + 32) = v71;
  *(void *)(a4 + 40) = v67;
  *(void *)(a4 + 48) = v28;
  *(void *)(a4 + 56) = v29;
  *(void *)(a4 + 64) = v30;
  *(void *)(a4 + 72) = v80;
  *(void *)(a4 + 80) = v81;
  *(void *)(a4 + 88) = v82;
  *(void *)(a4 + 96) = v83;
  *(void *)(a4 + 104) = v84;
  *(_BYTE *)(a4 + 112) = v16;
  return result;
}

LABEL_57:
    unint64_t v7 = 0LL;
    while (v21[2])
    {
      char v46 = swift_isUniquelyReferenced_nonNull_native(v9);
      *v3 = v9;
      if ((v46 & 1) == 0) {
        unint64_t v9 = (double *)sub_505C(v9);
      }
      if (v7 + 2 >= *((void *)v9 + 2)) {
        goto LABEL_80;
      }
      v9[v7 + 6] = (double)(uint64_t)(v7 + 2);
      *v3 = v9;
      if (v80 == ++v7) {
        goto LABEL_13;
      }
    }

LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
LABEL_81:
    swift_once(&qword_4A730, sub_181BC);
  }

  __break(1u);
LABEL_91:
  swift_once(&qword_4A778, sub_349B4);
LABEL_67:
  uint64_t v50 = type metadata accessor for Logger(0LL);
  sub_4F30(v50, (uint64_t)qword_4FC70);
  id v51 = v67;
  id v52 = v68;
  unint64_t v4 = (unint64_t)v51;
  v3 = (double **)v52;
  unint64_t v7 = Logger.logObject.getter(v3);
  os_log_type_t v53 = static os_log_type_t.debug.getter();
  int v54 = v53;
  if (os_log_type_enabled((os_log_t)v7, v53))
  {
    uint64_t v55 = swift_slowAlloc(32LL, -1LL);
    v75 = (unint64_t *)swift_slowAlloc(16LL, -1LL);
    *(_DWORD *)uint64_t v55 = 138412802;
    unint64_t v78 = v4;
    LODWORD(v80) = v54;
    id v56 = (id)v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79);
    unint64_t *v75 = v4;

    *(_WORD *)(v55 + 12) = 2112;
    unint64_t v78 = (unint64_t)v3;
    v57 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79);
    v75[1] = (unint64_t)v3;

    *(_WORD *)(v55 + 22) = 2048;
    unint64_t v78 = *(void *)&v1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, &v79);
    _os_log_impl( &dword_0,  (os_log_t)v7,  (os_log_type_t)v80,  "Calculated Levenshtein Edit Distance between %@ and %@: %f",  (uint8_t *)v55,  0x20u);
    uint64_t v58 = sub_501C(&qword_4A8A8);
    swift_arrayDestroy(v75, 2LL, v58);
    swift_slowDealloc(v75, -1LL, -1LL);
    swift_slowDealloc(v55, -1LL, -1LL);
    swift_bridgeObjectRelease(v71);
    goto LABEL_77;
  }

LABEL_76:
  swift_bridgeObjectRelease(v71);
  unint64_t v7 = v4;
LABEL_77:
}

      swift_once(&qword_4A778, sub_349B4);
      goto LABEL_26;
    }

    unint64_t v7 = (char *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v80,  v5,  (char *)&type metadata for Any + 8,  v16);
    v82 = v81;

    if (*((void *)v7 + 2))
    {
      uint64_t v5 = v104;
      v83 = sub_2DFB0((uint64_t)v5);
      if ((v84 & 1) != 0)
      {
        sub_155EC(*((void *)v7 + 7) + 32 * v83, (uint64_t)&v109);
      }

      else
      {
        v109 = 0u;
        v110 = 0u;
      }
    }

    else
    {
      v109 = 0u;
      v110 = 0u;
    }

    swift_bridgeObjectRelease(v7);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if (!*((void *)&v110 + 1))
    {
      sub_BA5C((uint64_t)&v109, (uint64_t *)&unk_4AC00);
LABEL_57:
      v85 = 0LL;
      goto LABEL_58;
    }

    v85 = v105;
LABEL_58:
    v86 = __OFADD__(v103, v85);
    v87 = &v85[(void)v103];
    if (v86) {
      __break(1u);
    }
    result = &v74[(void)v87];
    if (!__OFADD__(v87, v74)) {
      return result;
    }
    __break(1u);
LABEL_62:
    if (v16 < 0) {
      v89 = v16;
    }
    else {
      v89 = v16 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v16);
    v90 = _CocoaArrayWrapper.endIndex.getter(v89);
    swift_bridgeObjectRelease(v16);
    if (!v90) {
      goto LABEL_66;
    }
  }

  sub_BA5C((uint64_t)&v109, (uint64_t *)&unk_4AC00);
LABEL_31:
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  unint64_t v63 = type metadata accessor for Logger(0LL);
  unint64_t v64 = sub_4F30(v63, (uint64_t)qword_4FC70);
  uint64_t v65 = (os_log_s *)Logger.logObject.getter(v64);
  v72 = static os_log_type_t.error.getter(v65, v66, v67, v68, v69, v70, v71);
  if (os_log_type_enabled(v65, v72))
  {
    unint64_t v73 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unint64_t v73 = 0;
    _os_log_impl(&dword_0, v65, v72, "NSManagedObjectContext: Failed to get store size", v73, 2u);
    swift_slowDealloc(v73, -1LL, -1LL);
  }

LABEL_36:
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return 0LL;
}

uint64_t sub_49D8()
{
  return swift_deallocClassInstance(v0, 56LL, 7LL);
}

uint64_t type metadata accessor for P2PRunner()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin9P2PRunner);
}

char *sub_4A1C(unint64_t a1, double a2)
{
  if ((a1 & 0x8000000000000000LL) != 0)
  {
    result = (char *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
    return result;
  }

  if (!a1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  result = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(a1, &type metadata for Double);
  *((void *)result + 2) = a1;
  unint64_t v4 = (double *)(result + 32);
  if (a1 < 4)
  {
    unint64_t v5 = 0LL;
    double v6 = a2;
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }

    while (v10);
    return result;
  }

  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  double v6 = a2;
  int64x2_t v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  uint64_t v8 = (int64x2_t *)(result + 48);
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *uint64_t v8 = v7;
    v8 += 2;
    v9 -= 4LL;
  }

  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

void *sub_4B0C(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
  {
    result = (void *)_assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Can't construct Array with count < 0",  36LL,  2LL,  "Swift/Array.swift",  17LL,  2,  936LL,  0);
    __break(1u);
  }

  else
  {
    if (a2)
    {
      uint64_t v4 = sub_501C(&qword_4A8B8);
      unint64_t v5 = (void *)static Array._allocateBufferUninitialized(minimumCapacity:)(a2, v4);
      double v6 = v5;
      v5[2] = a2;
      v5[4] = a1;
      if (a2 != 1)
      {
        v5[5] = a1;
        uint64_t v7 = a2 - 2;
        if (v7)
        {
          uint64_t v8 = v5 + 6;
          do
          {
            *v8++ = a1;
            swift_bridgeObjectRetain(a1);
            --v7;
          }

          while (v7);
        }

        swift_bridgeObjectRetain(a1);
      }
    }

    else
    {
      swift_bridgeObjectRelease(a1);
      return _swiftEmptyArrayStorage;
    }

    return v6;
  }

  return result;
}

uint64_t sub_4BFC(uint64_t a1, uint64_t a2)
{
  return sub_4CC4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_4C08(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_4C48(uint64_t a1)
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  uint64_t v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  Swift::Int v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_4CB8(uint64_t a1, uint64_t a2)
{
  return sub_4CC4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_4CC4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  uint64_t v7 = v6;
  uint64_t v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_4D00(uint64_t a1, id *a2)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  uint64_t v5 = v8;
  if (v8)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    uint64_t result = swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return result;
}

uint64_t sub_4D74(uint64_t a1, id *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  char v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  uint64_t v5 = v9;
  if (v9)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    NSString v6 = 0LL;
  }

  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_4DF0@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = v3;
  NSString v5 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5;
  return result;
}

void sub_4E30(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_4E3C(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    char v10 = 1;
    uint64_t v9 = v5;
  }

  else
  {
    uint64_t v9 = v7;
    char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0LL);
  }

  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_4EC4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 8);
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_4F08@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_4F30(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_4F48()
{
  unint64_t result = qword_4A8A0;
  if (!qword_4A8A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A034, &type metadata for P2PRunningError);
    atomic_store(result, (unint64_t *)&qword_4A8A0);
  }

  return result;
}

uint64_t sub_4F8C(uint64_t a1)
{
  uint64_t v2 = sub_54FC((unint64_t *)&qword_4A8E0, (uint64_t)&unk_38218);
  uint64_t v3 = sub_54FC(&qword_4A8E8, (uint64_t)&unk_3816C);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void *sub_4FF8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t sub_501C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *sub_505C(void *a1)
{
  return sub_13B88(0LL, a1[2], 0, a1);
}

void *sub_5070(void *a1)
{
  return sub_13C94(0LL, a1[2], 0, a1);
}

void sub_5084(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v41 = a5;
  uint64_t v5 = a3;
  uint64_t v31 = a3 + 64;
  uint64_t v8 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v9 = -1LL;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v32 = (unint64_t)(v8 + 63) >> 6;
  swift_bridgeObjectRetain(a3);
  int64_t v11 = 0LL;
  uint64_t v28 = v5;
LABEL_5:
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  if (v10) {
    goto LABEL_8;
  }
LABEL_9:
  if (!__OFADD__(v11++, 1LL))
  {
    if (v11 >= v32) {
      goto LABEL_35;
    }
    unint64_t v16 = *(void *)(v31 + 8 * v11);
    if (v16)
    {
LABEL_19:
      uint64_t v34 = (v16 - 1) & v16;
      for (unint64_t i = __clz(__rbit64(v16)) + (v11 << 6); ; unint64_t i = __clz(__rbit64(v10)) | (v11 << 6))
      {
        unint64_t v18 = (uint64_t *)(*(void *)(v5 + 48) + 16 * i);
        uint64_t v19 = *v18;
        uint64_t v20 = v18[1];
        uint64_t v21 = *(void *)(*(void *)(v5 + 56) + 8 * i);
        uint64_t v39 = a1;
        uint64_t v40 = a2;
        uint64_t v37 = v19;
        uint64_t v38 = v20;
        unint64_t v22 = sub_53D8();
        swift_bridgeObjectRetain(v20);
        swift_bridgeObjectRetain(v21);
        if ((StringProtocol.contains<A>(_:)(&v37, &type metadata for String, &type metadata for String, v22, v22) & 1) != 0)
        {
          int64_t v33 = v11;
          uint64_t v23 = *(void *)(v21 + 16);
          if (v23)
          {
            swift_bridgeObjectRetain(v21);
            v24 = (uint64_t *)(v21 + 40);
            do
            {
              uint64_t v26 = *(v24 - 1);
              uint64_t v25 = *v24;
              uint64_t v39 = a4;
              uint64_t v40 = v41;
              uint64_t v37 = v26;
              uint64_t v38 = v25;
              swift_bridgeObjectRetain(v25);
              if ((StringProtocol.contains<A>(_:)(&v37, &type metadata for String, &type metadata for String, v22, v22) & 1) != 0)
              {
                swift_bridgeObjectRelease(v21);
                uint64_t v39 = v29;
                uint64_t v40 = v30;
                uint64_t v37 = v19;
                uint64_t v38 = v20;
                v36[0] = v26;
                v36[1] = v25;
                a1 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v37,  v36,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v22,  v22,  v22);
                uint64_t v13 = v12;
                swift_bridgeObjectRelease(v21);
                swift_bridgeObjectRelease(v20);
                swift_bridgeObjectRelease(v25);
                swift_bridgeObjectRelease(v30);
                a2 = v13;
                uint64_t v5 = v28;
                int64_t v11 = v33;
                unint64_t v10 = v34;
                goto LABEL_5;
              }

              v24 += 2;
              swift_bridgeObjectRelease(v25);
              --v23;
            }

            while (v23);
            swift_bridgeObjectRelease(v20);
            swift_bridgeObjectRelease_n(v21, 2LL);
            a1 = v29;
            a2 = v30;
            uint64_t v5 = v28;
          }

          else
          {
            swift_bridgeObjectRelease(v21);
            swift_bridgeObjectRelease(v20);
          }

          int64_t v11 = v33;
          unint64_t v10 = v34;
          if (!v34) {
            goto LABEL_9;
          }
        }

        else
        {
          swift_bridgeObjectRelease(v21);
          swift_bridgeObjectRelease(v20);
          unint64_t v10 = v34;
          if (!v34) {
            goto LABEL_9;
          }
        }

LABEL_8:
        uint64_t v34 = (v10 - 1) & v10;
      }
    }

    int64_t v17 = v11 + 1;
    if (v11 + 1 >= v32) {
      goto LABEL_35;
    }
    unint64_t v16 = *(void *)(v31 + 8 * v17);
    if (!v16)
    {
      int64_t v17 = v11 + 2;
      if (v11 + 2 >= v32) {
        goto LABEL_35;
      }
      unint64_t v16 = *(void *)(v31 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v11 + 3;
        if (v11 + 3 < v32)
        {
          unint64_t v16 = *(void *)(v31 + 8 * v17);
          if (v16) {
            goto LABEL_18;
          }
          int64_t v27 = v11 + 4;
          if (v11 + 4 < v32)
          {
            unint64_t v16 = *(void *)(v31 + 8 * v27);
            v11 += 4LL;
            if (v16) {
              goto LABEL_19;
            }
            while (1)
            {
              int64_t v11 = v27 + 1;
              if (__OFADD__(v27, 1LL)) {
                goto LABEL_37;
              }
              if (v11 >= v32) {
                break;
              }
              unint64_t v16 = *(void *)(v31 + 8 * v11);
              ++v27;
              if (v16) {
                goto LABEL_19;
              }
            }
          }
        }

  if ((result & 1) == 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) == 0)
  {
    if (!a1)
    {
      __break(1u);
      goto LABEL_12;
    }

    goto LABEL_22;
  }

  if (a1 >> 11 != 27)
  {
    if (a1 >> 16 <= 0x10)
    {
      a1 = &v23;
LABEL_22:
      unint64_t v16 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16);
      v16(v11, a4, v7);
      int64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)int64_t v17 = 0;
      unint64_t v18 = OSSignpostID.rawValue.getter();
      uint64_t v19 = v14;
      uint64_t v20 = "enableTelemetry=YES";
      goto LABEL_23;
    }

    goto LABEL_28;
  }

  if ((v13 & 1) == 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) == 0)
  {
    if (!a1)
    {
      __break(1u);
      goto LABEL_12;
    }

    goto LABEL_22;
  }

  if (a1 >> 11 != 27)
  {
    if (a1 >> 16 <= 0x10)
    {
      a1 = &v21;
LABEL_22:
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
      unint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)unint64_t v14 = 0;
      uint64_t v15 = OSSignpostID.rawValue.getter();
      unint64_t v16 = v12;
      int64_t v17 = "enableTelemetry=YES";
      goto LABEL_23;
    }

    goto LABEL_27;
  }

LABEL_35:
        swift_release(v5);
        return;
      }
    }

LABEL_18:
    int64_t v11 = v17;
    goto LABEL_19;
  }

  __break(1u);
LABEL_37:
  __break(1u);
}

  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v59 = type metadata accessor for Logger(0LL);
  sub_4F30(v59, (uint64_t)qword_4FC70);
  Swift::String v60 = v125;
  v61 = v126;
  (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v10, v124, v126);
  unint64_t v62 = (*(uint64_t (**)(char *, char *, uint64_t))(v21 + 16))(v24, v30, v20);
  unint64_t v63 = (void *)Logger.logObject.getter(v62);
  unint64_t v64 = static os_log_type_t.debug.getter();
  uint64_t v65 = v64;
  if (!os_log_type_enabled((os_log_t)v63, v64))
  {

    unint64_t v78 = *(void (**)(char *, uint64_t))(v21 + 8);
    v78(v24, v20);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v10, v61);
LABEL_23:
    v78(v30, v20);
    return 0LL;
  }

  uint64_t v66 = swift_slowAlloc(22LL, -1LL);
  v124 = swift_slowAlloc(64LL, -1LL);
  v128 = v124;
  *(_DWORD *)uint64_t v66 = 136315394;
  v122 = (os_log_s *)v20;
  v67 = sub_B948();
  v123 = v65;
  v68 = dispatch thunk of CustomStringConvertible.description.getter(v61, v67);
  unint64_t v70 = v69;
  v127 = sub_25824(v68, v69, &v128);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128);
  swift_bridgeObjectRelease(v70);
  v71 = (*(uint64_t (**)(char *, uint64_t))(v60 + 8))(v10, v61);
  *(_WORD *)(v66 + 12) = 2080;
  v72 = CoreDuetEvent.eventId.getter(v71);
  v74 = v73;
  v127 = sub_25824(v72, v73, &v128);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128);
  swift_bridgeObjectRelease(v74);
  v75 = *(void (**)(char *, os_log_s *))(v21 + 8);
  uint64_t v76 = v122;
  v75(v24, v122);
  _os_log_impl( &dword_0,  (os_log_t)v63,  (os_log_type_t)v123,  "[%s]: Failed to get call contact ID for core duet event: %s",  (uint8_t *)v66,  0x16u);
  v77 = v124;
  swift_arrayDestroy(v124, 2LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v77, -1LL, -1LL);
  swift_slowDealloc(v66, -1LL, -1LL);

  v75(v118, v76);
  return 0LL;
}

unint64_t sub_53D8()
{
  unint64_t result = qword_4A8B0;
  if (!qword_4A8B0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_4A8B0);
  }

  return result;
}

uint64_t sub_541C(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for FileAttributeKey()
{
  if (!qword_4A8C0)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata(0LL, &unk_45528);
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_4A8C0);
    }
  }

uint64_t sub_5490()
{
  return sub_54FC(&qword_4A8C8, (uint64_t)&unk_38130);
}

uint64_t sub_54B4()
{
  return sub_54FC(&qword_4A8D0, (uint64_t)&unk_38104);
}

uint64_t sub_54D8()
{
  return sub_54FC(&qword_4A8D8, (uint64_t)&unk_381A0);
}

uint64_t sub_54FC(unint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for FileAttributeKey();
    uint64_t result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_5540()
{
  uint64_t v1 = v0;
  v48[0] = 0LL;
  v48[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(295LL);
  v2._countAndFlagsBits = 0xD00000000000001DLL;
  v2._object = (void *)0x800000000003AE60LL;
  String.append(_:)(v2);
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v4 = sub_9DF8( (unint64_t *)&qword_4ABD0,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  v5._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v3, v4);
  object = v5._object;
  String.append(_:)(v5);
  swift_bridgeObjectRelease(object);
  v7._object = (void *)0x800000000003AE80LL;
  v7._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v7);
  uint64_t v8 = (int *)type metadata accessor for TMDCGroundTruth(0LL);
  uint64_t v9 = (uint64_t *)(v0 + v8[6]);
  uint64_t v10 = *v9;
  int64_t v11 = (void *)v9[1];
  swift_bridgeObjectRetain(v11);
  v12._countAndFlagsBits = v10;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v11);
  v13._countAndFlagsBits = 0xD000000000000012LL;
  v13._object = (void *)0x800000000003AEA0LL;
  String.append(_:)(v13);
  id v47 = *(id *)(v0 + v8[7]);
  v14._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int64,  &protocol witness table for Int64);
  uint64_t v15 = v14._object;
  String.append(_:)(v14);
  swift_bridgeObjectRelease(v15);
  v16._countAndFlagsBits = 0xD000000000000015LL;
  v16._object = (void *)0x800000000003AEC0LL;
  String.append(_:)(v16);
  int64_t v17 = (uint64_t *)(v0 + v8[8]);
  uint64_t v18 = *v17;
  uint64_t v19 = (void *)v17[1];
  swift_bridgeObjectRetain(v19);
  v20._countAndFlagsBits = v18;
  v20._object = v19;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v19);
  v21._countAndFlagsBits = 0xD00000000000001ELL;
  v21._object = (void *)0x800000000003AEE0LL;
  String.append(_:)(v21);
  id v22 = *(id *)(v0 + v8[9]);
  id v23 = [v22 description];
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  uint64_t v26 = v25;

  v27._countAndFlagsBits = v24;
  v27._object = v26;
  String.append(_:)(v27);

  swift_bridgeObjectRelease(v26);
  v28._countAndFlagsBits = 0xD000000000000020LL;
  v28._object = (void *)0x800000000003AF00LL;
  String.append(_:)(v28);
  id v47 = *(id *)(v1 + v8[10]);
  id v29 = v47;
  uint64_t v30 = sub_501C(&qword_4ABD8);
  v31._countAndFlagsBits = String.init<A>(describing:)(&v47, v30);
  int64_t v32 = v31._object;
  String.append(_:)(v31);
  swift_bridgeObjectRelease(v32);
  v33._object = (void *)0x800000000003AF30LL;
  v33._countAndFlagsBits = 0xD000000000000010LL;
  String.append(_:)(v33);
  Double.write<A>(to:)( v48,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation,  *(double *)(v1 + v8[11]));
  v34._countAndFlagsBits = 0x6F7320676F4C0A2CLL;
  v34._object = (void *)0xEE00203A65637275LL;
  String.append(_:)(v34);
  LOBYTE(v47) = *(_BYTE *)(v1 + v8[5]);
  _print_unlocked<A, B>(_:_:)( &v47,  v48,  &type metadata for LogSource,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v35._countAndFlagsBits = 0xD000000000000021LL;
  v35._object = (void *)0x800000000003AF50LL;
  String.append(_:)(v35);
  char v36 = (uint64_t *)(v1 + v8[13]);
  uint64_t v37 = v36[1];
  if (v37)
  {
    uint64_t v38 = *v36;
    uint64_t v39 = (void *)v36[1];
  }

  else
  {
    uint64_t v38 = 0xD000000000000014LL;
    uint64_t v39 = (void *)0x800000000003AF80LL;
  }

  swift_bridgeObjectRetain(v37);
  v40._countAndFlagsBits = v38;
  v40._object = v39;
  String.append(_:)(v40);
  swift_bridgeObjectRelease(v39);
  v41._countAndFlagsBits = 0xD00000000000002DLL;
  v41._object = (void *)0x800000000003AFA0LL;
  String.append(_:)(v41);
  if (*(_BYTE *)(v1 + v8[12])) {
    unint64_t v42 = 0x6F6E6F727073696DLL;
  }
  else {
    unint64_t v42 = 0xD000000000000013LL;
  }
  if (*(_BYTE *)(v1 + v8[12])) {
    unint64_t v43 = 0xED00006465636E75LL;
  }
  else {
    unint64_t v43 = 0x800000000003AFD0LL;
  }
  unint64_t v44 = v43;
  String.append(_:)(*(Swift::String *)&v42);
  swift_bridgeObjectRelease(v43);
  v45._countAndFlagsBits = 0xD000000000000015LL;
  v45._object = (void *)0x800000000003AFF0LL;
  String.append(_:)(v45);
  return v48[0];
}

uint64_t sub_5968(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_59A4 + 4 * byte_38260[a1]))( 0xD000000000000018LL,  0x800000000003B0F0LL);
}

uint64_t sub_59A4()
{
  return 0x696669746E656469LL;
}

uint64_t sub_59C0()
{
  return 0x6372756F53676F6CLL;
}

uint64_t sub_59DC()
{
  return 0x4E746361746E6F63LL;
}

uint64_t sub_5A00()
{
  return 0x69666E6F43727361LL;
}

uint64_t sub_5A24()
{
  return 0x656E6F6850727361LL;
}

uint64_t sub_5A44()
{
  return v0 + 10;
}

BOOL sub_5AA8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_5AC0()
{
}

uint64_t sub_5AEC()
{
  return sub_5968(*v0);
}

uint64_t sub_5AF4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_7E0C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_5B18()
{
  return 0LL;
}

void sub_5B24(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_5B30(uint64_t a1)
{
  unint64_t v2 = sub_9CAC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_5B58(uint64_t a1)
{
  unint64_t v2 = sub_9CAC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_5B80(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_501C(&qword_4AD88);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_9CAC();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for TMDCGroundTruth.CodingKeys,  &type metadata for TMDCGroundTruth.CodingKeys,  v11,  v9,  v10);
  LOBYTE(v34) = 0;
  uint64_t v12 = type metadata accessor for UUID(0LL);
  uint64_t v13 = sub_9DF8( &qword_4AD90,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
  KeyedEncodingContainer.encode<A>(_:forKey:)(v3, &v34, v5, v12, v13);
  if (!v2)
  {
    Swift::String v14 = (int *)type metadata accessor for TMDCGroundTruth(0LL);
    LOBYTE(v34) = *(_BYTE *)(v3 + v14[5]);
    char v35 = 1;
    unint64_t v15 = sub_9DB4();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v34, &v35, v5, &type metadata for LogSource, v15);
    Swift::String v16 = (uint64_t *)(v3 + v14[6]);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    LOBYTE(v34) = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v17, v18, &v34, v5);
    uint64_t v19 = *(void *)(v3 + v14[7]);
    LOBYTE(v34) = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v19, &v34, v5);
    Swift::String v20 = (uint64_t *)(v3 + v14[8]);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    LOBYTE(v34) = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v21, v22, &v34, v5);
    uint64_t v34 = *(void *)(v3 + v14[9]);
    char v35 = 5;
    uint64_t v23 = type metadata accessor for ContactPronunciation();
    uint64_t v24 = sub_9DF8( &qword_4ADA0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for ContactPronunciation,  (uint64_t)&unk_3A45C);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v34, &v35, v5, v23, v24);
    uint64_t v34 = *(void *)(v3 + v14[10]);
    char v35 = 6;
    uint64_t v25 = type metadata accessor for CorrectedPronunciation();
    uint64_t v27 = sub_9DF8( &qword_4ADA8,  v26,  (uint64_t (*)(uint64_t))type metadata accessor for CorrectedPronunciation,  (uint64_t)&unk_38324);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(&v34, &v35, v5, v25, v27);
    double v28 = *(double *)(v3 + v14[11]);
    LOBYTE(v34) = 7;
    KeyedEncodingContainer.encode(_:forKey:)(&v34, v5, v28);
    uint64_t v29 = *(unsigned __int8 *)(v3 + v14[12]);
    LOBYTE(v34) = 8;
    KeyedEncodingContainer.encode(_:forKey:)(v29, &v34, v5);
    uint64_t v30 = (uint64_t *)(v3 + v14[13]);
    uint64_t v31 = *v30;
    uint64_t v32 = v30[1];
    LOBYTE(v34) = 9;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v31, v32, &v34, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_5ECC(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v49 = a2;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v55 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v50 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v51 = sub_501C(&qword_4AD58);
  uint64_t v6 = *(void *)(v51 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for TMDCGroundTruth(0LL);
  uint64_t v10 = __chkstk_darwin();
  uint64_t v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  UUID.init()(v10);
  uint64_t v13 = type metadata accessor for DebugModeFlagUserDefaultsStore(0LL);
  swift_allocObject(v13, *(unsigned int *)(v13 + 48), *(unsigned __int16 *)(v13 + 52));
  uint64_t v14 = DebugModeFlagUserDefaultsStore.init()();
  char v15 = dispatch thunk of DebugModeFlagUserDefaultsStore.debugModeEnabled.getter();
  swift_release(v14);
  os_log_type_t v53 = (int *)v9;
  int v54 = v12;
  uint64_t v16 = *(int *)(v9 + 20);
  v12[v16] = (v15 & 1) == 0;
  uint64_t v17 = a1[3];
  uint64_t v18 = a1[4];
  id v52 = a1;
  uint64_t v19 = a1;
  Swift::String v20 = v8;
  sub_4FF8(v19, v17);
  unint64_t v21 = sub_9CAC();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for TMDCGroundTruth.CodingKeys,  &type metadata for TMDCGroundTruth.CodingKeys,  v21,  v17,  v18);
  if (v2)
  {
    uint64_t v25 = v54;
    sub_541C(v52);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v25, v4);
  }

  else
  {
    uint64_t v48 = v6;
    LOBYTE(v56) = 0;
    uint64_t v22 = sub_9DF8( &qword_4AD68,  255LL,  (uint64_t (*)(uint64_t))&type metadata accessor for UUID,  (uint64_t)&protocol conformance descriptor for UUID);
    uint64_t v24 = v50;
    uint64_t v23 = v51;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v4, &v56, v51, v4, v22);
    uint64_t v26 = v54;
    (*(void (**)(char *, char *, uint64_t))(v55 + 40))(v54, v24, v4);
    char v57 = 1;
    unint64_t v27 = sub_9CF0();
    KeyedDecodingContainer.decode<A>(_:forKey:)( &type metadata for LogSource,  &v57,  v23,  &type metadata for LogSource,  v27);
    v26[v16] = v56;
    LOBYTE(v56) = 2;
    double v28 = v20;
    uint64_t v29 = KeyedDecodingContainer.decode(_:forKey:)(&v56, v23);
    uint64_t v30 = v53;
    uint64_t v31 = (uint64_t *)&v26[v53[6]];
    *uint64_t v31 = v29;
    v31[1] = v32;
    LOBYTE(v56) = 3;
    *(void *)&v26[v30[7]] = KeyedDecodingContainer.decode(_:forKey:)(&v56, v23);
    LOBYTE(v56) = 4;
    uint64_t v33 = KeyedDecodingContainer.decode(_:forKey:)(&v56, v23);
    uint64_t v34 = (uint64_t *)&v26[v30[8]];
    *uint64_t v34 = v33;
    v34[1] = v35;
    uint64_t v36 = type metadata accessor for ContactPronunciation();
    char v57 = 5;
    uint64_t v37 = sub_9DF8( &qword_4AD78,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for ContactPronunciation,  (uint64_t)&unk_3A484);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v36, &v57, v23, v36, v37);
    *(void *)&v26[v30[9]] = v56;
    uint64_t v38 = type metadata accessor for CorrectedPronunciation();
    char v57 = 6;
    uint64_t v40 = sub_9DF8( &qword_4AD80,  v39,  (uint64_t (*)(uint64_t))type metadata accessor for CorrectedPronunciation,  (uint64_t)&unk_3834C);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v56, v38, &v57, v23, v38, v40);
    *(void *)&v26[v30[10]] = v56;
    LOBYTE(v56) = 7;
    KeyedDecodingContainer.decode(_:forKey:)(&v56, v23);
    *(void *)&v26[v30[11]] = v41;
    LOBYTE(v56) = 8;
    v26[v30[12]] = KeyedDecodingContainer.decode(_:forKey:)(&v56, v23) & 1;
    LOBYTE(v56) = 9;
    uint64_t v42 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v56, v23);
    uint64_t v44 = v43;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v28, v51);
    uint64_t v45 = (uint64_t)v54;
    char v46 = (uint64_t *)&v54[v53[13]];
    *char v46 = v42;
    v46[1] = v44;
    sub_9D34(v45, v49);
    sub_541C(v52);
    sub_9D78(v45);
  }

void sub_6500(void *a1@<X0>, uint64_t a2@<X8>)
{
}

uint64_t sub_6514(void *a1)
{
  return sub_5B80(a1);
}

void sub_6540()
{
  qword_4AA78 = 0x656C61636F6CLL;
  unk_4AA80 = 0xE600000000000000LL;
}

uint64_t sub_65B4()
{
  uint64_t v21 = 0LL;
  unint64_t v22 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(96LL);
  v1._countAndFlagsBits = 0x656C61636F6C207BLL;
  v1._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v1);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___CorrectedPronunciation_locale);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___CorrectedPronunciation_locale + 8);
  swift_bridgeObjectRetain(v3);
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(v3);
  v5._countAndFlagsBits = 0xD00000000000001ALL;
  v5._object = (void *)0x800000000003B060LL;
  String.append(_:)(v5);
  id v20 = *(id *)(v0 + OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString);
  id v6 = v20;
  uint64_t v7 = sub_501C(&qword_4AC10);
  v8._countAndFlagsBits = String.init<A>(describing:)(&v20, v7);
  object = v8._object;
  String.append(_:)(v8);
  swift_bridgeObjectRelease(object);
  v10._object = (void *)0x800000000003B080LL;
  v10._countAndFlagsBits = 0xD000000000000019LL;
  String.append(_:)(v10);
  id v20 = *(id *)(v0 + OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString);
  id v11 = v20;
  v12._countAndFlagsBits = String.init<A>(describing:)(&v20, v7);
  uint64_t v13 = v12._object;
  String.append(_:)(v12);
  swift_bridgeObjectRelease(v13);
  v14._object = (void *)0x800000000003B0A0LL;
  v14._countAndFlagsBits = 0xD000000000000019LL;
  String.append(_:)(v14);
  id v20 = *(id *)(v0 + OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString);
  id v15 = v20;
  v16._countAndFlagsBits = String.init<A>(describing:)(&v20, v7);
  uint64_t v17 = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v17);
  v18._countAndFlagsBits = 32032LL;
  v18._object = (void *)0xE200000000000000LL;
  String.append(_:)(v18);
  return v21;
}

id sub_6770(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_9C74(0LL, (unint64_t *)&unk_4B4D0, &OBJC_CLASS___NSString_ptr);
  uint64_t v5 = qword_4A6F0;
  id v6 = v2;
  if (v5 != -1) {
    swift_once(&qword_4A6F0, sub_6540);
  }
  uint64_t v7 = NSCoder.decodeObject<A>(of:forKey:)(v4, qword_4AA78, unk_4AA80, v4);
  if (v7)
  {
    Swift::String v8 = (void *)v7;
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
    uint64_t v11 = v10;

    Swift::String v12 = (uint64_t *)&v6[OBJC_IVAR___CorrectedPronunciation_locale];
    *Swift::String v12 = v9;
    v12[1] = v11;
    uint64_t v13 = type metadata accessor for PhonemeString();
    *(void *)&v6[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString] = NSCoder.decodeObject<A>(of:forKey:)( v13,  0xD00000000000001BLL,  0x800000000003AD40LL,  v13);
    *(void *)&v6[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString] = NSCoder.decodeObject<A>(of:forKey:)( v13,  0xD00000000000001ALL,  0x800000000003AD60LL,  v13);
    *(void *)&v6[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString] = NSCoder.decodeObject<A>(of:forKey:)( v13,  0xD00000000000001ALL,  0x800000000003AD80LL,  v13);

    v17.receiver = v6;
    v17.super_class = (Class)type metadata accessor for CorrectedPronunciation();
    id v14 = objc_msgSendSuper2(&v17, "init");
  }

  else
  {

    uint64_t v15 = type metadata accessor for CorrectedPronunciation();
    swift_deallocPartialClassInstance(v6, v15, 48LL, 7LL);
    return 0LL;
  }

  return v14;
}

void sub_6944(void *a1)
{
  NSString v3 = String._bridgeToObjectiveC()();
  if (qword_4A6F0 != -1) {
    swift_once(&qword_4A6F0, sub_6540);
  }
  NSString v4 = String._bridgeToObjectiveC()();
  [a1 encodeObject:v3 forKey:v4];

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString);
  NSString v6 = String._bridgeToObjectiveC()();
  [a1 encodeObject:v5 forKey:v6];

  uint64_t v7 = *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString);
  NSString v8 = String._bridgeToObjectiveC()();
  [a1 encodeObject:v7 forKey:v8];

  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString);
  id v10 = String._bridgeToObjectiveC()();
  [a1 encodeObject:v9 forKey:v10];
}

uint64_t sub_6B10(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_915C(a1, (uint64_t)v29);
  if (!v30)
  {
    sub_911C((uint64_t)v29);
    goto LABEL_23;
  }

  uint64_t v3 = type metadata accessor for CorrectedPronunciation();
  if ((swift_dynamicCast(&v28, v29, (char *)&type metadata for Any + 8, v3, 6LL) & 1) == 0)
  {
LABEL_23:
    char v25 = 0;
    return v25 & 1;
  }

  NSString v4 = v28;
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_locale);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR___CorrectedPronunciation_locale + 8);
  uint64_t v7 = *(void *)&v28[OBJC_IVAR___CorrectedPronunciation_locale];
  uint64_t v8 = *(void *)&v28[OBJC_IVAR___CorrectedPronunciation_locale + 8];
  BOOL v9 = v5 == v7 && v6 == v8;
  if (!v9 && (_stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v7, v8, 0LL) & 1) == 0) {
    goto LABEL_22;
  }
  id v10 = *(void **)(v1 + OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString);
  uint64_t v11 = *(void **)&v4[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString];
  if (v10)
  {
    if (!v11) {
      goto LABEL_22;
    }
    type metadata accessor for PhonemeString();
    id v12 = v11;
    id v13 = v10;
    char v14 = static NSObject.== infix(_:_:)();

    if ((v14 & 1) == 0) {
      goto LABEL_22;
    }
  }

  else if (v11)
  {
    goto LABEL_22;
  }

  uint64_t v15 = *(void **)(v2 + OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString);
  Swift::String v16 = *(void **)&v4[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString];
  if (!v15)
  {
    if (!v16) {
      goto LABEL_19;
    }
LABEL_22:

    goto LABEL_23;
  }

  if (!v16) {
    goto LABEL_22;
  }
  type metadata accessor for PhonemeString();
  id v17 = v16;
  id v18 = v15;
  char v19 = static NSObject.== infix(_:_:)();

  if ((v19 & 1) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  id v20 = *(void **)(v2 + OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString);
  uint64_t v21 = *(void **)&v4[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString];
  if (!v20)
  {
    id v27 = v21;

    if (!v21)
    {
      char v25 = 1;
      return v25 & 1;
    }

    goto LABEL_23;
  }

  if (!v21) {
    goto LABEL_22;
  }
  type metadata accessor for PhonemeString();
  id v22 = v20;
  id v23 = v21;
  id v24 = v22;
  char v25 = static NSObject.== infix(_:_:)();

  return v25 & 1;
}

uint64_t sub_6D8C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_6DC8 + 4 * byte_3826A[a1]))( 0xD00000000000001BLL,  0x800000000003AD40LL);
}

uint64_t sub_6DC8()
{
  return 0x656C61636F6CLL;
}

unint64_t sub_6DDC()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_6E04()
{
  return sub_6D8C(*v0);
}

uint64_t sub_6E0C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_8208(a1, a2);
  *a3 = result;
  return result;
}

void sub_6E30(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_6E3C(uint64_t a1)
{
  unint64_t v2 = sub_90D8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_6E64(uint64_t a1)
{
  unint64_t v2 = sub_90D8();
  return CodingKey.debugDescription.getter(a1, v2);
}

id sub_6E8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CorrectedPronunciation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CorrectedPronunciation()
{
  return objc_opt_self(&OBJC_CLASS___CorrectedPronunciation);
}

uint64_t sub_6F38(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_501C(&qword_4ABF0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_90D8();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for CorrectedPronunciation.CodingKeys,  &type metadata for CorrectedPronunciation.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *(void *)(v3 + OBJC_IVAR___CorrectedPronunciation_locale);
  uint64_t v13 = *(void *)(v3 + OBJC_IVAR___CorrectedPronunciation_locale + 8);
  LOBYTE(v18) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v18, v5);
  if (!v2)
  {
    uint64_t v18 = *(void *)(v3 + OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString);
    HIBYTE(v17) = 1;
    uint64_t v14 = type metadata accessor for PhonemeString();
    uint64_t v15 = sub_9DF8( &qword_4ABF8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for PhonemeString,  (uint64_t)&unk_396BC);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(&v18, (char *)&v17 + 7, v5, v14, v15);
    uint64_t v18 = *(void *)(v3 + OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString);
    HIBYTE(v17) = 2;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(&v18, (char *)&v17 + 7, v5, v14, v15);
    uint64_t v18 = *(void *)(v3 + OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString);
    HIBYTE(v17) = 3;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(&v18, (char *)&v17 + 7, v5, v14, v15);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_7120(void *a1)
{
  uint64_t v23 = sub_501C(&qword_4ABB8);
  uint64_t v4 = *(void *)(v23 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  id v24 = a1;
  sub_4FF8(a1, v7);
  unint64_t v9 = sub_90D8();
  uint64_t v10 = v1;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for CorrectedPronunciation.CodingKeys,  &type metadata for CorrectedPronunciation.CodingKeys,  v9,  v7,  v8);
  if (v2)
  {
    sub_541C(v24);
    id v21 = v10;

    uint64_t v14 = type metadata accessor for CorrectedPronunciation();
    swift_deallocPartialClassInstance(v10, v14, 48LL, 7LL);
  }

  else
  {
    uint64_t v11 = v4;
    LOBYTE(v27) = 0;
    uint64_t v12 = v23;
    uint64_t v13 = KeyedDecodingContainer.decode(_:forKey:)(&v27, v23);
    Swift::String v16 = (uint64_t *)&v10[OBJC_IVAR___CorrectedPronunciation_locale];
    *Swift::String v16 = v13;
    v16[1] = v17;
    uint64_t v18 = type metadata accessor for PhonemeString();
    char v26 = 1;
    uint64_t v19 = sub_9DF8( &qword_4ABC8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for PhonemeString,  (uint64_t)&unk_396E4);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v27, v18, &v26, v12, v18, v19);
    *(void *)&v10[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString] = v27;
    char v26 = 2;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v27, v18, &v26, v23, v18, v19);
    *(void *)&v10[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString] = v27;
    char v26 = 3;
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(&v27, v18, &v26, v23, v18, v19);
    *(void *)&v10[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString] = v27;

    id v20 = (objc_class *)type metadata accessor for CorrectedPronunciation();
    v25.receiver = v10;
    v25.super_class = v20;
    id v21 = objc_msgSendSuper2(&v25, "init");
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v23);
    sub_541C(v24);
  }

  return v21;
}

id sub_7438@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for CorrectedPronunciation());
  id result = sub_7120(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_7488(void *a1)
{
  return sub_6F38(a1);
}

id sub_7554(uint64_t a1, uint64_t a2)
{
  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for CorrectedPronunciationValueTransformer()
{
  return objc_opt_self(&OBJC_CLASS___CorrectedPronunciationValueTransformer);
}

uint64_t sub_75AC(char a1)
{
  return *(void *)&aInternalclient[8 * a1];
}

uint64_t sub_75CC(void *a1, int a2)
{
  int v30 = a2;
  uint64_t v3 = sub_501C(&qword_4AD30);
  uint64_t v27 = *(void *)(v3 - 8);
  uint64_t v28 = v3;
  __chkstk_darwin();
  char v26 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_501C(&qword_4AD38);
  uint64_t v24 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  __chkstk_darwin();
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_501C(&qword_4AD40);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = sub_501C(&qword_4AD48);
  uint64_t v29 = *(void *)(v12 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = a1[3];
  uint64_t v15 = a1[4];
  sub_4FF8(a1, v16);
  unint64_t v17 = sub_9B64();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for LogSource.CodingKeys,  &type metadata for LogSource.CodingKeys,  v17,  v16,  v15);
  if ((_BYTE)v30)
  {
    if (v30 == 1)
    {
      char v32 = 1;
      unint64_t v18 = sub_9BEC();
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for LogSource.ClientCodingKeys,  &v32,  v12,  &type metadata for LogSource.ClientCodingKeys,  v18);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v25);
    }

    else
    {
      char v33 = 2;
      unint64_t v20 = sub_9BA8();
      id v21 = v26;
      KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for LogSource.UnknownCodingKeys,  &v33,  v12,  &type metadata for LogSource.UnknownCodingKeys,  v20);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v21, v28);
    }
  }

  else
  {
    char v31 = 0;
    unint64_t v19 = sub_9C30();
    KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for LogSource.InternalSourceCodingKeys,  &v31,  v12,  &type metadata for LogSource.InternalSourceCodingKeys,  v19);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v14, v12);
}

uint64_t sub_7830()
{
  return 0LL;
}

void sub_783C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_7848(uint64_t a1)
{
  unint64_t v2 = sub_9BEC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_7870(uint64_t a1)
{
  unint64_t v2 = sub_9BEC();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_7898()
{
  return sub_75AC(*v0);
}

uint64_t sub_78A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_8394(a1, a2);
  *a3 = result;
  return result;
}

void sub_78C4(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_78D0(uint64_t a1)
{
  unint64_t v2 = sub_9B64();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_78F8(uint64_t a1)
{
  unint64_t v2 = sub_9B64();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_7920@<X0>(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease(a1);
  *a2 = 1;
  return result;
}

uint64_t sub_794C(uint64_t a1)
{
  unint64_t v2 = sub_9C30();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_7974(uint64_t a1)
{
  unint64_t v2 = sub_9C30();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_799C(uint64_t a1)
{
  unint64_t v2 = sub_9BA8();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_79C4(uint64_t a1)
{
  unint64_t v2 = sub_9BA8();
  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_79EC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

Swift::Int sub_7A30(uint64_t a1)
{
  Swift::UInt v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void *sub_7A70@<X0>(void *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_84E8(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_7A98(void *a1)
{
  return sub_75CC(a1, *v1);
}

void sub_7AB0()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_4AA88 = v2;
}

uint64_t sub_7B3C()
{
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t type metadata accessor for TMDCSELFLogger()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin14TMDCSELFLogger);
}

uint64_t sub_7B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin();
  uint64_t v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  UUID.init()(v11);
  uint64_t v14 = sub_88C0(a1, (uint64_t)v13, a2, a3, a4);
  if (!v4)
  {
    uint64_t v15 = v14;
    sub_8E18(v14);
    swift_bridgeObjectRelease(v15);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

BOOL sub_7C40(uint64_t a1, uint64_t a2)
{
  if ((static UUID.== infix(_:_:)() & 1) == 0) {
    return 0LL;
  }
  uint64_t v4 = type metadata accessor for TMDCGroundTruth(0LL);
  uint64_t v5 = (int *)v4;
  uint64_t v6 = *(int *)(v4 + 24);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a1 + v6 + 8);
  uint64_t v9 = (void *)(a2 + v6);
  uint64_t v10 = v9[1];
  BOOL v11 = v7 == *v9 && v8 == v10;
  if (v11 || (char v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, *v9, v10, 0LL), result = 0LL, (v12 & 1) != 0))
  {
    if (*(void *)(a1 + v5[7]) != *(void *)(a2 + v5[7])) {
      return 0LL;
    }
    uint64_t v14 = v5[8];
    uint64_t v15 = *(void *)(a1 + v14);
    uint64_t v16 = *(void *)(a1 + v14 + 8);
    uint64_t v17 = (void *)(a2 + v14);
    uint64_t v18 = v17[1];
    BOOL v19 = v15 == *v17 && v16 == v18;
    if (v19
      || (char v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, *v17, v18, 0LL), result = 0LL, (v20 & 1) != 0))
    {
      sub_9C74(0LL, &qword_4AD50, &OBJC_CLASS___NSObject_ptr);
      if ((static NSObject.== infix(_:_:)(*(void *)(a1 + v5[9]), *(void *)(a2 + v5[9])) & 1) != 0)
      {
        uint64_t v21 = v5[10];
        uint64_t v22 = *(void **)(a1 + v21);
        uint64_t v23 = *(void **)(a2 + v21);
        if (v22)
        {
          if (!v23) {
            return 0LL;
          }
          type metadata accessor for CorrectedPronunciation();
          id v24 = v23;
          id v25 = v22;
          char v26 = static NSObject.== infix(_:_:)(v25, v24);

          if ((v26 & 1) == 0) {
            return 0LL;
          }
        }

        else if (v23)
        {
          return 0LL;
        }

        if (*(double *)(a1 + v5[11]) != *(double *)(a2 + v5[11])
          || *(unsigned __int8 *)(a1 + v5[12]) != *(unsigned __int8 *)(a2 + v5[12]))
        {
          return 0LL;
        }

        uint64_t v27 = v5[13];
        uint64_t v28 = (void *)(a1 + v27);
        uint64_t v29 = *(void *)(a1 + v27 + 8);
        int v30 = (void *)(a2 + v27);
        uint64_t v31 = v30[1];
        if (v29) {
          return v31
        }
              && (*v28 == *v30 && v29 == v31
               || (_stringCompareWithSmolCheck(_:_:expecting:)(*v28, v29, *v30, v31, 0LL) & 1) != 0);
        if (!v31) {
          return 1LL;
        }
      }

      return 0LL;
    }
  }

  return result;
}

uint64_t sub_7E0C(uint64_t a1, unint64_t a2)
{
  BOOL v3 = a1 == 0x696669746E656469LL && a2 == 0xEA00000000007265LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x696669746E656469LL, 0xEA00000000007265LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  if (a1 == 0x6372756F53676F6CLL && a2 == 0xE900000000000065LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6372756F53676F6CLL, 0xE900000000000065LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  if (a1 == 0x4E746361746E6F63LL && a2 == 0xEB00000000656D61LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x4E746361746E6F63LL, 0xEB00000000656D61LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  if (a1 == 0x69666E6F43727361LL && a2 == 0xED000065636E6564LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x69666E6F43727361LL, 0xED000065636E6564LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 3LL;
  }

  if (a1 == 0x656E6F6850727361LL && a2 == 0xEB0000000073656DLL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656E6F6850727361LL, 0xEB0000000073656DLL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 4LL;
  }

  if (a1 == 0xD000000000000018LL)
  {
    unint64_t v6 = 0x800000000003B0F0LL;
    if (a2 == 0x800000000003B0F0LL) {
      goto LABEL_27;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000018LL, 0x800000000003B0F0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v6 = a2;
LABEL_27:
    swift_bridgeObjectRelease(v6);
    return 5LL;
  }

  if (a1 == 0xD00000000000001ALL && a2 == 0x800000000003B110LL)
  {
    unint64_t v7 = 0x800000000003B110LL;
LABEL_33:
    swift_bridgeObjectRelease(v7);
    return 6LL;
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001ALL, 0x800000000003B110LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
    goto LABEL_33;
  }

  if (a1 == 0x6174736944703270LL && a2 == 0xEB0000000065636ELL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6174736944703270LL, 0xEB0000000065636ELL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 7LL;
  }

  if (a1 == 0xD000000000000010LL)
  {
    unint64_t v8 = 0x800000000003B130LL;
    if (a2 == 0x800000000003B130LL) {
      goto LABEL_42;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010LL, 0x800000000003B130LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v8 = a2;
LABEL_42:
    swift_bridgeObjectRelease(v8);
    return 8LL;
  }

  if (a1 == 0xD00000000000001BLL && a2 == 0x800000000003B150LL)
  {
    swift_bridgeObjectRelease(0x800000000003B150LL);
    return 9LL;
  }

  else
  {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001BLL, 0x800000000003B150LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v9 & 1) != 0) {
      return 9LL;
    }
    else {
      return 10LL;
    }
  }

uint64_t sub_8208(uint64_t a1, unint64_t a2)
{
  BOOL v3 = a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656C61636F6CLL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  if (a1 == 0xD00000000000001BLL)
  {
    unint64_t v6 = 0x800000000003AD40LL;
    if (a2 == 0x800000000003AD40LL) {
      goto LABEL_11;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001BLL, 0x800000000003AD40LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v6 = a2;
LABEL_11:
    swift_bridgeObjectRelease(v6);
    return 1LL;
  }

  if (a1 == 0xD00000000000001ALL)
  {
    unint64_t v7 = 0x800000000003AD60LL;
    if (a2 == 0x800000000003AD60LL) {
      goto LABEL_16;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001ALL, 0x800000000003AD60LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v7 = a2;
LABEL_16:
    swift_bridgeObjectRelease(v7);
    return 2LL;
  }

  if (a1 == 0xD00000000000001ALL && a2 == 0x800000000003AD80LL)
  {
    swift_bridgeObjectRelease(0x800000000003AD80LL);
    return 3LL;
  }

  else
  {
    char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0xD00000000000001ALL, 0x800000000003AD80LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v8 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_8394(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6C616E7265746E69LL && a2 == 0xEE00656372756F53LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6C616E7265746E69LL, 0xEE00656372756F53LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x746E65696C63LL && a2 == 0xE600000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x746E65696C63LL, 0xE600000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else if (a1 == 0x6E776F6E6B6E75LL && a2 == 0xE700000000000000LL)
  {
    swift_bridgeObjectRelease(0xE700000000000000LL);
    return 2LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E776F6E6B6E75LL, 0xE700000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

void *sub_84E8(void *a1)
{
  uint64_t v37 = sub_501C(&qword_4ACE8);
  uint64_t v35 = *(void *)(v37 - 8);
  __chkstk_darwin();
  uint64_t v39 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v36 = sub_501C(&qword_4ACF0);
  uint64_t v33 = *(void *)(v36 - 8);
  __chkstk_darwin();
  uint64_t v38 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v34 = sub_501C(&qword_4ACF8);
  uint64_t v4 = *(void *)(v34 - 8);
  __chkstk_darwin();
  char v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_501C(&qword_4AD00);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (uint64_t *)((char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_4FF8(a1, v11);
  unint64_t v13 = sub_9B64();
  uint64_t v14 = v40;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for LogSource.CodingKeys,  &type metadata for LogSource.CodingKeys,  v13,  v11,  v12);
  if (v14) {
    goto LABEL_7;
  }
  uint64_t v31 = v4;
  uint64_t v32 = v8;
  uint64_t v15 = v39;
  uint64_t v40 = a1;
  uint64_t v16 = v10;
  uint64_t v17 = KeyedDecodingContainer.allKeys.getter(v7);
  uint64_t v18 = v17;
  uint64_t v19 = v7;
  if (*(void *)(v17 + 16) != 1LL)
  {
    uint64_t v23 = v17;
    uint64_t v24 = type metadata accessor for DecodingError(0LL);
    swift_allocError(v24, &protocol witness table for DecodingError, 0LL, 0LL);
    uint64_t v10 = v25;
    sub_501C(&qword_4AD10);
    *uint64_t v10 = &type metadata for LogSource;
    uint64_t v26 = KeyedDecodingContainer.codingPath.getter(v19);
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)( v26,  0xD00000000000002BLL,  0x800000000003B0C0LL,  0LL);
    uint64_t v27 = (*(uint64_t (**)(void *, void, uint64_t))(*(void *)(v24 - 8) + 104LL))( v10,  enum case for DecodingError.typeMismatch(_:),  v24);
    swift_willThrow(v27);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(void *, uint64_t))(v32 + 8))(v16, v19);
    a1 = v40;
LABEL_7:
    sub_541C(a1);
    return v10;
  }

  uint64_t v10 = (void *)*(unsigned __int8 *)(v17 + 32);
  if (*(_BYTE *)(v17 + 32))
  {
    if ((_DWORD)v10 == 1)
    {
      char v42 = 1;
      unint64_t v20 = sub_9BEC();
      uint64_t v21 = v38;
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for LogSource.ClientCodingKeys,  &v42,  v7,  &type metadata for LogSource.ClientCodingKeys,  v20);
      uint64_t v22 = v32;
      (*(void (**)(char *, uint64_t))(v33 + 8))(v21, v36);
    }

    else
    {
      char v43 = 2;
      unint64_t v30 = sub_9BA8();
      KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for LogSource.UnknownCodingKeys,  &v43,  v7,  &type metadata for LogSource.UnknownCodingKeys,  v30);
      uint64_t v22 = v32;
      (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v37);
    }

    swift_bridgeObjectRelease(v18);
    (*(void (**)(void *, uint64_t))(v22 + 8))(v16, v19);
  }

  else
  {
    char v41 = 0;
    unint64_t v29 = sub_9C30();
    KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)( &type metadata for LogSource.InternalSourceCodingKeys,  &v41,  v7,  &type metadata for LogSource.InternalSourceCodingKeys,  v29);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v34);
    swift_bridgeObjectRelease(v18);
    (*(void (**)(void *, uint64_t))(v32 + 8))(v16, v7);
  }

  sub_541C(v40);
  return v10;
}

uint64_t sub_88C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10 = [objc_allocWithZone(PLUSSchemaPLUSClientEvent) init];
  if (!v10) {
    goto LABEL_18;
  }
  uint64_t v11 = v10;
  id v12 = [objc_allocWithZone(PLUSSchemaPLUSClientEventMetadata) init];
  if (!v12)
  {
LABEL_17:

LABEL_18:
    unint64_t v38 = sub_9058();
    uint64_t v39 = swift_allocError(&type metadata for TMDCLoggingError, v38, 0LL, 0LL);
    _OWORD *v40 = xmmword_38B30;
    swift_willThrow(v39);
    return a2;
  }

  unint64_t v13 = v12;
  uint64_t v56 = a5;
  id v14 = [objc_allocWithZone(PLUSSchemaPLUSTMDCGroundTruthGenerated) init];
  if (!v14)
  {
    id v15 = v13;
LABEL_16:

    uint64_t v11 = v15;
    goto LABEL_17;
  }

  id v15 = v14;
  uint64_t v57 = a1;
  id v16 = [objc_allocWithZone(PLUSSchemaPLUSTMDCGroundTruth) init];
  if (!v16)
  {

    uint64_t v11 = v13;
    goto LABEL_16;
  }

  uint64_t v17 = v16;
  id v55 = v15;
  id v18 = objc_allocWithZone(&OBJC_CLASS___SISchemaUUID);
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  id v54 = [v18 initWithNSUUID:isa];

  [v17 setAsrPostItnLinkId:a4];
  [v17 setAsrRawRecognitionLinkId:a3];
  id v20 = [objc_allocWithZone(PLUSSchemaPLUSTMDCSiriCurrentPronunciationTier1) init];
  uint64_t v21 = v57;
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v53 = *(void *)(v57 + *(int *)(type metadata accessor for TMDCGroundTruth(0LL) + 36));
    uint64_t v23 = *(void *)(*(void *)(v53 + OBJC_IVAR___ContactPronunciation_phonemeString)
                    + OBJC_IVAR___PhonemeString_symbols
                    + 8);
    swift_bridgeObjectRetain(v23);
    uint64_t v24 = v17;
    NSString v25 = String._bridgeToObjectiveC()();
    uint64_t v26 = v23;
    uint64_t v21 = v57;
    swift_bridgeObjectRelease(v26);
    [v22 setPhonemes:v25];

    uint64_t v17 = v24;
    if (*(_BYTE *)(v53 + OBJC_IVAR___ContactPronunciation_source)) {
      uint64_t v27 = 2 * (*(_BYTE *)(v53 + OBJC_IVAR___ContactPronunciation_source) == 2);
    }
    else {
      uint64_t v27 = 1LL;
    }
    [v22 setSource:v27];
    [v24 setSiriCurrentPronunciation:v22];
  }

  uint64_t v28 = (int *)type metadata accessor for TMDCGroundTruth(0LL);
  unint64_t v29 = *(void **)(v21 + v28[10]);
  if (v29)
  {
    id v30 = objc_allocWithZone(&OBJC_CLASS___PLUSSchemaPLUSTMDCCorrectedPronunciationTier1);
    uint64_t v31 = v29;
    id v32 = [v30 init];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = v17;
      uint64_t v35 = *(void *)&v31[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString];
      if (v35)
      {
        uint64_t v36 = *(void *)(v35 + OBJC_IVAR___PhonemeString_symbols + 8);
        swift_bridgeObjectRetain(v36);
        NSString v37 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v36);
      }

      else
      {
        NSString v37 = 0LL;
      }

      [v33 setFirstNamePhonemes:v37];

      uint64_t v42 = *(void *)&v31[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString];
      if (v42)
      {
        uint64_t v43 = *(void *)(v42 + OBJC_IVAR___PhonemeString_symbols + 8);
        swift_bridgeObjectRetain(v43);
        NSString v44 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v43);
      }

      else
      {
        NSString v44 = 0LL;
      }

      [v33 setLastNamePhonemes:v44];

      uint64_t v45 = *(void *)&v31[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString];
      if (v45)
      {
        uint64_t v46 = *(void *)(v45 + OBJC_IVAR___PhonemeString_symbols + 8);
        swift_bridgeObjectRetain(v46);
        NSString v47 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v46);
      }

      else
      {
        NSString v47 = 0LL;
      }

      [v33 setNicknamePhonemes:v47];

      uint64_t v17 = v34;
      [v34 setCorrectedPronunciation:v33];
    }

    else
    {
      uint64_t v33 = v31;
    }
  }

  id v48 = objc_allocWithZone(&OBJC_CLASS___SISchemaUUID);
  Class v49 = UUID._bridgeToObjectiveC()().super.isa;
  id v50 = [v48 initWithNSUUID:v49];

  [v17 setGroundTruthId:v50];
  [v17 setIsTTSMispronounced:*(unsigned __int8 *)(v57 + v28[12])];
  [v17 setPhonemesToPhonemesDistance:*(double *)(v57 + v28[11])];
  [v55 setGroundTruth:v17];
  [v55 setOriginalRequestId:v56];
  [v13 setPlusId:v54];
  [v11 setTmdcGroundTruthGenerated:v55];
  [v11 setEventMetadata:v13];
  uint64_t v51 = sub_501C(&qword_4ABB0);
  uint64_t v52 = swift_allocObject(v51, 40LL, 7LL);
  *(_OWORD *)(v52 + 16) = xmmword_38B20;
  *(void *)(v52 + 32) = v11;
  uint64_t v58 = v52;
  specialized Array._endMutation()();
  a2 = v58;

  return a2;
}

void sub_8E18(uint64_t a1)
{
  if (qword_4A6F8 != -1) {
    swift_once(&qword_4A6F8, sub_7AB0);
  }
  if ((byte_4AA88 & 1) == 0)
  {
    id v5 = [(id)objc_opt_self(AssistantSiriAnalytics) sharedAnalytics];
    id v6 = [v5 defaultMessageStream];

    if ((unint64_t)a1 >> 62)
    {
      if (a1 < 0) {
        uint64_t v12 = a1;
      }
      else {
        uint64_t v12 = a1 & 0xFFFFFFFFFFFFFF8LL;
      }
      swift_bridgeObjectRetain(a1);
      uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v12);
      if (!v7) {
        goto LABEL_21;
      }
    }

    else
    {
      uint64_t v7 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
      swift_bridgeObjectRetain(a1);
      if (!v7) {
        goto LABEL_21;
      }
    }

    if (v7 < 1)
    {
      __break(1u);
      return;
    }

    uint64_t v8 = 0LL;
    do
    {
      if ((a1 & 0xC000000000000001LL) != 0) {
        id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, a1);
      }
      else {
        id v9 = *(id *)(a1 + 8 * v8 + 32);
      }
      id v10 = v9;
      ++v8;
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      [v6 emitMessage:v10 isolatedStreamUUID:isa];
    }

    while (v7 != v8);
LABEL_21:

    swift_bridgeObjectRelease(a1);
    return;
  }

  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  sub_4F30(v2, (uint64_t)qword_4FC70);
  oslog = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, oslog, v3, "Omitting SELF logging call as UsageLoggingDisabled flag present", v4, 2u);
    swift_slowDealloc(v4, -1LL, -1LL);
  }
}

unint64_t sub_9058()
{
  unint64_t result = qword_4ABA8;
  if (!qword_4ABA8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A234, &type metadata for TMDCLoggingError);
    atomic_store(result, (unint64_t *)&qword_4ABA8);
  }

  return result;
}

uint64_t type metadata accessor for TMDCGroundTruth(uint64_t a1)
{
  uint64_t result = qword_4AC70;
  if (!qword_4AC70) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TMDCGroundTruth);
  }
  return result;
}

unint64_t sub_90D8()
{
  unint64_t result = qword_4ABC0;
  if (!qword_4ABC0)
  {
    unint64_t result = swift_getWitnessTable(&unk_38638, &type metadata for CorrectedPronunciation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ABC0);
  }

  return result;
}

uint64_t sub_911C(uint64_t a1)
{
  uint64_t v2 = sub_501C((uint64_t *)&unk_4AC00);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_915C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_501C((uint64_t *)&unk_4AC00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

_BYTE *initializeBufferWithCopyOfBuffer for PhonemeFormat(_BYTE *result, _BYTE *a2)
{
  void *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for LogSource()
{
  return &type metadata for LogSource;
}

uint64_t getEnumTagSinglePayload for PhonemeFormat(unsigned __int8 *a1, unsigned int a2)
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
  BOOL v7 = v6 >= 0xA;
  int v8 = v6 - 10;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
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

  v94 = v16;
  id v32 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
  uint64_t v34 = v33;
  if (!*(void *)(v24 + 16))
  {
    swift_bridgeObjectRelease(v24);
    swift_bridgeObjectRelease(v34);
LABEL_25:
    v106 = 0LL;
    v107 = 0LL;
    v100 = 0LL;
    v101 = 0LL;
    v105 = 0LL;
    LODWORD(v110) = 0;
    uint64_t v27 = 0LL;
    uint64_t v28 = 0LL;
    unint64_t v29 = 0LL;
    id v30 = 0LL;
    v102 = 0;
    v103 = 0LL;
    uint64_t v31 = 0LL;
    v108 = 0LL;
    v104 = 0;
    LODWORD(v16) = v94;
    goto LABEL_28;
  }

  uint64_t v35 = v32;
  swift_bridgeObjectRetain(v24);
  uint64_t v36 = sub_2DEC8(v35, v34);
  if ((v37 & 1) == 0)
  {
    swift_bridgeObjectRelease(v34);
    swift_bridgeObjectRelease_n(v24, 2LL);
    goto LABEL_25;
  }

  v92 = v5;
  v93 = v7;
  unint64_t v38 = *(void *)(v24 + 56) + 120 * v36;
  uint64_t v39 = *(void *)v38;
  uint64_t v40 = *(void *)(v38 + 8);
  char v41 = *(void (**)(char *, uint64_t, uint64_t))(v38 + 16);
  uint64_t v42 = *(void *)(v38 + 24);
  uint64_t v43 = *(unsigned __int8 *)(v38 + 32);
  uint64_t v45 = *(void *)(v38 + 40);
  NSString v44 = *(void *)(v38 + 48);
  uint64_t v46 = *(void *)(v38 + 56);
  NSString v47 = *(void *)(v38 + 64);
  id v48 = *(unsigned __int8 *)(v38 + 72);
  Class v49 = *(void *)(v38 + 80);
  id v50 = *(void *)(v38 + 88);
  uint64_t v51 = *(void *)(v38 + 96);
  v105 = *(void *)(v38 + 104);
  LODWORD(v110) = *(unsigned __int8 *)(v38 + 112);
  v101 = v39;
  v103 = v40;
  v108 = v42;
  v109 = v41;
  v104 = v43;
  sub_E378(v39, v40, (uint64_t)v41);
  v91 = v45;
  v88 = v44;
  v90 = v46;
  v89 = v47;
  v102 = v48;
  sub_E378(v45, v44, v46);
  v106 = v50;
  v107 = v49;
  v100 = v51;
  sub_E378(v49, v50, v51);
  swift_bridgeObjectRelease(v34);
  swift_bridgeObjectRelease_n(v95, 2LL);
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v52 = type metadata accessor for Logger(0LL);
  sub_4F30(v52, (uint64_t)qword_4FC70);
  uint64_t v53 = v92;
  id v54 = (os_log_s *)Logger.logObject.getter(v53);
  id v55 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v57 = swift_slowAlloc(32LL, -1LL);
    *(void *)&v114 = v57;
    *(_DWORD *)uint64_t v56 = 136315138;
    v95 = (__int128 *)(v56 + 4);
    uint64_t v58 = [v53 identifier];
    uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
    v61 = v60;

    v115 = sub_25824(v59, v61, (uint64_t *)&v114);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v115, &v116);

    swift_bridgeObjectRelease(v61);
    _os_log_impl(&dword_0, v54, v55, "Found existing phonemeData for contact: %s", v56, 0xCu);
    swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v57, -1LL, -1LL);
    swift_slowDealloc(v56, -1LL, -1LL);

    unint64_t v62 = v101;
    unint64_t v63 = v103;
    uint64_t v31 = v109;
    sub_E378(v101, v103, (uint64_t)v109);
    uint64_t v28 = v88;
    unint64_t v29 = v90;
    id v30 = v89;
    sub_E378(v91, v88, v90);
    BOOL v7 = v100;
    sub_E378(v107, v106, v100);
    unint64_t v64 = v62;
    uint64_t v65 = v63;
    uint64_t v27 = v91;
  }

  else
  {

    uint64_t v66 = v101;
    uint64_t v31 = v109;
    sub_E378(v101, v103, (uint64_t)v109);
    uint64_t v27 = v91;
    uint64_t v28 = v88;
    unint64_t v29 = v90;
    id v30 = v89;
    sub_E378(v91, v88, v90);
    BOOL v7 = v100;
    sub_E378(v107, v106, v100);
    unint64_t v64 = v66;
    uint64_t v65 = v103;
  }

  sub_E450(v64, v65, (uint64_t)v31);
  sub_E450(v27, v28, v29);
  sub_E450(v107, v106, v7);
  LODWORD(v16) = v94;
  LOBYTE(v7) = v93;
LABEL_28:
  v67 = v27;
  v109 = v31;
  if (!(_BYTE)v7)
  {
    v71 = v16;
    swift_bridgeObjectRelease(0xE500000000000000LL);
LABEL_39:
    unint64_t result = sub_E450(v101, v103, (uint64_t)v109);
    uint64_t v76 = v96;
    v77 = v97;
    unint64_t v78 = v98;
    unint64_t v79 = v99;
    unint64_t v80 = v102;
    goto LABEL_42;
  }

  v95 = (__int128 *)v112;
  v68 = 1953718636LL;
  else {
    v69 = 1801677166LL;
  }
  unint64_t v70 = v7;
  v71 = v16;
  v72 = _stringCompareWithSmolCheck(_:_:expecting:)( v69,  0xE400000000000000LL,  0x7473726966LL,  0xE500000000000000LL,  0LL);
  swift_bridgeObjectRelease(0xE400000000000000LL);
  if ((v72 & 1) != 0) {
    goto LABEL_39;
  }
  if (v70 == 2)
  {
    unint64_t v73 = _stringCompareWithSmolCheck(_:_:expecting:)( 1801677166LL,  0xE400000000000000LL,  1953718636LL,  0xE400000000000000LL,  0LL);
    swift_bridgeObjectRelease(0xE400000000000000LL);
    if ((v73 & 1) == 0)
    {
      sub_E450(v107, v106, v100);
      if (v70)
      {
        if (v70 != 1)
        {
          unint64_t result = swift_bridgeObjectRelease(0xE400000000000000LL);
          goto LABEL_48;
        }

        v74 = 0xE400000000000000LL;
      }

      else
      {
        v74 = 0xE500000000000000LL;
        v68 = 0x7473726966LL;
      }

      v85 = _stringCompareWithSmolCheck(_:_:expecting:)(v68, v74, 1801677166LL, 0xE400000000000000LL, 0LL);
      unint64_t result = swift_bridgeObjectRelease(v74);
      if ((v85 & 1) == 0)
      {
        sub_E450(v67, v28, v29);
        sub_E450(v101, v103, (uint64_t)v109);
        v115 = v111;
        sub_E4EC(&v115);
        v114 = *v95;
        unint64_t result = sub_1FB30((uint64_t)&v114);
        v77 = 0LL;
        unint64_t v78 = 0LL;
        unint64_t v79 = 0LL;
        v71 = 0;
        v67 = 0LL;
        uint64_t v28 = 0LL;
        unint64_t v29 = 0LL;
        id v30 = 0LL;
        unint64_t v80 = 0;
        v81 = 0LL;
        v82 = 0LL;
        v83 = 0LL;
        v84 = 0LL;
        LOBYTE(v16) = 0;
        uint64_t v76 = 1LL;
        goto LABEL_43;
      }

    NSString v37 = v11;
    unint64_t v38 = v4;
    uint64_t v36 = (v12 - 1) & v12;
  }

  __break(1u);
LABEL_31:
  __break(1u);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CorrectedPronunciation.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_92AC + 4 * byte_38273[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_92E0 + 4 * byte_3826E[v4]))();
}

uint64_t sub_92E0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_92E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x92F0LL);
  }
  return result;
}

uint64_t sub_92FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x9304LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_9308(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_9310(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CorrectedPronunciation.CodingKeys()
{
  return &type metadata for CorrectedPronunciation.CodingKeys;
}

void *sub_932C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v27 = *a2;
    *a1 = *a2;
    a1 = (void *)(v27 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for UUID(0LL);
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    id v9 = (void *)((char *)a1 + v8);
    id v10 = (void *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *id v9 = *v10;
    v9[1] = v11;
    uint64_t v12 = a3[8];
    *(void *)((char *)a1 + a3[7]) = *(void *)((char *)a2 + a3[7]);
    unint64_t v13 = (void *)((char *)a1 + v12);
    id v14 = (void *)((char *)a2 + v12);
    uint64_t v15 = v14[1];
    *unint64_t v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = a3[9];
    uint64_t v17 = a3[10];
    id v18 = *(void **)((char *)a2 + v16);
    *(void *)((char *)a1 + v16) = v18;
    uint64_t v19 = *(void **)((char *)a2 + v17);
    *(void *)((char *)a1 + v17) = v19;
    uint64_t v20 = a3[12];
    *(void *)((char *)a1 + a3[11]) = *(void *)((char *)a2 + a3[11]);
    *((_BYTE *)a1 + v20) = *((_BYTE *)a2 + v20);
    uint64_t v21 = a3[13];
    uint64_t v22 = (void *)((char *)a1 + v21);
    uint64_t v23 = (void *)((char *)a2 + v21);
    uint64_t v24 = v23[1];
    void *v22 = *v23;
    v22[1] = v24;
    ((void (*)(void))swift_bridgeObjectRetain)();
    swift_bridgeObjectRetain(v15);
    id v25 = v18;
    id v26 = v19;
    swift_bridgeObjectRetain(v24);
  }

  return a1;
}

uint64_t sub_9440(uint64_t a1, int *a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  swift_bridgeObjectRelease(*(void *)(a1 + a2[6] + 8));
  swift_bridgeObjectRelease(*(void *)(a1 + a2[8] + 8));

  return swift_bridgeObjectRelease(*(void *)(a1 + a2[13] + 8));
}

uint64_t sub_94C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  uint64_t v11 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v12 = (void *)(a1 + v11);
  unint64_t v13 = (void *)(a2 + v11);
  uint64_t v14 = v13[1];
  *uint64_t v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[9];
  uint64_t v16 = a3[10];
  uint64_t v17 = *(void **)(a2 + v15);
  *(void *)(a1 + v15) = v17;
  id v18 = *(void **)(a2 + v16);
  *(void *)(a1 + v16) = v18;
  uint64_t v19 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_BYTE *)(a1 + v19) = *(_BYTE *)(a2 + v19);
  uint64_t v20 = a3[13];
  uint64_t v21 = (void *)(a1 + v20);
  uint64_t v22 = (void *)(a2 + v20);
  uint64_t v23 = v22[1];
  void *v21 = *v22;
  v21[1] = v23;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v14);
  id v24 = v17;
  id v25 = v18;
  swift_bridgeObjectRetain(v23);
  return a1;
}

uint64_t sub_95A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  uint64_t v7 = a3[6];
  uint64_t v8 = (void *)(a1 + v7);
  id v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v12 = a3[8];
  unint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  *unint64_t v13 = *v14;
  uint64_t v15 = v14[1];
  uint64_t v16 = v13[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  uint64_t v17 = a3[9];
  id v18 = *(void **)(a2 + v17);
  uint64_t v19 = *(void **)(a1 + v17);
  *(void *)(a1 + v17) = v18;
  id v20 = v18;

  uint64_t v21 = a3[10];
  uint64_t v22 = *(void **)(a1 + v21);
  uint64_t v23 = *(void **)(a2 + v21);
  *(void *)(a1 + v21) = v23;
  id v24 = v23;

  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_BYTE *)(a1 + a3[12]) = *(_BYTE *)(a2 + a3[12]);
  uint64_t v25 = a3[13];
  id v26 = (void *)(a1 + v25);
  uint64_t v27 = (void *)(a2 + v25);
  void *v26 = *v27;
  uint64_t v28 = v27[1];
  uint64_t v29 = v26[1];
  v26[1] = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v29);
  return a1;
}

uint64_t sub_96DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  uint64_t v8 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  uint64_t v9 = a3[10];
  *(void *)(a1 + a3[9]) = *(void *)(a2 + a3[9]);
  *(void *)(a1 + v9) = *(void *)(a2 + v9);
  uint64_t v10 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(a2 + v10);
  *(_OWORD *)(a1 + a3[13]) = *(_OWORD *)(a2 + a3[13]);
  return a1;
}

uint64_t sub_9788(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v12 = v8[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = a3[8];
  *(void *)(a1 + a3[7]) = *(void *)(a2 + a3[7]);
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)(a2 + v13);
  uint64_t v17 = *v15;
  uint64_t v16 = v15[1];
  uint64_t v18 = v14[1];
  *uint64_t v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease(v18);
  uint64_t v19 = a3[9];
  id v20 = *(void **)(a1 + v19);
  *(void *)(a1 + v19) = *(void *)(a2 + v19);

  uint64_t v21 = a3[10];
  uint64_t v22 = *(void **)(a1 + v21);
  *(void *)(a1 + v21) = *(void *)(a2 + v21);

  uint64_t v23 = a3[12];
  *(void *)(a1 + a3[11]) = *(void *)(a2 + a3[11]);
  *(_BYTE *)(a1 + v23) = *(_BYTE *)(a2 + v23);
  uint64_t v24 = a3[13];
  uint64_t v25 = (void *)(a1 + v24);
  id v26 = (uint64_t *)(a2 + v24);
  uint64_t v28 = *v26;
  uint64_t v27 = v26[1];
  uint64_t v29 = v25[1];
  *uint64_t v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease(v29);
  return a1;
}

uint64_t sub_9878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_9884);
}

uint64_t sub_9884(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t sub_9904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_9910);
}

uint64_t sub_9910(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_998C(uint64_t a1)
{
  uint64_t result = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_383B0;
    v4[2] = &unk_383C8;
    v4[3] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[4] = &unk_383C8;
    v4[5] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[6] = &unk_383E0;
    v4[7] = (char *)&value witness table for Builtin.Int64 + 64;
    v4[8] = &unk_383F8;
    void v4[9] = &unk_38410;
    swift_initStructMetadata(a1, 256LL, 10LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

unint64_t sub_9A48()
{
  unint64_t result = qword_4ACC8;
  if (!qword_4ACC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_38558, &type metadata for CorrectedPronunciation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ACC8);
  }

  return result;
}

unint64_t sub_9A90()
{
  unint64_t result = qword_4ACD0;
  if (!qword_4ACD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_38610, &type metadata for LogSource);
    atomic_store(result, (unint64_t *)&qword_4ACD0);
  }

  return result;
}

unint64_t sub_9AD8()
{
  unint64_t result = qword_4ACD8;
  if (!qword_4ACD8)
  {
    unint64_t result = swift_getWitnessTable(&unk_384C8, &type metadata for CorrectedPronunciation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ACD8);
  }

  return result;
}

unint64_t sub_9B20()
{
  unint64_t result = qword_4ACE0;
  if (!qword_4ACE0)
  {
    unint64_t result = swift_getWitnessTable(&unk_384F0, &type metadata for CorrectedPronunciation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ACE0);
  }

  return result;
}

unint64_t sub_9B64()
{
  unint64_t result = qword_4AD08;
  if (!qword_4AD08)
  {
    unint64_t result = swift_getWitnessTable(&unk_38A84, &type metadata for LogSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4AD08);
  }

  return result;
}

unint64_t sub_9BA8()
{
  unint64_t result = qword_4AD18;
  if (!qword_4AD18)
  {
    unint64_t result = swift_getWitnessTable(&unk_38A34, &type metadata for LogSource.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_4AD18);
  }

  return result;
}

unint64_t sub_9BEC()
{
  unint64_t result = qword_4AD20;
  if (!qword_4AD20)
  {
    unint64_t result = swift_getWitnessTable(&unk_389E4, &type metadata for LogSource.ClientCodingKeys);
    atomic_store(result, (unint64_t *)&qword_4AD20);
  }

  return result;
}

unint64_t sub_9C30()
{
  unint64_t result = qword_4AD28;
  if (!qword_4AD28)
  {
    unint64_t result = swift_getWitnessTable(&unk_38994, &type metadata for LogSource.InternalSourceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_4AD28);
  }

  return result;
}

uint64_t sub_9C74(uint64_t a1, unint64_t *a2, void *a3)
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

unint64_t sub_9CAC()
{
  unint64_t result = qword_4AD60;
  if (!qword_4AD60)
  {
    unint64_t result = swift_getWitnessTable(&unk_38944, &type metadata for TMDCGroundTruth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4AD60);
  }

  return result;
}

unint64_t sub_9CF0()
{
  unint64_t result = qword_4AD70;
  if (!qword_4AD70)
  {
    unint64_t result = swift_getWitnessTable(&unk_385A8, &type metadata for LogSource);
    atomic_store(result, (unint64_t *)&qword_4AD70);
  }

  return result;
}

uint64_t sub_9D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TMDCGroundTruth(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_9D78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for TMDCGroundTruth(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

unint64_t sub_9DB4()
{
  unint64_t result = qword_4AD98;
  if (!qword_4AD98)
  {
    unint64_t result = swift_getWitnessTable(&unk_38580, &type metadata for LogSource);
    atomic_store(result, (unint64_t *)&qword_4AD98);
  }

  return result;
}

uint64_t sub_9DF8(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for TMDCGroundTruth.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TMDCGroundTruth.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_9F14 + 4 * byte_3827D[v4]))();
  }
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_9F48 + 4 * byte_38278[v4]))();
}

uint64_t sub_9F48(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_9F50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x9F58LL);
  }
  return result;
}

uint64_t sub_9F64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x9F6CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 9;
  return result;
}

uint64_t sub_9F70(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_9F78(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_9F84(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_9F8C(_BYTE *result, char a2)
{
  void *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TMDCGroundTruth.CodingKeys()
{
  return &type metadata for TMDCGroundTruth.CodingKeys;
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin9LogSourceOwet_0( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin9LogSourceOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_A080 + 4 * byte_38287[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_A0B4 + 4 * byte_38282[v4]))();
}

uint64_t sub_A0B4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_A0BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0xA0C4LL);
  }
  return result;
}

uint64_t sub_A0D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0xA0D8LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_A0DC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_A0E4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for LogSource.CodingKeys()
{
  return &type metadata for LogSource.CodingKeys;
}

ValueMetadata *type metadata accessor for LogSource.InternalSourceCodingKeys()
{
  return &type metadata for LogSource.InternalSourceCodingKeys;
}

ValueMetadata *type metadata accessor for LogSource.ClientCodingKeys()
{
  return &type metadata for LogSource.ClientCodingKeys;
}

ValueMetadata *type metadata accessor for LogSource.UnknownCodingKeys()
{
  return &type metadata for LogSource.UnknownCodingKeys;
}

unint64_t sub_A134()
{
  unint64_t result = qword_4ADB0;
  if (!qword_4ADB0)
  {
    unint64_t result = swift_getWitnessTable(&unk_38864, &type metadata for LogSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADB0);
  }

  return result;
}

unint64_t sub_A17C()
{
  unint64_t result = qword_4ADB8;
  if (!qword_4ADB8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3891C, &type metadata for TMDCGroundTruth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADB8);
  }

  return result;
}

unint64_t sub_A1C4()
{
  unint64_t result = qword_4ADC0;
  if (!qword_4ADC0)
  {
    unint64_t result = swift_getWitnessTable(&unk_3888C, &type metadata for TMDCGroundTruth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADC0);
  }

  return result;
}

unint64_t sub_A20C()
{
  unint64_t result = qword_4ADC8;
  if (!qword_4ADC8)
  {
    unint64_t result = swift_getWitnessTable(&unk_388B4, &type metadata for TMDCGroundTruth.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADC8);
  }

  return result;
}

unint64_t sub_A254()
{
  unint64_t result = qword_4ADD0;
  if (!qword_4ADD0)
  {
    unint64_t result = swift_getWitnessTable(&unk_38784, &type metadata for LogSource.InternalSourceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADD0);
  }

  return result;
}

unint64_t sub_A29C()
{
  unint64_t result = qword_4ADD8;
  if (!qword_4ADD8)
  {
    unint64_t result = swift_getWitnessTable(&unk_387AC, &type metadata for LogSource.InternalSourceCodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADD8);
  }

  return result;
}

unint64_t sub_A2E4()
{
  unint64_t result = qword_4ADE0;
  if (!qword_4ADE0)
  {
    unint64_t result = swift_getWitnessTable(&unk_38734, &type metadata for LogSource.ClientCodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADE0);
  }

  return result;
}

unint64_t sub_A32C()
{
  unint64_t result = qword_4ADE8;
  if (!qword_4ADE8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3875C, &type metadata for LogSource.ClientCodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADE8);
  }

  return result;
}

unint64_t sub_A374()
{
  unint64_t result = qword_4ADF0;
  if (!qword_4ADF0)
  {
    unint64_t result = swift_getWitnessTable(&unk_386E4, &type metadata for LogSource.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADF0);
  }

  return result;
}

unint64_t sub_A3BC()
{
  unint64_t result = qword_4ADF8;
  if (!qword_4ADF8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3870C, &type metadata for LogSource.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_4ADF8);
  }

  return result;
}

unint64_t sub_A404()
{
  unint64_t result = qword_4AE00;
  if (!qword_4AE00)
  {
    unint64_t result = swift_getWitnessTable(&unk_387D4, &type metadata for LogSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4AE00);
  }

  return result;
}

unint64_t sub_A44C()
{
  unint64_t result = qword_4AE08;
  if (!qword_4AE08)
  {
    unint64_t result = swift_getWitnessTable(&unk_387FC, &type metadata for LogSource.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4AE08);
  }

  return result;
}

uint64_t sub_A4A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[31] = a2;
  v3[32] = a3;
  v3[30] = a1;
  uint64_t v4 = sub_501C(&qword_4AEF0);
  v3[33] = swift_task_alloc((*(void *)(*(void *)(v4 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for UUID(0LL);
  v3[34] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v3[35] = v6;
  unint64_t v7 = (*(void *)(v6 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[36] = swift_task_alloc(v7);
  v3[37] = swift_task_alloc(v7);
  v3[38] = swift_task_alloc(v7);
  v3[39] = swift_task_alloc(v7);
  v3[40] = swift_task_alloc(v7);
  v3[41] = swift_task_alloc(v7);
  v3[42] = swift_task_alloc(v7);
  return swift_task_switch(sub_A578, 0LL, 0LL);
}

uint64_t sub_A578()
{
  uint64_t v1 = *(void *)(v0 + 272);
  uint64_t v2 = *(void *)(v0 + 280);
  uint64_t v3 = *(void *)(v0 + 264);
  Conversation.getConversationId()();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1LL, v1) == 1)
  {
    sub_BA5C(*(void *)(v0 + 264), &qword_4AEF0);
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v4 = type metadata accessor for Logger(0LL);
    uint64_t v5 = sub_4F30(v4, (uint64_t)qword_4FC70);
    uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
    os_log_type_t v7 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v6, v7))
    {
      int v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_0, v6, v7, "Couldn't locate conversationID, skipping conversation", v8, 2u);
      swift_slowDealloc(v8, -1LL, -1LL);
    }

    goto LABEL_13;
  }

  uint64_t v9 = *(void **)(v0 + 256);
  uint64_t v10 = *(void *)(v0 + 248);
  (*(void (**)(void, void, void))(*(void *)(v0 + 280) + 32LL))( *(void *)(v0 + 336),  *(void *)(v0 + 264),  *(void *)(v0 + 272));
  uint64_t v11 = objc_autoreleasePoolPush();
  sub_B2F8(v10, v9, v162);
  uint64_t v12 = *(void *)(v0 + 336);
  objc_autoreleasePoolPop(v11);
  uint64_t v13 = v162[0];
  char v14 = sub_2008C(v12, v162[0]);
  if (v14 == 2)
  {
    swift_bridgeObjectRelease(v13);
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v16 = *(void *)(v0 + 328);
    uint64_t v15 = *(void *)(v0 + 336);
    uint64_t v18 = *(void *)(v0 + 272);
    uint64_t v17 = *(void *)(v0 + 280);
    uint64_t v19 = type metadata accessor for Logger(0LL);
    sub_4F30(v19, (uint64_t)qword_4FC70);
    uint64_t v20 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v16, v15, v18);
    uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v24 = *(void *)(v0 + 328);
    uint64_t v25 = *(void *)(v0 + 336);
    uint64_t v27 = *(void *)(v0 + 272);
    uint64_t v26 = *(void *)(v0 + 280);
    if (v23)
    {
      uint64_t v156 = *(void *)(v0 + 336);
      uint64_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v29 = swift_slowAlloc(32LL, -1LL);
      v162[0] = v29;
      *(_DWORD *)uint64_t v28 = 136315138;
      unint64_t v30 = sub_B948();
      uint64_t v31 = dispatch thunk of CustomStringConvertible.description.getter(v27, v30);
      unint64_t v33 = v32;
      *(void *)(v0 + 192) = sub_25824(v31, v32, v162);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 192, v0 + 200);
      swift_bridgeObjectRelease(v33);
      uint64_t v34 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v34(v24, v27);
      _os_log_impl(&dword_0, v21, v22, "[%s]: Conversation doesn't belong to accepted domains", v28, 0xCu);
      swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1LL, -1LL);
      swift_slowDealloc(v28, -1LL, -1LL);

      v34(v156, v27);
    }

    else
    {

      uint64_t v35 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v35(v24, v27);
      v35(v25, v27);
    }

    goto LABEL_13;
  }

  char v44 = v14;
  uint64_t v45 = *(void **)(v0 + 256);
  char v46 = v14 & 1;
  uint64_t v47 = v45[21];
  uint64_t v48 = v45[22];
  sub_4FF8(v45 + 18, v47);
  if ((v44 & 1) != 0)
  {
    if ((dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.isTmdcRuntimeMessageEnabled()(v47, v48) & 1) == 0) {
      goto LABEL_16;
    }
  }

  else if ((dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.isTmdcRuntimeCallEnabled()(v47, v48) & 1) == 0)
  {
LABEL_16:
    v161 = (uint64_t *)(v0 + 200);
    char v157 = v46;
    swift_bridgeObjectRelease(v13);
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v49 = *(void *)(v0 + 336);
    uint64_t v50 = *(void *)(v0 + 296);
    uint64_t v52 = *(void *)(v0 + 272);
    uint64_t v51 = *(void *)(v0 + 280);
    uint64_t v53 = type metadata accessor for Logger(0LL);
    sub_4F30(v53, (uint64_t)qword_4FC70);
    uint64_t v54 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 16))(v50, v49, v52);
    id v55 = (os_log_s *)Logger.logObject.getter(v54);
    os_log_type_t v56 = static os_log_type_t.debug.getter();
    BOOL v57 = os_log_type_enabled(v55, v56);
    uint64_t v58 = *(void *)(v0 + 336);
    uint64_t v59 = *(void *)(v0 + 296);
    uint64_t v61 = *(void *)(v0 + 272);
    uint64_t v60 = *(void *)(v0 + 280);
    if (v57)
    {
      uint64_t v152 = *(void *)(v0 + 336);
      uint64_t v62 = swift_slowAlloc(22LL, -1LL);
      uint64_t v149 = swift_slowAlloc(64LL, -1LL);
      v162[0] = v149;
      *(_DWORD *)uint64_t v62 = 136315394;
      unint64_t v63 = sub_B948();
      uint64_t v64 = dispatch thunk of CustomStringConvertible.description.getter(v61, v63);
      unint64_t v66 = v65;
      uint64_t *v161 = sub_25824(v64, v65, v162);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v161, v0 + 208);
      swift_bridgeObjectRelease(v66);
      v67 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
      v67(v59, v61);
      *(_WORD *)(v62 + 12) = 2080;
      *(_BYTE *)(v0 + 65) = v157;
      uint64_t v68 = String.init<A>(describing:)(v0 + 65, &type metadata for Domain);
      unint64_t v70 = v69;
      *(void *)(v0 + 208) = sub_25824(v68, v69, v162);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216);
      swift_bridgeObjectRelease(v70);
      _os_log_impl(&dword_0, v55, v56, "[%s]: %s is not enabled", (uint8_t *)v62, 0x16u);
      swift_arrayDestroy(v149, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v149, -1LL, -1LL);
      swift_slowDealloc(v62, -1LL, -1LL);

      v67(v152, v61);
    }

    else
    {

      v92 = *(void (**)(uint64_t, uint64_t))(v60 + 8);
      v92(v59, v61);
      v92(v58, v61);
    }

    goto LABEL_13;
  }

  v154 = (uint64_t *)(v0 + 216);
  uint64_t v71 = v0 + 128;
  uint64_t v147 = v0 + 232;
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  v150 = (_OWORD *)(v0 + 72);
  uint64_t v72 = *(void *)(v0 + 336);
  uint64_t v73 = *(void *)(v0 + 320);
  uint64_t v74 = *(void *)(v0 + 272);
  uint64_t v75 = *(void *)(v0 + 280);
  uint64_t v76 = type metadata accessor for Logger(0LL);
  sub_4F30(v76, (uint64_t)qword_4FC70);
  v77 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v75 + 16);
  uint64_t v78 = v77(v73, v72, v74);
  unint64_t v79 = (os_log_s *)Logger.logObject.getter(v78);
  os_log_type_t v80 = static os_log_type_t.debug.getter();
  BOOL v81 = os_log_type_enabled(v79, v80);
  uint64_t v82 = *(void *)(v0 + 320);
  uint64_t v84 = *(void *)(v0 + 272);
  uint64_t v83 = *(void *)(v0 + 280);
  if (v81)
  {
    char v158 = v46;
    v85 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v145 = swift_slowAlloc(32LL, -1LL);
    v162[0] = v145;
    *(_DWORD *)v85 = 136315138;
    unint64_t v86 = sub_B948();
    uint64_t v87 = dispatch thunk of CustomStringConvertible.description.getter(v84, v86);
    unint64_t v89 = v88;
    *(void *)(v0 + 232) = sub_25824(v87, v88, v162);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v147, v0 + 240);
    unint64_t v90 = v89;
    uint64_t v71 = v0 + 128;
    swift_bridgeObjectRelease(v90);
    v153 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
    v153(v82, v84);
    _os_log_impl(&dword_0, v79, v80, "[%s]: Begin fetching ConversationData for conversation", v85, 0xCu);
    swift_arrayDestroy(v145, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v145, -1LL, -1LL);
    v91 = v85;
    char v46 = v158;
    swift_slowDealloc(v91, -1LL, -1LL);
  }

  else
  {
    v153 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
    v153(v82, v84);
  }

  sub_4FF8((void *)(*(void *)(v0 + 256) + 56LL), *(void *)(*(void *)(v0 + 256) + 80LL));
  sub_35668(v46, v13, v71);
  uint64_t v94 = *(void *)(v0 + 128);
  v93 = *(void **)(v0 + 136);
  v95 = *(void **)(v0 + 144);
  v96 = *(void **)(v0 + 152);
  uint64_t v159 = *(void *)(v0 + 168);
  swift_bridgeObjectRelease(v13);
  sub_B990(v71, (uint64_t)v150);
  uint64_t v97 = *(void *)(v0 + 336);
  uint64_t v98 = *(void *)(v0 + 272);
  if (*(void *)(v0 + 72))
  {
    v146 = v93;
    v155 = v95;
    uint64_t v99 = *(void *)(v0 + 304);
    __int128 v100 = *(_OWORD *)(v0 + 88);
    *(_OWORD *)(v0 + 16) = *v150;
    *(_OWORD *)(v0 + 32) = v100;
    *(_OWORD *)(v0 + 48) = *(_OWORD *)(v0 + 104);
    *(_BYTE *)(v0 + 64) = *(_BYTE *)(v0 + 120);
    uint64_t v101 = v77(v99, v97, v98);
    v102 = (os_log_s *)Logger.logObject.getter(v101);
    os_log_type_t v103 = static os_log_type_t.debug.getter();
    BOOL v104 = os_log_type_enabled(v102, v103);
    uint64_t v105 = *(void *)(v0 + 304);
    uint64_t v106 = *(void *)(v0 + 272);
    if (v104)
    {
      v151 = v96;
      v107 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v148 = swift_slowAlloc(32LL, -1LL);
      v162[0] = v148;
      *(_DWORD *)v107 = 136315138;
      unint64_t v108 = sub_B948();
      uint64_t v109 = dispatch thunk of CustomStringConvertible.description.getter(v106, v108);
      unint64_t v111 = v110;
      *(void *)(v0 + 224) = sub_25824(v109, v110, v162);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 224, v147);
      unint64_t v112 = v111;
      v96 = v151;
      swift_bridgeObjectRelease(v112);
      uint64_t v113 = v106;
      v114 = v153;
      v153(v105, v113);
      _os_log_impl(&dword_0, v102, v103, "[%s]: Finished fetching ConversationData", v107, 0xCu);
      swift_arrayDestroy(v148, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v148, -1LL, -1LL);
      swift_slowDealloc(v107, -1LL, -1LL);
    }

    else
    {
      v114 = v153;
      v153(*(void *)(v0 + 304), *(void *)(v0 + 272));
    }

    v131 = **(void ***)(v0 + 240);
    swift_bridgeObjectRetain(v159);
    swift_bridgeObjectRetain(v94);
    id v132 = v146;
    id v133 = v155;
    id v134 = v96;
    if ((swift_isUniquelyReferenced_nonNull_native(v131) & 1) == 0) {
      v131 = sub_13FEC(0LL, v131[2] + 1LL, 1, v131);
    }
    unint64_t v136 = v131[2];
    unint64_t v135 = v131[3];
    if (v136 >= v135 >> 1) {
      v131 = sub_13FEC((void *)(v135 > 1), v136 + 1, 1, v131);
    }
    uint64_t v137 = *(void *)(v0 + 336);
    uint64_t v138 = *(void *)(v0 + 272);
    v139 = *(void **)(v0 + 240);
    v131[2] = v136 + 1;
    v140 = &v131[7 * v136];
    __int128 v141 = *(_OWORD *)(v0 + 16);
    __int128 v142 = *(_OWORD *)(v0 + 32);
    __int128 v143 = *(_OWORD *)(v0 + 48);
    *((_BYTE *)v140 + 80) = *(_BYTE *)(v0 + 64);
    *((_OWORD *)v140 + 3) = v142;
    *((_OWORD *)v140 + 4) = v143;
    *((_OWORD *)v140 + 2) = v141;
    sub_B9D8(v0 + 128);
    void *v139 = v131;
    v114(v137, v138);
  }

  else
  {
    uint64_t v115 = v77(*(void *)(v0 + 312), v97, v98);
    v116 = (os_log_s *)Logger.logObject.getter(v115);
    os_log_type_t v117 = static os_log_type_t.debug.getter();
    BOOL v118 = os_log_type_enabled(v116, v117);
    uint64_t v119 = *(void *)(v0 + 336);
    uint64_t v120 = *(void *)(v0 + 312);
    uint64_t v121 = *(void *)(v0 + 272);
    if (v118)
    {
      uint64_t v160 = *(void *)(v0 + 336);
      v122 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v123 = swift_slowAlloc(32LL, -1LL);
      v162[0] = v123;
      *(_DWORD *)v122 = 136315138;
      unint64_t v124 = sub_B948();
      uint64_t v125 = dispatch thunk of CustomStringConvertible.description.getter(v121, v124);
      unint64_t v127 = v126;
      uint64_t *v154 = sub_25824(v125, v126, v162);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v154, v0 + 224);
      swift_bridgeObjectRelease(v127);
      uint64_t v128 = v120;
      v129 = v153;
      v153(v128, v121);
      _os_log_impl( &dword_0,  v116,  v117,  "[%s]: ConversationData couldn't be fetched, skipping conversation",  v122,  0xCu);
      swift_arrayDestroy(v123, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v123, -1LL, -1LL);
      swift_slowDealloc(v122, -1LL, -1LL);

      uint64_t v130 = v160;
    }

    else
    {

      uint64_t v144 = v120;
      v129 = v153;
      v153(v144, v121);
      uint64_t v130 = v119;
    }

    v129(v130, v121);
  }

LABEL_13:
  uint64_t v36 = *(void *)(v0 + 328);
  uint64_t v38 = *(void *)(v0 + 312);
  uint64_t v37 = *(void *)(v0 + 320);
  uint64_t v40 = *(void *)(v0 + 296);
  uint64_t v39 = *(void *)(v0 + 304);
  uint64_t v41 = *(void *)(v0 + 288);
  uint64_t v42 = *(void *)(v0 + 264);
  swift_task_dealloc(*(void *)(v0 + 336));
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  swift_task_dealloc(v39);
  swift_task_dealloc(v40);
  swift_task_dealloc(v41);
  swift_task_dealloc(v42);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

  uint64_t v24 = (uint64_t)v95;
  if ((sub_DC4C(v21, (uint64_t)v95) & 1) == 0)
  {
    swift_bridgeObjectRelease(v24);
    goto LABEL_15;
  }

    return 0LL;
  }

  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  sub_4F30(v4, (uint64_t)qword_4FC70);
  uint64_t v5 = v3;
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v6, v7)) {
    goto LABEL_13;
  }
  int v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v9 = swift_slowAlloc(32LL, -1LL);
  *(void *)&uint64_t v38 = v9;
  *(_DWORD *)int v8 = 136315138;
  uint64_t v10 = [v5 identifier];
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  uint64_t v13 = v12;

  uint64_t v34 = sub_25824(v11, v13, (uint64_t *)&v38);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35);

  swift_bridgeObjectRelease(v13);
  char v14 = "Unable to build phonemeData for contact: %s";
LABEL_12:
  _os_log_impl(&dword_0, v6, v7, v14, v8, 0xCu);
  swift_arrayDestroy(v9, 1LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v9, -1LL, -1LL);
  swift_slowDealloc(v8, -1LL, -1LL);

  return 0LL;
}

    unint64_t result = sub_25AAC(a5, a6);
    *a1 = v13;
    return result;
  }

  if ((a6 & 0x1000000000000000LL) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000LL) != 0)
  {
    int v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }

  int v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Unexpectedly found nil while unwrapping an Optional value",  57LL,  2LL,  "Swift/StringTesting.swift",  25LL,  2,  151LL,  0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    unint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawPointer.initializeMemory overlapping range",  58LL,  2LL,  "Swift/UnsafeRawPointer.swift",  28LL,  v14,  1173LL,  0);
    __break(1u);
    return result;
  }

  if (v4 != v3) {
    goto LABEL_15;
  }
  os_log_type_t v7 = 1;
  uint64_t v3 = v4;
LABEL_16:
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  return v7 & 1;
}

uint64_t sub_B2F8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v61 = a3;
  sub_501C(&qword_4AF00);
  ((void (*)(void))__chkstk_darwin)();
  os_log_type_t v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for Date(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v58 - v14;
  Conversation.getTimestamp()(v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8) == 1)
  {
    sub_BA5C((uint64_t)v7, &qword_4AF00);
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v16 = type metadata accessor for Logger(0LL);
    uint64_t v17 = sub_4F30(v16, (uint64_t)qword_4FC70);
    uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl( &dword_0,  v18,  v19,  "No timestamp found in the conversation, skipping joining with CoreDuet events",  v20,  2u);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    uint64_t v22 = Conversation.allTurnsChronologically.getter(v21);
    uint64_t v23 = dispatch thunk of _AnySequenceBox._makeIterator()();
    dispatch thunk of _AnyIteratorBoxBase.next()(&v62);
    uint64_t v24 = v62;
    if (v62)
    {
      uint64_t v25 = _swiftEmptyArrayStorage;
      do
      {
        if ((swift_isUniquelyReferenced_nonNull_native(v25) & 1) == 0) {
          uint64_t v25 = sub_14110(0LL, v25[2] + 1LL, 1, v25);
        }
        unint64_t v27 = v25[2];
        unint64_t v26 = v25[3];
        if (v27 >= v26 >> 1) {
          uint64_t v25 = sub_14110((void *)(v26 > 1), v27 + 1, 1, v25);
        }
        v25[2] = v27 + 1;
        uint64_t v28 = &v25[2 * v27];
        v28[4] = v24;
        v28[5] = _swiftEmptyArrayStorage;
        dispatch thunk of _AnyIteratorBoxBase.next()(&v62);
        uint64_t v24 = v62;
      }

      while (v62);
    }

    else
    {
      uint64_t v25 = _swiftEmptyArrayStorage;
    }

    swift_release(v22);
    uint64_t result = swift_release(v23);
    *uint64_t v61 = (uint64_t)v25;
  }

  else
  {
    uint64_t v60 = a1;
    uint64_t v29 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 32))(v15, v7, v8);
    Date.addingTimeInterval(_:)(v29, 120.0);
    unint64_t v30 = a2 + 13;
    uint64_t v31 = a2[16];
    uint64_t v32 = a2[17];
    sub_4FF8(v30, v31);
    uint64_t v33 = sub_B8FC();
    uint64_t v34 = swift_allocObject( v33,  ((*(unsigned int *)(v33 + 48) + 7LL) & 0x1FFFFFFF8LL) + 16,  *(unsigned __int16 *)(v33 + 52) | 7LL);
    *(_OWORD *)(v34 + 16) = xmmword_38B60;
    *(void *)(v34 + 32) = sub_9C74(0LL, &qword_4AF08, &OBJC_CLASS___INStartCallIntent_ptr);
    *(void *)(v34 + 40) = sub_9C74(0LL, &qword_4AF10, &OBJC_CLASS___INSendMessageIntent_ptr);
    uint64_t v35 = InteractionReader.appInteractions(since:intentTypes:until:)(v15, v34, v12, v31, v32);
    if (v3)
    {
      swift_bridgeObjectRelease(v34);
      uint64_t v36 = *(void (**)(char *, uint64_t))(v9 + 8);
      v36(v12, v8);
      return ((uint64_t (*)(char *, uint64_t))v36)(v15, v8);
    }

    else
    {
      uint64_t v38 = v35;
      uint64_t v39 = swift_bridgeObjectRelease(v34);
      uint64_t v40 = dispatch thunk of _AnySequenceBox.__copyToContiguousArray()(v39);
      uint64_t v41 = swift_release(v38);
      uint64_t v42 = Conversation.allTurnsChronologically.getter(v41);
      uint64_t v43 = dispatch thunk of _AnySequenceBox.__copyToContiguousArray()(v42);
      swift_release(v42);
      uint64_t v44 = type metadata accessor for Turn(0LL);
      uint64_t v45 = type metadata accessor for AppInteraction(0LL);
      uint64_t v46 = static TimeEventUtils.groupAndJoinEvents<A, B>(milestoneEvents:eventsToJoin:)( v43,  v40,  v44,  v45,  &protocol witness table for Turn,  &protocol witness table for AppInteraction);
      swift_release(v43);
      if (qword_4A778 != -1) {
        swift_once(&qword_4A778, sub_349B4);
      }
      uint64_t v47 = type metadata accessor for Logger(0LL);
      sub_4F30(v47, (uint64_t)qword_4FC70);
      swift_bridgeObjectRetain_n(v46, 2LL);
      uint64_t v48 = swift_retain(v40);
      uint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
      os_log_type_t v50 = static os_log_type_t.debug.getter();
      int v51 = v50;
      if (os_log_type_enabled(v49, v50))
      {
        uint64_t v52 = (_DWORD *)swift_slowAlloc(22LL, -1LL);
        LODWORD(v60) = v51;
        uint64_t v53 = v52;
        *uint64_t v52 = 134218240;
        uint64_t v58 = v52 + 1;
        os_log_t v59 = v49;
        uint64_t v54 = *(void *)(v40 + 16);
        swift_release(v40);
        uint64_t v62 = v54;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63);
        swift_release(v40);
        *((_WORD *)v53 + 6) = 2048;
        uint64_t v58 = (_DWORD *)((char *)v53 + 14);
        uint64_t v55 = *(void *)(v46 + 16);
        swift_bridgeObjectRelease(v46);
        uint64_t v62 = v55;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63);
        swift_bridgeObjectRelease(v46);
        os_log_t v56 = v59;
        _os_log_impl( &dword_0,  v59,  (os_log_type_t)v60,  "Found %ld call/message events, grouped into %ld turnEventPairs",  (uint8_t *)v53,  0x16u);
        swift_slowDealloc(v53, -1LL, -1LL);
      }

      else
      {

        swift_release_n(v40, 2LL);
        swift_bridgeObjectRelease_n(v46, 2LL);
      }

      BOOL v57 = *(void (**)(char *, uint64_t))(v9 + 8);
      v57(v12, v8);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v57)(v15, v8);
      *uint64_t v61 = v46;
    }
  }

  return result;
}

uint64_t sub_B898()
{
  return swift_deallocClassInstance(v0, 192LL, 7LL);
}

uint64_t type metadata accessor for ConversationDataController()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin26ConversationDataController);
}

uint64_t sub_B8FC()
{
  uint64_t v0 = sub_501C(&qword_4AF18);
  else {
    uint64_t v1 = 0LL;
  }
  if (v1) {
    uint64_t v2 = &qword_4ABB0;
  }
  else {
    uint64_t v2 = (uint64_t *)&unk_4AF20;
  }
  return sub_501C(v2);
}

unint64_t sub_B948()
{
  unint64_t result = qword_4ABD0;
  if (!qword_4ABD0)
  {
    uint64_t v1 = type metadata accessor for UUID(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UUID, v1);
    atomic_store(result, (unint64_t *)&qword_4ABD0);
  }

  return result;
}

uint64_t sub_B990(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_501C(&qword_4AEF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_B9D8(uint64_t a1)
{
  return a1;
}

uint64_t sub_BA10(uint64_t result, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  if (result)
  {
    swift_bridgeObjectRelease(result);

    return swift_bridgeObjectRelease(a6);
  }

  return result;
}

uint64_t sub_BA5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_501C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

void sub_BA98()
{
  qword_4FC10 = 0x746361746E6F635CLL;
  *(void *)algn_4FC18 = 0xE90000000000002DLL;
}

void sub_BAC0(uint64_t (**a1)(char *, unint64_t, uint64_t))
{
  uint64_t v3 = sub_501C(&qword_4B010);
  __chkstk_darwin(v3);
  uint64_t v73 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v74 = type metadata accessor for ASRLogLinks(0LL);
  uint64_t v5 = *(uint64_t (***)(char *, unint64_t, uint64_t))(v74 - 8);
  __chkstk_darwin(v74);
  uint64_t v71 = (char *)&v68 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v77 = type metadata accessor for UUID(0LL);
  unint64_t v7 = *(void *)(v77 - 8);
  uint64_t v8 = __chkstk_darwin(v77);
  uint64_t v76 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v68 - v11;
  uint64_t v13 = Turn.events.getter(v10);
  uint64_t v14 = dispatch thunk of ASRFeatureExtractor.extract(from:)();
  uint64_t v16 = v15;
  uint64_t v17 = swift_bridgeObjectRelease(v13);
  if (*(void *)(v14 + 16))
  {
    uint64_t v75 = v16;
    Turn.turnID.getter(v17);
    uint64_t v18 = sub_C288((uint64_t)v12, v14);
    if (v1)
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v77);
      swift_bridgeObjectRelease(v14);
      swift_bridgeObjectRelease(v75);
      return;
    }

    unint64_t v70 = v18;
    uint64_t v72 = 0LL;
    uint64_t v32 = v77;
    unint64_t v69 = *(void (**)(char *, uint64_t))(v7 + 8);
    v69(v12, v77);
    swift_bridgeObjectRelease(v14);
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v33 = type metadata accessor for Logger(0LL);
    sub_4F30(v33, (uint64_t)qword_4FC70);
    uint64_t v34 = v70;
    uint64_t v35 = swift_bridgeObjectRetain(v70);
    uint64_t v36 = (os_log_s *)Logger.logObject.getter(v35);
    os_log_type_t v37 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v36, v37))
    {
      uint64_t v38 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v38 = 134217984;
      *(void *)&__int128 v78 = v34[2];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, (char *)&v78 + 8);
      swift_bridgeObjectRelease(v34);
      _os_log_impl(&dword_0, v36, v37, "Fetched %ld asrContactTokens", v38, 0xCu);
      swift_slowDealloc(v38, -1LL, -1LL);
    }

    else
    {

      uint64_t v39 = swift_bridgeObjectRelease(v34);
    }

    uint64_t v40 = Turn.events.getter(v39);
    uint64_t v41 = v40;
    if ((unint64_t)v40 >> 62)
    {
      if (v40 >= 0) {
        v40 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      uint64_t v42 = _CocoaArrayWrapper.endIndex.getter(v40);
      if (!v42) {
        goto LABEL_30;
      }
    }

    else
    {
      uint64_t v42 = *(void *)((char *)&dword_10 + (v40 & 0xFFFFFFFFFFFFF8LL));
      if (!v42) {
        goto LABEL_30;
      }
    }

    unint64_t v43 = 0LL;
    unint64_t v7 = v41 & 0xC000000000000001LL;
    while (1)
    {
      if (v7)
      {
        swift_bridgeObjectRetain(v41);
        id v44 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v43, v41);
      }

      else
      {
        uint64_t v45 = *(void **)(v41 + 8 * v43 + 32);
        swift_bridgeObjectRetain(v41);
        id v44 = v45;
      }

      uint64_t v46 = v44;
      uint64_t v47 = (void *)static ORCHEvents.requestID(_:)();
      swift_bridgeObjectRelease(v41);

      if (v47) {
        break;
      }
      unint64_t v48 = v43 + 1;
      if (__OFADD__(v43, 1LL))
      {
        __break(1u);
        goto LABEL_45;
      }

      ++v43;
      if (v48 == v42) {
        goto LABEL_30;
      }
    }

    if (v42 == v43) {
      goto LABEL_30;
    }
    if (v7)
    {
      id v49 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v43, v41);
    }

    else
    {
      if ((v43 & 0x8000000000000000LL) != 0) {
        goto LABEL_51;
      }
      if (v43 >= *(void *)((char *)&dword_10 + (v41 & 0xFFFFFFFFFFFFF8LL)))
      {
LABEL_52:
        __break(1u);
LABEL_53:
        __break(1u);
        return;
      }

      id v49 = *(id *)(v41 + 8 * v43 + 32);
    }

    os_log_type_t v50 = v49;
    uint64_t v51 = static ORCHEvents.requestID(_:)();

    if (!v51) {
      goto LABEL_53;
    }
LABEL_30:
    swift_bridgeObjectRelease(v41);
    uint64_t v52 = *(void *)(v75 + 16);
    if (v52
      && (uint64_t v53 = v71,
          uint64_t v54 = v74,
          uint64_t v55 = v5[2]( v71,  v75 + ((*((unsigned __int8 *)v5 + 80) + 32LL) & ~(unint64_t)*((unsigned __int8 *)v5 + 80)),  v74),  v56 = (void *)ASRLogLinks.rawRecognitionLinkId.getter(v55),  ((void (*)(char *, uint64_t))v5[1])(v53, v54),  v56))
    {
      *((void *)&v79 + 1) = sub_DB10();
      *(void *)&__int128 v78 = v56;
    }

    else
    {
      os_log_t v56 = 0LL;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
    }

    id v57 = v56;
    uint64_t v58 = (uint64_t)v76;
    Turn.turnID.getter(v57);
    sub_D89C((uint64_t)&v78, 0xD000000000000014LL, 0x800000000003B340LL, v58);
    uint64_t v59 = v58;
    uint64_t v60 = (void (*)(uint64_t, uint64_t))v69;
    v69((char *)v59, v32);
    sub_BA5C((uint64_t)&v78, (uint64_t *)&unk_4AC00);
    if (!v52)
    {
      uint64_t v64 = 1LL;
      uint64_t v62 = (uint64_t)v73;
      uint64_t v63 = v74;
      uint64_t v61 = v75;
LABEL_38:
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v5[7])(v62, v64, 1LL, v63);
      swift_bridgeObjectRelease(v61);
      if (v5[6]((char *)v62, 1uLL, v63) == 1)
      {
        sub_BA5C(v62, &qword_4B010);
      }

      else
      {
        unint64_t v65 = (void *)ASRLogLinks.postITNLinkID.getter();
        ((void (*)(uint64_t, uint64_t))v5[1])(v62, v63);
        if (v65)
        {
          *((void *)&v79 + 1) = sub_DB10();
          *(void *)&__int128 v78 = v65;
LABEL_43:
          id v66 = v65;
          uint64_t v67 = (uint64_t)v76;
          Turn.turnID.getter(v66);
          sub_D89C((uint64_t)&v78, 0x4C4E544974736F70LL, 0xED000044496B6E69LL, v67);
          v60(v67, v77);
          sub_BA5C((uint64_t)&v78, (uint64_t *)&unk_4AC00);
          return;
        }
      }

      unint64_t v65 = 0LL;
      __int128 v78 = 0u;
      __int128 v79 = 0u;
      goto LABEL_43;
    }

    uint64_t v61 = v75;
    if (*(void *)(v75 + 16))
    {
      uint64_t v62 = (uint64_t)v73;
      uint64_t v63 = v74;
      v5[2](v73, v75 + ((*((unsigned __int8 *)v5 + 80) + 32LL) & ~(unint64_t)*((unsigned __int8 *)v5 + 80)), v74);
      uint64_t v64 = 0LL;
      goto LABEL_38;
    }

    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }

  uint64_t v5 = a1;
  uint64_t v72 = v1;
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v16);
  if (qword_4A778 != -1) {
LABEL_45:
  }
    swift_once(&qword_4A778, sub_349B4);
  uint64_t v19 = type metadata accessor for Logger(0LL);
  sub_4F30(v19, (uint64_t)qword_4FC70);
  uint64_t v20 = swift_retain_n(v5, 2LL);
  uint64_t v21 = (os_log_s *)Logger.logObject.getter(v20);
  os_log_type_t v22 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v24 = swift_slowAlloc(32LL, -1LL);
    uint64_t v75 = v24;
    *(void *)&__int128 v78 = v24;
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v74 = (uint64_t)(v23 + 4);
    uint64_t v25 = v76;
    Turn.turnID.getter(v24);
    unint64_t v26 = sub_B948();
    uint64_t v27 = v77;
    uint64_t v28 = dispatch thunk of CustomStringConvertible.description.getter(v77, v26);
    uint64_t v73 = (char *)v5;
    unint64_t v30 = v29;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v25, v27);
    uint64_t v80 = sub_25824(v28, v30, (uint64_t *)&v78);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81);
    swift_release_n(v73, 2LL);
    swift_bridgeObjectRelease(v30);
    _os_log_impl(&dword_0, v21, v22, "[%s]: No ASR features found for turn", v23, 0xCu);
    uint64_t v31 = v75;
    swift_arrayDestroy(v75, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1LL, -1LL);
    swift_slowDealloc(v23, -1LL, -1LL);
  }

  else
  {

    swift_release_n(v5, 2LL);
  }

void *sub_C288(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for UUID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_1FB9C(a2);
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(v9 + 16);
  if (!v11)
  {
    uint64_t v9 = swift_bridgeObjectRelease(v9);
LABEL_14:
    uint64_t v27 = (void *)UUID.uuidString.getter(v9);
    uint64_t v29 = v28;
    unint64_t v30 = sub_D400();
    uint64_t v31 = swift_allocError(&type metadata for ASRLoggedTokenFetcherError, v30, 0LL, 0LL);
    *(void *)uint64_t v32 = v27;
    *(void *)(v32 + 8) = v29;
    *(_BYTE *)(v32 + 16) = 0;
LABEL_21:
    swift_willThrow(v31);
    return v27;
  }

  uint64_t v71 = v2;
  uint64_t v12 = sub_1FBA8(a2);
  if (!v12)
  {
LABEL_16:
    uint64_t v33 = swift_bridgeObjectRelease(v10);
    uint64_t v27 = (void *)UUID.uuidString.getter(v33);
    uint64_t v35 = v34;
    unint64_t v36 = sub_D400();
    uint64_t v31 = swift_allocError(&type metadata for ASRLoggedTokenFetcherError, v36, 0LL, 0LL);
    *(void *)uint64_t v37 = v27;
    *(void *)(v37 + 8) = v35;
    char v38 = 1;
LABEL_20:
    *(_BYTE *)(v37 + 16) = v38;
    goto LABEL_21;
  }

  uint64_t v13 = v12;
  if (!*(void *)(v12 + 16))
  {
    swift_bridgeObjectRelease(v12);
    goto LABEL_16;
  }

  uint64_t v14 = sub_1FD38(a2);
  if (!v14)
  {
LABEL_18:
    swift_bridgeObjectRelease(v13);
    uint64_t v39 = swift_bridgeObjectRelease(v10);
    uint64_t v27 = (void *)UUID.uuidString.getter(v39);
    uint64_t v41 = v40;
    unint64_t v42 = sub_D400();
    uint64_t v31 = swift_allocError(&type metadata for ASRLoggedTokenFetcherError, v42, 0LL, 0LL);
    *(void *)uint64_t v37 = v27;
    *(void *)(v37 + 8) = v41;
    char v38 = 2;
    goto LABEL_20;
  }

  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(v14 + 16);
  if (!v16)
  {
    swift_bridgeObjectRelease(v14);
    goto LABEL_18;
  }

  uint64_t v17 = *(void *)(v13 + 16);
  if (v17 != *(void *)(v10 + 16) || v16 != v17)
  {
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(v13);
    uint64_t v43 = swift_bridgeObjectRelease(v15);
    uint64_t v27 = (void *)UUID.uuidString.getter(v43);
    uint64_t v45 = v44;
    unint64_t v46 = sub_D400();
    uint64_t v31 = swift_allocError(&type metadata for ASRLoggedTokenFetcherError, v46, 0LL, 0LL);
    *(void *)uint64_t v37 = v27;
    *(void *)(v37 + 8) = v45;
    char v38 = 3;
    goto LABEL_20;
  }

  uint64_t v70 = v13;
  swift_bridgeObjectRetain(v10);
  os_log_t v18 = (os_log_t)sub_D4D8(0LL, v11, v10);
  swift_bridgeObjectRelease(v10);
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v19 = type metadata accessor for Logger(0LL);
  uint64_t v20 = sub_4F30(v19, (uint64_t)qword_4FC70);
  uint64_t v21 = swift_bridgeObjectRetain(v18);
  uint64_t v67 = v20;
  os_log_type_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v23 = static os_log_type_t.debug.getter();
  int v68 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    unint64_t v69 = v18;
    uint64_t v25 = v22;
    unint64_t v26 = v24;
    *(_DWORD *)uint64_t v24 = 134217984;
    uint64_t v74 = *((void *)v69 + 2);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75);
    swift_bridgeObjectRelease(v69);
    _os_log_impl(&dword_0, v25, (os_log_type_t)v68, "Found %ld ASR indices containing contact tags", v26, 0xCu);
    swift_slowDealloc(v26, -1LL, -1LL);

    os_log_t v18 = v69;
  }

  else
  {

    swift_bridgeObjectRelease(v18);
  }

  uint64_t v48 = v70;
  if (*((void *)v18 + 2))
  {
    swift_bridgeObjectRetain(v10);
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v48);
    swift_bridgeObjectRetain(v15);
    uint64_t v49 = v71;
    swift_retain(v71);
    uint64_t v50 = v48;
    uint64_t v27 = sub_D714((uint64_t)v18, v10, v48, v15, v49, (uint64_t)v18);
    swift_bridgeObjectRelease_n(v10, 2LL);
    swift_bridgeObjectRelease_n(v50, 2LL);
    swift_bridgeObjectRelease_n(v15, 2LL);
    swift_release(v49);
    swift_bridgeObjectRelease_n(v18, 2LL);
  }

  else
  {
    swift_bridgeObjectRelease(v18);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v48);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
    uint64_t v51 = swift_bridgeObjectRetain(v10);
    uint64_t v52 = (os_log_s *)Logger.logObject.getter(v51);
    os_log_type_t v53 = static os_log_type_t.debug.getter();
    int v54 = v53;
    if (os_log_type_enabled(v52, v53))
    {
      uint64_t v55 = swift_slowAlloc(22LL, -1LL);
      LODWORD(v71) = v54;
      uint64_t v56 = v55;
      uint64_t v70 = swift_slowAlloc(64LL, -1LL);
      uint64_t v74 = v70;
      *(_DWORD *)uint64_t v56 = 136315394;
      unint64_t v57 = sub_B948();
      unint64_t v69 = v52;
      uint64_t v58 = dispatch thunk of CustomStringConvertible.description.getter(v5, v57);
      unint64_t v60 = v59;
      uint64_t v72 = sub_25824(v58, v59, &v74);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73);
      swift_bridgeObjectRelease(v60);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      *(_WORD *)(v56 + 1sub_541C(v0 + 2) = 2080;
      uint64_t v61 = swift_bridgeObjectRetain(v10);
      uint64_t v62 = Array.description.getter(v61, &type metadata for String);
      unint64_t v64 = v63;
      swift_bridgeObjectRelease(v10);
      uint64_t v72 = sub_25824(v62, v64, &v74);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v72, &v73);
      swift_bridgeObjectRelease_n(v10, 2LL);
      swift_bridgeObjectRelease(v64);
      os_log_t v65 = v69;
      _os_log_impl(&dword_0, v69, (os_log_type_t)v71, "[%s]: No contact found in ASR for %s", (uint8_t *)v56, 0x16u);
      uint64_t v66 = v70;
      swift_arrayDestroy(v70, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v66, -1LL, -1LL);
      swift_slowDealloc(v56, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

      swift_bridgeObjectRelease_n(v10, 2LL);
    }

    return _swiftEmptyArrayStorage;
  }

  return v27;
}

double sub_C888@<D0>( unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  unint64_t v9 = *a1;
  if ((*a1 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v7 = a2;
  unint64_t v10 = *(void *)(a2 + 16);
  if (v9 >= v10)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  uint64_t v44 = a7;
  uint64_t v14 = a2 + 16 * v9;
  uint64_t v16 = *(void *)(v14 + 32);
  unint64_t v15 = *(void *)(v14 + 40);
  uint64_t v8 = (uint64_t *)(v14 + 32);
  swift_bridgeObjectRetain(v15);
  uint64_t v17 = sub_CB80(v16, v15);
  unsigned __int8 v42 = v18;
  uint64_t v43 = v17;
  uint64_t v20 = v19;
  swift_bridgeObjectRelease(v15);
  if (v20)
  {
    if (v9 < *(void *)(a3 + 16))
    {
      if (v9 < *(void *)(a4 + 16))
      {
        uint64_t v21 = a3 + 16 * v9;
        uint64_t v23 = *(void *)(v21 + 32);
        uint64_t v22 = *(void *)(v21 + 40);
        uint64_t v24 = *(void *)(a4 + 8 * v9 + 32);
        uint64_t v25 = 24LL;
        if (v10 == *(void *)(a6 + 16)) {
          uint64_t v25 = 32LL;
        }
        BOOL v26 = *(double *)(a5 + v25) <= (double)v24;
        uint64_t v27 = (objc_class *)type metadata accessor for PhonemeString();
        uint64_t v28 = objc_allocWithZone(v27);
        uint64_t v29 = &v28[OBJC_IVAR___PhonemeString_symbols];
        *uint64_t v29 = v23;
        v29[1] = v22;
        v28[OBJC_IVAR___PhonemeString_encoding] = 0;
        unint64_t v30 = &v28[OBJC_IVAR___PhonemeString_boundary];
        *unint64_t v30 = 32LL;
        v30[1] = 0xE100000000000000LL;
        v45.receiver = v28;
        v45.super_class = v27;
        swift_bridgeObjectRetain(v22);
        id v31 = objc_msgSendSuper2(&v45, "init");
        *(void *)uint64_t v44 = v43;
        *(void *)(v44 + 8) = v20;
        *(void *)(v44 + 16) = v42;
        *(void *)(v44 + 24) = v31;
        *(void *)(v44 + 3sub_541C(v0 + 2) = v24;
        *(_BYTE *)(v44 + 40) = v26;
        return result;
      }

      goto LABEL_17;
    }

LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }

  if (qword_4A778 != -1) {
LABEL_18:
  }
    swift_once(&qword_4A778, sub_349B4);
  uint64_t v33 = type metadata accessor for Logger(0LL);
  sub_4F30(v33, (uint64_t)qword_4FC70);
  uint64_t v34 = swift_bridgeObjectRetain(v7);
  uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
  os_log_type_t v36 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v38 = swift_slowAlloc(32LL, -1LL);
    uint64_t v48 = v38;
    *(_DWORD *)uint64_t v37 = 136315138;
    uint64_t v39 = *v8;
    unint64_t v40 = v8[1];
    swift_bridgeObjectRetain(v40);
    uint64_t v46 = sub_25824(v39, v40, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);
    swift_bridgeObjectRelease(v7);
    swift_bridgeObjectRelease(v40);
    _os_log_impl(&dword_0, v35, v36, "Couldn't build ASRContactName from %s", v37, 0xCu);
    swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v38, -1LL, -1LL);
    swift_slowDealloc(v37, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(v7);
  }

  double result = 0.0;
  *(_OWORD *)(v44 + 25) = 0u;
  *(_OWORD *)uint64_t v44 = 0u;
  *(_OWORD *)(v44 + 16) = 0u;
  return result;
}

uint64_t sub_CB80(uint64_t a1, unint64_t a2)
{
  v58[0] = type metadata accessor for CharacterSet(0LL);
  uint64_t v4 = *(void *)(v58[0] - 8LL);
  __chkstk_darwin(v58[0]);
  uint64_t v6 = (char *)v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v7 = type metadata accessor for Logger(0LL);
  uint64_t v8 = sub_4F30(v7, (uint64_t)qword_4FC70);
  uint64_t v9 = swift_bridgeObjectRetain_n(a2, 2LL);
  v58[1] = v8;
  unint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v63 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v61 = sub_25824(a1, a2, &v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl(&dword_0, v10, v11, "toASRContactName for ASR token %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  uint64_t v63 = a1;
  unint64_t v64 = a2;
  uint64_t v61 = 3158110LL;
  unint64_t v62 = 0xE300000000000000LL;
  unint64_t v14 = sub_53D8();
  unint64_t v15 = (void *)StringProtocol.components<A>(separatedBy:)( &v61,  &type metadata for String,  &type metadata for String,  v14,  v14);
  uint64_t v16 = v15;
  if (v15[2] != 1LL)
  {
    uint64_t v35 = swift_bridgeObjectRelease(v15);
    uint64_t v28 = (void *)Logger.logObject.getter(v35);
    os_log_type_t v36 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled((os_log_t)v28, v36))
    {
LABEL_30:

      return 0LL;
    }

    uint64_t v37 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v37 = 0;
    uint64_t v38 = "Multiple name parts not supported. Skipping this ASR token.";
    uint64_t v39 = (os_log_s *)v28;
    os_log_type_t v40 = v36;
    uint64_t v41 = v37;
    uint32_t v42 = 2;
    goto LABEL_17;
  }

  uint64_t v17 = v15[4];
  unint64_t v18 = v15[5];
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v16);
  uint64_t v63 = v17;
  unint64_t v64 = v18;
  if (qword_4A700 != -1) {
    swift_once(&qword_4A700, sub_BA98);
  }
  uint64_t v61 = qword_4FC10;
  unint64_t v62 = *(void *)algn_4FC18;
  uint64_t v19 = (void *)StringProtocol.components<A>(separatedBy:)( &v61,  &type metadata for String,  &type metadata for String,  v14,  v14);
  swift_bridgeObjectRelease(v18);
  uint64_t v20 = v19[2];
  if (v20 != 2)
  {
    uint64_t v43 = swift_bridgeObjectRetain(v19);
    uint64_t v28 = (void *)Logger.logObject.getter(v43);
    os_log_type_t v44 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled((os_log_t)v28, v44))
    {

      int v54 = v19;
      goto LABEL_32;
    }

    uint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v37 = 134217984;
    swift_bridgeObjectRelease(v19);
    uint64_t v63 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64);
    swift_bridgeObjectRelease(v19);
    uint64_t v38 = "Invalid token format. Expected 2 components, actual: %ld. Skipping this ASR token.";
    uint64_t v39 = (os_log_s *)v28;
    os_log_type_t v40 = v44;
    uint64_t v41 = v37;
    uint32_t v42 = 12;
LABEL_17:
    _os_log_impl(&dword_0, v39, v40, v38, v41, v42);
    objc_super v45 = v37;
LABEL_29:
    swift_slowDealloc(v45, -1LL, -1LL);
    goto LABEL_30;
  }

  unint64_t v21 = v19[5];
  uint64_t v63 = v19[4];
  unint64_t v64 = v21;
  uint64_t v61 = 3158622LL;
  unint64_t v62 = 0xE300000000000000LL;
  uint64_t v59 = 32LL;
  unint64_t v60 = 0xE100000000000000LL;
  uint64_t v63 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v61,  &v59,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v14,  v14,  v14);
  unint64_t v64 = v22;
  ((void (*)(void))static CharacterSet.whitespaces.getter)();
  uint64_t v23 = StringProtocol.trimmingCharacters(in:)(v6, &type metadata for String, v14);
  unint64_t v25 = v24;
  BOOL v26 = *(void (**)(char *, void))(v4 + 8);
  v26(v6, v58[0]);
  swift_bridgeObjectRelease(v64);
  uint64_t v63 = v23;
  unint64_t v64 = v25;
  uint64_t v61 = 32LL;
  unint64_t v62 = 0xE100000000000000LL;
  if ((StringProtocol.contains<A>(_:)(&v61, &type metadata for String, &type metadata for String, v14, v14) & 1) != 0)
  {
    swift_bridgeObjectRelease(v19);
    uint64_t v27 = swift_bridgeObjectRetain(v25);
    uint64_t v28 = (void *)Logger.logObject.getter(v27);
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v28, v29))
    {
      uint64_t v30 = swift_slowAlloc(12LL, -1LL);
      uint64_t v31 = swift_slowAlloc(32LL, -1LL);
      uint64_t v63 = v31;
      *(_DWORD *)uint64_t v30 = 136315138;
      swift_bridgeObjectRetain(v25);
      uint64_t v61 = sub_25824(v23, v25, &v63);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62);
      swift_bridgeObjectRelease_n(v25, 3LL);
      _os_log_impl( &dword_0,  (os_log_t)v28,  v29,  "Multiple words in name text %s not supported. Skipping this ASR token.",  (uint8_t *)v30,  0xCu);
      uint64_t v32 = (char *)&type metadata for Any + 8;
      uint64_t v33 = v31;
      uint64_t v34 = 1LL;
LABEL_28:
      swift_arrayDestroy(v33, v34, v32);
      swift_slowDealloc(v31, -1LL, -1LL);
      objc_super v45 = (uint8_t *)v30;
      goto LABEL_29;
    }

    int v54 = (void *)v25;
    goto LABEL_32;
  }

  if (v19[2] < 2uLL)
  {
    __break(1u);
  }

  else
  {
    uint64_t v46 = v19[6];
    unint64_t v47 = v19[7];
    swift_bridgeObjectRetain(v47);
    swift_bridgeObjectRelease(v19);
    uint64_t v63 = v46;
    unint64_t v64 = v47;
    uint64_t v61 = 3158622LL;
    unint64_t v62 = 0xE300000000000000LL;
    uint64_t v59 = 32LL;
    unint64_t v60 = 0xE100000000000000LL;
    uint64_t v48 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( &v61,  &v59,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v14,  v14,  v14);
    unint64_t v50 = v49;
    uint64_t v51 = swift_bridgeObjectRelease(v47);
    uint64_t v63 = v48;
    unint64_t v64 = v50;
    static CharacterSet.whitespaces.getter(v51);
    uint64_t v19 = (void *)StringProtocol.trimmingCharacters(in:)(v6, &type metadata for String, v14);
    unint64_t v14 = v52;
    v26(v6, v58[0]);
    swift_bridgeObjectRelease(v64);
    if (qword_4A708 == -1) {
      goto LABEL_20;
    }
  }

  swift_once(&qword_4A708, sub_D444);
LABEL_20:
  if (!*(void *)((char *)&dword_10 + (void)off_4AF28))
  {
LABEL_26:
    swift_bridgeObjectRetain(v14);
    uint64_t v55 = swift_bridgeObjectRetain(v25);
    uint64_t v28 = (void *)Logger.logObject.getter(v55);
    os_log_type_t v56 = static os_log_type_t.error.getter();
    if (os_log_type_enabled((os_log_t)v28, v56))
    {
      uint64_t v30 = swift_slowAlloc(22LL, -1LL);
      uint64_t v31 = swift_slowAlloc(64LL, -1LL);
      uint64_t v63 = v31;
      *(_DWORD *)uint64_t v30 = 136315394;
      swift_bridgeObjectRetain(v14);
      uint64_t v61 = sub_25824((uint64_t)v19, v14, &v63);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62);
      swift_bridgeObjectRelease_n(v14, 3LL);
      *(_WORD *)(v30 + 1sub_541C(v0 + 2) = 2080;
      swift_bridgeObjectRetain(v25);
      uint64_t v61 = sub_25824(v23, v25, &v63);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v61, &v62);
      swift_bridgeObjectRelease_n(v25, 3LL);
      _os_log_impl( &dword_0,  (os_log_t)v28,  v56,  "Name part %s invalid for name %s. Skipping this ASR token.",  (uint8_t *)v30,  0x16u);
      uint64_t v32 = (char *)&type metadata for Any + 8;
      uint64_t v33 = v31;
      uint64_t v34 = 2LL;
      goto LABEL_28;
    }

    swift_bridgeObjectRelease_n(v25, 2LL);
    int v54 = (void *)v14;
LABEL_32:
    swift_bridgeObjectRelease_n(v54, 2LL);
    return 0LL;
  }

  swift_bridgeObjectRetain(v14);
  sub_2DEC8((uint64_t)v19, v14);
  if ((v53 & 1) == 0)
  {
    swift_bridgeObjectRelease(v14);
    goto LABEL_26;
  }

  swift_bridgeObjectRelease_n(v14, 2LL);
  return v23;
}

uint64_t sub_D3BC()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for ASRLoggedContactTokensProcessor()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin31ASRLoggedContactTokensProcessor);
}

unint64_t sub_D400()
{
  unint64_t result = qword_4B000;
  if (!qword_4B000)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A074, &type metadata for ASRLoggedTokenFetcherError);
    atomic_store(result, (unint64_t *)&qword_4B000);
  }

  return result;
}

int *sub_D444()
{
  uint64_t v0 = sub_501C(&qword_4B008);
  uint64_t inited = swift_initStackObject(v0, v3);
  *(_OWORD *)(inited + 16) = xmmword_38C30;
  *(void *)(inited + 3sub_541C(v0 + 2) = 0x7473726966LL;
  *(void *)(inited + 40) = 0xE500000000000000LL;
  *(_BYTE *)(inited + 48) = 0;
  *(void *)(inited + 56) = 1953718636LL;
  *(void *)(inited + 64) = 0xE400000000000000LL;
  *(_BYTE *)(inited + 7sub_541C(v0 + 2) = 1;
  *(void *)(inited + 80) = 0x656D616E6B63696ELL;
  *(void *)(inited + 88) = 0xE800000000000000LL;
  *(_BYTE *)(inited + 96) = 2;
  unint64_t result = (int *)sub_1B1B8(inited);
  off_4AF28 = result;
  return result;
}

uint64_t sub_D4D8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result == a2) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v5 = result;
  if (a2 >= result)
  {
    uint64_t v6 = a3 + 40;
    uint64_t v21 = a2 - 1;
    uint64_t v3 = _swiftEmptyArrayStorage;
    uint64_t v7 = result;
    uint64_t v22 = a3 + 40;
    do
    {
      uint64_t v23 = v3;
      if (v7 <= a2) {
        uint64_t v8 = a2;
      }
      else {
        uint64_t v8 = v7;
      }
      uint64_t v24 = v8;
      uint64_t v9 = (uint64_t *)(v6 + 16 * v7);
      unint64_t v10 = v7;
      while (1)
      {
        if (v7 < v5)
        {
          __break(1u);
LABEL_25:
          __break(1u);
LABEL_26:
          __break(1u);
LABEL_27:
          __break(1u);
          goto LABEL_28;
        }

        if (v24 == v10) {
          goto LABEL_25;
        }
        if (v7 < 0) {
          goto LABEL_26;
        }
        if (v10 >= *(void *)(a3 + 16)) {
          goto LABEL_27;
        }
        uint64_t v11 = *(v9 - 1);
        uint64_t v12 = *v9;
        uint64_t v13 = sub_501C((uint64_t *)&unk_4B6A0);
        uint64_t inited = swift_initStackObject(v13, v27);
        *(_OWORD *)(inited + 16) = xmmword_38B10;
        uint64_t v15 = qword_4A700;
        swift_bridgeObjectRetain(v12);
        if (v15 != -1) {
          swift_once(&qword_4A700, sub_BA98);
        }
        uint64_t v16 = qword_4FC10;
        uint64_t v17 = *(void *)algn_4FC18;
        *(void *)(inited + 3sub_541C(v0 + 2) = qword_4FC10;
        *(void *)(inited + 40) = v17;
        v26[2] = v11;
        v26[3] = v12;
        v26[0] = v16;
        v26[1] = v17;
        unint64_t v18 = sub_53D8();
        swift_bridgeObjectRetain(v17);
        LOBYTE(v1sub_541C(v0 + 7) = StringProtocol.contains<A>(_:)( v26,  &type metadata for String,  &type metadata for String,  v18,  v18);
        swift_bridgeObjectRelease(inited);
        unint64_t result = swift_bridgeObjectRelease(v12);
        if ((v17 & 1) != 0) {
          break;
        }
        ++v10;
        v9 += 2;
        if (a2 == v10) {
          return (uint64_t)v23;
        }
      }

      uint64_t v3 = v23;
      unint64_t result = swift_isUniquelyReferenced_nonNull_native(v23);
      uint64_t v28 = v23;
      if ((result & 1) == 0)
      {
        unint64_t result = sub_337CC(0, v23[2] + 1LL, 1);
        uint64_t v3 = v28;
      }

      unint64_t v20 = v3[2];
      unint64_t v19 = v3[3];
      if (v20 >= v19 >> 1)
      {
        unint64_t result = sub_337CC(v19 > 1, v20 + 1, 1);
        uint64_t v3 = v28;
      }

      uint64_t v7 = v10 + 1;
      v3[2] = v20 + 1;
      v3[v20 + 4] = v10;
      uint64_t v6 = v22;
    }

    while (v21 != v10);
    return (uint64_t)v3;
  }

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
}

  __break(1u);
  return result;
}

      swift_release(a2);
      sub_2B914((uint64_t)&v47);
      uint64_t v30 = &v47;
LABEL_29:
      sub_1F938((uint64_t)v30, a3, &qword_4BC58);
      return;
    }

void *sub_D714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v19 = *(void *)(a1 + 16);
  if (!v19) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v7 = a1;
  uint64_t v8 = 0LL;
  uint64_t v9 = _swiftEmptyArrayStorage;
  uint64_t v18 = swift_bridgeObjectRetain(a1);
  do
  {
    unint64_t v33 = *(void *)(v7 + 8 * v8 + 32);
    sub_C888(&v33, a2, a3, a4, a5, a6, (uint64_t)&v27);
    if (v6)
    {
      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(v7);
      return v9;
    }

    uint64_t v11 = v28;
    if (v28)
    {
      uint64_t v12 = v27;
      uint64_t v13 = v30;
      uint64_t v25 = v31;
      char v26 = v29;
      char v14 = v32;
      if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0) {
        uint64_t v9 = sub_13EB8(0LL, v9[2] + 1LL, 1, v9);
      }
      unint64_t v16 = v9[2];
      unint64_t v15 = v9[3];
      if (v16 >= v15 >> 1) {
        uint64_t v9 = sub_13EB8((void *)(v15 > 1), v16 + 1, 1, v9);
      }
      v9[2] = v16 + 1;
      unint64_t v10 = &v9[6 * v16];
      v10[4] = v12;
      v10[5] = v11;
      *((_BYTE *)v10 + 48) = v26;
      v10[7] = v13;
      v10[8] = v25;
      *((_BYTE *)v10 + 7sub_541C(v0 + 2) = v14 & 1;
      uint64_t v7 = v18;
    }

    ++v8;
  }

  while (v19 != v8);
  swift_bridgeObjectRelease(v7);
  return v9;
}

void sub_D89C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!*(void *)(a1 + 24))
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v12 = type metadata accessor for Logger(0LL);
    sub_4F30(v12, (uint64_t)qword_4FC70);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a4, v8);
    uint64_t v13 = swift_bridgeObjectRetain_n(a3, 2LL);
    char v14 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = swift_slowAlloc(22LL, -1LL);
      uint64_t v23 = a2;
      uint64_t v17 = v16;
      uint64_t v24 = swift_slowAlloc(64LL, -1LL);
      uint64_t v26 = v24;
      *(_DWORD *)uint64_t v17 = 136315394;
      unint64_t v18 = sub_B948();
      uint64_t v19 = dispatch thunk of CustomStringConvertible.description.getter(v8, v18);
      unint64_t v21 = v20;
      uint64_t v25 = sub_25824(v19, v20, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
      swift_bridgeObjectRelease(v21);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      *(_WORD *)(v17 + 1sub_541C(v0 + 2) = 2080;
      swift_bridgeObjectRetain(a3);
      uint64_t v25 = sub_25824(v23, a3, &v26);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26);
      swift_bridgeObjectRelease_n(a3, 3LL);
      _os_log_impl(&dword_0, v14, v15, "[%s]: Failed to extract link ID '%s' for turn", (uint8_t *)v17, 0x16u);
      uint64_t v22 = v24;
      swift_arrayDestroy(v24, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1LL, -1LL);
      swift_slowDealloc(v17, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

      swift_bridgeObjectRelease_n(a3, 2LL);
    }
  }

unint64_t sub_DB10()
{
  unint64_t result = qword_4B560;
  if (!qword_4B560)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___SISchemaUUID);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_4B560);
  }

  return result;
}

uint64_t sub_DB4C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin20TTSPhonemesGenerator_currentLocale;
  uint64_t v2 = type metadata accessor for Locale(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_DB9C()
{
  return type metadata accessor for TTSPhonemesGenerator(0LL);
}

uint64_t type metadata accessor for TTSPhonemesGenerator(uint64_t a1)
{
  uint64_t result = qword_4B040;
  if (!qword_4B040) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TTSPhonemesGenerator);
  }
  return result;
}

uint64_t sub_DBE0(uint64_t a1)
{
  uint64_t result = type metadata accessor for Locale(319LL);
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 1LL, &v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_DC4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Locale(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
  uint64_t v10 = v9;
  if (*(void *)(a2 + 16))
  {
    uint64_t v11 = v8;
    swift_bridgeObjectRetain(a2);
    unint64_t v12 = sub_2DEC8(v11, v10);
    if ((v13 & 1) != 0)
    {
      uint64_t v14 = *(void *)(a2 + 56) + 120 * v12;
      __int128 v15 = *(_OWORD *)(v14 + 48);
      __int128 v17 = *(_OWORD *)v14;
      __int128 v16 = *(_OWORD *)(v14 + 16);
      v35[2] = *(_OWORD *)(v14 + 32);
      v35[3] = v15;
      v35[0] = v17;
      v35[1] = v16;
      __int128 v19 = *(_OWORD *)(v14 + 80);
      __int128 v18 = *(_OWORD *)(v14 + 96);
      __int128 v20 = *(_OWORD *)(v14 + 64);
      char v36 = *(_BYTE *)(v14 + 112);
      v35[5] = v19;
      v35[6] = v18;
      v35[4] = v20;
      sub_E3A4((uint64_t)v35, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_E378);
      swift_bridgeObjectRelease(v10);
      swift_bridgeObjectRelease(a2);
      char v21 = sub_DF08();
      sub_E3A4((uint64_t)v35, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_E450);
      return v21 & 1;
    }

    swift_bridgeObjectRelease(v10);
    uint64_t v22 = a2;
  }

  else
  {
    uint64_t v22 = v9;
  }

  swift_bridgeObjectRelease(v22);
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v23 = type metadata accessor for Logger(0LL);
  sub_4F30(v23, (uint64_t)qword_4FC70);
  uint64_t v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
  os_log_type_t v26 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v28 = swift_slowAlloc(32LL, -1LL);
    *(void *)&v35[0] = v28;
    *(_DWORD *)uint64_t v27 = 136315138;
    uint64_t v29 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
    unint64_t v31 = v30;
    uint64_t v34 = sub_25824(v29, v30, (uint64_t *)v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35);
    swift_bridgeObjectRelease(v31);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_0, v25, v26, "No phonemeData entry for locale %s", v27, 0xCu);
    char v21 = 1;
    swift_arrayDestroy(v28, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1LL, -1LL);
    swift_slowDealloc(v27, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

    char v21 = 1;
  }

  return v21 & 1;
}

uint64_t sub_DF08()
{
  uint64_t v1 = type metadata accessor for CharacterSet(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_E47C(v0 + 80, (uint64_t)v42);
  sub_E47C((uint64_t)v42, (uint64_t)v43);
  uint64_t v5 = v43[0];
  if (v43[0])
  {
    v49[0] = v43[0];
    uint64_t v6 = *(void *)(v43[0] + 16LL);
    if (v6)
    {
      uint64_t v37 = v0;
      sub_E514((uint64_t)v42, (void (*)(void, void, void, void, void))sub_E378);
      sub_E4C4(v49);
      uint64_t v7 = (unint64_t *)(v5 + 56);
      do
      {
        unint64_t v8 = *v7;
        if (*v7)
        {
          uint64_t v9 = HIBYTE(v8) & 0xF;
          if ((v8 & 0x2000000000000000LL) == 0) {
            uint64_t v9 = *(v7 - 1) & 0xFFFFFFFFFFFFLL;
          }
          if (v9)
          {
            uint64_t v45 = *(v7 - 1);
            unint64_t v46 = v8;
            uint64_t v10 = qword_4A770;
            swift_bridgeObjectRetain(v8);
            if (v10 != -1) {
              swift_once(&qword_4A770, sub_2D2AC);
            }
            sub_4F30(v1, (uint64_t)qword_4BCA0);
            CharacterSet.inverted.getter();
            unint64_t v11 = sub_53D8();
            StringProtocol.rangeOfCharacter(from:options:range:)(v4, 0LL, 0LL, 0LL, 1LL, &type metadata for String, v11);
            char v13 = v12;
            (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
            swift_bridgeObjectRelease(v8);
            if ((v13 & 1) == 0)
            {
              uint64_t v32 = 0LL;
              uint64_t v33 = v42;
              uint64_t v34 = v49;
              goto LABEL_42;
            }
          }
        }

        v7 += 8;
        --v6;
      }

      while (v6);
      sub_E4EC(v49);
      sub_E514((uint64_t)v42, (void (*)(void, void, void, void, void))sub_E450);
      uint64_t v0 = v37;
    }
  }

  sub_E47C(v0, (uint64_t)v41);
  sub_E47C((uint64_t)v41, (uint64_t)v44);
  uint64_t v14 = v44[0];
  if (v44[0])
  {
    uint64_t v48 = v44[0];
    uint64_t v15 = *(void *)(v44[0] + 16LL);
    if (v15)
    {
      uint64_t v37 = v0;
      sub_E514((uint64_t)v41, (void (*)(void, void, void, void, void))sub_E378);
      sub_E4C4(&v48);
      __int128 v16 = (unint64_t *)(v14 + 56);
      do
      {
        unint64_t v17 = *v16;
        if (*v16)
        {
          uint64_t v18 = HIBYTE(v17) & 0xF;
          if ((v17 & 0x2000000000000000LL) == 0) {
            uint64_t v18 = *(v16 - 1) & 0xFFFFFFFFFFFFLL;
          }
          if (v18)
          {
            uint64_t v45 = *(v16 - 1);
            unint64_t v46 = v17;
            uint64_t v19 = qword_4A770;
            swift_bridgeObjectRetain(v17);
            if (v19 != -1) {
              swift_once(&qword_4A770, sub_2D2AC);
            }
            sub_4F30(v1, (uint64_t)qword_4BCA0);
            CharacterSet.inverted.getter();
            unint64_t v20 = sub_53D8();
            StringProtocol.rangeOfCharacter(from:options:range:)(v4, 0LL, 0LL, 0LL, 1LL, &type metadata for String, v20);
            char v22 = v21;
            (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
            swift_bridgeObjectRelease(v17);
            if ((v22 & 1) == 0)
            {
              uint64_t v32 = 0LL;
              uint64_t v33 = v41;
              uint64_t v34 = &v48;
              goto LABEL_42;
            }
          }
        }

        v16 += 8;
        --v15;
      }

      while (v15);
      sub_E4EC(&v48);
      sub_E514((uint64_t)v41, (void (*)(void, void, void, void, void))sub_E450);
      uint64_t v0 = v37;
    }
  }

  sub_E47C(v0 + 40, (uint64_t)v40);
  sub_E47C((uint64_t)v40, (uint64_t)&v45);
  uint64_t v23 = v45;
  if (!v45) {
    return 1LL;
  }
  uint64_t v47 = v45;
  uint64_t v24 = *(void *)(v45 + 16);
  if (!v24) {
    return 1LL;
  }
  sub_E514((uint64_t)v40, (void (*)(void, void, void, void, void))sub_E378);
  sub_E4C4(&v47);
  uint64_t v25 = (unint64_t *)(v23 + 56);
  do
  {
    unint64_t v26 = *v25;
    if (*v25)
    {
      uint64_t v27 = HIBYTE(v26) & 0xF;
      if ((v26 & 0x2000000000000000LL) == 0) {
        uint64_t v27 = *(v25 - 1) & 0xFFFFFFFFFFFFLL;
      }
      if (v27)
      {
        uint64_t v38 = *(v25 - 1);
        unint64_t v39 = v26;
        uint64_t v28 = qword_4A770;
        swift_bridgeObjectRetain(v26);
        if (v28 != -1) {
          swift_once(&qword_4A770, sub_2D2AC);
        }
        sub_4F30(v1, (uint64_t)qword_4BCA0);
        CharacterSet.inverted.getter();
        unint64_t v29 = sub_53D8();
        StringProtocol.rangeOfCharacter(from:options:range:)(v4, 0LL, 0LL, 0LL, 1LL, &type metadata for String, v29);
        char v31 = v30;
        (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
        swift_bridgeObjectRelease(v26);
        if ((v31 & 1) == 0)
        {
          uint64_t v32 = 0LL;
          goto LABEL_41;
        }
      }
    }

    v25 += 8;
    --v24;
  }

  while (v24);
  uint64_t v32 = 1LL;
LABEL_41:
  uint64_t v33 = v40;
  uint64_t v34 = &v47;
LABEL_42:
  sub_E4EC(v34);
  sub_E514((uint64_t)v33, (void (*)(void, void, void, void, void))sub_E450);
  return v32;
}

uint64_t sub_E378(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_bridgeObjectRetain(result);
    return swift_bridgeObjectRetain(a3);
  }

  return result;
}

uint64_t sub_E3A4(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 96);
  uint64_t v13 = *(void *)(a1 + 88);
  uint64_t v14 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 104);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 112);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  a2(v4, v5, v6, v7, v10);
  a2(v14, v13, v8, v9, v11);
  return a1;
}

uint64_t sub_E450(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    swift_bridgeObjectRelease(result);
    return swift_bridgeObjectRelease(a3);
  }

  return result;
}

uint64_t sub_E47C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_501C(&qword_4B0D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *sub_E4C4(void *a1)
{
  return a1;
}

void *sub_E4EC(void *a1)
{
  return a1;
}

uint64_t sub_E514(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_E54C(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x63656843656D616ELL;
  }
  else {
    return 0xD000000000000012LL;
  }
}

uint64_t sub_E590(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_501C(&qword_4B100);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = a1[3];
  uint64_t v12 = a1[4];
  sub_4FF8(a1, v11);
  unint64_t v13 = sub_10164();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PhonemeData.CodingKeys,  &type metadata for PhonemeData.CodingKeys,  v13,  v11,  v12);
  uint64_t v20 = a2;
  char v19 = 0;
  uint64_t v14 = sub_501C(&qword_4B0E8);
  uint64_t v15 = sub_10230( &qword_4B108,  (void (*)(void))sub_102A4,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v20, &v19, v7, v14, v15);
  if (!v3)
  {
    char v18 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(a3, &v18, v7);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_E6F0(char a1)
{
  unint64_t result = 0xD000000000000025LL;
  if (!a1) {
    return 0xD000000000000026LL;
  }
  return result;
}

BOOL sub_E748(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_E760()
{
  return sub_E54C(*v0);
}

uint64_t sub_E768@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_FEAC(a1, a2);
  *a3 = result;
  return result;
}

void sub_E78C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_E798(uint64_t a1)
{
  unint64_t v2 = sub_10164();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_E7C0(uint64_t a1)
{
  unint64_t v2 = sub_10164();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_E7E8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_FFA8(a1);
  if (!v2)
  {
    *(void *)a2 = result;
    *(_DWORD *)(a2 + 8) = v5;
  }

  return result;
}

uint64_t sub_E814(void *a1)
{
  return sub_E590(a1, *(void *)v1, *(unsigned int *)(v1 + 8));
}

uint64_t sub_E830(char *a1, unsigned __int8 *a2)
{
  return sub_27EE0(*a1, *a2);
}

Swift::Int sub_E83C()
{
  return sub_2805C(*v0);
}

uint64_t sub_E844(uint64_t a1)
{
  return sub_2835C(a1, *v1);
}

Swift::Int sub_E84C(uint64_t a1)
{
  return sub_28478(a1, *v1);
}

uint64_t sub_E854(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_501C(&qword_4B188);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_11080();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PhonemeDataLocaleEntry.CodingKeys,  &type metadata for PhonemeDataLocaleEntry.CodingKeys,  v11,  v9,  v10);
  sub_E47C(v3, (uint64_t)v19);
  sub_E47C((uint64_t)v19, (uint64_t)v16);
  char v15 = 0;
  unint64_t v12 = sub_11108();
  KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v16, &v15, v5, &type metadata for TokenPhonemeDataList, v12);
  if (!v2)
  {
    sub_E47C(v3 + 40, (uint64_t)v18);
    sub_E47C((uint64_t)v18, (uint64_t)v16);
    char v15 = 1;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v16, &v15, v5, &type metadata for TokenPhonemeDataList, v12);
    sub_E47C(v3 + 80, (uint64_t)v17);
    sub_E47C((uint64_t)v17, (uint64_t)v16);
    char v15 = 2;
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v16, &v15, v5, &type metadata for TokenPhonemeDataList, v12);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_EA04@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_102E8(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_EA30@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_E6F0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_EA58()
{
  return sub_E6F0(*v0);
}

unint64_t sub_EA60@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_102E8(a1);
  *a2 = result;
  return result;
}

uint64_t sub_EA84(uint64_t a1)
{
  unint64_t v2 = sub_11080();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_EAAC(uint64_t a1)
{
  unint64_t v2 = sub_11080();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_EAD4@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v12;
    *(_OWORD *)(a2 + 64) = v11;
    *(_OWORD *)(a2 + 80) = v5;
    *(_OWORD *)(a2 + 96) = v13;
    *(_BYTE *)(a2 + 11sub_541C(v0 + 2) = v14;
    __int128 v6 = v8[1];
    *(_OWORD *)a2 = v8[0];
    *(_OWORD *)(a2 + 16) = v6;
    double result = *(double *)&v9;
    __int128 v7 = v10;
    *(_OWORD *)(a2 + 3sub_541C(v0 + 2) = v9;
    *(_OWORD *)(a2 + 48) = v7;
  }

  return result;
}

uint64_t sub_EB38(void *a1)
{
  return sub_E854(a1);
}

uint64_t sub_EB88(char a1)
{
  if (!a1) {
    return 0xD000000000000014LL;
  }
  if (a1 == 1) {
    return 0x65756C6176LL;
  }
  return 0x6D617473656D6974LL;
}

uint64_t sub_EBE4(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_501C(&qword_4B140);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_10ADC();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for TokenPhonemeDataList.CodingKeys,  &type metadata for TokenPhonemeDataList.CodingKeys,  v11,  v9,  v10);
  uint64_t v20 = *v3;
  HIBYTE(v19) = 0;
  uint64_t v12 = sub_501C(&qword_4B128);
  uint64_t v13 = sub_10B64(&qword_4B148, (void (*)(void))sub_10BCC, (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v20, (char *)&v19 + 7, v5, v12, v13);
  if (!v2)
  {
    uint64_t v14 = v3[1];
    uint64_t v15 = v3[2];
    BYTE6(v19) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, (char *)&v19 + 6, v5);
    uint64_t v16 = v3[3];
    uint64_t v17 = *((unsigned __int8 *)v3 + 32);
    BYTE5(v19) = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16, v17, (char *)&v19 + 5, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_ED60()
{
  return sub_EB88(*v0);
}

uint64_t sub_ED68@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10738(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_ED8C(uint64_t a1)
{
  unint64_t v2 = sub_10ADC();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_EDB4(uint64_t a1)
{
  unint64_t v2 = sub_10ADC();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_EDDC@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    double result = *(double *)v6;
    __int128 v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_BYTE *)(a2 + 3sub_541C(v0 + 2) = v7;
  }

  return result;
}

uint64_t sub_EE20(void *a1)
{
  return sub_EBE4(a1);
}

uint64_t sub_EE34(char a1)
{
  return *(void *)&aApgid_0[8 * a1];
}

uint64_t sub_EE54(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_501C(&qword_4B168);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_1103C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for TokenPhonemeData.CodingKeys,  &type metadata for TokenPhonemeData.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v25 = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v12, v13, &v25, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    char v24 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v14, v15, &v24, v5);
    uint64_t v16 = v3[4];
    uint64_t v17 = *((unsigned __int8 *)v3 + 40);
    char v23 = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16, v17, &v23, v5);
    uint64_t v18 = v3[6];
    uint64_t v19 = v3[7];
    char v22 = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v18, v19, &v22, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_EFBC()
{
  return sub_EE34(*v0);
}

uint64_t sub_EFC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_10C10(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_EFE8(uint64_t a1)
{
  unint64_t v2 = sub_1103C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_F010(uint64_t a1)
{
  unint64_t v2 = sub_1103C();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_F038@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    double result = *(double *)&v8;
    __int128 v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }

  return result;
}

uint64_t sub_F078(void *a1)
{
  return sub_EE54(a1);
}

uint64_t sub_F08C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0LL;
  }
  LODWORD(v5) = 0;
  uint64_t v6 = 0LL;
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  while (1)
  {
    if ((a2 & 0x1000000000000000LL) == 0)
    {
      if ((a2 & 0x2000000000000000LL) != 0)
      {
        v13[0] = a1;
        v13[1] = v7;
        int v9 = *((unsigned __int8 *)v13 + v6);
        if (*((char *)v13 + v6) < 0) {
          __asm { BR              X9 }
        }
      }

      else
      {
        uint64_t v11 = v8;
        if ((a1 & 0x1000000000000000LL) == 0) {
          uint64_t v11 = _StringObject.sharedUTF8.getter(a1, a2);
        }
        int v9 = *(unsigned __int8 *)(v11 + v6);
        if (*(char *)(v11 + v6) < 0) {
          __asm { BR              X10 }
        }
      }

      uint64_t v10 = 1LL;
      goto LABEL_7;
    }

    int v9 = _StringGuts.foreignErrorCorrectedScalar(startingAt:)(v6 << 16, a1, a2);
    if (v9 < 0) {
      break;
    }
LABEL_7:
    v6 += v10;
    uint64_t v5 = (v9 - v5 + 32 * v5);
    if (v6 >= v2) {
      return v5;
    }
  }

  __break(1u);
  return 0LL;
}

uint64_t destroy for TokenPhonemeDataList(void *a1)
{
  return swift_bridgeObjectRelease(a1[2]);
}

uint64_t initializeWithCopy for TokenPhonemeDataList(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v6 = a2[2];
  uint64_t v5 = a2[3];
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 3sub_541C(v0 + 2) = *((_BYTE *)a2 + 32);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v6);
  return a1;
}

uint64_t *assignWithCopy for TokenPhonemeDataList(uint64_t *a1, uint64_t *a2)
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
  uint64_t v8 = a2[3];
  *((_BYTE *)a1 + 3sub_541C(v0 + 2) = *((_BYTE *)a2 + 32);
  a1[3] = v8;
  return a1;
}

__n128 initializeWithTake for TokenPhonemeDataList(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 3sub_541C(v0 + 2) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t *assignWithTake for TokenPhonemeDataList(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = a2[2];
  uint64_t v6 = a1[2];
  a1[1] = a2[1];
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  a1[3] = a2[3];
  *((_BYTE *)a1 + 3sub_541C(v0 + 2) = *((_BYTE *)a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenPhonemeDataList(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenPhonemeDataList(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(_BYTE *)(result + 3sub_541C(v0 + 2) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 33) = 1;
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

    *(_BYTE *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TokenPhonemeDataList()
{
  return &type metadata for TokenPhonemeDataList;
}

uint64_t initializeBufferWithCopyOfBuffer for TokenPhonemeData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for TokenPhonemeData(void *a1)
{
  return swift_bridgeObjectRelease(a1[7]);
}

uint64_t initializeWithCopy for TokenPhonemeData(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 3sub_541C(v0 + 2) = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t assignWithCopy for TokenPhonemeData(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 3sub_541C(v0 + 2) = v8;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  uint64_t v9 = *(void *)(a2 + 56);
  uint64_t v10 = *(void *)(a1 + 56);
  *(void *)(a1 + 56) = v9;
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRelease(v10);
  return a1;
}

__n128 initializeWithTake for TokenPhonemeData(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 3sub_541C(v0 + 2) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TokenPhonemeData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  *(void *)(a1 + 3sub_541C(v0 + 2) = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  uint64_t v8 = *(void *)(a2 + 56);
  uint64_t v9 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v8;
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TokenPhonemeData(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TokenPhonemeData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 56) = 0LL;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 64) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 64) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TokenPhonemeData()
{
  return &type metadata for TokenPhonemeData;
}

uint64_t initializeBufferWithCopyOfBuffer for PhonemeData(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)a1 = *a2;
  *(_DWORD *)(a1 + 8) = *((_DWORD *)a2 + 2);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for PhonemeData(void *a1)
{
  return swift_bridgeObjectRelease(*a1);
}

uint64_t *assignWithCopy for PhonemeData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *((_DWORD *)a1 + sub_541C(v0 + 2) = *((_DWORD *)a2 + 2);
  return a1;
}

uint64_t initializeWithTake for PhonemeData(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(void *)__n128 result = v2;
  return result;
}

uint64_t *assignWithTake for PhonemeData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v4);
  *((_DWORD *)a1 + sub_541C(v0 + 2) = *((_DWORD *)a2 + 2);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhonemeData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 12)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhonemeData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_DWORD *)(result + 8) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 1sub_541C(v0 + 2) = 1;
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

    *(_BYTE *)(result + 1sub_541C(v0 + 2) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for PhonemeData()
{
  return &type metadata for PhonemeData;
}

uint64_t destroy for PhonemeDataLocaleEntry(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    swift_bridgeObjectRelease(v2);
    swift_bridgeObjectRelease(a1[2]);
  }

  uint64_t v3 = a1[5];
  if (v3)
  {
    swift_bridgeObjectRelease(v3);
    swift_bridgeObjectRelease(a1[7]);
  }

  uint64_t result = a1[10];
  if (result)
  {
    swift_bridgeObjectRelease(result);
    return swift_bridgeObjectRelease(a1[12]);
  }

  return result;
}

uint64_t initializeWithCopy for PhonemeDataLocaleEntry(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  if (*a2)
  {
    uint64_t v5 = a2[1];
    uint64_t v6 = a2[2];
    *(void *)a1 = v4;
    *(void *)(a1 + 8) = v5;
    uint64_t v7 = a2[3];
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v7;
    *(_BYTE *)(a1 + 3sub_541C(v0 + 2) = *((_BYTE *)a2 + 32);
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRetain(v6);
  }

  else
  {
    __int128 v8 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v8;
    *(_BYTE *)(a1 + 3sub_541C(v0 + 2) = *((_BYTE *)a2 + 32);
  }

  uint64_t v9 = a2[5];
  if (v9)
  {
    uint64_t v10 = a2[6];
    uint64_t v11 = a2[7];
    *(void *)(a1 + 40) = v9;
    *(void *)(a1 + 48) = v10;
    uint64_t v12 = a2[8];
    *(void *)(a1 + 56) = v11;
    *(void *)(a1 + 64) = v12;
    *(_BYTE *)(a1 + 7sub_541C(v0 + 2) = *((_BYTE *)a2 + 72);
    swift_bridgeObjectRetain(v9);
    swift_bridgeObjectRetain(v11);
  }

  else
  {
    __int128 v13 = *(_OWORD *)(a2 + 7);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 5);
    *(_OWORD *)(a1 + 56) = v13;
    *(_BYTE *)(a1 + 7sub_541C(v0 + 2) = *((_BYTE *)a2 + 72);
  }

  uint64_t v14 = a2[10];
  if (v14)
  {
    uint64_t v15 = a2[11];
    uint64_t v16 = a2[12];
    *(void *)(a1 + 80) = v14;
    *(void *)(a1 + 88) = v15;
    uint64_t v17 = a2[13];
    *(void *)(a1 + 96) = v16;
    *(void *)(a1 + 104) = v17;
    *(_BYTE *)(a1 + 11sub_541C(v0 + 2) = *((_BYTE *)a2 + 112);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRetain(v16);
  }

  else
  {
    __int128 v18 = *((_OWORD *)a2 + 6);
    *(_OWORD *)(a1 + 80) = *((_OWORD *)a2 + 5);
    *(_OWORD *)(a1 + 96) = v18;
    *(_BYTE *)(a1 + 11sub_541C(v0 + 2) = *((_BYTE *)a2 + 112);
  }

  return a1;
}

uint64_t *assignWithCopy for PhonemeDataLocaleEntry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *a2;
  if (v4)
  {
    if (v5)
    {
      *a1 = v5;
      swift_bridgeObjectRetain(v5);
      swift_bridgeObjectRelease(v4);
      a1[1] = a2[1];
      uint64_t v6 = a2[2];
      uint64_t v7 = a1[2];
      a1[2] = v6;
      swift_bridgeObjectRetain(v6);
      swift_bridgeObjectRelease(v7);
      uint64_t v8 = a2[3];
      *((_BYTE *)a1 + 3sub_541C(v0 + 2) = *((_BYTE *)a2 + 32);
      a1[3] = v8;
    }

    else
    {
      sub_FC40(a1);
      char v11 = *((_BYTE *)a2 + 32);
      __int128 v12 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v12;
      *((_BYTE *)a1 + 3sub_541C(v0 + 2) = v11;
    }
  }

  else if (v5)
  {
    *a1 = v5;
    a1[1] = a2[1];
    uint64_t v9 = a2[2];
    a1[2] = v9;
    uint64_t v10 = a2[3];
    *((_BYTE *)a1 + 3sub_541C(v0 + 2) = *((_BYTE *)a2 + 32);
    a1[3] = v10;
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v9);
  }

  else
  {
    __int128 v13 = *(_OWORD *)a2;
    __int128 v14 = *((_OWORD *)a2 + 1);
    *((_BYTE *)a1 + 3sub_541C(v0 + 2) = *((_BYTE *)a2 + 32);
    *(_OWORD *)a1 = v13;
    *((_OWORD *)a1 + 1) = v14;
  }

  uint64_t v15 = a1 + 5;
  uint64_t v16 = a1[5];
  __int128 v18 = a2 + 5;
  uint64_t v17 = a2[5];
  if (v16)
  {
    if (v17)
    {
      a1[5] = v17;
      swift_bridgeObjectRetain(v17);
      swift_bridgeObjectRelease(v16);
      a1[6] = a2[6];
      uint64_t v19 = a2[7];
      uint64_t v20 = a1[7];
      a1[7] = v19;
      swift_bridgeObjectRetain(v19);
      swift_bridgeObjectRelease(v20);
      uint64_t v21 = a2[8];
      *((_BYTE *)a1 + 7sub_541C(v0 + 2) = *((_BYTE *)a2 + 72);
      a1[8] = v21;
    }

    else
    {
      sub_FC40(a1 + 5);
      char v24 = *((_BYTE *)a2 + 72);
      __int128 v25 = *(_OWORD *)(a2 + 7);
      *uint64_t v15 = *v18;
      *(_OWORD *)(a1 + sub_541C(v0 + 7) = v25;
      *((_BYTE *)a1 + 7sub_541C(v0 + 2) = v24;
    }
  }

  else if (v17)
  {
    a1[5] = v17;
    a1[6] = a2[6];
    uint64_t v22 = a2[7];
    a1[7] = v22;
    uint64_t v23 = a2[8];
    *((_BYTE *)a1 + 7sub_541C(v0 + 2) = *((_BYTE *)a2 + 72);
    a1[8] = v23;
    swift_bridgeObjectRetain(v17);
    swift_bridgeObjectRetain(v22);
  }

  else
  {
    __int128 v26 = *v18;
    __int128 v27 = *(_OWORD *)(a2 + 7);
    *((_BYTE *)a1 + 7sub_541C(v0 + 2) = *((_BYTE *)a2 + 72);
    *uint64_t v15 = v26;
    *(_OWORD *)(a1 + sub_541C(v0 + 7) = v27;
  }

  uint64_t v28 = a1 + 10;
  uint64_t v29 = a1[10];
  char v31 = a2 + 10;
  uint64_t v30 = a2[10];
  if (v29)
  {
    if (v30)
    {
      a1[10] = v30;
      swift_bridgeObjectRetain(v30);
      swift_bridgeObjectRelease(v29);
      a1[11] = a2[11];
      uint64_t v32 = a2[12];
      uint64_t v33 = a1[12];
      a1[12] = v32;
      swift_bridgeObjectRetain(v32);
      swift_bridgeObjectRelease(v33);
      uint64_t v34 = a2[13];
      *((_BYTE *)a1 + 11sub_541C(v0 + 2) = *((_BYTE *)a2 + 112);
      a1[13] = v34;
    }

    else
    {
      sub_FC40(a1 + 10);
      char v37 = *((_BYTE *)a2 + 112);
      __int128 v38 = *((_OWORD *)a2 + 6);
      *uint64_t v28 = *v31;
      *((_OWORD *)a1 + 6) = v38;
      *((_BYTE *)a1 + 11sub_541C(v0 + 2) = v37;
    }
  }

  else if (v30)
  {
    a1[10] = v30;
    a1[11] = a2[11];
    uint64_t v35 = a2[12];
    a1[12] = v35;
    uint64_t v36 = a2[13];
    *((_BYTE *)a1 + 11sub_541C(v0 + 2) = *((_BYTE *)a2 + 112);
    a1[13] = v36;
    swift_bridgeObjectRetain(v30);
    swift_bridgeObjectRetain(v35);
  }

  else
  {
    __int128 v39 = *v31;
    __int128 v40 = *((_OWORD *)a2 + 6);
    *((_BYTE *)a1 + 11sub_541C(v0 + 2) = *((_BYTE *)a2 + 112);
    *uint64_t v28 = v39;
    *((_OWORD *)a1 + 6) = v40;
  }

  return a1;
}

void *sub_FC40(void *a1)
{
  return a1;
}

__n128 initializeWithTake for PhonemeDataLocaleEntry(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[1];
  __int128 v4 = a2[3];
  *(_OWORD *)(a1 + 3sub_541C(v0 + 2) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  __int128 v6 = a2[5];
  __int128 v7 = a2[6];
  *(_BYTE *)(a1 + 11sub_541C(v0 + 2) = *((_BYTE *)a2 + 112);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t *assignWithTake for PhonemeDataLocaleEntry(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  if (v4)
  {
    if (*a2)
    {
      *a1 = *a2;
      swift_bridgeObjectRelease(v4);
      uint64_t v5 = a2[2];
      uint64_t v6 = a1[2];
      a1[1] = a2[1];
      a1[2] = v5;
      swift_bridgeObjectRelease(v6);
      a1[3] = a2[3];
      goto LABEL_6;
    }

    sub_FC40(a1);
  }

  __int128 v7 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v7;
LABEL_6:
  *((_BYTE *)a1 + 3sub_541C(v0 + 2) = *((_BYTE *)a2 + 32);
  uint64_t v8 = a1[5];
  uint64_t v9 = a2[5];
  if (v8)
  {
    if (v9)
    {
      a1[5] = v9;
      swift_bridgeObjectRelease(v8);
      uint64_t v10 = a2[7];
      uint64_t v11 = a1[7];
      a1[6] = a2[6];
      a1[7] = v10;
      swift_bridgeObjectRelease(v11);
      a1[8] = a2[8];
      *((_BYTE *)a1 + 7sub_541C(v0 + 2) = *((_BYTE *)a2 + 72);
      goto LABEL_11;
    }

    sub_FC40(a1 + 5);
  }

  __int128 v12 = *(_OWORD *)(a2 + 7);
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
  *(_OWORD *)(a1 + sub_541C(v0 + 7) = v12;
  *((_BYTE *)a1 + 7sub_541C(v0 + 2) = *((_BYTE *)a2 + 72);
LABEL_11:
  uint64_t v13 = a1[10];
  uint64_t v14 = a2[10];
  if (!v13)
  {
LABEL_15:
    __int128 v17 = *((_OWORD *)a2 + 6);
    *((_OWORD *)a1 + 5) = *((_OWORD *)a2 + 5);
    *((_OWORD *)a1 + 6) = v17;
    *((_BYTE *)a1 + 11sub_541C(v0 + 2) = *((_BYTE *)a2 + 112);
    return a1;
  }

  if (!v14)
  {
    sub_FC40(a1 + 10);
    goto LABEL_15;
  }

  a1[10] = v14;
  swift_bridgeObjectRelease(v13);
  uint64_t v15 = a2[12];
  uint64_t v16 = a1[12];
  a1[11] = a2[11];
  a1[12] = v15;
  swift_bridgeObjectRelease(v16);
  a1[13] = a2[13];
  *((_BYTE *)a1 + 11sub_541C(v0 + 2) = *((_BYTE *)a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhonemeDataLocaleEntry(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 113)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PhonemeDataLocaleEntry( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 104) = 0LL;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 7sub_541C(v0 + 2) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 11sub_541C(v0 + 2) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 1sub_541C(v0 + 13) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 1sub_541C(v0 + 13) = 0;
    }
    if (a2) {
      *(void *)__n128 result = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for PhonemeDataLocaleEntry()
{
  return &type metadata for PhonemeDataLocaleEntry;
}

uint64_t sub_FEAC(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000012LL)
  {
    unint64_t v4 = 0x800000000003B3C0LL;
    if (a2 == 0x800000000003B3C0LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012LL, 0x800000000003B3C0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  if (a1 == 0x63656843656D616ELL && a2 == 0xEC0000006D75736BLL)
  {
    swift_bridgeObjectRelease(0xEC0000006D75736BLL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x63656843656D616ELL, 0xEC0000006D75736BLL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_FFA8(void *a1)
{
  uint64_t v3 = sub_501C(&qword_4B0D8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  char v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  sub_4FF8(a1, v7);
  unint64_t v9 = sub_10164();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for PhonemeData.CodingKeys,  &type metadata for PhonemeData.CodingKeys,  v9,  v7,  v8);
  if (v1)
  {
    sub_541C(a1);
  }

  else
  {
    uint64_t v10 = sub_501C(&qword_4B0E8);
    HIBYTE(vsub_541C(v0 + 13) = 0;
    uint64_t v11 = sub_10230( &qword_4B0F0,  (void (*)(void))sub_101EC,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <> [A : B]);
    KeyedDecodingContainer.decode<A>(_:forKey:)(v10, (char *)&v13 + 7, v3, v10, v11);
    uint64_t v7 = v14;
    BYTE6(vsub_541C(v0 + 13) = 1;
    swift_bridgeObjectRetain(v14);
    KeyedDecodingContainer.decode(_:forKey:)((char *)&v13 + 6, v3);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_541C(a1);
    swift_bridgeObjectRelease(v7);
  }

  return v7;
}

unint64_t sub_10164()
{
  unint64_t result = qword_4B0E0;
  if (!qword_4B0E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_3936C, &type metadata for PhonemeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B0E0);
  }

  return result;
}

uint64_t sub_101A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_101EC()
{
  unint64_t result = qword_4B0F8;
  if (!qword_4B0F8)
  {
    unint64_t result = swift_getWitnessTable(&unk_38E40, &type metadata for PhonemeDataLocaleEntry);
    atomic_store(result, (unint64_t *)&qword_4B0F8);
  }

  return result;
}

uint64_t sub_10230(unint64_t *a1, void (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v8 = sub_101A8(&qword_4B0E8);
    a2();
    uint64_t result = swift_getWitnessTable(a4, v8);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_102A4()
{
  unint64_t result = qword_4B110;
  if (!qword_4B110)
  {
    unint64_t result = swift_getWitnessTable(&unk_38E18, &type metadata for PhonemeDataLocaleEntry);
    atomic_store(result, (unint64_t *)&qword_4B110);
  }

  return result;
}

unint64_t sub_102E8(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_45210, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_10330@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = sub_501C(&qword_4B170);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_11080();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for PhonemeDataLocaleEntry.CodingKeys,  &type metadata for PhonemeDataLocaleEntry.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_541C(a1);
  }
  char v52 = 0;
  unint64_t v12 = sub_110C4();
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)( &v46,  &type metadata for TokenPhonemeDataList,  &v52,  v5,  &type metadata for TokenPhonemeDataList,  v12);
  uint64_t v41 = a2;
  uint64_t v13 = v49;
  int v14 = v50;
  char v52 = 1;
  uint64_t v43 = v46;
  uint64_t v44 = v47;
  uint64_t v45 = v48;
  sub_E378(v46, v47, v48);
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)( &v46,  &type metadata for TokenPhonemeDataList,  &v52,  v5,  &type metadata for TokenPhonemeDataList,  v12);
  int v39 = v14;
  uint64_t v40 = v13;
  uint64_t v15 = v48;
  uint64_t v16 = v49;
  char v52 = 2;
  uint64_t v42 = v46;
  uint64_t v38 = v47;
  int v51 = v50;
  sub_E378(v46, v47, v48);
  uint64_t v37 = 0LL;
  KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)( &v46,  &type metadata for TokenPhonemeDataList,  &v52,  v5,  &type metadata for TokenPhonemeDataList,  v12);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v17 = v48;
  uint64_t v36 = v47;
  uint64_t v37 = v46;
  uint64_t v34 = v48;
  uint64_t v35 = v49;
  HIDWORD(v33) = v50;
  sub_E378(v43, v44, v45);
  uint64_t v18 = v42;
  uint64_t v19 = v38;
  sub_E378(v42, v38, v15);
  sub_E378(v37, v36, v17);
  sub_E450(v18, v19, v15);
  uint64_t v20 = v43;
  uint64_t v21 = v44;
  uint64_t v22 = v45;
  sub_E450(v43, v44, v45);
  sub_541C(a1);
  sub_E450(v20, v21, v22);
  char v23 = v51;
  sub_E450(v42, v38, v15);
  uint64_t v25 = v36;
  uint64_t v24 = v37;
  uint64_t v26 = v34;
  uint64_t v27 = v35;
  LOBYTE(v19) = BYTE4(v33);
  uint64_t result = sub_E450(v37, v36, v34);
  uint64_t v29 = v41;
  uint64_t v30 = v44;
  *uint64_t v41 = v43;
  v29[1] = v30;
  uint64_t v31 = v40;
  v29[2] = v45;
  v29[3] = v31;
  *((_BYTE *)v29 + 3sub_541C(v0 + 2) = v39;
  uint64_t v32 = v38;
  v29[5] = v42;
  v29[6] = v32;
  v29[7] = v15;
  v29[8] = v16;
  *((_BYTE *)v29 + 7sub_541C(v0 + 2) = v23;
  v29[10] = v24;
  v29[11] = v25;
  v29[12] = v26;
  v29[13] = v27;
  *((_BYTE *)v29 + 11sub_541C(v0 + 2) = v19;
  return result;
}

uint64_t sub_10738(uint64_t a1, unint64_t a2)
{
  if (a1 == 0xD000000000000014LL)
  {
    unint64_t v4 = 0x800000000003B3E0LL;
    if (a2 == 0x800000000003B3E0LL) {
      goto LABEL_5;
    }
  }

  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014LL, 0x800000000003B3E0LL, a1, a2, 0LL) & 1) != 0)
  {
    unint64_t v4 = a2;
LABEL_5:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  if (a1 == 0x65756C6176LL && a2 == 0xE500000000000000LL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x65756C6176LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else if (a1 == 0x6D617473656D6974LL && a2 == 0xE900000000000070LL)
  {
    swift_bridgeObjectRelease(0xE900000000000070LL);
    return 2LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6D617473656D6974LL, 0xE900000000000070LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t sub_10880@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_501C(&qword_4B118);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_10ADC();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for TokenPhonemeDataList.CodingKeys,  &type metadata for TokenPhonemeDataList.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_541C(a1);
  }
  uint64_t v12 = sub_501C(&qword_4B128);
  char v30 = 0;
  uint64_t v13 = sub_10B64(&qword_4B130, (void (*)(void))sub_10B20, (uint64_t)&protocol conformance descriptor for <A> [A]);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v12, &v30, v5, v12, v13);
  uint64_t v14 = v31;
  char v29 = 1;
  swift_bridgeObjectRetain(v31);
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)(&v29, v5);
  uint64_t v17 = v16;
  uint64_t v26 = v15;
  char v28 = 2;
  swift_bridgeObjectRetain(v16);
  uint64_t v27 = v17;
  uint64_t v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v28, v5);
  uint64_t v19 = v8;
  char v21 = v20;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v19, v5);
  sub_541C(a1);
  uint64_t v22 = v27;
  swift_bridgeObjectRelease(v27);
  uint64_t result = swift_bridgeObjectRelease(v14);
  uint64_t v24 = v26;
  *(void *)a2 = v14;
  *(void *)(a2 + 8) = v24;
  *(void *)(a2 + 16) = v22;
  *(void *)(a2 + 24) = v18;
  *(_BYTE *)(a2 + 3sub_541C(v0 + 2) = v21 & 1;
  return result;
}

unint64_t sub_10ADC()
{
  unint64_t result = qword_4B120;
  if (!qword_4B120)
  {
    unint64_t result = swift_getWitnessTable(&unk_3931C, &type metadata for TokenPhonemeDataList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B120);
  }

  return result;
}

unint64_t sub_10B20()
{
  unint64_t result = qword_4B138;
  if (!qword_4B138)
  {
    unint64_t result = swift_getWitnessTable(&unk_38E90, &type metadata for TokenPhonemeData);
    atomic_store(result, (unint64_t *)&qword_4B138);
  }

  return result;
}

uint64_t sub_10B64(unint64_t *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_101A8(&qword_4B128);
    a2();
    uint64_t result = swift_getWitnessTable(a3, v7);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_10BCC()
{
  unint64_t result = qword_4B150;
  if (!qword_4B150)
  {
    unint64_t result = swift_getWitnessTable(&unk_38E68, &type metadata for TokenPhonemeData);
    atomic_store(result, (unint64_t *)&qword_4B150);
  }

  return result;
}

uint64_t sub_10C10(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6449677061LL && a2 == 0xE500000000000000LL;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6449677061LL, 0xE500000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x61746144737474LL && a2 == 0xE700000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x61746144737474LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else if (a1 == 0x66664F6E656B6F74LL && a2 == 0xEB00000000746573LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x66664F6E656B6F74LL, 0xEB00000000746573LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 2LL;
  }

  else if (a1 == 0x6172676F6874726FLL && a2 == 0xEB00000000796870LL)
  {
    swift_bridgeObjectRelease(0xEB00000000796870LL);
    return 3LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6172676F6874726FLL, 0xEB00000000796870LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 3LL;
    }
    else {
      return 4LL;
    }
  }

uint64_t sub_10DC8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_501C(&qword_4B158);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_1103C();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for TokenPhonemeData.CodingKeys,  &type metadata for TokenPhonemeData.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_541C(a1);
  }
  char v34 = 0;
  uint64_t v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v34, v5);
  uint64_t v14 = v13;
  uint64_t v29 = v12;
  char v33 = 1;
  swift_bridgeObjectRetain(v13);
  uint64_t v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v33, v5);
  uint64_t v17 = v16;
  uint64_t v27 = v15;
  char v32 = 2;
  swift_bridgeObjectRetain(v16);
  uint64_t v28 = v17;
  uint64_t v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v32, v5);
  int v30 = v19;
  uint64_t v26 = v18;
  char v31 = 3;
  uint64_t v20 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v31, v5);
  uint64_t v22 = v21;
  uint64_t v23 = v20;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain(v22);
  sub_541C(a1);
  swift_bridgeObjectRelease(v22);
  uint64_t v24 = v28;
  swift_bridgeObjectRelease(v28);
  uint64_t result = swift_bridgeObjectRelease(v14);
  *(void *)a2 = v29;
  *(void *)(a2 + 8) = v14;
  *(void *)(a2 + 16) = v27;
  *(void *)(a2 + 24) = v24;
  *(void *)(a2 + 3sub_541C(v0 + 2) = v26;
  *(_BYTE *)(a2 + 40) = v30 & 1;
  *(void *)(a2 + 48) = v23;
  *(void *)(a2 + 56) = v22;
  return result;
}

unint64_t sub_1103C()
{
  unint64_t result = qword_4B160;
  if (!qword_4B160)
  {
    unint64_t result = swift_getWitnessTable(&unk_392CC, &type metadata for TokenPhonemeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B160);
  }

  return result;
}

unint64_t sub_11080()
{
  unint64_t result = qword_4B178;
  if (!qword_4B178)
  {
    unint64_t result = swift_getWitnessTable(&unk_3927C, &type metadata for PhonemeDataLocaleEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B178);
  }

  return result;
}

unint64_t sub_110C4()
{
  unint64_t result = qword_4B180;
  if (!qword_4B180)
  {
    unint64_t result = swift_getWitnessTable(&unk_38EE0, &type metadata for TokenPhonemeDataList);
    atomic_store(result, (unint64_t *)&qword_4B180);
  }

  return result;
}

unint64_t sub_11108()
{
  unint64_t result = qword_4B190;
  if (!qword_4B190)
  {
    unint64_t result = swift_getWitnessTable(&unk_38EB8, &type metadata for TokenPhonemeDataList);
    atomic_store(result, (unint64_t *)&qword_4B190);
  }

  return result;
}

ValueMetadata *type metadata accessor for PhonemeDataLocaleEntry.CodingKeys()
{
  return &type metadata for PhonemeDataLocaleEntry.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for TokenPhonemeData.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_111AC + 4 * byte_38D75[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_111E0 + 4 * byte_38D70[v4]))();
}

uint64_t sub_111E0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_111E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x111F0LL);
  }
  return result;
}

uint64_t sub_111FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x11204LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_11208(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_11210(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TokenPhonemeData.CodingKeys()
{
  return &type metadata for TokenPhonemeData.CodingKeys;
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin22PhonemeDataLocaleEntryV10CodingKeysOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_11278 + 4 * byte_38D7F[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_112AC + 4 * byte_38D7A[v4]))();
}

uint64_t sub_112AC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_112B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x112BCLL);
  }
  return result;
}

uint64_t sub_112C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x112D0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_112D4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_112DC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TokenPhonemeDataList.CodingKeys()
{
  return &type metadata for TokenPhonemeDataList.CodingKeys;
}

uint64_t getEnumTagSinglePayload for PhonemeData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PhonemeData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_113D4 + 4 * byte_38D89[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_11408 + 4 * byte_38D84[v4]))();
}

uint64_t sub_11408(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_11410(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x11418LL);
  }
  return result;
}

uint64_t sub_11424(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1142CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_11430(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_11438(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_11444(_BYTE *result, char a2)
{
  int *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhonemeData.CodingKeys()
{
  return &type metadata for PhonemeData.CodingKeys;
}

unint64_t sub_11464()
{
  unint64_t result = qword_4B198;
  if (!qword_4B198)
  {
    unint64_t result = swift_getWitnessTable(&unk_38FF4, &type metadata for PhonemeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B198);
  }

  return result;
}

unint64_t sub_114AC()
{
  unint64_t result = qword_4B1A0;
  if (!qword_4B1A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_390AC, &type metadata for TokenPhonemeDataList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1A0);
  }

  return result;
}

unint64_t sub_114F4()
{
  unint64_t result = qword_4B1A8;
  if (!qword_4B1A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_39164, &type metadata for TokenPhonemeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1A8);
  }

  return result;
}

unint64_t sub_1153C()
{
  unint64_t result = qword_4B1B0;
  if (!qword_4B1B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_39254, &type metadata for PhonemeDataLocaleEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1B0);
  }

  return result;
}

unint64_t sub_11584()
{
  unint64_t result = qword_4B1B8;
  if (!qword_4B1B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3918C, &type metadata for PhonemeDataLocaleEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1B8);
  }

  return result;
}

unint64_t sub_115CC()
{
  unint64_t result = qword_4B1C0;
  if (!qword_4B1C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_391B4, &type metadata for PhonemeDataLocaleEntry.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1C0);
  }

  return result;
}

unint64_t sub_11614()
{
  unint64_t result = qword_4B1C8;
  if (!qword_4B1C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_390D4, &type metadata for TokenPhonemeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1C8);
  }

  return result;
}

unint64_t sub_1165C()
{
  unint64_t result = qword_4B1D0;
  if (!qword_4B1D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_390FC, &type metadata for TokenPhonemeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1D0);
  }

  return result;
}

unint64_t sub_116A4()
{
  unint64_t result = qword_4B1D8;
  if (!qword_4B1D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3901C, &type metadata for TokenPhonemeDataList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1D8);
  }

  return result;
}

unint64_t sub_116EC()
{
  unint64_t result = qword_4B1E0;
  if (!qword_4B1E0)
  {
    unint64_t result = swift_getWitnessTable(&unk_39044, &type metadata for TokenPhonemeDataList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1E0);
  }

  return result;
}

unint64_t sub_11734()
{
  unint64_t result = qword_4B1E8;
  if (!qword_4B1E8)
  {
    unint64_t result = swift_getWitnessTable(&unk_38F64, &type metadata for PhonemeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1E8);
  }

  return result;
}

unint64_t sub_1177C()
{
  unint64_t result = qword_4B1F0;
  if (!qword_4B1F0)
  {
    unint64_t result = swift_getWitnessTable(&unk_38F8C, &type metadata for PhonemeData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B1F0);
  }

  return result;
}

uint64_t type metadata accessor for TMDCCoreDataStore(uint64_t a1)
{
  uint64_t result = qword_4B208;
  if (!qword_4B208) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TMDCCoreDataStore);
  }
  return result;
}

uint64_t sub_11804(uint64_t a1)
{
  return swift_initClassMetadata2(a1, 0LL, 0LL, v2, a1 + qword_4FC30);
}

uint64_t sub_11840()
{
  uint64_t v0 = static Config.groundTruthDir.getter();
  uint64_t v2 = v1;
  uint64_t v5 = v0;
  uint64_t v6 = v1;
  swift_bridgeObjectRetain(v1);
  v3._object = (void *)0x800000000003B630LL;
  v3._countAndFlagsBits = 0xD000000000000019LL;
  String.append(_:)(v3);
  uint64_t result = swift_bridgeObjectRelease(v2);
  qword_4B1F8 = v5;
  unk_4B200 = v6;
  return result;
}

id sub_118AC(id a1)
{
  uint64_t v2 = (void *)objc_opt_self(&OBJC_CLASS___NSEntityDescription);
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 entityForName:v3 inManagedObjectContext:a1];

  if (v4)
  {
    a1 = [objc_allocWithZone((Class)type metadata accessor for TMDCGroundTruthCoreDataRecord()) initWithEntity:v4 insertIntoManagedObjectContext:a1];
    uint64_t v9 = a1;
    sub_119A4(&v9);
  }

  else
  {
    unint64_t v5 = sub_15188();
    uint64_t v6 = swift_allocError(&type metadata for TMDCCoreDataStoreError, v5, 0LL, 0LL);
    *BOOL v7 = 0LL;
    v7[1] = 0LL;
    swift_willThrow(v6);
  }

  return a1;
}

void sub_119A4(void **a1)
{
  uint64_t v3 = type metadata accessor for Date(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  BOOL v7 = *a1;
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  [v7 setIdentifier:isa];

  uint64_t v9 = (int *)type metadata accessor for TMDCGroundTruth(0LL);
  NSString v10 = String._bridgeToObjectiveC()();
  [v7 setContactName:v10];

  NSString v11 = String._bridgeToObjectiveC()();
  [v7 setAsrPhonemes:v11];

  id v12 = [objc_allocWithZone(NSNumber) initWithLongLong:*(void *)(v1 + v9[7])];
  [v7 setAsrConfidence:v12];

  [v7 setSiriCurrentPronunciation:*(void *)(v1 + v9[9])];
  [v7 setSiriCorrectedPronunciation:*(void *)(v1 + v9[10])];
  id v13 = [objc_allocWithZone(NSNumber) initWithDouble:*(double *)(v1 + v9[11])];
  [v7 setP2pDistance:v13];

  id v14 = [objc_allocWithZone(NSNumber) initWithBool:*(unsigned __int8 *)(v1 + v9[12])];
  [v7 setTtsMispronounced:v14];

  if (*(void *)(v1 + v9[13] + 8)) {
    NSString v15 = String._bridgeToObjectiveC()();
  }
  else {
    NSString v15 = 0LL;
  }
  [v7 setOverriddenContactIdentifier:v15];

  uint64_t v17 = Date.init()(v16);
  double v18 = Date.timeIntervalSince1970.getter(v17);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  id v19 = [objc_allocWithZone(NSNumber) initWithDouble:v18];
  [v7 setEditTimestamp:v19];
}

int *sub_11C24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v40 = type metadata accessor for UUID(0LL);
  uint64_t v3 = *(void *)(v40 - 8);
  __chkstk_darwin(v40);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v6 = [v1 identifier];
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  id v7 = [v1 contactName];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  uint64_t v38 = v9;
  uint64_t v39 = v8;

  id v10 = [v1 asrConfidence];
  id v37 = [v10 longLongValue];

  id v11 = [v1 asrPhonemes];
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  uint64_t v35 = v13;
  uint64_t v36 = v12;

  id v14 = [v1 siriCurrentPronunciation];
  id v15 = [v1 siriCorrectedPronunciation];
  id v16 = [v1 p2pDistance];
  [v16 doubleValue];
  uint64_t v18 = v17;

  id v19 = [v1 ttsMispronounced];
  unsigned __int8 v20 = [v19 BOOLValue];

  id v21 = [v1 overriddenContactIdentifier];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
    uint64_t v25 = v24;
  }

  else
  {
    uint64_t v23 = 0LL;
    uint64_t v25 = 0LL;
  }

  uint64_t v26 = type metadata accessor for DebugModeFlagUserDefaultsStore(0LL);
  swift_allocObject(v26, *(unsigned int *)(v26 + 48), *(unsigned __int16 *)(v26 + 52));
  uint64_t v27 = DebugModeFlagUserDefaultsStore.init()();
  char v28 = dispatch thunk of DebugModeFlagUserDefaultsStore.debugModeEnabled.getter();
  swift_release(v27);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(a1, v5, v40);
  uint64_t result = (int *)type metadata accessor for TMDCGroundTruth(0LL);
  *(_BYTE *)(a1 + result[5]) = (v28 & 1) == 0;
  int v30 = (uint64_t *)(a1 + result[6]);
  uint64_t v31 = v38;
  *int v30 = v39;
  v30[1] = v31;
  *(void *)(a1 + result[7]) = v37;
  char v32 = (uint64_t *)(a1 + result[8]);
  uint64_t v33 = v35;
  *char v32 = v36;
  v32[1] = v33;
  *(void *)(a1 + result[9]) = v14;
  *(void *)(a1 + result[10]) = v15;
  *(void *)(a1 + result[11]) = v18;
  *(_BYTE *)(a1 + result[12]) = v20;
  char v34 = (uint64_t *)(a1 + result[13]);
  *char v34 = v23;
  v34[1] = v25;
  return result;
}

void sub_11EE0()
{
  qword_4FC28 = 0x411E848000000000LL;
}

void sub_11EF4(uint64_t a1)
{
  uint64_t v2 = (void *)dispatch thunk of CoreDataStore.context.getter(a1);
  id v3 = sub_118AC(v2);

  if (!v1)
  {

    uint64_t v5 = (void *)dispatch thunk of CoreDataStore.context.getter(v4);
    id v11 = 0LL;
    unsigned int v6 = [v5 save:&v11];

    id v7 = v11;
    if (v6)
    {
      id v8 = v11;
    }

    else
    {
      id v9 = v11;
      _convertNSErrorToError(_:)(v7);

      swift_willThrow(v10);
    }
  }

void sub_11FE4(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v43 = a3;
  uint64_t v5 = sub_501C(&qword_4B258);
  __chkstk_darwin(v5);
  id v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TMDCGroundTruth(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v46 = (uint64_t)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v45 = (uint64_t)&v41 - v12;
  id v13 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v14 = String._bridgeToObjectiveC()();
  id v15 = [v13 initWithEntityName:v14];

  if (a2)
  {
    sub_9C74(0LL, &qword_4B268, &OBJC_CLASS___NSPredicate_ptr);
    uint64_t v16 = sub_501C(&qword_4B270);
    uint64_t v17 = swift_allocObject(v16, 72LL, 7LL);
    *(_OWORD *)(v17 + 16) = xmmword_38B10;
    *(void *)(v17 + 56) = &type metadata for String;
    *(void *)(v17 + 64) = sub_14428();
    *(void *)(v17 + 3sub_541C(v0 + 2) = a1;
    *(void *)(v17 + 40) = a2;
    __n128 v18 = swift_bridgeObjectRetain(a2);
    id v19 = (void *)NSPredicate.init(format:_:)(0xD000000000000021LL, 0x800000000003B480LL, v17, v18);
    [v15 setPredicate:v19];
  }

  uint64_t v20 = sub_501C(&qword_4ABB0);
  uint64_t v21 = swift_allocObject(v20, 40LL, 7LL);
  *(_OWORD *)(v21 + 16) = xmmword_38B20;
  id v22 = objc_allocWithZone(&OBJC_CLASS___NSSortDescriptor);
  NSString v23 = String._bridgeToObjectiveC()();
  id v24 = [v22 initWithKey:v23 ascending:0];

  *(void *)(v21 + 3sub_541C(v0 + 2) = v24;
  uint64_t v47 = v21;
  specialized Array._endMutation()();
  uint64_t v25 = v47;
  sub_9C74(0LL, &qword_4B260, &OBJC_CLASS___NSSortDescriptor_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v25);
  [v15 setSortDescriptors:isa];

  uint64_t v27 = (void *)dispatch thunk of CoreDataStore.context.getter();
  uint64_t v28 = type metadata accessor for TMDCGroundTruthCoreDataRecord();
  uint64_t v29 = v44;
  uint64_t v30 = NSManagedObjectContext.fetch<A>(_:)(v15, v28);
  if (v29)
  {

    return;
  }

  uint64_t v31 = v30;

  if (!((unint64_t)v31 >> 62))
  {
    uint64_t v32 = *(void *)((char *)&dword_10 + (v31 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(v31);
    if (v32) {
      goto LABEL_7;
    }
LABEL_25:

    swift_bridgeObjectRelease(v31);
    char v34 = _swiftEmptyArrayStorage;
LABEL_26:
    swift_bridgeObjectRelease(v31);
    *uint64_t v43 = v34;
    return;
  }

  if (v31 < 0) {
    uint64_t v40 = v31;
  }
  else {
    uint64_t v40 = v31 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v31);
  uint64_t v32 = _CocoaArrayWrapper.endIndex.getter(v40);
  if (!v32) {
    goto LABEL_25;
  }
LABEL_7:
  if (v32 >= 1)
  {
    uint64_t v41 = 0LL;
    id v42 = v15;
    uint64_t v33 = 0LL;
    char v34 = _swiftEmptyArrayStorage;
    uint64_t v44 = v8;
    do
    {
      if ((v31 & 0xC000000000000001LL) != 0) {
        id v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v33, v31);
      }
      else {
        id v35 = *(id *)(v31 + 8 * v33 + 32);
      }
      uint64_t v36 = v35;
      sub_11C24((uint64_t)v7);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0LL, 1LL, v8);

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1LL, v8) == 1)
      {
        sub_BA5C((uint64_t)v7, &qword_4B258);
      }

      else
      {
        uint64_t v37 = v45;
        sub_13B30((uint64_t)v7, v45);
        sub_13B30(v37, v46);
        if ((swift_isUniquelyReferenced_nonNull_native(v34) & 1) == 0) {
          char v34 = (void *)sub_1421C( 0,  v34[2] + 1LL,  1,  (unint64_t)v34,  &qword_4B280,  type metadata accessor for TMDCGroundTruth);
        }
        unint64_t v39 = v34[2];
        unint64_t v38 = v34[3];
        if (v39 >= v38 >> 1) {
          char v34 = (void *)sub_1421C( v38 > 1,  v39 + 1,  1,  (unint64_t)v34,  &qword_4B280,  type metadata accessor for TMDCGroundTruth);
        }
        v34[2] = v39 + 1;
        sub_13B30( v46,  (uint64_t)v34 + ((*(unsigned __int8 *)(v9 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
        + *(void *)(v9 + 72) * v39);
        uint64_t v8 = v44;
      }

      ++v33;
    }

    while (v32 != v33);

    swift_bridgeObjectRelease(v31);
    goto LABEL_26;
  }

  __break(1u);
}

void sub_124C8(uint64_t a1, uint64_t a2)
{
}

void sub_124EC(uint64_t a1)
{
  id v3 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [v3 initWithEntityName:v4];

  if (*(void *)(a1 + 16))
  {
    sub_9C74(0LL, &qword_4B268, &OBJC_CLASS___NSPredicate_ptr);
    uint64_t v6 = sub_501C(&qword_4B270);
    uint64_t v7 = swift_allocObject(v6, 72LL, 7LL);
    *(_OWORD *)(v7 + 16) = xmmword_38B10;
    *(void *)(v7 + 56) = sub_501C(&qword_4B300);
    *(void *)(v7 + 64) = sub_15628();
    *(void *)(v7 + 3sub_541C(v0 + 2) = a1;
    __n128 v8 = swift_bridgeObjectRetain(a1);
    uint64_t v9 = (void *)NSPredicate.init(format:_:)(0xD000000000000010LL, 0x800000000003B610LL, v7, v8);
    [v5 setPredicate:v9];
  }

  uint64_t v10 = (void *)((uint64_t (*)(void))dispatch thunk of CoreDataStore.context.getter)();
  uint64_t v11 = type metadata accessor for TMDCGroundTruthCoreDataRecord();
  uint64_t v12 = NSManagedObjectContext.fetch<A>(_:)(v5, v11);
  if (v1)
  {

    return;
  }

  uint64_t v13 = v12;

  if ((unint64_t)v13 >> 62)
  {
    if (v13 < 0) {
      uint64_t v19 = v13;
    }
    else {
      uint64_t v19 = v13 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v13);
    uint64_t v14 = _CocoaArrayWrapper.endIndex.getter(v19);
    if (v14) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v14 = *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFF8LL));
    swift_bridgeObjectRetain(v13);
    if (v14)
    {
LABEL_7:
      if (v14 < 1) {
        __break(1u);
      }
      uint64_t v15 = 0LL;
      do
      {
        if ((v13 & 0xC000000000000001LL) != 0) {
          id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v15, v13);
        }
        else {
          id v16 = *(id *)(v13 + 8 * v15 + 32);
        }
        uint64_t v17 = v16;
        ++v15;
        __n128 v18 = (void *)((uint64_t (*)(void))dispatch thunk of CoreDataStore.context.getter)();
        [v18 deleteObject:v17];
      }

      while (v14 != v15);
    }
  }

  uint64_t v20 = swift_bridgeObjectRelease_n(v13, 2LL);
  uint64_t v21 = (void *)dispatch thunk of CoreDataStore.context.getter(v20);
  id v27 = 0LL;
  unsigned __int8 v22 = [v21 save:&v27];

  id v23 = v27;
  if ((v22 & 1) != 0)
  {
    id v24 = v27;
  }

  else
  {
    id v25 = v27;
    _convertNSErrorToError(_:)(v23);

    swift_willThrow(v26);
  }
}

void sub_127C8(uint64_t a1)
{
}

void sub_127E8(uint64_t a1)
{
  uint64_t v3 = v1;
  NSString v4 = (void *)dispatch thunk of CoreDataStore.context.getter(a1);
  int64_t v5 = (int64_t)sub_12F30();

  if (qword_4A778 != -1) {
    goto LABEL_43;
  }
LABEL_2:
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_4F30(v6, (uint64_t)qword_4FC70);
  __n128 v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v15 = static os_log_type_t.debug.getter(v8, v9, v10, v11, v12, v13, v14);
  int64_t v16 = v15;
  if (os_log_type_enabled(v8, v15))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v17 = 134217984;
    v96 = (void *)v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97);
    _os_log_impl(&dword_0, v8, (os_log_type_t)v16, "Current TMDCCoreData store size (bytes): %ld", v17, 0xCu);
    swift_slowDealloc(v17, -1LL, -1LL);
  }

  if (qword_4A718 != -1) {
    uint64_t v18 = swift_once(&qword_4A718, sub_11EE0);
  }
  if ((~qword_4FC28 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_45;
  }

  if (*(double *)&qword_4FC28 <= -9.22337204e18)
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }

  if (*(double *)&qword_4FC28 >= 9.22337204e18)
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }

  uint64_t v2 = v5 - (uint64_t)*(double *)&qword_4FC28;
  if (__OFSUB__(v5, (uint64_t)*(double *)&qword_4FC28))
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }

  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v26 = static os_log_type_t.debug.getter(v19, v20, v21, v22, v23, v24, v25);
  BOOL v27 = os_log_type_enabled(v19, v26);
  if (v2 < 1)
  {
    if (!v27) {
      goto LABEL_56;
    }
    char v53 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)char v53 = 0;
    _os_log_impl(&dword_0, v19, v26, "Store size to delete is not greater than 0, skipping deletion", v53, 2u);
    int v54 = v53;
    goto LABEL_55;
  }

  if (v27)
  {
    uint64_t v28 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v28 = 134217984;
    v96 = (void *)v2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97);
    _os_log_impl(&dword_0, v19, v26, "Store size to delete (in bytes): %ld", v28, 0xCu);
    swift_slowDealloc(v28, -1LL, -1LL);
  }

  unint64_t v29 = sub_13914(0LL, 1, 1);
  if (v3) {
    return;
  }
  int64_t v16 = v29;
  if (v29 >> 62)
  {
LABEL_48:
    if (v16 < 0) {
      uint64_t v86 = v16;
    }
    else {
      uint64_t v86 = v16 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v16);
    uint64_t v30 = _CocoaArrayWrapper.endIndex.getter(v86);
    unint64_t v29 = swift_bridgeObjectRelease(v16);
    if (v30 < 1)
    {
LABEL_52:
      uint64_t v87 = swift_bridgeObjectRelease(v16);
      uint64_t v19 = (os_log_s *)Logger.logObject.getter(v87);
      os_log_type_t v62 = static os_log_type_t.debug.getter(v19, v88, v89, v90, v91, v92, v93);
      if (os_log_type_enabled(v19, v62))
      {
        uint64_t v63 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v63 = 0;
        unint64_t v64 = "No records were fetched, skipping deletion";
        goto LABEL_54;
      }

      goto LABEL_56;
    }

    goto LABEL_16;
  }

  uint64_t v30 = *(void *)((char *)&dword_10 + (v29 & 0xFFFFFFFFFFFFF8LL));
  if (v30 < 1) {
    goto LABEL_52;
  }
LABEL_16:
  uint64_t v31 = v5 / v30;
  if (!(v5 / v30))
  {
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
  }

  uint64_t v32 = v2 / v31;
  if (v2 / v31 < 1)
  {
    uint64_t v55 = swift_bridgeObjectRelease(v16);
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v55);
    os_log_type_t v62 = static os_log_type_t.debug.getter(v19, v56, v57, v58, v59, v60, v61);
    if (!os_log_type_enabled(v19, v62)) {
      goto LABEL_56;
    }
    uint64_t v63 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v63 = 0;
    unint64_t v64 = "No records to delete based on size, skipping deletion";
LABEL_54:
    _os_log_impl(&dword_0, v19, v62, v64, v63, 2u);
    int v54 = v63;
LABEL_55:
    swift_slowDealloc(v54, -1LL, -1LL);
LABEL_56:

    return;
  }

  uint64_t v33 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v40 = static os_log_type_t.debug.getter(v33, v34, v35, v36, v37, v38, v39);
  if (os_log_type_enabled(v33, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v41 = 134217984;
    v96 = (void *)v32;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97);
    _os_log_impl(&dword_0, v33, v40, "Number of records to delete: %ld", v41, 0xCu);
    swift_slowDealloc(v41, -1LL, -1LL);
  }

  uint64_t v42 = sub_151CC(v32, v16);
  uint64_t v2 = v43;
  uint64_t v3 = v44;
  unint64_t v46 = v45;
  swift_bridgeObjectRelease(v16);
  unint64_t v47 = (v46 >> 1) - v3;
  if (__OFSUB__(v46 >> 1, v3)) {
    goto LABEL_59;
  }
  if (!v47)
  {
    swift_unknownObjectRelease(v42);
    char v52 = _swiftEmptyArrayStorage;
    goto LABEL_35;
  }

  uint64_t v94 = v42;
  uint64_t v95 = v32;
  v96 = _swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)(v47);
  if ((v47 & 0x8000000000000000LL) != 0) {
    goto LABEL_60;
  }
  else {
    unint64_t v48 = v3;
  }
  int64_t v5 = v48 - v3;
  uint64_t v49 = (void **)(v2 + 8 * v3);
  do
  {
    if (!v5)
    {
      __break(1u);
LABEL_43:
      swift_once(&qword_4A778, sub_349B4);
      goto LABEL_2;
    }

    unsigned __int8 v50 = *v49++;
    uint64_t v2 = (uint64_t)[v50 objectID];
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    uint64_t v3 = v96[2];
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v3);
    uint64_t v51 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v3, v2);
    specialized ContiguousArray._endMutation()(v51);
    --v5;
    --v47;
  }

  while (v47);
  char v52 = v96;
  swift_unknownObjectRelease(v94);
  uint64_t v32 = v95;
LABEL_35:
  id v65 = objc_allocWithZone(&OBJC_CLASS___NSBatchDeleteRequest);
  sub_9C74(0LL, &qword_4B2E8, &OBJC_CLASS___NSManagedObjectID_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v52);
  id v67 = [v65 initWithObjectIDs:isa];

  unint64_t v69 = (void *)dispatch thunk of CoreDataStore.context.getter(v68);
  v96 = 0LL;
  id v70 = [v69 executeRequest:v67 error:&v96];

  id v71 = v96;
  if (v70
    && (uint64_t v72 = v96,
        v70,
        uint64_t v74 = (void *)dispatch thunk of CoreDataStore.context.getter(v73),
        v96 = 0LL,
        unsigned __int8 v75 = [v74 save:&v96],
        v74,
        id v71 = v96,
        (v75 & 1) != 0))
  {
    uint64_t v19 = (os_log_s *)Logger.logObject.getter(v96);
    os_log_type_t v82 = static os_log_type_t.debug.getter(v19, v76, v77, v78, v79, v80, v81);
    if (os_log_type_enabled(v19, v82))
    {
      uint64_t v83 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v83 = 134217984;
      v96 = (void *)v32;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97);
      _os_log_impl(&dword_0, v19, v82, "Completed deleting %ld TMDC CoreData records", v83, 0xCu);
      swift_slowDealloc(v83, -1LL, -1LL);

      goto LABEL_56;
    }
  }

  else
  {
    id v84 = v71;
    _convertNSErrorToError(_:)(v71);

    swift_willThrow(v85);
  }
}

char *sub_12F30()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_501C(&qword_4B2F0);
  uint64_t v3 = __chkstk_darwin(v2);
  int64_t v5 = (NSString *)((char *)&v102 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v102 - v6;
  uint64_t v8 = type metadata accessor for URL(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v12 = [v1 persistentStoreCoordinator];
  if (!v12)
  {
LABEL_67:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1LL, 1LL, v8);
LABEL_68:
    sub_BA5C((uint64_t)v7, &qword_4B2F0);
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v91 = type metadata accessor for Logger(0LL);
    uint64_t v92 = sub_4F30(v91, (uint64_t)qword_4FC70);
    uint64_t v93 = (os_log_s *)Logger.logObject.getter(v92);
    os_log_type_t v100 = static os_log_type_t.error.getter(v93, v94, v95, v96, v97, v98, v99);
    if (os_log_type_enabled(v93, v100))
    {
      uint64_t v101 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v101 = 0;
      _os_log_impl(&dword_0, v93, v100, "NSManagedObjectContext: Failed to get store URL", v101, 2u);
      swift_slowDealloc(v101, -1LL, -1LL);
    }

    return 0LL;
  }

  uint64_t v13 = v12;
  id v14 = [v12 persistentStores];

  uint64_t v15 = sub_9C74(0LL, &qword_4B2F8, &OBJC_CLASS___NSPersistentStore_ptr);
  int64_t v16 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);

  if (!*(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8LL)))
  {
LABEL_66:
    swift_bridgeObjectRelease(v16);
    goto LABEL_67;
  }

  while (1)
  {
    if ((v16 & 0xC000000000000001LL) != 0)
    {
      id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v16);
    }

    else
    {
      if (!*(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFF8LL)))
      {
        __break(1u);
        goto LABEL_76;
      }

      id v17 = *(id *)(v16 + 32);
    }

    uint64_t v18 = v17;
    swift_bridgeObjectRelease(v16);
    id v19 = [v18 URL];

    if (v19)
    {
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

      uint64_t v20 = 0LL;
    }

    else
    {
      uint64_t v20 = 1LL;
    }

    (*(void (**)(NSString *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, v20, 1LL, v8);
    sub_1555C((uint64_t)v5, (uint64_t)v7);
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    uint64_t v21 = (void *)objc_opt_self(&OBJC_CLASS___NSFileManager);
    id v22 = [v21 defaultManager];
    URL.path.getter();
    uint64_t v24 = v23;
    NSString v25 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v24);
    uint64_t v105 = 0LL;
    id v26 = [v22 attributesOfItemAtPath:v25 error:&v105];

    id v27 = v105;
    if (!v26) {
      goto LABEL_24;
    }
    type metadata accessor for FileAttributeKey();
    int64_t v5 = v28;
    int64_t v16 = sub_155A4();
    uint64_t v29 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v26, v5, (char *)&type metadata for Any + 8, v16);
    id v30 = v27;

    if (*(void *)(v29 + 16))
    {
      uint64_t v31 = NSFileSize;
      unint64_t v32 = sub_2DFB0((uint64_t)v31);
      if ((v33 & 1) != 0)
      {
        sub_155EC(*(void *)(v29 + 56) + 32 * v32, (uint64_t)&v109);
      }

      else
      {
        __int128 v109 = 0u;
        __int128 v110 = 0u;
      }
    }

    else
    {
      __int128 v109 = 0u;
      __int128 v110 = 0u;
    }

    swift_bridgeObjectRelease(v29);
    if (!*((void *)&v110 + 1)) {
      break;
    }
    id v103 = v105;
    NSFileAttributeKey v104 = NSFileSize;
    id v34 = [v21 defaultManager];
    uint64_t v105 = (char *)URL.path.getter();
    uint64_t v106 = v35;
    v36._countAndFlagsBits = 1818326829LL;
    v36._object = (void *)0xE400000000000000LL;
    String.append(_:)(v36);
    uint64_t v37 = v106;
    NSString v38 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v37);
    uint64_t v105 = 0LL;
    id v39 = [v34 attributesOfItemAtPath:v38 error:&v105];

    id v27 = v105;
    if (!v39)
    {
LABEL_24:
      unint64_t v45 = (char *)v27;
      id v46 = v27;
      goto LABEL_25;
    }

    uint64_t v40 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v39, v5, (char *)&type metadata for Any + 8, v16);
    id v41 = v27;

    if (*(void *)(v40 + 16))
    {
      uint64_t v42 = v104;
      unint64_t v43 = sub_2DFB0((uint64_t)v42);
      if ((v44 & 1) != 0)
      {
        sub_155EC(*(void *)(v40 + 56) + 32 * v43, (uint64_t)&v109);
      }

      else
      {
        __int128 v109 = 0u;
        __int128 v110 = 0u;
      }
    }

    else
    {
      __int128 v109 = 0u;
      __int128 v110 = 0u;
    }

    swift_bridgeObjectRelease(v40);
    if (*((void *)&v110 + 1))
    {
      if (swift_dynamicCast( &v105,  &v109,  (char *)&type metadata for Any + 8,  &type metadata for Int,  6LL))
      {
        uint64_t v74 = v105;
        goto LABEL_45;
      }
    }

    else
    {
      sub_BA5C((uint64_t)&v109, (uint64_t *)&unk_4AC00);
    }

    uint64_t v74 = 0LL;
LABEL_45:
    id v75 = [v21 defaultManager];
    uint64_t v105 = (char *)URL.path.getter();
    uint64_t v106 = v76;
    v77._countAndFlagsBits = 1835561773LL;
    v77._object = (void *)0xE400000000000000LL;
    String.append(_:)(v77);
    uint64_t v78 = v106;
    NSString v79 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v78);
    uint64_t v105 = 0LL;
    id v80 = [v75 attributesOfItemAtPath:v79 error:&v105];

    id v81 = v105;
    if (!v80)
    {
      unint64_t v45 = v105;
      id v46 = v81;
LABEL_25:
      int64_t v16 = _convertNSErrorToError(_:)(v46);

      swift_willThrow(v47);
      if (qword_4A778 == -1)
      {
LABEL_26:
        uint64_t v48 = type metadata accessor for Logger(0LL);
        sub_4F30(v48, (uint64_t)qword_4FC70);
        swift_errorRetain(v16);
        uint64_t v49 = swift_errorRetain(v16);
        unsigned __int8 v50 = (os_log_s *)Logger.logObject.getter(v49);
        os_log_type_t v57 = static os_log_type_t.error.getter(v50, v51, v52, v53, v54, v55, v56);
        if (os_log_type_enabled(v50, v57))
        {
          uint64_t v58 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          uint64_t v59 = swift_slowAlloc(32LL, -1LL);
          *(void *)&__int128 v109 = v59;
          *(_DWORD *)uint64_t v58 = 136315138;
          NSFileAttributeKey v104 = (NSFileAttributeKey)(v58 + 4);
          swift_getErrorValue(v16, v108, v107);
          uint64_t v60 = Error.localizedDescription.getter(v107[1], v107[2]);
          unint64_t v62 = v61;
          uint64_t v105 = (char *)sub_25824(v60, v61, (uint64_t *)&v109);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v105, &v106);
          swift_bridgeObjectRelease(v62);
          swift_errorRelease(v16);
          swift_errorRelease(v16);
          _os_log_impl(&dword_0, v50, v57, "NSManagedObjectContext: Cannot determine store size %s", v58, 0xCu);
          swift_arrayDestroy(v59, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v59, -1LL, -1LL);
          swift_slowDealloc(v58, -1LL, -1LL);
        }

        else
        {

          swift_errorRelease(v16);
          swift_errorRelease(v16);
        }

        swift_errorRelease(v16);
        goto LABEL_36;
      }

uint64_t sub_13914(uint64_t a1, char a2, char a3)
{
  id v5 = objc_allocWithZone(&OBJC_CLASS___NSFetchRequest);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v5 initWithEntityName:v6];

  uint64_t v8 = sub_501C(&qword_4ABB0);
  uint64_t v9 = swift_allocObject(v8, 40LL, 7LL);
  *(_OWORD *)(v9 + 16) = xmmword_38B20;
  id v10 = objc_allocWithZone(&OBJC_CLASS___NSSortDescriptor);
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v10 initWithKey:v11 ascending:a3 & 1];

  *(void *)(v9 + 3sub_541C(v0 + 2) = v12;
  specialized Array._endMutation()();
  sub_9C74(0LL, &qword_4B260, &OBJC_CLASS___NSSortDescriptor_ptr);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  [v7 setSortDescriptors:isa];

  if ((a2 & 1) == 0) {
    id v14 = [v7 setFetchLimit:a1];
  }
  uint64_t v15 = (void *)dispatch thunk of CoreDataStore.context.getter(v14);
  uint64_t v16 = type metadata accessor for TMDCGroundTruthCoreDataRecord();
  uint64_t v17 = NSManagedObjectContext.fetch<A>(_:)(v7, v16);

  return v17;
}

void sub_13AE0()
{
}

uint64_t sub_13B0C()
{
  uint64_t v0 = CoreDataStore.deinit();
  return swift_deallocClassInstance(v0, 16LL, 7LL);
}

uint64_t sub_13B28()
{
  return type metadata accessor for TMDCCoreDataStore(0LL);
}

uint64_t sub_13B30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TMDCGroundTruth(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *sub_13B74(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_13CA8(a1, a2, a3, a4, &qword_4B2A8, &qword_4B2B0);
}

void *sub_13B88(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_501C(&qword_4B318);
      NSString v11 = (void *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 3);
      id v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      NSString v11 = _swiftEmptyArrayStorage;
      id v14 = &_swiftEmptyArrayStorage[4];
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

    sub_14AA4(0LL, v8, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_13C94(void *a1, int64_t a2, char a3, void *a4)
{
  return sub_13CA8(a1, a2, a3, a4, &qword_4B320, &qword_4A8B8);
}

void *sub_13CA8(void *result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v10 = a2;
    goto LABEL_8;
  }

  unint64_t v9 = a4[3];
  uint64_t v10 = v9 >> 1;
  if (v10 + 0x4000000000000000LL >= 0)
  {
    uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v11 = a4[2];
    if (v10 <= v11) {
      uint64_t v12 = a4[2];
    }
    else {
      uint64_t v12 = v10;
    }
    if (v12)
    {
      uint64_t v13 = sub_501C(a5);
      id v14 = (void *)swift_allocObject(v13, 8 * v12 + 32, 7LL);
      int64_t v15 = j__malloc_size(v14);
      uint64_t v16 = v15 - 32;
      if (v15 < 32) {
        uint64_t v16 = v15 - 25;
      }
      v14[2] = v11;
      v14[3] = 2 * (v16 >> 3);
      uint64_t v17 = v14 + 4;
      if ((v8 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      id v14 = _swiftEmptyArrayStorage;
      uint64_t v17 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v14 != a4 || v17 >= &a4[v11 + 4]) {
          memmove(v17, a4 + 4, 8 * v11);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_149A0(0LL, v11, (unint64_t)v17, (uint64_t)a4, a6);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v14;
  }

  __break(1u);
  return result;
}

void *sub_13DC0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_501C(&qword_4B2D0);
      uint64_t v11 = (void *)swift_allocObject(v10, v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * v12 - 64;
      uint64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_14C94(0LL, v8, (char *)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_13EB8(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_501C(&qword_4B310);
      uint64_t v11 = (void *)swift_allocObject(v10, 48 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 48);
      uint64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[6 * v8 + 4]) {
          memmove(v13, a4 + 4, 48 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_14D78(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_13FD8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_1421C( a1,  a2,  a3,  a4,  &qword_4B290,  (uint64_t (*)(void))&type metadata accessor for CoreDuetEvent);
}

void *sub_13FEC(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_501C(&qword_4B2C8);
      uint64_t v11 = (void *)swift_allocObject(v10, 56 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 56);
      uint64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[7 * v8 + 4]) {
          memmove(v13, a4 + 4, 56 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_14F78(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_14110(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_501C(&qword_4B2D8);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
      id v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      id v14 = &_swiftEmptyArrayStorage[4];
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4]) {
          memmove(v14, a4 + 4, 16 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_14B8C(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_1421C( char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(void))
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
    uint64_t v18 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v13 = sub_501C(a5);
  uint64_t v14 = *(void *)(a6(0LL) - 8);
  uint64_t v15 = *(void *)(v14 + 72);
  uint64_t v16 = *(unsigned __int8 *)(v14 + 80);
  uint64_t v17 = (v16 + 32) & ~v16;
  uint64_t v18 = (void *)swift_allocObject(v13, v17 + v15 * v12, v16 | 7);
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
    sub_1506C(0LL, v11, v24, a4, a6);
  }

  swift_bridgeObjectRelease(a4);
  return (uint64_t)v18;
}

unint64_t sub_14428()
{
  unint64_t result = qword_4B278;
  if (!qword_4B278)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_4B278);
  }

  return result;
}

void *sub_1446C(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_501C(&qword_4B328);
      uint64_t v11 = (void *)swift_allocObject(v10, 32 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 1;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 5);
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
        if (v11 != a4 || v14 >= &a4[4 * v8 + 4]) {
          memmove(v14, a4 + 4, 32 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_15364(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_14578(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_501C(&qword_4B2B8);
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

    sub_15454(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_14684(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_501C((uint64_t *)&unk_4B6A0);
      uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 17;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 4);
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
        if (v11 != a4 || v14 >= &a4[2 * v8 + 4]) {
          memmove(v14, a4 + 4, 16 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_148B0(0LL, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

void *sub_14790(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_501C(&qword_4B298);
      uint64_t v11 = (void *)swift_allocObject(v10, 40 * v9 + 32, 7LL);
      size_t v12 = j__malloc_size(v11);
      v11[2] = v8;
      v11[3] = 2 * ((uint64_t)(v12 - 32) / 40);
      uint64_t v13 = v11 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[5 * v8 + 4]) {
          memmove(v13, a4 + 4, 40 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v11 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
    }

    sub_14E6C(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_148B0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_149A0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if (v5 < 0)
    {
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v7 = a4 + 8 * a1 + 32;
    unint64_t v8 = a3 + 8 * v5;
    if (v7 >= v8 || v7 + 8 * v5 <= a3)
    {
      sub_501C(a5);
      swift_arrayInitWithCopy(a3);
      return v8;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

char *sub_14AA4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    uint64_t v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    unint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_14B8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v6 = a4 + 16 * a1 + 32;
    unint64_t v7 = a3 + 16 * v4;
    if (v6 >= v7 || v6 + 16 * v4 <= a3)
    {
      sub_501C(&qword_4B2E0);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

char *sub_14C94(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else
  {
    if ((v4 & 0x8000000000000000LL) != 0)
    {
      uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    uint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }

  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_14D78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  unint64_t v5 = a4 + 48 * a1 + 32;
  unint64_t v6 = a3 + 48 * v4;
  if (v5 >= v6 || v5 + 48 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_14E6C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  unint64_t v6 = a4 + 40 * a1 + 32;
  unint64_t v7 = a3 + 40 * v4;
  if (v6 >= v7 || v6 + 40 * v4 <= a3)
  {
    sub_501C(&qword_4B2A0);
    swift_arrayInitWithCopy(a3);
    return v7;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_14F78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

  unint64_t v5 = a4 + 56 * a1 + 32;
  unint64_t v6 = a3 + 56 * v4;
  if (v5 >= v6 || v5 + 56 * v4 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v6;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1506C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(void))
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

unint64_t sub_15188()
{
  unint64_t result = qword_4B288;
  if (!qword_4B288)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A1F4, &type metadata for TMDCCoreDataStoreError);
    atomic_store(result, (unint64_t *)&qword_4B288);
  }

  return result;
}

uint64_t sub_151CC(uint64_t result, unint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v2 = a2;
    uint64_t v3 = result;
    unint64_t v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      uint64_t v5 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8LL));
      goto LABEL_4;
    }
  }

  if (v2 < 0) {
    uint64_t v16 = v2;
  }
  else {
    uint64_t v16 = v2 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v2);
  uint64_t v5 = _CocoaArrayWrapper.endIndex.getter(v16);
  unint64_t result = swift_bridgeObjectRelease(v2);
LABEL_4:
  if (v5 >= v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v5 < 0) {
    uint64_t v6 = v3;
  }
  if (v3) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0LL;
  }
  if (v4)
  {
    if (v2 < 0) {
      uint64_t v9 = v2;
    }
    else {
      uint64_t v9 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v2);
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter(v9);
    unint64_t result = swift_bridgeObjectRelease(v2);
    if (v10 < 0) {
      goto LABEL_37;
    }
    swift_bridgeObjectRetain(v2);
    uint64_t v8 = _CocoaArrayWrapper.endIndex.getter(v9);
    unint64_t result = swift_bridgeObjectRelease(v2);
  }

  else
  {
    uint64_t v8 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
  }

  if (v8 < v7)
  {
    __break(1u);
LABEL_37:
    __break(1u);
    return result;
  }

  if ((v2 & 0xC000000000000001LL) != 0 && v7)
  {
    type metadata accessor for TMDCGroundTruthCoreDataRecord();
    Swift::Int v11 = 0LL;
    do
    {
      Swift::Int v12 = v11 + 1;
      _ArrayBuffer._typeCheckSlowPath(_:)(v11);
      Swift::Int v11 = v12;
    }

    while (v7 != v12);
  }

  if (v4)
  {
    if (v2 < 0) {
      uint64_t v14 = v2;
    }
    else {
      uint64_t v14 = v2 & 0xFFFFFFFFFFFFFF8LL;
    }
    __n128 v15 = swift_bridgeObjectRetain(v2);
    uint64_t v13 = _CocoaArrayWrapper.subscript.getter(0LL, v7, v14, v15);
    swift_bridgeObjectRelease(v2);
  }

  else
  {
    uint64_t v13 = v2 & 0xFFFFFFFFFFFFFF8LL;
    swift_bridgeObjectRetain(v2);
  }

  return v13;
}

uint64_t sub_15364(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v5 = a4 + 32 * a1 + 32;
    unint64_t v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_15454(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
      goto LABEL_9;
    }

    unint64_t v6 = a4 + 8 * a1 + 32;
    unint64_t v7 = a3 + 8 * v4;
    if (v6 >= v7 || v6 + 8 * v4 <= a3)
    {
      sub_501C(&qword_4B2C0);
      swift_arrayInitWithCopy(a3);
      return v7;
    }
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_1555C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_501C(&qword_4B2F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_155A4()
{
  unint64_t result = qword_4A8E0;
  if (!qword_4A8E0)
  {
    type metadata accessor for FileAttributeKey();
    unint64_t result = swift_getWitnessTable(&unk_38218, v1);
    atomic_store(result, (unint64_t *)&qword_4A8E0);
  }

  return result;
}

uint64_t sub_155EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_15628()
{
  unint64_t result = qword_4B308;
  if (!qword_4B308)
  {
    uint64_t v1 = sub_101A8(&qword_4B300);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_4B308);
  }

  return result;
}

id TMDCGroundTruthCoreDataRecord.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id TMDCGroundTruthCoreDataRecord.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TMDCGroundTruthCoreDataRecord();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for TMDCGroundTruthCoreDataRecord()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin29TMDCGroundTruthCoreDataRecord);
}

id TMDCGroundTruthCoreDataRecord.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TMDCGroundTruthCoreDataRecord();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_157CC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_501C(&qword_4B408);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v19 - v7;
  uint64_t v9 = v0[10];
  uint64_t v10 = v0[11];
  sub_4FF8(v0 + 7, v9);
  uint64_t v11 = dispatch thunk of StreamBookmarkStore.read(name:)(0xD00000000000002FLL, 0x800000000003B740LL, v9, v10);
  if (!v11)
  {
    type metadata accessor for StreamBookmark();
    uint64_t v11 = StreamBookmark.__allocating_init(name:)(0xD00000000000002FLL, 0x800000000003B740LL);
  }

  Swift::Int v12 = (void *)v11;
  uint64_t v13 = v0[5];
  uint64_t v14 = v0[6];
  sub_4FF8(v0 + 2, v13);
  dispatch thunk of AsyncBookmarkingSignalReader.conversationsBookmarked(startBookmark:)(v12, v13, v14);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  uint64_t v15 = swift_allocObject(&unk_45F08, 32LL, 7LL);
  *(void *)(v15 + 16) = &unk_4B418;
  *(void *)(v15 + 24) = v1;
  uint64_t v16 = type metadata accessor for Conversation(0LL);
  unint64_t v17 = sub_15C60();
  swift_retain(v1);
  AsyncMapSequence.init(_:transform:)(v6, &unk_4B428, v15, v2, v16, v17);

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_15978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch(sub_15994, 0LL, 0LL);
}

uint64_t sub_15994()
{
  uint64_t v1 = *(void **)(v0 + 32);
  if (v1)
  {
    sub_4FF8((void *)(*(void *)(v0 + 40) + 56LL), *(void *)(*(void *)(v0 + 40) + 80LL));
    id v2 = v1;
    dispatch thunk of StreamBookmarkStore.write(bookmark:)();
  }

  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = type metadata accessor for Conversation(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(v3, v4, v5);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_15A20(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v7 = *(void *)(a2 + *(int *)(sub_501C(&qword_4B438) + 48));
  uint64_t v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)a3 + *a3);
  uint64_t v8 = (void *)swift_task_alloc(a3[1]);
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_15CAC;
  return v10(a1, a2, v7);
}

uint64_t sub_15AB4()
{
  return swift_deallocClassInstance(v0, 96LL, 7LL);
}

uint64_t type metadata accessor for SiriConversationReader()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin22SiriConversationReader);
}

uint64_t sub_15B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)swift_task_alloc(dword_4B414);
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_15CAC;
  v8[4] = a3;
  v8[5] = v3;
  _OWORD v8[2] = a1;
  v8[3] = a2;
  return swift_task_switch(sub_15994, 0LL, 0LL);
}

uint64_t sub_15B74()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_15B98(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = *(int **)(v2 + 16);
  uint64_t v7 = (void *)swift_task_alloc(dword_4B424);
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_15C18;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_4B420 + dword_4B420))(a1, a2, v6);
}

uint64_t sub_15C18()
{
  uint64_t v4 = *v0;
  uint64_t v1 = *(void *)(v4 + 16);
  uint64_t v2 = *v0;
  uint64_t v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_15C60()
{
  unint64_t result = qword_4B430;
  if (!qword_4B430)
  {
    uint64_t v1 = sub_101A8(&qword_4B408);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for AnyAsyncSequence<A>, v1);
    atomic_store(result, (unint64_t *)&qword_4B430);
  }

  return result;
}

uint64_t sub_15CB0(char a1)
{
  return *(void *)&aFirst_1[8 * a1];
}

uint64_t sub_15CD0(uint64_t a1, uint64_t a2)
{
  __int128 v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  char v6 = *(_BYTE *)(a1 + 48);
  __int128 v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  _OWORD v7[2] = *(_OWORD *)(a2 + 32);
  char v8 = *(_BYTE *)(a2 + 48);
  return sub_19DEC((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t sub_15D28(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  int v6 = *((unsigned __int8 *)a1 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  int v8 = *(unsigned __int8 *)(a2 + 16);
  if (v4 == *(void *)a2 && v5 == v7) {
    return v6 ^ v8 ^ 1u;
  }
  char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *(void *)a2, v7, 0LL);
  uint64_t result = 0LL;
  if ((v10 & 1) != 0) {
    return v6 ^ v8 ^ 1u;
  }
  return result;
}

uint64_t sub_15D84(__int128 *a1, __int128 *a2)
{
  __int128 v2 = a1[1];
  __int128 v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  __int128 v3 = a2[1];
  __int128 v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 9) = *(__int128 *)((char *)a2 + 25);
  return sub_19E94((uint64_t *)&v5, (uint64_t)&v7) & 1;
}

uint64_t sub_15DCC(uint64_t a1, uint64_t a2)
{
  return sub_19BDC( *(void *)a1,  *(void *)(a1 + 8),  *(_BYTE *)(a1 + 16),  *(void *)a2,  *(void *)(a2 + 8),  *(_BYTE *)(a2 + 16));
}

uint64_t sub_15DE8(char *a1, char *a2)
{
  return sub_27DD8(*a1, *a2);
}

Swift::Int sub_15DF4()
{
  return sub_280FC(*v0);
}

uint64_t sub_15DFC(uint64_t a1)
{
  return sub_282DC(a1, *v1);
}

Swift::Int sub_15E04(uint64_t a1)
{
  return sub_28578(a1, *v1);
}

unint64_t sub_15E0C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_19FC4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_15E38@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_15CB0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_15E78(void *a1)
{
  NSString v3 = String._bridgeToObjectiveC()();
  NSString v4 = String._bridgeToObjectiveC()();
  [a1 encodeObject:v3 forKey:v4];

  uint64_t v5 = qword_39B20[*(char *)(v1 + OBJC_IVAR___PhonemeString_encoding)];
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  NSString v7 = String._bridgeToObjectiveC()();
  [a1 encodeObject:v6 forKey:v7];

  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = String._bridgeToObjectiveC()();
  [a1 encodeObject:v8 forKey:v9];
}

uint64_t sub_15FC4(char a1)
{
  return *(void *)&aNvasr_2[8 * a1];
}

id sub_16038(void *a1)
{
  __int128 v2 = v1;
  uint64_t v4 = sub_9C74(0LL, (unint64_t *)&unk_4B4D0, &OBJC_CLASS___NSString_ptr);
  uint64_t v5 = v2;
  uint64_t v6 = NSCoder.decodeObject<A>(of:forKey:)(v4, 0x736C6F626D7973LL, 0xE700000000000000LL, v4);
  if (v6)
  {
    NSString v7 = (void *)v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
    uint64_t v10 = v9;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v10 = 0LL;
  }

  uint64_t v11 = NSCoder.decodeObject<A>(of:forKey:)(v4, 0x676E69646F636E65LL, 0xE800000000000000LL, v4);
  if (v11)
  {
    Swift::Int v12 = (void *)v11;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
    uint64_t v15 = v14;
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v15 = 0LL;
  }

  uint64_t v16 = NSCoder.decodeObject<A>(of:forKey:)(v4, 0x797261646E756F62LL, 0xE800000000000000LL, v4);
  if (!v16)
  {
    uint64_t v18 = 0LL;
    uint64_t v20 = 0LL;
    if (v10) {
      goto LABEL_9;
    }
LABEL_13:

    swift_bridgeObjectRelease(v15);
    goto LABEL_14;
  }

  unint64_t v17 = (void *)v16;
  uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  uint64_t v20 = v19;

  if (!v10) {
    goto LABEL_13;
  }
LABEL_9:
  if (!v15 || (v28._countAndFlagsBits = v13, v28._object = v15, char v21 = sub_1A00C(v28), v21 == 4))
  {
    swift_bridgeObjectRelease(v10);

LABEL_14:
    swift_bridgeObjectRelease(v20);
    goto LABEL_15;
  }

  if (v20)
  {
    unint64_t v25 = (uint64_t *)&v5[OBJC_IVAR___PhonemeString_symbols];
    *unint64_t v25 = v8;
    v25[1] = v10;
    v5[OBJC_IVAR___PhonemeString_encoding] = v21;
    id v26 = (uint64_t *)&v5[OBJC_IVAR___PhonemeString_boundary];
    uint64_t *v26 = v18;
    v26[1] = v20;

    v27.receiver = v5;
    v27.super_class = (Class)type metadata accessor for PhonemeString();
    id v23 = objc_msgSendSuper2(&v27, "init");

    return v23;
  }

  swift_bridgeObjectRelease(v10);

LABEL_15:
  uint64_t v22 = type metadata accessor for PhonemeString();
  swift_deallocPartialClassInstance(v5, v22, 48LL, 7LL);
  return 0LL;
}

void *sub_1626C()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary);
  unint64_t v2 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary + 8);
  uint64_t v3 = HIBYTE(v2) & 0xF;
  if ((v2 & 0x2000000000000000LL) == 0) {
    uint64_t v3 = v1 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR___PhonemeString_symbols);
  unint64_t v4 = *(void *)(v0 + OBJC_IVAR___PhonemeString_symbols + 8);
  if (v3)
  {
    uint64_t v22 = *(void *)(v0 + OBJC_IVAR___PhonemeString_symbols);
    unint64_t v23 = v4;
    v21[0] = v1;
    v21[1] = v2;
    unint64_t v6 = sub_53D8();
    return (void *)StringProtocol.components<A>(separatedBy:)( v21,  &type metadata for String,  &type metadata for String,  v6,  v6);
  }

  __n128 v8 = swift_bridgeObjectRetain(*(void *)(v0 + OBJC_IVAR___PhonemeString_symbols + 8));
  uint64_t v9 = String.count.getter(v5, v4, v8);
  if (!v9)
  {
    swift_bridgeObjectRelease(v4);
    return _swiftEmptyArrayStorage;
  }

  uint64_t v10 = v9;
  v21[0] = _swiftEmptyArrayStorage;
  uint64_t result = (void *)sub_337B0(0, v9 & ~(v9 >> 63), 0);
  if ((v10 & 0x8000000000000000LL) == 0)
  {
    uint64_t v7 = v21[0];
    uint64_t v12 = 15LL;
    do
    {
      uint64_t v13 = String.subscript.getter(v12, v5, v4);
      uint64_t v15 = v14;
      uint64_t v22 = 0LL;
      unint64_t v23 = 0xE000000000000000LL;
      Character.write<A>(to:)( &v22,  v13,  v14,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
      swift_bridgeObjectRelease(v15);
      uint64_t v17 = v22;
      unint64_t v16 = v23;
      v21[0] = v7;
      unint64_t v19 = *(void *)(v7 + 16);
      unint64_t v18 = *(void *)(v7 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_337B0(v18 > 1, v19 + 1, 1);
        uint64_t v7 = v21[0];
      }

      *(void *)(v7 + 16) = v19 + 1;
      uint64_t v20 = v7 + 16 * v19;
      *(void *)(v20 + 3sub_541C(v0 + 2) = v17;
      *(void *)(v20 + 40) = v16;
      uint64_t v12 = String.index(after:)(v12, v5, v4);
      --v10;
    }

    while (v10);
    swift_bridgeObjectRelease(v4);
    return (void *)v7;
  }

  __break(1u);
  return result;
}

uint64_t sub_16430(uint64_t a1)
{
  if (!v18)
  {
    sub_911C((uint64_t)v17);
    goto LABEL_16;
  }

  uint64_t v2 = type metadata accessor for PhonemeString();
  if ((swift_dynamicCast(&v16, v17, (char *)&type metadata for Any + 8, v2, 6LL) & 1) == 0)
  {
LABEL_16:
    char v14 = 0;
    return v14 & 1;
  }

  uint64_t v3 = v16;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___PhonemeString_symbols);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___PhonemeString_symbols + 8);
  uint64_t v6 = *(void *)&v16[OBJC_IVAR___PhonemeString_symbols];
  uint64_t v7 = *(void *)&v16[OBJC_IVAR___PhonemeString_symbols + 8];
  BOOL v8 = v4 == v6 && v5 == v7;
  if (!v8 && (_stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v6, v7, 0LL) & 1) == 0
    || (sub_27FD8(*(_BYTE *)(v1 + OBJC_IVAR___PhonemeString_encoding), v3[OBJC_IVAR___PhonemeString_encoding]) & 1) == 0)
  {

    goto LABEL_16;
  }

  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___PhonemeString_boundary);
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR___PhonemeString_boundary + 8);
  uint64_t v11 = *(void *)&v3[OBJC_IVAR___PhonemeString_boundary];
  uint64_t v12 = *(void *)&v3[OBJC_IVAR___PhonemeString_boundary + 8];
  if (v9 == v11 && v10 == v12)
  {

    char v14 = 1;
  }

  else
  {
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, v11, v12, 0LL);
  }

  return v14 & 1;
}

Swift::Int sub_165DC()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR___PhonemeString_symbols);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___PhonemeString_symbols + 8);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v8, v1, v2);
  swift_bridgeObjectRelease(v2);
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary);
  uint64_t v4 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary + 8);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v4);
  uint64_t v5 = *(char *)(v0 + OBJC_IVAR___PhonemeString_encoding);
  uint64_t v6 = qword_39B20[v5];
  String.hash(into:)(v8, *(void *)&aNvasr_2[v5 * 8], v6);
  swift_bridgeObjectRelease(v6);
  __int128 v12 = v8[2];
  __int128 v13 = v8[3];
  uint64_t v14 = v9;
  __int128 v10 = v8[0];
  __int128 v11 = v8[1];
  return Hasher.finalize()();
}

uint64_t sub_16724()
{
  v12[0] = 0LL;
  v12[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(54LL);
  v1._object = (void *)0x800000000003B7F0LL;
  v1._countAndFlagsBits = 0xD000000000000018LL;
  String.append(_:)(v1);
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR___PhonemeString_symbols);
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR___PhonemeString_symbols + 8);
  swift_bridgeObjectRetain(v3);
  v4._countAndFlagsBits = v2;
  v4._object = v3;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(v3);
  v5._countAndFlagsBits = 0x69646F636E65202CLL;
  v5._object = (void *)0xEC000000203A676ELL;
  String.append(_:)(v5);
  char v11 = *(_BYTE *)(v0 + OBJC_IVAR___PhonemeString_encoding);
  _print_unlocked<A, B>(_:_:)( &v11,  v12,  &type metadata for PhonemeFormat,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v6._countAndFlagsBits = 0x61646E756F62202CLL;
  v6._object = (void *)0xEC000000203A7972LL;
  String.append(_:)(v6);
  uint64_t v7 = *(void *)(v0 + OBJC_IVAR___PhonemeString_boundary);
  BOOL v8 = *(void **)(v0 + OBJC_IVAR___PhonemeString_boundary + 8);
  swift_bridgeObjectRetain(v8);
  v9._countAndFlagsBits = v7;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease(v8);
  return v12[0];
}

uint64_t sub_1686C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = a1;
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___PhonemeString_boundary);
  unint64_t v6 = *(void *)(v2 + OBJC_IVAR___PhonemeString_boundary + 8);
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000LL) == 0) {
    uint64_t v7 = v5 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v9 = *(void *)(v2 + OBJC_IVAR___PhonemeString_symbols);
  unint64_t v8 = *(void *)(v2 + OBJC_IVAR___PhonemeString_symbols + 8);
  if (v7)
  {
    unint64_t v32 = *(void **)(v2 + OBJC_IVAR___PhonemeString_symbols);
    unint64_t v33 = v8;
    v31[0] = v5;
    v31[1] = v6;
    v30[0] = a1;
    v30[1] = a2;
    unint64_t v10 = sub_53D8();
    return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( v31,  v30,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v10,  v10,  v10);
  }

  __n128 v12 = swift_bridgeObjectRetain(*(void *)(v2 + OBJC_IVAR___PhonemeString_symbols + 8));
  uint64_t v13 = String.count.getter(v9, v8, v12);
  if (!v13)
  {
    swift_bridgeObjectRelease(v8);
    unint64_t v16 = _swiftEmptyArrayStorage;
LABEL_13:
    unint64_t v32 = v16;
    uint64_t v26 = sub_501C(&qword_4B2B0);
    unint64_t v27 = sub_1A0DC();
    uint64_t v11 = BidirectionalCollection<>.joined(separator:)(v4, v3, v26, v27);
    swift_bridgeObjectRelease(v16);
    return v11;
  }

  uint64_t v14 = v13;
  v31[0] = _swiftEmptyArrayStorage;
  uint64_t result = sub_337B0(0, v13 & ~(v13 >> 63), 0);
  if ((v14 & 0x8000000000000000LL) == 0)
  {
    uint64_t v28 = v4;
    uint64_t v29 = v3;
    unint64_t v16 = (void *)v31[0];
    uint64_t v17 = 15LL;
    do
    {
      uint64_t v18 = String.subscript.getter(v17, v9, v8);
      uint64_t v20 = v19;
      unint64_t v32 = 0LL;
      unint64_t v33 = 0xE000000000000000LL;
      Character.write<A>(to:)( &v32,  v18,  v19,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
      swift_bridgeObjectRelease(v20);
      char v21 = v32;
      unint64_t v22 = v33;
      v31[0] = v16;
      unint64_t v24 = v16[2];
      unint64_t v23 = v16[3];
      if (v24 >= v23 >> 1)
      {
        sub_337B0(v23 > 1, v24 + 1, 1);
        unint64_t v16 = (void *)v31[0];
      }

      v16[2] = v24 + 1;
      unint64_t v25 = &v16[2 * v24];
      v25[4] = v21;
      v25[5] = v22;
      uint64_t v17 = String.index(after:)(v17, v9, v8);
      --v14;
    }

    while (v14);
    swift_bridgeObjectRelease(v8);
    uint64_t v4 = v28;
    uint64_t v3 = v29;
    goto LABEL_13;
  }

  __break(1u);
  return result;
}

uint64_t sub_16ACC(char a1)
{
  return *(void *)&aSymbols_1[8 * a1];
}

uint64_t sub_16AEC()
{
  return sub_16ACC(*v0);
}

uint64_t sub_16AF4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_1AB90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_16B18(uint64_t a1)
{
  unint64_t v2 = sub_17244();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_16B40(uint64_t a1)
{
  unint64_t v2 = sub_17244();
  return CodingKey.debugDescription.getter(a1, v2);
}

id sub_16B68()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhonemeString();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PhonemeString()
{
  return objc_opt_self(&OBJC_CLASS___PhonemeString);
}

uint64_t sub_16BF8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_501C(&qword_4B4B0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  unint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_17244();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for PhonemeString.CodingKeys,  &type metadata for PhonemeString.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *(void *)(v3 + OBJC_IVAR___PhonemeString_symbols);
  uint64_t v13 = *(void *)(v3 + OBJC_IVAR___PhonemeString_symbols + 8);
  char v22 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v22, v5);
  if (!v2)
  {
    char v21 = *(_BYTE *)(v3 + OBJC_IVAR___PhonemeString_encoding);
    char v20 = 1;
    unint64_t v14 = sub_1A098();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v21, &v20, v5, &type metadata for PhonemeFormat, v14);
    uint64_t v15 = *(void *)(v3 + OBJC_IVAR___PhonemeString_boundary);
    uint64_t v16 = *(void *)(v3 + OBJC_IVAR___PhonemeString_boundary + 8);
    char v19 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v15, v16, &v19, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t storeEnumTagSinglePayload for PhonemeFormat(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_16DB8 + 4 * byte_39565[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_16DEC + 4 * byte_39560[v4]))();
}

uint64_t sub_16DEC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_16DF4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x16DFCLL);
  }
  return result;
}

uint64_t sub_16E08(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x16E10LL);
  }
  *(_BYTE *)uint64_t result = a2 + 3;
  return result;
}

uint64_t sub_16E14(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_16E1C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PhonemeFormat()
{
  return &type metadata for PhonemeFormat;
}

id sub_16E38(void *a1)
{
  uint64_t v24 = sub_501C(&qword_4B490);
  uint64_t v4 = *(void *)(v24 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  unint64_t v25 = a1;
  sub_4FF8(a1, v7);
  unint64_t v9 = sub_17244();
  uint64_t v26 = v1;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for PhonemeString.CodingKeys,  &type metadata for PhonemeString.CodingKeys,  v9,  v7,  v8);
  if (v2)
  {
    id v22 = v26;
    sub_541C(v25);

    uint64_t v12 = type metadata accessor for PhonemeString();
    swift_deallocPartialClassInstance(v22, v12, 48LL, 7LL);
  }

  else
  {
    char v29 = 0;
    uint64_t v10 = v24;
    uint64_t v11 = KeyedDecodingContainer.decode(_:forKey:)(&v29, v24);
    unint64_t v14 = v26;
    uint64_t v15 = (uint64_t *)&v26[OBJC_IVAR___PhonemeString_symbols];
    *uint64_t v15 = v11;
    v15[1] = v16;
    char v28 = 1;
    unint64_t v17 = sub_17288();
    KeyedDecodingContainer.decode<A>(_:forKey:)( &type metadata for PhonemeFormat,  &v28,  v10,  &type metadata for PhonemeFormat,  v17);
    v14[OBJC_IVAR___PhonemeString_encoding] = v29;
    char v29 = 2;
    uint64_t v18 = KeyedDecodingContainer.decode(_:forKey:)(&v29, v10);
    char v19 = (uint64_t *)&v14[OBJC_IVAR___PhonemeString_boundary];
    *char v19 = v18;
    v19[1] = v20;

    char v21 = (objc_class *)type metadata accessor for PhonemeString();
    v27.receiver = v14;
    v27.super_class = v21;
    id v22 = objc_msgSendSuper2(&v27, "init");
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v10);
    sub_541C(v25);
  }

  return v22;
}

id sub_1706C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for PhonemeString());
  id result = sub_16E38(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_170BC(void *a1)
{
  return sub_16BF8(a1);
}

uint64_t sub_170DC(char *a1, char *a2)
{
  return sub_27FD8(*a1, *a2);
}

Swift::Int sub_170E8()
{
  return sub_28164(*v0);
}

uint64_t sub_170F0(uint64_t a1)
{
  return sub_283D4(a1, *v1);
}

Swift::Int sub_170F8(uint64_t a1)
{
  return sub_28414(a1, *v1);
}

unint64_t sub_17100@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1A00C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1712C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_15FC4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_17154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1A054();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_171B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1A054();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

unint64_t sub_17200()
{
  unint64_t result = qword_4B488;
  if (!qword_4B488)
  {
    unint64_t result = swift_getWitnessTable(&unk_39694, &type metadata for PhonemeFormat);
    atomic_store(result, (unint64_t *)&qword_4B488);
  }

  return result;
}

unint64_t sub_17244()
{
  unint64_t result = qword_4B498;
  if (!qword_4B498)
  {
    unint64_t result = swift_getWitnessTable(&unk_39A38, &type metadata for PhonemeString.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B498);
  }

  return result;
}

unint64_t sub_17288()
{
  unint64_t result = qword_4B4A0;
  if (!qword_4B4A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_395F4, &type metadata for PhonemeFormat);
    atomic_store(result, (unint64_t *)&qword_4B4A0);
  }

  return result;
}

uint64_t sub_172CC(uint64_t a1, uint64_t a2)
{
  return sub_19C90( *(void *)a1,  *(void **)(a1 + 8),  *(void **)(a1 + 16),  *(void **)(a1 + 24),  *(void *)a2,  *(void **)(a2 + 8),  *(void **)(a2 + 16),  *(void **)(a2 + 24));
}

uint64_t sub_172E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_501C((uint64_t *)&unk_4B6A0);
  uint64_t v11 = swift_allocObject(v10, 64LL, 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_38B60;
  *(void *)(v11 + 3sub_541C(v0 + 2) = a2;
  *(void *)(v11 + 40) = a3;
  *(void *)(v11 + 48) = a4;
  *(void *)(v11 + 56) = a5;
  uint64_t v19 = v11;
  swift_bridgeObjectRetain(a3);
  swift_bridgeObjectRetain(a5);
  swift_bridgeObjectRetain(v11);
  sub_2E8D0(&v19);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = v19;
  uint64_t v13 = sub_501C(&qword_4B2B0);
  unint64_t v14 = sub_1A0DC();
  uint64_t v15 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v13, v14);
  uint64_t v17 = v16;
  swift_release(v12);
  String.hash(into:)(a1, v15, v17);
  return swift_bridgeObjectRelease(v17);
}

Swift::Int sub_173F8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  Hasher.init(_seed:)(v6, 0LL);
  sub_172E8((uint64_t)v6, v1, v2, v4, v3);
  return Hasher._finalize()();
}

uint64_t sub_17454(uint64_t a1)
{
  return sub_172E8(a1, *v1, v1[1], v1[2], v1[3]);
}

Swift::Int sub_17460(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v4 = v1[3];
  Hasher.init(_seed:)(v7, a1);
  sub_172E8((uint64_t)v7, v2, v3, v5, v4);
  return Hasher._finalize()();
}

BOOL sub_174B8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[3];
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  uint64_t v8 = a2[2];
  uint64_t v9 = a2[3];
  Hasher.init(_seed:)(v12, 0LL);
  sub_172E8((uint64_t)v12, v2, v3, v4, v5);
  Swift::Int v10 = Hasher._finalize()();
  Hasher.init(_seed:)(v12, 0LL);
  sub_172E8((uint64_t)v12, v6, v7, v8, v9);
  return v10 == Hasher._finalize()();
}

double sub_17564()
{
  uint64_t v0 = sub_501C(&qword_4B4E8);
  uint64_t v1 = swift_allocObject(v0, 4872LL, 7LL);
  *(void *)&double result = 121LL;
  *(_OWORD *)(v1 + 16) = xmmword_39BF0;
  *(void *)(v1 + 3sub_541C(v0 + 2) = 16705LL;
  *(void *)(v1 + 40) = 0xE200000000000000LL;
  *(void *)(v1 + 48) = 17729LL;
  *(void *)(v1 + 56) = 0xE200000000000000LL;
  *(void *)(v1 + 64) = 0LL;
  *(void *)(v1 + 7sub_541C(v0 + 2) = 16705LL;
  *(void *)(v1 + 80) = 0xE200000000000000LL;
  *(void *)(v1 + 88) = 18497LL;
  *(void *)(v1 + 96) = 0xE200000000000000LL;
  *(void *)(v1 + 104) = 0LL;
  *(void *)(v1 + 11sub_541C(v0 + 2) = 16705LL;
  *(void *)(v1 + 120) = 0xE200000000000000LL;
  *(void *)(v1 + 128) = 22337LL;
  *(void *)(v1 + 136) = 0xE200000000000000LL;
  *(void *)(v1 + 144) = 0LL;
  *(void *)(v1 + 15sub_541C(v0 + 2) = 16705LL;
  *(void *)(v1 + 160) = 0xE200000000000000LL;
  *(void *)(v1 + 168) = 4740929LL;
  *(void *)(v1 + 176) = 0xE300000000000000LL;
  *(void *)(v1 + 184) = 0LL;
  *(void *)(v1 + 19sub_541C(v0 + 2) = 16705LL;
  *(void *)(v1 + 200) = 0xE200000000000000LL;
  *(void *)(v1 + 208) = 18517LL;
  *(void *)(v1 + 216) = 0xE200000000000000LL;
  *(void *)(v1 + 224) = 0LL;
  *(void *)(v1 + 23sub_541C(v0 + 2) = 16705LL;
  *(void *)(v1 + 240) = 0xE200000000000000LL;
  *(void *)(v1 + 248) = 26741LL;
  *(void *)(v1 + 256) = 0xE200000000000000LL;
  *(void *)(v1 + 264) = 0LL;
  *(void *)(v1 + 27sub_541C(v0 + 2) = 17729LL;
  *(void *)(v1 + 280) = 0xE200000000000000LL;
  *(void *)(v1 + 288) = 18497LL;
  *(void *)(v1 + 296) = 0xE200000000000000LL;
  *(void *)(v1 + 304) = 0LL;
  *(void *)(v1 + 31sub_541C(v0 + 2) = 17729LL;
  *(void *)(v1 + 320) = 0xE200000000000000LL;
  *(void *)(v1 + 328) = 22337LL;
  *(void *)(v1 + 336) = 0xE200000000000000LL;
  *(void *)(v1 + 344) = 0LL;
  *(void *)(v1 + 35sub_541C(v0 + 2) = 17729LL;
  *(void *)(v1 + 360) = 0xE200000000000000LL;
  *(void *)(v1 + 368) = 4740929LL;
  *(void *)(v1 + 376) = 0xE300000000000000LL;
  *(void *)(v1 + 384) = 0LL;
  *(void *)(v1 + 39sub_541C(v0 + 2) = 17729LL;
  *(void *)(v1 + 400) = 0xE200000000000000LL;
  *(void *)(v1 + 408) = 22849LL;
  *(void *)(v1 + 416) = 0xE200000000000000LL;
  *(void *)(v1 + 424) = 0x3FE0000000000000LL;
  *(void *)(v1 + 43sub_541C(v0 + 2) = 17729LL;
  *(void *)(v1 + 440) = 0xE200000000000000LL;
  *(void *)(v1 + 448) = 18517LL;
  *(void *)(v1 + 456) = 0xE200000000000000LL;
  *(void *)(v1 + 464) = 0LL;
  *(void *)(v1 + 47sub_541C(v0 + 2) = 17729LL;
  *(void *)(v1 + 480) = 0xE200000000000000LL;
  *(void *)(v1 + 488) = 26741LL;
  *(void *)(v1 + 496) = 0xE200000000000000LL;
  *(void *)(v1 + 504) = 0LL;
  *(void *)(v1 + 51sub_541C(v0 + 2) = 18497LL;
  *(void *)(v1 + 520) = 0xE200000000000000LL;
  *(void *)(v1 + 528) = 22337LL;
  *(void *)(v1 + 536) = 0xE200000000000000LL;
  *(void *)(v1 + 544) = 0LL;
  *(void *)(v1 + 55sub_541C(v0 + 2) = 18497LL;
  *(void *)(v1 + 560) = 0xE200000000000000LL;
  *(void *)(v1 + 568) = 4740929LL;
  *(void *)(v1 + 576) = 0xE300000000000000LL;
  *(void *)(v1 + 584) = 0LL;
  *(void *)(v1 + 59sub_541C(v0 + 2) = 18497LL;
  *(void *)(v1 + 600) = 0xE200000000000000LL;
  *(void *)(v1 + 608) = 18501LL;
  *(void *)(v1 + 616) = 0xE200000000000000LL;
  *(void *)(v1 + 624) = 0x3FE0000000000000LL;
  *(void *)(v1 + 63sub_541C(v0 + 2) = 18497LL;
  *(void *)(v1 + 640) = 0xE200000000000000LL;
  *(void *)(v1 + 648) = 18505LL;
  *(void *)(v1 + 656) = 0xE200000000000000LL;
  *(void *)(v1 + 664) = 0x3FE0000000000000LL;
  *(void *)(v1 + 67sub_541C(v0 + 2) = 18497LL;
  *(void *)(v1 + 680) = 0xE200000000000000LL;
  *(void *)(v1 + 688) = 18511LL;
  *(void *)(v1 + 696) = 0xE200000000000000LL;
  *(void *)(v1 + 704) = 0x3FE0000000000000LL;
  *(void *)(v1 + 71sub_541C(v0 + 2) = 18497LL;
  *(void *)(v1 + 720) = 0xE200000000000000LL;
  *(void *)(v1 + 728) = 18517LL;
  *(void *)(v1 + 736) = 0xE200000000000000LL;
  *(void *)(v1 + 744) = 0LL;
  *(void *)(v1 + 75sub_541C(v0 + 2) = 18497LL;
  *(void *)(v1 + 760) = 0xE200000000000000LL;
  *(void *)(v1 + 768) = 26725LL;
  *(void *)(v1 + 776) = 0xE200000000000000LL;
  *(void *)(v1 + 784) = 0x3FE0000000000000LL;
  *(void *)(v1 + 79sub_541C(v0 + 2) = 18497LL;
  *(void *)(v1 + 800) = 0xE200000000000000LL;
  *(void *)(v1 + 808) = 26729LL;
  *(void *)(v1 + 816) = 0xE200000000000000LL;
  *(void *)(v1 + 824) = 0x3FE0000000000000LL;
  *(void *)(v1 + 83sub_541C(v0 + 2) = 18497LL;
  *(void *)(v1 + 840) = 0xE200000000000000LL;
  *(void *)(v1 + 848) = 26741LL;
  *(void *)(v1 + 856) = 0xE200000000000000LL;
  *(void *)(v1 + 864) = 0LL;
  *(void *)(v1 + 87sub_541C(v0 + 2) = 22337LL;
  *(void *)(v1 + 880) = 0xE200000000000000LL;
  *(void *)(v1 + 888) = 4740929LL;
  *(void *)(v1 + 896) = 0xE300000000000000LL;
  *(void *)(v1 + 904) = 0LL;
  *(void *)(v1 + 91sub_541C(v0 + 2) = 22337LL;
  *(void *)(v1 + 920) = 0xE200000000000000LL;
  *(void *)(v1 + 928) = 18517LL;
  *(void *)(v1 + 936) = 0xE200000000000000LL;
  *(void *)(v1 + 944) = 0LL;
  *(void *)(v1 + 95sub_541C(v0 + 2) = 22337LL;
  *(void *)(v1 + 960) = 0xE200000000000000LL;
  *(void *)(v1 + 968) = 26741LL;
  *(void *)(v1 + 976) = 0xE200000000000000LL;
  *(void *)(v1 + 984) = 0LL;
  *(void *)(v1 + 99sub_541C(v0 + 2) = 4740929LL;
  *(void *)(v1 + 1000) = 0xE300000000000000LL;
  *(void *)(v1 + 1008) = 18517LL;
  *(void *)(v1 + 1016) = 0xE200000000000000LL;
  *(void *)(v1 + 1024) = 0LL;
  *(void *)(v1 + 103sub_541C(v0 + 2) = 4740929LL;
  *(void *)(v1 + 1040) = 0xE300000000000000LL;
  *(void *)(v1 + 1048) = 26741LL;
  *(void *)(v1 + 1056) = 0xE200000000000000LL;
  *(void *)(v1 + 1064) = 0LL;
  *(void *)(v1 + 107sub_541C(v0 + 2) = 22849LL;
  *(void *)(v1 + 1080) = 0xE200000000000000LL;
  *(void *)(v1 + 1088) = 22853LL;
  *(void *)(v1 + 1096) = 0xE200000000000000LL;
  *(void *)(v1 + 1104) = 0x3FE0000000000000LL;
  *(void *)(v1 + 111sub_541C(v0 + 2) = 17733LL;
  *(void *)(v1 + 1120) = 0xE200000000000000LL;
  *(void *)(v1 + 1128) = 18501LL;
  *(void *)(v1 + 1136) = 0xE200000000000000LL;
  *(void *)(v1 + 1144) = 0x3FE0000000000000LL;
  *(void *)(v1 + 115sub_541C(v0 + 2) = 17733LL;
  *(void *)(v1 + 1160) = 0xE200000000000000LL;
  *(void *)(v1 + 1168) = 18505LL;
  *(void *)(v1 + 1176) = 0xE200000000000000LL;
  *(void *)(v1 + 1184) = 0x3FE0000000000000LL;
  *(void *)(v1 + 119sub_541C(v0 + 2) = 17733LL;
  *(void *)(v1 + 1200) = 0xE200000000000000LL;
  *(void *)(v1 + 1208) = 25957LL;
  *(void *)(v1 + 1216) = 0xE200000000000000LL;
  *(void *)(v1 + 1224) = 0LL;
  *(void *)(v1 + 123sub_541C(v0 + 2) = 17733LL;
  *(void *)(v1 + 1240) = 0xE200000000000000LL;
  *(void *)(v1 + 1248) = 26725LL;
  *(void *)(v1 + 1256) = 0xE200000000000000LL;
  *(void *)(v1 + 1264) = 0x3FE0000000000000LL;
  *(void *)(v1 + 127sub_541C(v0 + 2) = 17733LL;
  *(void *)(v1 + 1280) = 0xE200000000000000LL;
  *(void *)(v1 + 1288) = 26729LL;
  *(void *)(v1 + 1296) = 0xE200000000000000LL;
  *(void *)(v1 + 1304) = 0x3FE0000000000000LL;
  *(void *)(v1 + 131sub_541C(v0 + 2) = 18501LL;
  *(void *)(v1 + 1320) = 0xE200000000000000LL;
  *(void *)(v1 + 1328) = 18505LL;
  *(void *)(v1 + 1336) = 0xE200000000000000LL;
  *(void *)(v1 + 1344) = 0x3FE0000000000000LL;
  *(void *)(v1 + 135sub_541C(v0 + 2) = 18501LL;
  *(void *)(v1 + 1360) = 0xE200000000000000LL;
  *(void *)(v1 + 1368) = 25957LL;
  *(void *)(v1 + 1376) = 0xE200000000000000LL;
  *(void *)(v1 + 1384) = 0x3FE0000000000000LL;
  *(void *)(v1 + 139sub_541C(v0 + 2) = 18501LL;
  *(void *)(v1 + 1400) = 0xE200000000000000LL;
  *(void *)(v1 + 1408) = 26725LL;
  *(void *)(v1 + 1416) = 0xE200000000000000LL;
  *(void *)(v1 + 1424) = 0LL;
  *(void *)(v1 + 143sub_541C(v0 + 2) = 18501LL;
  *(void *)(v1 + 1440) = 0xE200000000000000LL;
  *(void *)(v1 + 1448) = 26729LL;
  *(void *)(v1 + 1456) = 0xE200000000000000LL;
  *(void *)(v1 + 1464) = 0x3FE0000000000000LL;
  *(void *)(v1 + 147sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1480) = 0xE200000000000000LL;
  *(void *)(v1 + 1488) = 18511LL;
  *(void *)(v1 + 1496) = 0xE200000000000000LL;
  *(void *)(v1 + 1504) = 0x3FE0000000000000LL;
  *(void *)(v1 + 151sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1520) = 0xE200000000000000LL;
  *(void *)(v1 + 1528) = 20303LL;
  *(void *)(v1 + 1536) = 0xE200000000000000LL;
  *(void *)(v1 + 1544) = 0x3FE0000000000000LL;
  *(void *)(v1 + 155sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1560) = 0xE200000000000000LL;
  *(void *)(v1 + 1568) = 4738895LL;
  *(void *)(v1 + 1576) = 0xE300000000000000LL;
  *(void *)(v1 + 1584) = 0x3FE0000000000000LL;
  *(void *)(v1 + 159sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1600) = 0xE200000000000000LL;
  *(void *)(v1 + 1608) = 22351LL;
  *(void *)(v1 + 1616) = 0xE200000000000000LL;
  *(void *)(v1 + 1624) = 0x3FE0000000000000LL;
  *(void *)(v1 + 163sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1640) = 0xE200000000000000LL;
  *(void *)(v1 + 1648) = 18517LL;
  *(void *)(v1 + 1656) = 0xE200000000000000LL;
  *(void *)(v1 + 1664) = 0LL;
  *(void *)(v1 + 167sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1680) = 0xE200000000000000LL;
  *(void *)(v1 + 1688) = 25957LL;
  *(void *)(v1 + 1696) = 0xE200000000000000LL;
  *(void *)(v1 + 1704) = 0x3FE0000000000000LL;
  *(void *)(v1 + 171sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1720) = 0xE200000000000000LL;
  *(void *)(v1 + 1728) = 26725LL;
  *(void *)(v1 + 1736) = 0xE200000000000000LL;
  *(void *)(v1 + 1744) = 0x3FE0000000000000LL;
  *(void *)(v1 + 175sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1760) = 0xE200000000000000LL;
  *(void *)(v1 + 1768) = 104LL;
  *(void *)(v1 + 1776) = 0xE100000000000000LL;
  *(void *)(v1 + 1784) = 0x3FE0000000000000LL;
  *(void *)(v1 + 179sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1800) = 0xE200000000000000LL;
  *(void *)(v1 + 1808) = 26729LL;
  *(void *)(v1 + 1816) = 0xE200000000000000LL;
  *(void *)(v1 + 1824) = 0LL;
  *(void *)(v1 + 183sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1840) = 0xE200000000000000LL;
  *(void *)(v1 + 1848) = 26735LL;
  *(void *)(v1 + 1856) = 0xE200000000000000LL;
  *(void *)(v1 + 1864) = 0x3FE0000000000000LL;
  *(void *)(v1 + 187sub_541C(v0 + 2) = 18505LL;
  *(void *)(v1 + 1880) = 0xE200000000000000LL;
  *(void *)(v1 + 1888) = 26741LL;
  *(void *)(v1 + 1896) = 0xE200000000000000LL;
  *(void *)(v1 + 1904) = 0LL;
  *(void *)(v1 + 191sub_541C(v0 + 2) = 18511LL;
  *(void *)(v1 + 1920) = 0xE200000000000000LL;
  *(void *)(v1 + 1928) = 20303LL;
  *(void *)(v1 + 1936) = 0xE200000000000000LL;
  *(void *)(v1 + 1944) = 0LL;
  *(void *)(v1 + 195sub_541C(v0 + 2) = 18511LL;
  *(void *)(v1 + 1960) = 0xE200000000000000LL;
  *(void *)(v1 + 1968) = 4738895LL;
  *(void *)(v1 + 1976) = 0xE300000000000000LL;
  *(void *)(v1 + 1984) = 0LL;
  *(void *)(v1 + 199sub_541C(v0 + 2) = 18511LL;
  *(void *)(v1 + 2000) = 0xE200000000000000LL;
  *(void *)(v1 + 2008) = 22351LL;
  *(void *)(v1 + 2016) = 0xE200000000000000LL;
  *(void *)(v1 + 2800) = 0xE200000000000000LL;
  *(void *)(v1 + 2808) = 21077LL;
  *(void *)(v1 + 2816) = 0xE200000000000000LL;
  *(void *)(v1 + 2760) = 0xE200000000000000LL;
  *(void *)(v1 + 2768) = 121LL;
  *(void *)(v1 + 2776) = 0xE100000000000000LL;
  *(void *)(v1 + 2784) = 0x3FE0000000000000LL;
  *(void *)(v1 + 279sub_541C(v0 + 2) = 18517LL;
  *(void *)(v1 + 271sub_541C(v0 + 2) = 22863LL;
  *(void *)(v1 + 2720) = 0xE200000000000000LL;
  *(void *)(v1 + 2728) = 26741LL;
  *(void *)(v1 + 2736) = 0xE200000000000000LL;
  *(void *)(v1 + 2744) = 0x3FE0000000000000LL;
  *(void *)(v1 + 275sub_541C(v0 + 2) = 22863LL;
  *(void *)(v1 + 2664) = 0x3FE0000000000000LL;
  *(void *)(v1 + 267sub_541C(v0 + 2) = 22863LL;
  *(void *)(v1 + 2680) = 0xE200000000000000LL;
  *(void *)(v1 + 2688) = 26735LL;
  *(void *)(v1 + 2696) = 0xE200000000000000LL;
  *(void *)(v1 + 2704) = 0x3FE0000000000000LL;
  *(void *)(v1 + 2616) = 0xE200000000000000LL;
  *(void *)(v1 + 2624) = 0x3FE0000000000000LL;
  *(void *)(v1 + 263sub_541C(v0 + 2) = 22351LL;
  *(void *)(v1 + 2640) = 0xE200000000000000LL;
  *(void *)(v1 + 2648) = 18517LL;
  *(void *)(v1 + 2656) = 0xE200000000000000LL;
  *(void *)(v1 + 2568) = 26735LL;
  *(void *)(v1 + 2576) = 0xE200000000000000LL;
  *(void *)(v1 + 2584) = 0x3FE0000000000000LL;
  *(void *)(v1 + 259sub_541C(v0 + 2) = 22351LL;
  *(void *)(v1 + 2600) = 0xE200000000000000LL;
  *(void *)(v1 + 2608) = 26741LL;
  *(void *)(v1 + 2520) = 0xE300000000000000LL;
  *(void *)(v1 + 2528) = 26741LL;
  *(void *)(v1 + 2536) = 0xE200000000000000LL;
  *(void *)(v1 + 2544) = 0x3FE0000000000000LL;
  *(void *)(v1 + 255sub_541C(v0 + 2) = 22351LL;
  *(void *)(v1 + 2560) = 0xE200000000000000LL;
  *(void *)(v1 + 247sub_541C(v0 + 2) = 4738895LL;
  *(void *)(v1 + 2480) = 0xE300000000000000LL;
  *(void *)(v1 + 2488) = 26735LL;
  *(void *)(v1 + 2496) = 0xE200000000000000LL;
  *(void *)(v1 + 2504) = 0x3FE0000000000000LL;
  *(void *)(v1 + 251sub_541C(v0 + 2) = 4738895LL;
  *(void *)(v1 + 2424) = 0LL;
  *(void *)(v1 + 243sub_541C(v0 + 2) = 4738895LL;
  *(void *)(v1 + 2440) = 0xE300000000000000LL;
  *(void *)(v1 + 2448) = 18517LL;
  *(void *)(v1 + 2456) = 0xE200000000000000LL;
  *(void *)(v1 + 2464) = 0x3FE0000000000000LL;
  *(void *)(v1 + 2376) = 0xE200000000000000LL;
  *(void *)(v1 + 2384) = 0x3FE0000000000000LL;
  *(void *)(v1 + 239sub_541C(v0 + 2) = 4738895LL;
  *(void *)(v1 + 2400) = 0xE300000000000000LL;
  *(void *)(v1 + 2408) = 22351LL;
  *(void *)(v1 + 2416) = 0xE200000000000000LL;
  *(void *)(v1 + 2328) = 26735LL;
  *(void *)(v1 + 2336) = 0xE200000000000000LL;
  *(void *)(v1 + 2344) = 0x3FE0000000000000LL;
  *(void *)(v1 + 235sub_541C(v0 + 2) = 20303LL;
  *(void *)(v1 + 2360) = 0xE200000000000000LL;
  *(void *)(v1 + 2368) = 26741LL;
  *(void *)(v1 + 2280) = 0xE200000000000000LL;
  *(void *)(v1 + 2288) = 18517LL;
  *(void *)(v1 + 2296) = 0xE200000000000000LL;
  *(void *)(v1 + 2304) = 0x3FE0000000000000LL;
  *(void *)(v1 + 231sub_541C(v0 + 2) = 20303LL;
  *(void *)(v1 + 2320) = 0xE200000000000000LL;
  *(void *)(v1 + 223sub_541C(v0 + 2) = 20303LL;
  *(void *)(v1 + 2240) = 0xE200000000000000LL;
  *(void *)(v1 + 2248) = 22351LL;
  *(void *)(v1 + 2256) = 0xE200000000000000LL;
  *(void *)(v1 + 2264) = 0LL;
  *(void *)(v1 + 227sub_541C(v0 + 2) = 20303LL;
  *(void *)(v1 + 2184) = 0x3FE0000000000000LL;
  *(void *)(v1 + 219sub_541C(v0 + 2) = 20303LL;
  *(void *)(v1 + 2200) = 0xE200000000000000LL;
  *(void *)(v1 + 2208) = 4738895LL;
  *(void *)(v1 + 2216) = 0xE300000000000000LL;
  *(void *)(v1 + 2224) = 0LL;
  *(void *)(v1 + 2136) = 0xE200000000000000LL;
  *(void *)(v1 + 2144) = 0LL;
  *(void *)(v1 + 215sub_541C(v0 + 2) = 18511LL;
  *(void *)(v1 + 2160) = 0xE200000000000000LL;
  *(void *)(v1 + 2168) = 26741LL;
  *(void *)(v1 + 2176) = 0xE200000000000000LL;
  *(void *)(v1 + 2088) = 26729LL;
  *(void *)(v1 + 2096) = 0xE200000000000000LL;
  *(void *)(v1 + 2104) = 0x3FE0000000000000LL;
  *(void *)(v1 + 211sub_541C(v0 + 2) = 18511LL;
  *(void *)(v1 + 2120) = 0xE200000000000000LL;
  *(void *)(v1 + 2128) = 26735LL;
  *(void *)(v1 + 2040) = 0xE200000000000000LL;
  *(void *)(v1 + 2048) = 18517LL;
  *(void *)(v1 + 2056) = 0xE200000000000000LL;
  *(void *)(v1 + 2064) = 0x3FE0000000000000LL;
  *(void *)(v1 + 207sub_541C(v0 + 2) = 18511LL;
  *(void *)(v1 + 2080) = 0xE200000000000000LL;
  *(void *)(v1 + 2024) = 0LL;
  *(void *)(v1 + 203sub_541C(v0 + 2) = 18511LL;
  *(void *)(v1 + 2824) = 0x3FE0000000000000LL;
  *(void *)(v1 + 283sub_541C(v0 + 2) = 18517LL;
  *(void *)(v1 + 2840) = 0xE200000000000000LL;
  *(void *)(v1 + 2848) = 26729LL;
  *(void *)(v1 + 2856) = 0xE200000000000000LL;
  *(void *)(v1 + 2864) = 0LL;
  *(void *)(v1 + 287sub_541C(v0 + 2) = 18517LL;
  *(void *)(v1 + 2880) = 0xE200000000000000LL;
  *(void *)(v1 + 2888) = 26735LL;
  *(void *)(v1 + 2896) = 0xE200000000000000LL;
  *(void *)(v1 + 2904) = 0x3FE0000000000000LL;
  *(void *)(v1 + 291sub_541C(v0 + 2) = 18517LL;
  *(void *)(v1 + 2920) = 0xE200000000000000LL;
  *(void *)(v1 + 2928) = 26741LL;
  *(void *)(v1 + 2936) = 0xE200000000000000LL;
  *(void *)(v1 + 2944) = 0LL;
  *(void *)(v1 + 295sub_541C(v0 + 2) = 18517LL;
  *(void *)(v1 + 2960) = 0xE200000000000000LL;
  *(void *)(v1 + 2968) = 27765LL;
  *(void *)(v1 + 2976) = 0xE200000000000000LL;
  *(void *)(v1 + 2984) = 0x3FE0000000000000LL;
  *(void *)(v1 + 299sub_541C(v0 + 2) = 18517LL;
  *(void *)(v1 + 3000) = 0xE200000000000000LL;
  *(void *)(v1 + 3008) = 28021LL;
  *(void *)(v1 + 3016) = 0xE200000000000000LL;
  *(void *)(v1 + 3024) = 0x3FE0000000000000LL;
  *(void *)(v1 + 303sub_541C(v0 + 2) = 18517LL;
  *(void *)(v1 + 3040) = 0xE200000000000000LL;
  *(void *)(v1 + 3048) = 28277LL;
  *(void *)(v1 + 3056) = 0xE200000000000000LL;
  *(void *)(v1 + 3064) = 0x3FE0000000000000LL;
  *(void *)(v1 + 307sub_541C(v0 + 2) = 18517LL;
  *(void *)(v1 + 3080) = 0xE200000000000000LL;
  *(void *)(v1 + 3088) = 29301LL;
  *(void *)(v1 + 3096) = 0xE200000000000000LL;
  *(void *)(v1 + 3104) = 0x3FE0000000000000LL;
  *(void *)(v1 + 311sub_541C(v0 + 2) = 21077LL;
  *(void *)(v1 + 3120) = 0xE200000000000000LL;
  *(void *)(v1 + 3128) = 114LL;
  *(void *)(v1 + 3136) = 0xE100000000000000LL;
  *(void *)(v1 + 3144) = 0x3FE0000000000000LL;
  *(void *)(v1 + 315sub_541C(v0 + 2) = 21077LL;
  *(void *)(v1 + 3160) = 0xE200000000000000LL;
  *(void *)(v1 + 3168) = 26741LL;
  *(void *)(v1 + 3176) = 0xE200000000000000LL;
  *(void *)(v1 + 3184) = 0x3FE0000000000000LL;
  *(void *)(v1 + 319sub_541C(v0 + 2) = 21077LL;
  *(void *)(v1 + 3200) = 0xE200000000000000LL;
  *(void *)(v1 + 3208) = 27765LL;
  *(void *)(v1 + 3216) = 0xE200000000000000LL;
  *(void *)(v1 + 3224) = 0x3FE0000000000000LL;
  *(void *)(v1 + 323sub_541C(v0 + 2) = 21077LL;
  *(void *)(v1 + 3240) = 0xE200000000000000LL;
  *(void *)(v1 + 3248) = 28021LL;
  *(void *)(v1 + 3256) = 0xE200000000000000LL;
  *(void *)(v1 + 3264) = 0x3FE0000000000000LL;
  *(void *)(v1 + 327sub_541C(v0 + 2) = 21077LL;
  *(void *)(v1 + 3280) = 0xE200000000000000LL;
  *(void *)(v1 + 3288) = 28277LL;
  *(void *)(v1 + 3296) = 0xE200000000000000LL;
  *(void *)(v1 + 3304) = 0x3FE0000000000000LL;
  *(void *)(v1 + 331sub_541C(v0 + 2) = 21077LL;
  *(void *)(v1 + 3320) = 0xE200000000000000LL;
  *(void *)(v1 + 3328) = 29301LL;
  *(void *)(v1 + 3336) = 0xE200000000000000LL;
  *(void *)(v1 + 3344) = 0LL;
  *(void *)(v1 + 335sub_541C(v0 + 2) = 26723LL;
  *(void *)(v1 + 3360) = 0xE200000000000000LL;
  *(void *)(v1 + 3368) = 107LL;
  *(void *)(v1 + 3376) = 0xE100000000000000LL;
  *(void *)(v1 + 3384) = 0x4000000000000000LL;
  *(void *)(v1 + 339sub_541C(v0 + 2) = 26723LL;
  *(void *)(v1 + 3400) = 0xE200000000000000LL;
  *(void *)(v1 + 3408) = 26739LL;
  *(void *)(v1 + 3416) = 0xE200000000000000LL;
  *(void *)(v1 + 3424) = 0x4000000000000000LL;
  *(void *)(v1 + 343sub_541C(v0 + 2) = 26723LL;
  *(void *)(v1 + 3440) = 0xE200000000000000LL;
  *(void *)(v1 + 3448) = 26746LL;
  *(void *)(v1 + 3456) = 0xE200000000000000LL;
  *(void *)(v1 + 3464) = 0x4000000000000000LL;
  *(void *)(v1 + 347sub_541C(v0 + 2) = 100LL;
  *(void *)(v1 + 3480) = 0xE100000000000000LL;
  *(void *)(v1 + 3488) = 26724LL;
  *(void *)(v1 + 3496) = 0xE200000000000000LL;
  *(void *)(v1 + 3504) = 0x3FE0000000000000LL;
  *(void *)(v1 + 351sub_541C(v0 + 2) = 100LL;
  *(void *)(v1 + 3520) = 0xE100000000000000LL;
  *(void *)(v1 + 3528) = 116LL;
  *(void *)(v1 + 3536) = 0xE100000000000000LL;
  *(void *)(v1 + 3544) = 0x4000000000000000LL;
  *(void *)(v1 + 355sub_541C(v0 + 2) = 100LL;
  *(void *)(v1 + 3560) = 0xE100000000000000LL;
  *(void *)(v1 + 3568) = 26740LL;
  *(void *)(v1 + 3576) = 0xE200000000000000LL;
  *(void *)(v1 + 3584) = 0x4000000000000000LL;
  *(void *)(v1 + 359sub_541C(v0 + 2) = 26724LL;
  *(void *)(v1 + 3600) = 0xE200000000000000LL;
  *(void *)(v1 + 3608) = 116LL;
  *(void *)(v1 + 3616) = 0xE100000000000000LL;
  *(void *)(v1 + 3624) = 0x4000000000000000LL;
  *(void *)(v1 + 363sub_541C(v0 + 2) = 26724LL;
  *(void *)(v1 + 3640) = 0xE200000000000000LL;
  *(void *)(v1 + 3648) = 26740LL;
  *(void *)(v1 + 3656) = 0xE200000000000000LL;
  *(void *)(v1 + 3664) = 0x4000000000000000LL;
  *(void *)(v1 + 367sub_541C(v0 + 2) = 25957LL;
  *(void *)(v1 + 3680) = 0xE200000000000000LL;
  *(void *)(v1 + 3688) = 26725LL;
  *(void *)(v1 + 3696) = 0xE200000000000000LL;
  *(void *)(v1 + 3704) = 0x3FE0000000000000LL;
  *(void *)(v1 + 371sub_541C(v0 + 2) = 25957LL;
  *(void *)(v1 + 3720) = 0xE200000000000000LL;
  *(void *)(v1 + 3728) = 26729LL;
  *(void *)(v1 + 3736) = 0xE200000000000000LL;
  *(void *)(v1 + 3744) = 0x3FE0000000000000LL;
  *(void *)(v1 + 375sub_541C(v0 + 2) = 25957LL;
  *(void *)(v1 + 3760) = 0xE200000000000000LL;
  *(void *)(v1 + 3768) = 26741LL;
  *(void *)(v1 + 3776) = 0xE200000000000000LL;
  *(void *)(v1 + 3784) = 0x3FE0000000000000LL;
  *(void *)(v1 + 379sub_541C(v0 + 2) = 26725LL;
  *(void *)(v1 + 3800) = 0xE200000000000000LL;
  *(void *)(v1 + 3808) = 26729LL;
  *(void *)(v1 + 3816) = 0xE200000000000000LL;
  *(void *)(v1 + 3824) = 0x3FE0000000000000LL;
  *(void *)(v1 + 383sub_541C(v0 + 2) = 26725LL;
  *(void *)(v1 + 3840) = 0xE200000000000000LL;
  *(void *)(v1 + 3848) = 26741LL;
  *(void *)(v1 + 3856) = 0xE200000000000000LL;
  *(void *)(v1 + 3864) = 0x3FE0000000000000LL;
  *(void *)(v1 + 387sub_541C(v0 + 2) = 103LL;
  *(void *)(v1 + 3880) = 0xE100000000000000LL;
  *(void *)(v1 + 3888) = 106LL;
  *(void *)(v1 + 3896) = 0xE100000000000000LL;
  *(void *)(v1 + 3904) = 0x4000000000000000LL;
  *(void *)(v1 + 391sub_541C(v0 + 2) = 103LL;
  *(void *)(v1 + 3920) = 0xE100000000000000LL;
  *(void *)(v1 + 3928) = 26478LL;
  *(void *)(v1 + 3936) = 0xE200000000000000LL;
  *(void *)(v1 + 3944) = 0x3FE0000000000000LL;
  *(void *)(v1 + 395sub_541C(v0 + 2) = 104LL;
  *(void *)(v1 + 3960) = 0xE100000000000000LL;
  *(void *)(v1 + 3968) = 26729LL;
  *(void *)(v1 + 3976) = 0xE200000000000000LL;
  *(void *)(v1 + 3984) = 0x3FE0000000000000LL;
  *(void *)(v1 + 399sub_541C(v0 + 2) = 104LL;
  *(void *)(v1 + 4000) = 0xE100000000000000LL;
  *(void *)(v1 + 4008) = 106LL;
  *(void *)(v1 + 4016) = 0xE100000000000000LL;
  *(void *)(v1 + 4024) = 0x4000000000000000LL;
  *(void *)(v1 + 403sub_541C(v0 + 2) = 26729LL;
  *(void *)(v1 + 4040) = 0xE200000000000000LL;
  *(void *)(v1 + 4048) = 26735LL;
  *(void *)(v1 + 4056) = 0xE200000000000000LL;
  *(void *)(v1 + 4064) = 0x3FE0000000000000LL;
  *(void *)(v1 + 407sub_541C(v0 + 2) = 26729LL;
  *(void *)(v1 + 4080) = 0xE200000000000000LL;
  *(void *)(v1 + 4088) = 26741LL;
  *(void *)(v1 + 4096) = 0xE200000000000000LL;
  *(void *)(v1 + 4104) = 0LL;
  *(void *)(v1 + 411sub_541C(v0 + 2) = 106LL;
  *(void *)(v1 + 4120) = 0xE100000000000000LL;
  *(void *)(v1 + 4128) = 26746LL;
  *(void *)(v1 + 4136) = 0xE200000000000000LL;
  *(void *)(v1 + 4144) = 0x4000000000000000LL;
  *(void *)(v1 + 415sub_541C(v0 + 2) = 108LL;
  *(void *)(v1 + 4160) = 0xE100000000000000LL;
  *(void *)(v1 + 4168) = 27765LL;
  *(void *)(v1 + 4176) = 0xE200000000000000LL;
  *(void *)(v1 + 4184) = 0LL;
  *(void *)(v1 + 419sub_541C(v0 + 2) = 109LL;
  *(void *)(v1 + 4200) = 0xE100000000000000LL;
  *(void *)(v1 + 4208) = 28021LL;
  *(void *)(v1 + 4216) = 0xE200000000000000LL;
  *(void *)(v1 + 4224) = 0LL;
  *(void *)(v1 + 423sub_541C(v0 + 2) = 110LL;
  *(void *)(v1 + 4240) = 0xE100000000000000LL;
  *(void *)(v1 + 4248) = 28277LL;
  *(void *)(v1 + 4256) = 0xE200000000000000LL;
  *(void *)(v1 + 4264) = 0LL;
  *(void *)(v1 + 427sub_541C(v0 + 2) = 26735LL;
  *(void *)(v1 + 4280) = 0xE200000000000000LL;
  *(void *)(v1 + 4288) = 26741LL;
  *(void *)(v1 + 4296) = 0xE200000000000000LL;
  *(void *)(v1 + 4304) = 0x3FE0000000000000LL;
  *(void *)(v1 + 431sub_541C(v0 + 2) = 114LL;
  *(void *)(v1 + 4320) = 0xE100000000000000LL;
  *(void *)(v1 + 4328) = 29301LL;
  *(void *)(v1 + 4336) = 0xE200000000000000LL;
  *(void *)(v1 + 4344) = 0LL;
  *(void *)(v1 + 435sub_541C(v0 + 2) = 115LL;
  *(void *)(v1 + 4360) = 0xE100000000000000LL;
  *(void *)(v1 + 4368) = 122LL;
  *(void *)(v1 + 4376) = 0xE100000000000000LL;
  *(void *)(v1 + 4384) = 0x4000000000000000LL;
  *(void *)(v1 + 439sub_541C(v0 + 2) = 26739LL;
  *(void *)(v1 + 4400) = 0xE200000000000000LL;
  *(void *)(v1 + 4408) = 26746LL;
  *(void *)(v1 + 4416) = 0xE200000000000000LL;
  *(void *)(v1 + 4424) = 0x4000000000000000LL;
  *(void *)(v1 + 443sub_541C(v0 + 2) = 116LL;
  *(void *)(v1 + 4440) = 0xE100000000000000LL;
  *(void *)(v1 + 4448) = 26740LL;
  *(void *)(v1 + 4456) = 0xE200000000000000LL;
  *(void *)(v1 + 4464) = 0x3FE0000000000000LL;
  *(void *)(v1 + 447sub_541C(v0 + 2) = 26741LL;
  *(void *)(v1 + 4480) = 0xE200000000000000LL;
  *(void *)(v1 + 4488) = 27765LL;
  *(void *)(v1 + 4496) = 0xE200000000000000LL;
  *(void *)(v1 + 4504) = 0x3FE0000000000000LL;
  *(void *)(v1 + 451sub_541C(v0 + 2) = 26741LL;
  *(void *)(v1 + 4520) = 0xE200000000000000LL;
  *(void *)(v1 + 4528) = 28021LL;
  *(void *)(v1 + 4536) = 0xE200000000000000LL;
  *(void *)(v1 + 4544) = 0x3FE0000000000000LL;
  *(void *)(v1 + 455sub_541C(v0 + 2) = 26741LL;
  *(void *)(v1 + 4560) = 0xE200000000000000LL;
  *(void *)(v1 + 4568) = 28277LL;
  *(void *)(v1 + 4576) = 0xE200000000000000LL;
  *(void *)(v1 + 4584) = 0x3FE0000000000000LL;
  *(void *)(v1 + 459sub_541C(v0 + 2) = 26741LL;
  *(void *)(v1 + 4600) = 0xE200000000000000LL;
  *(void *)(v1 + 4608) = 29301LL;
  *(void *)(v1 + 4616) = 0xE200000000000000LL;
  *(void *)(v1 + 4624) = 0x3FE0000000000000LL;
  *(void *)(v1 + 463sub_541C(v0 + 2) = 27765LL;
  *(void *)(v1 + 4640) = 0xE200000000000000LL;
  *(void *)(v1 + 4648) = 28021LL;
  *(void *)(v1 + 4656) = 0xE200000000000000LL;
  *(void *)(v1 + 4664) = 0x3FE0000000000000LL;
  *(void *)(v1 + 467sub_541C(v0 + 2) = 27765LL;
  *(void *)(v1 + 4680) = 0xE200000000000000LL;
  *(void *)(v1 + 4688) = 28277LL;
  *(void *)(v1 + 4696) = 0xE200000000000000LL;
  *(void *)(v1 + 4704) = 0x3FE0000000000000LL;
  *(void *)(v1 + 471sub_541C(v0 + 2) = 27765LL;
  *(void *)(v1 + 4720) = 0xE200000000000000LL;
  *(void *)(v1 + 4728) = 29301LL;
  *(void *)(v1 + 4736) = 0xE200000000000000LL;
  *(void *)(v1 + 4744) = 0x3FE0000000000000LL;
  *(void *)(v1 + 475sub_541C(v0 + 2) = 28021LL;
  *(void *)(v1 + 4760) = 0xE200000000000000LL;
  *(void *)(v1 + 4768) = 28277LL;
  *(void *)(v1 + 4776) = 0xE200000000000000LL;
  *(void *)(v1 + 4784) = 0x3FE0000000000000LL;
  *(void *)(v1 + 479sub_541C(v0 + 2) = 28277LL;
  *(void *)(v1 + 4800) = 0xE200000000000000LL;
  *(void *)(v1 + 4808) = 29301LL;
  *(void *)(v1 + 4816) = 0xE200000000000000LL;
  *(void *)(v1 + 4824) = 0x3FE0000000000000LL;
  *(void *)(v1 + 483sub_541C(v0 + 2) = 122LL;
  *(void *)(v1 + 4840) = 0xE100000000000000LL;
  *(void *)(v1 + 4848) = 26746LL;
  *(void *)(v1 + 4856) = 0xE200000000000000LL;
  *(void *)(v1 + 4864) = 0x4000000000000000LL;
  qword_4FC40 = v1;
  return result;
}

uint64_t sub_17F78()
{
  if (qword_4A720 != -1) {
LABEL_22:
  }
    swift_once(&qword_4A720, sub_17564);
  uint64_t v0 = qword_4FC40;
  uint64_t v1 = *(void *)(qword_4FC40 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain_n(qword_4FC40, 2LL);
    uint64_t v22 = v0;
    uint64_t v2 = (uint64_t *)(v0 + 64);
    while (1)
    {
      uint64_t v4 = *(v2 - 4);
      uint64_t v3 = *(v2 - 3);
      uint64_t v6 = *(v2 - 2);
      uint64_t v5 = *(v2 - 1);
      uint64_t v7 = *v2;
      swift_bridgeObjectRetain_n(v3, 2LL);
      swift_bridgeObjectRetain_n(v5, 2LL);
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyDictionarySingleton);
      unint64_t v10 = sub_2DF2C(v4, v3, v6, v5);
      uint64_t v11 = _swiftEmptyDictionarySingleton[2];
      BOOL v12 = (v9 & 1) == 0;
      uint64_t v13 = v11 + v12;
      if (__OFADD__(v11, v12))
      {
        __break(1u);
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }

      char v14 = v9;
      if (_swiftEmptyDictionarySingleton[3] >= v13)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v9 & 1) != 0) {
            goto LABEL_4;
          }
        }

        else
        {
          sub_1970C();
          if ((v14 & 1) != 0) {
            goto LABEL_4;
          }
        }
      }

      else
      {
        sub_18D1C(v13, isUniquelyReferenced_nonNull_native);
        unint64_t v15 = sub_2DF2C(v4, v3, v6, v5);
        if ((v14 & 1) != (v16 & 1))
        {
          uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for NvASRPhonemesDistances.PhonemesPair);
          __break(1u);
          return result;
        }

        unint64_t v10 = v15;
        if ((v14 & 1) != 0)
        {
LABEL_4:
          *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v10) = v7;
          goto LABEL_5;
        }
      }

      _swiftEmptyDictionarySingleton[(v10 >> 6) + 8] |= 1LL << v10;
      uint64_t v17 = (uint64_t *)(_swiftEmptyDictionarySingleton[6] + 32 * v10);
      *uint64_t v17 = v4;
      v17[1] = v3;
      v17[2] = v6;
      v17[3] = v5;
      *(void *)(_swiftEmptyDictionarySingleton[7] + 8 * v10) = v7;
      uint64_t v18 = _swiftEmptyDictionarySingleton[2];
      BOOL v19 = __OFADD__(v18, 1LL);
      uint64_t v20 = v18 + 1;
      if (v19) {
        goto LABEL_21;
      }
      _swiftEmptyDictionarySingleton[2] = v20;
      swift_bridgeObjectRetain(v3);
      swift_bridgeObjectRetain(v5);
LABEL_5:
      swift_bridgeObjectRelease_n(v5, 2LL);
      swift_bridgeObjectRelease_n(v3, 2LL);
      swift_bridgeObjectRelease(0x8000000000000000LL);
      v2 += 5;
      if (!--v1)
      {
        uint64_t v0 = v22;
        swift_bridgeObjectRelease(v22);
        goto LABEL_19;
      }
    }
  }

  swift_bridgeObjectRetain(qword_4FC40);
LABEL_19:
  qword_4FC48 = (uint64_t)_swiftEmptyDictionarySingleton;
  return swift_bridgeObjectRelease(v0);
}

unint64_t sub_181BC()
{
  uint64_t v0 = sub_501C(&qword_4B4F0);
  uint64_t inited = swift_initStackObject(v0, v21);
  *(_OWORD *)(inited + 16) = xmmword_39C00;
  *(void *)(inited + 3sub_541C(v0 + 2) = 1914726517LL;
  *(void *)(inited + 40) = 0xE400000000000000LL;
  uint64_t v2 = sub_501C((uint64_t *)&unk_4B6A0);
  uint64_t v3 = swift_allocObject(v2, 80LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_38C30;
  *(void *)(v3 + 3sub_541C(v0 + 2) = 1914720853LL;
  *(void *)(v3 + 40) = 0xE400000000000000LL;
  *(void *)(v3 + 48) = 29301LL;
  *(void *)(v3 + 56) = 0xE200000000000000LL;
  *(void *)(v3 + 64) = 21077LL;
  *(void *)(v3 + 7sub_541C(v0 + 2) = 0xE200000000000000LL;
  *(void *)(inited + 48) = v3;
  *(void *)(inited + 56) = 1814063221LL;
  *(void *)(inited + 64) = 0xE400000000000000LL;
  uint64_t v4 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v4 + 16) = xmmword_38B10;
  *(void *)(v4 + 3sub_541C(v0 + 2) = 27765LL;
  *(void *)(v4 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 7sub_541C(v0 + 2) = v4;
  *(void *)(inited + 80) = 1814054997LL;
  *(void *)(inited + 88) = 0xE400000000000000LL;
  uint64_t v5 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_38B10;
  *(void *)(v5 + 3sub_541C(v0 + 2) = 27765LL;
  *(void *)(v5 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 96) = v5;
  *(void *)(inited + 104) = 1847617653LL;
  *(void *)(inited + 11sub_541C(v0 + 2) = 0xE400000000000000LL;
  uint64_t v6 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v6 + 16) = xmmword_38B10;
  *(void *)(v6 + 3sub_541C(v0 + 2) = 28277LL;
  *(void *)(v6 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 120) = v6;
  *(void *)(inited + 128) = 1847609409LL;
  *(void *)(inited + 136) = 0xE400000000000000LL;
  uint64_t v7 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_38B10;
  *(void *)(v7 + 3sub_541C(v0 + 2) = 28277LL;
  *(void *)(v7 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 144) = v7;
  *(void *)(inited + 15sub_541C(v0 + 2) = 1830830401LL;
  *(void *)(inited + 160) = 0xE400000000000000LL;
  uint64_t v8 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_38B10;
  *(void *)(v8 + 3sub_541C(v0 + 2) = 28021LL;
  *(void *)(v8 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 168) = v8;
  *(void *)(inited + 176) = 1746949953LL;
  *(void *)(inited + 184) = 0xE400000000000000LL;
  uint64_t v9 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v9 + 16) = xmmword_38B10;
  *(void *)(v9 + 3sub_541C(v0 + 2) = 4740929LL;
  *(void *)(v9 + 40) = 0xE300000000000000LL;
  *(void *)(inited + 19sub_541C(v0 + 2) = v9;
  *(void *)(inited + 200) = 1212751976LL;
  *(void *)(inited + 208) = 0xE400000000000000LL;
  uint64_t v10 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v10 + 16) = xmmword_38B10;
  *(void *)(v10 + 3sub_541C(v0 + 2) = 1162158184LL;
  *(void *)(v10 + 40) = 0xE400000000000000LL;
  *(void *)(inited + 216) = v10;
  *(void *)(inited + 224) = 1830840437LL;
  *(void *)(inited + 23sub_541C(v0 + 2) = 0xE400000000000000LL;
  uint64_t v11 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_38B10;
  *(void *)(v11 + 3sub_541C(v0 + 2) = 28021LL;
  *(void *)(v11 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 240) = v11;
  *(void *)(inited + 248) = 2032167029LL;
  *(void *)(inited + 256) = 0xE400000000000000LL;
  uint64_t v12 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v12 + 16) = xmmword_38B10;
  *(void *)(v12 + 3sub_541C(v0 + 2) = 22863LL;
  *(void *)(v12 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 264) = v12;
  *(void *)(inited + 27sub_541C(v0 + 2) = 1847617641LL;
  *(void *)(inited + 280) = 0xE400000000000000LL;
  uint64_t v13 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v13 + 16) = xmmword_38B10;
  *(void *)(v13 + 3sub_541C(v0 + 2) = 28277LL;
  *(void *)(v13 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 288) = v13;
  *(void *)(inited + 296) = 1814054981LL;
  *(void *)(inited + 304) = 0xE400000000000000LL;
  uint64_t v14 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v14 + 16) = xmmword_38B10;
  *(void *)(v14 + 3sub_541C(v0 + 2) = 27765LL;
  *(void *)(v14 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 31sub_541C(v0 + 2) = v14;
  *(void *)(inited + 320) = 1847611215LL;
  *(void *)(inited + 328) = 0xE400000000000000LL;
  uint64_t v15 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v15 + 16) = xmmword_38B10;
  *(void *)(v15 + 3sub_541C(v0 + 2) = 28277LL;
  *(void *)(v15 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 336) = v15;
  *(void *)(inited + 344) = 1914718273LL;
  *(void *)(inited + 35sub_541C(v0 + 2) = 0xE400000000000000LL;
  uint64_t v16 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v16 + 16) = xmmword_38B10;
  *(void *)(v16 + 3sub_541C(v0 + 2) = 29301LL;
  *(void *)(v16 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 360) = v16;
  *(void *)(inited + 368) = 1914718293LL;
  *(void *)(inited + 376) = 0xE400000000000000LL;
  uint64_t v17 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v17 + 16) = xmmword_38B10;
  *(void *)(v17 + 3sub_541C(v0 + 2) = 21077LL;
  *(void *)(v17 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 384) = v17;
  *(void *)(inited + 39sub_541C(v0 + 2) = 1162158184LL;
  *(void *)(inited + 400) = 0xE400000000000000LL;
  uint64_t v18 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v18 + 16) = xmmword_38B10;
  *(void *)(v18 + 3sub_541C(v0 + 2) = 26729LL;
  *(void *)(v18 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 408) = v18;
  *(void *)(inited + 416) = 1847613249LL;
  *(void *)(inited + 424) = 0xE400000000000000LL;
  uint64_t v19 = swift_allocObject(v2, 48LL, 7LL);
  *(_OWORD *)(v19 + 16) = xmmword_38B10;
  *(void *)(v19 + 3sub_541C(v0 + 2) = 28277LL;
  *(void *)(v19 + 40) = 0xE200000000000000LL;
  *(void *)(inited + 43sub_541C(v0 + 2) = v19;
  unint64_t result = sub_1B0A0(inited);
  qword_4FC50 = result;
  return result;
}

unint64_t sub_1857C()
{
  uint64_t v0 = sub_501C(&qword_4B4F8);
  uint64_t v1 = *(void *)(sub_501C(&qword_4B500) - 8);
  uint64_t v2 = swift_allocObject( v0,  ((*(unsigned __int8 *)(v1 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))
       + 9LL * *(void *)(v1 + 72),
         *(unsigned __int8 *)(v1 + 80) | 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_39C10;
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 21333LL, 0xE200000000000000LL);
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 21333LL, 0xE200000000000000LL);
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 16967LL, 0xE200000000000000LL);
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 16967LL, 0xE200000000000000LL);
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 21825LL, 0xE200000000000000LL);
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 21825LL, 0xE200000000000000LL);
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 16707LL, 0xE200000000000000LL);
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 21333LL, 0xE200000000000000LL);
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 20041LL, 0xE200000000000000LL);
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 20041LL, 0xE200000000000000LL);
  Locale.init(language:region:)(29541LL, 0xE200000000000000LL, 21333LL, 0xE200000000000000LL);
  Locale.init(language:region:)(29541LL, 0xE200000000000000LL, 22605LL, 0xE200000000000000LL);
  Locale.init(language:region:)(29541LL, 0xE200000000000000LL, 22605LL, 0xE200000000000000LL);
  Locale.init(language:region:)(29541LL, 0xE200000000000000LL, 22605LL, 0xE200000000000000LL);
  Locale.init(language:region:)(29541LL, 0xE200000000000000LL, 21317LL, 0xE200000000000000LL);
  Locale.init(language:region:)(29541LL, 0xE200000000000000LL, 21317LL, 0xE200000000000000LL);
  Locale.init(language:region:)(29286LL, 0xE200000000000000LL, 21062LL, 0xE200000000000000LL);
  Locale.init(language:region:)(29286LL, 0xE200000000000000LL, 21062LL, 0xE200000000000000LL);
  unint64_t result = sub_1B2C8(v2);
  qword_4FC58 = result;
  return result;
}

unint64_t sub_18828()
{
  uint64_t v0 = sub_501C(&qword_4B518);
  uint64_t v1 = sub_501C(&qword_4B520);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 72);
  uint64_t v4 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v5 = (v4 + 32) & ~v4;
  uint64_t v6 = 8 * v3;
  uint64_t v7 = swift_allocObject(v0, v5 + 9 * v3, v4 | 7);
  *(_OWORD *)(v7 + 16) = xmmword_39C10;
  uint64_t v8 = v7 + v5;
  uint64_t v9 = (void *)(v8 + *(int *)(v1 + 48));
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 21333LL, 0xE200000000000000LL);
  *uint64_t v9 = 0xD000000000000013LL;
  v9[1] = 0x800000000003B810LL;
  uint64_t v10 = (void *)(v8 + v3 + *(int *)(v1 + 48));
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 16967LL, 0xE200000000000000LL);
  *uint64_t v10 = 0xD000000000000013LL;
  v10[1] = 0x800000000003B830LL;
  uint64_t v11 = (void *)(v8 + 2 * v3 + *(int *)(v1 + 48));
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 21825LL, 0xE200000000000000LL);
  *uint64_t v11 = 0xD000000000000013LL;
  v11[1] = 0x800000000003B850LL;
  uint64_t v12 = (void *)(v8 + 3 * v3 + *(int *)(v1 + 48));
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 16707LL, 0xE200000000000000LL);
  *uint64_t v12 = 0xD000000000000013LL;
  v12[1] = 0x800000000003B810LL;
  uint64_t v13 = (void *)(v8 + 4 * v3 + *(int *)(v1 + 48));
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 20041LL, 0xE200000000000000LL);
  *uint64_t v13 = 0xD000000000000013LL;
  v13[1] = 0x800000000003B870LL;
  uint64_t v14 = (void *)(v8 + 5 * v3 + *(int *)(v1 + 48));
  Locale.init(language:region:)(29541LL, 0xE200000000000000LL, 21333LL, 0xE200000000000000LL);
  *uint64_t v14 = 0xD000000000000013LL;
  v14[1] = 0x800000000003B890LL;
  uint64_t v15 = (void *)(v8 + 6 * v3 + *(int *)(v1 + 48));
  Locale.init(language:region:)(29541LL, 0xE200000000000000LL, 22605LL, 0xE200000000000000LL);
  *uint64_t v15 = 0xD000000000000013LL;
  v15[1] = 0x800000000003B890LL;
  uint64_t v16 = (void *)(v8 + 7 * v3 + *(int *)(v1 + 48));
  Locale.init(language:region:)(29541LL, 0xE200000000000000LL, 21317LL, 0xE200000000000000LL);
  *uint64_t v16 = 0xD000000000000013LL;
  v16[1] = 0x800000000003B8B0LL;
  uint64_t v17 = (void *)(v8 + v6 + *(int *)(v1 + 48));
  Locale.init(language:region:)(29286LL, 0xE200000000000000LL, 21062LL, 0xE200000000000000LL);
  *uint64_t v17 = 0xD000000000000013LL;
  v17[1] = 0x800000000003B8D0LL;
  unint64_t result = sub_1B470(v7);
  qword_4FC60 = result;
  return result;
}

uint64_t sub_18AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0LL;
  }
  if (!v2 || a1 == a2) {
    return 1LL;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  char v6 = *(_BYTE *)(a1 + 48);
  uint64_t v7 = *(void **)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v33 = a1;
  int v9 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v10 = *(void *)(a2 + 32);
  uint64_t v11 = *(void *)(a2 + 40);
  char v12 = *(_BYTE *)(a2 + 48);
  uint64_t v13 = *(void **)(a2 + 56);
  uint64_t v38 = *(void *)(a2 + 64);
  int v37 = *(unsigned __int8 *)(a2 + 72);
  if (v4 == v10 && (uint64_t v14 = *(void *)(a1 + 40), v5 == v11)
    || (char v15 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, v10, v11, 0LL), result = 0LL,
                                                                                  uint64_t v14 = v11,
                                                                                  (v15 & 1) != 0))
  {
    uint64_t v36 = v8;
    int v35 = v9;
    for (uint64_t i = 0LL; ; i += 48LL)
    {
      --v2;
      swift_bridgeObjectRetain(v5);
      id v18 = v7;
      swift_bridgeObjectRetain(v14);
      uint64_t v19 = v6;
      uint64_t v20 = *(void *)&aFirst_1[v19 * 8];
      uint64_t v21 = qword_39BD8[v19];
      uint64_t v22 = v12;
      uint64_t v23 = *(void *)&aFirst_1[v22 * 8];
      uint64_t v24 = qword_39BD8[v22];
      if (v20 == v23 && v21 == v24)
      {
        id v28 = v13;
        swift_bridgeObjectRelease(v21);
        swift_bridgeObjectRelease(v24);
      }

      else
      {
        char v26 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, v23, qword_39BD8[v12], 0LL);
        id v27 = v13;
        swift_bridgeObjectRelease(v21);
        swift_bridgeObjectRelease(v24);
        if ((v26 & 1) == 0)
        {

          swift_bridgeObjectRelease(v5);
          swift_bridgeObjectRelease(v11);
          return 0LL;
        }
      }

      sub_9C74(0LL, &qword_4AD50, &OBJC_CLASS___NSObject_ptr);
      char v29 = static NSObject.== infix(_:_:)(v18, v13);

      swift_bridgeObjectRelease(v5);
      swift_bridgeObjectRelease(v11);
      uint64_t result = 0LL;
      if ((v29 & 1) == 0 || v36 != v38 || ((v37 ^ v35) & 1) != 0) {
        return result;
      }
      if (!v2) {
        return 1LL;
      }
      uint64_t v30 = *(void *)(v33 + i + 80);
      uint64_t v5 = *(void *)(v33 + i + 88);
      char v6 = *(_BYTE *)(v33 + i + 96);
      uint64_t v7 = *(void **)(v33 + i + 104);
      uint64_t v36 = *(void *)(v33 + i + 112);
      int v31 = *(unsigned __int8 *)(v33 + i + 120);
      uint64_t v32 = *(void *)(a2 + i + 80);
      uint64_t v11 = *(void *)(a2 + i + 88);
      char v12 = *(_BYTE *)(a2 + i + 96);
      uint64_t v13 = *(void **)(a2 + i + 104);
      uint64_t v38 = *(void *)(a2 + i + 112);
      int v37 = *(unsigned __int8 *)(a2 + i + 120);
      if (v30 != v32 || (uint64_t v14 = *(void *)(v33 + i + 88), v5 != v11))
      {
        uint64_t v14 = *(void *)(a2 + i + 88);
        if ((_stringCompareWithSmolCheck(_:_:expecting:)(v30, v5, v32, v11, 0LL) & 1) == 0) {
          return 0LL;
        }
      }

      int v35 = v31;
    }
  }

  return result;
}

uint64_t sub_18D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_501C(&qword_4B4E0);
  char v51 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (*(void *)(v5 + 16))
  {
    uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v49 = (void *)(v5 + 64);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v48 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = v7 + 64;
    swift_retain(v5);
    int64_t v13 = 0LL;
    uint64_t v50 = v5;
    while (1)
    {
      if (v11)
      {
        uint64_t v53 = (v11 - 1) & v11;
        unint64_t v16 = __clz(__rbit64(v11)) | (v13 << 6);
      }

      else
      {
        if (__OFADD__(v13++, 1LL)) {
          goto LABEL_41;
        }
        if (v13 >= v48)
        {
LABEL_34:
          swift_release(v5);
          if ((v51 & 1) != 0)
          {
            uint64_t v46 = 1LL << *(_BYTE *)(v5 + 32);
            if (v46 >= 64) {
              bzero(v49, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
            }
            else {
              *uint64_t v49 = -1LL << v46;
            }
            *(void *)(v5 + 16) = 0LL;
          }

          break;
        }

        unint64_t v18 = v49[v13];
        if (!v18)
        {
          int64_t v19 = v13 + 1;
          if (v13 + 1 >= v48) {
            goto LABEL_34;
          }
          unint64_t v18 = v49[v19];
          if (!v18)
          {
            while (1)
            {
              int64_t v13 = v19 + 1;
              if (__OFADD__(v19, 1LL)) {
                break;
              }
              if (v13 >= v48) {
                goto LABEL_34;
              }
              unint64_t v18 = v49[v13];
              ++v19;
              if (v18) {
                goto LABEL_22;
              }
            }

LABEL_40:
            __break(1u);
LABEL_41:
            __break(1u);
            uint64_t result = swift_release(v54);
            __break(1u);
            return result;
          }

          ++v13;
        }

  __break(1u);
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

LABEL_22:
        uint64_t v53 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v13 << 6);
      }

      uint64_t v20 = *(void *)(v5 + 56);
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 32 * v16);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      uint64_t v24 = v21[2];
      uint64_t v25 = v21[3];
      uint64_t v26 = *(void *)(v20 + 8 * v16);
      if ((v51 & 1) == 0)
      {
        swift_bridgeObjectRetain(v21[1]);
        swift_bridgeObjectRetain(v25);
      }

      Hasher.init(_seed:)(v55, *(void *)(v8 + 40));
      uint64_t v27 = sub_501C((uint64_t *)&unk_4B6A0);
      uint64_t v28 = swift_allocObject(v27, 64LL, 7LL);
      *(_OWORD *)(v28 + 16) = xmmword_38B60;
      uint64_t v52 = v23;
      *(void *)(v28 + 3sub_541C(v0 + 2) = v23;
      *(void *)(v28 + 40) = v22;
      uint64_t v29 = v24;
      *(void *)(v28 + 48) = v24;
      *(void *)(v28 + 56) = v25;
      uint64_t v54 = v28;
      uint64_t v30 = v22;
      swift_bridgeObjectRetain(v22);
      uint64_t v31 = v25;
      swift_bridgeObjectRetain(v25);
      swift_bridgeObjectRetain(v28);
      sub_2E8D0(&v54);
      swift_bridgeObjectRelease(v28);
      uint64_t v32 = v54;
      uint64_t v33 = sub_501C(&qword_4B2B0);
      unint64_t v34 = sub_1A0DC();
      uint64_t v35 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v33, v34);
      uint64_t v37 = v36;
      swift_release(v32);
      String.hash(into:)(v55, v35, v37);
      swift_bridgeObjectRelease(v37);
      Swift::Int v38 = Hasher._finalize()();
      uint64_t v39 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v40 = v38 & ~v39;
      unint64_t v41 = v40 >> 6;
      if (((-1LL << v40) & ~*(void *)(v12 + 8 * (v40 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1LL << v40) & ~*(void *)(v12 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v42 = 0;
        unint64_t v43 = (unint64_t)(63 - v39) >> 6;
        do
        {
          if (++v41 == v43 && (v42 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }

          BOOL v44 = v41 == v43;
          if (v41 == v43) {
            unint64_t v41 = 0LL;
          }
          v42 |= v44;
          uint64_t v45 = *(void *)(v12 + 8 * v41);
        }

        while (v45 == -1);
        unint64_t v14 = __clz(__rbit64(~v45)) + (v41 << 6);
      }

      *(void *)(v12 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      char v15 = (void *)(*(void *)(v8 + 48) + 32 * v14);
      *char v15 = v52;
      v15[1] = v30;
      v15[2] = v29;
      v15[3] = v31;
      *(void *)(*(void *)(v8 + 56) + 8 * v14) = v26;
      ++*(void *)(v8 + 16);
      uint64_t v5 = v50;
      unint64_t v11 = v53;
    }
  }

  uint64_t result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

  uint64_t v24 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1LL << a3;
  uint64_t v25 = (void *)(*(void *)(v24 + 48) + 16 * a3);
  *uint64_t v25 = a1;
  v25[1] = a2;
  uint64_t v26 = *(void *)(v24 + 16);
  uint64_t v27 = __OFADD__(v26, 1LL);
  uint64_t v28 = v26 + 1;
  if (v27) {
    __break(1u);
  }
  else {
    *(void *)(v24 + 16) = v28;
  }
}

Swift::Int sub_190F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_501C(&qword_4B508);
  char v7 = a2;
  uint64_t v8 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v9 = v8;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  else {
    uint64_t v11 = -1LL;
  }
  unint64_t v12 = v11 & *(void *)(v5 + 64);
  uint64_t v35 = v3;
  int64_t v36 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v13 = v8 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v12)
    {
      unint64_t v21 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v22 = v21 | (v15 << 6);
      goto LABEL_34;
    }

    int64_t v23 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }

    if (v23 >= v36) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v36) {
        goto LABEL_36;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v15);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v36)
        {
LABEL_36:
          swift_release(v5);
          uint64_t v3 = v35;
          if ((v7 & 1) == 0) {
            goto LABEL_43;
          }
          goto LABEL_39;
        }

        unint64_t v25 = *(void *)(v37 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v15 = v26 + 1;
            if (__OFADD__(v26, 1LL)) {
              goto LABEL_45;
            }
            if (v15 >= v36) {
              goto LABEL_36;
            }
            unint64_t v25 = *(void *)(v37 + 8 * v15);
            ++v26;
            if (v25) {
              goto LABEL_33;
            }
          }
        }

        int64_t v15 = v26;
      }
    }

LABEL_33:
    unint64_t v12 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    uint64_t v31 = *(void *)(v5 + 56);
    uint64_t v32 = *(char *)(*(void *)(v5 + 48) + v22);
    uint64_t v33 = *(void *)(v31 + 8 * v22);
    if ((v7 & 1) == 0) {
      swift_bridgeObjectRetain(*(void *)(v31 + 8 * v22));
    }
    Hasher.init(_seed:)(v38, *(void *)(v9 + 40));
    uint64_t v16 = *(void *)&aPhoneset_2[8 * v32 + 8];
    String.hash(into:)(v38, *(void *)&aNvasr_3[8 * v32], v16);
    swift_bridgeObjectRelease(v16);
    Swift::Int result = Hasher._finalize()();
    uint64_t v17 = -1LL << *(_BYTE *)(v9 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1LL << v18) & ~*(void *)(v13 + 8 * (v18 >> 6))) != 0)
    {
      unint64_t v20 = __clz(__rbit64((-1LL << v18) & ~*(void *)(v13 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        BOOL v29 = v19 == v28;
        if (v19 == v28) {
          unint64_t v19 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v13 + 8 * v19);
      }

      while (v30 == -1);
      unint64_t v20 = __clz(__rbit64(~v30)) + (v19 << 6);
    }

    *(void *)(v13 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v20;
    *(_BYTE *)(*(void *)(v9 + 48) + v20) = v32;
    *(void *)(*(void *)(v9 + 56) + 8 * v20) = v33;
    ++*(void *)(v9 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v35;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v7 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  uint64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v24, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    void *v24 = -1LL << v34;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v9;
  return result;
}

  unint64_t v61 = _swiftEmptyArrayStorage;
  sub_337CC(0, v45, 0);
  uint64_t v46 = v61;
  uint64_t v47 = v61[2];
  int64_t v48 = 4LL;
  do
  {
    uint64_t v49 = v19[v48];
    unint64_t v61 = v46;
    uint64_t v50 = v46[3];
    if (v47 >= v50 >> 1)
    {
      sub_337CC(v50 > 1, v47 + 1, 1);
      uint64_t v46 = v61;
    }

    v46[2] = v47 + 1;
    v46[v47 + 4] = v49;
    v48 += 3LL;
    ++v47;
    --v45;
  }

  while (v45);
  swift_release(v19);
LABEL_40:
  swift_bridgeObjectRetain(v16);
  char v51 = sub_31DF8((uint64_t)v46, v16);
  swift_bridgeObjectRelease(v46);
  swift_bridgeObjectRelease_n(v16, 2LL);
  swift_bridgeObjectRetain(v51);
  uint64_t v53 = sub_31F38(v52);
  swift_bridgeObjectRelease(v51);
  int64_t v36 = sub_2E7EC(v53);
  swift_bridgeObjectRelease(v51);
  swift_bridgeObjectRelease(v53);
  return v36;
}

Swift::Int sub_19408(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_501C(&qword_4B510);
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  char v34 = a2;
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v35 = v3;
  uint64_t v36 = v5 + 64;
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v5 + 64);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v13 = v7 + 64;
  Swift::Int result = swift_retain(v5);
  int64_t v15 = 0LL;
  while (1)
  {
    if (v11)
    {
      unint64_t v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v18 = v17 | (v15 << 6);
      goto LABEL_25;
    }

    int64_t v19 = v15 + 1;
    if (__OFADD__(v15, 1LL))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }

    if (v19 >= v12) {
      break;
    }
    unint64_t v20 = (void *)(v5 + 64);
    unint64_t v21 = *(void *)(v36 + 8 * v19);
    ++v15;
    if (!v21)
    {
      int64_t v15 = v19 + 1;
      if (v19 + 1 >= v12) {
        goto LABEL_34;
      }
      unint64_t v21 = *(void *)(v36 + 8 * v15);
      if (!v21)
      {
        int64_t v22 = v19 + 2;
        if (v22 >= v12)
        {
LABEL_34:
          swift_release(v5);
          uint64_t v3 = v35;
          if ((v34 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }

        unint64_t v21 = *(void *)(v36 + 8 * v22);
        if (!v21)
        {
          while (1)
          {
            int64_t v15 = v22 + 1;
            if (__OFADD__(v22, 1LL)) {
              goto LABEL_43;
            }
            if (v15 >= v12) {
              goto LABEL_34;
            }
            unint64_t v21 = *(void *)(v36 + 8 * v15);
            ++v22;
            if (v21) {
              goto LABEL_24;
            }
          }
        }

        int64_t v15 = v22;
      }
    }

LABEL_24:
    unint64_t v11 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v15 << 6);
LABEL_25:
    uint64_t v23 = *(char *)(*(void *)(v5 + 48) + v18);
    uint64_t v24 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
    Hasher.init(_seed:)(v37, *(void *)(v8 + 40));
    uint64_t v25 = *(void *)&aPhoneset_2[8 * v23 + 8];
    String.hash(into:)(v37, *(void *)&aNvasr_3[8 * v23], v25);
    swift_bridgeObjectRelease(v25);
    Swift::Int result = Hasher._finalize()();
    uint64_t v26 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1LL << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v16 = __clz(__rbit64((-1LL << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }

        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0LL;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }

      while (v32 == -1);
      unint64_t v16 = __clz(__rbit64(~v32)) + (v28 << 6);
    }

    *(void *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v16;
    *(_BYTE *)(*(void *)(v8 + 48) + v16) = v23;
    *(void *)(*(void *)(v8 + 56) + 8 * v16) = v24;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v35;
  unint64_t v20 = (void *)(v5 + 64);
  if ((v34 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v20, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *unint64_t v20 = -1LL << v33;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_41:
  Swift::Int result = swift_release(v5);
  *uint64_t v3 = v8;
  return result;
}

        __break(1u);
        goto LABEL_25;
      }

void sub_1970C()
{
  uint64_t v1 = v0;
  sub_501C(&qword_4B4E0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    swift_release(v2);
    *uint64_t v1 = v4;
    return;
  }

  uint64_t v5 = (void *)(v3 + 64);
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
    uint64_t v16 = 32 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + 32 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = v17[2];
    uint64_t v20 = v17[3];
    uint64_t v21 = 8 * v15;
    uint64_t v22 = *(void *)(*(void *)(v2 + 56) + v21);
    uint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = *v17;
    v23[1] = v18;
    v23[2] = v19;
    v23[3] = v20;
    *(void *)(*(void *)(v4 + 56) + v21) = v22;
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v20);
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
}

void sub_198B0()
{
  uint64_t v1 = v0;
  sub_501C(&qword_4B508);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    swift_release(v2);
    *uint64_t v1 = v4;
    return;
  }

  uint64_t v5 = (void *)(v3 + 64);
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

    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(void *)(v4 + 48) + v15) = *(_BYTE *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    swift_bridgeObjectRetain(v16);
  }

  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }

    uint64_t v20 = __clz(__rbit64(v18));
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = v20 + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(void *)(v4 + 48) + v15) = *(_BYTE *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
  }

  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }

void *sub_19A50()
{
  uint64_t v1 = v0;
  sub_501C(&qword_4B510);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    Swift::Int result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 64);
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

    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }

uint64_t sub_19BDC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a1 == a4 && a2 == a5 || (char v8 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a4, a5, 0LL) & 1) != 0))
  {
    uint64_t v9 = 8LL * a3;
    uint64_t v10 = *(void *)&aFirst_1[v9];
    uint64_t v11 = *(void *)((char *)&unk_39BD8 + v9);
    uint64_t v12 = 8LL * a6;
    uint64_t v13 = *(void *)&aFirst_1[v12];
    uint64_t v14 = *(void *)((char *)&unk_39BD8 + v12);
    if (v10 == v13 && v11 == v14) {
      char v8 = 1;
    }
    else {
      char v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v10, v11, v13, *(void *)((char *)&unk_39BD8 + v12), 0LL);
    }
    swift_bridgeObjectRelease(v11);
    swift_bridgeObjectRelease(v14);
  }

  return v8 & 1;
}

uint64_t sub_19C90(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  if ((sub_18AA4(a1, a5) & 1) == 0) {
    return 0LL;
  }
  if (a2)
  {
    if (!a6) {
      return 0LL;
    }
    sub_9C74(0LL, (unint64_t *)&qword_4B560, &OBJC_CLASS___SISchemaUUID_ptr);
    id v14 = a6;
    id v15 = a2;
    char v16 = static NSObject.== infix(_:_:)(v15, v14);

    if ((v16 & 1) == 0) {
      return 0LL;
    }
  }

  else if (a6)
  {
    return 0LL;
  }

  if (a3)
  {
    if (!a7) {
      return 0LL;
    }
    sub_9C74(0LL, (unint64_t *)&qword_4B560, &OBJC_CLASS___SISchemaUUID_ptr);
    id v17 = a7;
    id v18 = a3;
    char v19 = static NSObject.== infix(_:_:)(v18, v17);

    if ((v19 & 1) == 0) {
      return 0LL;
    }
  }

  else if (a7)
  {
    return 0LL;
  }

  if (a4)
  {
    if (a8)
    {
      sub_9C74(0LL, (unint64_t *)&qword_4B560, &OBJC_CLASS___SISchemaUUID_ptr);
      id v20 = a8;
      id v21 = a4;
      char v22 = static NSObject.== infix(_:_:)(v21, v20);

      if ((v22 & 1) != 0) {
        return 1LL;
      }
    }
  }

  else if (!a8)
  {
    return 1LL;
  }

  return 0LL;
}

uint64_t sub_19DEC(uint64_t a1, uint64_t a2)
{
  if ((sub_19C90( *(void *)a1,  *(void **)(a1 + 8),  *(void **)(a1 + 16),  *(void **)(a1 + 24),  *(void *)a2,  *(void **)(a2 + 8),  *(void **)(a2 + 16),  *(void **)(a2 + 24)) & 1) == 0) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a2 + 40);
  if (v4)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v8 = *(void *)(a2 + 32);
      int v9 = *(unsigned __int8 *)(a2 + 48);
      if (v6 == v8 && v4 == v5)
      {
        if ((v7 & 1) != (v9 & 1)) {
          return 0LL;
        }
      }

      else if ((_stringCompareWithSmolCheck(_:_:expecting:)(v6, v4, v8, v5, 0LL) & 1) == 0 || ((v7 ^ v9) & 1) != 0)
      {
        return 0LL;
      }

      return 1LL;
    }
  }

  else if (!v5)
  {
    return 1LL;
  }

  return 0LL;
}

uint64_t sub_19E94(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = *((char *)a1 + 16);
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v8 = *(char *)(a2 + 16);
  BOOL v9 = v4 == *(void *)a2 && v5 == v7;
  if (v9
    || (char v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *(void *)a2, v7, 0LL), v11 = 0, (v10 & 1) != 0))
  {
    uint64_t v12 = *(void *)&aFirst_1[8 * v6];
    uint64_t v13 = qword_39BD8[v6];
    uint64_t v14 = *(void *)&aFirst_1[8 * v8];
    uint64_t v15 = qword_39BD8[v8];
    if (v12 == v14 && v13 == v15)
    {
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v15);
    }

    else
    {
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v13, v14, v15, 0LL);
      swift_bridgeObjectRelease(v13);
      swift_bridgeObjectRelease(v15);
      char v11 = 0;
      if ((v17 & 1) == 0) {
        return v11 & 1;
      }
    }

    sub_9C74(0LL, &qword_4AD50, &OBJC_CLASS___NSObject_ptr);
    if ((static NSObject.== infix(_:_:)(a1[3], *(void *)(a2 + 24)) & 1) != 0 && a1[4] == *(void *)(a2 + 32)) {
      char v11 = ((a1[5] & 1) == 0) ^ *(_BYTE *)(a2 + 40);
    }
    else {
      char v11 = 0;
    }
  }

  return v11 & 1;
}

unint64_t sub_19FC4(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_45278, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 3) {
    return 3LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_1A00C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_452E0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4) {
    return 4LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_1A054()
{
  unint64_t result = qword_4B4A8;
  if (!qword_4B4A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3961C, &type metadata for PhonemeFormat);
    atomic_store(result, (unint64_t *)&qword_4B4A8);
  }

  return result;
}

unint64_t sub_1A098()
{
  unint64_t result = qword_4B4B8;
  if (!qword_4B4B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_395CC, &type metadata for PhonemeFormat);
    atomic_store(result, (unint64_t *)&qword_4B4B8);
  }

  return result;
}

unint64_t sub_1A0DC()
{
  unint64_t result = qword_4B4C0;
  if (!qword_4B4C0)
  {
    uint64_t v1 = sub_101A8(&qword_4B2B0);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_4B4C0);
  }

  return result;
}

ValueMetadata *type metadata accessor for NvASRPhonemesDistances()
{
  return &type metadata for NvASRPhonemesDistances;
}

uint64_t destroy for NvASRPhonemesDistances.PhonemesPair(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 24));
}

void *initializeWithCopy for NvASRPhonemesDistances.PhonemesPair(void *a1, void *a2)
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

void *assignWithCopy for NvASRPhonemesDistances.PhonemesPair(void *a1, void *a2)
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

__n128 initializeWithTake for NvASRPhonemesDistances.PhonemesPair(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for NvASRPhonemesDistances.PhonemesPair(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for NvASRPhonemesDistances.PhonemesPair(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(vsub_541C(v0 + 2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NvASRPhonemesDistances.PhonemesPair(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 3sub_541C(v0 + 2) = 1;
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

    *(_BYTE *)(result + 3sub_541C(v0 + 2) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for NvASRPhonemesDistances.PhonemesPair()
{
  return &type metadata for NvASRPhonemesDistances.PhonemesPair;
}

ValueMetadata *type metadata accessor for NamePart()
{
  return &type metadata for NamePart;
}

void destroy for ASRToken(uint64_t a1)
{
}

uint64_t initializeWithCopy for ASRToken(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  uint64_t v5 = *(void **)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = v5;
  *(void *)(a1 + 3sub_541C(v0 + 2) = v4;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain(v3);
  id v6 = v5;
  return a1;
}

uint64_t assignWithCopy for ASRToken(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  id v6 = *(void **)(a2 + 24);
  uint64_t v7 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v6;
  id v8 = v6;

  *(void *)(a1 + 3sub_541C(v0 + 2) = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

__n128 initializeWithTake for ASRToken(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ASRToken(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  id v6 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);

  *(void *)(a1 + 3sub_541C(v0 + 2) = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASRToken(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 41)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(vsub_541C(v0 + 2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASRToken(uint64_t result, int a2, int a3)
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 41) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ASRToken()
{
  return &type metadata for ASRToken;
}

uint64_t destroy for TMDCConversationData(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 40));
}

uint64_t initializeWithCopy for TMDCConversationData(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = (void *)a2[1];
  *(void *)a1 = *a2;
  *(void *)(a1 + 8) = v4;
  uint64_t v5 = (void *)a2[2];
  id v6 = (void *)a2[3];
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = a2[5];
  *(void *)(a1 + 3sub_541C(v0 + 2) = a2[4];
  *(void *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
  swift_bridgeObjectRetain(v3);
  id v8 = v4;
  id v9 = v5;
  id v10 = v6;
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t *assignWithCopy for TMDCConversationData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  id v6 = (void *)a1[1];
  uint64_t v7 = (void *)a2[1];
  a1[1] = (uint64_t)v7;
  id v8 = v7;

  id v9 = (void *)a1[2];
  id v10 = (void *)a2[2];
  a1[2] = (uint64_t)v10;
  id v11 = v10;

  uint64_t v12 = (void *)a1[3];
  uint64_t v13 = (void *)a2[3];
  a1[3] = (uint64_t)v13;
  id v14 = v13;

  a1[4] = a2[4];
  uint64_t v15 = a2[5];
  uint64_t v16 = a1[5];
  a1[5] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  return a1;
}

__n128 initializeWithTake for TMDCConversationData(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  __int128 v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 3sub_541C(v0 + 2) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for TMDCConversationData(uint64_t a1, uint64_t a2)
{
  __int128 v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  uint64_t v6 = *(void *)(a2 + 40);
  uint64_t v7 = *(void *)(a1 + 40);
  *(void *)(a1 + 3sub_541C(v0 + 2) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease(v7);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for TMDCConversationData(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TMDCConversationData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0LL;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 49) = 1;
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

    *(_BYTE *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TMDCConversationData()
{
  return &type metadata for TMDCConversationData;
}

uint64_t storeEnumTagSinglePayload for Domain(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A7CC + 4 * byte_3956F[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A800 + 4 * byte_3956A[v4]))();
}

uint64_t sub_1A800(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A808(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1A810LL);
  }
  return result;
}

uint64_t sub_1A81C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1A824LL);
  }
  *(_BYTE *)__n128 result = a2 + 1;
  return result;
}

uint64_t sub_1A828(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A830(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Domain()
{
  return &type metadata for Domain;
}

uint64_t destroy for TMDCPostSiriEngagementData(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 8));
}

uint64_t assignWithCopy for ASRContactName(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for ASRContactName(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ASRContactName(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for TMDCPostSiriEngagementData()
{
  return &type metadata for TMDCPostSiriEngagementData;
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin8NamePartOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A960 + 4 * byte_39579[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A994 + 4 * byte_39574[v4]))();
}

uint64_t sub_1A994(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A99C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1A9A4LL);
  }
  return result;
}

uint64_t sub_1A9B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1A9B8LL);
  }
  *(_BYTE *)__n128 result = a2 + 2;
  return result;
}

uint64_t sub_1A9BC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A9C4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PhonemeString.CodingKeys()
{
  return &type metadata for PhonemeString.CodingKeys;
}

unint64_t sub_1A9E4()
{
  unint64_t result = qword_4B528;
  if (!qword_4B528)
  {
    unint64_t result = swift_getWitnessTable(&unk_39828, &type metadata for PhonemeString.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B528);
  }

  return result;
}

unint64_t sub_1AA2C()
{
  unint64_t result = qword_4B530;
  if (!qword_4B530)
  {
    unint64_t result = swift_getWitnessTable(&unk_39968, &type metadata for NamePart);
    atomic_store(result, (unint64_t *)&qword_4B530);
  }

  return result;
}

unint64_t sub_1AA74()
{
  unint64_t result = qword_4B538;
  if (!qword_4B538)
  {
    unint64_t result = swift_getWitnessTable(&unk_39990, &type metadata for NvASRPhonemesDistances.PhonemesPair);
    atomic_store(result, (unint64_t *)&qword_4B538);
  }

  return result;
}

unint64_t sub_1AABC()
{
  unint64_t result = qword_4B540;
  if (!qword_4B540)
  {
    unint64_t result = swift_getWitnessTable(&unk_39878, &type metadata for Domain);
    atomic_store(result, (unint64_t *)&qword_4B540);
  }

  return result;
}

unint64_t sub_1AB04()
{
  unint64_t result = qword_4B548;
  if (!qword_4B548)
  {
    unint64_t result = swift_getWitnessTable(&unk_39798, &type metadata for PhonemeString.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B548);
  }

  return result;
}

unint64_t sub_1AB4C()
{
  unint64_t result = qword_4B550;
  if (!qword_4B550)
  {
    unint64_t result = swift_getWitnessTable(&unk_397C0, &type metadata for PhonemeString.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4B550);
  }

  return result;
}

uint64_t sub_1AB90(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x736C6F626D7973LL && a2 == 0xE700000000000000LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x736C6F626D7973LL, 0xE700000000000000LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x676E69646F636E65LL && a2 == 0xE800000000000000LL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x676E69646F636E65LL, 0xE800000000000000LL, a1, a2, 0LL) & 1) != 0)
  }
  {
    swift_bridgeObjectRelease(a2);
    return 1LL;
  }

  else if (a1 == 0x797261646E756F62LL && a2 == 0xE800000000000000LL)
  {
    swift_bridgeObjectRelease(0xE800000000000000LL);
    return 2LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x797261646E756F62LL, 0xE800000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 3LL;
    }
  }

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin14ASRContactNameVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin14ASRContactNameVwet_0(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(vsub_541C(v0 + 2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1AD50(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 1sub_541C(v0 + 7) = 1;
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

    *(_BYTE *)(result + 1sub_541C(v0 + 7) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ASRContactName()
{
  return &type metadata for ASRContactName;
}

void destroy for ASRLoggedToken(uint64_t a1)
{
}

uint64_t *initializeWithCopy for ASRLoggedToken(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = (uint64_t)v4;
  uint64_t v5 = (void *)a2[2];
  char v6 = (void *)a2[3];
  a1[2] = (uint64_t)v5;
  a1[3] = (uint64_t)v6;
  swift_bridgeObjectRetain(v3);
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  return a1;
}

uint64_t *assignWithCopy for ASRLoggedToken(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  char v6 = (void *)a1[1];
  id v7 = (void *)a2[1];
  a1[1] = (uint64_t)v7;
  id v8 = v7;

  id v9 = (void *)a1[2];
  id v10 = (void *)a2[2];
  a1[2] = (uint64_t)v10;
  id v11 = v10;

  uint64_t v12 = (void *)a1[3];
  uint64_t v13 = (void *)a2[3];
  a1[3] = (uint64_t)v13;
  id v14 = v13;

  return a1;
}

uint64_t assignWithTake for ASRLoggedToken(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  uint64_t v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for ASRLoggedToken(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASRLoggedToken(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)unint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 3sub_541C(v0 + 2) = 1;
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
      *(void *)unint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 3sub_541C(v0 + 2) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ASRLoggedToken()
{
  return &type metadata for ASRLoggedToken;
}

uint64_t sub_1AF94(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001LL;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v3 = a1;
    }
    else {
      uint64_t v3 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v4 = __CocoaSet.startIndex.getter(v3);
    uint64_t v6 = v5;
    uint64_t v7 = __CocoaSet.endIndex.getter(v3);
    char v9 = static __CocoaSet.Index.== infix(_:_:)(v4, v6, v7, v8);
    swift_bridgeObjectRelease(v7);
    if ((v9 & 1) != 0) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }

  uint64_t result = sub_1D770(a1);
  if ((v13 & 1) == 0)
  {
    uint64_t v6 = v12;
    if (*(_DWORD *)(a1 + 36) == (_DWORD)v12)
    {
      uint64_t v4 = result;
      if (result == 1LL << *(_BYTE *)(a1 + 32))
      {
LABEL_6:
        sub_1DC68(v4, v6, v2 != 0);
        return 0LL;
      }

LABEL_10:
      sub_1D528(v4, v6, v2 != 0, a1);
      uint64_t v10 = v14;
      sub_1DC68(v4, v6, v2 != 0);
      return v10;
    }

    __break(1u);
  }

  __break(1u);
  return result;
}

unint64_t sub_1B0A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = _swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_501C((uint64_t *)&unk_4B700);
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
    unint64_t result = sub_2DEC8(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v7;
    v12[1] = v8;
    *(void *)(v4[7] + 8 * result) = v9;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
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

unint64_t sub_1B1B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_501C(&qword_4B6F8);
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
  uint64_t v6 = (_BYTE *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *((void *)v6 - 2);
    uint64_t v8 = *((void *)v6 - 1);
    char v9 = *v6;
    swift_bridgeObjectRetain(v8);
    unint64_t result = sub_2DEC8(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *uint64_t v12 = v7;
    v12[1] = v8;
    *(_BYTE *)(v4[7] + result) = v9;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v6 += 24;
    v4[2] = v15;
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

unint64_t sub_1B2C8(uint64_t a1)
{
  uint64_t v2 = sub_501C(&qword_4B500);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v27 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v27);
    return (unint64_t)v8;
  }

  sub_501C((uint64_t *)&unk_4B710);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = &v5[*(int *)(v2 + 48)];
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v29 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1FB58(v13, (uint64_t)v5, &qword_4B500);
    unint64_t result = sub_2E030((uint64_t)v5);
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for Locale(0LL);
    uint64_t v20 = *(void *)(v19 - 8);
    unint64_t v21 = *(void *)(v20 + 72) * v17;
    uint64_t v22 = v18 + v21;
    uint64_t v23 = *(void (**)(uint64_t, char *, uint64_t))(v20 + 32);
    v23(v22, v5, v19);
    unint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(v8[7] + v21, v10, v19);
    uint64_t v24 = v8[2];
    BOOL v25 = __OFADD__(v24, 1LL);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_12;
    }
    _OWORD v8[2] = v26;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v27 = v29;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_1B470(uint64_t a1)
{
  uint64_t v2 = sub_501C(&qword_4B520);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    uint64_t v25 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v25);
    return (unint64_t)v8;
  }

  sub_501C((uint64_t *)&unk_4B720);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)(v6);
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v10 = &v5[*(int *)(v2 + 48)];
  uint64_t v11 = v7 + 64;
  unint64_t v12 = (*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v27 = a1;
  uint64_t v13 = a1 + v12;
  uint64_t v14 = *(void *)(v3 + 72);
  swift_retain(v7);
  while (1)
  {
    sub_1FB58(v13, (uint64_t)v5, &qword_4B520);
    unint64_t result = sub_2E030((uint64_t)v5);
    if ((v16 & 1) != 0) {
      break;
    }
    unint64_t v17 = result;
    *(void *)(v11 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v18 = v8[6];
    uint64_t v19 = type metadata accessor for Locale(0LL);
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v19 - 8) + 32LL))( v18 + *(void *)(*(void *)(v19 - 8) + 72LL) * v17,  v5,  v19);
    uint64_t v20 = (void *)(v8[7] + 16 * v17);
    uint64_t v21 = *((void *)v10 + 1);
    *uint64_t v20 = *(void *)v10;
    v20[1] = v21;
    uint64_t v22 = v8[2];
    BOOL v23 = __OFADD__(v22, 1LL);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_12;
    }
    _OWORD v8[2] = v24;
    v13 += v14;
    if (!--v9)
    {
      swift_release(v8);
      uint64_t v25 = v27;
      goto LABEL_10;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_1B60C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = _swiftEmptyDictionarySingleton;
LABEL_10:
    uint64_t v24 = v1;
LABEL_11:
    swift_bridgeObjectRelease(v24);
    return (unint64_t)v4;
  }

  sub_501C(&qword_4B6E0);
  uint64_t v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(void *)(v1 + 16);
  if (!v5) {
    goto LABEL_10;
  }
  uint64_t v26 = v3 + 64;
  swift_retain(v3);
  uint64_t v28 = v5 - 1;
  uint64_t v6 = 32LL;
  for (i = v1; ; uint64_t v1 = i)
  {
    uint64_t v27 = v6;
    uint64_t v7 = v1 + v6;
    __int128 v8 = *(_OWORD *)(v7 + 48);
    __int128 v38 = *(_OWORD *)(v7 + 32);
    __int128 v39 = v8;
    __int128 v9 = *(_OWORD *)(v7 + 80);
    __int128 v40 = *(_OWORD *)(v7 + 64);
    __int128 v41 = v9;
    __int128 v10 = *(_OWORD *)(v7 + 112);
    __int128 v42 = *(_OWORD *)(v7 + 96);
    __int128 v43 = v10;
    __int128 v11 = *(_OWORD *)(v7 + 16);
    v37[0] = *(_OWORD *)v7;
    v37[1] = v11;
    char v12 = *(_BYTE *)(v7 + 128);
    char v44 = v12;
    __int128 v13 = v11;
    __int128 v14 = v38;
    char v15 = v39;
    uint64_t v16 = *((void *)&v39 + 1);
    uint64_t v35 = *((void *)&v40 + 1);
    uint64_t v36 = v40;
    uint64_t v34 = v41;
    char v33 = BYTE8(v41);
    uint64_t v31 = *((void *)&v42 + 1);
    uint64_t v32 = v42;
    uint64_t v29 = *((void *)&v10 + 1);
    uint64_t v30 = v10;
    __int128 v17 = v37[0];
    sub_1FA64(v37);
    unint64_t result = sub_2DEC8(v17, *((uint64_t *)&v17 + 1));
    if ((v19 & 1) != 0) {
      break;
    }
    *(void *)(v26 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    *(_OWORD *)(v4[6] + 16 * result) = v17;
    uint64_t v20 = v4[7] + 120 * result;
    *(_OWORD *)uint64_t v20 = v13;
    *(_OWORD *)(v20 + 16) = v14;
    *(_BYTE *)(v20 + 3sub_541C(v0 + 2) = v15;
    *(void *)(v20 + 40) = v16;
    *(void *)(v20 + 48) = v36;
    *(void *)(v20 + 56) = v35;
    *(void *)(v20 + 64) = v34;
    *(_BYTE *)(v20 + 7sub_541C(v0 + 2) = v33;
    *(void *)(v20 + 80) = v32;
    *(void *)(v20 + 88) = v31;
    *(void *)(v20 + 96) = v30;
    *(void *)(v20 + 104) = v29;
    *(_BYTE *)(v20 + 11sub_541C(v0 + 2) = v12;
    uint64_t v21 = v4[2];
    BOOL v22 = __OFADD__(v21, 1LL);
    uint64_t v23 = v21 + 1;
    if (v22) {
      goto LABEL_13;
    }
    v4[2] = v23;
    if (!v28)
    {
      swift_release(v4);
      uint64_t v24 = i;
      goto LABEL_11;
    }

    --v28;
    uint64_t v6 = v27 + 136;
  }

  __break(1u);
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_1B804()
{
  uint64_t v0 = sub_501C(&qword_4B688);
  uint64_t v1 = type metadata accessor for Locale(0LL);
  uint64_t v2 = swift_allocObject( v0,  ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL))
       + 2LL * *(void *)(*(void *)(v1 - 8) + 72LL),
         *(unsigned __int8 *)(*(void *)(v1 - 8) + 80LL) | 7LL);
  *(_OWORD *)(v2 + 16) = xmmword_38B60;
  Locale.init(language:region:)(28261LL, 0xE200000000000000LL, 20041LL, 0xE200000000000000LL);
  uint64_t result = Locale.init(language:region:)(29286LL, 0xE200000000000000LL, 21062LL, 0xE200000000000000LL);
  qword_4FC68 = v2;
  return result;
}

void *sub_1B8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2;
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_4F30(v8, (uint64_t)qword_4FC70);
  __int128 v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    char v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)char v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "Start runTTSOverrider()", v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  sub_1F938(a1 + 32, (uint64_t)v122, &qword_4B6C8);
  uint64_t v13 = sub_1F938((uint64_t)v122, (uint64_t)&v123, &qword_4B6C8);
  if (!v124)
  {
    char v19 = (os_log_s *)Logger.logObject.getter(v13);
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_0, v19, v20, "No post Siri engagement data found", v21, 2u);
      swift_slowDealloc(v21, -1LL, -1LL);
    }

    goto LABEL_21;
  }

  char v14 = v125;
  id v15 = sub_1C980(v123, v124);
  if (v3) {
    goto LABEL_7;
  }
  uint64_t v4 = v15;
  if (!v15) {
    goto LABEL_22;
  }
  int v22 = *(unsigned __int8 *)(a2 + 16);
  if (!sub_1D7F8(v15, *(void *)a2, *(void *)(a2 + 8), *(_BYTE *)(a2 + 16)))
  {
    id v25 = v4;
    char v19 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v26 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v26))
    {
      uint64_t v27 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      os_log_type_t v117 = (os_log_s *)swift_slowAlloc(32LL, -1LL);
      os_log_t v120 = v117;
      *(_DWORD *)uint64_t v27 = 136315138;
      buf = v27;
      id v28 = [v25 identifier];
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
      unint64_t v31 = v30;

      uint64_t v119 = sub_25824(v29, v31, (uint64_t *)&v120);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v119, &v120);

      swift_bridgeObjectRelease(v31);
      uint64_t v32 = "ASR contact name does not match the contact name, skipping correcting mispronunciation for contact ID: %s";
LABEL_20:
      _os_log_impl(&dword_0, v19, v26, v32, buf, 0xCu);
      swift_arrayDestroy(v117, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v117, -1LL, -1LL);
      swift_slowDealloc(buf, -1LL, -1LL);

LABEL_21:
LABEL_22:
      uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
      os_log_type_t v38 = static os_log_type_t.debug.getter();
      if (!os_log_type_enabled(v16, v38))
      {
        uint64_t v4 = 0LL;
        goto LABEL_26;
      }

      __int128 v39 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)__int128 v39 = 0;
      _os_log_impl(&dword_0, v16, v38, "End runTTSOverrider()", v39, 2u);
      uint64_t v4 = 0LL;
      goto LABEL_24;
    }

LABEL_27:
    goto LABEL_22;
  }

  if ((sub_1CEC8(v4, v14 & 1) & 1) == 0)
  {
    id v25 = v4;
    char v19 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v26 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v19, v26))
    {
      char v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      os_log_type_t v117 = (os_log_s *)swift_slowAlloc(32LL, -1LL);
      os_log_t v120 = v117;
      *(_DWORD *)char v33 = 136315138;
      buf = v33;
      id v34 = [v25 identifier];
      uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)(v34);
      unint64_t v37 = v36;

      uint64_t v119 = sub_25824(v35, v37, (uint64_t *)&v120);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v119, &v120);

      swift_bridgeObjectRelease(v37);
      uint64_t v32 = "Pronunciation is not overridable, skipping correcting mispronunciation for contact ID: %s";
      goto LABEL_20;
    }

    goto LABEL_27;
  }

  uint64_t v23 = *(_BYTE **)(a2 + 24);
  uint64_t v24 = sub_1C598(v23);
  __int128 v41 = (void *)v24;
  if (!v24)
  {
    os_log_t v120 = 0LL;
    unint64_t v121 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(51LL);
    v56._countAndFlagsBits = 0x74276E646C756F43LL;
    v56._object = (void *)0xED00002070616D20LL;
    String.append(_:)(v56);
    os_log_type_t v57 = v23;
    id v58 = [v57 description];
    uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
    unint64_t v61 = v60;

    v62._countAndFlagsBits = v59;
    v62._object = v61;
    String.append(_:)(v62);

    swift_bridgeObjectRelease(v61);
    v63._countAndFlagsBits = 0xD00000000000001BLL;
    v63._object = (void *)0x800000000003B9B0LL;
    String.append(_:)(v63);
    v64._countAndFlagsBits = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
    object = v64._object;
    String.append(_:)(v64);
    swift_bridgeObjectRelease(object);
    v66._countAndFlagsBits = 0x656C61636F6C20LL;
    v66._object = (void *)0xE700000000000000LL;
    String.append(_:)(v66);
    unint64_t v67 = sub_1DBE4();
    uint64_t v68 = swift_allocError(&type metadata for TTSContactOverriderError, v67, 0LL, 0LL);
    void *v69 = 0LL;
    v69[1] = 0xE000000000000000LL;
    swift_willThrow(v68);

    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v70);
    os_log_type_t v17 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v16, v17)) {
      goto LABEL_26;
    }
    goto LABEL_8;
  }

  uint64_t v118 = v5 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
  unint64_t v42 = sub_1E9C8( v22,  v24,  v5 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale);
  if (!v42)
  {
    _StringGuts.grow(_:)(40LL);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    os_log_t v120 = (os_log_t)0xD000000000000010LL;
    unint64_t v121 = 0x800000000003B9D0LL;
    uint64_t v71 = v23;
    id v72 = [v71 description];
    uint64_t v73 = static String._unconditionallyBridgeFromObjectiveC(_:)(v72);
    id v75 = v74;

    v76._countAndFlagsBits = v73;
    v76._object = v75;
    String.append(_:)(v76);

    swift_bridgeObjectRelease(v75);
    v77._countAndFlagsBits = 0xD000000000000016LL;
    v77._object = (void *)0x800000000003B9F0LL;
    String.append(_:)(v77);
    unint64_t v78 = sub_1DBE4();
    uint64_t v79 = swift_allocError(&type metadata for TTSContactOverriderError, v78, 0LL, 0LL);
    *id v80 = 0xD000000000000010LL;
    v80[1] = 0x800000000003B9D0LL;
LABEL_37:
    swift_willThrow(v79);

    goto LABEL_7;
  }

  uint64_t v44 = v42;
  int v45 = v43;
  sub_2700C(v42, v43);
  if (!v46)
  {
    swift_bridgeObjectRelease(v44);
    unint64_t v81 = sub_1DBE4();
    uint64_t v79 = swift_allocError(&type metadata for TTSContactOverriderError, v81, 0LL, 0LL);
    *id v82 = 0xD000000000000028LL;
    v82[1] = 0x800000000003BA10LL;
    goto LABEL_37;
  }

  uint64_t v112 = v46;
  unsigned int v108 = v45;
  uint64_t v47 = v4;
  int64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
  os_log_type_t v49 = static os_log_type_t.debug.getter();
  bufa = v47;
  __int128 v109 = v41;
  uint64_t v110 = v44;
  if (os_log_type_enabled(v48, v49))
  {
    log = v48;
    uint64_t v50 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    NSFileAttributeKey v104 = (os_log_s *)swift_slowAlloc(32LL, -1LL);
    os_log_t v120 = v104;
    *(_DWORD *)uint64_t v50 = 136315138;
    id v51 = -[uint8_t identifier](v47, "identifier");
    uint64_t v52 = static String._unconditionallyBridgeFromObjectiveC(_:)(v51);
    unint64_t v54 = v53;

    uint64_t v47 = bufa;
    uint64_t v119 = sub_25824(v52, v54, (uint64_t *)&v120);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v119, &v120);

    unint64_t v55 = v54;
    uint64_t v44 = v110;
    swift_bridgeObjectRelease(v55);
    _os_log_impl(&dword_0, log, v49, "Updating phonemeData for contact: %s", v50, 0xCu);
    swift_arrayDestroy(v104, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v104, -1LL, -1LL);
    swift_slowDealloc(v50, -1LL, -1LL);
  }

  else
  {
  }

  id v83 = [objc_allocWithZone(CNSaveRequest) init];
  id v84 = -[uint8_t selfOrMutableCopy](v47, "selfOrMutableCopy");
  NSString v85 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v112);
  [v84 setPhonemeData:v85];

  uint64_t v4 = v84;
  [v83 updateContact:v84];
  BOOL v86 = *(void **)(v5 + 16);
  os_log_t v120 = 0LL;
  unsigned int v87 = [v86 executeSaveRequest:v83 error:&v120];
  os_log_t v88 = v120;
  if (v87)
  {
    uint64_t v113 = v83;
    uint64_t v89 = bufa;
    uint64_t v90 = (os_log_s *)Logger.logObject.getter(v88);
    os_log_type_t v91 = static os_log_type_t.debug.getter();
    bufb = v89;
    if (os_log_type_enabled(v90, v91))
    {
      unint64_t v111 = v90;
      os_log_type_t v105 = v91;
      uint64_t v92 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      os_log_t loga = (os_log_t)swift_slowAlloc(32LL, -1LL);
      os_log_t v120 = loga;
      *(_DWORD *)uint64_t v92 = 136315138;
      uint64_t v93 = v4;
      id v94 = -[uint8_t identifier](v89, "identifier");
      uint64_t v103 = static String._unconditionallyBridgeFromObjectiveC(_:)(v94);
      unint64_t v96 = v95;

      uint64_t v4 = v93;
      uint64_t v119 = sub_25824(v103, v96, (uint64_t *)&v120);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v119, &v120);

      swift_bridgeObjectRelease(v96);
      _os_log_impl(&dword_0, v111, v105, "Finished updating phonemeData for contact: %s", v92, 0xCu);
      swift_arrayDestroy(loga, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(loga, -1LL, -1LL);
      swift_slowDealloc(v92, -1LL, -1LL);
    }

    else
    {
    }

    uint64_t v99 = v4;
    id v100 = [v4 identifier];
    uint64_t v4 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v100);

    sub_1EE04(v110, v108, v118, v22);
    swift_bridgeObjectRelease(v110);

    uint64_t v16 = (os_log_s *)Logger.logObject.getter(v101);
    os_log_type_t v102 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v16, v102)) {
      goto LABEL_26;
    }
    __int128 v39 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)__int128 v39 = 0;
    _os_log_impl(&dword_0, v16, v102, "End runTTSOverrider()", v39, 2u);
LABEL_24:
    swift_slowDealloc(v39, -1LL, -1LL);
    goto LABEL_26;
  }

  uint64_t v97 = v120;
  swift_bridgeObjectRelease(v44);
  _convertNSErrorToError(_:)(v88);

  swift_willThrow(v98);
LABEL_7:
  uint64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
LABEL_8:
    uint64_t v18 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl(&dword_0, v16, v17, "End runTTSOverrider()", v18, 2u);
    swift_slowDealloc(v18, -1LL, -1LL);
  }

    char v12 = (v19 - 1) & v19;
    id v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    os_log_type_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t result = v17;
  }

  os_log_type_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  char v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    uint64_t v9 = v20;
    goto LABEL_27;
  }

  while (1)
  {
    uint64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    char v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }

    char v12 = (v17 - 1) & v17;
    id v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(void *)(v4 + 48) + v15) = *(_BYTE *)(*(void *)(v2 + 48) + v15);
  }

  uint64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  os_log_type_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    uint64_t v9 = v18;
    goto LABEL_27;
  }

  while (1)
  {
    uint64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    os_log_type_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }

    char v12 = (v21 - 1) & v21;
    id v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    os_log_type_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    char v19 = (void *)(*(void *)(v4 + 48) + v16);
    *char v19 = *v17;
    v19[1] = v18;
    swift_bridgeObjectRetain(v18);
  }

  int v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  uint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    uint64_t v9 = v22;
    goto LABEL_27;
  }

  while (1)
  {
    uint64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    uint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }

LABEL_26:
  return v4;
}

        __int128 v10 = (v19 - 1) & v19;
        os_log_type_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }

      uint64_t v21 = *(void *)(*(void *)(v3 + 48) + 8 * v17);
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v6 + 40));
      int v22 = -1LL << *(_BYTE *)(v6 + 32);
      uint64_t v23 = result & ~v22;
      uint64_t v24 = v23 >> 6;
      if (((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        id v15 = __clz(__rbit64((-1LL << v23) & ~*(void *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        id v25 = 0;
        os_log_type_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          uint64_t v27 = v24 == v26;
          if (v24 == v26) {
            uint64_t v24 = 0LL;
          }
          v25 |= v27;
          id v28 = *(void *)(v12 + 8 * v24);
        }

        while (v28 == -1);
        id v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }

      *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
      *(void *)(*(void *)(v6 + 48) + 8 * v15) = v21;
      ++*(void *)(v6 + 16);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

        os_log_type_t v11 = (v18 - 1) & v18;
        uint64_t v16 = __clz(__rbit64(v18)) + (v7 << 6);
      }

      os_log_type_t v20 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v16);
      Hasher.init(_seed:)(v30, *(void *)(v6 + 40));
      Hasher._combine(_:)(v20);
      uint64_t result = Hasher._finalize()();
      uint64_t v21 = -1LL << *(_BYTE *)(v6 + 32);
      int v22 = result & ~v21;
      uint64_t v23 = v22 >> 6;
      if (((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
      {
        char v14 = __clz(__rbit64((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v24 = 0;
        id v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          os_log_type_t v26 = v23 == v25;
          if (v23 == v25) {
            uint64_t v23 = 0LL;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v13 + 8 * v23);
        }

        while (v27 == -1);
        char v14 = __clz(__rbit64(~v27)) + (v23 << 6);
      }

      *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      *(_BYTE *)(*(void *)(v6 + 48) + v14) = v20;
      ++*(void *)(v6 + 16);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

        uint64_t v9 = (v19 - 1) & v19;
        os_log_type_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      uint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
      int v22 = *v21;
      uint64_t v23 = v21[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      uint64_t result = Hasher._finalize()();
      uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
      id v25 = result & ~v24;
      os_log_type_t v26 = v25 >> 6;
      if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        char v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v27 = 0;
        id v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          uint64_t v29 = v26 == v28;
          if (v26 == v28) {
            os_log_type_t v26 = 0LL;
          }
          v27 |= v29;
          unint64_t v30 = *(void *)(v11 + 8 * v26);
        }

        while (v30 == -1);
        char v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      id v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
      *id v15 = v22;
      v15[1] = v23;
      ++*(void *)(v6 + 16);
    }
  }

  uint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    __int128 v10 = (v19 - 1) & v19;
    os_log_type_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_27:
    uint64_t v21 = *(void *)(v6 + 40);
    int v22 = *(id *)(*(void *)(v3 + 48) + 8 * v17);
    uint64_t result = NSObject._rawHashValue(seed:)(v21);
    uint64_t v23 = -1LL << *(_BYTE *)(v6 + 32);
    uint64_t v24 = result & ~v23;
    id v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6))) != 0)
    {
      id v15 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      os_log_type_t v26 = 0;
      uint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        id v28 = v25 == v27;
        if (v25 == v27) {
          id v25 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v25);
      }

      while (v29 == -1);
      id v15 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
    *(void *)(*(void *)(v6 + 48) + 8 * v15) = v22;
    ++*(void *)(v6 + 16);
  }

  os_log_type_t v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_36:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v30;
    goto LABEL_38;
  }

  char v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    char v14 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    char v14 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v14 >= v11) {
      goto LABEL_36;
    }
    char v19 = *(void *)(v8 + 8 * v14);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

    os_log_type_t v11 = (v18 - 1) & v18;
    uint64_t v16 = __clz(__rbit64(v18)) + (v7 << 6);
LABEL_27:
    os_log_type_t v20 = *(unsigned __int8 *)(*(void *)(v3 + 48) + v16);
    Hasher.init(_seed:)(v29, *(void *)(v6 + 40));
    Hasher._combine(_:)(v20);
    uint64_t result = Hasher._finalize()();
    uint64_t v21 = -1LL << *(_BYTE *)(v6 + 32);
    int v22 = result & ~v21;
    uint64_t v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      char v14 = __clz(__rbit64((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v24 = 0;
      id v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        os_log_type_t v26 = v23 == v25;
        if (v23 == v25) {
          uint64_t v23 = 0LL;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v13 + 8 * v23);
      }

      while (v27 == -1);
      char v14 = __clz(__rbit64(~v27)) + (v23 << 6);
    }

    *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    *(_BYTE *)(*(void *)(v6 + 48) + v14) = v20;
    ++*(void *)(v6 + 16);
  }

  char v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_36:
    uint64_t result = swift_release(v3);
    uint64_t v2 = v28;
    goto LABEL_38;
  }

  uint64_t v18 = *(void *)(v8 + 8 * v19);
  if (v18)
  {
    uint64_t v7 = v19;
    goto LABEL_26;
  }

  while (1)
  {
    uint64_t v7 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_36;
    }
    uint64_t v18 = *(void *)(v8 + 8 * v7);
    ++v19;
    if (v18) {
      goto LABEL_26;
    }
  }

    __int128 v10 = (v19 - 1) & v19;
    os_log_type_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    uint64_t v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
    int v22 = *v21;
    uint64_t v23 = v21[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    uint64_t result = Hasher._finalize()();
    uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
    id v25 = result & ~v24;
    os_log_type_t v26 = v25 >> 6;
    if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      char v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v27 = 0;
      id v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        uint64_t v29 = v26 == v28;
        if (v26 == v28) {
          os_log_type_t v26 = 0LL;
        }
        v27 |= v29;
        unint64_t v30 = *(void *)(v11 + 8 * v26);
      }

      while (v30 == -1);
      char v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }

    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    id v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
    *id v15 = v22;
    v15[1] = v23;
    ++*(void *)(v6 + 16);
  }

  os_log_type_t v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    uint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_38;
  }

  char v19 = *(void *)(v8 + 8 * v20);
  if (v19)
  {
    uint64_t v13 = v20;
    goto LABEL_26;
  }

  while (1)
  {
    uint64_t v13 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v13 >= v32) {
      goto LABEL_36;
    }
    char v19 = *(void *)(v8 + 8 * v13);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

uint64_t sub_1C598(_BYTE *a1)
{
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = type metadata accessor for Locale(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_4A748 != -1) {
    goto LABEL_25;
  }
  while (1)
  {
    uint64_t v10 = qword_4FC68;
    int v43 = *(_BYTE **)(qword_4FC68 + 16);
    if (!v43)
    {
      uint64_t v16 = 3LL;
      goto LABEL_15;
    }

    __int128 v40 = a1;
    uint64_t v11 = v4 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
    unint64_t v39 = (*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    unint64_t v42 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    v42(v9, qword_4FC68 + v39, v6);
    uint64_t v12 = sub_1DC28( (unint64_t *)&qword_4B690,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
    swift_bridgeObjectRetain(v10);
    uint64_t v41 = v11;
    char v13 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v11, v6, v12);
    uint64_t v14 = v10;
    id v15 = *(void (**)(char *, uint64_t))(v7 + 8);
    v15(v9, v6);
    if ((v13 & 1) != 0)
    {
      swift_bridgeObjectRelease(v14);
      uint64_t v16 = 2LL;
      a1 = v40;
      goto LABEL_15;
    }

    uint64_t v38 = v14;
    if (v43 == (_BYTE *)&dword_0 + 1) {
      break;
    }
    uint64_t v36 = v4;
    unint64_t v37 = v3;
    uint64_t v4 = *(void *)(v7 + 72);
    unint64_t v17 = v38 + v4 + v39;
    a1 = (_BYTE *)(&dword_0 + 1);
    while (1)
    {
      v42(v9, v17, v6);
      uint64_t v3 = a1 + 1;
      if (__OFADD__(a1, 1LL)) {
        break;
      }
      uint64_t v7 = dispatch thunk of static Equatable.== infix(_:_:)(v9, v41, v6, v12);
      v15(v9, v6);
      if ((v7 & 1) != 0)
      {
        swift_bridgeObjectRelease(v38);
        uint64_t v16 = 2LL;
        goto LABEL_14;
      }

      ++a1;
      v17 += v4;
      if (v3 == v43)
      {
        swift_bridgeObjectRelease(v38);
        uint64_t v16 = 3LL;
LABEL_14:
        a1 = v40;
        uint64_t v4 = v36;
        uint64_t v3 = v37;
        goto LABEL_15;
      }
    }

    __break(1u);
LABEL_25:
    swift_once(&qword_4A748, sub_1B804);
  }

  swift_bridgeObjectRelease(v38);
  uint64_t v16 = 3LL;
  a1 = v40;
LABEL_15:
  sub_4FF8((void *)(v4 + 24), *(void *)(v4 + 48));
  uint64_t v18 = sub_2D30C(a1, v16, 1);
  if (!v3)
  {
    uint64_t v19 = v18;
    if ((v18 & 0xC000000000000001LL) != 0)
    {
      if (v18 >= 0) {
        v18 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      if (__CocoaSet.count.getter(v18) == 1) {
        goto LABEL_20;
      }
    }

    else if (*(void *)(v18 + 16) == 1LL)
    {
LABEL_20:
      uint64_t v7 = sub_1AF94(v19);
      swift_bridgeObjectRelease(v19);
      return v7;
    }

    uint64_t v44 = 0LL;
    unint64_t v45 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(47LL);
    id v20 = [a1 description];
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(v20);
    uint64_t v23 = v22;

    v24._countAndFlagsBits = v21;
    v24._object = v23;
    String.append(_:)(v24);
    swift_bridgeObjectRelease(v23);
    v25._object = (void *)0x800000000003B990LL;
    v25._countAndFlagsBits = 0xD00000000000001ELL;
    String.append(_:)(v25);
    char v46 = v16;
    _print_unlocked<A, B>(_:_:)( &v46,  &v44,  &type metadata for PhonemeFormat,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v26._countAndFlagsBits = 0x656D656E6F687020LL;
    v26._object = (void *)0xEB00000000203A73LL;
    String.append(_:)(v26);
    uint64_t v27 = type metadata accessor for PhonemeString();
    uint64_t v28 = sub_1DC28( &qword_4B6C0,  (uint64_t (*)(uint64_t))type metadata accessor for PhonemeString,  (uint64_t)&protocol conformance descriptor for NSObject);
    v29._countAndFlagsBits = Set.description.getter(v19, v27, v28);
    object = v29._object;
    String.append(_:)(v29);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease(object);
    uint64_t v7 = v44;
    unint64_t v31 = v45;
    unint64_t v32 = sub_1DBE4();
    uint64_t v33 = swift_allocError(&type metadata for TTSContactOverriderError, v32, 0LL, 0LL);
    *id v34 = v7;
    v34[1] = v31;
    swift_willThrow(v33);
  }

  return v7;
}

id sub_1C980(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_501C(&qword_4ABB0);
  uint64_t v7 = swift_allocObject(v6, 72LL, 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_39C30;
  uint64_t v8 = (void *)CNContactPhonemeDataKey;
  *(void *)(v7 + 3sub_541C(v0 + 2) = CNContactPhonemeDataKey;
  *(void *)(v7 + 40) = CNContactGivenNameKey;
  *(void *)(v7 + 48) = CNContactFamilyNameKey;
  *(void *)(v7 + 56) = CNContactNicknameKey;
  uint64_t v9 = (void *)objc_opt_self(&OBJC_CLASS___CNContactFormatter);
  id v10 = v8;
  uint64_t v11 = CNContactGivenNameKey;
  uint64_t v12 = CNContactFamilyNameKey;
  char v13 = CNContactNicknameKey;
  uint64_t v14 = a1;
  *(void *)(v7 + 64) = [v9 descriptorForRequiredKeysForStyle:0];
  id v51 = (id)v7;
  specialized Array._endMutation()();
  id v15 = (void *)objc_opt_self(&OBJC_CLASS___CNContact);
  uint64_t v16 = sub_501C((uint64_t *)&unk_4B6A0);
  uint64_t v17 = swift_allocObject(v16, 48LL, 7LL);
  *(_OWORD *)(v17 + 16) = xmmword_38B10;
  *(void *)(v17 + 3sub_541C(v0 + 2) = a1;
  *(void *)(v17 + 40) = a2;
  swift_bridgeObjectRetain(a2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v17);
  id v19 = [v15 predicateForContactsWithIdentifiers:isa];

  id v20 = *(void **)(v3 + 16);
  sub_501C((uint64_t *)&unk_4BC40);
  Class v21 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  id v51 = 0LL;
  id v22 = [v20 unifiedContactsMatchingPredicate:v19 keysToFetch:v21 error:&v51];

  id v23 = v51;
  if (!v22)
  {
    id v35 = v51;
    _convertNSErrorToError(_:)(v23);

    goto LABEL_7;
  }

  unint64_t v24 = sub_1DBA8();
  uint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v22, v24);
  id v26 = v23;

  if ((unint64_t)v25 >> 62)
  {
    if (v25 < 0) {
      uint64_t v40 = v25;
    }
    else {
      uint64_t v40 = v25 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v25);
    uint64_t v41 = _CocoaArrayWrapper.endIndex.getter(v40);
    swift_bridgeObjectRelease(v25);
    if (v41)
    {
      swift_bridgeObjectRetain(v25);
      uint64_t v27 = _CocoaArrayWrapper.endIndex.getter(v40);
      swift_bridgeObjectRelease(v25);
      if (v27 >= 2) {
        goto LABEL_5;
      }
LABEL_13:
      if ((v25 & 0xC000000000000001LL) != 0)
      {
        id v42 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v25);
      }

      else
      {
        id v42 = *(id *)(v25 + 32);
      }

      id v35 = v42;
      swift_bridgeObjectRelease(v25);

      return v35;
    }
  }

  else
  {
    uint64_t v27 = *(void *)((char *)&dword_10 + (v25 & 0xFFFFFFFFFFFFF8LL));
    if (v27)
    {
      if (v27 >= 2)
      {
LABEL_5:
        id v51 = 0LL;
        unint64_t v52 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(40LL);
        swift_bridgeObjectRelease(v25);
        unint64_t v28 = v52;
        uint64_t v50 = v27;
        Swift::String v29 = (void *)dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
        unint64_t v31 = v30;
        swift_bridgeObjectRelease(v28);
        id v51 = v29;
        unint64_t v52 = v31;
        v32._object = (void *)0x800000000003B960LL;
        v32._countAndFlagsBits = 0xD000000000000023LL;
        String.append(_:)(v32);
        v33._countAndFlagsBits = v14;
        v33._object = a2;
        String.append(_:)(v33);
        v34._countAndFlagsBits = 46LL;
        v34._object = (void *)0xE100000000000000LL;
        String.append(_:)(v34);
        id v35 = v51;
        unint64_t v36 = v52;
        unint64_t v37 = sub_1DBE4();
        uint64_t v38 = swift_allocError(&type metadata for TTSContactOverriderError, v37, 0LL, 0LL);
        *unint64_t v39 = v35;
        v39[1] = v36;
LABEL_7:
        swift_willThrow(v38);

        return v35;
      }

      goto LABEL_13;
    }
  }

  swift_bridgeObjectRelease(v25);
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v43 = type metadata accessor for Logger(0LL);
  sub_4F30(v43, (uint64_t)qword_4FC70);
  uint64_t v44 = swift_bridgeObjectRetain_n(a2, 2LL);
  unint64_t v45 = (os_log_s *)Logger.logObject.getter(v44);
  os_log_type_t v46 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    int64_t v48 = (void *)swift_slowAlloc(32LL, -1LL);
    id v51 = v48;
    *(_DWORD *)uint64_t v47 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v50 = sub_25824(a1, (unint64_t)a2, (uint64_t *)&v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v50, &v51);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl(&dword_0, v45, v46, "No matching contacts found for overriding for %s", v47, 0xCu);
    swift_arrayDestroy(v48, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v48, -1LL, -1LL);
    swift_slowDealloc(v47, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  return 0LL;
}

uint64_t sub_1CEC8(void *a1, char a2)
{
  if ((a2 & 1) != 0
    || (*(_BYTE *)(v2 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_isCurareRun) & 1) != 0)
  {
    return sub_1CFBC(a1);
  }

  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  uint64_t v5 = sub_4F30(v4, (uint64_t)qword_4FC70);
  uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_0, v6, v7, "The user-initiated conversation wasn't a success", v8, 2u);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  return 0LL;
}

uint64_t sub_1CFBC(void *a1)
{
  uint64_t v3 = type metadata accessor for Locale(0LL);
  unint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_26618(a1);
  if (v7)
  {
    uint64_t v9 = v7;
    LODWORD(v10) = v8;
    uint64_t v36 = v1 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
    if (qword_4A748 != -1) {
      goto LABEL_24;
    }
    while (1)
    {
      uint64_t v11 = qword_4FC68;
      uint64_t v12 = *(void *)(qword_4FC68 + 16);
      if (!v12) {
        goto LABEL_18;
      }
      unint64_t v34 = (*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
      id v35 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
      v35(v6, qword_4FC68 + v34, v3);
      uint64_t v13 = sub_1DC28( (unint64_t *)&qword_4B690,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
      swift_bridgeObjectRetain(v11);
      char v14 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v36, v3, v13);
      id v15 = *(void (**)(char *, uint64_t))(v4 + 8);
      v15(v6, v3);
      if ((v14 & 1) != 0) {
        break;
      }
      if (v12 == 1)
      {
        swift_bridgeObjectRelease(v11);
LABEL_18:
        char v27 = sub_DC4C(v36, v9);
        swift_bridgeObjectRelease(v9);
        return v27 & 1;
      }

      v31[1] = v10;
      uint64_t v32 = v11;
      uint64_t v33 = v9;
      uint64_t v9 = *(void *)(v4 + 72);
      unint64_t v4 = v11 + v9 + v34;
      uint64_t v28 = 1LL;
      while (1)
      {
        v35(v6, v4, v3);
        uint64_t v10 = v28 + 1;
        if (__OFADD__(v28, 1LL)) {
          break;
        }
        char v29 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v36, v3, v13);
        v15(v6, v3);
        if ((v29 & 1) != 0)
        {
          swift_bridgeObjectRelease(v33);
          uint64_t v16 = v32;
          goto LABEL_20;
        }

        ++v28;
        v4 += v9;
        if (v10 == v12)
        {
          swift_bridgeObjectRelease(v32);
          uint64_t v9 = v33;
          goto LABEL_18;
        }
      }

      __break(1u);
LABEL_24:
      swift_once(&qword_4A748, sub_1B804);
    }

    swift_bridgeObjectRelease(v9);
    uint64_t v16 = v11;
LABEL_20:
    swift_bridgeObjectRelease(v16);
    goto LABEL_21;
  }

  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v17 = type metadata accessor for Logger(0LL);
  sub_4F30(v17, (uint64_t)qword_4FC70);
  id v18 = a1;
  id v19 = (void *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled((os_log_t)v19, v20))
  {

LABEL_21:
    char v27 = 1;
    return v27 & 1;
  }

  Class v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  uint64_t v22 = swift_slowAlloc(32LL, -1LL);
  uint64_t v38 = v22;
  *(_DWORD *)Class v21 = 136315138;
  id v23 = [v18 identifier];
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
  unint64_t v26 = v25;

  uint64_t v37 = sub_25824(v24, v26, &v38);
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v37, &v38);

  swift_bridgeObjectRelease(v26);
  _os_log_impl(&dword_0, (os_log_t)v19, v20, "Couldn't parse phonemeData for contact: %s", v21, 0xCu);
  char v27 = 1;
  swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
  swift_slowDealloc(v22, -1LL, -1LL);
  swift_slowDealloc(v21, -1LL, -1LL);

  return v27 & 1;
}

uint64_t sub_1D380()
{
  sub_541C((void *)(v0 + 24));
  uint64_t v1 = v0 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
  uint64_t v2 = type metadata accessor for Locale(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance( v0,  *(unsigned int *)(*(void *)v0 + 48LL),  *(unsigned __int16 *)(*(void *)v0 + 52LL));
}

uint64_t sub_1D3E0()
{
  return type metadata accessor for TTSContactOverrider(0LL);
}

uint64_t type metadata accessor for TTSContactOverrider(uint64_t a1)
{
  uint64_t result = qword_4B5A8;
  if (!qword_4B5A8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TTSContactOverrider);
  }
  return result;
}

uint64_t sub_1D424(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = "(";
  uint64_t result = type metadata accessor for Locale(319LL);
  if (v3 <= 0x3F)
  {
    v4[2] = *(void *)(result - 8) + 64LL;
    v4[3] = &unk_39CD0;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 4LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1D4B0()
{
  return sub_1DC28( &qword_4B680,  (uint64_t (*)(uint64_t))type metadata accessor for PhonemeString,  (uint64_t)&protocol conformance descriptor for NSObject);
}

uint64_t sub_1D4DC(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  unint64_t v3 = (void *)(*a1 + OBJC_IVAR___PhonemeString_symbols);
  uint64_t v4 = v3[1];
  uint64_t v5 = *(void *)(v2 + OBJC_IVAR___PhonemeString_symbols);
  uint64_t v6 = *(void *)(v2 + OBJC_IVAR___PhonemeString_symbols + 8);
  if (*v3 == v5 && v4 == v6) {
    return 0LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(*v3, v4, v5, v6, 1LL);
  }
}

void sub_1D528(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t v7 = a1;
  if ((a4 & 0xC000000000000001LL) == 0)
  {
    if ((a3 & 1) != 0) {
      goto LABEL_13;
    }
    if (a1 < 0 || 1LL << *(_BYTE *)(a4 + 32) <= a1)
    {
      __break(1u);
    }

    else if (((*(void *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8LL) + 56) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2) {
        goto LABEL_20;
      }
      __break(1u);
LABEL_13:
      if (__CocoaSet.Index.age.getter(a1, a2) == *(_DWORD *)(a4 + 36))
      {
        uint64_t v11 = __CocoaSet.Index.element.getter(v7, a2);
        uint64_t v21 = v11;
        uint64_t v12 = type metadata accessor for PhonemeString();
        swift_unknownObjectRetain(v11);
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v12, 7LL);
        uint64_t v4 = v22;
        swift_unknownObjectRelease(v11);
        Swift::Int v13 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
        uint64_t v14 = -1LL << *(_BYTE *)(a4 + 32);
        unint64_t v7 = v13 & ~v14;
        if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0)
        {
          id v15 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
          char v16 = static NSObject.== infix(_:_:)(v15, v4);

          if ((v16 & 1) == 0)
          {
            uint64_t v17 = ~v14;
            do
            {
              unint64_t v7 = (v7 + 1) & v17;
              if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) == 0) {
                goto LABEL_24;
              }
              id v18 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
              char v19 = static NSObject.== infix(_:_:)(v18, v4);
            }

            while ((v19 & 1) == 0);
          }

LABEL_20:
          id v20 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
          return;
        }

LABEL_23:
      __break(1u);
      goto LABEL_24;
    }

    __break(1u);
    goto LABEL_23;
  }

  if ((a3 & 1) == 0)
  {
LABEL_25:
    __break(1u);
    return;
  }

  if (a4 < 0) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = a4 & 0xFFFFFFFFFFFFFF8LL;
  }
  uint64_t v9 = __CocoaSet.element(at:)(a1, a2, v8);
  uint64_t v21 = v9;
  uint64_t v10 = type metadata accessor for PhonemeString();
  swift_unknownObjectRetain(v9);
  swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
  swift_unknownObjectRelease(v9);
}

uint64_t sub_1D770(uint64_t a1)
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

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2LL;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64LL;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }

  return v3;
}

BOOL sub_1D7F8(void *a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v8 = type metadata accessor for CharacterSet(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a4)
  {
    if (a4 == 1) {
      id v12 = [a1 familyName];
    }
    else {
      id v12 = [a1 nickname];
    }
  }

  else
  {
    id v12 = [a1 givenName];
  }

  id v13 = v12;
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
  unint64_t v16 = v15;

  uint64_t v48 = v14;
  unint64_t v49 = v16;
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v17 = type metadata accessor for Logger(0LL);
  sub_4F30(v17, (uint64_t)qword_4FC70);
  swift_bridgeObjectRetain_n(a3, 2LL);
  uint64_t v18 = swift_bridgeObjectRetain_n(v16, 2LL);
  char v19 = (os_log_s *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc(22LL, -1LL);
    uint64_t v41 = v8;
    uint64_t v22 = v21;
    uint64_t v23 = swift_slowAlloc(64LL, -1LL);
    uint64_t v40 = v9;
    uint64_t v24 = v23;
    uint64_t v44 = v23;
    *(_DWORD *)uint64_t v22 = 136315394;
    uint64_t v39 = v14;
    swift_bridgeObjectRetain(a3);
    uint64_t v46 = sub_25824(a2, a3, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);
    swift_bridgeObjectRelease_n(a3, 3LL);
    *(_WORD *)(v22 + 1sub_541C(v0 + 2) = 2080;
    swift_bridgeObjectRetain(v16);
    uint64_t v46 = sub_25824(v39, v16, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v46, &v47);
    swift_bridgeObjectRelease_n(v16, 3LL);
    _os_log_impl( &dword_0,  v19,  v20,  "In doesContactNameMatch() ASR contact name: %s, contact name: %s",  (uint8_t *)v22,  0x16u);
    swift_arrayDestroy(v24, 2LL, (char *)&type metadata for Any + 8);
    uint64_t v25 = v24;
    uint64_t v9 = v40;
    swift_slowDealloc(v25, -1LL, -1LL);
    uint64_t v26 = v22;
    uint64_t v8 = v41;
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v16, 2LL);
    swift_bridgeObjectRelease_n(a3, 2LL);
  }

  uint64_t v44 = a2;
  unint64_t v45 = a3;
  swift_bridgeObjectRetain(a3);
  static CharacterSet.whitespaces.getter(v27);
  unint64_t v28 = sub_53D8();
  uint64_t v29 = StringProtocol.trimmingCharacters(in:)(v11, &type metadata for String, v28);
  uint64_t v31 = v30;
  uint64_t v32 = *(void (**)(char *, uint64_t))(v9 + 8);
  v32(v11, v8);
  swift_bridgeObjectRelease(v45);
  uint64_t v46 = v29;
  uint64_t v47 = v31;
  uint64_t v33 = swift_beginAccess(&v48, &v44, 0LL, 0LL);
  uint64_t v42 = v48;
  unint64_t v43 = v49;
  static CharacterSet.whitespaces.getter(v33);
  uint64_t v34 = StringProtocol.trimmingCharacters(in:)(v11, &type metadata for String, v28);
  unint64_t v36 = v35;
  v32(v11, v8);
  swift_bridgeObjectRelease(v43);
  uint64_t v42 = v34;
  unint64_t v43 = v36;
  uint64_t v37 = StringProtocol.caseInsensitiveCompare<A>(_:)( &v42,  &type metadata for String,  &type metadata for String,  v28,  v28);
  swift_bridgeObjectRelease(v36);
  swift_bridgeObjectRelease(v47);
  return v37 == 0;
}

unint64_t sub_1DBA8()
{
  unint64_t result = qword_4B6B0;
  if (!qword_4B6B0)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___CNContact);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_4B6B0);
  }

  return result;
}

unint64_t sub_1DBE4()
{
  unint64_t result = qword_4B6B8;
  if (!qword_4B6B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A0B4, &type metadata for TTSContactOverriderError);
    atomic_store(result, (unint64_t *)&qword_4B6B8);
  }

  return result;
}

uint64_t sub_1DC28(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1DC68(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

void sub_1DC74(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Date(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = *(void *)(a1 + OBJC_IVAR___PhonemeString_symbols);
  uint64_t v8 = *(void *)(a1 + OBJC_IVAR___PhonemeString_symbols + 8);
  uint64_t v10 = sub_501C((uint64_t *)&unk_4B6E8);
  uint64_t v11 = swift_allocObject(v10, 96LL, 7LL);
  *(_OWORD *)(v11 + 16) = xmmword_38B10;
  *(void *)(v11 + 3sub_541C(v0 + 2) = 0LL;
  *(void *)(v11 + 40) = 0LL;
  *(void *)(v11 + 48) = v9;
  *(void *)(v11 + 56) = v8;
  *(void *)(v11 + 64) = 0LL;
  *(_BYTE *)(v11 + 7sub_541C(v0 + 2) = 1;
  *(void *)(v11 + 80) = 0LL;
  *(void *)(v11 + 88) = 0LL;
  uint64_t v12 = swift_bridgeObjectRetain_n(v8, 2LL);
  uint64_t v13 = Date.init()(v12);
  double v14 = round(Date.timeIntervalSince1970.getter(v13) * 1000.0);
  if ((~*(void *)&v14 & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }

  if (v14 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }

  if (v14 < 9.22337204e18)
  {
    uint64_t v15 = (uint64_t)v14;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(void *)a2 = v11;
    *(void *)(a2 + 8) = v9;
    *(void *)(a2 + 16) = v8;
    *(void *)(a2 + 24) = v15;
    *(_BYTE *)(a2 + 3sub_541C(v0 + 2) = 0;
    return;
  }

uint64_t sub_1DDC8@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  id v5 = v4;
  uint64_t v110 = a3;
  LODWORD(vsub_541C(v0 + 7) = a1;
  uint64_t v9 = type metadata accessor for Locale(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1DC74(a2, (uint64_t)&v111);
  unint64_t v13 = v112[0];
  uint64_t v96 = v111;
  uint64_t v15 = (void (*)(char *, uint64_t, uint64_t))v112[1];
  uint64_t v14 = v112[2];
  LODWORD(v16) = v113;
  unint64_t v95 = (__int128 *)sub_26618(v5);
  uint64_t v98 = v15;
  uint64_t v99 = v14;
  unint64_t v97 = v13;
  if (!v95)
  {
LABEL_15:
    unint64_t v106 = 0LL;
    uint64_t v107 = 0LL;
    uint64_t v100 = 0LL;
    uint64_t v101 = 0LL;
    uint64_t v105 = 0LL;
    LODWORD(v110) = 0;
    uint64_t v27 = 0LL;
    uint64_t v28 = 0LL;
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    unsigned int v102 = 0;
    uint64_t v103 = 0LL;
    uint64_t v31 = 0LL;
    uint64_t v108 = 0LL;
    unsigned int v104 = 0;
    goto LABEL_28;
  }

  int v18 = v17;
  if (qword_4A748 != -1) {
    goto LABEL_50;
  }
  while (1)
  {
    uint64_t v19 = qword_4FC68;
    uint64_t v20 = *(void *)(qword_4FC68 + 16);
    uint64_t v21 = v110;
    if (!v20) {
      break;
    }
    LODWORD(v10sub_541C(v0 + 7) = v18;
    id v92 = v5;
    int v93 = v7;
    unint64_t v106 = (*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    uint64_t v108 = a4;
    __int128 v109 = v22;
    v22(v12, qword_4FC68 + v106, v9);
    id v5 = (id)sub_1DC28( (unint64_t *)&qword_4B690,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
    swift_bridgeObjectRetain(v19);
    char v23 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v21, v9, v5);
    a4 = *(void *)(v10 + 8);
    ((void (*)(char *, uint64_t))a4)(v12, v9);
    if ((v23 & 1) != 0)
    {
      swift_bridgeObjectRelease(v19);
      a4 = v108;
      LODWORD(vsub_541C(v0 + 7) = v93;
      id v5 = v92;
      uint64_t v24 = (uint64_t)v95;
      goto LABEL_17;
    }

    if (v20 == 1)
    {
      swift_bridgeObjectRelease(v19);
      a4 = v108;
      LODWORD(vsub_541C(v0 + 7) = v93;
      id v5 = v92;
      break;
    }

    int v94 = v16;
    uint64_t v25 = *(void *)(v10 + 72);
    uint64_t v105 = v19;
    uint64_t v7 = v19 + v25 + v106;
    uint64_t v16 = 1LL;
    while (1)
    {
      v109(v12, v7, v9);
      uint64_t v26 = v16 + 1;
      if (__OFADD__(v16, 1LL)) {
        break;
      }
      uint64_t v10 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v110, v9, v5);
      ((void (*)(char *, uint64_t))a4)(v12, v9);
      if ((v10 & 1) != 0)
      {
        swift_bridgeObjectRelease(v105);
        a4 = v108;
        LODWORD(v16) = v94;
        LODWORD(vsub_541C(v0 + 7) = v93;
        id v5 = v92;
        uint64_t v24 = (uint64_t)v95;
        goto LABEL_17;
      }

      ++v16;
      v7 += v25;
      if (v26 == v20)
      {
        swift_bridgeObjectRelease(v105);
        a4 = v108;
        LODWORD(v16) = v94;
        LODWORD(vsub_541C(v0 + 7) = v93;
        id v5 = v92;
        uint64_t v21 = v110;
        goto LABEL_13;
      }
    }

    __break(1u);
LABEL_50:
    int v86 = v18;
    swift_once(&qword_4A748, sub_1B804);
    int v18 = v86;
  }

uint64_t sub_1E7D8(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return 0LL;
  }
  LODWORD(v5) = 0;
  uint64_t v6 = 0LL;
  uint64_t v7 = a2 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v8 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
  while (1)
  {
    if ((a2 & 0x1000000000000000LL) == 0)
    {
      if ((a2 & 0x2000000000000000LL) != 0)
      {
        v13[0] = a1;
        v13[1] = v7;
        int v9 = *((unsigned __int8 *)v13 + v6);
        if (*((char *)v13 + v6) < 0) {
          __asm { BR              X9 }
        }
      }

      else
      {
        uint64_t v11 = v8;
        if ((a1 & 0x1000000000000000LL) == 0) {
          uint64_t v11 = _StringObject.sharedUTF8.getter(a1, a2);
        }
        int v9 = *(unsigned __int8 *)(v11 + v6);
        if (*(char *)(v11 + v6) < 0) {
          __asm { BR              X10 }
        }
      }

      uint64_t v10 = 1LL;
      goto LABEL_7;
    }

    int v9 = _StringGuts.foreignErrorCorrectedScalar(startingAt:)(v6 << 16, a1, a2);
    if (v9 < 0) {
      break;
    }
LABEL_7:
    v6 += v10;
    uint64_t v5 = (v9 - v5 + 32 * v5);
    if (v6 >= v2) {
      return v5;
    }
  }

  __break(1u);
  return 0LL;
}

unint64_t sub_1E9C8(int a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)&v36[0] != 1LL)
  {
    __int128 v42 = v36[4];
    __int128 v43 = v36[5];
    __int128 v44 = v36[6];
    char v45 = v37;
    __int128 v38 = v36[0];
    __int128 v39 = v36[1];
    __int128 v40 = v36[2];
    __int128 v41 = v36[3];
    id v15 = [(id)objc_opt_self(CNContactFormatter) stringFromContact:v3 style:0];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
      unint64_t v19 = v18;

      sub_1E7D8(v17, v19);
      swift_bridgeObjectRelease(v19);
      uint64_t v20 = sub_501C(&qword_4B6D8);
      uint64_t inited = swift_initStackObject(v20, v32);
      *(_OWORD *)(inited + 16) = xmmword_38B10;
      *(void *)(inited + 3sub_541C(v0 + 2) = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      *(void *)(inited + 40) = v22;
      __int128 v23 = v43;
      *(_OWORD *)(inited + 11sub_541C(v0 + 2) = v42;
      *(_OWORD *)(inited + 128) = v23;
      *(_OWORD *)(inited + 144) = v44;
      *(_BYTE *)(inited + 160) = v45;
      __int128 v24 = v39;
      *(_OWORD *)(inited + 48) = v38;
      *(_OWORD *)(inited + 64) = v24;
      __int128 v25 = v41;
      *(_OWORD *)(inited + 80) = v40;
      *(_OWORD *)(inited + 96) = v25;
      return sub_1B60C(inited);
    }

    sub_1F97C(v35);
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v27 = type metadata accessor for Logger(0LL);
    sub_4F30(v27, (uint64_t)qword_4FC70);
    id v5 = v3;
    uint64_t v6 = (os_log_s *)Logger.logObject.getter(v5);
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v9 = swift_slowAlloc(32LL, -1LL);
      uint64_t v34 = v9;
      *(_DWORD *)uint64_t v8 = 136315138;
      id v28 = [v5 identifier];
      uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
      unint64_t v31 = v30;

      uint64_t v33 = sub_25824(v29, v31, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34);

      swift_bridgeObjectRelease(v31);
      uint64_t v14 = "Unable to get full name for contact %s";
      goto LABEL_12;
    }

id sub_1EE04(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v133 = a4;
  uint64_t v134 = a1;
  uint64_t v6 = type metadata accessor for Locale(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v135 = (char *)&v118 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = __chkstk_darwin(v8);
  unint64_t v12 = (char *)&v118 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v118 - v13;
  if (qword_4A748 != -1) {
    goto LABEL_83;
  }
  while (1)
  {
    uint64_t v15 = qword_4FC68;
    uint64_t v16 = v4 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale;
    uint64_t v17 = *(void (**)(char *, unint64_t, uint64_t))(qword_4FC68 + 16);
    v140 = (void *)v16;
    uint64_t v141 = v6;
    v139 = v17;
    uint64_t v136 = v7;
    uint64_t v137 = a3;
    if (!v17)
    {
      int v22 = 3;
      goto LABEL_16;
    }

    a3 = v7;
    unint64_t v18 = (*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    uint64_t v138 = *(void (**)(char *, unint64_t, uint64_t))(a3 + 16);
    v138(v14, qword_4FC68 + v18, v6);
    uint64_t v19 = sub_1DC28( (unint64_t *)&qword_4B690,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
    swift_bridgeObjectRetain(v15);
    char v20 = dispatch thunk of static Equatable.== infix(_:_:)(v14, v16, v6, v19);
    uint64_t v21 = *(void (**)(char *, uint64_t))(a3 + 8);
    v21(v14, v6);
    if ((v20 & 1) != 0)
    {
      swift_bridgeObjectRelease(v15);
      int v22 = 2;
      goto LABEL_8;
    }

    uint64_t v6 = *(void *)(v136 + 72);
    uint64_t v132 = v15;
    uint64_t v7 = v15 + v6 + v18;
    uint64_t v23 = 1LL;
    uint64_t v4 = v141;
    while (1)
    {
      v138(v14, v7, v4);
      __int128 v24 = (void (*)(char *, unint64_t, uint64_t))(v23 + 1);
      if (__OFADD__(v23, 1LL)) {
        break;
      }
      a3 = dispatch thunk of static Equatable.== infix(_:_:)(v14, v140, v4, v19);
      v21(v14, v4);
      if ((a3 & 1) != 0)
      {
        swift_bridgeObjectRelease(v132);
        int v22 = 2;
        goto LABEL_15;
      }

      ++v23;
      v7 += v6;
      if (v24 == v139)
      {
        swift_bridgeObjectRelease(v132);
        int v22 = 3;
LABEL_15:
        uint64_t v16 = (uint64_t)v140;
        uint64_t v6 = v141;
        uint64_t v7 = v136;
        goto LABEL_16;
      }
    }

    __break(1u);
LABEL_82:
    __break(1u);
LABEL_83:
    swift_once(&qword_4A748, sub_1B804);
  }

  swift_bridgeObjectRelease(v15);
  int v22 = 3;
LABEL_8:
  uint64_t v7 = v136;
  uint64_t v16 = (uint64_t)v140;
LABEL_16:
  uint64_t v25 = qword_4FC68;
  a3 = *(void *)(qword_4FC68 + 16);
  if (!a3) {
    goto LABEL_21;
  }
  unint64_t v26 = (*(unsigned __int8 *)(v7 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v139 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
  v139(v12, qword_4FC68 + v26, v6);
  uint64_t v27 = sub_1DC28( (unint64_t *)&qword_4B690,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
  swift_bridgeObjectRetain(v25);
  char v28 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v16, v6, v27);
  uint64_t v29 = *(void (**)(char *, uint64_t))(v7 + 8);
  v29(v12, v6);
  if ((v28 & 1) == 0)
  {
    if (a3 != 1)
    {
      LODWORD(v13sub_541C(v0 + 2) = v22;
      uint64_t v6 = *(void *)(v7 + 72);
      uint64_t v138 = (void (*)(char *, unint64_t, uint64_t))v25;
      unint64_t v32 = v25 + v6 + v26;
      uint64_t v7 = 1LL;
      uint64_t v4 = v141;
      while (1)
      {
        v139(v12, v32, v4);
        uint64_t v14 = (char *)(v7 + 1);
        if (__OFADD__(v7, 1LL)) {
          goto LABEL_82;
        }
        char v33 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v140, v4, v27);
        v29(v12, v4);
        if ((v33 & 1) != 0) {
          break;
        }
        ++v7;
        v32 += v6;
        if (v14 == (char *)a3)
        {
          swift_bridgeObjectRelease(v138);
          uint64_t v31 = 0LL;
          unint64_t v30 = 0xE000000000000000LL;
LABEL_28:
          uint64_t v6 = v141;
          uint64_t v7 = v136;
          int v22 = v132;
          goto LABEL_29;
        }
      }

      swift_bridgeObjectRelease(v138);
      unint64_t v30 = 0xE100000000000000LL;
      uint64_t v31 = 32LL;
      goto LABEL_28;
    }

    swift_bridgeObjectRelease(v25);
LABEL_21:
    uint64_t v31 = 0LL;
    unint64_t v30 = 0xE000000000000000LL;
    goto LABEL_29;
  }

  swift_bridgeObjectRelease(v25);
  unint64_t v30 = 0xE100000000000000LL;
  uint64_t v31 = 32LL;
LABEL_29:
  uint64_t v34 = v137;
  uint64_t v35 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
  uint64_t v37 = v36;
  uint64_t v38 = v134;
  if (!*(void *)(v134 + 16) || (unint64_t v39 = sub_2DEC8(v35, v36), (v40 & 1) == 0))
  {
    swift_bridgeObjectRelease(v30);
    swift_bridgeObjectRelease(v37);
    id v72 = 0LL;
    id v73 = 0LL;
    unint64_t v74 = 0LL;
    goto LABEL_75;
  }

  uint64_t v119 = v31;
  unint64_t v131 = v30;
  LODWORD(v13sub_541C(v0 + 2) = v22;
  uint64_t v41 = *(void *)(v38 + 56) + 120 * v39;
  __int128 v43 = *(void **)v41;
  uint64_t v42 = *(void *)(v41 + 8);
  uint64_t v44 = *(void *)(v41 + 16);
  uint64_t v45 = *(void *)(v41 + 24);
  int v46 = *(unsigned __int8 *)(v41 + 32);
  uint64_t v48 = *(void *)(v41 + 40);
  uint64_t v47 = *(void *)(v41 + 48);
  uint64_t v49 = *(void *)(v41 + 56);
  uint64_t v50 = *(void *)(v41 + 64);
  int v51 = *(unsigned __int8 *)(v41 + 72);
  uint64_t v52 = *(void *)(v41 + 80);
  id v53 = *(void (**)(char *, unint64_t, uint64_t))(v41 + 96);
  uint64_t v54 = *(void *)(v41 + 104);
  uint64_t v138 = *(void (**)(char *, unint64_t, uint64_t))(v41 + 88);
  v139 = v53;
  int v55 = *(unsigned __int8 *)(v41 + 112);
  uint64_t v125 = v42;
  uint64_t v124 = v44;
  uint64_t v123 = v45;
  int v122 = v46;
  sub_E378((uint64_t)v43, v42, v44);
  v140 = (void *)v48;
  uint64_t v56 = v48;
  uint64_t v129 = v47;
  uint64_t v57 = v47;
  uint64_t v58 = (uint64_t)v139;
  uint64_t v128 = v49;
  uint64_t v127 = v50;
  uint64_t v59 = (uint64_t)v43;
  uint64_t v60 = (uint64_t)v138;
  int v126 = v51;
  sub_E378(v56, v57, v49);
  uint64_t v130 = (void *)v52;
  uint64_t v134 = v54;
  int v121 = v55;
  sub_E378(v52, v60, v58);
  swift_bridgeObjectRelease(v37);
  if (!v43)
  {
    id v120 = 0LL;
    uint64_t v68 = (void *)v131;
    uint64_t v69 = v140;
    uint64_t v6 = v141;
    uint64_t v7 = v136;
    uint64_t v34 = v137;
    if (v140) {
      goto LABEL_50;
    }
    goto LABEL_46;
  }

  swift_bridgeObjectRetain(v43);
  uint64_t v7 = v136;
  uint64_t v34 = v137;
  if (!v43[2])
  {
    swift_bridgeObjectRelease(v43);
    id v120 = 0LL;
    uint64_t v68 = (void *)v131;
    uint64_t v69 = v140;
    uint64_t v6 = v141;
    if (v140) {
      goto LABEL_50;
    }
    goto LABEL_46;
  }

  uint64_t v61 = v137;
  uint64_t v62 = v136;
  uint64_t v63 = v43[5];
  uint64_t v64 = (void *)v43[6];
  uint64_t v65 = v43[7];
  uint64_t v66 = v43[11];
  swift_bridgeObjectRetain(v66);
  swift_bridgeObjectRetain(v63);
  swift_bridgeObjectRetain(v65);
  swift_bridgeObjectRelease(v66);
  uint64_t v67 = v43;
  swift_bridgeObjectRelease(v43);
  swift_bridgeObjectRelease(v63);
  uint64_t v68 = (void *)v131;
  uint64_t v69 = v140;
  if (!v65)
  {
    id v120 = 0LL;
    uint64_t v7 = v62;
    uint64_t v34 = v61;
    uint64_t v60 = (uint64_t)v138;
    uint64_t v58 = (uint64_t)v139;
    uint64_t v59 = (uint64_t)v43;
    uint64_t v6 = v141;
    if (v140) {
      goto LABEL_50;
    }
LABEL_46:
    id v75 = v68;
LABEL_56:
    swift_bridgeObjectRelease(v75);
    id v73 = 0LL;
    uint64_t v87 = v60;
    goto LABEL_65;
  }

  id v120 = v64;
  uint64_t v7 = v62;
  uint64_t v6 = v141;
  if ((_BYTE)v133)
  {
    else {
      uint64_t v70 = 1801677166LL;
    }
    uint64_t v60 = (uint64_t)v138;
    char v71 = _stringCompareWithSmolCheck(_:_:expecting:)( v70,  0xE400000000000000LL,  0x7473726966LL,  0xE500000000000000LL,  0LL);
    swift_bridgeObjectRelease(0xE400000000000000LL);
    if ((v71 & 1) == 0)
    {
      swift_bridgeObjectRelease(v65);
      id v120 = 0LL;
      goto LABEL_49;
    }
  }

  else
  {
    swift_bridgeObjectRelease(0xE500000000000000LL);
    uint64_t v60 = (uint64_t)v138;
  }

  uint64_t v76 = (objc_class *)type metadata accessor for PhonemeString();
  uint64_t v77 = objc_allocWithZone(v76);
  unint64_t v78 = &v77[OBJC_IVAR___PhonemeString_symbols];
  *unint64_t v78 = v120;
  v78[1] = v65;
  v77[OBJC_IVAR___PhonemeString_encoding] = v132;
  uint64_t v79 = (uint64_t *)&v77[OBJC_IVAR___PhonemeString_boundary];
  *uint64_t v79 = v119;
  v79[1] = (uint64_t)v68;
  v142.receiver = v77;
  v142.super_class = v76;
  *(void *)&double v80 = swift_bridgeObjectRetain(v68).n128_u64[0];
  id v120 = objc_msgSendSuper2(&v142, "init", v80);
LABEL_49:
  uint64_t v34 = v61;
  uint64_t v58 = (uint64_t)v139;
  uint64_t v59 = (uint64_t)v67;
  if (!v69) {
    goto LABEL_46;
  }
LABEL_50:
  swift_bridgeObjectRetain(v69);
  if (!v69[2])
  {
    swift_bridgeObjectRelease(v68);
    id v75 = v69;
    goto LABEL_56;
  }

  uint64_t v81 = v59;
  uint64_t v82 = v7;
  uint64_t v84 = v69[5];
  uint64_t v83 = v69[6];
  uint64_t v85 = v69[7];
  uint64_t v86 = v69[11];
  swift_bridgeObjectRetain(v86);
  swift_bridgeObjectRetain(v84);
  swift_bridgeObjectRetain(v85);
  swift_bridgeObjectRelease(v86);
  swift_bridgeObjectRelease(v69);
  swift_bridgeObjectRelease(v84);
  if (v85)
  {
    uint64_t v7 = v82;
    if ((_BYTE)v133)
    {
      uint64_t v58 = (uint64_t)v139;
      if (v133 == 1)
      {
        swift_bridgeObjectRelease(0xE400000000000000LL);
        goto LABEL_61;
      }

      unint64_t v89 = 0xE400000000000000LL;
      uint64_t v88 = 1801677166LL;
    }

    else
    {
      uint64_t v88 = 0x7473726966LL;
      unint64_t v89 = 0xE500000000000000LL;
      uint64_t v58 = (uint64_t)v139;
    }

    char v90 = _stringCompareWithSmolCheck(_:_:expecting:)(v88, v89, 1953718636LL, 0xE400000000000000LL, 0LL);
    swift_bridgeObjectRelease(v89);
    if ((v90 & 1) == 0)
    {
      swift_bridgeObjectRelease(v85);
      swift_bridgeObjectRelease(v68);
      id v73 = 0LL;
      goto LABEL_63;
    }

LABEL_61:
    uint64_t v91 = (objc_class *)type metadata accessor for PhonemeString();
    id v92 = objc_allocWithZone(v91);
    int v93 = &v92[OBJC_IVAR___PhonemeString_symbols];
    void *v93 = v83;
    v93[1] = v85;
    v92[OBJC_IVAR___PhonemeString_encoding] = v132;
    int v94 = (uint64_t *)&v92[OBJC_IVAR___PhonemeString_boundary];
    *int v94 = v119;
    v94[1] = (uint64_t)v68;
    v143.receiver = v92;
    v143.super_class = v91;
    id v73 = objc_msgSendSuper2(&v143, "init");
LABEL_63:
    uint64_t v34 = v137;
    goto LABEL_64;
  }

  swift_bridgeObjectRelease(v68);
  id v73 = 0LL;
  uint64_t v7 = v82;
  uint64_t v34 = v137;
  uint64_t v58 = (uint64_t)v139;
LABEL_64:
  uint64_t v87 = (uint64_t)v138;
  uint64_t v59 = v81;
  uint64_t v6 = v141;
LABEL_65:
  unint64_t v95 = v130;
  sub_E378((uint64_t)v130, v87, v58);
  sub_E450(v59, v125, v124);
  sub_E450((uint64_t)v140, v129, v128);
  sub_E450((uint64_t)v95, v87, v58);
  if (!v95)
  {
LABEL_73:
    id v72 = 0LL;
LABEL_74:
    unint64_t v74 = v120;
    goto LABEL_75;
  }

  swift_bridgeObjectRelease(v58);
  if (!v95[2])
  {
    swift_bridgeObjectRelease(v95);
    goto LABEL_73;
  }

  uint64_t v96 = v34;
  uint64_t v98 = v95[5];
  uint64_t v97 = v95[6];
  id v72 = (id)v95[7];
  uint64_t v99 = v95[11];
  swift_bridgeObjectRetain(v99);
  swift_bridgeObjectRetain(v98);
  swift_bridgeObjectRetain(v72);
  swift_bridgeObjectRelease(v99);
  swift_bridgeObjectRelease(v95);
  swift_bridgeObjectRelease(v98);
  if (!v72)
  {
    uint64_t v34 = v96;
    goto LABEL_74;
  }

  uint64_t v34 = v96;
  if ((_BYTE)v133)
  {
    unint64_t v74 = v120;
    if (v133 != 1)
    {
      swift_bridgeObjectRelease(0xE400000000000000LL);
LABEL_80:
      __int128 v114 = (objc_class *)type metadata accessor for PhonemeString();
      uint64_t v115 = objc_allocWithZone(v114);
      uint64_t v116 = &v115[OBJC_IVAR___PhonemeString_symbols];
      void *v116 = v97;
      v116[1] = v72;
      v115[OBJC_IVAR___PhonemeString_encoding] = v132;
      os_log_type_t v117 = &v115[OBJC_IVAR___PhonemeString_boundary];
      *os_log_type_t v117 = 0LL;
      v117[1] = 0xE000000000000000LL;
      v144.receiver = v115;
      v144.super_class = v114;
      id v72 = objc_msgSendSuper2(&v144, "init");
      goto LABEL_75;
    }

    unint64_t v100 = 0xE400000000000000LL;
    uint64_t v101 = 1953718636LL;
  }

  else
  {
    uint64_t v101 = 0x7473726966LL;
    unint64_t v100 = 0xE500000000000000LL;
    unint64_t v74 = v120;
  }

  char v113 = _stringCompareWithSmolCheck(_:_:expecting:)(v101, v100, 1801677166LL, 0xE400000000000000LL, 0LL);
  swift_bridgeObjectRelease(v100);
  if ((v113 & 1) != 0) {
    goto LABEL_80;
  }
  swift_bridgeObjectRelease(v72);
  id v72 = 0LL;
LABEL_75:
  unsigned int v102 = v135;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v135, v34, v6);
  uint64_t v103 = (objc_class *)type metadata accessor for CorrectedPronunciation();
  unsigned int v104 = (char *)objc_allocWithZone(v103);
  uint64_t v105 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
  unint64_t v106 = (uint64_t *)&v104[OBJC_IVAR___CorrectedPronunciation_locale];
  *unint64_t v106 = v105;
  v106[1] = v107;
  *(void *)&v104[OBJC_IVAR___CorrectedPronunciation_maybeFirstNamePhonemeString] = v74;
  *(void *)&v104[OBJC_IVAR___CorrectedPronunciation_maybeLastNamePhonemeString] = v73;
  *(void *)&v104[OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString] = v72;
  id v108 = v72;
  id v109 = v74;
  id v110 = v73;

  v145.receiver = v104;
  v145.super_class = v103;
  id v111 = objc_msgSendSuper2(&v145, "init");
  (*(void (**)(char *, uint64_t))(v7 + 8))(v102, v6);

  return v111;
}

uint64_t sub_1F938(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_501C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t *sub_1F97C(uint64_t *a1)
{
  return a1;
}

uint64_t sub_1F9D4( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (result != 1)
  {
    sub_E450(result, a2, a3);
    sub_E450(a6, a7, a8);
    return sub_E450(a11, a12, a13);
  }

  return result;
}

void *sub_1FA64(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[8];
  uint64_t v8 = a1[7];
  uint64_t v6 = a1[9];
  uint64_t v10 = a1[13];
  uint64_t v11 = a1[12];
  uint64_t v9 = a1[14];
  swift_bridgeObjectRetain(a1[1]);
  sub_E378(v2, v3, v4);
  sub_E378(v8, v5, v6);
  sub_E378(v11, v10, v9);
  return a1;
}

uint64_t sub_1FB30(uint64_t a1)
{
  return a1;
}

uint64_t sub_1FB58(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_501C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_1FB9C(uint64_t a1)
{
  return sub_1FBB4(a1, (uint64_t (*)(void))&type metadata accessor for ASRBestRawRecognitionUtterance);
}

uint64_t sub_1FBA8(uint64_t a1)
{
  return sub_1FBB4(a1, (uint64_t (*)(void))&type metadata accessor for ASRBestRawRecognitionPhonemes);
}

uint64_t sub_1FBB4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    uint64_t v5 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    while (1)
    {
      sub_2116C(v5, (uint64_t)&v16);
      sub_2116C((uint64_t)&v16, (uint64_t)v18);
      uint64_t v6 = sub_501C(&qword_4B2A0);
      uint64_t v7 = a2(0LL);
      sub_541C(&v16);
      v5 += 40LL;
      if (!--v3)
      {
        swift_bridgeObjectRelease(a1);
        goto LABEL_6;
      }
    }

    uint64_t v8 = v15;
    swift_bridgeObjectRelease(a1);
    swift_release(v8);
    sub_211B0(&v16, (uint64_t)v18);
  }

  else
  {
LABEL_6:
    uint64_t v19 = 0LL;
    memset(v18, 0, sizeof(v18));
  }

  sub_1FB58((uint64_t)v18, (uint64_t)&v16, &qword_4B7F0);
  if (!v17)
  {
    sub_BA5C((uint64_t)&v16, &qword_4B7F0);
    goto LABEL_12;
  }

  uint64_t v9 = sub_501C(&qword_4B2A0);
  uint64_t v10 = a2(0LL);
  if ((swift_dynamicCast(&v15, &v16, v9, v10, 6LL) & 1) == 0)
  {
LABEL_12:
    uint64_t v13 = 0LL;
    goto LABEL_13;
  }

  uint64_t v11 = v15;
  uint64_t v12 = swift_retain(v15);
  TypedNamedFeature.value.getter(&v16, v12);
  swift_release_n(v11, 2LL);
  uint64_t v13 = v16;
LABEL_13:
  sub_BA5C((uint64_t)v18, &qword_4B7F0);
  return v13;
}

uint64_t sub_1FD38(uint64_t a1)
{
  return sub_1FBB4(a1, (uint64_t (*)(void))&type metadata accessor for ASRBestRawRecognitionConfidence);
}

uint64_t sub_1FD44(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v3 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    while (1)
    {
      sub_2116C(v3, (uint64_t)&v14);
      sub_2116C((uint64_t)&v14, (uint64_t)v16);
      uint64_t v4 = sub_501C(&qword_4B2A0);
      uint64_t v5 = type metadata accessor for PhoneCallEventFeature.CallDuration(0LL);
      sub_541C(&v14);
      v3 += 40LL;
      if (!--v1)
      {
        swift_bridgeObjectRelease(a1);
        goto LABEL_6;
      }
    }

    uint64_t v6 = v13;
    swift_bridgeObjectRelease(a1);
    swift_release(v6);
    sub_211B0(&v14, (uint64_t)v16);
  }

  else
  {
LABEL_6:
    uint64_t v17 = 0LL;
    memset(v16, 0, sizeof(v16));
  }

  sub_1FB58((uint64_t)v16, (uint64_t)&v14, &qword_4B7F0);
  if (!v15)
  {
    sub_BA5C((uint64_t)&v14, &qword_4B7F0);
    goto LABEL_12;
  }

  uint64_t v7 = sub_501C(&qword_4B2A0);
  uint64_t v8 = type metadata accessor for PhoneCallEventFeature.CallDuration(0LL);
  if ((swift_dynamicCast(&v13, &v14, v7, v8, 6LL) & 1) == 0)
  {
LABEL_12:
    uint64_t v11 = 0LL;
    goto LABEL_13;
  }

  uint64_t v9 = v13;
  uint64_t v10 = swift_retain(v13);
  TypedNamedFeature.value.getter(&v14, v10);
  swift_release_n(v9, 2LL);
  uint64_t v11 = v14;
LABEL_13:
  sub_BA5C((uint64_t)v16, &qword_4B7F0);
  return v11;
}

uint64_t sub_1FED0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v3 = a1 + 32;
    swift_bridgeObjectRetain(a1);
    while (1)
    {
      sub_2116C(v3, (uint64_t)&v14);
      sub_2116C((uint64_t)&v14, (uint64_t)v16);
      uint64_t v4 = sub_501C(&qword_4B2A0);
      uint64_t v5 = type metadata accessor for CommonFeature.IntentHandlingStatus(0LL);
      sub_541C(&v14);
      v3 += 40LL;
      if (!--v1)
      {
        swift_bridgeObjectRelease(a1);
        goto LABEL_6;
      }
    }

    uint64_t v6 = v13;
    swift_bridgeObjectRelease(a1);
    swift_release(v6);
    sub_211B0(&v14, (uint64_t)v16);
  }

  else
  {
LABEL_6:
    uint64_t v17 = 0LL;
    memset(v16, 0, sizeof(v16));
  }

  sub_1FB58((uint64_t)v16, (uint64_t)&v14, &qword_4B7F0);
  if (!v15)
  {
    sub_BA5C((uint64_t)&v14, &qword_4B7F0);
    goto LABEL_12;
  }

  uint64_t v7 = sub_501C(&qword_4B2A0);
  uint64_t v8 = type metadata accessor for CommonFeature.IntentHandlingStatus(0LL);
  if ((swift_dynamicCast(&v13, &v14, v7, v8, 6LL) & 1) == 0)
  {
LABEL_12:
    uint64_t v11 = 0LL;
    goto LABEL_13;
  }

  uint64_t v9 = v13;
  uint64_t v10 = swift_retain(v13);
  TypedNamedFeature.value.getter(&v14, v10);
  swift_release_n(v9, 2LL);
  uint64_t v11 = v14;
LABEL_13:
  sub_BA5C((uint64_t)v16, &qword_4B7F0);
  return v11;
}

uint64_t sub_2005C()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for PostSiriEngagementDataProcessor()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin31PostSiriEngagementDataProcessor);
}

uint64_t sub_2008C(uint64_t a1, uint64_t a2)
{
  uint64_t v60 = a1;
  uint64_t v3 = type metadata accessor for UUID(0LL);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v56 - v8;
  uint64_t v10 = type metadata accessor for AppInteraction(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = *(void *)(a2 + 16);
  if (!v14)
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v29 = type metadata accessor for Logger(0LL);
    sub_4F30(v29, (uint64_t)qword_4FC70);
    uint64_t v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v60, v3);
    uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      char v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v34 = swift_slowAlloc(32LL, -1LL);
      uint64_t v63 = v34;
      *(_DWORD *)char v33 = 136315138;
      unint64_t v35 = sub_B948();
      uint64_t v36 = dispatch thunk of CustomStringConvertible.description.getter(v3, v35);
      unint64_t v38 = v37;
      uint64_t v62 = sub_25824(v36, v37, &v63);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63);
      swift_bridgeObjectRelease(v38);
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      _os_log_impl(&dword_0, v31, v32, "Conversation %s has 0 turns in it", v33, 0xCu);
      swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1LL, -1LL);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }

    return 2LL;
  }

  uint64_t v59 = v9;
  uint64_t v15 = *(void *)(a2 + 16 * v14 + 24);
  uint64_t v16 = *(void *)(v15 + 16);
  if (v16)
  {
    uint64_t v57 = v3;
    uint64_t v58 = v4;
    uint64_t v17 = v15 + ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
    uint64_t v61 = *(void *)(v11 + 72);
    unint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16);
    uint64_t v56 = v15;
    swift_bridgeObjectRetain_n(v15, 2LL);
    uint64_t v19 = _swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v20 = v18(v13, v17, v10);
      uint64_t v21 = (void *)AppInteraction.interaction.getter(v20);
      id v22 = [v21 intent];

      uint64_t v23 = objc_opt_self(&OBJC_CLASS___INStartCallIntent);
      uint64_t v24 = swift_dynamicCastObjCClass(v22, v23);
      if (v24) {
        break;
      }
      uint64_t v25 = objc_opt_self(&OBJC_CLASS___INSendMessageIntent);
      uint64_t v26 = swift_dynamicCastObjCClass(v22, v25);

      if (v26) {
        goto LABEL_9;
      }
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
LABEL_5:
      v17 += v61;
      if (!--v16)
      {
        swift_bridgeObjectRelease_n(v56, 2LL);
        uint64_t v3 = v57;
        uint64_t v4 = v58;
        goto LABEL_20;
      }
    }

LABEL_9:
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    if ((swift_isUniquelyReferenced_nonNull_native(v19) & 1) == 0) {
      uint64_t v19 = sub_13DC0(0LL, v19[2] + 1LL, 1, v19);
    }
    unint64_t v28 = v19[2];
    unint64_t v27 = v19[3];
    if (v28 >= v27 >> 1) {
      uint64_t v19 = sub_13DC0((void *)(v27 > 1), v28 + 1, 1, v19);
    }
    v19[2] = v28 + 1;
    *((_BYTE *)v19 + v28 + 3sub_541C(v0 + 2) = v24 == 0;
    goto LABEL_5;
  }

  uint64_t v19 = _swiftEmptyArrayStorage;
LABEL_20:
  uint64_t v39 = swift_bridgeObjectRetain(v19);
  uint64_t v40 = sub_32658(v39);
  swift_bridgeObjectRelease(v19);
  unint64_t v41 = *(void *)(v40 + 16);
  swift_bridgeObjectRelease(v40);
  BOOL v42 = v41 > 1;
  __int128 v43 = v59;
  if (v42)
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v44 = type metadata accessor for Logger(0LL);
    sub_4F30(v44, (uint64_t)qword_4FC70);
    uint64_t v45 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16))(v43, v60, v3);
    int v46 = (os_log_s *)Logger.logObject.getter(v45);
    os_log_type_t v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v48 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v49 = swift_slowAlloc(32LL, -1LL);
      uint64_t v63 = v49;
      uint64_t v58 = v4;
      *(_DWORD *)uint64_t v48 = 136315138;
      unint64_t v50 = sub_B948();
      uint64_t v51 = dispatch thunk of CustomStringConvertible.description.getter(v3, v50);
      unint64_t v53 = v52;
      uint64_t v62 = sub_25824(v51, v52, &v63);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63);
      swift_bridgeObjectRelease(v53);
      (*(void (**)(char *, uint64_t))(v58 + 8))(v43, v3);
      _os_log_impl(&dword_0, v46, v47, "Conversation %s is linked with multiple domains", v48, 0xCu);
      swift_arrayDestroy(v49, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v49, -1LL, -1LL);
      swift_slowDealloc(v48, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v43, v3);
    }
  }

  if (!v19[2])
  {
    swift_bridgeObjectRelease(v19);
    return 2LL;
  }

  uint64_t v54 = *((unsigned __int8 *)v19 + 32);
  swift_bridgeObjectRelease(v19);
  return v54;
}

uint64_t sub_20650(uint64_t a1, uint64_t a2, int a3)
{
  int v123 = a3;
  uint64_t v124 = a1;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v125 = *(void *)(v4 - 8);
  uint64_t v126 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v117 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v117 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  int v122 = (os_log_s *)((char *)&v117 - v12);
  __chkstk_darwin(v11);
  int v121 = (os_log_s *)((char *)&v117 - v13);
  uint64_t v14 = sub_501C(&qword_4B7E0);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v117 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = sub_501C(&qword_4B7E8);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v117 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v117 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = __chkstk_darwin(v22);
  id v120 = (char *)&v117 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v119 = (char *)&v117 - v28;
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v117 - v29;
  sub_1FB58(a2, (uint64_t)v19, &qword_4B7E8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1LL, v20) == 1)
  {
    sub_BA5C((uint64_t)v19, &qword_4B7E8);
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v31 = type metadata accessor for Logger(0LL);
    sub_4F30(v31, (uint64_t)qword_4FC70);
    uint64_t v32 = v125;
    uint64_t v33 = v126;
    uint64_t v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v125 + 16))(v7, v124, v126);
    unint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v38 = swift_slowAlloc(32LL, -1LL);
      uint64_t v128 = v38;
      *(_DWORD *)unint64_t v37 = 136315138;
      unint64_t v39 = sub_B948();
      uint64_t v40 = dispatch thunk of CustomStringConvertible.description.getter(v33, v39);
      unint64_t v42 = v41;
      uint64_t v127 = sub_25824(v40, v41, &v128);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128);
      swift_bridgeObjectRelease(v42);
      (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v33);
      _os_log_impl(&dword_0, v35, v36, "[%s]: No event found for extraction of features", v37, 0xCu);
      swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v38, -1LL, -1LL);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v32 + 8))(v7, v33);
    }

    return 0LL;
  }

  uint64_t v43 = (*(uint64_t (**)(char *, char *, uint64_t))(v21 + 32))(v30, v19, v20);
  uint64_t v44 = CoreDuetEvent.features.getter(v43);
  uint64_t v45 = sub_1FBB4( v44,  (uint64_t (*)(void))&type metadata accessor for CommonContactFeature.RecipientContactReferences);
  swift_bridgeObjectRelease(v44);
  uint64_t v118 = v30;
  if (v45)
  {
    uint64_t v46 = v20;
    uint64_t v47 = *(void *)(v45 + 16);
    uint64_t v48 = type metadata accessor for CommonContactReference(0LL);
    uint64_t v49 = *(void *)(v48 - 8);
    if (v47)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v49 + 16))( v16,  v45 + ((*(unsigned __int8 *)(v49 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80)),  v48);
      uint64_t v50 = 0LL;
    }

    else
    {
      uint64_t v50 = 1LL;
    }

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v16, v50, 1LL, v48);
    swift_bridgeObjectRelease(v45);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v49 + 48))(v16, 1LL, v48) == 1)
    {
      sub_BA5C((uint64_t)v16, &qword_4B7E0);
      uint64_t v20 = v46;
      uint64_t v30 = v118;
      goto LABEL_18;
    }

    uint64_t v51 = CommonContactReference.contactIdentifier.getter();
    uint64_t v53 = v52;
    uint64_t v54 = (*(uint64_t (**)(char *, uint64_t))(v49 + 8))(v16, v48);
    uint64_t v20 = v46;
    uint64_t v30 = v118;
    if (v53)
    {
      uint64_t v55 = CoreDuetEvent.features.getter(v54);
      uint64_t v56 = v55;
      if ((v123 & 1) != 0)
      {
        sub_1FED0(v55);
        char v81 = v80;
        swift_bridgeObjectRelease(v56);
        if ((v81 & 1) == 0)
        {
LABEL_27:
          (*(void (**)(char *, uint64_t))(v21 + 8))(v30, v20);
          return v51;
        }

        swift_bridgeObjectRelease(v53);
        if (qword_4A778 != -1) {
          swift_once(&qword_4A778, sub_349B4);
        }
        uint64_t v103 = type metadata accessor for Logger(0LL);
        sub_4F30(v103, (uint64_t)qword_4FC70);
        uint64_t v83 = v125;
        uint64_t v84 = v122;
        uint64_t v85 = v126;
        (*(void (**)(os_log_s *, uint64_t, uint64_t))(v125 + 16))(v122, v124, v126);
        uint64_t v86 = v120;
        uint64_t v104 = (*(uint64_t (**)(char *, char *, uint64_t))(v21 + 16))(v120, v30, v20);
        uint64_t v88 = (os_log_s *)Logger.logObject.getter(v104);
        os_log_type_t v105 = static os_log_type_t.debug.getter();
        int v106 = v105;
        if (os_log_type_enabled(v88, v105))
        {
          uint64_t v107 = swift_slowAlloc(22LL, -1LL);
          int v123 = v106;
          uint64_t v92 = v107;
          uint64_t v124 = swift_slowAlloc(64LL, -1LL);
          uint64_t v128 = v124;
          *(_DWORD *)uint64_t v92 = 136315394;
          uint64_t v119 = (char *)(v92 + 4);
          unint64_t v108 = sub_B948();
          int v121 = v88;
          uint64_t v109 = dispatch thunk of CustomStringConvertible.description.getter(v85, v108);
          unint64_t v111 = v110;
          uint64_t v127 = sub_25824(v109, v110, &v128);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128);
          swift_bridgeObjectRelease(v111);
          uint64_t v112 = (*(uint64_t (**)(os_log_s *, uint64_t))(v83 + 8))(v84, v85);
          *(_WORD *)(v92 + 1sub_541C(v0 + 2) = 2080;
          uint64_t v113 = CoreDuetEvent.eventId.getter(v112);
          unint64_t v115 = v114;
          uint64_t v127 = sub_25824(v113, v114, &v128);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128);
          swift_bridgeObjectRelease(v115);
          unint64_t v78 = *(void (**)(char *, uint64_t))(v21 + 8);
          v78(v86, v20);
          uint64_t v101 = "[%s]: Failed to get message handling status for core duet event: %s";
          unsigned int v102 = v121;
          goto LABEL_36;
        }
      }

      else
      {
        sub_1FD44(v55);
        char v58 = v57;
        swift_bridgeObjectRelease(v56);
        if ((v58 & 1) == 0) {
          goto LABEL_27;
        }
        swift_bridgeObjectRelease(v53);
        if (qword_4A778 != -1) {
          swift_once(&qword_4A778, sub_349B4);
        }
        uint64_t v82 = type metadata accessor for Logger(0LL);
        sub_4F30(v82, (uint64_t)qword_4FC70);
        uint64_t v83 = v125;
        uint64_t v84 = v121;
        uint64_t v85 = v126;
        (*(void (**)(os_log_s *, uint64_t, uint64_t))(v125 + 16))(v121, v124, v126);
        uint64_t v86 = v119;
        uint64_t v87 = (*(uint64_t (**)(char *, char *, uint64_t))(v21 + 16))(v119, v30, v20);
        uint64_t v88 = (os_log_s *)Logger.logObject.getter(v87);
        os_log_type_t v89 = static os_log_type_t.debug.getter();
        int v90 = v89;
        if (os_log_type_enabled(v88, v89))
        {
          uint64_t v91 = swift_slowAlloc(22LL, -1LL);
          int v123 = v90;
          uint64_t v92 = v91;
          uint64_t v124 = swift_slowAlloc(64LL, -1LL);
          uint64_t v128 = v124;
          *(_DWORD *)uint64_t v92 = 136315394;
          id v120 = (char *)(v92 + 4);
          unint64_t v93 = sub_B948();
          int v122 = v88;
          uint64_t v94 = dispatch thunk of CustomStringConvertible.description.getter(v85, v93);
          unint64_t v96 = v95;
          uint64_t v127 = sub_25824(v94, v95, &v128);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128);
          swift_bridgeObjectRelease(v96);
          uint64_t v97 = (*(uint64_t (**)(os_log_s *, uint64_t))(v83 + 8))(v84, v85);
          *(_WORD *)(v92 + 1sub_541C(v0 + 2) = 2080;
          uint64_t v98 = CoreDuetEvent.eventId.getter(v97);
          unint64_t v100 = v99;
          uint64_t v127 = sub_25824(v98, v99, &v128);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128);
          swift_bridgeObjectRelease(v100);
          unint64_t v78 = *(void (**)(char *, uint64_t))(v21 + 8);
          v78(v86, v20);
          uint64_t v101 = "[%s]: Failed to get call duration for core duet event: %s";
          unsigned int v102 = v122;
LABEL_36:
          _os_log_impl(&dword_0, v102, (os_log_type_t)v123, v101, (uint8_t *)v92, 0x16u);
          uint64_t v116 = v124;
          swift_arrayDestroy(v124, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v116, -1LL, -1LL);
          swift_slowDealloc(v92, -1LL, -1LL);

          goto LABEL_23;
        }
      }

      unint64_t v78 = *(void (**)(char *, uint64_t))(v21 + 8);
      v78(v86, v20);
      (*(void (**)(os_log_s *, uint64_t))(v83 + 8))(v84, v85);
      goto LABEL_23;
    }
  }

uint64_t sub_2116C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 3sub_541C(v0 + 2) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_211B0(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 3sub_541C(v0 + 2) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_211C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = ((uint64_t (*)(void))static PLLoggingReader.shared.getter)();
  PLLoggingReader.asyncSignalReader.getter(&v12);
  swift_release(v2);
  __int128 v11 = v13;
  uint64_t v3 = v13;
  uint64_t v4 = sub_4FF8(&v12, v13);
  *(_OWORD *)&v14[3] = v11;
  uint64_t v5 = sub_26194(v14);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v3 - 8) + 16LL))(v5, v4, v3);
  uint64_t v6 = sub_541C(&v12);
  uint64_t v7 = static PLLoggingReader.shared.getter(v6);
  PLLoggingReader.streamBookmarkStore.getter(&v12);
  swift_release(v7);
  uint64_t v8 = type metadata accessor for SiriConversationReader();
  uint64_t v9 = swift_allocObject(v8, 96LL, 7LL);
  sub_211B0((__int128 *)v14, v9 + 16);
  uint64_t result = sub_211B0(&v12, v9 + 56);
  a1[3] = v8;
  a1[4] = (uint64_t)&off_45EE8;
  *a1 = v9;
  return result;
}

uint64_t sub_212C4@<X0>(void *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PostSiriEngagementDataProcessor();
  uint64_t v3 = swift_allocObject(v2, 24LL, 7LL);
  *(void *)(v3 + 16) = 0x4014000000000000LL;
  uint64_t v4 = sub_501C(&qword_4B9B8);
  uint64_t v5 = swift_allocObject(v4, 152LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_38C30;
  uint64_t v6 = type metadata accessor for INStartCallIntentFeatureExtractor(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t v7 = INStartCallIntentFeatureExtractor.init()();
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = sub_1DC28( &qword_4B9C0,  (uint64_t (*)(uint64_t))&type metadata accessor for INStartCallIntentFeatureExtractor,  (uint64_t)&protocol conformance descriptor for INStartCallIntentFeatureExtractor);
  *(void *)(v5 + 3sub_541C(v0 + 2) = v7;
  uint64_t v8 = type metadata accessor for INSendMessageIntentFeatureExtractor(0LL);
  swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
  uint64_t v9 = INSendMessageIntentFeatureExtractor.init()();
  *(void *)(v5 + 96) = v8;
  *(void *)(v5 + 104) = sub_1DC28( &qword_4B9C8,  (uint64_t (*)(uint64_t))&type metadata accessor for INSendMessageIntentFeatureExtractor,  (uint64_t)&protocol conformance descriptor for INSendMessageIntentFeatureExtractor);
  *(void *)(v5 + 7sub_541C(v0 + 2) = v9;
  uint64_t v10 = type metadata accessor for CommonInteractionFeatureExtractor(0LL);
  swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  uint64_t v11 = CommonInteractionFeatureExtractor.init()();
  *(void *)(v5 + 136) = v10;
  *(void *)(v5 + 144) = sub_1DC28( &qword_4B9D0,  (uint64_t (*)(uint64_t))&type metadata accessor for CommonInteractionFeatureExtractor,  (uint64_t)&protocol conformance descriptor for CommonInteractionFeatureExtractor);
  *(void *)(v5 + 11sub_541C(v0 + 2) = v11;
  uint64_t v12 = sub_501C(&qword_4ABB0);
  uint64_t v13 = swift_allocObject(v12, 48LL, 7LL);
  *(_OWORD *)(v13 + 16) = xmmword_39DB0;
  uint64_t v14 = type metadata accessor for PhoneCallEventCoalescer(0LL);
  swift_allocObject(v14, *(unsigned int *)(v14 + 48), *(unsigned __int16 *)(v14 + 52));
  *(void *)(v13 + 3sub_541C(v0 + 2) = PhoneCallEventCoalescer.init()();
  uint64_t v15 = type metadata accessor for SendMessageEventCoalescer(0LL);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  *(void *)(v13 + 40) = SendMessageEventCoalescer.init()();
  v31[0] = v13;
  specialized Array._endMutation()();
  uint64_t v16 = v13;
  uint64_t v17 = sub_255E8((uint64_t)v32, v32[3]);
  __chkstk_darwin(v17);
  uint64_t v19 = (void *)((char *)v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v20 + 16))(v19);
  uint64_t v21 = *v19;
  uint64_t v22 = type metadata accessor for ASRLoggedContactTokensProcessor();
  v31[3] = v22;
  v31[4] = &off_45968;
  v31[0] = v21;
  uint64_t v23 = type metadata accessor for ConversationDataProcessor();
  uint64_t v24 = (void *)swift_allocObject(v23, 80LL, 7LL);
  uint64_t v25 = sub_255E8((uint64_t)v31, v22);
  __chkstk_darwin(v25);
  uint64_t v27 = (void *)((char *)v31 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v28 + 16))(v27);
  uint64_t v29 = *v27;
  v24[5] = v22;
  v24[6] = &off_45968;
  v24[2] = v29;
  v24[7] = v3;
  v24[8] = v5;
  v24[9] = v16;
  sub_541C(v31);
  uint64_t result = sub_541C(v32);
  a1[3] = v23;
  a1[4] = &off_46F50;
  *a1 = v24;
  return result;
}

uint64_t sub_215CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = type metadata accessor for ASRFeatureExtractor(0LL);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  uint64_t v3 = ASRFeatureExtractor.init()();
  uint64_t v4 = type metadata accessor for TrialSiriUnderstandingTMDCStatusResolver(0LL);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t v9 = TrialSiriUnderstandingTMDCStatusResolver.init()();
  uint64_t v5 = type metadata accessor for ASRLoggedContactTokensProcessor();
  uint64_t v6 = swift_allocObject(v5, 40LL, 7LL);
  *(void *)(v6 + 16) = v3;
  swift_retain(v3);
  *(double *)(v6 + 24) = dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.asrConfidenceThreshold()( v4,  &protocol witness table for TrialSiriUnderstandingTMDCStatusResolver);
  double v7 = dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.asrConfidenceThresholdForOnlyContactName()( v4,  &protocol witness table for TrialSiriUnderstandingTMDCStatusResolver);
  swift_release(v3);
  *(double *)(v6 + 3sub_541C(v0 + 2) = v7;
  uint64_t result = swift_release(v9);
  a1[3] = v5;
  a1[4] = (uint64_t)&off_45968;
  *a1 = v6;
  return result;
}

uint64_t sub_216D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  uint64_t v5 = sub_501C(&qword_4B970);
  v3[6] = swift_task_alloc((*(void *)(*(void *)(v5 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for Conversation(0LL);
  v3[7] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[8] = v7;
  void v3[9] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_501C(&qword_4B948);
  v3[10] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[11] = v9;
  v3[12] = swift_task_alloc((*(void *)(v9 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = sub_501C(&qword_4B978);
  v3[13] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[14] = v11;
  v3[15] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  v3[2] = a1;
  return swift_task_switch(sub_217BC, 0LL, 0LL);
}

uint64_t sub_217BC()
{
  uint64_t v1 = v0[10];
  (*(void (**)(void, void, uint64_t))(v0[11] + 16LL))(v0[12], v0[4], v1);
  uint64_t v2 = sub_263EC(&qword_4B980, &qword_4B948, (uint64_t)&protocol conformance descriptor for AsyncMapSequence<A, B>);
  dispatch thunk of AsyncSequence.makeAsyncIterator()(v1, v2);
  uint64_t v3 = sub_263EC( &qword_4B988,  &qword_4B978,  (uint64_t)&protocol conformance descriptor for AsyncMapSequence<A, B>.Iterator);
  v0[16] = v3;
  uint64_t v4 = (void *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  v0[17] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_21894;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0[6], v0[13], v3);
}

uint64_t sub_21894()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 136LL));
  if (v0)
  {
    uint64_t v3 = v2[3];
    v2[18] = v0;
    uint64_t v5 = v2[14];
    uint64_t v4 = v2[15];
    uint64_t v6 = v2[13];
    swift_bridgeObjectRelease(v3);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = sub_21A38;
  }

  else
  {
    uint64_t v7 = sub_21920;
  }

  return swift_task_switch(v7, 0LL, 0LL);
}

uint64_t sub_21920()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 48);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1LL, v1) == 1)
  {
    uint64_t v4 = *(void *)(v0 + 120);
    uint64_t v5 = *(void *)(v0 + 96);
    uint64_t v6 = *(void *)(v0 + 72);
    uint64_t v7 = *(void *)(v0 + 40);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 112) + 8LL))(v4, *(void *)(v0 + 104));
    sub_BA5C(v3, &qword_4B970);
    swift_release(v7);
    uint64_t v8 = *(void *)(v0 + 16);
    swift_task_dealloc(v4);
    swift_task_dealloc(v5);
    swift_task_dealloc(v6);
    swift_task_dealloc(v3);
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
  }

  else
  {
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(*(void *)(v0 + 72), v3, v1);
    uint64_t v10 = (void *)swift_task_alloc(dword_4AEEC);
    *(void *)(v0 + 15sub_541C(v0 + 2) = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_21AA8;
    return sub_A4A4(v0 + 16, *(void *)(v0 + 72), *(void *)(v0 + 40));
  }

uint64_t sub_21A38()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 48);
  swift_release(*(void *)(v0 + 40));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21AA8()
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 152LL);
  *(void *)(*(void *)v1 + 16_swift_stdlib_reportUnimplementedInitializer( "SiriPrivateLearningTTSMispronunciationPlugin.TMDCCoreDataStore",  62LL,  "init(path:modelFileName:)",  25LL, 0LL) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    uint64_t v5 = v2[14];
    uint64_t v4 = v2[15];
    uint64_t v6 = v2[13];
    uint64_t v8 = v2[8];
    uint64_t v7 = v2[9];
    uint64_t v9 = v2[7];
    swift_bridgeObjectRelease(v2[2]);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v10 = sub_21C50;
  }

  else
  {
    (*(void (**)(void, void))(v2[8] + 8LL))(v2[9], v2[7]);
    uint64_t v10 = sub_21B6C;
  }

  return swift_task_switch(v10, 0LL, 0LL);
}

uint64_t sub_21B6C()
{
  v0[21] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_21BC4;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0[6], v0[13], v0[16]);
}

uint64_t sub_21BC4()
{
  uint64_t v2 = *(void **)v1;
  swift_task_dealloc(*(void *)(*(void *)v1 + 168LL));
  if (v0)
  {
    uint64_t v3 = v2[2];
    v2[18] = v0;
    uint64_t v5 = v2[14];
    uint64_t v4 = v2[15];
    uint64_t v6 = v2[13];
    swift_bridgeObjectRelease(v3);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
    uint64_t v7 = sub_21A38;
  }

  else
  {
    uint64_t v7 = sub_21920;
  }

  return swift_task_switch(v7, 0LL, 0LL);
}

uint64_t sub_21C50()
{
  uint64_t v1 = *(void *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 48);
  swift_release(*(void *)(v0 + 40));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SiriPrivateLearningTTSMispronunciationPlugin.__allocating_init()()
{
  uint64_t v1 = swift_allocObject(v0, 353LL, 7LL);
  SiriPrivateLearningTTSMispronunciationPlugin.init()();
  return v1;
}

uint64_t SiriPrivateLearningTTSMispronunciationPlugin.init()()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Locale(0LL);
  uint64_t v118 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  unint64_t v115 = (char *)&v109 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v109 - v5;
  uint64_t v7 = type metadata accessor for Locale(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v109 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for CurrentLocales(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v109 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for SupportedLocalesStorePath(0LL);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v109 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for SiriPrivateLearningTTSMispronunciationPlugin();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v17);
  id v114 = (id)objc_opt_self(&OBJC_CLASS___NSBundle);
  SupportedLocalesStorePath.init(bundle:fileName:)( [v114 bundleForClass:ObjCClassFromMetadata],  0xD000000000000010,  0x800000000003BAC0);
  uint64_t v19 = type metadata accessor for SupportedLocalesPListStore(0LL);
  swift_allocObject(v19, *(unsigned int *)(v19 + 48), *(unsigned __int16 *)(v19 + 52));
  uint64_t v20 = SupportedLocalesPListStore.init(storePath:)(v16);
  uint64_t v127 = v19;
  uint64_t v128 = (char **)&protocol witness table for SupportedLocalesPListStore;
  *(void *)&__int128 v126 = v20;
  id v21 = [(id)objc_opt_self(NSLocale) currentLocale];
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();

  id v22 = [(id)objc_opt_self(AFPreferences) sharedPreferences];
  CurrentLocales.init(deviceLocale:siriPreferences:)(v9, v22);
  uint64_t v23 = type metadata accessor for LocalesController(0LL);
  swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
  *(void *)(v1 + 344) = LocalesController.init(currentLocales:supportedLocalesStore:)(v13, &v126);
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v116 = v6;
  uint64_t v117 = v11;
  uint64_t v119 = v2;
  uint64_t v24 = type metadata accessor for Logger(0LL);
  sub_4F30(v24, (uint64_t)qword_4FC70);
  uint64_t v25 = swift_retain_n(v1, 2LL);
  uint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
  os_log_type_t v27 = static os_log_type_t.info.getter();
  BOOL v28 = os_log_type_enabled(v26, v27);
  uint64_t v120 = v10;
  if (v28)
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v30 = swift_slowAlloc(32LL, -1LL);
    *(void *)&__int128 v126 = v30;
    *(_DWORD *)uint64_t v29 = 136315138;
    uint64_t v113 = v29 + 4;
    uint64_t v31 = v13;
    ((void (*)(void))LocalesController.currentLocales.getter)();
    uint64_t v32 = sub_1DC28( &qword_4B7F8,  (uint64_t (*)(uint64_t))&type metadata accessor for CurrentLocales,  (uint64_t)&protocol conformance descriptor for CurrentLocales);
    uint64_t v33 = dispatch thunk of CustomStringConvertible.description.getter(v10, v32);
    uint64_t v34 = v10;
    unint64_t v36 = v35;
    (*(void (**)(char *, uint64_t))(v117 + 8))(v13, v34);
    uint64_t v122 = sub_25824(v33, v36, (uint64_t *)&v126);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, &v123);
    swift_release_n(v1, 2LL);
    swift_bridgeObjectRelease(v36);
    _os_log_impl(&dword_0, v26, v27, "Initialising TMDC plugin with current locale %s", v29, 0xCu);
    swift_arrayDestroy(v30, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v30, -1LL, -1LL);
    swift_slowDealloc(v29, -1LL, -1LL);
  }

  else
  {

    swift_release_n(v1, 2LL);
    uint64_t v31 = v13;
  }

  uint64_t v37 = type metadata accessor for DebugModeFlagUserDefaultsStore(0LL);
  swift_allocObject(v37, *(unsigned int *)(v37 + 48), *(unsigned __int16 *)(v37 + 52));
  uint64_t v38 = DebugModeFlagUserDefaultsStore.init()();
  char v39 = dispatch thunk of DebugModeFlagUserDefaultsStore.debugModeEnabled.getter();
  swift_release(v38);
  uint64_t v113 = (unsigned __int8 *)(v1 + 352);
  *(_BYTE *)(v1 + 35sub_541C(v0 + 2) = v39 & 1;
  sub_211C8((uint64_t *)&v126);
  sub_212C4(&v122);
  uint64_t v40 = type metadata accessor for PostSiriEngagementDataProcessor();
  uint64_t v41 = swift_allocObject(v40, 24LL, 7LL);
  *(void *)(v41 + 16) = 0x4014000000000000LL;
  uint64_t v42 = type metadata accessor for PLLoggingReader(0LL);
  uint64_t v43 = static PLLoggingReader.shared.getter(v42);
  PLLoggingReader.interactionReader.getter(v121);
  swift_release(v43);
  uint64_t v110 = type metadata accessor for TrialSiriUnderstandingTMDCStatusResolver(0LL);
  swift_allocObject(v110, *(unsigned int *)(v110 + 48), *(unsigned __int16 *)(v110 + 52));
  uint64_t v44 = TrialSiriUnderstandingTMDCStatusResolver.init()();
  uint64_t v45 = sub_255E8((uint64_t)&v126, v127);
  __chkstk_darwin(v45);
  uint64_t v47 = (uint64_t *)((char *)&v109 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v48 + 16))(v47);
  uint64_t v49 = sub_255E8((uint64_t)&v122, v124);
  __chkstk_darwin(v49);
  uint64_t v51 = (uint64_t *)((char *)&v109 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v52 + 16))(v51);
  uint64_t v53 = sub_25FEC(*v47, *v51, v41, v121, v44);
  sub_541C(&v122);
  sub_541C(&v126);
  *(void *)(v1 + 40) = type metadata accessor for ConversationDataController();
  *(void *)(v1 + 48) = &off_45950;
  *(void *)(v1 + 16) = v53;
  uint64_t v54 = ((uint64_t (*)(void))LocalesController.currentLocales.getter)();
  uint64_t v55 = v31;
  uint64_t v56 = v116;
  CurrentLocales.siriVoice.getter(v54);
  uint64_t v57 = v1;
  char v58 = *(void (**)(char *, uint64_t))(v117 + 8);
  v58(v55, v120);
  uint64_t v59 = type metadata accessor for TTSPhonemesGenerator(0LL);
  uint64_t v60 = swift_allocObject(v59, *(unsigned int *)(v59 + 48), *(unsigned __int16 *)(v59 + 52));
  uint64_t v61 = v119;
  uint64_t v117 = *(void *)(v118 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v117)( v60 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin20TTSPhonemesGenerator_currentLocale,  v56,  v119);
  id v62 = [objc_allocWithZone(CNContactStore) init];
  uint64_t v127 = v59;
  uint64_t v128 = &off_45978;
  *(void *)&__int128 v126 = v60;
  uint64_t v63 = type metadata accessor for ContactPronunciationController();
  os_log_type_t v64 = (void *)swift_allocObject(v63, 64LL, 7LL);
  uint64_t v65 = sub_255E8((uint64_t)&v126, v59);
  __chkstk_darwin(v65);
  unint64_t v67 = (uint64_t *)((char *)&v109 - ((v66 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v68 + 16))(v67);
  uint64_t v69 = *v67;
  v64[6] = v59;
  v64[7] = &off_45978;
  v64[2] = v62;
  v64[3] = v69;
  uint64_t v70 = sub_541C(&v126);
  *(void *)(v57 + 56) = v64;
  uint64_t v71 = LocalesController.currentLocales.getter(v70);
  CurrentLocales.siri.getter(v71);
  unint64_t v111 = v55;
  uint64_t v112 = v58;
  v58(v55, v120);
  uint64_t v72 = type metadata accessor for PhonemesMapper();
  unint64_t v73 = (void *)swift_allocObject(v72, 24LL, 7LL);
  uint64_t v74 = swift_getObjCClassFromMetadata(*v73);
  id v75 = [v114 bundleForClass:v74];
  uint64_t v76 = v118;
  uint64_t v77 = v115;
  (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v115, v56, v61);
  uint64_t v78 = sub_3270C(v75, v77);
  (*(void (**)(char *, uint64_t))(v76 + 8))(v56, v61);
  v73[2] = v78;
  *(void *)(v57 + 64) = v73;
  *(void *)(v57 + 88) = v72;
  *(void *)(v57 + 96) = &off_46D80;
  uint64_t v79 = v110;
  swift_allocObject(v110, *(unsigned int *)(v110 + 48), *(unsigned __int16 *)(v110 + 52));
  *(void *)(v57 + 104) = TrialSiriUnderstandingTMDCStatusResolver.init()();
  *(void *)(v57 + 128) = v79;
  *(void *)(v57 + 136) = &protocol witness table for TrialSiriUnderstandingTMDCStatusResolver;
  sub_2116C(v57 + 104, (uint64_t)&v126);
  uint64_t v80 = type metadata accessor for P2PRunner();
  uint64_t v81 = swift_allocObject(v80, 56LL, 7LL);
  sub_211B0(&v126, v81 + 16);
  *(void *)(v57 + 168) = v80;
  *(void *)(v57 + 176) = &off_45508;
  *(void *)(v57 + 144) = v81;
  uint64_t v82 = type metadata accessor for TMDCSELFLogger();
  uint64_t v83 = swift_allocObject(v82, 16LL, 7LL);
  *(void *)(v57 + 208) = v82;
  *(void *)(v57 + 216) = &off_455F0;
  *(void *)(v57 + 184) = v83;
  char v84 = *(_BYTE *)(v57 + 352);
  if (qword_4A710 != -1) {
    swift_once(&qword_4A710, sub_11840);
  }
  uint64_t v85 = qword_4B1F8;
  uint64_t v86 = unk_4B200;
  uint64_t v87 = type metadata accessor for TMDCCoreDataStore(0LL);
  swift_allocObject(v87, *(unsigned int *)(v87 + 48), *(unsigned __int16 *)(v87 + 52));
  __n128 v88 = swift_bridgeObjectRetain(v86);
  uint64_t v89 = CoreDataStore.init(path:modelFileName:)(v85, v86, 0xD000000000000014LL, 0x800000000003BAE0LL, v88);
  uint64_t v90 = type metadata accessor for TMDCCoreDataLogger();
  uint64_t v91 = swift_allocObject(v90, 40LL, 7LL);
  *(void *)(v91 + 3sub_541C(v0 + 2) = 2LL;
  *(void *)(v91 + 16) = v89;
  *(_BYTE *)(v91 + 24) = v84;
  *(void *)(v57 + 248) = v90;
  *(void *)(v57 + 256) = &off_46F18;
  *(void *)(v57 + 224) = v91;
  uint64_t v127 = type metadata accessor for EnvironmentFeatureFlags(0LL);
  uint64_t v128 = (char **)&protocol witness table for EnvironmentFeatureFlags;
  sub_26194(&v126);
  EnvironmentFeatureFlags.init()();
  sub_211B0(&v126, v57 + 264);
  uint64_t v92 = sub_2116C(v57 + 64, (uint64_t)&v126);
  unint64_t v93 = v111;
  uint64_t v94 = LocalesController.currentLocales.getter(v92);
  CurrentLocales.siri.getter(v94);
  v112(v93, v120);
  LODWORD(v120) = *v113;
  id v95 = [objc_allocWithZone(CNContactStore) init];
  uint64_t v96 = sub_255E8((uint64_t)&v126, v127);
  __chkstk_darwin(v96);
  uint64_t v98 = (uint64_t *)((char *)&v109 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v99 + 16))(v98);
  uint64_t v100 = *v98;
  uint64_t v124 = v72;
  uint64_t v125 = &off_46D80;
  uint64_t v122 = v100;
  uint64_t v101 = type metadata accessor for TTSContactOverrider(0LL);
  unsigned int v102 = (void *)swift_allocObject(v101, *(unsigned int *)(v101 + 48), *(unsigned __int16 *)(v101 + 52));
  uint64_t v103 = sub_255E8((uint64_t)&v122, v72);
  __chkstk_darwin(v103);
  os_log_type_t v105 = (uint64_t *)((char *)&v109 - ((v104 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v106 + 16))(v105);
  uint64_t v107 = *v105;
  v102[6] = v72;
  v102[7] = &off_46D80;
  v102[2] = v95;
  v102[3] = v107;
  ((void (*)(char *, char *, uint64_t))v117)( (char *)v102 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_currentLocale,  v56,  v119);
  *((_BYTE *)v102 + OBJC_IVAR____TtC44SiriPrivateLearningTTSMispronunciationPlugin19TTSContactOverrider_isCurareRun) = v120;
  sub_541C(&v122);
  sub_541C(&v126);
  *(void *)(v57 + 328) = v101;
  *(void *)(v57 + 336) = &off_46560;
  *(void *)(v57 + 304) = v102;
  return v57;
}

uint64_t type metadata accessor for SiriPrivateLearningTTSMispronunciationPlugin()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin44SiriPrivateLearningTTSMispronunciationPlugin);
}

uint64_t SiriPrivateLearningTTSMispronunciationPlugin.run(context:completion:)( uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v7 = type metadata accessor for PrivateLearningPluginResult(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_501C(&qword_4B800);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((sub_24770(a1) & 1) != 0)
  {
    uint64_t v14 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v13, 1LL, 1LL, v14);
    uint64_t v15 = (void *)swift_allocObject(&unk_465B0, 56LL, 7LL);
    v15[2] = 0LL;
    v15[3] = 0LL;
    v15[4] = v3;
    v15[5] = a2;
    v15[6] = a3;
    swift_retain(v3);
    swift_retain(a3);
    uint64_t v16 = sub_229FC((uint64_t)v13, (uint64_t)&unk_4B810, (uint64_t)v15);
    return swift_release(v16);
  }

  else
  {
    (*(void (**)(char *, void, uint64_t))(v8 + 104))( v10,  enum case for PrivateLearningPluginResult.success(_:),  v7);
    a2(v10);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

uint64_t sub_22998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = (void *)swift_task_alloc(dword_4B844);
  *(void *)(v6 + 16) = v9;
  *uint64_t v9 = v6;
  v9[1] = sub_15CAC;
  return sub_22B48(a5, a6);
}

uint64_t sub_229FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) == 1)
  {
    sub_BA5C(a1, &qword_4B800);
    uint64_t v9 = 7168LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      uint64_t v11 = *(void *)(a3 + 24);
      uint64_t ObjectType = swift_getObjectType(v10, v8);
      swift_unknownObjectRetain(v10);
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      uint64_t v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }

  else
  {
    unsigned __int8 v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    uint64_t v9 = v16 | 0x1C00LL;
    uint64_t v10 = *(void *)(a3 + 16);
    if (v10) {
      goto LABEL_3;
    }
  }

  uint64_t v13 = 0LL;
  uint64_t v15 = 0LL;
LABEL_6:
  uint64_t v17 = swift_allocObject(&unk_46600, 32LL, 7LL);
  *(void *)(v17 + 16) = a2;
  *(void *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0LL;
    v20[1] = 0LL;
    uint64_t v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_4B9A0, v17);
}

uint64_t sub_22B48(uint64_t a1, uint64_t a2)
{
  v3[37] = a2;
  v3[38] = v2;
  v3[36] = a1;
  uint64_t v4 = type metadata accessor for PrivateLearningPluginResult(0LL);
  v3[39] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[40] = v5;
  v3[41] = swift_task_alloc((*(void *)(v5 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for UUID(0LL);
  v3[42] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[43] = v7;
  v3[44] = swift_task_alloc((*(void *)(v7 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for TMDCGroundTruth(0LL);
  v3[45] = v8;
  unint64_t v9 = (*(void *)(*(void *)(v8 - 8) + 64LL) + 15LL) & 0xFFFFFFFFFFFFFFF0LL;
  v3[46] = swift_task_alloc(v9);
  v3[47] = swift_task_alloc(v9);
  uint64_t v10 = type metadata accessor for Locale(0LL);
  v3[48] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v3[49] = v11;
  v3[50] = swift_task_alloc((*(void *)(v11 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for CurrentLocales(0LL);
  v3[51] = v12;
  uint64_t v13 = *(void *)(v12 - 8);
  v3[52] = v13;
  v3[53] = swift_task_alloc((*(void *)(v13 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_501C(&qword_4B948);
  v3[54] = v14;
  uint64_t v15 = *(void *)(v14 - 8);
  v3[55] = v15;
  v3[56] = swift_task_alloc((*(void *)(v15 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = type metadata accessor for OSSignpostID(0LL);
  v3[57] = v16;
  uint64_t v17 = *(void *)(v16 - 8);
  v3[58] = v17;
  v3[59] = swift_task_alloc((*(void *)(v17 + 64) + 15LL) & 0xFFFFFFFFFFFFFFF0LL);
  return swift_task_switch(sub_22CAC, 0LL, 0LL);
}

uint64_t sub_22CAC()
{
  if (qword_4A788 != -1) {
    swift_once(&qword_4A788, sub_34A70);
  }
  uint64_t v2 = v0[58];
  uint64_t v1 = v0[59];
  uint64_t v3 = v0[57];
  uint64_t v4 = type metadata accessor for OSSignposter(0LL);
  uint64_t v5 = sub_4F30(v4, (uint64_t)qword_4FCA0);
  v0[60] = v5;
  uint64_t v6 = OSSignposter.logHandle.getter(v5);
  OSSignpostID.init(log:)(v6);
  v0[61] = sub_3450C("pluginRunExecutionTime", 22LL, 2, v1);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[62] = v7;
  v7(v1, v3);
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = sub_4F30(v8, (uint64_t)qword_4FC70);
  v0[63] = v9;
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_0, v10, v11, "SiriPrivateLearningTTSMispronunciationPlugin.run() started", v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  uint64_t v13 = v0[38];

  uint64_t v14 = sub_4FF8((void *)(v13 + 16), *(void *)(v13 + 40));
  uint64_t v15 = *v14;
  sub_4FF8((void *)(*v14 + 16LL), *(void *)(*v14 + 40LL));
  sub_157CC();
  uint64_t v16 = unk_4B954;
  uint64_t v19 = (char *)&dword_4B950 + dword_4B950;
  swift_retain(v15);
  uint64_t v17 = (void *)swift_task_alloc(v16);
  v0[64] = v17;
  *uint64_t v17 = v0;
  v17[1] = sub_22E98;
  return ((uint64_t (*)(void *, void, uint64_t))v19)(_swiftEmptyArrayStorage, v0[56], v15);
}

uint64_t sub_22E98(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *(void *)(*v2 + 512);
  *(void *)(v3 + 520) = a1;
  *(void *)(v3 + 528) = v1;
  swift_task_dealloc(v4);
  if (v1) {
    uint64_t v5 = sub_2430C;
  }
  else {
    uint64_t v5 = sub_22F08;
  }
  return swift_task_switch(v5, 0LL, 0LL);
}

uint64_t sub_22F08()
{
  uint64_t v1 = v0[65];
  (*(void (**)(void, void))(v0[55] + 8LL))(v0[56], v0[54]);
  swift_bridgeObjectRetain(v1);
  uint64_t v3 = (os_log_s *)Logger.logObject.getter(v2);
  os_log_type_t v4 = ((uint64_t (*)(void))static os_log_type_t.debug.getter)();
  uint64_t v159 = v0;
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = v0[65];
    uint64_t v6 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v6 = 134217984;
    v0[35] = *(void *)(v5 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 35, v0 + 36);
    swift_bridgeObjectRelease(v5);
    _os_log_impl(&dword_0, v3, v4, "Fetched %ld conversationData", v6, 0xCu);
    swift_slowDealloc(v6, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(v0[65]);
  }

  uint64_t v7 = v0[65];
  uint64_t v142 = *(void *)(v7 + 16);
  if (v142)
  {
    unint64_t v8 = 0LL;
    uint64_t v148 = (uint64_t)(v0 + 25);
    uint64_t v149 = (uint64_t)(v0 + 28);
    objc_super v145 = v0 + 32;
    objc_super v144 = v0 + 2;
    uint64_t v146 = v0[49];
    uint64_t v147 = v0[52];
    uint64_t v141 = v7 + 32;
    v150 = (_BYTE *)(v0[38] + 352LL);
    uint64_t v139 = (uint64_t)(v0 + 6);
    uint64_t v153 = v0[66];
    uint64_t v9 = _swiftEmptyArrayStorage;
    uint64_t v10 = &dword_0;
    uint64_t v140 = v0[65];
    do
    {
      if (v8 >= *(void *)(v7 + 16))
      {
        __break(1u);
        JUMPOUT(0x242F4LL);
      }

      unint64_t v143 = v8;
      os_log_type_t v11 = (__int128 *)(v141 + 56 * v8);
      __int128 v13 = v11[1];
      __int128 v12 = v11[2];
      __int128 v14 = *v11;
      *((_BYTE *)v144 + 48) = *((_BYTE *)v11 + 48);
      *((_OWORD *)v144 + 1) = v13;
      *((_OWORD *)v144 + sub_541C(v0 + 2) = v12;
      *(_OWORD *)objc_super v144 = v14;
      uint64_t v15 = v0[2];
      v0[32] = v15;
      swift_bridgeObjectRetain_n(v15, 2LL);
      sub_E4C4(v145);
      uint64_t v16 = sub_26254(v144);
      uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
      os_log_type_t v24 = static os_log_type_t.debug.getter(v17, v18, v19, v20, v21, v22, v23);
      if (os_log_type_enabled(v17, v24))
      {
        uint64_t v25 = v10;
        uint64_t v26 = v9;
        uint64_t v27 = swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v27 = 134217984;
        uint64_t v28 = *(void *)(v15 + 16);
        sub_E4EC(v145);
        *(void *)(v27 + 4) = v28;
        sub_E4EC(v145);
        uint64_t v29 = v25;
        _os_log_impl(v25, v17, v24, "Current ConversationData consists of %ld asrContactTokens", (uint8_t *)v27, 0xCu);
        uint64_t v30 = v27;
        uint64_t v9 = v26;
        swift_slowDealloc(v30, -1LL, -1LL);
      }

      else
      {
        uint64_t v29 = v10;
        sub_E4EC(v145);
        sub_E4EC(v145);
      }

      uint64_t v156 = *(void *)(v15 + 16);
      if (v156)
      {
        sub_262A8(v139, v149);
        uint64_t v31 = 0LL;
        uint64_t v155 = v15 + 32;
        uint64_t v10 = v29;
        do
        {
          uint64_t v160 = v31;
          uint64_t v33 = v155 + 48 * v31;
          uint64_t v34 = *(void *)v33;
          unint64_t v35 = *(void *)(v33 + 8);
          int v36 = *(unsigned __int8 *)(v33 + 16);
          uint64_t v38 = *(void **)(v33 + 24);
          uint64_t v37 = *(void *)(v33 + 32);
          int v39 = *(unsigned __int8 *)(v33 + 40);
          v0[9] = *(void *)v33;
          v0[10] = v35;
          int v157 = v36;
          *((_BYTE *)v0 + 88) = v36;
          v0[12] = v38;
          v0[13] = v37;
          uint64_t v158 = v37;
          *((_BYTE *)v0 + 11sub_541C(v0 + 2) = v39;
          swift_bridgeObjectRetain_n(v35, 3LL);
          id v40 = v38;
          uint64_t v41 = (os_log_s *)Logger.logObject.getter(v40);
          os_log_type_t v48 = static os_log_type_t.debug.getter(v41, v42, v43, v44, v45, v46, v47);
          if (os_log_type_enabled(v41, v48))
          {
            uint64_t v49 = v34;
            uint64_t v50 = v40;
            unint64_t v51 = v35;
            uint64_t v52 = swift_slowAlloc(12LL, -1LL);
            uint64_t v53 = swift_slowAlloc(32LL, -1LL);
            uint64_t v161 = v53;
            *(_DWORD *)uint64_t v52 = 136315138;
            swift_bridgeObjectRetain(v51);
            *(void *)(v52 + 4) = sub_25824(v49, v51, &v161);
            swift_bridgeObjectRelease_n(v51, 3LL);

            _os_log_impl(v10, v41, v48, "ASR token name: %s", (uint8_t *)v52, 0xCu);
            swift_arrayDestroy(v53, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v53, -1LL, -1LL);
            uint64_t v54 = v52;
            unint64_t v35 = v51;
            id v40 = v50;
            uint64_t v0 = v159;
            swift_slowDealloc(v54, -1LL, -1LL);
          }

          else
          {
            swift_bridgeObjectRelease_n(v35, 2LL);
          }

          uint64_t v56 = (os_log_s *)Logger.logObject.getter(v55);
          os_log_type_t v63 = static os_log_type_t.debug.getter(v56, v57, v58, v59, v60, v61, v62);
          if (os_log_type_enabled(v56, v63))
          {
            uint64_t v64 = swift_slowAlloc(12LL, -1LL);
            *(_DWORD *)uint64_t v64 = 134217984;
            *(double *)(v64 + 4) = (double)v158;
            _os_log_impl(v10, v56, v63, "ASR token confidence: %f", (uint8_t *)v64, 0xCu);
            swift_slowDealloc(v64, -1LL, -1LL);
          }

          if (v39)
          {
            uint64_t v66 = (os_log_s *)Logger.logObject.getter(v65);
            os_log_type_t v73 = static os_log_type_t.debug.getter(v66, v67, v68, v69, v70, v71, v72);
            if (os_log_type_enabled(v66, v73))
            {
              uint64_t v74 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
              *(_WORD *)uint64_t v74 = 0;
              _os_log_impl(v10, v66, v73, "ASR token confidence meets the asrConfidenceThreshold", v74, 2u);
              swift_slowDealloc(v74, -1LL, -1LL);
            }

            v154 = v40;
            if (*v150 == 1)
            {
              id v75 = v10;
              unint64_t v76 = sub_26348();
              uint64_t v77 = swift_allocError(&type metadata for TTSPhonemesGeneratingError, v76, 0LL, 0LL);
              *(void *)uint64_t v78 = 0xD000000000000020LL;
              *(void *)(v78 + 8) = 0x800000000003BD00LL;
              *(_BYTE *)(v78 + 16) = 0;
              swift_willThrow(v77);
            }

            else
            {
              v151 = v9;
              uint64_t v79 = v0[53];
              uint64_t v80 = (void (*)(char *, uint64_t))v0[50];
              uint64_t v81 = v0[51];
              sub_262A8(v149, v148);
              uint64_t v82 = (void *)v159[26];
              if (v82) {
                uint64_t v83 = v159[25];
              }
              else {
                uint64_t v83 = 0LL;
              }
              swift_bridgeObjectRetain(v35);
              id v152 = v40;
              uint64_t v84 = LocalesController.currentLocales.getter(v152);
              CurrentLocales.siriVoice.getter(v84);
              (*(void (**)(uint64_t, uint64_t))(v147 + 8))(v79, v81);
              uint64_t v85 = sub_2A9AC(v83, v82, v157, v80);
              uint64_t v77 = v153;
              (*(void (**)(void, void))(v146 + 8))(v159[50], v159[48]);
              if (!v153) {
                __asm { BR              X9 }
              }

              swift_bridgeObjectRelease(v35);
              uint64_t v9 = v151;
              id v75 = &dword_0;
              uint64_t v0 = v159;
            }

            uint64_t v32 = v160;
            swift_errorRetain(v77);
            uint64_t v86 = swift_errorRetain(v77);
            uint64_t v87 = (os_log_s *)Logger.logObject.getter(v86);
            os_log_type_t v94 = static os_log_type_t.error.getter(v87, v88, v89, v90, v91, v92, v93);
            if (os_log_type_enabled(v87, v94))
            {
              uint64_t v95 = swift_slowAlloc(12LL, -1LL);
              uint64_t v96 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
              *(_DWORD *)uint64_t v95 = 138412290;
              swift_errorRetain(v77);
              uint64_t v97 = _swift_stdlib_bridgeErrorToNSError(v77);
              *(void *)(v95 + 4) = v97;
              uint64_t *v96 = v97;
              swift_errorRelease(v77);
              swift_errorRelease(v77);
              _os_log_impl(v75, v87, v94, "%@", (uint8_t *)v95, 0xCu);
              uint64_t v98 = sub_501C(&qword_4A8A8);
              swift_arrayDestroy(v96, 1LL, v98);
              swift_slowDealloc(v96, -1LL, -1LL);
              swift_slowDealloc(v95, -1LL, -1LL);
            }

            else
            {
              swift_errorRelease(v77);
              swift_errorRelease(v77);
            }

            if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0) {
              uint64_t v9 = sub_14578(0LL, v9[2] + 1LL, 1, v9);
            }
            uint64_t v10 = v75;
            unint64_t v100 = v9[2];
            unint64_t v99 = v9[3];
            if (v100 >= v99 >> 1) {
              uint64_t v9 = sub_14578((void *)(v99 > 1), v100 + 1, 1, v9);
            }
            v9[2] = v100 + 1;
            v9[v100 + 4] = v77;
            swift_bridgeObjectRelease(v35);

            uint64_t v153 = 0LL;
          }

          else
          {
            swift_bridgeObjectRelease(v35);

            uint64_t v32 = v160;
          }

          uint64_t v31 = v32 + 1;
        }

        while (v31 != v156);
      }

      else
      {
        uint64_t v10 = v29;
      }

      unint64_t v8 = v143 + 1;
      sub_E4EC(v145);
      sub_262F0(v144);
      uint64_t v7 = v140;
    }

    while (v143 + 1 != v142);
    swift_bridgeObjectRelease(v0[65]);
    if (v9[2]) {
      goto LABEL_41;
    }
LABEL_43:
    uint64_t v121 = v0[59];
    uint64_t v122 = v9;
    uint64_t v124 = v0[40];
    uint64_t v123 = v0[41];
    uint64_t v125 = v0[39];
    __int128 v126 = (void (*)(uint64_t))v0[36];
    swift_bridgeObjectRelease(v122);
    (*(void (**)(uint64_t, void, uint64_t))(v124 + 104))( v123,  enum case for PrivateLearningPluginResult.success(_:),  v125);
    v126(v123);
    uint64_t v127 = (*(uint64_t (**)(uint64_t, uint64_t))(v124 + 8))(v123, v125);
    uint64_t v128 = OSSignposter.logHandle.getter(v127);
    OSSignpostID.init(log:)(v128);
    sub_3476C("pluginRunSuccess", 16LL, 2, v121);
    goto LABEL_44;
  }

  uint64_t v9 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease(v7);
  if (!_swiftEmptyArrayStorage[2]) {
    goto LABEL_43;
  }
LABEL_41:
  uint64_t v161 = 0LL;
  unint64_t v162 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(51LL);
  v101._countAndFlagsBits = 0xD000000000000031LL;
  v101._object = (void *)0x800000000003BCC0LL;
  String.append(_:)(v101);
  uint64_t v102 = sub_501C(&qword_4B2C0);
  v103._countAndFlagsBits = Array.description.getter(v9, v102);
  object = v103._object;
  String.append(_:)(v103);
  swift_bridgeObjectRelease(object);
  swift_bridgeObjectRelease(v9);
  uint64_t v105 = v161;
  unint64_t v106 = v162;
  uint64_t v107 = type metadata accessor for PrivateLearningPluginError(0LL);
  uint64_t v108 = sub_1DC28( &qword_4B958,  (uint64_t (*)(uint64_t))&type metadata accessor for PrivateLearningPluginError,  (uint64_t)&protocol conformance descriptor for PrivateLearningPluginError);
  uint64_t v109 = swift_allocError(v107, v108, 0LL, 0LL);
  uint64_t v110 = PrivateLearningPluginError.init(message:)(v105, v106);
  swift_willThrow(v110);
  uint64_t v111 = v0[59];
  uint64_t v113 = v0[40];
  uint64_t v112 = v0[41];
  uint64_t v114 = v0[39];
  unint64_t v115 = (void (*)(uint64_t))v0[36];
  v0[31] = v109;
  swift_errorRetain(v109);
  uint64_t v116 = sub_501C(&qword_4B2C0);
  uint64_t v117 = String.init<A>(describing:)(v0 + 31, v116);
  PrivateLearningPluginError.init(message:)(v117, v118);
  (*(void (**)(uint64_t, void, uint64_t))(v113 + 104))( v112,  enum case for PrivateLearningPluginResult.failure(_:),  v114);
  v115(v112);
  uint64_t v119 = (*(uint64_t (**)(uint64_t, uint64_t))(v113 + 8))(v112, v114);
  uint64_t v120 = OSSignposter.logHandle.getter(v119);
  OSSignpostID.init(log:)(v120);
  sub_3476C("pluginRunFailure", 16LL, 2, v111);
  swift_errorRelease(v109);
LABEL_44:
  uint64_t v129 = v0[61];
  uint64_t v130 = v0[59];
  uint64_t v131 = v0[56];
  uint64_t v132 = v0[53];
  uint64_t v133 = v0[50];
  uint64_t v135 = v0[46];
  uint64_t v134 = v0[47];
  uint64_t v136 = v0[44];
  uint64_t v137 = v0[41];
  ((void (*)(uint64_t, void))v0[62])(v130, v0[57]);
  sub_24484(v129);
  swift_release(v129);
  swift_task_dealloc(v130);
  swift_task_dealloc(v131);
  swift_task_dealloc(v132);
  swift_task_dealloc(v133);
  swift_task_dealloc(v134);
  swift_task_dealloc(v135);
  swift_task_dealloc(v136);
  swift_task_dealloc(v137);
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_2430C()
{
  uint64_t v1 = *(void *)(v0 + 528);
  uint64_t v2 = *(void *)(v0 + 472);
  uint64_t v4 = *(void *)(v0 + 320);
  uint64_t v3 = *(void *)(v0 + 328);
  uint64_t v5 = *(void *)(v0 + 312);
  uint64_t v6 = *(void (**)(uint64_t))(v0 + 288);
  *(void *)(v0 + 248) = v1;
  swift_errorRetain(v1);
  uint64_t v7 = sub_501C(&qword_4B2C0);
  uint64_t v8 = String.init<A>(describing:)(v0 + 248, v7);
  PrivateLearningPluginError.init(message:)(v8, v9);
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))( v3,  enum case for PrivateLearningPluginResult.failure(_:),  v5);
  v6(v3);
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v11 = OSSignposter.logHandle.getter(v10);
  OSSignpostID.init(log:)(v11);
  sub_3476C("pluginRunFailure", 16LL, 2, v2);
  swift_errorRelease(v1);
  uint64_t v12 = *(void *)(v0 + 488);
  uint64_t v13 = *(void *)(v0 + 472);
  uint64_t v14 = *(void *)(v0 + 448);
  uint64_t v15 = *(void *)(v0 + 424);
  uint64_t v16 = *(void *)(v0 + 400);
  uint64_t v18 = *(void *)(v0 + 368);
  uint64_t v17 = *(void *)(v0 + 376);
  uint64_t v19 = *(void *)(v0 + 352);
  uint64_t v20 = *(void *)(v0 + 328);
  (*(void (**)(uint64_t, void))(v0 + 496))(v13, *(void *)(v0 + 456));
  sub_24484(v12);
  swift_release(v12);
  swift_task_dealloc(v13);
  swift_task_dealloc(v14);
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24484(uint64_t a1)
{
  uint64_t v29 = type metadata accessor for OSSignpostError(0LL);
  uint64_t v2 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v28 - v10;
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v13 = sub_4F30(v12, (uint64_t)qword_4FC70);
  uint64_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_0, v14, v15, "SiriPrivateLearningTTSMispronunciationPlugin.run() ended", v16, 2u);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  if (qword_4A788 != -1) {
    swift_once(&qword_4A788, sub_34A70);
  }
  uint64_t v17 = type metadata accessor for OSSignposter(0LL);
  sub_4F30(v17, (uint64_t)qword_4FCA0);
  uint64_t v18 = (os_log_s *)OSSignposter.logHandle.getter();
  uint64_t v19 = OSSignpostIntervalState.signpostID.getter();
  os_signpost_type_t v20 = static os_signpost_type_t.end.getter(v19);
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    uint64_t v21 = swift_retain(a1);
    checkForErrorAndConsumeState(state:)(v21);
    swift_release(a1);
    uint64_t v22 = v29;
    if ((*(unsigned int (**)(char *, uint64_t))(v2 + 88))(v4, v29) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v23 = "[Error] Interval already ended";
    }

    else
    {
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v22);
      uint64_t v23 = "";
    }

    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    uint64_t v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v25 = 0;
    os_signpost_id_t v26 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl(&dword_0, v18, v20, v26, "pluginRunExecutionTime", v23, v25, 2u);
    swift_slowDealloc(v25, -1LL, -1LL);

    uint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
    v27(v11, v5);
    return ((uint64_t (*)(char *, uint64_t))v27)(v9, v5);
  }

  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }

uint64_t sub_24770(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Locale(0LL);
  uint64_t v90 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v91 = &v85[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v92 = type metadata accessor for CurrentLocales(0LL);
  uint64_t v89 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v7 = &v85[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = type metadata accessor for PrivateLearningPluginRunContext(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = &v85[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = __chkstk_darwin(v10);
  os_log_type_t v15 = &v85[-v14];
  if ((dispatch thunk of LocalesController.isSiriCurrentLocaleSupported()(v13) & 1) == 0)
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v26 = type metadata accessor for Logger(0LL);
    sub_4F30(v26, (uint64_t)qword_4FC70);
    uint64_t v27 = swift_retain_n(v1, 2LL);
    uint64_t v28 = (os_log_s *)Logger.logObject.getter(v27);
    os_log_type_t v29 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = swift_slowAlloc(22LL, -1LL);
      uint64_t v31 = swift_slowAlloc(64LL, -1LL);
      uint64_t v94 = v31;
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v93 = sub_25824(0xD00000000000003DLL, 0x800000000003BD50LL, &v94);
      uint64_t v32 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
      *(_WORD *)(v30 + 1sub_541C(v0 + 2) = 2080;
      uint64_t v88 = (uint64_t)v1;
      uint64_t v33 = LocalesController.currentLocales.getter(v32);
      uint64_t v34 = v91;
      CurrentLocales.siri.getter(v33);
      (*(void (**)(_BYTE *, uint64_t))(v89 + 8))(v7, v92);
      uint64_t v35 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      unint64_t v37 = v36;
      (*(void (**)(_BYTE *, uint64_t))(v90 + 8))(v34, v4);
      uint64_t v93 = sub_25824(v35, v37, &v94);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
      swift_release_n(v88, 2LL);
      swift_bridgeObjectRelease(v37);
      _os_log_impl(&dword_0, v28, v29, "%s: siri locale %s isn't supported", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy(v31, 2LL, (char *)&type metadata for Any + 8);
      uint64_t v38 = v31;
LABEL_19:
      swift_slowDealloc(v38, -1LL, -1LL);
      swift_slowDealloc(v30, -1LL, -1LL);

      return 0LL;
    }

LABEL_20:
    uint64_t v49 = v1;
    uint64_t v50 = 2LL;
LABEL_21:
    swift_release_n(v49, v50);
    return 0LL;
  }

  if ((dispatch thunk of LocalesController.isSiriVoiceCurrentLocaleSupported()() & 1) == 0)
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v39 = type metadata accessor for Logger(0LL);
    sub_4F30(v39, (uint64_t)qword_4FC70);
    uint64_t v40 = swift_retain_n(v1, 2LL);
    uint64_t v28 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v41 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v28, v41))
    {
      uint64_t v30 = swift_slowAlloc(22LL, -1LL);
      uint64_t v88 = swift_slowAlloc(64LL, -1LL);
      uint64_t v94 = v88;
      *(_DWORD *)uint64_t v30 = 136315394;
      uint64_t v93 = sub_25824(0xD00000000000003DLL, 0x800000000003BD50LL, &v94);
      uint64_t v42 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
      *(_WORD *)(v30 + 1sub_541C(v0 + 2) = 2080;
      os_log_t v87 = (os_log_t)(v30 + 14);
      uint64_t v43 = LocalesController.currentLocales.getter(v42);
      uint64_t v44 = v91;
      CurrentLocales.siriVoice.getter(v43);
      (*(void (**)(_BYTE *, uint64_t))(v89 + 8))(v7, v92);
      uint64_t v45 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      unint64_t v47 = v46;
      (*(void (**)(_BYTE *, uint64_t))(v90 + 8))(v44, v4);
      uint64_t v93 = sub_25824(v45, v47, &v94);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
      swift_release_n(v2, 2LL);
      swift_bridgeObjectRelease(v47);
      _os_log_impl(&dword_0, v28, v41, "%s: siri voice locale %s isn't supported", (uint8_t *)v30, 0x16u);
      uint64_t v48 = v88;
      swift_arrayDestroy(v88, 2LL, (char *)&type metadata for Any + 8);
      uint64_t v38 = v48;
      goto LABEL_19;
    }

    goto LABEL_20;
  }

  if ((sub_34C30() & 1) == 0)
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v51 = type metadata accessor for Logger(0LL);
    sub_4F30(v51, (uint64_t)qword_4FC70);
    uint64_t v52 = swift_retain_n(v1, 4LL);
    uint64_t v53 = (os_log_s *)Logger.logObject.getter(v52);
    os_log_type_t v54 = static os_log_type_t.info.getter();
    int v55 = v54;
    if (os_log_type_enabled(v53, v54))
    {
      uint64_t v56 = swift_slowAlloc(32LL, -1LL);
      uint64_t v88 = swift_slowAlloc(96LL, -1LL);
      uint64_t v94 = v88;
      *(_DWORD *)uint64_t v56 = 136315650;
      os_log_t v87 = v53;
      uint64_t v93 = sub_25824(0xD00000000000003DLL, 0x800000000003BD50LL, &v94);
      uint64_t v57 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
      *(_WORD *)(v56 + 1sub_541C(v0 + 2) = 2080;
      uint64_t v58 = LocalesController.currentLocales.getter(v57);
      int v86 = v55;
      uint64_t v59 = v91;
      CurrentLocales.siri.getter(v58);
      uint64_t v89 = *(void *)(v89 + 8);
      ((void (*)(_BYTE *, uint64_t))v89)(v7, v92);
      uint64_t v60 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      unint64_t v62 = v61;
      uint64_t v90 = *(void *)(v90 + 8);
      ((void (*)(_BYTE *, uint64_t))v90)(v59, v4);
      uint64_t v93 = sub_25824(v60, v62, &v94);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
      swift_release_n(v2, 2LL);
      uint64_t v63 = swift_bridgeObjectRelease(v62);
      *(_WORD *)(v56 + 2sub_541C(v0 + 2) = 2080;
      uint64_t v64 = LocalesController.currentLocales.getter(v63);
      CurrentLocales.siriVoice.getter(v64);
      ((void (*)(_BYTE *, uint64_t))v89)(v7, v92);
      uint64_t v65 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
      unint64_t v67 = v66;
      ((void (*)(_BYTE *, uint64_t))v90)(v59, v4);
      uint64_t v93 = sub_25824(v65, v67, &v94);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
      swift_release_n(v2, 2LL);
      swift_bridgeObjectRelease(v67);
      uint64_t v68 = v87;
      _os_log_impl( &dword_0,  v87,  (os_log_type_t)v86,  "%s: siri locale / siri voice locale pair %s / %s isn't supported",  (uint8_t *)v56,  0x20u);
      uint64_t v69 = v88;
      swift_arrayDestroy(v88, 3LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v69, -1LL, -1LL);
      uint64_t v70 = v56;
      goto LABEL_35;
    }

    uint64_t v49 = v2;
    uint64_t v50 = 4LL;
    goto LABEL_21;
  }

  uint64_t v17 = v1[16];
  uint64_t v16 = v1[17];
  sub_4FF8(v1 + 13, v17);
  if ((dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.isTmdcRuntimeEnabled()(v17, v16) & 1) == 0)
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v71 = type metadata accessor for Logger(0LL);
    uint64_t v72 = sub_4F30(v71, (uint64_t)qword_4FC70);
    uint64_t v68 = (os_log_s *)Logger.logObject.getter(v72);
    os_log_type_t v73 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v68, v73)) {
      goto LABEL_36;
    }
    uint64_t v74 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v75 = swift_slowAlloc(32LL, -1LL);
    uint64_t v94 = v75;
    *(_DWORD *)uint64_t v74 = 136315138;
    uint64_t v93 = sub_25824(0xD00000000000003DLL, 0x800000000003BD50LL, &v94);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
    _os_log_impl(&dword_0, v68, v73, "%s: TMDCRuntime trial flag are both disabled", v74, 0xCu);
    swift_arrayDestroy(v75, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v75, -1LL, -1LL);
    uint64_t v70 = (uint64_t)v74;
    goto LABEL_35;
  }

  (*(void (**)(_BYTE *, void, uint64_t))(v9 + 104))( v15,  enum case for PrivateLearningPluginRunContext.maintenance(_:),  v8);
  char v18 = static PrivateLearningPluginRunContext.== infix(_:_:)(a1, v15);
  uint64_t v19 = *(void (**)(_BYTE *, uint64_t))(v9 + 8);
  v19(v15, v8);
  if ((v18 & 1) == 0)
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v76 = type metadata accessor for Logger(0LL);
    sub_4F30(v76, (uint64_t)qword_4FC70);
    uint64_t v77 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
    uint64_t v68 = (os_log_s *)Logger.logObject.getter(v77);
    os_log_type_t v78 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v68, v78))
    {
      v19(v12, v8);
      goto LABEL_36;
    }

    uint64_t v79 = swift_slowAlloc(22LL, -1LL);
    uint64_t v80 = swift_slowAlloc(64LL, -1LL);
    uint64_t v94 = v80;
    *(_DWORD *)uint64_t v79 = 136315394;
    uint64_t v93 = sub_25824(0xD00000000000003DLL, 0x800000000003BD50LL, &v94);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
    *(_WORD *)(v79 + 1sub_541C(v0 + 2) = 2080;
    uint64_t v81 = sub_1DC28( &qword_4B9A8,  (uint64_t (*)(uint64_t))&type metadata accessor for PrivateLearningPluginRunContext,  (uint64_t)&protocol conformance descriptor for PrivateLearningPluginRunContext);
    uint64_t v82 = dispatch thunk of CustomStringConvertible.description.getter(v8, v81);
    unint64_t v84 = v83;
    uint64_t v93 = sub_25824(v82, v83, &v94);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, &v94);
    swift_bridgeObjectRelease(v84);
    v19(v12, v8);
    _os_log_impl(&dword_0, v68, v78, "%s: context is %s", (uint8_t *)v79, 0x16u);
    swift_arrayDestroy(v80, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v80, -1LL, -1LL);
    uint64_t v70 = v79;
LABEL_35:
    swift_slowDealloc(v70, -1LL, -1LL);
LABEL_36:

    return 0LL;
  }

  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v20 = type metadata accessor for Logger(0LL);
  uint64_t v21 = sub_4F30(v20, (uint64_t)qword_4FC70);
  uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v23 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v22, v23))
  {
    os_log_type_t v24 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_log_type_t v24 = 0;
    _os_log_impl(&dword_0, v22, v23, "SiriPrivateLearningTTSMispronunciationPlugin is enabled", v24, 2u);
    swift_slowDealloc(v24, -1LL, -1LL);
  }

  return 1LL;
}

uint64_t sub_252FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(void *)(v0 + 136);
  sub_4FF8((void *)(v0 + 104), v2);
  if ((dispatch thunk of TrialSiriUnderstandingTMDCStatusResolving.isTmdcRuntimeLocalStorageEnabled()(v2, v3) & 1) != 0
    || *(_BYTE *)(v0 + 352) == 1)
  {
    uint64_t v4 = sub_501C(&qword_4B940);
    uint64_t v5 = swift_allocObject(v4, 112LL, 7LL);
    *(_OWORD *)(v5 + 16) = xmmword_38B60;
    sub_2116C(v1 + 184, v5 + 32);
    uint64_t v6 = v5 + 72;
    uint64_t v7 = v1 + 224;
  }

  else
  {
    uint64_t v8 = sub_501C(&qword_4B940);
    uint64_t v5 = swift_allocObject(v8, 72LL, 7LL);
    *(_OWORD *)(v5 + 16) = xmmword_38B10;
    uint64_t v6 = v5 + 32;
    uint64_t v7 = v1 + 184;
  }

  sub_2116C(v7, v6);
  return v5;
}

void *SiriPrivateLearningTTSMispronunciationPlugin.deinit()
{
  return v0;
}

uint64_t SiriPrivateLearningTTSMispronunciationPlugin.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 353LL, 7LL);
}

uint64_t sub_2544C()
{
  uint64_t v0 = type metadata accessor for SiriPrivateLearningTTSMispronunciationPlugin();
  uint64_t v1 = swift_allocObject(v0, 353LL, 7LL);
  SiriPrivateLearningTTSMispronunciationPlugin.init()();
  return v1;
}

uint64_t sub_25480(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v7 = type metadata accessor for PrivateLearningPluginResult(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_501C(&qword_4B800);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if ((sub_24770(a1) & 1) != 0)
  {
    uint64_t v14 = type metadata accessor for TaskPriority(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v13, 1LL, 1LL, v14);
    os_log_type_t v15 = (void *)swift_allocObject(&unk_465D8, 56LL, 7LL);
    v15[2] = 0LL;
    v15[3] = 0LL;
    v15[4] = v3;
    v15[5] = a2;
    v15[6] = a3;
    swift_retain(v3);
    swift_retain(a3);
    uint64_t v16 = sub_229FC((uint64_t)v13, (uint64_t)&unk_4B990, (uint64_t)v15);
    return swift_release(v16);
  }

  else
  {
    (*(void (**)(char *, void, uint64_t))(v8 + 104))( v10,  enum case for PrivateLearningPluginResult.success(_:),  v7);
    a2(v10);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

uint64_t sub_255E8(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t sub_25610(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_25620(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_25654@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result) {
    *a2 = result;
  }
  else {
    __break(1u);
  }
  return result;
}

void sub_25664( uint8_t *a1, uint32_t a2, os_log_s *a3, os_signpost_type_t a4, uint64_t a5, const char *a6, const char *a7)
{
  os_signpost_id_t v13 = OSSignpostID.rawValue.getter();
  _os_signpost_emit_with_name_impl(&dword_0, a3, a4, v13, a6, a7, a1, a2);
}

uint64_t sub_256E4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc(a2[1]);
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_25748;
  return v6(a1);
}

uint64_t sub_25748()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_25794(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_257B4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  unint64_t v8 = v7;
  uint64_t v9 = sub_25824(v6, v7, a3);
  uint64_t v10 = *a1 + 8;
  uint64_t v12 = v9;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13);
  uint64_t result = swift_bridgeObjectRelease(v8);
  *a1 = v10;
  return result;
}

uint64_t sub_25824(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_258F4(v13, 0LL, 0LL, 1, a1, a2);
  uint64_t v8 = v13[0];
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_155EC((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    uint64_t v11 = *a3;
    if (*a3)
    {
      sub_155EC((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_541C(v13);
  return v8;
}

uint64_t sub_258F4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
  }
}

        uint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    uint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1LL << v3) - 1;
  }

  else
  {
    uint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1LL << result) - 1;
  }

  *uint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  os_log_type_t v23 = __OFSUB__(v22, 1LL);
  os_log_type_t v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

uint64_t sub_25AAC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_25B40(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0) {
    uint64_t v2 = sub_25D90(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_25D90(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_25B40(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_25CB4(v4, 0LL);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }

  return result;
}

void *sub_25CB4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v4 = sub_501C(&qword_4B9B0);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  _OWORD v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_25D18(unint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_25D90(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_501C(&qword_4B9B0);
    unint64_t v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + sub_541C(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    unint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8]) {
      memmove(v13, v14, v8);
    }
    *((void *)a4 + sub_541C(v0 + 2) = 0LL;
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

  __break(1u);
  return result;
}

  __break(1u);
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

_BYTE **sub_25EDC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4 = *result;
  *uint64_t v4 = a4;
  void *result = v4 + 1;
  return result;
}

void sub_25EEC(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
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

uint64_t sub_25F9C(uint64_t *a1, uint64_t a2, uint64_t a3, double (*a4)(void))
{
  double v5 = a4();
  uint64_t v6 = *a1 + 8;
  double v8 = v5;
  uint64_t result = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v8, &v9);
  *a1 = v6;
  return result;
}

void *sub_25FEC(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5)
{
  uint64_t v31 = type metadata accessor for TrialSiriUnderstandingTMDCStatusResolver(0LL);
  uint64_t v32 = &protocol witness table for TrialSiriUnderstandingTMDCStatusResolver;
  *(void *)&__int128 v30 = a5;
  uint64_t v10 = type metadata accessor for SiriConversationReader();
  v29[3] = v10;
  v29[4] = &off_45EE8;
  v29[0] = a1;
  uint64_t v11 = type metadata accessor for ConversationDataProcessor();
  uint64_t v27 = v11;
  uint64_t v28 = &off_46F50;
  v26[0] = a2;
  uint64_t v12 = type metadata accessor for ConversationDataController();
  uint64_t v13 = (void *)swift_allocObject(v12, 192LL, 7LL);
  uint64_t v14 = sub_255E8((uint64_t)v29, v10);
  __chkstk_darwin(v14);
  unint64_t v16 = (void *)((char *)&v26[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v17 + 16))(v16);
  uint64_t v18 = sub_255E8((uint64_t)v26, v27);
  __chkstk_darwin(v18);
  uint64_t v20 = (void *)((char *)&v26[-1] - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  uint64_t v22 = *v16;
  uint64_t v23 = *v20;
  v13[5] = v10;
  v13[6] = &off_45EE8;
  void v13[2] = v22;
  v13[10] = v11;
  v13[11] = &off_46F50;
  v13[7] = v23;
  v13[23] = 0x405E000000000000LL;
  v13[12] = a3;
  sub_211B0(a4, (uint64_t)(v13 + 13));
  sub_211B0(&v30, (uint64_t)(v13 + 18));
  sub_541C(v26);
  sub_541C(v29);
  return v13;
}

void *sub_26194(void *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8LL) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (void *)v2;
  }

  return v1;
}

uint64_t sub_261D4()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = (void *)swift_task_alloc(dword_4B80C);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_15CAC;
  double v5 = (void *)swift_task_alloc(dword_4B844);
  v4[2] = v5;
  *double v5 = v4;
  v5[1] = sub_15CAC;
  return sub_22B48(v2, v3);
}

uint64_t *sub_26254(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[1];
  uint64_t v4 = (void *)a1[2];
  double v5 = (void *)a1[3];
  swift_bridgeObjectRetain(a1[5]);
  swift_bridgeObjectRetain(v2);
  id v6 = v3;
  id v7 = v4;
  id v8 = v5;
  return a1;
}

uint64_t sub_262A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_501C(&qword_4B6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void *sub_262F0(void *a1)
{
  uint64_t v2 = (void *)a1[1];
  uint64_t v3 = (void *)a1[2];
  uint64_t v4 = (void *)a1[3];
  uint64_t v5 = a1[5];
  swift_bridgeObjectRelease(*a1);

  swift_bridgeObjectRelease(v5);
  return a1;
}

unint64_t sub_26348()
{
  unint64_t result = qword_4B960;
  if (!qword_4B960)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A134, &type metadata for TTSPhonemesGeneratingError);
    atomic_store(result, (unint64_t *)&qword_4B960);
  }

  return result;
}

id sub_2638C(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRetain(a2);
    return a3;
  }

  return result;
}

void sub_263BC(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    swift_bridgeObjectRelease(a2);
  }

uint64_t sub_263EC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_101A8(a2);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_26430()
{
  return swift_deallocObject(v0, 56LL, 7LL);
}

uint64_t sub_26464()
{
  uint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = (void *)swift_task_alloc(dword_4B80C);
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_15C18;
  uint64_t v5 = (void *)swift_task_alloc(dword_4B844);
  v4[2] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_15CAC;
  return sub_22B48(v2, v3);
}

uint64_t sub_264E4()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_26508(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_4B99C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_15C18;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_4B998 + dword_4B998))(a1, v4);
}

uint64_t sub_26578(uint64_t a1)
{
  return sub_265B0( a1,  (uint64_t (*)(void))&type metadata accessor for JSONDecoder,  (uint64_t (*)(void))&JSONDecoder.init(),  &qword_4B9D8);
}

uint64_t sub_26594(uint64_t a1)
{
  return sub_265B0( a1,  (uint64_t (*)(void))&type metadata accessor for JSONEncoder,  (uint64_t (*)(void))&JSONEncoder.init(),  &qword_4B9E0);
}

uint64_t sub_265B0(uint64_t a1, uint64_t (*a2)(void), uint64_t (*a3)(void), uint64_t *a4)
{
  uint64_t v6 = a2(0LL);
  swift_allocObject(v6, *(unsigned int *)(v6 + 48), *(unsigned __int16 *)(v6 + 52));
  uint64_t result = a3();
  *a4 = result;
  return result;
}

uint64_t type metadata accessor for PhonemeDataParser()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin17PhonemeDataParser);
}

uint64_t sub_26618(void *a1)
{
  uint64_t v2 = type metadata accessor for String.Encoding(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v73 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = sub_4F30(v6, (uint64_t)qword_4FC70);
  id v8 = a1;
  uint64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v75 = (uint8_t *)v2;
    uint64_t v76 = v7;
    uint64_t v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v12 = swift_slowAlloc(32LL, -1LL);
    uint64_t v79 = v12;
    *(_DWORD *)uint64_t v11 = 136315138;
    id v13 = [v8 phonemeData];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v13);
      uint64_t v17 = v16;
    }

    else
    {
      uint64_t v15 = 0LL;
      uint64_t v17 = 0LL;
    }

    uint64_t v77 = v15;
    v78[0] = v17;
    uint64_t v18 = sub_501C(&qword_4BC80);
    uint64_t v19 = String.init<A>(describing:)(&v77, v18);
    unint64_t v21 = v20;
    uint64_t v77 = sub_25824(v19, v20, &v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, v78);

    swift_bridgeObjectRelease(v21);
    _os_log_impl(&dword_0, v9, v10, "Begin parsing phonemeData: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);

    uint64_t v2 = (uint64_t)v75;
  }

  else
  {
  }

  id v22 = [v8 phonemeData];
  if (!v22) {
    goto LABEL_11;
  }
  uint64_t v23 = v22;
  uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
  uint64_t v26 = v25;

  static String.Encoding.utf8.getter();
  uint64_t v27 = String.data(using:allowLossyConversion:)(v5, 0LL, v24, v26);
  unint64_t v29 = v28;
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v29 >> 60 == 15)
  {
LABEL_11:
    id v30 = v8;
    uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v34 = swift_slowAlloc(32LL, -1LL);
      uint64_t v77 = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      id v35 = [v30 identifier];
      uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
      unint64_t v38 = v37;

      uint64_t v79 = sub_25824(v36, v38, &v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80);

      swift_bridgeObjectRelease(v38);
      _os_log_impl(&dword_0, v31, v32, "phonemeData string is empty for contact: %s", v33, 0xCu);
      swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1LL, -1LL);
      swift_slowDealloc(v33, -1LL, -1LL);

      return 0LL;
    }

    goto LABEL_24;
  }

  if (qword_4A750 != -1) {
    swift_once(&qword_4A750, sub_26578);
  }
  unint64_t v39 = sub_26F70();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)( &v77,  &type metadata for PhonemeData,  v27,  v29,  &type metadata for PhonemeData,  v39);
  uint64_t v40 = v77;
  int v41 = v78[0];
  id v42 = [(id)objc_opt_self(CNContactFormatter) stringFromContact:v8 style:0];
  if (!v42
    || (uint64_t v43 = v42,
        uint64_t v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42),
        unint64_t v46 = v45,
        v43,
        LODWORD(v43) = sub_F08C(v44, v46),
        swift_bridgeObjectRelease(v46),
        v41 != (_DWORD)v43))
  {
    swift_bridgeObjectRelease(v40);
    id v30 = v8;
    uint64_t v63 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v64 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v66 = swift_slowAlloc(32LL, -1LL);
      uint64_t v77 = v66;
      *(_DWORD *)uint64_t v65 = 136315138;
      uint64_t v75 = v65 + 4;
      id v67 = [v30 identifier];
      uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)(v67);
      uint64_t v76 = v27;
      uint64_t v69 = v68;
      unint64_t v71 = v70;

      uint64_t v79 = sub_25824(v69, v71, &v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v79, &v80);

      swift_bridgeObjectRelease(v71);
      _os_log_impl(&dword_0, v63, v64, "phonemeData checksum is invalid for contact: %s", v65, 0xCu);
      swift_arrayDestroy(v66, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v66, -1LL, -1LL);
      swift_slowDealloc(v65, -1LL, -1LL);
      sub_26FB4(v76, v29);

      return 0LL;
    }

    sub_26FB4(v27, v29);

LABEL_24:
    return 0LL;
  }

  id v47 = v8;
  swift_bridgeObjectRetain_n(v40, 2LL);
  id v48 = v47;
  uint64_t v49 = (os_log_s *)Logger.logObject.getter(v48);
  os_log_type_t v50 = static os_log_type_t.debug.getter();
  int v51 = v50;
  uint64_t v52 = v49;
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v53 = swift_slowAlloc(22LL, -1LL);
    LODWORD(v75) = v51;
    uint64_t v54 = v53;
    uint64_t v74 = swift_slowAlloc(64LL, -1LL);
    uint64_t v79 = v74;
    *(_DWORD *)uint64_t v54 = 136315394;
    uint64_t v77 = v40;
    LODWORD(v78[0]) = v41;
    swift_bridgeObjectRetain(v40);
    uint64_t v55 = String.init<A>(describing:)(&v77, &type metadata for PhonemeData);
    uint64_t v76 = v27;
    unint64_t v57 = v56;
    uint64_t v77 = sub_25824(v55, v56, &v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, v78);
    swift_bridgeObjectRelease_n(v40, 2LL);
    swift_bridgeObjectRelease(v57);
    *(_WORD *)(v54 + 1sub_541C(v0 + 2) = 2080;
    id v58 = objc_msgSend(v48, "identifier", v54 + 14);
    uint64_t v59 = static String._unconditionallyBridgeFromObjectiveC(_:)(v58);
    unint64_t v61 = v60;

    uint64_t v77 = sub_25824(v59, v61, &v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v77, v78);

    swift_bridgeObjectRelease(v61);
    uint64_t v49 = v52;
    _os_log_impl(&dword_0, v52, (os_log_type_t)v75, "Parsed phonemeData: %s for contact: %s", (uint8_t *)v54, 0x16u);
    uint64_t v62 = v74;
    swift_arrayDestroy(v74, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v62, -1LL, -1LL);
    swift_slowDealloc(v54, -1LL, -1LL);
    sub_26FB4(v76, v29);
  }

  else
  {

    swift_bridgeObjectRelease_n(v40, 2LL);
    sub_26FB4(v27, v29);
  }

  return v40;
}

unint64_t sub_26F70()
{
  unint64_t result = qword_4BA80;
  if (!qword_4BA80)
  {
    unint64_t result = swift_getWitnessTable(&unk_38F30, &type metadata for PhonemeData);
    atomic_store(result, (unint64_t *)&qword_4BA80);
  }

  return result;
}

uint64_t sub_26FB4(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_26FC8(result, a2);
  }
  return result;
}

uint64_t sub_26FC8(uint64_t result, unint64_t a2)
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

uint64_t sub_2700C(uint64_t a1, int a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for JSONEncoder.OutputFormatting(0LL);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_4A758 != -1) {
    swift_once(&qword_4A758, sub_26594);
  }
  static JSONEncoder.OutputFormatting.prettyPrinted.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter(v9);
  uint64_t v17 = a1;
  int v18 = a2;
  unint64_t v10 = sub_272E8();
  uint64_t v11 = dispatch thunk of JSONEncoder.encode<A>(_:)(&v17, &type metadata for PhonemeData, v10);
  unint64_t v13 = v12;
  static String.Encoding.utf8.getter();
  uint64_t v14 = String.init(data:encoding:)(v11, v13, v6);
  sub_26FC8(v11, v13);
  return v14;
}

unint64_t sub_272E8()
{
  unint64_t result = qword_4BA88;
  if (!qword_4BA88)
  {
    unint64_t result = swift_getWitnessTable(&unk_38F08, &type metadata for PhonemeData);
    atomic_store(result, (unint64_t *)&qword_4BA88);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for P2PRunningError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_275D8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_27338);
}

uint64_t sub_27338(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 4u) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t destroy for P2PRunningError(uint64_t a1)
{
  return sub_27360(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_27360(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 4u) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t *assignWithCopy for P2PRunningError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_27634( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t))sub_27338,  (void (*)(uint64_t, uint64_t, uint64_t))sub_27360);
}

uint64_t *assignWithTake for P2PRunningError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_276A0(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_27360);
}

uint64_t getEnumTagSinglePayload for P2PRunningError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 252);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for P2PRunningError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 252;
    *(void *)(result + sub_541C(v0 + 8) = 0LL;
    if (a3 >= 0xFC) {
      *(_BYTE *)(result + 1sub_541C(v0 + 7) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFC) {
      *(_BYTE *)(result + 1sub_541C(v0 + 7) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_27424(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2742C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for P2PRunningError()
{
  return &type metadata for P2PRunningError;
}

uint64_t initializeBufferWithCopyOfBuffer for ASRLoggedTokenFetcherError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_275D8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_27450);
}

uint64_t sub_27450(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t destroy for ASRLoggedTokenFetcherError(uint64_t a1)
{
  return sub_27478(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_27478(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 3u) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t *assignWithCopy for ASRLoggedTokenFetcherError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_27634( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t))sub_27450,  (void (*)(uint64_t, uint64_t, uint64_t))sub_27478);
}

uint64_t *assignWithTake for ASRLoggedTokenFetcherError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_276A0(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_27478);
}

uint64_t getEnumTagSinglePayload for ASRLoggedTokenFetcherError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASRLoggedTokenFetcherError( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + sub_541C(v0 + 8) = 0LL;
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 1sub_541C(v0 + 7) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 1sub_541C(v0 + 7) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ASRLoggedTokenFetcherError()
{
  return &type metadata for ASRLoggedTokenFetcherError;
}

__n128 initializeWithTake for TTSContactOverriderError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_27564()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for TTSContactOverriderError()
{
  return &type metadata for TTSContactOverriderError;
}

ValueMetadata *type metadata accessor for ContactPronunciationInitialisationError()
{
  return &type metadata for ContactPronunciationInitialisationError;
}

uint64_t initializeBufferWithCopyOfBuffer for TTSPhonemesGeneratingError(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return sub_275D8(a1, a2, a3, (void (*)(void, uint64_t, uint64_t))sub_27598);
}

uint64_t sub_27598(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain(a2);
  }
  return result;
}

uint64_t destroy for TTSPhonemesGeneratingError(uint64_t a1)
{
  return sub_275C0(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_275C0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease(a2);
  }
  return result;
}

uint64_t sub_275D8(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t))
{
  uint64_t v5 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v6, v7);
  *(void *)a1 = v5;
  *(void *)(a1 + sub_541C(v0 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7;
  return a1;
}

uint64_t *assignWithCopy for TTSPhonemesGeneratingError(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_27634( a1,  a2,  a3,  (void (*)(void, uint64_t, uint64_t))sub_27598,  (void (*)(uint64_t, uint64_t, uint64_t))sub_275C0);
}

uint64_t *sub_27634( uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(void, uint64_t, uint64_t), void (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7 = *a2;
  uint64_t v8 = a2[1];
  uint64_t v9 = *((unsigned __int8 *)a2 + 16);
  a4(*a2, v8, v9);
  uint64_t v10 = *a1;
  uint64_t v11 = a1[1];
  *a1 = v7;
  a1[1] = v8;
  uint64_t v12 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v9;
  a5(v10, v11, v12);
  return a1;
}

uint64_t *assignWithTake for TTSPhonemesGeneratingError(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  return sub_276A0(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t))sub_275C0);
}

uint64_t *sub_276A0(uint64_t *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t))
{
  char v5 = *(_BYTE *)(a2 + 16);
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v8 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 16) = v5;
  a4(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSPhonemesGeneratingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSPhonemesGeneratingError( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 254;
    *(void *)(result + sub_541C(v0 + 8) = 0LL;
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 1sub_541C(v0 + 7) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFE) {
      *(_BYTE *)(result + 1sub_541C(v0 + 7) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TTSPhonemesGeneratingError()
{
  return &type metadata for TTSPhonemesGeneratingError;
}

ValueMetadata *type metadata accessor for ContactPronunciationControllerError()
{
  return &type metadata for ContactPronunciationControllerError;
}

uint64_t sub_27794(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRetain(a2);
}

uint64_t destroy for PhonemesMapperError(uint64_t *a1)
{
  return sub_277AC(*a1, a1[1]);
}

uint64_t sub_277AC(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a2);
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin19PhonemesMapperErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_27794(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(void *)(a1 + sub_541C(v0 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PhonemesMapperError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  sub_27794(*(void *)a2, v4);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + sub_541C(v0 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_277AC(v6, v7);
  return a1;
}

uint64_t assignWithTake for PhonemesMapperError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_277AC(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhonemesMapperError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PhonemesMapperError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 255;
    *(void *)(result + sub_541C(v0 + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 1sub_541C(v0 + 7) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 1sub_541C(v0 + 7) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_27920(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhonemesMapperError()
{
  return &type metadata for PhonemesMapperError;
}

void *initializeBufferWithCopyOfBuffer for TMDCCoreDataStoreError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

void *_s44SiriPrivateLearningTTSMispronunciationPlugin24TTSContactOverriderErrorOwca_0( void *a1, void *a2)
{
  *a1 = *a2;
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

void *assignWithTake for TMDCCoreDataStoreError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin24TTSContactOverriderErrorOwet_0( uint64_t a1, unsigned int a2)
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
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s44SiriPrivateLearningTTSMispronunciationPlugin24TTSContactOverriderErrorOwst_0( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + sub_541C(v0 + 8) = 0LL;
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
      *(void *)(result + sub_541C(v0 + 8) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for TMDCCoreDataStoreError()
{
  return &type metadata for TMDCCoreDataStoreError;
}

unint64_t destroy for TMDCLoggingError(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  int v2 = -1;
  if (result < 0xFFFFFFFF) {
    int v2 = result;
  }
  if (v2 - 1 < 0) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

void *_s44SiriPrivateLearningTTSMispronunciationPlugin16TMDCLoggingErrorOwCP_0(void *a1, void *a2)
{
  unint64_t v3 = a2[1];
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF) {
    uint64_t v4 = a2[1];
  }
  if ((int)v4 - 1 < 0)
  {
    *a1 = *a2;
    a1[1] = v3;
    swift_bridgeObjectRetain(v3);
  }

  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }

  return a1;
}

void *assignWithCopy for TMDCLoggingError(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  LODWORD(v5) = -1;
  if (v4 >= 0xFFFFFFFF) {
    LODWORD(v6) = -1;
  }
  else {
    uint64_t v6 = a1[1];
  }
  int v7 = v6 - 1;
  if (a2[1] < 0xFFFFFFFFuLL) {
    uint64_t v5 = a2[1];
  }
  int v8 = v5 - 1;
  if (v7 < 0)
  {
    if (v8 < 0)
    {
      *a1 = *a2;
      uint64_t v11 = a2[1];
      a1[1] = v11;
      swift_bridgeObjectRetain(v11);
      swift_bridgeObjectRelease(v4);
      return a1;
    }

    swift_bridgeObjectRelease(a1[1]);
    goto LABEL_11;
  }

  if ((v8 & 0x80000000) == 0)
  {
LABEL_11:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }

  *a1 = *a2;
  uint64_t v9 = a2[1];
  a1[1] = v9;
  swift_bridgeObjectRetain(v9);
  return a1;
}

void *assignWithTake for TMDCLoggingError(void *a1, void *a2)
{
  unint64_t v4 = a1[1];
  int v5 = -1;
  if (v4 < 0xFFFFFFFF) {
    int v5 = v4;
  }
  if (v5 - 1 < 0)
  {
    unint64_t v6 = a2[1];
    LODWORD(vsub_541C(v0 + 7) = -1;
    if (v6 < 0xFFFFFFFF) {
      uint64_t v7 = a2[1];
    }
    if ((int)v7 - 1 < 0)
    {
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRelease(v4);
      return a1;
    }

    swift_bridgeObjectRelease(v4);
  }

  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for TMDCLoggingError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for TMDCLoggingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0LL;
    *(void *)(result + sub_541C(v0 + 8) = 0LL;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + sub_541C(v0 + 8) = a2 + 1;
    }
  }

  return result;
}

uint64_t sub_27CD4(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  int v2 = v1 - 1;
  if (v2 < 0) {
    int v2 = -1;
  }
  return (v2 + 1);
}

void *sub_27CF8(void *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    void *result = a2 - 0x7FFFFFFF;
    result[1] = 0LL;
  }

  else if (a2)
  {
    result[1] = a2;
  }

  return result;
}

ValueMetadata *type metadata accessor for TMDCLoggingError()
{
  return &type metadata for TMDCLoggingError;
}

uint64_t sub_27D54(char a1, char a2)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aNvasr_4[v2];
  uint64_t v4 = *(void *)&aPhoneset_3[v2 + 8];
  uint64_t v5 = 8LL * a2;
  uint64_t v6 = *(void *)&aNvasr_4[v5];
  uint64_t v7 = *(void *)&aPhoneset_3[v5 + 8];
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, *(void *)&aPhoneset_3[8 * a2 + 8], 0LL);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

uint64_t sub_27DD8(char a1, char a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)&aFirst_2[v2 * 8];
  uint64_t v4 = qword_3A628[v2];
  uint64_t v5 = a2;
  uint64_t v6 = *(void *)&aFirst_2[v5 * 8];
  uint64_t v7 = qword_3A628[v5];
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, qword_3A628[a2], 0LL);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

uint64_t sub_27E5C(char a1, char a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)((char *)&unk_3A690 + v2 * 8);
  uint64_t v4 = qword_3A6B8[v2];
  uint64_t v5 = a2;
  uint64_t v6 = *(void *)((char *)&unk_3A690 + v5 * 8);
  uint64_t v7 = qword_3A6B8[v5];
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, qword_3A6B8[a2], 0LL);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

uint64_t sub_27EE0(char a1, unsigned __int8 a2)
{
  unint64_t v2 = 0xD000000000000025LL;
  unint64_t v3 = 0x800000000003AA00LL;
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v4 = 0x800000000003AA30LL;
    }
    else {
      unint64_t v4 = 0x800000000003AA60LL;
    }
    unint64_t v5 = 0xD000000000000025LL;
    int v6 = a2;
    if (a2)
    {
LABEL_6:
      if (v6 == 1) {
        unint64_t v3 = 0x800000000003AA30LL;
      }
      else {
        unint64_t v3 = 0x800000000003AA60LL;
      }
      if (v5 != 0xD000000000000025LL) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }

  else
  {
    unint64_t v5 = 0xD000000000000026LL;
    unint64_t v4 = 0x800000000003AA00LL;
    int v6 = a2;
    if (a2) {
      goto LABEL_6;
    }
  }

  unint64_t v2 = 0xD000000000000026LL;
  if (v5 != 0xD000000000000026LL)
  {
LABEL_15:
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v4, v2, v3, 0LL);
    goto LABEL_16;
  }

uint64_t sub_27FD8(char a1, char a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)&aNvasr_5[v2 * 8];
  uint64_t v4 = qword_3A5F0[v2];
  uint64_t v5 = a2;
  uint64_t v6 = *(void *)&aNvasr_5[v5 * 8];
  uint64_t v7 = qword_3A5F0[v5];
  if (v3 == v6 && v4 == v7) {
    char v9 = 1;
  }
  else {
    char v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, qword_3A5F0[a2], 0LL);
  }
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

Swift::Int sub_2805C(char a1)
{
  unint64_t v2 = 0xD000000000000025LL;
  Hasher.init(_seed:)(v5, 0LL);
  if (a1)
  {
    if (a1 == 1) {
      unint64_t v3 = 0x800000000003AA30LL;
    }
    else {
      unint64_t v3 = 0x800000000003AA60LL;
    }
  }

  else
  {
    unint64_t v2 = 0xD000000000000026LL;
    unint64_t v3 = 0x800000000003AA00LL;
  }

  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

Swift::Int sub_280FC(char a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = qword_3A628[v2];
  String.hash(into:)(v5, *(void *)&aFirst_2[v2 * 8], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

Swift::Int sub_28164(char a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = qword_3A5F0[v2];
  String.hash(into:)(v5, *(void *)&aNvasr_5[v2 * 8], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

Swift::Int sub_281CC(char a1)
{
  uint64_t v2 = a1;
  uint64_t v3 = qword_3A6B8[v2];
  String.hash(into:)(v5, *(void *)((char *)&unk_3A690 + v2 * 8), v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

Swift::Int sub_28234(char a1)
{
  uint64_t v2 = 8LL * a1;
  uint64_t v3 = *(void *)&aPhoneset_3[v2 + 8];
  String.hash(into:)(v5, *(void *)&aNvasr_4[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_2829C(uint64_t a1, char a2)
{
  uint64_t v2 = 8LL * a2;
  uint64_t v3 = *(void *)&aPhoneset_3[v2 + 8];
  String.hash(into:)(a1, *(void *)&aNvasr_4[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_282DC(uint64_t a1, char a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = qword_3A628[v2];
  String.hash(into:)(a1, *(void *)&aFirst_2[v2 * 8], v3);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_2831C(uint64_t a1, char a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = qword_3A6B8[v2];
  String.hash(into:)(a1, *(void *)((char *)&unk_3A690 + v2 * 8), v3);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_2835C(uint64_t a1, char a2)
{
  unint64_t v3 = 0xD000000000000025LL;
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v4 = 0x800000000003AA30LL;
    }
    else {
      unint64_t v4 = 0x800000000003AA60LL;
    }
  }

  else
  {
    unint64_t v3 = 0xD000000000000026LL;
    unint64_t v4 = 0x800000000003AA00LL;
  }

  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v4);
}

uint64_t sub_283D4(uint64_t a1, char a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = qword_3A5F0[v2];
  String.hash(into:)(a1, *(void *)&aNvasr_5[v2 * 8], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_28414(uint64_t a1, char a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = qword_3A5F0[v3];
  String.hash(into:)(v6, *(void *)&aNvasr_5[v3 * 8], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_28478(uint64_t a1, char a2)
{
  unint64_t v3 = 0xD000000000000025LL;
  Hasher.init(_seed:)(v6, a1);
  if (a2)
  {
    if (a2 == 1) {
      unint64_t v4 = 0x800000000003AA30LL;
    }
    else {
      unint64_t v4 = 0x800000000003AA60LL;
    }
  }

  else
  {
    unint64_t v3 = 0xD000000000000026LL;
    unint64_t v4 = 0x800000000003AA00LL;
  }

  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_28514(uint64_t a1, char a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = qword_3A6B8[v3];
  String.hash(into:)(v6, *(void *)((char *)&unk_3A690 + v3 * 8), v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_28578(uint64_t a1, char a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = qword_3A628[v3];
  String.hash(into:)(v6, *(void *)&aFirst_2[v3 * 8], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

Swift::Int sub_285DC(uint64_t a1, char a2)
{
  uint64_t v3 = 8LL * a2;
  uint64_t v4 = *(void *)&aPhoneset_3[v3 + 8];
  String.hash(into:)(v6, *(void *)&aNvasr_4[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_28640(char a1)
{
  return qword_3A690[a1];
}

void sub_28660(uint64_t (*a1)(_OWORD *)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v32 = a2 + 64;
  uint64_t v5 = 1LL << *(_BYTE *)(a2 + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & *(void *)(a2 + 64);
  int64_t v33 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain(a2);
  int64_t v8 = 0LL;
  if (!v7) {
    goto LABEL_5;
  }
LABEL_4:
  int64_t v37 = v8;
  uint64_t v38 = v4;
  uint64_t v36 = (v7 - 1) & v7;
  for (unint64_t i = __clz(__rbit64(v7)) | (v8 << 6); ; unint64_t i = __clz(__rbit64(v12)) + (v11 << 6))
  {
    uint64_t v14 = (uint64_t *)(*(void *)(a2 + 48) + 16 * i);
    uint64_t v16 = *v14;
    uint64_t v15 = v14[1];
    uint64_t v17 = *(void *)(a2 + 56) + 120 * i;
    uint64_t v18 = *(void *)v17;
    uint64_t v19 = *(void *)(v17 + 8);
    uint64_t v21 = *(void *)(v17 + 16);
    uint64_t v20 = *(void *)(v17 + 24);
    uint64_t v22 = *(void *)(v17 + 40);
    uint64_t v39 = *(void *)(v17 + 48);
    uint64_t v23 = *(void *)(v17 + 56);
    uint64_t v24 = *(void *)(v17 + 64);
    uint64_t v25 = *(void *)(v17 + 88);
    uint64_t v56 = *(void *)(v17 + 80);
    uint64_t v41 = *(void *)(v17 + 96);
    uint64_t v42 = v25;
    uint64_t v40 = *(void *)(v17 + 104);
    char v26 = *(_BYTE *)(v17 + 32);
    char v27 = *(_BYTE *)(v17 + 72);
    char v28 = *(_BYTE *)(v17 + 112);
    *(void *)&__int128 v47 = v16;
    *((void *)&v47 + 1) = v15;
    *(void *)&__int128 v48 = v18;
    *((void *)&v48 + 1) = v19;
    *(void *)&__int128 v49 = v21;
    *((void *)&v49 + 1) = v20;
    LOBYTE(v50) = v26;
    *((void *)&v50 + 1) = v22;
    *(void *)&__int128 v51 = v39;
    *((void *)&v51 + 1) = v23;
    *(void *)&__int128 v52 = v24;
    BYTE8(v5sub_541C(v0 + 2) = v27;
    *(void *)&__int128 v53 = v56;
    *((void *)&v53 + 1) = v25;
    *(void *)&__int128 v54 = v41;
    *((void *)&v54 + 1) = v40;
    char v55 = v28;
    v45[6] = v53;
    v45[7] = v54;
    char v46 = v28;
    v45[2] = v49;
    v45[3] = v50;
    v45[4] = v51;
    v45[5] = v52;
    v45[0] = v47;
    v45[1] = v48;
    swift_bridgeObjectRetain(v15);
    sub_E378(v18, v19, v21);
    sub_E378(v22, v39, v23);
    sub_E378(v56, v42, v41);
    char v29 = a1(v45);
    uint64_t v4 = v38;
    if (v38)
    {
      sub_2B848(&v47);
      swift_release(a2);
      return;
    }

    if ((v29 & 1) != 0)
    {
      swift_release(a2);
      v43[6] = v53;
      v43[7] = v54;
      char v44 = v55;
      v43[2] = v49;
      v43[3] = v50;
      v43[4] = v51;
      void v43[5] = v52;
      v43[0] = v47;
      v43[1] = v48;
      nullsub_1(v43);
      id v30 = v43;
      goto LABEL_29;
    }

    sub_2B848(&v47);
    unint64_t v7 = v36;
    int64_t v8 = v37;
    if (v36) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v10 = __OFADD__(v8, 1LL);
    int64_t v11 = v8 + 1;
    if (v10) {
      break;
    }
    if (v11 >= v33) {
      goto LABEL_28;
    }
    unint64_t v12 = *(void *)(v32 + 8 * v11);
    if (!v12)
    {
      int64_t v13 = v11 + 1;
      if (v11 + 1 >= v33) {
        goto LABEL_28;
      }
      unint64_t v12 = *(void *)(v32 + 8 * v13);
      if (v12) {
        goto LABEL_16;
      }
      int64_t v13 = v11 + 2;
      if (v11 + 2 >= v33) {
        goto LABEL_28;
      }
      unint64_t v12 = *(void *)(v32 + 8 * v13);
      if (v12) {
        goto LABEL_16;
      }
      int64_t v13 = v11 + 3;
      if (v11 + 3 >= v33) {
        goto LABEL_28;
      }
      unint64_t v12 = *(void *)(v32 + 8 * v13);
      if (v12)
      {
LABEL_16:
        int64_t v11 = v13;
        goto LABEL_17;
      }

      int64_t v13 = v11 + 4;
      if (v11 + 4 < v33)
      {
        unint64_t v12 = *(void *)(v32 + 8 * v13);
        if (!v12)
        {
          while (1)
          {
            int64_t v11 = v13 + 1;
            if (__OFADD__(v13, 1LL)) {
              goto LABEL_31;
            }
            if (v11 >= v33) {
              goto LABEL_28;
            }
            unint64_t v12 = *(void *)(v32 + 8 * v11);
            ++v13;
            if (v12) {
              goto LABEL_17;
            }
          }
        }

        goto LABEL_16;
      }

id sub_28994(uint64_t a1, id a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_501C(&qword_4ABB0);
  uint64_t v7 = swift_allocObject(v6, 72LL, 7LL);
  *(_OWORD *)(v7 + 16) = xmmword_39C30;
  int64_t v8 = (void *)CNContactPhonemeDataKey;
  *(void *)(v7 + 3sub_541C(v0 + 2) = CNContactPhonemeDataKey;
  *(void *)(v7 + 40) = CNContactGivenNameKey;
  *(void *)(v7 + 4sub_541C(v0 + 8) = CNContactFamilyNameKey;
  *(void *)(v7 + 56) = CNContactNicknameKey;
  char v9 = (void *)objc_opt_self(&OBJC_CLASS___CNContactFormatter);
  id v10 = v8;
  int64_t v11 = CNContactGivenNameKey;
  unint64_t v12 = CNContactFamilyNameKey;
  int64_t v13 = CNContactNicknameKey;
  *(void *)(v7 + 64) = [v9 descriptorForRequiredKeysForStyle:0];
  id v44 = (id)v7;
  specialized Array._endMutation()();
  uint64_t v14 = (void *)objc_opt_self(&OBJC_CLASS___CNContact);
  uint64_t v15 = sub_501C((uint64_t *)&unk_4B6A0);
  uint64_t v16 = swift_allocObject(v15, 48LL, 7LL);
  *(_OWORD *)(v16 + 16) = xmmword_38B10;
  *(void *)(v16 + 3sub_541C(v0 + 2) = a1;
  *(void *)(v16 + 40) = a2;
  swift_bridgeObjectRetain(a2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v16);
  id v18 = [v14 predicateForContactsWithIdentifiers:isa];

  uint64_t v19 = *(void **)(v3 + 16);
  sub_501C((uint64_t *)&unk_4BC40);
  Class v20 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  id v44 = 0LL;
  id v21 = [v19 unifiedContactsMatchingPredicate:v18 keysToFetch:v20 error:&v44];

  id v22 = v44;
  if (!v21)
  {
    id v32 = v44;
    _convertNSErrorToError(_:)(v22);

    goto LABEL_6;
  }

  uint64_t v23 = sub_9C74(0LL, (unint64_t *)&qword_4B6B0, &OBJC_CLASS___CNContact_ptr);
  uint64_t v24 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v21, v23);
  id v25 = v22;

  if ((unint64_t)v24 >> 62)
  {
    if (v24 < 0) {
      uint64_t v33 = v24;
    }
    else {
      uint64_t v33 = v24 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v24);
    uint64_t v34 = _CocoaArrayWrapper.endIndex.getter(v33);
    swift_bridgeObjectRelease(v24);
    if (v34 >= 2) {
      goto LABEL_4;
    }
    swift_bridgeObjectRetain(v24);
    unint64_t v26 = _CocoaArrayWrapper.endIndex.getter(v33);
    swift_bridgeObjectRelease(v24);
  }

  else
  {
    unint64_t v26 = *(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFF8LL));
    if (v26 > 1)
    {
LABEL_4:
      swift_bridgeObjectRelease(v24);
      id v44 = 0LL;
      unint64_t v45 = 0xE000000000000000LL;
      _StringGuts.grow(_:)(42LL);
      swift_bridgeObjectRelease(v45);
      id v44 = (id)0xD000000000000028LL;
      unint64_t v45 = 0x800000000003C0F0LL;
      v27._countAndFlagsBits = a1;
      v27._object = a2;
      String.append(_:)(v27);
      id v28 = v44;
      a2 = (id)v45;
      unint64_t v29 = sub_2B658();
      uint64_t v30 = swift_allocError(&type metadata for ContactPronunciationControllerError, v29, 0LL, 0LL);
      *uint64_t v31 = v28;
      v31[1] = a2;
LABEL_6:
      swift_willThrow(v30);

      return a2;
    }
  }

  if (v26)
  {
    if ((v24 & 0xC000000000000001LL) != 0)
    {
      a2 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0LL, v24);
      goto LABEL_16;
    }

    a1 = v42;
    if (*(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFF8LL)))
    {
      a2 = *(id *)(v24 + 32);
LABEL_16:

      swift_bridgeObjectRelease(v24);
      return a2;
    }

    __break(1u);
    goto LABEL_25;
  }

  swift_bridgeObjectRelease(v24);
  if (qword_4A778 != -1) {
LABEL_25:
  }
    swift_once(&qword_4A778, sub_349B4);
  uint64_t v35 = type metadata accessor for Logger(0LL);
  sub_4F30(v35, (uint64_t)qword_4FC70);
  uint64_t v36 = swift_bridgeObjectRetain_n(a2, 2LL);
  int64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
  os_log_type_t v38 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v40 = (void *)swift_slowAlloc(32LL, -1LL);
    id v44 = v40;
    *(_DWORD *)uint64_t v39 = 136315138;
    swift_bridgeObjectRetain(a2);
    uint64_t v43 = sub_25824(a1, (unint64_t)a2, (uint64_t *)&v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44);
    swift_bridgeObjectRelease_n(a2, 3LL);
    _os_log_impl(&dword_0, v37, v38, "No matching contacts found for Siri current pronunciation for %s", v39, 0xCu);
    swift_arrayDestroy(v40, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v40, -1LL, -1LL);
    swift_slowDealloc(v39, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  return 0LL;
}

uint64_t sub_28EA8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  uint64_t v3 = _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0();
  if (v2 == v3 && v1 == v4)
  {
    char v7 = 1;
  }

  else
  {
    uint64_t v6 = v4;
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)(v2, v1, v3, v4, 0LL);
    uint64_t v1 = v6;
  }

  swift_bridgeObjectRelease(v1);
  return v7 & 1;
}

uint64_t sub_28F20()
{
  sub_541C((void *)(v0 + 24));
  return swift_deallocClassInstance(v0, 64LL, 7LL);
}

uint64_t type metadata accessor for ContactPronunciationController()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin30ContactPronunciationController);
}

void sub_28F84()
{
  unk_4BAA6 = -4864;
}

void sub_28FB4()
{
  qword_4BAA8 = 0x656372756F73LL;
  unk_4BAB0 = 0xE600000000000000LL;
}

id sub_28FD4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for PhonemeString();
  uint64_t v5 = qword_4A760;
  uint64_t v6 = v2;
  if (v5 != -1) {
    swift_once(&qword_4A760, sub_28F84);
  }
  char v7 = (void *)NSCoder.decodeObject<A>(of:forKey:)(v4, qword_4BA98, unk_4BAA0, v4);
  uint64_t v8 = sub_9C74(0LL, (unint64_t *)&unk_4B4D0, &OBJC_CLASS___NSString_ptr);
  if (qword_4A768 != -1) {
    swift_once(&qword_4A768, sub_28FB4);
  }
  uint64_t v9 = NSCoder.decodeObject<A>(of:forKey:)(v8, qword_4BAA8, unk_4BAB0, v8);
  if (!v9)
  {
    if (v7)
    {
LABEL_11:

LABEL_14:
      uint64_t v16 = type metadata accessor for ContactPronunciation();
      swift_deallocPartialClassInstance(v6, v16, 17LL, 7LL);
      return 0LL;
    }

    int64_t v13 = 0LL;
LABEL_13:
    swift_bridgeObjectRelease(v13);
    goto LABEL_14;
  }

  id v10 = (void *)v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
  int64_t v13 = v12;

  if (!v7) {
    goto LABEL_13;
  }
  if (!v13) {
    goto LABEL_11;
  }
  v19._countAndFlagsBits = v11;
  v19._object = v13;
  char v14 = sub_2B588(v19);
  if (v14 == 5) {
    goto LABEL_11;
  }
  *(void *)&v6[OBJC_IVAR___ContactPronunciation_phonemeString] = v7;
  v6[OBJC_IVAR___ContactPronunciation_source] = v14;

  v18.receiver = v6;
  v18.super_class = (Class)type metadata accessor for ContactPronunciation();
  id v15 = objc_msgSendSuper2(&v18, "init");

  return v15;
}

id sub_2919C(void *a1, char a2)
{
  if (a2 == 2) {
    __asm { BR              X10 }
  }

  if (!a2) {
    __asm { BR              X10 }
  }

  uint64_t v5 = v2;
  *(void *)&v2[OBJC_IVAR___ContactPronunciation_phonemeString] = a1;
  v2[OBJC_IVAR___ContactPronunciation_source] = a2;
  id v6 = a1;

  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for ContactPronunciation();
  id v7 = objc_msgSendSuper2(&v9, "init");

  return v7;
}

void sub_293F4()
{
}

uint64_t sub_294F8()
{
  uint64_t v1 = v0;
  v13[0] = 0LL;
  v13[1] = 0xE000000000000000LL;
  _StringGuts.grow(_:)(33LL);
  v2._object = (void *)0x800000000003C0D0LL;
  v2._countAndFlagsBits = 0xD000000000000011LL;
  String.append(_:)(v2);
  id v3 = *(id *)(v0 + OBJC_IVAR___ContactPronunciation_phonemeString);
  id v4 = [v3 description];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  id v7 = v6;

  v8._countAndFlagsBits = v5;
  v8._object = v7;
  String.append(_:)(v8);

  swift_bridgeObjectRelease(v7);
  v9._countAndFlagsBits = 0x656372756F73202CLL;
  v9._object = (void *)0xEA0000000000203ALL;
  String.append(_:)(v9);
  char v12 = *(_BYTE *)(v1 + OBJC_IVAR___ContactPronunciation_source);
  _print_unlocked<A, B>(_:_:)( &v12,  v13,  &type metadata for ContactPronunciationSource,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
  v10._countAndFlagsBits = 32032LL;
  v10._object = (void *)0xE200000000000000LL;
  String.append(_:)(v10);
  return v13[0];
}

uint64_t sub_29628(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_915C(a1, (uint64_t)v11);
  if (!v12)
  {
    sub_911C((uint64_t)v11);
    goto LABEL_7;
  }

  uint64_t v3 = type metadata accessor for ContactPronunciation();
  if ((swift_dynamicCast(&v10, v11, (char *)&type metadata for Any + 8, v3, 6LL) & 1) == 0)
  {
LABEL_7:
    char v8 = 0;
    return v8 & 1;
  }

  id v4 = v10;
  sub_9C74(0LL, &qword_4AD50, &OBJC_CLASS___NSObject_ptr);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___ContactPronunciation_phonemeString);
  id v6 = *(id *)&v4[OBJC_IVAR___ContactPronunciation_phonemeString];
  char v7 = static NSObject.== infix(_:_:)(v5, v6);

  if ((v7 & 1) == 0)
  {

    goto LABEL_7;
  }

  char v8 = sub_27E5C(*(_BYTE *)(v2 + OBJC_IVAR___ContactPronunciation_source), v4[OBJC_IVAR___ContactPronunciation_source]);

  return v8 & 1;
}

void sub_29790(void *a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR___ContactPronunciation_phonemeString);
  if (qword_4A760 != -1) {
    swift_once(&qword_4A760, sub_28F84);
  }
  NSString v4 = String._bridgeToObjectiveC()();
  [a1 encodeObject:v3 forKey:v4];

  uint64_t v5 = qword_3A6B8[*(char *)(v1 + OBJC_IVAR___ContactPronunciation_source)];
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  if (qword_4A768 != -1) {
    swift_once(&qword_4A768, sub_28FB4);
  }
  id v7 = String._bridgeToObjectiveC()();
  [a1 encodeObject:v6 forKey:v7];
}

uint64_t sub_2993C(char a1)
{
  if ((a1 & 1) != 0) {
    return 0x656372756F73LL;
  }
  else {
    return 0x53656D656E6F6870LL;
  }
}

uint64_t sub_2997C()
{
  return sub_2993C(*v0);
}

uint64_t sub_29984@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result = sub_2BB14(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_299A8(uint64_t a1)
{
  unint64_t v2 = sub_2A20C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_299D0(uint64_t a1)
{
  unint64_t v2 = sub_2A20C();
  return CodingKey.debugDescription.getter(a1, v2);
}

id sub_299F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ContactPronunciation();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ContactPronunciation()
{
  return objc_opt_self(&OBJC_CLASS___ContactPronunciation);
}

uint64_t sub_29A58(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_501C((uint64_t *)&unk_4BC20);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  char v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_4FF8(a1, v9);
  unint64_t v11 = sub_2A20C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ContactPronunciation.CodingKeys,  &type metadata for ContactPronunciation.CodingKeys,  v11,  v9,  v10);
  uint64_t v17 = *(void *)(v3 + OBJC_IVAR___ContactPronunciation_phonemeString);
  HIBYTE(v16) = 0;
  uint64_t v12 = type metadata accessor for PhonemeString();
  uint64_t v13 = sub_1DC28( &qword_4ABF8,  (uint64_t (*)(uint64_t))type metadata accessor for PhonemeString,  (uint64_t)&unk_396BC);
  KeyedEncodingContainer.encode<A>(_:forKey:)(&v17, (char *)&v16 + 7, v5, v12, v13);
  if (!v2)
  {
    BYTE6(v16) = *(_BYTE *)(v3 + OBJC_IVAR___ContactPronunciation_source);
    BYTE5(v16) = 1;
    unint64_t v14 = sub_2B614();
    KeyedEncodingContainer.encode<A>(_:forKey:)( (char *)&v16 + 6,  (char *)&v16 + 5,  v5,  &type metadata for ContactPronunciationSource,  v14);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

id sub_29BCC(void *a1)
{
  uint64_t v23 = sub_501C(&qword_4BBF8);
  uint64_t v4 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1[3];
  uint64_t v8 = a1[4];
  uint64_t v9 = sub_4FF8(a1, v7);
  unint64_t v10 = sub_2A20C();
  uint64_t v24 = v1;
  id v11 = v9;
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ContactPronunciation.CodingKeys,  &type metadata for ContactPronunciation.CodingKeys,  v10,  v7,  v8);
  if (v2)
  {
    uint64_t v16 = v24;
    sub_541C(a1);

    uint64_t v17 = type metadata accessor for ContactPronunciation();
    swift_deallocPartialClassInstance(v16, v17, 17LL, 7LL);
  }

  else
  {
    uint64_t v12 = v4;
    uint64_t v13 = type metadata accessor for PhonemeString();
    char v26 = 0;
    uint64_t v14 = sub_1DC28( &qword_4ABC8,  (uint64_t (*)(uint64_t))type metadata accessor for PhonemeString,  (uint64_t)&unk_396E4);
    uint64_t v15 = v23;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v13, &v26, v23, v13, v14);
    Swift::String v19 = v24;
    *(void *)&v24[OBJC_IVAR___ContactPronunciation_phonemeString] = v27;
    char v26 = 1;
    unint64_t v20 = sub_2A250();
    KeyedDecodingContainer.decode<A>(_:forKey:)( &type metadata for ContactPronunciationSource,  &v26,  v15,  &type metadata for ContactPronunciationSource,  v20);
    v19[OBJC_IVAR___ContactPronunciation_source] = v27;

    id v21 = (objc_class *)type metadata accessor for ContactPronunciation();
    v25.receiver = v19;
    v25.super_class = v21;
    id v11 = objc_msgSendSuper2(&v25, "init");
    (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v15);
    sub_541C(a1);
  }

  return v11;
}

id sub_29E08@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for ContactPronunciation());
  id result = sub_29BCC(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_29E58(void *a1)
{
  return sub_29A58(a1);
}

uint64_t sub_29E78(char *a1, char *a2)
{
  return sub_27E5C(*a1, *a2);
}

Swift::Int sub_29E84()
{
  return sub_281CC(*v0);
}

uint64_t sub_29E8C(uint64_t a1)
{
  return sub_2831C(a1, *v1);
}

Swift::Int sub_29E94(uint64_t a1)
{
  return sub_28514(a1, *v1);
}

unint64_t sub_29E9C@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_2B588(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_29EC8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_28640(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_29EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2B5D0();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_29F4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2B5D0();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t type metadata accessor for ContactPronunciationValueTransformer()
{
  return objc_opt_self(&OBJC_CLASS___ContactPronunciationValueTransformer);
}

uint64_t getEnumTagSinglePayload for ContactPronunciationSource(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }

uint64_t storeEnumTagSinglePayload for ContactPronunciationSource( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_2A144 + 4 * byte_3A291[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2A178 + 4 * byte_3A28C[v4]))();
}

uint64_t sub_2A178(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2A180(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x2A188LL);
  }
  return result;
}

uint64_t sub_2A194(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x2A19CLL);
  }
  *(_BYTE *)uint64_t result = a2 + 4;
  return result;
}

uint64_t sub_2A1A0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2A1A8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContactPronunciationSource()
{
  return &type metadata for ContactPronunciationSource;
}

unint64_t sub_2A1C8()
{
  unint64_t result = qword_4BBF0;
  if (!qword_4BBF0)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A434, &type metadata for ContactPronunciationSource);
    atomic_store(result, (unint64_t *)&qword_4BBF0);
  }

  return result;
}

unint64_t sub_2A20C()
{
  unint64_t result = qword_4BC00;
  if (!qword_4BC00)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A57C, &type metadata for ContactPronunciation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4BC00);
  }

  return result;
}

unint64_t sub_2A250()
{
  unint64_t result = qword_4BC10;
  if (!qword_4BC10)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A394, &type metadata for ContactPronunciationSource);
    atomic_store(result, (unint64_t *)&qword_4BC10);
  }

  return result;
}

uint64_t sub_2A294(uint64_t a1, void (*a2)(char *, uint64_t))
{
  uint64_t v4 = type metadata accessor for Locale(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  int v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = type metadata accessor for CharacterSet(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_1F938(a1, (uint64_t)v42, &qword_4BC78);
  if (*((void *)&v42[0] + 1) == 1LL) {
    return 0LL;
  }
  v42[4] = v42[0];
  v43[0] = v42[1];
  v43[1] = v42[2];
  v43[2] = v42[3];
  sub_1F938((uint64_t)v43, (uint64_t)v44, &qword_4BC80);
  sub_1F938((uint64_t)v44, (uint64_t)&v45, &qword_4BC80);
  unint64_t v15 = v46;
  if (!v46) {
    return 0LL;
  }
  uint64_t v36 = v45;
  uint64_t v40 = v45;
  unint64_t v41 = v46;
  if (qword_4A770 != -1) {
    goto LABEL_34;
  }
  while (1)
  {
    sub_4F30(v11, (uint64_t)qword_4BCA0);
    CharacterSet.inverted.getter();
    unint64_t v16 = sub_53D8();
    StringProtocol.rangeOfCharacter(from:options:range:)(v14, 0LL, 0LL, 0LL, 1LL, &type metadata for String, v16);
    char v18 = v17;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v12 = *(void *)(v5 + 16);
    ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v12)(v10, a2, v4);
    if ((v18 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      return 2LL;
    }

    if (qword_4A748 != -1) {
      swift_once(&qword_4A748, sub_1B804);
    }
    uint64_t v19 = qword_4FC68;
    uint64_t v39 = *(void *)(qword_4FC68 + 16);
    if (!v39)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
      goto LABEL_22;
    }

    unint64_t v20 = (*(unsigned __int8 *)(v5 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    ((void (*)(char *, unint64_t, uint64_t))v12)(v8, qword_4FC68 + v20, v4);
    uint64_t v21 = sub_1DC28( (unint64_t *)&qword_4B690,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
    swift_bridgeObjectRetain(v19);
    uint64_t v38 = v21;
    char v22 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v10, v4, v21);
    a2 = *(void (**)(char *, uint64_t))(v5 + 8);
    a2(v8, v4);
    if ((v22 & 1) != 0) {
      break;
    }
    if (v39 == 1)
    {
      uint64_t v25 = v19;
LABEL_21:
      swift_bridgeObjectRelease(v25);
      a2(v10, v4);
      goto LABEL_22;
    }

    uint64_t v26 = *(void *)(v5 + 72);
    uint64_t v35 = v19;
    uint64_t v37 = v26;
    uint64_t v14 = (char *)(v19 + v26 + v20);
    uint64_t v11 = 1LL;
    while (1)
    {
      ((void (*)(char *, char *, uint64_t))v12)(v8, v14, v4);
      uint64_t v5 = v11 + 1;
      if (__OFADD__(v11, 1LL)) {
        break;
      }
      char v27 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v10, v4, v38);
      a2(v8, v4);
      if ((v27 & 1) != 0)
      {
        uint64_t v23 = v35;
        goto LABEL_28;
      }

      ++v11;
      v14 += v37;
      if (v5 == v39)
      {
        uint64_t v25 = v35;
        goto LABEL_21;
      }
    }

    __break(1u);
LABEL_34:
    swift_once(&qword_4A770, sub_2D2AC);
  }

  uint64_t v23 = v19;
LABEL_28:
  swift_bridgeObjectRelease(v23);
  if ((v15 & 0x2000000000000000LL) != 0) {
    uint64_t v33 = HIBYTE(v15) & 0xF;
  }
  else {
    uint64_t v33 = v36 & 0xFFFFFFFFFFFFLL;
  }
  a2(v10, v4);
  if (v33) {
    return 2LL;
  }
LABEL_22:
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v28 = type metadata accessor for Logger(0LL);
  uint64_t v29 = sub_4F30(v28, (uint64_t)qword_4FC70);
  uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v30, v31))
  {
    id v32 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v32 = 0;
    _os_log_impl( &dword_0,  v30,  v31,  "Source is unknown since ttsData in phonemeData doesn't have LNH phonemes",  v32,  2u);
    swift_slowDealloc(v32, -1LL, -1LL);
  }

  return 4LL;
}

uint64_t sub_2A714(void *a1, char a2, void (*a3)(char *, uint64_t))
{
  uint64_t v5 = sub_26618(a1);
  if (v5)
  {
    uint64_t v6 = v5;
    __chkstk_darwin(v5);
    sub_28660((uint64_t (*)(_OWORD *))sub_2BC0C, v6, (uint64_t)v31);
    swift_bridgeObjectRelease(v6);
    sub_1F938((uint64_t)v31, (uint64_t)v32, &qword_4BC58);
    sub_1F938((uint64_t)v32, (uint64_t)v33, &qword_4BC58);
    if (sub_2B6B8((uint64_t)v33) != 1)
    {
      swift_bridgeObjectRelease(v33[1]);
      uint64_t v9 = v34;
      uint64_t v8 = v35;
      uint64_t v10 = v36;
      uint64_t v11 = v37;
      uint64_t v12 = v40;
      uint64_t v30 = v42;
      uint64_t v29 = v41;
      uint64_t v28 = v39;
      uint64_t v27 = v38;
      if (a2)
      {
        if (a2 == 1)
        {
          if (v37 && *(void *)(v37 + 16))
          {
            uint64_t v13 = *(void *)(v37 + 40);
            uint64_t v14 = *(void *)(v37 + 56);
            uint64_t v22 = *(void *)(v37 + 48);
            uint64_t v23 = *(void *)(v37 + 32);
            uint64_t v25 = *(unsigned __int8 *)(v37 + 72);
            uint64_t v26 = *(void *)(v37 + 64);
            uint64_t v15 = *(void *)(v37 + 80);
            uint64_t v16 = *(void *)(v37 + 88);
LABEL_15:
            uint64_t v24 = v15;
            uint64_t v17 = v36;
            uint64_t v18 = v35;
            swift_bridgeObjectRetain(v16);
            swift_bridgeObjectRetain(v13);
            swift_bridgeObjectRetain(v14);
            uint64_t v8 = v18;
            uint64_t v10 = v17;
            uint64_t v20 = v22;
            uint64_t v19 = v23;
LABEL_17:
            sub_E450(v9, v8, v10);
            sub_E450(v11, v27, v28);
            sub_E450(v12, v29, v30);
            v43[0] = v19;
            v43[1] = v13;
            v43[2] = v20;
            _OWORD v43[3] = v14;
            v43[4] = v26;
            void v43[5] = v25;
            v43[6] = v24;
            v43[7] = v16;
            uint64_t v7 = sub_2A294((uint64_t)v43, a3);
            sub_2B930(v19, v13, v20, v14, v26, v25, v24, v16);
            return v7;
          }
        }

        else if (v40 && *(void *)(v40 + 16))
        {
          uint64_t v13 = *(void *)(v40 + 40);
          uint64_t v14 = *(void *)(v40 + 56);
          uint64_t v22 = *(void *)(v40 + 48);
          uint64_t v23 = *(void *)(v40 + 32);
          uint64_t v25 = *(unsigned __int8 *)(v40 + 72);
          uint64_t v26 = *(void *)(v40 + 64);
          uint64_t v15 = *(void *)(v40 + 80);
          uint64_t v16 = *(void *)(v40 + 88);
          goto LABEL_15;
        }
      }

      else if (v34 && *(void *)(v34 + 16))
      {
        uint64_t v13 = *(void *)(v34 + 40);
        uint64_t v14 = *(void *)(v34 + 56);
        uint64_t v22 = *(void *)(v34 + 48);
        uint64_t v23 = *(void *)(v34 + 32);
        uint64_t v25 = *(unsigned __int8 *)(v34 + 72);
        uint64_t v26 = *(void *)(v34 + 64);
        uint64_t v15 = *(void *)(v34 + 80);
        uint64_t v16 = *(void *)(v34 + 88);
        goto LABEL_15;
      }

      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      uint64_t v14 = 0LL;
      uint64_t v25 = 0LL;
      uint64_t v26 = 0LL;
      uint64_t v24 = 0LL;
      uint64_t v16 = 0LL;
      uint64_t v13 = 1LL;
      goto LABEL_17;
    }
  }

  return 0LL;
}

os_log_s *sub_2A9AC(uint64_t a1, void *a2, int a3, void (*a4)(char *, uint64_t))
{
  LODWORD(v130) = a3;
  uint64_t v108 = type metadata accessor for Locale(0LL);
  uint64_t v106 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  uint64_t v107 = (char *)&v99 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!a2)
  {
    unint64_t v27 = sub_2B658();
    uint64_t v28 = swift_allocError(&type metadata for ContactPronunciationControllerError, v27, 0LL, 0LL);
    *uint64_t v29 = 0xD000000000000012LL;
    v29[1] = 0x800000000003C120LL;
LABEL_9:
    swift_willThrow(v28);
    return v4;
  }

  uint64_t v105 = a4;
  id v14 = sub_28994(a1, a2);
  if (!v5)
  {
    uint64_t v15 = v14;
    if (v14)
    {
      uint64_t v104 = (void (*)(char *, unint64_t, uint64_t))sub_2A714(v14, (char)v130, v105);
      if (qword_4A778 != -1) {
        swift_once(&qword_4A778, sub_349B4);
      }
      uint64_t v16 = sub_4F30(v10, (uint64_t)qword_4FC70);
      uint64_t v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v16, v10);
      uint64_t v4 = (os_log_s *)Logger.logObject.getter(v17);
      os_log_type_t v18 = static os_log_type_t.debug.getter();
      Swift::String v103 = v4;
      if (os_log_type_enabled(v4, v18))
      {
        uint64_t v102 = v15;
        uint64_t v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v20 = swift_slowAlloc(32LL, -1LL);
        Swift::String v101 = (void (*)(void, void))v20;
        unint64_t v100 = v19;
        *(_DWORD *)uint64_t v19 = 136315138;
        uint64_t v21 = (char)v104;
        uint64_t v22 = qword_3A690[v21];
        uint64_t v119 = (os_log_s *)v20;
        unint64_t v23 = qword_3A6B8[v21];
        uint64_t v117 = sub_25824(v22, v23, (uint64_t *)&v119);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, v118);
        unint64_t v24 = v23;
        uint64_t v15 = v102;
        swift_bridgeObjectRelease(v24);
        uint64_t v4 = v103;
        uint64_t v25 = v100;
        _os_log_impl(&dword_0, v103, v18, "Source of siri current pronunciation: %s", v100, 0xCu);
        uint64_t v26 = v101;
        swift_arrayDestroy(v101, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v26, -1LL, -1LL);
        swift_slowDealloc(v25, -1LL, -1LL);
      }

      else
      {
      }

      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
      if (v104 != 2)
      {
        if (!(_BYTE)v104)
        {
          unint64_t v35 = sub_26348();
          uint64_t v36 = swift_allocError(&type metadata for TTSPhonemesGeneratingError, v35, 0LL, 0LL);
          *(void *)uint64_t v37 = 0xD000000000000020LL;
          *(void *)(v37 + sub_541C(v0 + 8) = 0x800000000003BD00LL;
          *(_BYTE *)(v37 + 16) = 0;
LABEL_57:
          swift_willThrow(v36);
LABEL_58:

          return v4;
        }

        unint64_t v45 = sub_2B658();
        uint64_t v36 = swift_allocError(&type metadata for ContactPronunciationControllerError, v45, 0LL, 0LL);
        unint64_t v47 = 0xD00000000000001FLL;
        __int128 v48 = "Unknown source of pronunciation";
LABEL_25:
        *unint64_t v46 = v47;
        v46[1] = (unint64_t)(v48 - 32) | 0x8000000000000000LL;
        goto LABEL_57;
      }

      uint64_t v38 = sub_26618(v15);
      if (!v38)
      {
        unint64_t v53 = sub_2B658();
        uint64_t v36 = swift_allocError(&type metadata for ContactPronunciationControllerError, v53, 0LL, 0LL);
        unint64_t v47 = 0xD000000000000035LL;
        __int128 v48 = "Couldn't convert phonemeData to PhonemeData structure";
        goto LABEL_25;
      }

      uint64_t v39 = v38;
      __chkstk_darwin(v38);
      sub_28660((uint64_t (*)(_OWORD *))sub_2B69C, v39, (uint64_t)&v115);
      uint64_t v40 = 0LL;
      swift_bridgeObjectRelease(v39);
      sub_1F938((uint64_t)&v115, (uint64_t)&v117, &qword_4BC58);
      sub_1F938((uint64_t)&v117, (uint64_t)&v119, &qword_4BC58);
      if (sub_2B6B8((uint64_t)&v119) == 1)
      {
        unint64_t v115 = 0LL;
        unint64_t v116 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(40LL);
        swift_bridgeObjectRelease(v116);
        unint64_t v115 = 0xD000000000000026LL;
        unint64_t v116 = 0x800000000003C1D0LL;
        uint64_t v41 = sub_1DC28( (unint64_t *)&unk_4BC60,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
        v42._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v108, v41);
        object = v42._object;
        String.append(_:)(v42);
        swift_bridgeObjectRelease(object);
        uint64_t v4 = (os_log_s *)v115;
        unint64_t v44 = v116;
LABEL_56:
        unint64_t v78 = sub_2B658();
        uint64_t v36 = swift_allocError(&type metadata for ContactPronunciationControllerError, v78, 0LL, 0LL);
        *uint64_t v79 = v4;
        v79[1] = (os_log_s *)v44;
        goto LABEL_57;
      }

      uint64_t v102 = v15;
      if ((_BYTE)v130)
      {
        __int128 v54 = v105;
        if (v130 == 1)
        {
          uint64_t v56 = v124;
          uint64_t v55 = v125;
          uint64_t v57 = v126;
        }

        else
        {
          uint64_t v56 = v127;
          uint64_t v55 = v128;
          uint64_t v57 = v129;
        }

        sub_E378((uint64_t)v56, v55, v57);
        sub_2B6D0(&v117);
        if (!v56) {
          goto LABEL_36;
        }
      }

      else
      {
        uint64_t v56 = v121;
        uint64_t v55 = v122;
        uint64_t v57 = v123;
        sub_E378((uint64_t)v121, v122, v123);
        sub_2B6D0(&v117);
        __int128 v54 = v105;
        if (!v56) {
          goto LABEL_36;
        }
      }

      if (v56[2])
      {
        id v58 = (void (*)(void, void))v56[7];
        Swift::String v103 = (os_log_s *)v56[6];
        swift_bridgeObjectRetain(v58);
        sub_E450((uint64_t)v56, v55, v57);
        goto LABEL_37;
      }

      sub_E450((uint64_t)v56, v55, v57);
LABEL_36:
      Swift::String v103 = 0LL;
      id v58 = 0LL;
LABEL_37:
      unint64_t v60 = v107;
      uint64_t v59 = v108;
      if (qword_4A748 != -1) {
        goto LABEL_66;
      }
      while (1)
      {
        uint64_t v61 = qword_4FC68;
        uint64_t v130 = *(void (**)(char *, uint64_t))(qword_4FC68 + 16);
        if (!v130)
        {
          char v70 = 3;
          int v69 = 1;
          goto LABEL_52;
        }

        Swift::String v101 = v58;
        uint64_t v62 = v106;
        unint64_t v63 = (*(unsigned __int8 *)(v106 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v106 + 80);
        uint64_t v104 = *(void (**)(char *, unint64_t, uint64_t))(v106 + 16);
        v104(v60, qword_4FC68 + v63, v59);
        uint64_t v64 = sub_1DC28( (unint64_t *)&qword_4B690,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
        swift_bridgeObjectRetain(v61);
        uint64_t v65 = v54;
        uint64_t v66 = (uint8_t *)v61;
        uint64_t v67 = v59;
        char v68 = dispatch thunk of static Equatable.== infix(_:_:)(v60, v65, v59, v64);
        id v58 = *(void (**)(void, void))(v62 + 8);
        v58(v60, v67);
        if ((v68 & 1) != 0)
        {
          swift_bridgeObjectRelease(v66);
          int v69 = 0;
          char v70 = 2;
          goto LABEL_51;
        }

        unint64_t v100 = v66;
        uint64_t v99 = v40;
        uint64_t v40 = *(void *)(v106 + 72);
        unint64_t v71 = &v100[v40 + v63];
        uint64_t v72 = 1LL;
        uint64_t v59 = v108;
        while (1)
        {
          v104(v60, (unint64_t)v71, v59);
          __int128 v54 = (void (*)(char *, uint64_t))(v72 + 1);
          if (__OFADD__(v72, 1LL)) {
            break;
          }
          char v73 = dispatch thunk of static Equatable.== infix(_:_:)(v60, v105, v59, v64);
          uint64_t v74 = v60;
          char v75 = v73;
          v58(v74, v59);
          if ((v75 & 1) != 0)
          {
            swift_bridgeObjectRelease(v100);
            int v69 = 0;
            char v70 = 2;
            goto LABEL_50;
          }

          ++v72;
          v71 += v40;
          unint64_t v60 = v107;
          if (v54 == v130)
          {
            swift_bridgeObjectRelease(v100);
            char v70 = 3;
            int v69 = 1;
LABEL_50:
            uint64_t v40 = v99;
            goto LABEL_51;
          }
        }

        __break(1u);
LABEL_66:
        swift_once(&qword_4A748, sub_1B804);
      }

      swift_bridgeObjectRelease(v100);
      char v70 = 3;
      int v69 = 1;
LABEL_51:
      id v58 = v101;
LABEL_52:
      uint64_t v15 = v102;
      if (!v58)
      {
        uint64_t v113 = 0LL;
        unint64_t v114 = 0xE000000000000000LL;
        _StringGuts.grow(_:)(44LL);
        v76._countAndFlagsBits = 0x74276E646C756F43LL;
        v76._object = (void *)0xEE0020646E696620LL;
        String.append(_:)(v76);
        LOBYTE(v111[0]) = v70;
        _print_unlocked<A, B>(_:_:)( v111,  &v113,  &type metadata for PhonemeFormat,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
        v77._countAndFlagsBits = 0xD00000000000001CLL;
        v77._object = (void *)0x800000000003C200LL;
        String.append(_:)(v77);
        uint64_t v4 = v113;
        unint64_t v44 = v114;
        goto LABEL_56;
      }

      if (v69)
      {
        swift_bridgeObjectRelease(0xE300000000000000LL);
      }

      else
      {
        char v81 = _stringCompareWithSmolCheck(_:_:expecting:)( 0x61706D6173LL,  0xE500000000000000LL,  6844012LL,  0xE300000000000000LL,  0LL);
        swift_bridgeObjectRelease(0xE500000000000000LL);
        if ((v81 & 1) == 0)
        {
          uint64_t v91 = (objc_class *)type metadata accessor for PhonemeString();
          uint64_t v92 = objc_allocWithZone(v91);
          uint64_t v93 = (os_log_s **)&v92[OBJC_IVAR___PhonemeString_symbols];
          char *v93 = v103;
          v93[1] = (os_log_s *)v58;
          v92[OBJC_IVAR___PhonemeString_encoding] = 2;
          uint64_t v94 = &v92[OBJC_IVAR___PhonemeString_boundary];
          *uint64_t v94 = 32LL;
          v94[1] = 0xE100000000000000LL;
          v112.receiver = v92;
          v112.super_class = v91;
          id v90 = objc_msgSendSuper2(&v112, "init", v99);
LABEL_63:
          id v95 = v90;
          uint64_t v96 = (os_log_s *)objc_allocWithZone((Class)type metadata accessor for ContactPronunciation());
          uint64_t v97 = v95;
          uint64_t v4 = v96;
          uint64_t v98 = (os_log_s *)sub_2919C(v97, 2);
          if (!v40)
          {
            uint64_t v4 = v98;

            return v4;
          }

          goto LABEL_58;
        }
      }

      uint64_t v113 = v103;
      unint64_t v114 = (unint64_t)v58;
      v111[0] = 32LL;
      v111[1] = 0xE100000000000000LL;
      v110[0] = 0LL;
      v110[1] = 0xE000000000000000LL;
      unint64_t v82 = sub_53D8();
      uint64_t v83 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( v111,  v110,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v82,  v82,  v82);
      uint64_t v85 = v84;
      swift_bridgeObjectRelease(v58);
      int v86 = (objc_class *)type metadata accessor for PhonemeString();
      os_log_t v87 = objc_allocWithZone(v86);
      uint64_t v88 = (uint64_t *)&v87[OBJC_IVAR___PhonemeString_symbols];
      *uint64_t v88 = v83;
      v88[1] = v85;
      v87[OBJC_IVAR___PhonemeString_encoding] = 3;
      uint64_t v89 = &v87[OBJC_IVAR___PhonemeString_boundary];
      *uint64_t v89 = 0LL;
      v89[1] = 0xE000000000000000LL;
      v109.receiver = v87;
      v109.super_class = v86;
      id v90 = objc_msgSendSuper2(&v109, "init", v99);
      goto LABEL_63;
    }

    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    sub_4F30(v10, (uint64_t)qword_4FC70);
    uint64_t v30 = swift_bridgeObjectRetain_n(a2, 2LL);
    os_log_type_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v34 = swift_slowAlloc(32LL, -1LL);
      uint64_t v119 = (os_log_s *)v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      swift_bridgeObjectRetain(a2);
      uint64_t v117 = sub_25824(a1, (unint64_t)a2, (uint64_t *)&v119);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, v118);
      swift_bridgeObjectRelease_n(a2, 3LL);
      _os_log_impl( &dword_0,  v31,  v32,  "Couldn't find contact for Siri's current pronunciation for contactID: %s",  v33,  0xCu);
      swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v34, -1LL, -1LL);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    uint64_t v119 = 0LL;
    unint64_t v120 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(38LL);
    swift_bridgeObjectRelease(v120);
    uint64_t v119 = (os_log_s *)0xD000000000000024LL;
    unint64_t v120 = 0x800000000003C140LL;
    v49._countAndFlagsBits = a1;
    v49._object = a2;
    String.append(_:)(v49);
    uint64_t v4 = v119;
    unint64_t v50 = v120;
    unint64_t v51 = sub_2B658();
    uint64_t v28 = swift_allocError(&type metadata for ContactPronunciationControllerError, v51, 0LL, 0LL);
    *__int128 v52 = v4;
    v52[1] = (os_log_s *)v50;
    goto LABEL_9;
  }

  return v4;
}

unint64_t sub_2B588(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_453B0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5) {
    return 5LL;
  }
  else {
    return v3;
  }
}

unint64_t sub_2B5D0()
{
  unint64_t result = qword_4BC18;
  if (!qword_4BC18)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A3BC, &type metadata for ContactPronunciationSource);
    atomic_store(result, (unint64_t *)&qword_4BC18);
  }

  return result;
}

unint64_t sub_2B614()
{
  unint64_t result = qword_4BC30;
  if (!qword_4BC30)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A36C, &type metadata for ContactPronunciationSource);
    atomic_store(result, (unint64_t *)&qword_4BC30);
  }

  return result;
}

unint64_t sub_2B658()
{
  unint64_t result = qword_4BC50;
  if (!qword_4BC50)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A174, &type metadata for ContactPronunciationControllerError);
    atomic_store(result, (unint64_t *)&qword_4BC50);
  }

  return result;
}

uint64_t sub_2B69C(uint64_t *a1)
{
  return sub_28EA8(a1) & 1;
}

uint64_t sub_2B6B8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t *sub_2B6D0(uint64_t *a1)
{
  return a1;
}

uint64_t sub_2B730( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    sub_E450(a3, a4, a5);
    sub_E450(a8, a9, a10);
    return sub_E450(a13, a14, a15);
  }

  return result;
}

unint64_t sub_2B804()
{
  unint64_t result = qword_4BC70;
  if (!qword_4BC70)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A0F4, &type metadata for ContactPronunciationInitialisationError);
    atomic_store(result, (unint64_t *)&qword_4BC70);
  }

  return result;
}

void *sub_2B848(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[3];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[8];
  uint64_t v8 = a1[7];
  uint64_t v6 = a1[9];
  uint64_t v10 = a1[13];
  uint64_t v11 = a1[12];
  uint64_t v9 = a1[14];
  swift_bridgeObjectRelease(a1[1]);
  sub_E450(v2, v3, v4);
  sub_E450(v8, v5, v6);
  sub_E450(v11, v10, v9);
  return a1;
}

double sub_2B914(uint64_t a1)
{
  *(_BYTE *)(a1 + 12sub_541C(v0 + 8) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 11sub_541C(v0 + 2) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 3sub_541C(v0 + 2) = 0u;
  *(_OWORD *)(a1 + 4sub_541C(v0 + 8) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_2B930( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2 != 1)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    return swift_bridgeObjectRelease(a8);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for ContactPronunciation.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2B9BC + 4 * byte_3A29B[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2B9F0 + 4 * byte_3A296[v4]))();
}

uint64_t sub_2B9F0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2B9F8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x2BA00LL);
  }
  return result;
}

uint64_t sub_2BA0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x2BA14LL);
  }
  *(_BYTE *)uint64_t result = a2 + 1;
  return result;
}

uint64_t sub_2BA18(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2BA20(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ContactPronunciation.CodingKeys()
{
  return &type metadata for ContactPronunciation.CodingKeys;
}

unint64_t sub_2BA40()
{
  unint64_t result = qword_4BC88;
  if (!qword_4BC88)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A554, &type metadata for ContactPronunciation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4BC88);
  }

  return result;
}

unint64_t sub_2BA88()
{
  unint64_t result = qword_4BC90;
  if (!qword_4BC90)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A4C4, &type metadata for ContactPronunciation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4BC90);
  }

  return result;
}

unint64_t sub_2BAD0()
{
  unint64_t result = qword_4BC98;
  if (!qword_4BC98)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A4EC, &type metadata for ContactPronunciation.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_4BC98);
  }

  return result;
}

uint64_t sub_2BB14(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x53656D656E6F6870LL && a2 == 0xED0000676E697274LL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x53656D656E6F6870LL, 0xED0000676E697274LL, a1, a2, 0LL) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0LL;
  }

  else if (a1 == 0x656372756F73LL && a2 == 0xE600000000000000LL)
  {
    swift_bridgeObjectRelease(0xE600000000000000LL);
    return 1LL;
  }

  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)(0x656372756F73LL, 0xE600000000000000LL, a1, a2, 0LL);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0) {
      return 1LL;
    }
    else {
      return 2LL;
    }
  }

uint64_t sub_2BC0C(uint64_t *a1)
{
  return sub_2B69C(a1) & 1;
}

uint64_t sub_2BC24(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0LL;
  }
  uint64_t v7 = a3[4];
  uint64_t v8 = a3[5];
  if (v7 == a1 && v8 == a2) {
    return 1LL;
  }
  uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0LL);
  if ((result & 1) != 0) {
    return 1LL;
  }
  if (v3 == 1) {
    return 0LL;
  }
  uint64_t v11 = a3 + 7;
  for (uint64_t i = 1LL; ; ++i)
  {
    uint64_t v13 = i + 1;
    if (__OFADD__(i, 1LL)) {
      break;
    }
    uint64_t v14 = *(v11 - 1);
    uint64_t v15 = *v11;
    BOOL v16 = v14 == a1 && v15 == a2;
    if (v16 || (_stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0LL) & 1) != 0) {
      return 1LL;
    }
    uint64_t result = 0LL;
    v11 += 2;
    if (v13 == v3) {
      return result;
    }
  }

  __break(1u);
  return result;
}

void *sub_2BCE8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_337B0(0, v1, 0);
    uint64_t v3 = (void *)(a1 + 56);
    do
    {
      uint64_t v4 = *(v3 - 3);
      uint64_t v5 = *(v3 - 2);
      uint64_t v6 = *(v3 - 1);
      uint64_t v7 = *v3;
      __n128 v8 = swift_bridgeObjectRetain(*v3);
      uint64_t v9 = static String._fromSubstring(_:)(v4, v5, v6, v7, v8);
      uint64_t v11 = v10;
      swift_bridgeObjectRelease(v7);
      unint64_t v13 = _swiftEmptyArrayStorage[2];
      unint64_t v12 = _swiftEmptyArrayStorage[3];
      if (v13 >= v12 >> 1) {
        sub_337B0(v12 > 1, v13 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v13 + 1;
      uint64_t v14 = &_swiftEmptyArrayStorage[2 * v13];
      v14[4] = v9;
      void v14[5] = v11;
      v3 += 4;
      --v1;
    }

    while (v1);
  }

  return _swiftEmptyArrayStorage;
}

uint64_t sub_2BDE4(char a1)
{
  return *(void *)&aNvasr_6[8 * a1];
}

uint64_t sub_2BE04(char *a1, char *a2)
{
  return sub_27D54(*a1, *a2);
}

Swift::Int sub_2BE10()
{
  return sub_28234(*v0);
}

uint64_t sub_2BE18(uint64_t a1)
{
  return sub_2829C(a1, *v1);
}

Swift::Int sub_2BE20(uint64_t a1)
{
  return sub_285DC(a1, *v1);
}

unint64_t sub_2BE28@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_33604(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_2BE54@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2BDE4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_2BE7C(void *a1@<X8>)
{
  *a1 = &off_454E0;
}

uint64_t sub_2BE8C(uint64_t a1, char a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
LABEL_54:
    LOBYTE(v4sub_541C(v0 + 7) = 2;
    uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Must take zero or more splits",  29LL,  2LL,  "Swift/Collection.swift",  22LL,  v47,  1552LL,  0);
    __break(1u);
  }

  else
  {
    uint64_t v8 = swift_allocObject(&unk_46DF8, 24LL, 7LL);
    *(void *)(v8 + 16) = _swiftEmptyArrayStorage;
    uint64_t v9 = swift_allocObject(&unk_46DD0, 24LL, 7LL);
    uint64_t v10 = v9;
    *(void *)(v9 + 16) = 15LL;
    unint64_t v11 = a4 >> 60;
    uint64_t v12 = HIBYTE(a4) & 0xF;
    if (a1)
    {
      uint64_t v13 = (a4 & 0x2000000000000000LL) != 0 ? HIBYTE(a4) & 0xF : a3 & 0xFFFFFFFFFFFFLL;
      if (v13)
      {
        uint64_t v49 = a1;
        BOOL v14 = (v11 & ((a3 & 0x800000000000000LL) == 0)) == 0;
        uint64_t v15 = 7LL;
        if (!v14) {
          uint64_t v15 = 11LL;
        }
        uint64_t v48 = v15 | (v13 << 16);
        unint64_t v54 = 4 * v13;
        BOOL v16 = _swiftEmptyArrayStorage;
        unint64_t v17 = 15LL;
        unint64_t v18 = 15LL;
        unint64_t v50 = (void *)a3;
        uint64_t v51 = v9;
        while (1)
        {
          uint64_t v19 = String.subscript.getter(v17, a3, a4);
          unint64_t v21 = v20;
          if (!((v20 & 0x2000000000000000LL) != 0 ? HIBYTE(v20) & 0xF : v19 & 0xFFFFFFFFFFFFLL)) {
            break;
          }
          if ((v20 & 0x1000000000000000LL) != 0)
          {
            uint64_t v24 = _StringGuts.foreignErrorCorrectedScalar(startingAt:)(0LL, v19, v20);
          }

          else
          {
            if ((v20 & 0x2000000000000000LL) != 0)
            {
              v53[0] = v19;
              v53[1] = v20 & 0xFFFFFFFFFFFFFFLL;
              unint64_t v23 = v53;
            }

            else if ((v19 & 0x1000000000000000LL) != 0)
            {
              unint64_t v23 = (void *)((v20 & 0xFFFFFFFFFFFFFFFLL) + 32);
            }

            else
            {
              unint64_t v23 = (void *)_StringObject.sharedUTF8.getter(v19, v20);
            }

            uint64_t v24 = _decodeScalar(_:startingAt:)(v23);
          }

          uint64_t v4 = v24;
          swift_bridgeObjectRelease(v21);
          if ((v4 - 14) > 0xFFFFFFFB || (v4 - 8232) < 2 || (_DWORD)v4 == 133)
          {
            if (v18 >> 14 == v17 >> 14 && (a2 & 1) != 0)
            {
              unint64_t v17 = String.index(after:)(v17, a3, a4);
              *(void *)(v10 + 16) = v17;
              unint64_t v18 = v17;
            }

            else
            {
              if (v17 >> 14 < v18 >> 14) {
                goto LABEL_53;
              }
              unint64_t v25 = a3;
              unint64_t v26 = a4;
              uint64_t v27 = String.subscript.getter(v18, v17, v25, a4);
              uint64_t v29 = v28;
              uint64_t v31 = v30;
              uint64_t v4 = v32;
              if ((swift_isUniquelyReferenced_nonNull_native(v16) & 1) == 0) {
                BOOL v16 = sub_1446C(0LL, v16[2] + 1LL, 1, v16);
              }
              uint64_t v33 = v16;
              unint64_t v34 = v16[2];
              unint64_t v35 = v33;
              unint64_t v36 = v33[3];
              if (v34 >= v36 >> 1) {
                unint64_t v35 = sub_1446C((void *)(v36 > 1), v34 + 1, 1, v35);
              }
              v35[2] = v34 + 1;
              uint64_t v37 = &v35[4 * v34];
              BOOL v16 = v35;
              v37[4] = v27;
              v37[5] = v29;
              v37[6] = v31;
              v37[7] = v4;
              *(void *)(v8 + 16) = v35;
              a4 = v26;
              a3 = (unint64_t)v50;
              unint64_t v18 = String.index(after:)(v17, v50, a4);
              uint64_t v10 = v51;
              *(void *)(v51 + 16) = v18;
              unint64_t v17 = v18;
              if (v16[2] == v49)
              {
LABEL_42:
                if (v54 == v18 >> 14 && (a2 & 1) != 0)
                {
                  swift_bridgeObjectRelease(a4);
                  goto LABEL_50;
                }

                if (v54 < v18 >> 14)
                {
LABEL_53:
                  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Range requires lowerBound <= upperBound",  39LL,  2LL,  "Swift/Range.swift",  17LL,  2,  754LL,  0);
                  __break(1u);
                  goto LABEL_54;
                }

                unint64_t v39 = a3;
                a3 = (unint64_t)v16;
                unint64_t v18 = String.subscript.getter(v18, v48, v39, a4);
                unint64_t v21 = v40;
                BOOL v16 = v41;
                uint64_t v4 = v42;
                swift_bridgeObjectRelease(a4);
                if ((swift_isUniquelyReferenced_nonNull_native(a3) & 1) != 0)
                {
LABEL_47:
                  unint64_t v44 = *(void *)(a3 + 16);
                  unint64_t v43 = *(void *)(a3 + 24);
                  if (v44 >= v43 >> 1) {
                    a3 = (unint64_t)sub_1446C((void *)(v43 > 1), v44 + 1, 1, (void *)a3);
                  }
                  *(void *)(a3 + 16) = v44 + 1;
                  unint64_t v45 = (void *)(a3 + 32 * v44);
                  v45[4] = v18;
                  v45[5] = v21;
                  v45[6] = v16;
                  v45[7] = v4;
                  BOOL v16 = (void *)a3;
                  *(void *)(v8 + 16) = a3;
                  uint64_t v10 = v51;
                  goto LABEL_50;
                }

LABEL_52:
                a3 = (unint64_t)sub_1446C(0LL, *(void *)(a3 + 16) + 1LL, 1, (void *)a3);
                goto LABEL_47;
              }
            }
          }

          else
          {
            unint64_t v17 = String.index(after:)(v17, a3, a4);
          }

          if (v54 == v17 >> 14) {
            goto LABEL_42;
          }
        }

        __break(1u);
        goto LABEL_52;
      }
    }

    if ((a4 & 0x2000000000000000LL) == 0) {
      uint64_t v12 = a3 & 0xFFFFFFFFFFFFLL;
    }
    BOOL v14 = (v11 & ((a3 & 0x800000000000000LL) == 0)) == 0;
    uint64_t v38 = 7LL;
    if (!v14) {
      uint64_t v38 = 11LL;
    }
    sub_2DB50(v38 | (v12 << 16), v9, a2 & 1, v8);
    swift_bridgeObjectRelease(a4);
    BOOL v16 = *(void **)(v8 + 16);
LABEL_50:
    swift_bridgeObjectRetain(v16);
    swift_release(v8);
    swift_release(v10);
    return (uint64_t)v16;
  }

  return result;
}

uint64_t sub_2C35C( uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  v56[3] = a4;
  if (a1 < 0) {
    goto LABEL_35;
  }
  uint64_t v14 = swift_allocObject(&unk_46DA8, 24LL, 7LL);
  *(void *)(v14 + 16) = _swiftEmptyArrayStorage;
  uint64_t v53 = swift_allocObject(&unk_46DD0, 24LL, 7LL);
  *(void *)(v53 + 16) = a5;
  if (!a1 || (unint64_t v54 = a6 >> 14, a6 >> 14 == a5 >> 14))
  {
    sub_2DCA8(a6, v53, a2 & 1, v14);
    swift_bridgeObjectRelease(a8);
    a6 = *(void *)(v14 + 16);
    swift_bridgeObjectRetain(a6);
    swift_release(v14);
    uint64_t v15 = v53;
LABEL_5:
    swift_release(v15);
    return a6;
  }

  uint64_t v44 = a1;
  uint64_t v45 = v14;
  __int128 v52 = _swiftEmptyArrayStorage;
  unint64_t v17 = a5;
  unint64_t v18 = a5;
  unint64_t v49 = a5;
  while (1)
  {
    uint64_t v19 = Substring.subscript.getter(v17, a5, a6, a7, a8);
    uint64_t v21 = v20;
    v56[0] = v19;
    v56[1] = v20;
    char v22 = a3(v56);
    if (v8)
    {
      swift_release(v45);
      swift_release(v53);
      swift_bridgeObjectRelease(v21);
      swift_bridgeObjectRelease(a8);
      return a6;
    }

    char v23 = v22;
    swift_bridgeObjectRelease(v21);
    if ((v23 & 1) != 0) {
      break;
    }
    unint64_t v17 = Substring.index(after:)(v17, a5, a6, a7, a8);
LABEL_9:
    if (v54 == v17 >> 14) {
      goto LABEL_24;
    }
  }

  if (v18 >> 14 == v17 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v17 = Substring.index(after:)(v17, a5, a6, a7, a8);
    *(void *)(v53 + 16) = v17;
    unint64_t v18 = v17;
    unint64_t v49 = v17;
    goto LABEL_9;
  }

  if (v17 >> 14 < v18 >> 14) {
    goto LABEL_34;
  }
  uint64_t v24 = Substring.subscript.getter(v18, v17, a5, a6, a7, a8);
  uint64_t v48 = v25;
  uint64_t v50 = v24;
  uint64_t v46 = v27;
  uint64_t v47 = v26;
  if ((swift_isUniquelyReferenced_nonNull_native(v52) & 1) == 0) {
    __int128 v52 = sub_1446C(0LL, v52[2] + 1LL, 1, v52);
  }
  unint64_t v29 = v52[2];
  unint64_t v28 = v52[3];
  if (v29 >= v28 >> 1) {
    __int128 v52 = sub_1446C((void *)(v28 > 1), v29 + 1, 1, v52);
  }
  v52[2] = v29 + 1;
  uint64_t v30 = &v52[4 * v29];
  v30[4] = v50;
  v30[5] = v48;
  v30[6] = v47;
  v30[7] = v46;
  *(void *)(v45 + 16) = v52;
  uint64_t v31 = Substring.index(after:)(v17, a5, a6, a7, a8);
  unint64_t v17 = v31;
  *(void *)(v53 + 16) = v31;
  if (v52[2] != v44)
  {
    unint64_t v18 = v31;
    unint64_t v49 = v31;
    goto LABEL_9;
  }

  unint64_t v49 = v31;
  unint64_t v18 = v31;
LABEL_24:
  if (v54 == v18 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease(a8);
    uint64_t v32 = v45;
    a6 = (unint64_t)v52;
LABEL_33:
    swift_bridgeObjectRetain(a6);
    swift_release(v32);
    uint64_t v15 = v53;
    goto LABEL_5;
  }

  if (v54 >= v49 >> 14)
  {
    uint64_t v33 = Substring.subscript.getter(v49, a6, a5, a6, a7, a8);
    uint64_t v35 = v34;
    uint64_t v37 = v36;
    uint64_t v39 = v38;
    swift_bridgeObjectRelease(a8);
    a6 = (unint64_t)v52;
    if ((swift_isUniquelyReferenced_nonNull_native(v52) & 1) == 0) {
      a6 = (unint64_t)sub_1446C(0LL, v52[2] + 1LL, 1, v52);
    }
    unint64_t v41 = *(void *)(a6 + 16);
    unint64_t v40 = *(void *)(a6 + 24);
    if (v41 >= v40 >> 1) {
      a6 = (unint64_t)sub_1446C((void *)(v40 > 1), v41 + 1, 1, (void *)a6);
    }
    *(void *)(a6 + 16) = v41 + 1;
    uint64_t v42 = (void *)(a6 + 32 * v41);
    v42[4] = v33;
    _OWORD v42[5] = v35;
    v42[6] = v37;
    v42[7] = v39;
    uint64_t v32 = v45;
    *(void *)(v45 + 16) = a6;
    goto LABEL_33;
  }

LABEL_34:
  _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Range requires lowerBound <= upperBound",  39LL,  2LL,  "Swift/Range.swift",  17LL,  2,  754LL,  0);
  __break(1u);
LABEL_35:
  LOBYTE(v43) = 2;
  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Must take zero or more splits",  29LL,  2LL,  "Swift/Collection.swift",  22LL,  v43,  1552LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_2C7F8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0LL;
  }
  uint64_t v7 = a3[4];
  uint64_t v8 = a3[5];
  BOOL v9 = v7 == a1 && v8 == a2;
  if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, a1, a2, 0LL) & 1) != 0) {
    return 0LL;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = a3 + 7;
  uint64_t v13 = 1LL;
  while (1)
  {
    if (v3 == v13) {
      return 0LL;
    }
    ++v11;
    uint64_t v14 = *(v12 - 1);
    uint64_t v15 = *v12;
    if (v14 == a1 && v15 == a2) {
      break;
    }
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)(v14, v15, a1, a2, 0LL);
    uint64_t result = v13++;
    v12 += 2;
    if ((v17 & 1) != 0) {
      return result;
    }
  }

  return v11;
}

void sub_2C8DC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  uint64_t v7 = a1[2];
  uint64_t v8 = a1[3];
  v44[0] = 44LL;
  v44[1] = 0xE100000000000000LL;
  int v43 = v44;
  swift_bridgeObjectRetain(v8);
  uint64_t v9 = sub_2C35C(0x7FFFFFFFFFFFFFFFLL, 0, sub_3343C, (uint64_t)v42, v5, v6, v7, v8);
  uint64_t v10 = sub_2BCE8(v9);
  swift_bridgeObjectRelease(v9);
  uint64_t v11 = *a2;
  uint64_t v41 = *a2 + 64;
  uint64_t v12 = 1LL << *(_BYTE *)(*a2 + 32);
  uint64_t v13 = -1LL;
  if (v12 < 64) {
    uint64_t v13 = ~(-1LL << v12);
  }
  unint64_t v14 = v13 & *(void *)(*a2 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v38 = v10;
  uint64_t v36 = v10 + 4;
  swift_bridgeObjectRetain(v11);
  int64_t v16 = 0LL;
  uint64_t v37 = v11;
  int64_t v39 = v15;
  while (1)
  {
    while (v14)
    {
      unint64_t v17 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v18 = v17 | (v16 << 6);
      if (*(void *)(a3 + 16))
      {
LABEL_23:
        char v22 = *(_BYTE *)(*(void *)(v11 + 48) + v18);
        unint64_t v23 = sub_2DE4C(v22);
        if ((v24 & 1) != 0)
        {
          unint64_t v25 = *(void *)(*(void *)(a3 + 56) + 8 * v23);
          uint64_t v27 = sub_2CC24(v44, v22);
          unint64_t v28 = *v26;
          if (*v26)
          {
            if ((v25 & 0x8000000000000000LL) != 0) {
              goto LABEL_38;
            }
            if (v25 >= v38[2]) {
              goto LABEL_39;
            }
            unint64_t v29 = v26;
            uint64_t v30 = &v36[2 * v25];
            uint64_t v31 = v30[1];
            uint64_t v40 = *v30;
            swift_bridgeObjectRetain(v31);
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v28);
            *unint64_t v29 = v28;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              unint64_t v28 = sub_14684(0LL, v28[2] + 1LL, 1, v28);
              *unint64_t v29 = v28;
            }

            unint64_t v34 = v28[2];
            unint64_t v33 = v28[3];
            if (v34 >= v33 >> 1)
            {
              unint64_t v28 = sub_14684((void *)(v33 > 1), v34 + 1, 1, v28);
              *unint64_t v29 = v28;
            }

            v28[2] = v34 + 1;
            uint64_t v35 = &v28[2 * v34];
            v35[4] = v40;
            v35[5] = v31;
            ((void (*)(void *, void))v27)(v44, 0LL);
            uint64_t v11 = v37;
            int64_t v15 = v39;
          }

          else
          {
            ((void (*)(void *, void))v27)(v44, 0LL);
            int64_t v15 = v39;
          }
        }
      }
    }

    if (__OFADD__(v16++, 1LL))
    {
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v16 >= v15) {
      goto LABEL_36;
    }
    unint64_t v20 = *(void *)(v41 + 8 * v16);
    if (!v20) {
      break;
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v16 << 6);
    if (*(void *)(a3 + 16)) {
      goto LABEL_23;
    }
  }

  int64_t v21 = v16 + 1;
  if (v16 + 1 >= v15) {
    goto LABEL_36;
  }
  unint64_t v20 = *(void *)(v41 + 8 * v21);
  if (v20) {
    goto LABEL_21;
  }
  int64_t v21 = v16 + 2;
  if (v16 + 2 >= v15) {
    goto LABEL_36;
  }
  unint64_t v20 = *(void *)(v41 + 8 * v21);
  if (v20) {
    goto LABEL_21;
  }
  int64_t v21 = v16 + 3;
  if (v16 + 3 >= v15) {
    goto LABEL_36;
  }
  unint64_t v20 = *(void *)(v41 + 8 * v21);
  if (v20) {
    goto LABEL_21;
  }
  int64_t v21 = v16 + 4;
  if (v16 + 4 >= v15) {
    goto LABEL_36;
  }
  unint64_t v20 = *(void *)(v41 + 8 * v21);
  if (v20) {
    goto LABEL_21;
  }
  int64_t v21 = v16 + 5;
  if (v16 + 5 >= v15)
  {
LABEL_36:
    swift_bridgeObjectRelease(v38);
    swift_release(v11);
    return;
  }

  unint64_t v20 = *(void *)(v41 + 8 * v21);
  if (v20)
  {
LABEL_21:
    int64_t v16 = v21;
    goto LABEL_22;
  }

  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      break;
    }
    if (v16 >= v15) {
      goto LABEL_36;
    }
    unint64_t v20 = *(void *)(v41 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }

void (*sub_2CC24(void *a1, char a2))(void *a1)
{
  uint64_t v4 = malloc(0x28uLL);
  *a1 = v4;
  void v4[4] = sub_3191C(v4, a2);
  return sub_2CC70;
}

void sub_2CC70(void *a1)
{
  int64_t v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 32LL))(*a1, 0LL);
  free(v1);
}

void *sub_2CCA0(uint64_t a1, void *a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  if (!*(void *)(a6 + 16) || (unint64_t v11 = sub_2DE4C(a3), (v12 & 1) == 0))
  {
    uint64_t v61 = 0LL;
    unint64_t v62 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(28LL);
    v20._countAndFlagsBits = 0x74276E646C756F43LL;
    v20._object = (void *)0xEE0020646E696620LL;
    String.append(_:)(v20);
    LOBYTE(v60[0]) = a3;
LABEL_28:
    _print_unlocked<A, B>(_:_:)( v60,  &v61,  &type metadata for Phoneset.Key,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v35._countAndFlagsBits = 0x6E6F6870206E6920LL;
    v35._object = (void *)0xEC00000074657365LL;
    String.append(_:)(v35);
LABEL_29:
    uint64_t v37 = v61;
    uint64_t v36 = (void *)v62;
    unint64_t v38 = sub_2DE08();
    uint64_t v39 = swift_allocError(&type metadata for PhonemesMapperError, v38, 0LL, 0LL);
    *(void *)uint64_t v40 = v37;
    *(void *)(v40 + sub_541C(v0 + 8) = v36;
    *(_BYTE *)(v40 + 16) = 1;
    swift_willThrow(v39);
    return v36;
  }

  if (!*(void *)(a6 + 16))
  {
LABEL_27:
    uint64_t v61 = 0LL;
    unint64_t v62 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(28LL);
    v34._countAndFlagsBits = 0x74276E646C756F43LL;
    v34._object = (void *)0xEE0020646E696620LL;
    String.append(_:)(v34);
    LOBYTE(v60[0]) = a4;
    goto LABEL_28;
  }

  uint64_t v13 = *(void **)(*(void *)(a6 + 56) + 8 * v11);
  swift_bridgeObjectRetain(v13);
  unint64_t v14 = sub_2DE4C(a4);
  if ((v15 & 1) == 0)
  {
    swift_bridgeObjectRelease(v13);
    goto LABEL_27;
  }

  uint64_t v16 = *(void *)(*(void *)(a6 + 56) + 8 * v14);
  if ((sub_2BC24(a1, (uint64_t)a2, v13) & 1) == 0)
  {
    swift_bridgeObjectRelease(v13);
    uint64_t v61 = 0LL;
    unint64_t v62 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(41LL);
    v42._countAndFlagsBits = 0x74276E646C756F43LL;
    v42._object = (void *)0xEE0020646E696620LL;
    String.append(_:)(v42);
    v43._countAndFlagsBits = a1;
    v43._object = a2;
    String.append(_:)(v43);
    v44._object = (void *)0x800000000003C3C0LL;
    v44._countAndFlagsBits = 0xD000000000000017LL;
    String.append(_:)(v44);
    LOBYTE(v60[0]) = a3;
    _print_unlocked<A, B>(_:_:)( v60,  &v61,  &type metadata for Phoneset.Key,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    goto LABEL_29;
  }

  uint64_t v57 = v13[2];
  if (!v57)
  {
    swift_bridgeObjectRetain(v16);
    swift_bridgeObjectRelease(v13);
    uint64_t v19 = _swiftEmptyArrayStorage;
    int64_t v45 = _swiftEmptyArrayStorage[2];
    if (v45) {
      goto LABEL_33;
    }
    goto LABEL_39;
  }

  uint64_t v55 = v16;
  swift_bridgeObjectRetain(v16);
  uint64_t v17 = 0LL;
  unint64_t v54 = v13;
  unint64_t v18 = v13 + 5;
  uint64_t v19 = _swiftEmptyArrayStorage;
  uint64_t v56 = a1;
  do
  {
    uint64_t v22 = *(v18 - 1);
    unint64_t v21 = *v18;
    if ((a5 & 1) != 0)
    {
      swift_bridgeObjectRetain_n(*v18, 2LL);
      uint64_t v23 = v22;
      char v24 = (void *)v21;
    }

    else
    {
      uint64_t v61 = (void *)*(v18 - 1);
      unint64_t v62 = v21;
      v60[0] = 42LL;
      v60[1] = 0xE100000000000000LL;
      v59[0] = 0LL;
      v59[1] = 0xE000000000000000LL;
      unint64_t v25 = sub_53D8();
      swift_bridgeObjectRetain(v21);
      uint64_t v23 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( v60,  v59,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v25,  v25,  v25);
      char v24 = v26;
    }

    uint64_t v27 = a5;
    if (v23 == a1 && v24 == a2)
    {
      swift_bridgeObjectRelease(a2);
    }

    else
    {
      char v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, a1, a2, 0LL);
      swift_bridgeObjectRelease(v24);
      if ((v29 & 1) == 0)
      {
        swift_bridgeObjectRelease(v21);
        goto LABEL_10;
      }
    }

    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v19);
    unint64_t v63 = v19;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_33804(0, v19[2] + 1LL, 1);
      uint64_t v19 = v63;
    }

    unint64_t v32 = v19[2];
    unint64_t v31 = v19[3];
    if (v32 >= v31 >> 1)
    {
      sub_33804(v31 > 1, v32 + 1, 1);
      uint64_t v19 = v63;
    }

    v19[2] = v32 + 1;
    unint64_t v33 = &v19[3 * v32];
    v33[4] = v17;
    v33[5] = v22;
    v33[6] = v21;
    a1 = v56;
LABEL_10:
    v18 += 2;
    ++v17;
    a5 = v27;
  }

  while (v57 != v17);
  swift_bridgeObjectRelease(v54);
  uint64_t v16 = v55;
  int64_t v45 = v19[2];
  if (!v45)
  {
LABEL_39:
    swift_release(v19);
    uint64_t v46 = _swiftEmptyArrayStorage;
    goto LABEL_40;
  }

uint64_t sub_2D1DC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v4 = *(void *)result;
  if ((*(void *)result & 0x8000000000000000LL) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }

  if (v4 >= *(void *)(a2 + 16))
  {
LABEL_9:
    __break(1u);
    return result;
  }

  uint64_t v5 = a2 + 16 * v4;
  uint64_t v7 = *(void *)(v5 + 32);
  uint64_t v6 = *(void *)(v5 + 40);
  void v12[2] = v7;
  v12[3] = v6;
  v12[0] = 42LL;
  v12[1] = 0xE100000000000000LL;
  v11[0] = 0LL;
  v11[1] = 0xE000000000000000LL;
  unint64_t v8 = sub_53D8();
  uint64_t result = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)( v12,  v11,  0LL,  0LL,  0LL,  1LL,  &type metadata for String,  &type metadata for String,  &type metadata for String,  v8,  v8,  v8);
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000LL) == 0) {
    uint64_t v10 = result & 0xFFFFFFFFFFFFLL;
  }
  if (!v10)
  {
    swift_bridgeObjectRelease(v9);
    uint64_t result = 0LL;
    unint64_t v9 = 0LL;
  }

  *a3 = result;
  a3[1] = v9;
  return result;
}

uint64_t sub_2D2AC()
{
  uint64_t v0 = type metadata accessor for CharacterSet(0LL);
  sub_32618(v0, qword_4BCA0);
  sub_4F30(v0, (uint64_t)qword_4BCA0);
  return CharacterSet.init(charactersIn:)(0xD000000000000030LL, 0x800000000003C3E0LL);
}

uint64_t sub_2D30C(_BYTE *a1, uint64_t a2, char a3)
{
  uint64_t v5 = v4;
  uint64_t v9 = type metadata accessor for Logger(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  char v12 = (char *)&v89 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v13 = a1[OBJC_IVAR___PhonemeString_encoding];
  if ((sub_27FD8(v13, a2) & 1) != 0)
  {
    uint64_t v102 = a1;
    char v14 = a2;
    uint64_t v95 = v4;
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v15 = sub_4F30(v9, (uint64_t)qword_4FC70);
    uint64_t v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v15, v9);
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      Swift::String v20 = (void *)swift_slowAlloc(32LL, -1LL);
      uint64_t v101 = (uint64_t)v20;
      *(_DWORD *)uint64_t v19 = 136315138;
      uint64_t v21 = 8LL * v14;
      uint64_t v22 = *(void *)&aNvasr_7[v21];
      uint64_t v105 = v20;
      unint64_t v23 = *(void *)((char *)&unk_3A860 + v21);
      uint64_t v107 = sub_25824(v22, v23, (uint64_t *)&v105);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108);
      swift_bridgeObjectRelease(v23);
      _os_log_impl(&dword_0, v17, v18, "Source encoding is same as target phoneme format: %s", v19, 0xCu);
      uint64_t v24 = v101;
      swift_arrayDestroy(v101, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1LL, -1LL);
      swift_slowDealloc(v19, -1LL, -1LL);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v25 = sub_501C(&qword_4ABB0);
    uint64_t inited = (void *)swift_initStackObject(v25, v103);
    *((_OWORD *)inited + 1) = xmmword_38B20;
    uint64_t v27 = v102;
    inited[4] = v102;
    uint64_t v105 = inited;
    specialized Array._endMutation()();
    uint64_t v28 = (uint64_t)v105;
    id v29 = v27;
    uint64_t v5 = sub_324B0(v28);
    uint64_t v30 = (void *)v28;
LABEL_7:
    swift_bridgeObjectRelease(v30);
    return v5;
  }

  uint64_t v31 = *(void *)(v3 + 16);
  if (!v31)
  {
    unint64_t v37 = sub_2DE08();
    uint64_t v38 = swift_allocError(&type metadata for PhonemesMapperError, v37, 0LL, 0LL);
    *(void *)uint64_t v39 = 0xD000000000000023LL;
    *(void *)(v39 + sub_541C(v0 + 8) = 0x800000000003C2D0LL;
    *(_BYTE *)(v39 + 16) = 0;
LABEL_13:
    swift_willThrow(v38);
    return v5;
  }

  unint64_t v32 = sub_1626C();
  swift_bridgeObjectRetain(v31);
  unint64_t v33 = sub_31FCC((uint64_t)v32, v31, v13, a2, a3 & 1);
  swift_bridgeObjectRelease(v32);
  swift_bridgeObjectRelease(v31);
  if (v4) {
    return v5;
  }
  if (!v33[2])
  {
    swift_bridgeObjectRelease(v33);
    uint64_t v105 = 0LL;
    unint64_t v106 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(53LL);
    v40._countAndFlagsBits = 0xD000000000000025LL;
    v40._object = (void *)0x800000000003C300LL;
    String.append(_:)(v40);
    LOBYTE(v10sub_541C(v0 + 7) = v13;
    _print_unlocked<A, B>(_:_:)( &v107,  &v105,  &type metadata for Phoneset.Key,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    v41._countAndFlagsBits = 32LL;
    v41._object = (void *)0xE100000000000000LL;
    String.append(_:)(v41);
    id v42 = [a1 description];
    uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(v42);
    int64_t v45 = v44;

    v46._countAndFlagsBits = v43;
    v46._object = v45;
    String.append(_:)(v46);
    swift_bridgeObjectRelease(v45);
    v47._countAndFlagsBits = 0x3A74656772617420LL;
    v47._object = (void *)0xE900000000000020LL;
    String.append(_:)(v47);
    LOBYTE(v10sub_541C(v0 + 7) = a2;
    _print_unlocked<A, B>(_:_:)( &v107,  &v105,  &type metadata for Phoneset.Key,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    uint64_t v48 = v105;
    unint64_t v49 = v106;
    unint64_t v50 = sub_2DE08();
    uint64_t v38 = swift_allocError(&type metadata for PhonemesMapperError, v50, 0LL, 0LL);
    *(void *)uint64_t v51 = v48;
    *(void *)(v51 + sub_541C(v0 + 8) = v49;
    *(_BYTE *)(v51 + 16) = 1;
    goto LABEL_13;
  }

  Swift::String v34 = (void *)v33[4];
  swift_bridgeObjectRetain(v34);
  uint64_t result = sub_3213C(a2, v31);
  uint64_t v52 = v36;
  uint64_t v91 = v33 + 4;
  uint64_t v53 = v33[2];
  uint64_t v95 = 0LL;
  uint64_t v101 = result;
  uint64_t v102 = v36;
  if (v53 == 1)
  {
    uint64_t v72 = v33;
LABEL_39:
    swift_bridgeObjectRelease(v72);
    uint64_t v73 = v34[2];
    if (v73)
    {
      uint64_t v105 = _swiftEmptyArrayStorage;
      specialized ContiguousArray.reserveCapacity(_:)(v73);
      uint64_t v74 = (objc_class *)type metadata accessor for PhonemeString();
      uint64_t v92 = v34;
      char v75 = v34 + 5;
      uint64_t v76 = v101;
      do
      {
        uint64_t v78 = *(v75 - 1);
        uint64_t v77 = *v75;
        uint64_t v79 = objc_allocWithZone(v74);
        uint64_t v80 = &v79[OBJC_IVAR___PhonemeString_symbols];
        *uint64_t v80 = v78;
        v80[1] = v77;
        v79[OBJC_IVAR___PhonemeString_encoding] = a2;
        char v81 = (uint64_t *)&v79[OBJC_IVAR___PhonemeString_boundary];
        *char v81 = v76;
        v81[1] = (uint64_t)v52;
        v104.receiver = v79;
        v104.super_class = v74;
        swift_bridgeObjectRetain(v77);
        *(void *)&double v82 = swift_bridgeObjectRetain(v52).n128_u64[0];
        id v83 = objc_msgSendSuper2(&v104, "init", v82);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        uint64_t v84 = a2;
        uint64_t v85 = v105[2];
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v85);
        uint64_t v86 = v85;
        a2 = v84;
        uint64_t v52 = v102;
        uint64_t v87 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v86, v83);
        specialized ContiguousArray._endMutation()(v87);
        v75 += 2;
        --v73;
      }

      while (v73);
      uint64_t v88 = v105;
      swift_bridgeObjectRelease(v52);
      swift_bridgeObjectRelease(v92);
    }

    else
    {
      swift_bridgeObjectRelease(v52);
      swift_bridgeObjectRelease(v34);
      uint64_t v88 = _swiftEmptyArrayStorage;
    }

    uint64_t v5 = sub_324B0((uint64_t)v88);
    uint64_t v30 = v88;
    goto LABEL_7;
  }

  uint64_t v93 = v33;
  if (v53)
  {
    unint64_t v54 = 1LL;
    uint64_t v55 = v91;
    uint64_t v89 = a2;
    uint64_t v90 = v53;
    while (v54 != v53)
    {
      if (v54 >= v93[2]) {
        goto LABEL_46;
      }
      uint64_t v56 = v55[v54];
      if (*(void *)(v56 + 16))
      {
        unint64_t v94 = v54;
        uint64_t v99 = v34[2];
        if (v99)
        {
          uint64_t v97 = v34 + 4;
          swift_bridgeObjectRetain(v56);
          uint64_t v92 = v34;
          swift_bridgeObjectRetain(v34);
          uint64_t v57 = 0LL;
          uint64_t v96 = (void **)(v56 + 40);
          Swift::String v34 = _swiftEmptyArrayStorage;
          uint64_t v98 = v56;
          do
          {
            uint64_t v58 = *(void *)(v56 + 16);
            if (v58)
            {
              uint64_t v100 = v57;
              uint64_t v59 = &v97[2 * v57];
              unint64_t v60 = (void *)*v59;
              unint64_t v61 = v59[1];
              swift_bridgeObjectRetain(v56);
              swift_bridgeObjectRetain(v61);
              unint64_t v62 = v96;
              do
              {
                uint64_t v64 = (uint64_t)*(v62 - 1);
                unint64_t v63 = *v62;
                uint64_t v105 = v60;
                unint64_t v106 = v61;
                swift_bridgeObjectRetain(v61);
                swift_bridgeObjectRetain(v63);
                v65._countAndFlagsBits = v101;
                v65._object = v52;
                String.append(_:)(v65);
                v66._countAndFlagsBits = v64;
                v66._object = v63;
                String.append(_:)(v66);
                swift_bridgeObjectRelease(v63);
                uint64_t v67 = v105;
                unint64_t v68 = v106;
                if ((swift_isUniquelyReferenced_nonNull_native(v34) & 1) == 0) {
                  Swift::String v34 = sub_14684(0LL, v34[2] + 1LL, 1, v34);
                }
                unint64_t v70 = v34[2];
                unint64_t v69 = v34[3];
                if (v70 >= v69 >> 1) {
                  Swift::String v34 = sub_14684((void *)(v69 > 1), v70 + 1, 1, v34);
                }
                v62 += 2;
                v34[2] = v70 + 1;
                unint64_t v71 = &v34[2 * v70];
                v71[4] = v67;
                v71[5] = v68;
                --v58;
                uint64_t v52 = v102;
              }

              while (v58);
              swift_bridgeObjectRelease(v61);
              uint64_t v56 = v98;
              swift_bridgeObjectRelease(v98);
              uint64_t v57 = v100;
            }

            ++v57;
          }

          while (v57 != v99);
          swift_bridgeObjectRelease(v56);
          uint64_t result = swift_bridgeObjectRelease_n(v92, 2LL);
          a2 = v89;
        }

        else
        {
          uint64_t result = swift_bridgeObjectRelease(v34);
          Swift::String v34 = _swiftEmptyArrayStorage;
        }

        uint64_t v55 = v91;
        uint64_t v53 = v90;
        unint64_t v54 = v94;
      }

      if (++v54 == v53)
      {
        uint64_t v72 = v93;
        goto LABEL_39;
      }
    }

    __break(1u);
LABEL_46:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_2DAFC()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for PhonemesMapper()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin14PhonemesMapper);
}

ValueMetadata *type metadata accessor for Phoneset()
{
  return &type metadata for Phoneset;
}

uint64_t sub_2DB50(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = String.subscript.getter();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    char v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v14);
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v14 = sub_1446C(0LL, v14[2] + 1LL, 1, v14);
      *(void *)(a4 + 16) = v14;
    }

    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      char v14 = sub_1446C((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }

    v14[2] = v17 + 1;
    os_log_type_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Range requires lowerBound <= upperBound",  39LL,  2LL,  "Swift/Range.swift",  17LL,  2,  754LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_2DCA8(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4 = *(void *)(a2 + 16) >> 14;
  int v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1) {
    return v5 ^ 1u;
  }
  if (a1 >> 14 >= v4)
  {
    uint64_t v7 = Substring.subscript.getter();
    uint64_t v9 = v8;
    uint64_t v11 = v10;
    uint64_t v13 = v12;
    char v14 = *(void **)(a4 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v14);
    *(void *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      char v14 = sub_1446C(0LL, v14[2] + 1LL, 1, v14);
      *(void *)(a4 + 16) = v14;
    }

    unint64_t v17 = v14[2];
    unint64_t v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      char v14 = sub_1446C((void *)(v16 > 1), v17 + 1, 1, v14);
      *(void *)(a4 + 16) = v14;
    }

    v14[2] = v17 + 1;
    os_log_type_t v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Range requires lowerBound <= upperBound",  39LL,  2LL,  "Swift/Range.swift",  17LL,  2,  754LL,  0);
  __break(1u);
  return result;
}

unint64_t sub_2DE08()
{
  unint64_t result = qword_4BD70;
  if (!qword_4BD70)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A1B4, &type metadata for PhonemesMapperError);
    atomic_store(result, (unint64_t *)&qword_4BD70);
  }

  return result;
}

unint64_t sub_2DE4C(char a1)
{
  uint64_t v3 = 8LL * a1;
  uint64_t v4 = *(void *)&aPhoneset_4[v3 + 8];
  String.hash(into:)(v7, *(void *)&aNvasr_6[v3], v4);
  swift_bridgeObjectRelease(v4);
  Swift::Int v5 = Hasher._finalize()();
  return sub_2E09C(a1, v5);
}

unint64_t sub_2DEC8(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_2E1AC(a1, a2, v5);
}

unint64_t sub_2DF2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  Swift::Int v9 = Hasher._finalize()();
  return sub_2E28C(a1, a2, a3, a4, v9);
}

unint64_t sub_2DFB0(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  uint64_t v6 = v5;
  Hasher.init(_seed:)(v9, v3);
  String.hash(into:)(v9, v4, v6);
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease(v6);
  return sub_2E538(a1, v7);
}

unint64_t sub_2E030(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v2 + 40);
  uint64_t v5 = type metadata accessor for Locale(0LL);
  uint64_t v6 = sub_1DC28( &qword_4BDA0,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
  uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(v4, v5, v6);
  return sub_2E6AC(a1, v7);
}

unint64_t sub_2E09C(char a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = 8LL * a1;
    uint64_t v7 = *(void *)&aNvasr_6[v6];
    uint64_t v8 = *(void *)&aPhoneset_4[v6 + 8];
    while (1)
    {
      uint64_t v9 = 8LL * *(char *)(*(void *)(v2 + 48) + v4);
      uint64_t v10 = *(void *)&aNvasr_6[v9];
      uint64_t v11 = *(void *)&aPhoneset_4[v9 + 8];
      if (v10 == v7 && v11 == v8) {
        break;
      }
      char v13 = _stringCompareWithSmolCheck(_:_:expecting:)( v10,  *(void *)&aPhoneset_4[8 * *(char *)(*(void *)(v2 + 48) + v4) + 8],  v7,  v8,  0LL);
      swift_bridgeObjectRelease(v11);
      swift_bridgeObjectRelease(v8);
      if ((v13 & 1) == 0)
      {
        unint64_t v4 = (v4 + 1) & v5;
        if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0) {
          continue;
        }
      }

      return v4;
    }

    swift_bridgeObjectRelease(*(void *)&aPhoneset_4[8 * *(char *)(*(void *)(v2 + 48) + v4) + 8]);
    swift_bridgeObjectRelease(v8);
  }

  return v4;
}

unint64_t sub_2E1AC(uint64_t a1, uint64_t a2, uint64_t a3)
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
        char v14 = (void *)(v9 + 16 * v6);
        uint64_t v15 = v14[1];
        BOOL v16 = *v14 == a1 && v15 == a2;
      }

      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0LL) & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_2E28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = -1LL << *(_BYTE *)(v5 + 32);
  unint64_t v7 = a5 & ~v6;
  uint64_t v30 = v5 + 64;
  if (((*(void *)(v5 + 64 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0)
  {
    uint64_t v29 = ~v6;
    do
    {
      uint64_t v8 = (uint64_t *)(*(void *)(v35 + 48) + 32 * v7);
      uint64_t v9 = *v8;
      uint64_t v10 = v8[1];
      uint64_t v11 = v8[2];
      uint64_t v12 = v8[3];
      Hasher.init(_seed:)(v37, 0LL);
      uint64_t v13 = sub_501C((uint64_t *)&unk_4B6A0);
      uint64_t v14 = swift_allocObject(v13, 64LL, 7LL);
      *(_OWORD *)(v14 + 16) = xmmword_38B60;
      *(void *)(v14 + 3sub_541C(v0 + 2) = v9;
      *(void *)(v14 + 40) = v10;
      *(void *)(v14 + 4sub_541C(v0 + 8) = v11;
      *(void *)(v14 + 56) = v12;
      uint64_t v36 = v14;
      swift_bridgeObjectRetain_n(v10, 2LL);
      swift_bridgeObjectRetain_n(v12, 2LL);
      swift_bridgeObjectRetain(v14);
      sub_2E8D0(&v36);
      swift_bridgeObjectRelease(v14);
      uint64_t v15 = v36;
      uint64_t v16 = sub_501C(&qword_4B2B0);
      uint64_t v17 = sub_263EC((unint64_t *)&qword_4B4C0, &qword_4B2B0, (uint64_t)&protocol conformance descriptor for [A]);
      uint64_t v18 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v16, v17);
      uint64_t v20 = v19;
      swift_release(v15);
      String.hash(into:)(v37, v18, v20);
      swift_bridgeObjectRelease(v20);
      Swift::Int v21 = Hasher._finalize()();
      Hasher.init(_seed:)(v37, 0LL);
      uint64_t v22 = swift_allocObject(v13, 64LL, 7LL);
      *(_OWORD *)(v22 + 16) = xmmword_38B60;
      *(void *)(v22 + 3sub_541C(v0 + 2) = a1;
      *(void *)(v22 + 40) = a2;
      *(void *)(v22 + 4sub_541C(v0 + 8) = a3;
      *(void *)(v22 + 56) = a4;
      uint64_t v36 = v22;
      swift_bridgeObjectRetain(a2);
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRetain(v22);
      sub_2E8D0(&v36);
      swift_bridgeObjectRelease(v22);
      uint64_t v23 = v36;
      uint64_t v24 = BidirectionalCollection<>.joined(separator:)(32LL, 0xE100000000000000LL, v16, v17);
      uint64_t v26 = v25;
      swift_release(v23);
      String.hash(into:)(v37, v24, v26);
      swift_bridgeObjectRelease(v26);
      Swift::Int v27 = Hasher._finalize()();
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v10);
      if (v21 == v27) {
        break;
      }
      unint64_t v7 = (v7 + 1) & v29;
    }

    while (((*(void *)(v30 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0);
  }

  return v7;
}

unint64_t sub_2E538(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
    uint64_t v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v7 == v10 && v9 == v11)
    {
LABEL_16:
      swift_bridgeObjectRelease_n(v9, 2LL);
      return v5;
    }

    uint64_t v13 = v11;
    char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v7, v9, v10, v11, 0LL);
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v13);
    if ((v14 & 1) == 0)
    {
      uint64_t v15 = ~v4;
      unint64_t v5 = (v5 + 1) & v15;
      if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0)
      {
        while (1)
        {
          uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(void *)(*(void *)(v2 + 48) + 8 * v5));
          uint64_t v9 = v17;
          uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
          if (v16 == v18 && v9 == v19) {
            break;
          }
          uint64_t v21 = v19;
          char v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v9, v18, v19, 0LL);
          swift_bridgeObjectRelease(v9);
          swift_bridgeObjectRelease(v21);
          if ((v22 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v15;
            if (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v5) & 1) != 0) {
              continue;
            }
          }

          return v5;
        }

        goto LABEL_16;
      }
    }
  }

  return v5;
}

unint64_t sub_2E6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v18 = a1;
  uint64_t v5 = type metadata accessor for Locale(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
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
      uint64_t v14 = sub_1DC28( (unint64_t *)&qword_4B690,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
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

void *sub_2E7EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_501C((uint64_t *)&unk_4B6A0);
  uint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_31BFC((uint64_t)&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_32610(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

Swift::Int sub_2E8D0(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = sub_31BE8(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_2E938(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_2E938(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      if (v3) {
        return sub_2F020(0LL, v3, 1LL, a1);
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
    uint64_t v8 = &_swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage + 32;
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_120:
      uint64_t v101 = v11;
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
        sub_2F0EC( (char *)(v102 + 16 * v104),  (char *)(v102 + 16LL * *(void *)&v101[16 * v12 + 16]),  v102 + 16 * v105,  __dst);
        if (v1) {
          goto LABEL_116;
        }
        if (v105 < v104) {
          goto LABEL_150;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v100) & 1) == 0) {
          uint64_t v100 = sub_2F524((uint64_t)v100);
        }
        if (v103 >= *((void *)v100 + 2)) {
          goto LABEL_151;
        }
        unint64_t v106 = &v100[16 * v103 + 32];
        *(void *)unint64_t v106 = v104;
        *((void *)v106 + 1) = v105;
        unint64_t v107 = *((void *)v100 + 2);
        if (v12 > v107) {
          goto LABEL_152;
        }
        memmove(&v100[16 * v12 + 16], &v100[16 * v12 + 32], 16 * (v107 - v12));
        uint64_t v101 = v100;
        *((void *)v100 + sub_541C(v0 + 2) = v107 - 1;
        unint64_t v12 = v107 - 1;
        if (v107 <= 2) {
          goto LABEL_117;
        }
      }
    }

    uint64_t v110 = &_swiftEmptyArrayStorage;
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
  uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
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

    char v22 = (uint64_t *)(v109 + 16 * v21);
    do
    {
      uint64_t v24 = *(v22 - 1);
      uint64_t v25 = *v22;
      uint64_t v26 = (void *)(v10 + 16 * v9);
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
            *(void *)(v33 - sub_541C(v0 + 8) = v35;
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
            uint64_t v38 = (uint64_t *)(v10 + 16 * v9);
            uint64_t v39 = *v38;
            uint64_t v40 = v38[1];
            Swift::Int v41 = v13;
            id v42 = v37;
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
              *(_OWORD *)id v42 = *((_OWORD *)v42 - 1);
              *(v42 - 1) = v40;
              *(v42 - sub_541C(v0 + 2) = v39;
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
      uint64_t v11 = sub_2F384(0LL, *((void *)v11 + 2) + 1LL, 1, v11);
    }
    unint64_t v47 = *((void *)v11 + 2);
    unint64_t v46 = *((void *)v11 + 3);
    unint64_t v12 = v47 + 1;
    if (v47 >= v46 >> 1) {
      uint64_t v11 = sub_2F384((char *)(v46 > 1), v47 + 1, 1, v11);
    }
    *((void *)v11 + sub_541C(v0 + 2) = v12;
    uint64_t v48 = v11 + 32;
    unint64_t v49 = &v11[16 * v47 + 32];
    *(void *)unint64_t v49 = v13;
    *((void *)v49 + 1) = v9;
    if (v47) {
      break;
    }
    unint64_t v12 = 1LL;
LABEL_15:
    Swift::Int v3 = v112;
    if (v9 >= v112)
    {
      uint64_t v8 = v110;
      goto LABEL_120;
    }
  }

  Swift::Int v113 = v9;
  while (1)
  {
    unint64_t v50 = v12 - 1;
    if (v12 >= 4)
    {
      uint64_t v55 = &v48[16 * v12];
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
      unint64_t v63 = &v48[16 * v12 - 32];
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
    unint64_t v68 = &v48[16 * v12 - 32];
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
    char v81 = &v48[16 * v50];
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
    unint64_t v94 = v48;
    unint64_t v95 = v50;
    uint64_t v96 = &v48[16 * v50];
    uint64_t v97 = *((void *)v96 + 1);
    uint64_t v98 = v90;
    sub_2F0EC((char *)(v90 + 16LL * *(void *)v92), (char *)(v90 + 16LL * *(void *)v96), v90 + 16 * v97, __dst);
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
    uint64_t v48 = v94;
    *((void *)v91 + sub_541C(v0 + 2) = v99 - 1;
    uint64_t v10 = v98;
    Swift::Int v9 = v113;
    if (v99 <= 2) {
      goto LABEL_15;
    }
  }

  uint64_t v100 = v91;
LABEL_116:
  uint64_t v101 = v100;
LABEL_117:
  swift_bridgeObjectRelease(v101);
  *((void *)v110 + sub_541C(v0 + 2) = 0LL;
  return swift_bridgeObjectRelease(v110);
}

uint64_t sub_2F020(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
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
      *(v12 - sub_541C(v0 + 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }

    __break(1u);
  }

  return result;
}

uint64_t sub_2F0EC(char *__src, char *a2, unint64_t a3, char *__dst)
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
  uint64_t v30 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v19 = &v4[16 * v13];
      uint64_t v29 = v19;
      Swift::Int v31 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        int v20 = (char *)(a3 - 16);
        Swift::Int v21 = v6;
        while (1)
        {
          char v22 = v20 + 16;
          uint64_t v23 = *((void *)v19 - 2);
          uint64_t v24 = *((void *)v19 - 1);
          uint64_t v25 = *((void *)v21 - 2);
          uint64_t v26 = *((void *)v21 - 1);
          v21 -= 16;
          BOOL v27 = v23 == v25 && v24 == v26;
          if (v27 || (_stringCompareWithSmolCheck(_:_:expecting:)(v23, v24, v25, v26, 1LL) & 1) == 0)
          {
            uint64_t v29 = v19 - 16;
            if (v22 < v19 || v20 >= v19 || v22 != v19) {
              *(_OWORD *)int v20 = *((_OWORD *)v19 - 1);
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
              *(_OWORD *)int v20 = *(_OWORD *)v21;
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
    uint64_t v29 = v14;
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
          uint64_t v30 = v4;
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
    sub_2F47C((void **)&v31, (const void **)&v30, &v29);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_2F384(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_501C(&qword_4BD98);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + sub_541C(v0 + 2) = v8;
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
    *((void *)a4 + sub_541C(v0 + 2) = 0LL;
  }

  else
  {
    memcpy(v14, v15, 16 * v8);
  }

  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_2F47C(void **a1, const void **a2, void *a3)
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

char *sub_2F524(uint64_t a1)
{
  return sub_2F384(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_2F538(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v9 = *(char *)(*(void *)(a2 + 48) + v6);
        Hasher.init(_seed:)(v25, *(void *)(a2 + 40));
        uint64_t v10 = *(void *)&aNvasr_6[8 * v9];
        uint64_t v11 = *(void *)&aPhoneset_4[8 * v9 + 8];
        String.hash(into:)(v25, v10, v11);
        swift_bridgeObjectRelease(v11);
        uint64_t result = Hasher._finalize()();
        unint64_t v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8) {
            goto LABEL_5;
          }
        }

        else if (v12 >= v8)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          uint64_t v13 = *(void *)(a2 + 48);
          uint64_t v14 = (_BYTE *)(v13 + v3);
          uint64_t v15 = (_BYTE *)(v13 + v6);
          if (v3 != v6 || v14 >= v15 + 1) {
            *uint64_t v14 = *v15;
          }
          uint64_t v16 = *(void *)(a2 + 56);
          BOOL v17 = (void *)(v16 + 8 * v3);
          uint64_t v18 = (void *)(v16 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v17 >= v18 + 1))
          {
            *BOOL v17 = *v18;
            int64_t v3 = v6;
          }
        }

uint64_t sub_2F71C(uint64_t a1, char a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_2DE4C(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_19A50();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      *(void *)(v16[7] + 8 * v10) = a1;
      return result;
    }

LABEL_11:
    v16[(v10 >> 6) + 8] |= 1LL << v10;
    *(_BYTE *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v18 = v16[2];
    BOOL v19 = __OFADD__(v18, 1LL);
    uint64_t v20 = v18 + 1;
    if (!v19)
    {
      void v16[2] = v20;
      return result;
    }

    goto LABEL_14;
  }

  sub_19408(result, a3 & 1);
  uint64_t result = sub_2DE4C(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if ((v14 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

      uint64_t v16 = 0LL;
      goto LABEL_12;
    }

    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_198B0();
      goto LABEL_7;
    }

    sub_190F0(v13, a3 & 1);
    char v17 = sub_2DE4C(a2);
    if ((v14 & 1) == (v18 & 1))
    {
      unint64_t v10 = v17;
      *(void *)(a1 + 16) = v17;
      if ((v14 & 1) != 0) {
        goto LABEL_8;
      }
      goto LABEL_11;
    }
  }

  uint64_t result = (unint64_t (*)(unint64_t, char))KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Phoneset.Key);
  __break(1u);
  return result;
}

LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Phoneset.Key);
  __break(1u);
  return result;
}

uint64_t sub_2F844(Swift::Int *a1, void *a2)
{
  int64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001LL) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*v2);
    id v8 = a2;
    uint64_t v9 = __CocoaSet.member(for:)();

    if (v9)
    {
      swift_bridgeObjectRelease(v6);

      uint64_t v31 = v9;
      uint64_t v10 = type metadata accessor for PhonemeString();
      swift_unknownObjectRetain(v9);
      swift_dynamicCast(&v32, &v31, (char *)&type metadata for Swift.AnyObject + 8, v10, 7LL);
      *a1 = v32;
      swift_unknownObjectRelease(v9);
      return 0LL;
    }

    uint64_t result = __CocoaSet.count.getter(v7);
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    Swift::Int v23 = sub_2FDA4(v7, result + 1);
    Swift::Int v32 = v23;
    unint64_t v24 = *(void *)(v23 + 16);
    if (*(void *)(v23 + 24) <= v24)
    {
      uint64_t v29 = v24 + 1;
      id v30 = v8;
      sub_2FF88(v29);
      uint64_t v25 = v32;
    }

    else
    {
      uint64_t v25 = v23;
      id v26 = v8;
    }

    sub_307A8((uint64_t)v8, v25);
    uint64_t v28 = *v3;
    *int64_t v3 = v25;
  }

  else
  {
    Swift::Int v12 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain(v6);
    Swift::Int v13 = NSObject._rawHashValue(seed:)(v12);
    uint64_t v14 = -1LL << *(_BYTE *)(v6 + 32);
    unint64_t v15 = v13 & ~v14;
    if (((*(void *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) != 0)
    {
      type metadata accessor for PhonemeString();
      id v16 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
      char v17 = static NSObject.== infix(_:_:)(v16, a2);

      if ((v17 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease(v6);
        uint64_t v21 = *(void **)(*(void *)(*v3 + 48) + 8 * v15);
        *a1 = (Swift::Int)v21;
        id v22 = v21;
        return 0LL;
      }

      uint64_t v18 = ~v14;
      while (1)
      {
        unint64_t v15 = (v15 + 1) & v18;
        if (((*(void *)(v6 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0) {
          break;
        }
        id v19 = *(id *)(*(void *)(v6 + 48) + 8 * v15);
        char v20 = static NSObject.== infix(_:_:)(v19, a2);

        if ((v20 & 1) != 0) {
          goto LABEL_12;
        }
      }
    }

    swift_bridgeObjectRelease(v6);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    Swift::Int v32 = *v3;
    *int64_t v3 = 0x8000000000000000LL;
    id v8 = a2;
    sub_30828((uint64_t)v8, v15, isUniquelyReferenced_nonNull_native);
    uint64_t v28 = *v3;
    *int64_t v3 = v32;
  }

  swift_bridgeObjectRelease(v28);
  *a1 = (Swift::Int)v8;
  return 1LL;
}

uint64_t sub_2FAC0(_BYTE *a1, char a2)
{
  int64_t v3 = v2;
  uint64_t v6 = a2 & 1;
  uint64_t v7 = *v3;
  Hasher.init(_seed:)(v16, *(void *)(*v3 + 40LL));
  Hasher._combine(_:)(a2 & 1);
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1LL << *(_BYTE *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v16[0] = *v3;
    *int64_t v3 = 0x8000000000000000LL;
    sub_3099C(v6, v10, isUniquelyReferenced_nonNull_native);
    uint64_t v15 = *v3;
    *int64_t v3 = v16[0];
    swift_bridgeObjectRelease(v15);
    uint64_t result = 1LL;
    goto LABEL_8;
  }

  uint64_t v11 = *(void *)(v7 + 48);
  if (((((_DWORD)v6 == 0) ^ *(unsigned __int8 *)(v11 + v10)) & 1) == 0)
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v12;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v10) & 1) == 0) {
        goto LABEL_7;
      }
    }

    while (((((_DWORD)v6 == 0) ^ *(unsigned __int8 *)(v11 + v10)) & 1) == 0);
  }

  uint64_t result = 0LL;
  LOBYTE(v6) = *(_BYTE *)(*(void *)(*v3 + 48LL) + v10);
LABEL_8:
  *a1 = v6;
  return result;
}

uint64_t sub_2FBF8(uint64_t *a1, uint64_t a2, uint64_t a3)
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
      id v19 = (void *)(v11 + 16 * v10);
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
  *int64_t v3 = 0x8000000000000000LL;
  swift_bridgeObjectRetain(a3);
  sub_30B00(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  *int64_t v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

Swift::Int sub_2FDA4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_501C(&qword_4BD78);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v23 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()();
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = type metadata accessor for PhonemeString();
      do
      {
        uint64_t v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v23;
        unint64_t v16 = *(void *)(v23 + 16);
        if (*(void *)(v23 + 24) <= v16)
        {
          sub_2FF88(v16 + 1);
          uint64_t v4 = v23;
        }

        uint64_t v9 = v22;
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v4 + 40));
        uint64_t v11 = v4 + 56;
        uint64_t v12 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v13 = result & ~v12;
        unint64_t v14 = v13 >> 6;
        if (((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6))) != 0)
        {
          unint64_t v15 = __clz(__rbit64((-1LL << v13) & ~*(void *)(v4 + 56 + 8 * (v13 >> 6)))) | v13 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v17 = 0;
          unint64_t v18 = (unint64_t)(63 - v12) >> 6;
          do
          {
            if (++v14 == v18 && (v17 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v19 = v14 == v18;
            if (v14 == v18) {
              unint64_t v14 = 0LL;
            }
            v17 |= v19;
            uint64_t v20 = *(void *)(v11 + 8 * v14);
          }

          while (v20 == -1);
          unint64_t v15 = __clz(__rbit64(~v20)) + (v14 << 6);
        }

        *(void *)(v11 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
        *(void *)(*(void *)(v4 + 48) + 8 * v15) = v9;
        ++*(void *)(v4 + 16);
        uint64_t v7 = __CocoaSet.Iterator.next()();
      }

      while (v7);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (Swift::Int)&_swiftEmptySetSingleton;
  }

  return v4;
}

Swift::Int sub_2FF88(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_501C(&qword_4BD78);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    id v30 = v2;
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v8 = (void *)(v3 + 56);
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
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v14 << 6);
      }

      else
      {
        int64_t v18 = v14 + 1;
        if (__OFADD__(v14, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v18 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          int64_t v14 = v18 + 1;
          if (v18 + 1 >= v11) {
            goto LABEL_36;
          }
          unint64_t v19 = v8[v14];
          if (!v19)
          {
            int64_t v14 = v18 + 2;
            if (v18 + 2 >= v11) {
              goto LABEL_36;
            }
            unint64_t v19 = v8[v14];
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_36:
                swift_release(v3);
                uint64_t v2 = v30;
                uint64_t v29 = 1LL << *(_BYTE *)(v3 + 32);
                if (v29 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v8 = -1LL << v29;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  int64_t v14 = v20 + 1;
                  if (__OFADD__(v20, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v14 >= v11) {
                    goto LABEL_36;
                  }
                  unint64_t v19 = v8[v14];
                  ++v20;
                  if (v19) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v14 = v20;
            }
          }
        }

Swift::Int sub_30224(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_501C(&qword_4BD90);
  Swift::Int result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  Swift::Int v6 = result;
  if (*(void *)(v3 + 16))
  {
    uint64_t v29 = v2;
    int64_t v7 = 0LL;
    uint64_t v8 = (void *)(v3 + 56);
    uint64_t v9 = 1LL << *(_BYTE *)(v3 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1LL << v9);
    }
    else {
      uint64_t v10 = -1LL;
    }
    unint64_t v11 = v10 & *(void *)(v3 + 56);
    int64_t v12 = (unint64_t)(v9 + 63) >> 6;
    Swift::Int v13 = result + 56;
    while (1)
    {
      if (v11)
      {
        unint64_t v15 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v16 = v15 | (v7 << 6);
      }

      else
      {
        int64_t v17 = v7 + 1;
        if (__OFADD__(v7, 1LL))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }

        if (v17 >= v12) {
          goto LABEL_36;
        }
        unint64_t v18 = v8[v17];
        ++v7;
        if (!v18)
        {
          int64_t v7 = v17 + 1;
          if (v17 + 1 >= v12) {
            goto LABEL_36;
          }
          unint64_t v18 = v8[v7];
          if (!v18)
          {
            int64_t v7 = v17 + 2;
            if (v17 + 2 >= v12) {
              goto LABEL_36;
            }
            unint64_t v18 = v8[v7];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v12)
              {
LABEL_36:
                uint64_t v28 = 1LL << *(_BYTE *)(v3 + 32);
                if (v28 > 63) {
                  bzero((void *)(v3 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v8 = -1LL << v28;
                }
                uint64_t v2 = v29;
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v18 = v8[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v7 = v19 + 1;
                  if (__OFADD__(v19, 1LL)) {
                    goto LABEL_42;
                  }
                  if (v7 >= v12) {
                    goto LABEL_36;
                  }
                  unint64_t v18 = v8[v7];
                  ++v19;
                  if (v18) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v7 = v19;
            }
          }
        }

Swift::Int sub_304CC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_501C(&qword_4BD80);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    Swift::Int v32 = v2;
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
                  *uint64_t v33 = -1LL << v31;
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

unint64_t sub_307A8(uint64_t a1, uint64_t a2)
{
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(a2 + 40));
  unint64_t result = _HashTable.nextHole(atOrAfter:)(v4 & ~(-1LL << *(_BYTE *)(a2 + 32)), a2 + 56, ~(-1LL << *(_BYTE *)(a2 + 32)));
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

void sub_30828(uint64_t a1, unint64_t a2, char a3)
{
  Swift::Int v4 = v3;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_2FF88(v9);
  }

  else
  {
    if (v8 > v7)
    {
      sub_30C98();
      goto LABEL_14;
    }

    sub_31180(v9);
  }

  uint64_t v10 = *v3;
  Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v12 = -1LL << *(_BYTE *)(v10 + 32);
  a2 = v11 & ~v12;
  if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v13 = type metadata accessor for PhonemeString();
    id v14 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
    char v15 = static NSObject.== infix(_:_:)(v14, a1);

    if ((v15 & 1) != 0)
    {
LABEL_13:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(v13);
      __break(1u);
    }

    else
    {
      uint64_t v16 = ~v12;
      while (1)
      {
        a2 = (a2 + 1) & v16;
        if (((*(void *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
        id v17 = *(id *)(*(void *)(v10 + 48) + 8 * a2);
        char v18 = static NSObject.== infix(_:_:)(v17, a1);

        if ((v18 & 1) != 0) {
          goto LABEL_13;
        }
      }
    }
  }

LABEL_14:
  uint64_t v19 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v19 + 48) + 8 * asub_541C(v0 + 2) = a1;
  uint64_t v20 = *(void *)(v19 + 16);
  BOOL v21 = __OFADD__(v20, 1LL);
  uint64_t v22 = v20 + 1;
  if (v21) {
    __break(1u);
  }
  else {
    *(void *)(v19 + 16) = v22;
  }
}

  uint64_t v13 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(_BYTE *)(*(void *)(v13 + 48) + asub_541C(v0 + 2) = v5;
  id v14 = *(void *)(v13 + 16);
  char v15 = __OFADD__(v14, 1LL);
  uint64_t v16 = v14 + 1;
  if (v15) {
    __break(1u);
  }
  else {
    *(void *)(v13 + 16) = v16;
  }
  return result;
}

uint64_t sub_3099C(uint64_t result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result & 1;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  uint64_t v8 = v6 + 1;
  if ((a3 & 1) != 0)
  {
    sub_30224(v8);
  }

  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)sub_30E40();
      goto LABEL_14;
    }

    sub_313F8(v8);
  }

  uint64_t v9 = *v3;
  Hasher.init(_seed:)(v17, *(void *)(*v3 + 40));
  Hasher._combine(_:)(v5);
  unint64_t result = Hasher._finalize()();
  uint64_t v10 = -1LL << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v11 = *(void *)(v9 + 48);
    if (((((_DWORD)v5 == 0) ^ *(unsigned __int8 *)(v11 + a2)) & 1) != 0)
    {
LABEL_13:
      unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Domain);
      __break(1u);
    }

    else
    {
      uint64_t v12 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v12;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
          break;
        }
      }
    }
  }

void sub_30B00(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  Swift::UInt v5 = v4;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_304CC(v11);
  }

  else
  {
    if (v10 > v9)
    {
      sub_30FD0();
      goto LABEL_22;
    }

    sub_31670(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v29, *(void *)(*v4 + 40));
  String.hash(into:)(v29, a1, a2);
  Swift::Int v13 = Hasher._finalize()();
  uint64_t v14 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = v13 & ~v14;
  uint64_t v15 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v16 = *(void *)(v12 + 48);
    id v17 = (void *)(v16 + 16 * a3);
    uint64_t v18 = v17[1];
    BOOL v19 = *v17 == a1 && v18 == a2;
    if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0LL) & 1) != 0)
    {
LABEL_21:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }

    else
    {
      uint64_t v20 = ~v14;
      while (1)
      {
        a3 = (a3 + 1) & v20;
        if (((*(void *)(v15 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) == 0) {
          break;
        }
        BOOL v21 = (void *)(v16 + 16 * a3);
        uint64_t v22 = v21[1];
        BOOL v23 = *v21 == a1 && v22 == a2;
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v21, v22, a1, a2, 0LL) & 1) != 0) {
          goto LABEL_21;
        }
      }
    }
  }

id sub_30C98()
{
  uint64_t v1 = v0;
  sub_501C(&qword_4BD78);
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

    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }

void *sub_30E40()
{
  uint64_t v1 = v0;
  sub_501C(&qword_4BD90);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release(v2);
    *uint64_t v1 = v4;
    return result;
  }

  id result = (void *)(v3 + 56);
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

    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }

void sub_30FD0()
{
  uint64_t v1 = v0;
  sub_501C(&qword_4BD80);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    swift_release(v2);
    *uint64_t v1 = v4;
    return;
  }

  Swift::UInt v5 = (void *)(v3 + 56);
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

Swift::Int sub_31180(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_501C(&qword_4BD78);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v30 = v2;
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
  while (1)
  {
    if (v10)
    {
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_27;
    }

    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v18 >= v11) {
      goto LABEL_36;
    }
    unint64_t v19 = *(void *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_36;
      }
      unint64_t v19 = *(void *)(v8 + 8 * v14);
      if (!v19)
      {
        int64_t v14 = v18 + 2;
        if (v18 + 2 >= v11) {
          goto LABEL_36;
        }
        unint64_t v19 = *(void *)(v8 + 8 * v14);
        if (!v19) {
          break;
        }
      }
    }

Swift::Int sub_313F8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_501C(&qword_4BD90);
  Swift::Int result = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  Swift::Int v6 = result;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_38:
    *uint64_t v2 = v6;
    return result;
  }

  BOOL v28 = v2;
  int64_t v7 = 0LL;
  Swift::Int v8 = v3 + 56;
  uint64_t v9 = 1LL << *(_BYTE *)(v3 + 32);
  if (v9 < 64) {
    uint64_t v10 = ~(-1LL << v9);
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v3 + 56);
  int64_t v12 = (unint64_t)(v9 + 63) >> 6;
  Swift::Int v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v7 << 6);
      goto LABEL_27;
    }

    int64_t v17 = v7 + 1;
    if (__OFADD__(v7, 1LL))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (v17 >= v12) {
      goto LABEL_36;
    }
    unint64_t v18 = *(void *)(v8 + 8 * v17);
    ++v7;
    if (!v18)
    {
      int64_t v7 = v17 + 1;
      if (v17 + 1 >= v12) {
        goto LABEL_36;
      }
      unint64_t v18 = *(void *)(v8 + 8 * v7);
      if (!v18)
      {
        int64_t v7 = v17 + 2;
        if (v17 + 2 >= v12) {
          goto LABEL_36;
        }
        unint64_t v18 = *(void *)(v8 + 8 * v7);
        if (!v18) {
          break;
        }
      }
    }

Swift::Int sub_31670(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_501C(&qword_4BD80);
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
  uint64_t v31 = v2;
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

void (*sub_3191C(void *a1, char a2))(uint64_t a1)
{
  uint64_t v5 = malloc(0x50uLL);
  *a1 = v5;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
  v5[8] = sub_31BBC(v5);
  void v5[9] = sub_319D4((uint64_t)(v5 + 4), a2, isUniquelyReferenced_nonNull_native);
  return sub_31998;
}

void sub_31998(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v2 = *(void (**)(void *, void))(*(void *)a1 + 64LL);
  (*(void (**)(uint64_t, void))(*(void *)a1 + 72LL))(*(void *)a1 + 32LL, 0LL);
  v2(v1, 0LL);
  free(v1);
}

unint64_t (*sub_319D4(uint64_t a1, char a2, char a3))(unint64_t result, char a2)
{
  uint64_t v4 = v3;
  *(void *)(a1 + sub_541C(v0 + 8) = v3;
  *(_BYTE *)(a1 + 24) = a2;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_2DE4C(a2);
  *(_BYTE *)(a1 + 25) = v9 & 1;
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }

  else
  {
    char v14 = v9;
    uint64_t v15 = *(void *)(v8 + 24);
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      *(void *)(a1 + 16) = v10;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        uint64_t v16 = *(void *)(*(void *)(*v4 + 56LL) + 8 * v10);
LABEL_12:
        *(void *)a1 = v16;
        return sub_31AE4;
      }

unint64_t sub_31AE4(unint64_t result, char a2)
{
  uint64_t v2 = *(void *)result;
  LOBYTE(v3) = *(_BYTE *)(result + 25);
  if ((a2 & 1) != 0)
  {
    if (!v2) {
      goto LABEL_10;
    }
    unint64_t v4 = *(void *)(result + 16);
    uint64_t v5 = **(void ***)(result + 8);
    if ((*(_BYTE *)(result + 25) & 1) != 0)
    {
LABEL_9:
      *(void *)(v5[7] + 8 * v4) = v2;
      return result;
    }

    char v6 = *(_BYTE *)(result + 24);
    v5[(v4 >> 6) + 8] |= 1LL << v4;
    *(_BYTE *)(v5[6] + v4) = v6;
    uint64_t v3 = v5[7];
    *(void *)(v3 + 8 * v4) = v2;
    uint64_t v7 = v5[2];
    BOOL v8 = __OFADD__(v7, 1LL);
    uint64_t v2 = v7 + 1;
    if (!v8) {
      goto LABEL_14;
    }
    __break(1u);
  }

  if (!v2)
  {
LABEL_10:
    if ((v3 & 1) != 0) {
      return sub_2F538(*(void *)(result + 16), **(void **)(result + 8));
    }
    return result;
  }

  unint64_t v4 = *(void *)(result + 16);
  uint64_t v5 = **(void ***)(result + 8);
  if ((v3 & 1) != 0) {
    goto LABEL_9;
  }
  char v9 = *(_BYTE *)(result + 24);
  v5[(v4 >> 6) + 8] |= 1LL << v4;
  *(_BYTE *)(v5[6] + v4) = v9;
  *(void *)(v5[7] + 8 * v4) = v2;
  uint64_t v10 = v5[2];
  BOOL v8 = __OFADD__(v10, 1LL);
  uint64_t v2 = v10 + 1;
  if (!v8)
  {
LABEL_14:
    uint64_t v5[2] = v2;
    return result;
  }

  __break(1u);
  return result;
}

uint64_t (*sub_31BBC(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  *uint64_t v1 = 0x8000000000000000LL;
  return sub_31BDC;
}

uint64_t sub_31BDC(uint64_t result)
{
  **(void **)(result + sub_541C(v0 + 8) = *(void *)result;
  return result;
}

uint64_t sub_31BE8(uint64_t a1)
{
  return sub_33820(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_31BFC(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
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
    uint64_t v5[2] = ~v7;
    _OWORD v5[3] = v12;
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
    int64_t v20 = (void *)(*(void *)(a4 + 48) + 16 * v16);
    uint64_t v21 = v20[1];
    *uint64_t v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }

    v11 += 2;
    Swift::Int result = swift_bridgeObjectRetain(v21);
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

void *sub_31DF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3) {
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t v5 = 0LL;
  uint64_t v6 = _swiftEmptyArrayStorage;
  do
  {
    uint64_t v16 = *(void *)(a1 + 8 * v5 + 32);
    sub_2D1DC((uint64_t)&v16, a2, &v14);
    if (v2)
    {
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(a1);
      return v6;
    }

    uint64_t v8 = v15;
    if (v15)
    {
      uint64_t v9 = v14;
      if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0) {
        uint64_t v6 = sub_14684(0LL, v6[2] + 1LL, 1, v6);
      }
      unint64_t v11 = v6[2];
      unint64_t v10 = v6[3];
      if (v11 >= v10 >> 1) {
        uint64_t v6 = sub_14684((void *)(v10 > 1), v11 + 1, 1, v6);
      }
      _OWORD v6[2] = v11 + 1;
      uint64_t v7 = &v6[2 * v11];
      v7[4] = v9;
      v7[5] = v8;
    }

    ++v5;
  }

  while (v3 != v5);
  swift_bridgeObjectRelease(a1);
  return v6;
}

uint64_t sub_31F38(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)(v2, &type metadata for String, &protocol witness table for String);
  uint64_t v8 = result;
  if (v2)
  {
    unint64_t v4 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v5 = *(v4 - 1);
      uint64_t v6 = *v4;
      swift_bridgeObjectRetain(*v4);
      sub_2FBF8(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }

    while (v2);
    return v8;
  }

  return result;
}

void *sub_31FCC(uint64_t a1, uint64_t a2, char a3, char a4, char a5)
{
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(a1 + 16);
  if (!v7) {
    return _swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain(a1);
  uint64_t v22 = v10;
  unint64_t v11 = (void *)(v10 + 40);
  int64_t v12 = _swiftEmptyArrayStorage;
  uint64_t v13 = a5 & 1;
  do
  {
    uint64_t v14 = *(v11 - 1);
    uint64_t v15 = (void *)*v11;
    swift_bridgeObjectRetain(*v11);
    uint64_t v16 = sub_2CCA0(v14, v15, a3, a4, v13, a2);
    if (v6)
    {
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v22);
      swift_bridgeObjectRelease(v15);
      return v12;
    }

    int64_t v17 = v16;
    uint64_t v18 = v16[2];
    swift_bridgeObjectRelease(v15);
    if (v18)
    {
      if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0) {
        int64_t v12 = sub_13B74(0LL, v12[2] + 1LL, 1, v12);
      }
      unint64_t v20 = v12[2];
      unint64_t v19 = v12[3];
      if (v20 >= v19 >> 1) {
        int64_t v12 = sub_13B74((void *)(v19 > 1), v20 + 1, 1, v12);
      }
      void v12[2] = v20 + 1;
      v12[v20 + 4] = v17;
    }

    else
    {
      swift_bridgeObjectRelease(v17);
    }

    v11 += 2;
    --v7;
  }

  while (v7);
  swift_bridgeObjectRelease(v22);
  return v12;
}

uint64_t sub_3213C(char a1, uint64_t a2)
{
  if (!*(void *)(a2 + 16) || (unint64_t v4 = sub_2DE4C(4), (v5 & 1) == 0))
  {
    uint64_t v35 = 0LL;
    unint64_t v36 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(28LL);
    v17._countAndFlagsBits = 0x74276E646C756F43LL;
    v17._object = (void *)0xEE0020646E696620LL;
    String.append(_:)(v17);
    LOBYTE(v3sub_541C(v0 + 7) = 4;
LABEL_12:
    _print_unlocked<A, B>(_:_:)( &v37,  &v35,  &type metadata for Phoneset.Key,  &type metadata for DefaultStringInterpolation,  &protocol witness table for DefaultStringInterpolation);
    uint64_t v19 = 0x6E6F6870206E6920LL;
    unint64_t v20 = 0xEC00000074657365LL;
LABEL_13:
    String.append(_:)(*(Swift::String *)&v19);
LABEL_14:
    uint64_t v21 = v35;
    unint64_t v16 = v36;
    unint64_t v22 = sub_2DE08();
    uint64_t v23 = swift_allocError(&type metadata for PhonemesMapperError, v22, 0LL, 0LL);
    *(void *)uint64_t v24 = v21;
    *(void *)(v24 + sub_541C(v0 + 8) = v16;
    *(_BYTE *)(v24 + 16) = 1;
    swift_willThrow(v23);
    return v16;
  }

  if (!*(void *)(a2 + 16))
  {
LABEL_11:
    uint64_t v35 = 0LL;
    unint64_t v36 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(28LL);
    v18._countAndFlagsBits = 0x74276E646C756F43LL;
    v18._object = (void *)0xEE0020646E696620LL;
    String.append(_:)(v18);
    LOBYTE(v3sub_541C(v0 + 7) = a1;
    goto LABEL_12;
  }

  uint64_t v6 = *(void **)(*(void *)(a2 + 56) + 8 * v4);
  swift_bridgeObjectRetain(v6);
  unint64_t v7 = sub_2DE4C(a1);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease(v6);
    goto LABEL_11;
  }

  uint64_t v9 = *(void *)(*(void *)(a2 + 56) + 8 * v7);
  uint64_t v10 = sub_2C7F8(0x6F625F656E6F6870LL, 0xEE00797261646E75LL, v6);
  if ((v11 & 1) != 0)
  {
    _StringGuts.grow(_:)(21LL);
    uint64_t v25 = Array.description.getter(v6, &type metadata for String);
    unint64_t v27 = v26;
    swift_bridgeObjectRelease(v6);
    swift_bridgeObjectRelease(0xE000000000000000LL);
    uint64_t v35 = v25;
    unint64_t v36 = v27;
    v28._object = (void *)0x800000000003C350LL;
    v28._countAndFlagsBits = 0xD000000000000011LL;
    String.append(_:)(v28);
    uint64_t v19 = 0x6F625F656E6F6870LL;
    unint64_t v20 = 0xEE00797261646E75LL;
    goto LABEL_13;
  }

  uint64_t v12 = v10;
  swift_bridgeObjectRetain(v9);
  uint64_t result = swift_bridgeObjectRelease(v6);
  uint64_t v14 = *(void *)(v9 + 16);
  if (v12 >= v14)
  {
    uint64_t v35 = 0LL;
    unint64_t v36 = 0xE000000000000000LL;
    _StringGuts.grow(_:)(66LL);
    v29._countAndFlagsBits = 0xD000000000000014LL;
    v29._object = (void *)0x800000000003C370LL;
    String.append(_:)(v29);
    v30._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    object = v30._object;
    String.append(_:)(v30);
    swift_bridgeObjectRelease(object);
    v32._countAndFlagsBits = 0xD00000000000002ALL;
    v32._object = (void *)0x800000000003C390LL;
    String.append(_:)(v32);
    swift_bridgeObjectRelease(v9);
    uint64_t v37 = v14;
    v33._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter( &type metadata for Int,  &protocol witness table for Int);
    uint64_t v34 = v33._object;
    String.append(_:)(v33);
    swift_bridgeObjectRelease(v34);
    goto LABEL_14;
  }

  if ((v12 & 0x8000000000000000LL) == 0)
  {
    uint64_t v15 = v9 + 16 * v12;
    unint64_t v16 = *(void *)(v15 + 32);
    swift_bridgeObjectRetain(*(void *)(v15 + 40));
    swift_bridgeObjectRelease(v9);
    return v16;
  }

  __break(1u);
  return result;
}

uint64_t sub_324B0(uint64_t a1)
{
  unint64_t v2 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0) {
      uint64_t v13 = a1;
    }
    else {
      uint64_t v13 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }

  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v4 = type metadata accessor for PhonemeString();
  uint64_t v5 = sub_1DC28( &qword_4B6C0,  (uint64_t (*)(uint64_t))type metadata accessor for PhonemeString,  (uint64_t)&protocol conformance descriptor for NSObject);
  uint64_t result = Set.init(minimumCapacity:)(v3, v4, v5);
  uint64_t v15 = result;
  if (v2)
  {
    if (a1 < 0) {
      uint64_t v8 = a1;
    }
    else {
      uint64_t v8 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter(v8);
    uint64_t result = swift_bridgeObjectRelease(a1);
    if (!v7) {
      return v15;
    }
  }

  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFF8LL));
    if (!v7) {
      return v15;
    }
  }

  if (v7 >= 1)
  {
    if ((a1 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        uint64_t v10 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, a1);
        sub_2F844((Swift::Int *)&v14, v10);
      }
    }

    else
    {
      char v11 = (void **)(a1 + 32);
      do
      {
        uint64_t v12 = *v11++;
        sub_2F844((Swift::Int *)&v14, v12);

        --v7;
      }

      while (v7);
    }

    return v15;
  }

  __break(1u);
  return result;
}

uint64_t sub_32610(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t *sub_32618(uint64_t a1, uint64_t *a2)
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

uint64_t sub_32658(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = sub_326C8();
  uint64_t result = Set.init(minimumCapacity:)(v2, &type metadata for Domain, v3);
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v5 = (char *)(a1 + 32);
    do
    {
      char v6 = *v5++;
      sub_2FAC0(&v7, v6);
      --v2;
    }

    while (v2);
    return v8;
  }

  return result;
}

unint64_t sub_326C8()
{
  unint64_t result = qword_4BD88;
  if (!qword_4BD88)
  {
    unint64_t result = swift_getWitnessTable(&unk_399F8, &type metadata for Domain);
    atomic_store(result, (unint64_t *)&qword_4BD88);
  }

  return result;
}

uint64_t sub_3270C(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Locale(0LL);
  unint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  char v7 = (char *)&v107 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_4A740 != -1) {
    goto LABEL_70;
  }
LABEL_2:
  uint64_t v8 = qword_4FC60;
  if (!*(void *)(qword_4FC60 + 16) || (unint64_t v9 = sub_2E030((uint64_t)a2), (v10 & 1) == 0))
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v27 = type metadata accessor for Logger(0LL);
    sub_4F30(v27, (uint64_t)qword_4FC70);
    uint64_t v28 = (*(uint64_t (**)(char *, void *, uint64_t))(v5 + 16))(v7, a2, v4);
    Swift::String v29 = (os_log_s *)Logger.logObject.getter(v28);
    os_log_type_t v30 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v29, v30))
    {
      id v116 = a1;
      uint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      unint64_t v32 = v5;
      uint64_t v33 = swift_slowAlloc(32LL, -1LL);
      *(void *)&__int128 v119 = v33;
      unint64_t v115 = a2;
      *(_DWORD *)uint64_t v31 = 136315138;
      uint64_t v34 = sub_1DC28( (unint64_t *)&unk_4BC60,  (uint64_t (*)(uint64_t))&type metadata accessor for Locale,  (uint64_t)&protocol conformance descriptor for Locale);
      uint64_t v35 = dispatch thunk of CustomStringConvertible.description.getter(v4, v34);
      unint64_t v37 = v36;
      uint64_t v117 = sub_25824(v35, v36, (uint64_t *)&v119);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118);
      swift_bridgeObjectRelease(v37);
      uint64_t v38 = *(void (**)(char *, uint64_t))(v32 + 8);
      v38(v7, v4);
      _os_log_impl(&dword_0, v29, v30, "Phoneset couldn't load the file for locale %s", v31, 0xCu);
      swift_arrayDestroy(v33, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v33, -1LL, -1LL);
      swift_slowDealloc(v31, -1LL, -1LL);

      v38((char *)v115, v4);
    }

    else
    {

      uint64_t v39 = *(void (**)(char *, uint64_t))(v5 + 8);
      v39(v7, v4);
      v39((char *)a2, v4);
    }

    return 0LL;
  }

  char v11 = (uint64_t *)(*(void *)(v8 + 56) + 16 * v9);
  uint64_t v13 = *v11;
  unint64_t v12 = v11[1];
  swift_bridgeObjectRetain(v12);
  NSString v14 = String._bridgeToObjectiveC()();
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = [a1 pathForResource:v14 ofType:v15];

  if (!v16)
  {
    if (qword_4A778 != -1) {
      swift_once(&qword_4A778, sub_349B4);
    }
    uint64_t v41 = type metadata accessor for Logger(0LL);
    sub_4F30(v41, (uint64_t)qword_4FC70);
    swift_bridgeObjectRetain(v12);
    uint64_t v43 = (os_log_s *)Logger.logObject.getter(v42);
    os_log_type_t v44 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v43, v44))
    {
      id v116 = a1;
      BOOL v45 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v46 = swift_slowAlloc(32LL, -1LL);
      unint64_t v114 = v5;
      uint64_t v47 = v46;
      *(void *)&__int128 v119 = v46;
      *(_DWORD *)BOOL v45 = 136315138;
      swift_bridgeObjectRetain(v12);
      uint64_t v117 = sub_25824(v13, v12, (uint64_t *)&v119);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118);
      swift_bridgeObjectRelease_n(v12, 3LL);
      _os_log_impl(&dword_0, v43, v44, "Phoneset couldn't load %s", v45, 0xCu);
      swift_arrayDestroy(v47, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v47, -1LL, -1LL);
      swift_slowDealloc(v45, -1LL, -1LL);

      (*(void (**)(void *, uint64_t))(v114 + 8))(a2, v4);
    }

    else
    {
      swift_bridgeObjectRelease_n(v12, 2LL);

      (*(void (**)(void *, uint64_t))(v5 + 8))(a2, v4);
    }

    return 0LL;
  }

  unint64_t v114 = v5;
  swift_bridgeObjectRelease(v12);
  *(void *)&__int128 v113 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  unint64_t v18 = v17;

  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v19 = type metadata accessor for Logger(0LL);
  uint64_t v20 = sub_4F30(v19, (uint64_t)qword_4FC70);
  uint64_t v21 = swift_bridgeObjectRetain_n(v18, 2LL);
  uint64_t v110 = v20;
  unint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
  os_log_type_t v23 = static os_log_type_t.debug.getter();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v111 = v4;
  unint64_t v112 = v18;
  unint64_t v115 = a2;
  id v116 = a1;
  if (v24)
  {
    a1 = &dword_C;
    uint64_t v25 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v26 = swift_slowAlloc(32LL, -1LL);
    *(void *)&__int128 v119 = v26;
    *(_DWORD *)uint64_t v25 = 136315138;
    swift_bridgeObjectRetain(v18);
    uint64_t v117 = sub_25824(v113, v18, (uint64_t *)&v119);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118);
    swift_bridgeObjectRelease_n(v18, 3LL);
    _os_log_impl(&dword_0, v22, v23, "Phoneset is using the map found at path=%s", v25, 0xCu);
    swift_arrayDestroy(v26, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v26, -1LL, -1LL);
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v18, 2LL);
  }

  uint64_t v4 = 0LL;
  uint64_t v48 = &_swiftEmptyDictionarySingleton;
  a2 = _swiftEmptyArrayStorage;
  do
  {
    char v7 = (char *)*((unsigned __int8 *)&off_45360 + v4 + 32);
    uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v48);
    *(void *)&__int128 v119 = v48;
    unint64_t v5 = sub_2DE4C((char)v7);
    uint64_t v51 = v48[2];
    BOOL v52 = (v50 & 1) == 0;
    uint64_t v53 = v51 + v52;
    if (__OFADD__(v51, v52))
    {
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      swift_once(&qword_4A740, sub_18828);
      goto LABEL_2;
    }

    char v54 = v50;
    if (v48[3] >= v53)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        uint64_t v48 = (void *)v119;
        if ((v50 & 1) != 0) {
          goto LABEL_21;
        }
      }

      else
      {
        sub_198B0();
        uint64_t v48 = (void *)v119;
        if ((v54 & 1) != 0) {
          goto LABEL_21;
        }
      }
    }

    else
    {
      sub_190F0(v53, isUniquelyReferenced_nonNull_native);
      unint64_t v55 = sub_2DE4C((char)v7);
      if ((v54 & 1) != (v56 & 1)) {
        goto LABEL_72;
      }
      unint64_t v5 = v55;
      uint64_t v48 = (void *)v119;
      if ((v54 & 1) != 0)
      {
LABEL_21:
        a1 = (void *)v48[7];
        swift_bridgeObjectRelease(*((void *)a1 + v5));
        *((void *)a1 + v5) = _swiftEmptyArrayStorage;
        goto LABEL_22;
      }
    }

    v48[(v5 >> 6) + 8] |= 1LL << v5;
    *(_BYTE *)(v48[6] + v5) = (_BYTE)v7;
    *(void *)(v48[7] + 8 * v5) = _swiftEmptyArrayStorage;
    uint64_t v57 = v48[2];
    BOOL v58 = __OFADD__(v57, 1LL);
    uint64_t v59 = v57 + 1;
    if (v58) {
      goto LABEL_69;
    }
    void v48[2] = v59;
LABEL_22:
    ++v4;
    swift_bridgeObjectRelease(0x8000000000000000LL);
  }

  while (v4 != 5);
  uint64_t v122 = v48;
  unint64_t v60 = v112;
  uint64_t v61 = v113;
  unint64_t v62 = String.init(contentsOfFile:)(v113, v112);
  uint64_t v64 = sub_2BE8C(0x7FFFFFFFFFFFFFFFLL, 1, v62, v63);
  if (!*(void *)(v64 + 16))
  {
    swift_bridgeObjectRelease(v64);
    swift_bridgeObjectRetain(v60);
    unint64_t v94 = (os_log_s *)Logger.logObject.getter(v93);
    os_log_type_t v95 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v94, v95))
    {
      uint64_t v96 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v97 = swift_slowAlloc(32LL, -1LL);
      *(void *)&__int128 v119 = v97;
      *(_DWORD *)uint64_t v96 = 136315138;
      swift_bridgeObjectRetain(v60);
      uint64_t v117 = sub_25824(v61, v60, (uint64_t *)&v119);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, &v118);
      swift_bridgeObjectRelease_n(v60, 3LL);
      _os_log_impl(&dword_0, v94, v95, "Phoneset couldn't read rows from %s", v96, 0xCu);
      swift_arrayDestroy(v97, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v97, -1LL, -1LL);
      swift_slowDealloc(v96, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v60, 2LL);
    }

    (*(void (**)(char *, uint64_t))(v114 + 8))((char *)v115, v111);
    swift_bridgeObjectRelease(v122);
    return 0LL;
  }

  unint64_t v108 = *(void *)(v64 + 16);
  __int128 v113 = *(_OWORD *)(v64 + 32);
  uint64_t v65 = *(void *)(v64 + 48);
  uint64_t v66 = *(void *)(v64 + 56);
  uint64_t v109 = v64;
  swift_bridgeObjectRetain(v66);
  swift_bridgeObjectRelease(v60);
  __int128 v119 = v113;
  uint64_t v120 = v65;
  uint64_t v121 = v66;
  uint64_t v117 = 44LL;
  unint64_t v118 = 0xE100000000000000LL;
  unint64_t v67 = sub_333F8();
  unint64_t v68 = sub_53D8();
  uint64_t v69 = (void *)StringProtocol.components<A>(separatedBy:)( &v117,  &type metadata for Substring,  &type metadata for String,  v67,  v68);
  swift_bridgeObjectRelease(v66);
  uint64_t v70 = 0LL;
  *(void *)&__int128 v113 = v69 + 7;
  BOOL v71 = (uint64_t *)&_swiftEmptyDictionarySingleton;
  do
  {
    uint64_t v73 = *((char *)&off_45388 + v70 + 32);
    unint64_t v74 = *(void *)&aPhoneset_4[8 * v73 + 8];
    uint64_t v75 = v69[2];
    if (!v75) {
      goto LABEL_36;
    }
    uint64_t v76 = *(void *)&aNvasr_6[8 * v73];
    uint64_t v77 = v69[4];
    uint64_t v78 = v69[5];
    BOOL v79 = v77 == v76 && v74 == v78;
    if (!v79
      && (_stringCompareWithSmolCheck(_:_:expecting:)( v77,  v78,  *(void *)&aNvasr_6[8 * v73],  *(void *)&aPhoneset_4[8 * v73 + 8],  0LL) & 1) == 0)
    {
      uint64_t v82 = (uint64_t *)v113;
      uint64_t v83 = 1LL;
      while (v75 != v83)
      {
        uint64_t v80 = v83;
        uint64_t v84 = *(v82 - 1);
        uint64_t v85 = *v82;
        if (v84 != v76 || v74 != v85)
        {
          char v87 = _stringCompareWithSmolCheck(_:_:expecting:)(v84, v85, v76, v74, 0LL);
          uint64_t v83 = v80 + 1;
          v82 += 2;
          if ((v87 & 1) == 0) {
            continue;
          }
        }

        goto LABEL_45;
      }

LABEL_36:
      unint64_t v72 = v74;
      goto LABEL_37;
    }

    uint64_t v80 = 0LL;
LABEL_45:
    swift_bridgeObjectRelease(v74);
    char v81 = swift_isUniquelyReferenced_nonNull_native(v71);
    *(void *)&__int128 v119 = v71;
    sub_2F71C(v80, v73, v81);
    BOOL v71 = (uint64_t *)v119;
    unint64_t v72 = 0x8000000000000000LL;
LABEL_37:
    swift_bridgeObjectRelease(v72);
    ++v70;
  }

  while (v70 != 5);
  swift_bridgeObjectRelease(v69);
  uint64_t v88 = (uint64_t *)v109;
  if (*(void *)(v109 + 16) < v108)
  {
    __break(1u);
LABEL_72:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Phoneset.Key);
    __break(1u);
    return result;
  }

  unint64_t v89 = v108 - 1;
  uint64_t v90 = v111;
  unint64_t v91 = v114;
  if (v108 == 1)
  {
    uint64_t v92 = v71;
  }

  else
  {
    swift_unknownObjectRetain(v109);
    uint64_t v98 = v88 + 11;
    do
    {
      uint64_t v99 = *(v98 - 1);
      uint64_t v100 = *v98;
      __int128 v119 = *(_OWORD *)(v98 - 3);
      uint64_t v120 = v99;
      uint64_t v121 = v100;
      swift_bridgeObjectRetain(v100);
      sub_2C8DC((unint64_t *)&v119, (uint64_t *)&v122, (uint64_t)v71);
      swift_bridgeObjectRelease(v100);
      v98 += 4;
      --v89;
    }

    while (v89);
    swift_bridgeObjectRelease(v71);
    uint64_t v92 = v88;
  }

  swift_bridgeObjectRelease(v92);
  uint64_t v101 = swift_bridgeObjectRelease(v88);
  uint64_t v102 = (os_log_s *)Logger.logObject.getter(v101);
  os_log_type_t v103 = static os_log_type_t.debug.getter();
  BOOL v104 = os_log_type_enabled(v102, v103);
  id v105 = v116;
  if (v104)
  {
    unint64_t v106 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)unint64_t v106 = 0;
    _os_log_impl(&dword_0, v102, v103, "Completed initialization of Phoneset map", v106, 2u);
    swift_slowDealloc(v106, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v91 + 8))((char *)v115, v90);
  return (uint64_t)v122;
}

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

unint64_t sub_333F8()
{
  unint64_t result = qword_4BDA8;
  if (!qword_4BDA8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Substring, &type metadata for Substring);
    atomic_store(result, (unint64_t *)&qword_4BDA8);
  }

  return result;
}

uint64_t sub_3343C(uint64_t *a1)
{
  unint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = v3[1];
  if (v4 == *v3 && v5 == v6) {
    return 1LL;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, *v3, v6, 0LL) & 1;
  }
}

uint64_t sub_33490()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t sub_334B4()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

uint64_t storeEnumTagSinglePayload for Phoneset.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFB) {
    return ((uint64_t (*)(void))((char *)&loc_33510 + 4 * byte_3A6E5[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_33544 + 4 * byte_3A6E0[v4]))();
}

uint64_t sub_33544(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_3354C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x33554LL);
  }
  return result;
}

uint64_t sub_33560(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x33568LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_3356C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_33574(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Phoneset.Key()
{
  return &type metadata for Phoneset.Key;
}

uint64_t sub_33590()
{
  return sub_263EC(&qword_4BDB0, &qword_4BDB8, (uint64_t)&protocol conformance descriptor for [A]);
}

unint64_t sub_335C0()
{
  unint64_t result = qword_4BDC0;
  if (!qword_4BDC0)
  {
    unint64_t result = swift_getWitnessTable(&unk_3A814, &type metadata for Phoneset.Key);
    atomic_store(result, (unint64_t *)&qword_4BDC0);
  }

  return result;
}

unint64_t sub_33604(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_45448, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5) {
    return 5LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_33650(uint64_t result, uint64_t a2)
{
  if (result < 0)
  {
    __break(1u);
  }

  else
  {
    type metadata accessor for TMDCGroundTruth(0LL);
    return a2;
  }

  return result;
}

uint64_t type metadata accessor for TMDCCoreDataLogger()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin18TMDCCoreDataLogger);
}

void sub_336D4(uint64_t a1)
{
}

void *sub_336F4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  if (__src) {
    uint64_t v4 = a2 - (void)__src;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (!__dst)
  {
    if (v4 <= 0) {
      return __src;
    }
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutableRawBufferPointer.copyMemory source has too many elements",  69LL,  2LL,  "Swift/UnsafeRawBufferPointer.swift",  34LL,  2,  487LL,  0);
    __break(1u);
    return __src;
  }

  if (__src) {
    return memmove(__dst, __src, a2 - (void)__src);
  }
  return __src;
}

uint64_t sub_33788@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_337B0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_33820(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_337CC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_33988(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_337E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_33AE4(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_33804(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_33CC4(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_33820(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_501C((uint64_t *)&unk_4B6A0);
    char v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    *((void *)v11 + sub_541C(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 4);
  }

  else
  {
    char v11 = (char *)_swiftEmptyArrayStorage;
  }

  NSString v14 = v11 + 32;
  NSString v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8]) {
      memmove(v14, v15, 16 * v8);
    }
    *((void *)a4 + sub_541C(v0 + 2) = 0LL;
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

uint64_t sub_33988(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_501C(&qword_4BEB0);
    char v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + sub_541C(v0 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    char v11 = (char *)_swiftEmptyArrayStorage;
  }

  NSString v14 = v11 + 32;
  NSString v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[8 * v8]) {
      memmove(v14, v15, 8 * v8);
    }
    *((void *)a4 + sub_541C(v0 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v15 >= &v14[8 * v8] || v14 >= &v15[8 * v8])
  {
    memcpy(v14, v15, 8 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_33AE4(char a1, int64_t a2, char a3, void *a4)
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
    NSString v15 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_501C(&qword_4BE98);
  uint64_t v11 = *(void *)(type metadata accessor for UUID(0LL) - 8);
  uint64_t v12 = *(void *)(v11 + 72);
  uint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  uint64_t v14 = (v13 + 32) & ~v13;
  NSString v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
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
  uint64_t v18 = type metadata accessor for UUID(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v15 + v20;
  unint64_t v22 = (char *)a4 + v20;
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
  BOOL v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

uint64_t sub_33CC4(char a1, int64_t a2, char a3, void *a4)
{
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = sub_501C(&qword_4BEA0);
    uint64_t v11 = (void *)swift_allocObject(v10, 24 * v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    void v11[2] = v8;
    v11[3] = 2 * ((uint64_t)(v12 - 32) / 24);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  unint64_t v13 = (unint64_t)(v11 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= v14 + 24 * v8) {
      memmove(v11 + 4, a4 + 4, 24 * v8);
    }
    a4[2] = 0LL;
    goto LABEL_28;
  }

  if (v14 >= v13 + 24 * v8 || v13 >= v14 + 24 * v8)
  {
    sub_501C(&qword_4BEA8);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

void sub_33E68(void *a1, void *a2, void *a3)
{
  uint64_t v7 = type metadata accessor for TMDCGroundTruth(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  NSString v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3)
  {
    uint64_t v61 = v8;
    size_t v16 = (void *)dispatch thunk of CoreDataStore.context.getter(v13);
    uint64_t v64 = &v57;
    __chkstk_darwin(v16);
    *(&v57 - 4) = a2;
    *(&v57 - 3) = a3;
    *(&v57 - sub_541C(v0 + 2) = a1;
    uint64_t v17 = sub_501C(&qword_4BE90);
    NSManagedObjectContext.performAndWait<A>(_:)(&v65, sub_344D8, &v57 - 6, v17);

    if (v3) {
      return;
    }
    unint64_t v60 = a1;
    unint64_t v18 = v65[2];
    uint64_t v19 = (void *)(v18 - 2);
    if (v18 <= 2)
    {
      swift_bridgeObjectRelease(v65);
      return;
    }

    uint64_t v59 = 0LL;
    uint64_t v20 = sub_33650(v18 - 2, (uint64_t)v65);
    uint64_t v63 = v22;
    uint64_t v64 = (void **)(v23 >> 1);
    uint64_t v24 = (v23 >> 1) - v21;
    if (__OFSUB__(v23 >> 1, v21))
    {
      __break(1u);
    }

    else
    {
      uint64_t v57 = v19;
      if (!v24)
      {
        uint64_t v42 = swift_unknownObjectRelease(v20);
        uint64_t v28 = _swiftEmptyArrayStorage;
LABEL_23:
        uint64_t v43 = v60;
        os_log_type_t v44 = (void *)dispatch thunk of CoreDataStore.context.getter(v42);
        __chkstk_darwin(v44);
        *(&v57 - sub_541C(v0 + 2) = v43;
        *(&v57 - 1) = v28;
        uint64_t v45 = v59;
        NSManagedObjectContext.performAndWait<A>(_:)( &type metadata for (),  sub_344F4,  &v57 - 4,  &type metadata for () + 1);
        if (v45)
        {
          swift_bridgeObjectRelease(v28);

          return;
        }

        swift_bridgeObjectRelease(v28);

        if (qword_4A778 == -1) {
          goto LABEL_26;
        }
        goto LABEL_34;
      }

      uint64_t v25 = v21;
      uint64_t v58 = v20;
      uint64_t v65 = _swiftEmptyArrayStorage;
      sub_337E8(0, v24 & ~(v24 >> 63), 0);
      if ((v24 & 0x8000000000000000LL) == 0)
      {
        uint64_t v26 = v64;
        unint64_t v62 = v26;
        uint64_t v27 = v61;
        while (v62 != (void **)v25)
        {
          sub_9D34(v63 + *(void *)(v27 + 72) * v25, (uint64_t)v10);
          (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v10, v11);
          sub_9D78((uint64_t)v10);
          uint64_t v28 = v65;
          if ((swift_isUniquelyReferenced_nonNull_native(v65) & 1) == 0)
          {
            sub_337E8(0, v28[2] + 1LL, 1);
            uint64_t v27 = v61;
            uint64_t v28 = v65;
          }

          unint64_t v30 = v28[2];
          unint64_t v29 = v28[3];
          if (v30 >= v29 >> 1)
          {
            sub_337E8(v29 > 1, v30 + 1, 1);
            uint64_t v27 = v61;
            uint64_t v28 = v65;
          }

          v28[2] = v30 + 1;
          (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))( (unint64_t)v28 + ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80))
          + *(void *)(v12 + 72) * v30,
            v15,
            v11);
          uint64_t v65 = v28;
          if (v64 == (void **)++v25)
          {
            uint64_t v42 = swift_unknownObjectRelease(v58);
            goto LABEL_23;
          }
        }

        __break(1u);
        goto LABEL_31;
      }
    }

    __break(1u);
LABEL_34:
    swift_once(&qword_4A778, sub_349B4);
LABEL_26:
    uint64_t v46 = type metadata accessor for Logger(0LL);
    uint64_t v47 = sub_4F30(v46, (uint64_t)qword_4FC70);
    uint64_t v48 = (os_log_s *)Logger.logObject.getter(v47);
    os_log_type_t v55 = static os_log_type_t.debug.getter(v48, v49, v50, v51, v52, v53, v54);
    if (os_log_type_enabled(v48, v55))
    {
      char v56 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)char v56 = 134217984;
      uint64_t v65 = v57;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v65, &v66);
      _os_log_impl(&dword_0, v48, v55, "Deleted %ld ground truths", v56, 0xCu);
      swift_slowDealloc(v56, -1LL, -1LL);
    }

    return;
  }

  if (qword_4A778 != -1) {
LABEL_31:
  }
    swift_once(&qword_4A778, sub_349B4);
  uint64_t v31 = type metadata accessor for Logger(0LL);
  uint64_t v32 = sub_4F30(v31, (uint64_t)qword_4FC70);
  uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
  os_log_type_t v40 = static os_log_type_t.error.getter(v33, v34, v35, v36, v37, v38, v39);
  if (os_log_type_enabled(v33, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v41 = 0;
    _os_log_impl(&dword_0, v33, v40, "Skipping CoreData storage because overriddenContactIdentifier is nil", v41, 2u);
    swift_slowDealloc(v41, -1LL, -1LL);
  }
}

void sub_34344(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 16);
  if (v3)
  {
    uint64_t v4 = v1;
    uint64_t v6 = swift_retain(*(void *)(v1 + 16));
    uint64_t v7 = (void *)dispatch thunk of CoreDataStore.context.getter(v6);
    __chkstk_darwin(v7);
    v15[2] = a1;
    v15[3] = v3;
    NSManagedObjectContext.performAndWait<A>(_:)(&v16, sub_344A8, v15, &type metadata for () + 1);
    if (v2)
    {
      swift_release(v3);
    }

    else
    {

      uint64_t v11 = type metadata accessor for TMDCGroundTruth(0LL);
      if ((*(_BYTE *)(v4 + 24) & 1) != 0)
      {
        swift_release(v3);
      }

      else
      {
        sub_33E68(v3, *(void **)(a1 + *(int *)(v11 + 52)), *(void **)(a1 + *(int *)(v11 + 52) + 8));
        uint64_t v13 = (void *)dispatch thunk of CoreDataStore.context.getter(v12);
        NSManagedObjectContext.performAndWait<A>(_:)(v14, sub_344C0, v3, &type metadata for () + 1);
        swift_release(v3);
      }
    }
  }

  else
  {
    unint64_t v8 = sub_9058();
    uint64_t v9 = swift_allocError(&type metadata for TMDCLoggingError, v8, 0LL, 0LL);
    *uint64_t v10 = 0LL;
    v10[1] = 0LL;
    swift_willThrow(v9);
  }

void sub_344A8()
{
}

void sub_344C0()
{
}

void sub_344D8(void *a1@<X8>)
{
}

void sub_344F4()
{
}

uint64_t sub_3450C(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = &v22[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  if (qword_4A790 != -1) {
    uint64_t v9 = swift_once(&qword_4A790, sub_34B58);
  }
  int v12 = byte_4FCB8;
  uint64_t v13 = (void *)OSSignposter.logHandle.getter(v9);
  os_signpost_type_t v14 = static os_signpost_type_t.begin.getter();
  uint64_t result = OS_os_log.signpostsEnabled.getter();
  if (v12 == 1)
  {
    if ((result & 1) == 0)
    {
LABEL_12:

      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v11, a4, v7);
LABEL_24:
      uint64_t v21 = type metadata accessor for OSSignpostIntervalState(0LL);
      swift_allocObject(v21, *(unsigned int *)(v21 + 48), *(unsigned __int16 *)(v21 + 52));
      return OSSignpostIntervalState.init(id:isOpen:)(v11, 1LL);
    }

    if ((a3 & 1) != 0)
    {
      if ((unint64_t)a1 >> 32)
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }

      if (a1 >> 11 == 27)
      {
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }

      a1 = v22;
    }

    else if (!a1)
    {
      __break(1u);
      goto LABEL_8;
    }

    uint64_t v16 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16);
    v16(v11, a4, v7);
    uint64_t v17 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v17 = 0;
    os_signpost_id_t v18 = OSSignpostID.rawValue.getter();
    os_signpost_type_t v19 = v14;
    uint64_t v20 = "";
LABEL_23:
    _os_signpost_emit_with_name_impl(&dword_0, (os_log_t)v13, v19, v18, a1, v20, v17, 2u);
    swift_slowDealloc(v17, -1LL, -1LL);

    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
    v16(v11, a4, v7);
    goto LABEL_24;
  }

void sub_3476C(const char *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for OSSignpostID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_4A790 != -1) {
    swift_once(&qword_4A790, sub_34B58);
  }
  int v11 = byte_4FCB8;
  id v19 = (id)OSSignposter.logHandle.getter();
  os_signpost_type_t v12 = static os_signpost_type_t.event.getter();
  char v13 = OS_os_log.signpostsEnabled.getter();
  if (v11 == 1)
  {
    if ((v13 & 1) == 0)
    {
LABEL_12:

      return;
    }

    if ((a3 & 1) != 0)
    {
      if ((unint64_t)a1 >> 32)
      {
        __break(1u);
LABEL_25:
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
        goto LABEL_28;
      }

      if (a1 >> 11 == 27)
      {
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }

      a1 = &v20;
    }

    else if (!a1)
    {
      __break(1u);
      goto LABEL_8;
    }

    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a4, v7);
    os_signpost_type_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)os_signpost_type_t v14 = 0;
    os_signpost_id_t v15 = OSSignpostID.rawValue.getter();
    os_signpost_type_t v16 = v12;
    uint64_t v17 = "";
LABEL_23:
    _os_signpost_emit_with_name_impl(&dword_0, (os_log_t)v19, v16, v15, a1, v17, v14, 2u);
    swift_slowDealloc(v14, -1LL, -1LL);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return;
  }

LABEL_29:
  __break(1u);
}

uint64_t sub_349B4(uint64_t a1)
{
  return sub_349FC(a1, qword_4FC70, 0xD000000000000019LL, 0x800000000003C620LL);
}

uint64_t sub_349D8(uint64_t a1)
{
  return sub_349FC(a1, qword_4FC88, 0xD000000000000022LL, 0x800000000003C5F0LL);
}

uint64_t sub_349FC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for Logger(0LL);
  sub_32618(v7, a2);
  sub_4F30(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD000000000000013LL, 0x800000000003C5D0LL, a3, a4);
}

uint64_t sub_34A70()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for OSSignposter(0LL);
  sub_32618(v4, qword_4FCA0);
  sub_4F30(v4, (uint64_t)qword_4FCA0);
  if (qword_4A780 != -1) {
    swift_once(&qword_4A780, sub_349D8);
  }
  uint64_t v5 = sub_4F30(v0, (uint64_t)qword_4FC88);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v5, v0);
  return OSSignposter.init(logger:)(v3);
}

void sub_34B58()
{
  id v0 = [(id)objc_opt_self(NSUserDefaults) standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  unsigned __int8 v2 = [v0 BOOLForKey:v1];

  byte_4FCB8 = v2;
}

void *sub_34BE4()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_34BF0@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TMDCGroundTruthCoreDataRecord();
  uint64_t result = Identifiable<>.id.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_34C30()
{
  uint64_t v49 = sub_501C(&qword_4BEB8);
  __chkstk_darwin(v49);
  uint64_t v50 = (uint64_t)&v45 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v1 = sub_501C(&qword_4BEC0);
  uint64_t v2 = __chkstk_darwin(v1);
  uint64_t v46 = (uint64_t)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v48 = (char *)&v45 - v5;
  __chkstk_darwin(v4);
  uint64_t v47 = (char *)&v45 - v6;
  uint64_t v7 = type metadata accessor for Locale(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v45 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  os_signpost_type_t v12 = (char *)&v45 - v11;
  uint64_t v13 = type metadata accessor for CurrentLocales(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = __chkstk_darwin(v15);
  char v20 = (char *)&v45 - v19;
  if (qword_4A738 != -1) {
    uint64_t v18 = swift_once(&qword_4A738, sub_1857C);
  }
  uint64_t v21 = qword_4FC58;
  uint64_t v22 = LocalesController.currentLocales.getter(v18);
  CurrentLocales.siri.getter(v22);
  char v23 = *(void (**)(char *, uint64_t))(v14 + 8);
  v23(v20, v13);
  if (*(void *)(v21 + 16) && (unint64_t v24 = sub_2E030((uint64_t)v12), (v25 & 1) != 0))
  {
    unint64_t v26 = *(void *)(v21 + 56) + *(void *)(v8 + 72) * v24;
    uint64_t v27 = (uint64_t)v47;
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v47, v26, v7);
    uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v28(v27, 0LL, 1LL, v7);
  }

  else
  {
    uint64_t v28 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
    uint64_t v27 = (uint64_t)v47;
    v28((uint64_t)v47, 1LL, 1LL, v7);
  }

  uint64_t v47 = *(char **)(v8 + 8);
  uint64_t v29 = ((uint64_t (*)(char *, uint64_t))v47)(v12, v7);
  uint64_t v30 = LocalesController.currentLocales.getter(v29);
  uint64_t v31 = (uint64_t)v48;
  CurrentLocales.siriVoice.getter(v30);
  v23(v17, v13);
  v28(v31, 0LL, 1LL, v7);
  uint64_t v32 = v50;
  uint64_t v33 = v50 + *(int *)(v49 + 48);
  sub_35058(v27, v50);
  sub_35058(v31, v33);
  uint64_t v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  if (v34(v32, 1LL, v7) == 1)
  {
    sub_BA5C(v31, &qword_4BEC0);
    sub_BA5C(v27, &qword_4BEC0);
    int v35 = v34(v33, 1LL, v7);
    if (v35 == 1) {
      uint64_t v36 = &qword_4BEC0;
    }
    else {
      uint64_t v36 = &qword_4BEB8;
    }
    if (v35 == 1) {
      char v37 = -1;
    }
    else {
      char v37 = 0;
    }
  }

  else
  {
    uint64_t v38 = v46;
    sub_35058(v32, v46);
    if (v34(v33, 1LL, v7) == 1)
    {
      sub_BA5C(v31, &qword_4BEC0);
      sub_BA5C(v27, &qword_4BEC0);
      ((void (*)(uint64_t, uint64_t))v47)(v38, v7);
      char v37 = 0;
      uint64_t v36 = &qword_4BEB8;
    }

    else
    {
      uint64_t v39 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 32);
      os_log_type_t v40 = v45;
      v39(v45, v33, v7);
      unint64_t v41 = sub_350A0();
      char v37 = dispatch thunk of static Equatable.== infix(_:_:)(v38, v40, v7, v41);
      uint64_t v42 = v40;
      uint64_t v43 = v47;
      ((void (*)(char *, uint64_t))v47)(v42, v7);
      uint64_t v36 = &qword_4BEC0;
      sub_BA5C(v31, &qword_4BEC0);
      sub_BA5C(v27, &qword_4BEC0);
      ((void (*)(uint64_t, uint64_t))v43)(v38, v7);
    }
  }

  sub_BA5C(v32, v36);
  return v37 & 1;
}

uint64_t sub_35058(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_501C(&qword_4BEC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_350A0()
{
  unint64_t result = qword_4B690;
  if (!qword_4B690)
  {
    uint64_t v1 = type metadata accessor for Locale(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Locale, v1);
    atomic_store(result, (unint64_t *)&qword_4B690);
  }

  return result;
}

char *sub_350E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_501C(&qword_4B7E8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v58 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v44 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  os_signpost_type_t v12 = (char *)&v44 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v44 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v50 = (uint64_t)&v44 - v17;
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v44 - v18;
  uint64_t v20 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v47 = (char *)&v44 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = __chkstk_darwin(v22);
  __chkstk_darwin(v24);
  uint64_t v46 = (char *)&v44 - v26;
  unint64_t v54 = *(void *)(a1 + 16);
  if (!v54) {
    return (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v61 = v25;
  uint64_t v64 = a2;
  uint64_t v45 = v19;
  uint64_t v27 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFF8LL));
LABEL_4:
  unint64_t v28 = 0LL;
  unint64_t v44 = (*(unsigned __int8 *)(v21 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  unint64_t v49 = a1 + v44;
  uint64_t v51 = *(void *)(v21 + 72);
  os_log_type_t v55 = *(void (**)(uint64_t, unint64_t, uint64_t))(v21 + 16);
  unint64_t v63 = a2 & 0xC000000000000001LL;
  unint64_t v57 = v54 - 1;
  uint64_t v48 = (char *)_swiftEmptyArrayStorage;
  unint64_t v62 = v12;
  uint64_t v59 = v27;
  do
  {
    unint64_t v56 = v28 + 1;
    BOOL v29 = __OFADD__(v28, 1LL);
    BOOL v53 = v29;
    a1 = v50;
    unint64_t v60 = v28;
    v55(v50, v49 + v51 * v28, v20);
    uint64_t v30 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    v30(a1, 0LL, 1LL, v20);
    sub_1FB58(a1, (uint64_t)v15, &qword_4B7E8);
    if (v27)
    {
      if (v27 < 1) {
        goto LABEL_36;
      }
      unint64_t v52 = v49 + v56 * v51;
      swift_bridgeObjectRetain(a2);
      a1 = 0LL;
      while (1)
      {
        if (v63)
        {
          a2 = specialized _ArrayBuffer._getElementSlowPath(_:)(a1, a2);
        }

        else
        {
          a2 = *(void *)(a2 + 8 * a1 + 32);
          swift_retain(a2);
        }

        sub_1FB58((uint64_t)v15, (uint64_t)v9, &qword_4B7E8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v9, 1LL, v20) == 1)
        {
          sub_BA5C((uint64_t)v9, &qword_4B7E8);
          v30((uint64_t)v12, 1LL, 1LL, v20);
        }

        else
        {
          uint64_t v31 = v61;
          (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v61, v9, v20);
          if (v60 == v57)
          {
            uint64_t v32 = v58;
            v30((uint64_t)v58, 1LL, 1LL, v20);
          }

          else
          {
            if (v53)
            {
              __break(1u);
LABEL_35:
              __break(1u);
LABEL_36:
              __break(1u);
LABEL_37:
              if (a2 < 0) {
                uint64_t v42 = v64;
              }
              else {
                uint64_t v42 = a2 & 0xFFFFFFFFFFFFFF8LL;
              }
              swift_bridgeObjectRetain(v64);
              uint64_t v43 = v42;
              a2 = v64;
              uint64_t v27 = _CocoaArrayWrapper.endIndex.getter(v43);
              swift_bridgeObjectRelease(a2);
              goto LABEL_4;
            }

            if (v56 >= v54) {
              goto LABEL_35;
            }
            uint64_t v32 = v58;
            v55((uint64_t)v58, v52, v20);
            v30((uint64_t)v32, 0LL, 1LL, v20);
            uint64_t v31 = v61;
          }

          dispatch thunk of CoreDuetEventCoalescing.process(_:next:)(v31, v32);
          uint64_t v33 = (uint64_t)v32;
          os_signpost_type_t v12 = v62;
          sub_BA5C(v33, &qword_4B7E8);
          (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v31, v20);
          uint64_t v27 = v59;
        }

        swift_release(a2);
        ++a1;
        sub_BA5C((uint64_t)v15, &qword_4B7E8);
        sub_36B1C((uint64_t)v12, (uint64_t)v15);
        a2 = v64;
        if (v27 == a1)
        {
          swift_bridgeObjectRelease(v64);
          break;
        }
      }
    }

    uint64_t v34 = (uint64_t)v45;
    sub_36B1C((uint64_t)v15, (uint64_t)v45);
    sub_BA5C(v50, &qword_4B7E8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v34, 1LL, v20) == 1)
    {
      sub_BA5C(v34, &qword_4B7E8);
    }

    else
    {
      int v35 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
      uint64_t v36 = v46;
      v35(v46, v34, v20);
      v55((uint64_t)v47, (unint64_t)v36, v20);
      if ((swift_isUniquelyReferenced_nonNull_native(v48) & 1) == 0) {
        uint64_t v48 = (char *)sub_13FD8(0, *((void *)v48 + 2) + 1LL, 1, (unint64_t)v48);
      }
      unint64_t v38 = *((void *)v48 + 2);
      unint64_t v37 = *((void *)v48 + 3);
      uint64_t v27 = v59;
      if (v38 >= v37 >> 1) {
        uint64_t v48 = (char *)sub_13FD8(v37 > 1, v38 + 1, 1, (unint64_t)v48);
      }
      uint64_t v39 = v47;
      os_log_type_t v40 = v48;
      *((void *)v48 + sub_541C(v0 + 2) = v38 + 1;
      v35(&v40[v44 + v38 * v51], (uint64_t)v39, v20);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v46, v20);
      a2 = v64;
    }

    unint64_t v28 = v56;
  }

  while (v56 != v54);
  return v48;
}

void sub_35668(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = sub_501C(&qword_4B7E8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v97 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v109 = *(void *)(v10 - 8);
  uint64_t v110 = v10;
  __chkstk_darwin(v10);
  unint64_t v108 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v119 = a2;
  uint64_t v12 = *(void *)(a2 + 16);
  if (v12)
  {
    uint64_t v101 = v9;
    uint64_t v97 = a3;
    int v100 = a1 & 1;
    unint64_t v118 = (void *)(v3 + 16);
    uint64_t v98 = v119 + 32;
    __n128 v13 = swift_bridgeObjectRetain(v119);
    uint64_t v115 = 0LL;
    unint64_t v112 = 0LL;
    __int128 v113 = 0LL;
    uint64_t v111 = 0LL;
    uint64_t v14 = 32LL;
    v13.n128_u64[0] = 136315138LL;
    __n128 v107 = v13;
    uint64_t v102 = (char *)&type metadata for Any + 8;
    uint64_t v99 = v12;
    uint64_t v15 = v3;
    uint64_t v117 = v3;
    do
    {
      uint64_t v16 = *(void *)(v119 + v14);
      sub_4FF8(v118, *(void *)(v15 + 40));
      uint64_t v17 = (uint64_t (**)(char *, unint64_t, uint64_t))swift_retain(v16);
      sub_BAC0(v17);
      uint64_t v22 = v18;
      if (v18)
      {
        uint64_t v23 = v19;
        uint64_t v24 = v21;
        id v116 = v20;
        unint64_t v25 = *(void *)(v18 + 16);
        if (v25 > 1)
        {
          unint64_t v114 = v21;
          if (qword_4A778 != -1) {
            swift_once(&qword_4A778, sub_349B4);
          }
          uint64_t v26 = type metadata accessor for Logger(0LL);
          sub_4F30(v26, (uint64_t)qword_4FC70);
          uint64_t v27 = swift_retain_n(v16, 2LL);
          unint64_t v28 = (os_log_s *)Logger.logObject.getter(v27);
          os_log_type_t v29 = static os_log_type_t.debug.getter();
          int v30 = v29;
          if (os_log_type_enabled(v28, v29))
          {
            uint64_t v31 = (_DWORD *)swift_slowAlloc(12LL, -1LL);
            BOOL v104 = v31;
            uint64_t v32 = swift_slowAlloc(32LL, -1LL);
            os_log_t v105 = v28;
            uint64_t v106 = v32;
            v120[0] = v32;
            *uint64_t v31 = v107.n128_u32[0];
            uint64_t v33 = v108;
            Turn.turnID.getter(v32);
            unint64_t v34 = sub_B948();
            uint64_t v35 = v110;
            uint64_t v36 = dispatch thunk of CustomStringConvertible.description.getter(v110, v34);
            int v103 = v30;
            unint64_t v38 = v37;
            uint64_t v39 = v35;
            uint64_t v15 = v117;
            (*(void (**)(char *, uint64_t))(v109 + 8))(v33, v39);
            uint64_t v40 = sub_25824(v36, v38, v120);
            unint64_t v41 = (uint8_t *)v104;
            *(void *)(v104 + 1) = v40;
            swift_release_n(v16, 2LL);
            swift_bridgeObjectRelease(v38);
            os_log_t v42 = v105;
            _os_log_impl( &dword_0,  v105,  (os_log_type_t)v103,  "[%s]: More than 1 contact names found in the turn",  v41,  0xCu);
            uint64_t v43 = v106;
            swift_arrayDestroy(v106, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v43, -1LL, -1LL);
            swift_slowDealloc(v41, -1LL, -1LL);
          }

          else
          {

            swift_release_n(v16, 2LL);
          }

          uint64_t v24 = v114;
          unint64_t v25 = *(void *)(v22 + 16);
        }

        if (v25)
        {
          sub_36BC4(v115, v113, v112, v111);
          swift_release(v16);
          uint64_t v115 = v22;
          unint64_t v112 = v116;
          __int128 v113 = v23;
          uint64_t v111 = v24;
        }

        else
        {
          unint64_t v114 = v24;
          if (qword_4A778 != -1) {
            swift_once(&qword_4A778, sub_349B4);
          }
          uint64_t v59 = type metadata accessor for Logger(0LL);
          sub_4F30(v59, (uint64_t)qword_4FC70);
          uint64_t v60 = swift_retain_n(v16, 2LL);
          uint64_t v61 = (os_log_s *)Logger.logObject.getter(v60);
          os_log_type_t v62 = static os_log_type_t.debug.getter();
          int v63 = v62;
          if (os_log_type_enabled(v61, v62))
          {
            uint64_t v64 = (_DWORD *)swift_slowAlloc(12LL, -1LL);
            BOOL v104 = v64;
            uint64_t v65 = swift_slowAlloc(32LL, -1LL);
            os_log_t v105 = v61;
            uint64_t v106 = v65;
            v120[0] = v65;
            *uint64_t v64 = v107.n128_u32[0];
            uint64_t v66 = v108;
            Turn.turnID.getter(v65);
            unint64_t v67 = sub_B948();
            uint64_t v68 = v110;
            uint64_t v69 = dispatch thunk of CustomStringConvertible.description.getter(v110, v67);
            int v103 = v63;
            unint64_t v71 = v70;
            uint64_t v72 = v68;
            uint64_t v15 = v117;
            (*(void (**)(char *, uint64_t))(v109 + 8))(v66, v72);
            uint64_t v73 = sub_25824(v69, v71, v120);
            unint64_t v74 = (uint8_t *)v104;
            *(void *)(v104 + 1) = v73;
            swift_release_n(v16, 2LL);
            swift_bridgeObjectRelease(v71);
            os_log_t v75 = v105;
            uint64_t v76 = v74;
            _os_log_impl(&dword_0, v105, (os_log_type_t)v103, "[%s]: No contacts found in the turn", v74, 0xCu);
            uint64_t v77 = v106;
            swift_arrayDestroy(v106, 1LL, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v77, -1LL, -1LL);
            swift_slowDealloc(v76, -1LL, -1LL);
            swift_release(v16);
            swift_bridgeObjectRelease(v22);
          }

          else
          {

            swift_bridgeObjectRelease(v22);
            swift_release_n(v16, 3LL);
          }
        }
      }

      else
      {
        if (qword_4A778 != -1) {
          swift_once(&qword_4A778, sub_349B4);
        }
        uint64_t v44 = type metadata accessor for Logger(0LL);
        sub_4F30(v44, (uint64_t)qword_4FC70);
        uint64_t v45 = swift_retain_n(v16, 2LL);
        uint64_t v46 = (os_log_s *)Logger.logObject.getter(v45);
        os_log_type_t v47 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v48 = (char *)swift_slowAlloc(12LL, -1LL);
          unint64_t v114 = v48;
          unint64_t v49 = (void *)swift_slowAlloc(32LL, -1LL);
          id v116 = v49;
          v120[0] = (uint64_t)v49;
          *(_DWORD *)uint64_t v48 = v107.n128_u32[0];
          uint64_t v50 = v108;
          Turn.turnID.getter(v49);
          unint64_t v51 = sub_B948();
          uint64_t v52 = v110;
          uint64_t v53 = dispatch thunk of CustomStringConvertible.description.getter(v110, v51);
          unint64_t v55 = v54;
          (*(void (**)(char *, uint64_t))(v109 + 8))(v50, v52);
          uint64_t v56 = sub_25824(v53, v55, v120);
          unint64_t v57 = (uint8_t *)v114;
          *(void *)(v114 + 4) = v56;
          swift_release_n(v16, 2LL);
          swift_bridgeObjectRelease(v55);
          _os_log_impl( &dword_0,  v46,  v47,  "[%s]: No asrLoggedContactToken was fetched for this turn. Continuing.",  v57,  0xCu);
          id v58 = v116;
          swift_arrayDestroy(v116, 1LL, v102);
          swift_slowDealloc(v58, -1LL, -1LL);
          swift_slowDealloc(v57, -1LL, -1LL);
          swift_release(v16);
        }

        else
        {

          swift_release_n(v16, 3LL);
        }

        uint64_t v15 = v117;
      }

      v14 += 16LL;
      --v12;
    }

    while (v12);
    swift_bridgeObjectRelease(v119);
    uint64_t v78 = v98 + 16 * v99;
    uint64_t v79 = *(void *)(v78 - 16);
    uint64_t v80 = *(void *)(v78 - 8);
    swift_retain(v79);
    swift_bridgeObjectRetain(v80);
    uint64_t v81 = (uint64_t)v108;
    Turn.turnID.getter(v82);
    uint64_t v83 = (uint64_t)v101;
    sub_35FB0(v81, v80, (uint64_t)v101);
    uint64_t v84 = sub_20650(v81, v83, v100);
    uint64_t v86 = v85;
    char v88 = v87;
    swift_bridgeObjectRelease(v80);
    swift_release(v79);
    sub_BA5C(v83, &qword_4B7E8);
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v81, v110);
    if (v115)
    {
      a3 = v97;
      uint64_t v90 = v112;
      unint64_t v89 = v113;
      unint64_t v91 = v111;
      goto LABEL_34;
    }

    swift_bridgeObjectRelease(v86);
    a3 = v97;
  }

  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v92 = type metadata accessor for Logger(0LL);
  uint64_t v93 = sub_4F30(v92, (uint64_t)qword_4FC70);
  unint64_t v94 = (os_log_s *)Logger.logObject.getter(v93);
  os_log_type_t v95 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v94, v95))
  {
    uint64_t v96 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v96 = 0;
    _os_log_impl(&dword_0, v94, v95, "No ASR logged contact token exists", v96, 2u);
    swift_slowDealloc(v96, -1LL, -1LL);
  }

  uint64_t v115 = 0LL;
  unint64_t v89 = 0LL;
  uint64_t v90 = 0LL;
  unint64_t v91 = 0LL;
  uint64_t v84 = 0LL;
  uint64_t v86 = 0LL;
  char v88 = 0;
LABEL_34:
  *(void *)a3 = v115;
  *(void *)(a3 + sub_541C(v0 + 8) = v89;
  *(void *)(a3 + 16) = v90;
  *(void *)(a3 + 24) = v91;
  *(void *)(a3 + 3sub_541C(v0 + 2) = v84;
  *(void *)(a3 + 40) = v86;
  *(_BYTE *)(a3 + 4sub_541C(v0 + 8) = v88;
}

uint64_t sub_35FB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  __n128 v13 = (char *)&v49 - v12;
  swift_retain(v3);
  uint64_t v14 = sub_366C4(a2, v3);
  swift_release(v3);
  uint64_t v15 = sub_350E8((uint64_t)v14, *(void *)(v3 + 72));
  swift_bridgeObjectRelease(v14);
  if (qword_4A778 != -1) {
    swift_once(&qword_4A778, sub_349B4);
  }
  uint64_t v16 = type metadata accessor for Logger(0LL);
  uint64_t v17 = sub_4F30(v16, (uint64_t)qword_4FC70);
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v54 = a1;
  uint64_t v52 = v18;
  v18(v13, a1, v7);
  uint64_t v19 = swift_bridgeObjectRetain_n(v15, 2LL);
  uint64_t v53 = v17;
  uint64_t v20 = (os_log_s *)Logger.logObject.getter(v19);
  os_log_type_t v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = swift_slowAlloc(22LL, -1LL);
    unint64_t v51 = v11;
    uint64_t v23 = v22;
    uint64_t v50 = swift_slowAlloc(32LL, -1LL);
    v57[0] = v50;
    *(_DWORD *)uint64_t v23 = 136315394;
    unint64_t v24 = sub_B948();
    uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter(v7, v24);
    unint64_t v27 = v26;
    uint64_t v28 = sub_25824(v25, v26, v57);
    uint64_t v55 = a3;
    uint64_t v56 = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57);
    swift_bridgeObjectRelease(v27);
    os_log_type_t v29 = *(void (**)(char *, uint64_t))(v8 + 8);
    v29(v13, v7);
    *(_WORD *)(v23 + 1sub_541C(v0 + 2) = 2048;
    uint64_t v30 = *((void *)v15 + 2);
    swift_bridgeObjectRelease(v15);
    uint64_t v56 = v30;
    a3 = v55;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57);
    swift_bridgeObjectRelease(v15);
    _os_log_impl(&dword_0, v20, v21, "[%s]: Coalesced %ld Intent events for the current turn", (uint8_t *)v23, 0x16u);
    uint64_t v31 = v50;
    swift_arrayDestroy(v50, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v31, -1LL, -1LL);
    uint64_t v32 = v23;
    uint64_t v11 = v51;
    swift_slowDealloc(v32, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(v15);
    os_log_type_t v29 = *(void (**)(char *, uint64_t))(v8 + 8);
    v29(v13, v7);

    swift_bridgeObjectRelease(v15);
  }

  unint64_t v33 = *((void *)v15 + 2);
  if (v33 >= 2)
  {
    v52(v11, v54, v7);
    uint64_t v34 = swift_bridgeObjectRetain_n(v15, 2LL);
    uint64_t v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc(22LL, -1LL);
      uint64_t v55 = a3;
      uint64_t v38 = v37;
      uint64_t v54 = swift_slowAlloc(32LL, -1LL);
      v57[0] = v54;
      *(_DWORD *)uint64_t v38 = 136315394;
      uint64_t v53 = v38 + 4;
      unint64_t v39 = sub_B948();
      uint64_t v40 = dispatch thunk of CustomStringConvertible.description.getter(v7, v39);
      unint64_t v42 = v41;
      uint64_t v56 = sub_25824(v40, v41, v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57);
      swift_bridgeObjectRelease(v42);
      v29(v11, v7);
      *(_WORD *)(v38 + 1sub_541C(v0 + 2) = 2048;
      swift_bridgeObjectRelease(v15);
      uint64_t v56 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57);
      swift_bridgeObjectRelease(v15);
      _os_log_impl( &dword_0,  v35,  v36,  "[%s]: Coalesced %ld Intent events for the current turn. Using only the first one.",  (uint8_t *)v38,  0x16u);
      uint64_t v43 = v54;
      swift_arrayDestroy(v54, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v43, -1LL, -1LL);
      uint64_t v44 = v38;
      a3 = v55;
      swift_slowDealloc(v44, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease(v15);
      v29(v11, v7);

      swift_bridgeObjectRelease(v15);
    }

    unint64_t v33 = *((void *)v15 + 2);
  }

  uint64_t v45 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v46 = *(void *)(v45 - 8);
  if (v33)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v46 + 16))( a3,  &v15[(*(unsigned __int8 *)(v46 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80)],  v45);
    uint64_t v47 = 0LL;
  }

  else
  {
    uint64_t v47 = 1LL;
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 56))(a3, v47, 1LL, v45);
  return swift_bridgeObjectRelease(v15);
}

void *sub_36470(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v5 = a3 + 32;
  swift_bridgeObjectRetain(a3);
  uint64_t v6 = _swiftEmptyArrayStorage;
  while (1)
  {
    a1(&v22, v5);
    if (v3)
    {
      swift_bridgeObjectRelease(v6);
      swift_bridgeObjectRelease(a3);
      return v6;
    }

    uint64_t v7 = v22;
    uint64_t v8 = *(void *)(v22 + 16);
    int64_t v9 = v6[2];
    int64_t v10 = v9 + v8;
    if (__OFADD__(v9, v8)) {
      break;
    }
    uint64_t isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native(v6);
    if ((_DWORD)isUniquelyReferenced_nonNull_native && v10 <= v6[3] >> 1)
    {
      if (*(void *)(v7 + 16)) {
        goto LABEL_15;
      }
    }

    else
    {
      if (v9 <= v10) {
        int64_t v12 = v9 + v8;
      }
      else {
        int64_t v12 = v9;
      }
      uint64_t v6 = sub_14790(isUniquelyReferenced_nonNull_native, v12, 1, v6);
      if (*(void *)(v7 + 16))
      {
LABEL_15:
        uint64_t v13 = v6[2];
        if ((v6[3] >> 1) - v13 < v8) {
          goto LABEL_30;
        }
        unint64_t v14 = (unint64_t)&v6[5 * v13 + 4];
        if (v7 + 32 < v14 + 40 * v8 && v14 < v7 + 32 + 40 * v8) {
          goto LABEL_32;
        }
        sub_501C(&qword_4B2A0);
        swift_arrayInitWithCopy(v14);
        if (v8)
        {
          uint64_t v16 = v6[2];
          BOOL v17 = __OFADD__(v16, v8);
          uint64_t v18 = v16 + v8;
          if (v17) {
            goto LABEL_31;
          }
          _OWORD v6[2] = v18;
        }

        goto LABEL_4;
      }
    }

    if (v8) {
      goto LABEL_29;
    }
LABEL_4:
    swift_bridgeObjectRelease(v7);
    v5 += 40LL;
    if (!--v4)
    {
      swift_bridgeObjectRelease(a3);
      return v6;
    }
  }

  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  unint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_36668()
{
  return swift_deallocClassInstance(v0, 80LL, 7LL);
}

uint64_t type metadata accessor for ConversationDataProcessor()
{
  return objc_opt_self(&OBJC_CLASS____TtC44SiriPrivateLearningTTSMispronunciationPlugin25ConversationDataProcessor);
}

void *sub_366C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for CoreDuetEvent(0LL);
  uint64_t v50 = *(void *)(v6 - 8);
  uint64_t v51 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v49 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v47 = (char *)&v44 - v10;
  __chkstk_darwin(v9);
  uint64_t v46 = (char *)&v44 - v11;
  uint64_t v55 = *(void *)(a1 + 16);
  if (v55)
  {
    uint64_t v12 = *(void *)(type metadata accessor for AppInteraction(0LL) - 8);
    uint64_t v13 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v14 = *(void *)(a2 + 64);
    uint64_t v53 = *(void *)(v12 + 72);
    uint64_t v54 = v13;
    uint64_t v45 = a1;
    uint64_t v15 = swift_bridgeObjectRetain(a1);
    uint64_t v16 = 0LL;
    uint64_t v52 = _swiftEmptyArrayStorage;
    while (1)
    {
      uint64_t v17 = v54 + v53 * v16;
      __chkstk_darwin(v15);
      *(&v44 - sub_541C(v0 + 2) = v17;
      swift_bridgeObjectRetain(v14);
      uint64_t v18 = sub_36470((void (*)(uint64_t *__return_ptr, uint64_t))sub_36B64, (uint64_t)(&v44 - 4), v14);
      swift_bridgeObjectRelease(v14);
      uint64_t v19 = v18[2];
      if (v19)
      {
        uint64_t v20 = (uint64_t)(v18 + 4);
        swift_bridgeObjectRetain(v18);
        while (1)
        {
          sub_2116C(v20, (uint64_t)&v57);
          sub_2116C((uint64_t)&v57, (uint64_t)v56);
          uint64_t v21 = sub_501C(&qword_4B2A0);
          uint64_t v22 = type metadata accessor for CommonFeature.EventType(0LL);
          sub_541C(&v57);
          v20 += 40LL;
          if (!--v19)
          {
            swift_bridgeObjectRelease(v18);
            goto LABEL_11;
          }
        }

        uint64_t v23 = v61;
        swift_bridgeObjectRelease(v18);
        swift_release(v23);
        sub_211B0(&v57, (uint64_t)v59);
      }

      else
      {
LABEL_11:
        uint64_t v60 = 0LL;
        memset(v59, 0, sizeof(v59));
      }

      sub_1FB58((uint64_t)v59, (uint64_t)&v57, &qword_4B7F0);
      if (v58)
      {
        uint64_t v24 = sub_501C(&qword_4B2A0);
        uint64_t v25 = type metadata accessor for CommonFeature.EventType(0LL);
        if ((swift_dynamicCast(v56, &v57, v24, v25, 6LL) & 1) != 0)
        {
          uint64_t v48 = v3;
          uint64_t v26 = v56[0];
          uint64_t v27 = swift_retain(v56[0]);
          TypedNamedFeature.value.getter(&v57, v27);
          swift_release_n(v26, 2LL);
          __int128 v28 = v57;
          uint64_t v29 = sub_BA5C((uint64_t)v59, &qword_4B7F0);
          uint64_t v30 = (void *)AppInteraction.interaction.getter(v29);
          id v31 = [v30 identifier];

          uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
          uint64_t v34 = v33;

          uint64_t v35 = v47;
          CoreDuetEvent.init(eventId:features:eventType:)(v32, v34, v18, v28, *((void *)&v28 + 1));
          uint64_t v36 = v51;
          uint64_t v37 = *(void (**)(char *, char *, uint64_t))(v50 + 32);
          uint64_t v38 = v46;
          v37(v46, v35, v51);
          v37(v49, v38, v36);
          if ((swift_isUniquelyReferenced_nonNull_native(v52) & 1) != 0) {
            unint64_t v39 = (unint64_t)v52;
          }
          else {
            unint64_t v39 = sub_13FD8(0, v52[2] + 1LL, 1, (unint64_t)v52);
          }
          unint64_t v41 = *(void *)(v39 + 16);
          unint64_t v40 = *(void *)(v39 + 24);
          uint64_t v3 = v48;
          if (v41 >= v40 >> 1) {
            unint64_t v39 = sub_13FD8(v40 > 1, v41 + 1, 1, v39);
          }
          *(void *)(v39 + 16) = v41 + 1;
          unint64_t v42 = (*(unsigned __int8 *)(v50 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
          uint64_t v52 = (void *)v39;
          uint64_t v15 = ((uint64_t (*)(unint64_t, char *, uint64_t))v37)( v39 + v42 + *(void *)(v50 + 72) * v41,  v49,  v51);
          goto LABEL_5;
        }
      }

      else
      {
        sub_BA5C((uint64_t)&v57, &qword_4B7F0);
      }

      sub_BA5C((uint64_t)v59, &qword_4B7F0);
      uint64_t v15 = swift_bridgeObjectRelease(v18);
LABEL_5:
      if (++v16 == v55)
      {
        swift_bridgeObjectRelease(v45);
        return v52;
      }
    }
  }

  return _swiftEmptyArrayStorage;
}

uint64_t sub_36B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_501C(&qword_4B7E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_36B64@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = *(void *)(v2 + 16);
  uint64_t v5 = a1[3];
  uint64_t v6 = a1[4];
  sub_4FF8(a1, v5);
  uint64_t result = dispatch thunk of AppInteractionFeatureExtractor.extract(from:)(v4, v5, v6);
  *a2 = result;
  return result;
}

void sub_36BC4(uint64_t a1, void *a2, void *a3, void *a4)
{
  if (a1)
  {
    swift_bridgeObjectRelease(a1);
  }

uint64_t _s28SiriPrivateLearningAnalytics6LocaleV0abC25TTSMispronunciationPluginE17phonemeDataFormatSSvg_0()
{
  return Locale.stringFormat.getter();
}