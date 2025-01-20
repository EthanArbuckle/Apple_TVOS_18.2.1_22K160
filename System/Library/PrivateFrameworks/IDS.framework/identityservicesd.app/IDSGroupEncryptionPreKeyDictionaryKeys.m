@interface IDSGroupEncryptionPreKeyDictionaryKeys
+ (NSString)creationDate;
+ (NSString)publicPreKey;
+ (NSString)wrapMode;
- (_TtC17identityservicesd38IDSGroupEncryptionPreKeyDictionaryKeys)init;
@end

@implementation IDSGroupEncryptionPreKeyDictionaryKeys

+ (NSString)publicPreKey
{
  return (NSString *)sub_10040B640( (uint64_t)a1,  (uint64_t)a2,  &qword_1009C1010,  (uint64_t)&qword_1009C7570,  (uint64_t *)algn_1009C7578,  (uint64_t)sub_10040B558);
}

+ (NSString)creationDate
{
  return (NSString *)sub_10040B640( (uint64_t)a1,  (uint64_t)a2,  &qword_1009C1018,  (uint64_t)&qword_1009C7580,  (uint64_t *)algn_1009C7588,  (uint64_t)sub_10040B5A8);
}

+ (NSString)wrapMode
{
  return (NSString *)sub_10040B640( (uint64_t)a1,  (uint64_t)a2,  &qword_1009C1020,  (uint64_t)&qword_1009C7590,  (uint64_t *)algn_1009C7598,  (uint64_t)sub_10040B5F8);
}

- (_TtC17identityservicesd38IDSGroupEncryptionPreKeyDictionaryKeys)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IDSGroupEncryptionPreKeyDictionaryKeys();
  return -[IDSGroupEncryptionPreKeyDictionaryKeys init](&v3, "init");
}

@end