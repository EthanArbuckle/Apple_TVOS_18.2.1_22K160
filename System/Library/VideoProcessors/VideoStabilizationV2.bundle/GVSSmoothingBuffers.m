@interface GVSSmoothingBuffers
- ($01BB1521EC52D44A8E7628F5261DCEC8)appliedCenterAdjustmentInput;
- ($01BB1521EC52D44A8E7628F5261DCEC8)motionBlurAdjustmentInput;
- ($01BB1521EC52D44A8E7628F5261DCEC8)originalQuaternionsInput;
- ($01BB1521EC52D44A8E7628F5261DCEC8)quaternionsInput;
- ($1CAD53D6802C69BA96F959C2B0E5B6C8)cameraMetadataInput;
- (BOOL)_checkInputIsWritable;
- (BOOL)didHaveMotionDataInput;
- (BOOL)isLivePhotoKeyFrameInput;
- (BOOL)isPhysicalTripodInput;
- (GVSQuaternionSmoothingArrays)getQuaternionSmoothingArrays;
- (GVSRollSmoothingArrays)getRollSmoothingArraysForBaseTransform:(SEL)a3;
- (GVSSmoothingAnalysisArrays)getSmoothingAnalysisArrays;
- (GVSSmoothingBuffers)init;
- (GVSZoomSmoothingArrays)getZoomSmoothingArrays;
- (RollPitch)rollPitchInput;
- (ZoomSmoothingMetadata)zoomSmoothingMetadataInput;
- (__n128)horizonQuaternionsInput;
- (__n128)setHorizonQuaternionsInput:(uint64_t)a1;
- (const)originalQuaternions;
- (const)quaternions;
- (double)normalizedInputShiftInput;
- (double)normalizedOutputShiftInput;
- (double)outputFrameTimeInput;
- (float)frameDurationInput;
- (float)frameDurationPrevious;
- (float)rollHorizonTargetInput;
- (int)allocateBufferWithSize:(unint64_t)a3 allocateForRollSmoothing:(BOOL)a4;
- (int)centerIndex;
- (int)count;
- (int)inputIndex;
- (int)size;
- (priorQuaternionAverage)precomputedAveragesInput;
- (unint64_t)serialNumberInput;
- (void)_purgeResources;
- (void)_shiftBuffers;
- (void)commitData;
- (void)dealloc;
- (void)incrementCenter;
- (void)openForNewData;
- (void)reset;
- (void)setAppliedCenterAdjustmentInput:(id)a3;
- (void)setCameraMetadataInput:(id *)a3;
- (void)setDidHaveMotionDataInput:(BOOL)a3;
- (void)setFrameDurationInput:(float)a3;
- (void)setFrameDurationPrevious:(float)a3;
- (void)setIsLivePhotoKeyFrameInput:(BOOL)a3;
- (void)setIsPhysicalTripodInput:(BOOL)a3;
- (void)setMotionBlurAdjustmentInput:(id)a3;
- (void)setNormalizedInputShiftInput:(GVSSmoothingBuffers *)self;
- (void)setNormalizedOutputShiftInput:(GVSSmoothingBuffers *)self;
- (void)setOutputFrameTimeInput:(double)a3;
- (void)setPrecomputedAveragesInput:(priorQuaternionAverage *)a3;
- (void)setRollHorizonTargetInput:(float)a3;
- (void)setRollPitchInput:(RollPitch)a3;
- (void)setSerialNumberInput:(unint64_t)a3;
- (void)setZoomSmoothingMetadataInput:(ZoomSmoothingMetadata *)a3;
@end

@implementation GVSSmoothingBuffers

- (GVSSmoothingBuffers)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___GVSSmoothingBuffers;
  v2 = -[GVSSmoothingBuffers init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[GVSSmoothingBuffers reset](v2, "reset");
  }
  return v3;
}

