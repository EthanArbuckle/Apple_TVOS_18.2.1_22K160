@interface VISWrapper
- (BOOL)flipHorizontalOrientationEnabled;
- (BOOL)longPressModeEnabled;
- (VISConfiguration)configuration;
- (VISWrapperDelegate)delegate;
- (int)_updateConfiguration;
- (int)enqueueBufferForProcessing:(opaqueCMSampleBuffer *)a3;
- (int)finishProcessing;
- (int)prepareToProcess;
- (int)purgeResources;
- (void)didCompleteRenderingOfBuffer:(__CVBuffer *)a3 withStatus:(int)a4;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3;
- (void)setLongPressModeEnabled:(BOOL)a3;
@end

@implementation VISWrapper

- (int)prepareToProcess
{
  if (self->_buffersEnqueued)
  {
    v4 = 0LL;
    int v54 = -12782;
    goto LABEL_27;
  }

  if (!self->_configuration)
  {
    v4 = 0LL;
    int v54 = -12780;
    goto LABEL_27;
  }

  p_sbpRef = &self->_sbpRef;
  if (self->_sbpRef)
  {
    sbp_gvs_invalidate();
    if (*p_sbpRef)
    {
      CFRelease(*p_sbpRef);
      *p_sbpRef = 0LL;
    }
  }

  v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (!v4) {
    goto LABEL_28;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[VISConfiguration extendedOutputRowsToFill](self->_configuration, "extendedOutputRowsToFill")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v5,  kFigVideoStabilizationSampleBufferProcessorOption_NumberOfExtendedRowsOfOutputBufferToFill);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration inputPixelBufferAttributes](self->_configuration, "inputPixelBufferAttributes"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v6,  kFigVideoStabilizationSampleBufferProcessorOption_InputPixelBufferAttributes);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration outputPixelBufferAttributes](self->_configuration, "outputPixelBufferAttributes"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v7,  kFigVideoStabilizationSampleBufferProcessorOption_OutputPixelBufferAttributes);

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  dword_37670[(int)-[VISConfiguration transformPlatform](self->_configuration, "transformPlatform")]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v8,  kFigVideoStabilizationSampleBufferProcessorOption_TransformPlatform);

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration blurBorderPixels](self->_configuration, "blurBorderPixels")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v9,  kFigVideoStabilizationSampleBufferProcessorOption_BlurBorderPixels);

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  dword_37680[(int)-[VISConfiguration smoothingMethod](self->_configuration, "smoothingMethod")]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v10,  kFigVideoStabilizationSampleBufferProcessorOption_SmoothingMethod);

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  dword_37698[(int)-[VISConfiguration motionBlurShimmerMitigationMethod]( self->_configuration,  "motionBlurShimmerMitigationMethod")]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v11,  kFigVideoStabilizationSampleBufferProcessorOption_MotionBlurShimmerMitigationMethod);

  id v12 = -[VISConfiguration ispProcessingSession](self->_configuration, "ispProcessingSession");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v12,  kFigVideoStabilizationSampleBufferProcessorOption_IspProcessingSession);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration sphereCorrectionEnabled](self->_configuration, "sphereCorrectionEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v13,  kFigVideoStabilizationSampleBufferProcessorOption_EnableSphereCorrection);

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration useISPMotionData](self->_configuration, "useISPMotionData")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v14,  kFigVideoStabilizationSampleBufferProcessorOption_UseISPMotionData);

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[VISConfiguration cinematicLookAheadFrameCount]( self->_configuration,  "cinematicLookAheadFrameCount")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v15,  kFigVideoStabilizationSampleBufferProcessorOption_CinematicLookAheadFrameCount);

  -[VISConfiguration cinematicLookAheadTime](self->_configuration, "cinematicLookAheadTime");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v16,  kFigVideoStabilizationSampleBufferProcessorOption_CinematicLookAheadTime);

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration attachStabilizedOutputCameraTrajectory]( self->_configuration,  "attachStabilizedOutputCameraTrajectory")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v17,  kFigVideoStabilizationSampleBufferProcessorOption_AttachStabilizedOutputCameraTrajectory);

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration attachStabilizedTrajectoryHomography]( self->_configuration,  "attachStabilizedTrajectoryHomography")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v18,  kFigVideoStabilizationSampleBufferProcessorOption_AttachStabilizedTrajectoryHomography);

  v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration attachEstimatedMotionVector](self->_configuration, "attachEstimatedMotionVector")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v19,  kFigVideoStabilizationSampleBufferProcessorOption_AttachEstimatedMotionVector);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration onlyGenerateTransformsParameters]( self->_configuration,  "onlyGenerateTransformsParameters")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v20,  kFigVideoStabilizationSampleBufferProcessorOption_OnlyGenerateTransformsParameters);

  -[VISConfiguration minDistanceForBravoParallaxShift](self->_configuration, "minDistanceForBravoParallaxShift");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v21,  kFigVideoStabilizationSampleBufferProcessorOption_MinDistanceForBravoParallaxShift);

  v22 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration distortionCorrectionEnabledPortTypes]( self->_configuration,  "distortionCorrectionEnabledPortTypes"));
  id v23 = [v22 count];

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration distortionCorrectionEnabledPortTypes]( self->_configuration,  "distortionCorrectionEnabledPortTypes"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v24,  kFigVideoStabilizationSampleBufferProcessorOption_DistortionCorrectionEnabledPortTypes);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration distortionCompensationEnabledPortTypes]( self->_configuration,  "distortionCompensationEnabledPortTypes"));
  id v26 = [v25 count];

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration distortionCompensationEnabledPortTypes]( self->_configuration,  "distortionCompensationEnabledPortTypes"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v27,  kFigVideoStabilizationSampleBufferProcessorOption_DistortionCompensationEnabledPortTypes);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration videoSTFParameters](self->_configuration, "videoSTFParameters"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v28,  kFigVideoStabilizationSampleBufferProcessorOption_VideoSTFParameters);

  v29 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration videoGreenGhostMitigationParameters]( self->_configuration,  "videoGreenGhostMitigationParameters"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v29,  kFigVideoStabilizationSampleBufferProcessorOption_VideoGreenGhostMitigationParameters);

  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[VISConfiguration gpuPriority](self->_configuration, "gpuPriority")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v30,  kFigCaptureSampleBufferProcessorOption_GpuPriority);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration metalCommandQueue](self->_configuration, "metalCommandQueue"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v31,  kFigCaptureSampleBufferProcessorOption_MetalCommandQueue);

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  -[VISConfiguration metalSubmissionAndCompletionQueuePriority]( self->_configuration,  "metalSubmissionAndCompletionQueuePriority")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v32,  kFigCaptureSampleBufferProcessorOption_MetalSubmissionAndCompletionQueuePriority);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration emitSampleBufferSemaphore](self->_configuration, "emitSampleBufferSemaphore"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v33,  kFigCaptureSampleBufferProcessorProperty_PixelBufferPoolAllocationSemaphore);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration sensorIDDict](self->_configuration, "sensorIDDict"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v34,  kFigCaptureSampleBufferProcessorOption_SensorIDDictionary);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration cameraInfoByPortType](self->_configuration, "cameraInfoByPortType"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v35,  kFigCaptureSampleBufferProcessorOption_CameraInfoByPortType);

  -[VISConfiguration horizonCorrectionThreshold](self->_configuration, "horizonCorrectionThreshold");
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:"));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v36,  kFigVideoStabilizationSampleBufferProcessorOption_HorizonCorrectionThreshold);

  v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( &OBJC_CLASS___NSNumber,  "numberWithInt:",  -[VISConfiguration horizonCorrectionMode](self->_configuration, "horizonCorrectionMode")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v37,  kFigVideoStabilizationSampleBufferProcessorOption_HorizonCorrectionMode);

  v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration zoomSmoothingEnabled](self->_configuration, "zoomSmoothingEnabled")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v38,  kFigVideoStabilizationSampleBufferProcessorOption_ZoomSmoothingEnabled);

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration applyFrameCropOffset](self->_configuration, "applyFrameCropOffset")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v39,  kFigVideoStabilizationSampleBufferProcessorOption_ApplyFrameCropOffset);

  v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration enableRollingShutterCorrectionOnly]( self->_configuration,  "enableRollingShutterCorrectionOnly")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v40,  kFigVideoStabilizationSampleBufferProcessorOption_EnableRollingShutterCorrectionOnly);

  v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration disableTransformLimitsForPredeterminedTrajectory]( self->_configuration,  "disableTransformLimitsForPredeterminedTrajectory")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v41,  kFigVideoStabilizationSampleBufferProcessorOption_DisableTransformLimitsForPredeterminedTrajectory);

  v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[VISConfiguration useCameraGeometry](self->_configuration, "useCameraGeometry")));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  v42,  kFigVideoStabilizationSampleBufferProcessorOption_UseCameraGeometry);

  -[VISConfiguration livePhotoCleanOutputRect](self->_configuration, "livePhotoCleanOutputRect");
  if (!CGRectIsEmpty(v69))
  {
    -[VISConfiguration livePhotoCleanOutputRect](self->_configuration, "livePhotoCleanOutputRect");
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v70);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v4,  "setObject:forKeyedSubscript:",  CFAutorelease(DictionaryRepresentation),  kFigVideoStabilizationSampleBufferProcessorOption_LivePhotoCleanOutputRect);
  }

  int v44 = FigSampleBufferProcessorCreateForGyroVideoStabilization( (const __CFDictionary *)v4,  (const char *)&self->_sbpRef);
  if (v44)
  {
    int v54 = v44;
    uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    int v66 = v54;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10173LL,  v66);
    goto LABEL_27;
  }

  v45 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  pixelBuffersRendered = self->_pixelBuffersRendered;
  self->_pixelBuffersRendered = v45;

  if (!self->_pixelBuffersRendered) {
    goto LABEL_28;
  }
  v47 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  pixelBuffersProcessed = self->_pixelBuffersProcessed;
  self->_pixelBuffersProcessed = v47;

  if (!self->_pixelBuffersProcessed
    || (v49 = objc_alloc_init(&OBJC_CLASS___NSMutableArray),
        sampleBuffersProcessed = self->_sampleBuffersProcessed,
        self->_sampleBuffersProcessed = v49,
        sampleBuffersProcessed,
        !self->_sampleBuffersProcessed)
    || !self->_pixelBuffersLock
    && (v51 = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate(), (self->_pixelBuffersLock = v51) == 0LL))
  {
LABEL_28:
    int v54 = -12786;
    goto LABEL_27;
  }

  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(*p_sbpRef);
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    int v53 = FigSignalErrorAt(4294954511LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    if (v53)
    {
      int v54 = v53;
      uint64_t v55 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      int v65 = v54;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v55,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10191LL,  v65);
      goto LABEL_27;
    }
  }

  else
  {
    *(void *)uint64_t DerivedStorage = _sampleBufferImagePreStabilizationCallback;
  }

  int v56 = sbp_gvs_setPostOutputCallback((uint64_t)self->_sbpRef, (uint64_t)_sampleBufferImageReadyCallback, (uint64_t)self);
  if (v56)
  {
    int v54 = v56;
    uint64_t v63 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    int v67 = v54;
    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v63,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10194LL,  v67);
  }

  else
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration cameraExtrinsicMatrix](self->_configuration, "cameraExtrinsicMatrix"));

    if (v57
      && (sbpRef = self->_sbpRef,
          v59 = (const void *)kFigVideoStabilizationSampleBufferProcessorProperty_IMUToCameraExtrinsic,
          v60 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue( -[VISConfiguration cameraExtrinsicMatrix]( self->_configuration,  "cameraExtrinsicMatrix")),  int v54 = sbp_gvs_setProperty((uint64_t)sbpRef, v59, v60),  v60,  v54))
    {
      uint64_t v64 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      int v68 = v54;
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v64,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10199LL,  v68);
    }

    else
    {
      int v54 = 0;
      *(_WORD *)&self->_buffersEnqueued = 0;
    }
  }

