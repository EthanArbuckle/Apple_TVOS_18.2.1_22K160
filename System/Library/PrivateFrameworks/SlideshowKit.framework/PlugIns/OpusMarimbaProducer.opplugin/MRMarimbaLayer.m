@interface MRMarimbaLayer
+ (BOOL)shouldRenderOnBackgroundThread;
+ (MRMarimbaLayer)allocWithZone:(_NSZone *)a3;
+ (MRMarimbaLayer)layerWithDocument:(id)a3;
+ (MRMarimbaLayer)layerWithDocument:(id)a3 size:(CGSize)a4;
+ (void)releaseResources;
- (BOOL)_effectRequestedSlides:(id)a3;
- (BOOL)_nearingEndForSerializer:(id)a3;
- (BOOL)bailTimeWatcher;
- (BOOL)beginLiveUpdateForHitBlob:(id)a3;
- (BOOL)correctsForAutorotation;
- (BOOL)displaysFPS;
- (BOOL)effect:(id)a3 requestedNumberOfSlides:(unint64_t)a4 firstSlideIndexStillNeeded:(unint64_t)a5;
- (BOOL)enableSlideDidChangeNotification;
- (BOOL)endLiveUpdateForHitBlob:(id)a3;
- (BOOL)getOnScreenVertices:(CGPoint)a3[4] forHitBlob:(id)a4;
- (BOOL)interactivityIsEnabled;
- (BOOL)isAboutToPlay;
- (BOOL)isAsynchronous;
- (BOOL)isInTransition;
- (BOOL)isPlaying;
- (BOOL)isReadonly;
- (BOOL)nearingEndForSerializer:(id)a3;
- (BOOL)rendererSizeIsLocked;
- (BOOL)slidesAreReadonly;
- (BOOL)stopWithVideo;
- (BOOL)updateFramebuffer;
- (CGImage)snapshotAsCGImage;
- (CGImage)snapshotAsCGImageForTime:(double)a3 withSize:(CGSize)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toHitBlob:(id)a4;
- (CGSize)size;
- (MPDocument)document;
- (MRMarimbaLayer)init;
- (MRRenderer)renderer;
- (double)framesPerSecond;
- (double)relativeTime;
- (double)relativeTimeForBackgroundAudio;
- (double)relativeTimeForLayer:(id)a3;
- (double)startTimeForSlide:(id)a3;
- (double)time;
- (double)timeForSlide:(id)a3;
- (double)timeRemaining;
- (double)volume;
- (id)_currentEffectContainer;
- (id)_currentEffectLayer;
- (id)_effectContainerForTime:(double)a3;
- (id)_firstEffectContainer;
- (id)blobHitAtPoint:(CGPoint)a3 fromObjectsForObjectIDs:(id)a4 localPoint:(CGPoint *)a5;
- (id)currentSlide;
- (id)currentSlides;
- (id)displayedEffectContainers;
- (id)lastSlideChange;
- (int64_t)_mainLayerIndex;
- (void)_postNotificationForSlideChange:(id)a3;
- (void)_reauthorForAspectRatioChange;
- (void)_slideDidAppear:(id)a3;
- (void)beginEditingOfText:(id)a3;
- (void)beginGesture:(id)a3;
- (void)beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5 switchToDocument:(id)a6;
- (void)callbackThread:(id)a3;
- (void)cancelGesture:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)destroyFramebuffer;
- (void)didAddEffects:(id)a3;
- (void)didApplyStyle:(id)a3;
- (void)didLiveChanged:(id)a3;
- (void)doGesture:(id)a3;
- (void)endGesture:(id)a3;
- (void)endMorphing;
- (void)goBack;
- (void)goForth;
- (void)gotoBeginning;
- (void)gotoEnd;
- (void)gotoNextSlide;
- (void)gotoNextSlide:(BOOL)a3;
- (void)gotoNextSlideLegacy;
- (void)gotoPreviousSlide;
- (void)gotoPreviousSlide:(BOOL)a3;
- (void)gotoPreviousSlideLegacy;
- (void)gotoSlide:(id)a3;
- (void)gotoSlideLegacy:(id)a3;
- (void)gotoText:(id)a3;
- (void)moveToEffectContainer:(id)a3 withStartOffset:(double)a4 toStopOffset:(double)a5 blocking:(BOOL)a6;
- (void)moveToNextEffectContainer;
- (void)moveToPreviousEffectContainer;
- (void)moveToSubtitleForSlide:(id)a3;
- (void)moveToTitleSlide;
- (void)nextFrame;
- (void)pause;
- (void)pauseWhenStill;
- (void)play;
- (void)prevFrame;
- (void)removeEffectContainersBeforeTime:(double)a3;
- (void)requestRendering:(BOOL)a3;
- (void)setBailTimeWatcher:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentsScale:(double)a3;
- (void)setCorrectsForAutorotation:(BOOL)a3;
- (void)setDisplaysFPS:(BOOL)a3;
- (void)setDocument:(id)a3;
- (void)setEnableSlideDidChangeNotification:(BOOL)a3;
- (void)setFramesPerSecond:(double)a3;
- (void)setInteractivityIsEnabled:(BOOL)a3;
- (void)setIsAboutToPlay:(BOOL)a3;
- (void)setIsReadonly:(BOOL)a3;
- (void)setLastSlideChange:(id)a3;
- (void)setRendererSizeIsLocked:(BOOL)a3;
- (void)setSlidesAreReadonly:(BOOL)a3;
- (void)setStopWithVideo:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTime:(double)a3;
- (void)setVolume:(double)a3;
- (void)setupFaceDetection;
- (void)togglePlayback;
- (void)touchesBegan:(id)a3;
- (void)touchesCancelled:(id)a3;
- (void)touchesEnded:(id)a3;
- (void)touchesMoved:(id)a3;
- (void)updateSizeOfRenderer:(id)a3;
- (void)warmupRenderer;
- (void)watcherThread:(id)a3;
- (void)whenTransitionIsFinishedSendAction:(SEL)a3 toTarget:(id)a4;
@end

@implementation MRMarimbaLayer

- (double)relativeTime
{
  double v4 = v3;
  double result = 0.0;
  if (v4 > 0.0)
  {
    -[MRMarimbaLayer time](self, "time", 0.0);
    double v7 = v6;
    -[MPDocument videoDuration](-[MRMarimbaLayer document](self, "document"), "videoDuration");
    return fmod(v7, v8);
  }

  return result;
}

- (double)relativeTimeForBackgroundAudio
{
  double v4 = v3;
  double result = 0.0;
  if (v4 > 0.0)
  {
    -[MRMarimbaLayer time](self, "time", 0.0);
    double v7 = v6;
    objc_msgSend(-[MPDocument audioPlaylist](-[MRMarimbaLayer document](self, "document"), "audioPlaylist"), "duration");
    return fmod(v7, v8);
  }

  return result;
}

- (double)relativeTimeForLayer:(id)a3
{
  if ((char *)-[MPDocument loopingMode](-[MRMarimbaLayer document](self, "document"), "loopingMode") == (char *)&dword_0 + 2)
  {
    -[MRMarimbaLayer time](self, "time");
    double v6 = v5;
    [a3 timeIn];
    double v8 = v7;
    [a3 duration];
    return fmod(v6, v8 + v9);
  }

  else
  {
    -[MRMarimbaLayer relativeTime](self, "relativeTime");
  }

  return result;
}

- (id)displayedEffectContainers
{
  return +[MPUtilities effectContainersForTime:inDocument:]( &OBJC_CLASS___MPUtilities,  "effectContainersForTime:inDocument:",  -[MRMarimbaLayer document](self, "document"),  v3);
}

- (void)moveToEffectContainer:(id)a3 withStartOffset:(double)a4 toStopOffset:(double)a5 blocking:(BOOL)a6
{
  BOOL v6 = a6;
  [a3 startTime];
  if (a4 == -1.0)
  {
    -[MRMarimbaLayer setTime:](self, "setTime:", v10 + 0.00001 + a5);
  }

  else
  {
    double v11 = v10 - a4;
    double v12 = v10 + 0.00001;
    -[MRMarimbaLayer setTime:](self, "setTime:", v11);
    BOOL v13 = -[MRMarimbaLayer isPlaying](self, "isPlaying");
    if (!-[MRMarimbaLayer isPlaying](self, "isPlaying")) {
      -[MRMarimbaLayer play](self, "play");
    }
    double v14 = v12 + a5;
    -[MRMarimbaLayer setBailTimeWatcher:](self, "setBailTimeWatcher:", 0LL);
    if (v6) {
      -[MRMarimbaLayer performSelector:withObject:]( self,  "performSelector:withObject:",  "watcherThread:",  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14),  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13),  0LL));
    }
    else {
      +[NSThread detachNewThreadSelector:toTarget:withObject:]( &OBJC_CLASS___NSThread,  "detachNewThreadSelector:toTarget:withObject:",  "watcherThread:",  self,  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v14),  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v13),  0LL));
    }
  }

- (void)moveToNextEffectContainer
{
  id v3 = -[MRMarimbaLayer _currentEffectContainer](self, "_currentEffectContainer");
  if (v3)
  {
    double v4 = v3;
    id v5 = objc_msgSend(objc_msgSend(v3, "parentLayer"), "effectContainers");
    BOOL v6 = (char *)[v4 index];
    else {
      double v7 = 0LL;
    }
    id v8 = [v5 objectAtIndex:v7];
    if (v8)
    {
      id v9 = v8;
      [v8 introTransitionDuration];
      -[MRMarimbaLayer moveToEffectContainer:withStartOffset:toStopOffset:blocking:]( self,  "moveToEffectContainer:withStartOffset:toStopOffset:blocking:",  v9,  0LL,  -1.0,  v10);
    }
  }

- (void)moveToPreviousEffectContainer
{
  id v3 = -[MRMarimbaLayer _currentEffectContainer](self, "_currentEffectContainer");
  if (v3)
  {
    double v4 = v3;
    id v5 = objc_msgSend(objc_msgSend(v3, "parentLayer"), "effectContainers");
    BOOL v6 = (char *)[v4 index];
    id v7 = [v5 objectAtIndex:v6 - 1];
    if (v7)
    {
      id v8 = v7;
      [v7 introTransitionDuration];
      -[MRMarimbaLayer moveToEffectContainer:withStartOffset:toStopOffset:blocking:]( self,  "moveToEffectContainer:withStartOffset:toStopOffset:blocking:",  v8,  0LL,  -1.0,  v9);
    }
  }

- (void)moveToTitleSlide
{
  id v3 = -[MPDocument titleEffect](-[MRMarimbaLayer document](self, "document"), "titleEffect");
  if (v3)
  {
    double v4 = v3;
    id v5 = [v3 effectID];
    objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultPosterFrameTimeForEffectID:andPresetID:",  v5,  objc_msgSend(v4, "presetID"));
    double v7 = v6;
    if ((objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "posterTimeIsStaticForEffectID:andPresetID:",  v5,  objc_msgSend(v4, "presetID")) & 1) == 0)
    {
      id v8 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
      id v9 = [v4 formattedAttributes];
      id v10 = [v4 effectID];
      id v11 = [v4 slides];
      id v12 = [v4 texts];
      -[MPDocument aspectRatio](-[MRMarimbaLayer document](self, "document"), "aspectRatio");
      id v13 = objc_msgSend( v8,  "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:",  v10,  v9,  v11,  v12);
      if (v13)
      {
        double v14 = v13;
        [v4 fullDuration];
        double v16 = v15;
        [v14 mainDuration];
        double v18 = v17;
        [v14 phaseInDuration];
        double v20 = v18 + v19;
        [v14 phaseOutDuration];
        double v22 = v16 / (v20 + v21);
      }

      else
      {
        [v8 defaultMainDurationForEffectID:v5];
        double v24 = v23;
        [v8 defaultPhaseInDurationForEffectID:v5];
        double v26 = v25;
        [v8 defaultPhaseOutDurationForEffectID:v5];
        double v28 = v27;
        [v4 fullDuration];
        double v22 = v29 / (v24 + v26 + v28);
      }

      double v7 = v7 * v22;
    }

    -[MRMarimbaLayer setTime:](self, "setTime:", v7);
  }

- (void)moveToSubtitleForSlide:(id)a3
{
  id v4 = [a3 parentSubtitleEffect];
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 effectID];
    objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "defaultPosterFrameTimeForEffectID:andPresetID:",  v6,  objc_msgSend(v5, "presetID"));
    double v8 = v7;
    id v9 = +[MREffectManager sharedManager](&OBJC_CLASS___MREffectManager, "sharedManager");
    id v10 = [v5 formattedAttributes];
    id v11 = [v5 effectID];
    id v12 = [v5 slides];
    id v13 = [v5 texts];
    -[MPDocument aspectRatio](-[MRMarimbaLayer document](self, "document"), "aspectRatio");
    id v14 = objc_msgSend( v9,  "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:",  v11,  v10,  v12,  v13);
    if (v14)
    {
      double v15 = v14;
      [v5 fullDuration];
      double v17 = v16;
      [v15 mainDuration];
      double v19 = v18;
      [v15 phaseInDuration];
      double v21 = v19 + v20;
      [v15 phaseOutDuration];
      double v23 = v17 / (v21 + v22);
    }

    else
    {
      [v9 defaultMainDurationForEffectID:v6];
      double v25 = v24;
      [v9 defaultPhaseInDurationForEffectID:v6];
      double v27 = v26;
      [v9 defaultPhaseOutDurationForEffectID:v6];
      double v29 = v28;
      [v5 fullDuration];
      double v23 = v30 / (v25 + v27 + v29);
    }

    double v31 = v8 * v23;
    objc_msgSend(objc_msgSend(v5, "parentContainer"), "startTime");
    double v33 = v31 + v32;
    -[MPDocument videoDuration](-[MRMarimbaLayer document](self, "document"), "videoDuration");
    if (v33 < v34) {
      double v34 = v33;
    }
    -[MRMarimbaLayer setTime:](self, "setTime:", v34);
  }

