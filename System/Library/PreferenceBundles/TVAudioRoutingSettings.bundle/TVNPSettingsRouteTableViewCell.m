@interface TVNPSettingsRouteTableViewCell
- (NSArray)konamiSequenceArray;
- (TSKSettingItem)item;
- (TVNPSettingsRouteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)spinnerView;
- (UIImageView)checkmarkView;
- (UIImageView)deviceImageView;
- (UIImageView)symbolImageview;
- (UILabel)detailLabel;
- (UILabel)titleLabel;
- (UITapGestureRecognizer)playPauseButtonRecognizer;
- (void)_addInitialConstraints;
- (void)_konamiCodeRecognizerWithTapGestureRecognizer:(id)a3;
- (void)_updateKonamiCodeTrackerWithButtonPressType:(int64_t)a3;
- (void)setItem:(id)a3;
- (void)setKonamiSequenceArray:(id)a3;
- (void)setPlayPauseButtonRecognizer:(id)a3;
- (void)settingItem:(id)a3 didUpdateMetadataWithGroup:(id)a4;
@end

@implementation TVNPSettingsRouteTableViewCell

- (TVNPSettingsRouteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v34 = self;
  location[2] = (id)a2;
  location[1] = (id)a3;
  location[0] = 0LL;
  objc_storeStrong(location, a4);
  v4 = v34;
  v34 = 0LL;
  v32.receiver = v4;
  v32.super_class = (Class)&OBJC_CLASS___TVNPSettingsRouteTableViewCell;
  v34 = -[TVNPSettingsRouteTableViewCell initWithStyle:reuseIdentifier:]( &v32,  "initWithStyle:reuseIdentifier:",  0LL,  location[0]);
  objc_storeStrong((id *)&v34, v34);
  if (v34)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    checkmarkView = v34->_checkmarkView;
    v34->_checkmarkView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v34->_checkmarkView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v34->_checkmarkView, "setContentMode:", 4LL);
    id v22 = -[TVNPSettingsRouteTableViewCell contentView](v34, "contentView");
    [v22 addSubview:v34->_checkmarkView];

    v7 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]( objc_alloc(&OBJC_CLASS___UIActivityIndicatorView),  "initWithActivityIndicatorStyle:",  10LL);
    spinnerView = v34->_spinnerView;
    v34->_spinnerView = v7;

    -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:]( v34->_spinnerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v23 = -[TVNPSettingsRouteTableViewCell contentView](v34, "contentView");
    [v23 addSubview:v34->_spinnerView];

    v9 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    deviceImageView = v34->_deviceImageView;
    v34->_deviceImageView = v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v34->_deviceImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setContentMode:](v34->_deviceImageView, "setContentMode:", 1LL);
    id v24 = -[TVNPSettingsRouteTableViewCell contentView](v34, "contentView");
    [v24 addSubview:v34->_deviceImageView];

    v25 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    v31 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");

    v26 = v31;
    id v27 =  +[UIImageSymbolConfiguration _configurationWithHierarchicalColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "_configurationWithHierarchicalColors:",  &__NSArray0__struct);
    v11 = (UIImageSymbolConfiguration *) -[UIImageSymbolConfiguration configurationByApplyingConfiguration:]( v26,  "configurationByApplyingConfiguration:");
    v12 = v31;
    v31 = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    symbolImageview = v34->_symbolImageview;
    v34->_symbolImageview = v13;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v34->_symbolImageview,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setPreferredSymbolConfiguration:](v34->_symbolImageview, "setPreferredSymbolConfiguration:", v31);
    id v28 = -[TVNPSettingsRouteTableViewCell contentView](v34, "contentView");
    [v28 addSubview:v34->_symbolImageview];

    v15 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v34->_titleLabel;
    v34->_titleLabel = v15;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v34->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setEnablesMarqueeWhenAncestorFocused:](v34->_titleLabel, "setEnablesMarqueeWhenAncestorFocused:", 1LL);
    id v29 = -[TVNPSettingsRouteTableViewCell contentView](v34, "contentView");
    [v29 addSubview:v34->_titleLabel];

    v17 = objc_alloc_init(&OBJC_CLASS___UILabel);
    detailLabel = v34->_detailLabel;
    v34->_detailLabel = v17;

    -[UILabel setTextAlignment:](v34->_detailLabel, "setTextAlignment:", 2LL);
    LODWORD(v19) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:]( v34->_detailLabel,  "setContentCompressionResistancePriority:forAxis:",  0LL,  v19);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v34->_detailLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    id v30 = -[TVNPSettingsRouteTableViewCell contentView](v34, "contentView");
    [v30 addSubview:v34->_detailLabel];

    -[TVNPSettingsRouteTableViewCell _addInitialConstraints](v34, "_addInitialConstraints");
    -[TVNPSettingsRouteTableViewCell registerTextLabelForAppearanceUpdates:]( v34,  "registerTextLabelForAppearanceUpdates:",  v34->_titleLabel);
    -[TVNPSettingsRouteTableViewCell registerDetailLabelForAppearanceUpdates:]( v34,  "registerDetailLabelForAppearanceUpdates:",  v34->_detailLabel);
    -[TVNPSettingsRouteTableViewCell registerTitleAccessoryForAppearanceUpdates:selector:]( v34,  "registerTitleAccessoryForAppearanceUpdates:selector:",  v34->_deviceImageView,  "setTintColor:");
    -[TVNPSettingsRouteTableViewCell registerTitleAccessoryForAppearanceUpdates:selector:]( v34,  "registerTitleAccessoryForAppearanceUpdates:selector:",  v34->_symbolImageview,  "setTintColor:");
    -[TVNPSettingsRouteTableViewCell registerAccessoryForAppearanceUpdates:selector:]( v34,  "registerAccessoryForAppearanceUpdates:selector:",  v34->_checkmarkView,  "setTintColor:");
    -[TVNPSettingsRouteTableViewCell registerAccessoryForAppearanceUpdates:selector:]( v34,  "registerAccessoryForAppearanceUpdates:selector:",  v34->_spinnerView,  "setColor:");
    objc_storeStrong((id *)&v31, 0LL);
  }

  v21 = v34;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v34, 0LL);
  return v21;
}

