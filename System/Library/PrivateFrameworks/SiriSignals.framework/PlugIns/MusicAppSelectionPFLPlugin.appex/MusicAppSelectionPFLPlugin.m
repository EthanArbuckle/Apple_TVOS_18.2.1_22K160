void sub_1000052EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  os_log_s *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  v3 = v2;
  v6 = (void *)BMSQLDatabase.execute(query:)();
  v7 = [v6 error];
  if (v7)
  {

    if (qword_100020B20 != -1) {
      swift_once(&qword_100020B20, sub_10000B850);
    }
    v8 = type metadata accessor for Logger(0LL);
    sub_100005D5C(v8, (uint64_t)qword_100022C60);
    v9 = v6;
    swift_bridgeObjectRetain_n(a2, 2LL);
    v10 = v9;
    v11 = (os_log_s *)Logger.logObject.getter(v10);
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc(22LL, -1LL);
      v14 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      v22 = swift_slowAlloc(32LL, -1LL);
      v24 = v22;
      *(_DWORD *)v13 = 136315394;
      swift_bridgeObjectRetain(a2);
      v23 = sub_100007F0C(a1, a2, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v13 + 4, v13 + 12);
      swift_bridgeObjectRelease_n(a2, 3LL);
      *(_WORD *)(v13 + 12) = 2112;
      v15 = [v10 error];
      if (v15)
      {
        v16 = _swift_stdlib_bridgeErrorToNSError(v15);
        v23 = v16;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v13 + 14, v13 + 22);
      }

      else
      {
        v23 = 0LL;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v13 + 14, v13 + 22);
        v16 = 0LL;
      }

      *v14 = v16;

      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Error executing %s in Biome: %@", (uint8_t *)v13, 0x16u);
      v18 = sub_100005DB8(&qword_100020C70);
      swift_arrayDestroy(v14, 1LL, v18);
      swift_slowDealloc(v14, -1LL, -1LL);
      swift_arrayDestroy(v22, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1LL, -1LL);
      swift_slowDealloc(v13, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(a2, 2LL);
    }

    v19 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = 0LL;

    v20 = sub_100005D74();
    swift_allocError(&type metadata for BiomeSQLClientError, v20, 0LL, 0LL);
    *v21 = 0;
    swift_willThrow();
  }

  else
  {
    v17 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v6;
  }
}

id sub_100005624()
{
  v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = [v1 error];
    if (v2)
    {
      v3 = v2;
      if (qword_100020B20 != -1) {
        swift_once(&qword_100020B20, sub_10000B850);
      }
      uint64_t v4 = type metadata accessor for Logger(0LL);
      sub_100005D5C(v4, (uint64_t)qword_100022C60);
      id v5 = v3;
      v6 = (os_log_s *)Logger.logObject.getter(v5);
      os_log_type_t v7 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        v9 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
        *(_DWORD *)v8 = 138412290;
        id v10 = v5;
        uint64_t v11 = _swift_stdlib_bridgeErrorToNSError(v10);
        uint64_t v26 = v11;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v8 + 4, v8 + 12);
        uint64_t *v9 = v11;

        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error in fetching row: %@", v8, 0xCu);
        uint64_t v12 = sub_100005DB8(&qword_100020C70);
        swift_arrayDestroy(v9, 1LL, v12);
        swift_slowDealloc(v9, -1LL, -1LL);
        swift_slowDealloc(v8, -1LL, -1LL);
      }

      else
      {
      }

      unint64_t v23 = sub_100005D74();
      swift_allocError(&type metadata for BiomeSQLClientError, v23, 0LL, 0LL);
      _BYTE *v24 = 0;
      swift_willThrow();

      return v5;
    }

    v13 = *(void **)(v0 + 16);
    if (v13)
    {
      id v14 = [v13 row];
      if (v14)
      {
        v15 = v14;
        uint64_t v16 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v14,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);

        id v5 = (id)sub_100005950(v16);
        swift_bridgeObjectRelease(v16);
        if (v5) {
          return v5;
        }
      }
    }
  }

  if (qword_100020B20 != -1) {
    swift_once(&qword_100020B20, sub_10000B850);
  }
  uint64_t v17 = type metadata accessor for Logger(0LL);
  uint64_t v18 = sub_100005D5C(v17, (uint64_t)qword_100022C60);
  id v5 = (id)Logger.logObject.getter(v18);
  os_log_type_t v19 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled((os_log_t)v5, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)v20 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  v19,  "Row cannot be converted into SiriPrivateLearningPFLBiomeSQLRow",  v20,  2u);
    swift_slowDealloc(v20, -1LL, -1LL);
  }

  unint64_t v21 = sub_100005D74();
  swift_allocError(&type metadata for BiomeSQLClientError, v21, 0LL, 0LL);
  _BYTE *v22 = 1;
  swift_willThrow();
  return v5;
}

unint64_t sub_100005950(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100005DB8(&qword_100020C78);
    v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v26 = a1 + 64;
  uint64_t v4 = -1LL;
  uint64_t v5 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1LL << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(a1 + 64);
  int64_t v25 = (unint64_t)(63 - v5) >> 6;
  unint64_t result = swift_bridgeObjectRetain(a1);
  int64_t v8 = 0LL;
  while (1)
  {
    if (v6)
    {
      uint64_t v11 = (v6 - 1) & v6;
      unint64_t v12 = __clz(__rbit64(v6)) | (v8 << 6);
      int64_t v13 = v8;
    }

    else
    {
      int64_t v14 = v8 + 1;
      if (__OFADD__(v8, 1LL)) {
        goto LABEL_37;
      }
      if (v14 >= v25)
      {
LABEL_33:
        sub_100005EB0(a1);
        return (unint64_t)v3;
      }

      unint64_t v15 = *(void *)(v26 + 8 * v14);
      int64_t v13 = v8 + 1;
      if (!v15)
      {
        int64_t v13 = v8 + 2;
        if (v8 + 2 >= v25) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v26 + 8 * v13);
        if (!v15)
        {
          int64_t v13 = v8 + 3;
          if (v8 + 3 >= v25) {
            goto LABEL_33;
          }
          unint64_t v15 = *(void *)(v26 + 8 * v13);
          if (!v15)
          {
            int64_t v13 = v8 + 4;
            if (v8 + 4 >= v25) {
              goto LABEL_33;
            }
            unint64_t v15 = *(void *)(v26 + 8 * v13);
            if (!v15)
            {
              int64_t v16 = v8 + 5;
              if (v8 + 5 >= v25) {
                goto LABEL_33;
              }
              unint64_t v15 = *(void *)(v26 + 8 * v16);
              if (!v15)
              {
                while (1)
                {
                  int64_t v13 = v16 + 1;
                  if (__OFADD__(v16, 1LL)) {
                    goto LABEL_38;
                  }
                  if (v13 >= v25) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = *(void *)(v26 + 8 * v13);
                  ++v16;
                  if (v15) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v13 = v8 + 5;
            }
          }
        }
      }

LABEL_26:
      uint64_t v11 = (v15 - 1) & v15;
      unint64_t v12 = __clz(__rbit64(v15)) + (v13 << 6);
    }

    sub_100005DF8(*(void *)(a1 + 48) + 40 * v12, (uint64_t)v37);
    sub_100005E34(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v38 + 8);
    v35[0] = v38[0];
    v35[1] = v38[1];
    uint64_t v36 = v39;
    v34[0] = v37[0];
    v34[1] = v37[1];
    sub_100005DF8((uint64_t)v34, (uint64_t)v29);
    if (!swift_dynamicCast(&v27, v29, &type metadata for AnyHashable, &type metadata for String, 6LL))
    {
      uint64_t v27 = 0LL;
      uint64_t v28 = 0LL;
      sub_100005E70((uint64_t)v34);
      swift_bridgeObjectRelease(v28);
      sub_100005EB0(a1);
      swift_release(v3);
      return 0LL;
    }

    uint64_t v17 = v27;
    uint64_t v18 = v28;
    sub_100005E34((uint64_t)v35 + 8, (uint64_t)v29);
    sub_100005E70((uint64_t)v34);
    sub_100005EB8(v29, v30);
    *(void *)&__int128 v31 = v17;
    *((void *)&v31 + 1) = v18;
    sub_100005EB8(v30, v32);
    __int128 v19 = v31;
    sub_100005EB8(v32, v33);
    sub_100005EB8(v33, &v31);
    unint64_t result = sub_10000854C(v19, *((uint64_t *)&v19 + 1));
    unint64_t v20 = result;
    if ((v21 & 1) != 0)
    {
      uint64_t v9 = v3[6] + 16 * result;
      swift_bridgeObjectRelease(*(void *)(v9 + 8));
      *(_OWORD *)uint64_t v9 = v19;
      id v10 = (void *)(v3[7] + 32 * v20);
      sub_100005EC8(v10);
      unint64_t result = (unint64_t)sub_100005EB8(&v31, v10);
      goto LABEL_8;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    *(_OWORD *)(v3[6] + 16 * result) = v19;
    unint64_t result = (unint64_t)sub_100005EB8(&v31, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v22 = v3[2];
    BOOL v23 = __OFADD__(v22, 1LL);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_36;
    }
    v3[2] = v24;
LABEL_8:
    int64_t v8 = v13;
    unint64_t v6 = v11;
  }

  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

        uint64_t v9 = (v19 - 1) & v19;
        uint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }

      char v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
      uint64_t v22 = *v21;
      BOOL v23 = v21[1];
      Hasher.init(_seed:)(v34, *(void *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      unint64_t result = Hasher._finalize()();
      uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
      int64_t v25 = result & ~v24;
      uint64_t v26 = v25 >> 6;
      if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        int64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        uint64_t v27 = 0;
        uint64_t v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }

          v29 = v26 == v28;
          if (v26 == v28) {
            uint64_t v26 = 0LL;
          }
          v27 |= v29;
          v30 = *(void *)(v11 + 8 * v26);
        }

        while (v30 == -1);
        int64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }

      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
      unint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
      void *v15 = v22;
      v15[1] = v23;
      ++*(void *)(v6 + 16);
    }
  }

  unint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

        uint64_t v9 = (v18 - 1) & v18;
        int64_t v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }

      unint64_t v20 = *(void *)(v3 + 48) + 40 * v16;
      char v21 = *(void *)v20;
      uint64_t v22 = *(void *)(v20 + 8);
      BOOL v23 = *(void *)(v20 + 16);
      uint64_t v24 = *(void *)(v20 + 24);
      int64_t v25 = *(unsigned __int8 *)(v20 + 32);
      Hasher.init(_seed:)(v40, *(void *)(v6 + 40));
      swift_bridgeObjectRetain(v22);
      String.hash(into:)(v40, v21, v22);
      swift_bridgeObjectRelease(v22);
      swift_bridgeObjectRetain(v24);
      String.hash(into:)(v40, v23, v24);
      swift_bridgeObjectRelease(v24);
      if (v25) {
        uint64_t v26 = 0x64656E69617254LL;
      }
      else {
        uint64_t v26 = 0x656E696C65736142LL;
      }
      if (v25) {
        uint64_t v27 = 0xE700000000000000LL;
      }
      else {
        uint64_t v27 = 0xE800000000000000LL;
      }
      String.hash(into:)(v40, v26, v27);
      swift_bridgeObjectRelease(v27);
      String.hash(into:)(v40, 0x72616C616353LL, 0xE600000000000000LL);
      unint64_t result = Hasher._finalize()();
      uint64_t v28 = -1LL << *(_BYTE *)(v6 + 32);
      v29 = result & ~v28;
      v30 = v29 >> 6;
      if (((-1LL << v29) & ~*(void *)(v10 + 8 * (v29 >> 6))) != 0)
      {
        int64_t v13 = __clz(__rbit64((-1LL << v29) & ~*(void *)(v10 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        __int128 v31 = 0;
        v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_47;
          }

          v33 = v30 == v32;
          if (v30 == v32) {
            v30 = 0LL;
          }
          v31 |= v33;
          v34 = *(void *)(v10 + 8 * v30);
        }

        while (v34 == -1);
        int64_t v13 = __clz(__rbit64(~v34)) + (v30 << 6);
      }

      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v13;
      int64_t v14 = *(void *)(v6 + 48) + 40 * v13;
      *(void *)int64_t v14 = v21;
      *(void *)(v14 + 8) = v22;
      *(void *)(v14 + 16) = v23;
      *(void *)(v14 + 24) = v24;
      *(_BYTE *)(v14 + 32) = v25;
      ++*(void *)(v6 + 16);
    }
  }

  unint64_t result = swift_release(v3);
  *uint64_t v2 = v6;
  return result;
}

    id v10 = (v19 - 1) & v19;
    uint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    char v21 = (uint64_t *)(*(void *)(v3 + 48) + 16 * v17);
    uint64_t v22 = *v21;
    BOOL v23 = v21[1];
    Hasher.init(_seed:)(v33, *(void *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    unint64_t result = Hasher._finalize()();
    uint64_t v24 = -1LL << *(_BYTE *)(v6 + 32);
    int64_t v25 = result & ~v24;
    uint64_t v26 = v25 >> 6;
    if (((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      int64_t v14 = __clz(__rbit64((-1LL << v25) & ~*(void *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v27 = 0;
      uint64_t v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }

        v29 = v26 == v28;
        if (v26 == v28) {
          uint64_t v26 = 0LL;
        }
        v27 |= v29;
        v30 = *(void *)(v11 + 8 * v26);
      }

      while (v30 == -1);
      int64_t v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }

    *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    unint64_t v15 = (void *)(*(void *)(v6 + 48) + 16 * v14);
    void *v15 = v22;
    v15[1] = v23;
    ++*(void *)(v6 + 16);
  }

  unint64_t v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    unint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v31;
    goto LABEL_38;
  }

  __int128 v19 = *(void *)(v8 + 8 * v20);
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
    __int128 v19 = *(void *)(v8 + 8 * v13);
    ++v20;
    if (v19) {
      goto LABEL_26;
    }
  }

    uint64_t v9 = (v18 - 1) & v18;
    int64_t v16 = __clz(__rbit64(v18)) + (v12 << 6);
LABEL_27:
    unint64_t v20 = *(void *)(v3 + 48) + 40 * v16;
    char v21 = *(void *)v20;
    uint64_t v22 = *(void *)(v20 + 8);
    BOOL v23 = *(void *)(v20 + 16);
    uint64_t v24 = *(void *)(v20 + 24);
    int64_t v25 = *(unsigned __int8 *)(v20 + 32);
    Hasher.init(_seed:)(v39, *(void *)(v6 + 40));
    swift_bridgeObjectRetain_n(v22, 2LL);
    swift_bridgeObjectRetain(v24);
    String.hash(into:)(v39, v21, v22);
    swift_bridgeObjectRelease(v22);
    swift_bridgeObjectRetain(v24);
    String.hash(into:)(v39, v23, v24);
    swift_bridgeObjectRelease(v24);
    if (v25) {
      uint64_t v26 = 0x64656E69617254LL;
    }
    else {
      uint64_t v26 = 0x656E696C65736142LL;
    }
    if (v25) {
      uint64_t v27 = 0xE700000000000000LL;
    }
    else {
      uint64_t v27 = 0xE800000000000000LL;
    }
    String.hash(into:)(v39, v26, v27);
    swift_bridgeObjectRelease(v27);
    String.hash(into:)(v39, 0x72616C616353LL, 0xE600000000000000LL);
    unint64_t result = Hasher._finalize()();
    uint64_t v28 = -1LL << *(_BYTE *)(v6 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1LL << v29) & ~*(void *)(v10 + 8 * (v29 >> 6))) != 0)
    {
      int64_t v13 = __clz(__rbit64((-1LL << v29) & ~*(void *)(v10 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      __int128 v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }

        v33 = v30 == v32;
        if (v30 == v32) {
          v30 = 0LL;
        }
        v31 |= v33;
        v34 = *(void *)(v10 + 8 * v30);
      }

      while (v34 == -1);
      int64_t v13 = __clz(__rbit64(~v34)) + (v30 << 6);
    }

    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v13;
    int64_t v14 = *(void *)(v6 + 48) + 40 * v13;
    *(void *)int64_t v14 = v21;
    *(void *)(v14 + 8) = v22;
    *(void *)(v14 + 16) = v23;
    *(void *)(v14 + 24) = v24;
    *(_BYTE *)(v14 + 32) = v25;
    ++*(void *)(v6 + 16);
  }

  __int128 v19 = v17 + 3;
  if (v19 >= v37)
  {
LABEL_42:
    unint64_t result = swift_release_n(v3, 2LL);
    uint64_t v2 = v35;
    goto LABEL_44;
  }

  uint64_t v18 = *(void *)(v36 + 8 * v19);
  if (v18)
  {
    unint64_t v12 = v19;
    goto LABEL_26;
  }

  while (1)
  {
    unint64_t v12 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v12 >= v37) {
      goto LABEL_42;
    }
    uint64_t v18 = *(void *)(v36 + 8 * v12);
    ++v19;
    if (v18) {
      goto LABEL_26;
    }
  }

  uint64_t v39 = (v22 - 1) & v22;
  unint64_t v20 = __clz(__rbit64(v22)) + (v23 << 6);
  for (i = v23; ; unint64_t v20 = __clz(__rbit64(v6)) | (i << 6))
  {
    int64_t v25 = (uint64_t *)(*(void *)(v1 + 48) + 16 * v20);
    uint64_t v26 = v25[1];
    uint64_t v27 = *(_DWORD *)(*(void *)(v1 + 56) + 4 * v20);
    v41 = *v25;
    v42 = v26;
    v40 = v27;
    swift_bridgeObjectRetain(v26);
    swift_dynamicCast(v7, &v40, v12, v11, 7LL);
    uint64_t v28 = v41;
    v29 = v42;
    sub_100005EB8(v7, v8);
    sub_100005EB8(v8, v46);
    sub_100005EB8(v46, &v44);
    unint64_t result = sub_10000854C(v28, v29);
    v30 = result;
    if ((v31 & 1) != 0)
    {
      v38 = i;
      int64_t v13 = v8;
      int64_t v14 = v7;
      unint64_t v15 = v1;
      int64_t v16 = v12;
      uint64_t v17 = v11;
      uint64_t v18 = (uint64_t *)(v3[6] + 16 * result);
      swift_bridgeObjectRelease(v18[1]);
      *uint64_t v18 = v28;
      v18[1] = v29;
      uint64_t v11 = v17;
      unint64_t v12 = v16;
      v1 = v15;
      os_log_type_t v7 = v14;
      int64_t v8 = v13;
      i = v38;
      __int128 v19 = (void *)(v3[7] + 32 * v30);
      sub_100005EC8(v19);
      unint64_t result = (unint64_t)sub_100005EB8(&v44, v19);
      unint64_t v6 = v39;
      if (!v39) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    if (v3[2] >= v3[3]) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    v32 = (uint64_t *)(v3[6] + 16 * result);
    *v32 = v28;
    v32[1] = v29;
    unint64_t result = (unint64_t)sub_100005EB8(&v44, (_OWORD *)(v3[7] + 32 * result));
    v33 = v3[2];
    v34 = __OFADD__(v33, 1LL);
    v35 = v33 + 1;
    if (v34) {
      goto LABEL_34;
    }
    v3[2] = v35;
    unint64_t v6 = v39;
    if (!v39) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v39 = (v6 - 1) & v6;
  }

  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_100005D10()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for BiomeSQLClient()
{
  return objc_opt_self(&OBJC_CLASS____TtC26MusicAppSelectionPFLPlugin14BiomeSQLClient);
}

uint64_t sub_100005D5C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(void *)(a1 - 8) + 82LL) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_100005D74()
{
  unint64_t result = qword_100020C68;
  if (!qword_100020C68)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for BiomeSQLClientError,  &type metadata for BiomeSQLClientError);
    atomic_store(result, (unint64_t *)&qword_100020C68);
  }

  return result;
}

uint64_t sub_100005DB8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

uint64_t sub_100005DF8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100005E34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005E70(uint64_t a1)
{
  uint64_t v2 = sub_100005DB8(&qword_100020C80);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_100005EB0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

_OWORD *sub_100005EB8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100005EC8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100005EE8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005DB8(&qword_100020C78);
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
    sub_10000A0F8(v7, (uint64_t)&v16);
    uint64_t v8 = v16;
    uint64_t v9 = v17;
    unint64_t result = sub_10000854C(v16, v17);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
    unint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *unint64_t v12 = v8;
    v12[1] = v9;
    unint64_t result = (unint64_t)sub_100005EB8(&v18, (_OWORD *)(v4[7] + 32 * result));
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4[2] = v15;
    v7 += 48LL;
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

unint64_t sub_100006010(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2)
  {
    uint64_t v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }

  sub_100005DB8(&qword_100020F20);
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
  uint64_t v6 = (_DWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v7 = *((void *)v6 - 2);
    uint64_t v8 = *((void *)v6 - 1);
    int v9 = *v6;
    swift_bridgeObjectRetain(v8);
    unint64_t result = sub_10000854C(v7, v8);
    if ((v11 & 1) != 0) {
      break;
    }
    *(void *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    unint64_t v12 = (uint64_t *)(v4[6] + 16 * result);
    *unint64_t v12 = v7;
    v12[1] = v8;
    *(_DWORD *)(v4[7] + 4 * result) = v9;
    uint64_t v13 = v4[2];
    BOOL v14 = __OFADD__(v13, 1LL);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v6 += 6;
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

unint64_t sub_100006120(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    goto LABEL_11;
  }

  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v6 = v4[7];
  uint64_t v7 = v4[8];
  swift_bridgeObjectRetain(v7);
  unint64_t v8 = sub_10000854C(v6, v7);
  if ((v9 & 1) == 0)
  {
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    swift_bridgeObjectRelease(v7);
    goto LABEL_11;
  }

  sub_100005E34(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v55);
  swift_bridgeObjectRelease(v7);
  if (!*((void *)&v56 + 1))
  {
LABEL_11:
    sub_10000A80C((uint64_t)&v55);
    goto LABEL_12;
  }

  if (swift_dynamicCast(&v53, &v55, (char *)&type metadata for Any + 8, &type metadata for Int, 6LL))
  {
    uint64_t v10 = v53;
    unint64_t result = sub_100006644(a1);
    if (!v3)
    {
      uint64_t v13 = result;
      int v14 = v12;
      uint64_t v15 = v4 + 2;
      swift_beginAccess(v4 + 2, &v55, 0LL, 0LL);
      uint64_t v16 = v4[2];
      if (*(void *)(v16 + 16) && (unint64_t v17 = sub_1000085B0(v10), (v18 & 1) != 0))
      {
        uint64_t v19 = *(void *)(*(void *)(v16 + 56) + 8 * v17);
        uint64_t v20 = *(void *)(v19 + 16);
        swift_retain(v19);
        swift_retain(v20);
        sub_100007ADC(v13);
        swift_release(v20);
        v41 = (void *)(v19 + 24);
        swift_beginAccess(v19 + 24, &v53, 33LL, 0LL);
        v42 = *(void **)(v19 + 24);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v42);
        *(void *)(v19 + 24) = v42;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v42 = sub_100007E00(0LL, v42[2] + 1LL, 1, v42);
          void *v41 = v42;
        }

        unint64_t v44 = v42[2];
        unint64_t v45 = v42[3];
        unint64_t v46 = v44 + 1;
        if (v44 >= v45 >> 1)
        {
          unint64_t v52 = v44 + 1;
          v49 = v42;
          unint64_t v50 = v42[2];
          v51 = sub_100007E00((void *)(v45 > 1), v44 + 1, 1, v49);
          unint64_t v44 = v50;
          unint64_t v46 = v52;
          v42 = v51;
          void *v41 = v51;
        }

        v42[2] = v46;
        *((_DWORD *)v42 + v44 + 8) = v14;
        swift_endAccess(&v53);
        swift_bridgeObjectRelease(v13);
        swift_beginAccess(v15, &v53, 33LL, 0LL);
        swift_retain(v19);
        char v47 = swift_isUniquelyReferenced_nonNull_native(*v15);
        uint64_t v57 = *v15;
        void *v15 = 0x8000000000000000LL;
        sub_100008D14(v19, v10, v47);
        uint64_t v48 = *v15;
        void *v15 = v57;
        swift_bridgeObjectRelease(v48);
        swift_endAccess(&v53);
        return swift_release(v19);
      }

      else
      {
        if (qword_100020B20 != -1) {
          swift_once(&qword_100020B20, sub_10000B850);
        }
        uint64_t v28 = type metadata accessor for Logger(0LL);
        uint64_t v29 = sub_100005D5C(v28, (uint64_t)qword_100022C60);
        v30 = (os_log_s *)Logger.logObject.getter(v29);
        os_log_type_t v31 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
          *(_DWORD *)v32 = 134217984;
          uint64_t v53 = v10;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v53, &v54, v32 + 4, v32 + 12);
          _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "Initializing training data for aggregating value %ld",  v32,  0xCu);
          swift_slowDealloc(v32, -1LL, -1LL);
        }

        uint64_t v33 = sub_100005DB8(&qword_100020F08);
        uint64_t v34 = swift_allocObject(v33, 32LL, 7LL);
        uint64_t v35 = sub_100005DB8(&qword_100020F10);
        uint64_t v36 = (void *)swift_allocObject(v35, 40LL, 7LL);
        v36[3] = 1LL;
        v36[4] = *(void *)(v13 + 16);
        v36[2] = v13;
        *(void *)(v34 + 16) = v36;
        uint64_t v37 = sub_100005DB8(&qword_100020EB8);
        uint64_t v38 = swift_allocObject(v37, 36LL, 7LL);
        *(_OWORD *)(v38 + 16) = xmmword_100017C30;
        *(_DWORD *)(v38 + 32) = v14;
        *(void *)(v34 + 24) = v38;
        swift_beginAccess(v15, &v53, 33LL, 0LL);
        char v39 = swift_isUniquelyReferenced_nonNull_native(*v15);
        uint64_t v57 = *v15;
        void *v15 = 0x8000000000000000LL;
        sub_100008D14(v34, v10, v39);
        uint64_t v40 = *v15;
        void *v15 = v57;
        swift_bridgeObjectRelease(v40);
        return swift_endAccess(&v53);
      }
    }

    return result;
  }

LABEL_12:
  if (qword_100020B20 != -1) {
    swift_once(&qword_100020B20, sub_10000B850);
  }
  uint64_t v21 = type metadata accessor for Logger(0LL);
  uint64_t v22 = sub_100005D5C(v21, (uint64_t)qword_100022C60);
  BOOL v23 = (os_log_s *)Logger.logObject.getter(v22);
  os_log_type_t v24 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v23, v24))
  {
    int64_t v25 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)int64_t v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "aggregatingValue not found.", v25, 2u);
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  unint64_t v26 = sub_100009438();
  swift_allocError(&type metadata for BiomeSQLRowAggregatorError, v26, 0LL, 0LL);
  *uint64_t v27 = 2;
  return swift_willThrow();
}

unint64_t sub_100006644(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = v1[9];
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5)
  {
    unint64_t v9 = (unint64_t)&_swiftEmptyArrayStorage;
LABEL_22:
    uint64_t v20 = v2[10];
    unint64_t v19 = v2[11];
    if (*(void *)(a1 + 16))
    {
      swift_bridgeObjectRetain(v2[11]);
      unint64_t v21 = sub_10000854C(v20, v19);
      if ((v22 & 1) != 0)
      {
        sub_100005E34(*(void *)(a1 + 56) + 32 * v21, (uint64_t)&v55);
      }

      else
      {
        __int128 v55 = 0u;
        __int128 v56 = 0u;
      }

      swift_bridgeObjectRelease(v19);
      if (*((void *)&v56 + 1))
      {
        sub_100005EB8(&v55, v57);
        unint64_t v23 = sub_10000A450((uint64_t)v57);
        sub_100005EC8(v57);
        if ((v23 & 0x100000000LL) == 0) {
          return v9;
        }
        swift_bridgeObjectRelease(v9);
LABEL_32:
        if (qword_100020B20 != -1) {
          swift_once(&qword_100020B20, sub_10000B850);
        }
        uint64_t v24 = type metadata accessor for Logger(0LL);
        sub_100005D5C(v24, (uint64_t)qword_100022C60);
        swift_bridgeObjectRetain_n(a1, 2LL);
        uint64_t v25 = swift_retain(v2);
        unint64_t v26 = (os_log_s *)Logger.logObject.getter(v25);
        os_log_type_t v27 = static os_log_type_t.error.getter();
        unint64_t v9 = v27;
        if (os_log_type_enabled(v26, v27))
        {
          uint64_t v28 = swift_slowAlloc(22LL, -1LL);
          uint64_t v53 = swift_slowAlloc(64LL, -1LL);
          *(void *)&v57[0] = v53;
          *(_DWORD *)uint64_t v28 = 136315394;
          swift_bridgeObjectRetain(v19);
          *(void *)&__int128 v55 = sub_100007F0C(v20, v19, (uint64_t *)v57);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, (char *)&v55 + 8, v28 + 4, v28 + 12);
          swift_release(v2);
          swift_bridgeObjectRelease(v19);
          *(_WORD *)(v28 + 12) = 2080;
          swift_bridgeObjectRetain(a1);
          uint64_t v29 = Dictionary.description.getter( a1,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
          unint64_t v31 = v30;
          swift_bridgeObjectRelease(a1);
          *(void *)&__int128 v55 = sub_100007F0C(v29, v31, (uint64_t *)v57);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, (char *)&v55 + 8, v28 + 14, v28 + 22);
          swift_bridgeObjectRelease_n(a1, 2LL);
          swift_bridgeObjectRelease(v31);
          _os_log_impl( (void *)&_mh_execute_header,  v26,  (os_log_type_t)v9,  "Couldn't find %s value in %s",  (uint8_t *)v28,  0x16u);
          swift_arrayDestroy(v53, 2LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v53, -1LL, -1LL);
          uint64_t v32 = v28;
LABEL_42:
          swift_slowDealloc(v32, -1LL, -1LL);
        }

        else
        {

          swift_bridgeObjectRelease_n(a1, 2LL);
          swift_release(v2);
        }

        goto LABEL_43;
      }
    }

    else
    {
      __int128 v55 = 0u;
      __int128 v56 = 0u;
    }

    swift_bridgeObjectRelease(v9);
    sub_10000A80C((uint64_t)&v55);
    goto LABEL_32;
  }

  v51 = v1;
  uint64_t v7 = v1[10];
  uint64_t v6 = v1[11];
  uint64_t v52 = swift_bridgeObjectRetain(v4);
  unint64_t v8 = (unint64_t *)(v52 + 40);
  unint64_t v9 = (unint64_t)&_swiftEmptyArrayStorage;
  while (1)
  {
    uint64_t v11 = *(v8 - 1);
    unint64_t v10 = *v8;
    BOOL v12 = v11 == v7 && v10 == v6;
    if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)(*(v8 - 1), *v8, v7, v6, 0LL) & 1) != 0) {
      goto LABEL_4;
    }
    if (!*(void *)(a1 + 16)) {
      break;
    }
    swift_bridgeObjectRetain_n(v10, 2LL);
    unint64_t v13 = sub_10000854C(v11, v10);
    if ((v14 & 1) != 0)
    {
      sub_100005E34(*(void *)(a1 + 56) + 32 * v13, (uint64_t)&v55);
    }

    else
    {
      __int128 v55 = 0u;
      __int128 v56 = 0u;
    }

    swift_bridgeObjectRelease(v10);
    if (!*((void *)&v56 + 1)) {
      goto LABEL_38;
    }
    sub_100005EB8(&v55, v57);
    unint64_t v15 = sub_10000A450((uint64_t)v57);
    if ((v15 & 0x100000000LL) != 0)
    {
      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(v52);
      if (qword_100020B20 != -1) {
        swift_once(&qword_100020B20, sub_10000B850);
      }
      uint64_t v43 = type metadata accessor for Logger(0LL);
      sub_100005D5C(v43, (uint64_t)qword_100022C60);
      uint64_t v44 = swift_bridgeObjectRetain(v10);
      unint64_t v45 = (os_log_s *)Logger.logObject.getter(v44);
      os_log_type_t v46 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v45, v46))
      {
        char v47 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v48 = swift_slowAlloc(32LL, -1LL);
        *(void *)&__int128 v55 = v48;
        *(_DWORD *)char v47 = 136315138;
        unint64_t v9 = (unint64_t)(v47 + 12);
        swift_bridgeObjectRetain(v10);
        uint64_t v58 = sub_100007F0C(v11, v10, (uint64_t *)&v55);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v58, &v59, v47 + 4, v47 + 12);
        swift_bridgeObjectRelease_n(v10, 3LL);
        _os_log_impl((void *)&_mh_execute_header, v45, v46, "Unable to convert value for %s to float", v47, 0xCu);
        swift_arrayDestroy(v48, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v48, -1LL, -1LL);
        swift_slowDealloc(v47, -1LL, -1LL);
      }

      else
      {

        swift_bridgeObjectRelease_n(v10, 2LL);
      }

      unint64_t v49 = sub_100009438();
      swift_allocError(&type metadata for BiomeSQLRowAggregatorError, v49, 0LL, 0LL);
      *unint64_t v50 = 4;
      swift_willThrow();
      sub_100005EC8(v57);
      return v9;
    }

    int v16 = v15;
    swift_bridgeObjectRelease(v10);
    if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0) {
      unint64_t v9 = (unint64_t)sub_100007E00(0LL, *(void *)(v9 + 16) + 1LL, 1, (void *)v9);
    }
    unint64_t v18 = *(void *)(v9 + 16);
    unint64_t v17 = *(void *)(v9 + 24);
    if (v18 >= v17 >> 1) {
      unint64_t v9 = (unint64_t)sub_100007E00((void *)(v17 > 1), v18 + 1, 1, (void *)v9);
    }
    *(void *)(v9 + 16) = v18 + 1;
    *(_DWORD *)(v9 + 4 * v18 + 32) = v16;
    sub_100005EC8(v57);
