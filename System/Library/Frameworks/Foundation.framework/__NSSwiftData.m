@interface __NSSwiftData
- (BOOL)_isCompact;
- (BOOL)_providesConcreteBacking;
- (_TtC10Foundation13__NSSwiftData)init;
- (_TtC10Foundation13__NSSwiftData)initWithBase64EncodedData:(id)a3 options:(unint64_t)a4;
- (_TtC10Foundation13__NSSwiftData)initWithBase64EncodedString:(id)a3 options:(unint64_t)a4;
- (_TtC10Foundation13__NSSwiftData)initWithBase64Encoding:(id)a3;
- (_TtC10Foundation13__NSSwiftData)initWithBytes:(void *)a3 length:(int64_t)a4;
- (_TtC10Foundation13__NSSwiftData)initWithBytesNoCopy:(void *)a3 length:(int64_t)a4;
- (_TtC10Foundation13__NSSwiftData)initWithBytesNoCopy:(void *)a3 length:(int64_t)a4 deallocator:(id)a5;
- (_TtC10Foundation13__NSSwiftData)initWithBytesNoCopy:(void *)a3 length:(int64_t)a4 freeWhenDone:(BOOL)a5;
- (_TtC10Foundation13__NSSwiftData)initWithCoder:(id)a3;
- (_TtC10Foundation13__NSSwiftData)initWithContentsOfFile:(id)a3;
- (_TtC10Foundation13__NSSwiftData)initWithContentsOfFile:(id)a3 error:(id *)a4;
- (_TtC10Foundation13__NSSwiftData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (_TtC10Foundation13__NSSwiftData)initWithContentsOfMappedFile:(id)a3;
- (_TtC10Foundation13__NSSwiftData)initWithContentsOfMappedFile:(id)a3 error:(id *)a4;
- (_TtC10Foundation13__NSSwiftData)initWithContentsOfURL:(id)a3;
- (_TtC10Foundation13__NSSwiftData)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (_TtC10Foundation13__NSSwiftData)initWithData:(id)a3;
- (id)mutableCopyWithZone:(void *)a3;
- (int64_t)length;
- (void)bytes;
@end

@implementation __NSSwiftData

- (int64_t)length
{
  if ((*(_BYTE *)(self + OBJC_IVAR____TtC10Foundation13__NSSwiftData__range + 16) & 1) != 0) {
    goto LABEL_5;
  }
  uint64_t v2 = *(void *)(self + OBJC_IVAR____TtC10Foundation13__NSSwiftData__range);
  uint64_t v3 = *(void *)(self + OBJC_IVAR____TtC10Foundation13__NSSwiftData__range + 8);
  self = v3 - v2;
  if (__OFSUB__(v3, v2))
  {
    __break(1u);
LABEL_5:
    __break(1u);
  }

  return self;
}

- (void)bytes
{
  return (void *)__NSSwiftData.bytes.getter();
}

- (id)mutableCopyWithZone:(void *)a3
{
  uint64_t v3 = self;
  id v4 = -[__NSSwiftData bytes](v3, sel_bytes);
  id v5 = -[__NSSwiftData length](v3, sel_length);
  id v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x189603FB8]), sel_initWithBytes_length_, v4, v5);

  return v6;
}

- (BOOL)_isCompact
{
  return 1;
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

- (_TtC10Foundation13__NSSwiftData)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10Foundation13__NSSwiftData__backing) = 0LL;
  uint64_t v2 = (char *)self + OBJC_IVAR____TtC10Foundation13__NSSwiftData__range;
  *(void *)uint64_t v2 = 0LL;
  *((void *)v2 + 1) = 0LL;
  v2[16] = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for __NSSwiftData();
  return -[__NSSwiftData init](&v4, sel_init);
}

- (_TtC10Foundation13__NSSwiftData)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10Foundation13__NSSwiftData__backing) = 0LL;
  objc_super v4 = (char *)self + OBJC_IVAR____TtC10Foundation13__NSSwiftData__range;
  *(void *)objc_super v4 = 0LL;
  *((void *)v4 + 1) = 0LL;
  v4[16] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for __NSSwiftData();
  return -[NSData initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (_TtC10Foundation13__NSSwiftData)initWithContentsOfMappedFile:(id)a3
{
  return (_TtC10Foundation13__NSSwiftData *)@objc __NSSwiftData.init(contentsOfMappedFile:)( (uint64_t)self,  (uint64_t)a2,  a3,  (SEL *)&selRef_initWithContentsOfMappedFile_);
}

- (_TtC10Foundation13__NSSwiftData)initWithBase64Encoding:(id)a3
{
  return (_TtC10Foundation13__NSSwiftData *)@objc __NSSwiftData.init(contentsOfMappedFile:)( (uint64_t)self,  (uint64_t)a2,  a3,  (SEL *)&selRef_initWithBase64Encoding_);
}

- (_TtC10Foundation13__NSSwiftData)initWithBase64EncodedString:(id)a3 options:(unint64_t)a4
{
  id v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC10Foundation13__NSSwiftData *)__NSSwiftData.init(base64Encoded:options:)((uint64_t)v5, v6, a4);
}

