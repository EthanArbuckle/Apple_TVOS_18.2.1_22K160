unint64_t narrativecertdMachServiceName.getter()
{
  return 0xD000000000000018LL;
}

uint64_t NarrativeIdentityType.rawValue.getter(unint64_t a1)
{
  if (a1 < 3) {
    return *(void *)&aPlatformhost[8 * a1];
  }
  uint64_t result = sub_1894B8F94();
  __break(1u);
  return result;
}

uint64_t NarrativeIdentityType.init(rawValue:)(uint64_t a1, uint64_t a2)
{
  return sub_1894B2184(a1, a2);
}

void *static NarrativeIdentityType.allCases.getter()
{
  return &unk_18A3AF500;
}

uint64_t sub_1894B1200(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1894B1304(a1, a2, a3, a4, (uint64_t (*)(uint64_t))NarrativeIdentityType.rawValue.getter);
}

uint64_t sub_1894B120C(uint64_t a1, uint64_t a2)
{
  return sub_1894B139C(a1, a2, (void (*)(uint64_t))NarrativeIdentityType.rawValue.getter);
}

uint64_t sub_1894B1218(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1894B140C(a1, a2, a3, (void (*)(void))NarrativeIdentityType.rawValue.getter);
}

uint64_t sub_1894B1224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1894B1458(a1, a2, a3, (void (*)(uint64_t))NarrativeIdentityType.rawValue.getter);
}

uint64_t sub_1894B1230@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1894B14C4(a1, sub_1894B2184, a2);
}

uint64_t sub_1894B123C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NarrativeIdentityType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1894B1264(void *a1@<X8>)
{
  *a1 = &unk_18A3AF538;
}

uint64_t NarrativeDomain.rawValue.getter(unint64_t a1)
{
  if (a1 < 3) {
    return *(void *)&aExample[8 * a1];
  }
  uint64_t result = sub_1894B8F94();
  __break(1u);
  return result;
}

uint64_t NarrativeDomain.init(rawValue:)(uint64_t a1, uint64_t a2)
{
  return sub_1894B22C4(a1, a2);
}

void *static NarrativeDomain.allCases.getter()
{
  return &unk_18A3AF570;
}

uint64_t sub_1894B12F8(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_1894B1304(a1, a2, a3, a4, (uint64_t (*)(uint64_t))NarrativeDomain.rawValue.getter);
}

uint64_t sub_1894B1304(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6 = *a2;
  uint64_t v7 = a5(*a1);
  uint64_t v9 = v8;
  if (v7 == a5(v6) && v9 == v10) {
    char v12 = 1;
  }
  else {
    char v12 = sub_1894B8F88();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t sub_1894B1390(uint64_t a1, uint64_t a2)
{
  return sub_1894B139C(a1, a2, (void (*)(uint64_t))NarrativeDomain.rawValue.getter);
}

uint64_t sub_1894B139C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v5 = *v3;
  sub_1894B8FDC();
  a3(v5);
  sub_1894B8E38();
  swift_bridgeObjectRelease();
  return sub_1894B8FE8();
}

uint64_t sub_1894B1400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1894B140C(a1, a2, a3, (void (*)(void))NarrativeDomain.rawValue.getter);
}

uint64_t sub_1894B140C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1894B144C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1894B1458(a1, a2, a3, (void (*)(uint64_t))NarrativeDomain.rawValue.getter);
}

uint64_t sub_1894B1458(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6 = *v4;
  sub_1894B8FDC();
  a4(v6);
  sub_1894B8E38();
  swift_bridgeObjectRelease();
  return sub_1894B8FE8();
}

uint64_t sub_1894B14B8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1894B14C4(a1, sub_1894B22C4, a2);
}

uint64_t sub_1894B14C4@<X0>(void *a1@<X0>, uint64_t (*a2)(void, void)@<X3>, uint64_t a3@<X8>)
{
  uint64_t result = a2(*a1, a1[1]);
  *(void *)a3 = result;
  *(_BYTE *)(a3 + 8) = v5 & 1;
  return result;
}

uint64_t sub_1894B14F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = NarrativeDomain.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1894B1520(void *a1@<X8>)
{
  *a1 = &unk_18A3AF5A8;
}

uint64_t SupportedNarrativeIdentities.rawValue.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0LL:
      id v1 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
      unint64_t v2 = 1LL;
      goto LABEL_7;
    case 1LL:
      id v6 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
      unint64_t v2 = 1LL;
      unint64_t v4 = 1LL;
      goto LABEL_10;
    case 2LL:
      id v5 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
      unint64_t v2 = 2LL;
      goto LABEL_9;
    case 3LL:
      id v7 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
      unint64_t v2 = 0LL;
LABEL_7:
      unint64_t v4 = 0LL;
      goto LABEL_10;
    case 4LL:
      id v3 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
      unint64_t v2 = 0LL;
      unint64_t v4 = 1LL;
      goto LABEL_10;
    case 5LL:
      id v8 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
      unint64_t v2 = 0LL;
LABEL_9:
      unint64_t v4 = 2LL;
LABEL_10:
      uint64_t result = (uint64_t)NarrativeCert.init(domain:identityType:)(v2, v4);
      break;
    default:
      uint64_t result = sub_1894B8F94();
      __break(1u);
      break;
  }

  return result;
}

uint64_t SupportedNarrativeIdentities.init(rawValue:)(void *a1)
{
  return sub_1894B23FC(a1);
}

void *static SupportedNarrativeIdentities.allCases.getter()
{
  return &unk_18A3AF5E0;
}

uint64_t sub_1894B1658(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  type metadata accessor for NarrativeCert();
  unint64_t v4 = (void *)SupportedNarrativeIdentities.rawValue.getter(v2);
  id v5 = (void *)SupportedNarrativeIdentities.rawValue.getter(v3);
  LOBYTE(v3) = sub_1894B8EC8();

  return v3 & 1;
}

uint64_t sub_1894B16C4()
{
  uint64_t v1 = *v0;
  sub_1894B8FDC();
  uint64_t v2 = (void *)SupportedNarrativeIdentities.rawValue.getter(v1);
  sub_1894B8ED4();

  return sub_1894B8FE8();
}

void sub_1894B1714()
{
  id v1 = (id)SupportedNarrativeIdentities.rawValue.getter(*v0);
  sub_1894B8ED4();
}

uint64_t sub_1894B1758()
{
  uint64_t v1 = *v0;
  sub_1894B8FDC();
  uint64_t v2 = (void *)SupportedNarrativeIdentities.rawValue.getter(v1);
  sub_1894B8ED4();

  return sub_1894B8FE8();
}

uint64_t sub_1894B17A4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1894B23FC(*a1);
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1894B17D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = SupportedNarrativeIdentities.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

void sub_1894B17FC(void *a1@<X8>)
{
  *a1 = &unk_18A3AF5E0;
}

Swift::Bool __swiftcall isNarrativeCertSupported(domain:identityType:)( Swift::String domain, Swift::String identityType)
{
  object = identityType._object;
  uint64_t countAndFlagsBits = identityType._countAndFlagsBits;
  char v4 = domain._object;
  uint64_t v5 = domain._countAndFlagsBits;
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1894B22C4(v5, (uint64_t)v4);
  if ((v7 & 1) != 0) {
    return 0;
  }
  unint64_t v8 = v6;
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_1894B2184(countAndFlagsBits, (uint64_t)object);
  if ((v10 & 1) != 0) {
    return 0;
  }
  unint64_t v11 = v9;
  id v12 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
  id v13 = NarrativeCert.init(domain:identityType:)(v8, v11);
  sub_1894B23FC(v13);
  return (v14 & 1) == 0;
}

Swift::String __swiftcall formatSupportedNarrativeIdentityTypes()()
{
  v0 = (void *)MEMORY[0x18961AFE8];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v0 = sub_1894B2078(0LL, v0[2] + 1LL, 1, v0);
  }
  unint64_t v2 = v0[2];
  unint64_t v1 = v0[3];
  if (v2 >= v1 >> 1) {
    v0 = sub_1894B2078((void *)(v1 > 1), v2 + 1, 1, v0);
  }
  v0[2] = v2 + 1;
  uint64_t v3 = &v0[2 * v2];
  v3[4] = 0x6D726F6674616C70LL;
  v3[5] = 0xE800000000000000LL;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v0 = sub_1894B2078(0LL, v0[2] + 1LL, 1, v0);
  }
  unint64_t v5 = v0[2];
  unint64_t v4 = v0[3];
  if (v5 >= v4 >> 1) {
    v0 = sub_1894B2078((void *)(v4 > 1), v5 + 1, 1, v0);
  }
  v0[2] = v5 + 1;
  uint64_t v6 = &v0[2 * v5];
  v6[4] = 1953722216LL;
  v6[5] = 0xE400000000000000LL;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v0 = sub_1894B2078(0LL, v0[2] + 1LL, 1, v0);
  }
  unint64_t v8 = v0[2];
  unint64_t v7 = v0[3];
  if (v8 >= v7 >> 1) {
    v0 = sub_1894B2078((void *)(v7 > 1), v8 + 1, 1, v0);
  }
  v0[2] = v8 + 1;
  uint64_t v9 = &v0[2 * v8];
  v9[4] = 0x726F746361LL;
  v9[5] = 0xE500000000000000LL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C530);
  sub_1894B28FC(&qword_18C79C538, &qword_18C79C530, MEMORY[0x189618458]);
  uint64_t v10 = sub_1894B8E08();
  id v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = v10;
  char v14 = v12;
  result._object = v14;
  result._uint64_t countAndFlagsBits = v13;
  return result;
}

Swift::String __swiftcall formatSupportedNarrativeDomains()()
{
  v0 = (void *)MEMORY[0x18961AFE8];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v0 = sub_1894B2078(0LL, v0[2] + 1LL, 1, v0);
  }
  unint64_t v2 = v0[2];
  unint64_t v1 = v0[3];
  if (v2 >= v1 >> 1) {
    v0 = sub_1894B2078((void *)(v1 > 1), v2 + 1, 1, v0);
  }
  v0[2] = v2 + 1;
  uint64_t v3 = &v0[2 * v2];
  v3[4] = 0x656C706D617865LL;
  v3[5] = 0xE700000000000000LL;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v0 = sub_1894B2078(0LL, v0[2] + 1LL, 1, v0);
  }
  unint64_t v5 = v0[2];
  unint64_t v4 = v0[3];
  if (v5 >= v4 >> 1) {
    v0 = sub_1894B2078((void *)(v4 > 1), v5 + 1, 1, v0);
  }
  v0[2] = v5 + 1;
  uint64_t v6 = &v0[2 * v5];
  v6[4] = 6448225LL;
  v6[5] = 0xE300000000000000LL;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v0 = sub_1894B2078(0LL, v0[2] + 1LL, 1, v0);
  }
  unint64_t v8 = v0[2];
  unint64_t v7 = v0[3];
  if (v8 >= v7 >> 1) {
    v0 = sub_1894B2078((void *)(v7 > 1), v8 + 1, 1, v0);
  }
  v0[2] = v8 + 1;
  uint64_t v9 = &v0[2 * v8];
  v9[4] = 1667523425LL;
  v9[5] = 0xE400000000000000LL;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C530);
  sub_1894B28FC(&qword_18C79C538, &qword_18C79C530, MEMORY[0x189618458]);
  uint64_t v10 = sub_1894B8E08();
  id v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = v10;
  char v14 = v12;
  result._object = v14;
  result._uint64_t countAndFlagsBits = v13;
  return result;
}

