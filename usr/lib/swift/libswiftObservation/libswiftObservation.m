uint64_t _ManagedCriticalState.LockedBuffer.__deallocating_deinit()
{
  MEMORY[0x1895D77F4]();
  return swift_deallocClassInstance();
}

void protocol witness for Identifiable.id.getter in conformance _ManagedCriticalState<A>(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t ObservationRegistrar.ValueObservationStorage.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t ObservationRegistrar.State.registerTracking(for:willSet:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = v3;
  uint64_t v8 = (*v3)++;
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v44 = v3[1];
  v3[1] = 0x8000000000000000LL;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2, a3, 0, a1, v8, isUniquelyReferenced_nonNull_native);
  v3[1] = v44;
  swift_bridgeObjectRelease();
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for AnyKeyPath();
    Set.Iterator.init(_cocoa:)();
    a1 = v44;
    uint64_t v42 = v45;
    uint64_t v10 = v46;
    uint64_t v11 = v47;
    unint64_t v12 = v48;
  }

  else
  {
    uint64_t v13 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v42 = a1 + 56;
    uint64_t v14 = ~v13;
    uint64_t v15 = -v13;
    if (v15 < 64) {
      uint64_t v16 = ~(-1LL << v15);
    }
    else {
      uint64_t v16 = -1LL;
    }
    unint64_t v12 = v16 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v10 = v14;
    uint64_t v11 = 0LL;
  }

  v17 = 0LL;
  int64_t v41 = (unint64_t)(v10 + 64) >> 6;
  while (1)
  {
    if (a1 < 0)
    {
      if (!__CocoaSet.Iterator.next()()) {
        goto LABEL_43;
      }
      type metadata accessor for AnyKeyPath();
      swift_dynamicCast();
      uint64_t v21 = v43;
      uint64_t v20 = v11;
      uint64_t v18 = v12;
      if (!v43) {
        goto LABEL_43;
      }
    }

    else
    {
      if (v12)
      {
        uint64_t v18 = (v12 - 1) & v12;
        unint64_t v19 = __clz(__rbit64(v12)) | (v11 << 6);
        uint64_t v20 = v11;
      }

      else
      {
        int64_t v22 = v11 + 1;
        if (__OFADD__(v11, 1LL)) {
          goto LABEL_46;
        }
        if (v22 >= v41) {
          goto LABEL_43;
        }
        unint64_t v23 = *(void *)(v42 + 8 * v22);
        uint64_t v20 = v11 + 1;
        if (!v23)
        {
          uint64_t v20 = v11 + 2;
          if (v11 + 2 >= v41) {
            goto LABEL_43;
          }
          unint64_t v23 = *(void *)(v42 + 8 * v20);
          if (!v23)
          {
            uint64_t v20 = v11 + 3;
            if (v11 + 3 >= v41) {
              goto LABEL_43;
            }
            unint64_t v23 = *(void *)(v42 + 8 * v20);
            if (!v23)
            {
              uint64_t v20 = v11 + 4;
              if (v11 + 4 >= v41) {
                goto LABEL_43;
              }
              unint64_t v23 = *(void *)(v42 + 8 * v20);
              if (!v23)
              {
                uint64_t v24 = v11 + 5;
                while (v41 != v24)
                {
                  unint64_t v23 = *(void *)(v42 + 8 * v24++);
                  if (v23)
                  {
                    uint64_t v20 = v24 - 1;
                    goto LABEL_29;
                  }
                }

LABEL_43:
                outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
                outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?((uint64_t)v17);
                return v8;
              }
            }
          }
        }

                outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
                outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?((uint64_t)v17);
                return v8;
              }
            }
          }
        }

LABEL_29:
        uint64_t v18 = (v23 - 1) & v23;
        unint64_t v19 = __clz(__rbit64(v23)) + (v20 << 6);
      }

      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8 * v19);
      swift_retain();
      if (!v21) {
        goto LABEL_43;
      }
    }

    outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?((uint64_t)v17);
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v43 = v4[2];
    uint64_t v26 = v43;
    v4[2] = 0x8000000000000000LL;
    unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v21);
    uint64_t v29 = *(void *)(v26 + 16);
    BOOL v30 = (v27 & 1) == 0;
    uint64_t v31 = v29 + v30;
    if (__OFADD__(v29, v30)) {
      break;
    }
    char v32 = v27;
    if (*(void *)(v26 + 24) >= v31)
    {
      if ((v25 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        uint64_t v26 = v43;
      }
    }

    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v31, v25);
      type metadata accessor for AnyKeyPath();
      uint64_t v26 = v43;
      unint64_t v33 = specialized __RawDictionaryStorage.find<A>(_:)(v21);
      if ((v32 & 1) != (v34 & 1)) {
        goto LABEL_47;
      }
      unint64_t v28 = v33;
    }

    v4[2] = v26;
    swift_bridgeObjectRelease();
    v35 = (void *)v4[2];
    if ((v32 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_release();
    }

    else
    {
      v35[(v28 >> 6) + 8] |= 1LL << v28;
      uint64_t v36 = 8 * v28;
      *(void *)(v35[6] + v36) = v21;
      *(void *)(v35[7] + v36) = MEMORY[0x18961AFF8];
      uint64_t v37 = v35[2];
      uint64_t v38 = v37 + 1;
      BOOL v39 = __OFADD__(v37, 1LL);
      swift_bridgeObjectRetain();
      if (v39) {
        goto LABEL_45;
      }
      v35[2] = v38;
    }

    swift_bridgeObjectRelease();
    specialized Set._Variant.insert(_:)(&v43, v8);
    v17 = specialized thunk for @callee_guaranteed () -> (@owned Set<Int>);
    uint64_t v11 = v20;
    unint64_t v12 = v18;
  }

  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

        uint64_t v18 = (v23 - 1) & v23;
        unint64_t v19 = __clz(__rbit64(v23)) + (v20 << 6);
      }

      uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8 * v19);
      swift_retain();
      if (!v21) {
        goto LABEL_43;
      }
    }

    outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?((uint64_t)v17);
    char v25 = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v43 = v4[2];
    uint64_t v26 = v43;
    v4[2] = 0x8000000000000000LL;
    unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v21);
    uint64_t v29 = *(void *)(v26 + 16);
    BOOL v30 = (v27 & 1) == 0;
    uint64_t v31 = v29 + v30;
    if (__OFADD__(v29, v30)) {
      break;
    }
    char v32 = v27;
    if (*(void *)(v26 + 24) >= v31)
    {
      if ((v25 & 1) == 0)
      {
        specialized _NativeDictionary.copy()();
        uint64_t v26 = v43;
      }
    }

    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v31, v25);
      type metadata accessor for AnyKeyPath();
      uint64_t v26 = v43;
      unint64_t v33 = specialized __RawDictionaryStorage.find<A>(_:)(v21);
      if ((v32 & 1) != (v34 & 1)) {
        goto LABEL_47;
      }
      unint64_t v28 = v33;
    }

    v4[2] = v26;
    swift_bridgeObjectRelease();
    v35 = (void *)v4[2];
    if ((v32 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_release();
    }

    else
    {
      v35[(v28 >> 6) + 8] |= 1LL << v28;
      uint64_t v36 = 8 * v28;
      *(void *)(v35[6] + v36) = v21;
      *(void *)(v35[7] + v36) = MEMORY[0x18961AFF8];
      uint64_t v37 = v35[2];
      uint64_t v38 = v37 + 1;
      BOOL v39 = __OFADD__(v37, 1LL);
      swift_bridgeObjectRetain();
      if (v39) {
        goto LABEL_45;
      }
      v35[2] = v38;
    }

    swift_bridgeObjectRelease();
    specialized Set._Variant.insert(_:)(&v43, v8);
    v17 = specialized thunk for @callee_guaranteed () -> (@owned Set<Int>);
    uint64_t v11 = v20;
    unint64_t v12 = v18;
  }

  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

void specialized thunk for @callee_guaranteed () -> (@owned Set<Int>)(void *a1@<X8>)
{
  *a1 = MEMORY[0x18961AFF8];
}

