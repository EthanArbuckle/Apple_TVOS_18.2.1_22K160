@interface TVMTAnimatedLabel
- (BOOL)_shouldCycle;
- (BOOL)isAnimating;
- (BOOL)isPaused;
- (NSArray)attributedStrings;
- (TVMTAnimatedLabel)initWithFrame:(CGRect)a3;
- (_TVAnimatedImageView)currentMarqueeView;
- (_TVAnimatedImageView)nextMarqueeView;
- (double)crossfadeDuration;
- (double)marqueeDelay;
- (double)maskCapWidth;
- (double)replicationPadding;
- (double)underPosterOutset;
- (float)scrollRate;
- (id)_imageForText:(BOOL)a3;
- (unint64_t)currentAttributedStringIndex;
- (void)_applicationDidBecomeActiveNotification:(id)a3;
- (void)_applicationWillResignActiveNotification:(id)a3;
- (void)_clearAttributedStrings;
- (void)_clearLabelTextContents;
- (void)_nextAttributedString;
- (void)_prepareNextMarquee;
- (void)_startMarqueeIfNeeded;
- (void)dealloc;
- (void)drawTextInRect:(CGRect)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setAttributedStrings:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setCrossfadeDuration:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setMarqueeDelay:(double)a3;
- (void)setMaskCapWidth:(double)a3;
- (void)setNeedsDisplay;
- (void)setPaused:(BOOL)a3;
- (void)setReplicationPadding:(double)a3;
- (void)setScrollRate:(float)a3;
- (void)setText:(id)a3;
- (void)setUnderPosterOutset:(double)a3;
- (void)stopAndResetScrollWithDuration:(double)a3;
- (void)stopAnimating;
- (void)stopAnimatingWithoutResetWithDuration:(double)a3;
@end

@implementation TVMTAnimatedLabel

- (TVMTAnimatedLabel)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVMTAnimatedLabel;
  v3 = -[TVMTLabel initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_marqueeing = 0;
    v3->_animating = 0;
    v3->_marqueeDeladouble y = 1.0;
    v3->_replicationPadding = 40.0;
    v3->_maskCapWidth = 20.0;
    v3->_scrollRate = 45.0;
    v3->_crossfadeDuration = 1.5;
    v5 = objc_alloc(&OBJC_CLASS____TVAnimatedImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v9 = -[_TVAnimatedImageView initWithFrame:](v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[TVMTAnimatedLabel addSubview:](v4, "addSubview:", v9);
    objc_storeWeak((id *)&v4->_currentMarqueeView, v9);
    -[_TVAnimatedImageView setHidden:](v9, "setHidden:", 1LL);
    v10 = -[_TVAnimatedImageView initWithFrame:]( objc_alloc(&OBJC_CLASS____TVAnimatedImageView),  "initWithFrame:",  CGRectZero.origin.x,  y,  width,  height);
    -[TVMTAnimatedLabel addSubview:](v4, "addSubview:", v10);
    objc_storeWeak((id *)&v4->_nextMarqueeView, v10);
    -[_TVAnimatedImageView setHidden:](v10, "setHidden:", 1LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v12 = MTApplicationWillResignActiveNotification;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v11 addObserver:v4 selector:"_applicationWillResignActiveNotification:" name:v12 object:v13];

    uint64_t v14 = MTApplicationDidBecomeActiveNotification;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v11 addObserver:v4 selector:"_applicationDidBecomeActiveNotification:" name:v14 object:v15];
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMTAnimatedLabel;
  -[TVMTAnimatedLabel dealloc](&v4, "dealloc");
}

- (void)setText:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = -[NSAttributedString initWithString:](objc_alloc(&OBJC_CLASS___NSAttributedString), "initWithString:", v4);
  }

  else
  {
    v5 = 0LL;
  }

  -[TVMTAnimatedLabel setAttributedText:](self, "setAttributedText:", v5);
}

