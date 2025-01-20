@interface _SwiftNSMutableArray
- (id)copyWithZone:(void *)a3;
- (int64_t)count;
- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5;
- (int64_t)indexOfObjectIdenticalTo:(id)a3;
- (void)addObject:(id)a3;
- (void)exchangeObjectAtIndex:(int64_t)a3 withObjectAtIndex:(int64_t)a4;
- (void)getObjects:(id *)a3 range:(id)a4;
- (void)insertObject:(id)a3 atIndex:(int64_t)a4;
- (void)insertObjects:(const void *)a3 count:(int64_t)a4 atIndex:(int64_t)a5;
- (void)removeAllObjects;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(int64_t)a3;
- (void)removeObjectsInRange:(id)a3;
- (void)replaceObjectAtIndex:(int64_t)a3 withObject:(id)a4;
- (void)replaceObjectsInRange:(id)a3 withObjects:(const void *)a4 count:(int64_t)a5;
@end

@implementation _SwiftNSMutableArray

- (int64_t)count
{
  uint64_t v2 = *(void *)self->contents;
  if (v2 < 0) {
    v4 = *(void **)self->contents;
  }
  else {
    v4 = (void *)(v2 & 0xFFFFFFFFFFFFFF8LL);
  }
  return (int64_t)objc_msgSend(v4, sel_count);
}

- (void)getObjects:(id *)a3 range:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  swift_retain((unint64_t *)self, (uint64_t)a2, (uint64_t)a3, (char *)a4.var0);
  _SwiftNSMutableArray.getObjects(_:range:)(a3, var0, var1, v8);
  swift_release((uint64_t)self);
}

- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5
{
  v10 = specialized _SwiftNSMutableArray.countByEnumerating(with:objects:count:)(a3, v7, v8, v9);
  swift_release((uint64_t)self);
  return (int64_t)v10;
}

- (id)copyWithZone:(void *)a3
{
  v5 = swift_retain((unint64_t *)self, (uint64_t)a2, (uint64_t)a3, v3);
  v9 = specialized _SwiftNSMutableArray.copy(with:)((uint64_t)v5, v6, v7, v8);
  swift_release((uint64_t)self);
  return v9;
}

- (void)insertObject:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v7 = *(void *)self->contents;
  swift_unknownObjectRetain(a3, (uint64_t)a2, (uint64_t)a3, (char *)a4);
  swift_retain((unint64_t *)self, v8, v9, v10);
  specialized Array._checkIndex(_:)(a4, v7);
  swift_unknownObjectRetain(a3, v11, v12, v13);
  specialized Array.replaceSubrange<A>(_:with:)(a4, a4, (uint64_t)a3);
  swift_release((uint64_t)self);
  swift_unknownObjectRelease(a3);
}

- (void)removeObjectAtIndex:(int64_t)a3
{
  v3 = (void *)specialized Array.remove(at:)(a3);
  swift_unknownObjectRelease(v3);
}

- (void)addObject:(id)a3
{
  contents = self->contents;
  swift_unknownObjectRetain(a3, (uint64_t)a2, (uint64_t)a3, v3);
  swift_retain((unint64_t *)self, v7, v8, v9);
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  uint64_t v10 = *(void *)self->contents;
  uint64_t v11 = v10 & 0xFFFFFFFFFFFFFF8LL;
  unint64_t v13 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8LL) + 0x10);
  unint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8LL) + 0x18);
  if (v13 >= v12 >> 1)
  {
    uint64_t v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)( v12 > 1,  v13 + 1,  1,  v10);
    *(void *)contents = v14;
    uint64_t v11 = v14 & 0xFFFFFFFFFFFFFF8LL;
  }

  *(void *)(v11 + 16) = v13 + 1;
  *(void *)(v11 + 8 * v13 + 32) = a3;
  swift_release((uint64_t)self);
}

