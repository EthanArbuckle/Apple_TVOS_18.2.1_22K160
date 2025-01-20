@interface SCReporting
+ (void)reportAlertRTCEventWithClientBundelID:(id)a3 isLegacy:(BOOL)a4 didAlert:(BOOL)a5 methodType:(unint64_t)a6;
- (BOOL)audioEnabled;
- (BOOL)gestureDetectionBasedReactionsEnabled;
- (BOOL)individualWindow;
- (BOOL)isClientScreenCapture;
- (BOOL)micEnabled;
- (BOOL)preserveAspectRatio;
- (BOOL)scaleToFit;
- (BOOL)shouldReportBundleID:(id)a3;
- (BOOL)showCursor;
- (BOOL)showMouseClicks;
- (BOOL)userStopped;
- (NSString)clientBundleID;
- (NSString)colorMatrix;
- (NSString)colorSpace;
- (NSString)pixelFormat;
- (NSString)streamID;
- (SCReporting)initWithClientBundleID:(id)a3 clientMainBundleID:(id)a4 streamID:(id)a5;
- (double)activeDuration;
- (double)averageFrameLatency;
- (double)averageFrameLatencyAudio;
- (double)averageFrameLatencyMic;
- (double)backgroundReplacementTotalDuration;
- (double)centerStageEffectTotalDuration;
- (double)floatingTotalDuration;
- (double)newsroomTotalDuration;
- (double)portraitEffectTotalDuration;
- (double)studioLightEffectTotalDuration;
- (float)contentScale;
- (id)collectSummaryEventMetrics;
- (id)collectSummaryRecordingEventMetrics;
- (id)thermalDescription;
- (int64_t)audioChannelCount;
- (int64_t)audioSampleRate;
- (int64_t)backgroundColor;
- (int64_t)cameraDeviceType;
- (int64_t)captureDynamicRange;
- (int64_t)captureResolutionType;
- (int64_t)destSurfaceHeight;
- (int64_t)destSurfaceWidth;
- (int64_t)excludeCallingClientAudio;
- (int64_t)excludedApplicationsCount;
- (int64_t)excludedWindowsCount;
- (int64_t)filterSource;
- (int64_t)floatingAverageLatency;
- (int64_t)floatingSessionCount;
- (int64_t)floatingToNewsroomTransitionCount;
- (int64_t)floatingTotalFrameCount;
- (int64_t)frameHeight;
- (int64_t)frameQueueSize;
- (int64_t)frameWidth;
- (int64_t)getColorFromRGBA:(double)a3 withGreen:(double)a4 withBlue:(double)a5 withAlpha:(double)a6;
- (int64_t)getCurrentStreamScreenConfiguration;
- (int64_t)includedApplicationsCount;
- (int64_t)includedWindowsCount;
- (int64_t)inputSurfaceHeight;
- (int64_t)inputSurfaceWidth;
- (int64_t)intToSCReportingAudioSampleRate:(int64_t)a3;
- (int64_t)manualTriggeredReactionsCount;
- (int64_t)newsroomAverageLatency;
- (int64_t)newsroomBottomLeftWindowCount;
- (int64_t)newsroomBottomRightWindowCount;
- (int64_t)newsroomFullScreenContentCount;
- (int64_t)newsroomSessionCount;
- (int64_t)newsroomToFloatingTransitionCount;
- (int64_t)newsroomTopLeftWindowCount;
- (int64_t)newsroomTopRightWindowCount;
- (int64_t)newsroomTotalFrameCount;
- (int64_t)portraitIntensityEndValue;
- (int64_t)recordingEndReason;
- (int64_t)recordingOutputCount;
- (int64_t)recordingOutputDuration;
- (int64_t)recordingOutputFileSize;
- (int64_t)recordingOutputFileType;
- (int64_t)recordingOutputVideoCodecType;
- (int64_t)recordingTotalDuration;
- (int64_t)recordingTotalFileSize;
- (int64_t)startWithCompositeMode;
- (int64_t)stringToSCReportingColorMatrix:(id)a3;
- (int64_t)stringToSCReportingColorSpace:(id)a3;
- (int64_t)stringToSCReportingPixelFormat:(id)a3;
- (int64_t)stringToSCReportingRecordingFileType:(id)a3;
- (int64_t)stringToSCReportingRecordingVideoCodecType:(id)a3;
- (int64_t)studioLightIntensityEndValue;
- (int64_t)targetFrameRate;
- (int64_t)totalAudioFrameCount;
- (int64_t)totalFrameCount;
- (int64_t)totalMicFrameCount;
- (void)addToThermalResultsWithLevel:(int64_t)a3;
- (void)reportRTCEvent:(id)a3 withStreamID:(id)a4;
- (void)reportRecordingRTCEvent:(id)a3 withStreamID:(id)a4;
- (void)resetReportingMetrics;
- (void)resetThermalResults;
- (void)setActiveDuration:(double)a3;
- (void)setAudioChannelCount:(int64_t)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioSampleRate:(int64_t)a3;
- (void)setAverageFrameLatency:(double)a3;
- (void)setAverageFrameLatencyAudio:(double)a3;
- (void)setAverageFrameLatencyMic:(double)a3;
- (void)setBackgroundColor:(int64_t)a3;
- (void)setBackgroundReplacementTotalDuration:(double)a3;
- (void)setCameraDeviceType:(int64_t)a3;
- (void)setCaptureDynamicRange:(int64_t)a3;
- (void)setCaptureResolutionType:(int64_t)a3;
- (void)setCenterStageEffectTotalDuration:(double)a3;
- (void)setClientBundleID:(id)a3;
- (void)setColorMatrix:(id)a3;
- (void)setColorSpace:(id)a3;
- (void)setContentScale:(float)a3;
- (void)setDestSurfaceHeight:(int64_t)a3;
- (void)setDestSurfaceWidth:(int64_t)a3;
- (void)setExcludeCallingClientAudio:(int64_t)a3;
- (void)setExcludedApplicationsCount:(int64_t)a3;
- (void)setExcludedWindowsCount:(int64_t)a3;
- (void)setFilterSource:(int64_t)a3;
- (void)setFloatingAverageLatency:(int64_t)a3;
- (void)setFloatingSessionCount:(int64_t)a3;
- (void)setFloatingToNewsroomTransitionCount:(int64_t)a3;
- (void)setFloatingTotalDuration:(double)a3;
- (void)setFloatingTotalFrameCount:(int64_t)a3;
- (void)setFrameHeight:(int64_t)a3;
- (void)setFrameQueueSize:(int64_t)a3;
- (void)setFrameWidth:(int64_t)a3;
- (void)setGestureDetectionBasedReactionsEnabled:(BOOL)a3;
- (void)setIncludedApplicationsCount:(int64_t)a3;
- (void)setIncludedWindowsCount:(int64_t)a3;
- (void)setIndividualWindow:(BOOL)a3;
- (void)setInputSurfaceHeight:(int64_t)a3;
- (void)setInputSurfaceWidth:(int64_t)a3;
- (void)setIsClientScreenCapture:(BOOL)a3;
- (void)setManualTriggeredReactionsCount:(int64_t)a3;
- (void)setMicEnabled:(BOOL)a3;
- (void)setNewsroomAverageLatency:(int64_t)a3;
- (void)setNewsroomBottomLeftWindowCount:(int64_t)a3;
- (void)setNewsroomBottomRightWindowCount:(int64_t)a3;
- (void)setNewsroomFullScreenContentCount:(int64_t)a3;
- (void)setNewsroomSessionCount:(int64_t)a3;
- (void)setNewsroomToFloatingTransitionCount:(int64_t)a3;
- (void)setNewsroomTopLeftWindowCount:(int64_t)a3;
- (void)setNewsroomTopRightWindowCount:(int64_t)a3;
- (void)setNewsroomTotalDuration:(double)a3;
- (void)setNewsroomTotalFrameCount:(int64_t)a3;
- (void)setPixelFormat:(id)a3;
- (void)setPortraitEffectTotalDuration:(double)a3;
- (void)setPortraitIntensityEndValue:(int64_t)a3;
- (void)setPreserveAspectRatio:(BOOL)a3;
- (void)setRecordingEndReason:(int64_t)a3;
- (void)setRecordingOutputCount:(int64_t)a3;
- (void)setRecordingOutputDuration:(int64_t)a3;
- (void)setRecordingOutputFileSize:(int64_t)a3;
- (void)setRecordingOutputFileType:(int64_t)a3;
- (void)setRecordingOutputVideoCodecType:(int64_t)a3;
- (void)setRecordingTotalDuration:(int64_t)a3;
- (void)setRecordingTotalFileSize:(int64_t)a3;
- (void)setScaleToFit:(BOOL)a3;
- (void)setShowCursor:(BOOL)a3;
- (void)setShowMouseClicks:(BOOL)a3;
- (void)setStartWithCompositeMode:(int64_t)a3;
- (void)setStreamID:(id)a3;
- (void)setStudioLightEffectTotalDuration:(double)a3;
- (void)setStudioLightIntensityEndValue:(int64_t)a3;
- (void)setTargetFrameRate:(int64_t)a3;
- (void)setTotalAudioFrameCount:(int64_t)a3;
- (void)setTotalFrameCount:(int64_t)a3;
- (void)setTotalMicFrameCount:(int64_t)a3;
- (void)setUserStopped:(BOOL)a3;
- (void)thermalPressureDidChangeWithLevel:(int64_t)a3;
- (void)updateReportWithClientProperties:(id)a3;
- (void)updateReportWithContentFilterDictionary:(id)a3;
- (void)updateReportWithRecordingFinishDuration:(int64_t)a3 fileSize:(int64_t)a4;
- (void)updateReportWithRecordingStartConfiguration:(id)a3;
@end

