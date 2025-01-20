@interface TVPSharedPSLikeViewCell
+ (double)maxCellHeightWithLikes:(id)a3 maxWidth:(double)a4 isLikedByMe:(BOOL)a5;
+ (id)_getFormattedLikedUsersString:(id)a3 isLikedByMe:(BOOL)a4;
- (BOOL)isLiked;
- (NSArray)likedUsers;
- (UIImageView)likeDislikeImageView;
- (UILabel)likeDislikeLabel;
- (UIView)lineDivider;
- (void)layoutSubviews;
- (void)setIsLiked:(BOOL)a3;
- (void)setLikeDislikeImageView:(id)a3;
- (void)setLikeDislikeLabel:(id)a3;
- (void)setLikedUsers:(id)a3;
- (void)setLikedUsers:(id)a3 isLikedByMe:(BOOL)a4;
- (void)setLineDivider:(id)a3;
@end

@implementation TVPSharedPSLikeViewCell

+ (double)maxCellHeightWithLikes:(id)a3 maxWidth:(double)a4 isLikedByMe:(BOOL)a5
{
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVPSharedPSLikeViewCell _getFormattedLikedUsersString:isLikedByMe:]( &OBJC_CLASS___TVPSharedPSLikeViewCell,  "_getFormattedLikedUsersString:isLikedByMe:",  a3,  a5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v6,  v7,  a4 + -61.0);
  double v9 = v8;

  return v9 + 18.0;
}

- (void)setLikedUsers:(id)a3 isLikedByMe:(BOOL)a4
{
  BOOL v4 = a4;
  id v27 = a3;
  -[TVPSharedPSLikeViewCell setIsLiked:](self, "setIsLiked:", v4);
  -[TVPSharedPSLikeViewCell setLikedUsers:](self, "setLikedUsers:", v27);
  likeDislikeLabel = self->_likeDislikeLabel;
  if (!likeDislikeLabel
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel superview](likeDislikeLabel, "superview")),
        v7,
        !v7))
  {
    double v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
    double v9 = self->_likeDislikeLabel;
    self->_likeDislikeLabel = v8;

    v10 = self->_likeDislikeLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = self->_likeDislikeLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    -[UILabel setNumberOfLines:](self->_likeDislikeLabel, "setNumberOfLines:");
    -[UILabel setTextAlignment:](self->_likeDislikeLabel, "setTextAlignment:", 4LL);
    -[TVPSharedPSLikeViewCell addSubview:](self, "addSubview:", self->_likeDislikeLabel);
  }

  if (!self->_likeDislikeImageView)
  {
    v14 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    likeDislikeImageView = self->_likeDislikeImageView;
    self->_likeDislikeImageView = v14;

    -[UIImageView setContentMode:](self->_likeDislikeImageView, "setContentMode:", 4LL);
    -[TVPSharedPSLikeViewCell addSubview:](self, "addSubview:", self->_likeDislikeImageView);
  }

  if (!self->_lineDivider)
  {
    v16 = objc_alloc_init(&OBJC_CLASS___UIView);
    lineDivider = self->_lineDivider;
    self->_lineDivider = v16;

    v18 = self->_lineDivider;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.5, 1.0));
    -[UIView setBackgroundColor:](v18, "setBackgroundColor:", v19);

    -[TVPSharedPSLikeViewCell addSubview:](self, "addSubview:", self->_lineDivider);
  }

  if (v4) {
    v20 = @"new-smile-on";
  }
  else {
    v20 = @"new-smile-off";
  }
  v21 = self->_likeDislikeImageView;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v20));
  -[UIImageView setImage:](v21, "setImage:", v22);

  v23 = self->_likeDislikeLabel;
  id v25 = objc_msgSend((id)objc_opt_class(self, v24), "_getFormattedLikedUsersString:isLikedByMe:", v27, v4);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  -[UILabel setText:](v23, "setText:", v26);

  -[TVPSharedPSLikeViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TVPSharedPSLikeViewCell;
  -[TVPSharedPSLikeViewCell layoutSubviews](&v27, "layoutSubviews");
  -[TVPSharedPSLikeViewCell bounds](self, "bounds");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_likeDislikeImageView, "image"));
  [v11 size];
  double v13 = v12;
  double v15 = v14;

  id v16 = -[TVPSharedPSLikeViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  double v17 = 0.0;
  if (v16 == (id)1)
  {
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    double v17 = CGRectGetMaxX(v28) - v13;
  }

  -[UIImageView setFrame:](self->_likeDislikeImageView, "setFrame:", v17, 0.0, v13, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_likeDislikeLabel, "text"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVPThemeManager caption1Font](&OBJC_CLASS___TVPThemeManager, "caption1Font"));
  -[UIImageView bounds](self->_likeDislikeImageView, "bounds");
  +[TVPPhotoUtilities getAttributedTextSize:font:maxWidth:]( &OBJC_CLASS___TVPPhotoUtilities,  "getAttributedTextSize:font:maxWidth:",  v18,  v19,  v8 - (v20 + 17.0));
  double v22 = v21;
  double v24 = v23;

  if (v16 == (id)1)
  {
    -[UIImageView frame](self->_likeDislikeImageView, "frame");
    double v25 = CGRectGetMinX(v29) + -17.0 - v22;
  }

  else
  {
    -[UIImageView bounds](self->_likeDislikeImageView, "bounds");
    double v25 = v26 + 17.0;
  }

  -[UILabel setFrame:](self->_likeDislikeLabel, "setFrame:", v25, 0.0, v22, v24);
  -[UIView setFrame:](self->_lineDivider, "setFrame:", 0.0, v24 + 17.0, v8, 1.0);
}

