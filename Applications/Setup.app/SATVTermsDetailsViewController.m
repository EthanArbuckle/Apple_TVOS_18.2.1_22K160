@interface SATVTermsDetailsViewController
- (CGSize)sizeThatFits;
- (NSString)gameCenterTerms;
- (NSString)iCloudTerms;
- (NSString)parentalConsentTerms;
- (NSString)tvOSTerms;
- (NSString)warrantyTerms;
- (SATVHeaderView)bannerView;
- (SATVLegalPresentation)legalPresentation;
- (UITableView)tableView;
- (id)preferredFocusEnvironments;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfRows;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)loadView;
- (void)setBannerView:(id)a3;
- (void)setGameCenterTerms:(id)a3;
- (void)setICloudTerms:(id)a3;
- (void)setLegalPresentation:(id)a3;
- (void)setNumberOfRows:(int64_t)a3;
- (void)setParentalConsentTerms:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTvOSTerms:(id)a3;
- (void)setWarrantyTerms:(id)a3;
- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didUnfocusRowAtIndexPath:(id)a4;
- (void)viewDidLayoutSubviews;
@end

@implementation SATVTermsDetailsViewController

- (void)loadView
{
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___SATVTermsDetailsViewController;
  -[SATVTermsDetailsViewController loadView](&v32, "loadView");
  v3 = objc_alloc(&OBJC_CLASS___SATVHeaderView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[SATVHeaderView initWithFrame:](v3, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  -[SATVTermsDetailsViewController setBannerView:](self, "setBannerView:", v7);

  v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"TC_DETAILS_SUBTITLE" value:&stru_1000CB560 table:@"Localizable"]);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController bannerView](self, "bannerView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 subtitleLabel]);
  [v12 setText:v10];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController bannerView](self, "bannerView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 subtitleLabel]);
  [v14 setTextAlignment:4];

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController bannerView](self, "bannerView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 subtitleLabel]);
  [v17 setFont:v15];

  v18 = -[UITableView initWithFrame:style:]( objc_alloc(&OBJC_CLASS___UITableView),  "initWithFrame:style:",  0LL,  CGRectZero.origin.x,  y,  width,  height);
  -[SATVTermsDetailsViewController setTableView:](self, "setTableView:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController tableView](self, "tableView"));
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___UITableViewCell);
  v21 = (objc_class *)objc_opt_class(&OBJC_CLASS___UITableViewCell);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  [v19 registerClass:v20 forCellReuseIdentifier:v23];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController tableView](self, "tableView"));
  [v24 setDelegate:self];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController tableView](self, "tableView"));
  [v25 setDataSource:self];

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController tableView](self, "tableView"));
  [v26 setRemembersLastFocusedIndexPath:1];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController tableView](self, "tableView"));
  [v27 reloadData];

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController tableView](self, "tableView"));
  [v28 addSubview:v29];

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController bannerView](self, "bannerView"));
  [v30 addSubview:v31];
}

- (void)viewDidLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SATVTermsDetailsViewController;
  -[SATVTermsDetailsViewController viewDidLayoutSubviews](&v19, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController view](self, "view"));
  unsigned int v4 = [v3 _shouldReverseLayoutDirection];

  double v5 = 0.0;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController view](self, "view"));
    [v6 frame];
    double v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](self->_bannerView, "titleLabel"));
    [v9 size];
    double v5 = v8 - v10 + -480.0;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController bannerView](self, "bannerView"));
  objc_msgSend(v11, "sizeThatFits:", 480.0, 3.40282347e38);
  double v13 = v12;
  double v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController bannerView](self, "bannerView"));
  objc_msgSend(v16, "setFrame:", v5, 0.0, v13, v15);

  v20.origin.double y = 0.0;
  v20.origin.x = v5;
  v20.size.double width = v13;
  v20.size.double height = v15;
  CGFloat v17 = CGRectGetMaxY(v20) + 25.0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController tableView](self, "tableView"));
  objc_msgSend(v18, "setFrame:", 0.0, v17, 590.0, 620.0);
}

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController tableView](self, "tableView"));
  v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    unsigned int v4 = &__NSArray0__struct;
  }

  return v4;
}

