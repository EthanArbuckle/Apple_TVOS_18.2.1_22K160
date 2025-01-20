@interface AnswerETAIntent
- (AnswerETAIntent)init;
- (AnswerETAIntent)initWithCoder:(id)a3;
- (AnswerETAIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (AnswerETAIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation AnswerETAIntent

- (AnswerETAIntent)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnswerETAIntent();
  return -[AnswerETAIntent init](&v3, "init");
}

- (AnswerETAIntent)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AnswerETAIntent();
  return -[AnswerETAIntent initWithCoder:](&v5, "initWithCoder:", a3);
}

- (AnswerETAIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    uint64_t v7 = v6;
    id v8 = a4;
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }

  else
  {
    id v10 = a4;
    NSString v9 = 0LL;
  }

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for AnswerETAIntent();
  v11 = -[AnswerETAIntent initWithIdentifier:backingStore:](&v13, "initWithIdentifier:backingStore:", v9, a4);

  return v11;
}

- (AnswerETAIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  uint64_t v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  if (a5) {
    a5 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a5,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  if (a5)
  {
    v14.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(a5);
  }

  else
  {
    v14.super.isa = 0LL;
  }

  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for AnswerETAIntent();
  v15 = -[AnswerETAIntent initWithDomain:verb:parametersByName:]( &v17,  "initWithDomain:verb:parametersByName:",  v12,  v13,  v14.super.isa);

  return v15;
}

@end