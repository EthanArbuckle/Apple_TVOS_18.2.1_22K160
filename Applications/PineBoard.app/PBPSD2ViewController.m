@interface PBPSD2ViewController
- (NSLayoutConstraint)subtitleConstraint;
- (PBCFUserNotification)notification;
- (PBPSD2UserNotification)userNotification;
- (PBPSD2ViewController)init;
- (PBUserNotificationViewControllerDelegate)delegate;
- (UIImageView)QRCodeImageView;
- (UILabel)PINCodeLabel;
- (UILabel)PINCodeSubtitleLabel;
- (UILabel)PINTitleLabel;
- (UILabel)PINURLLabel;
- (UILabel)PINURLSubtitleLabel;
- (UILabel)QRCodeSubtitleLabel;
- (UILabel)QRCodeTitleLabel;
- (UILabel)dividerLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)bottomDividerView;
- (UIView)topDividerView;
- (id)_QRCodeImage;
- (void)_dismiss;
- (void)_updateContent;
- (void)setBottomDividerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDividerLabel:(id)a3;
- (void)setNotification:(id)a3;
- (void)setPINCodeLabel:(id)a3;
- (void)setPINCodeSubtitleLabel:(id)a3;
- (void)setPINTitleLabel:(id)a3;
- (void)setPINURLLabel:(id)a3;
- (void)setPINURLSubtitleLabel:(id)a3;
- (void)setQRCodeImageView:(id)a3;
- (void)setQRCodeSubtitleLabel:(id)a3;
- (void)setQRCodeTitleLabel:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopDividerView:(id)a3;
- (void)setUserNotification:(id)a3;
- (void)viewDidLoad;
@end

@implementation PBPSD2ViewController

- (PBPSD2ViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBPSD2ViewController;
  v2 = -[PBPSD2ViewController init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[PBPSD2ViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 8LL);
  }
  return v3;
}

