@interface CardViewDelegate
- (BOOL)canPerformCommand:(id)a3;
- (BOOL)shouldHandleCardSectionEngagement:(id)a3;
- (_TtC6SiriTV16CardViewDelegate)init;
- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5;
- (void)didPerformCommand:(id)a3;
- (void)performCommand:(id)a3;
@end

@implementation CardViewDelegate

- (BOOL)canPerformCommand:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_46AAC(v3);

  return v3 & 1;
}

- (void)performCommand:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_46FC4(a3);
}

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  v9 = self;
  sub_47BA4((uint64_t)v8, width, height);
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_47CAC(v3);

  return v3 & 1;
}

- (void)didPerformCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_48358((uint64_t)v4);
}

- (_TtC6SiriTV16CardViewDelegate)init
{
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC6SiriTV16CardViewDelegate_logger;
  uint64_t v4 = type metadata accessor for Logger(0LL);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
}

@end