- (void)_purgeResources
{
  for (uint64_t i = 0LL; i != 7; ++i)
  {
    v4 = (char *)self + i * 8;
    objc_super v5 = self->_quaternions[i];
    if (v5)
    {
      *((void *)v4 + 1) = 0LL;
      free(v5);
    }

    v6 = (void *)*((void *)v4 + 8);
    if (v6)
    {
      *((void *)v4 + 8) = 0LL;
      free(v6);
    }
  }

  zoomSmoothingMetadata = self->_zoomSmoothingMetadata;
  if (zoomSmoothingMetadata)
  {
    self->_zoomSmoothingMetadata = 0LL;
    free(zoomSmoothingMetadata);
  }

  isLivePhotoKeyFrame = self->_isLivePhotoKeyFrame;
  if (isLivePhotoKeyFrame)
  {
    self->_isLivePhotoKeyFrame = 0LL;
    free(isLivePhotoKeyFrame);
  }

  appliedCenterAdjustment = self->_appliedCenterAdjustment;
  if (appliedCenterAdjustment)
  {
    self->_appliedCenterAdjustment = 0LL;
    free(appliedCenterAdjustment);
  }

  motionBlurAdjustment = self->_motionBlurAdjustment;
  if (motionBlurAdjustment)
  {
    self->_motionBlurAdjustment = 0LL;
    free(motionBlurAdjustment);
  }

  frameDuration = self->_frameDuration;
  if (frameDuration)
  {
    self->_frameDuration = 0LL;
    free(frameDuration);
  }

  v12 = *(void **)self->_normalizedInputShift;
  if (v12)
  {
    *(void *)self->_normalizedInputShift = 0LL;
    free(v12);
  }

  v13 = *(void **)self->_normalizedOutputShift;
  if (v13)
  {
    *(void *)self->_normalizedOutputShift = 0LL;
    free(v13);
  }

  cameraMetadata = self->_cameraMetadata;
  if (cameraMetadata)
  {
    self->_cameraMetadata = 0LL;
    free(cameraMetadata);
  }

  didHaveMotionData = self->_didHaveMotionData;
  if (didHaveMotionData)
  {
    self->_didHaveMotionData = 0LL;
    free(didHaveMotionData);
  }

  isPhysicalTripod = self->_isPhysicalTripod;
  if (isPhysicalTripod)
  {
    self->_isPhysicalTripod = 0LL;
    free(isPhysicalTripod);
  }

  undesiredMotionBlur = self->_undesiredMotionBlur;
  if (undesiredMotionBlur)
  {
    self->_undesiredMotionBlur = 0LL;
    free(undesiredMotionBlur);
  }

  outputFrameTime = self->_outputFrameTime;
  if (outputFrameTime)
  {
    self->_outputFrameTime = 0LL;
    free(outputFrameTime);
  }

  precomputedAverages = self->_precomputedAverages;
  if (precomputedAverages)
  {
    self->_precomputedAverages = 0LL;
    free(precomputedAverages);
  }

  serialNumber = self->_serialNumber;
  if (serialNumber)
  {
    self->_serialNumber = 0LL;
    free(serialNumber);
  }

  rollPitch = self->_rollPitch;
  if (rollPitch)
  {
    self->_rollPitch = 0LL;
    free(rollPitch);
  }

  rollHorizonTarget = self->_rollHorizonTarget;
  if (rollHorizonTarget)
  {
    self->_rollHorizonTarget = 0LL;
    free(rollHorizonTarget);
  }

  horizonQuaternions = self->_horizonQuaternions;
  if (horizonQuaternions)
  {
    self->_horizonQuaternions = 0LL;
    free(horizonQuaternions);
  }

  self->_size = 0;
}

