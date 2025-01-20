@interface MRRenderer
+ (BOOL)isDiskImageCacheEnabled;
+ (double)textScaleForResolution:(CGSize)a3;
- (BOOL)_doActions;
- (BOOL)_r_prerenderWithPassParameters:(id)a3;
- (BOOL)allowsThumbnails;
- (BOOL)asynchronousOperationsAreSuspended;
- (BOOL)beginTextEditingOfElement:(id)a3 inLayer:(id)a4 callDelegate:(BOOL)a5;
- (BOOL)beginTextEditingOfElement:(id)a3 inPlug:(id)a4 callDelegate:(BOOL)a5;
- (BOOL)canGoBack;
- (BOOL)canGoForth;
- (BOOL)canGoToMoreSlides:(BOOL)a3;
- (BOOL)displaysFPS;
- (BOOL)displaysHitZonesVisualFeedback;
- (BOOL)displaysIsPreloadingImages;
- (BOOL)displaysPlayingIDs;
- (BOOL)displaysTouchVisualFeedback;
- (BOOL)getVerticesCoordinatesForCurrentlyEditedTextElement:(CGPoint *)(a3;
- (BOOL)hideTextWhileEditing;
- (BOOL)ignoresBackgroundAudio;
- (BOOL)interactivityIsEnabled;
- (BOOL)isCleanedUp;
- (BOOL)isEditing;
- (BOOL)isFlipped;
- (BOOL)isOffscreen;
- (BOOL)isPlaying;
- (BOOL)logRenderingTimes;
- (BOOL)prerenderWithPassParameters:(id)a3;
- (BOOL)pushRendering;
- (BOOL)requestRenderingOnChanges;
- (BOOL)requestRenderingWithin:(double)a3;
- (BOOL)screenBurnTest;
- (BOOL)slaveFrameMode;
- (BOOL)slideshowIsPlaying;
- (CGImage)currentFrameAsCGImage;
- (CGImage)snapshotAsCGImageForTime:(double)a3 andSize:(CGSize)a4;
- (CGPoint)_fixPointForUnprojectionForOrientation:(CGPoint)a3;
- (CGPoint)_fixProjectedPointForOrientation:(CGPoint)a3;
- (CGPoint)contextOffset;
- (CGSize)_maxSizeForCurrentEditingTextElement;
- (CGSize)size;
- (MCMontage)montage;
- (MRAsynchronousOperationsDelegate)asynchronousOperationsDelegate;
- (MRCameraCaptureSession)cameraCaptureSession;
- (MRContext)context;
- (MREditingDelegate)editingDelegate;
- (MRFeatureDelegate)featureDelegate;
- (MRLiveSlideshowDelegate)liveSlideshowDelegate;
- (MRRenderer)init;
- (MRRenderer)initWithParameters:(id)a3;
- (MRRenderingDelegate)renderingDelegate;
- (MZMediaManagement)assetManagementDelegate;
- (NSDictionary)parameters;
- (NSString)currentFocusedSlideAsset;
- (NSString)renderingLogFilePath;
- (NSString)transitionLayerPlugObjectID;
- (OS_dispatch_queue)renderDispatchQueue;
- (double)_doAction:(id)a3;
- (double)_time;
- (double)_unalteredTime;
- (double)animateCurrentFocuserToSlideFocusModeWithDuration:(double)a3;
- (double)currentSlideshowTime;
- (double)defaultPauseResumeOnTap:(BOOL)a3;
- (double)enterSlideFocusModeWithState:(id)a3 animate:(BOOL)a4;
- (double)enterSlideZoomMode;
- (double)exitSlideFocusMode;
- (double)exitSlideZoomMode:(BOOL)a3;
- (double)fadeInDuration;
- (double)fadeInStartTime;
- (double)fadeOutDuration;
- (double)fadeOutStartTime;
- (double)focusedTransitionCancel:(id)a3;
- (double)focusedTransitionEnd:(id)a3;
- (double)focusedTransitionStart:(id)a3;
- (double)focusedTransitionUpdate:(id)a3;
- (double)interactiveTransitionProgressThreshold;
- (double)interactiveTransitionTrackingBoxRadius;
- (double)interactiveTransitionVelocityThreshold;
- (double)masterClock;
- (double)slideZoomCancel:(id)a3;
- (double)slideZoomEnd:(id)a3;
- (double)slideZoomStart:(id)a3;
- (double)slideZoomUpdate:(id)a3;
- (double)slideshowTransitionCancel:(id)a3;
- (double)slideshowTransitionEnd:(id)a3;
- (double)slideshowTransitionStart:(id)a3;
- (double)slideshowTransitionUpdate:(id)a3;
- (double)time;
- (double)timeQuantum;
- (double)timestampOfLastRenderPass;
- (float)volume;
- (id)_computeMatrixChainForLayer:(id)a3;
- (id)_layerForPlugObjectID:(id)a3;
- (id)actionByEvaluatingConditionalAction:(id)a3 withStates:(id)a4;
- (id)chooseTransitionIDForRandomTransitionPresetID:(id)a3;
- (id)currentState;
- (id)currentStateForMontageSwap;
- (id)currentlyShowingAssetPaths;
- (id)defaultActionsWithHitLayer:(id)a3 atPoint:(CGPoint)a4;
- (id)layerAtPath:(id)a3 fromLayer:(id)a4;
- (id)layerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5;
- (id)plugForCurrentSublayerInNavigatorForPlug:(id)a3;
- (id)selectedLayers;
- (id)slideInfoForCurrentElement:(id)a3;
- (id)slideInfosForCurrentElements;
- (id)snapshotOfStates:(id)a3 atSize:(CGSize)a4;
- (int)mode;
- (int)orientation;
- (int64_t)_maxLinesForCurrentEditingTextElement;
- (unsigned)currentLayoutIndex;
- (void)_adaptToPressureLevel:(int)a3;
- (void)_cleanupGestureRecognizers;
- (void)_createSlideFocusLayer;
- (void)_dimLayersExceptForPathTo:(id)a3;
- (void)_displayFPS:(double)a3 actuallyDisplay:(BOOL)a4;
- (void)_displayHitZonesVisualFeedback;
- (void)_displayIsPreloadingImages;
- (void)_displayPlayingIDs;
- (void)_displayTouchVisualFeedback;
- (void)_doLayerTrackingAtLocation:(CGPoint)a3;
- (void)_findAndHandleBestRecognizerInRecognizers:(id)a3;
- (void)_playbackIsOverWithTime:(double)a3 sendNotification:(BOOL)a4;
- (void)_r_beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5;
- (void)_r_doSnapshot;
- (void)_r_endMorphing;
- (void)_r_pause;
- (void)_r_render;
- (void)_r_renderForScreenBurnTestAtTime:(double)a3;
- (void)_r_renderRotation;
- (void)_r_renderWithPassParameters:(id)a3;
- (void)_r_resume;
- (void)_r_setTime:(double)a3 isResyncing:(BOOL)a4;
- (void)_r_snapshotForRotation;
- (void)_r_startRenderTimer;
- (void)_r_stopRenderTimer;
- (void)_r_syncIsPlayingToOuter;
- (void)_r_syncTimeToOuter;
- (void)_r_updateTimeWithDisplayLinkTimestamp:(double)a3;
- (void)_renderOnDisplayLink:(id)a3;
- (void)_renderThreadMain;
- (void)_startDisplayLinkOnRunloop;
- (void)_startMonitoringThermalPressureLevelChanges;
- (void)_stopMonitoringThermalPressureLevelChanges;
- (void)_undimAllLayersInLayer:(id)a3;
- (void)addAudioObject:(id)a3;
- (void)addIDToDisplay:(id)a3 :(id)a4;
- (void)addNavigatorToBackHistory:(id)a3;
- (void)addNavigatorToForthHistory:(id)a3;
- (void)applyStateForMontageSwap:(id)a3;
- (void)beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5;
- (void)cleanup;
- (void)dealloc;
- (void)deselectAllLayers;
- (void)deselectLayer:(id)a3;
- (void)didGoToPreviousOrNextFocusedSlide:(BOOL)a3 withAction:(id)a4;
- (void)dimLayersExceptForPathTo:(id)a3;
- (void)disableFadeInAndOut;
- (void)doAction:(id)a3;
- (void)dumpActiveHierarchy;
- (void)effect:(id)a3 requestedNumberOfSlides:(unint64_t)a4 firstSlideIndexStillNeeded:(unint64_t)a5;
- (void)endMorphing;
- (void)endTextEditing:(BOOL)a3;
- (void)freeze;
- (void)goBack;
- (void)goForth;
- (void)gotoNextFocusedSlide:(BOOL)a3;
- (void)gotoNextInterestingTime:(BOOL)a3;
- (void)gotoPreviousFocusedSlide:(BOOL)a3;
- (void)gotoPreviousInterestingTime:(BOOL)a3;
- (void)gotoState:(id)a3;
- (void)imagePreloadingBegan;
- (void)imagePreloadingEnded;
- (void)jumpToNextMarker;
- (void)jumpToPreviousMarker;
- (void)moveNavigatorFromBackToForthHistory:(id)a3;
- (void)moveNavigatorFromForthToBackHistory:(id)a3;
- (void)nearingEndForSerializer:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)pauseSlideshow;
- (void)pauseWhenStill;
- (void)processAudioObjects;
- (void)removeAudioObject:(id)a3;
- (void)removeNavigatorFromBackHistory:(id)a3;
- (void)removeNavigatorFromForthHistory:(id)a3;
- (void)render;
- (void)requestRendering:(BOOL)a3;
- (void)resetFadeInAndOut;
- (void)resume;
- (void)resumeSlideshow;
- (void)selectLayer:(id)a3;
- (void)sendMCAction:(id)a3 fromSender:(id)a4;
- (void)sendMCAction:(id)a3 fromSender:(id)a4 toTarget:(id)a5;
- (void)sendNotification:(id)a3;
- (void)setAllowsThumbnails:(BOOL)a3;
- (void)setAssetManagementDelegate:(id)a3;
- (void)setAsynchronousOperationsDelegate:(id)a3;
- (void)setCameraCaptureSession:(id)a3;
- (void)setContextOffset:(CGPoint)a3;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setDisplaysFPS:(BOOL)a3;
- (void)setDisplaysHitZonesVisualFeedback:(BOOL)a3;
- (void)setDisplaysIsPreloadingImages:(BOOL)a3;
- (void)setDisplaysPlayingIDs:(BOOL)a3;
- (void)setDisplaysTouchVisualFeedback:(BOOL)a3;
- (void)setEAGLContext:(id)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeInStartTime:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setFadeOutStartTime:(double)a3;
- (void)setFeatureDelegate:(id)a3;
- (void)setFreezeSizeOfImageRequests:(BOOL)a3;
- (void)setHideTextWhileEditing:(BOOL)a3;
- (void)setIgnoresBackgroundAudio:(BOOL)a3;
- (void)setInteractiveTransitionProgressThreshold:(double)a3;
- (void)setInteractiveTransitionTrackingBoxRadius:(double)a3;
- (void)setInteractiveTransitionVelocityThreshold:(double)a3;
- (void)setInteractivityIsEnabled:(BOOL)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setLiveSlideshowDelegate:(id)a3;
- (void)setLogRenderingTimes:(BOOL)a3;
- (void)setMasterClock:(double)a3;
- (void)setMasterStartTime:(double)a3 andDuration:(double)a4 mode:(int)a5;
- (void)setMode:(int)a3;
- (void)setMontage:(id)a3;
- (void)setOrientation:(int)a3;
- (void)setPushRendering:(BOOL)a3;
- (void)setRenderingDelegate:(id)a3;
- (void)setRequestRenderingOnChanges:(BOOL)a3;
- (void)setScreenBurnTest:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setSlaveFrameMode:(BOOL)a3;
- (void)setSlideFocusModeBackgroundColor:(CGColor *)a3;
- (void)setSlideshowTime:(double)a3;
- (void)setTemporarySize:(CGSize)a3;
- (void)setTime:(double)a3;
- (void)setTimeQuantum:(double)a3;
- (void)setTimestampOfLastRenderPass:(double)a3;
- (void)setTransitionLayerPlugObjectID:(id)a3;
- (void)setUseCGLFlushDrawableWorkaround:(BOOL)a3;
- (void)setUsesExternalDisplayLink:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)stepBackward;
- (void)stepForward;
- (void)suspendAsynchronousOperations:(BOOL)a3;
- (void)swapMontage:(id)a3;
- (void)touchesBegan:(id)a3;
- (void)touchesCancelled:(id)a3;
- (void)touchesEnded:(id)a3;
- (void)touchesMoved:(id)a3;
- (void)transitionToNextPlugInContainerOfPlug:(id)a3;
- (void)transitionToPreviousPlugInContainerOfPlug:(id)a3;
- (void)undimAllLayers;
- (void)unfreeze;
- (void)updateTimeWithDisplayLinkTimestamp:(double)a3;
- (void)warmupVideo:(BOOL)a3;
- (void)willGoToPreviousOrNextFocusedSlide:(BOOL)a3 withAction:(id)a4 animate:(BOOL)a5;
@end

@implementation MRRenderer

- (void)doAction:(id)a3
{
  if (a3)
  {
    [a3 check];
    mActions = self->mInternal->mActions;
    objc_sync_enter(mActions);
    -[NSMutableArray addObject:](self->mInternal->mActions, "addObject:", a3);
    objc_sync_exit(mActions);
    if (-[MRRenderer requestRenderingOnChanges](self, "requestRenderingOnChanges")) {
      -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
    }
  }

- (void)sendMCAction:(id)a3 fromSender:(id)a4
{
  v6 = -[MRAction initWithAction:inRenderer:]( objc_alloc(&OBJC_CLASS___MRAction),  "initWithAction:inRenderer:",  a3,  self);
  -[MRAction setSender:](v6, "setSender:", a4);
  -[MRRenderer time](self, "time");
  -[MRAction setTime:](v6, "setTime:");
  mActions = self->mInternal->mActions;
  objc_sync_enter(mActions);
  -[NSMutableArray addObject:](self->mInternal->mActions, "addObject:", v6);
  objc_sync_exit(mActions);

  -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
}

- (void)sendMCAction:(id)a3 fromSender:(id)a4 toTarget:(id)a5
{
  v7 = -[MRAction initWithAction:andTarget:](objc_alloc(&OBJC_CLASS___MRAction), "initWithAction:andTarget:", a3, a5);
  -[MRAction setSender:](v7, "setSender:", a4);
  -[MRRenderer time](self, "time");
  -[MRAction setTime:](v7, "setTime:");
  mActions = self->mInternal->mActions;
  objc_sync_enter(mActions);
  -[NSMutableArray addObject:](self->mInternal->mActions, "addObject:", v7);
  objc_sync_exit(mActions);

  -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
}

- (id)actionByEvaluatingConditionalAction:(id)a3 withStates:(id)a4
{
  id v6 = [a3 predicate];
  v7 = (NSMutableDictionary *)qword_2AE3E0;
  if (!qword_2AE3E0)
  {
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    qword_2AE3E0 = (uint64_t)v7;
  }

  v8 = (MUMathExpressionFloatBased *)-[NSMutableDictionary objectForKey:](v7, "objectForKey:", v6);
  if (v8)
  {
    v9 = v8;
    -[MUMathExpressionFloatBased resetAllVariables](v8, "resetAllVariables");
  }

  else
  {
    v9 = -[MUMathExpressionFloatBased initWithString:error:]( objc_alloc(&OBJC_CLASS___MUMathExpressionFloatBased),  "initWithString:error:",  v6,  0LL);
    if (v9)
    {
      [(id)qword_2AE3E0 setObject:v9 forKey:v6];
    }
  }

  -[MUMathExpressionFloatBased setVariableValues:](v9, "setVariableValues:", a4);
  -[MUMathExpressionFloatBased evaluate](v9, "evaluate");
  if (v10 == 0.0) {
    return [a3 actionIfFalse];
  }
  else {
    return [a3 actionIfTrue];
  }
}

- (double)_doAction:(id)a3
{
  id v5 = [a3 mcAction];
  if (!v5)
  {
    [a3 invoke];
    return result;
  }

  v7 = v5;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___MRMCBlockAction, v6);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    float v10 = (void (**)(id, id))[v7 block];
    v10[2](v10, a3);
    return result;
  }

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___MCTransitionTrigger, v9);
  if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
  {
    id v14 = [a3 resolvedTarget];
    if (v14)
    {
      objc_msgSend( v14,  "doTransition:backwards:pzr:",  objc_msgSend(a3, "mcAction"),  0,  objc_msgSend(a3, "specificObject"));
      return result;
    }

    return 0.0;
  }

  uint64_t v15 = objc_opt_class(&OBJC_CLASS___MCAnimationTrigger, v13);
  if ((objc_opt_isKindOfClass(v7, v15) & 1) != 0)
  {
    id v17 = [a3 resolvedTarget];
    if (v17)
    {
      [v17 doAnimationTrigger:a3];
      return result;
    }

    return 0.0;
  }

  uint64_t v18 = objc_opt_class(&OBJC_CLASS___MCActionTrigger, v16);
  if ((objc_opt_isKindOfClass(v7, v18) & 1) != 0)
  {
    id v20 = [a3 resolvedTarget];
    if (v20)
    {
      [v20 doActionTrigger:a3];
      return result;
    }

    return 0.0;
  }

  uint64_t v21 = objc_opt_class(&OBJC_CLASS___MCStateOperation, v19);
  if ((objc_opt_isKindOfClass(v7, v21) & 1) != 0)
  {
    id v23 = [a3 resolvedTarget];
    if (v23)
    {
      [v23 doStateOperation:a3];
      return result;
    }

    return 0.0;
  }

  uint64_t v24 = objc_opt_class(&OBJC_CLASS___MCMotionTrigger, v22);
  if ((objc_opt_isKindOfClass(v7, v24) & 1) != 0)
  {
    id v26 = [a3 resolvedTarget];
    if (v26)
    {
      [v26 doMotionTrigger:a3];
      return result;
    }

    return 0.0;
  }

  uint64_t v28 = objc_opt_class(&OBJC_CLASS___MCGenericAction, v25);
  if ((objc_opt_isKindOfClass(v7, v28) & 1) == 0)
  {
    uint64_t v34 = objc_opt_class(&OBJC_CLASS___MCConditionalAction, v29);
    if ((objc_opt_isKindOfClass(v7, v34) & 1) != 0)
    {
      v36 = -[MRAction initWithAction:inRenderer:]( [MRAction alloc],  "initWithAction:inRenderer:",  -[MRRenderer actionByEvaluatingConditionalAction:withStates:]( self,  "actionByEvaluatingConditionalAction:withStates:",  [a3 mcAction],  objc_msgSend(a3, "states")),  self);
      -[MRAction setSender:](v36, "setSender:", [a3 sender]);
      -[MRAction setStates:](v36, "setStates:", [a3 states]);
      [a3 time];
      -[MRAction setTime:](v36, "setTime:");
    }

    else
    {
      uint64_t v37 = objc_opt_class(&OBJC_CLASS___MCActionForEachPlug, v35);
      if ((objc_opt_isKindOfClass(v7, v37) & 1) == 0)
      {
        uint64_t v44 = objc_opt_class(&OBJC_CLASS___MCActionGroup, v38);
        double v27 = 0.0;
        if ((objc_opt_isKindOfClass(v7, v44) & 1) != 0)
        {
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          id v45 = objc_msgSend(objc_msgSend(a3, "mcAction"), "actions");
          id v46 = [v45 countByEnumeratingWithState:&v62 objects:v70 count:16];
          if (v46)
          {
            id v47 = v46;
            uint64_t v48 = *(void *)v63;
            do
            {
              for (i = 0LL; i != v47; i = (char *)i + 1)
              {
                if (*(void *)v63 != v48) {
                  objc_enumerationMutation(v45);
                }
                v50 = -[MRAction initWithAction:inRenderer:]( objc_alloc(&OBJC_CLASS___MRAction),  "initWithAction:inRenderer:",  *(void *)(*((void *)&v62 + 1) + 8LL * (void)i),  self);
                -[MRAction setSender:](v50, "setSender:", [a3 sender]);
                -[MRAction setStates:]( v50,  "setStates:",  objc_msgSend(objc_msgSend(a3, "states"), "mutableCopy"));
                [a3 time];
                -[MRAction setTime:](v50, "setTime:");
                -[MRRenderer _doAction:](self, "_doAction:", v50);
                double v52 = v51;

                if (v52 > v27) {
                  double v27 = v52;
                }
              }

              id v47 = [v45 countByEnumeratingWithState:&v62 objects:v70 count:16];
            }

            while (v47);
          }
        }

        return v27;
      }

      id v39 = [a3 resolvedTarget];
      id v40 = [v7 prefix];
      id v41 = v40;
      if (v40)
      {
        v42 = (char *)[v40 length] + 1;
        v43 = +[NSMutableDictionary dictionaryWithDictionary:]( NSMutableDictionary,  "dictionaryWithDictionary:",  [a3 states]);
      }

      else
      {
        v43 = (NSMutableDictionary *)[a3 states];
        v42 = 0LL;
      }

      v36 = -[MRAction initWithAction:inRenderer:]( [MRAction alloc],  "initWithAction:inRenderer:",  [v7 action],  self);
      -[MRAction setSender:](v36, "setSender:", [a3 sender]);
      -[MRAction setStates:](v36, "setStates:", v43);
      [a3 time];
      -[MRAction setTime:](v36, "setTime:");
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      id v55 = [v39 sublayers];
      id v56 = [v55 countByEnumeratingWithState:&v66 objects:v71 count:16];
      if (v56)
      {
        id v57 = v56;
        uint64_t v58 = *(void *)v67;
        do
        {
          for (j = 0LL; j != v57; j = (char *)j + 1)
          {
            if (*(void *)v67 != v58) {
              objc_enumerationMutation(v55);
            }
            uint64_t v60 = *(void *)(*((void *)&v66 + 1) + 8LL * (void)j);
            if (v41) {
              -[NSMutableDictionary setObject:forKey:]( v43,  "setObject:forKey:",  +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend( objc_msgSend( objc_msgSend(*(id *)(*((void *)&v66 + 1) + 8 * (void)j), "idInSupercontainer"),  "substringFromIndex:",  v42),  "intValue")),  @"_forEachPlugIndex");
            }
            -[MRAction setResolvedTarget:](v36, "setResolvedTarget:", v60);
            -[MRRenderer _doAction:](self, "_doAction:", v36);
          }

          id v57 = [v55 countByEnumeratingWithState:&v66 objects:v71 count:16];
        }

        while (v57);
      }
    }

    -[MRRenderer _doAction:](self, "_doAction:", v36);
    double v27 = v61;

    return v27;
  }

  id v30 = [a3 resolvedTarget];
  double v27 = 0.0;
  if (!v30) {
    return v27;
  }
  v31 = v30;
  id v32 = objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes");
  id v33 = [v32 objectForKey:@"type"];
  if ([v33 isEqualToString:@"phaseIn"])
  {
    objc_msgSend(v31, "phaseInSublayerForKey:", objc_msgSend(v32, "objectForKey:", @"plugID"));
  }

  else if ([v33 isEqualToString:@"phaseOut"])
  {
    objc_msgSend(v31, "phaseOutSublayerForKey:", objc_msgSend(v32, "objectForKey:", @"plugID"));
  }

  else
  {
    if ([v33 isEqualToString:@"startTracking"])
    {
      v53 = -[NSDictionary initWithObjectsAndKeys:]( [NSDictionary alloc],  "initWithObjectsAndKeys:",  v31,  @"layer",  [a3 mcAction],  @"action",  0);
      mLayerTrackings = self->mInternal->mLayerTrackings;
      if (!mLayerTrackings)
      {
        self->mInternal->mLayerTrackings = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        mLayerTrackings = self->mInternal->mLayerTrackings;
      }

      -[NSMutableDictionary setObject:forKey:](mLayerTrackings, "setObject:forKey:", v53, [v31 uuid]);

      return v27;
    }

    if ([v33 isEqualToString:@"endTracking"])
    {
      -[NSMutableDictionary removeObjectForKey:]( self->mInternal->mLayerTrackings,  "removeObjectForKey:",  [v31 uuid]);
      return v27;
    }

    [v31 doGenericAction:a3];
  }

  return result;
}

- (BOOL)_doActions
{
  BOOL v3 = 0;
  double v4 = 0.0;
  while (1)
  {
    mActions = self->mInternal->mActions;
    objc_sync_enter(mActions);
    if (!-[NSMutableArray count](self->mInternal->mActions, "count")) {
      break;
    }
    uint64_t v6 = self->mInternal->mActions;
    self->mInternal->mActions = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    objc_sync_exit(mActions);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v6);
          }
          float v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          -[MRRenderer _doAction:](self, "_doAction:", v10);
          double v12 = v11;
          [v10 time];
          if (v12 > v4 && v13 > -100000.0) {
            double v4 = v12;
          }
        }

        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v23,  v27,  16LL);
      }

      while (v7);
      BOOL v3 = 1;
    }
  }

  objc_sync_exit(mActions);
  -[MRRenderer time](self, "time");
  if (v4 > 0.0)
  {
    double v16 = v15;
    if (!-[MRRenderer isPlaying](self, "isPlaying")
      || (mInternal = self->mInternal, double mMasterDuration = mInternal->mMasterDuration, mMasterDuration > 0.0)
      && v4 + v16 >= mMasterDuration + mInternal->mMasterStartTime)
    {
      -[MRRenderer time](self, "time");
      double v20 = v19;
      -[MRRenderer timeQuantum](self, "timeQuantum");
      -[MRRenderer setMasterStartTime:andDuration:mode:]( self,  "setMasterStartTime:andDuration:mode:",  2LL,  v20,  v4 + v21);
      -[MRRenderer resume](self, "resume");
    }
  }

  return v3;
}

- (double)defaultPauseResumeOnTap:(BOOL)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_277D0;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
  return 0.0;
}

- (BOOL)slideshowIsPlaying
{
  return !self->_slideshowIsPaused;
}

- (void)resumeSlideshow
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_27880;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (void)pauseSlideshow
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_27A9C;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (double)currentSlideshowTime
{
  id v2 = -[MRRenderer _layerForPlugObjectID:]( self,  "_layerForPlugObjectID:",  self->mInternal->mTransitionLayerPlugObjectID);
  [v2 timeIn];
  double v4 = v3;
  [v2 currentSlideshowTime];
  return v4 + v5;
}

- (void)setSlideshowTime:(double)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_27D1C;
  v4[3] = &unk_24D3B8;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(mRenderDispatchQueue, v4);
}

- (BOOL)canGoToMoreSlides:(BOOL)a3
{
  return objc_msgSend( -[MRRenderer _layerForPlugObjectID:]( self,  "_layerForPlugObjectID:",  self->mInternal->mTransitionLayerPlugObjectID),  "canTransitionToMoreSlides:",  a3);
}

- (void)jumpToNextMarker
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_27EF4;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (void)jumpToPreviousMarker
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_2800C;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (void)gotoNextInterestingTime:(BOOL)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_28128;
  v4[3] = &unk_24D5D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mRenderDispatchQueue, v4);
}

- (void)gotoPreviousInterestingTime:(BOOL)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_28250;
  v4[3] = &unk_24D5D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mRenderDispatchQueue, v4);
}

- (void)gotoNextFocusedSlide:(BOOL)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_28374;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (void)gotoPreviousFocusedSlide:(BOOL)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_284C0;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (id)defaultActionsWithHitLayer:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (!-[MRRenderer cameraCaptureSession](self, "cameraCaptureSession"))
  {
    mSlideFocusState = self->mInternal->mSlideFocusState;
    if (!mSlideFocusState)
    {
      id v8 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
      if (a3) {
        objc_msgSend(a3, "elementHitAtPoint:localPoint:", 0, x, y);
      }
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_28C54;
      v23[3] = &unk_24D628;
      v23[4] = self;
      objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v23),  @"onDoubleHitEnd");
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472LL;
      v22[2] = sub_28C60;
      v22[3] = &unk_24D600;
      v22[4] = self;
      objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v22),  @"onPanHorizontalStart");
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_28C6C;
      v21[3] = &unk_24D600;
      v21[4] = self;
      objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v21),  @"onPanHorizontalUpdate");
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_28C78;
      v20[3] = &unk_24D600;
      v20[4] = self;
      objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v20),  @"onPanHorizontalEnd");
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_28C84;
      v19[3] = &unk_24D600;
      v19[4] = self;
      objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v19),  @"onPanHorizontalCancel");
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472LL;
      v18[2] = sub_28C90;
      v18[3] = &unk_24D600;
      v18[4] = self;
      objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v18),  @"onPanHorizontalStart2");
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_28C9C;
      v17[3] = &unk_24D600;
      v17[4] = self;
      objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v17),  @"onPanHorizontalUpdate2");
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_28CA8;
      v16[3] = &unk_24D600;
      v16[4] = self;
      objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v16),  @"onPanHorizontalEnd2");
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_28CB4;
      v15[3] = &unk_24D600;
      v15[4] = self;
      double v12 = +[MRMCBlockAction blockActionWithBlock:](&OBJC_CLASS___MRMCBlockAction, "blockActionWithBlock:", v15);
      double v13 = @"onPanHorizontalCancel2";
      goto LABEL_16;
    }

    unsigned __int8 v10 = -[MRSlideFocusState isInZoomMode](mSlideFocusState, "isInZoomMode");
    id v8 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
    if (a3)
    {
      id v11 = objc_msgSend(a3, "elementHitAtPoint:localPoint:", 0, x, y);
      if ((v10 & 1) != 0)
      {
        if (!v11) {
          return v8;
        }
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_28BA0;
        v35[3] = &unk_24D600;
        v35[4] = self;
        objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v35),  @"onPanZoomRotationStart");
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_28BAC;
        v34[3] = &unk_24D600;
        v34[4] = self;
        objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v34),  @"onPanZoomRotationUpdate");
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472LL;
        v33[2] = sub_28BB8;
        v33[3] = &unk_24D600;
        v33[4] = self;
        objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v33),  @"onPanZoomRotationEnd");
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_28BC4;
        v32[3] = &unk_24D600;
        v32[4] = self;
        double v12 = +[MRMCBlockAction blockActionWithBlock:](&OBJC_CLASS___MRMCBlockAction, "blockActionWithBlock:", v32);
        double v13 = @"onPanZoomRotationCancel";
