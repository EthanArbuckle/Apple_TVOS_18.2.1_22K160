@interface TVMusicAudioTransportBarView
- (BOOL)isScrubberFocused;
- (BOOL)supportsThumbnailView;
- (TVMusicDurationValueTransformer)durationTransformer;
- (UILabel)audioElapsedTimeLabel;
- (double)dimmingAlpha;
- (id)createProgressBarView;
- (id)preferredFocusEnvironments;
- (void)_showStateForProgressBar:(id)a3 focused:(BOOL)a4;
- (void)configureAppearanceForTrackChange;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)setAudioElapsedTimeLabel:(id)a3;
- (void)setDurationTransformer:(id)a3;
- (void)setElapsedTimeTitle:(id)a3;
- (void)setIsLive:(BOOL)a3;
- (void)transitionAudioPlayerHeadToFocusedState:(BOOL)a3;
@end

@implementation TVMusicAudioTransportBarView

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVMusicAudioTransportBarView;
  -[TVMusicTransportBarView layoutSubviews](&v10, "layoutSubviews");
  if (!self->_didInitializeProgressBar)
  {
    -[UILabel setShadowBlur:](self->_audioElapsedTimeLabel, "setShadowBlur:", 6.0);
    audioElapsedTimeLabel = self->_audioElapsedTimeLabel;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 colorWithAlphaComponent:0.32]);
    -[UILabel setShadowColor:](audioElapsedTimeLabel, "setShadowColor:", v5);

    -[UILabel setShadowOffset:](self->_audioElapsedTimeLabel, "setShadowOffset:", CGSizeZero.width, CGSizeZero.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[TVMusicTransportBarView setPlayerHeadColor:](self, "setPlayerHeadColor:", v6);

    LODWORD(v7) = 0;
    -[TVMusicTransportBarView setPlayerHeadShadowOpacity:](self, "setPlayerHeadShadowOpacity:", v7);
    -[TVMusicTransportBarView setShouldUseAlternateElapsedTimeAccessory:]( self,  "setShouldUseAlternateElapsedTimeAccessory:",  1LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicAudioTransportBarView audioElapsedTimeLabel](self, "audioElapsedTimeLabel"));
    -[TVMusicTransportBarView setAlternateElapsedTimeAccessory:](self, "setAlternateElapsedTimeAccessory:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView progressBarView](self, "progressBarView"));
    -[TVMusicAudioTransportBarView _showStateForProgressBar:focused:]( self,  "_showStateForProgressBar:focused:",  v9,  -[TVMusicAudioTransportBarView isFocused](self, "isFocused"));

    self->_didInitializeProgressBar = 1;
  }

- (BOOL)isScrubberFocused
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView progressBarView](self, "progressBarView"));
  unsigned __int8 v3 = [v2 isFocused];

  return v3;
}

- (void)setIsLive:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVMusicAudioTransportBarView;
  -[TVMusicTransportBarView setIsLive:](&v7, "setIsLive:");
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"NowPlayingLive" value:&stru_100279068 table:0]);
    -[TVMusicAudioTransportBarView setElapsedTimeTitle:](self, "setElapsedTimeTitle:", v6);
  }

- (id)preferredFocusEnvironments
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView progressBarView](self, "progressBarView"));
  BOOL v3 = (void *)v2;
  if (v2)
  {
    uint64_t v6 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  }

  else
  {
    v4 = &__NSArray0__struct;
  }

  return v4;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicAudioTransportBarView;
  id v6 = a4;
  -[TVMusicAudioTransportBarView didUpdateFocusInContext:withAnimationCoordinator:]( &v8,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000857D4;
  v7[3] = &unk_100268CF0;
  v7[4] = self;
  [v6 addCoordinatedAnimations:v7 completion:0];
}

- (void)_showStateForProgressBar:(id)a3 focused:(BOOL)a4
{
}

- (UILabel)audioElapsedTimeLabel
{
  audioElapsedTimeLabel = self->_audioElapsedTimeLabel;
  if (!audioElapsedTimeLabel)
  {
    v4 = -[UILabel initWithFrame:]( objc_alloc(&OBJC_CLASS___UILabel),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
    v5 = self->_audioElapsedTimeLabel;
    self->_audioElapsedTimeLabel = v4;

    id v6 = self->_audioElapsedTimeLabel;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v7 colorWithAlphaComponent:0.5]);
    -[UILabel setTextColor:](v6, "setTextColor:", v8);

    v9 = self->_audioElapsedTimeLabel;
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView timeFont](self, "timeFont"));
    -[UILabel setFont:](v9, "setFont:", v10);

    -[UILabel setTextAlignment:](self->_audioElapsedTimeLabel, "setTextAlignment:", 1LL);
    -[UILabel setOpaque:](self->_audioElapsedTimeLabel, "setOpaque:", 0LL);
    v11 = self->_audioElapsedTimeLabel;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v11, "setBackgroundColor:", v12);

    audioElapsedTimeLabel = self->_audioElapsedTimeLabel;
  }

  return audioElapsedTimeLabel;
}

