@interface SATVChoiceView
- (BOOL)_hasAuxiliaryButton;
- (BOOL)_hasFooterButton;
- (CGSize)_computeFramesForBounds:(CGRect)a3 forCalculationOnly:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SATVChoiceView)initWithChoiceViewStyle:(int64_t)a3 frame:(CGRect)a4;
- (SATVChoiceView)initWithFrame:(CGRect)a3;
- (SATVChoiceViewDataSource)dataSource;
- (SATVChoiceViewDelegate)delegate;
- (SATVHeaderView)headerView;
- (TVSKPlatterlessNonScalingButton)choiceHeaderButton;
- (UIButton)firstChoiceButton;
- (UIButton)secondChoiceButton;
- (UILabel)footnoteLabel;
- (UIView)auxiliaryButton;
- (UIView)footerButton;
- (_SATVChoiceButtonContainerView)choiceButtonContainer;
- (id)_choiceHeaderButton;
- (id)_newDefaultButton;
- (id)_newFooterButton;
- (id)preferredFocusEnvironments;
- (int64_t)choiceViewStyle;
- (unint64_t)choiceButtonLayout;
- (void)_didSelectAuxiliaryButton;
- (void)_didSelectButton:(id)a3;
- (void)_didSelectFooterButton;
- (void)_populateView;
- (void)_setUpUI;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)reloadData;
- (void)setAuxiliaryButton:(id)a3;
- (void)setChoice:(unint64_t)a3 enabled:(BOOL)a4;
- (void)setChoiceButtonContainer:(id)a3;
- (void)setChoiceButtonLayout:(unint64_t)a3;
- (void)setChoiceHeaderButton:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFirstChoiceButton:(id)a3;
- (void)setFooterButton:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setSecondChoiceButton:(id)a3;
@end

@implementation SATVChoiceView

- (SATVChoiceView)initWithChoiceViewStyle:(int64_t)a3 frame:(CGRect)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SATVChoiceView;
  v5 = -[SATVChoiceView initWithFrame:](&v8, "initWithFrame:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_choiceViewStyle = a3;
    -[SATVChoiceView _setUpUI](v5, "_setUpUI");
  }

  return v6;
}

- (SATVChoiceView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVChoiceView;
  v3 = -[SATVChoiceView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    -[SATVChoiceView _setUpUI](v3, "_setUpUI");
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SATVChoiceView;
  -[SATVChoiceView layoutSubviews](&v3, "layoutSubviews");
  -[SATVChoiceView bounds](self, "bounds");
  -[SATVChoiceView _computeFramesForBounds:forCalculationOnly:]( self,  "_computeFramesForBounds:forCalculationOnly:",  0LL);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)preferredFocusEnvironments
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceButtonContainer](self, "choiceButtonContainer"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 preferredButton]);
  if (self->_choiceHeaderButton)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceHeaderButton](self, "choiceHeaderButton"));
    unsigned int v6 = [v5 isEnabled];

    if (v6)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceHeaderButton](self, "choiceHeaderButton"));

      double v4 = (void *)v7;
    }
  }

  if (v4)
  {
    v10 = v4;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  }

  else
  {
    objc_super v8 = &__NSArray0__struct;
  }

  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v12 = (id)objc_claimAutoreleasedReturnValue([a3 nextFocusedItem]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS____SATVChoiceButton);
  if ((objc_opt_isKindOfClass(v12, v5) & 1) != 0)
  {
    id v6 = v12;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceButtonContainer](self, "choiceButtonContainer"));
    [v7 setPreferredButton:v6];
  }

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 focusedView]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceHeaderButton](self, "choiceHeaderButton"));

  if (v9 != v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceHeaderButton](self, "choiceHeaderButton"));
    [v11 setEnabled:0];
  }
}

- (void)setDataSource:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[SATVChoiceView reloadData](self, "reloadData");
    uint64_t v5 = obj;
  }
}

- (void)reloadData
{
}

- (void)setChoice:(unint64_t)a3 enabled:(BOOL)a4
{
  if (a3)
  {
    if (a3 != 1) {
      return;
    }
    double v4 = &OBJC_IVAR___SATVChoiceView__secondChoiceButton;
  }

  else
  {
    double v4 = &OBJC_IVAR___SATVChoiceView__firstChoiceButton;
  }

  [*(id *)((char *)&self->super.super.super.isa + *v4) setEnabled:a4];
}

