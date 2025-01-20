@interface BottledPeer
- (_TtC18TrustedPeersHelper11BottledPeer)init;
@end

@implementation BottledPeer

- (_TtC18TrustedPeersHelper11BottledPeer)init
{
  result = (_TtC18TrustedPeersHelper11BottledPeer *)_swift_stdlib_reportUnimplementedInitializer( "TrustedPeersHelper.BottledPeer",  30LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000852C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_secret),  *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_secret]);
  swift_bridgeObjectRelease( *(_TtC18TrustedPeersHelper6Client **)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peerID],  v3,  v4,  v5,  v6,  v7,  v8,  v9);
  swift_bridgeObjectRelease( *(_TtC18TrustedPeersHelper6Client **)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_bottleID],  v10,  v11,  v12,  v13,  v14,  v15,  v16);

  sub_10000852C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingEscrowKey),  *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingEscrowKey]);
  sub_10000852C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingPeerKey),  *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_signatureUsingPeerKey]);
  sub_10000852C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningPublicKey),  *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningPublicKey]);
  sub_10000852C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningSPKI),  *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_escrowSigningSPKI]);
  sub_10000852C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peersigningSPKI),  *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_peersigningSPKI]);
  sub_10000852C( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_contents),  *(void *)&self->escrowKeys[OBJC_IVAR____TtC18TrustedPeersHelper11BottledPeer_contents]);
}

@end