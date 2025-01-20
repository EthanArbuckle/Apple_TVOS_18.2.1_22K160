@interface TVMusicTableViewCell
- (BOOL)_isFocusedInDarkMode;
- (UIView)badgeView;
- (id)_defaultDetailTextLabelColor;
- (id)_defaultTextLabelColor;
- (id)_detailTextLabelColor;
- (id)_focusedInDarkModeTextLabelColor;
- (id)_textLabelColor;
- (int64_t)placeholderAssetType;
- (void)_setAccessoryViewColor;
- (void)_setAccessoryViewWithTextLabelColor:(id)a3 detailTextLabelColor:(id)a4;
- (void)_updateColors;
- (void)_updateColorsWithTextLabelColor:(id)a3 detailTextLabelColor:(id)a4;
- (void)_updatePlaceholderImageIfNeeded;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setAccessoryView:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setPlaceholderAssetType:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVMusicTableViewCell

- (void)layoutSubviews
{
  v70.receiver = self;
  v70.super_class = (Class)&OBJC_CLASS___TVMusicTableViewCell;
  -[TVTableViewCell layoutSubviews](&v70, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell contentView](self, "contentView"));
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell textLabel](self, "textLabel"));
  [v12 frame];
  double v14 = v13;
  double v68 = v15;
  double v69 = v16;
  double v18 = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell contentView](self, "contentView"));
  [v19 frame];
  double v21 = v20;

  id v22 = -[TVMusicTableViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell badgeView](self, "badgeView"));

  CGFloat v66 = v9;
  CGFloat v67 = v11;
  CGFloat v65 = v18;
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell badgeView](self, "badgeView"));
    [v24 frame];
    double v26 = v25;
    double v28 = v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell contentView](self, "contentView"));
    [v29 frame];
    double v31 = v30;
    double v62 = v7;
    double v32 = v14;
    double v33 = v5;
    double v35 = v34;
    double v37 = v36;

    double v38 = v35 - v26 + -15.0;
    if (v22 == (id)1) {
      double v39 = 15.0;
    }
    else {
      double v39 = v35 - v26 + -15.0;
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell badgeView](self, "badgeView"));
    double v41 = v39;
    CGFloat v5 = v33;
    double v14 = v32;
    CGFloat v7 = v62;
    objc_msgSend(v40, "setFrame:", v41, floor(v31 + (v37 - v28) * 0.5), v26, v28);

    double v42 = v38 + -10.0;
  }

  else
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell accessoryView](self, "accessoryView"));

    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell accessoryView](self, "accessoryView"));
      [v44 frame];
      double v46 = v45;
      CGFloat v48 = v47;
      CGFloat v63 = v49;
      CGFloat v61 = v50;

      if (v22 == (id)1)
      {
        v71.origin.x = v5;
        v71.origin.y = v7;
        v71.size.width = v9;
        v71.size.height = v11;
        CGFloat rect = v48;
        double MaxX = CGRectGetMaxX(v71);
        v72.origin.x = v46;
        v72.origin.y = v48;
        v72.size.width = v63;
        v72.size.height = v61;
        double v60 = MaxX - CGRectGetWidth(v72);
        v73.origin.x = v46;
        v73.origin.y = v48;
        v73.size.width = v63;
        v73.size.height = v61;
        double v46 = v60 - CGRectGetMinX(v73);
      }

      double v42 = v46 + -15.0;
    }

    else
    {
      double v42 = v21 - v14;
    }
  }

  if (v22 == (id)1)
  {
    double v64 = v42;
    v74.origin.x = v5;
    v74.origin.y = v7;
    v74.size.height = v67;
    v74.size.width = v66;
    double v51 = CGRectGetMaxX(v74);
    v75.origin.x = v14;
    v75.origin.y = v68;
    v75.size.width = v65;
    v75.size.height = v69;
    double v52 = v51 - CGRectGetWidth(v75);
    v76.origin.x = v14;
    v76.origin.y = v68;
    v76.size.width = v65;
    v76.size.height = v69;
    CGFloat v53 = v52 - CGRectGetMinX(v76);
    double v54 = v64 - v53;
    v77.origin.x = v5;
    v77.origin.y = v7;
    v77.size.width = v66;
    v77.size.height = v67;
    double v55 = CGRectGetMaxX(v77);
    v78.origin.x = v53;
    v78.origin.y = v68;
    v78.size.width = v64 - v53;
    v78.size.height = v69;
    double v56 = v55 - CGRectGetWidth(v78);
    v79.origin.x = v53;
    v79.origin.y = v68;
    v79.size.width = v64 - v53;
    v79.size.height = v69;
    double v14 = v56 - CGRectGetMinX(v79);
  }

  else
  {
    double v54 = v42 - v14;
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell textLabel](self, "textLabel", *(void *)&rect));
  objc_msgSend(v57, "setFrame:", v14, v68, v54, v69);
}

