@interface PhonemeString
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PhonemeString)init;
- (PhonemeString)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PhonemeString

+ (BOOL)supportsSecureCoding
{
  return byte_4B440;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_4B440 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_15E78(v4);
}

- (PhonemeString)initWithCoder:(id)a3
{
  return (PhonemeString *)sub_16038(a3);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v5 = self;
    uint64_t v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }

  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }

  char v8 = sub_16430((uint64_t)v10);

  sub_911C((uint64_t)v10);
  return v8 & 1;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_165DC();

  return v3;
}

- (NSString)description
{
  v2 = self;
  sub_16724();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (PhonemeString)init
{
  result = (PhonemeString *)_swift_stdlib_reportUnimplementedInitializer( "SiriPrivateLearningTTSMispronunciationPlugin.PhonemeString",  58LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end