LABEL_4:
    v8 += 2;
    if (!--v5)
    {
      swift_bridgeObjectRelease(v52);
      uint64_t v2 = v51;
      goto LABEL_22;
    }
  }

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  swift_bridgeObjectRetain(v10);
LABEL_38:
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v52);
  sub_10000A80C((uint64_t)&v55);
  if (qword_100020B20 != -1) {
    swift_once(&qword_100020B20, sub_10000B850);
  }
  uint64_t v33 = type metadata accessor for Logger(0LL);
  sub_100005D5C(v33, (uint64_t)qword_100022C60);
  swift_bridgeObjectRetain_n(a1, 2LL);
  uint64_t v34 = swift_bridgeObjectRetain(v10);
  unint64_t v26 = (os_log_s *)Logger.logObject.getter(v34);
  os_log_type_t v35 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v26, v35))
  {
    uint64_t v36 = swift_slowAlloc(22LL, -1LL);
    uint64_t v54 = swift_slowAlloc(64LL, -1LL);
    *(void *)&v57[0] = v54;
    *(_DWORD *)uint64_t v36 = 136315394;
    swift_bridgeObjectRetain(v10);
    *(void *)&__int128 v55 = sub_100007F0C(v11, v10, (uint64_t *)v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, (char *)&v55 + 8, v36 + 4, v36 + 12);
    swift_bridgeObjectRelease_n(v10, 3LL);
    *(_WORD *)(v36 + 12) = 2080;
    uint64_t v37 = swift_bridgeObjectRetain(a1);
    uint64_t v38 = Dictionary.description.getter( v37,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
    unint64_t v9 = v39;
    swift_bridgeObjectRelease(a1);
    *(void *)&__int128 v55 = sub_100007F0C(v38, v9, (uint64_t *)v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v55, (char *)&v55 + 8, v36 + 14, v36 + 22);
    swift_bridgeObjectRelease_n(a1, 2LL);
    swift_bridgeObjectRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v26, v35, "Couldn't find %s value in %s", (uint8_t *)v36, 0x16u);
    swift_arrayDestroy(v54, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v54, -1LL, -1LL);
    uint64_t v32 = v36;
    goto LABEL_42;
  }

  swift_bridgeObjectRelease_n(a1, 2LL);
  swift_bridgeObjectRelease_n(v10, 2LL);
LABEL_43:
  unint64_t v40 = sub_100009438();
  swift_allocError(&type metadata for BiomeSQLRowAggregatorError, v40, 0LL, 0LL);
  _BYTE *v41 = 4;
  swift_willThrow();
  return v9;
}

uint64_t sub_100006E70()
{
  v76 = *(void **)(v0[9] + 16LL);
  swift_beginAccess(v0 + 2, v80, 0LL, 0LL);
  v71 = v0;
  uint64_t v2 = v0[2];
  uint64_t v3 = swift_bridgeObjectRetain(v2);
  uint64_t v4 = sub_100009354(v3);
  swift_bridgeObjectRelease(v2);
  v78 = v4;
  swift_bridgeObjectRetain(v4);
  sub_1000092EC(&v78);
  if (v1)
  {
    uint64_t result = swift_release(v78);
    __break(1u);
  }

  else
  {
    swift_release(v4);
    uint64_t v5 = v78;
    uint64_t v6 = v78[2];
    if (v6)
    {
      uint64_t v7 = 40LL;
      v70 = v78;
      while (1)
      {
        uint64_t v8 = *(void *)((char *)v5 + v7);
        uint64_t v9 = *(void *)(v8 + 16);
        unint64_t v10 = *(void **)(v9 + 32);
        if (v10 != v76) {
          break;
        }
        uint64_t v72 = v7;
        uint64_t v73 = v6;
        swift_beginAccess(v9 + 16, &v78, 33LL, 0LL);
        uint64_t v11 = *(void **)(v9 + 16);
        swift_retain(v8);
        swift_retain(v9);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v11);
        *(void *)(v9 + 16) = v11;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v11 = sub_10000A0AC(v11);
        }
        *(void *)(v9 + 16) = v11;
        swift_endAccess(&v78);
        swift_release(v9);
        swift_beginAccess(v8 + 24, &v78, 33LL, 0LL);
        unint64_t v13 = *(void **)(v8 + 24);
        char v14 = swift_isUniquelyReferenced_nonNull_native(v13);
        *(void *)(v8 + 24) = v13;
        uint64_t v75 = v8;
        if ((v14 & 1) == 0) {
          unint64_t v13 = sub_10000A0AC(v13);
        }
        v74 = v11 + 4;
        *(void *)(v8 + 24) = v13;
        swift_endAccess(&v78);
        uint64_t v15 = sub_100005DB8(&qword_100020E88);
        uint64_t v16 = swift_allocObject(v15, 48LL, 7LL);
        *(_OWORD *)(v16 + 16) = xmmword_100017C40;
        *(NSNumber *)(v16 + 32) = Int._bridgeToObjectiveC()();
        *(NSNumber *)(v16 + 40) = Int._bridgeToObjectiveC()();
        v78 = (void *)v16;
        ((void (*)(void))specialized Array._endMutation())();
        unint64_t v17 = v78;
        uint64_t v18 = swift_allocObject(v15, 48LL, 7LL);
        *(_OWORD *)(v18 + 16) = xmmword_100017C40;
        *(NSNumber *)(v18 + 32) = Int._bridgeToObjectiveC()();
        *(NSNumber *)(v18 + 40) = Int._bridgeToObjectiveC()();
        v78 = (void *)v18;
        ((void (*)(void))specialized Array._endMutation())();
        unint64_t v19 = v78;
        id v20 = objc_allocWithZone(&OBJC_CLASS___MLMultiArray);
        sub_10000A0C0(0LL, &qword_100020E90, &OBJC_CLASS___NSNumber_ptr);
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v17);
        Class v22 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v19);
        v78 = 0LL;
        id v23 = [v20 initWithDataPointer:v74 shape:isa dataType:65568 strides:v22 deallocator:0 error:&v78];

        id v24 = v78;
        if (!v23)
        {
          uint64_t v5 = v78;
          uint64_t v56 = _convertNSErrorToError(_:)(v24);

          swift_willThrow();
          swift_release(v70);
LABEL_23:
          swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
          if (qword_100020B20 != -1) {
            swift_once(&qword_100020B20, sub_10000B850);
          }
          uint64_t v57 = type metadata accessor for Logger(0LL);
          sub_100005D5C(v57, (uint64_t)qword_100022C60);
          swift_errorRetain(v56);
          uint64_t v58 = swift_errorRetain(v56);
          uint64_t v59 = (os_log_s *)Logger.logObject.getter(v58);
          os_log_type_t v60 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v59, v60))
          {
            v61 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
            v62 = (void *)swift_slowAlloc(8LL, -1LL);
            *(_DWORD *)v61 = 138412290;
            uint64_t v5 = v61 + 12;
            swift_errorRetain(v56);
            v63 = (void *)_swift_stdlib_bridgeErrorToNSError(v56);
            v78 = v63;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, v79, v61 + 4, v61 + 12);
            void *v62 = v63;
            swift_errorRelease(v56);
            swift_errorRelease(v56);
            _os_log_impl((void *)&_mh_execute_header, v59, v60, "Error forming MLBatchProvider: %@", v61, 0xCu);
            uint64_t v64 = sub_100005DB8(&qword_100020C70);
            swift_arrayDestroy(v62, 1LL, v64);
            swift_slowDealloc(v62, -1LL, -1LL);
            swift_slowDealloc(v61, -1LL, -1LL);
          }

          else
          {
            swift_errorRelease(v56);
            swift_errorRelease(v56);
          }

          uint64_t v8 = v75;

          unint64_t v65 = sub_100009438();
          swift_allocError(&type metadata for BiomeSQLRowAggregatorError, v65, 0LL, 0LL);
          _BYTE *v66 = 6;
          swift_willThrow();
          swift_errorRelease(v56);
          goto LABEL_29;
        }

        uint64_t v25 = swift_allocObject(v15, 40LL, 7LL);
        *(_OWORD *)(v25 + 16) = xmmword_100017C50;
        id v26 = v24;
        *(NSNumber *)(v25 + 32) = Int._bridgeToObjectiveC()();
        v78 = (void *)v25;
        ((void (*)(void))specialized Array._endMutation())();
        os_log_type_t v27 = v78;
        uint64_t v28 = swift_allocObject(v15, 40LL, 7LL);
        *(_OWORD *)(v28 + 16) = xmmword_100017C50;
        *(NSNumber *)(v28 + 32) = NSNumber.init(integerLiteral:)(1LL);
        v78 = (void *)v28;
        ((void (*)(void))specialized Array._endMutation())();
        uint64_t v29 = v78;
        id v30 = objc_allocWithZone(&OBJC_CLASS___MLMultiArray);
        Class v31 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v27);
        Class v32 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease(v29);
        v78 = 0LL;
        id v33 = [v30 initWithDataPointer:v13 + 4 shape:v31 dataType:65568 strides:v32 deallocator:0 error:&v78];

        id v34 = v78;
        if (!v33)
        {
          uint64_t v5 = v78;
          uint64_t v56 = _convertNSErrorToError(_:)(v34);

          swift_willThrow();
          swift_release(v70);

          goto LABEL_23;
        }

        uint64_t v35 = sub_100005DB8(&qword_100020E98);
        uint64_t inited = swift_initStackObject(v35, v77);
        *(_OWORD *)(inited + 16) = xmmword_100017C60;
        uint64_t v37 = v71[4];
        *(void *)(inited + 32) = v71[3];
        *(void *)(inited + 40) = v37;
        uint64_t v38 = sub_10000A0C0(0LL, &qword_100020EA0, &OBJC_CLASS___MLMultiArray_ptr);
        *(void *)(inited + 72) = v38;
        *(void *)(inited + 48) = v23;
        uint64_t v39 = v71[6];
        *(void *)(inited + 80) = v71[5];
        *(void *)(inited + 88) = v39;
        *(void *)(inited + 120) = v38;
        *(void *)(inited + 96) = v33;
        id v40 = v34;
        swift_bridgeObjectRetain(v37);
        id v41 = v23;
        swift_bridgeObjectRetain(v39);
        id v42 = v33;
        unint64_t v43 = sub_100005EE8(inited);
        id v44 = objc_allocWithZone(&OBJC_CLASS___MLDictionaryFeatureProvider);
        id v45 = sub_100007D1C(v43);
        uint64_t v5 = v70;
        id v46 = v45;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        unint64_t v48 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x10);
        unint64_t v47 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8LL) + 0x18);
        if (v48 >= v47 >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v47 > 1, v48 + 1, 1LL);
        }
        uint64_t v49 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v48, v46);
        specialized Array._endMutation()(v49);
        swift_release(v75);

        uint64_t v7 = v72 + 16;
        uint64_t v6 = v73 - 1;
        if (v73 == 1)
        {
          swift_release(v70);
          goto LABEL_30;
        }
      }

      swift_retain(*(void *)((char *)v5 + v7));
      swift_release(v5);
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      if (qword_100020B20 != -1) {
        swift_once(&qword_100020B20, sub_10000B850);
      }
      uint64_t v50 = type metadata accessor for Logger(0LL);
      uint64_t v51 = sub_100005D5C(v50, (uint64_t)qword_100022C60);
      uint64_t v52 = (os_log_s *)Logger.logObject.getter(v51);
      os_log_type_t v53 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v52, v53))
      {
        uint64_t v5 = (_WORD *)swift_slowAlloc(22LL, -1LL);
        *(_DWORD *)uint64_t v5 = 134218240;
        v78 = v10;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, v79, v5 + 2, v5 + 6);
        v5[6] = 2048;
        v78 = v76;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v78, v79, v5 + 7, v5 + 11);
        _os_log_impl( (void *)&_mh_execute_header,  v52,  v53,  "Mismatch in number of columns in trainingData %ld and number of features in arg %ld",  (uint8_t *)v5,  0x16u);
        swift_slowDealloc(v5, -1LL, -1LL);
      }

      unint64_t v54 = sub_100009438();
      swift_allocError(&type metadata for BiomeSQLRowAggregatorError, v54, 0LL, 0LL);
      *__int128 v55 = 5;
      swift_willThrow();
LABEL_29:
      swift_release(v8);
    }

    else
    {
      swift_release(v78);
LABEL_30:
      id v67 = objc_allocWithZone(&OBJC_CLASS___MLArrayBatchProvider);
      sub_100005DB8(&qword_100020EA8);
      Class v68 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(_swiftEmptyArrayStorage);
      uint64_t v5 = [v67 initWithFeatureProviderArray:v68];
    }

    return (uint64_t)v5;
  }

  return result;
}

uint64_t sub_1000077AC()
{
  return swift_deallocClassInstance(v0, 96LL, 7LL);
}

uint64_t type metadata accessor for BiomeSQLRowAggregator()
{
  return objc_opt_self(&OBJC_CLASS____TtC26MusicAppSelectionPFLPlugin21BiomeSQLRowAggregator);
}

uint64_t sub_10000781C(uint64_t a1)
{
  v2[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  v2[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  return swift_initClassMetadata2(a1, 0LL, 2LL, v2, a1 + 96);
}

uint64_t sub_10000786C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(v4 + 80);
  uint64_t v8 = *(void *)(v4 + 88);
  type metadata accessor for InputMatrix(0LL, v7, v8, a4);
  uint64_t v9 = *(void **)(a1 + 16);
  unint64_t v10 = *(void **)(a2 + 16);
  swift_retain(v9);
  swift_retain(v10);
  BOOL v11 = sub_100007974(v9, v10);
  swift_release(v9);
  swift_release(v10);
  if (v11)
  {
    swift_beginAccess(a1 + 24, v17, 0LL, 0LL);
    uint64_t v12 = *(void *)(a1 + 24);
    swift_beginAccess(a2 + 24, &v16, 0LL, 0LL);
    uint64_t v13 = *(void *)(a2 + 24);
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v13);
    char v14 = static Array<A>.== infix(_:_:)(v12, v13, v7, v8);
    swift_bridgeObjectRelease(v12);
    swift_bridgeObjectRelease(v13);
  }

  else
  {
    char v14 = 0;
  }

  return v14 & 1;
}

BOOL sub_100007974(void *a1, void *a2)
{
  uint64_t v5 = a1[2];
  swift_beginAccess(a2 + 2, &v10, 0LL, 0LL);
  uint64_t v6 = a2[2];
  uint64_t v8 = *(void *)(v2 + 80);
  uint64_t v7 = *(void *)(v2 + 88);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  LOBYTE(v7) = static Array<A>.== infix(_:_:)(v5, v6, v8, v7);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  return (v7 & 1) != 0 && a1[3] == a2[3] && a1[4] == a2[4];
}

uint64_t sub_100007A44()
{
  return swift_deallocClassInstance(v0, 32LL, 7LL);
}

uint64_t type metadata accessor for TrainingData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000A910(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TrainingData);
}

uint64_t sub_100007A7C(uint64_t a1)
{
  v2[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v2[1] = (char *)&value witness table for Builtin.Int64 + 64;
  void v2[2] = (char *)&value witness table for Builtin.Int64 + 64;
  return swift_initClassMetadata2(a1, 0LL, 3LL, v2, a1 + 96);
}

uint64_t sub_100007AD0(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_10000786C(*a1, *a2, a3, a4);
}

uint64_t sub_100007ADC(uint64_t a1)
{
  uint64_t v2 = v1;
  if (*(void *)(a1 + 16) == *(void *)(v1 + 32))
  {
    swift_beginAccess(v2 + 16, v11, 33LL, 0LL);
    uint64_t v4 = swift_bridgeObjectRetain(a1);
    sub_100007B9C(v4);
    uint64_t result = swift_endAccess(v11);
    uint64_t v6 = *(void *)(v2 + 24);
    BOOL v7 = __OFADD__(v6, 1LL);
    uint64_t v8 = v6 + 1;
    if (v7) {
      __break(1u);
    }
    else {
      *(void *)(v2 + 24) = v8;
    }
  }

  else
  {
    unint64_t v9 = sub_100009438();
    swift_allocError(&type metadata for BiomeSQLRowAggregatorError, v9, 0LL, 0LL);
    *uint64_t v10 = 3;
    return swift_willThrow();
  }

  return result;
}

uint64_t sub_100007B9C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = (void *)*v1;
  int64_t v4 = *(void *)(*v1 + 16LL);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }

  char isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }

  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_100007E00(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }

LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }

  unint64_t v9 = (char *)v3 + 4 * v8 + 32;
  memcpy(v9, (const void *)(a1 + 32), 4 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease(a1);
    void *v1 = v3;
    return result;
  }

  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }

  *a1 = v8;
  if ((a6 & 0x8000000000000000LL) != 0) {
    return 0LL;
  }
  else {
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
  }
}

LABEL_23:
  __break(1u);
LABEL_24:
  char v16 = 2;
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  v16,  1092LL,  0);
  __break(1u);
  return result;
}

          uint64_t v18 = (v22 - 1) & v22;
          id v20 = __clz(__rbit64(v22)) + (v13 << 6);
        }

        id v24 = (unint64_t *)(*(void *)(v62 + 48) + 16 * v20);
        uint64_t v2 = *v24;
        uint64_t v3 = v24[1];
        swift_bridgeObjectRetain(v3);
        uint64_t v25 = String._bridgeToObjectiveC()();
        id v26 = [v61 featureValueForName:v25];

        if (!v26) {
          break;
        }
        if (*(void *)(isUniquelyReferenced_nonNull_native + 16))
        {
          swift_bridgeObjectRetain(v3);
          os_log_type_t v27 = sub_10000854C(v2, v3);
          uint64_t v28 = 0.0;
          if ((v29 & 1) != 0) {
            uint64_t v28 = *(float *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 4 * v27);
          }
          swift_bridgeObjectRelease(v3);
        }

        else
        {
          uint64_t v28 = 0.0;
        }

        sub_100010570(v26);
        if (v4)
        {
          swift_bridgeObjectRelease(isUniquelyReferenced_nonNull_native);
          swift_unknownObjectRelease(v61);
          swift_bridgeObjectRelease(v3);

          swift_release(v62);
          return isUniquelyReferenced_nonNull_native;
        }

        Class v31 = v30;
        Class v32 = isUniquelyReferenced_nonNull_native;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(isUniquelyReferenced_nonNull_native);
        unint64_t v65 = v32;
        id v33 = v2;
        uint64_t v2 = sub_10000854C(v2, v3);
        uint64_t v35 = *(void *)(v32 + 16);
        uint64_t v36 = (v34 & 1) == 0;
        uint64_t v37 = v35 + v36;
        if (__OFADD__(v35, v36))
        {
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
          goto LABEL_57;
        }

        uint64_t v38 = v34;
        if (*(void *)(v32 + 24) >= v37)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
            sub_100009140();
          }
        }

        else
        {
          sub_100008A10(v37, isUniquelyReferenced_nonNull_native);
          uint64_t v39 = sub_10000854C(v33, v3);
          if ((v38 & 1) != (v40 & 1))
          {
            uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
            __break(1u);
            return result;
          }

          uint64_t v2 = v39;
        }

        id v41 = v28 + v31;
        char isUniquelyReferenced_nonNull_native = v65;
        if ((v38 & 1) != 0)
        {
          *(float *)(*(void *)(v65 + 56) + 4 * v2) = v41;
        }

        else
        {
          *(void *)(v65 + 8 * (v2 >> 6) + 64) |= 1LL << v2;
          id v42 = (uint64_t *)(*(void *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v2);
          void *v42 = v33;
          v42[1] = v3;
          *(float *)(*(void *)(isUniquelyReferenced_nonNull_native + 56) + 4 * v2) = v41;
          unint64_t v43 = *(void *)(isUniquelyReferenced_nonNull_native + 16);
          unint64_t v21 = __OFADD__(v43, 1LL);
          id v44 = v43 + 1;
          if (v21) {
            goto LABEL_54;
          }
          *(void *)(isUniquelyReferenced_nonNull_native + 16) = v44;
          swift_bridgeObjectRetain(v3);
        }

        swift_bridgeObjectRelease(v3);
        swift_bridgeObjectRelease(0x8000000000000000LL);
        int64_t v4 = 0LL;
      }

      if (qword_100020B20 != -1) {
        goto LABEL_59;
      }
      goto LABEL_47;
    }

uint64_t sub_100007CE0()
{
  return swift_deallocClassInstance(v0, 40LL, 7LL);
}

uint64_t type metadata accessor for InputMatrix(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000A910(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InputMatrix);
}

BOOL sub_100007D10(void **a1, void **a2)
{
  return sub_100007974(*a1, *a2);
}

id sub_100007D1C(uint64_t a1)
{
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  id v9 = 0LL;
  id v4 = [v1 initWithDictionary:isa error:&v9];

  id v5 = v9;
  if (v4)
  {
    id v6 = v9;
  }

  else
  {
    id v7 = v9;
    _convertNSErrorToError(_:)(v5);

    swift_willThrow();
  }

  return v4;
}

void *sub_100007E00(void *result, int64_t a2, char a3, void *a4)
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
      uint64_t v10 = sub_100005DB8(&qword_100020EB8);
      uint64_t v11 = (void *)swift_allocObject(v10, 4 * v9 + 32, 7LL);
      int64_t v12 = j__malloc_size(v11);
      uint64_t v13 = v12 - 32;
      if (v12 < 32) {
        uint64_t v13 = v12 - 29;
      }
      v11[2] = v8;
      v11[3] = 2 * (v13 >> 2);
      int64_t v14 = v11 + 4;
      if ((v5 & 1) != 0) {
        goto LABEL_15;
      }
    }

    else
    {
      uint64_t v11 = &_swiftEmptyArrayStorage;
      int64_t v14 = &_swiftEmptyArrayStorage + 4;
      if ((result & 1) != 0)
      {
LABEL_15:
        a4[2] = 0LL;
        goto LABEL_24;
      }
    }

    sub_10000A720(0LL, v8, (char *)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }

  __break(1u);
  return result;
}

uint64_t sub_100007F0C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007FDC(v12, 0LL, 0LL, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005E34((uint64_t)v12, *a3);
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
      sub_100005E34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }

    swift_bridgeObjectRetain(a2);
  }

  sub_100005EC8(v12);
  return v7;
}

uint64_t sub_100007FDC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100008194(a5, a6);
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

  sub_100005EC8(v27);
  LOBYTE(v26[0]) = v20;
  return LODWORD(v14) | ((unint64_t)v20 << 32);
}

