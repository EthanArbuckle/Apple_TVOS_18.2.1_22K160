@interface IDSGlobalLinkP2PNegotiatedKeys
- (BOOL)isServer;
- (IDSGlobalLinkP2PNegotiatedKeySetProtocol)avc;
- (IDSGlobalLinkP2PNegotiatedKeySetProtocol)ids;
- (NSString)description;
- (_TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys)init;
@end

@implementation IDSGlobalLinkP2PNegotiatedKeys

- (BOOL)isServer
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys_isServer);
}

- (IDSGlobalLinkP2PNegotiatedKeySetProtocol)avc
{
  return (IDSGlobalLinkP2PNegotiatedKeySetProtocol *)(id)swift_unknownObjectRetain( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys_avc),  a2);
}

- (IDSGlobalLinkP2PNegotiatedKeySetProtocol)ids
{
  return (IDSGlobalLinkP2PNegotiatedKeySetProtocol *)(id)swift_unknownObjectRetain( *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys_ids),  a2);
}

- (NSString)description
{
  return (NSString *)sub_100411AD4(self, (uint64_t)a2, (void (*)(void))sub_100411B2C);
}

- (_TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys)init
{
  result = (_TtC17identityservicesd30IDSGlobalLinkP2PNegotiatedKeys *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGlobalLinkP2PNegotiatedKeys",  48LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end