- (void)removeLastObject
{
  uint64_t v5 = *(void *)self->contents;
  if ((unint64_t)v5 >> 62)
  {
    if (v5 < 0) {
      uint64_t v7 = *(void **)self->contents;
    }
    else {
      uint64_t v7 = (void *)(v5 & 0xFFFFFFFFFFFFFF8LL);
    }
    swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
    if (!objc_msgSend(v7, sel_count)) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  if (*(void *)((v5 & 0xFFFFFFFFFFFFF8LL) + 0x10))
  {
    swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
LABEL_4:
    uint64_t v6 = (void *)specialized RangeReplaceableCollection<>.removeLast()();
    swift_unknownObjectRelease(v6);
LABEL_5:
    swift_release((uint64_t)self);
  }

- (void)replaceObjectAtIndex:(int64_t)a3 withObject:(id)a4
{
  uint64_t v7 = *(void *)self->contents;
  swift_unknownObjectRetain(a4, (uint64_t)a2, a3, (char *)a4);
  swift_retain((unint64_t *)self, v8, v9, v10);
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(v7);
  *(void *)self->contents = v7;
  if (!isUniquelyReferenced_nonNull_bridgeObject || v7 < 0 || (v7 & 0x4000000000000000LL) != 0)
  {
    uint64_t v7 = specialized _ArrayBuffer._consumeAndCreateNew()(v7);
    *(void *)self->contents = v7;
  }

  specialized Array._checkSubscript_mutating(_:)(a3, v7);
  unint64_t v12 = *(void **)((*(void *)self->contents & 0xFFFFFFFFFFFFFF8LL) + 8 * a3 + 0x20);
  *(void *)((*(void *)self->contents & 0xFFFFFFFFFFFFFF8LL) + 8 * a3 + 0x20) = a4;
  swift_unknownObjectRelease(v12);
  swift_release((uint64_t)self);
}

- (void)exchangeObjectAtIndex:(int64_t)a3 withObjectAtIndex:(int64_t)a4
{
}

- (void)replaceObjectsInRange:(id)a3 withObjects:(const void *)a4 count:(int64_t)a5
{
  int64_t var1 = a3.var1;
  int64_t var0 = (char *)a3.var0;
  swift_retain((unint64_t *)self, (uint64_t)a2, a3.var0, (char *)a3.var1);
  _SwiftNSMutableArray.replaceObjects(in:with:count:)(var0, var1, (char *)a4, a5);
  swift_release((uint64_t)self);
}

- (void)insertObjects:(const void *)a3 count:(int64_t)a4 atIndex:(int64_t)a5
{
  if (a4 < 0) {
    _fatalErrorMessage(_:_:file:line:flags:)( (unint64_t)"Fatal error",  11LL,  2,  "UnsafeBufferPointer with negative count",  39LL,  2,  "Swift/UnsafeBufferPointer.swift",  31LL,  2,  0x53FuLL,  0);
  }
  specialized Array.replaceSubrange<A>(_:with:)(a5, a5, (char *)a3, a4);
}

- (int64_t)indexOfObjectIdenticalTo:(id)a3
{
  return @objc _SwiftNSMutableArray.index(ofObjectIdenticalTo:)( (unint64_t *)self,  (uint64_t)a2,  a3,  (char *)_SwiftNSMutableArray.index(ofObjectIdenticalTo:));
}

- (void)removeObjectsInRange:(id)a3
{
  int64_t v3 = a3.var0 + a3.var1;
  if (__OFADD__(a3.var0, a3.var1))
  {
    __break(1u);
LABEL_5:
    _assertionFailure(_:_:file:line:flags:)( (unint64_t)"Fatal error",  11LL,  2,  "Range requires lowerBound <= upperBound",  39LL,  2,  "Swift/Range.swift",  17LL,  2,  0x2F2uLL,  0);
  }

  if (v3 < a3.var0) {
    goto LABEL_5;
  }
  specialized Array.replaceSubrange<A>(_:with:)((char *)a3.var0, v3, (uint64_t)&_swiftEmptyArrayStorage);
}

- (void)removeAllObjects
{
  uint64_t v5 = specialized static Array._allocateUninitialized(_:)(0LL);
  uint64_t v6 = *(void *)self->contents;
  *(void *)self->contents = v5;
  swift_bridgeObjectRelease(v6);
  swift_release((uint64_t)self);
}

@end