- (void)settingItem:(id)a3 didUpdateMetadataWithGroup:(id)a4
{
  v38 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v36 = 0LL;
  objc_storeStrong(&v36, a4);
  unsigned __int8 v31 = 0;
  char v35 = v31 & 1;
  titleLabel = v38->_titleLabel;
  id v29 = [location[0] localizedTitle];
  -[UILabel setText:](titleLabel, "setText:");

  -[UILabel setEnabled:](v38->_titleLabel, "setEnabled:", v31 & 1);
  -[UILabel setText:](v38->_detailLabel, "setText:", 0LL);
  -[UILabel setEnabled:](v38->_detailLabel, "setEnabled:", v31 & 1);
  double v4 = 1.0;
  if ((v31 & 1) == 0) {
    double v4 = 0.2;
  }
  -[UIImageView setAlpha:](v38->_deviceImageView, "setAlpha:", v4);
  double v5 = 1.0;
  if ((v35 & 1) == 0) {
    double v5 = 0.2;
  }
  -[UIImageView setAlpha:](v38->_checkmarkView, "setAlpha:", v5);
  id v34 = 0LL;
  if (((unint64_t)[location[0] accessoryTypes] & 2) != 0)
  {
    id v27 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    v26 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    id v6 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"checkmark");
    id v7 = v34;
    id v34 = v6;

    -[UIActivityIndicatorView stopAnimating](v38->_spinnerView, "stopAnimating");
  }

  else if (((unint64_t)[location[0] accessoryTypes] & 0x800) != 0)
  {
    v25 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    id v24 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    id v8 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"checkmark.circle.fill");
    id v9 = v34;
    id v34 = v8;

    -[UIActivityIndicatorView stopAnimating](v38->_spinnerView, "stopAnimating");
  }

  else if (((unint64_t)[location[0] accessoryTypes] & 4) != 0)
  {
    -[UIActivityIndicatorView startAnimating](v38->_spinnerView, "startAnimating");
    detailLabel = v38->_detailLabel;
    id v23 = [location[0] localizedValue];
    -[UILabel setText:](detailLabel, "setText:");
  }

  else
  {
    if (((unint64_t)[location[0] accessoryTypes] & 0x400) != 0)
    {
      v21 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
      v20 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
      id v10 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"circle");
      id v11 = v34;
      id v34 = v10;
    }

    else
    {
      objc_storeStrong(&v34, 0LL);
    }

    -[UIActivityIndicatorView stopAnimating](v38->_spinnerView, "stopAnimating");
  }

  -[UIImageView setImage:](v38->_checkmarkView, "setImage:", v34);
  id v33 = [location[0] representedObject];
  id v32 = [v33 deviceImage];
  if ([v32 isSymbolImage])
  {
    -[UIImageView setImage:](v38->_symbolImageview, "setImage:", v32);
    -[UIImageView setImage:](v38->_deviceImageView, "setImage:", 0LL);
  }

  else
  {
    -[UIImageView setImage:](v38->_deviceImageView, "setImage:", v32);
    -[UIImageView setImage:](v38->_symbolImageview, "setImage:", 0LL);
  }

  id v18 = [location[0] konamiCodes];
  BOOL v19 = [v18 count] == 0;

  if (!v19)
  {
    v12 = (NSArray *)[location[0] konamiCodes];
    konamiSequenceArray = v38->_konamiSequenceArray;
    v38->_konamiSequenceArray = v12;

    v14 = objc_alloc(&OBJC_CLASS___UITapGestureRecognizer);
    v15 = -[UITapGestureRecognizer initWithTarget:action:]( v14,  "initWithTarget:action:",  v38,  "_konamiCodeRecognizerWithTapGestureRecognizer:");
    playPauseButtonRecognizer = v38->_playPauseButtonRecognizer;
    v38->_playPauseButtonRecognizer = v15;

    -[UITapGestureRecognizer setAllowedPressTypes:]( v38->_playPauseButtonRecognizer,  "setAllowedPressTypes:",  &off_2A6A8);
    -[TVNPSettingsRouteTableViewCell addGestureRecognizer:]( v38,  "addGestureRecognizer:",  v38->_playPauseButtonRecognizer);
  }

  -[TVNPSettingsRouteTableViewCell setItem:](v38, "setItem:", location[0], location);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v34, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(v17, 0LL);
}