Swift::String __swiftcall formatSupportedNarrativeIdentities(separator:)(Swift::String separator)
{
  uint64_t v1 = 0LL;
  unint64_t v2 = (void *)MEMORY[0x18961AFE8];
  while (2)
  {
    uint64_t v3 = *(void *)((char *)&unk_18A3AF630 + v1 + 32);
    switch(v3)
    {
      case 0LL:
        id v4 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
        unint64_t v5 = 1LL;
        unint64_t v6 = 0LL;
        goto LABEL_10;
      case 1LL:
        id v10 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
        unint64_t v5 = 1LL;
        unint64_t v6 = 1LL;
        goto LABEL_10;
      case 2LL:
        id v8 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
        unint64_t v5 = 2LL;
        goto LABEL_9;
      case 3LL:
        id v9 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
        unint64_t v5 = 0LL;
        unint64_t v6 = 0LL;
        goto LABEL_10;
      case 4LL:
        id v7 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
        unint64_t v5 = 0LL;
        unint64_t v6 = 1LL;
        goto LABEL_10;
      case 5LL:
        id v11 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
        unint64_t v5 = 0LL;
LABEL_9:
        unint64_t v6 = 2LL;
LABEL_10:
        id v12 = (char *)NarrativeCert.init(domain:identityType:)(v5, v6);
        unint64_t v13 = *(void *)&v12[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain];

        if (v13 >= 3) {
          goto LABEL_26;
        }
        uint64_t v33 = *(void *)&aExample[8 * v13];
        uint64_t v34 = qword_1894B97F8[v13];
        swift_bridgeObjectRetain();
        sub_1894B8E44();
        swift_bridgeObjectRelease();
        switch(v3)
        {
          case 0LL:
            id v14 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
            unint64_t v15 = 1LL;
            unint64_t v16 = 0LL;
            goto LABEL_19;
          case 1LL:
            id v19 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
            unint64_t v15 = 1LL;
            unint64_t v16 = 1LL;
            goto LABEL_19;
          case 2LL:
            id v18 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
            unint64_t v15 = 2LL;
            goto LABEL_18;
          case 3LL:
            id v20 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
            unint64_t v15 = 0LL;
            unint64_t v16 = 0LL;
            goto LABEL_19;
          case 4LL:
            id v17 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
            unint64_t v15 = 0LL;
            unint64_t v16 = 1LL;
            goto LABEL_19;
          case 5LL:
            id v21 = objc_allocWithZone((Class)type metadata accessor for NarrativeCert());
            unint64_t v15 = 0LL;
LABEL_18:
            unint64_t v16 = 2LL;
LABEL_19:
            v22 = (char *)NarrativeCert.init(domain:identityType:)(v15, v16);
            unint64_t v23 = *(void *)&v22[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType];

            if (v23 >= 3) {
              goto LABEL_26;
            }
            swift_bridgeObjectRetain();
            sub_1894B8E44();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              unint64_t v2 = sub_1894B2078(0LL, v2[2] + 1LL, 1, v2);
            }
            unint64_t v25 = v2[2];
            unint64_t v24 = v2[3];
            if (v25 >= v24 >> 1) {
              unint64_t v2 = sub_1894B2078((void *)(v24 > 1), v25 + 1, 1, v2);
            }
            v2[2] = v25 + 1;
            v26 = &v2[2 * v25];
            v26[4] = v33;
            v26[5] = v34;
            v1 += 8LL;
            if (v1 != 48) {
              continue;
            }
            __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C530);
            sub_1894B28FC(&qword_18C79C538, &qword_18C79C530, MEMORY[0x189618458]);
            uint64_t v27 = sub_1894B8E08();
            v29 = v28;
            swift_bridgeObjectRelease();
            uint64_t v30 = v27;
            v31 = v29;
            break;
          default:
            goto LABEL_26;
        }

        break;
      default:
LABEL_26:
        uint64_t v30 = sub_1894B8F94();
        __break(1u);
        break;
    }

    break;
  }

  result._object = v31;
  result._uint64_t countAndFlagsBits = v30;
  return result;
}

void sub_1894B2064(void *a1@<X8>)
{
  *a1 = 0LL;
}

void *sub_1894B206C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void *sub_1894B2078(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C5B0);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      id v10 = (void *)MEMORY[0x18961AFE8];
      unint64_t v13 = (void *)(MEMORY[0x18961AFE8] + 32LL);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_1894B2A14(0LL, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }

  __break(1u);
  return result;
}

uint64_t sub_1894B2184(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6D726F6674616C70LL && a2 == 0xE800000000000000LL;
  if (v3 || (sub_1894B8F88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 1953722216 && a2 == 0xE400000000000000LL || (sub_1894B8F88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 0x726F746361LL && a2 == 0xE500000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else
  {
    char v6 = sub_1894B8F88();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 0LL;
    }
  }
}

uint64_t sub_1894B22C4(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x656C706D617865LL && a2 == 0xE700000000000000LL;
  if (v3 || (sub_1894B8F88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0LL;
  }

  else if (a1 == 6448225 && a2 == 0xE300000000000000LL || (sub_1894B8F88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1LL;
  }

  else if (a1 == 1667523425 && a2 == 0xE400000000000000LL)
  {
    swift_bridgeObjectRelease();
    return 2LL;
  }

  else
  {
    char v6 = sub_1894B8F88();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0) {
      return 2LL;
    }
    else {
      return 0LL;
    }
  }

uint64_t sub_1894B23FC(void *a1)
{
  unint64_t v2 = (objc_class *)type metadata accessor for NarrativeCert();
  id v3 = objc_allocWithZone(v2);
  id v4 = a1;
  char v5 = (char *)NarrativeCert.init(domain:identityType:)(1uLL, 0LL);
  uint64_t v6 = OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain;
  if ((sub_1894B2B08( *(void *)&v5[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain],  *(void *)&v4[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain]) & 1) != 0)
  {
    char v7 = sub_1894B2BD0( *(void *)&v5[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType],  *(void *)&v4[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType]);

    if ((v7 & 1) != 0)
    {

      return 0LL;
    }
  }

  else
  {
  }

  id v9 = objc_allocWithZone(v2);
  id v10 = v4;
  int64_t v11 = (char *)NarrativeCert.init(domain:identityType:)(1uLL, 1uLL);
  if ((sub_1894B2B08(*(void *)&v11[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain], *(void *)&v4[v6]) & 1) != 0)
  {
    char v12 = sub_1894B2BD0( *(void *)&v11[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType],  *(void *)&v10[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType]);

    if ((v12 & 1) != 0)
    {

      return 1LL;
    }
  }

  else
  {
  }

  id v13 = objc_allocWithZone(v2);
  id v14 = v10;
  unint64_t v15 = (char *)NarrativeCert.init(domain:identityType:)(2uLL, 2uLL);
  if ((sub_1894B2B08(*(void *)&v15[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain], *(void *)&v4[v6]) & 1) != 0)
  {
    char v16 = sub_1894B2BD0( *(void *)&v15[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType],  *(void *)&v14[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType]);

    if ((v16 & 1) != 0)
    {

      return 2LL;
    }
  }

  else
  {
  }

  id v17 = objc_allocWithZone(v2);
  id v18 = v14;
  id v19 = (char *)NarrativeCert.init(domain:identityType:)(0LL, 0LL);
  if ((sub_1894B2B08(*(void *)&v19[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain], *(void *)&v4[v6]) & 1) != 0)
  {
    char v20 = sub_1894B2BD0( *(void *)&v19[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType],  *(void *)&v18[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType]);

    if ((v20 & 1) != 0)
    {

      return 3LL;
    }
  }

  else
  {
  }

  id v21 = objc_allocWithZone(v2);
  v22 = v18;
  unint64_t v23 = (char *)NarrativeCert.init(domain:identityType:)(0LL, 1uLL);
  if ((sub_1894B2B08(*(void *)&v23[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain], *(void *)&v4[v6]) & 1) != 0)
  {
    char v24 = sub_1894B2BD0( *(void *)&v23[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType],  *(void *)&v22[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType]);

    if ((v24 & 1) != 0)
    {

      return 4LL;
    }
  }

  else
  {
  }

  id v25 = objc_allocWithZone(v2);
  v26 = v22;
  uint64_t v27 = (char *)NarrativeCert.init(domain:identityType:)(0LL, 2uLL);
  if ((sub_1894B2B08(*(void *)&v27[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain], *(void *)&v4[v6]) & 1) != 0)
  {
    char v28 = sub_1894B2BD0( *(void *)&v27[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType],  *(void *)&v26[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType]);

    if ((v28 & 1) != 0) {
      return 5LL;
    }
  }

  else
  {
  }

  return 0LL;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E81E0]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E81EC](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_1894B27A4()
{
  unint64_t result = qword_18C79C540;
  if (!qword_18C79C540)
  {
    unint64_t result = MEMORY[0x1895E81F8]( &protocol conformance descriptor for NarrativeIdentityType,  &type metadata for NarrativeIdentityType);
    atomic_store(result, (unint64_t *)&qword_18C79C540);
  }

  return result;
}

uint64_t sub_1894B27E8()
{
  return sub_1894B28FC(&qword_18C79C548, &qword_18C79C550, MEMORY[0x189618488]);
}

unint64_t sub_1894B2818()
{
  unint64_t result = qword_18C79C558;
  if (!qword_18C79C558)
  {
    unint64_t result = MEMORY[0x1895E81F8]( &protocol conformance descriptor for NarrativeDomain,  &type metadata for NarrativeDomain);
    atomic_store(result, (unint64_t *)&qword_18C79C558);
  }

  return result;
}

uint64_t sub_1894B285C()
{
  return sub_1894B28FC(&qword_18C79C560, &qword_18C79C568, MEMORY[0x189618488]);
}

unint64_t sub_1894B288C()
{
  unint64_t result = qword_18C79C570;
  if (!qword_18C79C570)
  {
    unint64_t result = MEMORY[0x1895E81F8]( &protocol conformance descriptor for SupportedNarrativeIdentities,  &type metadata for SupportedNarrativeIdentities);
    atomic_store(result, (unint64_t *)&qword_18C79C570);
  }

  return result;
}

uint64_t sub_1894B28D0()
{
  return sub_1894B28FC(&qword_18C79C578, &qword_18C79C580, MEMORY[0x189618488]);
}

uint64_t sub_1894B28FC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = MEMORY[0x1895E81F8](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

ValueMetadata *type metadata accessor for NarrativeIdentityType()
{
  return &type metadata for NarrativeIdentityType;
}

ValueMetadata *type metadata accessor for NarrativeDomain()
{
  return &type metadata for NarrativeDomain;
}

ValueMetadata *type metadata accessor for SupportedNarrativeIdentities()
{
  return &type metadata for SupportedNarrativeIdentities;
}

void type metadata accessor for SecKeychain(uint64_t a1)
{
}

void type metadata accessor for SecCertificate(uint64_t a1)
{
}

void type metadata accessor for CFData(uint64_t a1)
{
}

void type metadata accessor for SecKey(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_1894B29D0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

uint64_t sub_1894B2A14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }

  else if ((v4 & 0x8000000000000000LL) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }

  uint64_t result = sub_1894B8F7C();
  __break(1u);
  return result;
}

uint64_t sub_1894B2B08(unint64_t a1, unint64_t a2)
{
  if (a1 >= 3 || a2 >= 3)
  {
    uint64_t result = sub_1894B8F94();
    __break(1u);
  }

  else
  {
    if (*(void *)&aExample_0[8 * a1] == *(void *)&aExample_0[8 * a2] && qword_1894B9900[a1] == qword_1894B9900[a2]) {
      char v3 = 1;
    }
    else {
      char v3 = sub_1894B8F88();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }

  return result;
}

uint64_t sub_1894B2BD0(unint64_t a1, unint64_t a2)
{
  if (a1 >= 3 || a2 >= 3)
  {
    uint64_t result = sub_1894B8F94();
    __break(1u);
  }

  else
  {
    if (*(void *)&aPlatformhost_0[8 * a1] == *(void *)&aPlatformhost_0[8 * a2]
      && qword_1894B9930[a1] == qword_1894B9930[a2])
    {
      char v3 = 1;
    }

    else
    {
      char v3 = sub_1894B8F88();
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v3 & 1;
  }

  return result;
}

id NarrativeCert.__allocating_init(domain:identityType:)(unint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return NarrativeCert.init(domain:identityType:)(a1, a2);
}

uint64_t sub_1894B2CD8()
{
  uint64_t v0 = sub_1894B8DF0();
  __swift_allocate_value_buffer(v0, qword_18C79C5B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_18C79C5B8);
  return sub_1894B8DE4();
}

id sub_1894B2D58()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC16libnarrativecert13NarrativeRefs_certRef);
  swift_beginAccess();
  return *v1;
}

void sub_1894B2D9C(void *a1)
{
}

uint64_t (*sub_1894B2DA8())()
{
  return j_j__swift_endAccess;
}

void sub_1894B2DEC(void **a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v5 = *a1;
  unint64_t v6 = (void **)(*a2 + *a5);
  swift_beginAccess();
  char v7 = *v6;
  *unint64_t v6 = v5;
  id v8 = v5;
}

id sub_1894B2E48()
{
  uint64_t v1 = (id *)(v0 + OBJC_IVAR____TtC16libnarrativecert13NarrativeRefs_keyRef);
  swift_beginAccess();
  return *v1;
}

void sub_1894B2E8C(void *a1)
{
}

void sub_1894B2E98(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  id v5 = *v4;
  *uint64_t v4 = a1;
}

uint64_t (*sub_1894B2EE4())()
{
  return j_j__swift_endAccess;
}

void NarrativeRefs.init()()
{
}

id NarrativeRefs.__deallocating_deinit()
{
  return sub_1894B660C(type metadata accessor for NarrativeRefs);
}

uint64_t NarrativeCert.domain.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain);
}

uint64_t NarrativeCert.identityType.getter()
{
  return *(void *)(v0 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType);
}

uint64_t NarrativeCert.keychainLabel.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NarrativeCert.refreshedNotificationName.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_refreshedNotificationName);
  swift_bridgeObjectRetain();
  return v1;
}