uint64_t ObservationRegistrar.State.registerTracking(for:didSet:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4 = v3;
  uint64_t v8 = (*v3)++;
  swift_bridgeObjectRetain();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v44 = v3[1];
  v3[1] = 0x8000000000000000LL;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a2, a3, 1, a1, v8, isUniquelyReferenced_nonNull_native);
  v3[1] = v44;
  swift_bridgeObjectRelease();
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for AnyKeyPath();
    Set.Iterator.init(_cocoa:)();
    a1 = v44;
    uint64_t v42 = v45;
    uint64_t v10 = v46;
    uint64_t v11 = v47;
    unint64_t v12 = v48;
  }

  else
  {
    uint64_t v13 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v42 = a1 + 56;
    uint64_t v14 = ~v13;
    uint64_t v15 = -v13;
    if (v15 < 64) {
      uint64_t v16 = ~(-1LL << v15);
    }
    else {
      uint64_t v16 = -1LL;
    }
    unint64_t v12 = v16 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v10 = v14;
    uint64_t v11 = 0LL;
  }

  v17 = 0LL;
  int64_t v41 = (unint64_t)(v10 + 64) >> 6;
  while (1)
  {
    if (a1 < 0)
    {
      if (!__CocoaSet.Iterator.next()()) {
        goto LABEL_43;
      }
      type metadata accessor for AnyKeyPath();
      swift_dynamicCast();
      uint64_t v21 = v43;
      uint64_t v20 = v11;
      uint64_t v18 = v12;
      if (!v43) {
        goto LABEL_43;
      }
    }

    else
    {
      if (v12)
      {
        uint64_t v18 = (v12 - 1) & v12;
        unint64_t v19 = __clz(__rbit64(v12)) | (v11 << 6);
        uint64_t v20 = v11;
      }

      else
      {
        int64_t v22 = v11 + 1;
        if (__OFADD__(v11, 1LL)) {
          goto LABEL_46;
        }
        if (v22 >= v41) {
          goto LABEL_43;
        }
        unint64_t v23 = *(void *)(v42 + 8 * v22);
        uint64_t v20 = v11 + 1;
        if (!v23)
        {
          uint64_t v20 = v11 + 2;
          if (v11 + 2 >= v41) {
            goto LABEL_43;
          }
          unint64_t v23 = *(void *)(v42 + 8 * v20);
          if (!v23)
          {
            uint64_t v20 = v11 + 3;
            if (v11 + 3 >= v41) {
              goto LABEL_43;
            }
            unint64_t v23 = *(void *)(v42 + 8 * v20);
            if (!v23)
            {
              uint64_t v20 = v11 + 4;
              if (v11 + 4 >= v41) {
                goto LABEL_43;
              }
              unint64_t v23 = *(void *)(v42 + 8 * v20);
              if (!v23)
              {
                uint64_t v24 = v11 + 5;
                while (v41 != v24)
                {
                  unint64_t v23 = *(void *)(v42 + 8 * v24++);
                  if (v23)
                  {
                    uint64_t v20 = v24 - 1;
                    goto LABEL_29;
                  }
                }

unint64_t ObservationRegistrar.State.cancel(_:)(uint64_t a1)
{
  v2 = v1;
  unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  if ((v4 & 1) == 0) {
    return result;
  }
  uint64_t v5 = result;
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = v1[1];
  uint64_t v35 = v7;
  v1[1] = 0x8000000000000000LL;
  if (!isUniquelyReferenced_nonNull_native)
  {
LABEL_54:
    specialized _NativeDictionary.copy()();
    uint64_t v7 = v35;
  }

  uint64_t v8 = *(void *)(v7 + 56) + 32 * v5;
  uint64_t v9 = *(void *)v8;
  uint64_t v10 = *(void *)(v8 + 8);
  unsigned __int8 v11 = *(_BYTE *)(v8 + 16);
  uint64_t v12 = *(void *)(v8 + 24);
  specialized _NativeDictionary._delete(at:)(v5, v7);
  v2[1] = v7;
  swift_bridgeObjectRelease();
  if ((v12 & 0xC000000000000001LL) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = __CocoaSet.makeIterator()();
    type metadata accessor for AnyKeyPath();
    Set.Iterator.init(_cocoa:)();
    outlined consume of ObservationRegistrar.State.ObservationKind(v9, v10, v11);
    swift_bridgeObjectRelease();
    uint64_t v12 = v35;
    uint64_t v33 = v36;
    uint64_t v13 = v37;
    uint64_t v14 = v38;
    unint64_t v15 = v39;
  }

  else
  {
    outlined consume of ObservationRegistrar.State.ObservationKind(v9, v10, v11);
    uint64_t v14 = 0LL;
    uint64_t v16 = -1LL << *(_BYTE *)(v12 + 32);
    uint64_t v33 = v12 + 56;
    uint64_t v13 = ~v16;
    uint64_t v17 = -v16;
    if (v17 < 64) {
      uint64_t v18 = ~(-1LL << v17);
    }
    else {
      uint64_t v18 = -1LL;
    }
    unint64_t v15 = v18 & *(void *)(v12 + 56);
  }

  int64_t v32 = (unint64_t)(v13 + 64) >> 6;
  v2 += 2;
  uint64_t v30 = v12;
  while (1)
  {
    if (v12 < 0)
    {
      if (!__CocoaSet.Iterator.next()()) {
        return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
      }
      type metadata accessor for AnyKeyPath();
      swift_dynamicCast();
      uint64_t v22 = v34;
      uint64_t v21 = v14;
      uint64_t v19 = v15;
      if (!v34) {
        return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
      }
      goto LABEL_32;
    }

    if (v15)
    {
      uint64_t v19 = (v15 - 1) & v15;
      unint64_t v20 = __clz(__rbit64(v15)) | (v14 << 6);
      uint64_t v21 = v14;
      goto LABEL_31;
    }

    int64_t v23 = v14 + 1;
    if (__OFADD__(v14, 1LL)) {
      goto LABEL_53;
    }
    if (v23 >= v32) {
      return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
    }
    unint64_t v24 = *(void *)(v33 + 8 * v23);
    uint64_t v21 = v14 + 1;
    if (!v24)
    {
      uint64_t v21 = v14 + 2;
      if (v14 + 2 >= v32) {
        return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
      }
      unint64_t v24 = *(void *)(v33 + 8 * v21);
      if (!v24)
      {
        uint64_t v21 = v14 + 3;
        if (v14 + 3 >= v32) {
          return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
        }
        unint64_t v24 = *(void *)(v33 + 8 * v21);
        if (!v24)
        {
          uint64_t v21 = v14 + 4;
          if (v14 + 4 >= v32) {
            return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
          }
          unint64_t v24 = *(void *)(v33 + 8 * v21);
          if (!v24) {
            break;
          }
        }
      }
    }

LABEL_30:
    uint64_t v19 = (v24 - 1) & v24;
    unint64_t v20 = __clz(__rbit64(v24)) + (v21 << 6);
LABEL_31:
    uint64_t v22 = *(void *)(*(void *)(v12 + 48) + 8 * v20);
    swift_retain();
    if (!v22) {
      return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
    }
LABEL_32:
    uint64_t v26 = *v2;
    if (*(void *)(*v2 + 16))
    {
      uint64_t v5 = specialized __RawDictionaryStorage.find<A>(_:)(v22);
      char v28 = v27;
      swift_release();
      uint64_t v14 = v21;
      unint64_t v15 = v19;
      if ((v28 & 1) != 0)
      {
        int v29 = *(_DWORD *)(v26 + 36);
        uint64_t *v2 = 0x8000000000000000LL;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          uint64_t v34 = v26;
          specialized _NativeDictionary.copy()();
          uint64_t v26 = v34;
          swift_bridgeObjectRelease();
        }

        if (v5 < 0 || v5 >= 1LL << *(_BYTE *)(v26 + 32))
        {
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          __break(1u);
          goto LABEL_54;
        }

        if (v29 != *(_DWORD *)(v26 + 36)) {
          goto LABEL_49;
        }
        specialized Set._Variant.remove(_:)(a1);
        uint64_t *v2 = v26;
        if (v5 >= 1LL << *(_BYTE *)(v26 + 32)) {
          goto LABEL_50;
        }
        if (v29 != *(_DWORD *)(v26 + 36)) {
          goto LABEL_52;
        }
        uint64_t v14 = v21;
        unint64_t v15 = v19;
        uint64_t v12 = v30;
        if (!*(void *)(*(void *)(*(void *)(v26 + 56) + 8 * v5) + 16LL))
        {
          specialized Dictionary._Variant.remove(at:)(&v34, v5, v29, 0);
          swift_release();
          swift_bridgeObjectRelease();
          uint64_t v14 = v21;
          unint64_t v15 = v19;
        }
      }
    }

    else
    {
      swift_release();
      uint64_t v14 = v21;
      unint64_t v15 = v19;
    }
  }

  uint64_t v25 = v14 + 5;
  while (v32 != v25)
  {
    unint64_t v24 = *(void *)(v33 + 8 * v25++);
    if (v24)
    {
      uint64_t v21 = v25 - 1;
      goto LABEL_30;
    }
  }

  return outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
}

    unsigned __int8 v11 = (v21 - 1) & v21;
    uint64_t v19 = __clz(__rbit64(v21)) + (v8 << 6);
LABEL_31:
    char v27 = *(void *)(*(void *)(v5 + 48) + 8 * v19);
    char v28 = *(void *)(v5 + 56) + 32 * v19;
    int v29 = *(void *)v28;
    uint64_t v30 = *(void *)(v28 + 8);
    uint64_t v31 = *(_BYTE *)(v28 + 16);
    int64_t v32 = *(void *)(v28 + 24);
    if ((v44 & 1) == 0)
    {
      outlined copy of ObservationRegistrar.State.ObservationKind(v29, v30, v31);
      swift_bridgeObjectRetain();
    }

    unint64_t result = static Hasher._hash(seed:_:)();
    uint64_t v13 = -1LL << *(_BYTE *)(v7 + 32);
    uint64_t v14 = result & ~v13;
    unint64_t v15 = v14 >> 6;
    if (((-1LL << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
    {
      uint64_t v16 = __clz(__rbit64((-1LL << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      int64_t v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v13) >> 6;
      do
      {
        if (++v15 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_47;
        }

        uint64_t v25 = v15 == v24;
        if (v15 == v24) {
          unint64_t v15 = 0LL;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v12 + 8 * v15);
      }

      while (v26 == -1);
      uint64_t v16 = __clz(__rbit64(~v26)) + (v15 << 6);
    }

    *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v16;
    *(void *)(*(void *)(v7 + 48) + 8 * v16) = v27;
    uint64_t v17 = *(void *)(v7 + 56) + 32 * v16;
    *(void *)uint64_t v17 = v29;
    *(void *)(v17 + 8) = v30;
    *(_BYTE *)(v17 + 16) = v31;
    *(void *)(v17 + 24) = v32;
    ++*(void *)(v7 + 16);
  }

  uint64_t v22 = v20 + 2;
  if (v22 >= v42)
  {
LABEL_33:
    if ((v44 & 1) == 0)
    {
      unint64_t result = swift_release();
      v3 = v41;
      goto LABEL_46;
    }

    uint64_t v33 = *(_BYTE *)(v5 + 32);
    uint64_t v34 = 1LL << v33;
    if (1LL << v33 >= 64)
    {
      uint64_t v35 = (unint64_t)(v34 + 63) >> 6;
      if ((v33 & 0x3Fu) >= 8)
      {
        uint64_t v36 = v35 & 0x3FFFFFFFFFFFFFCLL;
        uint64_t v37 = (_OWORD *)(v5 + 80);
        uint64_t v38 = v35 & 0x3FFFFFFFFFFFFFCLL;
        v3 = v41;
        do
        {
          *(v37 - 1) = 0uLL;
          *uint64_t v37 = 0uLL;
          v37 += 2;
          v38 -= 4LL;
        }

        while (v38);
        if (v35 == v36) {
          goto LABEL_44;
        }
      }

      else
      {
        uint64_t v36 = 0LL;
        v3 = v41;
      }

      unint64_t v39 = v35 - v36;
      v40 = (void *)(v5 + 8 * v36 + 64);
      do
      {
        *v40++ = 0LL;
        --v39;
      }

      while (v39);
    }

    else
    {
      *uint64_t v43 = -1LL << v34;
      v3 = v41;
    }

    uint64_t v12 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v8 << 6);
LABEL_31:
    char v28 = *(void *)(*(void *)(v5 + 48) + 8 * v20);
    uint64_t v38 = *(_OWORD *)(*(void *)(v5 + 56) + 16 * v20);
    if ((a2 & 1) == 0)
    {
      swift_retain();
      swift_bridgeObjectRetain();
    }

    unint64_t result = static Hasher._hash(seed:_:)();
    unint64_t v15 = -1LL << *(_BYTE *)(v7 + 32);
    uint64_t v16 = result & ~v15;
    uint64_t v17 = v16 >> 6;
    if (((-1LL << v16) & ~*(void *)(v14 + 8 * (v16 >> 6))) != 0)
    {
      uint64_t v18 = __clz(__rbit64((-1LL << v16) & ~*(void *)(v14 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      unint64_t v24 = 0;
      uint64_t v25 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_47;
        }

        uint64_t v26 = v17 == v25;
        if (v17 == v25) {
          uint64_t v17 = 0LL;
        }
        v24 |= v26;
        char v27 = *(void *)(v14 + 8 * v17);
      }

      while (v27 == -1);
      uint64_t v18 = __clz(__rbit64(~v27)) + (v17 << 6);
    }

    *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v18;
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v28;
    *(_OWORD *)(*(void *)(v7 + 56) + 16 * v18) = v38;
    ++*(void *)(v7 + 16);
  }

  int64_t v23 = v21 + 2;
  if (v23 >= v13)
  {
LABEL_33:
    if ((a2 & 1) == 0)
    {
      unint64_t result = swift_release();
      v3 = v37;
      goto LABEL_46;
    }

    int v29 = *(_BYTE *)(v5 + 32);
    uint64_t v30 = 1LL << v29;
    if (1LL << v29 >= 64)
    {
      uint64_t v31 = (unint64_t)(v30 + 63) >> 6;
      if ((v29 & 0x3Fu) >= 8)
      {
        int64_t v32 = v31 & 0x3FFFFFFFFFFFFFCLL;
        uint64_t v33 = (_OWORD *)(v5 + 80);
        uint64_t v34 = v31 & 0x3FFFFFFFFFFFFFCLL;
        v3 = v37;
        do
        {
          *(v33 - 1) = 0uLL;
          *uint64_t v33 = 0uLL;
          v33 += 2;
          v34 -= 4LL;
        }

        while (v34);
        if (v31 == v32) {
          goto LABEL_44;
        }
      }

      else
      {
        int64_t v32 = 0LL;
        v3 = v37;
      }

      uint64_t v35 = v31 - v32;
      uint64_t v36 = (void *)(v5 + 8 * v32 + 64);
      do
      {
        *v36++ = 0LL;
        --v35;
      }

      while (v35);
    }

    else
    {
      *uint64_t v9 = -1LL << v30;
      v3 = v37;
    }

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

void ObservationRegistrar.Context.didSet<A, B>(_:keyPath:)(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v85 = 0LL;
  uint64_t v6 = *a2;
  uint64_t v7 = *(void *)(*MEMORY[0x18961A9A8] + *a2 + 8LL);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1895F8858]();
  v82 = (char *)&v79 - v9;
  os_unfair_lock_t v84 = v10 + 10;
  _swift_observation_lock_lock(v10 + 10);
  uint64_t v11 = *(void *)(*(void *)(a3 + 32) + 16LL);
  v88 = a2;
  if (v11 && (uint64_t v12 = *(void *)(a3 + 24), specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)a2), (v13 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v14 = swift_bridgeObjectRetain();
    uint64_t v15 = v85;
    unint64_t v16 = specialized _NativeSet.filter(_:)(v14, v12);
    uint64_t v85 = v15;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }

  else
  {
    unint64_t v16 = MEMORY[0x18961AFF8];
  }

  unint64_t v91 = v16;
  uint64_t v17 = *(void *)(a3 + 32);
  uint64_t v18 = *(void *)(v17 + 16);
  uint64_t v80 = v8;
  uint64_t v81 = v7;
  if (!v18 || (unint64_t v19 = specialized __RawDictionaryStorage.find<A>(_:)((uint64_t)v88), (v20 & 1) == 0))
  {
    char v28 = (void *)MEMORY[0x18961AFE8];
    int v29 = (void *)MEMORY[0x18961AFE8];
    v56 = v84;
    if (v85) {
      goto LABEL_80;
    }
    goto LABEL_44;
  }

  uint64_t v89 = v6;
  uint64_t v90 = a1;
  uint64_t v83 = a3 + 16;
  uint64_t v21 = *(void *)(*(void *)(v17 + 56) + 8 * v19);
  uint64_t v22 = v21 + 56;
  uint64_t v23 = 1LL << *(_BYTE *)(v21 + 32);
  uint64_t v24 = -1LL;
  if (v23 < 64) {
    uint64_t v24 = ~(-1LL << v23);
  }
  unint64_t v25 = v24 & *(void *)(v21 + 56);
  int64_t v26 = (unint64_t)(v23 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v27 = 0LL;
  char v28 = (void *)MEMORY[0x18961AFE8];
  int v29 = (void *)MEMORY[0x18961AFE8];
  int64_t v86 = v26;
  uint64_t v87 = v21 + 56;
  while (v25)
  {
    unint64_t v30 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    unint64_t v31 = v30 | (v27 << 6);
LABEL_23:
    uint64_t v35 = *(void *)(*(void *)(v21 + 48) + 8 * v31);
    uint64_t v36 = *(void *)(a3 + 24);
    if (*(void *)(v36 + 16))
    {
      unint64_t v37 = specialized __RawDictionaryStorage.find<A>(_:)(v35);
      if ((v38 & 1) != 0)
      {
        uint64_t v39 = *(void *)(v36 + 56) + 32 * v37;
        if (*(_BYTE *)(v39 + 16) == 2)
        {
          uint64_t v40 = *(void *)v39;
          uint64_t v41 = *(void *)(v39 + 8);
          uint64_t v42 = swift_allocObject();
          *(void *)(v42 + 16) = v40;
          *(void *)(v42 + 24) = v41;
          outlined copy of ObservationRegistrar.State.ObservationKind(v40, v41, 2u);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  v29[2] + 1LL,  1,  v29,  (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
          }
          unint64_t v44 = v29[2];
          unint64_t v43 = v29[3];
          if (v44 >= v43 >> 1) {
            int v29 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (void *)(v43 > 1),  v44 + 1,  1,  v29,  (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
          }
          v29[2] = v44 + 1;
          uint64_t v45 = &v29[2 * v44];
          v45[4] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any) -> ();
          v45[5] = v42;
          ObservationRegistrar.State.cancel(_:)(v35);
          int64_t v26 = v86;
          uint64_t v22 = v87;
        }
      }
    }

    uint64_t v46 = *(void *)(a3 + 24);
    if (*(void *)(v46 + 16))
    {
      unint64_t v47 = specialized __RawDictionaryStorage.find<A>(_:)(v35);
      if ((v48 & 1) != 0)
      {
        uint64_t v49 = *(void *)(v46 + 56) + 32 * v47;
        if (*(_BYTE *)(v49 + 16) == 1)
        {
          uint64_t v51 = *(void *)v49;
          uint64_t v50 = *(void *)(v49 + 8);
          uint64_t v52 = swift_allocObject();
          *(void *)(v52 + 16) = v51;
          *(void *)(v52 + 24) = v50;
          outlined copy of ObservationRegistrar.State.ObservationKind(v51, v50, 1u);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  v28[2] + 1LL,  1,  v28,  (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
          }
          unint64_t v54 = v28[2];
          unint64_t v53 = v28[3];
          int64_t v26 = v86;
          if (v54 >= v53 >> 1) {
            char v28 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (void *)(v53 > 1),  v54 + 1,  1,  v28,  (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
          }
          v28[2] = v54 + 1;
          v55 = &v28[2 * v54];
          v55[4] = partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed AnyKeyPath) -> ();
          v55[5] = v52;
          uint64_t v22 = v87;
        }
      }
    }
  }

  BOOL v32 = __OFADD__(v27++, 1LL);
  if (v32) {
    goto LABEL_84;
  }
  if (v27 >= v26)
  {
    uint64_t v6 = v89;
    a1 = v90;
    goto LABEL_79;
  }

  unint64_t v33 = *(void *)(v22 + 8 * v27);
  uint64_t v6 = v89;
  a1 = v90;
  if (v33)
  {
LABEL_22:
    unint64_t v25 = (v33 - 1) & v33;
    unint64_t v31 = __clz(__rbit64(v33)) + (v27 << 6);
    goto LABEL_23;
  }

  int64_t v34 = v27 + 1;
  if (v27 + 1 >= v26) {
    goto LABEL_79;
  }
  unint64_t v33 = *(void *)(v22 + 8 * v34);
  if (v33) {
    goto LABEL_21;
  }
  int64_t v34 = v27 + 2;
  if (v27 + 2 >= v26) {
    goto LABEL_79;
  }
  unint64_t v33 = *(void *)(v22 + 8 * v34);
  if (v33) {
    goto LABEL_21;
  }
  int64_t v34 = v27 + 3;
  if (v27 + 3 >= v26) {
    goto LABEL_79;
  }
  unint64_t v33 = *(void *)(v22 + 8 * v34);
  if (v33)
  {
LABEL_21:
    int64_t v27 = v34;
    goto LABEL_22;
  }

  while (1)
  {
    int64_t v27 = v34 + 1;
    if (__OFADD__(v34, 1LL)) {
      goto LABEL_86;
    }
    if (v27 >= v26) {
      break;
    }
    unint64_t v33 = *(void *)(v22 + 8 * v27);
    ++v34;
    if (v33) {
      goto LABEL_22;
    }
  }

LABEL_79:
  v56 = v84;
  swift_release();
  if (v85)
  {
LABEL_80:
    MEMORY[0x1895D795C](v85);
    _swift_observation_lock_unlock(v56);
    __break(1u);
    goto LABEL_81;
  }

LABEL_44:
  _swift_observation_lock_unlock(v56);
  if (!*(void *)(v91 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_69:
    unint64_t v68 = v28[2];
    uint64_t v69 = (uint64_t)v88;
    if (v68)
    {
      unint64_t v70 = 0LL;
      v71 = v28 + 5;
      while (v70 < v68)
      {
        ++v70;
        v72 = (void (*)(uint64_t *))*(v71 - 1);
        v92[0] = v69;
        swift_retain();
        v72(v92);
        swift_release();
        unint64_t v68 = v28[2];
        v71 += 2;
        if (v70 == v68) {
          goto LABEL_73;
        }
      }

    *(void *)(v5 + 16) = 0LL;
    goto LABEL_45;
  }

  uint64_t v21 = v43[v22];
  if (v21)
  {
    uint64_t v8 = v22;
    goto LABEL_30;
  }

  while (1)
  {
    uint64_t v8 = v22 + 1;
    if (__OFADD__(v22, 1LL)) {
      break;
    }
    if (v8 >= v42) {
      goto LABEL_33;
    }
    uint64_t v21 = v43[v8];
    ++v22;
    if (v21) {
      goto LABEL_30;
    }
  }

    *(void *)(v5 + 16) = 0LL;
    goto LABEL_45;
  }

  uint64_t v22 = v9[v23];
  if (v22)
  {
    uint64_t v8 = v23;
    goto LABEL_30;
  }

  while (1)
  {
    uint64_t v8 = v23 + 1;
    if (__OFADD__(v23, 1LL)) {
      break;
    }
    if (v8 >= v13) {
      goto LABEL_33;
    }
    uint64_t v22 = v9[v8];
    ++v23;
    if (v22) {
      goto LABEL_30;
    }
  }

LABEL_81:
      __break(1u);
    }

    else
    {
LABEL_73:
      swift_bridgeObjectRelease();
      uint64_t v73 = v29[2];
      if (!v73)
      {
LABEL_77:
        swift_bridgeObjectRelease();
        return;
      }

      unint64_t v74 = 0LL;
      v75 = v29 + 5;
      while (v74 < v29[2])
      {
        ++v74;
        v76 = (void (*)(uint64_t *))*(v75 - 1);
        uint64_t v93 = *(void *)(v6 + *MEMORY[0x18961A9A8]);
        uint64_t v77 = v93;
        boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v92);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v77 - 8) + 16LL))( boxed_opaque_existential_0,  a1,  v77);
        swift_retain();
        v76(v92);
        swift_release();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v92);
        v75 += 2;
        if (v73 == v74) {
          goto LABEL_77;
        }
      }
    }

    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }

  swift_getAtKeyPath();
  _swift_observation_lock_lock(v56);
  unint64_t v57 = v91;
  int64_t v58 = 0LL;
  unint64_t v59 = v91 + 56;
  uint64_t v60 = 1LL << *(_BYTE *)(v91 + 32);
  uint64_t v61 = -1LL;
  if (v60 < 64) {
    uint64_t v61 = ~(-1LL << v60);
  }
  unint64_t v62 = v61 & *(void *)(v91 + 56);
  int64_t v63 = (unint64_t)(v60 + 63) >> 6;
  while (2)
  {
    if (v62)
    {
      unint64_t v64 = __clz(__rbit64(v62));
      v62 &= v62 - 1;
      unint64_t v65 = v64 | (v58 << 6);
      goto LABEL_61;
    }

    BOOL v32 = __OFADD__(v58++, 1LL);
    if (v32) {
      goto LABEL_83;
    }
    if (v58 >= v63)
    {
LABEL_67:
      swift_bridgeObjectRelease();
      _swift_observation_lock_unlock(v84);
      (*(void (**)(char *, uint64_t))(v80 + 8))(v82, v81);
      goto LABEL_69;
    }

    unint64_t v66 = *(void *)(v59 + 8 * v58);
    if (v66)
    {
LABEL_60:
      unint64_t v62 = (v66 - 1) & v66;
      unint64_t v65 = __clz(__rbit64(v66)) + (v58 << 6);
LABEL_61:
      if (*(void *)(*(void *)(a3 + 24) + 16LL))
      {
        specialized __RawDictionaryStorage.find<A>(_:)(*(void *)(*(void *)(v57 + 48) + 8 * v65));
        unint64_t v57 = v91;
      }

      continue;
    }

    break;
  }

  int64_t v67 = v58 + 1;
  if (v58 + 1 >= v63) {
    goto LABEL_67;
  }
  unint64_t v66 = *(void *)(v59 + 8 * v67);
  if (v66) {
    goto LABEL_59;
  }
  int64_t v67 = v58 + 2;
  if (v58 + 2 >= v63) {
    goto LABEL_67;
  }
  unint64_t v66 = *(void *)(v59 + 8 * v67);
  if (v66) {
    goto LABEL_59;
  }
  int64_t v67 = v58 + 3;
  if (v58 + 3 >= v63) {
    goto LABEL_67;
  }
  unint64_t v66 = *(void *)(v59 + 8 * v67);
  if (v66)
  {
LABEL_59:
    int64_t v58 = v67;
    goto LABEL_60;
  }

  while (1)
  {
    int64_t v58 = v67 + 1;
    if (__OFADD__(v67, 1LL)) {
      break;
    }
    if (v58 >= v63) {
      goto LABEL_67;
    }
    unint64_t v66 = *(void *)(v59 + 8 * v58);
    ++v67;
    if (v66) {
      goto LABEL_60;
    }
  }

LABEL_85:
  __break(1u);
LABEL_86:
  __break(1u);
}

uint64_t ObservationRegistrar.Extent.__deallocating_deinit()
{
  uint64_t v1 = *(void *)(v0 + 16);
  _swift_observation_lock_lock((os_unfair_lock_t)(v1 + 40));
  int64_t v2 = 0LL;
  uint64_t result = *(void *)(v1 + 24);
  uint64_t v4 = result + 64;
  uint64_t v5 = 1LL << *(_BYTE *)(result + 32);
  uint64_t v6 = -1LL;
  if (v5 < 64) {
    uint64_t v6 = ~(-1LL << v5);
  }
  uint64_t v7 = v6 & *(void *)(result + 64);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (!v7)
    {
      int64_t v9 = v2 + 1;
      if (__OFADD__(v2, 1LL))
      {
        __break(1u);
        goto LABEL_23;
      }

      if (v9 >= v8) {
        goto LABEL_21;
      }
      uint64_t v7 = *(void *)(v4 + 8 * v9);
      ++v2;
      if (!v7)
      {
        int64_t v2 = v9 + 1;
        if (v9 + 1 >= v8) {
          goto LABEL_21;
        }
        uint64_t v7 = *(void *)(v4 + 8 * v2);
        if (!v7)
        {
          int64_t v2 = v9 + 2;
          if (v9 + 2 >= v8) {
            goto LABEL_21;
          }
          uint64_t v7 = *(void *)(v4 + 8 * v2);
          if (!v7)
          {
            int64_t v2 = v9 + 3;
            if (v9 + 3 >= v8) {
              goto LABEL_21;
            }
            uint64_t v7 = *(void *)(v4 + 8 * v2);
            if (!v7)
            {
              int64_t v10 = v9 + 4;
              if (v10 >= v8)
              {
LABEL_21:
                swift_release();
                uint64_t v11 = MEMORY[0x18961AFF0];
                *(void *)(v1 + 24) = MEMORY[0x18961AFF0];
                swift_bridgeObjectRelease();
                *(void *)(v1 + 32) = v11;
                _swift_observation_lock_unlock((os_unfair_lock_t)(v1 + 40));
                swift_release();
                return swift_deallocClassInstance();
              }

              uint64_t v7 = *(void *)(v4 + 8 * v10);
              int64_t v2 = v10;
              if (!v7) {
                break;
              }
            }
          }
        }
      }
    }

LABEL_4:
    v7 &= v7 - 1;
  }

  while (1)
  {
    int64_t v2 = v10 + 1;
    if (__OFADD__(v10, 1LL)) {
      break;
    }
    if (v2 >= v8) {
      goto LABEL_21;
    }
    uint64_t v7 = *(void *)(v4 + 8 * v2);
    ++v10;
    if (v7) {
      goto LABEL_4;
    }
  }

LABEL_23:
  __break(1u);
  return result;
}

    uint64_t v11 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v5 << 6);
LABEL_24:
    char v20 = *(void *)(*(void *)(v2 + 48) + 8 * v16);
    uint64_t result = static Hasher._hash(seed:_:)();
    uint64_t v21 = -1LL << *(_BYTE *)(v4 + 32);
    uint64_t v22 = result & ~v21;
    uint64_t v23 = v22 >> 6;
    if (((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6))) != 0)
    {
      uint64_t v14 = __clz(__rbit64((-1LL << v22) & ~*(void *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        int64_t v26 = v23 == v25;
        if (v23 == v25) {
          uint64_t v23 = 0LL;
        }
        v24 |= v26;
        int64_t v27 = *(void *)(v13 + 8 * v23);
      }

      while (v27 == -1);
      uint64_t v14 = __clz(__rbit64(~v27)) + (v23 << 6);
    }

    *(void *)(v13 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v14;
    *(void *)(*(void *)(v4 + 48) + 8 * v14) = v20;
    ++*(void *)(v4 + 16);
  }

  unint64_t v19 = v17 + 3;
  if (v19 >= v12)
  {
LABEL_33:
    if (v36 >= 64)
    {
      if (v34 >= 8)
      {
        char v28 = v12 & 0x3FFFFFFFFFFFFFCLL;
        int v29 = (_OWORD *)(v2 + 72);
        unint64_t v30 = v12 & 0x3FFFFFFFFFFFFFCLL;
        do
        {
          *(v29 - 1) = 0uLL;
          *int v29 = 0uLL;
          v29 += 2;
          v30 -= 4LL;
        }

        while (v30);
        uint64_t v1 = v35;
        if (v12 == v28) {
          goto LABEL_42;
        }
      }

      else
      {
        char v28 = 0LL;
        uint64_t v1 = v35;
      }

      unint64_t v31 = v12 - v28;
      BOOL v32 = (void *)(v2 + 8 * v28 + 56);
      do
      {
        *v32++ = 0LL;
        --v31;
      }

      while (v31);
    }

    else
    {
      *uint64_t v6 = v33;
      uint64_t v1 = v35;
    }

    uint64_t v7 = (v16 - 1) & v16;
    uint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    type metadata accessor for AnyKeyPath();
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    unint64_t v19 = -1LL << *(_BYTE *)(v4 + 32);
    char v20 = result & ~v19;
    uint64_t v21 = v20 >> 6;
    if (((-1LL << v20) & ~*(void *)(v9 + 8 * (v20 >> 6))) != 0)
    {
      uint64_t v12 = __clz(__rbit64((-1LL << v20) & ~*(void *)(v9 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v22 = 0;
      uint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }

        uint64_t v24 = v21 == v23;
        if (v21 == v23) {
          uint64_t v21 = 0LL;
        }
        v22 |= v24;
        unint64_t v25 = *(void *)(v9 + 8 * v21);
      }

      while (v25 == -1);
      uint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }

    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }

  uint64_t v17 = v15 + 3;
  if (v17 >= v8)
  {
LABEL_33:
    swift_release();
    uint64_t v1 = v0;
    int64_t v26 = *(_BYTE *)(v2 + 32);
    int64_t v27 = 1LL << v26;
    if (1LL << v26 > 63)
    {
      char v28 = (unint64_t)(v27 + 63) >> 6;
      if ((v26 & 0x3Fu) >= 8)
      {
        int v29 = v28 & 0x3FFFFFFFFFFFFFCLL;
        unint64_t v30 = (_OWORD *)(v2 + 72);
        unint64_t v31 = v28 & 0x3FFFFFFFFFFFFFCLL;
        do
        {
          *(v30 - 1) = 0uLL;
          *unint64_t v30 = 0uLL;
          v30 += 2;
          v31 -= 4LL;
        }

        while (v31);
        if (v28 == v29) {
          goto LABEL_42;
        }
      }

      else
      {
        int v29 = 0LL;
      }

      BOOL v32 = v28 - v29;
      unint64_t v33 = (void *)(v2 + 8 * v29 + 56);
      do
      {
        *v33++ = 0LL;
        --v32;
      }

      while (v32);
    }

    else
    {
      *int64_t v34 = -1LL << v27;
    }

    int64_t v9 = (v16 - 1) & v16;
    uint64_t v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * v14);
    uint64_t result = static Hasher._hash(seed:_:)();
    unint64_t v19 = -1LL << *(_BYTE *)(v4 + 32);
    char v20 = result & ~v19;
    uint64_t v21 = v20 >> 6;
    if (((-1LL << v20) & ~*(void *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      uint64_t v12 = __clz(__rbit64((-1LL << v20) & ~*(void *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v22 = 0;
      uint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }

        uint64_t v24 = v21 == v23;
        if (v21 == v23) {
          uint64_t v21 = 0LL;
        }
        v22 |= v24;
        unint64_t v25 = *(void *)(v11 + 8 * v21);
      }

      while (v25 == -1);
      uint64_t v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }

    *(void *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v12;
    *(void *)(*(void *)(v4 + 48) + 8 * v12) = v18;
    ++*(void *)(v4 + 16);
  }

  uint64_t v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    uint64_t result = swift_release();
    uint64_t v1 = v26;
    goto LABEL_35;
  }

  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    uint64_t v5 = v17;
    goto LABEL_23;
  }

  while (1)
  {
    uint64_t v5 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v5);
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }

    uint64_t v6 = (v14 - 1) & v14;
    uint64_t v12 = __clz(__rbit64(v14)) + (v9 << 6);
LABEL_24:
    unint64_t v16 = *(void *)(*(void *)(v1 + 48) + 8 * v12);
    type metadata accessor for AnyKeyPath();
    swift_retain();
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v17 = -1LL << *(_BYTE *)(v3 + 32);
    uint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1LL << v18) & ~*(void *)(v7 + 8 * (v18 >> 6))) != 0)
    {
      int64_t v10 = __clz(__rbit64((-1LL << v18) & ~*(void *)(v7 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      char v20 = 0;
      uint64_t v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }

        uint64_t v22 = v19 == v21;
        if (v19 == v21) {
          unint64_t v19 = 0LL;
        }
        v20 |= v22;
        uint64_t v23 = *(void *)(v7 + 8 * v19);
      }

      while (v23 == -1);
      int64_t v10 = __clz(__rbit64(~v23)) + (v19 << 6);
    }

    *(void *)(v7 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v10;
    *(void *)(*(void *)(v3 + 48) + 8 * v10) = v16;
    ++*(void *)(v3 + 16);
  }

  uint64_t v15 = v13 + 3;
  if (v15 >= v25)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    goto LABEL_35;
  }

  uint64_t v14 = *(void *)(v24 + 8 * v15);
  if (v14)
  {
    int64_t v9 = v15;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v9 = v15 + 1;
    if (__OFADD__(v15, 1LL)) {
      break;
    }
    if (v9 >= v25) {
      goto LABEL_33;
    }
    uint64_t v14 = *(void *)(v24 + 8 * v9);
    ++v15;
    if (v14) {
      goto LABEL_23;
    }
  }

    int64_t v10 = (v16 - 1) & v16;
    uint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = static Hasher._hash(seed:_:)();
    unint64_t v19 = -1LL << *(_BYTE *)(v9 + 32);
    char v20 = result & ~v19;
    uint64_t v21 = v20 >> 6;
    if (((-1LL << v20) & ~*(void *)(v12 + 8 * (v20 >> 6))) != 0)
    {
      uint64_t v22 = __clz(__rbit64((-1LL << v20) & ~*(void *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0LL;
    }

    else
    {
      uint64_t v23 = 0;
      uint64_t v24 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }

        unint64_t v25 = v21 == v24;
        if (v21 == v24) {
          uint64_t v21 = 0LL;
        }
        v23 |= v25;
        int64_t v26 = *(void *)(v12 + 8 * v21);
      }

      while (v26 == -1);
      uint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
    }

    *(void *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v22;
    *(void *)(*(void *)(v9 + 48) + 8 * v22) = v18;
    ++*(void *)(v9 + 16);
    if (__OFSUB__(v5--, 1LL))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }

    if (!v5) {
      goto LABEL_36;
    }
  }

  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = a1[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }

  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = a1[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }

uint64_t ObservationRegistrar.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = swift_allocObject();
  uint64_t result = _swift_observation_lock_size();
  if (__OFADD__(result, 8LL))
  {
    __break(1u);
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationRegistrar.State>.LockedBuffer);
    uint64_t v4 = swift_allocObject();
    uint64_t result = (uint64_t)_swift_observation_lock_init((_DWORD *)(v4 + 40));
    uint64_t v5 = MEMORY[0x18961AFF0];
    *(void *)(v4 + 16) = 0LL;
    *(void *)(v4 + 24) = v5;
    *(void *)(v4 + 32) = v5;
    *(void *)(v2 + 16) = v4;
    *a1 = v2;
  }

  return result;
}