- (void)setChoiceButtonLayout:(unint64_t)a3
{
  if (self->_choiceButtonLayout != a3)
  {
    self->_choiceButtonLayout = a3;
    if (a3 == 1)
    {
      -[TVSKPlatterlessNonScalingButton removeFromSuperview](self->_choiceHeaderButton, "removeFromSuperview");
      choiceHeaderButton = self->_choiceHeaderButton;
      self->_choiceHeaderButton = 0LL;

      firstChoiceButton = self->_firstChoiceButton;
      if (firstChoiceButton)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](firstChoiceButton, "titleLabel"));
        [v6 setNumberOfLines:1];
      }

      secondChoiceButton = self->_secondChoiceButton;
      if (secondChoiceButton)
      {
        objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](secondChoiceButton, "titleLabel"));
        [v8 setNumberOfLines:1];
      }

      -[SATVChoiceView setNeedsLayout](self, "setNeedsLayout");
    }
  }

- (CGSize)_computeFramesForBounds:(CGRect)a3 forCalculationOnly:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v10 = CGPointZero.y;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView headerView](self, "headerView"));
  objc_msgSend(v11, "sizeThatFits:", width, height);
  double v13 = v12;
  double v184 = v10;
  double v14 = v10;
  double v15 = x;
  double v186 = y;
  double v187 = x;
  double v191 = width;
  double v16 = height;
  double v18 = UIRectCenteredXInRect(CGPointZero.x, v14, v17, v13, x, y, width, height);
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  double v179 = v23;

  v195.origin.double x = v18;
  v195.origin.double y = v20;
  v195.size.double width = v22;
  v195.size.double height = v24;
  double v25 = CGRectGetMaxY(v195) + 40.0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceHeaderButton](self, "choiceHeaderButton"));
  double v152 = CGSizeZero.height;
  objc_msgSend(v26, "sizeThatFits:");
  double v29 = UIRectCenteredXInRect(0.0, v25, v27, v28, v15, y, width, v16);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;

  unsigned int v36 = -[TVSKPlatterlessNonScalingButton isHidden](self->_choiceHeaderButton, "isHidden");
  double v163 = v20;
  double v164 = v18;
  double v160 = v31;
  double v161 = v29;
  if (v36) {
    double v37 = v18;
  }
  else {
    double v37 = v29;
  }
  if (v36) {
    double v38 = v20;
  }
  else {
    double v38 = v31;
  }
  double v162 = v22;
  double v158 = v35;
  double v159 = v33;
  if (v36) {
    double v39 = v22;
  }
  else {
    double v39 = v33;
  }
  double v40 = v179;
  if (!v36) {
    double v40 = v35;
  }
  double v180 = CGRectGetMaxY(*(CGRect *)&v37) + 44.0;
  v196.origin.double x = v187;
  v196.origin.double y = v186;
  v196.size.double width = v191;
  double v183 = v16;
  v196.size.double height = v16;
  double v41 = CGRectGetWidth(v196) + -58.0;
  unint64_t v42 = -[SATVChoiceView choiceButtonLayout](self, "choiceButtonLayout");
  double v43 = 2.0;
  if (v42 == 1) {
    double v43 = 1.0;
  }
  double v44 = floor(v41 / v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView firstChoiceButton](self, "firstChoiceButton"));
  objc_msgSend(v45, "sizeThatFits:", v44, 3.40282347e38);
  CGFloat v47 = v46;
  double v49 = v48;

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView secondChoiceButton](self, "secondChoiceButton"));
  objc_msgSend(v50, "sizeThatFits:", v44, 3.40282347e38);
  CGFloat v52 = v51;
  double v54 = v53;

  if ((id)-[SATVChoiceView choiceButtonLayout](self, "choiceButtonLayout") == (id)1)
  {
    v197.origin.double x = CGPointZero.x;
    v197.origin.double y = v184;
    v197.size.double width = v47;
    v197.size.double height = v49;
    double v55 = CGRectGetWidth(v197);
    v198.origin.double x = CGPointZero.x;
    v198.origin.double y = v184;
    v198.size.double width = v52;
    v198.size.double height = v54;
    double v56 = CGRectGetWidth(v198);
    if (v55 >= v56) {
      double v56 = v55;
    }
    double v57 = fmax(v56, 540.0);
    CGFloat v188 = UIRectCenteredXInRect(CGPointZero.x, v184, v57, v49, v187, v186, v191, v16);
    double v177 = v58;
    double rect = v59;
    double v60 = v54;
    double v62 = v61;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView secondChoiceButton](self, "secondChoiceButton"));
    unsigned __int8 v64 = [v63 isHidden];

    if ((v64 & 1) != 0)
    {
      CGFloat v65 = CGPointZero.x;
    }

    else
    {
      CGFloat v65 = UIRectCenteredXInRect(CGPointZero.x, v184, v57, v54, v187, v186, v191, v16);
      CGFloat v52 = v80;
      double v60 = v81;
      v202.origin.double x = v188;
      v202.origin.double y = v177;
      v202.size.double width = rect;
      v202.size.double height = v62;
      double v184 = CGRectGetMaxY(v202) + 20.0;
    }

    CGFloat v71 = v180;
    double v182 = v52;
    double v157 = v62;
    double v171 = v60;
    double v82 = v62 + v60 + 20.0;
    CGFloat v83 = v65;
  }

  else
  {
    unsigned int v66 = -[SATVChoiceView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView secondChoiceButton](self, "secondChoiceButton"));
    unsigned __int8 v68 = [v67 isHidden];

    CGFloat v69 = CGPointZero.x;
    v199.origin.double x = CGPointZero.x;
    v199.origin.double y = v184;
    v199.size.double width = v47;
    v199.size.double height = v49;
    double v70 = fmax(CGRectGetWidth(v199), 380.0);
    if ((v68 & 1) != 0)
    {
      v200.origin.double x = 0.0;
      v200.size.double height = 0.0;
      CGFloat v71 = v180;
      v200.origin.double y = v180;
      v200.size.double width = v191;
      CGFloat v181 = v52;
      CGFloat v72 = v70;
      CGFloat v73 = v54;
      CGFloat v74 = CGRectGetWidth(v200) * 0.5;
      v201.origin.double x = CGPointZero.x;
      v201.origin.double y = v184;
      v201.size.double width = v72;
      v201.size.double height = v49;
      double v75 = v74 - CGRectGetWidth(v201) * 0.5;
      double v70 = v72;
      double v76 = CGPointZero.x;
      CGFloat v77 = v49;
      double v78 = v181;
      double v79 = floor(v75);
    }

    else
    {
      CGFloat v178 = v49;
      if (v66)
      {
        v203.origin.double x = CGPointZero.x;
        v203.origin.double y = v184;
        v203.size.double width = v70;
        v203.size.double height = v49;
        double MaxX = CGRectGetMaxX(v203);
        double v85 = 58.0;
      }

      else
      {
        v204.origin.double x = 0.0;
        v204.size.double height = 0.0;
        v204.origin.double y = v180;
        v204.size.double width = v191;
        CGFloat v86 = CGRectGetWidth(v204);
        v205.size.double height = v49;
        CGFloat v87 = v70;
        double v88 = floor(v86 * 0.5);
        v205.origin.double x = CGPointZero.x;
        v205.origin.double y = v184;
        v205.size.double width = v87;
        double MaxX = v88 - CGRectGetWidth(v205);
        double v70 = v87;
        CGFloat v69 = CGPointZero.x;
        double v85 = -29.0;
      }

      double v189 = MaxX + v85;
      v206.origin.double x = v69;
      v206.origin.double y = v184;
      v206.size.double width = v52;
      double v172 = v54;
      v206.size.double height = v54;
      double v78 = fmax(CGRectGetWidth(v206), 380.0);
      if (v66)
      {
        v207.origin.double x = 0.0;
        v207.size.double height = 0.0;
        v207.origin.double y = v180;
        v207.size.double width = v191;
        double v89 = floor(CGRectGetWidth(v207) * 0.5);
        double v79 = v189;
        v208.origin.double x = v189;
        v208.origin.double y = v184;
        v208.size.double width = v70;
        CGFloat v77 = v178;
        v208.size.double height = v178;
        double v90 = v89 - CGRectGetWidth(v208);
        CGFloat v71 = v180;
        double v76 = v90 + -29.0;
      }

      else
      {
        CGFloat v77 = v178;
        double v79 = v189;
        v209.origin.double x = v189;
        v209.origin.double y = v184;
        v209.size.double width = v70;
        v209.size.double height = v178;
        double v76 = CGRectGetMaxX(v209) + 58.0;
        CGFloat v71 = v180;
      }

      CGFloat v73 = v172;
    }

    CGFloat v188 = v79;
    v210.origin.double x = v79;
    v210.origin.double y = v184;
    double rect = v70;
    v210.size.double width = v70;
    v210.size.double height = v77;
    double v82 = CGRectGetHeight(v210);
    v211.origin.double x = v76;
    v211.origin.double y = v184;
    double v182 = v78;
    v211.size.double width = v78;
    v211.size.double height = v73;
    double v91 = CGRectGetHeight(v211);
    if (v82 < v91) {
      double v82 = v91;
    }
    v212.origin.double x = 0.0;
    v212.origin.double y = v71;
    v212.size.double width = v191;
    v212.size.double height = v82;
    double v157 = CGRectGetHeight(v212);
    v213.origin.double x = 0.0;
    v213.origin.double y = v71;
    v213.size.double width = v191;
    v213.size.double height = v82;
    double v171 = CGRectGetHeight(v213);
    double v177 = v184;
    CGFloat v83 = v76;
  }

  v214.origin.double x = 0.0;
  v214.origin.double y = v71;
  v214.size.double width = v191;
  double v156 = v82;
  v214.size.double height = v82;
  double MaxY = CGRectGetMaxY(v214);
  CGFloat v93 = CGRectZero.origin.x;
  CGFloat v94 = CGRectZero.origin.y;
  CGFloat v95 = CGRectZero.size.width;
  CGFloat v96 = CGRectZero.size.height;
  v97 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footnoteLabel](self, "footnoteLabel"));
  v98 = (void *)objc_claimAutoreleasedReturnValue([v97 text]);
  id v99 = [v98 length];

  CGFloat v174 = v96;
  CGFloat v170 = v95;
  if (v99)
  {
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footnoteLabel](self, "footnoteLabel"));
    v101 = (void *)objc_claimAutoreleasedReturnValue([v100 text]);
    NSAttributedStringKey v192 = NSFontAttributeName;
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footnoteLabel](self, "footnoteLabel"));
    v103 = (void *)objc_claimAutoreleasedReturnValue([v102 font]);
    v193 = v103;
    v104 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v193,  &v192,  1LL));
    double v175 = MaxY;
    objc_msgSend(v101, "boundingRectWithSize:options:attributes:context:", 33, v104, 0, v191, 1.79769313e308);
    CGFloat v109 = UIRectCenteredXInRect(v105, v106, v107, v108, v187, v186, v191, v183);
    CGFloat v111 = v110;
    CGFloat v113 = v112;

    v215.origin.double y = v175 + 54.0;
    double v168 = v111;
    double v169 = v109;
    v215.origin.double x = v109;
    double v166 = v175 + 54.0;
    v215.size.double width = v111;
    CGFloat v114 = v188;
    double v167 = v113;
    v215.size.double height = v113;
    CGFloat v93 = CGRectZero.origin.x;
    double MaxY = CGRectGetMaxY(v215);
  }

  else
  {
    double v168 = v95;
    double v169 = CGRectZero.origin.x;
    double v166 = v94;
    double v167 = v96;
    CGFloat v114 = v188;
  }

  double v176 = v94;
  CGFloat v173 = v93;
  double v190 = v114;
  double v185 = v83;
  if (-[SATVChoiceView _hasFooterButton](self, "_hasFooterButton"))
  {
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footerButton](self, "footerButton"));
    [v115 updateConstraints];

    v116 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footerButton](self, "footerButton"));
    [v116 setTranslatesAutoresizingMaskIntoConstraints:1];

    v117 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footerButton](self, "footerButton"));
    LODWORD(v118) = 1148846080;
    LODWORD(v119) = 1112014848;
    double v120 = v183;
    objc_msgSend( v117,  "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:",  v191,  v183,  v118,  v119);
    double v122 = v121;
    double v124 = v123;

    if (v99)
    {
      v216.origin.double x = v169;
      double v125 = v170;
      double v126 = v184;
      v216.origin.double y = v166;
      v216.size.double height = v167;
      v216.size.double width = v168;
      double v127 = CGRectGetMaxY(v216) + 28.0;
    }

    else
    {
      double v125 = v170;
      double v126 = v184;
      double v127 = MaxY + 40.0;
    }

    double v132 = v122;
    double v128 = v187;
    double v129 = v186;
    v217.origin.double x = UIRectCenteredXInRect(0.0, v127, v132, v124, v187, v186, v191, v183);
    double v130 = v217.size.height;
    double v154 = v217.origin.y;
    double v155 = v217.origin.x;
    double v153 = v217.size.width;
    double v131 = CGRectGetMaxY(v217);
  }

  else
  {
    double v120 = v183;
    double v126 = v184;
    double v129 = v186;
    double v128 = v187;
    double v154 = v176;
    double v155 = v173;
    double v125 = v170;
    double v153 = v170;
    double v130 = v96;
    double v131 = MaxY;
  }

  if (-[SATVChoiceView _hasAuxiliaryButton](self, "_hasAuxiliaryButton")
    && !-[UIView isHidden](self->_auxiliaryButton, "isHidden"))
  {
    v135 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView auxiliaryButton](self, "auxiliaryButton"));
    objc_msgSend(v135, "sizeThatFits:", CGSizeZero.width, v152);
    double v133 = UIRectCenteredXInRect(0.0, v131 + 28.0, v136, v137, v128, v129, v191, v120);
    CGFloat v139 = v138;
    double v125 = v140;
    double v134 = v141;

    v218.origin.double x = v133;
    double v176 = v139;
    v218.origin.double y = v139;
    v218.size.double width = v125;
    v218.size.double height = v134;
    double v131 = CGRectGetMaxY(v218);
  }

  else
  {
    double v133 = v173;
    double v134 = v174;
  }

  if (!a4)
  {
    v142 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView headerView](self, "headerView"));
    objc_msgSend(v142, "setFrame:", v164, v163, v162, v179);

    v143 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceButtonContainer](self, "choiceButtonContainer"));
    objc_msgSend(v143, "setFrame:", 0.0, v180, v191, v156);

    v144 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceHeaderButton](self, "choiceHeaderButton"));
    objc_msgSend(v144, "setFrame:", v161, v160, v159, v158);

    v145 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView firstChoiceButton](self, "firstChoiceButton"));
    objc_msgSend(v145, "setFrame:", v190, v177, rect, v157);

    v146 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView secondChoiceButton](self, "secondChoiceButton"));
    objc_msgSend(v146, "setFrame:", v185, v126, v182, v171);

    v147 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footnoteLabel](self, "footnoteLabel"));
    objc_msgSend(v147, "setFrame:", v169, v166, v168, v167);

    v148 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footerButton](self, "footerButton"));
    objc_msgSend(v148, "setFrame:", v155, v154, v153, v130);

    v149 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView auxiliaryButton](self, "auxiliaryButton"));
    objc_msgSend(v149, "setFrame:", v133, v176, v125, v134);
  }

  double v150 = v191;
  double v151 = v131;
  result.double height = v151;
  result.double width = v150;
  return result;
}