- (int)allocateBufferWithSize:(unint64_t)a3 allocateForRollSmoothing:(BOOL)a4
{
  if (self->_size)
  {
    fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
    FigDebugAssert3("%s assert: %s at %s (%s:%d) - %s%s(err=%d)", 0, v4, v48, v49, v50, v51, v52, v53);
    int result = FigSignalErrorAt(4294954514LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else if (a3)
  {
    BOOL v7 = a4;
    uint64_t v8 = 0LL;
    self->_quaternions[6] = 0LL;
    *(_OWORD *)&self->_quaternions[4] = 0u;
    *(_OWORD *)&self->_quaternions[2] = 0u;
    *(_OWORD *)self->_quaternions = 0u;
    *(_OWORD *)self->_originalQuaternions = 0u;
    *(_OWORD *)&self->_originalQuaternions[2] = 0u;
    *(_OWORD *)&self->_originalQuaternions[4] = 0u;
    self->_originalQuaternions[6] = 0LL;
    do
    {
      v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc(32 * a3);
      self->_quaternions[v8] = v9;
      if (!v9)
      {
        uint64_t emitter = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  emitter,  "Fig",  "_quaternions[xFormIdx]",  "bail",  0LL,  "GVSSmoothingBuffers.m",  119LL,  0);
        goto LABEL_30;
      }

      v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc(32 * a3);
      self->_originalQuaternions[v8] = v10;
      if (!v10)
      {
        uint64_t v30 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v30,  "Fig",  "_originalQuaternions[xFormIdx]",  "bail",  0LL,  "GVSSmoothingBuffers.m",  121LL,  0);
        goto LABEL_30;
      }

      ++v8;
    }

    while (v8 != 7);
    v11 = ($01BB1521EC52D44A8E7628F5261DCEC8 *)malloc(32 * a3);
    self->_appliedCenterAdjustment = v11;
    if (v11)
    {
      v12 = ($01BB1521EC52D44A8E7628F5261DCEC8 *)malloc(32 * a3);
      self->_motionBlurAdjustment = v12;
      if (v12)
      {
        v13 = (float *)calloc(a3, 4uLL);
        self->_frameDuration = v13;
        if (v13)
        {
          v14 = malloc(8 * a3);
          *(void *)self->_normalizedInputShift = v14;
          if (v14)
          {
            v15 = malloc(8 * a3);
            *(void *)self->_normalizedOutputShift = v15;
            if (v15)
            {
              v16 = (BOOL *)calloc(a3, 1uLL);
              self->_isLivePhotoKeyFrame = v16;
              if (v16)
              {
                v17 = ($1CAD53D6802C69BA96F959C2B0E5B6C8 *)malloc(144 * a3);
                self->_cameraMetadata = v17;
                if (v17)
                {
                  v18 = (ZoomSmoothingMetadata *)malloc(20 * a3);
                  self->_zoomSmoothingMetadata = v18;
                  if (v18)
                  {
                    v19 = (BOOL *)malloc(a3);
                    self->_didHaveMotionData = v19;
                    if (v19)
                    {
                      v20 = (float *)calloc(a3, 4uLL);
                      self->_undesiredMotionBlur = v20;
                      if (v20)
                      {
                        v21 = (double *)malloc(8 * a3);
                        self->_outputFrameTime = v21;
                        if (v21)
                        {
                          v22 = (BOOL *)malloc(a3);
                          self->_isPhysicalTripod = v22;
                          if (v22)
                          {
                            v23 = (priorQuaternionAverage *)malloc(80 * a3);
                            self->_precomputedAverages = v23;
                            if (v23)
                            {
                              v24 = (unint64_t *)calloc(a3, 8uLL);
                              self->_serialNumber = v24;
                              if (v24)
                              {
                                if (!v7)
                                {
LABEL_25:
                                  -[GVSSmoothingBuffers reset](self, "reset");
                                  goto LABEL_26;
                                }

                                v25 = (RollPitch *)calloc(a3, 8uLL);
                                self->_rollPitch = v25;
                                if (v25)
                                {
                                  v26 = (float *)calloc(a3, 4uLL);
                                  self->_rollHorizonTarget = v26;
                                  if (v26)
                                  {
                                    v27 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)calloc(a3, 0x10uLL);
                                    self->_horizonQuaternions = v27;
                                    if (v27) {
                                      goto LABEL_25;
                                    }
                                    uint64_t v47 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v47,  "Fig",  "_horizonQuaternions",  "bail",  0LL,  "GVSSmoothingBuffers.m",  174LL,  0);
                                  }

                                  else
                                  {
                                    uint64_t v46 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v46,  "Fig",  "_rollHorizonTarget",  "bail",  0LL,  "GVSSmoothingBuffers.m",  171LL,  0);
                                  }
                                }

                                else
                                {
                                  uint64_t v45 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v45,  "Fig",  "_rollPitch",  "bail",  0LL,  "GVSSmoothingBuffers.m",  168LL,  0);
                                }
                              }

                              else
                              {
                                uint64_t v44 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v44,  "Fig",  "_serialNumber",  "bail",  0LL,  "GVSSmoothingBuffers.m",  164LL,  0);
                              }
                            }

                            else
                            {
                              uint64_t v43 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v43,  "Fig",  "_precomputedAverages",  "bail",  0LL,  "GVSSmoothingBuffers.m",  161LL,  0);
                            }
                          }

                          else
                          {
                            uint64_t v42 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v42,  "Fig",  "_isPhysicalTripod",  "bail",  0LL,  "GVSSmoothingBuffers.m",  158LL,  0);
                          }
                        }

                        else
                        {
                          uint64_t v41 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v41,  "Fig",  "_outputFrameTime",  "bail",  0LL,  "GVSSmoothingBuffers.m",  155LL,  0);
                        }
                      }

                      else
                      {
                        uint64_t v40 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v40,  "Fig",  "_undesiredMotionBlur",  "bail",  0LL,  "GVSSmoothingBuffers.m",  152LL,  0);
                      }
                    }

                    else
                    {
                      uint64_t v39 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v39,  "Fig",  "_didHaveMotionData",  "bail",  0LL,  "GVSSmoothingBuffers.m",  149LL,  0);
                    }
                  }

                  else
                  {
                    uint64_t v38 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                    FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v38,  "Fig",  "_zoomSmoothingMetadata",  "bail",  0LL,  "GVSSmoothingBuffers.m",  146LL,  0);
                  }
                }

                else
                {
                  uint64_t v37 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                  FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v37,  "Fig",  "_cameraMetadata",  "bail",  0LL,  "GVSSmoothingBuffers.m",  143LL,  0);
                }
              }

              else
              {
                uint64_t v36 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
                FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v36,  "Fig",  "_isLivePhotoKeyFrame",  "bail",  0LL,  "GVSSmoothingBuffers.m",  140LL,  0);
              }
            }

            else
            {
              uint64_t v35 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
              FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v35,  "Fig",  "_normalizedOutputShift",  "bail",  0LL,  "GVSSmoothingBuffers.m",  137LL,  0);
            }
          }

          else
          {
            uint64_t v34 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
            FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v34,  "Fig",  "_normalizedInputShift",  "bail",  0LL,  "GVSSmoothingBuffers.m",  134LL,  0);
          }
        }

        else
        {
          uint64_t v33 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
          FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v33,  "Fig",  "_frameDuration",  "bail",  0LL,  "GVSSmoothingBuffers.m",  131LL,  0);
        }
      }

      else
      {
        uint64_t v32 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
        FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v32,  "Fig",  "_motionBlurAdjustment",  "bail",  0LL,  "GVSSmoothingBuffers.m",  128LL,  0);
      }
    }

    else
    {
      uint64_t v31 = fig_log_get_emitter("com.apple.cameracapture", &unk_337EA);
      FigDebugAssert3( "%s assert: %s at %s (%s:%d) - %s%s(err=%d)",  v31,  "Fig",  "_appliedCenterAdjustment",  "bail",  0LL,  "GVSSmoothingBuffers.m",  125LL,  0);
    }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___GVSSmoothingBuffers;
  -[GVSSmoothingBuffers dealloc](&v3, "dealloc");
}