- (id)_currentEffectLayer
{
  id v3 = -[MRMarimbaLayer document](self, "document");
  id v4 = -[MRMarimbaLayer _mainLayerIndex](self, "_mainLayerIndex");
  id result = -[MPDocument layers](v3, "layers");
  if (result)
  {
    id v6 = result;
    id result = [result count];
    if (result)
    {
      if (v4 >= [v6 count]) {
        id v4 = (char *)[v6 count] - 1;
      }
      id v7 = [v6 objectAtIndex:v4];
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v8);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0) {
        return v7;
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

- (id)_currentEffectContainer
{
  id v3 = -[MRMarimbaLayer document](self, "document");
  id v4 = -[MRMarimbaLayer displayedEffectContainers](self, "displayedEffectContainers");
  if (!v4) {
    return 0LL;
  }
  id v5 = v4;
  if (![v4 count]) {
    return 0LL;
  }
  id v6 = -[MRMarimbaLayer _mainLayerIndex](self, "_mainLayerIndex");
  id v7 = -[MPDocument layers](v3, "layers");
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = v7;
  if (![v7 count]) {
    return 0LL;
  }
  if (v6 >= [v8 count]) {
    id v6 = (char *)[v8 count] - 1;
  }
  id v9 = [v8 objectAtIndex:v6];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v10 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10) {
    goto LABEL_18;
  }
  id v11 = v10;
  id v12 = 0LL;
  uint64_t v13 = *(void *)v21;
  double v14 = -1.0;
  do
  {
    for (i = 0LL; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v5);
      }
      double v16 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
      if (v9 == [v16 parentLayer])
      {
        [v16 startTime];
        if (v17 > v14)
        {
          [v16 startTime];
          double v14 = v18;
          id v12 = v16;
        }
      }
    }

    id v11 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }

  while (v11);
  if (!v12)
  {
LABEL_18:
    id v12 = -[MRMarimbaLayer _firstEffectContainer](self, "_firstEffectContainer");
    if (!v12) {
      return -[MRMarimbaLayer _effectContainerForTime:](self, "_effectContainerForTime:", 0.0);
    }
  }

  return v12;
}

- (BOOL)isInTransition
{
  id v3 = -[MRMarimbaLayer _currentEffectContainer](self, "_currentEffectContainer");
  if (v3)
  {
    id v4 = v3;
    id v3 = [v3 countOfEffects];
    if (v3)
    {
      id v3 = [v4 transition];
      if (v3)
      {
        id v5 = v3;
        [v3 duration];
        if (v6 == 0.0)
        {
          LOBYTE(v3) = 0;
        }

        else
        {
          -[MRMarimbaLayer time](self, "time");
          double v8 = v7;
          [v4 startTime];
          double v10 = v8 - v9;
          objc_msgSend(objc_msgSend(v4, "parentLayer"), "timeIn");
          double v12 = v10 - v11;
          [v5 duration];
          LOBYTE(v3) = v12 < v13;
        }
      }
    }
  }

  return (char)v3;
}

- (void)whenTransitionIsFinishedSendAction:(SEL)a3 toTarget:(id)a4
{
  id v7 = -[MRMarimbaLayer _currentEffectContainer](self, "_currentEffectContainer");
  if (![v7 countOfEffects]) {
    goto LABEL_4;
  }
  id v8 = [v7 transition];
  if (!v8) {
    goto LABEL_4;
  }
  double v9 = v8;
  [v8 duration];
  if (v10 == 0.0) {
    goto LABEL_4;
  }
  -[MRMarimbaLayer time](self, "time");
  double v12 = v11;
  [v7 startTime];
  double v14 = v12 - v13;
  objc_msgSend(objc_msgSend(v7, "parentLayer"), "timeIn");
  double v16 = v14 - v15;
  [v9 duration];
  if (v16 <= v17 && v16 >= 0.0)
  {
    objc_msgSend(objc_msgSend(v7, "parentLayer"), "timeIn");
    double v19 = v18;
    [v7 startTime];
    double v21 = v19 + v20;
    [v9 duration];
    double v23 = v21 + v22;
    -[MRMarimbaLayer setBailTimeWatcher:](self, "setBailTimeWatcher:", 0LL);
    +[NSThread detachNewThreadSelector:toTarget:withObject:]( &OBJC_CLASS___NSThread,  "detachNewThreadSelector:toTarget:withObject:",  "callbackThread:",  self,  +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v23),  a4,  NSStringFromSelector(a3),  0LL));
  }

  else
  {
LABEL_4:
    [a4 performSelector:a3 withObject:self];
  }

- (id)_firstEffectContainer
{
  id v3 = -[MRMarimbaLayer document](self, "document");
  unint64_t v4 = -[MRMarimbaLayer _mainLayerIndex](self, "_mainLayerIndex");
  id v5 = objc_msgSend(-[MPDocument layers](v3, "layers"), "objectAtIndex:", v4);
  else {
    return objc_msgSend(objc_msgSend(v5, "effectContainers"), "objectAtIndex:", 0);
  }
}

- (id)_effectContainerForTime:(double)a3
{
  id v5 = -[MRMarimbaLayer document](self, "document");
  id v6 = +[MPUtilities effectContainersForTime:inDocument:]( &OBJC_CLASS___MPUtilities,  "effectContainersForTime:inDocument:",  v5,  a3);
  id v7 = objc_msgSend( -[MPDocument layers](v5, "layers"),  "objectAtIndex:",  -[MRMarimbaLayer _mainLayerIndex](self, "_mainLayerIndex"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v8) {
    return [v6 anyObject];
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v15;
LABEL_3:
  uint64_t v11 = 0LL;
  while (1)
  {
    if (*(void *)v15 != v10) {
      objc_enumerationMutation(v6);
    }
    double v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
    if (v7 == [v12 parentLayer]) {
      return v12;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        goto LABEL_3;
      }
      return [v6 anyObject];
    }
  }

- (int64_t)_mainLayerIndex
{
  id v3 = objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "indexOfMainLayerForStyleID:",  -[MPDocument styleID](-[MRMarimbaLayer document](self, "document"), "styleID"));
  if (v3 >= objc_msgSend(-[MPDocument layers](-[MRMarimbaLayer document](self, "document"), "layers"), "count")) {
    return (int64_t)objc_msgSend( -[MPDocument layers](-[MRMarimbaLayer document](self, "document"), "layers"),  "count")
  }
         - 1;
  return (int64_t)v3;
}

- (void)callbackThread:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "doubleValue");
  double v7 = v6;
  id v8 = [a3 objectAtIndex:1];
  SEL v9 = NSSelectorFromString((NSString *)[a3 objectAtIndex:2]);
  while (1)
  {
    -[MRMarimbaLayer time](self, "time");
    if (v10 > v7) {
      break;
    }
    if (!-[MRMarimbaLayer isPlaying](self, "isPlaying") || -[MRMarimbaLayer bailTimeWatcher](self, "bailTimeWatcher")) {
      goto LABEL_7;
    }
  }

  [v8 performSelectorOnMainThread:v9 withObject:self waitUntilDone:0];
LABEL_7:
  objc_autoreleasePoolPop(v5);
}

- (void)watcherThread:(id)a3
{
  id v5 = objc_autoreleasePoolPush();
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "doubleValue");
  double v7 = v6;
  while (1)
  {
    -[MRMarimbaLayer time](self, "time");
    if (v8 > v7) {
      break;
    }
    if (!-[MRMarimbaLayer isPlaying](self, "isPlaying") || -[MRMarimbaLayer bailTimeWatcher](self, "bailTimeWatcher")) {
      goto LABEL_8;
    }
  }

- (id)currentSlides
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  id v4 = -[MRMarimbaLayer _currentEffectContainer](self, "_currentEffectContainer");
  if (!v4)
  {
    id v13 = -[MRMarimbaLayer _currentEffectLayer](self, "_currentEffectLayer");
    if (!v13) {
      return v3;
    }
    double v8 = v13;
    -[MRMarimbaLayer relativeTime](self, "relativeTime");
    double v10 = v14;
    double v12 = 0.0;
    id v6 = v8;
    goto LABEL_7;
  }

  id v5 = v4;
  if (!objc_msgSend(objc_msgSend(v4, "effects"), "count"))
  {
    [v5 parentLayer];
    return v3;
  }

  id v6 = objc_msgSend(objc_msgSend(v5, "effects"), "objectAtIndex:", 0);
  id v7 = [v5 parentLayer];
  if (v6)
  {
    double v8 = v7;
    -[MRMarimbaLayer relativeTime](self, "relativeTime");
    double v10 = v9;
    [v5 startTime];
    double v12 = v11;
LABEL_7:
    objc_msgSend(objc_msgSend(objc_msgSend(v8, "parent"), "liveLock"), "lock");
    id v15 = objc_msgSend(objc_msgSend(v6, "slides"), "copy");
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      double v18 = v10 - v12;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v15);
          }
          double v21 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          [v21 showTime];
          if (v18 >= v22)
          {
            double v23 = v22;
            [v21 showDuration];
            if (v18 < v23 + v24) {
              [v3 addObject:v21];
            }
          }
        }

        id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v17);
    }

    objc_msgSend(objc_msgSend(objc_msgSend(v8, "parent"), "liveLock"), "unlock");
  }

  return v3;
}

- (id)currentSlide
{
  id v3 = -[MRMarimbaLayer _currentEffectContainer](self, "_currentEffectContainer");
  id v4 = v3;
  if (v3)
  {
    if (objc_msgSend(objc_msgSend(v3, "effects"), "count"))
    {
      id v5 = objc_msgSend(objc_msgSend(v4, "effects"), "objectAtIndex:", 0);
      id v6 = [v4 parentLayer];
      if (v5)
      {
        id v7 = v6;
        -[MRMarimbaLayer relativeTime](self, "relativeTime");
        double v9 = v8;
        [v4 startTime];
        double v11 = v10;
        goto LABEL_7;
      }
    }

    else
    {
      [v4 parentLayer];
    }

    return 0LL;
  }

  id v12 = -[MRMarimbaLayer _currentEffectLayer](self, "_currentEffectLayer");
  if (!v12) {
    return 0LL;
  }
  id v5 = v12;
  -[MRMarimbaLayer relativeTime](self, "relativeTime");
  double v9 = v13;
  double v11 = 0.0;
  id v7 = v5;
LABEL_7:
  objc_msgSend(objc_msgSend(objc_msgSend(v7, "parent"), "liveLock"), "lock");
  id v14 = objc_msgSend(objc_msgSend(v5, "slides"), "copy");
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v15) {
    goto LABEL_31;
  }
  id v16 = v15;
  id v17 = 0LL;
  double v18 = v9 - v11;
  uint64_t v19 = *(void *)v29;
  double v20 = -1.0;
