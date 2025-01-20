@interface TVPPlayer
- (BOOL)trackEnabled:(int64_t)a3;
- (id)accessLogArray;
- (id)errorLogArray;
- (id)mediaItemForIdentifier:(id)a3;
- (id)playbackInfo;
- (id)selectedMediaArray;
- (id)timedMetadata;
- (void)addMediaDataCollector:(id)a3;
- (void)removeMediaDataCollector:(id)a3;
- (void)setAudioSessionID:(unsigned int)a3;
- (void)setForwardPlaybackEndTime:(id *)a3;
- (void)setPlayerPosition:(double)a3;
- (void)setPlayerRate:(float)a3;
- (void)setReversePlaybackEndTime:(id *)a3;
- (void)setSelectedMediaArray:(id)a3;
- (void)setTrackEnabled:(BOOL)a3 trackID:(int64_t)a4;
@end

@implementation TVPPlayer

- (id)playbackInfo
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 currentItem]);
    v7 = v6;
    if (v6)
    {
      id v8 = [v6 status];
      if (v8 == (id)1) {
        CFBooleanRef v9 = kCFBooleanTrue;
      }
      else {
        CFBooleanRef v9 = kCFBooleanFalse;
      }
      [v3 setObject:v9 forKeyedSubscript:@"readyToPlay"];
      if (v8 == (id)1)
      {
        -[TVPPlayer elapsedCMTime](self, "elapsedCMTime");
        __int128 time = v92;
        *(void *)&time_16[0] = v93;
        CFDictionaryRef v10 = CMTimeCopyAsDictionary((CMTime *)&time, 0LL);
        if (v10)
        {
          CFDictionaryRef v11 = v10;
          [v3 setObject:v10 forKeyedSubscript:@"positionCMTime"];
          CFRelease(v11);
        }

        if ((BYTE12(v92) & 0x1D) == 1)
        {
          double Seconds = 0.0;
          if ((BYTE12(v92) & 0x10) == 0)
          {
            __int128 time = v92;
            *(void *)&time_16[0] = v93;
            double Seconds = CMTimeGetSeconds((CMTime *)&time);
          }
        }

        else
        {
          double Seconds = 0.0;
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Seconds));
        [v3 setObject:v17 forKeyedSubscript:@"position"];

        -[TVPPlayer durationCMTime](self, "durationCMTime");
        __int128 time = v90;
        *(void *)&time_16[0] = v91;
        CFDictionaryRef v18 = CMTimeCopyAsDictionary((CMTime *)&time, 0LL);
        if (v18)
        {
          CFDictionaryRef v19 = v18;
          [v3 setObject:v18 forKeyedSubscript:@"durationCMTime"];
          CFRelease(v19);
        }

        if ((BYTE12(v90) & 0x1D) == 1)
        {
          double v20 = 0.0;
          if ((BYTE12(v90) & 0x10) == 0)
          {
            __int128 time = v90;
            *(void *)&time_16[0] = v91;
            double v20 = CMTimeGetSeconds((CMTime *)&time);
          }
        }

        else
        {
          double v20 = 0.0;
        }

        v73 = v7;
        v74 = v5;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v20));
        [v3 setObject:v21 forKeyedSubscript:@"duration"];

        -[TVPPlayer rate](self, "rate");
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
        [v3 setObject:v22 forKeyedSubscript:@"rate"];

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer playbackDate](self, "playbackDate"));
        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer playbackDate](self, "playbackDate"));
          [v3 setObject:v24 forKeyedSubscript:@"date"];

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer playbackDate](self, "playbackDate"));
          [v25 timeIntervalSinceReferenceDate];
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
          [v3 setObject:v26 forKeyedSubscript:kFigEndpointPlaybackSessionPlaybackInfoKey_AbsoluteTime];
        }

        v76 = v3;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
        v75 = self;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer cachedSeekableTimeRanges](self, "cachedSeekableTimeRanges"));
        __int128 v86 = 0u;
        __int128 v87 = 0u;
        __int128 v88 = 0u;
        __int128 v89 = 0u;
        id obj = v28;
        id v29 = [v28 countByEnumeratingWithState:&v86 objects:v99 count:16];
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = *(void *)v87;
          do
          {
            for (i = 0LL; i != v30; i = (char *)i + 1)
            {
              if (*(void *)v87 != v31) {
                objc_enumerationMutation(obj);
              }
              v33 = *(void **)(*((void *)&v86 + 1) + 8LL * (void)i);
              if (v33)
              {
                [v33 CMTimeRangeValue];
              }

              else
              {
                memset(time_16, 0, sizeof(time_16));
                __int128 time = 0u;
              }

              v97[0] = @"start";
              *(_OWORD *)&v83.value = time;
              v83.epoch = *(void *)&time_16[0];
              v34 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CMTimeGetSeconds(&v83));
              v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
              v98[0] = v35;
              v97[1] = @"duration";
              CMTime v83 = *(CMTime *)((char *)time_16 + 8);
              v36 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CMTimeGetSeconds(&v83));
              v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
              v98[1] = v37;
              v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v98,  v97,  2LL));
              id v39 = [v38 mutableCopy];

              *(_OWORD *)&v83.value = time;
              v83.epoch = *(void *)&time_16[0];
              CFDictionaryRef v40 = CMTimeCopyAsDictionary(&v83, 0LL);
              if (v40)
              {
                CFDictionaryRef v41 = v40;
                [v39 setObject:v40 forKeyedSubscript:@"startCMTime"];
                CFRelease(v41);
              }

              CMTime v83 = *(CMTime *)((char *)time_16 + 8);
              CFDictionaryRef v42 = CMTimeCopyAsDictionary(&v83, 0LL);
              if (v42)
              {
                CFDictionaryRef v43 = v42;
                [v39 setObject:v42 forKeyedSubscript:@"durationCMTime"];
                CFRelease(v43);
              }

              id v44 = [v39 copy];
              [v27 addObject:v44];
            }

            id v30 = [obj countByEnumeratingWithState:&v86 objects:v99 count:16];
          }

          while (v30);
        }

        [v76 setObject:v27 forKeyedSubscript:@"seekableTimeRanges"];
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));

        v46 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer cachedLoadedTimeRanges](v75, "cachedLoadedTimeRanges"));
        __int128 v81 = 0u;
        __int128 v82 = 0u;
        __int128 v79 = 0u;
        __int128 v80 = 0u;
        id obja = v46;
        id v47 = [obja countByEnumeratingWithState:&v79 objects:v96 count:16];
        if (v47)
        {
          id v48 = v47;
          uint64_t v49 = *(void *)v80;
          do
          {
            for (j = 0LL; j != v48; j = (char *)j + 1)
            {
              if (*(void *)v80 != v49) {
                objc_enumerationMutation(obja);
              }
              v51 = *(void **)(*((void *)&v79 + 1) + 8LL * (void)j);
              if (v51)
              {
                [v51 CMTimeRangeValue];
              }

              else
              {
                memset(time_16, 0, sizeof(time_16));
                __int128 time = 0u;
              }

              v94[0] = @"start";
              *(_OWORD *)&v83.value = time;
              v83.epoch = *(void *)&time_16[0];
              v52 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CMTimeGetSeconds(&v83));
              v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
              v94[1] = @"duration";
              v95[0] = v53;
              CMTime v83 = *(CMTime *)((char *)time_16 + 8);
              v54 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CMTimeGetSeconds(&v83));
              v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
              v95[1] = v55;
              v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v95,  v94,  2LL));
              id v57 = [v56 mutableCopy];

              *(_OWORD *)&v83.value = time;
              v83.epoch = *(void *)&time_16[0];
              CFDictionaryRef v58 = CMTimeCopyAsDictionary(&v83, 0LL);
              if (v58)
              {
                CFDictionaryRef v59 = v58;
                [v57 setObject:v58 forKeyedSubscript:@"startCMTime"];
                CFRelease(v59);
              }

              CMTime v83 = *(CMTime *)((char *)time_16 + 8);
              CFDictionaryRef v60 = CMTimeCopyAsDictionary(&v83, 0LL);
              if (v60)
              {
                CFDictionaryRef v61 = v60;
                [v57 setObject:v60 forKeyedSubscript:@"durationCMTime"];
                CFRelease(v61);
              }

              id v62 = [v57 copy];
              [v45 addObject:v62];
            }

            id v48 = [obja countByEnumeratingWithState:&v79 objects:v96 count:16];
          }

          while (v48);
        }

        v3 = v76;
        [v76 setObject:v45 forKeyedSubscript:@"loadedTimeRanges"];
        v7 = v73;
        else {
          CFBooleanRef v63 = kCFBooleanFalse;
        }
        [v76 setObject:v63 forKeyedSubscript:@"playbackLikelyToKeepUp"];
        else {
          CFBooleanRef v64 = kCFBooleanFalse;
        }
        [v76 setObject:v64 forKeyedSubscript:@"playbackBufferFull"];
        else {
          CFBooleanRef v65 = kCFBooleanFalse;
        }
        [v76 setObject:v65 forKeyedSubscript:@"playbackBufferEmpty"];
        v66 = (void *)objc_claimAutoreleasedReturnValue([v73 playabilityMetrics]);
        v67 = (void *)objc_claimAutoreleasedReturnValue( [v66 objectForKeyedSubscript:AVPlayerItemPlayabilityMetricsEstimatedTimeToLikelyToKeepUpKey]);
        if (v67) {
          [v76 setObject:v67 forKeyedSubscript:@"playbackLikelyToKeepUpTime"];
        }
        v68 = (void *)objc_claimAutoreleasedReturnValue([v73 currentEstimatedDate]);
        if (v68) {
          [v76 setObject:v68 forKeyedSubscript:@"estimatedDate"];
        }

        v5 = v74;
        self = v75;
      }

      else if (v8 == (id)2)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue([v7 error]);
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities errorToDictionary:]( &OBJC_CLASS___TVAirPlayUtilities,  "errorToDictionary:",  v15));
          [v3 addEntriesFromDictionary:v16];
        }
      }

      v69 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self, "currentMediaItem"));
      v70 = (void *)objc_claimAutoreleasedReturnValue([v69 mediaItemMetadataForProperty:@"TVAirPlayMediaItemMetadataUUID"]);

      if (v70) {
        [v3 setObject:v70 forKeyedSubscript:@"uuid"];
      }
      id v71 = v3;
    }

    else
    {
      id v14 = v3;
    }
  }

  else
  {
    id v13 = v3;
  }

  return v3;
}