- (void)reset
{
  self->_isOpenForWriting = 0;
  *(void *)&self->_centerIndex = 0LL;
}

- (void)incrementCenter
{
}

- (int)count
{
  return self->_inputIndex;
}

- (void)_shiftBuffers
{
  for (uint64_t i = 0LL; i != 7; ++i)
  {
    v4 = self->_quaternions[i];
    if (v4) {
      memmove(v4, (char *)v4 + 32, 32LL * self->_size - 32);
    }
    objc_super v5 = self->_originalQuaternions[i];
    if (v5) {
      memmove(v5, (char *)v5 + 32, 32LL * self->_size - 32);
    }
  }

  appliedCenterAdjustment = self->_appliedCenterAdjustment;
  if (appliedCenterAdjustment) {
    memmove(appliedCenterAdjustment, &appliedCenterAdjustment[1], 32LL * self->_size - 32);
  }
  motionBlurAdjustment = self->_motionBlurAdjustment;
  if (motionBlurAdjustment) {
    memmove(motionBlurAdjustment, &motionBlurAdjustment[1], 32LL * self->_size - 32);
  }
  frameDuration = self->_frameDuration;
  if (frameDuration) {
    memmove(frameDuration, frameDuration + 1, 4LL * self->_size - 4);
  }
  uint64_t v9 = *(void *)self->_normalizedInputShift;
  if (v9) {
    memmove((void *)v9, (const void *)(v9 + 8), 8LL * self->_size - 8);
  }
  uint64_t v10 = *(void *)self->_normalizedOutputShift;
  if (v10) {
    memmove((void *)v10, (const void *)(v10 + 8), 8LL * self->_size - 8);
  }
  cameraMetadata = self->_cameraMetadata;
  if (cameraMetadata) {
    memmove(cameraMetadata, &cameraMetadata[1], 144LL * self->_size - 144);
  }
  zoomSmoothingMetadata = self->_zoomSmoothingMetadata;
  if (zoomSmoothingMetadata) {
    memmove(zoomSmoothingMetadata, &zoomSmoothingMetadata[1], 20LL * self->_size - 20);
  }
  didHaveMotionData = self->_didHaveMotionData;
  if (didHaveMotionData) {
    memmove(didHaveMotionData, didHaveMotionData + 1, self->_size - 1LL);
  }
  isPhysicalTripod = self->_isPhysicalTripod;
  if (isPhysicalTripod) {
    memmove(isPhysicalTripod, isPhysicalTripod + 1, self->_size - 1LL);
  }
  isLivePhotoKeyFrame = self->_isLivePhotoKeyFrame;
  if (isLivePhotoKeyFrame) {
    memmove(isLivePhotoKeyFrame, isLivePhotoKeyFrame + 1, self->_size - 1LL);
  }
  precomputedAverages = self->_precomputedAverages;
  if (precomputedAverages) {
    memmove(precomputedAverages, &precomputedAverages[1].var1.var3, 80LL * self->_size - 80);
  }
  undesiredMotionBlur = self->_undesiredMotionBlur;
  if (undesiredMotionBlur) {
    memmove(undesiredMotionBlur, undesiredMotionBlur + 1, 4LL * self->_size - 4);
  }
  outputFrameTime = self->_outputFrameTime;
  if (outputFrameTime) {
    memmove(outputFrameTime, outputFrameTime + 1, 8LL * self->_size - 8);
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    memmove(serialNumber, serialNumber + 1, 8LL * self->_size - 8);
  }
  rollPitch = self->_rollPitch;
  if (rollPitch) {
    memmove(rollPitch, &rollPitch[1], 8LL * self->_size - 8);
  }
  rollHorizonTarget = self->_rollHorizonTarget;
  if (rollHorizonTarget) {
    memmove(rollHorizonTarget, rollHorizonTarget + 1, 4LL * self->_size - 4);
  }
  horizonQuaternions = self->_horizonQuaternions;
  if (horizonQuaternions) {
    memmove(horizonQuaternions, (char *)horizonQuaternions + 16, 16LL * self->_size - 16);
  }
  --self->_centerIndex;
  int inputIndex = self->_inputIndex;
  if (inputIndex >= 2) {
    int v24 = inputIndex - 1;
  }
  else {
    int v24 = 0;
  }
  self->_int inputIndex = v24;
}