LABEL_9:
  double v21 = 0LL;
  double v22 = v20;
  while (1)
  {
    if (*(void *)v29 != v19) {
      objc_enumerationMutation(v14);
    }
    double v23 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v21);
    [v23 showDisplayTime];
    double v20 = v24;
    -[MRRenderer timeQuantum](-[MRMarimbaLayer renderer](self, "renderer"), "timeQuantum");
    if (v18 < v20 - v25) {
      break;
    }
    if (v20 != v22 || v4 == 0LL) {
      id v17 = v23;
    }
    double v21 = (char *)v21 + 1;
    double v22 = v20;
    if (v16 == v21)
    {
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16) {
        goto LABEL_9;
      }
      break;
    }
  }

  if (!v17)
  {
LABEL_31:
    if ([v14 count]) {
      id v17 = [v14 lastObject];
    }
    else {
      id v17 = 0LL;
    }
  }

  objc_msgSend(objc_msgSend(objc_msgSend(v7, "parent"), "liveLock"), "unlock");
  return v17;
}

- (void)removeEffectContainersBeforeTime:(double)a3
{
  id v4 = -[MRMarimbaLayer _effectContainerForTime:](self, "_effectContainerForTime:", a3);
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 parentLayer];
    if ((uint64_t)[v6 countOfEffectContainers] >= 40)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1A7544;
      block[3] = &unk_258D28;
      block[4] = v5;
      block[5] = self;
      block[6] = v6;
      dispatch_async( (dispatch_queue_t)-[MRRenderer renderDispatchQueue]( -[MRMarimbaLayer renderer](self, "renderer"),  "renderDispatchQueue"),  block);
    }
  }

- (void)gotoNextSlide
{
}

- (void)gotoNextSlide:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MRRenderer currentFocusedSlideAsset](-[MRMarimbaLayer renderer](self, "renderer"), "currentFocusedSlideAsset"))
  {
    -[MRRenderer gotoNextFocusedSlide:](-[MRMarimbaLayer renderer](self, "renderer"), "gotoNextFocusedSlide:", v3);
  }

  else
  {
    id v5 = -[MPDocument styleID](-[MRMarimbaLayer document](self, "document"), "styleID");
    if (([v5 isEqualToString:@"Floating"] & 1) != 0
      || ([v5 isEqualToString:@"ShiftingTiles"] & 1) != 0
      || ([v5 hasSuffix:@"Mobile"] & 1) != 0
      || [v5 isEqualToString:@"PhotoWall"])
    {
      -[MRMarimbaLayer gotoNextSlideLegacy](self, "gotoNextSlideLegacy", v6);
    }

    else
    {
      -[MRRenderer gotoNextInterestingTime:]( -[MRMarimbaLayer renderer](self, "renderer"),  "gotoNextInterestingTime:",  v3);
    }
  }

- (void)gotoPreviousSlide
{
}

- (void)gotoPreviousSlide:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[MRRenderer currentFocusedSlideAsset](-[MRMarimbaLayer renderer](self, "renderer"), "currentFocusedSlideAsset"))
  {
    -[MRRenderer gotoPreviousFocusedSlide:]( -[MRMarimbaLayer renderer](self, "renderer"),  "gotoPreviousFocusedSlide:",  v3);
  }

  else
  {
    id v5 = -[MPDocument styleID](-[MRMarimbaLayer document](self, "document"), "styleID");
    if (([v5 isEqualToString:@"Floating"] & 1) != 0
      || ([v5 isEqualToString:@"ShiftingTiles"] & 1) != 0
      || ([v5 hasSuffix:@"Mobile"] & 1) != 0
      || [v5 isEqualToString:@"PhotoWall"])
    {
      -[MRMarimbaLayer gotoPreviousSlideLegacy](self, "gotoPreviousSlideLegacy", v6);
    }

    else
    {
      -[MRRenderer gotoPreviousInterestingTime:]( -[MRMarimbaLayer renderer](self, "renderer"),  "gotoPreviousInterestingTime:",  v3);
    }
  }

- (void)gotoSlide:(id)a3
{
  unsigned int v5 = -[MRMarimbaLayer isAboutToPlay](self, "isAboutToPlay");
  else {
    -[MRMarimbaLayer timeForSlide:](self, "timeForSlide:", a3);
  }
  double v7 = v6;
  if (v5) {
    -[MRRenderer setTime:](-[MRMarimbaLayer renderer](self, "renderer"), "setTime:", v6);
  }
  -[MRRenderer setSlideshowTime:](-[MRMarimbaLayer renderer](self, "renderer"), "setSlideshowTime:", v7);
}

- (void)gotoText:(id)a3
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentEffect", 0), "parentContainer"), "effects");
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 |= [*(id *)(*((void *)&v12 + 1) + 8 * (void)i) hasMovies];
      }

      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v7);
  }

  else
  {
    LOBYTE(v8) = 0;
  }

  if ((objc_msgSend( -[MPDocument styleID](-[MRMarimbaLayer document](self, "document"), "styleID"),  "isEqualToString:",  @"KenBurns") & 1) != 0 || (v8)
    && (-[MRMarimbaLayer isAboutToPlay](self, "isAboutToPlay") || -[MRMarimbaLayer isPlaying](self, "isPlaying")))
  {
    double v11 = -[MRMarimbaLayer renderer](self, "renderer");
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer"), "startTime");
  }

  else
  {
    double v11 = -[MRMarimbaLayer renderer](self, "renderer");
    +[MPUtilities displayTimeForText:](&OBJC_CLASS___MPUtilities, "displayTimeForText:", a3);
  }

  -[MRRenderer setSlideshowTime:](v11, "setSlideshowTime:");
}

- (double)timeForSlide:(id)a3
{
  if (!a3)
  {
    double v9 = 0.0;
LABEL_15:
    -[MPDocument fadeInDuration](-[MRMarimbaLayer document](self, "document"), "fadeInDuration");
    BOOL v24 = v9 < v23;
    double result = v9;
    if (v24) {
      -[MPDocument fadeInDuration](-[MRMarimbaLayer document](self, "document", v9), "fadeInDuration");
    }
    return result;
  }

  id v5 = [a3 parentEffect];
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    [a3 showDisplayTime];
    double v9 = v8;
  }

  else
  {
    id v10 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
    if ([a3 hasMovie]
      && objc_msgSend( objc_msgSend(objc_msgSend(a3, "parentEffect"), "effectID"),  "isEqualToString:",  @"JustASlide"))
    {
      objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "posterTimeForAssetAtPath:",  objc_msgSend(a3, "absolutePath"));
      double v12 = v11;
      [v10 introTransitionDuration];
      double v14 = v13;
      if (v12 >= v13)
      {
        [v10 duration];
        if (v12 <= v15) {
          double v14 = v12;
        }
      }

      [v10 startTime];
      double v9 = v14 + v16 + 0.00001;
    }

    else
    {
      unsigned int v17 = [a3 hasMovie];
      [v10 startTime];
      double v19 = v18;
      [a3 showDisplayTime];
      double v21 = v19 + v20;
      if (v17) {
        double v9 = v21;
      }
      else {
        double v9 = v21 + 0.1;
      }
    }
  }

  double result = 0.0;
  if (v9 >= 0.0) {
    goto LABEL_15;
  }
  return result;
}

- (double)startTimeForSlide:(id)a3
{
  double result = 0.0;
  if (a3)
  {
    id v5 = objc_msgSend(a3, "parentEffect", 0.0);
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      [a3 showDisplayStartTime];
    }

    else
    {
      objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer"), "startTime");
      double v9 = v8;
      [a3 showDisplayStartTime];
      double result = v9 + v10;
    }
  }

  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (void)gotoNextSlideLegacy
{
  id v3 = -[MPDocument styleID](-[MRMarimbaLayer document](self, "document"), "styleID");
  unsigned int v4 = -[MRMarimbaLayer isPlaying](self, "isPlaying");
  if (v4) {
    -[MRMarimbaLayer pause](self, "pause");
  }
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "navigationIncrementForStyleID:",  v3);
  if (v5 <= 0.0)
  {
    -[MRMarimbaLayer relativeTime](self, "relativeTime");
    double v9 = v8;
    id v10 = -[MRMarimbaLayer currentSlide](self, "currentSlide");
    BOOL v11 = v10 == 0LL;
    if (v10)
    {
      do
      {
        id v12 = [v10 parentEffect];
        double v13 = [v10 index];
        if (v13 == (char *)objc_msgSend(objc_msgSend(objc_msgSend(v10, "parentEffect"), "slides"), "count") - 1)
        {
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v14);
          if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0 || (id v16 = [v12 parentContainer]) == 0)
          {
            BOOL v20 = 1;
          }

          else
          {
            unsigned int v17 = v16;
            double v18 = (char *)[v16 index];
            double v19 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(v17, "parentLayer"), "effectContainers"), "count") - 1;
            BOOL v20 = v18 == v19;
            if (v18 == v19)
            {
              id v21 = objc_msgSend( objc_msgSend(objc_msgSend(v17, "parentLayer"), "effectContainers"),  "objectAtIndex:",  0);
            }

            else
            {
              __int128 v31 = (char *)[v17 index] + 1;
              id v32 = objc_msgSend(objc_msgSend(v17, "parentLayer"), "effectContainers");
              double v33 = (char *)[v17 index] + 1;
              id v34 = v32;
              while (1)
              {
                id v21 = [v34 objectAtIndex:v33];
                if (v31 >= (char *)objc_msgSend( objc_msgSend(objc_msgSend(v21, "parentLayer"), "effectContainers"),  "count")
                          - 1
                  || objc_msgSend(objc_msgSend(v21, "effects"), "count"))
                {
                  break;
                }

                ++v31;
                id v34 = objc_msgSend(objc_msgSend(v21, "parentLayer"), "effectContainers");
                double v33 = v31;
              }
            }

            id v12 = objc_msgSend(objc_msgSend(v21, "effects"), "objectAtIndex:", 0);
          }

          if (!objc_msgSend(objc_msgSend(v12, "slides"), "count")) {
            goto LABEL_31;
          }
          id v10 = objc_msgSend(objc_msgSend(v12, "slides"), "objectAtIndex:", 0);
          if (!v10) {
            goto LABEL_31;
          }
        }

        else
        {
          id v10 = objc_msgSend(objc_msgSend(v12, "slides"), "objectAtIndex:", (char *)objc_msgSend(v10, "index") + 1);
          BOOL v20 = 0;
          if (!v10) {
            goto LABEL_31;
          }
        }

        id v22 = [v10 parentEffect];
        uint64_t v24 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v23);
        if ((objc_opt_isKindOfClass(v22, v24) & 1) != 0 || (id v25 = [v22 parentContainer]) == 0)
        {
          [v10 showDisplayTime];
        }

        else
        {
          [v25 startTime];
          double v27 = v26;
          [v10 showDisplayTime];
          double v29 = v27 + v28 + 0.00001;
        }

        BOOL v30 = !v20;
        if (v29 > v9) {
          BOOL v30 = 0;
        }
      }

      while (v30);
      BOOL v11 = 0;
    }

    if (v11)
    {
LABEL_31:
      id v35 = -[MRMarimbaLayer _currentEffectContainer](self, "_currentEffectContainer");
      if (v35)
      {
        v36 = v35;
        id v37 = [v35 parentLayer];
        v38 = (char *)[v36 index];
        v39 = (char *)objc_msgSend(objc_msgSend(v37, "effectContainers"), "count");
        for (id i = 0; ; id i = [v41 objectAtIndex:v38 - v42])
        {
          ++v38;
          if (i)
          {
            if (objc_msgSend(objc_msgSend(i, "effects"), "count")) {
              break;
            }
          }

          id v41 = [v37 effectContainers];
          else {
            v42 = 0LL;
          }
        }

        if (objc_msgSend(objc_msgSend(i, "effects"), "count"))
        {
          __int128 v54 = 0u;
          __int128 v55 = 0u;
          __int128 v52 = 0u;
          __int128 v53 = 0u;
          id v43 = objc_msgSend(i, "effects", 0);
          id v44 = [v43 countByEnumeratingWithState:&v52 objects:v56 count:16];
          if (v44)
          {
            id v45 = v44;
            uint64_t v46 = *(void *)v53;
            while (2)
            {
              for (j = 0LL; j != v45; j = (char *)j + 1)
              {
                if (*(void *)v53 != v46) {
                  objc_enumerationMutation(v43);
                }
                v48 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)j);
                if (objc_msgSend(objc_msgSend(v48, "slides"), "count"))
                {
                  v51 = v48;
                  goto LABEL_53;
                }
              }

              id v45 = [v43 countByEnumeratingWithState:&v52 objects:v56 count:16];
              if (v45) {
                continue;
              }
              break;
            }
          }
        }