@implementation SCReporting

- (SCReporting)initWithClientBundleID:(id)a3 clientMainBundleID:(id)a4 streamID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___SCReporting;
  v11 = -[SCReporting init](&v23, "init");
  if (v11)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v25 = "-[SCReporting initWithClientBundleID:clientMainBundleID:streamID:]";
      __int16 v26 = 1024;
      int v27 = 89;
      __int16 v28 = 2048;
      v29 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d %p",  buf,  0x1Cu);
    }

    -[SCReporting setPixelFormat:](v11, "setPixelFormat:", &stru_100073210);
    -[SCReporting setColorMatrix:](v11, "setColorMatrix:", &stru_100073210);
    -[SCReporting setColorSpace:](v11, "setColorSpace:", &stru_100073210);
    -[SCReporting setUserStopped:](v11, "setUserStopped:", 0LL);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    captureStartTime = v11->_captureStartTime;
    v11->_captureStartTime = (NSDate *)v12;

    id v14 = [v8 copy];
    -[SCReporting setClientBundleID:](v11, "setClientBundleID:", v14);

    unsigned int v15 = [v9 isEqualToString:@"com.apple.systemuiserver"];
    id v16 = 0LL;
    if (v15) {
      id v16 = [v8 hasPrefix:@"/usr/sbin/screencapture"];
    }
    -[SCReporting setIsClientScreenCapture:](v11, "setIsClientScreenCapture:", v16);
    id v17 = [v10 copy];
    -[SCReporting setStreamID:](v11, "setStreamID:", v17);

    v18 = objc_alloc_init(&OBJC_CLASS___RPThermalPressure);
    thermalPressureMonitor = v11->_thermalPressureMonitor;
    v11->_thermalPressureMonitor = v18;

    -[RPThermalPressure setDelegate:](v11->_thermalPressureMonitor, "setDelegate:", v11);
    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    thermalResults = v11->_thermalResults;
    v11->_thermalResults = v20;

    -[SCReporting resetThermalResults](v11, "resetThermalResults");
  }

  return v11;
}

- (int64_t)stringToSCReportingPixelFormat:(id)a3
{
  uint64_t v3 = (uint64_t)[a3 integerValue];
  if (v3 > 1111970368)
  {
    if (v3 != 1111970369)
    {
      if (v3 == 1815162994) {
        return 2LL;
      }
      return 0LL;
    }

    return 1LL;
  }

  else
  {
    if (v3 != 875704422)
    {
      if (v3 == 875704438) {
        return 3LL;
      }
      return 0LL;
    }

    return 4LL;
  }

- (int64_t)stringToSCReportingColorMatrix:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ITU_R_601_4"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"SMPTE_240M_1995"])
  {
    int64_t v4 = 3LL;
  }

  else
  {
    int64_t v4 = [v3 isEqualToString:@"ITU_R_709_2"];
  }

  return v4;
}