LABEL_16:
        [v8 setObject:v12 forKey:v13];
        return v8;
      }

      if (v11)
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472LL;
        v31[2] = sub_28BD0;
        v31[3] = &unk_24D600;
        v31[4] = self;
        objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v31),  @"onZoomStart");
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472LL;
        v30[2] = sub_28C00;
        v30[3] = &unk_24D600;
        v30[4] = self;
        objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v30),  @"onZoomUpdate");
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472LL;
        v29[2] = sub_28C0C;
        v29[3] = &unk_24D600;
        v29[4] = self;
        objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v29),  @"onZoomEnd");
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_28C18;
        v28[3] = &unk_24D600;
        v28[4] = self;
        objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v28),  @"onZoomCancel");
      }
    }

    else if ((v10 & 1) != 0)
    {
      return v8;
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_28C24;
    v27[3] = &unk_24D600;
    v27[4] = self;
    objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v27),  @"onPanHorizontalStart");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_28C30;
    v26[3] = &unk_24D600;
    v26[4] = self;
    objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v26),  @"onPanHorizontalUpdate");
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_28C3C;
    v25[3] = &unk_24D600;
    v25[4] = self;
    objc_msgSend( v8,  "setObject:forKey:",  +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v25),  @"onPanHorizontalEnd");
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_28C48;
    v24[3] = &unk_24D600;
    v24[4] = self;
    double v12 = +[MRMCBlockAction blockActionWithBlock:](&OBJC_CLASS___MRMCBlockAction, "blockActionWithBlock:", v24);
    double v13 = @"onPanHorizontalCancel";
    goto LABEL_16;
  }

  return 0LL;
}

- (NSString)transitionLayerPlugObjectID
{
  return self->mInternal->mTransitionLayerPlugObjectID;
}

- (void)setTransitionLayerPlugObjectID:(id)a3
{
  self->mInternal->mTransitionLayerPlugObjectID = (NSString *)[a3 copy];
}

- (void)touchesBegan:(id)a3
{
  if (self->_interactivityIsEnabled)
  {
    if (-[MRLayer isActivated](self->mTopMRLayer, "isActivated"))
    {
      id v57 = self;
      __int128 v67 = 0u;
      __int128 v68 = 0u;
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      id v49 = [a3 countByEnumeratingWithState:&v65 objects:v70 count:16];
      double v4 = self;
      if (v49)
      {
        uint64_t v48 = *(void *)v66;
        __asm { FMOV            V0.2D, #2.0 }

        float64x2_t v46 = _Q0;
        do
        {
          uint64_t v10 = 0LL;
          do
          {
            if (*(void *)v66 != v48)
            {
              uint64_t v11 = v10;
              objc_enumerationMutation(a3);
              double v4 = v57;
              uint64_t v10 = v11;
            }

            uint64_t v50 = v10;
            double v12 = *(void **)(*((void *)&v65 + 1) + 8 * v10);
            if (-[MRRenderer displaysTouchVisualFeedback](v4, "displaysTouchVisualFeedback", *(_OWORD *)&v46))
            {
              mTouchesForVisualFeedback = v57->mInternal->mTouchesForVisualFeedback;
              objc_sync_enter(mTouchesForVisualFeedback);
              -[NSMutableArray addObject:](v57->mInternal->mTouchesForVisualFeedback, "addObject:", v12);
              objc_sync_exit(mTouchesForVisualFeedback);
            }

            CGPoint v64 = CGPointZero;
            [v12 location];
            mTopMRLayer = -[MRRenderer layerHitAtPoint:onlyIfHitElement:localPoint:]( v57,  "layerHitAtPoint:onlyIfHitElement:localPoint:",  1LL,  &v64);
            double v51 = mTopMRLayer;
            if (!mTopMRLayer)
            {
              [v12 location];
              v16.f64[1] = v15;
              CGPoint v64 = (CGPoint)vdivq_f64(vmlaq_f64(vnegq_f64((float64x2_t)v57->mSize), v46, v16), (float64x2_t)v57->mSize);
              mTopMRLayer = v57->mTopMRLayer;
            }

            double v4 = v57;
            if (v57->mInternal->mGestureRecognizers)
            {
              if (!mTopMRLayer) {
                goto LABEL_72;
              }
            }

            else
            {
              id v17 = mTopMRLayer;
              uint64_t v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
              double v4 = v57;
              v57->mInternal->mGestureRecognizers = v18;
              mTopMRLayer = v17;
              if (!v17) {
                goto LABEL_72;
              }
            }

            uint64_t v58 = 0LL;
            do
            {
              id v56 = mTopMRLayer;
              if (mTopMRLayer == v4->mTopMRLayer) {
                id v59 = -[MRRenderer defaultActionsWithHitLayer:atPoint:]( v4,  "defaultActionsWithHitLayer:atPoint:",  v51,  v64);
              }
              else {
                id v59 = -[MRLayer actions](mTopMRLayer, "actions");
              }
              if (![v59 count]) {
                goto LABEL_70;
              }
              v53 = +[MURetainingKey retainingKeyWithObject:]( &OBJC_CLASS___MURetainingKey,  "retainingKeyWithObject:",  v56);
              id v19 = -[NSMutableDictionary objectForKey:](v57->mInternal->mGestureRecognizers, "objectForKey:", v53);
              double v20 = v19;
              if (v19)
              {
                __int128 v62 = 0u;
                __int128 v63 = 0u;
                __int128 v60 = 0u;
                __int128 v61 = 0u;
                id v21 = [v19 countByEnumeratingWithState:&v60 objects:v69 count:16];
                if (v21)
                {
                  uint64_t v22 = *(void *)v61;
                  do
                  {
                    for (i = 0LL; i != v21; i = (char *)i + 1)
                    {
                      if (*(void *)v61 != v22) {
                        objc_enumerationMutation(v20);
                      }
                      __int128 v24 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
                    }

                    id v21 = [v20 countByEnumeratingWithState:&v60 objects:v69 count:16];
                  }

                  while (v21);
                }

                goto LABEL_70;
              }

              id v55 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              id v52 = -[MRRenderer _computeMatrixChainForLayer:](v57, "_computeMatrixChainForLayer:", v56);
              if ((v58 & 1) == 0)
              {
                unint64_t v25 = (unint64_t)[v59 objectForKey:@"onHitStart"];
                unint64_t v26 = (unint64_t)[v59 objectForKey:@"onHitEnd"];
                if (v25 | v26)
                {
                  double v27 = -[MRGestureRecognizer initWithRenderer:startAction:andSender:]( objc_alloc(&OBJC_CLASS___MRTapGestureRecognizer),  "initWithRenderer:startAction:andSender:",  v57,  v25,  v56);
                  -[MRGestureRecognizer setRequiredTouchCount:](v27, "setRequiredTouchCount:", 1LL);
                  -[MRGestureRecognizer setUpdateAction:]( v27,  "setUpdateAction:",  [v59 objectForKey:@"onHitUpdate"]);
                  -[MRGestureRecognizer setEndAction:](v27, "setEndAction:", v26);
                  -[MRGestureRecognizer setCancelAction:]( v27,  "setCancelAction:",  [v59 objectForKey:@"onHitCancel"]);
                  -[MRGestureRecognizer setMatrixChain:](v27, "setMatrixChain:", v52);
                  -[MRLayer pixelSize](v56, "pixelSize");
                  -[MRGestureRecognizer setReferenceSize:](v27, "setReferenceSize:");
                  -[MRTapGestureRecognizer touchBegan:](v27, "touchBegan:", v12);
                  -[NSMutableArray addObject:](v55, "addObject:", v27);

                  v58 |= 1uLL;
                }
              }

              if ((v58 & 2) == 0)
              {
                unint64_t v28 = (unint64_t)[v59 objectForKey:@"onDoubleHitStart"];
                unint64_t v29 = (unint64_t)[v59 objectForKey:@"onDoubleHitEnd"];
                if (v28 | v29)
                {
                  id v30 = -[MRGestureRecognizer initWithRenderer:startAction:andSender:]( objc_alloc(&OBJC_CLASS___MRTapGestureRecognizer),  "initWithRenderer:startAction:andSender:",  v57,  v28,  v56);
                  -[MRGestureRecognizer setRequiredTouchCount:](v30, "setRequiredTouchCount:", 2LL);
                  -[MRGestureRecognizer setUpdateAction:]( v30,  "setUpdateAction:",  [v59 objectForKey:@"onDoubleHitUpdate"]);
                  -[MRGestureRecognizer setEndAction:](v30, "setEndAction:", v29);
                  -[MRGestureRecognizer setCancelAction:]( v30,  "setCancelAction:",  [v59 objectForKey:@"onDoubleHitCancel"]);
                  -[MRGestureRecognizer setMatrixChain:](v30, "setMatrixChain:", v52);
                  -[MRLayer pixelSize](v56, "pixelSize");
                  -[MRGestureRecognizer setReferenceSize:](v30, "setReferenceSize:");
                  -[MRTapGestureRecognizer touchBegan:](v30, "touchBegan:", v12);
                  -[NSMutableArray addObject:](v55, "addObject:", v30);

                  v58 |= 2uLL;
                }
              }

              uint64_t v31 = 0LL;
              id v54 = 0LL;
              do
              {
                uint64_t v32 = word_1F62D8[v31];
                id v33 = off_24D648[v31];
                id v35 = [v59 objectForKey:v33];
                if (v35)
                {
                  uint64_t v36 = objc_opt_class(&OBJC_CLASS___MCConditionalAction, v34);
                  if ((objc_opt_isKindOfClass(v35, v36) & 1) == 0
                    || (id v35 = -[MRRenderer actionByEvaluatingConditionalAction:withStates:]( v57,  "actionByEvaluatingConditionalAction:withStates:",  v35,  -[MRLayer persistentState](v56, "persistentState"))) != 0LL)
                  {
                    uint64_t v37 = -[MRPanZoomRotationGestureRecognizer initWithRenderer:masterAction:direction:andSender:]( objc_alloc(&OBJC_CLASS___MRPanZoomRotationGestureRecognizer),  "initWithRenderer:masterAction:direction:andSender:",  v57,  v35,  v32,  v56);
                    uint64_t v38 = off_24D6D0[v31];
                    -[MRGestureRecognizer setStartAction:]( v37,  "setStartAction:",  [v59 objectForKey:v38]);
                    char v39 = 0;
                    int v40 = 1;
                    if (!v37) {
                      goto LABEL_66;
                    }
LABEL_54:
                    -[MRRenderer interactiveTransitionTrackingBoxRadius](v57, "interactiveTransitionTrackingBoxRadius");
                    -[MRPanZoomRotationGestureRecognizer setTrackingBoxRadius:](v37, "setTrackingBoxRadius:");
                    -[MRRenderer interactiveTransitionProgressThreshold](v57, "interactiveTransitionProgressThreshold");
                    -[MRPanZoomRotationGestureRecognizer setProgressThreshold:](v37, "setProgressThreshold:");
                    -[MRRenderer interactiveTransitionVelocityThreshold](v57, "interactiveTransitionVelocityThreshold");
                    -[MRPanZoomRotationGestureRecognizer setVelocityThreshold:](v37, "setVelocityThreshold:");
                    if (v40) {
                      -[MRGestureRecognizer setStartAction:]( v37,  "setStartAction:",  [v59 objectForKey:v38]);
                    }
                    -[MRGestureRecognizer setEndAction:]( v37,  "setEndAction:",  [v59 objectForKey:off_24D7E0[v31]]);
                    if ((v39 & 1) == 0)
                    {
                      -[MRGestureRecognizer setUpdateAction:]( v37,  "setUpdateAction:",  [v59 objectForKey:off_24D758[v31]]);
                      -[MRGestureRecognizer setCancelAction:]( v37,  "setCancelAction:",  [v59 objectForKey:off_24D868[v31]]);
                    }

                    if ([v35 tracksInParent])
                    {
                      id v45 = v54;
                      if (!v54) {
                        id v45 = -[MRRenderer _computeMatrixChainForLayer:]( v57,  "_computeMatrixChainForLayer:",  -[MRLayer superlayer](v56, "superlayer"));
                      }
                      id v54 = v45;
                      -[MRGestureRecognizer setMatrixChain:](v37, "setMatrixChain:");
                      -[MRLayer pixelSize](-[MRLayer superlayer](v56, "superlayer"), "pixelSize");
                    }

                    else
                    {
                      -[MRGestureRecognizer setMatrixChain:](v37, "setMatrixChain:", v52);
                      -[MRLayer pixelSize](v56, "pixelSize");
                    }

                    -[MRGestureRecognizer setReferenceSize:](v37, "setReferenceSize:");
                    -[MRGestureRecognizer touchBegan:](v37, "touchBegan:", v12);
                    -[NSMutableArray addObject:](v55, "addObject:", v37);

                    v58 |= 4 * v32;
                    goto LABEL_66;
                  }
                }

                uint64_t v38 = off_24D6D0[v31];
                id v35 = [v59 objectForKey:v38];
                uint64_t v42 = objc_opt_class(&OBJC_CLASS___MCConditionalAction, v41);
                if ((objc_opt_isKindOfClass(v35, v42) & 1) != 0) {
                  id v35 = -[MRRenderer actionByEvaluatingConditionalAction:withStates:]( v57,  "actionByEvaluatingConditionalAction:withStates:",  v35,  -[MRLayer persistentState](v56, "persistentState"));
                }
                if (v35)
                {
                  uint64_t v37 = -[MRPanZoomRotationGestureRecognizer initWithRenderer:startAction:direction:andSender:]( objc_alloc(&OBJC_CLASS___MRPanZoomRotationGestureRecognizer),  "initWithRenderer:startAction:direction:andSender:",  v57,  v35,  v32,  v56);
                  char v39 = 0;
                  int v40 = 0;
                  if (!v37) {
                    goto LABEL_66;
                  }
                  goto LABEL_54;
                }

                id v35 = [v59 objectForKey:off_24D7E0[v31]];
                uint64_t v44 = objc_opt_class(&OBJC_CLASS___MCConditionalAction, v43);
                if ((objc_opt_isKindOfClass(v35, v44) & 1) != 0) {
                  id v35 = -[MRRenderer actionByEvaluatingConditionalAction:withStates:]( v57,  "actionByEvaluatingConditionalAction:withStates:",  v35,  -[MRLayer persistentState](v56, "persistentState"));
                }
                if (v35)
                {
                  uint64_t v37 = -[MRPanZoomRotationGestureRecognizer initWithRenderer:endAction:direction:andSender:]( objc_alloc(&OBJC_CLASS___MRPanZoomRotationGestureRecognizer),  "initWithRenderer:endAction:direction:andSender:",  v57,  v35,  v32,  v56);
                  int v40 = 0;
                  char v39 = 1;
                  if (v37) {
                    goto LABEL_54;
                  }
                }

- (void)touchesMoved:(id)a3
{
  if (self->_interactivityIsEnabled && -[MRLayer isActivated](self->mTopMRLayer, "isActivated"))
  {
    id v17 = self;
    double v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          id v10 = objc_msgSend(v9, "gestureRecognizers", v17);
          id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (j = 0LL; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                float64_t v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
                [v15 touchMoved:v9];
              }

              id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }

            while (v12);
          }
        }

        id v6 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v6);
    }

    float64x2_t v16 = v17;
    -[MRRenderer _findAndHandleBestRecognizerInRecognizers:](v17, "_findAndHandleBestRecognizerInRecognizers:", v4, v17);

    -[MRRenderer _cleanupGestureRecognizers](v16, "_cleanupGestureRecognizers");
  }

- (void)touchesEnded:(id)a3
{
  if (self->_interactivityIsEnabled && -[MRLayer isActivated](self->mTopMRLayer, "isActivated"))
  {
    id v17 = self;
    double v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          __int128 v22 = 0u;
          id v10 = objc_msgSend(v9, "gestureRecognizers", v17);
          id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (j = 0LL; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                float64_t v15 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)j);
                [v15 touchEnded:v9];
              }

              id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }

            while (v12);
          }
        }

        id v6 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v6);
    }

    float64x2_t v16 = v17;
    -[MRRenderer _findAndHandleBestRecognizerInRecognizers:](v17, "_findAndHandleBestRecognizerInRecognizers:", v4, v17);

    -[MRRenderer _cleanupGestureRecognizers](v16, "_cleanupGestureRecognizers");
  }

- (void)touchesCancelled:(id)a3
{
  if (self->_interactivityIsEnabled && -[MRLayer isActivated](self->mTopMRLayer, "isActivated"))
  {
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        id v8 = 0LL;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(a3);
          }
          uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v8);
          __int128 v15 = 0u;
          __int128 v16 = 0u;
          __int128 v17 = 0u;
          __int128 v18 = 0u;
          id v10 = objc_msgSend(v9, "gestureRecognizers", 0);
          id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              id v14 = 0LL;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) abort];
                id v14 = (char *)v14 + 1;
              }

              while (v12 != v14);
              id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }

            while (v12);
          }

          id v8 = (char *)v8 + 1;
        }

        while (v8 != v6);
        id v6 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }

      while (v6);
    }

    -[MRRenderer _cleanupGestureRecognizers](self, "_cleanupGestureRecognizers");
  }

- (void)_findAndHandleBestRecognizerInRecognizers:(id)a3
{
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v46;
    double v9 = 0.0;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(a3);
        }
        id v11 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        if (([v11 state] & 8) != 0)
        {
          [v11 score];
          if (v12 > v9)
          {
            uint64_t v7 = v11;
            double v9 = v12;
          }
        }
      }

      id v6 = [a3 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }

    while (v6);
    if (v7)
    {
      [v7 recognize];
      id v13 = [v7 sender];
      if (v13)
      {
        id v14 = v13;
        do
        {
          id v15 = -[NSMutableDictionary objectForKey:]( self->mInternal->mGestureRecognizers,  "objectForKey:",  +[MURetainingKey retainingKeyWithObject:]( &OBJC_CLASS___MURetainingKey,  "retainingKeyWithObject:",  v14));
          __int128 v41 = 0u;
          __int128 v42 = 0u;
          __int128 v43 = 0u;
          __int128 v44 = 0u;
          id v16 = [v15 countByEnumeratingWithState:&v41 objects:v51 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v42;
            do
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v42 != v18) {
                  objc_enumerationMutation(v15);
                }
                __int128 v20 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)j);
                if (v20 != v7) {
                  [v20 abort];
                }
              }

              id v17 = [v15 countByEnumeratingWithState:&v41 objects:v51 count:16];
            }

            while (v17);
          }

          id v14 = [v14 superlayer];
        }

        while (v14);
      }

      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v21 = [v7 touches];
      id v22 = [v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v38;
        do
        {
          for (k = 0LL; k != v23; k = (char *)k + 1)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            __int128 v26 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)k);
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v35 = 0u;
            __int128 v36 = 0u;
            id v27 = objc_msgSend(v26, "gestureRecognizers", 0);
            id v28 = [v27 countByEnumeratingWithState:&v33 objects:v49 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v34;
              do
              {
                for (m = 0LL; m != v29; m = (char *)m + 1)
                {
                  if (*(void *)v34 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v32 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)m);
                  if (v32 != v7) {
                    [v32 abort];
                  }
                }

                id v29 = [v27 countByEnumeratingWithState:&v33 objects:v49 count:16];
              }

              while (v29);
            }
          }

          id v23 = [v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
        }

        while (v23);
      }
    }
  }

- (id)layerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (!-[MRLayer isActivated](self->mTopMRLayer, "isActivated")) {
    return 0LL;
  }
  uint64_t v24 = 0LL;
  __int128 v25 = &v24;
  uint64_t v26 = 0x3052000000LL;
  id v27 = sub_2A110;
  id v28 = sub_2A120;
  mInternal = self->mInternal;
  uint64_t v29 = 0LL;
  mRenderDispatchQueue = (dispatch_queue_s *)mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_2A12C;
  block[3] = &unk_24D8F8;
  block[4] = self;
  void block[5] = &v24;
  v10.f64[0] = x;
  v10.f64[1] = y;
  __asm { FMOV            V2.2D, #2.0 }

  float64x2_t v21 = vdivq_f64(vmlaq_f64(vnegq_f64((float64x2_t)self->mSize), _Q2, v10), (float64x2_t)self->mSize);
  BOOL v23 = a4;
  id v22 = a5;
  dispatch_sync(mRenderDispatchQueue, block);
  id v16 = (id)v25[5];
  _Block_object_dispose(&v24, 8);
  return v16;
}

- (void)willGoToPreviousOrNextFocusedSlide:(BOOL)a3 withAction:(id)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  double v9 = -[MRSlideFocusState delegate](self->mInternal->mSlideFocusState, "delegate");
  mSlideFocusState = self->mInternal->mSlideFocusState;
  if (v7)
  {
    -[MRLayer willFocusOnNextSlideWithState:animate:]( v9,  "willFocusOnNextSlideWithState:animate:",  mSlideFocusState,  v5);
    -[MRLayerNavigator gotoNextSublayer:animate:]( self->mInternal->mSlideFocusNavigator,  "gotoNextSublayer:animate:",  a4,  v5);
  }

  else
  {
    -[MRLayer willFocusOnPreviousSlideWithState:animate:]( v9,  "willFocusOnPreviousSlideWithState:animate:",  mSlideFocusState,  v5);
    -[MRLayerNavigator gotoPreviousSublayer:animate:]( self->mInternal->mSlideFocusNavigator,  "gotoPreviousSublayer:animate:",  a4,  v5);
  }

  if (-[MRSlideFocusState delegateIsTransitioningToo](self->mInternal->mSlideFocusState, "delegateIsTransitioningToo")) {
    -[MRLayer setForcedTransitionProgress:]( -[MRSlideFocusState delegate](self->mInternal->mSlideFocusState, "delegate"),  "setForcedTransitionProgress:",  0.0);
  }
  -[MRSlideFocusState setIsTransitioning:](self->mInternal->mSlideFocusState, "setIsTransitioning:", 1LL);
  -[MRSlideFocusState setIsGoingToNext:](self->mInternal->mSlideFocusState, "setIsGoingToNext:", v7);
}

- (void)didGoToPreviousOrNextFocusedSlide:(BOOL)a3 withAction:(id)a4
{
  BOOL v5 = a3;
  if (-[MRSlideFocusState delegateIsTransitioningToo](self->mInternal->mSlideFocusState, "delegateIsTransitioningToo"))
  {
    BOOL v7 = -[MRSlideFocusState delegate](self->mInternal->mSlideFocusState, "delegate");
    -[MRLayer setForcedTransitionProgress:](v7, "setForcedTransitionProgress:", 1.1);
    -[MRLayer finishTransition:](v7, "finishTransition:", a4);
  }

  uint64_t v8 = -[MRSlideFocusState slideInfo](self->mInternal->mSlideFocusState, "slideInfo");
  mSlideFocusState = self->mInternal->mSlideFocusState;
  if (v5)
  {
    -[MRSlideFocusState setPreviousSlideInfo:](mSlideFocusState, "setPreviousSlideInfo:", v8);
    -[MRSlideFocusState setPreviousSlideID:]( self->mInternal->mSlideFocusState,  "setPreviousSlideID:",  -[MRSlideFocusState slideID](self->mInternal->mSlideFocusState, "slideID"));
    -[MRSlideFocusState setSlideInfo:]( self->mInternal->mSlideFocusState,  "setSlideInfo:",  -[MRSlideFocusState nextSlideInfo](self->mInternal->mSlideFocusState, "nextSlideInfo"));
    -[MRSlideFocusState setSlideID:]( self->mInternal->mSlideFocusState,  "setSlideID:",  -[MRSlideFocusState nextSlideID](self->mInternal->mSlideFocusState, "nextSlideID"));
    -[MRLayer didFocusOnNextSlideWithState:]( -[MRSlideFocusState delegate](self->mInternal->mSlideFocusState, "delegate"),  "didFocusOnNextSlideWithState:",  self->mInternal->mSlideFocusState);
    uint64_t v10 = 1LL;
  }

  else
  {
    -[MRSlideFocusState setNextSlideInfo:](mSlideFocusState, "setNextSlideInfo:", v8);
    -[MRSlideFocusState setNextSlideID:]( self->mInternal->mSlideFocusState,  "setNextSlideID:",  -[MRSlideFocusState slideID](self->mInternal->mSlideFocusState, "slideID"));
    -[MRSlideFocusState setSlideInfo:]( self->mInternal->mSlideFocusState,  "setSlideInfo:",  -[MRSlideFocusState previousSlideInfo](self->mInternal->mSlideFocusState, "previousSlideInfo"));
    -[MRSlideFocusState setSlideID:]( self->mInternal->mSlideFocusState,  "setSlideID:",  -[MRSlideFocusState previousSlideID](self->mInternal->mSlideFocusState, "previousSlideID"));
    -[MRLayer didFocusOnPreviousSlideWithState:]( -[MRSlideFocusState delegate](self->mInternal->mSlideFocusState, "delegate"),  "didFocusOnPreviousSlideWithState:",  self->mInternal->mSlideFocusState);
    uint64_t v10 = 2LL;
  }

  mInternal = self->mInternal;
  unint64_t v12 = (mInternal->mCurrentSlideFocuserIndex + v10) % 3;
  mInternal->mCurrentSlideFocuserIndeCGFloat x = v12;
  unint64_t v13 = v12 + v10;
  if (v13 >= 3) {
    v13 -= 3LL;
  }
  id v14 = self->mInternal;
  id v15 = v14->mSlideFocuser[v13];
  id v16 = v14->mSlideFocusState;
  if (v5) {
    id v17 = -[MRSlideFocusState nextSlideInfo](v16, "nextSlideInfo");
  }
  else {
    id v17 = -[MRSlideFocusState previousSlideInfo](v16, "previousSlideInfo");
  }
  uint64_t v18 = v17;
  -[MRLayerEffect setAssetPath:ofSlide:]( v15,  "setAssetPath:ofSlide:",  -[MRSlideInfo assetPath](v17, "assetPath"),  @"image0");
  -[MRLayerEffect setCenter:ofSlide:](v15, "setCenter:ofSlide:", @"image0", 0.5, 0.5);
  -[MRSlideInfo aspectRatio](v18, "aspectRatio");
  double v20 = v19 * self->mSize.height / self->mSize.width;
  if (v20 > 1.0) {
    double v20 = 1.0;
  }
  -[MRLayerEffect setScale:ofSlide:](v15, "setScale:ofSlide:", @"image0", v20);
  -[MRSlideInfo aspectRatio](v18, "aspectRatio");
  -[MRLayerEffect setMaxScale:ofSlide:]( v15,  "setMaxScale:ofSlide:",  @"image0",  fmax((v21 + v21) * self->mSize.height / self->mSize.width, 2.0));
  -[MRLayerEffect setRotation:ofSlide:](v15, "setRotation:ofSlide:", @"image0", 0.0);
  NSLog( @"didGoToPreviousOrNextFocusedSlide: %@ %@ %@",  -[MRSlideFocusState previousSlideID](self->mInternal->mSlideFocusState, "previousSlideID"),  -[MRSlideFocusState slideID](self->mInternal->mSlideFocusState, "slideID"),  -[MRSlideFocusState nextSlideID](self->mInternal->mSlideFocusState, "nextSlideID"));
}

- (double)slideshowTransitionStart:(id)a3
{
  BOOL v5 = (double *)[a3 specificObject];
  id v6 = -[MRLayerParallelizer sublayerForPlugObjectID:recursive:]( self->mTopMRLayer,  "sublayerForPlugObjectID:recursive:",  self->mInternal->mTransitionLayerPlugObjectID,  1LL);
  int v7 = *((unsigned __int8 *)v5 + 96);
  if (v7 == 1) {
    BOOL v8 = 0LL;
  }
  else {
    BOOL v8 = v7 != 3 || v5[8] >= 0.0;
  }
  [v6 gotoMoreSlidesWithAction:a3 backwards:v8 animate:1 canCatchCurrentTransition:fabs(v5[8]) < 1.0];
  return result;
}

- (double)slideshowTransitionUpdate:(id)a3
{
  return 0.0;
}

- (double)slideshowTransitionEnd:(id)a3
{
  return result;
}

- (double)slideshowTransitionCancel:(id)a3
{
  return result;
}

- (double)focusedTransitionStart:(id)a3
{
  if (self->mInternal->mSlideFocusState)
  {
    BOOL v5 = (double *)[a3 specificObject];
    BOOL v6 = *((_BYTE *)v5 + 96) == 1 || v5[8] < 0.0;
    -[MRRenderer willGoToPreviousOrNextFocusedSlide:withAction:animate:]( self,  "willGoToPreviousOrNextFocusedSlide:withAction:animate:",  v6,  a3,  1LL);
  }

  return 0.0;
}

- (double)focusedTransitionUpdate:(id)a3
{
  mSlideFocusState = self->mInternal->mSlideFocusState;
  if (mSlideFocusState && -[MRSlideFocusState isTransitioning](mSlideFocusState, "isTransitioning"))
  {
    if (-[MRSlideFocusState delegateIsTransitioningToo]( self->mInternal->mSlideFocusState,  "delegateIsTransitioningToo"))
    {
      -[MRLayer updateTransition:]( -[MRSlideFocusState delegate](self->mInternal->mSlideFocusState, "delegate"),  "updateTransition:",  a3);
    }

    -[MRLayerNavigator updateTransition:](self->mInternal->mSlideFocusNavigator, "updateTransition:", a3);
  }

  return 0.0;
}

- (double)focusedTransitionEnd:(id)a3
{
  mSlideFocusState = self->mInternal->mSlideFocusState;
  double v5 = 0.0;
  if (mSlideFocusState && -[MRSlideFocusState isTransitioning](mSlideFocusState, "isTransitioning"))
  {
    __int16 v11 = 0;
    -[MRLayerNavigator attemptToFinishTransition:didTransition:gotReversed:]( self->mInternal->mSlideFocusNavigator,  "attemptToFinishTransition:didTransition:gotReversed:",  a3,  (char *)&v11 + 1,  &v11);
    double v5 = v7;
    BOOL v8 = self->mInternal->mSlideFocusState;
    if (HIBYTE(v11))
    {
      if (-[MRSlideFocusState isInZoomMode](v8, "isInZoomMode")) {
        -[MRRenderer exitSlideZoomMode:](self, "exitSlideZoomMode:", 0LL);
      }
      unsigned int v9 = -[MRSlideFocusState isGoingToNext](self->mInternal->mSlideFocusState, "isGoingToNext");
      -[MRRenderer didGoToPreviousOrNextFocusedSlide:withAction:]( self,  "didGoToPreviousOrNextFocusedSlide:withAction:",  v11 != v9,  a3);
    }

    else if (-[MRSlideFocusState delegateIsTransitioningToo](v8, "delegateIsTransitioningToo"))
    {
      -[MRLayer abortTransition:]( -[MRSlideFocusState delegate](self->mInternal->mSlideFocusState, "delegate"),  "abortTransition:",  a3);
    }

    -[MRSlideFocusState setIsTransitioning:](self->mInternal->mSlideFocusState, "setIsTransitioning:", 0LL);
  }

  return v5;
}

- (double)focusedTransitionCancel:(id)a3
{
  mSlideFocusState = self->mInternal->mSlideFocusState;
  if (mSlideFocusState && -[MRSlideFocusState isTransitioning](mSlideFocusState, "isTransitioning"))
  {
    if (-[MRSlideFocusState delegateIsTransitioningToo]( self->mInternal->mSlideFocusState,  "delegateIsTransitioningToo"))
    {
      -[MRLayer abortTransition:]( -[MRSlideFocusState delegate](self->mInternal->mSlideFocusState, "delegate"),  "abortTransition:",  a3);
    }

    -[MRLayerNavigator abortTransition:](self->mInternal->mSlideFocusNavigator, "abortTransition:", a3);
    -[MRSlideFocusState setIsTransitioning:](self->mInternal->mSlideFocusState, "setIsTransitioning:", 0LL);
  }

  return 0.0;
}