- (BOOL)_checkInputIsWritable
{
  return self->_isOpenForWriting;
}

- (void)openForNewData
{
  if (!self->_isOpenForWriting)
  {
    while (self->_inputIndex >= self->_size)
      -[GVSSmoothingBuffers _shiftBuffers](self, "_shiftBuffers");
    unint64_t v3 = 0x1FFFFFFFFFFFFFE4LL;
    do
    {
      FigMotionInitializeQuaternion(&self->_originalQuaternionsInput[v3 / 4].w);
      FigMotionInitializeQuaternion(&(&self[1].super.isa)[v3]);
      v3 += 4LL;
    }

    while (v3 * 8);
    *((_DWORD *)&self->_precomputedAverages->var0 + 20 * self->_inputIndex) = 0;
    self->_isOpenForWriting = 1;
  }

- (void)commitData
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable"))
  {
    quaternionsInput = self->_quaternionsInput;
    originalQuaternions = self->_originalQuaternions;
    uint64_t v5 = 0x1FFFFFFFFFFFFFF9LL;
    do
    {
      v6 = (_OWORD *)((char *)originalQuaternions[v5] + 32 * self->_inputIndex);
      __int128 v7 = *(_OWORD *)&quaternionsInput->y;
      _OWORD *v6 = *(_OWORD *)&quaternionsInput->w;
      v6[1] = v7;
      uint64_t v8 = (_OWORD *)((char *)originalQuaternions[v5 + 7] + 32 * self->_inputIndex);
      __int128 v9 = *(_OWORD *)&quaternionsInput[7].y;
      *uint64_t v8 = *(_OWORD *)&quaternionsInput[7].w;
      v8[1] = v9;
      ++quaternionsInput;
      ++v5;
    }

    while (v5 * 8);
    self->_isOpenForWriting = 0;
    ++self->_inputIndex;
  }

- (const)quaternions
{
  return (const $8EF4127CF77ECA3DDB612FCF233DC3A8 **)self->_quaternions;
}

- (const)originalQuaternions
{
  return (const $8EF4127CF77ECA3DDB612FCF233DC3A8 **)self->_originalQuaternions;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)quaternionsInput
{
  return ($01BB1521EC52D44A8E7628F5261DCEC8 *)self->_quaternionsInput;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)originalQuaternionsInput
{
  return ($01BB1521EC52D44A8E7628F5261DCEC8 *)self->_originalQuaternionsInput;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)appliedCenterAdjustmentInput
{
  unint64_t v3 = &self->_appliedCenterAdjustment[self->_inputIndex];
  double var0 = v3->var0;
  double var1 = v3->var1;
  double var2 = v3->var2;
  double var3 = v3->var3;
  result.double var3 = var3;
  result.double var2 = var2;
  result.double var1 = var1;
  result.double var0 = var0;
  return result;
}

- (void)setAppliedCenterAdjustmentInput:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable"))
  {
    uint64_t v8 = &self->_appliedCenterAdjustment[self->_inputIndex];
    v8->double var0 = var0;
    v8->double var1 = var1;
    v8->double var2 = var2;
    v8->double var3 = var3;
  }

- ($01BB1521EC52D44A8E7628F5261DCEC8)motionBlurAdjustmentInput
{
  unint64_t v3 = &self->_motionBlurAdjustment[self->_inputIndex];
  double var0 = v3->var0;
  double var1 = v3->var1;
  double var2 = v3->var2;
  double var3 = v3->var3;
  result.double var3 = var3;
  result.double var2 = var2;
  result.double var1 = var1;
  result.double var0 = var0;
  return result;
}

- (void)setMotionBlurAdjustmentInput:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable"))
  {
    uint64_t v8 = &self->_motionBlurAdjustment[self->_inputIndex];
    v8->double var0 = var0;
    v8->double var1 = var1;
    v8->double var2 = var2;
    v8->double var3 = var3;
  }

- (float)frameDurationInput
{
  return self->_frameDuration[self->_inputIndex];
}

- (void)setFrameDurationInput:(float)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    self->_frameDuration[self->_inputIndex] = a3;
  }
}