- (void)viewDidLoad
{
  v213.receiver = self;
  v213.super_class = (Class)&OBJC_CLASS___PBPSD2ViewController;
  -[PBPSD2ViewController viewDidLoad](&v213, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2ViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  BOOL v5 = [v4 userInterfaceLayoutDirection] == (id)1;

  uint64_t v6 = 2LL * v5;
  uint64_t v7 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  v212 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.5));
  v8 = objc_alloc(&OBJC_CLASS___UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v12 = -[UILabel initWithFrame:](v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v12;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v14 = self->_titleLabel;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleTitle1,  1024LL));
  -[UILabel setFont:](v14, "setFont:", v15);

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", v6);
  v16 = (void *)v7;
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v7);
  [v3 addSubview:self->_titleLabel];
  v17 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v17;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_subtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v19 = self->_subtitleLabel;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:"));
  -[UILabel setFont:](v19, "setFont:", v20);

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1LL);
  v21 = v16;
  v211 = v16;
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v16);
  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 2LL);
  [v3 addSubview:self->_subtitleLabel];
  v22 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  PINTitleLabel = self->_PINTitleLabel;
  self->_PINTitleLabel = v22;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_PINTitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v24 = self->_PINTitleLabel;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:"));
  -[UILabel setFont:](v24, "setFont:", v25);

  -[UILabel setTextAlignment:](self->_PINTitleLabel, "setTextAlignment:", v6);
  -[UILabel setTextColor:](self->_PINTitleLabel, "setTextColor:", v21);
  -[UILabel setNumberOfLines:](self->_PINTitleLabel, "setNumberOfLines:", 2LL);
  [v3 addSubview:self->_PINTitleLabel];
  v26 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  PINURLLabel = self->_PINURLLabel;
  self->_PINURLLabel = v26;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_PINURLLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v28 = self->_PINURLLabel;
  v29 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleHeadline,  1024LL));
  -[UILabel setFont:](v28, "setFont:", v29);

  -[UILabel setTextAlignment:](self->_PINURLLabel, "setTextAlignment:", v6);
  -[UILabel setTextColor:](self->_PINURLLabel, "setTextColor:", v212);
  -[UILabel setNumberOfLines:](self->_PINURLLabel, "setNumberOfLines:", 2LL);
  [v3 addSubview:self->_PINURLLabel];
  v30 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  PINURLSubtitleLabel = self->_PINURLSubtitleLabel;
  self->_PINURLSubtitleLabel = v30;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_PINURLSubtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v32 = self->_PINURLSubtitleLabel;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v32, "setFont:", v33);

  -[UILabel setTextAlignment:](self->_PINURLSubtitleLabel, "setTextAlignment:", v6);
  -[UILabel setTextColor:](self->_PINURLSubtitleLabel, "setTextColor:", v212);
  -[UILabel setNumberOfLines:](self->_PINURLSubtitleLabel, "setNumberOfLines:", 2LL);
  [v3 addSubview:self->_PINURLSubtitleLabel];
  v34 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  PINCodeLabel = self->_PINCodeLabel;
  self->_PINCodeLabel = v34;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_PINCodeLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v36 = self->_PINCodeLabel;
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
  -[UILabel setFont:](v36, "setFont:", v37);

  -[UILabel setTextAlignment:](self->_PINCodeLabel, "setTextAlignment:", v6);
  -[UILabel setTextColor:](self->_PINCodeLabel, "setTextColor:", v211);
  [v3 addSubview:self->_PINCodeLabel];
  v38 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  PINCodeSubtitleLabel = self->_PINCodeSubtitleLabel;
  self->_PINCodeSubtitleLabel = v38;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_PINCodeSubtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v40 = self->_PINCodeSubtitleLabel;
  v41 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v40, "setFont:", v41);

  -[UILabel setTextAlignment:](self->_PINCodeSubtitleLabel, "setTextAlignment:", v6);
  -[UILabel setTextColor:](self->_PINCodeSubtitleLabel, "setTextColor:", v212);
  -[UILabel setNumberOfLines:](self->_PINCodeSubtitleLabel, "setNumberOfLines:", 2LL);
  [v3 addSubview:self->_PINCodeSubtitleLabel];
  v42 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  topDividerView = self->_topDividerView;
  self->_topDividerView = v42;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_topDividerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIView setBackgroundColor:](self->_topDividerView, "setBackgroundColor:", v212);
  [v3 addSubview:self->_topDividerView];
  v44 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  dividerLabel = self->_dividerLabel;
  self->_dividerLabel = v44;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_dividerLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v46 = self->_dividerLabel;
  v47 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont _preferredFontForTextStyle:variant:]( &OBJC_CLASS___UIFont,  "_preferredFontForTextStyle:variant:",  UIFontTextStyleBody,  1024LL));
  -[UILabel setFont:](v46, "setFont:", v47);

  -[UILabel setTextColor:](self->_dividerLabel, "setTextColor:", v211);
  [v3 addSubview:self->_dividerLabel];
  v48 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  bottomDividerView = self->_bottomDividerView;
  self->_bottomDividerView = v48;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_bottomDividerView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIView setBackgroundColor:](self->_bottomDividerView, "setBackgroundColor:", v212);
  [v3 addSubview:self->_bottomDividerView];
  v50 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  QRCodeTitleLabel = self->_QRCodeTitleLabel;
  self->_QRCodeTitleLabel = v50;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_QRCodeTitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v52 = self->_QRCodeTitleLabel;
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleTitle2));
  -[UILabel setFont:](v52, "setFont:", v53);

  -[UILabel setTextAlignment:](self->_QRCodeTitleLabel, "setTextAlignment:", 1LL);
  -[UILabel setTextColor:](self->_QRCodeTitleLabel, "setTextColor:", v211);
  -[UILabel setNumberOfLines:](self->_QRCodeTitleLabel, "setNumberOfLines:", 2LL);
  [v3 addSubview:self->_QRCodeTitleLabel];
  v54 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  QRCodeSubtitleLabel = self->_QRCodeSubtitleLabel;
  self->_QRCodeSubtitleLabel = v54;

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( self->_QRCodeSubtitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  v56 = self->_QRCodeSubtitleLabel;
  v57 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](v56, "setFont:", v57);

  -[UILabel setTextColor:](self->_QRCodeSubtitleLabel, "setTextColor:", v212);
  -[UILabel setTextAlignment:](self->_QRCodeSubtitleLabel, "setTextAlignment:", 1LL);
  -[UILabel setNumberOfLines:](self->_QRCodeSubtitleLabel, "setNumberOfLines:", 3LL);
  [v3 addSubview:self->_QRCodeSubtitleLabel];
  v58 = -[UIImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIImageView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  QRCodeImageView = self->_QRCodeImageView;
  self->_QRCodeImageView = v58;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( self->_QRCodeImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  -[UIImageView setContentMode:](self->_QRCodeImageView, "setContentMode:", 4LL);
  v60 = self->_QRCodeImageView;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  -[UIImageView setBackgroundColor:](v60, "setBackgroundColor:", v61);

  -[UIImageView _setCornerRadius:](self->_QRCodeImageView, "_setCornerRadius:", 12.0);
  [v3 addSubview:self->_QRCodeImageView];
  v62 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
  [v3 addLayoutGuide:v62];
  v210 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
  [v3 addLayoutGuide:v210];
  v209 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_titleLabel, "centerXAnchor"));
  v208 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v207 = (void *)objc_claimAutoreleasedReturnValue([v209 constraintEqualToAnchor:v208]);
  v214[0] = v207;
  v206 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_titleLabel, "firstBaselineAnchor"));
  v205 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
  v204 = (void *)objc_claimAutoreleasedReturnValue([v206 constraintEqualToAnchor:v205 constant:164.0]);
  v214[1] = v204;
  v203 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_titleLabel, "widthAnchor"));
  v202 = (void *)objc_claimAutoreleasedReturnValue([v3 widthAnchor]);
  v201 = (void *)objc_claimAutoreleasedReturnValue([v203 constraintLessThanOrEqualToAnchor:v202]);
  v214[2] = v201;
  v200 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_subtitleLabel, "centerXAnchor"));
  v199 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v198 = (void *)objc_claimAutoreleasedReturnValue([v200 constraintEqualToAnchor:v199]);
  v214[3] = v198;
  v197 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_subtitleLabel, "firstBaselineAnchor"));
  v196 = (void *)objc_claimAutoreleasedReturnValue([v3 topAnchor]);
  v195 = (void *)objc_claimAutoreleasedReturnValue([v197 constraintEqualToAnchor:v196 constant:236.0]);
  v214[4] = v195;
  v194 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_subtitleLabel, "widthAnchor"));
  v193 = (void *)objc_claimAutoreleasedReturnValue([v194 constraintEqualToConstant:1360.0]);
  v214[5] = v193;
  v192 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v62, "leadingAnchor"));
  v191 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
  v190 = (void *)objc_claimAutoreleasedReturnValue([v192 constraintEqualToAnchor:v191 constant:144.0]);
  v214[6] = v190;
  v189 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v62, "widthAnchor"));
  v188 = (void *)objc_claimAutoreleasedReturnValue([v189 constraintEqualToConstant:640.0]);
  v214[7] = v188;
  v187 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v62, "heightAnchor"));
  v186 = (void *)objc_claimAutoreleasedReturnValue([v187 constraintEqualToConstant:640.0]);
  v214[8] = v186;
  v185 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v62, "topAnchor"));
  v184 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_PINTitleLabel, "topAnchor"));
  v183 = (void *)objc_claimAutoreleasedReturnValue([v185 constraintEqualToAnchor:v184]);
  v214[9] = v183;
  v182 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_PINTitleLabel, "firstBaselineAnchor"));
  v181 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_titleLabel, "lastBaselineAnchor"));
  v180 = (void *)objc_claimAutoreleasedReturnValue([v182 constraintGreaterThanOrEqualToAnchor:v181 constant:140.0]);
  v214[10] = v180;
  v179 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_PINTitleLabel, "leadingAnchor"));
  v178 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v62, "leadingAnchor"));
  v177 = (void *)objc_claimAutoreleasedReturnValue([v179 constraintEqualToAnchor:v178]);
  v214[11] = v177;
  v176 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_PINTitleLabel, "widthAnchor"));
  v147 = v62;
  v175 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v62, "widthAnchor"));
  v174 = (void *)objc_claimAutoreleasedReturnValue([v176 constraintEqualToAnchor:v175]);
  v214[12] = v174;
  v173 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_PINURLSubtitleLabel, "leadingAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_PINTitleLabel, "leadingAnchor"));
  v171 = (void *)objc_claimAutoreleasedReturnValue([v173 constraintEqualToAnchor:v172]);
  v214[13] = v171;
  v170 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_PINURLSubtitleLabel, "firstBaselineAnchor"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_PINTitleLabel, "lastBaselineAnchor"));
  v168 = (void *)objc_claimAutoreleasedReturnValue([v170 constraintEqualToAnchor:v169 constant:84.0]);
  v214[14] = v168;
  v167 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_PINURLSubtitleLabel, "widthAnchor"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_PINTitleLabel, "widthAnchor"));
  v165 = (void *)objc_claimAutoreleasedReturnValue([v167 constraintEqualToAnchor:v166]);
  v214[15] = v165;
  v164 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_PINURLLabel, "leadingAnchor"));
  v163 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_PINTitleLabel, "leadingAnchor"));
  v162 = (void *)objc_claimAutoreleasedReturnValue([v164 constraintEqualToAnchor:v163]);
  v214[16] = v162;
  v161 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_PINURLLabel, "firstBaselineAnchor"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_PINURLSubtitleLabel, "lastBaselineAnchor"));
  v159 = (void *)objc_claimAutoreleasedReturnValue([v161 constraintEqualToAnchor:v160 constant:54.0]);
  v214[17] = v159;
  v158 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_PINURLLabel, "widthAnchor"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_PINTitleLabel, "widthAnchor"));
  v156 = (void *)objc_claimAutoreleasedReturnValue([v158 constraintEqualToAnchor:v157]);
  v214[18] = v156;
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_PINCodeSubtitleLabel, "leadingAnchor"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_PINTitleLabel, "leadingAnchor"));
  v153 = (void *)objc_claimAutoreleasedReturnValue([v155 constraintEqualToAnchor:v154]);
  v214[19] = v153;
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_PINCodeSubtitleLabel, "firstBaselineAnchor"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_PINURLLabel, "lastBaselineAnchor"));
  v146 = (void *)objc_claimAutoreleasedReturnValue([v149 constraintEqualToAnchor:v150 constant:154.0]);
  v214[20] = v146;
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_PINCodeSubtitleLabel, "widthAnchor"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_PINTitleLabel, "widthAnchor"));
  v143 = (void *)objc_claimAutoreleasedReturnValue([v145 constraintEqualToAnchor:v144]);
  v214[21] = v143;
  v141 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_PINCodeLabel, "leadingAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_PINTitleLabel, "leadingAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue([v141 constraintEqualToAnchor:v139]);
  v214[22] = v138;
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_PINCodeLabel, "firstBaselineAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_PINCodeSubtitleLabel, "lastBaselineAnchor"));
  v134 = (void *)objc_claimAutoreleasedReturnValue([v137 constraintEqualToAnchor:v136 constant:80.0]);
  v214[23] = v134;
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_PINCodeLabel, "widthAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_PINTitleLabel, "widthAnchor"));
  v132 = (void *)objc_claimAutoreleasedReturnValue([v148 constraintEqualToAnchor:v133]);
  v214[24] = v132;
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_topDividerView, "bottomAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_dividerLabel, "firstBaselineAnchor"));
  v129 = (void *)objc_claimAutoreleasedReturnValue([v131 constraintEqualToAnchor:v130 constant:-35.0]);
  v214[25] = v129;
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_topDividerView, "centerXAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_dividerLabel, "centerXAnchor"));
  v126 = (void *)objc_claimAutoreleasedReturnValue([v128 constraintEqualToAnchor:v127]);
  v214[26] = v126;
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_topDividerView, "widthAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue([v125 constraintEqualToConstant:2.0]);
  v214[27] = v124;
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_topDividerView, "heightAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue([v123 constraintEqualToConstant:285.0]);
  v214[28] = v122;
  v121 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_dividerLabel, "centerXAnchor"));
  v152 = v3;
  v120 = (void *)objc_claimAutoreleasedReturnValue([v3 centerXAnchor]);
  v119 = (void *)objc_claimAutoreleasedReturnValue([v121 constraintEqualToAnchor:v120]);
  v214[29] = v119;
  v118 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_bottomDividerView, "topAnchor"));
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_dividerLabel, "firstBaselineAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue([v118 constraintEqualToAnchor:v117 constant:16.0]);
  v214[30] = v116;
  v115 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_bottomDividerView, "bottomAnchor"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_QRCodeImageView, "bottomAnchor"));
  v113 = (void *)objc_claimAutoreleasedReturnValue([v115 constraintEqualToAnchor:v114]);
  v214[31] = v113;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self->_bottomDividerView, "centerXAnchor"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerXAnchor](self->_dividerLabel, "centerXAnchor"));
  v111 = (void *)objc_claimAutoreleasedReturnValue([v112 constraintEqualToAnchor:v135]);
  v214[32] = v111;
  v110 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_bottomDividerView, "widthAnchor"));
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](self->_topDividerView, "widthAnchor"));
  v108 = (void *)objc_claimAutoreleasedReturnValue([v110 constraintEqualToAnchor:v109]);
  v214[33] = v108;
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_bottomDividerView, "heightAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](self->_topDividerView, "heightAnchor"));
  v107 = (void *)objc_claimAutoreleasedReturnValue([v140 constraintEqualToAnchor:v142]);
  v214[34] = v107;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide trailingAnchor](v210, "trailingAnchor"));
  v105 = (void *)objc_claimAutoreleasedReturnValue([v3 trailingAnchor]);
  v104 = (void *)objc_claimAutoreleasedReturnValue([v106 constraintEqualToAnchor:v105 constant:-254.0]);
  v214[35] = v104;
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v210, "widthAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue([v103 constraintEqualToConstant:430.0]);
  v214[36] = v102;
  v101 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v210, "heightAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide heightAnchor](v62, "heightAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue([v101 constraintEqualToAnchor:v100]);
  v214[37] = v99;
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide topAnchor](v210, "topAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_QRCodeTitleLabel, "topAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue([v98 constraintEqualToAnchor:v97]);
  v214[38] = v96;
  v95 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_QRCodeTitleLabel, "firstBaselineAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_PINTitleLabel, "firstBaselineAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue([v95 constraintEqualToAnchor:v94]);
  v214[39] = v93;
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_QRCodeTitleLabel, "leadingAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide leadingAnchor](v210, "leadingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue([v92 constraintEqualToAnchor:v91]);
  v214[40] = v90;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_QRCodeTitleLabel, "widthAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide widthAnchor](v210, "widthAnchor"));
  v87 = (void *)objc_claimAutoreleasedReturnValue([v89 constraintEqualToAnchor:v88]);
  v214[41] = v87;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_QRCodeSubtitleLabel, "firstBaselineAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_QRCodeTitleLabel, "lastBaselineAnchor"));
  v84 = (void *)objc_claimAutoreleasedReturnValue([v86 constraintEqualToAnchor:v85 constant:84.0]);
  v214[42] = v84;
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_QRCodeSubtitleLabel, "leadingAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_QRCodeTitleLabel, "leadingAnchor"));
  v81 = (void *)objc_claimAutoreleasedReturnValue([v83 constraintEqualToAnchor:v82]);
  v214[43] = v81;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_QRCodeSubtitleLabel, "widthAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_QRCodeTitleLabel, "widthAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue([v80 constraintEqualToAnchor:v79]);
  v214[44] = v78;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_QRCodeImageView, "topAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_QRCodeSubtitleLabel, "lastBaselineAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue([v77 constraintEqualToAnchor:v151 constant:40.0]);
  v214[45] = v63;
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_QRCodeImageView, "centerXAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[UILayoutGuide centerXAnchor](v210, "centerXAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue([v64 constraintEqualToAnchor:v65]);
  v214[46] = v66;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_QRCodeImageView, "widthAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue([v67 constraintEqualToConstant:430.0]);
  v214[47] = v68;
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_QRCodeImageView, "heightAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue([v69 constraintEqualToConstant:430.0]);
  v214[48] = v70;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v214, 49LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel firstBaselineAnchor](self->_PINTitleLabel, "firstBaselineAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel lastBaselineAnchor](self->_subtitleLabel, "lastBaselineAnchor"));
  v74 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue([v72 constraintEqualToAnchor:v73 constant:132.0]);
  subtitleConstraint = self->_subtitleConstraint;
  self->_subtitleConstraint = v74;

  -[PBPSD2ViewController _updateContent](self, "_updateContent");
  v76 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_dismiss");
  -[UITapGestureRecognizer setAllowedPressTypes:](v76, "setAllowedPressTypes:", &off_1003FE9C8);
  [v152 addGestureRecognizer:v76];
}

