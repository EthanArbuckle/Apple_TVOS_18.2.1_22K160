@interface IDSGroupEncryptionIdentityController
- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)init;
- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)initWithConfig:(id)a3;
- (id)ensurePublicIdentityForDevice:(id)a3;
- (void)resetPreKey;
@end

@implementation IDSGroupEncryptionIdentityController

- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)initWithConfig:(id)a3
{
  id v3 = a3;
  v4 = (_TtC17identityservicesd36IDSGroupEncryptionIdentityController *)sub_1004B91C8((uint64_t)v3);

  return v4;
}

- (id)ensurePublicIdentityForDevice:(id)a3
{
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = *(void (**)(id))((swift_isaMask & (uint64_t)self->super.isa) + 0x138);
  id v10 = a3;
  v11 = self;
  v9(a3);
  uint64_t v12 = type metadata accessor for IDSGroupEncryptionFullIdentity(0LL);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v12 - 8) + 48LL))(v8, 1LL, v12) == 1)
  {
    sub_1004B94B0((uint64_t)v8);
    id v13 = 0LL;
  }

  else
  {
    id v13 = sub_1004D3778();
    sub_1003F6050((uint64_t)v8, type metadata accessor for IDSGroupEncryptionFullIdentity);
  }

  return v13;
}

- (void)resetPreKey
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x90);
  id v3 = self;
  v4 = (os_unfair_lock_s *)v2();
  os_unfair_lock_lock(v4 + 4);
  sub_1004B25D0();
  os_unfair_lock_unlock(v4 + 4);

  swift_release(v4);
}

- (_TtC17identityservicesd36IDSGroupEncryptionIdentityController)init
{
  result = (_TtC17identityservicesd36IDSGroupEncryptionIdentityController *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupEncryptionIdentityController",  54LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_l;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_q));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_lock));
  sub_1004B94B0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_identity);
  sub_1004B94B0((uint64_t)self + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_previousIdentity);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd36IDSGroupEncryptionIdentityController_listeners));
}

@end