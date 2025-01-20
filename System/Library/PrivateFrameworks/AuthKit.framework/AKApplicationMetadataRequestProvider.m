@interface AKApplicationMetadataRequestProvider
- (AKApplicationMetadataRequestProvider)init;
- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 url:(id)a4;
- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4;
- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5;
- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6;
- (AKApplicationMetadataRequestProvider)initWithUrlBagKey:(id)a3;
- (BOOL)signRequest:(id)a3 error:(id *)a4;
- (BOOL)validateResponseData:(id)a3 error:(id *)a4;
- (unint64_t)expectedResponseType;
- (unint64_t)requestBodyType;
@end

@implementation AKApplicationMetadataRequestProvider

- (unint64_t)expectedResponseType
{
  return 0LL;
}

- (unint64_t)requestBodyType
{
  return 0LL;
}

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_1000E052C(v5);

  return 1;
}

- (BOOL)validateResponseData:(id)a3 error:(id *)a4
{
  if (a3)
  {
    v6 = self;
    id v7 = a3;
    uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    unint64_t v10 = v9;
  }

  else
  {
    v11 = self;
    uint64_t v8 = 0LL;
    unint64_t v10 = 0xF000000000000000LL;
  }

  sub_1000E06F4(v8, v10);

  sub_1000B98AC(v8, v10);
  return 1;
}

- (AKApplicationMetadataRequestProvider)initWithUrlBagKey:(id)a3
{
  id v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  v6 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  *id v5 = 0LL;
  v5[1] = 0LL;
  v8.receiver = self;
  v8.super_class = v6;
  return -[AKURLRequestProviderImpl initWithUrlBagKey:](&v8, "initWithUrlBagKey:", a3);
}

- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4
{
  id v7 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  objc_super v8 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  *id v7 = 0LL;
  v7[1] = 0LL;
  v10.receiver = self;
  v10.super_class = v8;
  return -[AKURLRequestProviderImpl initWithContext:urlBagKey:](&v10, "initWithContext:urlBagKey:", a3, a4);
}

- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t v9 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  objc_super v10 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  *unint64_t v9 = 0LL;
  v9[1] = 0LL;
  v12.receiver = self;
  v12.super_class = v10;
  return -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:]( &v12,  "initWithContext:urlBagKey:shouldCacheResource:",  a3,  a4,  v5);
}

- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 urlBagKey:(id)a4 shouldCacheResource:(BOOL)a5 accountManager:(id)a6
{
  BOOL v7 = a5;
  v11 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  objc_super v12 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  void *v11 = 0LL;
  v11[1] = 0LL;
  v14.receiver = self;
  v14.super_class = v12;
  return -[AKURLRequestProviderImpl initWithContext:urlBagKey:shouldCacheResource:accountManager:]( &v14,  "initWithContext:urlBagKey:shouldCacheResource:accountManager:",  a3,  a4,  v7,  a6);
}

- (AKApplicationMetadataRequestProvider)initWithContext:(id)a3 url:(id)a4
{
  uint64_t v7 = type metadata accessor for URL(0LL, a2);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  objc_super v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  void *v11 = 0LL;
  v11[1] = 0LL;
  swift_unknownObjectRetain(a3);
  URL._bridgeToObjectiveC()(v12);
  objc_super v14 = v13;
  v15 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  v18.receiver = self;
  v18.super_class = v15;
  v16 = -[AKURLRequestProviderImpl initWithContext:url:](&v18, "initWithContext:url:", a3, v14);
  swift_unknownObjectRelease(a3);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v16;
}

- (AKApplicationMetadataRequestProvider)init
{
  v3 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID);
  v4 = (objc_class *)type metadata accessor for ApplicationMetadataRequestProvider();
  void *v3 = 0LL;
  v3[1] = 0LL;
  v6.receiver = self;
  v6.super_class = v4;
  return -[AKApplicationMetadataRequestProvider init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(void *)(&self->super.super._shouldCacheResource
                                      + OBJC_IVAR___AKApplicationMetadataRequestProvider_clientID));
}

@end