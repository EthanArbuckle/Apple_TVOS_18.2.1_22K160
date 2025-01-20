@interface TVSettingsLearnRemoteViewController
- (NSDictionary)actionViewMap;
- (NSSet)learnedActions;
- (NSUUID)learnedDeviceUUID;
- (PBSExternalControlIRLearningConfiguration)configuration;
- (PBSExternalControlIRLearningManager)learningManager;
- (TVSettingsLearnRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIButton)focusButton;
- (UILabel)activityLabel;
- (UILabel)bottomTextLabel;
- (UILabel)instructionLabel;
- (UILabel)titleLabel;
- (UIProgressView)progressView;
- (UIStackView)buttonStackView;
- (UIStackView)learningHeaderStackView;
- (UIStackView)learningProgressStackView;
- (UIStackView)learningStackView;
- (UITapGestureRecognizer)leftTapGestureRecognizer;
- (UITapGestureRecognizer)rightTapGestureRecognizer;
- (id)_buildActionImageViews;
- (id)completionHandler;
- (id)preferredFocusEnvironments;
- (int)currentActionBeingLearned;
- (void)_configureButtonStackForAction:(int)a3;
- (void)_hideProgressView;
- (void)_learnNextAction:(id)a3;
- (void)_learnPreviousAction:(id)a3;
- (void)_setAppearanceFor:(id)a3 selected:(BOOL)a4;
- (void)_updateProgressViewWithProgress:(double)a3 animated:(BOOL)a4;
- (void)irLearningManager:(id)a3 didCompleteLearningAction:(int)a4 withResult:(BOOL)a5 error:(id)a6;
- (void)irLearningManager:(id)a3 didFailToStartLearningWithError:(id)a4;
- (void)irLearningManager:(id)a3 didFinishLearningAction:(int)a4;
- (void)irLearningManager:(id)a3 didLearnAction:(int)a4 withProgress:(double)a5;
- (void)irLearningManager:(id)a3 didSaveLearnedActions:(id)a4 forDeviceWithUUID:(id)a5;
- (void)irLearningManager:(id)a3 willStartLearningAction:(int)a4;
- (void)setActionViewMap:(id)a3;
- (void)setActivityLabel:(id)a3;
- (void)setBottomTextLabel:(id)a3;
- (void)setButtonStackView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setCurrentActionBeingLearned:(int)a3;
- (void)setFocusButton:(id)a3;
- (void)setInstructionLabel:(id)a3;
- (void)setLearnedActions:(id)a3;
- (void)setLearnedDeviceUUID:(id)a3;
- (void)setLearningHeaderStackView:(id)a3;
- (void)setLearningManager:(id)a3;
- (void)setLearningProgressStackView:(id)a3;
- (void)setLearningStackView:(id)a3;
- (void)setLeftTapGestureRecognizer:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setRightTapGestureRecognizer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSettingsLearnRemoteViewController

- (TVSettingsLearnRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewController;
  v4 = -[TVSettingsLearnRemoteViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[PBSExternalControlIRLearningConfiguration basicConfigurationForDeviceWithUUID:]( &OBJC_CLASS___PBSExternalControlIRLearningConfiguration,  "basicConfigurationForDeviceWithUUID:",  0LL));
    configuration = v4->_configuration;
    v4->_configuration = (PBSExternalControlIRLearningConfiguration *)v5;

    v7 = objc_alloc_init(&OBJC_CLASS___PBSExternalControlIRLearningManager);
    learningManager = v4->_learningManager;
    v4->_learningManager = v7;

    -[PBSExternalControlIRLearningManager setDelegate:](v4->_learningManager, "setDelegate:", v4);
    v4->_currentActionBeingLearned = 0;
  }

  return v4;
}