- (void)gotoPreviousSlideLegacy
{
  id v3 = -[MPDocument styleID](-[MRMarimbaLayer document](self, "document"), "styleID");
  unsigned int v4 = -[MRMarimbaLayer isPlaying](self, "isPlaying");
  if (v4) {
    -[MRMarimbaLayer pause](self, "pause");
  }
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "navigationIncrementForStyleID:",  v3);
  if (v5 > 0.0)
  {
    double v6 = v5;
    -[MRMarimbaLayer time](self, "time");
    double v8 = v7 - v6;
    objc_msgSend( objc_msgSend(objc_msgSend(-[MRMarimbaLayer currentSlides](self, "currentSlides"), "lastObject"), "parentEffect"),  "lowestDisplayTime");
    if (v8 >= v9) {
      double v9 = v8;
    }
    if (v9 < 0.0) {
      double v9 = 0.0;
    }
    -[MRMarimbaLayer setTime:](self, "setTime:", v9);
    if ((v4 & 1) != 0) {
      goto LABEL_57;
    }
    return;
  }

  -[MRMarimbaLayer relativeTime](self, "relativeTime");
  double v11 = v10;
  id v12 = -[MRMarimbaLayer currentSlides](self, "currentSlides");
  id v13 = v12;
  if (v12)
  {
    if ([v12 count]) {
      id v13 = [v13 objectAtIndex:0];
    }
    else {
      id v13 = 0LL;
    }
  }

  if (objc_msgSend( +[MPEffectManager sharedManager](MPEffectManager, "sharedManager"),  "effectDoesAccumulate:",  objc_msgSend(objc_msgSend(v13, "parentEffect"), "effectID"))) {
    id v14 = objc_msgSend(-[MRMarimbaLayer currentSlides](self, "currentSlides"), "lastObject");
  }
  else {
    id v14 = -[MRMarimbaLayer currentSlide](self, "currentSlide");
  }
  id v15 = v14;
  double v16 = v11;
  if (v14)
  {
    id v17 = [v14 parentEffect];
    uint64_t v19 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v18);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) != 0 || (id v20 = [v17 parentContainer]) == 0)
    {
      [v15 showDisplayTime];
      double v16 = v24;
    }

    else
    {
      [v20 startTime];
      double v22 = v21;
      [v15 showDisplayTime];
      double v16 = v22 + v23;
    }
  }

  BOOL v25 = 0;
  do
  {
    BOOL v26 = v11 < v16 || v15 == 0LL;
    if (v26 || v25) {
      goto LABEL_51;
    }
    id v27 = [v15 parentEffect];
    if ([v15 index])
    {
      id v15 = objc_msgSend(objc_msgSend(v27, "slides"), "objectAtIndex:", (char *)objc_msgSend(v15, "index") - 1);
      BOOL v25 = 0;
      if (!v15) {
        goto LABEL_49;
      }
    }

    else
    {
      uint64_t v29 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v28);
      if ((objc_opt_isKindOfClass(v27, v29) & 1) != 0 || (id v30 = [v27 parentContainer]) == 0)
      {
        BOOL v25 = 1;
        id v35 = v27;
      }

      else
      {
        __int128 v31 = v30;
        id v32 = [v30 index];
        BOOL v25 = v32 == 0LL;
        if (v32)
        {
          double v33 = (char *)[v31 index];
          id v34 = objc_msgSend( objc_msgSend(objc_msgSend(v31, "parentLayer"), "effectContainers"),  "objectAtIndex:",  (char *)objc_msgSend(v31, "index") - 1);
          if ((uint64_t)v33 >= 2)
          {
            do
            {
              if (objc_msgSend(objc_msgSend(v34, "effects"), "count")) {
                break;
              }
              id v34 = objc_msgSend( objc_msgSend(objc_msgSend(v34, "parentLayer"), "effectContainers"),  "objectAtIndex:",  v33 - 2);
              --v33;
            }

            while ((uint64_t)v33 > 1);
          }
        }

        else
        {
          id v34 = objc_msgSend(objc_msgSend(objc_msgSend(v31, "parentLayer"), "effectContainers"), "lastObject");
        }

        id v35 = objc_msgSend(objc_msgSend(v34, "effects"), "objectAtIndex:", 0);
      }

      if (!objc_msgSend(objc_msgSend(v35, "slides"), "count"))
      {
        id v15 = 0LL;
        goto LABEL_49;
      }

      id v15 = objc_msgSend(objc_msgSend(v35, "slides"), "lastObject");
      if (!v15) {
        goto LABEL_49;
      }
    }

    id v36 = [v15 parentEffect];
    uint64_t v38 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v37);
    if ((objc_opt_isKindOfClass(v36, v38) & 1) != 0 || (id v39 = [v36 parentContainer]) == 0)
    {
      [v15 showDisplayTime];
    }

    else
    {
      [v39 startTime];
      double v41 = v40;
      [v15 showDisplayTime];
      double v43 = v41 + v42;
    }

    double v11 = v43 + 0.00001;
LABEL_49:
    [v27 lowestDisplayTime];
  }

  while (v11 >= v44);
  [v27 lowestDisplayTime];
  if (v45 < 0.0)
  {
LABEL_51:
    if (v15)
    {
      -[MRMarimbaLayer gotoSlideLegacy:](self, "gotoSlideLegacy:", v15);
      if (!v4) {
        return;
      }
    }

    else
    {
      -[MRMarimbaLayer moveToPreviousEffectContainer](self, "moveToPreviousEffectContainer");
      if (!v4) {
        return;
      }
    }

    goto LABEL_57;
  }

  -[MRMarimbaLayer setTime:](self, "setTime:");
  if (!v4) {
    return;
  }
LABEL_57:
  -[MRMarimbaLayer play](self, "play");
}

- (void)gotoSlideLegacy:(id)a3
{
  double v4 = 0.0;
  if (a3)
  {
    id v6 = objc_msgSend(a3, "parentEffect", 0.0);
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MPLayerEffect, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      [a3 showDisplayTime];
    }

    else
    {
      id v9 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
      if ([a3 hasMovie]
        && objc_msgSend( objc_msgSend(objc_msgSend(a3, "parentEffect"), "effectID"),  "isEqualToString:",  @"JustASlide"))
      {
        objc_msgSend( +[MPAssetManager sharedManager](MPAssetManager, "sharedManager"),  "posterTimeForAssetAtPath:",  objc_msgSend(a3, "absolutePath"));
        double v11 = v10;
        [v9 introTransitionDuration];
        double v13 = v12;
        if (v11 >= v12)
        {
          [v9 duration];
          if (v11 <= v14) {
            double v13 = v11;
          }
        }

        [v9 startTime];
        double v16 = v13 + v15;
        double v17 = 0.00001;
      }

      else
      {
        [v9 startTime];
        double v19 = v18;
        [a3 showDisplayTime];
        double v16 = v19 + v20;
        double v17 = 0.1;
      }

      double v4 = v16 + v17;
    }
  }

  if (v4 < 0.0) {
    double v4 = 0.0;
  }
  -[MRMarimbaLayer setTime:](self, "setTime:", v4);
}

- (void)_slideDidAppear:(id)a3
{
  double v5 = (MRRenderer *)[a3 object];
  if (v5 == -[MRMarimbaLayer renderer](self, "renderer"))
  {
    id v6 = [a3 userInfo];
    id v7 = [v6 objectForKey:@"layer"];
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MRLayerEffect, v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
    {
      id v10 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "objectForKey:", @"slide"), "asset"), "path");
      if ((objc_msgSend( v10,  "isEqualToString:",  -[MRMarimbaLayer lastSlideChange](self, "lastSlideChange")) & 1) == 0)
      {
        -[MRMarimbaLayer setLastSlideChange:](self, "setLastSlideChange:", v10);
        +[NSThread detachNewThreadSelector:toTarget:withObject:]( &OBJC_CLASS___NSThread,  "detachNewThreadSelector:toTarget:withObject:",  "_postNotificationForSlideChange:",  self,  v6);
      }
    }
  }

- (void)_postNotificationForSlideChange:(id)a3
{
  double v5 = objc_autoreleasePoolPush();
  id v6 = [a3 objectForKey:@"layer"];
  id v7 = [a3 objectForKey:@"slide"];
  id v8 = -[MPDocument montage](-[MRMarimbaLayer document](self, "document"), "montage");
  [v8 lock];
  id v9 = objc_msgSend( +[MPUtilities effectForMCContainerEffect:inDocument:]( MPUtilities,  "effectForMCContainerEffect:inDocument:",  objc_msgSend(v6, "container"),  -[MRMarimbaLayer document](self, "document")),  "slideForMCSlide:",  v7);
  [v8 unlock];
  if (v9) {
    -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"kMRNotificationSlideDidChange",  self,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  v9,  @"slide"));
  }
  objc_autoreleasePoolPop(v5);
}

- (id)blobHitAtPoint:(CGPoint)a3 fromObjectsForObjectIDs:(id)a4 localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  -[MRMarimbaLayer size](self, "size");
  id v11 = -[MRRenderer layerHitAtPoint:onlyIfHitElement:localPoint:]( -[MRMarimbaLayer renderer](self, "renderer"),  "layerHitAtPoint:onlyIfHitElement:localPoint:",  1LL,  a5,  x,  v10 - y);
  if (!v11) {
    return 0LL;
  }
  id v12 = v11;
  double v13 = (NSString *)objc_msgSend(v11, "elementHitAtPoint:localPoint:", a5, a5->x, a5->y);
  if (!v13) {
    return 0LL;
  }
  double v14 = v13;
  id v15 = v12;
  double v16 = v13;
  while (1)
  {
    id v17 = objc_msgSend(a4, "objectForKey:", objc_msgSend(objc_msgSend(v15, "plug"), "objectID"));
    if (v17) {
      break;
    }
    double v16 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@.%@",  objc_msgSend(objc_msgSend(v15, "plugAsParallel"), "idInSupercontainer"),  v16);
    id v15 = [v15 superlayer];
    if (!v15) {
      return 0LL;
    }
  }

  id v20 = v17;
  double v18 = objc_alloc_init(&OBJC_CLASS___MRHitBlob);
  -[MRHitBlob setEffectLayer:](v18, "setEffectLayer:", v12);
  -[MRHitBlob setOuterLayer:](v18, "setOuterLayer:", v15);
  -[MRHitBlob setClientObject:](v18, "setClientObject:", v20);
  -[MRHitBlob setInnerPath:](v18, "setInnerPath:", v16);
  -[MRHitBlob setElementID:](v18, "setElementID:", v14);
  return v18;
}