uint64_t type metadata accessor for ObservationRegistrar.Extent()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x1895D798C]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void *ObservationRegistrar.access<A, B>(_:keyPath:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v2;
  uint64_t result = (void *)_swift_observation_tls_get();
  if (result)
  {
    if (!*result) {
      *uint64_t result = MEMORY[0x18961AFF0];
    }
    uint64_t v6 = *(void *)(v4 + 16);
    swift_retain();
    ObservationTracking._AccessList.addAccess<A>(keyPath:context:)(a2, v6);
    return (void *)swift_release();
  }

  return result;
}

uint64_t ObservationTracking._AccessList.addAccess<A>(keyPath:context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v8 = *v2;
  uint64_t v23 = v8;
  uint64_t *v4 = 0x8000000000000000LL;
  unint64_t v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_13;
  }

  char v3 = v9;
  if (*(void *)(v8 + 24) >= v13)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0) {
      goto LABEL_6;
    }
LABEL_13:
    specialized _NativeDictionary.copy()();
    uint64_t v8 = v23;
    goto LABEL_6;
  }

  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v13, isUniquelyReferenced_nonNull_native);
  uint64_t v8 = v23;
  unint64_t v14 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  if ((v3 & 1) != (v15 & 1)) {
    goto LABEL_17;
  }
  unint64_t v10 = v14;
LABEL_6:
  uint64_t *v4 = v8;
  swift_bridgeObjectRelease();
  unint64_t v16 = (void *)*v4;
  swift_bridgeObjectRetain();
  if ((v3 & 1) != 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    swift_retain();
    specialized Set._Variant.insert(_:)(&v23, a1);
    return swift_release();
  }

  if ((MEMORY[0x18961AFE8] & 0xC000000000000000LL) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    unint64_t v17 = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x18961AFE8]);
  }
  else {
    unint64_t v17 = MEMORY[0x18961AFF8];
  }
  v16[(v10 >> 6) + 8] |= 1LL << v10;
  *(void *)(v16[6] + 8 * v10) = a2;
  uint64_t v18 = (uint64_t *)(v16[7] + 16 * v10);
  *uint64_t v18 = a2;
  v18[1] = v17;
  uint64_t v19 = v16[2];
  BOOL v20 = __OFADD__(v19, 1LL);
  uint64_t v21 = v19 + 1;
  if (!v20)
  {
    v16[2] = v21;
    swift_retain();
    goto LABEL_11;
  }

  __break(1u);
LABEL_17:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t ObservationRegistrar.willSet<A, B>(_:keyPath:)(uint64_t a1, uint64_t a2)
{
  return specialized ObservationRegistrar.willSet<A, B>(_:keyPath:)(a2);
}

uint64_t ObservationRegistrar.didSet<A, B>(_:keyPath:)(uint64_t a1, void *a2)
{
  uint64_t v5 = *(void *)(*(void *)v2 + 16LL);
  swift_retain();
  ObservationRegistrar.Context.didSet<A, B>(_:keyPath:)(a1, a2, v5);
  return swift_release();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)( uint64_t a1, void *a2, void (*a3)(uint64_t))
{
  uint64_t v6 = specialized ObservationRegistrar.willSet<A, B>(_:keyPath:)((uint64_t)a2);
  a3(v6);
  return ObservationRegistrar.didSet<A, B>(_:keyPath:)(a1, a2);
}

uint64_t ObservationRegistrar.init(from:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = swift_allocObject();
  uint64_t result = _swift_observation_lock_size();
  if (__OFADD__(result, 8LL))
  {
    __break(1u);
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationRegistrar.State>.LockedBuffer);
    uint64_t v5 = swift_allocObject();
    uint64_t result = (uint64_t)_swift_observation_lock_init((_DWORD *)(v5 + 40));
    uint64_t v6 = MEMORY[0x18961AFF0];
    *(void *)(v5 + 16) = 0LL;
    *(void *)(v5 + 24) = v6;
    *(void *)(v5 + 32) = v6;
    *(void *)(v3 + 16) = v5;
    *a2 = v3;
  }

  return result;
}

uint64_t protocol witness for Decodable.init(from:) in conformance ObservationRegistrar@<X0>( uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = swift_allocObject();
  uint64_t result = _swift_observation_lock_size();
  if (__OFADD__(result, 8LL))
  {
    __break(1u);
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationRegistrar.State>.LockedBuffer);
    uint64_t v5 = swift_allocObject();
    uint64_t result = (uint64_t)_swift_observation_lock_init((_DWORD *)(v5 + 40));
    uint64_t v6 = MEMORY[0x18961AFF0];
    *(void *)(v5 + 16) = 0LL;
    *(void *)(v5 + 24) = v6;
    *(void *)(v5 + 32) = v6;
    *(void *)(v3 + 16) = v5;
    *a2 = v3;
  }

  return result;
}

uint64_t static ObservationRegistrar.== infix(_:_:)()
{
  return 1LL;
}

Swift::Int ObservationRegistrar.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ObservationRegistrar()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ObservationRegistrar()
{
  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ObservationRegistrar()
{
  return 1LL;
}

uint64_t specialized Set.union<A>(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v19 = a2;
  if ((result & 0xC000000000000001LL) != 0)
  {
    __CocoaSet.makeIterator()();
    type metadata accessor for AnyKeyPath();
    uint64_t result = Set.Iterator.init(_cocoa:)();
    uint64_t v2 = v20;
    uint64_t v17 = v21;
    uint64_t v3 = v22;
    uint64_t v4 = v23;
    unint64_t v5 = v24;
  }

  else
  {
    uint64_t v4 = 0LL;
    uint64_t v6 = -1LL << *(_BYTE *)(result + 32);
    uint64_t v17 = result + 56;
    uint64_t v3 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1LL << v7);
    }
    else {
      uint64_t v8 = -1LL;
    }
    unint64_t v5 = v8 & *(void *)(result + 56);
  }

  int64_t v9 = (unint64_t)(v3 + 64) >> 6;
  if (v2 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v10 = (v5 - 1) & v5;
      unint64_t v11 = __clz(__rbit64(v5)) | (v4 << 6);
      uint64_t v12 = v4;
      goto LABEL_29;
    }

    int64_t v14 = v4 + 1;
    if (__OFADD__(v4, 1LL)) {
      break;
    }
    if (v14 >= v9) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v17 + 8 * v14);
    uint64_t v12 = v4 + 1;
    if (!v15)
    {
      uint64_t v12 = v4 + 2;
      if (v4 + 2 >= v9) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v17 + 8 * v12);
      if (!v15)
      {
        uint64_t v12 = v4 + 3;
        if (v4 + 3 >= v9) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v17 + 8 * v12);
        if (!v15)
        {
          uint64_t v12 = v4 + 4;
          if (v4 + 4 >= v9) {
            goto LABEL_32;
          }
          unint64_t v15 = *(void *)(v17 + 8 * v12);
          if (!v15)
          {
            uint64_t v12 = v4 + 5;
            if (v4 + 5 >= v9) {
              goto LABEL_32;
            }
            unint64_t v15 = *(void *)(v17 + 8 * v12);
            if (!v15)
            {
              uint64_t v16 = v4 + 6;
              while (v9 != v16)
              {
                unint64_t v15 = *(void *)(v17 + 8 * v16++);
                if (v15)
                {
                  uint64_t v12 = v16 - 1;
                  goto LABEL_28;
                }
              }

LABEL_32:
              outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
              return v19;
            }
          }
        }
      }
    }

