BOOL static HIDElementCollection.CollectionType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HIDElementCollection.CollectionType.hash(into:)()
{
  return sub_18919AE44();
}

uint64_t HIDElementCollection.CollectionType.hashValue.getter()
{
  return sub_18919AE74();
}

BOOL sub_189158E50(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _s7CoreHID13HIDReportTypeO9hashValueSivg_0()
{
  return sub_18919AE74();
}

uint64_t sub_189158EA8()
{
  return sub_18919AE44();
}

uint64_t sub_189158ED0()
{
  return sub_18919AE74();
}

uint64_t sub_189158F10@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  else {
    char v2 = result;
  }
  *a2 = v2;
  return result;
}

uint64_t sub_189158F20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_unownedRetainStrong();
  *a1 = result;
  return result;
}

uint64_t sub_189158F48(uint64_t *a1, void *a2)
{
  uint64_t v3 = *a1;
  swift_unownedRetain();
  uint64_t result = swift_unownedRelease();
  *a2 = v3;
  return result;
}

uint64_t HIDElementCollection.client.getter()
{
  return swift_unownedRetainStrong();
}

uint64_t HIDElementCollection.client.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  void *v1 = a1;
  return result;
}

uint64_t (*HIDElementCollection.client.modify(uint64_t *a1))()
{
  a1[1] = v1;
  *a1 = swift_unownedRetainStrong();
  return sub_189159008;
}

void HIDElementCollection.parentCollection.getter(void *a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  v4 = IOHIDElementGetParent(*(IOHIDElementRef *)(v1 + 16));
  if (v4)
  {
    v5 = v4;
    swift_unownedRetainStrong();
    sub_189159078(v5, v3, a1);
  }

  else
  {
    *a1 = 0LL;
    a1[1] = 0LL;
    a1[2] = 0LL;
  }
}

void sub_189159078(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (IOHIDElementGetType((IOHIDElementRef)a1) == kIOHIDElementTypeCollection)
  {
    v16 = a1;
    type metadata accessor for IOHIDElement();
    uint64_t v7 = v6;
    id v8 = a1;
    sub_189185FFC((uint64_t)&v16, v7, (uint64_t)&v17);
    v9 = (__IOHIDElement *)v17;
    swift_unownedRetain();
    IOHIDElementCollectionType CollectionType = IOHIDElementGetCollectionType(v9);
    if (CollectionType >= (kIOHIDElementCollectionTypeUsageModifier|kIOHIDElementCollectionTypeApplication)) {
      uint64_t v11 = 1LL;
    }
    else {
      uint64_t v11 = CollectionType;
    }
    uint64_t UsagePage = IOHIDElementGetUsagePage(v9);
    if (WORD1(UsagePage))
    {
      __break(1u);
    }

    else
    {
      uint64_t v13 = UsagePage;
      uint32_t Usage = IOHIDElementGetUsage(v9);

      if (!HIWORD(Usage))
      {
        HIDUsage.init(page:usage:)(Usage, v13, (uint64_t)&v17);
        swift_release();

        unint64_t v15 = ((unint64_t)v17 << 16) | ((unint64_t)BYTE4(v17) << 48) | v11;
        *a3 = a2;
        a3[1] = v15;
        a3[2] = v9;
        return;
      }
    }

    __break(1u);
  }

  else
  {
    swift_release();

    *a3 = 0LL;
    a3[1] = 0LL;
    a3[2] = 0LL;
  }

void HIDElementCollection.childCollections.getter()
{
  uint64_t v1 = *v0;
  char v2 = IOHIDElementGetChildren((IOHIDElementRef)v0[2]);
  if (v2)
  {
    uint64_t v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    if ((Count & 0x8000000000000000LL) == 0)
    {
      CFIndex v5 = Count;
      if (!Count)
      {

        return;
      }

      CFIndex v6 = 0LL;
      uint64_t v7 = (char *)MEMORY[0x18961AFE8];
      CFIndex v25 = Count;
      v26 = v3;
      while (v5 != v6)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v3, v6);
        if (!ValueAtIndex) {
          goto LABEL_27;
        }
        id v9 = ValueAtIndex;
        swift_unownedRetainStrong();
        v10 = (__IOHIDElement *)v9;
        if (IOHIDElementGetType(v10) == kIOHIDElementTypeCollection)
        {
          v27 = v10;
          type metadata accessor for IOHIDElement();
          uint64_t v12 = v11;
          uint64_t v13 = v10;
          sub_189185FFC((uint64_t)&v27, v12, (uint64_t)&v28);
          v14 = (__IOHIDElement *)v28;
          swift_unownedRetain();
          IOHIDElementCollectionType CollectionType = IOHIDElementGetCollectionType(v14);
          if (CollectionType >= (kIOHIDElementCollectionTypeUsageModifier|kIOHIDElementCollectionTypeApplication)) {
            char v16 = 1;
          }
          else {
            char v16 = CollectionType;
          }
          uint64_t UsagePage = IOHIDElementGetUsagePage(v14);
          if (WORD1(UsagePage)) {
            goto LABEL_24;
          }
          uint64_t v18 = UsagePage;
          uint32_t Usage = IOHIDElementGetUsage(v14);

          if (HIWORD(Usage)) {
            goto LABEL_25;
          }
          HIDUsage.init(page:usage:)(Usage, v18, (uint64_t)&v28);
          swift_release();

          uint64_t v20 = BYTE4(v28);
          uint64_t v21 = v28;
          swift_unownedRetain();
          v10 = v14;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            uint64_t v7 = sub_18915DF40(0LL, *((void *)v7 + 2) + 1LL, 1, v7);
          }
          unint64_t v23 = *((void *)v7 + 2);
          unint64_t v22 = *((void *)v7 + 3);
          if (v23 >= v22 >> 1) {
            uint64_t v7 = sub_18915DF40((char *)(v22 > 1), v23 + 1, 1, v7);
          }
          *((void *)v7 + 2) = v23 + 1;
          v24 = &v7[24 * v23];
          *((void *)v24 + 4) = v1;
          v24[40] = v16;
          v24[46] = (v21 | (unint64_t)(v20 << 32)) >> 32;
          *(_DWORD *)(v24 + 42) = v21;
          *((void *)v24 + 6) = v10;

          swift_unownedRelease();
          CFIndex v5 = v25;
          uint64_t v3 = v26;
        }

        else
        {
          swift_release();
        }

        ++v6;

        if (v5 == v6)
        {

          return;
        }
      }

      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }

    __break(1u);
LABEL_27:
    __break(1u);
  }

CFIndex HIDElementCollection.childElements.getter()
{
  uint64_t v1 = *(void *)v0;
  char v2 = IOHIDElementGetChildren(*(IOHIDElementRef *)(v0 + 16));
  if (v2)
  {
    uint64_t v3 = v2;
    CFIndex result = CFArrayGetCount(v2);
    if (result < 0)
    {
      __break(1u);
LABEL_23:
      __break(1u);
      return result;
    }

    CFIndex v5 = result;
    if (result)
    {
      CFIndex result = (CFIndex)CFArrayGetValueAtIndex(v3, 0LL);
      if (result)
      {
        CFIndex v6 = (char *)MEMORY[0x18961AFE8];
        CFIndex v7 = 1LL;
        while (1)
        {
          id v8 = (id)result;
          swift_unownedRetainStrong();
          id v9 = v8;
          sub_1891595D0(v9, v1, (uint64_t)v19);
          sub_18916060C((uint64_t)v19, (uint64_t)v20, &qword_18C77A320);
          sub_18916060C((uint64_t)v20, (uint64_t)v21, &qword_18C77A320);
          if (sub_18915E098((uint64_t)v21) == 1)
          {

            if (v5 == v7) {
              goto LABEL_18;
            }
          }

          else
          {
            if ((v22[8] & 1) == 0)
            {
              sub_18916060C((uint64_t)v20, (uint64_t)v19, &qword_18C77A320);
              sub_18915E0B0((uint64_t)v19);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                CFIndex v6 = sub_18915E0E0(0LL, *((void *)v6 + 2) + 1LL, 1, v6);
              }
              unint64_t v11 = *((void *)v6 + 2);
              unint64_t v10 = *((void *)v6 + 3);
              if (v11 >= v10 >> 1) {
                CFIndex v6 = sub_18915E0E0((char *)(v10 > 1), v11 + 1, 1, v6);
              }
              *((void *)v6 + 2) = v11 + 1;
              uint64_t v12 = &v6[128 * v11];
              __int128 v13 = v21[0];
              __int128 v14 = v21[1];
              __int128 v15 = v21[3];
              *((_OWORD *)v12 + 4) = v21[2];
              *((_OWORD *)v12 + 5) = v15;
              *((_OWORD *)v12 + 2) = v13;
              *((_OWORD *)v12 + 3) = v14;
              __int128 v16 = v21[4];
              __int128 v17 = v21[5];
              __int128 v18 = *(_OWORD *)v22;
              *(_OWORD *)(v12 + 137) = *(_OWORD *)&v22[9];
              *((_OWORD *)v12 + 7) = v17;
              *((_OWORD *)v12 + 8) = v18;
              *((_OWORD *)v12 + 6) = v16;
            }

            sub_18915E1E0((uint64_t)v20);
            if (v5 == v7)
            {
LABEL_18:

              return (CFIndex)v6;
            }
          }

          CFIndex result = (CFIndex)CFArrayGetValueAtIndex(v3, v7++);
          if (!result) {
            goto LABEL_23;
          }
        }
      }

      goto LABEL_23;
    }
  }

  return MEMORY[0x18961AFE8];
}

uint64_t sub_1891595D0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v56 = a1;
  type metadata accessor for IOHIDElement();
  uint64_t v7 = v6;
  id v8 = a1;
  sub_189185FFC((uint64_t)&v56, v7, (uint64_t)&v36);
  id v9 = (__IOHIDElement *)v36;
  swift_unownedRetain();
  uint64_t result = IOHIDElementGetReportID(v9);
  if (result > 0xFF)
  {
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }

  HIDReportID.init(rawValue:)(result, &v36);
  char v11 = v36;
  char v12 = BYTE1(v36);
  IOHIDElementType Type = IOHIDElementGetType(v9);
  if (Type == kIOHIDElementTypeCollection)
  {
    swift_release();

    swift_unownedRelease();
    sub_18915E278(&v36);
    uint64_t v14 = a3;
    return sub_18916060C((uint64_t)&v36, v14, &qword_18C77A320);
  }

  IOHIDElementType v15 = Type;
  char v16 = 2 * (Type == kIOHIDElementTypeFeature);
  if (Type == kIOHIDElementTypeOutput) {
    char v16 = 1;
  }
  if (Type - 1 >= 5) {
    char v17 = v16;
  }
  else {
    char v17 = 0;
  }
  uint64_t UsagePage = IOHIDElementGetUsagePage(v9);
  uint64_t result = IOHIDElementGetUsage(v9);
  if (WORD1(UsagePage)) {
    goto LABEL_27;
  }
  int v19 = result;
  char v34 = v17;
  char v35 = v12;
  if (WORD1(result)) {
    int v20 = 0;
  }
  else {
    int v20 = (unsigned __int16)result;
  }
  HIDUsage.init(page:usage:)(v20, UsagePage, (uint64_t)&v36);
  uint64_t v21 = BYTE4(v36);
  uint64_t v22 = v36;
  LODWORD(UsagePage) = IOHIDElementGetReportSize(v9);
  if (IOHIDElementIsArray(v9))
  {
    uint64_t result = IOHIDElementGetReportCount(v9);
    uint64_t UsagePage = UsagePage * (unint64_t)result;
    if ((UsagePage & 0xFFFFFFFF00000000LL) != 0) {
      goto LABEL_29;
    }
  }

  IOHIDElementGetUnit(v9);
  uint64_t result = IOHIDElementGetUnitExponent(v9);
  if (result <= 0x7F)
  {
    char v31 = v11;
    uint64_t v23 = v22 | (v21 << 32);
    BOOL v33 = (v19 & 0xFFFF0000) != 0;
    BOOL v32 = v15 == kIOHIDElementTypeInput_NULL;
    CFIndex LogicalMin = IOHIDElementGetLogicalMin(v9);
    CFIndex LogicalMax = IOHIDElementGetLogicalMax(v9);
    CFIndex PhysicalMin = IOHIDElementGetPhysicalMin(v9);
    CFIndex PhysicalMax = IOHIDElementGetPhysicalMax(v9);
    swift_release();

    CFIndex v28 = PhysicalMin | PhysicalMax;
    LOBYTE(v56) = v35;
    if (PhysicalMax) {
      CFIndex v29 = 0LL;
    }
    else {
      CFIndex v29 = LogicalMin;
    }
    if (v28) {
      CFIndex v30 = PhysicalMax;
    }
    else {
      CFIndex v30 = LogicalMax;
    }
    if (PhysicalMin) {
      CFIndex v29 = PhysicalMin;
    }
    *(void *)&__int128 v36 = a2;
    BYTE8(v36) = v34;
    BYTE14(v36) = BYTE4(v23);
    *(_DWORD *)((char *)&v36 + 10) = v23;
    HIBYTE(v36) = v31;
    char v37 = v35;
    int v38 = UsagePage;
    int v39 = 0;
    char v40 = 1;
    char v41 = 0;
    char v42 = 1;
    CFIndex v43 = LogicalMin;
    BOOL v44 = (LogicalMin | LogicalMax) == 0;
    CFIndex v45 = LogicalMax;
    BOOL v46 = v44;
    CFIndex v47 = v29;
    BOOL v48 = (v28 | LogicalMin | LogicalMax) == 0;
    CFIndex v49 = v30;
    BOOL v50 = v48;
    v51 = v9;
    BOOL v52 = v32;
    BOOL v53 = v33;
    uint64_t v54 = 0LL;
    char v55 = 1;
    nullsub_1(&v36);
    uint64_t v14 = a3;
    return sub_18916060C((uint64_t)&v36, v14, &qword_18C77A320);
  }

LABEL_28:
  __break(1u);
LABEL_29:
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
  return result;
}

  __break(1u);
  return result;
}

void HIDElementCollection.type.getter(_BYTE *a1@<X8>)
{
  *a1 = *(_BYTE *)(v1 + 8);
}

_BYTE *HIDElementCollection.type.setter(_BYTE *result)
{
  *(_BYTE *)(v1 + 8) = *result;
  return result;
}

uint64_t (*HIDElementCollection.type.modify())()
{
  return nullsub_1;
}

void HIDElementCollection.usage.getter(uint64_t a1@<X8>)
{
  int v2 = *(_DWORD *)(v1 + 10);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(v1 + 14);
  *(_DWORD *)a1 = v2;
}

int *HIDElementCollection.usage.setter(int *result)
{
  int v2 = *result;
  *(_BYTE *)(v1 + 14) = *((_BYTE *)result + 4);
  *(_DWORD *)(v1 + 10) = v2;
  return result;
}

uint64_t (*HIDElementCollection.usage.modify())()
{
  return nullsub_1;
}

id sub_189159948()
{
  return *(id *)(v0 + 16);
}

void HIDElementCollection.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();
}

uint64_t HIDElementCollection.hashValue.getter()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_18919AE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();

  return sub_18919AE74();
}

uint64_t sub_189159B10()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_18919AE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();

  return sub_18919AE74();
}

void sub_189159BF0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();
}

uint64_t sub_189159CC8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_18919AE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();

  return sub_18919AE74();
}

uint64_t HIDElementCollection.description.getter()
{
  return 0LL;
}

uint64_t HIDElement.Value.element.getter@<X0>(_OWORD *a1@<X8>)
{
  __int128 v3 = v1[5];
  __int128 v13 = v1[4];
  __int128 v2 = v13;
  __int128 v14 = v3;
  v15[0] = v1[6];
  __int128 v4 = v15[0];
  *(_OWORD *)((char *)v15 + 9) = *(_OWORD *)((char *)v1 + 105);
  __int128 v5 = *(_OWORD *)((char *)v15 + 9);
  __int128 v6 = v1[1];
  v10[0] = *v1;
  v10[1] = v6;
  __int128 v8 = v1[3];
  __int128 v11 = v1[2];
  __int128 v7 = v11;
  __int128 v12 = v8;
  *a1 = v10[0];
  a1[1] = v6;
  a1[2] = v7;
  a1[3] = v8;
  a1[4] = v2;
  a1[5] = v3;
  a1[6] = v4;
  *(_OWORD *)((char *)a1 + 105) = v5;
  return sub_18915E0B0((uint64_t)v10);
}

__n128 HIDElement.Value.element.setter(uint64_t a1)
{
  __int128 v3 = v1[5];
  v10[4] = v1[4];
  v10[5] = v3;
  v11[0] = v1[6];
  *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)((char *)v1 + 105);
  __int128 v4 = v1[1];
  v10[0] = *v1;
  v10[1] = v4;
  __int128 v5 = v1[3];
  _OWORD v10[2] = v1[2];
  v10[3] = v5;
  sub_18915EBC8((uint64_t)v10);
  __int128 v6 = *(_OWORD *)(a1 + 80);
  v1[4] = *(_OWORD *)(a1 + 64);
  v1[5] = v6;
  v1[6] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)((char *)v1 + 105) = *(_OWORD *)(a1 + 105);
  __int128 v7 = *(_OWORD *)(a1 + 16);
  _OWORD *v1 = *(_OWORD *)a1;
  v1[1] = v7;
  __n128 result = *(__n128 *)(a1 + 32);
  __int128 v9 = *(_OWORD *)(a1 + 48);
  v1[2] = result;
  v1[3] = v9;
  return result;
}

uint64_t (*HIDElement.Value.element.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.Value.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for HIDElement.Value() + 20);
  uint64_t v4 = sub_18919ACC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t HIDElement.Value.timestamp.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for HIDElement.Value() + 20);
  uint64_t v4 = sub_18919ACC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(v3, a1, v4);
}

uint64_t (*HIDElement.Value.timestamp.modify())(void)
{
  return nullsub_1;
}

uint64_t HIDElement.Value.bytes.getter()
{
  uint64_t v1 = v0 + *(int *)(type metadata accessor for HIDElement.Value() + 24);
  uint64_t v2 = *(void *)v1;
  sub_18915EC34(*(void *)v1, *(void *)(v1 + 8));
  return v2;
}

uint64_t HIDElement.Value.bytes.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + *(int *)(type metadata accessor for HIDElement.Value() + 24);
  uint64_t result = sub_18915EC78(*(void *)v5, *(void *)(v5 + 8));
  *(void *)uint64_t v5 = a1;
  *(void *)(v5 + 8) = a2;
  return result;
}

uint64_t (*HIDElement.Value.bytes.modify())(void)
{
  return nullsub_1;
}

uint64_t HIDElement.Value.init(element:fromBytes:timestamp:)@<X0>( _OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  __int128 v9 = a1[5];
  a5[4] = a1[4];
  a5[5] = v9;
  a5[6] = a1[6];
  *(_OWORD *)((char *)a5 + 105) = *(_OWORD *)((char *)a1 + 105);
  __int128 v10 = a1[1];
  *a5 = *a1;
  a5[1] = v10;
  __int128 v11 = a1[3];
  a5[2] = a1[2];
  a5[3] = v11;
  uint64_t v12 = type metadata accessor for HIDElement.Value();
  __int128 v13 = (void *)((char *)a5 + *(int *)(v12 + 24));
  *__int128 v13 = a2;
  v13[1] = a3;
  __int128 v14 = (char *)a5 + *(int *)(v12 + 20);
  uint64_t v15 = sub_18919ACC4();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 32LL))(v14, a4, v15);
}

uint64_t HIDElement.client.getter()
{
  return swift_unownedRetainStrong();
}

uint64_t HIDElement.client.setter(uint64_t a1)
{
  uint64_t result = swift_release();
  void *v1 = a1;
  return result;
}

uint64_t (*HIDElement.client.modify(uint64_t *a1))()
{
  a1[1] = v1;
  *a1 = swift_unownedRetainStrong();
  return sub_189159008;
}

uint64_t sub_18915A28C(uint64_t *a1, char a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (void *)a1[1];
  swift_unownedRetain();
  swift_unownedRelease();
  if ((a2 & 1) != 0)
  {
    void *v4 = v3;
    return swift_release();
  }

  else
  {
    uint64_t result = swift_release();
    void *v4 = v3;
  }

  return result;
}

void HIDElement.parentCollection.getter(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = IOHIDElementGetParent(*(IOHIDElementRef *)(v1 + 96));
  if (v4)
  {
    uint64_t v5 = v4;
    swift_unownedRetainStrong();
    sub_189159078(v5, v3, &v9);
    uint64_t v6 = v11;
    if (v11)
    {
      unint64_t v7 = v10;
      unint64_t v8 = v10 >> 16;
      *(void *)a1 = v9;
      *(_BYTE *)(a1 + 8) = v7;
      *(_BYTE *)(a1 + 14) = BYTE6(v7);
      *(_DWORD *)(a1 + 10) = v8;
      *(void *)(a1 + 16) = v6;
      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

void HIDElement.type.getter(_BYTE *a1@<X8>)
{
  *a1 = *(_BYTE *)(v1 + 8);
}

_BYTE *HIDElement.type.setter(_BYTE *result)
{
  *(_BYTE *)(v1 + 8) = *result;
  return result;
}

uint64_t (*HIDElement.type.modify())()
{
  return nullsub_1;
}

uint64_t sub_18915A3A8@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = (_DWORD)result == 129;
  if ((_DWORD)result == 257) {
    char v2 = 2;
  }
  *a2 = v2;
  return result;
}

void HIDElement.usage.getter(uint64_t a1@<X8>)
{
  int v2 = *(_DWORD *)(v1 + 10);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(v1 + 14);
  *(_DWORD *)a1 = v2;
}

int *HIDElement.usage.setter(int *result)
{
  int v2 = *result;
  *(_BYTE *)(v1 + 14) = *((_BYTE *)result + 4);
  *(_DWORD *)(v1 + 10) = v2;
  return result;
}

uint64_t (*HIDElement.usage.modify())()
{
  return nullsub_1;
}

void sub_18915A3FC(_WORD *a1@<X8>)
{
  *a1 = 256;
}

void HIDElement.reportID.getter(_BYTE *a1@<X8>)
{
  char v2 = *(_BYTE *)(v1 + 16);
  *a1 = *(_BYTE *)(v1 + 15);
  a1[1] = v2;
}

_BYTE *HIDElement.reportID.setter(_BYTE *result)
{
  char v2 = result[1];
  *(_BYTE *)(v1 + 15) = *result;
  *(_BYTE *)(v1 + 16) = v2;
  return result;
}

uint64_t (*HIDElement.reportID.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.reportSize.getter()
{
  return *(unsigned int *)(v0 + 20);
}

uint64_t HIDElement.reportSize.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 20) = result;
  return result;
}

uint64_t (*HIDElement.reportSize.modify())()
{
  return nullsub_1;
}

uint64_t sub_18915A460()
{
  return 0x100000000LL;
}

unint64_t HIDElement.unit.getter()
{
  return *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32);
}

uint64_t HIDElement.unit.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 24) = result;
  *(_BYTE *)(v1 + 28) = BYTE4(result) & 1;
  return result;
}

uint64_t (*HIDElement.unit.modify())()
{
  return nullsub_1;
}

uint64_t sub_18915A4BC()
{
  return 256LL;
}

uint64_t HIDElement.unitExponent.getter()
{
  return *(unsigned __int8 *)(v0 + 29) | (*(unsigned __int8 *)(v0 + 30) << 8);
}

uint64_t HIDElement.unitExponent.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 29) = result;
  *(_BYTE *)(v1 + 30) = BYTE1(result) & 1;
  return result;
}

uint64_t (*HIDElement.unitExponent.modify())()
{
  return nullsub_1;
}

uint64_t sub_18915A504()
{
  return 0LL;
}

uint64_t HIDElement.logicalMinimum.getter()
{
  return *(void *)(v0 + 32);
}

uint64_t HIDElement.logicalMinimum.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*HIDElement.logicalMinimum.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.logicalMaximum.getter()
{
  return *(void *)(v0 + 48);
}

uint64_t HIDElement.logicalMaximum.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 48) = result;
  *(_BYTE *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*HIDElement.logicalMaximum.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.physicalMinimum.getter()
{
  return *(void *)(v0 + 64);
}

uint64_t HIDElement.physicalMinimum.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 64) = result;
  *(_BYTE *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*HIDElement.physicalMinimum.modify())()
{
  return nullsub_1;
}

uint64_t HIDElement.physicalMaximum.getter()
{
  return *(void *)(v0 + 80);
}

uint64_t HIDElement.physicalMaximum.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 80) = result;
  *(_BYTE *)(v2 + 88) = a2 & 1;
  return result;
}

uint64_t (*HIDElement.physicalMaximum.modify())()
{
  return nullsub_1;
}

id sub_18915A5C0()
{
  return *(id *)(v0 + 96);
}

uint64_t sub_18915A5C8()
{
  return *(unsigned __int8 *)(v0 + 104);
}

uint64_t sub_18915A5D0()
{
  return *(unsigned __int8 *)(v0 + 105);
}

uint64_t sub_18915A5D8()
{
  return *(void *)(v0 + 112);
}

void HIDElement.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();
}

uint64_t HIDElement.hashValue.getter()
{
  uint64_t v1 = *(void **)(v0 + 96);
  sub_18919AE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();

  return sub_18919AE74();
}

uint64_t sub_18915A7A4()
{
  uint64_t v1 = *(void **)(v0 + 96);
  sub_18919AE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();

  return sub_18919AE74();
}

void sub_18915A884()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();
}

uint64_t sub_18915A95C()
{
  uint64_t v1 = *(void **)(v0 + 96);
  sub_18919AE38();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v2 = v1;
  sub_18919A9AC();

  return sub_18919AE74();
}

uint64_t HIDElement.description.getter()
{
  char v1 = *(_BYTE *)(v0 + 16);
  sub_18919AC4C();
  sub_18919AA9C();
  swift_unownedRetainStrong();
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A338,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919ADB4();
  sub_18919AA9C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_18919AA9C();
  sub_18919AA84();
  sub_18919AA9C();
  swift_bridgeObjectRelease();
  sub_18919AA9C();
  sub_18915EB84();
  sub_18919ADB4();
  sub_18919AA9C();
  swift_bridgeObjectRelease();
  if ((v1 & 1) == 0)
  {
    sub_18915ED9C();
    sub_18919ADB4();
    sub_18919AA9C();
    swift_bridgeObjectRelease();
  }

  sub_18919AA9C();
  swift_bridgeObjectRelease();
  sub_18919AA9C();
  return 0LL;
}

uint64_t HIDElement.Value.hash(into:)()
{
  __int128 v1 = v0[6];
  v12[5] = v0[5];
  v13[0] = v1;
  __int128 v2 = v0[4];
  *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)((char *)v0 + 105);
  __int128 v3 = v0[1];
  v12[0] = *v0;
  v12[1] = v3;
  __int128 v4 = v0[3];
  v12[2] = v0[2];
  v12[3] = v4;
  v12[4] = v2;
  uint64_t v5 = (void *)v1;
  swift_unownedRetainStrong();
  sub_18915E0B0((uint64_t)v12);
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v6 = v5;
  sub_18919A9AC();

  sub_18915EBC8((uint64_t)v12);
  uint64_t v7 = type metadata accessor for HIDElement.Value();
  sub_18919ACC4();
  sub_189160650(&qword_18C77A350, (uint64_t (*)(uint64_t))MEMORY[0x18961BF40], MEMORY[0x18961BF50]);
  sub_18919AA24();
  unint64_t v8 = (uint64_t *)((char *)v0 + *(int *)(v7 + 24));
  uint64_t v9 = *v8;
  unint64_t v10 = v8[1];
  sub_18915EC34(*v8, v10);
  sub_18919A970();
  return sub_18915EC78(v9, v10);
}

uint64_t HIDElement.Value.hashValue.getter()
{
  __int128 v1 = v0[6];
  v12[5] = v0[5];
  v13[0] = v1;
  __int128 v2 = v0[4];
  *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)((char *)v0 + 105);
  __int128 v3 = v0[1];
  v12[0] = *v0;
  v12[1] = v3;
  __int128 v4 = v0[3];
  v12[2] = v0[2];
  v12[3] = v4;
  v12[4] = v2;
  uint64_t v5 = (void *)v1;
  swift_unownedRetainStrong();
  sub_18915E0B0((uint64_t)v12);
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v6 = v5;
  sub_18919A9AC();

  sub_18915EBC8((uint64_t)v12);
  uint64_t v7 = type metadata accessor for HIDElement.Value();
  sub_18919ACC4();
  sub_189160650(&qword_18C77A350, (uint64_t (*)(uint64_t))MEMORY[0x18961BF40], MEMORY[0x18961BF50]);
  sub_18919AA24();
  unint64_t v8 = (uint64_t *)((char *)v0 + *(int *)(v7 + 24));
  uint64_t v9 = *v8;
  unint64_t v10 = v8[1];
  sub_18915EC34(*v8, v10);
  sub_18919A970();
  sub_18915EC78(v9, v10);
  return sub_18919AE74();
}

uint64_t sub_18915AF94(uint64_t a1, uint64_t a2)
{
  __int128 v4 = v2[6];
  v14[5] = v2[5];
  v15[0] = v4;
  __int128 v5 = v2[4];
  *(_OWORD *)((char *)v15 + 9) = *(_OWORD *)((char *)v2 + 105);
  __int128 v6 = v2[1];
  v14[0] = *v2;
  v14[1] = v6;
  __int128 v7 = v2[3];
  v14[2] = v2[2];
  v14[3] = v7;
  v14[4] = v5;
  unint64_t v8 = (void *)v4;
  swift_unownedRetainStrong();
  sub_18915E0B0((uint64_t)v14);
  type metadata accessor for HIDDeviceClient();
  sub_189160650( &qword_18C77A328,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  sub_18919AA24();
  swift_release();
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v9 = v8;
  sub_18919A9AC();

  sub_18915EBC8((uint64_t)v14);
  sub_18919ACC4();
  sub_189160650(&qword_18C77A350, (uint64_t (*)(uint64_t))MEMORY[0x18961BF40], MEMORY[0x18961BF50]);
  sub_18919AA24();
  unint64_t v10 = (uint64_t *)((char *)v2 + *(int *)(a2 + 24));
  uint64_t v11 = *v10;
  unint64_t v12 = v10[1];
  sub_18915EC34(*v10, v12);
  sub_18919A970();
  sub_18915EC78(v11, v12);
  return sub_18919AE74();
}

uint64_t HIDElement.Value.integerValue<A>(asTypeTruncatingIfNeeded:)@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v27 = a3;
  uint64_t v25 = a2;
  swift_getAssociatedTypeWitness();
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  uint64_t v24 = *(void *)(a1 - 8);
  MEMORY[0x1895F8858](v6);
  unint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = type metadata accessor for HIDElement.Value();
  MEMORY[0x1895F8858](v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  char v12 = sub_18919AC1C();
  uint64_t v26 = v4;
  sub_18915F214(v4, (uint64_t)v11);
  if ((v12 & 1) == 0)
  {
    sub_18915F258((uint64_t)v11);
    goto LABEL_6;
  }

  __int128 v13 = (uint64_t *)&v11[*(int *)(v9 + 24)];
  uint64_t v14 = *v13;
  unint64_t v15 = v13[1];
  sub_18915EC34(*v13, v15);
  sub_18915B400(v14, v15);
  __int16 v17 = v16;
  uint64_t result = sub_18915EC78(v14, v15);
  if ((v17 & 0x100) == 0)
  {
    sub_18915F258((uint64_t)v11);
    if ((v17 & 0x80) != 0)
    {
      swift_getAssociatedConformanceWitness();
      sub_18919ADE4();
      sub_18919ADC0();
      sub_18919ABF8();
      uint64_t v19 = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v8, a1);
LABEL_7:
      MEMORY[0x1895F8858](v19);
      *(&v23 - 4) = a1;
      *(&v23 - 3) = v20;
      *(&v23 - 2) = v21;
      return sub_18915CA20( v27,  (uint64_t)sub_18915F294,  (uint64_t)(&v23 - 6),  a1,  MEMORY[0x18961A520],  MEMORY[0x18961AFC8] + 8LL,  MEMORY[0x18961A528],  v22);
    }

LABEL_6:
    swift_getAssociatedConformanceWitness();
    sub_18919ADE4();
    uint64_t v19 = sub_18919ADC0();
    goto LABEL_7;
  }

  __break(1u);
  return result;
}

void sub_18915B400(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }

void sub_18915B5D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (char *)&loc_18915B664
     + dword_18915B7A4[*(void *)(a2 + *(int *)(type metadata accessor for HIDElement.Value() + 24) + 8) >> 62];
  __asm { BR              X10 }

uint64_t sub_18915B674()
{
  *(void *)(v5 - 96) = *(int *)(v0 + 36);
  sub_18919A97C();
  sub_189160650(&qword_18C77A478, (uint64_t (*)(uint64_t))MEMORY[0x189606D08], MEMORY[0x189606D20]);
  sub_18919ABE0();
  uint64_t v6 = 0LL;
  if ((*(_BYTE *)(v5 - 81) & 1) == 0)
  {
    uint64_t v7 = 0LL;
    do
    {
      char v8 = *(_BYTE *)(v5 - 82);
      uint64_t v9 = sub_18919ACDC();
      uint64_t v10 = v9 + 7;
      if (__OFADD__(v9, 7LL))
      {
        __break(1u);
        JUMPOUT(0x18915B7A4LL);
      }

      uint64_t v6 = v7 + 1;
      if (v10 < 0) {
        uint64_t v10 = v9 + 14;
      }
      if (v7 >= v10 >> 3) {
        break;
      }
      *(_BYTE *)(v1 + v7) = v8;
      sub_18919ABE0();
      ++v7;
    }

    while ((*(_BYTE *)(v5 - 81) & 1) == 0);
  }

  *(void *)(v2 + *(void *)(v5 - 96)) = v6;
  return sub_189160690(v2, &qword_18C77A470);
}

uint64_t HIDElement.Value.logicalValue<A>(asTypeTruncatingIfNeeded:)@<X0>( uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  uint64_t v71 = a3;
  uint64_t v7 = *(void *)(a2 + 8);
  uint64_t v67 = *(void *)(*(void *)(v7 + 24) + 16LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v9 = type metadata accessor for HIDElement.Value();
  uint64_t v10 = MEMORY[0x1895F8858](v9);
  v70 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = *(void *)(a1 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v10);
  v65 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = MEMORY[0x1895F8858](v13);
  __int16 v17 = (char *)&v61 - v16;
  uint64_t v18 = MEMORY[0x1895F8858](v15);
  uint64_t v20 = (char *)&v61 - v19;
  uint64_t v21 = MEMORY[0x1895F8858](v18);
  v69 = (char *)&v61 - v22;
  uint64_t v23 = MEMORY[0x1895F8858](v21);
  v68 = (char *)&v61 - v24;
  MEMORY[0x1895F8858](v23);
  uint64_t v26 = (char *)&v61 - v25;
  HIDElement.Value.integerValue<A>(asTypeTruncatingIfNeeded:)(a1, a2, (uint64_t)&v61 - v25);
  if ((*(_BYTE *)(v4 + 40) & 1) != 0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v26, a1);
    uint64_t v27 = 1LL;
    uint64_t v28 = v71;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v28, v27, 1LL, a1);
  }

  uint64_t v66 = v12;
  uint64_t v63 = v4;
  uint64_t v29 = *(void *)(v4 + 32);
  char v30 = sub_18919AC1C();
  uint64_t v64 = v7;
  if ((v30 & 1) != 0)
  {
    char v31 = v26;
    if (sub_18919AC10() >= 64)
    {
      uint64_t v72 = v29;
      sub_18915F2C0();
      int v38 = v68;
      sub_18919ABEC();
      char v32 = sub_18919AA3C();
      uint64_t v12 = v66;
      (*(void (**)(char *, uint64_t))(v66 + 8))(v38, a1);
    }

    else
    {
      char v32 = sub_18919AC04() < v29;
      uint64_t v12 = v66;
    }

    uint64_t v37 = (uint64_t)v70;
    goto LABEL_11;
  }

  char v33 = sub_18919AC1C();
  v62 = v26;
  uint64_t v34 = sub_18919AC10();
  if ((v33 & 1) == 0)
  {
    uint64_t v37 = (uint64_t)v70;
    if (v34 < 64)
    {
      char v31 = v62;
      char v32 = sub_18919AC04() < v29;
      uint64_t v12 = v66;
    }

    else
    {
      uint64_t v12 = v66;
      char v31 = v62;
      (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v17, v62, a1);
      uint64_t v72 = v29;
      if (v29 < 1)
      {
        char v32 = 0;
        v56 = *(void (**)(char *, uint64_t))(v12 + 8);
      }

      else
      {
        sub_18915F2C0();
        char v55 = v68;
        sub_18919ABEC();
        char v32 = sub_18919AA3C();
        v56 = *(void (**)(char *, uint64_t))(v12 + 8);
        v56(v55, a1);
      }

      v56(v17, a1);
    }

LABEL_11:
    char v35 = v69;
    goto LABEL_12;
  }

  char v35 = v69;
  if (v34 <= 64)
  {
    swift_getAssociatedConformanceWitness();
    sub_18919ADE4();
    CFIndex v49 = v68;
    sub_18919ADC0();
    BOOL v50 = v62;
    char v51 = sub_18919AA3C();
    uint64_t v52 = v66;
    BOOL v53 = *(void (**)(char *, uint64_t))(v66 + 8);
    uint64_t v54 = v49;
    char v31 = v50;
    v53(v54, a1);
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v20, v50, a1);
    char v32 = (v51 & 1) != 0 || sub_18919AC04() < v29;
    v53(v20, a1);
    uint64_t v12 = v66;
    uint64_t v37 = (uint64_t)v70;
  }

  else
  {
    uint64_t v72 = v29;
    sub_18915F2C0();
    __int128 v36 = v68;
    sub_18919ABEC();
    char v31 = v62;
    char v32 = sub_18919AA3C();
    uint64_t v12 = v66;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v36, a1);
    uint64_t v37 = (uint64_t)v70;
  }

    v18[(v12 >> 6) + 8] |= 1LL << v12;
    uint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
    *uint64_t v23 = a2;
    v23[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v24 = v18[2];
    uint64_t v25 = __OFADD__(v24, 1LL);
    uint64_t v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }

    goto LABEL_14;
  }

  sub_189163AD0(v15, a4 & 1);
  uint64_t v21 = sub_189163EC4(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    uint64_t v12 = v21;
    uint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

    v18[(v12 >> 6) + 8] |= 1LL << v12;
    uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
    *uint64_t v20 = a2;
    v20[1] = a3;
    *(void *)(v18[7] + 8 * v12) = a1;
    uint64_t v21 = v18[2];
    uint64_t v22 = __OFADD__(v21, 1LL);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }

    goto LABEL_14;
  }

  sub_189167ED4(result, a4 & 1);
  uint64_t result = sub_189163EC4(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    uint64_t v12 = result;
    uint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

          __break(1u);
          return result;
        }

LABEL_12:
  int v39 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v39(v35, v31, a1);
  uint64_t result = sub_18915F214(v63, v37);
  if ((v32 & 1) != 0)
  {
    sub_18915F258(v37);
    char v41 = *(void (**)(char *, uint64_t))(v12 + 8);
    v41(v35, a1);
    uint64_t v28 = v71;
    goto LABEL_14;
  }

  if ((*(_BYTE *)(v37 + 56) & 1) == 0)
  {
    char v42 = v31;
    uint64_t v43 = *(void *)(v37 + 48);
    char v44 = sub_18919AC1C();
    uint64_t v45 = sub_18919AC10();
    if ((v44 & 1) != 0)
    {
      uint64_t v28 = v71;
      if (v45 <= 64)
      {
        uint64_t v57 = sub_18919AC04();
        sub_18915F258(v37);
        char v41 = *(void (**)(char *, uint64_t))(v12 + 8);
        v41(v35, a1);
        if (v43 < v57) {
          goto LABEL_14;
        }
      }

      else
      {
        uint64_t v72 = v43;
        sub_18915F2C0();
        BOOL v46 = v68;
        sub_18919ABEC();
        char v47 = sub_18919AA3C();
        char v41 = *(void (**)(char *, uint64_t))(v12 + 8);
        v41(v46, a1);
        sub_18915F258(v37);
        v41(v35, a1);
        if ((v47 & 1) != 0) {
          goto LABEL_14;
        }
      }
    }

    else if (v45 > 63)
    {
      uint64_t v72 = v43;
      v58 = v65;
      v39(v65, v35, a1);
      if (v43 < 0)
      {
        char v41 = *(void (**)(char *, uint64_t))(v12 + 8);
        v41(v58, a1);
        sub_18915F258(v37);
        v41(v35, a1);
        uint64_t v28 = v71;
        char v31 = v42;
        goto LABEL_14;
      }

      sub_18915F2C0();
      v59 = v68;
      sub_18919ABEC();
      char v60 = sub_18919AA3C();
      char v41 = *(void (**)(char *, uint64_t))(v12 + 8);
      v41(v59, a1);
      v41(v58, a1);
      sub_18915F258(v37);
      v41(v35, a1);
      uint64_t v28 = v71;
      char v31 = v42;
      if ((v60 & 1) != 0)
      {
LABEL_14:
        v41(v31, a1);
        uint64_t v27 = 1LL;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v28, v27, 1LL, a1);
      }
    }

    else
    {
      uint64_t v48 = sub_18919AC04();
      sub_18915F258(v37);
      char v41 = *(void (**)(char *, uint64_t))(v12 + 8);
      v41(v35, a1);
      uint64_t v28 = v71;
      if (v43 < v48) {
        goto LABEL_14;
      }
    }

    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v28, v31, a1);
    uint64_t v27 = 0LL;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v28, v27, 1LL, a1);
  }

  __break(1u);
  return result;
}

  uint64_t v10 = *(void **)(*(void *)(a5 + 48) + 8 * v6);
  uint64_t v11 = *(void **)(*(void *)(a5 + 56) + 8 * v6);
  *a1 = v11;
  v10;
  uint64_t v12 = v11;
}

uint64_t HIDElement.Value.physicalValue<A, B>(fromTypeTruncatingIfNeeded:as:)@<X0>( uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v6 = v5;
  v27[1] = a4;
  uint64_t v28 = a3;
  uint64_t v10 = sub_18919ABD4();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  uint64_t v14 = (char *)v27 - v13;
  uint64_t v15 = *(void *)(a1 - 8);
  uint64_t v16 = MEMORY[0x1895F8858](v12);
  uint64_t v18 = (char *)v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v16);
  uint64_t v20 = (char *)v27 - v19;
  if ((*(_BYTE *)(v6 + 120) & 1) != 0) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56LL))( a5,  1LL,  1LL,  a2);
  }
  v27[0] = a5;
  HIDElement.Value.logicalValue<A>(asTypeTruncatingIfNeeded:)(a1, v28, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1LL, a1) == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56LL))( v27[0],  1LL,  1LL,  a2);
  }

  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v20, v14, a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A360);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_18919B6C0;
    *(void *)(v22 + 56) = a1;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v22 + 32));
    uint64_t v24 = *(void (**)(uint64_t *, char *, uint64_t))(v15 + 16);
    v24(boxed_opaque_existential_0, v20, a1);
    sub_18919AE2C();
    swift_bridgeObjectRelease();
    v24((uint64_t *)v18, v20, a1);
    if (sub_18919AC10() < 65)
    {
      sub_18919AC1C();
      sub_18919AC04();
    }

    else
    {
      sub_18915F340();
      sub_18915F384();
      sub_18919A9E8();
    }

    uint64_t v25 = *(uint64_t (**)(char *, uint64_t))(v15 + 8);
    uint64_t result = v25(v18, a1);
    uint64_t v26 = v27[0];
    if ((*(_BYTE *)(v6 + 120) & 1) != 0)
    {
      __break(1u);
    }

    else
    {
      sub_18919A9F4();
      v25(v20, a1);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(a2 - 8) + 56LL))( v26,  0LL,  1LL,  a2);
    }
  }

  return result;
}

uint64_t sub_18915C250@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  int v5 = *(_DWORD *)(a1 + 20);
  BOOL v6 = __CFADD__(v5, 7);
  unsigned int v7 = v5 + 7;
  if (v6) {
    __break(1u);
  }
  *(void *)&__int128 v22 = sub_18915F3C8(v7 >> 3);
  *((void *)&v22 + 1) = v11;
  sub_18915E720((uint64_t)&v22);
  uint64_t v20 = a2;
  sub_18915C940((uint64_t)&v20, (uint64_t)&v21, (uint64_t)&v22);
  __int128 v12 = v22;
  __int128 v13 = *(_OWORD *)(a1 + 80);
  a4[4] = *(_OWORD *)(a1 + 64);
  a4[5] = v13;
  a4[6] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)((char *)a4 + 105) = *(_OWORD *)(a1 + 105);
  __int128 v14 = *(_OWORD *)(a1 + 16);
  *a4 = *(_OWORD *)a1;
  a4[1] = v14;
  __int128 v15 = *(_OWORD *)(a1 + 48);
  a4[2] = *(_OWORD *)(a1 + 32);
  a4[3] = v15;
  uint64_t v16 = type metadata accessor for HIDElement.Value();
  *(_OWORD *)((char *)a4 + *(int *)(v16 + 24)) = v12;
  uint64_t v17 = (char *)a4 + *(int *)(v16 + 20);
  uint64_t v18 = sub_18919ACC4();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v18 - 8) + 32LL))(v17, a3, v18);
}

uint64_t HIDElement.Value.init<A>(element:fromIntegerTruncatingIfNeeded:timestamp:)@<X0>( __int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v48 = *(void *)(a4 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v11);
  char v47 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  __int128 v15 = (char *)&v45 - v14;
  __int128 v50 = *a1;
  int v16 = *((_DWORD *)a1 + 4);
  int v49 = *((_DWORD *)a1 + 5);
  int v51 = v16;
  __int128 v17 = *(__int128 *)((char *)a1 + 88);
  __int128 v57 = *(__int128 *)((char *)a1 + 72);
  __int128 v58 = v17;
  __int128 v59 = *(__int128 *)((char *)a1 + 104);
  char v60 = *((_BYTE *)a1 + 120);
  __int128 v18 = *(__int128 *)((char *)a1 + 40);
  __int128 v54 = *(__int128 *)((char *)a1 + 24);
  __int128 v55 = v18;
  __int128 v56 = *(__int128 *)((char *)a1 + 56);
  if ((sub_18919AC1C() & 1) != 0)
  {
    uint64_t v19 = a3;
    if (sub_18919AC10() < 64)
    {
      uint64_t v20 = v48;
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v15, a2, a4);
      uint64_t v21 = sub_18919AC04();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v15, a4);
LABEL_4:
      unsigned int v22 = v49;
      if ((v21 & 0x8000000000000000LL) == 0) {
        goto LABEL_16;
      }
      goto LABEL_11;
    }

    uint64_t v52 = 0LL;
    sub_18915F48C();
    sub_18919ABEC();
    char v26 = sub_18919AA3C();
    uint64_t v20 = v48;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, a4);
  }

  else
  {
    uint64_t v46 = a3;
    char v23 = sub_18919AC1C();
    uint64_t v45 = a2;
    uint64_t v24 = sub_18919AC10();
    BOOL v25 = v24 < 64;
    if ((v23 & 1) == 0) {
      goto LABEL_13;
    }
    if (v24 <= 64)
    {
      swift_getAssociatedConformanceWitness();
      sub_18919ADE4();
      sub_18919ADC0();
      a2 = v45;
      char v42 = sub_18919AA3C();
      uint64_t v20 = v48;
      uint64_t v43 = *(void (**)(char *, uint64_t))(v48 + 8);
      v43(v15, a4);
      char v44 = v47;
      (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v47, a2, a4);
      if ((v42 & 1) != 0)
      {
        v43(v44, a4);
        uint64_t v19 = v46;
        unsigned int v22 = v49;
        unsigned int v27 = v49 + 7;
        BOOL v25 = v49 < -7;
        goto LABEL_17;
      }

      uint64_t v21 = sub_18919AC04();
      v43(v44, a4);
      uint64_t v19 = v46;
      goto LABEL_4;
    }

    uint64_t v52 = 0LL;
    sub_18915F48C();
    sub_18919ABEC();
    a2 = v45;
    char v26 = sub_18919AA3C();
    uint64_t v20 = v48;
    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, a4);
    uint64_t v19 = v46;
  }

  unsigned int v22 = v49;
  if ((v26 & 1) == 0) {
    goto LABEL_16;
  }
LABEL_11:
  while (1)
  {
    unsigned int v27 = v22 + 7;
    BOOL v25 = (int)v22 < -7;
    if (v22 < 0xFFFFFFF9) {
      break;
    }
LABEL_12:
    while (1)
    {
      __break(1u);
LABEL_13:
      uint64_t v19 = v46;
      a2 = v45;
      unsigned int v22 = v49;
      uint64_t v20 = v48;
      if (v25)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v15, v45, a4);
        uint64_t v28 = sub_18919AC04();
        (*(void (**)(char *, uint64_t))(v20 + 8))(v15, a4);
        if (v28 < 0) {
          break;
        }
      }

LABEL_16:
      unsigned int v27 = v22 + 7;
      BOOL v25 = (int)v22 < -7;
      if (v22 < 0xFFFFFFF9) {
        goto LABEL_17;
      }
    }
  }

    __break(1u);
    goto LABEL_17;
  }

  if (a2 < 0 || 1LL << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_15;
  }

  if (((*(void *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8LL) + 64) >> a2) & 1) == 0)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }

  if (*(_DWORD *)(a5 + 36) != a3)
  {
    __break(1u);
    goto LABEL_10;
  }

LABEL_17:
  uint64_t v52 = sub_18915F3C8(v27 >> 3);
  uint64_t v53 = v29;
  sub_18915E720((uint64_t)&v52);
  uint64_t v30 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 16))(v15, a2, a4);
  MEMORY[0x1895F8858](v30);
  *(&v45 - 2) = (uint64_t)&v52;
  sub_18915CA20( (uint64_t)v15,  (uint64_t)sub_18915F464,  (uint64_t)(&v45 - 4),  a4,  MEMORY[0x18961A520],  MEMORY[0x18961AFC8] + 8LL,  MEMORY[0x18961A528],  v31);
  char v32 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  v32(a2, a4);
  v32((uint64_t)v15, a4);
  *(_OWORD *)a5 = v50;
  __int128 v33 = v56;
  *(_OWORD *)(a5 + 72) = v57;
  *(_OWORD *)(a5 + 88) = v58;
  *(_OWORD *)(a5 + 104) = v59;
  __int128 v34 = v55;
  *(_OWORD *)(a5 + 24) = v54;
  *(_OWORD *)(a5 + 40) = v34;
  uint64_t v35 = v52;
  uint64_t v36 = v53;
  *(_DWORD *)(a5 + 16) = v51;
  *(_DWORD *)(a5 + 20) = v22;
  *(_BYTE *)(a5 + 120) = v60;
  *(_OWORD *)(a5 + 56) = v33;
  uint64_t v37 = type metadata accessor for HIDElement.Value();
  int v38 = (uint64_t *)(a5 + *(int *)(v37 + 24));
  *int v38 = v35;
  v38[1] = v36;
  uint64_t v39 = a5 + *(int *)(v37 + 20);
  uint64_t v40 = sub_18919ACC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 32LL))(v39, v19, v40);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 7;
  char v8 = v6 - 7;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x72;
  char v8 = v6 - 114;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x33;
  char v8 = v6 - 51;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0xC;
  char v8 = v6 - 12;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x18;
  char v8 = v6 - 24;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0xDA;
  char v8 = v6 - 218;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x60;
  char v8 = v6 - 96;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x63;
  char v8 = v6 - 99;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x1C2;
  char v8 = v6 - 450;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x6C;
  char v8 = v6 - 108;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x69;
  char v8 = v6 - 105;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x22;
  char v8 = v6 - 34;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x4B;
  char v8 = v6 - 75;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x299;
  char v8 = v6 - 665;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x1D;
  char v8 = v6 - 29;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x2B;
  char v8 = v6 - 43;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x21;
  char v8 = v6 - 33;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 4;
  char v8 = v6 - 4;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x2D;
  char v8 = v6 - 45;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x4D;
  char v8 = v6 - 77;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x5B;
  char v8 = v6 - 91;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0xC2;
  char v8 = v6 - 194;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x2E;
  char v8 = v6 - 46;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0xA;
  char v8 = v6 - 10;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 2;
  char v8 = v6 - 2;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x1B;
  char v8 = v6 - 27;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 3;
  char v8 = v6 - 3;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

  BOOL v6 = *a1;
  unsigned int v7 = v6 >= 0x24;
  char v8 = v6 - 36;
  if (!v7) {
    char v8 = -1;
  }
  return (v8 + 1);
}

uint64_t sub_18915C940(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (!a2 || result != a2) {
LABEL_7:
    }
      __asm { BR              X12 }
  }

  else if (a2)
  {
    goto LABEL_7;
  }

  return result;
}

uint64_t sub_18915CA20( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x1895F8858]();
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64LL), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t sub_18915CAB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v8 = sub_18919ACC4();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  if (*(_BYTE *)(a1 + 40) != 1 && *(void *)(a1 + 32) <= a2)
  {
    sub_18916060C(a1 + 48, (uint64_t)v15, &qword_18C77A468);
    uint64_t result = sub_18916060C((uint64_t)v15, (uint64_t)&v16, &qword_18C77A468);
    if ((v17 & 1) != 0)
    {
      __break(1u);
      return result;
    }

    if (v16 >= a2)
    {
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v11, a3, v8);
      sub_18915C250(a1, a2, (uint64_t)v11, a4);
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, v8);
      uint64_t v14 = type metadata accessor for HIDElement.Value();
      return (*(uint64_t (**)(_OWORD *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))( a4,  0LL,  1LL,  v14);
    }
  }

  sub_18915EBC8(a1);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, v8);
  uint64_t v13 = type metadata accessor for HIDElement.Value();
  return (*(uint64_t (**)(_OWORD *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56LL))( a4,  1LL,  1LL,  v13);
}

uint64_t HIDElement.Value.init<A>(element:fromLogicalValueTruncatingIfNeeded:timestamp:)@<X0>( __int128 *a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v104 = a6;
  v105 = a2;
  uint64_t v10 = sub_18919ACC4();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v10);
  v99 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v100 = a5;
  uint64_t v13 = *(char **)(a5 + 8);
  v98 = *(void (**)(char *, uint64_t, uint64_t))(*((void *)v13 + 3) + 16LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v15 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v16 = *(void *)(a4 - 8);
  uint64_t v17 = MEMORY[0x1895F8858](v15);
  uint64_t v18 = MEMORY[0x1895F8858](v17);
  uint64_t v19 = MEMORY[0x1895F8858](v18);
  uint64_t v20 = MEMORY[0x1895F8858](v19);
  v102 = (char *)&v90 - v21;
  MEMORY[0x1895F8858](v20);
  v103 = (char *)&v90 - v25;
  __int128 v26 = a1[5];
  __int128 v112 = a1[4];
  __int128 v113 = v26;
  v114[0] = a1[6];
  *(_OWORD *)((char *)v114 + 9) = *(__int128 *)((char *)a1 + 105);
  __int128 v27 = a1[1];
  __int128 v108 = *a1;
  __int128 v109 = v27;
  __int128 v28 = a1[3];
  __int128 v110 = a1[2];
  __int128 v111 = v28;
  if ((BYTE8(v110) & 1) == 0)
  {
    uint64_t v93 = v24;
    uint64_t v94 = v23;
    uint64_t v96 = a3;
    uint64_t v97 = v16;
    v92 = v22;
    uint64_t v101 = v11;
    uint64_t v95 = v10;
    uint64_t v30 = v110;
    if ((sub_18919AC1C() & 1) != 0)
    {
      uint64_t v31 = (char *)v105;
      uint64_t v32 = sub_18919AC10();
      uint64_t v29 = v104;
      if (v32 >= 64)
      {
        *(void *)&v106[0] = v30;
        sub_18915F2C0();
        uint64_t v48 = v103;
        sub_18919ABEC();
        char v49 = sub_18919AA3C();
        uint64_t v50 = v97;
        uint64_t v37 = *(void (**)(char *, uint64_t))(v97 + 8);
        v37(v48, a4);
        int v51 = *(void (**)(char *, uint64_t, uint64_t))(v50 + 16);
        uint64_t v38 = a4;
        uint64_t v39 = v102;
        v98 = v51;
        v51(v102, (uint64_t)v31, v38);
        uint64_t v43 = v101;
        if ((v49 & 1) == 0) {
          goto LABEL_15;
        }
        goto LABEL_33;
      }

      uint64_t v93 = v30;
      uint64_t v33 = v97;
      __int128 v34 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 16);
      uint64_t v35 = v103;
      v34(v103, (uint64_t)v31, a4);
      uint64_t v36 = sub_18919AC04();
      uint64_t v37 = *(void (**)(char *, uint64_t))(v33 + 8);
      uint64_t v38 = a4;
      v37(v35, a4);
      uint64_t v39 = v102;
      v98 = v34;
      v34(v102, (uint64_t)v31, v38);
      BOOL v40 = v36 < v93;
LABEL_14:
      uint64_t v43 = v101;
      if (!v40) {
        goto LABEL_15;
      }
LABEL_33:
      sub_18915EBC8((uint64_t)&v108);
      v37(v39, v38);
      uint64_t v88 = v95;
      uint64_t v87 = v96;
LABEL_38:
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v87, v88);
      v37(v31, v38);
      goto LABEL_39;
    }

    char v41 = sub_18919AC1C();
    uint64_t v42 = sub_18919AC10();
    if ((v41 & 1) != 0)
    {
      uint64_t v43 = v101;
      if (v42 > 64)
      {
        *(void *)&v106[0] = v30;
        sub_18915F2C0();
        char v44 = v103;
        sub_18919ABEC();
        uint64_t v31 = (char *)v105;
        char v45 = sub_18919AA3C();
        uint64_t v46 = v97;
        uint64_t v37 = *(void (**)(char *, uint64_t))(v97 + 8);
        v37(v44, a4);
        char v47 = *(void (**)(char *, uint64_t, uint64_t))(v46 + 16);
        uint64_t v38 = a4;
        uint64_t v39 = v102;
        v98 = v47;
        v47(v102, (uint64_t)v31, v38);
        uint64_t v29 = v104;
        if ((v45 & 1) == 0) {
          goto LABEL_15;
        }
        goto LABEL_33;
      }

      uint64_t v93 = v30;
      swift_getAssociatedConformanceWitness();
      sub_18919ADE4();
      uint64_t v64 = v13;
      v65 = v103;
      sub_18919ADC0();
      v91 = v64;
      uint64_t v66 = v105;
      char v67 = sub_18919AA3C();
      uint64_t v68 = v97;
      uint64_t v37 = *(void (**)(char *, uint64_t))(v97 + 8);
      v37(v65, a4);
      v69 = *(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16);
      uint64_t v38 = a4;
      v70 = (char *)v94;
      v69(v94, v66, a4);
      uint64_t v29 = v104;
      uint64_t v39 = v102;
      if ((v67 & 1) != 0)
      {
        v37(v70, v38);
        v69((uint64_t)v39, v66, v38);
        uint64_t v31 = (char *)v66;
        goto LABEL_33;
      }

      uint64_t v86 = sub_18919AC04();
      v37(v70, v38);
      v98 = (void (*)(char *, uint64_t, uint64_t))v69;
      v69((uint64_t)v39, v66, v38);
      BOOL v40 = v86 < v93;
      uint64_t v31 = (char *)v66;
      uint64_t v13 = v91;
      if (v40) {
        goto LABEL_33;
      }
    }

    else
    {
      uint64_t v52 = v30;
      if (v42 < 64)
      {
        uint64_t v53 = v97;
        __int128 v54 = *(void (**)(char *, uint64_t, uint64_t))(v97 + 16);
        __int128 v55 = v103;
        uint64_t v31 = (char *)v105;
        v54(v103, v105, a4);
        uint64_t v56 = sub_18919AC04();
        uint64_t v37 = *(void (**)(char *, uint64_t))(v53 + 8);
        uint64_t v38 = a4;
        v37(v55, a4);
        uint64_t v39 = v102;
        v98 = v54;
        v54(v102, (uint64_t)v31, v38);
        BOOL v40 = v56 < v52;
        uint64_t v29 = v104;
        goto LABEL_14;
      }

      uint64_t v71 = v97;
      uint64_t v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v97 + 16);
      uint64_t v73 = v93;
      uint64_t v31 = (char *)v105;
      uint64_t v74 = a4;
      v72(v93, v105, a4);
      *(void *)&v106[0] = v52;
      uint64_t v29 = v104;
      v98 = (void (*)(char *, uint64_t, uint64_t))v72;
      if (v52 <= 0)
      {
        uint64_t v37 = *(void (**)(char *, uint64_t))(v71 + 8);
        v37((char *)v73, a4);
        uint64_t v39 = v102;
        v72((uint64_t)v102, (uint64_t)v31, v74);
        uint64_t v38 = v74;
        if ((BYTE8(v111) & 1) == 0) {
          goto LABEL_16;
        }
        goto LABEL_35;
      }

      sub_18915F2C0();
      v75 = (void (*)(char *, uint64_t, uint64_t))v72;
      v76 = v103;
      sub_18919ABEC();
      LODWORD(v94) = sub_18919AA3C();
      uint64_t v37 = *(void (**)(char *, uint64_t))(v71 + 8);
      v37(v76, a4);
      v37((char *)v73, a4);
      uint64_t v39 = v102;
      v75(v102, (uint64_t)v31, v74);
      uint64_t v43 = v101;
      uint64_t v38 = v74;
      if ((v94 & 1) != 0) {
        goto LABEL_33;
      }
    }

LABEL_15:
    if ((BYTE8(v111) & 1) == 0)
    {
LABEL_16:
      uint64_t v57 = v111;
      char v58 = sub_18919AC1C();
      uint64_t v59 = sub_18919AC10();
      if ((v58 & 1) != 0)
      {
        if (v59 > 64)
        {
          *(void *)&v106[0] = v57;
          sub_18915F2C0();
          char v60 = v103;
          sub_18919ABEC();
          char v61 = sub_18919AA3C();
          v62 = v60;
          goto LABEL_29;
        }

  uint64_t result = sub_18919ADF0();
  __break(1u);
  return result;
}

  uint64_t result = sub_18919ADF0();
  __break(1u);
  return result;
}

LABEL_20:
        uint64_t v63 = sub_18919AC04();
        v37(v39, v38);
        if (v57 >= v63)
        {
LABEL_30:
          v106[4] = v112;
          v106[5] = v113;
          v107[0] = v114[0];
          *(_OWORD *)((char *)v107 + 9) = *(_OWORD *)((char *)v114 + 9);
          v106[0] = v108;
          v106[1] = v109;
          v106[2] = v110;
          v106[3] = v111;
          uint64_t v78 = (uint64_t)v103;
          v98(v103, (uint64_t)v31, v38);
          uint64_t v79 = v101;
          uint64_t v80 = (uint64_t)v99;
          uint64_t v82 = v95;
          uint64_t v81 = v96;
          (*(void (**)(char *, uint64_t, uint64_t))(v101 + 16))(v99, v96, v95);
          uint64_t v83 = v104;
          HIDElement.Value.init<A>(element:fromIntegerTruncatingIfNeeded:timestamp:)(v106, v78, v80, v38, v104);
          (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v81, v82);
          v37(v31, v38);
          uint64_t v84 = type metadata accessor for HIDElement.Value();
          return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v84 - 8) + 56LL))( v83,  0LL,  1LL,  v84);
        }

        goto LABEL_37;
      }

      if (v59 <= 63) {
        goto LABEL_20;
      }
      *(void *)&v106[0] = v57;
      uint64_t v13 = v92;
      v98(v92, (uint64_t)v39, v38);
      if ((v57 & 0x8000000000000000LL) == 0)
      {
        sub_18915F2C0();
        v77 = v103;
        sub_18919ABEC();
        char v61 = sub_18919AA3C();
        v37(v77, v38);
        v62 = v13;
LABEL_29:
        v37(v62, v38);
        v37(v39, v38);
        if ((v61 & 1) == 0) {
          goto LABEL_30;
        }
        goto LABEL_37;
      }

LABEL_36:
      v37(v13, v38);
      v37(v39, v38);
LABEL_37:
      sub_18915EBC8((uint64_t)&v108);
      uint64_t v88 = v95;
      uint64_t v87 = v96;
      uint64_t v29 = v104;
      uint64_t v43 = v101;
      goto LABEL_38;
    }

LABEL_35:
    __break(1u);
    goto LABEL_36;
  }

  sub_18915EBC8((uint64_t)&v108);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a3, v10);
  uint64_t v29 = v104;
  (*(void (**)(char *, uint64_t))(v16 + 8))((char *)v105, a4);
LABEL_39:
  uint64_t v89 = type metadata accessor for HIDElement.Value();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56LL))( v29,  1LL,  1LL,  v89);
}

uint64_t HIDElement.Value.init<A>(element:fromPhysicalValue:timestamp:)@<X0>( _OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  v32[1] = a5;
  uint64_t v33 = a6;
  uint64_t v10 = sub_18919ACC4();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v10);
  uint64_t v13 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A380);
  uint64_t v15 = MEMORY[0x1895F8858](v14);
  uint64_t v17 = (_OWORD *)((char *)v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v18 = *(void *)(a4 - 8);
  MEMORY[0x1895F8858](v15);
  *(_OWORD *)&v36[9] = *(_OWORD *)((char *)a1 + 105);
  __int128 v20 = a1[5];
  v35[4] = a1[4];
  v35[5] = v20;
  *(_OWORD *)uint64_t v36 = a1[6];
  __int128 v21 = a1[1];
  v35[0] = *a1;
  v35[1] = v21;
  __int128 v22 = a1[3];
  v35[2] = a1[2];
  v35[3] = v22;
  if ((v36[24] & 1) != 0)
  {
    sub_18915EBC8((uint64_t)v35);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a3, v10);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, a4);
LABEL_8:
    uint64_t v30 = type metadata accessor for HIDElement.Value();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56LL))( v33,  1LL,  1LL,  v30);
  }

  uint64_t v23 = a3;
  double v24 = *(double *)&v36[16];
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))( (char *)v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL),  a2,  a4);
  sub_18915F340();
  uint64_t result = sub_18919A9DC();
  double v26 = v24 * v34;
  if ((~COERCE__INT64(v24 * v34) & 0x7FF0000000000000LL) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }

  if (v26 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if (v26 >= 9.22337204e18)
  {
LABEL_12:
    __break(1u);
    return result;
  }

  uint64_t v27 = (uint64_t)v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v23, v10);
  sub_18915CAB8((uint64_t)v35, v27, (uint64_t)v13, v17);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v23, v10);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a2, a4);
  uint64_t v28 = type metadata accessor for HIDElement.Value();
  uint64_t v29 = *(void *)(v28 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v29 + 48))(v17, 1LL, v28))
  {
    sub_189160690((uint64_t)v17, &qword_18C77A380);
    goto LABEL_8;
  }

  uint64_t v31 = v33;
  sub_18915F4D0((uint64_t)v17, v33);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v29 + 56))(v31, 0LL, 1LL, v28);
}

uint64_t HIDElement.Value.description.getter()
{
  *(void *)&v9[0] = 0LL;
  *((void *)&v9[0] + 1) = 0xE000000000000000LL;
  sub_18919AC4C();
  sub_18919AA9C();
  __int128 v1 = v0[5];
  v9[4] = v0[4];
  v9[5] = v1;
  v10[0] = v0[6];
  *(_OWORD *)((char *)v10 + 9) = *(_OWORD *)((char *)v0 + 105);
  __int128 v2 = v0[1];
  v9[0] = *v0;
  v9[1] = v2;
  __int128 v3 = v0[3];
  v9[2] = v0[2];
  v9[3] = v3;
  sub_18915E0B0((uint64_t)v9);
  HIDElement.description.getter();
  sub_18919AA9C();
  swift_bridgeObjectRelease();
  sub_18915EBC8((uint64_t)v9);
  sub_18919AA9C();
  uint64_t v4 = type metadata accessor for HIDElement.Value();
  sub_18919ACC4();
  sub_18919ACD0();
  sub_18919AA9C();
  int v5 = (uint64_t *)((char *)v0 + *(int *)(v4 + 24));
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  sub_18915EC34(*v5, v7);
  sub_18915DA2C(v6, v7);
  sub_18915EC78(v6, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A388);
  sub_18915F514();
  sub_18919AA30();
  swift_bridgeObjectRelease();
  sub_18919AA9C();
  swift_bridgeObjectRelease();
  sub_18919AA9C();
  return 0LL;
}

void sub_18915DA2C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }

uint64_t sub_18915DA84(uint64_t a1)
{
  uint64_t v4 = BYTE6(v22);
  if (BYTE6(v22))
  {
    *(void *)(v3 - 104) = v2;
    uint64_t v5 = BYTE6(v22);
    sub_18915E988(0LL, BYTE6(v22), 0);
    uint64_t v2 = *(void *)(v3 - 104);
    if ((_DWORD)v1)
    {
      if ((_DWORD)v1 == 1) {
        uint64_t v6 = (int)a1;
      }
      else {
        uint64_t v6 = *(void *)(a1 + 16);
      }
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    *(void *)(v3 - 136) = v22 & 0x3FFFFFFFFFFFFFFFLL;
    *(void *)(v3 - 128) = v1;
    while (v5)
    {
      if ((_DWORD)v1)
      {
        if ((_DWORD)v1 == 1)
        {
          uint64_t v7 = sub_18919A8BC();
          if (!v7)
          {
            __break(1u);
LABEL_36:
            __break(1u);
          }

          uint64_t v8 = v7;
          uint64_t v9 = sub_18919A8E0();
          uint64_t v10 = v6 - v9;
          if (__OFSUB__(v6, v9)) {
            goto LABEL_32;
          }
        }

        else
        {
          if (v6 < *(void *)(a1 + 16)) {
            goto LABEL_31;
          }
          if (v6 >= *(void *)(a1 + 24)) {
            goto LABEL_33;
          }
          uint64_t v12 = sub_18919A8BC();
          if (!v12) {
            goto LABEL_36;
          }
          uint64_t v8 = v12;
          uint64_t v13 = sub_18919A8E0();
          uint64_t v10 = v6 - v13;
          if (__OFSUB__(v6, v13)) {
            goto LABEL_34;
          }
        }

        char v11 = *(_BYTE *)(v8 + v10);
      }

      else
      {
        if (v6 >= BYTE6(v22)) {
          goto LABEL_30;
        }
        *(void *)(v3 - 118) = a1;
        *(_WORD *)(v3 - 110) = v22;
        *(_BYTE *)(v3 - 108) = BYTE2(v22);
        *(_BYTE *)(v3 - 107) = BYTE3(v22);
        *(_BYTE *)(v3 - 106) = BYTE4(v22);
        *(_BYTE *)(v3 - 105) = BYTE5(v22);
        char v11 = *(_BYTE *)(v3 - 118 + v6);
      }

      __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A458);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_18919B6C0;
      *(void *)(v14 + 56) = MEMORY[0x18961A610];
      *(void *)(v14 + 64) = MEMORY[0x18961A658];
      *(_BYTE *)(v14 + 32) = v11;
      uint64_t v15 = sub_18919AA78();
      uint64_t v17 = v16;
      *(void *)(v3 - 104) = v2;
      unint64_t v19 = *(void *)(v2 + 16);
      unint64_t v18 = *(void *)(v2 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_18915E988((char *)(v18 > 1), v19 + 1, 1);
        uint64_t v2 = *(void *)(v3 - 104);
      }

      *(void *)(v2 + 16) = v19 + 1;
      uint64_t v20 = v2 + 16 * v19;
      *(void *)(v20 + 32) = v15;
      *(void *)(v20 + 40) = v17;
      ++v6;
      --v5;
      --v4;
      uint64_t v1 = *(void *)(v3 - 128);
      if (!v4) {
        return v2;
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
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    __break(1u);
    JUMPOUT(0x18915DD98LL);
  }

  return v2;
}

uint64_t sub_18915DDC4(uint64_t a1)
{
  return sub_18919A9B8();
}

uint64_t sub_18915DE00()
{
  return sub_18919A9AC();
}

uint64_t sub_18915DE48(uint64_t a1, uint64_t a2)
{
  return sub_18919AE74();
}

void type metadata accessor for IOHIDElement()
{
  if (!qword_18C77A440)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18C77A440);
    }
  }

uint64_t sub_18915DEF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18919A9A0();
}

char *sub_18915DF40(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A488);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E1EBC]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_18915E098(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 96);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

uint64_t sub_18915E0B0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 96);
  swift_unownedRetain();
  id v3 = v2;
  return a1;
}

char *sub_18915E0E0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A480);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 + 95;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 7);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[128 * v8]) {
      memmove(v13, v14, v8 << 7);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_18915E1E0(uint64_t a1)
{
  return a1;
}

void sub_18915E240( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  if (a13)
  {
    swift_unownedRelease();
  }

double sub_18915E278(_OWORD *a1)
{
  double result = 0.0;
  *(_OWORD *)((char *)a1 + 105) = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

void sub_18915E294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }

uint64_t sub_18915E2F4( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20, char a21, char a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
{
  uint64_t v42 = v39;
  __int16 v43 = v40;
  char v44 = BYTE2(v40);
  char v45 = BYTE3(v40);
  char v46 = BYTE4(v40);
  char v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x18915E4D8LL);
  }

  uint64_t result = memcmp(v38, &v42, BYTE6(v40));
  *uint64_t v37 = (_DWORD)result == 0;
  return result;
}

void sub_18915E4FC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }

uint64_t sub_18915E558()
{
  uint64_t v8 = v3;
  __int16 v9 = v4;
  char v10 = BYTE2(v4);
  char v11 = BYTE3(v4);
  char v12 = BYTE4(v4);
  char v13 = BYTE5(v4);
  sub_18915E294((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_18915EC78(v1, v0);
  if (!v2) {
    char v5 = v7;
  }
  return v5 & 1;
}

void sub_18915E720(uint64_t a1)
{
  __asm { BR              X13 }

void *sub_18915E77C( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t __b, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24)
{
  uint64_t v30 = v25;
  LOWORD(v31) = v24;
  BYTE2(v31) = BYTE2(v24);
  HIBYTE(v31) = BYTE3(v24);
  unsigned __int8 v32 = BYTE4(v24);
  unsigned __int8 v33 = BYTE5(v24);
  unsigned __int8 v34 = BYTE6(v24);
  uint64_t result = memset(&v30, v27, BYTE6(v24));
  unint64_t v29 = v31 | ((unint64_t)v32 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v34 << 48);
  void *v26 = v30;
  v26[1] = v29;
  return result;
}

char *sub_18915E908(int *a1, int a2)
{
  uint64_t result = (char *)sub_18919A940();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_9;
  }

  uint64_t result = (char *)sub_18919A8BC();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }

  char v7 = result;
  uint64_t result = (char *)sub_18919A8E0();
  uint64_t v8 = v5 - (void)result;
  if (__OFSUB__(v5, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }

  int64_t v9 = v6 - v5;
  uint64_t v10 = sub_18919A8D4();
  if (v10 >= v9) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v10;
  }
  return (char *)memset(&v7[v8], a2, v11);
}

char *sub_18915E988(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_18915E9A4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_18915E9A4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A460);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  char v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy();
  }

  swift_release();
  return v10;
}

uint64_t _s7CoreHID20HIDElementCollectionV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  uint64_t v3 = *(void **)(a2 + 16);
  type metadata accessor for HIDDeviceClient();
  swift_unownedRetainStrong();
  swift_unownedRetainStrong();
  char v4 = static HIDDeviceClient.== infix(_:_:)();
  swift_release();
  swift_release();
  if ((v4 & 1) == 0) {
    return 0LL;
  }
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v5 = v2;
  id v6 = v3;
  char v7 = sub_18919A9A0();

  return v7 & 1;
}

unint64_t sub_18915EB84()
{
  unint64_t result = qword_18C77A340;
  if (!qword_18C77A340)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDUsage, &type metadata for HIDUsage);
    atomic_store(result, (unint64_t *)&qword_18C77A340);
  }

  return result;
}

uint64_t sub_18915EBC8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 96);
  swift_unownedRelease();

  return a1;
}

uint64_t type metadata accessor for HIDElement.Value()
{
  uint64_t result = qword_18C77B950;
  if (!qword_18C77B950) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_18915EC34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_18915EC78(uint64_t a1, unint64_t a2)
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

uint64_t _s7CoreHID10HIDElementV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 96);
  uint64_t v3 = *(void **)(a2 + 96);
  type metadata accessor for HIDDeviceClient();
  swift_unownedRetainStrong();
  swift_unownedRetainStrong();
  char v4 = static HIDDeviceClient.== infix(_:_:)();
  swift_release();
  swift_release();
  if ((v4 & 1) == 0) {
    return 0LL;
  }
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v5 = v2;
  id v6 = v3;
  char v7 = sub_18919A9A0();

  return v7 & 1;
}

unint64_t sub_18915ED9C()
{
  unint64_t result = qword_18C77A348;
  if (!qword_18C77A348)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDReportID, &type metadata for HIDReportID);
    atomic_store(result, (unint64_t *)&qword_18C77A348);
  }

  return result;
}

uint64_t sub_18915EDE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = sub_18919A8BC();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_18919A8E0();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }

    v11 += a1 - result;
  }

  BOOL v12 = __OFSUB__(a2, a1);
  uint64_t v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }

  uint64_t v14 = sub_18919A8D4();
  if (v14 >= v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  uint64_t v16 = v11 + v15;
  if (v11) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0LL;
  }
  sub_18915E294(v11, v17, a4, a5);
  if (!v5) {
    char v18 = v19;
  }
  return v18 & 1;
}

void sub_18915EE94(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

uint64_t sub_18915EED8()
{
  return ((uint64_t (*)(void))((char *)&loc_18915EF0C + dword_18915EFCC[v0 >> 62]))();
}

uint64_t sub_18915EF1C@<X0>(uint64_t a1@<X8>)
{
  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      char v5 = 1;
    }

    else
    {
      sub_18915EC34(v2, v1);
      sub_18915E4FC(v4, v3);
    }
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

uint64_t _s7CoreHID10HIDElementV5ValueV2eeoiySbAE_AEtFZ_0(_OWORD *a1, __int128 *a2)
{
  uint64_t v4 = type metadata accessor for HIDElement.Value();
  uint64_t v5 = MEMORY[0x1895F8858](v4);
  char v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v5);
  uint64_t v9 = (char *)v28 - v8;
  __int128 v10 = a1[5];
  v28[4] = a1[4];
  v28[5] = v10;
  v29[0] = a1[6];
  *(_OWORD *)((char *)v29 + 9) = *(_OWORD *)((char *)a1 + 105);
  __int128 v11 = a1[1];
  v28[0] = *a1;
  v28[1] = v11;
  __int128 v12 = a1[3];
  v28[2] = a1[2];
  v28[3] = v12;
  __int128 v13 = *a2;
  __int128 v14 = a2[1];
  __int128 v15 = a2[3];
  v30[2] = a2[2];
  v30[3] = v15;
  v30[0] = v13;
  v30[1] = v14;
  __int128 v16 = a2[4];
  __int128 v17 = a2[5];
  __int128 v18 = a2[6];
  *(_OWORD *)((char *)v31 + 9) = *(__int128 *)((char *)a2 + 105);
  v30[5] = v17;
  v31[0] = v18;
  v30[4] = v16;
  type metadata accessor for HIDDeviceClient();
  swift_unownedRetainStrong();
  swift_unownedRetainStrong();
  sub_18915E0B0((uint64_t)v28);
  sub_18915E0B0((uint64_t)v30);
  char v19 = static HIDDeviceClient.== infix(_:_:)();
  swift_release();
  swift_release();
  if ((v19 & 1) == 0)
  {
    sub_18915EBC8((uint64_t)v30);
    sub_18915EBC8((uint64_t)v28);
    sub_18915F214((uint64_t)a1, (uint64_t)v9);
    sub_18915F214((uint64_t)a2, (uint64_t)v7);
    goto LABEL_5;
  }

  uint64_t v20 = *(void **)&v29[0];
  __int128 v21 = *(void **)&v31[0];
  type metadata accessor for IOHIDElement();
  sub_189160650( &qword_18C77A330,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
  id v22 = v20;
  id v23 = v21;
  char v24 = sub_18919A9A0();

  sub_18915EBC8((uint64_t)v30);
  sub_18915EBC8((uint64_t)v28);
  sub_18915F214((uint64_t)a1, (uint64_t)v9);
  sub_18915F214((uint64_t)a2, (uint64_t)v7);
  if ((v24 & 1) == 0)
  {
LABEL_5:
    char v26 = 0;
    goto LABEL_6;
  }

  sub_18915EE94(*(void *)&v9[*(int *)(v4 + 24)], *(void *)&v9[*(int *)(v4 + 24) + 8]);
  char v26 = v25;
LABEL_6:
  sub_18915F258((uint64_t)v9);
  sub_18915F258((uint64_t)v7);
  return v26 & 1;
}

uint64_t sub_18915F214(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HIDElement.Value();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_18915F258(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for HIDElement.Value();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void sub_18915F294(uint64_t a1)
{
}

unint64_t sub_18915F2C0()
{
  unint64_t result = qword_18C77A358;
  if (!qword_18C77A358)
  {
    unint64_t result = MEMORY[0x1895E1ED4](MEMORY[0x18961A4F0], MEMORY[0x18961A4C0]);
    atomic_store(result, (unint64_t *)&qword_18C77A358);
  }

  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(_BYTE *)(*(void *)(a1[3] - 8) + 82LL) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }

  return v1;
}

unint64_t sub_18915F340()
{
  unint64_t result = qword_18C77A368;
  if (!qword_18C77A368)
  {
    unint64_t result = MEMORY[0x1895E1ED4](MEMORY[0x189618568], MEMORY[0x189618560]);
    atomic_store(result, (unint64_t *)&qword_18C77A368);
  }

  return result;
}

unint64_t sub_18915F384()
{
  unint64_t result = qword_18C77A370;
  if (!qword_18C77A370)
  {
    unint64_t result = MEMORY[0x1895E1ED4](MEMORY[0x18961A8F8], MEMORY[0x18961A8C8]);
    atomic_store(result, (unint64_t *)&qword_18C77A370);
  }

  return result;
}

uint64_t sub_18915F3C8(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0LL;
      }
    }

    else
    {
      sub_18919A8EC();
      swift_allocObject();
      sub_18919A8C8();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_18919A94C();
        unint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0LL;
        *(void *)(result + 24) = v1;
      }

      else
      {
        return v1 << 32;
      }
    }
  }

  return result;
}

uint64_t sub_18915F464(uint64_t a1, uint64_t a2)
{
  return sub_18915C940(a1, a2, *(void *)(v2 + 16));
}

unint64_t sub_18915F48C()
{
  unint64_t result = qword_18C77A378;
  if (!qword_18C77A378)
  {
    unint64_t result = MEMORY[0x1895E1ED4](MEMORY[0x189618788], MEMORY[0x189618740]);
    atomic_store(result, (unint64_t *)&qword_18C77A378);
  }

  return result;
}

uint64_t sub_18915F4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HIDElement.Value();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

unint64_t sub_18915F514()
{
  unint64_t result = qword_18C77A390;
  if (!qword_18C77A390)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C77A388);
    unint64_t result = MEMORY[0x1895E1ED4](MEMORY[0x189618458], v1);
    atomic_store(result, (unint64_t *)&qword_18C77A390);
  }

  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895E1EC8](255LL, (char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_18915F5A8()
{
  unint64_t result = qword_18C77A398;
  if (!qword_18C77A398)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDElementCollection.CollectionType,  &type metadata for HIDElementCollection.CollectionType);
    atomic_store(result, (unint64_t *)&qword_18C77A398);
  }

  return result;
}

unint64_t sub_18915F5F0()
{
  unint64_t result = qword_18C77A3A0;
  if (!qword_18C77A3A0)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDElementCollection,  &type metadata for HIDElementCollection);
    atomic_store(result, (unint64_t *)&qword_18C77A3A0);
  }

  return result;
}

unint64_t sub_18915F638()
{
  unint64_t result = qword_18C77A3A8;
  if (!qword_18C77A3A8)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDElement, &type metadata for HIDElement);
    atomic_store(result, (unint64_t *)&qword_18C77A3A8);
  }

  return result;
}

uint64_t sub_18915F67C()
{
  return sub_189160650( &qword_18C77A3B0,  (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value,  (uint64_t)&protocol conformance descriptor for HIDElement.Value);
}

void destroy for HIDElementCollection(uint64_t a1)
{
}

uint64_t _s7CoreHID20HIDElementCollectionVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = swift_unownedRetain();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  uint64_t v4 = *(void **)(a2 + 16);
  *(void *)(a1 + 16) = v4;
  id v5 = v4;
  return a1;
}

uint64_t assignWithCopy for HIDElementCollection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = swift_unownedRetain();
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  int v4 = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_DWORD *)(a1 + 10) = v4;
  id v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = v5;
  id v7 = v5;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for HIDElementCollection(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  int v4 = *(void **)(a1 + 16);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for HIDElementCollection(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for HIDElementCollection(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HIDElementCollection()
{
  return &type metadata for HIDElementCollection;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDElementCollection.CollectionType( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDElementCollection.CollectionType( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF9) {
    return ((uint64_t (*)(void))((char *)&loc_18915F984 + 4 * byte_18919B6D5[v4]))();
  }
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_18915F9B8 + 4 * byte_18919B6D0[v4]))();
}

uint64_t sub_18915F9B8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18915F9C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18915F9C8LL);
  }
  return result;
}

uint64_t sub_18915F9D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x18915F9DCLL);
  }
  *(_BYTE *)__n128 result = a2 + 6;
  return result;
}

uint64_t sub_18915F9E0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18915F9E8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18915F9F4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_18915F9FC(_BYTE *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HIDElementCollection.CollectionType()
{
  return &type metadata for HIDElementCollection.CollectionType;
}

uint64_t initializeBufferWithCopyOfBuffer for HIDElement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for HIDElement(uint64_t a1)
{
}

uint64_t initializeWithCopy for HIDElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = swift_unownedRetain();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  int v4 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  uint64_t v5 = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 32) = v5;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  unsigned int v6 = *(void **)(a2 + 96);
  *(void *)(a1 + 96) = v6;
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  id v7 = v6;
  return a1;
}

uint64_t assignWithCopy for HIDElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = swift_unownedRetain();
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  int v4 = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_DWORD *)(a1 + 10) = v4;
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  int v5 = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = v5;
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  uint64_t v6 = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 32) = v6;
  uint64_t v7 = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 48) = v7;
  uint64_t v8 = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(void *)(a1 + 64) = v8;
  uint64_t v9 = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(void *)(a1 + 80) = v9;
  __int128 v10 = *(void **)(a2 + 96);
  __int128 v11 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = v10;
  id v12 = v10;

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  uint64_t v13 = *(void *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(void *)(a1 + 112) = v13;
  return a1;
}

__n128 __swift_memcpy121_8(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[1];
  __int128 v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  __int128 v6 = a2[5];
  __int128 v7 = a2[6];
  *(_OWORD *)(a1 + 105) = *(__int128 *)((char *)a2 + 105);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for HIDElement(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  int v4 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  int v5 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDElement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 121)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 96);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDElement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 120) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 121) = 1;
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
      *(void *)(result + 96) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 121) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HIDElement()
{
  return &type metadata for HIDElement;
}

uint64_t initializeBufferWithCopyOfBuffer for HIDElement.Value(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  uint64_t v5 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    *(void *)a1 = v5;
    a1 = v5 + ((v4 + 16LL) & ~(unint64_t)v4);
    swift_retain();
  }

  else
  {
    *(void *)a1 = swift_unownedRetain();
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    *(_DWORD *)(a1 + 10) = *(_DWORD *)((char *)a2 + 10);
    *(_BYTE *)(a1 + 14) = *((_BYTE *)a2 + 14);
    *(_WORD *)(a1 + 15) = *(_WORD *)((char *)a2 + 15);
    int v8 = *((_DWORD *)a2 + 6);
    *(_DWORD *)(a1 + 20) = *((_DWORD *)a2 + 5);
    *(_DWORD *)(a1 + 24) = v8;
    *(_BYTE *)(a1 + 28) = *((_BYTE *)a2 + 28);
    *(_WORD *)(a1 + 29) = *(_WORD *)((char *)a2 + 29);
    uint64_t v9 = a2[4];
    *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 48) = a2[6];
    *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
    *(void *)(a1 + 64) = a2[8];
    *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
    *(void *)(a1 + 80) = a2[10];
    *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
    __int128 v10 = (void *)a2[12];
    *(_BYTE *)(a1 + 104) = *((_BYTE *)a2 + 104);
    *(_BYTE *)(a1 + 105) = *((_BYTE *)a2 + 105);
    *(_BYTE *)(a1 + 120) = *((_BYTE *)a2 + 120);
    *(void *)(a1 + 112) = a2[14];
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = a1 + v11;
    uint64_t v13 = (uint64_t)a2 + v11;
    *(void *)(a1 + 96) = v10;
    uint64_t v14 = sub_18919ACC4();
    __int128 v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16LL);
    id v16 = v10;
    v15(v12, v13, v14);
    uint64_t v17 = *(int *)(a3 + 24);
    __int128 v18 = (uint64_t *)(a1 + v17);
    char v19 = (uint64_t *)((char *)a2 + v17);
    uint64_t v20 = *v19;
    unint64_t v21 = v19[1];
    sub_18915EC34(*v19, v21);
    *__int128 v18 = v20;
    v18[1] = v21;
  }

  return a1;
}

uint64_t destroy for HIDElement.Value(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  return sub_18915EC78(*(void *)(a1 + *(int *)(a2 + 24)), *(void *)(a1 + *(int *)(a2 + 24) + 8));
}

uint64_t initializeWithCopy for HIDElement.Value(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = swift_unownedRetain();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  int v6 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  uint64_t v7 = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 32) = v7;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  int v8 = *(void **)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  *(void *)(a1 + 96) = v8;
  uint64_t v12 = sub_18919ACC4();
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16LL);
  id v14 = v8;
  v13(v10, v11, v12);
  uint64_t v15 = *(int *)(a3 + 24);
  id v16 = (uint64_t *)(a1 + v15);
  uint64_t v17 = (uint64_t *)(a2 + v15);
  uint64_t v18 = *v17;
  unint64_t v19 = v17[1];
  sub_18915EC34(*v17, v19);
  uint64_t *v16 = v18;
  v16[1] = v19;
  return a1;
}

uint64_t assignWithCopy for HIDElement.Value(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = swift_unownedRetain();
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  int v6 = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_DWORD *)(a1 + 10) = v6;
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  int v7 = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_DWORD *)(a1 + 24) = v7;
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  uint64_t v8 = *(void *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 32) = v8;
  uint64_t v9 = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 48) = v9;
  uint64_t v10 = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(void *)(a1 + 64) = v10;
  uint64_t v11 = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(void *)(a1 + 80) = v11;
  uint64_t v12 = *(void **)(a2 + 96);
  uint64_t v13 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = v12;
  id v14 = v12;

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  uint64_t v15 = *(void *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(void *)(a1 + 112) = v15;
  uint64_t v16 = *(int *)(a3 + 20);
  uint64_t v17 = a1 + v16;
  uint64_t v18 = a2 + v16;
  uint64_t v19 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 24LL))(v17, v18, v19);
  uint64_t v20 = *(int *)(a3 + 24);
  unint64_t v21 = (uint64_t *)(a1 + v20);
  id v22 = (uint64_t *)(a2 + v20);
  uint64_t v23 = *v22;
  unint64_t v24 = v22[1];
  sub_18915EC34(*v22, v24);
  uint64_t v25 = *v21;
  unint64_t v26 = v21[1];
  *unint64_t v21 = v23;
  v21[1] = v24;
  sub_18915EC78(v25, v26);
  return a1;
}

_OWORD *initializeWithTake for HIDElement.Value(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  a1[6] = a2[6];
  *(_OWORD *)((char *)a1 + 105) = *(_OWORD *)((char *)a2 + 105);
  __int128 v7 = a2[1];
  *a1 = *a2;
  a1[1] = v7;
  __int128 v8 = a2[3];
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  a1[2] = a2[2];
  a1[3] = v8;
  uint64_t v12 = sub_18919ACC4();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for HIDElement.Value(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  swift_unownedRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_DWORD *)(a1 + 10) = *(_DWORD *)(a2 + 10);
  *(_BYTE *)(a1 + 14) = *(_BYTE *)(a2 + 14);
  *(_WORD *)(a1 + 15) = *(_WORD *)(a2 + 15);
  int v6 = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  *(_WORD *)(a1 + 29) = *(_WORD *)(a2 + 29);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  __int128 v7 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);

  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 105) = *(_BYTE *)(a2 + 105);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40LL))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = *(void *)(a1 + v12);
  unint64_t v14 = *(void *)(a1 + v12 + 8);
  *(_OWORD *)(a1 + v12) = *(_OWORD *)(a2 + v12);
  sub_18915EC78(v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDElement.Value()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_189160438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 96);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(sub_18915EC78(v3, v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = sub_18919ACC4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 20),  a2,  v8);
  }

uint64_t storeEnumTagSinglePayload for HIDElement.Value()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1891604C0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 96) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = sub_18919ACC4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 20),  a2,  a2,  v7);
  }

  return result;
}

uint64_t sub_189160534()
{
  uint64_t result = sub_18919ACC4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t sub_1891605B0()
{
  return sub_189160650( &qword_18C77A448,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A7388);
}

uint64_t sub_1891605DC()
{
  return sub_189160650( &qword_18C77A450,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73B0);
}

uint64_t sub_18916060C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_189160650(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = a2(255LL);
    uint64_t result = MEMORY[0x1895E1ED4](a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_189160690(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t HIDVirtualDevice.Properties.descriptor.getter()
{
  uint64_t v1 = *(void *)v0;
  sub_18915EC34(*(void *)v0, *(void *)(v0 + 8));
  return v1;
}

uint64_t HIDVirtualDevice.Properties.vendorID.getter()
{
  return *(unsigned int *)(v0 + 16);
}

unint64_t HIDVirtualDevice.Properties.productID.getter()
{
  return *(unsigned int *)(v0 + 20) | ((unint64_t)*(unsigned __int8 *)(v0 + 24) << 32);
}

uint64_t HIDVirtualDevice.Properties.transport.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  unint64_t v3 = *(void *)(v1 + 40);
  *a1 = v2;
  a1[1] = v3;
  return sub_189160730(v2, v3);
}

uint64_t sub_189160730(uint64_t a1, unint64_t a2)
{
  if (a2 != 13) {
    return sub_189160740(a1, a2);
  }
  return a1;
}

uint64_t sub_189160740(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xD) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t HIDVirtualDevice.Properties.product.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.manufacturer.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.modelNumber.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.versionNumber.getter()
{
  return *(void *)(v0 + 96);
}

uint64_t HIDVirtualDevice.Properties.serialNumber.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.uniqueID.getter()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDVirtualDevice.Properties.locationID.getter()
{
  return *(void *)(v0 + 144);
}

void HIDVirtualDevice.Properties.localizationCode.getter(_BYTE *a1@<X8>)
{
  *a1 = *(_BYTE *)(v1 + 153);
}

uint64_t sub_189160854()
{
  return 0LL;
}

uint64_t sub_18916085C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_189160864(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 160) = a1;
  return result;
}

uint64_t (*sub_18916088C())()
{
  return nullsub_1;
}

__n128 HIDVirtualDevice.Properties.init(descriptor:vendorID:productID:transport:product:manufacturer:modelNumber:versionNumber:serialNumber:uniqueID:locationID:localizationCode:extraProperties:)@<Q0>( uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, __int128 a11, uint64_t a12, char a13, __int128 a14, __int128 a15, uint64_t a16, char a17, char *a18, uint64_t a19)
{
  uint64_t v20 = *a5;
  unint64_t v21 = a5[1];
  char v32 = *a18;
  sub_18915EC34(a1, a2);
  sub_189160730(v20, v21);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a19)
  {
    uint64_t v24 = sub_189160C70(a19);
    swift_bridgeObjectRelease();
    uint64_t v25 = v24;
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  *(void *)&__int128 v37 = a1;
  *((void *)&v37 + 1) = a2;
  *(void *)&__int128 v38 = __PAIR64__(a4, a3);
  BYTE8(v38) = BYTE4(a4) & 1;
  *(void *)&__int128 v39 = v20;
  *((void *)&v39 + 1) = v21;
  v40.n128_u64[0] = a6;
  v40.n128_u64[1] = a7;
  *(void *)&__int128 v41 = a8;
  *((void *)&v41 + 1) = a10;
  __int128 v42 = a11;
  *(void *)&__int128 v43 = a12;
  BYTE8(v43) = a13 & 1;
  __int128 v44 = a14;
  __int128 v45 = a15;
  *(void *)&__int128 v46 = a16;
  BYTE8(v46) = a17 & 1;
  BYTE9(v46) = v32;
  uint64_t v47 = v25;
  sub_189160B04((uint64_t *)&v37);
  sub_18915EC78(a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_189160BA8(v20, v21);
  sub_189160BCC((uint64_t *)&v37);
  __int128 v26 = v46;
  *(_OWORD *)(a9 + 128) = v45;
  *(_OWORD *)(a9 + 144) = v26;
  *(void *)(a9 + 160) = v47;
  __int128 v27 = v42;
  *(_OWORD *)(a9 + 64) = v41;
  *(_OWORD *)(a9 + 80) = v27;
  __int128 v28 = v44;
  *(_OWORD *)(a9 + 96) = v43;
  *(_OWORD *)(a9 + 112) = v28;
  __int128 v29 = v38;
  *(_OWORD *)a9 = v37;
  *(_OWORD *)(a9 + 16) = v29;
  __n128 result = v40;
  *(_OWORD *)(a9 + 32) = v39;
  *(__n128 *)(a9 + 48) = result;
  return result;
}

uint64_t *sub_189160B04(uint64_t *a1)
{
  uint64_t v2 = a1[4];
  unint64_t v3 = a1[5];
  sub_18915EC34(*a1, a1[1]);
  sub_189160730(v2, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_189160BA8(uint64_t a1, unint64_t a2)
{
  if (a2 != 13) {
    return sub_189160BB8(a1, a2);
  }
  return a1;
}

uint64_t sub_189160BB8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xD) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_189160BCC(uint64_t *a1)
{
  uint64_t v2 = a1[4];
  unint64_t v3 = a1[5];
  sub_18915EC78(*a1, a1[1]);
  sub_189160BA8(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_189160C70(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x18961AFF0];
  uint64_t v31 = a1 + 64;
  uint64_t v32 = MEMORY[0x18961AFF0];
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v3);
  }
  else {
    uint64_t v4 = -1LL;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0LL;
  while (1)
  {
    if (v5)
    {
      unint64_t v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v11 = v10 | (v7 << 6);
      goto LABEL_25;
    }

    int64_t v12 = v7 + 1;
    if (__OFADD__(v7, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v12 >= v30) {
      goto LABEL_37;
    }
    unint64_t v13 = *(void *)(v31 + 8 * v12);
    int64_t v14 = v7 + 1;
    if (!v13)
    {
      int64_t v14 = v7 + 2;
      if (v7 + 2 >= v30) {
        goto LABEL_37;
      }
      unint64_t v13 = *(void *)(v31 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v7 + 3;
        if (v7 + 3 >= v30) {
          goto LABEL_37;
        }
        unint64_t v13 = *(void *)(v31 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v7 + 4;
          if (v7 + 4 >= v30) {
            goto LABEL_37;
          }
          unint64_t v13 = *(void *)(v31 + 8 * v14);
          if (!v13) {
            break;
          }
        }
      }
    }

LABEL_24:
    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    int64_t v7 = v14;
LABEL_25:
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8 * v11);
    unint64_t v20 = *(void *)(v2 + 16);
    if (*(void *)(v2 + 24) <= v20)
    {
      uint64_t v21 = v20 + 1;
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_1891637BC(v21, 1);
      uint64_t v2 = v32;
    }

    else
    {
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
    }

    sub_18919AE38();
    sub_18919AA90();
    uint64_t result = sub_18919AE74();
    uint64_t v22 = v2 + 64;
    uint64_t v23 = -1LL << *(_BYTE *)(v2 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v2 + 64 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v2 + 64 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v22 + 8 * v25);
      }

      while (v29 == -1);
      unint64_t v8 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v22 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v8;
    uint64_t v9 = (void *)(*(void *)(v2 + 48) + 16 * v8);
    void *v9 = v18;
    v9[1] = v17;
    *(void *)(*(void *)(v2 + 56) + 8 * v8) = v19;
    ++*(void *)(v2 + 16);
    uint64_t result = swift_unknownObjectRelease();
  }

  int64_t v15 = v7 + 5;
  if (v7 + 5 >= v30)
  {
LABEL_37:
    sub_18916594C();
    return v2;
  }

  unint64_t v13 = *(void *)(v31 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v7 + 5;
    goto LABEL_24;
  }

  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v14 >= v30) {
      goto LABEL_37;
    }
    unint64_t v13 = *(void *)(v31 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_24;
    }
  }

    unint64_t v5 = (v13 - 1) & v13;
    unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
    int64_t v7 = v14;
LABEL_25:
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8 * v11);
    unint64_t v20 = *(void *)(v2 + 16);
    if (*(void *)(v2 + 24) <= v20)
    {
      uint64_t v21 = v20 + 1;
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_189167BC0(v21, 1);
      uint64_t v2 = v32;
    }

    else
    {
      swift_unknownObjectRetain_n();
      swift_bridgeObjectRetain();
    }

    sub_18919AE38();
    sub_18919AA90();
    uint64_t result = sub_18919AE74();
    uint64_t v22 = v2 + 64;
    uint64_t v23 = -1LL << *(_BYTE *)(v2 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1LL << v24) & ~*(void *)(v2 + 64 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v8 = __clz(__rbit64((-1LL << v24) & ~*(void *)(v2 + 64 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0LL;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v22 + 8 * v25);
      }

      while (v29 == -1);
      unint64_t v8 = __clz(__rbit64(~v29)) + (v25 << 6);
    }

    *(void *)(v22 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v8;
    uint64_t v9 = (void *)(*(void *)(v2 + 48) + 16 * v8);
    void *v9 = v18;
    v9[1] = v17;
    *(void *)(*(void *)(v2 + 56) + 8 * v8) = v19;
    ++*(void *)(v2 + 16);
    uint64_t result = swift_unknownObjectRelease();
  }

  int64_t v15 = v7 + 5;
  if (v7 + 5 >= v30)
  {
LABEL_37:
    sub_18916594C();
    return v2;
  }

  unint64_t v13 = *(void *)(v31 + 8 * v15);
  if (v13)
  {
    int64_t v14 = v7 + 5;
    goto LABEL_24;
  }

  while (1)
  {
    int64_t v14 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v14 >= v30) {
      goto LABEL_37;
    }
    unint64_t v13 = *(void *)(v31 + 8 * v14);
    ++v15;
    if (v13) {
      goto LABEL_24;
    }
  }

LABEL_39:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t sub_189160F88()
{
  uint64_t v1 = *(void *)(v0 + 32);
  unint64_t v2 = *(void *)(v0 + 40);
  uint64_t v3 = *(void *)(v0 + 48);
  unint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);
  uint64_t v53 = *(void *)(v0 + 80);
  unint64_t v51 = *(void *)(v0 + 72);
  unint64_t v52 = *(void *)(v0 + 88);
  char v54 = *(_BYTE *)(v0 + 104);
  uint64_t v55 = *(void *)(v0 + 96);
  unint64_t v56 = *(void *)(v0 + 120);
  uint64_t v59 = *(void *)(v0 + 128);
  uint64_t v57 = *(void *)(v0 + 112);
  unint64_t v58 = *(void *)(v0 + 136);
  uint64_t v61 = *(void *)(v0 + 144);
  char v60 = *(_BYTE *)(v0 + 152);
  char v62 = *(_BYTE *)(v0 + 153);
  uint64_t v63 = *(void *)(v0 + 160);
  uint64_t v6 = sub_18919A964();
  uint64_t v7 = MEMORY[0x18961AFF0];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v7;
  sub_189163F28(v6, 0xD000000000000010LL, 0x80000001891A7E50LL, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_18919AE8C();
  char v10 = swift_isUniquelyReferenced_nonNull_native();
  sub_189163F28(v9, 0x4449726F646E6556LL, 0xE800000000000000LL, v10);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A490);
  uint64_t v11 = sub_18919ABC8();
  char v12 = swift_isUniquelyReferenced_nonNull_native();
  sub_189163F28(v11, 0x49746375646F7250LL, 0xE900000000000044LL, v12);
  uint64_t v13 = v7;
  swift_bridgeObjectRelease();
  if (v2 == 13) {
    uint64_t v14 = 0LL;
  }
  else {
    uint64_t v14 = v1;
  }
  if (v2 == 13) {
    unint64_t v15 = 12LL;
  }
  else {
    unint64_t v15 = v2;
  }
  uint64_t v64 = v14;
  unint64_t v65 = v15;
  sub_189160730(v1, v2);
  unint64_t v16 = sub_189185800(&v64);
  unint64_t v18 = v17;
  sub_189160BA8(v14, v15);
  uint64_t v64 = v16;
  unint64_t v65 = v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A498);
  uint64_t v19 = sub_18919ABC8();
  swift_bridgeObjectRelease();
  char v20 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v13;
  sub_189163F28(v19, 0x726F70736E617254LL, 0xE900000000000074LL, v20);
  uint64_t v21 = v64;
  swift_bridgeObjectRelease();
  uint64_t v64 = v3;
  unint64_t v65 = v4;
  uint64_t v22 = sub_18919ABC8();
  char v23 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v21;
  sub_189163F28(v22, 0x746375646F7250LL, 0xE700000000000000LL, v23);
  uint64_t v24 = v64;
  swift_bridgeObjectRelease();
  uint64_t v64 = v5;
  unint64_t v65 = v51;
  uint64_t v25 = sub_18919ABC8();
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v24;
  sub_189163F28(v25, 0x74636166756E614DLL, 0xEC00000072657275LL, v26);
  uint64_t v27 = v64;
  swift_bridgeObjectRelease();
  uint64_t v64 = v53;
  unint64_t v65 = v52;
  uint64_t v28 = sub_18919ABC8();
  char v29 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v27;
  sub_189163F28(v28, 0x6D754E6C65646F4DLL, 0xEB00000000726562LL, v29);
  uint64_t v30 = v64;
  swift_bridgeObjectRelease();
  uint64_t v64 = v55;
  LOBYTE(v65) = v54;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4A0);
  uint64_t v31 = sub_18919ABC8();
  char v32 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v30;
  sub_189163F28(v31, 0x4E6E6F6973726556LL, 0xED00007265626D75LL, v32);
  uint64_t v33 = v64;
  swift_bridgeObjectRelease();
  uint64_t v64 = v57;
  unint64_t v65 = v56;
  uint64_t v34 = sub_18919ABC8();
  char v35 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v33;
  sub_189163F28(v34, 0x754E6C6169726553LL, 0xEC0000007265626DLL, v35);
  uint64_t v36 = v64;
  swift_bridgeObjectRelease();
  uint64_t v64 = v59;
  unint64_t v65 = v58;
  uint64_t v37 = sub_18919ABC8();
  char v38 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v36;
  sub_189163F28(v37, 0xD000000000000016LL, 0x80000001891A7E70LL, v38);
  uint64_t v39 = v64;
  swift_bridgeObjectRelease();
  uint64_t v64 = v61;
  LOBYTE(v65) = v60;
  uint64_t v40 = sub_18919ABC8();
  char v41 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v39;
  sub_189163F28(v40, 0x6E6F697461636F4CLL, 0xEA00000000004449LL, v41);
  uint64_t v42 = v64;
  swift_bridgeObjectRelease();
  LOBYTE(v64) = v62;
  uint64_t v64 = sub_189185980((unsigned __int8 *)&v64);
  LOBYTE(v65) = v43 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4A8);
  uint64_t v44 = sub_18919ABC8();
  char v45 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v64 = v42;
  sub_189163F28(v44, 0x437972746E756F43LL, 0xEB0000000065646FLL, v45);
  uint64_t v46 = v64;
  swift_bridgeObjectRelease();
  uint64_t v47 = sub_18919AAE4();
  char v48 = swift_isUniquelyReferenced_nonNull_native();
  sub_189163F28(v47, 0x6E492D746C697542LL, 0xE800000000000000LL, v48);
  uint64_t v64 = v46;
  swift_bridgeObjectRelease();
  if (v63)
  {
    uint64_t v49 = MEMORY[0x1895F8858](v63);
    sub_189164378(v49, (void (*)(uint64_t, uint64_t, uint64_t))sub_189164084);
    return v64;
  }

  return v46;
}

void HIDVirtualDevice.deviceReference.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 112);
}

id sub_189161548()
{
  return *(id *)(v0 + 120);
}

double sub_189161550@<D0>(uint64_t a1@<X8>)
{
  *(void *)(a1 + 32) = 0LL;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_189161560@<X0>(uint64_t a1@<X8>)
{
  return sub_189164510(v1 + 128, a1);
}

uint64_t sub_1891615A8(uint64_t a1)
{
  return swift_endAccess();
}

uint64_t (*sub_1891615F8())()
{
  return j__swift_endAccess;
}

id sub_189161638()
{
  return *(id *)(v0 + 168);
}

uint64_t sub_189161640()
{
  return 0LL;
}

uint64_t sub_189161648()
{
  return *(unsigned __int8 *)(v0 + 192);
}

uint64_t sub_189161678(char a1)
{
  uint64_t result = swift_beginAccess();
  *(_BYTE *)(v1 + 192) = a1;
  return result;
}

uint64_t (*sub_1891616B4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1891616F0()
{
  return *(unsigned __int8 *)(v0 + 193);
}

uint64_t sub_189161720(char a1)
{
  uint64_t result = swift_beginAccess();
  *(_BYTE *)(v1 + 193) = a1;
  return result;
}

uint64_t (*sub_18916175C())()
{
  return j_j__swift_endAccess;
}

void HIDVirtualDevice.__allocating_init(properties:)(__int128 *a1)
{
}

void HIDVirtualDevice.init(properties:)(__int128 *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_18919AB74();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = sub_18919AB98();
  MEMORY[0x1895F8858](v8);
  uint64_t v9 = sub_18919A9D0();
  MEMORY[0x1895F8858](v9);
  __int128 v10 = a1[9];
  __int128 v63 = a1[8];
  __int128 v64 = v10;
  uint64_t v65 = *((void *)a1 + 20);
  __int128 v11 = a1[5];
  __int128 v59 = a1[4];
  __int128 v60 = v11;
  __int128 v12 = a1[7];
  __int128 v61 = a1[6];
  __int128 v62 = v12;
  __int128 v13 = a1[1];
  __int128 v55 = *a1;
  __int128 v14 = a1[2];
  __int128 v58 = a1[3];
  __int128 v56 = v13;
  __int128 v57 = v14;
  swift_defaultActor_initialize();
  *(_OWORD *)(v2 + 128) = 0u;
  *(_WORD *)(v2 + 192) = 0;
  *(_OWORD *)(v2 + 144) = 0u;
  *(void *)(v2 + 160) = 0LL;
  sub_189160F88();
  unint64_t v15 = (void *)sub_18919AA00();
  swift_bridgeObjectRelease();
  unint64_t v16 = (void *)MEMORY[0x1895E1A48](0LL, v15, 1LL);

  if (!v16) {
    goto LABEL_4;
  }
  io_registry_entry_t v17 = IOHIDUserDeviceCopyService();
  sub_189186E2C(v17, (uint64_t)&v51);
  if ((v52 & 1) != 0)
  {

LABEL_4:
    sub_189160BCC((uint64_t *)&v55);
    sub_189160690(v2 + 128, &qword_18C77A4B0);
    type metadata accessor for HIDVirtualDevice();
    swift_defaultActor_destroy();
    swift_deallocPartialClassInstance();
    return;
  }

  uint64_t v49 = v4;
  CFTypeRef v18 = v51;
  CFTypeRef v54 = v16;
  type metadata accessor for IOHIDUserDevice(0LL);
  uint64_t v20 = v19;
  id v46 = v16;
  sub_189185FFC((uint64_t)&v54, v20, (uint64_t)&v51);
  CFTypeRef v21 = v51;
  *(void *)(v2 + 112) = v18;
  *(void *)(v2 + 120) = v21;
  unint64_t v48 = sub_1891645D4();
  uint64_t v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A458);
  uint64_t v22 = swift_allocObject();
  __int128 v47 = xmmword_18919B6C0;
  *(_OWORD *)(v22 + 16) = xmmword_18919B6C0;
  uint64_t v23 = MEMORY[0x18961A910];
  *(void *)(v22 + 56) = MEMORY[0x18961A8C8];
  *(void *)(v22 + 64) = v23;
  *(void *)(v22 + 32) = v18;
  sub_18919AA78();
  sub_18919A9C4();
  CFTypeRef v51 = (CFTypeRef)MEMORY[0x18961AFE8];
  sub_1891646EC(&qword_18C77A4C0, 255LL, (uint64_t (*)(uint64_t))MEMORY[0x18961BA30], MEMORY[0x18961BA40]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4C8);
  sub_189164610();
  sub_18919AC28();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, *MEMORY[0x18961B908], v49);
  *(void *)(v2 + 168) = sub_18919ABA4();
  uint64_t v24 = (__IOHIDUserDevice *)*(id *)(v2 + 120);
  uint64_t v25 = (__CFString *)sub_18919AA6C();
  CFTypeRef v26 = IOHIDUserDeviceCopyProperty(v24, v25);

  if (v26)
  {
    CFTypeRef v51 = v26;
    swift_dynamicCast();
    uint64_t v27 = v53;
    uint64_t v28 = (__IOHIDUserDevice *)*(id *)(v2 + 120);
    char v29 = (__CFString *)sub_18919AA6C();
    CFTypeRef v30 = IOHIDUserDeviceCopyProperty(v28, v29);

    if (v30)
    {
      CFTypeRef v54 = v30;
      int v31 = swift_dynamicCast();
      int v32 = v50;
      int v33 = v31 ^ 1;
      if (!v31) {
        int v32 = 0;
      }
    }

    else
    {
      int v32 = 0;
      int v33 = 1;
    }

    uint64_t v34 = v46;
    uint64_t v35 = MEMORY[0x18961A8C8];
    uint64_t v36 = MEMORY[0x18961A910];
    HIDUsage.init(page:usage:)(v32 | (v33 << 16), v27, (uint64_t)&v54);
    int v37 = (int)v54;
    char v38 = BYTE4(v54);
    CFTypeRef v51 = 0LL;
    unint64_t v52 = 0xE000000000000000LL;
    sub_18919AC4C();
    sub_18919AA9C();
    BYTE4(v54) = v38;
    LODWORD(v54) = v37;
    sub_18915EB84();
    sub_18919ADB4();
    sub_18919AA9C();
    swift_bridgeObjectRelease();
    sub_18919AA9C();
    LODWORD(v54) = v56;
    sub_18919ADB4();
    sub_18919AA9C();
    swift_bridgeObjectRelease();
    sub_18919AA9C();
    sub_189160BCC((uint64_t *)&v55);
    int v39 = DWORD1(v56);
    if (BYTE8(v56)) {
      int v39 = 0;
    }
    LODWORD(v54) = v39;
    sub_18919ADB4();
    sub_18919AA9C();
    swift_bridgeObjectRelease();
    sub_18919AA9C();
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = v47;
    uint64_t v41 = *(void *)(v2 + 112);
    *(void *)(v40 + 56) = v35;
    *(void *)(v40 + 64) = v36;
    *(void *)(v40 + 32) = v41;
    uint64_t v42 = sub_18919AA78();
    uint64_t v44 = v43;

    swift_bridgeObjectRelease();
    *(void *)(v2 + 176) = v42;
    *(void *)(v2 + 184) = v44;
  }

  else
  {
    __break(1u);
  }

uint64_t HIDVirtualDevice.deinit()
{
  *(_BYTE *)(v0 + 193) = 1;
  swift_beginAccess();
  if (*(_BYTE *)(v0 + 192) != 1) {
    goto LABEL_3;
  }
  IOHIDUserDeviceCancel(*(IOHIDUserDeviceRef *)(v0 + 120));
  uint64_t v1 = *(dispatch_queue_s **)(v0 + 168);
  v4[4] = nullsub_1;
  v4[5] = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 1107296256LL;
  v4[2] = sub_189161FAC;
  v4[3] = &block_descriptor;
  uint64_t v2 = _Block_copy(v4);
  swift_release();
  dispatch_sync(v1, v2);
  _Block_release(v2);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
  {
    __break(1u);
  }

  else
  {
LABEL_3:

    sub_189160690(v0 + 128, &qword_18C77A4B0);
    swift_bridgeObjectRelease();
    swift_defaultActor_destroy();
    return v0;
  }

  return result;
}

uint64_t sub_189161FAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t HIDVirtualDevice.__deallocating_deinit()
{
  return swift_defaultActor_deallocate();
}

uint64_t sub_189161FE4(uint64_t a1)
{
  uint64_t v3 = *(__IOHIDUserDevice **)(v1 + 120);
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  unint64_t v15 = (uint64_t (*)(void))sub_189164698;
  uint64_t v16 = v4;
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v11 = MEMORY[0x1895F87A8];
  uint64_t v12 = 1107296256LL;
  __int128 v13 = (uint64_t (*)(uint64_t))sub_189162800;
  __int128 v14 = &block_descriptor_3;
  uint64_t v6 = _Block_copy(&v11);
  swift_release();
  IOHIDUserDeviceRegisterSetReportBlock(v3, v6);
  _Block_release(v6);
  uint64_t v7 = swift_allocObject();
  swift_weakInit();
  unint64_t v15 = (uint64_t (*)(void))sub_1891646A0;
  uint64_t v16 = v7;
  uint64_t v11 = v5;
  uint64_t v12 = 1107296256LL;
  __int128 v13 = (uint64_t (*)(uint64_t))sub_189162800;
  __int128 v14 = &block_descriptor_7;
  uint64_t v8 = _Block_copy(&v11);
  swift_release();
  IOHIDUserDeviceRegisterGetReportBlock(v3, v8);
  _Block_release(v8);
  unint64_t v15 = nullsub_1;
  uint64_t v16 = 0LL;
  uint64_t v11 = v5;
  uint64_t v12 = 1107296256LL;
  __int128 v13 = sub_189162E40;
  __int128 v14 = &block_descriptor_10;
  uint64_t v9 = _Block_copy(&v11);
  IOHIDUserDeviceSetCancelHandler(v3, v9);
  _Block_release(v9);
  IOHIDUserDeviceSetDispatchQueue(v3, *(dispatch_queue_t *)(v1 + 168));
  IOHIDUserDeviceActivate(v3);
  (*(void (**)(uint64_t))(*(void *)v1 + 176LL))(1LL);
  sub_1891646A8(a1, (uint64_t)&v11);
  return (*(uint64_t (**)(uint64_t *))(*(void *)v1 + 152LL))(&v11);
}

uint64_t sub_1891621A4(int a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A800);
  MEMORY[0x1895F8858](v8);
  __int128 v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = sub_18919A934();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x1895F8858](v11);
  __int128 v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return *(unsigned int *)sub_189185B38();
  }
  uint64_t v16 = Strong;
  int v31 = a1;
  int v32 = a2;
  dispatch_semaphore_t v30 = dispatch_semaphore_create(0LL);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, *MEMORY[0x189606B30], v11);
  sub_18919A928();
  if (a4)
  {
    sub_18919A8EC();
    swift_allocObject();
    swift_retain();
    uint64_t v17 = sub_18919A8A4();
    a4 = sub_189165798(v17, a4);
    unint64_t v19 = v18;
    swift_release();
  }

  else
  {
    CFTypeRef v21 = (void (*)(uint64_t, void))sub_18919A928();
    v21(a3, 0LL);
    swift_release();
    swift_release();
    unint64_t v19 = 0xC000000000000000LL;
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  type metadata accessor for HIDVirtualDevice.Context();
  uint64_t v22 = swift_allocObject();
  *(_DWORD *)(v22 + 16) = 0;
  uint64_t v23 = sub_18919AB20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56LL))(v10, 1LL, 1LL, v23);
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = 0LL;
  *(void *)(v24 + 24) = 0LL;
  *(void *)(v24 + 32) = v16;
  int v25 = v32;
  *(_DWORD *)(v24 + 40) = v31;
  *(_DWORD *)(v24 + 44) = v25;
  *(void *)(v24 + 48) = a4;
  *(void *)(v24 + 56) = v19;
  dispatch_semaphore_t v26 = v30;
  *(void *)(v24 + 64) = v22;
  *(void *)(v24 + 72) = v26;
  swift_retain();
  sub_18915EC34(a4, v19);
  swift_retain();
  uint64_t v27 = v26;
  sub_1891626B4((uint64_t)v10, (uint64_t)&unk_18C77A830, v24);
  swift_release();
  sub_18919AB80();
  swift_release();
  sub_18915EC78(a4, v19);

  uint64_t v20 = *(unsigned int *)(v22 + 16);
  swift_release();
  return v20;
}

uint64_t sub_189162454( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 80) = v10;
  *(void *)(v8 + 88) = v11;
  *(void *)(v8 + 64) = a7;
  *(void *)(v8 + 72) = a8;
  *(_DWORD *)(v8 + 120) = a5;
  *(_DWORD *)(v8 + 124) = a6;
  *(void *)(v8 + 56) = a4;
  *(void *)(v8 + 96) = *(void *)(*(void *)a4 + 144LL);
  return swift_task_switch();
}

uint64_t sub_18916248C()
{
  return swift_task_switch();
}

void sub_1891624D0()
{
  uint64_t v1 = *(void *)(v0 + 40);
  if (v1)
  {
    uint64_t v2 = *(unsigned int *)(v0 + 120);
    unsigned int v3 = *(_DWORD *)(v0 + 124);
    uint64_t v4 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
    sub_189185388(v2, (char *)(v0 + 132));
    if (v3 <= 0xFF)
    {
      HIDReportID.init(rawValue:)(*(unsigned int *)(v0 + 124), (_BYTE *)(v0 + 128));
      *(_BYTE *)(v0 + 130) = *(_BYTE *)(v0 + 128);
      *(_BYTE *)(v0 + 131) = *(_BYTE *)(v0 + 129);
      uint64_t v5 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v5;
      void *v5 = v0;
      v5[1] = sub_1891625B8;
      v6(*(void *)(v0 + 56), v0 + 132, v0 + 130, *(void *)(v0 + 64), *(void *)(v0 + 72), v1, v4);
      return;
    }

    __break(1u);
  }

  __break(1u);
}

uint64_t sub_1891625B8()
{
  *(void *)(*(void *)v1 + 112LL) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_18916261C()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_189162654()
{
  uint64_t v1 = *(void **)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  int v3 = sub_189185D28(v1);

  *(_DWORD *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v3;
  sub_18919AB8C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1891626B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919AB20();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1LL, v6) != 1)
  {
    sub_18919AB14();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }

  sub_189160690(a1, &qword_18C77A800);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_18919AAF0();
    swift_unknownObjectRelease();
  }

LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

        uint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    uint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    CFTypeRef v21 = *v20;
    uint64_t v22 = (-1LL << v3) - 1;
  }

  else
  {
    uint64_t v20 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v22 = *v20;
    CFTypeRef v21 = (-1LL << a1) - 1;
  }

  *uint64_t v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  uint64_t v24 = __OFSUB__(v23, 1LL);
  int v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }

  else
  {
    *(void *)(a2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }

uint64_t sub_189162804(int a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A800);
  MEMORY[0x1895F8858](v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (!Strong) {
    return *(unsigned int *)sub_189185B38();
  }
  uint64_t v12 = Strong;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  uint64_t v14 = *a4;
  _s7CoreHID16HIDVirtualDeviceC7ContextCMa_0();
  uint64_t v15 = swift_allocObject();
  *(_DWORD *)(v15 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0;
  *(void *)(v15 + 24) = v14;
  *(void *)(v15 + 32) = a3;
  uint64_t v16 = sub_18919AB20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56LL))(v10, 1LL, 1LL, v16);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(v17 + 24) = 0LL;
  *(void *)(v17 + 32) = v12;
  *(_DWORD *)(v17 + 40) = a1;
  *(_DWORD *)(v17 + 44) = a2;
  *(void *)(v17 + 48) = v15;
  *(void *)(v17 + 56) = v13;
  swift_retain();
  swift_retain();
  unint64_t v18 = v13;
  sub_1891626B4((uint64_t)v10, (uint64_t)&unk_18C77A810, v17);
  swift_release();
  sub_18919AB80();
  *a4 = *(void *)(v15 + 24);
  swift_release();

  uint64_t v19 = *(unsigned int *)(v15 + 16);
  swift_release();
  return v19;
}

uint64_t sub_189162998( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 64) = a7;
  *(void *)(v8 + 72) = a8;
  *(_DWORD *)(v8 + 120) = a5;
  *(_DWORD *)(v8 + 124) = a6;
  *(void *)(v8 + 56) = a4;
  *(void *)(v8 + 80) = *(void *)(*(void *)a4 + 144LL);
  return swift_task_switch();
}

uint64_t sub_1891629C4()
{
  return swift_task_switch();
}

void sub_189162A08()
{
  uint64_t v1 = *(void *)(v0 + 40);
  if (v1)
  {
    uint64_t v2 = *(unsigned int *)(v0 + 120);
    unsigned int v3 = *(_DWORD *)(v0 + 124);
    uint64_t v4 = *(void *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((void *)(v0 + 16), *(void *)(v0 + 40));
    sub_189185388(v2, (char *)(v0 + 132));
    if (v3 <= 0xFF)
    {
      uint64_t v5 = *(void *)(v0 + 64);
      HIDReportID.init(rawValue:)(*(unsigned int *)(v0 + 124), (_BYTE *)(v0 + 128));
      char v6 = *(_BYTE *)(v0 + 129);
      *(_BYTE *)(v0 + 130) = *(_BYTE *)(v0 + 128);
      *(_BYTE *)(v0 + 131) = v6;
      uint64_t v7 = *(void *)(v5 + 24);
      uint64_t v8 = (void *)swift_task_alloc();
      *(void *)(v0 + 88) = v8;
      *uint64_t v8 = v0;
      v8[1] = sub_189162AF8;
      v9(*(void *)(v0 + 56), v0 + 132, v0 + 130, v7, v1, v4);
      return;
    }

    __break(1u);
  }

  __break(1u);
}

uint64_t sub_189162AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)*v3;
  v4[12] = a1;
  v4[13] = a2;
  v4[14] = v2;
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_189162B68()
{
  uint64_t v1 = *(void *)(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __asm { BR              X11 }

uint64_t sub_189162BB0@<X0>(int a1@<W8>)
{
  if (*(void *)(*(void *)(v1 + 64) + 24LL) >= (uint64_t)*(unsigned __int8 *)(v1 + 110)) {
    __asm { BR              X10 }
  }

  uint64_t v2 = *(void *)(v1 + 96);
  unint64_t v3 = *(void *)(v1 + 104);
  sub_189165504();
  uint64_t v4 = (void *)swift_allocError();
  *(_DWORD *)uint64_t v5 = 9;
  *(_BYTE *)(v5 + 4) = 1;
  swift_willThrow();
  sub_18915EC78(v2, v3);
  uint64_t v6 = *(void *)(v1 + 64);
  LODWORD(v3) = sub_189185D28(v4);

  *(_DWORD *)(v6 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v3;
  sub_18919AB8C();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_189162D74()
{
  uint64_t v1 = *(void **)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 64);
  int v3 = sub_189185D28(v1);

  *(_DWORD *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v3;
  sub_18919AB8C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_189162DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v10 = v9(a2, a3, a4, a5);
  swift_release();
  return v10;
}

uint64_t sub_189162E40(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_189162E6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_189162E88()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4E0);
  uint64_t v5 = swift_slowAlloc();
  v0[6] = v5;
  sub_1891646EC( &qword_18C77A4E8,  v6,  (uint64_t (*)(uint64_t))type metadata accessor for HIDVirtualDevice,  (uint64_t)&protocol conformance descriptor for HIDVirtualDevice);
  uint64_t v7 = (void *)swift_task_alloc();
  v0[7] = v7;
  v7[2] = v5;
  v7[3] = v4;
  v7[4] = v3;
  v7[5] = v1;
  v7[6] = v2;
  uint64_t v8 = (void *)swift_task_alloc();
  v0[8] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_189162F94;
  return sub_18919ADD8();
}

uint64_t sub_189162F94()
{
  *(void *)(*(void *)v1 + 72LL) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_189163008()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_189163044()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_task_dealloc();
  MEMORY[0x1895E1F64](v1, -1LL, -1LL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_189163088(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4E0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t result = MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
    sub_189185BBC(a2, (uint64_t)&v13);
    if ((v15 & 1) != 0)
    {
      sub_18919AB08();
    }

    else
    {
      unint64_t v9 = v13 | ((unint64_t)v14 << 32);
      sub_189165504();
      uint64_t v10 = swift_allocError();
      *(_DWORD *)uint64_t v11 = v9;
      *(_BYTE *)(v11 + 4) = BYTE4(v9) & 1;
      uint64_t v12 = v10;
      sub_18919AAFC();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_18916318C(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t HIDVirtualDevice.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_1891631B0()
{
  return v0;
}

uint64_t static HIDVirtualDevice.== infix(_:_:)()
{
  return sub_18919A9A0() & 1;
}

uint64_t sub_189163234()
{
  return sub_18919A9A0() & 1;
}

void HIDVirtualDevice.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 120);
  type metadata accessor for IOHIDUserDevice(0LL);
  sub_1891646EC( &qword_18C77A4F0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice,  (uint64_t)&unk_18919BC70);
  id v2 = v1;
  sub_18919A9AC();
}

uint64_t HIDVirtualDevice.hashValue.getter()
{
  uint64_t v1 = *(void **)(v0 + 120);
  type metadata accessor for IOHIDUserDevice(0LL);
  sub_1891646EC( &qword_18C77A4F0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice,  (uint64_t)&unk_18919BC70);
  id v2 = v1;
  sub_18919A9AC();

  return sub_18919AE74();
}

uint64_t sub_1891633BC()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  id v2 = *(void **)(v1 + 120);
  type metadata accessor for IOHIDUserDevice(0LL);
  sub_1891646EC( &qword_18C77A4F0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice,  (uint64_t)&unk_18919BC70);
  id v3 = v2;
  sub_18919A9AC();

  return sub_18919AE74();
}

void sub_189163450()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 120LL);
  type metadata accessor for IOHIDUserDevice(0LL);
  sub_1891646EC( &qword_18C77A4F0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice,  (uint64_t)&unk_18919BC70);
  id v2 = v1;
  sub_18919A9AC();
}

uint64_t sub_1891634D8()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  id v2 = *(void **)(v1 + 120);
  type metadata accessor for IOHIDUserDevice(0LL);
  sub_1891646EC( &qword_18C77A4F0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice,  (uint64_t)&unk_18919BC70);
  id v3 = v2;
  sub_18919A9AC();

  return sub_18919AE74();
}

uint64_t HIDVirtualDevice.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 176);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_189163594()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 176LL);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1891635C4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891635D4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891635E4(uint64_t a1)
{
  return sub_18919A9B8();
}

uint64_t sub_189163620()
{
  return sub_18919A9AC();
}

uint64_t sub_189163668(uint64_t a1, uint64_t a2)
{
  return sub_18919AE74();
}

uint64_t sub_1891636C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18919A9A0();
}

uint64_t sub_18916370C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_189163770;
  return v6(a1);
}

uint64_t sub_189163770()
{
  uint64_t v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1891637BC(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A840);
  char v36 = a2;
  uint64_t v6 = sub_18919AD90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }

    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }

    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }

        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1LL)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }

        int64_t v13 = v24;
      }
    }

LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }

    sub_18919AE38();
    sub_18919AA90();
    uint64_t result = sub_18919AE74();
    uint64_t v14 = -1LL << *(_BYTE *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }

        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0LL;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }

      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }

    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }

  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v22 = -1LL << v33;
  }
  *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
LABEL_40:
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }

    sub_18919AE38();
    sub_18919AA90();
    uint64_t result = sub_18919AE74();
    uint64_t v14 = -1LL << *(_BYTE *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }

        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0LL;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }

      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }

    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }

  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v22 = -1LL << v33;
  }
  *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
LABEL_40:
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
    }

    sub_18919AE38();
    sub_18919AA90();
    uint64_t result = sub_18919AE74();
    uint64_t v14 = -1LL << *(_BYTE *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }

        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0LL;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }

      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }

    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }

  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v22 = -1LL << v33;
  }
  *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
LABEL_40:
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    sub_18919AE38();
    sub_18919AA90();
    uint64_t result = sub_18919AE74();
    uint64_t v14 = -1LL << *(_BYTE *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }

        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0LL;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }

      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }

    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }

  swift_release();
  id v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1LL << *(_BYTE *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v22 = -1LL << v33;
  }
  *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
LABEL_40:
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = 8 * v20;
    uint64_t v30 = *(void **)(*(void *)(v5 + 48) + v29);
    uint64_t v31 = *(void **)(*(void *)(v5 + 56) + v29);
    if ((a2 & 1) == 0)
    {
      uint64_t v32 = v30;
      uint64_t v33 = v31;
    }

    sub_18919AE38();
    type metadata accessor for IOHIDElement();
    sub_1891646EC( &qword_18C77A330,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
    sub_18919A9AC();
    uint64_t result = sub_18919AE74();
    uint64_t v14 = -1LL << *(_BYTE *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }

        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0LL;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }

      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }

    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
    unint64_t v18 = 8 * v17;
    *(void *)(*(void *)(v7 + 48) + v18) = v30;
    *(void *)(*(void *)(v7 + 56) + v18) = v31;
    ++*(void *)(v7 + 16);
  }

  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  int64_t v34 = 1LL << *(_BYTE *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    *uint64_t v22 = -1LL << v34;
  }
  *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
LABEL_40:
  uint64_t result = swift_release();
  *id v3 = v7;
  return result;
}

uint64_t sub_189163AD0(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A838);
  char v36 = a2;
  uint64_t v6 = sub_18919AD90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }

    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }

    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }

        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1LL)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }

        int64_t v13 = v24;
      }
    }

unint64_t sub_189163DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if (((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0)
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_18919ADCC() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }

      while (!v14 && (sub_18919ADCC() & 1) == 0);
    }
  }

  return v6;
}

unint64_t sub_189163EC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_18919AE74();
  return sub_189163DE4(a1, a2, v4);
}

uint64_t sub_189163F28(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_189163EC4(a2, a3);
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
    sub_189164124();
LABEL_7:
    unint64_t v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_unknownObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }

uint64_t sub_189164084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(uint64_t **)(v3 + 16);
  swift_unknownObjectRetain_n();
  swift_bridgeObjectRetain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v10 = *v7;
  *uint64_t v7 = 0x8000000000000000LL;
  sub_189163F28(a3, a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v7 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

void *sub_189164124()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A838);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_18919AD84();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(v2 + 16);
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
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_unknownObjectRetain();
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

  __break(1u);
  return result;
}

    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 8 * v15;
    unint64_t v21 = *(void *)(*(void *)(v2 + 56) + v20);
    int64_t v22 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v22 = v19;
    v22[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v20) = v21;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }

  BOOL v25 = v23 + 2;
  if (v25 >= v13) {
    goto LABEL_26;
  }
  int64_t v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    int64_t v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_25;
    }
  }

    uint64_t v19 = (v29 - 1) & v29;
    unint64_t v21 = __clz(__rbit64(v29)) + (v16 << 6);
LABEL_12:
    int64_t v22 = *(void *)(v35 + 72) * v21;
    sub_18919596C(*(void *)(v9 + 48) + v22, (uint64_t)v8, a1);
    unint64_t v23 = 16 * v21;
    int64_t v24 = *(void *)(v9 + 56) + 16 * v21;
    BOOL v25 = *(void *)v24;
    uint64_t v26 = *(unsigned __int8 *)(v24 + 8);
    sub_189198824((uint64_t)v8, *(void *)(v11 + 48) + v22, a1);
    BOOL v27 = *(void *)(v11 + 56) + v23;
    *(void *)BOOL v27 = v25;
    *(_BYTE *)(v27 + 8) = v26;
    uint64_t result = (void *)v36(v25, v26);
  }

  uint64_t v30 = v28 + 2;
  if (v30 >= v34) {
    goto LABEL_26;
  }
  uint64_t v29 = *(void *)(v33 + 8 * v30);
  if (v29)
  {
    uint64_t v16 = v30;
    goto LABEL_25;
  }

  while (1)
  {
    uint64_t v16 = v30 + 1;
    if (__OFADD__(v30, 1LL)) {
      break;
    }
    if (v16 >= v34) {
      goto LABEL_26;
    }
    uint64_t v29 = *(void *)(v33 + 8 * v16);
    ++v30;
    if (v29) {
      goto LABEL_25;
    }
  }

    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v__swift_destroy_boxed_opaque_existential_1(v0 + 16) = v17;
    *(void *)(*(void *)(v4 + 56) + v__swift_destroy_boxed_opaque_existential_1(v0 + 16) = v18;
    uint64_t v19 = v17;
    uint64_t result = v18;
  }

  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }

uint64_t sub_1891642D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t result = sub_18919A8BC();
  uint64_t v7 = result;
  if (result)
  {
    uint64_t result = sub_18919A8E0();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }

    v7 += a1 - result;
  }

  BOOL v8 = __OFSUB__(a2, a1);
  uint64_t v9 = a2 - a1;
  if (v8)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v10 = sub_18919A8D4();
  if (v10 >= v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v10;
  }
  uint64_t v12 = v7 + v11;
  if (v7) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = 0LL;
  }
  return a3(v7, v13);
}

uint64_t sub_189164378(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4 = a1 + 64;
  uint64_t v5 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  unint64_t v7 = v6 & *(void *)(a1 + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v10 = 0LL;
  while (1)
  {
    if (v7)
    {
      unint64_t v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }

    int64_t v17 = v10 + 1;
    if (__OFADD__(v10, 1LL))
    {
      __break(1u);
      goto LABEL_25;
    }

    if (v17 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      int64_t v10 = v17 + 1;
      if (v17 + 1 >= v8) {
        return swift_release();
      }
      unint64_t v18 = *(void *)(v4 + 8 * v10);
      if (!v18)
      {
        int64_t v10 = v17 + 2;
        if (v17 + 2 >= v8) {
          return swift_release();
        }
        unint64_t v18 = *(void *)(v4 + 8 * v10);
        if (!v18)
        {
          int64_t v10 = v17 + 3;
          if (v17 + 3 >= v8) {
            return swift_release();
          }
          unint64_t v18 = *(void *)(v4 + 8 * v10);
          if (!v18) {
            break;
          }
        }
      }
    }

LABEL_22:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    uint64_t v13 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v14 = *v13;
    uint64_t v15 = v13[1];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    a2(v14, v15, v16);
    swift_unknownObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
  }

  int64_t v19 = v17 + 4;
  if (v19 >= v8) {
    return swift_release();
  }
  unint64_t v18 = *(void *)(v4 + 8 * v19);
  if (v18)
  {
    int64_t v10 = v19;
    goto LABEL_22;
  }

  while (1)
  {
    int64_t v10 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v10 >= v8) {
      return swift_release();
    }
    unint64_t v18 = *(void *)(v4 + 8 * v10);
    ++v19;
    if (v18) {
      goto LABEL_22;
    }
  }

            sub_1891959B0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
LABEL_23:
            ++v26;
          }

          while (v26 != v104);
        }

        swift_bridgeObjectRelease();
LABEL_40:
        swift_release();
        goto LABEL_5;
      }

      sub_18919596C(v91, (uint64_t)v96, type metadata accessor for HIDDeviceClient.Notification);
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
      int64_t v24 = v97;
      sub_18919AB38();
      swift_release();
      (*(void (**)(char *, uint64_t))(v98 + 8))(v24, v99);
LABEL_5:
      uint64_t v14 = v84;
      if (v16 == v82) {
        return swift_bridgeObjectRelease();
      }
    }

    unint64_t v18 = MEMORY[0x1895E1604](v16, v14);
    int64_t v19 = __OFADD__(v16++, 1LL);
    if (!v19) {
      goto LABEL_12;
    }
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    uint64_t v15 = sub_18919AD78();
    uint64_t v14 = v84;
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_189164510(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_189164558(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for HIDVirtualDevice()
{
  return objc_opt_self();
}

void type metadata accessor for IOHIDUserDevice(uint64_t a1)
{
}

unint64_t sub_1891645D4()
{
  unint64_t result = qword_18C77A4B8;
  if (!qword_18C77A4B8)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_18C77A4B8);
  }

  return result;
}

unint64_t sub_189164610()
{
  unint64_t result = qword_18C77A4D0;
  if (!qword_18C77A4D0)
  {
    uint64_t v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_18C77A4C8);
    unint64_t result = MEMORY[0x1895E1ED4](MEMORY[0x189618470], v1);
    atomic_store(result, (unint64_t *)&qword_18C77A4D0);
  }

  return result;
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

uint64_t sub_189164674()
{
  return swift_deallocObject();
}

uint64_t sub_189164698(int a1, int a2, uint64_t a3, uint64_t a4)
{
  return sub_1891621A4(a1, a2, a3, a4);
}

uint64_t sub_1891646A0(int a1, int a2, uint64_t a3, uint64_t *a4)
{
  return sub_189162804(a1, a2, a3, a4);
}

uint64_t sub_1891646A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1891646EC(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = a3(a2);
    uint64_t result = MEMORY[0x1895E1ED4](a4, v7);
    atomic_store(result, a1);
  }

  return result;
}

void sub_18916472C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 24LL))(v3, a1, v5);
  __asm { BR              X10 }

uint64_t sub_1891647A4()
{
  uint64_t v8 = v0;
  __int16 v9 = v1;
  char v10 = BYTE2(v1);
  char v11 = BYTE3(v1);
  char v12 = BYTE4(v1);
  char v13 = BYTE5(v1);
  sub_189185E3C();
  uint64_t v2 = IOHIDUserDeviceHandleReportAsyncWithTimeStamp();
  uint64_t result = sub_189185BBC(v2, (uint64_t)&v7);
  if ((v7 & 0x10000000000LL) == 0)
  {
    unint64_t v4 = v7 | ((unint64_t)BYTE4(v7) << 32);
    sub_189165504();
    uint64_t v5 = swift_allocError();
    *(_DWORD *)uint64_t v6 = v4;
    *(_BYTE *)(v6 + 4) = BYTE4(v4) & 1;
    uint64_t v7 = v5;
    return sub_18919AAFC();
  }

  return result;
}

uint64_t sub_189164980(uint64_t a1, uint64_t a2)
{
  return sub_1891646EC( &qword_18C77A4F8,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for HIDVirtualDevice,  (uint64_t)&protocol conformance descriptor for HIDVirtualDevice);
}

uint64_t method lookup function for HIDVirtualDevice()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HIDVirtualDevice.__allocating_init(properties:)()
{
  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t dispatch thunk of HIDVirtualDevice.activate(delegate:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224LL))();
}

uint64_t dispatch thunk of HIDVirtualDevice.dispatchInputReport(data:timestamp:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_189164A48;
  return v10(a1, a2, a3);
}

uint64_t sub_189164A48()
{
  uint64_t v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t destroy for HIDVirtualDevice.Properties(uint64_t *a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HIDVirtualDevice.Properties(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_18915EC34(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  int v6 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  uint64_t v7 = (void *)(a2 + 32);
  unint64_t v8 = *(void *)(a2 + 40);
  if (v8 > 0xD)
  {
    *(void *)(a1 + 32) = *v7;
    *(void *)(a1 + 40) = v8;
    swift_bridgeObjectRetain();
  }

  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v7;
  }

  uint64_t v9 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v9;
  uint64_t v10 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v10;
  uint64_t v11 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  uint64_t v12 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v12;
  uint64_t v13 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v13;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_WORD *)(a1 + 152) = *(_WORD *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HIDVirtualDevice.Properties(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_18915EC34(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  sub_18915EC78(v6, v7);
  *(_DWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(_DWORD *)(a2 + 16);
  int v8 = *(_DWORD *)(a2 + 20);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_DWORD *)(a1 + 20) = v8;
  unint64_t v9 = *(void *)(a1 + 40);
  unint64_t v10 = *(void *)(a2 + 40);
  if (v9 == 13)
  {
    if (v10 >= 0xE) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

  if (v10 == 13)
  {
    sub_189164E10(a1 + 32);
    goto LABEL_11;
  }

  if (v9 >= 0xD)
  {
    if (v10 >= 0xD)
    {
      *(void *)(a1 + 32) = *(void *)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }

    sub_189164DDC(a1 + 32);
    goto LABEL_11;
  }

  if (v10 < 0xD)
  {
LABEL_11:
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
    goto LABEL_12;
  }

LABEL_8:
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
LABEL_12:
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(void *)(a1 + 96) = v11;
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 144);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(void *)(a1 + 144) = v12;
  *(_BYTE *)(a1 + 153) = *(_BYTE *)(a2 + 153);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

  *(void *)(a1 + 32) = *((void *)a2 + 4);
  *(void *)(a1 + 40) = *((void *)a2 + 5);
  swift_bridgeObjectRetain();
LABEL_12:
  *(void *)(a1 + 48) = *((void *)a2 + 6);
  *(void *)(a1 + 56) = *((void *)a2 + 7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 64) = *((void *)a2 + 8);
  *(void *)(a1 + 72) = *((void *)a2 + 9);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 80) = *((void *)a2 + 10);
  *(void *)(a1 + 88) = *((void *)a2 + 11);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v9 = *((void *)a2 + 12);
  *(_BYTE *)(a1 + 104) = *((_BYTE *)a2 + 104);
  *(void *)(a1 + 96) = v9;
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(void *)(a1 + 120) = *((void *)a2 + 15);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *((void *)a2 + 16);
  *(void *)(a1 + 136) = *((void *)a2 + 17);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  unint64_t v10 = *((void *)a2 + 18);
  *(_BYTE *)(a1 + 152) = *((_BYTE *)a2 + 152);
  *(void *)(a1 + 144) = v10;
  *(_BYTE *)(a1 + 153) = *((_BYTE *)a2 + 153);
  *(_BYTE *)(a1 + 154) = *((_BYTE *)a2 + 154);
  *(void *)(a1 + 160) = *((void *)a2 + 20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_189164DDC(uint64_t a1)
{
  return a1;
}

uint64_t sub_189164E10(uint64_t a1)
{
  return a1;
}

__n128 __swift_memcpy168_8(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[2];
  *(_OWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __int128 v4 = a2[3];
  __int128 v5 = a2[4];
  __int128 v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  __n128 result = (__n128)a2[7];
  __int128 v8 = a2[8];
  __int128 v9 = a2[9];
  *(void *)(a1 + 160) = *((void *)a2 + 20);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t assignWithTake for HIDVirtualDevice.Properties(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_18915EC78(v4, v5);
  int v6 = *(_DWORD *)(a2 + 20);
  *(_DWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 20) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  unint64_t v7 = (void *)(a2 + 32);
  unint64_t v8 = *(void *)(a1 + 40);
  unint64_t v9 = *(void *)(a2 + 40);
  if (v8 != 13)
  {
    if (v9 == 13)
    {
      sub_189164E10(a1 + 32);
    }

    else if (v8 >= 0xD)
    {
      if (v9 >= 0xD)
      {
        *(void *)(a1 + 32) = *v7;
        *(void *)(a1 + 40) = v9;
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }

      sub_189164DDC(a1 + 32);
    }
  }

  *(_OWORD *)(a1 + 32) = *(_OWORD *)v7;
LABEL_8:
  uint64_t v10 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v11;
  swift_bridgeObjectRelease();
  uint64_t v12 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v12;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  uint64_t v13 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v13;
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v14;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_WORD *)(a1 + 152) = *(_WORD *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDVirtualDevice.Properties(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 168)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 56);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDVirtualDevice.Properties( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 168) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 168) = 0;
    }
    if (a2) {
      *(void *)(result + 56) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HIDVirtualDevice.Properties()
{
  return &type metadata for HIDVirtualDevice.Properties;
}

void *initializeBufferWithCopyOfBuffer for HIDVirtualDevice.Properties.Property(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for HIDVirtualDevice.Properties.Property()
{
  return swift_unknownObjectRelease();
}

void *assignWithCopy for HIDVirtualDevice.Properties.Property(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *__n128 result = *a2;
  return result;
}

void *assignWithTake for HIDVirtualDevice.Properties.Property(void *a1, void *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDVirtualDevice.Properties.Property(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 8)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDVirtualDevice.Properties.Property(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 8) = 1;
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

    *(_BYTE *)(result + 8) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HIDVirtualDevice.Properties.Property()
{
  return &type metadata for HIDVirtualDevice.Properties.Property;
}

uint64_t dispatch thunk of HIDVirtualDeviceDelegate.hidVirtualDevice(_:receivedSetReportRequestOfType:id:data:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v7 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v15;
  *uint64_t v15 = v7;
  v15[1] = sub_1891659B0;
  return v17(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t dispatch thunk of HIDVirtualDeviceDelegate.hidVirtualDevice(_:receivedGetReportRequestOfType:id:maxSize:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_18916531C;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_18916531C(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

uint64_t type metadata accessor for HIDVirtualDevice.Context()
{
  return objc_opt_self();
}

uint64_t _s7CoreHID16HIDVirtualDeviceC7ContextCMa_0()
{
  return objc_opt_self();
}

uint64_t sub_1891653BC()
{
  return sub_1891646EC( &qword_18C77A7E8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice,  (uint64_t)&unk_18919BC08);
}

uint64_t sub_1891653EC()
{
  return sub_1891646EC( &qword_18C77A7F0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDUserDevice,  (uint64_t)&unk_18919BC30);
}

uint64_t sub_18916541C(uint64_t a1)
{
  uint64_t result = sub_189185E3C();
  if (a1)
  {
    uint64_t v3 = IOHIDUserDeviceHandleReportAsyncWithTimeStamp();
    uint64_t result = sub_189185BBC(v3, (uint64_t)&v6);
    if ((v8 & 1) == 0)
    {
      unint64_t v4 = v6 | ((unint64_t)v7 << 32);
      sub_189165504();
      swift_allocError();
      *(_DWORD *)uint64_t v5 = v4;
      *(_BYTE *)(v5 + 4) = BYTE4(v4) & 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4E0);
      return sub_18919AAFC();
    }
  }

  else
  {
    __break(1u);
  }

  return result;
}

unint64_t sub_189165504()
{
  unint64_t result = qword_18C77A7F8;
  if (!qword_18C77A7F8)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDDeviceError, &type metadata for HIDDeviceError);
    atomic_store(result, (unint64_t *)&qword_18C77A7F8);
  }

  return result;
}

uint64_t sub_189165548()
{
  return swift_deallocObject();
}

uint64_t sub_189165584()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  __int128 v4 = *(_OWORD *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 40);
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v3;
  *(void *)uint64_t v3 = v1;
  *(void *)(v3 + 8) = sub_1891659B0;
  *(_OWORD *)(v3 + 64) = v4;
  *(void *)(v3 + 120) = v5;
  *(void *)(v3 + 56) = v2;
  *(void *)(v3 + 80) = *(void *)(*(void *)v2 + 144LL);
  return swift_task_switch();
}

uint64_t sub_189165600()
{
  return swift_deallocObject();
}

uint64_t sub_189165624(uint64_t a1)
{
  __int128 v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1891659B0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_18C77A818 + dword_18C77A818))(a1, v4);
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1891656D8(_BYTE *__src, _BYTE *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0LL;
  }
  if ((v2 & 0x8000000000000000LL) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }

  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_189165798(uint64_t result, uint64_t a2)
{
  if (!a2)
  {
    swift_release();
    return 0LL;
  }

  if (a2 > 14)
  {
    sub_18919A94C();
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    *(void *)(v3 + 24) = a2;
    return v3;
  }

  if (a2 < 0)
  {
    __break(1u);
  }

  else
  {
    __int128 v4 = (_BYTE *)sub_18919A8BC();
    if (!v4)
    {
LABEL_10:
      uint64_t v5 = sub_18919A8D4();
      if (v5 >= a2) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = v5;
      }
      unsigned __int8 v7 = &v4[v6];
      if (v4) {
        char v8 = v7;
      }
      else {
        char v8 = 0LL;
      }
      uint64_t v3 = sub_1891656D8(v4, v8);
      swift_release();
      return v3;
    }

    unint64_t result = sub_18919A8E0();
    if (!__OFSUB__(0LL, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }

  __break(1u);
  return result;
}

uint64_t sub_18916587C()
{
  return swift_deallocObject();
}

uint64_t sub_1891658C0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  uint64_t v5 = swift_task_alloc();
  uint64_t v6 = *(void *)(v0 + 40);
  __int128 v7 = *(_OWORD *)(v0 + 64);
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
  *(void *)uint64_t v5 = v1;
  *(void *)(v5 + 8) = sub_189164A48;
  *(_OWORD *)(v5 + 80) = v7;
  *(void *)(v5 + 64) = v3;
  *(void *)(v5 + 72) = v4;
  *(void *)(v5 + 120) = v6;
  *(void *)(v5 + 56) = v2;
  *(void *)(v5 + 96) = *(void *)(*(void *)v2 + 144LL);
  return swift_task_switch();
}

uint64_t sub_18916594C()
{
  return swift_release();
}

void type metadata accessor for IOHIDReportType(uint64_t a1)
{
}

void sub_189165968(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }

void sub_1891659D4(uint64_t a1@<X8>)
{
  *(_DWORD *)a1 = 0;
  *(_BYTE *)(a1 + 4) = -2;
}

void HIDDeviceManager.DeviceMatchingCriteria.primaryUsage.getter(uint64_t a1@<X8>)
{
  int v2 = *v1;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)v1 + 4);
  *(_DWORD *)a1 = v2;
}

int *HIDDeviceManager.DeviceMatchingCriteria.primaryUsage.setter(int *result)
{
  int v2 = *result;
  *(_BYTE *)(v1 + 4) = *((_BYTE *)result + 4);
  *(_DWORD *)uint64_t v1 = v2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.primaryUsage.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.deviceUsages.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.deviceUsages.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.deviceUsages.modify())()
{
  return nullsub_1;
}

unint64_t HIDDeviceManager.DeviceMatchingCriteria.vendorID.getter()
{
  return *(unsigned int *)(v0 + 16) | ((unint64_t)*(unsigned __int8 *)(v0 + 20) << 32);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.vendorID.setter(uint64_t result)
{
  *(_DWORD *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = result;
  *(_BYTE *)(v1 + 20) = BYTE4(result) & 1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.vendorID.modify())()
{
  return nullsub_1;
}

unint64_t HIDDeviceManager.DeviceMatchingCriteria.productID.getter()
{
  return *(unsigned int *)(v0 + 24) | ((unint64_t)*(unsigned __int8 *)(v0 + 28) << 32);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.productID.setter(uint64_t result)
{
  *(_DWORD *)(v1 + 24) = result;
  *(_BYTE *)(v1 + 28) = BYTE4(result) & 1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.productID.modify())()
{
  return nullsub_1;
}

double sub_189165ADC@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = xmmword_18919BCB0;
  return result;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.transport.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = *(void *)(v1 + 32);
  unint64_t v3 = *(void *)(v1 + 40);
  *a1 = v2;
  a1[1] = v3;
  return sub_189160730(v2, v3);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.transport.setter(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t result = sub_189160BA8(*(void *)(v1 + 32), *(void *)(v1 + 40));
  *(void *)(v1 + 32) = v2;
  *(void *)(v1 + 40) = v3;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.transport.modify())()
{
  return nullsub_1;
}

uint64_t sub_189165B38()
{
  return 0LL;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.product.getter()
{
  uint64_t v1 = *(void *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.product.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.product.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.manufacturer.getter()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.manufacturer.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 64) = a1;
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.manufacturer.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.modelNumber.getter()
{
  uint64_t v1 = *(void *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.modelNumber.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.modelNumber.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.versionNumber.getter()
{
  return *(void *)(v0 + 96);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.versionNumber.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 96) = result;
  *(_BYTE *)(v2 + 104) = a2 & 1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.versionNumber.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.serialNumber.getter()
{
  uint64_t v1 = *(void *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.serialNumber.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 112) = a1;
  *(void *)(v2 + 120) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.serialNumber.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.uniqueID.getter()
{
  uint64_t v1 = *(void *)(v0 + 128);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.uniqueID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + 128) = a1;
  *(void *)(v2 + 136) = a2;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.uniqueID.modify())()
{
  return nullsub_1;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.locationID.getter()
{
  return *(void *)(v0 + 144);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.locationID.setter(uint64_t result, char a2)
{
  *(void *)(v2 + 144) = result;
  *(_BYTE *)(v2 + 152) = a2 & 1;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.locationID.modify())()
{
  return nullsub_1;
}

void sub_189165DCC(_BYTE *a1@<X8>)
{
  *a1 = 36;
}

void HIDDeviceManager.DeviceMatchingCriteria.localizationCode.getter(_BYTE *a1@<X8>)
{
  *a1 = *(_BYTE *)(v1 + 153);
}

_BYTE *HIDDeviceManager.DeviceMatchingCriteria.localizationCode.setter(_BYTE *result)
{
  *(_BYTE *)(v1 + 153) = *result;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.localizationCode.modify())()
{
  return nullsub_1;
}

uint64_t sub_189165E00()
{
  return 2LL;
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.isBuiltIn.getter()
{
  return *(unsigned __int8 *)(v0 + 154);
}

uint64_t HIDDeviceManager.DeviceMatchingCriteria.isBuiltIn.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 154) = result;
  return result;
}

uint64_t (*HIDDeviceManager.DeviceMatchingCriteria.isBuiltIn.modify())()
{
  return nullsub_1;
}

__n128 HIDDeviceManager.DeviceMatchingCriteria.init(primaryUsage:deviceUsages:vendorID:productID:transport:product:manufacturer:modelNumber:versionNumber:serialNumber:uniqueID:locationID:localizationCode:isBuiltIn:extraProperties:)@<Q0>( unsigned int *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, unint64_t a6@<X5>, unint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, __int128 a11, uint64_t a12, char a13, __int128 a14, __int128 a15, uint64_t a16, char a17, char *a18, char a19, uint64_t a20)
{
  unint64_t v22 = *a1 | ((unint64_t)*((unsigned __int8 *)a1 + 4) << 32);
  uint64_t v23 = *a5;
  unint64_t v24 = a5[1];
  char v31 = *a18;
  swift_bridgeObjectRetain();
  sub_189160730(v23, v24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (a20)
  {
    uint64_t v25 = sub_1891661E0(a20);
    swift_bridgeObjectRelease();
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  LODWORD(v37) = v22;
  BYTE4(v37) = BYTE4(v22);
  *((void *)&v37 + 1) = a2;
  LODWORD(v38) = a3;
  BYTE4(v38) = BYTE4(a3) & 1;
  DWORD2(v38) = a4;
  BYTE12(v38) = BYTE4(a4) & 1;
  *(void *)&__int128 v39 = v23;
  *((void *)&v39 + 1) = v24;
  v40.n128_u64[0] = a6;
  v40.n128_u64[1] = a7;
  *(void *)&__int128 v41 = a8;
  *((void *)&v41 + 1) = a10;
  __int128 v42 = a11;
  *(void *)&__int128 v43 = a12;
  BYTE8(v43) = a13 & 1;
  __int128 v44 = a14;
  __int128 v45 = a15;
  *(void *)&__int128 v46 = a16;
  BYTE8(v46) = a17 & 1;
  BYTE9(v46) = v31;
  BYTE10(v46) = a19;
  uint64_t v47 = v25;
  sub_1891660A0((uint64_t)&v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_189160BA8(v23, v24);
  swift_bridgeObjectRelease();
  sub_189166140((uint64_t)&v37);
  __int128 v26 = v46;
  *(_OWORD *)(a9 + 128) = v45;
  *(_OWORD *)(a9 + 144) = v26;
  *(void *)(a9 + 160) = v47;
  __int128 v27 = v42;
  *(_OWORD *)(a9 + 64) = v41;
  *(_OWORD *)(a9 + 80) = v27;
  __int128 v28 = v44;
  *(_OWORD *)(a9 + 96) = v43;
  *(_OWORD *)(a9 + 112) = v28;
  __int128 v29 = v38;
  *(_OWORD *)a9 = v37;
  *(_OWORD *)(a9 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v29;
  __n128 result = v40;
  *(_OWORD *)(a9 + 32) = v39;
  *(__n128 *)(a9 + 48) = result;
  return result;
}

uint64_t sub_1891660A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(a1 + 40);
  swift_bridgeObjectRetain();
  sub_189160730(v2, v3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_189166140(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(a1 + 40);
  swift_bridgeObjectRelease();
  sub_189160BA8(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1891661E0(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x18961AFF0];
  uint64_t v31 = a1 + 64;
  uint64_t v32 = MEMORY[0x18961AFF0];
  uint64_t v3 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v3);
  }
  else {
    uint64_t v4 = -1LL;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(63 - v3) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v7 = 0LL;
  while (1)
  {
    if (v5)
    {
      unint64_t v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v11 = v10 | (v7 << 6);
      goto LABEL_25;
    }

    int64_t v12 = v7 + 1;
    if (__OFADD__(v7, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v12 >= v30) {
      goto LABEL_37;
    }
    unint64_t v13 = *(void *)(v31 + 8 * v12);
    int64_t v14 = v7 + 1;
    if (!v13)
    {
      int64_t v14 = v7 + 2;
      if (v7 + 2 >= v30) {
        goto LABEL_37;
      }
      unint64_t v13 = *(void *)(v31 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = v7 + 3;
        if (v7 + 3 >= v30) {
          goto LABEL_37;
        }
        unint64_t v13 = *(void *)(v31 + 8 * v14);
        if (!v13)
        {
          int64_t v14 = v7 + 4;
          if (v7 + 4 >= v30) {
            goto LABEL_37;
          }
          unint64_t v13 = *(void *)(v31 + 8 * v14);
          if (!v13) {
            break;
          }
        }
      }
    }

unint64_t sub_1891664F8()
{
  unsigned int v1 = *((unsigned __int8 *)v0 + 4);
  uint64_t v2 = *v0;
  uint64_t v88 = *((void *)v0 + 1);
  char v3 = *((_BYTE *)v0 + 20);
  char v4 = *((_BYTE *)v0 + 28);
  uint64_t v79 = *((void *)v0 + 5);
  uint64_t v80 = *((void *)v0 + 4);
  uint64_t v5 = *((void *)v0 + 7);
  uint64_t v73 = *((void *)v0 + 6);
  uint64_t v74 = *((void *)v0 + 8);
  uint64_t v84 = *((void *)v0 + 9);
  uint64_t v75 = *((void *)v0 + 10);
  uint64_t v86 = *((void *)v0 + 11);
  uint64_t v71 = *((void *)v0 + 12);
  char v87 = *((_BYTE *)v0 + 104);
  uint64_t v76 = *((void *)v0 + 14);
  uint64_t v81 = *((void *)v0 + 15);
  uint64_t v6 = *((void *)v0 + 17);
  uint64_t v77 = *((void *)v0 + 16);
  uint64_t v72 = *((void *)v0 + 18);
  char v7 = *((_BYTE *)v0 + 152);
  int v82 = *((unsigned __int8 *)v0 + 154);
  char v83 = *((_BYTE *)v0 + 153);
  uint64_t v78 = *((void *)v0 + 20);
  uint64_t v8 = MEMORY[0x18961AFF0];
  uint64_t v92 = MEMORY[0x18961AFF0];
  uint64_t v9 = sub_18919AA6C();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_189163F28(v9, 0x6469766F72504F49LL, 0xEF7373616C437265LL, isUniquelyReferenced_nonNull_native);
  uint64_t v11 = v8;
  swift_bridgeObjectRelease();
  if (v1 >> 1 <= 0x7EuLL)
  {
    unint64_t v12 = v2 & 0xFFFFFF00FFFFFFFFLL | ((unint64_t)v1 << 32);
    uint64_t v13 = v8;
    HIDUsage.page.getter();
    uint64_t v14 = sub_18919AE80();
    char v15 = swift_isUniquelyReferenced_nonNull_native();
    HIDWORD(v90) = HIDWORD(v13);
    sub_189163F28(v14, 0xD000000000000010LL, 0x80000001891A7EB0LL, v15);
    swift_bridgeObjectRelease();
    BYTE4(v90) = BYTE4(v12);
    LODWORD(v90) = v12;
    HIDUsage.usage.getter();
    if ((v16 & 0x10000) != 0)
    {
      uint64_t v11 = v13;
    }

    else
    {
      HIDUsage.usage.getter();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A870);
      uint64_t v17 = sub_18919ABC8();
      char v18 = swift_isUniquelyReferenced_nonNull_native();
      sub_189163F28(v17, 0x557972616D697250LL, 0xEC00000065676173LL, v18);
      uint64_t v11 = v13;
      swift_bridgeObjectRelease();
    }
  }

  if ((v3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A490);
    uint64_t v19 = sub_18919ABC8();
    char v20 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v11;
    sub_189163F28(v19, 0x4449726F646E6556LL, 0xE800000000000000LL, v20);
    swift_bridgeObjectRelease();
  }

  uint64_t v21 = v88;
  if ((v4 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A490);
    uint64_t v22 = sub_18919ABC8();
    char v23 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v11;
    sub_189163F28(v22, 0x49746375646F7250LL, 0xE900000000000044LL, v23);
    swift_bridgeObjectRelease();
  }

  uint64_t v90 = (void *)v80;
  uint64_t v91 = v79;
  sub_189185800((uint64_t *)&v90);
  if (v24)
  {
    uint64_t v25 = sub_18919AA6C();
    swift_bridgeObjectRelease();
    char v26 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v11;
    sub_189163F28(v25, 0x726F70736E617254LL, 0xE900000000000074LL, v26);
    uint64_t v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }

  if (v5)
  {
    uint64_t v90 = (void *)v73;
    uint64_t v91 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A498);
    uint64_t v27 = sub_18919ABC8();
    uint64_t v28 = v92;
    char v29 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v28;
    sub_189163F28(v27, 0x746375646F7250LL, 0xE700000000000000LL, v29);
    uint64_t v92 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }

  if (v84)
  {
    uint64_t v90 = (void *)v74;
    uint64_t v91 = v84;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A498);
    uint64_t v30 = sub_18919ABC8();
    char v31 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v11;
    sub_189163F28(v30, 0x74636166756E614DLL, 0xEC00000072657275LL, v31);
    uint64_t v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }

  if (v86)
  {
    uint64_t v90 = (void *)v75;
    uint64_t v91 = v86;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A498);
    uint64_t v32 = sub_18919ABC8();
    char v33 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v11;
    sub_189163F28(v32, 0x6D754E6C65646F4DLL, 0xEB00000000726562LL, v33);
    uint64_t v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }

  if ((v87 & 1) == 0)
  {
    uint64_t v90 = (void *)v71;
    LOBYTE(v91) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4A0);
    uint64_t v34 = sub_18919ABC8();
    char v35 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v11;
    sub_189163F28(v34, 0x4E6E6F6973726556LL, 0xED00007265626D75LL, v35);
    uint64_t v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }

  if (v81)
  {
    uint64_t v90 = (void *)v76;
    uint64_t v91 = v81;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A498);
    uint64_t v36 = sub_18919ABC8();
    char v37 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v11;
    sub_189163F28(v36, 0x754E6C6169726553LL, 0xEC0000007265626DLL, v37);
    uint64_t v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }

  if (v6)
  {
    uint64_t v90 = (void *)v77;
    uint64_t v91 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A498);
    uint64_t v38 = sub_18919ABC8();
    char v39 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v11;
    sub_189163F28(v38, 0xD000000000000016LL, 0x80000001891A7E70LL, v39);
    uint64_t v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }

  if ((v7 & 1) == 0)
  {
    uint64_t v90 = (void *)v72;
    LOBYTE(v91) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4A0);
    uint64_t v40 = sub_18919ABC8();
    char v41 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v11;
    sub_189163F28(v40, 0x6E6F697461636F4CLL, 0xEA00000000004449LL, v41);
    uint64_t v11 = (uint64_t)v90;
    swift_bridgeObjectRelease();
  }

  LOBYTE(v90) = v83;
  sub_189185980((unsigned __int8 *)&v90);
  if ((v42 & 1) != 0)
  {
    if (v82 == 2) {
      goto LABEL_27;
    }
  }

  else
  {
    uint64_t v43 = sub_18919AB68();
    uint64_t v44 = v92;
    char v45 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v90 = (void *)v44;
    sub_189163F28(v43, 0x437972746E756F43LL, 0xEB0000000065646FLL, v45);
    uint64_t v92 = (uint64_t)v90;
    swift_bridgeObjectRelease();
    if (v82 == 2)
    {
LABEL_27:
      if (!v88) {
        goto LABEL_43;
      }
      goto LABEL_31;
    }
  }

  LOBYTE(v90) = v82;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A868);
  uint64_t v46 = sub_18919ABC8();
  uint64_t v47 = v92;
  char v48 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v90 = (void *)v47;
  sub_189163F28(v46, 0x6E492D746C697542LL, 0xE800000000000000LL, v48);
  uint64_t v92 = (uint64_t)v90;
  swift_bridgeObjectRelease();
  if (!v88)
  {
LABEL_43:
    if (v78)
    {
      uint64_t v68 = MEMORY[0x1895F8858](v78);
      sub_189164378(v68, (void (*)(uint64_t, uint64_t, uint64_t))sub_189164084);
    }

    if (*(void *)(v92 + 16))
    {
      swift_bridgeObjectRetain();
      uint64_t v69 = sub_18919AA00();
      swift_bridgeObjectRelease();
      char v70 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v90 = (void *)v11;
      sub_189163F28(v69, 0x7265706F72504F49LL, 0xEF686374614D7974LL, v70);
      uint64_t v11 = (uint64_t)v90;
      swift_bridgeObjectRelease();
    }

    swift_bridgeObjectRelease();
    return v11;
  }

LABEL_31:
  uint64_t v49 = *(void *)(v88 + 16);
  if (!v49) {
    goto LABEL_43;
  }
  uint64_t v85 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A850);
  swift_bridgeObjectRetain();
  unsigned __int16 v50 = (void *)MEMORY[0x18961AFE8];
  uint64_t v51 = 32LL;
  while (1)
  {
    uint64_t v52 = *(unsigned __int8 *)(v21 + v51 + 4);
    uint64_t v53 = *(unsigned int *)(v21 + v51);
    BYTE4(v90) = v52;
    LODWORD(v90) = v53;
    uint64_t v89 = (unsigned __int16)HIDUsage.page.getter();
    CFTypeRef v54 = (void *)sub_18919ADA8();
    swift_retain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_189163EC4(0x7355656369766544LL, 0xEF65676150656761LL);
    if ((v56 & 1) != 0) {
      break;
    }
    v54[(result >> 6) + 8] |= 1LL << result;
    __int128 v57 = (void *)(v54[6] + 16 * result);
    *__int128 v57 = 0x7355656369766544LL;
    v57[1] = 0xEF65676150656761LL;
    *(void *)(v54[7] + 8 * result) = v89;
    uint64_t v58 = v54[2];
    BOOL v59 = __OFADD__(v58, 1LL);
    uint64_t v60 = v58 + 1;
    if (v59) {
      goto LABEL_49;
    }
    v54[2] = v60;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A858);
    swift_arrayDestroy();
    swift_release();
    BYTE4(v90) = (v53 | (unint64_t)(v52 << 32)) >> 32;
    LODWORD(v90) = v53;
    HIDUsage.usage.getter();
    if ((v61 & 0x10000) == 0)
    {
      uint64_t v62 = (unsigned __int16)v61;
      char v63 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v90 = v54;
      sub_1891682FC(v62, 0x7355656369766544LL, 0xEB00000000656761LL, v63);
      CFTypeRef v54 = v90;
      swift_bridgeObjectRelease();
    }

    uint64_t v21 = v88;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unsigned __int16 v50 = sub_1891681DC(0LL, v50[2] + 1LL, 1, v50);
    }
    unint64_t v65 = v50[2];
    unint64_t v64 = v50[3];
    if (v65 >= v64 >> 1) {
      unsigned __int16 v50 = sub_1891681DC((void *)(v64 > 1), v65 + 1, 1, v50);
    }
    v50[2] = v65 + 1;
    v50[v65 + 4] = v54;
    v51 += 6LL;
    if (!--v49)
    {
      swift_bridgeObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A860);
      uint64_t v66 = sub_18919AAB4();
      swift_bridgeObjectRelease();
      char v67 = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v90 = (void *)v85;
      sub_189163F28(v66, 0xD000000000000010LL, 0x80000001891A8140LL, v67);
      uint64_t v11 = (uint64_t)v90;
      swift_bridgeObjectRelease();
      goto LABEL_43;
    }
  }

  __break(1u);
LABEL_49:
  __break(1u);
  return result;
}

    __break(1u);
    JUMPOUT(0x1891920ACLL);
  }

  uint64_t v17 = v16[7] + 16 * v7;
  sub_189198D78(*(id *)v17, *(_BYTE *)(v17 + 8));
  *(void *)uint64_t v17 = v3;
  *(_BYTE *)(v17 + 8) = 0;
LABEL_12:
  uint64_t v24 = *(void *)(v0 + 320);
  uint64_t v25 = *(void *)(v0 + 328);
  *(void *)(v0 + 144) = v16;
  swift_bridgeObjectRelease();
  sub_1891959B0(v24, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  sub_1891959B0(v25, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  char v26 = *(void *)(v0 + 440) + 1LL;
  if (v26 == *(void *)(v0 + 432))
  {
LABEL_13:
    uint64_t v27 = swift_bridgeObjectRelease();
    char v29 = *(void *)(v0 + 416);
    uint64_t v28 = *(void **)(v0 + 424);
    char v31 = *(void *)(v0 + 400);
    uint64_t v30 = *(void *)(v0 + 408);
    uint64_t v32 = *(void **)(v0 + 256);
    (*(void (**)(uint64_t))(**(void **)(v0 + 288) + 808LL))(v27);
    char v33 = *(void *)(v0 + 144);
    *uint64_t v32 = *(void *)(v0 + 136);
    v32[1] = v33;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x1895E1F64](v31, -1LL, -1LL);
    MEMORY[0x1895E1F64](v30, -1LL, -1LL);
    MEMORY[0x1895E1F64](v29, -1LL, -1LL);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v34 = (uint64_t *)(v0 + 232);
  while (1)
  {
    *(void *)(v0 + 440) = v26;
    char v37 = *(void *)(v0 + 424);
    sub_1891646A8(*(void *)(v0 + 264) + 40 * v26 + 32, v0 + 16);
    if (v37)
    {
      char v35 = *(id *)(v0 + 424);
      swift_willThrow();
      uint64_t v36 = *(void **)(v0 + 424);
      sub_18918DB6C(v0 + 16, v36);

      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      goto LABEL_16;
    }

    uint64_t v38 = *(void *)(v0 + 376);
    sub_1891646A8(v0 + 16, v0 + 56);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C77ABB8);
    char v39 = swift_dynamicCast();
    uint64_t v40 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v38 + 56);
    if (v39) {
      break;
    }
    char v41 = *(void *)(v0 + 360);
    char v42 = *(void *)(v0 + 312);
    v40(v41, 1LL, 1LL, *(void *)(v0 + 368));
    sub_189160690(v41, &qword_18C77ABB0);
    sub_1891646A8(v0 + 16, v0 + 96);
    uint64_t v43 = swift_dynamicCast();
    uint64_t v44 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56);
    if (v43)
    {
      uint64_t v52 = *(void *)(v0 + 328);
      CFTypeRef v54 = *(void *)(v0 + 296);
      uint64_t v53 = *(void *)(v0 + 304);
      v44(v54, 0LL, 1LL, v53);
      sub_189198824(v54, v52, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      char v56 = *(void *)(v52 + *(int *)(v53 + 20));
      __int128 v57 = *(void *)(v56 + 16);
      uint64_t v58 = MEMORY[0x18961AFE8];
      if (v57)
      {
        *uint64_t v34 = MEMORY[0x18961AFE8];
        swift_bridgeObjectRetain();
        sub_18919AC88();
        BOOL v59 = 128LL;
        do
        {
          uint64_t v60 = *(id *)(v56 + v59);
          sub_18919AC70();
          sub_18919AC94();
          sub_18919ACA0();
          sub_18919AC7C();
          v59 += 128LL;
          --v57;
        }

        while (v57);
        uint64_t v58 = *v34;
        swift_bridgeObjectRelease();
      }

      *(void *)(v0 + 472) = v58;
      uint64_t v62 = *(void *)(v0 + 408);
      int v61 = *(void *)(v0 + 416);
      char v63 = *(void *)(v0 + 392);
      unint64_t v64 = *(void *)(v0 + 288);
      sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v55,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
      unint64_t v65 = (void *)swift_task_alloc();
      *(void *)(v0 + 480) = v65;
      v65[2] = v62;
      v65[3] = v64;
      v65[4] = v58;
      v65[5] = v61;
      v65[6] = v63;
      uint64_t v66 = (void *)swift_task_alloc();
      *(void *)(v0 + 488) = v66;
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABD0);
      *uint64_t v66 = v0;
      v66[1] = sub_189190B10;
      return sub_18919ADD8();
    }

    char v45 = *(void *)(v0 + 296);
    v44(v45, 1LL, 1LL, *(void *)(v0 + 304));
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    sub_189160690(v45, &qword_18C77ABA8);
LABEL_16:
    char v26 = *(void *)(v0 + 440) + 1LL;
    if (v26 == *(void *)(v0 + 432)) {
      goto LABEL_13;
    }
  }

  uint64_t v46 = *(void *)(v0 + 384);
  char v48 = *(void *)(v0 + 360);
  uint64_t v47 = *(void *)(v0 + 368);
  v40(v48, 0LL, 1LL, v47);
  sub_189198824(v48, v46, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  *(void *)(v0 + 168) = MEMORY[0x18961AFF0];
  unsigned __int16 v50 = *(void *)(v46 + *(int *)(v47 + 20));
  if (*(void *)(v50 + 16))
  {
    uint64_t v51 = v50
        + ((*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL));
    swift_bridgeObjectRetain();
    char v67 = *(void *)(v0 + 352);
    uint64_t v68 = *(void *)(v0 + 336);
    sub_18919596C(v51, v67, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
    __asm { BR              X9 }
  }

  uint64_t v69 = *(void *)(v0 + 400);
  char v70 = *(void *)(v0 + 392);
  uint64_t v71 = *(void *)(v0 + 384);
  uint64_t v72 = *(void *)(v0 + 288);
  sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v49,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  uint64_t v73 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v73;
  v73[2] = v69;
  v73[3] = v72;
  v73[4] = v0 + 168;
  v73[5] = v70;
  v73[6] = v0 + 136;
  v73[7] = v71;
  uint64_t v74 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v74;
  *uint64_t v74 = v0;
  v74[1] = sub_18918F6B4;
  return sub_18919ADD8();
}

uint64_t sub_189166FA4()
{
  uint64_t v0 = sub_18919AB74();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1895F8858](v0);
  char v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_18919AB98();
  uint64_t v5 = (uint64_t (*)(uint64_t))MEMORY[0x18961BA30];
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = sub_18919A9D0();
  MEMORY[0x1895F8858](v6);
  sub_189168600(0LL, (unint64_t *)&qword_18C77A4B8);
  sub_18919A9C4();
  v8[1] = MEMORY[0x18961AFE8];
  sub_1891646EC(&qword_18C77A4C0, 255LL, v5, MEMORY[0x18961BA40]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4C8);
  sub_189164610();
  sub_18919AC28();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x18961B908], v0);
  return sub_18919ABA4();
}

id sub_18916715C()
{
  return *(id *)(v0 + 112);
}

uint64_t HIDDeviceManager.__allocating_init()()
{
  uint64_t v0 = swift_allocObject();
  HIDDeviceManager.init()();
  return v0;
}

uint64_t HIDDeviceManager.init()()
{
  uint64_t v1 = sub_18919AB74();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v1);
  uint64_t v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v5 = sub_18919AB98();
  uint64_t v6 = (uint64_t (*)(uint64_t))MEMORY[0x18961BA30];
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = sub_18919A9D0();
  MEMORY[0x1895F8858](v7);
  swift_defaultActor_initialize();
  sub_189168600(0LL, (unint64_t *)&qword_18C77A4B8);
  sub_18919A9C4();
  v9[1] = MEMORY[0x18961AFE8];
  sub_1891646EC(&qword_18C77A4C0, 255LL, v6, MEMORY[0x18961BA40]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4C8);
  sub_189164610();
  sub_18919AC28();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x18961B908], v1);
  *(void *)(v0 + 112) = sub_18919ABA4();
  return v0;
}

uint64_t sub_189167364(uint64_t a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A878);
  MEMORY[0x1895F8858](v3);
  uint64_t v8 = v1;
  uint64_t v9 = a1;
  (*(void (**)(_BYTE *, void))(v5 + 104))( &v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL)],  *MEMORY[0x18961BE60]);
  return sub_18919AB5C();
}

void sub_189167410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A9F8);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  IONotificationPortRef v10 = IONotificationPortCreate(*MEMORY[0x1896086A8]);
  if (!v10) {
    __break(1u);
  }
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  type metadata accessor for HIDDeviceManager.Context();
  unint64_t v12 = (void *)swift_allocObject();
  v12[2] = v11;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))( (uint64_t)v12 + OBJC_IVAR____TtCFFC7CoreHID16HIDDeviceManager20monitorNotificationsFT16matchingCriteriaGSaVS0_22DeviceMatchingCriteria__GVs19AsyncThrowingStreamOS0_12NotificationPs5Error__U_FGVS2_12ContinuationS3_PS4____T_L_7Context_continuation,  v9,  v6);
  IONotificationPortSetDispatchQueue(v11, *(dispatch_queue_t *)(a2 + 112));
  swift_retain();
  sub_18919AB2C();
  uint64_t v13 = *(void *)(a3 + 16);
  if (v13)
  {
    v33[0] = v6;
    v33[1] = a1;
    swift_bridgeObjectRetain();
    __int128 v14 = *(_OWORD *)(a3 + 176);
    __int128 v44 = *(_OWORD *)(a3 + 160);
    __int128 v45 = v14;
    uint64_t v46 = *(void *)(a3 + 192);
    __int128 v15 = *(_OWORD *)(a3 + 112);
    __int128 v40 = *(_OWORD *)(a3 + 96);
    __int128 v41 = v15;
    __int128 v16 = *(_OWORD *)(a3 + 144);
    __int128 v42 = *(_OWORD *)(a3 + 128);
    __int128 v43 = v16;
    __int128 v17 = *(_OWORD *)(a3 + 48);
    __int128 v36 = *(_OWORD *)(a3 + 32);
    __int128 v37 = v17;
    __int128 v18 = *(_OWORD *)(a3 + 80);
    uint64_t v19 = v13 - 1;
    uint64_t v20 = 200LL;
    __int128 v38 = *(_OWORD *)(a3 + 64);
    __int128 v39 = v18;
    while (1)
    {
      sub_1891664F8();
      uint64_t v21 = (void *)sub_18919AA00();
      swift_bridgeObjectRelease();
      io_iterator_t notification = 0;
      uint64_t v22 = v21;
      uint64_t v23 = IOServiceAddMatchingNotification( v11,  "IOServiceFirstMatch",  v22,  (IOServiceMatchingCallback)sub_1891678E8,  v12,  &notification);
      sub_189185BBC(v23, (uint64_t)&v35);
      if ((v35 & 0x10000000000LL) == 0)
      {
        unint64_t v30 = v35 | ((unint64_t)BYTE4(v35) << 32);
        swift_bridgeObjectRelease();
        sub_189165504();
        uint64_t v31 = swift_allocError();
        *(_DWORD *)uint64_t v32 = v30;
        *(_BYTE *)(v32 + 4) = BYTE4(v30) & 1;
        uint64_t v35 = v31;
        sub_18919AB44();
        swift_release();

        return;
      }

      sub_189167734(notification, (IONotificationPortRef *)v12);

      if (!v19) {
        break;
      }
      __int128 v24 = *(_OWORD *)(a3 + v20 + 144);
      __int128 v44 = *(_OWORD *)(a3 + v20 + 128);
      __int128 v45 = v24;
      uint64_t v46 = *(void *)(a3 + v20 + 160);
      __int128 v25 = *(_OWORD *)(a3 + v20 + 80);
      __int128 v40 = *(_OWORD *)(a3 + v20 + 64);
      __int128 v41 = v25;
      __int128 v26 = *(_OWORD *)(a3 + v20 + 112);
      __int128 v42 = *(_OWORD *)(a3 + v20 + 96);
      __int128 v43 = v26;
      __int128 v27 = *(_OWORD *)(a3 + v20 + 16);
      __int128 v36 = *(_OWORD *)(a3 + v20);
      __int128 v29 = *(_OWORD *)(a3 + v20 + 32);
      __int128 v28 = *(_OWORD *)(a3 + v20 + 48);
      v20 += 168LL;
      --v19;
      __int128 v39 = v28;
      __int128 v37 = v27;
      __int128 v38 = v29;
    }

    swift_release();
    swift_bridgeObjectRelease();
  }

  else
  {
    swift_release();
  }

uint64_t sub_189167734(io_iterator_t a1, IONotificationPortRef *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AA00);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v7 = (char *)&notification[-2] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  swift_retain();
  io_object_t v8 = IOIteratorNext(a1);
  if (v8)
  {
    io_registry_entry_t v9 = v8;
    do
    {
      sub_189186E2C(v9, (uint64_t)notification);
      if ((v13 & 1) == 0)
      {
        char v13 = 0;
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A9F8);
        sub_18919AB38();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        notification[0] = 0;
        IOServiceAddInterestNotification( a2[2],  v9,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_1891678E4,  a2,  notification);
      }

      io_registry_entry_t v9 = IOIteratorNext(a1);
    }

    while (v9);
  }

  return swift_release();
}

IONotificationPortRef *sub_1891678E8(IONotificationPortRef *result, io_iterator_t a2)
{
  if (result) {
    return (IONotificationPortRef *)sub_189167734(a2, result);
  }
  __break(1u);
  return result;
}

uint64_t HIDDeviceManager.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t HIDDeviceManager.__deallocating_deinit()
{
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t HIDDeviceManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t static HIDDeviceManager.== infix(_:_:)()
{
  return sub_18919ABB0() & 1;
}

uint64_t sub_1891679A4()
{
  return sub_18919ABB0() & 1;
}

void HIDDeviceManager.hash(into:)()
{
  id v1 = *(id *)(v0 + 112);
  sub_18919ABBC();
}

uint64_t HIDDeviceManager.hashValue.getter()
{
  id v1 = *(id *)(v0 + 112);
  sub_18919ABBC();

  return sub_18919AE74();
}

uint64_t sub_189167A88()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  id v2 = *(id *)(v1 + 112);
  sub_18919ABBC();

  return sub_18919AE74();
}

void sub_189167AD8()
{
  id v1 = *(id *)(*(void *)v0 + 112LL);
  sub_18919ABBC();
}

uint64_t sub_189167B20()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  id v2 = *(id *)(v1 + 112);
  sub_18919ABBC();

  return sub_18919AE74();
}

uint64_t sub_189167B6C()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtCFFC7CoreHID16HIDDeviceManager20monitorNotificationsFT16matchingCriteriaGSaVS0_22DeviceMatchingCriteria__GVs19AsyncThrowingStreamOS0_12NotificationPs5Error__U_FGVS2_12ContinuationS3_PS4____T_L_7Context_continuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A9F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_189167BC0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AA10);
  char v36 = a2;
  uint64_t v6 = sub_18919AD90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }

    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }

    if (v21 >= v34) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }

        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1LL)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }

        int64_t v13 = v24;
      }
    }

uint64_t sub_189167ED4(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A850);
  char v37 = a2;
  uint64_t v6 = sub_18919AD90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }

    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }

    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }

        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1LL)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }

        int64_t v13 = v24;
      }
    }

void *sub_1891681DC(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AA08);
    unint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    _OWORD v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }

  else
  {
    unint64_t v10 = (void *)MEMORY[0x18961AFE8];
  }

  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A860);
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1891682FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_189163EC4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_18916844C();
LABEL_7:
    __int128 v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(void *)(v18[7] + 8 * v12) = a1;
      return result;
    }

void *sub_18916844C()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A850);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_18919AD84();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }

  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(v2 + 16);
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

    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v23 >= v13) {
      goto LABEL_26;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24) {
        break;
      }
    }

void sub_1891685F8(uint64_t a1)
{
}

uint64_t sub_189168600(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }

  return result;
}

uint64_t sub_189168638(uint64_t a1, uint64_t a2)
{
  return sub_1891646EC( &qword_18C77A888,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceManager,  (uint64_t)&protocol conformance descriptor for HIDDeviceManager);
}

uint64_t type metadata accessor for HIDDeviceManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for HIDDeviceManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HIDDeviceManager.__allocating_init()()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of HIDDeviceManager.monitorNotifications(matchingCriteria:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 104LL))();
}

uint64_t destroy for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1)
{
  if (*(void *)(a1 + 40) >= 0xEuLL) {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  uint64_t v4 = (void *)(a2 + 32);
  unint64_t v5 = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  if (v5 > 0xD)
  {
    *(void *)(a1 + 32) = *v4;
    *(void *)(a1 + 40) = v5;
    swift_bridgeObjectRetain();
  }

  else
  {
    *(_OWORD *)(a1 + 32) = *(_OWORD *)v4;
  }

  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  uint64_t v8 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v8;
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  uint64_t v10 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v10;
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_WORD *)(a1 + 153) = *(_WORD *)(a2 + 153);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1, int *a2)
{
  int v4 = *a2;
  *(_BYTE *)(a1 + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)a1 = v4;
  *(void *)(a1 + 8) = *((void *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  int v5 = a2[4];
  *(_BYTE *)(a1 + 20) = *((_BYTE *)a2 + 20);
  *(_DWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
  int v6 = a2[6];
  *(_BYTE *)(a1 + 28) = *((_BYTE *)a2 + 28);
  *(_DWORD *)(a1 + 24) = v6;
  unint64_t v7 = *(void *)(a1 + 40);
  unint64_t v8 = *((void *)a2 + 5);
  if (v7 == 13)
  {
    if (v8 >= 0xE) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

  if (v8 == 13)
  {
    sub_189164E10(a1 + 32);
    goto LABEL_11;
  }

  if (v7 >= 0xD)
  {
    if (v8 >= 0xD)
    {
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      *(void *)(a1 + 40) = *((void *)a2 + 5);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }

    sub_189164DDC(a1 + 32);
    goto LABEL_11;
  }

  if (v8 < 0xD)
  {
LABEL_11:
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    goto LABEL_12;
  }

uint64_t assignWithTake for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 28) = *(_BYTE *)(a2 + 28);
  int v4 = (void *)(a2 + 32);
  unint64_t v5 = *(void *)(a1 + 40);
  unint64_t v6 = *(void *)(a2 + 40);
  if (v5 != 13)
  {
    if (v6 == 13)
    {
      sub_189164E10(a1 + 32);
    }

    else if (v5 >= 0xD)
    {
      if (v6 >= 0xD)
      {
        *(void *)(a1 + 32) = *v4;
        *(void *)(a1 + 40) = v6;
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }

      sub_189164DDC(a1 + 32);
    }
  }

  *(_OWORD *)(a1 + 32) = *(_OWORD *)v4;
LABEL_8:
  uint64_t v7 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  uint64_t v9 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v9;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  uint64_t v10 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v10;
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)(a2 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v11;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_WORD *)(a1 + 153) = *(_WORD *)(a2 + 153);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceManager.DeviceMatchingCriteria(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 168)) {
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

uint64_t storeEnumTagSinglePayload for HIDDeviceManager.DeviceMatchingCriteria( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 168) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 168) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceManager.DeviceMatchingCriteria()
{
  return &type metadata for HIDDeviceManager.DeviceMatchingCriteria;
}

ValueMetadata *type metadata accessor for HIDDeviceManager.DeviceMatchingCriteria.Property()
{
  return &type metadata for HIDDeviceManager.DeviceMatchingCriteria.Property;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDDeviceManager.Notification(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDDeviceManager.Notification( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 9) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 9) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 8) = -(char)a2;
    }
  }

  return result;
}

uint64_t sub_189168D1C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_189168D24(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceManager.Notification()
{
  return &type metadata for HIDDeviceManager.Notification;
}

uint64_t sub_189168D40()
{
  return type metadata accessor for HIDDeviceManager.Context();
}

uint64_t type metadata accessor for HIDDeviceManager.Context()
{
  uint64_t result = qword_18C77BFE8;
  if (!qword_18C77BFE8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_189168D84()
{
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_189168E00()
{
  if (!qword_18C77A968)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_18C77A970);
    unint64_t v0 = sub_18919AB50();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_18C77A968);
    }
  }

void sub_189168E68()
{
}

uint64_t sub_189168E70(uint64_t a1, io_registry_entry_t a2, int a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AA00);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = MEMORY[0x1895F8858](v6);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3 == -536870896)
  {
    uint64_t result = sub_189186E2C(a2, (uint64_t)&v12);
    if ((v13 & 1) == 0)
    {
      if (a1)
      {
        uint64_t v11 = v12;
        swift_retain();
        uint64_t v12 = v11;
        char v13 = 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A9F8);
        sub_18919AB38();
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      }

      else
      {
        __break(1u);
      }
    }
  }

  return result;
}

uint64_t HIDUsage.page.getter()
{
  return ((uint64_t (*)(uint64_t))((char *)sub_189168F9C
                                          + 4 * aA[*(unsigned __int8 *)(v0 + 4) >> 2]))(1LL);
}

uint64_t sub_189168F9C()
{
  return 2LL;
}

uint64_t sub_189168FA4()
{
  return 3LL;
}

uint64_t sub_189168FAC()
{
  return 4LL;
}

uint64_t sub_189168FB4()
{
  return 5LL;
}

uint64_t sub_189168FBC()
{
  return 6LL;
}

uint64_t sub_189168FC4()
{
  return 7LL;
}

uint64_t sub_189168FCC()
{
  return 8LL;
}

uint64_t sub_189168FD4()
{
  return 9LL;
}

uint64_t sub_189168FDC()
{
  return 10LL;
}

uint64_t sub_189168FE4()
{
  return 11LL;
}

uint64_t sub_189168FEC()
{
  return 12LL;
}

uint64_t sub_189168FF4()
{
  return 13LL;
}

uint64_t sub_189168FFC()
{
  return 14LL;
}

uint64_t sub_189169004()
{
  return 15LL;
}

uint64_t sub_18916900C()
{
  return 17LL;
}

uint64_t sub_189169014()
{
  return 18LL;
}

uint64_t sub_18916901C()
{
  return 20LL;
}

uint64_t sub_189169024()
{
  return 32LL;
}

uint64_t sub_18916902C()
{
  return 64LL;
}

uint64_t sub_189169034()
{
  return 65LL;
}

uint64_t sub_18916903C()
{
  return 89LL;
}

uint64_t sub_189169044()
{
  return 128LL;
}

uint64_t sub_18916904C()
{
  return 129LL;
}

uint64_t sub_189169054()
{
  return 130LL;
}

uint64_t sub_18916905C()
{
  return 132LL;
}

uint64_t sub_189169064()
{
  return 133LL;
}

uint64_t sub_18916906C()
{
  return 140LL;
}

uint64_t sub_189169074()
{
  return 141LL;
}

uint64_t sub_18916907C()
{
  return 142LL;
}

uint64_t sub_189169084()
{
  return 144LL;
}

uint64_t sub_18916908C()
{
  return 145LL;
}

uint64_t sub_189169094()
{
  return 61904LL;
}

uint64_t sub_18916909C@<X0>(uint64_t a1@<X8>)
{
  return a1;
}

void *sub_1891690A4()
{
  return &unk_1891A12F8;
}

void *sub_1891690B0()
{
  return &unk_1891A12FA;
}

void *sub_1891690BC()
{
  return &unk_1891A12FC;
}

void *sub_1891690C8()
{
  return &unk_1891A12FE;
}

void *sub_1891690D4()
{
  return &unk_1891A1300;
}

void *sub_1891690E0()
{
  return &unk_1891A1302;
}

const __int16 *sub_1891690EC()
{
  return asc_1891A1304;
}

__int16 *sub_1891690F8()
{
  return &asc_1891A1304[1];
}

__int16 *sub_189169104()
{
  return &asc_1891A1304[2];
}

__int16 *sub_189169110()
{
  return &asc_1891A1304[3];
}

__int16 *sub_18916911C()
{
  return &asc_1891A1304[4];
}

void *sub_189169128()
{
  return &unk_1891A130E;
}

void *sub_189169134()
{
  return &unk_1891A1310;
}

void *sub_189169140()
{
  return &unk_1891A1312;
}

void *sub_18916914C()
{
  return &unk_1891A1314;
}

void *sub_189169158()
{
  return &unk_1891A1316;
}

void *sub_189169164()
{
  return &unk_1891A1318;
}

void *sub_189169170()
{
  return &unk_1891A131A;
}

const __int16 *sub_18916917C()
{
  return aAy;
}

__int16 *sub_189169188()
{
  return &aAy[1];
}

__int16 *sub_189169194()
{
  return &aAy[2];
}

__int16 *sub_1891691A0()
{
  return &aAy[3];
}

void *sub_1891691AC()
{
  return &unk_1891A1324;
}

void *sub_1891691B8()
{
  return &unk_1891A1326;
}

void *sub_1891691C4()
{
  return &unk_1891A1328;
}

void *sub_1891691D0()
{
  return &unk_1891A132A;
}

void *sub_1891691DC()
{
  return &unk_1891A132C;
}

void *sub_1891691E8()
{
  return &unk_1891A132E;
}

void *sub_1891691F4()
{
  return &unk_1891A1330;
}

void *sub_189169200()
{
  return &unk_1891A1332;
}

void *sub_18916920C()
{
  return &unk_1891A1334;
}

void *sub_189169218()
{
  return &unk_1891A1336;
}

void *sub_189169224()
{
  return &unk_1891A1338;
}

void HIDUsage.usage.getter()
{
  __asm { BR              X11 }

uint64_t sub_18916925C()
{
  if (v0 != 114) {
    __asm { BR              X12 }
  }

  return 0x10000LL;
}

uint64_t HIDUsage.GenericDesktopUsage.rawValue.getter()
{
  return word_1891A5542[*v0];
}

uint64_t HIDUsage.SimulationControlsUsage.rawValue.getter()
{
  return word_1891A5626[*v0];
}

uint64_t HIDUsage.VRControlsUsage.rawValue.getter()
{
  return word_1891A568C[*v0];
}

uint64_t HIDUsage.SportControlsUsage.rawValue.getter()
{
  return word_1891A56A4[*v0];
}

uint64_t HIDUsage.GameControlsUsage.rawValue.getter()
{
  return word_1891A56E8[*v0];
}

uint64_t HIDUsage.GenericDeviceControlsUsage.rawValue.getter()
{
  return word_1891A5722[*v0];
}

uint64_t HIDUsage.KeyboardOrKeypadUsage.rawValue.getter()
{
  return ((uint64_t (*)(uint64_t))((char *)sub_189171758 + 4 * word_18919D3FE[*v0]))(1LL);
}

uint64_t sub_189171758()
{
  return 2LL;
}

uint64_t sub_189171760()
{
  return 3LL;
}

uint64_t sub_189171768()
{
  return 4LL;
}

uint64_t sub_189171770()
{
  return 5LL;
}

uint64_t sub_189171778()
{
  return 6LL;
}

uint64_t sub_189171780()
{
  return 7LL;
}

uint64_t sub_189171788()
{
  return 8LL;
}

uint64_t sub_189171790()
{
  return 9LL;
}

uint64_t sub_189171798()
{
  return 10LL;
}

uint64_t sub_1891717A0()
{
  return 11LL;
}

uint64_t sub_1891717A8()
{
  return 12LL;
}

uint64_t sub_1891717B0()
{
  return 13LL;
}

uint64_t sub_1891717B8()
{
  return 14LL;
}

uint64_t sub_1891717C0()
{
  return 15LL;
}

uint64_t sub_1891717C8()
{
  return 16LL;
}

uint64_t sub_1891717D0()
{
  return 17LL;
}

uint64_t sub_1891717D8()
{
  return 18LL;
}

uint64_t sub_1891717E0()
{
  return 19LL;
}

uint64_t sub_1891717E8()
{
  return 20LL;
}

uint64_t sub_1891717F0()
{
  return 21LL;
}

uint64_t sub_1891717F8()
{
  return 22LL;
}

uint64_t sub_189171800()
{
  return 23LL;
}

uint64_t sub_189171808()
{
  return 24LL;
}

uint64_t sub_189171810()
{
  return 25LL;
}

uint64_t sub_189171818()
{
  return 26LL;
}

uint64_t sub_189171820()
{
  return 27LL;
}

uint64_t sub_189171828()
{
  return 28LL;
}

uint64_t sub_189171830()
{
  return 29LL;
}

uint64_t sub_189171838()
{
  return 30LL;
}

uint64_t sub_189171840()
{
  return 31LL;
}

uint64_t sub_189171848()
{
  return 32LL;
}

uint64_t sub_189171850()
{
  return 33LL;
}

uint64_t sub_189171858()
{
  return 34LL;
}

uint64_t sub_189171860()
{
  return 35LL;
}

uint64_t sub_189171868()
{
  return 36LL;
}

uint64_t sub_189171870()
{
  return 37LL;
}

uint64_t sub_189171878()
{
  return 38LL;
}

uint64_t sub_189171880()
{
  return 39LL;
}

uint64_t sub_189171888()
{
  return 40LL;
}

uint64_t sub_189171890()
{
  return 41LL;
}

uint64_t sub_189171898()
{
  return 42LL;
}

uint64_t sub_1891718A0()
{
  return 43LL;
}

uint64_t sub_1891718A8()
{
  return 44LL;
}

uint64_t sub_1891718B0()
{
  return 45LL;
}

uint64_t sub_1891718B8()
{
  return 46LL;
}

uint64_t sub_1891718C0()
{
  return 47LL;
}

uint64_t sub_1891718C8()
{
  return 48LL;
}

uint64_t sub_1891718D0()
{
  return 49LL;
}

uint64_t sub_1891718D8()
{
  return 50LL;
}

uint64_t sub_1891718E0()
{
  return 51LL;
}

uint64_t sub_1891718E8()
{
  return 52LL;
}

uint64_t sub_1891718F0()
{
  return 53LL;
}

uint64_t sub_1891718F8()
{
  return 54LL;
}

uint64_t sub_189171900()
{
  return 55LL;
}

uint64_t sub_189171908()
{
  return 56LL;
}

uint64_t sub_189171910()
{
  return 57LL;
}

uint64_t sub_189171918()
{
  return 58LL;
}

uint64_t sub_189171920()
{
  return 59LL;
}

uint64_t sub_189171928()
{
  return 60LL;
}

uint64_t sub_189171930()
{
  return 61LL;
}

uint64_t sub_189171938()
{
  return 62LL;
}

uint64_t sub_189171940()
{
  return 63LL;
}

uint64_t sub_189171948()
{
  return 64LL;
}

uint64_t sub_189171950()
{
  return 65LL;
}

uint64_t sub_189171958()
{
  return 66LL;
}

uint64_t sub_189171960()
{
  return 67LL;
}

uint64_t sub_189171968()
{
  return 68LL;
}

uint64_t sub_189171970()
{
  return 69LL;
}

uint64_t sub_189171978()
{
  return 70LL;
}

uint64_t sub_189171980()
{
  return 71LL;
}

uint64_t sub_189171988()
{
  return 72LL;
}

uint64_t sub_189171990()
{
  return 73LL;
}

uint64_t sub_189171998()
{
  return 74LL;
}

uint64_t sub_1891719A0()
{
  return 75LL;
}

uint64_t sub_1891719A8()
{
  return 76LL;
}

uint64_t sub_1891719B0()
{
  return 77LL;
}

uint64_t sub_1891719B8()
{
  return 78LL;
}

uint64_t sub_1891719C0()
{
  return 79LL;
}

uint64_t sub_1891719C8()
{
  return 80LL;
}

uint64_t sub_1891719D0()
{
  return 81LL;
}

uint64_t sub_1891719D8()
{
  return 82LL;
}

uint64_t sub_1891719E0()
{
  return 83LL;
}

uint64_t sub_1891719E8()
{
  return 84LL;
}

uint64_t sub_1891719F0()
{
  return 85LL;
}

uint64_t sub_1891719F8()
{
  return 86LL;
}

uint64_t sub_189171A00()
{
  return 87LL;
}

uint64_t sub_189171A08()
{
  return 88LL;
}

uint64_t sub_189171A10()
{
  return 89LL;
}

uint64_t sub_189171A18()
{
  return 90LL;
}

uint64_t sub_189171A20()
{
  return 91LL;
}

uint64_t sub_189171A28()
{
  return 92LL;
}

uint64_t sub_189171A30()
{
  return 93LL;
}

uint64_t sub_189171A38()
{
  return 94LL;
}

uint64_t sub_189171A40()
{
  return 95LL;
}

uint64_t sub_189171A48()
{
  return 96LL;
}

uint64_t sub_189171A50()
{
  return 97LL;
}

uint64_t sub_189171A58()
{
  return 98LL;
}

uint64_t sub_189171A60()
{
  return 99LL;
}

uint64_t sub_189171A68()
{
  return 100LL;
}

uint64_t sub_189171A70()
{
  return 101LL;
}

uint64_t sub_189171A78()
{
  return 102LL;
}

uint64_t sub_189171A80()
{
  return 103LL;
}

uint64_t sub_189171A88()
{
  return 104LL;
}

uint64_t sub_189171A90()
{
  return 105LL;
}

uint64_t sub_189171A98()
{
  return 106LL;
}

uint64_t sub_189171AA0()
{
  return 107LL;
}

uint64_t sub_189171AA8()
{
  return 108LL;
}

uint64_t sub_189171AB0()
{
  return 109LL;
}

uint64_t sub_189171AB8()
{
  return 110LL;
}

uint64_t sub_189171AC0()
{
  return 111LL;
}

uint64_t sub_189171AC8()
{
  return 112LL;
}

uint64_t sub_189171AD0()
{
  return 113LL;
}

uint64_t sub_189171AD8()
{
  return 114LL;
}

uint64_t sub_189171AE0()
{
  return 115LL;
}

uint64_t sub_189171AE8()
{
  return 116LL;
}

uint64_t sub_189171AF0()
{
  return 117LL;
}

uint64_t sub_189171AF8()
{
  return 118LL;
}

uint64_t sub_189171B00()
{
  return 119LL;
}

uint64_t sub_189171B08()
{
  return 120LL;
}

uint64_t sub_189171B10()
{
  return 121LL;
}

uint64_t sub_189171B18()
{
  return 122LL;
}

uint64_t sub_189171B20()
{
  return 123LL;
}

uint64_t sub_189171B28()
{
  return 124LL;
}

uint64_t sub_189171B30()
{
  return 125LL;
}

uint64_t sub_189171B38()
{
  return 126LL;
}

uint64_t sub_189171B40()
{
  return 127LL;
}

uint64_t sub_189171B48()
{
  return 128LL;
}

uint64_t sub_189171B50()
{
  return 129LL;
}

uint64_t sub_189171B58()
{
  return 130LL;
}

uint64_t sub_189171B60()
{
  return 131LL;
}

uint64_t sub_189171B68()
{
  return 132LL;
}

uint64_t sub_189171B70()
{
  return 133LL;
}

uint64_t sub_189171B78()
{
  return 134LL;
}

uint64_t sub_189171B80()
{
  return 135LL;
}

uint64_t sub_189171B88()
{
  return 136LL;
}

uint64_t sub_189171B90()
{
  return 137LL;
}

uint64_t sub_189171B98()
{
  return 138LL;
}

uint64_t sub_189171BA0()
{
  return 139LL;
}

uint64_t sub_189171BA8()
{
  return 140LL;
}

uint64_t sub_189171BB0()
{
  return 141LL;
}

uint64_t sub_189171BB8()
{
  return 142LL;
}

uint64_t sub_189171BC0()
{
  return 143LL;
}

uint64_t sub_189171BC8()
{
  return 144LL;
}

uint64_t sub_189171BD0()
{
  return 145LL;
}

uint64_t sub_189171BD8()
{
  return 146LL;
}

uint64_t sub_189171BE0()
{
  return 147LL;
}

uint64_t sub_189171BE8()
{
  return 148LL;
}

uint64_t sub_189171BF0()
{
  return 149LL;
}

uint64_t sub_189171BF8()
{
  return 150LL;
}

uint64_t sub_189171C00()
{
  return 151LL;
}

uint64_t sub_189171C08()
{
  return 152LL;
}

uint64_t sub_189171C10()
{
  return 153LL;
}

uint64_t sub_189171C18()
{
  return 154LL;
}

uint64_t sub_189171C20()
{
  return 155LL;
}

uint64_t sub_189171C28()
{
  return 156LL;
}

uint64_t sub_189171C30()
{
  return 157LL;
}

uint64_t sub_189171C38()
{
  return 158LL;
}

uint64_t sub_189171C40()
{
  return 159LL;
}

uint64_t sub_189171C48()
{
  return 160LL;
}

uint64_t sub_189171C50()
{
  return 161LL;
}

uint64_t sub_189171C58()
{
  return 162LL;
}

uint64_t sub_189171C60()
{
  return 163LL;
}

uint64_t sub_189171C68()
{
  return 164LL;
}

uint64_t sub_189171C70()
{
  return 176LL;
}

uint64_t sub_189171C78()
{
  return 177LL;
}

uint64_t sub_189171C80()
{
  return 178LL;
}

uint64_t sub_189171C88()
{
  return 179LL;
}

uint64_t sub_189171C90()
{
  return 180LL;
}

uint64_t sub_189171C98()
{
  return 181LL;
}

uint64_t sub_189171CA0()
{
  return 182LL;
}

uint64_t sub_189171CA8()
{
  return 183LL;
}

uint64_t sub_189171CB0()
{
  return 184LL;
}

uint64_t sub_189171CB8()
{
  return 185LL;
}

uint64_t sub_189171CC0()
{
  return 186LL;
}

uint64_t sub_189171CC8()
{
  return 187LL;
}

uint64_t sub_189171CD0()
{
  return 188LL;
}

uint64_t sub_189171CD8()
{
  return 189LL;
}

uint64_t sub_189171CE0()
{
  return 190LL;
}

uint64_t sub_189171CE8()
{
  return 191LL;
}

uint64_t sub_189171CF0()
{
  return 192LL;
}

uint64_t sub_189171CF8()
{
  return 193LL;
}

uint64_t sub_189171D00()
{
  return 194LL;
}

uint64_t sub_189171D08()
{
  return 195LL;
}

uint64_t sub_189171D10()
{
  return 196LL;
}

uint64_t sub_189171D18()
{
  return 197LL;
}

uint64_t sub_189171D20()
{
  return 198LL;
}

uint64_t sub_189171D28()
{
  return 199LL;
}

uint64_t sub_189171D30()
{
  return 200LL;
}

uint64_t sub_189171D38()
{
  return 201LL;
}

uint64_t sub_189171D40()
{
  return 202LL;
}

uint64_t sub_189171D48()
{
  return 203LL;
}

uint64_t sub_189171D50()
{
  return 204LL;
}

uint64_t sub_189171D58()
{
  return 205LL;
}

uint64_t sub_189171D60()
{
  return 206LL;
}

uint64_t sub_189171D68()
{
  return 207LL;
}

uint64_t sub_189171D70()
{
  return 208LL;
}

uint64_t sub_189171D78()
{
  return 209LL;
}

uint64_t sub_189171D80()
{
  return 210LL;
}

uint64_t sub_189171D88()
{
  return 211LL;
}

uint64_t sub_189171D90()
{
  return 212LL;
}

uint64_t sub_189171D98()
{
  return 213LL;
}

uint64_t sub_189171DA0()
{
  return 214LL;
}

uint64_t sub_189171DA8()
{
  return 215LL;
}

uint64_t sub_189171DB0()
{
  return 216LL;
}

uint64_t sub_189171DB8()
{
  return 217LL;
}

uint64_t sub_189171DC0()
{
  return 218LL;
}

uint64_t sub_189171DC8()
{
  return 219LL;
}

uint64_t sub_189171DD0()
{
  return 220LL;
}

uint64_t sub_189171DD8()
{
  return 221LL;
}

uint64_t sub_189171DE0()
{
  return 224LL;
}

uint64_t sub_189171DE8()
{
  return 225LL;
}

uint64_t sub_189171DF0()
{
  return 226LL;
}

uint64_t sub_189171DF8()
{
  return 227LL;
}

uint64_t sub_189171E00()
{
  return 228LL;
}

uint64_t sub_189171E08()
{
  return 229LL;
}

uint64_t sub_189171E10()
{
  return 230LL;
}

uint64_t sub_189171E18()
{
  return 231LL;
}

uint64_t HIDUsage.LEDUsage.rawValue.getter()
{
  return word_1891A5752[*v0];
}

uint64_t HIDUsage.TelephonyDeviceUsage.rawValue.getter()
{
  return word_1891A5812[*v0];
}

uint64_t HIDUsage.ConsumerUsage.rawValue.getter()
{
  return word_1891A58D8[*v0];
}

uint64_t HIDUsage.DigitizersUsage.rawValue.getter()
{
  return word_1891A5C5C[*v0];
}

uint64_t HIDUsage.HapticsUsage.rawValue.getter()
{
  return word_1891A5D34[*v0];
}

uint64_t HIDUsage.PhysicalInputDeviceUsage.rawValue.getter()
{
  return word_1891A5D6E[*v0];
}

uint64_t HIDUsage.EyeAndHeadTrackersUsage.rawValue.getter()
{
  return word_1891A5E40[*v0];
}

uint64_t HIDUsage.AuxiliaryDisplayUsage.rawValue.getter()
{
  return word_1891A5E84[*v0];
}

uint64_t HIDUsage.SensorsUsage.rawValue.getter()
{
  return word_1891A5F1A[*v0];
}

uint64_t HIDUsage.MedicalInstrumentUsage.rawValue.getter()
{
  return word_1891A644C[*v0];
}

uint64_t HIDUsage.BrailleDisplayUsage.rawValue.getter()
{
  return word_1891A6486[*v0];
}

uint64_t HIDUsage.LightingAndIlluminationUsage.rawValue.getter()
{
  return word_1891A64DC[*v0];
}

uint64_t HIDUsage.MonitorUsage.rawValue.getter()
{
  return *v0 + 1;
}

uint64_t HIDUsage.VESAVirtualControlsUsage.rawValue.getter()
{
  return word_1891A651E[*v0];
}

uint64_t HIDUsage.PowerUsage.rawValue.getter()
{
  return word_1891A6578[*v0];
}

uint64_t HIDUsage.BatterySystemUsage.rawValue.getter()
{
  return word_1891A6612[*v0];
}

uint64_t HIDUsage.BarcodeScannerUsage.rawValue.getter()
{
  return ((uint64_t (*)(uint64_t))((char *)sub_189171F78 + 4 * word_18919D5B2[*v0]))(1LL);
}

uint64_t sub_189171F78()
{
  return 2LL;
}

uint64_t sub_189171F80()
{
  return 3LL;
}

uint64_t sub_189171F88()
{
  return 4LL;
}

uint64_t sub_189171F90()
{
  return 5LL;
}

uint64_t sub_189171F98()
{
  return 16LL;
}

uint64_t sub_189171FA0()
{
  return 17LL;
}

uint64_t sub_189171FA8()
{
  return 18LL;
}

uint64_t sub_189171FB0()
{
  return 19LL;
}

uint64_t sub_189171FB8()
{
  return 20LL;
}

uint64_t sub_189171FC0()
{
  return 21LL;
}

uint64_t sub_189171FC8()
{
  return 22LL;
}

uint64_t sub_189171FD0()
{
  return 23LL;
}

uint64_t sub_189171FD8()
{
  return 24LL;
}

uint64_t sub_189171FE0()
{
  return 25LL;
}

uint64_t sub_189171FE8()
{
  return 26LL;
}

uint64_t sub_189171FF0()
{
  return 27LL;
}

uint64_t sub_189171FF8()
{
  return 28LL;
}

uint64_t sub_189172000()
{
  return 29LL;
}

uint64_t sub_189172008()
{
  return 30LL;
}

uint64_t sub_189172010()
{
  return 31LL;
}

uint64_t sub_189172018()
{
  return 48LL;
}

uint64_t sub_189172020()
{
  return 49LL;
}

uint64_t sub_189172028()
{
  return 50LL;
}

uint64_t sub_189172030()
{
  return 51LL;
}

uint64_t sub_189172038()
{
  return 52LL;
}

uint64_t sub_189172040()
{
  return 53LL;
}

uint64_t sub_189172048()
{
  return 54LL;
}

uint64_t sub_189172050()
{
  return 55LL;
}

uint64_t sub_189172058()
{
  return 56LL;
}

uint64_t sub_189172060()
{
  return 57LL;
}

uint64_t sub_189172068()
{
  return 58LL;
}

uint64_t sub_189172070()
{
  return 59LL;
}

uint64_t sub_189172078()
{
  return 60LL;
}

uint64_t sub_189172080()
{
  return 61LL;
}

uint64_t sub_189172088()
{
  return 62LL;
}

uint64_t sub_189172090()
{
  return 63LL;
}

uint64_t sub_189172098()
{
  return 64LL;
}

uint64_t sub_1891720A0()
{
  return 65LL;
}

uint64_t sub_1891720A8()
{
  return 66LL;
}

uint64_t sub_1891720B0()
{
  return 67LL;
}

uint64_t sub_1891720B8()
{
  return 68LL;
}

uint64_t sub_1891720C0()
{
  return 69LL;
}

uint64_t sub_1891720C8()
{
  return 70LL;
}

uint64_t sub_1891720D0()
{
  return 77LL;
}

uint64_t sub_1891720D8()
{
  return 78LL;
}

uint64_t sub_1891720E0()
{
  return 79LL;
}

uint64_t sub_1891720E8()
{
  return 80LL;
}

uint64_t sub_1891720F0()
{
  return 81LL;
}

uint64_t sub_1891720F8()
{
  return 82LL;
}

uint64_t sub_189172100()
{
  return 85LL;
}

uint64_t sub_189172108()
{
  return 86LL;
}

uint64_t sub_189172110()
{
  return 87LL;
}

uint64_t sub_189172118()
{
  return 88LL;
}

uint64_t sub_189172120()
{
  return 89LL;
}

uint64_t sub_189172128()
{
  return 90LL;
}

uint64_t sub_189172130()
{
  return 91LL;
}

uint64_t sub_189172138()
{
  return 92LL;
}

uint64_t sub_189172140()
{
  return 93LL;
}

uint64_t sub_189172148()
{
  return 94LL;
}

uint64_t sub_189172150()
{
  return 95LL;
}

uint64_t sub_189172158()
{
  return 96LL;
}

uint64_t sub_189172160()
{
  return 97LL;
}

uint64_t sub_189172168()
{
  return 98LL;
}

uint64_t sub_189172170()
{
  return 99LL;
}

uint64_t sub_189172178()
{
  return 100LL;
}

uint64_t sub_189172180()
{
  return 101LL;
}

uint64_t sub_189172188()
{
  return 102LL;
}

uint64_t sub_189172190()
{
  return 109LL;
}

uint64_t sub_189172198()
{
  return 110LL;
}

uint64_t sub_1891721A0()
{
  return 111LL;
}

uint64_t sub_1891721A8()
{
  return 112LL;
}

uint64_t sub_1891721B0()
{
  return 117LL;
}

uint64_t sub_1891721B8()
{
  return 118LL;
}

uint64_t sub_1891721C0()
{
  return 122LL;
}

uint64_t sub_1891721C8()
{
  return 123LL;
}

uint64_t sub_1891721D0()
{
  return 124LL;
}

uint64_t sub_1891721D8()
{
  return 125LL;
}

uint64_t sub_1891721E0()
{
  return 126LL;
}

uint64_t sub_1891721E8()
{
  return 127LL;
}

uint64_t sub_1891721F0()
{
  return 128LL;
}

uint64_t sub_1891721F8()
{
  return 130LL;
}

uint64_t sub_189172200()
{
  return 131LL;
}

uint64_t sub_189172208()
{
  return 132LL;
}

uint64_t sub_189172210()
{
  return 133LL;
}

uint64_t sub_189172218()
{
  return 134LL;
}

uint64_t sub_189172220()
{
  return 135LL;
}

uint64_t sub_189172228()
{
  return 136LL;
}

uint64_t sub_189172230()
{
  return 137LL;
}

uint64_t sub_189172238()
{
  return 138LL;
}

uint64_t sub_189172240()
{
  return 139LL;
}

uint64_t sub_189172248()
{
  return 145LL;
}

uint64_t sub_189172250()
{
  return 146LL;
}

uint64_t sub_189172258()
{
  return 147LL;
}

uint64_t sub_189172260()
{
  return 148LL;
}

uint64_t sub_189172268()
{
  return 149LL;
}

uint64_t sub_189172270()
{
  return 150LL;
}

uint64_t sub_189172278()
{
  return 151LL;
}

uint64_t sub_189172280()
{
  return 152LL;
}

uint64_t sub_189172288()
{
  return 153LL;
}

uint64_t sub_189172290()
{
  return 154LL;
}

uint64_t sub_189172298()
{
  return 155LL;
}

uint64_t sub_1891722A0()
{
  return 156LL;
}

uint64_t sub_1891722A8()
{
  return 157LL;
}

uint64_t sub_1891722B0()
{
  return 158LL;
}

uint64_t sub_1891722B8()
{
  return 159LL;
}

uint64_t sub_1891722C0()
{
  return 160LL;
}

uint64_t sub_1891722C8()
{
  return 161LL;
}

uint64_t sub_1891722D0()
{
  return 162LL;
}

uint64_t sub_1891722D8()
{
  return 169LL;
}

uint64_t sub_1891722E0()
{
  return 170LL;
}

uint64_t sub_1891722E8()
{
  return 171LL;
}

uint64_t sub_1891722F0()
{
  return 172LL;
}

uint64_t sub_1891722F8()
{
  return 173LL;
}

uint64_t sub_189172300()
{
  return 174LL;
}

uint64_t sub_189172308()
{
  return 175LL;
}

uint64_t sub_189172310()
{
  return 176LL;
}

uint64_t sub_189172318()
{
  return 177LL;
}

uint64_t sub_189172320()
{
  return 178LL;
}

uint64_t sub_189172328()
{
  return 179LL;
}

uint64_t sub_189172330()
{
  return 180LL;
}

uint64_t sub_189172338()
{
  return 181LL;
}

uint64_t sub_189172340()
{
  return 183LL;
}

uint64_t sub_189172348()
{
  return 184LL;
}

uint64_t sub_189172350()
{
  return 185LL;
}

uint64_t sub_189172358()
{
  return 186LL;
}

uint64_t sub_189172360()
{
  return 187LL;
}

uint64_t sub_189172368()
{
  return 188LL;
}

uint64_t sub_189172370()
{
  return 189LL;
}

uint64_t sub_189172378()
{
  return 190LL;
}

uint64_t sub_189172380()
{
  return 191LL;
}

uint64_t sub_189172388()
{
  return 192LL;
}

uint64_t sub_189172390()
{
  return 195LL;
}

uint64_t sub_189172398()
{
  return 196LL;
}

uint64_t sub_1891723A0()
{
  return 199LL;
}

uint64_t sub_1891723A8()
{
  return 200LL;
}

uint64_t sub_1891723B0()
{
  return 201LL;
}

uint64_t sub_1891723B8()
{
  return 202LL;
}

uint64_t sub_1891723C0()
{
  return 203LL;
}

uint64_t sub_1891723C8()
{
  return 204LL;
}

uint64_t sub_1891723D0()
{
  return 205LL;
}

uint64_t sub_1891723D8()
{
  return 206LL;
}

uint64_t sub_1891723E0()
{
  return 211LL;
}

uint64_t sub_1891723E8()
{
  return 212LL;
}

uint64_t sub_1891723F0()
{
  return 213LL;
}

uint64_t sub_1891723F8()
{
  return 214LL;
}

uint64_t sub_189172400()
{
  return 215LL;
}

uint64_t sub_189172408()
{
  return 216LL;
}

uint64_t sub_189172410()
{
  return 217LL;
}

uint64_t sub_189172418()
{
  return 218LL;
}

uint64_t sub_189172420()
{
  return 219LL;
}

uint64_t sub_189172428()
{
  return 220LL;
}

uint64_t sub_189172430()
{
  return 221LL;
}

uint64_t sub_189172438()
{
  return 222LL;
}

uint64_t sub_189172440()
{
  return 223LL;
}

uint64_t sub_189172448()
{
  return 240LL;
}

uint64_t sub_189172450()
{
  return 241LL;
}

uint64_t sub_189172458()
{
  return 242LL;
}

uint64_t sub_189172460()
{
  return 251LL;
}

uint64_t sub_189172468()
{
  return 252LL;
}

uint64_t sub_189172470()
{
  return 253LL;
}

uint64_t sub_189172478()
{
  return 254LL;
}

uint64_t sub_189172480()
{
  return 255LL;
}

uint64_t sub_189172488()
{
  return 256LL;
}

uint64_t sub_189172490()
{
  return 257LL;
}

uint64_t sub_189172498()
{
  return 258LL;
}

uint64_t sub_1891724A0()
{
  return 259LL;
}

uint64_t sub_1891724A8()
{
  return 260LL;
}

uint64_t sub_1891724B0()
{
  return 262LL;
}

uint64_t sub_1891724B8()
{
  return 263LL;
}

uint64_t sub_1891724C0()
{
  return 264LL;
}

uint64_t sub_1891724C8()
{
  return 265LL;
}

uint64_t sub_1891724D0()
{
  return 266LL;
}

uint64_t sub_1891724D8()
{
  return 267LL;
}

uint64_t sub_1891724E0()
{
  return 268LL;
}

uint64_t sub_1891724E8()
{
  return 269LL;
}

uint64_t sub_1891724F0()
{
  return 272LL;
}

uint64_t sub_1891724F8()
{
  return 273LL;
}

uint64_t sub_189172500()
{
  return 274LL;
}

uint64_t sub_189172508()
{
  return 275LL;
}

uint64_t sub_189172510()
{
  return 276LL;
}

uint64_t sub_189172518()
{
  return 277LL;
}

uint64_t sub_189172520()
{
  return 278LL;
}

uint64_t sub_189172528()
{
  return 279LL;
}

uint64_t sub_189172530()
{
  return 280LL;
}

uint64_t sub_189172538()
{
  return 281LL;
}

uint64_t sub_189172540()
{
  return 282LL;
}

uint64_t sub_189172548()
{
  return 283LL;
}

uint64_t sub_189172550()
{
  return 284LL;
}

uint64_t sub_189172558()
{
  return 285LL;
}

uint64_t sub_189172560()
{
  return 286LL;
}

uint64_t sub_189172568()
{
  return 287LL;
}

uint64_t sub_189172570()
{
  return 288LL;
}

uint64_t sub_189172578()
{
  return 289LL;
}

uint64_t HIDUsage.ScalesUsage.rawValue.getter()
{
  return word_1891A66C8[*v0];
}

uint64_t HIDUsage.MagneticStripeReaderUsage.rawValue.getter()
{
  return word_1891A6724[*v0];
}

uint64_t HIDUsage.CameraControlUsage.rawValue.getter()
{
  if (*v0) {
    return 33LL;
  }
  else {
    return 32LL;
  }
}

uint64_t HIDUsage.ArcadeUsage.rawValue.getter()
{
  return word_1891A6738[*v0];
}

unint64_t HIDUsage.FIDOAllianceUsage.rawValue.getter()
{
  return 0x2100200001uLL >> (16 * *v0);
}

char HIDUsage.init(page:usage:)@<W0>(int rawValue@<W1>, uint64_t a2@<X0>, uint64_t a3@<X8>)
{
  uint64_t v5 = rawValue & 0x10000;
  switch((__int16)a2)
  {
    case 1:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 114LL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.GenericDesktopUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18;
      }

      goto LABEL_155;
    case 2:
      if (!(_DWORD)v5)
      {
        LOBYTE(a2) = HIDUsage.SimulationControlsUsage.init(rawValue:)(rawValue);
        BOOL v10 = v18 == 51;
        unint64_t v6 = v18 | 0x400000000LL;
        uint64_t v11 = (rawValue << 16);
        unint64_t v12 = 0xFFFFFF8400000002LL;
        goto LABEL_109;
      }

      unint64_t v6 = 0x400000033LL;
      goto LABEL_155;
    case 3:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x80000000CLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.VRControlsUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x800000000LL;
      }

      goto LABEL_155;
    case 4:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0xC00000022LL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.SportControlsUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0xC00000000LL;
      }

      goto LABEL_155;
    case 5:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x100000001DLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.GameControlsUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x1000000000LL;
      }

      goto LABEL_155;
    case 6:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x1400000018LL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.GenericDeviceControlsUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x1400000000LL;
      }

      goto LABEL_155;
    case 7:
      if (!(_DWORD)v5)
      {
        LOBYTE(a2) = HIDUsage.KeyboardOrKeypadUsage.init(rawValue:)(rawValue);
        BOOL v10 = v18 == 218;
        unint64_t v6 = v18 | 0x1800000000LL;
        uint64_t v11 = (rawValue << 16);
        uint64_t v13 = 5LL;
        goto LABEL_108;
      }

      unint64_t v6 = 0x18000000DALL;
      goto LABEL_155;
    case 8:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x1C00000060LL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.LEDUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x1C00000000LL;
      }

      goto LABEL_155;
    case 9:
      unint64_t v6 = rawValue & 0x1FFFF | 0x2000000000LL;
      goto LABEL_155;
    case 10:
      unint64_t v6 = rawValue & 0x1FFFF | 0x2400000000LL;
      goto LABEL_155;
    case 11:
      if (!(_DWORD)v5)
      {
        LOBYTE(a2) = HIDUsage.TelephonyDeviceUsage.init(rawValue:)(rawValue);
        BOOL v10 = v18 == 99;
        unint64_t v6 = v18 | 0x2800000000LL;
        uint64_t v11 = (rawValue << 16);
        uint64_t v13 = 9LL;
        goto LABEL_108;
      }

      unint64_t v6 = 0x2800000063LL;
      goto LABEL_155;
    case 12:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x2C000001C2LL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.ConsumerUsage.init(rawValue:)(rawValue).value;
        unint64_t v6 = v18 | 0x2C00000000LL;
        if (v18 == 450) {
          unint64_t v6 = ((rawValue << 16) | 0xFFFFFF8400000002LL) + 10;
        }
      }

      goto LABEL_155;
    case 13:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x300000006CLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.DigitizersUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x3000000000LL;
      }

      goto LABEL_155;
    case 14:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x340000001DLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.HapticsUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x3400000000LL;
      }

      goto LABEL_155;
    case 15:
      if (!(_DWORD)v5)
      {
        LOBYTE(a2) = HIDUsage.PhysicalInputDeviceUsage.init(rawValue:)(rawValue);
        BOOL v10 = v18 == 105;
        unint64_t v6 = v18 | 0x3800000000LL;
        uint64_t v11 = (rawValue << 16);
        uint64_t v13 = 13LL;
        goto LABEL_108;
      }

      unint64_t v6 = 0x3800000069LL;
      goto LABEL_155;
    case 16:
    case 19:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 66:
    case 67:
    case 68:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 79:
    case 80:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 90:
    case 91:
    case 92:
    case 93:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 102:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 110:
    case 111:
    case 112:
    case 113:
    case 114:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
    case 122:
    case 123:
    case 124:
    case 125:
    case 126:
    case 127:
    case 131:
    case 134:
    case 135:
    case 136:
    case 137:
    case 138:
    case 139:
    case 143:
      goto LABEL_14;
    case 17:
      unint64_t v6 = 0x3C0000000ALL;
      uint64_t v9 = ((rawValue << 16) | 0xFFFFFF8400000002LL) + 15;
      goto LABEL_59;
    case 18:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x4000000022LL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.EyeAndHeadTrackersUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x4000000000LL;
      }

      goto LABEL_155;
    case 20:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x440000004BLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.AuxiliaryDisplayUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x4400000000LL;
      }

      goto LABEL_155;
    case 32:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x4800000299LL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.SensorsUsage.init(rawValue:)(rawValue).value;
        unint64_t v6 = v18 | 0x4800000000LL;
        if (v18 == 665) {
          unint64_t v6 = ((rawValue << 16) | 0xFFFFFF8400000002LL) + 30;
        }
      }

      goto LABEL_155;
    case 64:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x4C0000001DLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.MedicalInstrumentUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x4C00000000LL;
      }

      goto LABEL_155;
    case 65:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x500000002BLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.BrailleDisplayUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x5000000000LL;
      }

      goto LABEL_155;
    case 89:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x5400000021LL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.LightingAndIlluminationUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x5400000000LL;
      }

      goto LABEL_155;
    case 128:
      unint64_t v6 = 0x5800000001LL;
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x5800000004LL;
      }

      else
      {
        switch((__int16)rawValue)
        {
          case 1:
            unint64_t v6 = 0x5800000000LL;
            break;
          case 2:
            goto LABEL_155;
          case 3:
            unint64_t v6 = 0x5800000002LL;
            break;
          case 4:
            unint64_t v6 = 0x5800000003LL;
            break;
          default:
            unint64_t v6 = ((rawValue << 16) | 0xFFFFFF8400000002LL) + 126;
            break;
        }
      }

      goto LABEL_155;
    case 129:
      unint64_t v6 = rawValue & 0x1FFFF | 0x5C00000000LL;
      goto LABEL_155;
    case 130:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x600000002DLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.VESAVirtualControlsUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x6000000000LL;
      }

      goto LABEL_155;
    case 132:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x640000004DLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.PowerUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x6400000000LL;
      }

      goto LABEL_155;
    case 133:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x680000005BLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.BatterySystemUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x6800000000LL;
      }

      goto LABEL_155;
    case 140:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x6C000000C2LL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.BarcodeScannerUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x6C00000000LL;
      }

      goto LABEL_155;
    case 141:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x700000002ELL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.ScalesUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x7000000000LL;
      }

      goto LABEL_155;
    case 142:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x740000000ALL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.MagneticStripeReaderUsage.init(rawValue:)(rawValue);
        BOOL v10 = v18 == 10;
        unint64_t v6 = v18 | 0x7400000000LL;
        uint64_t v11 = (rawValue << 16);
        uint64_t v13 = 140LL;
LABEL_108:
        unint64_t v12 = v13 | 0xFFFFFF8400000002LL;
LABEL_109:
        unint64_t v14 = v11 | v12;
        if (v10) {
          unint64_t v6 = v14;
        }
      }

      goto LABEL_155;
    case 144:
      unint64_t v15 = ((rawValue << 16) | 0xFFFFFF8400000002LL) + 142;
      else {
        uint64_t v16 = v15;
      }
      if ((_DWORD)v5) {
        unint64_t v6 = 0x7800000002LL;
      }
      else {
        unint64_t v6 = v16;
      }
      goto LABEL_155;
    case 145:
      if ((_DWORD)v5)
      {
        unint64_t v6 = 0x7C0000001BLL;
      }

      else
      {
        LOBYTE(a2) = HIDUsage.ArcadeUsage.init(rawValue:)(rawValue);
        unint64_t v6 = v18 | 0x7C00000000LL;
      }

      goto LABEL_155;
    default:
      if ((unsigned __int16)a2 == 61904)
      {
        unint64_t v6 = 0x8000000003LL;
        uint64_t v7 = 0x8000000001LL;
        unint64_t v8 = (rawValue << 16) | 0xFFFFFF840000F1D0LL;
        else {
          uint64_t v9 = v7;
        }
LABEL_59:
        if (!(_DWORD)v5) {
          unint64_t v6 = v9;
        }
      }

      else
      {
LABEL_14:
        a2 = (unsigned __int16)a2 | ((unsigned __int16)rawValue << 16);
        unint64_t v6 = (a2 | (v5 << 16)) - 0x7C00000000LL;
      }

LABEL_155:
      *(_DWORD *)a3 = v6;
      *(_BYTE *)(a3 + 4) = BYTE4(v6);
      return a2;
  }

CoreHID::HIDUsage::GenericDesktopUsage_optional __swiftcall HIDUsage.GenericDesktopUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 96;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_98;
    case 2u:
      char v2 = 1;
      goto LABEL_98;
    case 4u:
      char v2 = 2;
      goto LABEL_98;
    case 5u:
      char v2 = 3;
      goto LABEL_98;
    case 6u:
      char v2 = 4;
      goto LABEL_98;
    case 7u:
      char v2 = 5;
      goto LABEL_98;
    case 8u:
      char v2 = 6;
      goto LABEL_98;
    case 9u:
      char v2 = 7;
      goto LABEL_98;
    case 0xAu:
      char v2 = 8;
      goto LABEL_98;
    case 0xBu:
      char v2 = 9;
      goto LABEL_98;
    case 0xCu:
      char v2 = 10;
      goto LABEL_98;
    case 0xDu:
      char v2 = 11;
      goto LABEL_98;
    case 0xEu:
      char v2 = 12;
      goto LABEL_98;
    case 0xFu:
      char v2 = 13;
      goto LABEL_98;
    case 0x10u:
      char v2 = 14;
      goto LABEL_98;
    case 0x11u:
      char v2 = 15;
      goto LABEL_98;
    case 0x12u:
      char v2 = 16;
      goto LABEL_98;
    case 0x13u:
      char v2 = 17;
      goto LABEL_98;
    case 0x30u:
      char v2 = 18;
      goto LABEL_98;
    case 0x31u:
      char v2 = 19;
      goto LABEL_98;
    case 0x32u:
      char v2 = 20;
      goto LABEL_98;
    case 0x33u:
      char v2 = 21;
      goto LABEL_98;
    case 0x34u:
      char v2 = 22;
      goto LABEL_98;
    case 0x35u:
      char v2 = 23;
      goto LABEL_98;
    case 0x36u:
      char v2 = 24;
      goto LABEL_98;
    case 0x37u:
      char v2 = 25;
      goto LABEL_98;
    case 0x38u:
      char v2 = 26;
      goto LABEL_98;
    case 0x39u:
      char v2 = 27;
      goto LABEL_98;
    case 0x3Au:
      char v2 = 28;
      goto LABEL_98;
    case 0x3Bu:
      char v2 = 29;
      goto LABEL_98;
    case 0x3Cu:
      char v2 = 30;
      goto LABEL_98;
    case 0x3Du:
      char v2 = 31;
      goto LABEL_98;
    case 0x3Eu:
      char v2 = 32;
      goto LABEL_98;
    case 0x40u:
      char v2 = 33;
      goto LABEL_98;
    case 0x41u:
      char v2 = 34;
      goto LABEL_98;
    case 0x42u:
      char v2 = 35;
      goto LABEL_98;
    case 0x43u:
      char v2 = 36;
      goto LABEL_98;
    case 0x44u:
      char v2 = 37;
      goto LABEL_98;
    case 0x45u:
      char v2 = 38;
      goto LABEL_98;
    case 0x46u:
      char v2 = 39;
      goto LABEL_98;
    case 0x47u:
      char v2 = 40;
      goto LABEL_98;
    case 0x48u:
      char v2 = 41;
      goto LABEL_98;
    case 0x49u:
      char v2 = 42;
      goto LABEL_98;
    case 0x4Au:
      char v2 = 43;
      goto LABEL_98;
    case 0x4Bu:
      char v2 = 44;
      goto LABEL_98;
    case 0x4Cu:
      char v2 = 45;
      goto LABEL_98;
    case 0x80u:
      char v2 = 46;
      goto LABEL_98;
    case 0x81u:
      char v2 = 47;
      goto LABEL_98;
    case 0x82u:
      char v2 = 48;
      goto LABEL_98;
    case 0x83u:
      char v2 = 49;
      goto LABEL_98;
    case 0x84u:
      char v2 = 50;
      goto LABEL_98;
    case 0x85u:
      char v2 = 51;
      goto LABEL_98;
    case 0x86u:
      char v2 = 52;
      goto LABEL_98;
    case 0x87u:
      char v2 = 53;
      goto LABEL_98;
    case 0x88u:
      char v2 = 54;
      goto LABEL_98;
    case 0x89u:
      char v2 = 55;
      goto LABEL_98;
    case 0x8Au:
      char v2 = 56;
      goto LABEL_98;
    case 0x8Bu:
      char v2 = 57;
      goto LABEL_98;
    case 0x8Cu:
      char v2 = 58;
      goto LABEL_98;
    case 0x8Du:
      char v2 = 59;
      goto LABEL_98;
    case 0x8Eu:
      char v2 = 60;
      goto LABEL_98;
    case 0x8Fu:
      char v2 = 61;
      goto LABEL_98;
    case 0x90u:
      char v2 = 62;
      goto LABEL_98;
    case 0x91u:
      char v2 = 63;
      goto LABEL_98;
    case 0x92u:
      char v2 = 64;
      goto LABEL_98;
    case 0x93u:
      char v2 = 65;
      goto LABEL_98;
    case 0x94u:
      char v2 = 66;
      goto LABEL_98;
    case 0x95u:
      char v2 = 67;
      goto LABEL_98;
    case 0x96u:
      char v2 = 68;
      goto LABEL_98;
    case 0x97u:
      char v2 = 69;
      goto LABEL_98;
    case 0x98u:
      char v2 = 70;
      goto LABEL_98;
    case 0x99u:
      char v2 = 71;
      goto LABEL_98;
    case 0x9Au:
      char v2 = 72;
      goto LABEL_98;
    case 0x9Bu:
      char v2 = 73;
      goto LABEL_98;
    case 0xA0u:
      char v2 = 74;
      goto LABEL_98;
    case 0xA1u:
      char v2 = 75;
      goto LABEL_98;
    case 0xA2u:
      char v2 = 76;
      goto LABEL_98;
    case 0xA3u:
      char v2 = 77;
      goto LABEL_98;
    case 0xA4u:
      char v2 = 78;
      goto LABEL_98;
    case 0xA5u:
      char v2 = 79;
      goto LABEL_98;
    case 0xA6u:
      char v2 = 80;
      goto LABEL_98;
    case 0xA7u:
      char v2 = 81;
      goto LABEL_98;
    case 0xA8u:
      char v2 = 82;
      goto LABEL_98;
    case 0xA9u:
      char v2 = 83;
      goto LABEL_98;
    case 0xB0u:
      char v2 = 84;
      goto LABEL_98;
    case 0xB1u:
      char v2 = 85;
      goto LABEL_98;
    case 0xB2u:
      char v2 = 86;
      goto LABEL_98;
    case 0xB3u:
      char v2 = 87;
      goto LABEL_98;
    case 0xB4u:
      char v2 = 88;
      goto LABEL_98;
    case 0xB5u:
      char v2 = 89;
      goto LABEL_98;
    case 0xB6u:
      char v2 = 90;
      goto LABEL_98;
    case 0xB7u:
      char v2 = 91;
      goto LABEL_98;
    case 0xC0u:
      char v2 = 92;
      goto LABEL_98;
    case 0xC1u:
      char v2 = 93;
      goto LABEL_98;
    case 0xC2u:
      char v2 = 94;
      goto LABEL_98;
    case 0xC3u:
      char v2 = 95;
LABEL_98:
      char v3 = v2;
      goto LABEL_99;
    case 0xC4u:
LABEL_99:
      char *v1 = v3;
      break;
    case 0xC5u:
      char *v1 = 97;
      break;
    case 0xC6u:
      char *v1 = 98;
      break;
    case 0xC7u:
      char *v1 = 99;
      break;
    case 0xC8u:
      char *v1 = 100;
      break;
    case 0xC9u:
      char *v1 = 101;
      break;
    case 0xCAu:
      char *v1 = 102;
      break;
    case 0xCBu:
      char *v1 = 103;
      break;
    case 0xD0u:
      char *v1 = 104;
      break;
    case 0xD1u:
      char *v1 = 105;
      break;
    case 0xD2u:
      char *v1 = 106;
      break;
    case 0xD3u:
      char *v1 = 107;
      break;
    case 0xD4u:
      char *v1 = 108;
      break;
    case 0xD5u:
      char *v1 = 109;
      break;
    case 0xD6u:
      char *v1 = 110;
      break;
    case 0xE0u:
      char *v1 = 111;
      break;
    case 0xE1u:
      char *v1 = 112;
      break;
    case 0xE2u:
      char *v1 = 113;
      break;
    default:
      char *v1 = 114;
      break;
  }

  return (CoreHID::HIDUsage::GenericDesktopUsage_optional)rawValue;
}

CoreHID::HIDUsage::SimulationControlsUsage_optional __swiftcall HIDUsage.SimulationControlsUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 33;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_35;
    case 2u:
      char v2 = 1;
      goto LABEL_35;
    case 3u:
      char v2 = 2;
      goto LABEL_35;
    case 4u:
      char v2 = 3;
      goto LABEL_35;
    case 5u:
      char v2 = 4;
      goto LABEL_35;
    case 6u:
      char v2 = 5;
      goto LABEL_35;
    case 7u:
      char v2 = 6;
      goto LABEL_35;
    case 8u:
      char v2 = 7;
      goto LABEL_35;
    case 9u:
      char v2 = 8;
      goto LABEL_35;
    case 0xAu:
      char v2 = 9;
      goto LABEL_35;
    case 0xBu:
      char v2 = 10;
      goto LABEL_35;
    case 0xCu:
      char v2 = 11;
      goto LABEL_35;
    case 0x20u:
      char v2 = 12;
      goto LABEL_35;
    case 0x21u:
      char v2 = 13;
      goto LABEL_35;
    case 0x22u:
      char v2 = 14;
      goto LABEL_35;
    case 0x23u:
      char v2 = 15;
      goto LABEL_35;
    case 0x24u:
      char v2 = 16;
      goto LABEL_35;
    case 0x25u:
      char v2 = 17;
      goto LABEL_35;
    case 0xB0u:
      char v2 = 18;
      goto LABEL_35;
    case 0xB1u:
      char v2 = 19;
      goto LABEL_35;
    case 0xB2u:
      char v2 = 20;
      goto LABEL_35;
    case 0xB3u:
      char v2 = 21;
      goto LABEL_35;
    case 0xB4u:
      char v2 = 22;
      goto LABEL_35;
    case 0xB5u:
      char v2 = 23;
      goto LABEL_35;
    case 0xB6u:
      char v2 = 24;
      goto LABEL_35;
    case 0xB7u:
      char v2 = 25;
      goto LABEL_35;
    case 0xB8u:
      char v2 = 26;
      goto LABEL_35;
    case 0xB9u:
      char v2 = 27;
      goto LABEL_35;
    case 0xBAu:
      char v2 = 28;
      goto LABEL_35;
    case 0xBBu:
      char v2 = 29;
      goto LABEL_35;
    case 0xBCu:
      char v2 = 30;
      goto LABEL_35;
    case 0xBDu:
      char v2 = 31;
      goto LABEL_35;
    case 0xBEu:
      char v2 = 32;
LABEL_35:
      char v3 = v2;
      goto LABEL_36;
    case 0xBFu:
LABEL_36:
      char *v1 = v3;
      break;
    case 0xC0u:
      char *v1 = 34;
      break;
    case 0xC1u:
      char *v1 = 35;
      break;
    case 0xC2u:
      char *v1 = 36;
      break;
    case 0xC3u:
      char *v1 = 37;
      break;
    case 0xC4u:
      char *v1 = 38;
      break;
    case 0xC5u:
      char *v1 = 39;
      break;
    case 0xC6u:
      char *v1 = 40;
      break;
    case 0xC7u:
      char *v1 = 41;
      break;
    case 0xC8u:
      char *v1 = 42;
      break;
    case 0xC9u:
      char *v1 = 43;
      break;
    case 0xCAu:
      char *v1 = 44;
      break;
    case 0xCBu:
      char *v1 = 45;
      break;
    case 0xCCu:
      char *v1 = 46;
      break;
    case 0xCDu:
      char *v1 = 47;
      break;
    case 0xCEu:
      char *v1 = 48;
      break;
    case 0xCFu:
      char *v1 = 49;
      break;
    case 0xD0u:
      char *v1 = 50;
      break;
    default:
      char *v1 = 51;
      break;
  }

  return (CoreHID::HIDUsage::SimulationControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::VRControlsUsage_optional __swiftcall HIDUsage.VRControlsUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 1;
  switch(rawValue)
  {
    case 1u:
      char v2 = 0;
      goto LABEL_3;
    case 2u:
LABEL_3:
      char *v1 = v2;
      break;
    case 3u:
      char *v1 = 2;
      break;
    case 4u:
      char *v1 = 3;
      break;
    case 5u:
      char *v1 = 4;
      break;
    case 6u:
      char *v1 = 5;
      break;
    case 7u:
      char *v1 = 6;
      break;
    case 8u:
      char *v1 = 7;
      break;
    case 9u:
      char *v1 = 8;
      break;
    case 0xAu:
      char *v1 = 9;
      break;
    case 0x20u:
      char *v1 = 10;
      break;
    case 0x21u:
      char *v1 = 11;
      break;
    default:
      char *v1 = 12;
      break;
  }

  return (CoreHID::HIDUsage::VRControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::SportControlsUsage_optional __swiftcall HIDUsage.SportControlsUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 16;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_18;
    case 2u:
      char v2 = 1;
      goto LABEL_18;
    case 3u:
      char v2 = 2;
      goto LABEL_18;
    case 4u:
      char v2 = 3;
      goto LABEL_18;
    case 0x30u:
      char v2 = 4;
      goto LABEL_18;
    case 0x31u:
      char v2 = 5;
      goto LABEL_18;
    case 0x32u:
      char v2 = 6;
      goto LABEL_18;
    case 0x33u:
      char v2 = 7;
      goto LABEL_18;
    case 0x34u:
      char v2 = 8;
      goto LABEL_18;
    case 0x35u:
      char v2 = 9;
      goto LABEL_18;
    case 0x36u:
      char v2 = 10;
      goto LABEL_18;
    case 0x37u:
      char v2 = 11;
      goto LABEL_18;
    case 0x38u:
      char v2 = 12;
      goto LABEL_18;
    case 0x39u:
      char v2 = 13;
      goto LABEL_18;
    case 0x50u:
      char v2 = 14;
      goto LABEL_18;
    case 0x51u:
      char v2 = 15;
LABEL_18:
      char v3 = v2;
      goto LABEL_19;
    case 0x52u:
LABEL_19:
      char *v1 = v3;
      break;
    case 0x53u:
      char *v1 = 17;
      break;
    case 0x54u:
      char *v1 = 18;
      break;
    case 0x55u:
      char *v1 = 19;
      break;
    case 0x56u:
      char *v1 = 20;
      break;
    case 0x57u:
      char *v1 = 21;
      break;
    case 0x58u:
      char *v1 = 22;
      break;
    case 0x59u:
      char *v1 = 23;
      break;
    case 0x5Au:
      char *v1 = 24;
      break;
    case 0x5Bu:
      char *v1 = 25;
      break;
    case 0x5Cu:
      char *v1 = 26;
      break;
    case 0x5Du:
      char *v1 = 27;
      break;
    case 0x5Eu:
      char *v1 = 28;
      break;
    case 0x5Fu:
      char *v1 = 29;
      break;
    case 0x60u:
      char *v1 = 30;
      break;
    case 0x61u:
      char *v1 = 31;
      break;
    case 0x62u:
      char *v1 = 32;
      break;
    case 0x63u:
      char *v1 = 33;
      break;
    default:
      char *v1 = 34;
      break;
  }

  return (CoreHID::HIDUsage::SportControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::GameControlsUsage_optional __swiftcall HIDUsage.GameControlsUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 11;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_13;
    case 2u:
      char v2 = 1;
      goto LABEL_13;
    case 3u:
      char v2 = 2;
      goto LABEL_13;
    case 0x20u:
      char v2 = 3;
      goto LABEL_13;
    case 0x21u:
      char v2 = 4;
      goto LABEL_13;
    case 0x22u:
      char v2 = 5;
      goto LABEL_13;
    case 0x23u:
      char v2 = 6;
      goto LABEL_13;
    case 0x24u:
      char v2 = 7;
      goto LABEL_13;
    case 0x25u:
      char v2 = 8;
      goto LABEL_13;
    case 0x26u:
      char v2 = 9;
      goto LABEL_13;
    case 0x27u:
      char v2 = 10;
LABEL_13:
      char v3 = v2;
      goto LABEL_14;
    case 0x28u:
LABEL_14:
      char *v1 = v3;
      break;
    case 0x29u:
      char *v1 = 12;
      break;
    case 0x2Au:
      char *v1 = 13;
      break;
    case 0x2Bu:
      char *v1 = 14;
      break;
    case 0x2Cu:
      char *v1 = 15;
      break;
    case 0x2Du:
      char *v1 = 16;
      break;
    case 0x2Eu:
      char *v1 = 17;
      break;
    case 0x2Fu:
      char *v1 = 18;
      break;
    case 0x30u:
      char *v1 = 19;
      break;
    case 0x31u:
      char *v1 = 20;
      break;
    case 0x32u:
      char *v1 = 21;
      break;
    case 0x33u:
      char *v1 = 22;
      break;
    case 0x34u:
      char *v1 = 23;
      break;
    case 0x35u:
      char *v1 = 24;
      break;
    case 0x36u:
      char *v1 = 25;
      break;
    case 0x37u:
      char *v1 = 26;
      break;
    case 0x39u:
      char *v1 = 27;
      break;
    case 0x3Au:
      char *v1 = 28;
      break;
    default:
      char *v1 = 29;
      break;
  }

  return (CoreHID::HIDUsage::GameControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::GenericDeviceControlsUsage_optional __swiftcall HIDUsage.GenericDeviceControlsUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 6;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_8;
    case 0x20u:
      char v2 = 1;
      goto LABEL_8;
    case 0x21u:
      char v2 = 2;
      goto LABEL_8;
    case 0x22u:
      char v2 = 3;
      goto LABEL_8;
    case 0x23u:
      char v2 = 4;
      goto LABEL_8;
    case 0x24u:
      char v2 = 5;
LABEL_8:
      char v3 = v2;
      goto LABEL_9;
    case 0x25u:
LABEL_9:
      char *v1 = v3;
      break;
    case 0x26u:
      char *v1 = 7;
      break;
    case 0x27u:
      char *v1 = 8;
      break;
    case 0x28u:
      char *v1 = 9;
      break;
    case 0x29u:
      char *v1 = 10;
      break;
    case 0x2Au:
      char *v1 = 11;
      break;
    case 0x2Bu:
      char *v1 = 12;
      break;
    case 0x2Cu:
      char *v1 = 13;
      break;
    case 0x2Du:
      char *v1 = 14;
      break;
    case 0x2Eu:
      char *v1 = 15;
      break;
    case 0x2Fu:
      char *v1 = 16;
      break;
    case 0x30u:
      char *v1 = 17;
      break;
    case 0x31u:
      char *v1 = 18;
      break;
    case 0x32u:
      char *v1 = 19;
      break;
    case 0x33u:
      char *v1 = 20;
      break;
    case 0x34u:
      char *v1 = 21;
      break;
    case 0x40u:
      char *v1 = 22;
      break;
    case 0x41u:
      char *v1 = 23;
      break;
    default:
      char *v1 = 24;
      break;
  }

  return (CoreHID::HIDUsage::GenericDeviceControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional __swiftcall HIDUsage.KeyboardOrKeypadUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = rawValue - 1;
  if ((unsigned __int16)(rawValue - 1) >= 0x80u)
  {
    char v2 = 0x80;
    switch(rawValue)
    {
      case 0x81u:
        goto LABEL_2;
      case 0x82u:
        char *v1 = -127;
        break;
      case 0x83u:
        char *v1 = -126;
        break;
      case 0x84u:
        char *v1 = -125;
        break;
      case 0x85u:
        char *v1 = -124;
        break;
      case 0x86u:
        char *v1 = -123;
        break;
      case 0x87u:
        char *v1 = -122;
        break;
      case 0x88u:
        char *v1 = -121;
        break;
      case 0x89u:
        char *v1 = -120;
        break;
      case 0x8Au:
        char *v1 = -119;
        break;
      case 0x8Bu:
        char *v1 = -118;
        break;
      case 0x8Cu:
        char *v1 = -117;
        break;
      case 0x8Du:
        char *v1 = -116;
        break;
      case 0x8Eu:
        char *v1 = -115;
        break;
      case 0x8Fu:
        char *v1 = -114;
        break;
      case 0x90u:
        char *v1 = -113;
        break;
      case 0x91u:
        char *v1 = -112;
        break;
      case 0x92u:
        char *v1 = -111;
        break;
      case 0x93u:
        char *v1 = -110;
        break;
      case 0x94u:
        char *v1 = -109;
        break;
      case 0x95u:
        char *v1 = -108;
        break;
      case 0x96u:
        char *v1 = -107;
        break;
      case 0x97u:
        char *v1 = -106;
        break;
      case 0x98u:
        char *v1 = -105;
        break;
      case 0x99u:
        char *v1 = -104;
        break;
      case 0x9Au:
        char *v1 = -103;
        break;
      case 0x9Bu:
        char *v1 = -102;
        break;
      case 0x9Cu:
        char *v1 = -101;
        break;
      case 0x9Du:
        char *v1 = -100;
        break;
      case 0x9Eu:
        char *v1 = -99;
        break;
      case 0x9Fu:
        char *v1 = -98;
        break;
      case 0xA0u:
        char *v1 = -97;
        break;
      case 0xA1u:
        char *v1 = -96;
        break;
      case 0xA2u:
        char *v1 = -95;
        break;
      case 0xA3u:
        char *v1 = -94;
        break;
      case 0xA4u:
        char *v1 = -93;
        break;
      case 0xB0u:
        char *v1 = -92;
        break;
      case 0xB1u:
        char *v1 = -91;
        break;
      case 0xB2u:
        char *v1 = -90;
        break;
      case 0xB3u:
        char *v1 = -89;
        break;
      case 0xB4u:
        char *v1 = -88;
        break;
      case 0xB5u:
        char *v1 = -87;
        break;
      case 0xB6u:
        char *v1 = -86;
        break;
      case 0xB7u:
        char *v1 = -85;
        break;
      case 0xB8u:
        char *v1 = -84;
        break;
      case 0xB9u:
        char *v1 = -83;
        break;
      case 0xBAu:
        char *v1 = -82;
        break;
      case 0xBBu:
        char *v1 = -81;
        break;
      case 0xBCu:
        char *v1 = -80;
        break;
      case 0xBDu:
        char *v1 = -79;
        break;
      case 0xBEu:
        char *v1 = -78;
        break;
      case 0xBFu:
        char *v1 = -77;
        break;
      case 0xC0u:
        char *v1 = -76;
        break;
      case 0xC1u:
        char *v1 = -75;
        break;
      case 0xC2u:
        char *v1 = -74;
        break;
      case 0xC3u:
        char *v1 = -73;
        break;
      case 0xC4u:
        char *v1 = -72;
        break;
      case 0xC5u:
        char *v1 = -71;
        break;
      case 0xC6u:
        char *v1 = -70;
        break;
      case 0xC7u:
        char *v1 = -69;
        break;
      case 0xC8u:
        char *v1 = -68;
        break;
      case 0xC9u:
        char *v1 = -67;
        break;
      case 0xCAu:
        char *v1 = -66;
        break;
      case 0xCBu:
        char *v1 = -65;
        break;
      default:
        char v3 = -56;
        char v2 = -64;
        switch(rawValue)
        {
          case 0xCCu:
            goto LABEL_2;
          case 0xCDu:
            char *v1 = -63;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xCEu:
            char *v1 = -62;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xCFu:
            char *v1 = -61;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD0u:
            char *v1 = -60;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD1u:
            char *v1 = -59;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD2u:
            char *v1 = -58;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD3u:
            char *v1 = -57;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD4u:
            goto LABEL_85;
          case 0xD5u:
            char *v1 = -55;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD6u:
            char *v1 = -54;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD7u:
            char *v1 = -53;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD8u:
            char *v1 = -52;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xD9u:
            char *v1 = -51;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xDAu:
            char *v1 = -50;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xDBu:
            char *v1 = -49;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xDCu:
            char *v1 = -48;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xDDu:
            char *v1 = -47;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE0u:
            char *v1 = -46;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE1u:
            char *v1 = -45;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE2u:
            char *v1 = -44;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE3u:
            char *v1 = -43;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE4u:
            char *v1 = -42;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE5u:
            char *v1 = -41;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE6u:
            char *v1 = -40;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          case 0xE7u:
            char *v1 = -39;
            return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
          default:
            char v3 = -38;
LABEL_85:
            char *v1 = v3;
            break;
        }

        break;
    }
  }

  else
  {
LABEL_2:
    char *v1 = v2;
  }

  return (CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional)rawValue;
}

CoreHID::HIDUsage::LEDUsage_optional __swiftcall HIDUsage.LEDUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 78;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_79;
    case 2u:
      char v2 = 1;
      goto LABEL_79;
    case 3u:
      char v2 = 2;
      goto LABEL_79;
    case 4u:
      char v2 = 3;
      goto LABEL_79;
    case 5u:
      char v2 = 4;
      goto LABEL_79;
    case 6u:
      char v2 = 5;
      goto LABEL_79;
    case 7u:
      char v2 = 6;
      goto LABEL_79;
    case 8u:
      char v2 = 7;
      goto LABEL_79;
    case 9u:
      char v2 = 8;
      goto LABEL_79;
    case 0xAu:
      char v2 = 9;
      goto LABEL_79;
    case 0xBu:
      char v2 = 10;
      goto LABEL_79;
    case 0xCu:
      char v2 = 11;
      goto LABEL_79;
    case 0xDu:
      char v2 = 12;
      goto LABEL_79;
    case 0xEu:
      char v2 = 13;
      goto LABEL_79;
    case 0xFu:
      char v2 = 14;
      goto LABEL_79;
    case 0x10u:
      char v2 = 15;
      goto LABEL_79;
    case 0x11u:
      char v2 = 16;
      goto LABEL_79;
    case 0x12u:
      char v2 = 17;
      goto LABEL_79;
    case 0x13u:
      char v2 = 18;
      goto LABEL_79;
    case 0x14u:
      char v2 = 19;
      goto LABEL_79;
    case 0x15u:
      char v2 = 20;
      goto LABEL_79;
    case 0x16u:
      char v2 = 21;
      goto LABEL_79;
    case 0x17u:
      char v2 = 22;
      goto LABEL_79;
    case 0x18u:
      char v2 = 23;
      goto LABEL_79;
    case 0x19u:
      char v2 = 24;
      goto LABEL_79;
    case 0x1Au:
      char v2 = 25;
      goto LABEL_79;
    case 0x1Bu:
      char v2 = 26;
      goto LABEL_79;
    case 0x1Cu:
      char v2 = 27;
      goto LABEL_79;
    case 0x1Du:
      char v2 = 28;
      goto LABEL_79;
    case 0x1Eu:
      char v2 = 29;
      goto LABEL_79;
    case 0x1Fu:
      char v2 = 30;
      goto LABEL_79;
    case 0x20u:
      char v2 = 31;
      goto LABEL_79;
    case 0x21u:
      char v2 = 32;
      goto LABEL_79;
    case 0x22u:
      char v2 = 33;
      goto LABEL_79;
    case 0x23u:
      char v2 = 34;
      goto LABEL_79;
    case 0x24u:
      char v2 = 35;
      goto LABEL_79;
    case 0x25u:
      char v2 = 36;
      goto LABEL_79;
    case 0x26u:
      char v2 = 37;
      goto LABEL_79;
    case 0x27u:
      char v2 = 38;
      goto LABEL_79;
    case 0x28u:
      char v2 = 39;
      goto LABEL_79;
    case 0x29u:
      char v2 = 40;
      goto LABEL_79;
    case 0x2Au:
      char v2 = 41;
      goto LABEL_79;
    case 0x2Bu:
      char v2 = 42;
      goto LABEL_79;
    case 0x2Cu:
      char v2 = 43;
      goto LABEL_79;
    case 0x2Du:
      char v2 = 44;
      goto LABEL_79;
    case 0x2Eu:
      char v2 = 45;
      goto LABEL_79;
    case 0x2Fu:
      char v2 = 46;
      goto LABEL_79;
    case 0x30u:
      char v2 = 47;
      goto LABEL_79;
    case 0x31u:
      char v2 = 48;
      goto LABEL_79;
    case 0x32u:
      char v2 = 49;
      goto LABEL_79;
    case 0x33u:
      char v2 = 50;
      goto LABEL_79;
    case 0x34u:
      char v2 = 51;
      goto LABEL_79;
    case 0x35u:
      char v2 = 52;
      goto LABEL_79;
    case 0x36u:
      char v2 = 53;
      goto LABEL_79;
    case 0x37u:
      char v2 = 54;
      goto LABEL_79;
    case 0x38u:
      char v2 = 55;
      goto LABEL_79;
    case 0x39u:
      char v2 = 56;
      goto LABEL_79;
    case 0x3Au:
      char v2 = 57;
      goto LABEL_79;
    case 0x3Bu:
      char v2 = 58;
      goto LABEL_79;
    case 0x3Cu:
      char v2 = 59;
      goto LABEL_79;
    case 0x3Du:
      char v2 = 60;
      goto LABEL_79;
    case 0x3Eu:
      char v2 = 61;
      goto LABEL_79;
    case 0x3Fu:
      char v2 = 62;
      goto LABEL_79;
    case 0x40u:
      char v2 = 63;
      goto LABEL_79;
    case 0x41u:
      char v2 = 64;
      goto LABEL_79;
    case 0x42u:
      char v2 = 65;
      goto LABEL_79;
    case 0x43u:
      char v2 = 66;
      goto LABEL_79;
    case 0x44u:
      char v2 = 67;
      goto LABEL_79;
    case 0x45u:
      char v2 = 68;
      goto LABEL_79;
    case 0x46u:
      char v2 = 69;
      goto LABEL_79;
    case 0x47u:
      char v2 = 70;
      goto LABEL_79;
    case 0x48u:
      char v2 = 71;
      goto LABEL_79;
    case 0x49u:
      char v2 = 72;
      goto LABEL_79;
    case 0x4Au:
      char v2 = 73;
      goto LABEL_79;
    case 0x4Bu:
      char v2 = 74;
      goto LABEL_79;
    case 0x4Cu:
      char v2 = 75;
      goto LABEL_79;
    case 0x4Du:
      char v2 = 76;
      goto LABEL_79;
    case 0x4Eu:
      char v2 = 77;
LABEL_79:
      char v3 = v2;
      goto LABEL_80;
    case 0x4Fu:
LABEL_80:
      char *v1 = v3;
      break;
    case 0x50u:
      char *v1 = 79;
      break;
    case 0x51u:
      char *v1 = 80;
      break;
    case 0x52u:
      char *v1 = 81;
      break;
    case 0x53u:
      char *v1 = 82;
      break;
    case 0x54u:
      char *v1 = 83;
      break;
    case 0x55u:
      char *v1 = 84;
      break;
    case 0x56u:
      char *v1 = 85;
      break;
    case 0x57u:
      char *v1 = 86;
      break;
    case 0x60u:
      char *v1 = 87;
      break;
    case 0x61u:
      char *v1 = 88;
      break;
    case 0x62u:
      char *v1 = 89;
      break;
    case 0x63u:
      char *v1 = 90;
      break;
    case 0x64u:
      char *v1 = 91;
      break;
    case 0x65u:
      char *v1 = 92;
      break;
    case 0x66u:
      char *v1 = 93;
      break;
    case 0x67u:
      char *v1 = 94;
      break;
    case 0x68u:
      char *v1 = 95;
      break;
    default:
      char *v1 = 96;
      break;
  }

  return (CoreHID::HIDUsage::LEDUsage_optional)rawValue;
}

CoreHID::HIDUsage::TelephonyDeviceUsage_optional __swiftcall HIDUsage.TelephonyDeviceUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 81;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_83;
    case 2u:
      char v2 = 1;
      goto LABEL_83;
    case 3u:
      char v2 = 2;
      goto LABEL_83;
    case 4u:
      char v2 = 3;
      goto LABEL_83;
    case 5u:
      char v2 = 4;
      goto LABEL_83;
    case 6u:
      char v2 = 5;
      goto LABEL_83;
    case 7u:
      char v2 = 6;
      goto LABEL_83;
    case 0x20u:
      char v2 = 7;
      goto LABEL_83;
    case 0x21u:
      char v2 = 8;
      goto LABEL_83;
    case 0x22u:
      char v2 = 9;
      goto LABEL_83;
    case 0x23u:
      char v2 = 10;
      goto LABEL_83;
    case 0x24u:
      char v2 = 11;
      goto LABEL_83;
    case 0x25u:
      char v2 = 12;
      goto LABEL_83;
    case 0x26u:
      char v2 = 13;
      goto LABEL_83;
    case 0x27u:
      char v2 = 14;
      goto LABEL_83;
    case 0x28u:
      char v2 = 15;
      goto LABEL_83;
    case 0x29u:
      char v2 = 16;
      goto LABEL_83;
    case 0x2Au:
      char v2 = 17;
      goto LABEL_83;
    case 0x2Bu:
      char v2 = 18;
      goto LABEL_83;
    case 0x2Cu:
      char v2 = 19;
      goto LABEL_83;
    case 0x2Du:
      char v2 = 20;
      goto LABEL_83;
    case 0x2Eu:
      char v2 = 21;
      goto LABEL_83;
    case 0x2Fu:
      char v2 = 22;
      goto LABEL_83;
    case 0x30u:
      char v2 = 23;
      goto LABEL_83;
    case 0x31u:
      char v2 = 24;
      goto LABEL_83;
    case 0x50u:
      char v2 = 25;
      goto LABEL_83;
    case 0x51u:
      char v2 = 26;
      goto LABEL_83;
    case 0x52u:
      char v2 = 27;
      goto LABEL_83;
    case 0x53u:
      char v2 = 28;
      goto LABEL_83;
    case 0x70u:
      char v2 = 29;
      goto LABEL_83;
    case 0x71u:
      char v2 = 30;
      goto LABEL_83;
    case 0x72u:
      char v2 = 31;
      goto LABEL_83;
    case 0x73u:
      char v2 = 32;
      goto LABEL_83;
    case 0x74u:
      char v2 = 33;
      goto LABEL_83;
    case 0x90u:
      char v2 = 34;
      goto LABEL_83;
    case 0x91u:
      char v2 = 35;
      goto LABEL_83;
    case 0x92u:
      char v2 = 36;
      goto LABEL_83;
    case 0x93u:
      char v2 = 37;
      goto LABEL_83;
    case 0x94u:
      char v2 = 38;
      goto LABEL_83;
    case 0x95u:
      char v2 = 39;
      goto LABEL_83;
    case 0x96u:
      char v2 = 40;
      goto LABEL_83;
    case 0x97u:
      char v2 = 41;
      goto LABEL_83;
    case 0x98u:
      char v2 = 42;
      goto LABEL_83;
    case 0x99u:
      char v2 = 43;
      goto LABEL_83;
    case 0x9Au:
      char v2 = 44;
      goto LABEL_83;
    case 0x9Bu:
      char v2 = 45;
      goto LABEL_83;
    case 0x9Cu:
      char v2 = 46;
      goto LABEL_83;
    case 0x9Du:
      char v2 = 47;
      goto LABEL_83;
    case 0x9Eu:
      char v2 = 48;
      goto LABEL_83;
    case 0xB0u:
      char v2 = 49;
      goto LABEL_83;
    case 0xB1u:
      char v2 = 50;
      goto LABEL_83;
    case 0xB2u:
      char v2 = 51;
      goto LABEL_83;
    case 0xB3u:
      char v2 = 52;
      goto LABEL_83;
    case 0xB4u:
      char v2 = 53;
      goto LABEL_83;
    case 0xB5u:
      char v2 = 54;
      goto LABEL_83;
    case 0xB6u:
      char v2 = 55;
      goto LABEL_83;
    case 0xB7u:
      char v2 = 56;
      goto LABEL_83;
    case 0xB8u:
      char v2 = 57;
      goto LABEL_83;
    case 0xB9u:
      char v2 = 58;
      goto LABEL_83;
    case 0xBAu:
      char v2 = 59;
      goto LABEL_83;
    case 0xBBu:
      char v2 = 60;
      goto LABEL_83;
    case 0xBCu:
      char v2 = 61;
      goto LABEL_83;
    case 0xBDu:
      char v2 = 62;
      goto LABEL_83;
    case 0xBEu:
      char v2 = 63;
      goto LABEL_83;
    case 0xBFu:
      char v2 = 64;
      goto LABEL_83;
    case 0xC0u:
      char v2 = 65;
      goto LABEL_83;
    case 0xC1u:
      char v2 = 66;
      goto LABEL_83;
    case 0xC2u:
      char v2 = 67;
      goto LABEL_83;
    case 0xF0u:
      char v2 = 68;
      goto LABEL_83;
    case 0xF1u:
      char v2 = 69;
      goto LABEL_83;
    case 0xF2u:
      char v2 = 70;
      goto LABEL_83;
    case 0xF3u:
      char v2 = 71;
      goto LABEL_83;
    case 0xF4u:
      char v2 = 72;
      goto LABEL_83;
    case 0xF5u:
      char v2 = 73;
      goto LABEL_83;
    case 0xF8u:
      char v2 = 74;
      goto LABEL_83;
    case 0xF9u:
      char v2 = 75;
      goto LABEL_83;
    case 0xFAu:
      char v2 = 76;
      goto LABEL_83;
    case 0xFBu:
      char v2 = 77;
      goto LABEL_83;
    case 0xFCu:
      char v2 = 78;
      goto LABEL_83;
    case 0xFDu:
      char v2 = 79;
      goto LABEL_83;
    case 0xFEu:
      char v2 = 80;
LABEL_83:
      char v3 = v2;
      goto LABEL_84;
    case 0x108u:
LABEL_84:
      char *v1 = v3;
      break;
    case 0x109u:
      char *v1 = 82;
      break;
    case 0x10Au:
      char *v1 = 83;
      break;
    case 0x110u:
      char *v1 = 84;
      break;
    case 0x111u:
      char *v1 = 85;
      break;
    case 0x112u:
      char *v1 = 86;
      break;
    case 0x113u:
      char *v1 = 87;
      break;
    case 0x114u:
      char *v1 = 88;
      break;
    case 0x140u:
      char *v1 = 89;
      break;
    case 0x141u:
      char *v1 = 90;
      break;
    case 0x142u:
      char *v1 = 91;
      break;
    case 0x143u:
      char *v1 = 92;
      break;
    case 0x144u:
      char *v1 = 93;
      break;
    case 0x145u:
      char *v1 = 94;
      break;
    case 0x146u:
      char *v1 = 95;
      break;
    case 0x147u:
      char *v1 = 96;
      break;
    case 0x14Au:
      char *v1 = 97;
      break;
    case 0x14Bu:
      char *v1 = 98;
      break;
    default:
      char *v1 = 99;
      break;
  }

  return (CoreHID::HIDUsage::TelephonyDeviceUsage_optional)rawValue;
}

CoreHID::HIDUsage::ConsumerUsage_optional __swiftcall HIDUsage.ConsumerUsage.init(rawValue:)( CoreHID::HIDUsage::ConsumerUsage_optional rawValue)
{
  __int16 v2 = 0;
  switch(rawValue.value)
  {
    case CoreHID_HIDUsage_ConsumerUsage_numericKeyPad:
LABEL_2:
      __int16 *v1 = v2;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_programmableButtons:
      __int16 *v1 = 1;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_microphone:
      __int16 *v1 = 2;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_headphone:
      __int16 *v1 = 3;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_graphicEqualizer:
      __int16 *v1 = 4;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_plus10:
      __int16 *v1 = 5;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_pictureInPictureToggle:
      __int16 *v1 = 6;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_pictureInPictureSwap:
      __int16 *v1 = 7;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_redMenuButton:
      __int16 *v1 = 8;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_cameraAccessDisabled:
      __int16 *v1 = 9;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_cameraAccessToggle:
      __int16 *v1 = 10;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBrightnessIncrement:
      __int16 *v1 = 11;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBrightnessDecrement:
      __int16 *v1 = 12;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBacklightSetLevel:
      __int16 *v1 = 13;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBacklightOOC:
      __int16 *v1 = 14;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_keyboardBacklightSetMinimum:
      __int16 *v1 = 15;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelection:
      __int16 *v1 = 16;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectComputer:
      __int16 *v1 = 17;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectTV:
      __int16 *v1 = 18;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectWWW:
      __int16 *v1 = 19;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectDVD:
      __int16 *v1 = 20;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectTelephone:
      __int16 *v1 = 21;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectProgramGuide:
      __int16 *v1 = 22;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectVideoPhone:
      __int16 *v1 = 23;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mediaSelectGames:
      __int16 *v1 = 24;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_fastForward:
      __int16 *v1 = 25;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_rewind:
      __int16 *v1 = 26;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_scanNextTrack:
      __int16 *v1 = 27;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_scanPreviousTrack:
      __int16 *v1 = 28;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_stop:
      __int16 *v1 = 29;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_eject:
      __int16 *v1 = 30;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_randomPlay:
      __int16 *v1 = 31;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_selectDisc:
      __int16 *v1 = 32;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_enterDisc:
      __int16 *v1 = 33;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_repeatTrack:
      __int16 *v1 = 34;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_tracking:
      __int16 *v1 = 35;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_trackNormal:
      __int16 *v1 = 36;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_slowTracking:
      __int16 *v1 = 37;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_frameForward:
      __int16 *v1 = 38;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_frameBack:
      __int16 *v1 = 39;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mark:
      __int16 *v1 = 40;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_clearMark:
      __int16 *v1 = 41;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_repeatFromMark:
      __int16 *v1 = 42;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_returnToMark:
      __int16 *v1 = 43;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_searchMarkForward:
      __int16 *v1 = 44;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_searchMarkBackwards:
      __int16 *v1 = 45;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_counterReset:
      __int16 *v1 = 46;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_showCounter:
      __int16 *v1 = 47;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_trackingIncrement:
      __int16 *v1 = 48;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_trackingDecrement:
      __int16 *v1 = 49;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_stopOrEject:
      __int16 *v1 = 50;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_playOrPause:
      __int16 *v1 = 51;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_playOrSkip:
      __int16 *v1 = 52;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_voiceCommand:
      __int16 *v1 = 53;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_invokeCaptureInterface:
      __int16 *v1 = 54;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopGameRecording:
      __int16 *v1 = 55;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_historicalGameCapture:
      __int16 *v1 = 56;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_captureGameScreenshot:
      __int16 *v1 = 57;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_showOrHideRecordingIndicator:
      __int16 *v1 = 58;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopMicrophoneCapture:
      __int16 *v1 = 59;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopCameraCapture:
      __int16 *v1 = 60;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopGameBroadcast:
      __int16 *v1 = 61;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_startOrStopVoiceDictationSession:
      __int16 *v1 = 62;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_invokeOrDismissEmojiPicker:
      __int16 *v1 = 63;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_volume:
      __int16 *v1 = 64;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_balance:
      __int16 *v1 = 65;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mute:
      __int16 *v1 = 66;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_bass:
      __int16 *v1 = 67;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_treble:
      __int16 *v1 = 68;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_bassBoost:
      __int16 *v1 = 69;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_surroundMode:
      __int16 *v1 = 70;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_loudness:
      __int16 *v1 = 71;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_mpx:
      __int16 *v1 = 72;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_volumeIncrement:
      __int16 *v1 = 73;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_volumeDecrement:
      __int16 *v1 = 74;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_speedSelect:
      __int16 *v1 = 75;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_playbackSpeed:
      __int16 *v1 = 76;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_standardPlay:
      __int16 *v1 = 77;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_longPlay:
      __int16 *v1 = 78;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_extendedPlay:
      __int16 *v1 = 79;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_slow:
      __int16 *v1 = 80;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_fanEnable:
      __int16 *v1 = 81;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_fanSpeed:
      __int16 *v1 = 82;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_lightEnable:
      __int16 *v1 = 83;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_lightIlluminationLevel:
      __int16 *v1 = 84;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_climateControlEnable:
      __int16 *v1 = 85;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_roomTemperature:
      __int16 *v1 = 86;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_securityEnable:
      __int16 *v1 = 87;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_policeAlarm:
      __int16 *v1 = 88;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_proximity:
      __int16 *v1 = 89;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_motion:
      __int16 *v1 = 90;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_duressAlarm:
      __int16 *v1 = 91;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_holdupAlarm:
      __int16 *v1 = 92;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelFront:
      __int16 *v1 = 93;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelCenterFront:
      __int16 *v1 = 94;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelSide:
      __int16 *v1 = 95;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelSurround:
      __int16 *v1 = 96;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelLowFrequencyEnhancement:
      __int16 *v1 = 97;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelTop:
      __int16 *v1 = 98;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_channelUnknown:
      __int16 *v1 = 99;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_subChannel:
      __int16 *v1 = 100;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_subChannelIncrement:
      __int16 *v1 = 101;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_subChannelDecrement:
      __int16 *v1 = 102;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alternateAudioIncrement:
      __int16 *v1 = 103;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alternateAudioDecrement:
      __int16 *v1 = 104;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_applicationLaunchButtons:
      __int16 *v1 = 105;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alLaunchButtonConfigurationTool:
      __int16 *v1 = 106;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alProgrammableButtonConfiguration:
      __int16 *v1 = 107;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alConsumerControlConfiguration:
      __int16 *v1 = 108;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alWordProcessor:
      __int16 *v1 = 109;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alTextEditor:
      __int16 *v1 = 110;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alSpreadsheet:
      __int16 *v1 = 111;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alGraphicsEditor:
      __int16 *v1 = 112;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alPresentationApp:
      __int16 *v1 = 113;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alDatabaseApp:
      __int16 *v1 = 114;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alEmailReader:
      __int16 *v1 = 115;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alNewsreader:
      __int16 *v1 = 116;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alVoicemail:
      __int16 *v1 = 117;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alContactsOrAddressBook:
      __int16 *v1 = 118;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alCalendarOrSchedule:
      __int16 *v1 = 119;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alTaskOrProjectManager:
      __int16 *v1 = 120;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alLogOrJournalOrTimecard:
      __int16 *v1 = 121;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alCheckbookOrFinance:
      __int16 *v1 = 122;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alCalculator:
      __int16 *v1 = 123;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alAVCaptureOrPlayback:
      __int16 *v1 = 124;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alLocalMachineBrowser:
      __int16 *v1 = 125;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alLANOrWANBrowser:
      __int16 *v1 = 126;
      break;
    case CoreHID_HIDUsage_ConsumerUsage_alInternetBrowser:
      __int16 *v1 = 127;
      break;
    default:
      __int16 v2 = 128;
      switch(rawValue.value)
      {
        case CoreHID_HIDUsage_ConsumerUsage_alRemoteNetworkingOrISPConnect:
          goto LABEL_2;
        case CoreHID_HIDUsage_ConsumerUsage_alNetworkConference:
          __int16 *v1 = 129;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alNetworkChat:
          __int16 *v1 = 130;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alTelephonyOrDialer:
          __int16 *v1 = 131;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alLogon:
          __int16 *v1 = 132;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alLogoff:
          __int16 *v1 = 133;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alLogonOrLogoff:
          __int16 *v1 = 134;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alPreviousTaskOrApplication:
          __int16 *v1 = 135;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alPreemptiveHaltTaskOrApplication:
          __int16 *v1 = 136;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alIntegratedHelpCenter:
          __int16 *v1 = 137;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alDocuments:
          __int16 *v1 = 138;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alThesaurus:
          __int16 *v1 = 139;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alDictionary:
          __int16 *v1 = 140;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alDesktop:
          __int16 *v1 = 141;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alSpellCheck:
          __int16 *v1 = 142;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alGrammarCheck:
          __int16 *v1 = 143;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alWirelessStatus:
          __int16 *v1 = 144;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alKeyboardLayout:
          __int16 *v1 = 145;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alFileBrowser:
          __int16 *v1 = 146;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alPowerStatus:
          __int16 *v1 = 147;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alImageBrowser:
          __int16 *v1 = 148;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alAudioBrowser:
          __int16 *v1 = 149;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alMovieBrowser:
          __int16 *v1 = 150;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alDigitalRightsManager:
          __int16 *v1 = 151;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alOnlineActivityBrowser:
          __int16 *v1 = 152;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alResearchOrSearchBrowser:
          __int16 *v1 = 153;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alAudioPlayer:
          __int16 *v1 = 154;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alMessageStatus:
          __int16 *v1 = 155;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alContactSync:
          __int16 *v1 = 156;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alNavigation:
          __int16 *v1 = 157;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_alContextAwareDesktopAssistant:
          __int16 *v1 = 158;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_genericGUIApplicationControls:
          __int16 *v1 = 159;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acNew:
          __int16 *v1 = 160;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acOpen:
          __int16 *v1 = 161;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acClose:
          __int16 *v1 = 162;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acExit:
          __int16 *v1 = 163;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acMaximize:
          __int16 *v1 = 164;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acMinimize:
          __int16 *v1 = 165;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acRestartNumbering:
          __int16 *v1 = 166;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acBulletedList:
          __int16 *v1 = 167;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acPromote:
          __int16 *v1 = 168;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acDemote:
          __int16 *v1 = 169;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acYes:
          __int16 *v1 = 170;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acNo:
          __int16 *v1 = 171;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acInsertMode:
          __int16 *v1 = 172;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acDelete:
          __int16 *v1 = 173;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acLock:
          __int16 *v1 = 174;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acUnlock:
          __int16 *v1 = 175;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acProtect:
          __int16 *v1 = 176;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acUnprotect:
          __int16 *v1 = 177;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acAttachComment:
          __int16 *v1 = 178;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acDeleteComment:
          __int16 *v1 = 179;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acViewComment:
          __int16 *v1 = 180;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSelectWord:
          __int16 *v1 = 181;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSelectSentence:
          __int16 *v1 = 182;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acRedoOrRepeat:
          __int16 *v1 = 183;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSort:
          __int16 *v1 = 184;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSortAscending:
          __int16 *v1 = 185;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSortDescending:
          __int16 *v1 = 186;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acFilter:
          __int16 *v1 = 187;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acReply:
          __int16 *v1 = 188;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acReplyAll:
          __int16 *v1 = 189;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acForwardMsg:
          __int16 *v1 = 190;
          break;
        case CoreHID_HIDUsage_ConsumerUsage_acSend:
          __int16 *v1 = 191;
          break;
        default:
          __int16 v2 = 192;
          switch(rawValue.value)
          {
            case CoreHID_HIDUsage_ConsumerUsage_acAttachFile:
              goto LABEL_2;
            case CoreHID_HIDUsage_ConsumerUsage_acUpload:
              __int16 *v1 = 193;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDownloadSaveTargetAs:
              __int16 *v1 = 194;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSetBorders:
              __int16 *v1 = 195;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertRow:
              __int16 *v1 = 196;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertColumn:
              __int16 *v1 = 197;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertFile:
              __int16 *v1 = 198;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertPicture:
              __int16 *v1 = 199;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertObject:
              __int16 *v1 = 200;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acInsertSymbol:
              __int16 *v1 = 201;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSaveAndClose:
              __int16 *v1 = 202;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acRename:
              __int16 *v1 = 203;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acMerge:
              __int16 *v1 = 204;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSplit:
              __int16 *v1 = 205;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDisributeHorizontally:
              __int16 *v1 = 206;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDistributeVertically:
              __int16 *v1 = 207;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acNextKeyboardLayoutSelect:
              __int16 *v1 = 208;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acNavigationGuidance:
              __int16 *v1 = 209;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDesktopShowAllWindows:
              __int16 *v1 = 210;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSoftKeyLeft:
              __int16 *v1 = 211;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acSoftKeyRight:
              __int16 *v1 = 212;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acDesktopShowAllApplications:
              __int16 *v1 = 213;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_acIdleKeepAlive:
              __int16 *v1 = 214;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_extendedKeyboardAttributesCollection:
              __int16 *v1 = 215;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardFormFactor:
              __int16 *v1 = 216;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardKeyType:
              __int16 *v1 = 217;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardPhysicalLayout:
              __int16 *v1 = 218;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_vendorSpecificKeyboardPhysicalLayout:
              __int16 *v1 = 219;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardIETFLanguageTagIndex:
              __int16 *v1 = 220;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_implementedKeyboardInputAssistControls:
              __int16 *v1 = 221;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistPrevious:
              __int16 *v1 = 222;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistNext:
              __int16 *v1 = 223;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistPreviousGroup:
              __int16 *v1 = 224;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistNextGroup:
              __int16 *v1 = 225;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistAccept:
              __int16 *v1 = 226;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_keyboardInputAssistCancel:
              __int16 *v1 = 227;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenToggle:
              __int16 *v1 = 228;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenLevelDecrement:
              __int16 *v1 = 229;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenLevelIncrement:
              __int16 *v1 = 230;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenLevelMinimum:
              __int16 *v1 = 231;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_privacyScreenLevelMaximum:
              __int16 *v1 = 232;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactEdited:
              __int16 *v1 = 233;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactAdded:
              __int16 *v1 = 234;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactRecordActive:
              __int16 *v1 = 235;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactIndex:
              __int16 *v1 = 236;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactNickname:
              __int16 *v1 = 237;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactFirstName:
              __int16 *v1 = 238;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactLastName:
              __int16 *v1 = 239;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactFullName:
              __int16 *v1 = 240;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberPersonal:
              __int16 *v1 = 241;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberBusiness:
              __int16 *v1 = 242;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberMobile:
              __int16 *v1 = 243;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberPager:
              __int16 *v1 = 244;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberFax:
              __int16 *v1 = 245;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactPhoneNumberOther:
              __int16 *v1 = 246;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactEmailBusiness:
              __int16 *v1 = 247;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactEmailOther:
              __int16 *v1 = 248;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactEmailMain:
              __int16 *v1 = 249;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactSpeedDialNumber:
              __int16 *v1 = 250;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactStatusFlag:
              __int16 *v1 = 251;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactMiscellaneous:
              __int16 *v1 = 252;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_unknownDefault:
              __int16 *v1 = 253;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_unknownDefault|CoreHID_HIDUsage_ConsumerUsage_numericKeyPad:
              __int16 *v1 = 254;
              break;
            case CoreHID_HIDUsage_ConsumerUsage_contactStatusFlag|CoreHID_HIDUsage_ConsumerUsage_headphone:
              __int16 *v1 = 255;
              break;
            default:
              __int16 v2 = 256;
              switch(rawValue.value)
              {
                case 0x1C5:
                  goto LABEL_2;
                case 0x1C6:
                  __int16 *v1 = 257;
                  break;
                case 0x1C7:
                  __int16 *v1 = 258;
                  break;
                case 0x1C8:
                  __int16 *v1 = 259;
                  break;
                case 0x1C9:
                  __int16 *v1 = 260;
                  break;
                case 0x1CA:
                  __int16 *v1 = 261;
                  break;
                case 0x1CB:
                  __int16 *v1 = 262;
                  break;
                case 0x200:
                  __int16 *v1 = 263;
                  break;
                case 0x201:
                  __int16 *v1 = 264;
                  break;
                case 0x202:
                  __int16 *v1 = 265;
                  break;
                case 0x203:
                  __int16 *v1 = 266;
                  break;
                case 0x204:
                  __int16 *v1 = 267;
                  break;
                case 0x205:
                  __int16 *v1 = 268;
                  break;
                case 0x206:
                  __int16 *v1 = 269;
                  break;
                case 0x207:
                  __int16 *v1 = 270;
                  break;
                case 0x208:
                  __int16 *v1 = 271;
                  break;
                case 0x209:
                  __int16 *v1 = 272;
                  break;
                case 0x21A:
                  __int16 *v1 = 273;
                  break;
                case 0x21B:
                  __int16 *v1 = 274;
                  break;
                case 0x21C:
                  __int16 *v1 = 275;
                  break;
                case 0x21D:
                  __int16 *v1 = 276;
                  break;
                case 0x21E:
                  __int16 *v1 = 277;
                  break;
                case 0x21F:
                  __int16 *v1 = 278;
                  break;
                case 0x220:
                  __int16 *v1 = 279;
                  break;
                case 0x221:
                  __int16 *v1 = 280;
                  break;
                case 0x222:
                  __int16 *v1 = 281;
                  break;
                case 0x223:
                  __int16 *v1 = 282;
                  break;
                case 0x224:
                  __int16 *v1 = 283;
                  break;
                case 0x225:
                  __int16 *v1 = 284;
                  break;
                case 0x226:
                  __int16 *v1 = 285;
                  break;
                case 0x227:
                  __int16 *v1 = 286;
                  break;
                case 0x228:
                  __int16 *v1 = 287;
                  break;
                case 0x229:
                  __int16 *v1 = 288;
                  break;
                case 0x22A:
                  __int16 *v1 = 289;
                  break;
                case 0x22B:
                  __int16 *v1 = 290;
                  break;
                case 0x22C:
                  __int16 *v1 = 291;
                  break;
                case 0x22D:
                  __int16 *v1 = 292;
                  break;
                case 0x22E:
                  __int16 *v1 = 293;
                  break;
                case 0x22F:
                  __int16 *v1 = 294;
                  break;
                case 0x230:
                  __int16 *v1 = 295;
                  break;
                case 0x231:
                  __int16 *v1 = 296;
                  break;
                case 0x232:
                  __int16 *v1 = 297;
                  break;
                case 0x233:
                  __int16 *v1 = 298;
                  break;
                case 0x234:
                  __int16 *v1 = 299;
                  break;
                case 0x235:
                  __int16 *v1 = 300;
                  break;
                case 0x236:
                  __int16 *v1 = 301;
                  break;
                case 0x237:
                  __int16 *v1 = 302;
                  break;
                case 0x238:
                  __int16 *v1 = 303;
                  break;
                case 0x239:
                  __int16 *v1 = 304;
                  break;
                case 0x23A:
                  __int16 *v1 = 305;
                  break;
                case 0x23B:
                  __int16 *v1 = 306;
                  break;
                case 0x23C:
                  __int16 *v1 = 307;
                  break;
                case 0x23D:
                  __int16 *v1 = 308;
                  break;
                case 0x23E:
                  __int16 *v1 = 309;
                  break;
                case 0x23F:
                  __int16 *v1 = 310;
                  break;
                case 0x240:
                  __int16 *v1 = 311;
                  break;
                case 0x241:
                  __int16 *v1 = 312;
                  break;
                case 0x242:
                  __int16 *v1 = 313;
                  break;
                case 0x243:
                  __int16 *v1 = 314;
                  break;
                case 0x244:
                  __int16 *v1 = 315;
                  break;
                case 0x245:
                  __int16 *v1 = 316;
                  break;
                case 0x246:
                  __int16 *v1 = 317;
                  break;
                case 0x247:
                  __int16 *v1 = 318;
                  break;
                case 0x248:
                  __int16 *v1 = 319;
                  break;
                default:
                  if ((unsigned __int16)(rawValue.value - 585) >= 0x40u)
                  {
                    __int16 v2 = 384;
                    switch(rawValue.value)
                    {
                      case CoreHID_HIDUsage_ConsumerUsage_mute|0x200:
                        goto LABEL_2;
                      case CoreHID_HIDUsage_ConsumerUsage_bass|0x200:
                        __int16 *v1 = 385;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_treble|0x200:
                        __int16 *v1 = 386;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_bassBoost|0x200:
                        __int16 *v1 = 387;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_surroundMode|0x200:
                        __int16 *v1 = 388;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_loudness|0x200:
                        __int16 *v1 = 389;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_mpx|0x200:
                        __int16 *v1 = 390;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_volumeIncrement|0x200:
                        __int16 *v1 = 391;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_volumeDecrement|0x200:
                        __int16 *v1 = 392;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_speedSelect|0x200:
                        __int16 *v1 = 393;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_playbackSpeed|0x200:
                        __int16 *v1 = 394;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_standardPlay|0x200:
                        __int16 *v1 = 395;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_longPlay|0x200:
                        __int16 *v1 = 396;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_extendedPlay|0x200:
                        __int16 *v1 = 397;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_slow|0x200:
                        __int16 *v1 = 398;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_fanEnable|0x200:
                        __int16 *v1 = 399;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_fanSpeed|0x200:
                        __int16 *v1 = 400;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_lightEnable|0x200:
                        __int16 *v1 = 401;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_lightIlluminationLevel|0x200:
                        __int16 *v1 = 402;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_climateControlEnable|0x200:
                        __int16 *v1 = 403;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_roomTemperature|0x200:
                        __int16 *v1 = 404;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_securityEnable|0x200:
                        __int16 *v1 = 405;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_fireAlarm|0x200:
                        __int16 *v1 = 406;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_policeAlarm|0x200:
                        __int16 *v1 = 407;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_proximity|0x200:
                        __int16 *v1 = 408;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_motion|0x200:
                        __int16 *v1 = 409;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_channelFront|0x200:
                        __int16 *v1 = 410;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alWordProcessor|0x200:
                        __int16 *v1 = 411;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alTextEditor|0x200:
                        __int16 *v1 = 412;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alSpreadsheet|0x200:
                        __int16 *v1 = 413;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alGraphicsEditor|0x200:
                        __int16 *v1 = 414;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alPresentationApp|0x200:
                        __int16 *v1 = 415;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alDatabaseApp|0x200:
                        __int16 *v1 = 416;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alEmailReader|0x200:
                        __int16 *v1 = 417;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alNewsreader|0x200:
                        __int16 *v1 = 418;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alVoicemail|0x200:
                        __int16 *v1 = 419;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alContactsOrAddressBook|0x200:
                        __int16 *v1 = 420;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alCalendarOrSchedule|0x200:
                        __int16 *v1 = 421;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alTaskOrProjectManager|0x200:
                        __int16 *v1 = 422;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alLogOrJournalOrTimecard|0x200:
                        __int16 *v1 = 423;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alLocalMachineBrowser|0x200:
                        __int16 *v1 = 424;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alLANOrWANBrowser|0x200:
                        __int16 *v1 = 425;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alInternetBrowser|0x200:
                        __int16 *v1 = 426;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alRemoteNetworkingOrISPConnect|0x200:
                        __int16 *v1 = 427;
                        break;
                      case CoreHID_HIDUsage_ConsumerUsage_alNetworkConference|0x200:
                        __int16 *v1 = 428;
                        break;
                      default:
                        if (rawValue.value == (CoreHID_HIDUsage_ConsumerUsage_acPaste|0x400)) {
                          __int16 v3 = 449;
                        }
                        else {
                          __int16 v3 = 450;
                        }
                        if (rawValue.value == (CoreHID_HIDUsage_ConsumerUsage_acCut|0x400)) {
                          __int16 v4 = 448;
                        }
                        else {
                          __int16 v4 = v3;
                        }
                        __int16 *v1 = v4;
                        break;
                    }
                  }

                  else
                  {
                    __int16 *v1 = rawValue.value - 265;
                  }

                  break;
              }

              break;
          }

          break;
      }

      break;
  }

  return rawValue;
}

CoreHID::HIDUsage::DigitizersUsage_optional __swiftcall HIDUsage.DigitizersUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 90;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_92;
    case 2u:
      char v2 = 1;
      goto LABEL_92;
    case 3u:
      char v2 = 2;
      goto LABEL_92;
    case 4u:
      char v2 = 3;
      goto LABEL_92;
    case 5u:
      char v2 = 4;
      goto LABEL_92;
    case 6u:
      char v2 = 5;
      goto LABEL_92;
    case 7u:
      char v2 = 6;
      goto LABEL_92;
    case 8u:
      char v2 = 7;
      goto LABEL_92;
    case 9u:
      char v2 = 8;
      goto LABEL_92;
    case 0xAu:
      char v2 = 9;
      goto LABEL_92;
    case 0xBu:
      char v2 = 10;
      goto LABEL_92;
    case 0xCu:
      char v2 = 11;
      goto LABEL_92;
    case 0xDu:
      char v2 = 12;
      goto LABEL_92;
    case 0xEu:
      char v2 = 13;
      goto LABEL_92;
    case 0xFu:
      char v2 = 14;
      goto LABEL_92;
    case 0x20u:
      char v2 = 15;
      goto LABEL_92;
    case 0x21u:
      char v2 = 16;
      goto LABEL_92;
    case 0x22u:
      char v2 = 17;
      goto LABEL_92;
    case 0x23u:
      char v2 = 18;
      goto LABEL_92;
    case 0x24u:
      char v2 = 19;
      goto LABEL_92;
    case 0x30u:
      char v2 = 20;
      goto LABEL_92;
    case 0x31u:
      char v2 = 21;
      goto LABEL_92;
    case 0x32u:
      char v2 = 22;
      goto LABEL_92;
    case 0x33u:
      char v2 = 23;
      goto LABEL_92;
    case 0x34u:
      char v2 = 24;
      goto LABEL_92;
    case 0x35u:
      char v2 = 25;
      goto LABEL_92;
    case 0x36u:
      char v2 = 26;
      goto LABEL_92;
    case 0x37u:
      char v2 = 27;
      goto LABEL_92;
    case 0x38u:
      char v2 = 28;
      goto LABEL_92;
    case 0x39u:
      char v2 = 29;
      goto LABEL_92;
    case 0x3Au:
      char v2 = 30;
      goto LABEL_92;
    case 0x3Bu:
      char v2 = 31;
      goto LABEL_92;
    case 0x3Cu:
      char v2 = 32;
      goto LABEL_92;
    case 0x3Du:
      char v2 = 33;
      goto LABEL_92;
    case 0x3Eu:
      char v2 = 34;
      goto LABEL_92;
    case 0x3Fu:
      char v2 = 35;
      goto LABEL_92;
    case 0x40u:
      char v2 = 36;
      goto LABEL_92;
    case 0x41u:
      char v2 = 37;
      goto LABEL_92;
    case 0x42u:
      char v2 = 38;
      goto LABEL_92;
    case 0x43u:
      char v2 = 39;
      goto LABEL_92;
    case 0x44u:
      char v2 = 40;
      goto LABEL_92;
    case 0x45u:
      char v2 = 41;
      goto LABEL_92;
    case 0x46u:
      char v2 = 42;
      goto LABEL_92;
    case 0x47u:
      char v2 = 43;
      goto LABEL_92;
    case 0x48u:
      char v2 = 44;
      goto LABEL_92;
    case 0x49u:
      char v2 = 45;
      goto LABEL_92;
    case 0x51u:
      char v2 = 46;
      goto LABEL_92;
    case 0x52u:
      char v2 = 47;
      goto LABEL_92;
    case 0x53u:
      char v2 = 48;
      goto LABEL_92;
    case 0x54u:
      char v2 = 49;
      goto LABEL_92;
    case 0x55u:
      char v2 = 50;
      goto LABEL_92;
    case 0x56u:
      char v2 = 51;
      goto LABEL_92;
    case 0x57u:
      char v2 = 52;
      goto LABEL_92;
    case 0x58u:
      char v2 = 53;
      goto LABEL_92;
    case 0x59u:
      char v2 = 54;
      goto LABEL_92;
    case 0x5Au:
      char v2 = 55;
      goto LABEL_92;
    case 0x5Bu:
      char v2 = 56;
      goto LABEL_92;
    case 0x5Cu:
      char v2 = 57;
      goto LABEL_92;
    case 0x5Du:
      char v2 = 58;
      goto LABEL_92;
    case 0x5Eu:
      char v2 = 59;
      goto LABEL_92;
    case 0x5Fu:
      char v2 = 60;
      goto LABEL_92;
    case 0x60u:
      char v2 = 61;
      goto LABEL_92;
    case 0x61u:
      char v2 = 62;
      goto LABEL_92;
    case 0x62u:
      char v2 = 63;
      goto LABEL_92;
    case 0x63u:
      char v2 = 64;
      goto LABEL_92;
    case 0x64u:
      char v2 = 65;
      goto LABEL_92;
    case 0x65u:
      char v2 = 66;
      goto LABEL_92;
    case 0x66u:
      char v2 = 67;
      goto LABEL_92;
    case 0x67u:
      char v2 = 68;
      goto LABEL_92;
    case 0x68u:
      char v2 = 69;
      goto LABEL_92;
    case 0x69u:
      char v2 = 70;
      goto LABEL_92;
    case 0x6Au:
      char v2 = 71;
      goto LABEL_92;
    case 0x6Bu:
      char v2 = 72;
      goto LABEL_92;
    case 0x6Cu:
      char v2 = 73;
      goto LABEL_92;
    case 0x6Du:
      char v2 = 74;
      goto LABEL_92;
    case 0x6Eu:
      char v2 = 75;
      goto LABEL_92;
    case 0x6Fu:
      char v2 = 76;
      goto LABEL_92;
    case 0x70u:
      char v2 = 77;
      goto LABEL_92;
    case 0x71u:
      char v2 = 78;
      goto LABEL_92;
    case 0x72u:
      char v2 = 79;
      goto LABEL_92;
    case 0x73u:
      char v2 = 80;
      goto LABEL_92;
    case 0x74u:
      char v2 = 81;
      goto LABEL_92;
    case 0x75u:
      char v2 = 82;
      goto LABEL_92;
    case 0x76u:
      char v2 = 83;
      goto LABEL_92;
    case 0x77u:
      char v2 = 84;
      goto LABEL_92;
    case 0x80u:
      char v2 = 85;
      goto LABEL_92;
    case 0x81u:
      char v2 = 86;
      goto LABEL_92;
    case 0x82u:
      char v2 = 87;
      goto LABEL_92;
    case 0x83u:
      char v2 = 88;
      goto LABEL_92;
    case 0x84u:
      char v2 = 89;
LABEL_92:
      char v3 = v2;
      goto LABEL_93;
    case 0x85u:
LABEL_93:
      char *v1 = v3;
      break;
    case 0x90u:
      char *v1 = 91;
      break;
    case 0x91u:
      char *v1 = 92;
      break;
    case 0x92u:
      char *v1 = 93;
      break;
    case 0x93u:
      char *v1 = 94;
      break;
    case 0x94u:
      char *v1 = 95;
      break;
    case 0x95u:
      char *v1 = 96;
      break;
    case 0x96u:
      char *v1 = 97;
      break;
    case 0x97u:
      char *v1 = 98;
      break;
    case 0x98u:
      char *v1 = 99;
      break;
    case 0xA0u:
      char *v1 = 100;
      break;
    case 0xA1u:
      char *v1 = 101;
      break;
    case 0xA2u:
      char *v1 = 102;
      break;
    case 0xA3u:
      char *v1 = 103;
      break;
    case 0xA4u:
      char *v1 = 104;
      break;
    case 0xA5u:
      char *v1 = 105;
      break;
    case 0xA6u:
      char *v1 = 106;
      break;
    case 0xB0u:
      char *v1 = 107;
      break;
    default:
      char *v1 = 108;
      break;
  }

  return (CoreHID::HIDUsage::DigitizersUsage_optional)rawValue;
}

CoreHID::HIDUsage::HapticsUsage_optional __swiftcall HIDUsage.HapticsUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  switch(rawValue)
  {
    case 0x1001u:
      char *v1 = 12;
      break;
    case 0x1002u:
      char *v1 = 13;
      break;
    case 0x1003u:
      char *v1 = 14;
      break;
    case 0x1004u:
      char *v1 = 15;
      break;
    case 0x1005u:
      char *v1 = 16;
      break;
    case 0x1006u:
      char *v1 = 17;
      break;
    case 0x1007u:
      char *v1 = 18;
      break;
    case 0x1008u:
      char *v1 = 19;
      break;
    case 0x1009u:
      char *v1 = 20;
      break;
    case 0x100Au:
      char *v1 = 21;
      break;
    case 0x100Bu:
      char *v1 = 22;
      break;
    case 0x100Cu:
      char *v1 = 23;
      break;
    case 0x100Du:
      char *v1 = 24;
      break;
    case 0x100Eu:
      char *v1 = 25;
      break;
    case 0x100Fu:
      char *v1 = 26;
      break;
    case 0x1010u:
      char *v1 = 27;
      break;
    case 0x1011u:
      char *v1 = 28;
      break;
    default:
      char v2 = 0;
      char v3 = 11;
      switch(rawValue)
      {
        case 1u:
          goto LABEL_30;
        case 0x10u:
          char v2 = 1;
          goto LABEL_30;
        case 0x11u:
          char v2 = 2;
          goto LABEL_30;
        case 0x20u:
          char v2 = 3;
          goto LABEL_30;
        case 0x21u:
          char v2 = 4;
          goto LABEL_30;
        case 0x22u:
          char v2 = 5;
          goto LABEL_30;
        case 0x23u:
          char v2 = 6;
          goto LABEL_30;
        case 0x24u:
          char v2 = 7;
          goto LABEL_30;
        case 0x25u:
          char v2 = 8;
          goto LABEL_30;
        case 0x26u:
          char v2 = 9;
          goto LABEL_30;
        case 0x27u:
          char v2 = 10;
LABEL_30:
          char v3 = v2;
          goto LABEL_31;
        case 0x28u:
LABEL_31:
          char *v1 = v3;
          break;
        default:
          char *v1 = 29;
          break;
      }

      break;
  }

  return (CoreHID::HIDUsage::HapticsUsage_optional)rawValue;
}

CoreHID::HIDUsage::PhysicalInputDeviceUsage_optional __swiftcall HIDUsage.PhysicalInputDeviceUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 87;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_89;
    case 0x20u:
      char v2 = 1;
      goto LABEL_89;
    case 0x21u:
      char v2 = 2;
      goto LABEL_89;
    case 0x22u:
      char v2 = 3;
      goto LABEL_89;
    case 0x23u:
      char v2 = 4;
      goto LABEL_89;
    case 0x24u:
      char v2 = 5;
      goto LABEL_89;
    case 0x25u:
      char v2 = 6;
      goto LABEL_89;
    case 0x26u:
      char v2 = 7;
      goto LABEL_89;
    case 0x27u:
      char v2 = 8;
      goto LABEL_89;
    case 0x28u:
      char v2 = 9;
      goto LABEL_89;
    case 0x30u:
      char v2 = 10;
      goto LABEL_89;
    case 0x31u:
      char v2 = 11;
      goto LABEL_89;
    case 0x32u:
      char v2 = 12;
      goto LABEL_89;
    case 0x33u:
      char v2 = 13;
      goto LABEL_89;
    case 0x34u:
      char v2 = 14;
      goto LABEL_89;
    case 0x40u:
      char v2 = 15;
      goto LABEL_89;
    case 0x41u:
      char v2 = 16;
      goto LABEL_89;
    case 0x42u:
      char v2 = 17;
      goto LABEL_89;
    case 0x43u:
      char v2 = 18;
      goto LABEL_89;
    case 0x50u:
      char v2 = 19;
      goto LABEL_89;
    case 0x51u:
      char v2 = 20;
      goto LABEL_89;
    case 0x52u:
      char v2 = 21;
      goto LABEL_89;
    case 0x53u:
      char v2 = 22;
      goto LABEL_89;
    case 0x54u:
      char v2 = 23;
      goto LABEL_89;
    case 0x55u:
      char v2 = 24;
      goto LABEL_89;
    case 0x56u:
      char v2 = 25;
      goto LABEL_89;
    case 0x57u:
      char v2 = 26;
      goto LABEL_89;
    case 0x58u:
      char v2 = 27;
      goto LABEL_89;
    case 0x59u:
      char v2 = 28;
      goto LABEL_89;
    case 0x5Au:
      char v2 = 29;
      goto LABEL_89;
    case 0x5Bu:
      char v2 = 30;
      goto LABEL_89;
    case 0x5Cu:
      char v2 = 31;
      goto LABEL_89;
    case 0x5Du:
      char v2 = 32;
      goto LABEL_89;
    case 0x5Eu:
      char v2 = 33;
      goto LABEL_89;
    case 0x5Fu:
      char v2 = 34;
      goto LABEL_89;
    case 0x60u:
      char v2 = 35;
      goto LABEL_89;
    case 0x61u:
      char v2 = 36;
      goto LABEL_89;
    case 0x62u:
      char v2 = 37;
      goto LABEL_89;
    case 0x63u:
      char v2 = 38;
      goto LABEL_89;
    case 0x64u:
      char v2 = 39;
      goto LABEL_89;
    case 0x65u:
      char v2 = 40;
      goto LABEL_89;
    case 0x66u:
      char v2 = 41;
      goto LABEL_89;
    case 0x67u:
      char v2 = 42;
      goto LABEL_89;
    case 0x68u:
      char v2 = 43;
      goto LABEL_89;
    case 0x69u:
      char v2 = 44;
      goto LABEL_89;
    case 0x6Au:
      char v2 = 45;
      goto LABEL_89;
    case 0x6Bu:
      char v2 = 46;
      goto LABEL_89;
    case 0x6Cu:
      char v2 = 47;
      goto LABEL_89;
    case 0x6Du:
      char v2 = 48;
      goto LABEL_89;
    case 0x6Eu:
      char v2 = 49;
      goto LABEL_89;
    case 0x6Fu:
      char v2 = 50;
      goto LABEL_89;
    case 0x70u:
      char v2 = 51;
      goto LABEL_89;
    case 0x71u:
      char v2 = 52;
      goto LABEL_89;
    case 0x72u:
      char v2 = 53;
      goto LABEL_89;
    case 0x73u:
      char v2 = 54;
      goto LABEL_89;
    case 0x74u:
      char v2 = 55;
      goto LABEL_89;
    case 0x75u:
      char v2 = 56;
      goto LABEL_89;
    case 0x76u:
      char v2 = 57;
      goto LABEL_89;
    case 0x77u:
      char v2 = 58;
      goto LABEL_89;
    case 0x78u:
      char v2 = 59;
      goto LABEL_89;
    case 0x79u:
      char v2 = 60;
      goto LABEL_89;
    case 0x7Au:
      char v2 = 61;
      goto LABEL_89;
    case 0x7Bu:
      char v2 = 62;
      goto LABEL_89;
    case 0x7Cu:
      char v2 = 63;
      goto LABEL_89;
    case 0x7Du:
      char v2 = 64;
      goto LABEL_89;
    case 0x7Eu:
      char v2 = 65;
      goto LABEL_89;
    case 0x7Fu:
      char v2 = 66;
      goto LABEL_89;
    case 0x80u:
      char v2 = 67;
      goto LABEL_89;
    case 0x81u:
      char v2 = 68;
      goto LABEL_89;
    case 0x82u:
      char v2 = 69;
      goto LABEL_89;
    case 0x83u:
      char v2 = 70;
      goto LABEL_89;
    case 0x84u:
      char v2 = 71;
      goto LABEL_89;
    case 0x85u:
      char v2 = 72;
      goto LABEL_89;
    case 0x86u:
      char v2 = 73;
      goto LABEL_89;
    case 0x87u:
      char v2 = 74;
      goto LABEL_89;
    case 0x88u:
      char v2 = 75;
      goto LABEL_89;
    case 0x89u:
      char v2 = 76;
      goto LABEL_89;
    case 0x8Bu:
      char v2 = 77;
      goto LABEL_89;
    case 0x8Cu:
      char v2 = 78;
      goto LABEL_89;
    case 0x8Du:
      char v2 = 79;
      goto LABEL_89;
    case 0x8Eu:
      char v2 = 80;
      goto LABEL_89;
    case 0x8Fu:
      char v2 = 81;
      goto LABEL_89;
    case 0x90u:
      char v2 = 82;
      goto LABEL_89;
    case 0x91u:
      char v2 = 83;
      goto LABEL_89;
    case 0x92u:
      char v2 = 84;
      goto LABEL_89;
    case 0x94u:
      char v2 = 85;
      goto LABEL_89;
    case 0x95u:
      char v2 = 86;
LABEL_89:
      char v3 = v2;
      goto LABEL_90;
    case 0x96u:
LABEL_90:
      char *v1 = v3;
      break;
    case 0x97u:
      char *v1 = 88;
      break;
    case 0x98u:
      char *v1 = 89;
      break;
    case 0x99u:
      char *v1 = 90;
      break;
    case 0x9Au:
      char *v1 = 91;
      break;
    case 0x9Bu:
      char *v1 = 92;
      break;
    case 0x9Cu:
      char *v1 = 93;
      break;
    case 0x9Fu:
      char *v1 = 94;
      break;
    case 0xA0u:
      char *v1 = 95;
      break;
    case 0xA4u:
      char *v1 = 96;
      break;
    case 0xA5u:
      char *v1 = 97;
      break;
    case 0xA6u:
      char *v1 = 98;
      break;
    case 0xA7u:
      char *v1 = 99;
      break;
    case 0xA8u:
      char *v1 = 100;
      break;
    case 0xA9u:
      char *v1 = 101;
      break;
    case 0xAAu:
      char *v1 = 102;
      break;
    case 0xABu:
      char *v1 = 103;
      break;
    case 0xACu:
      char *v1 = 104;
      break;
    default:
      char *v1 = 105;
      break;
  }

  return (CoreHID::HIDUsage::PhysicalInputDeviceUsage_optional)rawValue;
}

CoreHID::HIDUsage::SOCUsage_optional __swiftcall HIDUsage.SOCUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  unsigned int v2 = (unsigned __int16)(rawValue - 1);
  if (v2 >= 0xA) {
    LOBYTE(v2) = 10;
  }
  _BYTE *v1 = v2;
  return (CoreHID::HIDUsage::SOCUsage_optional)rawValue;
}

CoreHID::HIDUsage::EyeAndHeadTrackersUsage_optional __swiftcall HIDUsage.EyeAndHeadTrackersUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  if (rawValue > 0xFFu)
  {
    if (rawValue <= 0x1FFu)
    {
      switch(rawValue)
      {
        case 0x100u:
          char *v1 = 19;
          break;
        case 0x101u:
          char *v1 = 20;
          break;
        case 0x102u:
          char *v1 = 21;
          break;
        case 0x103u:
          char *v1 = 22;
          break;
        case 0x104u:
          char *v1 = 23;
          break;
        case 0x105u:
          char *v1 = 24;
          break;
        default:
          goto LABEL_44;
      }
    }

    else if (rawValue > 0x2FFu)
    {
      switch(rawValue)
      {
        case 0x300u:
          char *v1 = 31;
          break;
        case 0x301u:
          char *v1 = 32;
          break;
        case 0x400u:
          char *v1 = 33;
          break;
        default:
LABEL_44:
          char *v1 = 34;
          break;
      }
    }

    else
    {
      switch(rawValue)
      {
        case 0x200u:
          char *v1 = 25;
          break;
        case 0x201u:
          char *v1 = 26;
          break;
        case 0x202u:
          char *v1 = 27;
          break;
        case 0x203u:
          char *v1 = 28;
          break;
        case 0x204u:
          char *v1 = 29;
          break;
        case 0x205u:
          char *v1 = 30;
          break;
        default:
          goto LABEL_44;
      }
    }
  }

  else
  {
    char v2 = 0;
    char v3 = 16;
    switch(rawValue)
    {
      case 1u:
        goto LABEL_28;
      case 2u:
        char v2 = 1;
        goto LABEL_28;
      case 0x10u:
        char v2 = 2;
        goto LABEL_28;
      case 0x11u:
        char v2 = 3;
        goto LABEL_28;
      case 0x12u:
        char v2 = 4;
        goto LABEL_28;
      case 0x13u:
        char v2 = 5;
        goto LABEL_28;
      case 0x14u:
        char v2 = 6;
        goto LABEL_28;
      case 0x20u:
        char v2 = 7;
        goto LABEL_28;
      case 0x21u:
        char v2 = 8;
        goto LABEL_28;
      case 0x22u:
        char v2 = 9;
        goto LABEL_28;
      case 0x23u:
        char v2 = 10;
        goto LABEL_28;
      case 0x24u:
        char v2 = 11;
        goto LABEL_28;
      case 0x25u:
        char v2 = 12;
        goto LABEL_28;
      case 0x26u:
        char v2 = 13;
        goto LABEL_28;
      case 0x27u:
        char v2 = 14;
        goto LABEL_28;
      case 0x28u:
        char v2 = 15;
LABEL_28:
        char v3 = v2;
        goto LABEL_29;
      case 0x29u:
LABEL_29:
        char *v1 = v3;
        break;
      case 0x2Au:
        char *v1 = 17;
        break;
      case 0x2Bu:
        char *v1 = 18;
        break;
      default:
        goto LABEL_44;
    }
  }

  return (CoreHID::HIDUsage::EyeAndHeadTrackersUsage_optional)rawValue;
}

CoreHID::HIDUsage::AuxiliaryDisplayUsage_optional __swiftcall HIDUsage.AuxiliaryDisplayUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 57;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_58;
    case 2u:
      char v2 = 1;
      goto LABEL_58;
    case 0x20u:
      char v2 = 2;
      goto LABEL_58;
    case 0x21u:
      char v2 = 3;
      goto LABEL_58;
    case 0x22u:
      char v2 = 4;
      goto LABEL_58;
    case 0x23u:
      char v2 = 5;
      goto LABEL_58;
    case 0x24u:
      char v2 = 6;
      goto LABEL_58;
    case 0x25u:
      char v2 = 7;
      goto LABEL_58;
    case 0x26u:
      char v2 = 8;
      goto LABEL_58;
    case 0x27u:
      char v2 = 9;
      goto LABEL_58;
    case 0x28u:
      char v2 = 10;
      goto LABEL_58;
    case 0x29u:
      char v2 = 11;
      goto LABEL_58;
    case 0x2Au:
      char v2 = 12;
      goto LABEL_58;
    case 0x2Bu:
      char v2 = 13;
      goto LABEL_58;
    case 0x2Cu:
      char v2 = 14;
      goto LABEL_58;
    case 0x2Du:
      char v2 = 15;
      goto LABEL_58;
    case 0x2Eu:
      char v2 = 16;
      goto LABEL_58;
    case 0x2Fu:
      char v2 = 17;
      goto LABEL_58;
    case 0x30u:
      char v2 = 18;
      goto LABEL_58;
    case 0x31u:
      char v2 = 19;
      goto LABEL_58;
    case 0x32u:
      char v2 = 20;
      goto LABEL_58;
    case 0x33u:
      char v2 = 21;
      goto LABEL_58;
    case 0x34u:
      char v2 = 22;
      goto LABEL_58;
    case 0x35u:
      char v2 = 23;
      goto LABEL_58;
    case 0x36u:
      char v2 = 24;
      goto LABEL_58;
    case 0x37u:
      char v2 = 25;
      goto LABEL_58;
    case 0x38u:
      char v2 = 26;
      goto LABEL_58;
    case 0x39u:
      char v2 = 27;
      goto LABEL_58;
    case 0x3Au:
      char v2 = 28;
      goto LABEL_58;
    case 0x3Bu:
      char v2 = 29;
      goto LABEL_58;
    case 0x3Cu:
      char v2 = 30;
      goto LABEL_58;
    case 0x3Du:
      char v2 = 31;
      goto LABEL_58;
    case 0x3Eu:
      char v2 = 32;
      goto LABEL_58;
    case 0x3Fu:
      char v2 = 33;
      goto LABEL_58;
    case 0x40u:
      char v2 = 34;
      goto LABEL_58;
    case 0x41u:
      char v2 = 35;
      goto LABEL_58;
    case 0x42u:
      char v2 = 36;
      goto LABEL_58;
    case 0x43u:
      char v2 = 37;
      goto LABEL_58;
    case 0x44u:
      char v2 = 38;
      goto LABEL_58;
    case 0x45u:
      char v2 = 39;
      goto LABEL_58;
    case 0x46u:
      char v2 = 40;
      goto LABEL_58;
    case 0x47u:
      char v2 = 41;
      goto LABEL_58;
    case 0x48u:
      char v2 = 42;
      goto LABEL_58;
    case 0x49u:
      char v2 = 43;
      goto LABEL_58;
    case 0x4Au:
      char v2 = 44;
      goto LABEL_58;
    case 0x4Bu:
      char v2 = 45;
      goto LABEL_58;
    case 0x4Cu:
      char v2 = 46;
      goto LABEL_58;
    case 0x4Du:
      char v2 = 47;
      goto LABEL_58;
    case 0x80u:
      char v2 = 48;
      goto LABEL_58;
    case 0x81u:
      char v2 = 49;
      goto LABEL_58;
    case 0x82u:
      char v2 = 50;
      goto LABEL_58;
    case 0x83u:
      char v2 = 51;
      goto LABEL_58;
    case 0x84u:
      char v2 = 52;
      goto LABEL_58;
    case 0x85u:
      char v2 = 53;
      goto LABEL_58;
    case 0x86u:
      char v2 = 54;
      goto LABEL_58;
    case 0x87u:
      char v2 = 55;
      goto LABEL_58;
    case 0x88u:
      char v2 = 56;
LABEL_58:
      char v3 = v2;
      goto LABEL_59;
    case 0x8Au:
LABEL_59:
      char *v1 = v3;
      break;
    case 0x8Bu:
      char *v1 = 58;
      break;
    case 0x8Cu:
      char *v1 = 59;
      break;
    case 0x8Du:
      char *v1 = 60;
      break;
    case 0x8Eu:
      char *v1 = 61;
      break;
    case 0x8Fu:
      char *v1 = 62;
      break;
    case 0x90u:
      char *v1 = 63;
      break;
    case 0x91u:
      char *v1 = 64;
      break;
    case 0x92u:
      char *v1 = 65;
      break;
    case 0x93u:
      char *v1 = 66;
      break;
    case 0x94u:
      char *v1 = 67;
      break;
    case 0x95u:
      char *v1 = 68;
      break;
    case 0xC2u:
      char *v1 = 69;
      break;
    case 0xCCu:
      char *v1 = 70;
      break;
    case 0xCFu:
      char *v1 = 71;
      break;
    case 0xDDu:
      char *v1 = 72;
      break;
    case 0xDFu:
      char *v1 = 73;
      break;
    case 0xFFu:
      char *v1 = 74;
      break;
    default:
      char *v1 = 75;
      break;
  }

  return (CoreHID::HIDUsage::AuxiliaryDisplayUsage_optional)rawValue;
}

CoreHID::HIDUsage::SensorsUsage_optional __swiftcall HIDUsage.SensorsUsage.init(rawValue:)( CoreHID::HIDUsage::SensorsUsage_optional rawValue)
{
  __int16 v2 = 0;
  switch(rawValue.value)
  {
    case CoreHID_HIDUsage_SensorsUsage_biometric:
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalResistance:
      __int16 v2 = 1;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalVoltage:
      __int16 v2 = 2;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalPotentiometer:
      __int16 v2 = 3;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalFrequency:
      __int16 v2 = 4;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_electricalPeriod:
      __int16 v2 = 5;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmental:
      __int16 v2 = 6;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalAtmosphericPressure:
      __int16 v2 = 7;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalHumidity:
      __int16 v2 = 8;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalTemperature:
      __int16 v2 = 9;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalWindDirection:
      __int16 v2 = 10;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_environmentalObjectProximity:
      __int16 v2 = 11;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_light:
      __int16 v2 = 12;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightAmbientLight:
      __int16 v2 = 13;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightConsumerInfrared:
      __int16 v2 = 14;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightInfraredLight:
      __int16 v2 = 15;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightVisibleLight:
      __int16 v2 = 16;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_lightUltravioletLight:
      __int16 v2 = 17;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_location:
      __int16 v2 = 18;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_locationBroadcast:
      __int16 v2 = 19;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_locationDeadReckoning:
      __int16 v2 = 20;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalBooleanSwitch:
      __int16 v2 = 21;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalBooleanSwitchArray:
      __int16 v2 = 22;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalMultivalueSwitch:
      __int16 v2 = 23;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalForce:
      __int16 v2 = 24;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalPressure:
      __int16 v2 = 25;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalStrain:
      __int16 v2 = 26;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalWeight:
      __int16 v2 = 27;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalHapticVibrator:
      __int16 v2 = 28;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_mechanicalHallEffectSwitch:
      __int16 v2 = 29;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motion:
      __int16 v2 = 30;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionAccelerometer1D:
      __int16 v2 = 31;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionAccelerometer2D:
      __int16 v2 = 32;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionMotionDetector:
      __int16 v2 = 33;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionSpeedometer:
      __int16 v2 = 34;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionAccelerometer:
      __int16 v2 = 35;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionGyrometer:
      __int16 v2 = 36;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionGravityVector:
      __int16 v2 = 37;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_motionLinearAccelerometer:
      __int16 v2 = 38;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationDeviceOrientation:
      __int16 v2 = 39;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationCompass:
      __int16 v2 = 40;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationInclinometer:
      __int16 v2 = 41;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationDistance:
      __int16 v2 = 42;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationRelativeOrientation:
      __int16 v2 = 43;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationSimpleOrientation:
      __int16 v2 = 44;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_scanner:
      __int16 v2 = 45;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_scannerBarcode:
      __int16 v2 = 46;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_personalActivityPedometer:
      __int16 v2 = 47;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_personalActivityStepDetection:
      __int16 v2 = 48;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationExtended:
      __int16 v2 = 49;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationExtendedGeomagneticOrientation:
      __int16 v2 = 50;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_orientationExtendedMagnetometer:
      __int16 v2 = 51;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_gesture:
      __int16 v2 = 52;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_gestureChassisFlipGesture:
      __int16 v2 = 53;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_gestureHingeFoldGesture:
      __int16 v2 = 54;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_other:
      __int16 v2 = 55;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_otherCustom:
      __int16 v2 = 56;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved4:
      __int16 v2 = 57;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved5:
      __int16 v2 = 58;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved6:
      __int16 v2 = 59;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved7:
      __int16 v2 = 60;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved8:
      __int16 v2 = 61;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved9:
      __int16 v2 = 62;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved10:
      __int16 v2 = 63;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved11:
      __int16 v2 = 64;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved12:
      __int16 v2 = 65;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved13:
      __int16 v2 = 66;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved14:
      __int16 v2 = 67;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved15:
      __int16 v2 = 68;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_vendorReserved16:
      __int16 v2 = 69;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_property:
      __int16 v2 = 70;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyFriendlyName:
      __int16 v2 = 71;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyPersistentUniqueID:
      __int16 v2 = 72;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorStatus:
      __int16 v2 = 73;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyMinimumReportInterval:
      __int16 v2 = 74;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorManufacturer:
      __int16 v2 = 75;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorModel:
      __int16 v2 = 76;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorSerialNumber:
      __int16 v2 = 77;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorDescription:
      __int16 v2 = 78;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorConnectionType:
      __int16 v2 = 79;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertySensorDevicePath:
      __int16 v2 = 80;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyHardwareRevision:
      __int16 v2 = 81;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyFirmwareVersion:
      __int16 v2 = 82;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyReleaseDate:
      __int16 v2 = 83;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyReportInterval:
      __int16 v2 = 84;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyChangeSensitivityAbsolute:
      __int16 v2 = 85;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyChangeSensitivityPercentOfRange:
      __int16 v2 = 86;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyChangeSensitivityPercentRelative:
      __int16 v2 = 87;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyAccuracy:
      __int16 v2 = 88;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_propertyResolution:
      __int16 v2 = 89;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldLocation:
      __int16 v2 = 90;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAltitudeAntennaSeaLevel:
      __int16 v2 = 91;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDifferentialReferenceStationID:
      __int16 v2 = 92;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldHorizontalDilutionOfPrecision:
      __int16 v2 = 93;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldVerticalDilutionOfPrecision:
      __int16 v2 = 94;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldLatitude:
      __int16 v2 = 95;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldLongitude:
      __int16 v2 = 96;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTrueHeading:
      __int16 v2 = 97;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldNMEASentence:
      __int16 v2 = 98;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAddressLine1:
      __int16 v2 = 99;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAddressLine2:
      __int16 v2 = 100;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldEquivalentCO2:
      __int16 v2 = 101;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldVolatileOrganicCompoundConcentration:
      __int16 v2 = 102;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldObjectPresence:
      __int16 v2 = 103;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularVelocityAboutZAxis:
      __int16 v2 = 104;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularPosition:
      __int16 v2 = 105;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularPositionAboutXAxis:
      __int16 v2 = 106;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularPositionAboutYAxis:
      __int16 v2 = 107;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldAngularPositionAboutZAxis:
      __int16 v2 = 108;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistance:
      __int16 v2 = 109;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistanceXAxis:
      __int16 v2 = 110;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistanceYAxis:
      __int16 v2 = 111;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistanceZAxis:
      __int16 v2 = 112;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldDistanceOutOfRange:
      __int16 v2 = 113;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTilt:
      __int16 v2 = 114;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTiltXAxis:
      __int16 v2 = 115;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTiltYAxis:
      __int16 v2 = 116;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldTiltZAxis:
      __int16 v2 = 117;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldRotationMatrix:
      __int16 v2 = 118;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldQuaternion:
      __int16 v2 = 119;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagneticFlux:
      __int16 v2 = 120;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagneticFluxXAxis:
      __int16 v2 = 121;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagneticFluxYAxis:
      __int16 v2 = 122;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagneticFluxZAxis:
      __int16 v2 = 123;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_dataFieldMagnetometerAccuracy:
      __int16 v2 = 124;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_magnetometerAccuracyMedium:
      __int16 v2 = 125;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_magnetometerAccuracyHigh:
      __int16 v2 = 126;
      goto LABEL_131;
    case CoreHID_HIDUsage_SensorsUsage_simpleOrientationDirectionNotRotated:
      __int16 v2 = 127;
LABEL_131:
      __int16 v3 = v2;
LABEL_132:
      __int16 *v1 = v3;
      return rawValue;
    default:
      __int16 v2 = 128;
      switch(rawValue.value)
      {
        case 0x300:
          goto LABEL_131;
        case 0x301:
          __int16 v2 = 129;
          goto LABEL_131;
        case 0x302:
          __int16 v2 = 130;
          goto LABEL_131;
        case 0x303:
          __int16 v2 = 131;
          goto LABEL_131;
        case 0x304:
          __int16 v2 = 132;
          goto LABEL_131;
        case 0x305:
          __int16 v2 = 133;
          goto LABEL_131;
        case 0x306:
          __int16 v2 = 134;
          goto LABEL_131;
        case 0x307:
          __int16 v2 = 135;
          goto LABEL_131;
        case 0x308:
          __int16 v2 = 136;
          goto LABEL_131;
        case 0x309:
          __int16 v2 = 137;
          goto LABEL_131;
        case 0x30A:
          __int16 v2 = 138;
          goto LABEL_131;
        case 0x30B:
          __int16 v2 = 139;
          goto LABEL_131;
        case 0x30C:
          __int16 v2 = 140;
          goto LABEL_131;
        case 0x30D:
          __int16 v2 = 141;
          goto LABEL_131;
        case 0x30E:
          __int16 v2 = 142;
          goto LABEL_131;
        case 0x30F:
          __int16 v2 = 143;
          goto LABEL_131;
        case 0x310:
          __int16 v2 = 144;
          goto LABEL_131;
        case 0x311:
          __int16 v2 = 145;
          goto LABEL_131;
        case 0x312:
          __int16 v2 = 146;
          goto LABEL_131;
        case 0x313:
          __int16 v2 = 147;
          goto LABEL_131;
        case 0x314:
          __int16 v2 = 148;
          goto LABEL_131;
        case 0x315:
          __int16 v2 = 149;
          goto LABEL_131;
        case 0x316:
          __int16 v2 = 150;
          goto LABEL_131;
        case 0x317:
          __int16 v2 = 151;
          goto LABEL_131;
        case 0x318:
          __int16 v2 = 152;
          goto LABEL_131;
        case 0x319:
          __int16 v2 = 153;
          goto LABEL_131;
        case 0x31A:
          __int16 v2 = 154;
          goto LABEL_131;
        case 0x31B:
          __int16 v2 = 155;
          goto LABEL_131;
        case 0x31C:
          __int16 v2 = 156;
          goto LABEL_131;
        case 0x31D:
          __int16 v2 = 157;
          goto LABEL_131;
        case 0x31E:
          __int16 v2 = 158;
          goto LABEL_131;
        case 0x31F:
          __int16 v2 = 159;
          goto LABEL_131;
        case 0x400:
          __int16 v2 = 160;
          goto LABEL_131;
        case 0x402:
          __int16 v2 = 161;
          goto LABEL_131;
        case 0x403:
          __int16 v2 = 162;
          goto LABEL_131;
        case 0x404:
          __int16 v2 = 163;
          goto LABEL_131;
        case 0x405:
          __int16 v2 = 164;
          goto LABEL_131;
        case 0x406:
          __int16 v2 = 165;
          goto LABEL_131;
        case 0x407:
          __int16 v2 = 166;
          goto LABEL_131;
        case 0x408:
          __int16 v2 = 167;
          goto LABEL_131;
        case 0x409:
          __int16 v2 = 168;
          goto LABEL_131;
        case 0x40A:
          __int16 v2 = 169;
          goto LABEL_131;
        case 0x40B:
          __int16 v2 = 170;
          goto LABEL_131;
        case 0x40C:
          __int16 v2 = 171;
          goto LABEL_131;
        case 0x40D:
          __int16 v2 = 172;
          goto LABEL_131;
        case 0x40E:
          __int16 v2 = 173;
          goto LABEL_131;
        case 0x40F:
          __int16 v2 = 174;
          goto LABEL_131;
        case 0x410:
          __int16 v2 = 175;
          goto LABEL_131;
        case 0x411:
          __int16 v2 = 176;
          goto LABEL_131;
        case 0x412:
          __int16 v2 = 177;
          goto LABEL_131;
        case 0x413:
          __int16 v2 = 178;
          goto LABEL_131;
        case 0x414:
          __int16 v2 = 179;
          goto LABEL_131;
        case 0x415:
          __int16 v2 = 180;
          goto LABEL_131;
        case 0x416:
          __int16 v2 = 181;
          goto LABEL_131;
        case 0x417:
          __int16 v2 = 182;
          goto LABEL_131;
        case 0x418:
          __int16 v2 = 183;
          goto LABEL_131;
        case 0x419:
          __int16 v2 = 184;
          goto LABEL_131;
        case 0x41A:
          __int16 v2 = 185;
          goto LABEL_131;
        case 0x41B:
          __int16 v2 = 186;
          goto LABEL_131;
        case 0x41C:
          __int16 v2 = 187;
          goto LABEL_131;
        case 0x41D:
          __int16 v2 = 188;
          goto LABEL_131;
        case 0x41E:
          __int16 v2 = 189;
          goto LABEL_131;
        case 0x41F:
          __int16 v2 = 190;
          goto LABEL_131;
        case 0x420:
          __int16 v2 = 191;
          goto LABEL_131;
        default:
          __int16 v2 = 192;
          switch(rawValue.value)
          {
            case 0x421:
              goto LABEL_131;
            case 0x422:
              __int16 v2 = 193;
              goto LABEL_131;
            case 0x423:
              __int16 v2 = 194;
              goto LABEL_131;
            case 0x424:
              __int16 v2 = 195;
              goto LABEL_131;
            case 0x425:
              __int16 v2 = 196;
              goto LABEL_131;
            case 0x426:
              __int16 v2 = 197;
              goto LABEL_131;
            case 0x427:
              __int16 v2 = 198;
              goto LABEL_131;
            case 0x42A:
              __int16 v2 = 199;
              goto LABEL_131;
            case 0x42B:
              __int16 v2 = 200;
              goto LABEL_131;
            case 0x430:
              __int16 v2 = 201;
              goto LABEL_131;
            case 0x431:
              __int16 v2 = 202;
              goto LABEL_131;
            case 0x433:
              __int16 v2 = 203;
              goto LABEL_131;
            case 0x434:
              __int16 v2 = 204;
              goto LABEL_131;
            case 0x435:
              __int16 v2 = 205;
              goto LABEL_131;
            case 0x436:
              __int16 v2 = 206;
              goto LABEL_131;
            case 0x437:
              __int16 v2 = 207;
              goto LABEL_131;
            case 0x438:
              __int16 v2 = 208;
              goto LABEL_131;
            case 0x439:
              __int16 v2 = 209;
              goto LABEL_131;
            case 0x43A:
              __int16 v2 = 210;
              goto LABEL_131;
            case 0x43B:
              __int16 v2 = 211;
              goto LABEL_131;
            case 0x43C:
              __int16 v2 = 212;
              goto LABEL_131;
            case 0x440:
              __int16 v2 = 213;
              goto LABEL_131;
            case 0x441:
              __int16 v2 = 214;
              goto LABEL_131;
            case 0x450:
              __int16 v2 = 215;
              goto LABEL_131;
            case 0x451:
              __int16 v2 = 216;
              goto LABEL_131;
            case 0x452:
              __int16 v2 = 217;
              goto LABEL_131;
            case 0x453:
              __int16 v2 = 218;
              goto LABEL_131;
            case 0x454:
              __int16 v2 = 219;
              goto LABEL_131;
            case 0x455:
              __int16 v2 = 220;
              goto LABEL_131;
            case 0x456:
              __int16 v2 = 221;
              goto LABEL_131;
            case 0x457:
              __int16 v2 = 222;
              goto LABEL_131;
            case 0x458:
              __int16 v2 = 223;
              goto LABEL_131;
            case 0x459:
              __int16 v2 = 224;
              goto LABEL_131;
            case 0x45A:
              __int16 v2 = 225;
              goto LABEL_131;
            case 0x45B:
              __int16 v2 = 226;
              goto LABEL_131;
            case 0x45C:
              __int16 v2 = 227;
              goto LABEL_131;
            case 0x45D:
              __int16 v2 = 228;
              goto LABEL_131;
            case 0x45E:
              __int16 v2 = 229;
              goto LABEL_131;
            case 0x45F:
              __int16 v2 = 230;
              goto LABEL_131;
            case 0x470:
              __int16 v2 = 231;
              goto LABEL_131;
            case 0x471:
              __int16 v2 = 232;
              goto LABEL_131;
            case 0x472:
              __int16 v2 = 233;
              goto LABEL_131;
            case 0x473:
              __int16 v2 = 234;
              goto LABEL_131;
            case 0x474:
              __int16 v2 = 235;
              goto LABEL_131;
            case 0x475:
              __int16 v2 = 236;
              goto LABEL_131;
            case 0x476:
              __int16 v2 = 237;
              goto LABEL_131;
            case 0x477:
              __int16 v2 = 238;
              goto LABEL_131;
            case 0x478:
              __int16 v2 = 239;
              goto LABEL_131;
            case 0x479:
              __int16 v2 = 240;
              goto LABEL_131;
            case 0x47A:
              __int16 v2 = 241;
              goto LABEL_131;
            case 0x47B:
              __int16 v2 = 242;
              goto LABEL_131;
            case 0x47C:
              __int16 v2 = 243;
              goto LABEL_131;
            case 0x47D:
              __int16 v2 = 244;
              goto LABEL_131;
            case 0x47E:
              __int16 v2 = 245;
              goto LABEL_131;
            case 0x47F:
              __int16 v2 = 246;
              goto LABEL_131;
            case 0x480:
              __int16 v2 = 247;
              goto LABEL_131;
            case 0x481:
              __int16 v2 = 248;
              goto LABEL_131;
            case 0x482:
              __int16 v2 = 249;
              goto LABEL_131;
            case 0x483:
              __int16 v2 = 250;
              goto LABEL_131;
            case 0x484:
              __int16 v2 = 251;
              goto LABEL_131;
            case 0x485:
              __int16 v2 = 252;
              goto LABEL_131;
            case 0x486:
              __int16 v2 = 253;
              goto LABEL_131;
            case 0x487:
              __int16 v2 = 254;
              goto LABEL_131;
            case 0x488:
              __int16 v2 = 255;
              goto LABEL_131;
            default:
              __int16 v2 = 256;
              switch(rawValue.value)
              {
                case 0x489:
                  goto LABEL_131;
                case 0x490:
                  __int16 v2 = 257;
                  goto LABEL_131;
                case 0x491:
                  __int16 v2 = 258;
                  goto LABEL_131;
                case 0x492:
                  __int16 v2 = 259;
                  goto LABEL_131;
                case 0x493:
                  __int16 v2 = 260;
                  goto LABEL_131;
                case 0x494:
                  __int16 v2 = 261;
                  goto LABEL_131;
                case 0x495:
                  __int16 v2 = 262;
                  goto LABEL_131;
                case 0x496:
                  __int16 v2 = 263;
                  goto LABEL_131;
                case 0x497:
                  __int16 v2 = 264;
                  goto LABEL_131;
                case 0x498:
                  __int16 v2 = 265;
                  goto LABEL_131;
                case 0x4A0:
                  __int16 v2 = 266;
                  goto LABEL_131;
                case 0x4A1:
                  __int16 v2 = 267;
                  goto LABEL_131;
                case 0x4A2:
                  __int16 v2 = 268;
                  goto LABEL_131;
                case 0x4A3:
                  __int16 v2 = 269;
                  goto LABEL_131;
                case 0x4B0:
                  __int16 v2 = 270;
                  goto LABEL_131;
                case 0x4B1:
                  __int16 v2 = 271;
                  goto LABEL_131;
                case 0x4B2:
                  __int16 v2 = 272;
                  goto LABEL_131;
                case 0x4B3:
                  __int16 v2 = 273;
                  goto LABEL_131;
                case 0x4B4:
                  __int16 v2 = 274;
                  goto LABEL_131;
                case 0x4B5:
                  __int16 v2 = 275;
                  goto LABEL_131;
                case 0x4B6:
                  __int16 v2 = 276;
                  goto LABEL_131;
                case 0x4B7:
                  __int16 v2 = 277;
                  goto LABEL_131;
                case 0x4B8:
                  __int16 v2 = 278;
                  goto LABEL_131;
                case 0x4B9:
                  __int16 v2 = 279;
                  goto LABEL_131;
                case 0x4BA:
                  __int16 v2 = 280;
                  goto LABEL_131;
                case 0x4BB:
                  __int16 v2 = 281;
                  goto LABEL_131;
                case 0x4BC:
                  __int16 v2 = 282;
                  goto LABEL_131;
                case 0x4BD:
                  __int16 v2 = 283;
                  goto LABEL_131;
                case 0x4D0:
                  __int16 v2 = 284;
                  goto LABEL_131;
                case 0x4D1:
                  __int16 v2 = 285;
                  goto LABEL_131;
                case 0x4D2:
                  __int16 v2 = 286;
                  goto LABEL_131;
                case 0x4D3:
                  __int16 v2 = 287;
                  goto LABEL_131;
                case 0x4D4:
                  __int16 v2 = 288;
                  goto LABEL_131;
                case 0x4D5:
                  __int16 v2 = 289;
                  goto LABEL_131;
                case 0x4D6:
                  __int16 v2 = 290;
                  goto LABEL_131;
                case 0x4D7:
                  __int16 v2 = 291;
                  goto LABEL_131;
                case 0x4D8:
                  __int16 v2 = 292;
                  goto LABEL_131;
                case 0x4D9:
                  __int16 v2 = 293;
                  goto LABEL_131;
                case 0x4DA:
                  __int16 v2 = 294;
                  goto LABEL_131;
                case 0x4DB:
                  __int16 v2 = 295;
                  goto LABEL_131;
                case 0x4DC:
                  __int16 v2 = 296;
                  goto LABEL_131;
                case 0x4DD:
                  __int16 v2 = 297;
                  goto LABEL_131;
                case 0x4DE:
                  __int16 v2 = 298;
                  goto LABEL_131;
                case 0x4DF:
                  __int16 v2 = 299;
                  goto LABEL_131;
                case 0x4E0:
                  __int16 v2 = 300;
                  goto LABEL_131;
                case 0x4E2:
                  __int16 v2 = 301;
                  goto LABEL_131;
                case 0x4E3:
                  __int16 v2 = 302;
                  goto LABEL_131;
                case 0x4F0:
                  __int16 v2 = 303;
                  goto LABEL_131;
                case 0x4F1:
                  __int16 v2 = 304;
                  goto LABEL_131;
                case 0x4F2:
                  __int16 v2 = 305;
                  goto LABEL_131;
                case 0x4F8:
                  __int16 v2 = 306;
                  goto LABEL_131;
                case 0x4F9:
                  __int16 v2 = 307;
                  goto LABEL_131;
                case 0x500:
                  __int16 v2 = 308;
                  goto LABEL_131;
                case 0x501:
                  __int16 v2 = 309;
                  goto LABEL_131;
                case 0x502:
                  __int16 v2 = 310;
                  goto LABEL_131;
                case 0x503:
                  __int16 v2 = 311;
                  goto LABEL_131;
                case 0x504:
                  __int16 v2 = 312;
                  goto LABEL_131;
                case 0x505:
                  __int16 v2 = 313;
                  goto LABEL_131;
                case 0x506:
                  __int16 v2 = 314;
                  goto LABEL_131;
                case 0x507:
                  __int16 v2 = 315;
                  goto LABEL_131;
                case 0x508:
                  __int16 v2 = 316;
                  goto LABEL_131;
                case 0x509:
                  __int16 v2 = 317;
                  goto LABEL_131;
                case 0x520:
                  __int16 v2 = 318;
                  goto LABEL_131;
                case 0x521:
                  __int16 v2 = 319;
                  goto LABEL_131;
                default:
                  __int16 v2 = 320;
                  switch(rawValue.value)
                  {
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldConsumerIRSentenceReceive|0x400:
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldInfraredLight|0x400:
                      __int16 v2 = 321;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldRedLight|0x400:
                      __int16 v2 = 322;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldGreenLight|0x400:
                      __int16 v2 = 323;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldBlueLight|0x400:
                      __int16 v2 = 324;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldUltravioletALight|0x400:
                      __int16 v2 = 325;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldUltravioletBLight|0x400:
                      __int16 v2 = 326;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldUltravioletIndex|0x400:
                      __int16 v2 = 327;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldNearInfraredLight|0x400:
                      __int16 v2 = 328;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyLight|0x400:
                      __int16 v2 = 329;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldRFIDTag40Bit|0x400:
                      __int16 v2 = 330;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldNFCSentenceReceive|0x400:
                      __int16 v2 = 331;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyScanner|0x400:
                      __int16 v2 = 332;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyNFCSentenceSend|0x400:
                      __int16 v2 = 333;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldElectrical|0x400:
                      __int16 v2 = 334;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCapacitance|0x400:
                      __int16 v2 = 335;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldMonth|0x400:
                      __int16 v2 = 336;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldDay|0x400:
                      __int16 v2 = 337;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldDayOfWeek|0x400:
                      __int16 v2 = 338;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldHour|0x400:
                      __int16 v2 = 339;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldMinute|0x400:
                      __int16 v2 = 340;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldSecond|0x400:
                      __int16 v2 = 341;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldMillisecond|0x400:
                      __int16 v2 = 342;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldTimestamp|0x400:
                      __int16 v2 = 343;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldJulianDayOfYear|0x400:
                      __int16 v2 = 344;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldTimeSinceSystemBoot|0x400:
                      __int16 v2 = 345;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyTime|0x400:
                      __int16 v2 = 346;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyTimeZoneOffsetFromUTC|0x400:
                      __int16 v2 = 347;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyTimeZoneName|0x400:
                      __int16 v2 = 348;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyDaylightSavingsTimeObserved|0x400:
                      __int16 v2 = 349;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyTimeTrimAdjustment|0x400:
                      __int16 v2 = 350;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_propertyArmAlarm|0x400:
                      __int16 v2 = 351;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustom|0x400:
                      __int16 v2 = 352;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomUsage|0x400:
                      __int16 v2 = 353;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomBooleanArray|0x400:
                      __int16 v2 = 354;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue|0x400:
                      __int16 v2 = 355;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue1|0x400:
                      __int16 v2 = 356;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue2|0x400:
                      __int16 v2 = 357;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue3|0x400:
                      __int16 v2 = 358;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue4|0x400:
                      __int16 v2 = 359;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue5|0x400:
                      __int16 v2 = 360;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue6|0x400:
                      __int16 v2 = 361;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue7|0x400:
                      __int16 v2 = 362;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue8|0x400:
                      __int16 v2 = 363;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue9|0x400:
                      __int16 v2 = 364;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue10|0x400:
                      __int16 v2 = 365;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue11|0x400:
                      __int16 v2 = 366;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue12|0x400:
                      __int16 v2 = 367;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue13|0x400:
                      __int16 v2 = 368;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue14|0x400:
                      __int16 v2 = 369;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue15|0x400:
                      __int16 v2 = 370;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue16|0x400:
                      __int16 v2 = 371;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue17|0x400:
                      __int16 v2 = 372;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue18|0x400:
                      __int16 v2 = 373;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue19|0x400:
                      __int16 v2 = 374;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue20|0x400:
                      __int16 v2 = 375;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue21|0x400:
                      __int16 v2 = 376;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue22|0x400:
                      __int16 v2 = 377;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue23|0x400:
                      __int16 v2 = 378;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue24|0x400:
                      __int16 v2 = 379;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue25|0x400:
                      __int16 v2 = 380;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue26|0x400:
                      __int16 v2 = 381;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue27|0x400:
                      __int16 v2 = 382;
                      goto LABEL_131;
                    case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue28|0x400:
                      __int16 v2 = 383;
                      goto LABEL_131;
                    default:
                      __int16 v2 = 384;
                      switch(rawValue.value)
                      {
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGeneric|0x400:
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUIDOrPropertyKey|0x400:
                          __int16 v2 = 385;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericCategoryGUID|0x400:
                          __int16 v2 = 386;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericTypeGUID|0x400:
                          __int16 v2 = 387;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericEventPropertyKey|0x400:
                          __int16 v2 = 388;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericPropertyPropertyKey|0x400:
                          __int16 v2 = 389;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericDataFieldPropertyKey|0x400:
                          __int16 v2 = 390;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericEvent|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericProperty|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericDataField|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldEnumeratorTableRowIndex|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldEnumeratorTableRowCount|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUIDOrPropertyKeyKind|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUID|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericPropertyKey|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericTopLevelCollectionID|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericUnitOfMeasure|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericUnitExponent|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportSize|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportCount|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyGeneric|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyEnumeratorTableRowIndex|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyEnumeratorTableRowCount|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldPersonalActivity|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldActivityType|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldActivityState|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldDevicePosition|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldStepCount|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldStepCountReset|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomTypeID|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustom|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue1|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue2|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue3|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue4|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue5|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue6|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue13|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue14|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue15|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue16|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHinge|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeAngle|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGestureSensor|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGestureState|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldInitialAngle|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldFinalAngle|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldType|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateUndefined|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateReady|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateNotAvailable|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateNoData|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateInitializing|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateAccessDenied|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorStateError|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventUnknown|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventStateChanged|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventPropertyChanged|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventDataUpdated|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventPollResponse|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventChangeSensitivity|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventRangeMaximumReached|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateWakeOnAllEvents|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateWakeOnThresholdEvents|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateUndefined|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD0FullPower|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD1LowPower|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD2StandbyPowerWithWakeup|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD3SleepWithWakeup|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_powerStateD4PowerOff|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_accuracyDefault|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_accuracyHigh|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_accuracyMedium|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_accuracyLow|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixQualityNoFix|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixQualityGPS|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixQualityDGPS|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeDGPSSPSModeFixValid|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeGPSPPSModeFixValid|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeRealTimeKinematic|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeFloatRTK|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeEstimatedDeadReckoned|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeManualInputMode|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeSimulatorMode|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsOperationModeManual|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsOperationModeAutomatic|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeAutonomous|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeDGPS|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeEstimatedDeadReckoned|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeManualInput|0x400:
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeSimulator|0x400:
                          goto LABEL_452;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportID|0x400:
                          __int16 v2 = 391;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportItemPositionIndex|0x400:
                          __int16 v2 = 392;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericFirmwareVARTYPE|0x400:
                          __int16 v2 = 393;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldStepDuration|0x400:
                          __int16 v2 = 394;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldStepType|0x400:
                          __int16 v2 = 395;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyMinimumActivityDetectionInterval|0x400:
                          __int16 v2 = 396;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertySupportedActivityTypes|0x400:
                          __int16 v2 = 397;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertySubscribedActivityTypes|0x400:
                          __int16 v2 = 398;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertySupportedStepTypes|0x400:
                          __int16 v2 = 399;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertySubscribedStepTypes|0x400:
                          __int16 v2 = 400;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyFloorHeight|0x400:
                          __int16 v2 = 401;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue7|0x400:
                          __int16 v2 = 402;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue8|0x400:
                          __int16 v2 = 403;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue9|0x400:
                          __int16 v2 = 404;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue10|0x400:
                          __int16 v2 = 405;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue11|0x400:
                          __int16 v2 = 406;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue12|0x400:
                          __int16 v2 = 407;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldContributingPanel|0x400:
                          __int16 v2 = 408;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventRangeMinimumReached|0x400:
                          __int16 v2 = 409;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventHighThresholdCrossUpward|0x400:
                          __int16 v2 = 410;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventHighThresholdCrossDownward|0x400:
                          __int16 v2 = 411;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventLowThresholdCrossUpward|0x400:
                          __int16 v2 = 412;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventLowThresholdCrossDownward|0x400:
                          __int16 v2 = 413;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventZeroThresholdCrossUpward|0x400:
                          __int16 v2 = 414;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventZeroThresholdCrossDownward|0x400:
                          __int16 v2 = 415;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventPeriodExceeded|0x400:
                          __int16 v2 = 416;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventFrequencyExceeded|0x400:
                          __int16 v2 = 417;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_sensorEventComplexTrigger|0x400:
                          __int16 v2 = 418;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_connectionTypePCIntegrated|0x400:
                          __int16 v2 = 419;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_connectionTypePCAttached|0x400:
                          __int16 v2 = 420;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_connectionTypePCExternal|0x400:
                          __int16 v2 = 421;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateReportNoEvents|0x400:
                          __int16 v2 = 422;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateReportAllEvents|0x400:
                          __int16 v2 = 423;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateReportThresholdEvents|0x400:
                          __int16 v2 = 424;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_reportingStateWakeOnNoEvents|0x400:
                          __int16 v2 = 425;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeNoFix|0x400:
                          __int16 v2 = 426;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_fixTypeGPSSPSModeFixValid|0x400:
                          __int16 v2 = 427;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_gpsSelectionModeDataNotValid|0x400:
                          __int16 v2 = 428;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_gpsStatusDataValid|0x400:
                          __int16 v2 = 429;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_gpsStatusDataNotValid|0x400:
                          __int16 v2 = 430;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dayOfWeekSunday|0x400:
                          __int16 v2 = 431;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dayOfWeekMonday|0x400:
                          __int16 v2 = 432;
                          goto LABEL_131;
                        case CoreHID_HIDUsage_SensorsUsage_dayOfWeekTuesday|0x400:
                          __int16 v2 = 433;
                          goto LABEL_131;
                        default:
                          switch(rawValue.value)
                          {
                            case 0x800:
                              __int16 v2 = 434;
                              goto LABEL_131;
                            case 0x801:
                              __int16 v2 = 435;
                              goto LABEL_131;
                            case 0x802:
                              __int16 v2 = 436;
                              goto LABEL_131;
                            case 0x803:
                              __int16 v2 = 437;
                              goto LABEL_131;
                            case 0x804:
                              __int16 v2 = 438;
                              goto LABEL_131;
                            case 0x805:
                              __int16 v2 = 439;
                              goto LABEL_131;
                            case 0x806:
                              __int16 v2 = 440;
                              goto LABEL_131;
                            case 0x810:
                              __int16 v2 = 441;
                              goto LABEL_131;
                            case 0x811:
                              __int16 v2 = 442;
                              goto LABEL_131;
                            case 0x812:
                              __int16 v2 = 443;
                              goto LABEL_131;
                            case 0x813:
                              __int16 v2 = 444;
                              goto LABEL_131;
                            case 0x814:
                              __int16 v2 = 445;
                              goto LABEL_131;
                            case 0x815:
                              __int16 v2 = 446;
                              goto LABEL_131;
                            case 0x816:
                              __int16 v2 = 447;
                              goto LABEL_131;
                            default:
                              goto LABEL_452;
                          }
                      }
                  }
              }
          }
      }
  }

LABEL_452:
  __int16 v2 = 448;
  switch(rawValue.value)
  {
    case 0x817:
      goto LABEL_131;
    case 0x818:
      __int16 v2 = 449;
      goto LABEL_131;
    case 0x819:
      __int16 v2 = 450;
      goto LABEL_131;
    case 0x81A:
      __int16 v2 = 451;
      goto LABEL_131;
    case 0x81B:
      __int16 v2 = 452;
      goto LABEL_131;
    case 0x81C:
      __int16 v2 = 453;
      goto LABEL_131;
    case 0x81D:
      __int16 v2 = 454;
      goto LABEL_131;
    case 0x81E:
      __int16 v2 = 455;
      goto LABEL_131;
    case 0x81F:
      __int16 v2 = 456;
      goto LABEL_131;
    case 0x820:
      __int16 v2 = 457;
      goto LABEL_131;
    case 0x830:
      __int16 v2 = 458;
      goto LABEL_131;
    case 0x831:
      __int16 v2 = 459;
      goto LABEL_131;
    case 0x832:
      __int16 v2 = 460;
      goto LABEL_131;
    case 0x840:
      __int16 v2 = 461;
      goto LABEL_131;
    case 0x841:
      __int16 v2 = 462;
      goto LABEL_131;
    case 0x842:
      __int16 v2 = 463;
      goto LABEL_131;
    case 0x843:
      __int16 v2 = 464;
      goto LABEL_131;
    case 0x844:
      __int16 v2 = 465;
      goto LABEL_131;
    case 0x845:
      __int16 v2 = 466;
      goto LABEL_131;
    case 0x850:
      __int16 v2 = 467;
      goto LABEL_131;
    case 0x851:
      __int16 v2 = 468;
      goto LABEL_131;
    case 0x852:
      __int16 v2 = 469;
      goto LABEL_131;
    case 0x853:
      __int16 v2 = 470;
      goto LABEL_131;
    case 0x854:
      __int16 v2 = 471;
      goto LABEL_131;
    case 0x855:
      __int16 v2 = 472;
      goto LABEL_131;
    case 0x860:
      __int16 v2 = 473;
      goto LABEL_131;
    case 0x861:
      __int16 v2 = 474;
      goto LABEL_131;
    case 0x862:
      __int16 v2 = 475;
      goto LABEL_131;
    case 0x863:
      __int16 v2 = 476;
      goto LABEL_131;
    case 0x870:
      __int16 v2 = 477;
      goto LABEL_131;
    case 0x871:
      __int16 v2 = 478;
      goto LABEL_131;
    case 0x872:
      __int16 v2 = 479;
      goto LABEL_131;
    case 0x880:
      __int16 v2 = 480;
      goto LABEL_131;
    case 0x881:
      __int16 v2 = 481;
      goto LABEL_131;
    case 0x882:
      __int16 v2 = 482;
      goto LABEL_131;
    case 0x883:
      __int16 v2 = 483;
      goto LABEL_131;
    case 0x884:
      __int16 v2 = 484;
      goto LABEL_131;
    case 0x885:
      __int16 v2 = 485;
      goto LABEL_131;
    case 0x886:
      __int16 v2 = 486;
      goto LABEL_131;
    case 0x887:
      __int16 v2 = 487;
      goto LABEL_131;
    case 0x888:
      __int16 v2 = 488;
      goto LABEL_131;
    case 0x890:
      __int16 v2 = 489;
      goto LABEL_131;
    case 0x891:
      __int16 v2 = 490;
      goto LABEL_131;
    case 0x8A0:
      __int16 v2 = 491;
      goto LABEL_131;
    case 0x8A1:
      __int16 v2 = 492;
      goto LABEL_131;
    case 0x8A2:
      __int16 v2 = 493;
      goto LABEL_131;
    case 0x8A3:
      __int16 v2 = 494;
      goto LABEL_131;
    case 0x8A4:
      __int16 v2 = 495;
      goto LABEL_131;
    case 0x8A5:
      __int16 v2 = 496;
      goto LABEL_131;
    case 0x8B0:
      __int16 v2 = 497;
      goto LABEL_131;
    case 0x8B1:
      __int16 v2 = 498;
      goto LABEL_131;
    case 0x8C0:
      __int16 v2 = 499;
      goto LABEL_131;
    case 0x8C1:
      __int16 v2 = 500;
      goto LABEL_131;
    case 0x8C2:
      __int16 v2 = 501;
      goto LABEL_131;
    case 0x8C3:
      __int16 v2 = 502;
      goto LABEL_131;
    case 0x8C4:
      __int16 v2 = 503;
      goto LABEL_131;
    case 0x8C5:
      __int16 v2 = 504;
      goto LABEL_131;
    case 0x8C6:
      __int16 v2 = 505;
      goto LABEL_131;
    case 0x8D0:
      __int16 v2 = 506;
      goto LABEL_131;
    case 0x8D1:
      __int16 v2 = 507;
      goto LABEL_131;
    case 0x8D2:
      __int16 v2 = 508;
      goto LABEL_131;
    case 0x8D3:
      __int16 v2 = 509;
      goto LABEL_131;
    case 0x8D4:
      __int16 v2 = 510;
      goto LABEL_131;
    case 0x8E0:
      __int16 v2 = 511;
      goto LABEL_131;
    default:
      __int16 v2 = 512;
      switch(rawValue.value)
      {
        case 0x8E1:
          goto LABEL_131;
        case 0x8E2:
          __int16 v2 = 513;
          goto LABEL_131;
        case 0x8F0:
          __int16 v2 = 514;
          goto LABEL_131;
        case 0x8F1:
          __int16 v2 = 515;
          goto LABEL_131;
        case 0x8F2:
          __int16 v2 = 516;
          goto LABEL_131;
        case 0x8F3:
          __int16 v2 = 517;
          goto LABEL_131;
        case 0x8F4:
          __int16 v2 = 518;
          goto LABEL_131;
        case 0x8F5:
          __int16 v2 = 519;
          goto LABEL_131;
        case 0x900:
          __int16 v2 = 520;
          goto LABEL_131;
        case 0x901:
          __int16 v2 = 521;
          goto LABEL_131;
        case 0x902:
          __int16 v2 = 522;
          goto LABEL_131;
        case 0x903:
          __int16 v2 = 523;
          goto LABEL_131;
        case 0x904:
          __int16 v2 = 524;
          goto LABEL_131;
        case 0x905:
          __int16 v2 = 525;
          goto LABEL_131;
        case 0x906:
          __int16 v2 = 526;
          goto LABEL_131;
        case 0x907:
          __int16 v2 = 527;
          goto LABEL_131;
        case 0x908:
          __int16 v2 = 528;
          goto LABEL_131;
        case 0x909:
          __int16 v2 = 529;
          goto LABEL_131;
        case 0x90A:
          __int16 v2 = 530;
          goto LABEL_131;
        case 0x90B:
          __int16 v2 = 531;
          goto LABEL_131;
        case 0x90C:
          __int16 v2 = 532;
          goto LABEL_131;
        case 0x90D:
          __int16 v2 = 533;
          goto LABEL_131;
        case 0x90E:
          __int16 v2 = 534;
          goto LABEL_131;
        case 0x90F:
          __int16 v2 = 535;
          goto LABEL_131;
        case 0x910:
          __int16 v2 = 536;
          goto LABEL_131;
        case 0x911:
          __int16 v2 = 537;
          goto LABEL_131;
        case 0x912:
          __int16 v2 = 538;
          goto LABEL_131;
        case 0x913:
          __int16 v2 = 539;
          goto LABEL_131;
        case 0x914:
          __int16 v2 = 540;
          goto LABEL_131;
        case 0x915:
          __int16 v2 = 541;
          goto LABEL_131;
        case 0x916:
          __int16 v2 = 542;
          goto LABEL_131;
        case 0x917:
          __int16 v2 = 543;
          goto LABEL_131;
        case 0x918:
          __int16 v2 = 544;
          goto LABEL_131;
        case 0x919:
          __int16 v2 = 545;
          goto LABEL_131;
        case 0x91A:
          __int16 v2 = 546;
          goto LABEL_131;
        case 0x91B:
          __int16 v2 = 547;
          goto LABEL_131;
        case 0x91C:
          __int16 v2 = 548;
          goto LABEL_131;
        case 0x91D:
          __int16 v2 = 549;
          goto LABEL_131;
        case 0x91E:
          __int16 v2 = 550;
          goto LABEL_131;
        case 0x91F:
          __int16 v2 = 551;
          goto LABEL_131;
        case 0x920:
          __int16 v2 = 552;
          goto LABEL_131;
        case 0x921:
          __int16 v2 = 553;
          goto LABEL_131;
        case 0x922:
          __int16 v2 = 554;
          goto LABEL_131;
        case 0x923:
          __int16 v2 = 555;
          goto LABEL_131;
        case 0x924:
          __int16 v2 = 556;
          goto LABEL_131;
        case 0x925:
          __int16 v2 = 557;
          goto LABEL_131;
        case 0x926:
          __int16 v2 = 558;
          goto LABEL_131;
        case 0x927:
          __int16 v2 = 559;
          goto LABEL_131;
        case 0x928:
          __int16 v2 = 560;
          goto LABEL_131;
        case 0x929:
          __int16 v2 = 561;
          goto LABEL_131;
        case 0x92A:
          __int16 v2 = 562;
          goto LABEL_131;
        case 0x92B:
          __int16 v2 = 563;
          goto LABEL_131;
        case 0x92C:
          __int16 v2 = 564;
          goto LABEL_131;
        case 0x92D:
          __int16 v2 = 565;
          goto LABEL_131;
        case 0x92E:
          __int16 v2 = 566;
          goto LABEL_131;
        case 0x92F:
          __int16 v2 = 567;
          goto LABEL_131;
        case 0x930:
          __int16 v2 = 568;
          goto LABEL_131;
        case 0x931:
          __int16 v2 = 569;
          goto LABEL_131;
        case 0x932:
          __int16 v2 = 570;
          goto LABEL_131;
        case 0x933:
          __int16 v2 = 571;
          goto LABEL_131;
        case 0x934:
          __int16 v2 = 572;
          goto LABEL_131;
        case 0x935:
          __int16 v2 = 573;
          goto LABEL_131;
        case 0x936:
          __int16 v2 = 574;
          goto LABEL_131;
        case 0x937:
          __int16 v2 = 575;
          goto LABEL_131;
        default:
          __int16 v2 = 576;
          switch(rawValue.value)
          {
            case CoreHID_HIDUsage_SensorsUsage_dataFieldMonth|0x800:
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldDay|0x800:
              __int16 v2 = 577;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldDayOfWeek|0x800:
              __int16 v2 = 578;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldHour|0x800:
              __int16 v2 = 579;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldMinute|0x800:
              __int16 v2 = 580;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldSecond|0x800:
              __int16 v2 = 581;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldMillisecond|0x800:
              __int16 v2 = 582;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldTimestamp|0x800:
              __int16 v2 = 583;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldJulianDayOfYear|0x800:
              __int16 v2 = 584;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldTimeSinceSystemBoot|0x800:
              __int16 v2 = 585;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyTime|0x800:
              __int16 v2 = 586;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyTimeZoneOffsetFromUTC|0x800:
              __int16 v2 = 587;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyTimeZoneName|0x800:
              __int16 v2 = 588;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyDaylightSavingsTimeObserved|0x800:
              __int16 v2 = 589;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyTimeTrimAdjustment|0x800:
              __int16 v2 = 590;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyArmAlarm|0x800:
              __int16 v2 = 591;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustom|0x800:
              __int16 v2 = 592;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomUsage|0x800:
              __int16 v2 = 593;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomBooleanArray|0x800:
              __int16 v2 = 594;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue|0x800:
              __int16 v2 = 595;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue1|0x800:
              __int16 v2 = 596;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue2|0x800:
              __int16 v2 = 597;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue3|0x800:
              __int16 v2 = 598;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue4|0x800:
              __int16 v2 = 599;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue5|0x800:
              __int16 v2 = 600;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue6|0x800:
              __int16 v2 = 601;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue7|0x800:
              __int16 v2 = 602;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue8|0x800:
              __int16 v2 = 603;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue9|0x800:
              __int16 v2 = 604;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue10|0x800:
              __int16 v2 = 605;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue11|0x800:
              __int16 v2 = 606;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue13|0x800:
              __int16 v2 = 607;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue14|0x800:
              __int16 v2 = 608;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue15|0x800:
              __int16 v2 = 609;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGeneric|0x800:
              __int16 v2 = 610;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUIDOrPropertyKey|0x800:
              __int16 v2 = 611;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericCategoryGUID|0x800:
              __int16 v2 = 612;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericTypeGUID|0x800:
              __int16 v2 = 613;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericEventPropertyKey|0x800:
              __int16 v2 = 614;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericPropertyPropertyKey|0x800:
              __int16 v2 = 615;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericDataFieldPropertyKey|0x800:
              __int16 v2 = 616;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericEvent|0x800:
              __int16 v2 = 617;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericProperty|0x800:
              __int16 v2 = 618;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericDataField|0x800:
              __int16 v2 = 619;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldEnumeratorTableRowIndex|0x800:
              __int16 v2 = 620;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldEnumeratorTableRowCount|0x800:
              __int16 v2 = 621;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUIDOrPropertyKeyKind|0x800:
              __int16 v2 = 622;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericGUID|0x800:
              __int16 v2 = 623;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericPropertyKey|0x800:
              __int16 v2 = 624;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericTopLevelCollectionID|0x800:
              __int16 v2 = 625;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportID|0x800:
              __int16 v2 = 626;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportItemPositionIndex|0x800:
              __int16 v2 = 627;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericFirmwareVARTYPE|0x800:
              __int16 v2 = 628;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericUnitOfMeasure|0x800:
              __int16 v2 = 629;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericUnitExponent|0x800:
              __int16 v2 = 630;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldGenericReportSize|0x800:
              __int16 v2 = 631;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldStepDuration|0x800:
              __int16 v2 = 632;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldStepType|0x800:
              __int16 v2 = 633;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyMinimumActivityDetectionInterval|0x800:
              __int16 v2 = 634;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue7|0x800:
              __int16 v2 = 635;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue8|0x800:
              __int16 v2 = 636;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue9|0x800:
              __int16 v2 = 637;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_propertyCustomValue10|0x800:
              __int16 v2 = 638;
              goto LABEL_131;
            case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldContributingPanel|0x800:
              __int16 v2 = 639;
              goto LABEL_131;
            default:
              if ((unsigned __int16)rawValue.value >= 0x4000u)
              {
                if ((unsigned __int16)rawValue.value >= 0xA000u)
                {
                  if ((unsigned __int16)rawValue.value >= 0xD000u)
                  {
                    switch((unsigned __int16)rawValue.value)
                    {
                      case 0xD000u:
                        __int16 *v1 = 662;
                        return rawValue;
                      case 0xE000u:
                        __int16 *v1 = 663;
                        return rawValue;
                      case 0xF000u:
                        __int16 *v1 = 664;
                        return rawValue;
                    }
                  }

                  else
                  {
                    switch((unsigned __int16)rawValue.value)
                    {
                      case 0xA000u:
                        __int16 *v1 = 659;
                        return rawValue;
                      case 0xB000u:
                        __int16 *v1 = 660;
                        return rawValue;
                      case 0xC000u:
                        __int16 *v1 = 661;
                        return rawValue;
                    }
                  }
                }

                else if ((unsigned __int16)rawValue.value >= 0x7000u)
                {
                  switch((unsigned __int16)rawValue.value)
                  {
                    case 0x7000u:
                      __int16 *v1 = 656;
                      return rawValue;
                    case 0x8000u:
                      __int16 *v1 = 657;
                      return rawValue;
                    case 0x9000u:
                      __int16 *v1 = 658;
                      return rawValue;
                  }
                }

                else
                {
                  switch(rawValue.value)
                  {
                    case 0x4000:
                      __int16 *v1 = 653;
                      return rawValue;
                    case 0x5000:
                      __int16 *v1 = 654;
                      return rawValue;
                    case 0x6000:
                      __int16 *v1 = 655;
                      return rawValue;
                  }
                }

LABEL_671:
                __int16 *v1 = 665;
                return rawValue;
              }

              if ((unsigned __int16)rawValue.value > (CoreHID_HIDUsage_SensorsUsage_unknownDefault|CoreHID_HIDUsage_SensorsUsage_dataFieldCustomValue19|0xC00))
              {
                switch(rawValue.value)
                {
                  case 0x1000:
                    __int16 *v1 = 650;
                    return rawValue;
                  case 0x2000:
                    __int16 *v1 = 651;
                    return rawValue;
                  case 0x3000:
                    __int16 *v1 = 652;
                    return rawValue;
                }

                goto LABEL_671;
              }

              __int16 v3 = 647;
              __int16 v2 = 640;
              switch(rawValue.value)
              {
                case CoreHID_HIDUsage_SensorsUsage_dataFieldHingeFoldType|0x800:
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateUndefined|0x800:
                  __int16 v2 = 641;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateReady|0x800:
                  __int16 v2 = 642;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateNotAvailable|0x800:
                  __int16 v2 = 643;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateNoData|0x800:
                  __int16 v2 = 644;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorStateInitializing|0x800:
                  __int16 v2 = 645;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorEventRangeMinimumReached|0x800:
                  __int16 v2 = 646;
                  goto LABEL_131;
                case CoreHID_HIDUsage_SensorsUsage_sensorEventHighThresholdCrossUpward|0x800:
                  goto LABEL_132;
                case CoreHID_HIDUsage_SensorsUsage_sensorEventHighThresholdCrossDownward|0x800:
                  __int16 *v1 = 648;
                  break;
                case CoreHID_HIDUsage_SensorsUsage_sensorEventLowThresholdCrossUpward|0x800:
                  __int16 *v1 = 649;
                  break;
                default:
                  goto LABEL_671;
              }

              return rawValue;
          }
      }
  }

CoreHID::HIDUsage::MedicalInstrumentUsage_optional __swiftcall HIDUsage.MedicalInstrumentUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 11;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_13;
    case 0x20u:
      char v2 = 1;
      goto LABEL_13;
    case 0x21u:
      char v2 = 2;
      goto LABEL_13;
    case 0x22u:
      char v2 = 3;
      goto LABEL_13;
    case 0x23u:
      char v2 = 4;
      goto LABEL_13;
    case 0x24u:
      char v2 = 5;
      goto LABEL_13;
    case 0x25u:
      char v2 = 6;
      goto LABEL_13;
    case 0x26u:
      char v2 = 7;
      goto LABEL_13;
    case 0x27u:
      char v2 = 8;
      goto LABEL_13;
    case 0x40u:
      char v2 = 9;
      goto LABEL_13;
    case 0x41u:
      char v2 = 10;
LABEL_13:
      char v3 = v2;
      goto LABEL_14;
    case 0x42u:
LABEL_14:
      char *v1 = v3;
      break;
    case 0x43u:
      char *v1 = 12;
      break;
    case 0x44u:
      char *v1 = 13;
      break;
    case 0x60u:
      char *v1 = 14;
      break;
    case 0x61u:
      char *v1 = 15;
      break;
    case 0x70u:
      char *v1 = 16;
      break;
    case 0x80u:
      char *v1 = 17;
      break;
    case 0x81u:
      char *v1 = 18;
      break;
    case 0x82u:
      char *v1 = 19;
      break;
    case 0x83u:
      char *v1 = 20;
      break;
    case 0x84u:
      char *v1 = 21;
      break;
    case 0x85u:
      char *v1 = 22;
      break;
    case 0x86u:
      char *v1 = 23;
      break;
    case 0x87u:
      char *v1 = 24;
      break;
    case 0x88u:
      char *v1 = 25;
      break;
    case 0x89u:
      char *v1 = 26;
      break;
    case 0xA0u:
      char *v1 = 27;
      break;
    case 0xA1u:
      char *v1 = 28;
      break;
    default:
      char *v1 = 29;
      break;
  }

  return (CoreHID::HIDUsage::MedicalInstrumentUsage_optional)rawValue;
}

CoreHID::HIDUsage::BrailleDisplayUsage_optional __swiftcall HIDUsage.BrailleDisplayUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  switch(rawValue)
  {
    case 0xFAu:
      _BYTE *v1 = 7;
      break;
    case 0xFBu:
      _BYTE *v1 = 8;
      break;
    case 0xFCu:
      _BYTE *v1 = 9;
      break;
    case 0x100u:
      _BYTE *v1 = 10;
      break;
    case 0x101u:
      _BYTE *v1 = 11;
      break;
    case 0x200u:
      _BYTE *v1 = 12;
      break;
    case 0x201u:
      _BYTE *v1 = 13;
      break;
    case 0x202u:
      _BYTE *v1 = 14;
      break;
    case 0x203u:
      _BYTE *v1 = 15;
      break;
    case 0x204u:
      _BYTE *v1 = 16;
      break;
    case 0x205u:
      _BYTE *v1 = 17;
      break;
    case 0x206u:
      _BYTE *v1 = 18;
      break;
    case 0x207u:
      _BYTE *v1 = 19;
      break;
    case 0x208u:
      _BYTE *v1 = 20;
      break;
    case 0x209u:
      _BYTE *v1 = 21;
      break;
    case 0x20Au:
      _BYTE *v1 = 22;
      break;
    case 0x20Bu:
      _BYTE *v1 = 23;
      break;
    case 0x20Cu:
      _BYTE *v1 = 24;
      break;
    case 0x20Du:
      _BYTE *v1 = 25;
      break;
    case 0x20Eu:
      _BYTE *v1 = 26;
      break;
    case 0x20Fu:
      _BYTE *v1 = 27;
      break;
    case 0x210u:
      _BYTE *v1 = 28;
      break;
    case 0x211u:
      _BYTE *v1 = 29;
      break;
    case 0x212u:
      _BYTE *v1 = 30;
      break;
    case 0x213u:
      _BYTE *v1 = 31;
      break;
    case 0x214u:
      _BYTE *v1 = 32;
      break;
    case 0x215u:
      _BYTE *v1 = 33;
      break;
    case 0x216u:
      _BYTE *v1 = 34;
      break;
    case 0x217u:
      _BYTE *v1 = 35;
      break;
    case 0x218u:
      _BYTE *v1 = 36;
      break;
    case 0x219u:
      _BYTE *v1 = 37;
      break;
    case 0x21Au:
      _BYTE *v1 = 38;
      break;
    case 0x21Bu:
      _BYTE *v1 = 39;
      break;
    case 0x21Cu:
      _BYTE *v1 = 40;
      break;
    case 0x21Du:
      _BYTE *v1 = 41;
      break;
    case 0x21Eu:
      _BYTE *v1 = 42;
      break;
    default:
      _BYTE *v1 = 43;
      break;
  }

  return (CoreHID::HIDUsage::BrailleDisplayUsage_optional)rawValue;
}

CoreHID::HIDUsage::LightingAndIlluminationUsage_optional __swiftcall HIDUsage.LightingAndIlluminationUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 15;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_16;
    case 2u:
      char v2 = 1;
      goto LABEL_16;
    case 3u:
      char v2 = 2;
      goto LABEL_16;
    case 4u:
      char v2 = 3;
      goto LABEL_16;
    case 5u:
      char v2 = 4;
      goto LABEL_16;
    case 6u:
      char v2 = 5;
      goto LABEL_16;
    case 7u:
      char v2 = 6;
      goto LABEL_16;
    case 8u:
      char v2 = 7;
      goto LABEL_16;
    case 0x20u:
      char v2 = 8;
      goto LABEL_16;
    case 0x21u:
      char v2 = 9;
      goto LABEL_16;
    case 0x22u:
      char v2 = 10;
      goto LABEL_16;
    case 0x23u:
      char v2 = 11;
      goto LABEL_16;
    case 0x24u:
      char v2 = 12;
      goto LABEL_16;
    case 0x25u:
      char v2 = 13;
      goto LABEL_16;
    case 0x26u:
      char v2 = 14;
LABEL_16:
      char v3 = v2;
      goto LABEL_17;
    case 0x27u:
LABEL_17:
      char *v1 = v3;
      break;
    case 0x28u:
      char *v1 = 16;
      break;
    case 0x29u:
      char *v1 = 17;
      break;
    case 0x2Au:
      char *v1 = 18;
      break;
    case 0x2Bu:
      char *v1 = 19;
      break;
    case 0x2Cu:
      char *v1 = 20;
      break;
    case 0x2Du:
      char *v1 = 21;
      break;
    case 0x50u:
      char *v1 = 22;
      break;
    case 0x51u:
      char *v1 = 23;
      break;
    case 0x52u:
      char *v1 = 24;
      break;
    case 0x53u:
      char *v1 = 25;
      break;
    case 0x54u:
      char *v1 = 26;
      break;
    case 0x55u:
      char *v1 = 27;
      break;
    case 0x60u:
      char *v1 = 28;
      break;
    case 0x61u:
      char *v1 = 29;
      break;
    case 0x62u:
      char *v1 = 30;
      break;
    case 0x70u:
      char *v1 = 31;
      break;
    case 0x71u:
      char *v1 = 32;
      break;
    default:
      char *v1 = 33;
      break;
  }

  return (CoreHID::HIDUsage::LightingAndIlluminationUsage_optional)rawValue;
}

CoreHID::HIDUsage::MonitorUsage_optional __swiftcall HIDUsage.MonitorUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  if (rawValue >= 5u) {
    char v2 = 4;
  }
  else {
    char v2 = 0x302010004uLL >> (8 * rawValue);
  }
  char *v1 = v2;
  return (CoreHID::HIDUsage::MonitorUsage_optional)rawValue;
}

CoreHID::HIDUsage::VESAVirtualControlsUsage_optional __swiftcall HIDUsage.VESAVirtualControlsUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 27;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_29;
    case 0x10u:
      char v2 = 1;
      goto LABEL_29;
    case 0x12u:
      char v2 = 2;
      goto LABEL_29;
    case 0x16u:
      char v2 = 3;
      goto LABEL_29;
    case 0x18u:
      char v2 = 4;
      goto LABEL_29;
    case 0x1Au:
      char v2 = 5;
      goto LABEL_29;
    case 0x1Cu:
      char v2 = 6;
      goto LABEL_29;
    case 0x20u:
      char v2 = 7;
      goto LABEL_29;
    case 0x22u:
      char v2 = 8;
      goto LABEL_29;
    case 0x24u:
      char v2 = 9;
      goto LABEL_29;
    case 0x26u:
      char v2 = 10;
      goto LABEL_29;
    case 0x28u:
      char v2 = 11;
      goto LABEL_29;
    case 0x2Au:
      char v2 = 12;
      goto LABEL_29;
    case 0x2Cu:
      char v2 = 13;
      goto LABEL_29;
    case 0x30u:
      char v2 = 14;
      goto LABEL_29;
    case 0x32u:
      char v2 = 15;
      goto LABEL_29;
    case 0x34u:
      char v2 = 16;
      goto LABEL_29;
    case 0x36u:
      char v2 = 17;
      goto LABEL_29;
    case 0x38u:
      char v2 = 18;
      goto LABEL_29;
    case 0x3Au:
      char v2 = 19;
      goto LABEL_29;
    case 0x3Cu:
      char v2 = 20;
      goto LABEL_29;
    case 0x40u:
      char v2 = 21;
      goto LABEL_29;
    case 0x42u:
      char v2 = 22;
      goto LABEL_29;
    case 0x44u:
      char v2 = 23;
      goto LABEL_29;
    case 0x46u:
      char v2 = 24;
      goto LABEL_29;
    case 0x48u:
      char v2 = 25;
      goto LABEL_29;
    case 0x4Au:
      char v2 = 26;
LABEL_29:
      char v3 = v2;
      goto LABEL_30;
    case 0x4Cu:
LABEL_30:
      char *v1 = v3;
      break;
    case 0x56u:
      char *v1 = 28;
      break;
    case 0x58u:
      char *v1 = 29;
      break;
    case 0x5Eu:
      char *v1 = 30;
      break;
    case 0x60u:
      char *v1 = 31;
      break;
    case 0x6Cu:
      char *v1 = 32;
      break;
    case 0x6Eu:
      char *v1 = 33;
      break;
    case 0x70u:
      char *v1 = 34;
      break;
    case 0xA2u:
      char *v1 = 35;
      break;
    case 0xA4u:
      char *v1 = 36;
      break;
    case 0xA6u:
      char *v1 = 37;
      break;
    case 0xA8u:
      char *v1 = 38;
      break;
    case 0xAAu:
      char *v1 = 39;
      break;
    case 0xACu:
      char *v1 = 40;
      break;
    case 0xAEu:
      char *v1 = 41;
      break;
    case 0xB0u:
      char *v1 = 42;
      break;
    case 0xCAu:
      char *v1 = 43;
      break;
    case 0xD4u:
      char *v1 = 44;
      break;
    default:
      char *v1 = 45;
      break;
  }

  return (CoreHID::HIDUsage::VESAVirtualControlsUsage_optional)rawValue;
}

CoreHID::HIDUsage::PowerUsage_optional __swiftcall HIDUsage.PowerUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 59;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_60;
    case 2u:
      char v2 = 1;
      goto LABEL_60;
    case 3u:
      char v2 = 2;
      goto LABEL_60;
    case 4u:
      char v2 = 3;
      goto LABEL_60;
    case 5u:
      char v2 = 4;
      goto LABEL_60;
    case 0x10u:
      char v2 = 5;
      goto LABEL_60;
    case 0x11u:
      char v2 = 6;
      goto LABEL_60;
    case 0x12u:
      char v2 = 7;
      goto LABEL_60;
    case 0x13u:
      char v2 = 8;
      goto LABEL_60;
    case 0x14u:
      char v2 = 9;
      goto LABEL_60;
    case 0x15u:
      char v2 = 10;
      goto LABEL_60;
    case 0x16u:
      char v2 = 11;
      goto LABEL_60;
    case 0x17u:
      char v2 = 12;
      goto LABEL_60;
    case 0x18u:
      char v2 = 13;
      goto LABEL_60;
    case 0x19u:
      char v2 = 14;
      goto LABEL_60;
    case 0x1Au:
      char v2 = 15;
      goto LABEL_60;
    case 0x1Bu:
      char v2 = 16;
      goto LABEL_60;
    case 0x1Cu:
      char v2 = 17;
      goto LABEL_60;
    case 0x1Du:
      char v2 = 18;
      goto LABEL_60;
    case 0x1Eu:
      char v2 = 19;
      goto LABEL_60;
    case 0x1Fu:
      char v2 = 20;
      goto LABEL_60;
    case 0x20u:
      char v2 = 21;
      goto LABEL_60;
    case 0x21u:
      char v2 = 22;
      goto LABEL_60;
    case 0x22u:
      char v2 = 23;
      goto LABEL_60;
    case 0x23u:
      char v2 = 24;
      goto LABEL_60;
    case 0x24u:
      char v2 = 25;
      goto LABEL_60;
    case 0x25u:
      char v2 = 26;
      goto LABEL_60;
    case 0x30u:
      char v2 = 27;
      goto LABEL_60;
    case 0x31u:
      char v2 = 28;
      goto LABEL_60;
    case 0x32u:
      char v2 = 29;
      goto LABEL_60;
    case 0x33u:
      char v2 = 30;
      goto LABEL_60;
    case 0x34u:
      char v2 = 31;
      goto LABEL_60;
    case 0x35u:
      char v2 = 32;
      goto LABEL_60;
    case 0x36u:
      char v2 = 33;
      goto LABEL_60;
    case 0x37u:
      char v2 = 34;
      goto LABEL_60;
    case 0x38u:
      char v2 = 35;
      goto LABEL_60;
    case 0x40u:
      char v2 = 36;
      goto LABEL_60;
    case 0x41u:
      char v2 = 37;
      goto LABEL_60;
    case 0x42u:
      char v2 = 38;
      goto LABEL_60;
    case 0x43u:
      char v2 = 39;
      goto LABEL_60;
    case 0x44u:
      char v2 = 40;
      goto LABEL_60;
    case 0x45u:
      char v2 = 41;
      goto LABEL_60;
    case 0x46u:
      char v2 = 42;
      goto LABEL_60;
    case 0x47u:
      char v2 = 43;
      goto LABEL_60;
    case 0x50u:
      char v2 = 44;
      goto LABEL_60;
    case 0x51u:
      char v2 = 45;
      goto LABEL_60;
    case 0x52u:
      char v2 = 46;
      goto LABEL_60;
    case 0x53u:
      char v2 = 47;
      goto LABEL_60;
    case 0x54u:
      char v2 = 48;
      goto LABEL_60;
    case 0x55u:
      char v2 = 49;
      goto LABEL_60;
    case 0x56u:
      char v2 = 50;
      goto LABEL_60;
    case 0x57u:
      char v2 = 51;
      goto LABEL_60;
    case 0x58u:
      char v2 = 52;
      goto LABEL_60;
    case 0x59u:
      char v2 = 53;
      goto LABEL_60;
    case 0x5Au:
      char v2 = 54;
      goto LABEL_60;
    case 0x60u:
      char v2 = 55;
      goto LABEL_60;
    case 0x61u:
      char v2 = 56;
      goto LABEL_60;
    case 0x62u:
      char v2 = 57;
      goto LABEL_60;
    case 0x63u:
      char v2 = 58;
LABEL_60:
      char v3 = v2;
      goto LABEL_61;
    case 0x64u:
LABEL_61:
      char *v1 = v3;
      break;
    case 0x65u:
      char *v1 = 60;
      break;
    case 0x66u:
      char *v1 = 61;
      break;
    case 0x67u:
      char *v1 = 62;
      break;
    case 0x68u:
      char *v1 = 63;
      break;
    case 0x69u:
      char *v1 = 64;
      break;
    case 0x6Bu:
      char *v1 = 65;
      break;
    case 0x6Cu:
      char *v1 = 66;
      break;
    case 0x6Du:
      char *v1 = 67;
      break;
    case 0x6Eu:
      char *v1 = 68;
      break;
    case 0x6Fu:
      char *v1 = 69;
      break;
    case 0x70u:
      char *v1 = 70;
      break;
    case 0x71u:
      char *v1 = 71;
      break;
    case 0x72u:
      char *v1 = 72;
      break;
    case 0x73u:
      char *v1 = 73;
      break;
    case 0xFDu:
      char *v1 = 74;
      break;
    case 0xFEu:
      char *v1 = 75;
      break;
    case 0xFFu:
      char *v1 = 76;
      break;
    default:
      char *v1 = 77;
      break;
  }

  return (CoreHID::HIDUsage::PowerUsage_optional)rawValue;
}

CoreHID::HIDUsage::BatterySystemUsage_optional __swiftcall HIDUsage.BatterySystemUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 73;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_75;
    case 2u:
      char v2 = 1;
      goto LABEL_75;
    case 3u:
      char v2 = 2;
      goto LABEL_75;
    case 4u:
      char v2 = 3;
      goto LABEL_75;
    case 5u:
      char v2 = 4;
      goto LABEL_75;
    case 6u:
      char v2 = 5;
      goto LABEL_75;
    case 7u:
      char v2 = 6;
      goto LABEL_75;
    case 8u:
      char v2 = 7;
      goto LABEL_75;
    case 9u:
      char v2 = 8;
      goto LABEL_75;
    case 0x10u:
      char v2 = 9;
      goto LABEL_75;
    case 0x11u:
      char v2 = 10;
      goto LABEL_75;
    case 0x12u:
      char v2 = 11;
      goto LABEL_75;
    case 0x13u:
      char v2 = 12;
      goto LABEL_75;
    case 0x14u:
      char v2 = 13;
      goto LABEL_75;
    case 0x15u:
      char v2 = 14;
      goto LABEL_75;
    case 0x16u:
      char v2 = 15;
      goto LABEL_75;
    case 0x17u:
      char v2 = 16;
      goto LABEL_75;
    case 0x18u:
      char v2 = 17;
      goto LABEL_75;
    case 0x19u:
      char v2 = 18;
      goto LABEL_75;
    case 0x1Au:
      char v2 = 19;
      goto LABEL_75;
    case 0x1Bu:
      char v2 = 20;
      goto LABEL_75;
    case 0x1Cu:
      char v2 = 21;
      goto LABEL_75;
    case 0x1Du:
      char v2 = 22;
      goto LABEL_75;
    case 0x28u:
      char v2 = 23;
      goto LABEL_75;
    case 0x29u:
      char v2 = 24;
      goto LABEL_75;
    case 0x2Au:
      char v2 = 25;
      goto LABEL_75;
    case 0x2Bu:
      char v2 = 26;
      goto LABEL_75;
    case 0x2Cu:
      char v2 = 27;
      goto LABEL_75;
    case 0x2Du:
      char v2 = 28;
      goto LABEL_75;
    case 0x2Eu:
      char v2 = 29;
      goto LABEL_75;
    case 0x2Fu:
      char v2 = 30;
      goto LABEL_75;
    case 0x40u:
      char v2 = 31;
      goto LABEL_75;
    case 0x41u:
      char v2 = 32;
      goto LABEL_75;
    case 0x42u:
      char v2 = 33;
      goto LABEL_75;
    case 0x43u:
      char v2 = 34;
      goto LABEL_75;
    case 0x44u:
      char v2 = 35;
      goto LABEL_75;
    case 0x45u:
      char v2 = 36;
      goto LABEL_75;
    case 0x46u:
      char v2 = 37;
      goto LABEL_75;
    case 0x47u:
      char v2 = 38;
      goto LABEL_75;
    case 0x48u:
      char v2 = 39;
      goto LABEL_75;
    case 0x49u:
      char v2 = 40;
      goto LABEL_75;
    case 0x4Au:
      char v2 = 41;
      goto LABEL_75;
    case 0x4Bu:
      char v2 = 42;
      goto LABEL_75;
    case 0x60u:
      char v2 = 43;
      goto LABEL_75;
    case 0x61u:
      char v2 = 44;
      goto LABEL_75;
    case 0x62u:
      char v2 = 45;
      goto LABEL_75;
    case 0x63u:
      char v2 = 46;
      goto LABEL_75;
    case 0x64u:
      char v2 = 47;
      goto LABEL_75;
    case 0x65u:
      char v2 = 48;
      goto LABEL_75;
    case 0x66u:
      char v2 = 49;
      goto LABEL_75;
    case 0x67u:
      char v2 = 50;
      goto LABEL_75;
    case 0x68u:
      char v2 = 51;
      goto LABEL_75;
    case 0x69u:
      char v2 = 52;
      goto LABEL_75;
    case 0x6Au:
      char v2 = 53;
      goto LABEL_75;
    case 0x6Bu:
      char v2 = 54;
      goto LABEL_75;
    case 0x80u:
      char v2 = 55;
      goto LABEL_75;
    case 0x81u:
      char v2 = 56;
      goto LABEL_75;
    case 0x82u:
      char v2 = 57;
      goto LABEL_75;
    case 0x83u:
      char v2 = 58;
      goto LABEL_75;
    case 0x84u:
      char v2 = 59;
      goto LABEL_75;
    case 0x85u:
      char v2 = 60;
      goto LABEL_75;
    case 0x86u:
      char v2 = 61;
      goto LABEL_75;
    case 0x87u:
      char v2 = 62;
      goto LABEL_75;
    case 0x88u:
      char v2 = 63;
      goto LABEL_75;
    case 0x89u:
      char v2 = 64;
      goto LABEL_75;
    case 0x8Au:
      char v2 = 65;
      goto LABEL_75;
    case 0x8Bu:
      char v2 = 66;
      goto LABEL_75;
    case 0x8Cu:
      char v2 = 67;
      goto LABEL_75;
    case 0x8Du:
      char v2 = 68;
      goto LABEL_75;
    case 0x8Eu:
      char v2 = 69;
      goto LABEL_75;
    case 0x8Fu:
      char v2 = 70;
      goto LABEL_75;
    case 0xC0u:
      char v2 = 71;
      goto LABEL_75;
    case 0xC1u:
      char v2 = 72;
LABEL_75:
      char v3 = v2;
      goto LABEL_76;
    case 0xC2u:
LABEL_76:
      char *v1 = v3;
      break;
    case 0xD0u:
      char *v1 = 74;
      break;
    case 0xD1u:
      char *v1 = 75;
      break;
    case 0xD2u:
      char *v1 = 76;
      break;
    case 0xD3u:
      char *v1 = 77;
      break;
    case 0xD4u:
      char *v1 = 78;
      break;
    case 0xD5u:
      char *v1 = 79;
      break;
    case 0xD6u:
      char *v1 = 80;
      break;
    case 0xD7u:
      char *v1 = 81;
      break;
    case 0xD8u:
      char *v1 = 82;
      break;
    case 0xD9u:
      char *v1 = 83;
      break;
    case 0xDAu:
      char *v1 = 84;
      break;
    case 0xDBu:
      char *v1 = 85;
      break;
    case 0xDCu:
      char *v1 = 86;
      break;
    case 0xF0u:
      char *v1 = 87;
      break;
    case 0xF1u:
      char *v1 = 88;
      break;
    case 0xF2u:
      char *v1 = 89;
      break;
    case 0xF3u:
      char *v1 = 90;
      break;
    default:
      char *v1 = 91;
      break;
  }

  return (CoreHID::HIDUsage::BatterySystemUsage_optional)rawValue;
}

CoreHID::HIDUsage::BarcodeScannerUsage_optional __swiftcall HIDUsage.BarcodeScannerUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 0;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_131;
    case 2u:
      char v2 = 1;
      goto LABEL_131;
    case 3u:
      char v2 = 2;
      goto LABEL_131;
    case 4u:
      char v2 = 3;
      goto LABEL_131;
    case 5u:
      char v2 = 4;
      goto LABEL_131;
    case 0x10u:
      char v2 = 5;
      goto LABEL_131;
    case 0x11u:
      char v2 = 6;
      goto LABEL_131;
    case 0x12u:
      char v2 = 7;
      goto LABEL_131;
    case 0x13u:
      char v2 = 8;
      goto LABEL_131;
    case 0x14u:
      char v2 = 9;
      goto LABEL_131;
    case 0x15u:
      char v2 = 10;
      goto LABEL_131;
    case 0x16u:
      char v2 = 11;
      goto LABEL_131;
    case 0x17u:
      char v2 = 12;
      goto LABEL_131;
    case 0x18u:
      char v2 = 13;
      goto LABEL_131;
    case 0x19u:
      char v2 = 14;
      goto LABEL_131;
    case 0x1Au:
      char v2 = 15;
      goto LABEL_131;
    case 0x1Bu:
      char v2 = 16;
      goto LABEL_131;
    case 0x1Cu:
      char v2 = 17;
      goto LABEL_131;
    case 0x1Du:
      char v2 = 18;
      goto LABEL_131;
    case 0x1Eu:
      char v2 = 19;
      goto LABEL_131;
    case 0x1Fu:
      char v2 = 20;
      goto LABEL_131;
    case 0x30u:
      char v2 = 21;
      goto LABEL_131;
    case 0x31u:
      char v2 = 22;
      goto LABEL_131;
    case 0x32u:
      char v2 = 23;
      goto LABEL_131;
    case 0x33u:
      char v2 = 24;
      goto LABEL_131;
    case 0x34u:
      char v2 = 25;
      goto LABEL_131;
    case 0x35u:
      char v2 = 26;
      goto LABEL_131;
    case 0x36u:
      char v2 = 27;
      goto LABEL_131;
    case 0x37u:
      char v2 = 28;
      goto LABEL_131;
    case 0x38u:
      char v2 = 29;
      goto LABEL_131;
    case 0x39u:
      char v2 = 30;
      goto LABEL_131;
    case 0x3Au:
      char v2 = 31;
      goto LABEL_131;
    case 0x3Bu:
      char v2 = 32;
      goto LABEL_131;
    case 0x3Cu:
      char v2 = 33;
      goto LABEL_131;
    case 0x3Du:
      char v2 = 34;
      goto LABEL_131;
    case 0x3Eu:
      char v2 = 35;
      goto LABEL_131;
    case 0x3Fu:
      char v2 = 36;
      goto LABEL_131;
    case 0x40u:
      char v2 = 37;
      goto LABEL_131;
    case 0x41u:
      char v2 = 38;
      goto LABEL_131;
    case 0x42u:
      char v2 = 39;
      goto LABEL_131;
    case 0x43u:
      char v2 = 40;
      goto LABEL_131;
    case 0x44u:
      char v2 = 41;
      goto LABEL_131;
    case 0x45u:
      char v2 = 42;
      goto LABEL_131;
    case 0x46u:
      char v2 = 43;
      goto LABEL_131;
    case 0x4Du:
      char v2 = 44;
      goto LABEL_131;
    case 0x4Eu:
      char v2 = 45;
      goto LABEL_131;
    case 0x4Fu:
      char v2 = 46;
      goto LABEL_131;
    case 0x50u:
      char v2 = 47;
      goto LABEL_131;
    case 0x51u:
      char v2 = 48;
      goto LABEL_131;
    case 0x52u:
      char v2 = 49;
      goto LABEL_131;
    case 0x55u:
      char v2 = 50;
      goto LABEL_131;
    case 0x56u:
      char v2 = 51;
      goto LABEL_131;
    case 0x57u:
      char v2 = 52;
      goto LABEL_131;
    case 0x58u:
      char v2 = 53;
      goto LABEL_131;
    case 0x59u:
      char v2 = 54;
      goto LABEL_131;
    case 0x5Au:
      char v2 = 55;
      goto LABEL_131;
    case 0x5Bu:
      char v2 = 56;
      goto LABEL_131;
    case 0x5Cu:
      char v2 = 57;
      goto LABEL_131;
    case 0x5Du:
      char v2 = 58;
      goto LABEL_131;
    case 0x5Eu:
      char v2 = 59;
      goto LABEL_131;
    case 0x5Fu:
      char v2 = 60;
      goto LABEL_131;
    case 0x60u:
      char v2 = 61;
      goto LABEL_131;
    case 0x61u:
      char v2 = 62;
      goto LABEL_131;
    case 0x62u:
      char v2 = 63;
      goto LABEL_131;
    case 0x63u:
      char v2 = 64;
      goto LABEL_131;
    case 0x64u:
      char v2 = 65;
      goto LABEL_131;
    case 0x65u:
      char v2 = 66;
      goto LABEL_131;
    case 0x66u:
      char v2 = 67;
      goto LABEL_131;
    case 0x6Du:
      char v2 = 68;
      goto LABEL_131;
    case 0x6Eu:
      char v2 = 69;
      goto LABEL_131;
    case 0x6Fu:
      char v2 = 70;
      goto LABEL_131;
    case 0x70u:
      char v2 = 71;
      goto LABEL_131;
    case 0x75u:
      char v2 = 72;
      goto LABEL_131;
    case 0x76u:
      char v2 = 73;
      goto LABEL_131;
    case 0x7Au:
      char v2 = 74;
      goto LABEL_131;
    case 0x7Bu:
      char v2 = 75;
      goto LABEL_131;
    case 0x7Cu:
      char v2 = 76;
      goto LABEL_131;
    case 0x7Du:
      char v2 = 77;
      goto LABEL_131;
    case 0x7Eu:
      char v2 = 78;
      goto LABEL_131;
    case 0x7Fu:
      char v2 = 79;
      goto LABEL_131;
    case 0x80u:
      char v2 = 80;
      goto LABEL_131;
    case 0x82u:
      char v2 = 81;
      goto LABEL_131;
    case 0x83u:
      char v2 = 82;
      goto LABEL_131;
    case 0x84u:
      char v2 = 83;
      goto LABEL_131;
    case 0x85u:
      char v2 = 84;
      goto LABEL_131;
    case 0x86u:
      char v2 = 85;
      goto LABEL_131;
    case 0x87u:
      char v2 = 86;
      goto LABEL_131;
    case 0x88u:
      char v2 = 87;
      goto LABEL_131;
    case 0x89u:
      char v2 = 88;
      goto LABEL_131;
    case 0x8Au:
      char v2 = 89;
      goto LABEL_131;
    case 0x8Bu:
      char v2 = 90;
      goto LABEL_131;
    case 0x91u:
      char v2 = 91;
      goto LABEL_131;
    case 0x92u:
      char v2 = 92;
      goto LABEL_131;
    case 0x93u:
      char v2 = 93;
      goto LABEL_131;
    case 0x94u:
      char v2 = 94;
      goto LABEL_131;
    case 0x95u:
      char v2 = 95;
      goto LABEL_131;
    case 0x96u:
      char v2 = 96;
      goto LABEL_131;
    case 0x97u:
      char v2 = 97;
      goto LABEL_131;
    case 0x98u:
      char v2 = 98;
      goto LABEL_131;
    case 0x99u:
      char v2 = 99;
      goto LABEL_131;
    case 0x9Au:
      char v2 = 100;
      goto LABEL_131;
    case 0x9Bu:
      char v2 = 101;
      goto LABEL_131;
    case 0x9Cu:
      char v2 = 102;
      goto LABEL_131;
    case 0x9Du:
      char v2 = 103;
      goto LABEL_131;
    case 0x9Eu:
      char v2 = 104;
      goto LABEL_131;
    case 0x9Fu:
      char v2 = 105;
      goto LABEL_131;
    case 0xA0u:
      char v2 = 106;
      goto LABEL_131;
    case 0xA1u:
      char v2 = 107;
      goto LABEL_131;
    case 0xA2u:
      char v2 = 108;
      goto LABEL_131;
    case 0xA9u:
      char v2 = 109;
      goto LABEL_131;
    case 0xAAu:
      char v2 = 110;
      goto LABEL_131;
    case 0xABu:
      char v2 = 111;
      goto LABEL_131;
    case 0xACu:
      char v2 = 112;
      goto LABEL_131;
    case 0xADu:
      char v2 = 113;
      goto LABEL_131;
    case 0xAEu:
      char v2 = 114;
      goto LABEL_131;
    case 0xAFu:
      char v2 = 115;
      goto LABEL_131;
    case 0xB0u:
      char v2 = 116;
      goto LABEL_131;
    case 0xB1u:
      char v2 = 117;
      goto LABEL_131;
    case 0xB2u:
      char v2 = 118;
      goto LABEL_131;
    case 0xB3u:
      char v2 = 119;
      goto LABEL_131;
    case 0xB4u:
      char v2 = 120;
      goto LABEL_131;
    case 0xB5u:
      char v2 = 121;
      goto LABEL_131;
    case 0xB7u:
      char v2 = 122;
      goto LABEL_131;
    case 0xB8u:
      char v2 = 123;
      goto LABEL_131;
    case 0xB9u:
      char v2 = 124;
      goto LABEL_131;
    case 0xBAu:
      char v2 = 125;
      goto LABEL_131;
    case 0xBBu:
      char v2 = 126;
      goto LABEL_131;
    case 0xBCu:
      char v2 = 127;
LABEL_131:
      char v3 = v2;
LABEL_132:
      char *v1 = v3;
      break;
    default:
      char v3 = -80;
      char v2 = 0x80;
      switch(rawValue)
      {
        case 0xBDu:
          goto LABEL_131;
        case 0xBEu:
          char v2 = -127;
          goto LABEL_131;
        case 0xBFu:
          char v2 = -126;
          goto LABEL_131;
        case 0xC0u:
          char v2 = -125;
          goto LABEL_131;
        case 0xC3u:
          char v2 = -124;
          goto LABEL_131;
        case 0xC4u:
          char v2 = -123;
          goto LABEL_131;
        case 0xC7u:
          char v2 = -122;
          goto LABEL_131;
        case 0xC8u:
          char v2 = -121;
          goto LABEL_131;
        case 0xC9u:
          char v2 = -120;
          goto LABEL_131;
        case 0xCAu:
          char v2 = -119;
          goto LABEL_131;
        case 0xCBu:
          char v2 = -118;
          goto LABEL_131;
        case 0xCCu:
          char v2 = -117;
          goto LABEL_131;
        case 0xCDu:
          char v2 = -116;
          goto LABEL_131;
        case 0xCEu:
          char v2 = -115;
          goto LABEL_131;
        case 0xD3u:
          char v2 = -114;
          goto LABEL_131;
        case 0xD4u:
          char v2 = -113;
          goto LABEL_131;
        case 0xD5u:
          char v2 = -112;
          goto LABEL_131;
        case 0xD6u:
          char v2 = -111;
          goto LABEL_131;
        case 0xD7u:
          char v2 = -110;
          goto LABEL_131;
        case 0xD8u:
          char v2 = -109;
          goto LABEL_131;
        case 0xD9u:
          char v2 = -108;
          goto LABEL_131;
        case 0xDAu:
          char v2 = -107;
          goto LABEL_131;
        case 0xDBu:
          char v2 = -106;
          goto LABEL_131;
        case 0xDCu:
          char v2 = -105;
          goto LABEL_131;
        case 0xDDu:
          char v2 = -104;
          goto LABEL_131;
        case 0xDEu:
          char v2 = -103;
          goto LABEL_131;
        case 0xDFu:
          char v2 = -102;
          goto LABEL_131;
        case 0xF0u:
          char v2 = -101;
          goto LABEL_131;
        case 0xF1u:
          char v2 = -100;
          goto LABEL_131;
        case 0xF2u:
          char v2 = -99;
          goto LABEL_131;
        case 0xFBu:
          char v2 = -98;
          goto LABEL_131;
        case 0xFCu:
          char v2 = -97;
          goto LABEL_131;
        case 0xFDu:
          char v2 = -96;
          goto LABEL_131;
        case 0xFEu:
          char v2 = -95;
          goto LABEL_131;
        case 0xFFu:
          char v2 = -94;
          goto LABEL_131;
        case 0x100u:
          char v2 = -93;
          goto LABEL_131;
        case 0x101u:
          char v2 = -92;
          goto LABEL_131;
        case 0x102u:
          char v2 = -91;
          goto LABEL_131;
        case 0x103u:
          char v2 = -90;
          goto LABEL_131;
        case 0x104u:
          char v2 = -89;
          goto LABEL_131;
        case 0x106u:
          char v2 = -88;
          goto LABEL_131;
        case 0x107u:
          char v2 = -87;
          goto LABEL_131;
        case 0x108u:
          char v2 = -86;
          goto LABEL_131;
        case 0x109u:
          char v2 = -85;
          goto LABEL_131;
        case 0x10Au:
          char v2 = -84;
          goto LABEL_131;
        case 0x10Bu:
          char v2 = -83;
          goto LABEL_131;
        case 0x10Cu:
          char v2 = -82;
          goto LABEL_131;
        case 0x10Du:
          char v2 = -81;
          goto LABEL_131;
        case 0x110u:
          goto LABEL_132;
        case 0x111u:
          char *v1 = -79;
          break;
        case 0x112u:
          char *v1 = -78;
          break;
        case 0x113u:
          char *v1 = -77;
          break;
        case 0x114u:
          char *v1 = -76;
          break;
        case 0x115u:
          char *v1 = -75;
          break;
        case 0x116u:
          char *v1 = -74;
          break;
        case 0x117u:
          char *v1 = -73;
          break;
        case 0x118u:
          char *v1 = -72;
          break;
        case 0x119u:
          char *v1 = -71;
          break;
        case 0x11Au:
          char *v1 = -70;
          break;
        case 0x11Bu:
          char *v1 = -69;
          break;
        case 0x11Cu:
          char *v1 = -68;
          break;
        case 0x11Du:
          char *v1 = -67;
          break;
        case 0x11Eu:
          char *v1 = -66;
          break;
        case 0x11Fu:
          char *v1 = -65;
          break;
        default:
          if (rawValue == 289) {
            char v4 = -63;
          }
          else {
            char v4 = -62;
          }
          if (rawValue == 288) {
            char v4 = -64;
          }
          char *v1 = v4;
          break;
      }

      break;
  }

  return (CoreHID::HIDUsage::BarcodeScannerUsage_optional)rawValue;
}

CoreHID::HIDUsage::ScalesUsage_optional __swiftcall HIDUsage.ScalesUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 28;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_30;
    case 0x20u:
      char v2 = 1;
      goto LABEL_30;
    case 0x21u:
      char v2 = 2;
      goto LABEL_30;
    case 0x22u:
      char v2 = 3;
      goto LABEL_30;
    case 0x23u:
      char v2 = 4;
      goto LABEL_30;
    case 0x24u:
      char v2 = 5;
      goto LABEL_30;
    case 0x25u:
      char v2 = 6;
      goto LABEL_30;
    case 0x26u:
      char v2 = 7;
      goto LABEL_30;
    case 0x27u:
      char v2 = 8;
      goto LABEL_30;
    case 0x28u:
      char v2 = 9;
      goto LABEL_30;
    case 0x29u:
      char v2 = 10;
      goto LABEL_30;
    case 0x2Au:
      char v2 = 11;
      goto LABEL_30;
    case 0x30u:
      char v2 = 12;
      goto LABEL_30;
    case 0x31u:
      char v2 = 13;
      goto LABEL_30;
    case 0x32u:
      char v2 = 14;
      goto LABEL_30;
    case 0x33u:
      char v2 = 15;
      goto LABEL_30;
    case 0x34u:
      char v2 = 16;
      goto LABEL_30;
    case 0x35u:
      char v2 = 17;
      goto LABEL_30;
    case 0x40u:
      char v2 = 18;
      goto LABEL_30;
    case 0x41u:
      char v2 = 19;
      goto LABEL_30;
    case 0x50u:
      char v2 = 20;
      goto LABEL_30;
    case 0x51u:
      char v2 = 21;
      goto LABEL_30;
    case 0x52u:
      char v2 = 22;
      goto LABEL_30;
    case 0x53u:
      char v2 = 23;
      goto LABEL_30;
    case 0x54u:
      char v2 = 24;
      goto LABEL_30;
    case 0x55u:
      char v2 = 25;
      goto LABEL_30;
    case 0x56u:
      char v2 = 26;
      goto LABEL_30;
    case 0x57u:
      char v2 = 27;
LABEL_30:
      char v3 = v2;
      goto LABEL_31;
    case 0x58u:
LABEL_31:
      char *v1 = v3;
      break;
    case 0x59u:
      char *v1 = 29;
      break;
    case 0x5Au:
      char *v1 = 30;
      break;
    case 0x5Bu:
      char *v1 = 31;
      break;
    case 0x5Cu:
      char *v1 = 32;
      break;
    case 0x60u:
      char *v1 = 33;
      break;
    case 0x61u:
      char *v1 = 34;
      break;
    case 0x70u:
      char *v1 = 35;
      break;
    case 0x71u:
      char *v1 = 36;
      break;
    case 0x72u:
      char *v1 = 37;
      break;
    case 0x73u:
      char *v1 = 38;
      break;
    case 0x74u:
      char *v1 = 39;
      break;
    case 0x75u:
      char *v1 = 40;
      break;
    case 0x76u:
      char *v1 = 41;
      break;
    case 0x77u:
      char *v1 = 42;
      break;
    case 0x78u:
      char *v1 = 43;
      break;
    case 0x80u:
      char *v1 = 44;
      break;
    case 0x81u:
      char *v1 = 45;
      break;
    default:
      char *v1 = 46;
      break;
  }

  return (CoreHID::HIDUsage::ScalesUsage_optional)rawValue;
}

CoreHID::HIDUsage::MagneticStripeReaderUsage_optional __swiftcall HIDUsage.MagneticStripeReaderUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  char v2 = 1;
  switch(rawValue)
  {
    case 1u:
      char v2 = 0;
      goto LABEL_3;
    case 0x11u:
LABEL_3:
      char *v1 = v2;
      break;
    case 0x12u:
      char *v1 = 2;
      break;
    case 0x13u:
      char *v1 = 3;
      break;
    case 0x14u:
      char *v1 = 4;
      break;
    case 0x20u:
      char *v1 = 5;
      break;
    case 0x21u:
      char *v1 = 6;
      break;
    case 0x22u:
      char *v1 = 7;
      break;
    case 0x23u:
      char *v1 = 8;
      break;
    case 0x24u:
      char *v1 = 9;
      break;
    default:
      char *v1 = 10;
      break;
  }

  return (CoreHID::HIDUsage::MagneticStripeReaderUsage_optional)rawValue;
}

CoreHID::HIDUsage::CameraControlUsage_optional __swiftcall HIDUsage.CameraControlUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  if (rawValue == 33) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (rawValue == 32) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  char *v1 = v3;
  return (CoreHID::HIDUsage::CameraControlUsage_optional)rawValue;
}

CoreHID::HIDUsage::ArcadeUsage_optional __swiftcall HIDUsage.ArcadeUsage.init(rawValue:)(Swift::UInt16 rawValue)
{
  char v2 = 0;
  char v3 = 9;
  switch(rawValue)
  {
    case 1u:
      goto LABEL_11;
    case 2u:
      char v2 = 1;
      goto LABEL_11;
    case 3u:
      char v2 = 2;
      goto LABEL_11;
    case 0x30u:
      char v2 = 3;
      goto LABEL_11;
    case 0x31u:
      char v2 = 4;
      goto LABEL_11;
    case 0x32u:
      char v2 = 5;
      goto LABEL_11;
    case 0x33u:
      char v2 = 6;
      goto LABEL_11;
    case 0x34u:
      char v2 = 7;
      goto LABEL_11;
    case 0x35u:
      char v2 = 8;
LABEL_11:
      char v3 = v2;
      goto LABEL_12;
    case 0x36u:
LABEL_12:
      char *v1 = v3;
      break;
    case 0x37u:
      char *v1 = 10;
      break;
    case 0x38u:
      char *v1 = 11;
      break;
    case 0x39u:
      char *v1 = 12;
      break;
    case 0x40u:
      char *v1 = 13;
      break;
    case 0x41u:
      char *v1 = 14;
      break;
    case 0x42u:
      char *v1 = 15;
      break;
    case 0x43u:
      char *v1 = 16;
      break;
    case 0x44u:
      char *v1 = 17;
      break;
    case 0x45u:
      char *v1 = 18;
      break;
    case 0x46u:
      char *v1 = 19;
      break;
    case 0x47u:
      char *v1 = 20;
      break;
    case 0x48u:
      char *v1 = 21;
      break;
    case 0x49u:
      char *v1 = 22;
      break;
    case 0x4Au:
      char *v1 = 23;
      break;
    case 0x4Bu:
      char *v1 = 24;
      break;
    case 0x4Cu:
      char *v1 = 25;
      break;
    case 0x4Du:
      char *v1 = 26;
      break;
    default:
      char *v1 = 27;
      break;
  }

  return (CoreHID::HIDUsage::ArcadeUsage_optional)rawValue;
}

CoreHID::HIDUsage::FIDOAllianceUsage_optional __swiftcall HIDUsage.FIDOAllianceUsage.init(rawValue:)( Swift::UInt16 rawValue)
{
  if (rawValue == 33) {
    char v2 = 2;
  }
  else {
    char v2 = 3;
  }
  if (rawValue == 32) {
    char v3 = 1;
  }
  else {
    char v3 = v2;
  }
  if (rawValue == 1) {
    char v4 = 0;
  }
  else {
    char v4 = v3;
  }
  char *v1 = v4;
  return (CoreHID::HIDUsage::FIDOAllianceUsage_optional)rawValue;
}

void HIDUsage.hash(into:)()
{
  __asm { BR              X10 }

uint64_t sub_189179688()
{
  if (v0 == 114) {
    return sub_18919AE50();
  }
  sub_18919AE50();
  return sub_18919AE5C();
}

uint64_t HIDUsage.hashValue.getter()
{
  return sub_18919AE74();
}

uint64_t sub_18917A9AC()
{
  return sub_18919AE74();
}

uint64_t sub_18917AA00()
{
  return sub_18919AE74();
}

void HIDUsage.description.getter()
{
  if ((v0 & 0x10000) != 0) {
    goto LABEL_4;
  }
  HIDUsage.usage.getter();
  if ((v1 & 0x10000) == 0)
  {
    sub_18919ADB4();
    sub_18919AA9C();
    swift_bridgeObjectRelease();
LABEL_4:
    sub_18919AA9C();
    swift_bridgeObjectRelease();
    sub_18919AA9C();
    return;
  }

  __break(1u);
}

uint64_t static HIDUsage.GenericDesktopUsage.page.getter()
{
  return 1LL;
}

BOOL sub_18917ABC4(char *a1, char *a2)
{
  return word_1891A5542[*a1] == word_1891A5542[*a2];
}

uint64_t sub_18917ABE8()
{
  return sub_18919AE74();
}

uint64_t sub_18917AC34()
{
  return sub_18919AE5C();
}

uint64_t sub_18917AC68()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::GenericDesktopUsage_optional sub_18917ACB0(Swift::UInt16 *a1)
{
  return HIDUsage.GenericDesktopUsage.init(rawValue:)(*a1);
}

void sub_18917ACB8(_WORD *a1@<X8>)
{
  *a1 = word_1891A5542[*v1];
}

uint64_t static HIDUsage.SimulationControlsUsage.page.getter()
{
  return 2LL;
}

BOOL sub_18917ACD8(char *a1, char *a2)
{
  return word_1891A5626[*a1] == word_1891A5626[*a2];
}

uint64_t sub_18917ACFC()
{
  return sub_18919AE74();
}

uint64_t sub_18917AD48()
{
  return sub_18919AE5C();
}

uint64_t sub_18917AD7C()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::SimulationControlsUsage_optional sub_18917ADC4(Swift::UInt16 *a1)
{
  return HIDUsage.SimulationControlsUsage.init(rawValue:)(*a1);
}

void sub_18917ADCC(_WORD *a1@<X8>)
{
  *a1 = word_1891A5626[*v1];
}

uint64_t static HIDUsage.VRControlsUsage.page.getter()
{
  return 3LL;
}

BOOL sub_18917ADEC(char *a1, char *a2)
{
  return word_1891A568C[*a1] == word_1891A568C[*a2];
}

uint64_t sub_18917AE10()
{
  return sub_18919AE74();
}

uint64_t sub_18917AE5C()
{
  return sub_18919AE5C();
}

uint64_t sub_18917AE90()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::VRControlsUsage_optional sub_18917AED8(Swift::UInt16 *a1)
{
  return HIDUsage.VRControlsUsage.init(rawValue:)(*a1);
}

void sub_18917AEE0(_WORD *a1@<X8>)
{
  *a1 = word_1891A568C[*v1];
}

uint64_t static HIDUsage.SportControlsUsage.page.getter()
{
  return 4LL;
}

BOOL sub_18917AF00(char *a1, char *a2)
{
  return word_1891A56A4[*a1] == word_1891A56A4[*a2];
}

uint64_t sub_18917AF24()
{
  return sub_18919AE74();
}

uint64_t sub_18917AF70()
{
  return sub_18919AE5C();
}

uint64_t sub_18917AFA4()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::SportControlsUsage_optional sub_18917AFEC(Swift::UInt16 *a1)
{
  return HIDUsage.SportControlsUsage.init(rawValue:)(*a1);
}

void sub_18917AFF4(_WORD *a1@<X8>)
{
  *a1 = word_1891A56A4[*v1];
}

uint64_t static HIDUsage.GameControlsUsage.page.getter()
{
  return 5LL;
}

BOOL sub_18917B014(char *a1, char *a2)
{
  return word_1891A56E8[*a1] == word_1891A56E8[*a2];
}

uint64_t sub_18917B038()
{
  return sub_18919AE74();
}

uint64_t sub_18917B084()
{
  return sub_18919AE5C();
}

uint64_t sub_18917B0B8()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::GameControlsUsage_optional sub_18917B100(Swift::UInt16 *a1)
{
  return HIDUsage.GameControlsUsage.init(rawValue:)(*a1);
}

void sub_18917B108(_WORD *a1@<X8>)
{
  *a1 = word_1891A56E8[*v1];
}

uint64_t static HIDUsage.GenericDeviceControlsUsage.page.getter()
{
  return 6LL;
}

BOOL sub_18917B128(char *a1, char *a2)
{
  return word_1891A5722[*a1] == word_1891A5722[*a2];
}

uint64_t sub_18917B14C()
{
  return sub_18919AE74();
}

uint64_t sub_18917B198()
{
  return sub_18919AE5C();
}

uint64_t sub_18917B1CC()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::GenericDeviceControlsUsage_optional sub_18917B214(Swift::UInt16 *a1)
{
  return HIDUsage.GenericDeviceControlsUsage.init(rawValue:)(*a1);
}

void sub_18917B21C(_WORD *a1@<X8>)
{
  *a1 = word_1891A5722[*v1];
}

uint64_t static HIDUsage.KeyboardOrKeypadUsage.page.getter()
{
  return 7LL;
}

uint64_t sub_18917B23C(unsigned __int8 *a1)
{
  return ((uint64_t (*)())((char *)sub_18917B260 + 4 * word_18919FE60[*a1]))();
}

uint64_t sub_18917B260()
{
  return ((uint64_t (*)(void))((char *)sub_18917B940 + 4 * word_1891A0014[v0]))();
}

BOOL sub_18917B940@<W0>(int a1@<W8>)
{
  return a1 == 2;
}

void sub_18917C010()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  __asm { BR              X9 }

uint64_t sub_18917C04C()
{
  return sub_18919AE74();
}

void sub_18917C730()
{
  __asm { BR              X11 }

uint64_t sub_18917C760()
{
  return sub_18919AE5C();
}

void sub_18917CE38()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  __asm { BR              X9 }

uint64_t sub_18917CE70()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::KeyboardOrKeypadUsage_optional sub_18917D554(Swift::UInt16 *a1)
{
  return HIDUsage.KeyboardOrKeypadUsage.init(rawValue:)(*a1);
}

uint64_t sub_18917D55C()
{
  return ((uint64_t (*)(void))((char *)sub_18917D57C + 4 * word_1891A06E4[*v0]))();
}

void sub_18917D57C(_WORD *a1@<X8>)
{
  *a1 = 2;
}

void sub_18917D588(_WORD *a1@<X8>)
{
  *a1 = 3;
}

void sub_18917D594(_WORD *a1@<X8>)
{
  *a1 = 4;
}

void sub_18917D5A0(_WORD *a1@<X8>)
{
  *a1 = 5;
}

void sub_18917D5AC(_WORD *a1@<X8>)
{
  *a1 = 6;
}

void sub_18917D5B8(_WORD *a1@<X8>)
{
  *a1 = 7;
}

void sub_18917D5C4(_WORD *a1@<X8>)
{
  *a1 = 8;
}

void sub_18917D5D0(_WORD *a1@<X8>)
{
  *a1 = 9;
}

void sub_18917D5DC(_WORD *a1@<X8>)
{
  *a1 = 10;
}

void sub_18917D5E8(_WORD *a1@<X8>)
{
  *a1 = 11;
}

void sub_18917D5F4(_WORD *a1@<X8>)
{
  *a1 = 12;
}

void sub_18917D600(_WORD *a1@<X8>)
{
  *a1 = 13;
}

void sub_18917D60C(_WORD *a1@<X8>)
{
  *a1 = 14;
}

void sub_18917D618(_WORD *a1@<X8>)
{
  *a1 = 15;
}

void sub_18917D624(_WORD *a1@<X8>)
{
  *a1 = 16;
}

void sub_18917D630(_WORD *a1@<X8>)
{
  *a1 = 17;
}

void sub_18917D63C(_WORD *a1@<X8>)
{
  *a1 = 18;
}

void sub_18917D648(_WORD *a1@<X8>)
{
  *a1 = 19;
}

void sub_18917D654(_WORD *a1@<X8>)
{
  *a1 = 20;
}

void sub_18917D660(_WORD *a1@<X8>)
{
  *a1 = 21;
}

void sub_18917D66C(_WORD *a1@<X8>)
{
  *a1 = 22;
}

void sub_18917D678(_WORD *a1@<X8>)
{
  *a1 = 23;
}

void sub_18917D684(_WORD *a1@<X8>)
{
  *a1 = 24;
}

void sub_18917D690(_WORD *a1@<X8>)
{
  *a1 = 25;
}

void sub_18917D69C(_WORD *a1@<X8>)
{
  *a1 = 26;
}

void sub_18917D6A8(_WORD *a1@<X8>)
{
  *a1 = 27;
}

void sub_18917D6B4(_WORD *a1@<X8>)
{
  *a1 = 28;
}

void sub_18917D6C0(_WORD *a1@<X8>)
{
  *a1 = 29;
}

void sub_18917D6CC(_WORD *a1@<X8>)
{
  *a1 = 30;
}

void sub_18917D6D8(_WORD *a1@<X8>)
{
  *a1 = 31;
}

void sub_18917D6E4(_WORD *a1@<X8>)
{
  *a1 = 32;
}

void sub_18917D6F0(_WORD *a1@<X8>)
{
  *a1 = 33;
}

void sub_18917D6FC(_WORD *a1@<X8>)
{
  *a1 = 34;
}

void sub_18917D708(_WORD *a1@<X8>)
{
  *a1 = 35;
}

void sub_18917D714(_WORD *a1@<X8>)
{
  *a1 = 36;
}

void sub_18917D720(_WORD *a1@<X8>)
{
  *a1 = 37;
}

void sub_18917D72C(_WORD *a1@<X8>)
{
  *a1 = 38;
}

void sub_18917D738(_WORD *a1@<X8>)
{
  *a1 = 39;
}

void sub_18917D744(_WORD *a1@<X8>)
{
  *a1 = 40;
}

void sub_18917D750(_WORD *a1@<X8>)
{
  *a1 = 41;
}

void sub_18917D75C(_WORD *a1@<X8>)
{
  *a1 = 42;
}

void sub_18917D768(_WORD *a1@<X8>)
{
  *a1 = 43;
}

void sub_18917D774(_WORD *a1@<X8>)
{
  *a1 = 44;
}

void sub_18917D780(_WORD *a1@<X8>)
{
  *a1 = 45;
}

void sub_18917D78C(_WORD *a1@<X8>)
{
  *a1 = 46;
}

void sub_18917D798(_WORD *a1@<X8>)
{
  *a1 = 47;
}

void sub_18917D7A4(_WORD *a1@<X8>)
{
  *a1 = 48;
}

void sub_18917D7B0(_WORD *a1@<X8>)
{
  *a1 = 49;
}

void sub_18917D7BC(_WORD *a1@<X8>)
{
  *a1 = 50;
}

void sub_18917D7C8(_WORD *a1@<X8>)
{
  *a1 = 51;
}

void sub_18917D7D4(_WORD *a1@<X8>)
{
  *a1 = 52;
}

void sub_18917D7E0(_WORD *a1@<X8>)
{
  *a1 = 53;
}

void sub_18917D7EC(_WORD *a1@<X8>)
{
  *a1 = 54;
}

void sub_18917D7F8(_WORD *a1@<X8>)
{
  *a1 = 55;
}

void sub_18917D804(_WORD *a1@<X8>)
{
  *a1 = 56;
}

void sub_18917D810(_WORD *a1@<X8>)
{
  *a1 = 57;
}

void sub_18917D81C(_WORD *a1@<X8>)
{
  *a1 = 58;
}

void sub_18917D828(_WORD *a1@<X8>)
{
  *a1 = 59;
}

void sub_18917D834(_WORD *a1@<X8>)
{
  *a1 = 60;
}

void sub_18917D840(_WORD *a1@<X8>)
{
  *a1 = 61;
}

void sub_18917D84C(_WORD *a1@<X8>)
{
  *a1 = 62;
}

void sub_18917D858(_WORD *a1@<X8>)
{
  *a1 = 63;
}

void sub_18917D864(_WORD *a1@<X8>)
{
  *a1 = 64;
}

void sub_18917D870(_WORD *a1@<X8>)
{
  *a1 = 65;
}

void sub_18917D87C(_WORD *a1@<X8>)
{
  *a1 = 66;
}

void sub_18917D888(_WORD *a1@<X8>)
{
  *a1 = 67;
}

void sub_18917D894(_WORD *a1@<X8>)
{
  *a1 = 68;
}

void sub_18917D8A0(_WORD *a1@<X8>)
{
  *a1 = 69;
}

void sub_18917D8AC(_WORD *a1@<X8>)
{
  *a1 = 70;
}

void sub_18917D8B8(_WORD *a1@<X8>)
{
  *a1 = 71;
}

void sub_18917D8C4(_WORD *a1@<X8>)
{
  *a1 = 72;
}

void sub_18917D8D0(_WORD *a1@<X8>)
{
  *a1 = 73;
}

void sub_18917D8DC(_WORD *a1@<X8>)
{
  *a1 = 74;
}

void sub_18917D8E8(_WORD *a1@<X8>)
{
  *a1 = 75;
}

void sub_18917D8F4(_WORD *a1@<X8>)
{
  *a1 = 76;
}

void sub_18917D900(_WORD *a1@<X8>)
{
  *a1 = 77;
}

void sub_18917D90C(_WORD *a1@<X8>)
{
  *a1 = 78;
}

void sub_18917D918(_WORD *a1@<X8>)
{
  *a1 = 79;
}

void sub_18917D924(_WORD *a1@<X8>)
{
  *a1 = 80;
}

void sub_18917D930(_WORD *a1@<X8>)
{
  *a1 = 81;
}

void sub_18917D93C(_WORD *a1@<X8>)
{
  *a1 = 82;
}

void sub_18917D948(_WORD *a1@<X8>)
{
  *a1 = 83;
}

void sub_18917D954(_WORD *a1@<X8>)
{
  *a1 = 84;
}

void sub_18917D960(_WORD *a1@<X8>)
{
  *a1 = 85;
}

void sub_18917D96C(_WORD *a1@<X8>)
{
  *a1 = 86;
}

void sub_18917D978(_WORD *a1@<X8>)
{
  *a1 = 87;
}

void sub_18917D984(_WORD *a1@<X8>)
{
  *a1 = 88;
}

void sub_18917D990(_WORD *a1@<X8>)
{
  *a1 = 89;
}

void sub_18917D99C(_WORD *a1@<X8>)
{
  *a1 = 90;
}

void sub_18917D9A8(_WORD *a1@<X8>)
{
  *a1 = 91;
}

void sub_18917D9B4(_WORD *a1@<X8>)
{
  *a1 = 92;
}

void sub_18917D9C0(_WORD *a1@<X8>)
{
  *a1 = 93;
}

void sub_18917D9CC(_WORD *a1@<X8>)
{
  *a1 = 94;
}

void sub_18917D9D8(_WORD *a1@<X8>)
{
  *a1 = 95;
}

void sub_18917D9E4(_WORD *a1@<X8>)
{
  *a1 = 96;
}

void sub_18917D9F0(_WORD *a1@<X8>)
{
  *a1 = 97;
}

void sub_18917D9FC(_WORD *a1@<X8>)
{
  *a1 = 98;
}

void sub_18917DA08(_WORD *a1@<X8>)
{
  *a1 = 99;
}

void sub_18917DA14(_WORD *a1@<X8>)
{
  *a1 = 100;
}

void sub_18917DA20(_WORD *a1@<X8>)
{
  *a1 = 101;
}

void sub_18917DA2C(_WORD *a1@<X8>)
{
  *a1 = 102;
}

void sub_18917DA38(_WORD *a1@<X8>)
{
  *a1 = 103;
}

void sub_18917DA44(_WORD *a1@<X8>)
{
  *a1 = 104;
}

void sub_18917DA50(_WORD *a1@<X8>)
{
  *a1 = 105;
}

void sub_18917DA5C(_WORD *a1@<X8>)
{
  *a1 = 106;
}

void sub_18917DA68(_WORD *a1@<X8>)
{
  *a1 = 107;
}

void sub_18917DA74(_WORD *a1@<X8>)
{
  *a1 = 108;
}

void sub_18917DA80(_WORD *a1@<X8>)
{
  *a1 = 109;
}

void sub_18917DA8C(_WORD *a1@<X8>)
{
  *a1 = 110;
}

void sub_18917DA98(_WORD *a1@<X8>)
{
  *a1 = 111;
}

void sub_18917DAA4(_WORD *a1@<X8>)
{
  *a1 = 112;
}

void sub_18917DAB0(_WORD *a1@<X8>)
{
  *a1 = 113;
}

void sub_18917DABC(_WORD *a1@<X8>)
{
  *a1 = 114;
}

void sub_18917DAC8(_WORD *a1@<X8>)
{
  *a1 = 115;
}

void sub_18917DAD4(_WORD *a1@<X8>)
{
  *a1 = 116;
}

void sub_18917DAE0(_WORD *a1@<X8>)
{
  *a1 = 117;
}

void sub_18917DAEC(_WORD *a1@<X8>)
{
  *a1 = 118;
}

void sub_18917DAF8(_WORD *a1@<X8>)
{
  *a1 = 119;
}

void sub_18917DB04(_WORD *a1@<X8>)
{
  *a1 = 120;
}

void sub_18917DB10(_WORD *a1@<X8>)
{
  *a1 = 121;
}

void sub_18917DB1C(_WORD *a1@<X8>)
{
  *a1 = 122;
}

void sub_18917DB28(_WORD *a1@<X8>)
{
  *a1 = 123;
}

void sub_18917DB34(_WORD *a1@<X8>)
{
  *a1 = 124;
}

void sub_18917DB40(_WORD *a1@<X8>)
{
  *a1 = 125;
}

void sub_18917DB4C(_WORD *a1@<X8>)
{
  *a1 = 126;
}

void sub_18917DB58(_WORD *a1@<X8>)
{
  *a1 = 127;
}

void sub_18917DB64(_WORD *a1@<X8>)
{
  *a1 = 128;
}

void sub_18917DB70(_WORD *a1@<X8>)
{
  *a1 = 129;
}

void sub_18917DB7C(_WORD *a1@<X8>)
{
  *a1 = 130;
}

void sub_18917DB88(_WORD *a1@<X8>)
{
  *a1 = 131;
}

void sub_18917DB94(_WORD *a1@<X8>)
{
  *a1 = 132;
}

void sub_18917DBA0(_WORD *a1@<X8>)
{
  *a1 = 133;
}

void sub_18917DBAC(_WORD *a1@<X8>)
{
  *a1 = 134;
}

void sub_18917DBB8(_WORD *a1@<X8>)
{
  *a1 = 135;
}

void sub_18917DBC4(_WORD *a1@<X8>)
{
  *a1 = 136;
}

void sub_18917DBD0(_WORD *a1@<X8>)
{
  *a1 = 137;
}

void sub_18917DBDC(_WORD *a1@<X8>)
{
  *a1 = 138;
}

void sub_18917DBE8(_WORD *a1@<X8>)
{
  *a1 = 139;
}

void sub_18917DBF4(_WORD *a1@<X8>)
{
  *a1 = 140;
}

void sub_18917DC00(_WORD *a1@<X8>)
{
  *a1 = 141;
}

void sub_18917DC0C(_WORD *a1@<X8>)
{
  *a1 = 142;
}

void sub_18917DC18(_WORD *a1@<X8>)
{
  *a1 = 143;
}

void sub_18917DC24(_WORD *a1@<X8>)
{
  *a1 = 144;
}

void sub_18917DC30(_WORD *a1@<X8>)
{
  *a1 = 145;
}

void sub_18917DC3C(_WORD *a1@<X8>)
{
  *a1 = 146;
}

void sub_18917DC48(_WORD *a1@<X8>)
{
  *a1 = 147;
}

void sub_18917DC54(_WORD *a1@<X8>)
{
  *a1 = 148;
}

void sub_18917DC60(_WORD *a1@<X8>)
{
  *a1 = 149;
}

void sub_18917DC6C(_WORD *a1@<X8>)
{
  *a1 = 150;
}

void sub_18917DC78(_WORD *a1@<X8>)
{
  *a1 = 151;
}

void sub_18917DC84(_WORD *a1@<X8>)
{
  *a1 = 152;
}

void sub_18917DC90(_WORD *a1@<X8>)
{
  *a1 = 153;
}

void sub_18917DC9C(_WORD *a1@<X8>)
{
  *a1 = 154;
}

void sub_18917DCA8(_WORD *a1@<X8>)
{
  *a1 = 155;
}

void sub_18917DCB4(_WORD *a1@<X8>)
{
  *a1 = 156;
}

void sub_18917DCC0(_WORD *a1@<X8>)
{
  *a1 = 157;
}

void sub_18917DCCC(_WORD *a1@<X8>)
{
  *a1 = 158;
}

void sub_18917DCD8(_WORD *a1@<X8>)
{
  *a1 = 159;
}

void sub_18917DCE4(_WORD *a1@<X8>)
{
  *a1 = 160;
}

void sub_18917DCF0(_WORD *a1@<X8>)
{
  *a1 = 161;
}

void sub_18917DCFC(_WORD *a1@<X8>)
{
  *a1 = 162;
}

void sub_18917DD08(_WORD *a1@<X8>)
{
  *a1 = 163;
}

void sub_18917DD14(_WORD *a1@<X8>)
{
  *a1 = 164;
}

void sub_18917DD20(_WORD *a1@<X8>)
{
  *a1 = 176;
}

void sub_18917DD2C(_WORD *a1@<X8>)
{
  *a1 = 177;
}

void sub_18917DD38(_WORD *a1@<X8>)
{
  *a1 = 178;
}

void sub_18917DD44(_WORD *a1@<X8>)
{
  *a1 = 179;
}

void sub_18917DD50(_WORD *a1@<X8>)
{
  *a1 = 180;
}

void sub_18917DD5C(_WORD *a1@<X8>)
{
  *a1 = 181;
}

void sub_18917DD68(_WORD *a1@<X8>)
{
  *a1 = 182;
}

void sub_18917DD74(_WORD *a1@<X8>)
{
  *a1 = 183;
}

void sub_18917DD80(_WORD *a1@<X8>)
{
  *a1 = 184;
}

void sub_18917DD8C(_WORD *a1@<X8>)
{
  *a1 = 185;
}

void sub_18917DD98(_WORD *a1@<X8>)
{
  *a1 = 186;
}

void sub_18917DDA4(_WORD *a1@<X8>)
{
  *a1 = 187;
}

void sub_18917DDB0(_WORD *a1@<X8>)
{
  *a1 = 188;
}

void sub_18917DDBC(_WORD *a1@<X8>)
{
  *a1 = 189;
}

void sub_18917DDC8(_WORD *a1@<X8>)
{
  *a1 = 190;
}

void sub_18917DDD4(_WORD *a1@<X8>)
{
  *a1 = 191;
}

void sub_18917DDE0(_WORD *a1@<X8>)
{
  *a1 = 192;
}

void sub_18917DDEC(_WORD *a1@<X8>)
{
  *a1 = 193;
}

void sub_18917DDF8(_WORD *a1@<X8>)
{
  *a1 = 194;
}

void sub_18917DE04(_WORD *a1@<X8>)
{
  *a1 = 195;
}

void sub_18917DE10(_WORD *a1@<X8>)
{
  *a1 = 196;
}

void sub_18917DE1C(_WORD *a1@<X8>)
{
  *a1 = 197;
}

void sub_18917DE28(_WORD *a1@<X8>)
{
  *a1 = 198;
}

void sub_18917DE34(_WORD *a1@<X8>)
{
  *a1 = 199;
}

void sub_18917DE40(_WORD *a1@<X8>)
{
  *a1 = 200;
}

void sub_18917DE4C(_WORD *a1@<X8>)
{
  *a1 = 201;
}

void sub_18917DE58(_WORD *a1@<X8>)
{
  *a1 = 202;
}

void sub_18917DE64(_WORD *a1@<X8>)
{
  *a1 = 203;
}

void sub_18917DE70(_WORD *a1@<X8>)
{
  *a1 = 204;
}

void sub_18917DE7C(_WORD *a1@<X8>)
{
  *a1 = 205;
}

void sub_18917DE88(_WORD *a1@<X8>)
{
  *a1 = 206;
}

void sub_18917DE94(_WORD *a1@<X8>)
{
  *a1 = 207;
}

void sub_18917DEA0(_WORD *a1@<X8>)
{
  *a1 = 208;
}

void sub_18917DEAC(_WORD *a1@<X8>)
{
  *a1 = 209;
}

void sub_18917DEB8(_WORD *a1@<X8>)
{
  *a1 = 210;
}

void sub_18917DEC4(_WORD *a1@<X8>)
{
  *a1 = 211;
}

void sub_18917DED0(_WORD *a1@<X8>)
{
  *a1 = 212;
}

void sub_18917DEDC(_WORD *a1@<X8>)
{
  *a1 = 213;
}

void sub_18917DEE8(_WORD *a1@<X8>)
{
  *a1 = 214;
}

void sub_18917DEF4(_WORD *a1@<X8>)
{
  *a1 = 215;
}

void sub_18917DF00(_WORD *a1@<X8>)
{
  *a1 = 216;
}

void sub_18917DF0C(_WORD *a1@<X8>)
{
  *a1 = 217;
}

void sub_18917DF18(_WORD *a1@<X8>)
{
  *a1 = 218;
}

void sub_18917DF24(_WORD *a1@<X8>)
{
  *a1 = 219;
}

void sub_18917DF30(_WORD *a1@<X8>)
{
  *a1 = 220;
}

void sub_18917DF3C(_WORD *a1@<X8>)
{
  *a1 = 221;
}

void sub_18917DF48(_WORD *a1@<X8>)
{
  *a1 = 224;
}

void sub_18917DF54(_WORD *a1@<X8>)
{
  *a1 = 225;
}

void sub_18917DF60(_WORD *a1@<X8>)
{
  *a1 = 226;
}

void sub_18917DF6C(_WORD *a1@<X8>)
{
  *a1 = 227;
}

void sub_18917DF78(_WORD *a1@<X8>)
{
  *a1 = 228;
}

void sub_18917DF84(_WORD *a1@<X8>)
{
  *a1 = 229;
}

void sub_18917DF90(_WORD *a1@<X8>)
{
  *a1 = 230;
}

void sub_18917DF9C(_WORD *a1@<X8>)
{
  *a1 = 231;
}

uint64_t static HIDUsage.LEDUsage.page.getter()
{
  return 8LL;
}

BOOL sub_18917DFB0(char *a1, char *a2)
{
  return word_1891A5752[*a1] == word_1891A5752[*a2];
}

uint64_t sub_18917DFD4()
{
  return sub_18919AE74();
}

uint64_t sub_18917E020()
{
  return sub_18919AE5C();
}

uint64_t sub_18917E054()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::LEDUsage_optional sub_18917E09C(Swift::UInt16 *a1)
{
  return HIDUsage.LEDUsage.init(rawValue:)(*a1);
}

void sub_18917E0A4(_WORD *a1@<X8>)
{
  *a1 = word_1891A5752[*v1];
}

uint64_t static HIDUsage.ButtonUsage.page.getter()
{
  return 9LL;
}

uint64_t static HIDUsage.OrdinalUsage.page.getter()
{
  return 10LL;
}

uint64_t static HIDUsage.TelephonyDeviceUsage.page.getter()
{
  return 11LL;
}

BOOL sub_18917E0D4(char *a1, char *a2)
{
  return word_1891A5812[*a1] == word_1891A5812[*a2];
}

uint64_t sub_18917E0F8()
{
  return sub_18919AE74();
}

uint64_t sub_18917E144()
{
  return sub_18919AE5C();
}

uint64_t sub_18917E178()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::TelephonyDeviceUsage_optional sub_18917E1C0(Swift::UInt16 *a1)
{
  return HIDUsage.TelephonyDeviceUsage.init(rawValue:)(*a1);
}

void sub_18917E1C8(_WORD *a1@<X8>)
{
  *a1 = word_1891A5812[*v1];
}

uint64_t static HIDUsage.ConsumerUsage.page.getter()
{
  return 12LL;
}

BOOL sub_18917E1E8(__int16 *a1, __int16 *a2)
{
  return word_1891A58D8[*a1] == word_1891A58D8[*a2];
}

uint64_t sub_18917E20C()
{
  return sub_18919AE74();
}

uint64_t sub_18917E258()
{
  return sub_18919AE5C();
}

uint64_t sub_18917E28C()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::ConsumerUsage_optional sub_18917E2D4(Swift::UInt16 *a1)
{
  return HIDUsage.ConsumerUsage.init(rawValue:)(*a1);
}

void sub_18917E2DC(_WORD *a1@<X8>)
{
  *a1 = word_1891A58D8[*v1];
}

uint64_t static HIDUsage.DigitizersUsage.page.getter()
{
  return 13LL;
}

BOOL sub_18917E2FC(char *a1, char *a2)
{
  return word_1891A5C5C[*a1] == word_1891A5C5C[*a2];
}

uint64_t sub_18917E320()
{
  return sub_18919AE74();
}

uint64_t sub_18917E36C()
{
  return sub_18919AE5C();
}

uint64_t sub_18917E3A0()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::DigitizersUsage_optional sub_18917E3E8(Swift::UInt16 *a1)
{
  return HIDUsage.DigitizersUsage.init(rawValue:)(*a1);
}

void sub_18917E3F0(_WORD *a1@<X8>)
{
  *a1 = word_1891A5C5C[*v1];
}

uint64_t static HIDUsage.HapticsUsage.page.getter()
{
  return 14LL;
}

BOOL sub_18917E410(char *a1, char *a2)
{
  return word_1891A5D34[*a1] == word_1891A5D34[*a2];
}

uint64_t sub_18917E434()
{
  return sub_18919AE74();
}

uint64_t sub_18917E480()
{
  return sub_18919AE5C();
}

uint64_t sub_18917E4B4()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::HapticsUsage_optional sub_18917E4FC(Swift::UInt16 *a1)
{
  return HIDUsage.HapticsUsage.init(rawValue:)(*a1);
}

void sub_18917E504(_WORD *a1@<X8>)
{
  *a1 = word_1891A5D34[*v1];
}

uint64_t static HIDUsage.PhysicalInputDeviceUsage.page.getter()
{
  return 15LL;
}

BOOL sub_18917E524(char *a1, char *a2)
{
  return word_1891A5D6E[*a1] == word_1891A5D6E[*a2];
}

uint64_t sub_18917E548()
{
  return sub_18919AE74();
}

uint64_t sub_18917E594()
{
  return sub_18919AE5C();
}

uint64_t sub_18917E5C8()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::PhysicalInputDeviceUsage_optional sub_18917E610(Swift::UInt16 *a1)
{
  return HIDUsage.PhysicalInputDeviceUsage.init(rawValue:)(*a1);
}

void sub_18917E618(_WORD *a1@<X8>)
{
  *a1 = word_1891A5D6E[*v1];
}

uint64_t static HIDUsage.SOCUsage.page.getter()
{
  return 17LL;
}

CoreHID::HIDUsage::SOCUsage_optional sub_18917E640(Swift::UInt16 *a1)
{
  return HIDUsage.SOCUsage.init(rawValue:)(*a1);
}

uint64_t static HIDUsage.EyeAndHeadTrackersUsage.page.getter()
{
  return 18LL;
}

BOOL sub_18917E650(char *a1, char *a2)
{
  return word_1891A5E40[*a1] == word_1891A5E40[*a2];
}

uint64_t sub_18917E674()
{
  return sub_18919AE74();
}

uint64_t sub_18917E6C0()
{
  return sub_18919AE5C();
}

uint64_t sub_18917E6F4()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::EyeAndHeadTrackersUsage_optional sub_18917E73C(Swift::UInt16 *a1)
{
  return HIDUsage.EyeAndHeadTrackersUsage.init(rawValue:)(*a1);
}

void sub_18917E744(_WORD *a1@<X8>)
{
  *a1 = word_1891A5E40[*v1];
}

uint64_t static HIDUsage.AuxiliaryDisplayUsage.page.getter()
{
  return 20LL;
}

BOOL sub_18917E764(char *a1, char *a2)
{
  return word_1891A5E84[*a1] == word_1891A5E84[*a2];
}

uint64_t sub_18917E788()
{
  return sub_18919AE74();
}

uint64_t sub_18917E7D4()
{
  return sub_18919AE5C();
}

uint64_t sub_18917E808()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::AuxiliaryDisplayUsage_optional sub_18917E850(Swift::UInt16 *a1)
{
  return HIDUsage.AuxiliaryDisplayUsage.init(rawValue:)(*a1);
}

void sub_18917E858(_WORD *a1@<X8>)
{
  *a1 = word_1891A5E84[*v1];
}

uint64_t static HIDUsage.SensorsUsage.page.getter()
{
  return 32LL;
}

BOOL sub_18917E878(__int16 *a1, __int16 *a2)
{
  return word_1891A5F1A[*a1] == word_1891A5F1A[*a2];
}

uint64_t sub_18917E89C()
{
  return sub_18919AE74();
}

uint64_t sub_18917E8E8()
{
  return sub_18919AE5C();
}

uint64_t sub_18917E91C()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::SensorsUsage_optional sub_18917E964(Swift::UInt16 *a1)
{
  return HIDUsage.SensorsUsage.init(rawValue:)(*a1);
}

void sub_18917E96C(_WORD *a1@<X8>)
{
  *a1 = word_1891A5F1A[*v1];
}

uint64_t static HIDUsage.MedicalInstrumentUsage.page.getter()
{
  return 64LL;
}

BOOL sub_18917E98C(char *a1, char *a2)
{
  return word_1891A644C[*a1] == word_1891A644C[*a2];
}

uint64_t sub_18917E9B0()
{
  return sub_18919AE74();
}

uint64_t sub_18917E9FC()
{
  return sub_18919AE5C();
}

uint64_t sub_18917EA30()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::MedicalInstrumentUsage_optional sub_18917EA78(Swift::UInt16 *a1)
{
  return HIDUsage.MedicalInstrumentUsage.init(rawValue:)(*a1);
}

void sub_18917EA80(_WORD *a1@<X8>)
{
  *a1 = word_1891A644C[*v1];
}

uint64_t static HIDUsage.BrailleDisplayUsage.page.getter()
{
  return 65LL;
}

BOOL sub_18917EAA0(char *a1, char *a2)
{
  return word_1891A6486[*a1] == word_1891A6486[*a2];
}

uint64_t sub_18917EAC4()
{
  return sub_18919AE74();
}

uint64_t sub_18917EB10()
{
  return sub_18919AE5C();
}

uint64_t sub_18917EB44()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::BrailleDisplayUsage_optional sub_18917EB8C(Swift::UInt16 *a1)
{
  return HIDUsage.BrailleDisplayUsage.init(rawValue:)(*a1);
}

void sub_18917EB94(_WORD *a1@<X8>)
{
  *a1 = word_1891A6486[*v1];
}

uint64_t static HIDUsage.LightingAndIlluminationUsage.page.getter()
{
  return 89LL;
}

BOOL sub_18917EBB4(char *a1, char *a2)
{
  return word_1891A64DC[*a1] == word_1891A64DC[*a2];
}

uint64_t sub_18917EBD8()
{
  return sub_18919AE74();
}

uint64_t sub_18917EC24()
{
  return sub_18919AE5C();
}

uint64_t sub_18917EC58()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::LightingAndIlluminationUsage_optional sub_18917ECA0(Swift::UInt16 *a1)
{
  return HIDUsage.LightingAndIlluminationUsage.init(rawValue:)(*a1);
}

void sub_18917ECA8(_WORD *a1@<X8>)
{
  *a1 = word_1891A64DC[*v1];
}

uint64_t static HIDUsage.MonitorUsage.page.getter()
{
  return 128LL;
}

uint64_t sub_18917ECC8()
{
  return sub_18919AE74();
}

uint64_t sub_18917ED0C()
{
  return sub_18919AE5C();
}

uint64_t sub_18917ED38()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::MonitorUsage_optional sub_18917ED78(Swift::UInt16 *a1)
{
  return HIDUsage.MonitorUsage.init(rawValue:)(*a1);
}

void sub_18917ED80(_WORD *a1@<X8>)
{
  *a1 = *v1 + 1;
}

uint64_t static HIDUsage.MonitorEnumeratedUsage.page.getter()
{
  return 129LL;
}

uint64_t static HIDUsage.VESAVirtualControlsUsage.page.getter()
{
  return 130LL;
}

BOOL sub_18917EDA0(char *a1, char *a2)
{
  return word_1891A651E[*a1] == word_1891A651E[*a2];
}

uint64_t sub_18917EDC4()
{
  return sub_18919AE74();
}

uint64_t sub_18917EE10()
{
  return sub_18919AE5C();
}

uint64_t sub_18917EE44()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::VESAVirtualControlsUsage_optional sub_18917EE8C(Swift::UInt16 *a1)
{
  return HIDUsage.VESAVirtualControlsUsage.init(rawValue:)(*a1);
}

void sub_18917EE94(_WORD *a1@<X8>)
{
  *a1 = word_1891A651E[*v1];
}

uint64_t static HIDUsage.PowerUsage.page.getter()
{
  return 132LL;
}

BOOL sub_18917EEB4(char *a1, char *a2)
{
  return word_1891A6578[*a1] == word_1891A6578[*a2];
}

uint64_t sub_18917EED8()
{
  return sub_18919AE74();
}

uint64_t sub_18917EF24()
{
  return sub_18919AE5C();
}

uint64_t sub_18917EF58()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::PowerUsage_optional sub_18917EFA0(Swift::UInt16 *a1)
{
  return HIDUsage.PowerUsage.init(rawValue:)(*a1);
}

void sub_18917EFA8(_WORD *a1@<X8>)
{
  *a1 = word_1891A6578[*v1];
}

uint64_t static HIDUsage.BatterySystemUsage.page.getter()
{
  return 133LL;
}

BOOL sub_18917EFC8(char *a1, char *a2)
{
  return word_1891A6612[*a1] == word_1891A6612[*a2];
}

uint64_t sub_18917EFEC()
{
  return sub_18919AE74();
}

uint64_t sub_18917F038()
{
  return sub_18919AE5C();
}

uint64_t sub_18917F06C()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::BatterySystemUsage_optional sub_18917F0B4(Swift::UInt16 *a1)
{
  return HIDUsage.BatterySystemUsage.init(rawValue:)(*a1);
}

void sub_18917F0BC(_WORD *a1@<X8>)
{
  *a1 = word_1891A6612[*v1];
}

uint64_t static HIDUsage.BarcodeScannerUsage.page.getter()
{
  return 140LL;
}

uint64_t sub_18917F0DC(unsigned __int8 *a1)
{
  return ((uint64_t (*)())((char *)sub_18917F100 + 4 * word_1891A0898[*a1]))();
}

uint64_t sub_18917F100()
{
  return ((uint64_t (*)(void))((char *)sub_18917F720 + 4 * word_1891A0A1C[v0]))();
}

BOOL sub_18917F720@<W0>(int a1@<W8>)
{
  return a1 == 2;
}

void sub_18917FD30()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  __asm { BR              X9 }

uint64_t sub_18917FD6C()
{
  return sub_18919AE74();
}

void sub_189180390()
{
  __asm { BR              X11 }

uint64_t sub_1891803C0()
{
  return sub_18919AE5C();
}

void sub_1891809D8()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  __asm { BR              X9 }

uint64_t sub_189180A10()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::BarcodeScannerUsage_optional sub_189181034(Swift::UInt16 *a1)
{
  return HIDUsage.BarcodeScannerUsage.init(rawValue:)(*a1);
}

uint64_t sub_18918103C()
{
  return ((uint64_t (*)(void))((char *)sub_18918105C + 4 * word_1891A102C[*v0]))();
}

void sub_18918105C(_WORD *a1@<X8>)
{
  *a1 = 2;
}

void sub_189181068(_WORD *a1@<X8>)
{
  *a1 = 3;
}

void sub_189181074(_WORD *a1@<X8>)
{
  *a1 = 4;
}

void sub_189181080(_WORD *a1@<X8>)
{
  *a1 = 5;
}

void sub_18918108C(_WORD *a1@<X8>)
{
  *a1 = 16;
}

void sub_189181098(_WORD *a1@<X8>)
{
  *a1 = 17;
}

void sub_1891810A4(_WORD *a1@<X8>)
{
  *a1 = 18;
}

void sub_1891810B0(_WORD *a1@<X8>)
{
  *a1 = 19;
}

void sub_1891810BC(_WORD *a1@<X8>)
{
  *a1 = 20;
}

void sub_1891810C8(_WORD *a1@<X8>)
{
  *a1 = 21;
}

void sub_1891810D4(_WORD *a1@<X8>)
{
  *a1 = 22;
}

void sub_1891810E0(_WORD *a1@<X8>)
{
  *a1 = 23;
}

void sub_1891810EC(_WORD *a1@<X8>)
{
  *a1 = 24;
}

void sub_1891810F8(_WORD *a1@<X8>)
{
  *a1 = 25;
}

void sub_189181104(_WORD *a1@<X8>)
{
  *a1 = 26;
}

void sub_189181110(_WORD *a1@<X8>)
{
  *a1 = 27;
}

void sub_18918111C(_WORD *a1@<X8>)
{
  *a1 = 28;
}

void sub_189181128(_WORD *a1@<X8>)
{
  *a1 = 29;
}

void sub_189181134(_WORD *a1@<X8>)
{
  *a1 = 30;
}

void sub_189181140(_WORD *a1@<X8>)
{
  *a1 = 31;
}

void sub_18918114C(_WORD *a1@<X8>)
{
  *a1 = 48;
}

void sub_189181158(_WORD *a1@<X8>)
{
  *a1 = 49;
}

void sub_189181164(_WORD *a1@<X8>)
{
  *a1 = 50;
}

void sub_189181170(_WORD *a1@<X8>)
{
  *a1 = 51;
}

void sub_18918117C(_WORD *a1@<X8>)
{
  *a1 = 52;
}

void sub_189181188(_WORD *a1@<X8>)
{
  *a1 = 53;
}

void sub_189181194(_WORD *a1@<X8>)
{
  *a1 = 54;
}

void sub_1891811A0(_WORD *a1@<X8>)
{
  *a1 = 55;
}

void sub_1891811AC(_WORD *a1@<X8>)
{
  *a1 = 56;
}

void sub_1891811B8(_WORD *a1@<X8>)
{
  *a1 = 57;
}

void sub_1891811C4(_WORD *a1@<X8>)
{
  *a1 = 58;
}

void sub_1891811D0(_WORD *a1@<X8>)
{
  *a1 = 59;
}

void sub_1891811DC(_WORD *a1@<X8>)
{
  *a1 = 60;
}

void sub_1891811E8(_WORD *a1@<X8>)
{
  *a1 = 61;
}

void sub_1891811F4(_WORD *a1@<X8>)
{
  *a1 = 62;
}

void sub_189181200(_WORD *a1@<X8>)
{
  *a1 = 63;
}

void sub_18918120C(_WORD *a1@<X8>)
{
  *a1 = 64;
}

void sub_189181218(_WORD *a1@<X8>)
{
  *a1 = 65;
}

void sub_189181224(_WORD *a1@<X8>)
{
  *a1 = 66;
}

void sub_189181230(_WORD *a1@<X8>)
{
  *a1 = 67;
}

void sub_18918123C(_WORD *a1@<X8>)
{
  *a1 = 68;
}

void sub_189181248(_WORD *a1@<X8>)
{
  *a1 = 69;
}

void sub_189181254(_WORD *a1@<X8>)
{
  *a1 = 70;
}

void sub_189181260(_WORD *a1@<X8>)
{
  *a1 = 77;
}

void sub_18918126C(_WORD *a1@<X8>)
{
  *a1 = 78;
}

void sub_189181278(_WORD *a1@<X8>)
{
  *a1 = 79;
}

void sub_189181284(_WORD *a1@<X8>)
{
  *a1 = 80;
}

void sub_189181290(_WORD *a1@<X8>)
{
  *a1 = 81;
}

void sub_18918129C(_WORD *a1@<X8>)
{
  *a1 = 82;
}

void sub_1891812A8(_WORD *a1@<X8>)
{
  *a1 = 85;
}

void sub_1891812B4(_WORD *a1@<X8>)
{
  *a1 = 86;
}

void sub_1891812C0(_WORD *a1@<X8>)
{
  *a1 = 87;
}

void sub_1891812CC(_WORD *a1@<X8>)
{
  *a1 = 88;
}

void sub_1891812D8(_WORD *a1@<X8>)
{
  *a1 = 89;
}

void sub_1891812E4(_WORD *a1@<X8>)
{
  *a1 = 90;
}

void sub_1891812F0(_WORD *a1@<X8>)
{
  *a1 = 91;
}

void sub_1891812FC(_WORD *a1@<X8>)
{
  *a1 = 92;
}

void sub_189181308(_WORD *a1@<X8>)
{
  *a1 = 93;
}

void sub_189181314(_WORD *a1@<X8>)
{
  *a1 = 94;
}

void sub_189181320(_WORD *a1@<X8>)
{
  *a1 = 95;
}

void sub_18918132C(_WORD *a1@<X8>)
{
  *a1 = 96;
}

void sub_189181338(_WORD *a1@<X8>)
{
  *a1 = 97;
}

void sub_189181344(_WORD *a1@<X8>)
{
  *a1 = 98;
}

void sub_189181350(_WORD *a1@<X8>)
{
  *a1 = 99;
}

void sub_18918135C(_WORD *a1@<X8>)
{
  *a1 = 100;
}

void sub_189181368(_WORD *a1@<X8>)
{
  *a1 = 101;
}

void sub_189181374(_WORD *a1@<X8>)
{
  *a1 = 102;
}

void sub_189181380(_WORD *a1@<X8>)
{
  *a1 = 109;
}

void sub_18918138C(_WORD *a1@<X8>)
{
  *a1 = 110;
}

void sub_189181398(_WORD *a1@<X8>)
{
  *a1 = 111;
}

void sub_1891813A4(_WORD *a1@<X8>)
{
  *a1 = 112;
}

void sub_1891813B0(_WORD *a1@<X8>)
{
  *a1 = 117;
}

void sub_1891813BC(_WORD *a1@<X8>)
{
  *a1 = 118;
}

void sub_1891813C8(_WORD *a1@<X8>)
{
  *a1 = 122;
}

void sub_1891813D4(_WORD *a1@<X8>)
{
  *a1 = 123;
}

void sub_1891813E0(_WORD *a1@<X8>)
{
  *a1 = 124;
}

void sub_1891813EC(_WORD *a1@<X8>)
{
  *a1 = 125;
}

void sub_1891813F8(_WORD *a1@<X8>)
{
  *a1 = 126;
}

void sub_189181404(_WORD *a1@<X8>)
{
  *a1 = 127;
}

void sub_189181410(_WORD *a1@<X8>)
{
  *a1 = 128;
}

void sub_18918141C(_WORD *a1@<X8>)
{
  *a1 = 130;
}

void sub_189181428(_WORD *a1@<X8>)
{
  *a1 = 131;
}

void sub_189181434(_WORD *a1@<X8>)
{
  *a1 = 132;
}

void sub_189181440(_WORD *a1@<X8>)
{
  *a1 = 133;
}

void sub_18918144C(_WORD *a1@<X8>)
{
  *a1 = 134;
}

void sub_189181458(_WORD *a1@<X8>)
{
  *a1 = 135;
}

void sub_189181464(_WORD *a1@<X8>)
{
  *a1 = 136;
}

void sub_189181470(_WORD *a1@<X8>)
{
  *a1 = 137;
}

void sub_18918147C(_WORD *a1@<X8>)
{
  *a1 = 138;
}

void sub_189181488(_WORD *a1@<X8>)
{
  *a1 = 139;
}

void sub_189181494(_WORD *a1@<X8>)
{
  *a1 = 145;
}

void sub_1891814A0(_WORD *a1@<X8>)
{
  *a1 = 146;
}

void sub_1891814AC(_WORD *a1@<X8>)
{
  *a1 = 147;
}

void sub_1891814B8(_WORD *a1@<X8>)
{
  *a1 = 148;
}

void sub_1891814C4(_WORD *a1@<X8>)
{
  *a1 = 149;
}

void sub_1891814D0(_WORD *a1@<X8>)
{
  *a1 = 150;
}

void sub_1891814DC(_WORD *a1@<X8>)
{
  *a1 = 151;
}

void sub_1891814E8(_WORD *a1@<X8>)
{
  *a1 = 152;
}

void sub_1891814F4(_WORD *a1@<X8>)
{
  *a1 = 153;
}

void sub_189181500(_WORD *a1@<X8>)
{
  *a1 = 154;
}

void sub_18918150C(_WORD *a1@<X8>)
{
  *a1 = 155;
}

void sub_189181518(_WORD *a1@<X8>)
{
  *a1 = 156;
}

void sub_189181524(_WORD *a1@<X8>)
{
  *a1 = 157;
}

void sub_189181530(_WORD *a1@<X8>)
{
  *a1 = 158;
}

void sub_18918153C(_WORD *a1@<X8>)
{
  *a1 = 159;
}

void sub_189181548(_WORD *a1@<X8>)
{
  *a1 = 160;
}

void sub_189181554(_WORD *a1@<X8>)
{
  *a1 = 161;
}

void sub_189181560(_WORD *a1@<X8>)
{
  *a1 = 162;
}

void sub_18918156C(_WORD *a1@<X8>)
{
  *a1 = 169;
}

void sub_189181578(_WORD *a1@<X8>)
{
  *a1 = 170;
}

void sub_189181584(_WORD *a1@<X8>)
{
  *a1 = 171;
}

void sub_189181590(_WORD *a1@<X8>)
{
  *a1 = 172;
}

void sub_18918159C(_WORD *a1@<X8>)
{
  *a1 = 173;
}

void sub_1891815A8(_WORD *a1@<X8>)
{
  *a1 = 174;
}

void sub_1891815B4(_WORD *a1@<X8>)
{
  *a1 = 175;
}

void sub_1891815C0(_WORD *a1@<X8>)
{
  *a1 = 176;
}

void sub_1891815CC(_WORD *a1@<X8>)
{
  *a1 = 177;
}

void sub_1891815D8(_WORD *a1@<X8>)
{
  *a1 = 178;
}

void sub_1891815E4(_WORD *a1@<X8>)
{
  *a1 = 179;
}

void sub_1891815F0(_WORD *a1@<X8>)
{
  *a1 = 180;
}

void sub_1891815FC(_WORD *a1@<X8>)
{
  *a1 = 181;
}

void sub_189181608(_WORD *a1@<X8>)
{
  *a1 = 183;
}

void sub_189181614(_WORD *a1@<X8>)
{
  *a1 = 184;
}

void sub_189181620(_WORD *a1@<X8>)
{
  *a1 = 185;
}

void sub_18918162C(_WORD *a1@<X8>)
{
  *a1 = 186;
}

void sub_189181638(_WORD *a1@<X8>)
{
  *a1 = 187;
}

void sub_189181644(_WORD *a1@<X8>)
{
  *a1 = 188;
}

void sub_189181650(_WORD *a1@<X8>)
{
  *a1 = 189;
}

void sub_18918165C(_WORD *a1@<X8>)
{
  *a1 = 190;
}

void sub_189181668(_WORD *a1@<X8>)
{
  *a1 = 191;
}

void sub_189181674(_WORD *a1@<X8>)
{
  *a1 = 192;
}

void sub_189181680(_WORD *a1@<X8>)
{
  *a1 = 195;
}

void sub_18918168C(_WORD *a1@<X8>)
{
  *a1 = 196;
}

void sub_189181698(_WORD *a1@<X8>)
{
  *a1 = 199;
}

void sub_1891816A4(_WORD *a1@<X8>)
{
  *a1 = 200;
}

void sub_1891816B0(_WORD *a1@<X8>)
{
  *a1 = 201;
}

void sub_1891816BC(_WORD *a1@<X8>)
{
  *a1 = 202;
}

void sub_1891816C8(_WORD *a1@<X8>)
{
  *a1 = 203;
}

void sub_1891816D4(_WORD *a1@<X8>)
{
  *a1 = 204;
}

void sub_1891816E0(_WORD *a1@<X8>)
{
  *a1 = 205;
}

void sub_1891816EC(_WORD *a1@<X8>)
{
  *a1 = 206;
}

void sub_1891816F8(_WORD *a1@<X8>)
{
  *a1 = 211;
}

void sub_189181704(_WORD *a1@<X8>)
{
  *a1 = 212;
}

void sub_189181710(_WORD *a1@<X8>)
{
  *a1 = 213;
}

void sub_18918171C(_WORD *a1@<X8>)
{
  *a1 = 214;
}

void sub_189181728(_WORD *a1@<X8>)
{
  *a1 = 215;
}

void sub_189181734(_WORD *a1@<X8>)
{
  *a1 = 216;
}

void sub_189181740(_WORD *a1@<X8>)
{
  *a1 = 217;
}

void sub_18918174C(_WORD *a1@<X8>)
{
  *a1 = 218;
}

void sub_189181758(_WORD *a1@<X8>)
{
  *a1 = 219;
}

void sub_189181764(_WORD *a1@<X8>)
{
  *a1 = 220;
}

void sub_189181770(_WORD *a1@<X8>)
{
  *a1 = 221;
}

void sub_18918177C(_WORD *a1@<X8>)
{
  *a1 = 222;
}

void sub_189181788(_WORD *a1@<X8>)
{
  *a1 = 223;
}

void sub_189181794(_WORD *a1@<X8>)
{
  *a1 = 240;
}

void sub_1891817A0(_WORD *a1@<X8>)
{
  *a1 = 241;
}

void sub_1891817AC(_WORD *a1@<X8>)
{
  *a1 = 242;
}

void sub_1891817B8(_WORD *a1@<X8>)
{
  *a1 = 251;
}

void sub_1891817C4(_WORD *a1@<X8>)
{
  *a1 = 252;
}

void sub_1891817D0(_WORD *a1@<X8>)
{
  *a1 = 253;
}

void sub_1891817DC(_WORD *a1@<X8>)
{
  *a1 = 254;
}

void sub_1891817E8(_WORD *a1@<X8>)
{
  *a1 = 255;
}

void sub_1891817F4(_WORD *a1@<X8>)
{
  *a1 = 256;
}

void sub_189181800(_WORD *a1@<X8>)
{
  *a1 = 257;
}

void sub_18918180C(_WORD *a1@<X8>)
{
  *a1 = 258;
}

void sub_189181818(_WORD *a1@<X8>)
{
  *a1 = 259;
}

void sub_189181824(_WORD *a1@<X8>)
{
  *a1 = 260;
}

void sub_189181830(_WORD *a1@<X8>)
{
  *a1 = 262;
}

void sub_18918183C(_WORD *a1@<X8>)
{
  *a1 = 263;
}

void sub_189181848(_WORD *a1@<X8>)
{
  *a1 = 264;
}

void sub_189181854(_WORD *a1@<X8>)
{
  *a1 = 265;
}

void sub_189181860(_WORD *a1@<X8>)
{
  *a1 = 266;
}

void sub_18918186C(_WORD *a1@<X8>)
{
  *a1 = 267;
}

void sub_189181878(_WORD *a1@<X8>)
{
  *a1 = 268;
}

void sub_189181884(_WORD *a1@<X8>)
{
  *a1 = 269;
}

void sub_189181890(_WORD *a1@<X8>)
{
  *a1 = 272;
}

void sub_18918189C(_WORD *a1@<X8>)
{
  *a1 = 273;
}

void sub_1891818A8(_WORD *a1@<X8>)
{
  *a1 = 274;
}

void sub_1891818B4(_WORD *a1@<X8>)
{
  *a1 = 275;
}

void sub_1891818C0(_WORD *a1@<X8>)
{
  *a1 = 276;
}

void sub_1891818CC(_WORD *a1@<X8>)
{
  *a1 = 277;
}

void sub_1891818D8(_WORD *a1@<X8>)
{
  *a1 = 278;
}

void sub_1891818E4(_WORD *a1@<X8>)
{
  *a1 = 279;
}

void sub_1891818F0(_WORD *a1@<X8>)
{
  *a1 = 280;
}

void sub_1891818FC(_WORD *a1@<X8>)
{
  *a1 = 281;
}

void sub_189181908(_WORD *a1@<X8>)
{
  *a1 = 282;
}

void sub_189181914(_WORD *a1@<X8>)
{
  *a1 = 283;
}

void sub_189181920(_WORD *a1@<X8>)
{
  *a1 = 284;
}

void sub_18918192C(_WORD *a1@<X8>)
{
  *a1 = 285;
}

void sub_189181938(_WORD *a1@<X8>)
{
  *a1 = 286;
}

void sub_189181944(_WORD *a1@<X8>)
{
  *a1 = 287;
}

void sub_189181950(_WORD *a1@<X8>)
{
  *a1 = 288;
}

void sub_18918195C(_WORD *a1@<X8>)
{
  *a1 = 289;
}

uint64_t static HIDUsage.ScalesUsage.page.getter()
{
  return 141LL;
}

BOOL sub_189181970(char *a1, char *a2)
{
  return word_1891A66C8[*a1] == word_1891A66C8[*a2];
}

uint64_t sub_189181994()
{
  return sub_18919AE74();
}

uint64_t sub_1891819E0()
{
  return sub_18919AE5C();
}

uint64_t sub_189181A14()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::ScalesUsage_optional sub_189181A5C(Swift::UInt16 *a1)
{
  return HIDUsage.ScalesUsage.init(rawValue:)(*a1);
}

void sub_189181A64(_WORD *a1@<X8>)
{
  *a1 = word_1891A66C8[*v1];
}

uint64_t static HIDUsage.MagneticStripeReaderUsage.page.getter()
{
  return 142LL;
}

BOOL sub_189181A84(char *a1, char *a2)
{
  return word_1891A6724[*a1] == word_1891A6724[*a2];
}

uint64_t sub_189181AA8()
{
  return sub_18919AE74();
}

uint64_t sub_189181AF4()
{
  return sub_18919AE5C();
}

uint64_t sub_189181B28()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::MagneticStripeReaderUsage_optional sub_189181B70(Swift::UInt16 *a1)
{
  return HIDUsage.MagneticStripeReaderUsage.init(rawValue:)(*a1);
}

void sub_189181B78(_WORD *a1@<X8>)
{
  *a1 = word_1891A6724[*v1];
}

uint64_t static HIDUsage.CameraControlUsage.page.getter()
{
  return 144LL;
}

BOOL sub_189181B98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_189181BB0()
{
  return sub_18919AE74();
}

uint64_t sub_189181BFC()
{
  return sub_18919AE5C();
}

uint64_t sub_189181C30()
{
  return sub_18919AE74();
}

unsigned __int16 *sub_189181C78@<X0>(unsigned __int16 *result@<X0>, char *a2@<X8>)
{
  int v2 = *result;
  if (v2 == 33) {
    char v3 = 1;
  }
  else {
    char v3 = 2;
  }
  if (v2 == 32) {
    char v4 = 0;
  }
  else {
    char v4 = v3;
  }
  *a2 = v4;
  return result;
}

void sub_189181C98(__int16 *a1@<X8>)
{
  if (*v1) {
    __int16 v2 = 33;
  }
  else {
    __int16 v2 = 32;
  }
  *a1 = v2;
}

uint64_t static HIDUsage.ArcadeUsage.page.getter()
{
  return 145LL;
}

BOOL sub_189181CB8(char *a1, char *a2)
{
  return word_1891A6738[*a1] == word_1891A6738[*a2];
}

uint64_t sub_189181CDC()
{
  return sub_18919AE74();
}

uint64_t sub_189181D28()
{
  return sub_18919AE5C();
}

uint64_t sub_189181D5C()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::ArcadeUsage_optional sub_189181DA4(Swift::UInt16 *a1)
{
  return HIDUsage.ArcadeUsage.init(rawValue:)(*a1);
}

void sub_189181DAC(_WORD *a1@<X8>)
{
  *a1 = word_1891A6738[*v1];
}

uint64_t static HIDUsage.FIDOAllianceUsage.page.getter()
{
  return 61904LL;
}

BOOL sub_189181DCC(_BYTE *a1, _BYTE *a2)
{
  return (unsigned __int16)(0x2100200001uLL >> (16 * *a1)) == (unsigned __int16)(0x2100200001uLL >> (16 * *a2));
}

uint64_t sub_189181E04()
{
  return sub_18919AE74();
}

uint64_t sub_189181E58()
{
  return sub_18919AE5C();
}

uint64_t sub_189181E94()
{
  return sub_18919AE74();
}

CoreHID::HIDUsage::FIDOAllianceUsage_optional sub_189181EE4(Swift::UInt16 *a1)
{
  return HIDUsage.FIDOAllianceUsage.init(rawValue:)(*a1);
}

void sub_189181EEC(_WORD *a1@<X8>)
{
  *a1 = 0x2100200001uLL >> (16 * *v1);
}

void _s7CoreHID8HIDUsageO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X12 }

uint64_t sub_189181F58()
{
  return ((uint64_t (*)(void))((char *)sub_18918207C + 4 * byte_1891A11D2[(v0 >> 34) & 0x3F]))();
}

BOOL sub_18918207C()
{
  if (v0 != 2) {
    return 0LL;
  }
  HIDUsage.usage.getter();
  int v2 = v1;
  HIDUsage.usage.getter();
  BOOL v5 = (v3 & 0x10000) == 0 && (unsigned __int16)v2 == (unsigned __int16)v3;
  if ((v2 & 0x10000) != 0) {
    return HIWORD(v3) & 1;
  }
  else {
    return v5;
  }
}

unint64_t sub_189182280()
{
  unint64_t result = qword_18C77AA18;
  if (!qword_18C77AA18)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDUsage, &type metadata for HIDUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA18);
  }

  return result;
}

unint64_t sub_1891822C8()
{
  unint64_t result = qword_18C77AA20;
  if (!qword_18C77AA20)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.GenericDesktopUsage,  &type metadata for HIDUsage.GenericDesktopUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA20);
  }

  return result;
}

unint64_t sub_189182310()
{
  unint64_t result = qword_18C77AA28;
  if (!qword_18C77AA28)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.SimulationControlsUsage,  &type metadata for HIDUsage.SimulationControlsUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA28);
  }

  return result;
}

unint64_t sub_189182358()
{
  unint64_t result = qword_18C77AA30;
  if (!qword_18C77AA30)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.VRControlsUsage,  &type metadata for HIDUsage.VRControlsUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA30);
  }

  return result;
}

unint64_t sub_1891823A0()
{
  unint64_t result = qword_18C77AA38;
  if (!qword_18C77AA38)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.SportControlsUsage,  &type metadata for HIDUsage.SportControlsUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA38);
  }

  return result;
}

unint64_t sub_1891823E8()
{
  unint64_t result = qword_18C77AA40;
  if (!qword_18C77AA40)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.GameControlsUsage,  &type metadata for HIDUsage.GameControlsUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA40);
  }

  return result;
}

unint64_t sub_189182430()
{
  unint64_t result = qword_18C77AA48;
  if (!qword_18C77AA48)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.GenericDeviceControlsUsage,  &type metadata for HIDUsage.GenericDeviceControlsUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA48);
  }

  return result;
}

unint64_t sub_189182478()
{
  unint64_t result = qword_18C77AA50;
  if (!qword_18C77AA50)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.KeyboardOrKeypadUsage,  &type metadata for HIDUsage.KeyboardOrKeypadUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA50);
  }

  return result;
}

unint64_t sub_1891824C0()
{
  unint64_t result = qword_18C77AA58;
  if (!qword_18C77AA58)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.LEDUsage,  &type metadata for HIDUsage.LEDUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA58);
  }

  return result;
}

unint64_t sub_189182508()
{
  unint64_t result = qword_18C77AA60;
  if (!qword_18C77AA60)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.TelephonyDeviceUsage,  &type metadata for HIDUsage.TelephonyDeviceUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA60);
  }

  return result;
}

unint64_t sub_189182550()
{
  unint64_t result = qword_18C77AA68;
  if (!qword_18C77AA68)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.ConsumerUsage,  &type metadata for HIDUsage.ConsumerUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA68);
  }

  return result;
}

unint64_t sub_189182598()
{
  unint64_t result = qword_18C77AA70;
  if (!qword_18C77AA70)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.DigitizersUsage,  &type metadata for HIDUsage.DigitizersUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA70);
  }

  return result;
}

unint64_t sub_1891825E0()
{
  unint64_t result = qword_18C77AA78;
  if (!qword_18C77AA78)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.HapticsUsage,  &type metadata for HIDUsage.HapticsUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA78);
  }

  return result;
}

unint64_t sub_189182628()
{
  unint64_t result = qword_18C77AA80;
  if (!qword_18C77AA80)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.PhysicalInputDeviceUsage,  &type metadata for HIDUsage.PhysicalInputDeviceUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA80);
  }

  return result;
}

unint64_t sub_189182670()
{
  unint64_t result = qword_18C77AA88;
  if (!qword_18C77AA88)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.SOCUsage,  &type metadata for HIDUsage.SOCUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA88);
  }

  return result;
}

unint64_t sub_1891826B8()
{
  unint64_t result = qword_18C77AA90;
  if (!qword_18C77AA90)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.EyeAndHeadTrackersUsage,  &type metadata for HIDUsage.EyeAndHeadTrackersUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA90);
  }

  return result;
}

unint64_t sub_189182700()
{
  unint64_t result = qword_18C77AA98;
  if (!qword_18C77AA98)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.AuxiliaryDisplayUsage,  &type metadata for HIDUsage.AuxiliaryDisplayUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AA98);
  }

  return result;
}

unint64_t sub_189182748()
{
  unint64_t result = qword_18C77AAA0;
  if (!qword_18C77AAA0)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.SensorsUsage,  &type metadata for HIDUsage.SensorsUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAA0);
  }

  return result;
}

unint64_t sub_189182790()
{
  unint64_t result = qword_18C77AAA8;
  if (!qword_18C77AAA8)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.MedicalInstrumentUsage,  &type metadata for HIDUsage.MedicalInstrumentUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAA8);
  }

  return result;
}

unint64_t sub_1891827D8()
{
  unint64_t result = qword_18C77AAB0;
  if (!qword_18C77AAB0)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.BrailleDisplayUsage,  &type metadata for HIDUsage.BrailleDisplayUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAB0);
  }

  return result;
}

unint64_t sub_189182820()
{
  unint64_t result = qword_18C77AAB8;
  if (!qword_18C77AAB8)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.LightingAndIlluminationUsage,  &type metadata for HIDUsage.LightingAndIlluminationUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAB8);
  }

  return result;
}

unint64_t sub_189182868()
{
  unint64_t result = qword_18C77AAC0;
  if (!qword_18C77AAC0)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.MonitorUsage,  &type metadata for HIDUsage.MonitorUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAC0);
  }

  return result;
}

unint64_t sub_1891828B0()
{
  unint64_t result = qword_18C77AAC8;
  if (!qword_18C77AAC8)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.VESAVirtualControlsUsage,  &type metadata for HIDUsage.VESAVirtualControlsUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAC8);
  }

  return result;
}

unint64_t sub_1891828F8()
{
  unint64_t result = qword_18C77AAD0;
  if (!qword_18C77AAD0)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.PowerUsage,  &type metadata for HIDUsage.PowerUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAD0);
  }

  return result;
}

unint64_t sub_189182940()
{
  unint64_t result = qword_18C77AAD8;
  if (!qword_18C77AAD8)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.BatterySystemUsage,  &type metadata for HIDUsage.BatterySystemUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAD8);
  }

  return result;
}

unint64_t sub_189182988()
{
  unint64_t result = qword_18C77AAE0;
  if (!qword_18C77AAE0)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.BarcodeScannerUsage,  &type metadata for HIDUsage.BarcodeScannerUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAE0);
  }

  return result;
}

unint64_t sub_1891829D0()
{
  unint64_t result = qword_18C77AAE8;
  if (!qword_18C77AAE8)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.ScalesUsage,  &type metadata for HIDUsage.ScalesUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAE8);
  }

  return result;
}

unint64_t sub_189182A18()
{
  unint64_t result = qword_18C77AAF0;
  if (!qword_18C77AAF0)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.MagneticStripeReaderUsage,  &type metadata for HIDUsage.MagneticStripeReaderUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAF0);
  }

  return result;
}

unint64_t sub_189182A60()
{
  unint64_t result = qword_18C77AAF8;
  if (!qword_18C77AAF8)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.CameraControlUsage,  &type metadata for HIDUsage.CameraControlUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AAF8);
  }

  return result;
}

unint64_t sub_189182AA8()
{
  unint64_t result = qword_18C77AB00;
  if (!qword_18C77AB00)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.ArcadeUsage,  &type metadata for HIDUsage.ArcadeUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AB00);
  }

  return result;
}

unint64_t sub_189182AF0()
{
  unint64_t result = qword_18C77AB08;
  if (!qword_18C77AB08)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDUsage.FIDOAllianceUsage,  &type metadata for HIDUsage.FIDOAllianceUsage);
    atomic_store(result, (unint64_t *)&qword_18C77AB08);
  }

  return result;
}

uint64_t __swift_memcpy5_2(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)unint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDUsage(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x5F && *(_BYTE *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 95);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 4) >> 2) & 0xFFFFFFBF | (((*(unsigned __int8 *)(a1 + 4) >> 1) & 1) << 6)) ^ 0x7F;
  if (v3 >= 0x5E) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for HIDUsage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x5E)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)unint64_t result = a2 - 95;
    if (a3 >= 0x5F) {
      *(_BYTE *)(result + 5) = 1;
    }
  }

  else
  {
    if (a3 >= 0x5F) {
      *(_BYTE *)(result + 5) = 0;
    }
    if (a2)
    {
      *(_DWORD *)unint64_t result = 0;
      *(_BYTE *)(result + 4) = 2 * (((-a2 & 0x40) != 0) - 2 * a2);
    }
  }

  return result;
}

uint64_t sub_189182BF0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 4) >> 2;
}

uint64_t sub_189182BFC(uint64_t result)
{
  *(_BYTE *)(result + 4) &= 3u;
  return result;
}

unsigned int *sub_189182C14(unsigned int *result, uint64_t a2)
{
  *((_BYTE *)result + 4) = ((*result | ((unint64_t)*((unsigned __int8 *)result + 4) << 32)) & 0x1FFFFFFFFLL | (a2 << 34)) >> 32;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage()
{
  return &type metadata for HIDUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.GenericDesktopUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0x8F) {
    goto LABEL_17;
  }
  if (a2 + 113 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 113) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 113;
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
      return (*a1 | (v4 << 8)) - 113;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 113;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.GenericDesktopUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 113 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 113) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0x8F) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0x8E) {
    return ((uint64_t (*)(void))((char *)&loc_189182D20 + 4 * byte_1891A11F9[v4]))();
  }
  *a1 = a2 + 113;
  return ((uint64_t (*)(void))((char *)sub_189182D54 + 4 * byte_1891A11F4[v4]))();
}

uint64_t sub_189182D54(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189182D5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189182D64LL);
  }
  return result;
}

uint64_t sub_189182D70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189182D78LL);
  }
  *(_BYTE *)unint64_t result = a2 + 113;
  return result;
}

uint64_t sub_189182D7C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189182D84(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.GenericDesktopUsage()
{
  return &type metadata for HIDUsage.GenericDesktopUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.SimulationControlsUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xCE) {
    goto LABEL_17;
  }
  if (a2 + 50 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 50) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 50;
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
      return (*a1 | (v4 << 8)) - 50;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 50;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.SimulationControlsUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 50 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 50) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xCE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xCD) {
    return ((uint64_t (*)(void))((char *)&loc_189182E7C + 4 * byte_1891A1203[v4]))();
  }
  *a1 = a2 + 50;
  return ((uint64_t (*)(void))((char *)sub_189182EB0 + 4 * byte_1891A11FE[v4]))();
}

uint64_t sub_189182EB0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189182EB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189182EC0LL);
  }
  return result;
}

uint64_t sub_189182ECC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189182ED4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 50;
  return result;
}

uint64_t sub_189182ED8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189182EE0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.SimulationControlsUsage()
{
  return &type metadata for HIDUsage.SimulationControlsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.VRControlsUsage(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDUsage.VRControlsUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 11 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 11) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xF5) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF4) {
    return ((uint64_t (*)(void))((char *)&loc_189182FD8 + 4 * byte_1891A120D[v4]))();
  }
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_18918300C + 4 * byte_1891A1208[v4]))();
}

uint64_t sub_18918300C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183014(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18918301CLL);
  }
  return result;
}

uint64_t sub_189183028(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189183030LL);
  }
  *(_BYTE *)unint64_t result = a2 + 11;
  return result;
}

uint64_t sub_189183034(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18918303C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.VRControlsUsage()
{
  return &type metadata for HIDUsage.VRControlsUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.SportControlsUsage()
{
  return &type metadata for HIDUsage.SportControlsUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.GameControlsUsage()
{
  return &type metadata for HIDUsage.GameControlsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.GenericDeviceControlsUsage( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xE9) {
    goto LABEL_17;
  }
  if (a2 + 23 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 23) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 23;
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
      return (*a1 | (v4 << 8)) - 23;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 23;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.GenericDeviceControlsUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 23 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 23) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xE9) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xE8) {
    return ((uint64_t (*)(void))((char *)&loc_189183164 + 4 * byte_1891A1217[v4]))();
  }
  *a1 = a2 + 23;
  return ((uint64_t (*)(void))((char *)sub_189183198 + 4 * byte_1891A1212[v4]))();
}

uint64_t sub_189183198(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891831A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891831A8LL);
  }
  return result;
}

uint64_t sub_1891831B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891831BCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 23;
  return result;
}

uint64_t sub_1891831C0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891831C8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.GenericDeviceControlsUsage()
{
  return &type metadata for HIDUsage.GenericDeviceControlsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.KeyboardOrKeypadUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0x27) {
    goto LABEL_17;
  }
  if (a2 + 217 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 217) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 217;
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
      return (*a1 | (v4 << 8)) - 217;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 217;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.KeyboardOrKeypadUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 217 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 217) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0x27) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0x26) {
    return ((uint64_t (*)(void))((char *)&loc_1891832C0 + 4 * byte_1891A1221[v4]))();
  }
  *a1 = a2 - 39;
  return ((uint64_t (*)(void))((char *)sub_1891832F4 + 4 * byte_1891A121C[v4]))();
}

uint64_t sub_1891832F4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891832FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189183304LL);
  }
  return result;
}

uint64_t sub_189183310(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189183318LL);
  }
  *(_BYTE *)unint64_t result = a2 - 39;
  return result;
}

uint64_t sub_18918331C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183324(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.KeyboardOrKeypadUsage()
{
  return &type metadata for HIDUsage.KeyboardOrKeypadUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.LEDUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xA1) {
    goto LABEL_17;
  }
  if (a2 + 95 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 95) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 95;
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
      return (*a1 | (v4 << 8)) - 95;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 95;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.LEDUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 95 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 95) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xA1) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xA0) {
    return ((uint64_t (*)(void))((char *)&loc_18918341C + 4 * byte_1891A122B[v4]))();
  }
  *a1 = a2 + 95;
  return ((uint64_t (*)(void))((char *)sub_189183450 + 4 * byte_1891A1226[v4]))();
}

uint64_t sub_189183450(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183458(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189183460LL);
  }
  return result;
}

uint64_t sub_18918346C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189183474LL);
  }
  *(_BYTE *)unint64_t result = a2 + 95;
  return result;
}

uint64_t sub_189183478(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183480(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.LEDUsage()
{
  return &type metadata for HIDUsage.LEDUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.ButtonUsage()
{
  return &type metadata for HIDUsage.ButtonUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.OrdinalUsage()
{
  return &type metadata for HIDUsage.OrdinalUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.TelephonyDeviceUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0x9E) {
    goto LABEL_17;
  }
  if (a2 + 98 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 98) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 98;
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
      return (*a1 | (v4 << 8)) - 98;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 98;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.TelephonyDeviceUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 98 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 98) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0x9E) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0x9D) {
    return ((uint64_t (*)(void))((char *)&loc_189183598 + 4 * byte_1891A1235[v4]))();
  }
  *a1 = a2 + 98;
  return ((uint64_t (*)(void))((char *)sub_1891835CC + 4 * byte_1891A1230[v4]))();
}

uint64_t sub_1891835CC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891835D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891835DCLL);
  }
  return result;
}

uint64_t sub_1891835E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891835F0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 98;
  return result;
}

uint64_t sub_1891835F4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891835FC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.TelephonyDeviceUsage()
{
  return &type metadata for HIDUsage.TelephonyDeviceUsage;
}

_WORD *__swift_memcpy2_2(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDUsage.ConsumerUsage(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFE3F) {
    goto LABEL_17;
  }
  if (a2 + 449 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 449 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 449;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 449;
    }

    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 449;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.ConsumerUsage(_WORD *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 449 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 449 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE3F) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (a2 <= 0xFE3E) {
    return ((uint64_t (*)(void))((char *)&loc_189183704 + 4 * byte_1891A123F[v5]))();
  }
  *a1 = a2 + 449;
  return ((uint64_t (*)(void))((char *)sub_18918373C + 4 * byte_1891A123A[v5]))();
}

uint64_t sub_18918373C(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_189183744(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2) {
    JUMPOUT(0x18918374CLL);
  }
  return result;
}

uint64_t sub_189183758(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2) {
    JUMPOUT(0x189183760LL);
  }
  *(_WORD *)unint64_t result = a2 + 449;
  return result;
}

uint64_t sub_189183764(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_18918376C(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.ConsumerUsage()
{
  return &type metadata for HIDUsage.ConsumerUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.DigitizersUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0x95) {
    goto LABEL_17;
  }
  if (a2 + 107 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 107) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 107;
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
      return (*a1 | (v4 << 8)) - 107;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 107;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.DigitizersUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 107 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 107) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0x95) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0x94) {
    return ((uint64_t (*)(void))((char *)&loc_189183864 + 4 * byte_1891A1249[v4]))();
  }
  *a1 = a2 + 107;
  return ((uint64_t (*)(void))((char *)sub_189183898 + 4 * byte_1891A1244[v4]))();
}

uint64_t sub_189183898(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891838A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891838A8LL);
  }
  return result;
}

uint64_t sub_1891838B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891838BCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 107;
  return result;
}

uint64_t sub_1891838C0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891838C8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.DigitizersUsage()
{
  return &type metadata for HIDUsage.DigitizersUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.HapticsUsage()
{
  return &type metadata for HIDUsage.HapticsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.PhysicalInputDeviceUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0x98) {
    goto LABEL_17;
  }
  if (a2 + 104 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 104) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 104;
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
      return (*a1 | (v4 << 8)) - 104;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 104;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.PhysicalInputDeviceUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 104 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 104) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0x98) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0x97) {
    return ((uint64_t (*)(void))((char *)&loc_1891839D0 + 4 * byte_1891A1253[v4]))();
  }
  *a1 = a2 + 104;
  return ((uint64_t (*)(void))((char *)sub_189183A04 + 4 * byte_1891A124E[v4]))();
}

uint64_t sub_189183A04(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183A0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189183A14LL);
  }
  return result;
}

uint64_t sub_189183A20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189183A28LL);
  }
  *(_BYTE *)unint64_t result = a2 + 104;
  return result;
}

uint64_t sub_189183A2C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183A34(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.PhysicalInputDeviceUsage()
{
  return &type metadata for HIDUsage.PhysicalInputDeviceUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.SOCUsage()
{
  return &type metadata for HIDUsage.SOCUsage;
}

uint64_t _s7CoreHID8HIDUsageO18SportControlsUsageOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xDF) {
    goto LABEL_17;
  }
  if (a2 + 33 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 33) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 33;
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
      return (*a1 | (v4 << 8)) - 33;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 33;
    }
  }

uint64_t _s7CoreHID8HIDUsageO18SportControlsUsageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 33 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 33) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xDF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xDE) {
    return ((uint64_t (*)(void))((char *)&loc_189183B44 + 4 * byte_1891A125D[v4]))();
  }
  *a1 = a2 + 33;
  return ((uint64_t (*)(void))((char *)sub_189183B78 + 4 * byte_1891A1258[v4]))();
}

uint64_t sub_189183B78(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183B80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189183B88LL);
  }
  return result;
}

uint64_t sub_189183B94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189183B9CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 33;
  return result;
}

uint64_t sub_189183BA0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183BA8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.EyeAndHeadTrackersUsage()
{
  return &type metadata for HIDUsage.EyeAndHeadTrackersUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.AuxiliaryDisplayUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xB6) {
    goto LABEL_17;
  }
  if (a2 + 74 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 74) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 74;
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
      return (*a1 | (v4 << 8)) - 74;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 74;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.AuxiliaryDisplayUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 74 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 74) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xB6) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xB5) {
    return ((uint64_t (*)(void))((char *)&loc_189183CA0 + 4 * byte_1891A1267[v4]))();
  }
  *a1 = a2 + 74;
  return ((uint64_t (*)(void))((char *)sub_189183CD4 + 4 * byte_1891A1262[v4]))();
}

uint64_t sub_189183CD4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183CDC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189183CE4LL);
  }
  return result;
}

uint64_t sub_189183CF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189183CF8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 74;
  return result;
}

uint64_t sub_189183CFC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183D04(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.AuxiliaryDisplayUsage()
{
  return &type metadata for HIDUsage.AuxiliaryDisplayUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.SensorsUsage(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xFD68) {
    goto LABEL_17;
  }
  if (a2 + 664 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 664 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 664;
    }
  }

  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 664;
    }

    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 664;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.SensorsUsage(_WORD *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 664 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 664 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD68) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (a2 <= 0xFD67) {
    return ((uint64_t (*)(void))((char *)&loc_189183E00 + 4 * byte_1891A1271[v5]))();
  }
  *a1 = a2 + 664;
  return ((uint64_t (*)(void))((char *)sub_189183E38 + 4 * byte_1891A126C[v5]))();
}

uint64_t sub_189183E38(uint64_t result)
{
  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_189183E40(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2) {
    JUMPOUT(0x189183E48LL);
  }
  return result;
}

uint64_t sub_189183E54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2) {
    JUMPOUT(0x189183E5CLL);
  }
  *(_WORD *)unint64_t result = a2 + 664;
  return result;
}

uint64_t sub_189183E60(uint64_t result)
{
  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_189183E68(uint64_t result)
{
  *(_WORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_189183E74(unsigned __int16 *a1)
{
  return *a1;
}

_WORD *sub_189183E7C(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.SensorsUsage()
{
  return &type metadata for HIDUsage.SensorsUsage;
}

uint64_t _s7CoreHID8HIDUsageO17GameControlsUsageOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xE4) {
    goto LABEL_17;
  }
  if (a2 + 28 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 28) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 28;
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
      return (*a1 | (v4 << 8)) - 28;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 28;
    }
  }

uint64_t _s7CoreHID8HIDUsageO17GameControlsUsageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 28 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 28) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xE4) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xE3) {
    return ((uint64_t (*)(void))((char *)&loc_189183F70 + 4 * byte_1891A127B[v4]))();
  }
  *a1 = a2 + 28;
  return ((uint64_t (*)(void))((char *)sub_189183FA4 + 4 * byte_1891A1276[v4]))();
}

uint64_t sub_189183FA4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183FAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189183FB4LL);
  }
  return result;
}

uint64_t sub_189183FC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189183FC8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 28;
  return result;
}

uint64_t sub_189183FCC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189183FD4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.MedicalInstrumentUsage()
{
  return &type metadata for HIDUsage.MedicalInstrumentUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.BrailleDisplayUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xD6) {
    goto LABEL_17;
  }
  if (a2 + 42 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 42) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 42;
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
      return (*a1 | (v4 << 8)) - 42;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 42;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.BrailleDisplayUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 42 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 42) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xD6) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xD5) {
    return ((uint64_t (*)(void))((char *)&loc_1891840CC + 4 * byte_1891A1285[v4]))();
  }
  *a1 = a2 + 42;
  return ((uint64_t (*)(void))((char *)sub_189184100 + 4 * byte_1891A1280[v4]))();
}

uint64_t sub_189184100(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184108(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189184110LL);
  }
  return result;
}

uint64_t sub_18918411C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189184124LL);
  }
  *(_BYTE *)unint64_t result = a2 + 42;
  return result;
}

uint64_t sub_189184128(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184130(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.BrailleDisplayUsage()
{
  return &type metadata for HIDUsage.BrailleDisplayUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.LightingAndIlluminationUsage( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xE0) {
    goto LABEL_17;
  }
  if (a2 + 32 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 32) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 32;
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
      return (*a1 | (v4 << 8)) - 32;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 32;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.LightingAndIlluminationUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 32 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 32) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xE0) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xDF) {
    return ((uint64_t (*)(void))((char *)&loc_189184228 + 4 * byte_1891A128F[v4]))();
  }
  *a1 = a2 + 32;
  return ((uint64_t (*)(void))((char *)sub_18918425C + 4 * byte_1891A128A[v4]))();
}

uint64_t sub_18918425C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184264(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x18918426CLL);
  }
  return result;
}

uint64_t sub_189184278(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189184280LL);
  }
  *(_BYTE *)unint64_t result = a2 + 32;
  return result;
}

uint64_t sub_189184284(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18918428C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.LightingAndIlluminationUsage()
{
  return &type metadata for HIDUsage.LightingAndIlluminationUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.MonitorUsage(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDUsage.MonitorUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFC) {
    return ((uint64_t (*)(void))((char *)&loc_189184384 + 4 * byte_1891A1299[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1891843B8 + 4 * byte_1891A1294[v4]))();
}

uint64_t sub_1891843B8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891843C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891843C8LL);
  }
  return result;
}

uint64_t sub_1891843D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891843DCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1891843E0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891843E8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.MonitorUsage()
{
  return &type metadata for HIDUsage.MonitorUsage;
}

ValueMetadata *type metadata accessor for HIDUsage.MonitorEnumeratedUsage()
{
  return &type metadata for HIDUsage.MonitorEnumeratedUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.VESAVirtualControlsUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xD4) {
    goto LABEL_17;
  }
  if (a2 + 44 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 44) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 44;
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
      return (*a1 | (v4 << 8)) - 44;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 44;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.VESAVirtualControlsUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 44 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 44) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xD4) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xD3) {
    return ((uint64_t (*)(void))((char *)&loc_1891844F0 + 4 * byte_1891A12A3[v4]))();
  }
  *a1 = a2 + 44;
  return ((uint64_t (*)(void))((char *)sub_189184524 + 4 * byte_1891A129E[v4]))();
}

uint64_t sub_189184524(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18918452C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189184534LL);
  }
  return result;
}

uint64_t sub_189184540(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189184548LL);
  }
  *(_BYTE *)unint64_t result = a2 + 44;
  return result;
}

uint64_t sub_18918454C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184554(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.VESAVirtualControlsUsage()
{
  return &type metadata for HIDUsage.VESAVirtualControlsUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.PowerUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xB4) {
    goto LABEL_17;
  }
  if (a2 + 76 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 76) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 76;
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
      return (*a1 | (v4 << 8)) - 76;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 76;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.PowerUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 76 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 76) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xB4) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xB3) {
    return ((uint64_t (*)(void))((char *)&loc_18918464C + 4 * byte_1891A12AD[v4]))();
  }
  *a1 = a2 + 76;
  return ((uint64_t (*)(void))((char *)sub_189184680 + 4 * byte_1891A12A8[v4]))();
}

uint64_t sub_189184680(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184688(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189184690LL);
  }
  return result;
}

uint64_t sub_18918469C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891846A4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 76;
  return result;
}

uint64_t sub_1891846A8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891846B0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.PowerUsage()
{
  return &type metadata for HIDUsage.PowerUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.BatterySystemUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xA6) {
    goto LABEL_17;
  }
  if (a2 + 90 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 90) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 90;
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
      return (*a1 | (v4 << 8)) - 90;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 90;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.BatterySystemUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 90 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 90) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xA6) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xA5) {
    return ((uint64_t (*)(void))((char *)&loc_1891847A8 + 4 * byte_1891A12B7[v4]))();
  }
  *a1 = a2 + 90;
  return ((uint64_t (*)(void))((char *)sub_1891847DC + 4 * byte_1891A12B2[v4]))();
}

uint64_t sub_1891847DC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891847E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891847ECLL);
  }
  return result;
}

uint64_t sub_1891847F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189184800LL);
  }
  *(_BYTE *)unint64_t result = a2 + 90;
  return result;
}

uint64_t sub_189184804(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18918480C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.BatterySystemUsage()
{
  return &type metadata for HIDUsage.BatterySystemUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.BarcodeScannerUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0x3F) {
    goto LABEL_17;
  }
  if (a2 + 193 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 193) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 193;
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
      return (*a1 | (v4 << 8)) - 193;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 193;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.BarcodeScannerUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 193 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 193) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0x3F) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0x3E) {
    return ((uint64_t (*)(void))((char *)&loc_189184904 + 4 * byte_1891A12C1[v4]))();
  }
  *a1 = a2 - 63;
  return ((uint64_t (*)(void))((char *)sub_189184938 + 4 * byte_1891A12BC[v4]))();
}

uint64_t sub_189184938(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184940(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189184948LL);
  }
  return result;
}

uint64_t sub_189184954(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x18918495CLL);
  }
  *(_BYTE *)unint64_t result = a2 - 63;
  return result;
}

uint64_t sub_189184960(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184968(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.BarcodeScannerUsage()
{
  return &type metadata for HIDUsage.BarcodeScannerUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.ScalesUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xD3) {
    goto LABEL_17;
  }
  if (a2 + 45 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 45) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 45;
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
      return (*a1 | (v4 << 8)) - 45;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 45;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.ScalesUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 45 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 45) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xD3) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xD2) {
    return ((uint64_t (*)(void))((char *)&loc_189184A60 + 4 * byte_1891A12CB[v4]))();
  }
  *a1 = a2 + 45;
  return ((uint64_t (*)(void))((char *)sub_189184A94 + 4 * byte_1891A12C6[v4]))();
}

uint64_t sub_189184A94(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184A9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189184AA4LL);
  }
  return result;
}

uint64_t sub_189184AB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189184AB8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 45;
  return result;
}

uint64_t sub_189184ABC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184AC4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.ScalesUsage()
{
  return &type metadata for HIDUsage.ScalesUsage;
}

uint64_t _s7CoreHID8HIDUsageO8SOCUsageOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s7CoreHID8HIDUsageO8SOCUsageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 9 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 9) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xF7) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF6) {
    return ((uint64_t (*)(void))((char *)&loc_189184BBC + 4 * byte_1891A12D5[v4]))();
  }
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_189184BF0 + 4 * byte_1891A12D0[v4]))();
}

uint64_t sub_189184BF0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184BF8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189184C00LL);
  }
  return result;
}

uint64_t sub_189184C0C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189184C14LL);
  }
  *(_BYTE *)unint64_t result = a2 + 9;
  return result;
}

uint64_t sub_189184C18(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184C20(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.MagneticStripeReaderUsage()
{
  return &type metadata for HIDUsage.MagneticStripeReaderUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.CameraControlUsage(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDUsage.CameraControlUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFE) {
    return ((uint64_t (*)(void))((char *)&loc_189184D18 + 4 * byte_1891A12DF[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_189184D4C + 4 * byte_1891A12DA[v4]))();
}

uint64_t sub_189184D4C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184D54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189184D5CLL);
  }
  return result;
}

uint64_t sub_189184D68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189184D70LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_189184D74(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184D7C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_189184D88(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.CameraControlUsage()
{
  return &type metadata for HIDUsage.CameraControlUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.ArcadeUsage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xE6) {
    goto LABEL_17;
  }
  if (a2 + 26 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 26) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 26;
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
      return (*a1 | (v4 << 8)) - 26;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 26;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDUsage.ArcadeUsage(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 26 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 26) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xE6) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xE5) {
    return ((uint64_t (*)(void))((char *)&loc_189184E80 + 4 * byte_1891A12E9[v4]))();
  }
  *a1 = a2 + 26;
  return ((uint64_t (*)(void))((char *)sub_189184EB4 + 4 * byte_1891A12E4[v4]))();
}

uint64_t sub_189184EB4(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184EBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189184EC4LL);
  }
  return result;
}

uint64_t sub_189184ED0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189184ED8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 26;
  return result;
}

uint64_t sub_189184EDC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189184EE4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.ArcadeUsage()
{
  return &type metadata for HIDUsage.ArcadeUsage;
}

uint64_t getEnumTagSinglePayload for HIDUsage.FIDOAllianceUsage(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for HIDUsage.FIDOAllianceUsage( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_189184FDC + 4 * byte_1891A12F3[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_189185010 + 4 * byte_1891A12EE[v4]))();
}

uint64_t sub_189185010(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_189185018(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189185020LL);
  }
  return result;
}

uint64_t sub_18918502C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x189185034LL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_189185038(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_189185040(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDUsage.FIDOAllianceUsage()
{
  return &type metadata for HIDUsage.FIDOAllianceUsage;
}

uint64_t HIDReportID.rawValue.getter()
{
  return *v0;
}

uint64_t HIDReportID.rawValue.setter(uint64_t result)
{
  _BYTE *v1 = result;
  return result;
}

uint64_t (*HIDReportID.rawValue.modify())()
{
  return nullsub_1;
}

uint64_t HIDReportID.init(rawValue:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  a2[1] = result == 0;
  return result;
}

BOOL static HIDReportID.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

void *sub_1891850C4()
{
  return &unk_1891A68BB;
}

void static HIDReportID.allReports.getter(_WORD *a1@<X8>)
{
  *a1 = -255;
}

_BYTE *sub_1891850DC@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  BOOL v2 = *result == 0;
  *a2 = *result;
  a2[1] = v2;
  return result;
}

void sub_1891850F4(_BYTE *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_189185100(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

BOOL sub_189185114(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 >= *a1;
}

BOOL sub_189185128(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 >= *a2;
}

BOOL sub_18918513C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a2 < *a1;
}

uint64_t sub_189185150()
{
  return sub_18919AE74();
}

uint64_t sub_189185194()
{
  return sub_18919AE50();
}

uint64_t sub_1891851BC()
{
  return sub_18919AE74();
}

unint64_t HIDReportID.description.getter()
{
  return 0xD000000000000014LL;
}

uint64_t sub_18918529C()
{
  return 0LL;
}

BOOL static HIDReportType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t HIDReportType.hash(into:)()
{
  return sub_18919AE44();
}

uint64_t sub_189185388@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  char v2 = (_DWORD)result == 1;
  if ((_DWORD)result == 2) {
    char v2 = 2;
  }
  *a2 = v2;
  return result;
}

uint64_t sub_1891853A8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (!a2)
  {
    __int128 v6 = xmmword_18919BCB0;
LABEL_11:
    *(_OWORD *)a3 = v6;
    return result;
  }

  uint64_t v5 = result;
  if (result == 4346709 && a2 == 0xE300000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    *(void *)a3 = 0LL;
    *(void *)(a3 + 8) = 0LL;
    return result;
  }

  if (v5 == 0x746F6F7465756C42LL && a2 == 0xE900000000000068LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A6820;
    goto LABEL_11;
  }

  if (v5 == 0xD000000000000012LL && a2 == 0x80000001891A8300LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A6810;
    goto LABEL_11;
  }

  if (v5 == 0x504341412D5442LL && a2 == 0xE700000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A6800;
    goto LABEL_11;
  }

  if (v5 == 4475201 && a2 == 0xE300000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A67F0;
    goto LABEL_11;
  }

  if (v5 == 4403785 && a2 == 0xE300000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A67E0;
    goto LABEL_11;
  }

  if (v5 == 4804691 && a2 == 0xE300000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A67D0;
    goto LABEL_11;
  }

  if (v5 == 0x6C6169726553LL && a2 == 0xE600000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A67C0;
    goto LABEL_11;
  }

  if (v5 == 5259625 && a2 == 0xE300000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A67B0;
    goto LABEL_11;
  }

  if (v5 == 0x79616C50726941LL && a2 == 0xE700000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A67A0;
    goto LABEL_11;
  }

  if (v5 == 5591123 && a2 == 0xE300000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A6790;
    goto LABEL_11;
  }

  if (v5 == 1330006342 && a2 == 0xE400000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A6780;
    goto LABEL_11;
  }

  if (v5 == 0x6C617574726956LL && a2 == 0xE700000000000000LL || (unint64_t result = sub_18919ADCC(), (result & 1) != 0))
  {
    __int128 v6 = xmmword_1891A6770;
    goto LABEL_11;
  }

  *(void *)a3 = v5;
  *(void *)(a3 + 8) = a2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_189185800(uint64_t *a1)
{
  unint64_t v1 = 0LL;
  switch(a1[1])
  {
    case 0LL:
      unint64_t v1 = 4346709LL;
      break;
    case 1LL:
      unint64_t v1 = 0x746F6F7465756C42LL;
      break;
    case 2LL:
      unint64_t v1 = 0xD000000000000012LL;
      break;
    case 3LL:
      unint64_t v1 = 0x504341412D5442LL;
      break;
    case 4LL:
      unint64_t v1 = 4475201LL;
      break;
    case 5LL:
      unint64_t v1 = 4403785LL;
      break;
    case 6LL:
      unint64_t v1 = 4804691LL;
      break;
    case 7LL:
      unint64_t v1 = 0x6C6169726553LL;
      break;
    case 8LL:
      unint64_t v1 = 5259625LL;
      break;
    case 9LL:
      unint64_t v1 = 0x79616C50726941LL;
      break;
    case 10LL:
      unint64_t v1 = 5591123LL;
      break;
    case 11LL:
      unint64_t v1 = 1330006342LL;
      break;
    case 12LL:
      unint64_t v1 = 0x6C617574726956LL;
      break;
    case 13LL:
      return v1;
    default:
      unint64_t v1 = *a1;
      sub_189160740(*a1, 0LL);
      break;
  }

  return v1;
}

uint64_t sub_189185964@<X0>(uint64_t result@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  else {
    char v3 = 0;
  }
  if ((a2 & 1) != 0) {
    char v3 = 0;
  }
  *a3 = v3;
  return result;
}

uint64_t sub_189185980(unsigned __int8 *a1)
{
  if (*a1 == 36) {
    return 0LL;
  }
  else {
    return *a1;
  }
}

uint64_t HIDDeviceError.errorDescription.getter()
{
  if (*((_BYTE *)v0 + 4) == 1) {
    return ((uint64_t (*)(unint64_t, unint64_t))((char *)&loc_1891859D4 + 4
  }
                                                                                                * byte_1891A683E[*v0]))( 0xD000000000000047LL,  0x80000001891A8690LL);
  else {
    return 0xD000000000000059LL;
  }
}

void sub_1891859FC()
{
}

void sub_189185A0C()
{
}

void sub_189185A1C()
{
}

void sub_189185A2C()
{
}

void sub_189185A3C()
{
}

void sub_189185A4C()
{
}

void sub_189185A5C()
{
}

void sub_189185A6C()
{
}

void sub_189185A78()
{
}

void sub_189185A88()
{
}

void sub_189185A98()
{
}

void sub_189185AA8()
{
}

void sub_189185AB8()
{
}

void *sub_189185AF0()
{
  return &unk_1891A68C0;
}

void *sub_189185AFC()
{
  return &unk_1891A68C4;
}

void *sub_189185B08()
{
  return &unk_1891A68C8;
}

void *sub_189185B14()
{
  return &unk_1891A68CC;
}

void *sub_189185B20()
{
  return &unk_1891A68D0;
}

void *sub_189185B2C()
{
  return &unk_1891A68D4;
}

void *sub_189185B38()
{
  return &unk_1891A68D8;
}

void *sub_189185B44()
{
  return &unk_1891A68DC;
}

void *sub_189185B50()
{
  return &unk_1891A68E0;
}

void *sub_189185B5C()
{
  return &unk_1891A68E4;
}

void *sub_189185B68()
{
  return &unk_1891A68E8;
}

void *sub_189185B74()
{
  return &unk_1891A68EC;
}

void *sub_189185B80()
{
  return &unk_1891A68F0;
}

void *sub_189185B8C()
{
  return &unk_1891A68F4;
}

void *sub_189185B98()
{
  return &unk_1891A68F8;
}

void *sub_189185BA4()
{
  return &unk_1891A68FC;
}

void *sub_189185BB0()
{
  return &unk_1891A6900;
}

uint64_t sub_189185BBC@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  switch(result)
  {
    case 0xE00002BE:
      char v2 = 0;
      uint64_t v3 = 0x100000000LL;
      break;
    case 0xE00002BF:
    case 0xE00002C0:
    case 0xE00002C3:
    case 0xE00002C4:
    case 0xE00002C6:
    case 0xE00002C8:
    case 0xE00002C9:
    case 0xE00002CB:
    case 0xE00002CC:
    case 0xE00002CD:
    case 0xE00002CE:
    case 0xE00002CF:
    case 0xE00002D0:
    case 0xE00002D1:
    case 0xE00002D2:
    case 0xE00002D3:
    case 0xE00002D4:
    case 0xE00002D7:
    case 0xE00002D9:
    case 0xE00002DA:
    case 0xE00002DB:
    case 0xE00002DC:
    case 0xE00002DD:
    case 0xE00002DE:
    case 0xE00002DF:
    case 0xE00002E0:
    case 0xE00002E4:
    case 0xE00002E5:
    case 0xE00002E6:
    case 0xE00002E7:
    case 0xE00002E8:
    case 0xE00002EA:
    case 0xE00002EC:
      goto LABEL_5;
    case 0xE00002C1:
      char v2 = 0;
      uint64_t v3 = 0x100000001LL;
      break;
    case 0xE00002C2:
      char v2 = 0;
      uint64_t v3 = 0x100000002LL;
      break;
    case 0xE00002C5:
      char v2 = 0;
      uint64_t v3 = 0x100000003LL;
      break;
    case 0xE00002C7:
      char v2 = 0;
      uint64_t v3 = 0x100000004LL;
      break;
    case 0xE00002CA:
      char v2 = 0;
      uint64_t v3 = 0x100000005LL;
      break;
    case 0xE00002D5:
      char v2 = 0;
      uint64_t v3 = 0x100000006LL;
      break;
    case 0xE00002D6:
      char v2 = 0;
      uint64_t v4 = 5LL;
      goto LABEL_17;
    case 0xE00002D8:
      char v2 = 0;
      uint64_t v3 = 0x100000008LL;
      break;
    case 0xE00002E1:
      char v2 = 0;
      uint64_t v3 = 0x100000009LL;
      break;
    case 0xE00002E2:
      char v2 = 0;
      uint64_t v3 = 0x10000000ALL;
      break;
    case 0xE00002E3:
      char v2 = 0;
      uint64_t v4 = 9LL;
LABEL_17:
      uint64_t v3 = v4 | 0x100000002LL;
      break;
    case 0xE00002E9:
      char v2 = 0;
      uint64_t v3 = 0x10000000CLL;
      break;
    case 0xE00002EB:
      char v2 = 0;
      uint64_t v3 = 0x10000000DLL;
      break;
    case 0xE00002ED:
      char v2 = 0;
      uint64_t v3 = 0x10000000ELL;
      break;
    default:
      if ((_DWORD)result)
      {
LABEL_5:
        char v2 = 0;
        uint64_t v3 = result;
      }

      else
      {
        uint64_t v3 = 0LL;
        char v2 = 1;
      }

      break;
  }

  *(_DWORD *)a2 = v3;
  *(_BYTE *)(a2 + 4) = BYTE4(v3);
  *(_BYTE *)(a2 + 5) = v2;
  return result;
}

uint64_t sub_189185D28(void *a1)
{
  id v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(qword_18C77A970);
  uint64_t result = v3;
  if ((v4 & 1) != 0) {
    return dword_1891A6D7C[v3];
  }
  return result;
}

uint64_t sub_189185D98()
{
  uint64_t result = swift_slowAlloc();
  qword_18C77FF50 = result;
  return result;
}

uint64_t *sub_189185DBC()
{
  if (qword_18C77EE80 != -1) {
    swift_once();
  }
  return &qword_18C77FF50;
}

uint64_t sub_189185DFC()
{
  if (qword_18C77EE80 != -1) {
    swift_once();
  }
  return qword_18C77FF50;
}

unint64_t sub_189185E3C()
{
  if (qword_18C77EE80 != -1) {
    swift_once();
  }
  int v0 = (unsigned int *)qword_18C77FF50;
  mach_timebase_info((mach_timebase_info_t)qword_18C77FF50);
  unint64_t v2 = *v0;
  unint64_t v1 = v0[1];
  unint64_t result = sub_18919AE98();
  if (!is_mul_ok(result, 0x3B9ACA00uLL))
  {
    __break(1u);
    goto LABEL_10;
  }

  if (((result | v4) & 0x8000000000000000LL) != 0)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }

  unint64_t v5 = 1000000000 * result + v4 / 0x3B9ACA00;
  if (__CFADD__(1000000000 * result, v4 / 0x3B9ACA00))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }

  if (!is_mul_ok(v5, v1))
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  if ((_DWORD)v2) {
    return v5 * v1 / v2;
  }
LABEL_13:
  __break(1u);
  return result;
}

unint64_t sub_189185EF8@<X0>(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  if (qword_18C77EE80 != -1) {
    swift_once();
  }
  unint64_t v4 = (unsigned int *)qword_18C77FF50;
  unint64_t result = mach_timebase_info((mach_timebase_info_t)qword_18C77FF50);
  if (!is_mul_ok(a1, *v4))
  {
    __break(1u);
    goto LABEL_11;
  }

  unint64_t v6 = v4[1];
  if (!(_DWORD)v6)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  unint64_t v7 = a1 * *v4 / v6;
  unint64_t result = v7 / 0x3B9ACA00;
  BOOL v8 = v7 >= 1000000000 * (v7 / 0x3B9ACA00);
  unint64_t v9 = v7 % 0x3B9ACA00;
  if (!v8) {
    goto LABEL_12;
  }
  if (!is_mul_ok(v9, 0x3B9ACA00uLL))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  if (((1000000000 * v9) & 0x8000000000000000LL) == 0)
  {
    unint64_t result = sub_18919AEA4();
    *a2 = result;
    a2[1] = v10;
    return result;
  }

LABEL_14:
  __break(1u);
  return result;
}

  __break(1u);
}

uint64_t sub_189185FE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 16) - 8LL) + 16LL))(a2, v2);
}

uint64_t sub_189185FFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 32LL))(a3, a1);
}

unint64_t sub_189186014(unint64_t result)
{
  if (HIDWORD(result)) {
    __break(1u);
  }
  return result;
}

uint64_t _s7CoreHID18HIDDeviceTransportO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  unint64_t v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5) {
        goto LABEL_34;
      }
      unint64_t v3 = 0LL;
      char v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1) {
        goto LABEL_34;
      }
      unint64_t v3 = 1LL;
      char v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 2LL;
      break;
    case 3uLL:
      if (v5 != 3) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 3LL;
      break;
    case 4uLL:
      if (v5 != 4) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 4LL;
      break;
    case 5uLL:
      if (v5 != 5) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 5LL;
      break;
    case 6uLL:
      if (v5 != 6) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 6LL;
      break;
    case 7uLL:
      if (v5 != 7) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 7LL;
      break;
    case 8uLL:
      if (v5 != 8) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 8LL;
      break;
    case 9uLL:
      if (v5 != 9) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 9LL;
      break;
    case 0xAuLL:
      if (v5 != 10) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 10LL;
      break;
    case 0xBuLL:
      if (v5 != 11) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 11LL;
      break;
    case 0xCuLL:
      if (v5 != 12) {
        goto LABEL_34;
      }
      char v6 = 1;
      unint64_t v3 = 12LL;
      break;
    default:
      if (v5 < 0xD)
      {
LABEL_34:
        char v6 = 0;
      }

      else if (v2 == v4 && v3 == v5)
      {
        char v6 = 1;
      }

      else
      {
        char v6 = sub_18919ADCC();
      }

      sub_189160740(v4, v5);
      sub_189160740(v2, v3);
      break;
  }

  sub_189160BB8(v2, v3);
  sub_189160BB8(v4, v5);
  return v6 & 1;
}

uint64_t _s7CoreHID14HIDDeviceErrorO2eeoiySbAC_ACtFZ_0(unsigned int *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*((_BYTE *)a1 + 4) == 1) {
    return ((uint64_t (*)(void))((char *)&loc_189186218 + 4 * byte_1891A688A[v2]))();
  }
  if ((*(_BYTE *)(a2 + 4) & 1) != 0) {
    return 0LL;
  }
  return (_DWORD)v2 == *(_DWORD *)a2;
}

uint64_t sub_189186244@<X0>(char a1@<W8>)
{
  if (v1 != 1) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_189186258@<X0>(char a1@<W8>)
{
  if (v1 != 2) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_18918626C@<X0>(char a1@<W8>)
{
  if (v1 != 3) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_189186280@<X0>(char a1@<W8>)
{
  if (v1 != 4) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_189186294@<X0>(char a1@<W8>)
{
  if (v1 != 5) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_1891862A8@<X0>(char a1@<W8>)
{
  if (v1 != 6) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_1891862BC@<X0>(char a1@<W8>)
{
  if (v1 != 7) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_1891862D0@<X0>(char a1@<W8>)
{
  if (v1 != 9) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_1891862E4@<X0>(char a1@<W8>)
{
  if (v1 != 10) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_1891862F8@<X0>(char a1@<W8>)
{
  if (v1 != 11) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_18918630C@<X0>(char a1@<W8>)
{
  if (v1 != 12) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_189186320@<X0>(char a1@<W8>)
{
  if (v1 != 13) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_189186334@<X0>(char a1@<W8>)
{
  if (v1 <= 0xD) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

uint64_t sub_189186348@<X0>(char a1@<W8>)
{
  if (v1 != 8) {
    a1 = 0;
  }
  if ((a1 & 1) == 0) {
    JUMPOUT(0x189186230LL);
  }
  return 1LL;
}

unint64_t sub_189186360()
{
  unint64_t result = qword_18C77AB10;
  if (!qword_18C77AB10)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDReportID, &type metadata for HIDReportID);
    atomic_store(result, (unint64_t *)&qword_18C77AB10);
  }

  return result;
}

unint64_t sub_1891863A8()
{
  unint64_t result = qword_18C77AB18;
  if (!qword_18C77AB18)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDReportType, &type metadata for HIDReportType);
    atomic_store(result, (unint64_t *)&qword_18C77AB18);
  }

  return result;
}

unint64_t sub_1891863F0()
{
  unint64_t result = qword_18C77AB20;
  if (!qword_18C77AB20)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDDeviceLocalizationCode,  &type metadata for HIDDeviceLocalizationCode);
    atomic_store(result, (unint64_t *)&qword_18C77AB20);
  }

  return result;
}

ValueMetadata *type metadata accessor for HIDReportID()
{
  return &type metadata for HIDReportID;
}

uint64_t storeEnumTagSinglePayload for HIDReportType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xFD) {
    return ((uint64_t (*)(void))((char *)&loc_189186494 + 4 * byte_1891A689E[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1891864C8 + 4 * byte_1891A6899[v4]))();
}

uint64_t sub_1891864C8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891864D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1891864D8LL);
  }
  return result;
}

uint64_t sub_1891864E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891864ECLL);
  }
  *(_BYTE *)unint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1891864F0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891864F8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDReportType()
{
  return &type metadata for HIDReportType;
}

unint64_t destroy for HIDDeviceTransport(uint64_t a1)
{
  unint64_t result = *(void *)(a1 + 8);
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s7CoreHID18HIDDeviceTransportOwCP_0(uint64_t a1, uint64_t a2)
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
    swift_bridgeObjectRetain();
  }

  return a1;
}

void *assignWithCopy for HIDDeviceTransport(void *a1, void *a2)
{
  unint64_t v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }

LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }

  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for HIDDeviceTransport(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 8) < 0xFFFFFFFFuLL) {
    goto LABEL_5;
  }
  unint64_t v4 = *(void *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }

  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceTransport(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 > 0x7FFFFFF2 && *(_BYTE *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 2147483635);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 12;
  if (v4 >= 0xE) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for HIDDeviceTransport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFF3)
  {
    *(void *)__n128 result = 0LL;
    *(void *)(result + 8) = 0LL;
    *(_DWORD *)__n128 result = a2 - 2147483635;
    if (a3 >= 0x7FFFFFF3) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFF3) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2 + 12;
    }
  }

  return result;
}

uint64_t sub_18918672C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_189186744(void *result, int a2)
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

ValueMetadata *type metadata accessor for HIDDeviceTransport()
{
  return &type metadata for HIDDeviceTransport;
}

uint64_t getEnumTagSinglePayload for HIDDeviceLocalizationCode(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xDD) {
    goto LABEL_17;
  }
  if (a2 + 35 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 35) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 35;
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
      return (*a1 | (v4 << 8)) - 35;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 35;
    }
  }

uint64_t storeEnumTagSinglePayload for HIDDeviceLocalizationCode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 35 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 35) >> 8 < 0xFF) {
    LODWORD(sub_18915EC78(v3, v4) = 1;
  }
  else {
    LODWORD(sub_18915EC78(v3, v4) = v3;
  }
  if (a3 >= 0xDD) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xDC) {
    return ((uint64_t (*)(void))((char *)&loc_189186850 + 4 * byte_1891A68A8[v4]))();
  }
  *a1 = a2 + 35;
  return ((uint64_t (*)(void))((char *)sub_189186884 + 4 * byte_1891A68A3[v4]))();
}

uint64_t sub_189186884(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18918688C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x189186894LL);
  }
  return result;
}

uint64_t sub_1891868A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1891868A8LL);
  }
  *(_BYTE *)__n128 result = a2 + 35;
  return result;
}

uint64_t sub_1891868AC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1891868B4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceLocalizationCode()
{
  return &type metadata for HIDDeviceLocalizationCode;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)__n128 result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for HIDDeviceError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for HIDDeviceError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
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

  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_189186930(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_18918694C(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)__n128 result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }

  else
  {
    *(_BYTE *)(result + 4) = 0;
  }

  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceError()
{
  return &type metadata for HIDDeviceError;
}

uint64_t sub_18918697C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_189186984()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *sub_1891869F0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  uint64_t v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(void *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }

  else
  {
    uint64_t v8 = *a2;
    *char v3 = *a2;
    char v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }

  return v3;
}

uint64_t sub_189186A60(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a2 + 16) - 8LL) + 8LL))();
}

uint64_t sub_189186A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_189186AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_189186AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_189186B00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1;
}

uint64_t sub_189186B30(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = a2 - v5;
  if (a2 <= v5) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)(a1 + v7);
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7)) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 < 2)
    {
LABEL_18:
      if (v5) {
        return (*(uint64_t (**)(void))(v4 + 48))();
      }
      return 0LL;
    }
  }

  int v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7)) {
    goto LABEL_18;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if (!(_DWORD)v7) {
    return v5 + v11 + 1;
  }
  return ((uint64_t (*)(void))((char *)&loc_189186BE0 + 4 * byte_1891A68AD[(v7 - 1)]))();
}

void sub_189186C30(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8LL);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  BOOL v9 = a3 >= v7;
  unsigned int v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      unsigned int v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        unsigned int v11 = 4u;
      }

      else if (v13 >= 0x100)
      {
        unsigned int v11 = 2;
      }

      else
      {
        unsigned int v11 = v13 > 1;
      }
    }

    else
    {
      unsigned int v11 = 1u;
    }
  }

  else
  {
    unsigned int v11 = 0u;
  }

  if (v7 < a2)
  {
    unsigned int v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }

        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }

        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }

    else
    {
      bzero(a1, *(void *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X11 }

uint64_t type metadata accessor for IOHIDObjectWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IOHIDObjectWrapper);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895E1E80](a1, v6, a5);
}

uint64_t HIDDeviceClient.DeviceReference.deviceID.getter()
{
  return *(void *)v0;
}

uint64_t sub_189186E2C@<X0>(io_registry_entry_t a1@<W0>, uint64_t a2@<X8>)
{
  v5[1] = *MEMORY[0x1895F89C0];
  v5[0] = 0LL;
  uint64_t result = IORegistryEntryGetRegistryEntryID(a1, v5);
  if ((_DWORD)result) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = v5[0];
  }
  *(void *)a2 = v4;
  *(_BYTE *)(a2 + 8) = (_DWORD)result != 0;
  return result;
}

uint64_t HIDDeviceClient.DeviceReference.hash(into:)()
{
  return sub_18919AE68();
}

BOOL static HIDDeviceClient.DeviceReference.== infix(_:_:)(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t HIDDeviceClient.DeviceReference.hashValue.getter()
{
  return sub_18919AE74();
}

uint64_t sub_189186F28()
{
  return sub_18919AE74();
}

uint64_t sub_189186F6C()
{
  return sub_18919AE68();
}

uint64_t sub_189186F94()
{
  return sub_18919AE74();
}

BOOL sub_189186FD4(void *a1, void *a2)
{
  return *a1 == *a2;
}

void HIDDeviceClient.deviceReference.getter(void *a1@<X8>)
{
  *a1 = *(void *)(v1 + 112);
}

uint64_t sub_189186FF4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 320LL))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_189187024(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 120);
  unint64_t v6 = *(void *)(*a2 + 128);
  *(void *)(v4 + 120) = *a1;
  *(void *)(v4 + 128) = v3;
  sub_18915EC34(v2, v3);
  return sub_189187144(v5, v6);
}

void *sub_189187060()
{
  uint64_t v1 = v0[15];
  unint64_t v2 = v0[16];
  uint64_t v3 = v1;
  if (v2 >> 60 != 15) {
    goto LABEL_4;
  }
  uint64_t result = (*(void *(**)(void *__return_ptr, unint64_t, unint64_t))(*v0 + 848LL))( v9,  0xD000000000000010LL,  0x80000001891A7E50LL);
  if (v9[0])
  {
    v9[1] = v9[0];
    swift_dynamicCast();
    uint64_t v3 = v7;
    uint64_t v5 = v0[15];
    unint64_t v6 = v0[16];
    v0[15] = v7;
    v0[16] = v8;
    sub_18915EC34(v7, v8);
    sub_189187144(v5, v6);
LABEL_4:
    sub_189187158(v1, v2);
    return (void *)v3;
  }

  __break(1u);
  return result;
}

uint64_t sub_189187144(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_18915EC78(a1, a2);
  }
  return a1;
}

uint64_t sub_189187158(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_18915EC34(a1, a2);
  }
  return a1;
}

uint64_t sub_18918716C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 120);
  unint64_t v4 = *(void *)(v2 + 128);
  *(void *)(v2 + 120) = a1;
  *(void *)(v2 + 128) = a2;
  return sub_189187144(v3, v4);
}

uint64_t sub_189187180()
{
  return 0LL;
}

void HIDDeviceClient.primaryUsage.getter(uint64_t a1@<X8>)
{
  int v2 = *(_DWORD *)(v1 + 136);
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(v1 + 140);
  *(_DWORD *)a1 = v2;
}

uint64_t sub_1891871A0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 344LL))();
  *a2 = result;
  return result;
}

uint64_t sub_1891871D0(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 144LL) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

unint64_t sub_189187200()
{
  if (v0[18])
  {
    unint64_t v1 = v0[18];
LABEL_20:
    swift_bridgeObjectRetain();
    return v1;
  }

  int v2 = v0;
  unint64_t result = (unint64_t)(*(void *(**)(uint64_t *__return_ptr, unint64_t, unint64_t))(*v0 + 848LL))( &v19,  0xD000000000000010LL,  0x80000001891A8140LL);
  if (v19)
  {
    uint64_t v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B3C0);
    unint64_t result = swift_dynamicCast();
    uint64_t v4 = *(void *)(v18 + 16);
    if (!v4)
    {
      unint64_t v1 = MEMORY[0x18961AFE8];
LABEL_19:
      swift_bridgeObjectRelease();
      v2[18] = v1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }

    uint64_t v5 = (uint64_t *)(v18 + 32);
    unint64_t v1 = MEMORY[0x18961AFE8];
    while (1)
    {
      uint64_t v6 = *v5;
      if (!*(void *)(*v5 + 16)) {
        break;
      }
      swift_bridgeObjectRetain();
      unint64_t result = sub_189163EC4(0x7355656369766544LL, 0xEF65676150656761LL);
      if ((v7 & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v8 = *(unsigned __int16 *)(*(void *)(v6 + 56) + 2 * result);
      if (*(void *)(v6 + 16) && (unint64_t v9 = sub_189163EC4(0x7355656369766544LL, 0xEB00000000656761LL), (v10 & 1) != 0))
      {
        int v11 = 0;
        int v12 = *(unsigned __int16 *)(*(void *)(v6 + 56) + 2 * v9);
      }

      else
      {
        int v12 = 0;
        int v11 = 1;
      }

      swift_bridgeObjectRelease();
      HIDUsage.init(page:usage:)(v12 | (v11 << 16), v8, (uint64_t)&v20);
      uint64_t v13 = BYTE4(v20);
      uint64_t v14 = v20;
      unint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        unint64_t result = (unint64_t)sub_18919557C(0LL, *(void *)(v1 + 16) + 1LL, 1, (char *)v1);
        unint64_t v1 = result;
      }

      unint64_t v16 = *(void *)(v1 + 16);
      unint64_t v15 = *(void *)(v1 + 24);
      if (v16 >= v15 >> 1)
      {
        unint64_t result = (unint64_t)sub_18919557C((char *)(v15 > 1), v16 + 1, 1, (char *)v1);
        unint64_t v1 = result;
      }

      *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v16 + 1;
      unint64_t v17 = v1 + 6 * v16;
      *(_BYTE *)(v17 + 36) = (v14 | (unint64_t)(v13 << 32)) >> 32;
      *(_DWORD *)(v17 + 32) = v14;
      ++v5;
      if (!--v4) {
        goto LABEL_19;
      }
    }

    __break(1u);
LABEL_22:
    __break(1u);
  }

  __break(1u);
  return result;
}

uint64_t sub_18918743C(uint64_t a1)
{
  *(void *)(v1 + 144) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t HIDDeviceClient.vendorID.getter()
{
  return *(unsigned int *)(v0 + 152);
}

uint64_t HIDDeviceClient.productID.getter()
{
  return *(unsigned int *)(v0 + 156);
}

double sub_18918745C@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  (*(void (**)(__int128 *__return_ptr))(**(void **)a1 + 368LL))(&v4);
  double result = *(double *)&v4;
  *a2 = v4;
  return result;
}

uint64_t sub_18918749C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 160);
  unint64_t v6 = *(void *)(*a2 + 168);
  *(void *)(v4 + 160) = *a1;
  *(void *)(v4 + 168) = v3;
  sub_189160730(v2, v3);
  return sub_1891875E4(v5, v6);
}

uint64_t sub_1891874D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = v1[20];
  unint64_t v4 = v1[21];
  uint64_t v5 = v3;
  unint64_t v6 = v4;
  if (v4 == 14)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*v1 + 848LL))( &v14,  0x726F70736E617254LL,  0xE900000000000074LL);
    if (v14)
    {
      uint64_t v16 = v14;
      int v7 = swift_dynamicCast();
      BOOL v8 = v7 == 0;
      if (v7) {
        uint64_t v9 = v14;
      }
      else {
        uint64_t v9 = 0LL;
      }
      if (v8) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = v15;
      }
    }

    else
    {
      uint64_t v9 = 0LL;
      uint64_t v10 = 0LL;
    }

    sub_1891853A8(v9, v10, (uint64_t)&v14);
    swift_bridgeObjectRelease();
    uint64_t v5 = v14;
    unint64_t v6 = v15;
    uint64_t v11 = v1[20];
    unint64_t v12 = v1[21];
    v1[20] = v14;
    v1[21] = v6;
    sub_189160730(v5, v6);
    sub_1891875E4(v11, v12);
  }

  *a1 = v5;
  a1[1] = v6;
  return sub_1891875F4(v3, v4);
}

uint64_t sub_1891875E4(uint64_t a1, unint64_t a2)
{
  if (a2 != 14) {
    return sub_189160BA8(a1, a2);
  }
  return a1;
}

uint64_t sub_1891875F4(uint64_t a1, unint64_t a2)
{
  if (a2 != 14) {
    return sub_189160730(a1, a2);
  }
  return a1;
}

uint64_t sub_189187604(_OWORD *a1)
{
  uint64_t v3 = *(void *)(v1 + 160);
  unint64_t v2 = *(void *)(v1 + 168);
  *(_OWORD *)(v1 + 160) = *a1;
  return sub_1891875E4(v3, v2);
}

double sub_189187618@<D0>(_OWORD *a1@<X8>)
{
  double result = 0.0;
  *a1 = xmmword_1891A6DC0;
  return result;
}

uint64_t sub_189187628@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 392LL))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_189187658(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 176);
  uint64_t v6 = *(void *)(*a2 + 184);
  *(void *)(v4 + 176) = v3;
  *(void *)(v4 + 184) = v2;
  swift_bridgeObjectRetain();
  return sub_189187778(v5, v6);
}

uint64_t sub_18918768C()
{
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[23];
  uint64_t v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(void *__return_ptr, uint64_t, unint64_t))(*v0 + 848LL))( v9,  0x746375646F7250LL,  0xE700000000000000LL);
    if (v9[0])
    {
      void v9[2] = v9[0];
      int v4 = swift_dynamicCast();
      if (v4) {
        uint64_t v3 = v9[0];
      }
      else {
        uint64_t v3 = 0LL;
      }
      if (v4) {
        uint64_t v5 = v9[1];
      }
      else {
        uint64_t v5 = 0LL;
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      uint64_t v5 = 0LL;
    }

    uint64_t v6 = v0[22];
    uint64_t v7 = v0[23];
    v0[22] = v3;
    v0[23] = v5;
    swift_bridgeObjectRetain();
    sub_189187778(v6, v7);
  }

  sub_18918778C(v1, v2);
  return v3;
}

uint64_t sub_189187778(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_18918778C(uint64_t a1, uint64_t a2)
{
  if (a2 != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1891877A0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 176);
  uint64_t v4 = *(void *)(v2 + 184);
  *(void *)(v2 + 176) = a1;
  *(void *)(v2 + 184) = a2;
  return sub_189187778(v3, v4);
}

uint64_t sub_1891877B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 416LL))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1891877E4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 192);
  uint64_t v6 = *(void *)(*a2 + 200);
  *(void *)(v4 + 192) = v3;
  *(void *)(v4 + 200) = v2;
  swift_bridgeObjectRetain();
  return sub_189187778(v5, v6);
}

uint64_t sub_189187818()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[25];
  uint64_t v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(void *__return_ptr, uint64_t, unint64_t))(*v0 + 848LL))( v9,  0x74636166756E614DLL,  0xEC00000072657275LL);
    if (v9[0])
    {
      void v9[2] = v9[0];
      int v4 = swift_dynamicCast();
      if (v4) {
        uint64_t v3 = v9[0];
      }
      else {
        uint64_t v3 = 0LL;
      }
      if (v4) {
        uint64_t v5 = v9[1];
      }
      else {
        uint64_t v5 = 0LL;
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      uint64_t v5 = 0LL;
    }

    uint64_t v6 = v0[24];
    uint64_t v7 = v0[25];
    v0[24] = v3;
    v0[25] = v5;
    swift_bridgeObjectRetain();
    sub_189187778(v6, v7);
  }

  sub_18918778C(v1, v2);
  return v3;
}

uint64_t sub_18918790C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 192);
  uint64_t v4 = *(void *)(v2 + 200);
  *(void *)(v2 + 192) = a1;
  *(void *)(v2 + 200) = a2;
  return sub_189187778(v3, v4);
}

uint64_t sub_189187920@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 440LL))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_189187950(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 208);
  uint64_t v6 = *(void *)(*a2 + 216);
  *(void *)(v4 + 208) = v3;
  *(void *)(v4 + 2__swift_destroy_boxed_opaque_existential_1(v0 + 16) = v2;
  swift_bridgeObjectRetain();
  return sub_189187778(v5, v6);
}

uint64_t sub_189187984()
{
  uint64_t v1 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(void *__return_ptr, uint64_t, unint64_t))(*v0 + 848LL))( v9,  0x6D754E6C65646F4DLL,  0xEB00000000726562LL);
    if (v9[0])
    {
      void v9[2] = v9[0];
      int v4 = swift_dynamicCast();
      if (v4) {
        uint64_t v3 = v9[0];
      }
      else {
        uint64_t v3 = 0LL;
      }
      if (v4) {
        uint64_t v5 = v9[1];
      }
      else {
        uint64_t v5 = 0LL;
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      uint64_t v5 = 0LL;
    }

    uint64_t v6 = v0[26];
    uint64_t v7 = v0[27];
    v0[26] = v3;
    v0[27] = v5;
    swift_bridgeObjectRetain();
    sub_189187778(v6, v7);
  }

  sub_18918778C(v1, v2);
  return v3;
}

uint64_t sub_189187A78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 208);
  uint64_t v4 = *(void *)(v2 + 216);
  *(void *)(v2 + 208) = a1;
  *(void *)(v2 + 2__swift_destroy_boxed_opaque_existential_1(v0 + 16) = a2;
  return sub_189187778(v3, v4);
}

uint64_t sub_189187A8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 464LL))();
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_189187AC4(uint64_t result, uint64_t *a2)
{
  unsigned __int8 v2 = *(_BYTE *)(result + 8);
  uint64_t v3 = *a2;
  *(void *)(v3 + 224) = *(void *)result;
  *(_WORD *)(v3 + 232) = v2;
  return result;
}

uint64_t sub_189187AE0()
{
  if ((*(_BYTE *)(v0 + 233) & 1) == 0) {
    return *(void *)(v0 + 224);
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(void *)v0 + 848LL))( &v5,  0x4E6E6F6973726556LL,  0xED00007265626D75LL);
  if (v5)
  {
    int v1 = swift_dynamicCast();
    if (v1) {
      uint64_t result = v4;
    }
    else {
      uint64_t result = 0LL;
    }
    char v3 = v1 ^ 1;
  }

  else
  {
    uint64_t result = 0LL;
    char v3 = 1;
  }

  *(void *)(v0 + 224) = result;
  *(_BYTE *)(v0 + 232) = v3;
  *(_BYTE *)(v0 + 233) = 0;
  return result;
}

uint64_t sub_189187B9C(uint64_t result, char a2)
{
  *(void *)(v2 + 224) = result;
  *(_BYTE *)(v2 + 232) = a2 & 1;
  *(_BYTE *)(v2 + 233) = 0;
  return result;
}

uint64_t sub_189187BB0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 488LL))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_189187BE0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 240);
  uint64_t v6 = *(void *)(*a2 + 248);
  *(void *)(v4 + 240) = v3;
  *(void *)(v4 + 248) = v2;
  swift_bridgeObjectRetain();
  return sub_189187778(v5, v6);
}

uint64_t sub_189187C14()
{
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[31];
  uint64_t v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(void *__return_ptr, uint64_t, unint64_t))(*v0 + 848LL))( v9,  0x754E6C6169726553LL,  0xEC0000007265626DLL);
    if (v9[0])
    {
      void v9[2] = v9[0];
      int v4 = swift_dynamicCast();
      if (v4) {
        uint64_t v3 = v9[0];
      }
      else {
        uint64_t v3 = 0LL;
      }
      if (v4) {
        uint64_t v5 = v9[1];
      }
      else {
        uint64_t v5 = 0LL;
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      uint64_t v5 = 0LL;
    }

    uint64_t v6 = v0[30];
    uint64_t v7 = v0[31];
    v0[30] = v3;
    v0[31] = v5;
    swift_bridgeObjectRetain();
    sub_189187778(v6, v7);
  }

  sub_18918778C(v1, v2);
  return v3;
}

uint64_t sub_189187D08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 240);
  uint64_t v4 = *(void *)(v2 + 248);
  *(void *)(v2 + 240) = a1;
  *(void *)(v2 + 248) = a2;
  return sub_189187778(v3, v4);
}

uint64_t sub_189187D1C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 512LL))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_189187D4C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  uint64_t v4 = *a2;
  uint64_t v5 = *(void *)(*a2 + 256);
  uint64_t v6 = *(void *)(*a2 + 264);
  *(void *)(v4 + 256) = v3;
  *(void *)(v4 + 264) = v2;
  swift_bridgeObjectRetain();
  return sub_189187778(v5, v6);
}

uint64_t sub_189187D80()
{
  uint64_t v1 = v0[32];
  uint64_t v2 = v0[33];
  uint64_t v3 = v1;
  if (v2 == 1)
  {
    (*(void (**)(void *__return_ptr, unint64_t, unint64_t))(*v0 + 848LL))( v9,  0xD000000000000016LL,  0x80000001891A7E70LL);
    if (v9[0])
    {
      void v9[2] = v9[0];
      int v4 = swift_dynamicCast();
      if (v4) {
        uint64_t v3 = v9[0];
      }
      else {
        uint64_t v3 = 0LL;
      }
      if (v4) {
        uint64_t v5 = v9[1];
      }
      else {
        uint64_t v5 = 0LL;
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      uint64_t v5 = 0LL;
    }

    uint64_t v6 = v0[32];
    uint64_t v7 = v0[33];
    v0[32] = v3;
    v0[33] = v5;
    swift_bridgeObjectRetain();
    sub_189187778(v6, v7);
  }

  sub_18918778C(v1, v2);
  return v3;
}

uint64_t sub_189187E70(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(v2 + 256);
  uint64_t v4 = *(void *)(v2 + 264);
  *(void *)(v2 + 256) = a1;
  *(void *)(v2 + 264) = a2;
  return sub_189187778(v3, v4);
}

uint64_t sub_189187E84@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 536LL))();
  *(void *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_189187EBC(uint64_t result, uint64_t *a2)
{
  unsigned __int8 v2 = *(_BYTE *)(result + 8);
  uint64_t v3 = *a2;
  *(void *)(v3 + 272) = *(void *)result;
  *(_WORD *)(v3 + 280) = v2;
  return result;
}

uint64_t sub_189187ED8()
{
  if ((*(_BYTE *)(v0 + 281) & 1) == 0) {
    return *(void *)(v0 + 272);
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(void *)v0 + 848LL))( &v5,  0x6E6F697461636F4CLL,  0xEA00000000004449LL);
  if (v5)
  {
    int v1 = swift_dynamicCast();
    if (v1) {
      uint64_t result = v4;
    }
    else {
      uint64_t result = 0LL;
    }
    char v3 = v1 ^ 1;
  }

  else
  {
    uint64_t result = 0LL;
    char v3 = 1;
  }

  *(void *)(v0 + 272) = result;
  *(_BYTE *)(v0 + 280) = v3;
  *(_BYTE *)(v0 + 281) = 0;
  return result;
}

uint64_t sub_189187F98(uint64_t result, char a2)
{
  *(void *)(v2 + 272) = result;
  *(_BYTE *)(v2 + 280) = a2 & 1;
  *(_BYTE *)(v2 + 281) = 0;
  return result;
}

uint64_t sub_189187FAC()
{
  return 0LL;
}

void *sub_189187FC0@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(**(void **)a1 + 560LL))(&v4);
  *a2 = v4;
  return result;
}

_BYTE *sub_189188000(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(void *)a2 + 282LL) = *result;
  return result;
}

void sub_189188010(_BYTE *a1@<X8>)
{
  int v3 = v1[282];
  if (v3 == 36)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(void *)v1 + 848LL))( &v8,  0x437972746E756F43LL,  0xEB0000000065646FLL);
    if (v8)
    {
      int v4 = swift_dynamicCast();
      if (v4) {
        uint64_t v5 = v7;
      }
      else {
        uint64_t v5 = 0LL;
      }
      char v6 = v4 ^ 1;
    }

    else
    {
      uint64_t v5 = 0LL;
      char v6 = 1;
    }

    sub_189185964(v5, v6, &v8);
    LOBYTE(v3) = v8;
    v1[282] = v8;
  }

  *a1 = v3;
}

_BYTE *sub_1891880D0(_BYTE *result)
{
  *(_BYTE *)(v1 + 282) = *result;
  return result;
}

uint64_t sub_1891880DC@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 584LL))();
  *a2 = result & 1;
  return result;
}

_BYTE *sub_189188110(_BYTE *result, uint64_t a2)
{
  *(_BYTE *)(*(void *)a2 + 283LL) = *result;
  return result;
}

uint64_t sub_189188120()
{
  int v1 = v0[283];
  if (v1 != 2) {
    return v1 & 1;
  }
  (*(void (**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(void *)v0 + 848LL))( &v4,  0x6E492D746C697542LL,  0xE800000000000000LL);
  if (v4 && (swift_dynamicCast() & 1) != 0) {
    uint64_t result = v3;
  }
  else {
    uint64_t result = 0LL;
  }
  v0[283] = result;
  return result;
}

uint64_t sub_1891881B4(uint64_t result)
{
  *(_BYTE *)(v1 + 283) = result;
  return result;
}

uint64_t sub_1891881BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)a1 + 608LL))();
  *a2 = result;
  return result;
}

uint64_t sub_1891881EC(void *a1, uint64_t a2)
{
  *(void *)(*(void *)a2 + 288LL) = *a1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

CFIndex sub_18918821C()
{
  if (*(void *)(v0 + 288))
  {
    uint64_t v1 = *(char **)(v0 + 288);
LABEL_24:
    swift_bridgeObjectRetain();
    return (CFIndex)v1;
  }

  uint64_t v2 = IOHIDDeviceCopyMatchingElements(*(IOHIDDeviceRef *)(v0 + 296), 0LL, 0);
  if (!v2) {
    goto LABEL_22;
  }
  unsigned __int8 v3 = v2;
  CFIndex result = CFArrayGetCount(v2);
  if ((result & 0x8000000000000000LL) == 0)
  {
    CFIndex v5 = result;
    if (result)
    {
      CFIndex result = (CFIndex)CFArrayGetValueAtIndex(v3, 0LL);
      if (result)
      {
        uint64_t v1 = (char *)MEMORY[0x18961AFE8];
        CFIndex v6 = 1LL;
        while (1)
        {
          id v7 = (id)result;
          swift_retain();
          sub_1891595D0(v7, v0, (uint64_t)v17);
          sub_18919A2C0((uint64_t)v17, (uint64_t)v18);
          sub_18919A2C0((uint64_t)v18, (uint64_t)v19);
          if (sub_18915E098((uint64_t)v19) == 1)
          {

            if (v5 == v6) {
              goto LABEL_20;
            }
          }

          else
          {
            if ((v20[8] & 1) == 0)
            {
              sub_18919A2C0((uint64_t)v18, (uint64_t)v17);
              sub_18915E0B0((uint64_t)v17);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v1 = sub_18915E0E0(0LL, *((void *)v1 + 2) + 1LL, 1, v1);
              }
              unint64_t v9 = *((void *)v1 + 2);
              unint64_t v8 = *((void *)v1 + 3);
              if (v9 >= v8 >> 1) {
                uint64_t v1 = sub_18915E0E0((char *)(v8 > 1), v9 + 1, 1, v1);
              }
              *((void *)v1 + 2) = v9 + 1;
              uint64_t v10 = &v1[128 * v9];
              __int128 v11 = v19[0];
              __int128 v12 = v19[1];
              __int128 v13 = v19[3];
              *((_OWORD *)v10 + 4) = v19[2];
              *((_OWORD *)v10 + 5) = v13;
              *((_OWORD *)v10 + 2) = v11;
              *((_OWORD *)v10 + 3) = v12;
              __int128 v14 = v19[4];
              __int128 v15 = v19[5];
              __int128 v16 = *(_OWORD *)v20;
              *(_OWORD *)(v10 + 137) = *(_OWORD *)&v20[9];
              *((_OWORD *)v10 + 7) = v15;
              *((_OWORD *)v10 + 8) = v16;
              *((_OWORD *)v10 + 6) = v14;
            }

            sub_18915E1E0((uint64_t)v18);
            if (v5 == v6)
            {
LABEL_20:

              goto LABEL_23;
            }
          }

          CFIndex result = (CFIndex)CFArrayGetValueAtIndex(v3, v6++);
          if (!result) {
            goto LABEL_26;
          }
        }
      }

      goto LABEL_26;
    }

LABEL_22:
    uint64_t v1 = (char *)MEMORY[0x18961AFE8];
LABEL_23:
    *(void *)(v0 + 288) = v1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }

  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_189188428(uint64_t a1)
{
  *(void *)(v1 + 288) = a1;
  return swift_bridgeObjectRelease();
}

id sub_189188438()
{
  return *(id *)(v0 + 296);
}

id sub_189188440()
{
  return *(id *)(v0 + 304);
}

uint64_t sub_189188448()
{
  return *(void *)(v0 + 328);
}

uint64_t sub_189188450()
{
  return *(void *)(v0 + 336);
}

uint64_t sub_189188458()
{
  return *(void *)(v0 + 344);
}

uint64_t sub_189188488(uint64_t a1)
{
  uint64_t result = swift_beginAccess();
  *(void *)(v1 + 344) = a1;
  return result;
}

uint64_t (*sub_1891884C4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_189188500()
{
  return *(unsigned __int8 *)(v0 + 352);
}

uint64_t sub_189188530(char a1)
{
  uint64_t result = swift_beginAccess();
  *(_BYTE *)(v1 + 352) = a1;
  return result;
}

uint64_t (*sub_18918856C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1891885A8()
{
  return *(unsigned __int8 *)(v0 + 353);
}

uint64_t sub_1891885D8(char a1)
{
  uint64_t result = swift_beginAccess();
  *(_BYTE *)(v1 + 353) = a1;
  return result;
}

uint64_t (*sub_189188614())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_189188650()
{
  return *(unsigned __int8 *)(v0 + 354);
}

uint64_t sub_189188680(char a1)
{
  uint64_t result = swift_beginAccess();
  *(_BYTE *)(v1 + 354) = a1;
  return result;
}

uint64_t (*sub_1891886BC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1891886F8()
{
  return *(unsigned __int8 *)(v0 + 355);
}

uint64_t sub_189188728(char a1)
{
  uint64_t result = swift_beginAccess();
  *(_BYTE *)(v1 + 355) = a1;
  return result;
}

uint64_t (*sub_189188764())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_1891887A0()
{
  return MEMORY[0x18961AFE8];
}

uint64_t sub_1891887AC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1891887E0(uint64_t a1)
{
  *(void *)(v1 + 360) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_189188824())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_189188860()
{
  return *(void *)(v0 + 368);
}

void HIDDeviceClient.__allocating_init(deviceReference:)(uint64_t *a1)
{
}

void HIDDeviceClient.init(deviceReference:)(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_18919AB74();
  uint64_t v56 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  __int128 v57 = (char *)v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = sub_18919AB98();
  MEMORY[0x1895F8858](v6);
  uint64_t v7 = sub_18919A9D0();
  MEMORY[0x1895F8858](v7);
  uint64_t v8 = *a1;
  swift_defaultActor_initialize();
  *(_OWORD *)(v1 + 120) = xmmword_1891A6DD0;
  *(void *)(v1 + 144) = 0LL;
  *(_OWORD *)(v1 + 160) = xmmword_1891A6DC0;
  *(_OWORD *)(v1 + 176) = xmmword_1891A6820;
  *(_OWORD *)(v1 + 192) = xmmword_1891A6820;
  *(_OWORD *)(v1 + 208) = xmmword_1891A6820;
  *(void *)(v1 + 224) = 0LL;
  *(_WORD *)(v1 + 232) = 256;
  *(_OWORD *)(v1 + 240) = xmmword_1891A6820;
  *(_OWORD *)(v1 + 256) = xmmword_1891A6820;
  *(void *)(v1 + 272) = 0LL;
  *(_DWORD *)(v1 + 280) = 35913984;
  *(void *)(v1 + 288) = 0LL;
  *(void *)(v1 + 344) = 0LL;
  *(_DWORD *)(v1 + 352) = 0;
  uint64_t v9 = MEMORY[0x18961AFE8];
  *(void *)(v1 + 360) = MEMORY[0x18961AFE8];
  mach_port_t v10 = *MEMORY[0x1896086A8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB28);
  uint64_t inited = swift_initStackObject();
  __int128 v58 = xmmword_18919B6C0;
  *(_OWORD *)(inited + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_18919B6C0;
  *(void *)(inited + 32) = 0xD000000000000011LL;
  *(void *)(inited + 40) = 0x80000001891A86E0LL;
  *(void *)(inited + 48) = v8;
  sub_189189104(inited);
  __int128 v12 = (const __CFDictionary *)sub_18919AA00();
  swift_bridgeObjectRelease();
  io_service_t MatchingService = IOServiceGetMatchingService(v10, v12);
  if (!MatchingService || (IOHIDDeviceRef v14 = IOHIDDeviceCreate(0LL, MatchingService)) == 0LL)
  {
    sub_189187144(*(void *)(v1 + 120), *(void *)(v1 + 128));
    swift_bridgeObjectRelease();
    sub_1891875E4(*(void *)(v1 + 160), *(void *)(v1 + 168));
    sub_189187778(*(void *)(v1 + 176), *(void *)(v1 + 184));
    sub_189187778(*(void *)(v1 + 192), *(void *)(v1 + 200));
    sub_189187778(*(void *)(v1 + 208), *(void *)(v1 + 216));
    sub_189187778(*(void *)(v1 + 240), *(void *)(v1 + 248));
    sub_189187778(*(void *)(v1 + 256), *(void *)(v1 + 264));
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for HIDDeviceClient();
    swift_defaultActor_destroy();
    swift_deallocPartialClassInstance();
    return;
  }

  IOHIDDeviceRef v15 = v14;
  uint64_t v55 = v4;
  IOHIDDeviceRef v62 = v14;
  type metadata accessor for IOHIDDevice(0LL);
  uint64_t v17 = v16;
  uint64_t v18 = v15;
  sub_189185FFC((uint64_t)&v62, v17, (uint64_t)v60);
  uint64_t v19 = (void *)v60[0];
  *(void *)(v1 + 296) = v60[0];
  *(void *)(v1 + 112) = v8;
  IONotificationPortRef v20 = IONotificationPortCreate(v10);
  if (!v20)
  {
    __break(1u);
    goto LABEL_19;
  }

  CFTypeRef v54 = v18;
  *(void *)(v1 + 368) = v20;
  uint64_t v21 = v19;
  BOOL v22 = (__CFString *)sub_18919AA6C();
  CFTypeRef v23 = (id)IOHIDDeviceGetProperty(v21, v22);

  if (!v23)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }

  v60[0] = v23;
  swift_dynamicCast();
  uint64_t v24 = v61;
  int64_t v25 = (__IOHIDDevice *)*(id *)(v1 + 296);
  unint64_t v26 = (__CFString *)sub_18919AA6C();
  BOOL v27 = (id)IOHIDDeviceGetProperty(v25, v26);

  if (v27)
  {
    IOHIDDeviceRef v62 = v27;
    int v28 = swift_dynamicCast();
    int v29 = v59;
    int v30 = v28 ^ 1;
    if (!v28) {
      int v29 = 0;
    }
  }

  else
  {
    int v29 = 0;
    int v30 = 1;
  }

  HIDUsage.init(page:usage:)(v29 | (v30 << 16), v24, (uint64_t)&v62);
  int v31 = (int)v62;
  *(_BYTE *)(v1 + 140) = BYTE4(v62);
  *(_DWORD *)(v1 + 136) = v31;
  uint64_t v32 = (__IOHIDDevice *)*(id *)(v1 + 296);
  uint64_t v33 = (__CFString *)sub_18919AA6C();
  CFTypeRef v34 = (id)IOHIDDeviceGetProperty(v32, v33);

  if (!v34) {
    goto LABEL_20;
  }
  v60[0] = v34;
  swift_dynamicCast();
  *(_DWORD *)(v1 + 152) = (_DWORD)v62;
  sub_1891645D4();
  v53[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A458);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v58;
  uint64_t v36 = *(void *)(v1 + 112);
  uint64_t v37 = MEMORY[0x18961A910];
  *(void *)(v35 + 56) = MEMORY[0x18961A8C8];
  *(void *)(v35 + 64) = v37;
  *(void *)(v35 + 32) = v36;
  sub_18919AA78();
  sub_18919A9C4();
  v60[0] = v9;
  sub_1891646EC(&qword_18C77A4C0, 255LL, (uint64_t (*)(uint64_t))MEMORY[0x18961BA30], MEMORY[0x18961BA40]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4C8);
  sub_189164610();
  sub_18919AC28();
  (*(void (**)(char *, void, uint64_t))(v56 + 104))(v57, *MEMORY[0x18961B908], v55);
  *(void *)(v1 + 304) = sub_18919ABA4();
  __int128 v38 = (__IOHIDDevice *)*(id *)(v1 + 296);
  __int128 v39 = (__CFString *)sub_18919AA6C();
  CFTypeRef v40 = (id)IOHIDDeviceGetProperty(v38, v39);

  if (!v40)
  {
LABEL_21:
    __break(1u);
    return;
  }

  v60[0] = v40;
  swift_dynamicCast();
  *(void *)(v2 + 328) = v62;
  *(void *)(v2 + 336) = swift_slowAlloc();
  __int128 v41 = (__IOHIDDevice *)*(id *)(v2 + 296);
  __int128 v42 = (__CFString *)sub_18919AA6C();
  CFTypeRef v43 = (id)IOHIDDeviceGetProperty(v41, v42);

  if (v43)
  {
    v60[0] = v43;
    char v44 = swift_dynamicCast();
    uint64_t v45 = MEMORY[0x18961A910];
    if ((v44 & 1) != 0) {
      int v46 = (int)v62;
    }
    else {
      int v46 = 0;
    }
  }

  else
  {
    int v46 = 0;
    uint64_t v45 = MEMORY[0x18961A910];
  }

  *(_DWORD *)(v2 + 156) = v46;
  v60[0] = 0LL;
  v60[1] = 0xE000000000000000LL;
  sub_18919AC4C();
  sub_18919AA9C();
  int v47 = *(_DWORD *)(v2 + 136);
  BYTE4(v62) = *(_BYTE *)(v2 + 140);
  LODWORD(v62) = v47;
  sub_18915EB84();
  sub_18919ADB4();
  sub_18919AA9C();
  swift_bridgeObjectRelease();
  sub_18919AA9C();
  LODWORD(v62) = *(_DWORD *)(v2 + 152);
  sub_18919ADB4();
  sub_18919AA9C();
  swift_bridgeObjectRelease();
  sub_18919AA9C();
  LODWORD(v62) = *(_DWORD *)(v2 + 156);
  sub_18919ADB4();
  sub_18919AA9C();
  swift_bridgeObjectRelease();
  sub_18919AA9C();
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v58;
  uint64_t v49 = *(void *)(v2 + 112);
  *(void *)(v48 + 56) = MEMORY[0x18961A8C8];
  *(void *)(v48 + 64) = v45;
  *(void *)(v48 + 32) = v49;
  uint64_t v50 = sub_18919AA78();
  uint64_t v52 = v51;

  swift_bridgeObjectRelease();
  *(void *)(v2 + 312) = v50;
  *(void *)(v2 + 320) = v52;
}

unint64_t sub_189189104(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B3B8);
  uint64_t v2 = (void *)sub_18919ADA8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_189163EC4(v5, v6);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    mach_port_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
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

uint64_t type metadata accessor for HIDDeviceClient()
{
  return objc_opt_self();
}

void type metadata accessor for IOHIDDevice(uint64_t a1)
{
}

unint64_t sub_189189248(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x18961AFF0];
    goto LABEL_9;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A838);
  uint64_t v2 = (void *)sub_18919ADA8();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }

  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    unint64_t result = sub_189163EC4(v5, v6);
    if ((v9 & 1) != 0) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    mach_port_t v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1LL);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_189189360( uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(char *), uint64_t (*a5)(void))
{
  uint64_t v32 = a2;
  uint64_t v33 = a4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v13 = (void *)MEMORY[0x18961AFF0];
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v13;
  }

  __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v12 = sub_18919ADA8();
  uint64_t v13 = (void *)v12;
  uint64_t v14 = *(void *)(a1 + 16);
  if (!v14) {
    goto LABEL_9;
  }
  IOHIDDeviceRef v15 = &v11[*(int *)(v8 + 48)];
  uint64_t v16 = a1;
  uint64_t v17 = v12 + 64;
  unint64_t v18 = (*(unsigned __int8 *)(v9 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v31[1] = v16;
  uint64_t v19 = v16 + v18;
  uint64_t v20 = *(void *)(v9 + 72);
  swift_retain();
  while (1)
  {
    sub_18919A490(v19, (uint64_t)v11, v32);
    unint64_t result = v33(v11);
    if ((v22 & 1) != 0) {
      break;
    }
    unint64_t v23 = result;
    *(void *)(v17 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    uint64_t v24 = v13[6];
    uint64_t v25 = a5(0LL);
    unint64_t result = sub_189198824((uint64_t)v11, v24 + *(void *)(*(void *)(v25 - 8) + 72LL) * v23, a5);
    uint64_t v26 = v13[7] + 16 * v23;
    char v27 = v15[8];
    *(void *)uint64_t v26 = *(void *)v15;
    *(_BYTE *)(v26 + 8) = v27;
    uint64_t v28 = v13[2];
    BOOL v29 = __OFADD__(v28, 1LL);
    uint64_t v30 = v28 + 1;
    if (v29) {
      goto LABEL_12;
    }
    _OWORD v13[2] = v30;
    v19 += v20;
    if (!--v14)
    {
      swift_bridgeObjectRelease();
      swift_release();
      return (unint64_t)v13;
    }
  }

  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

uint64_t HIDDeviceClient.deinit()
{
  *(_BYTE *)(v0 + 353) = 1;
  swift_beginAccess();
  if (*(_BYTE *)(v0 + 352) != 1) {
    goto LABEL_3;
  }
  IONotificationPortDestroy(*(IONotificationPortRef *)(v0 + 368));
  IOHIDDeviceCancel(*(IOHIDDeviceRef *)(v0 + 296));
  uint64_t v1 = *(dispatch_queue_s **)(v0 + 304);
  v4[4] = nullsub_1;
  v4[5] = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 1107296256LL;
  v4[2] = sub_189161FAC;
  v4[3] = &block_descriptor_0;
  uint64_t v2 = _Block_copy(v4);
  swift_release();
  dispatch_sync(v1, v2);
  _Block_release(v2);
  uint64_t result = swift_isEscapingClosureAtFileLocation();
  if ((result & 1) != 0)
  {
    __break(1u);
  }

  else
  {
LABEL_3:
    MEMORY[0x1895E1F64](*(void *)(v0 + 336), -1LL, -1LL);
    sub_189187144(*(void *)(v0 + 120), *(void *)(v0 + 128));
    swift_bridgeObjectRelease();
    sub_1891875E4(*(void *)(v0 + 160), *(void *)(v0 + 168));
    sub_189187778(*(void *)(v0 + 176), *(void *)(v0 + 184));
    sub_189187778(*(void *)(v0 + 192), *(void *)(v0 + 200));
    sub_189187778(*(void *)(v0 + 208), *(void *)(v0 + 216));
    sub_189187778(*(void *)(v0 + 240), *(void *)(v0 + 248));
    sub_189187778(*(void *)(v0 + 256), *(void *)(v0 + 264));
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_defaultActor_destroy();
    return v0;
  }

  return result;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t HIDDeviceClient.__deallocating_deinit()
{
  return swift_defaultActor_deallocate();
}

uint64_t sub_1891896BC()
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t result = (*(uint64_t (**)(void))(*v0 + 656LL))();
  if ((result & 1) == 0)
  {
    (*(void (**)(void *))(*v0 + 640LL))(v0);
    uint64_t v2 = (IONotificationPort *)v0[46];
    uint64_t v3 = (dispatch_queue_s *)v0[38];
    IONotificationPortSetDispatchQueue(v2, v3);
    io_object_t notification = 0;
    mach_port_t v4 = *MEMORY[0x1896086A8];
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB28);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_18919B6C0;
    *(void *)(inited + 32) = 0xD000000000000011LL;
    *(void *)(inited + 40) = 0x80000001891A86E0LL;
    *(void *)(inited + 48) = v0[14];
    sub_189189104(inited);
    uint64_t v6 = (const __CFDictionary *)sub_18919AA00();
    swift_bridgeObjectRelease();
    io_service_t MatchingService = IOServiceGetMatchingService(v4, v6);
    uint64_t v8 = *(uint64_t (**)(void))(*v0 + 632LL);
    uint64_t result = v8();
    if (result)
    {
      uint64_t v9 = IOServiceAddInterestNotification( v2,  MatchingService,  "IOGeneralInterest",  (IOServiceInterestCallback)sub_189189A84,  (void *)result,  &notification);
      uint64_t v10 = (__IOHIDDevice *)v0[37];
      uint64_t result = ((uint64_t (*)(uint64_t))v8)(v9);
      if (result)
      {
        IOHIDDeviceRegisterRemovalCallback(v10, (IOHIDCallback)sub_189189B5C, (void *)result);
        CFIndex v12 = v0[41];
        uint64_t v11 = (uint8_t *)v0[42];
        uint64_t result = v8();
        if (result)
        {
          IOHIDDeviceRegisterInputReportWithTimeStampCallback( v10,  v11,  v12,  (IOHIDReportWithTimeStampCallback)sub_189189E44,  (void *)result);
          uint64_t result = v8();
          if (result)
          {
            IOHIDDeviceRegisterInputValueCallback(v10, (IOHIDValueCallback)sub_18918A1C8, (void *)result);
            aBlock[4] = nullsub_1;
            aBlock[5] = 0LL;
            aBlock[0] = MEMORY[0x1895F87A8];
            aBlock[1] = 1107296256LL;
            aBlock[2] = sub_189162E40;
            aBlock[3] = &block_descriptor_3_0;
            uint64_t v13 = _Block_copy(aBlock);
            IOHIDDeviceSetCancelHandler(v10, v13);
            _Block_release(v13);
            IOHIDDeviceSetDispatchQueue(v10, v3);
            IOHIDDeviceActivate(v10);
            return (*(uint64_t (**)(uint64_t))(*v0 + 664LL))(1LL);
          }

LABEL_10:
        __break(1u);
        goto LABEL_11;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
    goto LABEL_10;
  }

  return result;
}

uint64_t sub_189189904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7)
{
  *(_DWORD *)(v7 + 64) = a5;
  *(_DWORD *)(v7 + 68) = a6;
  *(void *)(v7 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a4;
  *(void *)(v7 + 24) = a7;
  *(void *)(v7 + 32) = type metadata accessor for HIDDeviceClient.Notification(0LL);
  *(void *)(v7 + 40) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_189189964()
{
  uint64_t v1 = *(void *)(v0[2] + 16LL);
  v0[6] = v1;
  swift_retain();
  swift_storeEnumTagMultiPayload();
  v0[7] = *(void *)(*(void *)v1 + 824LL);
  return swift_task_switch();
}

uint64_t sub_1891899E4()
{
  uint64_t v1 = *(void *)(v0 + 40);
  (*(void (**)(uint64_t))(v0 + 56))(v1);
  sub_1891959B0(v1, type metadata accessor for HIDDeviceClient.Notification);
  return swift_task_switch();
}

uint64_t sub_189189A38()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_189189A84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_189198084(a1, a3, a4);
}

uint64_t sub_189189A90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5[2] = a4;
  v5[3] = a5;
  v5[4] = type metadata accessor for HIDDeviceClient.Notification(0LL);
  v5[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_189189AEC()
{
  uint64_t v1 = *(void *)(v0[2] + 16LL);
  v0[6] = v1;
  swift_retain();
  swift_storeEnumTagMultiPayload();
  v0[7] = *(void *)(*(void *)v1 + 824LL);
  return swift_task_switch();
}

uint64_t sub_189189B5C(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A800);
  uint64_t result = MEMORY[0x1895F8858](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    type metadata accessor for HIDDeviceClient.Context();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a1;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    uint64_t v8 = sub_18919AB20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v5, 1LL, 1LL, v8);
    uint64_t v9 = (void *)swift_allocObject();
    void v9[2] = 0LL;
    void v9[3] = 0LL;
    v9[4] = v6;
    v9[5] = v7;
    swift_retain();
    uint64_t v10 = v7;
    sub_1891626B4((uint64_t)v5, (uint64_t)&unk_18C77B3A0, (uint64_t)v9);
    swift_release();
    sub_18919AB80();

    return swift_release();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_189189C64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 40) = a8;
  *(void *)(v8 + 48) = v10;
  *(void *)(v8 + 24) = a6;
  *(void *)(v8 + 32) = a7;
  *(_DWORD *)(v8 + 88) = a5;
  *(void *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a4;
  *(void *)(v8 + 56) = type metadata accessor for HIDDeviceClient.Notification(0LL);
  *(void *)(v8 + 64) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_189189CD0()
{
  uint64_t v1 = *(unsigned int *)(v0 + 88);
  uint64_t v2 = *(void *)(*(void *)(v0 + 16) + 16LL);
  *(void *)(v0 + 72) = v2;
  uint64_t result = swift_retain();
  if (v1 > 0xFF)
  {
    __break(1u);
  }

  else
  {
    uint64_t v4 = *(void *)(v0 + 64);
    unint64_t v6 = *(void *)(v0 + 32);
    unint64_t v5 = *(void *)(v0 + 40);
    uint64_t v7 = *(void *)(v0 + 24);
    uint64_t v8 = (unint64_t *)(v4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB60) + 64));
    HIDReportID.init(rawValue:)(v1, (_BYTE *)v4);
    *(void *)(v4 + 8) = v7;
    *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v6;
    sub_18915EC34(v7, v6);
    sub_189185EF8(v5, v8);
    swift_storeEnumTagMultiPayload();
    *(void *)(v0 + 80) = *(void *)(*(void *)v2 + 824LL);
    return swift_task_switch();
  }

  return result;
}

uint64_t sub_189189DA4()
{
  uint64_t v1 = *(void *)(v0 + 64);
  (*(void (**)(uint64_t))(v0 + 80))(v1);
  sub_1891959B0(v1, type metadata accessor for HIDDeviceClient.Notification);
  return swift_task_switch();
}

uint64_t sub_189189DF8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_189189E44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _BYTE *a6, uint64_t a7, uint64_t a8)
{
  return sub_189198278(a1, a5, a6, a7, a8);
}

uint64_t sub_189189E58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[68] = a6;
  v6[67] = a5;
  v6[66] = a4;
  sub_18919ACC4();
  v6[69] = swift_task_alloc();
  v6[70] = type metadata accessor for HIDDeviceClient.Notification(0LL);
  v6[71] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_189189EDC()
{
  uint64_t v1 = *(__IOHIDValue **)(v0 + 536);
  uint64_t v2 = *(void *)(*(void *)(v0 + 528) + 16LL);
  *(void *)(v0 + 576) = v2;
  swift_retain();
  uint64_t v3 = IOHIDValueGetElement(v1);
  swift_retain();
  sub_1891595D0(v3, v2, v0 + 272);
  sub_18919A2C0(v0 + 272, v0 + 144);
  sub_18919A2C0(v0 + 144, v0 + 16);
  if (sub_18915E098(v0 + 16) == 1)
  {
    sub_18919AB8C();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    unint64_t v5 = *(uint64_t **)(v0 + 568);
    unint64_t v6 = *(unint64_t **)(v0 + 552);
    uint64_t v7 = *(__IOHIDValue **)(v0 + 536);
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B340);
    uint64_t v8 = *(unsigned __int8 *)(*(void *)(type metadata accessor for HIDElement.Value() - 8) + 80LL);
    uint64_t v9 = (v8 + 32) & ~v8;
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_18919B6C0;
    __int128 v11 = *(_OWORD *)(v0 + 96);
    v20[4] = *(_OWORD *)(v0 + 80);
    v20[5] = v11;
    v21[0] = *(_OWORD *)(v0 + 112);
    *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)(v0 + 121);
    __int128 v12 = *(_OWORD *)(v0 + 32);
    v20[0] = *(_OWORD *)(v0 + 16);
    v20[1] = v12;
    __int128 v13 = *(_OWORD *)(v0 + 64);
    v20[2] = *(_OWORD *)(v0 + 48);
    v20[3] = v13;
    sub_18919A2C0(v0 + 144, v0 + 400);
    sub_18915E0B0(v0 + 400);
    BytePtr = (uint8_t *)IOHIDValueGetBytePtr(v7);
    CFIndex Length = IOHIDValueGetLength(v7);
    uint64_t v16 = sub_1891981CC(BytePtr, Length);
    uint64_t v18 = v17;
    uint64_t TimeStamp = IOHIDValueGetTimeStamp(v7);
    sub_189185EF8(TimeStamp, v6);
    HIDElement.Value.init(element:fromBytes:timestamp:)(v20, v16, v18, (uint64_t)v6, (_OWORD *)(v10 + v9));
    uint64_t *v5 = v10;
    swift_storeEnumTagMultiPayload();
    *(void *)(v0 + 584) = *(void *)(*(void *)v2 + 824LL);
    return swift_task_switch();
  }

uint64_t sub_18918A10C()
{
  uint64_t v1 = *(void *)(v0 + 568);
  (*(void (**)(uint64_t))(v0 + 584))(v1);
  sub_1891959B0(v1, type metadata accessor for HIDDeviceClient.Notification);
  return swift_task_switch();
}

uint64_t sub_18918A164()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_18918A1C8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  sub_1891983D8(a1, v5);
}

void sub_18918A204()
{
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_18919B6C0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB38);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_18919B6C0;
  *(void *)(inited + 32) = 1701869908LL;
  *(void *)(inited + 40) = 0xE400000000000000LL;
  *(void *)(inited + 48) = sub_18919AB68();
  *(void *)(v1 + 32) = sub_189189248(inited);
  uint64_t v54 = v0;
  unint64_t v4 = (*(uint64_t (**)(void))(*(void *)v0 + 752LL))();
  if (v4 >> 62) {
    goto LABEL_33;
  }
  for (uint64_t i = *(void *)((v4 & 0xFFFFFFFFFFFFF8LL) + 0x10); i; uint64_t i = sub_18919AD78())
  {
    unint64_t v6 = 0LL;
    unint64_t v58 = v4 & 0xC000000000000001LL;
    uint64_t v55 = v4 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v56 = i;
    unint64_t v57 = v4;
    while (1)
    {
      if (v58)
      {
        uint64_t v7 = MEMORY[0x1895E1604](v6, v4);
        BOOL v8 = __OFADD__(v6, 1LL);
        unint64_t v9 = v6 + 1;
        if (v8) {
          goto LABEL_31;
        }
      }

      else
      {
        if (v6 >= *(void *)(v55 + 16)) {
          goto LABEL_32;
        }
        uint64_t v7 = swift_retain();
        BOOL v8 = __OFADD__(v6, 1LL);
        unint64_t v9 = v6 + 1;
        if (v8) {
          goto LABEL_31;
        }
      }

      unint64_t v59 = v9;
      uint64_t v10 = *(void *)(v7 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor);
      uint64_t v11 = *(void *)(v10 + 16);
      if (v11) {
        break;
      }
      swift_release();
LABEL_5:
      unint64_t v6 = v59;
      if (v59 == i) {
        goto LABEL_34;
      }
    }

    swift_bridgeObjectRetain();
    uint64_t v61 = v11 - 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A838);
    for (uint64_t j = 32LL; ; uint64_t j = v60 + 128)
    {
      uint64_t v13 = v10;
      uint64_t v60 = j;
      uint64_t v14 = (__int128 *)(v10 + j);
      __int128 v15 = v14[4];
      __int128 v16 = v14[5];
      __int128 v17 = *(__int128 *)((char *)v14 + 105);
      v63[0] = v14[6];
      __int128 v18 = *v14;
      __int128 v19 = v14[1];
      __int128 v20 = v14[3];
      v62[2] = v14[2];
      v62[3] = v20;
      v62[0] = v18;
      v62[1] = v19;
      *(_OWORD *)((char *)v63 + 9) = v17;
      v62[4] = v15;
      v62[5] = v16;
      uint64_t v21 = *(__IOHIDElement **)&v63[0];
      uint64_t v22 = v2;
      uint64_t v23 = swift_initStackObject();
      *(_OWORD *)(v23 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_1891A6DE0;
      *(void *)(v23 + 32) = 1701869908LL;
      *(void *)(v23 + 40) = 0xE400000000000000LL;
      sub_18915E0B0((uint64_t)v62);
      *(void *)(v23 + 48) = sub_18919AE8C();
      *(void *)(v23 + 56) = 0x444974726F706552LL;
      *(void *)(v23 + 64) = 0xE800000000000000LL;
      IOHIDElementGetReportID(v21);
      *(void *)(v23 + 72) = sub_18919AE8C();
      unint64_t v4 = sub_18919ADA8();
      uint64_t v2 = *(void *)(v23 + 32);
      uint64_t v24 = *(void *)(v23 + 40);
      uint64_t v25 = *(void *)(v23 + 48);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      swift_retain();
      unint64_t v26 = sub_189163EC4(v2, v24);
      if ((v27 & 1) != 0) {
        break;
      }
      *(void *)(v4 + 64 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v26;
      uint64_t v28 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v26);
      *uint64_t v28 = v2;
      v28[1] = v24;
      *(void *)(*(void *)(v4 + 56) + 8 * v26) = v25;
      uint64_t v29 = *(void *)(v4 + 16);
      BOOL v8 = __OFADD__(v29, 1LL);
      uint64_t v30 = v29 + 1;
      if (v8) {
        goto LABEL_28;
      }
      *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v30;
      uint64_t v31 = *(void *)(v23 + 56);
      uint64_t v2 = *(void *)(v23 + 64);
      uint64_t v32 = *(void *)(v23 + 72);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      unint64_t v33 = sub_189163EC4(v31, v2);
      if ((v34 & 1) != 0) {
        break;
      }
      *(void *)(v4 + 64 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v33;
      uint64_t v35 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v33);
      *uint64_t v35 = v31;
      v35[1] = v2;
      *(void *)(*(void *)(v4 + 56) + 8 * v33) = v32;
      uint64_t v36 = *(void *)(v4 + 16);
      BOOL v8 = __OFADD__(v36, 1LL);
      uint64_t v37 = v36 + 1;
      if (v8) {
        goto LABEL_28;
      }
      *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v37;
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v39 = *(void *)(v1 + 16);
      unint64_t v38 = *(void *)(v1 + 24);
      if (v39 >= v38 >> 1) {
        uint64_t v1 = (uint64_t)sub_1891957F4((void *)(v38 > 1), v39 + 1, 1, (void *)v1);
      }
      uint64_t v2 = v22;
      *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v39 + 1;
      *(void *)(v1 + 8 * v39 + 32) = v4;
      uint64_t v40 = swift_initStackObject();
      *(_OWORD *)(v40 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_18919B6C0;
      strcpy((char *)(v40 + 32), "ElementCookie");
      *(_WORD *)(v40 + 46) = -4864;
      uint64_t Cookie = IOHIDElementGetCookie(v21);
      nullsub_1(Cookie);
      *(void *)(v40 + 48) = sub_18919AE8C();
      unint64_t v4 = sub_18919ADA8();
      swift_retain();
      uint64_t v42 = *(void *)(v40 + 32);
      uint64_t v43 = *(void *)(v40 + 40);
      uint64_t v44 = *(void *)(v40 + 48);
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      unint64_t v45 = sub_189163EC4(v42, v43);
      if ((v46 & 1) != 0) {
        goto LABEL_29;
      }
      *(void *)(v4 + 8 * (v45 >> 6) + 64) |= 1LL << v45;
      int v47 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v45);
      *int v47 = v42;
      v47[1] = v43;
      *(void *)(*(void *)(v4 + 56) + 8 * v45) = v44;
      uint64_t v48 = *(void *)(v4 + 16);
      BOOL v8 = __OFADD__(v48, 1LL);
      uint64_t v49 = v48 + 1;
      if (v8) {
        goto LABEL_30;
      }
      *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v49;
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v51 = *(void *)(v1 + 16);
      unint64_t v50 = *(void *)(v1 + 24);
      if (v51 >= v50 >> 1) {
        uint64_t v1 = (uint64_t)sub_1891957F4((void *)(v50 > 1), v51 + 1, 1, (void *)v1);
      }
      uint64_t v10 = v13;
      *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v51 + 1;
      *(void *)(v1 + 8 * v51 + 32) = v4;
      sub_18915EBC8((uint64_t)v62);
      if (!v61)
      {
        swift_release();
        swift_bridgeObjectRelease();
        uint64_t i = v56;
        unint64_t v4 = v57;
        goto LABEL_5;
      }

      --v61;
    }

    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    ;
  }

LABEL_34:
  swift_bridgeObjectRelease();
  uint64_t v52 = *(__IOHIDDevice **)(v54 + 296);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB40);
  uint64_t v53 = (const __CFArray *)sub_18919AAB4();
  swift_bridgeObjectRelease();
  IOHIDDeviceSetInputValueMatchingMultiple(v52, v53);
}

uint64_t sub_18918A754(char a1, char a2)
{
  if ((a2 & 1) != 0) {
    (*((void (**)(void))*v2 + 99))();
  }
  uint64_t result = (*((uint64_t (**)(void))*v2 + 88))();
  if ((result & 1) == 0)
  {
    (*((void (**)(void))*v2 + 98))();
    uint64_t v5 = a1 & 1;
    uint64_t v6 = IOHIDDeviceOpen(v2[37], v5);
    sub_189185BBC(v6, (uint64_t)&v9);
    if ((v11 & 1) != 0)
    {
      (*((void (**)(uint64_t))*v2 + 89))(1LL);
      return (*((uint64_t (**)(uint64_t))*v2 + 92))(v5);
    }

    else
    {
      unint64_t v7 = v9 | ((unint64_t)v10 << 32);
      char v11 = 0;
      sub_189195914();
      if ((sub_18919AA60() & 1) != 0) {
        (*((void (**)(uint64_t))*v2 + 89))(1LL);
      }
      sub_189165504();
      swift_allocError();
      *(_DWORD *)uint64_t v8 = v7;
      *(_BYTE *)(v8 + 4) = BYTE4(v7) & 1;
      return swift_willThrow();
    }
  }

  return result;
}

uint64_t sub_18918A8A4()
{
  uint64_t result = (*((uint64_t (**)(void))*v0 + 88))();
  if ((result & 1) != 0)
  {
    uint64_t result = (*((uint64_t (**)(void))*v0 + 91))();
    if ((result & 1) == 0)
    {
      unint64_t v2 = (*((uint64_t (**)(void))*v0 + 94))();
      if (!(v2 >> 62))
      {
        uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFF8LL) + 0x10);
        uint64_t result = swift_bridgeObjectRelease();
        if (v3) {
          return result;
        }
LABEL_7:
        IOHIDDeviceClose(v0[37], 0);
        (*((void (**)(void))*v0 + 89))(0LL);
        return (*((uint64_t (**)(void))*v0 + 92))(0LL);
      }

      uint64_t v4 = sub_18919AD78();
      uint64_t result = swift_bridgeObjectRelease();
      if (!v4) {
        goto LABEL_7;
      }
    }
  }

  return result;
}

void sub_18918A968()
{
  if (((*(uint64_t (**)(void))(*(void *)v0 + 704LL))() & 1) != 0)
  {
    sub_189165504();
    swift_allocError();
    *(_DWORD *)uint64_t v2 = 6;
    *(_BYTE *)(v2 + 4) = 1;
    swift_willThrow();
  }

  else
  {
    (*(void (**)(uint64_t, void))(*(void *)v0 + 800LL))(1LL, 0LL);
    if (v1)
    {
      id v3 = v1;
      __swift_instantiateConcreteTypeFromMangledName(qword_18C77A970);
      if (swift_dynamicCast() && v6 == 1 && v5 == 3)
      {

        (*(void (**)(void))(*(void *)v0 + 808LL))();
        sub_189165504();
        swift_allocError();
        *(_DWORD *)uint64_t v4 = 3;
        *(_BYTE *)(v4 + 4) = 1;
        swift_willThrow();
      }
    }
  }

uint64_t sub_18918AABC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a1, v3, v4);
}

uint64_t sub_18918AB04()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_18918AB14()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_18918AB24()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_18918AB6C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_batchedValues);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_18918ABBC())()
{
  return j__swift_endAccess;
}

uint64_t sub_18918AC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_batchedValues) = MEMORY[0x18961AFE8];
  uint64_t v7 = v6 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v7, a1, v8);
  *(void *)(v6 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_reportIDsToMonitor) = a2;
  *(void *)(v6 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor) = a3;
  return v6;
}

uint64_t sub_18918ACA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_batchedValues) = MEMORY[0x18961AFE8];
  uint64_t v7 = v3 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32LL))(v7, a1, v8);
  *(void *)(v3 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_reportIDsToMonitor) = a2;
  *(void *)(v3 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor) = a3;
  return v3;
}

uint64_t sub_18918AD3C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_18918ADB4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_18918AE38(uint64_t a1)
{
  uint64_t v91 = a1;
  uint64_t v2 = type metadata accessor for HIDElement.Value();
  uint64_t v103 = *(void *)(v2 - 8);
  uint64_t v3 = MEMORY[0x1895F8858](v2);
  uint64_t v86 = (uint64_t)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v3);
  uint64_t v6 = (char *)&v77 - v5;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB58);
  uint64_t v98 = *(void *)(v7 - 8);
  uint64_t v99 = v7;
  MEMORY[0x1895F8858](v7);
  uint64_t v97 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v94 = type metadata accessor for HIDDeviceClient.Notification(0LL);
  uint64_t v9 = MEMORY[0x1895F8858](v94);
  uint64_t v96 = (uint64_t *)((char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = MEMORY[0x1895F8858](v9);
  uint64_t v90 = (unsigned __int8 *)&v77 - v12;
  uint64_t v13 = *(uint64_t (**)(uint64_t))(*(void *)v1 + 752LL);
  uint64_t v78 = v1;
  unint64_t v14 = v13(v11);
  unint64_t v84 = v14;
  if (v14 >> 62) {
    goto LABEL_54;
  }
  uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v15)
  {
    unint64_t v16 = 0LL;
    unint64_t v83 = v14 & 0xC000000000000001LL;
    unint64_t v79 = v14 + 32;
    uint64_t v80 = v14 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v85 = (char *)v142 + 1;
    char v87 = v6;
    uint64_t v82 = v15;
    while (!v83)
    {
      if (v16 >= *(void *)(v80 + 16)) {
        goto LABEL_53;
      }
      uint64_t v18 = *(void *)(v79 + 8 * v16);
      swift_retain();
      BOOL v19 = __OFADD__(v16++, 1LL);
      if (v19) {
        goto LABEL_52;
      }
LABEL_12:
      sub_18919596C(v91, (uint64_t)v90, type metadata accessor for HIDDeviceClient.Notification);
      int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      if (EnumCaseMultiPayload != 2)
      {
        unint64_t v93 = v16;
        uint64_t v101 = v18;
        if (EnumCaseMultiPayload != 1)
        {
          if (EnumCaseMultiPayload)
          {
            sub_18919596C(v91, (uint64_t)v96, type metadata accessor for HIDDeviceClient.Notification);
            __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
            __int128 v17 = v97;
            sub_18919AB38();
            swift_release();
            (*(void (**)(char *, uint64_t))(v98 + 8))(v17, v99);
            sub_1891959B0((uint64_t)v90, type metadata accessor for HIDDeviceClient.Notification);
          }

          else
          {
            unsigned __int8 v21 = *v90;
            unsigned __int8 v22 = v90[1];
            sub_18915EC78(*((void *)v90 + 1), *((void *)v90 + 2));
            if ((v22 & 1) != 0)
            {
              sub_18919596C(v91, (uint64_t)v96, type metadata accessor for HIDDeviceClient.Notification);
              __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
              uint64_t v23 = v97;
              sub_18919AB38();
              swift_release();
              (*(void (**)(char *, uint64_t))(v98 + 8))(v23, v99);
            }

            else
            {
              uint64_t v66 = *(void *)(v18 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_reportIDsToMonitor);
              uint64_t v67 = *(void *)(v66 + 16);
              if (v67)
              {
                sub_1891959EC();
                swift_bridgeObjectRetain();
                uint64_t v118 = v66;
                uint64_t v68 = (char *)(v66 + 33);
                do
                {
                  char v69 = *(v68 - 1);
                  char v70 = *v68;
                  LOBYTE(v119) = v21;
                  LOBYTE(vsub_18915E1E0(v0 + 144) = v69;
                  BYTE1(vsub_18915E1E0(v0 + 144) = v70;
                  char v71 = sub_18919AA48();
                  unsigned __int8 v158 = v21;
                  LOBYTE(v142[0]) = v69;
                  BYTE1(v142[0]) = v70;
                  if ((v71 & 1) != 0 && (sub_18919AA54() & 1) != 0)
                  {
                    sub_18919596C(v91, (uint64_t)v96, type metadata accessor for HIDDeviceClient.Notification);
                    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
                    uint64_t v72 = v97;
                    sub_18919AB38();
                    (*(void (**)(char *, uint64_t))(v98 + 8))(v72, v99);
                  }

                  v68 += 2;
                  --v67;
                }

                while (v67);
                swift_bridgeObjectRelease();
                swift_release();
                uint64_t v6 = v87;
                unint64_t v16 = v93;
              }

              else
              {
                swift_release();
              }
            }

            uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB60);
            uint64_t v74 = &v90[*(int *)(v73 + 64)];
            uint64_t v75 = sub_18919ACC4();
            (*(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v75 - 8) + 8LL))(v74, v75);
          }

          goto LABEL_5;
        }

        uint64_t v25 = *(void *)v90;
        uint64_t v104 = *(void *)(*(void *)v90 + 16LL);
        if (v104)
        {
          unint64_t v26 = 0LL;
          uint64_t v95 = OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor;
          uint64_t v88 = v25;
          uint64_t v89 = v18 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation;
          unint64_t v81 = (*(unsigned __int8 *)(v103 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v103 + 80);
          uint64_t v102 = v25 + v81;
          do
          {
            if (v26 >= *(void *)(v25 + 16))
            {
              __break(1u);
              goto LABEL_52;
            }

            uint64_t v27 = *(void *)(v103 + 72);
            uint64_t v28 = sub_18919596C( v102 + v27 * v26,  (uint64_t)v6,  (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
            if (v6[104] == 1)
            {
              uint64_t v29 = *(uint64_t (**)(uint64_t))(*(void *)v18 + 112LL);
              uint64_t v30 = *(void *)(v29(v28) + 16);
              uint64_t v31 = swift_bridgeObjectRelease();
              if (v30)
              {
                uint64_t v32 = v29(v31);
                *uint64_t v96 = v32;
                swift_storeEnumTagMultiPayload();
                __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
                unint64_t v33 = v97;
                sub_18919AB38();
                (*(void (**)(char *, uint64_t))(v98 + 8))(v33, v99);
                char v34 = (void (*)(__int128 *, void))(*(uint64_t (**)(__int128 *))(*(void *)v18 + 128LL))(&v144);
                *uint64_t v35 = MEMORY[0x18961AFE8];
                swift_bridgeObjectRelease();
                v34(&v144, 0LL);
              }
            }

            else
            {
              uint64_t v36 = *(void *)(v18 + v95);
              uint64_t v37 = *(void *)(v36 + 16);
              if (v37)
              {
                uint64_t v92 = v27;
                unint64_t v100 = v26;
                uint64_t v118 = *(void *)v6;
                int v117 = v6[8];
                unint64_t v38 = *(unsigned int *)(v6 + 10) | ((unint64_t)v6[14] << 32);
                int v116 = v6[15];
                char v39 = v6[16];
                uint64_t v40 = *(void *)(v6 + 20);
                char v41 = v6[28];
                int v115 = v6[29];
                char v42 = v6[30];
                uint64_t v114 = *((void *)v6 + 4);
                char v43 = v6[40];
                uint64_t v44 = *((void *)v6 + 6);
                char v45 = v6[56];
                uint64_t v112 = *((void *)v6 + 8);
                uint64_t v113 = v44;
                char v46 = v6[72];
                uint64_t v111 = *((void *)v6 + 10);
                LOBYTE(v44) = v6[88];
                uint64_t v110 = *((void *)v6 + 12);
                int v109 = v6[105];
                uint64_t v108 = *((void *)v6 + 14);
                char v47 = v6[120];
                unsigned __int8 v158 = v39;
                unsigned __int8 v157 = v41;
                unsigned __int8 v156 = v42;
                char v155 = v43;
                char v154 = v45;
                char v153 = v46;
                char v152 = v44;
                char v151 = v47;
                swift_bridgeObjectRetain();
                __int128 v48 = *(_OWORD *)(v36 + 112);
                __int128 v148 = *(_OWORD *)(v36 + 96);
                __int128 v149 = v48;
                v150[0] = *(_OWORD *)(v36 + 128);
                *(_OWORD *)((char *)v150 + 9) = *(_OWORD *)(v36 + 137);
                __int128 v49 = *(_OWORD *)(v36 + 48);
                __int128 v144 = *(_OWORD *)(v36 + 32);
                __int128 v145 = v49;
                __int128 v50 = *(_OWORD *)(v36 + 80);
                __int128 v146 = *(_OWORD *)(v36 + 64);
                __int128 v147 = v50;
                int v106 = v157;
                int v107 = v158;
                int v105 = v156;
                char v51 = v155;
                char v52 = v154;
                char v53 = v153;
                char v54 = v152;
                uint64_t v55 = v37 - 1;
                uint64_t v56 = 160LL;
                char v57 = v151;
                while (1)
                {
                  v142[4] = v148;
                  v142[5] = v149;
                  v143[0] = v150[0];
                  *(_OWORD *)((char *)v143 + 9) = *(_OWORD *)((char *)v150 + 9);
                  v142[0] = v144;
                  v142[1] = v145;
                  v142[2] = v146;
                  v142[3] = v147;
                  uint64_t v119 = v118;
                  char v120 = v117;
                  char v122 = BYTE4(v38);
                  int v121 = v38;
                  char v123 = v116;
                  char v124 = v107;
                  uint64_t v125 = v40;
                  char v126 = v106;
                  char v127 = v115;
                  char v128 = v105;
                  uint64_t v129 = v114;
                  char v130 = v51;
                  uint64_t v131 = v113;
                  char v132 = v52;
                  uint64_t v133 = v112;
                  char v134 = v53;
                  uint64_t v135 = v111;
                  char v136 = v54;
                  uint64_t v137 = v110;
                  char v138 = 0;
                  char v139 = v109;
                  uint64_t v140 = v108;
                  char v141 = v57;
                  if (!v55)
                  {
                    swift_bridgeObjectRelease();
                    uint64_t v6 = v87;
                    uint64_t v25 = v88;
                    unint64_t v16 = v93;
                    unint64_t v26 = v100;
                    uint64_t v18 = v101;
                    goto LABEL_22;
                  }

                  __int128 v148 = *(_OWORD *)(v36 + v56 + 64);
                  __int128 v149 = *(_OWORD *)(v36 + v56 + 80);
                  v150[0] = *(_OWORD *)(v36 + v56 + 96);
                  *(_OWORD *)((char *)v150 + 9) = *(_OWORD *)(v36 + v56 + 105);
                  __int128 v144 = *(_OWORD *)(v36 + v56);
                  __int128 v145 = *(_OWORD *)(v36 + v56 + 16);
                  __int128 v146 = *(_OWORD *)(v36 + v56 + 32);
                  __int128 v147 = *(_OWORD *)(v36 + v56 + 48);
                  v56 += 128LL;
                  --v55;
                }

                swift_bridgeObjectRelease();
                uint64_t v6 = v87;
                sub_18919596C( (uint64_t)v87,  v86,  (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
                unint64_t v58 = (void (*)(_OWORD *, void))(*(uint64_t (**)(_OWORD *))(*(void *)v101
                                                                                                 + 128LL))(v142);
                uint64_t v60 = v59;
                uint64_t v61 = *v59;
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                *uint64_t v60 = v61;
                if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                {
                  uint64_t v61 = (void *)sub_189195680(0LL, v61[2] + 1LL, 1, v61);
                  *uint64_t v60 = v61;
                }

                unint64_t v64 = v61[2];
                unint64_t v63 = v61[3];
                if (v64 >= v63 >> 1)
                {
                  uint64_t v61 = (void *)sub_189195680(v63 > 1, v64 + 1, 1, v61);
                  *uint64_t v60 = v61;
                }

                uint64_t v65 = v92;
                unint64_t v16 = v93;
                v61[2] = v64 + 1;
                sub_189198824( v86,  (uint64_t)v61 + v81 + v64 * v65,  (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
                v58(v142, 0LL);
                sub_1891959B0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
                unint64_t v26 = v100;
                uint64_t v18 = v101;
                uint64_t v25 = v88;
                goto LABEL_23;
              }
            }

uint64_t sub_18918B85C(uint64_t a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = (*(uint64_t (**)(void))(*(void *)v1 + 752LL))();
  swift_retain();
  unint64_t v5 = sub_18919852C(v4, a1);
  char v7 = v6;
  swift_bridgeObjectRelease();
  uint64_t result = swift_release();
  if ((v7 & 1) != 0)
  {
    __break(1u);
  }

  else
  {
    uint64_t v9 = (uint64_t (*)(_BYTE *, void))(*(uint64_t (**)(_BYTE *))(*(void *)v2 + 768LL))(v11);
    sub_18918B920(v5);
    swift_release();
    uint64_t v10 = v9(v11, 0LL);
    return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 808LL))(v10);
  }

  return result;
}

uint64_t sub_18918B920(unint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!(_DWORD)result || (v3 & 0x8000000000000000LL) != 0 || (v3 & 0x4000000000000000LL) != 0) {
    sub_18919602C(v3);
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8LL;
  unint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  if (v6 <= a1)
  {
    __break(1u);
  }

  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v5 + 8 * a1;
    uint64_t v9 = *(void *)(v8 + 32);
    memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * (v6 - 1 - a1));
    *(void *)(v5 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v7;
    sub_18919AAC0();
    return v9;
  }

  return result;
}

uint64_t sub_18918B9B4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB70);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  uint64_t v13 = v2;
  type metadata accessor for HIDDeviceClient.Notification(0LL);
  (*(void (**)(_BYTE *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x18961BE60], v5);
  return sub_18919AB5C();
}

uint64_t sub_18918BA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v20 = type metadata accessor for HIDDeviceClient.Notification(0LL);
  MEMORY[0x1895F8858](v20);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB58);
  v19[1] = *(void *)(v21 - 8);
  MEMORY[0x1895F8858](v21);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB50);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  type metadata accessor for HIDDeviceClient.StreamWrapper(0LL);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_batchedValues) = MEMORY[0x18961AFE8];
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))( v12 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_continuation,  v11,  v8);
  *(void *)(v12 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_reportIDsToMonitor) = a2;
  *(void *)(v12 + OBJC_IVAR____TtCC7CoreHID15HIDDeviceClient13StreamWrapper_elementsToMonitor) = a3;
  uint64_t v13 = *(uint64_t (**)(void *))(*(void *)a4 + 768LL);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  unint64_t v14 = (void (*)(void *, void))v13(v22);
  unint64_t v16 = v15;
  MEMORY[0x1895E1454]();
  if (*(void *)((*v16 & 0xFFFFFFFFFFFFFF8LL) + 0x10) >= *(void *)((*v16 & 0xFFFFFFFFFFFFFF8LL) + 0x18) >> 1) {
    sub_18919AACC();
  }
  sub_18919AAD8();
  sub_18919AAC0();
  v14(v22, 0LL);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a4;
  *(void *)(v17 + 24) = v12;
  swift_retain();
  swift_retain();
  sub_18919AB2C();
  (*(void (**)(void, uint64_t))(*(void *)a4 + 800LL))(0LL, 1LL);
  return swift_release();
}

uint64_t sub_18918BDC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A800);
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_18919AB20();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v6, 1LL, 1LL, v7);
  uint64_t v8 = (void *)swift_allocObject();
  void v8[2] = 0LL;
  v8[3] = 0LL;
  v8[4] = a1;
  v8[5] = a2;
  swift_retain();
  swift_retain();
  sub_1891626B4((uint64_t)v6, (uint64_t)&unk_18C77B368, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_18918BE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5[2] = a4;
  v5[3] = a5;
  v5[4] = *(void *)(*(void *)a4 + 832LL);
  return swift_task_switch();
}

uint64_t sub_18918BEB8()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t HIDDeviceClient.UnsafeProperty.unsafeObject.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_18918BEF4@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

void *sub_18918BEFC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr, void, void))(**(void **)a1 + 848LL))(&v5, *a2, a2[1]);
  *a3 = v5;
  return result;
}

uint64_t sub_18918BF40(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  uint64_t v4 = a3[1];
  uint64_t v5 = *a2;
  uint64_t v8 = *a1;
  uint64_t v6 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(void *)v5 + 856LL);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return v6(&v8, v3, v4);
}

void sub_18918BF9C(void *a1@<X8>)
{
  uint64_t v3 = *(__IOHIDDevice **)(v1 + 296);
  uint64_t v4 = (__CFString *)sub_18919AA6C();
  CFTypeRef v5 = (id)IOHIDDeviceGetProperty(v3, v4);

  *a1 = v5;
}

uint64_t sub_18918BFEC()
{
  uint64_t v1 = *(__IOHIDDevice **)(v0 + 296);
  uint64_t v2 = (__CFString *)sub_18919AA6C();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C77AB78);
  uint64_t v3 = (const void *)sub_18919ABC8();
  swift_unknownObjectRelease();
  IOHIDDeviceSetProperty(v1, v2, v3);

  return swift_unknownObjectRelease();
}

void (*sub_18918C080(void *a1, uint64_t a2, uint64_t a3))(uint64_t **a1, char a2)
{
  uint64_t v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[2] = a2;
  v7[3] = a3;
  uint64_t v8 = *(__IOHIDDevice **)(v3 + 296);
  v7[4] = v8;
  uint64_t v9 = (__CFString *)sub_18919AA6C();
  CFTypeRef v10 = (id)IOHIDDeviceGetProperty(v8, v9);

  *uint64_t v7 = v10;
  return sub_18918C10C;
}

void sub_18918C10C(uint64_t **a1, char a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a1 + 1;
  uint64_t v4 = **a1;
  CFTypeRef v5 = (__IOHIDDevice *)(*a1)[4];
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v6 = (__CFString *)sub_18919AA6C();
    swift_bridgeObjectRelease();
    v2[1] = v4;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C77AB78);
    uint64_t v7 = (const void *)sub_18919ABC8();
    swift_unknownObjectRelease();
    IOHIDDeviceSetProperty(v5, v6, v7);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }

  else
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = (__CFString *)sub_18919AA6C();
    swift_bridgeObjectRelease();
    *uint64_t v3 = v4;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C77AB78);
    uint64_t v9 = (const void *)sub_18919ABC8();
    swift_unknownObjectRelease();
    IOHIDDeviceSetProperty(v5, v8, v9);
    swift_unknownObjectRelease();
  }

  free(v2);
}

uint64_t sub_18918C21C(_BYTE *a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  *(void *)(v8 + 48) = a6;
  *(void *)(v8 + 56) = v7;
  *(_BYTE *)(v8 + 101) = a7;
  *(void *)(v8 + 32) = a4;
  *(void *)(v8 + 40) = a5;
  *(void *)(v8 + 24) = a3;
  *(_BYTE *)(v8 + 102) = *a1;
  *(_BYTE *)(v8 + 103) = *a2;
  *(_BYTE *)(v8 + 104) = a2[1];
  return swift_task_switch();
}

uint64_t sub_18918C258()
{
  __int16 v12 = *(_WORD *)(v0 + 102);
  char v13 = *(_BYTE *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  char v3 = *(_BYTE *)(v0 + 101);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = *(void *)(v0 + 40);
  uint64_t v6 = *(void *)(v0 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4E0);
  uint64_t v7 = swift_slowAlloc();
  *(void *)(v0 + 64) = v7;
  sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v8,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  uint64_t v9 = swift_task_alloc();
  *(void *)(v0 + 72) = v9;
  *(void *)(v9 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v7;
  *(void *)(v9 + 24) = v5;
  *(void *)(v9 + 32) = v2;
  *(_BYTE *)(v9 + 40) = v3 & 1;
  *(void *)(v9 + 48) = v6;
  *(void *)(v9 + 56) = v4;
  *(void *)(v9 + 64) = v1;
  *(_WORD *)(v9 + 72) = v12;
  *(_BYTE *)(v9 + 74) = v13;
  CFTypeRef v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v10;
  void *v10 = v0;
  v10[1] = sub_18918C498;
  return sub_18919ADD8();
}

uint64_t sub_18918C498()
{
  *(void *)(*(void *)v1 + 88LL) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_18918C50C()
{
  uint64_t v1 = *(void *)(v0 + 64);
  (*(void (**)(void))(**(void **)(v0 + 56) + 808LL))();
  MEMORY[0x1895E1F64](v1, -1LL, -1LL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_18918C558()
{
  uint64_t v1 = *(void *)(v0 + 64);
  swift_task_dealloc();
  MEMORY[0x1895E1F64](v1, -1LL, -1LL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_18918C59C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4E0);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 24LL))(a2, a1, v11);
  if ((a5 & 1) == 0)
  {
    sub_18919AE98();
    uint64_t v12 = sub_18919AE98();
  }

  MEMORY[0x1895F8858](v12);
  __asm { BR              X10 }

void sub_18918C6C0()
{
  *(void *)(v5 - 128) = v0;
  *(_WORD *)(v5 - 120) = v1;
  *(_BYTE *)(v5 - 118) = BYTE2(v1);
  *(_BYTE *)(v5 - 117) = BYTE3(v1);
  *(_BYTE *)(v5 - 1__swift_destroy_boxed_opaque_existential_1(v0 + 16) = BYTE4(v1);
  *(_BYTE *)(v5 - 115) = BYTE5(v1);
  sub_18918C844(v5 - 128, v2, v3, v4 & 0x1FF, v0, v1);
}

void sub_18918C844(uint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned __int8 v8 = a3;
  sub_18915F9F4(&v8);
  if (a1) {
    __asm { BR              X12 }
  }

  __break(1u);
  JUMPOUT(0x18918C998LL);
}

uint64_t sub_18918C9A8(uint64_t a1, uint64_t a2)
{
  return sub_189163088(a1, a2);
}

uint64_t sub_18918C9BC(_BYTE *a1, _BYTE *a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 48) = a4;
  *(void *)(v6 + 56) = v5;
  *(_BYTE *)(v6 + 117) = a5;
  *(void *)(v6 + 40) = a3;
  *(_BYTE *)(v6 + 118) = *a1;
  *(_BYTE *)(v6 + 119) = *a2;
  *(_BYTE *)(v6 + 120) = a2[1];
  return swift_task_switch();
}

uint64_t sub_18918C9F4()
{
  __int16 v12 = *(_WORD *)(v0 + 118);
  char v13 = *(_BYTE *)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v1 = *(void *)(v0 + 56);
  char v3 = *(_BYTE *)(v0 + 117);
  uint64_t v4 = *(void *)(v0 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB98);
  uint64_t v5 = swift_slowAlloc();
  *(void *)(v0 + 64) = v5;
  uint64_t v6 = swift_slowAlloc();
  *(void *)(v0 + 72) = v6;
  uint64_t v7 = swift_slowAlloc();
  *(void *)(v0 + 80) = v7;
  sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v8,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  uint64_t v9 = swift_task_alloc();
  *(void *)(v0 + 88) = v9;
  *(void *)(v9 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
  *(void *)(v9 + 24) = v6;
  *(void *)(v9 + 32) = v1;
  *(void *)(v9 + 40) = v4;
  *(void *)(v9 + 48) = v2;
  *(_BYTE *)(v9 + 56) = v3 & 1;
  *(_WORD *)(v9 + 57) = v12;
  *(_BYTE *)(v9 + 59) = v13;
  *(void *)(v9 + 64) = v7;
  CFTypeRef v10 = (void *)swift_task_alloc();
  *(void *)(v0 + 96) = v10;
  void *v10 = v0;
  v10[1] = sub_18918CC64;
  return sub_18919ADD8();
}

uint64_t sub_18918CC64()
{
  *(void *)(*(void *)v1 + 104LL) = v0;
  swift_task_dealloc();
  if (!v0) {
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_18918CCD8()
{
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = *(void *)(v0 + 24);
  (*(void (**)(void))(**(void **)(v0 + 56) + 808LL))();
  MEMORY[0x1895E1F64](v3, -1LL, -1LL);
  MEMORY[0x1895E1F64](v2, -1LL, -1LL);
  MEMORY[0x1895E1F64](v1, -1LL, -1LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v5);
}

uint64_t sub_18918CD64()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v2 = *(void *)(v0 + 72);
  swift_task_dealloc();
  MEMORY[0x1895E1F64](v3, -1LL, -1LL);
  MEMORY[0x1895E1F64](v2, -1LL, -1LL);
  MEMORY[0x1895E1F64](v1, -1LL, -1LL);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_18918CDD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6, uint64_t a7)
{
}

uint64_t HIDDeviceClient.ProvideElementUpdate.values.getter()
{
  return sub_18918D4E8((void (*)(void))type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
}

uint64_t HIDDeviceClient.ProvideElementUpdate.values.setter(uint64_t a1)
{
  return sub_18918D518(a1, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
}

uint64_t (*HIDDeviceClient.ProvideElementUpdate.values.modify())(void)
{
  return nullsub_1;
}

uint64_t HIDDeviceClient.ProvideElementUpdate.init(values:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL);
  *(void *)(a2 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t HIDDeviceClient.ProvideElementUpdate.hash(into:)()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL) + 20));
  uint64_t v2 = *(void *)(v1 + 16);
  uint64_t result = sub_18919AE44();
  if (v2)
  {
    uint64_t v4 = *(void *)(type metadata accessor for HIDElement.Value() - 8);
    uint64_t v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    sub_1891646EC( &qword_18C77ABA0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value,  (uint64_t)&protocol conformance descriptor for HIDElement.Value);
    swift_bridgeObjectRetain();
    do
    {
      sub_18919AA24();
      v5 += v6;
      --v2;
    }

    while (v2);
    return swift_bridgeObjectRelease();
  }

  return result;
}

uint64_t static HIDDeviceClient.ProvideElementUpdate.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_18919ACB8() & 1) == 0) {
    return 0LL;
  }
  uint64_t v4 = *(int *)(type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL) + 20);
  return sub_18918D0BC(*(void *)(a1 + v4), *(void *)(a2 + v4));
}

uint64_t sub_18918CFC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 == *(void *)(a2 + 16))
  {
    if (!v2 || a1 == a2)
    {
      char v7 = 1;
    }

    else
    {
      uint64_t v3 = a1 + 32;
      uint64_t v4 = a2 + 32;
      sub_18915F638();
      uint64_t v5 = v2 - 1;
      do
      {
        uint64_t v6 = v5;
        char v7 = sub_18919AA60();
        if ((v7 & 1) == 0) {
          break;
        }
        uint64_t v5 = v6 - 1;
        v3 += 128LL;
        v4 += 128LL;
      }

      while (v6);
    }
  }

  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

uint64_t sub_18918D0BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for HIDElement.Value();
  MEMORY[0x1895F8858](v4);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v7);
  CFTypeRef v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 == *(void *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      char v15 = 1;
    }

    else
    {
      unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      uint64_t v13 = *(void *)(v8 + 72);
      uint64_t v14 = v11 - 1;
      do
      {
        sub_18919596C( a1 + v12,  (uint64_t)v10,  (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
        sub_18919596C( a2 + v12,  (uint64_t)v6,  (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
        sub_1891646EC( &qword_18C77A3B0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value,  (uint64_t)&protocol conformance descriptor for HIDElement.Value);
        char v15 = sub_18919AA60();
        sub_1891959B0((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
        sub_1891959B0((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
        BOOL v17 = v14-- != 0;
        if ((v15 & 1) == 0) {
          break;
        }
        v12 += v13;
      }

      while (v17);
    }
  }

  else
  {
    char v15 = 0;
  }

  return v15 & 1;
}

uint64_t HIDDeviceClient.ProvideElementUpdate.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL) + 20));
  uint64_t v2 = *(void *)(v1 + 16);
  sub_18919AE44();
  if (v2)
  {
    uint64_t v3 = *(void *)(type metadata accessor for HIDElement.Value() - 8);
    uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v5 = *(void *)(v3 + 72);
    sub_1891646EC( &qword_18C77ABA0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value,  (uint64_t)&protocol conformance descriptor for HIDElement.Value);
    swift_bridgeObjectRetain();
    do
    {
      sub_18919AA24();
      v4 += v5;
      --v2;
    }

    while (v2);
    swift_bridgeObjectRelease();
  }

  return sub_18919AE74();
}

uint64_t sub_18918D340(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + *(int *)(a2 + 20));
  uint64_t v5 = *(void *)(v4 + 16);
  sub_18919AE44();
  if (v5)
  {
    uint64_t v6 = *(void *)(type metadata accessor for HIDElement.Value() - 8);
    uint64_t v7 = v4 + ((*(unsigned __int8 *)(v6 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    uint64_t v8 = *(void *)(v6 + 72);
    sub_1891646EC( &qword_18C77ABA0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value,  (uint64_t)&protocol conformance descriptor for HIDElement.Value);
    swift_bridgeObjectRetain();
    do
    {
      sub_18919AA24();
      v7 += v8;
      --v5;
    }

    while (v5);
    swift_bridgeObjectRelease();
  }

  return sub_18919AE74();
}

uint64_t sub_18918D450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_18919ACB8() & 1) != 0) {
    return sub_18918D0BC(*(void *)(a1 + *(int *)(a3 + 20)), *(void *)(a2 + *(int *)(a3 + 20)));
  }
  else {
    return 0LL;
  }
}

uint64_t sub_18918D4A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_18919ACC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

uint64_t HIDDeviceClient.RequestElementUpdate.elements.getter()
{
  return sub_18918D4E8((void (*)(void))type metadata accessor for HIDDeviceClient.RequestElementUpdate);
}

uint64_t sub_18918D4E8(void (*a1)(void))
{
  return swift_bridgeObjectRetain();
}

uint64_t HIDDeviceClient.RequestElementUpdate.elements.setter(uint64_t a1)
{
  return sub_18918D518(a1, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
}

uint64_t sub_18918D518(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = *(int *)(a2(0LL) + 20);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v2 + sub_18915EC78(v3, v4) = a1;
  return result;
}

uint64_t (*HIDDeviceClient.RequestElementUpdate.elements.modify())(void)
{
  return nullsub_1;
}

uint64_t HIDDeviceClient.RequestElementUpdate.pollDevice.getter()
{
  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL) + 24));
}

uint64_t HIDDeviceClient.RequestElementUpdate.pollDevice.setter(char a1)
{
  uint64_t result = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL);
  *(_BYTE *)(v1 + *(int *)(result + (*(void (**)(void))(v0 + 32))(*(void *)(v0 + 24)) = a1;
  return result;
}

uint64_t (*HIDDeviceClient.RequestElementUpdate.pollDevice.modify())(void)
{
  return nullsub_1;
}

uint64_t sub_18918D5F0()
{
  return 1LL;
}

uint64_t HIDDeviceClient.RequestElementUpdate.init(elements:pollDevice:)@<X0>( uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t result = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL);
  *(void *)(a3 + *(int *)(result + 20)) = a1;
  *(_BYTE *)(a3 + *(int *)(result + (*(void (**)(void))(v0 + 32))(*(void *)(v0 + 24)) = a2;
  return result;
}

uint64_t HIDDeviceClient.RequestElementUpdate.hash(into:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + *(int *)(type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL) + 20));
  swift_bridgeObjectRetain();
  sub_189197B94(a1, v3);
  swift_bridgeObjectRelease();
  return sub_18919AE50();
}

uint64_t static HIDDeviceClient.RequestElementUpdate.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((sub_18919ACB8() & 1) != 0
    && (uint64_t v4 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL),
        (sub_18918CFC4(*(void *)(a1 + *(int *)(v4 + 20)), *(void *)(a2 + *(int *)(v4 + 20))) & 1) != 0))
  {
    char v5 = *(_BYTE *)(a1 + *(int *)(v4 + 24)) ^ *(_BYTE *)(a2 + *(int *)(v4 + 24)) ^ 1;
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

uint64_t HIDDeviceClient.RequestElementUpdate.hashValue.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL) + 20));
  swift_bridgeObjectRetain();
  sub_189197B94((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  sub_18919AE50();
  return sub_18919AE74();
}

uint64_t sub_18918D810(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + *(int *)(a1 + 20));
  swift_bridgeObjectRetain();
  sub_189197B94((uint64_t)v5, v3);
  swift_bridgeObjectRelease();
  sub_18919AE50();
  return sub_18919AE74();
}

uint64_t sub_18918D8C0(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v2 + *(int *)(a2 + 20));
  swift_bridgeObjectRetain();
  sub_189197B94(a1, v5);
  swift_bridgeObjectRelease();
  return sub_18919AE50();
}

uint64_t sub_18918D958(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(v2 + *(int *)(a2 + 20));
  swift_bridgeObjectRetain();
  sub_189197B94((uint64_t)v6, v4);
  swift_bridgeObjectRelease();
  sub_18919AE50();
  return sub_18919AE74();
}

uint64_t sub_18918DA04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_18919ACB8() & 1) != 0
    && (sub_18918CFC4(*(void *)(a1 + *(int *)(a3 + 20)), *(void *)(a2 + *(int *)(a3 + 20))) & 1) != 0)
  {
    char v6 = *(_BYTE *)(a1 + *(int *)(a3 + 24)) ^ *(_BYTE *)(a2 + *(int *)(a3 + 24)) ^ 1;
  }

  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

unint64_t sub_18918DA74()
{
  return sub_189189360( MEMORY[0x18961AFE8],  &qword_18C77B358,  &qword_18C77B348,  (uint64_t (*)(char *))sub_1891952F0,  type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
}

uint64_t sub_18918DAB0()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_18918DAB8(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*sub_18918DAE0())()
{
  return nullsub_1;
}

unint64_t sub_18918DAF0()
{
  return sub_189189360( MEMORY[0x18961AFE8],  &qword_18C77B350,  &qword_18C77B328,  (uint64_t (*)(char *))sub_189195424,  type metadata accessor for HIDDeviceClient.RequestElementUpdate);
}

uint64_t sub_18918DB2C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_18918DB34(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + 8) = a1;
  return result;
}

uint64_t (*sub_18918DB5C())()
{
  return nullsub_1;
}

uint64_t sub_18918DB6C(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  id v41 = a2;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABA8);
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL);
  uint64_t v40 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v39 = (uint64_t)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  uint64_t v38 = (uint64_t)&v37 - v11;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABB0);
  MEMORY[0x1895F8858](v12);
  uint64_t v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x1895F8858](v15);
  uint64_t v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v19);
  uint64_t v21 = (char *)&v37 - v20;
  sub_1891646A8(a1, (uint64_t)v42);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C77ABB8);
  int v22 = swift_dynamicCast();
  uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  if (v22)
  {
    v23(v14, 0LL, 1LL, v15);
    uint64_t v24 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate;
    sub_189198824((uint64_t)v14, (uint64_t)v21, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    sub_18919596C((uint64_t)v21, (uint64_t)v18, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    uint64_t v25 = (uint64_t)v41;
    id v26 = v41;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v42[0] = *v3;
    *uint64_t v3 = 0x8000000000000000LL;
    sub_1891973D8(v25, 1, (uint64_t)v18, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v42[0];
    swift_bridgeObjectRelease();
    sub_1891959B0((uint64_t)v18, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    uint64_t v28 = (uint64_t)v21;
    return sub_1891959B0(v28, v24);
  }

  id v29 = v41;
  v23(v14, 1LL, 1LL, v15);
  sub_189160690((uint64_t)v14, &qword_18C77ABB0);
  sub_1891646A8(a1, (uint64_t)v42);
  char v30 = swift_dynamicCast();
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56);
  if ((v30 & 1) != 0)
  {
    v31(v7, 0LL, 1LL, v8);
    uint64_t v24 = type metadata accessor for HIDDeviceClient.RequestElementUpdate;
    uint64_t v32 = v38;
    sub_189198824((uint64_t)v7, v38, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    uint64_t v33 = v39;
    sub_18919596C(v32, v39, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    id v34 = v29;
    char v35 = swift_isUniquelyReferenced_nonNull_native();
    v42[0] = v3[1];
    v3[1] = 0x8000000000000000LL;
    sub_189197244((uint64_t)v29, 1, v33, v35);
    v3[1] = v42[0];
    swift_bridgeObjectRelease();
    sub_1891959B0(v33, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    uint64_t v28 = v32;
    return sub_1891959B0(v28, v24);
  }

  v31(v7, 1LL, 1LL, v8);
  return sub_189160690((uint64_t)v7, &qword_18C77ABA8);
}

id HIDDeviceClient.HIDElementUpdateResult.subscript.getter(uint64_t a1)
{
  uint64_t v2 = *v1;
  if (!*(void *)(v2 + 16)) {
    return 0LL;
  }
  unint64_t v3 = sub_1891952F0(a1);
  if ((v4 & 1) == 0) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(v2 + 56) + 16 * v3;
  id v6 = *(id *)v5;
  sub_189198868(*(id *)v5, *(_BYTE *)(v5 + 8));
  return v6;
}

{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  char v4;
  uint64_t v5;
  id v6;
  uint64_t v2 = *(void *)(v1 + 8);
  if (!*(void *)(v2 + 16)) {
    return 0LL;
  }
  unint64_t v3 = sub_189195424(a1);
  if ((v4 & 1) == 0) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(v2 + 56) + 16LL * (void)v3;
  id v6 = *(id *)v5;
  sub_189198874(*(id *)v5, *(_BYTE *)(v5 + 8));
  return v6;
}

unint64_t sub_18918DF98@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v2 = MEMORY[0x18961AFE8];
  unint64_t v3 = sub_189189360( MEMORY[0x18961AFE8],  &qword_18C77B358,  &qword_18C77B348,  (uint64_t (*)(char *))sub_1891952F0,  type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  unint64_t result = sub_189189360( v2,  &qword_18C77B350,  &qword_18C77B328,  (uint64_t (*)(char *))sub_189195424,  type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  *a1 = v3;
  a1[1] = result;
  return result;
}

uint64_t sub_18918E01C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t sub_18918E024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(void *)(v6 + 280) = a4;
  *(void *)(v6 + 288) = v5;
  *(_BYTE *)(v6 + 532) = a5;
  *(void *)(v6 + 264) = a2;
  *(void *)(v6 + 272) = a3;
  *(void *)(v6 + 256) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABA8);
  *(void *)(v6 + 296) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL);
  *(void *)(v6 + 304) = v7;
  *(void *)(v6 + 312) = *(void *)(v7 - 8);
  *(void *)(v6 + 320) = swift_task_alloc();
  *(void *)(v6 + 328) = swift_task_alloc();
  uint64_t v8 = type metadata accessor for HIDElement.Value();
  *(void *)(v6 + 336) = v8;
  *(void *)(v6 + 344) = *(void *)(v8 - 8);
  *(void *)(v6 + 352) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABB0);
  *(void *)(v6 + 360) = swift_task_alloc();
  uint64_t v9 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL);
  *(void *)(v6 + 368) = v9;
  *(void *)(v6 + 376) = *(void *)(v9 - 8);
  *(void *)(v6 + 384) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_18918E16C()
{
  char v1 = *(_BYTE *)(v0 + 532);
  uint64_t v2 = MEMORY[0x18961AFE8];
  unint64_t v3 = sub_189189360( MEMORY[0x18961AFE8],  &qword_18C77B358,  &qword_18C77B348,  (uint64_t (*)(char *))sub_1891952F0,  type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  unint64_t v4 = sub_189189360( v2,  &qword_18C77B350,  &qword_18C77B328,  (uint64_t (*)(char *))sub_189195424,  type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  *(void *)(v0 + 136) = v3;
  *(void *)(v0 + sub_18915E1E0(v0 + 144) = v4;
  double v5 = 0.0;
  if ((v1 & 1) == 0)
  {
    double v6 = (double)sub_18919AE98() * 1000.0;
    sub_18919AE98();
    double v5 = v6 + (double)v7 / 1000000.0;
  }

  *(double *)(v0 + 392) = v5;
  uint64_t v8 = *(void *)(v0 + 288);
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4E0);
  *(void *)(v0 + 400) = swift_slowAlloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABC8);
  *(void *)(v0 + 408) = swift_slowAlloc();
  *(void *)(v0 + 4__swift_destroy_boxed_opaque_existential_1(v0 + 16) = swift_slowAlloc();
  uint64_t v9 = 0LL;
  (*(void (**)(void, void))(*(void *)v8 + 800LL))(0LL, 0LL);
  *(void *)(v0 + 424) = 0LL;
  uint64_t v10 = *(void *)(*(void *)(v0 + 264) + 16LL);
  *(void *)(v0 + 432) = v10;
  if (!v10)
  {
LABEL_12:
    uint64_t v25 = *(void *)(v0 + 408);
    uint64_t v26 = *(void *)(v0 + 416);
    uint64_t v27 = *(void *)(v0 + 400);
    uint64_t v28 = *(void **)(v0 + 256);
    (*(void (**)(void))(**(void **)(v0 + 288) + 808LL))();
    uint64_t v29 = *(void *)(v0 + 144);
    *uint64_t v28 = *(void *)(v0 + 136);
    v28[1] = v29;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x1895E1F64](v27, -1LL, -1LL);
    MEMORY[0x1895E1F64](v25, -1LL, -1LL);
    MEMORY[0x1895E1F64](v26, -1LL, -1LL);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v11 = v0 + 16;
  uint64_t v12 = (uint64_t *)(v0 + 232);
  swift_bridgeObjectRetain();
  uint64_t v13 = 0LL;
  while (1)
  {
    *(void *)(v0 + 440) = v13;
    uint64_t v16 = *(void *)(v0 + 424);
    sub_1891646A8(*(void *)(v0 + 264) + 40 * v13 + 32, v11);
    if (v16)
    {
      id v14 = *(id *)(v0 + 424);
      swift_willThrow();
      uint64_t v15 = *(void **)(v0 + 424);
      sub_18918DB6C(v11, v15);

      __swift_destroy_boxed_opaque_existential_1(v11);
      goto LABEL_6;
    }

    uint64_t v17 = *(void *)(v0 + 376);
    sub_1891646A8(v11, v0 + 56);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C77ABB8);
    int v18 = swift_dynamicCast();
    uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56);
    if (v18) {
      break;
    }
    uint64_t v20 = *(void *)(v0 + 360);
    uint64_t v21 = *(void *)(v0 + 312);
    v19(v20, 1LL, 1LL, *(void *)(v0 + 368));
    sub_189160690(v20, &qword_18C77ABB0);
    sub_1891646A8(v11, v0 + 96);
    int v22 = swift_dynamicCast();
    uint64_t v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    if (v22)
    {
      uint64_t v39 = *(void *)(v0 + 328);
      uint64_t v41 = *(void *)(v0 + 296);
      uint64_t v40 = *(void *)(v0 + 304);
      v23(v41, 0LL, 1LL, v40);
      sub_189198824(v41, v39, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      uint64_t v43 = *(void *)(v39 + *(int *)(v40 + 20));
      uint64_t v44 = *(void *)(v43 + 16);
      uint64_t v45 = MEMORY[0x18961AFE8];
      if (v44)
      {
        *uint64_t v12 = MEMORY[0x18961AFE8];
        swift_bridgeObjectRetain();
        sub_18919AC88();
        uint64_t v46 = 128LL;
        do
        {
          id v47 = *(id *)(v43 + v46);
          sub_18919AC70();
          sub_18919AC94();
          sub_18919ACA0();
          sub_18919AC7C();
          v46 += 128LL;
          --v44;
        }

        while (v44);
        uint64_t v45 = *v12;
        swift_bridgeObjectRelease();
      }

      *(void *)(v0 + 472) = v45;
      uint64_t v49 = *(void *)(v0 + 408);
      uint64_t v48 = *(void *)(v0 + 416);
      uint64_t v50 = *(void *)(v0 + 392);
      uint64_t v51 = *(void *)(v0 + 288);
      sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v42,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
      char v52 = (void *)swift_task_alloc();
      *(void *)(v0 + 480) = v52;
      v52[2] = v49;
      v52[3] = v51;
      v52[4] = v45;
      v52[5] = v48;
      v52[6] = v50;
      char v53 = (void *)swift_task_alloc();
      *(void *)(v0 + 488) = v53;
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABD0);
      *char v53 = v0;
      v53[1] = sub_189190B10;
      return sub_18919ADD8();
    }

    uint64_t v24 = *(void *)(v0 + 296);
    v23(v24, 1LL, 1LL, *(void *)(v0 + 304));
    __swift_destroy_boxed_opaque_existential_1(v11);
    sub_189160690(v24, &qword_18C77ABA8);
LABEL_6:
    uint64_t v13 = *(void *)(v0 + 440) + 1LL;
    if (v13 == *(void *)(v0 + 432))
    {
      swift_bridgeObjectRelease();
      uint64_t v9 = *(void **)(v0 + 424);
      goto LABEL_12;
    }
  }

  uint64_t v31 = *(void *)(v0 + 384);
  uint64_t v33 = *(void *)(v0 + 360);
  uint64_t v32 = *(void *)(v0 + 368);
  v19(v33, 0LL, 1LL, v32);
  sub_189198824(v33, v31, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  *(void *)(v0 + 168) = MEMORY[0x18961AFF0];
  uint64_t v35 = *(void *)(v31 + *(int *)(v32 + 20));
  if (*(void *)(v35 + 16))
  {
    uint64_t v36 = v35
        + ((*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL));
    swift_bridgeObjectRetain();
    uint64_t v37 = *(void *)(v0 + 352);
    uint64_t v38 = *(void *)(v0 + 336);
    sub_18919596C(v36, v37, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
    __asm { BR              X9 }
  }

  uint64_t v54 = *(void *)(v0 + 400);
  uint64_t v55 = *(void *)(v0 + 392);
  uint64_t v56 = *(void *)(v0 + 384);
  uint64_t v57 = *(void *)(v0 + 288);
  sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v34,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  unint64_t v58 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v58;
  v58[2] = v54;
  v58[3] = v57;
  v58[4] = v0 + 168;
  v58[5] = v55;
  v58[6] = v0 + 136;
  v58[7] = v56;
  unint64_t v59 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v59;
  void *v59 = v0;
  v59[1] = sub_18918F6B4;
  return sub_18919ADD8();
}

uint64_t sub_18918F6B4()
{
  *(void *)(*(void *)v1 + 464LL) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_18918F770()
{
  uint64_t v1 = *(void *)(v0 + 384);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1891959B0(v1, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  swift_bridgeObjectRelease();
  uint64_t v2 = *(void *)(v0 + 440) + 1LL;
  if (v2 == *(void *)(v0 + 432))
  {
LABEL_2:
    uint64_t v3 = swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v0 + 416);
    unint64_t v4 = *(void **)(v0 + 424);
    uint64_t v7 = *(void *)(v0 + 400);
    uint64_t v6 = *(void *)(v0 + 408);
    uint64_t v8 = *(void **)(v0 + 256);
    (*(void (**)(uint64_t))(**(void **)(v0 + 288) + 808LL))(v3);
    uint64_t v9 = *(void *)(v0 + 144);
    *uint64_t v8 = *(void *)(v0 + 136);
    v8[1] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x1895E1F64](v7, -1LL, -1LL);
    MEMORY[0x1895E1F64](v6, -1LL, -1LL);
    MEMORY[0x1895E1F64](v5, -1LL, -1LL);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  uint64_t v11 = (uint64_t *)(v0 + 232);
  while (1)
  {
    *(void *)(v0 + 440) = v2;
    uint64_t v14 = *(void *)(v0 + 424);
    sub_1891646A8(*(void *)(v0 + 264) + 40 * v2 + 32, v0 + 16);
    if (v14)
    {
      id v12 = *(id *)(v0 + 424);
      swift_willThrow();
      uint64_t v13 = *(void **)(v0 + 424);
      sub_18918DB6C(v0 + 16, v13);

      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      goto LABEL_5;
    }

    uint64_t v15 = *(void *)(v0 + 376);
    sub_1891646A8(v0 + 16, v0 + 56);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C77ABB8);
    int v16 = swift_dynamicCast();
    uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
    if (v16) {
      break;
    }
    uint64_t v18 = *(void *)(v0 + 360);
    uint64_t v19 = *(void *)(v0 + 312);
    v17(v18, 1LL, 1LL, *(void *)(v0 + 368));
    sub_189160690(v18, &qword_18C77ABB0);
    sub_1891646A8(v0 + 16, v0 + 96);
    int v20 = swift_dynamicCast();
    uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
    if (v20)
    {
      uint64_t v29 = *(void *)(v0 + 328);
      uint64_t v31 = *(void *)(v0 + 296);
      uint64_t v30 = *(void *)(v0 + 304);
      v21(v31, 0LL, 1LL, v30);
      sub_189198824(v31, v29, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      uint64_t v33 = *(void *)(v29 + *(int *)(v30 + 20));
      uint64_t v34 = *(void *)(v33 + 16);
      uint64_t v35 = MEMORY[0x18961AFE8];
      if (v34)
      {
        *uint64_t v11 = MEMORY[0x18961AFE8];
        swift_bridgeObjectRetain();
        sub_18919AC88();
        uint64_t v36 = 128LL;
        do
        {
          id v37 = *(id *)(v33 + v36);
          sub_18919AC70();
          sub_18919AC94();
          sub_18919ACA0();
          sub_18919AC7C();
          v36 += 128LL;
          --v34;
        }

        while (v34);
        uint64_t v35 = *v11;
        swift_bridgeObjectRelease();
      }

      *(void *)(v0 + 472) = v35;
      uint64_t v39 = *(void *)(v0 + 408);
      uint64_t v38 = *(void *)(v0 + 416);
      uint64_t v40 = *(void *)(v0 + 392);
      uint64_t v41 = *(void *)(v0 + 288);
      sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v32,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
      uint64_t v42 = (void *)swift_task_alloc();
      *(void *)(v0 + 480) = v42;
      v42[2] = v39;
      v42[3] = v41;
      v42[4] = v35;
      void v42[5] = v38;
      v42[6] = v40;
      uint64_t v43 = (void *)swift_task_alloc();
      *(void *)(v0 + 488) = v43;
      __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABD0);
      *uint64_t v43 = v0;
      v43[1] = sub_189190B10;
      return sub_18919ADD8();
    }

    uint64_t v22 = *(void *)(v0 + 296);
    v21(v22, 1LL, 1LL, *(void *)(v0 + 304));
    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    sub_189160690(v22, &qword_18C77ABA8);
LABEL_5:
    uint64_t v2 = *(void *)(v0 + 440) + 1LL;
    if (v2 == *(void *)(v0 + 432)) {
      goto LABEL_2;
    }
  }

  uint64_t v23 = *(void *)(v0 + 384);
  uint64_t v25 = *(void *)(v0 + 360);
  uint64_t v24 = *(void *)(v0 + 368);
  v17(v25, 0LL, 1LL, v24);
  sub_189198824(v25, v23, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  *(void *)(v0 + 168) = MEMORY[0x18961AFF0];
  uint64_t v27 = *(void *)(v23 + *(int *)(v24 + 20));
  if (*(void *)(v27 + 16))
  {
    uint64_t v28 = v27
        + ((*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL));
    swift_bridgeObjectRetain();
    uint64_t v44 = *(void *)(v0 + 352);
    uint64_t v45 = *(void *)(v0 + 336);
    sub_18919596C(v28, v44, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
    __asm { BR              X9 }
  }

  uint64_t v46 = *(void *)(v0 + 400);
  uint64_t v47 = *(void *)(v0 + 392);
  uint64_t v48 = *(void *)(v0 + 384);
  uint64_t v49 = *(void *)(v0 + 288);
  sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v26,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
  uint64_t v50 = (void *)swift_task_alloc();
  *(void *)(v0 + 448) = v50;
  v50[2] = v46;
  v50[3] = v49;
  v50[4] = v0 + 168;
  v50[5] = v47;
  v50[6] = v0 + 136;
  v50[7] = v48;
  uint64_t v51 = (void *)swift_task_alloc();
  *(void *)(v0 + 456) = v51;
  void *v51 = v0;
  v51[1] = sub_18918F6B4;
  return sub_18919ADD8();
}

uint64_t sub_189190B10()
{
  *(void *)(*(void *)v1 + 496LL) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_189190BD4()
{
  uint64_t v2 = *(void *)(v0 + 320);
  uint64_t v1 = *(void *)(v0 + 328);
  uint64_t v3 = sub_189198AC8(*(void *)(v0 + 208), (void (*)(void))sub_189198998, *(void *)(v0 + 288));
  swift_bridgeObjectRelease();
  sub_18919596C(v1, v2, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v5 = *(void *)(v0 + 144);
  *(void *)(v0 + 160) = v5;
  *(void *)(v0 + sub_18915E1E0(v0 + 144) = 0x8000000000000000LL;
  unint64_t v7 = (unint64_t)sub_189195424(v2);
  uint64_t v8 = *(void *)(v5 + 16);
  BOOL v9 = (v6 & 1) == 0;
  uint64_t v10 = v8 + v9;
  if (__OFADD__(v8, v9))
  {
    __break(1u);
    goto LABEL_31;
  }

  char v11 = v6;
  if (*(void *)(v5 + 24) >= v10)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
      sub_18919761C( type metadata accessor for HIDDeviceClient.RequestElementUpdate,  &qword_18C77B328,  (uint64_t (*)(uint64_t, uint64_t))sub_189198874);
    }
  }

  else
  {
    uint64_t v12 = *(void *)(v0 + 320);
    sub_189196300(v10, isUniquelyReferenced_nonNull_native);
    uint64_t v13 = sub_189195424(v12);
    if ((v11 & 1) != (v14 & 1)) {
      return sub_18919ADF0();
    }
    unint64_t v7 = (unint64_t)v13;
  }

  int v16 = *(void **)(v0 + 160);
  if ((v11 & 1) == 0)
  {
    uint64_t v19 = *(void *)(v0 + 312);
    uint64_t v18 = *(void *)(v0 + 320);
    v16[(v7 >> 6) + 8] |= 1LL << v7;
    sub_18919596C( v18,  v16[6] + *(void *)(v19 + 72) * v7,  type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    uint64_t v20 = v16[7] + 16 * v7;
    *(void *)uint64_t v20 = v3;
    *(_BYTE *)(v20 + 8) = 0;
    uint64_t v21 = v16[2];
    BOOL v22 = __OFADD__(v21, 1LL);
    uint64_t v23 = v21 + 1;
    if (!v22)
    {
      v16[2] = v23;
      goto LABEL_12;
    }

uint64_t sub_18919211C()
{
  uint64_t v1 = *(void **)(v0 + 464);
  sub_18918DB6C(v0 + 16, v1);

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 440) + 1LL;
  if (v2 == *(void *)(v0 + 432))
  {
LABEL_2:
    uint64_t v3 = swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v0 + 416);
    unint64_t v4 = *(void **)(v0 + 424);
    uint64_t v7 = *(void *)(v0 + 400);
    uint64_t v6 = *(void *)(v0 + 408);
    uint64_t v8 = *(void **)(v0 + 256);
    (*(void (**)(uint64_t))(**(void **)(v0 + 288) + 808LL))(v3);
    uint64_t v9 = *(void *)(v0 + 144);
    *uint64_t v8 = *(void *)(v0 + 136);
    v8[1] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x1895E1F64](v7, -1LL, -1LL);
    MEMORY[0x1895E1F64](v6, -1LL, -1LL);
    MEMORY[0x1895E1F64](v5, -1LL, -1LL);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    char v11 = (uint64_t *)(v0 + 232);
    while (1)
    {
      while (1)
      {
        *(void *)(v0 + 440) = v2;
        uint64_t v14 = *(void *)(v0 + 424);
        sub_1891646A8(*(void *)(v0 + 264) + 40 * v2 + 32, v0 + 16);
        if (!v14) {
          break;
        }
        id v12 = *(id *)(v0 + 424);
        swift_willThrow();
        uint64_t v13 = *(void **)(v0 + 424);
        sub_18918DB6C(v0 + 16, v13);

        __swift_destroy_boxed_opaque_existential_1(v0 + 16);
        uint64_t v2 = *(void *)(v0 + 440) + 1LL;
        if (v2 == *(void *)(v0 + 432)) {
          goto LABEL_2;
        }
      }

      uint64_t v15 = *(void *)(v0 + 376);
      sub_1891646A8(v0 + 16, v0 + 56);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C77ABB8);
      int v16 = swift_dynamicCast();
      uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      if (v16) {
        break;
      }
      uint64_t v18 = *(void *)(v0 + 360);
      uint64_t v19 = *(void *)(v0 + 312);
      v17(v18, 1LL, 1LL, *(void *)(v0 + 368));
      sub_189160690(v18, &qword_18C77ABB0);
      sub_1891646A8(v0 + 16, v0 + 96);
      int v20 = swift_dynamicCast();
      uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
      if (v20)
      {
        uint64_t v29 = *(void *)(v0 + 328);
        uint64_t v31 = *(void *)(v0 + 296);
        uint64_t v30 = *(void *)(v0 + 304);
        v21(v31, 0LL, 1LL, v30);
        sub_189198824(v31, v29, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
        uint64_t v33 = *(void *)(v29 + *(int *)(v30 + 20));
        uint64_t v34 = *(void *)(v33 + 16);
        uint64_t v35 = MEMORY[0x18961AFE8];
        if (v34)
        {
          *char v11 = MEMORY[0x18961AFE8];
          swift_bridgeObjectRetain();
          sub_18919AC88();
          uint64_t v36 = 128LL;
          do
          {
            id v37 = *(id *)(v33 + v36);
            sub_18919AC70();
            sub_18919AC94();
            sub_18919ACA0();
            sub_18919AC7C();
            v36 += 128LL;
            --v34;
          }

          while (v34);
          uint64_t v35 = *v11;
          swift_bridgeObjectRelease();
        }

        *(void *)(v0 + 472) = v35;
        uint64_t v39 = *(void *)(v0 + 408);
        uint64_t v38 = *(void *)(v0 + 416);
        uint64_t v40 = *(void *)(v0 + 392);
        uint64_t v41 = *(void *)(v0 + 288);
        sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v32,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
        uint64_t v42 = (void *)swift_task_alloc();
        *(void *)(v0 + 480) = v42;
        v42[2] = v39;
        v42[3] = v41;
        v42[4] = v35;
        void v42[5] = v38;
        v42[6] = v40;
        int v43 = (void *)swift_task_alloc();
        *(void *)(v0 + 488) = v43;
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABD0);
        *int v43 = v0;
        v43[1] = sub_189190B10;
        return sub_18919ADD8();
      }

      uint64_t v22 = *(void *)(v0 + 296);
      v21(v22, 1LL, 1LL, *(void *)(v0 + 304));
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      sub_189160690(v22, &qword_18C77ABA8);
      uint64_t v2 = *(void *)(v0 + 440) + 1LL;
      if (v2 == *(void *)(v0 + 432)) {
        goto LABEL_2;
      }
    }

    uint64_t v23 = *(void *)(v0 + 384);
    uint64_t v25 = *(void *)(v0 + 360);
    uint64_t v24 = *(void *)(v0 + 368);
    v17(v25, 0LL, 1LL, v24);
    sub_189198824(v25, v23, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    *(void *)(v0 + 168) = MEMORY[0x18961AFF0];
    uint64_t v27 = *(void *)(v23 + *(int *)(v24 + 20));
    if (*(void *)(v27 + 16))
    {
      uint64_t v28 = v27
          + ((*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL));
      swift_bridgeObjectRetain();
      uint64_t v44 = *(void *)(v0 + 352);
      uint64_t v45 = *(void *)(v0 + 336);
      sub_18919596C(v28, v44, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
      __asm { BR              X9 }
    }

    uint64_t v46 = *(void *)(v0 + 400);
    uint64_t v47 = *(void *)(v0 + 392);
    uint64_t v48 = *(void *)(v0 + 384);
    uint64_t v49 = *(void *)(v0 + 288);
    sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v26,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
    uint64_t v50 = (void *)swift_task_alloc();
    *(void *)(v0 + 448) = v50;
    v50[2] = v46;
    v50[3] = v49;
    v50[4] = v0 + 168;
    v50[5] = v47;
    v50[6] = v0 + 136;
    v50[7] = v48;
    uint64_t v51 = (void *)swift_task_alloc();
    *(void *)(v0 + 456) = v51;
    void *v51 = v0;
    v51[1] = sub_18918F6B4;
    return sub_18919ADD8();
  }

uint64_t sub_1891934E0()
{
  uint64_t v1 = *(void **)(v0 + 496);
  sub_18918DB6C(v0 + 16, v1);

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  uint64_t v2 = *(void *)(v0 + 440) + 1LL;
  if (v2 == *(void *)(v0 + 432))
  {
LABEL_2:
    uint64_t v3 = swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v0 + 416);
    unint64_t v4 = *(void **)(v0 + 424);
    uint64_t v7 = *(void *)(v0 + 400);
    uint64_t v6 = *(void *)(v0 + 408);
    uint64_t v8 = *(void **)(v0 + 256);
    (*(void (**)(uint64_t))(**(void **)(v0 + 288) + 808LL))(v3);
    uint64_t v9 = *(void *)(v0 + 144);
    *uint64_t v8 = *(void *)(v0 + 136);
    v8[1] = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    MEMORY[0x1895E1F64](v7, -1LL, -1LL);
    MEMORY[0x1895E1F64](v6, -1LL, -1LL);
    MEMORY[0x1895E1F64](v5, -1LL, -1LL);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }

  else
  {
    char v11 = (uint64_t *)(v0 + 232);
    while (1)
    {
      while (1)
      {
        *(void *)(v0 + 440) = v2;
        uint64_t v14 = *(void *)(v0 + 424);
        sub_1891646A8(*(void *)(v0 + 264) + 40 * v2 + 32, v0 + 16);
        if (!v14) {
          break;
        }
        id v12 = *(id *)(v0 + 424);
        swift_willThrow();
        uint64_t v13 = *(void **)(v0 + 424);
        sub_18918DB6C(v0 + 16, v13);

        __swift_destroy_boxed_opaque_existential_1(v0 + 16);
        uint64_t v2 = *(void *)(v0 + 440) + 1LL;
        if (v2 == *(void *)(v0 + 432)) {
          goto LABEL_2;
        }
      }

      uint64_t v15 = *(void *)(v0 + 376);
      sub_1891646A8(v0 + 16, v0 + 56);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_18C77ABB8);
      int v16 = swift_dynamicCast();
      uint64_t v17 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      if (v16) {
        break;
      }
      uint64_t v18 = *(void *)(v0 + 360);
      uint64_t v19 = *(void *)(v0 + 312);
      v17(v18, 1LL, 1LL, *(void *)(v0 + 368));
      sub_189160690(v18, &qword_18C77ABB0);
      sub_1891646A8(v0 + 16, v0 + 96);
      int v20 = swift_dynamicCast();
      uint64_t v21 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
      if (v20)
      {
        uint64_t v31 = *(void *)(v0 + 328);
        uint64_t v33 = *(void *)(v0 + 296);
        uint64_t v32 = *(void *)(v0 + 304);
        v21(v33, 0LL, 1LL, v32);
        sub_189198824(v33, v31, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
        uint64_t v35 = *(void *)(v31 + *(int *)(v32 + 20));
        uint64_t v36 = *(void *)(v35 + 16);
        uint64_t v37 = MEMORY[0x18961AFE8];
        if (v36)
        {
          *char v11 = MEMORY[0x18961AFE8];
          swift_bridgeObjectRetain();
          sub_18919AC88();
          uint64_t v38 = 128LL;
          do
          {
            id v39 = *(id *)(v35 + v38);
            sub_18919AC70();
            sub_18919AC94();
            sub_18919ACA0();
            sub_18919AC7C();
            v38 += 128LL;
            --v36;
          }

          while (v36);
          uint64_t v37 = *v11;
          swift_bridgeObjectRelease();
        }

        *(void *)(v0 + 472) = v37;
        uint64_t v41 = *(void *)(v0 + 408);
        uint64_t v40 = *(void *)(v0 + 416);
        uint64_t v42 = *(void *)(v0 + 392);
        uint64_t v43 = *(void *)(v0 + 288);
        sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v34,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
        uint64_t v44 = (void *)swift_task_alloc();
        *(void *)(v0 + 480) = v44;
        v44[2] = v41;
        v44[3] = v43;
        v44[4] = v37;
        v44[5] = v40;
        v44[6] = v42;
        uint64_t v45 = (void *)swift_task_alloc();
        *(void *)(v0 + 488) = v45;
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABD0);
        *uint64_t v45 = v0;
        v45[1] = sub_189190B10;
        return sub_18919ADD8();
      }

      uint64_t v22 = *(void *)(v0 + 296);
      v21(v22, 1LL, 1LL, *(void *)(v0 + 304));
      __swift_destroy_boxed_opaque_existential_1(v0 + 16);
      sub_189160690(v22, &qword_18C77ABA8);
      uint64_t v2 = *(void *)(v0 + 440) + 1LL;
      if (v2 == *(void *)(v0 + 432)) {
        goto LABEL_2;
      }
    }

    uint64_t v23 = *(void *)(v0 + 384);
    uint64_t v25 = *(void *)(v0 + 360);
    uint64_t v24 = *(void *)(v0 + 368);
    v17(v25, 0LL, 1LL, v24);
    sub_189198824(v25, v23, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    *(void *)(v0 + 168) = MEMORY[0x18961AFF0];
    uint64_t v27 = *(void *)(v23 + *(int *)(v24 + 20));
    if (*(void *)(v27 + 16))
    {
      uint64_t v28 = v27
          + ((*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v0 + 344) + 80LL));
      swift_bridgeObjectRetain();
      uint64_t v29 = *(void *)(v0 + 352);
      uint64_t v30 = *(void *)(v0 + 336);
      sub_18919596C(v28, v29, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
      __asm { BR              X9 }
    }

    uint64_t v46 = *(void *)(v0 + 400);
    uint64_t v47 = *(void *)(v0 + 392);
    uint64_t v48 = *(void *)(v0 + 384);
    uint64_t v49 = *(void *)(v0 + 288);
    sub_1891646EC( (unint64_t *)&unk_18C77AB88,  v26,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
    uint64_t v50 = (void *)swift_task_alloc();
    *(void *)(v0 + 448) = v50;
    v50[2] = v46;
    v50[3] = v49;
    v50[4] = v0 + 168;
    v50[5] = v47;
    v50[6] = v0 + 136;
    v50[7] = v48;
    uint64_t v51 = (void *)swift_task_alloc();
    *(void *)(v0 + 456) = v51;
    void *v51 = v0;
    v51[1] = sub_18918F6B4;
    return sub_18919ADD8();
  }

uint64_t sub_1891948FC( uint64_t a1, void *a2, uint64_t a3, CFTimeInterval a4, uint64_t a5, uint64_t *a6, uint64_t a7)
{
  uint64_t v24 = a7;
  uint64_t v12 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL);
  MEMORY[0x1895F8858](v12);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A4E0);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 24LL))(a2, a1, v15);
  int v16 = *(__IOHIDDevice **)(a3 + 296);
  type metadata accessor for IOHIDElement();
  type metadata accessor for IOHIDValue(0LL);
  sub_1891646EC( &qword_18C77A450,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73B0);
  swift_bridgeObjectRetain();
  uint64_t v17 = (const __CFDictionary *)sub_18919AA00();
  swift_bridgeObjectRelease();
  uint64_t v18 = IOHIDDeviceSetValueMultipleWithCallback(v16, v17, a4, (IOHIDValueMultipleCallback)sub_189194B0C, a2);

  sub_189185BBC(v18, (uint64_t)&v25);
  if ((v25 & 0x10000000000LL) != 0)
  {
    sub_18919596C(v24, (uint64_t)v14, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = *a6;
    *a6 = 0x8000000000000000LL;
    sub_1891973D8(0LL, 0, (uint64_t)v14, isUniquelyReferenced_nonNull_native);
    *a6 = v25;
    swift_bridgeObjectRelease();
    return sub_1891959B0((uint64_t)v14, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  }

  else
  {
    unint64_t v21 = v25 | ((unint64_t)BYTE4(v25) << 32);
    sub_189165504();
    uint64_t v22 = swift_allocError();
    *(_DWORD *)uint64_t v23 = v21;
    *(_BYTE *)(v23 + 4) = BYTE4(v21) & 1;
    uint64_t v25 = v22;
    return sub_18919AAFC();
  }

uint64_t sub_189194B0C(uint64_t a1, uint64_t a2)
{
  return sub_189163088(a1, a2);
}

void sub_189194B20(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  sub_18919A308(a1, a2);
}

uint64_t sub_189194B64@<X0>(void *a1@<X0>, __IOHIDValue *a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v8 = sub_18919ACC4();
  MEMORY[0x1895F8858](v8);
  uint64_t v10 = (unint64_t *)((char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  id v11 = a1;
  swift_retain();
  sub_1891595D0(v11, a3, (uint64_t)v21);
  sub_18919A2C0((uint64_t)v21, (uint64_t)v22);
  sub_18919A2C0((uint64_t)v22, (uint64_t)v23);
  uint64_t result = sub_18915E098((uint64_t)v23);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }

  else
  {
    v19[4] = v23[4];
    v19[5] = v23[5];
    v20[0] = v24[0];
    *(_OWORD *)((char *)v20 + 9) = *(_OWORD *)((char *)v24 + 9);
    v19[0] = v23[0];
    v19[1] = v23[1];
    void v19[2] = v23[2];
    v19[3] = v23[3];
    BytePtr = (uint8_t *)IOHIDValueGetBytePtr(a2);
    CFIndex Length = IOHIDValueGetLength(a2);
    uint64_t v15 = sub_1891981CC(BytePtr, Length);
    uint64_t v17 = v16;
    uint64_t TimeStamp = IOHIDValueGetTimeStamp(a2);
    sub_189185EF8(TimeStamp, v10);
    return HIDElement.Value.init(element:fromBytes:timestamp:)(v19, v15, v17, (uint64_t)v10, a4);
  }

  return result;
}

uint64_t HIDDeviceClient.unownedExecutor.getter()
{
  return v0;
}

uint64_t static HIDDeviceClient.== infix(_:_:)()
{
  return sub_18919A9A0() & 1;
}

uint64_t sub_189194D2C()
{
  return sub_18919A9A0() & 1;
}

void HIDDeviceClient.hash(into:)()
{
  uint64_t v1 = *(void **)(v0 + 296);
  type metadata accessor for IOHIDDevice(0LL);
  sub_1891646EC( &qword_18C77ABD8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice,  (uint64_t)&unk_1891A7418);
  id v2 = v1;
  sub_18919A9AC();
}

uint64_t HIDDeviceClient.hashValue.getter()
{
  uint64_t v1 = *(void **)(v0 + 296);
  type metadata accessor for IOHIDDevice(0LL);
  sub_1891646EC( &qword_18C77ABD8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice,  (uint64_t)&unk_1891A7418);
  id v2 = v1;
  sub_18919A9AC();

  return sub_18919AE74();
}

uint64_t sub_189194EB4()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  id v2 = *(void **)(v1 + 296);
  type metadata accessor for IOHIDDevice(0LL);
  sub_1891646EC( &qword_18C77ABD8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice,  (uint64_t)&unk_1891A7418);
  id v3 = v2;
  sub_18919A9AC();

  return sub_18919AE74();
}

void sub_189194F48()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 296LL);
  type metadata accessor for IOHIDDevice(0LL);
  sub_1891646EC( &qword_18C77ABD8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice,  (uint64_t)&unk_1891A7418);
  id v2 = v1;
  sub_18919A9AC();
}

uint64_t sub_189194FD0()
{
  uint64_t v1 = *v0;
  sub_18919AE38();
  id v2 = *(void **)(v1 + 296);
  type metadata accessor for IOHIDDevice(0LL);
  sub_1891646EC( &qword_18C77ABD8,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice,  (uint64_t)&unk_1891A7418);
  id v3 = v2;
  sub_18919A9AC();

  return sub_18919AE74();
}

uint64_t HIDDeviceClient.description.getter()
{
  uint64_t v1 = *(void *)(v0 + 312);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_18919508C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 312LL);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t HIDDeviceClient.DeviceReference.description.getter()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A458);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_18919B6C0;
  uint64_t v3 = MEMORY[0x18961A910];
  *(void *)(v2 + 56) = MEMORY[0x18961A8C8];
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 32) = v1;
  return sub_18919AA78();
}

uint64_t sub_189195130()
{
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A458);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = xmmword_18919B6C0;
  uint64_t v3 = MEMORY[0x18961A910];
  *(void *)(v2 + 56) = MEMORY[0x18961A8C8];
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 32) = v1;
  return sub_18919AA78();
}

uint64_t sub_1891951A4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1891951B4(uint64_t a1)
{
  return sub_18919A9B8();
}

uint64_t sub_1891951F0()
{
  return sub_18919A9AC();
}

uint64_t sub_189195238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_189195244(a1, a2, a3, (uint64_t)&unk_1891A7418);
}

uint64_t sub_189195244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_18919AE74();
}

uint64_t sub_1891952A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_18919A9A0();
}

unint64_t sub_1891952F0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + *(int *)(type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL) + 20));
  uint64_t v3 = *(void *)(v2 + 16);
  sub_18919AE44();
  if (v3)
  {
    uint64_t v4 = *(void *)(type metadata accessor for HIDElement.Value() - 8);
    uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    uint64_t v6 = *(void *)(v4 + 72);
    sub_1891646EC( &qword_18C77ABA0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value,  (uint64_t)&protocol conformance descriptor for HIDElement.Value);
    swift_bridgeObjectRetain();
    do
    {
      sub_18919AA24();
      v5 += v6;
      --v3;
    }

    while (v3);
    swift_bridgeObjectRelease();
  }

  uint64_t v7 = sub_18919AE74();
  return sub_189195A30(a1, v7);
}

void *sub_189195424(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + *(int *)(type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL) + 20));
  swift_bridgeObjectRetain();
  sub_189197B94((uint64_t)v5, v2);
  swift_bridgeObjectRelease();
  sub_18919AE50();
  uint64_t v3 = sub_18919AE74();
  return sub_189195CD4(a1, v3);
}

unint64_t sub_1891954F0(uint64_t a1)
{
  uint64_t v2 = sub_18919AE74();
  return sub_189195EE8(a1, v2);
}

char *sub_18919557C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B3C8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 6);
  }

  else
  {
    uint64_t v10 = (char *)MEMORY[0x18961AFE8];
  }

  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  size_t v14 = 6 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14]) {
      memmove(v12, v13, v14);
    }
    *((void *)a4 + 2) = 0LL;
  }

  else
  {
    memcpy(v12, v13, v14);
  }

  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_189195680(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_30:
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x18961AFE8];
    goto LABEL_19;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B340);
  uint64_t v10 = *(void *)(type metadata accessor for HIDElement.Value() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (result - v12 == 0x8000000000000000LL && v11 == -1) {
    goto LABEL_29;
  }
  _OWORD v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for HIDElement.Value() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }

    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return (size_t)v13;
}

void *sub_1891957F4(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB30);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    _OWORD v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }

  else
  {
    uint64_t v10 = (void *)MEMORY[0x18961AFE8];
  }

  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0LL;
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB40);
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_189195914()
{
  unint64_t result = qword_18C77AB48;
  if (!qword_18C77AB48)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDDeviceError, &type metadata for HIDDeviceError);
    atomic_store(result, (unint64_t *)&qword_18C77AB48);
  }

  return result;
}

uint64_t type metadata accessor for HIDDeviceClient.Notification(uint64_t a1)
{
  return sub_1891997E4(a1, (uint64_t *)&unk_18C77FC10);
}

uint64_t sub_18919596C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_1891959B0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

unint64_t sub_1891959EC()
{
  unint64_t result = qword_18C77AB68;
  if (!qword_18C77AB68)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDReportID, &type metadata for HIDReportID);
    atomic_store(result, (unint64_t *)&qword_18C77AB68);
  }

  return result;
}

unint64_t sub_189195A30(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a1;
  uint64_t v33 = type metadata accessor for HIDElement.Value();
  uint64_t v23 = *(void *)(v33 - 8);
  MEMORY[0x1895F8858](v33);
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = (char *)&v22 - v7;
  uint64_t v24 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL);
  MEMORY[0x1895F8858](v24);
  int64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v28 = v2;
  uint64_t v12 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v12;
  uint64_t v26 = v2 + 64;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v25 = ~v12;
    uint64_t v27 = *(void *)(v9 + 72);
    uint64_t v29 = v11;
    while (1)
    {
      uint64_t v14 = *(void *)(v28 + 48);
      unint64_t v31 = result;
      sub_18919596C(v14 + result * v27, (uint64_t)v11, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
      if ((sub_18919ACB8() & 1) != 0)
      {
        uint64_t v15 = *(int *)(v24 + 20);
        uint64_t v16 = *(void *)&v29[v15];
        uint64_t v17 = *(void *)(v30 + v15);
        uint64_t v18 = *(void *)(v16 + 16);
        if (v18 == *(void *)(v17 + 16)) {
          break;
        }
      }

LABEL_3:
      int64_t v11 = v29;
      sub_1891959B0((uint64_t)v29, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
      unint64_t result = (v31 + 1) & v25;
      if (((*(void *)(v26 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) == 0) {
        return result;
      }
    }

    if (!v18 || v16 == v17)
    {
LABEL_12:
      sub_1891959B0((uint64_t)v29, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
      return v31;
    }

    else
    {
      unint64_t v19 = 0LL;
      unint64_t v20 = (*(unsigned __int8 *)(v23 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
      uint64_t v32 = *(void *)(v23 + 72);
      while (1)
      {
        unint64_t result = sub_18919596C( v16 + v20,  (uint64_t)v8,  (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
        if (v19 >= *(void *)(v17 + 16)) {
          break;
        }
        sub_18919596C( v17 + v20,  (uint64_t)v5,  (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
        sub_1891646EC( &qword_18C77A3B0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value,  (uint64_t)&protocol conformance descriptor for HIDElement.Value);
        char v21 = sub_18919AA60();
        sub_1891959B0((uint64_t)v5, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
        sub_1891959B0((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
        if ((v21 & 1) == 0) {
          goto LABEL_3;
        }
        ++v19;
        v20 += v32;
        if (v18 == v19) {
          goto LABEL_12;
        }
      }

      __break(1u);
    }
  }

  return result;
}

void *sub_189195CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v26 = a1;
  uint64_t v21 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL);
  MEMORY[0x1895F8858](v21);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = v2 + 64;
  uint64_t v25 = v2;
  uint64_t v7 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v8 = a2 & ~v7;
  if (((*(void *)(v2 + 64 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0) {
    return (void *)v8;
  }
  uint64_t v22 = ~v7;
  uint64_t v23 = *(void *)(v4 + 72);
  uint64_t v9 = type metadata accessor for HIDDeviceClient.RequestElementUpdate;
  while (1)
  {
    uint64_t v10 = v9;
    sub_18919596C(*(void *)(v25 + 48) + v8 * v23, (uint64_t)v6, v9);
    if ((sub_18919ACB8() & 1) == 0) {
      goto LABEL_4;
    }
    uint64_t v11 = *(int *)(v21 + 20);
    uint64_t v12 = *(void *)&v6[v11];
    uint64_t v13 = *(void *)(v26 + v11);
    uint64_t v14 = *(void *)(v12 + 16);
    if (v14 != *(void *)(v13 + 16)) {
      goto LABEL_4;
    }
    if (v14 && v12 != v13) {
      break;
    }
LABEL_3:
    if (v6[*(int *)(v21 + 24)] == *(_BYTE *)(v26 + *(int *)(v21 + 24)))
    {
      sub_1891959B0((uint64_t)v6, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      return (void *)v8;
    }

LABEL_4:
    uint64_t v9 = v10;
    sub_1891959B0((uint64_t)v6, v10);
    unint64_t v8 = (v8 + 1) & v22;
    if (((*(void *)(v24 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v8) & 1) == 0) {
      return (void *)v8;
    }
  }

  unint64_t v16 = 0LL;
  uint64_t v17 = (char *)(v12 + 32);
  uint64_t v18 = (char *)(v13 + 32);
  while (1)
  {
    unint64_t result = memmove(&v28, v17, 0x79uLL);
    if (v16 >= *(void *)(v13 + 16)) {
      break;
    }
    memmove(&v27, v18, 0x79uLL);
    sub_18915F638();
    if ((sub_18919AA60() & 1) == 0) {
      goto LABEL_4;
    }
    ++v16;
    v17 += 128;
    v18 += 128;
    if (v14 == v16) {
      goto LABEL_3;
    }
  }

  __break(1u);
  return result;
}

unint64_t sub_189195EE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0)
  {
    type metadata accessor for IOHIDElement();
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_1891646EC( &qword_18C77A330,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
    id v7 = v6;
    char v8 = sub_18919A9A0();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8LL)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_18919A9A0();

        if ((v11 & 1) != 0) {
          break;
        }
      }
    }
  }

  return i;
}

void sub_18919602C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_18919AD78();
    swift_bridgeObjectRelease();
  }

  JUMPOUT(0x1895E1610LL);
}

uint64_t sub_189196094(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B320);
    uint64_t v2 = sub_18919AD9C();
    uint64_t v17 = v2;
    sub_18919ACF4();
    if (sub_18919AD60())
    {
      type metadata accessor for IOHIDElement();
      do
      {
        swift_dynamicCast();
        type metadata accessor for IOHIDValue(0LL);
        swift_dynamicCast();
        uint64_t v2 = v17;
        unint64_t v10 = *(void *)(v17 + 16);
        if (*(void *)(v17 + 24) <= v10)
        {
          sub_189196D0C(v10 + 1, 1);
          uint64_t v2 = v17;
        }

        sub_18919AE38();
        sub_1891646EC( &qword_18C77A330,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
        sub_18919A9AC();
        uint64_t result = sub_18919AE74();
        uint64_t v4 = v2 + 64;
        uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1LL << v6) & ~*(void *)(v2 + 64 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1LL << v6) & ~*(void *)(v2 + 64 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v11 = 0;
          unint64_t v12 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v12 && (v11 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v13 = v7 == v12;
            if (v7 == v12) {
              unint64_t v7 = 0LL;
            }
            v11 |= v13;
            uint64_t v14 = *(void *)(v4 + 8 * v7);
          }

          while (v14 == -1);
          unint64_t v8 = __clz(__rbit64(~v14)) + (v7 << 6);
        }

        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v8;
        uint64_t v9 = 8 * v8;
        *(void *)(*(void *)(v2 + 48) + v9) = v16;
        *(void *)(*(void *)(v2 + 56) + v9) = v15;
        ++*(void *)(v2 + 16);
      }

      while (sub_18919AD60());
    }

    swift_release();
  }

  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x18961AFF0];
  }

  return v2;
}

uint64_t sub_189196300(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v61 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL);
  uint64_t v54 = *(void *)(v61 - 8);
  MEMORY[0x1895F8858](v61);
  unint64_t v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B328);
  int v55 = a2;
  uint64_t v8 = sub_18919AD90();
  uint64_t v9 = v8;
  if (*(void *)(v7 + 16))
  {
    uint64_t v10 = 1LL << *(_BYTE *)(v7 + 32);
    uint64_t v11 = *(void *)(v7 + 64);
    uint64_t v51 = (void *)(v7 + 64);
    if (v10 < 64) {
      uint64_t v12 = ~(-1LL << v10);
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v13 = v12 & v11;
    uint64_t v49 = v3;
    int64_t v50 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = v8 + 64;
    uint64_t result = swift_retain();
    int64_t v16 = 0LL;
    uint64_t v52 = v7;
    uint64_t v53 = v9;
    while (1)
    {
      if (v13)
      {
        uint64_t v59 = (v13 - 1) & v13;
        unint64_t v20 = __clz(__rbit64(v13)) | (v16 << 6);
      }

      else
      {
        int64_t v21 = v16 + 1;
        if (__OFADD__(v16, 1LL))
        {
LABEL_45:
          __break(1u);
LABEL_46:
          __break(1u);
          return result;
        }

        if (v21 >= v50) {
          goto LABEL_39;
        }
        unint64_t v22 = v51[v21];
        ++v16;
        if (!v22)
        {
          int64_t v16 = v21 + 1;
          if (v21 + 1 >= v50) {
            goto LABEL_39;
          }
          unint64_t v22 = v51[v16];
          if (!v22)
          {
            int64_t v23 = v21 + 2;
            if (v23 >= v50)
            {
LABEL_39:
              swift_release();
              uint64_t v3 = v49;
              if ((v55 & 1) != 0)
              {
                uint64_t v48 = 1LL << *(_BYTE *)(v7 + 32);
                if (v48 >= 64) {
                  bzero(v51, ((unint64_t)(v48 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  void *v51 = -1LL << v48;
                }
                *(void *)(v7 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
              }

              break;
            }

            unint64_t v22 = v51[v23];
            if (!v22)
            {
              while (1)
              {
                int64_t v16 = v23 + 1;
                if (__OFADD__(v23, 1LL)) {
                  goto LABEL_46;
                }
                if (v16 >= v50) {
                  goto LABEL_39;
                }
                unint64_t v22 = v51[v16];
                ++v23;
                if (v22) {
                  goto LABEL_21;
                }
              }
            }

            int64_t v16 = v23;
          }
        }

LABEL_21:
        uint64_t v59 = (v22 - 1) & v22;
        unint64_t v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }

      uint64_t v24 = *(void *)(v54 + 72);
      uint64_t v25 = *(void *)(v7 + 48) + v24 * v20;
      uint64_t v26 = 16 * v20;
      int64_t v60 = v16;
      uint64_t v58 = v24;
      uint64_t v27 = v61;
      if ((v55 & 1) != 0)
      {
        sub_189198824(v25, (uint64_t)v6, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
        uint64_t v28 = v7;
        uint64_t v29 = *(void *)(v7 + 56) + v26;
        id v57 = *(id *)v29;
        int v56 = *(unsigned __int8 *)(v29 + 8);
      }

      else
      {
        sub_18919596C(v25, (uint64_t)v6, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
        uint64_t v28 = v7;
        uint64_t v30 = *(void *)(v7 + 56) + v26;
        int v31 = *(unsigned __int8 *)(v30 + 8);
        id v57 = *(id *)v30;
        int v56 = v31;
        sub_189198874(v57, v31);
      }

      sub_18919AE38();
      sub_18919ACC4();
      sub_1891646EC(&qword_18C77A350, 255LL, (uint64_t (*)(uint64_t))MEMORY[0x18961BF40], MEMORY[0x18961BF50]);
      sub_18919AA24();
      uint64_t v32 = *(int *)(v27 + 20);
      uint64_t v33 = (uint64_t)v6;
      uint64_t v34 = *(void *)&v6[v32];
      sub_18919AE44();
      uint64_t v35 = *(void *)(v34 + 16);
      uint64_t v7 = v28;
      if (v35)
      {
        sub_18919A264();
        swift_bridgeObjectRetain();
        uint64_t v36 = v35 - 1;
        for (uint64_t i = 32LL; ; i += 128LL)
        {
          *(_OWORD *)((char *)v75 + 9) = *(_OWORD *)(v34 + i + 105);
          __int128 v38 = *(_OWORD *)(v34 + i + 96);
          __int128 v74 = *(_OWORD *)(v34 + i + 80);
          v75[0] = v38;
          __int128 v39 = *(_OWORD *)(v34 + i + 64);
          __int128 v72 = *(_OWORD *)(v34 + i + 48);
          __int128 v73 = v39;
          __int128 v40 = *(_OWORD *)(v34 + i + 16);
          __int128 v69 = *(_OWORD *)(v34 + i);
          __int128 v70 = v40;
          __int128 v71 = *(_OWORD *)(v34 + i + 32);
          __int128 v66 = v39;
          __int128 v67 = v74;
          v68[0] = v75[0];
          *(_OWORD *)((char *)v68 + 9) = *(_OWORD *)((char *)v75 + 9);
          __int128 v62 = v69;
          __int128 v63 = v40;
          __int128 v64 = v71;
          __int128 v65 = v72;
          sub_18919AA24();
          if (!v36) {
            break;
          }
          --v36;
        }

        swift_bridgeObjectRelease();
        uint64_t v7 = v52;
        uint64_t v9 = v53;
      }

      unint64_t v6 = (char *)v33;
      sub_18919AE50();
      uint64_t result = sub_18919AE74();
      uint64_t v41 = -1LL << *(_BYTE *)(v9 + 32);
      unint64_t v42 = result & ~v41;
      unint64_t v43 = v42 >> 6;
      if (((-1LL << v42) & ~*(void *)(v14 + 8 * (v42 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1LL << v42) & ~*(void *)(v14 + 8 * (v42 >> 6)))) | v42 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v44 = 0;
        unint64_t v45 = (unint64_t)(63 - v41) >> 6;
        do
        {
          if (++v43 == v45 && (v44 & 1) != 0)
          {
            __break(1u);
            goto LABEL_45;
          }

          BOOL v46 = v43 == v45;
          if (v43 == v45) {
            unint64_t v43 = 0LL;
          }
          v44 |= v46;
          uint64_t v47 = *(void *)(v14 + 8 * v43);
        }

        while (v47 == -1);
        unint64_t v17 = __clz(__rbit64(~v47)) + (v43 << 6);
      }

      uint64_t v18 = v58;
      *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
      uint64_t result = sub_189198824( v33,  *(void *)(v9 + 48) + v17 * v18,  type metadata accessor for HIDDeviceClient.RequestElementUpdate);
      uint64_t v19 = *(void *)(v9 + 56) + 16 * v17;
      *(void *)uint64_t v19 = v57;
      *(_BYTE *)(v19 + 8) = v56;
      ++*(void *)(v9 + 16);
      unint64_t v13 = v59;
      int64_t v16 = v60;
    }
  }

  uint64_t result = swift_release();
  *uint64_t v3 = v9;
  return result;
}

        __int128 v62 = (v27 - 1) & v27;
        uint64_t v25 = __clz(__rbit64(v27)) + (v20 << 6);
      }

      uint64_t v29 = *(void *)(v21 + 48) + *(void *)(v55 + 72) * v25;
      uint64_t v30 = 16 * v25;
      uint64_t v61 = *(void *)(v55 + 72);
      if ((v57 & 1) != 0)
      {
        sub_189198824(v29, (uint64_t)v10, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
        int v31 = *(void *)(v21 + 56) + v30;
        int64_t v60 = *(id *)v31;
        uint64_t v59 = *(unsigned __int8 *)(v31 + 8);
      }

      else
      {
        sub_18919596C(v29, (uint64_t)v10, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
        uint64_t v32 = *(void *)(v21 + 56) + v30;
        uint64_t v33 = *(unsigned __int8 *)(v32 + 8);
        int64_t v60 = *(id *)v32;
        uint64_t v59 = v33;
        sub_189198868(v60, v33);
      }

      sub_18919AE38();
      sub_18919ACC4();
      sub_1891646EC(&qword_18C77A350, 255LL, (uint64_t (*)(uint64_t))MEMORY[0x18961BF40], MEMORY[0x18961BF50]);
      sub_18919AA24();
      uint64_t v34 = *(void *)&v10[*(int *)(v56 + 20)];
      sub_18919AE44();
      uint64_t v35 = *(void *)(v34 + 16);
      if (v35)
      {
        uint64_t v58 = v20;
        uint64_t v36 = v51;
        uint64_t v37 = v34 + ((*(unsigned __int8 *)(v51 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80));
        swift_bridgeObjectRetain();
        __int128 v38 = *(void *)(v36 + 72);
        do
        {
          sub_18919596C(v37, (uint64_t)v7, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
          sub_1891646EC( &qword_18C77ABA0,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for HIDElement.Value,  (uint64_t)&protocol conformance descriptor for HIDElement.Value);
          sub_18919AA24();
          sub_1891959B0((uint64_t)v7, (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
          v37 += v38;
          --v35;
        }

        while (v35);
        swift_bridgeObjectRelease();
        int64_t v21 = v52;
        uint64_t v18 = v50;
        unint64_t v20 = v58;
      }

      uint64_t result = sub_18919AE74();
      unint64_t v13 = v54;
      __int128 v39 = -1LL << *((_BYTE *)v54 + 32);
      __int128 v40 = result & ~v39;
      uint64_t v41 = v40 >> 6;
      if (((-1LL << v40) & ~*(void *)(v18 + 8 * (v40 >> 6))) != 0)
      {
        unint64_t v22 = __clz(__rbit64((-1LL << v40) & ~*(void *)(v18 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0LL;
        uint64_t v10 = v53;
      }

      else
      {
        unint64_t v42 = 0;
        unint64_t v43 = (unint64_t)(63 - v39) >> 6;
        uint64_t v10 = v53;
        do
        {
          if (++v41 == v43 && (v42 & 1) != 0)
          {
            __break(1u);
            goto LABEL_46;
          }

          char v44 = v41 == v43;
          if (v41 == v43) {
            uint64_t v41 = 0LL;
          }
          v42 |= v44;
          unint64_t v45 = *(void *)(v18 + 8 * v41);
        }

        while (v45 == -1);
        unint64_t v22 = __clz(__rbit64(~v45)) + (v41 << 6);
      }

      int64_t v23 = v61;
      *(void *)(v18 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v22;
      uint64_t result = sub_189198824( (uint64_t)v10,  v13[6] + v22 * v23,  type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
      uint64_t v24 = v13[7] + 16 * v22;
      *(void *)uint64_t v24 = v60;
      *(_BYTE *)(v24 + 8) = v59;
      ++v13[2];
      unint64_t v17 = v62;
    }
  }

  uint64_t result = swift_release();
  *uint64_t v3 = v13;
  return result;
}

uint64_t sub_1891967E4(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = type metadata accessor for HIDElement.Value();
  uint64_t v51 = *(void *)(v5 - 8);
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL);
  uint64_t v55 = *(void *)(v8 - 8);
  uint64_t v56 = v8;
  MEMORY[0x1895F8858](v8);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B348);
  int v57 = a2;
  uint64_t v12 = sub_18919AD90();
  unint64_t v13 = (void *)v12;
  if (*(void *)(v11 + 16))
  {
    uint64_t v47 = v3;
    uint64_t v14 = 1LL << *(_BYTE *)(v11 + 32);
    uint64_t v15 = *(void *)(v11 + 64);
    uint64_t v49 = (void *)(v11 + 64);
    if (v14 < 64) {
      uint64_t v16 = ~(-1LL << v14);
    }
    else {
      uint64_t v16 = -1LL;
    }
    unint64_t v17 = v16 & v15;
    int64_t v48 = (unint64_t)(v14 + 63) >> 6;
    uint64_t v18 = v12 + 64;
    uint64_t result = swift_retain();
    int64_t v20 = 0LL;
    uint64_t v21 = v11;
    uint64_t v52 = v11;
    uint64_t v53 = v10;
    uint64_t v54 = v13;
    uint64_t v50 = v18;
    while (1)
    {
      if (v17)
      {
        uint64_t v62 = (v17 - 1) & v17;
        unint64_t v25 = __clz(__rbit64(v17)) | (v20 << 6);
      }

      else
      {
        int64_t v26 = v20 + 1;
        if (__OFADD__(v20, 1LL))
        {
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
          return result;
        }

        if (v26 >= v48) {
          goto LABEL_38;
        }
        unint64_t v27 = v49[v26];
        ++v20;
        if (!v27)
        {
          int64_t v20 = v26 + 1;
          if (v26 + 1 >= v48) {
            goto LABEL_38;
          }
          unint64_t v27 = v49[v20];
          if (!v27)
          {
            int64_t v28 = v26 + 2;
            if (v28 >= v48)
            {
LABEL_38:
              swift_release();
              uint64_t v3 = v47;
              if ((v57 & 1) != 0)
              {
                uint64_t v46 = 1LL << *(_BYTE *)(v52 + 32);
                if (v46 >= 64) {
                  bzero(v49, ((unint64_t)(v46 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v49 = -1LL << v46;
                }
                *(void *)(v52 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
              }

              break;
            }

            unint64_t v27 = v49[v28];
            if (!v27)
            {
              while (1)
              {
                int64_t v20 = v28 + 1;
                if (__OFADD__(v28, 1LL)) {
                  goto LABEL_47;
                }
                if (v20 >= v48) {
                  goto LABEL_38;
                }
                unint64_t v27 = v49[v20];
                ++v28;
                if (v27) {
                  goto LABEL_21;
                }
              }
            }

            int64_t v20 = v28;
          }
        }

uint64_t sub_189196D0C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B320);
  uint64_t v6 = sub_18919AD90();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0LL;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }

    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1LL))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }

    if (v21 >= v35) {
      break;
    }
    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }

        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1LL)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }

        int64_t v13 = v24;
      }
    }

void sub_189197038(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = sub_18919AC34();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        unint64_t v10 = *(void **)(*(void *)(a2 + 48) + 8 * v6);
        sub_18919AE38();
        type metadata accessor for IOHIDElement();
        sub_1891646EC( &qword_18C77A330,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73F0);
        id v11 = v10;
        sub_18919A9AC();
        uint64_t v12 = sub_18919AE74();

        unint64_t v13 = v12 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v13 < v9) {
            goto LABEL_5;
          }
        }

        else if (v13 >= v9)
        {
          goto LABEL_11;
        }

        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          uint64_t v14 = *(void *)(a2 + 48);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || v15 >= v16 + 1) {
            *unint64_t v15 = *v16;
          }
          uint64_t v17 = *(void *)(a2 + 56);
          uint64_t v18 = (void *)(v17 + 8 * v3);
          unint64_t v19 = (void *)(v17 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v18 >= v19 + 1))
          {
            *uint64_t v18 = *v19;
            int64_t v3 = v6;
          }
        }

void sub_189197244(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = type metadata accessor for HIDDeviceClient.RequestElementUpdate(0LL);
  MEMORY[0x1895F8858](v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v13 = (void *)*v4;
  unint64_t v15 = (unint64_t)sub_189195424(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }

  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0) {
    goto LABEL_9;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_18919761C( type metadata accessor for HIDDeviceClient.RequestElementUpdate,  &qword_18C77B328,  (uint64_t (*)(uint64_t, uint64_t))sub_189198874);
    goto LABEL_9;
  }

  sub_189196300(v18, a4 & 1);
  uint64_t v21 = sub_189195424(a3);
  if ((v19 & 1) != (v22 & 1))
  {
LABEL_14:
    sub_18919ADF0();
    __break(1u);
    return;
  }

  unint64_t v15 = (unint64_t)v21;
LABEL_9:
  int v23 = a2 & 1;
  BOOL v24 = *v5;
  if ((v19 & 1) != 0)
  {
    uint64_t v25 = v24[7] + 16 * v15;
    sub_189198D78(*(id *)v25, *(_BYTE *)(v25 + 8));
    *(void *)uint64_t v25 = a1;
    *(_BYTE *)(v25 + 8) = v23 != 0;
  }

  else
  {
    sub_18919596C(a3, (uint64_t)v12, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
    sub_18919756C(v15, (uint64_t)v12, a1, v23, v24, type metadata accessor for HIDDeviceClient.RequestElementUpdate);
  }

void sub_1891973D8(uint64_t a1, char a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = type metadata accessor for HIDDeviceClient.ProvideElementUpdate(0LL);
  MEMORY[0x1895F8858](v10);
  uint64_t v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v13 = (void *)*v4;
  unint64_t v15 = sub_1891952F0(a3);
  uint64_t v16 = v13[2];
  BOOL v17 = (v14 & 1) == 0;
  uint64_t v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }

  char v19 = v14;
  uint64_t v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0) {
    goto LABEL_9;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_18919761C( type metadata accessor for HIDDeviceClient.ProvideElementUpdate,  &qword_18C77B348,  (uint64_t (*)(uint64_t, uint64_t))sub_189198868);
    goto LABEL_9;
  }

  sub_1891967E4(v18, a4 & 1);
  unint64_t v21 = sub_1891952F0(a3);
  if ((v19 & 1) != (v22 & 1))
  {
LABEL_14:
    sub_18919ADF0();
    __break(1u);
    return;
  }

  unint64_t v15 = v21;
LABEL_9:
  int v23 = a2 & 1;
  BOOL v24 = *v5;
  if ((v19 & 1) != 0)
  {
    uint64_t v25 = v24[7] + 16 * v15;
    sub_18919A484(*(id *)v25, *(_BYTE *)(v25 + 8));
    *(void *)uint64_t v25 = a1;
    *(_BYTE *)(v25 + 8) = v23 != 0;
  }

  else
  {
    sub_18919596C(a3, (uint64_t)v12, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
    sub_18919756C(v15, (uint64_t)v12, a1, v23, v24, type metadata accessor for HIDDeviceClient.ProvideElementUpdate);
  }

uint64_t sub_18919756C( unint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5, uint64_t (*a6)(void))
{
  a5[(a1 >> 6) + 8] |= 1LL << a1;
  uint64_t v12 = a5[6];
  uint64_t v13 = a6(0LL);
  uint64_t result = sub_189198824(a2, v12 + *(void *)(*(void *)(v13 - 8) + 72LL) * a1, a6);
  uint64_t v15 = a5[7] + 16 * a1;
  *(void *)uint64_t v15 = a3;
  *(_BYTE *)(v15 + 8) = a4 & 1;
  uint64_t v16 = a5[2];
  BOOL v17 = __OFADD__(v16, 1LL);
  uint64_t v18 = v16 + 1;
  if (v17) {
    __break(1u);
  }
  else {
    a5[2] = v18;
  }
  return result;
}

void *sub_18919761C( uint64_t (*a1)(void), uint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v36 = a3;
  uint64_t v6 = a1(0LL);
  uint64_t v35 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = (char *)&v31 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  id v32 = v3;
  uint64_t v9 = *v3;
  uint64_t v10 = sub_18919AD84();
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)(v9 + 16);
  if (!v12)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *id v32 = v11;
    return result;
  }

  uint64_t result = (void *)(v10 + 64);
  unint64_t v14 = (unint64_t)((1LL << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 64 + 8 * v14)
  {
    uint64_t result = memmove(result, (const void *)(v9 + 64), 8 * v14);
    uint64_t v12 = *(void *)(v9 + 16);
  }

  int64_t v16 = 0LL;
  *(void *)(v11 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v12;
  uint64_t v17 = 1LL << *(_BYTE *)(v9 + 32);
  uint64_t v18 = -1LL;
  if (v17 < 64) {
    uint64_t v18 = ~(-1LL << v17);
  }
  unint64_t v19 = v18 & *(void *)(v9 + 64);
  uint64_t v33 = v9 + 64;
  int64_t v34 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      unint64_t v20 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v21 = v20 | (v16 << 6);
      goto LABEL_12;
    }

    int64_t v28 = v16 + 1;
    if (__OFADD__(v16, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v28 >= v34) {
      goto LABEL_26;
    }
    unint64_t v29 = *(void *)(v33 + 8 * v28);
    ++v16;
    if (!v29)
    {
      int64_t v16 = v28 + 1;
      if (v28 + 1 >= v34) {
        goto LABEL_26;
      }
      unint64_t v29 = *(void *)(v33 + 8 * v16);
      if (!v29) {
        break;
      }
    }

id sub_189197860()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B320);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_18919AD84();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }

  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1LL << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  int64_t v9 = 0LL;
  *(void *)(v4 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = *(void *)(v2 + 16);
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

    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }

size_t sub_189197A04(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_189197A20(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_189197A20(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if ((a3 & 1) != 0)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000LL < 0)
      {
LABEL_30:
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

  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    int64_t v13 = (void *)MEMORY[0x18961AFE8];
    goto LABEL_19;
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B340);
  uint64_t v10 = *(void *)(type metadata accessor for HIDElement.Value() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  int64_t v13 = (void *)swift_allocObject();
  size_t result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }

  if (result - v12 == 0x8000000000000000LL && v11 == -1) {
    goto LABEL_29;
  }
  _OWORD v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(type metadata accessor for HIDElement.Value() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }

    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
  }

  else
  {
    swift_arrayInitWithCopy();
  }

  swift_release();
  return (size_t)v13;
}

uint64_t sub_189197B94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t result = sub_18919AE44();
  if (v3)
  {
    uint64_t v5 = a2 + 32;
    sub_18919A264();
    do
    {
      uint64_t result = sub_18919AA24();
      v5 += 128LL;
      --v3;
    }

    while (v3);
  }

  return result;
}

uint64_t sub_189197C3C(uint64_t a1)
{
  if ((a1 & 0xC000000000000001LL) != 0) {
    return sub_18919ACE8();
  }
  unint64_t v2 = *(void *)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = 0LL;
    return __clz(__rbit64(v2)) + v3;
  }

  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  uint64_t v1 = 1LL << v5;
  if (v6 < 7) {
    return v1;
  }
  unint64_t v2 = *(void *)(a1 + 72);
  if (v2)
  {
    uint64_t v3 = 64LL;
    return __clz(__rbit64(v2)) + v3;
  }

  unint64_t v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2LL;
  }
  unint64_t v8 = v7 - 2;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v3 = 64LL;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v2 = v10;
    --v8;
    v3 += 64LL;
    if (v10) {
      return __clz(__rbit64(v2)) + v3;
    }
  }

  return v1;
}

void sub_189197CFC(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1LL << *(_BYTE *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }

    else if (((*(void *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
        sub_18919AC40();
        return;
      }

      goto LABEL_12;
    }

    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }

  if (sub_18919AD18() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }

  sub_18919AD24();
  sub_18919A2B4(a1, a2, 1);
  type metadata accessor for IOHIDElement();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_1891954F0((uint64_t)v8);
  char v7 = v6;

  if ((v7 & 1) != 0)
  {
    sub_18919AD00();
    sub_18919AD3C();
    sub_18919A2A8(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }

void sub_189197E88(void *a1, uint64_t a2, int a3, char a4, uint64_t a5)
{
  unint64_t v6 = a2;
  if ((a5 & 0xC000000000000001LL) != 0)
  {
    if ((a4 & 1) != 0)
    {
      sub_18919AD48();
      type metadata accessor for IOHIDElement();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      type metadata accessor for IOHIDValue(0LL);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v13;
      swift_unknownObjectRelease();
      return;
    }

    goto LABEL_18;
  }

  if ((a4 & 1) != 0)
  {
LABEL_10:
    if (sub_18919AD18() == *(_DWORD *)(a5 + 36))
    {
      sub_18919AD24();
      type metadata accessor for IOHIDElement();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      unint64_t v6 = sub_1891954F0((uint64_t)v13);
      char v9 = v8;

      if ((v9 & 1) != 0) {
        goto LABEL_12;
      }
LABEL_17:
      __break(1u);
LABEL_18:
      __break(1u);
      return;
    }

uint64_t sub_189198084(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A800);
  uint64_t result = MEMORY[0x1895F8858](v6);
  char v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a3 && (a2 | 0x10) == 0xE0000110 && (a3 & 1) != 0)
  {
    if (a1)
    {
      type metadata accessor for HIDDeviceClient.Context();
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a1;
      dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
      uint64_t v12 = sub_18919AB20();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 1LL, 1LL, v12);
      uint64_t v13 = swift_allocObject();
      *(void *)(v13 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
      *(void *)(v13 + 24) = 0LL;
      *(void *)(v13 + 32) = v10;
      *(_DWORD *)(v13 + 40) = a2;
      *(_DWORD *)(v13 + 44) = -536870656;
      *(void *)(v13 + 48) = v11;
      swift_retain();
      unint64_t v14 = v11;
      sub_1891626B4((uint64_t)v9, (uint64_t)&unk_18C77B3B0, v13);
      swift_release();
      sub_18919AB80();

      return swift_release();
    }

    else
    {
      __break(1u);
    }
  }

  return result;
}

uint64_t sub_1891981CC(_BYTE *__src, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 <= 14) {
    return sub_1891656D8(__src, &__src[a2]);
  }
  sub_18919A8EC();
  swift_allocObject();
  sub_18919A8B0();
  sub_18919A94C();
  uint64_t result = swift_allocObject();
  *(void *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
  *(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_189198278(uint64_t a1, int a2, _BYTE *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A800);
  uint64_t result = MEMORY[0x1895F8858](v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    type metadata accessor for HIDDeviceClient.Context();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a1;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
    uint64_t v16 = sub_1891981CC(a3, a4);
    unint64_t v18 = v17;
    uint64_t v19 = sub_18919AB20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56LL))(v13, 1LL, 1LL, v19);
    uint64_t v20 = swift_allocObject();
    *(void *)(v20 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0LL;
    *(void *)(v20 + 24) = 0LL;
    *(void *)(v20 + 32) = v14;
    *(_DWORD *)(v20 + 40) = a2;
    *(void *)(v20 + 48) = v16;
    *(void *)(v20 + 56) = v18;
    *(void *)(v20 + 64) = a5;
    *(void *)(v20 + 72) = v15;
    swift_retain();
    sub_18915EC34(v16, v18);
    unint64_t v21 = v15;
    sub_1891626B4((uint64_t)v13, (uint64_t)&unk_18C77B390, v20);
    swift_release();
    sub_18919AB80();
    sub_18915EC78(v16, v18);

    return swift_release();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_1891983D8(uint64_t a1, void *a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A800);
  uint64_t result = MEMORY[0x1895F8858](v4);
  char v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    type metadata accessor for HIDDeviceClient.Context();
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = a1;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
    unint64_t v18 = a2;
    type metadata accessor for IOHIDValue(0LL);
    uint64_t v11 = v10;
    id v12 = a2;
    sub_189185FFC((uint64_t)&v18, v11, (uint64_t)&v19);
    uint64_t v13 = v19;
    uint64_t v14 = sub_18919AB20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v7, 1LL, 1LL, v14);
    dispatch_semaphore_t v15 = (void *)swift_allocObject();
    _OWORD v15[2] = 0LL;
    v15[3] = 0LL;
    v15[4] = v8;
    v15[5] = v13;
    v15[6] = v9;
    swift_retain();
    id v16 = v13;
    unint64_t v17 = v9;
    sub_1891626B4((uint64_t)v7, (uint64_t)&unk_18C77B380, (uint64_t)v15);
    swift_release();
    sub_18919AB80();

    return swift_release();
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t sub_18919852C(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  while (v4)
  {
    uint64_t v5 = 0LL;
    while (1)
    {
      if ((a1 & 0xC000000000000001LL) != 0)
      {
        uint64_t v6 = MEMORY[0x1895E1604](v5, a1);
        swift_unknownObjectRelease();
        if (v6 == a2) {
          return v5;
        }
      }

      else if (*(void *)(a1 + 8 * v5 + 32) == a2)
      {
        return v5;
      }

      if (__OFADD__(v5, 1LL)) {
        break;
      }
      if (++v5 == v4) {
        return 0LL;
      }
    }

    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_18919AD78();
    swift_bridgeObjectRelease();
  }

  return 0LL;
}

uint64_t sub_189198618(uint64_t a1)
{
  return sub_18918BA84(a1, v1[2], v1[3], v1[4]);
}

void sub_189198624(uint64_t a1)
{
}

uint64_t sub_18919866C(uint64_t a1)
{
  uint64_t v3 = *(void **)(v1 + 16);
  uint64_t v4 = *(CFIndex **)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  char v6 = *(_BYTE *)(v1 + 56);
  char v7 = *(_BYTE *)(v1 + 57);
  int v20 = *(unsigned __int8 *)(v1 + 59);
  unsigned int v21 = *(unsigned __int8 *)(v1 + 58);
  report = *(uint8_t **)(v1 + 64);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB98);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 24LL))(v3, a1, v8);
  CFIndex *v4 = *(void *)(v5 + 328);
  double v9 = 0.0;
  if ((v6 & 1) == 0)
  {
    double v10 = (double)sub_18919AE98() * 1000.0;
    sub_18919AE98();
    double v9 = v10 + (double)v11 / 1000000.0;
  }

  id v12 = *(__IOHIDDevice **)(v5 + 296);
  LOBYTE(v23) = v7;
  IOHIDReportType v13 = sub_18915F9F4((unsigned __int8 *)&v23);
  if (v20) {
    CFIndex v14 = 0LL;
  }
  else {
    CFIndex v14 = v21;
  }
  uint64_t ReportWithCallback = IOHIDDeviceGetReportWithCallback( v12,  v13,  v14,  report,  v4,  v9,  (IOHIDReportCallback)sub_18918CDD4,  v3);
  uint64_t result = sub_189185BBC(ReportWithCallback, (uint64_t)&v23);
  if ((v23 & 0x10000000000LL) == 0)
  {
    unint64_t v17 = v23 | ((unint64_t)BYTE4(v23) << 32);
    sub_189165504();
    uint64_t v18 = swift_allocError();
    *(_DWORD *)uint64_t v19 = v17;
    *(_BYTE *)(v19 + 4) = BYTE4(v17) & 1;
    uint64_t v23 = v18;
    return sub_18919AAFC();
  }

  return result;
}

uint64_t type metadata accessor for HIDDeviceClient.ProvideElementUpdate(uint64_t a1)
{
  return sub_1891997E4(a1, (uint64_t *)&unk_18C77FC30);
}

uint64_t type metadata accessor for HIDDeviceClient.RequestElementUpdate(uint64_t a1)
{
  return sub_1891997E4(a1, qword_18C77FC40);
}

uint64_t sub_189198824(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32LL))(a2, a1, v5);
  return a2;
}

id sub_189198868(id result, char a2)
{
  if ((a2 & 1) != 0) {
    return result;
  }
  return result;
}

id sub_189198874(id a1, char a2)
{
  if ((a2 & 1) != 0) {
    return a1;
  }
  else {
    return (id)swift_bridgeObjectRetain();
  }
}

uint64_t sub_189198880(uint64_t a1)
{
  uint64_t v3 = (void *)*((void *)v1 + 2);
  uint64_t v4 = *((void *)v1 + 3);
  uint64_t v5 = (CFDictionaryRef *)*((void *)v1 + 5);
  CFTimeInterval v6 = v1[6];
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABC8);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 24LL))(v3, a1, v7);
  uint64_t v8 = *(__IOHIDDevice **)(v4 + 296);
  type metadata accessor for IOHIDElement();
  double v9 = (const __CFArray *)sub_18919AAB4();
  uint64_t v10 = IOHIDDeviceCopyValueMultipleWithCallback(v8, v9, v5, v6, (IOHIDValueMultipleCallback)sub_189194B20, v3);

  uint64_t result = sub_189185BBC(v10, (uint64_t)&v14);
  if ((v16 & 1) == 0)
  {
    unint64_t v12 = v14 | ((unint64_t)v15 << 32);
    sub_189165504();
    swift_allocError();
    *(_DWORD *)uint64_t v13 = v12;
    *(_BYTE *)(v13 + 4) = BYTE4(v12) & 1;
    return sub_18919AAFC();
  }

  return result;
}

uint64_t sub_189198998@<X0>(void *a1@<X0>, __IOHIDValue *a2@<X1>, _OWORD *a3@<X8>)
{
  return sub_189194B64(a1, a2, v3, a3);
}

void sub_1891989A0(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB98);
  uint64_t v9 = *(void *)(v8 - 8);
  double v10 = MEMORY[0x1895F8858](v8);
  unint64_t v12 = (char *)v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, double))(v9 + 16))(v12, a1, v8, v10);
    sub_189185BBC(a2, (uint64_t)v17);
    if ((v17[0] & 0x10000000000LL) != 0)
    {
      v17[0] = sub_1891981CC(a3, a4);
      v17[1] = v13;
      sub_18919AB08();
    }

    else
    {
      unint64_t v14 = LODWORD(v17[0]) | ((unint64_t)BYTE4(v17[0]) << 32);
      sub_189165504();
      uint64_t v15 = swift_allocError();
      *(_DWORD *)uint64_t v16 = v14;
      *(_BYTE *)(v16 + 4) = BYTE4(v14) & 1;
      v17[0] = v15;
      sub_18919AAFC();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }

  else
  {
    __break(1u);
  }

uint64_t sub_189198AC8(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  id v32 = a2;
  uint64_t v33 = a3;
  uint64_t v4 = type metadata accessor for HIDElement.Value();
  uint64_t v31 = *(void *)(v4 - 8);
  MEMORY[0x1895F8858](v4);
  CFTimeInterval v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v30 = a1 & 0xC000000000000001LL;
  if ((a1 & 0xC000000000000001LL) != 0) {
    uint64_t v7 = sub_18919AD30();
  }
  else {
    uint64_t v7 = *(void *)(a1 + 16);
  }
  uint64_t result = MEMORY[0x18961AFE8];
  if (v7)
  {
    uint64_t v38 = MEMORY[0x18961AFE8];
    sub_189197A04(0LL, v7 & ~(v7 >> 63), 0);
    uint64_t result = sub_189197C3C(a1);
    uint64_t v35 = result;
    uint64_t v36 = v9;
    char v37 = v10 & 1;
    if (v7 < 0)
    {
      __break(1u);
LABEL_22:
      __break(1u);
    }

    else
    {
      uint64_t v11 = a1 & 0xFFFFFFFFFFFFFF8LL;
      if (a1 < 0) {
        uint64_t v11 = a1;
      }
      _OWORD v29[2] = v11;
      do
      {
        while (1)
        {
          uint64_t v19 = v35;
          uint64_t v18 = v36;
          char v20 = v37;
          uint64_t v21 = a1;
          sub_189197E88(v34, v35, v36, v37, a1);
          uint64_t v23 = v22;
          uint64_t v24 = (void *)v34[0];
          v32();

          uint64_t v25 = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_189197A04(0LL, *(void *)(v25 + 16) + 1LL, 1);
            uint64_t v25 = v38;
          }

          unint64_t v27 = *(void *)(v25 + 16);
          unint64_t v26 = *(void *)(v25 + 24);
          if (v27 >= v26 >> 1)
          {
            sub_189197A04(v26 > 1, v27 + 1, 1);
            uint64_t v25 = v38;
          }

          *(void *)(v25 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v27 + 1;
          uint64_t result = sub_189198824( (uint64_t)v6,  v25 + ((*(unsigned __int8 *)(v31 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80))
                   + *(void *)(v31 + 72) * v27,
                     (uint64_t (*)(void))type metadata accessor for HIDElement.Value);
          if (v30) {
            break;
          }
          a1 = v21;
          sub_189197CFC(v19, v18, v20, v21);
          uint64_t v13 = v12;
          uint64_t v15 = v14;
          char v17 = v16;
          sub_18919A2A8(v19, v18, v20);
          uint64_t v35 = v13;
          uint64_t v36 = v15;
          char v37 = v17 & 1;
          if (!--v7) {
            goto LABEL_19;
          }
        }

        if ((v20 & 1) == 0) {
          goto LABEL_22;
        }
        a1 = v21;
        if (sub_18919AD0C()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_18C77B338);
        int64_t v28 = (void (*)(void *, void))sub_18919AA18();
        sub_18919AD6C();
        v28(v34, 0LL);
        --v7;
      }

      while (v7);
LABEL_19:
      sub_18919A2A8(v35, v36, v37);
      return v38;
    }
  }

  return result;
}

void sub_189198D78(id a1, char a2)
{
  if ((a2 & 1) != 0) {

  }
  else {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_189198D84(uint64_t a1)
{
  return sub_1891948FC( a1,  *(void **)(v1 + 16),  *(void *)(v1 + 24),  *(CFTimeInterval *)(v1 + 40),  *(void *)(v1 + 32),  *(uint64_t **)(v1 + 48),  *(void *)(v1 + 56));
}

unint64_t sub_189198D9C()
{
  unint64_t result = qword_18C77ABE0;
  if (!qword_18C77ABE0)
  {
    unint64_t result = MEMORY[0x1895E1ED4]( &protocol conformance descriptor for HIDDeviceClient.DeviceReference,  &type metadata for HIDDeviceClient.DeviceReference);
    atomic_store(result, (unint64_t *)&qword_18C77ABE0);
  }

  return result;
}

uint64_t sub_189198DE0(uint64_t a1)
{
  uint64_t result = sub_1891646EC( &qword_18C77ABE8,  255LL,  type metadata accessor for HIDDeviceClient.ProvideElementUpdate,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient.ProvideElementUpdate);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_189198E20()
{
  return sub_1891646EC( &qword_18C77ABF0,  255LL,  type metadata accessor for HIDDeviceClient.ProvideElementUpdate,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient.ProvideElementUpdate);
}

uint64_t sub_189198E50(uint64_t a1)
{
  uint64_t result = sub_1891646EC( &qword_18C77ABF8,  255LL,  type metadata accessor for HIDDeviceClient.RequestElementUpdate,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient.RequestElementUpdate);
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_189198E90()
{
  return sub_1891646EC( &qword_18C77AC00,  255LL,  type metadata accessor for HIDDeviceClient.RequestElementUpdate,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient.RequestElementUpdate);
}

uint64_t sub_189198EC0(uint64_t a1, uint64_t a2)
{
  return sub_1891646EC( &qword_18C77AC08,  a2,  (uint64_t (*)(uint64_t))type metadata accessor for HIDDeviceClient,  (uint64_t)&protocol conformance descriptor for HIDDeviceClient);
}

uint64_t sub_189198EEC()
{
  return 0LL;
}

uint64_t method lookup function for HIDDeviceClient()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HIDDeviceClient.descriptor.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 320LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.deviceUsages.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 344LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.transport.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 368LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.product.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 392LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.manufacturer.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 416LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.modelNumber.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 440LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.versionNumber.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 464LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.serialNumber.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 488LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.uniqueID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 512LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.locationID.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 536LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.localizationCode.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 560LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.isBuiltIn.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 584LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.elements.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 608LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.__allocating_init(deviceReference:)()
{
  return (*(uint64_t (**)(void))(v0 + 776))();
}

uint64_t dispatch thunk of HIDDeviceClient.seizeDevice()()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 816LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.monitorNotifications(reportIDsToMonitor:elementsToMonitor:)()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 840LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.subscript.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 848LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.subscript.setter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 856LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.subscript.modify()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 864LL))();
}

uint64_t dispatch thunk of HIDDeviceClient.dispatchSetReportRequest(type:id:data:timeout:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v15 = a7 & 1;
  char v16 = (void *)swift_task_alloc();
  *(void *)(v8 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v16;
  void *v16 = v8;
  v16[1] = sub_189164A48;
  return v18(a1, a2, a3, a4, a5, a6, v15);
}

uint64_t dispatch thunk of HIDDeviceClient.dispatchGetReportRequest(type:id:timeout:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v11 = a5 & 1;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_18916531C;
  return v14(a1, a2, a3, a4, v11);
}

uint64_t dispatch thunk of HIDDeviceClient.updateElements(_:timeout:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v11 = a5 & 1;
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v6 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v12;
  *uint64_t v12 = v6;
  v12[1] = sub_189164A48;
  return v14(a1, a2, a3, a4, v11);
}

ValueMetadata *type metadata accessor for HIDDeviceClient.DeviceReference()
{
  return &type metadata for HIDDeviceClient.DeviceReference;
}

uint64_t *initializeBufferWithCopyOfBuffer for HIDDeviceClient.Notification( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 - 8);
  int v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v6 + 16LL) & ~(unint64_t)v6));
    swift_retain();
  }

  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }

    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(v5 + 64));
    }

    else
    {
      *(_WORD *)a1 = *(_WORD *)a2;
      uint64_t v8 = a2[1];
      unint64_t v9 = a2[2];
      sub_18915EC34(v8, v9);
      a1[1] = v8;
      a1[2] = v9;
      uint64_t v10 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB60) + 64);
      uint64_t v11 = (char *)a1 + v10;
      uint64_t v12 = (char *)a2 + v10;
      uint64_t v13 = sub_18919ACC4();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v13 - 8) + 16LL))(v11, v12, v13);
      swift_storeEnumTagMultiPayload();
    }
  }

  return a1;
}

uint64_t destroy for HIDDeviceClient.Notification(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1) {
    return swift_bridgeObjectRelease();
  }
  if (!(_DWORD)result)
  {
    sub_18915EC78(*(void *)(a1 + 8), *(void *)(a1 + 16));
    uint64_t v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB60) + 64);
    uint64_t v4 = sub_18919ACC4();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  }

  return result;
}

void *initializeWithCopy for HIDDeviceClient.Notification(void *a1, void *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }

  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    uint64_t v7 = a2[1];
    unint64_t v8 = a2[2];
    sub_18915EC34(v7, v8);
    a1[1] = v7;
    a1[2] = v8;
    uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB60) + 64);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = sub_18919ACC4();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
    swift_storeEnumTagMultiPayload();
  }

  return a1;
}

void *assignWithCopy for HIDDeviceClient.Notification(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1891959B0((uint64_t)a1, type metadata accessor for HIDDeviceClient.Notification);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_bridgeObjectRetain();
      swift_storeEnumTagMultiPayload();
    }

    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }

    else
    {
      *(_WORD *)a1 = *(_WORD *)a2;
      uint64_t v7 = a2[1];
      unint64_t v8 = a2[2];
      sub_18915EC34(v7, v8);
      a1[1] = v7;
      a1[2] = v8;
      uint64_t v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB60) + 64);
      uint64_t v10 = (char *)a1 + v9;
      uint64_t v11 = (char *)a2 + v9;
      uint64_t v12 = sub_18919ACC4();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
      swift_storeEnumTagMultiPayload();
    }
  }

  return a1;
}

_WORD *initializeWithTake for HIDDeviceClient.Notification(_WORD *a1, _WORD *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
  }

  else
  {
    *a1 = *a2;
    *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
    uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB60) + 64);
    uint64_t v7 = (char *)a1 + v6;
    unint64_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_18919ACC4();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }

  return a1;
}

_WORD *assignWithTake for HIDDeviceClient.Notification(_WORD *a1, _WORD *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_1891959B0((uint64_t)a1, type metadata accessor for HIDDeviceClient.Notification);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64LL));
    }

    else
    {
      *a1 = *a2;
      *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
      uint64_t v6 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_18C77AB60) + 64);
      uint64_t v7 = (char *)a1 + v6;
      unint64_t v8 = (char *)a2 + v6;
      uint64_t v9 = sub_18919ACC4();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
  }

  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceClient.Notification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48LL))();
}

uint64_t storeEnumTagSinglePayload for HIDDeviceClient.Notification( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56LL))();
}

uint64_t sub_18919972C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_18919973C()
{
  uint64_t result = sub_18919ACC4();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout3();
    v2[4] = v2;
    v2[5] = MEMORY[0x189617748] + 64LL;
    swift_initEnumMetadataMultiPayload();
    return 0LL;
  }

  return result;
}

uint64_t sub_1891997C8()
{
  return type metadata accessor for HIDDeviceClient.StreamWrapper(0LL);
}

uint64_t type metadata accessor for HIDDeviceClient.StreamWrapper(uint64_t a1)
{
  return sub_1891997E4(a1, (uint64_t *)&unk_18C77FC20);
}

uint64_t sub_1891997E4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_189199818()
{
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_189199894()
{
  if (!qword_18C77B0A8[0])
  {
    type metadata accessor for HIDDeviceClient.Notification(255LL);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_18C77A970);
    unint64_t v0 = sub_18919AB50();
    if (!v1) {
      atomic_store(v0, qword_18C77B0A8);
    }
  }

ValueMetadata *type metadata accessor for HIDDeviceClient.UnsafeProperty()
{
  return &type metadata for HIDDeviceClient.UnsafeProperty;
}

uint64_t *initializeBufferWithCopyOfBuffer for HIDDeviceClient.ProvideElementUpdate( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = sub_18919ACC4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }

  return a1;
}

uint64_t initializeWithCopy for HIDDeviceClient.ProvideElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HIDDeviceClient.ProvideElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for HIDDeviceClient.ProvideElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for HIDDeviceClient.ProvideElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceClient.ProvideElementUpdate()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for HIDDeviceClient.ProvideElementUpdate()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_189199B50()
{
  uint64_t result = sub_18919ACC4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

void *initializeBufferWithCopyOfBuffer for HIDDeviceClient.RequestElementUpdate( void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (void *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = sub_18919ACC4();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 24);
    *(void *)((char *)a1 + *(int *)(a3 + 20)) = *(void *)((char *)a2 + *(int *)(a3 + 20));
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    swift_bridgeObjectRetain();
  }

  return a1;
}

uint64_t _s7CoreHID15HIDDeviceClientC20ProvideElementUpdateVwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for HIDDeviceClient.RequestElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for HIDDeviceClient.RequestElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + (*(void (**)(void))(v0 + 32))(*(void *)(v0 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for HIDDeviceClient.RequestElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for HIDDeviceClient.RequestElementUpdate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919ACC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + (*(void (**)(void))(v0 + 32))(*(void *)(v0 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceClient.RequestElementUpdate()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_18919ACC4();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDDeviceClient.RequestElementUpdate()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_18919ACC4();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_189199F64()
{
  uint64_t result = sub_18919ACC4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t destroy for HIDDeviceClient.HIDElementUpdateResult()
{
  return swift_bridgeObjectRelease();
}

void *_s7CoreHID15HIDDeviceClientC22HIDElementUpdateResultVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for HIDDeviceClient.HIDElementUpdateResult(void *a1, void *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for HIDDeviceClient.HIDElementUpdateResult(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for HIDDeviceClient.HIDElementUpdateResult(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HIDDeviceClient.HIDElementUpdateResult(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)uint64_t result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 1;
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
      *(void *)uint64_t result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for HIDDeviceClient.HIDElementUpdateResult()
{
  return &type metadata for HIDDeviceClient.HIDElementUpdateResult;
}

uint64_t type metadata accessor for HIDDeviceClient.Context()
{
  return objc_opt_self();
}

void type metadata accessor for IOHIDValue(uint64_t a1)
{
}

uint64_t sub_18919A1A4()
{
  return sub_1891646EC( &qword_18C77B310,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice,  (uint64_t)&unk_1891A7320);
}

uint64_t sub_18919A1D4()
{
  return sub_1891646EC( &qword_18C77A448,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A7388);
}

uint64_t sub_18919A204()
{
  return sub_1891646EC( &qword_18C77A450,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73B0);
}

uint64_t sub_18919A234()
{
  return sub_1891646EC( &qword_18C77B318,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDDevice,  (uint64_t)&unk_1891A7348);
}

unint64_t sub_18919A264()
{
  unint64_t result = qword_18C77B330;
  if (!qword_18C77B330)
  {
    unint64_t result = MEMORY[0x1895E1ED4](&protocol conformance descriptor for HIDElement, &type metadata for HIDElement);
    atomic_store(result, (unint64_t *)&qword_18C77B330);
  }

  return result;
}

uint64_t sub_18919A2A8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_18919A2B4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_18919A2C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77A320);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

void sub_18919A308(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_18C77ABC8);
  uint64_t v5 = *(void *)(v4 - 8);
  double v6 = MEMORY[0x1895F8858](v4);
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16))(v8, a1, v4, v6);
    sub_189185BBC(a2, (uint64_t)&v13);
    if ((v13 & 0x10000000000LL) == 0)
    {
      unint64_t v9 = v13 | ((unint64_t)BYTE4(v13) << 32);
      sub_189165504();
      uint64_t v10 = swift_allocError();
      *(_DWORD *)uint64_t v11 = v9;
      *(_BYTE *)(v11 + 4) = BYTE4(v9) & 1;
      uint64_t v13 = v10;
      sub_18919AAFC();
      goto LABEL_6;
    }

    uint64_t v13 = 0LL;
    type metadata accessor for IOHIDElement();
    type metadata accessor for IOHIDValue(0LL);
    sub_1891646EC( &qword_18C77A450,  255LL,  (uint64_t (*)(uint64_t))type metadata accessor for IOHIDElement,  (uint64_t)&unk_1891A73B0);
    sub_18919AA0C();
    if (v13)
    {
      sub_18919AB08();
LABEL_6:
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      return;
    }
  }

  else
  {
    __break(1u);
  }

  __break(1u);
}

void sub_18919A484(id a1, char a2)
{
  if ((a2 & 1) != 0) {
}
  }

uint64_t sub_18919A490(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

void sub_18919A4D4(uint64_t a1)
{
}

uint64_t sub_18919A518()
{
  return swift_deallocObject();
}

uint64_t sub_18919A544()
{
  return sub_18918BDC4(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_18919A54C()
{
  return swift_deallocObject();
}

uint64_t sub_18919A580()
{
  uint64_t v2 = swift_task_alloc();
  __int128 v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_1891659B0;
  *(_OWORD *)(v2 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v3;
  *(void *)(v2 + 32) = *(void *)(*(void *)v3 + 832LL);
  return swift_task_switch();
}

uint64_t sub_18919A5EC()
{
  return swift_deallocObject();
}

uint64_t sub_18919A610()
{
  return swift_deallocObject();
}

uint64_t sub_18919A64C()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_1891659B0;
  return sub_189189E58((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t sub_18919A6AC()
{
  return swift_deallocObject();
}

uint64_t sub_18919A6E8()
{
  uint64_t v2 = *(void *)(v0 + 32);
  int v3 = *(_DWORD *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = *(void *)(v0 + 64);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_1891659B0;
  return sub_189189C64((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_18919A764()
{
  return swift_deallocObject();
}

uint64_t sub_18919A798()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_1891659B0;
  return sub_189189A90((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_18919A7E8()
{
  return swift_deallocObject();
}

uint64_t sub_18919A81C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  int v3 = *(_DWORD *)(v0 + 40);
  int v4 = *(_DWORD *)(v0 + 44);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + __swift_destroy_boxed_opaque_existential_1(v0 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_1891659B0;
  return sub_189189904((uint64_t)v6, v7, v8, v2, v3, v4, v5);
}

void sub_18919A884()
{
}

uint64_t sub_18919A8A4()
{
  return MEMORY[0x1896061F0]();
}

uint64_t sub_18919A8B0()
{
  return MEMORY[0x189606200]();
}

uint64_t sub_18919A8BC()
{
  return MEMORY[0x189606208]();
}

uint64_t sub_18919A8C8()
{
  return MEMORY[0x189606218]();
}

uint64_t sub_18919A8D4()
{
  return MEMORY[0x189606230]();
}

uint64_t sub_18919A8E0()
{
  return MEMORY[0x189606240]();
}

uint64_t sub_18919A8EC()
{
  return MEMORY[0x189606260]();
}

uint64_t sub_18919A8F8()
{
  return MEMORY[0x189606290]();
}

uint64_t sub_18919A904()
{
  return MEMORY[0x1896062A0]();
}

uint64_t sub_18919A910()
{
  return MEMORY[0x1896062B0]();
}

uint64_t sub_18919A91C()
{
  return MEMORY[0x189606AF8]();
}

uint64_t sub_18919A928()
{
  return MEMORY[0x189606B20]();
}

uint64_t sub_18919A934()
{
  return MEMORY[0x189606B48]();
}

uint64_t sub_18919A940()
{
  return MEMORY[0x189606B60]();
}

uint64_t sub_18919A94C()
{
  return MEMORY[0x189606BA8]();
}

uint64_t sub_18919A958()
{
  return MEMORY[0x189606C30]();
}

uint64_t sub_18919A964()
{
  return MEMORY[0x189606C58]();
}

uint64_t sub_18919A970()
{
  return MEMORY[0x189606CA8]();
}

uint64_t sub_18919A97C()
{
  return MEMORY[0x189606D08]();
}

uint64_t sub_18919A988()
{
  return MEMORY[0x189606D28]();
}

uint64_t sub_18919A994()
{
  return MEMORY[0x189606D38]();
}

uint64_t sub_18919A9A0()
{
  return MEMORY[0x18961B560]();
}

uint64_t sub_18919A9AC()
{
  return MEMORY[0x18961B568]();
}

uint64_t sub_18919A9B8()
{
  return MEMORY[0x18961B580]();
}

uint64_t sub_18919A9C4()
{
  return MEMORY[0x18961B6E8]();
}

uint64_t sub_18919A9D0()
{
  return MEMORY[0x18961B708]();
}

uint64_t sub_18919A9DC()
{
  return MEMORY[0x1896177F0]();
}

uint64_t sub_18919A9E8()
{
  return MEMORY[0x1896177F8]();
}

uint64_t sub_18919A9F4()
{
  return MEMORY[0x189617800]();
}

uint64_t sub_18919AA00()
{
  return MEMORY[0x189607050]();
}

uint64_t sub_18919AA0C()
{
  return MEMORY[0x189607060]();
}

uint64_t sub_18919AA18()
{
  return MEMORY[0x189617868]();
}

uint64_t sub_18919AA24()
{
  return MEMORY[0x189617A00]();
}

uint64_t sub_18919AA30()
{
  return MEMORY[0x189617B30]();
}

uint64_t sub_18919AA3C()
{
  return MEMORY[0x189617B40]();
}

uint64_t sub_18919AA48()
{
  return MEMORY[0x189617B48]();
}

uint64_t sub_18919AA54()
{
  return MEMORY[0x189617B50]();
}

uint64_t sub_18919AA60()
{
  return MEMORY[0x189617C20]();
}

uint64_t sub_18919AA6C()
{
  return MEMORY[0x1896070D8]();
}

uint64_t sub_18919AA78()
{
  return MEMORY[0x189607138]();
}

uint64_t sub_18919AA84()
{
  return MEMORY[0x189617CA0]();
}

uint64_t sub_18919AA90()
{
  return MEMORY[0x189617DD8]();
}

uint64_t sub_18919AA9C()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_18919AAA8()
{
  return MEMORY[0x189618308]();
}

uint64_t sub_18919AAB4()
{
  return MEMORY[0x1896071D0]();
}

uint64_t sub_18919AAC0()
{
  return MEMORY[0x189618320]();
}

uint64_t sub_18919AACC()
{
  return MEMORY[0x189618358]();
}

uint64_t sub_18919AAD8()
{
  return MEMORY[0x1896183C8]();
}

uint64_t sub_18919AAE4()
{
  return MEMORY[0x189607208]();
}

uint64_t sub_18919AAF0()
{
  return MEMORY[0x18961BC98]();
}

uint64_t sub_18919AAFC()
{
  return MEMORY[0x18961BCA0]();
}

uint64_t sub_18919AB08()
{
  return MEMORY[0x18961BCA8]();
}

uint64_t sub_18919AB14()
{
  return MEMORY[0x18961BD20]();
}

uint64_t sub_18919AB20()
{
  return MEMORY[0x18961BD28]();
}

uint64_t sub_18919AB2C()
{
  return MEMORY[0x18961BE58]();
}

uint64_t sub_18919AB38()
{
  return MEMORY[0x18961BE78]();
}

uint64_t sub_18919AB44()
{
  return MEMORY[0x18961BE80]();
}

uint64_t sub_18919AB50()
{
  return MEMORY[0x18961BE88]();
}

uint64_t sub_18919AB5C()
{
  return MEMORY[0x18961BEE0]();
}

uint64_t sub_18919AB68()
{
  return MEMORY[0x189607250]();
}

uint64_t sub_18919AB74()
{
  return MEMORY[0x18961B920]();
}

uint64_t sub_18919AB80()
{
  return MEMORY[0x18961BA20]();
}

uint64_t sub_18919AB8C()
{
  return MEMORY[0x18961BA28]();
}

uint64_t sub_18919AB98()
{
  return MEMORY[0x18961BA30]();
}

uint64_t sub_18919ABA4()
{
  return MEMORY[0x18961BA48]();
}

uint64_t sub_18919ABB0()
{
  return MEMORY[0x18961BAF0]();
}

uint64_t sub_18919ABBC()
{
  return MEMORY[0x18961BAF8]();
}

uint64_t sub_18919ABC8()
{
  return MEMORY[0x189618AB8]();
}

uint64_t sub_18919ABD4()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_18919ABE0()
{
  return MEMORY[0x189618CB0]();
}

uint64_t sub_18919ABEC()
{
  return MEMORY[0x189618E20]();
}

uint64_t sub_18919ABF8()
{
  return MEMORY[0x189618E48]();
}

uint64_t sub_18919AC04()
{
  return MEMORY[0x189618EA0]();
}

uint64_t sub_18919AC10()
{
  return MEMORY[0x189618EA8]();
}

uint64_t sub_18919AC1C()
{
  return MEMORY[0x189618EB8]();
}

uint64_t sub_18919AC28()
{
  return MEMORY[0x189619018]();
}

uint64_t sub_18919AC34()
{
  return MEMORY[0x189619020]();
}

uint64_t sub_18919AC40()
{
  return MEMORY[0x189619028]();
}

uint64_t sub_18919AC4C()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_18919AC58()
{
  return MEMORY[0x189619300]();
}

uint64_t sub_18919AC64()
{
  return MEMORY[0x189619308]();
}

uint64_t sub_18919AC70()
{
  return MEMORY[0x1896194A0]();
}

uint64_t sub_18919AC7C()
{
  return MEMORY[0x1896194C0]();
}

uint64_t sub_18919AC88()
{
  return MEMORY[0x1896194D8]();
}

uint64_t sub_18919AC94()
{
  return MEMORY[0x1896194F8]();
}

uint64_t sub_18919ACA0()
{
  return MEMORY[0x189619500]();
}

uint64_t sub_18919ACAC()
{
  return MEMORY[0x18961BF30]();
}

uint64_t sub_18919ACB8()
{
  return MEMORY[0x18961BF38]();
}

uint64_t sub_18919ACC4()
{
  return MEMORY[0x18961BF40]();
}

uint64_t sub_18919ACD0()
{
  return MEMORY[0x189619660]();
}

uint64_t sub_18919ACDC()
{
  return MEMORY[0x189619740]();
}

uint64_t sub_18919ACE8()
{
  return MEMORY[0x189619840]();
}

uint64_t sub_18919ACF4()
{
  return MEMORY[0x189619848]();
}

uint64_t sub_18919AD00()
{
  return MEMORY[0x189619850]();
}

uint64_t sub_18919AD0C()
{
  return MEMORY[0x189619858]();
}

uint64_t sub_18919AD18()
{
  return MEMORY[0x189619860]();
}

uint64_t sub_18919AD24()
{
  return MEMORY[0x189619868]();
}

uint64_t sub_18919AD30()
{
  return MEMORY[0x189619870]();
}

uint64_t sub_18919AD3C()
{
  return MEMORY[0x189619878]();
}

uint64_t sub_18919AD48()
{
  return MEMORY[0x189619880]();
}

uint64_t sub_18919AD54()
{
  return MEMORY[0x189619888]();
}

uint64_t sub_18919AD60()
{
  return MEMORY[0x189619890]();
}

uint64_t sub_18919AD6C()
{
  return MEMORY[0x189619898]();
}

uint64_t sub_18919AD78()
{
  return MEMORY[0x189619930]();
}

uint64_t sub_18919AD84()
{
  return MEMORY[0x189619948]();
}

uint64_t sub_18919AD90()
{
  return MEMORY[0x189619950]();
}

uint64_t sub_18919AD9C()
{
  return MEMORY[0x189619958]();
}

uint64_t sub_18919ADA8()
{
  return MEMORY[0x189619960]();
}

uint64_t sub_18919ADB4()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_18919ADC0()
{
  return MEMORY[0x18961A010]();
}

uint64_t sub_18919ADCC()
{
  return MEMORY[0x18961A050]();
}

uint64_t sub_18919ADD8()
{
  return MEMORY[0x18961BF68]();
}

uint64_t sub_18919ADE4()
{
  return MEMORY[0x18961A310]();
}

uint64_t sub_18919ADF0()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t sub_18919ADFC()
{
  return MEMORY[0x18961A3C0]();
}

uint64_t sub_18919AE08()
{
  return MEMORY[0x18961A3C8]();
}

uint64_t sub_18919AE14()
{
  return MEMORY[0x18961A3D0]();
}

uint64_t sub_18919AE20()
{
  return MEMORY[0x18961A3D8]();
}

uint64_t sub_18919AE2C()
{
  return MEMORY[0x18961A668]();
}

uint64_t sub_18919AE38()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_18919AE44()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_18919AE50()
{
  return MEMORY[0x18961A698]();
}

uint64_t sub_18919AE5C()
{
  return MEMORY[0x18961A6A0]();
}

uint64_t sub_18919AE68()
{
  return MEMORY[0x18961A6B0]();
}

uint64_t sub_18919AE74()
{
  return MEMORY[0x18961A6C0]();
}

uint64_t sub_18919AE80()
{
  return MEMORY[0x189607420]();
}

uint64_t sub_18919AE8C()
{
  return MEMORY[0x189607428]();
}

uint64_t sub_18919AE98()
{
  return MEMORY[0x18961AE58]();
}

uint64_t sub_18919AEA4()
{
  return MEMORY[0x18961AE60]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x189602660](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x189602698](theArray, idx);
}

void IOHIDDeviceActivate(IOHIDDeviceRef device)
{
}

void IOHIDDeviceCancel(IOHIDDeviceRef device)
{
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x189607DE0](device, *(void *)&options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements( IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x189607DF0](device, matching, *(void *)&options);
}

IOReturn IOHIDDeviceCopyValueMultipleWithCallback( IOHIDDeviceRef device, CFArrayRef elements, CFDictionaryRef *pMultiple, CFTimeInterval timeout, IOHIDValueMultipleCallback callback, void *context)
{
  return MEMORY[0x189607DF8](device, elements, pMultiple, callback, context, timeout);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x189607E00](allocator, *(void *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189607E08](device, key);
}

IOReturn IOHIDDeviceGetReportWithCallback( IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x189607E18]( device,  *(void *)&reportType,  reportID,  report,  pReportLength,  callback,  context,  timeout);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x189607E30](device, *(void *)&options);
}

void IOHIDDeviceRegisterInputReportWithTimeStampCallback( IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportWithTimeStampCallback callback, void *context)
{
}

void IOHIDDeviceRegisterInputValueCallback(IOHIDDeviceRef device, IOHIDValueCallback callback, void *context)
{
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
}

void IOHIDDeviceSetCancelHandler(IOHIDDeviceRef device, dispatch_block_t handler)
{
}

void IOHIDDeviceSetDispatchQueue(IOHIDDeviceRef device, dispatch_queue_t queue)
{
}

void IOHIDDeviceSetInputValueMatchingMultiple(IOHIDDeviceRef device, CFArrayRef multiple)
{
}

Boolean IOHIDDeviceSetProperty(IOHIDDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x189607E80](device, key, property);
}

IOReturn IOHIDDeviceSetReportWithCallback( IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x189607E90](device, *(void *)&reportType, reportID, report, reportLength, callback, context, timeout);
}

IOReturn IOHIDDeviceSetValueMultipleWithCallback( IOHIDDeviceRef device, CFDictionaryRef multiple, CFTimeInterval timeout, IOHIDValueMultipleCallback callback, void *context)
{
  return MEMORY[0x189607E98](device, multiple, callback, context, timeout);
}

CFArrayRef IOHIDElementGetChildren(IOHIDElementRef element)
{
  return (CFArrayRef)MEMORY[0x189607EA8](element);
}

IOHIDElementCollectionType IOHIDElementGetCollectionType(IOHIDElementRef element)
{
  return MEMORY[0x189607EB0](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x189607EB8](element);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return MEMORY[0x189607EC0](element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return MEMORY[0x189607EC8](element);
}

IOHIDElementRef IOHIDElementGetParent(IOHIDElementRef element)
{
  return (IOHIDElementRef)MEMORY[0x189607ED0](element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return MEMORY[0x189607ED8](element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return MEMORY[0x189607EE0](element);
}

uint32_t IOHIDElementGetReportCount(IOHIDElementRef element)
{
  return MEMORY[0x189607EE8](element);
}

uint32_t IOHIDElementGetReportID(IOHIDElementRef element)
{
  return MEMORY[0x189607EF0](element);
}

uint32_t IOHIDElementGetReportSize(IOHIDElementRef element)
{
  return MEMORY[0x189607EF8](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x189607F00](element);
}

uint32_t IOHIDElementGetUnit(IOHIDElementRef element)
{
  return MEMORY[0x189607F08](element);
}

uint32_t IOHIDElementGetUnitExponent(IOHIDElementRef element)
{
  return MEMORY[0x189607F10](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x189607F18](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x189607F20](element);
}

Boolean IOHIDElementIsArray(IOHIDElementRef element)
{
  return MEMORY[0x189607F28](element);
}

void IOHIDUserDeviceActivate(IOHIDUserDeviceRef device)
{
}

void IOHIDUserDeviceCancel(IOHIDUserDeviceRef device)
{
}

CFTypeRef IOHIDUserDeviceCopyProperty(IOHIDUserDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x189608228](device, key);
}

uint64_t IOHIDUserDeviceCopyService()
{
  return MEMORY[0x189608230]();
}

IOHIDUserDeviceRef IOHIDUserDeviceCreateWithProperties( CFAllocatorRef allocator, CFDictionaryRef properties, IOOptionBits options)
{
  return (IOHIDUserDeviceRef)MEMORY[0x189608240](allocator, properties, *(void *)&options);
}

uint64_t IOHIDUserDeviceHandleReportAsyncWithTimeStamp()
{
  return MEMORY[0x189608250]();
}

void IOHIDUserDeviceRegisterGetReportBlock(IOHIDUserDeviceRef device, IOHIDUserDeviceGetReportBlock block)
{
}

void IOHIDUserDeviceRegisterSetReportBlock(IOHIDUserDeviceRef device, IOHIDUserDeviceSetReportBlock block)
{
}

void IOHIDUserDeviceSetCancelHandler(IOHIDUserDeviceRef device, dispatch_block_t handler)
{
}

void IOHIDUserDeviceSetDispatchQueue(IOHIDUserDeviceRef device, dispatch_queue_t queue)
{
}

IOHIDValueRef IOHIDValueCreateWithBytes( CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return (IOHIDValueRef)MEMORY[0x189608298](allocator, element, timeStamp, bytes, length);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x1896082A8](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x1896082B0](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x1896082C0](value);
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x1896082D0](value);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1896082F0](*(void *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x189608330](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x189608500](*(void *)&entry, entryID);
}

kern_return_t IOServiceAddInterestNotification( IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x189608540](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification( IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x189608548](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x189608560](*(void *)&mainPort, matching);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x18961B0A0]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x18961B0A8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x18961B0D8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x18961B0E8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x18961B0F0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x18961B160]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x18961BFE0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x18961BFE8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x18961BFF0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x18961B170]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x18961B250]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B258]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x18961B270]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x18961B2C0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x18961B2D0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x18961B2E8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x18961B338]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x18961B348]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x18961B368]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x18961B388]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x18961B430]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x18961B438]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x18961C008]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x18961C010]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x18961C018]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x18961C038]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x18961B470]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x18961B4B8]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x18961B4C0]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x18961B4C8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x18961B4D0]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x18961B4F0]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x18961B4F8]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x18961B500]();
}