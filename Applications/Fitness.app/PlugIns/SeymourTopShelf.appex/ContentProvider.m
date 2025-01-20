@interface ContentProvider
- (_TtC15SeymourTopShelf15ContentProvider)init;
- (void)loadTopShelfContentWithCompletionHandler:(id)a3;
@end

@implementation ContentProvider

- (_TtC15SeymourTopShelf15ContentProvider)init
{
  return (_TtC15SeymourTopShelf15ContentProvider *)sub_100004380();
}

- (void)loadTopShelfContentWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_10000CD38, 24LL, 7LL);
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_100004868((uint64_t)sub_100009D78, v5);

  swift_release(v5);
}

- (void).cxx_destruct
{
}

@end