@interface TVSSShareAudioBringCloseRenderer
+ (id)rendererWithIdentifier:(id)a3;
- (BOOL)isFocusable;
- (BOOL)wantsFloatingContentView;
- (NSArray)cycleImageArray;
- (OS_dispatch_source)cycleImageTimer;
- (TVSSShareAudioBringCloseRenderer)initWithIdentifier:(id)a3;
- (UIImageView)cycleImageView;
- (UILabel)descriptionLabel;
- (UIView)imageContainerView;
- (unsigned)cycleNextIndex;
- (void)_cycleHeadphoneImages;
- (void)configureContentView:(id)a3;
- (void)setCycleImageArray:(id)a3;
- (void)setCycleImageTimer:(id)a3;
- (void)setCycleImageView:(id)a3;
- (void)setCycleNextIndex:(unsigned int)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setImageContainerView:(id)a3;
@end

@implementation TVSSShareAudioBringCloseRenderer

+ (id)rendererWithIdentifier:(id)a3
{
  Class v7 = (Class)a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc(v7);
  id v5 = [v3 initWithIdentifier:location[0]];
  objc_storeStrong(location, 0LL);
  return v5;
}

- (TVSSShareAudioBringCloseRenderer)initWithIdentifier:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = v20;
  v20 = 0LL;
  v18.receiver = v3;
  v18.super_class = (Class)&OBJC_CLASS___TVSSShareAudioBringCloseRenderer;
  v20 = -[TVSSShareAudioBringCloseRenderer initWithIdentifier:format:content:overrideStylings:]( &v18,  "initWithIdentifier:format:content:overrideStylings:",  location[0],  1LL,  0LL,  &__NSArray0__struct);
  objc_storeStrong((id *)&v20, v20);
  if (v20)
  {
    v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v16 = &off_1001C86D8;
    memset(__b, 0, sizeof(__b));
    id obj = v16;
    id v12 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0LL;
      id v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(__b[1] + 8 * v9);
        id v13 = +[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v15);
        -[NSMutableArray addObject:](v17, "addObject:", v13);
        objc_storeStrong(&v13, 0LL);
        ++v9;
        if (v7 + 1 >= (unint64_t)v10)
        {
          uint64_t v9 = 0LL;
          id v10 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    id v6 = -[NSMutableArray copy](v17, "copy");
    -[TVSSShareAudioBringCloseRenderer setCycleImageArray:](v20, "setCycleImageArray:");

    objc_storeStrong(&v16, 0LL);
    objc_storeStrong((id *)&v17, 0LL);
  }

  id v5 = v20;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v20, 0LL);
  return v5;
}

- (BOOL)isFocusable
{
  return 0;
}

- (BOOL)wantsFloatingContentView
{
  return 0;
}

