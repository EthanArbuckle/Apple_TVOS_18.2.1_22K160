@interface SATVCyclingFooterView
- (BOOL)_supportsCycling;
- (BOOL)manualMode;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)contentStrings;
- (NSArray)languageCodes;
- (SATVCyclingFooterView)initWithStrings:(id)a3 languageCodes:(id)a4;
- (SATVFooterView)manualFooterView;
- (SATVPulsingFooterView)firstPulsingFooterView;
- (SATVPulsingFooterView)secondPulsingFooterView;
- (unint64_t)_nextStringIndex;
- (unint64_t)currentStringIndex;
- (void)_cycleAtBeginTime:(double)a3;
- (void)_startAutoAdvanceTimer;
- (void)_stopAutoAdvanceTimer;
- (void)cycleAtBeginTime:(double)a3;
- (void)cycleWithInterval:(double)a3;
- (void)dealloc;
- (void)didFinishAnimationPulsingAnimation:(id)a3;
- (void)layoutSubviews;
- (void)setContentStrings:(id)a3;
- (void)setCurrentStringIndex:(unint64_t)a3;
- (void)setFirstPulsingFooterView:(id)a3;
- (void)setLanguageCodes:(id)a3;
- (void)setManualAttributedString:(id)a3;
- (void)setManualFooterView:(id)a3;
- (void)setManualMode:(BOOL)a3;
- (void)setSecondPulsingFooterView:(id)a3;
@end

@implementation SATVCyclingFooterView

- (SATVCyclingFooterView)initWithStrings:(id)a3 languageCodes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___SATVCyclingFooterView;
  v8 = -[SATVCyclingFooterView initWithFrame:]( &v33,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  if (v8)
  {
    id v9 = [v7 count];
    if (v9 != [v6 count]) {
      sub_1000763F8();
    }
    v10 = (NSArray *)[v6 copy];
    contentStrings = v8->_contentStrings;
    v8->_contentStrings = v10;

    v12 = (NSArray *)[v7 copy];
    languageCodes = v8->_languageCodes;
    v8->_languageCodes = v12;

    v14 = -[SATVPulsingFooterView initWithMode:](objc_alloc(&OBJC_CLASS___SATVPulsingFooterView), "initWithMode:", 0LL);
    firstPulsingFooterView = v8->_firstPulsingFooterView;
    v8->_firstPulsingFooterView = v14;

    -[SATVPulsingFooterView setAnimationDelegate:](v8->_firstPulsingFooterView, "setAnimationDelegate:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v8->_contentStrings, "firstObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](v8->_languageCodes, "firstObject"));
    [v16 setAccessibilityLanguage:v17];

    uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSAttributedString, v18);
    char isKindOfClass = objc_opt_isKindOfClass(v16, v19);
    v21 = v8->_firstPulsingFooterView;
    if ((isKindOfClass & 1) != 0) {
      -[SATVFooterView setFooterAttributedString:](v21, "setFooterAttributedString:", v16);
    }
    else {
      -[SATVFooterView setFootnoteText:](v21, "setFootnoteText:", v16);
    }
    -[SATVCyclingFooterView addSubview:](v8, "addSubview:", v8->_firstPulsingFooterView);
    v8->_currentStringIndex = 0LL;
    if (-[SATVCyclingFooterView _supportsCycling](v8, "_supportsCycling"))
    {
      v22 = -[SATVPulsingFooterView initWithMode:]( objc_alloc(&OBJC_CLASS___SATVPulsingFooterView),  "initWithMode:",  1LL);
      secondPulsingFooterView = v8->_secondPulsingFooterView;
      v8->_secondPulsingFooterView = v22;

      -[SATVPulsingFooterView setAnimationDelegate:](v8->_secondPulsingFooterView, "setAnimationDelegate:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v8->_contentStrings, "objectAtIndexedSubscript:", 1LL));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](v8->_languageCodes, "objectAtIndexedSubscript:", 1LL));
      [v24 setAccessibilityLanguage:v25];

      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSAttributedString, v26);
      char v28 = objc_opt_isKindOfClass(v24, v27);
      v29 = v8->_secondPulsingFooterView;
      if ((v28 & 1) != 0) {
        -[SATVFooterView setFooterAttributedString:](v29, "setFooterAttributedString:", v24);
      }
      else {
        -[SATVFooterView setFootnoteText:](v29, "setFootnoteText:", v24);
      }
      -[SATVCyclingFooterView addSubview:](v8, "addSubview:", v8->_secondPulsingFooterView);
      v8->_currentStringIndex = 1LL;
    }

    v30 = objc_alloc_init(&OBJC_CLASS___SATVFooterView);
    manualFooterView = v8->_manualFooterView;
    v8->_manualFooterView = v30;

    -[SATVFooterView setHidden:](v8->_manualFooterView, "setHidden:", 1LL);
    -[SATVCyclingFooterView addSubview:](v8, "addSubview:", v8->_manualFooterView);
  }

  return v8;
}