- (void)viewDidLoad
{
  v121.receiver = self;
  v121.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewController;
  -[TVSettingsLearnRemoteViewController viewDidLoad](&v121, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](&OBJC_CLASS___UIButton, "buttonWithType:", 0LL));
  -[TVSettingsLearnRemoteViewController setFocusButton:](self, "setFocusButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController focusButton](self, "focusButton"));
  [v4 addSubview:v5];

  v6 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[TVSettingsLearnRemoteViewController setTitleLabel:](self, "setTitleLabel:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline));
  [v7 setFont:v8];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController titleLabel](self, "titleLabel"));
  [v9 setOpaque:0];

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController titleLabel](self, "titleLabel"));
  [v10 setBackgroundColor:0];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController titleLabel](self, "titleLabel"));
  [v11 setNumberOfLines:1];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController titleLabel](self, "titleLabel"));
  [v12 setTextAlignment:1];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController titleLabel](self, "titleLabel"));
  uint64_t v14 = TSKLocString(@"RCLearnRemoteTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  [v13 setText:v15];

  v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[TVSettingsLearnRemoteViewController setInstructionLabel:](self, "setInstructionLabel:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleBody));
  [v17 setFont:v18];

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  uint64_t v20 = TSKLocString(@"RCLearnRemoteWaitingToStartText");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  [v19 setText:v21];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  [v22 setOpaque:0];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  [v23 setBackgroundColor:0];

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  [v24 setNumberOfLines:0];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  [v25 setTextAlignment:1];

  v26 = objc_alloc(&OBJC_CLASS___UIStackView);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController titleLabel](self, "titleLabel"));
  v125[0] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  v125[1] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v125, 2LL));
  v30 = -[UIStackView initWithArrangedSubviews:](v26, "initWithArrangedSubviews:", v29);
  -[TVSettingsLearnRemoteViewController setLearningHeaderStackView:](self, "setLearningHeaderStackView:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningHeaderStackView](self, "learningHeaderStackView"));
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningHeaderStackView](self, "learningHeaderStackView"));
  [v32 setAxis:1];

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningHeaderStackView](self, "learningHeaderStackView"));
  [v33 setDistribution:3];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningHeaderStackView](self, "learningHeaderStackView"));
  [v34 setAlignment:3];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningHeaderStackView](self, "learningHeaderStackView"));
  [v35 setSpacing:40.0];

  v36 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[TVSettingsLearnRemoteViewController setActivityLabel:](self, "setActivityLabel:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1));
  [v37 setFont:v38];

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
  [v39 setOpaque:0];

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
  [v40 setBackgroundColor:0];

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
  [v41 setNumberOfLines:0];

  v42 = -[UIProgressView initWithProgressViewStyle:]( objc_alloc(&OBJC_CLASS___UIProgressView),  "initWithProgressViewStyle:",  0LL);
  -[TVSettingsLearnRemoteViewController setProgressView:](self, "setProgressView:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController progressView](self, "progressView"));
  [v43 setHidden:1];

  v44 = objc_alloc(&OBJC_CLASS___UIStackView);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController progressView](self, "progressView"));
  v124[0] = v45;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
  v124[1] = v46;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v124, 2LL));
  v48 = -[UIStackView initWithArrangedSubviews:](v44, "initWithArrangedSubviews:", v47);
  -[TVSettingsLearnRemoteViewController setLearningProgressStackView:](self, "setLearningProgressStackView:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningProgressStackView](self, "learningProgressStackView"));
  [v49 setTranslatesAutoresizingMaskIntoConstraints:0];

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningProgressStackView](self, "learningProgressStackView"));
  [v50 setAxis:1];

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningProgressStackView](self, "learningProgressStackView"));
  [v51 setDistribution:3];

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningProgressStackView](self, "learningProgressStackView"));
  [v52 setAlignment:3];

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningProgressStackView](self, "learningProgressStackView"));
  [v53 setSpacing:30.0];

  v120 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController _buildActionImageViews](self, "_buildActionImageViews"));
  v54 = -[UIStackView initWithArrangedSubviews:]( objc_alloc(&OBJC_CLASS___UIStackView),  "initWithArrangedSubviews:",  v120);
  -[TVSettingsLearnRemoteViewController setButtonStackView:](self, "setButtonStackView:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController buttonStackView](self, "buttonStackView"));
  [v55 setTranslatesAutoresizingMaskIntoConstraints:0];

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController buttonStackView](self, "buttonStackView"));
  [v56 setAxis:0];

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController buttonStackView](self, "buttonStackView"));
  [v57 setDistribution:3];

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController buttonStackView](self, "buttonStackView"));
  [v58 setAlignment:3];

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController buttonStackView](self, "buttonStackView"));
  [v59 setSpacing:73.0];

  v60 = objc_alloc(&OBJC_CLASS___UIStackView);
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningHeaderStackView](self, "learningHeaderStackView"));
  v123[0] = v61;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController buttonStackView](self, "buttonStackView"));
  v123[1] = v62;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningProgressStackView](self, "learningProgressStackView"));
  v123[2] = v63;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v123, 3LL));
  v65 = -[UIStackView initWithArrangedSubviews:](v60, "initWithArrangedSubviews:", v64);
  -[TVSettingsLearnRemoteViewController setLearningStackView:](self, "setLearningStackView:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningStackView](self, "learningStackView"));
  [v66 setTranslatesAutoresizingMaskIntoConstraints:0];

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningStackView](self, "learningStackView"));
  [v67 setAxis:1];

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningStackView](self, "learningStackView"));
  [v68 setDistribution:3];

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningStackView](self, "learningStackView"));
  [v69 setAlignment:3];

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningStackView](self, "learningStackView"));
  [v70 setSpacing:100.0];

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningStackView](self, "learningStackView"));
  [v71 addSubview:v72];

  v73 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[TVSettingsLearnRemoteViewController setBottomTextLabel:](self, "setBottomTextLabel:", v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController bottomTextLabel](self, "bottomTextLabel"));
  v75 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1));
  [v74 setFont:v75];

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController bottomTextLabel](self, "bottomTextLabel"));
  [v76 setOpaque:0];

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController bottomTextLabel](self, "bottomTextLabel"));
  [v77 setBackgroundColor:0];

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController bottomTextLabel](self, "bottomTextLabel"));
  [v78 setTranslatesAutoresizingMaskIntoConstraints:0];

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController bottomTextLabel](self, "bottomTextLabel"));
  v80 = (void *)objc_claimAutoreleasedReturnValue([v79 font]);
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
  uint64_t v82 = TSKAttributedSymbolLocString(@"RCLearnRemoteFootnoteText", &off_1001AF778, v80, v81);
  v119 = (void *)objc_claimAutoreleasedReturnValue(v82);

  v83 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController bottomTextLabel](self, "bottomTextLabel"));
  [v83 setAttributedText:v119];

  v84 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController bottomTextLabel](self, "bottomTextLabel"));
  [v84 addSubview:v85];

  v118 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningStackView](self, "learningStackView"));
  v116 = (void *)objc_claimAutoreleasedReturnValue([v118 centerXAnchor]);
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  v115 = (void *)objc_claimAutoreleasedReturnValue([v117 centerXAnchor]);
  v114 = (void *)objc_claimAutoreleasedReturnValue([v116 constraintEqualToAnchor:v115]);
  v122[0] = v114;
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningStackView](self, "learningStackView"));
  v111 = (void *)objc_claimAutoreleasedReturnValue([v113 widthAnchor]);
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  v110 = (void *)objc_claimAutoreleasedReturnValue([v112 widthAnchor]);
  v109 = (void *)objc_claimAutoreleasedReturnValue([v111 constraintLessThanOrEqualToAnchor:v110 multiplier:1.0]);
  v122[1] = v109;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController buttonStackView](self, "buttonStackView"));
  v106 = (void *)objc_claimAutoreleasedReturnValue([v108 centerYAnchor]);
  v107 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  v105 = (void *)objc_claimAutoreleasedReturnValue([v107 centerYAnchor]);
  v104 = (void *)objc_claimAutoreleasedReturnValue([v106 constraintEqualToAnchor:v105]);
  v122[2] = v104;
  v103 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController progressView](self, "progressView"));
  v102 = (void *)objc_claimAutoreleasedReturnValue([v103 widthAnchor]);
  v101 = (void *)objc_claimAutoreleasedReturnValue([v102 constraintEqualToConstant:530.0]);
  v122[3] = v101;
  v100 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController bottomTextLabel](self, "bottomTextLabel"));
  v99 = (void *)objc_claimAutoreleasedReturnValue([v100 centerXAnchor]);
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  v87 = (void *)objc_claimAutoreleasedReturnValue([v86 centerXAnchor]);
  v88 = (void *)objc_claimAutoreleasedReturnValue([v99 constraintEqualToAnchor:v87]);
  v122[4] = v88;
  v89 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController bottomTextLabel](self, "bottomTextLabel"));
  v90 = (void *)objc_claimAutoreleasedReturnValue([v89 bottomAnchor]);
  v91 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  v92 = (void *)objc_claimAutoreleasedReturnValue([v91 bottomAnchor]);
  v93 = (void *)objc_claimAutoreleasedReturnValue([v90 constraintEqualToAnchor:v92 constant:-60.0]);
  v122[5] = v93;
  v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v122, 6LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v94);

  v95 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_learnPreviousAction:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v95, "setAllowedPressTypes:", &off_1001AF0E8);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v95, "setAllowedTouchTypes:", &__NSArray0__struct);
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  [v96 addGestureRecognizer:v95];

  -[TVSettingsLearnRemoteViewController setLeftTapGestureRecognizer:](self, "setLeftTapGestureRecognizer:", v95);
  v97 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_learnNextAction:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v97, "setAllowedPressTypes:", &off_1001AF100);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v97, "setAllowedTouchTypes:", &__NSArray0__struct);
  v98 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController view](self, "view"));
  [v98 addGestureRecognizer:v97];

  -[TVSettingsLearnRemoteViewController setRightTapGestureRecognizer:](self, "setRightTapGestureRecognizer:", v97);
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewController;
  -[TVSettingsLearnRemoteViewController viewWillAppear:](&v12, "viewWillAppear:", a3);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController completionHandler](self, "completionHandler"));

    if (!v10) {
      return;
    }
    v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[TVSettingsLearnRemoteViewController completionHandler]( self,  "completionHandler"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learnedActions](self, "learnedActions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learnedDeviceUUID](self, "learnedDeviceUUID"));
    ((void (**)(void, void *, void *))v8)[2](v8, v9, v11);
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningManager](self, "learningManager"));
    unsigned __int8 v5 = [v4 isLearningInProgress];

    if ((v5 & 1) != 0) {
      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController configuration](self, "configuration"));

    if (!v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBSExternalControlIRLearningConfiguration basicConfigurationForDeviceWithUUID:]( &OBJC_CLASS___PBSExternalControlIRLearningConfiguration,  "basicConfigurationForDeviceWithUUID:",  0LL));
      -[TVSettingsLearnRemoteViewController setConfiguration:](self, "setConfiguration:", v7);
    }

    v8 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[TVSettingsLearnRemoteViewController learningManager]( self,  "learningManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController configuration](self, "configuration"));
    [v8 startLearningForConfiguration:v9 withCompletion:&stru_100192CE0];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewController;
  -[TVSettingsLearnRemoteViewController viewDidDisappear:](&v7, "viewDidDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningManager](self, "learningManager"));
  unsigned int v5 = [v4 isLearningInProgress];

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningManager](self, "learningManager"));
    [v6 cancelLearningWithCompletion:&stru_100192D00];
  }

