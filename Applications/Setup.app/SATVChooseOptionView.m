@interface SATVChooseOptionView
- (BOOL)_hasFooterView;
- (CGSize)_computeFramesForBounds:(CGRect)a3 forCalculationOnly:(BOOL)a4;
- (CGSize)_optionButtonSizeFromFitSizes:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsOptionButton:(id)a3 withinSize:(CGSize)a4;
- (NSString)firstOptionFooterText;
- (NSString)secondOptionFooterText;
- (NSString)thirdOptionFooterText;
- (SATVChooseOptionView)initWithFrame:(CGRect)a3;
- (SATVChooseOptionViewDataSource)dataSource;
- (SATVChooseOptionViewDelegate)delegate;
- (SATVHeaderView)headerView;
- (TVSKLabel)footerLabel;
- (UIButton)firstOptionButton;
- (UIButton)secondOptionButton;
- (UIButton)thirdOptionButton;
- (UIView)firstOptionFooterView;
- (UIView)footerView;
- (UIView)lastPreferredFocusedButton;
- (UIView)secondOptionFooterView;
- (UIView)thirdOptionFooterView;
- (id)preferredFocusEnvironments;
- (void)_firstOptionButtonSelected;
- (void)_populateViews;
- (void)_secondOptionButtonSelected;
- (void)_thirdOptionButtonSelected;
- (void)_updateFooter;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstOptionFooterText:(id)a3;
- (void)setFirstOptionFooterView:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setLastPreferredFocusedButton:(id)a3;
- (void)setSecondOptionFooterText:(id)a3;
- (void)setSecondOptionFooterView:(id)a3;
- (void)setThirdOptionButton:(id)a3;
- (void)setThirdOptionFooterText:(id)a3;
- (void)setThirdOptionFooterView:(id)a3;
@end

@implementation SATVChooseOptionView

- (SATVChooseOptionView)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___SATVChooseOptionView;
  v3 = -[SATVChooseOptionView initWithFrame:]( &v22,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView layer](v3, "layer"));
    [v5 setAllowsGroupBlending:0];

    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    firstOptionButton = v4->_firstOptionButton;
    v4->_firstOptionButton = (UIButton *)v6;

    -[UIButton addTarget:action:forControlEvents:]( v4->_firstOptionButton,  "addTarget:action:forControlEvents:",  v4,  "_firstOptionButtonSelected",  0x2000LL);
    -[SATVChooseOptionView addSubview:](v4, "addSubview:", v4->_firstOptionButton);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
    secondOptionButton = v4->_secondOptionButton;
    v4->_secondOptionButton = (UIButton *)v8;

    -[UIButton addTarget:action:forControlEvents:]( v4->_secondOptionButton,  "addTarget:action:forControlEvents:",  v4,  "_secondOptionButtonSelected",  0x2000LL);
    -[SATVChooseOptionView addSubview:](v4, "addSubview:", v4->_secondOptionButton);
    v10 = objc_alloc(&OBJC_CLASS___SATVHeaderView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v14 = -[SATVHeaderView initWithFrame:](v10, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    headerView = v4->_headerView;
    v4->_headerView = v14;

    -[SATVChooseOptionView addSubview:](v4, "addSubview:", v4->_headerView);
    v16 = -[TVSKLabel initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSKLabel),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    footerLabel = v4->_footerLabel;
    v4->_footerLabel = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityCDynamicColor](&OBJC_CLASS___UIColor, "tvsk_opacityCDynamicColor"));
    -[TVSKLabel setTextColor:](v4->_footerLabel, "setTextColor:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
    -[TVSKLabel setFont:](v4->_footerLabel, "setFont:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[TVSKLabel setBackgroundColor:](v4->_footerLabel, "setBackgroundColor:", v20);

    -[TVSKLabel setNumberOfLines:](v4->_footerLabel, "setNumberOfLines:", 0LL);
    -[TVSKLabel setTextAlignment:](v4->_footerLabel, "setTextAlignment:", 1LL);
    -[SATVChooseOptionView addSubview:](v4, "addSubview:", v4->_footerLabel);
  }

  return v4;
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[SATVChooseOptionView _populateViews](self, "_populateViews");
    v5 = obj;
  }
}