void sub_1894B3054(void **a1, void *a2)
{
  uint64_t v2 = *a1;
  char v3 = (void **)(*a2 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testKeychain);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = v2;
  id v5 = v2;
}

void *sub_1894B30B4()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testKeychain);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_1894B3100(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testKeychain);
  swift_beginAccess();
  uint64_t v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_1894B3150())()
{
  return j__swift_endAccess;
}

id NarrativeCert.init(domain:identityType:)(unint64_t a1, unint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testKeychain] = 0LL;
  id v5 = &v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testRootCAbase64DER];
  *(void *)id v5 = 0xD00000000000031CLL;
  *((void *)v5 + 1) = 0x80000001894B9B60LL;
  unint64_t v6 = &v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testPlatformIntermediateCAbase64DER];
  *(void *)unint64_t v6 = 0xD0000000000003DCLL;
  *((void *)v6 + 1) = 0x80000001894B9E80LL;
  char v7 = &v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testHostIntermediateCAbase64DER];
  *(void *)char v7 = 0xD0000000000003D8LL;
  *((void *)v7 + 1) = 0x80000001894BA260LL;
  id v8 = &v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testActorIntermediateCAbase64DER];
  *(void *)id v8 = 0xD0000000000003D8LL;
  *((void *)v8 + 1) = 0x80000001894BA640LL;
  id v9 = &v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_prodRootCAbase64DER];
  *(void *)id v9 = 0xD00000000000030CLL;
  *((void *)v9 + 1) = 0x80000001894BAA20LL;
  id v10 = &v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_prodPlatformIntermediateCAbase64DER];
  *(void *)id v10 = 0xD0000000000003B4LL;
  *((void *)v10 + 1) = 0x80000001894BAD30LL;
  int64_t v11 = &v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_prodHostIntermediateCAbase64DER];
  *(void *)int64_t v11 = 0xD0000000000003B4LL;
  *((void *)v11 + 1) = 0x80000001894BB0F0LL;
  char v12 = &v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_prodActorIntermediateCAbase64DER];
  *(void *)char v12 = 0xD0000000000003B0LL;
  *((void *)v12 + 1) = 0x80000001894BB4B0LL;
  *(void *)&v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain] = a1;
  *(void *)&v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType] = a2;
  id v13 = v2;
  sub_1894B8F10();
  swift_bridgeObjectRelease();
  unint64_t v22 = 0xD000000000000019LL;
  unint64_t v23 = 0x80000001894BB870LL;
  if (a1 >= 3)
  {
    unint64_t v21 = a1;
  }

  else
  {
    sub_1894B8E44();
    swift_bridgeObjectRelease();
    sub_1894B8E44();
    if (a2 < 3)
    {
      sub_1894B8E44();
      swift_bridgeObjectRelease();
      unint64_t v15 = v22;
      unint64_t v14 = v23;
      char v16 = (unint64_t *)&v13[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel];
      *char v16 = v22;
      v16[1] = v14;
      unint64_t v22 = v15;
      unint64_t v23 = v14;
      swift_bridgeObjectRetain();
      sub_1894B8E44();
      unint64_t v17 = v23;
      id v18 = (unint64_t *)&v13[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_refreshedNotificationName];
      *id v18 = v22;
      v18[1] = v17;

      v20.receiver = v13;
      v20.super_class = (Class)type metadata accessor for NarrativeCert();
      return objc_msgSendSuper2(&v20, sel_init);
    }

    unint64_t v21 = a2;
  }

  id result = (id)sub_1894B8F94();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for NarrativeRefs()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for NarrativeCert()
{
  return objc_opt_self();
}

uint64_t sub_1894B34A8()
{
  uint64_t v0 = (os_log_s *)sub_1894B3DEC();
  if (!v0)
  {
    if (qword_18C79C520 != -1) {
      swift_once();
    }
    uint64_t v17 = sub_1894B8DF0();
    __swift_project_value_buffer(v17, (uint64_t)qword_18C79C5B8);
    uint64_t v1 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v18 = sub_1894B8EB0();
    if (os_log_type_enabled(v1, v18))
    {
      id v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_1894AF000, v1, v18, "Error fetching narrativeRef.", v19, 2u);
      MEMORY[0x1895E8258](v19, -1LL, -1LL);
    }

LABEL_25:
    return 0LL;
  }

  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C648);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1894B9840;
  id v3 = (void **)((char *)v1 + OBJC_IVAR____TtC16libnarrativecert13NarrativeRefs_certRef);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *(void *)(v2 + 32) = *v3;
  sub_1894B8E74();
  uint64_t v5 = v2;
  uint64_t v28 = v2;
  id v6 = v4;
  uint64_t v7 = sub_1894B5368();
  uint64_t v8 = *(void *)(v7 + 16);
  if (v8)
  {
    id v9 = (const __CFAllocator *)*MEMORY[0x189604DB0];
    uint64_t v10 = v7 + 40;
    while (1)
    {
      swift_bridgeObjectRetain();
      uint64_t v11 = sub_1894B8DA8();
      unint64_t v13 = v12;
      swift_bridgeObjectRelease();
      if (v13 >> 60 == 15) {
        break;
      }
      unint64_t v14 = (const __CFData *)sub_1894B8DB4();
      SecCertificateRef v15 = SecCertificateCreateWithData(v9, v14);

      if (!v15)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (qword_18C79C520 != -1) {
          swift_once();
        }
        uint64_t v24 = sub_1894B8DF0();
        __swift_project_value_buffer(v24, (uint64_t)qword_18C79C5B8);
        unint64_t v21 = (os_log_s *)sub_1894B8DD8();
        os_log_type_t v25 = sub_1894B8EB0();
        if (os_log_type_enabled(v21, v25))
        {
          v26 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v26 = 0;
          _os_log_impl(&dword_1894AF000, v21, v25, "unable to create certificate from data.", v26, 2u);
          MEMORY[0x1895E8258](v26, -1LL, -1LL);
        }

        sub_1894B673C(v11, v13);
        goto LABEL_24;
      }

      char v16 = v15;
      MEMORY[0x1895E7D54]();
      if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
        sub_1894B8E80();
      }
      v10 += 16LL;
      sub_1894B8E8C();
      sub_1894B8E74();
      sub_1894B673C(v11, v13);

      if (!--v8)
      {

        swift_bridgeObjectRelease();
        return v28;
      }
    }

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_18C79C520 != -1) {
      swift_once();
    }
    uint64_t v20 = sub_1894B8DF0();
    __swift_project_value_buffer(v20, (uint64_t)qword_18C79C5B8);
    unint64_t v21 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v22 = sub_1894B8EB0();
    if (os_log_type_enabled(v21, v22))
    {
      unint64_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v23 = 0;
      _os_log_impl(&dword_1894AF000, v21, v22, "unable to decode certificate obtained from rootchain.", v23, 2u);
      MEMORY[0x1895E8258](v23, -1LL, -1LL);
    }

    unint64_t v12 = (v23 - 1) & v23;
    SecCertificateRef v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    char v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    id v19 = *v17;
    os_log_type_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_1894B7E64(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_1894B7EE0(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }

  uint64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }

  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    id v9 = v24;
    goto LABEL_25;
  }

  while (1)
  {
    id v9 = v24 + 1;
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

LABEL_24:
    goto LABEL_25;
  }

  swift_bridgeObjectRelease();
  return v5;
}

    swift_unknownObjectRelease();
    return 0LL;
  }

  type metadata accessor for SecCertificate(0LL);
  swift_unknownObjectRetain();
  v51 = swift_dynamicCastUnknownClassUnconditional();
  v52 = v1;
  v53 = (os_log_s *)sub_1894B8DD8();
  v54 = sub_1894B8E98();
  if (os_log_type_enabled(v53, v54))
  {
    v70 = v30;
    v55 = (uint8_t *)swift_slowAlloc();
    v56 = swift_slowAlloc();
    v72 = v56;
    *(_DWORD *)v55 = 136315138;
    v57 = *(void *)&v52[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel];
    v58 = *(void *)&v52[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel + 8];
    swift_bridgeObjectRetain();
    v71 = sub_1894B6858(v57, v58, &v72);
    sub_1894B8EE0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1894AF000, v53, v54, "Found CA cert for label %s", v55, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E8258](v56, -1LL, -1LL);
    MEMORY[0x1895E8258](v55, -1LL, -1LL);
  }

  else
  {
  }

  swift_unknownObjectRelease();
  return v51;
}