- (double)slideZoomStart:(id)a3
{
  if (!self->mInternal->mSlideFocusState) {
    return 0.0;
  }
  id v5 = [a3 specificObject];
  *((_BYTE *)v5 + 99) = 1;
  *((_BYTE *)v5 + 100) = -[MRSlideFocusState isInZoomMode](self->mInternal->mSlideFocusState, "isInZoomMode");
  if (!-[MRSlideFocusState isInZoomMode](self->mInternal->mSlideFocusState, "isInZoomMode")) {
    goto LABEL_10;
  }
  BOOL v6 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
  if (v6) {
    BOOL v6 = -[MRLayerEffect effect](v6, "effect");
  }
  if (*((_BYTE *)v5 + 97) == 1
    && *((double *)v5 + 6) == 1.0
    && *((double *)v5 + 7) == 0.0
    && fabs(*((double *)v5 + 8)) > fabs(*((double *)v5 + 9))
    && !-[MRLayerEffect canMoveInDirection:withPZR:](v6, "canMoveInDirection:withPZR:", 3LL, v5))
  {
    -[MRRenderer focusedTransitionStart:](self, "focusedTransitionStart:", a3);
  }

  else
  {
LABEL_10:
    -[MRLayerEffect pzrStart:]( self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex],  "pzrStart:",  a3);
  }

  return result;
}

- (double)slideZoomUpdate:(id)a3
{
  if (self->mInternal->mSlideFocusState)
  {
    id v5 = [a3 specificObject];
    v5[99] = 1;
    v5[100] = -[MRSlideFocusState isInZoomMode](self->mInternal->mSlideFocusState, "isInZoomMode");
    if (-[MRSlideFocusState isTransitioning](self->mInternal->mSlideFocusState, "isTransitioning"))
    {
      -[MRRenderer focusedTransitionUpdate:](self, "focusedTransitionUpdate:", a3);
      return result;
    }

    BOOL v6 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
    -[MRLayerEffect pzrUpdate:](v6, "pzrUpdate:", a3);
    id v7 = -[MRLayerEffect currentSlideInfoForElement:](v6, "currentSlideInfoForElement:", @"image0");
    [v7 aspectRatio];
    double v9 = v8 * self->mSize.height / self->mSize.width;
    if (v9 <= 1.0) {
      double v10 = v9;
    }
    else {
      double v10 = 1.0;
    }
    [v7 scale];
    double v12 = v11 / v10;
    BOOL v13 = v11 <= 0.0;
    double v14 = 0.001;
    if (!v13) {
      double v14 = v12;
    }
    double v15 = v14 * v14;
    if (v15 <= 1.0) {
      double v16 = v15;
    }
    else {
      double v16 = 1.0;
    }
    mSlideFocusLayer = self->mInternal->mSlideFocusLayer;
    -[MRLayer opacity](mSlideFocusLayer, "opacity");
    -[MRLayer animateOpacityTo:withDuration:](mSlideFocusLayer, "animateOpacityTo:withDuration:", v16, 1.0 - v18);
  }

  return 0.0;
}

- (double)slideZoomEnd:(id)a3
{
  if (self->mInternal->mSlideFocusState)
  {
    id v5 = [a3 specificObject];
    v5[99] = 1;
    v5[100] = -[MRSlideFocusState isInZoomMode](self->mInternal->mSlideFocusState, "isInZoomMode");
    if (-[MRSlideFocusState isTransitioning](self->mInternal->mSlideFocusState, "isTransitioning"))
    {
      -[MRRenderer focusedTransitionEnd:](self, "focusedTransitionEnd:", a3);
      return result;
    }

    id v7 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
    id v8 = -[MRLayerEffect currentSlideInfoForElement:](v7, "currentSlideInfoForElement:", @"image0");
    [v8 aspectRatio];
    double v10 = v9 * self->mSize.height / self->mSize.width;
    v5[98] = 0;
    if (v10 <= 1.0) {
      double v11 = v10;
    }
    else {
      double v11 = 1.0;
    }
    [v8 scale];
    if (v12 >= v11 * 0.8)
    {
      if (-[MRSlideFocusState isInZoomMode](self->mInternal->mSlideFocusState, "isInZoomMode")
        && ([v8 scale], v14 < v11))
      {
        -[MRRenderer exitSlideZoomMode:](self, "exitSlideZoomMode:", 1LL);
      }

      else
      {
        if (-[MRSlideFocusState isInZoomMode](self->mInternal->mSlideFocusState, "isInZoomMode"))
        {
          v5[98] = 1;
          double v6 = 0.0;
LABEL_17:
          v5[100] = -[MRSlideFocusState isInZoomMode](self->mInternal->mSlideFocusState, "isInZoomMode");
          -[MRLayerEffect pzrEnd:](v7, "pzrEnd:", a3);
          return v6;
        }

        -[MRRenderer animateCurrentFocuserToSlideFocusModeWithDuration:]( self,  "animateCurrentFocuserToSlideFocusModeWithDuration:",  0.25);
      }
    }

    else
    {
      -[MRRenderer exitSlideFocusMode](self, "exitSlideFocusMode");
    }

    double v6 = v13;
    goto LABEL_17;
  }

  return 0.0;
}

- (double)slideZoomCancel:(id)a3
{
  if (self->mInternal->mSlideFocusState)
  {
    id v5 = [a3 specificObject];
    v5[99] = 1;
    v5[100] = -[MRSlideFocusState isInZoomMode](self->mInternal->mSlideFocusState, "isInZoomMode");
    if (-[MRSlideFocusState isTransitioning](self->mInternal->mSlideFocusState, "isTransitioning"))
    {
      -[MRRenderer focusedTransitionCancel:](self, "focusedTransitionCancel:", a3);
      return result;
    }

    -[MRLayerEffect pzrCancel:]( self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex],  "pzrCancel:",  a3);
  }

  return 0.0;
}

- (void)_cleanupGestureRecognizers
{
  id v2 = self;
  if (-[NSMutableDictionary count](self->mInternal->mGestureRecognizers, "count"))
  {
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    obj = v2->mInternal->mGestureRecognizers;
    id v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v38,  16LL);
    if (v22)
    {
      BOOL v23 = 0LL;
      double v20 = v2;
      uint64_t v21 = *(void *)v33;
      while (1)
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(obj);
          }
          double v4 = *(void **)(*((void *)&v32 + 1) + 8LL * (void)i);
          if (objc_msgSend(objc_msgSend(v4, "object"), "isActivated"))
          {
            id v5 = -[NSMutableDictionary objectForKey:](v2->mInternal->mGestureRecognizers, "objectForKey:", v4);
            __int128 v24 = 0u;
            __int128 v25 = 0u;
            __int128 v26 = 0u;
            __int128 v27 = 0u;
            id v6 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
            if (!v6) {
              continue;
            }
            id v7 = v6;
            id v8 = 0LL;
            uint64_t v9 = *(void *)v25;
            do
            {
              for (j = 0LL; j != v7; j = (char *)j + 1)
              {
                if (*(void *)v25 != v9) {
                  objc_enumerationMutation(v5);
                }
                double v11 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)j);
                if (([v11 state] & 0x24) != 0)
                {
                  if (!v8) {
                    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
                  }
                  -[NSMutableArray addObject:](v8, "addObject:", v11);
                  [v11 cleanup];
                }
              }

              id v7 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
            }

            while (v7);
            if (!v8 || ([v5 removeObjectsInArray:v8], v8, objc_msgSend(v5, "count")))
            {
              id v2 = v20;
              continue;
            }
          }

          else
          {
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            __int128 v28 = 0u;
            __int128 v29 = 0u;
            id v12 = -[NSMutableDictionary objectForKey:](v2->mInternal->mGestureRecognizers, "objectForKey:", v4);
            id v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v29;
              do
              {
                for (k = 0LL; k != v14; k = (char *)k + 1)
                {
                  if (*(void *)v29 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  id v17 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)k);
                  [v17 abort];
                  [v17 cleanup];
                }

                id v14 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
              }

              while (v14);
            }
          }

          id v2 = v20;
          double v18 = v23;
          if (!v23) {
            double v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          BOOL v23 = v18;
          -[NSMutableArray addObject:](v18, "addObject:", v4);
        }

        id v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v32,  v38,  16LL);
        if (!v22)
        {
          if (v23)
          {
            -[NSMutableDictionary removeObjectsForKeys:]( v2->mInternal->mGestureRecognizers,  "removeObjectsForKeys:",  v23);
          }

          return;
        }
      }
    }
  }

- (id)_computeMatrixChainForLayer:(id)a3
{
  double v4 = -[NSMutableArray initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithObjects:", a3, 0LL);
  id v5 = [a3 superlayer];
  if (v5)
  {
    id v6 = v5;
    do
    {
      if (*((_BYTE *)[v6 renderingState] + 242)) {
        -[NSMutableArray addObject:](v4, "addObject:", v6);
      }
      id v6 = [v6 superlayer];
    }

    while (v6);
  }

  id v7 = +[NSMutableArray arrayWithCapacity:]( &OBJC_CLASS___NSMutableArray,  "arrayWithCapacity:",  -[NSMutableArray count](v4, "count"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v8 = -[NSMutableArray reverseObjectEnumerator](v4, "reverseObjectEnumerator");
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        MRMatrix_MultiplyWithMatrix( (float *)[*(id *)(*((void *)&v15 + 1) + 8 * (void)i) renderingState] + 28,  (float *)objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)i), "renderingState") + 44,  v20);
        if (MRMatrix_Invert(v20, v19))
        {
          id v13 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v19, 64LL);
          -[NSMutableArray addObject:](v7, "addObject:", v13);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }

    while (v10);
  }

  return v7;
}

- (void)_doLayerTrackingAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = self;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  mInternal = self->mInternal;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id obj = -[NSMutableDictionary objectEnumerator](mInternal->mLayerTrackings, "objectEnumerator");
  id v7 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0LL;
    uint64_t v10 = *(void *)v66;
    uint64_t v52 = *(void *)v66;
    v53 = v5;
    do
    {
      uint64_t v11 = 0LL;
      id v54 = v8;
      do
      {
        if (*(void *)v66 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v65 + 1) + 8LL * (void)v11);
        id v13 = [v12 objectForKey:@"layer"];
        if ([v13 isActivated])
        {
          id v14 = -[MRAction initWithAction:andTarget:]( [MRAction alloc],  "initWithAction:andTarget:",  +[MCActionTrigger actionTriggerForTargetPlugObjectID:withActionKey:]( MCActionTrigger,  "actionTriggerForTargetPlugObjectID:withActionKey:",  0,  objc_msgSend( objc_msgSend(objc_msgSend(v12, "objectForKey:", @"action"), "attributes"),  "objectForKey:",  @"actionKey")),  v13);
          -[MRAction setSender:](v14, "setSender:", v13);
          __int128 v15 = +[NSMutableArray arrayWithObject:](&OBJC_CLASS___NSMutableArray, "arrayWithObject:", v13);
          id v16 = [v13 superlayer];
          if (v16)
          {
            id v17 = v16;
            do
            {
              if (*((_BYTE *)[v17 renderingState] + 242)) {
                -[NSMutableArray addObject:](v15, "addObject:", v17);
              }
              id v17 = [v17 superlayer];
            }

            while (v17);
          }

          double height = v5->mSize.height;
          double v19 = -(v5->mSize.width - x * 2.0) / v5->mSize.width;
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          double v20 = -(height - y * 2.0) / height;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          id v21 = -[NSMutableArray reverseObjectEnumerator](v15, "reverseObjectEnumerator");
          id v22 = [v21 countByEnumeratingWithState:&v61 objects:v72 count:16];
          if (v22)
          {
            id v23 = v22;
            __int128 v24 = v9;
            uint64_t v25 = *(void *)v62;
            do
            {
              for (i = 0LL; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v62 != v25) {
                  objc_enumerationMutation(v21);
                }
                MRMatrix_MultiplyWithMatrix( (float *)[*(id *)(*((void *)&v61 + 1) + 8 * (void)i) renderingState] + 28,  (float *)objc_msgSend(*(id *)(*((void *)&v61 + 1) + 8 * (void)i), "renderingState") + 44,  (float *)v71);
                if (MRMatrix_Invert((float *)v71, v70))
                {
                  double v19 = MRMatrix_UnprojectPoint(v70, v19, v20);
                  double v20 = v27;
                }
              }

              id v23 = [v21 countByEnumeratingWithState:&v61 objects:v72 count:16];
            }

            while (v23);
          }

          else
          {
            __int128 v24 = v9;
          }

          [v13 pixelSize];
          double v29 = v28;
          [v13 pixelSize];
          double v31 = v20 * (v29 / v30);
          __int128 v32 = +[NSMutableDictionary dictionaryWithDictionary:]( NSMutableDictionary,  "dictionaryWithDictionary:",  [v13 persistentState]);
          *(float *)&double v33 = v19;
          -[NSMutableDictionary setObject:forKey:]( v32,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v33),  @"trackingX");
          *(float *)&double v34 = v31;
          -[NSMutableDictionary setObject:forKey:]( v32,  "setObject:forKey:",  +[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", v34),  @"trackingY");
          -[MRAction setStates:](v14, "setStates:", v32);
          -[MRRenderer time](v53, "time");
          -[MRAction setTime:](v14, "setTime:");
          -[MRRenderer doAction:](v53, "doAction:", v14);

          id v9 = v24;
          id v5 = v53;
          uint64_t v10 = v52;
          id v8 = v54;
        }

        else
        {
          if (!v9) {
            id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray addObject:](v9, "addObject:", [v13 uuid]);
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v11 != v8);
      id v8 = [obj countByEnumeratingWithState:&v65 objects:v73 count:16];
    }

    while (v8);
    if (v9)
    {
      -[NSMutableDictionary removeObjectsForKeys:](v5->mInternal->mLayerTrackings, "removeObjectsForKeys:", v9);
    }
  }

  v71[0] = CGPointZero;
  id v35 = -[MRRenderer layerHitAtPoint:onlyIfHitElement:localPoint:]( v5,  "layerHitAtPoint:onlyIfHitElement:localPoint:",  1LL,  v71,  x,  y);
  if (v35)
  {
    while (1)
    {
      id v36 = objc_msgSend(objc_msgSend(v35, "plug"), "actionForKey:", @"onTrackIn");
      if (v36) {
        break;
      }
      id v35 = [v35 superlayer];
      if (!v35) {
        goto LABEL_34;
      }
    }

    id obja = v36;
  }

  else
  {
LABEL_34:
    id obja = 0LL;
  }

  id v37 = -[NSMutableSet copy](v5->mInternal->mLayersCurrentlyTrackedIn, "copy");
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  id v38 = [v37 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v58;
    do
    {
      for (j = 0LL; j != v39; j = (char *)j + 1)
      {
        if (*(void *)v58 != v40) {
          objc_enumerationMutation(v37);
        }
        id v42 = *(id *)(*((void *)&v57 + 1) + 8LL * (void)j);
        BOOL v43 = v35 == v42 || v35 == 0LL;
        id v44 = v35;
        if (!v43)
        {
          id v44 = v35;
          do
            id v44 = [v44 superlayer];
          while (v44 != v42 && v44);
        }

        if (!v44)
        {
          id v45 = objc_msgSend(objc_msgSend(v42, "plug"), "actionForKey:", @"onTrackOut");
          if (v45)
          {
            __int128 v46 = -[MRAction initWithAction:inRenderer:]( objc_alloc(&OBJC_CLASS___MRAction),  "initWithAction:inRenderer:",  v45,  v5);
            -[MRAction setSender:](v46, "setSender:", v42);
            id v47 = [v42 persistentState];
            if (v47) {
              -[MRAction setStates:]( v46,  "setStates:",  +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v47));
            }
            -[MRRenderer time](v5, "time");
            -[MRAction setTime:](v46, "setTime:");
            -[MRRenderer doAction:](v5, "doAction:", v46);
          }

+ (double)textScaleForResolution:(CGSize)a3
{
  if (a3.width >= a3.height) {
    a3.width = a3.height;
  }
  return a3.width / 800.0;
}

- (BOOL)getVerticesCoordinatesForCurrentlyEditedTextElement:(CGPoint *)(a3
{
  mInternal = self->mInternal;
  if (mInternal->mCurrentlyEditedTextElement)
  {
    unsigned int v6 = -[MRLayerEffect getVerticesCoordinates:forElement:]( mInternal->mLayerCurrentlyTextEditing,  "getVerticesCoordinates:forElement:");
    if (v6)
    {
      uint64_t v7 = 0LL;
      p_mSize = &self->mSize;
      float64x2_t v9 = vld1q_dup_f64(&p_mSize->width);
      p_mSize = (CGSize *)((char *)p_mSize + 8);
      float64x2_t v10 = vld1q_dup_f64(&p_mSize->width);
      __asm
      {
        FMOV            V2.2D, #1.0
        FMOV            V3.2D, #0.5
      }

      do
      {
        id v17 = &(*a3)[v7];
        float64x2x2_t v19 = vld2q_f64(&v17->x);
        v20.val[0] = vmulq_f64(vmulq_f64(vaddq_f64(v19.val[0], _Q2), v9), _Q3);
        v20.val[1] = vmulq_f64(vmulq_f64(vaddq_f64(v19.val[1], _Q2), v10), _Q3);
        vst2q_f64(&v17->x, v20);
        v7 += 2LL;
      }

      while (v7 != 4);
      LOBYTE(v6) = 1;
    }
  }

  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (CGSize)_maxSizeForCurrentEditingTextElement
{
  mInternal = self->mInternal;
  mLayerCurrentlyTextEditing = mInternal->mLayerCurrentlyTextEditing;
  if (mLayerCurrentlyTextEditing)
  {
    -[MRLayerEffect _maxSizeForTextElement:]( mLayerCurrentlyTextEditing,  "_maxSizeForTextElement:",  -[MRLayerEffect editedElement](mInternal->mLayerCurrentlyTextEditing, "editedElement"));
  }

  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }

  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)_maxLinesForCurrentEditingTextElement
{
  mInternal = self->mInternal;
  mLayerCurrentlyTextEditing = mInternal->mLayerCurrentlyTextEditing;
  if (mLayerCurrentlyTextEditing) {
    return -[MRLayerEffect _maxLinesForTextElement:]( mLayerCurrentlyTextEditing,  "_maxLinesForTextElement:",  -[MRLayerEffect editedElement](mInternal->mLayerCurrentlyTextEditing, "editedElement"));
  }
  else {
    return 0LL;
  }
}

- (BOOL)beginTextEditingOfElement:(id)a3 inLayer:(id)a4 callDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  mInternal = self->mInternal;
  if (mInternal->mLayerCurrentlyTextEditing == a4)
  {
    mInternal = self->mInternal;
  }

  if (mInternal->mCurrentlyEditedTextElement) {
    -[MRRenderer endTextEditing:](self, "endTextEditing:", v5);
  }
  self->mInternal->mLayerCurrentlyTextEditing = (MRLayerEffect *)a4;
  -[MRLayerEffect setEditedElement:](self->mInternal->mLayerCurrentlyTextEditing, "setEditedElement:", a3);
  self->mInternal->mCurrentlyEditedTextElement = (NSString *)[a3 copy];
  float64x2_t v10 = -[MRRenderer editingDelegate](self, "editingDelegate");
  unsigned __int8 v11 = 1;
  if (v5)
  {
    id v12 = v10;
    if (v10)
    {
      if (([a4 getVerticesCoordinates:&v19 forElement:a3] & 1) == 0)
      {
        CGPoint v19 = CGPointZero;
        uint64_t v21 = 0LL;
        uint64_t v22 = 0LL;
        uint64_t v20 = 0x3FF0000000000000LL;
        __asm { FMOV            V0.2D, #1.0 }

        __int128 v23 = _Q0;
        uint64_t v24 = 0x3FF0000000000000LL;
      }

      unsigned __int8 v11 = -[MREditingDelegate beginEditingTextElement:inContainer:clickAt:vertices:]( v12,  "beginEditingTextElement:inContainer:clickAt:vertices:",  a3,  objc_msgSend(objc_msgSend(a4, "plug", v19, v20, v21, v22, v23, v24), "container"),  &v19,  CGPointZero.x,  CGPointZero.y);
      if ((v11 & 1) != 0)
      {
        -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
      }

      else
      {
        -[MRLayerEffect setEditedElement:](self->mInternal->mLayerCurrentlyTextEditing, "setEditedElement:", 0LL);

        self->mInternal->mLayerCurrentlyTextEditing = 0LL;
        self->mInternal->mCurrentlyEditedTextElement = 0LL;
      }
    }
  }

  return v11;
}

- (BOOL)beginTextEditingOfElement:(id)a3 inPlug:(id)a4 callDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  float64x2_t v9 = (MCMontage *)[a4 montage];
  if (v9 == -[MRRenderer montage](self, "montage")
    && (id v10 = [a4 container],
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___MCContainerEffect, v11),
        (objc_opt_isKindOfClass(v10, v12) & 1) != 0)
    && (id v13 = -[MRLayerParallelizer sublayerForPlugObjectID:recursive:]( self->mTopMRLayer,  "sublayerForPlugObjectID:recursive:",  [a4 objectID],  1),  objc_msgSend(v13, "isActivated")))
  {
    return -[MRRenderer beginTextEditingOfElement:inLayer:callDelegate:]( self,  "beginTextEditingOfElement:inLayer:callDelegate:",  a3,  v13,  v5);
  }

  else
  {
    return 0;
  }

- (void)endTextEditing:(BOOL)a3
{
  if (self->mInternal->mCurrentlyEditedTextElement)
  {
    BOOL v3 = a3;
    BOOL v5 = -[MRRenderer editingDelegate](self, "editingDelegate");
    if (v3)
    {
      if (v5) {
        -[MREditingDelegate endEditingTextElement:inContainer:]( v5,  "endEditingTextElement:inContainer:",  self->mInternal->mCurrentlyEditedTextElement,  -[MCPlug container](-[MRLayer plug](self->mInternal->mLayerCurrentlyTextEditing, "plug"), "container"));
      }
    }

    -[MRLayerEffect setEditedElement:](self->mInternal->mLayerCurrentlyTextEditing, "setEditedElement:", 0LL);

    self->mInternal->mCurrentlyEditedTextElement = 0LL;
    self->mInternal->mLayerCurrentlyTextEditing = 0LL;
    -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
  }

+ (BOOL)isDiskImageCacheEnabled
{
  return 0;
}

- (MRRenderer)initWithParameters:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRRenderer;
  double v4 = -[MRRenderer init](&v10, "init");
  if (v4)
  {
    v4->mInternal = objc_alloc_init(&OBJC_CLASS___MRRendererInternal);
    v4->mMode = 0;
    v4->mPushRendering = 1;
    v4->mVolume = 1.0;
    v4->mTimeQuantum = 0.0166666667;
    v4->mInternal->mSelectedLayers = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v4->mInternal->mMasterClock = -1.0;
    v4->mDisplayLinkTimestamp = -1.0;
    v4->mInternal->mRenderDispatchQueue = (OS_dispatch_queue *)dispatch_queue_create( -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MRRenderer %p",  v4),  "UTF8String"),  0LL);
    mRenderDispatchQueue = (dispatch_object_s *)v4->mInternal->mRenderDispatchQueue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
    dispatch_set_target_queue(mRenderDispatchQueue, global_queue);
    dispatch_queue_set_specific( (dispatch_queue_t)v4->mInternal->mRenderDispatchQueue,  sRenderDispatchQueueSpecificKey,  v4,  0LL);
    v4->mInternal->mRenderThread = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  v4,  "_renderThreadMain",  0LL);
    v4->mInternal->mRenderDispatchQueueCopyForRenderThread = v4->mInternal->mRenderDispatchQueue;
    dispatch_retain((dispatch_object_t)v4->mInternal->mRenderDispatchQueueCopyForRenderThread);
    -[NSThread start](v4->mInternal->mRenderThread, "start");
    v4->mInternal->mFrameLock = -[NSConditionLock initWithCondition:]( objc_alloc(&OBJC_CLASS___NSConditionLock),  "initWithCondition:",  0LL);
    -[NSConditionLock setName:](v4->mInternal->mFrameLock, "setName:", @"MRRenderer.frameLock");
    v4->mInternal->mSnapshotAsCGImageLock = -[NSConditionLock initWithCondition:]( objc_alloc(&OBJC_CLASS___NSConditionLock),  "initWithCondition:",  0LL);
    -[NSConditionLock setName:]( v4->mInternal->mSnapshotAsCGImageLock,  "setName:",  @"MRRenderer.snapshotAsCGImageLock");
    v4->mDisplaysFPS = -[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "BOOLForKey:",  @"MRDisplaysFPS");
    v4->mDisplaysPlayingIDs = -[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"),  "BOOLForKey:",  @"MRDisplaysPlayingIDs");
    v4->mDisplaysIsPreloadingImages = -[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"),  "BOOLForKey:",  @"MRDisplaysIsPreloadingImages");
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    -[NSOperationQueue setMaxConcurrentOperationCount:]( v7,  "setMaxConcurrentOperationCount:",  +[MRUtilities operationQueueConcurrentOperationCount]( &OBJC_CLASS___MRUtilities,  "operationQueueConcurrentOperationCount"));
    -[NSOperationQueue setSuspended:](v7, "setSuspended:", 0LL);
    v4->mInternal->mRenderArguments = -[MRRenderArguments initWithRenderer:]( objc_alloc(&OBJC_CLASS___MRRenderArguments),  "initWithRenderer:",  v4);
    -[MRRenderArguments setPreloadQueue:](v4->mInternal->mRenderArguments, "setPreloadQueue:", v7);

    id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", a3);
    -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v4, @"renderer");
    v4->mParameters = &v8->super;
    v4->mOrientation = 0;
    v4->mInternal->mMorphingStartTime = -1.0;
    v4->mInternal->mActions = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v4->mInternal->mLayersCurrentlyTrackedIn = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v4->mInternal->mHideTextWhileEditing = 1;
    v4->mInternal->mTouchesForVisualFeedback = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v4->mInternal->mHitZonesForVisualFeedback = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v4->_allowsThumbnails = 1;
    v4->_interactivityIsEnabled = -[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"),  "BOOLForKey:",  @"MarimbaInteractivityIsEnabled");
    -[MRRenderer _startMonitoringThermalPressureLevelChanges](v4, "_startMonitoringThermalPressureLevelChanges");
  }

  return v4;
}

- (MRRenderer)init
{
  return -[MRRenderer initWithParameters:](self, "initWithParameters:", 0LL);
}

- (void)dealloc
{
  self->mInternal->mFrameLock = 0LL;
  self->mInternal->mSnapshotAsCGImageLock = 0LL;
  dispatch_release((dispatch_object_t)self->mInternal->mRenderDispatchQueue);
  self->mInternal->mRenderDispatchQueue = 0LL;

  self->_renderingLogFilePath = 0LL;
  self->mInternal = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRRenderer;
  -[MRRenderer dealloc](&v3, "dealloc");
}

- (void)cleanup
{
  if (!self->mIsCleanedUp)
  {
    self->mIsCleanedUp = 1;
    -[MRRenderer endTextEditing:](self, "endTextEditing:", 0LL);
    mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_3CA84;
    v14[3] = &unk_24D5B0;
    v14[4] = self;
    PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v14);
    -[NSOperationQueue setSuspended:]( -[MRRenderArguments preloadQueue](self->mInternal->mRenderArguments, "preloadQueue"),  "setSuspended:",  0LL);
    -[MRAsynchronousOperationsDelegate setSuspended:]( self->mInternal->mAsynchronousOperationsDelegate,  "setSuspended:",  0LL);
    mInternal = self->mInternal;
    mRenderThread = mInternal->mRenderThread;
    mInternal->mRenderThread = 0LL;
    +[NSNull performSelector:onThread:withObject:waitUntilDone:]( &OBJC_CLASS___NSNull,  "performSelector:onThread:withObject:waitUntilDone:",  "null",  mRenderThread,  0LL,  0LL);

    self->mInternal->mSelectedLayers = 0LL;
    objc_storeWeak((id *)&self->_assetManagementDelegate, 0LL);
    objc_storeWeak((id *)&self->_renderingDelegate, 0LL);
    objc_storeWeak((id *)&self->_editingDelegate, 0LL);

    self->mDescriptionsForRandomTransitionPresetIDs = 0LL;
    objc_storeWeak((id *)&self->_featureDelegate, 0LL);
    -[MRRenderArguments cleanup](self->mInternal->mRenderArguments, "cleanup");

    self->mInternal->mRenderArguments = 0LL;
    unsigned int v6 = self->mInternal;
    mScreenBurnTestAccumulationImage1 = v6->mScreenBurnTestAccumulationImage1;
    if (mScreenBurnTestAccumulationImage1)
    {
      -[MRImage cleanup](mScreenBurnTestAccumulationImage1, "cleanup");
      -[MRImage releaseByUser](self->mInternal->mScreenBurnTestAccumulationImage1, "releaseByUser");
      self->mInternal->mScreenBurnTestAccumulationImage1 = 0LL;
      unsigned int v6 = self->mInternal;
    }

    mScreenBurnTestAccumulationImage2 = v6->mScreenBurnTestAccumulationImage2;
    if (mScreenBurnTestAccumulationImage2)
    {
      -[MRImage cleanup](mScreenBurnTestAccumulationImage2, "cleanup");
      -[MRImage releaseByUser](self->mInternal->mScreenBurnTestAccumulationImage2, "releaseByUser");
      self->mInternal->mScreenBurnTestAccumulationImage2 = 0LL;
    }

    self->mParameters = 0LL;
    self->mInternal->mActions = 0LL;

    self->mInternal->mDefaultActions = 0LL;
    -[NSMutableSet removeAllObjects](self->mInternal->mLayersCurrentlyTrackedIn, "removeAllObjects");

    self->mInternal->mLayersCurrentlyTrackedIn = 0LL;
    -[NSMutableDictionary removeAllObjects](self->mInternal->mLayerTrackings, "removeAllObjects");

    self->mInternal->mLayerTrackings = 0LL;
    -[NSMutableDictionary removeAllObjects](self->mInternal->mGestureRecognizers, "removeAllObjects");

    self->mInternal->mGestureRecognizers = 0LL;
    float64x2_t v9 = self->mInternal;
    mAudioPlayerBuckets = v9->mAudioPlayerBuckets;
    if (mAudioPlayerBuckets)
    {

      self->mInternal->mAudioPlayerBuckets = 0LL;
      float64x2_t v9 = self->mInternal;
    }

    mAudioPlayerSortedBuckets = v9->mAudioPlayerSortedBuckets;
    if (mAudioPlayerSortedBuckets)
    {

      self->mInternal->mAudioPlayerSortedBuckets = 0LL;
      float64x2_t v9 = self->mInternal;
    }

    self->mInternal->mTouchesForVisualFeedback = 0LL;
    self->mInternal->mHitZonesForVisualFeedback = 0LL;

    self->_cameraCaptureSession = 0LL;
    -[NSConditionLock lock](self->mInternal->mSnapshotAsCGImageLock, "lock");
    uint64_t v12 = self->mInternal;
    mSnapshotAsCGImage = v12->mSnapshotAsCGImage;
    if (mSnapshotAsCGImage)
    {
      CGImageRelease(mSnapshotAsCGImage);
      self->mInternal->mSnapshotAsCGImage = 0LL;
      uint64_t v12 = self->mInternal;
    }

    -[NSConditionLock unlock](v12->mSnapshotAsCGImageLock, "unlock");

    self->mInternal->mNavigatorHistoryBack = 0LL;
    self->mInternal->mNavigatorHistoryForth = 0LL;

    self->mInternal->mCurrentIDs = 0LL;
    self->mInternal->mPreviousCurrentIDs = 0LL;
  }

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (NSStringIsEqual(a3, "rootPlug.fullDuration")
    || NSStringHasPrefix(a3, "fadeInDuration")
    || NSStringHasPrefix(a3, "fadeOutDuration"))
  {
    -[MRRenderer resetFadeInAndOut](self, "resetFadeInAndOut");
  }

- (void)setEAGLContext:(id)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_3CD60;
  v6[3] = &unk_24D9B8;
  v6[4] = self;
  v6[5] = a3;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v6);
}

- (void)setMontage:(id)a3
{
  if (self->mMontage != a3)
  {
    mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_3CFE8;
    v4[3] = &unk_24D9B8;
    v4[4] = self;
    void v4[5] = a3;
    PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v4);
  }

- (void)setCameraCaptureSession:(id)a3
{
  self->_cameraCaptureSession = (MRCameraCaptureSession *)a3;
}

- (OS_dispatch_queue)renderDispatchQueue
{
  return self->mInternal->mRenderDispatchQueue;
}

- (BOOL)slaveFrameMode
{
  return self->mInternal->mSlaveFrameMode;
}

- (void)setSlaveFrameMode:(BOOL)a3
{
  self->mInternal->mSlaveFrameMode = a3;
}

- (BOOL)isPlaying
{
  mInternal = self->mInternal;
  uint64_t v3 = 1040LL;
  if (mInternal->mIsPlayingSyncRequestCount <= 0) {
    uint64_t v3 = 1041LL;
  }
  return *((_BYTE *)&mInternal->super.isa + v3);
}

- (void)pause
{
  self->mInternal->mOuterIsPlaying = 0;
  p_mIsPlayingSyncRequestCount = &self->mInternal->mIsPlayingSyncRequestCount;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_mIsPlayingSyncRequestCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_mIsPlayingSyncRequestCount));
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v5[0] = (void (*)(void))_NSConcreteStackBlock;
  v5[1] = (void (*)(void))3221225472LL;
  v5[2] = (void (*)(void))sub_3D3B0;
  v5[3] = (void (*)(void))&unk_24D5B0;
  v5[4] = (void (*)(void))self;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v5);
}

