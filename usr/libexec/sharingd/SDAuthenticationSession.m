@interface SDAuthenticationSession
- (_TtC16DaemoniOSLibrary23SDAuthenticationSession)init;
@end

@implementation SDAuthenticationSession

- (_TtC16DaemoniOSLibrary23SDAuthenticationSession)init
{
  result = (_TtC16DaemoniOSLibrary23SDAuthenticationSession *)_swift_stdlib_reportUnimplementedInitializer( "DaemoniOSLibrary.SDAuthenticationSession",  40LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationSession_sessionID;
  uint64_t v4 = type metadata accessor for UUID(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationSession_responseTimer));
}

@end