- (void)_populateView
{
  id v43 = (id)objc_claimAutoreleasedReturnValue(-[SATVChoiceView dataSource](self, "dataSource"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v43 titleTextForChoiceView:self]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView headerView](self, "headerView"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 titleLabel]);
  [v5 setText:v3];

  if ((objc_opt_respondsToSelector(v43, "attributedSubtitleStringForChoiceView") & 1) == 0
    || (objc_opt_respondsToSelector(v43, "subtitleTextForChoiceView:") & 1) != 0
    && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v43 subtitleTextForChoiceView:self]),
        v6,
        v6))
  {
    if ((objc_opt_respondsToSelector(v43, "subtitleTextForChoiceView:") & 1) == 0) {
      goto LABEL_8;
    }
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v43 subtitleTextForChoiceView:self]);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView headerView](self, "headerView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 subtitleLabel]);
    [v9 setText:v7];
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v43 attributedSubtitleStringForChoiceView]);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView headerView](self, "headerView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 subtitleLabel]);
    [v9 setAttributedText:v7];
  }

LABEL_8:
  CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceHeaderButton](self, "choiceHeaderButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 titleLabel]);
  double v12 = (void *)objc_claimAutoreleasedReturnValue([v43 choiceHeaderButtonTextForChoiceView:self]);
  [v11 setText:v12];

  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView firstChoiceButton](self, "firstChoiceButton"));
  double v14 = (void *)objc_claimAutoreleasedReturnValue([v43 choiceView:self textForChoice:0]);
  [v13 setTitle:v14 forState:0];

  if ((id)-[SATVChoiceView choiceButtonLayout](self, "choiceButtonLayout") == (id)1)
  {
    double v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView firstChoiceButton](self, "firstChoiceButton"));
    double v16 = (void *)objc_claimAutoreleasedReturnValue([v15 titleLabel]);
    [v16 setNumberOfLines:1];
  }

  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView firstChoiceButton](self, "firstChoiceButton"));
  [v17 addTarget:self action:"_didSelectButton:" forControlEvents:0x2000];

  double v18 = (void *)objc_claimAutoreleasedReturnValue([v43 choiceView:self textForChoice:1]);
  if (v18)
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView secondChoiceButton](self, "secondChoiceButton"));
    CGFloat v20 = (void *)objc_claimAutoreleasedReturnValue([v43 choiceView:self textForChoice:1]);
    [v19 setTitle:v20 forState:0];

    if ((id)-[SATVChoiceView choiceButtonLayout](self, "choiceButtonLayout") == (id)1)
    {
      double v21 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView secondChoiceButton](self, "secondChoiceButton"));
      CGFloat v22 = (void *)objc_claimAutoreleasedReturnValue([v21 titleLabel]);
      [v22 setNumberOfLines:1];
    }

    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView secondChoiceButton](self, "secondChoiceButton"));
    [v23 addTarget:self action:"_didSelectButton:" forControlEvents:0x2000];
  }

  else
  {
    CGFloat v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceHeaderButton](self, "choiceHeaderButton"));
    [v24 setHidden:1];

    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView choiceHeaderButton](self, "choiceHeaderButton"));
    [v25 setEnabled:0];

    double v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView secondChoiceButton](self, "secondChoiceButton"));
    [v23 setHidden:1];
  }

  if ((objc_opt_respondsToSelector(v43, "footnoteTextForChoiceView:") & 1) != 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v43 footnoteTextForChoiceView:self]);
    double v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footnoteLabel](self, "footnoteLabel"));
    [v27 setText:v26];
  }

  char v28 = objc_opt_respondsToSelector(v43, "footerButtonTextForChoiceView:");
  uint64_t v29 = objc_claimAutoreleasedReturnValue(-[SATVChoiceView footerButton](self, "footerButton"));
  [(id)v29 setHidden:(v28 & 1) == 0];

  double v30 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footerButton](self, "footerButton"));
  LOBYTE(v29) = [v30 isHidden];

  if ((v29 & 1) != 0)
  {
    if ((objc_opt_respondsToSelector(v43, "footerButtonViewForChoiceView:") & 1) == 0) {
      goto LABEL_26;
    }
  }

  else
  {
    uint64_t v31 = objc_claimAutoreleasedReturnValue([v43 footerButtonTextForChoiceView:self]);
    if (v31)
    {
      double v32 = (void *)v31;
      double v33 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footerButton](self, "footerButton"));
      uint64_t v34 = objc_opt_class(&OBJC_CLASS___UIButton);
      if ((objc_opt_isKindOfClass(v33, v34) & 1) == 0) {
        sub_100079510();
      }
      [v33 setTitle:v32 forState:0];

      goto LABEL_25;
    }
  }

  if ((objc_opt_respondsToSelector(v43, "footerButtonViewForChoiceView:") & 1) != 0)
  {
    double v32 = (void *)objc_claimAutoreleasedReturnValue([v43 footerButtonViewForChoiceView:self]);
    [v32 setHidden:0];
    -[SATVChoiceView addSubview:](self, "addSubview:", v32);
    -[SATVChoiceView setFooterButton:](self, "setFooterButton:", v32);
LABEL_25:
  }