+ (id)_getFormattedLikedUsersString:(id)a3 isLikedByMe:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  CGFloat v6 = v5;
  if (v5 && [v5 count])
  {
    id v7 = [v6 count];
    if (v7 == (id)2)
    {
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:1]);
      double v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      id v16 = v15;
      if (v4) {
        double v17 = @"youAndTwoUsersLikeFormatString";
      }
      else {
        double v17 = @"twoUsersLikeFormatString";
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue([v15 localizedStringForKey:v17 value:&stru_1000CC6C8 table:0]);
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v18, v9, v14));
    }

    else
    {
      if (v7 == (id)1)
      {
        double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        double v9 = v8;
        if (v4) {
          CGFloat v10 = @"youAndSingleUserLikeFormatString";
        }
        else {
          CGFloat v10 = @"singleUserLikeFormatString";
        }
        double v22 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedStringForKey:v10 value:&stru_1000CC6C8 table:0]);
        double v23 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:0]);
        double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v22, v23));

        goto LABEL_22;
      }

      double v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", (char *)objc_msgSend( v6,  "count") - 1));
      double v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v6));
      objc_msgSend(v14, "removeObjectAtIndex:", (char *)objc_msgSend(v14, "count") - 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      double v20 = v19;
      if (v4) {
        double v21 = @"youAndMultipleUsersLikeFormatString";
      }
      else {
        double v21 = @"multipleUsersLikeFormatString";
      }
      double v24 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedStringForKey:v21 value:&stru_1000CC6C8 table:0]);
      double v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", @", "));
      double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v24, v25, v9));
    }

    goto LABEL_22;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  double v9 = v11;
  if (v4) {
    double v12 = @"youLikeThisFormatString";
  }
  else {
    double v12 = @"sampleLikeString";
  }
  double v13 = (void *)objc_claimAutoreleasedReturnValue([v11 localizedStringForKey:v12 value:&stru_1000CC6C8 table:0]);
LABEL_22:

  return v13;
}

- (NSArray)likedUsers
{
  return self->_likedUsers;
}

- (void)setLikedUsers:(id)a3
{
}

- (UILabel)likeDislikeLabel
{
  return self->_likeDislikeLabel;
}

- (void)setLikeDislikeLabel:(id)a3
{
}

- (UIImageView)likeDislikeImageView
{
  return self->_likeDislikeImageView;
}

- (void)setLikeDislikeImageView:(id)a3
{
}

- (UIView)lineDivider
{
  return self->_lineDivider;
}

- (void)setLineDivider:(id)a3
{
}

- (BOOL)isLiked
{
  return self->_isLiked;
}

- (void)setIsLiked:(BOOL)a3
{
  self->_isLiked = a3;
}

- (void).cxx_destruct
{
}

@end