id sub_1894B38BC()
{
  uint64_t v0 = (os_log_s *)sub_1894B3DEC();
  if (!v0)
  {
    if (qword_18C79C520 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1894B8DF0();
    __swift_project_value_buffer(v8, (uint64_t)qword_18C79C5B8);
    uint64_t v1 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v9 = sub_1894B8EB0();
    if (os_log_type_enabled(v1, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1894AF000, v1, v9, "Error fetching narrativeRef.", v10, 2u);
      MEMORY[0x1895E8258](v10, -1LL, -1LL);
    }

    goto LABEL_19;
  }

  uint64_t v1 = v0;
  swift_beginAccess();
  swift_beginAccess();
  uint64_t v2 = SecIdentityCreate();
  if (!v2)
  {
    if (qword_18C79C520 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1894B8DF0();
    __swift_project_value_buffer(v11, (uint64_t)qword_18C79C5B8);
    unint64_t v12 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v13 = sub_1894B8EB0();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_18;
    }
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v14 = 0;
    SecCertificateRef v15 = "Error creating SecIdentity from certref and keyref.";
    goto LABEL_17;
  }

  id v3 = (void *)v2;
  unint64_t v4 = sub_1894B34A8();
  if (!v4)
  {
    if (qword_18C79C520 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_1894B8DF0();
    __swift_project_value_buffer(v16, (uint64_t)qword_18C79C5B8);
    unint64_t v12 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v13 = sub_1894B8EB0();
    if (!os_log_type_enabled(v12, v13)) {
      goto LABEL_18;
    }
    unint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v14 = 0;
    SecCertificateRef v15 = "Error getting full cert chain.";
LABEL_17:
    _os_log_impl(&dword_1894AF000, v12, v13, v15, v14, 2u);
    MEMORY[0x1895E8258](v14, -1LL, -1LL);
LABEL_18:

LABEL_19:
    return 0LL;
  }

  sub_1894B3BBC(v4);
  swift_bridgeObjectRelease();
  id v5 = objc_allocWithZone(MEMORY[0x189607A60]);
  id v6 = (void *)sub_1894B8E68();
  swift_bridgeObjectRelease();
  id v7 = objc_msgSend(v5, sel_initWithIdentity_certificates_persistence_, v3, v6, 0);

  return v7;
}

uint64_t sub_1894B3BBC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1894B8F4C();
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  }

  uint64_t v3 = MEMORY[0x18961AFE8];
  if (!v2) {
    return v3;
  }
  uint64_t v13 = MEMORY[0x18961AFE8];
  uint64_t result = sub_1894B6EA8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000LL) == 0)
  {
    if ((a1 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v2; ++i)
      {
        MEMORY[0x1895E7E20](i, a1);
        type metadata accessor for SecCertificate(0LL);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1894B6EA8(0, *(void *)(v3 + 16) + 1LL, 1);
          uint64_t v3 = v13;
        }

        unint64_t v7 = *(void *)(v3 + 16);
        unint64_t v6 = *(void *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_1894B6EA8(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }

        *(void *)(v3 + 16) = v7 + 1;
        sub_1894B7EE0(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }

    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      type metadata accessor for SecCertificate(0LL);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1894B6EA8(0, *(void *)(v3 + 16) + 1LL, 1);
          uint64_t v3 = v13;
        }

        unint64_t v11 = *(void *)(v3 + 16);
        unint64_t v10 = *(void *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_1894B6EA8(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }

        *(void *)(v3 + 16) = v11 + 1;
        sub_1894B7EE0(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }

      while (v2);
    }

    return v3;
  }

  __break(1u);
  return result;
}

id sub_1894B3DEC()
{
  v190[35] = *(CFTypeRef *)MEMORY[0x1895F89C0];
  uint64_t v1 = sub_1894B8DF0();
  uint64_t v182 = *(void *)(v1 - 8);
  uint64_t v183 = v1;
  uint64_t v2 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  v180 = (char *)v166 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = MEMORY[0x1895F8858](v2);
  v171 = (char *)v166 - v5;
  MEMORY[0x1895F8858](v4);
  v172 = (char *)v166 - v6;
  id v177 = (id)__swift_instantiateConcreteTypeFromMangledName(&qword_18C79C650);
  uint64_t inited = swift_initStackObject();
  __int128 v175 = xmmword_1894B9850;
  *(_OWORD *)(inited + 16) = xmmword_1894B9850;
  v176 = (char *)*MEMORY[0x18960B880];
  *(void *)(inited + 32) = sub_1894B8E20();
  *(void *)(inited + 40) = v8;
  id v181 = v0;
  uint64_t v9 = *(void *)&v0[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel];
  unint64_t v10 = *(void *)&v0[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel + 8];
  *(void *)(inited + 72) = MEMORY[0x189617FA8];
  uint64_t v178 = v9;
  *(void *)(inited + 48) = v9;
  *(void *)(inited + 56) = v10;
  uint64_t v174 = *MEMORY[0x18960B998];
  *(void *)(inited + 80) = sub_1894B8E20();
  *(void *)(inited + 88) = v11;
  unint64_t v12 = (void *)*MEMORY[0x18960B9B0];
  type metadata accessor for CFString(0LL);
  uint64_t v14 = v13;
  *(void *)(inited + 120) = v13;
  *(void *)(inited + 96) = v12;
  uint64_t v15 = *MEMORY[0x18960BB38];
  *(void *)(inited + 128) = sub_1894B8E20();
  *(void *)(inited + 136) = v16;
  uint64_t v17 = (void *)*MEMORY[0x18960BB60];
  *(void *)(inited + 168) = v14;
  *(void *)(inited + 144) = v17;
  uint64_t v18 = *MEMORY[0x18960B968];
  *(void *)(inited + 176) = sub_1894B8E20();
  *(void *)(inited + 184) = v19;
  uint64_t v20 = (void *)*MEMORY[0x18960B970];
  *(void *)(inited + 216) = v14;
  *(void *)(inited + 192) = v20;
  unint64_t v21 = (char *)*MEMORY[0x18960BE30];
  *(void *)(inited + 224) = sub_1894B8E20();
  *(void *)(inited + 232) = v22;
  *(void *)(inited + 264) = MEMORY[0x1896184C8];
  *(_BYTE *)(inited + 240) = 1;
  unint64_t v179 = v10;
  swift_bridgeObjectRetain();
  id v173 = v12;
  id v23 = v17;
  id v24 = v20;
  unint64_t v186 = sub_1894B5240(inited);
  sub_1894B7AB0();
  v190[0] = 0LL;
  os_log_type_t v25 = (const __CFDictionary *)sub_1894B8DFC();
  swift_bridgeObjectRelease();
  OSStatus v26 = SecItemCopyMatching(v25, v190);

  if (v26)
  {
    uint64_t v27 = (__CFString *)SecCopyErrorMessageString(v26, 0LL);
    if (qword_18C79C520 != -1) {
      swift_once();
    }
    uint64_t v28 = v183;
    uint64_t v29 = __swift_project_value_buffer(v183, (uint64_t)qword_18C79C5B8);
    uint64_t v30 = v182;
    v31 = v180;
    (*(void (**)(char *, uint64_t, uint64_t))(v182 + 16))(v180, v29, v28);
    v32 = v27;
    id v33 = v181;
    uint64_t v34 = v32;
    v35 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v36 = sub_1894B8EB0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc();
      id v181 = (id)swift_slowAlloc();
      v188[0] = (uint64_t)v181;
      *(_DWORD *)uint64_t v37 = 136315394;
      unint64_t v38 = v179;
      swift_bridgeObjectRetain();
      uint64_t v189 = sub_1894B6858(v178, v38, v188);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v37 + 12) = 2080;
      if (v34)
      {
        uint64_t v39 = sub_1894B8E20();
        unint64_t v41 = v40;
      }

      else
      {
        uint64_t v39 = 0x6E776F6E6B6E75LL;
        unint64_t v41 = 0xE700000000000000LL;
      }

      v65 = v180;
      uint64_t v189 = sub_1894B6858(v39, v41, v188);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      _os_log_impl( &dword_1894AF000,  v35,  v36,  "Error fetching private key from keychain for %s: %s",  (uint8_t *)v37,  0x16u);
      id v66 = v181;
      swift_arrayDestroy();
      MEMORY[0x1895E8258](v66, -1LL, -1LL);
      MEMORY[0x1895E8258](v37, -1LL, -1LL);

      uint64_t v58 = v183;
      v56 = *(void (**)(char *, uint64_t))(v182 + 8);
      v57 = v65;
      goto LABEL_20;
    }

    v56 = *(void (**)(char *, uint64_t))(v30 + 8);
    v57 = v31;
LABEL_13:
    uint64_t v58 = v28;
LABEL_20:
    v56(v57, v58);
LABEL_21:
    id v67 = 0LL;
    goto LABEL_22;
  }

  id v167 = v23;
  uint64_t v168 = v18;
  v180 = v21;
  uint64_t v170 = v15;
  if (!v190[0])
  {
    if (qword_18C79C520 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v183, (uint64_t)qword_18C79C5B8);
    id v59 = v181;
    v60 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v61 = sub_1894B8EB0();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      v188[0] = v63;
      *(_DWORD *)v62 = 136315138;
      unint64_t v64 = v179;
      swift_bridgeObjectRetain();
      uint64_t v189 = sub_1894B6858(v178, v64, v188);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1894AF000, v60, v61, "Error finding private key ref for %s", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E8258](v63, -1LL, -1LL);
      MEMORY[0x1895E8258](v62, -1LL, -1LL);
    }

    else
    {
    }

    goto LABEL_21;
  }

  type metadata accessor for SecKey(0LL);
  uint64_t v43 = v42;
  swift_unknownObjectRetain();
  v166[1] = v43;
  id v44 = (id)swift_dynamicCastUnknownClassUnconditional();
  if (qword_18C79C520 != -1) {
    swift_once();
  }
  v45 = (void *)__swift_project_value_buffer(v183, (uint64_t)qword_18C79C5B8);
  v46 = (char *)v181;
  id v181 = v45;
  v47 = (os_log_s *)sub_1894B8DD8();
  os_log_type_t v48 = sub_1894B8EBC();
  BOOL v49 = os_log_type_enabled(v47, v48);
  id v169 = v44;
  if (v49)
  {
    v50 = (uint8_t *)swift_slowAlloc();
    v51 = v46;
    uint64_t v52 = swift_slowAlloc();
    v188[0] = v52;
    *(_DWORD *)v50 = 136315138;
    v166[0] = v50 + 4;
    unint64_t v53 = v179;
    swift_bridgeObjectRetain();
    uint64_t v189 = sub_1894B6858(v178, v53, v188);
    sub_1894B8EE0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1894AF000, v47, v48, "Found key %s", v50, 0xCu);
    swift_arrayDestroy();
    uint64_t v54 = v52;
    v46 = v51;
    MEMORY[0x1895E8258](v54, -1LL, -1LL);
    v55 = v50;
    id v44 = v169;
    MEMORY[0x1895E8258](v55, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v69 = v14;
  v70 = &v46[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testKeychain];
  swift_beginAccess();
  if (!*(void *)v70)
  {
    v99 = SecKeyCopyPublicKey((SecKeyRef)v44);
    if (v99) {
      goto LABEL_34;
    }
LABEL_39:
    v129 = v46;
    v130 = (void *)sub_1894B8DD8();
    os_log_type_t v131 = sub_1894B8EB0();
    if (!os_log_type_enabled((os_log_t)v130, v131))
    {

      goto LABEL_21;
    }

    v132 = (uint8_t *)swift_slowAlloc();
    uint64_t v133 = swift_slowAlloc();
    uint64_t v189 = v133;
    *(_DWORD *)v132 = 136315138;
    unint64_t v134 = v179;
    swift_bridgeObjectRetain();
    uint64_t v187 = sub_1894B6858(v178, v134, &v189);
    sub_1894B8EE0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1894AF000, (os_log_t)v130, v131, "Error unwrapping public key for %s", v132, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E8258](v133, -1LL, -1LL);
    MEMORY[0x1895E8258](v132, -1LL, -1LL);
    goto LABEL_44;
  }

  v176 = v46;
  uint64_t v71 = swift_initStackObject();
  *(_OWORD *)(v71 + 16) = v175;
  *(void *)(v71 + 32) = sub_1894B8E20();
  *(void *)(v71 + 40) = v72;
  *(void *)(v71 + 72) = MEMORY[0x189617FA8];
  unint64_t v73 = v179;
  *(void *)(v71 + 48) = v178;
  *(void *)(v71 + 56) = v73;
  *(void *)(v71 + 80) = sub_1894B8E20();
  *(void *)(v71 + 88) = v74;
  *(void *)(v71 + 120) = v69;
  v75 = v173;
  *(void *)(v71 + 96) = v173;
  *(void *)(v71 + 128) = sub_1894B8E20();
  *(void *)(v71 + 136) = v76;
  *(void *)(v71 + 168) = v69;
  v77 = v167;
  *(void *)(v71 + 144) = v167;
  *(void *)(v71 + 176) = sub_1894B8E20();
  *(void *)(v71 + 184) = v78;
  v79 = (void *)*MEMORY[0x18960B980];
  *(void *)(v71 + 216) = v69;
  *(void *)(v71 + 192) = v79;
  *(void *)(v71 + 224) = sub_1894B8E20();
  *(void *)(v71 + 232) = v80;
  *(void *)(v71 + 264) = MEMORY[0x1896184C8];
  *(_BYTE *)(v71 + 240) = 1;
  swift_bridgeObjectRetain();
  id v81 = v75;
  id v82 = v77;
  id v83 = v79;
  unint64_t v186 = sub_1894B5240(v71);
  sub_1894B7AB0();
  swift_unknownObjectRelease();
  v190[0] = 0LL;
  v84 = (const __CFDictionary *)sub_1894B8DFC();
  swift_bridgeObjectRelease();
  OSStatus v85 = SecItemCopyMatching(v84, v190);

  if (v85)
  {
    v86 = (__CFString *)SecCopyErrorMessageString(v85, 0LL);
    uint64_t v87 = v182;
    v88 = v172;
    uint64_t v28 = v183;
    (*(void (**)(char *, id, uint64_t))(v182 + 16))(v172, v181, v183);
    v89 = v86;
    v90 = v176;
    v91 = v89;
    v92 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v93 = sub_1894B8EB0();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = swift_slowAlloc();
      id v181 = (id)swift_slowAlloc();
      uint64_t v189 = (uint64_t)v181;
      *(_DWORD *)uint64_t v94 = 136315394;
      unint64_t v95 = v179;
      swift_bridgeObjectRetain();
      uint64_t v187 = sub_1894B6858(v178, v95, &v189);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v94 + 12) = 2080;
      if (v91)
      {
        uint64_t v96 = sub_1894B8E20();
        unint64_t v98 = v97;
      }

      else
      {
        uint64_t v96 = 0x6E776F6E6B6E75LL;
        unint64_t v98 = 0xE700000000000000LL;
      }

      uint64_t v150 = v182;
      v151 = v172;
      uint64_t v187 = sub_1894B6858(v96, v98, &v189);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      _os_log_impl( &dword_1894AF000,  v92,  v93,  "Error fetching public key from keychain for %s: %s",  (uint8_t *)v94,  0x16u);
      id v152 = v181;
      swift_arrayDestroy();
      MEMORY[0x1895E8258](v152, -1LL, -1LL);
      MEMORY[0x1895E8258](v94, -1LL, -1LL);

      (*(void (**)(char *, uint64_t))(v150 + 8))(v151, v183);
      goto LABEL_21;
    }

    v56 = *(void (**)(char *, uint64_t))(v87 + 8);
    v57 = v88;
    goto LABEL_13;
  }

  v46 = v176;
  id v44 = v169;
  if (!v190[0]) {
    goto LABEL_39;
  }
  swift_unknownObjectRetain();
  v99 = (void *)swift_dynamicCastUnknownClassUnconditional();