- (void)configureContentView:(id)a3
{
  v80 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v78.receiver = v80;
  v78.super_class = (Class)&OBJC_CLASS___TVSSShareAudioBringCloseRenderer;
  -[TVSSShareAudioBringCloseRenderer configureContentView:](&v78, "configureContentView:", location[0]);
  id v58 = [location[0] layer];
  [v58 setAllowsGroupBlending:0];

  id v59 = +[UITraitCollection _tvspMainSceneTraits](&OBJC_CLASS___UITraitCollection, "_tvspMainSceneTraits");
  BOOL v60 = [v59 userInterfaceStyle] == (id)2;

  BOOL v77 = v60;
  if (v60) {
    uint64_t v57 = kCAFilterPlusL;
  }
  else {
    uint64_t v57 = kCAFilterPlusD;
  }
  v76 = +[CAFilter filterWithType:](&OBJC_CLASS___CAFilter, "filterWithType:", v57);
  uint64_t v15 = objc_alloc(&OBJC_CLASS___UIView);
  [location[0] bounds];
  v74[1] = v3;
  v74[2] = v4;
  v74[3] = v5;
  v74[4] = v6;
  v75 = -[UIView initWithFrame:](v15, "initWithFrame:", *(double *)&v3, *(double *)&v4, *(double *)&v5, *(double *)&v6);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v75, "setTranslatesAutoresizingMaskIntoConstraints:", 0LL);
  [location[0] addSubview:v75];
  id v16 = v76;
  v17 = -[UIView layer](v75, "layer");
  -[CALayer setCompositingFilter:](v17, "setCompositingFilter:", v16);

  -[TVSSShareAudioBringCloseRenderer setImageContainerView:](v80, "setImageContainerView:", v75);
  v74[0] = +[CAGradientLayer layer](&OBJC_CLASS___CAGradientLayer, "layer");
  objc_super v18 = -[TVSSShareAudioBringCloseRenderer imageContainerView](v80, "imageContainerView");
  -[UIView bounds](v18, "bounds");
  *(double *)&__int128 v72 = v7;
  *((double *)&v72 + 1) = v8;
  *(double *)&__int128 v73 = v9;
  *((double *)&v73 + 1) = v10;
  __int128 v70 = v72;
  __int128 v71 = v73;
  objc_msgSend(v74[0], "setFrame:", v7, v8, v9, v10);

  v23 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v82[0] = -[UIColor CGColor](v23, "CGColor");
  v22 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v82[1] = -[UIColor CGColor](v22, "CGColor");
  v21 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 1.0);
  v82[2] = -[UIColor CGColor](v21, "CGColor");
  v20 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0);
  v82[3] = -[UIColor CGColor](v20, "CGColor");
  v19 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v82);
  objc_msgSend(v74[0], "setColors:");

  [v74[0] setLocations:&off_1001C86F0];
  sub_1000A8480();
  *(double *)&__int128 v69 = v11;
  *((double *)&v69 + 1) = v12;
  __int128 v68 = v69;
  objc_msgSend(v74[0], "setStartPoint:", v11, v12);
  sub_1000A8480();
  *(double *)&__int128 v67 = v13;
  *((double *)&v67 + 1) = v14;
  __int128 v66 = v67;
  objc_msgSend(v74[0], "setEndPoint:", v13, v14);
  id v24 = v74[0];
  v26 = -[TVSSShareAudioBringCloseRenderer imageContainerView](v80, "imageContainerView");
  v25 = -[UIView layer](v26, "layer");
  -[CALayer setMask:](v25, "setMask:", v24);

  id v65 =  +[UIImageSymbolConfiguration configurationPreferringMonochrome]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationPreferringMonochrome");
  v64 = +[TVSSConstants extraLargeGlyphFont](&OBJC_CLASS___TVSSConstants, "extraLargeGlyphFont");
  v63 =  +[UIImageSymbolConfiguration configurationWithFont:scale:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithFont:scale:",  v64,  3LL);
  id v62 = [v65 configurationByApplyingConfiguration:v63];
  v61 = objc_alloc_init(&OBJC_CLASS___UIImageView);
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v61,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
  id v27 = +[UIColor systemGray3Color](&OBJC_CLASS___UIColor, "systemGray3Color");
  -[UIImageView setTintColor:](v61, "setTintColor:");

  v29 = -[TVSSShareAudioBringCloseRenderer cycleImageArray](v80, "cycleImageArray");
  id v28 = -[NSArray firstObject](v29, "firstObject");
  -[UIImageView setImage:](v61, "setImage:");

  -[UIImageView setContentMode:](v61, "setContentMode:", 4LL);
  -[UIImageView setPreferredSymbolConfiguration:](v61, "setPreferredSymbolConfiguration:", v62);
  -[UIView addSubview:](v75, "addSubview:", v61);
  -[TVSSShareAudioBringCloseRenderer setCycleImageView:](v80, "setCycleImageView:", v61);
  v56 = -[UIView leadingAnchor](v75, "leadingAnchor");
  id v55 = [location[0] leadingAnchor];
  id v54 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v56, "constraintEqualToAnchor:");
  v81[0] = v54;
  v53 = -[UIView trailingAnchor](v75, "trailingAnchor");
  id v52 = [location[0] trailingAnchor];
  id v51 = -[NSLayoutXAxisAnchor constraintEqualToAnchor:](v53, "constraintEqualToAnchor:");
  v81[1] = v51;
  v50 = -[UIView topAnchor](v75, "topAnchor");
  id v49 = [location[0] topAnchor];
  id v48 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v50, "constraintEqualToAnchor:");
  v81[2] = v48;
  v47 = -[UIView bottomAnchor](v75, "bottomAnchor");
  id v46 = [location[0] bottomAnchor];
  id v45 = -[NSLayoutYAxisAnchor constraintEqualToAnchor:](v47, "constraintEqualToAnchor:");
  v81[3] = v45;
  id v44 = -[UIImageView leadingAnchor](v61, "leadingAnchor");
  v43 = -[UIView leadingAnchor](v75, "leadingAnchor");
  id v42 = objc_msgSend(v44, "constraintEqualToAnchor:");
  v81[4] = v42;
  id v41 = -[UIImageView trailingAnchor](v61, "trailingAnchor");
  v40 = -[UIView trailingAnchor](v75, "trailingAnchor");
  id v39 = objc_msgSend(v41, "constraintEqualToAnchor:");
  v81[5] = v39;
  id v38 = -[UIImageView centerXAnchor](v61, "centerXAnchor");
  v37 = -[UIView centerXAnchor](v75, "centerXAnchor");
  id v36 = objc_msgSend(v38, "constraintEqualToAnchor:");
  v81[6] = v36;
  id v35 = -[UIImageView centerYAnchor](v61, "centerYAnchor");
  v34 = -[UIView centerYAnchor](v75, "centerYAnchor");
  id v33 = objc_msgSend(v35, "constraintEqualToAnchor:");
  v81[7] = v33;
  id v32 = -[UIImageView heightAnchor](v61, "heightAnchor");
  id v31 = [v32 constraintEqualToConstant:143.0];
  v81[8] = v31;
  v30 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v81, 9LL);
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:");

  -[TVSSShareAudioBringCloseRenderer _cycleHeadphoneImages](v80, "_cycleHeadphoneImages");
  objc_storeStrong((id *)&v61, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong((id *)&v63, 0LL);
  objc_storeStrong((id *)&v64, 0LL);
  objc_storeStrong(&v65, 0LL);
  objc_storeStrong(v74, 0LL);
  objc_storeStrong((id *)&v75, 0LL);
  objc_storeStrong((id *)&v76, 0LL);
  objc_storeStrong(location, 0LL);
}

  ;
}