- (void)layoutSubviews
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___SATVChooseOptionView;
  -[SATVChooseOptionView didUpdateFocusInContext:withAnimationCoordinator:]( &v20,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedView]);

  uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView firstOptionButton](self, "firstOptionButton"));
  uint64_t v8 = v6;
  v9 = (void *)v7;
  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView secondOptionButton](self, "secondOptionButton"));
  if (v6 == (void *)v10)
  {

    uint64_t v8 = v9;
LABEL_6:

    goto LABEL_7;
  }

  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView thirdOptionButton](self, "thirdOptionButton"));

  if (v6 == v12)
  {
LABEL_7:
    -[SATVChooseOptionView setLastPreferredFocusedButton:](self, "setLastPreferredFocusedButton:", v6);
    -[SATVChooseOptionView _updateFooter](self, "_updateFooter");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView delegate](self, "delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView firstOptionButton](self, "firstOptionButton"));
    if (v6 == v14)
    {
      char v15 = objc_opt_respondsToSelector(v13, "didFocusFirstOptionForView:");

      if ((v15 & 1) != 0)
      {
        [v13 didFocusFirstOptionForView:self];
        goto LABEL_19;
      }
    }

    else
    {
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView secondOptionButton](self, "secondOptionButton"));
    if (v6 != v16)
    {

      goto LABEL_15;
    }

    char v17 = objc_opt_respondsToSelector(v13, "didFocusSecondOptionForView:");

    if ((v17 & 1) == 0)
    {
LABEL_15:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView thirdOptionButton](self, "thirdOptionButton"));
      if (v6 == v18)
      {
        char v19 = objc_opt_respondsToSelector(v13, "didFocusThirdOptionForView:");

        if ((v19 & 1) != 0) {
          [v13 didFocusThirdOptionForView:self];
        }
      }

      else
      {
      }

      goto LABEL_19;
    }

    [v13 didFocusSecondOptionForView:self];
LABEL_19:
  }
}

- (id)preferredFocusEnvironments
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));
  if (v3) {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));
  }
  else {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView firstOptionButton](self, "firstOptionButton"));
  }
  v5 = (void *)v4;

  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  }

  else
  {
    uint64_t v6 = &__NSArray0__struct;
  }

  return v6;
}

