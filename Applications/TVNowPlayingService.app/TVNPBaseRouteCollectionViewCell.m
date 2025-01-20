@interface TVNPBaseRouteCollectionViewCell
+ (BOOL)allowsSelection;
+ (BOOL)shouldUpdateMusicBars;
+ (id)_volumeImage:(BOOL)a3;
+ (void)_configureFloatingContentViewAppearance;
- (BOOL)allowsGrouping;
- (BOOL)displayAsSelected;
- (BOOL)isGroupLeader;
- (BOOL)pendingSelection;
- (BOOL)shareAudio;
- (NSMutableArray)volatileContraints;
- (NSNumber)volumeLevel;
- (NSString)subtitleText;
- (NSString)titleText;
- (TVNPBaseRouteCollectionViewCell)initWithFrame:(CGRect)a3;
- (TVNPFloatingContentControl)accessoryView;
- (TVNPFloatingContentControl)routeView;
- (TVNPNowPlayingProgressView)volumeProgressView;
- (TVNPNowPlayingSliderView)volumeSliderView;
- (TVNPRoutingMusicBarsView)musicBarsView;
- (UIActivityIndicatorView)pendingSelectView;
- (UIImage)deviceImage;
- (UIImageView)accessoryImageView;
- (UIImageView)checkmarkView;
- (UIImageView)iconView;
- (UIImageView)symbolImageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UILayoutGuide)layoutGuide;
- (UIView)accessoryBackgroundColorView;
- (UIView)backgroundColorView;
- (id)_checkmarkImage:(BOOL)a3;
- (id)preferredFocusEnvironments;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (unint64_t)_controlStateForCell;
- (unint64_t)cellState;
- (unint64_t)deviceType;
- (unint64_t)musicBarState;
- (void)_addInitialConstraints;
- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4;
- (void)applyLayoutAttributes:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setAllowsGrouping:(BOOL)a3;
- (void)setCellState:(unint64_t)a3;
- (void)setDeviceImage:(id)a3;
- (void)setDeviceType:(unint64_t)a3;
- (void)setDisplayAsSelected:(BOOL)a3;
- (void)setGroupLeader:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMusicBarState:(unint64_t)a3;
- (void)setPendingSelection:(BOOL)a3;
- (void)setShareAudio:(BOOL)a3;
- (void)setSubtitleText:(id)a3;
- (void)setTitleText:(id)a3;
- (void)setVolumeLevel:(id)a3;
- (void)updateConstraints;
- (void)volumeSliderValueChanged:(id)a3;
@end

@implementation TVNPBaseRouteCollectionViewCell

+ (BOOL)allowsSelection
{
  return 1;
}

+ (BOOL)shouldUpdateMusicBars
{
  return 1;
}

