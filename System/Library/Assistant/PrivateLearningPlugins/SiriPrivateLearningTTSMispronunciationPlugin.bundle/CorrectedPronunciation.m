@interface CorrectedPronunciation
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (CorrectedPronunciation)init;
- (CorrectedPronunciation)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CorrectedPronunciation

+ (BOOL)supportsSecureCoding
{
  return byte_4AA70;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_4AA70 = a3;
}

- (NSString)description
{
  v2 = self;
  sub_65B4();
  uint64_t v4 = v3;

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (CorrectedPronunciation)initWithCoder:(id)a3
{
  return (CorrectedPronunciation *)sub_6770(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_6944(v4);
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

  char v8 = sub_6B10((uint64_t)v10);

  sub_911C((uint64_t)v10);
  return v8 & 1;
}

- (CorrectedPronunciation)init
{
  result = (CorrectedPronunciation *)_swift_stdlib_reportUnimplementedInitializer( "SiriPrivateLearningTTSMispronunciationPlugin.CorrectedPronunciation",  67LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end