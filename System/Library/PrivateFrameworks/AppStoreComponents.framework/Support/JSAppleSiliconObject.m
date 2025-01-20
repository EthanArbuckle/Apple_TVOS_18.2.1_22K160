@interface JSAppleSiliconObject
- (BOOL)isRosettaAvailable;
- (BOOL)isSupportEnabled;
- (_TtC19appstorecomponentsd20JSAppleSiliconObject)init;
@end

@implementation JSAppleSiliconObject

- (BOOL)isSupportEnabled
{
  return sub_10009C45C( (char *)self,  (uint64_t)a2,  (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of Platform.isAppleSiliconSupportEnabled.getter);
}

- (BOOL)isRosettaAvailable
{
  return sub_10009C45C( (char *)self,  (uint64_t)a2,  (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of Platform.isRosettaAvailable.getter);
}

- (_TtC19appstorecomponentsd20JSAppleSiliconObject)init
{
  result = (_TtC19appstorecomponentsd20JSAppleSiliconObject *)_swift_stdlib_reportUnimplementedInitializer( "appstorecomponentsd.JSAppleSiliconObject",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end