- (void)_cycleHeadphoneImages
{
  id v27 = self;
  v26[1] = (id)a2;
  objc_super v18 = -[TVSSShareAudioBringCloseRenderer cycleImageTimer](self, "cycleImageTimer");

  if (v18)
  {
    v26[0] = +[CATransition animation](&OBJC_CLASS___CATransition, "animation");
    [v26[0] setDuration:0.5];
    [v26[0] setType:kCATransitionPush];
    [v26[0] setSubtype:kCATransitionFromRight];
    id v14 = v26[0];
    uint64_t v15 =  +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionEaseInEaseOut);
    objc_msgSend(v14, "setTimingFunction:");

    v17 = -[TVSSShareAudioBringCloseRenderer cycleImageView](v27, "cycleImageView");
    id v16 = -[UIImageView layer](v17, "layer");
    objc_msgSend(v16, "addAnimation:forKey:", v26[0]);

    objc_storeStrong(v26, 0LL);
  }

  else
  {
    double v12 = &_dispatch_main_q;
    dispatch_source_t v25 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v12);

    -[TVSSShareAudioBringCloseRenderer setCycleImageTimer:](v27, "setCycleImageTimer:", v25);
    source = v25;
    v19 = _NSConcreteStackBlock;
    int v20 = -1073741824;
    int v21 = 0;
    v22 = sub_1000A887C;
    v23 = &unk_1001B5A60;
    id v24 = v27;
    dispatch_source_set_event_handler(source, &v19);
    CUDispatchTimerSet(v25, 3.0, 3.0, 0.01);
    dispatch_activate(v25);
    objc_storeStrong((id *)&v24, 0LL);
    objc_storeStrong((id *)&v25, 0LL);
  }

  unint64_t v9 = -[TVSSShareAudioBringCloseRenderer cycleNextIndex](v27, "cycleNextIndex");
  double v10 = -[TVSSShareAudioBringCloseRenderer cycleImageArray](v27, "cycleImageArray");
  BOOL v11 = v9 >= -[NSArray count](v10, "count");

  if (!v11)
  {
    id v6 = -[TVSSShareAudioBringCloseRenderer cycleImageArray](v27, "cycleImageArray");
    v2 = v27;
    unsigned int v3 = -[TVSSShareAudioBringCloseRenderer cycleNextIndex](v27, "cycleNextIndex");
    -[TVSSShareAudioBringCloseRenderer setCycleNextIndex:](v2, "setCycleNextIndex:", v3 + 1);
    id v5 = -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", v3);
    v4 = -[TVSSShareAudioBringCloseRenderer cycleImageView](v27, "cycleImageView");
    -[UIImageView setImage:](v4, "setImage:", v5);

    double v7 = v27;
    double v8 = -[TVSSShareAudioBringCloseRenderer cycleImageArray](v27, "cycleImageArray");
    -[TVSSShareAudioBringCloseRenderer setCycleNextIndex:]( v7,  "setCycleNextIndex:",  -[TVSSShareAudioBringCloseRenderer cycleNextIndex](v7, "cycleNextIndex") % -[NSArray count](v8, "count"));
  }

- (NSArray)cycleImageArray
{
  return self->_cycleImageArray;
}

- (void)setCycleImageArray:(id)a3
{
}

- (OS_dispatch_source)cycleImageTimer
{
  return self->_cycleImageTimer;
}

- (void)setCycleImageTimer:(id)a3
{
}

- (unsigned)cycleNextIndex
{
  return self->_cycleNextIndex;
}

- (void)setCycleNextIndex:(unsigned int)a3
{
  self->_cycleNextIndex = a3;
}

- (UIView)imageContainerView
{
  return self->_imageContainerView;
}

- (void)setImageContainerView:(id)a3
{
}

- (UIImageView)cycleImageView
{
  return self->_cycleImageView;
}

- (void)setCycleImageView:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end