- (double)normalizedInputShiftInput
{
  return *(double *)(*(void *)(a1 + 136) + 8LL * *(int *)(a1 + 260));
}

- (void)setNormalizedInputShiftInput:(GVSSmoothingBuffers *)self
{
  uint64_t v3 = v2;
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    *(void *)(*(void *)self->_normalizedInputShift + 8LL * self->_inputIndex) = v3;
  }
}

- (double)normalizedOutputShiftInput
{
  return *(double *)(*(void *)(a1 + 144) + 8LL * *(int *)(a1 + 260));
}

- (void)setNormalizedOutputShiftInput:(GVSSmoothingBuffers *)self
{
  uint64_t v3 = v2;
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    *(void *)(*(void *)self->_normalizedOutputShift + 8LL * self->_inputIndex) = v3;
  }
}

- ($1CAD53D6802C69BA96F959C2B0E5B6C8)cameraMetadataInput
{
  $01BB1521EC52D44A8E7628F5261DCEC8 result = ($1CAD53D6802C69BA96F959C2B0E5B6C8 *)-[GVSSmoothingBuffers _checkInputIsWritable]( self,  "_checkInputIsWritable");
  v6 = &self->_cameraMetadata[self->_inputIndex];
  __int128 v7 = *(_OWORD *)&v6->var15.origin.y;
  *(_OWORD *)&retstr->var14.var1.double var0 = *(_OWORD *)&v6->var14.var1.var0;
  *(_OWORD *)&retstr->var15.origin.y = v7;
  *(_OWORD *)&retstr->var15.size.height = *(_OWORD *)&v6->var15.size.height;
  __int128 v8 = *(_OWORD *)&v6->var9;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&v6->var7;
  *(_OWORD *)&retstr->var9 = v8;
  __int128 v9 = *(_OWORD *)&v6->var13.var0;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&v6->var11;
  *(_OWORD *)&retstr->var13.double var0 = v9;
  __int128 v10 = *(_OWORD *)&v6->var4;
  *(_OWORD *)&retstr->double var0 = *(_OWORD *)&v6->var0;
  *(_OWORD *)&retstr->var4 = v10;
  return result;
}

