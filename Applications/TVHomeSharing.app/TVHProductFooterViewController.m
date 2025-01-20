@interface TVHProductFooterViewController
- (TVHProductFooterView)footerView;
- (TVHProductFooterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation TVHProductFooterViewController

- (TVHProductFooterViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHProductFooterViewController;
  v4 = -[TVHProductFooterViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___TVHProductFooterView);
    footerView = v4->_footerView;
    v4->_footerView = v5;
  }

  return v4;
}

- (void)loadView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHProductFooterViewController footerView](self, "footerView"));
  -[TVHProductFooterViewController setView:](self, "setView:", v3);
}

- (TVHProductFooterView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
}

@end