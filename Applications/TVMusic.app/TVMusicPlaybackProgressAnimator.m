@interface TVMusicPlaybackProgressAnimator
- (BOOL)_getActualTime:(double *)a3;
- (BOOL)_getPlaybackDuration:(double *)a3;
- (BOOL)_getTargetTime:(double *)a3;
- (BOOL)_validateCurrentTime:(double)a3;
- (BOOL)_validatePlaybackDuration:(double)a3;
- (BOOL)isAnimating;
- (BOOL)isDragging;
- (CADisplayLink)displayLink;
- (TVMusicPlaybackProgressAnimation)animation;
- (TVMusicPlaybackProgressAnimator)init;
- (TVMusicPlaybackProgressAnimator)initWithTransportBarView:(id)a3;
- (TVMusicPlaybackProgressAnimatorDelegate)delegate;
- (TVMusicTransportBarView)transportBarView;
- (TVSStateMachine)stateMachine;
- (double)_presentedTime;
- (double)effectivePlaybackRate;
- (double)moderateAnimationDuration;
- (id)_nextStateByAnimatingLinearly;
- (id)_nextStateByDragging;
- (id)_nextStateByUpdatingWithAnimation:(id)a3;
- (void)_cancelAnimations;
- (void)_displayLinkFired:(id)a3;
- (void)_hidePlayhead;
- (void)_moveToElapsedTime:(double)a3 withAnimationDuration:(double)a4 timingFunctionName:(id)a5;
- (void)_setTargetTime:(double)a3;
- (void)_setupStateMachine;
- (void)_showPlayhead;
- (void)_updatePlaybackProgressForTransportBarView:(id)a3 withElapsedTime:(double)a4 playbackDuration:(double)a5;
- (void)_updateTransportBarView:(id)a3 withElapsedTime:(double)a4 playbackDuration:(double)a5;
- (void)_updateTransportBarViewWithAnimation:(id)a3;
- (void)beginDragging;
- (void)dealloc;
- (void)endDragging;
- (void)invalidate;
- (void)moveInstantaneouslyToElapsedTime:(double)a3;
- (void)moveModeratelyToElapsedTime:(double)a3;
- (void)moveQuicklyToElapsedTime:(double)a3;
- (void)setAnimation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setDragging:(BOOL)a3;
- (void)setEffectivePlaybackRate:(double)a3;
- (void)setPlaybackDuration:(double)a3;
- (void)setStateMachine:(id)a3;
@end

@implementation TVMusicPlaybackProgressAnimator

- (TVMusicPlaybackProgressAnimator)initWithTransportBarView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackProgressAnimator;
  v6 = -[TVMusicPlaybackProgressAnimator init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_transportBarView, a3);
    *(void *)&v7->_playbackDuration = TVPDurationUnknown;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  v7,  "_displayLinkFired:"));
    [v8 setPaused:1];
    -[TVMusicPlaybackProgressAnimator setDisplayLink:](v7, "setDisplayLink:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
    [v8 addToRunLoop:v9 forMode:NSRunLoopCommonModes];

    -[TVMusicPlaybackProgressAnimator _setupStateMachine](v7, "_setupStateMachine");
  }

  return v7;
}

- (TVMusicPlaybackProgressAnimator)init
{
  return 0LL;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVMusicPlaybackProgressAnimator;
  -[TVMusicPlaybackProgressAnimator dealloc](&v2, "dealloc");
}

- (id)_nextStateByAnimatingLinearly
{
  double v4 = v3;
  -[TVMusicPlaybackProgressAnimator _getPlaybackDuration:](self, "_getPlaybackDuration:", &v13);
  -[TVMusicPlaybackProgressAnimator effectivePlaybackRate](self, "effectivePlaybackRate");
  double v6 = v5;
  if (v5 <= 0.0)
  {
    double v7 = v4;
    if (v5 < 0.0) {
      double v7 = 0.0;
    }
  }

  else
  {
    double v7 = v13;
  }

  -[TVMusicPlaybackProgressAnimator _setTargetTime:](self, "_setTargetTime:", v7);
  v8 = objc_alloc_init(&OBJC_CLASS____TVMusicConstantRatePlaybackProgressAnimation);
  -[_TVMusicConstantRatePlaybackProgressAnimation setDelegate:](v8, "setDelegate:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  -[TVMusicPlaybackProgressAnimation setAnimationStartDate:](v8, "setAnimationStartDate:", v9);

  -[TVMusicPlaybackProgressAnimation setAnimationDuration:](v8, "setAnimationDuration:", fabs((v7 - v4) / v6));
  -[TVMusicPlaybackProgressAnimation setFromPlaybackTime:](v8, "setFromPlaybackTime:", v4);
  -[TVMusicPlaybackProgressAnimation setToPlaybackTime:](v8, "setToPlaybackTime:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  kCAMediaTimingFunctionLinear));
  -[TVMusicPlaybackProgressAnimation setMediaTimingFunction:](v8, "setMediaTimingFunction:", v10);

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlaybackProgressAnimator _nextStateByUpdatingWithAnimation:]( self,  "_nextStateByUpdatingWithAnimation:",  v8));
  return v11;
}