- (void)setCameraMetadataInput:(id *)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable"))
  {
    uint64_t v5 = &self->_cameraMetadata[self->_inputIndex];
    __int128 v6 = *(_OWORD *)&a3->var11;
    __int128 v8 = *(_OWORD *)&a3->var4;
    __int128 v7 = *(_OWORD *)&a3->var7;
    *(_OWORD *)&v5->var9 = *(_OWORD *)&a3->var9;
    *(_OWORD *)&v5->var11 = v6;
    *(_OWORD *)&v5->var4 = v8;
    *(_OWORD *)&v5->var7 = v7;
    __int128 v9 = *(_OWORD *)&a3->var15.size.height;
    __int128 v11 = *(_OWORD *)&a3->var13.var0;
    __int128 v10 = *(_OWORD *)&a3->var14.var1.var0;
    *(_OWORD *)&v5->var15.origin.y = *(_OWORD *)&a3->var15.origin.y;
    *(_OWORD *)&v5->var15.size.height = v9;
    *(_OWORD *)&v5->var13.double var0 = v11;
    *(_OWORD *)&v5->var14.var1.double var0 = v10;
    *(_OWORD *)&v5->double var0 = *(_OWORD *)&a3->var0;
  }

- (BOOL)didHaveMotionDataInput
{
  return self->_didHaveMotionData[self->_inputIndex];
}

- (void)setDidHaveMotionDataInput:(BOOL)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    self->_didHaveMotionData[self->_inputIndex] = a3;
  }
}

- (BOOL)isPhysicalTripodInput
{
  return self->_isPhysicalTripod[self->_inputIndex];
}

- (void)setIsPhysicalTripodInput:(BOOL)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    self->_isPhysicalTripod[self->_inputIndex] = a3;
  }
}

- (BOOL)isLivePhotoKeyFrameInput
{
  return self->_isLivePhotoKeyFrame[self->_inputIndex];
}

- (void)setIsLivePhotoKeyFrameInput:(BOOL)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    self->_isLivePhotoKeyFrame[self->_inputIndex] = a3;
  }
}

- (double)outputFrameTimeInput
{
  return self->_outputFrameTime[self->_inputIndex];
}

- (void)setOutputFrameTimeInput:(double)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    self->_outputFrameTime[self->_inputIndex] = a3;
  }
}

- (unint64_t)serialNumberInput
{
  return self->_serialNumber[self->_inputIndex];
}

- (void)setSerialNumberInput:(unint64_t)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    self->_serialNumber[self->_inputIndex] = a3;
  }
}

- (RollPitch)rollPitchInput
{
  uint64_t v3 = &self->_rollPitch[self->_inputIndex];
  float var0 = v3->var0;
  float var1 = v3->var1;
  result.float var1 = var1;
  result.float var0 = var0;
  return result;
}

- (void)setRollPitchInput:(RollPitch)a3
{
  float var1 = a3.var1;
  float var0 = a3.var0;
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable"))
  {
    __int128 v6 = &self->_rollPitch[self->_inputIndex];
    v6->float var0 = var0;
    v6->float var1 = var1;
  }

- (float)rollHorizonTargetInput
{
  return self->_rollHorizonTarget[self->_inputIndex];
}

- (void)setRollHorizonTargetInput:(float)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    self->_rollHorizonTarget[self->_inputIndex] = a3;
  }
}

- (priorQuaternionAverage)precomputedAveragesInput
{
  RollPitch result = (priorQuaternionAverage *)-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable");
  __int128 v6 = (_OWORD *)(&self->_precomputedAverages->var0 + 20 * self->_inputIndex);
  __int128 v7 = v6[3];
  *(_OWORD *)&retstr->var1.double var3 = v6[2];
  *(_OWORD *)&retstr[1].float var0 = v7;
  *(_OWORD *)&retstr[1].var1.float var1 = v6[4];
  __int128 v8 = v6[1];
  *(_OWORD *)&retstr->float var0 = *v6;
  *(_OWORD *)&retstr->var1.float var1 = v8;
  return result;
}

- (void)setPrecomputedAveragesInput:(priorQuaternionAverage *)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable"))
  {
    uint64_t v5 = (_OWORD *)(&self->_precomputedAverages->var0 + 20 * self->_inputIndex);
    __int128 v6 = *(_OWORD *)&a3[1].var1.var1;
    __int128 v8 = *(_OWORD *)&a3->var1.var1;
    __int128 v7 = *(_OWORD *)&a3->var1.var3;
    v5[3] = *(_OWORD *)&a3[1].var0;
    v5[4] = v6;
    v5[1] = v8;
    v5[2] = v7;
    *uint64_t v5 = *(_OWORD *)&a3->var0;
  }

- (ZoomSmoothingMetadata)zoomSmoothingMetadataInput
{
  RollPitch result = (ZoomSmoothingMetadata *)-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable");
  *retstr = self->_zoomSmoothingMetadata[self->_inputIndex];
  return result;
}

