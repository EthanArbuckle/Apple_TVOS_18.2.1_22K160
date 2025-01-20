@interface VCPVideoFramesCaptionTask
+ (id)taskWithFrames:(id)a3 frameRate:(float)a4 timeRange:(id *)a5 andCompletionHandler:(id)a6;
- (BOOL)autoCancellable;
- (VCPVideoFramesCaptionTask)initWithFrames:(id)a3 frameRate:(float)a4 timeRange:(id *)a5 andCompletionHandler:(id)a6;
- (float)resourceRequirement;
- (int)main;
- (int)run;
- (void)cancel;
- (void)dealloc;
@end

@implementation VCPVideoFramesCaptionTask

- (VCPVideoFramesCaptionTask)initWithFrames:(id)a3 frameRate:(float)a4 timeRange:(id *)a5 andCompletionHandler:(id)a6
{
  id v11 = a3;
  v12 = (Block_layout *)a6;
  if ([v11 count])
  {
    v29.receiver = self;
    v29.super_class = (Class)&OBJC_CLASS___VCPVideoFramesCaptionTask;
    v13 = -[VCPVideoFramesCaptionTask init](&v29, "init");
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_frames, a3);
      __int128 v15 = *(_OWORD *)&a5->var0.var0;
      __int128 v16 = *(_OWORD *)&a5->var0.var3;
      *(_OWORD *)((char *)&v14->_timeRange.duration.value + 4) = *(_OWORD *)&a5->var1.var1;
      *(_OWORD *)&v14->_timeRange.start.flags = v16;
      *(_OWORD *)(&v14->_frameRate + 1) = v15;
      v14->_frameRate = a4;
      NSUInteger v17 = -[NSArray count](v14->_frames, "count");
      v14->_frameNum = v17;
      $3CC8671D27C23BF42ADDB32F2B5E48AE var1 = a5->var1;
      CMTimeMultiplyByRatio(&v28, (CMTime *)&var1, 1, v17 - 1);
      *(CMTime *)((char *)&v14->_timeRange.duration.epoch + 4) = v28;
      v18 = -[NSMutableString initWithString:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithString:",  &stru_1001BE5A8);
      v19 = *(void **)&v14->_canceled.__a_.__a_value;
      *(void *)&v14->_canceled.__a_.__a_value = v18;

      uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      errorMessage = v14->_errorMessage;
      v14->_errorMessage = (NSMutableString *)v20;

      if (v12) {
        v22 = v12;
      }
      else {
        v22 = &stru_1001BC5B8;
      }
      v23 = objc_retainBlock(v22);
      id completionHandler = v14->_completionHandler;
      v14->_id completionHandler = v23;
    }

    self = v14;
    v25 = self;
  }

  else
  {
    v25 = 0LL;
  }

  return v25;
}

+ (id)taskWithFrames:(id)a3 frameRate:(float)a4 timeRange:(id *)a5 andCompletionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = objc_alloc((Class)objc_opt_class(a1));
  __int128 v13 = *(_OWORD *)&a5->var0.var3;
  v16[0] = *(_OWORD *)&a5->var0.var0;
  v16[1] = v13;
  __int128 v17 = *(_OWORD *)&a5->var1.var1;
  id v14 = objc_msgSend( v12,  "initWithFrames:frameRate:timeRange:andCompletionHandler:",  v10,  v16,  v11,  COERCE_DOUBLE(__PAIR64__(DWORD1(v17), LODWORD(a4))));

  return v14;
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
}

- (void)dealloc
{
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_frameInterval.epoch + 5);
  if ((v3 & 1) == 0)
  {
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    if (completionHandler)
    {
      NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
      v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Video frames caption task cancelled"));
      id v10 = v5;
      v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));
      v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  -128LL,  v6));
      completionHandler[2](completionHandler, 0LL, v7);
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___VCPVideoFramesCaptionTask;
  -[VCPVideoFramesCaptionTask dealloc](&v8, "dealloc");
}