- (id)_nextStateByDragging
{
  double v3 = objc_alloc_init(&OBJC_CLASS____TVPDragPlaybackProgressAnimation);
  -[_TVPDragPlaybackProgressAnimation setDelegate:](v3, "setDelegate:", self);
  double v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicPlaybackProgressAnimator _nextStateByUpdatingWithAnimation:]( self,  "_nextStateByUpdatingWithAnimation:",  v3));

  return v4;
}

- (void)_updateTransportBarView:(id)a3 withElapsedTime:(double)a4 playbackDuration:(double)a5
{
  id v9 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator delegate](self, "delegate"));
  [v8 playbackProgressAnimator:self updateTitlesForElapsedTime:a4 withPlaybackDuration:a5];

  -[TVMusicPlaybackProgressAnimator _updatePlaybackProgressForTransportBarView:withElapsedTime:playbackDuration:]( self,  "_updatePlaybackProgressForTransportBarView:withElapsedTime:playbackDuration:",  v9,  a4,  a5);
  [v9 layoutIfNeeded];
}

- (id)_nextStateByUpdatingWithAnimation:(id)a3
{
  id v4 = a3;
  -[TVMusicPlaybackProgressAnimator _getTargetTime:](self, "_getTargetTime:", &v11);
  -[TVMusicPlaybackProgressAnimator _getPlaybackDuration:](self, "_getPlaybackDuration:", &v10);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator transportBarView](self, "transportBarView"));
  if (!v4)
  {
    -[TVMusicPlaybackProgressAnimator _updateTransportBarView:withElapsedTime:playbackDuration:]( self,  "_updateTransportBarView:withElapsedTime:playbackDuration:",  v5,  v11,  v10);
    if (-[TVMusicPlaybackProgressAnimator isDragging](self, "isDragging"))
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator _nextStateByDragging](self, "_nextStateByDragging"));
    }

    else
    {
      -[TVMusicPlaybackProgressAnimator effectivePlaybackRate](self, "effectivePlaybackRate");
      if (v8 == 0.0)
      {
        double v6 = @"Motionless at Elapsed Time Target";
        goto LABEL_9;
      }

      uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator _nextStateByAnimatingLinearly](self, "_nextStateByAnimatingLinearly"));
    }

    double v6 = (__CFString *)v7;
    goto LABEL_9;
  }

  -[TVMusicPlaybackProgressAnimator _updateTransportBarViewWithAnimation:]( self,  "_updateTransportBarViewWithAnimation:",  v4);
  double v6 = @"Animating to Elapsed Time Target";
LABEL_9:

  return v6;
}

