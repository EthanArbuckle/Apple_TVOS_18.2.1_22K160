double M_PI.getter()
{
  return 3.14159265;
}

double M_PI_2.getter()
{
  return 1.57079633;
}

double M_PI_4.getter()
{
  return 0.785398163;
}

void one-time initialization function for M_SQRT2()
{
  M_SQRT2 = 1.41421356;
}

double M_SQRT2.getter()
{
  return M_SQRT2.getter(&one-time initialization token for M_SQRT2, (uint64_t)&M_SQRT2);
}

void one-time initialization function for M_SQRT1_2()
{
  M_SQRT1_2 = 0.707106781;
}

double M_SQRT1_2.getter()
{
  return M_SQRT2.getter(&one-time initialization token for M_SQRT1_2, (uint64_t)&M_SQRT1_2);
}

double M_SQRT2.getter(void *a1, uint64_t a2)
{
  if (*a1 != -1LL) {
    swift_once();
  }
  return *(double *)a2;
}

uint64_t fabs<A>(_:)()
{
  return dispatch thunk of Numeric.magnitude.getter();
}

uint64_t sqrt<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of FloatingPoint.squareRoot()(a2, a3);
}

uint64_t fma<A>(_:_:_:)()
{
  return dispatch thunk of FloatingPoint.addingProduct(_:_:)();
}

uint64_t remainder<A>(_:_:)()
{
  return dispatch thunk of FloatingPoint.remainder(dividingBy:)();
}

uint64_t fmod<A>(_:_:)()
{
  return dispatch thunk of FloatingPoint.truncatingRemainder(dividingBy:)();
}

uint64_t ceil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ceil<A>(_:)(a1, a2, a3, MEMORY[0x189619F88]);
}

uint64_t floor<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ceil<A>(_:)(a1, a2, a3, MEMORY[0x189619F90]);
}

uint64_t round<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ceil<A>(_:)(a1, a2, a3, MEMORY[0x189619F78]);
}

uint64_t trunc<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ceil<A>(_:)(a1, a2, a3, MEMORY[0x189619F60]);
}

uint64_t ceil<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v5 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *a4, v5);
  dispatch thunk of FloatingPoint.rounded(_:)();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t scalbn<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 - 8);
  MEMORY[0x1895F8858]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858]();
  uint64_t v14 = a2;
  uint64_t v10 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  unint64_t v11 = lazy protocol witness table accessor for type Int and conformance Int();
  MEMORY[0x1895E89D8](&v14, MEMORY[0x189618740], v11, AssociatedTypeWitness, v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a3);
  return dispatch thunk of FloatingPoint.init(sign:exponent:significand:)();
}

unint64_t lazy protocol witness table accessor for type Int and conformance Int()
{
  unint64_t result = lazy protocol witness table cache variable for type Int and conformance Int;
  if (!lazy protocol witness table cache variable for type Int and conformance Int)
  {
    unint64_t result = MEMORY[0x1895E8C24](MEMORY[0x189618788], MEMORY[0x189618740]);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Int and conformance Int);
  }

  return result;
}

uint64_t modf<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a2;
  uint64_t v22 = a1;
  uint64_t v20 = *(void *)(a4 - 8);
  MEMORY[0x1895F8858]();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = *(void *)(*(void *)(v8 + 16) + 8LL);
  uint64_t v9 = *(void *)(v21 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858]();
  v12 = (char *)&v19 - v11;
  uint64_t v13 = type metadata accessor for FloatingPointRoundingRule();
  uint64_t v14 = *(void *)(v13 - 8);
  MEMORY[0x1895F8858]();
  v16 = (char *)&v19 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = a3;
  if ((dispatch thunk of FloatingPoint.isFinite.getter() & 1) != 0)
  {
    (*(void (**)(char *, void, uint64_t))(v14 + 104))(v16, *MEMORY[0x189619F60], v13);
    dispatch thunk of FloatingPoint.rounded(_:)();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    return dispatch thunk of static AdditiveArithmetic.- infix(_:_:)();
  }

  else
  {
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x1895E8A20](&unk_189509F28, 256LL, AssociatedTypeWitness, AssociatedConformanceWitness);
    MEMORY[0x1895E8A14](v12, a4, v9);
    MEMORY[0x1895E89F0](v23, v7, a4, *(void *)(v21 + 8));
    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, a4);
    MEMORY[0x1895E8A20](&unk_189509F28, 256LL, AssociatedTypeWitness, AssociatedConformanceWitness);
    return MEMORY[0x1895E8A14](v12, a4, v9);
  }
}

