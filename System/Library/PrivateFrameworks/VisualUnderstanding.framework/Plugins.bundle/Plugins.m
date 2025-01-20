uint64_t sub_4944(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_s *v9;
  os_log_type_t v10;
  uint8_t *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  v2 = v1;
  v4 = type metadata accessor for VUGallery.Client(0LL);
  v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Logger.init(subsystem:category:)( 0xD00000000000001DLL,  0x8000000000011DB0LL,  0xD000000000000017LL,  0x8000000000011BF0LL);
  v8 = swift_retain_n(a1, 2LL);
  v9 = (os_log_s *)Logger.logObject.getter(v8);
  v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v22 = v1;
    v11 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v21 = swift_slowAlloc(32LL, -1LL);
    v24 = v21;
    *(_DWORD *)v11 = 136315138;
    v20 = v11 + 4;
    VUGallery.client.getter();
    v12 = sub_53BC();
    v13 = dispatch thunk of CustomStringConvertible.description.getter(v4, v12);
    v15 = v14;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v23 = sub_4D7C(v13, v15, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v20, v11 + 12);
    swift_release_n(a1, 2LL);
    v16 = v15;
    v2 = v22;
    swift_bridgeObjectRelease(v16);
    _os_log_impl(&dword_0, v9, v10, "Initializing VUPersonalizationPlugin for the VUGallery for %s client", v11, 0xCu);
    v17 = v21;
    swift_arrayDestroy(v21, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1LL, -1LL);
    swift_slowDealloc(v11, -1LL, -1LL);
  }

  else
  {
    swift_release_n(a1, 2LL);
  }

  *(void *)(v2 + 16) = a1;
  return v2;
}

uint64_t sub_4B74()
{
  v1 = (char *)v0 + OBJC_IVAR____TtC7Plugins23VUPersonalizationPlugin_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48LL), *(unsigned __int16 *)(*v0 + 52LL));
}

uint64_t sub_4BCC()
{
  return type metadata accessor for VUPersonalizationPlugin(0LL);
}

uint64_t type metadata accessor for VUPersonalizationPlugin(uint64_t a1)
{
  uint64_t result = qword_186B8;
  if (!qword_186B8) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for VUPersonalizationPlugin);
  }
  return result;
}

uint64_t sub_4C10(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 2LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_4C8C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for VUPersonalizationPlugin(0LL);
  uint64_t v5 = swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t result = sub_4944(a1);
  *a2 = v5;
  return result;
}

void sub_4CD8()
{
  v0 = (os_log_s *)Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_0, v0, v1, "Personalization plugin updated", v2, 2u);
    swift_slowDealloc(v2, -1LL, -1LL);
  }
}

uint64_t sub_4D7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_4E4C(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_5424((uint64_t)v12, *a3);
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
      sub_5424((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_5404(v12);
  return v7;
}

uint64_t sub_4E4C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_5004(a5, a6);
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

uint64_t sub_5004(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_5098(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_5270(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_5270(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_5098(uint64_t a1, unint64_t a2)
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
      uint64_t v5 = sub_520C(v4, 0LL);
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

void *sub_520C(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_5460(&qword_18770);
  uint64_t v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_5270(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5460(&qword_18770);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7LL);
    size_t v12 = j__malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * v12 - 64;
  }

  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
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

unint64_t sub_53BC()
{
  unint64_t result = qword_18B20;
  if (!qword_18B20)
  {
    uint64_t v1 = type metadata accessor for VUGallery.Client(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for VUGallery.Client, v1);
    atomic_store(result, (unint64_t *)&qword_18B20);
  }

  return result;
}

uint64_t sub_5404(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_5424(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_5460(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_54A4(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for VUGallery.Client(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  Logger.init(subsystem:category:)( 0xD00000000000001DLL,  0x8000000000011DB0LL,  0xD000000000000013LL,  0x8000000000011CE0LL);
  *(void *)(v1 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin____lazy_storage___photoLibrary) = 0LL;
  uint64_t v8 = swift_retain_n(a1, 2LL);
  int64_t v9 = (os_log_s *)Logger.logObject.getter(v8);
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc(12LL, -1LL);
    uint64_t v20 = v5;
    size_t v12 = (uint8_t *)v11;
    uint64_t v22 = swift_slowAlloc(32LL, -1LL);
    uint64_t v24 = v22;
    *(_DWORD *)size_t v12 = 136315138;
    v21 = v12 + 4;
    VUGallery.client.getter();
    uint64_t v13 = sub_113F4( (unint64_t *)&qword_18B20,  (uint64_t (*)(uint64_t))&type metadata accessor for VUGallery.Client,  (uint64_t)&protocol conformance descriptor for VUGallery.Client);
    uint64_t v14 = dispatch thunk of CustomStringConvertible.description.getter(v4, v13);
    unint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v4);
    uint64_t v23 = sub_4D7C(v14, v16, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v21, v12 + 12);
    swift_release_n(a1, 2LL);
    swift_bridgeObjectRelease(v16);
    _os_log_impl(&dword_0, v9, v10, "Initializing VUDeviceOwnerPlugin for the VUGallery for %s client", v12, 0xCu);
    uint64_t v17 = v22;
    swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v17, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
    swift_release_n(a1, 2LL);
  }

  *(void *)(v2 + 16) = a1;
  return v2;
}

id sub_56F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for URL(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin____lazy_storage___photoLibrary;
  int64_t v7 = *(void **)(v1 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin____lazy_storage___photoLibrary);
  if (v7)
  {
    id v8 = *(id *)(v1 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin____lazy_storage___photoLibrary);
  }

  else
  {
    int64_t v9 = (void *)objc_opt_self(&OBJC_CLASS___PHPhotoLibrary);
    if ([v9 isMultiLibraryModeEnabled])
    {
      id v10 = [v9 systemPhotoLibraryURL];
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      id v11 = objc_allocWithZone(&OBJC_CLASS___PHPhotoLibrary);
      URL._bridgeToObjectiveC()(v12);
      uint64_t v14 = v13;
      id v15 = [v11 initWithPhotoLibraryURL:v13];

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }

    else
    {
      id v15 = [v9 sharedPhotoLibrary];
    }

    unint64_t v16 = *(void **)(v1 + v6);
    *(void *)(v1 + v6) = v15;
    id v8 = v15;

    int64_t v7 = 0LL;
  }

  id v17 = v7;
  return v8;
}

unint64_t sub_5848(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_5460(&qword_18B18);
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
    unint64_t result = sub_C0CC(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    size_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *size_t v12 = v7;
    v12[1] = v8;
    *(void *)(v4[7] + 8 * result) = v9;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v6 += 3;
    void v4[2] = v15;
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

unint64_t sub_5958(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
    uint64_t v5 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_5460(a2);
  uint64_t v4 = static _DictionaryStorage.allocate(capacity:)(v3);
  uint64_t v5 = (void *)v4;
  uint64_t v6 = *(void *)(a1 + 16);
  if (!v6)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v5;
  }

  swift_retain(v4);
  uint64_t v7 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v8 = (uint64_t)*(v7 - 2);
    uint64_t v9 = (uint64_t)*(v7 - 1);
    id v10 = *v7;
    swift_bridgeObjectRetain(v9);
    id v11 = v10;
    unint64_t result = sub_C0CC(v8, v9);
    if ((v13 & 1) != 0) {
      break;
    }
    *(void *)((char *)v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    BOOL v14 = (uint64_t *)(v5[6] + 16 * result);
    *BOOL v14 = v8;
    v14[1] = v9;
    *(void *)(v5[7] + 8 * result) = v11;
    uint64_t v15 = v5[2];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_11;
    }
    v5[2] = v17;
    v7 += 3;
    if (!--v6)
    {
      swift_release(v5);
      goto LABEL_9;
    }
  }

  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Class sub_5A6C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = swift_retain(v2);
  uint64_t v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_10FC4(0LL, &qword_18B08, &OBJC_CLASS___NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    v5.super.isa = 0LL;
  }

  return v5.super.isa;
}

void sub_5AF0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_5460(&qword_18B00);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v29 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v28 = (unint64_t)(63 - v4) >> 6;
  swift_bridgeObjectRetain(a1);
  int64_t i = 0LL;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v12 = i + 1;
  if (__OFADD__(i, 1LL)) {
    goto LABEL_35;
  }
  if (v12 >= v28) {
    goto LABEL_32;
  }
  unint64_t v13 = *(void *)(v29 + 8 * v12);
  int64_t v14 = i + 1;
  if (!v13)
  {
    int64_t v14 = i + 2;
    if (i + 2 >= v28) {
      goto LABEL_32;
    }
    unint64_t v13 = *(void *)(v29 + 8 * v14);
    if (!v13)
    {
      int64_t v14 = i + 3;
      if (i + 3 >= v28) {
        goto LABEL_32;
      }
      unint64_t v13 = *(void *)(v29 + 8 * v14);
      if (!v13)
      {
        int64_t v14 = i + 4;
        if (i + 4 >= v28) {
          goto LABEL_32;
        }
        unint64_t v13 = *(void *)(v29 + 8 * v14);
        if (!v13)
        {
          int64_t v15 = i + 5;
          if (i + 5 < v28)
          {
            unint64_t v13 = *(void *)(v29 + 8 * v15);
            if (v13)
            {
              int64_t v14 = i + 5;
              goto LABEL_26;
            }

            while (1)
            {
              int64_t v14 = v15 + 1;
              if (__OFADD__(v15, 1LL)) {
                goto LABEL_36;
              }
              if (v14 >= v28) {
                break;
              }
              unint64_t v13 = *(void *)(v29 + 8 * v14);
              ++v15;
              if (v13) {
                goto LABEL_26;
              }
            }
          }

LABEL_32:
          sub_10F68(a1);
          return;
        }
      }
    }
  }

  unint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

  unint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

LABEL_26:
  unint64_t v6 = (v13 - 1) & v13;
  unint64_t v11 = __clz(__rbit64(v13)) + (v14 << 6);
  for (i = v14; ; unint64_t v11 = v10 | (i << 6))
  {
    BOOL v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v11);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    uint64_t v19 = *(void **)(*(void *)(a1 + 56) + 8 * v11);
    swift_bridgeObjectRetain(v17);
    id v20 = v19;
    unint64_t v21 = sub_C0CC(v18, v17);
    unint64_t v22 = v21;
    if ((v23 & 1) != 0)
    {
      uint64_t v8 = (uint64_t *)(v3[6] + 16 * v21);
      swift_bridgeObjectRelease(v8[1]);
      *uint64_t v8 = v18;
      v8[1] = v17;
      uint64_t v9 = v3[7];

      *(void *)(v9 + 8 * v22) = v20;
      if (!v6) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << v21;
    uint64_t v24 = (uint64_t *)(v3[6] + 16 * v21);
    *uint64_t v24 = v18;
    v24[1] = v17;
    *(void *)(v3[7] + 8 * v21) = v20;
    uint64_t v25 = v3[2];
    BOOL v26 = __OFADD__(v25, 1LL);
    uint64_t v27 = v25 + 1;
    if (v26) {
      goto LABEL_34;
    }
    v3[2] = v27;
    if (!v6) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v10 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

  __break(1u);
  return result;
}

      if ((a5 & 1) == 0) {
        break;
      }
      swift_bridgeObjectRetain(a4);
      swift_retain(a6);
      BOOL v26 = sub_9858(v22, (a5 >> 8) & 1);
      swift_bridgeObjectRelease(a4);
      unint64_t result = swift_release(a6);
    }

    while ((v26 & 1) != 0);
    *(unint64_t *)((char *)a1 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    int64_t v15 = v30 + 1;
    if (!__OFADD__(v30, 1LL)) {
      continue;
    }
    break;
  }

uint64_t sub_5D90()
{
  uint64_t v1 = type metadata accessor for DateComponents(0LL);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  v47 = (char *)&v41 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = swift_allocObject(&unk_148F0, 32LL, 7LL);
  *(void *)(v4 + 16) = 0LL;
  uint64_t v5 = (uint64_t *)(v4 + 16);
  *(void *)(v4 + 24) = 0LL;
  uint64_t v6 = sub_5460(&qword_18BA0);
  uint64_t v7 = swift_allocBox(v6);
  uint64_t v9 = v8;
  unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56);
  uint64_t v48 = v1;
  v10(v8, 1LL, 1LL, v1);
  uint64_t v11 = swift_allocObject(&unk_14918, 32LL, 7LL);
  *(void *)(v11 + 16) = 0LL;
  v49 = (uint64_t *)(v11 + 16);
  *(_BYTE *)(v11 + 24) = 1;
  id v12 = [objc_allocWithZone(CNContactStore) init];
  unint64_t v13 = (void *)swift_allocObject(&unk_14940, 56LL, 7LL);
  v13[2] = v0;
  v13[3] = v12;
  v13[4] = v4;
  v13[5] = v7;
  v13[6] = v11;
  aBlock[4] = (uint64_t)sub_11074;
  v56 = v13;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256LL;
  aBlock[2] = (uint64_t)sub_6BA8;
  aBlock[3] = (uint64_t)&unk_14958;
  int64_t v14 = _Block_copy(aBlock);
  int64_t v15 = v56;
  swift_retain(v0);
  id v16 = v12;
  swift_retain(v4);
  swift_retain(v7);
  swift_retain(v11);
  swift_release(v15);
  [v16 requestAccessForEntityType:0 completionHandler:v14];
  _Block_release(v14);
  swift_retain_n(v4, 2LL);
  swift_retain_n(v7, 2LL);
  uint64_t v17 = swift_retain_n(v11, 2LL);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  int v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v18, (os_log_type_t)v19))
  {
    int v45 = v19;
    id v46 = v16;
    uint64_t v20 = swift_slowAlloc(32LL, -1LL);
    uint64_t v44 = swift_slowAlloc(96LL, -1LL);
    aBlock[0] = v44;
    *(_DWORD *)uint64_t v20 = 136315650;
    swift_beginAccess(v5, v52, 0LL, 0LL);
    unint64_t v21 = *(void *)(v4 + 24);
    v43 = (uint64_t *)(v4 + 16);
    if (v21)
    {
      uint64_t v22 = *v5;
      unint64_t v23 = v21;
    }

    else
    {
      unint64_t v23 = 0xE300000000000000LL;
      uint64_t v22 = 7104878LL;
    }

    swift_bridgeObjectRetain(v21);
    uint64_t v53 = sub_4D7C(v22, v23, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v20 + 4, v20 + 12);
    swift_release_n(v4, 2LL);
    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v20 + 12) = 2080;
    swift_beginAccess(v9, v51, 0LL, 0LL);
    uint64_t v25 = v48;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v9, 1LL, v48))
    {
      unint64_t v26 = 0xE300000000000000LL;
      uint64_t v27 = 7104878LL;
    }

    else
    {
      int64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 16);
      v42 = v18;
      uint64_t v29 = v47;
      uint64_t v30 = v28(v47, v9, v25);
      uint64_t v27 = DateComponents.description.getter(v30);
      unint64_t v26 = v31;
      v32 = v29;
      uint64_t v18 = v42;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v32, v25);
    }

    uint64_t v53 = sub_4D7C(v27, v26, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v20 + 14, v20 + 22);
    swift_release_n(v7, 2LL);
    swift_bridgeObjectRelease(v26);
    *(_WORD *)(v20 + 22) = 2080;
    uint64_t v24 = v49;
    swift_beginAccess(v49, v50, 0LL, 0LL);
    if ((*(_BYTE *)(v11 + 24) & 1) != 0)
    {
      unint64_t v33 = 0xE300000000000000LL;
      uint64_t v5 = v43;
      uint64_t v34 = 7104878LL;
    }

    else
    {
      uint64_t v53 = *v24;
      unint64_t v35 = sub_11084();
      uint64_t v34 = BinaryInteger.description.getter(&type metadata for Int, v35);
      unint64_t v33 = v36;
      uint64_t v5 = v43;
    }

    uint64_t v53 = sub_4D7C(v34, v33, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, v54, v20 + 24, v20 + 32);
    swift_release_n(v11, 2LL);
    swift_bridgeObjectRelease(v33);
    _os_log_impl( &dword_0,  v18,  (os_log_type_t)v45,  "Fetched me contact with meContactIdentifier: %s and meBirthday %s and meAge %s",  (uint8_t *)v20,  0x20u);
    uint64_t v37 = v44;
    swift_arrayDestroy(v44, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v37, -1LL, -1LL);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  else
  {
    swift_release_n(v11, 2LL);
    swift_release_n(v7, 2LL);
    swift_release_n(v4, 2LL);

    uint64_t v24 = v49;
  }

  swift_beginAccess(v5, aBlock, 0LL, 0LL);
  uint64_t v38 = *(void *)(v4 + 16);
  uint64_t v39 = *(void *)(v4 + 24);
  swift_beginAccess(v24, &v53, 0LL, 0LL);
  swift_bridgeObjectRetain(v39);
  swift_release(v4);
  swift_release(v7);
  swift_release(v11);
  return v38;
}

void sub_6310(char a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v100 = a7;
  uint64_t v109 = type metadata accessor for Calendar(0LL);
  uint64_t v108 = *(void *)(v109 - 8);
  __chkstk_darwin(v109);
  v106 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  unint64_t v13 = (void *)type metadata accessor for DateComponents(0LL);
  uint64_t v111 = *(v13 - 1);
  uint64_t v14 = __chkstk_darwin(v13);
  v101 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v97 - v16;
  uint64_t v105 = type metadata accessor for Date(0LL);
  uint64_t v104 = *(void *)(v105 - 8);
  __chkstk_darwin(v105);
  v110 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = sub_5460(&qword_18BA0);
  uint64_t v20 = __chkstk_darwin(v19);
  uint64_t v107 = (uint64_t)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v20);
  unint64_t v23 = (char *)&v97 - v22;
  uint64_t v24 = swift_projectBox(a6);
  if (a2)
  {
    v102 = a4;
    swift_errorRetain(a2);
    swift_errorRetain(a2);
    uint64_t v25 = swift_errorRetain(a2);
    unint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
    os_log_type_t v27 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc(12LL, -1LL);
      v103 = v17;
      uint64_t v29 = (uint8_t *)v28;
      uint64_t v30 = (void *)swift_slowAlloc(32LL, -1LL);
      v99 = v13;
      unint64_t v31 = v30;
      v118[0] = v30;
      v98 = v23;
      uint64_t v97 = a5;
      *(_DWORD *)uint64_t v29 = 136315138;
      swift_getErrorValue(a2, v113, v112);
      uint64_t v32 = Error.localizedDescription.getter(v112[1], v112[2]);
      unint64_t v34 = v33;
      uint64_t v116 = sub_4D7C(v32, v33, (uint64_t *)v118);
      a5 = v97;
      unint64_t v23 = v98;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v116, &v117, v29 + 4, v29 + 12);
      swift_bridgeObjectRelease(v34);
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl(&dword_0, v26, v27, "Failed to fetch the me contact identifier: %s", v29, 0xCu);
      swift_arrayDestroy(v31, 1LL, (char *)&type metadata for Any + 8);
      unint64_t v35 = v31;
      unint64_t v13 = v99;
      swift_slowDealloc(v35, -1LL, -1LL);
      unint64_t v36 = v29;
      uint64_t v17 = v103;
      swift_slowDealloc(v36, -1LL, -1LL);
      swift_errorRelease(a2);
    }

    else
    {
      swift_errorRelease(a2);

      swift_errorRelease(a2);
      swift_errorRelease(a2);
    }

    a4 = v102;
  }

  if ((a1 & 1) != 0)
  {
    uint64_t v37 = sub_5460(&qword_18BB0);
    uint64_t v38 = swift_allocObject(v37, 48LL, 7LL);
    *(_OWORD *)(v38 + 16) = xmmword_11CB0;
    *(void *)(v38 + 32) = CNContactIdentifierKey;
    *(void *)(v38 + 40) = CNContactBirthdayKey;
    v118[0] = (id)v38;
    specialized Array._endMutation()();
    id v39 = v118[0];
    v40 = CNContactIdentifierKey;
    uint64_t v41 = CNContactBirthdayKey;
    sub_5460(&qword_18BB8);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v39);
    v118[0] = 0LL;
    id v43 = [a4 _crossPlatformUnifiedMeContactWithKeysToFetch:isa error:v118];

    id v44 = v118[0];
    if (v43)
    {
      id v45 = v118[0];
      id v46 = v43;
      id v47 = [v46 identifier];
      uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v50 = v49;

      uint64_t v51 = 1LL;
      swift_beginAccess(a5 + 16, v118, 1LL, 0LL);
      uint64_t v52 = *(void *)(a5 + 24);
      *(void *)(a5 + 16) = v48;
      *(void *)(a5 + 24) = v50;
      swift_bridgeObjectRelease(v52);
      v99 = v46;
      id v53 = [v46 birthday];
      v103 = v17;
      if (v53)
      {
        v54 = v53;
        static DateComponents._unconditionallyBridgeFromObjectiveC(_:)();

        uint64_t v51 = 0LL;
      }

      (*(void (**)(char *, uint64_t, uint64_t, void *))(v111 + 56))(v23, v51, 1LL, v13);
      swift_beginAccess(v24, &v116, 1LL, 0LL);
      uint64_t v55 = sub_110C8((uint64_t)v23, v24, &qword_18BA0);
      v56 = v110;
      uint64_t v57 = Date.init()(v55);
      v58 = v106;
      static Calendar.current.getter(v57);
      uint64_t v59 = sub_5460(&qword_18BC0);
      uint64_t v60 = type metadata accessor for Calendar.Component(0LL);
      v102 = (void *)v24;
      uint64_t v61 = *(void *)(v60 - 8);
      uint64_t v62 = *(void *)(v61 + 72);
      uint64_t v63 = *(unsigned __int8 *)(v61 + 80);
      uint64_t v64 = (v63 + 32) & ~v63;
      uint64_t v65 = 4 * v62;
      uint64_t v66 = swift_allocObject(v59, v64 + 5 * v62, v63 | 7);
      *(_OWORD *)(v66 + 16) = xmmword_11CC0;
      uint64_t v67 = v66 + v64;
      v68 = *(void (**)(uint64_t, void, uint64_t))(v61 + 104);
      v68(v67, enum case for Calendar.Component.year(_:), v60);
      v68(v67 + v62, enum case for Calendar.Component.month(_:), v60);
      v68(v67 + 2 * v62, enum case for Calendar.Component.day(_:), v60);
      uint64_t v69 = 3 * v62;
      v70 = v13;
      uint64_t v71 = v111;
      v68(v67 + v69, enum case for Calendar.Component.hour(_:), v60);
      v68(v67 + v65, enum case for Calendar.Component.minute(_:), v60);
      v72 = sub_1110C(v66);
      swift_setDeallocating(v66);
      swift_arrayDestroy(v67, 5LL, v60);
      swift_deallocClassInstance(v66, 32LL, 7LL);
      v73 = v103;
      Calendar.dateComponents(_:from:)(v72, v56);
      swift_bridgeObjectRelease(v72);
      (*(void (**)(char *, uint64_t))(v108 + 8))(v58, v109);
      uint64_t v74 = (uint64_t)v102;
      swift_beginAccess(v102, v115, 0LL, 0LL);
      uint64_t v75 = v74;
      uint64_t v76 = v107;
      sub_11374(v75, v107, &qword_18BA0);
      if ((*(unsigned int (**)(uint64_t, uint64_t, void *))(v71 + 48))(v76, 1LL, v70) == 1)
      {
        id v77 = v99;

        (*(void (**)(char *, void *))(v71 + 8))(v73, v70);
        (*(void (**)(char *, uint64_t))(v104 + 8))(v56, v105);
        sub_113B8(v76, &qword_18BA0);
      }

      else
      {
        v81 = v101;
        uint64_t v82 = (*(uint64_t (**)(char *, uint64_t, void *))(v71 + 32))(v101, v76, v70);
        uint64_t v83 = DateComponents.year.getter(v82);
        uint64_t v84 = v71;
        if ((v85 & 1) != 0)
        {
          id v95 = v99;

          v96 = *(void (**)(char *, void *))(v84 + 8);
          v96(v81, v70);
          v96(v73, v70);
          (*(void (**)(char *, uint64_t))(v104 + 8))(v56, v105);
        }

        else
        {
          uint64_t v86 = v83;
          uint64_t v87 = DateComponents.year.getter(v83);
          char v89 = v88;
          id v90 = v99;

          v91 = *(void (**)(char *, void *))(v84 + 8);
          v91(v81, v70);
          v91(v73, v70);
          (*(void (**)(char *, uint64_t))(v104 + 8))(v56, v105);
          if ((v89 & 1) == 0)
          {
            BOOL v92 = __OFSUB__(v87, v86);
            uint64_t v93 = v87 - v86;
            if (v92) {
              __break(1u);
            }
            uint64_t v94 = v100;
            swift_beginAccess(v100 + 16, v114, 1LL, 0LL);
            *(void *)(v94 + 16) = v93;
            *(_BYTE *)(v94 + 24) = 0;
          }
        }
      }
    }

    else
    {
      id v78 = v118[0];
      uint64_t v79 = _convertNSErrorToError(_:)(v44);

      swift_willThrow(v80);
      swift_errorRelease(v79);
    }
  }
}

void sub_6BA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = *(void (**)(uint64_t, void *))(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  swift_retain(v5);
  id v7 = a3;
  v6(a2, a3);
  swift_release(v5);
}

uint64_t sub_6C08()
{
  id v0 = sub_56F8();
  id v1 = [v0 librarySpecificFetchOptions];

  sub_10FC4(0LL, &qword_18B98, &OBJC_CLASS___NSPredicate_ptr);
  uint64_t v2 = (uint64_t)&_swiftEmptyArrayStorage;
  uint64_t v3 = (void *)NSPredicate.init(format:_:)(0x72556E6F73726570LL, 0xEF2727203D212069LL, &_swiftEmptyArrayStorage);
  [v1 setPredicate:v3];

  uint64_t v28 = v1;
  id v4 = [(id)objc_opt_self(PHPerson) fetchPersonsWithOptions:v1];
  id v5 = [v4 fetchedObjects];

  if (v5)
  {
    uint64_t v6 = sub_10FC4(0LL, &qword_18B90, &OBJC_CLASS___PHPerson_ptr);
    uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v5, v6);
  }

  if (!((unint64_t)v2 >> 62))
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFF8LL));
    uint64_t result = swift_bridgeObjectRetain(v2);
    if (v7) {
      goto LABEL_5;
    }