LABEL_34:
  v100 = v99;
  uint64_t v101 = SecKeyCopyPublicKeyHash();
  if (!v101)
  {
    v135 = v46;
    v130 = (void *)sub_1894B8DD8();
    os_log_type_t v136 = sub_1894B8EB0();
    if (!os_log_type_enabled((os_log_t)v130, v136))
    {

      goto LABEL_21;
    }

    v180 = v100;
    v137 = (uint8_t *)swift_slowAlloc();
    uint64_t v138 = swift_slowAlloc();
    uint64_t v189 = v138;
    *(_DWORD *)v137 = 136315138;
    unint64_t v139 = v179;
    swift_bridgeObjectRetain();
    uint64_t v187 = sub_1894B6858(v178, v139, &v189);
    sub_1894B8EE0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1894AF000, (os_log_t)v130, v136, "Error getting public key hash from %s", v137, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E8258](v138, -1LL, -1LL);
    MEMORY[0x1895E8258](v137, -1LL, -1LL);
    v140 = v180;

LABEL_44:
    goto LABEL_21;
  }

  v102 = (void *)v101;
  v103 = v46;
  uint64_t v104 = swift_initStackObject();
  *(_OWORD *)(v104 + 16) = xmmword_1894B9860;
  *(void *)(v104 + 32) = sub_1894B8E20();
  *(void *)(v104 + 40) = v105;
  type metadata accessor for CFData(0LL);
  *(void *)(v104 + 72) = v106;
  *(void *)(v104 + 48) = v102;
  *(void *)(v104 + 80) = sub_1894B8E20();
  *(void *)(v104 + 88) = v107;
  v108 = (void *)*MEMORY[0x18960BB40];
  *(void *)(v104 + 120) = v69;
  *(void *)(v104 + 96) = v108;
  *(void *)(v104 + 128) = sub_1894B8E20();
  *(void *)(v104 + 136) = v109;
  *(void *)(v104 + 168) = MEMORY[0x1896184C8];
  *(_BYTE *)(v104 + 144) = 1;
  id v110 = v102;
  id v111 = v108;
  unint64_t v186 = sub_1894B5240(v104);
  sub_1894B7AB0();
  uint64_t v189 = 0LL;
  v112 = (const __CFDictionary *)sub_1894B8DFC();
  swift_bridgeObjectRelease();
  OSStatus v113 = SecItemCopyMatching(v112, (CFTypeRef *)&v189);

  if (v113)
  {
    id v177 = v110;
    v180 = v100;
    v114 = (__CFString *)SecCopyErrorMessageString(v113, 0LL);
    uint64_t v115 = v182;
    v116 = v171;
    uint64_t v117 = v183;
    (*(void (**)(char *, id, uint64_t))(v182 + 16))(v171, v181, v183);
    id v118 = v103;
    v119 = v114;
    id v120 = v118;
    v121 = v119;
    v122 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v123 = sub_1894B8EB0();
    if (os_log_type_enabled(v122, v123))
    {
      uint64_t v124 = swift_slowAlloc();
      id v181 = (id)swift_slowAlloc();
      uint64_t v187 = (uint64_t)v181;
      *(_DWORD *)uint64_t v124 = 136315394;
      unint64_t v125 = v179;
      swift_bridgeObjectRetain();
      uint64_t v185 = sub_1894B6858(v178, v125, &v187);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v124 + 12) = 2080;
      if (v121)
      {
        uint64_t v126 = sub_1894B8E20();
        unint64_t v128 = v127;
      }

      else
      {
        uint64_t v126 = 0x6E776F6E6B6E75LL;
        unint64_t v128 = 0xE700000000000000LL;
      }

      uint64_t v160 = v182;
      v161 = v171;
      uint64_t v185 = sub_1894B6858(v126, v128, &v187);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1894AF000, v122, v123, "Error fetching cert %s from keychain: %s", (uint8_t *)v124, 0x16u);
      id v162 = v181;
      swift_arrayDestroy();
      MEMORY[0x1895E8258](v162, -1LL, -1LL);
      MEMORY[0x1895E8258](v124, -1LL, -1LL);
      v163 = v180;

      (*(void (**)(char *, uint64_t))(v160 + 8))(v161, v183);
    }

    else
    {

      v149 = v180;
      (*(void (**)(char *, uint64_t))(v115 + 8))(v116, v117);
    }

LABEL_61:
    swift_unknownObjectRelease();
    goto LABEL_21;
  }

  if (!v189)
  {
    id v153 = v103;
    v154 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v155 = sub_1894B8EB0();
    if (os_log_type_enabled(v154, v155))
    {
      v180 = v100;
      v156 = (uint8_t *)swift_slowAlloc();
      uint64_t v157 = swift_slowAlloc();
      uint64_t v187 = v157;
      *(_DWORD *)v156 = 136315138;
      id v177 = v110;
      unint64_t v158 = v179;
      swift_bridgeObjectRetain();
      uint64_t v185 = sub_1894B6858(v178, v158, &v187);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1894AF000, v154, v155, "Error finding cert ref for %s", v156, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E8258](v157, -1LL, -1LL);
      MEMORY[0x1895E8258](v156, -1LL, -1LL);
      v159 = v180;
    }

    else
    {
    }

    goto LABEL_61;
  }

  type metadata accessor for SecCertificate(0LL);
  swift_unknownObjectRetain();
  uint64_t v141 = swift_dynamicCastUnknownClassUnconditional();
  id v142 = v103;
  v143 = (os_log_s *)sub_1894B8DD8();
  os_log_type_t v144 = sub_1894B8EBC();
  if (os_log_type_enabled(v143, v144))
  {
    v145 = (uint8_t *)swift_slowAlloc();
    id v146 = (id)swift_slowAlloc();
    v180 = v100;
    id v147 = v146;
    uint64_t v187 = (uint64_t)v146;
    *(_DWORD *)v145 = 136315138;
    uint64_t v183 = v141;
    unint64_t v148 = v179;
    swift_bridgeObjectRetain();
    uint64_t v185 = sub_1894B6858(v178, v148, &v187);
    sub_1894B8EE0();

    uint64_t v141 = v183;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1894AF000, v143, v144, "Found cert label %s", v145, 0xCu);
    v100 = v180;
    swift_arrayDestroy();
    MEMORY[0x1895E8258](v147, -1LL, -1LL);
    MEMORY[0x1895E8258](v145, -1LL, -1LL);
  }

  else
  {
  }

  v164 = (objc_class *)type metadata accessor for NarrativeRefs();
  v165 = (char *)objc_allocWithZone(v164);
  *(void *)&v165[OBJC_IVAR____TtC16libnarrativecert13NarrativeRefs_certRef] = v141;
  *(void *)&v165[OBJC_IVAR____TtC16libnarrativecert13NarrativeRefs_keyRef] = v169;
  v184.receiver = v165;
  v184.super_class = v164;
  id v67 = objc_msgSendSuper2(&v184, sel_init);

  swift_unknownObjectRelease();