- (TVNPBaseRouteCollectionViewCell)initWithFrame:(CGRect)a3
{
  CGRect v94 = a3;
  SEL v92 = a2;
  id location = 0LL;
  v91.receiver = self;
  v91.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCell;
  obj = -[TVNPBaseRouteCollectionViewCell initWithFrame:]( &v91,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  id location = obj;
  objc_storeStrong(&location, obj);
  if (obj)
  {
    *((void *)location + 23) = 1LL;
    *((_BYTE *)location + 10) = 1;
    *((_BYTE *)location + 13) = 0;
    *((_BYTE *)location + 14) = 0;
    [(id)objc_opt_class(location) _configureFloatingContentViewAppearance];
    v79 = objc_alloc_init(&OBJC_CLASS___TVNPFloatingContentControl);
    v3 = (void *)*((void *)location + 8);
    *((void *)location + 8) = v79;

    [*((id *)location + 8) addTarget:location action:"accessoryViewSelected" forControlEvents:0x2000];
    [*((id *)location + 8) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v78 = [location contentView];
    [v78 addSubview:*((void *)location + 8)];

    id v90 = [*((id *)location + 8) contentView];
    [v90 setTranslatesAutoresizingMaskIntoConstraints:0];
    v77 = objc_alloc_init(&OBJC_CLASS___UIView);
    v4 = (void *)*((void *)location + 9);
    *((void *)location + 9) = v77;

    [*((id *)location + 9) setTranslatesAutoresizingMaskIntoConstraints:0];
    v76 = (void *)*((void *)location + 9);
    v75 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
    objc_msgSend(v76, "setBackgroundColor:");

    [v90 addSubview:*((void *)location + 9)];
    v74 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    v5 = (void *)*((void *)location + 10);
    *((void *)location + 10) = v74;

    v73 = (void *)*((void *)location + 10);
    v72 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    v71 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    objc_msgSend(v73, "setPreferredSymbolConfiguration:");

    [*((id *)location + 10) setTranslatesAutoresizingMaskIntoConstraints:0];
    v70 = (void *)*((void *)location + 10);
    id v69 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"chevron.forward");
    objc_msgSend(v70, "setImage:");

    [v90 addSubview:*((void *)location + 10)];
    v68 = objc_alloc_init(&OBJC_CLASS___TVNPFloatingContentControl);
    v6 = (void *)*((void *)location + 11);
    *((void *)location + 11) = v68;

    [*((id *)location + 11) addTarget:location action:"routeViewSelected" forControlEvents:0x2000];
    [*((id *)location + 11) setTranslatesAutoresizingMaskIntoConstraints:0];
    id v67 = [location contentView];
    [v67 addSubview:*((void *)location + 11)];

    id v89 = [*((id *)location + 11) contentView];
    [v89 setTranslatesAutoresizingMaskIntoConstraints:0];
    v66 = objc_alloc(&OBJC_CLASS___UIView);
    [location bounds];
    v88[1] = v7;
    v88[2] = v8;
    v88[3] = v9;
    v88[4] = v10;
    v65 = -[UIView initWithFrame:]( v66,  "initWithFrame:",  *(double *)&v7,  *(double *)&v8,  *(double *)&v9,  *(double *)&v10);
    v11 = (void *)*((void *)location + 12);
    *((void *)location + 12) = v65;

    [*((id *)location + 12) setTranslatesAutoresizingMaskIntoConstraints:0];
    v64 = (void *)*((void *)location + 12);
    v63 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1);
    objc_msgSend(v64, "setBackgroundColor:");

    [v89 addSubview:*((void *)location + 12)];
    *((void *)location + 5) = 1LL;
    v62 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    v12 = (void *)*((void *)location + 13);
    *((void *)location + 13) = v62;

    [*((id *)location + 13) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 13) setContentMode:1];
    [v89 addSubview:*((void *)location + 13)];
    v61 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    v88[0] =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");

    id v60 =  +[UIImageSymbolConfiguration _configurationWithHierarchicalColors:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "_configurationWithHierarchicalColors:",  &__NSArray0__struct);
    id v13 = objc_msgSend(v88[0], "configurationByApplyingConfiguration:");
    id v14 = v88[0];
    v88[0] = v13;

    v59 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    v15 = (void *)*((void *)location + 14);
    *((void *)location + 14) = v59;

    [*((id *)location + 14) setPreferredSymbolConfiguration:v88[0]];
    [*((id *)location + 14) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v89 addSubview:*((void *)location + 14)];
    if ([(id)objc_opt_class(location) allowsSelection])
    {
      v58 = objc_alloc_init(&OBJC_CLASS___UIImageView);
      v16 = (void *)*((void *)location + 15);
      *((void *)location + 15) = v58;

      [*((id *)location + 15) setTranslatesAutoresizingMaskIntoConstraints:0];
      [*((id *)location + 15) setContentMode:4];
      [v89 addSubview:*((void *)location + 15)];
      v57 = objc_alloc_init(&OBJC_CLASS___UIActivityIndicatorView);
      v17 = (void *)*((void *)location + 16);
      *((void *)location + 16) = v57;

      [*((id *)location + 16) setTranslatesAutoresizingMaskIntoConstraints:0];
      v56 = (void *)*((void *)location + 16);
      v55 = +[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor");
      objc_msgSend(v56, "setColor:");

      [v89 addSubview:*((void *)location + 16)];
    }

    v54 = objc_alloc(&OBJC_CLASS___TVNPRoutingMusicBarsView);
    sub_10001BDCC();
    from[3] = v18;
    from[4] = v19;
    sub_10001BDCC();
    from[1] = v20;
    from[2] = v21;
    sub_10001BD80();
    from[5] = v22;
    from[6] = v23;
    from[7] = v24;
    from[8] = v25;
    v53 = -[TVNPRoutingMusicBarsView initWithFrame:]( v54,  "initWithFrame:",  *(double *)&v22,  *(double *)&v23,  *(double *)&v24,  *(double *)&v25);
    v26 = (void *)*((void *)location + 17);
    *((void *)location + 17) = v53;

    [*((id *)location + 17) setTranslatesAutoresizingMaskIntoConstraints:0];
    [v89 addSubview:*((void *)location + 17)];
    v52 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v27 = (void *)*((void *)location + 18);
    *((void *)location + 18) = v52;

    [*((id *)location + 18) setTranslatesAutoresizingMaskIntoConstraints:0];
    v51 = (void *)*((void *)location + 18);
    v50 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    objc_msgSend(v51, "setFont:");

    LODWORD(v28) = 1144750080;
    [*((id *)location + 18) setContentHuggingPriority:0 forAxis:v28];
    [*((id *)location + 18) setEnablesMarqueeWhenAncestorFocused:1];
    [v89 addSubview:*((void *)location + 18)];
    v49 = objc_alloc_init(&OBJC_CLASS___UILabel);
    v29 = (void *)*((void *)location + 19);
    *((void *)location + 19) = v49;

    [*((id *)location + 19) setTranslatesAutoresizingMaskIntoConstraints:0];
    v48 = (void *)*((void *)location + 19);
    v47 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1);
    objc_msgSend(v48, "setFont:");

    [v89 addSubview:*((void *)location + 19)];
    v46 = objc_alloc_init(&OBJC_CLASS___TVNPNowPlayingProgressView);
    v30 = (void *)*((void *)location + 20);
    *((void *)location + 20) = v46;

    [*((id *)location + 20) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 20) setHidden:1];
    [v89 addSubview:*((void *)location + 20)];
    v45 = objc_alloc_init(&OBJC_CLASS___TVNPNowPlayingSliderView);
    v31 = (void *)*((void *)location + 21);
    *((void *)location + 21) = v45;

    v44 = (void *)*((void *)location + 21);
    id v43 = [(id)objc_opt_class(location) _volumeImage:1];
    objc_msgSend(v44, "setMinimumValueImage:");

    v42 = (void *)*((void *)location + 21);
    id v41 = [(id)objc_opt_class(location) _volumeImage:0];
    objc_msgSend(v42, "setMaximumValueImage:");

    [*((id *)location + 21) setContinuous:1];
    [*((id *)location + 21) setTranslatesAutoresizingMaskIntoConstraints:0];
    [*((id *)location + 21) addTarget:location action:"volumeSliderValueChanged:" forControlEvents:4096];
    [*((id *)location + 21) setHidden:1];
    [v89 addSubview:*((void *)location + 21)];
    v40 = objc_alloc_init(&OBJC_CLASS___UILayoutGuide);
    v32 = (void *)*((void *)location + 22);
    *((void *)location + 22) = v40;

    [v89 addLayoutGuide:*((void *)location + 22)];
    [location _addInitialConstraints];
    [location _configureAppearanceForControlState:0 withAnimationCoordinator:0];
    objc_initWeak(from, location);
    id v39 = location;
    uint64_t v95 = objc_opt_class(&OBJC_CLASS___UITraitDisplayScale);
    v38 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v95, 1LL);
    v81 = _NSConcreteStackBlock;
    int v82 = -1073741824;
    int v83 = 0;
    v84 = sub_10001BDF8;
    v85 = &unk_100059158;
    objc_copyWeak(&v86, from);
    id v33 = [v39 registerForTraitChanges:v38 withHandler:&v81];

    v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v34 = (void *)*((void *)location + 24);
    *((void *)location + 24) = v37;

    [location setNeedsUpdateConstraints];
    [location updateFocusIfNeeded];
    objc_destroyWeak(&v86);
    objc_destroyWeak(from);
    objc_storeStrong(v88, 0LL);
    objc_storeStrong(&v89, 0LL);
    objc_storeStrong(&v90, 0LL);
  }

  v36 = (TVNPBaseRouteCollectionViewCell *)location;
  objc_storeStrong(&location, 0LL);
  return v36;
}

- (id)preferredFocusEnvironments
{
  if (v2 <= 0.0)
  {
    if (self->_isAccessoryFocused)
    {
      v7[0] = self->_accessoryView;
      v7[1] = self->_routeView;
      v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v7, 2LL);
    }

    else
    {
      v6[0] = self->_routeView;
      v6[1] = self->_accessoryView;
      v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL);
    }
  }

  else
  {
    volumeSliderView = self->_volumeSliderView;
    v5 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &volumeSliderView, 1LL);
  }

  return v5;
}