LABEL_21:

    swift_bridgeObjectRelease(v2);
    return v2;
  }

  if (v2 < 0) {
    uint64_t v27 = v2;
  }
  else {
    uint64_t v27 = v2 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v2);
  uint64_t result = _CocoaArrayWrapper.endIndex.getter(v27);
  uint64_t v7 = result;
  if (!result) {
    goto LABEL_21;
  }
LABEL_5:
  if (v7 >= 1)
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = v2 & 0xC000000000000001LL;
    uint64_t v30 = v7;
    unint64_t v29 = v2 & 0xC000000000000001LL;
    do
    {
      if (v10) {
        id v11 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v9, v2);
      }
      else {
        id v11 = *(id *)(v2 + 8 * v9 + 32);
      }
      id v12 = v11;
      unint64_t v13 = (os_log_s *)Logger.logObject.getter(v12);
      os_log_type_t v14 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v13, v14))
      {
        uint64_t v15 = v2;
        uint64_t v16 = swift_slowAlloc(22LL, -1LL);
        uint64_t v17 = swift_slowAlloc(64LL, -1LL);
        uint64_t v31 = v17;
        *(_DWORD *)uint64_t v16 = 136315394;
        id v18 = [v12 localIdentifier];
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(v18);
        unint64_t v21 = v20;

        *(void *)(v16 + 4) = sub_4D7C(v19, v21, &v31);
        swift_bridgeObjectRelease(v21);
        *(_WORD *)(v16 + 12) = 2080;
        id v22 = [v12 name];
        if (v22)
        {
          unint64_t v23 = v22;
          uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
          unint64_t v26 = v25;
        }

        else
        {
          unint64_t v26 = 0xED0000646E756F66LL;
          uint64_t v24 = 0x20656D616E206F6ELL;
        }

        *(void *)(v16 + 14) = sub_4D7C(v24, v26, &v31);

        swift_bridgeObjectRelease(v26);
        _os_log_impl(&dword_0, v13, v14, "Found PHPerson with localIdentifier %s with name %s", (uint8_t *)v16, 0x16u);
        swift_arrayDestroy(v17, 2LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v17, -1LL, -1LL);
        swift_slowDealloc(v16, -1LL, -1LL);

        uint64_t v2 = v15;
        uint64_t v7 = v30;
        unint64_t v10 = v29;
      }

      else
      {
      }

      ++v9;
    }

    while (v7 != v9);
    goto LABEL_21;
  }

  __break(1u);
  return result;
}

id sub_6FD0(uint64_t a1, unint64_t a2)
{
  id v4 = sub_56F8();
  id v5 = [v4 librarySpecificFetchOptions];

  [v5 setPersonContext:1];
  sub_10FC4(0LL, &qword_18B98, &OBJC_CLASS___NSPredicate_ptr);
  uint64_t v6 = (void *)NSPredicate.init(format:_:)(0xD000000000000010LL, 0x8000000000012320LL, &_swiftEmptyArrayStorage);
  [v5 setPredicate:v6];

  uint64_t v7 = (void *)objc_opt_self(&OBJC_CLASS___PHPerson);
  uint64_t v8 = sub_5460(&qword_18B78);
  uint64_t v9 = swift_allocObject(v8, 48LL, 7LL);
  *(_OWORD *)(v9 + 16) = xmmword_11CD0;
  *(void *)(v9 + 32) = a1;
  *(void *)(v9 + 40) = a2;
  swift_bridgeObjectRetain(a2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  id v11 = [v7 fetchPersonsForContactIdentifiers:isa options:v5];

  id v12 = [v11 firstObject];
  id v33 = v12;
  uint64_t v13 = swift_bridgeObjectRetain_n(a2, 2LL);
  os_log_type_t v14 = (os_log_s *)Logger.logObject.getter(v13);
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc(32LL, -1LL);
    uint64_t v17 = swift_slowAlloc(96LL, -1LL);
    uint64_t v32 = v17;
    *(_DWORD *)uint64_t v16 = 136315650;
    swift_bridgeObjectRetain(a2);
    uint64_t v30 = sub_4D7C(a1, a2, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v16 + 4, v16 + 12);
    swift_bridgeObjectRelease_n(a2, 3LL);
    *(_WORD *)(v16 + 12) = 2080;
    swift_beginAccess(&v33, &v30, 0LL, 0LL);
    id v12 = v33;
    uint64_t v28 = v17;
    if (v33)
    {
      id v18 = [v33 localIdentifier];
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v21 = v20;
    }

    else
    {
      uint64_t v19 = 0xD000000000000018LL;
      unint64_t v21 = 0x8000000000012340LL;
    }

    unint64_t v22 = 0xED0000646E756F66LL;
    uint64_t v23 = 0x20656D616E206F6ELL;
    uint64_t v29 = sub_4D7C(v19, v21, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v16 + 14, v16 + 22);
    swift_bridgeObjectRelease(v21);
    *(_WORD *)(v16 + 22) = 2080;
    if (v12)
    {
      id v24 = [v12 name];
      if (v24)
      {
        unint64_t v25 = v24;
        uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v22 = v26;
      }
    }

    uint64_t v29 = sub_4D7C(v23, v22, &v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, &v30, v16 + 24, v16 + 32);
    swift_bridgeObjectRelease(v22);
    _os_log_impl( &dword_0,  v14,  v15,  "Found PHPerson linked with contact %s with localIdentifier: %s, name: %s",  (uint8_t *)v16,  0x20u);
    swift_arrayDestroy(v28, 3LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v28, -1LL, -1LL);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease_n(a2, 2LL);
  }

  return v12;
}

void *sub_73CC(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for NSFastEnumerationIterator(0LL);
  uint64_t v69 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v8 = sub_56F8();
  id v9 = [v8 librarySpecificFetchOptions];

  uint64_t v10 = (uint64_t)&_swiftEmptyArrayStorage;
  unint64_t v76 = (unint64_t)&_swiftEmptyArrayStorage;
  id v11 =  [(id)objc_opt_self(PHPerson) fetchPersonsWithAutonamingSuggestionFeatureUserFeedbackWithOptions:v9];
  if (v11)
  {
    uint64_t v13 = v11;
    id v14 = [v11 fetchedObjects];

    if (v14)
    {
      uint64_t v15 = sub_10FC4(0LL, &qword_18B90, &OBJC_CLASS___PHPerson_ptr);
      uint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v15);
    }
  }

  uint64_t v16 = *(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFF8LL));
  if (!v16) {
    goto LABEL_43;
  }
  do
  {
    id v56 = v9;
    unint64_t v17 = 0LL;
    uint64_t v66 = &v2[OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger];
    unint64_t v68 = v10 & 0xC000000000000001LL;
    uint64_t v58 = v10 & 0xFFFFFFFFFFFFFF8LL;
    uint64_t v62 = v10;
    uint64_t v57 = v10 + 32;
    uint64_t v61 = (char *)v73 + 8;
    *(void *)&__int128 v12 = 136315394LL;
    __int128 v60 = v12;
    uint64_t v59 = (char *)&type metadata for Any + 8;
    uint64_t v10 = (uint64_t)&OBJC_CLASS___PHUserFeedback_ptr;
    uint64_t v67 = v16;
    while (1)
    {
      if (v68)
      {
        id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v17, v62);
        BOOL v19 = __OFADD__(v17, 1LL);
        unint64_t v20 = v17 + 1;
        if (v19) {
          break;
        }
        goto LABEL_14;
      }

      if (v17 >= *(void *)(v58 + 16)) {
        goto LABEL_38;
      }
      id v18 = *(id *)(v57 + 8 * v17);
      BOOL v19 = __OFADD__(v17, 1LL);
      unint64_t v20 = v17 + 1;
      if (v19) {
        break;
      }
LABEL_14:
      id v21 = v18;
      swift_bridgeObjectRetain_n(a2, 2LL);
      id v22 = v21;
      uint64_t v23 = (os_log_s *)Logger.logObject.getter(v22);
      os_log_type_t v24 = static os_log_type_t.debug.getter();
      int v25 = v24;
      BOOL v26 = os_log_type_enabled(v23, v24);
      unint64_t v70 = v20;
      id v71 = v22;
      if (v26)
      {
        uint64_t v27 = swift_slowAlloc(22LL, -1LL);
        int v65 = v25;
        uint64_t v28 = v27;
        uint64_t v64 = swift_slowAlloc(64LL, -1LL);
        *(void *)&__int128 v74 = v64;
        *(_DWORD *)uint64_t v28 = v60;
        uint64_t v63 = v28 + 4;
        uint64_t v29 = v5;
        uint64_t v30 = a1;
        unint64_t v31 = a2;
        id v32 = objc_msgSend(v22, "localIdentifier", v56);
        uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(v32);
        unint64_t v35 = v34;

        a2 = v31;
        a1 = v30;
        uint64_t v5 = v29;
        *(void *)&v73[0] = sub_4D7C(v33, v35, (uint64_t *)&v74);
        unint64_t v36 = v61;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v73, v61, v63, v28 + 12);

        swift_bridgeObjectRelease(v35);
        *(_WORD *)(v28 + 12) = 2080;
        swift_bridgeObjectRetain(a2);
        *(void *)&v73[0] = sub_4D7C(a1, a2, (uint64_t *)&v74);
        id v22 = v71;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(v73, v36, v28 + 14, v28 + 22);
        swift_bridgeObjectRelease_n(a2, 3LL);
        _os_log_impl( &dword_0,  v23,  (os_log_type_t)v65,  "Found PHPerson with localIdentifier %s with negative feedback for contact %s",  (uint8_t *)v28,  0x16u);
        uint64_t v37 = v64;
        swift_arrayDestroy(v64, 2LL, v59);
        swift_slowDealloc(v37, -1LL, -1LL);
        swift_slowDealloc(v28, -1LL, -1LL);
      }

      else
      {
        swift_bridgeObjectRelease_n(a2, 2LL);
      }

      [v22 fetchPropertySetsIfNeeded];
      id v38 = [v22 userFeedbackProperties];
      id v9 = [v38 autonamingUserFeedbacks];

      if (!v9)
      {
        sub_10FC4(0LL, &qword_18B80, &OBJC_CLASS___NSOrderedSet_ptr);
        id v9 = (id)NSOrderedSet.init(arrayLiteral:)(&_swiftEmptyArrayStorage);
      }

      uint64_t v39 = NSOrderedSet.makeIterator()();
      uint64_t v2 = v7;
      NSFastEnumerationIterator.next()(&v74, v39);
      while (v75)
      {
        sub_10FB4(&v74, v73);
        uint64_t v41 = sub_10FC4(0LL, &qword_18B88, &OBJC_CLASS___PHUserFeedback_ptr);
        uint64_t v40 = swift_dynamicCast(&v72, v73, (char *)&type metadata for Any + 8, v41, 6LL);
        if (!(_DWORD)v40) {
          goto LABEL_22;
        }
        id v42 = v72;
        unint64_t v43 = (unint64_t)[v72 feature];
        if ((v43 & 0x8000000000000000LL) == 0 && v43 == 2)
        {
          id v44 = [v42 context];
          if (v44)
          {
            id v45 = v44;
            uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v44);
            uint64_t v48 = v47;

            if (v46 == a1 && v48 == a2)
            {
              swift_bridgeObjectRelease(a2);
LABEL_32:
              id v50 = v71;
              specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
              unint64_t v52 = *(void *)((char *)&dword_10 + (v76 & 0xFFFFFFFFFFFFFF8LL));
              unint64_t v51 = *(void *)((char *)&dword_18 + (v76 & 0xFFFFFFFFFFFFFF8LL));
              if (v52 >= v51 >> 1) {
                specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v51 > 1, v52 + 1, 1LL);
              }
              uint64_t v53 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v52, v50);
              specialized Array._endMutation()(v53);
              goto LABEL_21;
            }

            char v49 = _stringCompareWithSmolCheck(_:_:expecting:)(v46, v48, a1, a2, 0LL);
            swift_bridgeObjectRelease(v48);
            if ((v49 & 1) != 0) {
              goto LABEL_32;
            }
          }
        }

LABEL_21:
LABEL_22:
        uint64_t v2 = v7;
        NSFastEnumerationIterator.next()(&v74, v40);
      }

      (*(void (**)(char *, uint64_t))(v69 + 8))(v7, v5);

      unint64_t v17 = v70;
      if (v70 == v67)
      {

        swift_bridgeObjectRelease(v62);
        return (void *)v76;
      }
    }

    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    if (v10 < 0) {
      uint64_t v55 = v10;
    }
    else {
      uint64_t v55 = v10 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(v10);
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter(v55);
    swift_bridgeObjectRelease(v10);
  }

  while (v16);
LABEL_43:

  swift_bridgeObjectRelease(v10);
  return &_swiftEmptyArrayStorage;
}

        uint64_t v10 = (v17 - 1) & v17;
        id v14 = __clz(__rbit64(v17)) + (v6 << 6);
        uint64_t v15 = *(void *)(a4 + 16);
      }

      while (!v15);
LABEL_22:
      BOOL v19 = *(void *)(*(void *)(a3 + 48) + 8 * v14);
      if (*(void *)(a4 + 32) != v19) {
        break;
      }
LABEL_4:
      *(unint64_t *)((char *)result + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      if (__OFADD__(v5++, 1LL)) {
        goto LABEL_32;
      }
    }
  }

  while (v15 == 1);
  unint64_t v20 = 5LL;
  while (1)
  {
    id v21 = v20 - 3;
    if (__OFADD__(v20 - 4, 1LL)) {
      break;
    }
    if (*(void *)(a4 + 8 * v20) == v19) {
      goto LABEL_4;
    }
    ++v20;
    if (v21 == v15) {
      goto LABEL_5;
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

uint64_t sub_7A38(uint64_t a1, uint64_t a2)
{
  id v4 = sub_56F8();
  id v5 = [v4 librarySpecificFetchOptions];

  [v5 setPersonContext:1];
  uint64_t v6 = (void *)objc_opt_self(&OBJC_CLASS___PHPerson);
  uint64_t v7 = sub_5460(&qword_18B78);
  uint64_t v8 = swift_allocObject(v7, 48LL, 7LL);
  *(_OWORD *)(v8 + 16) = xmmword_11CD0;
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  swift_bridgeObjectRetain(a2);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  id v10 = [v6 fetchPersonsWithLocalIdentifiers:isa options:v5];

  id v11 = [v10 firstObject];
  if (v11)
  {
    unsigned int v12 = [v11 ageType];
  }

  else
  {

    unsigned int v12 = 0;
  }

  return v12 | ((v11 == 0LL) << 16);
}

uint64_t sub_7B88@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v96 = a3;
  uint64_t v92 = type metadata accessor for VUGallery.Client(0LL);
  uint64_t v6 = *(void *)(v92 - 8);
  __chkstk_darwin(v92);
  uint64_t v8 = (char *)&v80 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = sub_5460(&qword_18B28);
  uint64_t v10 = __chkstk_darwin(v9);
  char v88 = (char *)&v80 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v80 - v12;
  uint64_t v14 = sub_5460(&qword_18B30);
  uint64_t v15 = __chkstk_darwin(v14);
  char v89 = (char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v15);
  id v18 = (char *)&v80 - v17;
  uint64_t v19 = type metadata accessor for UUID(0LL);
  uint64_t v95 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  uint64_t v94 = (char *)&v80 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = sub_5460(&qword_18AD8);
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v84 = (uint64_t)&v80 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v87 = (char *)&v80 - v25;
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)&v80 - v26;
  uint64_t v28 = type metadata accessor for VUGallery.RecognitionResult(0LL);
  uint64_t v90 = *(void *)(v28 - 8);
  uint64_t v86 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v90 + 56);
  v86(v27, 1LL, 1LL, v28);
  uint64_t v93 = v3;
  id v29 = sub_6FD0(a1, a2);
  if (!v29) {
    goto LABEL_24;
  }
  id v91 = v29;
  NSString v30 = [v91 localIdentifier];
  if (!v30)
  {
    ((void (*)(void))static String._unconditionallyBridgeFromObjectiveC(_:))();
    uint64_t v32 = v31;
    NSString v30 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v32);
  }

  id v33 = [(id)objc_opt_self(PHObject) uuidFromLocalIdentifier:v30];

  if (!v33)
  {
    id v41 = v91;

    goto LABEL_24;
  }

  uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
  uint64_t v85 = v19;
  uint64_t v36 = v35;

  UUID.init(uuidString:)(v34, v36);
  uint64_t v37 = v36;
  uint64_t v38 = v85;
  swift_bridgeObjectRelease(v37);
  uint64_t v39 = v95;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v95 + 48))(v18, 1LL, v38) == 1)
  {
    id v40 = v91;

    sub_113B8((uint64_t)v18, &qword_18B30);
LABEL_24:
    swift_beginAccess(v27, &v98, 0LL, 0LL);
    sub_11374((uint64_t)v27, v96, &qword_18AD8);
    return sub_113B8((uint64_t)v27, &qword_18AD8);
  }

  id v42 = *(void (**)(char *, char *, uint64_t))(v39 + 32);
  unint64_t v43 = v94;
  v42(v94, v18, v38);
  uint64_t v44 = v92;
  uint64_t v45 = *(void *)(v93 + 16);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for VUGallery.Client.photos(_:), v92);
  swift_retain(v45);
  uint64_t v46 = dispatch thunk of VUGallery.tags(matching:for:)(v43, v8);
  swift_release(v45);
  uint64_t v47 = *(void (**)(char *, uint64_t))(v6 + 8);
  v47(v8, v44);
  uint64_t v48 = *(void *)(v46 + 16);
  uint64_t v49 = type metadata accessor for VUGallery.TagView(0LL);
  uint64_t v50 = *(void *)(v49 - 8);
  if (v48)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))( v13,  v46 + ((*(unsigned __int8 *)(v50 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80)),  v49);
    uint64_t v51 = 0LL;
  }

  else
  {
    uint64_t v51 = 1LL;
  }

  unint64_t v52 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v50 + 56);
  v52(v13, v51, 1LL, v49);
  swift_bridgeObjectRelease(v46);
  uint64_t v53 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48);
  if (v53(v13, 1LL, v49) == 1)
  {
    id v54 = v91;

    sub_113B8((uint64_t)v13, &qword_18B28);
    uint64_t v55 = v85;
    uint64_t v56 = v95;
LABEL_23:
    (*(void (**)(char *, uint64_t))(v56 + 8))(v94, v55);
    goto LABEL_24;
  }

  uint64_t v82 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v53;
  uint64_t v83 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v52;
  uint64_t v57 = VUGallery.TagView.entity.getter();
  v81 = *(void (**)(char *, uint64_t))(v50 + 8);
  v81(v13, v49);
  uint64_t v58 = *(void *)(v93 + 16);
  uint64_t v59 = swift_retain(v58);
  uint64_t v60 = VUGallery.client.getter(v59);
  uint64_t v61 = VUGallery.Client.rawValue.getter(v60);
  v47(v8, v92);
  uint64_t v92 = v57;
  uint64_t v62 = dispatch thunk of VUGallery.tags(label:for:)(v57, v61);
  swift_release(v58);
  if (*(void *)(v62 + 16))
  {
    uint64_t v63 = (uint64_t)v88;
    (*(void (**)(char *, unint64_t, uint64_t))(v50 + 16))( v88,  v62 + ((*(unsigned __int8 *)(v50 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80)),  v49);
    uint64_t v64 = 0LL;
    int v65 = v89;
    uint64_t v66 = v90;
  }

  else
  {
    uint64_t v64 = 1LL;
    int v65 = v89;
    uint64_t v66 = v90;
    uint64_t v63 = (uint64_t)v88;
  }

  uint64_t v67 = v82;
  v83(v63, v64, 1LL, v49);
  swift_bridgeObjectRelease(v62);
  int v68 = v67(v63, 1LL, v49);
  uint64_t v69 = v85;
  uint64_t v56 = v95;
  if (v68 == 1)
  {
    sub_113B8(v63, &qword_18B28);
    uint64_t v70 = 1LL;
  }

  else
  {
    VUGallery.TagView.tag.getter();
    v81((char *)v63, v49);
    uint64_t v70 = 0LL;
  }

  uint64_t v71 = (uint64_t)v87;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v56 + 56))(v65, v70, 1LL, v69);
  VUGallery.RecognitionResult.init(_:_:_:)(v92, v65, 1.0);
  v86((char *)v71, 0LL, 1LL, v28);
  uint64_t v72 = sub_110C8(v71, (uint64_t)v27, &qword_18AD8);
  v73 = (void *)Logger.logObject.getter(v72);
  os_log_type_t v74 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled((os_log_t)v73, v74))
  {
LABEL_22:

    id v78 = v91;
    uint64_t v55 = v85;
    goto LABEL_23;
  }

  uint64_t v75 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  *(_DWORD *)uint64_t v75 = 134217984;
  swift_beginAccess(v27, v97, 0LL, 0LL);
  uint64_t v76 = v84;
  sub_11374((uint64_t)v27, v84, &qword_18AD8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v66 + 48))(v76, 1LL, v28) != 1)
  {
    uint64_t v77 = VUGallery.RecognitionResult.entityIdentifier.getter();
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v76, v28);
    uint64_t v98 = v77;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v98, &v99, v75 + 4, v75 + 12);
    _os_log_impl(&dword_0, (os_log_t)v73, v74, "Device owner: found ground truth %ld", v75, 0xCu);
    swift_slowDealloc(v75, -1LL, -1LL);
    goto LABEL_22;
  }

  uint64_t result = sub_113B8((uint64_t)v27, &qword_18AD8);
  __break(1u);
  return result;
}

uint64_t sub_82BC(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v129 = (char *)v122 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_5460(&qword_18B28);
  uint64_t v8 = __chkstk_darwin(v7);
  v127 = (char *)v122 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  v130 = (char *)v122 - v10;
  uint64_t v134 = type metadata accessor for VUGallery.TagView(0LL);
  uint64_t v11 = *(void *)(v134 - 8);
  uint64_t v12 = __chkstk_darwin(v134);
  v141 = (char *)v122 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v12);
  v133 = (char *)v122 - v14;
  uint64_t v15 = type metadata accessor for VUGallery.Client(0LL);
  uint64_t v16 = *(void **)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  v140 = (char *)v122 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)v122 - v19;
  uint64_t v21 = sub_5460(&qword_18B30);
  uint64_t v22 = __chkstk_darwin(v21);
  v126 = (char *)v122 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v24 = __chkstk_darwin(v22);
  v128 = (char *)v122 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v28 = (char *)v122 - v27;
  __chkstk_darwin(v26);
  NSString v30 = (char *)v122 - v29;
  v146 = a1;
  uint64_t v147 = a2;
  uint64_t v144 = 58LL;
  unint64_t v145 = 0xE100000000000000LL;
  unint64_t v31 = sub_10F70();
  uint64_t v32 = (void *)StringProtocol.components<A>(separatedBy:)( &v144,  &type metadata for String,  &type metadata for String,  v31,  v31);
  id v33 = v32;
  if (!v32[2])
  {
    swift_bridgeObjectRelease(v32);
    return 0LL;
  }

  v139 = v16;
  unint64_t v35 = v32[4];
  unint64_t v34 = v32[5];
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease(v33);
  unint64_t v142 = v35;
  UUID.init(uuidString:)(v35, v34);
  uint64_t v124 = v5;
  uint64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
  uint64_t v125 = v4;
  if (v36(v30, 1LL, v4) == 1)
  {
    swift_bridgeObjectRelease(v34);
    uint64_t v37 = (uint64_t)v30;
LABEL_54:
    sub_113B8(v37, &qword_18B30);
    return 0LL;
  }

  v123 = (uint64_t (*)(char *, uint64_t, uint64_t))v36;
  sub_113B8((uint64_t)v30, &qword_18B30);
  uint64_t v38 = v131 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger;
  uint64_t v39 = swift_bridgeObjectRetain_n(v34, 2LL);
  v122[1] = v38;
  id v40 = (os_log_s *)Logger.logObject.getter(v39);
  os_log_type_t v41 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v40, v41))
  {
    id v42 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    v138 = (void *)swift_slowAlloc(32LL, -1LL);
    v146 = v138;
    *(_DWORD *)id v42 = 136315138;
    v137 = v42 + 4;
    swift_bridgeObjectRetain(v34);
    unint64_t v43 = v142;
    uint64_t v144 = sub_4D7C(v142, v34, (uint64_t *)&v146);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v144, &v145, v137, v42 + 12);
    swift_bridgeObjectRelease_n(v34, 3LL);
    _os_log_impl(&dword_0, v40, v41, "Me Contact Picture: fetching tags for UUID %s", v42, 0xCu);
    uint64_t v44 = v138;
    swift_arrayDestroy(v138, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v44, -1LL, -1LL);
    swift_slowDealloc(v42, -1LL, -1LL);

    uint64_t v45 = v134;
  }

  else
  {
    swift_bridgeObjectRelease_n(v34, 2LL);

    uint64_t v45 = v134;
    unint64_t v43 = v142;
  }

  uint64_t v46 = v139;
  uint64_t v47 = *(void *)(v131 + 16);
  swift_retain(v47);
  UUID.init(uuidString:)(v43, v34);
  swift_bridgeObjectRelease(v34);
  uint64_t v48 = v125;
  uint64_t result = v123(v28, 1LL, v125);
  if ((_DWORD)result == 1) {
    goto LABEL_58;
  }
  v139 = (void *)v46[13];
  ((void (*)(char *, void, uint64_t))v139)(v20, enum case for VUGallery.Client.contacts(_:), v15);
  uint64_t v50 = dispatch thunk of VUGallery.tags(matching:for:)(v28, v20);
  swift_release(v47);
  v138 = (void *)v46[1];
  ((void (*)(char *, uint64_t))v138)(v20, v15);
  v122[0] = *(void *)(v124 + 8);
  uint64_t result = ((uint64_t (*)(char *, uint64_t))v122[0])(v28, v48);
  uint64_t v51 = &_swiftEmptyArrayStorage;
  v146 = &_swiftEmptyArrayStorage;
  unint64_t v52 = v133;
  v137 = *(uint8_t **)(v50 + 16);
  if (v137)
  {
    unint64_t v53 = 0LL;
    unsigned int v135 = enum case for VUGallery.Client.photos(_:);
    uint64_t v54 = v45;
    uint64_t v132 = v15;
    uint64_t v136 = v50;
    while (v53 < *(void *)(v50 + 16))
    {
      uint64_t v55 = *(void *)(v11 + 72);
      unint64_t v142 = (*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      uint64_t v56 = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v11 + 16))(v52, v50 + v142 + v55 * v53, v54);
      VUGallery.TagView.client.getter(v56);
      uint64_t v57 = v11;
      uint64_t v58 = v20;
      uint64_t v59 = v140;
      ((void (*)(char *, void, uint64_t))v139)(v140, v135, v15);
      uint64_t v60 = v54;
      uint64_t v61 = sub_113F4( &qword_18B68,  (uint64_t (*)(uint64_t))&type metadata accessor for VUGallery.Client,  (uint64_t)&protocol conformance descriptor for VUGallery.Client);
      dispatch thunk of RawRepresentable.rawValue.getter(&v144, v15, v61);
      dispatch thunk of RawRepresentable.rawValue.getter(&v143, v15, v61);
      int v62 = (unsigned __int16)v144;
      LODWORD(v61) = v143;
      uint64_t v63 = v59;
      uint64_t v20 = v58;
      uint64_t v64 = (void (*)(char *, uint64_t))v138;
      ((void (*)(char *, uint64_t))v138)(v63, v15);
      v64(v20, v15);
      if (v62 == (_DWORD)v61)
      {
        int v65 = v52;
        uint64_t v66 = v20;
        uint64_t v67 = v57;
        int v68 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
        v68(v141, v65, v60);
        uint64_t v69 = v146;
        if ((swift_isUniquelyReferenced_nonNull_native(v146) & 1) == 0)
        {
          sub_C390(0, v69[2] + 1LL, 1);
          uint64_t v69 = v146;
        }

        uint64_t v50 = v136;
        unint64_t v70 = v142;
        unint64_t v72 = v69[2];
        unint64_t v71 = v69[3];
        if (v72 >= v71 >> 1)
        {
          sub_C390(v71 > 1, v72 + 1, 1);
          uint64_t v69 = v146;
        }

        v69[2] = v72 + 1;
        uint64_t v54 = v134;
        uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v68)((char *)v69 + v70 + v72 * v55, v141, v134);
        v146 = v69;
        uint64_t v11 = v67;
        uint64_t v20 = v66;
        uint64_t v15 = v132;
        unint64_t v52 = v133;
      }

      else
      {
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v52, v60);
        uint64_t v11 = v57;
        uint64_t v54 = v60;
        uint64_t v50 = v136;
      }

      if (v137 == (uint8_t *)++v53)
      {
        uint64_t v51 = v146;
        goto LABEL_22;
      }
    }

    __break(1u);
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }

  uint64_t v54 = v45;