uint64_t frexp<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v99 = a1;
  uint64_t v6 = *(void *)(a4 + 16);
  swift_getAssociatedTypeWitness();
  uint64_t v90 = *(void *)(swift_getAssociatedConformanceWitness() + 8);
  uint64_t v86 = *(void *)(v90 + 24);
  uint64_t v93 = *(void *)(v86 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  ((void (*)(void))MEMORY[0x1895F8858])();
  v91 = (char *)&v81 - v7;
  uint64_t v89 = swift_checkMetadataState();
  uint64_t v96 = *(void *)(v89 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  v81 = (char *)&v81 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = MEMORY[0x1895F8858](v8);
  v83 = (char *)&v81 - v11;
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  v95 = (char *)&v81 - v13;
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  v82 = (char *)&v81 - v15;
  uint64_t v16 = MEMORY[0x1895F8858](v14);
  v85 = (char *)&v81 - v17;
  uint64_t v18 = MEMORY[0x1895F8858](v16);
  v94 = (char *)&v81 - v19;
  uint64_t v20 = MEMORY[0x1895F8858](v18);
  v87 = (char *)&v81 - v21;
  uint64_t v22 = MEMORY[0x1895F8858](v20);
  v88 = (char *)&v81 - v23;
  uint64_t v98 = *(void *)(a3 - 8);
  uint64_t v24 = MEMORY[0x1895F8858](v22);
  v84 = (char *)&v81 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v24);
  v27 = (char *)&v81 - v26;
  uint64_t v28 = *(void *)(*(void *)(v6 + 16) + 8LL);
  uint64_t v29 = *(void *)(v28 + 16);
  uint64_t v30 = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](v30);
  v32 = (char *)&v81 - v31;
  uint64_t v97 = v6;
  LOBYTE(v6) = dispatch thunk of FloatingPoint.isFinite.getter();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x1895E8A20](&unk_189509F28, 256LL, v30, AssociatedConformanceWitness);
  MEMORY[0x1895E8A14](v32, a3, v29);
  if ((v6 & 1) == 0)
  {
    MEMORY[0x1895E89F0](a2, v27, a3, *(void *)(v28 + 8));
    (*(void (**)(char *, uint64_t))(v98 + 8))(v27, a3);
    return 0LL;
  }

  uint64_t v34 = a2;
  char v35 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v36 = v98;
  v37 = *(void (**)(char *, uint64_t))(v98 + 8);
  v37(v27, a3);
  if ((v35 & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v36 + 16))(v99, v34, a3);
    return 0LL;
  }

  dispatch thunk of FloatingPoint.significand.getter();
  MEMORY[0x1895E8A20](&unk_189509F30, 768LL, v30, AssociatedConformanceWitness);
  v39 = v84;
  MEMORY[0x1895E8A14](v32, a3, v29);
  dispatch thunk of static FloatingPoint./ infix(_:_:)();
  v37(v39, a3);
  v37(v27, a3);
  v40 = v87;
  dispatch thunk of FloatingPoint.exponent.getter();
  uint64_t v42 = AssociatedTypeWitness;
  uint64_t v41 = v93;
  uint64_t v43 = v89;
  uint64_t v44 = swift_getAssociatedConformanceWitness();
  v45 = v91;
  MEMORY[0x1895E8A20](&unk_189509F38, 512LL, v42, v44);
  v46 = v94;
  MEMORY[0x1895E8A14](v45, v43, v41);
  v47 = v88;
  MEMORY[0x1895E89F0](v40, v46, v43, *(void *)(v86 + 8));
  uint64_t v48 = v96;
  v49 = *(void (**)(char *, uint64_t))(v96 + 8);
  v49(v46, v43);
  v49(v40, v43);
  LOBYTE(v42) = dispatch thunk of static BinaryInteger.isSigned.getter();
  v50 = *(void (**)(char *, char *, uint64_t))(v48 + 16);
  v51 = v85;
  v50(v85, v47, v43);
  if ((v42 & 1) == 0)
  {
    v49(v51, v43);
    v53 = v95;
    goto LABEL_12;
  }

  uint64_t v52 = dispatch thunk of BinaryInteger.bitWidth.getter();
  v49(v51, v43);
  v53 = v95;
  if (v52 <= 64) {
    goto LABEL_12;
  }
  v54 = v82;
  v50(v82, v47, v43);
  int64_t v101 = 0x8000000000000000LL;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0)
  {
    if (dispatch thunk of BinaryInteger.bitWidth.getter() < 64)
    {
      uint64_t v55 = dispatch thunk of BinaryInteger._lowWord.getter();
      v56 = v54;
      uint64_t v57 = v55;
      v58 = v56;
      goto LABEL_36;
    }

    lazy protocol witness table accessor for type Int and conformance Int();
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v73 = v54;
    char v71 = dispatch thunk of static Comparable.< infix(_:_:)();
    v49(v40, v43);
    v72 = v73;
LABEL_31:
    v49(v72, v43);
    if ((v71 & 1) != 0) {
      goto LABEL_37;
    }
LABEL_12:
    uint64_t v59 = dispatch thunk of BinaryInteger.bitWidth.getter();
    v50(v53, v47, v43);
    if (v59 < 65)
    {
      uint64_t v65 = dispatch thunk of BinaryInteger.bitWidth.getter();
      v49(v53, v43);
      if (v65 != 64 || (dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0) {
        goto LABEL_25;
      }
    }

    else
    {
      v49(v53, v43);
    }

    v60 = v83;
    v50(v83, v47, v43);
    int64_t v101 = 0x7FFFFFFFFFFFFFFFLL;
    char v61 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v62 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v61 & 1) != 0)
    {
      if (v62 > 64)
      {
        lazy protocol witness table accessor for type Int and conformance Int();
        dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
        char v63 = dispatch thunk of static Comparable.< infix(_:_:)();
        v49(v40, v43);
        for (i = v60; ; i = v40)
        {
          v49(i, v43);
          if ((v63 & 1) == 0) {
            break;
          }
LABEL_22:
          __break(1u);
LABEL_23:
          uint64_t v100 = 0x7FFFFFFFFFFFFFFFLL;
          (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v40, v60, v43);
          lazy protocol witness table accessor for type Int and conformance Int();
          v60 = v94;
          dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
          char v63 = dispatch thunk of static Comparable.< infix(_:_:)();
          v49(v60, v43);
        }

        goto LABEL_25;
      }
    }

    else if (v62 > 63)
    {
      goto LABEL_23;
    }

    uint64_t v66 = dispatch thunk of BinaryInteger._lowWord.getter();
    v49(v60, v43);
    if (v101 < v66) {
      goto LABEL_22;
    }