- (BOOL)getOnScreenVertices:(CGPoint)a3[4] forHitBlob:(id)a4
{
  id v6 = [a4 outerLayer];
  if (a3) {
    BOOL v7 = v6 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;
  if (!v7)
  {
    id v9 = v6;
    -[MRMarimbaLayer size](self, "size");
    double v11 = v10 * 0.5;
    -[MRMarimbaLayer size](self, "size");
    double v13 = v12 * 0.5;
    objc_msgSend(v9, "convertLocalPoint:", -1.0, -1.0);
    a3->double x = v11 * (v14 + 1.0);
    a3->double y = v13 * (1.0 - v15);
    objc_msgSend(v9, "convertLocalPoint:", 1.0, -1.0);
    a3[1].double x = v11 * (v16 + 1.0);
    a3[1].double y = v13 * (1.0 - v17);
    objc_msgSend(v9, "convertLocalPoint:", 1.0, 1.0);
    a3[2].double x = v11 * (v18 + 1.0);
    a3[2].double y = v13 * (1.0 - v19);
    objc_msgSend(v9, "convertLocalPoint:", -1.0, 1.0);
    a3[3].double x = v11 * (v20 + 1.0);
    a3[3].double y = v13 * (1.0 - v21);
  }

  return v8;
}

- (CGPoint)convertPoint:(CGPoint)a3 toHitBlob:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [a4 outerLayer];
  if (v7)
  {
    BOOL v8 = v7;
    -[MRMarimbaLayer size](self, "size");
    double v10 = v9 * 0.5;
    -[MRMarimbaLayer size](self, "size");
    objc_msgSend(v8, "convertGlobalPoint:", (x - v10) / v10, (v11 * 0.5 - y) / (v11 * 0.5));
  }

  else
  {
    double v12 = CGPointZero.x;
    double v13 = CGPointZero.y;
  }

  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)beginLiveUpdateForHitBlob:(id)a3
{
  id v5 = [a3 effectLayer];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___MRLayerParallelizer, v6);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v13[0] = 0LL;
      v13[1] = v13;
      v13[2] = 0x3052000000LL;
      v13[3] = sub_1A8C60;
      v13[4] = sub_1A8C70;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_1A8C7C;
      v12[3] = &unk_24DB70;
      v12[4] = v13;
      v13[5] = v12;
      sub_1A8C7C((uint64_t)v12, v7);
      _Block_object_dispose(v13, 8);
    }

    else
    {
      id v9 = [a3 elementID];
      if ([v9 hasPrefix:@"image"])
      {
        id v10 = objc_msgSend(objc_msgSend(v7, "slideProvidersForElementIDs"), "objectForKey:", v9);
        if (v10) {
          return [v10 beginLiveUpdate];
        }
        NSLog(@"No slide provider for elementID %@", v9);
      }

      else
      {
        if ([v9 hasPrefix:@"text"]) {
          return -[MRRenderer beginTextEditingOfElement:inLayer:callDelegate:]( -[MRMarimbaLayer renderer](self, "renderer"),  "beginTextEditingOfElement:inLayer:callDelegate:",  v9,  v7,  1LL);
        }
        NSLog(@"Invalid element ID %@", v9);
      }
    }
  }

  return 0;
}

- (BOOL)endLiveUpdateForHitBlob:(id)a3
{
  id v6 = [a3 effectLayer];
  if (!v6) {
    return (char)v6;
  }
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___MRLayerParallelizer, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v12[0] = 0LL;
    v12[1] = v12;
    v12[2] = 0x3052000000LL;
    v12[3] = sub_1A8C60;
    v12[4] = sub_1A8C70;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1A8FC8;
    v11[3] = &unk_24DB70;
    v11[4] = v12;
    void v12[5] = v11;
    sub_1A8FC8((uint64_t)v11, v6);
    _Block_object_dispose(v12, 8);
LABEL_11:
    LOBYTE(v6) = 0;
    return (char)v6;
  }

  id v8 = [a3 elementID];
  if ([v8 hasPrefix:@"image"])
  {
    id v9 = objc_msgSend(objc_msgSend(v6, "slideProvidersForElementIDs"), "objectForKey:", v8);
    if (v9) {
      return [v9 endLiveUpdate];
    }
    NSLog(@"No slide provider for elementID %@", v8);
    goto LABEL_11;
  }

  if (![v8 hasPrefix:@"text"])
  {
    NSLog(@"Invalid element ID %@", v8);
    goto LABEL_11;
  }

  LOBYTE(v6) = 1;
  -[MRRenderer endTextEditing:](-[MRMarimbaLayer renderer](self, "renderer"), "endTextEditing:", 1LL);
  return (char)v6;
}

- (void)beginGesture:(id)a3
{
  id v5 = [a3 hitBlob];
  -[MRMarimbaLayer beginLiveUpdateForHitBlob:](self, "beginLiveUpdateForHitBlob:", v5);
  id v6 = [v5 proxyForSlide];
  -[MZMediaManagement resolutionForAssetAtPath:]( -[MRRenderer assetManagementDelegate](-[MRMarimbaLayer renderer](self, "renderer"), "assetManagementDelegate"),  "resolutionForAssetAtPath:",  [v6 path]);
  BOOL v9 = v8 <= 0.0 || v7 <= 0.0;
  double v10 = v7 / v8;
  if (v9) {
    double v11 = 1.0;
  }
  else {
    double v11 = v10;
  }
  [a3 locationInViewAtStart];
  -[MRMarimbaLayer convertPoint:toHitBlob:](self, "convertPoint:toHitBlob:", v5);
  double v13 = v12;
  double v15 = v14;
  [v6 center];
  double v17 = v16;
  double v19 = v18;
  objc_msgSend(a3, "setSlideCenterAtStart:");
  [v6 rotation];
  double v21 = v20;
  objc_msgSend(a3, "setSlideRotationAtStart:");
  [v6 scale];
  double v23 = v22;
  objc_msgSend(a3, "setSlideScaleAtStart:");
  [a3 setLinearScaleAtStart:v23];
  id v24 = [v6 sizingMode];
  if (!v24 || [v24 isEqualToString:@"Crop to Fit"])
  {
    [v5 aspectRatio];
    double v26 = v25;
    [a3 linearScaleAtStart];
    double v28 = v27;
    if (v26 >= v11)
    {
      [a3 linearScaleAtStart];
      double v33 = v32;
      [v5 aspectRatio];
      double v31 = v33 * v34 / v11;
    }

    else
    {
      [v5 aspectRatio];
      double v28 = v11 * v28 / v29;
      [a3 linearScaleAtStart];
      double v31 = v30;
    }

    [a3 setLinearScaleAtStart:v28];
    double v17 = v17 + (0.5 - v17) / v28;
    double v19 = v19 + (0.5 - v19) / v31;
  }

  float v35 = v21;
  __float2 v36 = __sincosf_stret(v35);
  [a3 linearScaleAtStart];
  double v38 = v36.__cosval * 0.5 / v37;
  [a3 linearScaleAtStart];
  double v40 = v36.__sinval * 0.5 / v39;
  [v5 aspectRatio];
  objc_msgSend( a3,  "setLocationInSlideAtStart:",  v17 + v13 * v38 + v15 * v40 * (1.0 / v41),  v19 + (v15 * v38 * (1.0 / v41) - v13 * v40) * v11);
  objc_msgSend(a3, "setCurrentTranslation:", CGPointZero.x, CGPointZero.y);
  [a3 setCurrentRotation:0.0];
  [a3 setCurrentScale:1.0];
}

- (void)doGesture:(id)a3
{
  id v5 = [a3 hitBlob];
  id v6 = [v5 proxyForSlide];
  -[MZMediaManagement resolutionForAssetAtPath:]( -[MRRenderer assetManagementDelegate](-[MRMarimbaLayer renderer](self, "renderer"), "assetManagementDelegate"),  "resolutionForAssetAtPath:",  [v6 path]);
  BOOL v9 = v8 <= 0.0 || v7 <= 0.0;
  double v10 = v7 / v8;
  if (v9) {
    double v11 = 1.0;
  }
  else {
    double v11 = v10;
  }
  double v63 = v11;
  [a3 locationInViewAtStart];
  double v13 = v12;
  [a3 currentTranslation];
  double v15 = v13 + v14;
  [a3 locationInViewAtStart];
  double v17 = v16;
  [a3 currentTranslation];
  -[MRMarimbaLayer convertPoint:toHitBlob:](self, "convertPoint:toHitBlob:", v5, v15, v17 + v18);
  double v64 = v20;
  double v65 = v19;
  [a3 slideRotationAtStart];
  double v22 = v21;
  [a3 currentRotation];
  double v24 = v22 - v23;
  [v5 aspectRatio];
  double v66 = v24;
  float v25 = v24;
  double v27 = 1.0 / v26;
  __float2 v28 = __sincosf_stret(v25);
  [a3 linearScaleAtStart];
  double v30 = v29;
  [a3 currentScale];
  double v32 = v30 * v31;
  double v33 = fabs(v28.__cosval);
  double v34 = fabs(v28.__sinval);
  double v35 = v33 + v34 * v27;
  double v36 = v34 + v33 * v27;
  double v37 = v11 * v36;
  if (v35 >= v11 * v36) {
    double v38 = v35;
  }
  else {
    double v38 = v11 * v36;
  }
  if (v32 >= v38) {
    double v39 = v32;
  }
  else {
    double v39 = v38;
  }
  double v40 = v28.__cosval * 0.5 / v39;
  double v41 = v28.__sinval * 0.5 / v39;
  [a3 locationInSlideAtStart];
  double v62 = v42 - (v27 * (v64 * v41) + v65 * v40);
  [a3 locationInSlideAtStart];
  double v44 = v43 - (v27 * (v64 * v40) - v65 * v41) * v11;
  double v45 = v35 * 0.5;
  double v46 = v62;
  double v47 = v45 / v39;
  double v48 = v37 * 0.5 / v39;
  if (v62 < v47 || (double v47 = 1.0 - v47, v62 > v47)) {
    double v46 = v47;
  }
  if (v44 < v48 || (double v48 = 1.0 - v48, v44 > v48)) {
    double v44 = v48;
  }
  id v49 = [v6 sizingMode];
  if (v49 && ![v49 isEqualToString:@"Crop to Fit"])
  {
    double v55 = v46;
  }

  else
  {
    [v5 aspectRatio];
    double v51 = v50;
    [v5 aspectRatio];
    double v53 = v39 * v52;
    double v54 = 0.5;
    double v55 = 0.5;
    double v56 = v53 / v63;
    if (v39 != 1.0) {
      double v55 = (v46 * v39 + -0.5) / (v39 + -1.0);
    }
    if (v56 != 1.0) {
      double v54 = (v44 * v56 + -0.5) / (v56 + -1.0);
    }
    if (v51 < v63) {
      double v39 = v56;
    }
    double v44 = v54;
  }

  [v6 rotation];
  if (v66 != v57) {
    [v6 setRotation:v66];
  }
  [v6 scale];
  if (v39 != v58) {
    [v6 setScale:v39];
  }
  [v6 center];
  if (v55 != v60 || v44 != v59) {
    objc_msgSend(v6, "setCenter:", v55, v44);
  }
  -[MRRenderer requestRendering:](-[MRMarimbaLayer renderer](self, "renderer"), "requestRendering:", 0LL);
}

- (void)endGesture:(id)a3
{
}

- (void)cancelGesture:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "hitBlob"), "proxyForSlide");
  [a3 slideCenterAtStart];
  objc_msgSend(v5, "setCenter:");
  [a3 slideRotationAtStart];
  objc_msgSend(v5, "setRotation:");
  [a3 slideScaleAtStart];
  objc_msgSend(v5, "setScale:");
  -[MRMarimbaLayer endGesture:](self, "endGesture:", a3);
}

+ (MRMarimbaLayer)layerWithDocument:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = (MRMarimbaLayer *)+[MRMarimbaLayer layer](&OBJC_CLASS___MRMarimbaLayer, "layer");
  -[MRMarimbaLayer setFrame:](v7, "setFrame:", 0.0, 0.0, width, height);
  -[MRMarimbaLayer setDocument:](v7, "setDocument:", a3);
  return v7;
}

+ (MRMarimbaLayer)layerWithDocument:(id)a3
{
  double v4 = (MRMarimbaLayer *)+[MRMarimbaLayer layer](&OBJC_CLASS___MRMarimbaLayer, "layer");
  -[MRMarimbaLayer setDocument:](v4, "setDocument:", a3);
  return v4;
}

+ (void)releaseResources
{
  v2 = (void *)objc_opt_class(a1, a2);
  objc_sync_enter(v2);
  uint64_t v3 = qword_2B0A90;
  if (!qword_2B0A90)
  {
    objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "releaseResources");
    objc_msgSend( +[MRTransitionManager sharedManager](MRTransitionManager, "sharedManager"),  "releaseResources");
    objc_msgSend(+[MRShaderManager sharedManager](MRShaderManager, "sharedManager"), "releaseResources");
    objc_msgSend(+[MRFrameManager sharedManager](MRFrameManager, "sharedManager"), "releaseResources");
    +[MUPoolObject clearAllPools](&OBJC_CLASS___MUPoolObject, "clearAllPools");
  }

  byte_2B0A98 = v3 != 0;
  objc_sync_exit(v2);
}

