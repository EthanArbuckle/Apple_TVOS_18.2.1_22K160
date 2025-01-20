@interface EscrowKeys
- (_TtC18TrustedPeersHelper10EscrowKeys)init;
@end

@implementation EscrowKeys

- (_TtC18TrustedPeersHelper10EscrowKeys)init
{
  result = (_TtC18TrustedPeersHelper10EscrowKeys *)_swift_stdlib_reportUnimplementedInitializer( "TrustedPeersHelper.EscrowKeys",  29LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000852C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_secret),  *(void *)&self->encryptionKey[OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_secret]);
  swift_bridgeObjectRelease( *(_TtC18TrustedPeersHelper6Client **)&self->encryptionKey[OBJC_IVAR____TtC18TrustedPeersHelper10EscrowKeys_bottleSalt],  v3,  v4,  v5,  v6,  v7,  v8,  v9);
}

@end