- (int64_t)stringToSCReportingColorSpace:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kCGColorSpaceDisplayP3"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceDisplayP3_HLG"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedLinearDisplayP3"])
  {
    int64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceSRGB"])
  {
    int64_t v4 = 4LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceLinearSRGB"])
  {
    int64_t v4 = 5LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedSRGB"])
  {
    int64_t v4 = 6LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedLinearSRGB"])
  {
    int64_t v4 = 7LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceGenericGrayGamma2_2"])
  {
    int64_t v4 = 8LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceLinearGray"])
  {
    int64_t v4 = 9LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedGray"])
  {
    int64_t v4 = 10LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedLinearGray"])
  {
    int64_t v4 = 11LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceGenericRGBLinear"])
  {
    int64_t v4 = 12LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceGenericCMYK"])
  {
    int64_t v4 = 13LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceGenericXYZ"])
  {
    int64_t v4 = 14LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceGenericLab"])
  {
    int64_t v4 = 15LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceACESCGLinear"])
  {
    int64_t v4 = 16LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceAdobeRGB1998"])
  {
    int64_t v4 = 17LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceDCIP3"])
  {
    int64_t v4 = 18LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceITUR_709"])
  {
    int64_t v4 = 19LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceROMMRGB"])
  {
    int64_t v4 = 20LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceITUR_2020"])
  {
    int64_t v4 = 21LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceExtendedLinearITUR_2020"])
  {
    int64_t v4 = 22LL;
  }

  else if ([v3 isEqualToString:@"kCGColorSpaceGenericRGB"])
  {
    int64_t v4 = 23LL;
  }

  else
  {
    int64_t v4 = 24LL;
  }

  return v4;
}

- (int64_t)intToSCReportingAudioSampleRate:(int64_t)a3
{
  if (a3 > 23999)
  {
    if (a3 != 24000)
    {
      if (a3 == 48000) {
        return 4LL;
      }
      return 0LL;
    }

    return 3LL;
  }

  else
  {
    if (a3 != 8000)
    {
      if (a3 == 16000) {
        return 2LL;
      }
      return 0LL;
    }

    return 1LL;
  }

- (int64_t)getCurrentStreamScreenConfiguration
{
  if (self->_individualWindow) {
    return 6LL;
  }
  int64_t includedApplicationsCount = self->_includedApplicationsCount;
  if (includedApplicationsCount && self->_excludedApplicationsCount) {
    return 4LL;
  }
  if (self->_includedWindowsCount)
  {
    if (self->_excludedWindowsCount) {
      return 2LL;
    }
    else {
      return 1LL;
    }
  }

  else if (includedApplicationsCount)
  {
    return 3LL;
  }

  else
  {
    return 5LL;
  }

- (int64_t)getColorFromRGBA:(double)a3 withGreen:(double)a4 withBlue:(double)a5 withAlpha:(double)a6
{
  if (a3 > 1.0 && a4 > 1.0 && a5 > 1.0)
  {
    a3 = a3 / 255.0;
    a4 = a4 / 255.0;
    a5 = a5 / 255.0;
  }

  BOOL v8 = a3 == 0.0;
  if (a4 != 0.0) {
    BOOL v8 = 0;
  }
  BOOL v9 = a5 == 0.0 && v8;
  if (a6 == 0.0 && v9) {
    int64_t result = 16LL;
  }
  else {
    int64_t result = 2LL;
  }
  if (!v9)
  {
    if (a3 == 0.333 && a4 == 0.333 && a5 == 0.333)
    {
      return 3LL;
    }

    else if (a3 == 0.667 && a4 == 0.667 && a5 == 0.667)
    {
      return 4LL;
    }

    else if (a3 == 0.5 && a4 == 0.5 && a5 == 0.5)
    {
      return 6LL;
    }

    else
    {
      BOOL v11 = a3 == 1.0;
      if (a4 != 1.0) {
        BOOL v11 = 0;
      }
      if (v11 && a5 == 1.0)
      {
        return 5LL;
      }

      else
      {
        BOOL v12 = a3 == 1.0;
        if (a4 != 0.0) {
          BOOL v12 = 0;
        }
        if (v12 && a5 == 0.0)
        {
          return 7LL;
        }

        else
        {
          BOOL v13 = a3 == 0.0;
          if (a4 != 1.0) {
            BOOL v13 = 0;
          }
          if (v13 && a5 == 0.0)
          {
            return 8LL;
          }

          else
          {
            if (a5 != 1.0) {
              BOOL v8 = 0;
            }
            if (v8)
            {
              return 9LL;
            }

            else if (a5 == 1.0 && v13)
            {
              return 10LL;
            }

            else if (a5 == 0.0 && v11)
            {
              return 11LL;
            }

            else if (a5 == 1.0 && v12)
            {
              return 12LL;
            }

            else if (a3 == 1.0 && a4 == 0.5 && a5 == 0.0)
            {
              return 13LL;
            }

            else if (a3 == 0.5 && a4 == 0.0 && a5 == 0.5)
            {
              return 14LL;
            }

            else if (a5 == 0.2 && a4 == 0.4 && a3 == 0.6)
            {
              return 15LL;
            }

            else
            {
              return 1LL;
            }
          }
        }
      }
    }
  }

  return result;
}

- (id)collectSummaryEventMetrics
{
  v117 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  v138[0] = @"SID";
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting streamID](self, "streamID"));
  v139[0] = v131;
  v138[1] = @"CVCW";
  id v3 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_100019488(llroundf((float)-[SCReporting frameWidth](self, "frameWidth")), 0x32uLL));
  v130 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v139[1] = v130;
  v138[2] = @"CVCH";
  int64_t v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_100019488(llroundf((float)-[SCReporting frameHeight](self, "frameHeight")), 0x32uLL));
  v129 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v139[2] = v129;
  v138[3] = @"CVCR";
  v5 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf((float)-[SCReporting targetFrameRate](self, "targetFrameRate")), 2uLL));
  v128 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v139[3] = v128;
  v138[4] = @"PVFC";
  v6 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf((float)-[SCReporting totalFrameCount](self, "totalFrameCount")), 2uLL));
  v127 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v139[4] = v127;
  v138[5] = @"CBID";
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting clientBundleID](self, "clientBundleID"));
  unsigned int v125 = -[SCReporting shouldReportBundleID:](self, "shouldReportBundleID:");
  if (v125) {
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[SCReporting clientBundleID](self, "clientBundleID"));
  }
  else {
    v7 = &stru_100073210;
  }
  v66 = (__CFString *)v7;
  v139[5] = v7;
  v138[6] = @"CPF";
  v124 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting pixelFormat](self, "pixelFormat"));
  if (v124)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting pixelFormat](self, "pixelFormat"));
    BOOL v8 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting stringToSCReportingPixelFormat:](self, "stringToSCReportingPixelFormat:")));
  }

  else
  {
    BOOL v8 = &stru_100073210;
  }

  v69 = (__CFString *)v8;
  v139[6] = v8;
  v138[7] = @"CSF";
  v123 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting scaleToFit](self, "scaleToFit")));
  v139[7] = v123;
  v138[8] = @"CPA";
  v122 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting preserveAspectRatio](self, "preserveAspectRatio")));
  v139[8] = v122;
  v138[9] = @"CSC";
  v121 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting showCursor](self, "showCursor")));
  v139[9] = v121;
  v138[10] = @"CBG";
  v120 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting backgroundColor](self, "backgroundColor")));
  v139[10] = v120;
  v138[11] = @"CSW";
  BOOL v9 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_100019488(llroundf((float)-[SCReporting inputSurfaceWidth](self, "inputSurfaceWidth")), 0x32uLL));
  v119 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v139[11] = v119;
  v138[12] = @"CSH";
  id v10 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_100019488(llroundf((float)-[SCReporting inputSurfaceHeight](self, "inputSurfaceHeight")), 0x32uLL));
  v116 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v139[12] = v116;
  v138[13] = @"CDW";
  BOOL v11 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_100019488(llroundf((float)-[SCReporting destSurfaceWidth](self, "destSurfaceWidth")), 0x32uLL));
  v115 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v139[13] = v115;
  v138[14] = @"CDH";
  BOOL v12 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_100019488(llroundf((float)-[SCReporting destSurfaceHeight](self, "destSurfaceHeight")), 0x32uLL));
  v114 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v139[14] = v114;
  v138[15] = @"CQD";
  v113 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting frameQueueSize](self, "frameQueueSize")));
  v139[15] = v113;
  v138[16] = @"CCM";
  uint64_t v13 = objc_claimAutoreleasedReturnValue(-[SCReporting colorMatrix](self, "colorMatrix"));
  if (v13)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting colorMatrix](self, "colorMatrix"));
    id v14 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting stringToSCReportingColorMatrix:]( self,  "stringToSCReportingColorMatrix:")));
  }

  else
  {
    id v14 = &stru_100073210;
  }

  v68 = (__CFString *)v14;
  v139[16] = v14;
  v138[17] = @"CCS";
  v111 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting colorSpace](self, "colorSpace"));
  v112 = (void *)v13;
  if (v111)
  {
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting colorSpace](self, "colorSpace"));
    unsigned int v15 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting stringToSCReportingColorSpace:](self, "stringToSCReportingColorSpace:")));
  }

  else
  {
    unsigned int v15 = &stru_100073210;
  }

  v67 = (__CFString *)v15;
  v139[17] = v15;
  v138[18] = @"PDUR";
  -[SCReporting activeDuration](self, "activeDuration");
  *(float *)&double v16 = v16;
  v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](&OBJC_CLASS___NSNumber, "numberWithLong:", llroundf(*(float *)&v16)));
  v139[18] = v110;
  v138[19] = @"PLAT";
  -[SCReporting averageFrameLatency](self, "averageFrameLatency");
  *(float *)&double v17 = round(v17 * 1000000.0);
  v18 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf(*(float *)&v17), 2uLL));
  v109 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v139[19] = v109;
  v138[20] = @"AE";
  v108 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting audioEnabled](self, "audioEnabled")));
  v139[20] = v108;
  v138[21] = @"ASR";
  v107 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting intToSCReportingAudioSampleRate:]( self,  "intToSCReportingAudioSampleRate:",  -[SCReporting audioSampleRate](self, "audioSampleRate"))));
  v139[21] = v107;
  v138[22] = @"ACC";
  v106 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting audioChannelCount](self, "audioChannelCount")));
  v139[22] = v106;
  v138[23] = @"AEXC";
  v105 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting excludeCallingClientAudio](self, "excludeCallingClientAudio")));
  v139[23] = v105;
  v138[24] = @"ALAT";
  -[SCReporting averageFrameLatencyAudio](self, "averageFrameLatencyAudio");
  *(float *)&double v19 = round(v19 * 1000000.0);
  v20 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf(*(float *)&v19), 2uLL));
  v104 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v139[24] = v104;
  v138[25] = @"CFD";
  v103 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting getCurrentStreamScreenConfiguration](self, "getCurrentStreamScreenConfiguration")));
  v139[25] = v103;
  v138[26] = @"CFSRC";
  v102 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting filterSource](self, "filterSource")));
  v139[26] = v102;
  v138[27] = @"SWCMD";
  v101 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting startWithCompositeMode](self, "startWithCompositeMode")));
  v139[27] = v101;
  v138[28] = @"NDUR";
  -[SCReporting newsroomTotalDuration](self, "newsroomTotalDuration");
  *(float *)&double v21 = v21;
  v22 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf(*(float *)&v21), 2uLL));
  v100 = (void *)objc_claimAutoreleasedReturnValue(v22);
  v139[28] = v100;
  v138[29] = @"FDUR";
  -[SCReporting floatingTotalDuration](self, "floatingTotalDuration");
  *(float *)&double v23 = v23;
  v24 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf(*(float *)&v23), 2uLL));
  v99 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v139[29] = v99;
  v138[30] = @"NSC";
  v25 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting newsroomSessionCount](self, "newsroomSessionCount"), 2uLL));
  v98 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v139[30] = v98;
  v138[31] = @"FSC";
  __int16 v26 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting floatingSessionCount](self, "floatingSessionCount"), 2uLL));
  v97 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v139[31] = v97;
  v138[32] = @"NFC";
  int v27 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting newsroomTotalFrameCount](self, "newsroomTotalFrameCount"), 2uLL));
  v96 = (void *)objc_claimAutoreleasedReturnValue(v27);
  v139[32] = v96;
  v138[33] = @"FFC";
  __int16 v28 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting floatingTotalFrameCount](self, "floatingTotalFrameCount"), 2uLL));
  v95 = (void *)objc_claimAutoreleasedReturnValue(v28);
  v139[33] = v95;
  v138[34] = @"NTFC";
  v29 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8( -[SCReporting newsroomToFloatingTransitionCount](self, "newsroomToFloatingTransitionCount"),  2uLL));
  v94 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v139[34] = v94;
  v138[35] = @"FTNC";
  v30 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8( -[SCReporting floatingToNewsroomTransitionCount](self, "floatingToNewsroomTransitionCount"),  2uLL));
  v93 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v139[35] = v93;
  v138[36] = @"NTLC";
  v31 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting newsroomTopLeftWindowCount](self, "newsroomTopLeftWindowCount"), 2uLL));
  v92 = (void *)objc_claimAutoreleasedReturnValue(v31);
  v139[36] = v92;
  v138[37] = @"NTRC";
  v32 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting newsroomTopRightWindowCount](self, "newsroomTopRightWindowCount"), 2uLL));
  v91 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v139[37] = v91;
  v138[38] = @"NBRC";
  v33 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting newsroomBottomRightWindowCount](self, "newsroomBottomRightWindowCount"), 2uLL));
  v90 = (void *)objc_claimAutoreleasedReturnValue(v33);
  v139[38] = v90;
  v138[39] = @"NBLC";
  v34 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting newsroomBottomLeftWindowCount](self, "newsroomBottomLeftWindowCount"), 2uLL));
  v89 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v139[39] = v89;
  v138[40] = @"NFMC";
  v35 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting newsroomFullScreenContentCount](self, "newsroomFullScreenContentCount"), 2uLL));
  v88 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v139[40] = v88;
  v138[41] = @"PDR";
  -[SCReporting portraitEffectTotalDuration](self, "portraitEffectTotalDuration");
  *(float *)&double v36 = v36;
  v37 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf(*(float *)&v36), 2uLL));
  v87 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v139[41] = v87;
  v138[42] = @"CSDR";
  -[SCReporting centerStageEffectTotalDuration](self, "centerStageEffectTotalDuration");
  *(float *)&double v38 = v38;
  v39 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf(*(float *)&v38), 2uLL));
  v86 = (void *)objc_claimAutoreleasedReturnValue(v39);
  v139[42] = v86;
  v138[43] = @"SLDR";
  -[SCReporting studioLightEffectTotalDuration](self, "studioLightEffectTotalDuration");
  *(float *)&double v40 = v40;
  v41 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf(*(float *)&v40), 2uLL));
  v85 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v139[43] = v85;
  v138[44] = @"BGDR";
  -[SCReporting backgroundReplacementTotalDuration](self, "backgroundReplacementTotalDuration");
  *(float *)&double v42 = v42;
  v43 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf(*(float *)&v42), 2uLL));
  v84 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v139[44] = v84;
  v138[45] = @"GBRE";
  v83 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting gestureDetectionBasedReactionsEnabled](self, "gestureDetectionBasedReactionsEnabled")));
  v139[45] = v83;
  v138[46] = @"MTRC";
  v44 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting manualTriggeredReactionsCount](self, "manualTriggeredReactionsCount"), 2uLL));
  v82 = (void *)objc_claimAutoreleasedReturnValue(v44);
  v139[46] = v82;
  v138[47] = @"PIEV";
  v81 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting portraitIntensityEndValue](self, "portraitIntensityEndValue")));
  v139[47] = v81;
  v138[48] = @"SIEV";
  v80 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting studioLightIntensityEndValue](self, "studioLightIntensityEndValue")));
  v139[48] = v80;
  v138[49] = @"CDT";
  v79 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting cameraDeviceType](self, "cameraDeviceType")));
  v139[49] = v79;
  v138[50] = @"IWC";
  v78 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting includedWindowsCount](self, "includedWindowsCount")));
  v139[50] = v78;
  v138[51] = @"IAC";
  v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting includedApplicationsCount](self, "includedApplicationsCount")));
  v139[51] = v77;
  v138[52] = @"EWC";
  v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting excludedWindowsCount](self, "excludedWindowsCount")));
  v139[52] = v76;
  v138[53] = @"EAC";
  v75 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting excludedApplicationsCount](self, "excludedApplicationsCount")));
  v139[53] = v75;
  v138[54] = @"US";
  v74 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting userStopped](self, "userStopped")));
  v139[54] = v74;
  v138[55] = @"DUID";
  v73 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  +[RPStringUtility rotatingDeviceUniqueID](&OBJC_CLASS___RPStringUtility, "rotatingDeviceUniqueID")));
  v139[55] = v73;
  v138[56] = @"CRT";
  v72 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting captureResolutionType](self, "captureResolutionType")));
  v139[56] = v72;
  v138[57] = @"CHDR";
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting captureDynamicRange](self, "captureDynamicRange")));
  v139[57] = v71;
  v138[58] = @"MICE";
  v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting micEnabled](self, "micEnabled")));
  v139[58] = v70;
  v138[59] = @"MLAT";
  -[SCReporting averageFrameLatencyMic](self, "averageFrameLatencyMic");
  *(float *)&double v45 = round(v45 * 1000000.0);
  v46 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf(*(float *)&v45), 2uLL));
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
  v139[59] = v47;
  v138[60] = @"REC";
  v48 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting recordingOutputCount](self, "recordingOutputCount"), 2uLL));
  v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
  v139[60] = v49;
  v138[61] = @"RED";
  v50 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting recordingTotalDuration](self, "recordingTotalDuration"), 2uLL));
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v139[61] = v51;
  v138[62] = @"RES";
  v52 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting recordingTotalFileSize](self, "recordingTotalFileSize"), 2uLL));
  v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
  v139[62] = v53;
  v138[63] = @"CSS";
  v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting isClientScreenCapture](self, "isClientScreenCapture")));
  v139[63] = v54;
  v138[64] = @"CSMC";
  v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting showMouseClicks](self, "showMouseClicks")));
  v139[64] = v55;
  v138[65] = @"PAFC";
  v56 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf((float)-[SCReporting totalAudioFrameCount](self, "totalAudioFrameCount")), 2uLL));
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v139[65] = v57;
  v138[66] = @"PMFC";
  v58 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(llroundf((float)-[SCReporting totalMicFrameCount](self, "totalMicFrameCount")), 2uLL));
  v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
  v139[66] = v59;
  v138[67] = @"TPL";
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting thermalDescription](self, "thermalDescription"));
  v139[67] = v60;
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v139,  v138,  68LL));
  v118 = -[NSMutableDictionary initWithDictionary:](v117, "initWithDictionary:", v61);

  if (v111)
  {
  }

  if (v112)
  {
  }

  if (v124)
  {
  }

  if (v125) {
  if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  }
  {
    *(_DWORD *)buf = 136446722;
    v133 = "-[SCReporting collectSummaryEventMetrics]";
    __int16 v134 = 1024;
    int v135 = 328;
    __int16 v136 = 2112;
    v137 = v118;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d %@",  buf,  0x1Cu);
  }

  return v118;
}