- (CGSize)sizeThatFits
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController bannerView](self, "bannerView"));
  objc_msgSend(v2, "sizeThatFits:", 480.0, 3.40282347e38);
  double v4 = v3 + 645.0;

  double v5 = 590.0;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1LL;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = -[SATVTermsDetailsViewController numberOfRows](self, "numberOfRows", a3, a4);
  if (result >= 5) {
    return 5LL;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  switch((unint64_t)[v5 row])
  {
    case 0uLL:
      double v7 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = v8;
      double v10 = @"TERMS_DETAILS_APPLE_TV_OS";
      goto LABEL_8;
    case 1uLL:
      double v12 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v9 = v8;
      double v10 = @"TERMS_DETAILS_WARRANTY";
      goto LABEL_8;
    case 2uLL:
      double v13 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v9 = v8;
      double v10 = @"TERMS_DETAILS_ICLOUD";
      goto LABEL_8;
    case 3uLL:
      double v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v9 = v8;
      double v10 = @"TERMS_DETAILS_GAME_CENTER";
      goto LABEL_8;
    case 4uLL:
      double v15 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
      double v8 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v9 = v8;
      double v10 = @"TERMS_DETAILS_PARENTAL_CONSENT";
LABEL_8:
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_1000CB560 table:@"Localizable"]);

      break;
    default:
      v11 = 0LL;
      break;
  }

  v16 = (objc_class *)objc_opt_class(&OBJC_CLASS___UITableViewCell);
  CGFloat v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue([v6 dequeueReusableCellWithIdentifier:v18 forIndexPath:v5]);

  CGRect v20 = (void *)objc_claimAutoreleasedReturnValue([v19 textLabel]);
  [v20 setText:v11];

  v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v19 textLabel]);
  [v22 setFont:v21];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v19 textLabel]);
  [v23 setMarqueeEnabled:1];

  return v19;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  switch((unint64_t)[v6 row])
  {
    case 0uLL:
      double v8 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      id v20 = (id)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"TERMS_DETAILS_APPLE_TV_SOFTWARE_LICENSE_TITLE" value:&stru_1000CB560 table:@"Localizable"]);

      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController tvOSTerms](self, "tvOSTerms"));
      goto LABEL_7;
    case 1uLL:
      double v12 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
      double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      id v20 = (id)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"TERMS_DETAILS_WARRANTY_TITLE" value:&stru_1000CB560 table:@"Localizable"]);

      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController warrantyTerms](self, "warrantyTerms"));
      goto LABEL_7;
    case 2uLL:
      double v14 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
      double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v20 = (id)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"TERMS_DETAILS_ICLOUD_TITLE" value:&stru_1000CB560 table:@"Localizable"]);

      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController iCloudTerms](self, "iCloudTerms"));
      goto LABEL_7;
    case 3uLL:
      v16 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___SATVTermsDetailsViewController));
      CGFloat v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      id v20 = (id)objc_claimAutoreleasedReturnValue( [v17 localizedStringForKey:@"TERMS_DETAILS_GAME_CENTER_TITLE" value:&stru_1000CB560 table:@"Localizable"]);

      uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController gameCenterTerms](self, "gameCenterTerms"));
LABEL_7:
      v11 = (void *)v10;
      break;
    case 4uLL:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController parentalConsentTerms](self, "parentalConsentTerms"));
      id v20 = 0LL;
      break;
    default:
      id v20 = 0LL;
      v11 = 0LL;
      break;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SATVLegalPresentation sharedInstance](&OBJC_CLASS___SATVLegalPresentation, "sharedInstance"));
  objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTermsDetailsViewController navigationController](self, "navigationController"));
  [v18 displayLegalNoticeWithTitle:v20 terms:v11 navigationController:v19];

  [v7 deselectRowAtIndexPath:v6 animated:0];
}

- (void)tableView:(id)a3 didFocusRowAtIndexPath:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 cellForRowAtIndexPath:a4]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v5 textLabel]);
  [v4 setMarqueeRunning:1];
}

- (void)tableView:(id)a3 didUnfocusRowAtIndexPath:(id)a4
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 cellForRowAtIndexPath:a4]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v5 textLabel]);
  [v4 setMarqueeRunning:0];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (int64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (void)setNumberOfRows:(int64_t)a3
{
  self->_numberOfRows = a3;
}

- (NSString)tvOSTerms
{
  return self->_tvOSTerms;
}

- (void)setTvOSTerms:(id)a3
{
}

- (NSString)warrantyTerms
{
  return self->_warrantyTerms;
}

- (void)setWarrantyTerms:(id)a3
{
}

- (NSString)iCloudTerms
{
  return self->_iCloudTerms;
}

- (void)setICloudTerms:(id)a3
{
}

- (NSString)gameCenterTerms
{
  return self->_gameCenterTerms;
}

- (void)setGameCenterTerms:(id)a3
{
}

- (NSString)parentalConsentTerms
{
  return self->_parentalConsentTerms;
}

- (void)setParentalConsentTerms:(id)a3
{
}

- (SATVHeaderView)bannerView
{
  return self->_bannerView;
}

- (void)setBannerView:(id)a3
{
}

- (SATVLegalPresentation)legalPresentation
{
  return self->_legalPresentation;
}

- (void)setLegalPresentation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end