LABEL_28:
    uint64_t v10 = (v15 - 1) & v15;
    unint64_t v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    uint64_t v13 = *(void *)(*(void *)(v2 + 48) + 8 * v11);
    swift_retain();
    if (!v13) {
      goto LABEL_32;
    }
    while (1)
    {
      specialized Set._Variant.insert(_:)(&v18, v13);
      uint64_t result = swift_release();
      uint64_t v4 = v12;
      unint64_t v5 = v10;
      if ((v2 & 0x8000000000000000LL) == 0) {
        break;
      }
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        type metadata accessor for AnyKeyPath();
        swift_dynamicCast();
        uint64_t v13 = v18;
        uint64_t v12 = v4;
        uint64_t v10 = v5;
        if (v18) {
          continue;
        }
      }

      goto LABEL_32;
    }
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

  __break(1u);
  return result;
}

void static ObservationTracking._installTracking(_:willSet:didSet:)( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];
  outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
  outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
  swift_retain();
  uint64_t v11 = swift_bridgeObjectRetain();
  uint64_t v12 = specialized _NativeDictionary.mapValues<A>(_:)(v11, a2, a3, a4, a5, v9, v10);
  swift_bridgeObjectRelease();
  swift_release();
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
  outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
  _swift_observation_lock_lock((os_unfair_lock_t)(v9 + 40));
  if (*(_BYTE *)(v9 + 24) == 1)
  {
    swift_release();
  }

  else
  {
    *(void *)(v9 + 16) = v12;
    swift_bridgeObjectRelease();
  }

  _swift_observation_lock_unlock((os_unfair_lock_t)(v9 + 40));
}

void closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)( os_unfair_lock_s **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v13 = *a1;
  if (a2)
  {
    uint64_t v25 = (uint64_t)a1[1];
    if (a4)
    {
      uint64_t v16 = (void *)swift_allocObject();
      v16[2] = a6;
      v16[3] = a7;
      v16[4] = a2;
      v16[5] = a3;
      uint64_t v17 = v13 + 10;
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
      swift_retain();
      swift_bridgeObjectRetain();
      _swift_observation_lock_lock(v17);
      uint64_t v18 = ObservationRegistrar.State.registerTracking(for:willSet:)( v25,  (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v16);
      swift_release();
      _swift_observation_lock_unlock(v17);
      uint64_t v19 = (void *)swift_allocObject();
      v19[2] = a6;
      v19[3] = a7;
      v19[4] = a4;
      v19[5] = a5;
      swift_retain();
      swift_bridgeObjectRetain();
      _swift_observation_lock_lock(v17);
      uint64_t v20 = ObservationRegistrar.State.registerTracking(for:didSet:)( v25,  (uint64_t)partial apply for closure #2 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v19);
      char v21 = 2;
    }

    else
    {
      unint64_t v24 = (void *)swift_allocObject();
      v24[2] = a6;
      v24[3] = a7;
      v24[4] = a2;
      v24[5] = a3;
      uint64_t v17 = v13 + 10;
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
      swift_retain();
      swift_bridgeObjectRetain();
      _swift_observation_lock_lock(v17);
      uint64_t v18 = ObservationRegistrar.State.registerTracking(for:willSet:)( v25,  (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v24);
      uint64_t v20 = 0LL;
      char v21 = 0;
    }

    goto LABEL_7;
  }

  if (a4)
  {
    uint64_t v22 = (uint64_t)a1[1];
    uint64_t v23 = (void *)swift_allocObject();
    v23[2] = a6;
    v23[3] = a7;
    v23[4] = a4;
    v23[5] = a5;
    uint64_t v17 = v13 + 10;
    outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
    swift_retain();
    swift_bridgeObjectRetain();
    _swift_observation_lock_lock(v17);
    uint64_t v18 = ObservationRegistrar.State.registerTracking(for:didSet:)( v22,  (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v23);
    uint64_t v20 = 0LL;
    char v21 = 1;
LABEL_7:
    swift_release();
    _swift_observation_lock_unlock(v17);
    *(void *)a8 = v18;
    *(void *)(a8 + 8) = v20;
    *(_BYTE *)(a8 + 16) = v21;
    return;
  }

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t closure #1 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *))
{
  uint64_t v8 = (os_unfair_lock_s *)(a2 + 40);
  _swift_observation_lock_lock((os_unfair_lock_t)(a2 + 40));
  *(void *)(a2 + 32) = a1;
  swift_retain();
  swift_release();
  _swift_observation_lock_unlock(v8);
  v10[0] = a2;
  v10[1] = a3;
  return a4(v10);
}

uint64_t ObservationTracking.init(_:)@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  uint64_t result = _swift_observation_lock_size();
  if (__OFADD__(result, 8LL))
  {
    __break(1u);
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    uint64_t v5 = swift_allocObject();
    uint64_t result = (uint64_t)_swift_observation_lock_init((_DWORD *)(v5 + 40));
    uint64_t v6 = MEMORY[0x18961AFF0];
    *(void *)(v5 + 16) = MEMORY[0x18961AFF0];
    *(_BYTE *)(v5 + 24) = 0;
    *(void *)(v5 + 32) = 0LL;
    if (v3) {
      uint64_t v6 = v3;
    }
    *a2 = v5;
    a2[1] = v6;
  }

  return result;
}

Swift::Void __swiftcall ObservationTracking.cancel()()
{
  uint64_t v2 = *v0;
  uint64_t v1 = v0[1];
  uint64_t v3 = *v0 + 10;
  _swift_observation_lock_lock(v3);
  LOBYTE(v2[6]._os_unfair_lock_opaque) = 1;
  uint64_t v4 = *(void *)&v2[4]._os_unfair_lock_opaque;
  *(void *)&v2[4]._os_unfair_lock_opaque = specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x18961AFE8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  _swift_observation_lock_unlock(v3);
  int64_t v5 = 0LL;
  uint64_t v6 = v4 + 64;
  uint64_t v7 = 1LL << *(_BYTE *)(v4 + 32);
  uint64_t v8 = -1LL;
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  unint64_t v9 = v8 & *(void *)(v4 + 64);
  int64_t v29 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      unint64_t v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v13 = v12 | (v5 << 6);
      goto LABEL_21;
    }

    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1LL))
    {
      __break(1u);
      goto LABEL_34;
    }

    if (v14 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }

LABEL_20:
    unint64_t v9 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
LABEL_21:
    uint64_t v17 = *(void *)(*(void *)(v4 + 48) + 8 * v13);
    uint64_t v18 = *(void *)(v4 + 56) + 24 * v13;
    uint64_t v19 = *(void *)v18;
    if (*(_BYTE *)(v18 + 16) && *(_BYTE *)(v18 + 16) != 1)
    {
      if (*(void *)&v1[4]._os_unfair_lock_opaque)
      {
        uint64_t v28 = *(void *)(v18 + 8);
        unint64_t v22 = specialized __RawDictionaryStorage.find<A>(_:)(v17);
        if ((v23 & 1) != 0)
        {
          unint64_t v24 = (os_unfair_lock_s *)(*(void *)(*(void *)&v1[14]._os_unfair_lock_opaque + 16 * v22) + 40LL);
          swift_retain();
          swift_bridgeObjectRetain();
          _swift_observation_lock_lock(v24);
          ObservationRegistrar.State.cancel(_:)(v19);
          uint64_t v25 = v24;
          uint64_t v6 = v4 + 64;
          _swift_observation_lock_unlock(v25);
          swift_bridgeObjectRelease();
          swift_release();
        }

        if (*(void *)&v1[4]._os_unfair_lock_opaque)
        {
          unint64_t v26 = specialized __RawDictionaryStorage.find<A>(_:)(v17);
          if ((v27 & 1) != 0)
          {
            uint64_t v10 = (os_unfair_lock_s *)(*(void *)(*(void *)&v1[14]._os_unfair_lock_opaque + 16 * v26) + 40LL);
            swift_retain();
            swift_bridgeObjectRetain();
            _swift_observation_lock_lock(v10);
            uint64_t v11 = v28;
LABEL_4:
            ObservationRegistrar.State.cancel(_:)(v11);
            _swift_observation_lock_unlock(v10);
            swift_bridgeObjectRelease();
            swift_release();
          }
        }
      }
    }

    else if (*(void *)&v1[4]._os_unfair_lock_opaque)
    {
      unint64_t v20 = specialized __RawDictionaryStorage.find<A>(_:)(v17);
      if ((v21 & 1) != 0)
      {
        uint64_t v10 = (os_unfair_lock_s *)(*(void *)(*(void *)&v1[14]._os_unfair_lock_opaque + 16 * v20) + 40LL);
        swift_retain();
        swift_bridgeObjectRetain();
        _swift_observation_lock_lock(v10);
        uint64_t v11 = v19;
        goto LABEL_4;
      }
    }
  }

  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    swift_release();
    return;
  }

  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_20;
  }

  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1LL)) {
      break;
    }
    if (v5 >= v29) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }

LABEL_34:
  __break(1u);
}

uint64_t ObservationTracking.changed.getter()
{
  uint64_t v1 = *v0;
  uint64_t v2 = (os_unfair_lock_s *)(v1 + 40);
  _swift_observation_lock_lock((os_unfair_lock_t)(v1 + 40));
  uint64_t v3 = *(void *)(v1 + 32);
  swift_retain();
  _swift_observation_lock_unlock(v2);
  return v3;
}

uint64_t generateAccessList<A>(_:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v14[1] = *MEMORY[0x1895F89C0];
  v14[0] = 0LL;
  uint64_t v11 = a5;
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  uint64_t CanonicalSpecializedMetadata = swift_getCanonicalSpecializedMetadata();
  uint64_t result = _ss24withUnsafeMutablePointer2to_q0_xz_q0_SpyxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF( (uint64_t)v14,  (uint64_t)partial apply for closure #1 in generateAccessList<A>(_:),  (uint64_t)v10,  CanonicalSpecializedMetadata,  MEMORY[0x18961A520],  a5,  MEMORY[0x18961A528],  v8);
  *a2 = v14[0];
  return result;
}

uint64_t _ss24withUnsafeMutablePointer2to_q0_xz_q0_SpyxGq_YKXEtq_YKs5ErrorR_Ri_zRi_0_r1_lF( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x1895F8858]();
  int64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t result = v15(v12, v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t withObservationTracking<A>(_:onChange:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t result = generateAccessList<A>(_:)(a5, &v9, a1, a2, a4);
  if (v9)
  {
    uint64_t v7 = a3(result);
    specialized static ObservationTracking._installTracking(_:onChange:)(&v9, v7, v8);
    swift_bridgeObjectRelease();
    return swift_release();
  }

  return result;
}

uint64_t withObservationTracking<A>(_:willSet:didSet:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  uint64_t v12 = v20;
  uint64_t result = _swift_observation_lock_size();
  if (__OFADD__(result, 8LL))
  {
    __break(1u);
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    uint64_t v14 = swift_allocObject();
    unint64_t v15 = (os_unfair_lock_s *)(v14 + 40);
    int64_t v16 = _swift_observation_lock_init((_DWORD *)(v14 + 40));
    uint64_t v17 = MEMORY[0x18961AFF0];
    *(void *)(v14 + 16) = MEMORY[0x18961AFF0];
    *(_BYTE *)(v14 + 24) = 0;
    *(void *)(v14 + 32) = 0LL;
    if (!v12) {
      uint64_t v12 = v17;
    }
    MEMORY[0x1895F8858](v16);
    v19[2] = a3;
    v19[3] = a4;
    v19[4] = a5;
    v19[5] = a6;
    v19[6] = v14;
    v19[7] = v12;
    uint64_t v18 = specialized _NativeDictionary.mapValues<A>(_:)( (void (*)(__int128 *__return_ptr, __int128 *))partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v19,  v12);
    _swift_observation_lock_lock(v15);
    if (*(_BYTE *)(v14 + 24) == 1)
    {
      swift_release();
    }

    else
    {
      *(void *)(v14 + 16) = v18;
      swift_bridgeObjectRelease();
    }

    _swift_observation_lock_unlock(v15);
    swift_bridgeObjectRelease();
    return swift_release();
  }

  return result;
}

uint64_t withObservationTracking<A>(_:willSet:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8 = v16;
  uint64_t result = _swift_observation_lock_size();
  if (__OFADD__(result, 8LL))
  {
    __break(1u);
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    uint64_t v10 = swift_allocObject();
    uint64_t v11 = (os_unfair_lock_s *)(v10 + 40);
    uint64_t v12 = _swift_observation_lock_init((_DWORD *)(v10 + 40));
    uint64_t v13 = MEMORY[0x18961AFF0];
    *(void *)(v10 + 16) = MEMORY[0x18961AFF0];
    *(_BYTE *)(v10 + 24) = 0;
    *(void *)(v10 + 32) = 0LL;
    if (!v8) {
      uint64_t v8 = v13;
    }
    MEMORY[0x1895F8858](v12);
    v15[2] = a3;
    v15[3] = a4;
    v15[4] = 0LL;
    v15[5] = 0LL;
    v15[6] = v10;
    v15[7] = v8;
    uint64_t v14 = specialized _NativeDictionary.mapValues<A>(_:)( (void (*)(__int128 *__return_ptr, __int128 *))partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v15,  v8);
    _swift_observation_lock_lock(v11);
    if (*(_BYTE *)(v10 + 24) == 1)
    {
      swift_release();
    }

    else
    {
      *(void *)(v10 + 16) = v14;
      swift_bridgeObjectRelease();
    }

    _swift_observation_lock_unlock(v11);
    swift_bridgeObjectRelease();
    return swift_release();
  }

  return result;
}

uint64_t withObservationTracking<A>(_:didSet:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8 = v17;
  uint64_t result = _swift_observation_lock_size();
  if (__OFADD__(result, 8LL))
  {
    __break(1u);
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    uint64_t v10 = swift_allocObject();
    uint64_t v11 = (os_unfair_lock_s *)(v10 + 40);
    uint64_t v12 = _swift_observation_lock_init((_DWORD *)(v10 + 40));
    uint64_t v13 = MEMORY[0x18961AFF0];
    *(void *)(v10 + 16) = MEMORY[0x18961AFF0];
    *(_BYTE *)(v10 + 24) = 0;
    *(void *)(v10 + 32) = 0LL;
    if (v8) {
      uint64_t v14 = v8;
    }
    else {
      uint64_t v14 = v13;
    }
    MEMORY[0x1895F8858](v12);
    v16[2] = 0LL;
    v16[3] = 0LL;
    v16[4] = a3;
    v16[5] = a4;
    v16[6] = v10;
    v16[7] = v14;
    uint64_t v15 = specialized _NativeDictionary.mapValues<A>(_:)( (void (*)(__int128 *__return_ptr, __int128 *))partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v16,  v14);
    _swift_observation_lock_lock(v11);
    if (*(_BYTE *)(v10 + 24) == 1)
    {
      swift_release();
    }

    else
    {
      *(void *)(v10 + 16) = v15;
      swift_bridgeObjectRelease();
    }

    _swift_observation_lock_unlock(v11);
    swift_bridgeObjectRelease();
    return swift_release();
  }

  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

{
  uint64_t v2;
  uint64_t v2 = static Hasher._hash(seed:_:)();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyKeyPath, Set<Int>>);
  char v42 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
LABEL_46:
    uint64_t result = swift_release();
    uint64_t *v3 = v7;
    return result;
  }

  uint64_t v8 = 1LL << *(_BYTE *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1LL << v8);
  }
  else {
    uint64_t v9 = -1LL;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
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
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }

    if (v21 >= v40)
    {
      swift_release();
      unint64_t v22 = (void *)(v5 + 64);
      if ((v42 & 1) == 0) {
        goto LABEL_46;
      }
LABEL_36:
      char v32 = *(_BYTE *)(v5 + 32);
      uint64_t v33 = 1LL << v32;
      if (1LL << v32 >= 64)
      {
        unint64_t v34 = (unint64_t)(v33 + 63) >> 6;
        if ((v32 & 0x3Fu) >= 8)
        {
          uint64_t v35 = v34 & 0x3FFFFFFFFFFFFFCLL;
          uint64_t v36 = (_OWORD *)(v5 + 80);
          uint64_t v37 = v34 & 0x3FFFFFFFFFFFFFCLL;
          do
          {
            *(v36 - 1) = 0uLL;
            *uint64_t v36 = 0uLL;
            v36 += 2;
            v37 -= 4LL;
          }

          while (v37);
          if (v34 == v35) {
            goto LABEL_45;
          }
        }

        else
        {
          uint64_t v35 = 0LL;
        }

        unint64_t v38 = v34 - v35;
        uint64_t v39 = (void *)(v5 + 8 * v35 + 64);
        do
        {
          *v39++ = 0LL;
          --v38;
        }

        while (v38);
      }

      else
      {
        *unint64_t v22 = -1LL << v33;
      }

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _OWORD *v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  uint64_t *v41;
  int64_t v42;
  void *v43;
  char v44;
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, ObservationRegistrar.State.Observation>);
  unint64_t v44 = a2;
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (!*(void *)(v5 + 16))
  {
LABEL_45:
    uint64_t result = swift_release();
LABEL_46:
    uint64_t *v3 = v7;
    return result;
  }

  uint64_t v41 = v3;
  uint64_t v8 = 0LL;
  unint64_t v43 = (void *)(v5 + 64);
  uint64_t v9 = 1LL << *(_BYTE *)(v5 + 32);
  if (v9 < 64) {
    unint64_t v10 = ~(-1LL << v9);
  }
  else {
    unint64_t v10 = -1LL;
  }
  uint64_t v11 = v10 & *(void *)(v5 + 64);
  char v42 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v12 = result + 64;
  while (1)
  {
    if (v11)
    {
      uint64_t v18 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v19 = v18 | (v8 << 6);
      goto LABEL_31;
    }

    unint64_t v20 = v8 + 1;
    if (__OFADD__(v8, 1LL))
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }

    if (v20 >= v42) {
      goto LABEL_33;
    }
    int64_t v21 = v43[v20];
    ++v8;
    if (!v21)
    {
      uint64_t v8 = v20 + 1;
      if (v20 + 1 >= v42) {
        goto LABEL_33;
      }
      int64_t v21 = v43[v8];
      if (!v21) {
        break;
      }
    }

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _OWORD *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t *v37;
  __int128 v38;
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, ObservationTracking.Entry>);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (!*(void *)(v5 + 16))
  {
LABEL_45:
    uint64_t result = swift_release();
LABEL_46:
    uint64_t *v3 = v7;
    return result;
  }

  uint64_t v37 = v3;
  uint64_t v8 = 0LL;
  uint64_t v9 = (void *)(v5 + 64);
  unint64_t v10 = 1LL << *(_BYTE *)(v5 + 32);
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  else {
    uint64_t v11 = -1LL;
  }
  uint64_t v12 = v11 & *(void *)(v5 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v14 = result + 64;
  while (1)
  {
    if (v12)
    {
      unint64_t v19 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v20 = v19 | (v8 << 6);
      goto LABEL_31;
    }

    int64_t v21 = v8 + 1;
    if (__OFADD__(v8, 1LL))
    {
LABEL_47:
      __break(1u);
      goto LABEL_48;
    }

    if (v21 >= v13) {
      goto LABEL_33;
    }
    unint64_t v22 = v9[v21];
    ++v8;
    if (!v22)
    {
      uint64_t v8 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_33;
      }
      unint64_t v22 = v9[v8];
      if (!v22) {
        break;
      }
    }

LABEL_45:
      *(void *)(v5 + 16) = 0LL;
      goto LABEL_46;
    }

    unint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v41 + 8 * v21);
    ++v13;
    if (v23) {
      goto LABEL_30;
    }
    int64_t v13 = v21 + 1;
    if (v21 + 1 >= v40) {
      goto LABEL_33;
    }
    unint64_t v23 = *(void *)(v41 + 8 * v13);
    if (v23) {
      goto LABEL_30;
    }
    int64_t v24 = v21 + 2;
    if (v24 >= v40)
    {
LABEL_33:
      swift_release();
      if ((v42 & 1) == 0) {
        goto LABEL_46;
      }
      goto LABEL_36;
    }

    unint64_t v23 = *(void *)(v41 + 8 * v24);
    if (!v23) {
      break;
    }
    int64_t v13 = v24;
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = 8 * v20;
    uint64_t v30 = *(void *)(*(void *)(v5 + 48) + v29);
    uint64_t v31 = *(void *)(*(void *)(v5 + 56) + v29);
    if ((v42 & 1) == 0)
    {
      swift_retain();
      swift_bridgeObjectRetain();
    }

    type metadata accessor for AnyKeyPath();
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
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
          goto LABEL_47;
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
    uint64_t v18 = 8 * v17;
    *(void *)(*(void *)(v7 + 48) + v18) = v30;
    *(void *)(*(void *)(v7 + 56) + v18) = v31;
    ++*(void *)(v7 + 16);
  }

  while (1)
  {
    int64_t v13 = v24 + 1;
    if (__OFADD__(v24, 1LL)) {
      break;
    }
    if (v13 >= v40) {
      goto LABEL_33;
    }
    unint64_t v23 = *(void *)(v41 + 8 * v13);
    ++v24;
    if (v23) {
      goto LABEL_30;
    }
  }

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