- (id)preferredFocusEnvironments
{
  if (self->_focusButton)
  {
    focusButton = self->_focusButton;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &focusButton,  1LL));
  }

  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsLearnRemoteViewController;
  id v4 = a3;
  -[TVSettingsLearnRemoteViewController traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6)
  {
    if (v7 != v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController actionViewMap](self, "actionViewMap"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_10009F668;
      v9[3] = &unk_100192D28;
      v9[4] = self;
      [v8 enumerateKeysAndObjectsUsingBlock:v9];
    }
  }

- (void)irLearningManager:(id)a3 didFailToStartLearningWithError:(id)a4
{
  if (_TVSLogInternalLogLevel >= 3)
  {
    uint64_t v6 = TVSSystemLog;
    id v7 = a4;
    if (pthread_main_np()) {
      v8 = @"Main:";
    }
    else {
      v8 = &stru_100195DD8;
    }
    pthread_t v9 = pthread_self();
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController configuration](self, "configuration"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceUUID]);
    id v21 = v7;
    pthread_t v18 = v9;
    uint64_t v19 = v6;
    v17 = v8;
    _TVSLogBase(v4, &_os_log_default, 65LL, 0LL, 3LL, v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsLearnRemoteViewController instructionLabel]( self,  "instructionLabel",  v17,  v18,  v19,  v20,  v21));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 font]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
  uint64_t v14 = TSKAttributedSymbolLocString(@"RCLearnRemoteStartLearningErrorActivityText", &off_1001AF7A0, v12, v13);
  id v22 = (id)objc_claimAutoreleasedReturnValue(v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  [v15 setAttributedText:v22];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
  [v16 setText:0];

  -[TVSettingsLearnRemoteViewController _hideProgressView](self, "_hideProgressView");
}

