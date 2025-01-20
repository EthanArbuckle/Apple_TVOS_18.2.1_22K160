@interface IDSGlobalLinkP2PNegotiatedKeySet
- (NSData)clientSecret;
- (NSData)serverSecret;
- (NSString)description;
- (NSString)sensitiveDescription;
- (_TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet)init;
@end

@implementation IDSGlobalLinkP2PNegotiatedKeySet

- (NSData)serverSecret
{
  return (NSData *)sub_100411030( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet_serverSecret);
}

- (NSData)clientSecret
{
  return (NSData *)sub_100411030( (uint64_t)self,  (uint64_t)a2,  &OBJC_IVAR____TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet_clientSecret);
}

- (NSString)sensitiveDescription
{
  return (NSString *)sub_100411AD4(self, (uint64_t)a2, (void (*)(void))sub_1004114D8);
}

- (NSString)description
{
  return (NSString *)sub_100411AD4(self, (uint64_t)a2, (void (*)(void))sub_100411718);
}

- (_TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet)init
{
  result = (_TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGlobalLinkP2PNegotiatedKeySet",  50LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd32IDSGlobalLinkP2PNegotiatedKeySet_counters));
}

@end