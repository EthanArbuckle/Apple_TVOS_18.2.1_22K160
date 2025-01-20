@interface SDAppleIDAccountInfo
- (NSDictionary)personInfo;
- (SFAppleIDAccount)account;
- (_TtC16DaemoniOSLibrary20SDAppleIDAccountInfo)init;
- (void)setAccount:(id)a3;
@end

@implementation SDAppleIDAccountInfo

- (SFAppleIDAccount)account
{
  return (SFAppleIDAccount *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_account));
}

- (void)setAccount:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_account);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_account) = (Class)a3;
  id v3 = a3;
}

- (NSDictionary)personInfo
{
  v2 = *(const char **)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_personInfo);
  sub_100183168(0LL, &qword_10064D638, &OBJC_CLASS___SFAppleIDPersonInfo_ptr);
  swift_bridgeObjectRetain(v2);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSDictionary *)isa;
}

- (_TtC16DaemoniOSLibrary20SDAppleIDAccountInfo)init
{
  result = (_TtC16DaemoniOSLibrary20SDAppleIDAccountInfo *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAppleIDAccountInfo",  37LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAppleIDAccountInfo_personInfo));
}

@end