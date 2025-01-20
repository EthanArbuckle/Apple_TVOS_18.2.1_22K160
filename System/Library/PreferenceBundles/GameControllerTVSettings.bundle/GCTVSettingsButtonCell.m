@interface GCTVSettingsButtonCell
- (BOOL)showRemappedIcon;
- (GCControllerElement)element;
- (GCControllerSettings)settings;
- (GCTVSettingsButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)buttonIconSfSymbolsName;
- (void)_updateAccessoryTintColor;
- (void)_updateButtonImage;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reset;
- (void)setButtonIconSFSymbolsName:(id)a3;
- (void)setButtonIconSfSymbolsName:(id)a3;
- (void)setElement:(id)a3;
- (void)setElement:(id)a3 settings:(id)a4 showRemappedIcon:(BOOL)a5;
- (void)setSettings:(id)a3;
- (void)setShowRemappedIcon:(BOOL)a3;
@end

@implementation GCTVSettingsButtonCell

- (GCTVSettingsButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___GCTVSettingsButtonCell;
  v4 = -[GCTVSettingsButtonCell initWithStyle:reuseIdentifier:](&v18, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    remappedButtonIconView = v4->_remappedButtonIconView;
    v4->_remappedButtonIconView = v5;

    -[UIImageView setContentMode:](v4->_remappedButtonIconView, "setContentMode:", 4LL);
    v7 = v4->_remappedButtonIconView;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell detailTextLabel](v4, "detailTextLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 textColor]);
    -[UIImageView setTintColor:](v7, "setTintColor:", v9);

    v10 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    buttonIconView = v4->_buttonIconView;
    v4->_buttonIconView = v10;

    -[UIImageView setContentMode:](v4->_buttonIconView, "setContentMode:", 4LL);
    v12 = v4->_buttonIconView;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell detailTextLabel](v4, "detailTextLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 textColor]);
    -[UIImageView setTintColor:](v12, "setTintColor:", v14);

    -[GCTVSettingsButtonCell registerAccessoryForAppearanceUpdates:selector:]( v4,  "registerAccessoryForAppearanceUpdates:selector:",  v4->_remappedButtonIconView,  "setTintColor:");
    -[GCTVSettingsButtonCell registerTitleAccessoryForAppearanceUpdates:selector:]( v4,  "registerTitleAccessoryForAppearanceUpdates:selector:",  v4->_buttonIconView,  "setTintColor:");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell contentView](v4, "contentView"));
    [v15 addSubview:v4->_remappedButtonIconView];

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell contentView](v4, "contentView"));
    [v16 addSubview:v4->_buttonIconView];

    -[GCTVSettingsButtonCell _updateButtonImage](v4, "_updateButtonImage");
  }

  return v4;
}

