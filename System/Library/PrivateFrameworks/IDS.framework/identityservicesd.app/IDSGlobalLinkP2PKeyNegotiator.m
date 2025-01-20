@interface IDSGlobalLinkP2PKeyNegotiator
- (_TtC17identityservicesd29IDSGlobalLinkP2PKeyNegotiator)init;
- (id)beginNegotiation;
@end

@implementation IDSGlobalLinkP2PKeyNegotiator

- (id)beginNegotiation
{
  v2 = self;
  id v3 = sub_10048A754();

  return v3;
}

- (_TtC17identityservicesd29IDSGlobalLinkP2PKeyNegotiator)init
{
  result = (_TtC17identityservicesd29IDSGlobalLinkP2PKeyNegotiator *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGlobalLinkP2PKeyNegotiator",  47LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd29IDSGlobalLinkP2PKeyNegotiator_localPushToken));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd29IDSGlobalLinkP2PKeyNegotiator_localIdentities));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd29IDSGlobalLinkP2PKeyNegotiator_remotePushTokens));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd29IDSGlobalLinkP2PKeyNegotiator_remoteIdentities));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd29IDSGlobalLinkP2PKeyNegotiator_lock));
}

@end