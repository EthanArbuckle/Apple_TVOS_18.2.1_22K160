@interface TVSBInformationalBulletinView
+ (unint64_t)_contentLayoutForItem:(id)a3;
+ (unint64_t)_footerLayoutForItem:(id)a3;
- (TVSBInformationalBulletinItem)bulletinItem;
- (TVSBInformationalBulletinView)initWithFrame:(CGRect)a3;
- (TVSUIBulletinBackgroundView)backgroundView;
- (UIView)contentView;
- (void)setBulletinItem:(id)a3;
@end

@implementation TVSBInformationalBulletinView

- (TVSBInformationalBulletinView)initWithFrame:(CGRect)a3
{
  CGRect v21 = a3;
  SEL v19 = a2;
  v20 = 0LL;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVSBInformationalBulletinView;
  v16 = -[TVSBInformationalBulletinView initWithFrame:]( &v18,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v20 = v16;
  objc_storeStrong((id *)&v20, v16);
  if (v16)
  {
    id v8 = objc_alloc(&OBJC_CLASS___TVSUIBulletinContentSet);
    v9 = objc_opt_new(&OBJC_CLASS___UIView);
    id v17 = objc_msgSend(v8, "initWithContentView:footerView:");

    v3 = objc_alloc(&OBJC_CLASS___TVSUIBulletinBackgroundView);
    v4 = -[TVSUIBulletinBackgroundView initWithFrame:contentSet:]( v3,  "initWithFrame:contentSet:",  v17,  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    backgroundView = v20->_backgroundView;
    v20->_backgroundView = v4;

    -[TVSUIBulletinBackgroundView setTranslatesAutoresizingMaskIntoConstraints:]( v20->_backgroundView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVSBInformationalBulletinView addSubview:](v20, "addSubview:", v20->_backgroundView);
    id v12 = -[TVSUIBulletinBackgroundView topAnchor](v20->_backgroundView, "topAnchor");
    id v11 = -[TVSBInformationalBulletinView topAnchor](v20, "topAnchor");
    id v10 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", 57.0);
    [v10 setActive:1];

    id v15 = -[TVSUIBulletinBackgroundView trailingAnchor](v20->_backgroundView, "trailingAnchor");
    id v14 = -[TVSBInformationalBulletinView trailingAnchor](v20, "trailingAnchor");
    id v13 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", -80.0);
    [v13 setActive:1];

    objc_storeStrong(&v17, 0LL);
  }

  v7 = v20;
  objc_storeStrong((id *)&v20, 0LL);
  return v7;
}

- (void)setBulletinItem:(id)a3
{
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v46->_bulletinItem != location[0]
    && !-[TVSBInformationalBulletinItem isEqual:](v46->_bulletinItem, "isEqual:", location[0]))
  {
    v3 = (TVSBInformationalBulletinItem *)[location[0] copy];
    bulletinItem = v46->_bulletinItem;
    v46->_bulletinItem = v3;

    id v44 = 0LL;
    id v43 = 0LL;
    v5 = (void *)objc_opt_class(v46);
    id v42 = [v5 _contentLayoutForItem:location[0]];
    id v6 =  +[TVSUIBulletinContentView bulletinContentViewForLayout:]( &OBJC_CLASS___TVSUIBulletinContentView,  "bulletinContentViewForLayout:",  v42);
    id v7 = v44;
    id v44 = v6;

    id v33 = [location[0] titleText];
    objc_msgSend(v44, "setTitleText:");

    id v34 = [location[0] subtitleText];
    objc_msgSend(v44, "setSubtitleText:");

    id v8 = [location[0] customView];
    BOOL v35 = v8 == 0LL;

    if (v35)
    {
      id v21 = [location[0] image];
      char v38 = 0;
      BOOL v22 = 1;
      if (!v21)
      {
        id v39 = [location[0] imageURL];
        char v38 = 1;
        BOOL v22 = v39 != 0LL;
      }

      if ((v38 & 1) != 0) {

      }
      if (v22)
      {
        id v19 = [location[0] image];
        objc_msgSend(v44, "setImage:");

        id v20 = [location[0] imageURL];
        objc_msgSend(v44, "setImageURL:");
      }
    }

    else
    {
      id v41 = [v44 customViewContainerView];
      id v40 = [location[0] customView];
      if (v40)
      {
        [v41 addSubview:v40];
        id v24 = [v40 widthAnchor];
        id v23 = objc_msgSend(v24, "constraintEqualToConstant:");
        [v23 setActive:1];

        id v26 = [v40 heightAnchor];
        id v25 = [v26 constraintEqualToConstant:80.0];
        [v25 setActive:1];

        id v29 = [v40 centerXAnchor];
        id v28 = [v41 centerXAnchor];
        id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
        [v27 setActive:1];

        id v32 = [v40 centerYAnchor];
        id v31 = [v41 centerYAnchor];
        id v30 = objc_msgSend(v32, "constraintEqualToAnchor:");
        [v30 setActive:1];
      }

      objc_storeStrong(&v40, 0LL);
      objc_storeStrong(&v41, 0LL);
    }

    [v44 invalidateIntrinsicContentSize];
    v9 = (void *)objc_opt_class(v46);
    id v37 = [v9 _footerLayoutForItem:location[0]];
    id v10 =  +[TVSUIBulletinFooterView bulletinFooterViewForLayout:]( &OBJC_CLASS___TVSUIBulletinFooterView,  "bulletinFooterViewForLayout:",  v37);
    id v11 = v43;
    id v43 = v10;

    id v12 = [location[0] attributedFooterText];
    BOOL v18 = v12 == 0LL;

    if (v18)
    {
      id v14 = v43;
      id v15 = [location[0] footerText];
      objc_msgSend(v14, "setTitleText:");
    }

    else
    {
      id v16 = v43;
      id v17 = [location[0] attributedFooterText];
      objc_msgSend(v16, "setAttributedTitleText:");
    }

    [v43 invalidateIntrinsicContentSize];
    id v13 = objc_alloc(&OBJC_CLASS___TVSUIBulletinContentSet);
    id v36 = [v13 initWithContentView:v44 footerView:v43];
    -[TVSUIBulletinBackgroundView setContentSet:](v46->_backgroundView, "setContentSet:", v36);
    -[TVSBInformationalBulletinView setNeedsLayout](v46, "setNeedsLayout");
    objc_storeStrong(&v36, 0LL);
    objc_storeStrong(&v43, 0LL);
    objc_storeStrong(&v44, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (UIView)contentView
{
  return (UIView *)self->_backgroundView;
}

+ (unint64_t)_contentLayoutForItem:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 0LL;
}

+ (unint64_t)_footerLayoutForItem:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] footerText];
  char v6 = 0;
  BOOL v5 = 1;
  if (!v4)
  {
    id v7 = [location[0] attributedFooterText];
    char v6 = 1;
    BOOL v5 = v7 != 0LL;
  }

  if ((v6 & 1) != 0) {

  }
  if (v5) {
    unint64_t v9 = 0LL;
  }
  else {
    unint64_t v9 = -1LL;
  }
  objc_storeStrong(location, 0LL);
  return v9;
}

- (TVSBInformationalBulletinItem)bulletinItem
{
  return self->_bulletinItem;
}

- (TVSUIBulletinBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
}

@end