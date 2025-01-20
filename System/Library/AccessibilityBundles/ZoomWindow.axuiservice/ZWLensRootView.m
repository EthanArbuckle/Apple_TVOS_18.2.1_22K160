@interface ZWLensRootView
- (ZWLensRootView)initWithDelegate:(id)a3;
- (ZWLensRootViewDelegate)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ZWLensRootView

- (ZWLensRootView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ZWLensRootView;
  v5 = -[ZWLensRootView initWithFrame:]( &v8,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    -[ZWLensRootView setDelegate:](v5, "setDelegate:", v4);
    -[ZWLensRootView setTranslatesAutoresizingMaskIntoConstraints:]( v6,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  }

  return v6;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[ZWLensRootView delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "zoomRootview:viewForHitTestAtPoint:", self, x, y));

  if (!v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___ZWLensRootView;
    id v10 = -[ZWLensRootView hitTest:withEvent:](&v12, "hitTest:withEvent:", v7, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  return v9;
}

- (ZWLensRootViewDelegate)delegate
{
  return (ZWLensRootViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end