- (id)thermalDescription
{
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_thermalResults, "allKeys"));
  id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  int64_t v4 = &stru_100073210;
  if (v3)
  {
    id v5 = v3;
    int v6 = 0;
    uint64_t v7 = *(void *)v17;
    do
    {
      BOOL v8 = 0LL;
      BOOL v9 = v4;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_thermalResults,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)v8)));
        BOOL v11 = (void *)v10;
        BOOL v12 = ",";
        if (!(v6 + (_DWORD)v8)) {
          BOOL v12 = "";
        }
        if (v10) {
          uint64_t v13 = (const __CFString *)v10;
        }
        else {
          uint64_t v13 = &stru_100073210;
        }
        int64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue( -[__CFString stringByAppendingFormat:]( v9,  "stringByAppendingFormat:",  @"%s%@",  v12,  v13));

        BOOL v8 = (char *)v8 + 1;
        BOOL v9 = v4;
      }

      while (v5 != v8);
      id v5 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      v6 += (int)v8;
    }

    while (v5);
  }

  return v4;
}

- (void)updateReportWithContentFilterDictionary:(id)a3
{
  id v18 = a3;
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SCStreamContentFilterIndividualWindowID"]);

  if (v4)
  {
    self->_individualWindow = 1;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SCStreamContentFilterIncludedWindows"]);
    self->_includedWindowsCount = (int64_t)[v5 count];

    int v6 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SCStreamContentFilterExcludedWindows"]);
    self->_excludedWindowsCount = (int64_t)[v6 count];

    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SCStreamContentFilterIncludedBundleIDs"]);
    id v8 = [v7 count];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SCStreamContentFilterIncludedVideoPIDs"]);
    self->_int64_t includedApplicationsCount = (int64_t)v8 + (void)[v9 count];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SCStreamContentFilterExcludedBundleIDs"]);
    id v11 = [v10 count];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SCStreamContentFilterExcludedVideoPIDs"]);
    self->_excludedApplicationsCount = (int64_t)v11 + (void)[v12 count];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SCStreamPreservedContentFilterCompositeConfig"]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"SCStreamPropertiesCompositeSessionMode"]);
  id v15 = 0LL;
  if (v13 && v14) {
    id v15 = [v14 integerValue];
  }
  self->_startWithCompositeMode = (int64_t)v15;
  id v16 = (id)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:@"SCStreamContentFilterSource"]);
  __int128 v17 = v16;
  if (v16) {
    id v16 = [v16 integerValue];
  }
  self->_filterSource = (int64_t)v16;
}