LABEL_22:
  swift_unknownObjectRelease();
  return v67;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1894B5240(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6B8);
  uint64_t v2 = sub_1894B8F70();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }

  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1894B7EF0(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1894B7030(v15, v16);
    if ((v10 & 1) != 0) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1894B7EE0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1LL);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48LL;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_1894B5368()
{
  uint64_t v1 = v0;
  uint64_t v2 = (char *)sub_1894B3DEC();
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = (id *)&v2[OBJC_IVAR____TtC16libnarrativecert13NarrativeRefs_certRef];
    swift_beginAccess();
    id v5 = *v4;
    uint64_t v6 = (__SecCertificate *)sub_1894B5838();

    uint64_t v7 = (void *)MEMORY[0x18961AFE8];
    while (v6)
    {
      CFDataRef v8 = SecCertificateCopyData(v6);
      uint64_t v9 = sub_1894B8DCC();
      unint64_t v11 = v10;

      uint64_t v12 = sub_1894B8DC0();
      uint64_t v14 = v13;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v7 = sub_1894B2078(0LL, v7[2] + 1LL, 1, v7);
      }
      unint64_t v16 = v7[2];
      unint64_t v15 = v7[3];
      if (v16 >= v15 >> 1) {
        uint64_t v7 = sub_1894B2078((void *)(v15 > 1), v16 + 1, 1, v7);
      }
      v7[2] = v16 + 1;
      __int128 v17 = &v7[2 * v16];
      v17[4] = v12;
      v17[5] = v14;
      sub_1894B6750(v9, v11);
      uint64_t v18 = v6;
      uint64_t v6 = (__SecCertificate *)sub_1894B5838();
    }

    if (v7[2])
    {
      if (qword_18C79C520 != -1) {
        swift_once();
      }
      uint64_t v19 = sub_1894B8DF0();
      __swift_project_value_buffer(v19, (uint64_t)qword_18C79C5B8);
      uint64_t v20 = v1;
      unint64_t v21 = (os_log_s *)sub_1894B8DD8();
      os_log_type_t v22 = sub_1894B8E98();
      if (os_log_type_enabled(v21, v22))
      {
        id v23 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        uint64_t v38 = v24;
        *(_DWORD *)id v23 = 136315138;
        uint64_t v37 = v3;
        uint64_t v26 = *(void *)&v20[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel];
        unint64_t v25 = *(void *)&v20[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel + 8];
        swift_bridgeObjectRetain();
        sub_1894B6858(v26, v25, &v38);
        sub_1894B8EE0();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1894AF000, v21, v22, "Using dynamically generated CA cert chain for %s", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1895E8258](v24, -1LL, -1LL);
        MEMORY[0x1895E8258](v23, -1LL, -1LL);

        return (uint64_t)v7;
      }
    }

    else
    {
      if (qword_18C79C520 != -1) {
        swift_once();
      }
      uint64_t v32 = sub_1894B8DF0();
      __swift_project_value_buffer(v32, (uint64_t)qword_18C79C5B8);
      swift_bridgeObjectRetain();
      id v33 = (os_log_s *)sub_1894B8DD8();
      os_log_type_t v34 = sub_1894B8EB0();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v35 = 134217984;
        uint64_t v36 = v7[2];
        swift_bridgeObjectRelease();
        uint64_t v38 = v36;
        sub_1894B8EE0();
        swift_bridgeObjectRelease();
        _os_log_impl( &dword_1894AF000,  v33,  v34,  "Error dynamically assembling CA chain, retrieved only %ld certs",  v35,  0xCu);
        MEMORY[0x1895E8258](v35, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n();
      }

      uint64_t v7 = (void *)sub_1894B617C();
    }

    return (uint64_t)v7;
  }

  if (qword_18C79C520 != -1) {
    swift_once();
  }
  uint64_t v27 = sub_1894B8DF0();
  __swift_project_value_buffer(v27, (uint64_t)qword_18C79C5B8);
  uint64_t v28 = (os_log_s *)sub_1894B8DD8();
  os_log_type_t v29 = sub_1894B8EB0();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v30 = 0;
    _os_log_impl(&dword_1894AF000, v28, v29, "Error fetching narrativeRefs for cert chain", v30, 2u);
    MEMORY[0x1895E8258](v30, -1LL, -1LL);
  }

  return sub_1894B617C();
}

uint64_t sub_1894B5838()
{
  uint64_t v1 = v0;
  v74[1] = *MEMORY[0x1895F89C0];
  uint64_t v2 = sub_1894B8DF0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  id v5 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  AuthorityKeyID = (void *)SecCertificateGetAuthorityKeyID();
  uint64_t v7 = qword_18C79C520;
  if (!AuthorityKeyID)
  {
    if (qword_18C79C520 != -1) {
      swift_once();
    }
    __swift_project_value_buffer(v2, (uint64_t)qword_18C79C5B8);
    uint64_t v20 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v21 = sub_1894B8EB0();
    if (os_log_type_enabled(v20, v21))
    {
      os_log_type_t v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v22 = 0;
      _os_log_impl(&dword_1894AF000, v20, v21, "Error reading authority key identifier from certificate", v22, 2u);
      MEMORY[0x1895E8258](v22, -1LL, -1LL);
    }

    return 0LL;
  }

  v68 = v5;
  id v8 = AuthorityKeyID;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v69 = v2;
  uint64_t v9 = (void *)__swift_project_value_buffer(v2, (uint64_t)qword_18C79C5B8);
  id v10 = v8;
  id v70 = v9;
  unint64_t v11 = (os_log_s *)sub_1894B8DD8();
  os_log_type_t v12 = sub_1894B8EA4();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    id v67 = v1;
    uint64_t v14 = (uint8_t *)v13;
    uint64_t v15 = swift_slowAlloc();
    v74[0] = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    CFTypeRef result = v10;
    type metadata accessor for CFData(0LL);
    id v16 = v10;
    uint64_t v17 = sub_1894B8E2C();
    CFTypeRef result = (CFTypeRef)sub_1894B6858(v17, v18, v74);
    sub_1894B8EE0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1894AF000, v11, v12, "Looking up CA with authority key identifier %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E8258](v15, -1LL, -1LL);
    uint64_t v19 = v14;
    uint64_t v1 = v67;
    MEMORY[0x1895E8258](v19, -1LL, -1LL);
  }

  else
  {
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C650);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1894B9860;
  *(void *)(inited + 32) = sub_1894B8E20();
  *(void *)(inited + 40) = v24;
  type metadata accessor for CFData(0LL);
  *(void *)(inited + 72) = v25;
  *(void *)(inited + 48) = v10;
  *(void *)(inited + 80) = sub_1894B8E20();
  *(void *)(inited + 88) = v26;
  uint64_t v27 = (void *)*MEMORY[0x18960BB40];
  type metadata accessor for CFString(0LL);
  *(void *)(inited + 120) = v28;
  *(void *)(inited + 96) = v27;
  *(void *)(inited + 128) = sub_1894B8E20();
  *(void *)(inited + 136) = v29;
  *(void *)(inited + 168) = MEMORY[0x1896184C8];
  *(_BYTE *)(inited + 144) = 1;
  id v30 = v10;
  id v31 = v27;
  v74[0] = sub_1894B5240(inited);
  sub_1894B7AB0();
  CFTypeRef result = 0LL;
  uint64_t v32 = (const __CFDictionary *)sub_1894B8DFC();
  swift_bridgeObjectRelease();
  OSStatus v33 = SecItemCopyMatching(v32, &result);

  if (v33)
  {
    os_log_type_t v34 = (__CFString *)SecCopyErrorMessageString(v33, 0LL);
    v35 = v68;
    uint64_t v36 = v69;
    (*(void (**)(char *, id, uint64_t))(v3 + 16))(v68, v70, v69);
    uint64_t v37 = v34;
    uint64_t v38 = v1;
    uint64_t v39 = v37;
    unint64_t v40 = (void (**)(void, void))v3;
    unint64_t v41 = v39;
    uint64_t v42 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v43 = sub_1894B8EB0();
    if (os_log_type_enabled(v42, v43))
    {
      id v67 = v40;
      id v70 = v30;
      uint64_t v44 = swift_slowAlloc();
      uint64_t v45 = swift_slowAlloc();
      uint64_t v72 = v45;
      *(_DWORD *)uint64_t v44 = 136315394;
      uint64_t v46 = *(void *)&v38[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel];
      unint64_t v47 = *(void *)&v38[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel + 8];
      swift_bridgeObjectRetain();
      uint64_t v71 = sub_1894B6858(v46, v47, &v72);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v44 + 12) = 2080;
      if (v41)
      {
        uint64_t v48 = sub_1894B8E20();
        unint64_t v50 = v49;
      }

      else
      {
        unint64_t v50 = 0xE700000000000000LL;
        uint64_t v48 = 0x6E776F6E6B6E75LL;
      }

      uint64_t v71 = sub_1894B6858(v48, v50, &v72);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1894AF000, v42, v43, "Error fetching CA cert for %s from keychain: %s", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1895E8258](v45, -1LL, -1LL);
      MEMORY[0x1895E8258](v44, -1LL, -1LL);

      (*((void (**)(char *, uint64_t))v67 + 1))(v68, v69);
    }

    else
    {

      ((void (**)(char *, uint64_t))v40)[1](v35, v36);
    }

    goto LABEL_24;
  }

  if (!result)
  {
    id v59 = v1;
    v60 = (os_log_s *)sub_1894B8DD8();
    os_log_type_t v61 = sub_1894B8EB0();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      uint64_t v63 = swift_slowAlloc();
      uint64_t v72 = v63;
      *(_DWORD *)v62 = 136315138;
      id v70 = v30;
      uint64_t v64 = *(void *)&v59[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel];
      unint64_t v65 = *(void *)&v59[OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_keychainLabel + 8];
      swift_bridgeObjectRetain();
      uint64_t v71 = sub_1894B6858(v64, v65, &v72);
      sub_1894B8EE0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1894AF000, v60, v61, "Error finding CA cert ref for %s", v62, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1895E8258](v63, -1LL, -1LL);
      MEMORY[0x1895E8258](v62, -1LL, -1LL);
    }

    else
    {
    }

uint64_t sub_1894B617C()
{
  uint64_t v1 = v0;
  if (qword_18C79C520 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1894B8DF0();
  __swift_project_value_buffer(v2, (uint64_t)qword_18C79C5B8);
  uint64_t v3 = (os_log_s *)sub_1894B8DD8();
  os_log_type_t v4 = sub_1894B8EB0();
  if (os_log_type_enabled(v3, v4))
  {
    id v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1894AF000, v3, v4, "Warning: Using hardcoded CA chain", v5, 2u);
    MEMORY[0x1895E8258](v5, -1LL, -1LL);
  }

  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_domain);
  if (v6)
  {
    if (v6 != 1 && v6 != 2) {
      goto LABEL_32;
    }
    char v7 = sub_1894B8F88();
    swift_bridgeObjectRelease();
    if ((v7 & 1) == 0)
    {
      uint64_t v10 = *(void *)(v1 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType);
      if (v10 == 2)
      {
        uint64_t v11 = OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_prodActorIntermediateCAbase64DER;
      }

      else if (v10 == 1)
      {
        uint64_t v11 = OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_prodHostIntermediateCAbase64DER;
      }

      else
      {
        if (v10) {
          goto LABEL_32;
        }
        uint64_t v11 = OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_prodPlatformIntermediateCAbase64DER;
      }

      os_log_type_t v21 = (uint64_t *)(v1 + v11);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_1894B2078(0LL, 1LL, 1, MEMORY[0x18961AFE8]);
      unint64_t v24 = v15[2];
      unint64_t v25 = v15[3];
      unint64_t v18 = v24 + 1;
      if (v24 >= v25 >> 1)
      {
        uint64_t v36 = v15;
        unint64_t v37 = v15[2];
        uint64_t v38 = sub_1894B2078((void *)(v25 > 1), v24 + 1, 1, v36);
        unint64_t v24 = v37;
        uint64_t v15 = v38;
      }

      v15[2] = v18;
      uint64_t v26 = &v15[2 * v24];
      v26[4] = v23;
      v26[5] = v22;
      uint64_t v20 = OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_prodRootCAbase64DER;
      goto LABEL_29;
    }
  }

  else
  {
    swift_bridgeObjectRelease();
  }

  uint64_t v8 = *(void *)(v1 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_identityType);
  if (v8 == 2)
  {
    uint64_t v9 = OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testActorIntermediateCAbase64DER;
    goto LABEL_20;
  }

  if (v8 != 1)
  {
    if (!v8)
    {
      uint64_t v9 = OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testPlatformIntermediateCAbase64DER;
      goto LABEL_20;
    }

LABEL_32:
    uint64_t result = sub_1894B8F94();
    __break(1u);
    return result;
  }

  uint64_t v9 = OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testHostIntermediateCAbase64DER;
LABEL_20:
  os_log_type_t v12 = (uint64_t *)(v1 + v9);
  uint64_t v14 = *v12;
  uint64_t v13 = v12[1];
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_1894B2078(0LL, 1LL, 1, MEMORY[0x18961AFE8]);
  unint64_t v16 = v15[2];
  unint64_t v17 = v15[3];
  unint64_t v18 = v16 + 1;
  if (v16 >= v17 >> 1)
  {
    OSStatus v33 = v15;
    unint64_t v34 = v15[2];
    v35 = sub_1894B2078((void *)(v17 > 1), v16 + 1, 1, v33);
    unint64_t v16 = v34;
    uint64_t v15 = v35;
  }

  v15[2] = v18;
  uint64_t v19 = &v15[2 * v16];
  v19[4] = v14;
  v19[5] = v13;
  uint64_t v20 = OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testRootCAbase64DER;