LABEL_22:
  uint64_t v73 = swift_bridgeObjectRelease(v50);
  os_log_type_t v74 = (char *)v51[2];
  if (v74 != (_BYTE *)&dword_0 + 1)
  {
    uint64_t v82 = swift_retain(v51);
    uint64_t v83 = (os_log_s *)Logger.logObject.getter(v82);
    os_log_type_t v84 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v83, v84))
    {
      uint64_t v85 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v85 = 134217984;
      swift_release(v51);
      v146 = v74;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v146, &v147, v85 + 4, v85 + 12);
      swift_release(v51);
      _os_log_impl( &dword_0,  v83,  v84,  "Me Contact Picture: found %ld faces, not usable for device owner inference.",  v85,  0xCu);
      swift_slowDealloc(v85, -1LL, -1LL);
    }

    else
    {

      swift_release_n(v51, 2LL);
    }

    return 0LL;
  }

  uint64_t v75 = (os_log_s *)Logger.logObject.getter(v73);
  os_log_type_t v76 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v75, v76))
  {
    uint64_t v77 = v54;
    id v78 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v78 = 0;
    _os_log_impl(&dword_0, v75, v76, "Me Contact Picture: found exactly one face", v78, 2u);
    uint64_t v79 = v78;
    uint64_t v54 = v77;
    swift_slowDealloc(v79, -1LL, -1LL);
  }

  if (v51[2])
  {
    uint64_t v80 = v130;
    (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))( v130,  (unint64_t)v51 + ((*(unsigned __int8 *)(v11 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80)),  v54);
    v81 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    v81(v80, 0LL, 1LL, v54);
  }

  else
  {
    v81 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
    uint64_t v80 = v130;
    v81(v130, 1LL, 1LL, v54);
  }

  uint64_t v86 = v20;
  swift_release(v51);
  uint64_t v87 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  uint64_t result = v87(v80, 1LL, v54);
  if ((_DWORD)result != 1)
  {
    uint64_t v88 = v54;
    uint64_t v89 = VUGallery.TagView.entity.getter();
    uint64_t v90 = *(void (**)(char *, uint64_t))(v11 + 8);
    v90(v80, v88);
    uint64_t v91 = v11;
    uint64_t v92 = v88;
    uint64_t v93 = *(void *)(v131 + 16);
    uint64_t v94 = v86;
    ((void (*)(char *, void, uint64_t))v139)(v86, enum case for VUGallery.Client.photos(_:), v15);
    uint64_t v95 = swift_retain(v93);
    uint64_t v96 = VUGallery.Client.rawValue.getter(v95);
    ((void (*)(char *, uint64_t))v138)(v94, v15);
    uint64_t v97 = dispatch thunk of VUGallery.tags(label:for:)(v89, v96);
    swift_release(v93);
    if (*(void *)(v97 + 16))
    {
      uint64_t v98 = (uint64_t)v127;
      (*(void (**)(char *, unint64_t, uint64_t))(v91 + 16))( v127,  v97 + ((*(unsigned __int8 *)(v91 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v91 + 80)),  v92);
      uint64_t v99 = 0LL;
      uint64_t v100 = v125;
    }

    else
    {
      uint64_t v99 = 1LL;
      uint64_t v100 = v125;
      uint64_t v98 = (uint64_t)v127;
    }

    uint64_t v101 = (uint64_t)v128;
    uint64_t v102 = (uint64_t)v126;
    v81((char *)v98, v99, 1LL, v92);
    swift_bridgeObjectRelease(v97);
    if (v87((char *)v98, 1LL, v92) == 1)
    {
      sub_113B8(v98, &qword_18B28);
      uint64_t v103 = 1LL;
    }

    else
    {
      VUGallery.TagView.tag.getter();
      v90((char *)v98, v92);
      uint64_t v103 = 0LL;
    }

    uint64_t v104 = v124;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v124 + 56))(v101, v103, 1LL, v100);
    sub_11374(v101, v102, &qword_18B30);
    if (v123((char *)v102, 1LL, v100) == 1)
    {
      uint64_t v105 = sub_113B8(v102, &qword_18B30);
      v106 = (os_log_s *)Logger.logObject.getter(v105);
      os_log_type_t v107 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v106, v107))
      {
        uint64_t v108 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v108 = 0;
        _os_log_impl(&dword_0, v106, v107, "Me Contact Picture: does not match a PHPerson", v108, 2u);
        swift_slowDealloc(v108, -1LL, -1LL);
      }
    }

    else
    {
      uint64_t v109 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v104 + 32))(v129, v102, v100);
      uint64_t v110 = UUID.uuidString.getter(v109);
      uint64_t v112 = v111;
      int v113 = sub_7A38(v110, v111);
      uint64_t v114 = swift_bridgeObjectRelease(v112);
      v115 = (os_log_s *)Logger.logObject.getter(v114);
      os_log_type_t v116 = static os_log_type_t.debug.getter();
      BOOL v117 = os_log_type_enabled(v115, v116);
      if ((v113 & 0x10000) == 0 && (unsigned __int16)(v113 - 6) >= 0xFFFDu)
      {
        if (v117)
        {
          v118 = (uint8_t *)swift_slowAlloc(6LL, -1LL);
          *(_DWORD *)v118 = 33554688;
          LOWORD(v146) = v113;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v146, (char *)&v146 + 2, v118 + 4, v118 + 6);
          _os_log_impl( &dword_0,  v115,  v116,  "Me Contact Picture: matches a PHPerson young adult, adult or senior (age %hu), returning this entity",  v118,  6u);
          swift_slowDealloc(v118, -1LL, -1LL);
        }

        ((void (*)(char *, uint64_t))v122[0])(v129, v100);
        sub_113B8(v101, &qword_18B30);
        return v89;
      }

      if (v117)
      {
        v119 = (uint8_t *)swift_slowAlloc(6LL, -1LL);
        v120 = v119;
        *(_DWORD *)v119 = 33554688;
        if ((v113 & 0x10000) != 0) {
          __int16 v121 = 0;
        }
        else {
          __int16 v121 = v113;
        }
        LOWORD(v146) = v121;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v146, (char *)&v146 + 2, v119 + 4, v119 + 6);
        _os_log_impl( &dword_0,  v115,  v116,  "Me Contact Picture: matches a PHPerson not adult (age %hu), not usable for device owner inference",  v120,  6u);
        swift_slowDealloc(v120, -1LL, -1LL);
      }

      ((void (*)(char *, uint64_t))v122[0])(v129, v100);
    }

    uint64_t v37 = v101;
    goto LABEL_54;
  }

LABEL_59:
  __break(1u);
  return result;
}

void *sub_8F98(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for VUGallery.Client(0LL);
  uint64_t v95 = *(void *)(v5 - 8);
  uint64_t v96 = v5;
  __chkstk_darwin(v5);
  uint64_t v94 = (char *)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = sub_5460(&qword_18B30);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v93 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8);
  uint64_t v100 = (char *)&v88 - v10;
  uint64_t v11 = type metadata accessor for UUID(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v13);
  uint64_t v98 = (char *)&v88 - v16;
  v106[0] = &_swiftEmptyArrayStorage;
  uint64_t v97 = v2;
  uint64_t v17 = sub_6C08();
  uint64_t v18 = v17;
  if ((unint64_t)v17 >> 62)
  {
    if (v17 >= 0) {
      v17 &= 0xFFFFFFFFFFFFFF8uLL;
    }
    uint64_t result = (void *)_CocoaArrayWrapper.endIndex.getter(v17);
  }

  else
  {
    uint64_t result = *(void **)((char *)&dword_10 + (v17 & 0xFFFFFFFFFFFFF8LL));
  }

  uint64_t v20 = &VUPersonalizationPlugin;
  uint64_t v92 = v11;
  uint64_t v99 = v12;
  if (result)
  {
    if ((uint64_t)result >= 1)
    {
      uint64_t v88 = v15;
      uint64_t v21 = 0LL;
      unint64_t v101 = v18 & 0xC000000000000001LL;
      id v102 = (id)v18;
      unsigned int v91 = enum case for VUGallery.Client.photos(_:);
      unint64_t v90 = a2;
      uint64_t v89 = a1;
      while (1)
      {
        uint64_t v22 = result;
        if (v101) {
          id v23 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v21, v18);
        }
        else {
          id v23 = *(id *)(v18 + 8LL * (void)v21 + 32);
        }
        uint64_t v24 = v23;
        id v25 = objc_msgSend(v23, "personUri", v88);
        if (!v25) {
          goto LABEL_17;
        }
        uint64_t v26 = v25;
        uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
        uint64_t v29 = v28;

        if (v27 == a1 && v29 == a2)
        {

          swift_bridgeObjectRelease(a2);
          goto LABEL_7;
        }

        char v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v27, v29, a1, a2, 0LL);
        swift_bridgeObjectRelease(v29);
        if ((v31 & 1) == 0)
        {
LABEL_17:
          NSString v32 = [v24 *(SEL *)&v20[18].flags];
          if (!v32)
          {
            static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
            uint64_t v34 = v33;
            NSString v32 = String._bridgeToObjectiveC()();
            swift_bridgeObjectRelease(v34);
          }

          id v35 = [(id)objc_opt_self(PHObject) uuidFromLocalIdentifier:v32];

          if (v35)
          {
            uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(v35);
            uint64_t v38 = v37;

            uint64_t v39 = (uint64_t)v100;
            UUID.init(uuidString:)(v36, v38);
            swift_bridgeObjectRelease(v38);
            uint64_t v40 = v99;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v99 + 48))(v39, 1LL, v11) == 1)
            {

              sub_113B8(v39, &qword_18B30);
            }

            else
            {
              os_log_type_t v41 = v98;
              (*(void (**)(char *, uint64_t, uint64_t))(v40 + 32))(v98, v39, v11);
              uint64_t v42 = v96;
              uint64_t v43 = *(void *)(v97 + 16);
              uint64_t v44 = v94;
              uint64_t v45 = v95;
              (*(void (**)(char *, void, uint64_t))(v95 + 104))(v94, v91, v96);
              swift_retain(v43);
              uint64_t v46 = dispatch thunk of VUGallery.entityIdentifier(matching:for:)(v41, v44);
              char v48 = v47;
              swift_release(v43);
              (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v42);
              if ((v48 & 1) != 0)
              {
                uint64_t v11 = v92;
                (*(void (**)(char *, uint64_t))(v99 + 8))(v41, v92);

                uint64_t v20 = &VUPersonalizationPlugin;
                a2 = v90;
                a1 = v89;
              }

              else
              {
                uint64_t v49 = (char *)v106[0];
                char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v106[0]);
                a2 = v90;
                a1 = v89;
                if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
                  uint64_t v49 = sub_BF90(0LL, *((void *)v49 + 2) + 1LL, 1, v49);
                }
                uint64_t v20 = &VUPersonalizationPlugin;
                unint64_t v52 = *((void *)v49 + 2);
                unint64_t v51 = *((void *)v49 + 3);
                if (v52 >= v51 >> 1) {
                  uint64_t v49 = sub_BF90((char *)(v51 > 1), v52 + 1, 1, v49);
                }
                *((void *)v49 + 2) = v52 + 1;
                *(void *)&v49[8 * v52 + 32] = v46;

                v106[0] = v49;
                uint64_t v11 = v92;
                (*(void (**)(char *, uint64_t))(v99 + 8))(v98, v92);
              }
            }

            goto LABEL_7;
          }
        }

LABEL_7:
        uint64_t v21 = (char *)v21 + 1;
        uint64_t result = v22;
        uint64_t v18 = (uint64_t)v102;
        if (v22 == v21)
        {
          swift_bridgeObjectRelease(v102);
          uint64_t v15 = v88;
          uint64_t v12 = v99;
          goto LABEL_32;
        }
      }
    }

    __break(1u);
    goto LABEL_63;
  }

  swift_bridgeObjectRelease(v18);
LABEL_32:
  uint64_t v53 = (uint64_t)sub_73CC(a1, a2);
  uint64_t v54 = v53;
  uint64_t v55 = (uint64_t)v93;
  if ((unint64_t)v53 >> 62)
  {
    if (v53 >= 0) {
      v53 &= 0xFFFFFFFFFFFFFF8uLL;
    }
    uint64_t v56 = _CocoaArrayWrapper.endIndex.getter(v53);
    if (!v56) {
      goto LABEL_59;
    }
  }

  else
  {
    uint64_t v56 = *(void *)((char *)&dword_10 + (v53 & 0xFFFFFFFFFFFFF8LL));
    if (!v56) {
      goto LABEL_59;
    }
  }

  uint64_t result = (void *)objc_opt_self(&OBJC_CLASS___PHObject);
  id v102 = result;
  if (v56 < 1)
  {
LABEL_63:
    __break(1u);
    return result;
  }

  uint64_t v57 = 0LL;
  uint64_t v100 = (char *)(v54 & 0xC000000000000001LL);
  unsigned int v91 = enum case for VUGallery.Client.photos(_:);
  unint64_t v101 = v56;
  uint64_t v98 = (char *)v54;
  do
  {
    if (v100) {
      id v58 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v57, v54);
    }
    else {
      id v58 = *(id *)(v54 + 8 * v57 + 32);
    }
    uint64_t v59 = v58;
    NSString v60 = [v58 *(SEL *)&v20[18].flags];
    if (!v60)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0LL);
      uint64_t v62 = v61;
      NSString v60 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v62);
    }

    id v63 = [v102 uuidFromLocalIdentifier:v60];

    if (v63)
    {
      uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)(v63);
      uint64_t v66 = v65;

      UUID.init(uuidString:)(v64, v66);
      swift_bridgeObjectRelease(v66);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v55, 1LL, v11) == 1)
      {

        sub_113B8(v55, &qword_18B30);
        uint64_t v54 = (uint64_t)v98;
      }

      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v15, v55, v11);
        uint64_t v67 = *(void *)(v97 + 16);
        int v68 = v94;
        uint64_t v69 = v95;
        uint64_t v70 = v11;
        uint64_t v71 = v96;
        (*(void (**)(char *, void, uint64_t))(v95 + 104))(v94, v91, v96);
        swift_retain(v67);
        uint64_t v72 = dispatch thunk of VUGallery.entityIdentifier(matching:for:)(v15, v68);
        char v74 = v73;
        swift_release(v67);
        (*(void (**)(char *, uint64_t))(v69 + 8))(v68, v71);
        if ((v74 & 1) != 0)
        {
          uint64_t v12 = v99;
          (*(void (**)(char *, uint64_t))(v99 + 8))(v15, v70);

          uint64_t v55 = (uint64_t)v93;
          uint64_t v11 = v70;
          uint64_t v20 = &VUPersonalizationPlugin;
          uint64_t v54 = (uint64_t)v98;
        }

        else
        {
          uint64_t v75 = (char *)v106[0];
          if ((swift_isUniquelyReferenced_nonNull_native(v106[0]) & 1) == 0) {
            uint64_t v75 = sub_BF90(0LL, *((void *)v75 + 2) + 1LL, 1, v75);
          }
          uint64_t v55 = (uint64_t)v93;
          uint64_t v12 = v99;
          uint64_t v20 = &VUPersonalizationPlugin;
          unint64_t v77 = *((void *)v75 + 2);
          unint64_t v76 = *((void *)v75 + 3);
          if (v77 >= v76 >> 1) {
            uint64_t v75 = sub_BF90((char *)(v76 > 1), v77 + 1, 1, v75);
          }
          *((void *)v75 + 2) = v77 + 1;
          *(void *)&v75[8 * v77 + 32] = v72;

          v106[0] = v75;
          uint64_t v11 = v92;
          (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v92);
          uint64_t v54 = (uint64_t)v98;
        }
      }
    }

    else
    {
    }

    ++v57;
  }

  while (v101 != v57);
LABEL_59:
  uint64_t v78 = swift_bridgeObjectRelease(v54);
  uint64_t v79 = (os_log_s *)Logger.logObject.getter(v78);
  os_log_type_t v80 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v79, v80))
  {
    v81 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v82 = swift_slowAlloc(32LL, -1LL);
    v105[0] = v82;
    *(_DWORD *)v81 = 136315138;
    swift_beginAccess(v106, v104, 0LL, 0LL);
    uint64_t v83 = v106[0];
    uint64_t v84 = swift_bridgeObjectRetain(v106[0]);
    uint64_t v85 = Array.description.getter(v84, &type metadata for Int);
    unint64_t v87 = v86;
    swift_bridgeObjectRelease(v83);
    uint64_t v103 = sub_4D7C(v85, v87, v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v103, v104, v81 + 4, v81 + 12);
    swift_bridgeObjectRelease(v87);
    _os_log_impl(&dword_0, v79, v80, "Device owner: invalid persons %s", v81, 0xCu);
    swift_arrayDestroy(v82, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v82, -1LL, -1LL);
    swift_slowDealloc(v81, -1LL, -1LL);
  }

  swift_beginAccess(v106, v105, 0LL, 0LL);
  return (void *)v106[0];
}

uint64_t sub_9858(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  int v80 = a2;
  uint64_t v82 = type metadata accessor for UUID(0LL);
  uint64_t v5 = *(void *)(v82 - 8);
  uint64_t v6 = __chkstk_darwin(v82);
  uint64_t v78 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v79 = (char *)&v77 - v9;
  __chkstk_darwin(v8);
  uint64_t v83 = (char *)&v77 - v10;
  uint64_t v11 = type metadata accessor for VUGallery.Client(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = sub_5460(&qword_18B28);
  __chkstk_darwin(v15);
  uint64_t v17 = (char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_5460(&qword_18B30);
  uint64_t v19 = __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v19);
  uint64_t v84 = (uint64_t)&v77 - v22;
  uint64_t v23 = *(void *)(v3 + 16);
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for VUGallery.Client.photos(_:), v11);
  uint64_t v24 = swift_retain(v23);
  uint64_t v25 = VUGallery.Client.rawValue.getter(v24);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v81 = a1;
  uint64_t v26 = dispatch thunk of VUGallery.tags(label:for:)(a1, v25);
  swift_release(v23);
  uint64_t v27 = *(void *)(v26 + 16);
  uint64_t v28 = type metadata accessor for VUGallery.TagView(0LL);
  uint64_t v29 = *(void *)(v28 - 8);
  if (v27)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v29 + 16))( v17,  v26 + ((*(unsigned __int8 *)(v29 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80)),  v28);
    uint64_t v30 = 0LL;
  }

  else
  {
    uint64_t v30 = 1LL;
  }

  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v17, v30, 1LL, v28);
  swift_bridgeObjectRelease(v26);
  int v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48))(v17, 1LL, v28);
  uint64_t v32 = v84;
  if (v31 == 1)
  {
    sub_113B8((uint64_t)v17, &qword_18B28);
    uint64_t v33 = 1LL;
  }

  else
  {
    VUGallery.TagView.tag.getter();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v28);
    uint64_t v33 = 0LL;
  }

  uint64_t v34 = v82;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(v32, v33, 1LL, v82);
  sub_11374(v32, (uint64_t)v21, &qword_18B30);
  int v35 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v21, 1LL, v34);
  uint64_t v36 = v83;
  if (v35 == 1)
  {
    uint64_t v37 = sub_113B8((uint64_t)v21, &qword_18B30);
LABEL_15:
    uint64_t v57 = (os_log_s *)Logger.logObject.getter(v37);
    os_log_type_t v58 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v57, v58))
    {
      uint64_t v59 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      *(_DWORD *)uint64_t v59 = 134217984;
      uint64_t v86 = v81;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v59 + 4, v59 + 12);
      _os_log_impl(&dword_0, v57, v58, "Age of the entity %ld not found", v59, 0xCu);
      swift_slowDealloc(v59, -1LL, -1LL);
    }

    uint64_t v60 = v32;
    goto LABEL_18;
  }

  uint64_t v38 = (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))(v83, v21, v34);
  uint64_t v39 = UUID.uuidString.getter(v38);
  uint64_t v41 = v40;
  int v42 = sub_7A38(v39, v40);
  swift_bridgeObjectRelease(v41);
  if ((v42 & 0x10000) != 0)
  {
    uint64_t v37 = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v36, v34);
    goto LABEL_15;
  }

  __int16 v43 = v42;
  uint64_t v44 = *(uint64_t (**)(char *, char *, uint64_t))(v5 + 16);
  if ((unsigned __int16)v42 != 1 && (v80 & ((unsigned __int16)v42 == 2)) == 0)
  {
    uint64_t v45 = v78;
    uint64_t v46 = v44(v78, v36, v34);
    char v47 = (os_log_s *)Logger.logObject.getter(v46);
    os_log_type_t v48 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = swift_slowAlloc(32LL, -1LL);
      uint64_t v50 = swift_slowAlloc(32LL, -1LL);
      uint64_t v79 = (char *)v50;
      *(_DWORD *)uint64_t v49 = 134218754;
      uint64_t v85 = v81;
      uint64_t v86 = v50;
      uint64_t v51 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v49 + 4, v49 + 12);
      *(_WORD *)(v49 + 12) = 2080;
      uint64_t v52 = UUID.uuidString.getter(v51);
      unint64_t v54 = v53;
      uint64_t v85 = sub_4D7C(v52, v53, &v86);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v49 + 14, v49 + 22);
      swift_bridgeObjectRelease(v54);
      uint64_t v55 = *(void (**)(char *, uint64_t))(v5 + 8);
      v55(v45, v34);
      *(_WORD *)(v49 + 22) = 512;
      LOWORD(v85) = v43;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, (char *)&v85 + 2, v49 + 24, v49 + 26);
      *(_WORD *)(v49 + 26) = 1024;
      LODWORD(v85) = v80 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, (char *)&v85 + 4, v49 + 28, v49 + 32);
      _os_log_impl( &dword_0,  v47,  v48,  "Age of the entity %ld, UUID %s is %hu (not baby nor a child if includeChild %{BOOL}d)",  (uint8_t *)v49,  0x20u);
      uint64_t v56 = v79;
      swift_arrayDestroy(v79, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1LL, -1LL);
      swift_slowDealloc(v49, -1LL, -1LL);

      v55(v83, v34);
    }

    else
    {

      unint64_t v76 = *(void (**)(char *, uint64_t))(v5 + 8);
      v76(v45, v34);
      v76(v36, v34);
    }

    uint64_t v60 = v84;
LABEL_18:
    sub_113B8(v60, &qword_18B30);
    return 0LL;
  }

  id v63 = v79;
  uint64_t v64 = v44(v79, v36, v34);
  uint64_t v65 = (os_log_s *)Logger.logObject.getter(v64);
  os_log_type_t v66 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v67 = swift_slowAlloc(32LL, -1LL);
    uint64_t v68 = swift_slowAlloc(32LL, -1LL);
    uint64_t v78 = (char *)v68;
    *(_DWORD *)uint64_t v67 = 134218754;
    uint64_t v85 = v81;
    uint64_t v86 = v68;
    uint64_t v69 = UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v67 + 4, v67 + 12);
    *(_WORD *)(v67 + 12) = 2080;
    uint64_t v70 = UUID.uuidString.getter(v69);
    unint64_t v72 = v71;
    uint64_t v85 = sub_4D7C(v70, v71, &v86);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, &v86, v67 + 14, v67 + 22);
    swift_bridgeObjectRelease(v72);
    char v73 = *(void (**)(char *, uint64_t))(v5 + 8);
    v73(v63, v34);
    *(_WORD *)(v67 + 22) = 512;
    LOWORD(v85) = v43;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, (char *)&v85 + 2, v67 + 24, v67 + 26);
    *(_WORD *)(v67 + 26) = 1024;
    LODWORD(v85) = v80 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v85, (char *)&v85 + 4, v67 + 28, v67 + 32);
    _os_log_impl( &dword_0,  v65,  v66,  "Age of the entity %ld UUID %s is %hu (baby or child with includeChild %{BOOL}d), so it is considered invalid",  (uint8_t *)v67,  0x20u);
    uint64_t v61 = 1LL;
    char v74 = v78;
    swift_arrayDestroy(v78, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v74, -1LL, -1LL);
    swift_slowDealloc(v67, -1LL, -1LL);

    v73(v83, v34);
    sub_113B8(v84, &qword_18B30);
  }

  else
  {

    uint64_t v75 = *(void (**)(char *, uint64_t))(v5 + 8);
    v75(v63, v34);
    v75(v36, v34);
    sub_113B8(v84, &qword_18B30);
    return 1LL;
  }

  return v61;
}