- (void)setAttributedText:(id)a3
{
  if (a3)
  {
    id v6 = a3;
    id v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v5 = 0LL;
  }

  -[TVMTAnimatedLabel setAttributedStrings:](self, "setAttributedStrings:", v5, v6);
}

- (void)_clearAttributedStrings
{
  attributedStrings = self->_attributedStrings;
  self->_attributedStrings = 0LL;

  self->_currentAttributedStringIndex = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMTAnimatedLabel;
  -[TVMTAnimatedLabel setAttributedText:](&v4, "setAttributedText:", 0LL);
  -[TVMTAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setAttributedStrings:(id)a3
{
  id v4 = a3;
  if ((-[NSArray isEqual:](self->_attributedStrings, "isEqual:", v4) & 1) == 0
    && [v4 count])
  {
    v5 = (NSArray *)[v4 copy];
    attributedStrings = self->_attributedStrings;
    self->_attributedStrings = v5;

    self->_currentAttributedStringIndex = 0LL;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_attributedStrings, "firstObject"));
    id v8 = [v7 copy];
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVMTAnimatedLabel;
    -[TVMTAnimatedLabel setAttributedText:](&v9, "setAttributedText:", v8);

    -[TVMTLabel setLineBreakMode:](self, "setLineBreakMode:", 2LL);
    -[TVMTAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMTAnimatedLabel;
  -[TVMTAnimatedLabel setHighlighted:](&v6, "setHighlighted:", a3);
  -[TVMTAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
  if (self->_animating && self->_marqueeing)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel _imageForText:](self, "_imageForText:", self->_marqueeNeeded));
    [v4 setImage:v5];
  }

- (void)setNeedsDisplay
{
  if (!self->_marqueeing)
  {
    v2.receiver = self;
    v2.super_class = (Class)&OBJC_CLASS___TVMTAnimatedLabel;
    -[TVMTAnimatedLabel setNeedsDisplay](&v2, "setNeedsDisplay");
  }

- (void)setAnimating:(BOOL)a3
{
  BOOL v3 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "stopAnimating",  0LL);
  if (self->_animating != v3)
  {
    self->_animating = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
    [v5 setHidden:1];

    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel nextMarqueeView](self, "nextMarqueeView"));
    [v6 setHidden:1];

    if (self->_animating)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel layer](self, "layer"));
      [v7 setOpaque:0];
    }

    else
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 layer]);
      [v9 removeAnimationForKey:@"TVAnimatedLabelMarqueeLayerContentOriginXAnimationKey"];

      -[CALayer removeAnimationForKey:]( self->_maskLayer,  "removeAnimationForKey:",  @"TVAnimatedLabelMarqueeMaskLayerPositionXAnimationKey");
      -[CALayer removeAnimationForKey:]( self->_maskLayer,  "removeAnimationForKey:",  @"TVAnimatedLabelMarqueeMaskLayerWidthAnimationKey");
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 layer]);
      [v11 removeAnimationForKey:@"TVAnimatedLabelMarqueeLayerWidthAnimationKey"];

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 layer]);
      [v13 removeAnimationForKey:@"TVAnimatedLabelMarqueeLayerPositionXAnimationKey"];

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel layer](self, "layer"));
      [v14 setMask:0];

      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_prepareNextMarquee",  0LL);
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_startMarqueeIfNeeded",  0LL);
      self->_marqueeing = 0;
      self->_currentAttributedStringIndex = 0LL;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray firstObject](self->_attributedStrings, "firstObject"));
      id v15 = [v7 copy];
      v16.receiver = self;
      v16.super_class = (Class)&OBJC_CLASS___TVMTAnimatedLabel;
      -[TVMTAnimatedLabel setAttributedText:](&v16, "setAttributedText:", v15);
    }

    -[TVMTLabel setLineBreakMode:](self, "setLineBreakMode:", 2LL);
    -[TVMTAnimatedLabel setNeedsDisplay](self, "setNeedsDisplay");
  }