- (void)updateReportWithClientProperties:(id)a3
{
  id v104 = a3;
  uint64_t v4 = objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesWidth"]);
  if (v4)
  {
    id v5 = (void *)v4;
    int v6 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesHeight"]);

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesWidth"]);
      [v7 floatValue];
      float v9 = v8;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesHeight"]);
      [v10 floatValue];
      float v12 = v11;

      self->_frameWidth = (uint64_t)v9;
      self->_frameHeight = (uint64_t)v12;
    }
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesPixelFormat"]);

  if (v13)
  {
    id v14 = (NSString *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesPixelFormat"]);
    pixelFormat = self->_pixelFormat;
    self->_pixelFormat = v14;
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesFrameRate"]);
  if (v16)
  {
    __int128 v17 = (void *)v16;
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesFrameRate"]);
    [v18 doubleValue];
    double v20 = v19;

    if (v20 > 0.0)
    {
      double v21 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesFrameRate"]);
      [v21 doubleValue];
      self->_targetFrameRate = (uint64_t)(1.0 / v22);
    }
  }

  double v23 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesScaleToFit"]);

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesScaleToFit"]);
    self->_scaleToFit = [v24 BOOLValue];
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesPreserveAspectRatio"]);

  if (v25)
  {
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesPreserveAspectRatio"]);
    self->_preserveAspectRatio = [v26 BOOLValue];
  }

  uint64_t v27 = objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesQueueDepth"]);
  if (v27)
  {
    __int16 v28 = (void *)v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesQueueDepth"]);
    if ((uint64_t)[v29 longValue] <= 0)
    {
    }

    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesQueueDepth"]);
      uint64_t v31 = (uint64_t)[v30 longValue];

      if (v31 > 8) {
        goto LABEL_19;
      }
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue([v104 objectForKeyedSubscript:@"SCStreamPropertiesQueueDepth"]);
      self->_frameQueueSize = (int64_t)[v28 longValue];
    }
  }

- (int64_t)stringToSCReportingRecordingFileType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AVFileTypeMPEG4])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:AVFileTypeQuickTimeMovie])
  {
    int64_t v4 = 2LL;
  }

  else
  {
    int64_t v4 = 1LL;
  }

  return v4;
}

- (int64_t)stringToSCReportingRecordingVideoCodecType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AVVideoCodecTypeH264])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:AVVideoCodecTypeHEVC])
  {
    int64_t v4 = 2LL;
  }

  else
  {
    int64_t v4 = 1LL;
  }

  return v4;
}

