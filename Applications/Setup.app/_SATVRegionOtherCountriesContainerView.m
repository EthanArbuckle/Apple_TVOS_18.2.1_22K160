@interface _SATVRegionOtherCountriesContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SATVHeaderView)otherCountriesHeader;
- (_SATVRegionOtherCountriesContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _SATVRegionOtherCountriesContainerView

- (_SATVRegionOtherCountriesContainerView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS____SATVRegionOtherCountriesContainerView;
  v3 = -[_SATVRegionOtherCountriesContainerView initWithFrame:]( &v25,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userSetSystemLanguageCode]);
    id v6 = +[BYLocaleDataSource newWithLanguage:](&OBJC_CLASS___BYLocaleDataSource, "newWithLanguage:", v5);

    -[_SATVRegionOtherCountriesContainerView setBackgroundColor:](v3, "setBackgroundColor:", 0LL);
    v7 = -[SATVHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    otherCountriesHeader = v3->_otherCountriesHeader;
    v3->_otherCountriesHeader = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 regionOtherStringWithUserSelectedLanguageCode]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedUppercaseString]);

    v12 = objc_alloc(&OBJC_CLASS___NSAttributedString);
    CFStringRef v26 = kCTLanguageAttributeName;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 language]);
    v27 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
    v15 = -[NSAttributedString initWithString:attributes:](v12, "initWithString:attributes:", v11, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v3->_otherCountriesHeader, "titleLabel"));
    [v16 setAttributedText:v15];

    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_stepViewSubtitleDynamicColor]( &OBJC_CLASS___UIColor,  "tvsk_stepViewSubtitleDynamicColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v3->_otherCountriesHeader, "titleLabel"));
    [v18 setTextColor:v17];

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewSubtitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewSubtitleFont"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v3->_otherCountriesHeader, "titleLabel"));
    [v20 setFont:v19];

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SATVInternationalUtility sharedInstance](&OBJC_CLASS___SATVInternationalUtility, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v21 userSetSystemLanguageCode]);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v3->_otherCountriesHeader, "titleLabel"));
    [v23 setAccessibilityLanguage:v22];

    -[_SATVRegionOtherCountriesContainerView addSubview:](v3, "addSubview:", v3->_otherCountriesHeader);
  }

  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____SATVRegionOtherCountriesContainerView;
  -[_SATVRegionOtherCountriesContainerView layoutSubviews](&v11, "layoutSubviews");
  -[_SATVRegionOtherCountriesContainerView bounds](self, "bounds");
  double v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVRegionOtherCountriesContainerView otherCountriesHeader](self, "otherCountriesHeader"));
  objc_msgSend(v5, "sizeThatFits:", v4, 3.40282347e38);
  double v7 = v6;
  double v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_SATVRegionOtherCountriesContainerView otherCountriesHeader](self, "otherCountriesHeader"));
  objc_msgSend(v10, "setFrame:", 0.0, 30.0, v7, v9);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( -[_SATVRegionOtherCountriesContainerView otherCountriesHeader]( self,  "otherCountriesHeader",  a3.width,  a3.height));
  objc_msgSend(v4, "sizeThatFits:", width, 3.40282347e38);
  double v6 = v5;
  double v8 = v7;

  double v9 = v8 + 30.0;
  double v10 = v6;
  result.height = v9;
  result.double width = v10;
  return result;
}

- (SATVHeaderView)otherCountriesHeader
{
  return self->_otherCountriesHeader;
}

- (void).cxx_destruct
{
}

@end