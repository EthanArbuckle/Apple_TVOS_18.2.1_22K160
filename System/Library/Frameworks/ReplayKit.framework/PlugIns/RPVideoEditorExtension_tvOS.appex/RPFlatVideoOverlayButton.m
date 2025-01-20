@interface RPFlatVideoOverlayButton
- (RPFlatVideoOverlayButton)initWithStyle:(int64_t)a3;
- (SEL)action;
- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5;
- (id)_highlightedButtonImage;
- (id)_normalButtonImage;
- (id)target;
- (int64_t)style;
- (void)_handleTap:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation RPFlatVideoOverlayButton

- (RPFlatVideoOverlayButton)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___RPFlatVideoOverlayButton;
  v4 = -[RPFlatVideoOverlayButton initWithFrame:]( &v9,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RPFlatVideoOverlayButton _normalButtonImage](v4, "_normalButtonImage"));
    -[RPFlatVideoOverlayButton setImage:forState:](v5, "setImage:forState:", v6, 0LL);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RPFlatVideoOverlayButton _highlightedButtonImage](v5, "_highlightedButtonImage"));
    -[RPFlatVideoOverlayButton setImage:forState:](v5, "setImage:forState:", v7, 1LL);

    -[RPFlatVideoOverlayButton sizeToFit](v5, "sizeToFit");
    -[RPFlatVideoOverlayButton setDeliversTouchesForGesturesToSuperview:]( v5,  "setDeliversTouchesForGesturesToSuperview:",  0LL);
    -[RPFlatVideoOverlayButton addTarget:action:forControlEvents:]( v5,  "addTarget:action:forControlEvents:",  v5,  "_handleTap:",  64LL);
  }

  return v5;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  self->_action = a4;
}

- (void)_handleTap:(id)a3
{
  p_target = &self->_target;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  char v6 = objc_opt_respondsToSelector(WeakRetained, self->_action);

  if ((v6 & 1) != 0)
  {
    id v7 = objc_loadWeakRetained(p_target);
    [v7 performSelector:self->_action withObject:self];
  }

- (id)_normalButtonImage
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005408;
  block[3] = &unk_10000C3E8;
  block[4] = self;
  if (qword_1000123B0 != -1) {
    dispatch_once(&qword_1000123B0, block);
  }
  return (id)qword_1000123A8;
}

- (id)_highlightedButtonImage
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000054B8;
  block[3] = &unk_10000C3E8;
  block[4] = self;
  if (qword_1000123C0 != -1) {
    dispatch_once(&qword_1000123C0, block);
  }
  return (id)qword_1000123B8;
}

- (id)_createOverlayImageWithBackgroundWhite:(double)a3 backgroundAlpha:(double)a4 glyphAlpha:(double)a5
{
  v8 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:",  @"RPVideoOverlayBackgroundMask",  v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:",  @"RPVideoOverlayGlyphMask",  v9));
  double y = CGPointZero.y;
  [v10 size];
  CGFloat width = v19.width;
  CGFloat height = v19.height;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetGrayFillColor(CurrentContext, a3, a4);
  v20.origin.x = CGPointZero.x;
  v20.origin.double y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  CGContextFillRect(CurrentContext, v20);
  objc_msgSend(v10, "drawAtPoint:blendMode:alpha:", 23, CGPointZero.x, y, 1.0);
  objc_msgSend(v11, "drawAtPoint:blendMode:alpha:", 23, CGPointZero.x, y, 1.0);
  objc_msgSend(v11, "drawAtPoint:blendMode:alpha:", 0, CGPointZero.x, y, a5);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v17;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
}

- (SEL)action
{
  return self->_action;
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (void).cxx_destruct
{
}

@end