- (void)prepareForReuse
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCell;
  -[TVNPBaseRouteCollectionViewCell prepareForReuse](&v2, "prepareForReuse");
  -[TVNPBaseRouteCollectionViewCell setCellState:](v4, "setCellState:", 1LL);
  -[TVNPBaseRouteCollectionViewCell setDisplayAsSelected:](v4, "setDisplayAsSelected:", 0LL);
  -[TVNPBaseRouteCollectionViewCell setPendingSelection:](v4, "setPendingSelection:", 0LL);
  -[TVNPRoutingMusicBarsView setState:](v4->_musicBarsView, "setState:", 0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v9 = 0LL;
  objc_storeStrong(&v9, a4);
  v8.receiver = v11;
  v8.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCell;
  -[TVNPBaseRouteCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  location[0],  v9);
  v7 = (TVNPFloatingContentControl *)[location[0] nextFocusedView];
  v11->_isAccessoryFocused = v7 == v11->_accessoryView;
  v11->_isRouteFocused = v7 == v11->_routeView;
  v6 = v11;
  id v4 = -[TVNPBaseRouteCollectionViewCell _controlStateForCell](v11, "_controlStateForCell");
  -[TVNPBaseRouteCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v6,  "_configureAppearanceForControlState:withAnimationCoordinator:",  v4,  v9);
  objc_storeStrong((id *)&v7, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)setHighlighted:(BOOL)a3
{
  v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCell;
  -[TVNPBaseRouteCollectionViewCell setHighlighted:](&v9, "setHighlighted:", a3);
  SEL v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_10001C358;
  v7 = &unk_1000587D8;
  objc_super v8 = v12;
  +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  32LL,  0.12,  0.0);
  objc_storeStrong((id *)&v8, 0LL);
}