- (CGSize)_computeFramesForBounds:(CGRect)a3 forCalculationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double v123 = a3.size.height;
  double width = a3.size.width;
  double rect = a3.size.width;
  double y = a3.origin.y;
  double v121 = a3.origin.y;
  double x = a3.origin.x;
  double v10 = CGPointZero.y;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView headerView](self, "headerView"));
  objc_msgSend(v11, "sizeThatFits:", 835.0, 3.40282347e38);
  double v104 = v10;
  CGFloat v14 = UIRectCenteredXInRect(CGPointZero.x, v10, v12, v13, x, y, width, height);
  CGFloat v16 = v15;
  double v18 = v17;
  CGFloat v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView thirdOptionButton](self, "thirdOptionButton"));
  -[SATVChooseOptionView sizeThatFitsOptionButton:withinSize:]( self,  "sizeThatFitsOptionButton:withinSize:",  self->_firstOptionButton,  835.0,  3.40282347e38);
  objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:"));
  v127[0] = v22;
  -[SATVChooseOptionView sizeThatFitsOptionButton:withinSize:]( self,  "sizeThatFitsOptionButton:withinSize:",  self->_secondOptionButton,  835.0,  3.40282347e38);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:"));
  v127[1] = v23;
  -[SATVChooseOptionView sizeThatFitsOptionButton:withinSize:]( self,  "sizeThatFitsOptionButton:withinSize:",  v21,  835.0,  3.40282347e38);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGSize:](&OBJC_CLASS___NSValue, "valueWithCGSize:"));
  v127[2] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v127, 3LL));

  -[SATVChooseOptionView _optionButtonSizeFromFitSizes:](self, "_optionButtonSizeFromFitSizes:", v25);
  double v27 = v26;
  double v29 = v28;
  double v106 = v16;
  double v107 = v14;
  v129.origin.double x = v14;
  v129.origin.double y = v16;
  v129.size.double width = v18;
  double v105 = v20;
  v129.size.double height = v20;
  CGFloat MaxY = CGRectGetMaxY(v129);
  v130.origin.double x = UIRectCenteredXInRect(0.0, MaxY + 35.0, v27, v29, x, v121, rect, v123);
  double v102 = v130.origin.y;
  double v103 = v130.origin.x;
  double v100 = v130.size.height;
  double v101 = v130.size.width;
  CGFloat v31 = CGRectGetMaxY(v130);
  double v122 = x;
  double v33 = UIRectCenteredXInRect(0.0, v31 + 15.0, v27, v29, x, v121, rect, v123);
  double v35 = v34;
  double v36 = v32;
  double v38 = v37;
  double v39 = CGRectZero.origin.x;
  CGFloat v40 = CGRectZero.size.width;
  CGFloat v115 = v40;
  CGFloat v113 = CGRectZero.origin.y;
  CGFloat v114 = CGRectZero.size.height;
  double v41 = v113;
  double v42 = v114;
  CGFloat v119 = v35;
  CGFloat v120 = v33;
  CGFloat v117 = v38;
  CGFloat v118 = v32;
  if (v21)
  {
    double v43 = v33;
    double v44 = v35;
    double v45 = v38;
    CGFloat v46 = CGRectGetMaxY(*(CGRect *)(&v32 - 2));
    double v39 = UIRectCenteredXInRect(0.0, v46 + 15.0, v27, v29, v122, v121, rect, v123);
    CGFloat v40 = v47;
    CGFloat v119 = v41;
    CGFloat v120 = v39;
    CGFloat v117 = v42;
    CGFloat v118 = v47;
  }

  double v95 = v42;
  double v96 = v40;
  double v97 = v41;
  double v98 = v39;
  double v99 = v35;
  double v112 = v33;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerLabel](self, "footerLabel"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v48 text]);
  v131.origin.double x = v122;
  v131.origin.double y = v121;
  v131.size.double width = rect;
  v131.size.double height = v123;
  double v50 = CGRectGetWidth(v131);
  if (v18 >= v50) {
    double v51 = v50;
  }
  else {
    double v51 = v18;
  }
  NSAttributedStringKey v125 = NSFontAttributeName;
  v52 = (void *)objc_claimAutoreleasedReturnValue([v48 font]);
  v126 = v52;
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v126,  &v125,  1LL));
  objc_msgSend(v49, "boundingRectWithSize:options:attributes:context:", 33, v53, 0, v51, 3.40282347e38);
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;

  v132.origin.double y = v119;
  v132.origin.double x = v120;
  v132.size.double height = v117;
  v132.size.double width = v118;
  CGFloat v60 = CGRectGetMaxY(v132);
  double v61 = UIRectCenteredXInRect(v55, v60 + 20.0, v57, v59, v122, v121, rect, v123);
  double v110 = v62;
  double v111 = v61;
  double v108 = v64;
  double v109 = v63;
  double v66 = v115;
  double v65 = CGRectZero.origin.x;
  double v67 = v113;
  CGFloat v68 = v114;
  if (-[SATVChooseOptionView _hasFooterView](self, "_hasFooterView"))
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerView](self, "footerView"));
    [v69 updateConstraints];

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerView](self, "footerView"));
    [v70 setTranslatesAutoresizingMaskIntoConstraints:1];

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerView](self, "footerView"));
    LODWORD(v72) = 1148846080;
    LODWORD(v73) = 1112014848;
    objc_msgSend( v71,  "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:",  rect,  v123,  v72,  v73);
    double v75 = v74;
    double v77 = v76;

    double v65 = UIRectCenteredXInRect(CGPointZero.x, v104, v75, v77, v122, v121, rect, v123);
    double v66 = v78;
    CGFloat v68 = v79;
    v133.origin.double y = v119;
    v133.origin.double x = v120;
    v133.size.double height = v117;
    v133.size.double width = v118;
    double v67 = CGRectGetMaxY(v133) + 20.0;
  }

  if (v4)
  {
    double v80 = v68;
    CGFloat v82 = v110;
    CGFloat v81 = v111;
    CGFloat v83 = v108;
    CGFloat v84 = v109;
  }

  else
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView headerView](self, "headerView"));
    objc_msgSend(v85, "setFrame:", v107, v106, v18, v105);

    v86 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView firstOptionButton](self, "firstOptionButton"));
    objc_msgSend(v86, "setFrame:", v103, v102, v101, v100);

    v87 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView secondOptionButton](self, "secondOptionButton"));
    objc_msgSend(v87, "setFrame:", v112, v99, v36, v38);

    v88 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView thirdOptionButton](self, "thirdOptionButton"));
    objc_msgSend(v88, "setFrame:", v98, v97, v96, v95);

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerLabel](self, "footerLabel"));
    CGFloat v82 = v110;
    CGFloat v81 = v111;
    double v80 = v68;
    CGFloat v83 = v108;
    CGFloat v84 = v109;
    objc_msgSend(v89, "setFrame:", v111, v110, v109, v108);

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView footerView](self, "footerView"));
    objc_msgSend(v90, "setFrame:", v65, v67, v66, v80);
  }

  v134.origin.double y = v121;
  v134.origin.double x = v122;
  v134.size.double width = rect;
  v134.size.double height = v123;
  double v124 = CGRectGetWidth(v134);
  v135.origin.double x = v81;
  v135.origin.double y = v82;
  v135.size.double width = v84;
  v135.size.double height = v83;
  double v91 = CGRectGetMaxY(v135);
  v136.origin.double x = v65;
  v136.origin.double y = v67;
  v136.size.double width = v66;
  v136.size.double height = v80;
  double v92 = CGRectGetMaxY(v136);
  if (v91 < v92) {
    double v91 = v92;
  }

  double v93 = fmin(v124, 835.0);
  double v94 = v91;
  result.double height = v94;
  result.double width = v93;
  return result;
}