- (void)stopAnimating
{
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (a3)
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_prepareNextMarquee",  0LL);
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_startMarqueeIfNeeded",  0LL);
    }

    else
    {
      -[TVMTAnimatedLabel _startMarqueeIfNeeded](self, "_startMarqueeIfNeeded");
    }
  }

- (void)stopAnimatingWithoutResetWithDuration:(double)a3
{
}

- (void)stopAndResetScrollWithDuration:(double)a3
{
  if (a3 > 0.0 && self->_marqueeNeeded)
  {
    -[TVMTAnimatedLabel bounds](self, "bounds");
    uint64_t v54 = v6;
    uint64_t v55 = v5;
    double v8 = v7;
    double v52 = v7;
    uint64_t v53 = v9;
    -[TVMTAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
    double v50 = v10;
    uint64_t v51 = v11;
    double v12 = v10 + v8;
    -[TVMTAnimatedLabel replicationPadding](self, "replicationPadding");
    double v49 = v13 + v12;
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_prepareNextMarquee",  0LL);
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_startMarqueeIfNeeded",  0LL);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 layer]);
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 presentationLayer]);
    [v16 contentsRect];
    double v18 = v17;
    double v47 = v20;
    double v48 = v19;
    double v46 = v21;

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer presentationLayer](self->_maskLayer, "presentationLayer"));
    [v22 bounds];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer presentationLayer](self->_maskLayer, "presentationLayer"));
    [v31 position];
    double v33 = v32;
    double v35 = v34;

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 layer]);
    [v37 removeAnimationForKey:@"TVAnimatedLabelMarqueeLayerContentOriginXAnimationKey"];

    -[CALayer removeAnimationForKey:]( self->_maskLayer,  "removeAnimationForKey:",  @"TVAnimatedLabelMarqueeMaskLayerPositionXAnimationKey");
    -[CALayer removeAnimationForKey:]( self->_maskLayer,  "removeAnimationForKey:",  @"TVAnimatedLabelMarqueeMaskLayerWidthAnimationKey");
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 layer]);
    [v39 removeAnimationForKey:@"TVAnimatedLabelMarqueeLayerWidthAnimationKey"];

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
    v41 = (void *)objc_claimAutoreleasedReturnValue([v40 layer]);
    [v41 removeAnimationForKey:@"TVAnimatedLabelMarqueeLayerPositionXAnimationKey"];

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 layer]);
    objc_msgSend(v43, "setContentsRect:", v18, v48, v47, v46);

    -[CALayer setBounds:](self->_maskLayer, "setBounds:", v24, v26, v28, v30);
    -[CALayer setPosition:](self->_maskLayer, "setPosition:", v33, v35);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_10003F8C4;
    v58[3] = &unk_100241888;
    v58[4] = self;
    *(double *)&v58[5] = v50;
    v58[6] = v51;
    *(double *)&v58[7] = v49;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_10003F9A8;
    v57[3] = &unk_100240110;
    v57[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:delay:options:animations:completion:",  327686LL,  v58,  v57,  a3,  0.0);
    double v44 = 100000000.0;
    if (a3 + -0.2 >= 0.1) {
      double v44 = (a3 + -0.2) * 1000000000.0;
    }
    dispatch_time_t v45 = dispatch_time(0LL, (uint64_t)v44);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10003F9B4;
    block[3] = &unk_1002418B0;
    block[4] = self;
    block[5] = v55;
    block[6] = v54;
    *(double *)&block[7] = v52;
    block[8] = v53;
    dispatch_after(v45, &_dispatch_main_q, block);
  }

  else
  {
    -[TVMTAnimatedLabel setAnimating:](self, "setAnimating:", 0LL);
  }

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[TVMTAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
  BOOL v9 = v8 <= width;
  self->_BOOL marqueeNeeded = v8 > width;
  double v10 = 0.0;
  double underPosterOutset = 0.0;
  if (!v9) {
    double underPosterOutset = self->_underPosterOutset;
  }
  double v12 = x + underPosterOutset;
  double v13 = width - underPosterOutset;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVMTAnimatedLabel;
  -[TVMTAnimatedLabel drawTextInRect:](&v17, "drawTextInRect:", v12, y, v13, height);
  BOOL marqueeNeeded = self->_marqueeNeeded;
  if (self->_marqueeNeeded)
  {
    double v10 = self->_underPosterOutset;
    double v12 = v12 - v10;
  }

  if (self->_animating)
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_startMarqueeIfNeeded",  0LL);
    -[TVMTAnimatedLabel marqueeDelay](self, "marqueeDelay");
    -[TVMTAnimatedLabel performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_startMarqueeIfNeeded",  0LL);
    BOOL marqueeNeeded = self->_marqueeNeeded;
  }

  if (marqueeNeeded)
  {
    double v15 = v13 + v10;
    if (qword_1002B6948 != -1) {
      dispatch_once(&qword_1002B6948, &stru_1002418D0);
    }
    [(id)qword_1002B6940 size];
    objc_msgSend((id)qword_1002B6940, "drawInRect:blendMode:alpha:", 22, v12 + v15 - v16, y, v16, height, 1.0);
  }

- (id)_imageForText:(BOOL)a3
{
  BOOL v3 = a3;
  -[TVMTAnimatedLabel bounds](self, "bounds");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[TVMTAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
  double v14 = v13;
  double v15 = v10;
  if (v3)
  {
    -[TVMTAnimatedLabel replicationPadding](self, "replicationPadding");
    double v15 = v14 + v10 + v16;
  }

  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel backgroundColor](self, "backgroundColor"));
  double v18 = fabs(v15);
  if (fabs(v12) <= 2.22044605e-16 || v18 <= 2.22044605e-16)
  {
    double v20 = 0LL;
  }

  else
  {
    v28.double width = v15;
    v28.double height = v12;
    UIGraphicsBeginImageContextWithOptions(v28, 0, 0.0);
    if (v17)
    {
      [v17 set];
      v29.origin.double x = 0.0;
      v29.origin.double y = 0.0;
      v29.size.double width = v15;
      v29.size.double height = v12;
      UIRectFill(v29);
    }

    id v21 = -[TVMTAnimatedLabel textAlignment](self, "textAlignment");
    if (v3)
    {
      id v22 = v21;
      -[TVMTAnimatedLabel replicationPadding](self, "replicationPadding");
      double v24 = v14 + v23;
      -[TVMTAnimatedLabel setTextAlignment:](self, "setTextAlignment:", 0LL);
      -[TVMTAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", 0.0, 0.0, v14, v12);
      -[TVMTAnimatedLabel _drawFullMarqueeTextInRect:](self, "_drawFullMarqueeTextInRect:", v24, 0.0, v14, v12);
      -[TVMTAnimatedLabel setTextAlignment:](self, "setTextAlignment:", v22);
    }

    else
    {
      BOOL animating = self->_animating;
      self->_BOOL animating = 0;
      -[TVMTAnimatedLabel drawTextInRect:](self, "drawTextInRect:", v6, v8, v10, v12);
      self->_BOOL animating = animating;
    }

    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    double v20 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
  }

  return v20;
}

- (void)_nextAttributedString
{
  if (-[TVMTAnimatedLabel isAnimating](self, "isAnimating"))
  {
    if (-[TVMTAnimatedLabel _shouldCycle](self, "_shouldCycle"))
    {
      BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel nextMarqueeView](self, "nextMarqueeView"));
      unint64_t v5 = -[TVMTAnimatedLabel currentAttributedStringIndex](self, "currentAttributedStringIndex") + 1;
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel attributedStrings](self, "attributedStrings"));
      unint64_t v7 = v5 % (unint64_t)[v6 count];

      self->_currentAttributedStringIndedouble x = v7;
      self->_BOOL animating = 0;
      double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel attributedStrings](self, "attributedStrings"));
      double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndex:self->_currentAttributedStringIndex]);
      id v10 = [v9 copy];
      v23.receiver = self;
      v23.super_class = (Class)&OBJC_CLASS___TVMTAnimatedLabel;
      -[TVMTAnimatedLabel setAttributedText:](&v23, "setAttributedText:", v10);

      -[TVMTLabel setLineBreakMode:](self, "setLineBreakMode:", 2LL);
      -[TVMTAnimatedLabel _clearLabelTextContents](self, "_clearLabelTextContents");
      self->_BOOL animating = 1;
      double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel _imageForText:](self, "_imageForText:", 0LL));
      [v4 setImage:v11];

      double v12 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
      objc_msgSend(v12, "setContentsRect:", 0.0, 0.0, 1.0, 1.0);

      [v4 sizeToFit];
      -[TVMTAnimatedLabel bounds](self, "bounds");
      objc_msgSend(v4, "setFrame:");
      [v4 setHidden:0];
      [v4 setAlpha:0.0];
      -[TVMTAnimatedLabel crossfadeDuration](self, "crossfadeDuration");
      double v14 = v13;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100040024;
      v20[3] = &unk_100240240;
      id v21 = v3;
      id v22 = v4;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_100040054;
      v17[3] = &unk_1002418F8;
      v17[4] = self;
      id v18 = v22;
      id v19 = v21;
      id v15 = v21;
      id v16 = v22;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v20,  v17,  v14);
    }
  }