- (void)dealloc
{
  autoAdvanceTimer = self->_autoAdvanceTimer;
  if (autoAdvanceTimer) {
    dispatch_source_cancel((dispatch_source_t)autoAdvanceTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVCyclingFooterView;
  -[SATVCyclingFooterView dealloc](&v4, "dealloc");
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SATVPulsingFooterView setFrame:](self->_firstPulsingFooterView, "setFrame:");
  -[SATVPulsingFooterView setFrame:](self->_secondPulsingFooterView, "setFrame:", v4, v6, v8, v10);
  -[SATVFooterView setFrame:](self->_manualFooterView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unsigned int v6 = -[SATVCyclingFooterView manualMode](self, "manualMode");
  double v7 = &OBJC_IVAR___SATVCyclingFooterView__firstPulsingFooterView;
  if (v6) {
    double v7 = &OBJC_IVAR___SATVCyclingFooterView__manualFooterView;
  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "sizeThatFits:", width, height);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)cycleWithInterval:(double)a3
{
  self->_autoAdvanceInterval = a3;
  -[SATVCyclingFooterView _startAutoAdvanceTimer](self, "_startAutoAdvanceTimer");
}

- (void)cycleAtBeginTime:(double)a3
{
}

- (void)_cycleAtBeginTime:(double)a3
{
  if (-[SATVCyclingFooterView _supportsCycling](self, "_supportsCycling"))
  {
    if (-[SATVCyclingFooterView manualMode](self, "manualMode"))
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView manualFooterView](self, "manualFooterView"));
      [v5 setHidden:1];

      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView firstPulsingFooterView](self, "firstPulsingFooterView"));
      [v6 setHidden:0];

      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView secondPulsingFooterView](self, "secondPulsingFooterView"));
      [v7 setHidden:0];

      -[SATVCyclingFooterView setManualMode:](self, "setManualMode:", 0LL);
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView firstPulsingFooterView](self, "firstPulsingFooterView"));
    [v8 pulseAtBeginTime:a3];

    id v9 = (id)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView secondPulsingFooterView](self, "secondPulsingFooterView"));
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
    v8[2] = sub_1000153D8;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView contentStrings](self, "contentStrings"));
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (unint64_t)_nextStringIndex
{
  unsigned int v3 = -[SATVCyclingFooterView _supportsCycling](self, "_supportsCycling");
  unint64_t result = self->_currentStringIndex;
  if (v3) {
    return (result + 1) % -[NSArray count](self->_contentStrings, "count");
  }
  return result;
}

- (void)setManualAttributedString:(id)a3
{
  id v4 = a3;
  -[SATVCyclingFooterView setManualMode:](self, "setManualMode:", 1LL);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView firstPulsingFooterView](self, "firstPulsingFooterView"));
  [v5 setHidden:1];

  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView secondPulsingFooterView](self, "secondPulsingFooterView"));
  [v6 setHidden:1];

  -[SATVFooterView setFooterAttributedString:](self->_manualFooterView, "setFooterAttributedString:", v4);
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView manualFooterView](self, "manualFooterView"));
  [v7 setHidden:0];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[SATVCyclingFooterView manualFooterView](self, "manualFooterView"));
  [v8 setNeedsLayout];
}

- (void)didFinishAnimationPulsingAnimation:(id)a3
{
  id v8 = a3;
  if ([v8 mode])
  {
    if ([v8 mode] == (id)1) {
      [v8 setMode:0];
    }
  }

  else
  {
    [v8 setMode:1];
    -[SATVCyclingFooterView setCurrentStringIndex:]( self,  "setCurrentStringIndex:",  -[SATVCyclingFooterView _nextStringIndex](self, "_nextStringIndex"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_contentStrings,  "objectAtIndexedSubscript:",  -[SATVCyclingFooterView currentStringIndex](self, "currentStringIndex")));
    double v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray objectAtIndexedSubscript:]( self->_languageCodes,  "objectAtIndexedSubscript:",  -[SATVCyclingFooterView currentStringIndex](self, "currentStringIndex")));
    [v4 setAccessibilityLanguage:v5];

    uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSAttributedString, v6);
    if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0) {
      [v8 setFooterAttributedString:v4];
    }
    else {
      [v8 setFootnoteText:v4];
    }
    [v8 setNeedsLayout];
    [v8 layoutIfNeeded];
  }
}

- (NSArray)contentStrings
{
  return self->_contentStrings;
}

- (void)setContentStrings:(id)a3
{
}

- (NSArray)languageCodes
{
  return self->_languageCodes;
}

- (void)setLanguageCodes:(id)a3
{
}

- (SATVPulsingFooterView)firstPulsingFooterView
{
  return self->_firstPulsingFooterView;
}

- (void)setFirstPulsingFooterView:(id)a3
{
}

- (SATVPulsingFooterView)secondPulsingFooterView
{
  return self->_secondPulsingFooterView;
}

- (void)setSecondPulsingFooterView:(id)a3
{
}

- (SATVFooterView)manualFooterView
{
  return self->_manualFooterView;
}

- (void)setManualFooterView:(id)a3
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