LABEL_48:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.insert(_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = static Hasher._hash(seed:_:)();
  uint64_t v8 = -1LL << *(_BYTE *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v9) & 1) != 0)
  {
    uint64_t v10 = ~v8;
    while (*(void *)(*(void *)(v6 + 48) + 8 * v9) != a2)
    {
      unint64_t v9 = (v9 + 1) & v10;
      if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v9) & 1) == 0) {
        goto LABEL_5;
      }
    }

    uint64_t result = 0LL;
  }

  else
  {
LABEL_5:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v3;
    uint64_t *v3 = 0x8000000000000000LL;
    specialized _NativeSet.insertNew(_:at:isUnique:)(a2, v9, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1LL;
  }

  *a1 = a2;
  return result;
}

{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001LL) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain();
    swift_retain();
    uint64_t v8 = __CocoaSet.member(for:)();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for AnyKeyPath();
      swift_dynamicCast();
      uint64_t result = 0LL;
      *a1 = v18;
      return result;
    }

    uint64_t result = __CocoaSet.count.getter();
    if (__OFADD__(result, 1LL))
    {
      __break(1u);
      return result;
    }

    unint64_t v16 = specialized _NativeSet.init(_:capacity:)(v7, result + 1);
    unint64_t v20 = v16;
    if (*(void *)(v16 + 24) <= *(void *)(v16 + 16))
    {
      swift_retain();
      specialized _NativeSet.resize(capacity:)();
      unint64_t v17 = v20;
    }

    else
    {
      unint64_t v17 = v16;
      swift_retain();
    }

    specialized _NativeSet._unsafeInsertNew(_:)(a2, v17);
    uint64_t *v3 = v17;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1LL;
  }

  type metadata accessor for AnyKeyPath();
  swift_bridgeObjectRetain();
  uint64_t v10 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v11 = -1LL << *(_BYTE *)(v6 + 32);
  uint64_t v12 = v10 & ~v11;
  if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v19 = *v2;
    uint64_t *v2 = 0x8000000000000000LL;
    unint64_t v15 = swift_retain();
    specialized _NativeSet.insertNew(_:at:isUnique:)(v15, v12, isUniquelyReferenced_nonNull_native);
    uint64_t *v2 = v19;
    swift_bridgeObjectRelease();
    *a1 = a2;
    return 1LL;
  }

  uint64_t v13 = ~v11;
  while ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0)
  {
    uint64_t v12 = (v12 + 1) & v13;
    if (((*(void *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v12) & 1) == 0) {
      goto LABEL_11;
    }
  }

  swift_release();
  swift_bridgeObjectRelease();
  *a1 = *(void *)(*(void *)(*v2 + 48) + 8 * v12);
  swift_retain();
  return 0LL;
}

uint64_t specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      type metadata accessor for AnyKeyPath();
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          specialized _NativeSet.resize(capacity:)();
          uint64_t v2 = v14;
        }

        uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1LL << *(_BYTE *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1LL << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1LL << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0LL;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }

          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }

        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }

      while (__CocoaSet.Iterator.next()());
    }

    swift_release();
  }

  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x18961AFF8];
  }

  return v2;
}

uint64_t specialized _NativeSet.resize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Int>);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
LABEL_43:
    uint64_t result = swift_release();
    uint64_t *v1 = v4;
    return result;
  }

  int64_t v5 = 0LL;
  unint64_t v6 = (uint64_t *)(v2 + 56);
  char v7 = *(_BYTE *)(v2 + 32);
  unsigned int v34 = v7 & 0x3F;
  uint64_t v35 = v1;
  uint64_t v8 = 1LL << v7;
  uint64_t v9 = -1LL << (1LL << v7);
  uint64_t v33 = v9;
  if (v8 < 64) {
    uint64_t v10 = ~v9;
  }
  else {
    uint64_t v10 = -1LL;
  }
  unint64_t v11 = v10 & *(void *)(v2 + 56);
  uint64_t v36 = v8;
  int64_t v12 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      unint64_t v15 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v16 = v15 | (v5 << 6);
      goto LABEL_24;
    }

    int64_t v17 = v5 + 1;
    if (__OFADD__(v5, 1LL))
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }

    if (v17 >= v12) {
      goto LABEL_33;
    }
    unint64_t v18 = v6[v17];
    ++v5;
    if (!v18)
    {
      int64_t v5 = v17 + 1;
      if (v17 + 1 >= v12) {
        goto LABEL_33;
      }
      unint64_t v18 = v6[v5];
      if (!v18)
      {
        int64_t v5 = v17 + 2;
        if (v17 + 2 >= v12) {
          goto LABEL_33;
        }
        unint64_t v18 = v6[v5];
        if (!v18) {
          break;
        }
      }
    }

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _OWORD *v30;
  uint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_43:
    uint64_t result = swift_release();
    uint64_t *v1 = v4;
    return result;
  }

  int64_t v5 = 1LL << *(_BYTE *)(v2 + 32);
  unsigned int v34 = (void *)(v2 + 56);
  if (v5 < 64) {
    unint64_t v6 = ~(-1LL << v5);
  }
  else {
    unint64_t v6 = -1LL;
  }
  char v7 = v6 & *(void *)(v2 + 56);
  uint64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  unint64_t v11 = 0LL;
  while (1)
  {
    if (v7)
    {
      uint64_t v13 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }

    unint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }

    if (v15 >= v8) {
      goto LABEL_33;
    }
    unint64_t v16 = v34[v15];
    ++v11;
    if (!v16)
    {
      unint64_t v11 = v15 + 1;
      if (v15 + 1 >= v8) {
        goto LABEL_33;
      }
      unint64_t v16 = v34[v11];
      if (!v16)
      {
        unint64_t v11 = v15 + 2;
        if (v15 + 2 >= v8) {
          goto LABEL_33;
        }
        unint64_t v16 = v34[v11];
        if (!v16) {
          break;
        }
      }
    }

LABEL_42:
    *(void *)(v2 + 16) = 0LL;
    goto LABEL_43;
  }

  unint64_t v18 = v6[v19];
  if (v18)
  {
    int64_t v5 = v19;
    goto LABEL_23;
  }

  while (1)
  {
    int64_t v5 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
      break;
    }
    if (v5 >= v12) {
      goto LABEL_33;
    }
    unint64_t v18 = v6[v5];
    ++v19;
    if (v18) {
      goto LABEL_23;
    }
  }

    *(void *)(v2 + 16) = 0LL;
    goto LABEL_43;
  }

  unint64_t v16 = v34[v17];
  if (v16)
  {
    unint64_t v11 = v17;
    goto LABEL_23;
  }

  while (1)
  {
    unint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1LL)) {
      break;
    }
    if (v11 >= v8) {
      goto LABEL_33;
    }
    unint64_t v16 = v34[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }

unint64_t specialized _NativeSet._unsafeInsertNew(_:)(uint64_t a1, uint64_t a2)
{
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << result;
  *(void *)(*(void *)(a2 + 48) + 8 * result) = a1;
  ++*(void *)(a2 + 16);
  return result;
}

uint64_t specialized _NativeSet.insertNew(_:at:isUnique:)(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }

  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)specialized _NativeSet.copy()();
      goto LABEL_12;
    }

    specialized _NativeSet.copyAndResize(capacity:)();
  }

  uint64_t v8 = *v3;
  unint64_t result = static Hasher._hash(seed:_:)();
  uint64_t v9 = -1LL << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v10 = ~v9;
    while (*(void *)(*(void *)(v8 + 48) + 8 * a2) != v5)
    {
      a2 = (a2 + 1) & v10;
      if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) == 0) {
        goto LABEL_12;
      }
    }

    goto LABEL_15;
  }

{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if ((a3 & 1) != 0)
  {
    specialized _NativeSet.resize(capacity:)();
  }

  else
  {
    if (v7 > v6)
    {
      unint64_t result = (uint64_t)specialized _NativeSet.copy()();
      goto LABEL_12;
    }

    specialized _NativeSet.copyAndResize(capacity:)();
  }

  uint64_t v8 = *v3;
  type metadata accessor for AnyKeyPath();
  unint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v9 = -1LL << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0)
  {
    uint64_t v10 = ~v9;
    do
    {
      unint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
      if ((result & 1) != 0) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v10;
    }

    while (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> a2) & 1) != 0);
  }

LABEL_12:
  uint64_t v11 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v11 + 48) + 8 * a2) = v5;
  uint64_t v12 = *(void *)(v11 + 16);
  BOOL v13 = __OFADD__(v12, 1LL);
  uint64_t v14 = v12 + 1;
  if (!v13)
  {
    *(void *)(v11 + 16) = v14;
    return result;
  }

  __break(1u);
LABEL_15:
  unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

  uint64_t v11 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1LL << a2;
  *(void *)(*(void *)(v11 + 48) + 8 * a2) = v5;
  uint64_t v12 = *(void *)(v11 + 16);
  BOOL v13 = __OFADD__(v12, 1LL);
  uint64_t v14 = v12 + 1;
  if (!v13)
  {
    *(void *)(v11 + 16) = v14;
    return result;
  }

  __break(1u);
LABEL_15:
  unint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

void *specialized _NativeSet.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Int>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }

  unint64_t result = (void *)(v3 + 56);
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

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    unint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }

  unint64_t result = (void *)(v3 + 56);
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

LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
  }

  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }

    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(void *)(*(void *)(v4 + 48) + 8 * v15) = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    unint64_t result = (void *)swift_retain();
  }

  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }

  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Int>);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }

  BOOL v26 = v1;
  int64_t v5 = 0LL;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1LL << *(_BYTE *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1LL << v7);
  }
  else {
    uint64_t v8 = -1LL;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      unint64_t v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      unint64_t v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }

    int64_t v15 = v5 + 1;
    if (__OFADD__(v5, 1LL))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }

    if (v15 >= v10) {
      goto LABEL_33;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      int64_t v5 = v15 + 1;
      if (v15 + 1 >= v10) {
        goto LABEL_33;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v5);
      if (!v16)
      {
        int64_t v5 = v15 + 2;
        if (v15 + 2 >= v10) {
          goto LABEL_33;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v5);
        if (!v16) {
          break;
        }
      }
    }

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
  uint64_t v2 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v3 = v2;
  if (!*(void *)(v1 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v0 = v3;
    return result;
  }

  uint64_t v4 = 1LL << *(_BYTE *)(v1 + 32);
  BOOL v24 = v1 + 56;
  if (v4 < 64) {
    int64_t v5 = ~(-1LL << v4);
  }
  else {
    int64_t v5 = -1LL;
  }
  uint64_t v6 = v5 & *(void *)(v1 + 56);
  uint64_t v25 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v7 = v2 + 56;
  uint64_t result = swift_retain_n();
  unint64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      uint64_t v11 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v12 = v11 | (v9 << 6);
      goto LABEL_24;
    }

    unint64_t v13 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }

    if (v13 >= v25) {
      goto LABEL_33;
    }
    unint64_t v14 = *(void *)(v24 + 8 * v13);
    ++v9;
    if (!v14)
    {
      unint64_t v9 = v13 + 1;
      if (v13 + 1 >= v25) {
        goto LABEL_33;
      }
      unint64_t v14 = *(void *)(v24 + 8 * v9);
      if (!v14)
      {
        unint64_t v9 = v13 + 2;
        if (v13 + 2 >= v25) {
          goto LABEL_33;
        }
        unint64_t v14 = *(void *)(v24 + 8 * v9);
        if (!v14) {
          break;
        }
      }
    }

LABEL_37:
  __break(1u);
  return result;
}

  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1LL << *(_BYTE *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0)
  {
    uint64_t v5 = ~v3;
    type metadata accessor for AnyKeyPath();
    do
    {
      if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) != 0) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }

    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v4) & 1) != 0);
  }

  return v4;
}

{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v4 = -1LL << *(_BYTE *)(v2 + 32);
  uint64_t result = a2 & ~v4;
  if (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0)
  {
    uint64_t v6 = ~v4;
    do
    {
      if (*(void *)(*(void *)(v2 + 48) + 8 * result) == a1) {
        break;
      }
      uint64_t result = (result + 1) & v6;
    }

    while (((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8LL)) >> result) & 1) != 0);
  }

  return result;
}

void *specialized _NativeDictionary.copy()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyKeyPath, Set<Int>>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
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

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 v23;
  uint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<Int, ObservationRegistrar.State.Observation>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
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

    uint64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_28;
    }

    if (v25 >= v13) {
      goto LABEL_26;
    }
    BOOL v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      BOOL v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }

{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, ObservationTracking.Entry>);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
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

LABEL_25:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
    swift_retain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    int64_t v18 = 32 * v15;
    unint64_t v19 = *(void *)(v2 + 56) + v18;
    int64_t v20 = *(void *)v19;
    unint64_t v21 = *(void *)(v19 + 8);
    char v22 = *(void *)(v19 + 24);
    unint64_t v23 = *(_BYTE *)(v19 + 16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    BOOL v24 = *(void *)(v4 + 56) + v18;
    *(void *)BOOL v24 = v20;
    *(void *)(v24 + 8) = v21;
    *(_BYTE *)(v24 + 16) = v23;
    *(void *)(v24 + 24) = v22;
    outlined copy of ObservationRegistrar.State.ObservationKind(v20, v21, v23);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }

  uint64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  BOOL v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }

  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1LL)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    BOOL v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }

    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
    int64_t v18 = 16 * v15;
    unint64_t v19 = *(_OWORD *)(*(void *)(v2 + 56) + v18);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(void *)(v4 + 56) + v18) = v19;
    swift_retain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }

  char v22 = v20 + 2;
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

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        uint64_t v10 = *(void *)(a2 + 48);
        uint64_t v11 = (void *)(v10 + 8 * v6);
        uint64_t result = static Hasher._hash(seed:_:)();
        unint64_t v12 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 >= v8 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            unint64_t v15 = (void *)(v10 + 8 * v3);
            if (v3 != v6 || v15 >= v11 + 1) {
              *unint64_t v15 = *v11;
            }
            uint64_t v16 = *(void *)(a2 + 56);
            uint64_t v17 = (_OWORD *)(v16 + 32 * v3);
            int64_t v18 = (_OWORD *)(v16 + 32 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v17 >= v18 + 2))
            {
              __int128 v9 = v18[1];
              *uint64_t v17 = *v18;
              v17[1] = v9;
              int64_t v3 = v6;
            }
          }
        }

        else if (v12 >= v8 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    unint64_t v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v20 = *v19;
    uint64_t v21 = (-1LL << v3) - 1;
  }

  else
  {
    unint64_t v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v21 = *v19;
    uint64_t v20 = (-1LL << result) - 1;
  }

  *unint64_t v19 = v21 & v20;
  uint64_t v22 = *(void *)(a2 + 16);
  BOOL v23 = __OFSUB__(v22, 1LL);
  uint64_t v24 = v22 - 1;
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

