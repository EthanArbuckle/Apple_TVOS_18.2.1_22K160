@interface TVSSPillContentViewProviderUpdateContext
- (TVSPPillView)pillView;
- (TVSSPillContentViewProviderUpdateContext)initWithContainerView:(id)a3 pillView:(id)a4;
- (UIView)containerView;
@end

@implementation TVSSPillContentViewProviderUpdateContext

- (TVSSPillContentViewProviderUpdateContext)initWithContainerView:(id)a3 pillView:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v4 = v11;
  v11 = 0LL;
  v8.receiver = v4;
  v8.super_class = (Class)&OBJC_CLASS___TVSSPillContentViewProviderUpdateContext;
  v11 = -[TVSSPillContentViewProviderUpdateContext init](&v8, "init");
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    objc_storeStrong((id *)&v11->_containerView, location[0]);
    objc_storeStrong((id *)&v11->_pillView, v9);
  }

  v6 = v11;
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  return v6;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (TVSPPillView)pillView
{
  return self->_pillView;
}

- (void).cxx_destruct
{
}

@end