uint64_t sub_100008194(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100008228(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100008400(0, *(void *)(v2 + 16) + 1LL, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100008400(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100008228(uint64_t a1, unint64_t a2)
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
      char v5 = sub_10000839C(v4, 0LL);
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

void *sub_10000839C(uint64_t a1, uint64_t a2)
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
  uint64_t v4 = sub_100005DB8(&qword_100020F00);
  char v5 = (void *)swift_allocObject(v4, v2 + 32, 7LL);
  size_t v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100008400(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005DB8(&qword_100020F00);
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

  __break(1u);
  return result;
}

unint64_t sub_10000854C(uint64_t a1, uint64_t a2)
{
  Swift::Int v5 = Hasher._finalize()();
  return sub_1000085E0(a1, a2, v5);
}

unint64_t sub_1000085B0(uint64_t a1)
{
  uint64_t v3 = static Hasher._hash(seed:_:)(*(void *)(v1 + 40), a1);
  return sub_1000086C0(a1, v3);
}

unint64_t sub_1000085E0(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_1000086C0(uint64_t a1, uint64_t a2)
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

uint64_t sub_10000875C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005DB8(&qword_100020F18);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v9 = 0LL;
    uint64_t v10 = (uint64_t *)(v5 + 64);
    uint64_t v11 = 1LL << *(_BYTE *)(v5 + 32);
    uint64_t v33 = -1LL << v11;
    uint64_t v34 = v11;
    if (v11 < 64) {
      uint64_t v12 = ~(-1LL << v11);
    }
    else {
      uint64_t v12 = -1LL;
    }
    unint64_t v13 = v12 & *(void *)(v5 + 64);
    int64_t v35 = (unint64_t)(v11 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v13)
      {
        unint64_t v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v21 = v20 | (v9 << 6);
      }

      else
      {
        int64_t v22 = v9 + 1;
        if (__OFADD__(v9, 1LL))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }

        if (v22 >= v35) {
          goto LABEL_36;
        }
        unint64_t v23 = v10[v22];
        ++v9;
        if (!v23)
        {
          int64_t v9 = v22 + 1;
          if (v22 + 1 >= v35) {
            goto LABEL_36;
          }
          unint64_t v23 = v10[v9];
          if (!v23)
          {
            int64_t v24 = v22 + 2;
            if (v24 >= v35)
            {
LABEL_36:
              if ((a2 & 1) != 0)
              {
                if (v34 >= 64) {
                  bzero((void *)(v5 + 64), 8 * v35);
                }
                else {
                  *uint64_t v10 = v33;
                }
                *(void *)(v5 + 16) = 0LL;
              }

              break;
            }

            unint64_t v23 = v10[v24];
            if (!v23)
            {
              while (1)
              {
                int64_t v9 = v24 + 1;
                if (__OFADD__(v24, 1LL)) {
                  goto LABEL_44;
                }
                if (v9 >= v35) {
                  goto LABEL_36;
                }
                unint64_t v23 = v10[v9];
                ++v24;
                if (v23) {
                  goto LABEL_33;
                }
              }
            }

            int64_t v9 = v24;
          }
        }

LABEL_33:
        unint64_t v13 = (v23 - 1) & v23;
        unint64_t v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }

      uint64_t v29 = 8 * v21;
      uint64_t v30 = *(void *)(v5 + 56);
      uint64_t v31 = *(void *)(*(void *)(v5 + 48) + v29);
      uint64_t v32 = *(void *)(v30 + v29);
      if ((a2 & 1) == 0) {
        swift_retain(*(void *)(v30 + v29));
      }
      uint64_t result = static Hasher._hash(seed:_:)(*(void *)(v8 + 40), v31);
      uint64_t v15 = -1LL << *(_BYTE *)(v8 + 32);
      unint64_t v16 = result & ~v15;
      unint64_t v17 = v16 >> 6;
      if (((-1LL << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
      {
        unint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
      }

      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }

          BOOL v27 = v17 == v26;
          if (v17 == v26) {
            unint64_t v17 = 0LL;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v14 + 8 * v17);
        }

        while (v28 == -1);
        unint64_t v18 = __clz(__rbit64(~v28)) + (v17 << 6);
      }

      *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
      uint64_t v19 = 8 * v18;
      *(void *)(*(void *)(v8 + 48) + v19) = v31;
      *(void *)(*(void *)(v8 + 56) + v19) = v32;
      ++*(void *)(v8 + 16);
    }
  }

  uint64_t result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

    uint64_t v11 = (v25 - 1) & v25;
    int64_t v22 = __clz(__rbit64(v25)) + (v15 << 6);
LABEL_34:
    uint64_t v31 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v22);
    uint64_t v33 = *v31;
    uint64_t v32 = v31[1];
    uint64_t v34 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v22);
    if ((v38 & 1) == 0) {
      swift_bridgeObjectRetain(v31[1]);
    }
    Hasher.init(_seed:)(v39, *(void *)(v8 + 40));
    String.hash(into:)(v39, v33, v32);
    uint64_t result = Hasher._finalize()();
    unint64_t v16 = -1LL << *(_BYTE *)(v8 + 32);
    unint64_t v17 = result & ~v16;
    unint64_t v18 = v17 >> 6;
    if (((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
    {
      uint64_t v19 = __clz(__rbit64((-1LL << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      BOOL v27 = 0;
      uint64_t v28 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        uint64_t v29 = v18 == v28;
        if (v18 == v28) {
          unint64_t v18 = 0LL;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v13 + 8 * v18);
      }

      while (v30 == -1);
      uint64_t v19 = __clz(__rbit64(~v30)) + (v18 << 6);
    }

    *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v19;
    unint64_t v20 = (void *)(*(void *)(v8 + 48) + 16 * v19);
    uint8_t *v20 = v33;
    v20[1] = v32;
    *(_DWORD *)(*(void *)(v8 + 56) + 4 * v19) = v34;
    ++*(void *)(v8 + 16);
  }

  swift_release(v5);
  uint64_t v3 = v36;
  int64_t v24 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_39:
  int64_t v35 = 1LL << *(_BYTE *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v24, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
  }
  else {
    _BYTE *v24 = -1LL << v35;
  }
  *(void *)(v5 + 16) = 0LL;
LABEL_43:
  uint64_t result = swift_release(v5);
  uint64_t *v3 = v8;
  return result;
}

      v80 = (v31 - 1) & v31;
      v81 = v32;
      uint64_t v29 = __clz(__rbit64(v31)) + (v32 << 6);
    }

    uint64_t v34 = *(void *)(a1 + 48) + 40 * v29;
    uint64_t v6 = *(void *)(v34 + 8);
    v82 = *(void *)v34;
    uint64_t v5 = *(void *)(v34 + 16);
    a3 = *(void **)(v34 + 24);
    int64_t v35 = *(_BYTE *)(v34 + 32);
    uint64_t v36 = v79;
    uint64_t v37 = *(void *)(v79 + 16);
    swift_bridgeObjectRetain(a3);
    if (!v37)
    {
      swift_bridgeObjectRetain(v6);
      unint64_t v65 = v78;
      goto LABEL_66;
    }

    swift_bridgeObjectRetain(a3);
    swift_bridgeObjectRetain(v6);
    uint64_t v38 = sub_10000854C(v5, (uint64_t)a3);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRelease(a3);
      unint64_t v65 = v78;
      goto LABEL_66;
    }

    id v40 = *(_DWORD *)(*(void *)(v79 + 56) + 4 * v38);
    swift_bridgeObjectRelease(a3);
    if (!*(void *)(v78 + 16)) {
      goto LABEL_65;
    }
    id v41 = v6;
    uint64_t v6 = 0LL;
    swift_bridgeObjectRetain(a3);
    id v42 = sub_10000854C(v5, (uint64_t)a3);
    if ((v43 & 1) == 0) {
      break;
    }
    id v44 = *(_DWORD *)(*(void *)(v78 + 56) + 4 * v42);
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRetain(v41);
    uint64_t v5 = swift_isUniquelyReferenced_nonNull_native(v13);
    if ((v35 & 1) != 0)
    {
      v85 = v13;
      a1 = sub_10000854C(v82, v41);
      id v46 = v13[2];
      unint64_t v47 = (v45 & 1) == 0;
      unint64_t v48 = v46 + v47;
      if (__OFADD__(v46, v47))
      {
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
        goto LABEL_77;
      }

      uint64_t v49 = v45;
      if (v13[3] >= v48)
      {
        uint64_t v6 = v41;
        if ((v5 & 1) != 0)
        {
          unint64_t v13 = v85;
          if ((v45 & 1) != 0) {
            goto LABEL_53;
          }
        }

        else
        {
          sub_100009140();
          unint64_t v13 = v85;
          if ((v49 & 1) != 0) {
            goto LABEL_53;
          }
        }
      }

      else
      {
        sub_100008A10(v48, v5);
        uint64_t v6 = v41;
        uint64_t v50 = sub_10000854C(v82, v41);
        if ((v49 & 1) != (v51 & 1)) {
          goto LABEL_79;
        }
        a1 = v50;
        unint64_t v13 = v85;
        if ((v49 & 1) != 0)
        {
LABEL_53:
          *(_DWORD *)(v13[7] + 4 * a1) = v44;
          goto LABEL_17;
        }
      }

      v13[(a1 >> 6) + 8] |= 1LL << a1;
      uint64_t v52 = (uint64_t *)(v13[6] + 16 * a1);
      *uint64_t v52 = v82;
      v52[1] = v6;
      *(_DWORD *)(v13[7] + 4 * a1) = v44;
      os_log_type_t v53 = v13[2];
      unint64_t v54 = __OFADD__(v53, 1LL);
      __int128 v55 = v53 + 1;
      if (v54) {
        goto LABEL_76;
      }
    }

    else
    {
      v85 = v13;
      a1 = sub_10000854C(v82, v41);
      uint64_t v57 = v13[2];
      uint64_t v58 = (v56 & 1) == 0;
      uint64_t v59 = v57 + v58;
      if (__OFADD__(v57, v58)) {
        goto LABEL_73;
      }
      os_log_type_t v60 = v56;
      if (v13[3] >= v59)
      {
        uint64_t v6 = v41;
        if ((v5 & 1) != 0)
        {
          unint64_t v13 = v85;
          if ((v56 & 1) != 0) {
            goto LABEL_16;
          }
        }

        else
        {
          sub_100009140();
          unint64_t v13 = v85;
          if ((v60 & 1) != 0) {
            goto LABEL_16;
          }
        }
      }

      else
      {
        sub_100008A10(v59, v5);
        uint64_t v6 = v41;
        v61 = sub_10000854C(v82, v41);
        if ((v60 & 1) != (v62 & 1)) {
          goto LABEL_79;
        }
        a1 = v61;
        unint64_t v13 = v85;
        if ((v60 & 1) != 0)
        {
LABEL_16:
          *(_DWORD *)(v13[7] + 4 * a1) = v40;
          goto LABEL_17;
        }
      }

      v13[(a1 >> 6) + 8] |= 1LL << a1;
      v63 = (uint64_t *)(v13[6] + 16 * a1);
      void *v63 = v82;
      v63[1] = v6;
      *(_DWORD *)(v13[7] + 4 * a1) = v40;
      uint64_t v64 = v13[2];
      unint64_t v54 = __OFADD__(v64, 1LL);
      __int128 v55 = v64 + 1;
      if (v54) {
        goto LABEL_75;
      }
    }

    v13[2] = v55;
    swift_bridgeObjectRetain(v6);
LABEL_17:
    a1 = v75;
    uint64_t v15 = v76;
    unint64_t v17 = v77;
    uint64_t v28 = v81;
    swift_bridgeObjectRelease(a3);
    swift_bridgeObjectRelease_n(v6, 2LL);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    BOOL v27 = v80;
  }

  swift_bridgeObjectRelease(a3);
  uint64_t v36 = v79;
  uint64_t v6 = v41;
LABEL_65:
  unint64_t v65 = v78;
LABEL_66:
  swift_bridgeObjectRelease(v65);
  swift_bridgeObjectRelease(v36);
  swift_bridgeObjectRelease(v13);
  if (qword_100020B20 == -1) {
    goto LABEL_67;
  }
LABEL_77:
  swift_once(&qword_100020B20, sub_10000B850);
LABEL_67:
  v66 = type metadata accessor for Logger(0LL);
  sub_100005D5C(v66, (uint64_t)qword_100022C60);
  swift_bridgeObjectRetain(a3);
  id v67 = swift_bridgeObjectRetain(v6);
  Class v68 = (os_log_s *)Logger.logObject.getter(v67);
  v69 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    unint64_t v13 = (void *)swift_slowAlloc(32LL, -1LL);
    v85 = v13;
    *(_DWORD *)v70 = 136315138;
    swift_bridgeObjectRetain(a3);
    v83 = sub_100007F0C(v5, (unint64_t)a3, (uint64_t *)&v85);
    a1 = v75;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v83, &v84, v70 + 4, v70 + 12);
    swift_bridgeObjectRelease_n(v6, 2LL);
    swift_bridgeObjectRelease_n(a3, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v68, v69, "Baseline/Trained metric value not found for %s", v70, 0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v70, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(a3, 2LL);
    swift_bridgeObjectRelease_n(v6, 2LL);
  }

  v71 = sub_100010EEC();
  swift_allocError(&type metadata for ModelTrainerError, v71, 0LL, 0LL);
  *uint64_t v72 = 4;
  swift_willThrow();
  swift_release(a1);
  swift_unknownObjectRelease(v77);
  swift_unknownObjectRelease(v76);
  return (uint64_t)v13;
}

Swift::Int sub_100008A10(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  if (*(void *)(*v2 + 24) <= a1) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)(*v2 + 24);
  }
  sub_100005DB8(&qword_100020F20);
  char v38 = a2;
  uint64_t v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  uint64_t v8 = v7;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_43;
  }
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v36 = v3;
  uint64_t v37 = v5 + 64;
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
      unint64_t v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
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

    if (v23 >= v12) {
      break;
    }
    int64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v37 + 8 * v23);
    ++v15;
    if (!v25)
    {
      int64_t v15 = v23 + 1;
      if (v23 + 1 >= v12) {
        goto LABEL_36;
      }
      unint64_t v25 = *(void *)(v37 + 8 * v15);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v12)
        {
LABEL_36:
          swift_release(v5);
          uint64_t v3 = v36;
          if ((v38 & 1) == 0) {
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
            if (v15 >= v12) {
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

uint64_t sub_100008D14(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_1000085B0(a2);
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
    uint64_t result = (uint64_t)sub_100008FA0();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release(*(void *)(v17 + 8 * v10));
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }

LABEL_11:
    v16[(v10 >> 6) + 8] |= 1LL << v10;
    uint64_t v19 = 8 * v10;
    *(void *)(v16[6] + v19) = a2;
    *(void *)(v16[7] + v19) = a1;
    uint64_t v20 = v16[2];
    BOOL v21 = __OFADD__(v20, 1LL);
    uint64_t v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }

    goto LABEL_14;
  }

  sub_10000875C(result, a3 & 1);
  uint64_t result = sub_1000085B0(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if ((v14 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

    v18[(v12 >> 6) + 8] |= 1LL << v12;
    uint64_t v20 = (uint64_t *)(v18[6] + 16 * v12);
    void *v20 = a1;
    v20[1] = a2;
    *(float *)(v18[7] + 4 * v12) = a4;
    BOOL v21 = v18[2];
    uint64_t v22 = __OFADD__(v21, 1LL);
    int64_t v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain(a2);
    }

    goto LABEL_14;
  }

  sub_100008A10(result, a3 & 1);
  uint64_t result = sub_10000854C(a1, a2);
  if ((v16 & 1) == (v19 & 1))
  {
    BOOL v12 = result;
    char v18 = (void *)*v5;
    if ((v16 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for Int);
  __break(1u);
  return result;
}

  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100008E4C(uint64_t a1, uint64_t a2, char a3, float a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10000854C(a1, a2);
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
  if (v17 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_100009140();
LABEL_7:
    char v18 = (void *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(float *)(v18[7] + 4 * v12) = a4;
      return result;
    }

void *sub_100008FA0()
{
  uint64_t v1 = v0;
  sub_100005DB8(&qword_100020F18);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

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

    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v18 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19) {
        break;
      }
    }

LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    uint64_t result = (void *)swift_retain(v17);
  }

  int64_t v20 = v18 + 2;
  if (v20 >= v13) {
    goto LABEL_26;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_25;
    }
  }

    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    int64_t v18 = v17[1];
    unint64_t v19 = 4 * v15;
    int64_t v20 = *(_DWORD *)(*(void *)(v2 + 56) + v19);
    uint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v21 = *v17;
    v21[1] = v18;
    *(_DWORD *)(*(void *)(v4 + 56) + v19) = v20;
    uint64_t result = (void *)swift_bridgeObjectRetain(v18);
  }

  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  uint64_t v23 = *(void *)(v6 + 8 * v24);
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
    uint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }

LABEL_28:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void *sub_100009140()
{
  uint64_t v1 = v0;
  sub_100005DB8(&qword_100020F20);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

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

Swift::Int sub_1000092EC(void *a1)
{
  uint64_t v2 = (void *)*a1;
  if ((swift_isUniquelyReferenced_nonNull_native(*a1) & 1) == 0) {
    uint64_t v2 = (void *)sub_10000A140(v2);
  }
  uint64_t v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  Swift::Int result = sub_1000095B0(v5);
  *a1 = v2;
  return result;
}

void *sub_100009354(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v3 = sub_100005DB8(&qword_100020ED0);
  uint64_t v4 = (void *)swift_allocObject(v3, 16 * v1 + 32, 7LL);
  int64_t v5 = j__malloc_size(v4);
  uint64_t v6 = v5 - 32;
  if (v5 < 32) {
    uint64_t v6 = v5 - 17;
  }
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  uint64_t v7 = sub_10000A154((uint64_t)&v10, v4 + 4, v1, a1);
  uint64_t v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_100005EB0(v8);
  if (v7 != v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }

  return v4;
}

unint64_t sub_100009438()
{
  unint64_t result = qword_100020E80;
  if (!qword_100020E80)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for BiomeSQLRowAggregatorError,  &type metadata for BiomeSQLRowAggregatorError);
    atomic_store(result, (unint64_t *)&qword_100020E80);
  }

  return result;
}

char *sub_10000947C(char *a1, uint64_t a2)
{
  if (!a2) {
    return (char *)_swiftEmptyArrayStorage;
  }
  if (a2 <= 0)
  {
    unint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize with negative count",  51LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1090LL,  0);
  }

  else
  {
    uint64_t v4 = sub_100005DB8(&qword_100020EB8);
    uint64_t v5 = 4 * a2;
    uint64_t v6 = (char *)swift_allocObject(v4, 4 * a2 + 32, 7LL);
    int64_t v7 = j__malloc_size(v6);
    uint64_t v8 = v7 - 32;
    if (v7 < 32) {
      uint64_t v8 = v7 - 29;
    }
    *((void *)v6 + 2) = a2;
    *((void *)v6 + 3) = 2 * (v8 >> 2);
    int64_t v9 = v6 + 32;
    if (&v6[v5 + 32] <= a1 || v9 >= &a1[v5])
    {
      memcpy(v9, a1, 4 * a2);
      return v6;
    }

    unint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.initialize overlapping range",  49LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1092LL,  0);
  }

  __break(1u);
  return result;
}

Swift::Int sub_1000095B0(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000LL) == 0)
    {
      uint64_t v88 = 0LL;
      uint64_t v89 = *a1;
      uint64_t v90 = 1LL;
      while (1)
      {
        uint64_t v91 = *(void *)(v89 + 16 * v90);
        uint64_t v92 = v88;
        do
        {
          if (v91 >= *(void *)(v89 + v92)) {
            break;
          }
          if (!v89) {
            goto LABEL_142;
          }
          v93 = (void *)(v89 + v92);
          uint64_t v94 = *(void *)(v89 + v92 + 24);
          *(_OWORD *)(v89 + v92 + 16) = *(_OWORD *)(v89 + v92);
          void *v93 = v91;
          v93[1] = v94;
          v92 -= 16LL;
        }

        while (v92 != -16);
        ++v90;
        v88 += 16LL;
        if (v90 == v3) {
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
  v102 = a1;
  if (v3 < 2)
  {
    uint64_t v10 = _swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v14 = _swiftEmptyArrayStorage[2];
      int64_t v13 = (char *)_swiftEmptyArrayStorage;
      goto LABEL_104;
    }

    v104 = _swiftEmptyArrayStorage;
  }

  else
  {
    uint64_t v7 = v5 >> 1;
    uint64_t v8 = sub_100005DB8(&qword_100020EC0);
    uint64_t v9 = static Array._allocateBufferUninitialized(minimumCapacity:)(v7, v8);
    *(void *)(v9 + 16) = v7;
    v104 = (void *)v9;
    __dst = (char *)(v9 + 32);
  }

  Swift::Int v11 = 0LL;
  uint64_t v12 = *a1;
  uint64_t v103 = *a1 + 32;
  uint64_t v101 = *a1 - 16;
  int64_t v13 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v105 = v6;
  Swift::Int v106 = v3;
  uint64_t v107 = v12;
  while (1)
  {
    Swift::Int v15 = v11++;
    if (v11 < v3)
    {
      uint64_t v16 = *(void *)(v12 + 16 * v11);
      uint64_t v17 = 16 * v15;
      uint64_t v18 = *(void *)(v12 + 16 * v15);
      Swift::Int v11 = v15 + 2;
      if (v15 + 2 < v3)
      {
        uint64_t v19 = (uint64_t *)(v103 + 16 * v15);
        uint64_t v20 = v16;
        while (1)
        {
          uint64_t v22 = *v19;
          v19 += 2;
          uint64_t v21 = v22;
          if (v16 < v18 == v22 >= v20) {
            break;
          }
          ++v11;
          uint64_t v20 = v21;
          if (v3 == v11)
          {
            Swift::Int v11 = v3;
            break;
          }
        }
      }

      if (v16 < v18)
      {
        if (v11 < v15) {
          goto LABEL_139;
        }
        if (v15 < v11)
        {
          uint64_t v23 = 16 * v11;
          Swift::Int v24 = v11;
          Swift::Int v25 = v15;
          do
          {
            if (v25 != --v24)
            {
              if (!v12) {
                goto LABEL_145;
              }
              uint64_t v26 = v12 + v23;
              uint64_t v27 = *(void *)(v12 + v17);
              uint64_t v28 = *(void *)(v12 + v17 + 8);
              *(_OWORD *)(v12 + v17) = *(_OWORD *)(v12 + v23 - 16);
              *(void *)(v26 - 16) = v27;
              *(void *)(v26 - 8) = v28;
            }

            ++v25;
            v23 -= 16LL;
            v17 += 16LL;
          }

          while (v25 < v24);
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
        Swift::Int v29 = v15 + v6;
        if (__OFADD__(v15, v6)) {
          goto LABEL_140;
        }
        if (v29 >= v3) {
          Swift::Int v29 = v3;
        }
        if (v29 < v15) {
          goto LABEL_141;
        }
        if (v11 != v29)
        {
          uint64_t v30 = v101 + 16 * v11;
          do
          {
            uint64_t v31 = *(void *)(v12 + 16 * v11);
            Swift::Int v32 = v15;
            uint64_t v33 = v30;
            do
            {
              if (v31 >= *(void *)v33) {
                break;
              }
              if (!v12) {
                goto LABEL_143;
              }
              uint64_t v34 = *(void *)(v33 + 24);
              *(_OWORD *)(v33 + 16) = *(_OWORD *)v33;
              *(void *)uint64_t v33 = v31;
              *(void *)(v33 + 8) = v34;
              v33 -= 16LL;
              ++v32;
            }

            while (v11 != v32);
            ++v11;
            v30 += 16LL;
          }

          while (v11 != v29);
          Swift::Int v11 = v29;
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
      int64_t v13 = sub_100009EF8(0LL, *((void *)v13 + 2) + 1LL, 1, v13);
    }
    unint64_t v36 = *((void *)v13 + 2);
    unint64_t v35 = *((void *)v13 + 3);
    unint64_t v14 = v36 + 1;
    uint64_t v12 = v107;
    if (v36 >= v35 >> 1)
    {
      v85 = sub_100009EF8((char *)(v35 > 1), v36 + 1, 1, v13);
      uint64_t v12 = v107;
      int64_t v13 = v85;
    }

    *((void *)v13 + 2) = v14;
    uint64_t v37 = v13 + 32;
    char v38 = &v13[16 * v36 + 32];
    *(void *)char v38 = v15;
    *((void *)v38 + 1) = v11;
    if (v36) {
      break;
    }
    unint64_t v14 = 1LL;
LABEL_15:
    Swift::Int v6 = v105;
    Swift::Int v3 = v106;
    if (v11 >= v106)
    {
      uint64_t v10 = v104;
LABEL_104:
      v87 = v13;
      v104 = v10;
      if (v14 < 2) {
        goto LABEL_95;
      }
      uint64_t v95 = *v102;
      while (1)
      {
        unint64_t v96 = v14 - 2;
        if (v14 < 2) {
          break;
        }
        if (!v95) {
          goto LABEL_146;
        }
        v86 = v87;
        uint64_t v97 = *(void *)&v87[16 * v96 + 32];
        uint64_t v98 = *(void *)&v87[16 * v14 + 24];
        sub_100009C80( (char *)(v95 + 16 * v97),  (char *)(v95 + 16LL * *(void *)&v87[16 * v14 + 16]),  v95 + 16 * v98,  __dst);
        if (v1) {
          goto LABEL_94;
        }
        if (v98 < v97) {
          goto LABEL_134;
        }
        if ((swift_isUniquelyReferenced_nonNull_native(v86) & 1) == 0) {
          v86 = sub_10000A098((uint64_t)v86);
        }
        if (v96 >= *((void *)v86 + 2)) {
          goto LABEL_135;
        }
        v99 = &v86[16 * v96 + 32];
        *(void *)v99 = v97;
        *((void *)v99 + 1) = v98;
        unint64_t v100 = *((void *)v86 + 2);
        if (v14 > v100) {
          goto LABEL_136;
        }
        memmove(&v86[16 * v14 + 16], &v86[16 * v14 + 32], 16 * (v100 - v14));
        v87 = v86;
        *((void *)v86 + 2) = v100 - 1;
        unint64_t v14 = v100 - 1;
        if (v100 <= 2) {
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
    unint64_t v39 = v14 - 1;
    if (v14 >= 4)
    {
      id v44 = &v37[16 * v14];
      uint64_t v45 = *((void *)v44 - 8);
      uint64_t v46 = *((void *)v44 - 7);
      BOOL v50 = __OFSUB__(v46, v45);
      uint64_t v47 = v46 - v45;
      if (v50) {
        goto LABEL_121;
      }
      uint64_t v49 = *((void *)v44 - 6);
      uint64_t v48 = *((void *)v44 - 5);
      BOOL v50 = __OFSUB__(v48, v49);
      uint64_t v42 = v48 - v49;
      char v43 = v50;
      if (v50) {
        goto LABEL_122;
      }
      unint64_t v51 = v14 - 2;
      uint64_t v52 = &v37[16 * v14 - 32];
      uint64_t v54 = *(void *)v52;
      uint64_t v53 = *((void *)v52 + 1);
      BOOL v50 = __OFSUB__(v53, v54);
      uint64_t v55 = v53 - v54;
      if (v50) {
        goto LABEL_124;
      }
      BOOL v50 = __OFADD__(v42, v55);
      uint64_t v56 = v42 + v55;
      if (v50) {
        goto LABEL_127;
      }
      if (v56 >= v47)
      {
        v74 = &v37[16 * v39];
        uint64_t v76 = *(void *)v74;
        uint64_t v75 = *((void *)v74 + 1);
        BOOL v50 = __OFSUB__(v75, v76);
        uint64_t v77 = v75 - v76;
        if (v50) {
          goto LABEL_131;
        }
        BOOL v67 = v42 < v77;
        goto LABEL_83;
      }
    }

    else
    {
      if (v14 != 3)
      {
        uint64_t v68 = *((void *)v13 + 4);
        uint64_t v69 = *((void *)v13 + 5);
        BOOL v50 = __OFSUB__(v69, v68);
        uint64_t v61 = v69 - v68;
        char v62 = v50;
        goto LABEL_77;
      }

      uint64_t v41 = *((void *)v13 + 4);
      uint64_t v40 = *((void *)v13 + 5);
      BOOL v50 = __OFSUB__(v40, v41);
      uint64_t v42 = v40 - v41;
      char v43 = v50;
    }

    if ((v43 & 1) != 0) {
      goto LABEL_123;
    }
    unint64_t v51 = v14 - 2;
    uint64_t v57 = &v37[16 * v14 - 32];
    uint64_t v59 = *(void *)v57;
    uint64_t v58 = *((void *)v57 + 1);
    BOOL v60 = __OFSUB__(v58, v59);
    uint64_t v61 = v58 - v59;
    char v62 = v60;
    if (v60) {
      goto LABEL_126;
    }
    v63 = &v37[16 * v39];
    uint64_t v65 = *(void *)v63;
    uint64_t v64 = *((void *)v63 + 1);
    BOOL v50 = __OFSUB__(v64, v65);
    uint64_t v66 = v64 - v65;
    if (v50) {
      goto LABEL_129;
    }
    if (__OFADD__(v61, v66)) {
      goto LABEL_130;
    }
    if (v61 + v66 >= v42)
    {
      BOOL v67 = v42 < v66;
LABEL_83:
      if (v67) {
        unint64_t v39 = v51;
      }
      goto LABEL_85;
    }

LABEL_77:
    if ((v62 & 1) != 0) {
      goto LABEL_125;
    }
    v70 = &v37[16 * v39];
    uint64_t v72 = *(void *)v70;
    uint64_t v71 = *((void *)v70 + 1);
    BOOL v50 = __OFSUB__(v71, v72);
    uint64_t v73 = v71 - v72;
    if (v50) {
      goto LABEL_128;
    }
    if (v73 < v61) {
      goto LABEL_15;
    }
LABEL_85:
    unint64_t v78 = v39 - 1;
    if (v39 - 1 >= v14)
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
    v79 = v13;
    v80 = &v37[16 * v78];
    uint64_t v81 = *(void *)v80;
    v82 = &v37[16 * v39];
    uint64_t v83 = *((void *)v82 + 1);
    sub_100009C80((char *)(v12 + 16LL * *(void *)v80), (char *)(v12 + 16LL * *(void *)v82), v12 + 16 * v83, __dst);
    if (v1) {
      break;
    }
    if (v83 < v81) {
      goto LABEL_118;
    }
    if (v39 > *((void *)v79 + 2)) {
      goto LABEL_119;
    }
    *(void *)v80 = v81;
    *(void *)&v37[16 * v78 + 8] = v83;
    unint64_t v84 = *((void *)v79 + 2);
    if (v39 >= v84) {
      goto LABEL_120;
    }
    int64_t v13 = v79;
    unint64_t v14 = v84 - 1;
    memmove(&v37[16 * v39], v82 + 16, 16 * (v84 - 1 - v39));
    *((void *)v79 + 2) = v84 - 1;
    uint64_t v12 = v107;
    if (v84 <= 2) {
      goto LABEL_15;
    }
  }

  v86 = v79;
LABEL_94:
  v87 = v86;
LABEL_95:
  swift_bridgeObjectRelease(v87);
  v104[2] = 0LL;
  return swift_bridgeObjectRelease(v104);
}

uint64_t sub_100009C80(char *__src, char *a2, unint64_t a3, char *__dst)
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
  Swift::Int v24 = __src;
  uint64_t v23 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v16 = &v4[16 * v13];
      uint64_t v22 = v16;
      Swift::Int v24 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        uint64_t v17 = (char *)(a3 - 16);
        uint64_t v18 = v6;
        while (1)
        {
          uint64_t v19 = v17 + 16;
          uint64_t v20 = *((void *)v18 - 2);
          v18 -= 16;
          if (*((void *)v16 - 2) >= v20)
          {
            uint64_t v22 = v16 - 16;
            if (v19 < v16 || v17 >= v16 || v19 != v16) {
              *(_OWORD *)uint64_t v17 = *((_OWORD *)v16 - 1);
            }
            uint64_t v18 = v6;
            v16 -= 16;
            if (v6 <= v7) {
              goto LABEL_42;
            }
          }

          else
          {
            if (v19 != v6 || v17 >= v6) {
              *(_OWORD *)uint64_t v17 = *(_OWORD *)v18;
            }
            Swift::Int v24 = v18;
            if (v18 <= v7) {
              goto LABEL_42;
            }
          }

          v17 -= 16;
          Swift::Int v6 = v18;
          if (v16 <= v4) {
            goto LABEL_42;
          }
        }
      }

      goto LABEL_42;
    }
  }

  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    unint64_t v14 = &v4[16 * v10];
    uint64_t v22 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        if (*(void *)v6 >= *(void *)v4)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v23 = v4;
          Swift::Int v15 = v6;
        }

        else
        {
          Swift::Int v15 = v6 + 16;
          if (v7 < v6 || v7 >= v15 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }

        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        Swift::Int v6 = v15;
      }

      while ((unint64_t)v15 < a3);
      Swift::Int v24 = v7;
    }

LABEL_42:
    sub_100009FF0((void **)&v24, (const void **)&v23, &v22);
    return 1LL;
  }

  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "UnsafeMutablePointer.moveInitialize with negative count",  55LL,  2LL,  "Swift/UnsafePointer.swift",  25LL,  2,  1046LL,  0);
  __break(1u);
  return result;
}