{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1LL << *(_BYTE *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      type metadata accessor for AnyKeyPath();
      do
      {
        uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
        __int128 v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 >= v8 && v3 >= (uint64_t)v9)
          {
LABEL_16:
            unint64_t v12 = *(void *)(a2 + 48);
            int64_t v13 = (void *)(v12 + 8 * v3);
            unint64_t v14 = (void *)(v12 + 8 * v6);
            if (v3 != v6 || v13 >= v14 + 1) {
              *int64_t v13 = *v14;
            }
            unint64_t v15 = *(void *)(a2 + 56);
            uint64_t v16 = (void *)(v15 + 8 * v3);
            uint64_t v17 = (void *)(v15 + 8 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 1))
            {
              *uint64_t v16 = *v17;
              int64_t v3 = v6;
            }
          }
        }

        else if (v9 >= v8 || v3 >= (uint64_t)v9)
        {
          goto LABEL_16;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    int64_t v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    unint64_t v19 = *v18;
    uint64_t v20 = (-1LL << v3) - 1;
  }

  else
  {
    int64_t v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    unint64_t v19 = (-1LL << result) - 1;
  }

  *int64_t v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  uint64_t v22 = __OFSUB__(v21, 1LL);
  BOOL v23 = v21 - 1;
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

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)( uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7 = v6;
  uint64_t v14 = *v6;
  unint64_t v16 = specialized __RawDictionaryStorage.find<A>(_:)(a5);
  uint64_t v17 = *(void *)(v14 + 16);
  BOOL v18 = (v15 & 1) == 0;
  uint64_t result = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }

  char v20 = v15;
  uint64_t v21 = *(void *)(v14 + 24);
  if (v21 >= result && (a6 & 1) != 0) {
    goto LABEL_7;
  }
  if (v21 >= result && (a6 & 1) == 0)
  {
    uint64_t result = (uint64_t)specialized _NativeDictionary.copy()();
LABEL_7:
    uint64_t v22 = (void *)*v7;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      uint64_t v23 = v22[7] + 32 * v16;
      uint64_t v24 = *(void *)v23;
      uint64_t v25 = *(void *)(v23 + 8);
      *(void *)uint64_t v23 = a1;
      *(void *)(v23 + 8) = a2;
      unsigned __int8 v26 = *(_BYTE *)(v23 + 16);
      *(_BYTE *)(v23 + 16) = a3;
      *(void *)(v23 + 24) = a4;
      outlined consume of ObservationRegistrar.State.ObservationKind(v24, v25, v26);
      return swift_bridgeObjectRelease();
    }

LABEL_11:
    v22[(v16 >> 6) + 8] |= 1LL << v16;
    *(void *)(v22[6] + 8 * v16) = a5;
    uint64_t v28 = v22[7] + 32 * v16;
    *(void *)uint64_t v28 = a1;
    *(void *)(v28 + 8) = a2;
    *(_BYTE *)(v28 + 16) = a3;
    *(void *)(v28 + 24) = a4;
    uint64_t v29 = v22[2];
    BOOL v30 = __OFADD__(v29, 1LL);
    uint64_t v31 = v29 + 1;
    if (!v30)
    {
      v22[2] = v31;
      return result;
    }

    goto LABEL_14;
  }

  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(result, a6 & 1);
  uint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(a5);
  if ((v20 & 1) == (v27 & 1))
  {
    unint64_t v16 = result;
    uint64_t v22 = (void *)*v7;
    if ((v20 & 1) != 0) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }

LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.extractSubset(using:count:)( unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = MEMORY[0x18961AFF8];
LABEL_36:
    swift_release();
    return v9;
  }

  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<Int>);
  uint64_t result = static _SetStorage.allocate(capacity:)();
  uint64_t v9 = result;
  if (a2 < 1) {
    unint64_t v10 = 0LL;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0LL;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }

    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1LL)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = a1[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = a1[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = a1[v11];
        if (!v16) {
          break;
        }
      }
    }

LABEL_40:
  __break(1u);
  return result;
}

uint64_t specialized Set._Variant.remove(_:)(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v2;
  uint64_t v5 = static Hasher._hash(seed:_:)();
  uint64_t v6 = -1LL << *(_BYTE *)(v4 + 32);
  unint64_t v7 = v5 & ~v6;
  if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) == 0) {
    return 0LL;
  }
  uint64_t v8 = ~v6;
  while (*(void *)(*(void *)(v4 + 48) + 8 * v7) != a1)
  {
    unint64_t v7 = (v7 + 1) & v8;
    if (((*(void *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) == 0) {
      return 0LL;
    }
  }

  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v11 = *v2;
  uint64_t v13 = *v2;
  uint64_t *v2 = 0x8000000000000000LL;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    specialized _NativeSet.copy()();
    uint64_t v11 = v13;
  }

  uint64_t v9 = *(void *)(*(void *)(v11 + 48) + 8 * v7);
  specialized _NativeSet._delete(at:)(v7);
  uint64_t *v2 = v13;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t specialized Dictionary._Variant.remove(at:)(void *a1, unint64_t a2, int a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    uint64_t v13 = *v4;
    uint64_t *v4 = 0x8000000000000000LL;
    specialized _NativeDictionary.copy()();
    uint64_t *v4 = v13;
    uint64_t result = swift_bridgeObjectRelease();
  }

  if ((a4 & 1) != 0) {
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000LL) != 0 || (uint64_t v11 = *v4, 1LL << *(_BYTE *)(*v5 + 32) <= (uint64_t)a2))
  {
    __break(1u);
  }

  else if (((*(void *)(v11 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8LL) + 64) >> a2) & 1) != 0)
  {
    if (*(_DWORD *)(v11 + 36) == a3)
    {
      *uint64_t v5 = 0x8000000000000000LL;
      uint64_t v12 = *(void *)(*(void *)(v11 + 48) + 8 * a2);
      *a1 = *(void *)(*(void *)(v11 + 56) + 8 * a2);
      specialized _NativeDictionary._delete(at:)(a2, v11);
      *uint64_t v5 = v11;
      swift_bridgeObjectRelease();
      return v12;
    }

    goto LABEL_11;
  }

  __break(1u);
LABEL_11:
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t specialized _NativeSet._delete(at:)(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1LL << *(_BYTE *)(v3 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1LL << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1LL << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        uint64_t v10 = *(void *)(v3 + 48);
        uint64_t v11 = (void *)(v10 + 8 * v6);
        uint64_t v12 = static Hasher._hash(seed:_:)() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= v12)
          {
LABEL_16:
            uint64_t v15 = (void *)(v10 + 8 * v2);
            if (v2 != v6 || (int64_t v2 = v6, v15 >= v11 + 1))
            {
              *uint64_t v15 = *v11;
              int64_t v2 = v6;
            }
          }
        }

        else if (v12 >= v9 || v2 >= v12)
        {
          goto LABEL_16;
        }

        unint64_t v6 = (v6 + 1) & v7;
      }

      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v6) & 1) != 0);
    }

    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << v2) - 1;
    uint64_t result = swift_release();
  }

  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << result) - 1;
  }

  uint64_t v16 = *(void *)(v3 + 16);
  BOOL v17 = __OFSUB__(v16, 1LL);
  uint64_t v18 = v16 - 1;
  if (v17)
  {
    __break(1u);
  }

  else
  {
    *(void *)(v3 + 16) = v18;
    ++*(_DWORD *)(v3 + 36);
  }

  return result;
}

void *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( void *result, int64_t a2, char a3, void *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    unint64_t v7 = a4[3];
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000LL < 0)
      {
        __break(1u);
        return result;
      }

      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    }
  }

  else
  {
    int64_t v8 = a2;
  }

  uint64_t v9 = a4[2];
  if (v8 <= v9) {
    uint64_t v10 = a4[2];
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v11 = (void *)swift_allocObject();
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    v11[2] = v9;
    v11[3] = 2 * (v13 >> 4);
  }

  else
  {
    uint64_t v11 = (void *)MEMORY[0x18961AFE8];
  }

  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[2 * v9 + 4]) {
      memmove(v11 + 4, a4 + 4, 16 * v9);
    }
    a4[2] = 0LL;
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ());
    swift_arrayInitWithCopy();
  }

  swift_bridgeObjectRelease();
  return v11;
}

uint64_t specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)( uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  uint64_t v7 = specialized LazyMapSequence.Iterator.next()();
  if (!v8)
  {
LABEL_16:
    outlined consume of [ObjectIdentifier : ObservationTracking.Entry].Iterator._Variant();
    return swift_release();
  }

  uint64_t v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = v9;
  while (1)
  {
    unint64_t v21 = (void *)*a5;
    unint64_t v23 = specialized __RawDictionaryStorage.find<A>(_:)(v10);
    uint64_t v24 = v21[2];
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25)) {
      break;
    }
    char v27 = v22;
    if (v21[3] >= v26)
    {
      if ((a4 & 1) != 0)
      {
        BOOL v30 = (void *)*a5;
        if ((v22 & 1) != 0) {
          goto LABEL_3;
        }
      }

      else
      {
        specialized _NativeDictionary.copy()();
        BOOL v30 = (void *)*a5;
        if ((v27 & 1) != 0) {
          goto LABEL_3;
        }
      }
    }

    else
    {
      specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v26, a4 & 1);
      unint64_t v28 = specialized __RawDictionaryStorage.find<A>(_:)(v10);
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_19;
      }
      unint64_t v23 = v28;
      BOOL v30 = (void *)*a5;
      if ((v27 & 1) != 0)
      {
LABEL_3:
        uint64_t v13 = (uint64_t *)(v30[7] + 16 * v23);
        uint64_t v14 = *v13;
        uint64_t v15 = v13[1];
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v16 = swift_bridgeObjectRetain();
        uint64_t v17 = specialized Set.union<A>(_:)(v16, v15);
        swift_bridgeObjectRelease();
        swift_release();
        uint64_t v18 = (void *)(v30[7] + 16 * v23);
        *uint64_t v18 = v14;
        v18[1] = v17;
        swift_bridgeObjectRelease();
        swift_release();
        goto LABEL_4;
      }
    }

    v30[(v23 >> 6) + 8] |= 1LL << v23;
    *(void *)(v30[6] + 8 * v23) = v10;
    uint64_t v31 = (void *)(v30[7] + 16 * v23);
    *uint64_t v31 = v11;
    v31[1] = v12;
    uint64_t v32 = v30[2];
    BOOL v33 = __OFADD__(v32, 1LL);
    uint64_t v34 = v32 + 1;
    if (v33) {
      goto LABEL_18;
    }
    v30[2] = v34;
LABEL_4:
    uint64_t v10 = specialized LazyMapSequence.Iterator.next()();
    uint64_t v11 = v19;
    uint64_t v12 = v20;
    a4 = 1;
    if (!v19) {
      goto LABEL_16;
    }
  }

  __break(1u);
LABEL_18:
  __break(1u);
LABEL_19:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized _NativeDictionary.mapValues<A>(_:)( void (*a1)(__int128 *__return_ptr, __int128 *), uint64_t a2, uint64_t a3)
{
  uint64_t result = static _DictionaryStorage.copy(original:)();
  char v6 = (void *)result;
  int64_t v7 = 0LL;
  uint64_t v31 = a3;
  uint64_t v10 = *(void *)(a3 + 64);
  uint64_t v9 = a3 + 64;
  uint64_t v8 = v10;
  uint64_t v11 = 1LL << *(_BYTE *)(v9 - 32);
  uint64_t v12 = -1LL;
  if (v11 < 64) {
    uint64_t v12 = ~(-1LL << v11);
  }
  unint64_t v13 = v12 & v8;
  uint64_t v24 = v9;
  int64_t v25 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v26 = result + 64;
  if ((v12 & v8) == 0) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v14 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v14 | (v7 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v7 << 6))
  {
    uint64_t v19 = *(void *)(*(void *)(v31 + 48) + 8 * i);
    __int128 v30 = *(_OWORD *)(*(void *)(v31 + 56) + 16 * i);
    swift_retain();
    swift_bridgeObjectRetain();
    a1(&v28, &v30);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_release();
      return (uint64_t)v6;
    }

    swift_bridgeObjectRelease();
    uint64_t result = swift_release();
    *(void *)(v26 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << i;
    *(void *)(v6[6] + 8 * i) = v19;
    uint64_t v20 = v6[7] + 24 * i;
    char v21 = v29;
    *(_OWORD *)uint64_t v20 = v28;
    *(_BYTE *)(v20 + 16) = v21;
    uint64_t v22 = v6[2];
    BOOL v16 = __OFADD__(v22, 1LL);
    uint64_t v23 = v22 + 1;
    if (v16)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }

    v6[2] = v23;
    if (v13) {
      goto LABEL_4;
    }
LABEL_5:
    BOOL v16 = __OFADD__(v7++, 1LL);
    if (v16) {
      goto LABEL_27;
    }
    if (v7 >= v25) {
      return (uint64_t)v6;
    }
    unint64_t v17 = *(void *)(v24 + 8 * v7);
    if (!v17) {
      break;
    }
LABEL_15:
    unint64_t v13 = (v17 - 1) & v17;
  }

  int64_t v18 = v7 + 1;
  if (v7 + 1 >= v25) {
    return (uint64_t)v6;
  }
  unint64_t v17 = *(void *)(v24 + 8 * v18);
  if (v17) {
    goto LABEL_14;
  }
  int64_t v18 = v7 + 2;
  if (v7 + 2 >= v25) {
    return (uint64_t)v6;
  }
  unint64_t v17 = *(void *)(v24 + 8 * v18);
  if (v17) {
    goto LABEL_14;
  }
  int64_t v18 = v7 + 3;
  if (v7 + 3 >= v25) {
    return (uint64_t)v6;
  }
  unint64_t v17 = *(void *)(v24 + 8 * v18);
  if (v17)
  {
LABEL_14:
    int64_t v7 = v18;
    goto LABEL_15;
  }

  while (1)
  {
    int64_t v7 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v7 >= v25) {
      return (uint64_t)v6;
    }
    unint64_t v17 = *(void *)(v24 + 8 * v7);
    ++v18;
    if (v17) {
      goto LABEL_15;
    }
  }

uint64_t specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B)@<X0>( void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v3;
  swift_retain();
  return swift_bridgeObjectRetain();
}