- (void)_populateViews
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  double v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained titleTextForView:self]);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView headerView](self, "headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  [v5 setText:v3];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained subtitleTextForView:self]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView headerView](self, "headerView"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 subtitleLabel]);
  [v8 setText:v6];

  v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained firstOptionButtonTextForView:self]);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView firstOptionButton](self, "firstOptionButton"));
  [v10 setTitle:v9 forState:0];

  v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained secondOptionButtonTextForView:self]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView secondOptionButton](self, "secondOptionButton"));
  [v12 setTitle:v11 forState:0];

  if ((objc_opt_respondsToSelector(WeakRetained, "thirdOptionButtonTextForView:") & 1) != 0)
  {
    double v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained thirdOptionButtonTextForView:self]);
    if ([v13 length])
    {
      CGFloat v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
      -[SATVChooseOptionView setThirdOptionButton:](self, "setThirdOptionButton:", v14);
      [v14 setTitle:v13 forState:0];
      [v14 addTarget:self action:"_thirdOptionButtonSelected" forControlEvents:0x2000];
      -[SATVChooseOptionView addSubview:](self, "addSubview:", v14);
    }
  }

  firstOptionFooterText = self->_firstOptionFooterText;
  self->_firstOptionFooterText = (NSString *)&stru_1000CB560;

  if ((objc_opt_respondsToSelector(WeakRetained, "firstOptionButtonFooterTextForView:") & 1) == 0
    || (CGFloat v16 = (NSString *)objc_claimAutoreleasedReturnValue([WeakRetained firstOptionButtonFooterTextForView:self]),
        double v17 = self->_firstOptionFooterText,
        self->_firstOptionFooterText = v16,
        v17,
        !self->_firstOptionFooterText))
  {
    if ((objc_opt_respondsToSelector(WeakRetained, "firstOptionButtonFooterViewForView:") & 1) != 0)
    {
      double v18 = (UIView *)objc_claimAutoreleasedReturnValue([WeakRetained firstOptionButtonFooterViewForView:self]);
      firstOptionFooterView = self->_firstOptionFooterView;
      self->_firstOptionFooterView = v18;

      if (self->_firstOptionFooterView)
      {
        CGFloat v20 = self->_firstOptionFooterText;
        self->_firstOptionFooterText = 0LL;

        -[UIView setHidden:](self->_firstOptionFooterView, "setHidden:", 1LL);
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_firstOptionFooterView,  "setTranslatesAutoresizingMaskIntoConstraints:",  1LL);
        -[SATVChooseOptionView addSubview:](self, "addSubview:", self->_firstOptionFooterView);
      }
    }
  }

  secondOptionFooterText = self->_secondOptionFooterText;
  self->_secondOptionFooterText = (NSString *)&stru_1000CB560;

  if ((objc_opt_respondsToSelector(WeakRetained, "secondOptionButtonFooterTextForView:") & 1) == 0
    || (objc_super v22 = (NSString *)objc_claimAutoreleasedReturnValue([WeakRetained secondOptionButtonFooterTextForView:self]),
        v23 = self->_secondOptionFooterText,
        self->_secondOptionFooterText = v22,
        v23,
        !self->_secondOptionFooterText))
  {
    if ((objc_opt_respondsToSelector(WeakRetained, "secondOptionButtonFooterViewForView:") & 1) != 0)
    {
      v24 = (UIView *)objc_claimAutoreleasedReturnValue([WeakRetained secondOptionButtonFooterViewForView:self]);
      secondOptionFooterView = self->_secondOptionFooterView;
      self->_secondOptionFooterView = v24;

      if (self->_secondOptionFooterView)
      {
        double v26 = self->_secondOptionFooterText;
        self->_secondOptionFooterText = 0LL;

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_secondOptionFooterView,  "setTranslatesAutoresizingMaskIntoConstraints:",  1LL);
        -[SATVChooseOptionView addSubview:](self, "addSubview:", self->_secondOptionFooterView);
      }
    }
  }

  thirdOptionFooterText = self->_thirdOptionFooterText;
  self->_thirdOptionFooterText = (NSString *)&stru_1000CB560;

  if ((objc_opt_respondsToSelector(WeakRetained, "thirdOptionButtonFooterTextForView:") & 1) == 0
    || (double v28 = (NSString *)objc_claimAutoreleasedReturnValue([WeakRetained thirdOptionButtonFooterTextForView:self]),
        double v29 = self->_thirdOptionFooterText,
        self->_thirdOptionFooterText = v28,
        v29,
        !self->_thirdOptionFooterText))
  {
    if ((objc_opt_respondsToSelector(WeakRetained, "thirdOptionButtonFooterViewForView:") & 1) != 0)
    {
      v30 = (UIView *)objc_claimAutoreleasedReturnValue([WeakRetained thirdOptionButtonFooterViewForView:self]);
      thirdOptionFooterView = self->_thirdOptionFooterView;
      self->_thirdOptionFooterView = v30;

      if (self->_thirdOptionFooterView)
      {
        double v32 = self->_thirdOptionFooterText;
        self->_thirdOptionFooterText = 0LL;

        -[UIView setTranslatesAutoresizingMaskIntoConstraints:]( self->_thirdOptionFooterView,  "setTranslatesAutoresizingMaskIntoConstraints:",  1LL);
        -[SATVChooseOptionView addSubview:](self, "addSubview:", self->_thirdOptionFooterView);
      }
    }
  }

  -[SATVChooseOptionView _updateFooter](self, "_updateFooter");
  -[SATVChooseOptionView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateFooter
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView firstOptionButton](self, "firstOptionButton"));
  if (v3 == (void *)v4)
  {

    goto LABEL_8;
  }

  v5 = (void *)v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));

  if (!v6)
  {
LABEL_8:
    uint64_t v11 = 10LL;
    if (self->_firstOptionFooterText) {
      goto LABEL_9;
    }
    uint64_t v12 = 13LL;
    goto LABEL_11;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView secondOptionButton](self, "secondOptionButton"));

  if (v7 != v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView thirdOptionButton](self, "thirdOptionButton"));

    if (v9 != v10) {
      goto LABEL_14;
    }
    uint64_t v11 = 12LL;
    if (!self->_thirdOptionFooterText)
    {
      uint64_t v12 = 15LL;
      goto LABEL_11;
    }

