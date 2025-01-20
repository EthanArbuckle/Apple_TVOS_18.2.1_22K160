@interface SATVCyclingHeaderView
- (BOOL)_supportsCycling;
- (BOOL)manualMode;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)languageCodes;
- (NSArray)subtitleStrings;
- (NSArray)titleStrings;
- (SATVCyclingHeaderView)initWithTitleStrings:(id)a3 subtitleStrings:(id)a4 languageCodes:(id)a5;
- (SATVHeaderView)manualHeaderView;
- (SATVPulsingHeaderView)firstPulsingHeaderView;
- (SATVPulsingHeaderView)secondPulsingHeaderView;
- (unint64_t)_nextUniqueStringIndex;
- (unint64_t)currentStringIndex;
- (void)_cycleAtBeginTime:(double)a3;
- (void)_startAutoAdvanceTimer;
- (void)_stopAutoAdvanceTimer;
- (void)cycleAtBeginTime:(double)a3;
- (void)cycleWithInterval:(double)a3;
- (void)dealloc;
- (void)didFinishAnimationPulsingAnimation:(id)a3;
- (void)layoutSubviews;
- (void)setCurrentStringIndex:(unint64_t)a3;
- (void)setFirstPulsingHeaderView:(id)a3;
- (void)setLanguageCodes:(id)a3;
- (void)setManualHeaderView:(id)a3;
- (void)setManualMode:(BOOL)a3;
- (void)setManualTitle:(id)a3 subtitle:(id)a4;
- (void)setSecondPulsingHeaderView:(id)a3;
- (void)setSubtitleStrings:(id)a3;
- (void)setTitleStrings:(id)a3;
@end

@implementation SATVCyclingHeaderView

- (SATVCyclingHeaderView)initWithTitleStrings:(id)a3 subtitleStrings:(id)a4 languageCodes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v43.receiver = self;
  v43.super_class = (Class)&OBJC_CLASS___SATVCyclingHeaderView;
  v11 = -[SATVCyclingHeaderView initWithFrame:]( &v43,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  if (v11)
  {
    id v12 = [v10 count];
    id v13 = [v8 count];
    if (v13 != [v9 count]) {
      sub_100076448();
    }
    if (v12 != v13) {
      sub_100076420();
    }
    v14 = (NSArray *)[v8 copy];
    titleStrings = v11->_titleStrings;
    v11->_titleStrings = v14;

    v16 = (NSArray *)[v9 copy];
    subtitleStrings = v11->_subtitleStrings;
    v11->_subtitleStrings = v16;

    v18 = (NSArray *)[v10 copy];
    languageCodes = v11->_languageCodes;
    v11->_languageCodes = v18;

    v20 = -[SATVPulsingHeaderView initWithMode:](objc_alloc(&OBJC_CLASS___SATVPulsingHeaderView), "initWithMode:", 0LL);
    firstPulsingHeaderView = v11->_firstPulsingHeaderView;
    v11->_firstPulsingHeaderView = v20;

    -[SATVPulsingHeaderView setAnimationDelegate:](v11->_firstPulsingHeaderView, "setAnimationDelegate:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v11->_titleStrings, "firstObject"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v11->_firstPulsingHeaderView, "titleLabel"));
    [v23 setText:v22];

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v11->_subtitleStrings, "firstObject"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView subtitleLabel](v11->_firstPulsingHeaderView, "subtitleLabel"));
    [v25 setText:v24];

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v11->_languageCodes, "firstObject"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v11->_firstPulsingHeaderView, "titleLabel"));
    [v27 setAccessibilityLanguage:v26];

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v11->_languageCodes, "firstObject"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView subtitleLabel](v11->_firstPulsingHeaderView, "subtitleLabel"));
    [v29 setAccessibilityLanguage:v28];

    -[SATVCyclingHeaderView addSubview:](v11, "addSubview:", v11->_firstPulsingHeaderView);
    v11->_currentStringIndex = 0LL;
    if (-[SATVCyclingHeaderView _supportsCycling](v11, "_supportsCycling"))
    {
      v30 = -[SATVPulsingHeaderView initWithMode:]( objc_alloc(&OBJC_CLASS___SATVPulsingHeaderView),  "initWithMode:",  1LL);
      secondPulsingHeaderView = v11->_secondPulsingHeaderView;
      v11->_secondPulsingHeaderView = v30;

      -[SATVPulsingHeaderView setAnimationDelegate:](v11->_secondPulsingHeaderView, "setAnimationDelegate:", v11);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v11->_titleStrings, "objectAtIndexedSubscript:", 1LL));
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v11->_secondPulsingHeaderView, "titleLabel"));
      [v33 setText:v32];

      v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v11->_subtitleStrings, "objectAtIndexedSubscript:", 1LL));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView subtitleLabel](v11->_secondPulsingHeaderView, "subtitleLabel"));
      [v35 setText:v34];

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v11->_languageCodes, "objectAtIndexedSubscript:", 1LL));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView titleLabel](v11->_secondPulsingHeaderView, "titleLabel"));
      [v37 setAccessibilityLanguage:v36];

      v38 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v11->_languageCodes, "objectAtIndexedSubscript:", 1LL));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderView subtitleLabel](v11->_secondPulsingHeaderView, "subtitleLabel"));
      [v39 setAccessibilityLanguage:v38];

      -[SATVCyclingHeaderView addSubview:](v11, "addSubview:", v11->_secondPulsingHeaderView);
      v11->_currentStringIndex = 1LL;
    }

    v40 = objc_alloc_init(&OBJC_CLASS___SATVHeaderView);
    manualHeaderView = v11->_manualHeaderView;
    v11->_manualHeaderView = v40;

    -[SATVHeaderView setHidden:](v11->_manualHeaderView, "setHidden:", 1LL);
    -[SATVCyclingHeaderView addSubview:](v11, "addSubview:", v11->_manualHeaderView);
  }

  return v11;
}