- (id)accessLogArray
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer accessLog](self, "accessLog"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _accessLogArray]);

  return v3;
}

- (id)errorLogArray
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer errorLog](self, "errorLog"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 _errorLogArray]);

  return v3;
}

- (id)timedMetadata
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentItem]);

  if ([v3 status] == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 timedMetadata]);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[TVAirPlayUtilities timedMetadataFromAVTimedMetadata:]( &OBJC_CLASS___TVAirPlayUtilities,  "timedMetadataFromAVTimedMetadata:",  v4));
  }

  else
  {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)trackEnabled:(int64_t)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentItem]);

  if ([v5 status] == (id)1)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue([v5 tracks]);
    id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          CFDictionaryRef v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetTrack", (void)v16));
          uint64_t v13 = (int)[v12 trackID];

          if (v13 == a3)
          {
            unsigned __int8 v14 = [v11 isEnabled];
            goto LABEL_13;
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    unsigned __int8 v14 = 0;
LABEL_13:
  }

  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (void)setTrackEnabled:(BOOL)a3 trackID:(int64_t)a4
{
  BOOL v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentItem]);

  if ([v7 status] == (id)1)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 tracks]);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetTrack]);
          uint64_t v15 = (int)[v14 trackID];

          if (v15 == a4) {
            [v13 setEnabled:v5];
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }

      while (v10);
    }
  }
}