void *sub_A040(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = swift_bridgeObjectRetain(a1);
  uint64_t v7 = sub_C860(v6, (uint64_t (*)(char *, unint64_t, uint64_t))sub_E13C);
  swift_bridgeObjectRelease(a1);
  uint64_t v8 = sub_C860(v7, (uint64_t (*)(char *, unint64_t, uint64_t))sub_E000);
  swift_release(v7);
  uint64_t v9 = swift_retain(v8);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v2 = 12LL;
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v12 = 134217984;
    uint64_t v39 = *(void *)(v8 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40, v12 + 4, v12 + 12);
    swift_release(v8);
    _os_log_impl( &dword_0,  v10,  v11,  "Device owner: [Top-selfies] After filtering at min 5 selfies and on predicate, found %ld entities with selfies.",  v12,  0xCu);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
    swift_release(v8);
  }

  if (!*(void *)(v8 + 16))
  {
    swift_release(v8);
    return _swiftEmptyArrayStorage;
  }

  uint64_t v13 = swift_bridgeObjectRetain(v8);
  unint64_t v14 = (unint64_t)sub_C2AC(v13);
  swift_release(v8);
  uint64_t v39 = v14;
  sub_CB38(&v39, sub_CBA4);
  swift_release(v8);
  uint64_t v15 = (void *)v39;
  uint64_t v16 = sub_5460(&qword_18B38);
  uint64_t v17 = swift_allocObject(v16, 40LL, 7LL);
  *(_OWORD *)(v17 + 16) = xmmword_11CD0;
  if (!v15[2]) {
    goto LABEL_45;
  }
  uint64_t v8 = v17;
  uint64_t v3 = v15 + 4;
  *(void *)(v17 + 32) = v15[4];
  uint64_t v41 = v17;
  unint64_t v2 = v15[2];
  if (v2 == 1)
  {
    swift_release(v15);
    return (void *)v8;
  }

  if (a2 < 101)
  {
    unint64_t v14 = Logger.logObject.getter(v17);
    os_log_type_t v19 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled((os_log_t)v14, v19))
    {
      uint64_t v20 = swift_slowAlloc(22LL, -1LL);
      *(_DWORD *)uint64_t v20 = 134218240;
      uint64_t v39 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40, v20 + 4, v20 + 12);
      *(_WORD *)(v20 + 12) = 2048;
      uint64_t v39 = 100LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40, v20 + 14, v20 + 22);
      _os_log_impl( &dword_0,  (os_log_t)v14,  v19,  "Device owner: [Top-selfies] Number of selfies %ld is smaller than threshold %ld. Keeping at least two candidates.",  (uint8_t *)v20,  0x16u);
      swift_slowDealloc(v20, -1LL, -1LL);
    }

    if (v15[2] >= 2uLL)
    {
      unint64_t v14 = v15[6];
      if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) != 0) {
        goto LABEL_16;
      }
      goto LABEL_48;
    }

    goto LABEL_46;
  }

  if (v2 <= 1)
  {
LABEL_34:
    swift_release(v15);
LABEL_36:
    uint64_t v34 = swift_bridgeObjectRetain(v8);
    int v35 = (os_log_s *)Logger.logObject.getter(v34);
    os_log_type_t v36 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = swift_slowAlloc(22LL, -1LL);
      *(_DWORD *)uint64_t v37 = 134218240;
      uint64_t v39 = *(void *)(v8 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40, v37 + 4, v37 + 12);
      swift_bridgeObjectRelease(v8);
      *(_WORD *)(v37 + 12) = 2048;
      uint64_t v39 = 0x3FC3333340000000LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, v40, v37 + 14, v37 + 22);
      _os_log_impl( &dword_0,  v35,  v36,  "Device owner: [Top-selfies] Found %ld candidates before the gap becomes higher than %f.",  (uint8_t *)v37,  0x16u);
      swift_slowDealloc(v37, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease(v8);
    }

    swift_beginAccess(&v41, &v39, 0LL, 0LL);
    return (void *)v41;
  }

  unint64_t v14 = 1LL;
  unint64_t v18 = v15[2];
  while (1)
  {
    if (v14 > v18) {
      goto LABEL_47;
    }
    if (v14 >= v18) {
      break;
    }
    uint64_t v23 = &v3[2 * v14];
    uint64_t v24 = *(v23 - 1);
    uint64_t v25 = v23[1];
    BOOL v26 = __OFSUB__(v24, v25);
    uint64_t v27 = v24 - v25;
    if (v26) {
      goto LABEL_50;
    }
    uint64_t v28 = &v15[2 * v14 + 7];
    while (v14 < v18)
    {
      uint64_t v3 = (void *)*(v28 - 3);
      unint64_t v30 = *(void *)(v8 + 16);
      unint64_t v29 = *(void *)(v8 + 24);
      if (v30 >= v29 >> 1) {
        uint64_t v8 = (uint64_t)sub_BF90((char *)(v29 > 1), v30 + 1, 1, (char *)v8);
      }
      *(void *)(v8 + 16) = v30 + 1;
      *(void *)(v8 + 8 * v30 + 32) = v3;
      if (v14 + 1 >= v2) {
        goto LABEL_35;
      }
      unint64_t v18 = v15[2];
      unint64_t v31 = v14;
      if (v14 >= v18) {
        goto LABEL_42;
      }
      ++v14;
      if (v31 + 1 >= v18) {
        goto LABEL_43;
      }
      uint64_t v32 = *(v28 - 2);
      uint64_t v33 = v32 - *v28;
      if (__OFSUB__(v32, *v28)) {
        goto LABEL_44;
      }
      v28 += 2;
      if ((float)((float)v33 / (float)v32) >= 0.15)
      {
LABEL_35:
        swift_release(v15);
        uint64_t v41 = v8;
        goto LABEL_36;
      }
    }

    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    uint64_t v8 = (uint64_t)sub_BF90(0LL, *(void *)(v8 + 16) + 1LL, 1, (char *)v8);
LABEL_16:
    unint64_t v22 = *(void *)(v8 + 16);
    unint64_t v21 = *(void *)(v8 + 24);
    if (v22 >= v21 >> 1) {
      uint64_t v8 = (uint64_t)sub_BF90((char *)(v21 > 1), v22 + 1, 1, (char *)v8);
    }
    *(void *)(v8 + 16) = v22 + 1;
    *(void *)(v8 + 8 * v22 + 32) = v14;
    uint64_t v41 = v8;
    if (v2 < 3) {
      goto LABEL_34;
    }
    unint64_t v18 = v15[2];
    unint64_t v14 = 2LL;
  }

  __break(1u);
LABEL_50:
  __break(1u);
  uint64_t result = (void *)swift_release(v39);
  __break(1u);
  return result;
}

uint64_t sub_A5D0(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a2;
  if (a1)
  {
    swift_bridgeObjectRetain(a1);
    uint64_t v6 = swift_bridgeObjectRetain(v4);
    uint64_t v7 = sub_C9BC(v6, a1);
    swift_bridgeObjectRelease(v4);
    uint64_t v4 = v7;
    if (v7[2]) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRelease(v4);
    return 0LL;
  }

  swift_bridgeObjectRetain(a2);
  if (!v4[2]) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v8 = swift_bridgeObjectRetain(v4);
  double v9 = COERCE_DOUBLE(sub_C2AC(v8));
  swift_bridgeObjectRelease(v4);
  double v31 = v9;
  sub_CB38((uint64_t *)&v31, sub_D270);
  swift_bridgeObjectRelease(v4);
  uint64_t v10 = *(uint64_t **)&v31;
  uint64_t v11 = swift_retain(*(void *)&v31);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    unint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)unint64_t v14 = 134217984;
    double v31 = *((double *)v10 + 2);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v14 + 4, v14 + 12);
    swift_release(v10);
    _os_log_impl(&dword_0, v12, v13, "Device owner: [Rear-facing] Found %ld entities with rear captures.", v14, 0xCu);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  else
  {
    swift_release(v10);
  }

  uint64_t v16 = v10[2];
  if (v16)
  {
    if (v16 == 1)
    {
      uint64_t v17 = v10[4];
      swift_release(v10);
      return v17;
    }

    double v23 = *((double *)v10 + 5);
    uint64_t v24 = v10[7];
    if (*(double *)&v24 == 0.0)
    {
      float v25 = 0.0;
    }

    else
    {
      if (__OFSUB__(v24, *(void *)&v23))
      {
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }

      float v25 = (float)(v24 - *(void *)&v23) / (float)v24;
    }

    BOOL v26 = (os_log_s *)Logger.logObject.getter(v15);
    os_log_type_t v27 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = swift_slowAlloc(32LL, -1LL);
      *(_DWORD *)uint64_t v28 = 134218496;
      double v31 = v25;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v28 + 4, v28 + 12);
      *(_WORD *)(v28 + 12) = 2048;
      double v31 = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v28 + 14, v28 + 22);
      *(_WORD *)(v28 + 22) = 2048;
      double v31 = *(double *)&v24;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v28 + 24, v28 + 32);
      _os_log_impl( &dword_0,  v26,  v27,  "Device owner: [Rear-facing] gap between bottom-1 and bottom-2 %f (%ld and %ld)",  (uint8_t *)v28,  0x20u);
      swift_slowDealloc(v28, -1LL, -1LL);
    }

    if (a3 >= 101 && v25 > 0.15)
    {
LABEL_25:
      if (v10[2])
      {
        uint64_t v17 = v10[4];
        uint64_t v29 = v10[5];
        swift_release(v10);
        if (v29 > 10) {
          return v17;
        }
        return 0LL;
      }

      __break(1u);
      goto LABEL_32;
    }

    goto LABEL_28;
  }

  uint64_t v18 = swift_retain(v10);
  os_log_type_t v19 = (void *)Logger.logObject.getter(v18);
  os_log_type_t v20 = static os_log_type_t.debug.getter();
  if (!os_log_type_enabled((os_log_t)v19, v20))
  {
    swift_release(v10);
LABEL_18:

    if (a3 > 100) {
      goto LABEL_25;
    }
LABEL_28:
    swift_release(v10);
    return 0LL;
  }

  unint64_t v21 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  *(_DWORD *)unint64_t v21 = 134217984;
  if (v10[2])
  {
    unint64_t v22 = v21;
    double v31 = *((double *)v10 + 5);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v31, &v32, v21 + 4, v21 + 12);
    swift_release(v10);
    _os_log_impl( &dword_0,  (os_log_t)v19,  v20,  "Device owner: [Rear-facing] only one candidate with rear-facing captures %ld",  v22,  0xCu);
    swift_slowDealloc(v22, -1LL, -1LL);
    goto LABEL_18;
  }

LABEL_33:
  __break(1u);
  uint64_t result = swift_release(*(void *)&v31);
  __break(1u);
  return result;
}

uint64_t sub_A9BC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0LL;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1LL;
  }
  if (v2 == 1) {
    return 0LL;
  }
  for (uint64_t i = 5LL; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1LL)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }

  __break(1u);
  return result;
}

void sub_AA20( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, int a7@<W6>, uint64_t a8@<X7>, uint64_t a9@<X8>, unsigned __int8 a10)
{
  uint64_t v11 = v10;
  uint64_t v209 = a5;
  v199 = a4;
  uint64_t v200 = a3;
  uint64_t v211 = a9;
  int v208 = a10;
  uint64_t v202 = type metadata accessor for VUGallery.Client(0LL);
  uint64_t v201 = *(void *)(v202 - 8);
  __chkstk_darwin(v202);
  v198 = (char *)&v193 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = sub_5460(&qword_18B28);
  uint64_t v19 = __chkstk_darwin(v18);
  v195 = (char *)&v193 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = __chkstk_darwin(v19);
  v205 = (char *)&v193 - v22;
  __chkstk_darwin(v21);
  v206 = (char *)&v193 - v23;
  uint64_t v24 = sub_5460(&qword_18B30);
  uint64_t v25 = __chkstk_darwin(v24);
  v196 = (char *)&v193 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = __chkstk_darwin(v25);
  v203 = (char *)&v193 - v28;
  __chkstk_darwin(v27);
  v204 = (char *)&v193 - v29;
  uint64_t v212 = type metadata accessor for VUGallery.RecognitionResult(0LL);
  uint64_t v210 = *(void *)(v212 - 8);
  uint64_t v30 = __chkstk_darwin(v212);
  v197 = (char *)&v193 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v32 = __chkstk_darwin(v30);
  v207 = (char *)&v193 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  os_log_type_t v36 = (char *)&v193 - v35;
  uint64_t v37 = v10 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger;
  uint64_t v38 = (os_log_s *)Logger.logObject.getter(v34);
  os_log_type_t v39 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v38, v39))
  {
    uint64_t v40 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    LODWORD(v213) = a7;
    char v41 = a6;
    uint64_t v42 = a8;
    __int16 v43 = v36;
    uint64_t v44 = a1;
    uint64_t v45 = a2;
    uint64_t v46 = v11;
    uint64_t v47 = v37;
    os_log_type_t v48 = v40;
    *(_WORD *)uint64_t v40 = 0;
    _os_log_impl(&dword_0, v38, v39, "Starting getInferredDeviceOwnerVersion1", v40, 2u);
    uint64_t v49 = v48;
    uint64_t v37 = v47;
    uint64_t v11 = v46;
    a2 = v45;
    a1 = v44;
    os_log_type_t v36 = v43;
    a8 = v42;
    a6 = v41;
    LOBYTE(a7) = (_BYTE)v213;
    swift_slowDealloc(v49, -1LL, -1LL);
  }

  uint64_t v50 = sub_A040(a2, a1);
  uint64_t v51 = v50;
  uint64_t v220 = (uint64_t)v50;
  if (v50[2])
  {
    v194 = (char *)a1;
    if ((a7 & 1) != 0) {
      int v52 = 256;
    }
    else {
      int v52 = 0;
    }
    unsigned int v53 = v52 & 0xFFFFFFFE | a6 & 1;
    uint64_t v54 = v209;
    swift_bridgeObjectRetain(v209);
    swift_retain(v11);
    uint64_t v55 = swift_bridgeObjectRetain(v51);
    uint64_t v56 = sub_E78C(v55, v54, v53);
    swift_bridgeObjectRelease(v51);
    swift_bridgeObjectRelease(v54);
    swift_release(v11);
    v213 = (void *)v56;
    uint64_t v57 = swift_bridgeObjectRetain(v56);
    os_log_type_t v58 = (os_log_s *)Logger.logObject.getter(v57);
    os_log_type_t v59 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v58, v59))
    {
      uint64_t v60 = (_DWORD *)swift_slowAlloc(22LL, -1LL);
      uint64_t v193 = v37;
      uint64_t v61 = v60;
      *uint64_t v60 = 134218240;
      uint64_t v62 = v36;
      uint64_t v63 = a8;
      uint64_t v64 = v60 + 1;
      swift_beginAccess(&v220, v214, 0LL, 0LL);
      uint64_t v218 = *(void *)(v220 + 16);
      uint64_t v65 = v64;
      a8 = v63;
      os_log_type_t v36 = v62;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v218, v219, v65, v61 + 3);
      *((_WORD *)v61 + 6) = 2048;
      uint64_t v66 = (uint64_t)v213;
      uint64_t v218 = v213[2];
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v218, v219, (char *)v61 + 14, (char *)v61 + 22);
      swift_bridgeObjectRelease(v66);
      _os_log_impl( &dword_0,  v58,  v59,  "Device owner: [Top-selfies] Before filtering out invalid: %ld entities, after filtering: %ld entities",  (uint8_t *)v61,  0x16u);
      swift_slowDealloc(v61, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease(v213);
    }

    if (v213[2])
    {
      uint64_t v209 = v11;
      swift_beginAccess(&v220, &v218, 1LL, 0LL);
      float v70 = 0.0;
LABEL_15:
      uint64_t v71 = v220;
      uint64_t v220 = (uint64_t)v213;
      uint64_t v72 = swift_bridgeObjectRelease(v71);
      char v73 = (os_log_s *)Logger.logObject.getter(v72);
      os_log_type_t v74 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v73, v74))
      {
        uint64_t v75 = swift_slowAlloc(32LL, -1LL);
        *(_DWORD *)uint64_t v75 = 134218496;
        swift_beginAccess(&v220, &v215, 0LL, 0LL);
        v213 = (void *)v220;
        uint64_t v217 = *(void *)(v220 + 16);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v217, &v218, v75 + 4, v75 + 12);
        *(_WORD *)(v75 + 12) = 2048;
        uint64_t v217 = 0x3FC3333340000000LL;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v217, &v218, v75 + 14, v75 + 22);
        *(_WORD *)(v75 + 22) = 2048;
        uint64_t v217 = 100LL;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v217, &v218, v75 + 24, v75 + 32);
        _os_log_impl( &dword_0,  v73,  v74,  "Device owner: [Top-selfies] After replacing invalid, found %ld candidates before the gap > %f or because less than %ld selfies.",  (uint8_t *)v75,  0x20u);
        swift_slowDealloc(v75, -1LL, -1LL);
      }

      unint64_t v76 = v213[2];
      uint64_t v77 = 9LL;
      if (v76 < 9) {
        uint64_t v77 = v213[2];
      }
      float v78 = (float)((float)((float)v77 / -10.0) + 1.0) - v70;
      if ((v208 & 1) == 0)
      {
        uint64_t v79 = sub_A9BC(a8, (uint64_t)v213);
        if ((v79 & 1) != 0)
        {
          uint64_t v80 = *(void *)(v209 + 16);
          uint64_t v81 = swift_retain(v80);
          uint64_t v82 = v198;
          uint64_t v83 = VUGallery.client.getter(v81);
          uint64_t v84 = VUGallery.Client.rawValue.getter(v83);
          (*(void (**)(char *, uint64_t))(v201 + 8))(v82, v202);
          uint64_t v85 = dispatch thunk of VUGallery.tags(label:for:)(a8, v84);
          swift_release(v80);
          uint64_t v86 = *(void *)(v85 + 16);
          uint64_t v87 = type metadata accessor for VUGallery.TagView(0LL);
          uint64_t v88 = *(void *)(v87 - 8);
          if (v86)
          {
            uint64_t v89 = v206;
            (*(void (**)(char *, unint64_t, uint64_t))(v88 + 16))( v206,  v85 + ((*(unsigned __int8 *)(v88 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80)),  v87);
            uint64_t v90 = 0LL;
          }

          else
          {
            uint64_t v90 = 1LL;
            uint64_t v89 = v206;
          }

          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v88 + 56))(v89, v90, 1LL, v87);
          swift_bridgeObjectRelease(v85);
          int v156 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v88 + 48))(v89, 1LL, v87);
          uint64_t v157 = (uint64_t)v89;
          v158 = v204;
          if (v156 == 1)
          {
            sub_113B8(v157, &qword_18B28);
            uint64_t v159 = type metadata accessor for UUID(0LL);
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v159 - 8) + 56LL))( v158,  1LL,  1LL,  v159);
          }

          else
          {
            VUGallery.TagView.tag.getter();
            (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v157, v87);
            uint64_t v160 = type metadata accessor for UUID(0LL);
            (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v160 - 8) + 56LL))( v158,  0LL,  1LL,  v160);
          }

          uint64_t v161 = VUGallery.RecognitionResult.init(_:_:_:)(a8, v158, v78);
          v162 = (os_log_s *)Logger.logObject.getter(v161);
          os_log_type_t v163 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v162, v163))
          {
            v164 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            *(_DWORD *)v164 = 134217984;
            uint64_t v217 = a8;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v217, &v218, v164 + 4, v164 + 12);
            _os_log_impl( &dword_0,  v162,  v163,  "Device owner: Contact picture matched a top-selfies person, returning %ld.",  v164,  0xCu);
            swift_slowDealloc(v164, -1LL, -1LL);
          }

          uint64_t v166 = v210;
          uint64_t v165 = v211;
          v167 = *(void (**)(uint64_t, char *, uint64_t))(v210 + 32);
          uint64_t v168 = v211;
          v169 = v36;
LABEL_90:
          uint64_t v192 = v212;
          v167(v168, v169, v212);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v166 + 56))(v165, 0LL, 1LL, v192);
          goto LABEL_91;
        }

        v129 = (os_log_s *)Logger.logObject.getter(v79);
        os_log_type_t v130 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v129, v130))
        {
          uint64_t v131 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
          *(_WORD *)uint64_t v131 = 0;
          uint64_t v132 = "Device owner: Contact picture did not match a top-selfies person, returning nil.";
LABEL_51:
          _os_log_impl(&dword_0, v129, v130, v132, v131, 2u);
          swift_slowDealloc(v131, -1LL, -1LL);
          goto LABEL_52;
        }

        goto LABEL_52;
      }

      if (v76 == 1)
      {
        uint64_t v120 = v213[4];
        uint64_t v121 = *(void *)(v209 + 16);
        swift_retain(v121);
        uint64_t v122 = dispatch thunk of VUGallery.tags(for:)(v120);
        swift_release(v121);
        uint64_t v123 = *(void *)(v122 + 16);
        uint64_t v124 = type metadata accessor for VUGallery.TagView(0LL);
        uint64_t v125 = *(void *)(v124 - 8);
        if (v123)
        {
          uint64_t v126 = (uint64_t)v205;
          (*(void (**)(char *, unint64_t, uint64_t))(v125 + 16))( v205,  v122 + ((*(unsigned __int8 *)(v125 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v125 + 80)),  v124);
          uint64_t v127 = 0LL;
          v128 = v207;
        }

        else
        {
          uint64_t v127 = 1LL;
          v128 = v207;
          uint64_t v126 = (uint64_t)v205;
        }

        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v125 + 56))(v126, v127, 1LL, v124);
        swift_bridgeObjectRelease(v122);
        int v170 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v125 + 48))(v126, 1LL, v124);
        v171 = v203;
        if (v170 == 1)
        {
          sub_113B8(v126, &qword_18B28);
          uint64_t v172 = type metadata accessor for UUID(0LL);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v172 - 8) + 56LL))( v171,  1LL,  1LL,  v172);
        }

        else
        {
          VUGallery.TagView.tag.getter();
          (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v126, v124);
          uint64_t v173 = type metadata accessor for UUID(0LL);
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v173 - 8) + 56LL))( v171,  0LL,  1LL,  v173);
        }

        uint64_t v174 = VUGallery.RecognitionResult.init(_:_:_:)(v120, v171, v78);
        v175 = (os_log_s *)Logger.logObject.getter(v174);
        os_log_type_t v176 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v175, v176))
        {
          v177 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)v177 = 134217984;
          uint64_t v217 = v120;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v217, &v218, v177 + 4, v177 + 12);
          _os_log_impl(&dword_0, v175, v176, "Device owner: only 1 top-selfie, returning %ld.", v177, 0xCu);
          swift_slowDealloc(v177, -1LL, -1LL);
        }

        uint64_t v166 = v210;
        uint64_t v165 = v211;
        v167 = *(void (**)(uint64_t, char *, uint64_t))(v210 + 32);
        uint64_t v168 = v211;
        v169 = v128;
        goto LABEL_90;
      }

      uint64_t v133 = (uint64_t)v213;
      uint64_t v134 = swift_bridgeObjectRetain(v213);
      uint64_t v135 = v209;
      uint64_t v136 = sub_A5D0(v134, v199, v200);
      char v138 = v137;
      swift_bridgeObjectRelease(v133);
      if ((v138 & 1) == 0)
      {
        uint64_t v139 = *(void *)(v135 + 16);
        swift_retain(v139);
        uint64_t v140 = dispatch thunk of VUGallery.tags(for:)(v136);
        swift_release(v139);
        uint64_t v141 = *(void *)(v140 + 16);
        uint64_t v142 = type metadata accessor for VUGallery.TagView(0LL);
        uint64_t v143 = *(void *)(v142 - 8);
        if (v141)
        {
          uint64_t v144 = (uint64_t)v195;
          (*(void (**)(char *, unint64_t, uint64_t))(v143 + 16))( v195,  v140 + ((*(unsigned __int8 *)(v143 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v143 + 80)),  v142);
          uint64_t v145 = 0LL;
        }

        else
        {
          uint64_t v145 = 1LL;
          uint64_t v144 = (uint64_t)v195;
        }

        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v143 + 56))(v144, v145, 1LL, v142);
        swift_bridgeObjectRelease(v140);
        int v184 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v143 + 48))(v144, 1LL, v142);
        v185 = v196;
        if (v184 == 1)
        {
          sub_113B8(v144, &qword_18B28);
          uint64_t v186 = type metadata accessor for UUID(0LL);
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v186 - 8) + 56LL))( v185,  1LL,  1LL,  v186);
        }

        else
        {
          VUGallery.TagView.tag.getter();
          (*(void (**)(uint64_t, uint64_t))(v143 + 8))(v144, v142);
          uint64_t v187 = type metadata accessor for UUID(0LL);
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v187 - 8) + 56LL))( v185,  0LL,  1LL,  v187);
        }

        uint64_t v188 = VUGallery.RecognitionResult.init(_:_:_:)(v136, v185, v78);
        v189 = (os_log_s *)Logger.logObject.getter(v188);
        os_log_type_t v190 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v189, v190))
        {
          v191 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)v191 = 134217984;
          uint64_t v217 = v136;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v217, &v218, v191 + 4, v191 + 12);
          _os_log_impl(&dword_0, v189, v190, "Device owner: returning %ld.", v191, 0xCu);
          swift_slowDealloc(v191, -1LL, -1LL);
        }

        uint64_t v166 = v210;
        uint64_t v165 = v211;
        v167 = *(void (**)(uint64_t, char *, uint64_t))(v210 + 32);
        uint64_t v168 = v211;
        v169 = v197;
        goto LABEL_90;
      }

      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v210 + 56))(v211, 1LL, 1LL, v212);
      uint64_t v155 = (uint64_t)v213;
LABEL_92:
      swift_bridgeObjectRelease(v155);
      return;
    }

    uint64_t v91 = swift_bridgeObjectRelease(v213);
    uint64_t v92 = (os_log_s *)Logger.logObject.getter(v91);
    os_log_type_t v93 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v92, v93))
    {
      uint64_t v94 = v11;
      uint64_t v95 = a8;
      uint64_t v96 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v96 = 0;
      _os_log_impl( &dword_0,  v92,  v93,  "Device owner: [Top-selfies] After removing invalid: 0 entities --> Run top k selfies again",  v96,  2u);
      uint64_t v97 = v96;
      a8 = v95;
      uint64_t v11 = v94;
      swift_slowDealloc(v97, -1LL, -1LL);
    }

    uint64_t v98 = v209;
    swift_bridgeObjectRetain(v209);
    swift_retain(v11);
    uint64_t v99 = sub_ED90(a2, (uint64_t)v194, v11, v98, v53, v11);
    swift_bridgeObjectRelease(v98);
    swift_release(v11);
    v213 = v99;
    if (!v99[2])
    {
      uint64_t v146 = swift_bridgeObjectRelease(v213);
      v129 = (os_log_s *)Logger.logObject.getter(v146);
      os_log_type_t v130 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v129, v130))
      {
        uint64_t v131 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
        *(_WORD *)uint64_t v131 = 0;
        uint64_t v132 = "Device owner: [Top-selfies] After replacing invalid device owners, no entity with selfies left, returning nil.";
        goto LABEL_51;
      }

