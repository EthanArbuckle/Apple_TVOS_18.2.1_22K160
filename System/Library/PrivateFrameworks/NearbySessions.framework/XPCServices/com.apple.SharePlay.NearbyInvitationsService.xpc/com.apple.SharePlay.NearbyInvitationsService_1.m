void NearbyGroupHostIDSService.init()()
{
  _swift_stdlib_reportUnimplementedInitializer( "com_apple_SharePlay_NearbyInvitationsService.NearbyGroupHostIDSService",  70LL,  "init()",  6LL,  0LL);
  __break(1u);
}

id NearbyGroupHostIDSService.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NearbyGroupHostIDSService();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void *NearbyGroupHostIDSService.MessageContext.voucher.getter(void *a1)
{
  id v2 = a1;
  return a1;
}

uint64_t NearbyGroupHostIDSService.MessageEvent.Member.token.getter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a3;
}

void NearbyGroupHostIDSService.MessageEvent.Member.hash(into:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(a5);
    String.hash(into:)(a1, a4, a5);
    swift_bridgeObjectRelease(a5);
  }

  else
  {
    Hasher._combine(_:)(0);
  }

Swift::Int NearbyGroupHostIDSService.MessageEvent.Member.hashValue.getter( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(a4);
    String.hash(into:)(v9, a3, a4);
    swift_bridgeObjectRelease(a4);
  }

  else
  {
    Hasher._combine(_:)(0);
  }

  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance NearbyGroupHostIDSService.MessageEvent.Member()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  uint64_t v4 = v0[2];
  uint64_t v3 = v0[3];
  Hasher.init(_seed:)(v6, 0LL);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v6, v1, v2);
  swift_bridgeObjectRelease(v2);
  if (v3)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v3);
    String.hash(into:)(v6, v4, v3);
    swift_bridgeObjectRelease(v3);
  }

  else
  {
    Hasher._combine(_:)(0);
  }

  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance NearbyGroupHostIDSService.MessageEvent.Member( uint64_t a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  if (v5)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v5);
    String.hash(into:)(a1, v6, v5);
    swift_bridgeObjectRelease(v5);
  }

  else
  {
    Hasher._combine(_:)(0);
  }

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance NearbyGroupHostIDSService.MessageEvent.Member( uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v4 = v1[3];
  Hasher.init(_seed:)(v7, a1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v7, v2, v3);
  swift_bridgeObjectRelease(v3);
  if (v4)
  {
    Hasher._combine(_:)(1u);
    swift_bridgeObjectRetain(v4);
    String.hash(into:)(v7, v5, v4);
    swift_bridgeObjectRelease(v4);
  }

  else
  {
    Hasher._combine(_:)(0);
  }

  return Hasher._finalize()();
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance NearbyGroupHostIDSService.MessageEvent.Member( uint64_t *a1, uint64_t *a2)
{
  return specialized static NearbyGroupHostIDSService.MessageEvent.Member.__derived_struct_equals(_:_:)( *a1,  a1[1],  a1[2],  a1[3],  *a2,  a2[1],  a2[2],  a2[3]);
}

double NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization.members.getter()
{
  uint64_t v1 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(0LL);
  *(void *)&double result = swift_bridgeObjectRetain(*(void *)(v0 + *(int *)(v1 + 20))).n128_u64[0];
  return result;
}

uint64_t NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization.members.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(0LL) + 20);
  uint64_t result = swift_bridgeObjectRelease(*(void *)(v1 + v3));
  *(void *)(v1 + v3) = a1;
  return result;
}

void (__swiftcall *NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization.members.modify())()
{
  return Log.init();
}

uint64_t NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization.init(id:members:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a3, a1, v6);
  uint64_t result = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(0LL);
  *(void *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization.id.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16LL))(a1, v1, v3);
}

uint64_t NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization.id.setter(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 40LL))(v1, a1, v3);
}

uint64_t NearbyGroupHostIDSService.MessageEvent.MembershipMutation.fromHandle.getter()
{
  uint64_t v1 = (uint64_t *)(v0
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain(v1[1]);
  return v2;
}

uint64_t NearbyGroupHostIDSService.MessageEvent.MembershipMutation.fromHandle.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2
                + *(int *)(type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL) + 20));
  uint64_t result = swift_bridgeObjectRelease(v5[1]);
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

void (__swiftcall *NearbyGroupHostIDSService.MessageEvent.MembershipMutation.fromHandle.modify())()
{
  return Log.init();
}

uint64_t NearbyGroupHostIDSService.MessageEvent.MembershipMutation.operation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL) + 24);
  return outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v3, a1);
}

uint64_t NearbyGroupHostIDSService.MessageEvent.MembershipMutation.operation.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL) + 24);
  return outlined assign with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(a1, v3);
}

void (__swiftcall *NearbyGroupHostIDSService.MessageEvent.MembershipMutation.operation.modify())()
{
  return Log.init();
}

uint64_t NearbyGroupHostIDSService.MessageEvent.MembershipMutation.init(id:fromHandle:operation:)@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32LL))(a5, a1, v10);
  uint64_t v11 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL);
  v12 = (void *)(a5 + *(int *)(v11 + 20));
  void *v12 = a2;
  v12[1] = a3;
  return outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( a4,  a5 + *(int *)(v11 + 24));
}

uint64_t NearbyGroupHostIDSService.MessageEvent.Member.init(_:)(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v4 = (char *)a1 + *(int *)(type metadata accessor for NearbyGroup_Member(0LL) + 24);
  swift_bridgeObjectRetain(*((void *)v4 + 1));
  swift_bridgeObjectRetain(v3);
  outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)a1,  type metadata accessor for NearbyGroup_Member);
  return v2;
}

uint64_t closure #1 in NearbyGroupHostIDSService.distributeGroupInitialization(for:to:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v6, v7);
  v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  uint64_t v11 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
  static Message.with(_:)( partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeGroupInitialization(for:to:),  v14,  v10,  v11);
  uint64_t v12 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  swift_storeEnumTagMultiPayload(v9, v12, 0LL);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 0LL, 1LL, v12);
  return outlined assign with take of NearbyGroup_Group.OneOf_Event?((uint64_t)v9, a1);
}

uint64_t closure #1 in closure #1 in NearbyGroupHostIDSService.distributeGroupInitialization(for:to:)( uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v63 = *(void *)(v6 - 8);
  uint64_t v64 = v6;
  uint64_t v8 = __chkstk_darwin(v6, v7);
  v66 = (uint64_t *)((char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v11 = __chkstk_darwin(v8, v10);
  uint64_t v67 = (uint64_t)&v60 - v12;
  uint64_t v13 = UUID.data.getter(v11);
  uint64_t v15 = v14;
  uint64_t v16 = outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
  *(void *)a1 = v13;
  *(void *)(a1 + 8) = v15;
  uint64_t v61 = a1;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *a2) + 0xB0LL))(v16);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t inited = swift_initStackObject(v18, v72);
  *(_OWORD *)(inited + 16) = xmmword_1000AAE90;
  *(void *)(inited + 32) = a3;
  v68[0] = inited;
  specialized Array._endMutation()(inited);
  uint64_t v20 = v68[0];
  id v21 = a3;
  uint64_t v22 = specialized Set.union<A>(_:)(v20, v17);
  swift_bridgeObjectRelease(v20);
  unint64_t v65 = v22 & 0xC000000000000001LL;
  if ((v22 & 0xC000000000000001LL) != 0)
  {
    if (v22 < 0) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = v22 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v24 = __CocoaSet.count.getter(v23);
    if (v24) {
      goto LABEL_6;
    }
LABEL_12:
    swift_bridgeObjectRelease(v22);
    v29 = &_swiftEmptyArrayStorage;
LABEL_32:
    uint64_t v59 = v61;
    uint64_t result = swift_bridgeObjectRelease(*(void *)(v61 + 16));
    *(void *)(v59 + 16) = v29;
    return result;
  }

  uint64_t v24 = *(void *)(v22 + 16);
  if (!v24) {
    goto LABEL_12;
  }
LABEL_6:
  v73 = &_swiftEmptyArrayStorage;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v24 & ~(v24 >> 63), 0);
  if (v65)
  {
    if (v22 < 0) {
      uint64_t v25 = v22;
    }
    else {
      uint64_t v25 = v22 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t result = __CocoaSet.startIndex.getter(v25);
    unsigned __int8 v28 = 1;
  }

  else
  {
    uint64_t result = specialized _NativeSet.startIndex.getter(v22);
    unsigned __int8 v28 = v30 & 1;
  }

  uint64_t v69 = result;
  uint64_t v70 = v27;
  unsigned __int8 v71 = v28;
  if ((v24 & 0x8000000000000000LL) == 0)
  {
    uint64_t v31 = v22 & 0xFFFFFFFFFFFFFF8LL;
    if (v22 < 0) {
      uint64_t v31 = v22;
    }
    uint64_t v62 = v31;
    do
    {
      while (1)
      {
        uint64_t v38 = v69;
        uint64_t v37 = v70;
        uint64_t v39 = v71;
        uint64_t v40 = v22;
        specialized Set.subscript.getter(v69, v70, v71, v22);
        v42 = v41;
        uint64_t v43 = v64;
        v44 = v66;
        uint64_t v45 = UnknownStorage.init()();
        v46 = (void *)((char *)v44 + *(int *)(v43 + 24));
        uint64_t *v46 = 0LL;
        v46[1] = 0LL;
        void *v44 = NearbyGroupMember.handle.getter(v45);
        v44[1] = v47;
        uint64_t v48 = NearbyGroupMember.tokenID.getter();
        uint64_t v50 = v49;

        if (v50)
        {
          uint64_t *v46 = v48;
          v46[1] = v50;
        }

        outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v66,  v67,  type metadata accessor for NearbyGroup_Member);
        v51 = v73;
        if ((swift_isUniquelyReferenced_nonNull_native(v73) & 1) == 0)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( 0,  v51[2] + 1LL,  1);
          v51 = v73;
        }

        uint64_t v22 = v40;
        unint64_t v53 = v51[2];
        unint64_t v52 = v51[3];
        if (v53 >= v52 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v52 > 1,  v53 + 1,  1);
          v51 = v73;
        }

        v51[2] = v53 + 1;
        uint64_t result = outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v67,  (uint64_t)v51 + ((*(unsigned __int8 *)(v63 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80))
                 + *(void *)(v63 + 72) * v53,
                   type metadata accessor for NearbyGroup_Member);
        if (v65) {
          break;
        }
        uint64_t v32 = specialized _NativeSet.index(after:)(v38, v37, v39, v40);
        uint64_t v34 = v33;
        char v36 = v35;
        outlined consume of Set<NearbyGroupHostIDSService.MessageEvent.Member>.Index._Variant(v38, v37, v39);
        uint64_t v69 = v32;
        uint64_t v70 = v34;
        unsigned __int8 v71 = v36 & 1;
        if (!--v24) {
          goto LABEL_31;
        }
      }

      if ((v39 & 1) == 0) {
        goto LABEL_34;
      }
      uint64_t v54 = __CocoaSet.Index.handleBitPattern.getter(v38, v37);
      if (v54) {
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v54);
      }
      else {
        uint64_t isUniquelyReferenced_nonNull_native = 1LL;
      }
      uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<NearbyGroupMember>.Index);
      v57 = (void (*)(void *, void))Set.Index._asCocoa.modify(v68, v56);
      __CocoaSet.formIndex(after:isUnique:)(v58, isUniquelyReferenced_nonNull_native, v62);
      v57(v68, 0LL);
      --v24;
    }

    while (v24);
LABEL_31:
    outlined consume of Set<NearbyGroupHostIDSService.MessageEvent.Member>.Index._Variant(v69, v70, v71);
    swift_bridgeObjectRelease(v40);
    v29 = v73;
    goto LABEL_32;
  }

  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

void NearbyGroup_Member.init(member:)(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v4 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v5 = UnknownStorage.init()(v4);
  uint64_t v6 = (void *)((char *)a2 + *(int *)(v4 + 24));
  *uint64_t v6 = 0LL;
  v6[1] = 0LL;
  *a2 = NearbyGroupMember.handle.getter(v5);
  a2[1] = v7;
  uint64_t v8 = NearbyGroupMember.tokenID.getter();
  uint64_t v10 = v9;

  if (v10)
  {
    *uint64_t v6 = v8;
    v6[1] = v10;
  }

uint64_t specialized _dictionaryUpCast<A, B, C, D>(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)(v2);
  }

  else
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
  }

  uint64_t v31 = a1 + 64;
  uint64_t v4 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v4 < 64) {
    uint64_t v5 = ~(-1LL << -(char)v4);
  }
  else {
    uint64_t v5 = -1LL;
  }
  unint64_t v6 = v5 & *(void *)(a1 + 64);
  int64_t v30 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain();
  int64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }

    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v14 >= v30) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v31 + 8 * v14);
    int64_t v16 = v9 + 1;
    if (!v15)
    {
      int64_t v16 = v9 + 2;
      if (v9 + 2 >= v30) {
        goto LABEL_37;
      }
      unint64_t v15 = *(void *)(v31 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v9 + 3;
        if (v9 + 3 >= v30) {
          goto LABEL_37;
        }
        unint64_t v15 = *(void *)(v31 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v9 + 4;
          if (v9 + 4 >= v30) {
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v31 + 8 * v16);
          if (!v15) {
            break;
          }
        }
      }
    }

{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[2];
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<AnyHashable, Any>);
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
  BOOL v28 = (unint64_t)(63 - v4) >> 6;
  uint64_t v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain();
  int64_t v9 = 0LL;
  while (1)
  {
    if (v6)
    {
      unint64_t v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }

    int64_t v14 = v9 + 1;
    if (__OFADD__(v9, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v14 >= v28) {
      goto LABEL_37;
    }
    unint64_t v15 = *(void *)(v29 + 8 * v14);
    int64_t v16 = v9 + 1;
    if (!v15)
    {
      int64_t v16 = v9 + 2;
      if (v9 + 2 >= v28) {
        goto LABEL_37;
      }
      unint64_t v15 = *(void *)(v29 + 8 * v16);
      if (!v15)
      {
        int64_t v16 = v9 + 3;
        if (v9 + 3 >= v28) {
          goto LABEL_37;
        }
        unint64_t v15 = *(void *)(v29 + 8 * v16);
        if (!v15)
        {
          int64_t v16 = v9 + 4;
          if (v9 + 4 >= v28) {
            goto LABEL_37;
          }
          unint64_t v15 = *(void *)(v29 + 8 * v16);
          if (!v15) {
            break;
          }
        }
      }
    }

uint64_t closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v6, v7);
  int64_t v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.MemberAdded(0LL);
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  uint64_t v11 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
  static Message.with(_:)( partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:),  v14,  v10,  v11);
  uint64_t v12 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  swift_storeEnumTagMultiPayload(v9, v12, 1LL);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 0LL, 1LL, v12);
  return outlined assign with take of NearbyGroup_Group.OneOf_Event?((uint64_t)v9, a1);
}

uint64_t closure #1 in NearbyGroupHostIDSService.distributeRemove(for:removingMember:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v6, v7);
  int64_t v9 = &v14[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL);
  uint64_t v15 = a2;
  uint64_t v16 = a3;
  uint64_t v11 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
  static Message.with(_:)( partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeRemove(for:removingMember:),  v14,  v10,  v11);
  uint64_t v12 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  swift_storeEnumTagMultiPayload(v9, v12, 2LL);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))(v9, 0LL, 1LL, v12);
  return outlined assign with take of NearbyGroup_Group.OneOf_Event?((uint64_t)v9, a1);
}

uint64_t closure #1 in closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)( uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void))
{
  uint64_t v29 = a4;
  uint64_t v6 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (uint64_t *)((char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v13 = __chkstk_darwin(v9, v12);
  uint64_t v15 = (char *)&v28 - v14;
  uint64_t v16 = UUID.data.getter(v13);
  uint64_t v18 = v17;
  outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
  *(void *)a1 = v16;
  *(void *)(a1 + 8) = v18;
  id v19 = a3;
  uint64_t v20 = UnknownStorage.init()();
  id v21 = (void *)((char *)v11 + *(int *)(v6 + 24));
  *id v21 = 0LL;
  v21[1] = 0LL;
  *uint64_t v11 = NearbyGroupMember.handle.getter(v20);
  v11[1] = v22;
  uint64_t v23 = NearbyGroupMember.tokenID.getter();
  uint64_t v25 = v24;

  if (v25)
  {
    *id v21 = v23;
    v21[1] = v25;
  }

  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v11,  (uint64_t)v15,  type metadata accessor for NearbyGroup_Member);
  uint64_t v26 = a1 + *(int *)(v29(0LL) + 24);
  outlined destroy of Any?(v26, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v15,  v26,  type metadata accessor for NearbyGroup_Member);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v26, 0LL, 1LL, v6);
}

uint64_t closure #1 in NearbyGroupHostIDSService.distributeLeave(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
  uint64_t v13 = a2;
  uint64_t v9 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
  static Message.with(_:)( partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeLeave(for:),  v12,  v8,  v9);
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  swift_storeEnumTagMultiPayload(v7, v10, 3LL);
  (*(void (**)(_BYTE *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL))(v7, 0LL, 1LL, v10);
  return outlined assign with take of NearbyGroup_Group.OneOf_Event?((uint64_t)v7, a1);
}

void NearbyGroupHostIDSService.service(_:account:incomingData:fromID:context:)( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
}

void NearbyGroupHostIDSService.handleIncomingData(from:data:context:)( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v138 = a3;
  unint64_t v139 = a4;
  uint64_t v141 = a1;
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
  __chkstk_darwin(v8, v9);
  v131 = (char *)v120 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL);
  __chkstk_darwin(v11, v12);
  v124 = (char *)v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = type metadata accessor for NearbyGroup_Group.MemberAdded(0LL);
  __chkstk_darwin(v14, v15);
  v123 = (char *)v120 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
  __chkstk_darwin(v17, v18);
  v122 = (char *)v120 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v20, v21);
  uint64_t v135 = (uint64_t)v120 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for NearbyGroup_Group?);
  uint64_t v25 = __chkstk_darwin(v23, v24);
  uint64_t v129 = (uint64_t)v120 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v25, v27);
  uint64_t v134 = (uint64_t)v120 - v28;
  uint64_t v29 = type metadata accessor for BinaryDecodingOptions(0LL);
  __chkstk_darwin(v29, v30);
  v137 = (char *)v120 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v140 = type metadata accessor for NearbyGroup_Group(0LL);
  uint64_t v128 = *(void *)(v140 - 8);
  uint64_t v33 = __chkstk_darwin(v140, v32);
  uint64_t v35 = __chkstk_darwin(v33, v34);
  uint64_t v130 = (uint64_t)v120 - v36;
  uint64_t v38 = __chkstk_darwin(v35, v37);
  uint64_t v125 = (uint64_t)v120 - v39;
  uint64_t v41 = __chkstk_darwin(v38, v40);
  uint64_t v126 = (uint64_t)v120 - v42;
  uint64_t v44 = __chkstk_darwin(v41, v43);
  uint64_t v142 = (uint64_t)v120 - v45;
  uint64_t v47 = __chkstk_darwin(v44, v46);
  v136 = (char *)v120 - v48;
  __chkstk_darwin(v47, v49);
  v51 = (char *)v120 - v50;
  uint64_t v52 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v53 = *(void *)(v52 - 8);
  __chkstk_darwin(v52, v54);
  uint64_t v56 = (void *)((char *)v120 - ((v55 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v127 = v5;
  v57 = *(void **)(v5 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_queue);
  *uint64_t v56 = v57;
  (*(void (**)(void *, void, uint64_t))(v53 + 104))(v56, enum case for DispatchPredicate.onQueue(_:), v52);
  id v58 = v57;
  LOBYTE(v57) = _dispatchPreconditionTest(_:)(v56);
  (*(void (**)(void *, uint64_t))(v53 + 8))(v56, v52);
  if ((v57 & 1) != 0)
  {
    if (one-time initialization token for host == -1) {
      goto LABEL_3;
    }
  }

  else
  {
    __break(1u);
  }

  swift_once(&one-time initialization token for host, one-time initialization function for host);
LABEL_3:
  uint64_t v59 = type metadata accessor for Logger(0LL);
  uint64_t v60 = __swift_project_value_buffer(v59, (uint64_t)static Log.host);
  swift_bridgeObjectRetain_n(a2, 2LL);
  id v61 = a5;
  uint64_t v62 = a2;
  id v63 = v61;
  uint64_t v64 = (os_log_s *)Logger.logObject.getter(v61);
  os_log_type_t v65 = static os_log_type_t.info.getter();
  BOOL v66 = os_log_type_enabled(v64, v65);
  uint64_t v133 = v62;
  if (v66)
  {
    uint64_t v67 = swift_slowAlloc(22LL, -1LL);
    v120[1] = v20;
    uint64_t v68 = v67;
    uint64_t v69 = swift_slowAlloc(8LL, -1LL);
    uint64_t v132 = v60;
    uint64_t v70 = (void *)v69;
    v120[0] = swift_slowAlloc(32LL, -1LL);
    uint64_t v143 = v120[0];
    *(_DWORD *)uint64_t v68 = 136315394;
    v121 = v51;
    *(void *)&v145[0] = v141;
    *((void *)&v145[0] + 1) = v62;
    swift_bridgeObjectRetain(v62);
    uint64_t v71 = String.init<A>(reflecting:)(v145, &type metadata for String);
    unint64_t v73 = v72;
    *(void *)&v145[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v71, v72, &v143);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v145, (char *)v145 + 8, v68 + 4, v68 + 12);
    swift_bridgeObjectRelease_n(v62, 2LL);
    swift_bridgeObjectRelease(v73);
    *(_WORD *)(v68 + 12) = 2112;
    *(void *)&v145[0] = v63;
    id v74 = v63;
    v51 = v121;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v145, (char *)v145 + 8, v68 + 14, v68 + 22);
    *uint64_t v70 = v63;

    _os_log_impl( (void *)&_mh_execute_header,  v64,  v65,  "Handling incoming data from: %s context: %@",  (uint8_t *)v68,  0x16u);
    uint64_t v75 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v70, 1LL, v75);
    v76 = v70;
    uint64_t v60 = v132;
    swift_slowDealloc(v76, -1LL, -1LL);
    uint64_t v77 = v120[0];
    swift_arrayDestroy(v120[0], 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v77, -1LL, -1LL);
    swift_slowDealloc(v68, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v62, 2LL);
  }

  uint64_t v78 = v142;
  id v79 = [v63 publicIntentAction];
  if (v79)
  {
    v80 = v79;
    id v81 = [v79 integerValue];

    if (v81 == (id)5)
    {
      uint64_t v146 = 0LL;
      memset(v145, 0, sizeof(v145));
      uint64_t v83 = v138;
      unint64_t v82 = v139;
      uint64_t v84 = outlined copy of Data._Representation(v138, v139);
      v85 = v137;
      BinaryDecodingOptions.init()(v84);
      uint64_t v86 = lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group,  type metadata accessor for NearbyGroup_Group,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group);
      uint64_t v87 = (uint64_t)v136;
      Message.init(serializedData:extensions:partial:options:)(v83, v82, v145, 0LL, v85, v140, v86);
      unint64_t v139 = v86;
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v87,  (uint64_t)v51,  type metadata accessor for NearbyGroup_Group);
      uint64_t v88 = outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v51,  v78,  type metadata accessor for NearbyGroup_Group);
      v89 = (os_log_s *)Logger.logObject.getter(v88);
      os_log_type_t v90 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v89, v90))
      {
        uint64_t v132 = v60;
        v91 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v138 = swift_slowAlloc(32LL, -1LL);
        *(void *)&v145[0] = v138;
        *(_DWORD *)v91 = 136315138;
        uint64_t v92 = v78;
        uint64_t v93 = v134;
        outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v92,  v134,  type metadata accessor for NearbyGroup_Group);
        uint64_t v94 = v128;
        uint64_t v95 = v140;
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v128 + 56))(v93, 0LL, 1LL, v140);
        uint64_t v96 = v93;
        uint64_t v97 = v129;
        outlined init with copy of (String, Any)( v96,  v129,  (uint64_t *)&demangling cache variable for type metadata for NearbyGroup_Group?);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v94 + 48))(v97, 1LL, v95) == 1)
        {
          unint64_t v98 = 0xE300000000000000LL;
          uint64_t v99 = 7104878LL;
        }

        else
        {
          uint64_t v100 = v126;
          outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v97,  v126,  type metadata accessor for NearbyGroup_Group);
          uint64_t v101 = v125;
          outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v100,  v125,  type metadata accessor for NearbyGroup_Group);
          uint64_t v99 = String.init<A>(reflecting:)(v101, v95);
          unint64_t v98 = v102;
          outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v100,  type metadata accessor for NearbyGroup_Group);
        }

        outlined destroy of Any?(v134, (uint64_t *)&demangling cache variable for type metadata for NearbyGroup_Group?);
        uint64_t v143 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v99, v98, (uint64_t *)v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v143, &v144, v91 + 4, v91 + 12);
        swift_bridgeObjectRelease(v98);
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v142,  type metadata accessor for NearbyGroup_Group);
        _os_log_impl((void *)&_mh_execute_header, v89, v90, "Message: %s", v91, 0xCu);
        uint64_t v103 = v138;
        swift_arrayDestroy(v138, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v103, -1LL, -1LL);
        swift_slowDealloc(v91, -1LL, -1LL);
      }

      else
      {
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v78,  type metadata accessor for NearbyGroup_Group);
      }

      uint64_t v104 = v135;
      outlined init with copy of (String, Any)( (uint64_t)v51,  v135,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
      uint64_t v105 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
      int v106 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v105 - 8) + 48LL))(v104, 1LL, v105);
      unint64_t v107 = v139;
      if (v106 != 1)
      {
        v119 = (char *)&loc_100087540
             + *((int *)qword_1000878C0 + swift_getEnumCaseMultiPayload(v104, v105));
        __asm { BR              X10 }
      }

      uint64_t v108 = v130;
      uint64_t v109 = outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v51,  v130,  type metadata accessor for NearbyGroup_Group);
      v110 = (os_log_s *)Logger.logObject.getter(v109);
      os_log_type_t v113 = static os_log_type_t.error.getter(v110, v111, v112);
      if (os_log_type_enabled(v110, v113))
      {
        v114 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v115 = swift_slowAlloc(32LL, -1LL);
        *(void *)&v145[0] = v115;
        *(_DWORD *)v114 = 136315138;
        uint64_t v116 = Message.debugDescription.getter(v140, v107);
        unint64_t v118 = v117;
        uint64_t v143 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v116, v117, (uint64_t *)v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v143, &v144, v114 + 4, v114 + 12);
        swift_bridgeObjectRelease(v118);
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v108,  type metadata accessor for NearbyGroup_Group);
        _os_log_impl((void *)&_mh_execute_header, v110, v113, "Unknown message: %s", v114, 0xCu);
        swift_arrayDestroy(v115, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v115, -1LL, -1LL);
        swift_slowDealloc(v114, -1LL, -1LL);
      }

      else
      {

        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v108,  type metadata accessor for NearbyGroup_Group);
      }

      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v51,  type metadata accessor for NearbyGroup_Group);
    }
  }

uint64_t NearbyGroupHostIDSService.handleInitialize(from:initialization:)( uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v115 = a2;
  uint64_t v116 = a1;
  uint64_t v112 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
  __chkstk_darwin(v112, v5);
  uint64_t v117 = (uint64_t)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v108 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext));
  __chkstk_darwin(v108, v7);
  uint64_t v110 = (uint64_t)&v106 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v107 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent(0LL);
  __chkstk_darwin(v107, v9);
  uint64_t v109 = (char *)&v106 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v119 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v113 = *(void *)(v119 - 8);
  __chkstk_darwin(v119, v11);
  unint64_t v118 = (uint64_t *)((char *)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)&v106 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for UUID(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  v114 = (char *)&v106 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v23);
  uint64_t v25 = (uint64_t *)((char *)&v106 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v111 = v3;
  uint64_t v26 = *(void **)(v3 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_queue);
  *uint64_t v25 = v26;
  (*(void (**)(void *, void, uint64_t))(v22 + 104))(v25, enum case for DispatchPredicate.onQueue(_:), v21);
  id v27 = v26;
  LOBYTE(v26) = _dispatchPreconditionTest(_:)(v25);
  (*(void (**)(void *, uint64_t))(v22 + 8))(v25, v21);
  if ((v26 & 1) == 0)
  {
    __break(1u);
    goto LABEL_55;
  }

  uint64_t v28 = *a3;
  unint64_t v29 = a3[1];
  outlined copy of Data._Representation(*a3, v29);
  UUID.init(data:)(v28, v29);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1LL, v17) == 1)
  {
    outlined destroy of Any?((uint64_t)v16, &demangling cache variable for type metadata for UUID?);
    if (one-time initialization token for host == -1)
    {
LABEL_4:
      uint64_t v30 = type metadata accessor for Logger(0LL);
      __swift_project_value_buffer(v30, (uint64_t)static Log.host);
      uint64_t v31 = v117;
      uint64_t v32 = outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)a3,  v117,  type metadata accessor for NearbyGroup_Group.Initialization);
      uint64_t v33 = (os_log_s *)Logger.logObject.getter(v32);
      os_log_type_t v36 = static os_log_type_t.error.getter(v33, v34, v35);
      if (os_log_type_enabled(v33, v36))
      {
        uint64_t v37 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v38 = swift_slowAlloc(32LL, -1LL);
        uint64_t v122 = v38;
        *(_DWORD *)uint64_t v37 = 136315138;
        uint64_t v39 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
        uint64_t v40 = Message.debugDescription.getter(v112, v39);
        unint64_t v42 = v41;
        uint64_t v120 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v41, &v122);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v37 + 4, v37 + 12);
        swift_bridgeObjectRelease(v42);
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v31,  type metadata accessor for NearbyGroup_Group.Initialization);
        _os_log_impl( (void *)&_mh_execute_header,  v33,  v36,  "Failed to derive UUID from Initialization message: %s",  v37,  0xCu);
        swift_arrayDestroy(v38, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v38, -1LL, -1LL);
        swift_slowDealloc(v37, -1LL, -1LL);
      }

      else
      {
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v31,  type metadata accessor for NearbyGroup_Group.Initialization);
      }

      unint64_t v59 = lazy protocol witness table accessor for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors();
      uint64_t v60 = swift_allocError(&type metadata for NearbyGroupHostIDSService.Errors, v59, 0LL, 0LL);
      *id v61 = 0;
      return swift_willThrow(v60);
    }

LABEL_55:
    swift_once(&one-time initialization token for host, one-time initialization function for host);
    goto LABEL_4;
  }

  uint64_t v43 = v17;
  uint64_t v112 = v18;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v114, v16, v17);
  uint64_t v44 = a3[2];
  uint64_t v45 = *(void *)(v44 + 16);
  if (v45)
  {
    uint64_t v106 = v17;
    uint64_t v46 = v44 + ((*(unsigned __int8 *)(v113 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v113 + 80));
    uint64_t v117 = *(void *)(v113 + 72);
    uint64_t v113 = v44;
    swift_bridgeObjectRetain_n(v44, 2LL);
    uint64_t v47 = _swiftEmptyArrayStorage;
    do
    {
      uint64_t v48 = v118;
      outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v46,  (uint64_t)v118,  type metadata accessor for NearbyGroup_Member);
      uint64_t v49 = (uint64_t *)((char *)v48 + *(int *)(v119 + 24));
      uint64_t v50 = v49[1];
      if (v50)
      {
        uint64_t v51 = *v49;
        unint64_t v52 = v49[1];
      }

      else
      {
        uint64_t v51 = 0LL;
        unint64_t v52 = 0xE000000000000000LL;
      }

      uint64_t v54 = *v48;
      uint64_t v53 = v48[1];
      swift_bridgeObjectRetain(v50);
      swift_bridgeObjectRetain(v53);
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v48,  type metadata accessor for NearbyGroup_Member);
      if ((swift_isUniquelyReferenced_nonNull_native(v47) & 1) == 0) {
        uint64_t v47 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  v47[2] + 1LL,  1,  v47);
      }
      unint64_t v56 = v47[2];
      unint64_t v55 = v47[3];
      if (v56 >= v55 >> 1) {
        uint64_t v47 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (void *)(v55 > 1),  v56 + 1,  1,  v47);
      }
      v47[2] = v56 + 1;
      v57 = &v47[4 * v56];
      v57[4] = v54;
      v57[5] = v53;
      v57[6] = v51;
      v57[7] = v52;
      v46 += v117;
      --v45;
    }

    while (v45);
    id v58 = v47;
    swift_bridgeObjectRelease_n(v113, 2LL);
    uint64_t v43 = v106;
  }

  else
  {
    id v58 = _swiftEmptyArrayStorage;
  }

  unint64_t v63 = v115;
  NSString v64 = String._bridgeToObjectiveC()();
  os_log_type_t v65 = (void *)IDSCopyAddressDestinationForDestination();

  BOOL v66 = (void *)IDSCopyRawAddressForDestination(v65);
  if (!v66) {
    goto LABEL_40;
  }
  uint64_t v67 = static String._unconditionallyBridgeFromObjectiveC(_:)(v66);
  uint64_t v69 = v68;

  if (String.count.getter(v116, v63) <= 0)
  {
    swift_bridgeObjectRelease(v69);
LABEL_40:
    swift_bridgeObjectRelease(v58);
    if (one-time initialization token for host != -1) {
      swift_once(&one-time initialization token for host, one-time initialization function for host);
    }
    uint64_t v78 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v78, (uint64_t)static Log.host);
    uint64_t v79 = swift_bridgeObjectRetain_n(v63, 2LL);
    v80 = (os_log_s *)Logger.logObject.getter(v79);
    os_log_type_t v81 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v80, v81))
    {
      unint64_t v82 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v83 = swift_slowAlloc(32LL, -1LL);
      uint64_t v122 = v83;
      *(_DWORD *)unint64_t v82 = 136315138;
      swift_bridgeObjectRetain(v63);
      uint64_t v120 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v116, v63, &v122);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, &v121, v82 + 4, v82 + 12);
      swift_bridgeObjectRelease_n(v63, 3LL);
      _os_log_impl( (void *)&_mh_execute_header,  v80,  v81,  "Failed to convert ID into Raw IDS Destination: %s",  v82,  0xCu);
      swift_arrayDestroy(v83, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v83, -1LL, -1LL);
      swift_slowDealloc(v82, -1LL, -1LL);
    }

    else
    {
      swift_bridgeObjectRelease_n(v63, 2LL);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v112 + 8))(v114, v43);
  }

  uint64_t v70 = v58[2];
  if (v70)
  {
    uint64_t v71 = v58 + 7;
    while (1)
    {
      uint64_t v72 = *(v71 - 3);
      uint64_t v73 = *(v71 - 2);
      uint64_t v74 = *(v71 - 1);
      uint64_t v75 = *v71;
      BOOL v76 = v72 == v67 && v73 == v69;
      if (v76 || (_stringCompareWithSmolCheck(_:_:expecting:)(v72, v73, v67, v69, 0LL) & 1) != 0)
      {
        if (!v75) {
          goto LABEL_46;
        }
      }

      else if (!v75)
      {
        goto LABEL_35;
      }

      BOOL v77 = v74 == v116 && v75 == v115;
      if (v77 || (_stringCompareWithSmolCheck(_:_:expecting:)(v74, v75, v116, v115, 0LL) & 1) != 0)
      {
LABEL_46:
        swift_bridgeObjectRelease(v69);
        uint64_t v84 = v112;
        uint64_t v85 = (uint64_t)v109;
        uint64_t v86 = v114;
        (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v109, v114, v43);
        uint64_t v87 = specialized Set.init<A>(_:)((uint64_t)v58);
        swift_bridgeObjectRelease(v58);
        *(void *)(v85
        uint64_t v88 = swift_storeEnumTagMultiPayload(v85, v107, 0LL);
        v89 = (void *)voucher_copy(v88);
        uint64_t v90 = v110;
        uint64_t v91 = *(void *)(v111
                        + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService__incomingMessages);
        uint64_t v92 = *(int *)(v108 + 48);
        outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v85,  v110,  type metadata accessor for NearbyGroupHostIDSService.MessageEvent);
        *(void *)(v90 + v92) = v89;
        swift_retain();
        id v93 = v89;
        PassthroughSubject.send(_:)(v90);

        swift_release(v91);
        outlined destroy of Any?( v90,  (uint64_t *)&demangling cache variable for type metadata for (NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext));
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v85,  type metadata accessor for NearbyGroupHostIDSService.MessageEvent);
        return (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v86, v43);
      }

uint64_t NearbyGroupHostIDSService.handleMemberAdded(from:addedMember:)(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return NearbyGroupHostIDSService.handleMemberAdded(from:addedMember:)( a1,  a2,  a3,  type metadata accessor for NearbyGroup_Group.MemberAdded,  0,  &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
}

uint64_t NearbyGroupHostIDSService.handleMemberRemoved(from:removedMember:)( uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return NearbyGroupHostIDSService.handleMemberAdded(from:addedMember:)( a1,  a2,  a3,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  1,  &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
}

uint64_t NearbyGroupHostIDSService.handleMemberAdded(from:addedMember:)( uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t), int a5, unint64_t *a6, uint64_t a7)
{
  unint64_t v82 = a6;
  uint64_t v83 = a7;
  int v91 = a5;
  uint64_t v93 = a2;
  uint64_t v94 = a4;
  uint64_t v88 = a1;
  uint64_t v97 = a4(0LL);
  __chkstk_darwin(v97, v9);
  uint64_t v90 = (uint64_t)&v80 - v10;
  uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext));
  __chkstk_darwin(v89, v11);
  uint64_t v95 = (uint64_t)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v87 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent(0LL);
  __chkstk_darwin(v87, v13);
  uint64_t v92 = (char *)&v80 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  __chkstk_darwin(v15, v16);
  uint64_t v85 = (uint64_t)&v80 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v86 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v84 = *(void *)(v86 - 8);
  __chkstk_darwin(v86, v18);
  uint64_t v20 = (uint64_t *)((char *)&v80 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  __chkstk_darwin(v21, v22);
  uint64_t v24 = (char *)&v80 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v25 = (uint64_t (*)(void))type metadata accessor for UUID(0LL);
  uint64_t v26 = *((void *)v25 - 1);
  __chkstk_darwin(v25, v27);
  uint64_t v98 = (char *)&v80 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v29 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v30 = *(void *)(v29 - 8);
  __chkstk_darwin(v29, v31);
  uint64_t v33 = (uint64_t *)((char *)&v80 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v96 = v7;
  uint64_t v34 = *(void **)(v7 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_queue);
  *uint64_t v33 = v34;
  (*(void (**)(void *, void, uint64_t))(v30 + 104))(v33, enum case for DispatchPredicate.onQueue(_:), v29);
  id v35 = v34;
  LOBYTE(v34) = _dispatchPreconditionTest(_:)(v33);
  (*(void (**)(void *, uint64_t))(v30 + 8))(v33, v29);
  if ((v34 & 1) == 0)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v36 = *a3;
  unint64_t v37 = a3[1];
  outlined copy of Data._Representation(*a3, v37);
  UUID.init(data:)(v36, v37);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t (*)(void)))(v26 + 48))(v24, 1LL, v25) == 1)
  {
    outlined destroy of Any?((uint64_t)v24, &demangling cache variable for type metadata for UUID?);
    if (one-time initialization token for host == -1)
    {
LABEL_4:
      uint64_t v38 = type metadata accessor for Logger(0LL);
      __swift_project_value_buffer(v38, (uint64_t)static Log.host);
      uint64_t v39 = v90;
      uint64_t v40 = v94;
      uint64_t v41 = outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation((uint64_t)a3, v90, v94);
      unint64_t v42 = (os_log_s *)Logger.logObject.getter(v41);
      os_log_type_t v45 = static os_log_type_t.error.getter(v42, v43, v44);
      if (os_log_type_enabled(v42, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v47 = swift_slowAlloc(32LL, -1LL);
        uint64_t v101 = v47;
        *(_DWORD *)uint64_t v46 = 136315138;
        uint64_t v48 = lazy protocol witness table accessor for type UUID and conformance UUID(v82, v40, v83);
        uint64_t v49 = Message.debugDescription.getter(v97, v48);
        unint64_t v51 = v50;
        uint64_t v99 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v50, &v101);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v99, &v100, v46 + 4, v46 + 12);
        swift_bridgeObjectRelease(v51);
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(v39, v40);
        _os_log_impl( (void *)&_mh_execute_header,  v42,  v45,  "Failed to derive UUID from member added message: %s",  v46,  0xCu);
        swift_arrayDestroy(v47, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v47, -1LL, -1LL);
        swift_slowDealloc(v46, -1LL, -1LL);
      }

      else
      {
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(v39, v40);
      }

      unint64_t v57 = lazy protocol witness table accessor for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors();
      uint64_t v58 = swift_allocError(&type metadata for NearbyGroupHostIDSService.Errors, v57, 0LL, 0LL);
      *unint64_t v59 = 0;
      return swift_willThrow(v58);
    }

uint64_t NearbyGroupHostIDSService.handleMemberLeft(from:leftMember:)( uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v93 = a2;
  uint64_t v94 = a1;
  uint64_t v91 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
  __chkstk_darwin(v91, v5);
  uint64_t v92 = (uint64_t)&v84 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext));
  __chkstk_darwin(v87, v7);
  uint64_t v89 = (uint64_t)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v86 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent(0LL);
  __chkstk_darwin(v86, v9);
  uint64_t v88 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for UUID(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v95 = (char *)&v84 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19, v21);
  uint64_t v23 = (uint64_t *)((char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v90 = v3;
  uint64_t v24 = *(void **)(v3 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_queue);
  *uint64_t v23 = v24;
  (*(void (**)(void *, void, uint64_t))(v20 + 104))(v23, enum case for DispatchPredicate.onQueue(_:), v19);
  id v25 = v24;
  LOBYTE(v24) = _dispatchPreconditionTest(_:)(v23);
  (*(void (**)(void *, uint64_t))(v20 + 8))(v23, v19);
  if ((v24 & 1) == 0)
  {
    __break(1u);
    goto LABEL_21;
  }

  uint64_t v26 = *a3;
  unint64_t v27 = a3[1];
  outlined copy of Data._Representation(*a3, v27);
  UUID.init(data:)(v26, v27);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1LL, v15) == 1)
  {
    outlined destroy of Any?((uint64_t)v14, &demangling cache variable for type metadata for UUID?);
    if (one-time initialization token for host == -1)
    {
LABEL_4:
      uint64_t v28 = type metadata accessor for Logger(0LL);
      __swift_project_value_buffer(v28, (uint64_t)static Log.host);
      uint64_t v29 = (uint64_t)a3;
      uint64_t v30 = v92;
      uint64_t v31 = outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v29,  v92,  type metadata accessor for NearbyGroup_Group.MemberLeft);
      uint64_t v32 = (os_log_s *)Logger.logObject.getter(v31);
      os_log_type_t v35 = static os_log_type_t.error.getter(v32, v33, v34);
      if (os_log_type_enabled(v32, v35))
      {
        uint64_t v36 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
        uint64_t v37 = swift_slowAlloc(32LL, -1LL);
        uint64_t v98 = v37;
        *(_DWORD *)uint64_t v36 = 136315138;
        uint64_t v38 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
        uint64_t v39 = Message.debugDescription.getter(v91, v38);
        unint64_t v41 = v40;
        uint64_t v96 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, &v98);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v36 + 4, v36 + 12);
        swift_bridgeObjectRelease(v41);
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v30,  type metadata accessor for NearbyGroup_Group.MemberLeft);
        _os_log_impl( (void *)&_mh_execute_header,  v32,  v35,  "Failed to derive UUID from member left message: %s",  v36,  0xCu);
        swift_arrayDestroy(v37, 1LL, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v37, -1LL, -1LL);
        swift_slowDealloc(v36, -1LL, -1LL);
      }

      else
      {
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v30,  type metadata accessor for NearbyGroup_Group.MemberLeft);
      }

      unint64_t v59 = lazy protocol witness table accessor for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors();
      uint64_t v60 = swift_allocError(&type metadata for NearbyGroupHostIDSService.Errors, v59, 0LL, 0LL);
      *uint64_t v61 = 0;
      return swift_willThrow(v60);
    }

LABEL_21:
    swift_once(&one-time initialization token for host, one-time initialization function for host);
    goto LABEL_4;
  }

  uint64_t v42 = v15;
  uint64_t v43 = v16;
  uint64_t v44 = a3;
  (*(void (**)(char *, char *, uint64_t))(v43 + 32))(v95, v14, v15);
  unint64_t v45 = v93;
  uint64_t v46 = v94;
  NSString v47 = String._bridgeToObjectiveC()();
  uint64_t v48 = (void *)IDSCopyAddressDestinationForDestination();

  uint64_t v49 = (void *)IDSCopyRawAddressForDestination(v48);
  if (v49)
  {
    uint64_t v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
    uint64_t v52 = v51;

    if (String.count.getter(v46, v45) >= 1)
    {
      uint64_t v92 = v50;
      uint64_t v54 = v43;
      if (*((_BYTE *)v44 + 16) == 1)
      {
        __n128 v53 = swift_bridgeObjectRetain(v45);
        uint64_t v55 = v94;
        uint64_t v56 = v94;
        unint64_t v57 = v45;
        unint64_t v58 = v45;
      }

      else
      {
        uint64_t v56 = 0LL;
        unint64_t v57 = 0LL;
        unint64_t v58 = v45;
        uint64_t v55 = v94;
      }

      uint64_t v85 = v54;
      uint64_t v71 = *(void (**)(char *, char *, uint64_t, __n128))(v54 + 16);
      uint64_t v72 = (uint64_t)v88;
      uint64_t v73 = v95;
      v71(v88, v95, v42, v53);
      uint64_t v74 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL);
      uint64_t v75 = (uint64_t *)(v72 + *(int *)(v74 + 20));
      *uint64_t v75 = v55;
      v75[1] = v58;
      uint64_t v76 = v72 + *(int *)(v74 + 24);
      *(void *)uint64_t v76 = v92;
      *(void *)(v76 + 8) = v52;
      *(void *)(v76 + 16) = v56;
      *(void *)(v76 + 24) = v57;
      *(_BYTE *)(v76 + 32) = 1;
      swift_storeEnumTagMultiPayload(v72, v86, 1LL);
      swift_bridgeObjectRetain(v58);
      uint64_t v78 = (void *)voucher_copy(v77);
      uint64_t v79 = v89;
      uint64_t v80 = *(void *)(v90
                      + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService__incomingMessages);
      uint64_t v81 = v42;
      uint64_t v82 = *(int *)(v87 + 48);
      outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v72,  v89,  type metadata accessor for NearbyGroupHostIDSService.MessageEvent);
      *(void *)(v79 + v82) = v78;
      swift_retain();
      id v83 = v78;
      PassthroughSubject.send(_:)(v79);

      swift_release(v80);
      outlined destroy of Any?( v79,  (uint64_t *)&demangling cache variable for type metadata for (NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext));
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v72,  type metadata accessor for NearbyGroupHostIDSService.MessageEvent);
      return (*(uint64_t (**)(char *, uint64_t))(v85 + 8))(v73, v81);
    }

    swift_bridgeObjectRelease(v52);
  }

  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v63 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v63, (uint64_t)static Log.host);
  uint64_t v64 = swift_bridgeObjectRetain_n(v45, 2LL);
  uint64_t v65 = (os_log_s *)Logger.logObject.getter(v64);
  os_log_type_t v66 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v65, v66))
  {
    uint64_t v92 = v42;
    uint64_t v67 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v68 = v46;
    uint64_t v69 = v43;
    uint64_t v70 = swift_slowAlloc(32LL, -1LL);
    uint64_t v98 = v70;
    *(_DWORD *)uint64_t v67 = 136315138;
    swift_bridgeObjectRetain(v45);
    uint64_t v96 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v68, v45, &v98);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v96, &v97, v67 + 4, v67 + 12);
    swift_bridgeObjectRelease_n(v45, 3LL);
    _os_log_impl((void *)&_mh_execute_header, v65, v66, "Failed to convert ID into Raw IDS Destination: %s", v67, 0xCu);
    swift_arrayDestroy(v70, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v70, -1LL, -1LL);
    swift_slowDealloc(v67, -1LL, -1LL);

    return (*(uint64_t (**)(char *, uint64_t))(v69 + 8))(v95, v92);
  }

  else
  {
    swift_bridgeObjectRelease_n(v45, 2LL);

    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v95, v42);
  }

      uint64_t v5 = v38;
      goto LABEL_26;
    }

LABEL_23:
    uint64_t v30 = a1[v21];
    a1[v21] = v30 & ~v22;
    uint64_t v5 = v38;
    if ((v22 & v30) != 0)
    {
      uint64_t v31 = v37 - 1;
      if (__OFSUB__(v37, 1LL)) {
        goto LABEL_39;
      }
      --v37;
      if (!v31) {
        return;
      }
    }

id IDSService.account(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  id result = [v3 accounts];
  if (result)
  {
    uint64_t v7 = result;
    uint64_t v8 = type metadata accessor for OS_dispatch_queue( 0LL,  &lazy cache variable for type metadata for IDSAccount,  &OBJC_CLASS___IDSAccount_ptr);
    unint64_t v9 = lazy protocol witness table accessor for type IDSAccount and conformance NSObject();
    uint64_t v10 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v7, v8, v9);

    swift_bridgeObjectRetain(a2);
    specialized Sequence.first(where:)(v10, a1, a2);
    uint64_t v12 = v11;
    swift_bridgeObjectRelease(v10);
    swift_bridgeObjectRelease(a2);
    return (id)v12;
  }

  else
  {
    __break(1u);
  }

  return result;
}

void closure #1 in IDSService.account(for:)(id *a1, uint64_t a2, uint64_t a3)
{
  id v5 = *a1;
  id v6 = [*a1 pseudonyms];
  if (!v6) {
    goto LABEL_25;
  }
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for OS_dispatch_queue( 0LL,  (unint64_t *)&lazy cache variable for type metadata for IDSPseudonym,  &OBJC_CLASS___IDSPseudonym_ptr);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v8);

  uint64_t v29 = a3;
  if (!((unint64_t)v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10);
    swift_bridgeObjectRetain(v9);
    id v28 = v5;
    if (v10) {
      goto LABEL_4;
    }
LABEL_19:
    uint64_t v12 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_20;
  }

  if (v9 < 0) {
    uint64_t v23 = v9;
  }
  else {
    uint64_t v23 = v9 & 0xFFFFFFFFFFFFFF8LL;
  }
  swift_bridgeObjectRetain(v9);
  uint64_t v10 = _CocoaArrayWrapper.endIndex.getter(v23);
  id v28 = v5;
  if (!v10) {
    goto LABEL_19;
  }
LABEL_4:
  if (v10 < 1)
  {
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }

  uint64_t v11 = 0LL;
  uint64_t v12 = (char *)_swiftEmptyArrayStorage;
  do
  {
    if ((v9 & 0xC000000000000001LL) != 0) {
      id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v9);
    }
    else {
      id v13 = *(id *)(v9 + 8 * v11 + 32);
    }
    uint64_t v14 = v13;
    id v15 = [v13 URI];
    id v16 = [v15 prefixedURI];

    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
    uint64_t v19 = v18;

    if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) == 0) {
      uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( 0LL,  *((void *)v12 + 2) + 1LL,  1,  v12);
    }
    unint64_t v21 = *((void *)v12 + 2);
    unint64_t v20 = *((void *)v12 + 3);
    if (v21 >= v20 >> 1) {
      uint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( (char *)(v20 > 1),  v21 + 1,  1,  v12);
    }
    ++v11;
    *((void *)v12 + 2) = v21 + 1;
    uint64_t v22 = &v12[16 * v21];
    *((void *)v22 + 4) = v17;
    *((void *)v22 + 5) = v19;
  }

  while (v10 != v11);
LABEL_20:
  swift_bridgeObjectRelease_n(v9, 2LL);
  char v24 = specialized Sequence<>.contains(_:)(a2, v29, v12);
  swift_bridgeObjectRelease(v12);
  if ((v24 & 1) != 0) {
    return;
  }
  id v25 = [v28 aliasStrings];
  if (!v25)
  {
LABEL_26:
    __break(1u);
    return;
  }

  uint64_t v26 = v25;
  unint64_t v27 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v25, &type metadata for String);

  specialized Sequence<>.contains(_:)(a2, v29, v27);
  swift_bridgeObjectRelease(v27);
}

id protocol witness for IDSServiceProtocol.account(for:) in conformance IDSService(uint64_t a1, uint64_t a2)
{
  id result = [*v2 accounts];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = type metadata accessor for OS_dispatch_queue( 0LL,  &lazy cache variable for type metadata for IDSAccount,  &OBJC_CLASS___IDSAccount_ptr);
    unint64_t v8 = lazy protocol witness table accessor for type IDSAccount and conformance NSObject();
    uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v6, v7, v8);

    swift_bridgeObjectRetain(a2);
    specialized Sequence.first(where:)(v9, a1, a2);
    uint64_t v11 = v10;
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(a2);
    return (id)v11;
  }

  else
  {
    __break(1u);
  }

  return result;
}

uint64_t partial apply for closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)( uint64_t a1)
{
  return closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24));
}

Swift::Int specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<NearbyGroupMember>);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v23 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = type metadata accessor for NearbyGroupMember(0LL);
      do
      {
        uint64_t v21 = v7;
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v23;
        unint64_t v16 = *(void *)(v23 + 16);
        if (*(void *)(v23 + 24) <= v16)
        {
          specialized _NativeSet.resize(capacity:)(v16 + 1);
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
        uint64_t v7 = __CocoaSet.Iterator.next()(result);
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

uint64_t specialized _NativeSet.init(_:capacity:)(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyCancellable>);
    uint64_t v4 = static _SetStorage.convert(_:capacity:)(a1, a2);
    uint64_t v25 = v4;
    uint64_t v5 = __CocoaSet.makeIterator()(a1);
    uint64_t v6 = __CocoaSet.Iterator.next()(v5);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = type metadata accessor for AnyCancellable(0LL);
      do
      {
        uint64_t v23 = v7;
        swift_dynamicCast(&v24, &v23, (char *)&type metadata for Swift.AnyObject + 8, v8, 7LL);
        uint64_t v4 = v25;
        unint64_t v18 = *(void *)(v25 + 16);
        if (*(void *)(v25 + 24) <= v18)
        {
          specialized _NativeSet.resize(capacity:)(v18 + 1);
          uint64_t v4 = v25;
        }

        uint64_t v9 = v24;
        uint64_t v23 = v24;
        uint64_t v10 = *(void *)(v4 + 40);
        uint64_t v11 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable,  (uint64_t (*)(uint64_t))&type metadata accessor for AnyCancellable,  (uint64_t)&protocol conformance descriptor for AnyCancellable);
        uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)(v10, v8, v11);
        uint64_t v13 = v4 + 56;
        uint64_t v14 = -1LL << *(_BYTE *)(v4 + 32);
        unint64_t v15 = result & ~v14;
        unint64_t v16 = v15 >> 6;
        if (((-1LL << v15) & ~*(void *)(v4 + 56 + 8 * (v15 >> 6))) != 0)
        {
          unint64_t v17 = __clz(__rbit64((-1LL << v15) & ~*(void *)(v4 + 56 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0LL;
        }

        else
        {
          char v19 = 0;
          unint64_t v20 = (unint64_t)(63 - v14) >> 6;
          do
          {
            if (++v16 == v20 && (v19 & 1) != 0)
            {
              __break(1u);
              return result;
            }

            BOOL v21 = v16 == v20;
            if (v16 == v20) {
              unint64_t v16 = 0LL;
            }
            v19 |= v21;
            uint64_t v22 = *(void *)(v13 + 8 * v16);
          }

          while (v22 == -1);
          unint64_t v17 = __clz(__rbit64(~v22)) + (v16 << 6);
        }

        *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v17;
        *(void *)(*(void *)(v4 + 48) + 8 * v17) = v9;
        ++*(void *)(v4 + 16);
        uint64_t v7 = __CocoaSet.Iterator.next()(result);
      }

      while (v7);
    }

    swift_release(v5);
  }

  else
  {
    swift_unknownObjectRelease(a1);
    return (uint64_t)&_swiftEmptySetSingleton;
  }

  return v4;
}

void *specialized _NativeSet.subtracting<A>(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!*(void *)(a2 + 16))
  {
    swift_release(a2);
    return &_swiftEmptySetSingleton;
  }

  v39[0] = a1;
  unint64_t v37 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
LABEL_30:
    if (a1 < 0) {
      uint64_t v32 = a1;
    }
    else {
      uint64_t v32 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    if (_CocoaArrayWrapper.endIndex.getter(v32)) {
      goto LABEL_4;
    }
LABEL_21:
    swift_bridgeObjectRelease(a1);
    return (void *)v2;
  }

  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFF8LL) + 0x10);
  swift_bridgeObjectRetain(a1);
  if (!v4) {
    goto LABEL_21;
  }
LABEL_4:
  unint64_t v5 = 0LL;
  uint64_t v6 = v2 + 56;
  unint64_t v38 = a1 & 0xC000000000000001LL;
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8LL;
  uint64_t v36 = a1 & 0xFFFFFFFFFFFFFF8LL;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  uint64_t v34 = a1 + 32;
  uint64_t v35 = v7;
  while (1)
  {
    if (v38)
    {
      id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
    }

    else
    {
      if (v5 >= *(void *)(v36 + 16)) {
        __break(1u);
      }
      id v8 = *(id *)(v34 + 8 * v5);
    }

    uint64_t v9 = v8;
    if (__OFADD__(v5++, 1LL))
    {
      __break(1u);
      goto LABEL_30;
    }

    Swift::Int v11 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
    uint64_t v12 = -1LL << *(_BYTE *)(v2 + 32);
    unint64_t v13 = v11 & ~v12;
    if (((*(void *)(v6 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) != 0) {
      break;
    }
LABEL_19:

    if (v37)
    {
      swift_bridgeObjectRetain(a1);
      uint64_t v19 = _CocoaArrayWrapper.endIndex.getter(v35);
      swift_bridgeObjectRelease(a1);
      if (v5 == v19) {
        goto LABEL_21;
      }
    }

    else if (v5 == *(void *)(v36 + 16))
    {
      goto LABEL_21;
    }
  }

  type metadata accessor for NearbyGroupMember(0LL);
  id v14 = *(id *)(*(void *)(v2 + 48) + 8 * v13);
  char v15 = static NSObject.== infix(_:_:)(v14);

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = ~v12;
    do
    {
      unint64_t v13 = (v13 + 1) & v16;
      if (((*(void *)(v6 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v13) & 1) == 0) {
        goto LABEL_19;
      }
      id v17 = *(id *)(*(void *)(v2 + 48) + 8 * v13);
      char v18 = static NSObject.== infix(_:_:)(v17);
    }

    while ((v18 & 1) == 0);
  }

  v39[1] = v5;
  char v22 = *(_BYTE *)(v2 + 32);
  unsigned int v23 = v22 & 0x3F;
  unint64_t v24 = (1LL << v22) + 63;
  uint64_t v25 = v24 >> 6;
  size_t v26 = 8 * (v24 >> 6);
  if (v23 < 0xE
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(8 * (v24 >> 6), 8LL), (_DWORD)isStackAllocationSafe))
  {
    __chkstk_darwin(isStackAllocationSafe, v21);
    memcpy((char *)&v33 - ((v26 + 15) & 0x3FFFFFFFFFFFFFF0LL), (const void *)(v2 + 56), v26);
    specialized closure #1 in _NativeSet.subtracting<A>(_:)( (unint64_t *)((char *)&v33 - ((v26 + 15) & 0x3FFFFFFFFFFFFFF0LL)),  v25,  v2,  v13,  v39);
    uint64_t v28 = v27;
    swift_release(v2);
    swift_bridgeObjectRelease(v39[0]);
  }

  else
  {
    uint64_t v29 = (void *)swift_slowAlloc(v26, -1LL);
    memcpy(v29, (const void *)(v2 + 56), v26);
    specialized closure #1 in _NativeSet.subtracting<A>(_:)((unint64_t *)v29, v25, v2, v13, v39);
    uint64_t v28 = v30;
    swift_release(v2);
    swift_bridgeObjectRelease(v39[0]);
    swift_slowDealloc(v29, -1LL, -1LL);
  }

  return (void *)v28;
}

unint64_t lazy protocol witness table accessor for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors()
{
  unint64_t result = lazy protocol witness table cache variable for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors;
  if (!lazy protocol witness table cache variable for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for NearbyGroupHostIDSService.Errors,  &type metadata for NearbyGroupHostIDSService.Errors);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors;
  if (!lazy protocol witness table cache variable for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for NearbyGroupHostIDSService.Errors,  &type metadata for NearbyGroupHostIDSService.Errors);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type NearbyGroupHostIDSService.Errors and conformance NearbyGroupHostIDSService.Errors);
  }

  return result;
}

uint64_t partial apply for closure #1 in NearbyGroupHostIDSService.distributeGroupInitialization(for:to:)( uint64_t a1)
{
  return closure #1 in NearbyGroupHostIDSService.distributeGroupInitialization(for:to:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24));
}

uint64_t partial apply for closure #1 in NearbyGroupHostIDSService.distributeRemove(for:removingMember:)( uint64_t a1)
{
  return closure #1 in NearbyGroupHostIDSService.distributeRemove(for:removingMember:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24));
}

uint64_t partial apply for closure #1 in NearbyGroupHostIDSService.distributeLeave(for:)(uint64_t a1)
{
  return closure #1 in NearbyGroupHostIDSService.distributeLeave(for:)(a1, *(void *)(v1 + 16));
}

void specialized closure #1 in _NativeSet.subtracting<A>(_:)( unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t *a5)
{
  unint64_t v5 = a5;
  uint64_t v7 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= (-1LL << a4) - 1;
  uint64_t v37 = v7 - 1;
  uint64_t v9 = *a5;
  unint64_t v8 = a5[1];
  if ((unint64_t)*a5 >> 62)
  {
    if (v9 < 0) {
      uint64_t v10 = *a5;
    }
    else {
      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(*a5);
    uint64_t v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(v9);
    if (v8 == v11) {
      goto LABEL_3;
    }
  }

  else if (v8 == *(void *)((v9 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
LABEL_3:
    swift_retain();
    specialized _NativeSet.extractSubset(using:count:)(a1, a2, v37, a3);
    return;
  }

  uint64_t v39 = a3 + 56;
  unint64_t v38 = v5;
  while (1)
  {
    uint64_t v12 = *v5;
    if ((*v5 & 0xC000000000000001LL) != 0)
    {
      id v13 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v12);
      goto LABEL_13;
    }

    if ((v8 & 0x8000000000000000LL) != 0) {
      break;
    }
    if (v8 >= *(void *)((v12 & 0xFFFFFFFFFFFFF8LL) + 0x10)) {
      goto LABEL_37;
    }
    id v13 = *(id *)(v12 + 8 * v8 + 32);
LABEL_13:
    id v14 = v13;
    uint64_t v15 = v5[1];
    BOOL v16 = __OFADD__(v15, 1LL);
    uint64_t v17 = v15 + 1;
    if (v16) {
      goto LABEL_38;
    }
    v5[1] = v17;
    Swift::Int v18 = NSObject._rawHashValue(seed:)(*(void *)(a3 + 40));
    uint64_t v19 = -1LL << *(_BYTE *)(a3 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    uint64_t v22 = 1LL << v20;
    if (((1LL << v20) & *(void *)(v39 + 8 * (v20 >> 6))) == 0) {
      goto LABEL_21;
    }
    type metadata accessor for NearbyGroupMember(0LL);
    id v23 = *(id *)(*(void *)(a3 + 48) + 8 * v20);
    char v24 = static NSObject.== infix(_:_:)(v23);

    if ((v24 & 1) == 0)
    {
      uint64_t v25 = ~v19;
      for (unint64_t i = v20 + 1; ; unint64_t i = v27 + 1)
      {
        unint64_t v27 = i & v25;
        id v28 = *(id *)(*(void *)(a3 + 48) + 8 * v27);
        char v29 = static NSObject.== infix(_:_:)(v28);

        if ((v29 & 1) != 0)
        {

          unint64_t v21 = v27 >> 6;
          uint64_t v22 = 1LL << v27;
          goto LABEL_23;
        }
      }

Swift::Int specialized _NativeSet.extractSubset(using:count:)( unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release(v4);
    return (Swift::Int)v9;
  }

  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<NearbyGroupMember>);
  Swift::Int result = static _SetStorage.allocate(capacity:)(v5);
  uint64_t v9 = (void *)result;
  char v29 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0LL;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0LL;
  Swift::Int v12 = result + 56;
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
    unint64_t v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v29[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v29[v11];
        if (!v16) {
          break;
        }
      }
    }

char *specialized NearbyGroupHostIDSService.init(idsService:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Publishers.BufferingStrategy<Never>);
  uint64_t v87 = *(void *)(v7 - 8);
  uint64_t v88 = v7;
  __chkstk_darwin(v7, v8);
  uint64_t v86 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for Publishers.PrefetchStrategy(0LL);
  uint64_t v81 = *(void *)(v10 - 8);
  uint64_t v82 = v10;
  __chkstk_darwin(v10, v11);
  uint64_t v80 = (char *)&v72 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Buffer<AnyPublisher<(NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext), Never>>);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v89 = v13;
  uint64_t v90 = v14;
  __chkstk_darwin(v13, v15);
  uint64_t v85 = (char *)&v72 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v78 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0LL);
  uint64_t v77 = *(void *)(v78 - 8);
  __chkstk_darwin(v78, v17);
  uint64_t v76 = (char *)&v72 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v19 = type metadata accessor for OS_dispatch_queue.Attributes(0LL);
  __chkstk_darwin(v19, v20);
  uint64_t v75 = (char *)&v72 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = type metadata accessor for DispatchQoS(0LL);
  __chkstk_darwin(v22, v23);
  unint64_t v25 = (char *)&v72 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v95[3] = a3;
  v95[4] = a4;
  uint64_t v79 = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v95);
  uint64_t v27 = *(void (**)(void))(*(void *)(a3 - 8) + 32LL);
  uint64_t v83 = a3;
  uint64_t v84 = boxed_opaque_existential_1;
  v27();
  uint64_t v28 = OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService__incomingMessages;
  uint64_t v74 = OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService__incomingMessages;
  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PassthroughSubject<(NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext), Never>);
  swift_allocObject(v29, *(unsigned int *)(v29 + 48), *(unsigned __int16 *)(v29 + 52));
  uint64_t v73 = a2;
  uint64_t v91 = a2;
  *(void *)&a2[v28] = PassthroughSubject.init()();
  unint64_t v93 = 0LL;
  unint64_t v94 = 0xE000000000000000LL;
  _StringGuts.grow(_:)(28LL);
  swift_bridgeObjectRelease(v94);
  unint64_t v93 = (void *)0xD00000000000001ALL;
  unint64_t v94 = 0x80000001000B08A0LL;
  uint64_t v30 = (*(uint64_t (**)(uint64_t))(*(void *)(a4 + 8) + 8LL))(a3);
  if (v31) {
    uint64_t v32 = v30;
  }
  else {
    uint64_t v32 = 0x4E574F4E4B4E55LL;
  }
  if (v31) {
    uint64_t v33 = v31;
  }
  else {
    uint64_t v33 = (void *)0xE700000000000000LL;
  }
  type metadata accessor for OS_dispatch_queue( 0LL,  (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue,  &OBJC_CLASS___OS_dispatch_queue_ptr);
  v34._countAndFlagsBits = v32;
  v34._object = v33;
  String.append(_:)(v34);
  uint64_t v35 = swift_bridgeObjectRelease(v33);
  uint64_t v36 = v93;
  unint64_t v37 = v94;
  static DispatchQoS.unspecified.getter(v35);
  unint64_t v93 = _swiftEmptyArrayStorage;
  uint64_t v38 = lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes,  (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes,  (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  uint64_t v40 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]( (unint64_t *)&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A],  (uint64_t *)&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes],  (uint64_t)&protocol conformance descriptor for [A]);
  unint64_t v41 = v75;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v93, v39, v40, v19, v38);
  uint64_t v42 = v76;
  (*(void (**)(char *, void, uint64_t))(v77 + 104))( v76,  enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:),  v78);
  uint64_t v43 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(v36, v37, v25, v41, v42, 0LL);
  uint64_t v44 = v91;
  *(void *)&v91[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_queue] = v43;
  outlined init with copy of PseudonymProtocol( (uint64_t)v95,  (uint64_t)&v44[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_service]);
  unint64_t v93 = *(void **)&v73[v74];
  uint64_t v45 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]( (unint64_t *)&lazy protocol witness table cache variable for type PassthroughSubject<(NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext), Never> and conformance PassthroughSubject<A, B>,  &demangling cache variable for type metadata for PassthroughSubject<(NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext), Never>,  (uint64_t)&protocol conformance descriptor for PassthroughSubject<A, B>);
  uint64_t v46 = Publisher.eraseToAnyPublisher()(v29, v45);
  unint64_t v93 = (void *)v46;
  NSString v47 = v80;
  uint64_t v48 = v81;
  uint64_t v49 = v82;
  (*(void (**)(char *, void, uint64_t))(v81 + 104))( v80,  enum case for Publishers.PrefetchStrategy.byRequest(_:),  v82);
  uint64_t v51 = v86;
  uint64_t v50 = v87;
  uint64_t v52 = v88;
  (*(void (**)(char *, void, uint64_t))(v87 + 104))( v86,  enum case for Publishers.BufferingStrategy.dropOldest<A>(_:),  v88);
  uint64_t v53 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AnyPublisher<(NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext), Never>);
  uint64_t v54 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]( &lazy protocol witness table cache variable for type AnyPublisher<(NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext), Never> and conformance AnyPublisher<A, B>,  &demangling cache variable for type metadata for AnyPublisher<(NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext), Never>,  (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  uint64_t v55 = v85;
  Publisher.buffer(size:prefetch:whenFull:)(0x7FFFFFFFFFFFFFFFLL, v47, v51, v53, v54);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v49);
  uint64_t v56 = lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A]( &lazy protocol witness table cache variable for type Publishers.Buffer<AnyPublisher<(NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext), Never>> and conformance Publishers.Buffer<A>,  &demangling cache variable for type metadata for Publishers.Buffer<AnyPublisher<(NearbyGroupHostIDSService.MessageEvent, NearbyGroupHostIDSService.MessageContext), Never>>,  (uint64_t)&protocol conformance descriptor for Publishers.Buffer<A>);
  uint64_t v57 = v89;
  uint64_t v58 = Publisher.eraseToAnyPublisher()(v89, v56);
  swift_release(v46);
  (*(void (**)(char *, uint64_t))(v90 + 8))(v55, v57);
  unint64_t v59 = v91;
  *(void *)&v91[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_incomingMessages] = v58;

  uint64_t v60 = (objc_class *)type metadata accessor for NearbyGroupHostIDSService();
  v92.receiver = v59;
  v92.super_class = v60;
  id v61 = objc_msgSendSuper2(&v92, "init");
  id v62 = objc_allocWithZone(&OBJC_CLASS___IDSServiceDelegateProperties);
  uint64_t v63 = (char *)v61;
  id v64 = [v62 init];
  [v64 setWantsCrossAccountMessaging:1];
  uint64_t v65 = *(void **)&v63[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_queue];
  uint64_t v66 = v79;
  uint64_t v67 = *(void (**)(char *, id, void *, uint64_t, uint64_t))(v79 + 24);
  uint64_t v68 = v63;
  id v69 = v64;
  id v70 = v65;
  v67(v63, v64, v65, v83, v66);

  __swift_destroy_boxed_opaque_existential_0Tm(v95);
  return v68;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80LL) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }

  return result;
}

uint64_t type metadata accessor for NearbyGroupHostIDSService()
{
  return objc_opt_self(&OBJC_CLASS____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService);
}

uint64_t specialized static NearbyGroupHostIDSService.MessageEvent.Member.__derived_struct_equals(_:_:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 == a5 && a2 == a6
    || (v12 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a5, a6, 0LL), uint64_t result = 0LL, (v12 & 1) != 0))
  {
    if (a4)
    {
      if (a8 && (a3 == a7 && a4 == a8 || (_stringCompareWithSmolCheck(_:_:expecting:)(a3, a4, a7, a8, 0LL) & 1) != 0)) {
        return 1LL;
      }
    }

    else if (!a8)
    {
      return 1LL;
    }

    return 0LL;
  }

  return result;
}

uint64_t type metadata accessor for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization,  (uint64_t)&nominal type descriptor for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization);
}

uint64_t type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroupHostIDSService.MessageEvent.MembershipMutation,  (uint64_t)&nominal type descriptor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation);
}

uint64_t outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *(void *)(a1 + 24);
  char v7 = *(_BYTE *)(a1 + 32);
  outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(*(void *)a1, v4, v5, v6);
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
  *(void *)(a2 + 24) = v6;
  *(_BYTE *)(a2 + 32) = v7;
  return a2;
}

uint64_t outlined assign with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( __int128 *a1, uint64_t a2)
{
  __int128 v2 = *a1;
  __int128 v3 = a1[1];
  *(_BYTE *)(a2 + 32) = *((_BYTE *)a1 + 32);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void specialized Sequence.first(where:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = a1;
  if ((a1 & 0xC000000000000001LL) != 0)
  {
    if (a1 < 0) {
      uint64_t v7 = a1;
    }
    else {
      uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8LL;
    }
    swift_bridgeObjectRetain(a1);
    uint64_t v8 = __CocoaSet.makeIterator()(v7);
    uint64_t v9 = type metadata accessor for OS_dispatch_queue( 0LL,  &lazy cache variable for type metadata for IDSAccount,  &OBJC_CLASS___IDSAccount_ptr);
    unint64_t v10 = lazy protocol witness table accessor for type IDSAccount and conformance NSObject();
    uint64_t v11 = Set.Iterator.init(_cocoa:)(v8, v9, v10);
    uint64_t v6 = v33[1];
    uint64_t v31 = v33[2];
    uint64_t v12 = v33[3];
    int64_t v13 = v33[4];
    unint64_t v14 = v33[5];
  }

  else
  {
    uint64_t v15 = -1LL << *(_BYTE *)(a1 + 32);
    uint64_t v31 = a1 + 56;
    uint64_t v16 = ~v15;
    uint64_t v17 = -v15;
    if (v17 < 64) {
      uint64_t v18 = ~(-1LL << v17);
    }
    else {
      uint64_t v18 = -1LL;
    }
    unint64_t v14 = v18 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain(a1);
    uint64_t v12 = v16;
    int64_t v13 = 0LL;
  }

  int64_t v30 = (unint64_t)(v12 + 64) >> 6;
  if ((v6 & 0x8000000000000000LL) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v19 = __CocoaSet.Iterator.next()(v11);
  if (!v19) {
    goto LABEL_39;
  }
  uint64_t v20 = v19;
  v33[0] = v19;
  uint64_t v21 = type metadata accessor for OS_dispatch_queue( 0LL,  &lazy cache variable for type metadata for IDSAccount,  &OBJC_CLASS___IDSAccount_ptr);
  swift_unknownObjectRetain(v20);
  swift_dynamicCast(&v34, v33, (char *)&type metadata for Swift.AnyObject + 8, v21, 7LL);
  id v22 = v34;
  swift_unknownObjectRelease(v20);
  int64_t v23 = v13;
  uint64_t v24 = v14;
  if (!v22) {
    goto LABEL_39;
  }
  while (1)
  {
    id v34 = v22;
    closure #1 in IDSService.account(for:)(&v34, a2, a3);
    if (v4)
    {

      goto LABEL_39;
    }

    if ((v28 & 1) != 0) {
      goto LABEL_39;
    }

    int64_t v13 = v23;
    unint64_t v14 = v24;
    if (v6 < 0) {
      goto LABEL_11;
    }
LABEL_14:
    if (!v14) {
      break;
    }
    uint64_t v24 = (v14 - 1) & v14;
    unint64_t v25 = __clz(__rbit64(v14)) | (v13 << 6);
    int64_t v23 = v13;
LABEL_27:
    id v22 = *(id *)(*(void *)(v6 + 48) + 8 * v25);
    if (!v22) {
      goto LABEL_39;
    }
  }

  int64_t v23 = v13 + 1;
  if (__OFADD__(v13, 1LL))
  {
    __break(1u);
    return;
  }

  if (v23 >= v30) {
    goto LABEL_39;
  }
  unint64_t v26 = *(void *)(v31 + 8 * v23);
  if (v26)
  {
LABEL_26:
    uint64_t v24 = (v26 - 1) & v26;
    unint64_t v25 = __clz(__rbit64(v26)) + (v23 << 6);
    goto LABEL_27;
  }

  int64_t v27 = v13 + 2;
  if (v13 + 2 >= v30) {
    goto LABEL_39;
  }
  unint64_t v26 = *(void *)(v31 + 8 * v27);
  if (v26) {
    goto LABEL_25;
  }
  int64_t v27 = v13 + 3;
  if (v13 + 3 >= v30) {
    goto LABEL_39;
  }
  unint64_t v26 = *(void *)(v31 + 8 * v27);
  if (v26) {
    goto LABEL_25;
  }
  int64_t v27 = v13 + 4;
  if (v13 + 4 >= v30) {
    goto LABEL_39;
  }
  unint64_t v26 = *(void *)(v31 + 8 * v27);
  if (v26)
  {
LABEL_25:
    int64_t v23 = v27;
    goto LABEL_26;
  }

  int64_t v23 = v13 + 5;
  if (v13 + 5 >= v30) {
    goto LABEL_39;
  }
  unint64_t v26 = *(void *)(v31 + 8 * v23);
  if (v26) {
    goto LABEL_26;
  }
  int64_t v29 = v13 + 6;
  while (v30 != v29)
  {
    unint64_t v26 = *(void *)(v31 + 8 * v29++);
    if (v26)
    {
      int64_t v23 = v29 - 1;
      goto LABEL_26;
    }
  }

uint64_t specialized Set.union<A>(_:)(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v9 = a2;
  if ((unint64_t)result >> 62)
  {
    if (result >= 0) {
      result &= 0xFFFFFFFFFFFFFF8uLL;
    }
    uint64_t result = _CocoaArrayWrapper.endIndex.getter(result);
    uint64_t v3 = result;
    if (!result) {
      return v9;
    }
  }

  else
  {
    uint64_t v3 = *(void *)((result & 0xFFFFFFFFFFFFF8LL) + 0x10);
    if (!v3) {
      return v9;
    }
  }

  if (v3 >= 1)
  {
    if ((v2 & 0xC000000000000001LL) != 0)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        uint64_t v5 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(i, v2);
        specialized Set._Variant.insert(_:)((Swift::Int *)&v8, v5);
      }
    }

    else
    {
      uint64_t v6 = (void **)(v2 + 32);
      do
      {
        uint64_t v7 = *v6++;
        specialized Set._Variant.insert(_:)((Swift::Int *)&v8, v7);

        --v3;
      }

      while (v3);
    }

    return v9;
  }

  __break(1u);
  return result;
}

void specialized NearbyGroupHostIDSService.service(_:account:incomingData:fromID:context:)( uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (!a4)
  {
    __break(1u);
    goto LABEL_13;
  }

  uint64_t v6 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000LL) == 0) {
    uint64_t v6 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v6)
  {
    if (a2 >> 60 != 15) {
      __asm { BR              X10 }
    }

uint64_t type metadata accessor for NearbyGroupHostIDSService.MessageEvent(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroupHostIDSService.MessageEvent,  (uint64_t)&nominal type descriptor for NearbyGroupHostIDSService.MessageEvent);
}

void *associated type witness table accessor for AsyncIteratorProtocol.Failure : Error in NearbyGroupHostIDSService.MessageEvents.Iterator()
{
  return &protocol witness table for Never;
}

unint64_t lazy protocol witness table accessor for type NearbyGroupHostIDSService.MessageEvents.Iterator and conformance NearbyGroupHostIDSService.MessageEvents.Iterator()
{
  unint64_t result = lazy protocol witness table cache variable for type NearbyGroupHostIDSService.MessageEvents.Iterator and conformance NearbyGroupHostIDSService.MessageEvents.Iterator;
  if (!lazy protocol witness table cache variable for type NearbyGroupHostIDSService.MessageEvents.Iterator and conformance NearbyGroupHostIDSService.MessageEvents.Iterator)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for NearbyGroupHostIDSService.MessageEvents.Iterator,  &type metadata for NearbyGroupHostIDSService.MessageEvents.Iterator);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type NearbyGroupHostIDSService.MessageEvents.Iterator and conformance NearbyGroupHostIDSService.MessageEvents.Iterator);
  }

  return result;
}

uint64_t storeEnumTagSinglePayload for NearbyGroupHostIDSService.Errors( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10008B450 + 4 * byte_1000AE0D5[v4]))();
  }
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10008B484 + 4 * byte_1000AE0D0[v4]))();
}

uint64_t sub_10008B484(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10008B48C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x10008B494LL);
  }
  return result;
}

uint64_t sub_10008B4A0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x10008B4A8LL);
  }
  *(_BYTE *)unint64_t result = a2 + 1;
  return result;
}

uint64_t sub_10008B4AC(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10008B4B4(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NearbyGroupHostIDSService.Errors()
{
  return &type metadata for NearbyGroupHostIDSService.Errors;
}

ValueMetadata *type metadata accessor for NearbyGroupHostIDSService.MessageEvents()
{
  return &type metadata for NearbyGroupHostIDSService.MessageEvents;
}

ValueMetadata *type metadata accessor for NearbyGroupHostIDSService.MessageEvents.Iterator()
{
  return &type metadata for NearbyGroupHostIDSService.MessageEvents.Iterator;
}

void **initializeBufferWithCopyOfBuffer for NearbyGroupHostIDSService.MessageContext(void **a1, void **a2)
{
  int v3 = *a2;
  *a1 = *a2;
  id v4 = v3;
  return a1;
}

void **assignWithCopy for NearbyGroupHostIDSService.MessageContext(void **a1, void **a2)
{
  int v3 = *a1;
  id v4 = *a2;
  *a1 = *a2;
  id v5 = v4;

  return a1;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *unint64_t result = *a2;
  return result;
}

void **assignWithTake for NearbyGroupHostIDSService.MessageContext(void **a1, void **a2)
{
  int v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroupHostIDSService.MessageContext(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NearbyGroupHostIDSService.MessageContext( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }

  return result;
}

ValueMetadata *type metadata accessor for NearbyGroupHostIDSService.MessageContext()
{
  return &type metadata for NearbyGroupHostIDSService.MessageContext;
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroupHostIDSService.MessageEvent( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v26 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v26 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    uint64_t v8 = type metadata accessor for UUID(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v8 - 8) + 16LL))(a1, a2, v8);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v9 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL);
      uint64_t v10 = *(int *)(v9 + 20);
      uint64_t v11 = (uint64_t *)((char *)a1 + v10);
      uint64_t v12 = (uint64_t *)((char *)a2 + v10);
      uint64_t v14 = *v12;
      uint64_t v13 = v12[1];
      *uint64_t v11 = v14;
      v11[1] = v13;
      uint64_t v15 = *(int *)(v9 + 24);
      uint64_t v16 = (char *)a1 + v15;
      uint64_t v17 = (char *)a2 + v15;
      uint64_t v18 = *(void *)v17;
      uint64_t v19 = *((void *)v17 + 1);
      uint64_t v20 = *((void *)v17 + 2);
      uint64_t v21 = *((void *)v17 + 3);
      char v22 = v17[32];
      swift_bridgeObjectRetain(v13);
      outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v18, v19, v20, v21);
      *(void *)uint64_t v16 = v18;
      *((void *)v16 + 1) = v19;
      *((void *)v16 + 2) = v20;
      *((void *)v16 + 3) = v21;
      v16[32] = v22;
      int64_t v23 = a1;
      uint64_t v24 = a3;
      uint64_t v25 = 1LL;
    }

    else
    {
      uint64_t v28 = *(uint64_t *)((char *)a2 + v27);
      *(uint64_t *)((char *)a1 + v27) = v28;
      swift_bridgeObjectRetain(v28);
      int64_t v23 = a1;
      uint64_t v24 = a3;
      uint64_t v25 = 0LL;
    }

    swift_storeEnumTagMultiPayload(v23, v24, v25);
  }

  return a1;
}

uint64_t outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_bridgeObjectRetain(a2);
}

uint64_t destroy for NearbyGroupHostIDSService.MessageEvent(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a1, a2);
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v5 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL);
    swift_bridgeObjectRelease(*(void *)(a1 + *(int *)(v5 + 20) + 8));
    return outlined consume of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( *(void *)(a1 + *(int *)(v5 + 24)),  *(void *)(a1 + *(int *)(v5 + 24) + 8),  *(void *)(a1 + *(int *)(v5 + 24) + 16),  *(void *)(a1 + *(int *)(v5 + 24) + 24));
  }

  else
  {
    uint64_t v7 = *(void *)(a1
    return swift_bridgeObjectRelease(v7);
  }

uint64_t outlined consume of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_bridgeObjectRelease(a4);
}

uint64_t initializeWithCopy for NearbyGroupHostIDSService.MessageEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  uint64_t v7 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL);
    uint64_t v9 = *(int *)(v8 + 20);
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (uint64_t *)(a2 + v9);
    uint64_t v13 = *v11;
    uint64_t v12 = v11[1];
    *uint64_t v10 = v13;
    v10[1] = v12;
    uint64_t v14 = *(int *)(v8 + 24);
    uint64_t v15 = a1 + v14;
    uint64_t v16 = a2 + v14;
    uint64_t v17 = *(void *)v16;
    uint64_t v18 = *(void *)(v16 + 8);
    uint64_t v19 = *(void *)(v16 + 16);
    uint64_t v20 = *(void *)(v16 + 24);
    char v21 = *(_BYTE *)(v16 + 32);
    swift_bridgeObjectRetain(v12);
    outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v17, v18, v19, v20);
    *(void *)uint64_t v15 = v17;
    *(void *)(v15 + 8) = v18;
    *(void *)(v15 + 16) = v19;
    *(void *)(v15 + 24) = v20;
    uint64_t v22 = 1LL;
    *(_BYTE *)(v15 + 32) = v21;
  }

  else
  {
    uint64_t v23 = *(int *)(type metadata accessor for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(0LL) + 20);
    uint64_t v24 = *(void *)(a2 + v23);
    *(void *)(a1 + v23) = v24;
    swift_bridgeObjectRetain(v24);
    uint64_t v22 = 0LL;
  }

  swift_storeEnumTagMultiPayload(a1, a3, v22);
  return a1;
}

uint64_t assignWithCopy for NearbyGroupHostIDSService.MessageEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( a1,  type metadata accessor for NearbyGroupHostIDSService.MessageEvent);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    uint64_t v7 = type metadata accessor for UUID(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL);
      uint64_t v9 = *(int *)(v8 + 20);
      uint64_t v10 = (void *)(a1 + v9);
      uint64_t v11 = (void *)(a2 + v9);
      *uint64_t v10 = *v11;
      uint64_t v12 = v11[1];
      v10[1] = v12;
      uint64_t v13 = *(int *)(v8 + 24);
      uint64_t v14 = a1 + v13;
      uint64_t v15 = a2 + v13;
      uint64_t v16 = *(void *)v15;
      uint64_t v17 = *(void *)(v15 + 8);
      uint64_t v18 = *(void *)(v15 + 16);
      uint64_t v19 = *(void *)(v15 + 24);
      char v20 = *(_BYTE *)(v15 + 32);
      swift_bridgeObjectRetain(v12);
      outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v16, v17, v18, v19);
      *(void *)uint64_t v14 = v16;
      *(void *)(v14 + 8) = v17;
      *(void *)(v14 + 16) = v18;
      *(void *)(v14 + 24) = v19;
      uint64_t v21 = 1LL;
      *(_BYTE *)(v14 + 32) = v20;
    }

    else
    {
      uint64_t v23 = *(void *)(a2 + v22);
      *(void *)(a1 + v22) = v23;
      swift_bridgeObjectRetain(v23);
      uint64_t v21 = 0LL;
    }

    swift_storeEnumTagMultiPayload(a1, a3, v21);
  }

  return a1;
}

uint64_t initializeWithTake for NearbyGroupHostIDSService.MessageEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
  uint64_t v7 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v8 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL);
    *(_OWORD *)(a1 + *(int *)(v8 + 20)) = *(_OWORD *)(a2 + *(int *)(v8 + 20));
    uint64_t v9 = *(int *)(v8 + 24);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = a2 + v9;
    __int128 v12 = *(_OWORD *)(v11 + 16);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
    *(_OWORD *)(v10 + 16) = v12;
    *(_BYTE *)(v10 + 32) = *(_BYTE *)(v11 + 32);
    uint64_t v13 = 1LL;
  }

  else
  {
    uint64_t v14 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(0LL);
    uint64_t v13 = 0LL;
    *(void *)(a1 + *(int *)(v14 + 20)) = *(void *)(a2 + *(int *)(v14 + 20));
  }

  swift_storeEnumTagMultiPayload(a1, a3, v13);
  return a1;
}

uint64_t assignWithTake for NearbyGroupHostIDSService.MessageEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( a1,  type metadata accessor for NearbyGroupHostIDSService.MessageEvent);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload(a2, a3);
    uint64_t v7 = type metadata accessor for UUID(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32LL))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(0LL);
      *(_OWORD *)(a1 + *(int *)(v8 + 20)) = *(_OWORD *)(a2 + *(int *)(v8 + 20));
      uint64_t v9 = *(int *)(v8 + 24);
      uint64_t v10 = a1 + v9;
      uint64_t v11 = a2 + v9;
      __int128 v12 = *(_OWORD *)(v11 + 16);
      *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
      *(_OWORD *)(v10 + 16) = v12;
      *(_BYTE *)(v10 + 32) = *(_BYTE *)(v11 + 32);
      uint64_t v13 = 1LL;
    }

    else
    {
      uint64_t v14 = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(0LL);
      uint64_t v13 = 0LL;
      *(void *)(a1 + *(int *)(v14 + 20)) = *(void *)(a2 + *(int *)(v14 + 20));
    }

    swift_storeEnumTagMultiPayload(a1, a3, v13);
  }

  return a1;
}

uint64_t type metadata completion function for NearbyGroupHostIDSService.MessageEvent(uint64_t a1)
{
  uint64_t result = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(319LL);
  if (v3 <= 0x3F)
  {
    v5[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(319LL);
    if (v4 <= 0x3F)
    {
      v5[1] = *(void *)(result - 8) + 64LL;
      swift_initEnumMetadataMultiPayload(a1, 256LL, 2LL, v5);
      return 0LL;
    }
  }

  return result;
}

uint64_t destroy for NearbyGroupHostIDSService.MessageEvent.Member(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(void *)(a1 + 24));
}

void *initializeWithCopy for NearbyGroupHostIDSService.MessageEvent.Member(void *a1, void *a2)
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

void *assignWithCopy for NearbyGroupHostIDSService.MessageEvent.Member(void *a1, void *a2)
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

void *assignWithTake for NearbyGroupHostIDSService.MessageEvent.Member(void *a1, void *a2)
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

ValueMetadata *type metadata accessor for NearbyGroupHostIDSService.MessageEvent.Member()
{
  return &type metadata for NearbyGroupHostIDSService.MessageEvent.Member;
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v10);
  }

  else
  {
    uint64_t v7 = type metadata accessor for UUID(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(uint64_t *)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = v9;
    swift_bridgeObjectRetain(v9);
  }

  return a1;
}

uint64_t destroy for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  return swift_bridgeObjectRelease(*(void *)(a1 + *(int *)(a2 + 20)));
}

uint64_t initializeWithCopy for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void *)(a2 + v7);
  *(void *)(a1 + v7) = v8;
  swift_bridgeObjectRetain(v8);
  return a1;
}

uint64_t assignWithCopy for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void *)(a2 + v7);
  uint64_t v9 = *(void *)(a1 + v7);
  *(void *)(a1 + v7) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

uint64_t initializeWithTake for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(void *)(a1 + v7);
  *(void *)(a1 + v7) = *(void *)(a2 + v7);
  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10008C044);
}

uint64_t sub_10008C044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
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

uint64_t storeEnumTagSinglePayload for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10008C0CC);
}

uint64_t sub_10008C0CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t type metadata completion function for NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( uint64_t a1)
{
  uint64_t result = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_initStructMetadata(a1, 256LL, 2LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroupHostIDSService.MessageEvent.MembershipMutation( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for UUID(0LL);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16LL))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    uint64_t v15 = *(uint64_t *)((char *)a2 + v9);
    uint64_t v16 = *((void *)v14 + 1);
    uint64_t v17 = *((void *)v14 + 2);
    uint64_t v18 = *((void *)v14 + 3);
    char v19 = v14[32];
    swift_bridgeObjectRetain(v12);
    outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v15, v16, v17, v18);
    *(void *)uint64_t v13 = v15;
    *((void *)v13 + 1) = v16;
    *((void *)v13 + 2) = v17;
    *((void *)v13 + 3) = v18;
    v13[32] = v19;
  }

  return a1;
}

uint64_t destroy for NearbyGroupHostIDSService.MessageEvent.MembershipMutation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  swift_bridgeObjectRelease(*(void *)(a1 + *(int *)(a2 + 20) + 8));
  return outlined consume of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( *(void *)(a1 + *(int *)(a2 + 24)),  *(void *)(a1 + *(int *)(a2 + 24) + 8),  *(void *)(a1 + *(int *)(a2 + 24) + 16),  *(void *)(a1 + *(int *)(a2 + 24) + 24));
}

uint64_t initializeWithCopy for NearbyGroupHostIDSService.MessageEvent.MembershipMutation( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  void *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  uint64_t v14 = *(void *)(a2 + v8);
  uint64_t v15 = *(void *)(a2 + v8 + 8);
  uint64_t v16 = *(void *)(v13 + 16);
  uint64_t v17 = *(void *)(v13 + 24);
  char v18 = *(_BYTE *)(v13 + 32);
  swift_bridgeObjectRetain(v11);
  outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v14, v15, v16, v17);
  *(void *)uint64_t v12 = v14;
  *(void *)(v12 + 8) = v15;
  *(void *)(v12 + 16) = v16;
  *(void *)(v12 + 24) = v17;
  *(_BYTE *)(v12 + 32) = v18;
  return a1;
}

uint64_t assignWithCopy for NearbyGroupHostIDSService.MessageEvent.MembershipMutation( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v11 = v8[1];
  v8[1] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = *(void *)v14;
  uint64_t v16 = *(void *)(v14 + 8);
  uint64_t v17 = *(void *)(v14 + 16);
  uint64_t v18 = *(void *)(v14 + 24);
  char v19 = *(_BYTE *)(v14 + 32);
  outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(*(void *)v14, v16, v17, v18);
  uint64_t v20 = *(void *)v13;
  uint64_t v21 = *(void *)(v13 + 8);
  uint64_t v22 = *(void *)(v13 + 16);
  uint64_t v23 = *(void *)(v13 + 24);
  *(void *)uint64_t v13 = v15;
  *(void *)(v13 + 8) = v16;
  *(void *)(v13 + 16) = v17;
  *(void *)(v13 + 24) = v18;
  *(_BYTE *)(v13 + 32) = v19;
  outlined consume of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v20, v21, v22, v23);
  return a1;
}

uint64_t initializeWithTake for NearbyGroupHostIDSService.MessageEvent.MembershipMutation( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  *(_BYTE *)(v8 + 32) = *(_BYTE *)(v9 + 32);
  __int128 v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  return a1;
}

uint64_t assignWithTake for NearbyGroupHostIDSService.MessageEvent.MembershipMutation( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  uint64_t v12 = v8[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease(v12);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  char v16 = *(_BYTE *)(v15 + 32);
  uint64_t v17 = *(void *)v14;
  uint64_t v18 = *(void *)(v14 + 8);
  uint64_t v19 = *(void *)(v14 + 16);
  uint64_t v20 = *(void *)(v14 + 24);
  __int128 v21 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v21;
  *(_BYTE *)(v14 + 32) = v16;
  outlined consume of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v17, v18, v19, v20);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroupHostIDSService.MessageEvent.MembershipMutation( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10008C594);
}

uint64_t sub_10008C594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  }
  unint64_t v9 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF) {
    LODWORD(v9) = -1;
  }
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for NearbyGroupHostIDSService.MessageEvent.MembershipMutation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10008C620);
}

uint64_t sub_10008C620(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  }
  *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata completion function for NearbyGroupHostIDSService.MessageEvent.MembershipMutation( uint64_t a1)
{
  uint64_t result = type metadata accessor for UUID(319LL);
  if (v3 <= 0x3F)
  {
    v4[0] = *(void *)(result - 8) + 64LL;
    v4[1] = &unk_1000AE348;
    void v4[2] = &unk_1000AE360;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t destroy for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(uint64_t *a1)
{
  return outlined consume of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( *a1,  a1[1],  a1[2],  a1[3]);
}

uint64_t initializeWithCopy for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(*(void *)a2, v4, v5, v6);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  return a1;
}

uint64_t assignWithCopy for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  char v7 = *(_BYTE *)(a2 + 32);
  outlined copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(*(void *)a2, v4, v5, v6);
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = *(void *)(a1 + 24);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  outlined consume of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v8, v9, v10, v11);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 32);
  uint64_t v4 = *(void *)a1;
  uint64_t v6 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 24);
  __int128 v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 32) = v3;
  outlined consume of NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(v4, v6, v5, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 33)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 32);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0LL;
    *(void *)(result + 24) = 0LL;
    *(_BYTE *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 33) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFF) {
      *(_BYTE *)(result + 33) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 32) = -(char)a2;
    }
  }

  return result;
}

uint64_t getEnumTag for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 32);
}

uint64_t destructiveInjectEnumTag for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation( uint64_t result, char a2)
{
  *(_BYTE *)(result + 32) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation()
{
  return &type metadata for NearbyGroupHostIDSService.MessageEvent.MembershipMutation.Operation;
}

uint64_t closure #2 in _PublisherElements.Iterator.next()specialized partial apply(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000D5F6C);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for closure #1 in NearbyInvitationsAdvertiser.start();
  return specialized closure #2 in _PublisherElements.Iterator.next()(a1, v4);
}

uint64_t partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeLeave(for:)( uint64_t a1)
{
  uint64_t v2 = UUID.data.getter(a1);
  uint64_t v4 = v3;
  uint64_t result = outlined consume of Data._Representation(*(void *)a1, *(void *)(a1 + 8));
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = 1;
  return result;
}

uint64_t outlined assign with take of NearbyGroup_Group.OneOf_Event?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40LL))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeRemove(for:removingMember:)( uint64_t a1)
{
  return closure #1 in closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)( a1,  *(void *)(v1 + 16),  *(void **)(v1 + 24),  type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeGroupInitialization(for:to:)( uint64_t a1)
{
  return closure #1 in closure #1 in NearbyGroupHostIDSService.distributeGroupInitialization(for:to:)( a1,  *(void **)(v1 + 16),  *(void **)(v1 + 24));
}

uint64_t partial apply for closure #1 in closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)( uint64_t a1)
{
  return closure #1 in closure #1 in NearbyGroupHostIDSService.distributeAdd(for:addingMember:)( a1,  *(void *)(v1 + 16),  *(void **)(v1 + 24),  type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t NearbyInvitationServiceHostConnection.__allocating_init(connection:queue:dataSource:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = objc_allocWithZone(v3);
  return NearbyInvitationServiceHostConnection.init(connection:queue:dataSource:)(a1, a2, a3);
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()( uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0LL;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t NearbyInvitationServiceHostConnection.init(connection:queue:dataSource:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + direct field offset for NearbyInvitationServiceHostConnection.dataSource) = a3;
  uint64_t v7 = one-time initialization token for host;
  swift_retain();
  if (v7 != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Creating NearbyInvitationServiceHostConnection", v12, 2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  uint64_t v13 = XPCHostConnection.init(connection:queue:)(a1, a2);
  swift_release(a3);
  return v13;
}

void NearbyInvitationServiceHostConnection.init(connection:queue:)()
{
}

uint64_t NearbyInvitationServiceHostConnection.__ivar_destroyer()
{
  return swift_release(*(void *)(v0 + direct field offset for NearbyInvitationServiceHostConnection.dataSource));
}

uint64_t @objc NearbyInvitationServiceHostConnection.__ivar_destroyer(uint64_t a1)
{
  return swift_release(*(void *)(a1 + direct field offset for NearbyInvitationServiceHostConnection.dataSource));
}

uint64_t NearbyInvitationServiceHostConnection.createGroup(with:response:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v12 = 138412290;
    id v19 = v9;
    uint64_t v18 = v4;
    uint64_t v14 = a2;
    id v15 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v12 + 4, v12 + 12);
    *uint64_t v13 = v9;

    a2 = v14;
    uint64_t v4 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection received request to create group with %@",  v12,  0xCu);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v13, 1LL, v16);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 480LL))( v9,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.createGroup(with:response:)( void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyGroupHostConnection.addMember(nearbyGroupMember:completion:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD5D8,  (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NearbyGroupConnectionInfo?, @unowned NSError?) -> (),  (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.createGroup(with:response:));
}

uint64_t NearbyInvitationServiceHostConnection.requestApproval(with:completion:)( void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v22 = a3;
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v23 = (uint64_t)v9;
    uint64_t v24 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = type metadata accessor for InvitationApprovalRequest(0LL);
    uint64_t v15 = a2;
    id v16 = v9;
    uint64_t v17 = String.init<A>(reflecting:)(&v23, v14);
    unint64_t v19 = v18;
    uint64_t v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v12 + 4, v12 + 12);

    a2 = v15;
    unint64_t v20 = v19;
    a3 = v22;
    swift_bridgeObjectRelease(v20);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection requestApproval with %s",  v12,  0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 488LL))( v9,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.requestApproval(with:completion:)( void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyGroupHostConnection.addMember(nearbyGroupMember:completion:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD5B0,  (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned InvitationBlob?, @unowned NSError?) -> (),  (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.requestApproval(with:completion:));
}

uint64_t NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)( void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  id v11 = a1;
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v15 = swift_slowAlloc(32LL, -1LL);
    uint64_t v26 = (uint64_t)v11;
    uint64_t v27 = v15;
    *(_DWORD *)uint64_t v14 = 136315138;
    uint64_t v25 = a3;
    uint64_t v16 = type metadata accessor for IncomingInvitationJoinRequest(0LL);
    uint64_t v24 = v5;
    uint64_t v17 = a2;
    id v18 = v11;
    uint64_t v19 = String.init<A>(reflecting:)(&v26, v16);
    unint64_t v21 = v20;
    uint64_t v26 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v19, v20, &v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v14 + 4, v14 + 12);

    a2 = v17;
    unint64_t v22 = v21;
    uint64_t v5 = v24;
    a3 = v25;
    swift_bridgeObjectRelease(v22);
    _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "NearbyInvitationServiceHostConnection approve pendingMember %s",  v14,  0xCu);
    swift_arrayDestroy(v15, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                  + 496LL))( v11,  a2,  a3,  a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)( void *a1, int a2, void *a3, void *a4, void *a5)
{
  return @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)( a1,  a2,  a3,  a4,  a5,  (uint64_t)&unk_1000CD588,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  (void (*)(id, id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:));
}

uint64_t NearbyInvitationServiceHostConnection.reject(pendingMember:completion:)( void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v22 = a3;
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v23 = (uint64_t)v9;
    uint64_t v24 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = type metadata accessor for IncomingInvitationJoinRequest(0LL);
    uint64_t v15 = a2;
    id v16 = v9;
    uint64_t v17 = String.init<A>(reflecting:)(&v23, v14);
    unint64_t v19 = v18;
    uint64_t v23 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v17, v18, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v12 + 4, v12 + 12);

    a2 = v15;
    unint64_t v20 = v19;
    a3 = v22;
    swift_bridgeObjectRelease(v20);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection reject pendingMember %s",  v12,  0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 504LL))( v9,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.reject(pendingMember:completion:)( void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyGroupHostConnection.addMember(nearbyGroupMember:completion:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD560,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.reject(pendingMember:completion:));
}

uint64_t NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection generateNearbyInvitation",  v12,  2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 512LL))( a1,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)( void *a1, int a2, uint64_t a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD538,  (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned InvitationBlob?, @unowned NSError?) -> (),  (void (*)(uint64_t, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:));
}

uint64_t NearbyInvitationServiceHostConnection.advertiseNearbyInvitation(_:provider:response:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "NearbyInvitationServiceHostConnection advertiseNearbyInvitation",  v14,  2u);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                     + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                       + 520LL))( a1,  a2,  a3,  a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.advertiseNearbyInvitation(_:provider:response:)( void *a1, int a2, void *a3, uint64_t a4, void *aBlock)
{
  uint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = swift_allocObject(&unk_1000CD510, 24LL, 7LL);
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a1;
  NearbyInvitationServiceHostConnection.advertiseNearbyInvitation(_:provider:response:)( (uint64_t)v10,  a4,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  v9);

  return swift_release(v9);
}

uint64_t NearbyInvitationServiceHostConnection.advertiseNearbySessionEndpoint(params:response:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection advertiseNearbyInvitation",  v12,  2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 528LL))( a1,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.advertiseNearbySessionEndpoint(params:response:)( void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyGroupHostConnection.addMember(nearbyGroupMember:completion:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD4E8,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.advertiseNearbySessionEndpoint(params:response:));
}

uint64_t NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection stopAdvertisingNearbyInvitation",  v12,  2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 536LL))( a1,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)( void *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD4C0,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  (void (*)(char *, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:));
}

uint64_t NearbyInvitationServiceHostConnection.stopAdvertisingNearbySessionEndpoint(response:)( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v6 = type metadata accessor for Logger(0LL);
  uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)static Log.host);
  uint64_t v8 = (os_log_s *)Logger.logObject.getter(v7);
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    id v10 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)id v10 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  v9,  "NearbyInvitationServiceHostConnection stopAdvertisingNearbyInvitation",  v10,  2u);
    swift_slowDealloc(v10, -1LL, -1LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(**(void **)(v3
                                                                   + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                     + 544LL))( a1,  a2);
}

uint64_t @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbySessionEndpoint(response:)( void *a1, int a2, void *aBlock)
{
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = swift_allocObject(&unk_1000CD498, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  id v6 = a1;
  NearbyInvitationServiceHostConnection.stopAdvertisingNearbySessionEndpoint(response:)( (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  v5);

  return swift_release(v5);
}

uint64_t NearbyInvitationServiceHostConnection.assertAdvertisementPublic(_:rotations:response:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for UUID(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v13 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v13, (uint64_t)static Log.host);
  uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  uint64_t v15 = (os_log_s *)Logger.logObject.getter(v14);
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = swift_slowAlloc(22LL, -1LL);
    uint64_t v29 = a1;
    uint64_t v18 = v17;
    uint64_t v19 = swift_slowAlloc(32LL, -1LL);
    uint64_t v31 = a4;
    uint64_t v28 = v19;
    uint64_t v34 = v19;
    *(_DWORD *)uint64_t v18 = 136315394;
    uint64_t v30 = a2;
    unint64_t v20 = lazy protocol witness table accessor for type UUID and conformance UUID();
    uint64_t v21 = dispatch thunk of CustomStringConvertible.description.getter(v8, v20);
    unint64_t v23 = v22;
    uint64_t v33 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v21, v22, &v34);
    a2 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v18 + 4, v18 + 12);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    *(_WORD *)(v18 + 12) = 2048;
    uint64_t v33 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v18 + 14, v18 + 22);
    _os_log_impl( (void *)&_mh_execute_header,  v15,  v16,  "NearbyInvitationServiceHostConnection assertAdvertisementPublic invitationID: %s for %lu rotations",  (uint8_t *)v18,  0x16u);
    uint64_t v24 = v28;
    swift_arrayDestroy(v28, 1LL, (char *)&type metadata for Any + 8);
    a4 = v31;
    swift_slowDealloc(v24, -1LL, -1LL);
    uint64_t v25 = v18;
    a1 = v29;
    swift_slowDealloc(v25, -1LL, -1LL);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v32
                                                                                     + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                       + 560LL))( a1,  a2,  a3,  a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.assertAdvertisementPublic(_:rotations:response:)( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v15 = swift_allocObject(&unk_1000CD470, 24LL, 7LL);
  *(void *)(v15 + 16) = v14;
  id v16 = a1;
  NearbyInvitationServiceHostConnection.assertAdvertisementPublic(_:rotations:response:)( (uint64_t)v13,  a4,  (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSUUID?, @unowned NSError?) -> (),  v15);

  swift_release(v15);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NSUUID?, @unowned NSError?) -> ()( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of UUID?(a1, (uint64_t)v9);
  uint64_t v10 = type metadata accessor for UUID(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0LL;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1LL, v10) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
  }

  if (a2) {
    uint64_t v13 = (void *)_convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v13 = 0LL;
  }
  (*(void (**)(uint64_t, Class, void *))(a3 + 16))(a3, isa, v13);
}

uint64_t NearbyInvitationServiceHostConnection.markInvitationUsed(_:response:)( void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v19 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = NearbyInvitationJoinRequestMetadata.pseudonym.getter(v13);
    unint64_t v16 = v15;
    uint64_t v18 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v12 + 4, v12 + 12);

    swift_bridgeObjectRelease(v16);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection markInvitationUsed for pseudonym: %s",  v12,  0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 552LL))( v9,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.markInvitationUsed(_:response:)( void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyGroupHostConnection.addMember(nearbyGroupMember:completion:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD448,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.markInvitationUsed(_:response:));
}

uint64_t NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:)( uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  os_log_type_t v11 = &v37[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v9, v12);
  uint64_t v14 = &v37[-v13];
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v15 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v15, (uint64_t)static Log.host);
  unint64_t v16 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16);
  v16(v14, a1, v6);
  uint64_t v17 = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v16)(v11, a2, v6);
  uint64_t v18 = (os_log_s *)Logger.logObject.getter(v17);
  os_log_type_t v19 = static os_log_type_t.default.getter();
  int v20 = v19;
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v21 = swift_slowAlloc(22LL, -1LL);
    uint64_t v40 = v2;
    uint64_t v22 = v21;
    uint64_t v39 = swift_slowAlloc(64LL, -1LL);
    uint64_t v44 = v39;
    *(_DWORD *)uint64_t v22 = 136315394;
    int v38 = v20;
    unint64_t v23 = lazy protocol witness table accessor for type UUID and conformance UUID();
    uint64_t v42 = a2;
    unint64_t v24 = v23;
    uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter(v6, v23);
    unint64_t v27 = v26;
    uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v25, v26, &v44);
    uint64_t v41 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v27);
    uint64_t v28 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v28(v14, v6);
    *(_WORD *)(v22 + 12) = 2080;
    unint64_t v29 = v24;
    a2 = v42;
    uint64_t v30 = dispatch thunk of CustomStringConvertible.description.getter(v6, v29);
    unint64_t v32 = v31;
    uint64_t v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v30, v31, &v44);
    a1 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v43, &v44, v22 + 14, v22 + 22);
    swift_bridgeObjectRelease(v32);
    v28(v11, v6);
    _os_log_impl( (void *)&_mh_execute_header,  v18,  (os_log_type_t)v38,  "NearbyInvitationServiceHostConnection releaseAdvertisementPublicAssertion invitationID: %s assertionIdentifier %s",  (uint8_t *)v22,  0x16u);
    uint64_t v33 = v39;
    swift_arrayDestroy(v39, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v33, -1LL, -1LL);
    uint64_t v34 = v22;
    uint64_t v3 = v40;
    swift_slowDealloc(v34, -1LL, -1LL);
  }

  else
  {
    uint64_t v35 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v35(v14, v6);
    v35(v11, v6);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, void (*)(uint64_t), void))(**(void **)(v3 + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                                           + 568LL))( a1,  a2,  closure #1 in NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:),  0LL);
}

void closure #1 in NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:)( uint64_t a1)
{
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v2 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v2, (uint64_t)static Log.host);
  swift_errorRetain(a1);
  uint64_t v3 = swift_errorRetain(a1);
  oslog = (os_log_s *)Logger.logObject.getter(v3);
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v6 = swift_slowAlloc(32LL, -1LL);
    uint64_t v13 = v6;
    *(_DWORD *)uint64_t v5 = 136315138;
    if (a1)
    {
      uint64_t v12 = a1;
      swift_errorRetain(a1);
      uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Error);
      uint64_t v8 = String.init<A>(reflecting:)(&v12, v7);
      unint64_t v10 = v9;
    }

    else
    {
      unint64_t v10 = 0xE300000000000000LL;
      uint64_t v8 = 7104878LL;
    }

    uint64_t v12 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v8, v10, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v12, &v13, v5 + 4, v5 + 12);
    swift_bridgeObjectRelease(v10);
    swift_errorRelease(a1);
    swift_errorRelease(a1);
    _os_log_impl((void *)&_mh_execute_header, oslog, v4, "Released assertion with error: %s", v5, 0xCu);
    swift_arrayDestroy(v6, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v6, -1LL, -1LL);
    swift_slowDealloc(v5, -1LL, -1LL);
  }

  else
  {
    swift_errorRelease(a1);
    swift_errorRelease(a1);
  }

uint64_t @objc NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:)( void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for UUID(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v10, v13);
  uint64_t v15 = (char *)&v19 - v14;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  id v16 = a1;
  NearbyInvitationServiceHostConnection.releaseAdvertisementPublicAssertion(_:assertionIdentifier:)( (uint64_t)v15,  (uint64_t)v12);

  uint64_t v17 = *(void (**)(char *, uint64_t))(v8 + 8);
  v17(v12, v7);
  return ((uint64_t (*)(char *, uint64_t))v17)(v15, v7);
}

uint64_t NearbyInvitationServiceHostConnection.releaseInvitation(_:response:)( void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v13 = swift_slowAlloc(32LL, -1LL);
    uint64_t v19 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v14 = NearbyInvitationJoinRequestMetadata.pseudonym.getter(v13);
    unint64_t v16 = v15;
    uint64_t v18 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v14, v15, &v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v18, &v19, v12 + 4, v12 + 12);

    swift_bridgeObjectRelease(v16);
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection releaseInvitation for pseudonym: %s",  v12,  0xCu);
    swift_arrayDestroy(v13, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 576LL))( v9,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.releaseInvitation(_:response:)( void *a1, int a2, void *a3, void *a4)
{
  return @objc NearbyGroupHostConnection.addMember(nearbyGroupMember:completion:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD420,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  (void (*)(id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.releaseInvitation(_:response:));
}

uint64_t NearbyInvitationServiceHostConnection.scanNearbyInvitations(scannerID:response:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection scanNearbyInvitations",  v12,  2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 584LL))( a1,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.scanNearbyInvitations(scannerID:response:)( void *a1, uint64_t a2, uint64_t a3, const void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD3F8,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  (void (*)(char *, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.scanNearbyInvitations(scannerID:response:));
}

uint64_t @objc NearbyInvitationServiceHostConnection.stopAdvertisingNearbyInvitation(_:response:)( void *a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, void (*a7)(char *, uint64_t, uint64_t))
{
  uint64_t v13 = type metadata accessor for UUID(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13, v15);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v18 = _Block_copy(a4);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v19 = swift_allocObject(a5, 24LL, 7LL);
  *(void *)(v19 + 16) = v18;
  id v20 = a1;
  a7(v17, a6, v19);

  swift_release(v19);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
}

uint64_t NearbyInvitationServiceHostConnection.scanNearbyEndpoints(params:scannerID:response:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "NearbyInvitationServiceHostConnection scanNearbyInvitations",  v14,  2u);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                     + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                       + 592LL))( a1,  a2,  a3,  a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.scanNearbyEndpoints(params:scannerID:response:)( void *a1, uint64_t a2, void *a3, uint64_t a4, const void *a5)
{
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  os_log_type_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = _Block_copy(a5);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v15 = swift_allocObject(&unk_1000CD3D0, 24LL, 7LL);
  *(void *)(v15 + 16) = v14;
  id v16 = a3;
  id v17 = a1;
  NearbyInvitationServiceHostConnection.scanNearbyEndpoints(params:scannerID:response:)( (uint64_t)v16,  (uint64_t)v13,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  v15);

  swift_release(v15);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
}

uint64_t NearbyInvitationServiceHostConnection.stopScanningNearbyInvitations(provider:response:)( uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  uint64_t v9 = __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(2LL, -1LL);
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection stopScanningNearbyInvitations",  v12,  2u);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(**(void **)(v4
                                                                            + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                              + 600LL))( a1,  a2,  a3);
}

uint64_t @objc NearbyInvitationServiceHostConnection.stopScanningNearbyInvitations(provider:response:)( void *a1, int a2, uint64_t a3, void *a4)
{
  return @objc NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)( a1,  a2,  a3,  a4,  (uint64_t)&unk_1000CD3A8,  (uint64_t)thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply,  (void (*)(uint64_t, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.stopScanningNearbyInvitations(provider:response:));
}

uint64_t @objc NearbyInvitationServiceHostConnection.generateNearbyInvitation(provider:response:)( void *a1, int a2, uint64_t a3, void *aBlock, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v12 = _Block_copy(aBlock);
  uint64_t v13 = swift_allocObject(a5, 24LL, 7LL);
  *(void *)(v13 + 16) = v12;
  id v14 = a1;
  a7(a3, a6, v13);

  return swift_release(v13);
}

uint64_t NearbyInvitationServiceHostConnection.requestConnection(with:localInvitation:response:)( void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  id v11 = a1;
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v18 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)id v14 = 138412290;
    id v20 = v11;
    uint64_t v19 = a2;
    id v15 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v14 + 4, v14 + 12);
    *uint64_t v18 = v11;

    a2 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "NearbyInvitationServiceHostConnection requestConnection with advertisement %@",  v14,  0xCu);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v18, 1LL, v16);
    swift_slowDealloc(v18, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                  + 608LL))( v11,  a2,  a3,  a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.requestConnection(with:localInvitation:response:)( void *a1, int a2, void *a3, void *a4, void *a5)
{
  return @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)( a1,  a2,  a3,  a4,  a5,  (uint64_t)&unk_1000CD380,  (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned InvitationBlob?, @unowned NSError?) -> (),  (void (*)(id, id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.requestConnection(with:localInvitation:response:));
}

void thunk for @escaping @callee_unowned @convention(block) (@unowned NearbyGroupConnectionInfo?, @unowned NSError?) -> ()( uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)(a2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

uint64_t NearbyInvitationServiceHostConnection.requestEndpointConnection(with:pseudonym:response:)( void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v10 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v10, (uint64_t)static Log.host);
  id v11 = a1;
  uint64_t v12 = (os_log_s *)Logger.logObject.getter(v11);
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    id v14 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v18 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)id v14 = 138412290;
    id v20 = v11;
    uint64_t v19 = a2;
    id v15 = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v14 + 4, v14 + 12);
    *uint64_t v18 = v11;

    a2 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  v13,  "NearbyInvitationServiceHostConnection requestConnectionEndpoint with advertisement %@",  v14,  0xCu);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v18, 1LL, v16);
    swift_slowDealloc(v18, -1LL, -1LL);
    swift_slowDealloc(v14, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id, uint64_t, uint64_t, uint64_t))(**(void **)(v5
                                                                                + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                                  + 616LL))( v11,  a2,  a3,  a4);
}

uint64_t @objc NearbyInvitationServiceHostConnection.requestEndpointConnection(with:pseudonym:response:)( void *a1, int a2, void *a3, void *a4, void *a5)
{
  return @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)( a1,  a2,  a3,  a4,  a5,  (uint64_t)&unk_1000CD358,  (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> (),  (void (*)(id, id, uint64_t, uint64_t))NearbyInvitationServiceHostConnection.requestEndpointConnection(with:pseudonym:response:));
}

uint64_t @objc NearbyInvitationServiceHostConnection.approve(pendingMember:response:completion:)( void *a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7, void (*a8)(id, id, uint64_t, uint64_t))
{
  id v14 = _Block_copy(aBlock);
  uint64_t v15 = swift_allocObject(a6, 24LL, 7LL);
  *(void *)(v15 + 16) = v14;
  id v16 = a3;
  id v17 = a4;
  id v18 = a1;
  a8(v16, v17, a7, v15);

  return swift_release(v15);
}

uint64_t NearbyInvitationServiceHostConnection.approveConnectionRequest(_:localInvitation:)( void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v8 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v8, (uint64_t)static Log.host);
  id v9 = a1;
  uint64_t v10 = (os_log_s *)Logger.logObject.getter(v9);
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    os_log_type_t v13 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v12 = 138412290;
    id v19 = v9;
    uint64_t v18 = v4;
    uint64_t v14 = a2;
    id v15 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v12 + 4, v12 + 12);
    *os_log_type_t v13 = v9;

    a2 = v14;
    uint64_t v4 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  v11,  "NearbyInvitationServiceHostConnection approveConnectionRequest with advertisement %@",  v12,  0xCu);
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v13, 1LL, v16);
    swift_slowDealloc(v13, -1LL, -1LL);
    swift_slowDealloc(v12, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id, uint64_t, uint64_t))(**(void **)(v4
                                                                       + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                                         + 624LL))( v9,  a2,  a3);
}

void @objc NearbyInvitationServiceHostConnection.approveConnectionRequest(_:localInvitation:)( void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v11 = a1;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  unint64_t v10 = v9;

  NearbyInvitationServiceHostConnection.approveConnectionRequest(_:localInvitation:)(v6, v8, v10);
  outlined consume of Data._Representation(v8, v10);
}

uint64_t NearbyInvitationServiceHostConnection.denyConnectionRequest(_:)(void *a1)
{
  uint64_t v2 = v1;
  if (one-time initialization token for host != -1) {
    swift_once(&one-time initialization token for host, one-time initialization function for host);
  }
  uint64_t v4 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v4, (uint64_t)static Log.host);
  id v5 = a1;
  id v6 = (os_log_s *)Logger.logObject.getter(v5);
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    unint64_t v9 = (void *)swift_slowAlloc(8LL, -1LL);
    *(_DWORD *)uint64_t v8 = 138412290;
    id v13 = v5;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v8 + 4, v8 + 12);
    void *v9 = v5;

    _os_log_impl( (void *)&_mh_execute_header,  v6,  v7,  "NearbyInvitationServiceHostConnection denyConnectionRequest with advertisement %@",  v8,  0xCu);
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v9, 1LL, v11);
    swift_slowDealloc(v9, -1LL, -1LL);
    swift_slowDealloc(v8, -1LL, -1LL);
  }

  else
  {
  }

  return (*(uint64_t (**)(id))(**(void **)(v2
                                                     + direct field offset for NearbyInvitationServiceHostConnection.dataSource)
                                       + 632LL))(v5);
}

void @objc NearbyInvitationServiceHostConnection.denyConnectionRequest(_:)(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1;
  NearbyInvitationServiceHostConnection.denyConnectionRequest(_:)(v4);
}

unint64_t lazy protocol witness table accessor for type UUID and conformance UUID()
{
  unint64_t result = lazy protocol witness table cache variable for type UUID and conformance UUID;
  if (!lazy protocol witness table cache variable for type UUID and conformance UUID)
  {
    uint64_t v1 = type metadata accessor for UUID(255LL);
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for UUID, v1);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type UUID and conformance UUID);
  }

  return result;
}

uint64_t type metadata accessor for NearbyInvitationServiceHostConnection(uint64_t a1)
{
  uint64_t result = type metadata singleton initialization cache for NearbyInvitationServiceHostConnection;
  if (!type metadata singleton initialization cache for NearbyInvitationServiceHostConnection) {
    return swift_getSingletonMetadata(a1, &nominal type descriptor for NearbyInvitationServiceHostConnection);
  }
  return result;
}

uint64_t type metadata completion function for NearbyInvitationServiceHostConnection(uint64_t a1)
{
  uint64_t v2 = (char *)&value witness table for Builtin.NativeObject + 64;
  return swift_initClassMetadata2( a1,  0LL,  1LL,  &v2,  a1 + class metadata base offset for NearbyInvitationServiceHostConnection);
}

uint64_t ObjC metadata update function for NearbyInvitationServiceHostConnection()
{
  return type metadata accessor for NearbyInvitationServiceHostConnection(0LL);
}

uint64_t sub_10008F98C()
{
  return swift_deallocObject(v0, 24LL, 7LL);
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSUUID?, @unowned NSError?) -> ()( uint64_t a1, uint64_t a2)
{
}

uint64_t outlined init with copy of UUID?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

void partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NearbyGroupConnectionInfo?, @unowned NSError?) -> ()( uint64_t a1, uint64_t a2)
{
}

uint64_t _PublisherElements.makeAsyncIterator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return specialized _PublisherElements.Iterator.init(_:)(v4, *(void *)(a1 + 16), *(void *)(a1 + 24), a4);
}

uint64_t _PublisherElements.Iterator.next()(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch(_PublisherElements.Iterator.next(), 0LL, 0LL);
}

uint64_t _PublisherElements.Iterator.next()()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = (uint64_t *)v0[4];
  uint64_t v3 = *v2;
  v0[5] = *v2;
  uint64_t v4 = (void *)swift_task_alloc(48LL);
  v0[6] = v4;
  uint64_t v5 = *(void *)(v1 + 16);
  void v4[2] = v5;
  uint64_t v6 = *(void *)(v1 + 24);
  void v4[3] = v6;
  v4[4] = v2;
  uint64_t v7 = unk_1000D79C4;
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc(v7);
  v0[7] = v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v6,  v5,  &protocol requirements base descriptor for Publisher,  &associated type descriptor for Publisher.Output);
  uint64_t v10 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  *uint64_t v8 = v0;
  v8[1] = _PublisherElements.Iterator.next();
  return v12( v0[2],  (uint64_t)partial apply for closure #1 in _PublisherElements.Iterator.next(),  v3,  (uint64_t)&async function pointer to partial apply for closure #2 in _PublisherElements.Iterator.next(),  (uint64_t)v4,  v10);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v1 = *(void *)(*v0 + 48);
  uint64_t v2 = *(void *)(*v0 + 40);
  uint64_t v4 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 56));
  swift_release(v2);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t _PublisherElements.Iterator.Inner.lock.getter()
{
  return *(void *)(v0 + 16);
}

uint64_t _PublisherElements.Iterator.Inner.state.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1 + 4;
  swift_beginAccess(v3, v8, 0LL, 0LL);
  uint64_t v6 = type metadata accessor for _PublisherElements.Iterator.Inner.State( 0LL,  *(void *)(v4 + 80),  *(void *)(v4 + 88),  v5);
  return (*(uint64_t (**)(uint64_t, void *, uint64_t))(*(void *)(v6 - 8) + 16LL))(a1, v3, v6);
}

uint64_t _PublisherElements.Iterator.Inner.state.setter(uint64_t a1)
{
  uint64_t v4 = *v1;
  uint64_t v3 = v1 + 4;
  swift_beginAccess(v3, v8, 33LL, 0LL);
  uint64_t v6 = type metadata accessor for _PublisherElements.Iterator.Inner.State( 0LL,  *(void *)(v4 + 80),  *(void *)(v4 + 88),  v5);
  (*(void (**)(void *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40LL))(v3, a1, v6);
  return swift_endAccess(v8);
}

uint64_t _PublisherElements.Iterator.Inner.pendingDemand.getter()
{
  return *(void *)(v0 + 72);
}

uint64_t _PublisherElements.Iterator.Inner.pendingDemand.setter(uint64_t a1)
{
  uint64_t result = swift_beginAccess(v1 + 72, v4, 1LL, 0LL);
  *(void *)(v1 + 72) = a1;
  return result;
}

uint64_t (*_PublisherElements.Iterator.Inner.pendingDemand.modify(uint64_t a1))()
{
  return NearbyInvitationAdvertiser.listeners.modify;
}

uint64_t _PublisherElements.Iterator.Inner.__allocating_init()()
{
  uint64_t v1 = swift_allocObject(v0, 80LL, 7LL);
  _PublisherElements.Iterator.Inner.init()();
  return v1;
}

uint64_t *_PublisherElements.Iterator.Inner.init()()
{
  uint64_t v1 = *v0;
  v0[2] = swift_slowAlloc(4LL, -1LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  *(void *)(v1 + 88),  *(void *)(v1 + 80),  &protocol requirements base descriptor for Publisher,  &associated type descriptor for Publisher.Output);
  uint64_t v3 = type metadata accessor for Optional(255LL, AssociatedTypeWitness);
  uint64_t v4 = type metadata accessor for UnsafeContinuation( 0LL,  v3,  &type metadata for Never,  &protocol witness table for Never);
  v0[3] = Array.init()(v4);
  *((_OWORD *)v0 + 2) = 0u;
  *((_OWORD *)v0 + 3) = 0u;
  v0[8] = 0LL;
  v0[9] = static Subscribers.Demand.none.getter();
  *(_DWORD *)v0[2] = 0;
  return v0;
}

uint64_t *_PublisherElements.Iterator.Inner.deinit()
{
  uint64_t v1 = *v0;
  swift_slowDealloc(v0[2], -1LL, -1LL);
  swift_bridgeObjectRelease(v0[3]);
  uint64_t v3 = type metadata accessor for _PublisherElements.Iterator.Inner.State( 0LL,  *(void *)(v1 + 80),  *(void *)(v1 + 88),  v2);
  (*(void (**)(uint64_t *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v0 + 4, v3);
  return v0;
}

uint64_t _PublisherElements.Iterator.Inner.__deallocating_deinit()
{
  return swift_deallocClassInstance(v0, 80LL, 7LL);
}

uint64_t _PublisherElements.Iterator.Inner.receive(subscription:)(void *a1)
{
  uint64_t v3 = *v1;
  uint64_t v4 = (os_unfair_lock_s *)v1[2];
  os_unfair_lock_lock(v4);
  swift_beginAccess(v1 + 4, v26, 0LL, 0LL);
  uint64_t v6 = type metadata accessor for _PublisherElements.Iterator.Inner.State( 0LL,  *(void *)(v3 + 80),  *(void *)(v3 + 88),  v5);
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v7 + 16))(v24, v1 + 4, v6);
  uint64_t v8 = v25;
  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v24, v6);
  if (v8)
  {
    os_unfair_lock_unlock(v4);
    uint64_t v10 = a1[3];
    uint64_t v9 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v10);
    return dispatch thunk of Cancellable.cancel()(v10, *(void *)(v9 + 8));
  }

  else
  {
    outlined init with copy of PseudonymProtocol((uint64_t)a1, (uint64_t)v24);
    swift_beginAccess(v1 + 4, v23, 33LL, 0LL);
    (*(void (**)(uint64_t *, _BYTE *, uint64_t))(v7 + 40))(v1 + 4, v24, v6);
    swift_endAccess(v23);
    uint64_t v12 = swift_beginAccess(v1 + 9, v24, 1LL, 0LL);
    unint64_t v13 = v1[9];
    v1[9] = static Subscribers.Demand.none.getter(v12);
    os_unfair_lock_unlock(v4);
    unint64_t v15 = static Subscribers.Demand.none.getter(v14);
    uint64_t v16 = static Subscribers.Demand.unlimited.getter(v15);
    uint64_t result = static Subscribers.Demand.== infix(_:_:)(v16, v13);
    if ((result & 1) == 0
      || (uint64_t v17 = static Subscribers.Demand.unlimited.getter(result),
          uint64_t result = static Subscribers.Demand.== infix(_:_:)(v17, v15),
          (result & 1) == 0))
    {
      uint64_t v18 = static Subscribers.Demand.unlimited.getter(result);
      uint64_t v19 = static Subscribers.Demand.== infix(_:_:)(v18, v13);
      if ((v19 & 1) != 0
        || (uint64_t v20 = static Subscribers.Demand.unlimited.getter(v19),
            uint64_t result = static Subscribers.Demand.== infix(_:_:)(v20, v15),
            (result & 1) == 0)
        && v15 < v13)
      {
        uint64_t v21 = a1[3];
        uint64_t v22 = a1[4];
        __swift_project_boxed_opaque_existential_1(a1, v21);
        return dispatch thunk of Subscription.request(_:)(v13, v21, v22);
      }
    }
  }

  return result;
}

uint64_t _PublisherElements.Iterator.Inner.receive(_:)(uint64_t a1)
{
  uint64_t v4 = *(void *)(*v1 + 80LL);
  uint64_t v3 = *(void *)(*v1 + 88LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v3,  v4,  &protocol requirements base descriptor for Publisher,  &associated type descriptor for Publisher.Output);
  uint64_t v6 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v32 - v9;
  uint64_t v11 = v1[2];
  os_unfair_lock_lock((os_unfair_lock_t)v11);
  swift_beginAccess(v1 + 4, v38, 0LL, 0LL);
  uint64_t v13 = type metadata accessor for _PublisherElements.Iterator.Inner.State(0LL, v4, v3, v12);
  uint64_t v32 = *(void *)(v13 - 8);
  (*(void (**)(_BYTE *, void *, uint64_t))(v32 + 16))(v36, v1 + 4, v13);
  uint64_t v14 = (uint64_t)(v1 + 3);
  unint64_t v15 = v35;
  uint64_t v16 = (uint64_t)(v1 + 3);
  if (v37 >= 2)
  {
LABEL_11:
    swift_beginAccess(v16, v15, 0LL, 0LL);
    v34[0] = *(void *)v14;
    uint64_t v22 = type metadata accessor for UnsafeContinuation( 255LL,  v6,  &type metadata for Never,  &protocol witness table for Never);
    uint64_t v23 = type metadata accessor for Array(0LL, v22);
    uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for [A], v23);
    if ((Collection.isEmpty.getter(v23, WitnessTable) & 1) != 0)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)v11);
    }

    else
    {
      swift_beginAccess(v14, v34, 33LL, 0LL);
      uint64_t v26 = swift_getWitnessTable(&protocol conformance descriptor for [A], v23);
      RangeReplaceableCollection.removeFirst()(&v33, v23, v26);
      swift_endAccess(v34);
      uint64_t v27 = v33;
      os_unfair_lock_unlock((os_unfair_lock_t)v11);
      uint64_t v28 = *(void *)(AssociatedTypeWitness - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v10, a1, AssociatedTypeWitness);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v28 + 56))(v10, 0LL, 1LL, AssociatedTypeWitness);
      (*(void (**)(void, char *, uint64_t))(v7 + 32))(*(void *)(*(void *)(v27 + 64) + 40LL), v10, v6);
      uint64_t v25 = swift_continuation_resume(v27);
    }
  }

  else
  {
    swift_beginAccess(v16, v35, 0LL, 0LL);
    a1 = *(void *)v14;
    swift_beginAccess(v1 + 3, v34, 33LL, 0LL);
    uint64_t v17 = type metadata accessor for UnsafeContinuation( 255LL,  v6,  &type metadata for Never,  &protocol witness table for Never);
    type metadata accessor for Array(0LL, v17);
    swift_bridgeObjectRetain(a1);
    Array.removeAll(keepingCapacity:)(0);
    swift_endAccess(v34);
    os_unfair_lock_unlock((os_unfair_lock_t)v11);
    if (Array.endIndex.getter(a1, v17))
    {
      uint64_t v14 = 4LL;
      do
      {
        uint64_t v18 = v14 - 4;
        Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
        uint64_t v16 = Array._checkSubscript(_:wasNativeTypeChecked:)(v14 - 4, IsNativeType, a1, v17);
        if (IsNativeType)
        {
          uint64_t v11 = *(void *)(a1 + 8 * v14);
          BOOL v20 = __OFADD__(v18, 1LL);
          uint64_t v21 = v14 - 3;
          if (v20) {
            goto LABEL_10;
          }
        }

        else
        {
          uint64_t v11 = _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, a1, v17);
          uint64_t v16 = swift_unknownObjectRelease(v11);
          BOOL v20 = __OFADD__(v18, 1LL);
          uint64_t v21 = v14 - 3;
          if (v20)
          {
LABEL_10:
            __break(1u);
            goto LABEL_11;
          }
        }

        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v10,  1LL,  1LL,  AssociatedTypeWitness);
        (*(void (**)(void, char *, uint64_t))(v7 + 32))(*(void *)(*(void *)(v11 + 64) + 40LL), v10, v6);
        swift_continuation_resume(v11);
        ++v14;
      }

      while (v21 != Array.endIndex.getter(a1, v17));
    }

    uint64_t v25 = swift_bridgeObjectRelease(a1);
  }

  uint64_t v29 = v32;
  uint64_t v30 = static Subscribers.Demand.none.getter(v25);
  (*(void (**)(_BYTE *, uint64_t))(v29 + 8))(v36, v13);
  return v30;
}

Swift::Void __swiftcall _PublisherElements.Iterator.Inner.cancel()()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void *)(*v0 + 88LL);
  uint64_t v63 = *(void *)(*v0 + 80LL);
  uint64_t v64 = v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v2,  v63,  &protocol requirements base descriptor for Publisher,  &associated type descriptor for Publisher.Output);
  uint64_t v4 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v54 - v7;
  os_unfair_lock_t v61 = (os_unfair_lock_t)v0[2];
  os_unfair_lock_lock(v61);
  uint64_t v9 = v0 + 3;
  swift_beginAccess(v9, v80, 0LL, 0LL);
  uint64_t v10 = v1[3];
  swift_beginAccess(v9, &v77, 33LL, 0LL);
  uint64_t v11 = type metadata accessor for UnsafeContinuation( 255LL,  v4,  &type metadata for Never,  &protocol witness table for Never);
  type metadata accessor for Array(0LL, v11);
  swift_bridgeObjectRetain(v10);
  Array.removeAll(keepingCapacity:)(0);
  swift_endAccess(&v77);
  swift_beginAccess(v1 + 4, v79, 0LL, 0LL);
  uint64_t v13 = type metadata accessor for _PublisherElements.Iterator.Inner.State(0LL, v63, v64, v12);
  uint64_t v63 = *(void *)(v13 - 8);
  uint64_t v64 = v13;
  uint64_t v14 = *(void (**)(__int128 *, void *, uint64_t))(v63 + 16);
  v14(&v77, v1 + 4, v13);
  id v62 = v1 + 4;
  if (v78 >= 2)
  {
    outlined init with take of PseudonymProtocol(&v77, (uint64_t)&v74);
    if (one-time initialization token for default != -1) {
      swift_once(&one-time initialization token for default, one-time initialization function for default);
    }
    uint64_t v29 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v29, (uint64_t)static Log.default);
    uint64_t v30 = outlined init with copy of PseudonymProtocol((uint64_t)&v74, (uint64_t)v72);
    unint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
    int v32 = static os_log_type_t.default.getter();
    uint64_t v60 = v31;
    if (os_log_type_enabled(v31, (os_log_type_t)v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v34 = (uint8_t *)swift_slowAlloc(32LL, -1LL);
      uint64_t v71 = v34;
      *(_DWORD *)uint64_t v33 = 136315138;
      outlined init with copy of PseudonymProtocol((uint64_t)v72, (uint64_t)&v69);
      outlined init with copy of Subscription?((uint64_t)&v69, (uint64_t)&v67);
      LODWORD(v59) = v32;
      uint64_t v58 = v34;
      if (v68)
      {
        outlined init with take of PseudonymProtocol(&v67, (uint64_t)v66);
        outlined init with copy of PseudonymProtocol((uint64_t)v66, (uint64_t)v65);
        uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Subscription);
        uint64_t v57 = String.init<A>(reflecting:)(v65, v35);
        unint64_t v37 = v36;
        __swift_destroy_boxed_opaque_existential_0Tm(v66);
      }

      else
      {
        unint64_t v37 = 0xE300000000000000LL;
        uint64_t v57 = 7104878LL;
      }

      outlined destroy of Subscription?((uint64_t)&v69);
      uint64_t v69 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v57, v37, (uint64_t *)&v71);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v69, &v70, v33 + 4, v33 + 12);
      swift_bridgeObjectRelease(v37);
      __swift_destroy_boxed_opaque_existential_0Tm(v72);
      uint64_t v44 = v60;
      _os_log_impl( (void *)&_mh_execute_header,  v60,  (os_log_type_t)v59,  "Handling cancellation by terminating upstream subscription: %s",  v33,  0xCu);
      uint64_t v45 = v58;
      swift_arrayDestroy(v58, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v45, -1LL, -1LL);
      swift_slowDealloc(v33, -1LL, -1LL);
    }

    else
    {
      __swift_destroy_boxed_opaque_existential_0Tm(v72);
    }

    uint64_t v46 = v64;
    memset(v72, 0, sizeof(v72));
    __int128 v73 = xmmword_1000AC4E0;
    NSString v47 = v62;
    swift_beginAccess(v62, &v69, 33LL, 0LL);
    (*(void (**)(void *, uint64_t *, uint64_t))(v63 + 40))(v47, v72, v46);
    swift_endAccess(&v69);
    os_unfair_lock_unlock(v61);
    __int128 v48 = v76;
    __swift_project_boxed_opaque_existential_1(&v74, v76);
    dispatch thunk of Cancellable.cancel()(v48, *(void *)(*((void *)&v48 + 1) + 8LL));
    if (Array.endIndex.getter(v10, v11))
    {
      uint64_t v49 = 4LL;
      do
      {
        uint64_t v50 = v49 - 4;
        Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
        Array._checkSubscript(_:wasNativeTypeChecked:)(v49 - 4, IsNativeType, v10, v11);
        if (IsNativeType)
        {
          uint64_t v52 = *(void *)(v10 + 8 * v49);
          BOOL v42 = __OFADD__(v50, 1LL);
          uint64_t v53 = v49 - 3;
          if (v42) {
            goto LABEL_33;
          }
        }

        else
        {
          uint64_t v52 = _ArrayBuffer._getElementSlowPath(_:)(v49 - 4, v10, v11);
          swift_unknownObjectRelease(v52);
          BOOL v42 = __OFADD__(v50, 1LL);
          uint64_t v53 = v49 - 3;
          if (v42)
          {
LABEL_33:
            __break(1u);
            break;
          }
        }

        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v8,  1LL,  1LL,  AssociatedTypeWitness);
        (*(void (**)(void, char *, uint64_t))(v5 + 32))(*(void *)(*(void *)(v52 + 64) + 40LL), v8, v4);
        swift_continuation_resume(v52);
        ++v49;
      }

      while (v53 != Array.endIndex.getter(v10, v11));
    }

    swift_bridgeObjectRelease(v10);
    __swift_destroy_boxed_opaque_existential_0Tm(&v74);
  }

  else
  {
    if (one-time initialization token for default != -1) {
      swift_once(&one-time initialization token for default, one-time initialization function for default);
    }
    uint64_t v15 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v15, (uint64_t)static Log.default);
    uint64_t v16 = swift_retain_n(v1);
    uint64_t v17 = (os_log_s *)Logger.logObject.getter(v16);
    os_log_type_t v18 = static os_log_type_t.default.getter();
    LODWORD(v60) = v18;
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v58 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v57 = swift_slowAlloc(32LL, -1LL);
      v72[0] = v57;
      unint64_t v59 = v17;
      uint64_t v19 = v58;
      BOOL v20 = v58;
      *(_DWORD *)uint64_t v58 = 136315138;
      uint64_t v55 = v19 + 4;
      uint64_t v56 = v20 + 12;
      uint64_t v21 = v64;
      v14((__int128 *)&v74, v62, v64);
      uint64_t v54 = >> prefix<A>(_:)((uint64_t)&v74, v21);
      unint64_t v23 = v22;
      uint64_t v24 = type metadata accessor for Optional(0LL, v21);
      (*(void (**)(uint64_t *, uint64_t))(*(void *)(v24 - 8) + 8LL))(&v74, v24);
      unint64_t v25 = v23;
      uint64_t v74 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v54, v23, v72);
      uint64_t v26 = v62;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, v75, v55, v56);
      swift_release_n(v1);
      swift_bridgeObjectRelease(v25);
      uint64_t v27 = v58;
      _os_log_impl( (void *)&_mh_execute_header,  v59,  (os_log_type_t)v60,  "Terminating sequence from state: %s",  v58,  0xCu);
      uint64_t v28 = v57;
      swift_arrayDestroy(v57, 1LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1LL, -1LL);
      swift_slowDealloc(v27, -1LL, -1LL);
    }

    else
    {

      swift_release_n(v1);
      uint64_t v26 = v62;
    }

    uint64_t v74 = 0LL;
    v75[0] = 0LL;
    v75[1] = 0LL;
    __int128 v76 = xmmword_1000AC4E0;
    swift_beginAccess(v26, v72, 33LL, 0LL);
    (*(void (**)(void *, uint64_t *, uint64_t))(v63 + 40))(v26, &v74, v64);
    swift_endAccess(v72);
    os_unfair_lock_unlock(v61);
    if (Array.endIndex.getter(v10, v11))
    {
      uint64_t v38 = 4LL;
      do
      {
        uint64_t v39 = v38 - 4;
        Swift::Bool v40 = Array._hoistableIsNativeTypeChecked()();
        Array._checkSubscript(_:wasNativeTypeChecked:)(v38 - 4, v40, v10, v11);
        if (v40)
        {
          uint64_t v41 = *(void *)(v10 + 8 * v38);
          BOOL v42 = __OFADD__(v39, 1LL);
          uint64_t v43 = v38 - 3;
          if (v42) {
            goto LABEL_20;
          }
        }

        else
        {
          uint64_t v41 = _ArrayBuffer._getElementSlowPath(_:)(v38 - 4, v10, v11);
          swift_unknownObjectRelease(v41);
          BOOL v42 = __OFADD__(v39, 1LL);
          uint64_t v43 = v38 - 3;
          if (v42)
          {
LABEL_20:
            __break(1u);
            break;
          }
        }

        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v8,  1LL,  1LL,  AssociatedTypeWitness);
        (*(void (**)(void, char *, uint64_t))(v5 + 32))(*(void *)(*(void *)(v41 + 64) + 40LL), v8, v4);
        swift_continuation_resume(v41);
        ++v38;
      }

      while (v43 != Array.endIndex.getter(v10, v11));
    }

    swift_bridgeObjectRelease(v10);
    (*(void (**)(__int128 *, uint64_t))(v63 + 8))(&v77, v64);
  }

uint64_t _PublisherElements.Iterator.Inner.next()(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  v2[4] = *v1;
  return swift_task_switch(_PublisherElements.Iterator.Inner.next(), 0LL, 0LL);
}

uint64_t _PublisherElements.Iterator.Inner.next()()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)swift_task_alloc(unk_1000D79D4);
  v0[5] = v2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  *(void *)(v1 + 88),  *(void *)(v1 + 80),  &protocol requirements base descriptor for Publisher,  &associated type descriptor for Publisher.Output);
  uint64_t v4 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  *uint64_t v2 = v0;
  v2[1] = _PublisherElements.Iterator.Inner.next();
  return ((uint64_t (*)(void, void, void, void (*)(uint64_t), void, uint64_t))v6)( v0[2],  0LL,  0LL,  partial apply for closure #1 in _PublisherElements.Iterator.Inner.next(),  v0[3],  v4);
}

{
  uint64_t *v0;
  uint64_t v2;
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 40));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void closure #1 in _PublisherElements.Iterator.Inner.next()(uint64_t a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(*a2 + 80);
  uint64_t v4 = *(void *)(*a2 + 88);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v4,  v5,  &protocol requirements base descriptor for Publisher,  &associated type descriptor for Publisher.Output);
  uint64_t v7 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = (char *)&v27[-1] - v10;
  uint64_t v12 = (os_unfair_lock_s *)a2[2];
  os_unfair_lock_lock(v12);
  swift_beginAccess(a2 + 4, v34, 0LL, 0LL);
  uint64_t v14 = type metadata accessor for _PublisherElements.Iterator.Inner.State(0LL, v5, v4, v13);
  (*(void (**)(__int128 *, uint64_t *, uint64_t))(*(void *)(v14 - 8) + 16LL))(&v32, a2 + 4, v14);
  if (!v33)
  {
    v27[0] = a1;
    swift_beginAccess(a2 + 3, v29, 33LL, 0LL);
    uint64_t v15 = type metadata accessor for UnsafeContinuation( 255LL,  v7,  &type metadata for Never,  &protocol witness table for Never);
    uint64_t v16 = type metadata accessor for Array(0LL, v15);
    Array.append(_:)(v27, v16);
    swift_endAccess(v29);
    uint64_t v17 = a2 + 9;
    uint64_t v18 = swift_beginAccess(a2 + 9, v29, 33LL, 0LL);
    uint64_t v19 = a2[9];
    uint64_t v20 = static Subscribers.Demand.unlimited.getter(v18);
    uint64_t v21 = static Subscribers.Demand.== infix(_:_:)(v19, v20);
    if ((v21 & 1) != 0) {
      goto LABEL_8;
    }
    if (v19 < 0)
    {
      __break(1u);
      return;
    }

    uint64_t v21 = v19 + 1;
    if (__OFADD__(v19, 1LL)) {
LABEL_8:
    }
      uint64_t v21 = static Subscribers.Demand.unlimited.getter(v21);
    *uint64_t v17 = v21;
    swift_endAccess(v29);
    os_unfair_lock_unlock(v12);
    return;
  }

  if (v33 == 1)
  {
    os_unfair_lock_unlock(v12);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v11,  1LL,  1LL,  AssociatedTypeWitness);
    (*(void (**)(void, char *, uint64_t))(v8 + 32))(*(void *)(*(void *)(a1 + 64) + 40LL), v11, v7);
    swift_continuation_resume(a1);
  }

  else
  {
    outlined init with take of PseudonymProtocol(&v32, (uint64_t)v29);
    uint64_t v28 = a1;
    swift_beginAccess(a2 + 3, v27, 33LL, 0LL);
    uint64_t v22 = type metadata accessor for UnsafeContinuation( 255LL,  v7,  &type metadata for Never,  &protocol witness table for Never);
    uint64_t v23 = type metadata accessor for Array(0LL, v22);
    Array.append(_:)(&v28, v23);
    swift_endAccess(v27);
    os_unfair_lock_unlock(v12);
    uint64_t v24 = v30;
    uint64_t v25 = v31;
    __swift_project_boxed_opaque_existential_1(v29, v30);
    dispatch thunk of Subscription.request(_:)(1LL, v24, v25);
    __swift_destroy_boxed_opaque_existential_0Tm(v29);
  }

uint64_t withUnsafeContinuation<A>(isolation:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[11] = a4;
  v5[12] = a5;
  v5[10] = a1;
  if (a2)
  {
    uint64_t ObjectType = swift_getObjectType(a2);
    uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, a3);
    uint64_t v10 = v9;
  }

  else
  {
    uint64_t v8 = 0LL;
    uint64_t v10 = 0LL;
  }

  return swift_task_switch(withUnsafeContinuation<A>(isolation:_:), v8, v10);
}

uint64_t withUnsafeContinuation<A>(isolation:_:)()
{
  uint64_t v1 = (void (*)(uint64_t))v0[11];
  v0[7] = v0[10];
  v0[2] = v0;
  v0[3] = withUnsafeContinuation<A>(isolation:_:);
  uint64_t v2 = swift_continuation_init(v0 + 2, 0LL);
  v1(v2);
  return swift_continuation_await(v0 + 2);
}

{
  uint64_t *v0;
  uint64_t v2;
  uint64_t v2 = *v0;
  return (*(uint64_t (**)(void))(*v0 + 8))();
}

uint64_t protocol witness for Subscriber.receive(subscription:) in conformance _PublisherElements<A>.Iterator.Inner( void *a1)
{
  return _PublisherElements.Iterator.Inner.receive(subscription:)(a1);
}

uint64_t protocol witness for Subscriber.receive(_:) in conformance _PublisherElements<A>.Iterator.Inner( uint64_t a1)
{
  return _PublisherElements.Iterator.Inner.receive(_:)(a1);
}

uint64_t protocol witness for Subscriber.receive(completion:) in conformance _PublisherElements<A>.Iterator.Inner()
{
  return specialized _PublisherElements.Iterator.Inner.receive(completion:)();
}

void protocol witness for Cancellable.cancel() in conformance _PublisherElements<A>.Iterator.Inner()
{
}

uint64_t protocol witness for CustomCombineIdentifierConvertible.combineIdentifier.getter in conformance _PublisherElements<A>.Iterator.Inner()
{
  return CustomCombineIdentifierConvertible<>.combineIdentifier.getter();
}

uint64_t _PublisherElements.Iterator.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = specialized _PublisherElements.Iterator.init(_:)(a1, a2, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a2 - 8) + 8LL))(a1, a2);
  return v6;
}

uint64_t closure #2 in _PublisherElements.Iterator.next()(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  return swift_task_switch(closure #2 in _PublisherElements.Iterator.next(), 0LL, 0LL);
}

uint64_t closure #2 in _PublisherElements.Iterator.next()()
{
  uint64_t v1 = **(void ***)(v0 + 24);
  *(void *)(v0 + 32) = v1;
  uint64_t v2 = dword_1000D79CC;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc(v2);
  *(void *)(v0 + 40) = v3;
  *uint64_t v3 = v0;
  v3[1] = closure #2 in _PublisherElements.Iterator.next();
  v3[2] = *(void *)(v0 + 16);
  v3[3] = v1;
  v3[4] = *v1;
  return swift_task_switch(_PublisherElements.Iterator.Inner.next(), 0LL, 0LL);
}

{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v1 = *(void *)(*v0 + 32);
  uint64_t v3 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 40));
  swift_release(v1);
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t withTaskCancellationHandler<A>(handler:operation:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = (void *)swift_task_alloc(unk_1000D7BEC);
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = partial apply for closure #1 in NearbyInvitationAdvertiser.stopAdvertising();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t))v15)( a1,  a4,  a5,  a2,  a3,  0LL,  0LL,  a6);
}

uint64_t protocol witness for AsyncIteratorProtocol.next() in conformance _PublisherElements<A>.Iterator( uint64_t a1, uint64_t a2)
{
  uint64_t v6 = (void *)swift_task_alloc(dword_1000D79AC);
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tg5TQ0_;
  v6[3] = a2;
  v6[4] = v2;
  v6[2] = a1;
  return swift_task_switch(_PublisherElements.Iterator.next(), 0LL, 0LL);
}

uint64_t _s44com_apple_SharePlay_NearbyInvitationsService18_PublisherElementsV8IteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTW( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)swift_task_alloc(_sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTu[1]);
  *(void *)(v6 + 16) = v12;
  void *v12 = v6;
  v12[1] = _s44com_apple_SharePlay_NearbyInvitationsService18_PublisherElementsV8IteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_;
  return _sScIsE4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKF(a1, a2, a3, a5, a6);
}

uint64_t _s44com_apple_SharePlay_NearbyInvitationsService18_PublisherElementsV8IteratorVyx_GScIAAScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTWTQ0_()
{
  uint64_t v2 = *v0;
  swift_task_dealloc(*(void *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t protocol witness for AsyncSequence.makeAsyncIterator() in conformance _PublisherElements<A>@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v8 = _PublisherElements.makeAsyncIterator()(a1, a2, a3, a4);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v5, a1);
  *a5 = v8;
  return result;
}

uint64_t withTaskCancellationHandler<A>(operation:onCancel:isolation:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v17 = (void *)swift_task_alloc(async function pointer to withTaskCancellationHandler<A>(operation:onCancel:isolation:)[1]);
  *(void *)(v8 + 16) = v17;
  *uint64_t v17 = v8;
  v17[1] = partial apply for closure #1 in NearbyInvitationsAdvertiser.start();
  return withTaskCancellationHandler<A>(operation:onCancel:isolation:)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t specialized _PublisherElements.Iterator.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = type metadata accessor for _PublisherElements.Iterator.Inner(0LL, a2, a3, a4);
  uint64_t v7 = swift_allocObject(v6, 80LL, 7LL);
  _PublisherElements.Iterator.Inner.init()();
  uint64_t v10 = v7;
  uint64_t WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for _PublisherElements<A>.Iterator.Inner, v6);
  Publisher.subscribe<A>(_:)(&v10, a2, v6, a3, WitnessTable);
  return v7;
}

uint64_t partial apply for closure #2 in _PublisherElements.Iterator.next()(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc(dword_1000D79B4);
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = partial apply for closure #1 in NearbyInvitationAdvertiser.stopAdvertising();
  void v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch(closure #2 in _PublisherElements.Iterator.next(), 0LL, 0LL);
}

uint64_t type metadata accessor for _PublisherElements.Iterator.Inner.State( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for _PublisherElements.Iterator.Inner.State);
}

uint64_t specialized _PublisherElements.Iterator.Inner.receive(completion:)()
{
  uint64_t v2 = *(void *)(*v0 + 80LL);
  uint64_t v1 = *(void *)(*v0 + 88LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness( 255LL,  v1,  v2,  &protocol requirements base descriptor for Publisher,  &associated type descriptor for Publisher.Output);
  uint64_t v4 = type metadata accessor for Optional(0LL, AssociatedTypeWitness);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = &v21[-v7];
  uint64_t v9 = (os_unfair_lock_s *)v0[2];
  os_unfair_lock_lock(v9);
  memset(v22, 0, sizeof(v22));
  __int128 v23 = xmmword_1000AC4E0;
  swift_beginAccess(v0 + 4, v21, 33LL, 0LL);
  uint64_t v11 = type metadata accessor for _PublisherElements.Iterator.Inner.State(0LL, v2, v1, v10);
  (*(void (**)(void *, void *, uint64_t))(*(void *)(v11 - 8) + 40LL))(v0 + 4, v22, v11);
  swift_endAccess(v21);
  swift_beginAccess(v0 + 3, v22, 0LL, 0LL);
  uint64_t v12 = v0[3];
  swift_beginAccess(v0 + 3, v21, 33LL, 0LL);
  uint64_t v13 = type metadata accessor for UnsafeContinuation( 255LL,  v4,  &type metadata for Never,  &protocol witness table for Never);
  type metadata accessor for Array(0LL, v13);
  swift_bridgeObjectRetain(v12);
  Array.removeAll(keepingCapacity:)(0);
  swift_endAccess(v21);
  os_unfair_lock_unlock(v9);
  if (Array.endIndex.getter(v12, v13))
  {
    uint64_t v14 = 4LL;
    do
    {
      uint64_t v15 = v14 - 4;
      Swift::Bool IsNativeType = Array._hoistableIsNativeTypeChecked()();
      Array._checkSubscript(_:wasNativeTypeChecked:)(v14 - 4, IsNativeType, v12, v13);
      if (IsNativeType)
      {
        uint64_t v17 = *(void *)(v12 + 8 * v14);
        BOOL v18 = __OFADD__(v15, 1LL);
        uint64_t v19 = v14 - 3;
        if (v18) {
          goto LABEL_9;
        }
      }

      else
      {
        uint64_t v17 = _ArrayBuffer._getElementSlowPath(_:)(v14 - 4, v12, v13);
        swift_unknownObjectRelease(v17);
        BOOL v18 = __OFADD__(v15, 1LL);
        uint64_t v19 = v14 - 3;
        if (v18)
        {
LABEL_9:
          __break(1u);
          return swift_bridgeObjectRelease(v12);
        }
      }

      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v8,  1LL,  1LL,  AssociatedTypeWitness);
      (*(void (**)(void, _BYTE *, uint64_t))(v5 + 32))(*(void *)(*(void *)(v17 + 64) + 40LL), v8, v4);
      swift_continuation_resume(v17);
      ++v14;
    }

    while (v19 != Array.endIndex.getter(v12, v13));
  }

  return swift_bridgeObjectRelease(v12);
}

uint64_t outlined init with copy of Subscription?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Subscription?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Subscription?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Subscription?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

void partial apply for closure #1 in _PublisherElements.Iterator.Inner.next()(uint64_t a1)
{
}

uint64_t base witness table accessor for CustomCombineIdentifierConvertible in _PublisherElements<A>.Iterator.Inner( uint64_t a1)
{
  return swift_getWitnessTable(&protocol conformance descriptor for _PublisherElements<A>.Iterator.Inner, a1);
}

uint64_t associated type witness table accessor for AsyncSequence.AsyncIterator : AsyncIteratorProtocol in _PublisherElements<A>( uint64_t a1)
{
  return swift_getWitnessTable(&protocol conformance descriptor for _PublisherElements<A>.Iterator, a1);
}

uint64_t type metadata completion function for _PublisherElements(uint64_t a1)
{
  uint64_t result = swift_checkMetadataState(319LL, *(void *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    uint64_t v4 = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 0LL, 1LL, &v4, a1 + 32);
    return 0LL;
  }

  return result;
}

uint64_t getEnumTagSinglePayload for _PublisherElements(uint64_t a1, unsigned int a2, uint64_t a3)
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
  return ((uint64_t (*)(void))((char *)&loc_100091A34 + 4 * byte_1000AE3F0[(v7 - 1)]))();
}

void storeEnumTagSinglePayload for _PublisherElements( _WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
        unsigned int v11 = &dword_100000004;
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
      unsigned int v11 = &_mh_execute_header.magic + 1;
    }
  }

  else
  {
    unsigned int v11 = 0;
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

uint64_t type metadata accessor for _PublisherElements(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _PublisherElements);
}

uint64_t type metadata accessor for _PublisherElements.Iterator( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for _PublisherElements.Iterator);
}

uint64_t type metadata completion function for _PublisherElements.Iterator.Inner(uint64_t a1)
{
  v2[0] = (char *)&value witness table for Builtin.RawPointer + 64;
  v2[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
  v2[2] = "(";
  v2[3] = (char *)&value witness table for Builtin.Int64 + 64;
  return swift_initClassMetadata2(a1, 0LL, 4LL, v2, a1 + 96);
}

uint64_t type metadata accessor for _PublisherElements.Iterator.Inner( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for _PublisherElements.Iterator.Inner);
}

void *destroy for _PublisherElements.Iterator.Inner.State(void *a1)
{
  if (a1[3] >= 0xFFFFFFFFuLL) {
    return (void *)__swift_destroy_boxed_opaque_existential_0Tm(a1);
  }
  return a1;
}

uint64_t initializeWithCopy for _PublisherElements.Iterator.Inner.State(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 24);
  if (v3 < 0xFFFFFFFF)
  {
    __int128 v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
  }

  else
  {
    uint64_t v4 = *(void *)(a2 + 32);
    *(void *)(a1 + 24) = v3;
    *(void *)(a1 + 32) = v4;
    (**(void (***)(uint64_t))(v3 - 8))(a1);
  }

  return a1;
}

uint64_t assignWithCopy for _PublisherElements.Iterator.Inner.State(uint64_t a1, __int128 *a2)
{
  unint64_t v4 = *((void *)a2 + 3);
  if (*(void *)(a1 + 24) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(void *)(a1 + 24) = v4;
      *(void *)(a1 + 32) = *((void *)a2 + 4);
      (**(void (***)(uint64_t, __int128 *))(v4 - 8))(a1, a2);
      return a1;
    }

void *__swift_assign_boxed_opaque_existential_1(void *result, void *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
    uint64_t v4 = result[3];
    uint64_t v5 = a2[3];
    if (v4 == v5)
    {
      uint64_t v9 = *(void *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        uint64_t v11 = *result;
        uint64_t v12 = *a2;
        swift_retain(*a2);
        uint64_t result = (void *)swift_release(v11);
        *unint64_t v3 = v12;
      }

      else
      {
        return (void *)(*(uint64_t (**)(void *, void *, void))(v9 + 24))(result, a2, result[3]);
      }
    }

    else
    {
      result[3] = v5;
      result[4] = a2[4];
      uint64_t v6 = *(void *)(v4 - 8);
      uint64_t v7 = *(void *)(v5 - 8);
      int v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        uint64_t v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v14 = *a2;
          *unint64_t v3 = *a2;
          swift_retain(v14);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(result, a2, v5);
        }

        return (void *)swift_release(v10);
      }

      else
      {
        (*(void (**)(_BYTE *, void *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          uint64_t v13 = *a2;
          *unint64_t v3 = *a2;
          swift_retain(v13);
        }

        else
        {
          (*(void (**)(void *, void *, uint64_t))(v7 + 16))(v3, a2, v5);
        }

        return (void *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }

  return result;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for _PublisherElements.Iterator.Inner.State(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 24) >= 0xFFFFFFFFuLL) {
    __swift_destroy_boxed_opaque_existential_0Tm((void *)a1);
  }
  __int128 v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for _PublisherElements.Iterator.Inner.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  unint64_t v3 = *(void *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0LL;
  }
}

uint64_t storeEnumTagSinglePayload for _PublisherElements.Iterator.Inner.State( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)(result + 32) = 0LL;
    *(_OWORD *)__n128 result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)__n128 result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 40) = 1;
    }
  }

  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(_BYTE *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)(result + 24) = a2 + 1;
    }
  }

  return result;
}

uint64_t getEnumTag for _PublisherElements.Iterator.Inner.State(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 24);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

double destructiveInjectEnumTag for _PublisherElements.Iterator.Inner.State(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    double result = 0.0;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
    *(void *)a1 = a2 ^ 0x80000000;
  }

  else if (a2)
  {
    *(void *)(a1 + 24) = (a2 - 1);
  }

  return result;
}

BOOL NearbyGroup_Member.hasTokenID.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for NearbyGroup_Member(0LL) + 24) + 8) != 0LL;
}

uint64_t type metadata accessor for NearbyGroup_Member(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Member,  (uint64_t)&nominal type descriptor for NearbyGroup_Member);
}

uint64_t NearbyGroup_Member.tokenID.getter()
{
  unint64_t v1 = (uint64_t *)(v0 + *(int *)(type metadata accessor for NearbyGroup_Member(0LL) + 24));
  uint64_t v2 = v1[1];
  if (v2) {
    uint64_t v3 = *v1;
  }
  else {
    uint64_t v3 = 0LL;
  }
  swift_bridgeObjectRetain(v2);
  return v3;
}

uint64_t NearbyGroup_Group.MemberAdded.member.setter(uint64_t a1)
{
  return NearbyGroup_Group.MemberAdded.member.setter(a1, type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t type metadata accessor for NearbyGroup_Group.MemberAdded(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.MemberAdded,  (uint64_t)&nominal type descriptor for NearbyGroup_Group.MemberAdded);
}

uint64_t NearbyGroup_Group.MemberRemoved.member.setter(uint64_t a1)
{
  return NearbyGroup_Group.MemberAdded.member.setter(a1, type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t NearbyGroup_Group.MemberAdded.member.setter(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = v2 + *(int *)(a2(0LL) + 24);
  outlined destroy of Any?(v4, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( a1,  v4,  type metadata accessor for NearbyGroup_Member);
  uint64_t v5 = type metadata accessor for NearbyGroup_Member(0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(v4, 0LL, 1LL, v5);
}

uint64_t type metadata accessor for NearbyGroup_Group.MemberRemoved(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.MemberRemoved,  (uint64_t)&nominal type descriptor for NearbyGroup_Group.MemberRemoved);
}

uint64_t NearbyGroup_Group.MemberAdded.member.getter@<X0>(void *a1@<X8>)
{
  return NearbyGroup_Group.MemberAdded.member.getter(type metadata accessor for NearbyGroup_Group.MemberAdded, a1);
}

uint64_t NearbyGroup_Group.MemberRemoved.member.getter@<X0>(void *a1@<X8>)
{
  return NearbyGroup_Group.MemberAdded.member.getter(type metadata accessor for NearbyGroup_Group.MemberRemoved, a1);
}

uint64_t NearbyGroup_Group.MemberAdded.member.getter@<X0>( uint64_t (*a1)(void)@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  __chkstk_darwin(v5, v6);
  int v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = a1(0LL);
  outlined init with copy of (String, Any)( v2 + *(int *)(v9 + 24),  (uint64_t)v8,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v10 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48LL))(v8, 1LL, v10);
  if ((_DWORD)v11 != 1) {
    return outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v8,  (uint64_t)a2,  type metadata accessor for NearbyGroup_Member);
  }
  *a2 = 0LL;
  a2[1] = 0xE000000000000000LL;
  UnknownStorage.init()(v11);
  uint64_t v12 = (void *)((char *)a2 + *(int *)(v10 + 24));
  void *v12 = 0LL;
  v12[1] = 0LL;
  return outlined destroy of Any?((uint64_t)v8, &demangling cache variable for type metadata for NearbyGroup_Member?);
}

uint64_t NearbyGroup_Member.init()@<X0>(void *a1@<X8>)
{
  *a1 = 0LL;
  a1[1] = 0xE000000000000000LL;
  uint64_t v2 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t result = UnknownStorage.init()(v2);
  uint64_t v4 = (void *)((char *)a1 + *(int *)(v2 + 24));
  *uint64_t v4 = 0LL;
  v4[1] = 0LL;
  return result;
}

uint64_t NearbyGroup_Member.tokenID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for NearbyGroup_Member(0LL) + 24));
  uint64_t result = swift_bridgeObjectRelease(v5[1]);
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

double key path getter for NearbyGroup_Member.tokenID : NearbyGroup_Member@<D0>( uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NearbyGroup_Member(0LL) + 24));
  unint64_t v4 = v3[1];
  if (v4)
  {
    uint64_t v5 = *v3;
    unint64_t v6 = v4;
  }

  else
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0xE000000000000000LL;
  }

  *a2 = v5;
  a2[1] = v6;
  *(void *)&double result = swift_bridgeObjectRetain(v4).n128_u64[0];
  return result;
}

uint64_t key path setter for NearbyGroup_Member.tokenID : NearbyGroup_Member(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = a1[1];
  unint64_t v4 = (void *)(a2 + *(int *)(type metadata accessor for NearbyGroup_Member(0LL) + 24));
  uint64_t v5 = v4[1];
  swift_bridgeObjectRetain(v2);
  uint64_t result = swift_bridgeObjectRelease(v5);
  *unint64_t v4 = v3;
  v4[1] = v2;
  return result;
}

uint64_t (*NearbyGroup_Member.tokenID.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  *(void *)(a1 + 16) = v1;
  uint64_t v3 = *(int *)(type metadata accessor for NearbyGroup_Member(0LL) + 24);
  *(_DWORD *)(a1 + 24) = v3;
  unint64_t v4 = (uint64_t *)(v1 + v3);
  unint64_t v5 = v4[1];
  if (v5)
  {
    uint64_t v6 = *v4;
    unint64_t v7 = v5;
  }

  else
  {
    uint64_t v6 = 0LL;
    unint64_t v7 = 0xE000000000000000LL;
  }

  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  swift_bridgeObjectRetain(v5);
  return NearbyProtoConnectionRequest.displayName.modify;
}

Swift::Void __swiftcall NearbyGroup_Member.clearTokenID()()
{
  uint64_t v1 = (void *)(v0 + *(int *)(type metadata accessor for NearbyGroup_Member(0LL) + 24));
  swift_bridgeObjectRelease(v1[1]);
  *uint64_t v1 = 0LL;
  v1[1] = 0LL;
}

uint64_t NearbyGroup_Member.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyProtoConnectionResponse.Content.ApprovalContent.unknownFields.getter( type metadata accessor for NearbyGroup_Member,  a1);
}

uint64_t NearbyGroup_Member.unknownFields.setter(uint64_t a1)
{
  return NearbyProtoConnectionResponse.Content.ApprovalContent.unknownFields.setter( a1,  type metadata accessor for NearbyGroup_Member);
}

void (__swiftcall *NearbyGroup_Member.unknownFields.modify())()
{
  return Log.init();
}

uint64_t NearbyGroup_Group.event.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of (String, Any)( v1,  a1,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
}

uint64_t NearbyGroup_Group.event.setter(uint64_t a1)
{
  return outlined assign with take of NearbyGroup_Group.OneOf_Event?(a1, v1);
}

uint64_t NearbyGroup_Group.initialize.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v4, v5);
  unint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of (String, Any)( v2,  (uint64_t)v7,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))(v7, 1LL, v8) == 1)
  {
    outlined destroy of Any?( (uint64_t)v7,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_5:
    *(_OWORD *)a1 = xmmword_1000AC690;
    *(void *)(a1 + 16) = _swiftEmptyArrayStorage;
    uint64_t v9 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
    return UnknownStorage.init()(v9);
  }

  if (swift_getEnumCaseMultiPayload(v7, v8))
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v7,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_5;
  }

  return outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v7,  a1,  type metadata accessor for NearbyGroup_Group.Initialization);
}

uint64_t NearbyGroup_Group.initialize.setter(uint64_t a1)
{
  return NearbyGroup_Group.initialize.setter(a1, type metadata accessor for NearbyGroup_Group.Initialization, 0LL);
}

uint64_t NearbyGroup_Group.Initialization.init()@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1000AC690;
  *(void *)(a1 + 16) = _swiftEmptyArrayStorage;
  uint64_t v1 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
  return UnknownStorage.init()(v1);
}

uint64_t type metadata accessor for NearbyGroup_Group.OneOf_Event(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.OneOf_Event,  (uint64_t)&nominal type descriptor for NearbyGroup_Group.OneOf_Event);
}

uint64_t type metadata accessor for NearbyGroup_Group.Initialization(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.Initialization,  (uint64_t)&nominal type descriptor for NearbyGroup_Group.Initialization);
}

void (*NearbyGroup_Group.initialize.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64LL));
  v3[1] = v5;
  size_t v6 = *(void *)(*(void *)(type metadata accessor for NearbyGroup_Group.Initialization(0LL) - 8) + 64LL);
  v3[2] = malloc(v6);
  unint64_t v7 = malloc(v6);
  v3[3] = v7;
  outlined init with copy of (String, Any)( v1,  (uint64_t)v5,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  v3[4] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[5] = v9;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v9 + 48))(v5, 1LL, v8) == 1)
  {
    uint64_t v10 = outlined destroy of Any?( (uint64_t)v5,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  }

  else
  {
    if (!swift_getEnumCaseMultiPayload(v5, v8))
    {
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v5,  (uint64_t)v7,  type metadata accessor for NearbyGroup_Group.Initialization);
      return NearbyGroup_Group.initialize.modify;
    }

    uint64_t v10 = outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v5,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }

  *(_OWORD *)unint64_t v7 = xmmword_1000AC690;
  v7[2] = _swiftEmptyArrayStorage;
  UnknownStorage.init()(v10);
  return NearbyGroup_Group.initialize.modify;
}

void NearbyGroup_Group.initialize.modify(uint64_t **a1, char a2)
{
}

uint64_t NearbyGroup_Group.memberAdded.getter@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v4, v5);
  unint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of (String, Any)( v2,  (uint64_t)v7,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))(v7, 1LL, v8) == 1)
  {
    outlined destroy of Any?( (uint64_t)v7,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  }

  else
  {
    if (swift_getEnumCaseMultiPayload(v7, v8) == 1) {
      return outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v7,  (uint64_t)a1,  type metadata accessor for NearbyGroup_Group.MemberAdded);
    }
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v7,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }

  *a1 = xmmword_1000AC690;
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.MemberAdded(0LL);
  UnknownStorage.init()(v10);
  uint64_t v11 = (char *)a1 + *(int *)(v10 + 24);
  uint64_t v12 = type metadata accessor for NearbyGroup_Member(0LL);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))( v11,  1LL,  1LL,  v12);
}

uint64_t NearbyGroup_Group.memberAdded.setter(uint64_t a1)
{
  return NearbyGroup_Group.initialize.setter(a1, type metadata accessor for NearbyGroup_Group.MemberAdded, 1LL);
}

uint64_t NearbyGroup_Group.MemberAdded.init()@<X0>(_OWORD *a1@<X8>)
{
  return NearbyGroup_Group.MemberAdded.init()(type metadata accessor for NearbyGroup_Group.MemberAdded, a1);
}

void (*NearbyGroup_Group.memberAdded.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64LL));
  v4[1] = v6;
  uint64_t v7 = type metadata accessor for NearbyGroup_Group.MemberAdded(0LL);
  size_t v8 = *(void *)(*(void *)(v7 - 8) + 64LL);
  void v4[2] = malloc(v8);
  uint64_t v9 = malloc(v8);
  void v4[3] = v9;
  outlined init with copy of (String, Any)( v2,  (uint64_t)v6,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  v4[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v4[5] = v11;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v6, 1LL, v10) == 1)
  {
    uint64_t v12 = outlined destroy of Any?( (uint64_t)v6,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_6:
    _OWORD *v9 = xmmword_1000AC690;
    UnknownStorage.init()(v12);
    uint64_t v13 = (char *)v9 + *(int *)(v7 + 24);
    uint64_t v14 = type metadata accessor for NearbyGroup_Member(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v13, 1LL, 1LL, v14);
    return NearbyGroup_Group.memberAdded.modify;
  }

  if (swift_getEnumCaseMultiPayload(v6, v10) != 1)
  {
    uint64_t v12 = outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v6,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_6;
  }

  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v6,  (uint64_t)v9,  type metadata accessor for NearbyGroup_Group.MemberAdded);
  return NearbyGroup_Group.memberAdded.modify;
}

void NearbyGroup_Group.memberAdded.modify(uint64_t **a1, char a2)
{
}

uint64_t NearbyGroup_Group.memberRemoved.getter@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of (String, Any)( v2,  (uint64_t)v7,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))(v7, 1LL, v8) == 1)
  {
    outlined destroy of Any?( (uint64_t)v7,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  }

  else
  {
    if (swift_getEnumCaseMultiPayload(v7, v8) == 2) {
      return outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v7,  (uint64_t)a1,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
    }
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v7,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }

  *a1 = xmmword_1000AC690;
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL);
  UnknownStorage.init()(v10);
  uint64_t v11 = (char *)a1 + *(int *)(v10 + 24);
  uint64_t v12 = type metadata accessor for NearbyGroup_Member(0LL);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56LL))( v11,  1LL,  1LL,  v12);
}

uint64_t NearbyGroup_Group.memberRemoved.setter(uint64_t a1)
{
  return NearbyGroup_Group.initialize.setter(a1, type metadata accessor for NearbyGroup_Group.MemberRemoved, 2LL);
}

uint64_t NearbyGroup_Group.MemberRemoved.init()@<X0>(_OWORD *a1@<X8>)
{
  return NearbyGroup_Group.MemberAdded.init()(type metadata accessor for NearbyGroup_Group.MemberRemoved, a1);
}

uint64_t NearbyGroup_Group.MemberAdded.init()@<X0>(uint64_t (*a1)(void)@<X0>, _OWORD *a2@<X8>)
{
  *a2 = xmmword_1000AC690;
  uint64_t v3 = a1(0LL);
  UnknownStorage.init()(v3);
  uint64_t v4 = (char *)a2 + *(int *)(v3 + 24);
  uint64_t v5 = type metadata accessor for NearbyGroup_Member(0LL);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(v4, 1LL, 1LL, v5);
}

void (*NearbyGroup_Group.memberRemoved.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v2 = v1;
  uint64_t v4 = malloc(0x30uLL);
  *a1 = v4;
  *uint64_t v4 = v1;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v6 = malloc(*(void *)(*(void *)(v5 - 8) + 64LL));
  v4[1] = v6;
  uint64_t v7 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL);
  size_t v8 = *(void *)(*(void *)(v7 - 8) + 64LL);
  void v4[2] = malloc(v8);
  uint64_t v9 = malloc(v8);
  void v4[3] = v9;
  outlined init with copy of (String, Any)( v2,  (uint64_t)v6,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  v4[4] = v10;
  uint64_t v11 = *(void *)(v10 - 8);
  v4[5] = v11;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v6, 1LL, v10) == 1)
  {
    uint64_t v12 = outlined destroy of Any?( (uint64_t)v6,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_6:
    _OWORD *v9 = xmmword_1000AC690;
    UnknownStorage.init()(v12);
    uint64_t v13 = (char *)v9 + *(int *)(v7 + 24);
    uint64_t v14 = type metadata accessor for NearbyGroup_Member(0LL);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(v13, 1LL, 1LL, v14);
    return NearbyGroup_Group.memberRemoved.modify;
  }

  if (swift_getEnumCaseMultiPayload(v6, v10) != 2)
  {
    uint64_t v12 = outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v6,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_6;
  }

  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v6,  (uint64_t)v9,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
  return NearbyGroup_Group.memberRemoved.modify;
}

void NearbyGroup_Group.memberRemoved.modify(uint64_t **a1, char a2)
{
}

uint64_t NearbyGroup_Group.memberLeft.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v4, v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of (String, Any)( v2,  (uint64_t)v7,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))(v7, 1LL, v8) == 1)
  {
    outlined destroy of Any?( (uint64_t)v7,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  }

  else
  {
    if (swift_getEnumCaseMultiPayload(v7, v8) == 3) {
      return outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v7,  a1,  type metadata accessor for NearbyGroup_Group.MemberLeft);
    }
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v7,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  }

  *(_OWORD *)a1 = xmmword_1000AC690;
  *(_BYTE *)(a1 + 16) = 0;
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
  return UnknownStorage.init()(v10);
}

uint64_t key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void), uint64_t a6)
{
  uint64_t v10 = a5(0LL);
  __chkstk_darwin(v10, v11);
  uint64_t v13 = (char *)&v16 - v12;
  outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation(a1, (uint64_t)&v16 - v12, a5);
  outlined destroy of Any?(a2, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation((uint64_t)v13, a2, a5);
  uint64_t v14 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  swift_storeEnumTagMultiPayload(a2, v14, a6);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56LL))(a2, 0LL, 1LL, v14);
}

uint64_t NearbyGroup_Group.memberLeft.setter(uint64_t a1)
{
  return NearbyGroup_Group.initialize.setter(a1, type metadata accessor for NearbyGroup_Group.MemberLeft, 3LL);
}

uint64_t NearbyGroup_Group.initialize.setter(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v7 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  swift_storeEnumTagMultiPayload(v3, v7, a3);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))(v3, 0LL, 1LL, v7);
}

uint64_t NearbyGroup_Group.MemberLeft.init()@<X0>(uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1000AC690;
  *(_BYTE *)(a1 + 16) = 0;
  uint64_t v1 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
  return UnknownStorage.init()(v1);
}

uint64_t type metadata accessor for NearbyGroup_Group.MemberLeft(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group.MemberLeft,  (uint64_t)&nominal type descriptor for NearbyGroup_Group.MemberLeft);
}

void (*NearbyGroup_Group.memberLeft.modify(void *a1))(uint64_t **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64LL));
  v3[1] = v5;
  size_t v6 = *(void *)(*(void *)(type metadata accessor for NearbyGroup_Group.MemberLeft(0LL) - 8) + 64LL);
  v3[2] = malloc(v6);
  uint64_t v7 = malloc(v6);
  v3[3] = v7;
  outlined init with copy of (String, Any)( v1,  (uint64_t)v5,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  v3[4] = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  v3[5] = v9;
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v9 + 48))(v5, 1LL, v8) == 1)
  {
    uint64_t v10 = outlined destroy of Any?( (uint64_t)v5,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_6:
    *(_OWORD *)uint64_t v7 = xmmword_1000AC690;
    v7[16] = 0;
    UnknownStorage.init()(v10);
    return NearbyGroup_Group.memberLeft.modify;
  }

  if (swift_getEnumCaseMultiPayload(v5, v8) != 3)
  {
    uint64_t v10 = outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v5,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_6;
  }

  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v5,  (uint64_t)v7,  type metadata accessor for NearbyGroup_Group.MemberLeft);
  return NearbyGroup_Group.memberLeft.modify;
}

void NearbyGroup_Group.memberLeft.modify(uint64_t **a1, char a2)
{
}

void NearbyGroup_Group.initialize.modify( uint64_t **a1, char a2, uint64_t (*a3)(void), uint64_t a4)
{
  size_t v6 = *a1;
  uint64_t v7 = (*a1)[4];
  uint64_t v8 = (*a1)[5];
  uint64_t v9 = (void *)(*a1)[2];
  uint64_t v10 = (void *)(*a1)[3];
  uint64_t v12 = **a1;
  uint64_t v11 = (void *)(*a1)[1];
  if ((a2 & 1) != 0)
  {
    outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation((*a1)[3], (uint64_t)v9, a3);
    outlined destroy of Any?(v12, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation((uint64_t)v9, v12, a3);
    swift_storeEnumTagMultiPayload(v12, v7, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v12, 0LL, 1LL, v7);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization((uint64_t)v10, a3);
  }

  else
  {
    outlined destroy of Any?(**a1, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation((uint64_t)v10, v12, a3);
    swift_storeEnumTagMultiPayload(v12, v7, a4);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v12, 0LL, 1LL, v7);
  }

  free(v10);
  free(v9);
  free(v11);
  free(v6);
}

uint64_t NearbyGroup_Group.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyProtoConnectionResponse.Content.ApprovalContent.unknownFields.getter( type metadata accessor for NearbyGroup_Group,  a1);
}

uint64_t type metadata accessor for NearbyGroup_Group(uint64_t a1)
{
  return type metadata accessor for NearbyInvitationsInviteScanner( a1,  (uint64_t *)&type metadata singleton initialization cache for NearbyGroup_Group,  (uint64_t)&nominal type descriptor for NearbyGroup_Group);
}

uint64_t NearbyGroup_Group.unknownFields.setter(uint64_t a1)
{
  return NearbyProtoConnectionResponse.Content.ApprovalContent.unknownFields.setter( a1,  type metadata accessor for NearbyGroup_Group);
}

void (__swiftcall *NearbyGroup_Group.unknownFields.modify())()
{
  return Log.init();
}

uint64_t static NearbyGroup_Group.MemberAdded.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  return specialized static NearbyGroup_Group.MemberRemoved.== infix(_:_:)( a1,  a2,  type metadata accessor for NearbyGroup_Group.MemberAdded) & 1;
}

uint64_t static NearbyGroup_Group.MemberRemoved.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  return specialized static NearbyGroup_Group.MemberRemoved.== infix(_:_:)( a1,  a2,  type metadata accessor for NearbyGroup_Group.MemberRemoved) & 1;
}

uint64_t NearbyGroup_Group.Initialization.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyProtoConnectionRequest.unknownFields.getter( type metadata accessor for NearbyGroup_Group.Initialization,  a1);
}

uint64_t NearbyGroup_Group.Initialization.unknownFields.setter(uint64_t a1)
{
  return NearbyProtoConnectionRequest.unknownFields.setter( a1,  type metadata accessor for NearbyGroup_Group.Initialization);
}

void (__swiftcall *NearbyGroup_Group.Initialization.unknownFields.modify())()
{
  return Log.init();
}

uint64_t (*NearbyGroup_Group.MemberAdded.member.modify(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64LL));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for NearbyGroup_Member(0LL);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[3] = v7;
  size_t v8 = *(void *)(v7 + 64);
  v3[4] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v3[5] = v9;
  uint64_t v10 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberAdded(0LL) + 24);
  *((_DWORD *)v3 + 12) = v10;
  outlined init with copy of (String, Any)( v1 + v10,  (uint64_t)v5,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v11 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6);
  if ((_DWORD)v11 == 1)
  {
    void *v9 = 0LL;
    v9[1] = 0xE000000000000000LL;
    UnknownStorage.init()(v11);
    uint64_t v12 = (void *)((char *)v9 + *(int *)(v6 + 24));
    void *v12 = 0LL;
    v12[1] = 0LL;
    outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for NearbyGroup_Member?);
  }

  else
  {
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v5,  (uint64_t)v9,  type metadata accessor for NearbyGroup_Member);
  }

  return NearbyGroup_Group.MemberAdded.member.modify;
}

BOOL NearbyGroup_Group.MemberAdded.hasMember.getter()
{
  return NearbyGroup_Group.MemberAdded.hasMember.getter(type metadata accessor for NearbyGroup_Group.MemberAdded);
}

Swift::Void __swiftcall NearbyGroup_Group.MemberAdded.clearMember()()
{
}

uint64_t NearbyGroup_Group.MemberAdded.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyProtoConnectionResponse.Content.ApprovalContent.unknownFields.getter( type metadata accessor for NearbyGroup_Group.MemberAdded,  a1);
}

uint64_t NearbyGroup_Group.MemberAdded.unknownFields.setter(uint64_t a1)
{
  return NearbyProtoConnectionResponse.Content.ApprovalContent.unknownFields.setter( a1,  type metadata accessor for NearbyGroup_Group.MemberAdded);
}

void (__swiftcall *NearbyGroup_Group.MemberAdded.unknownFields.modify())()
{
  return Log.init();
}

uint64_t key path getter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded@<X0>( uint64_t a1@<X0>, uint64_t (*a2)(void)@<X3>, void *a3@<X8>)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  __chkstk_darwin(v6, v7);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = a2(0LL);
  outlined init with copy of (String, Any)( a1 + *(int *)(v10 + 24),  (uint64_t)v9,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v11 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48LL))(v9, 1LL, v11);
  if ((_DWORD)v12 != 1) {
    return outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v9,  (uint64_t)a3,  type metadata accessor for NearbyGroup_Member);
  }
  *a3 = 0LL;
  a3[1] = 0xE000000000000000LL;
  UnknownStorage.init()(v12);
  uint64_t v13 = (void *)((char *)a3 + *(int *)(v11 + 24));
  *uint64_t v13 = 0LL;
  v13[1] = 0LL;
  return outlined destroy of Any?((uint64_t)v9, &demangling cache variable for type metadata for NearbyGroup_Member?);
}

uint64_t key path setter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v8 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( a1,  (uint64_t)v12,  type metadata accessor for NearbyGroup_Member);
  uint64_t v13 = a2 + *(int *)(a5(0LL) + 24);
  outlined destroy of Any?(v13, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v12,  v13,  type metadata accessor for NearbyGroup_Member);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v13, 0LL, 1LL, v8);
}

uint64_t (*NearbyGroup_Group.MemberRemoved.member.modify(void *a1))()
{
  uint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  *uint64_t v3 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64LL));
  v3[1] = v5;
  uint64_t v6 = type metadata accessor for NearbyGroup_Member(0LL);
  v3[2] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v3[3] = v7;
  size_t v8 = *(void *)(v7 + 64);
  v3[4] = malloc(v8);
  uint64_t v9 = malloc(v8);
  v3[5] = v9;
  uint64_t v10 = *(int *)(type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL) + 24);
  *((_DWORD *)v3 + 12) = v10;
  outlined init with copy of (String, Any)( v1 + v10,  (uint64_t)v5,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v11 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1LL, v6);
  if ((_DWORD)v11 == 1)
  {
    void *v9 = 0LL;
    v9[1] = 0xE000000000000000LL;
    UnknownStorage.init()(v11);
    uint64_t v12 = (void *)((char *)v9 + *(int *)(v6 + 24));
    void *v12 = 0LL;
    v12[1] = 0LL;
    outlined destroy of Any?((uint64_t)v5, &demangling cache variable for type metadata for NearbyGroup_Member?);
  }

  else
  {
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v5,  (uint64_t)v9,  type metadata accessor for NearbyGroup_Member);
  }

  return NearbyGroup_Group.MemberAdded.member.modify;
}

void NearbyGroup_Group.MemberAdded.member.modify(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(int *)(*(void *)a1 + 48LL);
  uint64_t v4 = *(void **)(*(void *)a1 + 32LL);
  uint64_t v5 = *(void **)(*(void *)a1 + 40LL);
  uint64_t v6 = *(void *)(*(void *)a1 + 16LL);
  uint64_t v7 = *(void *)(*(void *)a1 + 24LL);
  size_t v8 = *(void **)(*(void *)a1 + 8LL);
  uint64_t v9 = **(void **)a1 + v3;
  if ((a2 & 1) != 0)
  {
    outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( *(void *)(*(void *)a1 + 40LL),  (uint64_t)v4,  type metadata accessor for NearbyGroup_Member);
    outlined destroy of Any?(v9, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v4,  v9,  type metadata accessor for NearbyGroup_Member);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0LL, 1LL, v6);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v5,  type metadata accessor for NearbyGroup_Member);
  }

  else
  {
    outlined destroy of Any?(**(void **)a1 + v3, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v5,  v9,  type metadata accessor for NearbyGroup_Member);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(v9, 0LL, 1LL, v6);
  }

  free(v5);
  free(v4);
  free(v8);
  free(v2);
}

BOOL NearbyGroup_Group.MemberRemoved.hasMember.getter()
{
  return NearbyGroup_Group.MemberAdded.hasMember.getter(type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

BOOL NearbyGroup_Group.MemberAdded.hasMember.getter(uint64_t (*a1)(void))
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  __chkstk_darwin(v3, v4);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = a1(0LL);
  outlined init with copy of (String, Any)( v1 + *(int *)(v7 + 24),  (uint64_t)v6,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v8 = type metadata accessor for NearbyGroup_Member(0LL);
  BOOL v9 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))(v6, 1LL, v8) != 1;
  outlined destroy of Any?((uint64_t)v6, &demangling cache variable for type metadata for NearbyGroup_Member?);
  return v9;
}

Swift::Void __swiftcall NearbyGroup_Group.MemberRemoved.clearMember()()
{
}

uint64_t NearbyGroup_Group.MemberAdded.clearMember()(uint64_t (*a1)(void))
{
  uint64_t v2 = v1 + *(int *)(a1(0LL) + 24);
  outlined destroy of Any?(v2, &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v3 = type metadata accessor for NearbyGroup_Member(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56LL))(v2, 1LL, 1LL, v3);
}

uint64_t NearbyGroup_Group.MemberRemoved.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyProtoConnectionResponse.Content.ApprovalContent.unknownFields.getter( type metadata accessor for NearbyGroup_Group.MemberRemoved,  a1);
}

uint64_t NearbyGroup_Group.MemberRemoved.unknownFields.setter(uint64_t a1)
{
  return NearbyProtoConnectionResponse.Content.ApprovalContent.unknownFields.setter( a1,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

void (__swiftcall *NearbyGroup_Group.MemberRemoved.unknownFields.modify())()
{
  return Log.init();
}

uint64_t NearbyGroup_Group.MemberLeft.usesToken.setter(uint64_t result)
{
  *(_BYTE *)(v1 + 16) = result;
  return result;
}

uint64_t NearbyGroup_Group.MemberLeft.unknownFields.getter@<X0>(uint64_t a1@<X8>)
{
  return NearbyProtoConnectionRequest.unknownFields.getter(type metadata accessor for NearbyGroup_Group.MemberLeft, a1);
}

uint64_t NearbyGroup_Group.MemberLeft.unknownFields.setter(uint64_t a1)
{
  return NearbyProtoConnectionRequest.unknownFields.setter(a1, type metadata accessor for NearbyGroup_Group.MemberLeft);
}

void (__swiftcall *NearbyGroup_Group.MemberLeft.unknownFields.modify())()
{
  return Log.init();
}

uint64_t NearbyGroup_Group.init()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, 1LL, 1LL, v2);
  uint64_t v3 = type metadata accessor for NearbyGroup_Group(0LL);
  return UnknownStorage.init()(v3);
}

const char *NearbyGroup_Member.protoMessageName.unsafeMutableAddressor()
{
  return "cp.Member";
}

uint64_t static NearbyGroup_Member.protoMessageName.getter()
{
  return 0x65626D654D2E7063LL;
}

uint64_t NearbyGroup_Member._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Member._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap);
}

uint64_t static NearbyGroup_Member._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Member._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t NearbyGroup_Member.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = a2;
  for (uint64_t i = a3; ; uint64_t i = a3)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()(v7, i);
    if (v4 || (v11 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      uint64_t v9 = type metadata accessor for NearbyGroup_Member(0LL);
      dispatch thunk of Decoder.decodeSingularStringField(value:)(v3 + *(int *)(v9 + 24), a2, a3);
    }

    else if (result == 1)
    {
      dispatch thunk of Decoder.decodeSingularStringField(value:)(v3, a2, a3);
    }

    uint64_t v4 = 0LL;
    uint64_t v7 = a2;
  }

  return result;
}

uint64_t NearbyGroup_Member.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v8 = v3[1];
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000LL) == 0) {
    uint64_t v9 = *v3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9
    || (uint64_t result = dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)(*v3, v8, 1LL, a2, a3), !v4))
  {
    uint64_t result = closure #1 in NearbyGroup_Member.traverse<A>(visitor:)((uint64_t)v3, a1, a2, a3);
    if (!v4)
    {
      type metadata accessor for NearbyGroup_Member(0LL);
      return UnknownStorage.traverse<A>(visitor:)(a1, a2, a3);
    }
  }

  return result;
}

uint64_t closure #1 in NearbyGroup_Member.traverse<A>(visitor:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for NearbyGroup_Member(0LL);
  unint64_t v8 = (void *)(a1 + *(int *)(result + 24));
  uint64_t v9 = v8[1];
  if (v9) {
    return dispatch thunk of Visitor.visitSingularStringField(value:fieldNumber:)(*v8, v9, 2LL, a3, a4);
  }
  return result;
}

Swift::Int NearbyGroup_Member.hashValue.getter()
{
  return NearbyProtoSessionMessage.hashValue.getter( type metadata accessor for NearbyGroup_Member,  &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Member@<X0>( uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = 0LL;
  a2[1] = 0xE000000000000000LL;
  uint64_t result = UnknownStorage.init()();
  uint64_t v5 = (void *)((char *)a2 + *(int *)(a1 + 24));
  *uint64_t v5 = 0LL;
  v5[1] = 0LL;
  return result;
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Member( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Member.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Member( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Member.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Member( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Member@<X0>( uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Member._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Member( uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Member(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
  return Message.hash(into:)(a1, a2, v4);
}

const char *NearbyGroup_Group.protoMessageName.unsafeMutableAddressor()
{
  return "cp.Group";
}

uint64_t static NearbyGroup_Group.protoMessageName.getter()
{
  return 0x70756F72472E7063LL;
}

uint64_t NearbyGroup_Group._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap);
}

uint64_t static NearbyGroup_Group._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t NearbyGroup_Group.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = v3;
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()(a2, a3);
  if (!v4)
  {
    while ((v10 & 1) == 0)
    {
      switch(result)
      {
        case 1LL:
          closure #1 in NearbyGroup_Group.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
          break;
        case 2LL:
          closure #2 in NearbyGroup_Group.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
          break;
        case 3LL:
          closure #3 in NearbyGroup_Group.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
          break;
        case 4LL:
          closure #4 in NearbyGroup_Group.decodeMessage<A>(decoder:)(v5, a1, a2, a3);
          break;
        default:
          break;
      }

      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()(a2, a3);
    }
  }

  return result;
}

uint64_t closure #1 in NearbyGroup_Group.decodeMessage<A>(decoder:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v56 = a3;
  uint64_t v57 = a4;
  uint64_t v58 = a2;
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  uint64_t v50 = &v46[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v8, v10);
  uint64_t v53 = &v46[-v11];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = &v46[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v16 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  uint64_t v21 = &v46[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v19, v22);
  uint64_t v24 = &v46[-v23];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
  uint64_t v27 = __chkstk_darwin(v25, v26);
  uint64_t v51 = &v46[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v27, v29);
  uint64_t v31 = &v46[-v30];
  uint64_t v52 = v6;
  __int128 v32 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v54 = v5;
  v32(&v46[-v30], 1LL, 1LL, v5);
  uint64_t v49 = a1;
  outlined init with copy of (String, Any)( a1,  (uint64_t)v15,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v48 = v17;
  int v33 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v17 + 48))(v15, 1LL, v16);
  int v34 = v33;
  if (v33 == 1)
  {
    outlined destroy of Any?( (uint64_t)v15,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    uint64_t v36 = v56;
    uint64_t v35 = v57;
    uint64_t v37 = v16;
    uint64_t v39 = v54;
    uint64_t v38 = v55;
  }

  else
  {
    int v47 = v33;
    uint64_t v40 = (uint64_t)v53;
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v15,  (uint64_t)v24,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v24,  (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v37 = v16;
    if (swift_getEnumCaseMultiPayload(v21, v16))
    {
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
      uint64_t v36 = v56;
      uint64_t v35 = v57;
      uint64_t v39 = v54;
      uint64_t v38 = v55;
    }

    else
    {
      outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v21,  v40,  type metadata accessor for NearbyGroup_Group.Initialization);
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v40,  (uint64_t)v31,  type metadata accessor for NearbyGroup_Group.Initialization);
      uint64_t v39 = v54;
      v32(v31, 0LL, 1LL, v54);
      uint64_t v36 = v56;
      uint64_t v35 = v57;
      uint64_t v38 = v55;
    }

    int v34 = v47;
  }

  uint64_t v41 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)(v31, v39, v41, v36, v35);
  if (v38) {
    return outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
  }
  uint64_t v43 = v51;
  outlined init with copy of (String, Any)( (uint64_t)v31,  (uint64_t)v51,  &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v52 + 48))(v43, 1LL, v39) == 1)
  {
    outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
    return outlined destroy of Any?( (uint64_t)v43,  &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
  }

  else
  {
    uint64_t v44 = v50;
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v43,  (uint64_t)v50,  type metadata accessor for NearbyGroup_Group.Initialization);
    if (v34 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()(v36, v35);
    }
    outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.Initialization?);
    uint64_t v45 = v49;
    outlined destroy of Any?(v49, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v44,  v45,  type metadata accessor for NearbyGroup_Group.Initialization);
    swift_storeEnumTagMultiPayload(v45, v37, 0LL);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v45, 0LL, 1LL, v37);
  }

uint64_t closure #2 in NearbyGroup_Group.decodeMessage<A>(decoder:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v56 = a3;
  uint64_t v57 = a4;
  uint64_t v58 = a2;
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberAdded(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  uint64_t v50 = &v46[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v8, v10);
  uint64_t v53 = &v46[-v11];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = &v46[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v16 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  uint64_t v21 = &v46[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v19, v22);
  uint64_t v24 = &v46[-v23];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
  uint64_t v27 = __chkstk_darwin(v25, v26);
  uint64_t v51 = &v46[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v27, v29);
  uint64_t v31 = &v46[-v30];
  uint64_t v52 = v6;
  __int128 v32 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v54 = v5;
  v32(&v46[-v30], 1LL, 1LL, v5);
  uint64_t v49 = a1;
  outlined init with copy of (String, Any)( a1,  (uint64_t)v15,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v48 = v17;
  int v33 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v17 + 48))(v15, 1LL, v16);
  int v34 = v33;
  if (v33 == 1)
  {
    outlined destroy of Any?( (uint64_t)v15,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    uint64_t v36 = v56;
    uint64_t v35 = v57;
    uint64_t v37 = v16;
    uint64_t v39 = v54;
    uint64_t v38 = v55;
  }

  else
  {
    int v47 = v33;
    uint64_t v40 = (uint64_t)v53;
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v15,  (uint64_t)v24,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v24,  (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v37 = v16;
    if (swift_getEnumCaseMultiPayload(v21, v16) == 1)
    {
      outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v21,  v40,  type metadata accessor for NearbyGroup_Group.MemberAdded);
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v40,  (uint64_t)v31,  type metadata accessor for NearbyGroup_Group.MemberAdded);
      uint64_t v39 = v54;
      v32(v31, 0LL, 1LL, v54);
      uint64_t v36 = v56;
      uint64_t v35 = v57;
    }

    else
    {
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
      uint64_t v36 = v56;
      uint64_t v35 = v57;
      uint64_t v39 = v54;
    }

    uint64_t v38 = v55;
    int v34 = v47;
  }

  uint64_t v41 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)(v31, v39, v41, v36, v35);
  if (v38) {
    return outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
  }
  uint64_t v43 = v51;
  outlined init with copy of (String, Any)( (uint64_t)v31,  (uint64_t)v51,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v52 + 48))(v43, 1LL, v39) == 1)
  {
    outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
    return outlined destroy of Any?( (uint64_t)v43,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
  }

  else
  {
    uint64_t v44 = v50;
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v43,  (uint64_t)v50,  type metadata accessor for NearbyGroup_Group.MemberAdded);
    if (v34 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()(v36, v35);
    }
    outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberAdded?);
    uint64_t v45 = v49;
    outlined destroy of Any?(v49, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v44,  v45,  type metadata accessor for NearbyGroup_Group.MemberAdded);
    swift_storeEnumTagMultiPayload(v45, v37, 1LL);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v45, 0LL, 1LL, v37);
  }

uint64_t closure #3 in NearbyGroup_Group.decodeMessage<A>(decoder:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v56 = a3;
  uint64_t v57 = a4;
  uint64_t v58 = a2;
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  uint64_t v50 = &v46[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v8, v10);
  uint64_t v53 = &v46[-v11];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = &v46[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v16 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  uint64_t v21 = &v46[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v19, v22);
  uint64_t v24 = &v46[-v23];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
  uint64_t v27 = __chkstk_darwin(v25, v26);
  uint64_t v51 = &v46[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v27, v29);
  uint64_t v31 = &v46[-v30];
  uint64_t v52 = v6;
  __int128 v32 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v54 = v5;
  v32(&v46[-v30], 1LL, 1LL, v5);
  uint64_t v49 = a1;
  outlined init with copy of (String, Any)( a1,  (uint64_t)v15,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v48 = v17;
  int v33 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v17 + 48))(v15, 1LL, v16);
  int v34 = v33;
  if (v33 == 1)
  {
    outlined destroy of Any?( (uint64_t)v15,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    uint64_t v36 = v56;
    uint64_t v35 = v57;
    uint64_t v37 = v16;
    uint64_t v39 = v54;
    uint64_t v38 = v55;
  }

  else
  {
    int v47 = v33;
    uint64_t v40 = (uint64_t)v53;
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v15,  (uint64_t)v24,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v24,  (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v37 = v16;
    if (swift_getEnumCaseMultiPayload(v21, v16) == 2)
    {
      outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v21,  v40,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v40,  (uint64_t)v31,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
      uint64_t v39 = v54;
      v32(v31, 0LL, 1LL, v54);
      uint64_t v36 = v56;
      uint64_t v35 = v57;
    }

    else
    {
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
      uint64_t v36 = v56;
      uint64_t v35 = v57;
      uint64_t v39 = v54;
    }

    uint64_t v38 = v55;
    int v34 = v47;
  }

  uint64_t v41 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)(v31, v39, v41, v36, v35);
  if (v38) {
    return outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
  }
  uint64_t v43 = v51;
  outlined init with copy of (String, Any)( (uint64_t)v31,  (uint64_t)v51,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v52 + 48))(v43, 1LL, v39) == 1)
  {
    outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
    return outlined destroy of Any?( (uint64_t)v43,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
  }

  else
  {
    uint64_t v44 = v50;
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v43,  (uint64_t)v50,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
    if (v34 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()(v36, v35);
    }
    outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberRemoved?);
    uint64_t v45 = v49;
    outlined destroy of Any?(v49, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v44,  v45,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
    swift_storeEnumTagMultiPayload(v45, v37, 2LL);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v45, 0LL, 1LL, v37);
  }

uint64_t closure #4 in NearbyGroup_Group.decodeMessage<A>(decoder:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v56 = a3;
  uint64_t v57 = a4;
  uint64_t v58 = a2;
  uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v8 = __chkstk_darwin(v5, v7);
  uint64_t v50 = &v46[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v8, v10);
  uint64_t v53 = &v46[-v11];
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = &v46[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v16 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  uint64_t v21 = &v46[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v19, v22);
  uint64_t v24 = &v46[-v23];
  uint64_t v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
  uint64_t v27 = __chkstk_darwin(v25, v26);
  uint64_t v51 = &v46[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  __chkstk_darwin(v27, v29);
  uint64_t v31 = &v46[-v30];
  uint64_t v52 = v6;
  __int128 v32 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  uint64_t v54 = v5;
  v32(&v46[-v30], 1LL, 1LL, v5);
  uint64_t v49 = a1;
  outlined init with copy of (String, Any)( a1,  (uint64_t)v15,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v48 = v17;
  int v33 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v17 + 48))(v15, 1LL, v16);
  int v34 = v33;
  if (v33 == 1)
  {
    outlined destroy of Any?( (uint64_t)v15,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    uint64_t v36 = v56;
    uint64_t v35 = v57;
    uint64_t v37 = v16;
    uint64_t v39 = v54;
    uint64_t v38 = v55;
  }

  else
  {
    int v47 = v33;
    uint64_t v40 = (uint64_t)v53;
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v15,  (uint64_t)v24,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v24,  (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v37 = v16;
    if (swift_getEnumCaseMultiPayload(v21, v16) == 3)
    {
      outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v21,  v40,  type metadata accessor for NearbyGroup_Group.MemberLeft);
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v40,  (uint64_t)v31,  type metadata accessor for NearbyGroup_Group.MemberLeft);
      uint64_t v39 = v54;
      v32(v31, 0LL, 1LL, v54);
      uint64_t v36 = v56;
      uint64_t v35 = v57;
    }

    else
    {
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
      uint64_t v36 = v56;
      uint64_t v35 = v57;
      uint64_t v39 = v54;
    }

    uint64_t v38 = v55;
    int v34 = v47;
  }

  uint64_t v41 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
  dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)(v31, v39, v41, v36, v35);
  if (v38) {
    return outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
  }
  uint64_t v43 = v51;
  outlined init with copy of (String, Any)( (uint64_t)v31,  (uint64_t)v51,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v52 + 48))(v43, 1LL, v39) == 1)
  {
    outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
    return outlined destroy of Any?( (uint64_t)v43,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
  }

  else
  {
    uint64_t v44 = v50;
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v43,  (uint64_t)v50,  type metadata accessor for NearbyGroup_Group.MemberLeft);
    if (v34 != 1) {
      dispatch thunk of Decoder.handleConflictingOneOf()(v36, v35);
    }
    outlined destroy of Any?( (uint64_t)v31,  &demangling cache variable for type metadata for NearbyGroup_Group.MemberLeft?);
    uint64_t v45 = v49;
    outlined destroy of Any?(v49, &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v44,  v45,  type metadata accessor for NearbyGroup_Group.MemberLeft);
    swift_storeEnumTagMultiPayload(v45, v37, 3LL);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v48 + 56))(v45, 0LL, 1LL, v37);
  }

uint64_t NearbyGroup_Group.traverse<A>(visitor:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of (String, Any)( v3,  (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v11 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48LL))(v10, 1LL, v11) != 1)
  {
    uint64_t v12 = (char *)&loc_100095524 + 4 * byte_1000AE5F4[swift_getEnumCaseMultiPayload(v10, v11)];
    __asm { BR              X10 }
  }

  type metadata accessor for NearbyGroup_Group(0LL);
  return UnknownStorage.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t closure #1 in NearbyGroup_Group.traverse<A>(visitor:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of (String, Any)( a1,  (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v15 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48LL))(v10, 1LL, v15) == 1)
  {
    outlined destroy of Any?( (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    __break(1u);
  }

  else if (!swift_getEnumCaseMultiPayload(v10, v15))
  {
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v10,  (uint64_t)v14,  type metadata accessor for NearbyGroup_Group.Initialization);
    uint64_t v16 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)(v14, 1LL, v11, v16, a3, a4);
    return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v14,  type metadata accessor for NearbyGroup_Group.Initialization);
  }

  uint64_t result = outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v10,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  __break(1u);
  return result;
}

uint64_t closure #2 in NearbyGroup_Group.traverse<A>(visitor:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for NearbyGroup_Group.MemberAdded(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of (String, Any)( a1,  (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v15 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48LL))(v10, 1LL, v15) == 1)
  {
    outlined destroy of Any?( (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    __break(1u);
  }

  else if (swift_getEnumCaseMultiPayload(v10, v15) == 1)
  {
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v10,  (uint64_t)v14,  type metadata accessor for NearbyGroup_Group.MemberAdded);
    uint64_t v16 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)(v14, 2LL, v11, v16, a3, a4);
    return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v14,  type metadata accessor for NearbyGroup_Group.MemberAdded);
  }

  uint64_t result = outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v10,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  __break(1u);
  return result;
}

uint64_t closure #3 in NearbyGroup_Group.traverse<A>(visitor:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of (String, Any)( a1,  (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v15 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48LL))(v10, 1LL, v15) == 1)
  {
    outlined destroy of Any?( (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    __break(1u);
  }

  else if (swift_getEnumCaseMultiPayload(v10, v15) == 2)
  {
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v10,  (uint64_t)v14,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
    uint64_t v16 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)(v14, 3LL, v11, v16, a3, a4);
    return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v14,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
  }

  uint64_t result = outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v10,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  __break(1u);
  return result;
}

uint64_t closure #4 in NearbyGroup_Group.traverse<A>(visitor:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  outlined init with copy of (String, Any)( a1,  (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v15 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48LL))(v10, 1LL, v15) == 1)
  {
    outlined destroy of Any?( (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    __break(1u);
  }

  else if (swift_getEnumCaseMultiPayload(v10, v15) == 3)
  {
    outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v10,  (uint64_t)v14,  type metadata accessor for NearbyGroup_Group.MemberLeft);
    uint64_t v16 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
    dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)(v14, 4LL, v11, v16, a3, a4);
    return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v14,  type metadata accessor for NearbyGroup_Group.MemberLeft);
  }

  uint64_t result = outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v10,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  __break(1u);
  return result;
}

Swift::Int NearbyGroup_Group.hashValue.getter()
{
  return NearbyProtoSessionMessage.hashValue.getter( type metadata accessor for NearbyGroup_Group,  &lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group);
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Group@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56LL))(a1, 1LL, 1LL, v2);
  return UnknownStorage.init()(v3);
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.decodeMessage<A>(decoder:)(a1, a2, a3);
}

uint64_t protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.traverse<A>(visitor:)(a1, a2, a3);
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group,  type metadata accessor for NearbyGroup_Group,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group@<X0>( uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group( uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group,  type metadata accessor for NearbyGroup_Group,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group,  type metadata accessor for NearbyGroup_Group,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group);
  return Message.hash(into:)(a1, a2, v4);
}

void one-time initialization function for protoMessageName(int a1)
{
  v1._countAndFlagsBits = 0x6C616974696E492ELL;
  v1._object = (void *)0xEF6E6F6974617A69LL;
  one-time initialization function for protoMessageName( a1,  v1,  static NearbyGroup_Group.Initialization.protoMessageName,  &static NearbyGroup_Group.Initialization.protoMessageName[1]);
}

{
  Swift::String v1;
  v1._countAndFlagsBits = 0x417265626D654D2ELL;
  v1._object = (void *)0xEC00000064656464LL;
  one-time initialization function for protoMessageName( a1,  v1,  static NearbyGroup_Group.MemberAdded.protoMessageName,  &static NearbyGroup_Group.MemberAdded.protoMessageName[1]);
}

{
  Swift::String v1;
  v1._countAndFlagsBits = 0x527265626D654D2ELL;
  v1._object = (void *)0xEE006465766F6D65LL;
  one-time initialization function for protoMessageName( a1,  v1,  static NearbyGroup_Group.MemberRemoved.protoMessageName,  &static NearbyGroup_Group.MemberRemoved.protoMessageName[1]);
}

{
  Swift::String v1;
  v1._countAndFlagsBits = 0x4C7265626D654D2ELL;
  v1._object = (void *)0xEB00000000746665LL;
  one-time initialization function for protoMessageName( a1,  v1,  static NearbyGroup_Group.MemberLeft.protoMessageName,  &static NearbyGroup_Group.MemberLeft.protoMessageName[1]);
}

void *NearbyGroup_Group.Initialization.protoMessageName.unsafeMutableAddressor()
{
  if (one-time initialization token for protoMessageName != -1) {
    swift_once( &one-time initialization token for protoMessageName,  one-time initialization function for protoMessageName);
  }
  return static NearbyGroup_Group.Initialization.protoMessageName;
}

uint64_t static NearbyGroup_Group.Initialization.protoMessageName.getter()
{
  return static NearbyProtoConnectionResponse.Content.protoMessageName.getter( &one-time initialization token for protoMessageName,  static NearbyGroup_Group.Initialization.protoMessageName,  &static NearbyGroup_Group.Initialization.protoMessageName[1]);
}

uint64_t NearbyGroup_Group.Initialization._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.Initialization._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap);
}

uint64_t static NearbyGroup_Group.Initialization._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.Initialization._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t NearbyGroup_Group.Initialization.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()(a2, a3);
  if (!v4)
  {
    while ((v8 & 1) == 0)
    {
      if (result == 2)
      {
        uint64_t v9 = type metadata accessor for NearbyGroup_Member(0LL);
        uint64_t v10 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
        dispatch thunk of Decoder.decodeRepeatedMessageField<A>(value:)(v3 + 16, v9, v10, a2, a3);
      }

      else if (result == 1)
      {
        dispatch thunk of Decoder.decodeSingularBytesField(value:)(v3, a2, a3);
      }

      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()(a2, a3);
    }
  }

  return result;
}

void NearbyGroup_Group.Initialization.traverse<A>(visitor:)()
{
  __asm { BR              X10 }

uint64_t sub_100096190(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xFF000000000000LL) == 0
    || (uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)(a1, a2, 1LL, v4, v3), !v2))
  {
    uint64_t v8 = *(void *)(v5 + 16);
    if (!*(void *)(v8 + 16)
      || (uint64_t v9 = type metadata accessor for NearbyGroup_Member(0LL),
          v10 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member),  uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))dispatch thunk of Visitor.visitRepeatedMessageField<A>(value:fieldNumber:))( v8,  2LL,  v9,  v10,  v4,  v3),  !v2))
    {
      type metadata accessor for NearbyGroup_Group.Initialization(0LL);
      return UnknownStorage.traverse<A>(visitor:)(v6, v4, v3);
    }
  }

  return result;
}

Swift::Int NearbyGroup_Group.Initialization.hashValue.getter()
{
  return NearbyProtoSessionMessage.hashValue.getter( type metadata accessor for NearbyGroup_Group.Initialization,  &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Group.Initialization@<X0>( uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1000AC690;
  *(void *)(a1 + 16) = &_swiftEmptyArrayStorage;
  return UnknownStorage.init()();
}

uint64_t protocol witness for static Message.protoMessageName.getter in conformance NearbyGroup_Group.Initialization( uint64_t a1, uint64_t a2)
{
  return protocol witness for static Message.protoMessageName.getter in conformance NearbyProtoConnectionResponse.Content( a1,  a2,  &one-time initialization token for protoMessageName,  static NearbyGroup_Group.Initialization.protoMessageName,  &static NearbyGroup_Group.Initialization.protoMessageName[1],  (uint64_t)one-time initialization function for protoMessageName);
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group.Initialization( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.Initialization.decodeMessage<A>(decoder:)(a1, a2, a3);
}

void protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group.Initialization()
{
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group.Initialization( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group.Initialization@<X0>( uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.Initialization._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group.Initialization( uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group.Initialization( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
  return Message.hash(into:)(a1, a2, v4);
}

void *NearbyGroup_Group.MemberAdded.protoMessageName.unsafeMutableAddressor()
{
  if (one-time initialization token for protoMessageName != -1) {
    swift_once( &one-time initialization token for protoMessageName,  one-time initialization function for protoMessageName);
  }
  return static NearbyGroup_Group.MemberAdded.protoMessageName;
}

uint64_t static NearbyGroup_Group.MemberAdded.protoMessageName.getter()
{
  return static NearbyProtoConnectionResponse.Content.protoMessageName.getter( &one-time initialization token for protoMessageName,  static NearbyGroup_Group.MemberAdded.protoMessageName,  &static NearbyGroup_Group.MemberAdded.protoMessageName[1]);
}

uint64_t NearbyGroup_Group.MemberAdded._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.MemberAdded._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap);
}

uint64_t static NearbyGroup_Group.MemberAdded._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.MemberAdded._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)( a1,  a2,  a3,  type metadata accessor for NearbyGroup_Group.MemberAdded);
}

void NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)()
{
}

{
  __asm { BR              X10 }

Swift::Int NearbyGroup_Group.MemberAdded.hashValue.getter()
{
  return NearbyProtoSessionMessage.hashValue.getter( type metadata accessor for NearbyGroup_Group.MemberAdded,  &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
}

uint64_t protocol witness for static Message.protoMessageName.getter in conformance NearbyGroup_Group.MemberAdded( uint64_t a1, uint64_t a2)
{
  return protocol witness for static Message.protoMessageName.getter in conformance NearbyProtoConnectionResponse.Content( a1,  a2,  &one-time initialization token for protoMessageName,  static NearbyGroup_Group.MemberAdded.protoMessageName,  &static NearbyGroup_Group.MemberAdded.protoMessageName[1],  (uint64_t)one-time initialization function for protoMessageName);
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group.MemberAdded( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(a1, a2, a3);
}

void protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group.MemberAdded()
{
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group.MemberAdded( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group.MemberAdded@<X0>( uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.MemberAdded._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group.MemberAdded( uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group.MemberAdded( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
  return Message.hash(into:)(a1, a2, v4);
}

void *NearbyGroup_Group.MemberRemoved.protoMessageName.unsafeMutableAddressor()
{
  if (one-time initialization token for protoMessageName != -1) {
    swift_once( &one-time initialization token for protoMessageName,  one-time initialization function for protoMessageName);
  }
  return static NearbyGroup_Group.MemberRemoved.protoMessageName;
}

uint64_t static NearbyGroup_Group.MemberRemoved.protoMessageName.getter()
{
  return static NearbyProtoConnectionResponse.Content.protoMessageName.getter( &one-time initialization token for protoMessageName,  static NearbyGroup_Group.MemberRemoved.protoMessageName,  &static NearbyGroup_Group.MemberRemoved.protoMessageName[1]);
}

uint64_t NearbyGroup_Group.MemberRemoved._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.MemberRemoved._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap);
}

uint64_t static NearbyGroup_Group.MemberRemoved._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.MemberRemoved._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t NearbyGroup_Group.MemberRemoved.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)( a1,  a2,  a3,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v7 = v4;
  uint64_t v11 = a2;
  for (uint64_t i = a3; ; uint64_t i = a3)
  {
    uint64_t result = dispatch thunk of Decoder.nextFieldNumber()(v11, i);
    if (v5 || (v14 & 1) != 0) {
      break;
    }
    if (result == 2)
    {
      closure #2 in NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)(a1, v7, a2, a3, a4);
    }

    else if (result == 1)
    {
      dispatch thunk of Decoder.decodeSingularBytesField(value:)(v7, a2, a3);
    }

    uint64_t v11 = a2;
  }

  return result;
}

uint64_t closure #2 in NearbyGroup_Group.MemberAdded.decodeMessage<A>(decoder:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v7 = a2 + *(int *)(a5(0LL) + 24);
  uint64_t v8 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v9 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
  return dispatch thunk of Decoder.decodeSingularMessageField<A>(value:)(v7, v8, v9, a3, a4);
}

void NearbyGroup_Group.MemberRemoved.traverse<A>(visitor:)()
{
}

uint64_t sub_100096B94(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xFF000000000000LL) == 0
    || (uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)(a1, a2, 1LL, v4, v3), !v2))
  {
    uint64_t result = closure #1 in NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)(v5, v7, v4, v3, v6);
    if (!v2)
    {
      v6(0LL);
      return UnknownStorage.traverse<A>(visitor:)(v7, v4, v3);
    }
  }

  return result;
}

uint64_t closure #1 in NearbyGroup_Group.MemberAdded.traverse<A>(visitor:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v21 = a4;
  uint64_t v20 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = a5(0LL);
  outlined init with copy of (String, Any)( a1 + *(int *)(v16 + 24),  (uint64_t)v10,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v10,  (uint64_t)v15,  type metadata accessor for NearbyGroup_Member);
  uint64_t v18 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
  dispatch thunk of Visitor.visitSingularMessageField<A>(value:fieldNumber:)(v15, 2LL, v11, v18, v20, v21);
  return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v15,  type metadata accessor for NearbyGroup_Member);
}

Swift::Int NearbyGroup_Group.MemberRemoved.hashValue.getter()
{
  return NearbyProtoSessionMessage.hashValue.getter( type metadata accessor for NearbyGroup_Group.MemberRemoved,  &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Group.MemberAdded@<X0>( uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = xmmword_1000AC690;
  UnknownStorage.init()(a1);
  uint64_t v4 = (char *)a2 + *(int *)(a1 + 24);
  uint64_t v5 = type metadata accessor for NearbyGroup_Member(0LL);
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56LL))(v4, 1LL, 1LL, v5);
}

uint64_t protocol witness for static Message.protoMessageName.getter in conformance NearbyGroup_Group.MemberRemoved( uint64_t a1, uint64_t a2)
{
  return protocol witness for static Message.protoMessageName.getter in conformance NearbyProtoConnectionResponse.Content( a1,  a2,  &one-time initialization token for protoMessageName,  static NearbyGroup_Group.MemberRemoved.protoMessageName,  &static NearbyGroup_Group.MemberRemoved.protoMessageName[1],  (uint64_t)one-time initialization function for protoMessageName);
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group.MemberRemoved( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberRemoved.decodeMessage<A>(decoder:)(a1, a2, a3);
}

void protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group.MemberRemoved()
{
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group.MemberRemoved( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group.MemberRemoved@<X0>( uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.MemberRemoved._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group.MemberRemoved( uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group.MemberRemoved( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
  return Message.hash(into:)(a1, a2, v4);
}

void one-time initialization function for protoMessageName(int a1, Swift::String a2, void *a3, void *a4)
{
  *a3 = 0x70756F72472E7063LL;
  *a4 = 0xE800000000000000LL;
}

void *NearbyGroup_Group.MemberLeft.protoMessageName.unsafeMutableAddressor()
{
  if (one-time initialization token for protoMessageName != -1) {
    swift_once( &one-time initialization token for protoMessageName,  one-time initialization function for protoMessageName);
  }
  return static NearbyGroup_Group.MemberLeft.protoMessageName;
}

uint64_t static NearbyGroup_Group.MemberLeft.protoMessageName.getter()
{
  return static NearbyProtoConnectionResponse.Content.protoMessageName.getter( &one-time initialization token for protoMessageName,  static NearbyGroup_Group.MemberLeft.protoMessageName,  &static NearbyGroup_Group.MemberLeft.protoMessageName[1]);
}

uint64_t NearbyGroup_Group.MemberLeft._protobuf_nameMap.unsafeMutableAddressor()
{
  return NearbyProtoNearbySessionMessageType._protobuf_nameMap.unsafeMutableAddressor( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.MemberLeft._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap);
}

uint64_t static NearbyGroup_Group.MemberLeft._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  return static NearbyProtoNearbySessionMessageType._protobuf_nameMap.getter( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.MemberLeft._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t NearbyGroup_Group.MemberLeft.decodeMessage<A>(decoder:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = dispatch thunk of Decoder.nextFieldNumber()(a2, a3);
  if (!v4)
  {
    while ((v8 & 1) == 0)
    {
      if (result == 2)
      {
        dispatch thunk of Decoder.decodeSingularBoolField(value:)(v3 + 16, a2, a3);
      }

      else if (result == 1)
      {
        dispatch thunk of Decoder.decodeSingularBytesField(value:)(v3, a2, a3);
      }

      uint64_t result = dispatch thunk of Decoder.nextFieldNumber()(a2, a3);
    }
  }

  return result;
}

void NearbyGroup_Group.MemberLeft.traverse<A>(visitor:)()
{
  __asm { BR              X10 }

uint64_t sub_1000972E8(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0xFF000000000000LL) == 0
    || (uint64_t result = dispatch thunk of Visitor.visitSingularBytesField(value:fieldNumber:)(a1, a2, 1LL, v4, v3), !v2))
  {
    if (*(_BYTE *)(v5 + 16) != 1
      || (uint64_t result = dispatch thunk of Visitor.visitSingularBoolField(value:fieldNumber:)(1LL, 2LL, v4, v3), !v2))
    {
      type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
      return UnknownStorage.traverse<A>(visitor:)(v6, v4, v3);
    }
  }

  return result;
}

Swift::Int NearbyGroup_Group.MemberLeft.hashValue.getter()
{
  return NearbyProtoSessionMessage.hashValue.getter( type metadata accessor for NearbyGroup_Group.MemberLeft,  &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
}

uint64_t protocol witness for Message.init() in conformance NearbyGroup_Group.MemberLeft@<X0>( uint64_t a1@<X8>)
{
  *(_OWORD *)a1 = xmmword_1000AC690;
  *(_BYTE *)(a1 + 16) = 0;
  return UnknownStorage.init()();
}

uint64_t protocol witness for static Message.protoMessageName.getter in conformance NearbyGroup_Group.MemberLeft( uint64_t a1, uint64_t a2)
{
  return protocol witness for static Message.protoMessageName.getter in conformance NearbyProtoConnectionResponse.Content( a1,  a2,  &one-time initialization token for protoMessageName,  static NearbyGroup_Group.MemberLeft.protoMessageName,  &static NearbyGroup_Group.MemberLeft.protoMessageName[1],  (uint64_t)one-time initialization function for protoMessageName);
}

uint64_t protocol witness for Message.decodeMessage<A>(decoder:) in conformance NearbyGroup_Group.MemberLeft( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return NearbyGroup_Group.MemberLeft.decodeMessage<A>(decoder:)(a1, a2, a3);
}

void protocol witness for Message.traverse<A>(visitor:) in conformance NearbyGroup_Group.MemberLeft()
{
}

uint64_t protocol witness for Message.isEqualTo(message:) in conformance NearbyGroup_Group.MemberLeft( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
  return _MessageImplementationBase.isEqualTo(message:)(a1, a2, v4);
}

uint64_t protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyGroup_Group.MemberLeft@<X0>( uint64_t a1@<X8>)
{
  return protocol witness for static _ProtoNameProviding._protobuf_nameMap.getter in conformance NearbyProtoNearbySessionMessageType( &one-time initialization token for _protobuf_nameMap,  (uint64_t)static NearbyGroup_Group.MemberLeft._protobuf_nameMap,  (uint64_t)one-time initialization function for _protobuf_nameMap,  a1);
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance NearbyGroup_Group.MemberLeft( uint64_t a1)
{
  uint64_t v2 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
  return Message.debugDescription.getter(a1, v2);
}

uint64_t protocol witness for Hashable.hash(into:) in conformance NearbyGroup_Group.MemberLeft( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
  return Message.hash(into:)(a1, a2, v4);
}

void closure #1 in static Data.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }

uint64_t sub_100097590( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20, char a21, char a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37)
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
    JUMPOUT(0x100097774LL);
  }

  uint64_t result = memcmp(v38, &v42, BYTE6(v40));
  *uint64_t v37 = (_DWORD)result == 0;
  return result;
}

uint64_t specialized static Array<A>.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v6 = __chkstk_darwin(v4, v5);
  char v8 = (uint64_t *)((char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  __chkstk_darwin(v6, v9);
  uint64_t v12 = (uint64_t *)((char *)&v39 - v11);
  uint64_t v13 = *(void *)(a1 + 16);
  if (v13 == *(void *)(a2 + 16))
  {
    if (!v13 || a1 == a2) {
      return 1LL;
    }
    unint64_t v14 = (*(unsigned __int8 *)(v10 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
    uint64_t v39 = *(void *)(v10 + 72);
    uint64_t v15 = type metadata accessor for NearbyGroup_Member;
    while (1)
    {
      outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation(a1 + v14, (uint64_t)v12, v15);
      outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation(a2 + v14, (uint64_t)v8, v15);
      uint64_t v16 = v12[1];
      uint64_t v17 = v8[1];
      BOOL v18 = *v12 == *v8 && v16 == v17;
      if (!v18 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v16, *v8, v17, 0LL) & 1) == 0) {
        break;
      }
      uint64_t v19 = *(int *)(v4 + 24);
      uint64_t v20 = (void *)((char *)v12 + v19);
      uint64_t v21 = *(void *)((char *)v12 + v19 + 8);
      uint64_t v22 = (void *)((char *)v8 + v19);
      uint64_t v23 = v22[1];
      if (v21)
      {
        if (!v23) {
          break;
        }
        BOOL v24 = *v20 == *v22 && v21 == v23;
        if (!v24 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, *v22, v23, 0LL) & 1) == 0) {
          break;
        }
      }

      else if (v23)
      {
        break;
      }

      uint64_t v25 = *(int *)(v4 + 20);
      uint64_t v26 = (char *)v12 + v25;
      uint64_t v40 = v13;
      uint64_t v27 = (char *)v8 + v25;
      uint64_t v28 = (uint64_t)v8;
      uint64_t v29 = v4;
      uint64_t v30 = v15;
      uint64_t v31 = a1;
      uint64_t v32 = a2;
      uint64_t v33 = type metadata accessor for UnknownStorage(0LL);
      uint64_t v34 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage,  (uint64_t (*)(uint64_t))&type metadata accessor for UnknownStorage,  (uint64_t)&protocol conformance descriptor for UnknownStorage);
      uint64_t v35 = v27;
      uint64_t v36 = v40;
      char v37 = dispatch thunk of static Equatable.== infix(_:_:)(v26, v35, v33, v34);
      a2 = v32;
      a1 = v31;
      uint64_t v15 = v30;
      uint64_t v4 = v29;
      char v8 = (void *)v28;
      if ((v37 & 1) == 0) {
        break;
      }
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization(v28, v15);
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization((uint64_t)v12, v15);
      v14 += v39;
      uint64_t v13 = v36 - 1;
      if (!v13) {
        return 1LL;
      }
    }

    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v8,  type metadata accessor for NearbyGroup_Member);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v12,  type metadata accessor for NearbyGroup_Member);
  }

  return 0LL;
}

uint64_t specialized static Array<A>.== infix(_:_:)(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0LL;
  }
  if (!v2 || a1 == a2) {
    return 1LL;
  }
  uint64_t v5 = a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a2[4];
  uint64_t v8 = a2[5];
  BOOL v9 = v5 == v7 && v6 == v8;
  if (v9 || (v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, v7, v8, 0LL), uint64_t result = 0LL, (v10 & 1) != 0))
  {
    uint64_t v12 = v2 - 1;
    if (!v12) {
      return 1LL;
    }
    uint64_t v13 = a1 + 7;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      uint64_t v15 = *(v13 - 1);
      uint64_t v16 = *v13;
      uint64_t v17 = *(i - 1);
      uint64_t v18 = *i;
      BOOL v19 = v15 == v17 && v16 == v18;
      if (!v19 && (_stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v17, v18, 0LL) & 1) == 0) {
        break;
      }
      v13 += 2;
      if (!--v12) {
        return 1LL;
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t specialized Data.InlineData.withUnsafeBytes<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  closure #1 in static Data.== infix(_:_:)((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t specialized __DataStorage.withUnsafeBytes<A>(in:apply:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
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

  uint64_t v14 = __DataStorage._length.getter();
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
  closure #1 in static Data.== infix(_:_:)(v11, v17, a4, a5);
  if (!v5) {
    char v18 = v19;
  }
  return v18 & 1;
}

void specialized static Data.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }

uint64_t sub_100097C58()
{
  return ((uint64_t (*)(void))((char *)&loc_100097C8C + dword_100097E64[v0 >> 62]))();
}

uint64_t sub_100097C9C@<X0>(int a1@<W8>)
{
  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1) {
      __asm { BR              X10 }
    }

    char v3 = 1;
  }

  else
  {
    char v3 = 0;
  }

  return v3 & 1;
}

uint64_t specialized static NearbyGroup_Group.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v51 = *(void *)(v47 - 8);
  uint64_t v5 = __chkstk_darwin(v47, v4);
  uint64_t v50 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v5, v7);
  uint64_t v49 = (char *)&v44 - v8;
  uint64_t v9 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9, v11);
  uint64_t v45 = (uint64_t)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (NearbyGroup_Group.OneOf_Event?, NearbyGroup_Group.OneOf_Event?));
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v19 = __chkstk_darwin(v17, v18);
  uint64_t v21 = (char *)&v44 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = __chkstk_darwin(v19, v22);
  uint64_t v25 = (char *)&v44 - v24;
  __chkstk_darwin(v23, v26);
  uint64_t v28 = (char *)&v44 - v27;
  uint64_t v46 = a1;
  outlined init with copy of (String, Any)( a1,  (uint64_t)&v44 - v27,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v48 = a2;
  outlined init with copy of (String, Any)( a2,  (uint64_t)v25,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v29 = (uint64_t)&v16[*(int *)(v13 + 48)];
  outlined init with copy of (String, Any)( (uint64_t)v28,  (uint64_t)v16,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  outlined init with copy of (String, Any)( (uint64_t)v25,  v29,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v30((uint64_t)v16, 1LL, v9) != 1)
  {
    outlined init with copy of (String, Any)( (uint64_t)v16,  (uint64_t)v21,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    if (v30(v29, 1LL, v9) != 1)
    {
      uint64_t v31 = v45;
      outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v29,  v45,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
      specialized static NearbyGroup_Group.OneOf_Event.__derived_enum_equals(_:_:)((uint64_t)v21, v31);
      char v33 = v32;
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v31,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
      outlined destroy of Any?( (uint64_t)v25,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
      outlined destroy of Any?( (uint64_t)v28,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
      outlined destroy of Any?( (uint64_t)v16,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
      if ((v33 & 1) != 0) {
        goto LABEL_8;
      }
LABEL_9:
      char v41 = 0;
      return v41 & 1;
    }

    outlined destroy of Any?( (uint64_t)v25,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined destroy of Any?( (uint64_t)v28,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v21,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
LABEL_6:
    outlined destroy of Any?( (uint64_t)v16,  &demangling cache variable for type metadata for (NearbyGroup_Group.OneOf_Event?, NearbyGroup_Group.OneOf_Event?));
    goto LABEL_9;
  }

  outlined destroy of Any?( (uint64_t)v25,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  outlined destroy of Any?( (uint64_t)v28,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  if (v30(v29, 1LL, v9) != 1) {
    goto LABEL_6;
  }
  outlined destroy of Any?( (uint64_t)v16,  &demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
LABEL_8:
  uint64_t v34 = type metadata accessor for NearbyGroup_Group(0LL);
  uint64_t v35 = v47;
  uint64_t v36 = v51;
  char v37 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
  uint64_t v38 = v49;
  v37(v49, v46 + *(int *)(v34 + 20), v47);
  uint64_t v39 = v50;
  v37(v50, v48 + *(int *)(v34 + 20), v35);
  uint64_t v40 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage,  (uint64_t (*)(uint64_t))&type metadata accessor for UnknownStorage,  (uint64_t)&protocol conformance descriptor for UnknownStorage);
  char v41 = dispatch thunk of static Equatable.== infix(_:_:)(v38, v39, v35, v40);
  uint64_t v42 = *(void (**)(char *, uint64_t))(v36 + 8);
  v42(v39, v35);
  v42(v38, v35);
  return v41 & 1;
}

uint64_t specialized static NearbyGroup_Group.Initialization.== infix(_:_:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7, v10);
  uint64_t v12 = (char *)&v21 - v11;
  specialized static Data.== infix(_:_:)(*a1, a1[1]);
  if ((v13 & 1) != 0 && (specialized static Array<A>.== infix(_:_:)(a1[2], *(void *)(a2 + 16)) & 1) != 0)
  {
    uint64_t v14 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
    uint64_t v15 = (char *)a1 + *(int *)(v14 + 24);
    uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
    v16(v12, v15, v4);
    v16(v9, (char *)(a2 + *(int *)(v14 + 24)), v4);
    uint64_t v17 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage,  (uint64_t (*)(uint64_t))&type metadata accessor for UnknownStorage,  (uint64_t)&protocol conformance descriptor for UnknownStorage);
    char v18 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v9, v4, v17);
    uint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19(v9, v4);
    v19(v12, v4);
  }

  else
  {
    char v18 = 0;
  }

  return v18 & 1;
}

void specialized static NearbyGroup_Group.OneOf_Event.__derived_enum_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v29 = a1;
  uint64_t v30 = a2;
  uint64_t v26 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
  __chkstk_darwin(v26, v2);
  uint64_t v28 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v4 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL);
  __chkstk_darwin(v4, v5);
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.MemberAdded(0LL);
  __chkstk_darwin(v6, v7);
  uint64_t v25 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
  __chkstk_darwin(v25, v8);
  uint64_t v27 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  uint64_t v12 = __chkstk_darwin(v10, v11);
  uint64_t v14 = __chkstk_darwin(v12, v13);
  uint64_t v16 = __chkstk_darwin(v14, v15);
  __chkstk_darwin(v16, v17);
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (NearbyGroup_Group.OneOf_Event, NearbyGroup_Group.OneOf_Event));
  uint64_t v20 = __chkstk_darwin(v18, v19);
  uint64_t v22 = (char *)&v25 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = (uint64_t)&v22[*(int *)(v20 + 48)];
  outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v29,  (uint64_t)v22,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v30,  v23,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  uint64_t v24 = (char *)sub_1000985B0 + 4 * byte_1000AE604[swift_getEnumCaseMultiPayload(v22, v10)];
  __asm { BR              X10 }

uint64_t sub_1000985B0()
{
  if (swift_getEnumCaseMultiPayload(v3, v1))
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v2,  type metadata accessor for NearbyGroup_Group.Initialization);
    outlined destroy of Any?( v0,  (uint64_t *)&demangling cache variable for type metadata for (NearbyGroup_Group.OneOf_Event, NearbyGroup_Group.OneOf_Event));
LABEL_8:
    char v12 = 0;
    return v12 & 1;
  }

  uint64_t v5 = *(void *)(v4 - 112);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v3,  v5,  type metadata accessor for NearbyGroup_Group.Initialization);
  specialized static Data.== infix(_:_:)(*v2, v2[1]);
  if ((v6 & 1) == 0
    || (specialized static Array<A>.== infix(_:_:)(v2[2], *(void *)(v5 + 16)) & 1) == 0
    || (uint64_t v7 = *(int *)(*(void *)(v4 - 128) + 24LL),
        uint64_t v8 = (char *)v2 + v7,
        uint64_t v9 = v5 + v7,
        uint64_t v10 = type metadata accessor for UnknownStorage(0LL),
        uint64_t v11 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage,  (uint64_t (*)(uint64_t))&type metadata accessor for UnknownStorage,  (uint64_t)&protocol conformance descriptor for UnknownStorage),  (dispatch thunk of static Equatable.== infix(_:_:)(v8, v9, v10, v11) & 1) == 0))
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v5,  type metadata accessor for NearbyGroup_Group.Initialization);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v2,  type metadata accessor for NearbyGroup_Group.Initialization);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v0,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    goto LABEL_8;
  }

  outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v5,  type metadata accessor for NearbyGroup_Group.Initialization);
  outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v2,  type metadata accessor for NearbyGroup_Group.Initialization);
  outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v0,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
  char v12 = 1;
  return v12 & 1;
}

uint64_t specialized static NearbyGroup_Group.MemberRemoved.== infix(_:_:)( uint64_t *a1, uint64_t a2, uint64_t (*a3)(void))
{
  os_unfair_lock_t v61 = a3;
  uint64_t v5 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v59 = *(void *)(v5 - 8);
  uint64_t v60 = v5;
  uint64_t v7 = __chkstk_darwin(v5, v6);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7, v10);
  char v12 = (char *)&v54 - v11;
  uint64_t v13 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v62 = *(void *)(v13 - 8);
  uint64_t v63 = v13;
  __chkstk_darwin(v13, v14);
  uint64_t v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (NearbyGroup_Member?, NearbyGroup_Member?));
  __chkstk_darwin(v17, v18);
  uint64_t v20 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v23 = __chkstk_darwin(v21, v22);
  uint64_t v25 = (char *)&v54 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v27 = __chkstk_darwin(v23, v26);
  uint64_t v29 = (char *)&v54 - v28;
  __chkstk_darwin(v27, v30);
  char v32 = (char *)&v54 - v31;
  specialized static Data.== infix(_:_:)(*a1, a1[1]);
  if ((v33 & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v57 = v9;
  uint64_t v58 = v25;
  uint64_t v55 = v16;
  uint64_t v56 = v12;
  uint64_t v34 = v61(0LL);
  outlined init with copy of (String, Any)( (uint64_t)a1 + *(int *)(v34 + 24),  (uint64_t)v32,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with copy of (String, Any)( a2 + *(int *)(v34 + 24),  (uint64_t)v29,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v35 = (uint64_t)&v20[*(int *)(v17 + 48)];
  outlined init with copy of (String, Any)( (uint64_t)v32,  (uint64_t)v20,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined init with copy of (String, Any)( (uint64_t)v29,  v35,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  uint64_t v36 = v63;
  char v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v62 + 48);
  uint64_t v38 = a2;
  uint64_t v39 = v34;
  if (v37((uint64_t)v20, 1LL, v63) == 1)
  {
    outlined destroy of Any?((uint64_t)v29, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined destroy of Any?((uint64_t)v32, &demangling cache variable for type metadata for NearbyGroup_Member?);
    if (v37(v35, 1LL, v36) == 1)
    {
      outlined destroy of Any?((uint64_t)v20, &demangling cache variable for type metadata for NearbyGroup_Member?);
LABEL_11:
      uint64_t v45 = (char *)a1 + *(int *)(v39 + 20);
      uint64_t v47 = v59;
      uint64_t v46 = v60;
      uint64_t v48 = *(void (**)(char *, char *, uint64_t))(v59 + 16);
      uint64_t v49 = v56;
      v48(v56, v45, v60);
      uint64_t v50 = (char *)(v38 + *(int *)(v39 + 20));
      uint64_t v51 = v57;
      v48(v57, v50, v46);
      uint64_t v52 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage,  (uint64_t (*)(uint64_t))&type metadata accessor for UnknownStorage,  (uint64_t)&protocol conformance descriptor for UnknownStorage);
      char v41 = dispatch thunk of static Equatable.== infix(_:_:)(v49, v51, v46, v52);
      uint64_t v53 = *(void (**)(char *, uint64_t))(v47 + 8);
      v53(v51, v46);
      v53(v49, v46);
      return v41 & 1;
    }

    goto LABEL_7;
  }

  uint64_t v40 = v58;
  outlined init with copy of (String, Any)( (uint64_t)v20,  (uint64_t)v58,  &demangling cache variable for type metadata for NearbyGroup_Member?);
  if (v37(v35, 1LL, v36) == 1)
  {
    outlined destroy of Any?((uint64_t)v29, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined destroy of Any?((uint64_t)v32, &demangling cache variable for type metadata for NearbyGroup_Member?);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v40,  type metadata accessor for NearbyGroup_Member);
LABEL_7:
    outlined destroy of Any?( (uint64_t)v20,  &demangling cache variable for type metadata for (NearbyGroup_Member?, NearbyGroup_Member?));
    goto LABEL_8;
  }

  __int16 v43 = v55;
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v35,  (uint64_t)v55,  type metadata accessor for NearbyGroup_Member);
  char v44 = specialized static NearbyGroup_Member.== infix(_:_:)(v40, v43);
  outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v43,  type metadata accessor for NearbyGroup_Member);
  outlined destroy of Any?((uint64_t)v29, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined destroy of Any?((uint64_t)v32, &demangling cache variable for type metadata for NearbyGroup_Member?);
  outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v40,  type metadata accessor for NearbyGroup_Member);
  outlined destroy of Any?((uint64_t)v20, &demangling cache variable for type metadata for NearbyGroup_Member?);
  if ((v44 & 1) != 0) {
    goto LABEL_11;
  }
LABEL_8:
  char v41 = 0;
  return v41 & 1;
}

uint64_t specialized static NearbyGroup_Group.MemberLeft.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7, v10);
  char v12 = (char *)&v21 - v11;
  specialized static Data.== infix(_:_:)(*(void *)a1, *(void *)(a1 + 8));
  if ((v13 & 1) != 0 && *(unsigned __int8 *)(a1 + 16) == *(unsigned __int8 *)(a2 + 16))
  {
    uint64_t v15 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
    uint64_t v16 = a1 + *(int *)(v15 + 24);
    uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v17(v12, v16, v4);
    v17(v9, a2 + *(int *)(v15 + 24), v4);
    uint64_t v18 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage,  (uint64_t (*)(uint64_t))&type metadata accessor for UnknownStorage,  (uint64_t)&protocol conformance descriptor for UnknownStorage);
    char v14 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v9, v4, v18);
    uint64_t v19 = *(void (**)(char *, uint64_t))(v5 + 8);
    v19(v9, v4);
    v19(v12, v4);
  }

  else
  {
    char v14 = 0;
  }

  return v14 & 1;
}

uint64_t specialized static NearbyGroup_Member.== infix(_:_:)(void *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v7, v10);
  char v12 = (char *)&v29 - v11;
  uint64_t v13 = a1[1];
  uint64_t v14 = *((void *)a2 + 1);
  if (*a1 != *(void *)a2 || v13 != v14)
  {
    char v16 = 0;
    if ((_stringCompareWithSmolCheck(_:_:expecting:)(*a1, v13, *(void *)a2, v14, 0LL) & 1) == 0) {
      return v16 & 1;
    }
  }

  uint64_t v17 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v18 = *(int *)(v17 + 24);
  uint64_t v19 = (void *)((char *)a1 + v18);
  uint64_t v20 = *(void *)((char *)a1 + v18 + 8);
  uint64_t v21 = &a2[v18];
  uint64_t v22 = *((void *)v21 + 1);
  if (!v20)
  {
    if (!v22)
    {
LABEL_16:
      uint64_t v24 = (char *)a1 + *(int *)(v17 + 20);
      uint64_t v25 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v25(v12, v24, v4);
      v25(v9, &a2[*(int *)(v17 + 20)], v4);
      uint64_t v26 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type UnknownStorage and conformance UnknownStorage,  (uint64_t (*)(uint64_t))&type metadata accessor for UnknownStorage,  (uint64_t)&protocol conformance descriptor for UnknownStorage);
      char v16 = dispatch thunk of static Equatable.== infix(_:_:)(v12, v9, v4, v26);
      uint64_t v27 = *(void (**)(char *, uint64_t))(v5 + 8);
      v27(v9, v4);
      v27(v12, v4);
      return v16 & 1;
    }

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Member()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
}

uint64_t base witness table accessor for Message in NearbyGroup_Member()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Member()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Member()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Member and conformance NearbyGroup_Member,  type metadata accessor for NearbyGroup_Member,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Member);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group,  type metadata accessor for NearbyGroup_Group,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group,  type metadata accessor for NearbyGroup_Group,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group,  type metadata accessor for NearbyGroup_Group,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group and conformance NearbyGroup_Group,  type metadata accessor for NearbyGroup_Group,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group.Initialization()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group.Initialization()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group.Initialization()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group.Initialization()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.Initialization and conformance NearbyGroup_Group.Initialization,  type metadata accessor for NearbyGroup_Group.Initialization,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.Initialization);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group.MemberAdded()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group.MemberAdded()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group.MemberAdded()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group.MemberAdded()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberAdded and conformance NearbyGroup_Group.MemberAdded,  type metadata accessor for NearbyGroup_Group.MemberAdded,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberAdded);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group.MemberRemoved()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group.MemberRemoved()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group.MemberRemoved()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group.MemberRemoved()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberRemoved and conformance NearbyGroup_Group.MemberRemoved,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberRemoved);
}

uint64_t base witness table accessor for CustomDebugStringConvertible in NearbyGroup_Group.MemberLeft()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
}

uint64_t base witness table accessor for Message in NearbyGroup_Group.MemberLeft()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
}

uint64_t base witness table accessor for Hashable in NearbyGroup_Group.MemberLeft()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
}

uint64_t base witness table accessor for Equatable in NearbyGroup_Group.MemberLeft()
{
  return lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyGroup_Group.MemberLeft and conformance NearbyGroup_Group.MemberLeft,  type metadata accessor for NearbyGroup_Group.MemberLeft,  (uint64_t)&protocol conformance descriptor for NearbyGroup_Group.MemberLeft);
}

uint64_t sub_10009940C@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Group.initialize.getter(a1);
}

uint64_t sub_10009942C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group( a1,  a2,  a3,  a4,  type metadata accessor for NearbyGroup_Group.Initialization,  0LL);
}

uint64_t sub_10009944C@<X0>(_OWORD *a1@<X8>)
{
  return NearbyGroup_Group.memberAdded.getter(a1);
}

uint64_t sub_10009946C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group( a1,  a2,  a3,  a4,  type metadata accessor for NearbyGroup_Group.MemberAdded,  1LL);
}

uint64_t sub_10009948C@<X0>(_OWORD *a1@<X8>)
{
  return NearbyGroup_Group.memberRemoved.getter(a1);
}

uint64_t sub_1000994AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group( a1,  a2,  a3,  a4,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  2LL);
}

uint64_t sub_1000994CC@<X0>(uint64_t a1@<X8>)
{
  return NearbyGroup_Group.memberLeft.getter(a1);
}

uint64_t sub_1000994EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.initialize : NearbyGroup_Group( a1,  a2,  a3,  a4,  type metadata accessor for NearbyGroup_Group.MemberLeft,  3LL);
}

uint64_t sub_10009950C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return key path getter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded( a1,  type metadata accessor for NearbyGroup_Group.MemberAdded,  a2);
}

uint64_t sub_100099528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded( a1,  a2,  a3,  a4,  type metadata accessor for NearbyGroup_Group.MemberAdded);
}

uint64_t sub_100099544@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return key path getter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded( a1,  type metadata accessor for NearbyGroup_Group.MemberRemoved,  a2);
}

uint64_t sub_100099560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return key path setter for NearbyGroup_Group.MemberAdded.member : NearbyGroup_Group.MemberAdded( a1,  a2,  a3,  a4,  type metadata accessor for NearbyGroup_Group.MemberRemoved);
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroup_Member(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v17 = *a2;
    *uint64_t v4 = *a2;
    uint64_t v4 = (uint64_t *)(v17 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain(v17);
  }

  else
  {
    uint64_t v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for UnknownStorage(0LL);
    char v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL);
    swift_bridgeObjectRetain(v7);
    v12(v9, v10, v11);
    uint64_t v13 = *(int *)(a3 + 24);
    uint64_t v14 = (uint64_t *)((char *)v4 + v13);
    uint64_t v15 = (uint64_t *)((char *)a2 + v13);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain(v16);
  }

  return v4;
}

uint64_t destroy for NearbyGroup_Member(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
  return swift_bridgeObjectRelease(*(void *)(a1 + *(int *)(a2 + 24) + 8));
}

void *initializeWithCopy for NearbyGroup_Member(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 16LL);
  swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v15 = v14[1];
  *uint64_t v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  return a1;
}

void *assignWithCopy for NearbyGroup_Member(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 24LL))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  *uint64_t v13 = *v14;
  uint64_t v15 = v14[1];
  uint64_t v16 = v13[1];
  v13[1] = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRelease(v16);
  return a1;
}

_OWORD *initializeWithTake for NearbyGroup_Member(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void *assignWithTake for NearbyGroup_Member(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 40LL))(v9, v10, v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (void *)((char *)a1 + v12);
  uint64_t v14 = (void *)((char *)a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  uint64_t v17 = v13[1];
  *uint64_t v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease(v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Member(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000998FC);
}

uint64_t sub_1000998FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 20),  a2,  v8);
  }

uint64_t storeEnumTagSinglePayload for NearbyGroup_Member(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100099984);
}

uint64_t sub_100099984(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 20),  a2,  a2,  v7);
  }

  return result;
}

uint64_t type metadata completion function for NearbyGroup_Member(uint64_t a1)
{
  v4[0] = &unk_1000AEF18;
  uint64_t result = type metadata accessor for UnknownStorage(319LL);
  if (v3 <= 0x3F)
  {
    v4[1] = *(void *)(result - 8) + 64LL;
    void v4[2] = &unk_1000AEF30;
    swift_initStructMetadata(a1, 256LL, 3LL, v4, a1 + 16);
    return 0LL;
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroup_Group(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
    if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48LL))(a2, 1LL, v7))
    {
      uint64_t v10 = (char *)&loc_100099B44 + 4 * byte_1000AE608[swift_getEnumCaseMultiPayload(a2, v7)];
      __asm { BR              X10 }
    }

    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64LL));
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = type metadata accessor for UnknownStorage(0LL);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16LL))(v12, v13, v14);
  }

  return a1;
}

uint64_t destroy for NearbyGroup_Group(uint64_t *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48LL))(a1, 1LL, v4))
  {
    switch(swift_getEnumCaseMultiPayload(a1, v4))
    {
      case 0u:
        outlined consume of Data._Representation(*a1, a1[1]);
        swift_bridgeObjectRelease(a1[2]);
        uint64_t v8 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
        goto LABEL_10;
      case 1u:
        outlined consume of Data._Representation(*a1, a1[1]);
        uint64_t v9 = type metadata accessor for NearbyGroup_Group.MemberAdded(0LL);
        goto LABEL_7;
      case 2u:
        outlined consume of Data._Representation(*a1, a1[1]);
        uint64_t v9 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL);
LABEL_7:
        uint64_t v10 = v9;
        uint64_t v11 = (char *)a1 + *(int *)(v9 + 20);
        uint64_t v12 = type metadata accessor for UnknownStorage(0LL);
        uint64_t v13 = *(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8LL);
        v13(v11, v12);
        uint64_t v14 = (char *)a1 + *(int *)(v10 + 24);
        uint64_t v15 = type metadata accessor for NearbyGroup_Member(0LL);
        if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 48LL))(v14, 1LL, v15))
        {
          swift_bridgeObjectRelease(*((void *)v14 + 1));
          v13(&v14[*(int *)(v15 + 20)], v12);
          swift_bridgeObjectRelease(*(void *)&v14[*(int *)(v15 + 24) + 8]);
        }

        break;
      case 3u:
        outlined consume of Data._Representation(*a1, a1[1]);
        uint64_t v8 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
LABEL_10:
        uint64_t v16 = (char *)a1 + *(int *)(v8 + 24);
        uint64_t v17 = type metadata accessor for UnknownStorage(0LL);
        (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8LL))(v16, v17);
        break;
      default:
        break;
    }
  }

  int v5 = (char *)a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for UnknownStorage(0LL);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8LL))(v5, v6);
}

char *initializeWithCopy for NearbyGroup_Group(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL))(a2, 1LL, v6))
  {
    uint64_t v8 = (char *)&loc_100099FFC + 4 * byte_1000AE610[swift_getEnumCaseMultiPayload(a2, v6)];
    __asm { BR              X10 }
  }

  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
  return a1;
}

char *assignWithCopy for NearbyGroup_Group(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL);
  int v8 = v7(a1, 1LL, v6);
  int v9 = v7(a2, 1LL, v6);
  if (v8)
  {
    if (!v9)
    {
      uint64_t v10 = (char *)&loc_10009A2FC + 4 * byte_1000AE614[swift_getEnumCaseMultiPayload(a2, v6)];
      __asm { BR              X10 }
    }

    goto LABEL_6;
  }

  if (v9)
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)a1,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64LL));
    goto LABEL_9;
  }

  if (a1 != a2)
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)a1,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v12 = (char *)&loc_10009A3E0 + 4 * byte_1000AE618[swift_getEnumCaseMultiPayload(a2, v6)];
    __asm { BR              X10 }
  }

char *initializeWithTake for NearbyGroup_Group(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL))(a2, 1LL, v6))
  {
    int v8 = (char *)&loc_10009AAB4 + 4 * byte_1000AE61C[swift_getEnumCaseMultiPayload(a2, v6)];
    __asm { BR              X10 }
  }

  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64LL));
  uint64_t v9 = *(int *)(a3 + 20);
  uint64_t v10 = &a1[v9];
  uint64_t v11 = &a2[v9];
  uint64_t v12 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 32LL))(v10, v11, v12);
  return a1;
}

char *assignWithTake for NearbyGroup_Group(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for NearbyGroup_Group.OneOf_Event(0LL);
  uint64_t v7 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48LL);
  int v8 = v7(a1, 1LL, v6);
  int v9 = v7(a2, 1LL, v6);
  if (v8)
  {
    if (!v9)
    {
      uint64_t v10 = (char *)&loc_10009AE40 + 4 * byte_1000AE620[swift_getEnumCaseMultiPayload(a2, v6)];
      __asm { BR              X10 }
    }

    goto LABEL_6;
  }

  if (v9)
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)a1,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
LABEL_6:
    uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64LL));
    goto LABEL_9;
  }

  if (a1 != a2)
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)a1,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v12 = (char *)&loc_10009AF0C + 4 * byte_1000AE624[swift_getEnumCaseMultiPayload(a2, v6)];
    __asm { BR              X10 }
  }

uint64_t getEnumTagSinglePayload for NearbyGroup_Group(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10009B44C);
}

uint64_t sub_10009B44C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    uint64_t v8 = v6;
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
  }

  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage(0LL);
    uint64_t v10 = a1 + *(int *)(a3 + 20);
    int v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL);
  }

  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10009B4D0);
}

uint64_t sub_10009B4D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Group.OneOf_Event?);
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
  }

  else
  {
    uint64_t v10 = type metadata accessor for UnknownStorage(0LL);
    uint64_t v12 = a1 + *(int *)(a4 + 20);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56LL);
  }

  return v11(v12, a2, a2, v10);
}

void type metadata completion function for NearbyGroup_Group(uint64_t a1)
{
  if (v3 <= 0x3F)
  {
    v6[0] = *(void *)(v2 - 8) + 64LL;
    uint64_t v4 = type metadata accessor for UnknownStorage(319LL);
    if (v5 <= 0x3F)
    {
      v6[1] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 2LL, v6, a1 + 16);
    }
  }

uint64_t initializeBufferWithCopyOfBuffer for NearbyGroup_Group.OneOf_Event( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v4 & 0x20000) == 0)
  {
    unint64_t v5 = (char *)&loc_10009B640 + 4 * byte_1000AE628[swift_getEnumCaseMultiPayload(a2, a3)];
    __asm { BR              X10 }
  }

  uint64_t v6 = *a2;
  *a1 = *a2;
  uint64_t v7 = v6 + ((v4 + 16LL) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for NearbyGroup_Group.OneOf_Event(uint64_t *a1, uint64_t a2)
{
  uint64_t result = swift_getEnumCaseMultiPayload(a1, a2);
  switch((int)result)
  {
    case 0:
      outlined consume of Data._Representation(*a1, a1[1]);
      swift_bridgeObjectRelease(a1[2]);
      uint64_t v4 = type metadata accessor for NearbyGroup_Group.Initialization(0LL);
      goto LABEL_8;
    case 1:
      outlined consume of Data._Representation(*a1, a1[1]);
      uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberAdded(0LL);
      goto LABEL_5;
    case 2:
      outlined consume of Data._Representation(*a1, a1[1]);
      uint64_t v5 = type metadata accessor for NearbyGroup_Group.MemberRemoved(0LL);
LABEL_5:
      uint64_t v6 = v5;
      uint64_t v7 = (char *)a1 + *(int *)(v5 + 20);
      uint64_t v8 = type metadata accessor for UnknownStorage(0LL);
      uint64_t v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8LL);
      v9(v7, v8);
      uint64_t v10 = (char *)a1 + *(int *)(v6 + 24);
      uint64_t v11 = type metadata accessor for NearbyGroup_Member(0LL);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48LL))(v10, 1LL, v11);
      if (!(_DWORD)result)
      {
        swift_bridgeObjectRelease(*((void *)v10 + 1));
        v9(&v10[*(int *)(v11 + 20)], v8);
        uint64_t result = swift_bridgeObjectRelease(*(void *)&v10[*(int *)(v11 + 24) + 8]);
      }

      break;
    case 3:
      outlined consume of Data._Representation(*a1, a1[1]);
      uint64_t v4 = type metadata accessor for NearbyGroup_Group.MemberLeft(0LL);
LABEL_8:
      uint64_t v12 = (char *)a1 + *(int *)(v4 + 24);
      uint64_t v13 = type metadata accessor for UnknownStorage(0LL);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8LL))(v12, v13);
      break;
    default:
      return result;
  }

  return result;
}

void initializeWithCopy for NearbyGroup_Group.OneOf_Event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = (char *)sub_10009BB30 + 4 * byte_1000AE630[swift_getEnumCaseMultiPayload(a2, a3)];
  __asm { BR              X10 }

uint64_t *sub_10009BB30()
{
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  outlined copy of Data._Representation(*v3, v5);
  uint64_t *v0 = v4;
  v0[1] = v5;
  uint64_t v6 = v3[2];
  v0[2] = v6;
  uint64_t v7 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0LL) + 24);
  uint64_t v8 = (char *)v0 + v7;
  uint64_t v9 = (char *)v3 + v7;
  uint64_t v10 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v11 = *(void (**)(char *, char *, uint64_t, __n128))(*(void *)(v10 - 8) + 16LL);
  __n128 v12 = swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10, v12);
  swift_storeEnumTagMultiPayload(v0, v1, v2);
  return v0;
}

uint64_t assignWithCopy for NearbyGroup_Group.OneOf_Event(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result != a2)
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( result,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    unint64_t v5 = (char *)&loc_10009BDAC + 4 * byte_1000AE634[swift_getEnumCaseMultiPayload(a2, a3)];
    __asm { BR              X10 }
  }

  return result;
}

void initializeWithTake for NearbyGroup_Group.OneOf_Event(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = (char *)sub_10009C014 + 4 * byte_1000AE638[swift_getEnumCaseMultiPayload(a2, a3)];
  __asm { BR              X10 }

uint64_t sub_10009C014()
{
  *(_OWORD *)uint64_t v0 = *(_OWORD *)v2;
  *(void *)(v0 + 16) = *(void *)(v2 + 16);
  uint64_t v3 = *(int *)(type metadata accessor for NearbyGroup_Group.Initialization(0LL) + 24);
  uint64_t v4 = v0 + v3;
  uint64_t v5 = v2 + v3;
  uint64_t v6 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32LL))(v4, v5, v6);
  swift_storeEnumTagMultiPayload(v0, v1, 0LL);
  return v0;
}

uint64_t assignWithTake for NearbyGroup_Group.OneOf_Event(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result != a2)
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( result,  type metadata accessor for NearbyGroup_Group.OneOf_Event);
    uint64_t v5 = (char *)&loc_10009C314 + 4 * byte_1000AE63C[swift_getEnumCaseMultiPayload(a2, a3)];
    __asm { BR              X10 }
  }

  return result;
}

uint64_t type metadata completion function for NearbyGroup_Group.OneOf_Event(uint64_t a1)
{
  uint64_t result = type metadata accessor for NearbyGroup_Group.Initialization(319LL);
  if (v3 <= 0x3F)
  {
    v7[0] = *(void *)(result - 8) + 64LL;
    uint64_t result = type metadata accessor for NearbyGroup_Group.MemberAdded(319LL);
    if (v4 <= 0x3F)
    {
      v7[1] = *(void *)(result - 8) + 64LL;
      uint64_t result = type metadata accessor for NearbyGroup_Group.MemberRemoved(319LL);
      if (v5 <= 0x3F)
      {
        v7[2] = *(void *)(result - 8) + 64LL;
        uint64_t result = type metadata accessor for NearbyGroup_Group.MemberLeft(319LL);
        if (v6 <= 0x3F)
        {
          v7[3] = *(void *)(result - 8) + 64LL;
          swift_initEnumMetadataMultiPayload(a1, 256LL, 4LL, v7);
          return 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroup_Group.Initialization( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    outlined copy of Data._Representation(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = a2[2];
    a1[2] = v9;
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (char *)a1 + v10;
    __n128 v12 = (char *)a2 + v10;
    uint64_t v13 = type metadata accessor for UnknownStorage(0LL);
    uint64_t v14 = *(void (**)(char *, char *, uint64_t, __n128))(*(void *)(v13 - 8) + 16LL);
    __n128 v15 = swift_bridgeObjectRetain(v9);
    v14(v11, v12, v13, v15);
  }

  return a1;
}

uint64_t destroy for NearbyGroup_Group.Initialization(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = (char *)a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage(0LL);
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t *initializeWithCopy for NearbyGroup_Group.Initialization(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  outlined copy of Data._Representation(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = a2[2];
  a1[2] = v8;
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = (char *)a2 + v9;
  uint64_t v12 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t, __n128))(*(void *)(v12 - 8) + 16LL);
  __n128 v14 = swift_bridgeObjectRetain(v8);
  v13(v10, v11, v12, v14);
  return a1;
}

uint64_t *assignWithCopy for NearbyGroup_Group.Initialization(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  outlined copy of Data._Representation(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  outlined consume of Data._Representation(v8, v9);
  uint64_t v10 = a2[2];
  uint64_t v11 = a1[2];
  a1[2] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = (char *)a1 + v12;
  __n128 v14 = (char *)a2 + v12;
  uint64_t v15 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v15 - 8) + 24LL))(v13, v14, v15);
  return a1;
}

uint64_t initializeWithTake for NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32LL))(v5, v6, v7);
  return a1;
}

uint64_t *assignWithTake for NearbyGroup_Group.Initialization(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v6, v7);
  uint64_t v8 = a1[2];
  a1[2] = *(void *)(a2 + 16);
  swift_bridgeObjectRelease(v8);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = (char *)a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40LL))(v10, v11, v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Group.Initialization(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10009C988);
}

uint64_t sub_10009C988(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }

  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))( a1 + *(int *)(a3 + 24),  a2,  v8);
  }

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group.Initialization( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10009CA10);
}

uint64_t sub_10009CA10(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 16) = (a2 - 1);
  }

  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 24),  a2,  a2,  v7);
  }

  return result;
}

uint64_t type metadata completion function for NearbyGroup_Group.Initialization( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return type metadata completion function for NearbyGroup_Group.Initialization( a1,  a2,  a3,  (uint64_t)&value witness table for Builtin.BridgeObject + 64);
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, j____swift_get_extra_inhabitant_index_17Tm);
}

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group.MemberAdded( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_18Tm);
}

uint64_t *initializeBufferWithCopyOfBuffer for NearbyGroup_Group.MemberAdded( uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16LL) & ~(unint64_t)v5));
    swift_retain();
  }

  else
  {
    uint64_t v7 = *a2;
    unint64_t v8 = a2[1];
    outlined copy of Data._Representation(*a2, v8);
    *a1 = v7;
    a1[1] = v8;
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = type metadata accessor for UnknownStorage(0LL);
    uint64_t v13 = *(void (**)(char *, char *, uint64_t))(*(void *)(v12 - 8) + 16LL);
    v13(v10, v11, v12);
    uint64_t v14 = *(int *)(a3 + 24);
    uint64_t v15 = (uint64_t *)((char *)a1 + v14);
    uint64_t v16 = (uint64_t *)((char *)a2 + v14);
    uint64_t v17 = type metadata accessor for NearbyGroup_Member(0LL);
    uint64_t v18 = *(void *)(v17 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v18 + 48))(v16, 1LL, v17))
    {
      uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
      memcpy(v15, v16, *(void *)(*(void *)(v19 - 8) + 64LL));
    }

    else
    {
      uint64_t v21 = v16[1];
      *uint64_t v15 = *v16;
      v15[1] = v21;
      uint64_t v22 = *(int *)(v17 + 20);
      uint64_t v23 = (char *)v15 + v22;
      uint64_t v24 = (char *)v16 + v22;
      __n128 v25 = swift_bridgeObjectRetain(v21);
      ((void (*)(char *, char *, uint64_t, __n128))v13)(v23, v24, v12, v25);
      uint64_t v26 = *(int *)(v17 + 24);
      uint64_t v27 = (void *)((char *)v15 + v26);
      uint64_t v28 = (void *)((char *)v16 + v26);
      uint64_t v29 = v28[1];
      *uint64_t v27 = *v28;
      v27[1] = v29;
      uint64_t v30 = *(void (**)(void *, void, uint64_t, uint64_t, __n128))(v18 + 56);
      __n128 v31 = swift_bridgeObjectRetain(v29);
      v30(v15, 0LL, 1LL, v17, v31);
    }
  }

  return a1;
}

uint64_t destroy for NearbyGroup_Group.MemberAdded(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  uint64_t v5 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v6 = *(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL);
  v6(v4, v5);
  uint64_t v7 = a1 + *(int *)(a2 + 24);
  uint64_t v8 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48LL))(v7, 1LL, v8);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease(*(void *)(v7 + 8));
    v6(v7 + *(int *)(v8 + 20), v5);
    return swift_bridgeObjectRelease(*(void *)(v7 + *(int *)(v8 + 24) + 8));
  }

  return result;
}

uint64_t *initializeWithCopy for NearbyGroup_Group.MemberAdded(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  outlined copy of Data._Representation(*a2, v7);
  *a1 = v6;
  a1[1] = v7;
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v12 = *(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16LL);
  v12(v9, v10, v11);
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = (uint64_t *)((char *)a1 + v13);
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  uint64_t v16 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v17 + 48))(v15, 1LL, v16))
  {
    uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64LL));
  }

  else
  {
    uint64_t v19 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v19;
    uint64_t v20 = *(int *)(v16 + 20);
    uint64_t v21 = (char *)v14 + v20;
    uint64_t v22 = (char *)v15 + v20;
    __n128 v23 = swift_bridgeObjectRetain(v19);
    ((void (*)(char *, char *, uint64_t, __n128))v12)(v21, v22, v11, v23);
    uint64_t v24 = *(int *)(v16 + 24);
    __n128 v25 = (void *)((char *)v14 + v24);
    uint64_t v26 = (void *)((char *)v15 + v24);
    uint64_t v27 = v26[1];
    *__n128 v25 = *v26;
    v25[1] = v27;
    uint64_t v28 = *(void (**)(void *, void, uint64_t, uint64_t, __n128))(v17 + 56);
    __n128 v29 = swift_bridgeObjectRetain(v27);
    v28(v14, 0LL, 1LL, v16, v29);
  }

  return a1;
}

uint64_t *assignWithCopy for NearbyGroup_Group.MemberAdded(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6 = *a2;
  unint64_t v7 = a2[1];
  outlined copy of Data._Representation(*a2, v7);
  uint64_t v8 = *a1;
  unint64_t v9 = a1[1];
  *a1 = v6;
  a1[1] = v7;
  outlined consume of Data._Representation(v8, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = (char *)a1 + v10;
  uint64_t v12 = (char *)a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(void (**)(char *, char *, uint64_t))(v14 + 24);
  v15(v11, v12, v13);
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v12) = v21(v17, 1LL, v19);
  int v22 = v21(v18, 1LL, v19);
  if (!(_DWORD)v12)
  {
    if (!v22)
    {
      *(void *)uint64_t v17 = *(void *)v18;
      uint64_t v37 = *((void *)v18 + 1);
      uint64_t v38 = *((void *)v17 + 1);
      *((void *)v17 + 1) = v37;
      swift_bridgeObjectRetain(v37);
      swift_bridgeObjectRelease(v38);
      v15(&v17[*(int *)(v19 + 20)], &v18[*(int *)(v19 + 20)], v13);
      uint64_t v39 = *(int *)(v19 + 24);
      uint64_t v40 = &v17[v39];
      char v41 = &v18[v39];
      *(void *)uint64_t v40 = *(void *)v41;
      uint64_t v42 = *((void *)v41 + 1);
      uint64_t v43 = *((void *)v40 + 1);
      *((void *)v40 + 1) = v42;
      swift_bridgeObjectRetain(v42);
      swift_bridgeObjectRelease(v43);
      return a1;
    }

    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v17,  type metadata accessor for NearbyGroup_Member);
    goto LABEL_6;
  }

  if (v22)
  {
LABEL_6:
    uint64_t v35 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
    memcpy(v17, v18, *(void *)(*(void *)(v35 - 8) + 64LL));
    return a1;
  }

  *(void *)uint64_t v17 = *(void *)v18;
  uint64_t v23 = *((void *)v18 + 1);
  *((void *)v17 + 1) = v23;
  uint64_t v24 = *(int *)(v19 + 20);
  __n128 v25 = &v17[v24];
  uint64_t v26 = &v18[v24];
  uint64_t v27 = *(void (**)(char *, char *, uint64_t, __n128))(v14 + 16);
  __n128 v28 = swift_bridgeObjectRetain(v23);
  v27(v25, v26, v13, v28);
  uint64_t v29 = *(int *)(v19 + 24);
  uint64_t v30 = &v17[v29];
  __n128 v31 = &v18[v29];
  *(void *)uint64_t v30 = *(void *)v31;
  uint64_t v32 = *((void *)v31 + 1);
  *((void *)v30 + 1) = v32;
  char v33 = *(void (**)(char *, void, uint64_t, uint64_t, __n128))(v20 + 56);
  __n128 v34 = swift_bridgeObjectRetain(v32);
  v33(v17, 0LL, 1LL, v19, v34);
  return a1;
}

_OWORD *initializeWithTake for NearbyGroup_Group.MemberAdded(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v6 = *(int *)(a3 + 20);
  unint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32LL);
  v10(v7, v8, v9);
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = (_OWORD *)((char *)a1 + v11);
  uint64_t v13 = (_OWORD *)((char *)a2 + v11);
  uint64_t v14 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1LL, v14))
  {
    uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64LL));
  }

  else
  {
    _OWORD *v12 = *v13;
    v10((char *)v12 + *(int *)(v14 + 20), (char *)v13 + *(int *)(v14 + 20), v9);
    *(_OWORD *)((char *)v12 + *(int *)(v14 + 24)) = *(_OWORD *)((char *)v13 + *(int *)(v14 + 24));
    (*(void (**)(_OWORD *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0LL, 1LL, v14);
  }

  return a1;
}

uint64_t *assignWithTake for NearbyGroup_Group.MemberAdded(uint64_t *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t v7 = a1[1];
  *(_OWORD *)a1 = *a2;
  outlined consume of Data._Representation(v6, v7);
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = (char *)a1 + v8;
  uint64_t v10 = (char *)a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v12 + 40);
  v13(v9, v10, v11);
  uint64_t v14 = *(int *)(a3 + 24);
  uint64_t v15 = (char *)a1 + v14;
  uint64_t v16 = (char *)a2 + v14;
  uint64_t v17 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  LODWORD(v10) = v19(v15, 1LL, v17);
  int v20 = v19(v16, 1LL, v17);
  if (!(_DWORD)v10)
  {
    if (!v20)
    {
      uint64_t v23 = *((void *)v16 + 1);
      uint64_t v24 = *((void *)v15 + 1);
      *(void *)uint64_t v15 = *(void *)v16;
      *((void *)v15 + 1) = v23;
      swift_bridgeObjectRelease(v24);
      v13(&v15[*(int *)(v17 + 20)], &v16[*(int *)(v17 + 20)], v11);
      uint64_t v25 = *(int *)(v17 + 24);
      uint64_t v26 = &v15[v25];
      uint64_t v27 = (uint64_t *)&v16[v25];
      uint64_t v29 = *v27;
      uint64_t v28 = v27[1];
      uint64_t v30 = *((void *)v26 + 1);
      *(void *)uint64_t v26 = v29;
      *((void *)v26 + 1) = v28;
      swift_bridgeObjectRelease(v30);
      return a1;
    }

    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v15,  type metadata accessor for NearbyGroup_Member);
    goto LABEL_6;
  }

  if (v20)
  {
LABEL_6:
    uint64_t v21 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
    memcpy(v15, v16, *(void *)(*(void *)(v21 - 8) + 64LL));
    return a1;
  }

  *(_OWORD *)uint64_t v15 = *(_OWORD *)v16;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(&v15[*(int *)(v17 + 20)], &v16[*(int *)(v17 + 20)], v11);
  *(_OWORD *)&v15[*(int *)(v17 + 24)] = *(_OWORD *)&v16[*(int *)(v17 + 24)];
  (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v15, 0LL, 1LL, v17);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Group.MemberRemoved(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10009D2DC);
}

uint64_t __swift_get_extra_inhabitant_index_17Tm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 12)
  {
    uint64_t v4 = *(void *)(a1 + 8) >> 60;
    if (((4 * (_DWORD)v4) & 0xC) != 0) {
      return 16 - ((4 * (_DWORD)v4) & 0xC | (v4 >> 2));
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage(0LL);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a3 + 20);
    }

    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a3 + 24);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group.MemberRemoved( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10009D39C);
}

char *__swift_store_extra_inhabitant_index_18Tm(char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 12)
  {
    *(void *)uint64_t result = 0LL;
    *((void *)result + 1) = (unint64_t)(((-(int)a2 >> 2) & 3) - 4 * (_DWORD)a2) << 60;
  }

  else
  {
    uint64_t v8 = type metadata accessor for UnknownStorage(0LL);
    uint64_t v9 = *(void *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      uint64_t v10 = v8;
      uint64_t v11 = *(int *)(a4 + 20);
    }

    else
    {
      uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyGroup_Member?);
      uint64_t v9 = *(void *)(v10 - 8);
      uint64_t v11 = *(int *)(a4 + 24);
    }

    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }

  return result;
}

void type metadata completion function for NearbyGroup_Group.MemberAdded(uint64_t a1)
{
  v6[0] = &unk_1000AEF80;
  uint64_t v2 = type metadata accessor for UnknownStorage(319LL);
  if (v3 <= 0x3F)
  {
    v6[1] = *(void *)(v2 - 8) + 64LL;
    type metadata accessor for NearbyProtoConnectionResponse.Content.OneOf_Operation?( 319LL,  &lazy cache variable for type metadata for NearbyGroup_Member?,  type metadata accessor for NearbyGroup_Member);
    if (v5 <= 0x3F)
    {
      void v6[2] = *(void *)(v4 - 8) + 64LL;
      swift_initStructMetadata(a1, 256LL, 3LL, v6, a1 + 16);
    }
  }

unint64_t initializeBufferWithCopyOfBuffer for NearbyGroup_Group.MemberLeft( unint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80LL);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v13 = *(void *)a2;
    *(void *)a1 = *(void *)a2;
    a1 = v13 + ((v5 + 16LL) & ~(unint64_t)v5);
    swift_retain();
  }

  else
  {
    uint64_t v7 = *(void *)a2;
    unint64_t v8 = *(void *)(a2 + 8);
    outlined copy of Data._Representation(*(void *)a2, v8);
    *(void *)a1 = v7;
    *(void *)(a1 + 8) = v8;
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = a1 + v9;
    uint64_t v11 = a2 + v9;
    uint64_t v12 = type metadata accessor for UnknownStorage(0LL);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 16LL))(v10, v11, v12);
  }

  return a1;
}

uint64_t destroy for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = type metadata accessor for UnknownStorage(0LL);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8LL))(v4, v5);
}

uint64_t initializeWithCopy for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v7);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16LL))(v9, v10, v11);
  return a1;
}

uint64_t assignWithCopy for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a2;
  unint64_t v7 = *(void *)(a2 + 8);
  outlined copy of Data._Representation(*(void *)a2, v7);
  uint64_t v8 = *(void *)a1;
  unint64_t v9 = *(void *)(a1 + 8);
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  outlined consume of Data._Representation(v8, v9);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24LL))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = a1 + v4;
  uint64_t v6 = a2 + v4;
  uint64_t v7 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 32LL))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  outlined consume of Data._Representation(v6, v7);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = a1 + v8;
  uint64_t v10 = a2 + v8;
  uint64_t v11 = type metadata accessor for UnknownStorage(0LL);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 40LL))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for NearbyGroup_Group.MemberLeft(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10009D7D0);
}

uint64_t sub_10009D7D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((_DWORD)a2 == 254)
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 16);
    BOOL v5 = v4 >= 2;
    int v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5) {
      return (v6 + 1);
    }
    else {
      return 0LL;
    }
  }

  else
  {
    uint64_t v10 = type metadata accessor for UnknownStorage(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48LL))( a1 + *(int *)(a3 + 24),  a2,  v10);
  }

uint64_t storeEnumTagSinglePayload for NearbyGroup_Group.MemberLeft( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10009D858);
}

uint64_t sub_10009D858(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 254)
  {
    *(_BYTE *)(result + 16) = a2 + 1;
  }

  else
  {
    uint64_t v7 = type metadata accessor for UnknownStorage(0LL);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56LL))( v5 + *(int *)(a4 + 24),  a2,  a2,  v7);
  }

  return result;
}

uint64_t type metadata completion function for NearbyGroup_Group.MemberLeft( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return type metadata completion function for NearbyGroup_Group.Initialization(a1, a2, a3, (uint64_t)&unk_1000AEFC0);
}

uint64_t type metadata completion function for NearbyGroup_Group.Initialization( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v7[0] = &unk_1000AEF80;
  v7[1] = a4;
  uint64_t result = type metadata accessor for UnknownStorage(319LL);
  if (v6 <= 0x3F)
  {
    v7[2] = *(void *)(result - 8) + 64LL;
    swift_initStructMetadata(a1, 256LL, 3LL, v7, a1 + 16);
    return 0LL;
  }

  return result;
}

id NearbyIDSServiceController.__allocating_init(queue:service:delegate:joinRequestsController:)( void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v11 = (char *)objc_allocWithZone(v5);
  uint64_t v12 = a2[3];
  uint64_t v13 = a2[4];
  uint64_t v14 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a2, v12);
  __chkstk_darwin(v14, v14);
  uint64_t v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v17 + 16))(v16);
  id v18 = specialized NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)( a1,  (uint64_t)v16,  a3,  a4,  a5,  v11,  v12,  v13);
  __swift_destroy_boxed_opaque_existential_0Tm(a2);
  return v18;
}

uint64_t IDSServiceProtocol.send(_:from:to:priority:options:identifier:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = a4;
  unint64_t v53 = a4 & 0xC000000000000001LL;
  if ((a4 & 0xC000000000000001LL) != 0)
  {
    if (a4 < 0) {
      uint64_t v10 = a4;
    }
    else {
      uint64_t v10 = a4 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t v11 = __CocoaSet.count.getter(v10);
  }

  else
  {
    uint64_t v11 = *(void *)(a4 + 16);
  }

  uint64_t v12 = _swiftEmptyArrayStorage;
  if (!v11)
  {
LABEL_32:
    uint64_t v42 = specialized Set.init<A>(_:)((uint64_t)v12);
    swift_bridgeObjectRelease(v12);
    uint64_t v43 = specialized _setUpCast<A, B>(_:)(v42);
    swift_bridgeObjectRelease(v42);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a9 + 40))( a1,  a2,  a3,  v43,  a5,  a6,  a7,  a8,  a9);
    return swift_bridgeObjectRelease(v43);
  }

  uint64_t v58 = _swiftEmptyArrayStorage;
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v11 & ~(v11 >> 63), 0);
  if (v53)
  {
    if (v9 < 0) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = v9 & 0xFFFFFFFFFFFFFF8LL;
    }
    uint64_t result = __CocoaSet.startIndex.getter(v13);
    char v16 = 1;
  }

  else
  {
    uint64_t result = specialized _NativeSet.startIndex.getter(v9);
    char v16 = v17 & 1;
  }

  uint64_t v55 = result;
  uint64_t v56 = v15;
  char v57 = v16;
  if ((v11 & 0x8000000000000000LL) == 0)
  {
    uint64_t v18 = v9 & 0xFFFFFFFFFFFFFF8LL;
    if (v9 < 0) {
      uint64_t v18 = v9;
    }
    uint64_t v51 = v18;
    uint64_t v52 = v9;
    do
    {
      while (1)
      {
        int64_t v25 = v55;
        uint64_t v24 = v56;
        char v26 = v57;
        specialized Set.subscript.getter(v55, v56, v57, v9);
        uint64_t v28 = v27;
        uint64_t v29 = NearbyGroupMember.tokenID.getter();
        if (!v30) {
          uint64_t v29 = NearbyGroupMember.handle.getter(v29);
        }
        uint64_t v31 = v29;
        uint64_t v32 = v30;

        char v33 = v58;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native(v58);
        if ((result & 1) == 0)
        {
          uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( 0,  v33[2] + 1LL,  1);
          char v33 = v58;
        }

        unint64_t v35 = v33[2];
        unint64_t v34 = v33[3];
        if (v35 >= v34 >> 1)
        {
          uint64_t result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( v34 > 1,  v35 + 1,  1);
          char v33 = v58;
        }

        v33[2] = v35 + 1;
        uint64_t v36 = &v33[2 * v35];
        v36[4] = v31;
        v36[5] = v32;
        if (v53) {
          break;
        }
        uint64_t v9 = v52;
        int64_t v19 = specialized _NativeSet.index(after:)(v25, v24, v26, v52);
        uint64_t v21 = v20;
        char v23 = v22;
        outlined consume of Set<NearbyGroupHostIDSService.MessageEvent.Member>.Index._Variant(v25, v24, v26);
        uint64_t v55 = v19;
        uint64_t v56 = v21;
        char v57 = v23 & 1;
        if (!--v11) {
          goto LABEL_31;
        }
      }

      uint64_t v9 = v52;
      if ((v26 & 1) == 0) {
        goto LABEL_34;
      }
      uint64_t v37 = __CocoaSet.Index.handleBitPattern.getter(v25, v24);
      if (v37) {
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v37);
      }
      else {
        uint64_t isUniquelyReferenced_nonNull_native = 1LL;
      }
      uint64_t v39 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Set<NearbyGroupMember>.Index);
      uint64_t v40 = (void (*)(_BYTE *, void))Set.Index._asCocoa.modify(v54, v39);
      __CocoaSet.formIndex(after:isUnique:)(v41, isUniquelyReferenced_nonNull_native, v51);
      v40(v54, 0LL);
      --v11;
    }

    while (v11);
LABEL_31:
    outlined consume of Set<NearbyGroupHostIDSService.MessageEvent.Member>.Index._Variant(v55, v56, v57);
    uint64_t v12 = v58;
    goto LABEL_32;
  }

  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t specialized _setUpCast<A, B>(_:)(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<AnyHashable>);
    unint64_t v3 = (void *)static _SetStorage.allocate(capacity:)(v2);
  }

  else
  {
    unint64_t v3 = &_swiftEmptySetSingleton;
  }

  uint64_t v4 = a1 + 56;
  uint64_t v5 = -1LL << *(_BYTE *)(a1 + 32);
  if (-v5 < 64) {
    uint64_t v6 = ~(-1LL << -(char)v5);
  }
  else {
    uint64_t v6 = -1LL;
  }
  unint64_t v7 = v6 & *(void *)(a1 + 56);
  int64_t v8 = (unint64_t)(63 - v5) >> 6;
  uint64_t v9 = (char *)(v3 + 7);
  swift_bridgeObjectRetain(a1);
  uint64_t result = swift_retain();
  int64_t v11 = 0LL;
  while (1)
  {
    if (v7)
    {
      unint64_t v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_28;
    }

    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1LL))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }

    if (v16 >= v8) {
      goto LABEL_37;
    }
    unint64_t v17 = *(void *)(v4 + 8 * v16);
    int64_t v18 = v11 + 1;
    if (!v17)
    {
      int64_t v18 = v11 + 2;
      if (v11 + 2 >= v8) {
        goto LABEL_37;
      }
      unint64_t v17 = *(void *)(v4 + 8 * v18);
      if (!v17)
      {
        int64_t v18 = v11 + 3;
        if (v11 + 3 >= v8) {
          goto LABEL_37;
        }
        unint64_t v17 = *(void *)(v4 + 8 * v18);
        if (!v17)
        {
          int64_t v18 = v11 + 4;
          if (v11 + 4 >= v8) {
            goto LABEL_37;
          }
          unint64_t v17 = *(void *)(v4 + 8 * v18);
          if (!v17) {
            break;
          }
        }
      }
    }

id protocol witness for IDSServiceProtocol.add(_:with:queue:) in conformance IDSService( uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*v3 addDelegate:a1 withDelegateProperties:a2 queue:a3];
}

id protocol witness for IDSServiceProtocol.send(_:toDestinations:priority:options:identifier:) in conformance IDSService( uint64_t a1, unint64_t a2, objc_class *a3, uint64_t a4, objc_class *a5, uint64_t a6)
{
  return @nonobjc IDSService.send(_:toDestinations:priority:options:identifier:)(a1, a2, a3, a4, a5, a6);
}

id @nonobjc IDSService.send(_:toDestinations:priority:options:identifier:)( uint64_t a1, unint64_t a2, objc_class *a3, uint64_t a4, Class a5, uint64_t a6)
{
  unint64_t v7 = v6;
  Class v11 = a3;
  if (a2 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (!v11) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  Class isa = 0LL;
  if (a3) {
LABEL_5:
  }
    Class v11 = Set._bridgeToObjectiveC()().super.isa;
LABEL_6:
  if (a5) {
    a5 = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  id v17 = 0LL;
  unsigned int v13 = [v7 sendData:isa toDestinations:v11 priority:a4 options:a5 identifier:a6 error:&v17];

  id v14 = v17;
  if (v13) {
    return v17;
  }
  id v16 = v17;
  _convertNSErrorToError(_:)(v14);

  return (id)swift_willThrow();
}

id protocol witness for IDSServiceProtocol.send(_:from:toDestinations:priority:options:identifier:) in conformance IDSService( uint64_t a1, unint64_t a2, uint64_t a3, objc_class *a4, uint64_t a5, objc_class *a6, uint64_t a7)
{
  return @nonobjc IDSService.send(_:from:toDestinations:priority:options:identifier:)(a1, a2, a3, a4, a5, a6, a7);
}

id @nonobjc IDSService.send(_:from:toDestinations:priority:options:identifier:)( uint64_t a1, unint64_t a2, uint64_t a3, objc_class *a4, uint64_t a5, Class a6, uint64_t a7)
{
  int64_t v8 = v7;
  Class v12 = a4;
  if (a2 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    if (!v12) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  Class isa = 0LL;
  if (a4) {
LABEL_5:
  }
    Class v12 = Set._bridgeToObjectiveC()().super.isa;
LABEL_6:
  if (a6) {
    a6 = Dictionary._bridgeToObjectiveC()().super.isa;
  }
  id v19 = 0LL;
  unsigned int v15 = [v8 sendData:isa fromAccount:a3 toDestinations:v12 priority:a5 options:a6 identifier:a7 error:&v19];

  id v16 = v19;
  if (v15) {
    return v19;
  }
  id v18 = v19;
  _convertNSErrorToError(_:)(v16);

  return (id)swift_willThrow();
}

uint64_t protocol witness for IDSServiceProtocol.send(_:from:to:priority:options:identifier:) in conformance IDSService( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return IDSServiceProtocol.send(_:from:to:priority:options:identifier:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t NearbyIDSServiceController.delegate.getter()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate;
  swift_beginAccess( v0 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate,  v3,  0LL,  0LL);
  return swift_unknownObjectWeakLoadStrong(v1);
}

uint64_t NearbyIDSServiceController.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = v2 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate;
  swift_beginAccess(v5, v7, 1LL, 0LL);
  *(void *)(v5 + 8) = a2;
  swift_unknownObjectWeakAssign(v5, a1);
  return swift_unknownObjectRelease(a1);
}

void (*NearbyIDSServiceController.delegate.modify(void *a1))(uint64_t a1, char a2)
{
  unint64_t v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33LL, 0LL);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong(v5);
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  v3[4] = v7;
  return NearbyInvitationAdvertiser.delegate.modify;
}

uint64_t NearbyIDSServiceController.service.getter@<X0>(uint64_t a1@<X8>)
{
  return outlined init with copy of PseudonymProtocol( v1 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service,  a1);
}

id NearbyIDSServiceController.joinRequestsController.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController));
}

id NearbyIDSServiceController.queue.getter()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue));
}

uint64_t NearbyIDSServiceController.requesterCredentialsByOwnerPseudonym.getter()
{
  uint64_t v1 = (void *)(v0
                + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_requesterCredentialsByOwnerPseudonym);
  swift_beginAccess( v0 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_requesterCredentialsByOwnerPseudonym,  v3,  0LL,  0LL);
  return swift_bridgeObjectRetain(*v1);
}

uint64_t NearbyIDSServiceController.requesterCredentialsByOwnerPseudonym.setter(uint64_t a1)
{
  unint64_t v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_requesterCredentialsByOwnerPseudonym);
  swift_beginAccess(v3, v6, 1LL, 0LL);
  uint64_t v4 = *v3;
  *unint64_t v3 = a1;
  return swift_bridgeObjectRelease(v4);
}

uint64_t (*NearbyIDSServiceController.requesterCredentialsByOwnerPseudonym.modify(uint64_t a1))()
{
  return NearbyInvitationAdvertiser.listeners.modify;
}

id NearbyIDSServiceController.contactStore.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore);
  }

  else
  {
    id v4 = closure #1 in NearbyIDSServiceController.contactStore.getter();
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0LL;
  }

  id v6 = v2;
  return v3;
}

id closure #1 in NearbyIDSServiceController.contactStore.getter()
{
  id v0 = [(id)objc_opt_self(NSBundle) mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v1);
    unint64_t v3 = v2;
  }

  else
  {
    unint64_t v3 = 0x80000001000B1BE0LL;
  }

  id v4 = (void *)objc_opt_self(&OBJC_CLASS___CNContactStoreConfiguration);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  id v6 = objc_msgSend(v4, "tu_contactStoreConfigurationForBundleIdentifier:", v5);

  id v7 = [objc_allocWithZone(CNContactStore) initWithConfiguration:v6];
  return v7;
}

id NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)( void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v11 = a2[3];
  uint64_t v12 = a2[4];
  uint64_t v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a2, v11);
  __chkstk_darwin(v13, v13);
  unsigned int v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *))(v16 + 16))(v15);
  id v17 = specialized NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)( a1,  (uint64_t)v15,  a3,  a4,  a5,  v5,  v11,  v12);
  __swift_destroy_boxed_opaque_existential_0Tm(a2);
  return v17;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NearbyIDSServiceController.denyConnectionRequest(id:destinationHandle:)( Swift::String id, Swift::String destinationHandle)
{
  Swift::String v50 = destinationHandle;
  uint64_t v3 = type metadata accessor for NearbyProtoConnectionResponse.Content(0LL);
  __chkstk_darwin(v3, v4);
  id v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  id v7 = (int *)type metadata accessor for NearbyProtoSessionMessage(0LL);
  __chkstk_darwin(v7, v8);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  unsigned int v15 = (uint8_t **)((char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v49 = v2;
  uint64_t v16 = *(void **)((char *)v2
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *unsigned int v15 = v16;
  (*(void (**)(void *, void, uint64_t))(v12 + 104))(v15, enum case for DispatchPredicate.onQueue(_:), v11);
  id v17 = v16;
  LOBYTE(v16) = _dispatchPreconditionTest(_:)(v15);
  uint64_t v18 = (*(uint64_t (**)(void *, uint64_t))(v12 + 8))(v15, v11);
  if ((v16 & 1) == 0)
  {
    __break(1u);
LABEL_11:
    swift_once(&one-time initialization token for host, one-time initialization function for host);
    goto LABEL_4;
  }

  UnknownStorage.init()(v18);
  uint64_t v19 = &v10[v7[5]];
  *(_DWORD *)uint64_t v19 = 0;
  v19[4] = 1;
  uint64_t v20 = &v10[v7[6]];
  *(void *)uint64_t v20 = 0LL;
  *((_WORD *)v20 + 4) = 256;
  uint64_t v21 = &v10[v7[7]];
  *(_OWORD *)uint64_t v21 = xmmword_1000AAEA0;
  *(void *)uint64_t v20 = 4LL;
  *((_WORD *)v20 + 4) = 1;
  uint64_t v22 = lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content,  type metadata accessor for NearbyProtoConnectionResponse.Content,  (uint64_t)&protocol conformance descriptor for NearbyProtoConnectionResponse.Content);
  uint64_t v23 = (uint64_t)v51;
  static Message.with(_:)( closure #1 in NearbyIDSServiceController.denyConnectionRequest(id:destinationHandle:),  0LL,  v3,  v22);
  uint64_t v24 = Message.serializedData(partial:)(0LL, v3, v22);
  uint64_t v3 = v23;
  if (v23) {
    goto LABEL_9;
  }
  uint64_t v51 = v6;
  *(void *)uint64_t v21 = v24;
  *((void *)v21 + 1) = v25;
  if (one-time initialization token for host != -1) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v26 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v26, (uint64_t)static Log.host);
  object = v50._object;
  uint64_t v28 = swift_bridgeObjectRetain_n(v50._object, 2LL);
  __int128 v29 = (os_log_s *)Logger.logObject.getter(v28);
  os_log_type_t v30 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v48 = swift_slowAlloc(32LL, -1LL);
    uint64_t v55 = v48;
    *(_DWORD *)uint64_t v31 = 136315138;
    uint64_t v47 = v31 + 4;
    uint64_t countAndFlagsBits = v50._countAndFlagsBits;
    unint64_t v53 = object;
    swift_bridgeObjectRetain(object);
    uint64_t v32 = String.init<A>(reflecting:)(&countAndFlagsBits, &type metadata for String);
    unint64_t v34 = v33;
    uint64_t countAndFlagsBits = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v32, v33, &v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&countAndFlagsBits, &v53, v47, v31 + 12);
    swift_bridgeObjectRelease_n(object, 2LL);
    swift_bridgeObjectRelease(v34);
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Sending deny connection message to %s", v31, 0xCu);
    uint64_t v35 = v48;
    swift_arrayDestroy(v48, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v35, -1LL, -1LL);
    swift_slowDealloc(v31, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(object, 2LL);
  }

  id v6 = v51;
  uint64_t v36 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage,  type metadata accessor for NearbyProtoSessionMessage,  (uint64_t)&protocol conformance descriptor for NearbyProtoSessionMessage);
  uint64_t v37 = Message.serializedData(partial:)(0LL, v7, v36);
  if (!v3)
  {
    uint64_t v39 = v37;
    unint64_t v40 = v38;
    uint64_t v41 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t inited = swift_initStackObject(v41, v54);
    *(_OWORD *)(inited + 16) = xmmword_1000AAE80;
    uint64_t v43 = v50._object;
    *(void *)(inited + 32) = v50._countAndFlagsBits;
    *(void *)(inited + 40) = v43;
    swift_bridgeObjectRetain(v43);
    Swift::Int v44 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
    swift_setDeallocating(inited);
    swift_arrayDestroy(inited + 32, 1LL, &type metadata for String);
    (*(void (**)(uint64_t, unint64_t, Swift::Int, void, void, void))((swift_isaMask & *v49)
                                                                                          + 0x100LL))( v39,  v40,  v44,  0LL,  0LL,  0LL);
    uint64_t v46 = v45;
    swift_bridgeObjectRelease(v44);
    outlined consume of Data._Representation(v39, v40);
    swift_bridgeObjectRelease(v46);
  }

uint64_t closure #1 in NearbyIDSServiceController.denyConnectionRequest(id:destinationHandle:)(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for NearbyProtoConnectionResponse.Content.DeniedContent(0LL);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyProtoConnectionResponse.Content.DeniedContent and conformance NearbyProtoConnectionResponse.Content.DeniedContent,  type metadata accessor for NearbyProtoConnectionResponse.Content.DeniedContent,  (uint64_t)&protocol conformance descriptor for NearbyProtoConnectionResponse.Content.DeniedContent);
  static Message.with(_:)(Log.init(), 0LL, v2, v6);
  uint64_t v7 = a1 + *(int *)(type metadata accessor for NearbyProtoConnectionResponse.Content(0LL) + 24);
  outlined destroy of Any?( v7,  &demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v5,  v7,  type metadata accessor for NearbyProtoConnectionResponse.Content.DeniedContent);
  uint64_t v8 = type metadata accessor for NearbyProtoConnectionResponse.Content.OneOf_Operation(0LL);
  swift_storeEnumTagMultiPayload(v7, v8, 0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56LL))(v7, 0LL, 1LL, v8);
}

uint64_t NearbyIDSServiceController.approveConnectionRequest(id:localInvitation:destinationHandle:)( void *a1, uint8_t *a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v65 = a2;
  uint64_t v61 = a5;
  uint64_t v62 = a6;
  uint64_t v63 = a3;
  uint64_t v64 = a4;
  uint64_t v8 = type metadata accessor for NearbyProtoConnectionResponse.Content(0LL);
  __chkstk_darwin(v8, v9);
  __int128 v67 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v11 = (int *)type metadata accessor for NearbyProtoSessionMessage(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v15 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15, v17);
  uint64_t v19 = (void **)((char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v60 = v6;
  uint64_t v20 = *(void **)((char *)v6
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v19 = v20;
  (*(void (**)(void *, void, uint64_t))(v16 + 104))(v19, enum case for DispatchPredicate.onQueue(_:), v15);
  id v21 = v20;
  LOBYTE(v20) = _dispatchPreconditionTest(_:)(v19);
  uint64_t v22 = (*(uint64_t (**)(void *, uint64_t))(v16 + 8))(v19, v15);
  if ((v20 & 1) == 0)
  {
    __break(1u);
LABEL_12:
    swift_once(&one-time initialization token for host, one-time initialization function for host);
    goto LABEL_4;
  }

  uint64_t v23 = UnknownStorage.init()(v22);
  uint64_t v24 = &v14[v11[5]];
  *(_DWORD *)uint64_t v24 = 0;
  v24[4] = 1;
  uint64_t v25 = &v14[v11[6]];
  *(void *)uint64_t v25 = 0LL;
  *((_WORD *)v25 + 4) = 256;
  uint64_t v26 = &v14[v11[7]];
  *(_OWORD *)uint64_t v26 = xmmword_1000AAEA0;
  *(void *)uint64_t v25 = 4LL;
  *((_WORD *)v25 + 4) = 1;
  __chkstk_darwin(v23, v27);
  uint64_t v28 = v64;
  *(&v60 - 4) = v63;
  *(&v60 - 3) = v28;
  __int128 v29 = v65;
  *(&v60 - 2) = a1;
  *(&v60 - 1) = v29;
  uint64_t v30 = lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoConnectionResponse.Content and conformance NearbyProtoConnectionResponse.Content,  type metadata accessor for NearbyProtoConnectionResponse.Content,  (uint64_t)&protocol conformance descriptor for NearbyProtoConnectionResponse.Content);
  uint64_t v31 = v66;
  uint64_t v16 = (uint64_t)v67;
  static Message.with(_:)( partial apply for closure #1 in NearbyIDSServiceController.approveConnectionRequest(id:localInvitation:destinationHandle:),  &v60 - 6,  v8,  v30);
  uint64_t v32 = Message.serializedData(partial:)(0LL, v8, v30);
  uint64_t v19 = v31;
  if (v31)
  {
LABEL_9:
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v16,  type metadata accessor for NearbyProtoConnectionResponse.Content);
    uint64_t v59 = (uint64_t)v14;
    return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v59,  type metadata accessor for NearbyProtoSessionMessage);
  }

  uint64_t v34 = v32;
  uint64_t v35 = v33;
  uint64_t v66 = v14;
  outlined consume of Data?(*(void *)v26, *((void *)v26 + 1));
  *(void *)uint64_t v26 = v34;
  *((void *)v26 + 1) = v35;
  if (one-time initialization token for host != -1) {
    goto LABEL_12;
  }
LABEL_4:
  uint64_t v36 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v36, (uint64_t)static Log.host);
  uint64_t v37 = v62;
  uint64_t v38 = swift_bridgeObjectRetain_n(v62, 2LL);
  uint64_t v39 = (os_log_s *)Logger.logObject.getter(v38);
  os_log_type_t v40 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v42 = swift_slowAlloc(32LL, -1LL);
    uint64_t v71 = v42;
    *(_DWORD *)uint64_t v41 = 136315138;
    uint64_t v65 = v41 + 4;
    uint64_t v68 = v61;
    uint64_t v69 = v37;
    swift_bridgeObjectRetain(v37);
    uint64_t v43 = String.init<A>(reflecting:)(&v68, &type metadata for String);
    unint64_t v45 = v44;
    uint64_t v68 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v43, v44, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v68, &v69, v65, v41 + 12);
    swift_bridgeObjectRelease_n(v37, 2LL);
    unint64_t v46 = v45;
    uint64_t v16 = (uint64_t)v67;
    swift_bridgeObjectRelease(v46);
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "Sending approve connection message to %s", v41, 0xCu);
    swift_arrayDestroy(v42, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v42, -1LL, -1LL);
    swift_slowDealloc(v41, -1LL, -1LL);
  }

  else
  {

    swift_bridgeObjectRelease_n(v37, 2LL);
  }

  uint64_t v14 = v66;
  uint64_t v47 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage,  type metadata accessor for NearbyProtoSessionMessage,  (uint64_t)&protocol conformance descriptor for NearbyProtoSessionMessage);
  uint64_t v48 = Message.serializedData(partial:)(0LL, v11, v47);
  if (v19) {
    goto LABEL_9;
  }
  uint64_t v50 = v48;
  unint64_t v51 = v49;
  uint64_t v52 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  uint64_t inited = swift_initStackObject(v52, v70);
  *(_OWORD *)(inited + 16) = xmmword_1000AAE80;
  uint64_t v54 = v62;
  *(void *)(inited + 32) = v61;
  *(void *)(inited + 40) = v54;
  swift_bridgeObjectRetain(v54);
  Swift::Int v55 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  swift_setDeallocating(inited);
  swift_arrayDestroy(inited + 32, 1LL, &type metadata for String);
  (*(void (**)(uint64_t, unint64_t, Swift::Int, void, void, uint64_t))((swift_isaMask & *v60)
                                                                                         + 0x100LL))( v50,  v51,  v55,  0LL,  0LL,  1LL);
  uint64_t v57 = v56;
  swift_bridgeObjectRelease(v55);
  outlined consume of Data._Representation(v50, v51);
  swift_bridgeObjectRelease(v57);
  outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v16,  type metadata accessor for NearbyProtoConnectionResponse.Content);
  uint64_t v59 = (uint64_t)v66;
  return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v59,  type metadata accessor for NearbyProtoSessionMessage);
}

uint64_t closure #1 in NearbyIDSServiceController.approveConnectionRequest(id:localInvitation:destinationHandle:)( void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a4;
  uint64_t v24 = a5;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for NearbyProtoConnectionResponse.Content.ApprovalContent(0LL);
  __chkstk_darwin(v12, v13);
  uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v16 = (uint64_t)a1 + *(int *)(type metadata accessor for NearbyProtoConnectionResponse.Content(0LL) + 24);
  outlined init with copy of NearbyProtoConnectionResponse.Content.OneOf_Operation?(v16, (uint64_t)v11);
  uint64_t v17 = type metadata accessor for NearbyProtoConnectionResponse.Content.OneOf_Operation(0LL);
  uint64_t v18 = *(void *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v11, 1LL, v17) == 1)
  {
    outlined copy of Data._Representation(a2, a3);
    uint64_t v19 = outlined destroy of Any?( (uint64_t)v11,  &demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
LABEL_6:
    *(_OWORD *)uint64_t v15 = xmmword_1000AC690;
    UnknownStorage.init()(v19);
    goto LABEL_7;
  }

  if (swift_getEnumCaseMultiPayload(v11, v17) != 1)
  {
    outlined copy of Data._Representation(a2, a3);
    uint64_t v19 = outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v11,  type metadata accessor for NearbyProtoConnectionResponse.Content.OneOf_Operation);
    goto LABEL_6;
  }

  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v11,  (uint64_t)v15,  type metadata accessor for NearbyProtoConnectionResponse.Content.ApprovalContent);
  outlined copy of Data._Representation(a2, a3);
LABEL_7:
  outlined consume of Data._Representation(*(void *)v15, *((void *)v15 + 1));
  *(void *)uint64_t v15 = a2;
  *((void *)v15 + 1) = a3;
  outlined destroy of Any?( v16,  &demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v15,  v16,  type metadata accessor for NearbyProtoConnectionResponse.Content.ApprovalContent);
  swift_storeEnumTagMultiPayload(v16, v17, 1LL);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v18 + 56))(v16, 0LL, 1LL, v17);
  uint64_t v20 = a1[1];
  uint64_t v21 = v24;
  swift_bridgeObjectRetain(v24);
  uint64_t result = swift_bridgeObjectRelease(v20);
  *a1 = v23;
  a1[1] = v21;
  return result;
}

void NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v121 = a2;
  uint64_t v5 = type metadata accessor for NearbyProtoSessionMessage(0LL);
  __chkstk_darwin(v5, v6);
  unint64_t v118 = (char *)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v8 = type metadata accessor for NearbyProtoJoinResponse.Content(0LL);
  __chkstk_darwin(v8, v9);
  uint64_t v11 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (void *)((char *)&v109 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v17 = *(void **)((char *)v3
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v16 = v17;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v16, enum case for DispatchPredicate.onQueue(_:), v12);
  id v18 = v17;
  LOBYTE(v17) = _dispatchPreconditionTest(_:)(v16);
  uint64_t v19 = (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v16, v12);
  if ((v17 & 1) == 0)
  {
    __break(1u);
LABEL_24:
    swift_once(&one-time initialization token for host, one-time initialization function for host);
    goto LABEL_6;
  }

  uint64_t v20 = dispatch thunk of IncomingInvitationJoinRequest.hostInfo.getter(v19);
  if (v20)
  {
    uint64_t v116 = v5;
    uint64_t v21 = (void *)v20;
    uint64_t v117 = NearbyInvitationJoinRequestMetadata.pseudonym.getter(v20);
    uint64_t v119 = v22;
    __chkstk_darwin(v117, v22);
    id v23 = v121;
    *((void *)&v109 - 2) = a1;
    *((void *)&v109 - 1) = v23;
    uint64_t v24 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyProtoJoinResponse.Content and conformance NearbyProtoJoinResponse.Content,  type metadata accessor for NearbyProtoJoinResponse.Content,  (uint64_t)&protocol conformance descriptor for NearbyProtoJoinResponse.Content);
    id v25 = v120;
    static Message.with(_:)( partial apply for closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:),  &v109 - 2,  v8,  v24);
    uint64_t v26 = *(void **)((char *)v3
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController);
    uint64_t v27 = Message.serializedData(partial:)(0LL, v8, v24);
    if (v25)
    {
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v11,  type metadata accessor for NearbyProtoJoinResponse.Content);
      swift_bridgeObjectRelease(v119);

      return;
    }

    uint64_t v42 = v27;
    unint64_t v43 = v28;
    v114 = v3;
    id v120 = v21;
    unint64_t v115 = v11;
    uint64_t v44 = IncomingInvitationJoinRequest.remotePublicKey.getter();
    unint64_t v46 = v45;
    uint64_t v47 = v119;
    unint64_t v51 = a1;
    uint64_t v52 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))((swift_isaMask & *v26) + 0xB8LL))( v42,  v43,  v44,  v45,  v117,  v119);
    uint64_t v53 = v44;
    unint64_t v55 = v54;
    outlined consume of Data._Representation(v53, v46);
    uint64_t v56 = outlined consume of Data._Representation(v42, v43);
    __chkstk_darwin(v56, v57);
    *((void *)&v109 - 2) = v52;
    *((void *)&v109 - 1) = v55;
    uint64_t v58 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage,  type metadata accessor for NearbyProtoSessionMessage,  (uint64_t)&protocol conformance descriptor for NearbyProtoSessionMessage);
    uint64_t v59 = (uint64_t)v118;
    static Message.with(_:)( partial apply for closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:),  &v109 - 2,  v116,  v58);
    uint64_t v110 = v52;
    unint64_t v111 = v55;
    uint64_t v113 = 0LL;
    uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
    uint64_t inited = swift_initStackObject(v60, v124);
    __int128 v109 = xmmword_1000AAE80;
    *(_OWORD *)(inited + 16) = xmmword_1000AAE80;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSSendMessageOptionFromIDKey);
    *(void *)(inited + 40) = v62;
    *(void *)(inited + 48) = v117;
    *(void *)(inited + 56) = v47;
    swift_bridgeObjectRetain(v47);
    unint64_t v63 = specialized Dictionary.init(dictionaryLiteral:)(inited);
    swift_bridgeObjectRelease(v63);
    if (one-time initialization token for host != -1) {
      swift_once(&one-time initialization token for host, one-time initialization function for host);
    }
    uint64_t v64 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v64, (uint64_t)static Log.host);
    id v65 = v121;
    id v66 = v51;
    id v67 = v65;
    id v68 = v66;
    uint64_t v69 = (os_log_s *)Logger.logObject.getter(v68);
    os_log_type_t v70 = static os_log_type_t.default.getter();
    int v71 = v70;
    BOOL v72 = os_log_type_enabled(v69, v70);
    uint64_t v112 = v58;
    if (v72)
    {
      uint64_t v73 = swift_slowAlloc(22LL, -1LL);
      uint64_t v74 = (void *)swift_slowAlloc(16LL, -1LL);
      *(_DWORD *)uint64_t v73 = 138412546;
      LODWORD(v121) = v71;
      uint64_t v127 = (uint64_t)v67;
      id v75 = v67;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v73 + 4, v73 + 12);
      *uint64_t v74 = v67;

      uint64_t v59 = (uint64_t)v118;
      *(_WORD *)(v73 + 12) = 2112;
      uint64_t v127 = (uint64_t)v68;
      id v76 = v68;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v127, &v128, v73 + 14, v73 + 22);
      v74[1] = v68;

      _os_log_impl( (void *)&_mh_execute_header,  v69,  (os_log_type_t)v121,  "We are about to send a join response with this response %@ and this %@",  (uint8_t *)v73,  0x16u);
      uint64_t v77 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v74, 2LL, v77);
      swift_slowDealloc(v74, -1LL, -1LL);
      swift_slowDealloc(v73, -1LL, -1LL);
    }

    else
    {

      uint64_t v69 = (os_log_s *)v67;
    }

    uint64_t v78 = (uint64_t)v115;

    uint64_t v79 = IncomingInvitationJoinRequest.destinationToken.getter();
    uint64_t v81 = v116;
    if (v80)
    {
      uint64_t v82 = v79;
      uint64_t v83 = v80;
      uint64_t v84 = v113;
      uint64_t v85 = Message.serializedData(partial:)(0LL, v116, v112);
      if (!v84)
      {
        uint64_t v87 = v85;
        unint64_t v88 = v86;
        uint64_t v89 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
        uint64_t v90 = swift_initStackObject(v89, v122);
        *(_OWORD *)(v90 + 16) = v109;
        *(void *)(v90 + 32) = v82;
        *(void *)(v90 + 40) = v83;
        Swift::Int v91 = specialized Set.init(_nonEmptyArrayLiteral:)(v90);
        swift_setDeallocating(v90);
        swift_arrayDestroy(v90 + 32, 1LL, &type metadata for String);
        uint64_t v92 = v119;
        (*(void (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t, uint64_t))((swift_isaMask & *v114)
                                                                                                 + 0x100LL))( v87,  v88,  v91,  v117,  v119,  1LL);
        uint64_t v105 = v104;
        outlined consume of Data._Representation(v110, v111);
        swift_bridgeObjectRelease(v91);
        swift_bridgeObjectRelease(v92);
        outlined consume of Data._Representation(v87, v88);
        swift_bridgeObjectRelease(v105);

LABEL_22:
        uint64_t v108 = (uint64_t)v115;
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v59,  type metadata accessor for NearbyProtoSessionMessage);
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v108,  type metadata accessor for NearbyProtoJoinResponse.Content);
        return;
      }
    }

    else
    {
      uint64_t v93 = IncomingInvitationJoinRequest.remotePseudonym.getter(v79);
      uint64_t v83 = v94;
      uint64_t v95 = v113;
      uint64_t v96 = Message.serializedData(partial:)(0LL, v81, v112);
      if (!v95)
      {
        uint64_t v98 = v96;
        unint64_t v99 = v97;
        uint64_t v100 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
        uint64_t v101 = swift_initStackObject(v100, v123);
        *(_OWORD *)(v101 + 16) = v109;
        *(void *)(v101 + 32) = v93;
        *(void *)(v101 + 40) = v83;
        Swift::Int v102 = specialized Set.init(_nonEmptyArrayLiteral:)(v101);
        swift_setDeallocating(v101);
        swift_arrayDestroy(v101 + 32, 1LL, &type metadata for String);
        uint64_t v103 = v119;
        (*(void (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t, uint64_t))((swift_isaMask & *v114)
                                                                                                 + 0x100LL))( v98,  v99,  v102,  v117,  v119,  1LL);
        uint64_t v107 = v106;
        outlined consume of Data._Representation(v110, v111);
        swift_bridgeObjectRelease(v102);
        swift_bridgeObjectRelease(v103);

        outlined consume of Data._Representation(v98, v99);
        swift_bridgeObjectRelease(v107);
        goto LABEL_22;
      }
    }

    outlined consume of Data._Representation(v110, v111);
    swift_bridgeObjectRelease(v119);
    swift_bridgeObjectRelease(v83);

    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v59,  type metadata accessor for NearbyProtoSessionMessage);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v78,  type metadata accessor for NearbyProtoJoinResponse.Content);
    return;
  }

  if (one-time initialization token for host != -1) {
    goto LABEL_24;
  }
LABEL_6:
  uint64_t v29 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v29, (uint64_t)static Log.host);
  id v30 = a1;
  uint64_t v31 = (os_log_s *)Logger.logObject.getter(v30);
  os_log_type_t v34 = static os_log_type_t.error.getter(v31, v32, v33);
  if (os_log_type_enabled(v31, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v36 = swift_slowAlloc(32LL, -1LL);
    uint64_t v127 = v36;
    *(_DWORD *)uint64_t v35 = 136315138;
    uint64_t v125 = (uint64_t)v30;
    uint64_t v37 = type metadata accessor for IncomingInvitationJoinRequest(0LL);
    id v38 = v30;
    uint64_t v39 = String.init<A>(reflecting:)(&v125, v37);
    unint64_t v41 = v40;
    uint64_t v125 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v39, v40, &v127);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v125, v126, v35 + 4, v35 + 12);

    swift_bridgeObjectRelease(v41);
    _os_log_impl((void *)&_mh_execute_header, v31, v34, "Failed to find hostInfo on pendingMember: %s", v35, 0xCu);
    swift_arrayDestroy(v36, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v36, -1LL, -1LL);
    swift_slowDealloc(v35, -1LL, -1LL);
  }

  else
  {
  }

  unint64_t v48 = lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors();
  uint64_t v49 = swift_allocError(&type metadata for NearbyIDSServiceController.Errors, v48, 0LL, 0LL);
  *uint64_t v50 = 0;
  swift_willThrow(v49);
}

uint64_t closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = type metadata accessor for NearbyProtoJoinResponse.Content.ApprovalContent(0LL);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = &v23[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v9 = type metadata accessor for UUID(0LL);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v12 = __chkstk_darwin(v9, v11);
  uint64_t v14 = &v23[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v15 = IncomingInvitationJoinRequest.invitationID.getter(v12);
  uint64_t v16 = UUID.uuidString.getter(v15);
  uint64_t v18 = v17;
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v14, v9);
  swift_bridgeObjectRelease(a1[1]);
  *a1 = v16;
  a1[1] = v18;
  uint64_t v24 = a3;
  uint64_t v19 = lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoJoinResponse.Content.ApprovalContent and conformance NearbyProtoJoinResponse.Content.ApprovalContent,  type metadata accessor for NearbyProtoJoinResponse.Content.ApprovalContent,  (uint64_t)&protocol conformance descriptor for NearbyProtoJoinResponse.Content.ApprovalContent);
  static Message.with(_:)( partial apply for closure #1 in closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:),  v23,  v5,  v19);
  uint64_t v20 = (uint64_t)a1 + *(int *)(type metadata accessor for NearbyProtoJoinResponse.Content(0LL) + 20);
  outlined destroy of Any?( v20,  &demangling cache variable for type metadata for NearbyProtoJoinResponse.Content.OneOf_Operation?);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v8,  v20,  type metadata accessor for NearbyProtoJoinResponse.Content.ApprovalContent);
  uint64_t v21 = type metadata accessor for NearbyProtoJoinResponse.Content.OneOf_Operation(0LL);
  swift_storeEnumTagMultiPayload(v20, v21, 1LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56LL))( v20,  0LL,  1LL,  v21);
}

uint64_t closure #1 in closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( uint64_t *a1)
{
  uint64_t v2 = InvitationJoinResponse.sessionIdentifier.getter();
  if (v3)
  {
    uint64_t v4 = v2;
    uint64_t v5 = v3;
    uint64_t v2 = swift_bridgeObjectRelease(a1[1]);
    *a1 = v4;
    a1[1] = v5;
  }

  uint64_t v6 = InvitationJoinResponse.userInfo.getter(v2);
  if (v7 >> 60 != 15)
  {
    uint64_t v8 = v6;
    unint64_t v9 = v7;
    uint64_t v10 = (char *)a1 + *(int *)(type metadata accessor for NearbyProtoJoinResponse.Content.ApprovalContent(0LL) + 28);
    uint64_t v6 = outlined consume of Data?(*(void *)v10, *((void *)v10 + 1));
    *(void *)uint64_t v10 = v8;
    *((void *)v10 + 1) = v9;
  }

  uint64_t result = InvitationJoinResponse.memberHandles.getter(v6);
  if (result)
  {
    uint64_t v12 = result;
    uint64_t result = swift_bridgeObjectRelease(a1[2]);
    a1[2] = v12;
  }

  return result;
}

void NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(void *a1)
{
  uint64_t v111 = type metadata accessor for NearbyProtoSessionMessage(0LL);
  __chkstk_darwin(v111, v3);
  uint64_t v5 = (char *)&v101 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for NearbyProtoJoinResponse.Content(0LL);
  __chkstk_darwin(v6, v7);
  unint64_t v9 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v10 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  uint64_t v14 = (void *)((char *)&v101 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v113 = v1;
  uint64_t v15 = *(void **)((char *)v1
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v14 = v15;
  (*(void (**)(void *, void, uint64_t))(v11 + 104))(v14, enum case for DispatchPredicate.onQueue(_:), v10);
  id v16 = v15;
  LOBYTE(v15) = _dispatchPreconditionTest(_:)(v14);
  uint64_t v17 = (*(uint64_t (**)(void *, uint64_t))(v11 + 8))(v14, v10);
  if ((v15 & 1) == 0)
  {
    __break(1u);
LABEL_24:
    swift_once(&one-time initialization token for host, one-time initialization function for host);
    goto LABEL_6;
  }

  uint64_t v18 = dispatch thunk of IncomingInvitationJoinRequest.hostInfo.getter(v17);
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    __int128 v109 = v5;
    uint64_t v110 = NearbyInvitationJoinRequestMetadata.pseudonym.getter(v18);
    uint64_t v21 = v20;
    __chkstk_darwin(v110, v20);
    *((void *)&v101 - 2) = a1;
    uint64_t v22 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyProtoJoinResponse.Content and conformance NearbyProtoJoinResponse.Content,  type metadata accessor for NearbyProtoJoinResponse.Content,  (uint64_t)&protocol conformance descriptor for NearbyProtoJoinResponse.Content);
    id v23 = v112;
    static Message.with(_:)( partial apply for closure #1 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:),  &v101 - 2,  v6,  v22);
    uint64_t v24 = *(void **)((char *)v113
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController);
    uint64_t v25 = Message.serializedData(partial:)(0LL, v6, v22);
    if (v23)
    {
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v9,  type metadata accessor for NearbyProtoJoinResponse.Content);
      swift_bridgeObjectRelease(v21);

      return;
    }

    uint64_t v40 = v25;
    unint64_t v41 = v26;
    uint64_t v108 = v9;
    id v112 = v19;
    id v107 = a1;
    uint64_t v42 = IncomingInvitationJoinRequest.remotePublicKey.getter();
    unint64_t v44 = v43;
    uint64_t v45 = v110;
    uint64_t v46 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t))((swift_isaMask & *v24) + 0xB8LL))( v40,  v41,  v42,  v43,  v110,  v21);
    unint64_t v51 = v50;
    uint64_t v106 = v21;
    uint64_t v52 = v46;
    outlined consume of Data._Representation(v42, v44);
    uint64_t v53 = outlined consume of Data._Representation(v40, v41);
    __chkstk_darwin(v53, v54);
    *((void *)&v101 - 2) = v52;
    *((void *)&v101 - 1) = v51;
    uint64_t v55 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage,  type metadata accessor for NearbyProtoSessionMessage,  (uint64_t)&protocol conformance descriptor for NearbyProtoSessionMessage);
    unint64_t v56 = v51;
    uint64_t v57 = (uint64_t)v109;
    uint64_t v58 = v111;
    static Message.with(_:)( partial apply for closure #2 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:),  &v101 - 2,  v111,  v55);
    uint64_t v105 = 0LL;
    uint64_t v102 = v52;
    unint64_t v103 = v56;
    uint64_t v59 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, String)>);
    uint64_t inited = swift_initStackObject(v59, v116);
    __int128 v101 = xmmword_1000AAE80;
    *(_OWORD *)(inited + 16) = xmmword_1000AAE80;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSSendMessageOptionFromIDKey);
    *(void *)(inited + 40) = v61;
    uint64_t v62 = v106;
    *(void *)(inited + 48) = v45;
    *(void *)(inited + 56) = v62;
    swift_bridgeObjectRetain(v62);
    unint64_t v63 = specialized Dictionary.init(dictionaryLiteral:)(inited);
    swift_bridgeObjectRelease(v63);
    if (one-time initialization token for host != -1) {
      swift_once(&one-time initialization token for host, one-time initialization function for host);
    }
    uint64_t v104 = v55;
    uint64_t v64 = type metadata accessor for Logger(0LL);
    __swift_project_value_buffer(v64, (uint64_t)static Log.host);
    id v65 = v107;
    id v66 = (os_log_s *)Logger.logObject.getter(v65);
    os_log_type_t v67 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v66, v67))
    {
      id v68 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
      uint64_t v69 = (void *)swift_slowAlloc(8LL, -1LL);
      *(_DWORD *)id v68 = 138412290;
      uint64_t v119 = (uint64_t)v65;
      id v70 = v65;
      uint64_t v57 = (uint64_t)v109;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v119, &v120, v68 + 4, v68 + 12);
      *uint64_t v69 = v65;

      uint64_t v58 = v111;
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "We are about to send a reject response for %@", v68, 0xCu);
      uint64_t v71 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy(v69, 1LL, v71);
      swift_slowDealloc(v69, -1LL, -1LL);
      swift_slowDealloc(v68, -1LL, -1LL);
    }

    else
    {

      id v66 = (os_log_s *)v65;
    }

    id v72 = v112;

    uint64_t v73 = IncomingInvitationJoinRequest.destinationToken.getter();
    if (v74)
    {
      uint64_t v75 = v73;
      uint64_t v76 = v74;
      uint64_t v77 = v105;
      uint64_t v78 = Message.serializedData(partial:)(0LL, v58, v104);
      if (!v77)
      {
        uint64_t v80 = v78;
        unint64_t v81 = v79;
        uint64_t v82 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
        uint64_t v83 = swift_initStackObject(v82, v114);
        *(_OWORD *)(v83 + 16) = v101;
        *(void *)(v83 + 32) = v75;
        *(void *)(v83 + 40) = v76;
        Swift::Int v84 = specialized Set.init(_nonEmptyArrayLiteral:)(v83);
        swift_setDeallocating(v83);
        swift_arrayDestroy(v83 + 32, 1LL, &type metadata for String);
        uint64_t v85 = v106;
        (*(void (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t, void))((swift_isaMask & *v113)
                                                                                                + 0x100LL))( v80,  v81,  v84,  v110,  v106,  0LL);
        uint64_t v98 = v97;
        outlined consume of Data._Representation(v102, v103);
        swift_bridgeObjectRelease(v84);
        swift_bridgeObjectRelease(v85);
        outlined consume of Data._Representation(v80, v81);
        swift_bridgeObjectRelease(v98);

LABEL_22:
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v57,  type metadata accessor for NearbyProtoSessionMessage);
        outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v108,  type metadata accessor for NearbyProtoJoinResponse.Content);
        return;
      }
    }

    else
    {
      uint64_t v86 = IncomingInvitationJoinRequest.remotePseudonym.getter(v73);
      uint64_t v76 = v87;
      uint64_t v88 = v105;
      uint64_t v89 = Message.serializedData(partial:)(0LL, v58, v104);
      if (!v88)
      {
        uint64_t v91 = v89;
        unint64_t v92 = v90;
        uint64_t v93 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
        uint64_t v94 = swift_initStackObject(v93, v115);
        *(_OWORD *)(v94 + 16) = v101;
        *(void *)(v94 + 32) = v86;
        *(void *)(v94 + 40) = v76;
        Swift::Int v95 = specialized Set.init(_nonEmptyArrayLiteral:)(v94);
        swift_setDeallocating(v94);
        swift_arrayDestroy(v94 + 32, 1LL, &type metadata for String);
        uint64_t v96 = v106;
        (*(void (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t, void))((swift_isaMask & *v113)
                                                                                                + 0x100LL))( v91,  v92,  v95,  v110,  v106,  0LL);
        uint64_t v100 = v99;
        outlined consume of Data._Representation(v102, v103);
        swift_bridgeObjectRelease(v95);
        swift_bridgeObjectRelease(v96);

        outlined consume of Data._Representation(v91, v92);
        swift_bridgeObjectRelease(v100);
        goto LABEL_22;
      }
    }

    outlined consume of Data._Representation(v102, v103);
    swift_bridgeObjectRelease(v106);
    swift_bridgeObjectRelease(v76);

    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v57,  type metadata accessor for NearbyProtoSessionMessage);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v108,  type metadata accessor for NearbyProtoJoinResponse.Content);
    return;
  }

  if (one-time initialization token for host != -1) {
    goto LABEL_24;
  }
LABEL_6:
  uint64_t v27 = type metadata accessor for Logger(0LL);
  __swift_project_value_buffer(v27, (uint64_t)static Log.host);
  id v28 = a1;
  uint64_t v29 = (os_log_s *)Logger.logObject.getter(v28);
  os_log_type_t v32 = static os_log_type_t.error.getter(v29, v30, v31);
  if (os_log_type_enabled(v29, v32))
  {
    uint64_t v33 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v34 = swift_slowAlloc(32LL, -1LL);
    uint64_t v119 = v34;
    *(_DWORD *)uint64_t v33 = 136315138;
    uint64_t v117 = (uint64_t)v28;
    uint64_t v35 = type metadata accessor for IncomingInvitationJoinRequest(0LL);
    id v36 = v28;
    uint64_t v37 = String.init<A>(reflecting:)(&v117, v35);
    unint64_t v39 = v38;
    uint64_t v117 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v37, v38, &v119);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v117, v118, v33 + 4, v33 + 12);

    swift_bridgeObjectRelease(v39);
    _os_log_impl((void *)&_mh_execute_header, v29, v32, "Failed to find hostInfo on pendingMember: %s", v33, 0xCu);
    swift_arrayDestroy(v34, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1LL, -1LL);
    swift_slowDealloc(v33, -1LL, -1LL);
  }

  else
  {
  }

  unint64_t v47 = lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors();
  uint64_t v48 = swift_allocError(&type metadata for NearbyIDSServiceController.Errors, v47, 0LL, 0LL);
  *uint64_t v49 = 0;
  swift_willThrow(v48);
}

uint64_t closure #1 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(uint64_t *a1)
{
  uint64_t v2 = type metadata accessor for NearbyProtoJoinResponse.Content.DeniedContent(0LL);
  __chkstk_darwin(v2, v3);
  uint64_t v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v6 = type metadata accessor for UUID(0LL);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = IncomingInvitationJoinRequest.invitationID.getter(v9);
  uint64_t v13 = UUID.uuidString.getter(v12);
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  uint64_t v16 = swift_bridgeObjectRelease(a1[1]);
  *a1 = v13;
  a1[1] = v15;
  UnknownStorage.init()(v16);
  uint64_t v17 = (uint64_t)a1 + *(int *)(type metadata accessor for NearbyProtoJoinResponse.Content(0LL) + 20);
  outlined destroy of Any?( v17,  &demangling cache variable for type metadata for NearbyProtoJoinResponse.Content.OneOf_Operation?);
  outlined init with take of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v5,  v17,  type metadata accessor for NearbyProtoJoinResponse.Content.DeniedContent);
  uint64_t v18 = type metadata accessor for NearbyProtoJoinResponse.Content.OneOf_Operation(0LL);
  swift_storeEnumTagMultiPayload(v17, v18, 0LL);
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56LL))( v17,  0LL,  1LL,  v18);
}

uint64_t closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = type metadata accessor for NearbyProtoJoinResponse(0LL);
  __chkstk_darwin(v9, v10);
  uint64_t v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v13 = type metadata accessor for NearbyProtoSessionMessage(0LL);
  uint64_t v14 = a1 + *(int *)(v13 + 24);
  *(void *)uint64_t v14 = 2LL;
  *(_WORD *)(v14 + 8) = 1;
  uint64_t v23 = a2;
  uint64_t v24 = a3;
  uint64_t v15 = lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoJoinResponse and conformance NearbyProtoJoinResponse,  type metadata accessor for NearbyProtoJoinResponse,  (uint64_t)&protocol conformance descriptor for NearbyProtoJoinResponse);
  static Message.with(_:)(a4, v22, v9, v15);
  uint64_t v16 = Message.serializedData(partial:)(0LL, v9, v15);
  if (v4) {
    return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v12,  type metadata accessor for NearbyProtoJoinResponse);
  }
  uint64_t v19 = v16;
  uint64_t v20 = v17;
  outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v12,  type metadata accessor for NearbyProtoJoinResponse);
  uint64_t v21 = a1 + *(int *)(v13 + 28);
  uint64_t result = outlined consume of Data?(*(void *)v21, *(void *)(v21 + 8));
  *(void *)uint64_t v21 = v19;
  *(void *)(v21 + 8) = v20;
  return result;
}

uint64_t closure #1 in closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = (uint64_t *)(a1 + *(int *)(type metadata accessor for NearbyProtoJoinResponse(0LL) + 20));
  uint64_t v6 = *v5;
  unint64_t v7 = v5[1];
  outlined copy of Data._Representation(a2, a3);
  uint64_t result = outlined consume of Data?(v6, v7);
  *uint64_t v5 = a2;
  v5[1] = a3;
  return result;
}

uint64_t NearbyIDSServiceController.sendRequestConnectionWithNearbyHost(fromHandle:nearbyAdvertisement:)( int *a1, uint8_t *a2, unint64_t a3)
{
  unint64_t v90 = a1;
  uint64_t v91 = a2;
  uint64_t v5 = type metadata accessor for NearbyProtoConnectionRequest(0LL);
  __chkstk_darwin(v5, v6);
  uint64_t v8 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v9 = (int *)type metadata accessor for NearbyProtoSessionMessage(0LL);
  __chkstk_darwin(v9, v10);
  uint64_t v89 = (char *)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v12 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  uint64_t v16 = (int **)((char *)&v84 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  unint64_t v92 = v3;
  uint64_t v17 = *(void **)((char *)v3
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v16 = v17;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v16, enum case for DispatchPredicate.onQueue(_:), v12);
  id v18 = v17;
  LOBYTE(v17) = _dispatchPreconditionTest(_:)(v16);
  uint64_t v19 = (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v16, v12);
  if ((v17 & 1) == 0)
  {
    __break(1u);
    goto LABEL_28;
  }

  uint64_t v20 = NearbyAdvertisement.contactID.getter(v19);
  if (!v21)
  {
    unint64_t v37 = lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors();
    uint64_t v38 = swift_allocError(&type metadata for NearbyIDSServiceController.Errors, v37, 0LL, 0LL);
    char v40 = 1;
LABEL_10:
    *unint64_t v39 = v40;
    return swift_willThrow(v38);
  }

  uint64_t v22 = v20;
  uint64_t v23 = v21;
  NearbyAdvertisement.handle.getter();
  if (!v24)
  {
    swift_bridgeObjectRelease(v23);
    unint64_t v41 = lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors();
    uint64_t v38 = swift_allocError(&type metadata for NearbyIDSServiceController.Errors, v41, 0LL, 0LL);
    char v40 = 2;
    goto LABEL_10;
  }

  uint64_t v25 = v24;
  NSString v26 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v25);
  id v27 = [v26 IDSFormattedDestinationID];

  if (!v27)
  {
    swift_bridgeObjectRelease(v23);
    unint64_t v43 = lazy protocol witness table accessor for type IDSServiceError and conformance IDSServiceError();
    uint64_t v38 = swift_allocError(&type metadata for IDSServiceError, v43, 0LL, 0LL);
    return swift_willThrow(v38);
  }

  uint64_t v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(v27);
  uint64_t v87 = v28;

  uint64_t v29 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v30 = swift_allocObject(v29, 40LL, 7LL);
  *(_OWORD *)(v30 + 16) = xmmword_1000AAE90;
  id v31 = [(id)objc_opt_self(CNContactFormatter) descriptorForRequiredKeysForStyle:0];
  *(void *)(v30 + 32) = v31;
  Swift::Int v95 = (void *)v30;
  specialized Array._endMutation()(v31);
  uint64_t v32 = (uint64_t)v95;
  type metadata accessor for NearbyAdvertisement(0LL);
  uint64_t v34 = static NearbyAdvertisement.meContactID.getter();
  uint64_t v35 = v33;
  if (v22 == v34 && v23 == v33)
  {
    swift_bridgeObjectRelease(v23);
    uint64_t v36 = v35;
    goto LABEL_15;
  }

  char v44 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v23, v34, v33, 0LL);
  swift_bridgeObjectRelease(v35);
  if ((v44 & 1) != 0)
  {
    uint64_t v36 = v23;
LABEL_15:
    swift_bridgeObjectRelease(v36);
    id v45 = NearbyIDSServiceController.contactStore.getter();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v32);
    Swift::Int v95 = 0LL;
    unint64_t v47 = (int *)objc_msgSend(v45, "_ios_meContactWithKeysToFetch:error:", isa, &v95);

    uint64_t v48 = v95;
    if (v47) {
      goto LABEL_16;
    }
    goto LABEL_19;
  }

  id v65 = NearbyIDSServiceController.contactStore.getter();
  NSString v66 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v23);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CNKeyDescriptor);
  Class v67 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v32);
  Swift::Int v95 = 0LL;
  unint64_t v47 = (int *)[v65 unifiedContactWithIdentifier:v66 keysToFetch:v67 error:&v95];

  uint64_t v48 = v95;
  if (!v47)
  {
LABEL_19:
    id v68 = v48;
    swift_bridgeObjectRelease(v87);
    _convertNSErrorToError(_:)(v48);

    return swift_willThrow(v38);
  }

uint64_t closure #1 in NearbyIDSServiceController.sendRequestConnectionWithNearbyHost(fromHandle:nearbyAdvertisement:)( uint64_t *a1, id a2, uint64_t a3, uint64_t a4)
{
  id v7 = [a2 givenName];
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  uint64_t v10 = v9;

  uint64_t v11 = type metadata accessor for NearbyProtoConnectionRequest(0LL);
  uint64_t v12 = (uint64_t *)((char *)a1 + *(int *)(v11 + 28));
  swift_bridgeObjectRelease(v12[1]);
  uint64_t *v12 = v8;
  v12[1] = v10;
  uint64_t v13 = a1[3];
  swift_bridgeObjectRetain(a4);
  uint64_t v14 = swift_bridgeObjectRelease(v13);
  a1[2] = a3;
  a1[3] = a4;
  uint64_t v15 = NearbyAdvertisement.identifier.getter(v14);
  uint64_t v17 = v16;
  uint64_t v18 = swift_bridgeObjectRelease(a1[1]);
  *a1 = v15;
  a1[1] = v17;
  uint64_t result = NearbyAdvertisement.userInfo.getter(v18);
  if (v20 >> 60 != 15)
  {
    uint64_t v21 = result;
    unint64_t v22 = v20;
    uint64_t v23 = (char *)a1 + *(int *)(v11 + 32);
    uint64_t result = outlined consume of Data?(*(void *)v23, *((void *)v23 + 1));
    *(void *)uint64_t v23 = v21;
    *((void *)v23 + 1) = v22;
  }

  return result;
}

uint64_t NearbyIDSServiceController.sendJoinRequest(for:from:)@<X0>( void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, os_log_s *a4@<X8>)
{
  uint64_t v162 = a3;
  uint64_t v157 = a2;
  uint64_t v154 = type metadata accessor for NearbyProtoSessionMessage(0LL);
  uint64_t v8 = __chkstk_darwin(v154, v7);
  uint64_t v152 = (uint64_t)&v150 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v8, v10);
  uint64_t v12 = (char *)&v150 - v11;
  unint64_t v163 = type metadata accessor for NearbyProtoJoinRequest.Content(0LL);
  uint64_t v14 = __chkstk_darwin(v163, v13);
  v160 = (uint8_t *)&v150 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)&v150 - v17;
  uint64_t v19 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19, v21);
  uint64_t v23 = (uint64_t *)((char *)&v150 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v24 = *(void **)((char *)v4
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *uint64_t v23 = v24;
  (*(void (**)(void *, void, uint64_t))(v20 + 104))(v23, enum case for DispatchPredicate.onQueue(_:), v19);
  id v25 = v24;
  LOBYTE(v24) = _dispatchPreconditionTest(_:)(v23);
  (*(void (**)(void *, uint64_t))(v20 + 8))(v23, v19);
  if ((v24 & 1) != 0)
  {
    v161 = v4;
    v155 = v12;
    if (one-time initialization token for host == -1) {
      goto LABEL_3;
    }
  }

  else
  {
    __break(1u);
  }

  swift_once(&one-time initialization token for host, one-time initialization function for host);
LABEL_3:
  uint64_t v26 = type metadata accessor for Logger(0LL);
  uint64_t v27 = __swift_project_value_buffer(v26, (uint64_t)static Log.host);
  uint64_t v28 = v162;
  swift_bridgeObjectRetain_n(v162, 2LL);
  id v29 = a1;
  uint64_t v166 = v27;
  uint64_t v30 = (os_log_s *)Logger.logObject.getter(v29);
  os_log_type_t v31 = static os_log_type_t.default.getter();
  BOOL v32 = os_log_type_enabled(v30, v31);
  os_log_t v164 = a4;
  v165 = v18;
  if (v32)
  {
    uint64_t v33 = swift_slowAlloc(22LL, -1LL);
    uint64_t v34 = swift_slowAlloc(64LL, -1LL);
    uint64_t v170 = v34;
    *(_DWORD *)uint64_t v33 = 136315394;
    uint64_t v168 = v157;
    v169[0] = v28;
    swift_bridgeObjectRetain(v28);
    uint64_t v35 = String.init<A>(reflecting:)(&v168, &type metadata for String);
    unint64_t v37 = v36;
    uint64_t v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v35, v36, &v170);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, v169, v33 + 4, v33 + 12);
    swift_bridgeObjectRelease_n(v28, 2LL);
    swift_bridgeObjectRelease(v37);
    *(_WORD *)(v33 + 12) = 2080;
    uint64_t v168 = (uint64_t)v29;
    uint64_t v38 = type metadata accessor for InvitationApprovalRequest(0LL);
    id v39 = v29;
    uint64_t v40 = String.init<A>(reflecting:)(&v168, v38);
    unint64_t v42 = v41;
    uint64_t v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v40, v41, &v170);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, v169, v33 + 14, v33 + 22);

    unint64_t v43 = v42;
    a4 = v164;
    uint64_t v18 = v165;
    swift_bridgeObjectRelease(v43);
    _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "Attempting to create and send joinRequest from: %s for request: %s",  (uint8_t *)v33,  0x16u);
    swift_arrayDestroy(v34, 2LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v34, -1LL, -1LL);
    swift_slowDealloc(v33, -1LL, -1LL);
  }

  else
  {

    uint64_t v44 = swift_bridgeObjectRelease_n(v28, 2LL);
  }

  unint64_t v45 = v163;
  uint64_t v46 = (void *)InvitationApprovalRequest.remoteInvitationData.getter(v44);
  unint64_t v47 = (void *)NearbyInvitationData.hostConnectionInfo.getter();

  uint64_t v153 = NearbyInvitationJoinRequestMetadata.pseudonym.getter(v48);
  uint64_t v158 = v49;

  uint64_t v51 = UUID.init()(v50);
  __chkstk_darwin(v51, v52);
  *(&v150 - 2) = (uint64_t)v29;
  *(&v150 - 1) = (uint64_t)a4;
  uint64_t v53 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyProtoJoinRequest.Content and conformance NearbyProtoJoinRequest.Content,  type metadata accessor for NearbyProtoJoinRequest.Content,  (uint64_t)&protocol conformance descriptor for NearbyProtoJoinRequest.Content);
  unint64_t v54 = v159;
  static Message.with(_:)( partial apply for closure #1 in NearbyIDSServiceController.sendJoinRequest(for:from:),  &v150 - 4,  v45,  v53);
  unint64_t v159 = v54;
  uint64_t v55 = (uint64_t)v18;
  uint64_t v56 = (uint64_t)v160;
  uint64_t v57 = outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( v55,  (uint64_t)v160,  type metadata accessor for NearbyProtoJoinRequest.Content);
  uint64_t v58 = (os_log_s *)Logger.logObject.getter(v57);
  os_log_type_t v59 = static os_log_type_t.info.getter();
  BOOL v60 = os_log_type_enabled(v58, v59);
  v156 = (uint64_t *)v53;
  if (v60)
  {
    uint64_t v61 = swift_slowAlloc(12LL, -1LL);
    id v151 = v29;
    uint64_t v62 = (uint8_t *)v61;
    uint64_t v63 = swift_slowAlloc(32LL, -1LL);
    unint64_t v64 = v45;
    uint64_t v65 = v63;
    uint64_t v168 = v63;
    *(_DWORD *)uint64_t v62 = 136315138;
    uint64_t v66 = Message.debugDescription.getter(v64, v53);
    unint64_t v68 = v67;
    uint64_t v170 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v66, v67, &v168);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v62 + 4, v62 + 12);
    swift_bridgeObjectRelease(v68);
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v56,  type metadata accessor for NearbyProtoJoinRequest.Content);
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "Request content: %s", v62, 0xCu);
    swift_arrayDestroy(v65, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v65, -1LL, -1LL);
    uint64_t v69 = v62;
    id v29 = v151;
    swift_slowDealloc(v69, -1LL, -1LL);
  }

  else
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v56,  type metadata accessor for NearbyProtoJoinRequest.Content);
  }

  id v70 = v29;
  uint64_t v71 = (os_log_s *)Logger.logObject.getter(v70);
  os_log_type_t v72 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v71, v72))
  {
    uint64_t v73 = (uint8_t *)swift_slowAlloc(12LL, -1LL);
    uint64_t v74 = swift_slowAlloc(32LL, -1LL);
    uint64_t v170 = v74;
    *(_DWORD *)uint64_t v73 = 136315138;
    v160 = v73 + 4;
    uint64_t v75 = (void *)InvitationApprovalRequest.remoteInvitationData.getter(v74);
    uint64_t v76 = (void *)NearbyInvitationData.hostConnectionInfo.getter();

    uint64_t v77 = NearbyInvitationJoinRequestMetadata.publicKey.getter();
    uint64_t v79 = v78;

    uint64_t v168 = v77;
    v169[0] = v79;
    uint64_t v80 = String.init<A>(reflecting:)(&v168, &type metadata for Data);
    unint64_t v82 = v81;
    uint64_t v168 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v80, v81, &v170);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v168, v169, v160, v73 + 12);

    swift_bridgeObjectRelease(v82);
    _os_log_impl((void *)&_mh_execute_header, v71, v72, "Creating RequesterCredentials with publicKey: %s", v73, 0xCu);
    swift_arrayDestroy(v74, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v74, -1LL, -1LL);
    swift_slowDealloc(v73, -1LL, -1LL);
  }

  else
  {
  }

  uint64_t v84 = (uint64_t)v165;
  uint64_t v85 = v161;
  uint64_t v86 = (void *)InvitationApprovalRequest.remoteInvitationData.getter(v83);
  uint64_t v87 = (void *)NearbyInvitationData.hostConnectionInfo.getter();

  uint64_t v88 = NearbyInvitationJoinRequestMetadata.publicKey.getter();
  uint64_t v90 = v89;

  uint64_t v91 = type metadata accessor for RequesterCredentials(0LL);
  swift_allocObject(v91, *(unsigned int *)(v91 + 48), *(unsigned __int16 *)(v91 + 52));
  unint64_t v92 = v159;
  uint64_t v93 = RequesterCredentials.init(ownerPublicKey:)(v88, v90);
  if (v92)
  {
    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v84,  type metadata accessor for NearbyProtoJoinRequest.Content);
    swift_bridgeObjectRelease(v158);
    os_log_t v99 = v164;
    uint64_t v100 = type metadata accessor for UUID(0LL);
    return (*(uint64_t (**)(os_log_t, uint64_t))(*(void *)(v100 - 8) + 8LL))(v99, v100);
  }

  else
  {
    uint64_t v94 = v93;
    uint64_t v95 = Message.serializedData(partial:)(0LL, v163, v156);
    unint64_t v97 = v96;
    uint64_t v98 = (*(uint64_t (**)(void))(*(void *)v94 + 144LL))();
    unint64_t v159 = v102;
    v160 = (uint8_t *)v98;
    unint64_t v163 = v103;
    uint64_t v105 = v104;
    uint64_t v106 = outlined consume of Data._Representation(v95, v97);
    id v107 = (void *)InvitationApprovalRequest.remoteInvitationData.getter(v106);
    uint64_t v108 = (void *)NearbyInvitationData.hostConnectionInfo.getter();

    uint64_t v110 = NearbyInvitationJoinRequestMetadata.pseudonym.getter(v109);
    uint64_t v112 = v111;

    uint64_t v113 = *(uint64_t (**)(uint64_t *))((swift_isaMask & *v85) + 0xA8LL);
    swift_retain();
    v114 = (uint64_t (*)(uint64_t *, void))v113(&v168);
    uint64_t v116 = v115;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v115);
    uint64_t v170 = *v116;
    *uint64_t v116 = 0x8000000000000000LL;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v94, v110, v112, isUniquelyReferenced_nonNull_native);
    uint64_t v118 = *v116;
    *uint64_t v116 = v170;
    swift_bridgeObjectRelease(v112);
    swift_bridgeObjectRelease(v118);
    uint64_t v119 = v114(&v168, 0LL);
    v156 = &v150;
    __chkstk_darwin(v119, v120);
    unint64_t v121 = v159;
    *(&v150 - 4) = v105;
    *(&v150 - 3) = v121;
    unint64_t v122 = v163;
    *(&v150 - 2) = (uint64_t)v160;
    *(&v150 - 1) = v122;
    uint64_t v123 = lazy protocol witness table accessor for type UUID and conformance UUID( &lazy protocol witness table cache variable for type NearbyProtoSessionMessage and conformance NearbyProtoSessionMessage,  type metadata accessor for NearbyProtoSessionMessage,  (uint64_t)&protocol conformance descriptor for NearbyProtoSessionMessage);
    uint64_t v124 = v154;
    static Message.with(_:)( partial apply for closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:),  &v150 - 6,  v154,  v123);
    id v151 = (id)v105;
    uint64_t v125 = Message.serializedData(partial:)(0LL, v124, v123);
    unint64_t v127 = v126;
    uint64_t v128 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t inited = swift_initStackObject(v128, v167);
    *(_OWORD *)(inited + 16) = xmmword_1000AAE80;
    *(void *)(inited + 32) = v153;
    *(void *)(inited + 40) = v158;
    Swift::Int v130 = specialized Set.init(_nonEmptyArrayLiteral:)(inited);
    swift_setDeallocating(inited);
    swift_arrayDestroy(inited + 32, 1LL, &type metadata for String);
    uint64_t v131 = (*(uint64_t (**)(uint64_t, unint64_t, Swift::Int, uint64_t, uint64_t, uint64_t))((swift_isaMask & *v161) + 0x100LL))( v125,  v127,  v130,  v157,  v162,  1LL);
    unint64_t v133 = v132;
    uint64_t v134 = v131;
    swift_bridgeObjectRelease(v130);
    outlined consume of Data._Representation(v125, v127);
    uint64_t v135 = (uint64_t)v155;
    uint64_t v136 = v152;
    outlined init with copy of NearbyGroupHostIDSService.MessageEvent.MembershipMutation( (uint64_t)v155,  v152,  type metadata accessor for NearbyProtoSessionMessage);
    swift_bridgeObjectRetain(v133);
    uint64_t v138 = (os_log_s *)Logger.logObject.getter(v137);
    os_log_type_t v139 = static os_log_type_t.default.getter();
    int v140 = v139;
    if (os_log_type_enabled(v138, v139))
    {
      uint64_t v141 = swift_slowAlloc(22LL, -1LL);
      os_log_t v164 = v138;
      uint64_t v142 = v141;
      uint64_t v166 = swift_slowAlloc(64LL, -1LL);
      uint64_t v168 = v166;
      *(_DWORD *)uint64_t v142 = 136315394;
      LODWORD(v162) = v140;
      swift_bridgeObjectRetain(v133);
      uint64_t v170 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v134, v133, &v168);
      uint64_t v143 = v135;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v142 + 4, v142 + 12);
      swift_bridgeObjectRelease_n(v133, 3LL);
      *(_WORD *)(v142 + 12) = 2080;
      uint64_t v144 = Message.debugDescription.getter(v154, v123);
      unint64_t v146 = v145;
      uint64_t v170 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v144, v145, &v168);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v170, &v171, v142 + 14, v142 + 22);
      swift_bridgeObjectRelease(v146);
      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v136,  type metadata accessor for NearbyProtoSessionMessage);
      os_log_t v147 = v164;
      _os_log_impl( (void *)&_mh_execute_header,  v164,  (os_log_type_t)v162,  "Sent JoinRequest (%s), message: %s",  (uint8_t *)v142,  0x16u);
      uint64_t v148 = v166;
      swift_arrayDestroy(v166, 2LL, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v148, -1LL, -1LL);
      swift_slowDealloc(v142, -1LL, -1LL);
      outlined consume of Data._Representation((uint64_t)v151, v159);
      outlined consume of Data._Representation((uint64_t)v160, v163);
      swift_release(v94);

      uint64_t v149 = v143;
    }

    else
    {
      outlined consume of Data._Representation((uint64_t)v151, v159);
      outlined consume of Data._Representation((uint64_t)v160, v163);

      outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v136,  type metadata accessor for NearbyProtoSessionMessage);
      swift_release(v94);
      swift_bridgeObjectRelease_n(v133, 2LL);
      uint64_t v149 = v135;
    }

    outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( v149,  type metadata accessor for NearbyProtoSessionMessage);
    return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v165,  type metadata accessor for NearbyProtoJoinRequest.Content);
  }

void closure #1 in NearbyIDSServiceController.sendJoinRequest(for:from:)(uint64_t *a1)
{
  uint64_t v2 = InvitationApprovalRequest.displayName.getter();
  uint64_t v4 = v3;
  uint64_t v5 = (int *)type metadata accessor for NearbyProtoJoinRequest.Content(0LL);
  uint64_t v6 = (uint64_t *)((char *)a1 + v5[6]);
  uint64_t v7 = swift_bridgeObjectRelease(v6[1]);
  *uint64_t v6 = v2;
  v6[1] = v4;
  uint64_t v8 = UUID.uuidString.getter(v7);
  uint64_t v10 = v9;
  uint64_t v11 = swift_bridgeObjectRelease(a1[1]);
  *a1 = v8;
  a1[1] = v10;
  *((_BYTE *)a1 + v5[8]) = 1;
  uint64_t v12 = InvitationApprovalRequest.userInfo.getter(v11);
  if (v13 >> 60 == 15)
  {
    uint64_t v14 = (void *)InvitationApprovalRequest.remoteInvitationData.getter(v12);
    uint64_t v15 = NearbyInvitationData.userInfo.getter();
    unint64_t v17 = v16;

    if (v17 >> 60 != 15)
    {
      uint64_t v18 = (char *)a1 + v5[7];
      outlined consume of Data?(*(void *)v18, *((void *)v18 + 1));
      *(void *)uint64_t v18 = v15;
      *((void *)v18 + 1) = v17;
    }
  }

  else
  {
    uint64_t v19 = v12;
    unint64_t v20 = v13;
    uint64_t v21 = (char *)a1 + v5[7];
    outlined consume of Data?(*(void *)v21, *((void *)v21 + 1));
    *(void *)uint64_t v21 = v19;
    *((void *)v21 + 1) = v20;
  }

uint64_t closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = type metadata accessor for NearbyProtoJoinRequest(0LL);
  __chkstk_darwin(v11, v12);
  uint64_t v14 = &v24[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
  uint64_t v15 = type metadata accessor for NearbyProtoSessionMessage(0LL);
  uint64_t v16 = a1 + *(int *)(v15 + 24);
  *(void *)uint64_t v16 = 1LL;
  *(_WORD *)(v16 + 8) = 1;
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  uint64_t v28 = a5;
  uint64_t v17 = lazy protocol witness table accessor for type UUID and conformance UUID( (unint64_t *)&lazy protocol witness table cache variable for type NearbyProtoJoinRequest and conformance NearbyProtoJoinRequest,  type metadata accessor for NearbyProtoJoinRequest,  (uint64_t)&protocol conformance descriptor for NearbyProtoJoinRequest);
  static Message.with(_:)( partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:),  v24,  v11,  v17);
  uint64_t v18 = Message.serializedData(partial:)(0LL, v11, v17);
  if (v5) {
    return outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v14,  type metadata accessor for NearbyProtoJoinRequest);
  }
  uint64_t v21 = v18;
  uint64_t v22 = v19;
  outlined destroy of NearbyGroupHostIDSService.MessageEvent.RemoteGroupInitialization( (uint64_t)v14,  type metadata accessor for NearbyProtoJoinRequest);
  uint64_t v23 = a1 + *(int *)(v15 + 28);
  uint64_t result = outlined consume of Data?(*(void *)v23, *(void *)(v23 + 8));
  *(void *)uint64_t v23 = v21;
  *(void *)(v23 + 8) = v22;
  return result;
}

uint64_t closure #1 in closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v10 = type metadata accessor for NearbyProtoJoinRequest(0LL);
  uint64_t v11 = (uint64_t *)(a1 + *(int *)(v10 + 20));
  uint64_t v12 = *v11;
  unint64_t v13 = v11[1];
  outlined copy of Data._Representation(a2, a3);
  outlined consume of Data?(v12, v13);
  *uint64_t v11 = a2;
  v11[1] = a3;
  uint64_t v14 = (uint64_t *)(a1 + *(int *)(v10 + 24));
  uint64_t v15 = *v14;
  unint64_t v16 = v14[1];
  outlined copy of Data._Representation(a4, a5);
  uint64_t result = outlined consume of Data?(v15, v16);
  *uint64_t v14 = a4;
  v14[1] = a5;
  return result;
}

void NearbyIDSServiceController.send(data:toDestinations:from:shouldDonateToFirweall:)( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = v6;
  uint64_t v8 = v5;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Any)>);
  uint64_t inited = swift_initStackObject(v13, v37);
  *(_OWORD *)(inited + 16) = xmmword_1000AAE80;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSSendMessageOptionAlwaysSkipSelfKey);
  *(void *)(inited + 40) = v15;
  uint64_t v16 = type metadata accessor for OS_dispatch_queue( 0LL,  (unint64_t *)&lazy cache variable for type metadata for NSNumber,  &OBJC_CLASS___NSNumber_ptr);
  v17.super.super.Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
  *(void *)(inited + 72) = v16;
  *(NSNumber *)(inited + 48) = v17;
  unint64_t v18 = specialized Dictionary.init(dictionaryLiteral:)(inited);
  if (a5)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(IDSSendMessageOptionFromIDKey);
    uint64_t v21 = v20;
    NSString v22 = String._bridgeToObjectiveC()();
    uint64_t v23 = IDSCopyBestGuessIDForID(v22);

    if (!v23)
    {
      __break(1u);
      return;
    }

    uint64_t v36 = type metadata accessor for OS_dispatch_queue( 0LL,  &lazy cache variable for type metadata for NSString,  &OBJC_CLASS___NSString_ptr);
    *(void *)&__int128 v35 = v23;
    outlined init with take of Any(&v35, v34);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v18);
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v34, v19, v21, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease(v21);
    swift_bridgeObjectRelease(0x8000000000000000LL);
    uint64_t v7 = v6;
  }

  uint64_t v25 = (void *)(v8
                 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service);
  uint64_t v26 = *(void *)(v8
                  + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service
                  + 24);
  uint64_t v27 = *(void *)(v8
                  + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service
                  + 32);
  __swift_project_boxed_opaque_existential_1(v25, v26);
  uint64_t v28 = specialized _setUpCast<A, B>(_:)(a3);
  uint64_t v29 = specialized _dictionaryUpCast<A, B, C, D>(_:)(v18);
  swift_bridgeObjectRelease(v18);
  *(void *)&__int128 v35 = 0LL;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, __int128 *, uint64_t, uint64_t))(v27 + 32))( a1,  a2,  v28,  300LL,  v29,  &v35,  v26,  v27);
  swift_bridgeObjectRelease(v28);
  swift_bridgeObjectRelease(v29);
  id v30 = (id)v35;
  os_log_type_t v31 = v30;
  if (v7)
  {
    swift_willThrow(v30);
  }

  else if (v30)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v30);
  }

  else
  {
    unint64_t v32 = lazy protocol witness table accessor for type IDSServiceError and conformance IDSServiceError();
    uint64_t v33 = swift_allocError(&type metadata for IDSServiceError, v32, 0LL, 0LL);
    swift_willThrow(v33);
  }

void NearbyIDSServiceController.init()()
{
}

id NearbyIDSServiceController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NearbyIDSServiceController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void NearbyIDSServiceController.service(_:account:incomingData:fromID:context:)( void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (a1)
  {
    id v13 = a1;
    specialized NearbyIDSServiceController.handleIncomingMessage(_:account:incomingData:fromIDWithToken:context:)( a3,  a4,  a5,  a6,  a7,  v7);
  }

  else
  {
    __break(1u);
  }

void NearbyIDSServiceController.handleIncomingMessage(_:account:incomingData:fromIDWithToken:context:)( void *a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)( char a1, int64_t a2, char a3)
{
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( a1,  a2,  a3,  *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( a1,  a2,  a3,  *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( a1,  a2,  a3,  *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( a1,  a2,  a3,  (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

{
  uint64_t *v3;
  uint64_t result;
  uint64_t result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( a1,  a2,  a3,  (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char a1, int64_t a2, char a3, char *a4)
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    uint64_t v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7LL);
    int64_t v12 = _swift_stdlib_malloc_size(v11);
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
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t result;
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt>);
    uint64_t v11 = (char *)swift_allocObject(v10, 8 * v9 + 32, 7LL);
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }

  else
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
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

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  size_t v15;
  uint64_t result;
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

  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<BluetoothScannerDiscoveryEngineDevice>);
    uint64_t v11 = (char *)swift_allocObject(v10, 88 * v9 + 32, 7LL);
    int64_t v12 = _swift_stdlib_malloc_size(v11);
    *((void *)v11 + 2) = v8;
    *((void *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 88);
  }

  else
  {
    uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  }

  uint64_t v13 = v11 + 32;
  uint64_t v14 = a4 + 32;
  uint64_t v15 = 88 * v8;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15]) {
      memmove(v13, v14, v15);
    }
    *((void *)a4 + 2) = 0LL;
    goto LABEL_28;
  }

  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy(v13);
LABEL_28:
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

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( char a1, int64_t a2, char a3, void *a4)
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
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<FilteredBluetoothScanner<NearbyRangingFilter>.FilteredDevice>);
    uint64_t v11 = (void *)swift_allocObject(v10, 24 * v9 + 32, 7LL);
    size_t v12 = _swift_stdlib_malloc_size(v11);
    v11[2] = v8;
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for FilteredBluetoothScanner<NearbyRangingFilter>.FilteredDevice);
    swift_arrayInitWithCopy(v11 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }

{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;
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

  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<NearbyGroup_Member>);
  uint64_t v11 = *(void *)(type metadata accessor for NearbyGroup_Member(0LL) - 8);
  size_t v12 = *(void *)(v11 + 72);
  unint64_t v13 = *(unsigned __int8 *)(v11 + 80);
  unint64_t v14 = (v13 + 32) & ~v13;
  uint64_t v15 = (void *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  uint64_t v16 = _swift_stdlib_malloc_size(v15);
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
  unint64_t v18 = type metadata accessor for NearbyGroup_Member(0LL);
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = (*(unsigned __int8 *)(v19 + 80) + 32LL) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  uint64_t v21 = (char *)v15 + v20;
  NSString v22 = (char *)a4 + v20;
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
  uint64_t v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy(v21);
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }

id specialized NearbyIDSServiceController.init(queue:service:delegate:joinRequestsController:)( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, char *a6, uint64_t a7, uint64_t a8)
{
  v31[3] = a7;
  v31[4] = a8;
  __swift_allocate_boxed_opaque_existential_1(v31);
  (*(void (**)(void))(*(void *)(a7 - 8) + 32LL))();
  uint64_t v15 = &a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate];
  *((void *)v15 + 1) = 0LL;
  uint64_t v16 = swift_unknownObjectWeakInit(v15, 0LL);
  *(void *)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_requesterCredentialsByOwnerPseudonym] = &_swiftEmptyDictionarySingleton;
  *(void *)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore] = 0LL;
  swift_beginAccess(v16, v30, 1LL, 0LL);
  *((void *)v15 + 1) = a4;
  swift_unknownObjectWeakAssign(v15, a3);
  outlined init with copy of PseudonymProtocol( (uint64_t)v31,  (uint64_t)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service]);
  *(void *)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue] = a1;
  *(void *)&a6[OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController] = a5;
  v29.receiver = a6;
  v29.super_class = (Class)type metadata accessor for NearbyIDSServiceController();
  id v17 = a1;
  id v27 = a5;
  id v18 = objc_msgSendSuper2(&v29, "init");
  id v19 = objc_allocWithZone(&OBJC_CLASS___IDSServiceDelegateProperties);
  id v20 = v18;
  id v21 = [v19 init];
  [v21 setWantsCrossAccountMessaging:1];
  NSString v22 = *(void (**)(id, id, id, uint64_t, uint64_t))(a8 + 24);
  id v23 = v17;
  id v24 = v20;
  id v25 = v21;
  v22(v20, v21, v17, a7, a8);

  swift_unknownObjectRelease(a3);
  __swift_destroy_boxed_opaque_existential_0Tm(v31);
  return v24;
}

int64_t specialized _NativeSet.index(after:)(int64_t result, int a2, char a3, uint64_t a4)
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

void specialized Set.subscript.getter(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
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
        uint64_t v12 = type metadata accessor for NearbyGroupMember(0LL);
        swift_unknownObjectRetain(v11);
        swift_dynamicCast(&v22, &v21, (char *)&type metadata for Swift.AnyObject + 8, v12, 7LL);
        unint64_t v4 = v22;
        swift_unknownObjectRelease(v11);
        Swift::Int v13 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
        uint64_t v14 = -1LL << *(_BYTE *)(a4 + 32);
        unint64_t v7 = v13 & ~v14;
        if (((*(void *)(a4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8LL)) >> v7) & 1) != 0)
        {
          id v15 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
          char v16 = static NSObject.== infix(_:_:)(v15);

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
              char v19 = static NSObject.== infix(_:_:)(v18);
            }

            while ((v19 & 1) == 0);
          }

LABEL_20:
          id v20 = *(id *)(*(void *)(a4 + 48) + 8 * v7);
          return;
        }

uint64_t specialized _NativeSet.startIndex.getter(uint64_t a1)
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

Swift::Int specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _SetStorage<String>);
    uint64_t v3 = static _SetStorage.allocate(capacity:)(v1);
    uint64_t v4 = 0LL;
    uint64_t v5 = v3 + 56;
    uint64_t v27 = a1 + 32;
    while (1)
    {
      unsigned int v6 = (uint64_t *)(v27 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)(v28, *(void *)(v3 + 40));
      swift_bridgeObjectRetain(v7);
      String.hash(into:)(v28, v8, v7);
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1LL << *(_BYTE *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1LL << v11;
      if (((1LL << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        char v16 = (void *)(v15 + 16 * v11);
        uint64_t v17 = v16[1];
        BOOL v18 = *v16 == v8 && v17 == v7;
        if (v18 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, v7, 0LL), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease(v7);
          goto LABEL_4;
        }

        uint64_t v19 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v19;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1LL << v11;
          if ((v13 & (1LL << v11)) == 0) {
            break;
          }
          id v20 = (void *)(v15 + 16 * v11);
          uint64_t v21 = v20[1];
          if (*v20 != v8 || v21 != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, v7, 0LL);
            if ((result & 1) == 0) {
              continue;
            }
          }

          goto LABEL_3;
        }
      }

      *(void *)(v5 + 8 * v12) = v14 | v13;
      id v23 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *id v23 = v8;
      v23[1] = v7;
      uint64_t v24 = *(void *)(v3 + 16);
      BOOL v25 = __OFADD__(v24, 1LL);
      uint64_t v26 = v24 + 1;
      if (v25)
      {
        __break(1u);
        return result;
      }

      *(void *)(v3 + 16) = v26;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }

  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t partial apply for closure #1 in NearbyIDSServiceController.approveConnectionRequest(id:localInvitation:destinationHandle:)( void *a1)
{
  return closure #1 in NearbyIDSServiceController.approveConnectionRequest(id:localInvitation:destinationHandle:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40));
}

unint64_t lazy protocol witness table accessor for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors()
{
  unint64_t result = lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors;
  if (!lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for NearbyIDSServiceController.Errors,  &type metadata for NearbyIDSServiceController.Errors);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors;
  if (!lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for NearbyIDSServiceController.Errors,  &type metadata for NearbyIDSServiceController.Errors);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type NearbyIDSServiceController.Errors and conformance NearbyIDSServiceController.Errors);
  }

  return result;
}

uint64_t partial apply for closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( uint64_t *a1)
{
  return closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24));
}

uint64_t partial apply for closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( uint64_t a1)
{
  return closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  (uint64_t)partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:));
}

uint64_t partial apply for closure #1 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)( uint64_t *a1)
{
  return closure #1 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(a1);
}

uint64_t partial apply for closure #2 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)( uint64_t a1)
{
  return closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  (uint64_t)partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:));
}

unint64_t lazy protocol witness table accessor for type IDSServiceError and conformance IDSServiceError()
{
  unint64_t result = lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError;
  if (!lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for IDSServiceError,  &type metadata for IDSServiceError);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError);
  }

  return result;
}

{
  unint64_t result;
  unint64_t result = lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError;
  if (!lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError)
  {
    unint64_t result = swift_getWitnessTable( &protocol conformance descriptor for IDSServiceError,  &type metadata for IDSServiceError);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type IDSServiceError and conformance IDSServiceError);
  }

  return result;
}

uint64_t partial apply for closure #1 in NearbyIDSServiceController.sendRequestConnectionWithNearbyHost(fromHandle:nearbyAdvertisement:)( uint64_t *a1)
{
  return closure #1 in NearbyIDSServiceController.sendRequestConnectionWithNearbyHost(fromHandle:nearbyAdvertisement:)( a1,  *(id *)(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32));
}

void partial apply for closure #1 in NearbyIDSServiceController.sendJoinRequest(for:from:)(uint64_t *a1)
{
}

uint64_t partial apply for closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)(uint64_t a1)
{
  return closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t type metadata accessor for NearbyIDSServiceController()
{
  return objc_opt_self(&OBJC_CLASS____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController);
}

void specialized NearbyIDSServiceController.handleIncomingMessage(_:account:incomingData:fromIDWithToken:context:)( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v145 = a4;
  id v146 = a5;
  uint64_t v144 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoJoinResponse.Content?);
  __chkstk_darwin(v9, v10);
  uint64_t v111 = (char *)v109 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v110 = type metadata accessor for NearbyProtoJoinResponse.Content(0LL);
  v109[5] = *(void *)(v110 - 8);
  __chkstk_darwin(v110, v12);
  v109[3] = (char *)v109 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for NearbyProtoJoinResponse(0LL);
  __chkstk_darwin(v131, v14);
  char v16 = (char *)v109 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for NearbyProtoJoinRequest.Content(0LL);
  uint64_t v19 = __chkstk_darwin(v17, v18);
  unint64_t v115 = (char *)v109 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v19, v21);
  id v23 = (char *)v109 - v22;
  uint64_t v24 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v24, v25);
  uint64_t v112 = (char *)v109 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v130 = type metadata accessor for NearbyProtoJoinRequest(0LL);
  uint64_t v28 = __chkstk_darwin(v130, v27);
  unint64_t v132 = (char *)v109 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v28, v30);
  unint64_t v133 = (char *)v109 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content?);
  __chkstk_darwin(v32, v33);
  uint64_t v128 = (char *)v109 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v127 = type metadata accessor for NearbyProtoConnectionResponse.Content(0LL);
  uint64_t v120 = *(void *)(v127 - 8);
  __chkstk_darwin(v127, v35);
  uint64_t v113 = (char *)v109 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionRequest?);
  __chkstk_darwin(v37, v38);
  unint64_t v126 = (char *)v109 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v125 = type metadata accessor for NearbyProtoConnectionRequest(0LL);
  uint64_t v119 = *(void *)(v125 - 8);
  uint64_t v41 = __chkstk_darwin(v125, v40);
  v114 = (char *)v109 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = __chkstk_darwin(v41, v43);
  uint64_t v129 = (char *)v109 - v45;
  __chkstk_darwin(v44, v46);
  uint64_t v116 = (char *)v109 - v47;
  uint64_t v48 = type metadata accessor for BinaryDecodingOptions(0LL);
  uint64_t v50 = __chkstk_darwin(v48, v49);
  v109[4] = (char *)v109 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = __chkstk_darwin(v50, v52);
  uint64_t v124 = (char *)v109 - v54;
  uint64_t v56 = __chkstk_darwin(v53, v55);
  uint64_t v123 = (char *)v109 - v57;
  uint64_t v59 = __chkstk_darwin(v56, v58);
  unint64_t v122 = (char *)v109 - v60;
  uint64_t v62 = __chkstk_darwin(v59, v61);
  unint64_t v121 = (char *)v109 - v63;
  __chkstk_darwin(v62, v64);
  os_log_type_t v139 = (char *)v109 - v65;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoSessionMessage?);
  __chkstk_darwin(v66, v67);
  int v140 = (char *)v109 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v141 = type metadata accessor for NearbyProtoSessionMessage(0LL);
  uint64_t v138 = *(void *)(v141 - 8);
  uint64_t v70 = __chkstk_darwin(v141, v69);
  uint64_t v136 = (char *)v109 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v73 = __chkstk_darwin(v70, v72);
  uint64_t v135 = (char *)v109 - v74;
  __chkstk_darwin(v73, v75);
  uint64_t v77 = (char *)v109 - v76;
  uint64_t v78 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v79 = *(void *)(v78 - 8);
  __chkstk_darwin(v78, v80);
  unint64_t v82 = (void *)((char *)v109 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v83 = *(void **)(a6 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *unint64_t v82 = v83;
  (*(void (**)(void *, void, uint64_t))(v79 + 104))(v82, enum case for DispatchPredicate.onQueue(_:), v78);
  id v84 = v83;
  uint64_t v85 = _dispatchPreconditionTest(_:)(v82);
  (*(void (**)(void *, uint64_t))(v79 + 8))(v82, v78);
  if ((v85 & 1) != 0)
  {
    uint64_t v118 = a6;
    v109[2] = v23;
    uint64_t v85 = a1;
    if (one-time initialization token for host == -1) {
      goto LABEL_3;
    }
  }

  else
  {
    __break(1u);
  }

  swift_once(&one-time initialization token for host, one-time initialization function for host);
LABEL_3:
  uint64_t v86 = type metadata accessor for Logger(0LL);
  uint64_t v87 = __swift_project_value_buffer(v86, (uint64_t)static Log.host);
  id v88 = v146;
  uint64_t v89 = v145;
  swift_bridgeObjectRetain_n(v145, 2LL);
  id v90 = v88;
  uint64_t v91 = (os_log_s *)Logger.logObject.getter(v90);
  os_log_type_t v92 = static os_log_type_t.default.getter();
  BOOL v93 = os_log_type_enabled(v91, v92);
  uint64_t v117 = v16;
  if (v93)
  {
    uint64_t v134 = v77;
    uint64_t v143 = v85;
    unint64_t v137 = a2;
    uint64_t v94 = v89;
    uint64_t v95 = swift_slowAlloc(22LL, -1LL);
    unint64_t v96 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v97 = swift_slowAlloc(32LL, -1LL);
    uint64_t v149 = v97;
    *(_DWORD *)uint64_t v95 = 136315394;
    uint64_t v142 = v87;
    if (v94)
    {
      uint64_t v147 = v144;
      uint64_t v148 = v94;
      swift_bridgeObjectRetain(v94);
      uint64_t v98 = String.init<A>(reflecting:)(&v147, &type metadata for String);
      unint64_t v100 = v99;
    }

    else
    {
      uint64_t v98 = 7104878LL;
      unint64_t v100 = 0xE300000000000000LL;
    }

    uint64_t v147 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v98, v100, &v149);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v147, &v148, v95 + 4, v95 + 12);
    swift_bridgeObjectRelease_n(v94, 2LL);
    swift_bridgeObjectRelease(v100);
    *(_WORD *)(v95 + 12) = 2112;
    if (v146)
    {
      uint64_t v147 = (uint64_t)v90;
      id v102 = v90;
    }

    else
    {
      uint64_t v147 = 0LL;
    }

    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v147, &v148, v95 + 14, v95 + 22);
    *unint64_t v96 = v146;

    _os_log_impl( (void *)&_mh_execute_header,  v91,  v92,  "Handling incoming data from: %s context: %@",  (uint8_t *)v95,  0x16u);
    uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v96, 1LL, v103);
    swift_slowDealloc(v96, -1LL, -1LL);
    swift_arrayDestroy(v97, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v97, -1LL, -1LL);
    swift_slowDealloc(v95, -1LL, -1LL);

    a2 = v137;
    if (!v145) {
      goto LABEL_13;
    }
LABEL_7:
    NSString v101 = String._bridgeToObjectiveC()();
    goto LABEL_14;
  }

  swift_bridgeObjectRelease_n(v89, 2LL);
  if (v89) {
    goto LABEL_7;
  }
LABEL_13:
  NSString v101 = 0LL;
LABEL_14:
  uint64_t v104 = (void *)IDSCopyAddressDestinationForDestination(v101);

  uint64_t v105 = (void *)IDSCopyRawAddressForDestination(v104);
  if (v105)
  {
    uint64_t v106 = static String._unconditionallyBridgeFromObjectiveC(_:)(v105);
    uint64_t v108 = v107;

    if (String.count.getter(v106, v108) >= 1 && a2 >> 60 != 15) {
      __asm { BR              X10 }
    }

    swift_bridgeObjectRelease(v108);
  }

{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  id v90;
  os_log_s *v91;
  os_log_type_t v92;
  BOOL v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  NSString v101;
  id v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void v109[6];
  uint64_t v110;
  char *v111;
  char *v112;
  char *v113;
  char *v114;
  char *v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  char *v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  char *v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;
  char *v136;
  unint64_t v137;
  uint64_t v138;
  char *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v145 = a4;
  id v146 = a5;
  uint64_t v144 = a3;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoJoinResponse.Content?);
  __chkstk_darwin(v9, v10);
  uint64_t v111 = (char *)v109 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v110 = type metadata accessor for NearbyProtoJoinResponse.Content(0LL);
  v109[5] = *(void *)(v110 - 8);
  __chkstk_darwin(v110, v12);
  v109[3] = (char *)v109 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v131 = type metadata accessor for NearbyProtoJoinResponse(0LL);
  __chkstk_darwin(v131, v14);
  char v16 = (char *)v109 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v17 = type metadata accessor for NearbyProtoJoinRequest.Content(0LL);
  uint64_t v19 = __chkstk_darwin(v17, v18);
  unint64_t v115 = (char *)v109 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v19, v21);
  id v23 = (char *)v109 - v22;
  uint64_t v24 = type metadata accessor for String.Encoding(0LL);
  __chkstk_darwin(v24, v25);
  uint64_t v112 = (char *)v109 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v130 = type metadata accessor for NearbyProtoJoinRequest(0LL);
  uint64_t v28 = __chkstk_darwin(v130, v27);
  unint64_t v132 = (char *)v109 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  __chkstk_darwin(v28, v30);
  unint64_t v133 = (char *)v109 - v31;
  uint64_t v32 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content?);
  __chkstk_darwin(v32, v33);
  uint64_t v128 = (char *)v109 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v127 = type metadata accessor for NearbyProtoConnectionResponse.Content(0LL);
  uint64_t v120 = *(void *)(v127 - 8);
  __chkstk_darwin(v127, v35);
  uint64_t v113 = (char *)v109 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v37 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionRequest?);
  __chkstk_darwin(v37, v38);
  unint64_t v126 = (char *)v109 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v125 = type metadata accessor for NearbyProtoConnectionRequest(0LL);
  uint64_t v119 = *(void *)(v125 - 8);
  uint64_t v41 = __chkstk_darwin(v125, v40);
  v114 = (char *)v109 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v44 = __chkstk_darwin(v41, v43);
  uint64_t v129 = (char *)v109 - v45;
  __chkstk_darwin(v44, v46);
  uint64_t v116 = (char *)v109 - v47;
  uint64_t v48 = type metadata accessor for BinaryDecodingOptions(0LL);
  uint64_t v50 = __chkstk_darwin(v48, v49);
  v109[4] = (char *)v109 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v53 = __chkstk_darwin(v50, v52);
  uint64_t v124 = (char *)v109 - v54;
  uint64_t v56 = __chkstk_darwin(v53, v55);
  uint64_t v123 = (char *)v109 - v57;
  uint64_t v59 = __chkstk_darwin(v56, v58);
  unint64_t v122 = (char *)v109 - v60;
  uint64_t v62 = __chkstk_darwin(v59, v61);
  unint64_t v121 = (char *)v109 - v63;
  __chkstk_darwin(v62, v64);
  os_log_type_t v139 = (char *)v109 - v65;
  uint64_t v66 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoSessionMessage?);
  __chkstk_darwin(v66, v67);
  int v140 = (char *)v109 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v141 = type metadata accessor for NearbyProtoSessionMessage(0LL);
  uint64_t v138 = *(void *)(v141 - 8);
  uint64_t v70 = __chkstk_darwin(v141, v69);
  uint64_t v136 = (char *)v109 - ((v71 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v73 = __chkstk_darwin(v70, v72);
  uint64_t v135 = (char *)v109 - v74;
  __chkstk_darwin(v73, v75);
  uint64_t v77 = (char *)v109 - v76;
  uint64_t v78 = type metadata accessor for DispatchPredicate(0LL);
  uint64_t v79 = *(void *)(v78 - 8);
  __chkstk_darwin(v78, v80);
  unint64_t v82 = (void *)((char *)v109 - ((v81 + 15) & 0xFFFFFFFFFFFFFFF0LL));
  uint64_t v83 = *(void **)(a6 + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue);
  *unint64_t v82 = v83;
  (*(void (**)(void *, void, uint64_t))(v79 + 104))(v82, enum case for DispatchPredicate.onQueue(_:), v78);
  id v84 = v83;
  uint64_t v85 = _dispatchPreconditionTest(_:)(v82);
  (*(void (**)(void *, uint64_t))(v79 + 8))(v82, v78);
  if ((v85 & 1) != 0)
  {
    uint64_t v118 = a6;
    v109[2] = v23;
    uint64_t v85 = a1;
    if (one-time initialization token for host == -1) {
      goto LABEL_3;
    }
  }

  else
  {
    __break(1u);
  }

  swift_once(&one-time initialization token for host, one-time initialization function for host);
LABEL_3:
  uint64_t v86 = type metadata accessor for Logger(0LL);
  uint64_t v87 = __swift_project_value_buffer(v86, (uint64_t)static Log.host);
  id v88 = v146;
  uint64_t v89 = v145;
  swift_bridgeObjectRetain_n(v145, 2LL);
  id v90 = v88;
  uint64_t v91 = (os_log_s *)Logger.logObject.getter(v90);
  os_log_type_t v92 = static os_log_type_t.default.getter();
  BOOL v93 = os_log_type_enabled(v91, v92);
  uint64_t v117 = v16;
  if (v93)
  {
    uint64_t v134 = v77;
    uint64_t v143 = v85;
    unint64_t v137 = a2;
    uint64_t v94 = v89;
    uint64_t v95 = swift_slowAlloc(22LL, -1LL);
    unint64_t v96 = (void *)swift_slowAlloc(8LL, -1LL);
    uint64_t v97 = swift_slowAlloc(32LL, -1LL);
    uint64_t v149 = v97;
    *(_DWORD *)uint64_t v95 = 136315394;
    uint64_t v142 = v87;
    if (v94)
    {
      uint64_t v147 = v144;
      uint64_t v148 = v94;
      swift_bridgeObjectRetain(v94);
      uint64_t v98 = String.init<A>(reflecting:)(&v147, &type metadata for String);
      unint64_t v100 = v99;
    }

    else
    {
      uint64_t v98 = 7104878LL;
      unint64_t v100 = 0xE300000000000000LL;
    }

    uint64_t v147 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v98, v100, &v149);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v147, &v148, v95 + 4, v95 + 12);
    swift_bridgeObjectRelease_n(v94, 2LL);
    swift_bridgeObjectRelease(v100);
    *(_WORD *)(v95 + 12) = 2112;
    if (v146)
    {
      uint64_t v147 = (uint64_t)v90;
      id v102 = v90;
    }

    else
    {
      uint64_t v147 = 0LL;
    }

    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v147, &v148, v95 + 14, v95 + 22);
    *unint64_t v96 = v146;

    _os_log_impl( (void *)&_mh_execute_header,  v91,  v92,  "Handling incoming data from: %s context: %@",  (uint8_t *)v95,  0x16u);
    uint64_t v103 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy(v96, 1LL, v103);
    swift_slowDealloc(v96, -1LL, -1LL);
    swift_arrayDestroy(v97, 1LL, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v97, -1LL, -1LL);
    swift_slowDealloc(v95, -1LL, -1LL);

    a2 = v137;
    if (!v145) {
      goto LABEL_13;
    }
LABEL_7:
    NSString v101 = String._bridgeToObjectiveC()();
    goto LABEL_14;
  }

  swift_bridgeObjectRelease_n(v89, 2LL);
  if (v89) {
    goto LABEL_7;
  }
LABEL_13:
  NSString v101 = 0LL;
LABEL_14:
  uint64_t v104 = (void *)IDSCopyAddressDestinationForDestination(v101);

  uint64_t v105 = (void *)IDSCopyRawAddressForDestination(v104);
  if (v105)
  {
    uint64_t v106 = static String._unconditionallyBridgeFromObjectiveC(_:)(v105);
    uint64_t v108 = v107;

    if (String.count.getter(v106, v108) >= 1 && a2 >> 60 != 15) {
      __asm { BR              X10 }
    }

    swift_bridgeObjectRelease(v108);
  }

uint64_t sub_1000A8B64@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x80LL))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1000A8BA4(void *a1, void **a2)
{
  uint64_t v2 = a1[1];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & **a2) + 0x88LL);
  uint64_t v4 = swift_unknownObjectRetain(*a1);
  return v3(v4, v2);
}

uint64_t sub_1000A8BF4@<X0>(void **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))((swift_isaMask & **a1) + 0x98LL))();
  *a2 = result;
  return result;
}

uint64_t sub_1000A8C34(void *a1, void **a2)
{
  uint64_t v2 = *(uint64_t (**)(uint64_t))((swift_isaMask & **a2) + 0xA0LL);
  uint64_t v3 = swift_bridgeObjectRetain(*a1);
  return v2(v3);
}

uint64_t storeEnumTagSinglePayload for IDSServiceError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1000A8CB4 + 4 * byte_1000AEFE0[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_1000A8CD4 + 4 * byte_1000AEFE5[v4]))();
  }
}

_BYTE *sub_1000A8CB4(_BYTE *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

_BYTE *sub_1000A8CD4(_BYTE *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1000A8CDC(_DWORD *result, int a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1000A8CE4(_WORD *result, __int16 a2)
{
  *uint64_t result = a2;
  return result;
}

_WORD *sub_1000A8CEC(_WORD *result)
{
  *uint64_t result = 0;
  return result;
}

_DWORD *sub_1000A8CF4(_DWORD *result)
{
  *uint64_t result = 0;
  return result;
}

ValueMetadata *type metadata accessor for IDSServiceError()
{
  return &type metadata for IDSServiceError;
}

uint64_t storeEnumTagSinglePayload for NearbyIDSServiceController.Errors( _BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000A8D5C + 4 * byte_1000AEFEF[v4]))();
  }
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1000A8D90 + 4 * byte_1000AEFEA[v4]))();
}

uint64_t sub_1000A8D90(uint64_t result)
{
  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000A8D98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2) {
    JUMPOUT(0x1000A8DA0LL);
  }
  return result;
}

uint64_t sub_1000A8DAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2) {
    JUMPOUT(0x1000A8DB4LL);
  }
  *(_BYTE *)uint64_t result = a2 + 2;
  return result;
}

uint64_t sub_1000A8DB8(uint64_t result)
{
  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000A8DC0(uint64_t result)
{
  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NearbyIDSServiceController.Errors()
{
  return &type metadata for NearbyIDSServiceController.Errors;
}

uint64_t partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)( uint64_t a1)
{
  return closure #1 in closure #2 in NearbyIDSServiceController.sendJoinRequest(for:from:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24),  *(void *)(v1 + 32),  *(void *)(v1 + 40));
}

uint64_t partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)( uint64_t a1)
{
  return closure #1 in closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( a1,  *(void *)(v1 + 16),  *(void *)(v1 + 24));
}

uint64_t partial apply for closure #1 in closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( uint64_t *a1)
{
  return closure #1 in closure #1 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)(a1);
}

uint64_t outlined init with copy of NearbyProtoConnectionResponse.Content.OneOf_Operation?( uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NearbyProtoConnectionResponse.Content.OneOf_Operation?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16LL))(a2, a1, v4);
  return a2;
}

uint64_t partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendAcceptedJoinRequestResponse(pendingMember:response:)( uint64_t a1)
{
  return partial apply for closure #1 in closure #2 in NearbyIDSServiceController.sendRejectedRequestResponse(pendingMember:)(a1);
}