uint64_t specialized LazyMapSequence.Iterator.next()()
{
  void (*v9)(uint64_t *__return_ptr, uint64_t *);
  __int128 v10;
  uint64_t result;
  int64_t v12;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v1 = *v0;
  int64_t v3 = v0[3];
  unint64_t v2 = v0[4];
  int64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = (v2 - 1) & v2;
    unint64_t v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    uint64_t v8 = *(void *)(v1 + 48);
    uint64_t v7 = *(void *)(v1 + 56);
    uint64_t v9 = (void (*)(uint64_t *__return_ptr, uint64_t *))v0[5];
    uint64_t v19 = *(void *)(v8 + 8 * v6);
    uint64_t v10 = *(_OWORD *)(v7 + 16 * v6);
    v0[3] = v4;
    v0[4] = v5;
    uint64_t v20 = v10;
    swift_retain();
    swift_bridgeObjectRetain();
    v9(&v18, &v19);
    swift_bridgeObjectRelease();
    swift_release();
    return v18;
  }

  uint64_t v12 = v3 + 1;
  if (__OFADD__(v3, 1LL))
  {
    __break(1u);
  }

  else
  {
    unint64_t v13 = (unint64_t)(v0[2] + 64) >> 6;
    if (v12 < v13)
    {
      unint64_t v14 = v0[1];
      uint64_t v15 = *(void *)(v14 + 8 * v12);
      if (v15)
      {
LABEL_7:
        uint64_t v5 = (v15 - 1) & v15;
        unint64_t v6 = __clz(__rbit64(v15)) + (v12 << 6);
        int64_t v4 = v12;
        goto LABEL_3;
      }

      BOOL v16 = v3 + 2;
      int64_t v4 = v3 + 1;
      if (v3 + 2 < v13)
      {
        uint64_t v15 = *(void *)(v14 + 8 * v16);
        if (v15)
        {
LABEL_10:
          uint64_t v12 = v16;
          goto LABEL_7;
        }

        int64_t v4 = v3 + 2;
        if (v3 + 3 < v13)
        {
          uint64_t v15 = *(void *)(v14 + 8 * (v3 + 3));
          if (v15)
          {
            uint64_t v12 = v3 + 3;
            goto LABEL_7;
          }

          BOOL v16 = v3 + 4;
          int64_t v4 = v3 + 3;
          if (v3 + 4 < v13)
          {
            uint64_t v15 = *(void *)(v14 + 8 * v16);
            if (v15) {
              goto LABEL_10;
            }
            uint64_t v12 = v3 + 5;
            int64_t v4 = v3 + 4;
            if (v3 + 5 < v13)
            {
              uint64_t v15 = *(void *)(v14 + 8 * v12);
              if (v15) {
                goto LABEL_7;
              }
              int64_t v4 = v13 - 1;
              unint64_t v17 = v3 + 6;
              while (v13 != v17)
              {
                uint64_t v15 = *(void *)(v14 + 8 * v17++);
                if (v15)
                {
                  uint64_t v12 = v17 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }

    uint64_t result = 0LL;
    v0[3] = v4;
    v0[4] = 0LL;
  }

  return result;
}

void specialized ObservationRegistrar.Context.willSet<A, B>(_:keyPath:)(uint64_t a1, uint64_t a2)
{
  int64_t v4 = (os_unfair_lock_s *)(a2 + 40);
  _swift_observation_lock_lock((os_unfair_lock_t)(a2 + 40));
  uint64_t v5 = *(void *)(a2 + 32);
  if (*(void *)(v5 + 16))
  {
    unint64_t v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
    if ((v7 & 1) != 0)
    {
      uint64_t v8 = *(void *)(*(void *)(v5 + 56) + 8 * v6);
      uint64_t v9 = v8 + 56;
      uint64_t v10 = 1LL << *(_BYTE *)(v8 + 32);
      uint64_t v11 = -1LL;
      if (v10 < 64) {
        uint64_t v11 = ~(-1LL << v10);
      }
      unint64_t v12 = v11 & *(void *)(v8 + 56);
      int64_t v13 = (unint64_t)(v10 + 63) >> 6;
      swift_bridgeObjectRetain();
      int64_t v14 = 0LL;
      uint64_t v15 = (void *)MEMORY[0x18961AFE8];
      while (1)
      {
        if (v12)
        {
          unint64_t v16 = __clz(__rbit64(v12));
          v12 &= v12 - 1;
          unint64_t v17 = v16 | (v14 << 6);
        }

        else
        {
          int64_t v18 = v14 + 1;
          if (__OFADD__(v14, 1LL)) {
            goto LABEL_38;
          }
          if (v18 >= v13)
          {
LABEL_31:
            swift_release();
            goto LABEL_32;
          }

          unint64_t v19 = *(void *)(v9 + 8 * v18);
          ++v14;
          if (!v19)
          {
            int64_t v14 = v18 + 1;
            if (v18 + 1 >= v13) {
              goto LABEL_31;
            }
            unint64_t v19 = *(void *)(v9 + 8 * v14);
            if (!v19)
            {
              int64_t v14 = v18 + 2;
              if (v18 + 2 >= v13) {
                goto LABEL_31;
              }
              unint64_t v19 = *(void *)(v9 + 8 * v14);
              if (!v19)
              {
                int64_t v20 = v18 + 3;
                if (v20 >= v13) {
                  goto LABEL_31;
                }
                unint64_t v19 = *(void *)(v9 + 8 * v20);
                if (!v19)
                {
                  while (1)
                  {
                    int64_t v14 = v20 + 1;
                    if (__OFADD__(v20, 1LL)) {
                      goto LABEL_39;
                    }
                    if (v14 >= v13) {
                      goto LABEL_31;
                    }
                    unint64_t v19 = *(void *)(v9 + 8 * v14);
                    ++v20;
                    if (v19) {
                      goto LABEL_21;
                    }
                  }
                }

                int64_t v14 = v20;
              }
            }
          }

LABEL_21:
          unint64_t v12 = (v19 - 1) & v19;
          unint64_t v17 = __clz(__rbit64(v19)) + (v14 << 6);
        }

        uint64_t v21 = *(void *)(a2 + 24);
        if (*(void *)(v21 + 16))
        {
          unint64_t v22 = specialized __RawDictionaryStorage.find<A>(_:)(*(void *)(*(void *)(v8 + 48) + 8 * v17));
          if ((v23 & 1) != 0)
          {
            uint64_t v24 = *(void *)(v21 + 56) + 32 * v22;
            if (!*(_BYTE *)(v24 + 16))
            {
              unint64_t v38 = v4;
              uint64_t v26 = *(void *)v24;
              uint64_t v25 = *(void *)(v24 + 8);
              uint64_t v27 = swift_allocObject();
              *(void *)(v27 + 16) = v26;
              *(void *)(v27 + 24) = v25;
              uint64_t v37 = v27;
              outlined copy of ObservationRegistrar.State.ObservationKind(v26, v25, 0);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v15 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  v15[2] + 1LL,  1,  v15,  (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
              }
              unint64_t v29 = v15[2];
              unint64_t v28 = v15[3];
              unint64_t v30 = v29 + 1;
              int64_t v4 = v38;
              if (v29 >= v28 >> 1)
              {
                uint64_t v32 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (void *)(v28 > 1),  v29 + 1,  1,  v15,  (uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<@Sendable (_:)>);
                unint64_t v30 = v29 + 1;
                uint64_t v15 = v32;
              }

              v15[2] = v30;
              uint64_t v31 = &v15[2 * v29];
              v31[4] = thunk for @escaping @callee_guaranteed @Sendable (@guaranteed AnyKeyPath) -> ()partial apply;
              v31[5] = v37;
            }
          }
        }
      }
    }
  }

  uint64_t v15 = (void *)MEMORY[0x18961AFE8];
LABEL_32:
  _swift_observation_lock_unlock(v4);
  uint64_t v33 = v15[2];
  if (v33)
  {
    unint64_t v34 = 0LL;
    uint64_t v35 = v15 + 5;
    while (v34 < v15[2])
    {
      ++v34;
      uint64_t v36 = (void (*)(uint64_t *))*(v35 - 1);
      uint64_t v39 = a1;
      swift_retain();
      v36(&v39);
      swift_release();
      v35 += 2;
      if (v33 == v34) {
        goto LABEL_36;
      }
    }

    __break(1u);
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
  }

  else
  {
LABEL_36:
    swift_bridgeObjectRelease();
  }

      __asm { BR              X11 }
    }

    if (v13 >= 0x100) {
      unint64_t v6 = 2;
    }
    else {
      unint64_t v6 = v13 > 1;
    }
  }

  if (v9 < a2) {
    goto LABEL_14;
  }
  goto LABEL_21;
}
}

unint64_t specialized closure #1 in _NativeSet.filter(_:)( unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6 = (unint64_t *)result;
  uint64_t v7 = 0LL;
  int64_t v8 = 0LL;
  uint64_t v9 = a3 + 56;
  uint64_t v10 = 1LL << *(_BYTE *)(a3 + 32);
  uint64_t v11 = -1LL;
  if (v10 < 64) {
    uint64_t v11 = ~(-1LL << v10);
  }
  unint64_t v12 = v11 & *(void *)(a3 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    while (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v8 << 6);
      if (*(void *)(a4 + 16)) {
        goto LABEL_18;
      }
    }

    BOOL v16 = __OFADD__(v8++, 1LL);
    if (v16)
    {
      __break(1u);
      goto LABEL_29;
    }

    if (v8 >= v13) {
      goto LABEL_27;
    }
    unint64_t v17 = *(void *)(v9 + 8 * v8);
    if (!v17) {
      break;
    }
LABEL_17:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v8 << 6);
    if (*(void *)(a4 + 16))
    {
LABEL_18:
      uint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(*(void *)(*(void *)(a3 + 48) + 8 * v15));
      if ((v19 & 1) != 0 && *(_BYTE *)(*(void *)(a4 + 56) + 32 * result + 16) == 3)
      {
        *(unint64_t *)((char *)v6 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v15;
        BOOL v16 = __OFADD__(v7++, 1LL);
        if (v16) {
          goto LABEL_30;
        }
      }
    }
  }

  int64_t v18 = v8 + 1;
  if (v8 + 1 >= v13) {
    goto LABEL_27;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v8 + 2;
  if (v8 + 2 >= v13) {
    goto LABEL_27;
  }
  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17) {
    goto LABEL_16;
  }
  int64_t v18 = v8 + 3;
  if (v8 + 3 >= v13)
  {
LABEL_27:
    swift_retain();
    return specialized _NativeSet.extractSubset(using:count:)(v6, a2, v7, a3);
  }

  unint64_t v17 = *(void *)(v9 + 8 * v18);
  if (v17)
  {
LABEL_16:
    int64_t v8 = v18;
    goto LABEL_17;
  }

  while (1)
  {
    int64_t v8 = v18 + 1;
    if (__OFADD__(v18, 1LL)) {
      break;
    }
    if (v8 >= v13) {
      goto LABEL_27;
    }
    unint64_t v17 = *(void *)(v9 + 8 * v8);
    ++v18;
    if (v17) {
      goto LABEL_17;
    }
  }

unint64_t specialized _NativeSet.filter(_:)(uint64_t a1, uint64_t a2)
{
  v17[1] = *MEMORY[0x1895F89C0];
  char v5 = *(_BYTE *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1LL << v5) + 63) >> 6;
  uint64_t v8 = 8 * v7;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  if (v6 > 0xD && (swift_stdlib_isStackAllocationSafe() & 1) == 0)
  {
    uint64_t v12 = swift_slowAlloc();
    unint64_t v13 = v12;
    uint64_t v14 = 0LL;
    while (1)
    {
      uint64_t v15 = v14 + 1;
      if (__OFADD__(v14, 1LL)) {
        break;
      }
      *(void *)(v12 + 8 * v14++) = 0LL;
      if (v15 == v7)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v11 = specialized closure #1 in _NativeSet.filter(_:)(v13, v7, a1, a2);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        MEMORY[0x1895D79F8](v13, -1LL, -1LL);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
    }

LABEL_16:
    __break(1u);
  }

  MEMORY[0x1895F8858]();
  uint64_t v9 = 0LL;
  do
  {
    uint64_t v10 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
      __break(1u);
      goto LABEL_16;
    }

    *(void *)((char *)&v17[v9++] - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL)) = 0LL;
  }

  while (v10 != v7);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  unint64_t v11 = specialized closure #1 in _NativeSet.filter(_:)( (unint64_t)v17 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0LL),  v7,  a1,  a2);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2) {
    swift_willThrow();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_14:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    if (result)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyKeyPath>);
      uint64_t result = static _SetStorage.allocate(capacity:)();
      unint64_t v3 = result;
      unint64_t v17 = v1;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      unint64_t v4 = result;
      if (!result) {
        return v3;
      }
      goto LABEL_9;
    }
  }

  else if (*(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    goto LABEL_3;
  }

  unint64_t v3 = MEMORY[0x18961AFF8];
  unint64_t v17 = v1;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v4 = *(void *)((v1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  if (!v4) {
    return v3;
  }
LABEL_9:
  unint64_t v5 = 0LL;
  unint64_t v6 = v3 + 56;
  unint64_t v18 = v4;
  while (1)
  {
    if ((v17 & 0xC000000000000001LL) != 0)
    {
      uint64_t v7 = MEMORY[0x1895D77E8](v5, v17);
      BOOL v8 = __OFADD__(v5++, 1LL);
      if (v8)
      {
LABEL_24:
        __break(1u);
        return v3;
      }

      goto LABEL_14;
    }

    if (v5 >= *(void *)((v17 & 0xFFFFFFFFFFFFFF8LL) + 0x10)) {
      break;
    }
    uint64_t v7 = *(void *)(v17 + 32 + 8 * v5);
    swift_retain();
    BOOL v8 = __OFADD__(v5++, 1LL);
    if (v8) {
      goto LABEL_24;
    }
LABEL_14:
    type metadata accessor for AnyKeyPath();
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v9 = -1LL << *(_BYTE *)(v3 + 32);
    unint64_t v10 = result & ~v9;
    unint64_t v11 = v10 >> 6;
    uint64_t v12 = *(void *)(v6 + 8 * (v10 >> 6));
    uint64_t v13 = 1LL << v10;
    if (((1LL << v10) & v12) != 0)
    {
      uint64_t v14 = ~v9;
      while (1)
      {
        uint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
        if ((result & 1) != 0) {
          break;
        }
        unint64_t v10 = (v10 + 1) & v14;
        unint64_t v11 = v10 >> 6;
        uint64_t v12 = *(void *)(v6 + 8 * (v10 >> 6));
        uint64_t v13 = 1LL << v10;
        if ((v12 & (1LL << v10)) == 0)
        {
          unint64_t v4 = v18;
          goto LABEL_19;
        }
      }

      uint64_t result = swift_release();
      unint64_t v4 = v18;
      if (v5 == v18) {
        return v3;
      }
    }

    else
    {
LABEL_19:
      *(void *)(v6 + 8 * v11) = v13 | v12;
      *(void *)(*(void *)(v3 + 48) + 8 * v10) = v7;
      uint64_t v15 = *(void *)(v3 + 16);
      BOOL v8 = __OFADD__(v15, 1LL);
      uint64_t v16 = v15 + 1;
      if (v8) {
        goto LABEL_27;
      }
      *(void *)(v3 + 16) = v16;
      if (v5 == v4) {
        return v3;
      }
    }
  }

  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t specialized ObservationRegistrar.willSet<A, B>(_:keyPath:)(uint64_t a1)
{
  uint64_t v3 = *(void *)(*(void *)v1 + 16LL);
  swift_retain();
  specialized ObservationRegistrar.Context.willSet<A, B>(_:keyPath:)(a1, v3);
  return swift_release();
}

uint64_t specialized _NativeDictionary.mapValues<A>(_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = static _DictionaryStorage.copy(original:)();
  int64_t v9 = 0LL;
  uint64_t v43 = a1;
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v11 = a1 + 64;
  uint64_t v10 = v12;
  uint64_t v13 = 1LL << *(_BYTE *)(v11 - 32);
  uint64_t v14 = -1LL;
  if (v13 < 64) {
    uint64_t v14 = ~(-1LL << v13);
  }
  unint64_t v15 = v14 & v10;
  uint64_t v39 = v11;
  int64_t v40 = (unint64_t)(v13 + 63) >> 6;
  uint64_t v52 = (void *)v8;
  uint64_t v42 = v8 + 64;
  if (!v15) {
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v16 = __clz(__rbit64(v15));
  uint64_t v17 = (v15 - 1) & v15;
  for (unint64_t i = v16 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v9 << 6))
  {
    unint64_t v22 = (os_unfair_lock_s **)(*(void *)(v43 + 56) + 16 * i);
    uint64_t v24 = *v22;
    uint64_t v23 = (uint64_t)v22[1];
    unint64_t v49 = v17;
    int64_t v50 = v9;
    uint64_t v51 = *(void *)(*(void *)(v43 + 48) + 8 * i);
    if (a2)
    {
      lock = v24 + 10;
      uint64_t v25 = (void *)swift_allocObject();
      v25[2] = a6;
      v25[3] = a7;
      v25[4] = a2;
      v25[5] = a3;
      swift_retain();
      swift_bridgeObjectRetain();
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a2);
      if (a4)
      {
        outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v26 = v24 + 10;
        _swift_observation_lock_lock(lock);
        uint64_t v27 = ObservationRegistrar.State.registerTracking(for:willSet:)( v23,  (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v25);
        swift_release();
        _swift_observation_lock_unlock(lock);
        unint64_t v28 = (void *)swift_allocObject();
        v28[2] = a6;
        v28[3] = a7;
        v28[4] = a4;
        v28[5] = a5;
        uint64_t v29 = v27;
        swift_retain();
        swift_bridgeObjectRetain();
        _swift_observation_lock_lock(lock);
        uint64_t v30 = ObservationRegistrar.State.registerTracking(for:didSet:)( v23,  (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v28);
        char v31 = 2;
      }

      else
      {
        swift_retain();
        swift_bridgeObjectRetain();
        uint64_t v26 = v24 + 10;
        _swift_observation_lock_lock(lock);
        uint64_t v29 = ObservationRegistrar.State.registerTracking(for:willSet:)( v23,  (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v25);
        uint64_t v30 = 0LL;
        char v31 = 0;
      }
    }

    else
    {
      if (!a4) {
        goto LABEL_32;
      }
      uint64_t v32 = (void *)swift_allocObject();
      v32[2] = a6;
      v32[3] = a7;
      v32[4] = a4;
      v32[5] = a5;
      swift_retain();
      swift_bridgeObjectRetain();
      outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?(a4);
      uint64_t v26 = v24 + 10;
      swift_retain();
      swift_bridgeObjectRetain();
      _swift_observation_lock_lock(v24 + 10);
      uint64_t v29 = ObservationRegistrar.State.registerTracking(for:didSet:)( v23,  (uint64_t)partial apply for closure #4 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v32);
      uint64_t v30 = 0LL;
      char v31 = 1;
    }

    swift_release();
    _swift_observation_lock_unlock(v26);
    swift_bridgeObjectRelease();
    swift_release();
    *(void *)(v42 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << i;
    *(void *)(v52[6] + 8 * i) = v51;
    uint64_t v33 = v52[7] + 24 * i;
    *(void *)uint64_t v33 = v29;
    *(void *)(v33 + 8) = v30;
    *(_BYTE *)(v33 + 16) = v31;
    uint64_t v34 = v52[2];
    BOOL v35 = __OFADD__(v34, 1LL);
    uint64_t v36 = v34 + 1;
    if (v35)
    {
      __break(1u);
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }

    v52[2] = v36;
    unint64_t v15 = v49;
    int64_t v9 = v50;
    if (v49) {
      goto LABEL_4;
    }
LABEL_5:
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1LL)) {
      goto LABEL_30;
    }
    if (v19 >= v40) {
      return (uint64_t)v52;
    }
    unint64_t v20 = *(void *)(v39 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v40) {
        return (uint64_t)v52;
      }
      unint64_t v20 = *(void *)(v39 + 8 * v9);
      if (!v20)
      {
        int64_t v9 = v19 + 2;
        if (v19 + 2 >= v40) {
          return (uint64_t)v52;
        }
        unint64_t v20 = *(void *)(v39 + 8 * v9);
        if (!v20) {
          break;
        }
      }
    }

LABEL_18:
    uint64_t v17 = (v20 - 1) & v20;
  }

  int64_t v21 = v19 + 3;
  if (v21 >= v40) {
    return (uint64_t)v52;
  }
  unint64_t v20 = *(void *)(v39 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_18;
  }

  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1LL)) {
      break;
    }
    if (v9 >= v40) {
      return (uint64_t)v52;
    }
    unint64_t v20 = *(void *)(v39 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_18;
    }
  }

LABEL_31:
  __break(1u);
LABEL_32:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t outlined copy of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?( uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t outlined consume of (@escaping @callee_guaranteed @Sendable (@in_guaranteed ObservationTracking) -> ())?( uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t specialized static ObservationTracking._installTracking(_:onChange:)( uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  swift_bridgeObjectRetain();
  uint64_t result = _swift_observation_lock_size();
  if (__OFADD__(result, 8LL))
  {
    __break(1u);
  }

  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ManagedCriticalState<ObservationTracking.State>.LockedBuffer);
    uint64_t v7 = swift_allocObject();
    _swift_observation_lock_init((_DWORD *)(v7 + 40));
    *(void *)(v7 + 16) = MEMORY[0x18961AFF0];
    *(_BYTE *)(v7 + 24) = 0;
    *(void *)(v7 + 32) = 0LL;
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = a2;
    v8[3] = a3;
    v8[4] = v7;
    v8[5] = v5;
    void v10[2] = partial apply for closure #1 in static ObservationTracking._installTracking(_:onChange:);
    v10[3] = MEMORY[0x1895F8858]();
    v10[4] = 0LL;
    v10[5] = 0LL;
    v10[6] = v7;
    v10[7] = v5;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v9 = specialized _NativeDictionary.mapValues<A>(_:)( (void (*)(__int128 *__return_ptr, __int128 *))partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:),  (uint64_t)v10,  v5);
    _swift_observation_lock_lock((os_unfair_lock_t)(v7 + 40));
    if (*(_BYTE *)(v7 + 24) == 1)
    {
      swift_release();
    }

    else
    {
      *(void *)(v7 + 16) = v9;
      swift_bridgeObjectRelease();
    }

    _swift_observation_lock_unlock((os_unfair_lock_t)(v7 + 40));
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }

  return result;
}

unint64_t specialized Dictionary.init(dictionaryLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return MEMORY[0x18961AFF0];
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<ObjectIdentifier, ObservationTracking.Id>);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  unint64_t v4 = (unsigned __int8 *)(a1 + 56);
  do
  {
    int v5 = *v4;
    if (v5 == 255) {
      break;
    }
    uint64_t v6 = *((void *)v4 - 3);
    __int128 v13 = *((_OWORD *)v4 - 1);
    unint64_t result = specialized __RawDictionaryStorage.find<A>(_:)(v6);
    if ((v8 & 1) != 0)
    {
      __break(1u);
LABEL_11:
      __break(1u);
      return result;
    }

    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8LL) + 64) |= 1LL << result;
    *(void *)(v3[6] + 8 * result) = v6;
    uint64_t v9 = v3[7] + 24 * result;
    *(_OWORD *)uint64_t v9 = v13;
    *(_BYTE *)(v9 + 16) = v5;
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1LL);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 32;
    v3[2] = v12;
    --v1;
  }

  while (v1);
  return (unint64_t)v3;
}

