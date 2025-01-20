@interface TVMusicPlaylistLockupViewCell
+ (id)playlistViewFromElement:(id)a3 existingView:(id)a4;
- (BOOL)canBecomeFocused;
- (BOOL)createdImageViews;
- (CALayer)titleGradientLayer;
- (CGRect)_scaleRect:(CGRect)a3 withStyle:(id)a4;
- (NSArray)imageViews;
- (NSString)playlistID;
- (TVImageView)titleBackgroundImageView;
- (TVMusicPlaylistLockupViewCell)initWithFrame:(CGRect)a3;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIView)titleBlockView;
- (_UIFloatingContentView)floatingView;
- (id)_randomColor;
- (void)_configureLabel:(id)a3 withTextElement:(id)a4 maxWidth:(double)a5;
- (void)_setColorsForUserInterfaceStyle:(int64_t)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)layoutWithElement:(id)a3;
- (void)prepareForReuse;
- (void)setCreatedImageViews:(BOOL)a3;
- (void)setFloatingView:(id)a3;
- (void)setImageViews:(id)a3;
- (void)setPlaylistID:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleBackgroundImageView:(id)a3;
- (void)setTitleBlockView:(id)a3;
- (void)setTitleGradientLayer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVMusicPlaylistLockupViewCell

+ (id)playlistViewFromElement:(id)a3 existingView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v9 = objc_opt_class(a1, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
    v10 = (TVMusicPlaylistLockupViewCell *)v7;
  }
  else {
    v10 = -[TVMusicPlaylistLockupViewCell initWithFrame:]( objc_alloc(&OBJC_CLASS___TVMusicPlaylistLockupViewCell),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  }
  v11 = v10;
  -[TVMusicPlaylistLockupViewCell layoutWithElement:](v10, "layoutWithElement:", v6);

  return v11;
}

- (TVMusicPlaylistLockupViewCell)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___TVMusicPlaylistLockupViewCell;
  v3 = -[TVMusicPlaylistLockupViewCell initWithFrame:]( &v36,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TVMusicPlaylistLockupViewCell setOpaque:](v3, "setOpaque:", 0LL);
    v5 = objc_alloc(&OBJC_CLASS____UIFloatingContentView);
    -[TVMusicPlaylistLockupViewCell bounds](v4, "bounds");
    id v6 = -[_UIFloatingContentView initWithFrame:](v5, "initWithFrame:");
    floatingView = v4->_floatingView;
    v4->_floatingView = v6;

    -[_UIFloatingContentView setHighlightStyle:](v4->_floatingView, "setHighlightStyle:", 1LL);
    -[_UIFloatingContentView setCornerRadius:](v4->_floatingView, "setCornerRadius:", 12.0);
    -[_UIFloatingContentView setContentMotionRotation:translation:]( v4->_floatingView,  "setContentMotionRotation:translation:",  0.036,  0.036,  10.0,  10.0);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaylistLockupViewCell traitCollection](v4, "traitCollection"));
    -[TVMusicPlaylistLockupViewCell _setColorsForUserInterfaceStyle:]( v4,  "_setColorsForUserInterfaceStyle:",  [v8 userInterfaceStyle]);

    -[TVMusicPlaylistLockupViewCell addSubview:](v4, "addSubview:", v4->_floatingView);
    uint64_t v9 = -[UIView initWithFrame:](objc_alloc(&OBJC_CLASS___UIView), "initWithFrame:", 28.0, 30.0, 310.0, 310.0);
    titleBlockView = v4->_titleBlockView;
    v4->_titleBlockView = v9;

    -[UIView _setContinuousCornerRadius:](v4->_titleBlockView, "_setContinuousCornerRadius:", 6.0);
    -[UIView setClipsToBounds:](v4->_titleBlockView, "setClipsToBounds:", 1LL);
    v11 = v4->_titleBlockView;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor darkGrayColor](&OBJC_CLASS___UIColor, "darkGrayColor"));
    -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);

    v13 = -[UILabel initWithFrame:](objc_alloc(&OBJC_CLASS___UILabel), "initWithFrame:", 36.0, 20.0, 238.0, 180.0);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v13;

    -[UILabel setAutoresizingMask:](v4->_titleLabel, "setAutoresizingMask:", 18LL);
    v15 = v4->_titleLabel;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  48.0,  UIFontWeightHeavy));
    -[UILabel setFont:](v15, "setFont:", v16);

    v17 = v4->_titleLabel;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[UILabel setTextColor:](v17, "setTextColor:", v18);

    -[UILabel setNumberOfLines:](v4->_titleLabel, "setNumberOfLines:", 2LL);
    -[UIView addSubview:](v4->_titleBlockView, "addSubview:", v4->_titleLabel);
    v19 = -[UILabel initWithFrame:](objc_alloc(&OBJC_CLASS___UILabel), "initWithFrame:", 30.0, 270.0, 238.0, 60.0);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v19;

    -[UILabel setAutoresizingMask:](v4->_subtitleLabel, "setAutoresizingMask:", 18LL);
    v21 = v4->_subtitleLabel;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont systemFontOfSize:weight:]( &OBJC_CLASS___UIFont,  "systemFontOfSize:weight:",  25.0,  UIFontWeightRegular));
    -[UILabel setFont:](v21, "setFont:", v22);

    v23 = v4->_subtitleLabel;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 colorWithAlphaComponent:0.4]);
    -[UILabel setTextColor:](v23, "setTextColor:", v25);

    -[UILabel setNumberOfLines:](v4->_subtitleLabel, "setNumberOfLines:", 1LL);
    -[UIView addSubview:](v4->_titleBlockView, "addSubview:", v4->_subtitleLabel);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_UIFloatingContentView contentView](v4->_floatingView, "contentView"));
    [v26 addSubview:v4->_titleBlockView];

    int v27 = 8;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 8LL));
    do
    {
      v29 = objc_opt_new(&OBJC_CLASS___UIView);
      -[UIView _setContinuousCornerRadius:](v29, "_setContinuousCornerRadius:", 6.0);
      -[UIView setClipsToBounds:](v29, "setClipsToBounds:", 1LL);
      v30 = objc_opt_new(&OBJC_CLASS___TVImageView);
      -[TVImageView setContentMode:](v30, "setContentMode:", 2LL);
      -[UIView addSubview:](v29, "addSubview:", v30);
      [v28 addObject:v29];
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaylistLockupViewCell floatingView](v4, "floatingView"));
      v32 = (void *)objc_claimAutoreleasedReturnValue([v31 contentView]);
      [v32 addSubview:v29];

      --v27;
    }

    while (v27);
    v33 = (NSArray *)[v28 copy];
    imageViews = v4->_imageViews;
    v4->_imageViews = v33;
  }

  return v4;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicPlaylistLockupViewCell;
  -[TVMusicPlaylistLockupViewCell prepareForReuse](&v4, "prepareForReuse");
  playlistID = self->_playlistID;
  self->_playlistID = 0LL;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5 = a4;
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaylistLockupViewCell floatingView](self, "floatingView"));
  [v7 setControlState:v6 withAnimationCoordinator:v5];
}

