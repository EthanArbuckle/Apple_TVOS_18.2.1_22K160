@interface AnswerETAIntentResponse
- (AnswerETAIntentResponse)init;
- (AnswerETAIntentResponse)initWithBackingStore:(id)a3;
- (AnswerETAIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (AnswerETAIntentResponse)initWithCoder:(id)a3;
- (AnswerETAIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation AnswerETAIntentResponse

- (int64_t)code
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___AnswerETAIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___AnswerETAIntentResponse_code, v4, 0LL, 0LL);
  return *v2;
}

- (void)setCode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___AnswerETAIntentResponse_code);
  swift_beginAccess((char *)self + OBJC_IVAR___AnswerETAIntentResponse_code, v5, 1LL, 0LL);
  int64_t *v4 = a3;
}

- (AnswerETAIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  v7 = -[AnswerETAIntentResponse init](self, "init");
  v8 = (int64_t *)((char *)v7 + OBJC_IVAR___AnswerETAIntentResponse_code);
  swift_beginAccess((char *)v7 + OBJC_IVAR___AnswerETAIntentResponse_code, v11, 1LL, 0LL);
  int64_t *v8 = a3;
  v9 = v7;
  -[AnswerETAIntentResponse setUserActivity:](v9, "setUserActivity:", v6);

  return v9;
}

- (AnswerETAIntentResponse)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___AnswerETAIntentResponse_code) = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnswerETAIntentResponse();
  return -[AnswerETAIntentResponse init](&v3, "init");
}

- (AnswerETAIntentResponse)initWithCoder:(id)a3
{
  return (AnswerETAIntentResponse *)@objc AnswerETAIntentResponse.init(coder:)( (char *)self,  (uint64_t)a2,  (uint64_t)a3,  (SEL *)&selRef_initWithCoder_);
}

- (AnswerETAIntentResponse)initWithBackingStore:(id)a3
{
  return (AnswerETAIntentResponse *)@objc AnswerETAIntentResponse.init(coder:)( (char *)self,  (uint64_t)a2,  (uint64_t)a3,  (SEL *)&selRef_initWithBackingStore_);
}

- (AnswerETAIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a3,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  else {
    uint64_t v3 = 0LL;
  }
  return (AnswerETAIntentResponse *)AnswerETAIntentResponse.init(propertiesByName:)(v3);
}

@end