+ (MRMarimbaLayer)allocWithZone:(_NSZone *)a3
{
  id v5 = (void *)objc_opt_class(a1, a2);
  objc_sync_enter(v5);
  ++qword_2B0A90;
  objc_sync_exit(v5);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MRMarimbaLayer;
  return (MRMarimbaLayer *)objc_msgSendSuper2(&v7, "allocWithZone:", a3);
}

- (MRMarimbaLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MRMarimbaLayer;
  v2 = -[MRMarimbaLayer init](&v5, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    LOBYTE(v2->_viewRenderbuffer) = 1;
    -[MRMarimbaLayer setOpaque:](v2, "setOpaque:", 1LL);
    -[MRMarimbaLayer setNeedsDisplayOnBoundsChange:](v3, "setNeedsDisplayOnBoundsChange:", 0LL);
    -[MRMarimbaLayer setDrawableProperties:]( v3,  "setDrawableProperties:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  &__kCFBooleanFalse,  kEAGLDrawablePropertyRetainedBacking,  kEAGLColorFormatRGBA8,  kEAGLDrawablePropertyColorFormat,  0LL));
  }

  return v3;
}

- (void)dealloc
{
  self->_document = 0LL;
  if (*(void *)&self->_enableSlideDidChangeNotification)
  {
    -[MRMarimbaLayer destroyFramebuffer](self, "destroyFramebuffer");
    double v4 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
    objc_super v5 = *(EAGLContext **)&self->_enableSlideDidChangeNotification;
    if (v4 == v5)
    {
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", 0LL);
      objc_super v5 = *(EAGLContext **)&self->_enableSlideDidChangeNotification;
    }

    *(void *)&self->_enableSlideDidChangeNotification = 0LL;
  }

  id v6 = (void *)objc_opt_class(self, v3);
  objc_sync_enter(v6);
  if (!--qword_2B0A90 && byte_2B0A98 == 1) {
    objc_msgSend((id)objc_opt_class(self, v7), "releaseResources");
  }
  objc_sync_exit(v6);
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MRMarimbaLayer;
  -[MRMarimbaLayer dealloc](&v8, "dealloc");
}

- (void)cleanup
{
  double timestampOfLastRenderPass = self->_timestampOfLastRenderPass;
  if (timestampOfLastRenderPass != 0.0)
  {

    self->_double timestampOfLastRenderPass = 0.0;
  }

  if (self->_document)
  {
    [*(id *)&self->_frameBufferSize.height invalidate];

    self->_frameBufferSize.double height = 0.0;
    -[MPDocument stop](self->_document, "stop");

    self->_document = 0LL;
  }

  objc_sync_enter(self);
  if (self->super.super._attr.layer)
  {
    -[MRMarimbaLayer endMorphing](self, "endMorphing");
    [self->super.super._attr.layer cleanup];

    self->super.super._attr.layer = 0LL;
  }

  objc_sync_exit(self);
  win = self->super._win;
  if (win)
  {

    self->super._win = 0LL;
  }

- (MPDocument)document
{
  return (MPDocument *)self->super._win;
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (BOOL)shouldRenderOnBackgroundThread
{
  return 1;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[MRMarimbaLayer bounds](self, "bounds");
  BOOL v10 = height != v9 || width != v8;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MRMarimbaLayer;
  -[MRMarimbaLayer setBounds:](&v13, "setBounds:", x, y, width, height);
  if (self->super.super._attr.layer)
  {
    if (HIBYTE(self->_context))
    {
      BYTE1(self->_faceTimer) |= v10;
    }

    else if (self->super._win)
    {
      if (v10)
      {
        double v11 = (dispatch_queue_s *)[self->super.super._attr.layer renderDispatchQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1A9D38;
        block[3] = &unk_24D5B0;
        block[4] = self;
        dispatch_async(v11, block);
      }

      else
      {
        -[MRMarimbaLayer updateSizeOfRenderer:](self, "updateSizeOfRenderer:");
      }
    }
  }

- (CGSize)size
{
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (void)updateSizeOfRenderer:(id)a3
{
  faceDetector = self->_faceDetector;
  double morphingToAspectRatio = self->_morphingToAspectRatio;
  -[MRMarimbaLayer affineTransform](self, "affineTransform");
  double v6 = v10;
  if (v10 == 1.0)
  {
    uint64_t v7 = 4LL;
  }

  else if (v10 == -1.0)
  {
    uint64_t v7 = 3LL;
  }

  else
  {
    double v6 = v11;
    if (v11 == 1.0) {
      uint64_t v7 = 2LL;
    }
    else {
      uint64_t v7 = 1LL;
    }
  }

  else {
    double v8 = morphingToAspectRatio;
  }
  else {
    double v9 = *(double *)&faceDetector;
  }
  objc_msgSend(a3, "setSize:", v8, v9);
}

- (void)setRendererSizeIsLocked:(BOOL)a3
{
  if (HIBYTE(self->_context) != a3)
  {
    HIBYTE(self->_context) = a3;
    if (!a3 && self->super._win)
    {
      if (BYTE1(self->_faceTimer))
      {
        double v4 = (dispatch_queue_s *)[self->super.super._attr.layer renderDispatchQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1A9F04;
        block[3] = &unk_24D5B0;
        block[4] = self;
        dispatch_async(v4, block);
      }

      else
      {
        -[MRMarimbaLayer updateSizeOfRenderer:](self, "updateSizeOfRenderer:", self->super.super._attr.layer);
      }
    }

    BYTE1(self->_faceTimer) = 0;
  }

- (void)setContentsScale:(double)a3
{
  if (v5 != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___MRMarimbaLayer;
    -[MRMarimbaLayer setContentsScale:](&v8, "setContentsScale:", a3);
    if (self->super._win)
    {
      layer = self->super.super._attr.layer;
      if (layer)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1A9FF0;
        block[3] = &unk_24D5B0;
        block[4] = self;
        dispatch_async((dispatch_queue_t)[layer renderDispatchQueue], block);
      }
    }
  }

- (void)setDocument:(id)a3
{
  if (self->super._win)
  {
    if (self->super.super._attr.layer)
    {
      -[MRMarimbaLayer endMorphing](self, "endMorphing");
      [self->super.super._attr.layer setMontage:0];
    }

    -[NSNotificationCenter removeObserver:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:",  self);

    self->super._win = 0LL;
  }

  double v5 = (_CAEAGLNativeWindow *)a3;
  self->super._win = v5;
  if (v5)
  {
    win = v5;
    layer = (MRRenderer *)self->super.super._attr.layer;
    objc_super v8 = layer;
    if (!layer)
    {
      objc_super v8 = -[MRRenderer initWithParameters:]( objc_alloc(&OBJC_CLASS___MRRenderer),  "initWithParameters:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", BYTE5(self->_context)),  @"readonly",  &__kCFBooleanFalse,  @"noAudio",  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", BYTE6(self->_context)),  @"slidesAreReadonly",  0LL));
      win = self->super._win;
    }

    -[MRRenderer setAssetManagementDelegate:](v8, "setAssetManagementDelegate:", win);
    -[MRRenderer setFeatureDelegate:](v8, "setFeatureDelegate:", self->super._win);
    -[MRRenderer setLiveSlideshowDelegate:](v8, "setLiveSlideshowDelegate:", self);
    -[MRRenderer setAsynchronousOperationsDelegate:](v8, "setAsynchronousOperationsDelegate:", self);
    -[MRRenderer setIsEditing:](v8, "setIsEditing:", 0LL);
    LODWORD(v9) = 1.0;
    -[MRRenderer setVolume:](v8, "setVolume:", v9);
    -[MRRenderer setMontage:](v8, "setMontage:", [a3 montage]);
    -[MRRenderer setRequestRenderingOnChanges:](v8, "setRequestRenderingOnChanges:", 1LL);
    -[MRRenderer setInteractivityIsEnabled:](v8, "setInteractivityIsEnabled:", BYTE1(self->_viewRenderbuffer));
    id v10 = objc_msgSend( objc_msgSend( objc_msgSend(-[_CAEAGLNativeWindow mainLayers](self->super._win, "mainLayers"), "lastObject"),  "plug"),  "container");
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___MCContainerSerializer, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0
      || (uint64_t v14 = objc_opt_class(&OBJC_CLASS___MCContainerNavigator, v13), (objc_opt_isKindOfClass(v10, v14) & 1) != 0))
    {
      -[MRRenderer setTransitionLayerPlugObjectID:]( v8,  "setTransitionLayerPlugObjectID:",  objc_msgSend( objc_msgSend( objc_msgSend(-[_CAEAGLNativeWindow mainLayers](self->super._win, "mainLayers"), "lastObject"),  "plug"),  "objectID"));
    }

    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "didLiveChanged:",  @"kMPAuthoringLiveDidChangeNotification",  self->super._win);
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "didAddEffects:",  @"kMPAuthoringLiveDidAddEffectsNotification",  self->super._win);
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  self,  "didApplyStyle:",  @"kMPAuthoringDidFinishApplyingStyleNotification",  self->super._win);
    if (LOBYTE(self->_faceTimer))
    {
      double v15 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
      -[NSNotificationCenter addObserver:selector:name:object:]( v15,  "addObserver:selector:name:object:",  self,  "_slideDidAppear:",  kMRNotificationSlideIsOn,  0LL);
    }

    -[MRMarimbaLayer bounds](self, "bounds");
    double v17 = v16;
    if (*(void *)&self->_enableSlideDidChangeNotification)
    {
      -[MRRenderer setEAGLContext:](v8, "setEAGLContext:", 0LL);
      -[MRMarimbaLayer destroyFramebuffer](self, "destroyFramebuffer");
      double v18 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
      double v19 = *(EAGLContext **)&self->_enableSlideDidChangeNotification;
      if (v18 == v19)
      {
        +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", 0LL);
        double v19 = *(EAGLContext **)&self->_enableSlideDidChangeNotification;
      }

      *(void *)&self->_enableSlideDidChangeNotification = 0LL;
    }

    double v20 = -[EAGLContext initWithAPI:](objc_alloc(&OBJC_CLASS___EAGLContext), "initWithAPI:", 2LL);
    *(void *)&self->_enableSlideDidChangeNotification = v20;
    if (v20)
    {
      -[MRRenderer setEAGLContext:](v8, "setEAGLContext:", v20);
      if (v17 > 0.0)
      {
        -[MRMarimbaLayer updateFramebuffer](self, "updateFramebuffer");
        if (*(void *)&self->_enableSlideDidChangeNotification) {
          -[MRMarimbaLayer updateSizeOfRenderer:](self, "updateSizeOfRenderer:", v8);
        }
      }
    }

    if (!layer)
    {
      objc_sync_enter(self);
      self->super.super._attr.layer = v8;
      objc_sync_exit(self);
    }
  }

- (void)setupFaceDetection
{
  if (self->_document)
  {
    [*(id *)&self->_frameBufferSize.height invalidate];

    self->_frameBufferSize.double height = 0.0;
    -[MPDocument stop](self->_document, "stop");

    self->_document = 0LL;
  }

  double v3 = objc_alloc_init(&OBJC_CLASS___MPFaceDetector);
  self->_document = (MPDocument *)v3;
  -[MPFaceDetector setDocument:](v3, "setDocument:", self->super._win);
  -[MPDocument setRenderer:](self->_document, "setRenderer:", self);
  -[MPDocument setIsCancelled:](self->_document, "setIsCancelled:", 0LL);
  objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "delayFaceDetectionForStyleID:",  -[_CAEAGLNativeWindow styleID](self->super._win, "styleID"));
  if (v4 == 0.0) {
    -[MPDocument start](self->_document, "start");
  }
  else {
    *(void *)&self->_frameBufferSize.double height =  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self->_document,  "start",  0LL,  0LL);
  }
}

- (void)didLiveChanged:(id)a3
{
  id v4 = objc_msgSend( objc_msgSend( objc_msgSend(-[_CAEAGLNativeWindow mainLayers](self->super._win, "mainLayers", a3), "lastObject"),  "plug"),  "container");
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___MCContainerSerializer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___MCContainerNavigator, v7), (objc_opt_isKindOfClass(v4, v8) & 1) != 0))
  {
    objc_msgSend( self->super.super._attr.layer,  "setTransitionLayerPlugObjectID:",  objc_msgSend( objc_msgSend( objc_msgSend(-[_CAEAGLNativeWindow mainLayers](self->super._win, "mainLayers"), "lastObject"),  "plug"),  "objectID"));
  }

  [self->super.super._attr.layer setLiveSlideshowDelegate:self];
}

- (void)togglePlayback
{
  else {
    -[MRMarimbaLayer play](self, "play");
  }
}

- (void)setInteractivityIsEnabled:(BOOL)a3
{
  BYTE1(self->_viewRenderbuffer) = a3;
  layer = self->super.super._attr.layer;
  if (layer) {
    objc_msgSend(layer, "setInteractivityIsEnabled:");
  }
}

- (BOOL)isPlaying
{
  return [self->super.super._attr.layer isPlaying];
}

- (void)play
{
  if (BYTE2(self->_renderer))
  {
    layer = self->super.super._attr.layer;
    -[_CAEAGLNativeWindow videoDuration](self->super._win, "videoDuration");
    [layer setMasterStartTime:0 andDuration:0.0 mode:v4 + 0.00001];
  }

  -[MRMarimbaLayer setBailTimeWatcher:](self, "setBailTimeWatcher:", 1LL);
  [self->super.super._attr.layer resume];
  [self->super.super._attr.layer resumeSlideshow];
  document = self->_document;
  if (document)
  {
    if (!BYTE3(self->_renderer)) {
      -[MPDocument resume](document, "resume");
    }
  }

- (void)pause
{
  document = self->_document;
  if (document)
  {
    BYTE3(self->_renderer) = -[MPDocument suspended](document, "suspended");
    -[MPDocument suspend](self->_document, "suspend");
  }

- (void)pauseWhenStill
{
}

- (BOOL)stopWithVideo
{
  return BYTE2(self->_renderer);
}

- (void)setStopWithVideo:(BOOL)a3
{
  BYTE2(self->_renderer) = a3;
  layer = self->super.super._attr.layer;
  if (a3)
  {
    -[_CAEAGLNativeWindow videoDuration](self->super._win, "videoDuration");
    double v5 = v4;
    uint64_t v6 = layer;
    uint64_t v7 = 0LL;
  }

  else
  {
    double v5 = -1.0;
    uint64_t v6 = self->super.super._attr.layer;
    uint64_t v7 = 1LL;
  }

  [v6 setMasterStartTime:v7 andDuration:0.0 mode:v5];
}

- (BOOL)displaysFPS
{
  return [self->super.super._attr.layer displaysFPS];
}

- (void)setDisplaysFPS:(BOOL)a3
{
}

- (double)time
{
  return result;
}

- (void)setTime:(double)a3
{
}

- (double)timeRemaining
{
  double v4 = v3;
  [self->super.super._attr.layer time];
  return v4 - v5;
}

- (double)volume
{
  return v2;
}

- (void)setVolume:(double)a3
{
  *(float *)&a3 = a3;
  [self->super.super._attr.layer setVolume:a3];
}

- (void)setSuspended:(BOOL)a3
{
  document = self->_document;
  if (a3) {
    -[MPDocument suspend](document, "suspend");
  }
  else {
    -[MPDocument resume](document, "resume");
  }
}

- (BOOL)isAboutToPlay
{
  return BYTE4(self->_context);
}

- (void)setIsAboutToPlay:(BOOL)a3
{
  BYTE4(self->_context) = a3;
}

- (void)goBack
{
}

- (void)goForth
{
}

- (void)gotoEnd
{
}

- (void)gotoBeginning
{
}

- (void)nextFrame
{
  layer = self->super.super._attr.layer;
  [layer time];
  [layer setTime:v4 + 0.0166666667];
}

- (void)prevFrame
{
  layer = self->super.super._attr.layer;
  [layer time];
  [layer setTime:v4 + -0.0166666667];
}

- (MRRenderer)renderer
{
  double v3 = self->super.super._attr.layer;
  objc_sync_exit(self);
  return v3;
}

- (double)framesPerSecond
{
  return 1.0 / v2;
}

- (void)setFramesPerSecond:(double)a3
{
}

- (void)requestRendering:(BOOL)a3
{
}

- (void)warmupRenderer
{
}

- (void)beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5 switchToDocument:(id)a6
{
  if ((a4 - 1) <= 3)
  {
    uint64_t v8 = *(void *)&a4;
    [self->super.super._attr.layer size];
    if (v11 / v12 != a3 || [self->super.super._attr.layer orientation] != (_DWORD)v8)
    {
      if (*(double *)&self->_masterClockIsSet == 0.0)
      {
        if (LOBYTE(self->_viewRenderbuffer))
        {
          +[CATransaction begin](&OBJC_CLASS___CATransaction, "begin");
          +[CATransaction setAnimationDuration:](&OBJC_CLASS___CATransaction, "setAnimationDuration:", a5);
          uint64_t v23 = 0LL;
          __int128 v24 = xmmword_1F6850;
          uint64_t v25 = 0x400921FB54442D18LL;
          uint64_t v26 = 0LL;
          CGAffineTransformMakeRotation(&v22, *((CGFloat *)&v23 + v8));
          CGAffineTransform v21 = v22;
          -[MRMarimbaLayer setAffineTransform:](self, "setAffineTransform:", &v21);
          +[CATransaction commit](&OBJC_CLASS___CATransaction, "commit");
        }

        layer = self->super.super._attr.layer;
        if (layer)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1AAD28;
          block[3] = &unk_24DAF8;
          block[4] = a6;
          void block[5] = self;
          *(double *)&block[6] = a3;
          *(double *)&void block[7] = a5;
          dispatch_async((dispatch_queue_t)[layer renderDispatchQueue], block);
        }

        *(double *)&self->_masterClockIsSet = a3;
      }

      else
      {
        CGFloat width = self->_frameBufferSize.width;
        if (width != 0.0) {

        }
        uint64_t v14 = objc_alloc(&OBJC_CLASS___NSDictionary);
        *(float *)&double v15 = a3;
        double v16 = +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v15);
        double v17 = +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v8);
        *(float *)&double v18 = a5;
        *(void *)&self->_frameBufferSize.CGFloat width = -[NSDictionary initWithObjectsAndKeys:]( v14,  "initWithObjectsAndKeys:",  v16,  @"aspectRatio",  v17,  @"orientation",  +[NSNumber numberWithFloat:]( &OBJC_CLASS___NSNumber,  "numberWithFloat:",  v18),  @"duration",  a6,  @"nextDocument",  0LL);
      }
    }
  }

- (void)endMorphing
{
  if (*(double *)&self->_masterClockIsSet != 0.0)
  {
    *(void *)&self->_masterClockIsSet = 0LL;
    [self->super.super._attr.layer endMorphing];
    CGFloat width = self->_frameBufferSize.width;
    if (width != 0.0)
    {
      objc_msgSend(objc_msgSend(*(id *)&width, "objectForKey:", @"duration"), "floatValue");
      double v5 = v4;
      objc_msgSend( objc_msgSend(*(id *)&self->_frameBufferSize.width, "objectForKey:", @"aspectRatio"),  "floatValue");
      -[MRMarimbaLayer beginMorphingToAspectRatio:andOrientation:withDuration:switchToDocument:]( self,  "beginMorphingToAspectRatio:andOrientation:withDuration:switchToDocument:",  objc_msgSend( objc_msgSend(*(id *)&self->_frameBufferSize.width, "objectForKey:", @"orientation"),  "intValue"),  objc_msgSend(*(id *)&self->_frameBufferSize.width, "objectForKey:", @"nextDocument"),  v6,  v5);
      -[MRMarimbaLayer performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "endMorphing",  0LL,  v5);

      self->_frameBufferSize.CGFloat width = 0.0;
    }
  }

- (void)_reauthorForAspectRatioChange
{
  layer = self->super.super._attr.layer;
  if (layer)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1AB0B4;
    block[3] = &unk_24D5B0;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)[layer renderDispatchQueue], block);
  }