- (void)resume
{
  self->mInternal->mOuterIsPlaying = 1;
  p_mIsPlayingSyncRequestCount = &self->mInternal->mIsPlayingSyncRequestCount;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_mIsPlayingSyncRequestCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_mIsPlayingSyncRequestCount));
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v5[0] = (void (*)(void))_NSConcreteStackBlock;
  v5[1] = (void (*)(void))3221225472LL;
  v5[2] = (void (*)(void))sub_3D438;
  v5[3] = (void (*)(void))&unk_24D5B0;
  v5[4] = (void (*)(void))self;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v5);
}

- (void)_r_syncIsPlayingToOuter
{
  if (!self->mIsCleanedUp)
  {
    if (self->mInternal->mOuterIsPlaying) {
      -[MRRenderer _r_resume](self, "_r_resume");
    }
    else {
      -[MRRenderer _r_pause](self, "_r_pause");
    }
    p_mIsPlayingSyncRequestCount = &self->mInternal->mIsPlayingSyncRequestCount;
    do
      unsigned int v4 = __ldaxr((unsigned int *)p_mIsPlayingSyncRequestCount);
    while (__stlxr(v4 - 1, (unsigned int *)p_mIsPlayingSyncRequestCount));
  }

- (void)_r_pause
{
  if (!self->mIsCleanedUp)
  {
    self->mInternal->mShouldPauseWhenStill = 0;
    if (self->mInternal->mInnerIsPlaying)
    {
      -[MRRenderer _time](self, "_time");
      self->mInternal->mTimeOffset = v3;
      -[MRRenderer _unalteredTime](self, "_unalteredTime");
      self->mInternal->mUnalteredTimeOffset = v4;
      self->mInternal->mInnerIsPlaying = 0;
      self->mDisplayLinkTimestamp = -1.0;
      self->mInternal->mIsStalled = 0;
      BOOL v5 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Rendering ended at time %f\n",  MRGetCurrentTime());
      mInternal = self->mInternal;
      if (mInternal->mRespondsToLogDelegateMethod)
      {
        -[MRRenderingDelegate renderer:renderingTimeLogMessage:withTimestamp:]( -[MRRenderer renderingDelegate](self, "renderingDelegate"),  "renderer:renderingTimeLogMessage:withTimestamp:",  self,  v5,  CFAbsoluteTimeGetCurrent());
        self->mInternal->mRespondsToLogDelegateMethod = 0;
      }

      else
      {
        mRenderingLogFile = mInternal->mRenderingLogFile;
        if (mRenderingLogFile)
        {
          fputs(-[NSString UTF8String](v5, "UTF8String"), mRenderingLogFile);
          fclose(self->mInternal->mRenderingLogFile);
          self->mInternal->mRenderingLogFile = 0LL;
        }
      }

      self->mInternal->mNeedsToResumeOrPauseLayers = 1;
      self->mInternal->mRenderingRequested = 0;
      id v8 = self->mInternal;
      if (!v8->mSlaveFrameMode)
      {
        -[MRRenderer _r_stopRenderTimer](self, "_r_stopRenderTimer");
        id v8 = self->mInternal;
      }

      if (v8->mMasterMode == 2) {
        -[MRRenderer setMasterStartTime:andDuration:mode:](self, "setMasterStartTime:andDuration:mode:", 0LL, 0.0, 0.0);
      }
      -[MRRenderer _r_prerenderWithPassParameters:](self, "_r_prerenderWithPassParameters:", 0LL);
    }
  }

- (void)_r_resume
{
  if (!self->mIsCleanedUp)
  {
    self->mInternal->mShouldPauseWhenStill = 0;
    if (!self->mInternal->mInnerIsPlaying)
    {
      if (-[NSUserDefaults BOOLForKey:]( +[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"),  "BOOLForKey:",  @"LogRenderingTimes")
        || self->_logRenderingTimes)
      {
        double v3 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Rendering starting at time %f\n",  MRGetCurrentTime());
        double v4 = -[MRRenderer renderingDelegate](self, "renderingDelegate");
        self->mInternal->mRespondsToLogDelegateMethod = objc_opt_respondsToSelector( v4,  "renderer:renderingTimeLogMessage:withTimestamp:") & 1;
        if (self->mInternal->mRespondsToLogDelegateMethod)
        {
          -[MRRenderingDelegate renderer:renderingTimeLogMessage:withTimestamp:]( v4,  "renderer:renderingTimeLogMessage:withTimestamp:",  self,  v3,  CFAbsoluteTimeGetCurrent());
        }

        else
        {
          time(&v10);
          BOOL v5 = ctime(&v10);
          if (strlen(v5) == 1)
          {
            size_t v6 = 0LL;
          }

          else
          {
            size_t v6 = 0LL;
            do
            {
              if (v5[v6] == 32) {
                v5[v6] = 95;
              }
              ++v6;
            }

            while (strlen(v5) - 1 > v6);
          }

          v5[v6] = 0;
          uint64_t v7 = NSTemporaryDirectory();
          -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  v7,  1LL,  0LL,  0LL);
          id v8 =  -[NSString stringByAppendingPathComponent:]( v7,  "stringByAppendingPathComponent:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"RenderingTimes-%s.log",  v5));
          self->_renderingLogFilePath = (NSString *)&v8->_p;
          if (v8) {
            id v8 = fopen((const char *)-[FILE UTF8String](v8, "UTF8String"), "wc");
          }
          self->mInternal->mRenderingLogFile = v8;
          if (self->mInternal->mRenderingLogFile)
          {
            NSLog(@"Logging rendering times to '%@'", self->_renderingLogFilePath);
            fputs(-[NSString UTF8String](v3, "UTF8String"), self->mInternal->mRenderingLogFile);
          }

          else
          {
            NSLog(@"Failed creating rendering times log file at '%@'", self->_renderingLogFilePath);
          }
        }
      }

      self->mInternal->mInnerIsPlaying = 1;
      self->mInternal->mIsStalled = 0;
      double mTimeOffset = self->mInternal->mTimeOffset;
      -[MRRenderer _r_setTime:isResyncing:](self, "_r_setTime:isResyncing:", 1LL, mTimeOffset);
      self->mInternal->mUnalteredTimeOffset = mTimeOffset
                                            + self->mInternal->mTimeOffset
                                            - self->mInternal->mUnalteredTimeOffset;
      self->mInternal->mNeedsToResumeOrPauseLayers = 1;
      if (!self->mInternal->mSlaveFrameMode) {
        -[MRRenderer _r_startRenderTimer](self, "_r_startRenderTimer");
      }
    }
  }

- (void)pauseWhenStill
{
  self->mInternal->mShouldPauseWhenStill = 1;
}

- (void)requestRendering:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    mInternal = self->mInternal;
  }

  else
  {
    if (-[MRRenderer isPlaying](self, "isPlaying") && self->mPushRendering) {
      return;
    }
    mInternal = self->mInternal;
    if (mInternal->mRenderingRequested) {
      return;
    }
  }

  mInternal->mRenderingRequested = 1;
  size_t v6 = self->mInternal->mFrameLock;
  if (v3)
  {
    -[NSConditionLock lockBeforeDate:]( v6,  "lockBeforeDate:",  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0));
    -[NSConditionLock unlockWithCondition:](v6, "unlockWithCondition:", 1LL);
  }

  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3D98C;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
  if (v3 && !self->mIsCleanedUp)
  {
    if (-[NSConditionLock lockWhenCondition:beforeDate:]( v6,  "lockWhenCondition:beforeDate:",  0LL,  +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 5.0)))
    {
      -[NSConditionLock unlock](v6, "unlock");
    }
  }
}

- (BOOL)requestRenderingWithin:(double)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3D9FC;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
  return 1;
}

- (void)warmupVideo:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    p_mInternal = &self->mInternal;
    self->mInternal->mRenderingRequested = 1;
    size_t v6 = dispatch_semaphore_create(0LL);
  }

  else
  {
    if (-[MRRenderer isPlaying](self, "isPlaying") && self->mPushRendering) {
      return;
    }
    p_mInternal = &self->mInternal;
    mInternal = self->mInternal;
    if (mInternal->mRenderingRequested) {
      return;
    }
    size_t v6 = 0LL;
    mInternal->mRenderingRequested = 1;
  }

  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_3DB30;
  block[3] = &unk_24D9E0;
  BOOL v11 = v3;
  block[4] = self;
  void block[5] = v6;
  dispatch_async(mRenderDispatchQueue, block);
  if (v3)
  {
    dispatch_time_t v9 = dispatch_time(0LL, 5000000000LL);
    dispatch_semaphore_wait(v6, v9);
    if (!self->mIsCleanedUp)
    {
      -[NSOperationQueue setSuspended:]( -[MRRenderArguments preloadQueue]((*p_mInternal)->mRenderArguments, "preloadQueue"),  "setSuspended:",  0LL);
      -[NSOperationQueue waitUntilAllOperationsAreFinished]( -[MRRenderArguments preloadQueue]((*p_mInternal)->mRenderArguments, "preloadQueue"),  "waitUntilAllOperationsAreFinished");
    }

    dispatch_release(v6);
  }

- (void)_renderThreadMain
{
  BOOL v3 = objc_autoreleasePoolPush();
  +[NSThread setThreadPriority:](&OBJC_CLASS___NSThread, "setThreadPriority:", 1.0);
  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",  objc_opt_class(&OBJC_CLASS___NSNull, v4),  "null",  0LL,  1LL,  1000000000.0);
  while (1)
  {
    mInternal = self->mInternal;
    if (!mInternal->mRenderThread) {
      break;
    }
    if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1000000000.0, 1u) != kCFRunLoopRunHandledSource)
    {
      mInternal = self->mInternal;
      break;
    }
  }

  if (!self->mIsCleanedUp)
  {
    mRenderDispatchQueueCopyForRenderThread = (dispatch_queue_s *)mInternal->mRenderDispatchQueueCopyForRenderThread;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_3DD04;
    block[3] = &unk_24D5B0;
    block[4] = self;
    dispatch_sync(mRenderDispatchQueueCopyForRenderThread, block);
    mInternal = self->mInternal;
  }

  dispatch_release((dispatch_object_t)mInternal->mRenderDispatchQueueCopyForRenderThread);
  self->mInternal->mRenderDispatchQueueCopyForRenderThread = 0LL;
  objc_autoreleasePoolPop(v3);
}

- (void)_r_updateTimeWithDisplayLinkTimestamp:(double)a3
{
  if (!self->mIsCleanedUp)
  {
    -[MRRenderer _time](self, "_time");
    double mDisplayLinkTimestamp = self->mDisplayLinkTimestamp;
    mInternal = self->mInternal;
    if (mDisplayLinkTimestamp < 0.0)
    {
      if (mInternal->mInnerIsPlaying) {
        self->double mDisplayLinkTimestamp = a3;
      }
      double mTimeOffset = mInternal->mTimeOffset;
      -[MRRenderer _r_setTime:isResyncing:](self, "_r_setTime:isResyncing:", 1LL);
      self->mInternal->mUnalteredTimeOffset = self->mInternal->mUnalteredTimeOffset
                                            + self->mInternal->mTimeOffset
                                            - mTimeOffset;
      goto LABEL_13;
    }

    if (mInternal->mInnerIsPlaying)
    {
      if (mInternal->mIsStalled)
      {
        self->double mDisplayLinkTimestamp = a3;
      }

      else
      {
        double v8 = self->mTimeQuantum * 12.0;
        self->double mDisplayLinkTimestamp = a3;
        if (a3 - mDisplayLinkTimestamp < v8) {
          return;
        }
      }

      goto LABEL_12;
    }

    if (mInternal->mIsStalled)
    {
LABEL_12:
      -[MRRenderer _r_setTime:isResyncing:](self, "_r_setTime:isResyncing:", 1LL);
LABEL_13:
      self->mInternal->mIsStalled = 0;
    }
  }

- (void)updateTimeWithDisplayLinkTimestamp:(double)a3
{
  mRenderDispatchQueueCopyForRenderThread = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueueCopyForRenderThread;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_3DE34;
  v4[3] = &unk_24D3B8;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_sync(mRenderDispatchQueueCopyForRenderThread, v4);
}

- (void)_renderOnDisplayLink:(id)a3
{
  mRenderDispatchQueueCopyForRenderThread = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueueCopyForRenderThread;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_3DEA0;
  v4[3] = &unk_24D9B8;
  v4[4] = a3;
  void v4[5] = self;
  dispatch_sync(mRenderDispatchQueueCopyForRenderThread, v4);
}

- (void)_startDisplayLinkOnRunloop
{
}

- (void)_r_startRenderTimer
{
  if (!self->mIsCleanedUp)
  {
    if (self->mDisplayLink)
    {
      NSLog(@"there already is a display link!!!", a2);
    }

    else if (!self->mInternal->mUsesExternalDisplayLink)
    {
      BOOL v3 =  +[CADisplayLink displayLinkWithTarget:selector:]( &OBJC_CLASS___CADisplayLink,  "displayLinkWithTarget:selector:",  self,  "_renderOnDisplayLink:");
      self->mDisplayLink = v3;
      -[CADisplayLink setPreferredFramesPerSecond:]( v3,  "setPreferredFramesPerSecond:",  llround(1.0 / self->mTimeQuantum));
      -[MRRenderer performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  "_startDisplayLinkOnRunloop",  self->mInternal->mRenderThread,  0LL,  0LL);
    }
  }

- (void)_r_stopRenderTimer
{
  if (!self->mIsCleanedUp)
  {
    mDisplayLink = self->mDisplayLink;
    self->mDisplayLink = 0LL;
    self->double mDisplayLinkTimestamp = -1.0;
    -[CADisplayLink performSelector:onThread:withObject:waitUntilDone:]( mDisplayLink,  "performSelector:onThread:withObject:waitUntilDone:",  "invalidate",  self->mInternal->mRenderThread,  0LL,  0LL);
  }

- (BOOL)prerenderWithPassParameters:(id)a3
{
  uint64_t v7 = 0LL;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_3E0E0;
  v6[3] = &unk_24DA08;
  v6[5] = a3;
  void v6[6] = &v7;
  v6[4] = self;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v6);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_r_prerenderWithPassParameters:(id)a3
{
  if (self->mIsCleanedUp) {
    return 0;
  }
  BOOL v5 = objc_autoreleasePoolPush();
  mInternal = self->mInternal;
  if (!mInternal->mContext
    || (self->mSize.width == CGSizeZero.width ? (BOOL v7 = self->mSize.height == CGSizeZero.height) : (BOOL v7 = 0),
        v7 || !self->mTopMRLayer))
  {
    if ((char *)-[NSConditionLock condition](mInternal->mFrameLock, "condition") == (char *)&dword_0 + 1)
    {
      double width = self->mSize.width;
      double height = self->mSize.height;
      BOOL v20 = width == CGSizeZero.width && height == CGSizeZero.height;
      if (v20 || !self->mTopMRLayer)
      {
        NSLog( @"Attempting a framelock with context %p, size %f,%f, topLayer %p, aborting",  self->mInternal->mContext,  *(void *)&width,  *(void *)&height,  self->mTopMRLayer);
        -[NSConditionLock lock](self->mInternal->mFrameLock, "lock");
        -[NSConditionLock unlockWithCondition:](self->mInternal->mFrameLock, "unlockWithCondition:", 0LL);
      }
    }

    goto LABEL_23;
  }

  mInternal->mRenderingRequested = 0;
  double v8 = self->mInternal;
  if (v8->mRenderingLogFile || v8->mRespondsToLogDelegateMethod)
  {
    double v9 = MRGetCurrentTime();
    char v10 = self->mInternal;
    double v11 = v9 - v10->mPreviousLogTime;
    double mTimeQuantum = self->mTimeQuantum;
    if (v11 < 5.0 && v11 > mTimeQuantum + mTimeQuantum)
    {
      uint64_t v14 = llround(v11 / mTimeQuantum) - 1;
      -[MRRenderer _time](self, "_time");
      id v16 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\t%d frames dropped at time %f, slideshow time %f\n",  v14,  *(void *)&v9,  v15);
      id v17 = self->mInternal;
      if (v17->mRespondsToLogDelegateMethod)
      {
        -[MRRenderingDelegate renderer:renderingTimeLogMessage:withTimestamp:]( -[MRRenderer renderingDelegate](self, "renderingDelegate"),  "renderer:renderingTimeLogMessage:withTimestamp:",  self,  v16,  CFAbsoluteTimeGetCurrent());
      }

      else
      {
        mRenderingLogFile = v17->mRenderingLogFile;
        if (mRenderingLogFile) {
          fputs(-[NSString UTF8String](v16, "UTF8String"), mRenderingLogFile);
        }
      }

      char v10 = self->mInternal;
      if (v9 - v10->mLastSavedLogTime >= 1.0)
      {
        fflush(v10->mRenderingLogFile);
        self->mInternal->mLastSavedLogTime = v9;
        char v10 = self->mInternal;
      }
    }

    v10->mPreviousLogTime = v9;
  }

  if (a3) {
    unsigned int v23 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"forceRendering"), "BOOLValue");
  }
  else {
    unsigned int v23 = 0;
  }
  uint64_t v24 = self->mInternal;
  if (v24->mScreenBurnTest)
  {
    double v25 = (double)v24->mScreenBurnTestCurrentPass / 60.0;
    if ((v23 & 1) != 0) {
      goto LABEL_39;
    }
  }

  else
  {
    -[MRRenderer _time](self, "_time");
    double v25 = v26 + 1.0e-10;
    uint64_t v24 = self->mInternal;
    if ((v23 & 1) != 0) {
      goto LABEL_39;
    }
  }

  if (v24->mInnerIsPlaying && v25 == self->_lastRenderedTime) {
    goto LABEL_23;
  }
LABEL_39:
  if (v24->mNeedsToResize)
  {
    if (!v24->mMorphingHandlesRotation)
    {
      if (-[MRContext orientation](v24->mContext, "orientation"))
      {
LABEL_48:
        -[MRContext setPixelOffset:]( self->mInternal->mContext,  "setPixelOffset:",  self->mInternal->mContextOffset.x,  self->mInternal->mContextOffset.y);
        -[MRContext setPixelSize:](self->mInternal->mContext, "setPixelSize:", self->mSize.width, self->mSize.height);
        -[MRLayer updateGeometry](self->mTopMRLayer, "updateGeometry");
        goto LABEL_49;
      }

      uint64_t v24 = self->mInternal;
    }

    unsigned int mOrientation = self->mOrientation;
    if (mOrientation) {
      uint64_t v28 = mOrientation;
    }
    else {
      uint64_t v28 = 4LL;
    }
    -[MRContext setOrientation:](v24->mContext, "setOrientation:", v28);
    goto LABEL_48;
  }

  if (!v24->mNeedsToTemporaryResize) {
    goto LABEL_50;
  }
  -[MRContext setPixelSize:](v24->mContext, "setPixelSize:", v24->mTemporarySize.width, v24->mTemporarySize.height);
LABEL_49:
  unsigned int v23 = 1;
LABEL_50:
  double v29 = self->mInternal;
  if (v29->mMorphingDuration <= 0.0)
  {
    v29->double mMorphingProgress = 1.0;
  }

  else
  {
    double v30 = 0.0;
    if (v29->mMorphingStartTime > 0.0)
    {
      double v31 = MRGetCurrentTime();
      double v29 = self->mInternal;
      double v30 = (v31 - v29->mMorphingStartTime) / v29->mMorphingDuration;
    }

    v29->double mMorphingProgress = v30;
    __int128 v32 = self->mInternal;
    double mMorphingProgress = v32->mMorphingProgress;
    if (mMorphingProgress <= 1.0)
    {
      v32->double mMorphingProgress = mMorphingProgress * (mMorphingProgress * (mMorphingProgress * -2.0 + 3.0));
    }

    else
    {
      -[MRRenderer _r_endMorphing](self, "_r_endMorphing");
      self->mInternal->double mMorphingProgress = 1.0;
    }

    unsigned int v23 = 1;
  }

  double v34 = self->mInternal;
  if (v34->mNeedsToSynchronizeTimeInLayers)
  {
    unsigned int v23 = 1;
    -[MRLayer setNeedsToSynchronizeTime:](self->mTopMRLayer, "setNeedsToSynchronizeTime:", 1LL);
    self->mInternal->mNeedsToSynchronizeTimeInLayers = 0;
    double v34 = self->mInternal;
  }

  if (v34->mNeedsToResumeOrPauseLayers)
  {
    -[MRLayerClock setParentIsPaused:]( -[MRLayer clock](self->mTopMRLayer, "clock"),  "setParentIsPaused:",  !self->mInternal->mInnerIsPlaying);
    self->mInternal->mNeedsToResumeOrPauseLayers = 0;
    unsigned int v23 = 1;
  }

  if ([a3 objectForKey:@"thumbnailPolicy"]) {
    id v35 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"thumbnailPolicy"), "intValue");
  }
  else {
    id v35 = (id)(2 * !self->_allowsThumbnails);
  }
  -[MRRenderArguments setThumbnailPolicy:](self->mInternal->mRenderArguments, "setThumbnailPolicy:", v35);
  -[MRRenderArguments setSkipsAnimations:]( self->mInternal->mRenderArguments,  "setSkipsAnimations:",  -[MRRenderArguments forcedState](self->mInternal->mRenderArguments, "forcedState") != 0LL);
  -[MRRenderer _unalteredTime](self, "_unalteredTime");
  -[MRRenderArguments setUnalteredTime:](self->mInternal->mRenderArguments, "setUnalteredTime:");
  id v36 = self->mInternal;
  double v37 = 0.0;
  if (v36->mMorphingDuration > 0.0) {
    double v37 = v36->mMorphingProgress;
  }
  -[MRRenderArguments setMorphingProgress:](v36->mRenderArguments, "setMorphingProgress:", v37);
  BOOL asynchronousOperationsAreSuspended = self->_asynchronousOperationsAreSuspended;
  self->_BOOL asynchronousOperationsAreSuspended = 0;
  -[MCMontage lock](self->mMontage, "lock");
  -[MCPlug fullDuration](-[MRLayer plug](self->mTopMRLayer, "plug"), "fullDuration");
  if (v25 >= v39)
  {
    -[MCPlug fullDuration](-[MRLayer plug](self->mTopMRLayer, "plug"), "fullDuration");
    double v25 = v43 - self->mTimeQuantum + 0.00001;
    uint64_t v40 = self->mInternal;
  }

  else
  {
    uint64_t v40 = self->mInternal;
    double mMasterDuration = v40->mMasterDuration;
    if (mMasterDuration > 0.0)
    {
      double v42 = mMasterDuration + v40->mMasterStartTime;
      if (v25 >= v42) {
        double v25 = v42 - self->mTimeQuantum + 0.00001;
      }
    }
  }

  if (v25 < 0.0) {
    double v25 = 0.0;
  }
  -[MRRenderArguments setDisplayLinkTimestamp:]( v40->mRenderArguments,  "setDisplayLinkTimestamp:",  self->mDisplayLinkTimestamp);
  do
  {
    unsigned int v44 = -[MRLayerParallelizer prerenderForTime:inContext:withArguments:]( self->mTopMRLayer,  "prerenderForTime:inContext:withArguments:",  self->mInternal->mContext,  self->mInternal->mRenderArguments,  v25);
    v23 |= MRIsAppleTV() | v44;
  }

  while (-[MRRenderer _doActions](self, "_doActions"));
  -[MCMontage unlock](self->mMontage, "unlock");
  id v45 = self->mInternal;
  if (!v45->mInnerIsPlaying
    || -[MRRenderArguments thumbnailPolicy](v45->mRenderArguments, "thumbnailPolicy")
    || (__int128 v46 = self->mInternal, v46->mSlideFocusState)
    || -[NSMutableDictionary count](v46->mGestureRecognizers, "count"))
  {
    self->_BOOL asynchronousOperationsAreSuspended = 0;
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id v47 = -[NSOperationQueue operations]( -[MRRenderArguments preloadQueue](self->mInternal->mRenderArguments, "preloadQueue"),  "operations");
  id v48 = -[NSArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v61,  v65,  16LL);
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v62;
    do
    {
      for (i = 0LL; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v62 != v50) {
          objc_enumerationMutation(v47);
        }
        if ([*(id *)(*((void *)&v61 + 1) + 8 * (void)i) queuePriority] == &dword_8) {
          self->_BOOL asynchronousOperationsAreSuspended = 0;
        }
      }

      id v49 = -[NSArray countByEnumeratingWithState:objects:count:]( v47,  "countByEnumeratingWithState:objects:count:",  &v61,  v65,  16LL);
    }

    while (v49);
  }

  if (asynchronousOperationsAreSuspended != self->_asynchronousOperationsAreSuspended)
  {
    -[NSOperationQueue setSuspended:]( -[MRRenderArguments preloadQueue](self->mInternal->mRenderArguments, "preloadQueue"),  "setSuspended:",  self->_asynchronousOperationsAreSuspended);
    -[MRAsynchronousOperationsDelegate setSuspended:]( self->mInternal->mAsynchronousOperationsDelegate,  "setSuspended:",  self->_asynchronousOperationsAreSuspended);
  }

  -[MRRenderArguments setForcedState:](self->mInternal->mRenderArguments, "setForcedState:", 0LL);
  -[MRRenderArguments setTimeWasSet:](self->mInternal->mRenderArguments, "setTimeWasSet:", 0LL);
  NSInteger v52 = -[NSConditionLock condition](self->mInternal->mSnapshotAsCGImageLock, "condition");
  v53 = self->mInternal;
  if (v52 == 1 || v53->mScreenBurnTest) {
    LOBYTE(v23) = 1;
  }
  if (self->mDisplaysTouchVisualFeedback)
  {
    LOBYTE(v23) = (-[NSMutableArray count](v53->mTouchesForVisualFeedback, "count") != 0LL) | v23;
    v53 = self->mInternal;
  }

  if (self->mDisplaysHitZonesVisualFeedback)
  {
    LOBYTE(v23) = (-[NSMutableArray count](v53->mHitZonesForVisualFeedback, "count") != 0LL) | v23;
    v53 = self->mInternal;
  }

  if (v53->mInnerIsPlaying) {
    -[MRRenderer processAudioObjects](self, "processAudioObjects");
  }
  if (v25 < self->_fadeInStartTime + self->_fadeInDuration || (v25 > self->_fadeOutStartTime) | v23 & 1)
  {
    char v54 = 1;
  }

  else
  {
    if (self->mInternal->mInnerIsPlaying && self->mDisplaysFPS) {
      -[MRRenderer _displayFPS:actuallyDisplay:](self, "_displayFPS:actuallyDisplay:", 0LL, MRGetCurrentTime());
    }
    char v54 = 0;
  }

  id v55 = self->mInternal;
  if (v55->mMorphingDuration > 0.0)
  {
    -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
    id v55 = self->mInternal;
  }

  if (!v55->mInnerIsPlaying || !self->mPushRendering)
  {
LABEL_119:
    objc_autoreleasePoolPop(v5);
    if ((v54 & 1) != 0) {
      return !self->_isFrozen;
    }
    return 0;
  }

  -[MCPlug fullDuration](-[MRLayer plug](self->mTopMRLayer, "plug"), "fullDuration");
  __int128 v57 = self->mInternal;
  double v58 = v57->mMasterDuration;
  if (v58 > 0.0)
  {
    double v59 = v58 + v57->mMasterStartTime;
    if (v59 < v56) {
      double v56 = v59;
    }
  }

  double v60 = self->mTimeQuantum;
  if (v25 + v60 >= v56)
  {
    -[MRRenderer _playbackIsOverWithTime:sendNotification:]( self,  "_playbackIsOverWithTime:sendNotification:",  v57->mMasterMode != 2,  v56 + v60);
    goto LABEL_119;
  }

  if ((v54 & 1) == 0)
  {
    if (v57->mShouldPauseWhenStill) {
      -[MRRenderer _r_pause](self, "_r_pause");
    }
LABEL_23:
    objc_autoreleasePoolPop(v5);
    return 0;
  }

  objc_autoreleasePoolPop(v5);
  return !self->_isFrozen;
}

- (void)render
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_3E998;
  v3[3] = &unk_24D5B0;
  v3[4] = self;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v3);
}

