@interface SDAirDropSendCompressionAdapter
- (_TtC16DaemoniOSLibrary31SDAirDropSendCompressionAdapter)init;
- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(id)a5;
@end

@implementation SDAirDropSendCompressionAdapter

- (void)fileZipper:(id)a3 event:(int64_t)a4 withProperty:(id)a5
{
  id v8 = a3;
  swift_unknownObjectRetain(a5);
  swift_retain(self);
  sub_100194B1C(a4, (uint64_t)a5);
  swift_release(self);
  swift_unknownObjectRelease(a5);
}

- (_TtC16DaemoniOSLibrary31SDAirDropSendCompressionAdapter)init
{
  result = (_TtC16DaemoniOSLibrary31SDAirDropSendCompressionAdapter *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAirDropSendCompressionAdapter",  48LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end