- (BOOL)nearingEndForSerializer:(id)a3
{
  if (-[MRMarimbaLayer isPlaying](self, "isPlaying"))
  {
    if (-[_CAEAGLNativeWindow isLive](self->super._win, "isLive"))
    {
      id v5 = -[MRMarimbaLayer _currentEffectContainer](self, "_currentEffectContainer");
      if (v5)
      {
        float v6 = v5;
        [v5 introTransitionDuration];
        if (v7 != 0.0 || ([v6 outroTransitionDuration], v8 != 0.0))
        {
          -[MRMarimbaLayer relativeTime](self, "relativeTime");
          double v10 = v9;
          [v6 startTime];
          double v12 = v10 - v11;
          objc_msgSend(objc_msgSend(v6, "parentLayer"), "timeIn");
          double v14 = v12 - v13;
          [v6 introTransitionDuration];
          if (v14 < v15)
          {
            [v6 introTransitionDuration];
LABEL_10:
            -[MRMarimbaLayer performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_nearingEndForSerializer:",  a3,  v16 - v14 + 0.1);
            return 0;
          }

          [v6 duration];
          double v18 = v17;
          [v6 outroTransitionDuration];
          if (v14 > v18 - v19 + -0.3)
          {
            [v6 duration];
            goto LABEL_10;
          }
        }
      }
    }
  }

  return -[MRMarimbaLayer _nearingEndForSerializer:](self, "_nearingEndForSerializer:", a3);
}

- (BOOL)_nearingEndForSerializer:(id)a3
{
  if (-[_CAEAGLNativeWindow isLive](self->super._win, "isLive"))
  {
    id v5 = -[NSMutableDictionary initWithObjectsAndKeys:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithObjectsAndKeys:",  a3,  @"container",  0LL);
    unsigned __int8 v6 = -[_CAEAGLNativeWindow nearingEndWithOptions:](self->super._win, "nearingEndWithOptions:", v5);
  }

  else
  {
    unsigned __int8 v6 = 0;
  }

  if (BYTE2(self->_renderer))
  {
    layer = self->super.super._attr.layer;
    -[_CAEAGLNativeWindow videoDuration](self->super._win, "videoDuration");
    [layer setMasterStartTime:0 andDuration:0.0 mode:v8];
  }

  return v6;
}

- (BOOL)effect:(id)a3 requestedNumberOfSlides:(unint64_t)a4 firstSlideIndexStillNeeded:(unint64_t)a5
{
  unsigned __int8 v6 = +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4),  @"requestedNumberOfSlides",  +[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a5),  @"firstSlideIndexStillNeeded",  a3,  @"container",  0LL);
  if (-[MRMarimbaLayer isPlaying](self, "isPlaying"))
  {
    id v7 = -[MRMarimbaLayer _currentEffectContainer](self, "_currentEffectContainer");
    if (v7)
    {
      double v8 = v7;
      [v7 introTransitionDuration];
      if (v9 != 0.0 || ([v8 outroTransitionDuration], v10 != 0.0))
      {
        -[MRMarimbaLayer relativeTime](self, "relativeTime");
        double v12 = v11;
        [v8 startTime];
        double v14 = v12 - v13;
        objc_msgSend(objc_msgSend(v8, "parentLayer"), "timeIn");
        double v16 = v14 - v15;
        [v8 introTransitionDuration];
        if (v16 < v17)
        {
          [v8 introTransitionDuration];
LABEL_9:
          -[MRMarimbaLayer performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_effectRequestedSlides:",  v6,  v18 - v16 + 0.1);
          return 0;
        }

        [v8 duration];
        double v20 = v19;
        [v8 outroTransitionDuration];
        if (v16 > v20 - v21 + -0.3)
        {
          [v8 duration];
          goto LABEL_9;
        }
      }
    }
  }

  return -[MRMarimbaLayer _effectRequestedSlides:](self, "_effectRequestedSlides:", v6);
}

- (BOOL)_effectRequestedSlides:(id)a3
{
  unsigned __int8 v4 = -[_CAEAGLNativeWindow nearingEndWithOptions:](self->super._win, "nearingEndWithOptions:", a3);
  if (BYTE2(self->_renderer))
  {
    layer = self->super.super._attr.layer;
    -[_CAEAGLNativeWindow videoDuration](self->super._win, "videoDuration");
    [layer setMasterStartTime:0 andDuration:0.0 mode:v6];
  }

  return v4;
}

- (void)didApplyStyle:(id)a3
{
  unsigned __int8 v4 = (_CAEAGLNativeWindow *)[a3 object];
  if (v4 == self->super._win)
  {
    if (-[_CAEAGLNativeWindow detectFacesInBackground](v4, "detectFacesInBackground"))
    {
      if (objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "needsFaceDetectionForStyleID:",  -[_CAEAGLNativeWindow styleID](self->super._win, "styleID")))
      {
        if (self->_document)
        {
          [*(id *)&self->_frameBufferSize.height invalidate];

          self->_frameBufferSize.double height = 0.0;
          -[MPDocument setIsCancelled:](self->_document, "setIsCancelled:", 0LL);
        }

        else
        {
          id v5 = objc_alloc_init(&OBJC_CLASS___MPFaceDetector);
          self->_document = (MPDocument *)v5;
          -[MPFaceDetector setDocument:](v5, "setDocument:", self->super._win);
          -[MPDocument setRenderer:](self->_document, "setRenderer:", self);
          -[MPDocument setIsCancelled:](self->_document, "setIsCancelled:", 0LL);
          objc_msgSend( +[MPStyleManager sharedManager](MPStyleManager, "sharedManager"),  "delayFaceDetectionForStyleID:",  -[_CAEAGLNativeWindow styleID](self->super._win, "styleID"));
          if (v6 != 0.0)
          {
            *(void *)&self->_frameBufferSize.double height =  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  self->_document,  "start",  0LL,  0LL);
            return;
          }
        }

        -[MPDocument start](self->_document, "start");
      }
    }

    else if (self->_document)
    {
      [*(id *)&self->_frameBufferSize.height invalidate];

      self->_frameBufferSize.double height = 0.0;
      -[MPDocument stop](self->_document, "stop");

      self->_document = 0LL;
    }
  }