LABEL_25:
    uint64_t v38 = dispatch thunk of BinaryInteger._lowWord.getter();
    v49(v47, v43);
    return v38;
  }

  char v68 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v69 = dispatch thunk of BinaryInteger.bitWidth.getter();
  if ((v68 & 1) != 0)
  {
    v53 = v95;
    if (v69 <= 64) {
      goto LABEL_38;
    }
    lazy protocol witness table accessor for type Int and conformance Int();
    dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
    v70 = v82;
    char v71 = dispatch thunk of static Comparable.< infix(_:_:)();
    v49(v40, v43);
    v72 = v70;
    goto LABEL_31;
  }

  v53 = v95;
  if (v69 >= 64)
  {
    v49(v82, v43);
    goto LABEL_12;
  }

  v74 = v82;
  uint64_t v57 = dispatch thunk of BinaryInteger._lowWord.getter();
  v58 = v74;
LABEL_36:
  v49(v58, v43);
  if (v57 >= v101) {
    goto LABEL_12;
  }
LABEL_37:
  while (1)
  {
    __break(1u);
LABEL_38:
    v75 = v91;
    MEMORY[0x1895E8A20](&unk_189509F28, 256LL);
    MEMORY[0x1895E8A14](v75, v43, v93);
    v76 = v82;
    LOBYTE(v75) = dispatch thunk of static Comparable.< infix(_:_:)();
    v49(v40, v43);
    v77 = v81;
    (*(void (**)(char *, char *, uint64_t))(v96 + 32))(v81, v76, v43);
    int64_t v78 = v101;
    uint64_t v79 = dispatch thunk of BinaryInteger._lowWord.getter();
    v49(v77, v43);
    BOOL v80 = v79 < v78;
    v53 = v95;
    if (!v80) {
      goto LABEL_12;
    }
  }

  uint64_t result = ((uint64_t (*)(char *, uint64_t))v49)(v77, v43);
  __break(1u);
  return result;
}

