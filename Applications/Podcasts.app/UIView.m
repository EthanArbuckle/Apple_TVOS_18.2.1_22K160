@interface UIView
+ (BOOL)mt_areMarginsGenerousForWidth:(double)a3;
+ (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3;
+ (double)mt_horizontalMarginsForWidth:(double)a3;
- (BOOL)mt_areMarginsGenerous;
- (BOOL)mt_enableAutomaticRTLMirroringForSubviews;
- (BOOL)mt_isDarkBackground;
- (BOOL)mt_isExcludedFromAutomaticRTLMirroring;
- (BOOL)mt_isRTL;
- (UIEdgeInsets)mt_layoutMargins;
- (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3;
- (id)mt_artworkBorderColor;
- (id)mt_primaryTextColor;
- (id)mt_recursivelyFindFirstViewMeetingCriteria:(id)a3;
- (id)mt_secondaryTextColor;
- (id)mt_selectedCellColor;
- (id)mt_separatorColor;
- (id)mt_shouldRTLMirrorStackDepth;
- (void)mt_RTLMirrorIfNeeded;
- (void)mt_setEnableAutomaticRTLMirroringForSubviews:(BOOL)a3;
- (void)mt_setExcludedFromAutomaticRTLMirroring:(BOOL)a3;
- (void)mt_setShouldRTLMirror;
- (void)mt_setShouldRTLMirrorStackDepth:(id)a3;
@end

@implementation UIView

- (UIEdgeInsets)mt_layoutMargins
{
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3
{
  double v6 = v5;
  double v8 = v7;
  objc_msgSend((id)objc_opt_class(self), "mt_horizontalMarginsForWidth:", a3);
  double v10 = v9;
  double v11 = v6;
  double v12 = v8;
  double v13 = v10;
  result.right = v13;
  result.bottom = v12;
  result.left = v10;
  result.top = v11;
  return result;
}

- (BOOL)mt_areMarginsGenerous
{
  double v3 = (void *)objc_opt_class(self);
  -[UIView bounds](self, "bounds");
  return objc_msgSend(v3, "mt_areMarginsGenerousForWidth:", v4);
}

+ (BOOL)mt_areMarginsGenerousForWidth:(double)a3
{
  return a3 > 385.0;
}

+ (double)mt_horizontalMarginsForWidth:(double)a3
{
  unsigned int v3 = objc_msgSend(a1, "mt_areMarginsGenerousForWidth:", a3);
  double result = 16.0;
  if (v3) {
    return 20.0;
  }
  return result;
}

+ (UIEdgeInsets)mt_layoutMarginsForWidth:(double)a3
{
  unsigned int v3 = objc_msgSend(a1, "mt_areMarginsGenerousForWidth:", a3);
  double v4 = 20.0;
  if (!v3) {
    double v4 = 16.0;
  }
  double v5 = 8.0;
  double v6 = 8.0;
  double v7 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v4;
  result.top = v5;
  return result;
}

- (BOOL)mt_isRTL
{
  return (id)+[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:]( &OBJC_CLASS___UIView,  "userInterfaceLayoutDirectionForSemanticContentAttribute:",  -[UIView semanticContentAttribute](self, "semanticContentAttribute")) == (id)1;
}

- (id)mt_recursivelyFindFirstViewMeetingCriteria:(id)a3
{
  double v4 = (unsigned int (**)(id, UIView *))a3;
  if (v4[2](v4, self))
  {
    double v5 = self;
  }

  else
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0LL));
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        double v10 = 0LL;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v13 + 1) + 8 * (void)v10),  "mt_recursivelyFindFirstViewMeetingCriteria:",  v4));
          if (v11)
          {
            double v5 = (UIView *)v11;

            goto LABEL_13;
          }

          double v10 = (char *)v10 + 1;
        }

        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    double v5 = 0LL;
  }

- (BOOL)mt_isDarkBackground
{
  if (-[UIView isFocused](self, "isFocused")) {
    return 0;
  }
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](self, "traitCollection"));
  BOOL v3 = [v4 userInterfaceStyle] == (id)2;

  return v3;
}

- (id)mt_primaryTextColor
{
  return +[UIColor primaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "primaryTextColorForDarkBackground:",  -[UIView mt_isDarkBackground](self, "mt_isDarkBackground"));
}