LABEL_52:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v210 + 56))(v211, 1LL, 1LL, v212);
LABEL_91:
      uint64_t v155 = v220;
      goto LABEL_92;
    }

    if (*(void *)(a2 + 16))
    {
      uint64_t v209 = v11;
      uint64_t v100 = a8;
      unint64_t v101 = sub_C09C(v213[4]);
      if ((v102 & 1) != 0)
      {
        uint64_t v103 = *(void *)(a2 + 56);
        uint64_t v104 = *(void *)(v103 + 8 * v101);
        swift_beginAccess(&v220, &v218, 1LL, 0LL);
        uint64_t v105 = v220;
        if (*(void *)(v220 + 16))
        {
          unint64_t v106 = sub_C09C(*(void *)(v220 + 32));
          if ((v107 & 1) != 0)
          {
            float v108 = (float)*(uint64_t *)(v103 + 8 * v106) * 0.5;
            if ((~LODWORD(v108) & 0x7F800000) != 0)
            {
              if (v108 > -9.2234e18)
              {
                if (v108 < 9.2234e18)
                {
                  uint64_t v109 = (uint64_t)v108;
                  uint64_t v110 = swift_bridgeObjectRetain_n(a2, 2LL);
                  if (v104 <= v109)
                  {
                    uint64_t v147 = (os_log_s *)Logger.logObject.getter(v110);
                    os_log_type_t v148 = static os_log_type_t.debug.getter();
                    if (os_log_type_enabled(v147, v148))
                    {
                      uint64_t v149 = swift_slowAlloc(32LL, -1LL);
                      *(_DWORD *)uint64_t v149 = 134218496;
                      uint64_t v215 = 0x3FE0000000000000LL;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v215, v216, v149 + 4, v149 + 12);
                      *(_WORD *)(v149 + 12) = 2048;
                      uint64_t v105 = v220;
                      if (!*(void *)(v220 + 16))
                      {
LABEL_109:
                        __break(1u);
                        goto LABEL_110;
                      }

                      if (!*(void *)(a2 + 16))
                      {
LABEL_110:
                        __break(1u);
                        goto LABEL_111;
                      }

                      unint64_t v150 = sub_C09C(*(void *)(v220 + 32));
                      if ((v151 & 1) == 0)
                      {
LABEL_111:
                        __break(1u);
                        goto LABEL_112;
                      }

                      uint64_t v215 = *(void *)(*(void *)(a2 + 56) + 8 * v150);
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v215, v216, v149 + 14, v149 + 22);
                      *(_WORD *)(v149 + 22) = 2048;
                      if (!*(void *)(a2 + 16))
                      {
LABEL_112:
                        __break(1u);
                        goto LABEL_113;
                      }

                      unint64_t v152 = sub_C09C(v213[4]);
                      if ((v153 & 1) == 0)
                      {
LABEL_113:
                        __break(1u);
                        return;
                      }

                      uint64_t v154 = *(void *)(*(void *)(a2 + 56) + 8 * v152);
                      swift_bridgeObjectRelease(a2);
                      uint64_t v215 = v154;
                      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v215, v216, v149 + 24, v149 + 32);
                      swift_bridgeObjectRelease(v213);
                      swift_bridgeObjectRelease(a2);
                      _os_log_impl( &dword_0,  v147,  v148,  "Device owner: [Top-selfies] After replacing invalid device owners, the top selfie person <= %f of %ld (%ld)",  (uint8_t *)v149,  0x20u);
                      swift_slowDealloc(v149, -1LL, -1LL);
                    }

                    else
                    {
                      swift_bridgeObjectRelease(v213);
                      swift_bridgeObjectRelease_n(a2, 2LL);
                    }

                    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v210 + 56))(v211, 1LL, 1LL, v212);
                    uint64_t v155 = v105;
                    goto LABEL_92;
                  }

                  uint64_t v111 = swift_bridgeObjectRetain(v213);
                  uint64_t v112 = (os_log_s *)Logger.logObject.getter(v111);
                  os_log_type_t v113 = static os_log_type_t.debug.getter();
                  if (os_log_type_enabled(v112, v113))
                  {
                    v194 = v36;
                    uint64_t v114 = swift_slowAlloc(32LL, -1LL);
                    *(_DWORD *)uint64_t v114 = 134218496;
                    uint64_t v215 = 0x3FE0000000000000LL;
                    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v215, v216, v114 + 4, v114 + 12);
                    *(_WORD *)(v114 + 12) = 2048;
                    uint64_t v105 = v220;
                    if (!*(void *)(v220 + 16))
                    {
LABEL_104:
                      __break(1u);
                      goto LABEL_105;
                    }

                    if (!*(void *)(a2 + 16))
                    {
LABEL_105:
                      __break(1u);
                      goto LABEL_106;
                    }

                    unint64_t v115 = sub_C09C(*(void *)(v220 + 32));
                    if ((v116 & 1) == 0)
                    {
LABEL_106:
                      __break(1u);
                      goto LABEL_107;
                    }

                    uint64_t v215 = *(void *)(*(void *)(a2 + 56) + 8 * v115);
                    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v215, v216, v114 + 14, v114 + 22);
                    *(_WORD *)(v114 + 22) = 2048;
                    if (!*(void *)(a2 + 16))
                    {
LABEL_107:
                      __break(1u);
                      goto LABEL_108;
                    }

                    unint64_t v117 = sub_C09C(v213[4]);
                    if ((v118 & 1) == 0)
                    {
LABEL_108:
                      __break(1u);
                      goto LABEL_109;
                    }

                    uint64_t v119 = *(void *)(*(void *)(a2 + 56) + 8 * v117);
                    swift_bridgeObjectRelease(a2);
                    uint64_t v215 = v119;
                    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v215, v216, v114 + 24, v114 + 32);
                    swift_bridgeObjectRelease(v213);
                    swift_bridgeObjectRelease(a2);
                    _os_log_impl( &dword_0,  v112,  v113,  "Device owner: [Top-selfies] After replacing invalid device owners, keeping the new top selfies per sons with %f of %ld (%ld selfies)",  (uint8_t *)v114,  0x20u);
                    swift_slowDealloc(v114, -1LL, -1LL);
                    os_log_type_t v36 = v194;
                  }

                  else
                  {
                    swift_bridgeObjectRelease(v213);
                    swift_bridgeObjectRelease_n(a2, 2LL);
                  }

                  if (*(void *)(a2 + 16))
                  {
                    unint64_t v178 = sub_C09C(v213[4]);
                    if ((v179 & 1) != 0)
                    {
                      if (*(void *)(v105 + 16))
                      {
                        uint64_t v180 = *(void *)(a2 + 56);
                        uint64_t v181 = *(void *)(v180 + 8 * v178);
                        unint64_t v182 = sub_C09C(*(void *)(v105 + 32));
                        if ((v183 & 1) != 0)
                        {
                          float v70 = (float)(1.0 - (float)((float)v181 / (float)*(uint64_t *)(v180 + 8 * v182))) * 0.1;
                          a8 = v100;
                          goto LABEL_15;
                        }

                        goto LABEL_103;
                      }

LABEL_102:
                      __break(1u);
LABEL_103:
                      __break(1u);
                      goto LABEL_104;
                    }

LABEL_101:
                    __break(1u);
                    goto LABEL_102;
                  }

LABEL_100:
                  __break(1u);
                  goto LABEL_101;
                }

LABEL_99:
                __break(1u);
                goto LABEL_100;
              }

LABEL_98:
              __break(1u);
              goto LABEL_99;
            }

LABEL_97:
            __break(1u);
            goto LABEL_98;
          }

LABEL_96:
          __break(1u);
          goto LABEL_97;
        }

LABEL_95:
        __break(1u);
        goto LABEL_96;
      }
    }

    else
    {
      __break(1u);
    }

    __break(1u);
    goto LABEL_95;
  }

  uint64_t v67 = (os_log_s *)Logger.logObject.getter(v50);
  os_log_type_t v68 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v67, v68))
  {
    uint64_t v69 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v69 = 0;
    _os_log_impl(&dword_0, v67, v68, "Device owner: [Top-selfies] No entity with selfie, returning nil.", v69, 2u);
    swift_slowDealloc(v69, -1LL, -1LL);
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v210 + 56))(v211, 1LL, 1LL, v212);
  swift_bridgeObjectRelease(v51);
}

uint64_t sub_BDF4()
{
  id v1 = (char *)v0 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger;
  uint64_t v2 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8LL))(v1, v2);

  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48LL), *(unsigned __int16 *)(*v0 + 52LL));
}

uint64_t sub_BE5C()
{
  return type metadata accessor for VUDeviceOwnerPlugin(0LL);
}

uint64_t type metadata accessor for VUDeviceOwnerPlugin(uint64_t a1)
{
  uint64_t result = qword_18990;
  if (!qword_18990) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for VUDeviceOwnerPlugin);
  }
  return result;
}

uint64_t sub_BEA0(uint64_t a1)
{
  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  uint64_t result = type metadata accessor for Logger(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    void v4[2] = "\b";
    uint64_t result = swift_updateClassMetadata2(a1, 256LL, 3LL, v4, a1 + 80);
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_BF24@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for VUDeviceOwnerPlugin(0LL);
  uint64_t v5 = swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  uint64_t result = sub_54A4(a1);
  *a2 = v5;
  return result;
}

uint64_t sub_BF70()
{
  return sub_F4F4();
}

char *sub_BF90(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }

  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if (v7 + 0x4000000000000000LL >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      uint64_t v10 = sub_5460(&qword_18B38);
      uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 25;
      }
      *((void *)v11 + 2) = v8;
      *((void *)v11 + 3) = 2 * (v13 >> 3);
      unint64_t v14 = v11 + 32;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[8 * v8 + 32]) {
          memmove(v14, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0LL;
        goto LABEL_24;
      }
    }

    sub_E6A4(0LL, v8, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

unint64_t sub_C09C(uint64_t a1)
{
  uint64_t v3 = static Hasher._hash(seed:_:)(*(void *)(v1 + 40), a1);
  return sub_C130(a1, v3);
}

unint64_t sub_C0CC(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_C1CC(a1, a2, v5);
}

unint64_t sub_C130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }

  return result;
}

unint64_t sub_C1CC(uint64_t a1, uint64_t a2, uint64_t a3)
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

void *sub_C2AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_5460(&qword_18B40);
  uint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  void v4[2] = v1;
  void v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_E4F4(&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_10F68(v8);
  if (v7 != (void *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }

  return v4;
}

uint64_t sub_C390(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_C3C8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_C3AC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_C704(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_C3C8(char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }

  uint64_t v10 = sub_5460(&qword_18B70);
  uint64_t v11 = *(void *)(type metadata accessor for VUGallery.TagView(0LL) - 8);
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
  uint64_t v18 = type metadata accessor for VUGallery.TagView(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  unint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v15 + v20;
  uint64_t v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(void *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }

    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }

    a4[2] = 0LL;
    goto LABEL_32;
  }

  uint64_t v23 = *(void *)(v19 + 72) * v8;
  uint64_t v24 = &v21[v23];
  unint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

LABEL_36:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  __break(1u);
  return result;
}

                  __break(1u);
                  goto LABEL_37;
                }
              }
            }

            size_t v16 = v21;
          }

uint64_t sub_C5A8(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5460(&qword_18B40);
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
    memcpy(v14, v15, 16 * v8);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_C704(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5460(&qword_18B38);
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

uint64_t sub_C860(uint64_t a1, uint64_t (*a2)(char *, unint64_t, uint64_t))
{
  uint64_t v4 = v2;
  char v6 = *(_BYTE *)(a1 + 32);
  unsigned int v7 = v6 & 0x3F;
  unint64_t v8 = (1LL << v6) + 63;
  unint64_t v9 = v8 >> 6;
  size_t v10 = 8 * (v8 >> 6);
  if (v7 <= 0xD || (swift_stdlib_isStackAllocationSafe(8 * (v8 >> 6), 8LL) & 1) != 0)
  {
    __chkstk_darwin();
    bzero((char *)&v14 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0LL), v10);
    uint64_t v11 = a2((char *)&v14 - ((v10 + 15) & 0x3FFFFFFFFFFFFFF0LL), v9, a1);
    if (v2) {
      swift_willThrow(v11);
    }
    else {
      return v11;
    }
  }

  else
  {
    int64_t v12 = (void *)swift_slowAlloc(v10, -1LL);
    bzero(v12, v10);
    uint64_t v4 = a2((char *)v12, v9, a1);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  return v4;
}

unint64_t *sub_C9BC(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v4 = (unint64_t *)isStackAllocationSafe;
  char v5 = *(_BYTE *)(isStackAllocationSafe + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (1LL << v5) + 63;
  uint64_t v8 = v7 >> 6;
  size_t v9 = 8 * (v7 >> 6);
  if (v6 <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v7 >> 6), 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0LL), v9);
    size_t v10 = sub_F358((unint64_t *)((char *)&v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0LL)), v8, (uint64_t)v4, a2);
    if (v2) {
      swift_willThrow(v10);
    }
    else {
      uint64_t v4 = v10;
    }
    swift_bridgeObjectRelease(a2);
  }

  else
  {
    uint64_t v11 = (void *)swift_slowAlloc(v9, -1LL);
    bzero(v11, v9);
    uint64_t v4 = sub_F358((unint64_t *)v11, v8, (uint64_t)v4, a2);
    swift_slowDealloc(v11, -1LL, -1LL);
    swift_bridgeObjectRelease(a2);
  }

  return v4;
}

uint64_t sub_CB38(uint64_t *a1, uint64_t (*a2)(void *))
{
  uint64_t v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v4 = sub_E690(v4);
  }
  uint64_t v5 = *(void *)(v4 + 16);
  v7[0] = v4 + 32;
  v7[1] = v5;
  uint64_t result = a2(v7);
  *a1 = v4;
  return result;
}

Swift::Int sub_CBA4(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      uint64_t v86 = 0LL;
      uint64_t v87 = *a1;
      uint64_t v88 = 1LL;
      while (1)
      {
        uint64_t v89 = *(void *)(v87 + 16 * v88 + 8);
        uint64_t v90 = v86;
        do
        {
          uint64_t v91 = v87 + v90;
          if (*(void *)(v87 + v90 + 8) >= v89) {
            break;
          }
          if (!v87) {
            goto LABEL_142;
          }
          uint64_t v92 = *(void *)(v91 + 16);
          *(_OWORD *)(v91 + 16) = *(_OWORD *)v91;
          *(void *)uint64_t v91 = v92;
          *(void *)(v91 + 8) = v89;
          v90 -= 16LL;
        }

        while (v90 != -16);
        ++v88;
        v86 += 16LL;
        if (v88 == v3) {
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

  Swift::Int v6 = result;
  uint64_t v100 = a1;
  if (v3 < 2)
  {
    size_t v10 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v14 = _swiftEmptyArrayStorage[2];
      uint64_t v13 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_104;
    }

    char v102 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t v8 = sub_5460(&qword_18B48);
    uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)(v7, v8);
    *(void *)(v9 + 16) = v7;
    char v102 = (void *)v9;
    __dst = (char *)(v9 + 32);
  }

  Swift::Int v11 = 0LL;
  uint64_t v12 = *a1;
  uint64_t v101 = *a1 + 40;
  uint64_t v99 = *a1 - 16;
  uint64_t v13 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v103 = v6;
  Swift::Int v104 = v3;
  uint64_t v105 = v12;
  while (1)
  {
    Swift::Int v15 = v11++;
    if (v11 < v3)
    {
      uint64_t v16 = *(void *)(v12 + 16 * v11 + 8);
      uint64_t v17 = *(void *)(v12 + 16 * v15 + 8);
      Swift::Int v11 = v15 + 2;
      if (v15 + 2 < v3)
      {
        uint64_t v18 = (uint64_t *)(v101 + 16 * v15);
        uint64_t v19 = v16;
        while (1)
        {
          uint64_t v21 = *v18;
          v18 += 2;
          uint64_t v20 = v21;
          if (v17 < v16 == v19 >= v21) {
            break;
          }
          ++v11;
          uint64_t v19 = v20;
          if (v3 == v11)
          {
            Swift::Int v11 = v3;
            break;
          }
        }
      }

      if (v17 < v16)
      {
        if (v11 < v15) {
          goto LABEL_139;
        }
        if (v15 < v11)
        {
          uint64_t v22 = (__int128 *)(v99 + 16 * v11);
          Swift::Int v23 = v11;
          Swift::Int v24 = v15;
          unint64_t v25 = (__int128 *)(v12 + 16 * v15);
          do
          {
            if (v24 != --v23)
            {
              if (!v12) {
                goto LABEL_145;
              }
              __int128 v26 = *v25;
              *unint64_t v25 = *v22;
              *uint64_t v22 = v26;
            }

            ++v24;
            --v22;
            ++v25;
          }

          while (v24 < v23);
        }
      }
    }

    if (v11 < v3)
    {
      if (__OFSUB__(v11, v15)) {
        goto LABEL_137;
      }
      if (v11 - v15 < v6)
      {
        Swift::Int v27 = v15 + v6;
        if (__OFADD__(v15, v6)) {
          goto LABEL_140;
        }
        if (v27 >= v3) {
          Swift::Int v27 = v3;
        }
        if (v27 < v15) {
          goto LABEL_141;
        }
        if (v11 != v27)
        {
          uint64_t v28 = (void *)(v12 + 16 * v11);
          do
          {
            uint64_t v29 = *(void *)(v12 + 16 * v11 + 8);
            Swift::Int v30 = v15;
            uint64_t v31 = v28;
            do
            {
              if (*(v31 - 1) >= v29) {
                break;
              }
              if (!v12) {
                goto LABEL_143;
              }
              uint64_t v32 = *v31;
              *(_OWORD *)uint64_t v31 = *((_OWORD *)v31 - 1);
              *(v31 - 1) = v29;
              *(v31 - 2) = v32;
              v31 -= 2;
              ++v30;
            }

            while (v11 != v30);
            ++v11;
            v28 += 2;
          }

          while (v11 != v27);
          Swift::Int v11 = v27;
        }
      }
    }

    if (v11 < v15)
    {
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v13) & 1) == 0) {
      uint64_t v13 = sub_DE4C(0LL, *((void *)v13 + 2) + 1LL, 1, v13);
    }
    unint64_t v34 = *((void *)v13 + 2);
    unint64_t v33 = *((void *)v13 + 3);
    unint64_t v14 = v34 + 1;
    uint64_t v12 = v105;
    if (v34 >= v33 >> 1)
    {
      uint64_t v83 = sub_DE4C((char *)(v33 > 1), v34 + 1, 1, v13);
      uint64_t v12 = v105;
      uint64_t v13 = v83;
    }

    *((void *)v13 + 2) = v14;
    uint64_t v35 = v13 + 32;
    os_log_type_t v36 = &v13[16 * v34 + 32];
    *(void *)os_log_type_t v36 = v15;
    *((void *)v36 + 1) = v11;
    if (v34) {
      break;
    }
    unint64_t v14 = 1LL;
LABEL_15:
    Swift::Int v6 = v103;
    Swift::Int v3 = v104;
    if (v11 >= v104)
    {
      size_t v10 = v102;
LABEL_104:
      uint64_t v85 = v13;
      char v102 = v10;
      if (v14 < 2) {
        goto LABEL_95;
      }
      uint64_t v93 = *v100;
      while (1)
      {
        unint64_t v94 = v14 - 2;
        if (v14 < 2) {
          break;
        }
        if (!v93) {
          goto LABEL_146;
        }
        uint64_t v84 = v85;
        uint64_t v95 = *(void *)&v85[16 * v94 + 32];
        uint64_t v96 = *(void *)&v85[16 * v14 + 24];
        sub_D93C((char *)(v93 + 16 * v95), (char *)(v93 + 16LL * *(void *)&v85[16 * v14 + 16]), v93 + 16 * v96, __dst);
        if (v1) {
          goto LABEL_94;
        }
        if (v96 < v95) {
          goto LABEL_134;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v84) & 1) == 0) {
          uint64_t v84 = sub_DFEC((uint64_t)v84);
        }
        if (v94 >= *((void *)v84 + 2)) {
          goto LABEL_135;
        }
        uint64_t v97 = &v84[16 * v94 + 32];
        *(void *)uint64_t v97 = v95;
        *((void *)v97 + 1) = v96;
        unint64_t v98 = *((void *)v84 + 2);
        if (v14 > v98) {
          goto LABEL_136;
        }
        memmove(&v84[16 * v14 + 16], &v84[16 * v14 + 32], 16 * (v98 - v14));
        uint64_t v85 = v84;
        *((void *)v84 + 2) = v98 - 1;
        unint64_t v14 = v98 - 1;
        if (v98 <= 2) {
          goto LABEL_95;
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
    unint64_t v37 = v14 - 1;
    if (v14 >= 4)
    {
      uint64_t v42 = &v35[16 * v14];
      uint64_t v43 = *((void *)v42 - 8);
      uint64_t v44 = *((void *)v42 - 7);
      BOOL v48 = __OFSUB__(v44, v43);
      uint64_t v45 = v44 - v43;
      if (v48) {
        goto LABEL_121;
      }
      uint64_t v47 = *((void *)v42 - 6);
      uint64_t v46 = *((void *)v42 - 5);
      BOOL v48 = __OFSUB__(v46, v47);
      uint64_t v40 = v46 - v47;
      char v41 = v48;
      if (v48) {
        goto LABEL_122;
      }
      unint64_t v49 = v14 - 2;
      uint64_t v50 = &v35[16 * v14 - 32];
      uint64_t v52 = *(void *)v50;
      uint64_t v51 = *((void *)v50 + 1);
      BOOL v48 = __OFSUB__(v51, v52);
      uint64_t v53 = v51 - v52;
      if (v48) {
        goto LABEL_124;
      }
      BOOL v48 = __OFADD__(v40, v53);
      uint64_t v54 = v40 + v53;
      if (v48) {
        goto LABEL_127;
      }
      if (v54 >= v45)
      {
        uint64_t v72 = &v35[16 * v37];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v48 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v48) {
          goto LABEL_131;
        }
        BOOL v65 = v40 < v75;
        goto LABEL_83;
      }
    }

    else
    {
      if (v14 != 3)
      {
        uint64_t v66 = *((void *)v13 + 4);
        uint64_t v67 = *((void *)v13 + 5);
        BOOL v48 = __OFSUB__(v67, v66);
        uint64_t v59 = v67 - v66;
        char v60 = v48;
        goto LABEL_77;
      }

      uint64_t v39 = *((void *)v13 + 4);
      uint64_t v38 = *((void *)v13 + 5);
      BOOL v48 = __OFSUB__(v38, v39);
      uint64_t v40 = v38 - v39;
      char v41 = v48;
    }

    if ((v41 & 1) != 0) {
      goto LABEL_123;
    }
    unint64_t v49 = v14 - 2;
    uint64_t v55 = &v35[16 * v14 - 32];
    uint64_t v57 = *(void *)v55;
    uint64_t v56 = *((void *)v55 + 1);
    BOOL v58 = __OFSUB__(v56, v57);
    uint64_t v59 = v56 - v57;
    char v60 = v58;
    if (v58) {
      goto LABEL_126;
    }
    uint64_t v61 = &v35[16 * v37];
    uint64_t v63 = *(void *)v61;
    uint64_t v62 = *((void *)v61 + 1);
    BOOL v48 = __OFSUB__(v62, v63);
    uint64_t v64 = v62 - v63;
    if (v48) {
      goto LABEL_129;
    }
    if (__OFADD__(v59, v64)) {
      goto LABEL_130;
    }
    if (v59 + v64 >= v40)
    {
      BOOL v65 = v40 < v64;
LABEL_83:
      if (v65) {
        unint64_t v37 = v49;
      }
      goto LABEL_85;
    }

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
    unint64_t v37 = v14 - 1;
    if (v14 >= 4)
    {
      uint64_t v42 = &v35[16 * v14];
      uint64_t v43 = *((void *)v42 - 8);
      uint64_t v44 = *((void *)v42 - 7);
      BOOL v48 = __OFSUB__(v44, v43);
      uint64_t v45 = v44 - v43;
      if (v48) {
        goto LABEL_121;
      }
      uint64_t v47 = *((void *)v42 - 6);
      uint64_t v46 = *((void *)v42 - 5);
      BOOL v48 = __OFSUB__(v46, v47);
      uint64_t v40 = v46 - v47;
      char v41 = v48;
      if (v48) {
        goto LABEL_122;
      }
      unint64_t v49 = v14 - 2;
      uint64_t v50 = &v35[16 * v14 - 32];
      uint64_t v52 = *(void *)v50;
      uint64_t v51 = *((void *)v50 + 1);
      BOOL v48 = __OFSUB__(v51, v52);
      uint64_t v53 = v51 - v52;
      if (v48) {
        goto LABEL_124;
      }
      BOOL v48 = __OFADD__(v40, v53);
      uint64_t v54 = v40 + v53;
      if (v48) {
        goto LABEL_127;
      }
      if (v54 >= v45)
      {
        uint64_t v72 = &v35[16 * v37];
        uint64_t v74 = *(void *)v72;
        uint64_t v73 = *((void *)v72 + 1);
        BOOL v48 = __OFSUB__(v73, v74);
        uint64_t v75 = v73 - v74;
        if (v48) {
          goto LABEL_131;
        }
        BOOL v65 = v40 < v75;
        goto LABEL_83;
      }
    }

    else
    {
      if (v14 != 3)
      {
        uint64_t v66 = *((void *)v13 + 4);
        uint64_t v67 = *((void *)v13 + 5);
        BOOL v48 = __OFSUB__(v67, v66);
        uint64_t v59 = v67 - v66;
        char v60 = v48;
        goto LABEL_77;
      }

      uint64_t v39 = *((void *)v13 + 4);
      uint64_t v38 = *((void *)v13 + 5);
      BOOL v48 = __OFSUB__(v38, v39);
      uint64_t v40 = v38 - v39;
      char v41 = v48;
    }

    if ((v41 & 1) != 0) {
      goto LABEL_123;
    }
    unint64_t v49 = v14 - 2;
    uint64_t v55 = &v35[16 * v14 - 32];
    uint64_t v57 = *(void *)v55;
    uint64_t v56 = *((void *)v55 + 1);
    BOOL v58 = __OFSUB__(v56, v57);
    uint64_t v59 = v56 - v57;
    char v60 = v58;
    if (v58) {
      goto LABEL_126;
    }
    uint64_t v61 = &v35[16 * v37];
    uint64_t v63 = *(void *)v61;
    uint64_t v62 = *((void *)v61 + 1);
    BOOL v48 = __OFSUB__(v62, v63);
    uint64_t v64 = v62 - v63;
    if (v48) {
      goto LABEL_129;
    }
    if (__OFADD__(v59, v64)) {
      goto LABEL_130;
    }
    if (v59 + v64 >= v40)
    {
      BOOL v65 = v40 < v64;
LABEL_83:
      if (v65) {
        unint64_t v37 = v49;
      }
      goto LABEL_85;
    }

