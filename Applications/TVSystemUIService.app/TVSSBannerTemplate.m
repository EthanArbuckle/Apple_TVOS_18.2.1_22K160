@interface TVSSBannerTemplate
- (NSAttributedString)footer;
- (NSAttributedString)subtitle;
- (NSAttributedString)title;
- (UIView)leadingView;
- (UIView)trailingView;
- (id)_initWithTitle:(id)a3 subtitle:(id)a4 footer:(id)a5 leadingView:(id)a6 trailingView:(id)a7;
@end

@implementation TVSSBannerTemplate

- (id)_initWithTitle:(id)a3 subtitle:(id)a4 footer:(id)a5 leadingView:(id)a6 trailingView:(id)a7
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  id v17 = 0LL;
  objc_storeStrong(&v17, a5);
  id v16 = 0LL;
  objc_storeStrong(&v16, a6);
  id v15 = 0LL;
  objc_storeStrong(&v15, a7);
  v7 = v20;
  v20 = 0LL;
  v14.receiver = v7;
  v14.super_class = (Class)&OBJC_CLASS___TVSSBannerTemplate;
  v20 = -[TVSSBannerTemplate init](&v14, "init");
  objc_storeStrong((id *)&v20, v20);
  if (v20)
  {
    objc_storeStrong((id *)&v20->_title, location[0]);
    objc_storeStrong((id *)&v20->_subtitle, v18);
    objc_storeStrong((id *)&v20->_footer, v17);
    objc_storeStrong((id *)&v20->_leadingView, v16);
    objc_storeStrong((id *)&v20->_trailingView, v15);
  }

  v9 = v20;
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  return v9;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (NSAttributedString)footer
{
  return self->_footer;
}

- (UIView)leadingView
{
  return self->_leadingView;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (void).cxx_destruct
{
}

@end