- (id)selectedMediaArray
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentItem]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 asset]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 availableMediaCharacteristicsWithMediaSelectionOptions]);
  id v8 = dispatch_group_create();
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v12);
        dispatch_group_enter(v8);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_10000D4A0;
        v16[3] = &unk_100030D48;
        id v17 = v5;
        id v18 = v3;
        __int128 v19 = v8;
        [v6 loadMediaSelectionGroupForMediaCharacteristic:v13 completionHandler:v16];

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v10);
  }

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  return v3;
}

- (void)setSelectedMediaArray:(id)a3
{
}

- (void)setPlayerPosition:(double)a3
{
  double v5 = fmax(a3, 0.0);
  -[TVPPlayer duration](self, "duration");
  if (v5 > v6)
  {
    -[TVPPlayer duration](self, "duration");
    if (v7 > 0.0)
    {
      -[TVPPlayer duration](self, "duration");
      double v5 = v8;
    }
  }

  -[TVPPlayer setElapsedTime:](self, "setElapsedTime:", v5);
  id v9 = sub_1000041E0();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[TVPPlayer duration](self, "duration");
    int v12 = 134349568;
    double v13 = v5;
    __int16 v14 = 2050;
    uint64_t v15 = v11;
    __int16 v16 = 2050;
    double v17 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "AirPlay set position to %{public}f of %{public}f (%{public}f)",  (uint8_t *)&v12,  0x20u);
  }
}

