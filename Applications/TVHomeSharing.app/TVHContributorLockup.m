@interface TVHContributorLockup
+ (id)_contentViewWithLockupLayout:(id)a3;
- (NSPersonNameComponents)personNameComponents;
- (NSString)subtitle;
- (TVHContributorLockup)initWithSimpleLayout:(id)a3;
- (TVImageProxy)imageProxy;
- (UIImage)image;
- (void)_updateFooterTitleWithPersonNameComponents:(id)a3;
- (void)setFocusedSizeIncrease:(double)a3;
- (void)setImage:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setPersonNameComponents:(id)a3;
- (void)setSubtitle:(id)a3;
@end

@implementation TVHContributorLockup

- (TVHContributorLockup)initWithSimpleLayout:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHContributorLockup;
  v3 = -[TVHSimpleLockup initWithSimpleLayout:](&v11, "initWithSimpleLayout:", a3);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](v3, "simpleFooterView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 titleLabel]);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 13LL));
    [v6 setFont:v7];

    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 subtitleLabel]);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 14LL));
    [v8 setFont:v9];
  }

  return v4;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHContributorLockup _circularContentView](self, "_circularContentView"));
  [v5 setImage:v4];
}

- (UIImage)image
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorLockup _circularContentView](self, "_circularContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)setImageProxy:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHContributorLockup _circularContentView](self, "_circularContentView"));
  [v5 setImageProxy:v4];
}

- (TVImageProxy)imageProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorLockup _circularContentView](self, "_circularContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProxy]);

  return (TVImageProxy *)v3;
}

- (void)setPersonNameComponents:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorLockup personNameComponents](self, "personNameComponents"));
  id v10 = v4;
  id v6 = v5;
  if (v6 == v10)
  {
  }

  else
  {
    if (v10 && v6)
    {
      unsigned __int8 v7 = [v10 isEqual:v6];

      if ((v7 & 1) != 0) {
        goto LABEL_9;
      }
    }

    else
    {
    }

    v8 = (NSPersonNameComponents *)[v10 copy];
    personNameComponents = self->_personNameComponents;
    self->_personNameComponents = v8;

    -[TVHContributorLockup _updateFooterTitleWithPersonNameComponents:]( self,  "_updateFooterTitleWithPersonNameComponents:",  v10);
  }

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 subtitleLabel]);
  [v5 setText:v4];
}

- (NSString)subtitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subtitleLabel]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 text]);

  return (NSString *)v4;
}

+ (id)_contentViewWithLockupLayout:(id)a3
{
  double v4 = v3;
  double v6 = v5;
  unsigned __int8 v7 = -[TVHCircularLockupContentView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHCircularLockupContentView),  "initWithFrame:",  0.0,  0.0,  v3,  v5);
  -[TVHCircularLockupContentView setFocusedSizeIncrease:](v7, "setFocusedSizeIncrease:", 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[TVHPlaceholder placeholderForType:containerSize:]( &OBJC_CLASS___TVHPlaceholder,  "placeholderForType:containerSize:",  23LL,  v4,  v6));
  -[TVHCircularLockupContentView setPlaceholder:](v7, "setPlaceholder:", v8);

  return v7;
}

- (void)setFocusedSizeIncrease:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHContributorLockup;
  -[TVHLockup setFocusedSizeIncrease:](&v6, "setFocusedSizeIncrease:");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHContributorLockup _circularContentView](self, "_circularContentView"));
  [v5 setFocusedSizeIncrease:a3];
}

- (void)_updateFooterTitleWithPersonNameComponents:(id)a3
{
  id v10 = a3;
  double v4 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", 2LL);
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v10 givenName]);
  if (v5) {
    -[NSMutableArray addObject:](v4, "addObject:", v5);
  }
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v10 familyName]);
  if (v6) {
    -[NSMutableArray addObject:](v4, "addObject:", v6);
  }
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", @" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSimpleLockup simpleFooterView](self, "simpleFooterView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 titleLabel]);
  [v9 setText:v7];
}

- (NSPersonNameComponents)personNameComponents
{
  return self->_personNameComponents;
}

- (void).cxx_destruct
{
}

@end