- (BOOL)_hasFooterView
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));
  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView firstOptionButton](self, "firstOptionButton"));
  if (v3 == (void *)v4)
  {

    goto LABEL_7;
  }

  v5 = (void *)v4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));

  if (!v6)
  {
LABEL_7:
    uint64_t v12 = &OBJC_IVAR___SATVChooseOptionView__firstOptionFooterView;
    return *(Class *)((char *)&self->super.super.super.isa + *v12) != 0LL;
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView secondOptionButton](self, "secondOptionButton"));

  if (v7 == v8)
  {
    uint64_t v12 = &OBJC_IVAR___SATVChooseOptionView__secondOptionFooterView;
  }

  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView lastPreferredFocusedButton](self, "lastPreferredFocusedButton"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView thirdOptionButton](self, "thirdOptionButton"));

    if (v9 != v10) {
      return 0;
    }
    uint64_t v12 = &OBJC_IVAR___SATVChooseOptionView__thirdOptionFooterView;
  }

  return *(Class *)((char *)&self->super.super.super.isa + *v12) != 0LL;
}

- (void)_firstOptionButtonSelected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView delegate](self, "delegate"));
  [v3 didSelectFirstOptionForView:self];
}

- (void)_secondOptionButtonSelected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView delegate](self, "delegate"));
  [v3 didSelectSecondOptionForView:self];
}