LABEL_77:
    if ((v60 & 1) != 0) {
      goto LABEL_125;
    }
    os_log_type_t v68 = &v35[16 * v37];
    uint64_t v70 = *(void *)v68;
    uint64_t v69 = *((void *)v68 + 1);
    BOOL v48 = __OFSUB__(v69, v70);
    uint64_t v71 = v69 - v70;
    if (v48) {
      goto LABEL_128;
    }
    if (v71 < v59) {
      goto LABEL_15;
    }
LABEL_85:
    unint64_t v76 = v37 - 1;
    if (v37 - 1 >= v14)
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

    if (!v12) {
      goto LABEL_144;
    }
    uint64_t v77 = v13;
    float v78 = &v35[16 * v76];
    uint64_t v79 = *(void *)v78;
    uint64_t v80 = &v35[16 * v37];
    uint64_t v81 = *((void *)v80 + 1);
    sub_D93C((char *)(v12 + 16LL * *(void *)v78), (char *)(v12 + 16LL * *(void *)v80), v12 + 16 * v81, __dst);
    if (v1) {
      break;
    }
    if (v81 < v79) {
      goto LABEL_118;
    }
    if (v37 > *((void *)v77 + 2)) {
      goto LABEL_119;
    }
    *(void *)float v78 = v79;
    *(void *)&v35[16 * v76 + 8] = v81;
    unint64_t v82 = *((void *)v77 + 2);
    if (v37 >= v82) {
      goto LABEL_120;
    }
    uint64_t v13 = v77;
    unint64_t v14 = v82 - 1;
    memmove(&v35[16 * v37], v80 + 16, 16 * (v82 - 1 - v37));
    *((void *)v77 + 2) = v82 - 1;
    uint64_t v12 = v105;
    if (v82 <= 2) {
      goto LABEL_15;
    }
  }

  uint64_t v84 = v77;
LABEL_94:
  uint64_t v85 = v84;
LABEL_95:
  swift_bridgeObjectRelease(v85);
  v102[2] = 0LL;
  return swift_bridgeObjectRelease(v102);
}

    if ((v60 & 1) != 0) {
      goto LABEL_125;
    }
    os_log_type_t v68 = &v35[16 * v37];
    uint64_t v70 = *(void *)v68;
    uint64_t v69 = *((void *)v68 + 1);
    BOOL v48 = __OFSUB__(v69, v70);
    uint64_t v71 = v69 - v70;
    if (v48) {
      goto LABEL_128;
    }
    if (v71 < v59) {
      goto LABEL_15;
    }
LABEL_85:
    unint64_t v76 = v37 - 1;
    if (v37 - 1 >= v14)
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

    if (!v12) {
      goto LABEL_144;
    }
    uint64_t v77 = v13;
    float v78 = &v35[16 * v76];
    uint64_t v79 = *(void *)v78;
    uint64_t v80 = &v35[16 * v37];
    uint64_t v81 = *((void *)v80 + 1);
    sub_DBC4((char *)(v12 + 16LL * *(void *)v78), (char *)(v12 + 16LL * *(void *)v80), v12 + 16 * v81, __dst);
    if (v1) {
      break;
    }
    if (v81 < v79) {
      goto LABEL_118;
    }
    if (v37 > *((void *)v77 + 2)) {
      goto LABEL_119;
    }
    *(void *)float v78 = v79;
    *(void *)&v35[16 * v76 + 8] = v81;
    unint64_t v82 = *((void *)v77 + 2);
    if (v37 >= v82) {
      goto LABEL_120;
    }
    uint64_t v13 = v77;
    unint64_t v14 = v82 - 1;
    memmove(&v35[16 * v37], v80 + 16, 16 * (v82 - 1 - v37));
    *((void *)v77 + 2) = v82 - 1;
    uint64_t v12 = v105;
    if (v82 <= 2) {
      goto LABEL_15;
    }
  }

  uint64_t v84 = v77;
LABEL_94:
  uint64_t v85 = v84;
LABEL_95:
  swift_bridgeObjectRelease(v85);
  v102[2] = 0LL;
  return swift_bridgeObjectRelease(v102);
}

Swift::Int sub_D270(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      uint64_t v86 = 0LL;
      uint64_t v87 = *a1;
      uint64_t v88 = 1LL;
      while (1)
      {
        uint64_t v89 = *(void *)(v87 + 16 * v88 + 8);
        uint64_t v90 = v86;
        do
        {
          uint64_t v91 = v87 + v90;
          if (v89 >= *(void *)(v87 + v90 + 8)) {
            break;
          }
          if (!v87) {
            goto LABEL_142;
          }
          uint64_t v92 = *(void *)(v91 + 16);
          *(_OWORD *)(v91 + 16) = *(_OWORD *)v91;
          *(void *)uint64_t v91 = v92;
          *(void *)(v91 + 8) = v89;
          v90 -= 16LL;
        }

        while (v90 != -16);
        ++v88;
        v86 += 16LL;
        if (v88 == v3) {
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

  Swift::Int v6 = result;
  uint64_t v100 = a1;
  if (v3 < 2)
  {
    size_t v10 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v14 = _swiftEmptyArrayStorage[2];
      uint64_t v13 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_104;
    }

    char v102 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t v8 = sub_5460(&qword_18B48);
    uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)(v7, v8);
    *(void *)(v9 + 16) = v7;
    char v102 = (void *)v9;
    __dst = (char *)(v9 + 32);
  }

  Swift::Int v11 = 0LL;
  uint64_t v12 = *a1;
  uint64_t v101 = *a1 + 40;
  uint64_t v99 = *a1 - 16;
  uint64_t v13 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v103 = v6;
  Swift::Int v104 = v3;
  uint64_t v105 = v12;
  while (1)
  {
    Swift::Int v15 = v11++;
    if (v11 < v3)
    {
      uint64_t v16 = *(void *)(v12 + 16 * v11 + 8);
      uint64_t v17 = *(void *)(v12 + 16 * v15 + 8);
      Swift::Int v11 = v15 + 2;
      if (v15 + 2 < v3)
      {
        uint64_t v18 = (uint64_t *)(v101 + 16 * v15);
        uint64_t v19 = v16;
        while (1)
        {
          uint64_t v21 = *v18;
          v18 += 2;
          uint64_t v20 = v21;
          if (v16 < v17 == v21 >= v19) {
            break;
          }
          ++v11;
          uint64_t v19 = v20;
          if (v3 == v11)
          {
            Swift::Int v11 = v3;
            break;
          }
        }
      }

      if (v16 < v17)
      {
        if (v11 < v15) {
          goto LABEL_139;
        }
        if (v15 < v11)
        {
          uint64_t v22 = (__int128 *)(v99 + 16 * v11);
          Swift::Int v23 = v11;
          Swift::Int v24 = v15;
          unint64_t v25 = (__int128 *)(v12 + 16 * v15);
          do
          {
            if (v24 != --v23)
            {
              if (!v12) {
                goto LABEL_145;
              }
              __int128 v26 = *v25;
              *unint64_t v25 = *v22;
              *uint64_t v22 = v26;
            }

            ++v24;
            --v22;
            ++v25;
          }

          while (v24 < v23);
        }
      }
    }

    if (v11 < v3)
    {
      if (__OFSUB__(v11, v15)) {
        goto LABEL_137;
      }
      if (v11 - v15 < v6)
      {
        Swift::Int v27 = v15 + v6;
        if (__OFADD__(v15, v6)) {
          goto LABEL_140;
        }
        if (v27 >= v3) {
          Swift::Int v27 = v3;
        }
        if (v27 < v15) {
          goto LABEL_141;
        }
        if (v11 != v27)
        {
          uint64_t v28 = (void *)(v12 + 16 * v11);
          do
          {
            uint64_t v29 = *(void *)(v12 + 16 * v11 + 8);
            Swift::Int v30 = v15;
            uint64_t v31 = v28;
            do
            {
              if (v29 >= *(v31 - 1)) {
                break;
              }
              if (!v12) {
                goto LABEL_143;
              }
              uint64_t v32 = *v31;
              *(_OWORD *)uint64_t v31 = *((_OWORD *)v31 - 1);
              *(v31 - 1) = v29;
              *(v31 - 2) = v32;
              v31 -= 2;
              ++v30;
            }

            while (v11 != v30);
            ++v11;
            v28 += 2;
          }

          while (v11 != v27);
          Swift::Int v11 = v27;
        }
      }
    }

    if (v11 < v15)
    {
LABEL_132:
      __break(1u);
      goto LABEL_133;
    }

    if ((swift_isUniquelyReferenced_nonNull_native(v13) & 1) == 0) {
      uint64_t v13 = sub_DE4C(0LL, *((void *)v13 + 2) + 1LL, 1, v13);
    }
    unint64_t v34 = *((void *)v13 + 2);
    unint64_t v33 = *((void *)v13 + 3);
    unint64_t v14 = v34 + 1;
    uint64_t v12 = v105;
    if (v34 >= v33 >> 1)
    {
      uint64_t v83 = sub_DE4C((char *)(v33 > 1), v34 + 1, 1, v13);
      uint64_t v12 = v105;
      uint64_t v13 = v83;
    }

    *((void *)v13 + 2) = v14;
    uint64_t v35 = v13 + 32;
    os_log_type_t v36 = &v13[16 * v34 + 32];
    *(void *)os_log_type_t v36 = v15;
    *((void *)v36 + 1) = v11;
    if (v34) {
      break;
    }
    unint64_t v14 = 1LL;
LABEL_15:
    Swift::Int v6 = v103;
    Swift::Int v3 = v104;
    if (v11 >= v104)
    {
      size_t v10 = v102;
LABEL_104:
      uint64_t v85 = v13;
      char v102 = v10;
      if (v14 < 2) {
        goto LABEL_95;
      }
      uint64_t v93 = *v100;
      while (1)
      {
        unint64_t v94 = v14 - 2;
        if (v14 < 2) {
          break;
        }
        if (!v93) {
          goto LABEL_146;
        }
        uint64_t v84 = v85;
        uint64_t v95 = *(void *)&v85[16 * v94 + 32];
        uint64_t v96 = *(void *)&v85[16 * v14 + 24];
        sub_DBC4((char *)(v93 + 16 * v95), (char *)(v93 + 16LL * *(void *)&v85[16 * v14 + 16]), v93 + 16 * v96, __dst);
        if (v1) {
          goto LABEL_94;
        }
        if (v96 < v95) {
          goto LABEL_134;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v84) & 1) == 0) {
          uint64_t v84 = sub_DFEC((uint64_t)v84);
        }
        if (v94 >= *((void *)v84 + 2)) {
          goto LABEL_135;
        }
        uint64_t v97 = &v84[16 * v94 + 32];
        *(void *)uint64_t v97 = v95;
        *((void *)v97 + 1) = v96;
        unint64_t v98 = *((void *)v84 + 2);
        if (v14 > v98) {
          goto LABEL_136;
        }
        memmove(&v84[16 * v14 + 16], &v84[16 * v14 + 32], 16 * (v98 - v14));
        uint64_t v85 = v84;
        *((void *)v84 + 2) = v98 - 1;
        unint64_t v14 = v98 - 1;
        if (v98 <= 2) {
          goto LABEL_95;
        }
      }

uint64_t sub_D93C(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  Swift::Int v6 = a2;
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
  unint64_t v25 = __src;
  Swift::Int v24 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v18 = &v4[16 * v13];
      Swift::Int v23 = v18;
      unint64_t v25 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v19 = (char *)(a3 - 16);
        do
        {
          uint64_t v20 = v19 + 16;
          if (*((void *)v6 - 1) >= *((void *)v18 - 1))
          {
            Swift::Int v23 = v18 - 16;
            if (v20 < v18 || v19 >= v18 || v20 != v18) {
              *(_OWORD *)uint64_t v19 = *((_OWORD *)v18 - 1);
            }
            uint64_t v21 = v6;
            v18 -= 16;
            if (v6 <= v7) {
              break;
            }
          }

          else
          {
            uint64_t v21 = v6 - 16;
            if (v20 != v6 || v19 >= v6) {
              *(_OWORD *)uint64_t v19 = *(_OWORD *)v21;
            }
            unint64_t v25 = v6 - 16;
            if (v21 <= v7) {
              break;
            }
          }

          v19 -= 16;
          Swift::Int v6 = v21;
        }

        while (v18 > v4);
      }

LABEL_44:
      sub_DF44((void **)&v25, &v24, &v23);
      return 1LL;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    unint64_t v14 = &v4[16 * v10];
    Swift::Int v23 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      Swift::Int v15 = v4;
      while (1)
      {
        if (*((void *)v15 + 1) >= *((void *)v6 + 1))
        {
          uint64_t v4 = v15 + 16;
          uint64_t v17 = v15;
          uint64_t v16 = v6;
          if (v7 == v15)
          {
            v15 += 16;
            if (v7 < v4) {
              goto LABEL_22;
            }
          }

          else
          {
            v15 += 16;
          }
        }

        else
        {
          uint64_t v16 = v6 + 16;
          uint64_t v17 = v6;
          if (v7 == v6 && v7 < v16) {
            goto LABEL_22;
          }
        }

        *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
LABEL_22:
        v7 += 16;
        if (v15 < v14)
        {
          Swift::Int v6 = v16;
        }

        Swift::Int v24 = v4;
        unint64_t v25 = v7;
        goto LABEL_44;
      }
    }

    goto LABEL_44;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

      sub_DF44((void **)&v25, &v24, &v23);
      return 1LL;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    unint64_t v14 = &v4[16 * v10];
    Swift::Int v23 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      Swift::Int v15 = v4;
      while (1)
      {
        if (*((void *)v6 + 1) >= *((void *)v15 + 1))
        {
          uint64_t v4 = v15 + 16;
          uint64_t v17 = v15;
          uint64_t v16 = v6;
          if (v7 == v15)
          {
            v15 += 16;
            if (v7 < v4) {
              goto LABEL_22;
            }
          }

          else
          {
            v15 += 16;
          }
        }

        else
        {
          uint64_t v16 = v6 + 16;
          uint64_t v17 = v6;
          if (v7 == v6 && v7 < v16) {
            goto LABEL_22;
          }
        }

        *(_OWORD *)uint64_t v7 = *(_OWORD *)v17;
LABEL_22:
        v7 += 16;
        if (v15 < v14)
        {
          Swift::Int v6 = v16;
        }

        Swift::Int v24 = v4;
        unint64_t v25 = v7;
        goto LABEL_44;
      }
    }

    goto LABEL_44;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

uint64_t sub_DBC4(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  Swift::Int v6 = a2;
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
  unint64_t v25 = __src;
  Swift::Int v24 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v18 = &v4[16 * v13];
      Swift::Int v23 = v18;
      unint64_t v25 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v19 = (char *)(a3 - 16);
        do
        {
          uint64_t v20 = v19 + 16;
          if (*((void *)v18 - 1) >= *((void *)v6 - 1))
          {
            Swift::Int v23 = v18 - 16;
            if (v20 < v18 || v19 >= v18 || v20 != v18) {
              *(_OWORD *)uint64_t v19 = *((_OWORD *)v18 - 1);
            }
            uint64_t v21 = v6;
            v18 -= 16;
            if (v6 <= v7) {
              break;
            }
          }

          else
          {
            uint64_t v21 = v6 - 16;
            if (v20 != v6 || v19 >= v6) {
              *(_OWORD *)uint64_t v19 = *(_OWORD *)v21;
            }
            unint64_t v25 = v6 - 16;
            if (v21 <= v7) {
              break;
            }
          }

          v19 -= 16;
          Swift::Int v6 = v21;
        }

        while (v18 > v4);
      }

char *sub_DE4C(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_5460(&qword_18B50);
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

  unint64_t v14 = v11 + 32;
  Swift::Int v15 = a4 + 32;
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

char *sub_DF44(void **a1, const void **a2, void *a3)
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

char *sub_DFEC(uint64_t a1)
{
  return sub_DE4C(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t *sub_E000(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0LL;
  int64_t v5 = 0LL;
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = *(void *)(a3 + 64) & v8;
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  do
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
    }

    else
    {
      int64_t v14 = v5 + 1;
      if (__OFADD__(v5, 1LL)) {
        goto LABEL_23;
      }
      if (v14 >= v10) {
        return (unint64_t *)sub_E288(result, a2, v4, a3);
      }
      unint64_t v15 = *(void *)(v6 + 8 * v14);
      ++v5;
      if (!v15)
      {
        int64_t v5 = v14 + 1;
        if (v14 + 1 >= v10) {
          return (unint64_t *)sub_E288(result, a2, v4, a3);
        }
        unint64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15)
        {
          int64_t v5 = v14 + 2;
          if (v14 + 2 >= v10) {
            return (unint64_t *)sub_E288(result, a2, v4, a3);
          }
          unint64_t v15 = *(void *)(v6 + 8 * v5);
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v10) {
              return (unint64_t *)sub_E288(result, a2, v4, a3);
            }
            unint64_t v15 = *(void *)(v6 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                int64_t v5 = v16 + 1;
                if (__OFADD__(v16, 1LL)) {
                  goto LABEL_24;
                }
                if (v5 >= v10) {
                  return (unint64_t *)sub_E288(result, a2, v4, a3);
                }
                unint64_t v15 = *(void *)(v6 + 8 * v5);
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }

            int64_t v5 = v16;
          }
        }
      }

LABEL_20:
      unint64_t v9 = (v15 - 1) & v15;
      unint64_t v12 = __clz(__rbit64(v15)) + (v5 << 6);
    }

    *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v12;
  }

  while (!__OFADD__(v4++, 1LL));
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

    unint64_t v9 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    if (*(uint64_t *)(*(void *)(a3 + 56) + 8 * v12) >= 5)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v12;
      if (__OFADD__(v4++, 1LL))
      {
        __break(1u);
        return (unint64_t *)sub_E288(result, a2, v4, a3);
      }
    }
  }

  unint64_t v15 = v13 + 3;
  if (v15 >= v10) {
    return (unint64_t *)sub_E288(result, a2, v4, a3);
  }
  int64_t v14 = *(void *)(v6 + 8 * v15);
  if (v14)
  {
    int64_t v5 = v15;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v5 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v5 >= v10) {
      return (unint64_t *)sub_E288(result, a2, v4, a3);
    }
    int64_t v14 = *(void *)(v6 + 8 * v5);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }

unint64_t *sub_E13C(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0LL;
  int64_t v5 = 0LL;
  uint64_t v6 = a3 + 64;
  uint64_t v7 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = v8 & *(void *)(a3 + 64);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }

    int64_t v13 = v5 + 1;
    if (__OFADD__(v5, 1LL))
    {
      __break(1u);
      goto LABEL_26;
    }

    if (v13 >= v10) {
      return (unint64_t *)sub_E288(result, a2, v4, a3);
    }
    unint64_t v14 = *(void *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      int64_t v5 = v13 + 1;
      if (v13 + 1 >= v10) {
        return (unint64_t *)sub_E288(result, a2, v4, a3);
      }
      unint64_t v14 = *(void *)(v6 + 8 * v5);
      if (!v14)
      {
        int64_t v5 = v13 + 2;
        if (v13 + 2 >= v10) {
          return (unint64_t *)sub_E288(result, a2, v4, a3);
        }
        unint64_t v14 = *(void *)(v6 + 8 * v5);
        if (!v14) {
          break;
        }
      }
    }

uint64_t sub_E288(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return (uint64_t)&_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3)
  {
    swift_retain(a4);
    return v4;
  }

  sub_5460(&qword_18B58);
  uint64_t result = static _DictionaryStorage.allocate(capacity:)(v5);
  uint64_t v9 = result;
  uint64_t v31 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0LL;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
    }

    else
    {
      uint64_t v15 = v11 + 1;
      if (__OFADD__(v11, 1LL)) {
        goto LABEL_40;
      }
      if (v15 >= a2) {
        return v9;
      }
      unint64_t v16 = v31[v15];
      ++v11;
      if (!v16)
      {
        uint64_t v11 = v15 + 1;
        if (v15 + 1 >= a2) {
          return v9;
        }
        unint64_t v16 = v31[v11];
        if (!v16)
        {
          uint64_t v11 = v15 + 2;
          if (v15 + 2 >= a2) {
            return v9;
          }
          unint64_t v16 = v31[v11];
          if (!v16)
          {
            uint64_t v17 = v15 + 3;
            if (v17 >= a2) {
              return v9;
            }
            unint64_t v16 = v31[v17];
            if (!v16)
            {
              while (1)
              {
                uint64_t v11 = v17 + 1;
                if (__OFADD__(v17, 1LL)) {
                  goto LABEL_41;
                }
                if (v11 >= a2) {
                  return v9;
                }
                unint64_t v16 = v31[v11];
                ++v17;
                if (v16) {
                  goto LABEL_24;
                }
              }
            }

            uint64_t v11 = v17;
          }
        }
      }

LABEL_24:
      unint64_t v10 = (v16 - 1) & v16;
      unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }

    uint64_t v18 = 8 * v14;
    uint64_t v19 = *(void *)(*(void *)(v4 + 48) + v18);
    uint64_t v20 = *(void *)(*(void *)(v4 + 56) + v18);
    uint64_t result = static Hasher._hash(seed:_:)(*(void *)(v9 + 40), v19);
    uint64_t v21 = -1LL << *(_BYTE *)(v9 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v24 = __clz(__rbit64((-1LL << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0LL;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
      }

      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }

    *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v24;
    uint64_t v29 = 8 * v24;
    *(void *)(*(void *)(v9 + 48) + v29) = v19;
    *(void *)(*(void *)(v9 + 56) + v29) = v20;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1LL)) {
      break;
    }
    if (!v5) {
      return v9;
    }
  }

LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

void *sub_E4F4(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1LL;
  uint64_t v6 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0LL;
    a3 = 0LL;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }

  if (!a3)
  {
    int64_t v8 = 0LL;
    goto LABEL_35;
  }

  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }

  int64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    uint64_t v13 = *(void *)(*(void *)(a4 + 56) + 8 * v12);
    *a2 = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    a2[1] = v13;
    a2 += 2;
    if (v9 == a3) {
      goto LABEL_35;
    }
  }

  int64_t v14 = v8 + 1;
  if (__OFADD__(v8, 1LL))
  {
    __break(1u);
    goto LABEL_37;
  }

  if (v14 >= v10) {
    goto LABEL_30;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v14);
  if (v15) {
    goto LABEL_19;
  }
  v8 += 2LL;
  if (v14 + 1 >= v10)
  {
    unint64_t v7 = 0LL;
    int64_t v8 = v14;
    goto LABEL_34;
  }

  unint64_t v15 = *(void *)(v4 + 8 * v8);
  if (v15)
  {
LABEL_15:
    int64_t v14 = v8;
LABEL_19:
    unint64_t v17 = __clz(__rbit64(v15));
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v12 = v17 + (v14 << 6);
    int64_t v8 = v14;
    goto LABEL_8;
  }

  int64_t v16 = v14 + 2;
  if (v14 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15)
  {
LABEL_18:
    int64_t v14 = v16;
    goto LABEL_19;
  }

  int64_t v8 = v14 + 3;
  if (v14 + 3 >= v10)
  {
    unint64_t v7 = 0LL;
    int64_t v8 = v14 + 2;
    goto LABEL_34;
  }

  unint64_t v15 = *(void *)(v4 + 8 * v8);
  if (v15) {
    goto LABEL_15;
  }
  int64_t v16 = v14 + 4;
  if (v14 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0LL;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }

  unint64_t v15 = *(void *)(v4 + 8 * v16);
  if (v15) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v14 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (v14 >= v10)
    {
      unint64_t v7 = 0LL;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }

    unint64_t v15 = *(void *)(v4 + 8 * v14);
    ++v16;
    if (v15) {
      goto LABEL_19;
    }
  }

LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_E690(uint64_t a1)
{
  return sub_C5A8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

char *sub_E6A4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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

uint64_t sub_E78C(uint64_t result, uint64_t a2, unsigned int a3)
{
  unint64_t v3 = *(void *)(result + 16);
  if (v3)
  {
    char v4 = a3;
    unint64_t v6 = 0LL;
    uint64_t v7 = result + 32;
    int v8 = (a3 >> 8) & 1;
    do
    {
      if (v6 <= v3) {
        unint64_t v9 = v3;
      }
      else {
        unint64_t v9 = v6;
      }
      while (1)
      {
        if (v6 == v9) {
          goto LABEL_24;
        }
        uint64_t v10 = *(void *)(v7 + 8 * v6++);
        uint64_t v11 = *(void *)(a2 + 16);
        if (!v11) {
          goto LABEL_15;
        }
        if (*(void *)(a2 + 32) != v10) {
          break;
        }
LABEL_6:
        if (v6 == v3) {
          return (uint64_t)_swiftEmptyArrayStorage;
        }
      }

      if (v11 != 1)
      {
        uint64_t v12 = 5LL;
        while (1)
        {
          uint64_t v13 = v12 - 3;
          if (__OFADD__(v12 - 4, 1LL)) {
            break;
          }
          if (*(void *)(a2 + 8 * v12) == v10) {
            goto LABEL_6;
          }
          ++v12;
          if (v13 == v11) {
            goto LABEL_15;
          }
        }

        __break(1u);
LABEL_24:
        __break(1u);
        return result;
      }

LABEL_15:
      if ((v4 & 1) != 0)
      {
        uint64_t result = sub_9858(v10, v8);
        if ((result & 1) != 0) {
          goto LABEL_6;
        }
      }

      uint64_t result = swift_isUniquelyReferenced_nonNull_native(_swiftEmptyArrayStorage);
      if ((result & 1) == 0) {
        uint64_t result = sub_C3AC(0, _swiftEmptyArrayStorage[2] + 1LL, 1);
      }
      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      unint64_t v16 = v15 + 1;
      if (v15 >= v14 >> 1)
      {
        uint64_t result = sub_C3AC(v14 > 1, v15 + 1, 1);
        unint64_t v16 = v15 + 1;
      }

      _swiftEmptyArrayStorage[2] = v16;
      _swiftEmptyArrayStorage[v15 + 4] = v10;
    }

    while (v6 != v3);
  }

  return (uint64_t)_swiftEmptyArrayStorage;
}

uint64_t sub_E918(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v10 = a3 + 64;
  uint64_t v11 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & *(void *)(a3 + 64);
  int64_t v31 = (unint64_t)(v11 + 63) >> 6;
  swift_bridgeObjectRetain(a4);
  uint64_t result = swift_retain(a6);
  uint64_t v15 = 0LL;
  int64_t v16 = 0LL;
  while (2)
  {
    uint64_t v30 = v15;
    do
    {
      while (1)
      {
LABEL_6:
        if (v13)
        {
          unint64_t v17 = __clz(__rbit64(v13));
          v13 &= v13 - 1;
          unint64_t v18 = v17 | (v16 << 6);
        }

        else
        {
          if (__OFADD__(v16++, 1LL)) {
            goto LABEL_35;
          }
          if (v16 >= v31)
          {
LABEL_33:
            uint64_t v27 = sub_E288(a1, a2, v30, a3);
            swift_release(a6);
            swift_bridgeObjectRelease(a4);
            return v27;
          }

          unint64_t v20 = *(void *)(v10 + 8 * v16);
          if (!v20)
          {
            int64_t v21 = v16 + 1;
            if (v16 + 1 >= v31) {
              goto LABEL_33;
            }
            unint64_t v20 = *(void *)(v10 + 8 * v21);
            if (!v20)
            {
              int64_t v21 = v16 + 2;
              if (v16 + 2 >= v31) {
                goto LABEL_33;
              }
              unint64_t v20 = *(void *)(v10 + 8 * v21);
              if (!v20)
              {
                int64_t v21 = v16 + 3;
                if (v16 + 3 >= v31) {
                  goto LABEL_33;
                }
                unint64_t v20 = *(void *)(v10 + 8 * v21);
                if (!v20)
                {
                  while (1)
                  {
                    int64_t v16 = v21 + 1;
                    if (__OFADD__(v21, 1LL)) {
                      break;
                    }
                    if (v16 >= v31) {
                      goto LABEL_33;
                    }
                    unint64_t v20 = *(void *)(v10 + 8 * v16);
                    ++v21;
                    if (v20) {
                      goto LABEL_18;
                    }
                  }

LABEL_18:
          unint64_t v13 = (v20 - 1) & v20;
          unint64_t v18 = __clz(__rbit64(v20)) + (v16 << 6);
        }

        uint64_t v22 = *(void *)(*(void *)(a3 + 48) + 8 * v18);
        uint64_t v23 = *(void *)(a4 + 16);
        if (!v23) {
          break;
        }
        if (*(void *)(a4 + 32) != v22)
        {
          if (v23 != 1)
          {
            uint64_t v24 = 5LL;
            while (1)
            {
              uint64_t v25 = v24 - 3;
              if (__OFADD__(v24 - 4, 1LL)) {
                break;
              }
              if (*(void *)(a4 + 8 * v24) == v22) {
                goto LABEL_6;
              }
              ++v24;
              if (v25 == v23) {
                goto LABEL_26;
              }
            }

            __break(1u);
LABEL_35:
            __break(1u);
            goto LABEL_36;
          }

          break;
        }
      }

LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_EB74(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  char v9 = *(_BYTE *)(a1 + 32);
  unsigned int v10 = v9 & 0x3F;
  unint64_t v11 = (unint64_t)((1LL << v9) + 63) >> 6;
  size_t v12 = 8 * v11;
  swift_bridgeObjectRetain_n(a2, 2LL);
  uint64_t isStackAllocationSafe = swift_retain_n(a4, 2LL);
  if (v10 <= 0xD
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(v12, 8LL), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v18 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0LL), v12);
    swift_bridgeObjectRetain(a2);
    swift_retain(a4);
    uint64_t v14 = sub_E918( (unint64_t *)((char *)&v18 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0LL)),  v11,  a1,  a2,  a3 & 0x101,  a4);
    swift_bridgeObjectRelease(a2);
    uint64_t v15 = swift_release(a4);
    if (v4) {
      swift_willThrow(v15);
    }
  }

  else
  {
    int64_t v16 = (void *)swift_slowAlloc(v12, -1LL);
    bzero(v16, v12);
    swift_bridgeObjectRetain(a2);
    swift_retain(a4);
    uint64_t v14 = sub_E918((unint64_t *)v16, v11, a1, a2, a3 & 0x101, a4);
    swift_bridgeObjectRelease(a2);
    swift_release(a4);
    swift_slowDealloc(v16, -1LL, -1LL);
  }

  swift_release_n(a4, 2LL);
  swift_bridgeObjectRelease_n(a2, 2LL);
  return v14;
}

void *sub_ED90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int16 a5, uint64_t a6)
{
  uint64_t v12 = swift_bridgeObjectRetain(a1);
  unint64_t v13 = sub_C860(v12, (uint64_t (*)(char *, unint64_t, uint64_t))sub_E13C);
  swift_bridgeObjectRelease(a1);
  uint64_t v14 = sub_EB74(v13, a4, a5 & 0x101, a6);
  swift_release(v13);
  swift_bridgeObjectRelease(a4);
  swift_release(a6);
  uint64_t v15 = swift_retain(v14);
  int64_t v16 = (os_log_s *)Logger.logObject.getter(v15);
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    unint64_t v13 = 12LL;
    uint64_t v18 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)uint64_t v18 = 134217984;
    uint64_t v45 = *(void *)(v14 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, v46, v18 + 4, v18 + 12);
    swift_release(v14);
    _os_log_impl( &dword_0,  v16,  v17,  "Device owner: [Top-selfies] After filtering at min 5 selfies and on predicate, found %ld entities with selfies.",  v18,  0xCu);
    swift_slowDealloc(v18, -1LL, -1LL);
  }

  else
  {
    swift_release(v14);
  }

  if (!*(void *)(v14 + 16))
  {
    swift_release(v14);
    return _swiftEmptyArrayStorage;
  }

  uint64_t v19 = swift_bridgeObjectRetain(v14);
  unint64_t v20 = (unint64_t)sub_C2AC(v19);
  swift_release(v14);
  uint64_t v45 = v20;
  sub_CB38(&v45, sub_CBA4);
  swift_release(v14);
  int64_t v21 = (void *)v45;
  uint64_t v22 = sub_5460(&qword_18B38);
  uint64_t v23 = swift_allocObject(v22, 40LL, 7LL);
  *(_OWORD *)(v23 + 16) = xmmword_11CD0;
  if (!v21[2]) {
    goto LABEL_45;
  }
  uint64_t v14 = v23;
  unint64_t v6 = v21 + 4;
  *(void *)(v23 + 32) = v21[4];
  uint64_t v47 = v23;
  unint64_t v13 = v21[2];
  if (v13 == 1)
  {
    swift_release(v21);
    return (void *)v14;
  }

  if (a2 < 101)
  {
    unint64_t v20 = Logger.logObject.getter(v23);
    os_log_type_t v25 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled((os_log_t)v20, v25))
    {
      uint64_t v26 = swift_slowAlloc(22LL, -1LL);
      *(_DWORD *)uint64_t v26 = 134218240;
      uint64_t v45 = a2;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, v46, v26 + 4, v26 + 12);
      *(_WORD *)(v26 + 12) = 2048;
      uint64_t v45 = 100LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, v46, v26 + 14, v26 + 22);
      _os_log_impl( &dword_0,  (os_log_t)v20,  v25,  "Device owner: [Top-selfies] Number of selfies %ld is smaller than threshold %ld. Keeping at least two candidates.",  (uint8_t *)v26,  0x16u);
      swift_slowDealloc(v26, -1LL, -1LL);
    }

    if (v21[2] >= 2uLL)
    {
      unint64_t v20 = v21[6];
      if ((swift_isUniquelyReferenced_nonNull_native(v14) & 1) != 0) {
        goto LABEL_16;
      }
      goto LABEL_48;
    }

    goto LABEL_46;
  }

  if (v13 <= 1)
  {
LABEL_34:
    swift_release(v21);
LABEL_36:
    uint64_t v40 = swift_bridgeObjectRetain(v14);
    char v41 = (os_log_s *)Logger.logObject.getter(v40);
    os_log_type_t v42 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v43 = swift_slowAlloc(22LL, -1LL);
      *(_DWORD *)uint64_t v43 = 134218240;
      uint64_t v45 = *(void *)(v14 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, v46, v43 + 4, v43 + 12);
      swift_bridgeObjectRelease(v14);
      *(_WORD *)(v43 + 12) = 2048;
      uint64_t v45 = 0x3FC3333340000000LL;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v45, v46, v43 + 14, v43 + 22);
      _os_log_impl( &dword_0,  v41,  v42,  "Device owner: [Top-selfies] Found %ld candidates before the gap becomes higher than %f.",  (uint8_t *)v43,  0x16u);
      swift_slowDealloc(v43, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease(v14);
    }

    swift_beginAccess(&v47, &v45, 0LL, 0LL);
    return (void *)v47;
  }

  unint64_t v20 = 1LL;
  unint64_t v24 = v21[2];
  while (1)
  {
    if (v20 > v24) {
      goto LABEL_47;
    }
    if (v20 >= v24) {
      break;
    }
    uint64_t v29 = &v6[2 * v20];
    uint64_t v30 = *(v29 - 1);
    uint64_t v31 = v29[1];
    BOOL v32 = __OFSUB__(v30, v31);
    uint64_t v33 = v30 - v31;
    if (v32) {
      goto LABEL_50;
    }
    unint64_t v34 = &v21[2 * v20 + 7];
    while (v20 < v24)
    {
      unint64_t v6 = (void *)*(v34 - 3);
      unint64_t v36 = *(void *)(v14 + 16);
      unint64_t v35 = *(void *)(v14 + 24);
      if (v36 >= v35 >> 1) {
        uint64_t v14 = (uint64_t)sub_BF90((char *)(v35 > 1), v36 + 1, 1, (char *)v14);
      }
      *(void *)(v14 + 16) = v36 + 1;
      *(void *)(v14 + 8 * v36 + 32) = v6;
      if (v20 + 1 >= v13) {
        goto LABEL_35;
      }
      unint64_t v24 = v21[2];
      unint64_t v37 = v20;
      if (v20 >= v24) {
        goto LABEL_42;
      }
      ++v20;
      if (v37 + 1 >= v24) {
        goto LABEL_43;
      }
      uint64_t v38 = *(v34 - 2);
      uint64_t v39 = v38 - *v34;
      if (__OFSUB__(v38, *v34)) {
        goto LABEL_44;
      }
      v34 += 2;
      if ((float)((float)v39 / (float)v38) >= 0.15)
      {
LABEL_35:
        swift_release(v21);
        uint64_t v47 = v14;
        goto LABEL_36;
      }
    }

    __break(1u);
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    uint64_t v14 = (uint64_t)sub_BF90(0LL, *(void *)(v14 + 16) + 1LL, 1, (char *)v14);
LABEL_16:
    unint64_t v28 = *(void *)(v14 + 16);
    unint64_t v27 = *(void *)(v14 + 24);
    if (v28 >= v27 >> 1) {
      uint64_t v14 = (uint64_t)sub_BF90((char *)(v27 > 1), v28 + 1, 1, (char *)v14);
    }
    *(void *)(v14 + 16) = v28 + 1;
    *(void *)(v14 + 8 * v28 + 32) = v20;
    uint64_t v47 = v14;
    if (v13 < 3) {
      goto LABEL_34;
    }
    unint64_t v24 = v21[2];
    unint64_t v20 = 2LL;
  }

  __break(1u);
LABEL_50:
  __break(1u);
  uint64_t result = (void *)swift_release(v45);
  __break(1u);
  return result;
}

unint64_t *sub_F358(unint64_t *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = 0LL;
  int64_t v6 = 0LL;
  uint64_t v7 = a3 + 64;
  uint64_t v8 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v9 = -1LL;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  unint64_t v10 = v9 & *(void *)(a3 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  do
  {
    while (1)
    {
      do
      {
LABEL_5:
        while (v10)
        {
          unint64_t v13 = __clz(__rbit64(v10));
          v10 &= v10 - 1;
          unint64_t v14 = v13 | (v6 << 6);
          uint64_t v15 = *(void *)(a4 + 16);
          if (v15) {
            goto LABEL_22;
          }
        }

        int64_t v16 = v6 + 1;
        if (__OFADD__(v6, 1LL)) {
          goto LABEL_31;
        }
        if (v16 >= v11) {
          return (unint64_t *)sub_E288(result, a2, v5, a3);
        }
        unint64_t v17 = *(void *)(v7 + 8 * v16);
        ++v6;
        if (!v17)
        {
          int64_t v6 = v16 + 1;
          if (v16 + 1 >= v11) {
            return (unint64_t *)sub_E288(result, a2, v5, a3);
          }
          unint64_t v17 = *(void *)(v7 + 8 * v6);
          if (!v17)
          {
            int64_t v6 = v16 + 2;
            if (v16 + 2 >= v11) {
              return (unint64_t *)sub_E288(result, a2, v5, a3);
            }
            unint64_t v17 = *(void *)(v7 + 8 * v6);
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v11) {
                return (unint64_t *)sub_E288(result, a2, v5, a3);
              }
              unint64_t v17 = *(void *)(v7 + 8 * v18);
              if (!v17)
              {
                while (1)
                {
                  int64_t v6 = v18 + 1;
                  if (__OFADD__(v18, 1LL)) {
                    goto LABEL_33;
                  }
                  if (v6 >= v11) {
                    return (unint64_t *)sub_E288(result, a2, v5, a3);
                  }
                  unint64_t v17 = *(void *)(v7 + 8 * v6);
                  ++v18;
                  if (v17) {
                    goto LABEL_21;
                  }
                }
              }

              int64_t v6 = v18;
            }
          }
        }

uint64_t sub_F4F4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_5460(&qword_18AC8);
  __chkstk_darwin(v2);
  v254 = (char *)&v231 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = sub_5460(&qword_18AD0);
  __chkstk_darwin(v4);
  v253 = (char *)&v231 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v256 = (os_log_s *)type metadata accessor for VUGallery.RecognitionResult(0LL);
  uint64_t v6 = *((void *)v256 - 1);
  uint64_t v7 = __chkstk_darwin(v256);
  v231 = (char *)&v231 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = __chkstk_darwin(v7);
  v237 = (char *)&v231 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  v236 = (char *)&v231 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  v249 = (char *)&v231 - v14;
  __chkstk_darwin(v13);
  v247 = (char *)&v231 - v15;
  uint64_t v16 = sub_5460(&qword_18AD8);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v234 = (uint64_t)&v231 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v233 = (uint64_t)&v231 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v232 = (uint64_t)&v231 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v235 = (uint64_t)&v231 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v242 = (os_log_s *)((char *)&v231 - v26);
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v252 = (uint64_t)&v231 - v28;
  uint64_t v29 = __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v231 - v30;
  uint64_t v32 = __chkstk_darwin(v29);
  unint64_t v34 = (char *)&v231 - v33;
  uint64_t v35 = __chkstk_darwin(v32);
  uint64_t v255 = (uint64_t)&v231 - v36;
  v257 = (void (*)(char *, uint64_t))((char *)v0 + OBJC_IVAR____TtC7Plugins19VUDeviceOwnerPlugin_logger);
  unint64_t v37 = (os_log_s *)Logger.logObject.getter(v35);
  os_log_type_t v38 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl(&dword_0, v37, v38, "Updating VUDeviceOwnerPlugin", v39, 2u);
    swift_slowDealloc(v39, -1LL, -1LL);
  }

  CFAbsoluteTimeGetCurrent();
  uint64_t v40 = (void *)sub_5D90();
  unint64_t v42 = v41;
  v251 = v43;
  LODWORD(v248) = v44;
  uint64_t v45 = *(void (**)(uint64_t, uint64_t, uint64_t, os_log_s *))(v6 + 56);
  uint64_t v46 = v1;
  uint64_t v47 = v6;
  uint64_t v48 = v255;
  unint64_t v49 = v256;
  v45(v255, 1LL, 1LL, v256);
  uint64_t v250 = v47;
  if (v42)
  {
    v258 = v40;
    sub_7B88((uint64_t)v40, v42, (uint64_t)v34);
    sub_110C8((uint64_t)v34, v48, &qword_18AD8);
    sub_11374(v48, (uint64_t)v31, &qword_18AD8);
    int v50 = (*(uint64_t (**)(char *, uint64_t, os_log_s *))(v47 + 48))(v31, 1LL, v49);
    BOOL v238 = v50 != 1;
    if (v50 == 1)
    {
      sub_113B8((uint64_t)v31, &qword_18AD8);
      char v60 = v258;
      BOOL v58 = v259;
    }

    else
    {
      uint64_t v51 = v47;
      uint64_t v52 = *(void (**)(char *, char *, os_log_s *))(v47 + 32);
      uint64_t v53 = v247;
      v52(v247, v31, v49);
      uint64_t v54 = v46[2];
      uint64_t v55 = swift_retain(v54);
      uint64_t v56 = VUGallery.RecognitionResult.toMetadata()(v55);
      v264 = (void *)sub_5460(&qword_18AF8);
      aBlock = (void **)v56;
      uint64_t v57 = v259;
      dispatch thunk of VUGallery.updateMetadata(for:value:)(0xD000000000000013LL, 0x8000000000012070LL, &aBlock);
      BOOL v58 = v57;
      if (v57)
      {
        swift_release(v54);
        swift_errorRelease(v57);
        (*(void (**)(char *, os_log_s *))(v51 + 8))(v53, v49);
        BOOL v58 = 0LL;
      }

      else
      {
        (*(void (**)(char *, os_log_s *))(v51 + 8))(v53, v49);
        swift_release(v54);
      }

      char v60 = v258;
      sub_5404(&aBlock);
    }

    uint64_t v61 = v251;
    int v62 = v248;
    uint64_t v63 = (void **)sub_8F98((uint64_t)v60, v42);
    v251 = v63;
    LODWORD(v241) = v62 | ((uint64_t)v61 > 29);
    if (!(v62 & 1 | ((uint64_t)v61 > 29)))
    {
      uint64_t v64 = (os_log_s *)Logger.logObject.getter(v63);
      os_log_type_t v65 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v64, v65))
      {
        uint64_t v66 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        *(_DWORD *)uint64_t v66 = 134217984;
        aBlock = v61;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v262, v66 + 4, v66 + 12);
        _os_log_impl( &dword_0,  v64,  v65,  "Device owner: Not filtering out children because age of Me contact is %ld",  v66,  0xCu);
        swift_slowDealloc(v66, -1LL, -1LL);
      }
    }

    uint64_t v59 = (uint64_t)v58;
    v240 = (_DWORD *)sub_82BC(v258, v42);
    char v68 = v67;
    swift_bridgeObjectRelease(v42);
    LODWORD(v239) = v68 & 1;
  }

  else
  {
    BOOL v238 = 0;
    LODWORD(v239) = 1;
    v240 = 0LL;
    v251 = (void **)_swiftEmptyArrayStorage;
    LODWORD(v241) = 1;
    uint64_t v59 = (uint64_t)v259;
  }

  v258 = v46;
  uint64_t v69 = v46[2];
  uint64_t v70 = (char *)enum case for VUGallery.EntityClass.person(_:);
  uint64_t v71 = type metadata accessor for VUGallery.EntityClass(0LL);
  uint64_t v72 = *(void *)(v71 - 8);
  uint64_t v73 = *(uint64_t (**)(char *, char *, uint64_t))(v72 + 104);
  uint64_t v74 = (uint64_t)v253;
  LODWORD(v244) = (_DWORD)v70;
  v243 = v73;
  v73(v253, v70, v71);
  uint64_t v75 = 1LL;
  v247 = *(char **)(v72 + 56);
  uint64_t v248 = v71;
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v247)(v74, 0LL, 1LL, v71);
  uint64_t v76 = enum case for VUGallery.Source.frontCamera(_:);
  uint64_t v77 = type metadata accessor for VUGallery.Source(0LL);
  uint64_t v78 = *(void *)(v77 - 8);
  uint64_t v79 = (uint64_t)v254;
  v259 = *(void (**)(void, void, void))(v78 + 104);
  v259(v254, v76, v77);
  v245 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v78 + 56);
  uint64_t v246 = v77;
  v245(v79, 0LL, 1LL, v77);
  swift_retain(v69);
  uint64_t v80 = dispatch thunk of VUGallery.countPerEntity(for:from:)(v74, v79);
  swift_release(v69);
  sub_113B8(v79, &qword_18AC8);
  uint64_t result = sub_113B8(v74, &qword_18AD0);
  int64_t v82 = 0LL;
  uint64_t v83 = 0LL;
  uint64_t v84 = v80 + 64;
  uint64_t v85 = 1LL << *(_BYTE *)(v80 + 32);
  uint64_t v86 = -1LL;
  if (v85 < 64) {
    uint64_t v86 = ~(-1LL << v85);
  }
  unint64_t v87 = v86 & *(void *)(v80 + 64);
  int64_t v88 = (unint64_t)(v85 + 63) >> 6;
  uint64_t v89 = (void (*)(void, void, void))v59;
  while (v87)
  {
    unint64_t v90 = __clz(__rbit64(v87));
    v87 &= v87 - 1;
    unint64_t v91 = v90 | (v82 << 6);
LABEL_20:
    uint64_t v92 = *(void *)(*(void *)(v80 + 56) + 8 * v91);
    BOOL v93 = __OFADD__(v83, v92);
    v83 += v92;
    if (v93)
    {
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      uint64_t v191 = v250;
      uint64_t v192 = v231;
      uint64_t v193 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v250 + 16))(v231, v59, v75);
      v257 = (void (*)(char *, uint64_t))VUGallery.RecognitionResult.entityIdentifier.getter(v193);
      (*(void (**)(char *, uint64_t))(v191 + 8))(v192, v75);
      goto LABEL_129;
    }
  }

  BOOL v93 = __OFADD__(v82++, 1LL);
  if (v93)
  {
    __break(1u);
LABEL_159:
    __break(1u);
LABEL_160:
    __break(1u);
LABEL_161:
    __break(1u);
    goto LABEL_162;
  }

  if (v82 >= v88) {
    goto LABEL_41;
  }
  unint64_t v94 = *(void *)(v84 + 8 * v82);
  if (v94)
  {
LABEL_36:
    unint64_t v96 = __clz(__rbit64(v94));
    unint64_t v87 = (v94 - 1) & v94;
    unint64_t v91 = v96 + (v82 << 6);
    goto LABEL_20;
  }

  int64_t v95 = v82 + 1;
  if (v82 + 1 >= v88) {
    goto LABEL_41;
  }
  unint64_t v94 = *(void *)(v84 + 8 * v95);
  if (v94) {
    goto LABEL_35;
  }
  int64_t v95 = v82 + 2;
  if (v82 + 2 >= v88) {
    goto LABEL_41;
  }
  unint64_t v94 = *(void *)(v84 + 8 * v95);
  if (v94) {
    goto LABEL_35;
  }
  int64_t v95 = v82 + 3;
  if (v82 + 3 >= v88) {
    goto LABEL_41;
  }
  unint64_t v94 = *(void *)(v84 + 8 * v95);
  if (v94) {
    goto LABEL_35;
  }
  int64_t v95 = v82 + 4;
  if (v82 + 4 >= v88) {
    goto LABEL_41;
  }
  unint64_t v94 = *(void *)(v84 + 8 * v95);
  if (v94)
  {
LABEL_35:
    int64_t v82 = v95;
    goto LABEL_36;
  }

  int64_t v95 = v82 + 5;
  if (v82 + 5 < v88)
  {
    unint64_t v94 = *(void *)(v84 + 8 * v95);
    if (!v94)
    {
      while (1)
      {
        int64_t v82 = v95 + 1;
        if (__OFADD__(v95, 1LL)) {
          break;
        }
        if (v82 >= v88) {
          goto LABEL_41;
        }
        unint64_t v94 = *(void *)(v84 + 8 * v82);
        ++v95;
        if (v94) {
          goto LABEL_36;
        }
      }

LABEL_162:
      __break(1u);
      goto LABEL_163;
    }

    goto LABEL_35;
  }

LABEL_41:
  uint64_t v97 = v258[2];
  uint64_t v75 = (uint64_t)v253;
  uint64_t v98 = v248;
  v243(v253, (char *)v244, v248);
  uint64_t v59 = 1LL;
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v247)(v75, 0LL, 1LL, v98);
  uint64_t v99 = (uint64_t)v254;
  uint64_t v100 = v246;
  v259(v254, enum case for VUGallery.Source.backCamera(_:), v246);
  v245(v99, 0LL, 1LL, v100);
  swift_retain(v97);
  uint64_t v77 = dispatch thunk of VUGallery.countPerEntity(for:from:)(v75, v99);
  swift_release(v97);
  sub_113B8(v99, &qword_18AC8);
  uint64_t result = sub_113B8(v75, &qword_18AD0);
  int64_t v101 = 0LL;
  uint64_t v102 = 0LL;
  uint64_t v103 = v77 + 64;
  uint64_t v104 = 1LL << *(_BYTE *)(v77 + 32);
  uint64_t v105 = -1LL;
  if (v104 < 64) {
    uint64_t v105 = ~(-1LL << v104);
  }
  unint64_t v106 = v105 & *(void *)(v77 + 64);
  int64_t v107 = (unint64_t)(v104 + 63) >> 6;
  while (1)
  {
    if (v106)
    {
      unint64_t v108 = __clz(__rbit64(v106));
      v106 &= v106 - 1;
      unint64_t v109 = v108 | (v101 << 6);
      goto LABEL_45;
    }

    BOOL v93 = __OFADD__(v101++, 1LL);
    if (v93) {
      goto LABEL_159;
    }
    if (v101 >= v107) {
      break;
    }
    unint64_t v111 = *(void *)(v103 + 8 * v101);
    if (!v111)
    {
      int64_t v112 = v101 + 1;
      if (v101 + 1 >= v107) {
        break;
      }
      unint64_t v111 = *(void *)(v103 + 8 * v112);
      if (!v111)
      {
        int64_t v112 = v101 + 2;
        if (v101 + 2 >= v107) {
          break;
        }
        unint64_t v111 = *(void *)(v103 + 8 * v112);
        if (!v111)
        {
          int64_t v112 = v101 + 3;
          if (v101 + 3 >= v107) {
            break;
          }
          unint64_t v111 = *(void *)(v103 + 8 * v112);
          if (!v111)
          {
            int64_t v112 = v101 + 4;
            if (v101 + 4 >= v107) {
              break;
            }
            unint64_t v111 = *(void *)(v103 + 8 * v112);
            if (!v111)
            {
              int64_t v112 = v101 + 5;
              if (v101 + 5 >= v107) {
                break;
              }
              unint64_t v111 = *(void *)(v103 + 8 * v112);
              if (!v111)
              {
                while (1)
                {
                  int64_t v101 = v112 + 1;
                  if (__OFADD__(v112, 1LL)) {
                    break;
                  }
                  if (v101 >= v107) {
                    goto LABEL_66;
                  }
                  unint64_t v111 = *(void *)(v103 + 8 * v101);
                  ++v112;
                  if (v111) {
                    goto LABEL_61;
                  }
                }

LABEL_163:
                __break(1u);
LABEL_164:
                __break(1u);
                return result;
              }
            }
          }
        }
      }

      int64_t v101 = v112;
    }

LABEL_61:
    unint64_t v113 = __clz(__rbit64(v111));
    unint64_t v106 = (v111 - 1) & v111;
    unint64_t v109 = v113 + (v101 << 6);
LABEL_45:
    uint64_t v110 = *(void *)(*(void *)(v77 + 56) + 8 * v109);
    BOOL v93 = __OFADD__(v102, v110);
    v102 += v110;
    if (v93) {
      goto LABEL_127;
    }
  }

