@interface TVPCollectionViewLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (CGRect)focusedItemFrame;
- (UIEdgeInsets)focusedEdgeInsets;
- (double)focusingAnimationDuration;
- (double)unfocusingAnimationDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)focusAnimationOptions;
- (void)setFocusAnimationOptions:(unint64_t)a3;
- (void)setFocusedEdgeInsets:(UIEdgeInsets)a3;
- (void)setFocusedItemFrame:(CGRect)a3;
- (void)setFocusingAnimationDuration:(double)a3;
- (void)setUnfocusingAnimationDuration:(double)a3;
@end

@implementation TVPCollectionViewLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVPCollectionViewLayoutAttributes;
  id v4 = -[TVPCollectionViewLayoutAttributes copyWithZone:](&v6, "copyWithZone:", a3);
  objc_msgSend( v4,  "setFocusAnimationOptions:",  -[TVPCollectionViewLayoutAttributes focusAnimationOptions](self, "focusAnimationOptions"));
  -[TVPCollectionViewLayoutAttributes focusingAnimationDuration](self, "focusingAnimationDuration");
  objc_msgSend(v4, "setFocusingAnimationDuration:");
  -[TVPCollectionViewLayoutAttributes unfocusingAnimationDuration](self, "unfocusingAnimationDuration");
  objc_msgSend(v4, "setUnfocusingAnimationDuration:");
  -[TVPCollectionViewLayoutAttributes focusedItemFrame](self, "focusedItemFrame");
  objc_msgSend(v4, "setFocusedItemFrame:");
  -[TVPCollectionViewLayoutAttributes focusedEdgeInsets](self, "focusedEdgeInsets");
  objc_msgSend(v4, "setFocusedEdgeInsets:");
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    id v7 = v4;
    v42.receiver = self;
    v42.super_class = (Class)&OBJC_CLASS___TVPCollectionViewLayoutAttributes;
    if (!-[TVPCollectionViewLayoutAttributes isEqual:](&v42, "isEqual:", v7)) {
      goto LABEL_15;
    }
    id v8 = [v7 focusAnimationOptions];
    if (v8 != (id)-[TVPCollectionViewLayoutAttributes focusAnimationOptions](self, "focusAnimationOptions")) {
      goto LABEL_15;
    }
    [v7 focusingAnimationDuration];
    double v10 = v9;
    -[TVPCollectionViewLayoutAttributes focusingAnimationDuration](self, "focusingAnimationDuration");
    if (vabdd_f64(v10, v11) >= 2.22044605e-16) {
      goto LABEL_15;
    }
    [v7 unfocusingAnimationDuration];
    double v13 = v12;
    -[TVPCollectionViewLayoutAttributes unfocusingAnimationDuration](self, "unfocusingAnimationDuration");
    if (vabdd_f64(v13, v14) >= 2.22044605e-16) {
      goto LABEL_15;
    }
    [v7 focusedItemFrame];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    -[TVPCollectionViewLayoutAttributes focusedItemFrame](self, "focusedItemFrame");
    v44.origin.x = v23;
    v44.origin.y = v24;
    v44.size.width = v25;
    v44.size.height = v26;
    v43.origin.x = v16;
    v43.origin.y = v18;
    v43.size.width = v20;
    v43.size.height = v22;
    if (CGRectEqualToRect(v43, v44))
    {
      [v7 focusedEdgeInsets];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      -[TVPCollectionViewLayoutAttributes focusedEdgeInsets](self, "focusedEdgeInsets");
      BOOL v38 = v30 == v37;
      if (v28 != v39) {
        BOOL v38 = 0;
      }
      if (v34 != v36) {
        BOOL v38 = 0;
      }
      BOOL v40 = v32 == v35 && v38;
    }

    else
    {
LABEL_15:
      BOOL v40 = 0;
    }
  }

  else
  {
    BOOL v40 = 0;
  }

  return v40;
}

- (unint64_t)focusAnimationOptions
{
  return self->_focusAnimationOptions;
}

- (void)setFocusAnimationOptions:(unint64_t)a3
{
  self->_focusAnimationOptions = a3;
}

- (double)focusingAnimationDuration
{
  return self->_focusingAnimationDuration;
}

- (void)setFocusingAnimationDuration:(double)a3
{
  self->_focusingAnimationDuration = a3;
}

- (double)unfocusingAnimationDuration
{
  return self->_unfocusingAnimationDuration;
}

- (void)setUnfocusingAnimationDuration:(double)a3
{
  self->_unfocusingAnimationDuration = a3;
}

- (CGRect)focusedItemFrame
{
  double x = self->_focusedItemFrame.origin.x;
  double y = self->_focusedItemFrame.origin.y;
  double width = self->_focusedItemFrame.size.width;
  double height = self->_focusedItemFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFocusedItemFrame:(CGRect)a3
{
  self->_focusedItemFrame = a3;
}

- (UIEdgeInsets)focusedEdgeInsets
{
  double top = self->_focusedEdgeInsets.top;
  double left = self->_focusedEdgeInsets.left;
  double bottom = self->_focusedEdgeInsets.bottom;
  double right = self->_focusedEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setFocusedEdgeInsets:(UIEdgeInsets)a3
{
  self->_focusedEdgeInsets = a3;
}

@end