Swift::Float __swiftcall ldexp(_:_:)(Swift::Float result, Swift::Int a2)
{
  int v2 = (LODWORD(result) >> 23);
  if (v2 != 255 && (v2 | LODWORD(result) & 0x7FFFFF) != 0)
  {
    if (a2 > -127)
    {
      if (a2 > 127)
      {
        if (a2 >= 381) {
          a2 = 381LL;
        }
        do
        {
          a2 -= 127LL;
          uint64_t result = result * 1.7014e38;
        }

        while ((unint64_t)a2 > 0x7F);
      }
    }

    else
    {
      if (a2 <= -378) {
        Swift::Int v4 = -378LL;
      }
      else {
        Swift::Int v4 = a2;
      }
      do
      {
        LODWORD(a2) = v4 + 126;
        uint64_t result = result * 1.1755e-38;
        BOOL v5 = __CFADD__(v4, 252LL);
        v4 += 126LL;
      }

      while (!v5);
    }

    return result * COERCE_FLOAT((((_DWORD)a2 << 23) + 1065353216) & 0x7F800000);
  }

  return result;
}

Swift::Double __swiftcall ldexp(_:_:)(Swift::Double result, Swift::Int a2)
{
  uint64_t v2 = (*(void *)&result >> 52) & 0x7FFLL;
  if (v2 != 2047 && (v2 | *(void *)&result & 0xFFFFFFFFFFFFFLL) != 0)
  {
    if (a2 > -1023)
    {
      if (a2 > 1023)
      {
        if (a2 >= 3069) {
          a2 = 3069LL;
        }
        do
        {
          a2 -= 1023LL;
          uint64_t result = result * 8.98846567e307;
        }

        while ((unint64_t)a2 > 0x3FF);
      }
    }

    else
    {
      if (a2 <= -3066) {
        Swift::Int v4 = -3066LL;
      }
      else {
        Swift::Int v4 = a2;
      }
      do
      {
        a2 = v4 + 1022;
        uint64_t result = result * 2.22507386e-308;
        BOOL v5 = __CFADD__(v4, 2044LL);
        v4 += 1022LL;
      }

      while (!v5);
    }

    return result * COERCE_DOUBLE(((a2 << 52) + 0x3FF0000000000000LL) & 0x7FF0000000000000LL);
  }

  return result;
}

void fpclassify<A>(_:)()
{
}

void isnormal<A>(_:)()
{
}

void isfinite<A>(_:)()
{
}

void isinf<A>(_:)()
{
}

void isnan<A>(_:)()
{
}

void signbit<A>(_:)()
{
}