- (void)_setupStateMachine
{
  objc_super v2 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  id v4 = (objc_class *)objc_opt_class(self, v3);
  double v5 = NSStringFromClass(v4);
  double v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = -[TVSStateMachine initWithName:initialState:mode:]( v2,  "initWithName:initialState:mode:",  v6,  @"Invalid",  0LL);

  -[TVSStateMachine setLogObject:](v7, "setLogObject:", qword_1002BE8E0);
  v75[0] = @"Playback Duration Became Valid";
  v75[1] = @"Received Valid Elapsed Time Target";
  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v75, 2LL));
  v74 = @"Invalid";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v74, 1LL));
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10004E490;
  v51[3] = &unk_100268B58;
  objc_copyWeak(&v52, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v8,  v9,  v51);

  v73[0] = @"Playback Rate Changed from Zero";
  v73[1] = @"Non-Zero Playback Rate Changed";
  double v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 2LL));
  v72 = @"Invalid";
  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v72, 1LL));
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10004E590;
  v49[3] = &unk_100268B58;
  objc_copyWeak(&v50, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v10,  v11,  v49);

  v71[0] = @"Playback Duration Became Invalid";
  v71[1] = @"Received Invalid Elapsed Time Target";
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v71, 2LL));
  v70 = @"Invalid";
  double v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v70, 1LL));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10004E638;
  v47[3] = &unk_100268B58;
  objc_copyWeak(&v48, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v12,  v13,  v47);

  v69[0] = @"Playback Duration Became Invalid";
  v69[1] = @"Received Invalid Elapsed Time Target";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v69, 2LL));
  v68 = @"Motionless at Elapsed Time Target";
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v68, 1LL));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10004E690;
  v45[3] = &unk_100268B58;
  objc_copyWeak(&v46, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v14,  v15,  v45);

  v67 = @"Playback Rate Changed from Zero";
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v67, 1LL));
  v66 = @"Motionless at Elapsed Time Target";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v66, 1LL));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10004E6C4;
  v43[3] = &unk_100268B58;
  objc_copyWeak(&v44, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v16,  v17,  v43);

  v65 = @"Received Valid Elapsed Time Target";
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v65, 1LL));
  v64 = @"Motionless at Elapsed Time Target";
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_10004E6FC;
  v41[3] = &unk_100268B58;
  objc_copyWeak(&v42, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v18,  v19,  v41);

  v63[0] = @"Playback Duration Became Invalid";
  v63[1] = @"Received Invalid Elapsed Time Target";
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 2LL));
  v62 = @"Animating to Elapsed Time Target";
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v62, 1LL));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10004E750;
  v39[3] = &unk_100268B58;
  objc_copyWeak(&v40, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v20,  v21,  v39);

  v61 = @"Animation did finish";
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v61, 1LL));
  v60 = @"Animating to Elapsed Time Target";
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v60, 1LL));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10004E78C;
  v37[3] = &unk_100268B58;
  objc_copyWeak(&v38, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v22,  v23,  v37);

  v59 = @"Playback Rate Changed to Zero";
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v59, 1LL));
  v58 = @"Animating to Elapsed Time Target";
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v58, 1LL));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_10004E7FC;
  v35[3] = &unk_100268B58;
  objc_copyWeak(&v36, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v24,  v25,  v35);

  v57 = @"Non-Zero Playback Rate Changed";
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v57, 1LL));
  v56 = @"Animating to Elapsed Time Target";
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v56, 1LL));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_10004E8C4;
  v33[3] = &unk_100268B58;
  objc_copyWeak(&v34, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v26,  v27,  v33);

  v55 = @"Received Valid Elapsed Time Target";
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v55, 1LL));
  v54 = @"Animating to Elapsed Time Target";
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v54, 1LL));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10004E95C;
  v31[3] = &unk_100268B58;
  objc_copyWeak(&v32, &location);
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v7,  "registerHandlerForEvents:onStates:withBlock:",  v28,  v29,  v31);

  -[TVSStateMachine setShouldAcceptEvents:](v7, "setShouldAcceptEvents:", 1LL);
  -[TVMusicPlaybackProgressAnimator setStateMachine:](self, "setStateMachine:", v7);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);

  objc_destroyWeak(&location);
}

- (BOOL)_validateCurrentTime:(double)a3
{
  BOOL v3 = (*(void *)&a3 & 0x7FFFFFFFFFFFFFFFLL) == 0;
  return ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000LL) >> 53 < 0x3FF && a3 >= 0.0 || v3;
}

- (BOOL)_getTargetTime:(double *)a3
{
  double targetTime = self->_targetTime;
  if (a3) {
    *a3 = targetTime;
  }
  return -[TVMusicPlaybackProgressAnimator _validateCurrentTime:](self, "_validateCurrentTime:", targetTime);
}

- (BOOL)_validatePlaybackDuration:(double)a3
{
  return TVPDurationIndefinite != a3 && TVPDurationUnknown != a3;
}

- (BOOL)_getPlaybackDuration:(double *)a3
{
  double playbackDuration = self->_playbackDuration;
  if (a3) {
    *a3 = playbackDuration;
  }
  return -[TVMusicPlaybackProgressAnimator _validatePlaybackDuration:]( self,  "_validatePlaybackDuration:",  playbackDuration);
}

- (void)_updateTransportBarViewWithAnimation:(id)a3
{
  BOOL v4 = a3 == 0LL;
  id v6 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator displayLink](self, "displayLink"));
  [v5 setPaused:v4];

  -[TVMusicPlaybackProgressAnimator setAnimation:](self, "setAnimation:", v6);
}

- (void)_cancelAnimations
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator displayLink](self, "displayLink"));
  [v3 setPaused:1];
}