- (int)main
{
  uint64_t v4 = MediaAnalysisLogLevel(self, a2);
  if ((int)v4 >= 6)
  {
    uint64_t v6 = VCPLogInstance(v4, v5);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    os_log_type_t v8 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v7, v8))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "VCPVideoFramesCaptionTask running...", (uint8_t *)&buf, 2u);
    }
  }

  unsigned __int8 v9 = atomic_load((unsigned __int8 *)&self->_frameInterval.epoch + 4);
  if ((v9 & 1) != 0)
  {
    [*(id *)&self->_canceled.__a_.__a_value setString:@"Video frames caption task cancelled"];
    return -128;
  }

  else
  {
    id v49 = [[VCPImageCaptionAnalyzer alloc] initWithCaptionModelType:1 captionSafetyType:0 useSharedModel:1];
    if (v49)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AXMImageCaptionModelAssetManager sharedInstance]( &OBJC_CLASS___AXMImageCaptionModelAssetManager,  "sharedInstance"));
      v46 = (void *)objc_claimAutoreleasedReturnValue([v11 modelURLForType:1 timeout:0.5]);

      if (v46)
      {
        id v15 = [[VCPVideoCaptionAnalyzer alloc] initWithModelType:1 frameNumber:self->_frameNum];
        if (v15)
        {
          uint64_t v66 = 0LL;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          __int128 v65 = 0u;
          __int128 v16 = self->_frames;
          v47 = v15;
          obj = v16;
          id v17 = -[NSArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
          if (v17)
          {
            int32_t v18 = 0;
            v50 = 0LL;
            uint64_t v51 = *(void *)v63;
            v19 = (_OWORD *)((char *)&self->_timeRange.duration.epoch + 4);
            while (1)
            {
              uint64_t v20 = 0LL;
              do
              {
                if (*(void *)v63 != v51) {
                  objc_enumerationMutation(obj);
                }
                v21 = *(__IOSurface **)(*((void *)&v62 + 1) + 8LL * (void)v20);
                v22 = objc_autoreleasePoolPush();
                CMTime lhs = *(CMTime *)(&self->_frameRate + 1);
                *(_OWORD *)&time.value = *v19;
                time.epoch = *(void *)&self->_frameInterval.flags;
                CMTimeMultiply(&rhs, &time, v18);
                CMTimeAdd(&buf, &lhs, &rhs);
                CVPixelBufferRef pixelBufferOut = 0LL;
                CVReturn v23 = CVPixelBufferCreateWithIOSurface(0LL, v21, 0LL, &pixelBufferOut);
                if (v23)
                {
                  [*(id *)&self->_canceled.__a_.__a_value setString:@"[VCPVideoFramesCaptionTask] Failed to create CVPixelBuffer from specified IOSurface"];
LABEL_20:
                  int v25 = 0;
                  int v2 = v23;
                  goto LABEL_21;
                }

                if (!v18)
                {
                  id v56 = v50;
                  [v49 analyzePixelBuffer:pixelBufferOut flags:&v66 results:&v56 cancel:&stru_1001BC5D8];
                  id v24 = v56;

                  v50 = v24;
                  -[NSMutableString addEntriesFromDictionary:](self->_errorMessage, "addEntriesFromDictionary:", v24);
                }

                CMTime v55 = buf;
                __int128 v53 = *v19;
                uint64_t v54 = *(void *)&self->_frameInterval.flags;
                CVReturn v23 = objc_msgSend( v47,  "analyzeFrame:withTimestamp:andDuration:flags:",  pixelBufferOut,  &v55,  &v53,  &v66,  v46);
                if (v23)
                {
                  [*(id *)&self->_canceled.__a_.__a_value setString:@"[VCPVideoFramesCaptionTask] VideoCaptionAnalyzer failed to analyze frame"];
                  goto LABEL_20;
                }

                ++v18;
                int v25 = 1;
LABEL_21:
                sub_10000421C((const void **)&pixelBufferOut);
                objc_autoreleasePoolPop(v22);
                if (!v25)
                {
                  v37 = obj;
                  goto LABEL_46;
                }

                uint64_t v20 = (char *)v20 + 1;
              }

              while (v17 != v20);
              __int128 v16 = obj;
              id v26 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v62,  v67,  16LL);
              id v17 = v26;
              if (!v26) {
                goto LABEL_45;
              }
            }
          }

          v50 = 0LL;
LABEL_45:

          __int128 v43 = *(_OWORD *)&self->_timeRange.start.flags;
          v52[0] = *(_OWORD *)(&self->_frameRate + 1);
          v52[1] = v43;
          v52[2] = *(_OWORD *)((char *)&self->_timeRange.duration.value + 4);
          [v47 finishAnalysisPass:v52];
          errorMessage = self->_errorMessage;
          v37 = (NSArray *)objc_claimAutoreleasedReturnValue([v47 results]);
          -[NSMutableString addEntriesFromDictionary:](errorMessage, "addEntriesFromDictionary:", v37);
          int v2 = 0;
LABEL_46:

          id v15 = v47;
        }

        else
        {
          uint64_t v38 = MediaAnalysisLogLevel(0LL, v14);
          if ((int)v38 >= 3)
          {
            uint64_t v40 = VCPLogInstance(v38, v39);
            v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
            os_log_type_t v42 = VCPLogToOSLogType[3];
            if (os_log_type_enabled(v41, v42))
            {
              LOWORD(buf.value) = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v41,  v42,  "[VCPVideoFramesCaptionTask] VCPVideoCaptionAnalyzer init fail",  (uint8_t *)&buf,  2u);
            }
          }

          objc_msgSend( *(id *)&self->_canceled.__a_.__a_value,  "setString:",  @"[VCPVideoFramesCaptionTask] VCPVideoCaptionAnalyzer init fail",  v46);
          v50 = 0LL;
          int v2 = -108;
        }
      }

      else
      {
        uint64_t v32 = MediaAnalysisLogLevel(v12, v13);
        if ((int)v32 >= 3)
        {
          uint64_t v34 = VCPLogInstance(v32, v33);
          v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
          os_log_type_t v36 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v35, v36))
          {
            LOWORD(buf.value) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  v36,  "[VCPVideoFramesCaptionTask] AX video captioning decoder model not found",  (uint8_t *)&buf,  2u);
          }
        }

        objc_msgSend( *(id *)&self->_canceled.__a_.__a_value,  "setString:",  @"[VCPVideoFramesCaptionTask] AX video captioning decoder model not found",  0);
        v50 = 0LL;
        int v2 = -18;
      }
    }

    else
    {
      uint64_t v27 = MediaAnalysisLogLevel(0LL, v10);
      if ((int)v27 >= 3)
      {
        uint64_t v29 = VCPLogInstance(v27, v28);
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        os_log_type_t v31 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v30, v31))
        {
          LOWORD(buf.value) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v30,  v31,  "[VCPVideoFramesCaptionTask] VCPImageCaptionAnalyzer init fail",  (uint8_t *)&buf,  2u);
        }
      }

      [*(id *)&self->_canceled.__a_.__a_value setString:@"[VCPVideoFramesCaptionTask] VCPImageCaptionAnalyzer init fail"];
      v50 = 0LL;
      int v2 = -18;
    }
  }

  return v2;
}

- (int)run
{
  uint64_t v3 = -[VCPVideoFramesCaptionTask main](self, "main");
  int v5 = v3;
  if ((_DWORD)v3)
  {
    uint64_t v6 = MediaAnalysisLogLevel(v3, v4);
    if ((int)v6 >= 4)
    {
      uint64_t v8 = VCPLogInstance(v6, v7);
      unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      os_log_type_t v10 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v9, v10))
      {
        *(_WORD *)__int128 v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "VCPVideoFramesCaptionTask processing failed", v16, 2u);
      }
    }

    uint64_t v11 = *(void *)&self->_canceled.__a_.__a_value;
    NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
    uint64_t v18 = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id completionHandler = (void (**)(id, void, void *))self->_completionHandler;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v5,  v12));
    completionHandler[2](completionHandler, 0LL, v14);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end