- (PBCFUserNotification)notification
{
  return (PBCFUserNotification *)self->_userNotification;
}

- (void)setNotification:(id)a3
{
  id v4 = a3;
  if ([v4 notificationType] != (id)5)
  {
    id v5 = sub_10020EB34();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_1002939BC(v4, v6);
    }
  }

  -[PBPSD2ViewController setUserNotification:](self, "setUserNotification:", v4);
}

- (void)setUserNotification:(id)a3
{
  id v5 = (PBPSD2UserNotification *)a3;
  if (self->_userNotification != v5)
  {
    objc_storeStrong((id *)&self->_userNotification, a3);
  }
}

- (void)_updateContent
{
  titleLabel = self->_titleLabel;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification alertHeader](self->_userNotification, "alertHeader"));
  if (v4)
  {
    -[UILabel setText:](titleLabel, "setText:", v4);
  }

  else
  {
    id v5 = sub_1001C307C(@"PSD2Title", 0LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    -[UILabel setText:](titleLabel, "setText:", v6);
  }

  subtitleLabel = self->_subtitleLabel;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification alertMessage](self->_userNotification, "alertMessage"));
  -[UILabel setText:](subtitleLabel, "setText:", v8);

  PINTitleLabel = self->_PINTitleLabel;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification PINCodeTitle](self->_userNotification, "PINCodeTitle"));
  if (v10)
  {
    -[UILabel setText:](PINTitleLabel, "setText:", v10);
  }

  else
  {
    id v11 = sub_1001C307C(@"PSD2PINCodeTitle", 0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[UILabel setText:](PINTitleLabel, "setText:", v12);
  }

  PINURLLabel = self->_PINURLLabel;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification PINCodeURL](self->_userNotification, "PINCodeURL"));
  -[UILabel setText:](PINURLLabel, "setText:", v14);

  PINURLSubtitleLabel = self->_PINURLSubtitleLabel;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification PINCodeURLSubtitle](self->_userNotification, "PINCodeURLSubtitle"));
  if (v16)
  {
    -[UILabel setText:](PINURLSubtitleLabel, "setText:", v16);
  }

  else
  {
    id v17 = sub_1001C307C(@"PSD2PINCodeURLSubtitle", 0LL);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[UILabel setText:](PINURLSubtitleLabel, "setText:", v18);
  }

  PINCodeLabel = self->_PINCodeLabel;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification PINCode](self->_userNotification, "PINCode"));
  -[UILabel setText:](PINCodeLabel, "setText:", v20);

  PINCodeSubtitleLabel = self->_PINCodeSubtitleLabel;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification PINCodeSubtitle](self->_userNotification, "PINCodeSubtitle"));
  if (v22)
  {
    -[UILabel setText:](PINCodeSubtitleLabel, "setText:", v22);
  }

  else
  {
    id v23 = sub_1001C307C(@"PSD2PINCodeSubtitle", 0LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    -[UILabel setText:](PINCodeSubtitleLabel, "setText:", v24);
  }

  dividerLabel = self->_dividerLabel;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification dividerText](self->_userNotification, "dividerText"));
  if (v26)
  {
    -[UILabel setText:](dividerLabel, "setText:", v26);
  }

  else
  {
    id v27 = sub_1001C307C(@"PSD2DividerText", 0LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    -[UILabel setText:](dividerLabel, "setText:", v28);
  }

  QRCodeTitleLabel = self->_QRCodeTitleLabel;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification QRCodeTitle](self->_userNotification, "QRCodeTitle"));
  if (v30)
  {
    -[UILabel setText:](QRCodeTitleLabel, "setText:", v30);
  }

  else
  {
    id v31 = sub_1001C307C(@"PSD2QRCodeTitle", 0LL);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    -[UILabel setText:](QRCodeTitleLabel, "setText:", v32);
  }

  QRCodeSubtitleLabel = self->_QRCodeSubtitleLabel;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification QRCodeSubtitle](self->_userNotification, "QRCodeSubtitle"));
  if (v34)
  {
    -[UILabel setText:](QRCodeSubtitleLabel, "setText:", v34);
  }

  else
  {
    id v35 = sub_1001C307C(@"PSD2QRCodeSubitle", 0LL);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    -[UILabel setText:](QRCodeSubtitleLabel, "setText:", v36);
  }

  QRCodeImageView = self->_QRCodeImageView;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2ViewController _QRCodeImage](self, "_QRCodeImage"));
  -[UIImageView setImage:](QRCodeImageView, "setImage:", v38);

  subtitleConstraint = self->_subtitleConstraint;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification alertMessage](self->_userNotification, "alertMessage"));
  -[NSLayoutConstraint setActive:](subtitleConstraint, "setActive:", [v40 length] != 0);
}

