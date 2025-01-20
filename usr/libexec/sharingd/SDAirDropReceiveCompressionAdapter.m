@interface SDAirDropReceiveCompressionAdapter
- (_TtC16DaemoniOSLibrary34SDAirDropReceiveCompressionAdapter)init;
- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(id)a5;
@end

@implementation SDAirDropReceiveCompressionAdapter

- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain(a5);
  swift_retain(self);
  sub_10019B088(a4, (uint64_t)a5);
  swift_release(self);
  swift_unknownObjectRelease(a5);
}

- (_TtC16DaemoniOSLibrary34SDAirDropReceiveCompressionAdapter)init
{
  result = (_TtC16DaemoniOSLibrary34SDAirDropReceiveCompressionAdapter *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropReceiveCompressionAdapter",  51LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end