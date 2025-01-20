@interface TVHInteractiveHeaderView
- (NSArray)controls;
- (TVHInteractiveHeaderView)initWithFrame:(CGRect)a3;
- (UIFocusGuide)focusGuide;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)controlsStackView;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setControls:(id)a3;
- (void)setControlsStackView:(id)a3;
- (void)setFocusGuide:(id)a3;
@end

@implementation TVHInteractiveHeaderView

- (TVHInteractiveHeaderView)initWithFrame:(CGRect)a3
{
  v65.receiver = self;
  v65.super_class = (Class)&OBJC_CLASS___TVHInteractiveHeaderView;
  v3 = -[TVHInteractiveHeaderView initWithFrame:]( &v65,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TVHInteractiveHeaderView setInsetsLayoutMarginsFromSafeArea:](v3, "setInsetsLayoutMarginsFromSafeArea:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_60PercentBlackColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_90PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_90PercentWhiteColor"));
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v5,  v6));

    v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v10 = v4->_titleLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvh_fontFromTextStyle:fontWeight:]( &OBJC_CLASS___UIFont,  "tvh_fontFromTextStyle:fontWeight:",  3LL,  7LL));
    -[UILabel setFont:](v10, "setFont:", v11);

    v64 = (void *)v7;
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v7);
    -[TVHInteractiveHeaderView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v12 = objc_alloc_init(&OBJC_CLASS___UILabel);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v14 = v4->_subtitleLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 16LL));
    -[UILabel setFont:](v14, "setFont:", v15);

    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v7);
    -[TVHInteractiveHeaderView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    v16 = objc_alloc_init(&OBJC_CLASS___UIStackView);
    controlsStackView = v4->_controlsStackView;
    v4->_controlsStackView = v16;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_controlsStackView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIStackView setAxis:](v4->_controlsStackView, "setAxis:", 0LL);
    -[UIStackView setSpacing:](v4->_controlsStackView, "setSpacing:", 40.0);
    -[UIStackView setDistribution:](v4->_controlsStackView, "setDistribution:", 1LL);
    LODWORD(v18) = 1144750080;
    -[UIStackView setContentHuggingPriority:forAxis:]( v4->_controlsStackView,  "setContentHuggingPriority:forAxis:",  0LL,  v18);
    -[TVHInteractiveHeaderView addSubview:](v4, "addSubview:", v4->_controlsStackView);
    v19 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
    focusGuide = v4->_focusGuide;
    v4->_focusGuide = v19;

    v21 = v4->_focusGuide;
    v67 = v4->_controlsStackView;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v67, 1LL));
    -[UIFocusGuide setPreferredFocusEnvironments:](v21, "setPreferredFocusEnvironments:", v22);

    -[TVHInteractiveHeaderView addLayoutGuide:](v4, "addLayoutGuide:", v4->_focusGuide);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView leadingAnchor](v4, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v63 constraintEqualToAnchor:v62]);
    v66[0] = v61;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_controlsStackView, "leadingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v60 constraintLessThanOrEqualToAnchor:v59 constant:-70.0]);
    v66[1] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_titleLabel, "topAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView topAnchor](v4, "topAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v57 constraintEqualToAnchor:v56 constant:56.0]);
    v66[2] = v55;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_subtitleLabel, "leadingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue([v54 constraintEqualToAnchor:v53]);
    v66[3] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_subtitleLabel, "trailingAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v51 constraintEqualToAnchor:v50]);
    v66[4] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v4->_subtitleLabel, "topAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v4->_titleLabel, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v47 constant:0.0]);
    v66[5] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v4->_controlsStackView, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintGreaterThanOrEqualToAnchor:v44 constant:70.0]);
    v66[6] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v4->_controlsStackView, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView trailingAnchor](v4, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v41]);
    v66[7] = v40;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_controlsStackView, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView topAnchor](v4, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToAnchor:v38 constant:70.0]);
    v66[8] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide leadingAnchor](v4->_focusGuide, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView leadingAnchor](v4, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v36 constraintEqualToAnchor:v35]);
    v66[9] = v34;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide trailingAnchor](v4->_focusGuide, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView trailingAnchor](v4, "trailingAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v33 constraintEqualToAnchor:v23]);
    v66[10] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide topAnchor](v4->_focusGuide, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v4->_controlsStackView, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 constraintEqualToAnchor:v26]);
    v66[11] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIFocusGuide bottomAnchor](v4->_focusGuide, "bottomAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView bottomAnchor](v4, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue([v28 constraintEqualToAnchor:v29]);
    v66[12] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 13LL));
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v31);
  }

  return v4;
}

- (void)setControls:(id)a3
{
  id v4 = a3;
  -[NSArray makeObjectsPerformSelector:](self->_controls, "makeObjectsPerformSelector:", "removeFromSuperview");
  v5 = (NSArray *)[v4 copy];
  controls = self->_controls;
  self->_controls = v5;

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = self->_controls;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView controlsStackView](self, "controlsStackView", (void)v18));
        [v13 addArrangedSubview:v12];

        v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
    }

    while (v9);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_controls, "firstObject"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView focusGuide](self, "focusGuide"));
  v16 = v15;
  if (v14)
  {
    v22 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    [v16 setPreferredFocusEnvironments:v17];
  }

  else
  {
    [v15 setPreferredFocusEnvironments:&__NSArray0__struct];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVHInteractiveHeaderView;
  id v6 = a3;
  -[TVHInteractiveHeaderView didUpdateFocusInContext:withAnimationCoordinator:]( &v11,  "didUpdateFocusInContext:withAnimationCoordinator:",  v6,  a4);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextFocusedView", v11.receiver, v11.super_class));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView controlsStackView](self, "controlsStackView"));
  LODWORD(v6) = [v7 isDescendantOfView:v8];

  if ((_DWORD)v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHInteractiveHeaderView focusGuide](self, "focusGuide"));
    uint64_t v12 = v7;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
    [v9 setPreferredFocusEnvironments:v10];
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (NSArray)controls
{
  return self->_controls;
}

- (UIStackView)controlsStackView
{
  return self->_controlsStackView;
}

- (void)setControlsStackView:(id)a3
{
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end