- (void)_displayLinkFired:(id)a3
{
  if (-[TVMusicPlaybackProgressAnimator _getPlaybackDuration:](self, "_getPlaybackDuration:", &v13))
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator animation](self, "animation"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v4 setCurrentDate:v5];

    [v4 currentPlaybackTime];
    if (v6 >= 0.0) {
      double v7 = v6;
    }
    else {
      double v7 = 0.0;
    }
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator transportBarView](self, "transportBarView"));
    -[TVMusicPlaybackProgressAnimator _updateTransportBarView:withElapsedTime:playbackDuration:]( self,  "_updateTransportBarView:withElapsedTime:playbackDuration:",  v8,  v7,  v13);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v9, "playbackProgressAnimator:didPresentElapsedTime:") & 1) != 0) {
      [v9 playbackProgressAnimator:self didPresentElapsedTime:v7];
    }
    uint64_t v11 = objc_opt_class(&OBJC_CLASS____TVPDragPlaybackProgressAnimation, v10);
    if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0) {
      -[TVMusicPlaybackProgressAnimator _setTargetTime:](self, "_setTargetTime:", v7);
    }
    if ([v4 isFinished])
    {
      if ((objc_opt_respondsToSelector(v9, "playbackProgressAnimator:didFinishAnimatingToElapsedTime:") & 1) != 0) {
        [v9 playbackProgressAnimator:self didFinishAnimatingToElapsedTime:v7];
      }
      -[TVMusicPlaybackProgressAnimator _cancelAnimations](self, "_cancelAnimations");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator stateMachine](self, "stateMachine"));
      [v12 postEvent:@"Animation did finish"];
    }
  }

- (BOOL)_getActualTime:(double *)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator delegate](self, "delegate"));
  char v6 = objc_opt_respondsToSelector(v5, "currentElapsedTimeForPlaybackProgressAnimator:");
  char v7 = v6;
  if (a3 && (v6 & 1) != 0)
  {
    [v5 currentElapsedTimeForPlaybackProgressAnimator:self];
    *(void *)a3 = v8;
  }

  return v7 & 1;
}

- (double)_presentedTime
{
  unsigned int v3 = -[TVMusicPlaybackProgressAnimator _getPlaybackDuration:](self, "_getPlaybackDuration:", &v8);
  double result = 0.0;
  if (v3)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator transportBarView](self, "transportBarView", 0.0));
    [v5 presentedPlaybackProgress];
    double v7 = v6;

    return v7 * v8;
  }

  return result;
}

- (void)_updatePlaybackProgressForTransportBarView:(id)a3 withElapsedTime:(double)a4 playbackDuration:(double)a5
{
  id v9 = a3;
  double v8 = 0.0;
  if (-[TVMusicPlaybackProgressAnimator _validateCurrentTime:](self, "_validateCurrentTime:", a4)
    && -[TVMusicPlaybackProgressAnimator _validatePlaybackDuration:](self, "_validatePlaybackDuration:", a5))
  {
    double v8 = a4 / a5;
  }

  [v9 setPlaybackProgress:v8];
}

- (void)_showPlayhead
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator transportBarView](self, "transportBarView"));
  [v2 setLabelAlpha:1.0];
  [v2 setPlayerHeadAlpha:1.0];
}

- (void)_hidePlayhead
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator transportBarView](self, "transportBarView"));
  [v2 setLabelAlpha:0.0];
  [v2 setPlayerHeadAlpha:0.0];
  [v2 setPlaybackProgress:0.0];
}

- (void)_setTargetTime:(double)a3
{
  if (self->_targetTime != a3) {
    self->_double targetTime = a3;
  }
}

- (void)_moveToElapsedTime:(double)a3 withAnimationDuration:(double)a4 timingFunctionName:(id)a5
{
  id v13 = a5;
  -[TVMusicPlaybackProgressAnimator _setTargetTime:](self, "_setTargetTime:", a3);
  if (-[TVMusicPlaybackProgressAnimator _validateCurrentTime:](self, "_validateCurrentTime:", a3))
  {
    if (a4 > 0.0 && v13)
    {
      double v8 = objc_alloc_init(&OBJC_CLASS___TVMusicPlaybackProgressAnimation);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      -[TVMusicPlaybackProgressAnimation setAnimationStartDate:](v8, "setAnimationStartDate:", v9);

      -[TVMusicPlaybackProgressAnimation setAnimationDuration:](v8, "setAnimationDuration:", a4);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[CAMediaTimingFunction functionWithName:]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithName:",  v13));
      -[TVMusicPlaybackProgressAnimation setMediaTimingFunction:](v8, "setMediaTimingFunction:", v10);

      -[TVMusicPlaybackProgressAnimator _presentedTime](self, "_presentedTime");
      -[TVMusicPlaybackProgressAnimation setFromPlaybackTime:](v8, "setFromPlaybackTime:");
      -[TVMusicPlaybackProgressAnimation setToPlaybackTime:](v8, "setToPlaybackTime:", a3);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator stateMachine](self, "stateMachine"));
      [v11 postEvent:@"Received Valid Elapsed Time Target" withContext:v8 userInfo:0];
    }

    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator stateMachine](self, "stateMachine"));
      [v12 postEvent:@"Received Valid Elapsed Time Target"];

      double v8 = (TVMusicPlaybackProgressAnimation *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator delegate](self, "delegate"));
      if ((objc_opt_respondsToSelector(v8, "playbackProgressAnimator:didPresentElapsedTime:") & 1) != 0) {
        -[TVMusicPlaybackProgressAnimation playbackProgressAnimator:didPresentElapsedTime:]( v8,  "playbackProgressAnimator:didPresentElapsedTime:",  self,  a3);
      }
    }
  }

  else
  {
    double v8 = (TVMusicPlaybackProgressAnimation *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator stateMachine](self, "stateMachine"));
    -[TVMusicPlaybackProgressAnimation postEvent:](v8, "postEvent:", @"Received Invalid Elapsed Time Target");
  }
}

