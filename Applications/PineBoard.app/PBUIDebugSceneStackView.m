@interface PBUIDebugSceneStackView
- (PBUIDebugSceneStackView)initWithFrame:(CGRect)a3;
- (UILabel)activeWindowLabel;
- (UILabel)applicationSceneAssertionsLabel;
- (UILabel)attentionLabel;
- (UILabel)focusedSceneLabel;
- (void)setActiveWindow:(id)a3;
- (void)setAttentionActiveApplicationScene:(id)a3;
- (void)setCurrentApplicationScene:(id)a3;
- (void)setFocusedSceneHandle:(id)a3;
@end

@implementation PBUIDebugSceneStackView

- (PBUIDebugSceneStackView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBUIDebugSceneStackView;
  v3 = -[PBUIDebugSceneStackView initWithFrame:]( &v17,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PBUIDebugSceneStackView setAxis:](v3, "setAxis:", 1LL);
    -[PBUIDebugSceneStackView setAlignment:](v4, "setAlignment:", 1LL);
    -[PBUIDebugSceneStackView setDistribution:](v4, "setDistribution:", 1LL);
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[UILabel pb_debugLabel](&OBJC_CLASS___UILabel, "pb_debugLabel"));
    activeWindowLabel = v4->_activeWindowLabel;
    v4->_activeWindowLabel = (UILabel *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[UILabel pb_debugLabel](&OBJC_CLASS___UILabel, "pb_debugLabel"));
    focusedSceneLabel = v4->_focusedSceneLabel;
    v4->_focusedSceneLabel = (UILabel *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[UILabel pb_debugLabel](&OBJC_CLASS___UILabel, "pb_debugLabel"));
    applicationSceneAssertionsLabel = v4->_applicationSceneAssertionsLabel;
    v4->_applicationSceneAssertionsLabel = (UILabel *)v9;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[UILabel pb_debugLabel](&OBJC_CLASS___UILabel, "pb_debugLabel"));
    attentionLabel = v4->_attentionLabel;
    v4->_attentionLabel = (UILabel *)v11;

    -[UILabel setNumberOfLines:](v4->_attentionLabel, "setNumberOfLines:", 2LL);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](&OBJC_CLASS___UIColor, "systemRedColor"));
    -[UILabel setTextColor:](v4->_activeWindowLabel, "setTextColor:", v13);
    -[UILabel setTextColor:](v4->_focusedSceneLabel, "setTextColor:", v13);
    -[UILabel setTextColor:](v4->_applicationSceneAssertionsLabel, "setTextColor:", v13);
    v14 = v4->_attentionLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor magentaColor](&OBJC_CLASS___UIColor, "magentaColor"));
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    -[PBUIDebugSceneStackView addArrangedSubview:](v4, "addArrangedSubview:", v4->_activeWindowLabel);
    -[PBUIDebugSceneStackView addArrangedSubview:](v4, "addArrangedSubview:", v4->_focusedSceneLabel);
    -[PBUIDebugSceneStackView addArrangedSubview:](v4, "addArrangedSubview:", v4->_applicationSceneAssertionsLabel);
    -[PBUIDebugSceneStackView addArrangedSubview:](v4, "addArrangedSubview:", v4->_attentionLabel);
  }

  return v4;
}

- (void)setActiveWindow:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Active Window: %@",  a3));
  -[UILabel setText:](self->_activeWindowLabel, "setText:", v4);
}

- (void)setFocusedSceneHandle:(id)a3
{
  focusedSceneLabel = self->_focusedSceneLabel;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Focused Scene: %@",  a3));
  -[UILabel setText:](focusedSceneLabel, "setText:", v4);
}

- (void)setCurrentApplicationScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 settings]);
  unsigned int v6 = [v5 isUISubclass];

  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 settings]);
    uint64_t v8 = UIApplicationSceneDeactivationReasonMaskDescriptionComponents([v7 deactivationReasons]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ([v9 count])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue([v4 clientProcess]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
      v12 = v11;
      if (v11)
      {
        id v13 = v11;
      }

      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v4 clientHandle]);
        id v13 = (id)objc_claimAutoreleasedReturnValue([v15 bundleIdentifier]);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsJoinedByString:", @", "));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Assertions: %@",  v13,  v16));
    }

    else
    {
      v14 = 0LL;
    }
  }

  else
  {
    v14 = 0LL;
  }

  -[UILabel setText:](self->_applicationSceneAssertionsLabel, "setText:", v14);
  -[UILabel setHidden:](self->_applicationSceneAssertionsLabel, "setHidden:", v14 == 0LL);
}

- (void)setAttentionActiveApplicationScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 clientSettings]);
    if ([v6 isUISubclass])
    {
      id v7 = [v6 idleTimerDisabled];
      attentionLabel = self->_attentionLabel;
      uint64_t v9 = (objc_class *)objc_opt_class(v5);
      v10 = NSStringFromClass(v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AttentionScene: %@(%p) id: %@ shouldDisableTimers: %@",  v11,  v5,  v12,  v13));
      -[UILabel setText:](attentionLabel, "setText:", v14);
    }

    else
    {
      -[UILabel setText:](self->_attentionLabel, "setText:", @"Not UISubclass scene");
    }
  }

  else
  {
    -[UILabel setText:](self->_attentionLabel, "setText:", @"No Active Attention Scene");
  }
}

- (UILabel)activeWindowLabel
{
  return self->_activeWindowLabel;
}

- (UILabel)focusedSceneLabel
{
  return self->_focusedSceneLabel;
}

- (UILabel)applicationSceneAssertionsLabel
{
  return self->_applicationSceneAssertionsLabel;
}

- (UILabel)attentionLabel
{
  return self->_attentionLabel;
}

- (void).cxx_destruct
{
}

@end