char *sub_100009EF8(char *result, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005DB8(&qword_100020EC8);
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

char *sub_100009FF0(void **a1, const void **a2, void *a3)
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

char *sub_10000A098(uint64_t a1)
{
  return sub_100009EF8(0LL, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_10000A0AC(void *a1)
{
  return sub_100007E00(0LL, a1[2], 0, a1);
}

uint64_t sub_10000A0C0(uint64_t a1, unint64_t *a2, void *a3)
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

uint64_t sub_10000A0F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005DB8(&qword_100020EB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000A140(void *a1)
{
  return sub_10000FAC4(0, a1[2], 0, a1);
}

uint64_t sub_10000A154(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void *)result;
  uint64_t v6 = a4 + 64;
  uint64_t v7 = -1LL << *(_BYTE *)(a4 + 32);
  if (-v7 < 64) {
    uint64_t v8 = ~(-1LL << -(char)v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v12 = 0LL;
    uint64_t v10 = 0LL;
LABEL_38:
    *uint64_t v5 = a4;
    v5[1] = v6;
    uint64_t v5[2] = ~v7;
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
    uint64_t v20 = *(void *)(*(void *)(a4 + 56) + 8 * v16);
    *uint64_t v11 = *(void *)(*(void *)(a4 + 48) + 8 * v16);
    v11[1] = v20;
    if (v13 == v10)
    {
      swift_retain();
      goto LABEL_38;
    }

    v11 += 2;
    uint64_t result = swift_retain();
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

unint64_t sub_10000A354(void *a1)
{
  uint64_t v1 = a1[2];
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_100005DB8(&qword_100020F18);
  Swift::Int v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v1);
  uint64_t v5 = a1[4];
  uint64_t v4 = a1[5];
  unint64_t result = sub_1000085B0(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_retain(v4);
    return (unint64_t)v3;
  }

  uint64_t v8 = a1 + 7;
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    uint64_t v9 = 8 * result;
    *(void *)(v3[6] + v9) = v5;
    *(void *)(v3[7] + v9) = v4;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1LL);
    uint64_t v12 = v10 + 1;
    if (v11) {
      break;
    }
    v3[2] = v12;
    if (!--v1) {
      goto LABEL_8;
    }
    uint64_t v13 = v8 + 2;
    uint64_t v5 = *(v8 - 1);
    uint64_t v14 = *v8;
    swift_retain(v4);
    unint64_t result = sub_1000085B0(v5);
    uint64_t v8 = v13;
    uint64_t v4 = v14;
    if ((v15 & 1) != 0) {
      goto LABEL_7;
    }
  }

  __break(1u);
  return result;
}

unint64_t sub_10000A450(uint64_t a1)
{
  uint64_t v1 = sub_100005DB8(&qword_100020EE0);
  if (swift_dynamicCast(v26, v27, (char *)&type metadata for Any + 8, v1, 0LL))
  {
    sub_10000A84C(v26, (uint64_t)v23 + 4);
    uint64_t v2 = v24;
    uint64_t v3 = v25;
    uint64_t v4 = sub_10000A864((void *)((char *)v23 + 4), v24);
    uint64_t v5 = *(void *)(v2 - 8);
    __chkstk_darwin(v4);
    char v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    (*(void (**)(_BYTE *))(v5 + 16))(v7);
    if (dispatch thunk of BinaryInteger.bitWidth.getter(v2, v3) < 65)
    {
      char v15 = dispatch thunk of static BinaryInteger.isSigned.getter(v2, v3);
      uint64_t v16 = dispatch thunk of BinaryInteger._lowWord.getter(v2, v3);
      (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v2);
      if ((v15 & 1) != 0) {
        float v8 = (float)v16;
      }
      else {
        float v8 = (float)(unint64_t)v16;
      }
    }

    else
    {
      sub_10000A888();
      sub_10000A8CC();
      static BinaryFloatingPoint<>._convert<A>(from:)(v23, v7);
      (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v2);
      float v8 = *(float *)v23;
    }

    float v14 = v8;
    goto LABEL_12;
  }

  uint64_t v9 = sub_100005DB8(&qword_100020EE8);
  if (swift_dynamicCast(v26, v27, (char *)&type metadata for Any + 8, v9, 0LL))
  {
    sub_10000A84C(v26, (uint64_t)v23 + 4);
    uint64_t v10 = sub_10000A864((void *)((char *)v23 + 4), v24);
    __chkstk_darwin(v10);
    uint64_t v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
    (*(void (**)(_BYTE *))(v13 + 16))(v12);
    sub_10000A888();
    BinaryFloatingPoint.init<A>(_:)(v23, v12);
    float v14 = *(float *)v23;
LABEL_12:
    sub_100005EC8((void *)((char *)v23 + 4));
    unsigned __int8 v20 = 0;
    goto LABEL_13;
  }

  uint64_t v17 = sub_10000A0C0(0LL, &qword_100020E90, &OBJC_CLASS___NSNumber_ptr);
  if (swift_dynamicCast(v26, v27, (char *)&type metadata for Any + 8, v17, 0LL))
  {
    unint64_t v18 = *(void **)&v26[0];
    float v19 = Float.init(truncating:)(*(void *)&v26[0]);

    unsigned __int8 v20 = 0;
    float v14 = v19;
  }

  else
  {
    float v14 = 0.0;
    unsigned __int8 v20 = 1;
  }

char *sub_10000A720(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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

    uint64_t v5 = (char *)(a4 + 4 * a1 + 32);
    size_t v6 = 4 * v4;
    char v7 = &__dst[v6];
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

uint64_t sub_10000A80C(uint64_t a1)
{
  uint64_t v2 = sub_100005DB8(&qword_100020ED8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

uint64_t sub_10000A84C(__int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10000A864(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) + 16LL) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80LL)));
  return result;
}

unint64_t sub_10000A888()
{
  unint64_t result = qword_100020EF0;
  if (!qword_100020EF0)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Float, &type metadata for Float);
    atomic_store(result, (unint64_t *)&qword_100020EF0);
  }

  return result;
}

unint64_t sub_10000A8CC()
{
  unint64_t result = qword_100020EF8;
  if (!qword_100020EF8)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UInt32, &type metadata for UInt32);
    atomic_store(result, (unint64_t *)&qword_100020EF8);
  }

  return result;
}

uint64_t sub_10000A910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

MusicAppSelectionPFLPlugin::BiomeSQLClientError_optional __swiftcall BiomeSQLClientError.init(rawValue:)( Swift::Int rawValue)
{
  if (rawValue == 10002) {
    v1.value = MusicAppSelectionPFLPlugin_BiomeSQLClientError_rowConversionFailed;
  }
  else {
    v1.value = MusicAppSelectionPFLPlugin_BiomeSQLClientError_unknownDefault;
  }
  if (rawValue == 10001) {
    return 0;
  }
  else {
    return v1;
  }
}

uint64_t BiomeSQLClientError.rawValue.getter(char a1)
{
  return (a1 & 1) + 10001LL;
}

Swift::Int sub_10000A96C()
{
  int v1 = *v0;
  Hasher.init(_seed:)(v4, 0LL);
  if (v1) {
    Swift::UInt v2 = 10002LL;
  }
  else {
    Swift::UInt v2 = 10001LL;
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_10000A9B8()
{
  if (*v0) {
    Swift::UInt v1 = 10002LL;
  }
  else {
    Swift::UInt v1 = 10001LL;
  }
  Hasher._combine(_:)(v1);
}

Swift::Int sub_10000A9EC(uint64_t a1)
{
  int v2 = *v1;
  Hasher.init(_seed:)(v5, a1);
  if (v2) {
    Swift::UInt v3 = 10002LL;
  }
  else {
    Swift::UInt v3 = 10001LL;
  }
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

void *sub_10000AA34@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 10002LL) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result == 10001LL) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_10000AA5C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 10001LL;
  if (*v1) {
    uint64_t v2 = 10002LL;
  }
  *a1 = v2;
}

uint64_t sub_10000AA78(uint64_t a1, uint64_t a2)
{
  return sub_10000AEF8(a1, a2, (uint64_t (*)(void))sub_10000B3F4);
}

uint64_t BiomeSQLRowAggregatorError.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 10101LL;
}

Swift::Int sub_10000AA9C()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1 + 10101);
  return Hasher._finalize()();
}

void sub_10000AAE4()
{
}

Swift::Int sub_10000AB14(uint64_t a1)
{
  uint64_t v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2 + 10101);
  return Hasher._finalize()();
}

uint64_t sub_10000AB58@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = _s26MusicAppSelectionPFLPlugin26BiomeSQLRowAggregatorErrorO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_10000AB80(void *a1@<X8>)
{
  *a1 = *v1 + 10101LL;
}

uint64_t sub_10000AB94(uint64_t a1, uint64_t a2)
{
  return sub_10000AEF8(a1, a2, (uint64_t (*)(void))sub_10000B3B0);
}

uint64_t ModelTrainerError.rawValue.getter(unsigned __int8 a1)
{
  return a1 + 10201LL;
}

Swift::Int sub_10000ABB0()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1 + 10201);
  return Hasher._finalize()();
}

void sub_10000ABF8()
{
}

Swift::Int sub_10000AC28(uint64_t a1)
{
  uint64_t v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2 + 10201);
  return Hasher._finalize()();
}

uint64_t sub_10000AC6C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = _s26MusicAppSelectionPFLPlugin17ModelTrainerErrorO8rawValueACSgSi_tcfC_0(*a1);
  *a2 = result;
  return result;
}

void sub_10000AC94(void *a1@<X8>)
{
  *a1 = *v1 + 10201LL;
}

uint64_t sub_10000ACA8(uint64_t a1, uint64_t a2)
{
  return sub_10000AEF8(a1, a2, (uint64_t (*)(void))sub_10000B328);
}

BOOL sub_10000ACB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000ACCC()
{
  int v1 = *v0;
  Hasher.init(_seed:)(v4, 0LL);
  if (v1) {
    Swift::UInt v2 = 10302LL;
  }
  else {
    Swift::UInt v2 = 10301LL;
  }
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_10000AD18()
{
  if (*v0) {
    Swift::UInt v1 = 10302LL;
  }
  else {
    Swift::UInt v1 = 10301LL;
  }
  Hasher._combine(_:)(v1);
}

Swift::Int sub_10000AD4C(uint64_t a1)
{
  int v2 = *v1;
  Hasher.init(_seed:)(v5, a1);
  if (v2) {
    Swift::UInt v3 = 10302LL;
  }
  else {
    Swift::UInt v3 = 10301LL;
  }
  Hasher._combine(_:)(v3);
  return Hasher._finalize()();
}

void *sub_10000AD94@<X0>(void *result@<X0>, char *a2@<X8>)
{
  if (*result == 10302LL) {
    char v2 = 1;
  }
  else {
    char v2 = 2;
  }
  if (*result == 10301LL) {
    char v3 = 0;
  }
  else {
    char v3 = v2;
  }
  *a2 = v3;
  return result;
}

void sub_10000ADBC(uint64_t *a1@<X8>)
{
  uint64_t v2 = 10301LL;
  if (*v1) {
    uint64_t v2 = 10302LL;
  }
  *a1 = v2;
}

uint64_t sub_10000ADD4(uint64_t a1, uint64_t a2)
{
  return sub_10000AEF8(a1, a2, (uint64_t (*)(void))sub_10000B7E0);
}

BOOL sub_10000ADE0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000ADF4()
{
  uint64_t v1 = *v0;
  Hasher.init(_seed:)(v3, 0LL);
  Hasher._combine(_:)(v1 + 10401);
  return Hasher._finalize()();
}

void sub_10000AE3C()
{
}

Swift::Int sub_10000AE6C(uint64_t a1)
{
  uint64_t v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2 + 10401);
  return Hasher._finalize()();
}

uint64_t sub_10000AEB0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result = sub_10000B824(*a1);
  *a2 = result;
  return result;
}

void sub_10000AED8(void *a1@<X8>)
{
  *a1 = *v1 + 10401LL;
}

uint64_t sub_10000AEEC(uint64_t a1, uint64_t a2)
{
  return sub_10000AEF8(a1, a2, (uint64_t (*)(void))sub_10000B79C);
}

uint64_t sub_10000AEF8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3();
  unint64_t v6 = sub_10000B36C();
  return Error<>._code.getter(a1, a2, v5, v6);
}

uint64_t _s26MusicAppSelectionPFLPlugin26BiomeSQLRowAggregatorErrorO8rawValueACSgSi_tcfC_0(uint64_t a1)
{
  else {
    return a1 - 10101;
  }
}

uint64_t _s26MusicAppSelectionPFLPlugin17ModelTrainerErrorO8rawValueACSgSi_tcfC_0(uint64_t a1)
{
  else {
    return a1 - 10201;
  }
}

unint64_t sub_10000AF70()
{
  unint64_t result = qword_100020F28;
  if (!qword_100020F28)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for BiomeSQLClientError,  &type metadata for BiomeSQLClientError);
    atomic_store(result, (unint64_t *)&qword_100020F28);
  }

  return result;
}

unint64_t sub_10000AFB8()
{
  unint64_t result = qword_100020F30;
  if (!qword_100020F30)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for BiomeSQLRowAggregatorError,  &type metadata for BiomeSQLRowAggregatorError);
    atomic_store(result, (unint64_t *)&qword_100020F30);
  }

  return result;
}

unint64_t sub_10000B000()
{
  unint64_t result = qword_100020F38;
  if (!qword_100020F38)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ModelTrainerError,  &type metadata for ModelTrainerError);
    atomic_store(result, (unint64_t *)&qword_100020F38);
  }

  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for BiomeSQLClientError(_BYTE *result, _BYTE *a2)
{
  *unint64_t result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for BiomeSQLClientError()
{
  return &type metadata for BiomeSQLClientError;
}

uint64_t getEnumTagSinglePayload for BiomeSQLRowAggregatorError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }

LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
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

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xF;
  int v8 = v6 - 15;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for BiomeSQLRowAggregatorError( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF8) {
    return ((uint64_t (*)(void))((char *)&loc_10000B14C + 4 * byte_100017DB5[v4]))();
  }
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_10000B180 + 4 * byte_100017DB0[v4]))();
}

uint64_t sub_10000B180(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B188(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000B190LL);
  }
  return result;
}

uint64_t sub_10000B19C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000B1A4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 7;
  return result;
}

uint64_t sub_10000B1A8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B1B0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BiomeSQLRowAggregatorError()
{
  return &type metadata for BiomeSQLRowAggregatorError;
}

uint64_t getEnumTagSinglePayload for ModelTrainerError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ModelTrainerError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000B2A8 + 4 * byte_100017DBF[v4]))();
  }
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10000B2DC + 4 * byte_100017DBA[v4]))();
}

uint64_t sub_10000B2DC(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B2E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000B2ECLL);
  }
  return result;
}

uint64_t sub_10000B2F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000B300LL);
  }
  *(_BYTE *)unint64_t result = a2 + 4;
  return result;
}

uint64_t sub_10000B304(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B30C(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModelTrainerError()
{
  return &type metadata for ModelTrainerError;
}

unint64_t sub_10000B328()
{
  unint64_t result = qword_100020F40;
  if (!qword_100020F40)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ModelTrainerError,  &type metadata for ModelTrainerError);
    atomic_store(result, (unint64_t *)&qword_100020F40);
  }

  return result;
}

unint64_t sub_10000B36C()
{
  unint64_t result = qword_100020F48;
  if (!qword_100020F48)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_100020F48);
  }

  return result;
}

unint64_t sub_10000B3B0()
{
  unint64_t result = qword_100020F50;
  if (!qword_100020F50)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for BiomeSQLRowAggregatorError,  &type metadata for BiomeSQLRowAggregatorError);
    atomic_store(result, (unint64_t *)&qword_100020F50);
  }

  return result;
}

unint64_t sub_10000B3F4()
{
  unint64_t result = qword_100020F58;
  if (!qword_100020F58)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for BiomeSQLClientError,  &type metadata for BiomeSQLClientError);
    atomic_store(result, (unint64_t *)&qword_100020F58);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s26MusicAppSelectionPFLPlugin19BiomeSQLClientErrorOwst_0( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000B514 + 4 * byte_100017DC9[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000B548 + 4 * byte_100017DC4[v4]))();
}

uint64_t sub_10000B548(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B550(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000B558LL);
  }
  return result;
}

uint64_t sub_10000B564(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000B56CLL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10000B570(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B578(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B584(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000B58C(_BYTE *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MusicAppSelectionPFLPluginArgsError()
{
  return &type metadata for MusicAppSelectionPFLPluginArgsError;
}

uint64_t getEnumTagSinglePayload for MusicAppSelectionPFLPluginRunnerError( unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MusicAppSelectionPFLPluginRunnerError( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000B684 + 4 * byte_100017DD3[v4]))();
  }
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_10000B6B8 + 4 * byte_100017DCE[v4]))();
}

uint64_t sub_10000B6B8(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B6C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10000B6C8LL);
  }
  return result;
}

uint64_t sub_10000B6D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10000B6DCLL);
  }
  *(_BYTE *)unint64_t result = a2 + 5;
  return result;
}

uint64_t sub_10000B6E0(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000B6E8(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000B6F4(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MusicAppSelectionPFLPluginRunnerError()
{
  return &type metadata for MusicAppSelectionPFLPluginRunnerError;
}

unint64_t sub_10000B710()
{
  unint64_t result = qword_100020F60;
  if (!qword_100020F60)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000181B0, &type metadata for MusicAppSelectionPFLPluginRunnerError);
    atomic_store(result, (unint64_t *)&qword_100020F60);
  }

  return result;
}

unint64_t sub_10000B758()
{
  unint64_t result = qword_100020F68;
  if (!qword_100020F68)
  {
    unint64_t result = swift_getWitnessTable(&unk_100018250, &type metadata for MusicAppSelectionPFLPluginArgsError);
    atomic_store(result, (unint64_t *)&qword_100020F68);
  }

  return result;
}

unint64_t sub_10000B79C()
{
  unint64_t result = qword_100020F70;
  if (!qword_100020F70)
  {
    unint64_t result = swift_getWitnessTable(&unk_100018138, &type metadata for MusicAppSelectionPFLPluginRunnerError);
    atomic_store(result, (unint64_t *)&qword_100020F70);
  }

  return result;
}

unint64_t sub_10000B7E0()
{
  unint64_t result = qword_100020F78;
  if (!qword_100020F78)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000181D8, &type metadata for MusicAppSelectionPFLPluginArgsError);
    atomic_store(result, (unint64_t *)&qword_100020F78);
  }

  return result;
}

uint64_t sub_10000B824(uint64_t a1)
{
  else {
    return a1 - 10401;
  }
}

uint64_t sub_10000B850()
{
  uint64_t v0 = type metadata accessor for Logger(0LL);
  sub_10000B8C8(v0, qword_100022C60);
  sub_100005D5C(v0, (uint64_t)qword_100022C60);
  return Logger.init(subsystem:category:)( 0xD00000000000001ALL,  0x8000000100019070LL,  0xD00000000000001ALL,  0x8000000100019090LL);
}

uint64_t *sub_10000B8C8(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000B908(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0) {
    uint64_t v3 = 0x64656E69617254LL;
  }
  else {
    uint64_t v3 = 0x656E696C65736142LL;
  }
  if (v2) {
    unint64_t v4 = 0xE800000000000000LL;
  }
  else {
    unint64_t v4 = 0xE700000000000000LL;
  }
  if ((a2 & 1) != 0) {
    uint64_t v5 = 0x64656E69617254LL;
  }
  else {
    uint64_t v5 = 0x656E696C65736142LL;
  }
  if ((a2 & 1) != 0) {
    unint64_t v6 = 0xE700000000000000LL;
  }
  else {
    unint64_t v6 = 0xE800000000000000LL;
  }
  if (v3 == v5 && v4 == v6)
  {
    char v7 = 1;
    unint64_t v6 = v4;
  }

  else
  {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }

  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v7 & 1;
}

void sub_10000B9AC(char a1)
{
  __asm { BR              X11 }

uint64_t sub_10000B9F8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_10000BA74 + 4 * byte_100018304[a2]))(0x74654D6C65646F4DLL);
}

uint64_t sub_10000BA74(uint64_t a1)
{
  if (a1 == 0x74654D6C65646F4DLL && v1 == 0xEF656D614E636972LL) {
    char v2 = 1;
  }
  else {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xEF656D614E636972LL);
  return v2 & 1;
}

void sub_10000BB34(char a1)
{
  __asm { BR              X10 }

Swift::Int sub_10000BB8C()
{
  return Hasher._finalize()();
}

void sub_10000BC1C(uint64_t a1, char a2)
{
  __asm { BR              X10 }

uint64_t sub_10000BC60(uint64_t a1)
{
  return swift_bridgeObjectRelease(0xEF656D614E636972LL);
}

void sub_10000BCD4(uint64_t a1, char a2)
{
  __asm { BR              X10 }

Swift::Int sub_10000BD28()
{
  return Hasher._finalize()();
}

uint64_t sub_10000BDB8(char *a1, void *a2, double a3)
{
  uint64_t v7 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v11 = (char *)&v96 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = __chkstk_darwin(v9);
  float v14 = (char *)&v96 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v101 = (char *)&v96 - v16;
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v96 - v17;
  sub_100010F74();
  uint64_t v102 = v8;
  float v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v105 = v7;
  Swift::Int v106 = a1;
  v19(v18, (uint64_t)a1, v7);
  id v103 = a2;
  unsigned __int8 v20 = (char *)sub_10001005C((uint64_t)v18, (uint64_t)a2);
  if (v3)
  {
    if (qword_100020B20 != -1) {
      swift_once(&qword_100020B20, sub_10000B850);
    }
    uint64_t v21 = type metadata accessor for Logger(0LL);
    sub_100005D5C(v21, (uint64_t)qword_100022C60);
    uint64_t v22 = v101;
    uint64_t v23 = v105;
    v19(v101, (uint64_t)v106, v105);
    swift_errorRetain(v3);
    uint64_t v24 = swift_errorRetain(v3);
    uint64_t v25 = (os_log_s *)Logger.logObject.getter(v24);
    os_log_type_t v26 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v27 = swift_slowAlloc(22LL, -1LL);
      uint64_t v28 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      unint64_t v100 = (void *)swift_slowAlloc(32LL, -1LL);
      id v108 = v100;
      *(_DWORD *)uint64_t v27 = 136315394;
      unint64_t v29 = sub_100010FB0();
      uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter(v23, v29);
      unint64_t v32 = v31;
      uint64_t v107 = sub_100007F0C(v30, v31, (uint64_t *)&v108);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v27 + 4, v27 + 12);
      swift_bridgeObjectRelease(v32);
      uint64_t v33 = *(void (**)(char *, uint64_t))(v102 + 8);
      v33(v22, v105);
      *(_WORD *)(v27 + 12) = 2112;
      swift_errorRetain(v3);
      uint64_t v34 = _swift_stdlib_bridgeErrorToNSError(v3);
      uint64_t v107 = v34;
      uint64_t v23 = v105;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v27 + 14, v27 + 22);
      *uint64_t v28 = v34;
      swift_errorRelease(v3);
      swift_errorRelease(v3);
      _os_log_impl( (void *)&_mh_execute_header,  v25,  v26,  "Model init failed for %s with error: %@",  (uint8_t *)v27,  0x16u);
      uint64_t v35 = sub_100005DB8(&qword_100020C70);
      swift_arrayDestroy(v28, 1LL, v35);
      swift_slowDealloc(v28, -1LL, -1LL);
      unint64_t v36 = v100;
      swift_arrayDestroy(v100, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v36, -1LL, -1LL);
      swift_slowDealloc(v27, -1LL, -1LL);
    }

    else
    {
      uint64_t v33 = *(void (**)(char *, uint64_t))(v102 + 8);
      v33(v22, v23);
      swift_errorRelease(v3);
      swift_errorRelease(v3);
    }

    unint64_t v48 = sub_100010EEC();
    swift_allocError(&type metadata for ModelTrainerError, v48, 0LL, 0LL);
    _BYTE *v49 = 0;
    swift_willThrow();

    swift_errorRelease(v3);
    v33(v106, v23);
    uint64_t v38 = v104;
    goto LABEL_19;
  }

  uint64_t v37 = v20;
  uint64_t v38 = v104;
  if (!v20 || (unint64_t v39 = v11, (v40 = (char *)[v20 program]) == 0))
  {
    if (qword_100020B20 != -1) {
      swift_once(&qword_100020B20, sub_10000B850);
    }
    uint64_t v50 = type metadata accessor for Logger(0LL);
    sub_100005D5C(v50, (uint64_t)qword_100022C60);
    unint64_t v51 = v14;
    uint64_t v52 = v105;
    uint64_t v53 = ((uint64_t (*)(char *, char *, uint64_t))v19)(v14, v106, v105);
    uint64_t v54 = (os_log_s *)Logger.logObject.getter(v53);
    os_log_type_t v55 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v54, v55))
    {
      uint64_t v56 = swift_slowAlloc(12LL, -1LL);
      uint64_t v101 = v37;
      uint64_t v57 = (uint8_t *)v56;
      uint64_t v58 = (void *)swift_slowAlloc(32LL, -1LL);
      id v108 = v58;
      *(_DWORD *)uint64_t v57 = 136315138;
      unint64_t v59 = sub_100010FB0();
      uint64_t v60 = dispatch thunk of CustomStringConvertible.description.getter(v105, v59);
      unint64_t v62 = v61;
      uint64_t v107 = sub_100007F0C(v60, v61, (uint64_t *)&v108);
      uint64_t v52 = v105;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v57 + 4, v57 + 12);
      swift_bridgeObjectRelease(v62);
      v63 = *(void (**)(char *, uint64_t))(v102 + 8);
      v63(v51, v52);
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "No ML program found for %s", v57, 0xCu);
      swift_arrayDestroy(v58, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v58, -1LL, -1LL);
      uint64_t v64 = v57;
      uint64_t v37 = v101;
      swift_slowDealloc(v64, -1LL, -1LL);
    }

    else
    {
      v63 = *(void (**)(char *, uint64_t))(v102 + 8);
      v63(v14, v52);
    }

    unint64_t v65 = sub_100010EEC();
    swift_allocError(&type metadata for ModelTrainerError, v65, 0LL, 0LL);
    _BYTE *v66 = 1;
    swift_willThrow();

    v63(v106, v52);
    goto LABEL_18;
  }

  uint64_t v41 = v40;
  id v42 = objc_allocWithZone(&OBJC_CLASS___MLProgramTrainer);
  id v108 = 0LL;
  swift_unknownObjectRetain(v41, v43);
  id v44 = [v42 initWithProgram:v41 learningRate:&v108 error:a3];
  id v45 = v108;
  if (!v44)
  {
    id v69 = v108;
    uint64_t v70 = _convertNSErrorToError(_:)(v45);

    swift_willThrow();
    swift_unknownObjectRelease(v41);
    if (qword_100020B20 != -1) {
      swift_once(&qword_100020B20, sub_10000B850);
    }
    uint64_t v71 = type metadata accessor for Logger(0LL);
    sub_100005D5C(v71, (uint64_t)qword_100022C60);
    uint64_t v72 = v39;
    uint64_t v73 = v39;
    uint64_t v74 = v105;
    v19(v73, (uint64_t)v106, v105);
    swift_errorRetain(v70);
    uint64_t v75 = swift_errorRetain(v70);
    uint64_t v76 = (os_log_s *)Logger.logObject.getter(v75);
    os_log_type_t v77 = static os_log_type_t.error.getter();
    int v78 = v77;
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v79 = v70;
      uint64_t v80 = swift_slowAlloc(22LL, -1LL);
      uint64_t v97 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      unint64_t v100 = (void *)swift_slowAlloc(32LL, -1LL);
      id v108 = v100;
      *(_DWORD *)uint64_t v80 = 136315394;
      int v99 = v78;
      unint64_t v81 = sub_100010FB0();
      os_log_t v98 = v76;
      uint64_t v82 = dispatch thunk of CustomStringConvertible.description.getter(v74, v81);
      unint64_t v84 = v83;
      uint64_t v107 = sub_100007F0C(v82, v83, (uint64_t *)&v108);
      uint64_t v101 = v41;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v80 + 4, v80 + 12);
      swift_bridgeObjectRelease(v84);
      uint64_t v85 = v74;
      v86 = *(void (**)(char *, uint64_t))(v102 + 8);
      v86(v72, v85);
      *(_WORD *)(v80 + 12) = 2112;
      uint64_t v87 = v79;
      swift_errorRetain(v79);
      uint64_t v88 = _swift_stdlib_bridgeErrorToNSError(v79);
      uint64_t v107 = v88;
      uint64_t v41 = v101;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v107, &v108, v80 + 14, v80 + 22);
      uint64_t v89 = v97;
      *uint64_t v97 = v88;
      uint64_t v90 = v86;
      uint64_t v96 = v87;
      swift_errorRelease(v87);
      swift_errorRelease(v87);
      os_log_t v91 = v98;
      _os_log_impl( (void *)&_mh_execute_header,  v98,  (os_log_type_t)v99,  "ML program trainer init failed for %s: %@",  (uint8_t *)v80,  0x16u);
      uint64_t v92 = sub_100005DB8(&qword_100020C70);
      swift_arrayDestroy(v89, 1LL, v92);
      swift_slowDealloc(v89, -1LL, -1LL);
      v93 = v100;
      swift_arrayDestroy(v100, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v93, -1LL, -1LL);
      swift_slowDealloc(v80, -1LL, -1LL);

      uint64_t v74 = v105;
      uint64_t v70 = v96;
    }

    else
    {
      uint64_t v90 = *(void (**)(char *, uint64_t))(v102 + 8);
      v90(v72, v74);
      swift_errorRelease(v70);
      swift_errorRelease(v70);
    }

    unint64_t v94 = sub_100010EEC();
    swift_allocError(&type metadata for ModelTrainerError, v94, 0LL, 0LL);
    *uint64_t v95 = 1;
    swift_willThrow();

    swift_errorRelease(v70);
    swift_unknownObjectRelease(v41);
    v90(v106, v74);
LABEL_18:

LABEL_19:
    uint64_t v67 = type metadata accessor for ModelTrainer();
    swift_deallocPartialClassInstance(v38, v67, 24LL, 7LL);
    return v38;
  }

  id v46 = v44;
  id v47 = v108;

  swift_unknownObjectRelease_n(v41, 2LL);
  (*(void (**)(char *, uint64_t))(v102 + 8))(v106, v105);
  *(void *)(v38 + 16) = v46;

  return v38;
}

void sub_10000C72C(int a1, int64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  int64_t v7 = a2;
  int64_t v8 = *(void *)(a3 + 16);
  uint64_t v9 = _swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t v45 = v5;
    uint64_t v49 = _swiftEmptyArrayStorage;
    sub_10000FAA8(0, v8, 0);
    uint64_t v9 = _swiftEmptyArrayStorage;
    int64_t v7 = sub_10000FDB4(a3);
    uint64_t v5 = v10;
    char v12 = v11 & 1;
    while ((v7 & 0x8000000000000000LL) == 0 && v7 < 1LL << *(_BYTE *)(a3 + 32))
    {
      if (*(_DWORD *)(a3 + 36) != (_DWORD)v5) {
        goto LABEL_29;
      }
      char v48 = v12;
      uint64_t v13 = *(void *)(a3 + 48) + 40 * v7;
      uint64_t v14 = *(void *)(v13 + 16);
      uint64_t v4 = *(void *)(v13 + 24);
      uint64_t v49 = v9;
      unint64_t v16 = v9[2];
      unint64_t v15 = v9[3];
      swift_bridgeObjectRetain(v4);
      if (v16 >= v15 >> 1)
      {
        sub_10000FAA8(v15 > 1, v16 + 1, 1);
        uint64_t v9 = v49;
      }

      v9[2] = v16 + 1;
      uint64_t v17 = &v9[2 * v16];
      v17[4] = v14;
      v17[5] = v4;
      int64_t v18 = sub_10000FE54(v7, v5, v48 & 1, a3);
      int64_t v7 = v18;
      uint64_t v5 = v19;
      char v12 = v20 & 1;
      if (!--v8)
      {
        sub_10000FF38(v18, v19, v12);
        uint64_t v5 = v45;
        int64_t v7 = a2;
        goto LABEL_11;
      }
    }

    __break(1u);
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
  }

  else
  {
LABEL_11:
    uint64_t v4 = sub_100010178((uint64_t)v9);
    swift_bridgeObjectRelease(v9);
    if (qword_100020B20 == -1) {
      goto LABEL_12;
    }
  }

  swift_once(&qword_100020B20, sub_10000B850);
