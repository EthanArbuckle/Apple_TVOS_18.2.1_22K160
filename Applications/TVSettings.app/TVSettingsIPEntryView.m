@interface TVSettingsIPEntryView
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)digitViews;
- (NSArray)dotViews;
- (NSString)IPAddress;
- (NSString)ipString;
- (TVSettingsIPEntryView)initWithIPAddress:(id)a3;
- (TVSettingsIPEntryViewDelegate)delegate;
- (UIButton)doneButton;
- (id)preferredFocusEnvironments;
- (int64_t)_octetForBlockIndex:(unint64_t)a3;
- (void)_updateDigitLimits;
- (void)doneButton:(id)a3;
- (void)layoutSubviews;
- (void)passcodeDigitView:(id)a3 didChangeText:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDigitViews:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setDotViews:(id)a3;
- (void)setIPAddress:(id)a3;
- (void)setIpString:(id)a3;
@end

@implementation TVSettingsIPEntryView

- (TVSettingsIPEntryView)initWithIPAddress:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TVSettingsIPEntryView;
  v5 = -[TVSettingsIPEntryView init](&v23, "init");
  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
    doneButton = v5->_doneButton;
    v5->_doneButton = (UIButton *)v6;

    v8 = v5->_doneButton;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedStringForKey:@"Done" value:&stru_100195DD8 table:0]);
    -[UIButton setTitle:forState:](v8, "setTitle:forState:", v10, 0LL);

    -[UIButton addTarget:action:forControlEvents:]( v5->_doneButton,  "addTarget:action:forControlEvents:",  v5,  "doneButton:",  0x2000LL);
    -[TVSettingsIPEntryView addSubview:](v5, "addSubview:", v5->_doneButton);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
    uint64_t v13 = 12LL;
    do
    {
      v14 = objc_alloc_init(&OBJC_CLASS___TVSettingsPasscodeDigitView);
      -[TVSettingsPasscodeDigitView setDelegate:](v14, "setDelegate:", v5);
      [v12 pointSize];
      -[TVSettingsPasscodeDigitView setFontSize:](v14, "setFontSize:");
      [v11 addObject:v14];
      -[TVSettingsIPEntryView addSubview:](v5, "addSubview:", v14);

      --v13;
    }

    while (v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    uint64_t v16 = 3LL;
    do
    {
      v17 = objc_alloc_init(&OBJC_CLASS___UILabel);
      -[UILabel setOpaque:](v17, "setOpaque:", 0LL);
      -[UILabel setTextAlignment:](v17, "setTextAlignment:", 1LL);
      -[UILabel setFont:](v17, "setFont:", v12);
      -[UILabel setText:](v17, "setText:", @".");
      -[UILabel sizeToFit](v17, "sizeToFit");
      [v15 addObject:v17];
      -[TVSettingsIPEntryView addSubview:](v5, "addSubview:", v17);

      --v16;
    }

    while (v16);
    v18 = (NSArray *)[v11 copy];
    digitViews = v5->_digitViews;
    v5->_digitViews = v18;

    v20 = (NSArray *)[v15 copy];
    dotViews = v5->_dotViews;
    v5->_dotViews = v20;

    -[TVSettingsIPEntryView setIPAddress:](v5, "setIPAddress:", v4);
  }

  return v5;
}

- (BOOL)canBecomeFocused
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 focusedView]);

  LOBYTE(self) = [v4 isDescendantOfView:self] ^ 1;
  return (char)self;
}

- (id)preferredFocusEnvironments
{
  if (self->_digitViews) {
    return self->_digitViews;
  }
  else {
    return &__NSArray0__struct;
  }
}