- (void)irLearningManager:(id)a3 didSaveLearnedActions:(id)a4 forDeviceWithUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([a3 configuration]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceUUID]);

  -[TVSettingsLearnRemoteViewController setLearnedActions:](self, "setLearnedActions:", v8);
  -[TVSettingsLearnRemoteViewController setLearnedDeviceUUID:](self, "setLearnedDeviceUUID:", v9);
  if (v11)
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController completionHandler](self, "completionHandler"));

    if (v12)
    {
      v13 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue( -[TVSettingsLearnRemoteViewController completionHandler]( self,  "completionHandler"));
      ((void (**)(void, id, id))v13)[2](v13, v8, v9);
    }
  }

  else
  {
    *(_BYTE *)&self->_flags |= 0x10u;
    uint64_t v14 = objc_alloc_init(&OBJC_CLASS___TVSettingsRenameIRDeviceViewController);
    -[TVSettingsRenameIRDeviceViewController setDeviceUUID:](v14, "setDeviceUUID:", v9);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10009F9DC;
    v16[3] = &unk_10018EA28;
    v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    -[TVSettingsRenameIRDeviceViewController setCompletionHandler:](v14, "setCompletionHandler:", v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController navigationController](self, "navigationController"));
    [v15 pushViewController:v14 animated:1];
  }
}

