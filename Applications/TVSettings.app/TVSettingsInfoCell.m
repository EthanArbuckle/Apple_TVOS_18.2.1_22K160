@interface TVSettingsInfoCell
- (TVSettingsInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_newTitleLabel;
- (id)_newValueLabel;
- (void)_updateSubviewsWithTitles:(id)a3 values:(id)a4;
- (void)layoutSubviews;
- (void)setTitles:(id)a3 withValues:(id)a4;
@end

@implementation TVSettingsInfoCell

- (TVSettingsInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVSettingsInfoCell;
  v4 = -[TVSettingsInfoCell initWithStyle:reuseIdentifier:](&v11, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    titleLabels = v4->_titleLabels;
    v4->_titleLabels = v5;

    v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    valueViews = v4->_valueViews;
    v4->_valueViews = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIBackgroundConfiguration clearConfiguration]( &OBJC_CLASS___UIBackgroundConfiguration,  "clearConfiguration"));
    -[TVSettingsInfoCell setBackgroundConfiguration:](v4, "setBackgroundConfiguration:", v9);
  }

  return v4;
}

- (void)layoutSubviews
{
  v69.receiver = self;
  v69.super_class = (Class)&OBJC_CLASS___TVSettingsInfoCell;
  -[TVSettingsInfoCell layoutSubviews](&v69, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInfoCell contentView](self, "contentView"));
  [v3 bounds];
  CGFloat v64 = v5;
  recta[0] = v4;
  CGFloat v63 = v6;
  double v8 = v7;

  __int128 v67 = 0u;
  __int128 v68 = 0u;
  *(_OWORD *)&recta[3] = 0u;
  __int128 v66 = 0u;
  v9 = self->_titleLabels;
  id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &recta[3],  v70,  16LL);
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v66;
    double v13 = 0.0;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v66 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(recta[4] + 8 * (void)i) frame];
        double Width = CGRectGetWidth(v71);
        if (Width > v13) {
          double v13 = Width;
        }
      }

      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &recta[3],  v70,  16LL);
    }

    while (v11);
    double v61 = v13 + 80.0;
  }

  else
  {
    double v61 = 80.0;
  }

  v16 = (char *)-[NSMutableArray count](self->_titleLabels, "count");
  if (v16)
  {
    v17 = v16;
    v18 = 0LL;
    double v19 = 30.0;
    v20 = &OBJC_CLASS___RBSProcessPredicate_ptr;
    double v60 = 1000.0;
    CGFloat v62 = v8;
    do
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_titleLabels,  "objectAtIndexedSubscript:",  v18,  *(void *)&v60));
      [v21 frame];
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      objc_msgSend(v21, "setFrame:", 20.0, v19);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_valueViews, "objectAtIndexedSubscript:", v18));
      [v26 frame];
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      double v32 = v31;
      double v34 = v33;
      v72.origin.x = 20.0;
      v72.origin.y = v19;
      v72.size.width = v23;
      v72.size.height = v25;
      double MinY = CGRectGetMinY(v72);
      v73.origin.x = 20.0;
      v73.origin.y = v19;
      *(CGFloat *)&recta[1] = v23;
      v73.size.width = v23;
      v73.size.height = v25;
      double Height = CGRectGetHeight(v73);
      v74.origin.x = v28;
      v74.origin.y = v30;
      v74.size.width = v32;
      v74.size.height = v34;
      double v37 = CGRectGetHeight(v74);
      uint64_t v38 = objc_opt_class(v20[137]);
      if ((objc_opt_isKindOfClass(v26, v38) & 1) != 0)
      {
        CGFloat v39 = v64;
        *(void *)&v75.origin.x = recta[0];
        v75.origin.y = v64;
        CGFloat v40 = v62;
        v75.size.width = v63;
        v75.size.height = v62;
        objc_msgSend(v26, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, CGRectGetWidth(v75) - v61, v60);
        double v32 = v41;
        double v34 = v42;
        v43 = (void *)objc_claimAutoreleasedReturnValue([v21 font]);
        [v43 ascender];
        double v45 = v44;
        v46 = v20;
        v47 = (void *)objc_claimAutoreleasedReturnValue([v26 font]);
        [v47 ascender];
        double v49 = v45 - v48;

        v20 = v46;
        CGFloat v50 = v63;
        double v51 = v19 + v49;
      }

      else
      {
        double v51 = MinY + Height - v37;
        CGFloat v50 = v63;
        CGFloat v39 = v64;
        CGFloat v40 = v62;
      }

      uint64_t v52 = recta[0];
      CGFloat v53 = v39;
      CGFloat v54 = v40;
      double v55 = CGRectGetWidth(*(CGRect *)(&v50 - 2));
      v76.origin.x = v28;
      v76.origin.y = v51;
      v76.size.width = v32;
      v76.size.height = v34;
      CGFloat v56 = v55 - (CGRectGetWidth(v76) + 20.0);
      objc_msgSend(v26, "setFrame:", v56, v51, v32, v34);
      v77.origin.x = v56;
      v77.origin.y = v51;
      v77.size.width = v32;
      v77.size.height = v34;
      double v57 = CGRectGetHeight(v77);
      v78.origin.x = 20.0;
      v78.origin.y = v19;
      *(void *)&v78.size.width = recta[1];
      v78.size.height = v25;
      double v58 = v57 - CGRectGetHeight(v78);
      if (v58 <= 0.0) {
        double v59 = 60.0;
      }
      else {
        double v59 = v58 + 60.0;
      }
      double v19 = v19 + v59;

      ++v18;
    }

    while (v17 != v18);
  }