LABEL_12:
  uint64_t v21 = type metadata accessor for Logger(0LL);
  sub_100005D5C(v21, (uint64_t)qword_100022C60);
  uint64_t v23 = swift_unknownObjectRetain(v7, v22);
  uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
  os_log_type_t v25 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc(18LL, -1LL);
    *(_DWORD *)uint64_t v26 = 134218240;
    uint64_t v49 = [(id)v7 count];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, &v50, v26 + 4, v26 + 12);
    swift_unknownObjectRelease(v7);
    *(_WORD *)(v26 + 12) = 1024;
    LODWORD(v49) = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v49, (char *)&v49 + 4, v26 + 14, v26 + 18);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Training %ld for %u epochs.", (uint8_t *)v26, 0x12u);
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  else
  {

    swift_unknownObjectRelease(v7);
  }

  uint64_t v27 = (void *)v7;
  uint64_t v28 = *(void **)(v5 + 16);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  uint64_t v49 = 0LL;
  id v30 = [v28 evaluateUsingTestData:v27 evaluationMetricNames:isa error:&v49];

  unint64_t v31 = v49;
  if (!v30)
  {
    id v42 = v49;
    swift_bridgeObjectRelease(v4);
    _convertNSErrorToError(_:)(v31);

    swift_willThrow();
    return;
  }

  unint64_t v32 = v49;
  id v33 = v30;
  uint64_t v34 = v27;
  unint64_t v35 = (unint64_t)[v27 count];
  if ((v35 & 0x8000000000000000LL) != 0)
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Negative value is not representable",  35LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3451LL,  0);
LABEL_33:
    __break(1u);
    return;
  }

  if (HIDWORD(v35))
  {
    _assertionFailure(_:_:file:line:flags:)( "Fatal error",  11LL,  2LL,  "Not enough bits to represent the passed value",  45LL,  2LL,  "Swift/Integers.swift",  20LL,  2,  3455LL,  0);
    goto LABEL_33;
  }

  if (a1)
  {
    while (1)
    {
      uint64_t v49 = 0LL;
      id v36 = [v28 trainUsingTrainingData:v34 error:&v49];
      uint64_t v37 = v49;
      if (!v36) {
        break;
      }

      if (!--a1) {
        goto LABEL_21;
      }
    }

    uint64_t v43 = v37;

    swift_bridgeObjectRelease(v4);
    id v44 = v43;
  }

  else
  {
LABEL_21:
    Class v38 = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
    uint64_t v49 = 0LL;
    id v39 = [v28 evaluateUsingTestData:v34 evaluationMetricNames:v38 error:&v49];

    uint64_t v40 = v49;
    if (v39)
    {
      uint64_t v41 = v49;

      swift_bridgeObjectRetain(a3);
      return;
    }

    uint64_t v43 = v49;

    id v44 = v40;
  }

  _convertNSErrorToError(_:)(v44);

  swift_willThrow();
}

uint64_t sub_10000CC74()
{
  return swift_deallocClassInstance(v0, 24LL, 7LL);
}

uint64_t type metadata accessor for ModelTrainer()
{
  return objc_opt_self(&OBJC_CLASS____TtC26MusicAppSelectionPFLPlugin12ModelTrainer);
}

void sub_10000CCB8(char *a1)
{
}

void sub_10000CCC4()
{
}

void sub_10000CCCC(uint64_t a1)
{
}

void sub_10000CCD4(uint64_t a1)
{
}

unint64_t sub_10000CCDC@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1000102B0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000CD08()
{
  return ((uint64_t (*)(void))((char *)sub_10000CD3C + 4 * byte_100018314[*v0]))();
}

void sub_10000CD3C(void *a1@<X8>)
{
  *a1 = 0x74654D6C65646F4DLL;
  a1[1] = 0xEF656D614E636972LL;
}

void sub_10000CD64(void *a1@<X8>)
{
  *a1 = v1 + 2;
  a1[1] = 0x8000000100018A70LL;
}

void sub_10000CD80(char *a1@<X8>)
{
  a1[15] = -18;
}

uint64_t sub_10000CDA8()
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10000CDDC + 4 * byte_100018318[*v0]))( 0xD000000000000012LL,  0x8000000100018A40LL);
}

uint64_t sub_10000CDDC()
{
  return 0x74654D6C65646F4DLL;
}

uint64_t sub_10000CE00(uint64_t a1)
{
  return a1 + 2;
}

uint64_t sub_10000CE18()
{
  return 0x6E4563697274654DLL;
}

unint64_t sub_10000CE3C@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_1000102B0(a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000CE60()
{
  return 0LL;
}

void sub_10000CE6C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10000CE78(uint64_t a1)
{
  unint64_t v2 = sub_10001124C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000CEA0(uint64_t a1)
{
  unint64_t v2 = sub_10001124C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000CEC8(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005DB8(&qword_100021090);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  int64_t v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A864(a1, v9);
  unint64_t v11 = sub_10001124C();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for ModelEvaluationMetricSpecs.CodingKeys,  &type metadata for ModelEvaluationMetricSpecs.CodingKeys,  v11,  v9,  v10);
  uint64_t v12 = *v3;
  uint64_t v13 = v3[1];
  char v24 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v24, v5);
  if (!v2)
  {
    uint64_t v14 = v3[2];
    uint64_t v15 = v3[3];
    char v23 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v23, v5);
    char v22 = *((_BYTE *)v3 + 32);
    char v21 = 2;
    unint64_t v16 = sub_100011318();
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v22, &v21, v5, &type metadata for ModelEvaluationMetricType, v16);
    char v20 = 3;
    unint64_t v17 = sub_10001135C();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v17, &v20, v5, &type metadata for MetricEncoding, v17);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int sub_10000D050()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v8, v1, v2);
  swift_bridgeObjectRelease(v2);
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v8, v3, v4);
  swift_bridgeObjectRelease(v4);
  if (*((_BYTE *)v0 + 32)) {
    uint64_t v5 = 0x64656E69617254LL;
  }
  else {
    uint64_t v5 = 0x656E696C65736142LL;
  }
  if (*((_BYTE *)v0 + 32)) {
    unint64_t v6 = 0xE700000000000000LL;
  }
  else {
    unint64_t v6 = 0xE800000000000000LL;
  }
  String.hash(into:)(v8, v5, v6);
  swift_bridgeObjectRelease(v6);
  String.hash(into:)(v8, 0x72616C616353LL, 0xE600000000000000LL);
  return Hasher._finalize()();
}

uint64_t sub_10000D138(uint64_t a1, uint64_t a2)
{
  return sub_10000FF44( *(void *)a1,  *(void *)(a1 + 8),  *(void *)(a1 + 16),  *(void *)(a1 + 24),  *(_BYTE *)(a1 + 32),  *(void *)a2,  *(void *)(a2 + 8),  *(void *)(a2 + 16),  *(void *)(a2 + 24),  *(_BYTE *)(a2 + 32)) & 1;
}

uint64_t sub_10000D184(uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  int v7 = *((unsigned __int8 *)v1 + 32);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(a1, v5, v6);
  swift_bridgeObjectRelease(v6);
  if (v7) {
    uint64_t v8 = 0x64656E69617254LL;
  }
  else {
    uint64_t v8 = 0x656E696C65736142LL;
  }
  if (v7) {
    unint64_t v9 = 0xE700000000000000LL;
  }
  else {
    unint64_t v9 = 0xE800000000000000LL;
  }
  String.hash(into:)(a1, v8, v9);
  swift_bridgeObjectRelease(v9);
  return String.hash(into:)(a1, 0x72616C616353LL, 0xE600000000000000LL);
}

Swift::Int sub_10000D258(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  int v6 = *((unsigned __int8 *)v1 + 32);
  Hasher.init(_seed:)(v10, a1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v10, v2, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v10, v4, v5);
  swift_bridgeObjectRelease(v5);
  if (v6) {
    uint64_t v7 = 0x64656E69617254LL;
  }
  else {
    uint64_t v7 = 0x656E696C65736142LL;
  }
  if (v6) {
    unint64_t v8 = 0xE700000000000000LL;
  }
  else {
    unint64_t v8 = 0xE800000000000000LL;
  }
  String.hash(into:)(v10, v7, v8);
  swift_bridgeObjectRelease(v8);
  String.hash(into:)(v10, 0x72616C616353LL, 0xE600000000000000LL);
  return Hasher._finalize()();
}

double sub_10000D344@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    double result = *(double *)v6;
    __int128 v5 = v6[1];
    *(_OWORD *)a2 = v6[0];
    *(_OWORD *)(a2 + 16) = v5;
    *(_BYTE *)(a2 + 32) = v7;
  }

  return result;
}

uint64_t sub_10000D388(void *a1)
{
  return sub_10000CEC8(a1);
}

uint64_t sub_10000D39C(char *a1, char *a2)
{
  return sub_10000B908(*a1, *a2);
}

Swift::Int sub_10000D3A8()
{
  int v1 = *v0;
  Hasher.init(_seed:)(v5, 0LL);
  if (v1) {
    uint64_t v2 = 0x64656E69617254LL;
  }
  else {
    uint64_t v2 = 0x656E696C65736142LL;
  }
  if (v1) {
    unint64_t v3 = 0xE700000000000000LL;
  }
  else {
    unint64_t v3 = 0xE800000000000000LL;
  }
  String.hash(into:)(v5, v2, v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000D428(uint64_t a1)
{
  if (*v1) {
    uint64_t v2 = 0x64656E69617254LL;
  }
  else {
    uint64_t v2 = 0x656E696C65736142LL;
  }
  if (*v1) {
    unint64_t v3 = 0xE700000000000000LL;
  }
  else {
    unint64_t v3 = 0xE800000000000000LL;
  }
  String.hash(into:)(a1, v2, v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_10000D484(uint64_t a1)
{
  int v2 = *v1;
  Hasher.init(_seed:)(v6, a1);
  if (v2) {
    uint64_t v3 = 0x64656E69617254LL;
  }
  else {
    uint64_t v3 = 0x656E696C65736142LL;
  }
  if (v2) {
    unint64_t v4 = 0xE700000000000000LL;
  }
  else {
    unint64_t v4 = 0xE800000000000000LL;
  }
  String.hash(into:)(v6, v3, v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10000D500@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  unint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001C820, v3);
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

void sub_10000D55C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x656E696C65736142LL;
  if (*v1) {
    uint64_t v2 = 0x64656E69617254LL;
  }
  unint64_t v3 = 0xE800000000000000LL;
  if (*v1) {
    unint64_t v3 = 0xE700000000000000LL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10000D59C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100011828();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10000D5F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_100011828();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_10000D644()
{
  return 1LL;
}

Swift::Int sub_10000D64C()
{
  return Hasher._finalize()();
}

uint64_t sub_10000D698(uint64_t a1)
{
  return String.hash(into:)(a1, 0x72616C616353LL, 0xE600000000000000LL);
}

Swift::Int sub_10000D6AC(uint64_t a1)
{
  return Hasher._finalize()();
}

uint64_t sub_10000D6F4@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  v3._countAndFlagsBits = *a1;
  unint64_t v4 = (void *)a1[1];
  v3._object = v4;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001C870, v3);
  uint64_t result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_10000D744(void *a1@<X8>)
{
  *a1 = 0x72616C616353LL;
  a1[1] = 0xE600000000000000LL;
}

uint64_t sub_10000D75C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001186C();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10000D7B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10001186C();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_10000D804(unint64_t a1, void *a2, void *a3, unsigned int a4)
{
  unint64_t v11 = sub_100006010((uint64_t)_swiftEmptyArrayStorage);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v11);
  uint64_t v85 = (void *)v11;
  sub_100008E4C(0x756F436863746142LL, 0xEA0000000000746ELL, isUniquelyReferenced_nonNull_native, (float)a4);
  uint64_t v13 = (void *)v11;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  id v14 = [a2 evaluationMetrics];
  if (!v14) {
    goto LABEL_6;
  }
  uint64_t v15 = v14;
  id v16 = [a3 evaluationMetrics];
  if (!v16)
  {
    swift_unknownObjectRelease(v15);
LABEL_6:
    if (qword_100020B20 != -1) {
      swift_once(&qword_100020B20, sub_10000B850);
    }
    uint64_t v19 = type metadata accessor for Logger(0LL);
    uint64_t v20 = sub_100005D5C(v19, (uint64_t)qword_100022C60);
    char v21 = (os_log_s *)Logger.logObject.getter(v20);
    os_log_type_t v22 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v21, v22))
    {
      char v23 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)char v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Evaluation metrics are nil.", v23, 2u);
      swift_slowDealloc(v23, -1LL, -1LL);
    }

    return (uint64_t)v13;
  }

  unint64_t v17 = v16;
  uint64_t v18 = sub_100010900(v15);
  if (v4)
  {
    swift_unknownObjectRelease(v15);
    swift_unknownObjectRelease(v17);
    swift_bridgeObjectRelease(v11);
    return (uint64_t)v13;
  }

  uint64_t v79 = v18;
  uint64_t v78 = sub_100010900(v17);
  unint64_t v73 = a1 + 56;
  uint64_t v25 = 1LL << *(_BYTE *)(a1 + 32);
  uint64_t v26 = -1LL;
  if (v25 < 64) {
    uint64_t v26 = ~(-1LL << v25);
  }
  unint64_t v27 = v26 & *(void *)(a1 + 56);
  int64_t v74 = (unint64_t)(v25 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  int64_t v28 = 0LL;
  unint64_t v75 = a1;
  uint64_t v76 = v15;
  os_log_type_t v77 = v17;
  while (1)
  {
    if (v27)
    {
      uint64_t v80 = (v27 - 1) & v27;
      int64_t v81 = v28;
      unint64_t v29 = __clz(__rbit64(v27)) | (v28 << 6);
    }

    else
    {
      int64_t v30 = v28 + 1;
      if (__OFADD__(v28, 1LL)) {
        goto LABEL_74;
      }
      if (v30 >= v74)
      {
LABEL_71:
        swift_unknownObjectRelease(v15);
        swift_release(a1);
        swift_bridgeObjectRelease(v78);
        swift_bridgeObjectRelease(v79);
        swift_unknownObjectRelease(v17);
        return (uint64_t)v13;
      }

      unint64_t v31 = *(void *)(v73 + 8 * v30);
      int64_t v32 = v28 + 1;
      if (!v31)
      {
        int64_t v32 = v28 + 2;
        if (v28 + 2 >= v74) {
          goto LABEL_71;
        }
        unint64_t v31 = *(void *)(v73 + 8 * v32);
        if (!v31)
        {
          int64_t v32 = v28 + 3;
          if (v28 + 3 >= v74) {
            goto LABEL_71;
          }
          unint64_t v31 = *(void *)(v73 + 8 * v32);
          if (!v31)
          {
            uint64_t v33 = v28 + 4;
            if (v28 + 4 >= v74) {
              goto LABEL_71;
            }
            unint64_t v31 = *(void *)(v73 + 8 * v33);
            if (!v31)
            {
              while (1)
              {
                int64_t v32 = v33 + 1;
                if (__OFADD__(v33, 1LL)) {
                  break;
                }
                if (v32 >= v74) {
                  goto LABEL_71;
                }
                unint64_t v31 = *(void *)(v73 + 8 * v32);
                ++v33;
                if (v31) {
                  goto LABEL_33;
                }
              }

              __break(1u);
LABEL_79:
              uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
              __break(1u);
              return result;
            }

            int64_t v32 = v28 + 4;
          }
        }
      }

uint64_t sub_10000E088(uint64_t *a1, uint64_t a2, uint64_t a3)
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
      uint64_t v19 = (void *)(v11 + 16 * v10);
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
  sub_10000EC34(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t v23 = *v3;
  void *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1LL;
}

uint64_t sub_10000E234(uint64_t a1, uint64_t a2)
{
  Swift::String v3 = v2;
  uint64_t v7 = *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 8);
  uint64_t v9 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  uint64_t v10 = *v3;
  Hasher.init(_seed:)(v46, *(void *)(*v3 + 40LL));
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v46, v7, v6);
  uint64_t v45 = v6;
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRetain(v8);
  uint64_t v43 = v9;
  String.hash(into:)(v46, v9, v8);
  uint64_t v44 = v8;
  swift_bridgeObjectRelease(v8);
  if (*(_BYTE *)(a2 + 32)) {
    uint64_t v11 = 0x64656E69617254LL;
  }
  else {
    uint64_t v11 = 0x656E696C65736142LL;
  }
  if (*(_BYTE *)(a2 + 32)) {
    unint64_t v12 = 0xE700000000000000LL;
  }
  else {
    unint64_t v12 = 0xE800000000000000LL;
  }
  uint64_t v41 = v11;
  String.hash(into:)(v46, v11, v12);
  swift_bridgeObjectRelease(v12);
  String.hash(into:)(v46, 0x72616C616353LL, 0xE600000000000000LL);
  Swift::Int v13 = Hasher._finalize()();
  uint64_t v14 = -1LL << *(_BYTE *)(v10 + 32);
  unint64_t v15 = v13 & ~v14;
  uint64_t v42 = v10;
  uint64_t v16 = v10 + 56;
  char v39 = v3;
  uint64_t v40 = a1;
  uint64_t v38 = a2;
  if (((*(void *)(v10 + 56 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0)
  {
LABEL_32:
    swift_bridgeObjectRelease(v42);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v39);
    v46[0] = *v39;
    *char v39 = 0x8000000000000000LL;
    swift_bridgeObjectRetain(v45);
    swift_bridgeObjectRetain(v44);
    sub_10000EDCC(v38, v15, isUniquelyReferenced_nonNull_native);
    uint64_t v30 = *v39;
    *char v39 = v46[0];
    swift_bridgeObjectRelease(v30);
    __int128 v31 = *(_OWORD *)(v38 + 16);
    *(_OWORD *)uint64_t v40 = *(_OWORD *)v38;
    *(_OWORD *)(v40 + 16) = v31;
    *(_BYTE *)(v40 + 32) = *(_BYTE *)(v38 + 32);
    return 1LL;
  }

  uint64_t v17 = ~v14;
  while (1)
  {
    uint64_t v18 = *(void *)(v42 + 48) + 40 * v15;
    uint64_t v19 = *(void *)(v18 + 8);
    uint64_t v21 = *(void *)(v18 + 16);
    uint64_t v20 = *(void *)(v18 + 24);
    int v22 = *(unsigned __int8 *)(v18 + 32);
    BOOL v23 = *(void *)v18 == v7 && v19 == v45;
    if (!v23 && (_stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v18, v19, v7, v45, 0LL) & 1) == 0) {
      goto LABEL_9;
    }
    BOOL v24 = v21 == v43 && v20 == v44;
    if (!v24 && (_stringCompareWithSmolCheck(_:_:expecting:)(v21, v20, v43, v44, 0LL) & 1) == 0) {
      goto LABEL_9;
    }
    uint64_t v25 = v22 ? 0x64656E69617254LL : 0x656E696C65736142LL;
    unint64_t v26 = v22 ? 0xE700000000000000LL : 0xE800000000000000LL;
    if (v25 == v41 && v26 == v12) {
      break;
    }
    char v28 = _stringCompareWithSmolCheck(_:_:expecting:)(v25, v26, v41, v12, 0LL);
    swift_bridgeObjectRetain(v19);
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease(v26);
    swift_bridgeObjectRelease(v12);
    if ((v28 & 1) != 0) {
      goto LABEL_34;
    }
    swift_bridgeObjectRelease(v20);
LABEL_9:
    unint64_t v15 = (v15 + 1) & v17;
    if (((*(void *)(v16 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v15) & 1) == 0) {
      goto LABEL_32;
    }
  }

  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease_n(v12, 2LL);
LABEL_34:
  swift_bridgeObjectRelease(v44);
  swift_bridgeObjectRelease(v45);
  swift_bridgeObjectRelease(v42);
  swift_bridgeObjectRelease(v20);
  uint64_t v33 = *(void *)(*v39 + 48LL) + 40 * v15;
  uint64_t v35 = *(void *)v33;
  uint64_t v34 = *(void *)(v33 + 8);
  uint64_t v36 = *(void *)(v33 + 16);
  uint64_t v37 = *(void *)(v33 + 24);
  LOBYTE(v33) = *(_BYTE *)(v33 + 32);
  *(void *)a1 = v35;
  *(void *)(a1 + 8) = v34;
  *(void *)(a1 + 16) = v36;
  *(void *)(a1 + 24) = v37;
  *(_BYTE *)(a1 + 32) = v33;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRetain(v37);
  return 0LL;
}

Swift::Int sub_10000E5B0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005DB8(&qword_100021030);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    int64_t v32 = v2;
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

Swift::Int sub_10000E88C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005DB8(&qword_100021050);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1LL);
  uint64_t v6 = v5;
  if (*(void *)(v3 + 16))
  {
    uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
    uint64_t v38 = (void *)(v3 + 56);
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v9 = v8 & *(void *)(v3 + 56);
    uint64_t v36 = v2;
    int64_t v37 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = v5 + 56;
    Swift::Int result = swift_retain(v3);
    int64_t v12 = 0LL;
    for (i = v3; ; uint64_t v3 = i)
    {
      if (v9)
      {
        unint64_t v15 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v16 = v15 | (v12 << 6);
      }

      else
      {
        int64_t v17 = v12 + 1;
        if (__OFADD__(v12, 1LL))
        {
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
          return result;
        }

        if (v17 >= v37) {
          goto LABEL_42;
        }
        unint64_t v18 = v38[v17];
        ++v12;
        if (!v18)
        {
          int64_t v12 = v17 + 1;
          if (v17 + 1 >= v37) {
            goto LABEL_42;
          }
          unint64_t v18 = v38[v12];
          if (!v18)
          {
            int64_t v12 = v17 + 2;
            if (v17 + 2 >= v37) {
              goto LABEL_42;
            }
            unint64_t v18 = v38[v12];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v37)
              {
LABEL_42:
                swift_release(v3);
                uint64_t v2 = v36;
                uint64_t v35 = 1LL << *(_BYTE *)(v3 + 32);
                if (v35 > 63) {
                  bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8LL);
                }
                else {
                  *uint64_t v38 = -1LL << v35;
                }
                *(void *)(v3 + 16) = 0LL;
                break;
              }

              unint64_t v18 = v38[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v12 = v19 + 1;
                  if (__OFADD__(v19, 1LL)) {
                    goto LABEL_48;
                  }
                  if (v12 >= v37) {
                    goto LABEL_42;
                  }
                  unint64_t v18 = v38[v12];
                  ++v19;
                  if (v18) {
                    goto LABEL_26;
                  }
                }
              }

              int64_t v12 = v19;
            }
          }
        }

uint64_t sub_10000EC34(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_10000E5B0(v11);
  }

  else
  {
    if (v10 > v9)
    {
      Swift::Int result = (uint64_t)sub_10000F104();
      goto LABEL_22;
    }

    sub_10000F480(v11);
  }

  uint64_t v12 = *v4;
  Hasher.init(_seed:)(v28, *(void *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  Swift::Int result = Hasher._finalize()();
  uint64_t v13 = -1LL << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  uint64_t v14 = v12 + 56;
  if (((*(void *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a3) & 1) != 0)
  {
    uint64_t v15 = *(void *)(v12 + 48);
    unint64_t v16 = (void *)(v15 + 16 * a3);
    uint64_t v17 = v16[1];
    BOOL v18 = *v16 == v8 && v17 == a2;
    if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0LL), (result & 1) != 0))
    {
LABEL_21:
      Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
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
          Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0LL);
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
  uint64_t *v24 = v8;
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

uint64_t sub_10000EDCC(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v7 = result;
  unint64_t v8 = *(void *)(*v3 + 16LL);
  unint64_t v9 = *(void *)(*v3 + 24LL);
  uint64_t v37 = result;
  if (v9 <= v8 || (a3 & 1) == 0)
  {
    uint64_t v10 = v8 + 1;
    if ((a3 & 1) != 0)
    {
      sub_10000E88C(v10);
    }

    else
    {
      if (v9 > v8)
      {
        Swift::Int result = (uint64_t)sub_10000F2B4();
        goto LABEL_39;
      }

      sub_10000F72C(v10);
    }

    uint64_t v4 = 0x656E696C65736142LL;
    uint64_t v11 = *v3;
    Hasher.init(_seed:)(v42, *(void *)(*v3 + 40LL));
    uint64_t v12 = *(void *)v7;
    uint64_t v13 = *(void *)(v7 + 8);
    swift_bridgeObjectRetain(v13);
    String.hash(into:)(v42, v12, v13);
    swift_bridgeObjectRelease(v13);
    uint64_t v14 = *(void *)(v7 + 16);
    uint64_t v15 = *(void **)(v7 + 24);
    swift_bridgeObjectRetain(v15);
    uint64_t v41 = v14;
    String.hash(into:)(v42, v14, v15);
    uint64_t v40 = v15;
    swift_bridgeObjectRelease(v15);
    BOOL v16 = *(_BYTE *)(v7 + 32) == 0;
    if (*(_BYTE *)(v7 + 32)) {
      uint64_t v17 = 0x64656E69617254LL;
    }
    else {
      uint64_t v17 = 0x656E696C65736142LL;
    }
    if (v16) {
      unint64_t v5 = 0xE800000000000000LL;
    }
    else {
      unint64_t v5 = 0xE700000000000000LL;
    }
    String.hash(into:)(v42, v17, v5);
    swift_bridgeObjectRelease(v5);
    String.hash(into:)(v42, 0x72616C616353LL, 0xE600000000000000LL);
    uint64_t v3 = v42;
    Swift::Int result = Hasher._finalize()();
    uint64_t v18 = -1LL << *(_BYTE *)(v11 + 32);
    a2 = result & ~v18;
    uint64_t v39 = v11;
    uint64_t v19 = v11 + 56;
    if (((*(void *)(v19 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
    {
      uint64_t v38 = v17;
      uint64_t v20 = ~v18;
      do
      {
        uint64_t v21 = *(void *)(v39 + 48) + 40 * a2;
        uint64_t v4 = *(void *)(v21 + 8);
        uint64_t v22 = *(void *)(v21 + 16);
        uint64_t v3 = *(void **)(v21 + 24);
        int v23 = *(unsigned __int8 *)(v21 + 32);
        BOOL v24 = *(void *)v21 == v12 && v4 == v13;
        if (v24
          || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*(void *)v21, *(void *)(v21 + 8), v12, v13, 0LL),
              (result & 1) != 0))
        {
          BOOL v25 = v22 == v41 && v3 == v40;
          if (v25 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v3, v41, v40, 0LL), (result & 1) != 0))
          {
            if (v23) {
              uint64_t v26 = 0x64656E69617254LL;
            }
            else {
              uint64_t v26 = 0x656E696C65736142LL;
            }
            if (v23) {
              unint64_t v27 = 0xE700000000000000LL;
            }
            else {
              unint64_t v27 = 0xE800000000000000LL;
            }
            if (v26 == v38 && v27 == v5) {
              goto LABEL_42;
            }
            char v29 = _stringCompareWithSmolCheck(_:_:expecting:)(v26, v27, v38, v5, 0LL);
            swift_bridgeObjectRetain(v4);
            swift_bridgeObjectRetain(v3);
            swift_bridgeObjectRelease(v4);
            swift_bridgeObjectRelease(v27);
            swift_bridgeObjectRelease(v5);
            if ((v29 & 1) != 0) {
              goto LABEL_43;
            }
            Swift::Int result = swift_bridgeObjectRelease(v3);
          }
        }

        a2 = (a2 + 1) & v20;
      }

      while (((*(void *)(v19 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
    }
  }

LABEL_39:
  uint64_t v30 = *v36;
  *(void *)(*v36 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  uint64_t v31 = *(void *)(v30 + 48) + 40 * a2;
  __int128 v32 = *(_OWORD *)(v37 + 16);
  *(_OWORD *)uint64_t v31 = *(_OWORD *)v37;
  *(_OWORD *)(v31 + 16) = v32;
  *(_BYTE *)(v31 + 32) = *(_BYTE *)(v37 + 32);
  uint64_t v33 = *(void *)(v30 + 16);
  BOOL v34 = __OFADD__(v33, 1LL);
  uint64_t v35 = v33 + 1;
  if (v34)
  {
    __break(1u);
LABEL_42:
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRetain(v3);
    swift_bridgeObjectRelease(v4);
    swift_bridgeObjectRelease_n(v5, 2LL);
LABEL_43:
    swift_bridgeObjectRelease(v3);
    Swift::Int result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for ModelEvaluationMetricSpecs);
    __break(1u);
  }

  else
  {
    *(void *)(v30 + 16) = v35;
  }

  return result;
}

void *sub_10000F104()
{
  int v1 = v0;
  sub_100005DB8(&qword_100021030);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    Swift::Int result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 56);
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    uint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *uint64_t v19 = *v17;
    v19[1] = v18;
    Swift::Int result = (void *)swift_bridgeObjectRetain(v18);
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

    unint64_t v12 = (v24 - 1) & v24;
    unint64_t v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t v17 = *(void *)(v2 + 48) + v16;
    uint64_t v19 = *(void *)v17;
    uint64_t v18 = *(void *)(v17 + 8);
    int64_t v20 = *(void *)(v17 + 16);
    unint64_t v21 = *(void *)(v17 + 24);
    LOBYTE(v17) = *(_BYTE *)(v17 + 32);
    int64_t v22 = *(void *)(v4 + 48) + v16;
    *(void *)int64_t v22 = v19;
    *(void *)(v22 + 8) = v18;
    *(void *)(v22 + 16) = v20;
    *(void *)(v22 + 24) = v21;
    *(_BYTE *)(v22 + 32) = v17;
    swift_bridgeObjectRetain(v18);
    Swift::Int result = (void *)swift_bridgeObjectRetain(v21);
  }

  BOOL v25 = v23 + 3;
  if (v25 >= v13) {
    goto LABEL_28;
  }
  BOOL v24 = *(void *)(v6 + 8 * v25);
  if (v24)
  {
    int64_t v9 = v25;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v25 + 1;
    if (__OFADD__(v25, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    BOOL v24 = *(void *)(v6 + 8 * v9);
    ++v25;
    if (v24) {
      goto LABEL_27;
    }
  }

void *sub_10000F2B4()
{
  int v1 = v0;
  sub_100005DB8(&qword_100021050);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)(*v0);
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    Swift::Int result = (void *)swift_release(v2);
    uint64_t *v1 = v4;
    return result;
  }

  Swift::Int result = (void *)(v3 + 56);
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

    int64_t v23 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    if (v23 >= v13) {
      goto LABEL_28;
    }
    unint64_t v24 = *(void *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      int64_t v9 = v23 + 1;
      if (v23 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v24 = *(void *)(v6 + 8 * v9);
      if (!v24)
      {
        int64_t v9 = v23 + 2;
        if (v23 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v24 = *(void *)(v6 + 8 * v9);
        if (!v24) {
          break;
        }
      }
    }

Swift::Int sub_10000F480(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005DB8(&qword_100021030);
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

LABEL_40:
  __break(1u);
  return result;
}

Swift::Int sub_10000F72C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = *v1;
  if (*(void *)(*v1 + 24) <= a1) {
    uint64_t v4 = a1;
  }
  else {
    uint64_t v4 = *(void *)(*v1 + 24);
  }
  sub_100005DB8(&qword_100021050);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0LL);
  uint64_t v6 = v5;
  if (!*(void *)(v3 + 16))
  {
    Swift::Int result = swift_release(v3);
LABEL_44:
    *uint64_t v2 = v6;
    return result;
  }

  uint64_t v7 = 1LL << *(_BYTE *)(v3 + 32);
  uint64_t v35 = v2;
  uint64_t v36 = v3 + 56;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(v3 + 56);
  int64_t v37 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v10 = v5 + 56;
  Swift::Int result = swift_retain(v3);
  int64_t v12 = 0LL;
  for (i = v3; ; uint64_t v3 = i)
  {
    if (v9)
    {
      unint64_t v15 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v16 = v15 | (v12 << 6);
      goto LABEL_27;
    }

    int64_t v17 = v12 + 1;
    if (__OFADD__(v12, 1LL))
    {
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }

    if (v17 >= v37) {
      goto LABEL_42;
    }
    unint64_t v18 = *(void *)(v36 + 8 * v17);
    ++v12;
    if (!v18)
    {
      int64_t v12 = v17 + 1;
      if (v17 + 1 >= v37) {
        goto LABEL_42;
      }
      unint64_t v18 = *(void *)(v36 + 8 * v12);
      if (!v18)
      {
        int64_t v12 = v17 + 2;
        if (v17 + 2 >= v37) {
          goto LABEL_42;
        }
        unint64_t v18 = *(void *)(v36 + 8 * v12);
        if (!v18) {
          break;
        }
      }
    }

LABEL_46:
  __break(1u);
  return result;
}

uint64_t sub_10000FAA8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000FC4C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_10000FAC4(char a1, int64_t a2, char a3, void *a4)
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
        goto LABEL_32;
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
    uint64_t v10 = sub_100005DB8(&qword_100020ED0);
    uint64_t v11 = (void *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = _swiftEmptyArrayStorage;
  }

  unint64_t v14 = (unint64_t)(v11 + 4);
  unint64_t v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 16 * v8) {
      memmove(v11 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0LL;
    goto LABEL_30;
  }

  if (v15 >= v14 + 16 * v8 || v14 >= v15 + 16 * v8)
  {
    uint64_t v18 = sub_100005DB8(&qword_100020EC0);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v18);
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

          sub_100005EB0(v1);
          return (unint64_t)v3;
        }
      }
    }
  }

uint64_t sub_10000FC4C(char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = sub_100005DB8(&qword_100021038);
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
  unint64_t v15 = a4 + 32;
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
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

uint64_t sub_10000FDB4(uint64_t a1)
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

  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128LL;
    return __clz(__rbit64(v1)) + v2;
  }

  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3LL;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128LL;
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

int64_t sub_10000FE54(int64_t result, int a2, char a3, uint64_t a4)
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
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }

  return result;
}

uint64_t sub_10000FF38(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return swift_bridgeObjectRelease(result);
  }
  return result;
}

uint64_t sub_10000FF44( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if (a1 == a6 && a2 == a7 || (char v14 = 0, (((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))() & 1) != 0))
  {
    if (a3 == a8 && a4 == a9 || (char v14 = 0, (_stringCompareWithSmolCheck(_:_:expecting:)(a3, a4, a8, a9, 0LL) & 1) != 0))
    {
      if ((a5 & 1) != 0) {
        uint64_t v15 = 0x64656E69617254LL;
      }
      else {
        uint64_t v15 = 0x656E696C65736142LL;
      }
      if ((a5 & 1) != 0) {
        unint64_t v16 = 0xE700000000000000LL;
      }
      else {
        unint64_t v16 = 0xE800000000000000LL;
      }
      if ((a10 & 1) != 0) {
        uint64_t v17 = 0x64656E69617254LL;
      }
      else {
        uint64_t v17 = 0x656E696C65736142LL;
      }
      if ((a10 & 1) != 0) {
        unint64_t v18 = 0xE700000000000000LL;
      }
      else {
        unint64_t v18 = 0xE800000000000000LL;
      }
      if (v15 == v17 && v16 == v18)
      {
        char v14 = 1;
        unint64_t v18 = v16;
      }

      else
      {
        char v14 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v17, v18, 0LL);
      }

      swift_bridgeObjectRelease(v16);
      swift_bridgeObjectRelease(v18);
    }
  }

  return v14 & 1;
}

id sub_10001005C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  unint64_t v7 = v6;
  id v16 = 0LL;
  id v8 =  [(id)swift_getObjCClassFromMetadata(v3) modelWithContentsOfURL:v6 configuration:a2 error:&v16];

  id v9 = v16;
  if (v8)
  {
    uint64_t v10 = type metadata accessor for URL(0LL);
    unint64_t v11 = *(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8LL);
    id v12 = v9;
    v11(a1, v10);
  }

  else
  {
    id v13 = v16;
    _convertNSErrorToError(_:)(v9);

    swift_willThrow();
    uint64_t v14 = type metadata accessor for URL(0LL);
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8LL))(a1, v14);
  }

  return v8;
}

