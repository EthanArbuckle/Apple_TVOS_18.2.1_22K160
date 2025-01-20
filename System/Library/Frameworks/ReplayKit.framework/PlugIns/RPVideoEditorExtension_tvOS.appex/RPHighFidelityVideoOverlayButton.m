@interface RPHighFidelityVideoOverlayButton
- (RPHighFidelityVideoOverlayButton)initWithStyle:(int64_t)a3;
- (SEL)action;
- (id)target;
- (int64_t)style;
- (void)_playButtonActivate:(id)a3;
- (void)_playButtonDeactivate:(id)a3;
- (void)_playButtonTapped:(id)a3;
- (void)setAction:(SEL)a3;
- (void)setTarget:(id)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation RPHighFidelityVideoOverlayButton

- (RPHighFidelityVideoOverlayButton)initWithStyle:(int64_t)a3
{
  v5 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:",  @"RPVideoOverlayGlyphMask",  v6));
  v8 = -[UIButton initWithFrame:]( objc_alloc(&OBJC_CLASS___UIButton),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  -[UIButton setImage:forState:](v8, "setImage:forState:", v7, 0LL);
  -[UIButton sizeToFit](v8, "sizeToFit");
  -[UIButton frame](v8, "frame");
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___RPHighFidelityVideoOverlayButton;
  v9 = -[RPHighFidelityVideoOverlayButton initWithFrame:](&v17, "initWithFrame:");
  v10 = v9;
  if (v9)
  {
    v9->_style = a3;
    p_button = (id *)&v9->_button;
    objc_storeStrong((id *)&v9->_button, v8);
    -[UIButton addTarget:action:forControlEvents:]( v8,  "addTarget:action:forControlEvents:",  v10,  "_playButtonTapped:",  64LL);
    -[UIButton addTarget:action:forControlEvents:]( v8,  "addTarget:action:forControlEvents:",  v10,  "_playButtonActivate:",  64LL);
    -[UIButton addTarget:action:forControlEvents:]( v8,  "addTarget:action:forControlEvents:",  v10,  "_playButtonActivate:",  4LL);
    -[UIButton addTarget:action:forControlEvents:]( v8,  "addTarget:action:forControlEvents:",  v10,  "_playButtonDeactivate:",  8LL);
    -[UIButton setDeliversTouchesForGesturesToSuperview:](v8, "setDeliversTouchesForGesturesToSuperview:", 0LL);
    -[RPHighFidelityVideoOverlayButton addSubview:](v10, "addSubview:", *p_button);
    -[RPHighFidelityVideoOverlayButton setAutoresizingMask:](v10, "setAutoresizingMask:", 45LL);
    if (!a3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageNamed:inBundle:]( &OBJC_CLASS___UIImage,  "imageNamed:inBundle:",  @"RPVideoOverlayBackgroundMask",  v6));
      v13 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v12);
      v14 = -[_UIBackdropView initWithPrivateStyle:]( objc_alloc(&OBJC_CLASS____UIBackdropView),  "initWithPrivateStyle:",  2010LL);
      backdropView = v10->_backdropView;
      v10->_backdropView = v14;

      -[RPHighFidelityVideoOverlayButton insertSubview:belowSubview:]( v10,  "insertSubview:belowSubview:",  v10->_backdropView,  *p_button);
      -[RPHighFidelityVideoOverlayButton addSubview:](v10, "addSubview:", v13);
      -[UIImageView _setBackdropMaskViewFlags:](v13, "_setBackdropMaskViewFlags:", 7LL);
      -[UIImageView setAlpha:](v13, "setAlpha:", 0.0);
      -[_UIBackdropView updateMaskViewsForView:](v10->_backdropView, "updateMaskViewsForView:", v13);
      [*p_button _setBackdropMaskViewFlags:3];
      -[_UIBackdropView updateMaskViewsForView:](v10->_backdropView, "updateMaskViewsForView:", *p_button);
    }
  }

  -[RPHighFidelityVideoOverlayButton _playButtonDeactivate:](v10, "_playButtonDeactivate:", 0LL);

  return v10;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  self->_action = a4;
}

- (void)_playButtonActivate:(id)a3
{
}

- (void)_playButtonDeactivate:(id)a3
{
}

- (void)_playButtonTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  char v5 = objc_opt_respondsToSelector(WeakRetained, self->_action);

  if ((v5 & 1) != 0)
  {
    id v6 = objc_loadWeakRetained(&self->_target);
    [v6 performSelector:self->_action withObject:self];
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