- (void)dealloc
{
  id v3 = sub_10002AF94();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "DEALLOC", buf, 2u);
  }

  autoAdvanceTimer = self->_autoAdvanceTimer;
  if (autoAdvanceTimer) {
    dispatch_source_cancel((dispatch_source_t)autoAdvanceTimer);
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVCyclingHeaderView;
  -[SATVCyclingHeaderView dealloc](&v6, "dealloc");
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SATVPulsingHeaderView setFrame:](self->_firstPulsingHeaderView, "setFrame:");
  -[SATVPulsingHeaderView setFrame:](self->_secondPulsingHeaderView, "setFrame:", v4, v6, v8, v10);
  -[SATVHeaderView setFrame:](self->_manualHeaderView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unsigned int v6 = -[SATVCyclingHeaderView manualMode](self, "manualMode");
  double v7 = &OBJC_IVAR___SATVCyclingHeaderView__firstPulsingHeaderView;
  if (v6) {
    double v7 = &OBJC_IVAR___SATVCyclingHeaderView__manualHeaderView;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "sizeThatFits:", width, height);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)cycleWithInterval:(double)a3
{
  self->_autoAdvanceInterval = a3;
  -[SATVCyclingHeaderView _startAutoAdvanceTimer](self, "_startAutoAdvanceTimer");
}

- (void)cycleAtBeginTime:(double)a3
{
}

- (void)_cycleAtBeginTime:(double)a3
{
  if (-[SATVCyclingHeaderView _supportsCycling](self, "_supportsCycling"))
  {
    if (-[SATVCyclingHeaderView manualMode](self, "manualMode"))
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView manualHeaderView](self, "manualHeaderView"));
      [v5 setHidden:1];

      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView firstPulsingHeaderView](self, "firstPulsingHeaderView"));
      [v6 setHidden:0];

      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView secondPulsingHeaderView](self, "secondPulsingHeaderView"));
      [v7 setHidden:0];

      -[SATVCyclingHeaderView setManualMode:](self, "setManualMode:", 0LL);
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView firstPulsingHeaderView](self, "firstPulsingHeaderView"));
    [v8 pulseAtBeginTime:a3];

    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView secondPulsingHeaderView](self, "secondPulsingHeaderView"));
    [v9 pulseAtBeginTime:a3];
  }

- (void)_startAutoAdvanceTimer
{
  if (self->_autoAdvanceInterval > 0.0)
  {
    objc_initWeak(&location, self);
    double v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
    autoAdvanceTimer = self->_autoAdvanceTimer;
    self->_autoAdvanceTimer = v3;

    double v5 = self->_autoAdvanceTimer;
    dispatch_time_t v6 = dispatch_time(0LL, (uint64_t)(self->_autoAdvanceInterval * 1000000000.0));
    dispatch_source_set_timer( (dispatch_source_t)v5,  v6,  (unint64_t)(self->_autoAdvanceInterval * 1000000000.0),  0x1DCD6500uLL);
    double v7 = self->_autoAdvanceTimer;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000190FC;
    v8[3] = &unk_1000C93A0;
    objc_copyWeak(&v9, &location);
    dispatch_source_set_event_handler((dispatch_source_t)v7, v8);
    dispatch_resume((dispatch_object_t)self->_autoAdvanceTimer);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

- (void)_stopAutoAdvanceTimer
{
  autoAdvanceTimer = self->_autoAdvanceTimer;
  if (autoAdvanceTimer)
  {
    dispatch_source_cancel((dispatch_source_t)autoAdvanceTimer);
    double v4 = self->_autoAdvanceTimer;
    self->_autoAdvanceTimer = 0LL;
  }

- (BOOL)_supportsCycling
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView titleStrings](self, "titleStrings"));
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (unint64_t)_nextUniqueStringIndex
{
  unint64_t v3 = -[SATVCyclingHeaderView currentStringIndex](self, "currentStringIndex");
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView titleStrings](self, "titleStrings"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:v3]);

  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView subtitleStrings](self, "subtitleStrings"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:v3]);

  if (-[SATVCyclingHeaderView _supportsCycling](self, "_supportsCycling"))
  {
    for (unint64_t i = v3 + 1; ; unint64_t i = v10 + 1)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView titleStrings](self, "titleStrings"));
      unint64_t v10 = i % (unint64_t)[v9 count];

      if (v10 == v3) {
        break;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView titleStrings](self, "titleStrings"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:v10]);

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView subtitleStrings](self, "subtitleStrings"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v10]);

      if (![v5 isEqualToString:v12]
        || ([v7 isEqualToString:v14] & 1) == 0)
      {

        goto LABEL_8;
      }
    }
  }

  unint64_t v10 = v3;
