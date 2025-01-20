@interface PBUserNotificationUnbiasedAlertView
- (NSArray)optionTitles;
- (NSString)descriptionText;
- (NSString)title;
- (PBUserNotificationUnbiasedAlertView)initWithFrame:(CGRect)a3;
- (PBUserNotificationUnbiasedAlertViewDelegate)delegate;
- (UIButton)selectButton;
- (UIFocusGuide)buttonsFocusGuide;
- (UILabel)descriptionLabel;
- (UILabel)titleLabel;
- (UIStackView)buttonsStackView;
- (id)preferredFocusEnvironments;
- (void)_didSelectButton:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setOptionTitles:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PBUserNotificationUnbiasedAlertView

- (PBUserNotificationUnbiasedAlertView)initWithFrame:(CGRect)a3
{
  v107.receiver = self;
  v107.super_class = (Class)&OBJC_CLASS___PBUserNotificationUnbiasedAlertView;
  v3 = -[PBUserNotificationUnbiasedAlertView initWithFrame:]( &v107,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(&OBJC_CLASS___UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = -[UILabel initWithFrame:](v4, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v10 = v3->_titleLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleHeadline,  1024LL));
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = v3->_titleLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = v3->_titleLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 1LL);
    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 0LL);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0LL);
    -[PBUserNotificationUnbiasedAlertView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v16 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v3->_descriptionLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v18 = v3->_descriptionLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
    -[UILabel setFont:](v18, "setFont:", v19);

    v20 = v3->_descriptionLabel;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    -[UILabel setTextColor:](v20, "setTextColor:", v21);

    v22 = v3->_descriptionLabel;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v22, "setBackgroundColor:", v23);

    -[UILabel setTextAlignment:](v3->_descriptionLabel, "setTextAlignment:", 1LL);
    -[UILabel setLineBreakMode:](v3->_descriptionLabel, "setLineBreakMode:", 0LL);
    -[UILabel setNumberOfLines:](v3->_descriptionLabel, "setNumberOfLines:", 0LL);
    -[PBUserNotificationUnbiasedAlertView addSubview:](v3, "addSubview:", v3->_descriptionLabel);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[UIButton tvsui_consentSelectButton](&OBJC_CLASS___UIButton, "tvsui_consentSelectButton"));
    selectButton = v3->_selectButton;
    v3->_selectButton = (UIButton *)v24;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:]( v3->_selectButton,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[PBUserNotificationUnbiasedAlertView addSubview:](v3, "addSubview:", v3->_selectButton);
    v26 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    buttonsStackView = v3->_buttonsStackView;
    v3->_buttonsStackView = v26;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v3->_buttonsStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAlignment:](v3->_buttonsStackView, "setAlignment:", 3LL);
    -[UIStackView setDistribution:](v3->_buttonsStackView, "setDistribution:", 1LL);
    -[PBUserNotificationUnbiasedAlertView addSubview:](v3, "addSubview:", v3->_buttonsStackView);
    v28 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    -[PBUserNotificationUnbiasedAlertView addLayoutGuide:](v3, "addLayoutGuide:", v28);
    v29 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    -[PBUserNotificationUnbiasedAlertView addLayoutGuide:](v3, "addLayoutGuide:");
    v30 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
    buttonsFocusGuide = v3->_buttonsFocusGuide;
    v3->_buttonsFocusGuide = v30;

    -[UIFocusGuide setEnabled:](v3->_buttonsFocusGuide, "setEnabled:", 0LL);
    -[PBUserNotificationUnbiasedAlertView addLayoutGuide:](v3, "addLayoutGuide:", v3->_buttonsFocusGuide);
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v28, "leadingAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView leadingAnchor](v3, "leadingAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue([v106 constraintEqualToAnchor:v105]);
    v108[0] = v104;
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v28, "trailingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView trailingAnchor](v3, "trailingAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue([v103 constraintEqualToAnchor:v102]);
    v108[1] = v101;
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v28, "topAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView topAnchor](v3, "topAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue([v100 constraintEqualToAnchor:v99]);
    v108[2] = v98;
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v28, "heightAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide"));
    v95 = (void *)objc_claimAutoreleasedReturnValue([v97 heightAnchor]);
    v94 = (void *)objc_claimAutoreleasedReturnValue([v96 constraintLessThanOrEqualToAnchor:v95]);
    v108[3] = v94;
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v29, "leadingAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView leadingAnchor](v3, "leadingAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue([v93 constraintEqualToAnchor:v91]);
    v108[4] = v90;
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v29, "trailingAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView trailingAnchor](v3, "trailingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue([v89 constraintEqualToAnchor:v88]);
    v108[5] = v87;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v29, "bottomAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView bottomAnchor](v3, "bottomAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue([v86 constraintEqualToAnchor:v85]);
    v108[6] = v84;
    v70 = v29;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v29, "heightAnchor"));
    v92 = v28;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v28, "heightAnchor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue([v83 constraintEqualToAnchor:v82]);
    v108[7] = v81;
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v3->_titleLabel, "topAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide bottomAnchor](v28, "bottomAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v79]);
    v108[8] = v78;
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_titleLabel, "centerXAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView centerXAnchor](v3, "centerXAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintEqualToAnchor:v76]);
    v108[9] = v75;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_titleLabel, "widthAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue([v74 constraintEqualToConstant:960.0]);
    v108[10] = v73;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](v3->_descriptionLabel, "centerXAnchor"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView centerXAnchor](v3, "centerXAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v71]);
    v108[11] = v69;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_descriptionLabel, "widthAnchor"));
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v3->_titleLabel, "widthAnchor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue([v68 constraintEqualToAnchor:v67]);
    v108[12] = v66;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](v3->_descriptionLabel, "firstBaselineAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v3->_titleLabel, "bottomAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue([v65 constraintEqualToAnchor:v64 constant:72.0]);
    v108[13] = v63;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerXAnchor](v3->_selectButton, "centerXAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView centerXAnchor](v3, "centerXAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToAnchor:v61]);
    v108[14] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v3->_selectButton, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](v3->_descriptionLabel, "lastBaselineAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v58 constant:40.0]);
    v108[15] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](v3->_selectButton, "heightAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToConstant:66.0]);
    v108[16] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerXAnchor](v3->_buttonsStackView, "centerXAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView centerXAnchor](v3, "centerXAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v53]);
    v108[17] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_buttonsStackView, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v3->_selectButton, "bottomAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v50 constant:14.0]);
    v108[18] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_buttonsStackView, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v29, "topAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v47]);
    v108[19] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v3->_buttonsFocusGuide, "topAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_buttonsStackView, "topAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToAnchor:v44]);
    v108[20] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](v3->_buttonsFocusGuide, "bottomAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_buttonsStackView, "bottomAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v32]);
    v108[21] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leadingAnchor](v3->_buttonsFocusGuide, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_buttonsStackView, "leadingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToAnchor:v35]);
    v108[22] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide trailingAnchor](v3->_buttonsFocusGuide, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_buttonsStackView, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v38]);
    v108[23] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v108, 24LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v40);
  }

  return v3;
}