- (void)setPlayerRate:(float)a3
{
  double v4 = a3;
  if (a3 == 0.0)
  {
    -[TVPPlayer pause](self, "pause");
  }

  else if (a3 >= 0.5 && a3 <= 2.0)
  {
    -[TVPPlayer setRateUsedForPlayback:](self, "setRateUsedForPlayback:", a3);
    -[TVPPlayer play](self, "play");
  }

  else
  {
    -[TVPPlayer scanWithRate:](self, "scanWithRate:", a3);
  }

  id v6 = sub_1000041E0();
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134349056;
    double v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "AirPlay set rate to %{public}f",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)setForwardPlaybackEndTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentItem]);

  if (v6 && [v6 status] == (id)1)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = v11;
    [v6 setForwardPlaybackEndTime:&v10];
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self, "currentMediaItem"));
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  int v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CMTimeGetSeconds((CMTime *)&v10));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 setMediaItemMetadata:v9 forProperty:TVPMediaItemMetadataForwardPlaybackEndTime];
}

- (void)setReversePlaybackEndTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentItem]);

  if (v6 && [v6 status] == (id)1)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = v11;
    [v6 setReversePlaybackEndTime:&v10];
  }

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self, "currentMediaItem"));
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  int v8 = +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", CMTimeGetSeconds((CMTime *)&v10));
  double v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  [v7 setMediaItemMetadata:v9 forProperty:TVPMediaItemMetadataReversePlaybackEndTime];
}

- (void)setAudioSessionID:(unsigned int)a3
{
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession retrieveSessionWithID:](&OBJC_CLASS___AVAudioSession, "retrieveSessionWithID:"));
  if (v5)
  {
    id v6 = sub_1000041E0();
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67240448;
      v9[1] = a3;
      __int16 v10 = 1026;
      unsigned int v11 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Set audio session: %{public}u (%{public}x)",  (uint8_t *)v9,  0xEu);
    }

    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
    [v8 setAudioSession:v5];
  }
}

- (id)mediaItemForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer playlist](self, "playlist"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 trackList]);

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          double v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "mediaItemMetadataForProperty:",  @"TVAirPlayMediaItemMetadataUUID",  (void)v17));
          unsigned int v14 = [v13 isEqual:v4];

          if (v14)
          {
            id v15 = v12;
            goto LABEL_12;
          }
        }

        id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v15 = 0LL;
LABEL_12:
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (void)addMediaDataCollector:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentItem]);

  if (v5) {
    [v5 addMediaDataCollector:v7];
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self, "currentMediaItem"));
  [v6 setMediaItemMetadata:v7 forProperty:TVPMediaItemMetadataDateRangeCollector];
}

- (void)removeMediaDataCollector:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer currentMediaItem](self, "currentMediaItem"));
  [v4 setMediaItemMetadata:0 forProperty:TVPMediaItemMetadataDateRangeCollector];
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPlayer AVQueuePlayer](self, "AVQueuePlayer"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 currentItem]);

  if (v6) {
    [v6 removeMediaDataCollector:v7];
  }
}

@end