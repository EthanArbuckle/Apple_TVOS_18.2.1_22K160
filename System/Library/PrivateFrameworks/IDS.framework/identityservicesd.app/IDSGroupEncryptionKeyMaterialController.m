@interface IDSGroupEncryptionKeyMaterialController
- (IDSGroupEncryptionKeyMaterial)currentObjcMaterial;
- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)init;
- (void)dealloc;
- (void)ensureKey;
@end

@implementation IDSGroupEncryptionKeyMaterialController

- (void)dealloc
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_state);
  uint64_t v3 = v2 + *(void *)(class metadata base offset for ManagedBuffer + *(void *)v2 + 16LL);
  v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(void *)v2 + 48LL) + 3LL) & 0x1FFFFFFFCLL));
  v5 = self;
  swift_retain(v2);
  os_unfair_lock_lock(v4);
  sub_1003F7AEC(v3);
  os_unfair_lock_unlock(v4);
  swift_release(v2);
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for IDSGroupEncryptionKeyMaterialController(0LL);
  -[IDSGroupEncryptionKeyMaterialController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_state));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_l;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_q));
  swift_bridgeObjectRelease(*(void *)&self->state[OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_groupID]);
  sub_10040A648((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_cryptoHandler));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_persistenceManager));
}

- (IDSGroupEncryptionKeyMaterial)currentObjcMaterial
{
  objc_super v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v7 = type metadata accessor for IDSGroupEncryptionKeyMaterialContent(0LL);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v13 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x118);
  v14 = self;
  v13();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1LL, v7) == 1)
  {
    sub_10040A274((uint64_t)v6, &qword_1009B8E08);
    id v15 = 0LL;
  }

  else
  {
    sub_1003F600C((uint64_t)v6, (uint64_t)v12, type metadata accessor for IDSGroupEncryptionKeyMaterialContent);
    id v15 = sub_10043A878();
    sub_1003F6050((uint64_t)v12, type metadata accessor for IDSGroupEncryptionKeyMaterialContent);
  }

  return (IDSGroupEncryptionKeyMaterial *)v15;
}

- (void)ensureKey
{
  uint64_t v2 = (os_unfair_lock_s *)(*(char **)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_state)
                          + ((*(unsigned int *)(**(void **)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController_state)
                                              + 48LL)
                            + 3LL) & 0x1FFFFFFFCLL));
  __n128 v3 = self;
  os_unfair_lock_lock(v2);
  sub_10040A0E4();
  os_unfair_lock_unlock(v2);
}

- (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController)init
{
  result = (_TtC17identityservicesd39IDSGroupEncryptionKeyMaterialController *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupEncryptionKey MaterialController",  57LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end