- (void)layoutWithElement:(id)a3
{
  __int128 v138 = xmmword_1001E8320;
  int64x2_t v139 = vdupq_n_s64(0x4062C00000000000uLL);
  __int128 v140 = xmmword_1001E8330;
  int64x2_t v141 = vdupq_n_s64(0x4073600000000000uLL);
  __int128 v142 = xmmword_1001E8340;
  int64x2_t v143 = v139;
  __int128 v144 = xmmword_1001E8350;
  int64x2_t v145 = v139;
  __int128 v146 = xmmword_1001E8360;
  int64x2_t v147 = v139;
  __int128 v148 = xmmword_1001E8370;
  int64x2_t v149 = v139;
  __int128 v150 = xmmword_1001E8380;
  int64x2_t v151 = v139;
  __int128 v152 = xmmword_1001E8390;
  int64x2_t v153 = v139;
  id v121 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v121 attributes]);
  v110 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"playlistID"]);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v121 attributes]);
  v109 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"data-name"]);

  unsigned int v114 = [v110 isEqualToString:self->_playlistID];
  objc_storeStrong((id *)&self->_playlistID, v110);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v121 style]);
  -[TVMusicPlaylistLockupViewCell _scaleRect:withStyle:](self, "_scaleRect:withStyle:", v6, 28.0, 30.0, 310.0, 310.0);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[UIView setFrame:](self->_titleBlockView, "setFrame:", v8, v10, v12, v14);
  __int128 v134 = 0u;
  __int128 v135 = 0u;
  __int128 v132 = 0u;
  __int128 v133 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v121 childViewElements]);
  id v117 = [obj countByEnumeratingWithState:&v132 objects:v137 count:16];
  if (v117)
  {
    uint64_t v116 = *(void *)v133;
    do
    {
      for (i = 0LL; i != v117; i = (char *)i + 1)
      {
        if (*(void *)v133 != v116) {
          objc_enumerationMutation(obj);
        }
        v119 = *(void **)(*((void *)&v132 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___TVImageElement, v15);
        if ((objc_opt_isKindOfClass(v119, v16) & 1) != 0)
        {
          id v17 = v119;
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 URL]);

          if (v18)
          {
            v19 = objc_alloc(&OBJC_CLASS___TVImageProxy);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v17 URL]);
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVURLImageLoader sharedInstance](&OBJC_CLASS___TVURLImageLoader, "sharedInstance"));
            v22 = -[TVImageProxy initWithObject:imageLoader:groupType:]( v19,  "initWithObject:imageLoader:groupType:",  v20,  v21,  0LL);

            v23 = (void *)objc_claimAutoreleasedReturnValue([v17 attributes]);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKeyedSubscript:@"position"]);
            LODWORD(v21) = [v24 intValue];

            uint64_t v25 = ((_DWORD)v21 - 1);
            if (v25 <= 7)
            {
              v26 = (double *)(&v138 + 2 * v25);
              double v27 = *v26;
              double v28 = v26[1];
              double v29 = v26[2];
              double v30 = v26[3];
              v31 = (void *)objc_claimAutoreleasedReturnValue([v121 style]);
              -[TVMusicPlaylistLockupViewCell _scaleRect:withStyle:]( self,  "_scaleRect:withStyle:",  v31,  v27,  v28,  v29,  v30);
              double v33 = v32;
              double v35 = v34;
              double v37 = v36;
              double v39 = v38;

              v40 = -[TVImageScaleDecorator initWithScaleToSize:]( objc_alloc(&OBJC_CLASS___TVImageScaleDecorator),  "initWithScaleToSize:",  v37,  v39);
              -[CAGradientLayer setDecorator:](v22, "setDecorator:", v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaylistLockupViewCell imageViews](self, "imageViews"));
              v42 = (void *)objc_claimAutoreleasedReturnValue([v41 objectAtIndexedSubscript:v25]);

              v43 = (void *)objc_claimAutoreleasedReturnValue([v42 subviews]);
              v44 = (void *)objc_claimAutoreleasedReturnValue([v43 firstObject]);

              objc_msgSend(v42, "setFrame:", v33, v35, v37, v39);
              [v42 bounds];
              objc_msgSend(v44, "setFrame:");
              v45 = (void *)objc_claimAutoreleasedReturnValue([v42 subviews]);
              BOOL v46 = [v45 count] == (id)2;

              if (v46)
              {
                v47 = (void *)objc_claimAutoreleasedReturnValue([v42 subviews]);
                v48 = (void *)objc_claimAutoreleasedReturnValue([v47 lastObject]);

                [v48 setImageProxy:v22];
              }

              else
              {
                v93 = (void *)objc_claimAutoreleasedReturnValue([v44 imageProxy]);
                unsigned __int8 v94 = -[CAGradientLayer isEqual:](v22, "isEqual:", v93);

                if ((v94 & 1) == 0)
                {
                  if (!v114
                    || (v95 = (void *)objc_claimAutoreleasedReturnValue([v44 imageProxy]),
                        BOOL v96 = v95 == 0LL,
                        v95,
                        v96))
                  {
                    objc_msgSend(v44, "setImageProxy:", v22, v109);
                  }

                  else
                  {
                    [v44 frame];
                    CGFloat x = v154.origin.x;
                    CGFloat y = v154.origin.y;
                    CGFloat width = v154.size.width;
                    double height = v154.size.height;
                    CGRect v155 = CGRectOffset(v154, 0.0, v154.size.height);
                    double v100 = v155.origin.x;
                    double v101 = v155.origin.y;
                    double v102 = v155.size.width;
                    double v103 = v155.size.height;
                    v155.origin.CGFloat x = x;
                    v155.origin.CGFloat y = y;
                    v155.size.CGFloat width = width;
                    v155.size.double height = height;
                    CGRect v156 = CGRectOffset(v155, 0.0, -height);
                    CGFloat v120 = v156.origin.x;
                    CGFloat v112 = v156.size.width;
                    CGFloat v113 = v156.origin.y;
                    CGFloat v111 = v156.size.height;
                    v104 = -[TVImageView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVImageView),  "initWithFrame:",  v100,  v101,  v102,  v103);
                    -[TVImageView setContentMode:](v104, "setContentMode:", 2LL);
                    [v42 addSubview:v104];
                    objc_initWeak(&location, v104);
                    v128[0] = _NSConcreteStackBlock;
                    v128[1] = 3221225472LL;
                    v128[2] = sub_1000AF290;
                    v128[3] = &unk_10026D668;
                    objc_copyWeak(v130, &location);
                    v130[1] = *(id *)&x;
                    v130[2] = *(id *)&y;
                    v130[3] = *(id *)&width;
                    v130[4] = *(id *)&height;
                    id v129 = v44;
                    v130[5] = *(id *)&v120;
                    v130[6] = *(id *)&v113;
                    v130[7] = *(id *)&v112;
                    v130[8] = *(id *)&v111;
                    -[TVImageView setImageProxy:completion:](v104, "setImageProxy:completion:", v22, v128);

                    objc_destroyWeak(v130);
                    objc_destroyWeak(&location);
                  }
                }
              }
            }

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicPlaylistLockupViewCell;
  -[TVMusicPlaylistLockupViewCell layoutSubviews](&v11, "layoutSubviews");
  -[UILabel frame](self->_subtitleLabel, "frame");
  double v4 = v3;
  double v6 = v5;
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_subtitleLabel, "font"));
  [v7 descender];
  double v9 = v8;

  if (v4 <= 238.0) {
    double v10 = v4;
  }
  else {
    double v10 = 238.0;
  }
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 36.0, 280.0 - v6 - v9, v10, v6);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = [a3 userInterfaceStyle];
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaylistLockupViewCell traitCollection](self, "traitCollection"));
  id v6 = [v5 userInterfaceStyle];

  if (v4 != v6)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaylistLockupViewCell traitCollection](self, "traitCollection"));
    -[TVMusicPlaylistLockupViewCell _setColorsForUserInterfaceStyle:]( self,  "_setColorsForUserInterfaceStyle:",  [v7 userInterfaceStyle]);
  }

