@interface A:
- (Swift::Int)B;
- (_UNKNOWN)B;
- (double)B;
- (id)B;
- (uint64_t)B;
- (unint64_t)B;
- (void)B;
@end

@implementation A:

- (uint64_t)B
{
  uint64_t v5 = *(void *)(*(void *)a3 + 8LL);
  uint64_t result = swift_getWitnessTable(&protocol conformance descriptor for <> [A : B], a2, &v5);
  *(void *)(a1 + 8) = result;
  return result;
}

- (double)B
{
  uint64_t v3 = *v1;
  if ((v3 & 0xC000000000000001LL) != 0)
  {
    v4 = (void *)specialized _ArrayBuffer._nonNative.getter(v3);
    swift_unknownObjectRetain(v4, v5, v6, v7);
    swift_bridgeObjectRelease(v3);
    uint64_t v8 = type metadata accessor for __CocoaDictionary.Iterator();
    v9 = swift_allocObject(v8, 0xE8uLL, 7uLL);
    *((_OWORD *)v9 + 1) = 0u;
    *((_OWORD *)v9 + 2) = 0u;
    *((_OWORD *)v9 + 3) = 0u;
    *((_OWORD *)v9 + 4) = 0u;
    *((_OWORD *)v9 + 5) = 0u;
    *((_OWORD *)v9 + 6) = 0u;
    *((_OWORD *)v9 + 7) = 0u;
    *((_OWORD *)v9 + 8) = 0u;
    *((_OWORD *)v9 + 9) = 0u;
    *((_OWORD *)v9 + 10) = 0u;
    *((_OWORD *)v9 + 11) = 0u;
    *((_OWORD *)v9 + 12) = 0u;
    v9[27] = 0LL;
    v9[28] = 0LL;
    v9[26] = v4;
    Dictionary.Iterator.init(_cocoa:)((uint64_t)v9, (uint64_t)v14);
  }

  else
  {
    _NativeDictionary.makeIterator()(v3, v13);
    Dictionary.Iterator.init(_native:)((uint64_t)v13, (uint64_t)v14);
  }

  uint64_t v10 = v15;
  double result = *(double *)v14;
  __int128 v12 = v14[1];
  *(_OWORD *)a1 = v14[0];
  *(_OWORD *)(a1 + 16) = v12;
  *(void *)(a1 + 32) = v10;
  return result;
}

- (unint64_t)B
{
  return swift_retain((unint64_t *)(a1 & 0x7FFFFFFFFFFFFFFFLL), a2, a3, a4);
}

- (id)B
{
  return Dictionary.Keys.count.getter(*v0);
}

- (void)B
{
  return a1;
}

- (Swift::Int)B
{
  v3[0] = 0LL;
  v3[1] = _swift_stdlib_Hashing_parameters ^ a1 ^ 0x736F6D6570736575LL;
  v3[2] = *(void *)algn_18C487058 ^ 0x646F72616E646F6DLL;
  v3[3] = _swift_stdlib_Hashing_parameters ^ a1 ^ 0x6C7967656E657261LL;
  v3[4] = *(void *)algn_18C487058 ^ 0x7465646279746573LL;
  __int128 v4 = 0u;
  __int128 v5 = 0u;
  Dictionary.Index.hash(into:)((uint64_t)v3, *(void *)v1, *(void *)(v1 + 8), *(_BYTE *)(v1 + 16));
  return Hasher._finalize()();
}

- (_UNKNOWN)B
{
  return &protocol witness table for [A : B].Index;
}

@end