- (void)layoutSubviews
{
  CGFloat x = v40.origin.x;
  CGFloat y = v40.origin.y;
  CGFloat width = v40.size.width;
  CGFloat height = v40.size.height;
  double v7 = floor((CGRectGetWidth(v40) + -152.0 + -96.0) / 12.0);
  if (v7 <= 64.0) {
    double v8 = v7;
  }
  else {
    double v8 = 64.0;
  }
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v41);
  if (v9 > 150.0) {
    double v9 = 150.0;
  }
  CGFloat v38 = v9;
  CGFloat rect = height;
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double v10 = round((CGRectGetWidth(v42) - (v8 * 12.0 + 88.0 + 160.0)) * 0.5);
  if (-[NSArray count](self->_digitViews, "count"))
  {
    uint64_t v11 = 0LL;
    unint64_t v12 = 0LL;
    double v37 = y;
    double v13 = v38;
    do
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_digitViews,  "objectAtIndexedSubscript:",  v12,  *(void *)&v37));
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = width;
      v43.size.CGFloat height = rect;
      double MinY = CGRectGetMinY(v43);
      objc_msgSend(v14, "setFrame:", v10, MinY, v8, v13);
      double v16 = v8 + 8.0 + v10;
      v17 = (char *)-[NSArray count](self->_digitViews, "count") - 1;
      if (3 * (v12 / 3) + 2 == v12 && v12 != (void)v17)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_dotViews, "objectAtIndexedSubscript:", v11));
        [v19 frame];
        double v20 = width;
        double v21 = x;
        CGFloat v23 = v22;
        CGFloat v25 = v24;
        v44.origin.CGFloat x = v10;
        v44.origin.CGFloat y = MinY;
        v44.size.CGFloat width = v8;
        v44.size.CGFloat height = v38;
        double MaxY = CGRectGetMaxY(v44);
        v45.size.CGFloat width = 20.0;
        v45.origin.CGFloat x = v8 + 8.0 + v10;
        v45.origin.CGFloat y = v23;
        CGFloat x = v21;
        CGFloat width = v20;
        double v13 = v38;
        v45.size.CGFloat height = v25;
        CGFloat v27 = CGRectGetHeight(v45);
        double v28 = v25;
        CGFloat y = v37;
        objc_msgSend(v19, "setFrame:", v16, MaxY - v27 + -24.0, 20.0, v28);
        double v16 = v16 + 28.0;
        ++v11;
      }

      ++v12;
      double v10 = v16;
    }

    while (v12 < -[NSArray count](self->_digitViews, "count"));
  }

  else
  {
    double v16 = v10;
  }

  CGFloat v29 = v16 + 32.0;
  -[UIButton sizeToFit](self->_doneButton, "sizeToFit");
  -[UIButton frame](self->_doneButton, "frame");
  CGFloat v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = rect;
  double v36 = CGRectGetHeight(v46);
  v47.origin.CGFloat x = v29;
  v47.origin.CGFloat y = v31;
  v47.size.CGFloat width = v33;
  v47.size.CGFloat height = v35;
  -[UIButton setFrame:](self->_doneButton, "setFrame:", v29, round((v36 - CGRectGetHeight(v47)) * 0.5), v33, v35);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 1108.0;
  double v4 = 150.0;
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)setIPAddress:(id)a3
{
  id v19 = (id)objc_claimAutoreleasedReturnValue([a3 componentsSeparatedByString:@"."]);
  v18 = -[NSMutableString initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableString), "initWithCapacity:", 12LL);
  uint64_t v4 = 0LL;
  for (unint64_t i = 0LL; i != 4; ++i)
  {
    if (i >= (unint64_t)[v19 count])
    {
      uint64_t v7 = 0LL;
    }

    else
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndexedSubscript:i]);
      uint64_t v7 = (uint64_t)[v6 integerValue];
    }

    uint64_t v8 = 255LL;
    if (v7 < 255) {
      uint64_t v8 = v7;
    }
    unint64_t v9 = v8 & ~(v8 >> 63);
    uint64_t v20 = v4;
    uint64_t v10 = v4;
    unint64_t v11 = 3LL;
    do
    {
      unint64_t v12 = (unint64_t)__exp10((double)v11--);
      unint64_t v13 = v9 % v12 / (unint64_t)__exp10((double)v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_digitViews, "objectAtIndexedSubscript:", v10));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%lu", v13));
      [v14 setText:v15];

      ++v10;
    }

    while (v11);
    -[NSMutableString appendFormat:](v18, "appendFormat:", @"%03ld", v9);
    uint64_t v4 = v20 + 3;
  }

  double v16 = (NSString *)-[NSMutableString copy](v18, "copy");
  ipString = self->_ipString;
  self->_ipString = v16;

  -[TVSettingsIPEntryView _updateDigitLimits](self, "_updateDigitLimits");
}