- (void)setBadgeView:(id)a3
{
  double v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_badgeView, "removeFromSuperview");
  badgeView = self->_badgeView;
  self->_badgeView = v4;
  double v6 = v4;

  CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell contentView](self, "contentView"));
  [v7 addSubview:self->_badgeView];

  -[TVMusicTableViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPlaceholderAssetType:(int64_t)a3
{
  if (self->_placeholderAssetType != a3)
  {
    self->_placeholderAssetType = a3;
    -[TVMusicTableViewCell _updatePlaceholderImageIfNeeded](self, "_updatePlaceholderImageIfNeeded");
  }

- (void)setAccessoryView:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicTableViewCell;
  -[TVMusicTableViewCell setAccessoryView:](&v11, "setAccessoryView:", a3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell accessoryView](self, "accessoryView"));
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UIImageView, v5);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) != 0)
  {
    double v8 = (UIImage *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell accessoryView](self, "accessoryView"));
    CGFloat v9 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage image](v8, "image"));
    accessoryImage = self->_accessoryImage;
    self->_accessoryImage = v9;
  }

  else
  {
    double v8 = self->_accessoryImage;
    self->_accessoryImage = 0LL;
  }

  -[TVMusicTableViewCell _setAccessoryViewColor](self, "_setAccessoryViewColor");
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicTableViewCell;
  -[TVMusicTableViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v5,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  -[TVMusicTableViewCell _updateColors](self, "_updateColors");
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicTableViewCell;
  id v4 = a3;
  -[TVMusicTableViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    -[TVMusicTableViewCell _updateColors](self, "_updateColors");
  }
}

- (void)_updateColors
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell _textLabelColor](self, "_textLabelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell _detailTextLabelColor](self, "_detailTextLabelColor"));
  -[TVMusicTableViewCell _updateColorsWithTextLabelColor:detailTextLabelColor:]( self,  "_updateColorsWithTextLabelColor:detailTextLabelColor:",  v4,  v3);
}

- (void)_updateColorsWithTextLabelColor:(id)a3 detailTextLabelColor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell textLabel](self, "textLabel"));
  [v8 setTextColor:v7];

  CGFloat v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell detailTextLabel](self, "detailTextLabel"));
  [v9 setTextColor:v6];

  -[TVMusicTableViewCell _setAccessoryViewWithTextLabelColor:detailTextLabelColor:]( self,  "_setAccessoryViewWithTextLabelColor:detailTextLabelColor:",  v7,  v6);
  -[TVMusicTableViewCell _updatePlaceholderImageIfNeeded](self, "_updatePlaceholderImageIfNeeded");
}

- (id)_textLabelColor
{
  if (-[TVMusicTableViewCell _isFocusedInDarkMode](self, "_isFocusedInDarkMode")) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell _focusedInDarkModeTextLabelColor](self, "_focusedInDarkModeTextLabelColor"));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell _defaultTextLabelColor](self, "_defaultTextLabelColor"));
  }
  return v3;
}

- (id)_detailTextLabelColor
{
  if (-[TVMusicTableViewCell _isFocusedInDarkMode](self, "_isFocusedInDarkMode")) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell _focusedInDarkModeTextLabelColor](self, "_focusedInDarkModeTextLabelColor"));
  }
  else {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell _defaultDetailTextLabelColor](self, "_defaultDetailTextLabelColor"));
  }
  return v3;
}

- (id)_defaultTextLabelColor
{
  return +[TVThemeManager textOpacityAColor](&OBJC_CLASS___TVThemeManager, "textOpacityAColor");
}

- (id)_defaultDetailTextLabelColor
{
  return +[TVThemeManager listTitleTextColor](&OBJC_CLASS___TVThemeManager, "listTitleTextColor");
}

- (id)_focusedInDarkModeTextLabelColor
{
  if (qword_1002BE7E8 != -1) {
    dispatch_once(&qword_1002BE7E8, &stru_100269E38);
  }
  return (id)qword_1002BE7E0;
}

- (BOOL)_isFocusedInDarkMode
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell traitCollection](self, "traitCollection"));
  if ([v3 userInterfaceStyle] == (id)2) {
    unsigned __int8 v4 = -[TVMusicTableViewCell isFocused](self, "isFocused");
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)_setAccessoryViewWithTextLabelColor:(id)a3 detailTextLabelColor:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell accessoryView](self, "accessoryView"));
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIImageView, v8);
  char isKindOfClass = objc_opt_isKindOfClass(v7, v9);

  if ((isKindOfClass & 1) != 0)
  {
    accessoryImage = self->_accessoryImage;
    if (accessoryImage)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _flatImageWithColor:](accessoryImage, "_flatImageWithColor:", v18));
      double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell accessoryView](self, "accessoryView"));
      [v13 setImage:v12];

LABEL_6:
    }
  }

  else
  {
    double v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell accessoryView](self, "accessoryView"));
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___UILabel, v15);
    char v17 = objc_opt_isKindOfClass(v14, v16);

    if ((v17 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell accessoryView](self, "accessoryView"));
      [v12 setTextColor:v6];
      goto LABEL_6;
    }
  }
}

- (void)_setAccessoryViewColor
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell _textLabelColor](self, "_textLabelColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewCell _detailTextLabelColor](self, "_detailTextLabelColor"));
  -[TVMusicTableViewCell _setAccessoryViewWithTextLabelColor:detailTextLabelColor:]( self,  "_setAccessoryViewWithTextLabelColor:detailTextLabelColor:",  v4,  v3);
}

- (void)_updatePlaceholderImageIfNeeded
{
  uint64_t v3 = -[TVMusicTableViewCell placeholderAssetType](self, "placeholderAssetType");
  if (v3)
  {
    id v4 = sub_100030470(v3, 0LL);
    id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    -[TVTableViewCell setPlaceholderImage:](self, "setPlaceholderImage:", v5);
  }

- (UIView)badgeView
{
  return self->_badgeView;
}

- (int64_t)placeholderAssetType
{
  return self->_placeholderAssetType;
}

- (void).cxx_destruct
{
}

@end