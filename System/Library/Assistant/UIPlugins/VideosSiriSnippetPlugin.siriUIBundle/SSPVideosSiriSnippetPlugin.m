@interface SSPVideosSiriSnippetPlugin
- (_TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin)init;
- (id)productPageAceViewControllerWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5;
- (void)notifyPluginOfResultAppeared:(id)a3 atIndex:(int64_t)a4;
- (void)notifyPluginOfResultDisappeared:(id)a3 atIndex:(int64_t)a4;
- (void)notifyPluginOfSnippet:(id)a3 appearance:(BOOL)a4;
- (void)recordMetricsForSelectedResult:(id)a3;
@end

@implementation SSPVideosSiriSnippetPlugin

- (id)productPageAceViewControllerWithContentItem:(id)a3 userDriven:(BOOL)a4 playTrailer:(BOOL)a5
{
  if (a3)
  {
    type metadata accessor for SSPProductPageAceViewController();
    return sub_AF7C(a3, a4, a5);
  }

  else
  {
    __break(1u);
  }

  return self;
}

- (void)notifyPluginOfSnippet:(id)a3 appearance:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_823C(v6, a4);
}

- (void)notifyPluginOfResultAppeared:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_AA20(a4, (void (*)(char *, char *, uint64_t))&BasicImpressionsTracker.elementDidEnterView(_:on:with:));
}

- (void)notifyPluginOfResultDisappeared:(id)a3 atIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_AA20(a4, (void (*)(char *, char *, uint64_t))&BasicImpressionsTracker.elementDidLeaveView(_:on:with:));
}

- (void)recordMetricsForSelectedResult:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_89E4(v4);
}

- (_TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin)init
{
  v3 = (objc_class *)type metadata accessor for SSPVideosSiriSnippetPlugin(0LL);
  id v4 = self;
  sub_7EFC();
  uint64_t v5 = OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_impressionTracker;
  type metadata accessor for BasicImpressionsTracker(0LL);
  *(Class *)((char *)&v4->super.super.isa + v5) = (Class)BasicImpressionsTracker.__allocating_init(threshold:)(1.0);
  *(Class *)((char *)&v4->super.super.isa
           + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_impressionsData) = (Class)&_swiftEmptyArrayStorage;
  *(Class *)((char *)&v4->super.super.isa
           + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_contentCabinet) = 0LL;

  v7.receiver = v4;
  v7.super_class = v3;
  return -[VSSPVideosSiriSnippetPlugin init](&v7, "init");
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_shelfImpressionsData;
  uint64_t v4 = type metadata accessor for ImpressionMetrics(0LL, a2);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_impressionTracker));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_impressionsData));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23VideosSiriSnippetPlugin26SSPVideosSiriSnippetPlugin_contentCabinet));
}

@end