- (void)updateConstraints
{
  v128 = self;
  SEL v127 = a2;
  v126.receiver = self;
  v126.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCell;
  -[TVNPBaseRouteCollectionViewCell updateConstraints](&v126, "updateConstraints");
  id v125 = -[TVNPBaseRouteCollectionViewCell contentView](v128, "contentView");
  id v124 = -[TVNPBaseRouteCollectionViewCell routeView](v128, "routeView");
  id v123 = [v124 contentView];
  id v122 = -[TVNPBaseRouteCollectionViewCell accessoryView](v128, "accessoryView");
  id location = [v122 contentView];
  id obj = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[TVNPBaseRouteCollectionViewCell isGroupLeader](v128, "isGroupLeader"))
  {
    id v117 = [v124 leadingAnchor];
    id v116 = [v122 trailingAnchor];
    id v115 = objc_msgSend(v117, "constraintEqualToAnchor:constant:", 20.0);
    v133[0] = v115;
    id v114 = [v124 trailingAnchor];
    id v113 = [v125 trailingAnchor];
    id v112 = objc_msgSend(v114, "constraintEqualToAnchor:");
    v133[1] = v112;
    id v111 = [v124 topAnchor];
    id v110 = [v125 topAnchor];
    id v109 = objc_msgSend(v111, "constraintEqualToAnchor:");
    v133[2] = v109;
    id v108 = [v124 bottomAnchor];
    id v107 = [v125 bottomAnchor];
    id v106 = objc_msgSend(v108, "constraintEqualToAnchor:");
    v133[3] = v106;
    id v105 = [v122 leadingAnchor];
    id v104 = [v125 leadingAnchor];
    id v103 = objc_msgSend(v105, "constraintEqualToAnchor:");
    v133[4] = v103;
    id v102 = [v122 topAnchor];
    id v101 = [v125 topAnchor];
    id v100 = objc_msgSend(v102, "constraintEqualToAnchor:");
    v133[5] = v100;
    id v99 = [v122 bottomAnchor];
    id v98 = [v125 bottomAnchor];
    id v97 = objc_msgSend(v99, "constraintEqualToAnchor:");
    v133[6] = v97;
    id v96 = [v122 widthAnchor];
    id v95 = [v96 constraintEqualToConstant:100.0];
    v133[7] = v95;
    CGRect v94 = -[UIView leadingAnchor](v128->_accessoryBackgroundColorView, "leadingAnchor");
    id v93 = [location leadingAnchor];
    id v92 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v94, "constraintEqualToAnchor:");
    v133[8] = v92;
    objc_super v91 = -[UIView trailingAnchor](v128->_accessoryBackgroundColorView, "trailingAnchor");
    id v90 = [location trailingAnchor];
    id v89 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v91, "constraintEqualToAnchor:");
    v133[9] = v89;
    v88 = -[UIView topAnchor](v128->_accessoryBackgroundColorView, "topAnchor");
    id v87 = [location topAnchor];
    id v86 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v88, "constraintEqualToAnchor:");
    v133[10] = v86;
    v85 = -[UIView bottomAnchor](v128->_accessoryBackgroundColorView, "bottomAnchor");
    id v84 = [location bottomAnchor];
    id v83 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v85, "constraintEqualToAnchor:");
    v133[11] = v83;
    id v82 = -[UIImageView centerYAnchor](v128->_accessoryImageView, "centerYAnchor");
    id v81 = [location centerYAnchor];
    id v80 = objc_msgSend(v82, "constraintEqualToAnchor:");
    v133[12] = v80;
    id v79 = -[UIImageView centerXAnchor](v128->_accessoryImageView, "centerXAnchor");
    id v78 = [location centerXAnchor];
    id v77 = objc_msgSend(v79, "constraintEqualToAnchor:");
    v133[13] = v77;
    v76 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v133, 14LL);
    objc_msgSend(obj, "addObjectsFromArray:");
  }

  else
  {
    id v75 = [v124 leadingAnchor];
    id v74 = [v125 leadingAnchor];
    id v73 = objc_msgSend(v75, "constraintEqualToAnchor:");
    v132[0] = v73;
    id v72 = [v124 trailingAnchor];
    id v71 = [v125 trailingAnchor];
    id v70 = objc_msgSend(v72, "constraintEqualToAnchor:");
    v132[1] = v70;
    id v69 = [v124 topAnchor];
    id v68 = [v125 topAnchor];
    id v67 = objc_msgSend(v69, "constraintEqualToAnchor:");
    v132[2] = v67;
    id v66 = [v124 bottomAnchor];
    id v65 = [v125 bottomAnchor];
    id v64 = objc_msgSend(v66, "constraintEqualToAnchor:");
    v132[3] = v64;
    v63 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v132, 4LL);
    objc_msgSend(obj, "addObjectsFromArray:");
  }

  id v60 = -[TVNPBaseRouteCollectionViewCell subtitleText](v128, "subtitleText");
  BOOL v61 = -[NSString length](v60, "length") != 0;

  BOOL v119 = -[TVNPBaseRouteCollectionViewCell musicBarState](v128, "musicBarState") != 0;
  char v62 = 1;
  if (!v61) {
    char v62 = v119;
  }
  double v2 = 46.0;
  if ((v62 & 1) == 0) {
    double v2 = 64.0;
  }
  double v118 = v2;
  id v59 = -[UILabel firstBaselineAnchor](v128->_titleLabel, "firstBaselineAnchor");
  id v58 = [v123 topAnchor];
  id v57 = objc_msgSend(v59, "constraintEqualToAnchor:constant:", v118);
  objc_msgSend(obj, "addObject:");

  if (v119)
  {
    id v56 = -[UILabel leadingAnchor](v128->_subtitleLabel, "leadingAnchor");
    id v55 = -[TVNPRoutingMusicBarsView trailingAnchor](v128->_musicBarsView, "trailingAnchor");
    id v54 = objc_msgSend(v56, "constraintEqualToAnchor:constant:", 8.0);
    objc_msgSend(obj, "addObject:");
  }

  else
  {
    id v53 = -[UILabel leadingAnchor](v128->_subtitleLabel, "leadingAnchor");
    id v52 = -[UILabel leadingAnchor](v128->_titleLabel, "leadingAnchor");
    id v51 = objc_msgSend(v53, "constraintEqualToAnchor:");
    objc_msgSend(obj, "addObject:");
  }

  if ((id)-[TVNPBaseRouteCollectionViewCell cellState](v128, "cellState") == (id)2)
  {
    id v50 = -[UILabel centerXAnchor](v128->_titleLabel, "centerXAnchor");
    v49 = -[UILayoutGuide centerXAnchor](v128->_layoutGuide, "centerXAnchor");
    id v48 = objc_msgSend(v50, "constraintEqualToAnchor:");
    objc_msgSend(obj, "addObject:");
  }

  else
  {
    id v47 = -[UILabel leadingAnchor](v128->_titleLabel, "leadingAnchor");
    id v46 = -[UIImageView trailingAnchor](v128->_iconView, "trailingAnchor");
    id v45 = objc_msgSend(v47, "constraintEqualToAnchor:constant:", 25.0);
    id v131 = v45;
    v44 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v131, 1LL);
    objc_msgSend(obj, "addObjectsFromArray:");

    if ([(id)objc_opt_class(v128) allowsSelection])
    {
      id v43 = -[UIImageView centerXAnchor](v128->_checkmarkView, "centerXAnchor");
      id v42 = [v123 trailingAnchor];
      id v41 = objc_msgSend(v43, "constraintEqualToAnchor:constant:", -60.0);
      v130[0] = v41;
      id v40 = -[UIImageView centerYAnchor](v128->_checkmarkView, "centerYAnchor");
      id v39 = -[UILayoutGuide centerYAnchor](v128->_layoutGuide, "centerYAnchor");
      id v38 = objc_msgSend(v40, "constraintEqualToAnchor:");
      v130[1] = v38;
      id v37 = -[UILabel trailingAnchor](v128->_titleLabel, "trailingAnchor");
      id v36 = -[UIImageView leadingAnchor](v128->_checkmarkView, "leadingAnchor");
      id v35 = objc_msgSend(v37, "constraintEqualToAnchor:constant:", -30.0);
      v130[2] = v35;
      v34 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v130, 3LL);
      objc_msgSend(obj, "addObjectsFromArray:");
    }

    else
    {
      id v33 = -[UILabel trailingAnchor](v128->_titleLabel, "trailingAnchor");
      id v32 = -[TVNPNowPlayingProgressView leadingAnchor](v128->_volumeProgressView, "leadingAnchor");
      id v31 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", -30.0);
      objc_msgSend(obj, "addObject:");
    }

    if (v128->_volumeLevel)
    {
      id v30 = -[TVNPNowPlayingProgressView leadingAnchor](v128->_volumeProgressView, "leadingAnchor");
      id v29 = -[UILabel trailingAnchor](v128->_titleLabel, "trailingAnchor");
      id v28 = objc_msgSend(v30, "constraintGreaterThanOrEqualToAnchor:constant:", 30.0);
      objc_msgSend(obj, "addObject:");
    }
  }

  if (v128->_volumeLevel || (id)-[TVNPBaseRouteCollectionViewCell cellState](v128, "cellState") == (id)2)
  {
    id v27 = -[TVNPNowPlayingProgressView widthAnchor](v128->_volumeProgressView, "widthAnchor");
    sub_10001BDCC();
    id v26 = [v27 constraintEqualToConstant:v3];
    v129[0] = v26;
    id v25 = -[TVNPNowPlayingProgressView heightAnchor](v128->_volumeProgressView, "heightAnchor");
    sub_10001BDCC();
    id v24 = [v25 constraintEqualToConstant:v4];
    v129[1] = v24;
    id v23 = -[TVNPNowPlayingProgressView centerYAnchor](v128->_volumeProgressView, "centerYAnchor");
    v22 = -[UILayoutGuide centerYAnchor](v128->_layoutGuide, "centerYAnchor");
    id v21 = objc_msgSend(v23, "constraintEqualToAnchor:");
    v129[2] = v21;
    id v20 = -[TVNPNowPlayingSliderView leadingAnchor](v128->_volumeSliderView, "leadingAnchor");
    v19 = -[UILayoutGuide leadingAnchor](v128->_layoutGuide, "leadingAnchor");
    id v18 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", 30.0);
    v129[3] = v18;
    id v17 = -[TVNPNowPlayingSliderView trailingAnchor](v128->_volumeSliderView, "trailingAnchor");
    v16 = -[UILayoutGuide trailingAnchor](v128->_layoutGuide, "trailingAnchor");
    id v15 = objc_msgSend(v17, "constraintEqualToAnchor:constant:", -30.0);
    v129[4] = v15;
    id v14 = -[TVNPNowPlayingSliderView centerYAnchor](v128->_volumeSliderView, "centerYAnchor");
    id v13 = -[UILayoutGuide centerYAnchor](v128->_layoutGuide, "centerYAnchor");
    id v12 = objc_msgSend(v14, "constraintEqualToAnchor:");
    v129[5] = v12;
    SEL v11 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v129, 6LL);
    objc_msgSend(obj, "addObjectsFromArray:");

    if ([(id)objc_opt_class(v128) allowsSelection])
    {
      id v10 = -[TVNPNowPlayingProgressView trailingAnchor](v128->_volumeProgressView, "trailingAnchor");
      id v9 = -[UIImageView centerXAnchor](v128->_checkmarkView, "centerXAnchor");
      id v8 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", -52.5);
      objc_msgSend(obj, "addObject:");
    }

    else
    {
      id v7 = -[TVNPNowPlayingProgressView trailingAnchor](v128->_volumeProgressView, "trailingAnchor");
      id v6 = [v123 trailingAnchor];
      id v5 = objc_msgSend(v7, "constraintEqualToAnchor:constant:", -30.0);
      objc_msgSend(obj, "addObject:");
    }
  }

  if (([obj isEqualToArray:v128->_volatileContraints] & 1) == 0)
  {
    +[NSLayoutConstraint deactivateConstraints:]( &OBJC_CLASS___NSLayoutConstraint,  "deactivateConstraints:",  v128->_volatileContraints);
    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", obj);
    objc_storeStrong((id *)&v128->_volatileContraints, obj);
  }

  objc_storeStrong(&obj, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v122, 0LL);
  objc_storeStrong(&v123, 0LL);
  objc_storeStrong(&v124, 0LL);
  objc_storeStrong(&v125, 0LL);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = [location[0] copy];
  [v7 size];
  -[TVNPBaseRouteCollectionViewCell cellState](v9, "cellState");
  sub_10001BDCC();
  objc_msgSend(v7, "setSize:", v3, v4);
  id v6 = v7;
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v8.receiver = v10;
  v8.super_class = (Class)&OBJC_CLASS___TVNPBaseRouteCollectionViewCell;
  -[TVNPBaseRouteCollectionViewCell applyLayoutAttributes:](&v8, "applyLayoutAttributes:", location[0]);
  id v7 = 0LL;
  id v6 = location[0];
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___TVNPRoutingRoutesCollectionViewLayoutAttributes);
  if ((objc_opt_isKindOfClass(v6, v3) & 1) != 0) {
    id v7 = [location[0] cellState];
  }
  v10->_cellState = (unint64_t)v7;
  id v4 = -[TVNPBaseRouteCollectionViewCell _controlStateForCell](v10, "_controlStateForCell", v10);
  objc_msgSend(v5, "_configureAppearanceForControlState:withAnimationCoordinator:", v4);
  -[TVNPBaseRouteCollectionViewCell setNeedsUpdateConstraints](v10, "setNeedsUpdateConstraints");
  -[TVNPBaseRouteCollectionViewCell setNeedsFocusUpdate](v10, "setNeedsFocusUpdate");
  objc_storeStrong(location, 0LL);
}

