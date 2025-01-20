@interface IDSGroupEncryptionConfiguration
- (_TtC17identityservicesd31IDSGroupEncryptionConfiguration)init;
- (_TtC17identityservicesd31IDSGroupEncryptionConfiguration)initWithBag:(id)a3;
@end

@implementation IDSGroupEncryptionConfiguration

- (_TtC17identityservicesd31IDSGroupEncryptionConfiguration)initWithBag:(id)a3
{
  uint64_t ObjectType = swift_getObjectType(self);
  uint64_t v6 = type metadata accessor for IDSGroupEncryptionConfigurationDefaults();
  uint64_t v7 = swift_allocObject(v6, 16LL, 7LL);
  v9 = (void *)swift_unknownObjectRetain(a3, v8);
  v10 = (_TtC17identityservicesd31IDSGroupEncryptionConfiguration *)sub_10045A8AC(v9, v7, ObjectType);
  swift_unknownObjectRelease(a3, v11);
  swift_release(v7);
  swift_deallocPartialClassInstance(self, ObjectType, 67LL, 7LL);
  return v10;
}

- (_TtC17identityservicesd31IDSGroupEncryptionConfiguration)init
{
  result = (_TtC17identityservicesd31IDSGroupEncryptionConfiguration *)_swift_stdlib_reportUnimplementedInitializer( "identityservicesd.IDSGroupEncryptionConfiguration",  49LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

@end