LABEL_66:
  swift_bridgeObjectRetain(v80);
  uint64_t v114 = swift_bridgeObjectRetain(v77);
  unint64_t v115 = (os_log_s *)Logger.logObject.getter(v114);
  os_log_type_t v116 = static os_log_type_t.debug.getter();
  BOOL v117 = os_log_type_enabled(v115, v116);
  v259 = v89;
  if (v117)
  {
    uint64_t v118 = swift_slowAlloc(42LL, -1LL);
    *(_DWORD *)uint64_t v118 = 134218752;
    aBlock = (void **)v83;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v262, v118 + 4, v118 + 12);
    *(_WORD *)(v118 + 12) = 2048;
    aBlock = *(void ***)(v80 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v262, v118 + 14, v118 + 22);
    swift_bridgeObjectRelease(v80);
    *(_WORD *)(v118 + 22) = 2048;
    aBlock = (void **)v102;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v262, v118 + 24, v118 + 32);
    *(_WORD *)(v118 + 32) = 2048;
    aBlock = *(void ***)(v77 + 16);
    uint64_t v89 = v259;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v262, v118 + 34, v118 + 42);
    swift_bridgeObjectRelease(v77);
    _os_log_impl( &dword_0,  v115,  v116,  "Device owner: Total of %ld faces in selfies assets for %ld entities and %ld faces in rear-facing assets for %ld entities",  (uint8_t *)v118,  0x2Au);
    swift_slowDealloc(v118, -1LL, -1LL);
  }

  else
  {
    swift_bridgeObjectRelease(v77);
    swift_bridgeObjectRelease(v80);
  }

  uint64_t v75 = (uint64_t)v256;

  uint64_t v119 = v252;
  sub_AA20(v83, v80, v102, (unint64_t *)v77, (uint64_t)v251, 1, v241 & 1, (uint64_t)v240, v252, v239);
  uint64_t v120 = v119;
  uint64_t v121 = (uint64_t)v242;
  sub_11374(v120, (uint64_t)v242, &qword_18AD8);
  uint64_t v122 = v250;
  v244 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v250 + 48);
  if (v244(v121, 1LL, v75) == 1)
  {
    uint64_t v123 = sub_113B8(v121, &qword_18AD8);
    if (v238) {
      goto LABEL_75;
    }
    uint64_t v124 = (os_log_s *)Logger.logObject.getter(v123);
    os_log_type_t v125 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v124, v125))
    {
      uint64_t v126 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v126 = 0;
      _os_log_impl(&dword_0, v124, v125, "Device owner (me ground truth does not exist): result null", v126, 2u);
      uint64_t v127 = v126;
      uint64_t v75 = (uint64_t)v256;
      swift_slowDealloc(v127, -1LL, -1LL);
    }

    uint64_t v128 = v258[2];
    swift_retain(v128);
    unint64_t v129 = sub_5848((uint64_t)&off_14788);
    v264 = (void *)sub_5460(&qword_18AE0);
    aBlock = (void **)v129;
    dispatch thunk of VUGallery.updateMetadata(for:value:)(0xD000000000000013LL, 0x8000000000012070LL, &aBlock);
    if (v89) {
      goto LABEL_78;
    }
    swift_release(v128);
    uint64_t v123 = sub_5404(&aBlock);
LABEL_75:
    os_log_type_t v130 = (os_log_s *)Logger.logObject.getter(v123);
    os_log_type_t v131 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v130, v131))
    {
      uint64_t v132 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v132 = 0;
      _os_log_impl(&dword_0, v130, v131, "Device owner: result ignoring me ground truth null", v132, 2u);
      uint64_t v133 = v132;
      uint64_t v75 = (uint64_t)v256;
      swift_slowDealloc(v133, -1LL, -1LL);
    }

    uint64_t v128 = v258[2];
    swift_retain(v128);
    unint64_t v134 = sub_5848((uint64_t)&off_147D8);
    v264 = (void *)sub_5460(&qword_18AE0);
    aBlock = (void **)v134;
    dispatch thunk of VUGallery.updateMetadata(for:value:)(0xD000000000000028LL, 0x8000000000012090LL, &aBlock);
    if (v89)
    {
LABEL_78:
      swift_bridgeObjectRelease(v80);
      swift_bridgeObjectRelease(v77);
      swift_release(v128);
      swift_bridgeObjectRelease(v251);
      sub_113B8(v252, &qword_18AD8);
      sub_5404(&aBlock);
LABEL_93:
      uint64_t v168 = v255;
      return sub_113B8(v168, &qword_18AD8);
    }

    swift_release(v128);
    sub_5404(&aBlock);
  }

  else
  {
    uint64_t v135 = v249;
    (*(void (**)(char *, uint64_t, uint64_t))(v122 + 32))(v249, v121, v75);
    uint64_t v136 = *(uint64_t (**)(char *, char *, uint64_t))(v122 + 16);
    if (v238)
    {
      char v137 = v237;
    }

    else
    {
      char v138 = v236;
      v243 = *(uint64_t (**)(char *, char *, uint64_t))(v122 + 16);
      uint64_t v139 = v136(v236, v135, v75);
      uint64_t v140 = (os_log_s *)Logger.logObject.getter(v139);
      os_log_type_t v141 = static os_log_type_t.debug.getter();
      uint64_t v142 = v75;
      int v143 = v141;
      if (os_log_type_enabled(v140, v141))
      {
        uint64_t v144 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        v242 = v140;
        uint64_t v145 = v138;
        uint64_t v146 = v144;
        LODWORD(v241) = v143;
        uint64_t v75 = v142;
        *(_DWORD *)uint64_t v144 = 134217984;
        uint64_t v147 = v144 + 12;
        v240 = v144 + 4;
        uint64_t v239 = ((uint64_t (*)(void))VUGallery.RecognitionResult.entityIdentifier.getter)();
        os_log_type_t v148 = v145;
        uint64_t v140 = v242;
        v256 = *(os_log_s **)(v250 + 8);
        ((void (*)(char *, uint64_t))v256)(v148, v75);
        aBlock = (void **)v239;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v262, v240, v147);
        _os_log_impl( &dword_0,  v140,  (os_log_type_t)v241,  "Device owner (me ground truth does not exist): result %ld",  v146,  0xCu);
        swift_slowDealloc(v146, -1LL, -1LL);
      }

      else
      {
        v256 = *(os_log_s **)(v250 + 8);
        ((void (*)(char *, uint64_t))v256)(v138, v142);
        uint64_t v75 = v142;
      }

      uint64_t v149 = v258[2];
      uint64_t v150 = swift_retain(v149);
      uint64_t v135 = v249;
      uint64_t v151 = VUGallery.RecognitionResult.toMetadata()(v150);
      v264 = (void *)sub_5460(&qword_18AF8);
      aBlock = (void **)v151;
      unint64_t v152 = v259;
      dispatch thunk of VUGallery.updateMetadata(for:value:)(0xD000000000000013LL, 0x8000000000012070LL, &aBlock);
      v259 = v152;
      if (v152)
      {
        ((void (*)(char *, uint64_t))v256)(v135, v75);
        swift_bridgeObjectRelease(v80);
        swift_bridgeObjectRelease(v77);
        swift_release(v149);
        swift_bridgeObjectRelease(v251);
        sub_113B8(v252, &qword_18AD8);
        sub_5404(&aBlock);
        goto LABEL_93;
      }

      swift_release(v149);
      sub_5404(&aBlock);
      char v137 = v237;
      uint64_t v136 = v243;
    }

    uint64_t v153 = v136(v137, v135, v75);
    uint64_t v154 = (os_log_s *)Logger.logObject.getter(v153);
    os_log_type_t v155 = static os_log_type_t.debug.getter();
    uint64_t v156 = v75;
    int v157 = v155;
    if (os_log_type_enabled(v154, v155))
    {
      v158 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      v256 = v154;
      uint64_t v159 = v137;
      uint64_t v160 = v158;
      LODWORD(v243) = v157;
      uint64_t v75 = v156;
      *(_DWORD *)v158 = 134217984;
      uint64_t v161 = v158 + 12;
      v242 = (os_log_s *)(v158 + 4);
      uint64_t v241 = ((uint64_t (*)(void))VUGallery.RecognitionResult.entityIdentifier.getter)();
      v162 = v159;
      uint64_t v154 = v256;
      v257 = *(void (**)(char *, uint64_t))(v250 + 8);
      v257(v162, v75);
      aBlock = (void **)v241;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&aBlock, &v262, v242, v161);
      _os_log_impl(&dword_0, v154, (os_log_type_t)v243, "Device owner: result ignoring me ground truth %ld", v160, 0xCu);
      swift_slowDealloc(v160, -1LL, -1LL);
    }

    else
    {
      v257 = *(void (**)(char *, uint64_t))(v250 + 8);
      v257(v137, v156);
      uint64_t v75 = v156;
    }

    uint64_t v163 = v258[2];
    uint64_t v164 = swift_retain(v163);
    uint64_t v165 = v249;
    uint64_t v166 = VUGallery.RecognitionResult.toMetadata()(v164);
    v264 = (void *)sub_5460(&qword_18AF8);
    aBlock = (void **)v166;
    v167 = v259;
    dispatch thunk of VUGallery.updateMetadata(for:value:)(0xD000000000000028LL, 0x8000000000012090LL, &aBlock);
    if (v167)
    {
      v257(v165, v75);
      swift_bridgeObjectRelease(v80);
      swift_bridgeObjectRelease(v77);
      swift_release(v163);
      swift_bridgeObjectRelease(v251);
      sub_113B8(v252, &qword_18AD8);
      sub_5404(&aBlock);
      goto LABEL_93;
    }

    v257(v165, v75);
    swift_release(v163);
    sub_5404(&aBlock);
  }

  v169 = (NSString *)String._bridgeToObjectiveC()();
  Class v170 = NSClassFromString(v169);

  if (v170)
  {
    swift_bridgeObjectRelease(v80);
    swift_bridgeObjectRelease(v77);
    swift_bridgeObjectRelease(v251);
    goto LABEL_156;
  }

  if (!os_variant_has_internal_ui("com.apple.VisualUnderstanding"))
  {
    swift_bridgeObjectRelease(v80);
    swift_bridgeObjectRelease(v77);
    swift_bridgeObjectRelease(v251);
    v189 = (void *)&loc_11000;
    goto LABEL_155;
  }

  v171 = v258;
  sub_AA20(v83, v80, v102, (unint64_t *)v77, (uint64_t)_swiftEmptyArrayStorage, 0, 0, 0LL, v235, 1u);
  swift_bridgeObjectRelease(v77);
  swift_bridgeObjectRelease(v80);
  uint64_t v172 = v171[2];
  uint64_t v173 = (uint64_t)v253;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v247)(v253, 1LL, 1LL, v248);
  uint64_t v174 = (uint64_t)v254;
  v245((uint64_t)v254, 1LL, 1LL, v246);
  swift_retain(v172);
  uint64_t v175 = dispatch thunk of VUGallery.countPerEntity(for:from:)(v173, v174);
  swift_release(v172);
  sub_113B8(v174, &qword_18AC8);
  uint64_t result = sub_113B8(v173, &qword_18AD0);
  int64_t v176 = 0LL;
  uint64_t v177 = 0LL;
  uint64_t v178 = v175 + 64;
  uint64_t v179 = 1LL << *(_BYTE *)(v175 + 32);
  uint64_t v180 = -1LL;
  if (v179 < 64) {
    uint64_t v180 = ~(-1LL << v179);
  }
  unint64_t v181 = v180 & *(void *)(v175 + 64);
  int64_t v182 = (unint64_t)(v179 + 63) >> 6;
  while (2)
  {
    if (v181)
    {
      unint64_t v183 = __clz(__rbit64(v181));
      v181 &= v181 - 1;
      unint64_t v184 = v183 | (v176 << 6);
LABEL_102:
      uint64_t v185 = *(void *)(*(void *)(v175 + 56) + 8 * v184);
      BOOL v93 = __OFADD__(v177, v185);
      v177 += v185;
      if (v93) {
        goto LABEL_160;
      }
      continue;
    }

    break;
  }

  BOOL v93 = __OFADD__(v176++, 1LL);
  if (v93) {
    goto LABEL_161;
  }
  if (v176 < v182)
  {
    unint64_t v186 = *(void *)(v178 + 8 * v176);
    if (!v186)
    {
      int64_t v187 = v176 + 1;
      if (v176 + 1 >= v182) {
        goto LABEL_124;
      }
      unint64_t v186 = *(void *)(v178 + 8 * v187);
      if (!v186)
      {
        int64_t v187 = v176 + 2;
        if (v176 + 2 >= v182) {
          goto LABEL_124;
        }
        unint64_t v186 = *(void *)(v178 + 8 * v187);
        if (!v186)
        {
          int64_t v187 = v176 + 3;
          if (v176 + 3 >= v182) {
            goto LABEL_124;
          }
          unint64_t v186 = *(void *)(v178 + 8 * v187);
          if (!v186)
          {
            int64_t v187 = v176 + 4;
            if (v176 + 4 >= v182) {
              goto LABEL_124;
            }
            unint64_t v186 = *(void *)(v178 + 8 * v187);
            if (!v186)
            {
              int64_t v187 = v176 + 5;
              if (v176 + 5 >= v182) {
                goto LABEL_124;
              }
              unint64_t v186 = *(void *)(v178 + 8 * v187);
              if (!v186)
              {
                while (1)
                {
                  int64_t v176 = v187 + 1;
                  if (__OFADD__(v187, 1LL)) {
                    goto LABEL_164;
                  }
                  if (v176 >= v182) {
                    goto LABEL_124;
                  }
                  unint64_t v186 = *(void *)(v178 + 8 * v176);
                  ++v187;
                  if (v186) {
                    goto LABEL_118;
                  }
                }
              }
            }
          }
        }
      }

      int64_t v176 = v187;
    }

LABEL_118:
    unint64_t v188 = __clz(__rbit64(v186));
    unint64_t v181 = (v186 - 1) & v186;
    unint64_t v184 = v188 + (v176 << 6);
    goto LABEL_102;
  }

LABEL_124:
  swift_release(v175);
  os_log_type_t v190 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v244;
  LODWORD(v258) = v244(v252, 1LL, v75);
  LODWORD(v256) = v190(v235, 1LL, v75);
  uint64_t v59 = v255;
  uint64_t v77 = v232;
  sub_11374(v255, v232, &qword_18AD8);
  LODWORD(v254) = v190(v77, 1LL, v75);
  sub_113B8(v77, &qword_18AD8);
  LODWORD(v77) = v190(v59, 1LL, v75);
  v259 = 0LL;
  if (!(_DWORD)v77) {
    goto LABEL_128;
  }
  v257 = 0LL;
LABEL_129:
  uint64_t v194 = v233;
  sub_11374(v252, v233, &qword_18AD8);
  uint64_t v195 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v244)(v194, 1LL, v75);
  uint64_t v196 = v75;
  int v197 = v195;
  BOOL v198 = v195 == 1;
  if ((_DWORD)v195 == 1)
  {
    sub_113B8(v194, &qword_18AD8);
    uint64_t v199 = 0LL;
  }

  else
  {
    LODWORD(v253) = v77;
    uint64_t v77 = v194;
    uint64_t v199 = VUGallery.RecognitionResult.entityIdentifier.getter(v195);
    uint64_t v200 = v77;
    LODWORD(v77) = (_DWORD)v253;
    (*(void (**)(uint64_t, uint64_t))(v250 + 8))(v200, v196);
  }

  BOOL v202 = v197 != 1 && v257 == (void (*)(char *, uint64_t))v199;
  if ((_DWORD)v77) {
    BOOL v202 = v198;
  }
  LODWORD(v257) = v202;
  uint64_t v203 = v255;
  unsigned int v204 = v244(v255, 1LL, v196);
  uint64_t v205 = v196;
  if (v204)
  {
    v253 = 0LL;
  }

  else
  {
    uint64_t v206 = v250;
    v207 = v231;
    uint64_t v208 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v250 + 16))(v231, v203, v205);
    v253 = (char *)VUGallery.RecognitionResult.entityIdentifier.getter(v208);
    (*(void (**)(char *, uint64_t))(v206 + 8))(v207, v205);
  }

  uint64_t v209 = v234;
  sub_11374(v235, v234, &qword_18AD8);
  uint64_t v210 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v244)(v209, 1LL, v205);
  uint64_t v211 = v205;
  int v212 = v210;
  BOOL v213 = v210 == 1;
  if ((_DWORD)v210 == 1)
  {
    sub_113B8(v209, &qword_18AD8);
    uint64_t v215 = 0LL;
  }

  else
  {
    LODWORD(v249) = v204;
    uint64_t v214 = v209;
    uint64_t v215 = VUGallery.RecognitionResult.entityIdentifier.getter(v210);
    uint64_t v216 = v214;
    unsigned int v204 = v249;
    (*(void (**)(uint64_t, uint64_t))(v250 + 8))(v216, v211);
  }

  BOOL v218 = v212 != 1 && v253 == (char *)v215;
  if (v204) {
    BOOL v218 = v213;
  }
  LODWORD(v253) = v218;
  LODWORD(v254) = (_DWORD)v254 != 1;
  uint64_t v219 = sub_5460(&qword_18AF0);
  uint64_t inited = swift_initStackObject(v219, &v260);
  *(_OWORD *)(inited + 16) = xmmword_11CE0;
  *(void *)(inited + 32) = 0xD000000000000013LL;
  *(void *)(inited + 40) = 0x8000000000012150LL;
  swift_bridgeObjectRelease(v251);
  *(NSNumber *)(inited + 48) = Int._bridgeToObjectiveC()();
  strcpy((char *)(inited + 56), "selfiesCount");
  *(_BYTE *)(inited + 69) = 0;
  *(_WORD *)(inited + 70) = -5120;
  *(NSNumber *)(inited + 72) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 80) = 0xD000000000000017LL;
  *(void *)(inited + 88) = 0x8000000000012170LL;
  *(NSNumber *)(inited + 96) = Int._bridgeToObjectiveC()();
  *(void *)(inited + 104) = 0x6F43736F746F6870LL;
  *(void *)(inited + 112) = 0xEB00000000746E75LL;
  *(NSNumber *)(inited + 120) = Int._bridgeToObjectiveC()();
  strcpy((char *)(inited + 128), "meNodeInferred");
  *(_BYTE *)(inited + 143) = -18;
  *(NSNumber *)(inited + 144) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 152) = 0xD00000000000002ALL;
  *(void *)(inited + 160) = 0x8000000000012190LL;
  *(NSNumber *)(inited + 168) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 176) = 0xD000000000000013LL;
  *(void *)(inited + 184) = 0x80000000000121C0LL;
  *(NSNumber *)(inited + 192) = Bool._bridgeToObjectiveC()();
  strcpy((char *)(inited + 200), "meNodeAccuracy");
  *(_BYTE *)(inited + 215) = -18;
  *(NSNumber *)(inited + 216) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 224) = 0xD00000000000002ALL;
  *(void *)(inited + 232) = 0x80000000000121E0LL;
  *(NSNumber *)(inited + 240) = Bool._bridgeToObjectiveC()();
  unint64_t v221 = sub_5958(inited, &qword_18B00);
  NSString v222 = String._bridgeToObjectiveC()();
  uint64_t v223 = swift_allocObject(&unk_148A0, 24LL, 7LL);
  *(void *)(v223 + 16) = v221;
  v265 = sub_10F60;
  uint64_t v266 = v223;
  aBlock = _NSConcreteStackBlock;
  v189 = &loc_11000;
  uint64_t v262 = 1107296256LL;
  v263 = sub_5A6C;
  v264 = &unk_148B8;
  v224 = _Block_copy(&aBlock);
  swift_release(v266);
  AnalyticsSendEventLazy(v222, v224);
  _Block_release(v224);

  sub_113B8(v235, &qword_18AD8);
LABEL_155:
  CFAbsoluteTimeGetCurrent();
  uint64_t v225 = sub_5460(&qword_18AE8);
  uint64_t v226 = swift_initStackObject(v225, v267);
  *(_OWORD *)(v226 + 16) = xmmword_11CD0;
  *(void *)(v226 + 32) = 0xD000000000000020LL;
  *(void *)(v226 + 40) = 0x80000000000120C0LL;
  *(NSNumber *)(v226 + 48) = Double._bridgeToObjectiveC()();
  unint64_t v227 = sub_5958(v226, &qword_18B10);
  NSString v228 = String._bridgeToObjectiveC()();
  uint64_t v229 = swift_allocObject(&unk_14850, 24LL, 7LL);
  *(void *)(v229 + 16) = v227;
  v265 = sub_10F40;
  uint64_t v266 = v229;
  aBlock = _NSConcreteStackBlock;
  uint64_t v262 = v189[396];
  v263 = sub_5A6C;
  v264 = &unk_14868;
  v230 = _Block_copy(&aBlock);
  swift_release(v266);
  AnalyticsSendEventLazy(v228, v230);
  _Block_release(v230);

LABEL_156:
  sub_113B8(v252, &qword_18AD8);
  uint64_t v168 = v255;
  return sub_113B8(v168, &qword_18AD8);
}

uint64_t sub_10F1C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void sub_10F40()
{
}

uint64_t sub_10F48(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10F58(uint64_t a1)
{
  return swift_release(*(void *)(a1 + 40));
}

uint64_t sub_10F60()
{
  return swift_bridgeObjectRetain(*(void *)(v0 + 16));
}

uint64_t sub_10F68(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10F70()
{
  unint64_t result = qword_18B60;
  if (!qword_18B60)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_18B60);
  }

  return result;
}

_OWORD *sub_10FB4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10FC4(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_10FFC()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_11020()
{
  return swift_deallocObject(v0, 32LL, 7LL);
}

uint64_t sub_11030()
{
  swift_release(*(void *)(v0 + 32));
  swift_release(*(void *)(v0 + 40));
  swift_release(*(void *)(v0 + 48));
  return swift_deallocObject(v0, 56LL, 7LL);
}

void sub_11074(char a1, uint64_t a2)
{
}

unint64_t sub_11084()
{
  unint64_t result = qword_18BA8;
  if (!qword_18BA8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_18BA8);
  }

  return result;
}

uint64_t sub_110C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5460(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40LL))(a2, a1, v5);
  return a2;
}

void *sub_1110C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Calendar.Component(0LL);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v30 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9)
  {
    sub_5460(&qword_18BC8);
    uint64_t v10 = static _SetStorage.allocate(capacity:)(v9);
    uint64_t v11 = 0LL;
    uint64_t v12 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v31 = v9;
    uint64_t v32 = a1 + ((v12 + 32) & ~v12);
    uint64_t v13 = *(void *)(v3 + 72);
    unint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v35 = v10 + 56;
    while (1)
    {
      uint64_t v33 = v11;
      v34(v8, v32 + v13 * v11, v2);
      uint64_t v14 = *(void *)(v10 + 40);
      uint64_t v15 = sub_113F4( &qword_18BD0,  (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component,  (uint64_t)&protocol conformance descriptor for Calendar.Component);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)(v14, v2, v15);
      uint64_t v17 = ~(-1LL << *(_BYTE *)(v10 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v35 + 8 * v19);
      uint64_t v21 = 1LL << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        do
        {
          v34(v6, *(void *)(v10 + 48) + v18 * v13, v2);
          uint64_t v22 = sub_113F4( &qword_18BD8,  (uint64_t (*)(uint64_t))&type metadata accessor for Calendar.Component,  (uint64_t)&protocol conformance descriptor for Calendar.Component);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)(v6, v8, v2, v22);
          uint64_t v24 = v3;
          uint64_t v25 = *(void (**)(char *, uint64_t))(v3 + 8);
          v25(v6, v2);
          if ((v23 & 1) != 0)
          {
            v25(v8, v2);
            uint64_t v3 = v24;
            uint64_t v9 = v31;
            goto LABEL_4;
          }

          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v35 + 8 * (v18 >> 6));
          uint64_t v21 = 1LL << v18;
          uint64_t v3 = v24;
        }

        while ((v20 & (1LL << v18)) != 0);
        uint64_t v9 = v31;
      }

      *(void *)(v35 + 8 * v19) = v21 | v20;
      unint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))( *(void *)(v10 + 48) + v18 * v13,  v8,  v2);
      uint64_t v27 = *(void *)(v10 + 16);
      BOOL v28 = __OFADD__(v27, 1LL);
      uint64_t v29 = v27 + 1;
      if (v28) {
        break;
      }
      *(void *)(v10 + 16) = v29;
LABEL_4:
      uint64_t v11 = v33 + 1;
      if (v33 + 1 == v9) {
        return (void *)v10;
      }
    }

    __break(1u);
  }

  else
  {
    return &_swiftEmptySetSingleton;
  }

  return result;
}

uint64_t sub_11374(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_5460(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16LL))(a2, a1, v5);
  return a2;
}

uint64_t sub_113B8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5460(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8LL))(a1, v3);
  return a1;
}

uint64_t sub_113F4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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