- (void)_konamiCodeRecognizerWithTapGestureRecognizer:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v11->_item);
  id v8 = [WeakRetained konamiCodes];
  BOOL v9 = 0;
  if ([v8 count]) {
    BOOL v9 = [location[0] state] == (char *)&dword_0 + 3;
  }

  if (v9)
  {
    id v5 = [location[0] allowedPressTypes];
    id v6 = (_UNKNOWN **)[v5 firstObject];
    if (v6) {
      double v4 = v6;
    }
    else {
      double v4 = &off_2A660;
    }
    id v3 = [v4 integerValue];

    -[TVNPSettingsRouteTableViewCell _updateKonamiCodeTrackerWithButtonPressType:]( v11,  "_updateKonamiCodeTrackerWithButtonPressType:",  v3);
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateKonamiCodeTrackerWithButtonPressType:(int64_t)a3
{
  v17 = self;
  SEL v16 = a2;
  int64_t v15 = a3;
  id location = objc_loadWeakRetained((id *)&self->_item);
  memset(__b, 0, sizeof(__b));
  obj = v17->_konamiSequenceArray;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
  if (v11)
  {
    uint64_t v7 = *(void *)__b[2];
    uint64_t v8 = 0LL;
    id v9 = v11;
    while (1)
    {
      uint64_t v6 = v8;
      if (*(void *)__b[2] != v7) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(id *)(__b[1] + 8 * v8);
      if ([v13 validateSequenceWithNextPressType:v15])
      {
        id v5 = +[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication");
        id v3 = [v13 action];
        id v4 = [location target];
        -[UIApplication sendAction:to:from:forEvent:](v5, "sendAction:to:from:forEvent:", v3);
      }

      ++v8;
      if (v6 + 1 >= (unint64_t)v9)
      {
        uint64_t v8 = 0LL;
        id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v18,  16LL);
        if (!v9) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&location, 0LL);
}

- (void)_addInitialConstraints
{
  v51 = self;
  v50[1] = (id)a2;
  v50[0] = -[TVNPSettingsRouteTableViewCell contentView](self, "contentView");
  v49 = 0LL;
  id v48 = -[UIImageView leadingAnchor](v51->_deviceImageView, "leadingAnchor");
  id v47 = [v50[0] leadingAnchor];
  id v46 = objc_msgSend(v48, "constraintEqualToAnchor:constant:");
  v52[0] = v46;
  id v45 = -[UIImageView centerYAnchor](v51->_deviceImageView, "centerYAnchor");
  id v44 = [v50[0] centerYAnchor];
  id v43 = objc_msgSend(v45, "constraintEqualToAnchor:");
  v52[1] = v43;
  id v42 = -[UIImageView widthAnchor](v51->_deviceImageView, "widthAnchor");
  sub_2F54();
  id v41 = [v42 constraintEqualToConstant:v2];
  v52[2] = v41;
  id v40 = -[UIImageView heightAnchor](v51->_deviceImageView, "heightAnchor");
  sub_2F54();
  id v39 = [v40 constraintEqualToConstant:v3];
  v52[3] = v39;
  id v38 = -[UIImageView centerXAnchor](v51->_symbolImageview, "centerXAnchor");
  id v37 = -[UIImageView centerXAnchor](v51->_deviceImageView, "centerXAnchor");
  id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
  v52[4] = v36;
  id v35 = -[UIImageView centerYAnchor](v51->_symbolImageview, "centerYAnchor");
  id v34 = -[UIImageView centerYAnchor](v51->_deviceImageView, "centerYAnchor");
  id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
  v52[5] = v33;
  id v32 = -[UIImageView centerXAnchor](v51->_checkmarkView, "centerXAnchor");
  id v31 = [v50[0] trailingAnchor];
  id v30 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", -60.0);
  v52[6] = v30;
  id v29 = -[UIImageView centerYAnchor](v51->_checkmarkView, "centerYAnchor");
  id v28 = [v50[0] centerYAnchor];
  id v27 = objc_msgSend(v29, "constraintEqualToAnchor:");
  v52[7] = v27;
  id v26 = -[UIActivityIndicatorView centerXAnchor](v51->_spinnerView, "centerXAnchor");
  id v25 = -[UIImageView centerXAnchor](v51->_checkmarkView, "centerXAnchor");
  id v24 = objc_msgSend(v26, "constraintEqualToAnchor:");
  v52[8] = v24;
  id v23 = -[UIActivityIndicatorView centerYAnchor](v51->_spinnerView, "centerYAnchor");
  id v22 = -[UIImageView centerYAnchor](v51->_checkmarkView, "centerYAnchor");
  id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
  v52[9] = v21;
  id v20 = -[UILabel leadingAnchor](v51->_titleLabel, "leadingAnchor");
  id v19 = -[UIImageView trailingAnchor](v51->_deviceImageView, "trailingAnchor");
  id v18 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", 30.0);
  v52[10] = v18;
  id v17 = -[UILabel firstBaselineAnchor](v51->_titleLabel, "firstBaselineAnchor");
  id v16 = [v50[0] topAnchor];
  id v15 = objc_msgSend(v17, "constraintEqualToAnchor:constant:");
  v52[11] = v15;
  id v14 = -[UILabel leadingAnchor](v51->_detailLabel, "leadingAnchor");
  id v13 = -[UILabel trailingAnchor](v51->_titleLabel, "trailingAnchor");
  id v12 = objc_msgSend(v14, "constraintEqualToAnchor:constant:", 30.0);
  v52[12] = v12;
  id v11 = -[UILabel trailingAnchor](v51->_detailLabel, "trailingAnchor");
  id v10 = -[UIActivityIndicatorView leadingAnchor](v51->_spinnerView, "leadingAnchor");
  id v9 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", -15.0);
  v52[13] = v9;
  id v8 = -[UILabel firstBaselineAnchor](v51->_detailLabel, "firstBaselineAnchor");
  id v7 = [v50[0] topAnchor];
  id v6 = objc_msgSend(v8, "constraintEqualToAnchor:constant:", 64.0);
  v52[14] = v6;
  id v4 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 15LL);
  id v5 = v49;
  v49 = v4;

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v49);
  objc_storeStrong((id *)&v49, 0LL);
  objc_storeStrong(v50, 0LL);
}

  ;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)detailLabel
{
  return self->_detailLabel;
}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (UIImageView)symbolImageview
{
  return self->_symbolImageview;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (NSArray)konamiSequenceArray
{
  return self->_konamiSequenceArray;
}

- (void)setKonamiSequenceArray:(id)a3
{
}

- (UITapGestureRecognizer)playPauseButtonRecognizer
{
  return self->_playPauseButtonRecognizer;
}

- (void)setPlayPauseButtonRecognizer:(id)a3
{
}

- (TSKSettingItem)item
{
  return (TSKSettingItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (void)setItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end