- (id)mt_secondaryTextColor
{
  return +[UIColor secondaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "secondaryTextColorForDarkBackground:",  -[UIView mt_isDarkBackground](self, "mt_isDarkBackground"));
}

- (id)mt_artworkBorderColor
{
  return +[UIColor artworkBorderColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "artworkBorderColorForDarkBackground:",  -[UIView mt_isDarkBackground](self, "mt_isDarkBackground"));
}

- (id)mt_separatorColor
{
  return +[UIColor separatorColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "separatorColorForDarkBackground:",  -[UIView mt_isDarkBackground](self, "mt_isDarkBackground"));
}

- (id)mt_selectedCellColor
{
  return +[UIColor colorWithWhite:alpha:]( &OBJC_CLASS___UIColor,  "colorWithWhite:alpha:",  (double)-[UIView mt_isDarkBackground](self, "mt_isDarkBackground"),  0.2);
}

- (void)mt_setShouldRTLMirror
{
  if (-[UIView mt_isRTL](self, "mt_isRTL"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[UIView mt_shouldRTLMirrorStackDepth](self, "mt_shouldRTLMirrorStackDepth"));
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v4 integerValue] + 1));
    -[UIView mt_setShouldRTLMirrorStackDepth:](self, "mt_setShouldRTLMirrorStackDepth:", v3);
  }

- (void)mt_RTLMirrorIfNeeded
{
  if (-[UIView mt_isRTL](self, "mt_isRTL"))
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView mt_shouldRTLMirrorStackDepth](self, "mt_shouldRTLMirrorStackDepth"));
    uint64_t v4 = (uint64_t)[v3 integerValue];

    uint64_t v5 = v4 <= 1 ? 0LL : v4 - 1;
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v5));
    -[UIView mt_setShouldRTLMirrorStackDepth:](self, "mt_setShouldRTLMirrorStackDepth:", v6);

    if (v4 <= 1)
    {
      -[UIView bounds](self, "bounds");
      double MaxX = CGRectGetMaxX(v31);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
      [v8 scale];
      double v10 = v9;

      __int128 v28 = 0u;
      __int128 v29 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0LL));
      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v27;
        do
        {
          for (i = 0LL; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v27 != v14) {
              objc_enumerationMutation(v11);
            }
            __int128 v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
            if ((objc_msgSend(v16, "mt_isExcludedFromAutomaticRTLMirroring") & 1) == 0)
            {
              [v16 frame];
              CGFloat x = v32.origin.x;
              double y = v32.origin.y;
              double width = v32.size.width;
              double height = v32.size.height;
              double v21 = MaxX - CGRectGetMinX(v32);
              v33.origin.CGFloat x = x;
              v33.origin.double y = y;
              v33.size.double width = width;
              v33.size.double height = height;
              objc_msgSend(v16, "setFrame:", round(v10 * (v21 - CGRectGetWidth(v33))) / v10, y, width, height);
            }
          }

          id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }

        while (v13);
      }

      uint64_t v22 = objc_opt_class(&OBJC_CLASS___UITableViewCell);
      if ((objc_opt_isKindOfClass(self, v22) & 1) != 0
        || (uint64_t v23 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell), (objc_opt_isKindOfClass(self, v23) & 1) != 0)
        || (uint64_t v24 = objc_opt_class(&OBJC_CLASS___UIVisualEffectView), (objc_opt_isKindOfClass(self, v24) & 1) != 0))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView contentView](self, "contentView"));
        objc_msgSend(v25, "mt_RTLMirrorIfNeeded");
      }
    }
  }

- (void)mt_setExcludedFromAutomaticRTLMirroring:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1002B6BE0, v4, (void *)1);
}

- (BOOL)mt_isExcludedFromAutomaticRTLMirroring
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1002B6BE0);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)mt_setEnableAutomaticRTLMirroringForSubviews:(BOOL)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  objc_setAssociatedObject(self, &unk_1002B6BE1, v4, (void *)1);
}

- (BOOL)mt_enableAutomaticRTLMirroringForSubviews
{
  id AssociatedObject = objc_getAssociatedObject(self, &unk_1002B6BE1);
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)mt_setShouldRTLMirrorStackDepth:(id)a3
{
}

- (id)mt_shouldRTLMirrorStackDepth
{
  return objc_getAssociatedObject(self, &unk_1002B6BE2);
}

@end