- (NSString)IPAddress
{
  double v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%ld",  -[TVSettingsIPEntryView _octetForBlockIndex:](self, "_octetForBlockIndex:", i)));
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", @"."));

  return (NSString *)v6;
}

- (void)passcodeDigitView:(id)a3 didChangeText:(id)a4
{
  digitViews = self->_digitViews;
  id v7 = a4;
  uint64_t v8 = (NSString *)objc_claimAutoreleasedReturnValue( -[NSString stringByReplacingCharactersInRange:withString:]( self->_ipString,  "stringByReplacingCharactersInRange:withString:",  -[NSArray indexOfObject:](digitViews, "indexOfObject:", a3),  1LL,  v7));

  ipString = self->_ipString;
  self->_ipString = v8;

  -[TVSettingsIPEntryView _updateDigitLimits](self, "_updateDigitLimits");
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v10, "ipEntryViewIPAddressDidChange:") & 1) != 0) {
    [v10 ipEntryViewIPAddressDidChange:self];
  }
}

- (void)doneButton:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsIPEntryView delegate](self, "delegate", a3));
  if ((objc_opt_respondsToSelector(v4, "ipEntryViewDidFinishEditing:") & 1) != 0) {
    [v4 ipEntryViewDidFinishEditing:self];
  }
}

- (void)_updateDigitLimits
{
  uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  v15 = self;
  uint64_t v16 = 16LL;
  do
  {
    id v4 = v15;
    uint64_t v5 = v16;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class objectAtIndexedSubscript:]( (&v15->super.super.super.isa)[(unint64_t)v16 / 8],  "objectAtIndexedSubscript:",  v2,  v15,  v16));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&v4->super.super.super.isa + v5) objectAtIndexedSubscript:v2 + 1]);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)((char *)&v4->super.super.super.isa + v5) objectAtIndexedSubscript:v2 + 2]);
    uint64_t v9 = -[TVSettingsIPEntryView _octetForBlockIndex:](v4, "_octetForBlockIndex:", v3);
    uint64_t v10 = v9 % 100;
    [v6 setMaxDigitValue:2];
    unint64_t v11 = v9 - 200;
    if (v11 >= 0x64) {
      uint64_t v12 = 9LL;
    }
    else {
      uint64_t v12 = 5LL;
    }
    [v7 setMaxDigitValue:v12];
    if (v10 <= 49 || v11 >= 0x64) {
      uint64_t v14 = 9LL;
    }
    else {
      uint64_t v14 = 5LL;
    }
    [v8 setMaxDigitValue:v14];

    ++v3;
    v2 += 3LL;
  }

  while (v3 != 4);
}

- (int64_t)_octetForBlockIndex:(unint64_t)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringWithRange:](self->_ipString, "substringWithRange:", 3 * a3, 3LL));
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (TVSettingsIPEntryViewDelegate)delegate
{
  return (TVSettingsIPEntryViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)digitViews
{
  return self->_digitViews;
}

- (void)setDigitViews:(id)a3
{
}

- (NSArray)dotViews
{
  return self->_dotViews;
}

- (void)setDotViews:(id)a3
{
}

- (NSString)ipString
{
  return self->_ipString;
}

- (void)setIpString:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end