uint64_t sub_100010178(uint64_t a1)
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
      sub_10000E088(v7, v5, v6);
      swift_bridgeObjectRelease(v7[1]);
      v4 += 2;
      --v2;
    }

    while (v2);
    return v8;
  }

  return result;
}

uint64_t sub_10001020C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = sub_100010F30();
  uint64_t result = Set.init(minimumCapacity:)(v2, &type metadata for ModelEvaluationMetricSpecs, v3);
  uint64_t v14 = result;
  if (v2)
  {
    uint64_t v5 = (_BYTE *)(a1 + 64);
    do
    {
      uint64_t v7 = *((void *)v5 - 4);
      uint64_t v6 = *((void *)v5 - 3);
      uint64_t v8 = *((void *)v5 - 2);
      uint64_t v9 = *((void *)v5 - 1);
      char v10 = *v5;
      v5 += 40;
      v15[0] = v7;
      v15[1] = v6;
      v15[2] = v8;
      v15[3] = v9;
      char v16 = v10;
      swift_bridgeObjectRetain(v6);
      swift_bridgeObjectRetain(v9);
      sub_10000E234((uint64_t)v11, (uint64_t)v15);
      swift_bridgeObjectRelease(v12);
      swift_bridgeObjectRelease(v13);
      --v2;
    }

    while (v2);
    return v14;
  }

  return result;
}

unint64_t sub_1000102B0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001C7A0, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4) {
    return 4LL;
  }
  else {
    return v3;
  }
}

uint64_t sub_1000102F8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = sub_100005DB8(&qword_100021070);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A864(a1, v9);
  unint64_t v11 = sub_10001124C();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for ModelEvaluationMetricSpecs.CodingKeys,  &type metadata for ModelEvaluationMetricSpecs.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return sub_100005EC8(a1);
  }
  BYTE2(v29) = 0;
  uint64_t v12 = KeyedDecodingContainer.decode(_:forKey:)((char *)&v29 + 2, v5);
  uint64_t v14 = v13;
  BYTE1(v29) = 1;
  swift_bridgeObjectRetain(v13);
  uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)((char *)&v29 + 1, v5);
  uint64_t v17 = v16;
  uint64_t v25 = v15;
  char v28 = 2;
  unint64_t v18 = sub_100011290();
  swift_bridgeObjectRetain(v17);
  uint64_t v26 = v17;
  KeyedDecodingContainer.decode<A>(_:forKey:)( &v29,  &type metadata for ModelEvaluationMetricType,  &v28,  v5,  &type metadata for ModelEvaluationMetricType,  v18);
  int v24 = v29;
  char v27 = 3;
  unint64_t v19 = sub_1000112D4();
  KeyedDecodingContainer.decode<A>(_:forKey:)( v20,  &type metadata for MetricEncoding,  &v27,  v5,  &type metadata for MetricEncoding,  v19);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100005EC8(a1);
  uint64_t v21 = v26;
  swift_bridgeObjectRelease(v26);
  uint64_t result = swift_bridgeObjectRelease(v14);
  *(void *)a2 = v12;
  *(void *)(a2 + 8) = v14;
  *(void *)(a2 + 16) = v25;
  *(void *)(a2 + 24) = v21;
  *(_BYTE *)(a2 + 32) = v24;
  return result;
}

void sub_100010570(void *a1)
{
  id v2 = [a1 type];
  if (v2 == (id)1)
  {
    [a1 int64Value];
    return;
  }

  if (v2 == (id)5)
  {
    id v3 = [a1 multiArrayValue];
    if (v3)
    {
      unint64_t v4 = v3;
      if ([v3 count] == (id)1)
      {
        id v5 = [v4 objectAtIndexedSubscript:0];
        [v5 floatValue];

        return;
      }
    }

    if (qword_100020B20 != -1) {
      swift_once(&qword_100020B20, sub_10000B850);
    }
    uint64_t v14 = type metadata accessor for Logger(0LL);
    sub_100005D5C(v14, (uint64_t)qword_100022C60);
    id v7 = a1;
    uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      unint64_t v11 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v10 = 138412290;
      id v19 = v7;
      id v15 = v7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v10 + 4, v10 + 12);
      *unint64_t v11 = v7;

      uint64_t v13 = "Feature value not scalar: %@";
      goto LABEL_18;
    }

LABEL_19:
    goto LABEL_20;
  }

  if (v2 == (id)2)
  {
    [a1 doubleValue];
    return;
  }

  if (qword_100020B20 != -1) {
    swift_once(&qword_100020B20, sub_10000B850);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  sub_100005D5C(v6, (uint64_t)qword_100022C60);
  id v7 = a1;
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.error.getter();
  if (!os_log_type_enabled(v8, v9)) {
    goto LABEL_19;
  }
  uint64_t v10 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
  unint64_t v11 = (void *)swift_slowAlloc(8LL, -1LL);
  *(_DWORD *)uint64_t v10 = 138412290;
  id v19 = v7;
  id v12 = v7;
  UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v10 + 4, v10 + 12);
  *unint64_t v11 = v7;

  uint64_t v13 = "Invalid feature value %@";
LABEL_18:
  _os_log_impl((void *)&_mh_execute_header, v8, v9, v13, v10, 0xCu);
  uint64_t v16 = sub_100005DB8(&qword_100020C70);
  swift_arrayDestroy(v11, 1LL, v16);
  swift_slowDealloc(v11, -1LL, -1LL);
  swift_slowDealloc(v10, -1LL, -1LL);

LABEL_20:
  unint64_t v17 = sub_100010EEC();
  swift_allocError(&type metadata for ModelTrainerError, v17, 0LL, 0LL);
  *unint64_t v18 = 3;
  swift_willThrow();
}

uint64_t sub_100010900(void *a1)
{
  uint64_t v4 = v1;
  unint64_t isUniquelyReferenced_nonNull_native = sub_100006010((uint64_t)_swiftEmptyArrayStorage);
  id v58 = a1;
  unint64_t v7 = (unint64_t)[a1 count];
  if ((v7 & 0x8000000000000000LL) != 0)
  {
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }

  if (v7)
  {
    uint64_t v8 = 0LL;
    os_log_type_t v9 = &BiomeSQLClient;
    char v56 = (char *)v7;
LABEL_4:
    if (v8 != (char *)v7)
    {
      uint64_t v57 = v8 + 1;
      id v61 = objc_msgSend(v58, (SEL)v9[33].base_prots);
      id v10 = [v61 featureNames];
      unint64_t v11 = isUniquelyReferenced_nonNull_native;
      uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      int64_t v13 = 0LL;
      uint64_t v14 = *(void *)(v12 + 56);
      uint64_t v59 = v12 + 56;
      uint64_t v62 = v12;
      char v15 = *(_BYTE *)(v12 + 32);
      unint64_t isUniquelyReferenced_nonNull_native = v11;
      uint64_t v16 = 1LL << v15;
      if (v16 < 64) {
        uint64_t v17 = ~(-1LL << v16);
      }
      else {
        uint64_t v17 = -1LL;
      }
      unint64_t v18 = v17 & v14;
      int64_t v60 = (unint64_t)(v16 + 63) >> 6;
      while (1)
      {
        if (v18)
        {
          unint64_t v19 = __clz(__rbit64(v18));
          v18 &= v18 - 1;
          unint64_t v20 = v19 | (v13 << 6);
        }

        else
        {
          BOOL v21 = __OFADD__(v13++, 1LL);
          if (v21) {
            goto LABEL_55;
          }
          if (v13 >= v60)
          {
LABEL_44:
            swift_unknownObjectRelease(v61);
            swift_release(v62);
            unint64_t v7 = (unint64_t)v56;
            uint64_t v8 = v57;
            os_log_type_t v9 = &BiomeSQLClient;
            if (v57 != v56) {
              goto LABEL_4;
            }
            return isUniquelyReferenced_nonNull_native;
          }

          unint64_t v22 = *(void *)(v59 + 8 * v13);
          if (!v22)
          {
            int64_t v23 = v13 + 1;
            if (v13 + 1 >= v60) {
              goto LABEL_44;
            }
            unint64_t v22 = *(void *)(v59 + 8 * v23);
            if (!v22)
            {
              int64_t v23 = v13 + 2;
              if (v13 + 2 >= v60) {
                goto LABEL_44;
              }
              unint64_t v22 = *(void *)(v59 + 8 * v23);
              if (!v22)
              {
                int64_t v23 = v13 + 3;
                if (v13 + 3 >= v60) {
                  goto LABEL_44;
                }
                unint64_t v22 = *(void *)(v59 + 8 * v23);
                if (!v22)
                {
                  while (1)
                  {
                    int64_t v13 = v23 + 1;
                    if (__OFADD__(v23, 1LL)) {
                      goto LABEL_56;
                    }
                    if (v13 >= v60) {
                      goto LABEL_44;
                    }
                    unint64_t v22 = *(void *)(v59 + 8 * v13);
                    ++v23;
                    if (v22) {
                      goto LABEL_23;
                    }
                  }
                }
              }
            }

            int64_t v13 = v23;
          }

LABEL_58:
    __break(1u);
LABEL_59:
    swift_once(&qword_100020B20, sub_10000B850);
LABEL_47:
    uint64_t v45 = type metadata accessor for Logger(0LL);
    sub_100005D5C(v45, (uint64_t)qword_100022C60);
    uint64_t v46 = swift_bridgeObjectRetain(v3);
    BOOL v47 = (os_log_s *)Logger.logObject.getter(v46);
    os_log_type_t v48 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v47, v48))
    {
      char v49 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      unint64_t v50 = isUniquelyReferenced_nonNull_native;
      uint64_t v51 = swift_slowAlloc(32LL, -1LL);
      unint64_t v65 = v51;
      *(_DWORD *)char v49 = 136315138;
      swift_bridgeObjectRetain(v3);
      uint64_t v63 = sub_100007F0C(v2, v3, (uint64_t *)&v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v49 + 4, v49 + 12);
      swift_bridgeObjectRelease_n(v3, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Couldn't find feature value for %s", v49, 0xCu);
      swift_arrayDestroy(v51, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v52 = v51;
      unint64_t isUniquelyReferenced_nonNull_native = v50;
      swift_slowDealloc(v52, -1LL, -1LL);
      swift_slowDealloc(v49, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v3, 2LL);
    }

    unint64_t v53 = sub_100010EEC();
    swift_allocError(&type metadata for ModelTrainerError, v53, 0LL, 0LL);
    *BOOL v54 = 2;
    swift_willThrow();
    swift_bridgeObjectRelease(isUniquelyReferenced_nonNull_native);
    swift_release(v62);
    swift_unknownObjectRelease(v61);
  }

  return isUniquelyReferenced_nonNull_native;
}

unint64_t sub_100010EEC()
{
  unint64_t result = qword_100021040;
  if (!qword_100021040)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for ModelTrainerError,  &type metadata for ModelTrainerError);
    atomic_store(result, (unint64_t *)&qword_100021040);
  }

  return result;
}

unint64_t sub_100010F30()
{
  unint64_t result = qword_100021048;
  if (!qword_100021048)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000183B4, &type metadata for ModelEvaluationMetricSpecs);
    atomic_store(result, (unint64_t *)&qword_100021048);
  }

  return result;
}

unint64_t sub_100010F74()
{
  unint64_t result = qword_100021058;
  if (!qword_100021058)
  {
    uint64_t v1 = objc_opt_self(&OBJC_CLASS___MLModel);
    unint64_t result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021058);
  }

  return result;
}

unint64_t sub_100010FB0()
{
  unint64_t result = qword_100021060;
  if (!qword_100021060)
  {
    uint64_t v1 = type metadata accessor for URL(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for URL, v1);
    atomic_store(result, (unint64_t *)&qword_100021060);
  }

  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ModelEvaluationMetricSpecs(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for ModelEvaluationMetricSpecs(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 24));
}

uint64_t initializeWithCopy for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t assignWithCopy for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ModelEvaluationMetricSpecs(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricSpecs(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 33)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelEvaluationMetricSpecs(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(_BYTE *)(result + 32) = 0;
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
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 33) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ModelEvaluationMetricSpecs()
{
  return &type metadata for ModelEvaluationMetricSpecs;
}

unint64_t sub_100011208()
{
  unint64_t result = qword_100021068;
  if (!qword_100021068)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001838C, &type metadata for ModelEvaluationMetricSpecs);
    atomic_store(result, (unint64_t *)&qword_100021068);
  }

  return result;
}

unint64_t sub_10001124C()
{
  unint64_t result = qword_100021078;
  if (!qword_100021078)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001874C, &type metadata for ModelEvaluationMetricSpecs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021078);
  }

  return result;
}

unint64_t sub_100011290()
{
  unint64_t result = qword_100021080;
  if (!qword_100021080)
  {
    unint64_t result = swift_getWitnessTable(&unk_100018724, &type metadata for ModelEvaluationMetricType);
    atomic_store(result, (unint64_t *)&qword_100021080);
  }

  return result;
}

unint64_t sub_1000112D4()
{
  unint64_t result = qword_100021088;
  if (!qword_100021088)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000186FC, &type metadata for MetricEncoding);
    atomic_store(result, (unint64_t *)&qword_100021088);
  }

  return result;
}

unint64_t sub_100011318()
{
  unint64_t result = qword_100021098;
  if (!qword_100021098)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000186D4, &type metadata for ModelEvaluationMetricType);
    atomic_store(result, (unint64_t *)&qword_100021098);
  }

  return result;
}

unint64_t sub_10001135C()
{
  unint64_t result = qword_1000210A0;
  if (!qword_1000210A0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000186AC, &type metadata for MetricEncoding);
    atomic_store(result, (unint64_t *)&qword_1000210A0);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for ModelEvaluationMetricSpecs.CodingKeys( unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ModelEvaluationMetricSpecs.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001147C + 4 * byte_100018321[v4]))();
  }
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1000114B0 + 4 * byte_10001831C[v4]))();
}

uint64_t sub_1000114B0(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000114B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000114C0LL);
  }
  return result;
}

uint64_t sub_1000114CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000114D4LL);
  }
  *(_BYTE *)unint64_t result = a2 + 3;
  return result;
}

uint64_t sub_1000114D8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000114E0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModelEvaluationMetricSpecs.CodingKeys()
{
  return &type metadata for ModelEvaluationMetricSpecs.CodingKeys;
}

uint64_t getEnumTagSinglePayload for MetricEncoding(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  else {
    int v2 = 2;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for MetricEncoding(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100011590 + 4 * byte_100018326[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000115B0 + 4 * byte_10001832B[v4]))();
  }
}

_BYTE *sub_100011590(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_1000115B0(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000115B8(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000115C0(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_1000115C8(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_1000115D0(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t sub_1000115DC()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for MetricEncoding()
{
  return &type metadata for MetricEncoding;
}

uint64_t storeEnumTagSinglePayload for ModelEvaluationMetricType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100011640 + 4 * byte_100018335[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100011674 + 4 * byte_100018330[v4]))();
}

uint64_t sub_100011674(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001167C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x100011684LL);
  }
  return result;
}

uint64_t sub_100011690(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x100011698LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10001169C(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000116A4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ModelEvaluationMetricType()
{
  return &type metadata for ModelEvaluationMetricType;
}

unint64_t sub_1000116C4()
{
  unint64_t result = qword_1000210A8;
  if (!qword_1000210A8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000184F4, &type metadata for ModelEvaluationMetricType);
    atomic_store(result, (unint64_t *)&qword_1000210A8);
  }

  return result;
}

unint64_t sub_10001170C()
{
  unint64_t result = qword_1000210B0;
  if (!qword_1000210B0)
  {
    unint64_t result = swift_getWitnessTable(&unk_100018594, &type metadata for MetricEncoding);
    atomic_store(result, (unint64_t *)&qword_1000210B0);
  }

  return result;
}

unint64_t sub_100011754()
{
  unint64_t result = qword_1000210B8;
  if (!qword_1000210B8)
  {
    unint64_t result = swift_getWitnessTable(&unk_100018684, &type metadata for ModelEvaluationMetricSpecs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000210B8);
  }

  return result;
}

unint64_t sub_10001179C()
{
  unint64_t result = qword_1000210C0;
  if (!qword_1000210C0)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000185BC, &type metadata for ModelEvaluationMetricSpecs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000210C0);
  }

  return result;
}

unint64_t sub_1000117E4()
{
  unint64_t result = qword_1000210C8;
  if (!qword_1000210C8)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000185E4, &type metadata for ModelEvaluationMetricSpecs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000210C8);
  }

  return result;
}

unint64_t sub_100011828()
{
  unint64_t result = qword_1000210D0;
  if (!qword_1000210D0)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001847C, &type metadata for ModelEvaluationMetricType);
    atomic_store(result, (unint64_t *)&qword_1000210D0);
  }

  return result;
}

unint64_t sub_10001186C()
{
  unint64_t result = qword_1000210D8;
  if (!qword_1000210D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001851C, &type metadata for MetricEncoding);
    atomic_store(result, (unint64_t *)&qword_1000210D8);
  }

  return result;
}

uint64_t MusicAppSelectionPFLPlugin.perform(_:)(void *a1)
{
  uint64_t v3 = type metadata accessor for MusicAppSelectionPFLPluginRunner();
  uint64_t v4 = swift_allocObject(v3, 216LL, 7LL);
  uint64_t v5 = sub_1000141C0(a1);
  if (!v1)
  {
    uint64_t v6 = v5;
    uint64_t v4 = sub_100014AAC();
    swift_release(v6);
  }

  return v4;
}

Swift::Void __swiftcall MusicAppSelectionPFLPlugin.stop()()
{
  if (qword_100020B20 != -1) {
    swift_once(&qword_100020B20, sub_10000B850);
  }
  uint64_t v0 = type metadata accessor for Logger(0LL);
  uint64_t v1 = sub_100005D5C(v0, (uint64_t)qword_100022C60);
  oslog = (os_log_s *)Logger.logObject.getter(v1);
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v2, "MusicAppSelectionPFLPlugin requested to stop.", v3, 2u);
    swift_slowDealloc(v3, -1LL, -1LL);
  }
}

id MusicAppSelectionPFLPlugin.__allocating_init()()
{
  return [objc_allocWithZone(v0) init];
}

id MusicAppSelectionPFLPlugin.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MusicAppSelectionPFLPlugin();
  return objc_msgSendSuper2(&v2, "init");
}

id MusicAppSelectionPFLPlugin.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MusicAppSelectionPFLPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MusicAppSelectionPFLPlugin()
{
  return objc_opt_self(&OBJC_CLASS___MusicAppSelectionPFLPlugin);
}

uint64_t destroy for MusicAppSelectionPFLPluginArgs(void *a1)
{
  return swift_bridgeObjectRelease(a1[21]);
}

uint64_t initializeWithCopy for MusicAppSelectionPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 40) = v5;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  uint64_t v6 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v6;
  uint64_t v7 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 112);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  *(void *)(a1 + 112) = v8;
  uint64_t v10 = *(void *)(a2 + 120);
  uint64_t v9 = *(void *)(a2 + 128);
  *(void *)(a1 + 120) = v10;
  *(void *)(a1 + 128) = v9;
  uint64_t v12 = *(void *)(a2 + 136);
  uint64_t v11 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = v12;
  *(void *)(a1 + 144) = v11;
  uint64_t v14 = *(void *)(a2 + 152);
  uint64_t v13 = *(void *)(a2 + 160);
  *(void *)(a1 + 152) = v14;
  *(void *)(a1 + 160) = v13;
  uint64_t v15 = *(void *)(a2 + 168);
  *(void *)(a1 + 168) = v15;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  return a1;
}

uint64_t assignWithCopy for MusicAppSelectionPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a1 + 32);
  *(void *)(a1 + 32) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(void *)(a2 + 40);
  uint64_t v9 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  uint64_t v10 = *(void *)(a2 + 64);
  uint64_t v11 = *(void *)(a1 + 64);
  *(void *)(a1 + 64) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  uint64_t v12 = *(void *)(a2 + 80);
  uint64_t v13 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  uint64_t v14 = *(void *)(a2 + 112);
  uint64_t v15 = *(void *)(a1 + 112);
  *(void *)(a1 + 112) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = *(void *)(a2 + 120);
  uint64_t v17 = *(void *)(a1 + 120);
  *(void *)(a1 + 120) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  uint64_t v18 = *(void *)(a2 + 136);
  uint64_t v19 = *(void *)(a1 + 136);
  *(void *)(a1 + 136) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  uint64_t v20 = *(void *)(a2 + 152);
  uint64_t v21 = *(void *)(a1 + 152);
  *(void *)(a1 + 152) = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  uint64_t v22 = *(void *)(a2 + 168);
  uint64_t v23 = *(void *)(a1 + 168);
  *(void *)(a1 + 168) = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  return a1;
}

__n128 initializeWithTake for MusicAppSelectionPFLPluginArgs(uint64_t a1, __int128 *a2)
{
  __int128 v2 = *a2;
  __int128 v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
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
  __int128 v9 = a2[10];
  *(_OWORD *)(a1 + 144) = a2[9];
  *(_OWORD *)(a1 + 160) = v9;
  *(__n128 *)(a1 + 112) = result;
  *(_OWORD *)(a1 + 128) = v8;
  return result;
}