LABEL_8:

  return v10;
}

- (void)setManualTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SATVCyclingHeaderView setManualMode:](self, "setManualMode:", 1LL);
  double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView firstPulsingHeaderView](self, "firstPulsingHeaderView"));
  [v8 setHidden:1];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView secondPulsingHeaderView](self, "secondPulsingHeaderView"));
  [v9 setHidden:1];

  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView manualHeaderView](self, "manualHeaderView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 titleLabel]);
  [v11 setText:v7];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView manualHeaderView](self, "manualHeaderView"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 subtitleLabel]);
  [v13 setText:v6];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView manualHeaderView](self, "manualHeaderView"));
  [v14 setHidden:0];

  id v15 = (id)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView manualHeaderView](self, "manualHeaderView"));
  [v15 setNeedsLayout];
}

- (void)didFinishAnimationPulsingAnimation:(id)a3
{
  id v16 = a3;
  if ([v16 mode])
  {
    if ([v16 mode] == (id)1) {
      [v16 setMode:0];
    }
  }

  else
  {
    [v16 setMode:1];
    -[SATVCyclingHeaderView setCurrentStringIndex:]( self,  "setCurrentStringIndex:",  -[SATVCyclingHeaderView _nextUniqueStringIndex](self, "_nextUniqueStringIndex"));
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView titleStrings](self, "titleStrings"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v4,  "objectAtIndexedSubscript:",  -[SATVCyclingHeaderView currentStringIndex](self, "currentStringIndex")));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v16 titleLabel]);
    [v6 setText:v5];

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView subtitleStrings](self, "subtitleStrings"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "objectAtIndexedSubscript:",  -[SATVCyclingHeaderView currentStringIndex](self, "currentStringIndex")));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v16 subtitleLabel]);
    [v9 setText:v8];

    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView languageCodes](self, "languageCodes"));
    v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "objectAtIndexedSubscript:",  -[SATVCyclingHeaderView currentStringIndex](self, "currentStringIndex")));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v16 titleLabel]);
    [v12 setAccessibilityLanguage:v11];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingHeaderView languageCodes](self, "languageCodes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v13,  "objectAtIndexedSubscript:",  -[SATVCyclingHeaderView currentStringIndex](self, "currentStringIndex")));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v16 subtitleLabel]);
    [v15 setAccessibilityLanguage:v14];

    [v16 setNeedsLayout];
    [v16 layoutIfNeeded];
  }
}

- (NSArray)titleStrings
{
  return self->_titleStrings;
}

- (void)setTitleStrings:(id)a3
{
}

- (NSArray)subtitleStrings
{
  return self->_subtitleStrings;
}

- (void)setSubtitleStrings:(id)a3
{
}

- (NSArray)languageCodes
{
  return self->_languageCodes;
}

- (void)setLanguageCodes:(id)a3
{
}

- (SATVPulsingHeaderView)firstPulsingHeaderView
{
  return self->_firstPulsingHeaderView;
}

- (void)setFirstPulsingHeaderView:(id)a3
{
}

- (SATVPulsingHeaderView)secondPulsingHeaderView
{
  return self->_secondPulsingHeaderView;
}

- (void)setSecondPulsingHeaderView:(id)a3
{
}

- (SATVHeaderView)manualHeaderView
{
  return self->_manualHeaderView;
}

- (void)setManualHeaderView:(id)a3
{
}

- (unint64_t)currentStringIndex
{
  return self->_currentStringIndex;
}

- (void)setCurrentStringIndex:(unint64_t)a3
{
  self->_currentStringIndex = a3;
}

- (BOOL)manualMode
{
  return self->_manualMode;
}

- (void)setManualMode:(BOOL)a3
{
  self->_manualMode = a3;
}

- (void).cxx_destruct
{
}

@end