- (void)_thirdOptionButtonSelected
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "didSelectThirdOptionForView:") & 1) != 0) {
    [v3 didSelectThirdOptionForView:self];
  }
}

- (CGSize)_optionButtonSizeFromFitSizes:(id)a3
{
  id v3 = a3;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    double v7 = 0.0;
    double v8 = 0.0;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * (void)i) CGSizeValue];
        if (v10 >= v8) {
          double v8 = v10;
        }
        if (v11 >= v7) {
          double v7 = v11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v5);
  }

  else
  {
    double v7 = 0.0;
    double v8 = 0.0;
  }

  if (v7 <= 66.0) {
    double v12 = 66.0;
  }
  else {
    double v12 = v7 + 12.0;
  }

  double v13 = v8;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)sizeThatFitsOptionButton:(id)a3 withinSize:(CGSize)a4
{
  double height = a4.height;
  double v5 = fmax(a4.width + -80.0, 0.0);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 titleLabel]);
  objc_msgSend(v6, "sizeThatFits:", v5, height);
  double v8 = v7;
  double v10 = v9;

  if (v10 <= 120.0) {
    double v11 = v10;
  }
  else {
    double v11 = 120.0;
  }
  double v12 = v8 + 80.0;
  if (v8 + 80.0 > 835.0) {
    double v12 = 835.0;
  }
  result.double height = v11;
  result.double width = v12;
  return result;
}

- (SATVChooseOptionViewDataSource)dataSource
{
  return (SATVChooseOptionViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SATVChooseOptionViewDelegate)delegate
{
  return (SATVChooseOptionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)firstOptionButton
{
  return self->_firstOptionButton;
}

- (UIButton)secondOptionButton
{
  return self->_secondOptionButton;
}

- (UIButton)thirdOptionButton
{
  return self->_thirdOptionButton;
}

- (void)setThirdOptionButton:(id)a3
{
}

- (SATVHeaderView)headerView
{
  return self->_headerView;
}

- (TVSKLabel)footerLabel
{
  return self->_footerLabel;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (UIView)lastPreferredFocusedButton
{
  return self->_lastPreferredFocusedButton;
}

- (void)setLastPreferredFocusedButton:(id)a3
{
}

- (NSString)firstOptionFooterText
{
  return self->_firstOptionFooterText;
}

- (void)setFirstOptionFooterText:(id)a3
{
}

- (NSString)secondOptionFooterText
{
  return self->_secondOptionFooterText;
}

- (void)setSecondOptionFooterText:(id)a3
{
}

- (NSString)thirdOptionFooterText
{
  return self->_thirdOptionFooterText;
}

- (void)setThirdOptionFooterText:(id)a3
{
}

- (UIView)firstOptionFooterView
{
  return self->_firstOptionFooterView;
}

- (void)setFirstOptionFooterView:(id)a3
{
}

- (UIView)secondOptionFooterView
{
  return self->_secondOptionFooterView;
}

- (void)setSecondOptionFooterView:(id)a3
{
}

- (UIView)thirdOptionFooterView
{
  return self->_thirdOptionFooterView;
}

- (void)setThirdOptionFooterView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end