- (void)irLearningManager:(id)a3 willStartLearningAction:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[TVSettingsLearnRemoteViewController _configureButtonStackForAction:]( self,  "_configureButtonStackForAction:",  *(void *)&a4);
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    uint64_t v6 = TSKLocString(@"RCLearnRemoteInstructionText");
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = PBSLocalizedStringFromCoreControlAction(v4);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v9));
    uint64_t v11 = TSKLocString(@"RCLearnRemoteSubInstructionText");
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = PBSLocalizedStringFromCoreControlAction(v4);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@\n%@",  v10,  v15));

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 font]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
    uint64_t v20 = TSKAttributedSymbolLocString(v16, &off_1001AF7C8, v18, v19);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
    [v22 setAttributedText:v21];

    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
      uint64_t v24 = TSKLocString(@"RCLearnRemoteLearningProgressActivityStartedText");
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      uint64_t v26 = PBSLocalizedStringFromCoreControlAction(v4);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v25, v27));
      [v23 setText:v28];
    }
  }

  -[TVSettingsLearnRemoteViewController _updateProgressViewWithProgress:animated:]( self,  "_updateProgressViewWithProgress:animated:",  0LL,  0.0);
}

- (void)irLearningManager:(id)a3 didLearnAction:(int)a4 withProgress:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel", a3));
  uint64_t v9 = TSKLocString(@"RCLearnRemoteLearningProgressActivityText");
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = PBSLocalizedStringFromCoreControlAction(v6);
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v12, a5 * 100.0));
  [v8 setText:v13];

  double v14 = a5 * 1.25;
  if (a5 * 1.25 > 1.0) {
    double v14 = 1.0;
  }
  -[TVSettingsLearnRemoteViewController _updateProgressViewWithProgress:animated:]( self,  "_updateProgressViewWithProgress:animated:",  1LL,  v14);
}

