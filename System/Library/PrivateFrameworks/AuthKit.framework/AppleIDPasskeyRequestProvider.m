@interface AppleIDPasskeyRequestProvider
- (_TtC3akd29AppleIDPasskeyRequestProvider)init;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 url:(id)a4;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6;
- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithUrlBagKey:(id)a3;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
@end

@implementation AppleIDPasskeyRequestProvider

- (unint64_t)expectedResponseType
{
  return 1LL;
}

- (unint64_t)requestBodyType
{
  return 1LL;
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithUrlBagKey:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return -[AKURLRequestProviderImpl initWithUrlBagKey:](&v5, "initWithUrlBagKey:", a3);
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return -[AKURLRequestProviderImpl initWithContext:urlBagKey:](&v7, "initWithContext:urlBagKey:", a3, a4);
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5
{
  BOOL v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:]( &v9,  "initWithContext:urlBagKey:shouldCacheResource:",  a3,  a4,  v5);
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6
{
  BOOL v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:accountManager:]( &v11,  "initWithContext:urlBagKey:shouldCacheResource:accountManager:",  a3,  a4,  v7,  a6);
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)initWithContext:(id)a3 url:(id)a4
{
  uint64_t v7 = type metadata accessor for URL(0LL, a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  swift_unknownObjectRetain(a3);
  URL._bridgeToObjectiveC()(v11);
  v13 = v12;
  v14 = (objc_class *)type metadata accessor for AppleIDPasskeyRequestProvider();
  v17.receiver = self;
  v17.super_class = v14;
  v15 = -[AKURLRequestProviderImpl initWithContext:url:](&v17, "initWithContext:url:", a3, v13);
  swift_unknownObjectRelease(a3);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v15;
}

- (_TtC3akd29AppleIDPasskeyRequestProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppleIDPasskeyRequestProvider();
  return -[AppleIDPasskeyRequestProvider init](&v3, "init");
}

@end