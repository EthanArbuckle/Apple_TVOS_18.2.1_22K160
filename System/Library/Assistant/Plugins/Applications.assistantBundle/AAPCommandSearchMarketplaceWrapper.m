@interface AAPCommandSearchMarketplaceWrapper
- (_TtC12Applications34AAPCommandSearchMarketplaceWrapper)init;
- (_TtC12Applications34AAPCommandSearchMarketplaceWrapper)initWithMarketplace:(id)a3 keyword:(id)a4;
- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5;
@end

@implementation AAPCommandSearchMarketplaceWrapper

- (_TtC12Applications34AAPCommandSearchMarketplaceWrapper)initWithMarketplace:(id)a3 keyword:(id)a4
{
  if (!a3)
  {
    uint64_t v6 = 0LL;
    SEL v7 = 0LL;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    goto LABEL_6;
  }

  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  SEL v7 = a2;
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
LABEL_6:
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_marketplace);
  uint64_t *v10 = v6;
  v10[1] = (uint64_t)v7;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12Applications34AAPCommandSearchMarketplaceWrapper_keyword);
  uint64_t *v11 = v8;
  v11[1] = v9;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for AAPCommandSearchMarketplaceWrapper();
  return -[AAPCommandSearchMarketplaceWrapper init](&v13, "init");
}

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4 executionInfo:(id)a5
{
  uint64_t v8 = (void (*)(uint64_t))_Block_copy(a3);
  if (v8)
  {
    uint64_t v9 = swift_allocObject(&unk_1CB48, 24LL, 7LL);
    *(void *)(v9 + 16) = v8;
    uint64_t v8 = sub_10AAC;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  swift_unknownObjectRetain(a4);
  id v10 = a5;
  v11 = self;
  _s12Applications34AAPCommandSearchMarketplaceWrapperC7perform10completion13serviceHelper13executionInfoyySDys11AnyHashableVypGSgcSg_So09AFServiceI0_pSgSo018AFCommandExecutionK0CSgtF_0( v8,  v9);
  sub_10A78((uint64_t)v8, v9);
  swift_unknownObjectRelease(a4);
}

- (_TtC12Applications34AAPCommandSearchMarketplaceWrapper)init
{
  result = (_TtC12Applications34AAPCommandSearchMarketplaceWrapper *)_swift_stdlib_reportUnimplementedInitializer( "Applications.AAPCommandSearchMarketplaceWrapper",  47LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end