- (void)irLearningManager:(id)a3 didCompleteLearningAction:(int)a4 withResult:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  id v47 = a3;
  id v10 = a6;
  uint64_t v11 = v10;
  if (!v7)
  {
    if (!v10)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
      uint64_t v41 = TSKLocString(@"RCLearnRemoteInactivityText");
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      [v40 setText:v42];

      *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x3F | 0x40;
      goto LABEL_11;
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
    if ([v35 isEqualToString:kCoreControlErrorDomain])
    {
      id v36 = [v11 code];

      if (v36 == (id)9)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
        uint64_t v38 = TSKLocString(@"RCLearnRemoteLearningDuplicateActivityText");
        v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
        [v37 setText:v39];
LABEL_10:

        *(_BYTE *)&self->_flags &= 0x3Fu;
        goto LABEL_11;
      }
    }

    else
    {
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
    uint64_t v43 = TSKLocString(@"RCLearnRemoteLearningErrorActivityText");
    v39 = (void *)objc_claimAutoreleasedReturnValue(v43);
    uint64_t v44 = PBSLocalizedStringFromCoreControlAction(v8);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v39, v45));
    [v37 setText:v46];

    goto LABEL_10;
  }

  uint64_t v12 = TSKLocString(@"RCLearnRemoteInstructionSuccessText");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  uint64_t v14 = PBSLocalizedStringFromCoreControlAction(v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v13, v15));
  uint64_t v17 = TSKLocString(@"RCLearnRemoteSubInstructionSuccessText");
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  uint64_t v19 = PBSLocalizedStringFromCoreControlAction(v8);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v18, v20));
  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n%@", v16, v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 font]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](&OBJC_CLASS___UIColor, "labelColor"));
  uint64_t v26 = TSKAttributedSymbolLocString(v22, &off_1001AF7F0, v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController instructionLabel](self, "instructionLabel"));
  [v28 setAttributedText:v27];

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController activityLabel](self, "activityLabel"));
  uint64_t v30 = TSKLocString(@"RCLearnRemoteLearningProgressActivitySuccessText");
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  uint64_t v32 = PBSLocalizedStringFromCoreControlAction(v8);
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v31, v33));
  [v29 setText:v34];

  -[TVSettingsLearnRemoteViewController _updateProgressViewWithProgress:animated:]( self,  "_updateProgressViewWithProgress:animated:",  0LL,  1.0);
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x3F | 0x80;

LABEL_11:
}

- (void)irLearningManager:(id)a3 didFinishLearningAction:(int)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000A0250;
  v13[3] = &unk_100192D70;
  objc_copyWeak(&v15, &location);
  int v16 = a4;
  v13[4] = self;
  id v7 = v6;
  id v14 = v7;
  uint64_t v8 = objc_retainBlock(v13);
  uint64_t v9 = v8;
  if ((*(_BYTE *)&self->_flags & 0x80000000) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000A0498;
    v12[3] = &unk_100192D98;
    id v10 = v12;
    v12[4] = v8;
    [v7 learnNextActionWithCompletion:v12];
  }

  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000A04A4;
    v11[3] = &unk_100192D98;
    id v10 = v11;
    v11[4] = v8;
    [v7 relearnCurrentActionWithCompletion:v11];
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_hideProgressView
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController progressView](self, "progressView"));
  LODWORD(v4) = 0;
  [v3 setProgress:0 animated:v4];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController progressView](self, "progressView"));
  [v5 setHidden:1];
}