- (void)updateReportWithRecordingStartConfiguration:(id)a3
{
  int64_t v4 = self->_recordingOutputCount + 1;
  self->_recordingOutputDuration = 0LL;
  self->_recordingOutputFileSize = 0LL;
  self->_recordingOutputCount = v4;
  id v5 = a3;
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"SCRecordingOutputConfigOutputFileType"]);
  self->_recordingOutputFileType = -[SCReporting stringToSCReportingRecordingFileType:]( self,  "stringToSCReportingRecordingFileType:",  v6);

  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"SCRecordingOutputConfigVideoCodecType"]);
  self->_recordingOutputVideoCodecType = -[SCReporting stringToSCReportingRecordingVideoCodecType:]( self,  "stringToSCReportingRecordingVideoCodecType:",  v7);
}

- (void)updateReportWithRecordingFinishDuration:(int64_t)a3 fileSize:(int64_t)a4
{
  self->_recordingOutputDuration = a3;
  self->_recordingOutputFileSize = a4;
  self->_recordingTotalDuration += a3;
  self->_recordingTotalFileSize += a4;
}

- (id)collectSummaryRecordingEventMetrics
{
  v13[0] = @"SID";
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting streamID](self, "streamID"));
  v14[0] = v3;
  v13[1] = @"RED";
  int64_t v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting recordingOutputDuration](self, "recordingOutputDuration"), 2uLL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v14[1] = v5;
  v13[2] = @"RES";
  int v6 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000194A8(-[SCReporting recordingOutputFileSize](self, "recordingOutputFileSize"), 2uLL));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v14[2] = v7;
  v13[3] = @"REFT";
  float v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting recordingOutputFileType](self, "recordingOutputFileType")));
  v14[3] = v8;
  v13[4] = @"REVC";
  float v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCReporting recordingOutputVideoCodecType](self, "recordingOutputVideoCodecType")));
  v14[4] = v9;
  v13[5] = @"CSS";
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCReporting isClientScreenCapture](self, "isClientScreenCapture")));
  v14[5] = v10;
  float v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  6LL));

  return v11;
}

- (void)reportRecordingRTCEvent:(id)a3 withStreamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting collectSummaryRecordingEventMetrics](self, "collectSummaryRecordingEventMetrics"));
  if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446722;
    uint64_t v10 = "-[SCReporting reportRecordingRTCEvent:withStreamID:]";
    __int16 v11 = 1024;
    int v12 = 502;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d reportingMetric=%@",  (uint8_t *)&v9,  0x1Cu);
  }

  [v6 reportSCEventWithType:1 dictionary:v8 streamID:v7];
}

- (void)resetReportingMetrics
{
  id v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  captureStartTime = self->_captureStartTime;
  self->_captureStartTime = v3;

  self->_totalFrameCount = 0LL;
  self->_userStopped = 0;
  *(_OWORD *)&self->_totalAudioFrameCount = 0u;
  *(_OWORD *)&self->_newsroomTotalDuration = 0u;
  *(_OWORD *)&self->_newsroomSessionCount = 0u;
  *(_OWORD *)&self->_recordingTotalDuration = 0u;
  -[SCReporting resetThermalResults](self, "resetThermalResults");
}

- (void)resetThermalResults
{
  id v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  thermalLevelIntervalStartTime = self->_thermalLevelIntervalStartTime;
  self->_thermalLevelIntervalStartTime = v3;

  -[RPThermalPressure startMonitoring](self->_thermalPressureMonitor, "startMonitoring");
}

- (void)reportRTCEvent:(id)a3 withStreamID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  float v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v8 timeIntervalSinceDate:self->_captureStartTime];
  self->_double activeDuration = v9;

  if (self->_activeDuration <= 5.0)
  {
    if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      double activeDuration = self->_activeDuration;
      int v12 = 136446978;
      __int16 v13 = "-[SCReporting reportRTCEvent:withStreamID:]";
      __int16 v14 = 1024;
      int v15 = 542;
      __int16 v16 = 2048;
      double v17 = activeDuration;
      __int16 v18 = 1024;
      int v19 = 5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d not reporting session of %f seconds less than %d seconds",  (uint8_t *)&v12,  0x22u);
    }
  }

  else
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCReporting collectSummaryEventMetrics](self, "collectSummaryEventMetrics"));
    if (!dword_100084688 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136446722;
      __int16 v13 = "-[SCReporting reportRTCEvent:withStreamID:]";
      __int16 v14 = 1024;
      int v15 = 538;
      __int16 v16 = 2112;
      double v17 = *(double *)&v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [DEBUG] %{public}s:%d reportingMetric=%@",  (uint8_t *)&v12,  0x1Cu);
    }

    [v6 reportSCEventWithType:1 dictionary:v10 streamID:v7];
    -[SCReporting resetReportingMetrics](self, "resetReportingMetrics");
  }

  -[SCReporting resetReportingMetrics](self, "resetReportingMetrics");
}

- (BOOL)shouldReportBundleID:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if (qword_100084720 != -1) {
      dispatch_once(&qword_100084720, &stru_100071438);
    }
    gettimeofday(&v11, 0LL);
    localtime_r(&v11.tv_sec, &v10);
    int data = v10.tm_yday + 366 * v10.tm_year;
    CC_SHA256_Init(&c);
    CC_SHA256_Update(&c, &unk_100084710, 0x10u);
    CC_SHA256_Update(&c, &data, 4u);
    if (v3)
    {
      int64_t v4 = (const char *)[v3 UTF8String];
      CC_LONG v5 = strlen(v4);
      CC_SHA256_Update(&c, v4, v5);
    }

    CC_SHA256_Final(md, &c);
    BOOL v6 = *(unsigned __int16 *)md < 0x290u;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)thermalPressureDidChangeWithLevel:(int64_t)a3
{
  if (dword_100084688 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136446722;
    BOOL v6 = "-[SCReporting thermalPressureDidChangeWithLevel:]";
    __int16 v7 = 1024;
    int v8 = 580;
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  " [INFO] %{public}s:%d level=%ld",  (uint8_t *)&v5,  0x1Cu);
  }

  -[SCReporting addToThermalResultsWithLevel:](self, "addToThermalResultsWithLevel:", a3);
}

- (void)addToThermalResultsWithLevel:(int64_t)a3
{
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v5 timeIntervalSinceDate:self->_thermalLevelIntervalStartTime];
  *(float *)&double v6 = v6;
  double v7 = (double)(uint64_t)llroundf(*(float *)&v6);

  thermalResults = self->_thermalResults;
  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](thermalResults, "objectForKeyedSubscript:", v9));
  [v10 doubleValue];
  double v12 = v11 + v7;

  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v12));
  __int16 v14 = self->_thermalResults;
  int v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  __int16 v16 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  thermalLevelIntervalStartTime = self->_thermalLevelIntervalStartTime;
  self->_thermalLevelIntervalStartTime = v16;
}

+ (void)reportAlertRTCEventWithClientBundelID:(id)a3 isLegacy:(BOOL)a4 didAlert:(BOOL)a5 methodType:(unint64_t)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v9 = a3;
  __int16 v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v9, @"CBID");

  int64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v10, @"ALT");

  double v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v8));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v11, @"LGC");

  double v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a6));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, @"MTY");

  +[RPReportingAgent sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:]( &OBJC_CLASS___RPReportingAgent,  "sendReportEventWithType:dictionary:withServiceName:clientBundleId:sessionID:",  6LL,  v13,  @"SCKCapture",  @"com.apple.replayd",  &stru_100073210);
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
}