- (void)setTitleText:(id)a3
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  uint64_t v3 = (NSString *)[location[0] copy];
  titleText = v6->_titleText;
  v6->_titleText = v3;

  -[UILabel setText:](v6->_titleLabel, "setText:", v6->_titleText);
  objc_storeStrong(location, 0LL);
}

- (void)setSubtitleText:(id)a3
{
  objc_super v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v6 = -[NSString length](v8->_subtitleText, "length") != 0;
  BOOL v5 = [location[0] length] != 0;
  uint64_t v3 = (NSString *)[location[0] copy];
  subtitleText = v8->_subtitleText;
  v8->_subtitleText = v3;

  -[UILabel setText:](v8->_subtitleLabel, "setText:", v8->_subtitleText);
  if (v6 != v5)
  {
    -[TVNPBaseRouteCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( v8,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVNPBaseRouteCollectionViewCell _controlStateForCell](v8, "_controlStateForCell"),  0LL);
    -[TVNPBaseRouteCollectionViewCell setNeedsUpdateConstraints](v8, "setNeedsUpdateConstraints");
  }

  objc_storeStrong(location, 0LL);
}

- (void)setDeviceImage:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] isSymbolImage])
  {
    -[UIImageView setImage:](v4->_symbolImageView, "setImage:", location[0]);
    -[UIImageView setImage:](v4->_iconView, "setImage:", 0LL);
  }

  else
  {
    -[UIImageView setImage:](v4->_iconView, "setImage:", location[0]);
    -[UIImageView setImage:](v4->_symbolImageView, "setImage:", 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setMusicBarState:(unint64_t)a3
{
  BOOL v4 = self->_musicBarState != 0;
  BOOL v3 = a3 != 0;
  self->_musicBarState = a3;
  -[TVNPRoutingMusicBarsView setState:](self->_musicBarsView, "setState:", a3);
  if (v4 != v3) {
    -[TVNPBaseRouteCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setDisplayAsSelected:(BOOL)a3
{
  BOOL v5 = a3;
  if (a3 != self->_displayAsSelected)
  {
    -[UIActivityIndicatorView setAlpha:](self->_pendingSelectView, "setAlpha:", 0.0);
    -[UIActivityIndicatorView stopAnimating](self->_pendingSelectView, "stopAnimating");
    -[UIImageView setAlpha:](self->_checkmarkView, "setAlpha:", 1.0);
    checkmarkView = self->_checkmarkView;
    id v4 = -[TVNPBaseRouteCollectionViewCell _checkmarkImage:](self, "_checkmarkImage:", v5);
    -[UIImageView setImage:](checkmarkView, "setImage:");

    if (self->_volumeLevel) {
      -[TVNPNowPlayingProgressView setHidden:](self->_volumeProgressView, "setHidden:", !v5);
    }
    self->_displayAsSelected = v5;
  }

- (void)setPendingSelection:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 != self->_pendingSelection)
  {
    -[UIImageView setAlpha:](self->_checkmarkView, "setAlpha:", (double)!a3);
    -[UIActivityIndicatorView setAlpha:](self->_pendingSelectView, "setAlpha:", (double)v3);
    -[UIActivityIndicatorView startAnimating](self->_pendingSelectView, "startAnimating");
    self->_pendingSelection = v3;
  }

- (void)setVolumeLevel:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v9->_volumeLevel != location[0]
    && (-[NSNumber isEqual:](v9->_volumeLevel, "isEqual:", location[0]) & 1) == 0)
  {
    BOOL v7 = 1;
    if (v9->_volumeLevel) {
      BOOL v7 = location[0] == 0LL;
    }
    objc_storeStrong((id *)&v9->_volumeLevel, location[0]);
    volumeProgressView = v9->_volumeProgressView;
    [location[0] floatValue];
    -[TVNPNowPlayingProgressView setProgress:](volumeProgressView, "setProgress:");
    volumeSliderView = v9->_volumeSliderView;
    [location[0] floatValue];
    -[TVNPNowPlayingSliderView setValue:](volumeSliderView, "setValue:");
    if (v7 && (id)-[TVNPBaseRouteCollectionViewCell cellState](v9, "cellState") != (id)2)
    {
      -[TVNPNowPlayingProgressView setHidden:](v9->_volumeProgressView, "setHidden:", v9->_volumeLevel == 0LL);
      -[TVNPNowPlayingSliderView setHidden:](v9->_volumeSliderView, "setHidden:", v9->_volumeLevel == 0LL);
      -[TVNPNowPlayingSliderView setAlpha:](v9->_volumeSliderView, "setAlpha:", 0.0);
      id v4 = v9->_volumeSliderView;
      sub_10001BDCC();
      -[TVNPNowPlayingSliderView setMaxBarWidth:](v4, "setMaxBarWidth:", v3);
      -[TVNPNowPlayingSliderView setEnabled:](v9->_volumeSliderView, "setEnabled:", 1LL);
      -[TVNPBaseRouteCollectionViewCell setNeedsUpdateConstraints](v9, "setNeedsUpdateConstraints");
    }
  }

  objc_storeStrong(location, 0LL);
}

- (void)setAllowsGrouping:(BOOL)a3
{
  if (a3 != self->_allowsGrouping)
  {
    self->_allowsGrouping = a3;
    -[TVNPBaseRouteCollectionViewCell _configureAppearanceForControlState:withAnimationCoordinator:]( self,  "_configureAppearanceForControlState:withAnimationCoordinator:",  -[TVNPBaseRouteCollectionViewCell _controlStateForCell](self, "_controlStateForCell"),  0LL);
  }

- (void)setGroupLeader:(BOOL)a3
{
  if (a3 != self->_groupLeader)
  {
    self->_groupLeader = a3;
    -[TVNPBaseRouteCollectionViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }

- (void)volumeSliderValueChanged:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

  ;
}

  ;
}

+ (void)_configureFloatingContentViewAppearance
{
  double v3 = (dispatch_once_t *)&unk_10006AFD0;
  id location = 0LL;
  objc_storeStrong(&location, &stru_100059178);
  if (*v3 != -1) {
    dispatch_once(v3, location);
  }
  objc_storeStrong(&location, 0LL);
}

- (void)_addInitialConstraints
{
  id v79 = self;
  v78[1] = (id)a2;
  v78[0] = -[TVNPBaseRouteCollectionViewCell routeView](self, "routeView");
  id v77 = [v78[0] contentView];
  id v75 = -[UILayoutGuide leadingAnchor](v79->_layoutGuide, "leadingAnchor");
  id v74 = [v77 leadingAnchor];
  id v73 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v75, "constraintEqualToAnchor:");
  v81[0] = v73;
  id v72 = -[UILayoutGuide trailingAnchor](v79->_layoutGuide, "trailingAnchor");
  id v71 = [v77 trailingAnchor];
  id v70 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v72, "constraintEqualToAnchor:");
  v81[1] = v70;
  id v69 = -[UILayoutGuide bottomAnchor](v79->_layoutGuide, "bottomAnchor");
  id v68 = [v77 bottomAnchor];
  id v67 = -[NSLayoutYAxisAnchor constraintLessThanOrEqualToAnchor:](v69, "constraintLessThanOrEqualToAnchor:");
  v81[2] = v67;
  id v66 = -[UILayoutGuide heightAnchor](v79->_layoutGuide, "heightAnchor");
  id v65 = -[NSLayoutDimension constraintEqualToConstant:](v66, "constraintEqualToConstant:", 103.0);
  v81[3] = v65;
  id v64 = -[UIView leadingAnchor](v79->_backgroundColorView, "leadingAnchor");
  id v63 = [v77 leadingAnchor];
  id v62 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v64, "constraintEqualToAnchor:");
  v81[4] = v62;
  BOOL v61 = -[UIView trailingAnchor](v79->_backgroundColorView, "trailingAnchor");
  id v60 = [v77 trailingAnchor];
  id v59 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v61, "constraintEqualToAnchor:");
  v81[5] = v59;
  id v58 = -[UIView topAnchor](v79->_backgroundColorView, "topAnchor");
  id v57 = [v77 topAnchor];
  id v56 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v58, "constraintEqualToAnchor:");
  v81[6] = v56;
  id v55 = -[UIView bottomAnchor](v79->_backgroundColorView, "bottomAnchor");
  id v54 = [v77 bottomAnchor];
  id v53 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v55, "constraintEqualToAnchor:");
  v81[7] = v53;
  id v52 = -[UIImageView leadingAnchor](v79->_iconView, "leadingAnchor");
  id v51 = -[UILayoutGuide leadingAnchor](v79->_layoutGuide, "leadingAnchor");
  id v50 = objc_msgSend(v52, "constraintEqualToAnchor:constant:");
  v81[8] = v50;
  id v49 = -[UIImageView centerYAnchor](v79->_iconView, "centerYAnchor");
  id v48 = -[UILayoutGuide centerYAnchor](v79->_layoutGuide, "centerYAnchor");
  id v47 = objc_msgSend(v49, "constraintEqualToAnchor:");
  v81[9] = v47;
  id v46 = -[UIImageView widthAnchor](v79->_iconView, "widthAnchor");
  sub_10001BDCC();
  id v45 = [v46 constraintEqualToConstant:v2];
  v81[10] = v45;
  id v44 = -[UIImageView heightAnchor](v79->_iconView, "heightAnchor");
  sub_10001BDCC();
  id v43 = [v44 constraintEqualToConstant:v3];
  v81[11] = v43;
  id v42 = -[UIImageView centerYAnchor](v79->_symbolImageView, "centerYAnchor");
  id v41 = -[UILayoutGuide centerYAnchor](v79->_layoutGuide, "centerYAnchor");
  id v40 = objc_msgSend(v42, "constraintEqualToAnchor:");
  v81[12] = v40;
  id v39 = -[UIImageView centerXAnchor](v79->_symbolImageView, "centerXAnchor");
  id v38 = -[UIImageView centerXAnchor](v79->_iconView, "centerXAnchor");
  id v37 = objc_msgSend(v39, "constraintEqualToAnchor:");
  v81[13] = v37;
  id v36 = -[UILabel trailingAnchor](v79->_subtitleLabel, "trailingAnchor");
  id v35 = -[UILabel trailingAnchor](v79->_titleLabel, "trailingAnchor");
  id v34 = objc_msgSend(v36, "constraintEqualToAnchor:");
  v81[14] = v34;
  id v33 = -[UILabel firstBaselineAnchor](v79->_subtitleLabel, "firstBaselineAnchor");
  id v32 = -[UILabel lastBaselineAnchor](v79->_titleLabel, "lastBaselineAnchor");
  id v31 = objc_msgSend(v33, "constraintEqualToAnchor:constant:", 36.0);
  v81[15] = v31;
  id v30 = -[TVNPRoutingMusicBarsView leadingAnchor](v79->_musicBarsView, "leadingAnchor");
  id v29 = -[UIImageView trailingAnchor](v79->_iconView, "trailingAnchor");
  id v28 = objc_msgSend(v30, "constraintEqualToAnchor:constant:", 30.0);
  v81[16] = v28;
  id v27 = -[TVNPRoutingMusicBarsView bottomAnchor](v79->_musicBarsView, "bottomAnchor");
  id v26 = -[UILabel firstBaselineAnchor](v79->_subtitleLabel, "firstBaselineAnchor");
  id v25 = objc_msgSend(v27, "constraintEqualToAnchor:");
  v81[17] = v25;
  id v24 = -[TVNPRoutingMusicBarsView widthAnchor](v79->_musicBarsView, "widthAnchor");
  sub_10001BDCC();
  id v23 = [v24 constraintEqualToConstant:v4];
  v81[18] = v23;
  id v22 = -[TVNPRoutingMusicBarsView heightAnchor](v79->_musicBarsView, "heightAnchor");
  sub_10001BDCC();
  id v21 = [v22 constraintEqualToConstant:v5];
  v81[19] = v21;
  id v20 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v81, 20LL);
  v76 = +[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:");

  if ([(id)objc_opt_class(v79) allowsSelection])
  {
    id v19 = -[UIActivityIndicatorView centerYAnchor](v79->_pendingSelectView, "centerYAnchor");
    id v18 = -[UIImageView centerYAnchor](v79->_checkmarkView, "centerYAnchor");
    id v17 = objc_msgSend(v19, "constraintEqualToAnchor:");
    v80[0] = v17;
    id v16 = -[UIActivityIndicatorView centerXAnchor](v79->_pendingSelectView, "centerXAnchor");
    id v15 = -[UIImageView centerXAnchor](v79->_checkmarkView, "centerXAnchor");
    id v14 = objc_msgSend(v16, "constraintEqualToAnchor:");
    v80[1] = v14;
    id v13 = -[UIActivityIndicatorView widthAnchor](v79->_pendingSelectView, "widthAnchor");
    id v12 = -[UIImageView widthAnchor](v79->_checkmarkView, "widthAnchor");
    id v11 = objc_msgSend(v13, "constraintEqualToAnchor:");
    v80[2] = v11;
    id v10 = -[UIActivityIndicatorView heightAnchor](v79->_pendingSelectView, "heightAnchor");
    id v9 = -[UIImageView heightAnchor](v79->_checkmarkView, "heightAnchor");
    id v8 = objc_msgSend(v10, "constraintEqualToAnchor:");
    v80[3] = v8;
    BOOL v7 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v80, 4LL);
    -[NSMutableArray addObjectsFromArray:](v76, "addObjectsFromArray:");
  }

  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v76, &v76);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v77, 0LL);
  objc_storeStrong(v78, 0LL);
}