- (void)_updateProgressViewWithProgress:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController progressView](self, "progressView"));
  *(float *)&double v8 = a3;
  [v7 setProgress:v4 animated:v8];

  id v9 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController progressView](self, "progressView"));
  [v9 setHidden:0];
}

- (void)_learnPreviousAction:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningManager](self, "learningManager", a3));
  unsigned int v5 = [v4 isLearningInProgress];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningManager](self, "learningManager"));
    [v6 learnPreviousActionWithCompletion:&stru_100192DB8];
  }

- (void)_learnNextAction:(id)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningManager](self, "learningManager", a3));
  unsigned int v5 = [v4 isLearningInProgress];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController learningManager](self, "learningManager"));
    [v6 learnNextActionWithCompletion:&stru_100192DD8];
  }

- (void)_configureButtonStackForAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[TVSettingsLearnRemoteViewController setCurrentActionBeingLearned:](self, "setCurrentActionBeingLearned:");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController actionViewMap](self, "actionViewMap", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allValues]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        -[TVSettingsLearnRemoteViewController _setAppearanceFor:selected:]( self,  "_setAppearanceFor:selected:",  *(void *)(*((void *)&v14 + 1) + 8LL * (void)v10),  0LL);
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController actionViewMap](self, "actionViewMap"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v12]);

  -[TVSettingsLearnRemoteViewController _setAppearanceFor:selected:](self, "_setAppearanceFor:selected:", v13, 1LL);
}

- (id)_buildActionImageViews
{
  uint64_t v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  BOOL v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1000A0CFC;
  v27[3] = &unk_100192E00;
  __int128 v30 = xmmword_10012A310;
  uint64_t v31 = 0x405D000000000000LL;
  id v28 = (id)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithPointSize:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithPointSize:",  56.0));
  v29 = self;
  id v5 = v28;
  id v6 = objc_retainBlock(v27);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController configuration](self, "configuration"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 actions]);
  unsigned int v9 = [v8 containsObject:&off_1001AD608];

  if (v9)
  {
    ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  9LL,  @"speaker.wave.3",  v3,  v4);
    ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  12LL,  @"speaker.wave.1",  v3,  v4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController configuration](self, "configuration"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 actions]);
    unsigned int v12 = [v11 containsObject:&off_1001AD620];

    if (v12) {
      ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  15LL,  @"speaker.slash",  v3,  v4);
    }
  }

  else
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController configuration](self, "configuration"));
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 actions]);
    unsigned int v15 = [v14 containsObject:&off_1001AD638];

    if (v15)
    {
      ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  17LL,  @"arrow.up.circle",  v3,  v4);
      ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  18LL,  @"arrow.down.circle",  v3,  v4);
      ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  19LL,  @"arrow.left.circle",  v3,  v4);
      ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  20LL,  @"arrow.right.circle",  v3,  v4);
      ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  21LL,  @"checkmark.circle",  v3,  v4);
      ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  22LL,  @"chevron.backward",  v3,  v4);
      ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  35LL,  @"tv",  v3,  v4);
    }

    else
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController configuration](self, "configuration"));
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 actions]);
      unsigned int v18 = [v17 containsObject:&off_1001AD650];

      if (v18)
      {
        ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  23LL,  @"play",  v3,  v4);
        ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  24LL,  @"pause",  v3,  v4);
        ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  25LL,  @"stop",  v3,  v4);
        ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  26LL,  @"backward",  v3,  v4);
        ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  27LL,  @"forward",  v3,  v4);
        ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  28LL,  @"backward.frame",  v3,  v4);
        ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  29LL,  @"forward.frame",  v3,  v4);
        ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  30LL,  @"backward.end",  v3,  v4);
        ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  31LL,  @"forward.end",  v3,  v4);
      }

      else
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController configuration](self, "configuration"));
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 actions]);
        unsigned int v21 = [v20 containsObject:&off_1001AD668];

        if (v21)
        {
          ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  34LL,  @"list.bullet",  v3,  v4);
          ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  32LL,  @"chevron.up",  v3,  v4);
          ((void (*)(void *, uint64_t, const __CFString *, NSMutableDictionary *, NSMutableArray *))v6[2])( v6,  33LL,  @"chevron.down",  v3,  v4);
        }
      }
    }
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController buttonStackView](self, "buttonStackView"));
  [v22 setClipsSubviews:0];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController buttonStackView](self, "buttonStackView"));
  [v23 setClipsToBounds:0];

  id v24 = -[NSMutableDictionary copy](v3, "copy");
  -[TVSettingsLearnRemoteViewController setActionViewMap:](self, "setActionViewMap:", v24);

  id v25 = -[NSMutableArray copy](v4, "copy");
  return v25;
}

