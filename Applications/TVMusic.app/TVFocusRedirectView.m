@interface TVFocusRedirectView
- (TVFocusRedirectView)initWithFrame:(CGRect)a3;
- (UIFocusContainerGuide)containerGuide;
- (void)layoutSubviews;
@end

@implementation TVFocusRedirectView

- (TVFocusRedirectView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVFocusRedirectView;
  v3 = -[TVFocusRedirectView initWithFrame:]( &v8,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___UIFocusContainerGuide);
    containerGuide = v3->_containerGuide;
    v3->_containerGuide = v4;

    -[TVFocusRedirectView addLayoutGuide:](v3, "addLayoutGuide:", v3->_containerGuide);
    v6 = v3->_containerGuide;
    -[TVFocusRedirectView bounds](v3, "bounds");
    -[UIFocusContainerGuide _setManualLayoutFrame:](v6, "_setManualLayoutFrame:");
  }

  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVFocusRedirectView;
  -[TVFocusRedirectView layoutSubviews](&v4, "layoutSubviews");
  containerGuide = self->_containerGuide;
  -[TVFocusRedirectView bounds](self, "bounds");
  -[UIFocusContainerGuide _setManualLayoutFrame:](containerGuide, "_setManualLayoutFrame:");
}

- (UIFocusContainerGuide)containerGuide
{
  return self->_containerGuide;
}

- (void).cxx_destruct
{
}

@end