- (id)_QRCodeImage
{
  p_userNotification = (uint64_t *)&self->_userNotification;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2UserNotification QRCodeURL](self->_userNotification, "QRCodeURL"));
  id v4 = v3;
  if (v3)
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:5]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](&OBJC_CLASS___CIFilter, "filterWithName:", @"CIQRCodeGenerator"));
    [v6 setValue:v5 forKey:@"inputMessage"];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 outputImage]);
    [v7 extent];
    CGAffineTransformMakeScale(&v18, 380.0 / v8, 380.0 / v9);
    CGAffineTransform v17 = v18;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 imageByApplyingTransform:&v17]);

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v11 scale];
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIImage imageWithCIImage:scale:orientation:]( &OBJC_CLASS___UIImage,  "imageWithCIImage:scale:orientation:",  v10,  0LL));

    if (!v12)
    {
      id v13 = sub_10020EB34();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100293ACC(p_userNotification, (uint64_t)v4, v14);
      }
    }
  }

  else
  {
    id v15 = sub_10020EB34();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100293A54(p_userNotification, v5);
    }
    v12 = 0LL;
  }

  return v12;
}

- (void)_dismiss
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBPSD2ViewController delegate](self, "delegate"));
  [v3 didCancelUserNotificationViewController:self];
}

