uint64_t OSLogStore.PrivateIterator.next()(void *a1)
{
  uint64_t v2;
  _OWORD v3[2];
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  if (objc_msgSend(a1, sel_nextObject))
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }

  else
  {
    memset(v3, 0, sizeof(v3));
  }

  outlined init with take of Any?((uint64_t)v3, (uint64_t)&v4);
  if (v5)
  {
    outlined init with take of Any(&v4, &v6);
    type metadata accessor for OSLogEntry();
    swift_dynamicCast();
    return v2;
  }

  else
  {
    outlined destroy of Any?((uint64_t)&v4);
    return 0LL;
  }
}

uint64_t protocol witness for IteratorProtocol.next() in conformance OSLogStore.PrivateIterator@<X0>( uint64_t *a1@<X8>)
{
  uint64_t result = OSLogStore.PrivateIterator.next()(*v1);
  *a1 = result;
  return result;
}

void *OSLogStore.getEntries(with:at:matching:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v11[1] = *(id *)MEMORY[0x1895F89C0];
  v11[0] = 0LL;
  id v4 = objc_msgSend(v3, sel_entriesEnumeratorWithOptions_position_predicate_error_, a1, a2, a3, v11);
  id v5 = v11[0];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SequenceBox<_ClosureBasedSequence<OSLogStore.PrivateIterator>>);
    v8 = (void *)swift_allocObject();
    v8[2] = partial apply for closure #1 in OSLogStore.getEntries(with:at:matching:);
    v8[3] = v7;
    id v9 = v5;
  }

  else
  {
    v8 = v11[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }

  return v8;
}

uint64_t sub_1869F4588()
{
  return swift_deallocObject();
}

id partial apply for closure #1 in OSLogStore.getEntries(with:at:matching:)@<X0>(void *a1@<X8>)
{
  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = MEMORY[0x186E40A84]((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void OSLogMessageComponent.argument.getter(uint64_t a1@<X8>)
{
  switch((unint64_t)objc_msgSend(v1, sel_argumentCategory))
  {
    case 1uLL:
      id v3 = objc_msgSend(v1, sel_argumentDataValue);
      if (!v3)
      {
        __break(1u);
LABEL_12:
        __break(1u);
        JUMPOUT(0x1869F4734LL);
      }

      id v4 = v3;
      uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v7 = v6;

      *(void *)a1 = v5;
      *(void *)(a1 + 8) = v7;
      *(_BYTE *)(a1 + 16) = 0;
      break;
    case 2uLL:
      objc_msgSend(v1, sel_argumentDoubleValue);
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = 0LL;
      char v8 = 1;
      goto LABEL_10;
    case 3uLL:
      *(void *)a1 = objc_msgSend(v1, sel_argumentInt64Value);
      *(void *)(a1 + 8) = 0LL;
      char v8 = 2;
      goto LABEL_10;
    case 4uLL:
      id v9 = objc_msgSend(v1, sel_argumentStringValue);
      if (!v9) {
        goto LABEL_12;
      }
      v10 = v9;
      uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v13 = v12;

      *(void *)a1 = v11;
      *(void *)(a1 + 8) = v13;
      char v8 = 3;
LABEL_10:
      *(_BYTE *)(a1 + 16) = v8;
      break;
    case 5uLL:
      *(void *)a1 = objc_msgSend(v1, sel_argumentUInt64Value);
      *(void *)(a1 + 8) = 0LL;
      char v8 = 4;
      goto LABEL_10;
    default:
      *(void *)a1 = 0LL;
      *(void *)(a1 + 8) = 0LL;
      char v8 = 5;
      goto LABEL_10;
  }

uint64_t outlined copy of OSLogMessageComponent.Argument(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3) {
    return swift_bridgeObjectRetain();
  }
  if (!a3) {
    return outlined copy of Data._Representation(result, a2);
  }
  return result;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t destroy for OSLogMessageComponent.Argument(uint64_t a1)
{
  return outlined consume of OSLogMessageComponent.Argument(*(void *)a1, *(void *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t outlined consume of OSLogMessageComponent.Argument(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 3) {
    return swift_bridgeObjectRelease();
  }
  if (!a3) {
    return outlined consume of Data._Representation(result, a2);
  }
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t initializeBufferWithCopyOfBuffer for OSLogMessageComponent.Argument(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  outlined copy of OSLogMessageComponent.Argument(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for OSLogMessageComponent.Argument(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  unint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(_BYTE *)(a2 + 16);
  outlined copy of OSLogMessageComponent.Argument(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  char v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  outlined consume of OSLogMessageComponent.Argument(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for OSLogMessageComponent.Argument(uint64_t a1, uint64_t a2)
{
  char v3 = *(_BYTE *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  char v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of OSLogMessageComponent.Argument(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for OSLogMessageComponent.Argument(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 251);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 5) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for OSLogMessageComponent.Argument( uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 251;
    *(void *)(result + 8) = 0LL;
    if (a3 >= 0xFB) {
      *(_BYTE *)(result + 17) = 1;
    }
  }

  else
  {
    if (a3 >= 0xFB) {
      *(_BYTE *)(result + 17) = 0;
    }
    if (a2) {
      *(_BYTE *)(result + 16) = -(char)a2;
    }
  }

  return result;
}

uint64_t getEnumTag for OSLogMessageComponent.Argument(uint64_t a1)
{
  else {
    return (*(_DWORD *)a1 + 5);
  }
}

uint64_t destructiveInjectEnumTag for OSLogMessageComponent.Argument(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(void *)__n128 result = a2 - 5;
    *(void *)(result + 8) = 0LL;
    LOBYTE(a2) = 5;
  }

  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for OSLogMessageComponent.Argument()
{
  return &type metadata for OSLogMessageComponent.Argument;
}

void *type metadata accessor for OSLogStore.PrivateIterator()
{
  return &unk_189F1D730;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32LL))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8LL))(a1, v2);
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t type metadata accessor for OSLogEntry()
{
  unint64_t result = lazy cache variable for type metadata for OSLogEntry;
  if (!lazy cache variable for type metadata for OSLogEntry)
  {
    objc_opt_self();
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OSLogEntry);
  }

  return result;
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x189606940]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x189606CA0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x189607100]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x189618EE0]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616718](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x18961B2B8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x18961B310]();
}

uint64_t swift_release()
{
  return MEMORY[0x18961B3C8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}