- (void)didAddEffects:(id)a3
{
  if (BYTE2(self->_renderer))
  {
    layer = self->super.super._attr.layer;
    -[_CAEAGLNativeWindow videoDuration](self->super._win, "videoDuration", a3);
    [layer setMasterStartTime:0 andDuration:0.0 mode:v4];
  }

- (CGImage)snapshotAsCGImageForTime:(double)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = -[MRSnapshotter initWithMontage:andAssetManagementDelegate:isReadOnly:]( objc_alloc(&OBJC_CLASS___MRSnapshotter),  "initWithMontage:andAssetManagementDelegate:isReadOnly:",  -[_CAEAGLNativeWindow montage](self->super._win, "montage"),  self->super._win,  1LL);
  -[MRSnapshotter setSize:](v7, "setSize:", width, height);
  double v8 = -[MRSnapshotter CGImageSnapshotAtTime:](v7, "CGImageSnapshotAtTime:", a3);

  return v8;
}

- (CGImage)snapshotAsCGImage
{
  return (CGImage *)[self->super.super._attr.layer currentFrameAsCGImage];
}

- (void)touchesBegan:(id)a3
{
}

- (void)touchesMoved:(id)a3
{
}

- (void)touchesEnded:(id)a3
{
}

- (void)touchesCancelled:(id)a3
{
}

- (void)setEnableSlideDidChangeNotification:(BOOL)a3
{
  if (LOBYTE(self->_faceTimer) != a3)
  {
    BOOL v3 = a3;
    LOBYTE(self->_faceTimer) = a3;
    id v5 = +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter");
    if (v3) {
      -[NSNotificationCenter addObserver:selector:name:object:]( v5,  "addObserver:selector:name:object:",  self,  "_slideDidAppear:",  kMRNotificationSlideIsOn,  0LL);
    }
    else {
      -[NSNotificationCenter removeObserver:name:object:]( v5,  "removeObserver:name:object:",  self,  kMRNotificationSlideIsOn,  0LL);
    }
  }

- (void)beginEditingOfText:(id)a3
{
  id v5 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"text%d",  [a3 index]);
  id v6 = [a3 nearestPlug];
  [self->super.super._attr.layer requestRenderingWithin:10.0];
  [self->super.super._attr.layer beginTextEditingOfElement:v5 inPlug:v6 callDelegate:1];
}

- (BOOL)isReadonly
{
  return BYTE5(self->_context);
}

- (void)setIsReadonly:(BOOL)a3
{
  BYTE5(self->_context) = a3;
}

- (BOOL)slidesAreReadonly
{
  return BYTE6(self->_context);
}

- (void)setSlidesAreReadonly:(BOOL)a3
{
  BYTE6(self->_context) = a3;
}

- (BOOL)enableSlideDidChangeNotification
{
  return (BOOL)self->_faceTimer;
}

- (BOOL)rendererSizeIsLocked
{
  return HIBYTE(self->_context);
}

- (BOOL)correctsForAutorotation
{
  return self->_viewRenderbuffer;
}

- (void)setCorrectsForAutorotation:(BOOL)a3
{
  LOBYTE(self->_viewRenderbuffer) = a3;
}

- (BOOL)interactivityIsEnabled
{
  return BYTE1(self->_viewRenderbuffer);
}

- (id)lastSlideChange
{
  return *(id *)&self->_timestampOfLastRenderPass;
}

- (void)setLastSlideChange:(id)a3
{
  double timestampOfLastRenderPass = self->_timestampOfLastRenderPass;
  if (timestampOfLastRenderPass != 0.0)
  {

    self->_double timestampOfLastRenderPass = 0.0;
  }

  *(void *)&self->_double timestampOfLastRenderPass = [a3 copy];
}

- (BOOL)bailTimeWatcher
{
  return BYTE1(self->_renderer);
}

- (void)setBailTimeWatcher:(BOOL)a3
{
  BYTE1(self->_renderer) = a3;
}

- (void)destroyFramebuffer
{
  id v7 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  BOOL v3 = v7;
  if (v7 != *(EAGLContext **)&self->_enableSlideDidChangeNotification) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:");
  }
  if (HIDWORD(self->_lastSlideChange)) {
    glDeleteFramebuffers(1, (const GLuint *)&self->_lastSlideChange + 1);
  }
  HIDWORD(self->_lastSlideChange) = 0;
  if (LODWORD(self->_lastSlideChange)) {
    glDeleteRenderbuffers(1, (const GLuint *)&self->_lastSlideChange);
  }
  LODWORD(self->_lastSlideChange) = 0;
  p_context = &self->_context;
  if (*(_DWORD *)p_context) {
    glDeleteRenderbuffers(1, (const GLuint *)p_context);
  }
  *(_DWORD *)p_context = 0;
  id v5 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  id v6 = v7;
  if (v5 != v7)
  {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v7);
    id v6 = v7;
  }
}

- (BOOL)updateFramebuffer
{
  BOOL v3 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  double v4 = v3;
  if (v3 != *(EAGLContext **)&self->_enableSlideDidChangeNotification) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:");
  }
  id v5 = (GLuint *)&self->_lastSlideChange + 1;
  if (!HIDWORD(self->_lastSlideChange)) {
    glGenFramebuffers(1, (GLuint *)&self->_lastSlideChange + 1);
  }
  p_lastSlideChange = &self->_lastSlideChange;
  if (!LODWORD(self->_lastSlideChange)) {
    glGenRenderbuffers(1, (GLuint *)&self->_lastSlideChange);
  }
  glBindFramebuffer(0x8D40u, *v5);
  glLabelObjectEXT(0x8D40u, *v5, 0, "Marimba Framebuffer");
  glBindRenderbuffer(0x8D41u, *(_DWORD *)p_lastSlideChange);
  glLabelObjectEXT(0x8D41u, *(_DWORD *)p_lastSlideChange, 0, "Marimba Renderbuffer");
  [*(id *)&self->_enableSlideDidChangeNotification renderbufferStorage:36161 fromDrawable:self];
  glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, *(_DWORD *)p_lastSlideChange);
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params);
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v50);
  p_GLuint context = (GLuint *)&self->_context;
  GLuint context = (GLuint)self->_context;
  if (!context)
  {
    glGenRenderbuffers(1, (GLuint *)&self->_context);
    GLuint context = *p_context;
  }

  glBindRenderbuffer(0x8D41u, context);
  glLabelObjectEXT(0x8D41u, *p_context, 0, "Marimba Depthbuffer");
  glRenderbufferStorage(0x8D41u, 0x81A5u, params, v50);
  glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, *p_context);
  glBindRenderbuffer(0x8D41u, *(_DWORD *)p_lastSlideChange);
  GLenum v9 = glCheckFramebufferStatus(0x8D40u);
  *(CGSize *)&self->_faceDetector = CGSizeZero;
  if (v9 == 36053)
  {
    double v10 = (double)v50;
    *(double *)&self->_faceDetector = (double)params;
    self->_double morphingToAspectRatio = v10;
  }

  else
  {
    uint64_t v11 = glCheckFramebufferStatus(0x8D40u);
    NSLog(@"failed to make complete framebuffer object %x", v11);
    GLint v49 = 0;
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD0u, &v49);
    uint64_t v12 = v49;
    uint64_t Error = glGetError();
    NSLog( @"GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE, %x, %x"),  v12,  Error);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD1u, &v49);
    uint64_t v14 = v49;
    uint64_t v15 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME, %x, %x"), v14, v15);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD2u, &v49);
    uint64_t v16 = v49;
    uint64_t v17 = glGetError();
    NSLog( @"GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL, %x, %x"),  v16,  v17);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD3u, &v49);
    uint64_t v18 = v49;
    uint64_t v19 = glGetError();
    NSLog( @"GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE, %x, %x"),  v18,  v19);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD0u, &v49);
    uint64_t v20 = v49;
    uint64_t v21 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE, %x, %x"), v20, v21);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD1u, &v49);
    uint64_t v22 = v49;
    uint64_t v23 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME, %x, %x"), v22, v23);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD2u, &v49);
    uint64_t v24 = v49;
    uint64_t v25 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL, %x, %x"), v24, v25);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD3u, &v49);
    uint64_t v26 = v49;
    uint64_t v27 = glGetError();
    NSLog( @"GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE, %x, %x"),  v26,  v27);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD0u, &v49);
    uint64_t v28 = v49;
    uint64_t v29 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE, %x, %x"), v28, v29);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD1u, &v49);
    uint64_t v30 = v49;
    uint64_t v31 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME, %x, %x"), v30, v31);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD2u, &v49);
    uint64_t v32 = v49;
    uint64_t v33 = glGetError();
    NSLog( @"GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL, %x, %x"),  v32,  v33);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD3u, &v49);
    uint64_t v34 = v49;
    uint64_t v35 = glGetError();
    NSLog( @"GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE, %x, %x"),  v34,  v35);
    glBindRenderbuffer(0x8D41u, *(_DWORD *)p_lastSlideChange);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v49);
    uint64_t v36 = v49;
    uint64_t v37 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, %x, %x"), v36, v37);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v49);
    uint64_t v38 = v49;
    uint64_t v39 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, %x, %x"), v38, v39);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D44u, &v49);
    uint64_t v40 = v49;
    uint64_t v41 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_INTERNAL_FORMAT, %x, %x"), v40, v41);
    glBindRenderbuffer(0x8D41u, *p_context);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v49);
    uint64_t v42 = v49;
    uint64_t v43 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, %x, %x"), v42, v43);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v49);
    uint64_t v44 = v49;
    uint64_t v45 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, %x, %x"), v44, v45);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D44u, &v49);
    uint64_t v46 = v49;
    uint64_t v47 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_INTERNAL_FORMAT, %x, %x"), v46, v47);
    glBindRenderbuffer(0x8D41u, *(_DWORD *)p_lastSlideChange);
  }

  if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v3) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v3);
  }

  return v9 == 36053;
}

@end