LABEL_29:
  uint64_t v27 = (uint64_t *)(v1 + v20);
  uint64_t v29 = *v27;
  uint64_t v28 = v27[1];
  unint64_t v30 = v15[3];
  swift_bridgeObjectRetain();
  if (v18 >= v30 >> 1) {
    uint64_t v15 = sub_1894B2078((void *)(v30 > 1), v18 + 1, 1, v15);
  }
  v15[2] = v18 + 1;
  id v31 = &v15[2 * v18];
  v31[4] = v29;
  v31[5] = v28;
  return (uint64_t)v15;
}

  uint64_t result = sub_1894B8F7C();
  __break(1u);
  return result;
}

uint64_t sub_1894B64CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_1894B7EE0((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    uint64_t *v3 = 0x8000000000000000LL;
    sub_1894B7734(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }

  else
  {
    sub_1894B7EA0(a1);
    sub_1894B7174(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_1894B7EA0((uint64_t)v9);
  }

id NarrativeCert.__allocating_init()()
{
  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void NarrativeCert.init()()
{
}

id NarrativeCert.__deallocating_deinit()
{
  return sub_1894B660C(type metadata accessor for NarrativeCert);
}

id sub_1894B660C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_1894B672C(uint64_t result, _BYTE **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1894B673C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_1894B6750(a1, a2);
  }
  return a1;
}

uint64_t sub_1894B6750(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_1894B6794( uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1894B67C8(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1894B67E8(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_1894B6858(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_1894B8EE0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1894B6858(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1894B6928(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1894B7E64((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }

  else
  {
    uint64_t ObjectType = MEMORY[0x1896191F8];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1894B7E64((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain();
  }

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1894B6928(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000LL) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1894B8EEC();
            uint64_t result = 0LL;
            *a1 = (uint64_t)__dst;
            return result;
          }

          goto LABEL_17;
        }
      }
    }

LABEL_13:
    uint64_t result = sub_1894B6AE0(a5, a6);
    *a1 = v12;
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

  uint64_t v8 = sub_1894B8F34();
  if (!v8)
  {
    sub_1894B8F40();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1894B8F7C();
    __break(1u);
    return result;
  }

LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

        uint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    unint64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1LL << v3) - 1;
  }

  else
  {
    unint64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1LL << result) - 1;
  }

  *unint64_t v18 = v20 & v19;
  os_log_type_t v21 = *(void *)(a2 + 16);
  uint64_t v22 = __OFSUB__(v21, 1LL);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }

  return result;
}

uint64_t sub_1894B6AE0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1894B6B74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1894B6D4C(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1894B6D4C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1894B6B74(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000LL) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000LL) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1894B6CE8(v2, 0LL);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1894B8F1C();
      if ((v6 & 1) != 0) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1894B8F40();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1894B8E50();
      if (!v2) {
        return MEMORY[0x18961AFE8];
      }
    }

    sub_1894B8F7C();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1894B8F40();
    __break(1u);
  }

  else
  {
    return MEMORY[0x18961AFE8];
  }

  return result;
}

void *sub_1894B6CE8(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x18961AFE8];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1894B6D4C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6A8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }

LABEL_30:
  uint64_t result = sub_1894B8F7C();
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

_BYTE **sub_1894B6E98(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1894B6EA8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1894B6EC4(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1894B6EC4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6C8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_30;
  }

  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }

unint64_t sub_1894B7030(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1894B8FE8();
  return sub_1894B7094(a1, a2, v4);
}

unint64_t sub_1894B7094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1894B8F88() & 1) == 0)
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

      while (!v14 && (sub_1894B8F88() & 1) == 0);
    }
  }

  return v6;
}

double sub_1894B7174@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1894B7030(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000LL;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1894B78CC();
      uint64_t v11 = v13;
    }

    swift_bridgeObjectRelease();
    sub_1894B7EE0((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1894B7560(v8, v11);
    *uint64_t v4 = v11;
    swift_bridgeObjectRelease();
  }

  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }

  return result;
}

uint64_t sub_1894B7264(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6B8);
  uint64_t v6 = sub_1894B8F64();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
    unint64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1LL << v8);
    }
    else {
      uint64_t v9 = -1LL;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0LL;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }

      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1LL))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }

        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if ((a2 & 1) != 0)
              {
                uint64_t v32 = 1LL << *(_BYTE *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *unint64_t v34 = -1LL << v32;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1LL)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }

            int64_t v13 = v20;
          }
        }

LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      os_log_type_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      unint64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_1894B7EE0(v24, v35);
      }

      else
      {
        sub_1894B7E64((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }

      sub_1894B8FDC();
      sub_1894B8E38();
      uint64_t result = sub_1894B8FE8();
      uint64_t v25 = -1LL << *(_BYTE *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1LL << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1LL << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }

          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0LL;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }

        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *uint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_1894B7EE0(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }

  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

unint64_t sub_1894B7560(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_1894B8F04();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_1894B8FDC();
        swift_bridgeObjectRetain();
        sub_1894B8E38();
        uint64_t v10 = sub_1894B8FE8();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }

        else if (v11 >= v8)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          int64_t v13 = (_OWORD *)(v12 + 16 * v3);
          unint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *int64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          unint64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            __int128 v9 = v17[1];
            *unint64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }

_OWORD *sub_1894B7734(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_1894B7030(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }

  else
  {
    char v16 = v11;
    uint64_t v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      int64_t v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_1894B7EE0(a1, v19);
      }

      goto LABEL_11;
    }

    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1894B78CC();
      goto LABEL_7;
    }

    sub_1894B7264(v15, a4 & 1);
    unint64_t v21 = sub_1894B7030(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if ((v16 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_11:
      sub_1894B7864(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }

  uint64_t result = (_OWORD *)sub_1894B8FA0();
  __break(1u);
  return result;
}

_OWORD *sub_1894B7864(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_1894B7EE0(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1LL);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

void *sub_1894B78CC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6B8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1894B8F58();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
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
      goto LABEL_30;
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

uint64_t sub_1894B7AB0()
{
  if (qword_18C79C520 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1894B8DF0();
  __swift_project_value_buffer(v0, (uint64_t)qword_18C79C5B8);
  uint64_t v1 = (os_log_s *)sub_1894B8DD8();
  os_log_type_t v2 = sub_1894B8E98();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_1894AF000, v1, v2, "Using DataProtection keychain", v3, 2u);
    MEMORY[0x1895E8258](v3, -1LL, -1LL);
  }

  uint64_t v4 = sub_1894B8E20();
  uint64_t v8 = MEMORY[0x1896184C8];
  v7[0] = 1;
  return sub_1894B64CC((uint64_t)v7, v4, v5);
}

id sub_1894B7BC8@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16libnarrativecert13NarrativeRefs_certRef, a2);
}

void sub_1894B7BD4(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_1894B7BF0@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC16libnarrativecert13NarrativeRefs_keyRef, a2);
}

id keypath_getTm@<X0>(void *a1@<X0>, void *a2@<X3>, void **a3@<X8>)
{
  uint64_t v4 = (void **)(*a1 + *a2);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *a3 = *v4;
  return v5;
}

void sub_1894B7C48(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
}

id sub_1894B7C64@<X0>(void *a1@<X0>, void **a2@<X8>)
{
  uint64_t v3 = (void **)(*a1 + OBJC_IVAR____TtC16libnarrativecert13NarrativeCert_testKeychain);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for NarrativeRefs()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NarrativeRefs.certRef.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x60LL))();
}

uint64_t dispatch thunk of NarrativeRefs.certRef.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x68LL))();
}

uint64_t dispatch thunk of NarrativeRefs.certRef.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x70LL))();
}

uint64_t dispatch thunk of NarrativeRefs.keyRef.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x78LL))();
}

uint64_t dispatch thunk of NarrativeRefs.keyRef.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x80LL))();
}

uint64_t dispatch thunk of NarrativeRefs.keyRef.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0x88LL))();
}

uint64_t method lookup function for NarrativeCert()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NarrativeCert.testKeychain.getter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xB8LL))();
}

uint64_t dispatch thunk of NarrativeCert.testKeychain.setter()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xC0LL))();
}

uint64_t dispatch thunk of NarrativeCert.testKeychain.modify()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xC8LL))();
}

uint64_t dispatch thunk of NarrativeCert.__allocating_init(domain:identityType:)()
{
  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of NarrativeCert.getFullCertChain()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xD8LL))();
}

uint64_t dispatch thunk of NarrativeCert.getCredential()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xE0LL))();
}

uint64_t dispatch thunk of NarrativeCert.fetchSecRefsFromKeychain()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xE8LL))();
}

uint64_t dispatch thunk of NarrativeCert.getCertChain()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x18961B398] & *v0) + 0xF0LL))();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1894B7E64(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1894B7EA0(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

_OWORD *sub_1894B7EE0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1894B7EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80LL) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }

  return a2;
}

uint64_t sub_1894B7F80()
{
  uint64_t v0 = sub_1894B8DF0();
  __swift_allocate_value_buffer(v0, qword_18C79C6D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_18C79C6D0);
  return sub_1894B8DE4();
}

void sub_1894B8008()
{
}