- (id)_choiceHeaderButton
{
  return  -[TVSKPlatterlessNonScalingButton initWithFrame:]( objc_alloc(&OBJC_CLASS___TVSKPlatterlessNonScalingButton),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
}

- (id)_newDefaultButton
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(+[_SATVChoiceButton buttonWithType:](&OBJC_CLASS____SATVChoiceButton, "buttonWithType:", 1LL));
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleHeadline));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 titleLabel]);
  [v5 setFont:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 titleLabel]);
  [v6 setNumberOfLines:0];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 titleLabel]);
  [v7 setTextAlignment:1];

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v3 titleLabel]);
  [v8 setAutoresizingMask:32];

  if (self->_choiceViewStyle == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    [v3 _setVisualEffectViewEnabled:0 backgroundColor:v9];

    CGFloat v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    double v12 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvsk_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvsk_dynamicColorWithLightStyleColor:darkStyleColor:",  v10,  v11));

    [v3 setTitleColor:v12 forState:0];
    double v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    [v3 setTitleColor:v13 forState:8];

    double v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    [v3 setTitleColor:v14 forState:1];
  }

  if ((objc_opt_respondsToSelector(v3, "_setBlurEnabled:") & 1) != 0) {
    [v3 _setBlurEnabled:0];
  }
  return v3;
}