- (unint64_t)_controlStateForCell
{
  uint64_t v7 = 0LL;
  if ((id)-[TVNPBaseRouteCollectionViewCell cellState](self, "cellState") == (id)2) {
    uint64_t v7 = qword_10006AB88;
  }
  unint64_t v2 = -[TVNPBaseRouteCollectionViewCell cellState](self, "cellState");
  uint64_t v3 = 0LL;
  if (!v2) {
    uint64_t v3 = 2LL;
  }
  uint64_t v8 = v7 | v3;
  unsigned __int8 v4 = -[TVNPBaseRouteCollectionViewCell isSelected](self, "isSelected");
  uint64_t v5 = 0LL;
  if ((v4 & 1) != 0) {
    uint64_t v5 = 4LL;
  }
  return v8 | v5 | ((-[TVNPBaseRouteCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0);
}

- (void)_configureAppearanceForControlState:(unint64_t)a3 withAnimationCoordinator:(id)a4
{
  id v37 = self;
  SEL v36 = a2;
  unint64_t v35 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  id v39 = (dispatch_once_t *)&unk_10006B008;
  id v38 = 0LL;
  objc_storeStrong(&v38, &stru_100059198);
  if (*v39 != -1) {
    dispatch_once(v39, v38);
  }
  objc_storeStrong(&v38, 0LL);
  BOOL v33 = (v35 & qword_10006AB88) != 0;
  BOOL v10 = 0;
  if (v37->_isRouteFocused) {
    BOOL v10 = !v33;
  }
  BOOL v32 = v10;
  BOOL v9 = 0;
  if (v37->_isAccessoryFocused) {
    BOOL v9 = !v33;
  }
  BOOL v31 = v9;
  BOOL v30 = (v35 & 2) != 0;
  char v29 = -[TVNPBaseRouteCollectionViewCell displayAsSelected](v37, "displayAsSelected");
  char v28 = -[TVNPBaseRouteCollectionViewCell pendingSelection](v37, "pendingSelection");
  char v27 = -[TVNPBaseRouteCollectionViewCell shareAudio](v37, "shareAudio");
  id v13 = _NSConcreteStackBlock;
  int v14 = -1073741824;
  int v15 = 0;
  id v16 = sub_10001FC6C;
  id v17 = &unk_1000591C0;
  id v18 = v37;
  BOOL v19 = v32;
  char v20 = v29 & 1;
  BOOL v21 = v30;
  BOOL v22 = v33;
  char v23 = v27 & 1;
  char v24 = v28 & 1;
  BOOL v25 = v31;
  id v26 = objc_retainBlock(&v13);
  if (location)
  {
    if (v37->_isRouteFocused)
    {
      -[TVNPFloatingContentControl setControlState:withAnimationCoordinator:]( v37->_accessoryView,  "setControlState:withAnimationCoordinator:",  v35,  location);
      routeView = v37->_routeView;
      v35 |= 8uLL;
      -[TVNPFloatingContentControl setControlState:withAnimationCoordinator:]( routeView,  "setControlState:withAnimationCoordinator:");
    }

    else if (v37->_isAccessoryFocused)
    {
      -[TVNPFloatingContentControl setControlState:withAnimationCoordinator:]( v37->_routeView,  "setControlState:withAnimationCoordinator:",  v35,  location);
      accessoryView = v37->_accessoryView;
      v35 |= 8uLL;
      -[TVNPFloatingContentControl setControlState:withAnimationCoordinator:]( accessoryView,  "setControlState:withAnimationCoordinator:");
    }

    else
    {
      -[TVNPFloatingContentControl setControlState:withAnimationCoordinator:]( v37->_routeView,  "setControlState:withAnimationCoordinator:",  v35,  location);
      -[TVNPFloatingContentControl setControlState:withAnimationCoordinator:]( v37->_accessoryView,  "setControlState:withAnimationCoordinator:",  v35,  location);
    }

    [location addCoordinatedAnimations:v26 completion:0];
  }

  else
  {
    if (v37->_isRouteFocused)
    {
      -[TVNPFloatingContentControl setControlState:animated:]( v37->_accessoryView,  "setControlState:animated:",  v35,  0LL);
      BOOL v6 = v37->_routeView;
      v35 |= 8uLL;
      -[TVNPFloatingContentControl setControlState:animated:](v6, "setControlState:animated:");
    }

    else if (v37->_isAccessoryFocused)
    {
      -[TVNPFloatingContentControl setControlState:animated:](v37->_routeView, "setControlState:animated:", v35, 0LL);
      uint64_t v7 = v37->_accessoryView;
      v35 |= 8uLL;
      -[TVNPFloatingContentControl setControlState:animated:](v7, "setControlState:animated:");
    }

    else
    {
      -[TVNPFloatingContentControl setControlState:animated:](v37->_routeView, "setControlState:animated:", v35, 0LL);
      -[TVNPFloatingContentControl setControlState:animated:]( v37->_accessoryView,  "setControlState:animated:",  v35,  0LL);
    }

    (*((void (**)(void))v26 + 2))();
  }

  char v11 = 0;
  BOOL v8 = 0;
  if (v32)
  {
    id v12 = -[UILabel text](v37->_subtitleLabel, "text");
    char v11 = 1;
    BOOL v8 = -[NSString length](v12, "length") != 0;
  }

  if ((v11 & 1) != 0) {

  }
  -[UILabel setMarqueeEnabled:](v37->_subtitleLabel, "setMarqueeEnabled:", v8);
  -[UILabel setMarqueeRunning:](v37->_subtitleLabel, "setMarqueeRunning:", v8);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong((id *)&v18, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (id)_checkmarkImage:(BOOL)a3
{
  BOOL v19 = self;
  SEL v18 = a2;
  BOOL v17 = a3;
  id v16 = 0LL;
  if (self->_allowsGrouping)
  {
    if (v17) {
      uint64_t v3 = @"checkmark.circle.fill";
    }
    else {
      uint64_t v3 = @"circle";
    }
    int v15 = v3;
    id v12 = v15;
    int v14 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    id v13 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    id v4 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  v12);
    id v5 = v16;
    id v16 = v4;

    objc_storeStrong((id *)&v15, 0LL);
  }

  else if (v17)
  {
    char v11 =  +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleHeadline);
    BOOL v10 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:");
    id v6 =  +[UIImage systemImageNamed:withConfiguration:]( &OBJC_CLASS___UIImage,  "systemImageNamed:withConfiguration:",  @"checkmark");
    id v7 = v16;
    id v16 = v6;
  }

  id v9 = v16;
  objc_storeStrong(&v16, 0LL);
  return v9;
}

+ (id)_volumeImage:(BOOL)a3
{
  id v9 = a1;
  SEL v8 = a2;
  BOOL v7 = a3;
  if (a3) {
    uint64_t v3 = @"speaker.fill";
  }
  else {
    uint64_t v3 = @"speaker.wave.3.fill";
  }
  id v6 = v3;
  id v5 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v6);
  objc_storeStrong((id *)&v6, 0LL);
  return v5;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (BOOL)allowsGrouping
{
  return self->_allowsGrouping;
}

- (BOOL)shareAudio
{
  return self->_shareAudio;
}

- (void)setShareAudio:(BOOL)a3
{
  self->_shareAudio = a3;
}

- (BOOL)isGroupLeader
{
  return self->_groupLeader;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (BOOL)displayAsSelected
{
  return self->_displayAsSelected;
}

- (BOOL)pendingSelection
{
  return self->_pendingSelection;
}

- (unint64_t)musicBarState
{
  return self->_musicBarState;
}

- (NSNumber)volumeLevel
{
  return self->_volumeLevel;
}

- (TVNPFloatingContentControl)accessoryView
{
  return self->_accessoryView;
}

- (UIView)accessoryBackgroundColorView
{
  return self->_accessoryBackgroundColorView;
}

- (UIImageView)accessoryImageView
{
  return self->_accessoryImageView;
}

- (TVNPFloatingContentControl)routeView
{
  return self->_routeView;
}

- (UIView)backgroundColorView
{
  return self->_backgroundColorView;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (UIImageView)checkmarkView
{
  return self->_checkmarkView;
}

- (UIActivityIndicatorView)pendingSelectView
{
  return self->_pendingSelectView;
}

- (TVNPRoutingMusicBarsView)musicBarsView
{
  return self->_musicBarsView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (TVNPNowPlayingProgressView)volumeProgressView
{
  return self->_volumeProgressView;
}

- (TVNPNowPlayingSliderView)volumeSliderView
{
  return self->_volumeSliderView;
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (unint64_t)cellState
{
  return self->_cellState;
}

- (void)setCellState:(unint64_t)a3
{
  self->_cellState = a3;
}

- (NSMutableArray)volatileContraints
{
  return self->_volatileContraints;
}

- (void).cxx_destruct
{
}

@end