uint64_t sub_1894B8014(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1894B8040()
{
}

void sub_1894B804C(const char *a1)
{
  if (qword_18C79C528 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1894B8DF0();
  __swift_project_value_buffer(v2, (uint64_t)qword_18C79C6D0);
  oslog = (os_log_s *)sub_1894B8DD8();
  os_log_type_t v3 = sub_1894B8EB0();
  if (os_log_type_enabled(oslog, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v7 = v5;
    *(_DWORD *)uint64_t v4 = 136315138;
    sub_1894B6858(0xD000000000000018LL, 0x80000001894B9A00LL, &v7);
    sub_1894B8EE0();
    _os_log_impl(&dword_1894AF000, oslog, v3, a1, v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1895E8258](v5, -1LL, -1LL);
    MEMORY[0x1895E8258](v4, -1LL, -1LL);
  }

  else
  {
  }

void __swiftcall NarrativeXPCClient.init()(libnarrativecert::NarrativeXPCClient *__return_ptr retstr)
{
  id v2 = objc_allocWithZone(MEMORY[0x189607B30]);
  os_log_type_t v3 = (void *)sub_1894B8E14();
  uint64_t v4 = (objc_class *)objc_msgSend(v2, sel_initWithMachServiceName_options_, v3, 0);

  id v5 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_18C79D880);
  -[objc_class setRemoteObjectInterface:](v4, sel_setRemoteObjectInterface_, v5);

  int64_t v13 = sub_1894B8008;
  uint64_t v14 = 0LL;
  uint64_t v6 = MEMORY[0x1895F87A8];
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 1107296256LL;
  uint64_t v11 = sub_1894B8014;
  unint64_t v12 = &block_descriptor;
  uint64_t v7 = _Block_copy(&v9);
  -[objc_class setInterruptionHandler:](v4, sel_setInterruptionHandler_, v7);
  _Block_release(v7);
  int64_t v13 = sub_1894B8040;
  uint64_t v14 = 0LL;
  uint64_t v9 = v6;
  uint64_t v10 = 1107296256LL;
  uint64_t v11 = sub_1894B8014;
  unint64_t v12 = &block_descriptor_3;
  uint64_t v8 = _Block_copy(&v9);
  -[objc_class setInvalidationHandler:](v4, sel_setInvalidationHandler_, v8);
  _Block_release(v8);
  -[objc_class resume](v4, sel_resume);
  retstr->connection.super.isa = v4;
}

uint64_t NarrativeXPCClient.ConfigureIdentity(narrativeDomain:narrativeIdentityType:)(uint64_t a1, uint64_t a2)
{
  id v5 = *v2;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = 0LL;
  unint64_t v23 = sub_1894B8820;
  uint64_t v24 = 0LL;
  uint64_t v7 = MEMORY[0x1895F87A8];
  uint64_t v19 = MEMORY[0x1895F87A8];
  uint64_t v20 = 1107296256LL;
  unint64_t v21 = sub_1894B89E0;
  int64_t v22 = &block_descriptor_6;
  uint64_t v8 = _Block_copy(&v19);
  id v9 = objc_msgSend(v5, sel_synchronousRemoteObjectProxyWithErrorHandler_, v8);
  _Block_release(v8);
  sub_1894B8EF8();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6E8);
  if (!swift_dynamicCast())
  {
    sub_1894B8B14();
    swift_allocError();
    *(void *)uint64_t v13 = 0xD00000000000004BLL;
    *(void *)(v13 + 8) = 0x80000001894BBD20LL;
    *(_BYTE *)(v13 + 16) = 0;
    swift_willThrow();
    return swift_release();
  }

  uint64_t v10 = v25;
  if (a1 == 2)
  {
    if (a2 == 2)
    {
      unint64_t v23 = sub_1894B8B58;
      uint64_t v24 = v6;
      uint64_t v19 = v7;
      uint64_t v20 = 1107296256LL;
      unint64_t v21 = sub_1894B8A30;
      int64_t v22 = &block_descriptor_9;
      uint64_t v11 = _Block_copy(&v19);
      swift_retain();
      swift_release();
      unint64_t v12 = &selRef_configureAcdcActorIdentityWithReply_;
      goto LABEL_21;
    }

    sub_1894B8B14();
    swift_allocError();
    unint64_t v16 = 0xD00000000000001ELL;
    uint64_t v17 = "Unsupported acdc identity type";
LABEL_17:
    *(void *)uint64_t v15 = v16;
    *(void *)(v15 + 8) = (unint64_t)(v17 - 32) | 0x8000000000000000LL;
    *(_BYTE *)(v15 + 16) = 1;
    goto LABEL_23;
  }

  if (a1 == 1)
  {
    if (a2 == 1)
    {
      unint64_t v23 = sub_1894B8B58;
      uint64_t v24 = v6;
      uint64_t v19 = v7;
      uint64_t v20 = 1107296256LL;
      unint64_t v21 = sub_1894B8A30;
      int64_t v22 = &block_descriptor_12;
      uint64_t v11 = _Block_copy(&v19);
      swift_retain();
      swift_release();
      unint64_t v12 = &selRef_configureAdbHostIdentityWithReply_;
      goto LABEL_21;
    }

    if (!a2)
    {
      unint64_t v23 = sub_1894B8B58;
      uint64_t v24 = v6;
      uint64_t v19 = v7;
      uint64_t v20 = 1107296256LL;
      unint64_t v21 = sub_1894B8A30;
      int64_t v22 = &block_descriptor_15;
      uint64_t v11 = _Block_copy(&v19);
      swift_retain();
      swift_release();
      unint64_t v12 = &selRef_configureAdbPlatformIdentityWithReply_;
LABEL_21:
      objc_msgSend(v10, *v12, v11);
      _Block_release(v11);
      swift_beginAccess();
      uint64_t v18 = *(void **)(v6 + 16);
      if (!v18)
      {
LABEL_24:
        swift_release();
        return swift_unknownObjectRelease();
      }

      v18;
LABEL_23:
      swift_willThrow();
      goto LABEL_24;
    }

    sub_1894B8B14();
    swift_allocError();
    unint64_t v16 = 0xD00000000000001DLL;
    uint64_t v17 = "Unsupported adb identity type";
    goto LABEL_17;
  }

  if (a1)
  {
    uint64_t v19 = a1;
  }

  else
  {
    switch(a2)
    {
      case 2LL:
        unint64_t v23 = sub_1894B8B58;
        uint64_t v24 = v6;
        uint64_t v19 = v7;
        uint64_t v20 = 1107296256LL;
        unint64_t v21 = sub_1894B8A30;
        int64_t v22 = &block_descriptor_18;
        uint64_t v11 = _Block_copy(&v19);
        swift_retain();
        swift_release();
        unint64_t v12 = &selRef_configureExampleActorIdentityWithReply_;
        goto LABEL_21;
      case 1LL:
        unint64_t v23 = sub_1894B8B58;
        uint64_t v24 = v6;
        uint64_t v19 = v7;
        uint64_t v20 = 1107296256LL;
        unint64_t v21 = sub_1894B8A30;
        int64_t v22 = &block_descriptor_21;
        uint64_t v11 = _Block_copy(&v19);
        swift_retain();
        swift_release();
        unint64_t v12 = &selRef_configureExampleHostIdentityWithReply_;
        goto LABEL_21;
      case 0LL:
        unint64_t v23 = sub_1894B8B58;
        uint64_t v24 = v6;
        uint64_t v19 = v7;
        uint64_t v20 = 1107296256LL;
        unint64_t v21 = sub_1894B8A30;
        int64_t v22 = &block_descriptor_24;
        uint64_t v11 = _Block_copy(&v19);
        swift_retain();
        swift_release();
        unint64_t v12 = &selRef_configureExamplePlatformIdentityWithReply_;
        goto LABEL_21;
    }

    uint64_t v19 = a2;
  }

  uint64_t result = sub_1894B8F94();
  __break(1u);
  return result;
}

void sub_1894B8820(void *a1)
{
  if (qword_18C79C528 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1894B8DF0();
  __swift_project_value_buffer(v2, (uint64_t)qword_18C79C6D0);
  id v3 = a1;
  id v4 = a1;
  oslog = (os_log_s *)sub_1894B8DD8();
  os_log_type_t v5 = sub_1894B8EB0();
  if (os_log_type_enabled(oslog, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = a1;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    sub_1894B8EE0();
    *uint64_t v7 = v10;

    _os_log_impl(&dword_1894AF000, oslog, v5, "error creating xpc proxy %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C79C6F8);
    swift_arrayDestroy();
    MEMORY[0x1895E8258](v7, -1LL, -1LL);
    MEMORY[0x1895E8258](v6, -1LL, -1LL);
  }

  else
  {
  }
}

void sub_1894B89E0(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_1894B8A30(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_1894B8A84(void *a1, uint64_t a2)
{
  id v4 = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = a1;
  id v5 = a1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1894B8AF0()
{
  return swift_deallocObject();
}

unint64_t sub_1894B8B14()
{
  unint64_t result = qword_18C79C6F0;
  if (!qword_18C79C6F0)
  {
    unint64_t result = MEMORY[0x1895E81F8]( &protocol conformance descriptor for NarrativeCertXPCClientError,  &type metadata for NarrativeCertXPCClientError);
    atomic_store(result, (unint64_t *)&qword_18C79C6F0);
  }

  return result;
}

void sub_1894B8B58(void *a1)
{
}

uint64_t sub_1894B8B74(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for NarrativeCertXPCClientError(uint64_t a1)
{
  return sub_1894B8B9C(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1894B8B9C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 2u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s16libnarrativecert27NarrativeCertXPCClientErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_1894B8B74(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for NarrativeCertXPCClientError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  sub_1894B8B74(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1894B8B9C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for NarrativeCertXPCClientError(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1894B8B9C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for NarrativeCertXPCClientError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NarrativeCertXPCClientError( uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1894B8D34(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1894B8D40(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for NarrativeCertXPCClientError()
{
  return &type metadata for NarrativeCertXPCClientError;
}

ValueMetadata *type metadata accessor for NarrativeXPCClient()
{
  return &type metadata for NarrativeXPCClient;
}

uint64_t sub_1894B8DA8()
{
  return MEMORY[0x189606B98]();
}

uint64_t sub_1894B8DB4()
{
  return MEMORY[0x189606C58]();
}

uint64_t sub_1894B8DC0()
{
  return MEMORY[0x189606C68]();
}

uint64_t sub_1894B8DCC()
{
  return MEMORY[0x189606CA0]();
}

uint64_t sub_1894B8DD8()
{
  return MEMORY[0x18961D1D8]();
}

uint64_t sub_1894B8DE4()
{
  return MEMORY[0x18961D1E0]();
}

uint64_t sub_1894B8DF0()
{
  return MEMORY[0x18961D1F0]();
}

uint64_t sub_1894B8DFC()
{
  return MEMORY[0x189607050]();
}

uint64_t sub_1894B8E08()
{
  return MEMORY[0x189617B30]();
}

uint64_t sub_1894B8E14()
{
  return MEMORY[0x1896070D8]();
}

uint64_t sub_1894B8E20()
{
  return MEMORY[0x189607100]();
}

uint64_t sub_1894B8E2C()
{
  return MEMORY[0x189617C90]();
}

uint64_t sub_1894B8E38()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_1894B8E44()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_1894B8E50()
{
  return MEMORY[0x189617EB0]();
}

uint64_t sub_1894B8E5C()
{
  return MEMORY[0x189618308]();
}

uint64_t sub_1894B8E68()
{
  return MEMORY[0x1896071D0]();
}

uint64_t sub_1894B8E74()
{
  return MEMORY[0x189618320]();
}

uint64_t sub_1894B8E80()
{
  return MEMORY[0x189618358]();
}

uint64_t sub_1894B8E8C()
{
  return MEMORY[0x1896183C8]();
}

uint64_t sub_1894B8E98()
{
  return MEMORY[0x18961D210]();
}

uint64_t sub_1894B8EA4()
{
  return MEMORY[0x18961D220]();
}

uint64_t sub_1894B8EB0()
{
  return MEMORY[0x18961D228]();
}

uint64_t sub_1894B8EBC()
{
  return MEMORY[0x18961D248]();
}

uint64_t sub_1894B8EC8()
{
  return MEMORY[0x18961BAF0]();
}

uint64_t sub_1894B8ED4()
{
  return MEMORY[0x18961BAF8]();
}

uint64_t sub_1894B8EE0()
{
  return MEMORY[0x189618D30]();
}

uint64_t sub_1894B8EEC()
{
  return MEMORY[0x189618D50]();
}

uint64_t sub_1894B8EF8()
{
  return MEMORY[0x189618EE0]();
}

uint64_t sub_1894B8F04()
{
  return MEMORY[0x189619020]();
}

uint64_t sub_1894B8F10()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_1894B8F1C()
{
  return MEMORY[0x1896191F0]();
}

uint64_t sub_1894B8F28()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_1894B8F34()
{
  return MEMORY[0x189619440]();
}

uint64_t sub_1894B8F40()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_1894B8F4C()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_1894B8F58()
{
  return MEMORY[0x189619948]();
}

uint64_t sub_1894B8F64()
{
  return MEMORY[0x189619950]();
}

uint64_t sub_1894B8F70()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_1894B8F7C()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_1894B8F88()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_1894B8F94()
{
  return MEMORY[0x18961A2F0]();
}

uint64_t sub_1894B8FA0()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t sub_1894B8FAC()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_1894B8FB8()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_1894B8FC4()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_1894B8FD0()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_1894B8FDC()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_1894B8FE8()
{
  return MEMORY[0x18961A6C0]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x18960B260](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x18960B2E8](allocator, data);
}

uint64_t SecCertificateGetAuthorityKeyID()
{
  return MEMORY[0x18960B2F0]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x18960B370](*(void *)&status, reserved);
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x18960B3E8]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x18960B400](query, result);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x18960B450](key);
}

uint64_t SecKeyCopyPublicKeyHash()
{
  return MEMORY[0x18960B460]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x18961B048]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x18961B058]();
}

void bzero(void *a1, size_t a2)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1896165B8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x18961B110]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x18961B1D0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x18961B1F0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x18961B318]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x18961B3A0]();
}

uint64_t swift_once()
{
  return MEMORY[0x18961B3B8]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}