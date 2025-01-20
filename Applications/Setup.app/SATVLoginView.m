@interface SATVLoginView
- (BOOL)touchInputEnabled;
- (NSArray)keyboardConstraints;
- (SATVLoginView)initWithFrame:(CGRect)a3;
- (UIButton)continueButton;
- (UIButton)skipButton;
- (UIButton)useSeparateIDsButton;
- (UIFocusEnvironment)preferredFocusedEnvironmentForGridLayoutGuide;
- (UIFocusGuide)gridFocusGuide;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UITextField)textField;
- (UIView)systemInputView;
- (id)preferredFocusedViewForGridLayoutGuide;
- (void)_gridAlignFrame:(CGRect *)a3;
- (void)_setSystemInputView:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setGridFocusGuide:(id)a3;
- (void)setKeyboardConstraints:(id)a3;
- (void)setPreferredFocusedEnvironmentForGridLayoutGuide:(id)a3;
- (void)setSystemInputView:(id)a3 touchInputEnabled:(BOOL)a4;
- (void)setTouchInputEnabled:(BOOL)a3;
- (void)updateConstraints;
@end

@implementation SATVLoginView

- (SATVLoginView)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___SATVLoginView;
  v3 = -[SATVLoginView initWithFrame:](&v33, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    v6 = objc_alloc(&OBJC_CLASS___TVSKLabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = -[TVSKLabel initWithFrame:](v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewTitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewTitleFont"));
    -[UILabel setFont:](v4->_titleLabel, "setFont:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_stepViewTitleDynamicColor](&OBJC_CLASS___UIColor, "tvsk_stepViewTitleDynamicColor"));
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v13);

    -[UILabel setTextAlignment:](v4->_titleLabel, "setTextAlignment:", 1LL);
    -[SATVLoginView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v14 = -[TVSKLabel initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSKLabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_stepViewSubtitleFont](&OBJC_CLASS___UIFont, "tvsk_stepViewSubtitleFont"));
    -[UILabel setFont:](v4->_subtitleLabel, "setFont:", v16);

    -[UILabel setTextAlignment:](v4->_subtitleLabel, "setTextAlignment:", 1LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_stepViewSubtitleDynamicColor]( &OBJC_CLASS___UIColor,  "tvsk_stepViewSubtitleDynamicColor"));
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v17);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 0LL);
    -[SATVLoginView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    v18 = -[UITextField initWithFrame:]( objc_alloc(&OBJC_CLASS___UITextField),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    textField = v4->_textField;
    v4->_textField = v18;

    -[UITextField _setBlurEnabled:](v4->_textField, "_setBlurEnabled:", 0LL);
    -[UITextField setAutocorrectionType:](v4->_textField, "setAutocorrectionType:", 1LL);
    -[SATVLoginView addSubview:](v4, "addSubview:", v4->_textField);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    continueButton = v4->_continueButton;
    v4->_continueButton = (UIButton *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleTitle3));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_continueButton, "titleLabel"));
    [v23 setFont:v22];

    -[SATVLoginView addSubview:](v4, "addSubview:", v4->_continueButton);
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    useSeparateIDsButton = v4->_useSeparateIDsButton;
    v4->_useSeparateIDsButton = (UIButton *)v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_useSeparateIDsButton, "titleLabel"));
    [v27 setFont:v26];

    -[SATVLoginView addSubview:](v4, "addSubview:", v4->_useSeparateIDsButton);
    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    skipButton = v4->_skipButton;
    v4->_skipButton = (UIButton *)v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v4->_skipButton, "titleLabel"));
    [v31 setFont:v30];

    -[SATVLoginView addSubview:](v4, "addSubview:", v4->_skipButton);
  }

  return v4;
}

