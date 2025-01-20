@interface CorrectedPronunciationValueTransformer
+ (NSArray)allowedTopLevelClasses;
- (CorrectedPronunciationValueTransformer)init;
@end

@implementation CorrectedPronunciationValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  uint64_t v2 = sub_501C(&qword_4ABE0);
  uint64_t v3 = swift_allocObject(v2, 40LL, 7LL);
  *(_OWORD *)(v3 + 16) = xmmword_38B10;
  *(void *)(v3 + 32) = type metadata accessor for CorrectedPronunciation();
  sub_501C(&qword_4ABE8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (CorrectedPronunciationValueTransformer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[CorrectedPronunciationValueTransformer init](&v3, "init");
}

@end