- (_TtC10Foundation13__NSSwiftData)initWithBase64EncodedData:(id)a3 options:(unint64_t)a4
{
  id v4 = a3;
  id v5 = specialized Data.init(referencing:)(v4);
  uint64_t v7 = v6;

  __NSSwiftData.init(base64Encoded:options:)((uint64_t)v5, v7);
  return result;
}

- (_TtC10Foundation13__NSSwiftData)initWithBytes:(void *)a3 length:(int64_t)a4
{
  return (_TtC10Foundation13__NSSwiftData *)@objc __NSSwiftData.init(bytes:length:)( (char *)self,  (uint64_t)a2,  (uint64_t)a3,  a4,  (SEL *)&selRef_initWithBytes_length_);
}

- (_TtC10Foundation13__NSSwiftData)initWithBytesNoCopy:(void *)a3 length:(int64_t)a4
{
  return (_TtC10Foundation13__NSSwiftData *)@objc __NSSwiftData.init(bytes:length:)( (char *)self,  (uint64_t)a2,  (uint64_t)a3,  a4,  (SEL *)&selRef_initWithBytesNoCopy_length_);
}

- (_TtC10Foundation13__NSSwiftData)initWithBytesNoCopy:(void *)a3 length:(int64_t)a4 freeWhenDone:(BOOL)a5
{
  BOOL v5 = a5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10Foundation13__NSSwiftData__backing) = 0LL;
  v8 = (char *)self + OBJC_IVAR____TtC10Foundation13__NSSwiftData__range;
  *(void *)v8 = 0LL;
  *((void *)v8 + 1) = 0LL;
  v8[16] = 1;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for __NSSwiftData();
  return -[NSData initWithBytesNoCopy:length:freeWhenDone:]( &v10,  sel_initWithBytesNoCopy_length_freeWhenDone_,  a3,  a4,  v5);
}

- (_TtC10Foundation13__NSSwiftData)initWithBytesNoCopy:(void *)a3 length:(int64_t)a4 deallocator:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = v7;
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    objc_super v10 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned UnsafeMutableRawPointer, @unowned Int) -> ();
  }

  else
  {
    objc_super v10 = 0LL;
    uint64_t v9 = 0LL;
  }

  return (_TtC10Foundation13__NSSwiftData *)__NSSwiftData.init(bytesNoCopy:length:deallocator:)( (uint64_t)a3,  a4,  (uint64_t)v10,  v9);
}

- (_TtC10Foundation13__NSSwiftData)initWithContentsOfFile:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  return (_TtC10Foundation13__NSSwiftData *)__NSSwiftData.init(contentsOfFile:options:)((uint64_t)v6, v7, a4);
}

- (_TtC10Foundation13__NSSwiftData)initWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return (_TtC10Foundation13__NSSwiftData *)__NSSwiftData.init(contentsOf:options:)(&v7, a4);
}

- (_TtC10Foundation13__NSSwiftData)initWithContentsOfFile:(id)a3
{
  return (_TtC10Foundation13__NSSwiftData *)@objc __NSSwiftData.init(contentsOfMappedFile:)( (uint64_t)self,  (uint64_t)a2,  a3,  (SEL *)&selRef_initWithContentsOfFile_);
}

- (_TtC10Foundation13__NSSwiftData)initWithContentsOfURL:(id)a3
{
  return (_TtC10Foundation13__NSSwiftData *)__NSSwiftData.init(contentsOf:)(&v4);
}

- (_TtC10Foundation13__NSSwiftData)initWithData:(id)a3
{
  id v4 = a3;
  id v5 = specialized Data.init(referencing:)(v4);
  unint64_t v7 = v6;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10Foundation13__NSSwiftData__backing) = 0LL;
  v8 = (char *)self + OBJC_IVAR____TtC10Foundation13__NSSwiftData__range;
  *(void *)v8 = 0LL;
  *((void *)v8 + 1) = 0LL;
  v8[16] = 1;
  Class isa = Data._Representation.bridgedReference()().super.isa;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for __NSSwiftData();
  objc_super v10 = -[NSData initWithData:](&v12, sel_initWithData_, isa);
  outlined consume of Data._Representation((uint64_t)v5, v7);

  return v10;
}

- (_TtC10Foundation13__NSSwiftData)initWithContentsOfFile:(id)a3 error:(id *)a4
{
  return (_TtC10Foundation13__NSSwiftData *)@objc __NSSwiftData.init(contentsOfFile:error:)( (uint64_t)self,  (uint64_t)a2,  a3,  (uint64_t)a4,  (SEL *)&selRef_initWithContentsOfFile_error_);
}

- (_TtC10Foundation13__NSSwiftData)initWithContentsOfMappedFile:(id)a3 error:(id *)a4
{
  return (_TtC10Foundation13__NSSwiftData *)@objc __NSSwiftData.init(contentsOfFile:error:)( (uint64_t)self,  (uint64_t)a2,  a3,  (uint64_t)a4,  (SEL *)&selRef_initWithContentsOfMappedFile_error_);
}

- (void).cxx_destruct
{
}

@end