- (void)setSystemInputView:(id)a3 touchInputEnabled:(BOOL)a4
{
  v6 = (UIView *)a3;
  if (self->_systemInputView != v6)
  {
    self->_touchInputEnabled = a4;
    v10 = v6;
    -[SATVLoginView _setSystemInputView:](self, "_setSystemInputView:", v6);
    if (self->_touchInputEnabled)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView gridFocusGuide](self, "gridFocusGuide"));
      -[SATVLoginView removeLayoutGuide:](self, "removeLayoutGuide:", v7);

      -[SATVLoginView setGridFocusGuide:](self, "setGridFocusGuide:", 0LL);
    }

    else
    {
      v8 = objc_alloc_init(&OBJC_CLASS___UIFocusGuide);
      -[SATVLoginView setGridFocusGuide:](self, "setGridFocusGuide:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView gridFocusGuide](self, "gridFocusGuide"));
      -[SATVLoginView addLayoutGuide:](self, "addLayoutGuide:", v9);
    }

    v6 = v10;
  }
}

- (void)setPreferredFocusedEnvironmentForGridLayoutGuide:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView gridFocusGuide](self, "gridFocusGuide"));
  v6 = v5;
  if (v4)
  {
    id v8 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
    [v6 setPreferredFocusEnvironments:v7];
  }

  else
  {
    [v5 setPreferredFocusEnvironments:&__NSArray0__struct];
  }
}

- (id)preferredFocusedViewForGridLayoutGuide
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView gridFocusGuide](self, "gridFocusGuide"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredFocusEnvironments]);

  if ([v3 count]) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (void)updateConstraints
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView keyboardConstraints](self, "keyboardConstraints"));

  if (!v3)
  {
    unsigned int v4 = -[SATVLoginView touchInputEnabled](self, "touchInputEnabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  3LL,  0LL,  self,  3LL,  1.0,  485.0));

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v7,  1LL,  0LL,  self,  1LL,  1.0,  0.0));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v9,  2LL,  0LL,  self,  2LL,  1.0,  0.0));

      v17 = v6;
      v11 = &v17;
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v5,  3LL,  0LL,  self,  3LL,  1.0,  0.0));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v12,  4LL,  0LL,  self,  4LL,  1.0,  0.0));

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  v13,  1LL,  0LL,  self,  1LL,  1.0,  140.0));

      v16 = v6;
      v11 = &v16;
    }

    v11[1] = v8;
    v11[2] = v10;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:"));
    -[SATVLoginView setKeyboardConstraints:](self, "setKeyboardConstraints:", v14);

    -[SATVLoginView addConstraints:](self, "addConstraints:", self->_keyboardConstraints);
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SATVLoginView;
  -[SATVLoginView updateConstraints](&v15, "updateConstraints");
}

