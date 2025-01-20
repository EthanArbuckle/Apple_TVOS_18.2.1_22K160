@interface TVHStackViewController
- (TVHStackView)stackView;
- (TVHStackViewController)initWithLayout:(id)a3;
- (TVHStackViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)setStackView:(id)a3;
@end

@implementation TVHStackViewController

- (TVHStackViewController)initWithLayout:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHStackViewController;
  v5 = -[TVHStackViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", 0LL, 0LL);
  v6 = v5;
  if (v5) {
    sub_1000125B8(v5, v4);
  }

  return v6;
}

- (TVHStackViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVHStackViewController;
  id v4 = -[TVHStackViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UICollectionViewFlowLayout);
    -[UICollectionViewFlowLayout setScrollDirection:](v5, "setScrollDirection:", 0LL);
    sub_1000125B8(v4, v5);
  }

  return v4;
}

- (void)loadView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHStackViewController stackView](self, "stackView"));
  -[TVHStackViewController setView:](self, "setView:", v3);
}

- (TVHStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end