- (id)_newFooterButton
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton tvsk_platterlessButton](&OBJC_CLASS___UIButton, "tvsk_platterlessButton"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 titleLabel]);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvsk_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvsk_fontFromTextStyle:", UIFontTextStyleBody));
  [v3 setFont:v4];

  return v2;
}

- (BOOL)_hasFooterButton
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footerButton](self, "footerButton"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIButton);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView footerButton](self, "footerButton"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 titleLabel]);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
    char v9 = [v8 length] != 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView dataSource](self, "dataSource"));
    char v9 = objc_opt_respondsToSelector(v6, "footerButtonViewForChoiceView:");
  }

  return v9 & 1;
}

- (BOOL)_hasAuxiliaryButton
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView auxiliaryButton](self, "auxiliaryButton"));
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIButton);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView auxiliaryButton](self, "auxiliaryButton"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 titleLabel]);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 text]);
    char v9 = [v8 length] != 0;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView dataSource](self, "dataSource"));
    char v9 = objc_opt_respondsToSelector(v6, "auxiliaryButtonViewForChoiceView:");
  }

  return v9 & 1;
}

- (void)_didSelectButton:(id)a3
{
  id v8 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SATVChoiceView firstChoiceButton](self, "firstChoiceButton"));

  if (v4 == v8)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVChoiceView secondChoiceButton](self, "secondChoiceButton"));

    if (v5 == v8) {
      uint64_t v6 = 1LL;
    }
    else {
      uint64_t v6 = 2LL;
    }
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView delegate](self, "delegate"));
  [v7 didSelectChoice:v6];
}