uint64_t ilogb<A>(_:)()
{
  uint64_t v54 = *(void *)(*(void *)(*(void *)(swift_getAssociatedConformanceWitness() + 8) + 24LL) + 16LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  v53 = (char *)&v51 - v1;
  uint64_t v2 = swift_checkMetadataState();
  uint64_t v3 = MEMORY[0x1895F8858](v2);
  uint64_t v52 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = MEMORY[0x1895F8858](v3);
  uint64_t v55 = (char *)&v51 - v6;
  uint64_t v7 = MEMORY[0x1895F8858](v5);
  v58 = (char *)&v51 - v8;
  uint64_t v9 = MEMORY[0x1895F8858](v7);
  uint64_t v11 = (char *)&v51 - v10;
  uint64_t v12 = MEMORY[0x1895F8858](v9);
  uint64_t v57 = (char *)&v51 - v13;
  uint64_t v14 = MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v51 - v15;
  uint64_t v17 = MEMORY[0x1895F8858](v14);
  uint64_t v19 = (char *)&v51 - v18;
  MEMORY[0x1895F8858](v17);
  uint64_t v21 = (char *)&v51 - v20;
  uint64_t v23 = v22;
  dispatch thunk of FloatingPoint.exponent.getter();
  char v24 = dispatch thunk of static BinaryInteger.isSigned.getter();
  uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v23 + 16);
  v25(v19, v21, v2);
  uint64_t v56 = v23;
  if ((v24 & 1) == 0)
  {
    v27 = *(void (**)(char *, uint64_t))(v23 + 8);
    uint64_t v28 = v19;
    goto LABEL_7;
  }

  uint64_t v26 = dispatch thunk of BinaryInteger.bitWidth.getter();
  v27 = *(void (**)(char *, uint64_t))(v23 + 8);
  v27(v19, v2);
  if (v26 <= 64) {
    goto LABEL_8;
  }
  v25(v16, v21, v2);
  int64_t v60 = 0x8000000000000000LL;
  if ((dispatch thunk of static BinaryInteger.isSigned.getter() & 1) == 0)
  {
    char v41 = dispatch thunk of static BinaryInteger.isSigned.getter();
    uint64_t v42 = dispatch thunk of BinaryInteger.bitWidth.getter();
    if ((v41 & 1) != 0)
    {
      if (v42 <= 64) {
        goto LABEL_30;
      }
LABEL_24:
      lazy protocol witness table accessor for type Int and conformance Int();
      uint64_t v43 = v57;
      dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
      char v44 = dispatch thunk of static Comparable.< infix(_:_:)();
      v27(v43, v2);
      v27(v16, v2);
      if ((v44 & 1) != 0) {
        goto LABEL_29;
      }
LABEL_8:
      uint64_t v29 = dispatch thunk of BinaryInteger.bitWidth.getter();
      v25(v11, v21, v2);
      if (v29 < 65)
      {
        uint64_t v36 = dispatch thunk of BinaryInteger.bitWidth.getter();
        v27(v11, v2);
        if (v36 != 64 || (dispatch thunk of static BinaryInteger.isSigned.getter() & 1) != 0) {
          goto LABEL_21;
        }
      }

      else
      {
        v27(v11, v2);
      }

      uint64_t v30 = v58;
      v25(v58, v21, v2);
      int64_t v60 = 0x7FFFFFFFFFFFFFFFLL;
      char v31 = dispatch thunk of static BinaryInteger.isSigned.getter();
      uint64_t v32 = dispatch thunk of BinaryInteger.bitWidth.getter();
      if ((v31 & 1) != 0)
      {
        if (v32 > 64)
        {
          lazy protocol witness table accessor for type Int and conformance Int();
          v33 = v57;
          dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
          char v34 = dispatch thunk of static Comparable.< infix(_:_:)();
          v27(v33, v2);
          for (i = v30; ; i = v38)
          {
            v27(i, v2);
            if ((v34 & 1) == 0) {
              break;
            }
LABEL_18:
            __break(1u);
LABEL_19:
            uint64_t v59 = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v38 = v57;
            (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v57, v30, v2);
            lazy protocol witness table accessor for type Int and conformance Int();
            uint64_t v30 = v55;
            dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)();
            char v34 = dispatch thunk of static Comparable.< infix(_:_:)();
            v27(v30, v2);
          }

          goto LABEL_21;
        }
      }

      else if (v32 > 63)
      {
        goto LABEL_19;
      }

      uint64_t v37 = dispatch thunk of BinaryInteger._lowWord.getter();
      v27(v30, v2);
      if (v60 < v37) {
        goto LABEL_18;
      }
LABEL_21:
      uint64_t v39 = dispatch thunk of BinaryInteger._lowWord.getter();
      v27(v21, v2);
      return v39;
    }

    if (v42 < 64) {
      goto LABEL_28;
    }
    uint64_t v28 = v16;
LABEL_7:
    v27(v28, v2);
    goto LABEL_8;
  }

  if (dispatch thunk of BinaryInteger.bitWidth.getter() >= 64) {
    goto LABEL_24;
  }
LABEL_28:
  uint64_t v45 = dispatch thunk of BinaryInteger._lowWord.getter();
  v27(v16, v2);
  if (v45 >= v60) {
    goto LABEL_8;
  }
