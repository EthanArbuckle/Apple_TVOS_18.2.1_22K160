@interface ContentPlattersView
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (NSArray)preferredFocusEnvironments;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
@end

@implementation ContentPlattersView

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_3AAA0(v4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_3AB7C();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_3AC00();
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_3AE94(v4);
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  uint64_t v3 = sub_3B054();

  sub_9E24((uint64_t *)&unk_DFA00);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_3B2F0(v4);

  return self & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_3B440(v6);
}

@end