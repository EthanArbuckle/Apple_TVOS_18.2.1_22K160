@interface ZWTouchTrapView
- (BOOL)accessibilityActivate;
- (BOOL)enabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (ZWTouchTrapViewDelegate)delegate;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)accessibilityTraits;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation ZWTouchTrapView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ZWTouchTrapView delegate](self, "delegate"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchTrapView delegate](self, "delegate")),
        unsigned int v11 = objc_msgSend(v10, "touchTrapView:shouldReportSelfInHitTestAtLocation:", self, x, y),
        v10,
        v9,
        v11))
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___ZWTouchTrapView;
    BOOL v12 = -[ZWTouchTrapView pointInside:withEvent:](&v14, "pointInside:withEvent:", v7, x, y);
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ZWTouchTrapView delegate](self, "delegate"));
  if (v8
    && (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchTrapView delegate](self, "delegate")),
        unsigned int v11 = objc_msgSend(v10, "touchTrapView:shouldReportSelfInHitTestAtLocation:", self, x, y),
        v10,
        v9,
        v11))
  {
    if (-[ZWTouchTrapView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
    {
      BOOL v12 = self;
    }

    else
    {
      v16.receiver = self;
      v16.super_class = (Class)&OBJC_CLASS___ZWTouchTrapView;
      id v14 = -[ZWTouchTrapView hitTest:withEvent:](&v16, "hitTest:withEvent:", v7, x, y);
      BOOL v12 = (ZWTouchTrapView *)objc_claimAutoreleasedReturnValue(v14);
    }

    v13 = v12;
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ZWTouchTrapView delegate](self, "delegate"));
  [v8 touchTrapView:self didTrapTouches:v7 withEvent:v6];
}

- (BOOL)enabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchTrapView layer](self, "layer"));
  unsigned __int8 v3 = [v2 hitTestsAsOpaque];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[ZWTouchTrapView layer](self, "layer"));
  [v4 setHitTestsAsOpaque:v3];
}

- (id)accessibilityLabel
{
  return ZWLocString(@"ZW_STOP_RESIZING_LABEL");
}

- (id)accessibilityHint
{
  return ZWLocString(@"ZW_STOP_RESIZING_HINT");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (BOOL)accessibilityActivate
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchTrapView delegate](self, "delegate"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ZWTouchTrapView delegate](self, "delegate"));
    [v4 touchTrapViewActivated:self];
  }

  return v3 != 0LL;
}

- (ZWTouchTrapViewDelegate)delegate
{
  return (ZWTouchTrapViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end