- (void)_didSelectFooterButton
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVChoiceView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v2, "didSelectFooterButton") & 1) != 0) {
    [v2 didSelectFooterButton];
  }
}

- (void)_didSelectAuxiliaryButton
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVChoiceView delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v2, "didSelectAuxiliaryButton") & 1) != 0) {
    [v2 didSelectAuxiliaryButton];
  }
}

- (void)_setUpUI
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView layer](self, "layer"));
  [v3 setAllowsGroupBlending:0];

  id v4 = (TVSKPlatterlessNonScalingButton *)objc_claimAutoreleasedReturnValue(-[SATVChoiceView _choiceHeaderButton](self, "_choiceHeaderButton"));
  choiceHeaderButton = self->_choiceHeaderButton;
  self->_choiceHeaderButton = v4;

  -[SATVChoiceView addSubview:](self, "addSubview:", self->_choiceHeaderButton);
  uint64_t v6 = objc_alloc(&OBJC_CLASS____SATVChoiceButtonContainerView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  CGFloat v10 = -[_SATVChoiceButtonContainerView initWithFrame:](v6, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  choiceButtonContainer = self->_choiceButtonContainer;
  self->_choiceButtonContainer = v10;

  -[_SATVChoiceButtonContainerView setBackgroundColor:](self->_choiceButtonContainer, "setBackgroundColor:", 0LL);
  -[_SATVChoiceButtonContainerView _setSpeedBumpEdges:](self->_choiceButtonContainer, "_setSpeedBumpEdges:", 5LL);
  -[SATVChoiceView addSubview:](self, "addSubview:", self->_choiceButtonContainer);
  double v12 = -[SATVChoiceView _newDefaultButton](self, "_newDefaultButton");
  firstChoiceButton = self->_firstChoiceButton;
  self->_firstChoiceButton = v12;

  -[_SATVChoiceButtonContainerView addSubview:](self->_choiceButtonContainer, "addSubview:", self->_firstChoiceButton);
  -[_SATVChoiceButtonContainerView setPreferredButton:]( self->_choiceButtonContainer,  "setPreferredButton:",  self->_firstChoiceButton);
  double v14 = -[SATVChoiceView _newDefaultButton](self, "_newDefaultButton");
  secondChoiceButton = self->_secondChoiceButton;
  self->_secondChoiceButton = v14;

  -[_SATVChoiceButtonContainerView addSubview:](self->_choiceButtonContainer, "addSubview:", self->_secondChoiceButton);
  double v16 = -[SATVChoiceView _newFooterButton](self, "_newFooterButton");
  -[UIView setHidden:](v16, "setHidden:", 1LL);
  -[UIView addTarget:action:forControlEvents:]( v16,  "addTarget:action:forControlEvents:",  self,  "_didSelectFooterButton",  0x2000LL);
  footerButton = self->_footerButton;
  self->_footerButton = v16;
  char v28 = v16;

  -[SATVChoiceView addSubview:](self, "addSubview:", self->_footerButton);
  double v18 = objc_alloc_init(&OBJC_CLASS___TVSKLabel);
  footnoteLabel = self->_footnoteLabel;
  self->_footnoteLabel = (UILabel *)v18;

  CGFloat v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvsk_opacityCDynamicColor](&OBJC_CLASS___UIColor, "tvsk_opacityCDynamicColor"));
  -[UILabel setTextColor:](self->_footnoteLabel, "setTextColor:", v20);

  double v21 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont tvsk_fontFromTextStyle:]( &OBJC_CLASS___UIFont,  "tvsk_fontFromTextStyle:",  UIFontTextStyleBody));
  -[UILabel setFont:](self->_footnoteLabel, "setFont:", v21);

  CGFloat v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[UILabel setBackgroundColor:](self->_footnoteLabel, "setBackgroundColor:", v22);

  -[UILabel setNumberOfLines:](self->_footnoteLabel, "setNumberOfLines:", 0LL);
  -[UILabel setTextAlignment:](self->_footnoteLabel, "setTextAlignment:", 1LL);
  -[SATVChoiceView addSubview:](self, "addSubview:", self->_footnoteLabel);
  double v23 = -[SATVChoiceView _newFooterButton](self, "_newFooterButton");
  -[UIView setHidden:](v23, "setHidden:", 1LL);
  -[UIView addTarget:action:forControlEvents:]( v23,  "addTarget:action:forControlEvents:",  self,  "_didSelectAuxiliaryButton",  0x2000LL);
  auxiliaryButton = self->_auxiliaryButton;
  self->_auxiliaryButton = v23;
  double v25 = v23;

  -[SATVChoiceView addSubview:](self, "addSubview:", self->_auxiliaryButton);
  v26 = -[SATVHeaderView initWithFrame:]( objc_alloc(&OBJC_CLASS___SATVHeaderView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
  headerView = self->_headerView;
  self->_headerView = v26;

  -[SATVChoiceView addSubview:](self, "addSubview:", self->_headerView);
}

- (SATVHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (SATVChoiceViewDataSource)dataSource
{
  return (SATVChoiceViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (SATVChoiceViewDelegate)delegate
{
  return (SATVChoiceViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)choiceViewStyle
{
  return self->_choiceViewStyle;
}

- (unint64_t)choiceButtonLayout
{
  return self->_choiceButtonLayout;
}

- (TVSKPlatterlessNonScalingButton)choiceHeaderButton
{
  return self->_choiceHeaderButton;
}

- (void)setChoiceHeaderButton:(id)a3
{
}

- (UIView)footerButton
{
  return self->_footerButton;
}

- (void)setFooterButton:(id)a3
{
}

- (UILabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (UIView)auxiliaryButton
{
  return self->_auxiliaryButton;
}

- (void)setAuxiliaryButton:(id)a3
{
}

- (_SATVChoiceButtonContainerView)choiceButtonContainer
{
  return self->_choiceButtonContainer;
}

- (void)setChoiceButtonContainer:(id)a3
{
}

- (UIButton)firstChoiceButton
{
  return self->_firstChoiceButton;
}

- (void)setFirstChoiceButton:(id)a3
{
}

- (UIButton)secondChoiceButton
{
  return self->_secondChoiceButton;
}

- (void)setSecondChoiceButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end