- (void)_prepareNextMarquee
{
  self->_marqueeing = 0;
  -[TVMTAnimatedLabel _nextAttributedString](self, "_nextAttributedString");
}

- (void)_clearLabelTextContents
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel layer](self, "layer"));
  [v3 setContents:0];

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel layer](self, "layer", 0LL));
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sublayers]);

  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      double v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)v9);
        double v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (BOOL)_shouldCycle
{
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel attributedStrings](self, "attributedStrings"));
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (void)_startMarqueeIfNeeded
{
  if (!self->_marqueeing && self->_animating && self->_marqueeNeeded)
  {
    self->_marqueeing = 1;
    -[TVMTAnimatedLabel bounds](self, "bounds");
    double v4 = v3;
    double v138 = v6;
    double v139 = v5;
    double v8 = v7;
    -[TVMTAnimatedLabel textSizeForWidth:](self, "textSizeForWidth:", 3.40282347e38);
    double v10 = v9;
    double v11 = v8;
    if (self->_marqueeNeeded)
    {
      -[TVMTAnimatedLabel replicationPadding](self, "replicationPadding");
      double v11 = v10 + v8 + v12;
    }

    -[TVMTAnimatedLabel replicationPadding](self, "replicationPadding");
    double v135 = v13;
    -[TVMTAnimatedLabel replicationPadding](self, "replicationPadding");
    double v15 = v10 + v14;
    -[TVMTAnimatedLabel scrollRate](self, "scrollRate");
    double v17 = v16;
    -[TVMTAnimatedLabel marqueeDelay](self, "marqueeDelay");
    double v19 = v18;
    -[TVMTAnimatedLabel replicationPadding](self, "replicationPadding");
    double v133 = v20;
    -[TVMTAnimatedLabel scrollRate](self, "scrollRate");
    float v22 = v21;
    v141[0] = _NSConcreteStackBlock;
    v141[1] = 3221225472LL;
    v141[2] = sub_10004119C;
    v141[3] = &unk_100241568;
    v141[4] = self;
    double v137 = v19;
    *(double *)&v141[5] = v19;
    objc_super v23 = objc_retainBlock(v141);
    double v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel currentMarqueeView](self, "currentMarqueeView"));
    double v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel _imageForText:](self, "_imageForText:", self->_marqueeNeeded));
    [v24 setImage:v25];

    double v26 = v4;
    double v27 = v8;
    if (fabs(self->_underPosterOutset) > 2.22044605e-16)
    {
      double v26 = v4;
      double v27 = v8;
      if (self->_marqueeNeeded)
      {
        objc_msgSend(v24, "setContentMode:", 7, v4);
        double underPosterOutset = self->_underPosterOutset;
        double v26 = v4 + underPosterOutset;
        double v27 = v8 - underPosterOutset;
      }
    }

    double v29 = v15 / v17;
    objc_msgSend(v24, "setFrame:", v26, v139, v27, v138);
    [v24 setHidden:0];
    -[CALayer removeAnimationForKey:]( self->_maskLayer,  "removeAnimationForKey:",  @"TVAnimatedLabelMarqueeMaskLayerPositionXAnimationKey");
    -[CALayer removeAnimationForKey:]( self->_maskLayer,  "removeAnimationForKey:",  @"TVAnimatedLabelMarqueeMaskLayerWidthAnimationKey");
    double v30 = (void *)objc_claimAutoreleasedReturnValue([v24 layer]);
    [v30 removeAnimationForKey:@"TVAnimatedLabelMarqueeLayerWidthAnimationKey"];

    v31 = (void *)objc_claimAutoreleasedReturnValue([v24 layer]);
    [v31 removeAnimationForKey:@"TVAnimatedLabelMarqueeLayerPositionXAnimationKey"];

    -[TVMTAnimatedLabel _clearLabelTextContents](self, "_clearLabelTextContents");
    double v32 = (void *)objc_claimAutoreleasedReturnValue([v24 layer]);
    objc_msgSend(v32, "setContentsRect:", 0.0, 0.0, v8 / v11, 1.0);

    if (self->_marqueeNeeded)
    {
      double v131 = v27;
      double v33 = (v10 + v133) / v22 - v29;
      double v34 = v137 + v29 + v33;
      if (qword_1002B6958 != -1) {
        dispatch_once(&qword_1002B6958, &stru_100241918);
      }
      double v35 = (v10 + v135) / v11;
      [(id)qword_1002B6950 size];
      double v37 = 1.0 / v36;
      v38 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](&OBJC_CLASS___CALayer, "layer"));
      maskLayer = self->_maskLayer;
      self->_maskLayer = v38;

      -[CALayer setContents:](self->_maskLayer, "setContents:", [(id)qword_1002B6950 CGImage]);
      -[CALayer setContentsCenter:](self->_maskLayer, "setContentsCenter:", 0.5 - v37 * 0.5, 0.0, v37, 1.0);
      [(id)qword_1002B6950 scale];
      -[CALayer setContentsScale:](self->_maskLayer, "setContentsScale:");
      -[CALayer setFrame:](self->_maskLayer, "setFrame:", v4, v139, v8, v138);
      v40 = self->_maskLayer;
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel layer](self, "layer"));
      [v41 setMask:v40];

      +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
      v136 = v23;
      +[CATransaction setCompletionBlock:](&OBJC_CLASS___CATransaction, "setCompletionBlock:", v23);
      double v42 = fabs(self->_underPosterOutset);
      v43 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"contentsRect.origin.x"));
      [v43 setDuration:v34];
      v140 = v43;
      objc_msgSend(v43, "setFillMode:");
      HIDWORD(v44) = 1018167296;
      v132 = v24;
      if (v42 <= 2.22044605e-16)
      {
        v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
        v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
        v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
        v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
        v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v89,  v90,  v91,  v92,  0LL));
        [v140 setValues:v93];

        v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
        v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v137 / v34));
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 1.0 - v33 / v34));
        v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 1.0));
        v98 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v94,  v95,  v96,  v97,  0LL));
        [v140 setKeyTimes:v98];

        v99 = (void *)objc_claimAutoreleasedReturnValue([v24 layer]);
        [v99 addAnimation:v140 forKey:@"TVAnimatedLabelMarqueeLayerContentOriginXAnimationKey"];

        v100 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"bounds.size.width"));
        [v100 setDuration:v34];
        [v100 setFillMode:kCAFillModeBoth];
        v101 = v100;
        v134 = v100;
        [v100 setRemovedOnCompletion:0];
        uint64_t v102 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8 + 20.0));
        v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8 + 20.0));
        v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
        v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
        v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8 + 20.0));
        v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8 + 20.0));
        v108 = (void *)v102;
        v109 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v102,  v103,  v104,  v105,  v106,  v107,  0LL));
        [v101 setValues:v109];

        uint64_t v110 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
        v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v137 / v34));
        -[TVMTAnimatedLabel scrollRate](self, "scrollRate");
        v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (v137 + 20.0 / v112) / v34));
        -[TVMTAnimatedLabel scrollRate](self, "scrollRate");
        v115 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  1.0 - (v33 + 20.0 / v114) / v34));
        v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 1.0 - v33 / v34));
        v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 1.0));
        v118 = (void *)v110;
        v119 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v110,  v111,  v113,  v115,  v116,  v117,  0LL));
        [v134 setKeyTimes:v119];

        v75 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"position.x"));
        [v75 setDuration:v34];
        [v75 setFillMode:kCAFillModeBoth];
        [v75 setRemovedOnCompletion:0];
        double v120 = (v8 + -20.0) * 0.5;
        uint64_t v121 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v120));
        v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v120));
        double v123 = v8 * 0.5;
        v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v123));
        v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v123));
        v126 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v120));
        v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v120));
        v128 = (void *)v121;
        v129 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v121,  v122,  v124,  v125,  v126,  v127,  0LL));
        [v75 setValues:v129];

        v81 = v134;
        double v24 = v132;

        v130 = (void *)objc_claimAutoreleasedReturnValue([v134 keyTimes]);
        [v75 setKeyTimes:v130];

        -[CALayer addAnimation:forKey:]( self->_maskLayer,  "addAnimation:forKey:",  v134,  @"TVAnimatedLabelMarqueeMaskLayerWidthAnimationKey");
        -[CALayer addAnimation:forKey:]( self->_maskLayer,  "addAnimation:forKey:",  v75,  @"TVAnimatedLabelMarqueeMaskLayerPositionXAnimationKey");
      }

      else
      {
        LODWORD(v44) = 0;
        dispatch_time_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v44));
        double v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
        double v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
        -[TVMTAnimatedLabel replicationPadding](self, "replicationPadding");
        double v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (v10 + v48 - self->_underPosterOutset) / v11));
        double v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v35));
        uint64_t v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
        double v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v45,  v46,  v47,  v49,  v50,  v51,  0LL));
        [v140 setValues:v52];

        LODWORD(v53) = 0;
        uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v53));
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v137 / v34));
        double v56 = self->_underPosterOutset;
        -[TVMTAnimatedLabel scrollRate](self, "scrollRate");
        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (v137 + v56 / v57) / v34));
        double v59 = self->_underPosterOutset;
        -[TVMTAnimatedLabel scrollRate](self, "scrollRate");
        v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  1.0 - (v33 + v59 / v60) / v34));
        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 1.0 - v33 / v34));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 1.0));
        v64 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v54,  v55,  v58,  v61,  v62,  v63,  0LL));
        [v140 setKeyTimes:v64];

        v65 = (void *)objc_claimAutoreleasedReturnValue([v132 layer]);
        [v65 addAnimation:v140 forKey:@"TVAnimatedLabelMarqueeLayerContentOriginXAnimationKey"];

        v66 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"bounds.size.width"));
        [v66 setDuration:v34];
        [v66 setFillMode:kCAFillModeBoth];
        [v66 setRemovedOnCompletion:0];
        v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v131));
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v131));
        v69 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v131 + self->_underPosterOutset));
        v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v131 + self->_underPosterOutset));
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v131));
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v131));
        v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v67,  v68,  v69,  v70,  v71,  v72,  0LL));
        [v66 setValues:v73];

        v74 = (void *)objc_claimAutoreleasedReturnValue([v140 keyTimes]);
        [v66 setKeyTimes:v74];

        v75 = (void *)objc_claimAutoreleasedReturnValue( +[CAKeyframeAnimation animationWithKeyPath:]( &OBJC_CLASS___CAKeyframeAnimation,  "animationWithKeyPath:",  @"position.x"));
        [v75 setDuration:v34];
        [v75 setFillMode:kCAFillModeBoth];
        [v75 setRemovedOnCompletion:0];
        uint64_t v76 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v131 * 0.5 + self->_underPosterOutset));
        v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v131 * 0.5 + self->_underPosterOutset));
        v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (v131 + self->_underPosterOutset) * 0.5));
        v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  (v131 + self->_underPosterOutset) * 0.5));
        v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v131 * 0.5 + self->_underPosterOutset));
        v81 = v66;
        v82 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithDouble:]( &OBJC_CLASS___NSNumber,  "numberWithDouble:",  v131 * 0.5 + self->_underPosterOutset));
        v83 = (void *)v76;
        v84 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  v76,  v77,  v78,  v79,  v80,  v82,  0LL));
        [v75 setValues:v84];

        double v24 = v132;
        v85 = (void *)objc_claimAutoreleasedReturnValue([v66 keyTimes]);
        [v75 setKeyTimes:v85];

        v86 = (void *)objc_claimAutoreleasedReturnValue([v132 layer]);
        [v86 addAnimation:v66 forKey:@"TVAnimatedLabelMarqueeLayerWidthAnimationKey"];

        v87 = (void *)objc_claimAutoreleasedReturnValue([v132 layer]);
        [v87 addAnimation:v75 forKey:@"TVAnimatedLabelMarqueeLayerPositionXAnimationKey"];
      }

      +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
      objc_super v23 = v136;
    }

    else
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel layer](self, "layer"));
      [v88 setMask:0];

      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_prepareNextMarquee",  0LL);
      -[TVMTAnimatedLabel performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_prepareNextMarquee",  0LL,  v29);
    }
  }

  else if (-[TVMTAnimatedLabel _shouldCycle](self, "_shouldCycle"))
  {
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_prepareNextMarquee",  0LL);
    -[TVMTAnimatedLabel marqueeDelay](self, "marqueeDelay");
    -[TVMTAnimatedLabel performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_prepareNextMarquee",  0LL);
  }

- (void)_applicationWillResignActiveNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel layer](self, "layer", a3));
  LODWORD(v3) = 0;
  [v4 setSpeed:v3];
  [v4 setTimeOffset:CACurrentMediaTime()];
}

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMTAnimatedLabel layer](self, "layer", a3));
  LODWORD(v3) = 1.0;
  [v4 setSpeed:v3];
  [v4 setTimeOffset:0.0];
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (double)marqueeDelay
{
  return self->_marqueeDelay;
}