- (void)setZoomSmoothingMetadataInput:(ZoomSmoothingMetadata *)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable"))
  {
    uint64_t v5 = &self->_zoomSmoothingMetadata[self->_inputIndex];
    __int128 v6 = *(_OWORD *)&a3->var0;
    v5->var4 = a3->var4;
    *(_OWORD *)&v5->float var0 = v6;
  }

- (__n128)horizonQuaternionsInput
{
  return *(__n128 *)(*(void *)(a1 + 248) + 16LL * *(int *)(a1 + 260));
}

- (__n128)setHorizonQuaternionsInput:(uint64_t)a1
{
  if ([(id)a1 _checkInputIsWritable])
  {
    __n128 result = a2;
    *(__n128 *)(*(void *)(a1 + 248) + 16LL * *(int *)(a1 + 260)) = a2;
  }

  return result;
}

- (float)frameDurationPrevious
{
  return self->_frameDuration[self->_inputIndex - 1];
}

- (void)setFrameDurationPrevious:(float)a3
{
  if (-[GVSSmoothingBuffers _checkInputIsWritable](self, "_checkInputIsWritable")) {
    self->_frameDuration[self->_inputIndex - 1] = a3;
  }
}

- (GVSQuaternionSmoothingArrays)getQuaternionSmoothingArrays
{
  retstr->float var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)&self->var1;
  *(_OWORD *)&retstr->float var1 = *(_OWORD *)&self[1].var10;
  double var3 = (float *)self[2].var3;
  uint64_t v4 = *(void *)&self[2].var6;
  retstr->double var3 = (double *)&self[2].var5->var0;
  retstr->var4 = var3;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[2].var10;
  *(void *)&retstr->var8 = v4;
  retstr->var10 = (int)self[3].var5;
  retstr->var11 = 0;
  LODWORD(var3) = HIDWORD(self[3].var5);
  LODWORD(retstr[1].var0) = (_DWORD)var3 - 1;
  HIDWORD(retstr[1].var0) = (_DWORD)var3;
  LODWORD(var3) = self[3].var6;
  LODWORD(retstr[1].var1) = (_DWORD)var3;
  HIDWORD(retstr[1].var1) = ((int)var3 - 1) >> 1;
  return self;
}

- (GVSRollSmoothingArrays)getRollSmoothingArraysForBaseTransform:(SEL)a3
{
  uint64_t v4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*((void *)&self->var1 + a4);
  retstr->float var0 = self[3].var1;
  retstr->float var1 = v4;
  *(_OWORD *)&retstr->double var2 = *(_OWORD *)&self[2].var11;
  retstr->var4 = (BOOL *)self[2].var1;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[2].var6;
  retstr->var7 = (int)self[3].var2;
  retstr->var8 = 0;
  int var2_high = HIDWORD(self[3].var2);
  retstr->var9 = var2_high - 1;
  retstr->var10 = var2_high;
  retstr->var11 = (LODWORD(self[3].var3) - 1) >> 1;
  return self;
}

- (GVSZoomSmoothingArrays)getZoomSmoothingArrays
{
  retstr->float var0 = (ZoomSmoothingMetadata *)self[3].var2;
  *(_OWORD *)&retstr->float var1 = *(_OWORD *)&self[4].var2;
  retstr->double var3 = (int)self[5].var2;
  retstr->var4 = 0;
  int var2_high = HIDWORD(self[5].var2);
  retstr->var5 = var2_high - 1;
  retstr->var6 = var2_high;
  retstr->var7 = (self[5].var3 - 1) >> 1;
  return self;
}

- (GVSSmoothingAnalysisArrays)getSmoothingAnalysisArrays
{
  retstr->float var0 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)&self->var8;
  *(_OWORD *)&retstr->float var1 = *(_OWORD *)&self[1].var3;
  float var1 = (float *)self[2].var1;
  double var2 = (double *)self[2].var2;
  retstr->double var3 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)self[1].var7;
  retstr->var4 = var2;
  *(_OWORD *)&retstr->var5 = *(_OWORD *)&self[1].var11;
  retstr->var7 = (unint64_t *)self[2].var4;
  retstr->var8 = var1;
  retstr->var9 = (int)self[2].var8;
  retstr->var10 = 0;
  int var8_high = HIDWORD(self[2].var8);
  retstr->var11 = var8_high - 1;
  retstr->var12 = var8_high;
  retstr->var13 = (self[2].var9 - 1) >> 1;
  return self;
}

- (int)centerIndex
{
  return self->_centerIndex;
}

- (int)inputIndex
{
  return self->_inputIndex;
}

- (int)size
{
  return self->_size;
}

@end