- (void)reset
{
  element = self->_element;
  self->_element = 0LL;

  buttonIconSfSymbolsName = self->_buttonIconSfSymbolsName;
  self->_buttonIconSfSymbolsName = 0LL;

  self->_showRemappedIcon = 0;
  settings = self->_settings;
  if (settings)
  {
    -[GCControllerSettings removeObserver:forKeyPath:]( settings,  "removeObserver:forKeyPath:",  self,  @"elementMappings");
    v6 = self->_settings;
    self->_settings = 0LL;
  }

- (void)setButtonIconSFSymbolsName:(id)a3
{
  v4 = (NSString *)a3;
  -[GCTVSettingsButtonCell reset](self, "reset");
  buttonIconSfSymbolsName = self->_buttonIconSfSymbolsName;
  self->_buttonIconSfSymbolsName = v4;

  -[GCTVSettingsButtonCell _updateButtonImage](self, "_updateButtonImage");
}

- (void)setElement:(id)a3 settings:(id)a4 showRemappedIcon:(BOOL)a5
{
  v8 = (GCControllerElement *)a3;
  v9 = (GCControllerSettings *)a4;
  -[GCTVSettingsButtonCell reset](self, "reset");
  self->_showRemappedIcon = a5;
  element = self->_element;
  self->_element = v8;
  v11 = v8;

  settings = self->_settings;
  self->_settings = v9;
  v13 = v9;

  -[GCControllerSettings addObserver:forKeyPath:options:context:]( self->_settings,  "addObserver:forKeyPath:options:context:",  self,  @"elementMappings",  1LL,  off_56120);
  -[GCTVSettingsButtonCell _updateButtonImage](self, "_updateButtonImage");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_56120 == a6)
  {
    -[GCTVSettingsButtonCell _updateButtonImage](self, "_updateButtonImage", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___GCTVSettingsButtonCell;
    -[GCTVSettingsButtonCell observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)layoutSubviews
{
  v98.receiver = self;
  v98.super_class = (Class)&OBJC_CLASS___GCTVSettingsButtonCell;
  -[GCTVSettingsButtonCell layoutSubviews](&v98, "layoutSubviews");
  if ((-[UIImageView isHidden](self->_remappedButtonIconView, "isHidden") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell detailTextLabel](self, "detailTextLabel"));
    [v3 frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    CGFloat y = CGRectZero.origin.y;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_remappedButtonIconView, "image"));
    [v13 size];
    double v15 = v14;

    if (-[GCTVSettingsButtonCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    {
      v99.origin.x = v5;
      v99.origin.CGFloat y = v7;
      v99.size.width = v9;
      v99.size.height = v11;
      double MaxX = CGRectGetMaxX(v99);
      double v17 = 12.0;
    }

    else
    {
      v100.origin.x = v5;
      v100.origin.CGFloat y = v7;
      v100.size.width = v9;
      v100.size.height = v11;
      double MinX = CGRectGetMinX(v100);
      v101.size.width = 50.0;
      v101.origin.x = CGRectZero.origin.x;
      v101.origin.CGFloat y = y;
      v101.size.height = v15;
      double MaxX = MinX - CGRectGetWidth(v101);
      double v17 = -12.0;
    }

    double v19 = MaxX + v17;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell contentView](self, "contentView"));
    [v20 bounds];
    double Height = CGRectGetHeight(v102);
    v103.origin.x = v19;
    v103.origin.CGFloat y = y;
    v103.size.width = 50.0;
    v103.size.height = v15;
    double v22 = floor((Height - CGRectGetHeight(v103)) * 0.5);

    -[UIImageView setFrame:](self->_remappedButtonIconView, "setFrame:", v19, v22, 50.0, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell textLabel](self, "textLabel"));
    [v23 frame];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    id v32 = -[GCTVSettingsButtonCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    double v33 = v25;
    double v34 = v27;
    double v35 = v29;
    double v36 = v31;
    if (v32)
    {
      CGFloat v37 = CGRectGetMinX(*(CGRect *)&v33);
      v104.size.height = v15;
      double v38 = v37;
      v104.origin.x = v19;
      v104.origin.CGFloat y = v22;
      v104.size.width = 50.0;
      double v39 = v38 + CGRectGetMaxX(v104) + 18.0;
      if (v39 > 0.0) {
        double v39 = 0.0;
      }
    }

    else
    {
      double v96 = CGRectGetMaxX(*(CGRect *)&v33);
      v105.origin.x = v19;
      v105.origin.CGFloat y = v22;
      v105.size.width = 50.0;
      v105.size.height = v15;
      double v39 = fmax(v96 - (CGRectGetMinX(v105) + -18.0), 0.0);
    }

    double v40 = v29 - v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell textLabel](self, "textLabel"));
    objc_msgSend(v41, "setFrame:", v25, v27, v40, v31);
  }

  if ((-[UIImageView isHidden](self->_buttonIconView, "isHidden") & 1) == 0)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell textLabel](self, "textLabel"));
    [v42 frame];
    double v44 = v43;
    CGFloat v46 = v45;
    double v48 = v47;
    double v50 = v49;

    CGFloat v51 = CGRectZero.origin.y;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_buttonIconView, "image"));
    [v52 size];
    double v54 = v53;

    double v97 = v46;
    if (-[GCTVSettingsButtonCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection"))
    {
      v106.origin.x = v44;
      v106.origin.CGFloat y = v46;
      v106.size.width = v48;
      v106.size.height = v50;
      double v55 = CGRectGetMaxX(v106);
      v107.size.width = 50.0;
      v107.origin.x = CGRectZero.origin.x;
      v107.origin.CGFloat y = v51;
      v107.size.height = v54;
      double v56 = v55 - CGRectGetWidth(v107);
    }

    else
    {
      v108.origin.x = v44;
      v108.origin.CGFloat y = v46;
      v108.size.width = v48;
      v108.size.height = v50;
      double v56 = CGRectGetMinX(v108);
    }

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell contentView](self, "contentView"));
    [v57 bounds];
    double v58 = CGRectGetHeight(v109);
    v110.origin.x = v56;
    v110.origin.CGFloat y = v51;
    v110.size.width = 50.0;
    v110.size.height = v54;
    double v59 = floor((v58 - CGRectGetHeight(v110)) * 0.5);

    -[UIImageView setFrame:](self->_buttonIconView, "setFrame:", v56, v59, 50.0, v54);
    id v60 = -[GCTVSettingsButtonCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
    double v61 = -68.0;
    if (!v60) {
      double v61 = 68.0;
    }
    double v62 = v44 + v61;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell textLabel](self, "textLabel"));
    objc_msgSend(v63, "setFrame:", v62, v97, v48, v50);
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell textLabel](self, "textLabel"));
  [v64 frame];
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;
  double v72 = v71;

  id v73 = -[GCTVSettingsButtonCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  unsigned __int8 v74 = -[UIImageView isHidden](self->_remappedButtonIconView, "isHidden");
  if (v73)
  {
    if ((v74 & 1) != 0)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell detailTextLabel](self, "detailTextLabel"));
      [v75 frame];
      double v77 = v76;
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell detailTextLabel](self, "detailTextLabel"));
      [v78 frame];
      double v80 = v77 + v79;

      double v81 = v66 + v70 - v80;
      double v66 = v80;
    }

    else
    {
      -[UIImageView frame](self->_remappedButtonIconView, "frame");
      double v88 = v87;
      -[UIImageView frame](self->_remappedButtonIconView, "frame");
      double v90 = v88 + v89;
      double v91 = v66 + v70;
      double v66 = v90 + 6.0;
      double v81 = v91 - (v90 + 6.0) + -6.0;
    }
  }

  else
  {
    if ((v74 & 1) != 0)
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell detailTextLabel](self, "detailTextLabel"));
      [v82 frame];
      double v84 = v83;
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell textLabel](self, "textLabel"));
      [v85 frame];
      double v81 = v84 - v86;
    }

    else
    {
      -[UIImageView frame](self->_remappedButtonIconView, "frame");
      double v93 = v92;
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell textLabel](self, "textLabel"));
      [v82 frame];
      double v81 = v93 - v94 + -6.0;
    }
  }

  v95 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell textLabel](self, "textLabel"));
  objc_msgSend(v95, "setFrame:", v66, v68, v81, v72);
}