- (void)layoutSubviews
{
  v186.receiver = self;
  v186.super_class = (Class)&OBJC_CLASS___SATVLoginView;
  -[SATVLoginView layoutSubviews](&v186, "layoutSubviews");
  -[SATVLoginView bounds](self, "bounds");
  double v168 = v4;
  double v169 = v3;
  double v6 = v5;
  double v8 = v7;
  v185.origin.double x = 0.0;
  v185.origin.double y = 0.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "sizeThatFits:", 1144.0, 3.40282347e38);
  double v11 = v10;
  CGFloat v13 = v12;
  v185.size.double width = v10;
  v185.size.double height = v12;

  v184.origin.double x = 0.0;
  v184.origin.double y = 0.0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v14, "sizeThatFits:", 1144.0, 3.40282347e38);
  double v16 = v15;
  double v18 = v17;
  v184.size.double width = v15;
  v184.size.double height = v17;

  v183.origin.double x = 0.0;
  v183.origin.double y = 0.0;
  v183.size.double width = 600.0;
  v183.size.double height = 70.0;
  __int128 v180 = xmmword_1000C46D0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView continueButton](self, "continueButton"));
  objc_msgSend(v19, "sizeThatFits:", v6, v8);
  double v21 = v20;
  double v158 = v22;
  CGFloat v181 = v22;
  CGFloat v182 = v20;

  __int128 v177 = xmmword_1000C4790;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView useSeparateIDsButton](self, "useSeparateIDsButton"));
  objc_msgSend(v23, "sizeThatFits:", v6, v8);
  double v160 = v25;
  double v162 = v24;
  CGFloat v178 = v24;
  CGFloat v179 = v25;

  __int128 v174 = xmmword_1000C47A0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView skipButton](self, "skipButton"));
  objc_msgSend(v26, "sizeThatFits:", v6, v8);
  double v164 = v28;
  double v166 = v27;
  double v175 = v27;
  double v176 = v28;

  if (!-[SATVLoginView touchInputEnabled](self, "touchInputEnabled"))
  {
    -[SATVLoginView _gridAlignFrame:](self, "_gridAlignFrame:", &v185);
    v185.origin.double y = 128.0;
    -[SATVLoginView _gridAlignFrame:](self, "_gridAlignFrame:", &v184);
    v184.origin.double y = 241.0;
    -[SATVLoginView _gridAlignFrame:](self, "_gridAlignFrame:", &v183);
    v183.origin.double y = 418.0;
    -[SATVLoginView _gridAlignFrame:](self, "_gridAlignFrame:", &v180);
    *((void *)&v180 + 1) = 0x4083000000000000LL;
    -[SATVLoginView _gridAlignFrame:](self, "_gridAlignFrame:", &v177);
    *((void *)&v177 + 1) = 0x408B900000000000LL;
    -[SATVLoginView _gridAlignFrame:](self, "_gridAlignFrame:", &v174);
    *((void *)&v174 + 1) = 0x4088E00000000000LL;
    double v170 = 0.0;
    double v171 = 0.0;
    double v172 = 1144.0;
    v202.origin.double y = v168;
    v202.origin.double x = v169;
    v202.size.double width = v6;
    v202.size.double height = v8;
    double Height = CGRectGetHeight(v202);
    -[SATVLoginView _gridAlignFrame:](self, "_gridAlignFrame:", &v170);
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView gridFocusGuide](self, "gridFocusGuide"));
    objc_msgSend(v96, "_setManualLayoutFrame:", v170, v171, v172, Height);

    double x = v185.origin.x;
    double y = v185.origin.y;
    double width = v185.size.width;
    double v98 = v185.size.height;
    goto LABEL_19;
  }

  double v29 = v13;
  double v30 = v168;
  CGFloat v31 = UIRectCenteredXInRect(0.0, 0.0, v11, v29, v169, v168, v6, v8);
  CGFloat v154 = v32;
  CGFloat v155 = v31;
  v185.origin.double x = v31;
  v185.size.double width = v32;
  v185.size.double height = v33;
  CGFloat v157 = v33;
  v185.origin.double y = 128.0;
  CGFloat v34 = UIRectCenteredXInRect(0.0, 0.0, v16, v18, v169, v168, v6, v8);
  CGFloat v148 = v35;
  CGFloat v149 = v34;
  v184.origin.double x = v34;
  v184.size.double width = v35;
  v184.size.double height = v36;
  CGFloat v147 = v36;
  v184.origin.double y = 241.0;
  CGFloat v37 = UIRectCenteredXInRect(0.0, 0.0, 600.0, 70.0, v169, v168, v6, v8);
  CGFloat v143 = v38;
  CGFloat v145 = v37;
  v183.origin.double x = v37;
  v183.size.double width = v38;
  v183.size.double height = v39;
  CGFloat rect = v39;
  v183.origin.double y = 390.0;
  CGFloat v40 = UIRectCenteredXInRect(0.0, 713.0, v158, v21, v169, v168, v6, v8);
  CGFloat v152 = v41;
  CGFloat v153 = v40;
  *(CGFloat *)&__int128 v180 = v40;
  CGFloat v181 = v41;
  CGFloat v182 = v42;
  double v159 = v42;
  *((void *)&v180 + 1) = 0x4086480000000000LL;
  CGFloat v150 = 856.0;
  double v43 = UIRectCenteredXInRect(0.0, 856.0, v162, v160, v169, v168, v6, v8);
  double v45 = v44;
  double v47 = v46;
  *(double *)&__int128 v177 = v43;
  CGFloat v178 = v44;
  CGFloat v179 = v46;
  *((void *)&v177 + 1) = 0x408AC00000000000LL;
  *(void *)&__int128 v174 = UIRectCenteredXInRect(0.0, 942.0, v166, v164, v169, v168, v6, v8);
  double v175 = v48;
  double v176 = v49;
  *((void *)&v174 + 1) = 0x408D700000000000LL;
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
  [v50 frame];
  double v167 = 713.0;
  double v51 = 713.0 - (CGRectGetMaxY(v187) + 2.0);

  double v52 = v8;
  CGFloat v161 = v45;
  CGFloat v163 = v43;
  CGFloat v151 = v47;
  if (v51 >= 0.0)
  {
    *(double *)&uint64_t v165 = 128.0;
    double v93 = v169;
    double width = v154;
    double x = v155;
LABEL_11:
    double v91 = v152;
    double v90 = v153;
    goto LABEL_12;
  }

  double v139 = v6;
  double v140 = v8;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
  [v53 frame];
  CGFloat v55 = v54;
  CGFloat v57 = v56;
  CGFloat v59 = v58;
  CGFloat v61 = v60;

  v188.origin.double x = v55;
  v188.origin.double y = v57;
  v188.size.double width = v59;
  v188.size.double height = v61;
  CGRect v189 = CGRectOffset(v188, 0.0, v51);
  double v62 = v189.origin.x;
  double v63 = v189.origin.y;
  double v64 = v189.size.width;
  double v65 = v189.size.height;
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
  objc_msgSend(v66, "setFrame:", v62, v63, v64, v65);

  v190.origin.double y = 390.0;
  v190.size.double width = v143;
  v190.origin.double x = v145;
  v190.size.double height = rect;
  CGRect v191 = CGRectOffset(v190, 0.0, v51);
  CGFloat v144 = v191.origin.x;
  double v146 = v191.origin.y;
  CGRect v183 = v191;
  CGFloat recta = v191.size.width;
  CGFloat v138 = v191.size.height;
  v191.origin.double y = 128.0;
  v191.size.double width = v154;
  v191.origin.double x = v155;
  v191.size.double height = v157;
  CGRect v192 = CGRectOffset(v191, 0.0, v51);
  CGFloat v67 = v192.origin.x;
  double v68 = v192.origin.y;
  double width = v192.size.width;
  CGFloat v70 = v192.size.height;
  CGRect v185 = v192;
  v192.origin.double y = 241.0;
  v192.size.double width = v148;
  v192.origin.double x = v149;
  v192.size.double height = v147;
  CGRect v193 = CGRectOffset(v192, 0.0, v51);
  CGFloat v71 = v193.origin.x;
  CGRect v184 = v193;
  if (v68 + -90.0 >= 0.0)
  {
    *(double *)&uint64_t v165 = v68;
    CGFloat v157 = v70;
    double v52 = v140;
    double v30 = v168;
    double v93 = v169;
    double x = v67;
    goto LABEL_11;
  }

  CGFloat v72 = v193.origin.y;
  CGFloat v73 = v193.size.width;
  CGFloat v74 = v193.size.height;
  v194.origin.double x = v67;
  v194.origin.double y = v68;
  v194.size.double width = width;
  v194.size.double height = v70;
  CGRect v195 = CGRectOffset(v194, 0.0, -(v68 + -90.0));
  CGFloat v75 = v195.origin.y;
  CGFloat v76 = v195.size.height;
  CGFloat v156 = v195.origin.x;
  CGRect v185 = v195;
  double width = v195.size.width;
  v195.origin.double x = v71;
  v195.origin.double y = v72;
  v195.size.double width = v73;
  v195.size.double height = v74;
  CGRect v184 = CGRectOffset(v195, 0.0, -(v68 + -90.0));
  CGFloat MaxY = CGRectGetMaxY(v184);
  double v78 = v146;
  double v79 = v146 - (MaxY + 24.0);
  CGFloat v157 = v76;
  *(double *)&uint64_t v165 = v75;
  if (v79 >= 0.0)
  {
    double v6 = v139;
    double v52 = v140;
    double v30 = v168;
    double v93 = v169;
    double x = v156;
    goto LABEL_11;
  }

  CGFloat v80 = -v79;
  CGFloat v82 = recta;
  CGFloat v81 = v144;
  CGFloat v83 = v138;
  CGRect v183 = CGRectOffset(*(CGRect *)(&v78 - 1), 0.0, v80);
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
  [v84 frame];
  CGRect v197 = CGRectOffset(v196, 0.0, v80);
  double v85 = v197.origin.x;
  double v86 = v197.origin.y;
  double v87 = v197.size.width;
  double v88 = v197.size.height;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView systemInputView](self, "systemInputView"));
  objc_msgSend(v89, "setFrame:", v85, v86, v87, v88);

  v198.origin.double y = 713.0;
  v198.size.double width = v152;
  v198.origin.double x = v153;
  v198.size.double height = v159;
  CGRect v199 = CGRectOffset(v198, 0.0, v80);
  double v90 = v199.origin.x;
  double v91 = v199.size.width;
  *(CGFloat *)&__int128 v180 = v199.origin.x;
  *((void *)&v180 + 1) = *(void *)&v199.origin.y;
  CGFloat v181 = v199.size.width;
  CGFloat v182 = v199.size.height;
  double v167 = v199.origin.y;
  double v159 = v199.size.height;
  double v92 = 856.0 - (CGRectGetMaxY(v199) + 2.0);
  double v6 = v139;
  double v52 = v140;
  double v30 = v168;
  double v93 = v169;
  double x = v156;
  if (v92 >= 0.0)
  {
    CGFloat v150 = 856.0;
  }

  else
  {
    CGFloat v95 = -v92;
    v200.origin.double y = 856.0;
    v200.size.double width = v161;
    v200.origin.double x = v163;
    v200.size.double height = v151;
    CGRect v201 = CGRectOffset(v200, 0.0, v95);
    CGFloat v161 = v201.size.width;
    CGFloat v163 = v201.origin.x;
    *(CGFloat *)&__int128 v177 = v201.origin.x;
    *((void *)&v177 + 1) = *(void *)&v201.origin.y;
    CGFloat v150 = v201.origin.y;
    CGFloat v151 = v201.size.height;
    CGFloat v178 = v201.size.width;
    CGFloat v179 = v201.size.height;
  }

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  if (!-[SATVLoginView touchInputEnabled](self, "touchInputEnabled", a3, a4))
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    id v14 = (id)objc_claimAutoreleasedReturnValue([v5 focusedView]);

    id v6 = (id)objc_claimAutoreleasedReturnValue(-[SATVLoginView continueButton](self, "continueButton"));
    double v7 = v14;
    if (v14 != v6)
    {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(-[SATVLoginView skipButton](self, "skipButton"));
      if (v14 != (id)v8)
      {
        v9 = (void *)v8;
        id v10 = (id)objc_claimAutoreleasedReturnValue(-[SATVLoginView useSeparateIDsButton](self, "useSeparateIDsButton"));

        if (v14 != v10)
        {
          double v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView gridFocusGuide](self, "gridFocusGuide"));
          CGFloat v12 = v11;
          uint64_t v13 = 1LL;
LABEL_9:
          [v11 setEnabled:v13];

          return;
        }