- (void)_r_render
{
  if (self->mIsCleanedUp) {
    return;
  }
  BOOL v3 = objc_autoreleasePoolPush();
  mInternal = self->mInternal;
  if (mInternal->mScreenBurnTest)
  {
    double v5 = (double)mInternal->mScreenBurnTestCurrentPass / 60.0;
  }

  else
  {
    -[MRRenderer _time](self, "_time");
    double v5 = v6 + 1.0e-10;
  }

  BOOL v7 = -[MRRenderer renderingDelegate](self, "renderingDelegate");
  double v8 = v7;
  if (v7)
  {
    if ((objc_opt_respondsToSelector(v7, "renderer:willRenderAtTime:") & 1) != 0) {
      -[MRRenderingDelegate renderer:willRenderAtTime:](v8, "renderer:willRenderAtTime:", self, v5);
    }
    if (self->mInternal->mMorphingDuration > 0.0
      && (objc_opt_respondsToSelector(v8, "isMorphingWithProgress:") & 1) != 0)
    {
      double mMorphingProgress = self->mInternal->mMorphingProgress;
      *(float *)&double mMorphingProgress = mMorphingProgress;
      -[MRRenderingDelegate isMorphingWithProgress:](v8, "isMorphingWithProgress:", mMorphingProgress);
    }
  }

  -[MRContext lock](self->mInternal->mContext, "lock");
  char v10 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  double v11 = v10;
  if (v10 != -[MRContext glContext](self->mInternal->mContext, "glContext")) {
    +[EAGLContext setCurrentContext:]( &OBJC_CLASS___EAGLContext,  "setCurrentContext:",  -[MRContext glContext](self->mInternal->mContext, "glContext"));
  }
  uint64_t v12 = self->mInternal;
  if (v12->mNeedsToResize)
  {
    pthread_setname_np( -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"MRRenderer %@: Render %dx%d",  self,  (int)self->mSize.width,  (int)self->mSize.height),  "UTF8String"));
    uint64_t v12 = self->mInternal;
  }

  else if (!v12->mNeedsToTemporaryResize)
  {
    goto LABEL_17;
  }

  v12->mNeedsToTemporaryResize = 0;
  self->mInternal->mNeedsToResize = 0;
  -[MRContext updateGeometry](self->mInternal->mContext, "updateGeometry");
  uint64_t v12 = self->mInternal;
LABEL_17:
  -[MRContext startFrame](v12->mContext, "startFrame");
  -[MRContext pixelSize](self->mInternal->mContext, "pixelSize");
  double v14 = v13;
  -[MRContext pixelSize](self->mInternal->mContext, "pixelSize");
  double v16 = v14 / v15;
  *(float *)&double v16 = v14 / v15;
  -[MRContext setLocalAspectRatio:](self->mInternal->mContext, "setLocalAspectRatio:", v16);
  id v17 = self->mInternal;
  if (!v17->mScreenBurnTest)
  {
    -[MRLayer renderAtTime:inContext:withArguments:]( self->mTopMRLayer,  "renderAtTime:inContext:withArguments:",  v17->mContext,  v17->mRenderArguments,  v5);
    if (self->mInternal->mMorphingDuration > 0.0) {
      -[MRRenderer _r_renderRotation](self, "_r_renderRotation");
    }
    double fadeInDuration = self->_fadeInDuration;
    double v19 = self->_fadeInStartTime + fadeInDuration;
    double fadeOutStartTime = self->_fadeOutStartTime;
    if (v5 >= v19 && v5 <= fadeOutStartTime) {
      goto LABEL_32;
    }
    if (v5 <= fadeOutStartTime)
    {
      double v22 = 1.0;
      if (fadeInDuration > 0.0)
      {
        double v23 = v19 - v5;
        goto LABEL_30;
      }
    }

    else
    {
      double fadeInDuration = self->_fadeOutDuration;
      double v22 = 1.0;
      if (fadeInDuration > 0.0)
      {
        double v23 = v5 - fadeOutStartTime;
LABEL_30:
        double v22 = v23 / fadeInDuration;
      }
    }

    -[MRContext setShader:](self->mInternal->mContext, "setShader:", @"PlainColor");
    *(float *)&double v24 = v22;
    LODWORD(v25) = 0;
    LODWORD(v26) = 0;
    LODWORD(v27) = 0;
    -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( self->mInternal->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  v29,  v25,  v26,  v27,  v24);
    -[MRContext blend:](self->mInternal->mContext, "blend:", 3LL);
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  0LL,  self->mInternal->mContext,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
    -[MRContext blend:](self->mInternal->mContext, "blend:", 0LL);
    -[MRContext restoreForeColor:](self->mInternal->mContext, "restoreForeColor:", v29);
    -[MRContext unsetShader](self->mInternal->mContext, "unsetShader");
    goto LABEL_32;
  }

  -[MRRenderer _r_renderForScreenBurnTestAtTime:](self, "_r_renderForScreenBurnTestAtTime:", v5);
LABEL_32:
  if (-[NSConditionLock tryLockWhenCondition:](self->mInternal->mSnapshotAsCGImageLock, "tryLockWhenCondition:", 1LL))
  {
    -[MRRenderer _r_doSnapshot](self, "_r_doSnapshot");
    -[NSConditionLock unlockWithCondition:](self->mInternal->mSnapshotAsCGImageLock, "unlockWithCondition:", 0LL);
  }

  if (self->mDisplaysTouchVisualFeedback) {
    -[MRRenderer _displayTouchVisualFeedback](self, "_displayTouchVisualFeedback");
  }
  if (self->mDisplaysHitZonesVisualFeedback) {
    -[MRRenderer _displayHitZonesVisualFeedback](self, "_displayHitZonesVisualFeedback");
  }
  if (self->mInternal->mInnerIsPlaying && self->mDisplaysFPS) {
    -[MRRenderer _displayFPS:actuallyDisplay:](self, "_displayFPS:actuallyDisplay:", 1LL, MRGetCurrentTime());
  }
  if (self->mDisplaysPlayingIDs) {
    -[MRRenderer _displayPlayingIDs](self, "_displayPlayingIDs");
  }
  uint64_t v28 = self->mInternal;
  if (self->mDisplaysIsPreloadingImages)
  {
    if (v28->mCountOfPreloadingImages
      || -[NSOperationQueue isSuspended]( -[MRRenderArguments preloadQueue](v28->mRenderArguments, "preloadQueue"),  "isSuspended")
      || (uint64_t v28 = self->mInternal, v28->mIsStalled))
    {
      -[MRRenderer _displayIsPreloadingImages](self, "_displayIsPreloadingImages");
      uint64_t v28 = self->mInternal;
    }
  }

  -[MRContext flush](v28->mContext, "flush");
  self->_timestampOfLastRenderPass = MRGetCurrentTime();
  if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v10) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v10);
  }

  -[MRContext unlock](self->mInternal->mContext, "unlock");
  -[MRContext purgeResources:](self->mInternal->mContext, "purgeResources:", 0LL);
  if ((char *)-[NSConditionLock condition](self->mInternal->mFrameLock, "condition") == (char *)&dword_0 + 1)
  {
    -[NSConditionLock lock](self->mInternal->mFrameLock, "lock");
    -[NSConditionLock unlockWithCondition:](self->mInternal->mFrameLock, "unlockWithCondition:", 0LL);
  }

  if (v8)
  {
    if ((objc_opt_respondsToSelector(v8, "renderer:didRenderAtTime:") & 1) != 0) {
      -[MRRenderingDelegate renderer:didRenderAtTime:](v8, "renderer:didRenderAtTime:", self, v5);
    }
  }

  self->_lastRenderedTime = v5;
  objc_autoreleasePoolPop(v3);
}

- (void)_r_renderWithPassParameters:(id)a3
{
  if (-[MRRenderer _r_prerenderWithPassParameters:](self, "_r_prerenderWithPassParameters:", a3))
  {
    -[MRRenderer _r_render](self, "_r_render");
  }

  else
  {
    char v4 = -[MRRenderer renderingDelegate](self, "renderingDelegate");
    if (v4)
    {
      double v5 = v4;
      -[MRRenderer _time](self, "_time");
      double v7 = v6 + 1.0e-10;
      if ((objc_opt_respondsToSelector(v5, "renderer:willRenderAtTime:") & 1) != 0) {
        -[MRRenderingDelegate renderer:willRenderAtTime:](v5, "renderer:willRenderAtTime:", self, v7);
      }
      if ((objc_opt_respondsToSelector(v5, "renderer:didRenderAtTime:") & 1) != 0) {
        -[MRRenderingDelegate renderer:didRenderAtTime:](v5, "renderer:didRenderAtTime:", self, v7);
      }
    }
  }

- (void)_r_renderRotation
{
  mInternal = self->mInternal;
  mSnapshotForMorphing = mInternal->mSnapshotForMorphing;
  if (mSnapshotForMorphing)
  {
    double mMorphingStartTime = mInternal->mMorphingStartTime;
    if (mInternal->mMorphingHandlesRotation)
    {
      if (mMorphingStartTime < 0.0)
      {
        self->mInternal->double mMorphingStartTime = MRGetCurrentTime();
        mSnapshotForMorphing = self->mInternal->mSnapshotForMorphing;
      }

      uint64_t v52 = 0LL;
      uint64_t v54 = 0LL;
      __int128 v53 = xmmword_1F6840;
      uint64_t v55 = 0x400921FB54442D18LL;
      double v6 = *((double *)&v52 + self->mOrientation);
      -[MRImage rotationAngle](mSnapshotForMorphing, "rotationAngle");
      float v8 = v6 - v7;
      MRMatrix_SetRotationFromAnglesXYZRad((uint64_t)v57, 0.0, 0.0, v8);
      v57[self->mOrientation < 3u] = vnegq_f32(v57[self->mOrientation < 3u]);
      -[MRContext composeModelViewMatrix:saveTo:](self->mInternal->mContext, "composeModelViewMatrix:saveTo:", v57, v56);
      double v9 = self->mInternal;
      double v10 = 1.0 - v9->mMorphingProgress;
      *(float *)&double v11 = v10;
      LODWORD(v10) = 1.0;
      LODWORD(v12) = 1.0;
      LODWORD(v13) = 1.0;
      -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( v9->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  v51,  v10,  v12,  v13,  v11);
      -[MRContext blend:](self->mInternal->mContext, "blend:", 3LL);
      -[MRContext setShader:](self->mInternal->mContext, "setShader:", @"PlainTexture");
      double y = CGPointZero.y;
      -[MRImage scale](self->mInternal->mSnapshotForMorphing, "scale");
      double v15 = self->mInternal->mSnapshotForMorphing;
      if (v16 == 1.0)
      {
        -[MRImage width](v15, "width");
        double v18 = (v50 + v50) / self->mSize.width;
        -[MRImage height](self->mInternal->mSnapshotForMorphing, "height");
      }

      else
      {
        -[MRImage height](v15, "height");
        double v18 = (v17 + v17) / self->mSize.width;
        -[MRImage width](self->mInternal->mSnapshotForMorphing, "width");
      }

      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  self->mInternal->mSnapshotForMorphing,  self->mInternal->mContext,  CGPointZero.x,  y,  v18,  (v19 + v19) / self->mSize.height);
      -[MRContext unsetShader](self->mInternal->mContext, "unsetShader");
      -[MRContext blend:](self->mInternal->mContext, "blend:", 0LL);
      mContext = self->mInternal->mContext;
      id v49 = (uint64_t *)v51;
    }

    else
    {
      if (mMorphingStartTime < 0.0)
      {
        self->mInternal->double mMorphingStartTime = MRGetCurrentTime();
        mSnapshotForMorphing = self->mInternal->mSnapshotForMorphing;
      }

      double width = self->mSize.width;
      -[MRImage width](mSnapshotForMorphing, "width");
      if (width >= v31) {
        double v32 = width;
      }
      else {
        double v32 = v31;
      }
      double height = self->mSize.height;
      -[MRImage height](self->mInternal->mSnapshotForMorphing, "height");
      if (height >= v34) {
        double v35 = height;
      }
      else {
        double v35 = v34;
      }
      MRMatrix_SetDiagonal((uint64_t)v57, 1.0, -1.0, 1.0);
      -[MRContext composeModelViewMatrix:saveTo:](self->mInternal->mContext, "composeModelViewMatrix:saveTo:", v57, v56);
      id v36 = self->mInternal;
      double v37 = 1.0;
      double v38 = 1.0 - v36->mMorphingProgress;
      *(float *)&double v39 = v38;
      LODWORD(v38) = 1.0;
      LODWORD(v37) = 1.0;
      LODWORD(v40) = 1.0;
      -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( v36->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  &v52,  v38,  v37,  v40,  v39);
      -[MRContext blend:](self->mInternal->mContext, "blend:", 3LL);
      -[MRContext setShader:](self->mInternal->mContext, "setShader:", @"PlainTexture");
      -[MRImage width](self->mInternal->mSnapshotForMorphing, "width");
      double v42 = (v41 - v32) / v32;
      -[MRImage height](self->mInternal->mSnapshotForMorphing, "height");
      double v44 = (v43 - v35) / v35;
      -[MRImage width](self->mInternal->mSnapshotForMorphing, "width");
      double v46 = (v45 + v45) / v32;
      -[MRImage height](self->mInternal->mSnapshotForMorphing, "height");
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  self->mInternal->mSnapshotForMorphing,  self->mInternal->mContext,  v42,  v44,  v46,  (v47 + v47) / v35);
      -[MRContext unsetShader](self->mInternal->mContext, "unsetShader");
      -[MRContext blend:](self->mInternal->mContext, "blend:", 0LL);
      mContext = self->mInternal->mContext;
      id v49 = &v52;
    }

    -[MRContext restoreForeColor:](mContext, "restoreForeColor:", v49);
    -[MRContext restoreModelViewMatrix:](self->mInternal->mContext, "restoreModelViewMatrix:", v56);
  }

  else
  {
    uint64_t v20 = 14LL;
    uint64_t v21 = 3LL;
    else {
      uint64_t v22 = 4LL;
    }
    if ((self->mOrientation - 3) < 2)
    {
      uint64_t v23 = 13LL;
    }

    else
    {
      uint64_t v21 = 4LL;
      uint64_t v23 = 14LL;
    }

    Class v24 = (&self->super.isa)[v21];
    Class v25 = (&self->super.isa)[v22];
    double v26 = *(double *)&(&mInternal->super.isa)[v20];
    double v27 = *(double *)&(&mInternal->super.isa)[v23];
    self->mInternal->mSnapshotForMorphing = (MRImage *)-[MRImageManager retainedByUserImageWithSize:andColor:]( -[MRContext imageManager](mInternal->mContext, "imageManager"),  "retainedByUserImageWithSize:andColor:",  0LL,  *(double *)&v24,  *(double *)&v25);
    -[MRImage setLabel:](self->mInternal->mSnapshotForMorphing, "setLabel:", @"Marimba SnapshotForMorphing");
    -[MRContext snapshotWithTextureName:offset:size:]( self->mInternal->mContext,  "snapshotWithTextureName:offset:size:",  -[MRTexture textureName](-[MRImage texture](self->mInternal->mSnapshotForMorphing, "texture"), "textureName"),  v27,  v26,  *(double *)&v24,  *(double *)&v25);
    uint64_t v28 = self->mInternal;
    if (v28->mMorphingHandlesRotation)
    {
      int mOrientation = self->mOrientation;
      if ((mOrientation - 1) >= 2)
      {
        if (mOrientation == 3) {
          -[MRImage setRotationAngle:](v28->mSnapshotForMorphing, "setRotationAngle:", 3.14159265);
        }
      }

      else
      {
        -[MRImage setRotationAngle:]( v28->mSnapshotForMorphing,  "setRotationAngle:",  *((double *)&xmmword_1F6850 + (mOrientation == 1)));
        -[MRImage setScale:](self->mInternal->mSnapshotForMorphing, "setScale:", *(double *)&v24 / *(double *)&v25);
      }
    }
  }

- (void)_r_snapshotForRotation
{
  mInternal = self->mInternal;
  uint64_t v4 = 14LL;
  uint64_t v5 = 3LL;
  else {
    uint64_t v6 = 4LL;
  }
  if ((self->mOrientation - 3) < 2)
  {
    uint64_t v7 = 13LL;
  }

  else
  {
    uint64_t v5 = 4LL;
    uint64_t v7 = 14LL;
  }

  Class v8 = (&self->super.isa)[v5];
  Class v9 = (&self->super.isa)[v6];
  double v10 = *(double *)&(&mInternal->super.isa)[v4];
  double v11 = *(double *)&(&mInternal->super.isa)[v7];
  self->mInternal->mSnapshotForMorphing = (MRImage *)-[MRImageManager retainedByUserImageWithSize:andColor:]( -[MRContext imageManager](mInternal->mContext, "imageManager"),  "retainedByUserImageWithSize:andColor:",  0LL,  *(double *)&v8,  *(double *)&v9);
  -[MRImage setLabel:](self->mInternal->mSnapshotForMorphing, "setLabel:", @"Marimba SnapshotForMorphing");
  -[MRContext snapshotWithTextureName:offset:size:]( self->mInternal->mContext,  "snapshotWithTextureName:offset:size:",  -[MRTexture textureName](-[MRImage texture](self->mInternal->mSnapshotForMorphing, "texture"), "textureName"),  v11,  v10,  *(double *)&v8,  *(double *)&v9);
  double v12 = self->mInternal;
  if (v12->mMorphingHandlesRotation)
  {
    int mOrientation = self->mOrientation;
    if ((mOrientation - 1) >= 2)
    {
      if (mOrientation == 3) {
        -[MRImage setRotationAngle:](v12->mSnapshotForMorphing, "setRotationAngle:", 3.14159265);
      }
    }

    else
    {
      -[MRImage setRotationAngle:]( v12->mSnapshotForMorphing,  "setRotationAngle:",  *((double *)&xmmword_1F6850 + (mOrientation == 1)));
      -[MRImage setScale:](self->mInternal->mSnapshotForMorphing, "setScale:", *(double *)&v8 / *(double *)&v9);
    }
  }

- (void)_r_renderForScreenBurnTestAtTime:(double)a3
{
  if (!self->mIsCleanedUp)
  {
    id v4 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:]( self->mTopMRLayer,  "retainedByUserRenderedImageAtTime:inContext:withArguments:",  self->mInternal->mContext,  self->mInternal->mRenderArguments,  a3);
    mInternal = self->mInternal;
    if (__ROR8__(0x8F5C28F5C28F5C29LL * mInternal->mScreenBurnTestCurrentPass, 2) <= 0x28F5C28F5C28F5CuLL)
    {
      NSLog(@"Pass %lld", mInternal->mScreenBurnTestCurrentPass);
      mInternal = self->mInternal;
    }

    v33[0] = 0LL;
    v33[1] = 0LL;
    if (!mInternal->mScreenBurnTestAccumulationImage1)
    {
      self->mInternal->mScreenBurnTestAccumulationImage1 = (MRImage *)-[MRImageManager retainedByUserImageWithSize:andColor:]( -[MRContext imageManager]( mInternal->mContext,  "imageManager"),  "retainedByUserImageWithSize:andColor:",  v33,  self->mSize.width,  self->mSize.height);
      mInternal = self->mInternal;
    }

    if (!mInternal->mScreenBurnTestAccumulationImage2)
    {
      self->mInternal->mScreenBurnTestAccumulationImage2 = (MRImage *)-[MRImageManager retainedByUserImageWithSize:andColor:]( -[MRContext imageManager]( mInternal->mContext,  "imageManager"),  "retainedByUserImageWithSize:andColor:",  v33,  self->mSize.width,  self->mSize.height);
      mInternal = self->mInternal;
    }

    uint64_t v6 = 52LL;
    if ((mInternal->mScreenBurnTestCurrentPass & 1) != 0) {
      uint64_t v7 = 52LL;
    }
    else {
      uint64_t v7 = 51LL;
    }
    Class v8 = (&mInternal->super.isa)[v7];
    if ((mInternal->mScreenBurnTestCurrentPass & 1) != 0) {
      uint64_t v6 = 51LL;
    }
    Class v9 = (&mInternal->super.isa)[v6];
    id v10 = -[MRContext initLocalWithContext:glContext:andSize:]( objc_alloc(&OBJC_CLASS___MRContext),  "initLocalWithContext:glContext:andSize:",  self->mInternal->mContext,  -[objc_class updateGLContext](v8, "updateGLContext"),  self->mSize.width,  self->mSize.height);
    double v11 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
    double v12 = v11;
    if (v11 != [v10 glContext]) {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [v10 glContext]);
    }
    [v10 aspectRatio];
    objc_msgSend(v10, "setImage:onTextureUnit:withReferenceAspectRatio:state:", v4, 0, &v30);
    -[objc_class setFiltersNearest:](v9, "setFiltersNearest:", 1LL);
    [v10 aspectRatio];
    objc_msgSend(v10, "setImage:onTextureUnit:withReferenceAspectRatio:state:", v9, 1, &v29);
    [v10 setShader:@"ScreenBurnTest"];
    v31[0] = xmmword_1F68A0;
    v31[1] = unk_1F68B0;
    [v10 setTextureCoordinatesPointer:v31 onTextureUnit:0];
    [v10 setTextureCoordinatesPointer:v31 onTextureUnit:1];
    [v10 aspectRatio];
    v32[0] = -1082130432;
    float v14 = 1.0 / v13;
    *(float *)&v32[1] = -v14;
    v32[2] = -1082130432;
    *(float *)&v32[3] = v14;
    v32[4] = 1065353216;
    *(float *)&void v32[5] = -v14;
    v32[6] = 1065353216;
    *(float *)&v32[7] = v14;
    [v10 setVertex2DPointer:v32];
    [v10 drawTriangleStripFromOffset:0 count:4];
    [v10 unsetVertexPointer];
    [v10 unsetTextureCoordinatesPointerOnTextureUnit:1];
    [v10 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [v10 unsetShader];
    [v10 unsetImage:v9 onTextureUnit:1 state:&v29];
    [v10 unsetImage:v4 onTextureUnit:0 state:&v30];
    [v10 flush];
    [v10 cleanup];
    if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v11) {
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v11);
    }

    [v4 releaseByUser];
    double v15 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
    double v16 = v15;
    if (v15 != -[MRContext glContext](self->mInternal->mContext, "glContext")) {
      +[EAGLContext setCurrentContext:]( &OBJC_CLASS___EAGLContext,  "setCurrentContext:",  -[MRContext glContext](self->mInternal->mContext, "glContext"));
    }
    -[MRContext setModelViewMatrix:saveTo:]( self->mInternal->mContext,  "setModelViewMatrix:saveTo:",  MRMatrix_Identity(),  v31);
    LODWORD(v17) = 1.0;
    LODWORD(v18) = 1.0;
    LODWORD(v19) = 1.0;
    LODWORD(v20) = 1.0;
    -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( self->mInternal->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  0LL,  v17,  v18,  v19,  v20);
    LODWORD(v21) = 0;
    LODWORD(v22) = 0;
    LODWORD(v23) = 0;
    LODWORD(v24) = 1.0;
    -[MRContext setBackColorRed:green:blue:alpha:saveTo:]( self->mInternal->mContext,  "setBackColorRed:green:blue:alpha:saveTo:",  0LL,  v21,  v22,  v23,  v24);
    -[MRContext clear:](self->mInternal->mContext, "clear:", 1LL);
    -[MRContext setShader:](self->mInternal->mContext, "setShader:", @"ScreenBurnTest2");
    Class v25 = self->mInternal;
    mContext = v25->mContext;
    uint64_t v27 = v25->mScreenBurnTestCurrentPass + 1;
    v25->mScreenBurnTestCurrentPass = v27;
    double v28 = 1.0 / (double)(unint64_t)v27;
    *(float *)&double v28 = v28;
    -[MRContext setShaderUniformFloat:forKey:](mContext, "setShaderUniformFloat:forKey:", @"factor", v28);
    -[objc_class setFiltersNearest:](v8, "setFiltersNearest:", 1LL);
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderDumbImage:inContext:atPosition:andSize:",  v8,  self->mInternal->mContext,  CGPointZero.x,  CGPointZero.y,  2.0,  2.0);
    -[MRContext unsetShader](self->mInternal->mContext, "unsetShader");
    -[MRContext restoreModelViewMatrix:](self->mInternal->mContext, "restoreModelViewMatrix:", v31);
    if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v15) {
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v15);
    }
  }

- (void)_r_doSnapshot
{
  if (!self->mIsCleanedUp)
  {
    size_t v3 = (unint64_t)(self->mSize.width * 4.0 * self->mSize.height);
    id v4 = malloc(v3);
    glPixelStorei(0xD05u, 4);
    glReadPixels(0, 0, (int)self->mSize.width, (int)self->mSize.height, 0x1908u, 0x1401u, v4);
    glFinish();
    uint64_t v5 = CGDataProviderCreateWithData(0LL, v4, v3, (CGDataProviderReleaseDataCallback)MyCGImageBufferReleaseCallback);
    self->mInternal->mSnapshotAsCGImage = CGImageCreate( (unint64_t)self->mSize.width,  (unint64_t)self->mSize.height,  8uLL,  0x20uLL,  vcvtd_n_u64_f64(self->mSize.width, 2uLL),  -[MRContext colorSpace](self->mInternal->mContext, "colorSpace"),  1u,  v5,  0LL,  0,  kCGRenderingIntentDefault);
    CGDataProviderRelease(v5);
  }

- (void)freeze
{
  self->_isFrozen = 1;
}

- (void)unfreeze
{
  self->_isFrozen = 0;
}

- (void)stepForward
{
}

- (void)stepBackward
{
}

- (void)goBack
{
  if (-[NSMutableArray count](self->mInternal->mNavigatorHistoryBack, "count"))
  {
    do
    {
      id v3 = -[NSMutableArray lastObject](self->mInternal->mNavigatorHistoryBack, "lastObject");
      -[NSMutableArray removeLastObject](self->mInternal->mNavigatorHistoryBack, "removeLastObject");
    }

    while (-[NSMutableArray count](self->mInternal->mNavigatorHistoryBack, "count"));
    if (v3) {
      -[MRRenderer sendMCAction:fromSender:]( self,  "sendMCAction:fromSender:",  +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:]( &OBJC_CLASS___MCGenericAction,  "genericActionForTargetPlugObjectID:withAttributes:",  0LL,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"goBack",  @"type")),  self);
    }
  }

