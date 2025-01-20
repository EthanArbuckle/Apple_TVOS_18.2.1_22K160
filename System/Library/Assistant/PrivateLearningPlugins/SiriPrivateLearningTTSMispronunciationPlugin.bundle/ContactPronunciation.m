@interface ContactPronunciation
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (ContactPronunciation)init;
- (ContactPronunciation)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContactPronunciation

+ (BOOL)supportsSecureCoding
{
  return byte_4BA90;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_4BA90 = a3;
}

- (ContactPronunciation)initWithCoder:(id)a3
{
  return (ContactPronunciation *)sub_28FD4(a3);
}

- (NSString)description
{
  v2 = self;
  sub_294F8();
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
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }

  char v8 = sub_29628((uint64_t)v10);

  sub_911C((uint64_t)v10);
  return v8 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_29790(v4);
}

- (ContactPronunciation)init
{
  result = (ContactPronunciation *)_swift_stdlib_reportUnimplementedInitializer( "SiriPrivateLearningTTSMispronunciationPlugin.ContactPronunciation",  65LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end