- (void)_gridAlignFrame:(CGRect *)a3
{
  a3->origin.double x = CGRectGetWidth(*a3) * -0.5 + 1258.0;
}

- (void)_setSystemInputView:(id)a3
{
  double v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_systemInputView, "removeFromSuperview");
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginView keyboardConstraints](self, "keyboardConstraints"));
  -[SATVLoginView removeConstraints:](self, "removeConstraints:", v5);

  -[SATVLoginView setKeyboardConstraints:](self, "setKeyboardConstraints:", 0LL);
  systemInputView = self->_systemInputView;
  self->_systemInputView = v4;
  double v7 = v4;

  -[SATVLoginView addSubview:](self, "addSubview:", self->_systemInputView);
  -[SATVLoginView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (UITextField)textField
{
  return self->_textField;
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (UIButton)useSeparateIDsButton
{
  return self->_useSeparateIDsButton;
}

- (UIView)systemInputView
{
  return self->_systemInputView;
}

- (UIFocusEnvironment)preferredFocusedEnvironmentForGridLayoutGuide
{
  return self->_preferredFocusedEnvironmentForGridLayoutGuide;
}

- (NSArray)keyboardConstraints
{
  return self->_keyboardConstraints;
}

- (void)setKeyboardConstraints:(id)a3
{
}

- (BOOL)touchInputEnabled
{
  return self->_touchInputEnabled;
}

- (void)setTouchInputEnabled:(BOOL)a3
{
  self->_touchInputEnabled = a3;
}

- (UIFocusGuide)gridFocusGuide
{
  return self->_gridFocusGuide;
}

- (void)setGridFocusGuide:(id)a3
{
}

- (void).cxx_destruct
{
}

@end