- (void)setMarqueeDelay:(double)a3
{
  self->_marqueeDeladouble y = a3;
}

- (double)replicationPadding
{
  return self->_replicationPadding;
}

- (void)setReplicationPadding:(double)a3
{
  self->_replicationPadding = a3;
}

- (double)maskCapWidth
{
  return self->_maskCapWidth;
}

- (void)setMaskCapWidth:(double)a3
{
  self->_maskCapWidth = a3;
}

- (float)scrollRate
{
  return self->_scrollRate;
}

- (void)setScrollRate:(float)a3
{
  self->_scrollRate = a3;
}

- (double)crossfadeDuration
{
  return self->_crossfadeDuration;
}

- (void)setCrossfadeDuration:(double)a3
{
  self->_crossfadeDuration = a3;
}

- (NSArray)attributedStrings
{
  return self->_attributedStrings;
}

- (unint64_t)currentAttributedStringIndex
{
  return self->_currentAttributedStringIndex;
}

- (double)underPosterOutset
{
  return self->_underPosterOutset;
}

- (void)setUnderPosterOutset:(double)a3
{
  self->_double underPosterOutset = a3;
}

- (_TVAnimatedImageView)currentMarqueeView
{
  return (_TVAnimatedImageView *)objc_loadWeakRetained((id *)&self->_currentMarqueeView);
}

- (_TVAnimatedImageView)nextMarqueeView
{
  return (_TVAnimatedImageView *)objc_loadWeakRetained((id *)&self->_nextMarqueeView);
}

- (void).cxx_destruct
{
}

@end