- (id)preferredFocusEnvironments
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView selectButton](self, "selectButton"));
  if ([v3 isEnabled])
  {
    v10 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView buttonsStackView](self, "buttonsStackView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 arrangedSubviews]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 firstObject]);

    if (v7)
    {
      v9 = v7;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
    }

    else
    {
      v4 = &__NSArray0__struct;
    }
  }

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBUserNotificationUnbiasedAlertView;
  id v6 = a3;
  -[PBUserNotificationUnbiasedAlertView didUpdateFocusInContext:withAnimationCoordinator:]( &v10,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previouslyFocusedItem", v10.receiver, v10.super_class));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView selectButton](self, "selectButton"));
  if (v7 == v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView selectButton](self, "selectButton"));
    [v9 setEnabled:0];
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView titleLabel](self, "titleLabel"));
  [v5 setText:v4];
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView descriptionLabel](self, "descriptionLabel"));
  [v5 setText:v4];
}

- (NSString)descriptionText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView descriptionLabel](self, "descriptionLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setOptionTitles:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  optionTitles = self->_optionTitles;
  self->_optionTitles = v5;

  v37 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView buttonsStackView](self, "buttonsStackView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 arrangedSubviews]);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        [v7 removeArrangedSubview:*(void *)(*((void *)&v42 + 1) + 8 * (void)i)];
      }

      id v10 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }

    while (v10);
  }

  v35 = v8;
  v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v4;
  id v14 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8LL * (void)j);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 1LL));
        [v19 _setBlurEnabled:0];
        [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v19 addTarget:v37 action:"_didSelectButton:" forControlEvents:0x2000];
        [v19 setTitle:v18 forState:0];
        v20 = (void *)objc_claimAutoreleasedReturnValue([v19 titleLabel]);
        v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
        [v20 setFont:v21];

        [v7 addArrangedSubview:v19];
        v22 = (void *)objc_claimAutoreleasedReturnValue([v19 heightAnchor]);
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToConstant:66.0]);
        -[NSMutableArray addObject:](v13, "addObject:", v23);

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v19 widthAnchor]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintGreaterThanOrEqualToConstant:500.0]);
        -[NSMutableArray addObject:](v13, "addObject:", v25);

        v26 = (void *)objc_claimAutoreleasedReturnValue([v19 widthAnchor]);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 constraintLessThanOrEqualToConstant:960.0]);
        -[NSMutableArray addObject:](v13, "addObject:", v27);
      }

      id v15 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }

    while (v15);
  }

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v13);
  id v28 = [obj count];
  if (v28 == (id)2) {
    double v29 = 60.0;
  }
  else {
    double v29 = 14.0;
  }
  [v7 setAxis:v28 != (id)2];
  [v7 setSpacing:v29];
  v30 = (void *)objc_claimAutoreleasedReturnValue([v7 arrangedSubviews]);
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 firstObject]);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView buttonsFocusGuide](v37, "buttonsFocusGuide"));
  v33 = v32;
  if (v31)
  {
    v46 = v31;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
    [v33 setPreferredFocusEnvironments:v34];
  }

  else
  {
    [v32 setPreferredFocusEnvironments:0];
  }

  [v33 setEnabled:v31 != 0];
}

- (void)_didSelectButton:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView buttonsStackView](self, "buttonsStackView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 arrangedSubviews]);
  id v7 = [v6 indexOfObject:v4];

  if (v7 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBUserNotificationUnbiasedAlertView delegate](self, "delegate"));
    [v8 unbiasedAlertView:self didSelectOptionAtIndex:v7];
  }

- (NSArray)optionTitles
{
  return self->_optionTitles;
}

- (PBUserNotificationUnbiasedAlertViewDelegate)delegate
{
  return (PBUserNotificationUnbiasedAlertViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (UIButton)selectButton
{
  return self->_selectButton;
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (UIFocusGuide)buttonsFocusGuide
{
  return self->_buttonsFocusGuide;
}

- (void).cxx_destruct
{
}

@end