- (void)setTitles:(id)a3 withValues:(id)a4
{
}

- (void)_updateSubviewsWithTitles:(id)a3 values:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_titleLabels, "enumerateObjectsUsingBlock:", &stru_100190720);
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_valueViews, "enumerateObjectsUsingBlock:", &stru_100190740);
  if ([v30 count])
  {
    unint64_t v7 = 0LL;
    do
    {
      while (v7 >= (unint64_t)-[NSMutableArray count](self->_titleLabels, "count"))
      {
        id v8 = -[TVSettingsInfoCell _newTitleLabel](self, "_newTitleLabel");
        -[NSMutableArray addObject:](self->_titleLabels, "addObject:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInfoCell contentView](self, "contentView"));
        [v9 addSubview:v8];
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_titleLabels, "objectAtIndexedSubscript:", v7));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:v7]);
      [v10 setText:v11];

      [v10 sizeToFit];
      [v10 setHidden:0];

      ++v7;
    }

    while (v7 < (unint64_t)[v30 count]);
  }

  if ([v6 count])
  {
    unint64_t v12 = 0LL;
    double height = CGSizeZero.height;
    v14 = &OBJC_CLASS___TVSettingsHomeKitTCCViewController;
    while (1)
    {
      v15 = (objc_class *)v14;
      v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v12]);
      while (v12 >= (unint64_t)-[NSMutableArray count](self->_valueViews, "count"))
      {
        id v17 = -[TVSettingsInfoCell _newValueLabel](self, "_newValueLabel");
        -[NSMutableArray addObject:](self->_valueViews, "addObject:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInfoCell contentView](self, "contentView"));
        [v18 addSubview:v17];
      }

      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString);
      if ((objc_opt_isKindOfClass(v16, v19) & 1) != 0) {
        break;
      }
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___UIImage);
      v14 = (__objc2_class *)v15;
      if ((objc_opt_isKindOfClass(v16, v24) & 1) != 0)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_valueViews, "objectAtIndexedSubscript:", v12));
        uint64_t v25 = objc_opt_class(&v15[190]);
        if ((objc_opt_isKindOfClass(v20, v25) & 1) == 0)
        {
          [v20 removeFromSuperview];
          id v26 = objc_alloc_init(v15 + 190);

          [v26 setContentMode:1];
          [v26 setClipsToBounds:1];
          -[NSMutableArray setObject:atIndexedSubscript:](self->_valueViews, "setObject:atIndexedSubscript:", v26, v12);
          double v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsInfoCell contentView](self, "contentView"));
          [v27 addSubview:v26];

          v20 = v26;
          v14 = (__objc2_class *)v15;
        }

        [v20 setImage:v16];
        [v20 setHidden:0];
        objc_msgSend(v20, "sizeThatFits:", CGSizeZero.width, height);
        objc_msgSend(v20, "setFrame:", 0.0, 0.0, v28, v29);
        goto LABEL_19;
      }

- (id)_newTitleLabel
{
  v2 = objc_alloc_init(&OBJC_CLASS___UILabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  -[UILabel setFont:](v2, "setFont:", v3);

  if (qword_1001E16C8 != -1) {
    dispatch_once(&qword_1001E16C8, &stru_100190760);
  }
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 traitCollection]);
  id v6 = [v5 userInterfaceStyle];

  BOOL v7 = v6 == (id)2 || v6 == (id)1000;
  id v8 = &qword_1001E16C0;
  if (!v7) {
    id v8 = &qword_1001E16B8;
  }
  -[UILabel setTextColor:](v2, "setTextColor:", *v8);
  return v2;
}

- (id)_newValueLabel
{
  v3 = objc_alloc_init(&OBJC_CLASS___UILabel);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleSubtitle1));
  -[UILabel setFont:](v3, "setFont:", v4);

  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
  -[UILabel setTextColor:](v3, "setTextColor:", v5);

  -[UILabel setTextAlignment:]( v3,  "setTextAlignment:",  2LL * (-[TVSettingsInfoCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") != (id)1));
  -[UILabel setNumberOfLines:](v3, "setNumberOfLines:", 0LL);
  -[UILabel setLineBreakMode:](v3, "setLineBreakMode:", 0LL);
  return v3;
}

- (void).cxx_destruct
{
}

@end