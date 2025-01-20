@interface SATVFocusRedirectView
- (BOOL)_containsInertiaSelectionChanges;
- (BOOL)containsInertia;
- (SATVFocusRedirectView)initWithFrame:(CGRect)a3;
- (UIFocusContainerGuide)containerGuide;
- (void)layoutSubviews;
- (void)setContainsInertia:(BOOL)a3;
@end

@implementation SATVFocusRedirectView

- (SATVFocusRedirectView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVFocusRedirectView;
  v3 = -[SATVFocusRedirectView initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UIFocusContainerGuide);
    containerGuide = v3->_containerGuide;
    v3->_containerGuide = v4;

    -[SATVFocusRedirectView addLayoutGuide:](v3, "addLayoutGuide:", v3->_containerGuide);
    v6 = v3->_containerGuide;
    -[SATVFocusRedirectView bounds](v3, "bounds");
    -[UIFocusContainerGuide _setManualLayoutFrame:](v6, "_setManualLayoutFrame:");
  }

  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVFocusRedirectView;
  -[SATVFocusRedirectView layoutSubviews](&v4, "layoutSubviews");
  containerGuide = self->_containerGuide;
  -[SATVFocusRedirectView bounds](self, "bounds");
  -[UIFocusContainerGuide _setManualLayoutFrame:](containerGuide, "_setManualLayoutFrame:");
}

- (BOOL)_containsInertiaSelectionChanges
{
  return self->_containsInertia;
}

- (BOOL)containsInertia
{
  return self->_containsInertia;
}

- (void)setContainsInertia:(BOOL)a3
{
  self->_containsInertia = a3;
}

- (UIFocusContainerGuide)containerGuide
{
  return self->_containerGuide;
}

- (void).cxx_destruct
{
}

@end