- (void)goForth
{
  if (-[NSMutableArray count](self->mInternal->mNavigatorHistoryForth, "count"))
  {
    do
    {
      id v3 = -[NSMutableArray lastObject](self->mInternal->mNavigatorHistoryForth, "lastObject");
      -[NSMutableArray removeLastObject](self->mInternal->mNavigatorHistoryForth, "removeLastObject");
    }

    while (-[NSMutableArray count](self->mInternal->mNavigatorHistoryForth, "count"));
    if (v3) {
      -[MRRenderer sendMCAction:fromSender:]( self,  "sendMCAction:fromSender:",  +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:]( &OBJC_CLASS___MCGenericAction,  "genericActionForTargetPlugObjectID:withAttributes:",  0LL,  +[NSDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObject:forKey:",  @"goForth",  @"type")),  self);
    }
  }

- (BOOL)canGoBack
{
  return -[NSMutableArray count](self->mInternal->mNavigatorHistoryBack, "count") != 0LL;
}

- (BOOL)canGoForth
{
  return -[NSMutableArray count](self->mInternal->mNavigatorHistoryForth, "count") != 0LL;
}

- (void)addNavigatorToBackHistory:(id)a3
{
  mNavigatorHistoryBack = self->mInternal->mNavigatorHistoryBack;
  if (!mNavigatorHistoryBack)
  {
    self->mInternal->mNavigatorHistoryBack = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mNavigatorHistoryBack = self->mInternal->mNavigatorHistoryBack;
  }

  -[NSMutableArray addObject:](mNavigatorHistoryBack, "addObject:", a3);
}

- (void)addNavigatorToForthHistory:(id)a3
{
  mNavigatorHistoryForth = self->mInternal->mNavigatorHistoryForth;
  if (!mNavigatorHistoryForth)
  {
    self->mInternal->mNavigatorHistoryForth = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mNavigatorHistoryForth = self->mInternal->mNavigatorHistoryForth;
  }

  -[NSMutableArray addObject:](mNavigatorHistoryForth, "addObject:", a3);
}

- (void)removeNavigatorFromBackHistory:(id)a3
{
}

- (void)removeNavigatorFromForthHistory:(id)a3
{
}

- (void)moveNavigatorFromBackToForthHistory:(id)a3
{
  mNavigatorHistoryForth = self->mInternal->mNavigatorHistoryForth;
  if (!mNavigatorHistoryForth)
  {
    self->mInternal->mNavigatorHistoryForth = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mNavigatorHistoryForth = self->mInternal->mNavigatorHistoryForth;
  }

  -[NSMutableArray addObject:](mNavigatorHistoryForth, "addObject:", a3);
  uint64_t v6 = (char *)-[NSMutableArray count](self->mInternal->mNavigatorHistoryBack, "count");
  while ((uint64_t)--v6 >= 0)
  {
    if (-[NSMutableArray objectAtIndex:](self->mInternal->mNavigatorHistoryBack, "objectAtIndex:", v6) == a3)
    {
      -[NSMutableArray removeObjectAtIndex:](self->mInternal->mNavigatorHistoryBack, "removeObjectAtIndex:", v6);
      return;
    }
  }

  NSLog(@"Consistency error: can't move '%@' from back history", a3);
}

- (void)moveNavigatorFromForthToBackHistory:(id)a3
{
  mNavigatorHistoryBack = self->mInternal->mNavigatorHistoryBack;
  if (!mNavigatorHistoryBack)
  {
    self->mInternal->mNavigatorHistoryBack = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    mNavigatorHistoryBack = self->mInternal->mNavigatorHistoryBack;
  }

  -[NSMutableArray addObject:](mNavigatorHistoryBack, "addObject:", a3);
  uint64_t v6 = (char *)-[NSMutableArray count](self->mInternal->mNavigatorHistoryForth, "count");
  while ((uint64_t)--v6 >= 0)
  {
    if (-[NSMutableArray objectAtIndex:](self->mInternal->mNavigatorHistoryForth, "objectAtIndex:", v6) == a3)
    {
      -[NSMutableArray removeObjectAtIndex:](self->mInternal->mNavigatorHistoryForth, "removeObjectAtIndex:", v6);
      return;
    }
  }

  NSLog(@"Consistency error: can't move '%@' from forth history", a3);
}

- (void)setUsesExternalDisplayLink:(BOOL)a3
{
  self->mInternal->mUsesExternalDisplayLink = a3;
}

- (double)time
{
  mInternal = self->mInternal;
  if (mInternal->mTimeSyncRequestCount >= 1) {
    return mInternal->mOuterTime;
  }
  -[MRRenderer _time](self, "_time");
  return result;
}

- (void)setTime:(double)a3
{
  self->mInternal->mOuterTime = a3;
  p_mTimeSyncRequestCount = &self->mInternal->mTimeSyncRequestCount;
  do
    unsigned int v4 = __ldaxr((unsigned int *)p_mTimeSyncRequestCount);
  while (__stlxr(v4 + 1, (unsigned int *)p_mTimeSyncRequestCount));
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v6[0] = (void (*)(void))_NSConcreteStackBlock;
  v6[1] = (void (*)(void))3221225472LL;
  v6[2] = (void (*)(void))sub_3FFD0;
  v6[3] = (void (*)(void))&unk_24D5B0;
  v6[4] = (void (*)(void))self;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v6);
}

- (double)_time
{
  mInternal = self->mInternal;
  if (mInternal->mInnerIsPlaying)
  {
    -[MRRenderer masterClock](self, "masterClock");
    unsigned int v4 = self->mInternal;
    double result = vabdd_f64(v5, v4->mTimeOffset);
    if (self->mDisplayLinkTimestamp >= 0.0)
    {
      double mTimeQuantum = self->mTimeQuantum;
      if (mTimeQuantum > 0.0) {
        double result = mTimeQuantum * floor((result + mTimeQuantum * 0.1) / mTimeQuantum);
      }
    }

    double mMasterDuration = v4->mMasterDuration;
    if (mMasterDuration > 0.0)
    {
      double mMasterStartTime = v4->mMasterStartTime;
      if (result > mMasterStartTime)
      {
        if (v4->mMasterMode == 1)
        {
          return mMasterStartTime + fmod(result - mMasterStartTime, mMasterDuration);
        }

        else
        {
          double v11 = mMasterDuration + mMasterStartTime;
          if (result >= v11) {
            return v11;
          }
        }
      }
    }
  }

  else
  {
    double v10 = self->mTimeQuantum;
    double result = mInternal->mTimeOffset;
    if (v10 > 0.0) {
      return v10 * floor((result + 0.0000001) / v10);
    }
  }

  return result;
}

- (void)_r_syncTimeToOuter
{
  if (!self->mIsCleanedUp)
  {
    -[MRRenderer _r_setTime:isResyncing:](self, "_r_setTime:isResyncing:", 0LL, self->mInternal->mOuterTime);
    p_mTimeSyncRequestCount = &self->mInternal->mTimeSyncRequestCount;
    do
      unsigned int v4 = __ldxr((unsigned int *)p_mTimeSyncRequestCount);
    while (__stxr(v4 - 1, (unsigned int *)p_mTimeSyncRequestCount));
    if (self->mRequestRenderingOnChanges) {
      -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
    }
  }

- (void)_r_setTime:(double)a3 isResyncing:(BOOL)a4
{
  if (!self->mIsCleanedUp)
  {
    mInternal = self->mInternal;
    if (mInternal->mInnerIsPlaying)
    {
      -[MRRenderer masterClock](self, "masterClock");
      a3 = v8 - a3;
      mInternal = self->mInternal;
    }

    mInternal->double mTimeOffset = a3;
    Class v9 = self->mInternal;
    if (v9->mTimeOffset < 0.0) {
      v9->double mTimeOffset = 0.0;
    }
    if (!a4)
    {
      self->mInternal->mUnalteredTimeOffset = self->mInternal->mTimeOffset;
      self->mInternal->mNeedsToSynchronizeTimeInAudioMovies = 1;
      self->mInternal->mNeedsToSynchronizeTimeInLayers = 1;
      -[MRRenderArguments setTimeWasSet:](self->mInternal->mRenderArguments, "setTimeWasSet:", 1LL);
    }
  }

- (double)_unalteredTime
{
  mInternal = self->mInternal;
  if (mInternal->mInnerIsPlaying)
  {
    -[MRRenderer masterClock](self, "masterClock");
    unsigned int v4 = self->mInternal;
    double result = vabdd_f64(v5, v4->mUnalteredTimeOffset);
    if (self->mDisplayLinkTimestamp >= 0.0)
    {
      double mTimeQuantum = self->mTimeQuantum;
      if (mTimeQuantum > 0.0) {
        double result = mTimeQuantum * floor((result + mTimeQuantum * 0.1) / mTimeQuantum);
      }
    }

    double mMasterDuration = v4->mMasterDuration;
    if (mMasterDuration > 0.0)
    {
      double mMasterStartTime = v4->mMasterStartTime;
      if (result > mMasterStartTime)
      {
        if (v4->mMasterMode == 1)
        {
          return mMasterStartTime + fmod(result - mMasterStartTime, mMasterDuration);
        }

        else
        {
          double v11 = mMasterDuration + mMasterStartTime;
          if (result >= v11) {
            return v11;
          }
        }
      }
    }
  }

  else
  {
    double v10 = self->mTimeQuantum;
    double result = mInternal->mUnalteredTimeOffset;
    if (v10 > 0.0) {
      return v10 * floor((result + 0.0000001) / v10);
    }
  }

  return result;
}

- (void)setTimeQuantum:(double)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v4[0] = (void (*)(void))_NSConcreteStackBlock;
  v4[1] = (void (*)(void))3221225472LL;
  v4[2] = (void (*)(void))sub_40308;
  v4[3] = (void (*)(void))&unk_24D3B8;
  v4[4] = (void (*)(void))self;
  void v4[5] = *(void (**)(void))&a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v4);
}

- (void)setSize:(CGSize)a3
{
  double v3 = ceil(a3.width);
  double v4 = ceil(a3.height);
  if (v3 != self->mSize.width || v4 != self->mSize.height)
  {
    mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
    v8[0] = (void (*)(void))_NSConcreteStackBlock;
    v8[1] = (void (*)(void))3221225472LL;
    v8[2] = sub_403D8;
    v8[3] = (void (*)(void))&unk_24DA58;
    v8[4] = (void (*)(void))self;
    v8[5] = *(void (**)(void))&v3;
    v8[6] = *(void (**)(void))&v4;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v8);
    if (self->mRequestRenderingOnChanges) {
      -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
    }
  }

- (void)setTemporarySize:(CGSize)a3
{
  double v3 = ceil(a3.width);
  double v4 = ceil(a3.height);
  mInternal = self->mInternal;
  if (v3 != mInternal->mTemporarySize.width || v4 != mInternal->mTemporarySize.height)
  {
    mRenderDispatchQueue = (dispatch_queue_s *)mInternal->mRenderDispatchQueue;
    v9[0] = (void (*)(void))_NSConcreteStackBlock;
    v9[1] = (void (*)(void))3221225472LL;
    v9[2] = (void (*)(void))sub_406B8;
    v9[3] = (void (*)(void))&unk_24DA58;
    v9[4] = (void (*)(void))self;
    v9[5] = *(void (**)(void))&v3;
    v9[6] = *(void (**)(void))&v4;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v9);
    if (self->mRequestRenderingOnChanges) {
      -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
    }
  }

- (CGPoint)contextOffset
{
  mInternal = self->mInternal;
  double x = mInternal->mContextOffset.x;
  double y = mInternal->mContextOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContextOffset:(CGPoint)a3
{
  mInternal = self->mInternal;
  BOOL v4 = a3.x == mInternal->mContextOffset.x && a3.y == mInternal->mContextOffset.y;
  if (!v4 && mInternal->mContext)
  {
    mRenderDispatchQueue = (dispatch_queue_s *)mInternal->mRenderDispatchQueue;
    v7[0] = (void (*)(void))_NSConcreteStackBlock;
    v7[1] = (void (*)(void))3221225472LL;
    v7[2] = (void (*)(void))sub_40788;
    v7[3] = (void (*)(void))&unk_24DA58;
    v7[4] = (void (*)(void))self;
    CGPoint v8 = a3;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v7);
    if (self->mRequestRenderingOnChanges) {
      -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
    }
  }

- (int)orientation
{
  return self->mOrientation;
}

- (void)setOrientation:(int)a3
{
  if (self->mOrientation != a3)
  {
    mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
    v5[0] = (void (*)(void))_NSConcreteStackBlock;
    v5[1] = (void (*)(void))3221225472LL;
    v5[2] = (void (*)(void))sub_40848;
    v5[3] = (void (*)(void))&unk_24DA80;
    v5[4] = (void (*)(void))self;
    int v6 = a3;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v5);
    if (self->mRequestRenderingOnChanges) {
      -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
    }
  }

- (void)resetFadeInAndOut
{
  self->_fadeInStartTime = 0.0;
  -[MCMontage fadeInDuration](self->mMontage, "fadeInDuration");
  self->_double fadeInDuration = v3;
  -[MCMontage fadeOutDuration](self->mMontage, "fadeOutDuration");
  self->_fadeOutDuration = v4;
  -[MCPlug fullDuration](-[MCMontage rootPlug](self->mMontage, "rootPlug"), "fullDuration");
  self->_double fadeOutStartTime = v5 - self->_fadeOutDuration;
}

- (void)disableFadeInAndOut
{
  self->_fadeInStartTime = -1000000000.0;
  self->_double fadeOutStartTime = 1000000000.0;
}

- (CGPoint)_fixProjectedPointForOrientation:(CGPoint)a3
{
  double x = a3.x;
  int mOrientation = self->mOrientation;
  double v5 = -a3.y;
  if (mOrientation != 1)
  {
    double v6 = -x;
    if (mOrientation == 3)
    {
      double x = -x;
      double y = -a3.y;
    }

    else
    {
      double y = a3.y;
    }

    if (mOrientation == 2) {
      double v5 = a3.y;
    }
    else {
      double v5 = x;
    }
    if (mOrientation == 2) {
      double x = v6;
    }
    else {
      double x = y;
    }
  }

  double v8 = x;
  result.double y = v8;
  result.double x = v5;
  return result;
}

- (CGPoint)_fixPointForUnprojectionForOrientation:(CGPoint)a3
{
  double y = a3.y;
  int mOrientation = self->mOrientation;
  double x = -a3.x;
  if (mOrientation != 1)
  {
    if (mOrientation == 3)
    {
      double v6 = -y;
    }

    else
    {
      double x = a3.x;
      double v6 = y;
    }

    if (mOrientation == 2) {
      double y = -y;
    }
    else {
      double y = x;
    }
    if (mOrientation == 2) {
      double x = a3.x;
    }
    else {
      double x = v6;
    }
  }

  double v7 = y;
  result.double y = x;
  result.double x = v7;
  return result;
}

- (unsigned)currentLayoutIndex
{
  return -[MRRenderArguments currentLayoutIndex](self->mInternal->mRenderArguments, "currentLayoutIndex");
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v5[0] = (void (*)(void))_NSConcreteStackBlock;
  v5[1] = (void (*)(void))3221225472LL;
  v5[2] = (void (*)(void))sub_409F4;
  v5[3] = (void (*)(void))&unk_24D5D8;
  v5[4] = (void (*)(void))self;
  unsigned __int8 v6 = a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v5);
  if (self->mRequestRenderingOnChanges) {
    -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
  }
}

- (void)setMode:(int)a3
{
  if (self->mMode != a3)
  {
    mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
    v7[0] = (void (*)(void))_NSConcreteStackBlock;
    v7[1] = (void (*)(void))3221225472LL;
    v7[2] = sub_40AB0;
    v7[3] = (void (*)(void))&unk_24DA80;
    v7[4] = (void (*)(void))self;
    int v8 = a3;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v7);
    BOOL v5 = self->mMode == 1 || !self->mRequestRenderingOnChanges;
    BOOL v6 = !v5;
    self->mRequestRenderingOnChanges = v6;
    if (!v5) {
      -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
    }
  }

- (BOOL)isOffscreen
{
  return self->mMode == 1;
}

- (MZMediaManagement)assetManagementDelegate
{
  return (MZMediaManagement *)objc_loadWeak((id *)&self->_assetManagementDelegate);
}

- (void)setAssetManagementDelegate:(id)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v4[0] = (void (*)(void))_NSConcreteStackBlock;
  v4[1] = (void (*)(void))3221225472LL;
  v4[2] = (void (*)(void))sub_40BE8;
  v4[3] = (void (*)(void))&unk_24D9B8;
  v4[4] = (void (*)(void))self;
  void v4[5] = (void (*)(void))a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v4);
}

- (MRFeatureDelegate)featureDelegate
{
  return (MRFeatureDelegate *)objc_loadWeak((id *)&self->_featureDelegate);
}

- (void)setFeatureDelegate:(id)a3
{
}

- (MRRenderingDelegate)renderingDelegate
{
  return (MRRenderingDelegate *)objc_loadWeak((id *)&self->_renderingDelegate);
}

- (void)setRenderingDelegate:(id)a3
{
}

- (MREditingDelegate)editingDelegate
{
  return (MREditingDelegate *)objc_loadWeak((id *)&self->_editingDelegate);
}

- (void)setEditingDelegate:(id)a3
{
}

- (void)setDisplaysFPS:(BOOL)a3
{
  self->mDisplaysFPS = a3;
  if (self->mRequestRenderingOnChanges) {
    -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
  }
}

- (void)transitionToNextPlugInContainerOfPlug:(id)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v4[0] = (void (*)(void))_NSConcreteStackBlock;
  v4[1] = (void (*)(void))3221225472LL;
  v4[2] = (void (*)(void))sub_40CE4;
  v4[3] = (void (*)(void))&unk_24D9B8;
  v4[4] = (void (*)(void))self;
  void v4[5] = (void (*)(void))a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v4);
}

- (void)transitionToPreviousPlugInContainerOfPlug:(id)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v4[0] = (void (*)(void))_NSConcreteStackBlock;
  v4[1] = (void (*)(void))3221225472LL;
  v4[2] = (void (*)(void))sub_40DBC;
  v4[3] = (void (*)(void))&unk_24D9B8;
  v4[4] = (void (*)(void))self;
  void v4[5] = (void (*)(void))a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v4);
}

- (id)_layerForPlugObjectID:(id)a3
{
  if (self->mIsCleanedUp) {
    return 0LL;
  }
  else {
    return -[MRLayerParallelizer sublayerForPlugObjectID:recursive:]( self->mTopMRLayer,  "sublayerForPlugObjectID:recursive:",  a3,  1LL);
  }
}

- (id)plugForCurrentSublayerInNavigatorForPlug:(id)a3
{
  uint64_t v7 = 0LL;
  int v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  double v10 = sub_40F20;
  double v11 = sub_40F30;
  uint64_t v12 = 0LL;
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_40F3C;
  block[3] = &unk_24DAA8;
  block[4] = self;
  void block[5] = a3;
  void block[6] = &v7;
  dispatch_sync(mRenderDispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)currentState
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = sub_40F20;
  double v10 = sub_40F30;
  uint64_t v11 = 0LL;
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_4108C;
  v5[3] = &unk_24DAD0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(mRenderDispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)gotoState:(id)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_4117C;
  v4[3] = &unk_24D9B8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(mRenderDispatchQueue, v4);
}

- (id)snapshotOfStates:(id)a3 atSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array", a3);
  uint64_t v8 = objc_autoreleasePoolPush();
  uint64_t v9 = -[MRSnapshotter initWithMontage:andAssetManagementDelegate:isReadOnly:]( objc_alloc(&OBJC_CLASS___MRSnapshotter),  "initWithMontage:andAssetManagementDelegate:isReadOnly:",  self->mMontage,  -[MRRenderer assetManagementDelegate](self, "assetManagementDelegate"),  1LL);
  -[MRSnapshotter setSize:](v9, "setSize:", width, height);

  objc_autoreleasePoolPop(v8);
  return v7;
}

- (void)dumpActiveHierarchy
{
  id v3 = -[MRLayerParallelizer _dumpLayerWithOptions:](self->mTopMRLayer, "_dumpLayerWithOptions:", 0LL);
  uint64_t width = (int)self->mSize.width;
  uint64_t height = (int)self->mSize.height;
  -[MRRenderer _time](self, "_time");
  NSLog(@"%dx%d: %f\n%@", width, height, v6, v3);
}

- (void)nearingEndForSerializer:(id)a3
{
  if (self->mInternal->mLiveSlideshowDelegate)
  {
    BOOL v5 = (NSString *)objc_msgSend(objc_msgSend(a3, "referencingPlug"), "objectID");
    mInternal = self->mInternal;
    if (v5 == mInternal->mTransitionLayerPlugObjectID)
    {
      mRenderDispatchQueue = (dispatch_queue_s *)mInternal->mRenderDispatchQueue;
      v8[0] = (void (*)(void))_NSConcreteStackBlock;
      v8[1] = (void (*)(void))3221225472LL;
      v8[2] = (void (*)(void))sub_41388;
      v8[3] = (void (*)(void))&unk_24D9B8;
      v8[4] = (void (*)(void))self;
      v8[5] = (void (*)(void))a3;
      PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v8);
    }
  }

- (void)effect:(id)a3 requestedNumberOfSlides:(unint64_t)a4 firstSlideIndexStillNeeded:(unint64_t)a5
{
  mInternal = self->mInternal;
  if (mInternal->mLiveSlideshowDelegate)
  {
    mRenderDispatchQueue = (dispatch_queue_s *)mInternal->mRenderDispatchQueue;
    v7[0] = (void (*)(void))_NSConcreteStackBlock;
    v7[1] = (void (*)(void))3221225472LL;
    v7[2] = (void (*)(void))sub_41444;
    v7[3] = (void (*)(void))&unk_24DAF8;
    v7[4] = (void (*)(void))self;
    v7[5] = (void (*)(void))a3;
    v7[6] = (void (*)(void))a4;
    v7[7] = (void (*)(void))a5;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v7);
  }

- (void)imagePreloadingBegan
{
}

- (void)imagePreloadingEnded
{
  mInternal = self->mInternal;
  unint64_t mCountOfPreloadingImages = mInternal->mCountOfPreloadingImages;
  if (mCountOfPreloadingImages) {
    mInternal->unint64_t mCountOfPreloadingImages = mCountOfPreloadingImages - 1;
  }
}

- (void)addIDToDisplay:(id)a3 :(id)a4
{
  if (self->mDisplaysPlayingIDs)
  {
    mInternal = self->mInternal;
    if (mInternal->mCurrentIDs)
    {
      mCurrentIDs = mInternal->mCurrentIDs;
      if (a4 && ![a4 isEqualToString:@"Default"]) {
        uint64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@, %@/%@",  mCurrentIDs,  a3,  a4);
      }
      else {
        uint64_t v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@, %@",  mCurrentIDs,  a3,  v10);
      }
      self->mInternal->mCurrentIDs = v8;
    }

    else
    {
      else {
        uint64_t v9 = (NSString *)a3;
      }
      self->mInternal->mCurrentIDs = v9;
    }
  }

- (void)beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v6[0] = (void (*)(void))_NSConcreteStackBlock;
  v6[1] = (void (*)(void))3221225472LL;
  v6[2] = (void (*)(void))sub_4163C;
  v6[3] = (void (*)(void))&unk_24DB20;
  v6[4] = (void (*)(void))self;
  int v7 = a4;
  v6[5] = *(void (**)(void))&a3;
  void v6[6] = *(void (**)(void))&a5;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v6);
}

- (void)endMorphing
{
  mInternal = self->mInternal;
  if (mInternal->mMorphingDuration == 0.0)
  {
    mRenderDispatchQueue = (dispatch_queue_s *)mInternal->mRenderDispatchQueue;
    v5[0] = (void (*)(void))_NSConcreteStackBlock;
    v5[1] = (void (*)(void))3221225472LL;
    v5[2] = (void (*)(void))sub_416CC;
    v5[3] = (void (*)(void))&unk_24D5B0;
    v5[4] = (void (*)(void))self;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v5);
    -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
  }

- (void)_r_beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5
{
  if (!self->mIsCleanedUp)
  {
    mInternal = self->mInternal;
    if (mInternal->mMorphingStartTime >= 0.0 && mInternal->mMorphingDuration > 0.0)
    {
      -[MRRenderer _r_endMorphing](self, "_r_endMorphing");
      mInternal = self->mInternal;
    }

    if (a5 > 0.0)
    {
      mInternal->mMorphingDuration = a5;
      -[MRRenderer _r_snapshotForRotation](self, "_r_snapshotForRotation");
      mInternal = self->mInternal;
    }

    mInternal->mMorphingHandlesRotation = (a4 - 1) < 4;
    uint64_t v9 = self->mInternal;
    if (v9->mMorphingHandlesRotation)
    {
      int mOrientation_low = LOBYTE(self->mOrientation);
      v9->mMorphingRotationAngle = 0.0;
      if (mOrientation_low != a4)
      {
        switch(a4)
        {
          case 1:
            double v11 = dbl_1F6870[mOrientation_low == 3];
            BOOL v12 = mOrientation_low == 2;
            goto LABEL_14;
          case 2:
            double v11 = *((double *)&xmmword_1F6860 + (mOrientation_low == 3));
            BOOL v12 = mOrientation_low == 1;
            goto LABEL_14;
          case 3:
            double v11 = dbl_1F6870[mOrientation_low == 2];
            BOOL v12 = mOrientation_low == 4;
            goto LABEL_14;
          case 4:
            double v11 = *((double *)&xmmword_1F6860 + (mOrientation_low == 2));
            BOOL v12 = mOrientation_low == 3;
LABEL_14:
            if (v12) {
              double v11 = 180.0;
            }
            self->mInternal->mMorphingRotationAngle = v11;
            break;
          default:
            break;
        }
      }

      self->int mOrientation = a4;
      self->mInternal->mNeedsToResize = 1;
    }
  }

- (void)_r_endMorphing
{
  if (!self->mIsCleanedUp)
  {
    self->mInternal->double mMorphingStartTime = -1.0;
    self->mInternal->mMorphingDuration = 0.0;
    mSnapshotForMorphing = self->mInternal->mSnapshotForMorphing;
    if (mSnapshotForMorphing)
    {
      -[MRImage releaseByUser](mSnapshotForMorphing, "releaseByUser");
      self->mInternal->mSnapshotForMorphing = 0LL;
    }
  }

- (void)_playbackIsOverWithTime:(double)a3 sendNotification:(BOOL)a4
{
  BOOL v4 = a4;
  -[MRRenderer _r_pause](self, "_r_pause");
  if (a3 < 0.0)
  {
    -[MRRenderer time](self, "time");
    a3 = v7;
  }

  self->mInternal->double mTimeOffset = a3;
  self->mInternal->mNeedsToResumeOrPauseLayers = 1;
  self->mInternal->mInnerIsPlaying = 0;
  self->mInternal->mShouldPauseWhenStill = 0;
  if (v4) {
    -[MRRenderer sendNotification:](self, "sendNotification:", kMRNotificationPlaybackOver[0]);
  }
}

- (NSString)currentFocusedSlideAsset
{
  return -[MRSlideInfo assetPath]( -[MRSlideFocusState slideInfo](self->mInternal->mSlideFocusState, "slideInfo"),  "assetPath");
}

- (void)setSlideFocusModeBackgroundColor:(CGColor *)a3
{
  if (a3)
  {
    size_t NumberOfComponents = CGColorGetNumberOfComponents(a3);
    if (NumberOfComponents == 4)
    {
      Components = CGColorGetComponents(a3);
      double v9 = Components[2];
      *(_OWORD *)self->_slideFocusModeBackgroundColor = *(_OWORD *)Components;
      self->_slideFocusModeBackgroundColor[2] = v9;
    }

    else if (NumberOfComponents == 2)
    {
      uint64_t v6 = CGColorGetComponents(a3);
      double v7 = *v6;
      self->_slideFocusModeBackgroundColor[1] = *v6;
      self->_slideFocusModeBackgroundColor[2] = v7;
      self->_slideFocusModeBackgroundColor[0] = v7;
    }

    else
    {
      NSLog(@"Background color is in an unsupported color space (not generic gray or RGB)\n");
    }
  }

  else
  {
    self->_slideFocusModeBackgroundColor[0] = 0.0;
    self->_slideFocusModeBackgroundColor[1] = 0.0;
    self->_slideFocusModeBackgroundColor[2] = 0.0;
  }

  self->_slideFocusModeBackgroundColor[3] = 1.0;
}

- (id)currentlyShowingAssetPaths
{
  id v3 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = objc_msgSend( -[MRRenderer slideInfosForCurrentElements](self, "slideInfosForCurrentElements"),  "objectEnumerator",  0);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if ([v9 assetPath]) {
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "assetPath"));
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)currentStateForMontageSwap
{
  if (self->mIsCleanedUp) {
    return 0LL;
  }
  id v2 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  id v4 = -[MRRenderer slideInfosForCurrentElements](self, "slideInfosForCurrentElements");
  if (v4) {
    [v2 setObject:v4 forKey:@"slideInfosForCurrentElements"];
  }
  objc_msgSend( v2,  "setObject:forKey:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MRRenderer isPlaying](self, "isPlaying")),  @"isPlaying");
  objc_msgSend( v2,  "setObject:forKey:",  +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  -[MRRenderer slideshowIsPlaying](self, "slideshowIsPlaying")),  @"slideshowIsPlaying");
  return v2;
}

- (void)swapMontage:(id)a3
{
  if (a3 && !self->mIsCleanedUp && self->mMontage != a3)
  {
    if (self->mInternal->mSlideFocusLayer) {
      -[MRLayerParallelizer removeSublayer:](self->mTopMRLayer, "removeSublayer:");
    }
    if (-[MRLayer isActivated](self->mTopMRLayer, "isActivated")) {
      -[MRLayerParallelizer deactivate](self->mTopMRLayer, "deactivate");
    }
    if (-[MRLayer isPreactivated](self->mTopMRLayer, "isPreactivated")) {
      -[MRLayerParallelizer depreactivate:](self->mTopMRLayer, "depreactivate:", 0LL);
    }
    -[MRLayerParallelizer cleanup](self->mTopMRLayer, "cleanup");

    self->mTopMRLayer = 0LL;
    -[MRRenderer willChangeValueForKey:](self, "willChangeValueForKey:", @"montage");
    mMontage = self->mMontage;
    if (mMontage)
    {
      -[MCMontage removeObserver:forKeyPath:]( mMontage,  "removeObserver:forKeyPath:",  self,  @"rootPlug.fullDuration");
      -[MCMontage removeObserver:forKeyPath:]( self->mMontage,  "removeObserver:forKeyPath:",  self,  @"fadeInDuration");
      -[MCMontage removeObserver:forKeyPath:]( self->mMontage,  "removeObserver:forKeyPath:",  self,  @"fadeOutDuration");

      self->mMontage = 0LL;
    }

    self->mMontage = (MCMontage *)a3;
    -[MRRenderer didChangeValueForKey:](self, "didChangeValueForKey:", @"montage");
    -[MCMontage addObserver:forKeyPath:options:context:]( self->mMontage,  "addObserver:forKeyPath:options:context:",  self,  @"rootPlug.fullDuration",  0LL,  0LL);
    -[MCMontage addObserver:forKeyPath:options:context:]( self->mMontage,  "addObserver:forKeyPath:options:context:",  self,  @"fadeInDuration",  0LL,  0LL);
    -[MCMontage addObserver:forKeyPath:options:context:]( self->mMontage,  "addObserver:forKeyPath:options:context:",  self,  @"fadeOutDuration",  0LL,  0LL);
    id v6 = -[MRLayerParallelizer initWithPlug:andParameters:inSuperlayer:]( objc_alloc(&OBJC_CLASS___MRLayerParallelizer),  "initWithPlug:andParameters:inSuperlayer:",  -[MCMontage rootPlug](self->mMontage, "rootPlug"),  self->mParameters,  0LL);
    self->mTopMRLayer = v6;
    mSlideFocusLayer = self->mInternal->mSlideFocusLayer;
    if (mSlideFocusLayer)
    {
      -[MRLayerParallelizer setSublayer:forKey:](v6, "setSublayer:forKey:", mSlideFocusLayer, @"SlideFocusLayer");
      -[MRLayer setZIndex:](self->mInternal->mSlideFocusLayer, "setZIndex:", 32000LL);
      -[MRLayer setPhaseInDuration:](self->mInternal->mSlideFocusLayer, "setPhaseInDuration:", 0.5);
      -[MRLayer setPhaseOutDuration:](self->mInternal->mSlideFocusLayer, "setPhaseOutDuration:", 0.5);
    }

    -[MRRenderer _r_setTime:isResyncing:](self, "_r_setTime:isResyncing:", 0LL, 0.0);
    -[MRLayer updateGeometry](self->mTopMRLayer, "updateGeometry");
    -[MRLayerParallelizer preactivate](self->mTopMRLayer, "preactivate");
    -[MRLayer activate](self->mTopMRLayer, "activate");
    self->mInternal->mNeedsToResumeOrPauseLayers = 1;
  }

- (void)applyStateForMontageSwap:(id)a3
{
  if (self->mIsCleanedUp) {
    return;
  }
  id v4 = self;
  -[MRRenderer _r_prerenderWithPassParameters:](self, "_r_prerenderWithPassParameters:", &off_26F718);
  id v5 = -[MRRenderer _layerForPlugObjectID:](v4, "_layerForPlugObjectID:", v4->mInternal->mTransitionLayerPlugObjectID);
  mSlideFocusState = v4->mInternal->mSlideFocusState;
  if (mSlideFocusState)
  {
    uint64_t v7 = -[MRSlideFocusState slideInfo](mSlideFocusState, "slideInfo");
    int v8 = 0;
  }

  else
  {
    id v9 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"slideInfosForCurrentElements"), "allValues");
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v58 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v55 objects:v61 count:16];
    if (!v10)
    {
LABEL_43:
      double v34 = 0LL;
      goto LABEL_51;
    }

    id v11 = v10;
    uint64_t v7 = 0LL;
    uint64_t v12 = *(void *)v56;
    while (2)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v56 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(MRSlideInfo **)(*((void *)&v55 + 1) + 8LL * (void)i);
        if (-[MRSlideInfo isMain](v14, "isMain"))
        {
          if ((-[MZMediaManagement isSupportedMovieForAssetAtPath:]( -[MRRenderer assetManagementDelegate](v4, "assetManagementDelegate"),  "isSupportedMovieForAssetAtPath:",  -[MRSlideInfo assetPath](v14, "assetPath")) & 1) != 0)
          {
            int v8 = 1;
            uint64_t v7 = v14;
            goto LABEL_17;
          }

          if (!v7) {
            uint64_t v7 = v14;
          }
        }
      }

      id v11 = [v9 countByEnumeratingWithState:&v55 objects:v61 count:16];
      int v8 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }

- (MCMontage)montage
{
  return self->mMontage;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)mode
{
  return self->mMode;
}

- (BOOL)isEditing
{
  return self->mIsEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->mIsEditing = a3;
}

- (BOOL)pushRendering
{
  return self->mPushRendering;
}

- (void)setPushRendering:(BOOL)a3
{
  self->mPushRendering = a3;
}

- (BOOL)requestRenderingOnChanges
{
  return self->mRequestRenderingOnChanges;
}

- (void)setRequestRenderingOnChanges:(BOOL)a3
{
  self->mRequestRenderingOnChanges = a3;
}

- (BOOL)displaysFPS
{
  return self->mDisplaysFPS;
}

- (BOOL)displaysPlayingIDs
{
  return self->mDisplaysPlayingIDs;
}

- (void)setDisplaysPlayingIDs:(BOOL)a3
{
  self->mDisplaysPlayingIDs = a3;
}

- (BOOL)displaysIsPreloadingImages
{
  return self->mDisplaysIsPreloadingImages;
}

- (void)setDisplaysIsPreloadingImages:(BOOL)a3
{
  self->mDisplaysIsPreloadingImages = a3;
}

- (BOOL)displaysTouchVisualFeedback
{
  return self->mDisplaysTouchVisualFeedback;
}

- (void)setDisplaysTouchVisualFeedback:(BOOL)a3
{
  self->mDisplaysTouchVisualFeedback = a3;
}

