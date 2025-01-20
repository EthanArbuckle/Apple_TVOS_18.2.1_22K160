@interface __SwiftNativeNSArrayWithContiguousStorage
- (id)objectAtIndex:(int64_t)a3;
- (id)objectAtIndexedSubscript:(int64_t)a3;
- (int64_t)count;
- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5;
- (void)getObjects:(id *)a3 range:(id)a4;
@end

@implementation __SwiftNativeNSArrayWithContiguousStorage

- (int64_t)count
{
  Class isa = self->super.super.super.isa[11].isa;
  swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
  ((void (*)(int64_t *__return_ptr, void (*)(uint64_t@<X1>, void *@<X8>), void, ValueMetadata *))isa)( &v7,  closure #1 in __SwiftNativeNSArrayWithContiguousStorage.count.getter,  0LL,  &type metadata for Int);
  swift_release((uint64_t)self);
  return v7;
}

- (id)objectAtIndexedSubscript:(int64_t)a3
{
  return (id)@objc __SwiftNativeNSArrayWithContiguousStorage.objectAtSubscript(_:)( (uint64_t)self,  (uint64_t)a2,  a3,  (uint64_t)closure #1 in __SwiftNativeNSArrayWithContiguousStorage._objectAt(_:)partial apply);
}

- (id)objectAtIndex:(int64_t)a3
{
  return (id)@objc __SwiftNativeNSArrayWithContiguousStorage.objectAtSubscript(_:)( (uint64_t)self,  (uint64_t)a2,  a3,  (uint64_t)partial apply for closure #1 in __SwiftNativeNSArrayWithContiguousStorage._objectAt(_:));
}

- (void)getObjects:(id *)a3 range:(id)a4
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v7 = a4;
  v8 = a3;
  Class isa = self->super.super.super.isa[11].isa;
  swift_retain((unint64_t *)self, (uint64_t)a2, (uint64_t)a3, (char *)a4.var0);
  ((void (*)(char *(*)(char *, uint64_t), uint64_t *, void *))isa)( partial apply for closure #1 in __SwiftNativeNSArrayWithContiguousStorage.getObjects(_:range:),  &v6,  &unk_189B8D178);
  swift_release((uint64_t)self);
}

- (int64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(int64_t)a5
{
  int64_t result = 0LL;
  __int128 v7 = *(_OWORD *)&a3->var2;
  v15[0] = *(_OWORD *)&a3->var0;
  v15[1] = v7;
  __int128 v8 = *(_OWORD *)&a3->var3[3];
  v15[2] = *(_OWORD *)&a3->var3[1];
  v15[3] = v8;
  if (!*(void *)&v15[0])
  {
    MEMORY[0x1895F8858](0LL);
    v13[2] = v15;
    v13[3] = v9;
    Class isa = self->super.super.super.isa[11].isa;
    swift_retain((unint64_t *)self, v11, v9, v12);
    ((void (*)(int64_t *__return_ptr, __n128 (*)@<Q0>(uint64_t@<X0>, uint64_t@<X1>, void *@<X8>), void *, ValueMetadata *))isa)( &v14,  partial apply for closure #1 in __SwiftNativeNSArrayWithContiguousStorage.countByEnumerating(with:objects:count:),  v13,  &type metadata for Int);
    swift_release((uint64_t)self);
    return v14;
  }

  return result;
}

@end