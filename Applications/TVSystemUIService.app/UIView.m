@interface UIView
- (id)tvsp_topMostAncestor;
@end

@implementation UIView

- (id)tvsp_topMostAncestor
{
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = self;
  while (1)
  {
    id v2 = [v8[0] superview];
    BOOL v7 = v2 == 0LL;

    if (v7) {
      break;
    }
    id v3 = [v8[0] superview];
    id v4 = v8[0];
    v8[0] = v3;
  }

  id v6 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v6;
}

@end