- (int)enqueueBufferForProcessing:(opaqueCMSampleBuffer *)a3
{
  if (self->_sbpRef)
  {
    if (self->_configuration)
    {
      if (a3)
      {
        uint64_t v6 = -[VISWrapper _updateConfiguration](self, "_updateConfiguration");
        if ((_DWORD)v6)
        {
          uint64_t v7 = v6;
          uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10232LL,  v7);
        }

        else
        {
          uint64_t v7 = sbp_gvs_processSampleBuffer((uint64_t)self->_sbpRef, a3);
          if (!(_DWORD)v7)
          {
            self->_buffersEnqueued = 1;
            return v7;
          }

          uint64_t v13 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v13,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10235LL,  v7);
        }

        FigSignalErrorAt(v7, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
        return v7;
      }

      uint64_t v11 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v11,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "inputSampleBuffer",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10229LL,  0);
    }

    else
    {
      uint64_t v10 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v10,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "_configuration",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10228LL,  0);
    }

    uint64_t v9 = 4294954516LL;
  }

  else
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v3, v14, v15, v16, v17, vars0, vars8);
    uint64_t v9 = 4294954514LL;
  }

  return FigSignalErrorAt(v9, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
}

- (int)finishProcessing
{
  sbpRef = self->_sbpRef;
  if (sbpRef)
  {
    self->_finishProcessing = 1;
    uint64_t v5 = sbp_gvs_finishPendingProcessing((uint64_t)sbpRef);
    if ((_DWORD)v5)
    {
      fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", v5, v2, v7, v8, v9, v10, vars0, vars8);
      FigSignalErrorAt(v5, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }

    else
    {
      *(_WORD *)&self->_buffersEnqueued = 0;
      -[NSMutableArray removeAllObjects](self->_pixelBuffersRendered, "removeAllObjects");
      -[NSMutableArray removeAllObjects](self->_pixelBuffersProcessed, "removeAllObjects");
      -[NSMutableArray removeAllObjects](self->_sampleBuffersProcessed, "removeAllObjects");
    }
  }

  else
  {
    LODWORD(v5) = 0;
  }

  return v5;
}

- (int)purgeResources
{
  if (self->_sbpRef)
  {
    self->_buffersEnqueued = 0;
    sbp_gvs_invalidate();
    sbpRef = self->_sbpRef;
    if (sbpRef)
    {
      CFRelease(sbpRef);
      self->_sbpRef = 0LL;
    }

    if (self->_pixelBuffersLock)
    {
      FigSimpleMutexDestroy();
      self->_pixelBuffersLock = 0LL;
    }
  }

  return 0;
}

- (int)_updateConfiguration
{
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage(self->_sbpRef);
  if (!DerivedStorage) {
    return -12782;
  }
  uint64_t v4 = DerivedStorage;
  configuration = self->_configuration;
  if (!configuration) {
    return -12780;
  }
  if (*(_BYTE *)(v4 + 32))
  {
    *(_BYTE *)(v4 + 84) = -[VISConfiguration videoStabilizationDisabled]( configuration,  "videoStabilizationDisabled");
    if (!-[VISConfiguration sphereVideoEnabled](self->_configuration, "sphereVideoEnabled")
      || *(_BYTE *)(v4 + 28105))
    {
      *(_BYTE *)(v4 + 28104) = -[VISConfiguration sphereVideoEnabled]( self->_configuration,  "sphereVideoEnabled");
      if (*(_BYTE *)(v4 + 288))
      {
        int v6 = sbp_enableLongPressMode(v4, self->_longPressModeEnabled);
        if (v6)
        {
          int v26 = v6;
          uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          int v30 = v26;
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10330LL,  v30);
          return v26;
        }
      }

      [*(id *)(v4 + 48) removeAllObjects];
      uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      v8 = *(void **)(v4 + 48);
      *(void *)(v4 + 48) = v7;

      if (!*(void *)(v4 + 48)) {
        return -12786;
      }
      [*(id *)(v4 + 56) removeAllObjects];
      int v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      uint64_t v10 = *(void **)(v4 + 56);
      *(void *)(v4 + 56) = v9;

      if (!*(void *)(v4 + 56)) {
        return -12786;
      }
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration outputAttachmentsPixelBufferPools]( self->_configuration,  "outputAttachmentsPixelBufferPools"));

      if (v11)
      {
        id v12 = *(void **)(v4 + 48);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration outputAttachmentsPixelBufferPools]( self->_configuration,  "outputAttachmentsPixelBufferPools"));
        [v12 addEntriesFromDictionary:v13];
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration outputAttachmentsAuxAttributes]( self->_configuration,  "outputAttachmentsAuxAttributes"));

      if (v14)
      {
        v15 = *(void **)(v4 + 56);
        int v16 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration outputAttachmentsAuxAttributes]( self->_configuration,  "outputAttachmentsAuxAttributes"));
        [v15 addEntriesFromDictionary:v16];
      }

      if (!*(_BYTE *)(v4 + 29672))
      {
        if (!*(_DWORD *)(v4 + 172))
        {
          int v17 = sbp_enableP3ToBT2020Conversion( v4,  (const char *)-[VISConfiguration p3ToBT2020ConversionEnabled]( self->_configuration,  "p3ToBT2020ConversionEnabled"));
          if (v17)
          {
            int v26 = v17;
            uint64_t v29 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            int v31 = v26;
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v29,  "<<<< GyroVideoStabilizationV2 >>>> Fig",  "err == 0 ",  "bail",  0LL,  "GVSGyroStabilizationV2.m",  10357LL,  v31);
            return v26;
          }
        }

        if (-[VISConfiguration outputPixelBufferPool](self->_configuration, "outputPixelBufferPool")) {
          objc_msgSend( *(id *)(v4 + 48),  "setObject:forKeyedSubscript:",  -[VISConfiguration outputPixelBufferPool](self->_configuration, "outputPixelBufferPool"),  @"OutputBufferPrimary");
        }
        if (-[VISConfiguration outputDepthPixelBufferPool](self->_configuration, "outputDepthPixelBufferPool")) {
          objc_msgSend( *(id *)(v4 + 48),  "setObject:forKeyedSubscript:",  -[VISConfiguration outputDepthPixelBufferPool](self->_configuration, "outputDepthPixelBufferPool"),  @"OutputBufferDepth");
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration outputAuxAttributes](self->_configuration, "outputAuxAttributes"));

        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration outputAuxAttributes](self->_configuration, "outputAuxAttributes"));
          [*(id *)(v4 + 56) setObject:v19 forKeyedSubscript:@"OutputBufferPrimary"];
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration outputDepthAuxAttributes](self->_configuration, "outputDepthAuxAttributes"));

        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[VISConfiguration outputDepthAuxAttributes](self->_configuration, "outputDepthAuxAttributes"));
          [*(id *)(v4 + 56) setObject:v21 forKeyedSubscript:@"OutputBufferDepth"];
        }
      }

      if (-[VISConfiguration frameRateConversionEnabled]( self->_configuration,  "frameRateConversionEnabled")
        && *(_DWORD *)(v4 + 27116) == 1)
      {
        *(_BYTE *)(v4 + 29730) = -[VISConfiguration frameRateConversionEnabled]( self->_configuration,  "frameRateConversionEnabled");
        *(_DWORD *)(v4 + 29740) = 0;
        *(void *)(v4 + 29732) = 0xFFFFFFFFLL;
        *(_WORD *)(v4 + 29748) = 1;
      }

      if (!self->_flipHorizontalOrientationEnabled || !*(_DWORD *)(v4 + 172))
      {
        *(_BYTE *)(v4 + 203) = self->_flipHorizontalOrientationEnabled;
        -[VISConfiguration outputPixelBufferPool](self->_configuration, "outputPixelBufferPool");
        -[VISConfiguration outputDepthPixelBufferPool](self->_configuration, "outputDepthPixelBufferPool");
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        v22 = (void *)objc_claimAutoreleasedReturnValue( -[VISConfiguration outputAttachmentsPixelBufferPools]( self->_configuration,  "outputAttachmentsPixelBufferPools"));
        id v23 = (char *)[v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v23)
        {
          v24 = v23;
          uint64_t v25 = *(void *)v33;
          while (1)
          {
            if (*(void *)v33 != v25) {
              objc_enumerationMutation(v22);
            }
            if (!--v24)
            {
              v24 = (char *)[v22 countByEnumeratingWithState:&v32 objects:v36 count:16];
              if (!v24) {
                break;
              }
            }
          }
        }

        return 0;
      }

      return -12782;
    }

    return -12780;
  }

  return 0;
}