- (void)_setColorsForUserInterfaceStyle:(int64_t)a3
{
  floatingView = self->_floatingView;
  if (a3 == 2)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.1));
    -[_UIFloatingContentView setBackgroundColor:forState:](floatingView, "setBackgroundColor:forState:", v5, 0LL);

    id v6 = self->_floatingView;
    double v7 = 0.3;
  }

  else
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, 0.4));
    -[_UIFloatingContentView setBackgroundColor:forState:](floatingView, "setBackgroundColor:forState:", v8, 0LL);

    id v6 = self->_floatingView;
    double v7 = 0.8;
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 1.0, v7));
  -[_UIFloatingContentView setBackgroundColor:forState:](v6, "setBackgroundColor:forState:");
}

- (CGRect)_scaleRect:(CGRect)a3 withStyle:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = a4;
  [v8 width];
  if (v9 != 846.0 || ([v8 height], v10 != 526.0))
  {
    [v8 width];
    double v11 = 1.0;
    double v12 = 1.0;
    if (v13 > 0.0)
    {
      [v8 width];
      double v12 = v14 / 846.0;
    }

    [v8 height];
    if (v15 > 0.0)
    {
      [v8 height];
      double v11 = v16 / 526.0;
    }

    double x = x * v12;
    double y = y * v11;
    double width = width * v12;
    double height = height * v11;
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)_configureLabel:(id)a3 withTextElement:(id)a4 maxWidth:(double)a5
{
  id v22 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 attributedText]);
  [v22 setAttributedText:v8];

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v7 style]);
  [v9 margin];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  if ([v9 position] == (id)3)
  {
    double v18 = (void *)objc_claimAutoreleasedReturnValue([v22 superview]);
    [v18 frame];
    double v20 = v19 - v15;
    [v22 frame];
    double v11 = v20 - v21;
  }

  objc_msgSend(v22, "setFrame:", v13, v11, a5 - v13 - v17, 0.0);
  objc_msgSend(v22, "setNumberOfLines:", objc_msgSend(v9, "maxTextLines"));
  [v22 sizeToFit];
}

- (id)_randomColor
{
  double v2 = drand48();
  double v3 = drand48();
  return +[UIColor colorWithRed:green:blue:alpha:]( &OBJC_CLASS___UIColor,  "colorWithRed:green:blue:alpha:",  v2,  v3,  drand48(),  0.4);
}

- (_UIFloatingContentView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
}

- (BOOL)createdImageViews
{
  return self->_createdImageViews;
}

- (void)setCreatedImageViews:(BOOL)a3
{
  self->_createdImageViews = a3;
}

- (UIView)titleBlockView
{
  return self->_titleBlockView;
}

- (void)setTitleBlockView:(id)a3
{
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

- (TVImageView)titleBackgroundImageView
{
  return self->_titleBackgroundImageView;
}

- (void)setTitleBackgroundImageView:(id)a3
{
}

- (NSString)playlistID
{
  return self->_playlistID;
}

- (void)setPlaylistID:(id)a3
{
}

- (CALayer)titleGradientLayer
{
  return self->_titleGradientLayer;
}

- (void)setTitleGradientLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end