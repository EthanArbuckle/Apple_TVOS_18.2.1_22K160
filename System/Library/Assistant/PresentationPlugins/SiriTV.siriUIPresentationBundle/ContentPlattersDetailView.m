@interface ContentPlattersDetailView
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
@end

@implementation ContentPlattersDetailView

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_9221C();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_922B0(v4);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_92358(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_924A8(v6);
}

@end