- (void)didCompleteRenderingOfBuffer:(__CVBuffer *)a3 withStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  FigSimpleMutexLock(self->_pixelBuffersLock);
  id v7 = -[NSMutableArray indexOfObject:](self->_pixelBuffersProcessed, "indexOfObject:", a3);
  if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray addObject:](self->_pixelBuffersRendered, "addObject:", a3);
    FigSimpleMutexUnlock(self->_pixelBuffersLock);
  }

  else
  {
    id v8 = v7;
    int v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableArray objectAtIndexedSubscript:]( self->_sampleBuffersProcessed,  "objectAtIndexedSubscript:",  v7));

    if (v9)
    {
      CFRetain(v9);
      -[NSMutableArray removeObjectAtIndex:](self->_sampleBuffersProcessed, "removeObjectAtIndex:", v8);
      -[NSMutableArray removeObjectAtIndex:](self->_pixelBuffersProcessed, "removeObjectAtIndex:", v8);
      FigSimpleMutexUnlock(self->_pixelBuffersLock);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained didCompleteProcessingOfBuffer:v9 withStatus:v4];

      CFRelease(v9);
    }

    else
    {
      -[NSMutableArray removeObjectAtIndex:](self->_sampleBuffersProcessed, "removeObjectAtIndex:", v8);
      -[NSMutableArray removeObjectAtIndex:](self->_pixelBuffersProcessed, "removeObjectAtIndex:", v8);
      FigSimpleMutexUnlock(self->_pixelBuffersLock);
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 didCompleteProcessingOfBuffer:0 withStatus:v4];
    }
  }

- (BOOL)longPressModeEnabled
{
  return self->_longPressModeEnabled;
}

- (void)setLongPressModeEnabled:(BOOL)a3
{
  self->_longPressModeEnabled = a3;
}

- (BOOL)flipHorizontalOrientationEnabled
{
  return self->_flipHorizontalOrientationEnabled;
}

- (void)setFlipHorizontalOrientationEnabled:(BOOL)a3
{
  self->_flipHorizontalOrientationEnabled = a3;
}

- (VISConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (VISWrapperDelegate)delegate
{
  return (VISWrapperDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end