- (PBUserNotificationViewControllerDelegate)delegate
{
  return (PBUserNotificationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBPSD2UserNotification)userNotification
{
  return self->_userNotification;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UILabel)PINTitleLabel
{
  return self->_PINTitleLabel;
}

- (void)setPINTitleLabel:(id)a3
{
}

- (UILabel)PINURLLabel
{
  return self->_PINURLLabel;
}

- (void)setPINURLLabel:(id)a3
{
}

- (UILabel)PINURLSubtitleLabel
{
  return self->_PINURLSubtitleLabel;
}

- (void)setPINURLSubtitleLabel:(id)a3
{
}

- (UILabel)PINCodeLabel
{
  return self->_PINCodeLabel;
}

- (void)setPINCodeLabel:(id)a3
{
}

- (UILabel)PINCodeSubtitleLabel
{
  return self->_PINCodeSubtitleLabel;
}

- (void)setPINCodeSubtitleLabel:(id)a3
{
}

- (UIView)topDividerView
{
  return self->_topDividerView;
}

- (void)setTopDividerView:(id)a3
{
}

- (UILabel)dividerLabel
{
  return self->_dividerLabel;
}

- (void)setDividerLabel:(id)a3
{
}

- (UIView)bottomDividerView
{
  return self->_bottomDividerView;
}

- (void)setBottomDividerView:(id)a3
{
}

- (UILabel)QRCodeTitleLabel
{
  return self->_QRCodeTitleLabel;
}

- (void)setQRCodeTitleLabel:(id)a3
{
}

- (UILabel)QRCodeSubtitleLabel
{
  return self->_QRCodeSubtitleLabel;
}

- (void)setQRCodeSubtitleLabel:(id)a3
{
}

- (UIImageView)QRCodeImageView
{
  return self->_QRCodeImageView;
}

- (void)setQRCodeImageView:(id)a3
{
}

- (NSLayoutConstraint)subtitleConstraint
{
  return self->_subtitleConstraint;
}

- (void).cxx_destruct
{
}

@end