- (BOOL)displaysHitZonesVisualFeedback
{
  return self->mDisplaysHitZonesVisualFeedback;
}

- (void)setDisplaysHitZonesVisualFeedback:(BOOL)a3
{
  self->mDisplaysHitZonesVisualFeedback = a3;
}

- (float)volume
{
  return self->mVolume;
}

- (void)setVolume:(float)a3
{
  self->mVolume = a3;
}

- (BOOL)ignoresBackgroundAudio
{
  return self->_ignoresBackgroundAudio;
}

- (void)setIgnoresBackgroundAudio:(BOOL)a3
{
  self->_ignoresBackgroundAudio = a3;
}

- (double)timeQuantum
{
  return self->mTimeQuantum;
}

- (NSDictionary)parameters
{
  return self->mParameters;
}

- (BOOL)isCleanedUp
{
  return self->mIsCleanedUp;
}

- (BOOL)asynchronousOperationsAreSuspended
{
  return self->_asynchronousOperationsAreSuspended;
}

- (void)suspendAsynchronousOperations:(BOOL)a3
{
  self->_BOOL asynchronousOperationsAreSuspended = a3;
}

- (BOOL)interactivityIsEnabled
{
  return self->_interactivityIsEnabled;
}

- (void)setInteractivityIsEnabled:(BOOL)a3
{
  self->_interactivityIsEnabled = a3;
}

- (MRCameraCaptureSession)cameraCaptureSession
{
  return self->_cameraCaptureSession;
}

- (BOOL)allowsThumbnails
{
  return self->_allowsThumbnails;
}

- (void)setAllowsThumbnails:(BOOL)a3
{
  self->_allowsThumbnails = a3;
}

- (double)fadeInStartTime
{
  return self->_fadeInStartTime;
}

- (void)setFadeInStartTime:(double)a3
{
  self->_fadeInStartTime = a3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_double fadeInDuration = a3;
}

- (double)fadeOutStartTime
{
  return self->_fadeOutStartTime;
}

- (void)setFadeOutStartTime:(double)a3
{
  self->_double fadeOutStartTime = a3;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
}

- (BOOL)logRenderingTimes
{
  return self->_logRenderingTimes;
}

- (void)setLogRenderingTimes:(BOOL)a3
{
  self->_logRenderingTimes = a3;
}

- (NSString)renderingLogFilePath
{
  return self->_renderingLogFilePath;
}

- (double)timestampOfLastRenderPass
{
  return self->_timestampOfLastRenderPass;
}

- (void)setTimestampOfLastRenderPass:(double)a3
{
  self->_timestampOfLastRenderPass = a3;
}

- (double)interactiveTransitionTrackingBoxRadius
{
  return self->_interactiveTransitionTrackingBoxRadius;
}

- (void)setInteractiveTransitionTrackingBoxRadius:(double)a3
{
  self->_interactiveTransitionTrackingBoxRadius = a3;
}

- (double)interactiveTransitionProgressThreshold
{
  return self->_interactiveTransitionProgressThreshold;
}

- (void)setInteractiveTransitionProgressThreshold:(double)a3
{
  self->_interactiveTransitionProgressThreshold = a3;
}

- (double)interactiveTransitionVelocityThreshold
{
  return self->_interactiveTransitionVelocityThreshold;
}

- (void)setInteractiveTransitionVelocityThreshold:(double)a3
{
  self->_interactiveTransitionVelocityThreshold = a3;
}

- (void)_displayFPS:(double)a3 actuallyDisplay:(BOOL)a4
{
  if (a4)
  {
    id v6 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
    uint64_t v7 = v6;
    if (v6 != -[MRContext glContext](self->mInternal->mContext, "glContext")) {
      +[EAGLContext setCurrentContext:]( &OBJC_CLASS___EAGLContext,  "setCurrentContext:",  -[MRContext glContext](self->mInternal->mContext, "glContext"));
    }
    double width = self->mSize.width;
    float v9 = self->mSize.height / width;
    float v10 = round(64.0 / (a3 - self->mInternal->mFrameTime[self->mInternal->mFrameTimeIndex]));
    double v11 = (float)-v9;
    float v12 = v11 * 0.95;
    float v13 = 4.0 / width + v12;
    float v14 = v10 / 30.0;
    v56[0] = -1082130432;
    *(float *)&v56[1] = v12;
    v56[2] = -1082130432;
    double v15 = (float)(v10 / 30.0);
    double v16 = v15 + -1.0;
    if (v15 >= 1.33333333) {
      double v16 = 0.333333333;
    }
    float v17 = v16;
    *(float *)&v56[3] = v13;
    *(float *)&v56[4] = v17;
    float v57 = v11 * 0.95;
    float v58 = v17;
    float v59 = v13;
    float v60 = v14 + -1.0;
    float v61 = v57;
    float v62 = v14 + -1.0;
    float v63 = v13;
    v43[0] = xmmword_1F6880;
    v43[1] = xmmword_1F6880;
    int v44 = 1065353216;
    float v18 = fmin(v15 * 0.75, 1.0);
    float v45 = v18;
    uint64_t v46 = 0x3F80000000000000LL;
    int v47 = 1065353216;
    float v48 = v18;
    uint64_t v49 = 0x3F80000000000000LL;
    float v19 = 2.0 - v15 * 0.75;
    float v50 = v19;
    uint64_t v51 = 1065353216LL;
    int v52 = 1065353216;
    float v53 = v19;
    uint64_t v54 = 1065353216LL;
    int v55 = 1065353216;
    unint64_t v27 = 0LL;
    unint64_t v28 = 0LL;
    getMem(&v28, &v27);
    float v20 = ((double)v27 + (double)v27) / (float)v28;
    double v21 = 4.0 / self->mSize.width;
    float v22 = v21 + v11;
    *(float *)&double v21 = v21 + v22;
    v42[0] = -1082130432;
    *(float *)&v42[1] = v22;
    v42[2] = -1082130432;
    double v23 = fmin(v20, 1.0);
    float v24 = v23 + -1.0;
    v42[3] = LODWORD(v21);
    *(float *)&v42[4] = v24;
    *(float *)&v42[5] = v22;
    *(float *)&v42[6] = v24;
    v42[7] = LODWORD(v21);
    *(float *)&v42[8] = v20 + -1.0;
    *(float *)&v42[9] = v22;
    *(float *)&v42[10] = v20 + -1.0;
    v42[11] = LODWORD(v21);
    v29[0] = xmmword_1F6880;
    v29[1] = xmmword_1F6880;
    int v30 = 1065353216;
    *(float *)&double v21 = v23;
    int v31 = LODWORD(v21);
    uint64_t v32 = 0x3F80000000000000LL;
    int v33 = 1065353216;
    int v34 = LODWORD(v21);
    uint64_t v35 = 0x3F80000000000000LL;
    float v36 = 2.0 - v20;
    uint64_t v37 = 1065353216LL;
    int v38 = 1065353216;
    float v39 = 2.0 - v20;
    uint64_t v40 = 1065353216LL;
    int v41 = 1065353216;
    -[MRContext setShader:](self->mInternal->mContext, "setShader:", @"PerVertexColor");
    -[MRContext setColorsPointer:](self->mInternal->mContext, "setColorsPointer:", v43);
    -[MRContext setVertex2DPointer:](self->mInternal->mContext, "setVertex2DPointer:", v56);
    if (v14 <= 1.0) {
      uint64_t v25 = 4LL;
    }
    else {
      uint64_t v25 = 6LL;
    }
    -[MRContext drawTriangleStripFromOffset:count:]( self->mInternal->mContext,  "drawTriangleStripFromOffset:count:",  0LL,  v25,  1065353216LL,  0x3F80000000000000LL);
    -[MRContext setColorsPointer:](self->mInternal->mContext, "setColorsPointer:", v29);
    -[MRContext setVertex2DPointer:](self->mInternal->mContext, "setVertex2DPointer:", v42);
    if (v20 <= 1.0) {
      uint64_t v26 = 4LL;
    }
    else {
      uint64_t v26 = 6LL;
    }
    -[MRContext drawTriangleStripFromOffset:count:]( self->mInternal->mContext,  "drawTriangleStripFromOffset:count:",  0LL,  v26);
    -[MRContext unsetVertexPointer](self->mInternal->mContext, "unsetVertexPointer");
    -[MRContext unsetColorsPointer](self->mInternal->mContext, "unsetColorsPointer");
    -[MRContext unsetShader](self->mInternal->mContext, "unsetShader");
    if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v6) {
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v6);
    }
  }

  self->mInternal->mFrameTime[self->mInternal->mFrameTimeIndex] = a3;
  self->mInternal->mFrameTimeIndedouble x = (self->mInternal->mFrameTimeIndex + 1) & 0x3F;
}

- (void)_displayPlayingIDs
{
  mInternal = self->mInternal;
  mCurrentIDs = mInternal->mCurrentIDs;
  if (mCurrentIDs != mInternal->mPreviousCurrentIDs)
  {
    unsigned __int8 v5 = -[NSString isEqualToString:](mCurrentIDs, "isEqualToString:");
    mInternal = self->mInternal;
    if ((v5 & 1) == 0)
    {
      -[MRImage releaseByUser](mInternal->mCurrentIDsImage, "releaseByUser");
      self->mInternal->mCurrentIDsImage = 0LL;
      id v6 = self->mInternal;
      if (v6->mCurrentIDs)
      {
        uint64_t v7 = +[MRUtilities newColorSpaceForDevice](&OBJC_CLASS___MRUtilities, "newColorSpaceForDevice");
        *(_OWORD *)components = xmmword_1F68C0;
        __int128 v21 = unk_1F68D0;
        int v8 = CGColorCreate(v7, components);
        CGColorSpaceRelease(v7);
        float v9 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  self->mInternal->mCurrentIDs,  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v8,  kCTForegroundColorAttributeName,  0LL));
        CGColorRelease(v8);
        float v10 = -[MRTextRenderer initWithText:resolution:]( objc_alloc(&OBJC_CLASS___MRTextRenderer),  "initWithText:resolution:",  v9,  self->mSize.width,  self->mSize.height * 0.0799999982);
        double v11 = -[MRTextRenderer retainedContext](v10, "retainedContext");
        if (v11)
        {
          float v12 = v11;
          self->mInternal->mCurrentIDsImage = (MRImage *)-[MRImageManager retainedByUserImageWithCGContext:]( -[MRContext imageManager]( self->mInternal->mContext,  "imageManager"),  "retainedByUserImageWithCGContext:",  v11);
          -[MRImage setLabel:](self->mInternal->mCurrentIDsImage, "setLabel:", @"Marimba DisplayedIDs");
          CGContextRelease(v12);
        }

        id v6 = self->mInternal;
      }

      self->mInternal->mPreviousCurrentIDs = self->mInternal->mCurrentIDs;
      mInternal = self->mInternal;
    }
  }

  self->mInternal->mCurrentIDs = 0LL;
  float v13 = self->mInternal;
  if (v13->mCurrentIDsImage)
  {
    -[MRContext setShader:](v13->mContext, "setShader:", @"PlainTexture");
    -[MRImage width](self->mInternal->mCurrentIDsImage, "width");
    double v14 = 0.0799999982;
    double v16 = v15 * 0.0799999982;
    -[MRImage height](self->mInternal->mCurrentIDsImage, "height");
    double v18 = v16 / v17 * self->mSize.height / self->mSize.width;
    double v19 = 2.0;
    if (v18 <= 2.0) {
      double v19 = v18;
    }
    else {
      double v14 = 2.0 / v18 * 0.0799999982;
    }
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:]( &OBJC_CLASS___MRCroppingSprite,  "renderImage:inContext:atPosition:andSize:",  self->mInternal->mCurrentIDsImage,  self->mInternal->mContext,  v19 * 0.5 + -1.0,  v14 * 0.5 + -1.0,  v19,  v14);
    -[MRContext unsetShader](self->mInternal->mContext, "unsetShader");
  }

- (void)_displayIsPreloadingImages
{
  id v3 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
  id v4 = v3;
  if (v3 != -[MRContext glContext](self->mInternal->mContext, "glContext")) {
    +[EAGLContext setCurrentContext:]( &OBJC_CLASS___EAGLContext,  "setCurrentContext:",  -[MRContext glContext](self->mInternal->mContext, "glContext"));
  }
  -[MRContext setShader:](self->mInternal->mContext, "setShader:", @"PlainColor");
  -[MRContext aspectRatio](self->mInternal->mContext, "aspectRatio");
  v28[0] = 1064849900;
  double v6 = (float)(1.0 / v5);
  float v7 = v6 * -0.96;
  *(float *)&v28[1] = v7;
  v28[2] = 1064849900;
  *(float *)&double v6 = v6 * -0.99;
  v28[3] = LODWORD(v6);
  v28[4] = 1065185444;
  *(float *)&void v28[5] = v7;
  v28[6] = 1065185444;
  v28[7] = LODWORD(v6);
  -[MRContext setVertex2DPointer:](self->mInternal->mContext, "setVertex2DPointer:", v28);
  LODWORD(v8) = 0;
  LODWORD(v9) = 1.0;
  LODWORD(v10) = 1.0;
  LODWORD(v11) = 1.0;
  -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( self->mInternal->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  v27,  v8,  v9,  v10,  v11);
  -[MRContext setModelViewMatrix:saveTo:]( self->mInternal->mContext,  "setModelViewMatrix:saveTo:",  v25,  v24,  MRMatrix_Clear((uint64_t)v25));
  mInternal = self->mInternal;
  if (mInternal->mIsStalled)
  {
    -[MRContext drawTriangleStripFromOffset:count:](mInternal->mContext, "drawTriangleStripFromOffset:count:", 0LL, 4LL);
    mInternal = self->mInternal;
  }

  float v13 = v26 + -0.03;
  float v26 = v13;
  -[MRContext setModelViewMatrix:saveTo:](mInternal->mContext, "setModelViewMatrix:saveTo:", v25, v24);
  if (-[NSOperationQueue isSuspended]( -[MRRenderArguments preloadQueue](self->mInternal->mRenderArguments, "preloadQueue"),  "isSuspended"))
  {
    LODWORD(v14) = 1.0;
    LODWORD(v15) = 1.0;
    LODWORD(v16) = 0;
    LODWORD(v17) = 1.0;
    -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( self->mInternal->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  0LL,  v14,  v15,  v16,  v17);
    -[MRContext drawTriangleStripFromOffset:count:]( self->mInternal->mContext,  "drawTriangleStripFromOffset:count:",  0LL,  4LL);
  }

  double v18 = v26 + -0.03;
  *(float *)&double v18 = v18;
  float v26 = *(float *)&v18;
  LODWORD(v18) = 1.0;
  LODWORD(v15) = 0;
  LODWORD(v16) = 1.0;
  LODWORD(v17) = 1.0;
  -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( self->mInternal->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  0LL,  v18,  v15,  v16,  v17);
  double v19 = self->mInternal;
  unint64_t mCountOfPreloadingImages = v19->mCountOfPreloadingImages;
  if (mCountOfPreloadingImages >= 0xA) {
    unint64_t mCountOfPreloadingImages = 10LL;
  }
  if (mCountOfPreloadingImages)
  {
    unint64_t v21 = 0LL;
    do
    {
      -[MRContext setModelViewMatrix:saveTo:](v19->mContext, "setModelViewMatrix:saveTo:", v25, 0LL);
      -[MRContext drawTriangleStripFromOffset:count:]( self->mInternal->mContext,  "drawTriangleStripFromOffset:count:",  0LL,  4LL);
      float v22 = v26 + -0.03;
      float v26 = v22;
      ++v21;
      double v19 = self->mInternal;
      unint64_t v23 = v19->mCountOfPreloadingImages;
      if (v23 >= 0xA) {
        unint64_t v23 = 10LL;
      }
    }

    while (v21 < v23);
  }

  -[MRContext restoreModelViewMatrix:](v19->mContext, "restoreModelViewMatrix:", v24);
  -[MRContext restoreForeColor:](self->mInternal->mContext, "restoreForeColor:", v27);
  -[MRContext unsetVertexPointer](self->mInternal->mContext, "unsetVertexPointer");
  -[MRContext unsetShader](self->mInternal->mContext, "unsetShader");
  if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v3) {
    +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v3);
  }
}

- (void)_displayTouchVisualFeedback
{
  if (-[NSMutableArray count](self->mInternal->mTouchesForVisualFeedback, "count"))
  {
    double v46 = MRGetCurrentTime();
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    mTouchesForVisualFeedback = self->mInternal->mTouchesForVisualFeedback;
    id v4 = 0LL;
    id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mTouchesForVisualFeedback,  "countByEnumeratingWithState:objects:count:",  &v51,  v60,  16LL);
    if (v5)
    {
      uint64_t v6 = *(void *)v52;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v52 != v6) {
            objc_enumerationMutation(mTouchesForVisualFeedback);
          }
          double v8 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
          if ([v8 phase] >= 3)
          {
            [v8 timestamp];
            if (v9 <= v46 + -0.5)
            {
              if (!v4) {
                id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              }
              -[NSMutableArray addObject:](v4, "addObject:", v8);
            }
          }
        }

        id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mTouchesForVisualFeedback,  "countByEnumeratingWithState:objects:count:",  &v51,  v60,  16LL);
      }

      while (v5);
    }

    double v10 = self->mInternal->mTouchesForVisualFeedback;
    objc_sync_enter(v10);
    -[NSMutableArray removeObjectsInArray:](self->mInternal->mTouchesForVisualFeedback, "removeObjectsInArray:", v4);

    if (self->mInternal->mTouchesForVisualFeedback)
    {
      double v11 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
      float v12 = v11;
      if (v11 != -[MRContext glContext](self->mInternal->mContext, "glContext")) {
        +[EAGLContext setCurrentContext:]( &OBJC_CLASS___EAGLContext,  "setCurrentContext:",  -[MRContext glContext](self->mInternal->mContext, "glContext"));
      }
      -[MRContext setShader:](self->mInternal->mContext, "setShader:", @"PlainColor");
      LODWORD(v13) = 0.75;
      LODWORD(v14) = 1.0;
      LODWORD(v15) = 1.0;
      LODWORD(v16) = 1055286886;
      -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( self->mInternal->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  v59,  v16,  v13,  v14,  v15);
      -[MRContext setModelViewMatrix:saveTo:]( self->mInternal->mContext,  "setModelViewMatrix:saveTo:",  v58,  v57,  MRMatrix_Clear((uint64_t)v58));
      -[MRContext blend:](self->mInternal->mContext, "blend:", 3LL);
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      __int128 v47 = 0u;
      __int128 v48 = 0u;
      double v17 = self->mInternal->mTouchesForVisualFeedback;
      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v47,  v56,  16LL);
      if (v18)
      {
        uint64_t v19 = *(void *)v48;
        do
        {
          for (j = 0LL; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v48 != v19) {
              objc_enumerationMutation(v17);
            }
            unint64_t v21 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)j);
            unsigned int v22 = [v21 phase];
            mInternal = self->mInternal;
            mContext = mInternal->mContext;
            if (v22 > 2)
            {
              [v21 timestamp];
              double v30 = v29 + 0.5 - v46;
              *(float *)&double v31 = v30;
              LODWORD(v32) = 1.0;
              LODWORD(v30) = 1055286886;
              -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  0LL,  v30,  COERCE_DOUBLE(__PAIR64__(HIDWORD(v46), 0.75)),  v32,  v31);
            }

            else
            {
              LODWORD(v24) = 0.75;
              LODWORD(v25) = 1.0;
              LODWORD(v26) = 1.0;
              LODWORD(v23) = 1055286886;
              -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( mInternal->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  v59,  v23,  v24,  v25,  v26);
            }

            [v21 location];
            double v34 = v33;
            double width = self->mSize.width;
            [v21 location];
            double v36 = -(width - v34 * 2.0) / width;
            CGFloat v38 = -(self->mSize.height - v37 * 2.0) / self->mSize.width;
            float v39 = v36;
            float v40 = v38;
            *(float *)int v55 = v39;
            *(float *)&v55[1] = v40;
            float v41 = v36 + -0.05;
            *(float *)&v55[2] = v41;
            *(float *)&v55[3] = v40;
            float v42 = v36 + -0.033;
            float v43 = v38 + 0.033;
            *(float *)&v55[4] = v42;
            *(float *)&v55[5] = v43;
            float v44 = v38 + 0.05;
            *(float *)&v55[6] = v39;
            *(float *)&v55[7] = v44;
            float v45 = v36 + 0.033;
            *(float *)&v55[8] = v45;
            *(float *)&v55[9] = v43;
            *(float *)&double v36 = v36 + 0.05;
            v55[10] = LODWORD(v36);
            *(float *)&v55[11] = v40;
            *(float *)&double v36 = v38 + -0.033;
            *(float *)&v55[12] = v45;
            v55[13] = LODWORD(v36);
            *(float *)&CGFloat v38 = v38 + -0.05;
            *(float *)&v55[14] = v39;
            v55[15] = LODWORD(v38);
            *(float *)&v55[16] = v42;
            v55[17] = LODWORD(v36);
            *(float *)&v55[18] = v41;
            *(float *)&v55[19] = v40;
            -[MRContext setVertex2DPointer:](self->mInternal->mContext, "setVertex2DPointer:", v55);
            -[MRContext drawTriangleFanFromOffset:count:]( self->mInternal->mContext,  "drawTriangleFanFromOffset:count:",  0LL,  10LL);
            -[MRContext unsetVertexPointer](self->mInternal->mContext, "unsetVertexPointer");
          }

          id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v47,  v56,  16LL);
        }

        while (v18);
      }

      -[MRContext blend:](self->mInternal->mContext, "blend:", 0LL);
      -[MRContext restoreModelViewMatrix:](self->mInternal->mContext, "restoreModelViewMatrix:", v57);
      -[MRContext restoreForeColor:](self->mInternal->mContext, "restoreForeColor:", v59);
      -[MRContext unsetShader](self->mInternal->mContext, "unsetShader");
      if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v11) {
        +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v11);
      }
    }

    objc_sync_exit(v10);
  }

- (void)_displayHitZonesVisualFeedback
{
  if (-[NSMutableArray count](self->mInternal->mHitZonesForVisualFeedback, "count"))
  {
    double v3 = MRGetCurrentTime();
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    mHitZonesForVisualFeedback = self->mInternal->mHitZonesForVisualFeedback;
    id v5 = 0LL;
    id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mHitZonesForVisualFeedback,  "countByEnumeratingWithState:objects:count:",  &v39,  v47,  16LL);
    if (v6)
    {
      uint64_t v7 = *(void *)v40;
      do
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(mHitZonesForVisualFeedback);
          }
          double v9 = *(void **)(*((void *)&v39 + 1) + 8LL * (void)i);
          if ([v9 hasEnded])
          {
            [v9 timestamp];
            if (v10 <= v3 + -0.5)
            {
              if (!v5) {
                id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
              }
              -[NSMutableArray addObject:](v5, "addObject:", v9);
            }
          }
        }

        id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mHitZonesForVisualFeedback,  "countByEnumeratingWithState:objects:count:",  &v39,  v47,  16LL);
      }

      while (v6);
    }

    double v11 = self->mInternal->mHitZonesForVisualFeedback;
    objc_sync_enter(v11);
    -[NSMutableArray removeObjectsInArray:](self->mInternal->mHitZonesForVisualFeedback, "removeObjectsInArray:", v5);

    if (-[NSMutableArray count](self->mInternal->mHitZonesForVisualFeedback, "count"))
    {
      float v12 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
      double v13 = v12;
      if (v12 != -[MRContext glContext](self->mInternal->mContext, "glContext")) {
        +[EAGLContext setCurrentContext:]( &OBJC_CLASS___EAGLContext,  "setCurrentContext:",  -[MRContext glContext](self->mInternal->mContext, "glContext"));
      }
      -[MRContext setShader:](self->mInternal->mContext, "setShader:", @"PlainColor");
      LODWORD(v14) = 0.75;
      LODWORD(v15) = 1.0;
      LODWORD(v16) = 1.0;
      LODWORD(v17) = 1055286886;
      -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( self->mInternal->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  v46,  v17,  v14,  v15,  v16);
      -[MRContext setModelViewMatrix:saveTo:]( self->mInternal->mContext,  "setModelViewMatrix:saveTo:",  v45,  v44,  MRMatrix_Clear((uint64_t)v45));
      -[MRContext blend:](self->mInternal->mContext, "blend:", 3LL);
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      id v18 = self->mInternal->mHitZonesForVisualFeedback;
      id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v35,  v43,  16LL);
      if (v19)
      {
        uint64_t v20 = *(void *)v36;
        do
        {
          for (j = 0LL; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v18);
            }
            unsigned int v22 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)j);
            unsigned __int8 v23 = [v22 hasEnded];
            mInternal = self->mInternal;
            mContext = mInternal->mContext;
            if ((v23 & 1) != 0)
            {
              [v22 timestamp];
              double v31 = v30 + 0.5 - v3;
              *(float *)&double v32 = v31;
              LODWORD(v33) = 0.75;
              LODWORD(v34) = 1.0;
              LODWORD(v31) = 1055286886;
              -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  0LL,  v31,  v33,  v34,  v32);
            }

            else
            {
              LODWORD(v25) = 0.75;
              LODWORD(v26) = 1.0;
              LODWORD(v27) = 1.0;
              LODWORD(v24) = 1055286886;
              -[MRContext setForeColorRed:green:blue:alpha:saveTo:]( mInternal->mContext,  "setForeColorRed:green:blue:alpha:saveTo:",  v46,  v24,  v25,  v26,  v27);
            }

            -[MRContext setVertex2DPointer:]( self->mInternal->mContext,  "setVertex2DPointer:",  [v22 vertices]);
            -[MRContext drawTriangleStripFromOffset:count:]( self->mInternal->mContext,  "drawTriangleStripFromOffset:count:",  0,  [v22 countOfVertices]);
            -[MRContext unsetVertexPointer](self->mInternal->mContext, "unsetVertexPointer");
          }

          id v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v18,  "countByEnumeratingWithState:objects:count:",  &v35,  v43,  16LL);
        }

        while (v19);
      }

      -[MRContext blend:](self->mInternal->mContext, "blend:", 0LL);
      -[MRContext restoreModelViewMatrix:](self->mInternal->mContext, "restoreModelViewMatrix:", v44);
      -[MRContext restoreForeColor:](self->mInternal->mContext, "restoreForeColor:", v46);
      -[MRContext unsetShader](self->mInternal->mContext, "unsetShader");
      if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v12) {
        +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v12);
      }
    }

    objc_sync_exit(v11);
  }

- (MRContext)context
{
  return self->mInternal->mContext;
}

- (double)masterClock
{
  double result = self->mInternal->mMasterClock;
  if (result < 0.0)
  {
    double result = self->mDisplayLinkTimestamp;
    if (result < 0.0) {
      return MRGetCurrentTime();
    }
  }

  return result;
}

- (void)setMasterClock:(double)a3
{
  self->mInternal->mMasterClock = a3;
}

- (void)setFreezeSizeOfImageRequests:(BOOL)a3
{
}

- (BOOL)isFlipped
{
  return objc_msgSend( -[NSDictionary objectForKey:](self->mParameters, "objectForKey:", @"flipped"),  "BOOLValue");
}

- (void)selectLayer:(id)a3
{
}

- (void)deselectLayer:(id)a3
{
  if (self->mInternal->mLayerCurrentlyTextEditing == a3) {
    -[MRRenderer endTextEditing:](self, "endTextEditing:", 1LL);
  }
  -[MRRenderer _updateSelectionLayer](self, "_updateSelectionLayer");
}

- (void)deselectAllLayers
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  mSelectedLayers = self->mInternal->mSelectedLayers;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSelectedLayers,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mSelectedLayers);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)i) setIsSelected:0];
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( mSelectedLayers,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->mInternal->mSelectedLayers, "removeAllObjects");
  -[MRRenderer _updateSelectionLayer](self, "_updateSelectionLayer");
}

- (id)selectedLayers
{
  return self->mInternal->mSelectedLayers;
}

- (void)_dimLayersExceptForPathTo:(id)a3
{
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x3052000000LL;
  v4[3] = sub_439E0;
  v4[4] = sub_439F0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_439FC;
  v3[3] = &unk_24DB48;
  v3[4] = a3;
  void v3[5] = self;
  v3[6] = v4;
  void v4[5] = v3;
  sub_439FC((uint64_t)v3, self->mTopMRLayer);
  _Block_object_dispose(v4, 8);
}

- (void)_undimAllLayersInLayer:(id)a3
{
  v4[0] = 0LL;
  v4[1] = v4;
  v4[2] = 0x3052000000LL;
  v4[3] = sub_439E0;
  v4[4] = sub_439F0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_43C30;
  v3[3] = &unk_24DB70;
  v3[4] = v4;
  void v4[5] = v3;
  sub_43C30((uint64_t)v3, a3);
  _Block_object_dispose(v4, 8);
}

- (void)dimLayersExceptForPathTo:(id)a3
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_43DC4;
  v5[3] = &unk_24D9B8;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(mRenderDispatchQueue, v5);
  -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
}

- (void)undimAllLayers
{
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_43E50;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
  -[MRRenderer requestRendering:](self, "requestRendering:", 0LL);
}

- (id)layerAtPath:(id)a3 fromLayer:(id)a4
{
  id v5 = [a3 componentsSeparatedByString:@"."];
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v17;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * v10);
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___MRLayerParallelizer, v7);
      if ((objc_opt_isKindOfClass(a4, v12) & 1) == 0)
      {
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___MRLayerNavigator, v13);
        if ((objc_opt_isKindOfClass(a4, v14) & 1) == 0) {
          break;
        }
      }

      a4 = [a4 sublayerForKey:v11];
      if (v8 == (id)++v10)
      {
        id v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          goto LABEL_3;
        }
        return a4;
      }
    }
  }

  return a4;
}