void partial apply for closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)( os_unfair_lock_s **a1@<X0>, uint64_t a2@<X8>)
{
}

{
  uint64_t *v2;
  closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)( a1,  v2[2],  v2[3],  v2[4],  v2[5],  v2[6],  v2[7],  a2);
}

unint64_t lazy protocol witness table accessor for type ObservationRegistrar and conformance ObservationRegistrar()
{
  unint64_t result = lazy protocol witness table cache variable for type ObservationRegistrar and conformance ObservationRegistrar;
  if (!lazy protocol witness table cache variable for type ObservationRegistrar and conformance ObservationRegistrar)
  {
    unint64_t result = MEMORY[0x1895D7998]( &protocol conformance descriptor for ObservationRegistrar,  &type metadata for ObservationRegistrar);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type ObservationRegistrar and conformance ObservationRegistrar);
  }

  return result;
}

uint64_t type metadata completion function for _ManagedCriticalState.LockedBuffer()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for _ManagedCriticalState.LockedBuffer( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for _ManagedCriticalState.LockedBuffer);
}

ValueMetadata *type metadata accessor for ObservationRegistrar()
{
  return &type metadata for ObservationRegistrar;
}

uint64_t type metadata accessor for ObservationRegistrar.ValueObservationStorage()
{
  return objc_opt_self();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ObservationTracking()
{
  return &type metadata for ObservationTracking;
}

ValueMetadata *type metadata accessor for ObservationTracking._AccessList()
{
  return &type metadata for ObservationTracking._AccessList;
}

uint64_t destroy for ObservationTracking.Entry()
{
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for ObservationTracking(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ObservationTracking(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for ObservationTracking(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationTracking(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ObservationTracking(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 16) = 1;
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

    *(_BYTE *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ObservationTracking.Entry()
{
  return &type metadata for ObservationTracking.Entry;
}

ValueMetadata *type metadata accessor for ObservationRegistrar.Context()
{
  return &type metadata for ObservationRegistrar.Context;
}

uint64_t destroy for ObservationTracking.State()
{
  return swift_release();
}

uint64_t initializeBufferWithCopyOfBuffer for ObservationTracking.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for ObservationTracking.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ObservationTracking.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationTracking.State(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *((_BYTE *)a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ObservationTracking.State(uint64_t result, int a2, int a3)
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
      *(void *)__n128 result = (a2 - 1);
      return result;
    }

    *(_BYTE *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for ObservationTracking.State()
{
  return &type metadata for ObservationTracking.State;
}

uint64_t destroy for ObservationRegistrar.State()
{
  return swift_bridgeObjectRelease();
}

void *initializeBufferWithCopyOfBuffer for ObservationRegistrar.State(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for ObservationRegistrar.State(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ObservationRegistrar.State(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationRegistrar.State(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ObservationRegistrar.State(uint64_t result, int a2, int a3)
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

void *type metadata accessor for ObservationRegistrar.State()
{
  return &unk_18A3069B8;
}

uint64_t type metadata instantiation function for _ManagedCriticalState()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for _ManagedCriticalState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _ManagedCriticalState);
}

uint64_t associated type witness table accessor for Identifiable.ID : Hashable in _ManagedCriticalState<A>()
{
  return MEMORY[0x189617C00];
}

uint64_t partial apply for closure #2 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)( uint64_t a1)
{
  return closure #1 in closure #1 in static ObservationTracking._installTracking(_:willSet:didSet:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  *(uint64_t (**)(void *))(v1 + 32));
}

uint64_t outlined consume of ObservationRegistrar.State.ObservationKind( uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 < 4u) {
    return swift_release();
  }
  return result;
}

uint64_t outlined copy of ObservationRegistrar.State.ObservationKind( uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 < 4u) {
    return swift_retain();
  }
  return result;
}

uint64_t partial apply for closure #1 in generateAccessList<A>(_:)(uint64_t *a1)
{
  uint64_t v3 = *(void (**)(uint64_t))(v1 + 24);
  unint64_t v4 = (uint64_t *)_swift_observation_tls_get();
  uint64_t v5 = _swift_observation_tls_set((uint64_t)a1);
  v3(v5);
  uint64_t v6 = *a1;
  if (*a1) {
    BOOL v7 = v4 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = *v4;
    if (*v4)
    {
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v12 = v8;
      specialized _NativeDictionary.merge<A>(_:isUnique:uniquingKeysWith:)( v6,  (uint64_t)specialized thunk for @escaping @callee_guaranteed (@in_guaranteed A, @in_guaranteed B) -> (@out A, @out B),  0LL,  isUniquelyReferenced_nonNull_native,  &v12);
      uint64_t v10 = v12;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t *v4 = v10;
    }

    else
    {
      uint64_t *v4 = v6;
      swift_bridgeObjectRetain();
    }

    swift_bridgeObjectRelease();
  }

  return _swift_observation_tls_set((uint64_t)v4);
}

uint64_t sub_188E1CBF8()
{
  return swift_deallocObject();
}

__n128 partial apply for closure #1 in static ObservationTracking._installTracking(_:onChange:)()
{
  return result;
}

uint64_t objectdestroyTm()
{
  return swift_deallocObject();
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

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8LL);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_188E1CD40()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@guaranteed AnyKeyPath) -> ()( void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed @Sendable (@in_guaranteed Any) -> ()()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895D7980](a1, v6, a5);
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ObservationTracking.Id(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ObservationTracking.Id( uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t getEnumTag for ObservationTracking.Id(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for ObservationTracking.Id(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ObservationTracking.Id()
{
  return &type metadata for ObservationTracking.Id;
}

uint64_t initializeBufferWithCopyOfBuffer for ObservationRegistrar.State.Observation( uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ObservationRegistrar.State.Observation(uint64_t a1)
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ObservationRegistrar.State.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(_BYTE *)(a2 + 16);
  outlined copy of ObservationRegistrar.State.ObservationKind(*(void *)a2, v5, v6);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ObservationRegistrar.State.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  unsigned __int8 v6 = *(_BYTE *)(a2 + 16);
  outlined copy of ObservationRegistrar.State.ObservationKind(*(void *)a2, v5, v6);
  uint64_t v7 = *(void *)a1;
  uint64_t v8 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  unsigned __int8 v9 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v6;
  outlined consume of ObservationRegistrar.State.ObservationKind(v7, v8, v9);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for ObservationRegistrar.State.Observation(uint64_t a1, uint64_t a2)
{
  char v4 = *(_BYTE *)(a2 + 16);
  uint64_t v5 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v7 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v4;
  outlined consume of ObservationRegistrar.State.ObservationKind(v5, v6, v7);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationRegistrar.State.Observation(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 < 0 && *(_BYTE *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ObservationRegistrar.State.Observation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0LL;
    if (a3 < 0) {
      *(_BYTE *)(result + 32) = 1;
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

    *(_BYTE *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }

  return result;
}

void *type metadata accessor for ObservationRegistrar.State.Observation()
{
  return &unk_18A306CC0;
}

uint64_t *initializeBufferWithCopyOfBuffer for Optional(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84)) {
    size_t v8 = *(void *)(v6 + 64);
  }
  else {
    size_t v8 = *(void *)(v6 + 64) + 1LL;
  }
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    uint64_t v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16LL) & ~(unint64_t)v7));
    swift_retain();
  }

  else if ((*(unsigned int (**)(uint64_t *, uint64_t, void))(v6 + 48))(a2, 1LL, *(void *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }

  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
  }

  return a1;
}

uint64_t destroy for Optional(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 16);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1LL, v3);
  if (!(_DWORD)result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1LL, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1LL;
    }
    memcpy(a1, a2, v7);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
  }

  return a1;
}

void *assignWithCopy for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1LL, v5);
  int v9 = v7(a2, 1LL, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
      return a1;
    }
  }

  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }

  if (*(_DWORD *)(v6 + 84)) {
    size_t v10 = *(void *)(v6 + 64);
  }
  else {
    size_t v10 = *(void *)(v6 + 64) + 1LL;
  }
  memcpy(a1, a2, v10);
  return a1;
}

void *initializeWithTake for Optional(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1LL, v5))
  {
    if (*(_DWORD *)(v6 + 84)) {
      size_t v7 = *(void *)(v6 + 64);
    }
    else {
      size_t v7 = *(void *)(v6 + 64) + 1LL;
    }
    memcpy(a1, a2, v7);
  }

  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
  }

  return a1;
}

void *assignWithTake for Optional(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  size_t v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  int v8 = v7(a1, 1LL, v5);
  int v9 = v7(a2, 1LL, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v6 + 56))(a1, 0LL, 1LL, v5);
      return a1;
    }
  }

  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      return a1;
    }

    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }

  if (*(_DWORD *)(v6 + 84)) {
    size_t v10 = *(void *)(v6 + 64);
  }
  else {
    size_t v10 = *(void *)(v6 + 64) + 1LL;
  }
  memcpy(a1, a2, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for Optional(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8LL);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  unsigned int v6 = v5 - 1;
  if (!v5) {
    unsigned int v6 = 0;
  }
  uint64_t v7 = *(void *)(v4 + 64);
  if (!v5) {
    ++v7;
  }
  if (!a2) {
    return 0LL;
  }
  int v8 = a2 - v6;
  if (a2 > v6)
  {
    char v9 = 8 * v7;
    unsigned int v11 = ((v8 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      int v10 = *(_DWORD *)(a1 + v7);
      if (v10) {
        goto LABEL_15;
      }
    }

    else
    {
      if (v11 <= 0xFF)
      {
        if (v11 < 2) {
          goto LABEL_24;
        }
LABEL_8:
        int v10 = *(unsigned __int8 *)(a1 + v7);
        if (!*(_BYTE *)(a1 + v7)) {
          goto LABEL_24;
        }
LABEL_15:
        int v12 = (v10 - 1) << v9;
        if ((_DWORD)v7)
        {
          else {
            int v13 = 4;
          }
          __asm { BR              X12 }
        }

        return v6 + v12 + 1;
      }

      int v10 = *(unsigned __int16 *)(a1 + v7);
      if (*(_WORD *)(a1 + v7)) {
        goto LABEL_15;
      }
    }
  }

LABEL_24:
  if (v5 < 2) {
    return 0LL;
  }
  unsigned int v14 = (*(uint64_t (**)(void))(v4 + 48))();
  if (v14 >= 2) {
    return v14 - 1;
  }
  else {
    return 0LL;
  }
}

void storeEnumTagSinglePayload for Optional(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6 = 0u;
  uint64_t v7 = *(void *)(*(void *)(a4 + 16) - 8LL);
  int v8 = *(_DWORD *)(v7 + 84);
  unsigned int v9 = v8 - 1;
  if (v8)
  {
    size_t v10 = *(void *)(v7 + 64);
  }

  else
  {
    unsigned int v9 = 0;
    size_t v10 = *(void *)(v7 + 64) + 1LL;
  }

  BOOL v11 = a3 >= v9;
  unsigned int v12 = a3 - v9;
  if (v12 != 0 && v11)
  {
    if (v10 > 3)
    {
      unsigned int v6 = 1u;
      if (v9 < a2) {
        goto LABEL_14;
      }
      goto LABEL_21;
    }

    unsigned int v13 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
    if (HIWORD(v13))
    {
      unsigned int v6 = 4u;
      if (v9 < a2)
      {
LABEL_14:
        unsigned int v14 = ~v9 + a2;
        if (v10 < 4)
        {
          if ((_DWORD)v10)
          {
            int v15 = v14 & ~(-1 << (8 * v10));
            bzero(a1, v10);
            if ((_DWORD)v10 == 3)
            {
              *a1 = v15;
              *((_BYTE *)a1 + 2) = BYTE2(v15);
            }

            else if ((_DWORD)v10 == 2)
            {
              *a1 = v15;
            }

            else
            {
              *(_BYTE *)a1 = v15;
            }
          }
        }

        else
        {
          bzero(a1, v10);
          *(_DWORD *)a1 = v14;
        }

        __asm { BR              X10 }
      }

void sub_188E1D7D8()
{
  *(_BYTE *)(v0 + v1) = v2;
}

void sub_188E1D7E0()
{
  *(_WORD *)(v0 + v1) = v2;
}

uint64_t getEnumTag for Optional(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(*(void *)(a2 + 16) - 8LL) + 48LL))(a1, 1LL);
}

uint64_t destructiveInjectEnumTag for Optional(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a3 + 16) - 8LL) + 56LL))( a1,  a2,  1LL);
}

uint64_t destroy for ObservationRegistrar.State.ObservationKind(uint64_t a1)
{
  return outlined consume of ObservationRegistrar.State.ObservationKind( *(void *)a1,  *(void *)(a1 + 8),  *(_BYTE *)(a1 + 16));
}

uint64_t initializeBufferWithCopyOfBuffer for ObservationRegistrar.State.ObservationKind( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  outlined copy of ObservationRegistrar.State.ObservationKind(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ObservationRegistrar.State.ObservationKind(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(_BYTE *)(a2 + 16);
  outlined copy of ObservationRegistrar.State.ObservationKind(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of ObservationRegistrar.State.ObservationKind(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for ObservationRegistrar.State.ObservationKind(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of ObservationRegistrar.State.ObservationKind(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ObservationRegistrar.State.ObservationKind(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ObservationRegistrar.State.ObservationKind( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)uint64_t result = a2 - 253;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFD) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

void *type metadata accessor for ObservationRegistrar.State.ObservationKind()
{
  return &unk_18A306E00;
}

void *type metadata accessor for ObservationRegistrar.ValuesObserver()
{
  return &unk_18A306E28;
}

uint64_t _swift_observation_lock_size()
{
  return 4LL;
}

_DWORD *_swift_observation_lock_init(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

uint64_t _swift_observation_tls_get()
{
  return *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 848);
}

uint64_t _swift_observation_tls_set(uint64_t result)
{
  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 848) = result;
  return result;
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x1896179F8]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x189617C20]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x1896186A8]();
}

uint64_t type metadata accessor for AnyKeyPath()
{
  return MEMORY[0x189618F18]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x189619020]();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return MEMORY[0x189619030]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x189619058]();
}

uint64_t __CocoaSet.count.getter()
{
  return MEMORY[0x189619078]();
}

uint64_t __CocoaSet.member(for:)()
{
  return MEMORY[0x189619080]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x189619098]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x189619188]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x189619190]();
}

uint64_t static _SetStorage.convert(_:capacity:)()
{
  return MEMORY[0x189619198]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x1896191A0]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x189619300]();
}

uint64_t ManagedBuffer.deinit()
{
  return MEMORY[0x189619410]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x1896198A8]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x189619930]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x189619948]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x189619950]();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return MEMORY[0x189619960]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x18961A398]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x18961A3A0]();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return MEMORY[0x18961A678]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x18961A680]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x18961A6C0]();
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

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return MEMORY[0x18961B0A0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x18961B0B8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x18961B0E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x18961B118]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x18961B120]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x18961B158]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x18961B1E8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x18961B228]();
}

uint64_t swift_getCanonicalSpecializedMetadata()
{
  return MEMORY[0x18961B240]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x18961B330]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x18961B390]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x18961B3D0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x18961B3E8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x18961B410]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x18961B418]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x18961B420]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}