- (void)_setAppearanceFor:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (qword_1001E19D8 != -1) {
    dispatch_once(&qword_1001E19D8, &stru_100192E20);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsLearnRemoteViewController traitCollection](self, "traitCollection"));
  id v8 = [v7 userInterfaceStyle];

  unsigned int v9 = &qword_1001E19C0;
  if (v8 != (id)2) {
    unsigned int v9 = &qword_1001E19D0;
  }
  id v10 = &qword_1001E19B8;
  if (v8 != (id)2) {
    id v10 = &qword_1001E19C8;
  }
  BOOL v11 = !v4;
  if (v4)
  {
    uint64_t v12 = 4LL;
  }

  else
  {
    unsigned int v9 = v10;
    uint64_t v12 = 0LL;
  }

  if (v11) {
    double v13 = 0.0;
  }
  else {
    double v13 = 0.5;
  }
  [v6 setTintColor:*v9];
  id v14 = v6;
  [v14 setControlState:v12 animated:0];
  [v14 setUnfocusedShadowOpacity:v13];
}

- (PBSExternalControlIRLearningConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
}

- (UILabel)bottomTextLabel
{
  return self->_bottomTextLabel;
}

- (void)setBottomTextLabel:(id)a3
{
}

- (UILabel)activityLabel
{
  return self->_activityLabel;
}

- (void)setActivityLabel:(id)a3
{
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (NSDictionary)actionViewMap
{
  return self->_actionViewMap;
}

- (void)setActionViewMap:(id)a3
{
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
}

- (UIStackView)learningStackView
{
  return self->_learningStackView;
}

- (void)setLearningStackView:(id)a3
{
}

- (UIStackView)learningHeaderStackView
{
  return self->_learningHeaderStackView;
}

- (void)setLearningHeaderStackView:(id)a3
{
}

- (UIStackView)learningProgressStackView
{
  return self->_learningProgressStackView;
}

- (void)setLearningProgressStackView:(id)a3
{
}

- (UIButton)focusButton
{
  return self->_focusButton;
}

- (void)setFocusButton:(id)a3
{
}

- (UITapGestureRecognizer)leftTapGestureRecognizer
{
  return self->_leftTapGestureRecognizer;
}

- (void)setLeftTapGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)rightTapGestureRecognizer
{
  return self->_rightTapGestureRecognizer;
}

- (void)setRightTapGestureRecognizer:(id)a3
{
}

- (PBSExternalControlIRLearningManager)learningManager
{
  return self->_learningManager;
}

- (void)setLearningManager:(id)a3
{
}

- (int)currentActionBeingLearned
{
  return self->_currentActionBeingLearned;
}

- (void)setCurrentActionBeingLearned:(int)a3
{
  self->_currentActionBeingLearned = a3;
}

- (NSSet)learnedActions
{
  return self->_learnedActions;
}

- (void)setLearnedActions:(id)a3
{
}

- (NSUUID)learnedDeviceUUID
{
  return self->_learnedDeviceUUID;
}

- (void)setLearnedDeviceUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end