- (void)setPlaybackDuration:(double)a3
{
  if (self->_playbackDuration != a3)
  {
    self->_double playbackDuration = a3;
    if (-[TVMusicPlaybackProgressAnimator _validatePlaybackDuration:](self, "_validatePlaybackDuration:")) {
      BOOL v4 = @"Playback Duration Became Valid";
    }
    else {
      BOOL v4 = @"Playback Duration Became Invalid";
    }
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator stateMachine](self, "stateMachine"));
    [v5 postEvent:v4];
  }

- (void)setEffectivePlaybackRate:(double)a3
{
  if (fabs(a3) == INFINITY) {
    a3 = 0.0;
  }
  double effectivePlaybackRate = self->_effectivePlaybackRate;
  if (effectivePlaybackRate != a3)
  {
    self->_double effectivePlaybackRate = a3;
    if (effectivePlaybackRate == 0.0)
    {
      BOOL v4 = @"Playback Rate Changed from Zero";
    }

    else if (a3 == 0.0)
    {
      BOOL v4 = @"Playback Rate Changed to Zero";
    }

    else
    {
      BOOL v4 = @"Non-Zero Playback Rate Changed";
    }

    id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator stateMachine](self, "stateMachine"));
    [v5 postEvent:v4];
  }

- (void)beginDragging
{
  if (!-[TVMusicPlaybackProgressAnimator isDragging](self, "isDragging"))
  {
    -[TVMusicPlaybackProgressAnimator setDragging:](self, "setDragging:", 1LL);
    BOOL v4 = objc_alloc_init(&OBJC_CLASS____TVPDragPlaybackProgressAnimation);
    -[_TVPDragPlaybackProgressAnimation setDelegate:](v4, "setDelegate:", self);
    unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator stateMachine](self, "stateMachine"));
    [v3 postEvent:@"Received Valid Elapsed Time Target" withContext:v4 userInfo:0];
  }

- (void)endDragging
{
  if (-[TVMusicPlaybackProgressAnimator isDragging](self, "isDragging")) {
    -[TVMusicPlaybackProgressAnimator setDragging:](self, "setDragging:", 0LL);
  }
}

- (BOOL)isAnimating
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator stateMachine](self, "stateMachine"));
  unsigned int v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 currentState]);
  BOOL v4 = v3 == @"Animating to Elapsed Time Target";

  return v4;
}

- (double)moderateAnimationDuration
{
  return 0.5;
}

- (void)moveInstantaneouslyToElapsedTime:(double)a3
{
}

- (void)moveQuicklyToElapsedTime:(double)a3
{
}

- (void)moveModeratelyToElapsedTime:(double)a3
{
}

- (void)invalidate
{
  unsigned int v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator displayLink](self, "displayLink"));
  [v3 invalidate];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicPlaybackProgressAnimator stateMachine](self, "stateMachine"));
  [v4 deregisterHandlers];
}

- (TVMusicTransportBarView)transportBarView
{
  return self->_transportBarView;
}

- (TVMusicPlaybackProgressAnimatorDelegate)delegate
{
  return (TVMusicPlaybackProgressAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (double)effectivePlaybackRate
{
  return self->_effectivePlaybackRate;
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (CADisplayLink)displayLink
{
  return (CADisplayLink *)objc_loadWeakRetained((id *)&self->_displayLink);
}

- (void)setDisplayLink:(id)a3
{
}

- (TVMusicPlaybackProgressAnimation)animation
{
  return self->_animation;
}

- (void)setAnimation:(id)a3
{
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (void).cxx_destruct
{
}

@end