uint64_t assignWithTake for MusicAppSelectionPFLPluginArgs(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease(v5);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease(*(void *)(a1 + 32));
  uint64_t v6 = *(void *)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease(v6);
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  uint64_t v7 = *(void *)(a2 + 64);
  uint64_t v8 = *(void *)(a1 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v7;
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = *(void *)(a2 + 80);
  uint64_t v10 = *(void *)(a1 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v9;
  swift_bridgeObjectRelease(v10);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRelease(*(void *)(a1 + 112));
  uint64_t v11 = *(void *)(a1 + 120);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(void *)(a2 + 136);
  uint64_t v13 = *(void *)(a1 + 136);
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  *(void *)(a1 + 136) = v12;
  swift_bridgeObjectRelease(v13);
  uint64_t v14 = *(void *)(a2 + 152);
  uint64_t v15 = *(void *)(a1 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v14;
  swift_bridgeObjectRelease(v15);
  uint64_t v16 = *(void *)(a2 + 168);
  uint64_t v17 = *(void *)(a1 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v16;
  swift_bridgeObjectRelease(v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicAppSelectionPFLPluginArgs(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 176)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicAppSelectionPFLPluginArgs(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 168) = 0LL;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(_BYTE *)(result + 176) = 1;
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

    *(_BYTE *)(result + 176) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for MusicAppSelectionPFLPluginArgs()
{
  return &type metadata for MusicAppSelectionPFLPluginArgs;
}

uint64_t sub_10001215C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100012198 + 4 * aC[a1]))( 0x676E696E7261654CLL,  0xEC00000065746152LL);
}

unint64_t sub_100012198()
{
  return 0xD000000000000012LL;
}

uint64_t sub_100012328(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_100012364 + 4 * byte_1000187CF[a1]))( 0x676E696E7261654CLL,  0xEC00000065746152LL);
}

unint64_t sub_100012364()
{
  return 0xD000000000000012LL;
}

uint64_t sub_1000124F4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2 = *a2;
  uint64_t v3 = sub_10001215C(*a1);
  uint64_t v5 = v4;
  uint64_t v6 = sub_10001215C(v2);
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

Swift::Int sub_10001257C()
{
  unsigned __int8 v1 = *v0;
  Hasher.init(_seed:)(v6, 0LL);
  uint64_t v2 = sub_10001215C(v1);
  uint64_t v4 = v3;
  String.hash(into:)(v6, v2, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_1000125DC(uint64_t a1)
{
  uint64_t v3 = sub_10001215C(*v1);
  uint64_t v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_10001261C(uint64_t a1)
{
  unsigned __int8 v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  uint64_t v3 = sub_10001215C(v2);
  uint64_t v5 = v4;
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v5);
  return Hasher._finalize()();
}

unint64_t sub_100012678@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_10001318C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000126A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10001215C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1000126CC()
{
  return sub_100012328(*v0);
}

unint64_t sub_1000126D4@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result = sub_10001318C(a1);
  *a2 = result;
  return result;
}

void sub_1000126F8(_BYTE *a1@<X8>)
{
  *a1 = 15;
}

uint64_t sub_100012704(uint64_t a1)
{
  unint64_t v2 = sub_100013B90();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001272C(uint64_t a1)
{
  unint64_t v2 = sub_100013B90();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100012754(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005DB8(&qword_100021208);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  sub_10000A864(a1, v9);
  unint64_t v11 = sub_100013B90();
  dispatch thunk of Encoder.container<A>(keyedBy:)( &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys,  &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys,  v11,  v9,  v10);
  float v12 = *(float *)v3;
  LOBYTE(v39) = 0;
  KeyedEncodingContainer.encode(_:forKey:)(&v39, v5, v12);
  if (!v2)
  {
    uint64_t v13 = *(unsigned int *)(v3 + 4);
    LOBYTE(v39) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v13, &v39, v5);
    uint64_t v14 = *(void *)(v3 + 8);
    uint64_t v15 = *(void *)(v3 + 16);
    LOBYTE(v39) = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v39, v5);
    uint64_t v16 = *(void *)(v3 + 24);
    uint64_t v17 = *(void *)(v3 + 32);
    LOBYTE(v39) = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v39, v5);
    uint64_t v39 = *(void *)(v3 + 40);
    HIBYTE(v38) = 4;
    uint64_t v18 = sub_100005DB8(&qword_1000211E0);
    uint64_t v19 = sub_100013DB4( &qword_100021210,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v39, (char *)&v38 + 7, v5, v18, v19);
    uint64_t v20 = *(unsigned int *)(v3 + 48);
    LOBYTE(v39) = 5;
    KeyedEncodingContainer.encode(_:forKey:)(v20, &v39, v5);
    uint64_t v21 = *(void *)(v3 + 56);
    uint64_t v22 = *(void *)(v3 + 64);
    LOBYTE(v39) = 6;
    KeyedEncodingContainer.encode(_:forKey:)(v21, v22, &v39, v5);
    uint64_t v23 = *(void *)(v3 + 72);
    uint64_t v24 = *(void *)(v3 + 80);
    LOBYTE(v39) = 7;
    KeyedEncodingContainer.encode(_:forKey:)(v23, v24, &v39, v5);
    uint64_t v25 = *(void *)(v3 + 88);
    LOBYTE(v39) = 8;
    KeyedEncodingContainer.encode(_:forKey:)(v25, &v39, v5);
    uint64_t v26 = *(void *)(v3 + 96);
    LOBYTE(v39) = 9;
    KeyedEncodingContainer.encode(_:forKey:)(v26, &v39, v5);
    uint64_t v27 = *(void *)(v3 + 104);
    uint64_t v28 = *(void *)(v3 + 112);
    LOBYTE(v39) = 10;
    KeyedEncodingContainer.encode(_:forKey:)(v27, v28, &v39, v5);
    uint64_t v39 = *(void *)(v3 + 120);
    HIBYTE(v38) = 11;
    uint64_t v29 = sub_100005DB8(&qword_1000211F0);
    uint64_t v30 = sub_100013E14( &qword_100021218,  (void (*)(void))sub_100013E7C,  (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encode<A>(_:forKey:)(&v39, (char *)&v38 + 7, v5, v29, v30);
    uint64_t v31 = *(void *)(v3 + 128);
    uint64_t v32 = *(void *)(v3 + 136);
    LOBYTE(v39) = 12;
    KeyedEncodingContainer.encode(_:forKey:)(v31, v32, &v39, v5);
    uint64_t v33 = *(void *)(v3 + 144);
    uint64_t v34 = *(void *)(v3 + 152);
    LOBYTE(v39) = 13;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v33, v34, &v39, v5);
    uint64_t v35 = *(void *)(v3 + 160);
    uint64_t v36 = *(void *)(v3 + 168);
    LOBYTE(v39) = 14;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v35, v36, &v39, v5);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

__n128 sub_100012AE8@<Q0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!v2)
  {
    __int128 v5 = v9[9];
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_OWORD *)(a2 + 144) = v5;
    *(_OWORD *)(a2 + 160) = v9[10];
    __int128 v6 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v6;
    __int128 v7 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v7;
    __int128 v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
    __n128 result = (__n128)v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(__n128 *)(a2 + 48) = result;
  }

  return result;
}

uint64_t sub_100012B48(void *a1)
{
  return sub_100012754(a1);
}

void sub_100012B5C(void *a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v5 = (void *)objc_opt_self(&OBJC_CLASS___NSJSONSerialization);
  id v6 = [a1 parameters];
  id v7 = [v6 dictionaryRepresentation];

  uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( v7,  &type metadata for AnyHashable,  (char *)&type metadata for Any + 8,  &protocol witness table for AnyHashable);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  *(void *)&__int128 v73 = 0LL;
  id v10 = [v5 dataWithJSONObject:isa options:0 error:&v73];

  id v11 = (id)v73;
  if (!v10)
  {
    uint64_t v19 = v11;
    uint64_t v18 = _convertNSErrorToError(_:)(v11);

    swift_willThrow();
    goto LABEL_5;
  }

  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
  unint64_t v14 = v13;

  uint64_t v15 = type metadata accessor for JSONDecoder(0LL);
  swift_allocObject(v15, *(unsigned int *)(v15 + 48), *(unsigned __int16 *)(v15 + 52));
  uint64_t v16 = JSONDecoder.init()();
  unint64_t v17 = sub_100013F04();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)( &v73,  &type metadata for MusicAppSelectionPFLPluginArgs,  v12,  v14,  &type metadata for MusicAppSelectionPFLPluginArgs,  v17);
  if (v2)
  {
    sub_100013F48(v12, v14);
    swift_release(v16);
    uint64_t v18 = v2;
LABEL_5:
    if (qword_100020B20 != -1) {
      swift_once(&qword_100020B20, sub_10000B850);
    }
    uint64_t v20 = type metadata accessor for Logger(0LL);
    sub_100005D5C(v20, (uint64_t)qword_100022C60);
    swift_errorRetain(v18);
    uint64_t v21 = swift_errorRetain(v18);
    uint64_t v22 = (os_log_s *)Logger.logObject.getter(v21);
    os_log_type_t v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v25 = (uint64_t *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)uint64_t v24 = 138412290;
      swift_errorRetain(v18);
      uint64_t v26 = _swift_stdlib_bridgeErrorToNSError(v18);
      *(void *)&__int128 v73 = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v73, (char *)&v73 + 8, v24 + 4, v24 + 12);
      *uint64_t v25 = v26;
      swift_errorRelease(v18);
      swift_errorRelease(v18);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Couldn't form MusicAppSelectionPFLPluginArgs: %@", v24, 0xCu);
      uint64_t v27 = sub_100005DB8(&qword_100020C70);
      swift_arrayDestroy(v25, 1LL, v27);
      swift_slowDealloc(v25, -1LL, -1LL);
      swift_slowDealloc(v24, -1LL, -1LL);
    }

    else
    {
      swift_errorRelease(v18);
      swift_errorRelease(v18);
    }

    unint64_t v28 = sub_100013EC0();
    swift_allocError(&type metadata for MusicAppSelectionPFLPluginArgsError, v28, 0LL, 0LL);
    *uint64_t v29 = 0;
    swift_willThrow();

    swift_errorRelease(v18);
    return;
  }

  sub_100013F48(v12, v14);
  swift_release(v16);
  __int128 v72 = v83;
  uint64_t v31 = v85;
  uint64_t v30 = v86;
  uint64_t v32 = v88;
  uint64_t v33 = v92;
  uint64_t v34 = *(void *)(v77 + 16);
  int v35 = v78;
  uint64_t v69 = v82;
  uint64_t v70 = v90;
  if (v34 == v78)
  {
    uint64_t v63 = v92;
    uint64_t v65 = v91;
    uint64_t v61 = v89;
    uint64_t v59 = v87;
    uint64_t v57 = v86;
    uint64_t v58 = v84;
    uint64_t v36 = a1;
    uint64_t v37 = v74;
    uint64_t v38 = v76;
    uint64_t v39 = v77;
    uint64_t v40 = v80;
    uint64_t v67 = v88;
    uint64_t v56 = v85;
    uint64_t v41 = v75;
    __int128 v54 = v73;
    uint64_t v55 = v78;
    uint64_t v42 = v79;
    uint64_t v43 = v81;

    *(_OWORD *)a2 = v54;
    *(void *)(a2 + 16) = v37;
    *(void *)(a2 + 24) = v41;
    *(void *)(a2 + 32) = v38;
    *(void *)(a2 + 40) = v39;
    *(void *)(a2 + 48) = v55;
    *(void *)(a2 + 56) = v42;
    *(void *)(a2 + 64) = v40;
    *(void *)(a2 + 72) = v43;
    *(void *)(a2 + 80) = v69;
    *(_OWORD *)(a2 + 88) = v72;
    *(void *)(a2 + 104) = v58;
    *(void *)(a2 + 112) = v56;
    *(void *)(a2 + 120) = v57;
    *(void *)(a2 + 128) = v59;
    *(void *)(a2 + 136) = v67;
    *(void *)(a2 + 144) = v61;
    *(void *)(a2 + 152) = v70;
    *(void *)(a2 + 160) = v65;
    *(void *)(a2 + 168) = v63;
  }

  else
  {
    uint64_t v60 = v80;
    uint64_t v62 = v77;
    uint64_t v64 = v76;
    uint64_t v66 = v74;
    if (qword_100020B20 != -1) {
      swift_once(&qword_100020B20, sub_10000B850);
    }
    uint64_t v44 = type metadata accessor for Logger(0LL);
    uint64_t v45 = sub_100005D5C(v44, (uint64_t)qword_100022C60);
    uint64_t v46 = (os_log_s *)Logger.logObject.getter(v45);
    os_log_type_t v47 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v68 = v32;
      uint64_t v48 = v30;
      uint64_t v49 = v31;
      uint64_t v50 = swift_slowAlloc(18LL, -1LL);
      *(_DWORD *)uint64_t v50 = 134218240;
      uint64_t v71 = v34;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, &v72, v50 + 4, v50 + 12);
      *(_WORD *)(v50 + 12) = 1024;
      LODWORD(v71) = v35;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v71, (char *)&v71 + 4, v50 + 14, v50 + 18);
      _os_log_impl( (void *)&_mh_execute_header,  v46,  v47,  "Size of featureNames (%ld is not equal to featureCount (%u",  (uint8_t *)v50,  0x12u);
      uint64_t v51 = v50;
      uint64_t v31 = v49;
      uint64_t v30 = v48;
      uint64_t v32 = v68;
      swift_slowDealloc(v51, -1LL, -1LL);
    }

    unint64_t v52 = sub_100013EC0();
    swift_allocError(&type metadata for MusicAppSelectionPFLPluginArgsError, v52, 0LL, 0LL);
    *unint64_t v53 = 1;
    swift_willThrow();
    swift_bridgeObjectRelease(v32);
    swift_bridgeObjectRelease(v30);
    swift_bridgeObjectRelease(v31);
    swift_bridgeObjectRelease(v69);
    swift_bridgeObjectRelease(v60);
    swift_bridgeObjectRelease(v62);
    swift_bridgeObjectRelease(v64);
    swift_bridgeObjectRelease(v66);

    swift_bridgeObjectRelease(v70);
    swift_bridgeObjectRelease(v33);
  }

unint64_t sub_10001318C(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001C8A8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 0xF) {
    return 15LL;
  }
  else {
    return v3;
  }
}

void *sub_1000131D4@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v5 = sub_100005DB8(&qword_1000211D0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1[3];
  uint64_t v10 = a1[4];
  uint64_t v71 = a1;
  sub_10000A864(a1, v9);
  unint64_t v11 = sub_100013B90();
  dispatch thunk of Decoder.container<A>(keyedBy:)( &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys,  &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys,  v11,  v9,  v10);
  if (v2) {
    return (void *)sub_100005EC8(v71);
  }
  LOBYTE(v83[0]) = 0;
  KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  unsigned int v13 = v12;
  LOBYTE(v83[0]) = 1;
  unsigned int v14 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  LOBYTE(v83[0]) = 2;
  uint64_t v66 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  LOBYTE(v83[0]) = 3;
  uint64_t v16 = v15;
  swift_bridgeObjectRetain(v15);
  uint64_t v17 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  uint64_t v70 = v16;
  uint64_t v65 = v17;
  uint64_t v19 = v18;
  uint64_t v20 = sub_100005DB8(&qword_1000211E0);
  LOBYTE(v72) = 4;
  uint64_t v21 = sub_100013DB4( &qword_1000211E8,  (uint64_t)&protocol witness table for String,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  swift_bridgeObjectRetain(v19);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v83, v20, &v72, v5, v20, v21);
  uint64_t v69 = v19;
  uint64_t v22 = v83[0];
  LOBYTE(v83[0]) = 5;
  uint64_t v23 = v22;
  swift_bridgeObjectRetain(v22);
  int v63 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  uint64_t v64 = v23;
  LOBYTE(v83[0]) = 6;
  uint64_t v62 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  LOBYTE(v83[0]) = 7;
  uint64_t v25 = v24;
  swift_bridgeObjectRetain(v24);
  uint64_t v26 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  uint64_t v68 = v25;
  uint64_t v61 = v26;
  LOBYTE(v83[0]) = 8;
  uint64_t v28 = v27;
  swift_bridgeObjectRetain(v27);
  uint64_t v60 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  uint64_t v67 = v28;
  unsigned int v59 = v14;
  LOBYTE(v83[0]) = 9;
  uint64_t v58 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  LOBYTE(v83[0]) = 10;
  uint64_t v56 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  uint64_t v57 = v29;
  uint64_t v30 = sub_100005DB8(&qword_1000211F0);
  LOBYTE(v72) = 11;
  uint64_t v31 = sub_100013E14( &qword_1000211F8,  (void (*)(void))sub_100013C18,  (uint64_t)&protocol conformance descriptor for <A> [A]);
  swift_bridgeObjectRetain(v57);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v83, v30, &v72, v5, v30, v31);
  uint64_t v32 = v83[0];
  LOBYTE(v83[0]) = 12;
  swift_bridgeObjectRetain(v32);
  uint64_t v55 = KeyedDecodingContainer.decode(_:forKey:)(v83, v5);
  uint64_t v34 = v33;
  LOBYTE(v83[0]) = 13;
  swift_bridgeObjectRetain(v33);
  *(void *)&__int128 v54 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v83, v5);
  *((void *)&v54 + 1) = v35;
  v100[0] = 14;
  swift_bridgeObjectRetain(v35);
  uint64_t v36 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v100, v5);
  unint64_t v53 = v37;
  uint64_t v38 = v36;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  *(void *)&__int128 v72 = __PAIR64__(v59, v13);
  uint64_t v40 = v69;
  uint64_t v39 = v70;
  *((void *)&v72 + 1) = v66;
  *(void *)&__int128 v73 = v70;
  *((void *)&v73 + 1) = v65;
  *(void *)&__int128 v74 = v69;
  *((void *)&v74 + 1) = v64;
  LODWORD(v75) = v63;
  *((void *)&v75 + 1) = v62;
  *(void *)&__int128 v76 = v68;
  *((void *)&v76 + 1) = v61;
  *(void *)&__int128 v77 = v67;
  uint64_t v41 = v57;
  *((void *)&v77 + 1) = v60;
  *(void *)&__int128 v78 = v58;
  *((void *)&v78 + 1) = v56;
  *(void *)&__int128 v79 = v57;
  *((void *)&v79 + 1) = v32;
  *(void *)&__int128 v80 = v55;
  *((void *)&v80 + 1) = v34;
  __int128 v81 = v54;
  unsigned __int128 v82 = __PAIR128__(v53, v38);
  uint64_t v52 = v38;
  sub_100013C5C(&v72);
  swift_bridgeObjectRelease(v39);
  swift_bridgeObjectRelease(v40);
  uint64_t v42 = v64;
  swift_bridgeObjectRelease(v64);
  swift_bridgeObjectRelease(v68);
  uint64_t v43 = v67;
  swift_bridgeObjectRelease(v67);
  swift_bridgeObjectRelease(v41);
  swift_bridgeObjectRelease(v32);
  swift_bridgeObjectRelease(v34);
  uint64_t v44 = *((void *)&v54 + 1);
  swift_bridgeObjectRelease(*((void *)&v54 + 1));
  sub_100005EC8(v71);
  v83[0] = __PAIR64__(v59, v13);
  v83[1] = v66;
  v83[2] = v70;
  v83[3] = v65;
  v83[4] = v69;
  v83[5] = v42;
  int v84 = v63;
  uint64_t v85 = v62;
  uint64_t v86 = v68;
  uint64_t v87 = v61;
  uint64_t v88 = v43;
  uint64_t v89 = v60;
  uint64_t v90 = v58;
  uint64_t v91 = v56;
  uint64_t v92 = v41;
  uint64_t v93 = v32;
  uint64_t v94 = v55;
  uint64_t v95 = v34;
  uint64_t v96 = v54;
  uint64_t v97 = v44;
  uint64_t v98 = v52;
  unint64_t v99 = v53;
  __n128 result = sub_100013D08(v83);
  __int128 v46 = v81;
  a2[8] = v80;
  a2[9] = v46;
  a2[10] = v82;
  __int128 v47 = v77;
  a2[4] = v76;
  a2[5] = v47;
  __int128 v48 = v79;
  a2[6] = v78;
  a2[7] = v48;
  __int128 v49 = v73;
  *a2 = v72;
  a2[1] = v49;
  __int128 v50 = v75;
  a2[2] = v74;
  a2[3] = v50;
  return result;
}

unint64_t sub_100013B90()
{
  unint64_t result = qword_1000211D8;
  if (!qword_1000211D8)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001895C, &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000211D8);
  }

  return result;
}

uint64_t sub_100013BD4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2( 255LL,  (char *)a1 + (int)result,  -(result >> 32),  0LL,  0LL);
    *a1 = result;
  }

  return result;
}

unint64_t sub_100013C18()
{
  unint64_t result = qword_100021200;
  if (!qword_100021200)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001841C, &type metadata for ModelEvaluationMetricSpecs);
    atomic_store(result, (unint64_t *)&qword_100021200);
  }

  return result;
}

void *sub_100013C5C(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[10];
  uint64_t v7 = a1[14];
  uint64_t v8 = a1[15];
  uint64_t v9 = a1[17];
  uint64_t v10 = a1[19];
  swift_bridgeObjectRetain(a1[21]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  return a1;
}

void *sub_100013D08(void *a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[10];
  uint64_t v7 = a1[14];
  uint64_t v8 = a1[15];
  uint64_t v9 = a1[19];
  uint64_t v10 = a1[21];
  swift_bridgeObjectRelease(a1[17]);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);
  return a1;
}

uint64_t sub_100013DB4(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v6 = sub_100013BD4(&qword_1000211E0);
    uint64_t result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }

  return result;
}

uint64_t sub_100013E14(unint64_t *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t result = *a1;
  if (!result)
  {
    uint64_t v7 = sub_100013BD4(&qword_1000211F0);
    a2();
    uint64_t result = swift_getWitnessTable(a3, v7);
    atomic_store(result, a1);
  }

  return result;
}

unint64_t sub_100013E7C()
{
  unint64_t result = qword_100021220;
  if (!qword_100021220)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000183F4, &type metadata for ModelEvaluationMetricSpecs);
    atomic_store(result, (unint64_t *)&qword_100021220);
  }

  return result;
}

unint64_t sub_100013EC0()
{
  unint64_t result = qword_100021228;
  if (!qword_100021228)
  {
    unint64_t result = swift_getWitnessTable(&unk_100018278, &type metadata for MusicAppSelectionPFLPluginArgsError);
    atomic_store(result, (unint64_t *)&qword_100021228);
  }

  return result;
}

unint64_t sub_100013F04()
{
  unint64_t result = qword_100021230;
  if (!qword_100021230)
  {
    unint64_t result = swift_getWitnessTable(&unk_100018838, &type metadata for MusicAppSelectionPFLPluginArgs);
    atomic_store(result, (unint64_t *)&qword_100021230);
  }

  return result;
}

uint64_t sub_100013F48(uint64_t result, unint64_t a2)
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

uint64_t getEnumTagSinglePayload for MusicAppSelectionPFLPluginArgs.CodingKeys( unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0xF2) {
    goto LABEL_17;
  }
  if (a2 + 14 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 14) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 14;
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
      return (*a1 | (v4 << 8)) - 14;
    }

    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 14;
    }
  }

uint64_t storeEnumTagSinglePayload for MusicAppSelectionPFLPluginArgs.CodingKeys( _BYTE *a1, unsigned int a2, unsigned int a3)
{
  if (a3 + 14 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 14) >> 8 < 0xFF) {
    LODWORD(v4) = 1;
  }
  else {
    LODWORD(v4) = v3;
  }
  if (a3 >= 0xF2) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 0LL;
  }
  if (a2 <= 0xF1) {
    return ((uint64_t (*)(void))((char *)&loc_100014068 + 4 * byte_1000187E3[v4]))();
  }
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_10001409C + 4 * byte_1000187DE[v4]))();
}

uint64_t sub_10001409C(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000140A4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000140ACLL);
  }
  return result;
}

uint64_t sub_1000140B8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000140C0LL);
  }
  *(_BYTE *)unint64_t result = a2 + 14;
  return result;
}

uint64_t sub_1000140C4(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000140CC(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MusicAppSelectionPFLPluginArgs.CodingKeys()
{
  return &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys;
}

unint64_t sub_1000140EC()
{
  unint64_t result = qword_100021238;
  if (!qword_100021238)
  {
    unint64_t result = swift_getWitnessTable(&unk_100018934, &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021238);
  }

  return result;
}

unint64_t sub_100014134()
{
  unint64_t result = qword_100021240;
  if (!qword_100021240)
  {
    unint64_t result = swift_getWitnessTable(&unk_10001886C, &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021240);
  }

  return result;
}

unint64_t sub_10001417C()
{
  unint64_t result = qword_100021248;
  if (!qword_100021248)
  {
    unint64_t result = swift_getWitnessTable(&unk_100018894, &type metadata for MusicAppSelectionPFLPluginArgs.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100021248);
  }

  return result;
}

uint64_t sub_1000141C0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_100005DB8(&qword_100021320);
  __chkstk_darwin(v5);
  BOOL v7 = (char *)v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v62 = type metadata accessor for URL(0LL);
  uint64_t v8 = *(void *)(v62 - 8);
  uint64_t v9 = __chkstk_darwin(v62);
  unsigned int v59 = (char *)v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v9);
  uint64_t v61 = (char *)v56 - v11;
  if (qword_100020B20 != -1) {
    swift_once(&qword_100020B20, sub_10000B850);
  }
  uint64_t v12 = type metadata accessor for Logger(0LL);
  uint64_t v60 = sub_100005D5C(v12, (uint64_t)qword_100022C60);
  unsigned int v13 = (os_log_s *)Logger.logObject.getter(v60);
  os_log_type_t v14 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Initialising MusicAppSelectionPFLPluginRunner.", v15, 2u);
    swift_slowDealloc(v15, -1LL, -1LL);
  }

  id v16 = a1;
  sub_100012B5C(v16, (uint64_t)v64);
  if (v2)
  {

LABEL_12:
    uint64_t v51 = type metadata accessor for MusicAppSelectionPFLPluginRunner();
    swift_deallocPartialClassInstance(v3, v51, 216LL, 7LL);
    return v3;
  }

  __int128 v74 = *(_OWORD *)((char *)&v65[1] + 8);
  __int128 v75 = *(_OWORD *)((char *)v65 + 8);
  __int128 v72 = *(_OWORD *)((char *)v64 + 8);
  __int128 v73 = *(_OWORD *)((char *)&v64[1] + 8);
  __int128 v17 = v64[1];
  *(_OWORD *)(v3 + 16) = v64[0];
  *(_OWORD *)(v3 + 32) = v17;
  __int128 v19 = v65[2];
  __int128 v18 = v66;
  *(_OWORD *)(v3 + 80) = v65[1];
  *(_OWORD *)(v3 + 96) = v19;
  __int128 v20 = v65[0];
  *(_OWORD *)(v3 + 48) = v64[2];
  *(_OWORD *)(v3 + 64) = v20;
  __int128 v21 = v70;
  *(_OWORD *)(v3 + 160) = v69;
  *(_OWORD *)(v3 + 176) = v21;
  __int128 v22 = v68;
  *(_OWORD *)(v3 + 128) = v67;
  *(_OWORD *)(v3 + 144) = v22;
  uint64_t v57 = v8;
  uint64_t v23 = (_OWORD *)(v3 + 16);
  uint64_t v24 = v67;
  v56[1] = *((void *)&v66 + 1);
  uint64_t v25 = *((void *)&v64[2] + 1);
  uint64_t v71 = *((void *)&v64[2] + 1);
  *(_OWORD *)(v3 + 112) = v18;
  uint64_t v26 = type metadata accessor for BiomeSQLClient();
  uint64_t v27 = swift_allocObject(v26, 32LL, 7LL);
  id v58 = v16;
  uint64_t v28 = v27;
  *(void *)(v27 + 16) = 0LL;
  *(void *)(v27 + 24) = [objc_allocWithZone(BMSQLDatabase) init];
  *(void *)(v3 + 192) = v28;
  uint64_t v29 = type metadata accessor for BiomeSQLRowAggregator();
  uint64_t v30 = swift_allocObject(v29, 96LL, 7LL);
  *(void *)(v30 + 16) = sub_10000A354(&_swiftEmptyArrayStorage);
  *(_OWORD *)(v30 + 24) = *(_OWORD *)((char *)v64 + 8);
  *(_OWORD *)(v30 + 40) = *(_OWORD *)((char *)&v64[1] + 8);
  *(_OWORD *)(v30 + 56) = *(_OWORD *)((char *)&v65[1] + 8);
  *(void *)(v30 + 72) = v25;
  *(_OWORD *)(v30 + 80) = *(_OWORD *)((char *)v65 + 8);
  *(void *)(v3 + 200) = v30;
  id v31 = v58;
  sub_1000172B4((uint64_t)&v72);
  sub_1000172B4((uint64_t)&v73);
  sub_1000172B4((uint64_t)&v74);
  sub_1000172DC(&v71);
  sub_1000172B4((uint64_t)&v75);
  swift_bridgeObjectRetain(v24);
  sub_100014740(v31, (uint64_t)v7);
  swift_bridgeObjectRelease(v24);
  uint64_t v32 = v57;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v7, 1LL, v62) == 1)
  {
    uint64_t v33 = sub_100017304((uint64_t)v7);
    uint64_t v34 = (os_log_s *)Logger.logObject.getter(v33);
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Model attachment not found", v36, 2u);
      swift_slowDealloc(v36, -1LL, -1LL);
    }

    unint64_t v37 = sub_10001715C();
    swift_allocError(&type metadata for MusicAppSelectionPFLPluginRunnerError, v37, 0LL, 0LL);
    *uint64_t v38 = 0;
    swift_willThrow();

    __int128 v46 = *(_OWORD *)(v3 + 160);
    v63[8] = *(_OWORD *)(v3 + 144);
    v63[9] = v46;
    v63[10] = *(_OWORD *)(v3 + 176);
    __int128 v47 = *(_OWORD *)(v3 + 96);
    v63[4] = *(_OWORD *)(v3 + 80);
    v63[5] = v47;
    __int128 v48 = *(_OWORD *)(v3 + 128);
    v63[6] = *(_OWORD *)(v3 + 112);
    v63[7] = v48;
    __int128 v49 = *(_OWORD *)(v3 + 32);
    v63[0] = *v23;
    v63[1] = v49;
    __int128 v50 = *(_OWORD *)(v3 + 64);
    v63[2] = *(_OWORD *)(v3 + 48);
    v63[3] = v50;
    sub_100013D08(v63);
    swift_release(*(void *)(v3 + 192));
    swift_release(*(void *)(v3 + 200));
    goto LABEL_12;
  }

  (*(void (**)(void))(v32 + 32))();
  id v39 = [objc_allocWithZone(MLModelConfiguration) init];
  id v40 = [v39 setComputeUnits:0];
  uint64_t v41 = v59;
  URL.deletingLastPathComponent()(v40);
  double v42 = *(float *)v23;
  uint64_t v43 = type metadata accessor for ModelTrainer();
  swift_allocObject(v43, 24LL, 7LL);
  id v44 = v39;
  uint64_t v45 = sub_10000BDB8(v41, v44, v42);
  *(void *)(v3 + 208) = v45;
  unint64_t v53 = (os_log_s *)Logger.logObject.getter(v45);
  os_log_type_t v54 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v53, v54))
  {
    uint64_t v55 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v55 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  v54,  "Finished initialising MusicAppSelectionPFLPluginRunner.",  v55,  2u);
    swift_slowDealloc(v55, -1LL, -1LL);
  }

  (*(void (**)(char *, uint64_t))(v32 + 8))(v61, v62);
  return v3;
}

uint64_t sub_100014740@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100005DB8(&qword_100021320);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v7 = [a1 attachments];
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v7 attachmentURLsForBasename:v8];

  uint64_t v10 = type metadata accessor for URL(0LL);
  uint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  unint64_t v12 = *(void *)(v11 + 16);
  if (v12 < 2) {
    goto LABEL_13;
  }
  if (qword_100020B20 != -1) {
    swift_once(&qword_100020B20, sub_10000B850);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  sub_100005D5C(v13, (uint64_t)qword_100022C60);
  uint64_t v14 = swift_bridgeObjectRetain_n(v11, 2LL);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v15, v16))
  {
    __int128 v17 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v18 = swift_slowAlloc(32LL, -1LL);
    uint64_t v31 = v18;
    *(_DWORD *)__int128 v17 = 136315138;
    uint64_t v19 = *(void *)(v11 + 16);
    uint64_t v20 = *(void *)(v10 - 8);
    uint64_t v29 = v18;
    if (v19)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v20 + 16))( v6,  v11 + ((*(unsigned __int8 *)(v20 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80)),  v10);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v6, 0LL, 1LL, v10);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v6, 1LL, v10) != 1)
      {
        uint64_t v21 = URL.absoluteString.getter();
        unint64_t v23 = v22;
        (*(void (**)(char *, uint64_t))(v20 + 8))(v6, v10);
LABEL_11:
        uint64_t v30 = sub_100007F0C(v21, v23, &v31);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v17 + 4, v17 + 12);
        swift_bridgeObjectRelease_n(v11, 2LL);
        swift_bridgeObjectRelease(v23);
        _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "Multiple 'model.mil' attachments found. Using the first: %s",  v17,  0xCu);
        uint64_t v24 = v29;
        swift_arrayDestroy(v29, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v24, -1LL, -1LL);
        swift_slowDealloc(v17, -1LL, -1LL);

        goto LABEL_12;
      }
    }

    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56))(v6, 1LL, 1LL, v10);
    }

    sub_100017304((uint64_t)v6);
    unint64_t v23 = 0xE700000000000000LL;
    uint64_t v21 = 0x6E776F6E6B6E75LL;
    goto LABEL_11;
  }

  swift_bridgeObjectRelease_n(v11, 2LL);