- (CGImage)snapshotAsCGImageForTime:(double)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = objc_autoreleasePoolPush();
  uint64_t v9 = -[EAGLContext initWithAPI:](objc_alloc(&OBJC_CLASS___EAGLContext), "initWithAPI:", 2LL);
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = -[MRTexture initFBOWithSize:inGLContext:options:]( objc_alloc(&OBJC_CLASS___MRTexture),  "initFBOWithSize:inGLContext:options:",  width | ((unint64_t)height << 32),  v9,  0LL);
    [v11 setLabel:@"Marimba Snapshot"];
    uint64_t v12 = -[MRRenderer initWithParameters:]( objc_alloc(&OBJC_CLASS___MRRenderer),  "initWithParameters:",  +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  @"readonly",  &__kCFBooleanTrue,  @"noAudio",  0LL));
    -[MRRenderer setAssetManagementDelegate:]( v12,  "setAssetManagementDelegate:",  -[MRRenderer assetManagementDelegate](self, "assetManagementDelegate"));
    -[MRRenderer setEAGLContext:](v12, "setEAGLContext:", [v11 glContext]);
    -[MRContext setIsFlipped:](-[MRRenderer context](v12, "context"), "setIsFlipped:", 1LL);
    -[MRRenderer setTimeQuantum:](v12, "setTimeQuantum:", self->mTimeQuantum);
    -[MRRenderer setMode:](v12, "setMode:", 1LL);
    -[MRRenderer setMontage:](v12, "setMontage:", self->mMontage);
    -[MRRenderer setTime:](v12, "setTime:", a3);
    -[MRRenderer setSize:](v12, "setSize:", width, height);
    -[MRRenderer requestRendering:](v12, "requestRendering:", 1LL);
    -[MRRenderer cleanup](v12, "cleanup");

    uint64_t v13 = +[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext");
    uint64_t v14 = v13;
    if (v13 != [v11 glContext]) {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [v11 glContext]);
    }
    double v15 = malloc((unint64_t)(height * (width * 4.0)));
    glPixelStorei(0xD05u, 1);
    glReadPixels(0, 0, (int)width, (int)height, 0x1908u, 0x1401u, v15);
    glFinish();
    if (+[EAGLContext currentContext](&OBJC_CLASS___EAGLContext, "currentContext") != v13) {
      +[EAGLContext setCurrentContext:](&OBJC_CLASS___EAGLContext, "setCurrentContext:", v13);
    }

    __int128 v16 = CGDataProviderCreateWithData( 0LL,  v15,  (unint64_t)(height * (width * 4.0)),  (CGDataProviderReleaseDataCallback)MyCGImageBufferReleaseCallback);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    CGImageRef v18 = CGImageCreate( (unint64_t)width,  (unint64_t)height,  8uLL,  0x20uLL,  (unint64_t)(width * 4.0),  DeviceRGB,  1u,  v16,  0LL,  0,  kCGRenderingIntentDefault);
    CGDataProviderRelease(v16);
    CGColorSpaceRelease(DeviceRGB);

    objc_autoreleasePoolPop(v8);
    if (v18) {
      return v18;
    }
  }

  else
  {
    objc_autoreleasePoolPop(v8);
  }

  return 0LL;
}

- (CGImage)currentFrameAsCGImage
{
  double v3 = +[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 10.0);
  if (!-[NSConditionLock lockBeforeDate:](self->mInternal->mSnapshotAsCGImageLock, "lockBeforeDate:", v3)) {
    return 0LL;
  }
  -[NSConditionLock unlockWithCondition:](self->mInternal->mSnapshotAsCGImageLock, "unlockWithCondition:", 1LL);
  -[MRRenderer requestRendering:](self, "requestRendering:", 1LL);
  unsigned int v4 = -[NSConditionLock lockWhenCondition:beforeDate:]( self->mInternal->mSnapshotAsCGImageLock,  "lockWhenCondition:beforeDate:",  0LL,  v3);
  mSnapshotAsCGImage = 0LL;
  if (v4)
  {
    mSnapshotAsCGImage = self->mInternal->mSnapshotAsCGImage;
    id v6 = mSnapshotAsCGImage;
    self->mInternal->mSnapshotAsCGImage = 0LL;
    -[NSConditionLock unlock](self->mInternal->mSnapshotAsCGImageLock, "unlock");
  }

  return mSnapshotAsCGImage;
}

- (void)setMasterStartTime:(double)a3 andDuration:(double)a4 mode:(int)a5
{
  self->mInternal->double mMasterStartTime = a3;
  self->mInternal->double mMasterDuration = a4;
  self->mInternal->mMasterMode = a5;
}

- (MRLiveSlideshowDelegate)liveSlideshowDelegate
{
  return self->mInternal->mLiveSlideshowDelegate;
}

- (void)setLiveSlideshowDelegate:(id)a3
{
  mInternal = self->mInternal;
  if (mInternal->mLiveSlideshowDelegate != a3) {
    mInternal->mLiveSlideshowDelegate = (MRLiveSlideshowDelegate *)a3;
  }
}

- (MRAsynchronousOperationsDelegate)asynchronousOperationsDelegate
{
  return self->mInternal->mAsynchronousOperationsDelegate;
}

- (void)setAsynchronousOperationsDelegate:(id)a3
{
  mInternal = self->mInternal;
  if (mInternal->mAsynchronousOperationsDelegate != a3) {
    mInternal->mAsynchronousOperationsDelegate = (MRAsynchronousOperationsDelegate *)a3;
  }
}

- (BOOL)screenBurnTest
{
  return self->mInternal->mScreenBurnTest;
}

- (void)setScreenBurnTest:(BOOL)a3
{
  mInternal = self->mInternal;
  if (mInternal->mScreenBurnTest != a3)
  {
    mRenderDispatchQueue = (dispatch_queue_s *)mInternal->mRenderDispatchQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_4441C;
    v5[3] = &unk_24D5D8;
    v5[4] = self;
    BOOL v6 = a3;
    dispatch_async(mRenderDispatchQueue, v5);
  }

- (BOOL)hideTextWhileEditing
{
  return self->mInternal->mHideTextWhileEditing;
}

- (void)setHideTextWhileEditing:(BOOL)a3
{
  self->mInternal->mHideTextWhileEditing = a3;
}

- (void)setUseCGLFlushDrawableWorkaround:(BOOL)a3
{
}

- (void)_createSlideFocusLayer
{
  double v3 = -[MRLayerParallelizer initWithParameters:]( objc_alloc(&OBJC_CLASS___MRLayerParallelizer),  "initWithParameters:",  self->mParameters);
  self->mInternal->mSlideFocusLayer = v3;
  double v4 = self->_slideFocusModeBackgroundColor[0];
  *(float *)&double v4 = v4;
  -[MRLayerParallelizer setBackgroundColorRed:green:blue:alpha:]( v3,  "setBackgroundColorRed:green:blue:alpha:",  v4,  self->_slideFocusModeBackgroundColor[1],  self->_slideFocusModeBackgroundColor[2],  self->_slideFocusModeBackgroundColor[3]);
  -[MRLayerParallelizer setSublayer:forKey:](self->mTopMRLayer, "setSublayer:forKey:", v3, @"SlideFocusLayer");
  -[MRLayer setZIndex:](v3, "setZIndex:", 32000LL);
  -[MRLayer setPhaseInDuration:](v3, "setPhaseInDuration:", 0.5);
  -[MRLayer setPhaseOutDuration:](v3, "setPhaseOutDuration:", 0.5);
  id v5 = -[MRLayerNavigator initWithParameters:]( objc_alloc(&OBJC_CLASS___MRLayerNavigator),  "initWithParameters:",  self->mParameters);
  self->mInternal->mSlideFocusNavigator = v5;
  -[MRLayerParallelizer setSublayer:forKey:](v3, "setSublayer:forKey:", v5, @"SlideFocusNavigator");
  BOOL v6 = -[MRLayerEffect initWithEffectID:andParameters:]( objc_alloc(&OBJC_CLASS___MRLayerEffect),  "initWithEffectID:andParameters:",  @"JustASlide",  self->mParameters);
  -[MREffect setIsFocuser:](-[MRLayerEffect effect](v6, "effect"), "setIsFocuser:", 1LL);
  self->mInternal->mSlideFocuser[0] = v6;
  -[MRLayerEffect setKenBurnsType:ofSlide:](v6, "setKenBurnsType:ofSlide:", 0LL, @"image0");
  -[MRLayerNavigator setSublayer:forKey:](v5, "setSublayer:forKey:", v6, @"SlideFocuser0");
  id v7 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( &OBJC_CLASS___MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  0LL,  @"Push");
  [v7 setTransitionDestinationPlugID:@"SlideFocuser0"];
  [v7 setTransitionDuration:0.5];
  [v7 setTransitionAttributes:&off_26F768];
  id v8 = -[MRLayerEffect initWithEffectID:andParameters:]( objc_alloc(&OBJC_CLASS___MRLayerEffect),  "initWithEffectID:andParameters:",  @"JustASlide",  self->mParameters);
  -[MREffect setIsFocuser:](-[MRLayerEffect effect](v8, "effect"), "setIsFocuser:", 1LL);
  self->mInternal->mSlideFocuser[1] = v8;
  -[MRLayerEffect setKenBurnsType:ofSlide:](v8, "setKenBurnsType:ofSlide:", 0LL, @"image0");
  -[MRLayerNavigator setSublayer:forKey:](v5, "setSublayer:forKey:", v8, @"SlideFocuser1");
  id v9 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( &OBJC_CLASS___MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  0LL,  @"Push");
  [v9 setTransitionDestinationPlugID:@"SlideFocuser1"];
  [v9 setTransitionDuration:0.5];
  [v9 setTransitionAttributes:&off_26F790];
  uint64_t v10 = -[MRLayerEffect initWithEffectID:andParameters:]( objc_alloc(&OBJC_CLASS___MRLayerEffect),  "initWithEffectID:andParameters:",  @"JustASlide",  self->mParameters);
  -[MREffect setIsFocuser:](-[MRLayerEffect effect](v10, "effect"), "setIsFocuser:", 1LL);
  self->mInternal->mSlideFocuser[2] = v10;
  -[MRLayerEffect setKenBurnsType:ofSlide:](v10, "setKenBurnsType:ofSlide:", 0LL, @"image0");
  -[MRLayerNavigator setSublayer:forKey:](v5, "setSublayer:forKey:", v10, @"SlideFocuser2");
  id v11 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:]( &OBJC_CLASS___MCTransitionTrigger,  "transitionForTargetPlugObjectID:withTransitionID:",  0LL,  @"Push");
  [v11 setTransitionDestinationPlugID:@"SlideFocuser2"];
  [v11 setTransitionDuration:0.5];
  [v11 setTransitionAttributes:&off_26F7B8];
  -[MRLayer setNextTransition:](v8, "setNextTransition:", v11);
  -[MRLayer setPreviousTransition:](v6, "setPreviousTransition:", v11);
  -[MRLayer setNextTransition:](v10, "setNextTransition:", v7);
  -[MRLayer setPreviousTransition:](v8, "setPreviousTransition:", v7);
  -[MRLayer setNextTransition:](v6, "setNextTransition:", v9);
  -[MRLayer setPreviousTransition:](v10, "setPreviousTransition:", v9);
}

- (double)enterSlideFocusModeWithState:(id)a3 animate:(BOOL)a4
{
  double v4 = 0.0;
  if (!self->mInternal->mSlideFocusState)
  {
    BOOL v5 = a4;
    if (objc_msgSend(objc_msgSend(a3, "delegate"), "enterSlideFocusModeWithState:", a3))
    {
      self->mInternal->mSlideFocusState = (MRSlideFocusState *)a3;
      mSlideFocusLayer = self->mInternal->mSlideFocusLayer;
      if (!mSlideFocusLayer)
      {
        -[MRRenderer _createSlideFocusLayer](self, "_createSlideFocusLayer");
        mSlideFocusLayer = self->mInternal->mSlideFocusLayer;
      }

      -[MRLayer setIsTriggered:](mSlideFocusLayer, "setIsTriggered:", 1LL);
      double v9 = self->mSize.height / self->mSize.width;
      uint64_t v10 = -[MRSlideFocusState slideInfo](self->mInternal->mSlideFocusState, "slideInfo");
      id v11 = -[MRSlideInfo assetPath](v10, "assetPath");
      double v12 = self->mSize.width / self->mSize.height;
      -[MRSlideInfo aspectRatio](v10, "aspectRatio");
      double v14 = v13;
      -[MRSlideInfo center](v10, "center");
      double v16 = v15;
      double v18 = v17;
      -[MRSlideInfo scale](v10, "scale");
      double v20 = v19;
      double v21 = (1.0 - v16 / v19) * 0.5;
      double v22 = (1.0 - v14 / v12 * v18 / v19) * 0.5;
      -[MRSlideInfo rotation](v10, "rotation");
      double v24 = v23;
      double v25 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
      -[MRLayerEffect setPixelSize:](v25, "setPixelSize:", self->mSize.width, self->mSize.height);
      -[MRLayerEffect setAssetPath:ofSlide:](v25, "setAssetPath:ofSlide:", v11, @"image0");
      if (-[MZMediaManagement isSupportedMovieForAssetAtPath:]( -[MRRenderer assetManagementDelegate](self, "assetManagementDelegate"),  "isSupportedMovieForAssetAtPath:",  v11)) {
        -[MRLayerEffect setPlayerHint:ofSlide:]( v25,  "setPlayerHint:ofSlide:",  -[MRSlideInfo player](v10, "player"),  @"image0");
      }
      -[MRLayerEffect setCenter:ofSlide:](v25, "setCenter:ofSlide:", @"image0", v21, v22);
      -[MRLayerEffect setScale:ofSlide:](v25, "setScale:ofSlide:", @"image0", v20);
      -[MRSlideInfo aspectRatio](v10, "aspectRatio");
      -[MRLayerEffect setMaxScale:ofSlide:](v25, "setMaxScale:ofSlide:", @"image0", fmax(v9 * (v26 + v26), 2.0));
      -[MRLayerEffect setRotation:ofSlide:](v25, "setRotation:ofSlide:", @"image0", v24);
      double v27 = -[MRSlideFocusState previousSlideInfo](self->mInternal->mSlideFocusState, "previousSlideInfo");
      unint64_t v28 = self->mInternal->mSlideFocuser[(self->mInternal->mCurrentSlideFocuserIndex + 2) % 3];
      -[MRLayerEffect setPixelSize:](v28, "setPixelSize:", self->mSize.width, self->mSize.height);
      -[MRLayerEffect setAssetPath:ofSlide:]( v28,  "setAssetPath:ofSlide:",  -[MRSlideInfo assetPath](v27, "assetPath"),  @"image0");
      if (-[MZMediaManagement isSupportedMovieForAssetAtPath:]( -[MRRenderer assetManagementDelegate](self, "assetManagementDelegate"),  "isSupportedMovieForAssetAtPath:",  -[MRSlideInfo assetPath](v27, "assetPath"))) {
        -[MRLayerEffect setPlayerHint:ofSlide:]( v28,  "setPlayerHint:ofSlide:",  -[MRSlideInfo player](v27, "player"),  @"image0");
      }
      -[MRLayerEffect setCenter:ofSlide:](v28, "setCenter:ofSlide:", @"image0", 0.5, 0.5);
      -[MRSlideInfo aspectRatio](v27, "aspectRatio");
      double v30 = v29 / v12;
      if (v30 > 1.0) {
        double v30 = 1.0;
      }
      -[MRLayerEffect setScale:ofSlide:](v28, "setScale:ofSlide:", @"image0", v30);
      -[MRSlideInfo aspectRatio](v27, "aspectRatio");
      -[MRLayerEffect setMaxScale:ofSlide:](v28, "setMaxScale:ofSlide:", @"image0", fmax(v9 * (v31 + v31), 2.0));
      -[MRLayerEffect setRotation:ofSlide:](v28, "setRotation:ofSlide:", @"image0", 0.0);
      double v32 = -[MRSlideFocusState nextSlideInfo](self->mInternal->mSlideFocusState, "nextSlideInfo");
      double v33 = self->mInternal->mSlideFocuser[(self->mInternal->mCurrentSlideFocuserIndex + 1) % 3];
      -[MRLayerEffect setPixelSize:](v33, "setPixelSize:", self->mSize.width, self->mSize.height);
      -[MRLayerEffect setAssetPath:ofSlide:]( v33,  "setAssetPath:ofSlide:",  -[MRSlideInfo assetPath](v32, "assetPath"),  @"image0");
      if (-[MZMediaManagement isSupportedMovieForAssetAtPath:]( -[MRRenderer assetManagementDelegate](self, "assetManagementDelegate"),  "isSupportedMovieForAssetAtPath:",  -[MRSlideInfo assetPath](v32, "assetPath"))) {
        -[MRLayerEffect setPlayerHint:ofSlide:]( v33,  "setPlayerHint:ofSlide:",  -[MRSlideInfo player](v32, "player"),  @"image0");
      }
      double v4 = 0.5;
      -[MRLayerEffect setCenter:ofSlide:](v33, "setCenter:ofSlide:", @"image0", 0.5, 0.5);
      -[MRSlideInfo aspectRatio](v32, "aspectRatio");
      double v35 = v34 / v12;
      if (v35 > 1.0) {
        double v35 = 1.0;
      }
      -[MRLayerEffect setScale:ofSlide:](v33, "setScale:ofSlide:", @"image0", v35);
      -[MRSlideInfo aspectRatio](v32, "aspectRatio");
      -[MRLayerEffect setMaxScale:ofSlide:](v33, "setMaxScale:ofSlide:", @"image0", fmax(v9 * (v36 + v36), 2.0));
      -[MRLayerEffect setRotation:ofSlide:](v33, "setRotation:ofSlide:", @"image0", 0.0);
      -[MRLayerParallelizer phaseInSublayerForKey:]( self->mTopMRLayer,  "phaseInSublayerForKey:",  @"SlideFocusLayer");
      -[MRLayer setOpacity:](self->mInternal->mSlideFocusLayer, "setOpacity:", 0.001);
      if (v5) {
        -[MRRenderer animateCurrentFocuserToSlideFocusModeWithDuration:]( self,  "animateCurrentFocuserToSlideFocusModeWithDuration:",  0.5);
      }
      -[MRRenderer sendNotification:](self, "sendNotification:", kMRNotificationEnteredSlideFocusMode[0]);
    }
  }

  return v4;
}

- (double)exitSlideFocusMode
{
  double v3 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
  id v4 = -[MRLayerEffect currentSlideInfoForElement:](v3, "currentSlideInfoForElement:", @"image0");
  id v5 = [v4 player];
  if (v5 == -[MRSlideInfo player]( -[MRSlideFocusState slideInfo](self->mInternal->mSlideFocusState, "slideInfo"),  "player"))
  {
    [v4 time];
    double v7 = v6;
    -[MRSlideInfo time](-[MRSlideFocusState slideInfo](self->mInternal->mSlideFocusState, "slideInfo"), "time");
    -[MRSlideInfo setTime:]( -[MRSlideFocusState slideInfo](self->mInternal->mSlideFocusState, "slideInfo"),  "setTime:",  v7 - v8);
  }

  -[MRLayer exitSlideFocusModeWithState:]( -[MRSlideFocusState delegate](self->mInternal->mSlideFocusState, "delegate"),  "exitSlideFocusModeWithState:",  self->mInternal->mSlideFocusState);
  double v9 = -[MRSlideFocusState slideInfo](self->mInternal->mSlideFocusState, "slideInfo");
  CGFloat v10 = self->mSize.width / self->mSize.height;
  -[MRSlideInfo aspectRatio](v9, "aspectRatio");
  double v12 = v11;
  -[MRSlideInfo center](v9, "center");
  double v14 = v13;
  double v16 = v15;
  -[MRSlideInfo scale](v9, "scale");
  double v18 = v17;
  double v19 = v12 / v10 * v16;
  double v20 = (1.0 - v14 / v18) * 0.5;
  double v21 = (1.0 - v19 / v18) * 0.5;
  -[MRSlideInfo rotation](v9, "rotation");
  double v23 = v22;
  -[MRLayerEffect animateCenterOfSlide:to:withDuration:]( v3,  "animateCenterOfSlide:to:withDuration:",  @"image0",  v20,  v21,  0.5);
  -[MRLayerEffect animateScaleOfSlide:to:withDuration:]( v3,  "animateScaleOfSlide:to:withDuration:",  @"image0",  v18,  0.5);
  -[MRLayerEffect animateRotationOfSlide:to:withDuration:]( v3,  "animateRotationOfSlide:to:withDuration:",  @"image0",  v23,  0.5);
  -[MRLayer animateOpacityTo:withDuration:]( self->mInternal->mSlideFocusLayer,  "animateOpacityTo:withDuration:",  0.0,  0.5);
  -[MRLayerParallelizer phaseOutSublayerForKey:](self->mTopMRLayer, "phaseOutSublayerForKey:", @"SlideFocusLayer");
  dispatch_time_t v24 = dispatch_time(0LL, 550000000LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_44E50;
  block[3] = &unk_24D5B0;
  block[4] = self;
  dispatch_after(v24, &_dispatch_main_q, block);
  -[MRRenderer sendNotification:](self, "sendNotification:", kMRNotificationExitedSlideFocusMode[0]);

  self->mInternal->mSlideFocusState = 0LL;
  return 0.5;
}

- (double)enterSlideZoomMode
{
  return 0.0;
}

- (double)exitSlideZoomMode:(BOOL)a3
{
  BOOL v3 = a3;
  -[MRSlideFocusState setIsInZoomMode:](self->mInternal->mSlideFocusState, "setIsInZoomMode:", 0LL);
  double v5 = 0.0;
  if (v3) {
    double v5 = 0.5;
  }
  -[MRRenderer animateCurrentFocuserToSlideFocusModeWithDuration:]( self,  "animateCurrentFocuserToSlideFocusModeWithDuration:",  v5);
  return result;
}

- (double)animateCurrentFocuserToSlideFocusModeWithDuration:(double)a3
{
  double v5 = -[MRSlideFocusState slideInfo](self->mInternal->mSlideFocusState, "slideInfo");
  CGFloat v6 = self->mSize.width / self->mSize.height;
  -[MRSlideInfo aspectRatio](v5, "aspectRatio");
  double v7 = &(&self->mInternal->super.isa)[self->mInternal->mCurrentSlideFocuserIndex];
  Class v8 = v7[40];
  double v10 = v9 / v6;
  if (v10 <= 1.0) {
    double v11 = v10;
  }
  else {
    double v11 = 1.0;
  }
  Class v12 = v7[40];
  if (a3 <= 0.0)
  {
    -[objc_class setCenter:ofSlide:](v12, "setCenter:ofSlide:", @"image0", 0.5, 0.5);
    -[objc_class setScale:ofSlide:](v8, "setScale:ofSlide:", @"image0", v11);
    a3 = 0.0;
    -[objc_class setRotation:ofSlide:](v8, "setRotation:ofSlide:", @"image0", 0.0);
    -[MRLayer setOpacity:](self->mInternal->mSlideFocusLayer, "setOpacity:", 1.0);
  }

  else
  {
    -[objc_class animateCenterOfSlide:to:withDuration:]( v12,  "animateCenterOfSlide:to:withDuration:",  @"image0",  0.5,  0.5,  a3);
    -[objc_class animateScaleOfSlide:to:withDuration:]( v8,  "animateScaleOfSlide:to:withDuration:",  @"image0",  v11,  a3);
    -[objc_class animateRotationOfSlide:to:withDuration:]( v8,  "animateRotationOfSlide:to:withDuration:",  @"image0",  0.0,  a3);
    -[MRLayer animateOpacityTo:withDuration:]( self->mInternal->mSlideFocusLayer,  "animateOpacityTo:withDuration:",  1.0,  a3);
  }

  return a3;
}

- (id)slideInfoForCurrentElement:(id)a3
{
  uint64_t v7 = 0LL;
  Class v8 = &v7;
  uint64_t v9 = 0x3052000000LL;
  double v10 = sub_40F20;
  double v11 = sub_40F30;
  uint64_t v12 = 0LL;
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_450DC;
  v6[3] = &unk_24DB98;
  v6[5] = a3;
  void v6[6] = &v7;
  v6[4] = self;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v6);
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)slideInfosForCurrentElements
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000LL;
  uint64_t v9 = sub_40F20;
  double v10 = sub_40F30;
  uint64_t v11 = 0LL;
  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_451E0;
  v5[3] = &unk_24DAD0;
  v5[4] = self;
  void v5[5] = &v6;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v5);
  BOOL v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)sendNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_45278;
  v3[3] = &unk_24D9B8;
  v3[4] = a3;
  void v3[5] = self;
  dispatch_async(&_dispatch_main_q, v3);
}

- (id)chooseTransitionIDForRandomTransitionPresetID:(id)a3
{
  id v5 = -[MRFeatureDelegate descriptionForRandomTransitionPresetID:]( -[MRRenderer featureDelegate](self, "featureDelegate"),  "descriptionForRandomTransitionPresetID:",  a3);
  if (v5) {
    goto LABEL_5;
  }
  mDescriptionsForRandomTransitionPresetIDs = self->mDescriptionsForRandomTransitionPresetIDs;
  if (!mDescriptionsForRandomTransitionPresetIDs)
  {
    uint64_t v7 = objc_alloc(&OBJC_CLASS___NSDictionary);
    mDescriptionsForRandomTransitionPresetIDs = -[NSDictionary initWithContentsOfFile:]( v7,  "initWithContentsOfFile:",  -[NSBundle pathForResource:ofType:]( +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(self, v8)),  "pathForResource:ofType:",  @"TemporaryRandomTransitionDescriptions",  @"plist"));
    self->mDescriptionsForRandomTransitionPresetIDs = mDescriptionsForRandomTransitionPresetIDs;
  }

  id v5 = -[NSDictionary objectForKey:](mDescriptionsForRandomTransitionPresetIDs, "objectForKey:", a3);
  if (!v5) {
    return 0LL;
  }
LABEL_5:
  id v9 = [v5 objectForKey:@"transitionPresetIDs"];
  id v10 = objc_msgSend(v9, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v9, "count"));
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSString, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) == 0) {
    return objc_msgSend(v10, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v10, "count"));
  }
  return v10;
}

- (void)_adaptToPressureLevel:(int)a3
{
  if (a3 <= 29)
  {
    if (a3)
    {
      if (a3 != 20) {
        return;
      }
      double v3 = 0.0333333333;
    }

    else
    {
      double v3 = 0.0166666667;
    }

    goto LABEL_10;
  }

  if (a3 == 30 || a3 == 40 || a3 == 50)
  {
    double v3 = 0.05;
LABEL_10:
    self->double mTimeQuantum = v3;
  }

- (void)_startMonitoringThermalPressureLevelChanges
{
  int out_token = 0;
  if (!notify_register_check(kOSThermalNotificationPressureLevelName, &out_token))
  {
    uint64_t state64 = 0LL;
    notify_get_state(out_token, &state64);
    NSLog(@"Initial thermal pressure level is %llu", state64);
    -[MRRenderer _adaptToPressureLevel:](self, "_adaptToPressureLevel:", state64);
    notify_cancel(out_token);
  }

  mRenderDispatchQueue = (dispatch_queue_s *)self->mInternal->mRenderDispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_454F0;
  handler[3] = &unk_24DBC0;
  handler[4] = self;
  uint64_t v4 = notify_register_dispatch( kOSThermalNotificationPressureLevelName,  &self->_thermalNotificationToken,  mRenderDispatchQueue,  handler);
  if ((_DWORD)v4) {
    NSLog(@"notify_register_dispatch failed (%u) for kOSThermalNotificationPressureLevelName", v4);
  }
}

- (void)_stopMonitoringThermalPressureLevelChanges
{
  int thermalNotificationToken = self->_thermalNotificationToken;
  if (thermalNotificationToken)
  {
    notify_cancel(thermalNotificationToken);
    self->_int thermalNotificationToken = 0;
  }

- (void)processAudioObjects
{
  double v4 = v3;
  -[MCMontage audioFadeOutDuration](self->mMontage, "audioFadeOutDuration");
  double v6 = v5;
  -[MRRenderer volume](self, "volume");
  double v8 = v7;
  if (v6 > 0.0)
  {
    -[MCPlug fullDuration](-[MCMontage rootPlug](self->mMontage, "rootPlug"), "fullDuration");
    double v10 = (v9 - v4) / v6;
    if (v10 > 1.0) {
      double v10 = 1.0;
    }
    double v8 = v10 * v8;
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  mInternal = self->mInternal;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id obj = -[NSArray reverseObjectEnumerator](mInternal->mAudioPlayerSortedBuckets, "reverseObjectEnumerator");
  id v33 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
  if (v33)
  {
    uint64_t v32 = *(void *)v39;
    float v12 = 1.0;
    do
    {
      for (i = 0LL; i != v33; i = (char *)i + 1)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        id v15 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v35;
          float v18 = 1.0;
          do
          {
            for (j = 0LL; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v35 != v17) {
                objc_enumerationMutation(v14);
              }
              double v20 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)j);
              [v20 currentDuckLevel];
              float v23 = v22;
              if (v18 > v23) {
                float v18 = v23;
              }
              uint64_t v24 = objc_opt_class(&OBJC_CLASS___MRAudioPlayer, v21);
              if ((objc_opt_isKindOfClass(v20, v24) & 1) != 0)
              {
                if ([v20 shouldBePlaying])
                {
                  [v20 processWithDuckLevel:v8 * v12];
                  id v25 = [v20 avPlayer];
                  if (self->mInternal->mInnerIsPlaying)
                  {
                    double v26 = v25;
                    [v25 rate];
                    if (v27 == 0.0) {
                      [v26 play];
                    }
                  }
                }
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }

          while (v16);
        }

        else
        {
          float v18 = 1.0;
        }

        if (v18 < v12) {
          float v12 = v18;
        }
      }

      id v33 = -[NSEnumerator countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v38,  v43,  16LL);
    }

    while (v33);
  }

  else
  {
    float v12 = 1.0;
  }

  unint64_t v28 = -[MRRenderer renderingDelegate](self, "renderingDelegate");
  if ((objc_opt_respondsToSelector(v28, "setAudioFadingLevel:andDuckingLevel:") & 1) != 0)
  {
    *(float *)&double v29 = v8;
    *(float *)&double v30 = v12;
    -[MRRenderingDelegate setAudioFadingLevel:andDuckingLevel:](v28, "setAudioFadingLevel:andDuckingLevel:", v29, v30);
  }

- (void)addAudioObject:(id)a3
{
  if (!-[MRRenderer ignoresBackgroundAudio](self, "ignoresBackgroundAudio")
    || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___MRAudioPlayer, v5), (objc_opt_isKindOfClass(a3, v6) & 1) == 0))
  {
    float v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 priority]);
    double v8 = (NSMutableSet *)-[NSMutableDictionary objectForKey:](self->mInternal->mAudioPlayerBuckets, "objectForKey:", v7);
    if (!v8)
    {
      double v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      mAudioPlayerBuckets = self->mInternal->mAudioPlayerBuckets;
      if (!mAudioPlayerBuckets)
      {
        self->mInternal->mAudioPlayerBuckets = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        mAudioPlayerBuckets = self->mInternal->mAudioPlayerBuckets;
      }

      -[NSMutableDictionary setObject:forKey:](mAudioPlayerBuckets, "setObject:forKey:", v8, v7);

      self->mInternal->mAudioPlayerSortedBuckets = (NSArray *) -[NSMutableDictionary objectsForKeys:notFoundMarker:]( self->mInternal->mAudioPlayerBuckets,  "objectsForKeys:notFoundMarker:",  objc_msgSend( -[NSMutableDictionary allKeys]( self->mInternal->mAudioPlayerBuckets,  "allKeys"),  "sortedArrayUsingSelector:",  "compare:"),  +[NSNull null](NSNull, "null"));
    }

    -[NSMutableSet addObject:](v8, "addObject:", a3);
  }

- (void)removeAudioObject:(id)a3
{
  id v4 = -[NSMutableDictionary objectForKey:]( self->mInternal->mAudioPlayerBuckets,  "objectForKey:",  +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 priority]));
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = objc_opt_class(&OBJC_CLASS___MRAudioPlayer, v5);
    if ((objc_opt_isKindOfClass(a3, v7) & 1) != 0) {
      objc_msgSend(objc_msgSend(a3, "avPlayer"), "pause");
    }
    [v6 removeObject:a3];
  }

@end