- (int64_t)frameWidth
{
  return self->_frameWidth;
}

- (void)setFrameWidth:(int64_t)a3
{
  self->_frameWidth = a3;
}

- (int64_t)frameHeight
{
  return self->_frameHeight;
}

- (void)setFrameHeight:(int64_t)a3
{
  self->_frameHeight = a3;
}

- (int64_t)targetFrameRate
{
  return self->_targetFrameRate;
}

- (void)setTargetFrameRate:(int64_t)a3
{
  self->_targetFrameRate = a3;
}

- (int64_t)totalFrameCount
{
  return self->_totalFrameCount;
}

- (void)setTotalFrameCount:(int64_t)a3
{
  self->_totalFrameCount = a3;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSString)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(id)a3
{
}

- (BOOL)scaleToFit
{
  return self->_scaleToFit;
}

- (void)setScaleToFit:(BOOL)a3
{
  self->_scaleToFit = a3;
}

- (BOOL)preserveAspectRatio
{
  return self->_preserveAspectRatio;
}

- (void)setPreserveAspectRatio:(BOOL)a3
{
  self->_preserveAspectRatio = a3;
}

- (BOOL)showCursor
{
  return self->_showCursor;
}

- (void)setShowCursor:(BOOL)a3
{
  self->_showCursor = a3;
}

- (int64_t)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(int64_t)a3
{
  self->_backgroundColor = a3;
}

- (int64_t)inputSurfaceWidth
{
  return self->_inputSurfaceWidth;
}

- (void)setInputSurfaceWidth:(int64_t)a3
{
  self->_inputSurfaceWidth = a3;
}

- (int64_t)inputSurfaceHeight
{
  return self->_inputSurfaceHeight;
}

- (void)setInputSurfaceHeight:(int64_t)a3
{
  self->_inputSurfaceHeight = a3;
}

- (int64_t)destSurfaceWidth
{
  return self->_destSurfaceWidth;
}

- (void)setDestSurfaceWidth:(int64_t)a3
{
  self->_destSurfaceWidth = a3;
}

- (int64_t)destSurfaceHeight
{
  return self->_destSurfaceHeight;
}

- (void)setDestSurfaceHeight:(int64_t)a3
{
  self->_destSurfaceHeight = a3;
}

- (int64_t)frameQueueSize
{
  return self->_frameQueueSize;
}

- (void)setFrameQueueSize:(int64_t)a3
{
  self->_frameQueueSize = a3;
}

- (NSString)colorMatrix
{
  return self->_colorMatrix;
}

- (void)setColorMatrix:(id)a3
{
}

- (NSString)colorSpace
{
  return self->_colorSpace;
}

- (void)setColorSpace:(id)a3
{
}

- (float)contentScale
{
  return self->_contentScale;
}

- (void)setContentScale:(float)a3
{
  self->_contentScale = a3;
}

- (int64_t)totalAudioFrameCount
{
  return self->_totalAudioFrameCount;
}

- (void)setTotalAudioFrameCount:(int64_t)a3
{
  self->_totalAudioFrameCount = a3;
}

- (int64_t)totalMicFrameCount
{
  return self->_totalMicFrameCount;
}

- (void)setTotalMicFrameCount:(int64_t)a3
{
  self->_totalMicFrameCount = a3;
}

- (int64_t)includedWindowsCount
{
  return self->_includedWindowsCount;
}

- (void)setIncludedWindowsCount:(int64_t)a3
{
  self->_includedWindowsCount = a3;
}

- (int64_t)excludedWindowsCount
{
  return self->_excludedWindowsCount;
}

- (void)setExcludedWindowsCount:(int64_t)a3
{
  self->_excludedWindowsCount = a3;
}

- (int64_t)includedApplicationsCount
{
  return self->_includedApplicationsCount;
}

- (void)setIncludedApplicationsCount:(int64_t)a3
{
  self->_int64_t includedApplicationsCount = a3;
}

- (int64_t)excludedApplicationsCount
{
  return self->_excludedApplicationsCount;
}

- (void)setExcludedApplicationsCount:(int64_t)a3
{
  self->_excludedApplicationsCount = a3;
}

- (BOOL)userStopped
{
  return self->_userStopped;
}

- (void)setUserStopped:(BOOL)a3
{
  self->_userStopped = a3;
}

- (BOOL)individualWindow
{
  return self->_individualWindow;
}

- (void)setIndividualWindow:(BOOL)a3
{
  self->_individualWindow = a3;
}

- (double)activeDuration
{
  return self->_activeDuration;
}

- (void)setActiveDuration:(double)a3
{
  self->_double activeDuration = a3;
}

- (double)averageFrameLatency
{
  return self->_averageFrameLatency;
}

- (void)setAverageFrameLatency:(double)a3
{
  self->_averageFrameLatency = a3;
}

- (BOOL)audioEnabled
{
  return self->_audioEnabled;
}

- (void)setAudioEnabled:(BOOL)a3
{
  self->_audioEnabled = a3;
}

- (int64_t)audioSampleRate
{
  return self->_audioSampleRate;
}

- (void)setAudioSampleRate:(int64_t)a3
{
  self->_audioSampleRate = a3;
}

- (int64_t)audioChannelCount
{
  return self->_audioChannelCount;
}

- (void)setAudioChannelCount:(int64_t)a3
{
  self->_audioChannelCount = a3;
}

- (int64_t)excludeCallingClientAudio
{
  return self->_excludeCallingClientAudio;
}

- (void)setExcludeCallingClientAudio:(int64_t)a3
{
  self->_excludeCallingClientAudio = a3;
}

- (double)averageFrameLatencyAudio
{
  return self->_averageFrameLatencyAudio;
}

- (void)setAverageFrameLatencyAudio:(double)a3
{
  self->_averageFrameLatencyAudio = a3;
}

- (int64_t)filterSource
{
  return self->_filterSource;
}

- (void)setFilterSource:(int64_t)a3
{
  self->_filterSource = a3;
}

- (int64_t)startWithCompositeMode
{
  return self->_startWithCompositeMode;
}

- (void)setStartWithCompositeMode:(int64_t)a3
{
  self->_startWithCompositeMode = a3;
}

- (double)newsroomTotalDuration
{
  return self->_newsroomTotalDuration;
}

- (void)setNewsroomTotalDuration:(double)a3
{
  self->_newsroomTotalDuration = a3;
}

- (double)floatingTotalDuration
{
  return self->_floatingTotalDuration;
}

- (void)setFloatingTotalDuration:(double)a3
{
  self->_floatingTotalDuration = a3;
}

- (int64_t)newsroomSessionCount
{
  return self->_newsroomSessionCount;
}

- (void)setNewsroomSessionCount:(int64_t)a3
{
  self->_newsroomSessionCount = a3;
}

- (int64_t)floatingSessionCount
{
  return self->_floatingSessionCount;
}

- (void)setFloatingSessionCount:(int64_t)a3
{
  self->_floatingSessionCount = a3;
}

- (int64_t)newsroomTotalFrameCount
{
  return self->_newsroomTotalFrameCount;
}

- (void)setNewsroomTotalFrameCount:(int64_t)a3
{
  self->_newsroomTotalFrameCount = a3;
}

- (int64_t)floatingTotalFrameCount
{
  return self->_floatingTotalFrameCount;
}