LABEL_29:
  while (1)
  {
    __break(1u);
LABEL_30:
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    MEMORY[0x1895E8A20](&unk_189509F28, 256LL, AssociatedTypeWitness, AssociatedConformanceWitness);
    v47 = v57;
    MEMORY[0x1895E8A14](v53, v2, v54);
    char v48 = dispatch thunk of static Comparable.< infix(_:_:)();
    v27(v47, v2);
    uint64_t AssociatedTypeWitness = (uint64_t)v52;
    (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v52, v16, v2);
    if ((v48 & 1) != 0) {
      break;
    }
    int64_t v49 = v60;
    uint64_t v50 = dispatch thunk of BinaryInteger._lowWord.getter();
    v27((char *)AssociatedTypeWitness, v2);
    if (v50 >= v49) {
      goto LABEL_8;
    }
  }

  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t))v27)(AssociatedTypeWitness, v2);
  __break(1u);
  return result;
}

Swift::Float __swiftcall nearbyint(_:)(Swift::Float a1)
{
  return nearbyintf(a1);
}

Swift::Double __swiftcall nearbyint(_:)(Swift::Double a1)
{
  return nearbyint(a1);
}

Swift::Float __swiftcall rint(_:)(Swift::Float a1)
{
  return rintf(a1);
}

Swift::Double __swiftcall rint(_:)(Swift::Double a1)
{
  return rint(a1);
}

Swift::Float __swiftcall copysign(_:_:)(Swift::Float a1, Swift::Float a2)
{
  v2.i64[0] = 0x8000000080000000LL;
  v2.i64[1] = 0x8000000080000000LL;
  LODWORD(result) = vbslq_s8(v2, *(int8x16_t *)&a1, *(int8x16_t *)&a2).u32[0];
  return result;
}

Swift::Float __swiftcall fmax(_:_:)(Swift::Float a1, Swift::Float a2)
{
  return fmaxf(a1, a2);
}

Swift::Float __swiftcall fmin(_:_:)(Swift::Float a1, Swift::Float a2)
{
  return fminf(a1, a2);
}

Swift::tuple_Float_Int __swiftcall lgamma(_:)(Swift::Float a1)
{
  Swift::Int v2 = 0LL;
  result._1 = v2;
  result._0 = v1;
  return result;
}

Swift::tuple_Double_Int __swiftcall lgamma(_:)(Swift::Double a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v4 = 0;
  double v1 = lgamma_r(a1, &v4);
  Swift::Int v2 = v4;
  result._0 = v1;
  result._1 = v2;
  return result;
}

Swift::tuple_Float_Int __swiftcall remquo(_:_:)(Swift::Float a1, Swift::Float a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v4 = 0;
  float v2 = remquof(a1, a2, &v4);
  Swift::Int v3 = v4;
  result._1 = v3;
  result._0 = v2;
  return result;
}

Swift::tuple_Double_Int __swiftcall remquo(_:_:)(Swift::Double a1, Swift::Double a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v5 = 0;
  double v2 = remquo(a1, a2, &v5);
  Swift::Int v3 = v5;
  result._0 = v2;
  result._1 = v3;
  return result;
}

Swift::Float __swiftcall nan(_:)(Swift::String a1)
{
  uint64_t v1 = String.utf8CString.getter();
  float v2 = nanf((const char *)(v1 + 32));
  swift_release();
  return v2;
}

Swift::Double __swiftcall jn(_:_:)(Swift::Int a1, Swift::Double a2)
{
  return result;
}

Swift::Double __swiftcall yn(_:_:)(Swift::Int a1, Swift::Double a2)
{
  return result;
}

uint64_t jn(_:_:)(uint64_t a1, uint64_t (*a2)(void))
{
  if (a1 < (uint64_t)0xFFFFFFFF80000000LL)
  {
    __break(1u);
  }

  else if (a1 <= 0x7FFFFFFF)
  {
    return a2();
  }

  __break(1u);
  return dispatch thunk of FloatingPoint.squareRoot()();
}

uint64_t dispatch thunk of FloatingPoint.squareRoot()(void)
{
  return MEMORY[0x189617940]();
}

uint64_t dispatch thunk of FloatingPoint.significand.getter()
{
  return MEMORY[0x189617948]();
}

uint64_t dispatch thunk of FloatingPoint.addingProduct(_:_:)()
{
  return MEMORY[0x189617950]();
}

uint64_t dispatch thunk of FloatingPoint.truncatingRemainder(dividingBy:)()
{
  return MEMORY[0x189617958]();
}

uint64_t dispatch thunk of static FloatingPoint./ infix(_:_:)()
{
  return MEMORY[0x189617960]();
}