- (void)transitionAudioPlayerHeadToFocusedState:(BOOL)a3
{
  audioElapsedTimeLabel = self->_audioElapsedTimeLabel;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
  objc_super v7 = v6;
  if (a3)
  {
    -[UILabel setTextColor:](audioElapsedTimeLabel, "setTextColor:", v6);

    -[TVMusicTransportBarView setAlternateElapsedTimeAccessoryIsInScrubMode:]( self,  "setAlternateElapsedTimeAccessoryIsInScrubMode:",  1LL);
    -[TVMusicTransportBarView setPlayerHeadSize:](self, "setPlayerHeadSize:", 2.0, 16.0);
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView playerHead](self, "playerHead"));
    -[TVMusicTransportBarView playerHeadFrame](self, "playerHeadFrame");
    objc_msgSend(v8, "setFrame:");

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView playerHead](self, "playerHead"));
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 layer]);
    [v10 setCornerRadius:1.0];

    id v18 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView playerHead](self, "playerHead"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v18 layer]);
    v12 = v11;
    uint64_t v13 = 1LL;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 colorWithAlphaComponent:0.5]);
    -[UILabel setTextColor:](audioElapsedTimeLabel, "setTextColor:", v14);

    -[TVMusicTransportBarView setAlternateElapsedTimeAccessoryIsInScrubMode:]( self,  "setAlternateElapsedTimeAccessoryIsInScrubMode:",  0LL);
    -[TVMusicTransportBarView setPlayerHeadSize:](self, "setPlayerHeadSize:", 1.0, 14.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView playerHead](self, "playerHead"));
    -[TVMusicTransportBarView playerHeadFrame](self, "playerHeadFrame");
    objc_msgSend(v15, "setFrame:");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView playerHead](self, "playerHead"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 layer]);
    [v17 setCornerRadius:0.0];

    id v18 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicTransportBarView playerHead](self, "playerHead"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v18 layer]);
    v12 = v11;
    uint64_t v13 = 0LL;
  }

  [v11 setMasksToBounds:v13];
}

- (void)configureAppearanceForTrackChange
{
  durationTransformer = self->_durationTransformer;
  if (!durationTransformer)
  {
    v4 = objc_opt_new(&OBJC_CLASS___TVMusicDurationValueTransformer);
    v5 = self->_durationTransformer;
    self->_durationTransformer = v4;

    durationTransformer = self->_durationTransformer;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicDurationValueTransformer transformedValue:]( durationTransformer,  "transformedValue:",  &off_100281958));
  -[TVMusicAudioTransportBarView setElapsedTimeTitle:](self, "setElapsedTimeTitle:", v6);

  -[TVMusicTransportBarView setRightEdgeTitle:](self, "setRightEdgeTitle:", &stru_100279068);
  -[TVMusicTransportBarView setLabelAlpha:](self, "setLabelAlpha:", 1.0);
  -[TVMusicTransportBarView setPlayerHeadAlpha:](self, "setPlayerHeadAlpha:", 1.0);
}

- (void)setElapsedTimeTitle:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_audioElapsedTimeLabel, "text"));
  id v6 = [v5 length];
  id v7 = [v4 length];

  -[UILabel setText:](self->_audioElapsedTimeLabel, "setText:", v4);
  if (v6 != v7) {
    -[UILabel sizeToFit](self->_audioElapsedTimeLabel, "sizeToFit");
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVMusicAudioTransportBarView;
  -[TVMusicTransportBarView setElapsedTimeTitle:](&v8, "setElapsedTimeTitle:", v4);
  -[TVMusicAudioTransportBarView setNeedsLayout](self, "setNeedsLayout");
}

- (id)createProgressBarView
{
  return  -[TVMusicProgressBarView initWithBarView:]( objc_alloc(&OBJC_CLASS___TVMusicProgressBarView),  "initWithBarView:",  0LL);
}

- (double)dimmingAlpha
{
  return 0.2;
}

- (BOOL)supportsThumbnailView
{
  return 0;
}

- (void)setAudioElapsedTimeLabel:(id)a3
{
}

- (TVMusicDurationValueTransformer)durationTransformer
{
  return self->_durationTransformer;
}

- (void)setDurationTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end