- (void)setFloatingTotalFrameCount:(int64_t)a3
{
  self->_floatingTotalFrameCount = a3;
}

- (int64_t)newsroomAverageLatency
{
  return self->_newsroomAverageLatency;
}

- (void)setNewsroomAverageLatency:(int64_t)a3
{
  self->_newsroomAverageLatency = a3;
}

- (int64_t)floatingAverageLatency
{
  return self->_floatingAverageLatency;
}

- (void)setFloatingAverageLatency:(int64_t)a3
{
  self->_floatingAverageLatency = a3;
}

- (int64_t)newsroomToFloatingTransitionCount
{
  return self->_newsroomToFloatingTransitionCount;
}

- (void)setNewsroomToFloatingTransitionCount:(int64_t)a3
{
  self->_newsroomToFloatingTransitionCount = a3;
}

- (int64_t)floatingToNewsroomTransitionCount
{
  return self->_floatingToNewsroomTransitionCount;
}

- (void)setFloatingToNewsroomTransitionCount:(int64_t)a3
{
  self->_floatingToNewsroomTransitionCount = a3;
}

- (int64_t)newsroomTopLeftWindowCount
{
  return self->_newsroomTopLeftWindowCount;
}

- (void)setNewsroomTopLeftWindowCount:(int64_t)a3
{
  self->_newsroomTopLeftWindowCount = a3;
}

- (int64_t)newsroomTopRightWindowCount
{
  return self->_newsroomTopRightWindowCount;
}

- (void)setNewsroomTopRightWindowCount:(int64_t)a3
{
  self->_newsroomTopRightWindowCount = a3;
}

- (int64_t)newsroomBottomLeftWindowCount
{
  return self->_newsroomBottomLeftWindowCount;
}

- (void)setNewsroomBottomLeftWindowCount:(int64_t)a3
{
  self->_newsroomBottomLeftWindowCount = a3;
}

- (int64_t)newsroomBottomRightWindowCount
{
  return self->_newsroomBottomRightWindowCount;
}

- (void)setNewsroomBottomRightWindowCount:(int64_t)a3
{
  self->_newsroomBottomRightWindowCount = a3;
}

- (int64_t)newsroomFullScreenContentCount
{
  return self->_newsroomFullScreenContentCount;
}

- (void)setNewsroomFullScreenContentCount:(int64_t)a3
{
  self->_newsroomFullScreenContentCount = a3;
}

- (double)portraitEffectTotalDuration
{
  return self->_portraitEffectTotalDuration;
}

- (void)setPortraitEffectTotalDuration:(double)a3
{
  self->_portraitEffectTotalDuration = a3;
}

- (double)centerStageEffectTotalDuration
{
  return self->_centerStageEffectTotalDuration;
}

- (void)setCenterStageEffectTotalDuration:(double)a3
{
  self->_centerStageEffectTotalDuration = a3;
}

- (double)studioLightEffectTotalDuration
{
  return self->_studioLightEffectTotalDuration;
}

- (void)setStudioLightEffectTotalDuration:(double)a3
{
  self->_studioLightEffectTotalDuration = a3;
}

- (double)backgroundReplacementTotalDuration
{
  return self->_backgroundReplacementTotalDuration;
}

- (void)setBackgroundReplacementTotalDuration:(double)a3
{
  self->_backgroundReplacementTotalDuration = a3;
}

- (BOOL)gestureDetectionBasedReactionsEnabled
{
  return self->_gestureDetectionBasedReactionsEnabled;
}

- (void)setGestureDetectionBasedReactionsEnabled:(BOOL)a3
{
  self->_gestureDetectionBasedReactionsEnabled = a3;
}

- (int64_t)manualTriggeredReactionsCount
{
  return self->_manualTriggeredReactionsCount;
}

- (void)setManualTriggeredReactionsCount:(int64_t)a3
{
  self->_manualTriggeredReactionsCount = a3;
}

- (int64_t)studioLightIntensityEndValue
{
  return self->_studioLightIntensityEndValue;
}

- (void)setStudioLightIntensityEndValue:(int64_t)a3
{
  self->_studioLightIntensityEndValue = a3;
}

- (int64_t)portraitIntensityEndValue
{
  return self->_portraitIntensityEndValue;
}

- (void)setPortraitIntensityEndValue:(int64_t)a3
{
  self->_portraitIntensityEndValue = a3;
}

- (int64_t)cameraDeviceType
{
  return self->_cameraDeviceType;
}

- (void)setCameraDeviceType:(int64_t)a3
{
  self->_cameraDeviceType = a3;
}

- (int64_t)captureResolutionType
{
  return self->_captureResolutionType;
}

- (void)setCaptureResolutionType:(int64_t)a3
{
  self->_captureResolutionType = a3;
}

- (int64_t)captureDynamicRange
{
  return self->_captureDynamicRange;
}

- (void)setCaptureDynamicRange:(int64_t)a3
{
  self->_captureDynamicRange = a3;
}

- (BOOL)micEnabled
{
  return self->_micEnabled;
}

- (void)setMicEnabled:(BOOL)a3
{
  self->_micEnabled = a3;
}

- (double)averageFrameLatencyMic
{
  return self->_averageFrameLatencyMic;
}

- (void)setAverageFrameLatencyMic:(double)a3
{
  self->_averageFrameLatencyMiCC_SHA256_CTX c = a3;
}

- (int64_t)recordingOutputCount
{
  return self->_recordingOutputCount;
}

- (void)setRecordingOutputCount:(int64_t)a3
{
  self->_recordingOutputCount = a3;
}

- (int64_t)recordingOutputDuration
{
  return self->_recordingOutputDuration;
}

- (void)setRecordingOutputDuration:(int64_t)a3
{
  self->_recordingOutputDuration = a3;
}

- (int64_t)recordingOutputFileSize
{
  return self->_recordingOutputFileSize;
}

- (void)setRecordingOutputFileSize:(int64_t)a3
{
  self->_recordingOutputFileSize = a3;
}

- (int64_t)recordingOutputFileType
{
  return self->_recordingOutputFileType;
}

- (void)setRecordingOutputFileType:(int64_t)a3
{
  self->_recordingOutputFileType = a3;
}

- (int64_t)recordingOutputVideoCodecType
{
  return self->_recordingOutputVideoCodecType;
}

- (void)setRecordingOutputVideoCodecType:(int64_t)a3
{
  self->_recordingOutputVideoCodecType = a3;
}

- (int64_t)recordingTotalDuration
{
  return self->_recordingTotalDuration;
}

- (void)setRecordingTotalDuration:(int64_t)a3
{
  self->_recordingTotalDuration = a3;
}

- (int64_t)recordingTotalFileSize
{
  return self->_recordingTotalFileSize;
}

- (void)setRecordingTotalFileSize:(int64_t)a3
{
  self->_recordingTotalFileSize = a3;
}

- (BOOL)isClientScreenCapture
{
  return self->_isClientScreenCapture;
}

- (void)setIsClientScreenCapture:(BOOL)a3
{
  self->_isClientScreenCapture = a3;
}

- (BOOL)showMouseClicks
{
  return self->_showMouseClicks;
}

- (void)setShowMouseClicks:(BOOL)a3
{
  self->_showMouseClicks = a3;
}

- (int64_t)recordingEndReason
{
  return self->_recordingEndReason;
}

- (void)setRecordingEndReason:(int64_t)a3
{
  self->_recordingEndReason = a3;
}

- (void).cxx_destruct
{
}

@end