uint64_t dispatch thunk of FloatingPoint.init(sign:exponent:significand:)()
{
  return MEMORY[0x189617970]();
}

uint64_t dispatch thunk of FloatingPoint.rounded(_:)()
{
  return MEMORY[0x1896179A0]();
}

uint64_t dispatch thunk of FloatingPoint.exponent.getter()
{
  return MEMORY[0x1896179B0]();
}

uint64_t dispatch thunk of FloatingPoint.isFinite.getter()
{
  return MEMORY[0x1896179C0]();
}

uint64_t dispatch thunk of FloatingPoint.remainder(dividingBy:)()
{
  return MEMORY[0x1896179D0]();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return MEMORY[0x189617B40]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x189617C20]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x189617CB0]();
}

uint64_t dispatch thunk of Numeric.magnitude.getter()
{
  return MEMORY[0x1896187D8]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(truncatingIfNeeded:)()
{
  return MEMORY[0x189618E20]();
}

uint64_t dispatch thunk of BinaryInteger._lowWord.getter()
{
  return MEMORY[0x189618EA0]();
}

uint64_t dispatch thunk of BinaryInteger.bitWidth.getter()
{
  return MEMORY[0x189618EA8]();
}

uint64_t dispatch thunk of static BinaryInteger.isSigned.getter()
{
  return MEMORY[0x189618EB8]();
}

uint64_t dispatch thunk of BinaryInteger.init<A>(_:)()
{
  return MEMORY[0x189618ED8]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1896198A8]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.+ infix(_:_:)()
{
  return MEMORY[0x1896198C0]();
}

uint64_t dispatch thunk of static AdditiveArithmetic.- infix(_:_:)()
{
  return MEMORY[0x1896198C8]();
}

uint64_t type metadata accessor for FloatingPointRoundingRule()
{
  return MEMORY[0x189619F98]();
}

uint64_t dispatch thunk of ExpressibleByIntegerLiteral.init(integerLiteral:)()
{
  return MEMORY[0x18961A010]();
}

uint64_t dispatch thunk of _ExpressibleByBuiltinIntegerLiteral.init(_builtinIntegerLiteral:)()
{
  return MEMORY[0x18961A310]();
}

float acosf(float a1)
{
  return result;
}

float acoshf(float a1)
{
  return result;
}

float asinf(float a1)
{
  return result;
}

float asinhf(float a1)
{
  return result;
}

float atan2f(float a1, float a2)
{
  return result;
}

float atanf(float a1)
{
  return result;
}

float atanhf(float a1)
{
  return result;
}

float cbrtf(float a1)
{
  return result;
}

double cos(double a1)
{
  return result;
}

float cosf(float a1)
{
  return result;
}

float coshf(float a1)
{
  return result;
}

float erfcf(float a1)
{
  return result;
}

float erff(float a1)
{
  return result;
}

double exp(double a1)
{
  return result;
}

double exp2(double a1)
{
  return result;
}

float exp2f(float a1)
{
  return result;
}

float expf(float a1)
{
  return result;
}

float expm1f(float a1)
{
  return result;
}

float fdimf(float a1, float a2)
{
  return result;
}

float hypotf(float a1, float a2)
{
  return result;
}

double lgamma_r(double a1, int *a2)
{
  return result;
}

uint64_t lgammaf_r()
{
  return MEMORY[0x1895FB9E0]();
}

double log(double a1)
{
  return result;
}

double log10(double a1)
{
  return result;
}

float log10f(float a1)
{
  return result;
}

float log1pf(float a1)
{
  return result;
}

double log2(double a1)
{
  return result;
}

float log2f(float a1)
{
  return result;
}

float logbf(float a1)
{
  return result;
}

float logf(float a1)
{
  return result;
}

float nanf(const char *a1)
{
  return result;
}

float nextafterf(float a1, float a2)
{
  return result;
}

float powf(float a1, float a2)
{
  return result;
}

double remquo(double a1, double a2, int *a3)
{
  return result;
}

float remquof(float a1, float a2, int *a3)
{
  return result;
}

double sin(double a1)
{
  return result;
}

float sinf(float a1)
{
  return result;
}

float sinhf(float a1)
{
  return result;
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

float tanf(float a1)
{
  return result;
}

float tanhf(float a1)
{
  return result;
}

float tgammaf(float a1)
{
  return result;
}