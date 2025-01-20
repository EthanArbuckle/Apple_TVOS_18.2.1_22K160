uint64_t static Placeholder.__derived_enum_equals(_:_:)()
{
  return 1LL;
}

void Placeholder.hash(into:)()
{
}

Swift::Int Placeholder.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance Placeholder(uint64_t a1)
{
  return Hasher._finalize()();
}

unint64_t lazy protocol witness table accessor for type Placeholder and conformance Placeholder()
{
  unint64_t result = lazy protocol witness table cache variable for type Placeholder and conformance Placeholder;
  if (!lazy protocol witness table cache variable for type Placeholder and conformance Placeholder)
  {
    unint64_t result = swift_getWitnessTable(&protocol conformance descriptor for Placeholder, &type metadata for Placeholder);
    atomic_store( result,  (unint64_t *)&lazy protocol witness table cache variable for type Placeholder and conformance Placeholder);
  }

  return result;
}

uint64_t getEnumTagSinglePayload for Placeholder(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Placeholder(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_3DA8 + 4 * byte_3E78[v4]))();
  }
  else {
    return ((uint64_t (*)(void))((char *)sub_3DC8 + 4 * byte_3E7D[v4]))();
  }
}

_BYTE *sub_3DA8(_BYTE *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

_BYTE *sub_3DC8(_BYTE *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_3DD0(_DWORD *result, int a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_3DD8(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

_WORD *sub_3DE0(_WORD *result)
{
  *unint64_t result = 0;
  return result;
}

_DWORD *sub_3DE8(_DWORD *result)
{
  *unint64_t result = 0;
  return result;
}

uint64_t getEnumTag for Placeholder()
{
  return 0LL;
}

ValueMetadata *type metadata accessor for Placeholder()
{
  return &type metadata for Placeholder;
}