- (void)_updateAccessoryTintColor
{
  if (qword_568F0 != -1) {
    dispatch_once(&qword_568F0, &stru_4CE90);
  }
  unsigned int v3 = -[GCTVSettingsButtonCell isFocused](self, "isFocused");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[GCTVSettingsButtonCell traitCollection](self, "traitCollection"));
  CGFloat v5 = (char *)[v4 userInterfaceStyle];

  if (v5 == (_BYTE *)&dword_0 + 2) {
    int v6 = v3;
  }
  else {
    int v6 = 1;
  }
  if (v6) {
    CGFloat v7 = &qword_568E8;
  }
  else {
    CGFloat v7 = &qword_568E0;
  }
  buttonIconView = self->_buttonIconView;
  id v9 = (id)*v7;
  -[UIImageView setTintColor:](buttonIconView, "setTintColor:", v9);
  -[UIImageView setTintColor:](self->_remappedButtonIconView, "setTintColor:", v9);
}

- (void)_updateButtonImage
{
  element = self->_element;
  if (element)
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue(-[GCControllerElement unmappedSfSymbolsName](element, "unmappedSfSymbolsName"));
    if (v15)
    {
      double v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  40.0));
      CGFloat v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  v15,  v4));

      -[UIImageView setImage:](self->_buttonIconView, "setImage:", v5);
      -[UIImageView setHidden:](self->_buttonIconView, "setHidden:", 0LL);
    }

    else
    {
      -[UIImageView setImage:](self->_buttonIconView, "setImage:", 0LL);
      -[UIImageView setHidden:](self->_buttonIconView, "setHidden:", 1LL);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[GCControllerSettings mappingForElement:](self->_settings, "mappingForElement:", self->_element));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 unmappedSfSymbolsName]);
    if (self->_showRemappedIcon) {
      unsigned __int8 v11 = -[GCControllerElement isEqual:](self->_element, "isEqual:", v9);
    }
    else {
      unsigned __int8 v11 = 1;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12 || (v11 & 1) != 0)
    {
      -[UIImageView setImage:](self->_remappedButtonIconView, "setImage:", 0LL);
      -[UIImageView setHidden:](self->_remappedButtonIconView, "setHidden:", 1LL);
    }

    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  40.0));
      double v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  v10,  v13));

      -[UIImageView setImage:](self->_remappedButtonIconView, "setImage:", v14);
      -[UIImageView setHidden:](self->_remappedButtonIconView, "setHidden:", 0LL);
    }

    -[GCTVSettingsButtonCell setNeedsLayout](self, "setNeedsLayout");
  }

  else
  {
    buttonIconSfSymbolsName = self->_buttonIconSfSymbolsName;
    if (buttonIconSfSymbolsName)
    {
      CGFloat v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  40.0));
      double v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  buttonIconSfSymbolsName,  v7));

      -[UIImageView setImage:](self->_buttonIconView, "setImage:", v8);
      -[UIImageView setHidden:](self->_buttonIconView, "setHidden:", 0LL);
    }

    else
    {
      -[UIImageView setImage:](self->_buttonIconView, "setImage:", 0LL);
      -[UIImageView setHidden:](self->_buttonIconView, "setHidden:", 1LL);
    }

    -[UIImageView setImage:](self->_remappedButtonIconView, "setImage:", 0LL);
    -[UIImageView setHidden:](self->_remappedButtonIconView, "setHidden:", 1LL);
    -[GCTVSettingsButtonCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)dealloc
{
  id GCSettingsLogger = getGCSettingsLogger();
  double v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(GCSettingsLogger);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CGFloat v7 = self;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Dealloc %@", buf, 0xCu);
  }

  -[GCControllerSettings removeObserver:forKeyPath:]( self->_settings,  "removeObserver:forKeyPath:",  self,  @"elementMappings");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GCTVSettingsButtonCell;
  -[GCTVSettingsButtonCell dealloc](&v5, "dealloc");
}

- (GCControllerElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (GCControllerSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (BOOL)showRemappedIcon
{
  return self->_showRemappedIcon;
}

- (void)setShowRemappedIcon:(BOOL)a3
{
  self->_showRemappedIcon = a3;
}

- (NSString)buttonIconSfSymbolsName
{
  return self->_buttonIconSfSymbolsName;
}

- (void)setButtonIconSfSymbolsName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end