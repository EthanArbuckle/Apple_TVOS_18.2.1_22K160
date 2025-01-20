@interface IDSGroupEncryptionControllerMember
- (BOOL)isEqual:(id)a3;
- (BOOL)isLightweight;
- (IDSURI)uri;
- (NSString)description;
- (_TtC17identityservicesd34IDSGroupEncryptionControllerMember)init;
- (int64_t)hash;
- (void)setIsLightweight:(BOOL)a3;
@end

@implementation IDSGroupEncryptionControllerMember

- (IDSURI)uri
{
  return (IDSURI *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC17identityservicesd34IDSGroupEncryptionControllerMember_uri));
}

- (int64_t)hash
{
  return (int64_t)[*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17identityservicesd34IDSGroupEncryptionControllerMember_uri) hash];
}

- (NSString)description
{
  v2 = self;
  sub_10040DDD0();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    NSString v5 = self;
    uint64_t v7 = swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v12, v7);
    swift_unknownObjectRelease(a3, v8);
  }

  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }

  char v10 = sub_10040DF0C((uint64_t)v12);

  sub_10040E008((uint64_t)v12);
  return v10 & 1;
}

- (BOOL)isLightweight
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x60);
  uint64_t v3 = self;
  LOBYTE(v2) = v2();

  return v2 & 1;
}

- (void)setIsLightweight:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = *(void (**)(BOOL))((swift_isaMask & (uint64_t)self->super.isa) + 0x68);
  NSString v5 = self;
  v4(v3);
}

- (_TtC17identityservicesd34IDSGroupEncryptionControllerMember)init
{
  result = (_TtC17identityservicesd34IDSGroupEncryptionControllerMember *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupEncryptionControllerMember",  52LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17identityservicesd34IDSGroupEncryptionControllerMember_uri));
}

@end