LABEL_12:
  unint64_t v12 = *(void *)(v11 + 16);
LABEL_13:
  uint64_t v25 = *(void *)(v10 - 8);
  if (v12)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 16))( a2,  v11 + ((*(unsigned __int8 *)(v25 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80)),  v10);
    uint64_t v26 = 0LL;
  }

  else
  {
    uint64_t v26 = 1LL;
  }

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 56))(a2, v26, 1LL, v10);
  return swift_bridgeObjectRelease(v11);
}

uint64_t sub_100014AAC()
{
  id v2 = v0;
  if (qword_100020B20 != -1) {
    swift_once(&qword_100020B20, sub_10000B850);
  }
  uint64_t v3 = type metadata accessor for Logger(0LL);
  uint64_t v4 = sub_100005D5C(v3, (uint64_t)qword_100022C60);
  uint64_t v5 = (os_log_s *)Logger.logObject.getter(v4);
  os_log_type_t v6 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Executing SQL query.", v7, 2u);
    swift_slowDealloc(v7, -1LL, -1LL);
  }

  uint64_t v8 = *((void *)v2 + 24);
  sub_1000052EC(*((void *)v2 + 18), *((void *)v2 + 19));
  if (v1) {
    return (uint64_t)v2;
  }
  uint64_t v11 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v12 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Aggregating SQL rows.", v13, 2u);
    swift_slowDealloc(v13, -1LL, -1LL);
  }

  for (uint64_t i = *(void **)(v8 + 16); i; uint64_t i = *(void **)(v8 + 16))
  {
    id v15 = sub_100005624();
    sub_100006120((uint64_t)v15);
    swift_bridgeObjectRelease(v15);
  }

  uint64_t v16 = *((void *)v2 + 25) + 16LL;
  uint64_t v17 = swift_beginAccess(v16, v94, 0LL, 0LL);
  uint64_t v18 = *(void *)(*(void *)v16 + 16LL);
  uint64_t v19 = (os_log_s *)Logger.logObject.getter(v17);
  if (!v18)
  {
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  v29,  "No Biome datapoints found, returning empty MLRTaskResult",  v30,  2u);
      swift_slowDealloc(v30, -1LL, -1LL);
    }

    unint64_t v31 = sub_10001715C();
    swift_allocError(&type metadata for MusicAppSelectionPFLPluginRunnerError, v31, 0LL, 0LL);
    _BYTE *v32 = 5;
    swift_willThrow();
    return (uint64_t)v2;
  }

  os_log_type_t v20 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v21 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "Producing MLBatchProvider for training.", v21, 2u);
    swift_slowDealloc(v21, -1LL, -1LL);
  }

  int64_t v22 = sub_100006E70();
  uint64_t v23 = swift_retain(v2);
  uint64_t v24 = (os_log_s *)Logger.logObject.getter(v23);
  os_log_type_t v25 = static os_log_type_t.info.getter();
  uint64_t v84 = v16;
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc(28LL, -1LL);
    uint64_t v86 = swift_slowAlloc(32LL, -1LL);
    uint64_t v91 = v86;
    *(_DWORD *)uint64_t v26 = 136315650;
    uint64_t v27 = *((void *)v2 + 15);
    unint64_t v28 = *((void *)v2 + 16);
    swift_bridgeObjectRetain(v28);
    uint64_t v93 = sub_100007F0C(v27, v28, &v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, v94, v26 + 4, v26 + 12);
    swift_bridgeObjectRelease(v28);
    *(_WORD *)(v26 + 12) = 2048;
    uint64_t v93 = v18;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, v94, v26 + 14, v26 + 22);
    *(_WORD *)(v26 + 22) = 1024;
    LODWORD(v93) = *((_DWORD *)v2 + 5);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v93, (char *)&v93 + 4, v26 + 24, v26 + 28);
    swift_release(v2);
    _os_log_impl( (void *)&_mh_execute_header,  v24,  v25,  "Training model %s with %ld datapoints for %u epochs.",  (uint8_t *)v26,  0x1Cu);
    swift_arrayDestroy(v86, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v86, -1LL, -1LL);
    swift_slowDealloc(v26, -1LL, -1LL);
  }

  else
  {

    swift_release(v2);
  }

  uint64_t v33 = *((void *)v2 + 26);
  int v34 = *((_DWORD *)v2 + 5);
  uint64_t v35 = *((void *)v2 + 17);
  uint64_t v36 = swift_bridgeObjectRetain(v35);
  uint64_t v37 = sub_10001020C(v36);
  swift_bridgeObjectRelease(v35);
  sub_10000C72C(v34, v22, v37);
  int64_t v38 = v22;
  unint64_t v40 = v39;
  double v42 = v41;
  id v44 = v43;
  unsigned int v87 = v45;
  swift_bridgeObjectRelease(v37);
  *(void *)type = v38;
  uint64_t v88 = sub_10000D804(v40, v42, v44, v87);

  uint64_t result = swift_bridgeObjectRelease(v40);
  int64_t v46 = 0LL;
  uint64_t v47 = *(void *)v84;
  uint64_t v48 = 1LL << *(_BYTE *)(*(void *)v84 + 32LL);
  uint64_t v49 = -1LL;
  if (v48 < 64) {
    uint64_t v49 = ~(-1LL << v48);
  }
  uint64_t v51 = *(void *)(v47 + 64);
  uint64_t v50 = v47 + 64;
  unint64_t v52 = v49 & v51;
  int64_t v53 = (unint64_t)(v48 + 63) >> 6;
  for (float j = 0.0;
        ;
        float j = j
          + (float)*(uint64_t *)(*(void *)(*(void *)(*(void *)(*(void *)v84 + 56LL) + 8 * v56) + 16LL) + 24LL))
  {
    if (v52)
    {
      unint64_t v55 = __clz(__rbit64(v52));
      v52 &= v52 - 1;
      unint64_t v56 = v55 | (v46 << 6);
      continue;
    }

    int64_t v57 = v46 + 1;
    if (__OFADD__(v46, 1LL))
    {
      __break(1u);
LABEL_60:
      __break(1u);
      return result;
    }

    if (v57 >= v53) {
      goto LABEL_45;
    }
    unint64_t v58 = *(void *)(v50 + 8 * v57);
    ++v46;
    if (!v58)
    {
      int64_t v46 = v57 + 1;
      if (v57 + 1 >= v53) {
        goto LABEL_45;
      }
      unint64_t v58 = *(void *)(v50 + 8 * v46);
      if (!v58)
      {
        int64_t v46 = v57 + 2;
        if (v57 + 2 >= v53) {
          goto LABEL_45;
        }
        unint64_t v58 = *(void *)(v50 + 8 * v46);
        if (!v58)
        {
          int64_t v46 = v57 + 3;
          if (v57 + 3 >= v53) {
            goto LABEL_45;
          }
          unint64_t v58 = *(void *)(v50 + 8 * v46);
          if (!v58)
          {
            int64_t v46 = v57 + 4;
            if (v57 + 4 >= v53) {
              goto LABEL_45;
            }
            unint64_t v58 = *(void *)(v50 + 8 * v46);
            if (!v58) {
              break;
            }
          }
        }
      }
    }

LABEL_44:
    unint64_t v52 = (v58 - 1) & v58;
    unint64_t v56 = __clz(__rbit64(v58)) + (v46 << 6);
  }

  int64_t v59 = v57 + 5;
  if (v59 < v53)
  {
    unint64_t v58 = *(void *)(v50 + 8 * v59);
    if (!v58)
    {
      while (1)
      {
        int64_t v46 = v59 + 1;
        if (__OFADD__(v59, 1LL)) {
          goto LABEL_60;
        }
        if (v46 >= v53) {
          goto LABEL_45;
        }
        unint64_t v58 = *(void *)(v50 + 8 * v46);
        ++v59;
        if (v58) {
          goto LABEL_44;
        }
      }
    }

    int64_t v46 = v59;
    goto LABEL_44;
  }

LABEL_45:
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v88);
  uint64_t v91 = v88;
  sub_100008E4C(0x43656C706D617845LL, 0xEC000000746E756FLL, isUniquelyReferenced_nonNull_native, j);
  uint64_t v61 = v91;
  uint64_t v93 = v91;
  swift_bridgeObjectRelease(0x8000000000000000LL);
  id v62 = [*(id *)(v33 + 16) copyCurrentTrainingDelta];
  id v63 = [v62 flattenedModelUpdate];

  if (v63)
  {
    uint64_t v64 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v63);
    unint64_t v66 = v65;
  }

  else
  {
    uint64_t v64 = 0LL;
    unint64_t v66 = 0xF000000000000000LL;
  }

  unint64_t v67 = *((void *)v2 + 23);
  if (v67)
  {
    uint64_t v89 = v64;
    uint64_t v68 = *((void *)v2 + 22);
    uint64_t v69 = swift_bridgeObjectRetain_n(v67, 2LL);
    __int128 v70 = (os_log_s *)Logger.logObject.getter(v69);
    os_log_type_t v71 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v70, v71))
    {
      __int128 v72 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v85 = v68;
      uint64_t v73 = swift_slowAlloc(32LL, -1LL);
      uint64_t v91 = v73;
      *(_DWORD *)__int128 v72 = 136315138;
      swift_bridgeObjectRetain(v67);
      uint64_t v90 = sub_100007F0C(v85, v67, &v91);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v90, &v91, v72 + 4, v72 + 12);
      swift_bridgeObjectRelease_n(v67, 3LL);
      _os_log_impl((void *)&_mh_execute_header, v70, v71, "Writing deltas and metrics to %s", v72, 0xCu);
      swift_arrayDestroy(v73, 1LL, (char *)&type metadata for Any + 8);
      uint64_t v74 = v73;
      uint64_t v68 = v85;
      swift_slowDealloc(v74, -1LL, -1LL);
      swift_slowDealloc(v72, -1LL, -1LL);
    }

    else
    {

      swift_bridgeObjectRelease_n(v67, 2LL);
    }

    swift_bridgeObjectRetain(v61);
    uint64_t v64 = v89;
    sub_100015904(v68, v67, v61, v89, v66);
    swift_bridgeObjectRelease(v61);
  }

  uint64_t v75 = swift_bridgeObjectRetain(v61);
  __int128 v76 = (os_log_s *)Logger.logObject.getter(v75);
  os_log_type_t v77 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v76, v77))
  {
    __int128 v78 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    *(_DWORD *)__int128 v78 = 134217984;
    uint64_t v91 = *(void *)(v61 + 16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v91, &v92, v78 + 4, v78 + 12);
    swift_bridgeObjectRelease(v61);
    _os_log_impl( (void *)&_mh_execute_header,  v76,  v77,  "Finishing plugin by returning %ld metrics and weight delta.",  v78,  0xCu);
    swift_slowDealloc(v78, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease(v61);
  }

  swift_beginAccess(&v93, &v91, 0LL, 0LL);
  uint64_t v79 = v93;
  unint64_t v80 = sub_100015500(v93);
  swift_bridgeObjectRelease(v79);
  v81.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v80);
  Class isa = 0LL;
  if (v66 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1000158F0(v64, v66);
  }

  id v2 = [objc_allocWithZone(MLRTaskResult) initWithJSONResult:v81.super.isa unprivatizedVector:isa];
  swift_unknownObjectRelease(*(void *)type);

  return (uint64_t)v2;
}

unint64_t sub_100015500(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    sub_100005DB8(&qword_100020C78);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v37 = v1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(v1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(v1 + 64);
  int64_t v36 = (unint64_t)(63 - v4) >> 6;
  id v7 = &v43;
  uint64_t v8 = &v45;
  unint64_t result = swift_bridgeObjectRetain(v1);
  int64_t i = 0LL;
  uint64_t v11 = (char *)&type metadata for Any + 8;
  os_log_type_t v12 = &type metadata for Float;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v21 = i + 1;
  if (__OFADD__(i, 1LL)) {
    goto LABEL_35;
  }
  if (v21 >= v36) {
    goto LABEL_32;
  }
  unint64_t v22 = *(void *)(v37 + 8 * v21);
  int64_t v23 = i + 1;
  if (!v22)
  {
    int64_t v23 = i + 2;
    if (i + 2 >= v36) {
      goto LABEL_32;
    }
    unint64_t v22 = *(void *)(v37 + 8 * v23);
    if (!v22)
    {
      int64_t v23 = i + 3;
      if (i + 3 >= v36) {
        goto LABEL_32;
      }
      unint64_t v22 = *(void *)(v37 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = i + 4;
        if (i + 4 >= v36) {
          goto LABEL_32;
        }
        unint64_t v22 = *(void *)(v37 + 8 * v23);
        if (!v22)
        {
          int64_t v24 = i + 5;
          if (i + 5 < v36)
          {
            unint64_t v22 = *(void *)(v37 + 8 * v24);
            if (v22)
            {
              int64_t v23 = i + 5;
              goto LABEL_26;
            }

            while (1)
            {
              int64_t v23 = v24 + 1;
              if (__OFADD__(v24, 1LL)) {
                goto LABEL_36;
              }
              if (v23 >= v36) {
                break;
              }
              unint64_t v22 = *(void *)(v37 + 8 * v23);
              ++v24;
              if (v22) {
                goto LABEL_26;
              }
            }
          }

uint64_t sub_100015858()
{
  __int128 v1 = *(_OWORD *)(v0 + 160);
  v7[8] = *(_OWORD *)(v0 + 144);
  void v7[9] = v1;
  v7[10] = *(_OWORD *)(v0 + 176);
  __int128 v2 = *(_OWORD *)(v0 + 96);
  v7[4] = *(_OWORD *)(v0 + 80);
  v7[5] = v2;
  __int128 v3 = *(_OWORD *)(v0 + 128);
  v7[6] = *(_OWORD *)(v0 + 112);
  v7[7] = v3;
  __int128 v4 = *(_OWORD *)(v0 + 32);
  v7[0] = *(_OWORD *)(v0 + 16);
  v7[1] = v4;
  __int128 v5 = *(_OWORD *)(v0 + 64);
  uint64_t v7[2] = *(_OWORD *)(v0 + 48);
  v7[3] = v5;
  sub_100013D08(v7);
  swift_release(*(void *)(v0 + 192));
  swift_release(*(void *)(v0 + 200));
  swift_release(*(void *)(v0 + 208));
  return swift_deallocClassInstance(v0, 216LL, 7LL);
}

uint64_t type metadata accessor for MusicAppSelectionPFLPluginRunner()
{
  return objc_opt_self(&OBJC_CLASS____TtC26MusicAppSelectionPFLPlugin32MusicAppSelectionPFLPluginRunner);
}

uint64_t sub_1000158F0(uint64_t result, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100013F48(result, a2);
  }
  return result;
}

uint64_t sub_100015904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v156 = a3;
  uint64_t v165 = a2;
  *(void *)&__int128 v164 = a1;
  uint64_t v153 = type metadata accessor for String.Encoding(0LL);
  uint64_t v152 = *(void *)(v153 - 8);
  uint64_t v7 = __chkstk_darwin(v153);
  v157 = (char *)&v145 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7);
  v155 = (char *)&v145 - v9;
  uint64_t v160 = type metadata accessor for JSONEncoder.OutputFormatting(0LL);
  uint64_t v158 = *(void *)(v160 - 8);
  __chkstk_darwin(v160);
  v159 = (char *)&v145 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v163 = (void (*)(uint64_t, uint64_t))type metadata accessor for URL.DirectoryHint(0LL);
  uint64_t v11 = *((void *)v163 - 1);
  __chkstk_darwin(v163);
  uint64_t v13 = (char *)&v145 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = sub_100005DB8(&qword_100021320);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v145 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for URL(0LL);
  uint64_t v18 = *(os_log_s **)(v17 - 8);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v20 = __chkstk_darwin(v19);
  unint64_t v22 = (char *)&v145 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v24 = __chkstk_darwin(v23);
  __chkstk_darwin(v24);
  uint64_t v26 = __chkstk_darwin((char *)&v145 - v25);
  uint64_t v28 = (char *)&v145 - v27;
  uint64_t v29 = __chkstk_darwin(v26);
  BOOL v34 = (char *)&v145 - v33;
  if (a5 >> 60 != 15)
  {
    uint64_t v148 = v29;
    v146 = v22;
    uint64_t v145 = v32;
    uint64_t v149 = v31;
    uint64_t v147 = v30;
    uint64_t v43 = objc_opt_self(&OBJC_CLASS___NSFileManager);
    uint64_t v44 = a4;
    uint64_t v45 = (void *)v43;
    uint64_t v161 = v44;
    unint64_t v166 = a5;
    sub_1000171A0(v44, a5);
    id v46 = [v45 defaultManager];
    v162 = v18;
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v18 + 7))(v16, 1LL, 1LL, v17);
    (*(void (**)(char *, void, void (*)(uint64_t, uint64_t)))(v11 + 104))( v13,  enum case for URL.DirectoryHint.inferFromPath(_:),  v163);
    uint64_t v47 = v165;
    swift_bridgeObjectRetain(v165);
    uint64_t v48 = URL.init(filePath:directoryHint:relativeTo:)(v164, v47, v13, v16);
    uint64_t Path = URL.deletingLastPathComponent()(v48);
    URL.path.getter(Path);
    uint64_t v51 = v50;
    NSString v52 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v51);
    LOBYTE(v51) = [v46 fileExistsAtPath:v52];

    uint64_t v167 = v17;
    v154 = v34;
    id v151 = v46;
    if ((v51 & 1) == 0)
    {
      if (qword_100020B20 != -1) {
        swift_once(&qword_100020B20, sub_10000B850);
      }
      uint64_t v54 = type metadata accessor for Logger(0LL);
      uint64_t v55 = sub_100005D5C(v54, (uint64_t)qword_100022C60);
      unint64_t v56 = v162;
      int64_t v57 = (uint64_t (*)(uint64_t, char *, uint64_t))*((void *)v162 + 2);
      uint64_t v58 = v148;
      uint64_t v59 = v57(v148, v28, v167);
      uint64_t v60 = (os_log_s *)Logger.logObject.getter(v59);
      os_log_type_t v61 = static os_log_type_t.debug.getter();
      BOOL v62 = os_log_type_enabled(v60, v61);
      uint64_t v165 = v55;
      *(void *)&__int128 v164 = v57;
      if (v62)
      {
        id v63 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v64 = (void *)swift_slowAlloc(32LL, -1LL);
        v150 = v28;
        unint64_t v65 = v64;
        id v169 = v64;
        *(_DWORD *)id v63 = 136315138;
        uint64_t v66 = URL.path.getter(v64);
        unint64_t v68 = v67;
        uint64_t v168 = sub_100007F0C(v66, v67, (uint64_t *)&v169);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, &v169, v63 + 4, v63 + 12);
        swift_bridgeObjectRelease(v68);
        v163 = (void (*)(uint64_t, uint64_t))*((void *)v56 + 1);
        v163(v58, v167);
        _os_log_impl((void *)&_mh_execute_header, v60, v61, "Creating directories at %s", v63, 0xCu);
        swift_arrayDestroy(v65, 1LL, (char *)&type metadata for Any + 8);
        uint64_t v69 = v65;
        uint64_t v28 = v150;
        id v46 = v151;
        swift_slowDealloc(v69, -1LL, -1LL);
        __int128 v70 = v63;
        BOOL v34 = v154;
        swift_slowDealloc(v70, -1LL, -1LL);
      }

      else
      {
        v163 = (void (*)(uint64_t, uint64_t))*((void *)v56 + 1);
        v163(v58, v167);
      }

      URL._bridgeToObjectiveC()(v71);
      uint64_t v73 = v72;
      id v169 = 0LL;
      unsigned int v74 = [v46 createDirectoryAtURL:v72 withIntermediateDirectories:1 attributes:0 error:&v169];

      id v75 = v169;
      if (!v74)
      {
        id v118 = v169;
        uint64_t v119 = _convertNSErrorToError(_:)(v75);

        swift_willThrow();
        v120 = v146;
        ((void (*)(char *, char *, uint64_t))v164)(v146, v28, v167);
        swift_errorRetain(v119);
        uint64_t v121 = swift_errorRetain(v119);
        v122 = (os_log_s *)Logger.logObject.getter(v121);
        os_log_type_t v123 = static os_log_type_t.error.getter();
        if (os_log_type_enabled(v122, v123))
        {
          uint64_t v124 = swift_slowAlloc(22LL, -1LL);
          *(void *)&__int128 v164 = swift_slowAlloc(8LL, -1LL);
          v125 = (void *)swift_slowAlloc(32LL, -1LL);
          uint64_t v165 = (uint64_t)v125;
          id v169 = v125;
          *(_DWORD *)uint64_t v124 = 136315394;
          v162 = v122;
          uint64_t v126 = URL.path.getter(v125);
          unint64_t v128 = v127;
          uint64_t v168 = sub_100007F0C(v126, v127, (uint64_t *)&v169);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, &v169, v124 + 4, v124 + 12);
          swift_bridgeObjectRelease(v128);
          v129 = v120;
          v130 = v163;
          v163((uint64_t)v129, v167);
          *(_WORD *)(v124 + 12) = 2112;
          swift_errorRetain(v119);
          uint64_t v131 = _swift_stdlib_bridgeErrorToNSError(v119);
          uint64_t v168 = v131;
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, &v169, v124 + 14, v124 + 22);
          uint64_t v132 = v164;
          *(void *)__int128 v164 = v131;
          swift_errorRelease(v119);
          swift_errorRelease(v119);
          v122 = v162;
          _os_log_impl( (void *)&_mh_execute_header,  v162,  v123,  "Couldn't create directory at %s: %@",  (uint8_t *)v124,  0x16u);
          uint64_t v133 = sub_100005DB8(&qword_100020C70);
          swift_arrayDestroy(v132, 1LL, v133);
          uint64_t v134 = v132;
          BOOL v34 = v154;
          swift_slowDealloc(v134, -1LL, -1LL);
          uint64_t v135 = v165;
          swift_arrayDestroy(v165, 1LL, (char *)&type metadata for Any + 8);
          swift_slowDealloc(v135, -1LL, -1LL);
          uint64_t v136 = v124;
          v137 = (void (*)(char *, uint64_t))v130;
          swift_slowDealloc(v136, -1LL, -1LL);
        }

        else
        {
          v137 = (void (*)(char *, uint64_t))v163;
          v163((uint64_t)v120, v167);
          swift_errorRelease(v119);
          swift_errorRelease(v119);
        }

        unint64_t v141 = v166;
        unint64_t v142 = sub_10001715C();
        swift_allocError(&type metadata for MusicAppSelectionPFLPluginRunnerError, v142, 0LL, 0LL);
        _BYTE *v143 = 2;
        swift_willThrow();

        sub_1000158F0(v161, v141);
        swift_errorRelease(v119);
        uint64_t v144 = v167;
        v137(v28, v167);
        return ((uint64_t (*)(char *, uint64_t))v137)(v34, v144);
      }

      id v53 = v169;
    }

    URL.path.getter(v53);
    uint64_t v77 = v76;
    NSString v78 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v77);
    LODWORD(v77) = [v46 fileExistsAtPath:v78];

    if ((_DWORD)v77)
    {
      URL.path.getter(v79);
      uint64_t v81 = v80;
      NSString v82 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v81);
      id v169 = 0LL;
      LODWORD(v81) = [v46 removeItemAtPath:v82 error:&v169];

      id v83 = v169;
      uint64_t v84 = v161;
      if (!(_DWORD)v81)
      {
        id v138 = v169;
        _convertNSErrorToError(_:)(v83);

        swift_willThrow();
        sub_1000158F0(v84, v166);
        v139 = (void (*)(char *, uint64_t))*((void *)v162 + 1);
        uint64_t v140 = v167;
        v139(v28, v167);
        return ((uint64_t (*)(char *, uint64_t))v139)(v34, v140);
      }

      uint64_t v85 = qword_100020B20;
      id v86 = v169;
      unint64_t v87 = v166;
      if (v85 != -1) {
        swift_once(&qword_100020B20, sub_10000B850);
      }
      uint64_t v88 = type metadata accessor for Logger(0LL);
      sub_100005D5C(v88, (uint64_t)qword_100022C60);
      uint64_t v89 = v162;
      uint64_t v90 = v145;
      uint64_t v91 = (*((uint64_t (**)(uint64_t, char *, uint64_t))v162 + 2))(v145, v34, v167);
      uint64_t v92 = (os_log_s *)Logger.logObject.getter(v91);
      os_log_type_t v93 = static os_log_type_t.debug.getter();
      BOOL v94 = os_log_type_enabled(v92, v93);
      v150 = v28;
      if (v94)
      {
        uint64_t v95 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v96 = (void *)swift_slowAlloc(32LL, -1LL);
        id v169 = v96;
        *(_DWORD *)uint64_t v95 = 136315138;
        uint64_t v97 = URL.path.getter(v96);
        unint64_t v99 = v98;
        uint64_t v168 = sub_100007F0C(v97, v98, (uint64_t *)&v169);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, &v169, v95 + 4, v95 + 12);
        swift_bridgeObjectRelease(v99);
        unint64_t v87 = v166;
        (*((void (**)(uint64_t, uint64_t))v89 + 1))(v90, v167);
        _os_log_impl((void *)&_mh_execute_header, v92, v93, "Attempted removing existing file %s", v95, 0xCu);
        swift_arrayDestroy(v96, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v96, -1LL, -1LL);
        swift_slowDealloc(v95, -1LL, -1LL);
      }

      else
      {
        (*((void (**)(uint64_t, uint64_t))v89 + 1))(v90, v167);
      }
    }

    else
    {
      object = URL.path(percentEncoded:)(1)._object;
      NSString v101 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(object);
      unsigned int v102 = [v46 createFileAtPath:v101 contents:0 attributes:0];

      if (qword_100020B20 != -1) {
        swift_once(&qword_100020B20, sub_10000B850);
      }
      uint64_t v103 = type metadata accessor for Logger(0LL);
      uint64_t v104 = sub_100005D5C(v103, (uint64_t)qword_100022C60);
      uint64_t v105 = (os_log_s *)Logger.logObject.getter(v104);
      os_log_type_t v106 = static os_log_type_t.debug.getter();
      BOOL v107 = os_log_type_enabled(v105, v106);
      unint64_t v87 = v166;
      v150 = v28;
      if (v107)
      {
        id v108 = (uint8_t *)swift_slowAlloc(8LL, -1LL);
        *(_DWORD *)id v108 = 67109120;
        LODWORD(v169) = v102;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v169, (char *)&v169 + 4, v108 + 4, v108 + 8);
        _os_log_impl( (void *)&_mh_execute_header,  v105,  v106,  "Attempted creating file with success: %{BOOL}d",  v108,  8u);
        swift_slowDealloc(v108, -1LL, -1LL);
      }
    }

    uint64_t v109 = v158;
    uint64_t v110 = type metadata accessor for JSONEncoder(0LL);
    swift_allocObject(v110, *(unsigned int *)(v110 + 48), *(unsigned __int16 *)(v110 + 52));
    uint64_t v111 = JSONEncoder.init()();
    uint64_t v112 = sub_100005DB8(&qword_100021328);
    v113 = (_OWORD *)swift_allocObject( v112,  ((*(unsigned __int8 *)(v109 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80))
                     + 2LL * *(void *)(v109 + 72),
                       *(unsigned __int8 *)(v109 + 80) | 7LL);
    __int128 v164 = xmmword_100017C60;
    v113[1] = xmmword_100017C60;
    uint64_t v114 = static JSONEncoder.OutputFormatting.prettyPrinted.getter();
    static JSONEncoder.OutputFormatting.sortedKeys.getter(v114);
    id v169 = v113;
    sub_100017230( &qword_100021330,  (uint64_t (*)(uint64_t))&type metadata accessor for JSONEncoder.OutputFormatting,  (uint64_t)&protocol conformance descriptor for JSONEncoder.OutputFormatting);
    uint64_t v115 = sub_100005DB8(&qword_100021338);
    unint64_t v116 = sub_1000171E4();
    v117 = v159;
    dispatch thunk of SetAlgebra.init<A>(_:)(&v169, v115, v116);
    v163 = (void (*)(uint64_t, uint64_t))v111;
    dispatch thunk of JSONEncoder.outputFormatting.setter(v117);
    __asm { BR              X10 }
  }

  if (qword_100020B20 != -1) {
    swift_once(&qword_100020B20, sub_10000B850);
  }
  uint64_t v35 = type metadata accessor for Logger(0LL);
  uint64_t v36 = sub_100005D5C(v35, (uint64_t)qword_100022C60);
  uint64_t v37 = (os_log_s *)Logger.logObject.getter(v36);
  os_log_type_t v38 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v37, v38))
  {
    uint64_t v39 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v39 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, v38, "Weight deltas is nil", v39, 2u);
    swift_slowDealloc(v39, -1LL, -1LL);
  }

  unint64_t v40 = sub_10001715C();
  swift_allocError(&type metadata for MusicAppSelectionPFLPluginRunnerError, v40, 0LL, 0LL);
  _BYTE *v41 = 1;
  return swift_willThrow();
}

unint64_t sub_10001715C()
{
  unint64_t result = qword_100021318;
  if (!qword_100021318)
  {
    unint64_t result = swift_getWitnessTable(&unk_1000182B8, &type metadata for MusicAppSelectionPFLPluginRunnerError);
    atomic_store(result, (unint64_t *)&qword_100021318);
  }

  return result;
}

uint64_t sub_1000171A0(uint64_t result, unint64_t a2)
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

unint64_t sub_1000171E4()
{
  unint64_t result = qword_100021340;
  if (!qword_100021340)
  {
    uint64_t v1 = sub_100013BD4(&qword_100021338);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100021340);
  }

  return result;
}

uint64_t sub_100017230(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_100017270()
{
  unint64_t result = qword_100021358;
  if (!qword_100021358)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100021358);
  }

  return result;
}

uint64_t sub_1000172B4(uint64_t a1)
{
  return a1;
}

void *sub_1000172DC(void *a1)
{
  return a1;
}

uint64_t sub_100017304(uint64_t a1)
{
  uint64_t v2 = sub_100005DB8(&qword_100021320);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}